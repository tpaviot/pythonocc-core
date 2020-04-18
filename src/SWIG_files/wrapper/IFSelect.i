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
%define IFSELECTDOCSTRING
"IFSelect module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_ifselect.html"
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
%include ../common/Operators.i
%include ../common/OccHandle.i


%{
#include<IFSelect_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<Interface_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
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
%import Interface.i
%import TColStd.i
%import TCollection.i
%import Message.i
%import MoniTool.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
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

enum IFSelect_EditValue {
	IFSelect_Optional = 0,
	IFSelect_Editable = 1,
	IFSelect_EditProtected = 2,
	IFSelect_EditComputed = 3,
	IFSelect_EditRead = 4,
	IFSelect_EditDynamic = 5,
};

enum IFSelect_ReturnStatus {
	IFSelect_RetVoid = 0,
	IFSelect_RetDone = 1,
	IFSelect_RetError = 2,
	IFSelect_RetFail = 3,
	IFSelect_RetStop = 4,
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

/* end public enums declaration */

/* python proy classes for enums */
%pythoncode {

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
%template(IFSelect_SequenceOfGeneralModifier) NCollection_Sequence<opencascade::handle<IFSelect_GeneralModifier>>;
%template(IFSelect_SequenceOfInterfaceModel) NCollection_Sequence<opencascade::handle<Interface_InterfaceModel>>;
%template(IFSelect_TSeqOfDispatch) NCollection_Sequence<opencascade::handle<IFSelect_Dispatch>>;
%template(IFSelect_TSeqOfSelection) NCollection_Sequence<opencascade::handle<IFSelect_Selection>>;
/* end templates declaration */

/* typedefs */
typedef IFSelect_ReturnStatus ( * IFSelect_ActFunc ) ( const opencascade::handle<IFSelect_SessionPilot>& );
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
		/****************** RestoreSession ******************/
		%feature("compactdefaultargs") RestoreSession;
		%feature("autodoc", "Restore the state of a worksession from ifselect, by using a sessionfile from ifselect. returns true if done, false in case of error on writing. <file> gives the name of the file to be used (this avoids to export the class sessionfile).

Parameters
----------
WS: IFSelect_WorkSession
file: char *

Returns
-------
bool
") RestoreSession;
		static Standard_Boolean RestoreSession(const opencascade::handle<IFSelect_WorkSession> & WS, const char * file);

		/****************** SaveSession ******************/
		%feature("compactdefaultargs") SaveSession;
		%feature("autodoc", "Saves the state of a worksession from ifselect, by using a sessionfile from ifselect. returns true if done, false in case of error on writing. <file> gives the name of the file to be produced (this avoids to export the class sessionfile).

Parameters
----------
WS: IFSelect_WorkSession
file: char *

Returns
-------
bool
") SaveSession;
		static Standard_Boolean SaveSession(const opencascade::handle<IFSelect_WorkSession> & WS, const char * file);

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
		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Allows a self-definition by an activator of the commands it processes, call the class method adding (mode 0).

Parameters
----------
number: int
command: char *

Returns
-------
None
") Add;
		void Add(const Standard_Integer number, const char * command);

		/****************** AddSet ******************/
		%feature("compactdefaultargs") AddSet;
		%feature("autodoc", "Same as add but specifies that this command is candidate for xset (creation of items, xset : named items; mode 1).

Parameters
----------
number: int
command: char *

Returns
-------
None
") AddSet;
		void AddSet(const Standard_Integer number, const char * command);

		/****************** Adding ******************/
		%feature("compactdefaultargs") Adding;
		%feature("autodoc", "Records, in a dictionary available for all the activators, the command title an activator can process, attached with its number, proper for this activator <mode> allows to distinguish various execution modes 0: default mode; 1 : for xset.

Parameters
----------
actor: IFSelect_Activator
number: int
command: char *
mode: int

Returns
-------
None
") Adding;
		static void Adding(const opencascade::handle<IFSelect_Activator> & actor, const Standard_Integer number, const char * command, const Standard_Integer mode);

		/****************** Commands ******************/
		%feature("compactdefaultargs") Commands;
		%feature("autodoc", "Returns, for a root of command title, the list of possible commands. <mode> : -1 (d) for all commands if <commands> is empty -1 + command : about a group , >= 0 see adding by default, it returns the whole list of known commands.

Parameters
----------
mode: int,optional
	default value is -1
command: char *,optional
	default value is ""

Returns
-------
opencascade::handle<TColStd_HSequenceOfAsciiString>
") Commands;
		static opencascade::handle<TColStd_HSequenceOfAsciiString> Commands(const Standard_Integer mode = -1, const char * command = "");

		/****************** Do ******************/
		%feature("compactdefaultargs") Do;
		%feature("autodoc", "Tries to execute a command line. <number> is the number of the command for this activator. it must forecast to record the result of the execution, for need of undo-redo must returns : 0 for a void command (not to be recorded), 1 if execution ok, -1 if command incorrect, -2 if error on execution.

Parameters
----------
number: int
pilot: IFSelect_SessionPilot

Returns
-------
IFSelect_ReturnStatus
") Do;
		virtual IFSelect_ReturnStatus Do(const Standard_Integer number, const opencascade::handle<IFSelect_SessionPilot> & pilot);

		/****************** File ******************/
		%feature("compactdefaultargs") File;
		%feature("autodoc", "No available documentation.

Returns
-------
char *
") File;
		const char * File();

		/****************** Group ******************/
		%feature("compactdefaultargs") Group;
		%feature("autodoc", "No available documentation.

Returns
-------
char *
") Group;
		const char * Group();

		/****************** Help ******************/
		%feature("compactdefaultargs") Help;
		%feature("autodoc", "Sends a short help message for a given command identified by it number for this activator (must take one line max).

Parameters
----------
number: int

Returns
-------
char *
") Help;
		virtual const char * Help(const Standard_Integer number);

		/****************** Mode ******************/
		%feature("compactdefaultargs") Mode;
		%feature("autodoc", "Returns mode recorded for a command. -1 if not found.

Parameters
----------
command: char *

Returns
-------
int
") Mode;
		static Standard_Integer Mode(const char * command);

		/****************** Remove ******************/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "Removes a command, if it is recorded (else, does nothing).

Parameters
----------
command: char *

Returns
-------
None
") Remove;
		static void Remove(const char * command);

		/****************** Select ******************/
		%feature("compactdefaultargs") Select;
		%feature("autodoc", "Selects, for a command given by its title, an actor with its command number. returns true if found, false else.

Parameters
----------
command: char *
actor: IFSelect_Activator

Returns
-------
number: int
") Select;
		static Standard_Boolean Select(const char * command, Standard_Integer &OutValue, opencascade::handle<IFSelect_Activator> & actor);

		/****************** SetForGroup ******************/
		%feature("compactdefaultargs") SetForGroup;
		%feature("autodoc", "Group and setgroup define a 'group of commands' which correspond to an activator. default is 'xstep' also a file may be attached.

Parameters
----------
group: char *
file: char *,optional
	default value is ""

Returns
-------
None
") SetForGroup;
		void SetForGroup(const char * group, const char * file = "");

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
		/****************** IFSelect_AppliedModifiers ******************/
		%feature("compactdefaultargs") IFSelect_AppliedModifiers;
		%feature("autodoc", "Creates an appliedmodifiers, ready to record up to <nbmax> modifiers, on a model of <nbent> entities.

Parameters
----------
nbmax: int
nbent: int

Returns
-------
None
") IFSelect_AppliedModifiers;
		 IFSelect_AppliedModifiers(const Standard_Integer nbmax, const Standard_Integer nbent);

		/****************** AddModif ******************/
		%feature("compactdefaultargs") AddModif;
		%feature("autodoc", "Records a modifier. by default, it is to apply on all a produced file. further calls to addnum will restrict this. returns true if done, false if too many modifiers are already recorded.

Parameters
----------
modif: IFSelect_GeneralModifier

Returns
-------
bool
") AddModif;
		Standard_Boolean AddModif(const opencascade::handle<IFSelect_GeneralModifier> & modif);

		/****************** AddNum ******************/
		%feature("compactdefaultargs") AddNum;
		%feature("autodoc", "Adds a number of entity of the output file to be applied on. if a sequence of addnum is called after addmodif, this modifier will be applied on the list of designated entities. else, it will be applied on all the file returns true if done, false if no modifier has yet been added.

Parameters
----------
nument: int

Returns
-------
bool
") AddNum;
		Standard_Boolean AddNum(const Standard_Integer nument);

		/****************** Count ******************/
		%feature("compactdefaultargs") Count;
		%feature("autodoc", "Returns the count of recorded modifiers.

Returns
-------
int
") Count;
		Standard_Integer Count();

		/****************** IsForAll ******************/
		%feature("compactdefaultargs") IsForAll;
		%feature("autodoc", "Returns true if the applied modifier queried by last call to item is to be applied to all the produced file. else, <entcount> returned by item gives the count of entity numbers, each one is queried by itemnum.

Returns
-------
bool
") IsForAll;
		Standard_Boolean IsForAll();

		/****************** Item ******************/
		%feature("compactdefaultargs") Item;
		%feature("autodoc", "Returns the description for applied modifier n0 <num> : the modifier itself, and the count of entities to be applied on. if no specific list of number has been defined, returns the total count of entities of the file if this count is zero, then the modifier applies to all the file (see below). else, the numbers are then queried by calls to itemnum between 1 and <entcount> returns true if ok, false if <num> is out of range.

Parameters
----------
num: int
modif: IFSelect_GeneralModifier

Returns
-------
entcount: int
") Item;
		Standard_Boolean Item(const Standard_Integer num, opencascade::handle<IFSelect_GeneralModifier> & modif, Standard_Integer &OutValue);

		/****************** ItemList ******************/
		%feature("compactdefaultargs") ItemList;
		%feature("autodoc", "Returns the list of entities to be applied on (see item) as a hsequence (isforall produces the complete list of all the entity numbers of the file.

Returns
-------
opencascade::handle<TColStd_HSequenceOfInteger>
") ItemList;
		opencascade::handle<TColStd_HSequenceOfInteger> ItemList();

		/****************** ItemNum ******************/
		%feature("compactdefaultargs") ItemNum;
		%feature("autodoc", "Returns a numero of entity to be applied on, given its rank in the list. if no list is defined (i.e. for all the file), returns <nument> itself, to give all the entities of the file returns 0 if <nument> out of range.

Parameters
----------
nument: int

Returns
-------
int
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
		/****************** IFSelect_ContextModif ******************/
		%feature("compactdefaultargs") IFSelect_ContextModif;
		%feature("autodoc", "Prepares a contextmodif with these informations : - the graph established from original model (target passed directly to modifier) - the copytool which detains the copycontrol, which maps starting (in original) and result (in target) entities - an optional file name (for file output) //! such a contextmodif is considered to be applied on all transferred entities (no filter active).

Parameters
----------
graph: Interface_Graph
TC: Interface_CopyTool
filename: char *,optional
	default value is ""

Returns
-------
None
") IFSelect_ContextModif;
		 IFSelect_ContextModif(const Interface_Graph & graph, const Interface_CopyTool & TC, const char * filename = "");

		/****************** IFSelect_ContextModif ******************/
		%feature("compactdefaultargs") IFSelect_ContextModif;
		%feature("autodoc", "Prepares a contextmodif with these informations : - the graph established from original model (target passed directly to modifier) - an optional file name (for file output) here, no copycontrol, hence all entities are considered equal as starting and result //! such a contextmodif is considered to be applied on all transferred entities (no filter active).

Parameters
----------
graph: Interface_Graph
filename: char *,optional
	default value is ""

Returns
-------
None
") IFSelect_ContextModif;
		 IFSelect_ContextModif(const Interface_Graph & graph, const char * filename = "");

		/****************** AddCheck ******************/
		%feature("compactdefaultargs") AddCheck;
		%feature("autodoc", "Adds a check to the checklist. if it is empty, nothing is done if it concerns an entity from the original model (by setentity) to which another check is attached, it is merged to it. else, it is added or merged as to globalcheck.

Parameters
----------
check: Interface_Check

Returns
-------
None
") AddCheck;
		void AddCheck(const opencascade::handle<Interface_Check> & check);

		/****************** AddFail ******************/
		%feature("compactdefaultargs") AddFail;
		%feature("autodoc", "Adds a fail message for an entity from the original model if <start> is not an entity from the original model (e.g. the model itself) this message is added to global check.

Parameters
----------
start: Standard_Transient
mess: char *
orig: char *,optional
	default value is ""

Returns
-------
None
") AddFail;
		void AddFail(const opencascade::handle<Standard_Transient> & start, const char * mess, const char * orig = "");

		/****************** AddWarning ******************/
		%feature("compactdefaultargs") AddWarning;
		%feature("autodoc", "Adds a warning message for an entity from the original model if <start> is not an entity from the original model (e.g. the model itself) this message is added to global check.

Parameters
----------
start: Standard_Transient
mess: char *
orig: char *,optional
	default value is ""

Returns
-------
None
") AddWarning;
		void AddWarning(const opencascade::handle<Standard_Transient> & start, const char * mess, const char * orig = "");

		/****************** CCheck ******************/
		%feature("compactdefaultargs") CCheck;
		%feature("autodoc", "Returns a check given an entity number (in the original model) by default a global check. creates it the first time. it can then be acknowledged on the spot, in condition that the caller works by reference ('interface_check& check = ...').

Parameters
----------
num: int,optional
	default value is 0

Returns
-------
opencascade::handle<Interface_Check>
") CCheck;
		opencascade::handle<Interface_Check> CCheck(const Standard_Integer num = 0);

		/****************** CCheck ******************/
		%feature("compactdefaultargs") CCheck;
		%feature("autodoc", "Returns a check attached to an entity from the original model it can then be acknowledged on the spot, in condition that the caller works by reference ('interface_check& check = ...').

Parameters
----------
start: Standard_Transient

Returns
-------
opencascade::handle<Interface_Check>
") CCheck;
		opencascade::handle<Interface_Check> CCheck(const opencascade::handle<Standard_Transient> & start);

		/****************** CheckList ******************/
		%feature("compactdefaultargs") CheckList;
		%feature("autodoc", "Returns the complete checklist.

Returns
-------
Interface_CheckIterator
") CheckList;
		Interface_CheckIterator CheckList();

		/****************** Control ******************/
		%feature("compactdefaultargs") Control;
		%feature("autodoc", "Returns the map for a direct use, if required.

Returns
-------
opencascade::handle<Interface_CopyControl>
") Control;
		opencascade::handle<Interface_CopyControl> Control();

		/****************** FileName ******************/
		%feature("compactdefaultargs") FileName;
		%feature("autodoc", "Returns file name (can be empty).

Returns
-------
char *
") FileName;
		const char * FileName();

		/****************** HasFileName ******************/
		%feature("compactdefaultargs") HasFileName;
		%feature("autodoc", "Returns true if a non empty file name has been defined.

Returns
-------
bool
") HasFileName;
		Standard_Boolean HasFileName();

		/****************** IsForAll ******************/
		%feature("compactdefaultargs") IsForAll;
		%feature("autodoc", "Returns true if no filter is defined : a modifier has to work on all entities of the resulting (target) model.

Returns
-------
bool
") IsForAll;
		Standard_Boolean IsForAll();

		/****************** IsForNone ******************/
		%feature("compactdefaultargs") IsForNone;
		%feature("autodoc", "Returns true if select has determined that a modifier may not be run (filter defined and empty).

Returns
-------
bool
") IsForNone;
		Standard_Boolean IsForNone();

		/****************** IsSelected ******************/
		%feature("compactdefaultargs") IsSelected;
		%feature("autodoc", "Returns true if a starting item has been transferred and selected.

Parameters
----------
ent: Standard_Transient

Returns
-------
bool
") IsSelected;
		Standard_Boolean IsSelected(const opencascade::handle<Standard_Transient> & ent);

		/****************** IsTransferred ******************/
		%feature("compactdefaultargs") IsTransferred;
		%feature("autodoc", "Returns true if a starting item has been transferred.

Parameters
----------
ent: Standard_Transient

Returns
-------
bool
") IsTransferred;
		Standard_Boolean IsTransferred(const opencascade::handle<Standard_Transient> & ent);

		/****************** More ******************/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Returns true until the iteration has finished.

Returns
-------
bool
") More;
		Standard_Boolean More();

		/****************** Next ******************/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Advances the iteration.

Returns
-------
None
") Next;
		void Next();

		/****************** OriginalGraph ******************/
		%feature("compactdefaultargs") OriginalGraph;
		%feature("autodoc", "Returns the original graph (compared to originalmodel, it gives more query capabilitites).

Returns
-------
Interface_Graph
") OriginalGraph;
		const Interface_Graph & OriginalGraph();

		/****************** OriginalModel ******************/
		%feature("compactdefaultargs") OriginalModel;
		%feature("autodoc", "Returns the original model.

Returns
-------
opencascade::handle<Interface_InterfaceModel>
") OriginalModel;
		opencascade::handle<Interface_InterfaceModel> OriginalModel();

		/****************** Protocol ******************/
		%feature("compactdefaultargs") Protocol;
		%feature("autodoc", "Returns the protocol (null if not set).

Returns
-------
opencascade::handle<Interface_Protocol>
") Protocol;
		opencascade::handle<Interface_Protocol> Protocol();

		/****************** Select ******************/
		%feature("compactdefaultargs") Select;
		%feature("autodoc", "This method requires contextmodif to be applied with a filter. if a modelmodifier is defined with a selection criterium, the result of this selection is used as a filter : - if none of its items has been transferred, the modification does not apply at all - else, the modifier can query for what entities were selected and what are their results - if this method is not called before working, the modifier has to work on the whole model.

Parameters
----------
list: Interface_EntityIterator

Returns
-------
None
") Select;
		void Select(Interface_EntityIterator & list);

		/****************** SelectedCount ******************/
		%feature("compactdefaultargs") SelectedCount;
		%feature("autodoc", "Returns the count of selected and transferred items.

Returns
-------
int
") SelectedCount;
		Standard_Integer SelectedCount();

		/****************** SelectedOriginal ******************/
		%feature("compactdefaultargs") SelectedOriginal;
		%feature("autodoc", "Returns the list of original selected items. see also the iteration.

Returns
-------
Interface_EntityIterator
") SelectedOriginal;
		Interface_EntityIterator SelectedOriginal();

		/****************** SelectedResult ******************/
		%feature("compactdefaultargs") SelectedResult;
		%feature("autodoc", "Returns the list of resulting counterparts of selected items. see also the iteration.

Returns
-------
Interface_EntityIterator
") SelectedResult;
		Interface_EntityIterator SelectedResult();

		/****************** SetProtocol ******************/
		%feature("compactdefaultargs") SetProtocol;
		%feature("autodoc", "Allows to transmit a protocol as part of a contextmodif.

Parameters
----------
proto: Interface_Protocol

Returns
-------
None
") SetProtocol;
		void SetProtocol(const opencascade::handle<Interface_Protocol> & proto);

		/****************** Start ******************/
		%feature("compactdefaultargs") Start;
		%feature("autodoc", "Starts an iteration on selected items. it takes into account isforall/isfornone, by really iterating on all selected items.

Returns
-------
None
") Start;
		void Start();

		/****************** Trace ******************/
		%feature("compactdefaultargs") Trace;
		%feature("autodoc", "Traces the modification of the current entity (see above, valueoriginal and valueresult) for default trace level >= 2. to be called on each indivudual entity really modified <mess> is an optionnal additional message.

Parameters
----------
mess: char *,optional
	default value is ""

Returns
-------
None
") Trace;
		void Trace(const char * mess = "");

		/****************** TraceModifier ******************/
		%feature("compactdefaultargs") TraceModifier;
		%feature("autodoc", "Traces the application of a modifier. works with default trace file and level. fills the trace if default trace level is at least 1. traces the modifier (its label) and its selection if there is one (its label). to be called after select (because status isforall is printed) worths to trace a global modification. see also trace below.

Parameters
----------
modif: IFSelect_GeneralModifier

Returns
-------
None
") TraceModifier;
		void TraceModifier(const opencascade::handle<IFSelect_GeneralModifier> & modif);

		/****************** ValueOriginal ******************/
		%feature("compactdefaultargs") ValueOriginal;
		%feature("autodoc", "Returns the current selected item in the original model.

Returns
-------
opencascade::handle<Standard_Transient>
") ValueOriginal;
		opencascade::handle<Standard_Transient> ValueOriginal();

		/****************** ValueResult ******************/
		%feature("compactdefaultargs") ValueResult;
		%feature("autodoc", "Returns the result counterpart of current selected item (in the target model).

Returns
-------
opencascade::handle<Standard_Transient>
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
		/****************** IFSelect_ContextWrite ******************/
		%feature("compactdefaultargs") IFSelect_ContextWrite;
		%feature("autodoc", "Prepares a contextwrite with these informations : - the model which is to be written - the protocol to be used - the filename - an object appliedmodifiers to work. it gives a list of filemodifiers to be ran, and for each one it can give a restricted list of entities (in the model), else all the model is considered.

Parameters
----------
model: Interface_InterfaceModel
proto: Interface_Protocol
applieds: IFSelect_AppliedModifiers
filename: char *

Returns
-------
None
") IFSelect_ContextWrite;
		 IFSelect_ContextWrite(const opencascade::handle<Interface_InterfaceModel> & model, const opencascade::handle<Interface_Protocol> & proto, const opencascade::handle<IFSelect_AppliedModifiers> & applieds, const char * filename);

		/****************** IFSelect_ContextWrite ******************/
		%feature("compactdefaultargs") IFSelect_ContextWrite;
		%feature("autodoc", "Same as above but with an already computed graph.

Parameters
----------
hgraph: Interface_HGraph
proto: Interface_Protocol
applieds: IFSelect_AppliedModifiers
filename: char *

Returns
-------
None
") IFSelect_ContextWrite;
		 IFSelect_ContextWrite(const opencascade::handle<Interface_HGraph> & hgraph, const opencascade::handle<Interface_Protocol> & proto, const opencascade::handle<IFSelect_AppliedModifiers> & applieds, const char * filename);

		/****************** AddCheck ******************/
		%feature("compactdefaultargs") AddCheck;
		%feature("autodoc", "Adds a check to the checklist. if it is empty, nothing is done if it concerns an entity from the model (by setentity) to which another check is attached, it is merged to it. else, it is added or merged as to globalcheck.

Parameters
----------
check: Interface_Check

Returns
-------
None
") AddCheck;
		void AddCheck(const opencascade::handle<Interface_Check> & check);

		/****************** AddFail ******************/
		%feature("compactdefaultargs") AddFail;
		%feature("autodoc", "Adds a fail message for an entity from the model if <start> is not an entity from the model (e.g. the model itself) this message is added to global check.

Parameters
----------
start: Standard_Transient
mess: char *
orig: char *,optional
	default value is ""

Returns
-------
None
") AddFail;
		void AddFail(const opencascade::handle<Standard_Transient> & start, const char * mess, const char * orig = "");

		/****************** AddWarning ******************/
		%feature("compactdefaultargs") AddWarning;
		%feature("autodoc", "Adds a warning message for an entity from the model if <start> is not an entity from the model (e.g. the model itself) this message is added to global check.

Parameters
----------
start: Standard_Transient
mess: char *
orig: char *,optional
	default value is ""

Returns
-------
None
") AddWarning;
		void AddWarning(const opencascade::handle<Standard_Transient> & start, const char * mess, const char * orig = "");

		/****************** AppliedModifiers ******************/
		%feature("compactdefaultargs") AppliedModifiers;
		%feature("autodoc", "Returns the object appliedmodifiers.

Returns
-------
opencascade::handle<IFSelect_AppliedModifiers>
") AppliedModifiers;
		opencascade::handle<IFSelect_AppliedModifiers> AppliedModifiers();

		/****************** CCheck ******************/
		%feature("compactdefaultargs") CCheck;
		%feature("autodoc", "Returns a check given an entity number (in the model) by default a global check. creates it the first time. it can then be acknowledged on the spot, in condition that the caller works by reference ('interface_check& check = ...').

Parameters
----------
num: int,optional
	default value is 0

Returns
-------
opencascade::handle<Interface_Check>
") CCheck;
		opencascade::handle<Interface_Check> CCheck(const Standard_Integer num = 0);

		/****************** CCheck ******************/
		%feature("compactdefaultargs") CCheck;
		%feature("autodoc", "Returns a check attached to an entity from the model it can then be acknowledged on the spot, in condition that the caller works by reference ('interface_check& check = ...').

Parameters
----------
start: Standard_Transient

Returns
-------
opencascade::handle<Interface_Check>
") CCheck;
		opencascade::handle<Interface_Check> CCheck(const opencascade::handle<Standard_Transient> & start);

		/****************** CheckList ******************/
		%feature("compactdefaultargs") CheckList;
		%feature("autodoc", "Returns the complete checklist.

Returns
-------
Interface_CheckIterator
") CheckList;
		Interface_CheckIterator CheckList();

		/****************** FileModifier ******************/
		%feature("compactdefaultargs") FileModifier;
		%feature("autodoc", "Returns the currently active file modifier. cast to be done null if not properly set : must be test isnull after casting.

Returns
-------
opencascade::handle<IFSelect_GeneralModifier>
") FileModifier;
		opencascade::handle<IFSelect_GeneralModifier> FileModifier();

		/****************** FileName ******************/
		%feature("compactdefaultargs") FileName;
		%feature("autodoc", "Returns the file name.

Returns
-------
char *
") FileName;
		const char * FileName();

		/****************** Graph ******************/
		%feature("compactdefaultargs") Graph;
		%feature("autodoc", "Returns the graph, either given when created, else created the first time it is queried.

Returns
-------
Interface_Graph
") Graph;
		const Interface_Graph & Graph();

		/****************** IsForAll ******************/
		%feature("compactdefaultargs") IsForAll;
		%feature("autodoc", "Returns true if the current modifier is to be applied to the whole model. else, a restricted list of selected entities is defined, it can be exploited by the file modifier.

Returns
-------
bool
") IsForAll;
		Standard_Boolean IsForAll();

		/****************** IsForNone ******************/
		%feature("compactdefaultargs") IsForNone;
		%feature("autodoc", "Returns true if no modifier is currently set.

Returns
-------
bool
") IsForNone;
		Standard_Boolean IsForNone();

		/****************** Model ******************/
		%feature("compactdefaultargs") Model;
		%feature("autodoc", "Returns the model.

Returns
-------
opencascade::handle<Interface_InterfaceModel>
") Model;
		opencascade::handle<Interface_InterfaceModel> Model();

		/****************** More ******************/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Returns true until the iteration has finished.

Returns
-------
bool
") More;
		Standard_Boolean More();

		/****************** NbEntities ******************/
		%feature("compactdefaultargs") NbEntities;
		%feature("autodoc", "Returns the total count of selected entities.

Returns
-------
int
") NbEntities;
		Standard_Integer NbEntities();

		/****************** NbModifiers ******************/
		%feature("compactdefaultargs") NbModifiers;
		%feature("autodoc", "Returns the count of recorded file modifiers.

Returns
-------
int
") NbModifiers;
		Standard_Integer NbModifiers();

		/****************** Next ******************/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Advances the iteration.

Returns
-------
None
") Next;
		void Next();

		/****************** Protocol ******************/
		%feature("compactdefaultargs") Protocol;
		%feature("autodoc", "Returns the protocol;.

Returns
-------
opencascade::handle<Interface_Protocol>
") Protocol;
		opencascade::handle<Interface_Protocol> Protocol();

		/****************** SetModifier ******************/
		%feature("compactdefaultargs") SetModifier;
		%feature("autodoc", "Sets active the file modifier n0 <numod> then, it prepares the list of entities to consider, if any returns false if <numod> out of range.

Parameters
----------
numod: int

Returns
-------
bool
") SetModifier;
		Standard_Boolean SetModifier(const Standard_Integer numod);

		/****************** Start ******************/
		%feature("compactdefaultargs") Start;
		%feature("autodoc", "Starts an iteration on selected items. it takes into account isforall/isfornone, by really iterating on all selected items.

Returns
-------
None
") Start;
		void Start();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the current selected entity in the model.

Returns
-------
opencascade::handle<Standard_Transient>
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
		/****************** CanHaveRemainder ******************/
		%feature("compactdefaultargs") CanHaveRemainder;
		%feature("autodoc", "Returns true if a dispatch can have a remainder, i.e. if its criterium can let entities apart. it is a potential answer, remainder can be empty at run-time even if answer is true. (to attach a remainderfromdispatch selection is not allowed if answer is true). default answer given here is false (can be redefined).

Returns
-------
bool
") CanHaveRemainder;
		virtual Standard_Boolean CanHaveRemainder();

		/****************** FinalSelection ******************/
		%feature("compactdefaultargs") FinalSelection;
		%feature("autodoc", "Returns the final selection of a dispatch we 'd like : c++ : return const &.

Returns
-------
opencascade::handle<IFSelect_Selection>
") FinalSelection;
		opencascade::handle<IFSelect_Selection> FinalSelection();

		/****************** GetEntities ******************/
		%feature("compactdefaultargs") GetEntities;
		%feature("autodoc", "Gets unique root entities from the final selection, given an input graph this the starting step for an evaluation (packets - remainder).

Parameters
----------
G: Interface_Graph

Returns
-------
Interface_EntityIterator
") GetEntities;
		Interface_EntityIterator GetEntities(const Interface_Graph & G);

		/****************** HasRootName ******************/
		%feature("compactdefaultargs") HasRootName;
		%feature("autodoc", "Returns true if a specific root name has been set (else, the default root name has to be used).

Returns
-------
bool
") HasRootName;
		Standard_Boolean HasRootName();

		/****************** Label ******************/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "Returns a text which defines the way a dispatch produces packets (which will become files) from its input.

Returns
-------
TCollection_AsciiString
") Label;
		virtual TCollection_AsciiString Label();

		/****************** LimitedMax ******************/
		%feature("compactdefaultargs") LimitedMax;
		%feature("autodoc", "Returns true if a dispatch generates a count of packets always less than or equal to a maximum value : it can be computed from the total count of entities to be dispatched : <nbent>. if answer is false, no limited maximum is expected for account if answer is true, expected maximum is given in argument <max> default answer given here is false (can be redefined).

Parameters
----------
nbent: int

Returns
-------
max: int
") LimitedMax;
		virtual Standard_Boolean LimitedMax(const Standard_Integer nbent, Standard_Integer &OutValue);

		/****************** Packeted ******************/
		%feature("compactdefaultargs") Packeted;
		%feature("autodoc", "Returns the list of all input entities (see getentities) which are put in a packet. that is, entities listed in getentities but not in remainder (see below). input is given as a graph.

Parameters
----------
G: Interface_Graph

Returns
-------
Interface_EntityIterator
") Packeted;
		Interface_EntityIterator Packeted(const Interface_Graph & G);

		/****************** Packets ******************/
		%feature("compactdefaultargs") Packets;
		%feature("autodoc", "Returns the list of produced packets into argument <pack>. each packet corresponds to a part, the entities listed are the roots given by the selection. input is given as a graph. thus, to create a file from a packet, it suffices to take the entities listed in a part of packets (that is, a packet) without worrying about shared entities this method can raise an exception if data are not coherent.

Parameters
----------
G: Interface_Graph
packs: IFGraph_SubPartsIterator

Returns
-------
None
") Packets;
		virtual void Packets(const Interface_Graph & G, IFGraph_SubPartsIterator & packs);

		/****************** Remainder ******************/
		%feature("compactdefaultargs") Remainder;
		%feature("autodoc", "Returns remainder which is a set of entities. can be empty. default evaluation is empty (has to be redefined if canhaveremainder is redefined to return true).

Parameters
----------
G: Interface_Graph

Returns
-------
Interface_EntityIterator
") Remainder;
		virtual Interface_EntityIterator Remainder(const Interface_Graph & G);

		/****************** RootName ******************/
		%feature("compactdefaultargs") RootName;
		%feature("autodoc", "Returns the root name for files produced by this dispatch it is empty if it has not been set or if it has been reset.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") RootName;
		const opencascade::handle<TCollection_HAsciiString> & RootName();

		/****************** Selections ******************/
		%feature("compactdefaultargs") Selections;
		%feature("autodoc", "Returns the complete list of source selections (starting from finalselection).

Returns
-------
IFSelect_SelectionIterator
") Selections;
		IFSelect_SelectionIterator Selections();

		/****************** SetFinalSelection ******************/
		%feature("compactdefaultargs") SetFinalSelection;
		%feature("autodoc", "Stores (or changes) the final selection for a dispatch.

Parameters
----------
sel: IFSelect_Selection

Returns
-------
None
") SetFinalSelection;
		void SetFinalSelection(const opencascade::handle<IFSelect_Selection> & sel);

		/****************** SetRootName ******************/
		%feature("compactdefaultargs") SetRootName;
		%feature("autodoc", "Sets a root name as an hasciistring to reset it, give a null handle (then, a shareout will have to define the default root name).

Parameters
----------
name: TCollection_HAsciiString

Returns
-------
None
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
		/****************** IFSelect_EditForm ******************/
		%feature("compactdefaultargs") IFSelect_EditForm;
		%feature("autodoc", "Creates a complete editform from an editor a specific label can be given.

Parameters
----------
editor: IFSelect_Editor
readonly: bool
undoable: bool
label: char *,optional
	default value is ""

Returns
-------
None
") IFSelect_EditForm;
		 IFSelect_EditForm(const opencascade::handle<IFSelect_Editor> & editor, const Standard_Boolean readonly, const Standard_Boolean undoable, const char * label = "");

		/****************** IFSelect_EditForm ******************/
		%feature("compactdefaultargs") IFSelect_EditForm;
		%feature("autodoc", "Creates an extracted editform from an editor, limited to the values identified in <nums> a specific label can be given.

Parameters
----------
editor: IFSelect_Editor
nums: TColStd_SequenceOfInteger
readonly: bool
undoable: bool
label: char *,optional
	default value is ""

Returns
-------
None
") IFSelect_EditForm;
		 IFSelect_EditForm(const opencascade::handle<IFSelect_Editor> & editor, const TColStd_SequenceOfInteger & nums, const Standard_Boolean readonly, const Standard_Boolean undoable, const char * label = "");

		/****************** Apply ******************/
		%feature("compactdefaultargs") Apply;
		%feature("autodoc", "Applies modifications to own data calls applydata then clears status according editkeepstatus.

Returns
-------
bool
") Apply;
		Standard_Boolean Apply();

		/****************** ApplyData ******************/
		%feature("compactdefaultargs") ApplyData;
		%feature("autodoc", "Applies modifications to data default uses editor. can be redefined.

Parameters
----------
ent: Standard_Transient
model: Interface_InterfaceModel

Returns
-------
bool
") ApplyData;
		virtual Standard_Boolean ApplyData(const opencascade::handle<Standard_Transient> & ent, const opencascade::handle<Interface_InterfaceModel> & model);

		/****************** ClearData ******************/
		%feature("compactdefaultargs") ClearData;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") ClearData;
		void ClearData();

		/****************** ClearEdit ******************/
		%feature("compactdefaultargs") ClearEdit;
		%feature("autodoc", "Clears modification status : by default all, or one by its numbers (in the editor).

Parameters
----------
num: int,optional
	default value is 0

Returns
-------
None
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
		/****************** EditedList ******************/
		%feature("compactdefaultargs") EditedList;
		%feature("autodoc", "Returns the edited value as a list if ismodified is false, returns originalvalue null with ismodified true : means that this value is not defined or has been removed for a single parameter, gives a null handle.

Parameters
----------
num: int

Returns
-------
opencascade::handle<TColStd_HSequenceOfHAsciiString>
") EditedList;
		opencascade::handle<TColStd_HSequenceOfHAsciiString> EditedList(const Standard_Integer num);

		/****************** EditedValue ******************/
		%feature("compactdefaultargs") EditedValue;
		%feature("autodoc", "Returns the edited (i.e. modified) value (string for single) <num> reports to the editform if ismodified is false, returns originalvalue null with ismodified true : means that this value is not defined or has been removed it is for a single parameter. for a list, gives a null handle.

Parameters
----------
num: int

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") EditedValue;
		opencascade::handle<TCollection_HAsciiString> EditedValue(const Standard_Integer num);

		/****************** Editor ******************/
		%feature("compactdefaultargs") Editor;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<IFSelect_Editor>
") Editor;
		opencascade::handle<IFSelect_Editor> Editor();

		/****************** Entity ******************/
		%feature("compactdefaultargs") Entity;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Standard_Transient>
") Entity;
		opencascade::handle<Standard_Transient> Entity();

		/****************** IsComplete ******************/
		%feature("compactdefaultargs") IsComplete;
		%feature("autodoc", "Tells if an editform is complete or is an extract from editor.

Returns
-------
bool
") IsComplete;
		Standard_Boolean IsComplete();

		/****************** IsLoaded ******************/
		%feature("compactdefaultargs") IsLoaded;
		%feature("autodoc", "Tells if the editform is loaded now.

Returns
-------
bool
") IsLoaded;
		Standard_Boolean IsLoaded();

		/****************** IsModified ******************/
		%feature("compactdefaultargs") IsModified;
		%feature("autodoc", "Tells if a value (of the editform) is modified (directly or through touching by update).

Parameters
----------
num: int

Returns
-------
bool
") IsModified;
		Standard_Boolean IsModified(const Standard_Integer num);

		/****************** IsTouched ******************/
		%feature("compactdefaultargs") IsTouched;
		%feature("autodoc", "Tells if a value (of the editform) has been touched, i.e. not modified directly but by the modification of another one (by method update from the editor).

Parameters
----------
num: int

Returns
-------
bool
") IsTouched;
		Standard_Boolean IsTouched(const Standard_Integer num);

		/****************** Label ******************/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "No available documentation.

Returns
-------
char *
") Label;
		const char * Label();

		/****************** ListEditor ******************/
		%feature("compactdefaultargs") ListEditor;
		%feature("autodoc", "Returns a listeditor to edit the parameter <num> of the editform, if it is a list the editor created it (by listeditor) then loads it (by listvalue) for a single parameter, returns a null handle ...

Parameters
----------
num: int

Returns
-------
opencascade::handle<IFSelect_ListEditor>
") ListEditor;
		opencascade::handle<IFSelect_ListEditor> ListEditor(const Standard_Integer num);

		/****************** LoadData ******************/
		%feature("compactdefaultargs") LoadData;
		%feature("autodoc", "Loads modifications to data default uses editor. can be redefined remark that <ent> and/or <model> may be null, according to the kind of editor. shortcuts are available for these cases, but they finally call loaddata (hence, just ignore non-used args).

Parameters
----------
ent: Standard_Transient
model: Interface_InterfaceModel

Returns
-------
bool
") LoadData;
		virtual Standard_Boolean LoadData(const opencascade::handle<Standard_Transient> & ent, const opencascade::handle<Interface_InterfaceModel> & model);

		/****************** LoadData ******************/
		%feature("compactdefaultargs") LoadData;
		%feature("autodoc", "Shortcut when both <ent> and <model> are not used (when the editor works on fully static or global data).

Returns
-------
bool
") LoadData;
		Standard_Boolean LoadData();

		/****************** LoadDefault ******************/
		%feature("compactdefaultargs") LoadDefault;
		%feature("autodoc", "For a read-write undoable editform, loads original values from defaults stored in the editor.

Returns
-------
None
") LoadDefault;
		void LoadDefault();

		/****************** LoadEntity ******************/
		%feature("compactdefaultargs") LoadEntity;
		%feature("autodoc", "Shortcut for loaddata when <model> is not used.

Parameters
----------
ent: Standard_Transient

Returns
-------
bool
") LoadEntity;
		Standard_Boolean LoadEntity(const opencascade::handle<Standard_Transient> & ent);

		/****************** LoadList ******************/
		%feature("compactdefaultargs") LoadList;
		%feature("autodoc", "Loads an original value as a list. called by the editor only.

Parameters
----------
num: int
list: TColStd_HSequenceOfHAsciiString

Returns
-------
None
") LoadList;
		void LoadList(const Standard_Integer num, const opencascade::handle<TColStd_HSequenceOfHAsciiString> & list);

		/****************** LoadModel ******************/
		%feature("compactdefaultargs") LoadModel;
		%feature("autodoc", "Shortcut for loaddata when only the model is concerned.

Parameters
----------
model: Interface_InterfaceModel

Returns
-------
bool
") LoadModel;
		Standard_Boolean LoadModel(const opencascade::handle<Interface_InterfaceModel> & model);

		/****************** LoadValue ******************/
		%feature("compactdefaultargs") LoadValue;
		%feature("autodoc", "Loads an original value (single). called by the editor only.

Parameters
----------
num: int
val: TCollection_HAsciiString

Returns
-------
None
") LoadValue;
		void LoadValue(const Standard_Integer num, const opencascade::handle<TCollection_HAsciiString> & val);

		/****************** Model ******************/
		%feature("compactdefaultargs") Model;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Interface_InterfaceModel>
") Model;
		opencascade::handle<Interface_InterfaceModel> Model();

		/****************** Modify ******************/
		%feature("compactdefaultargs") Modify;
		%feature("autodoc", "Gives a new value for the item <num> of the editform, if it is a single parameter (for a list, just returns false) null means to remove it <enforce> true to overpass protected or computed access mode calls the method update from the editor, which can touch other parameters (see nbtouched) returns true if well recorded, false if this value is not allowed warning : does not apply immediately : will be applied by the method apply.

Parameters
----------
num: int
newval: TCollection_HAsciiString
enforce: bool,optional
	default value is Standard_False

Returns
-------
bool
") Modify;
		Standard_Boolean Modify(const Standard_Integer num, const opencascade::handle<TCollection_HAsciiString> & newval, const Standard_Boolean enforce = Standard_False);

		/****************** ModifyList ******************/
		%feature("compactdefaultargs") ModifyList;
		%feature("autodoc", "Changes the value of an item of the editform, if it is a list (else, just returns false) the listeditor contains the edited values of the list if no edition was recorded, just returns false calls the method update from the editor, which can touch other parameters (see nbtouched) returns true if well recorded, false if this value is not allowed warning : does not apply immediately : will be applied by the method apply.

Parameters
----------
num: int
edited: IFSelect_ListEditor
enforce: bool,optional
	default value is Standard_False

Returns
-------
bool
") ModifyList;
		Standard_Boolean ModifyList(const Standard_Integer num, const opencascade::handle<IFSelect_ListEditor> & edited, const Standard_Boolean enforce = Standard_False);

		/****************** ModifyListValue ******************/
		%feature("compactdefaultargs") ModifyListValue;
		%feature("autodoc", "As modifylist but the new value is given as such creates a listeditor, loads it, then calls modifylist.

Parameters
----------
num: int
list: TColStd_HSequenceOfHAsciiString
enforce: bool,optional
	default value is Standard_False

Returns
-------
bool
") ModifyListValue;
		Standard_Boolean ModifyListValue(const Standard_Integer num, const opencascade::handle<TColStd_HSequenceOfHAsciiString> & list, const Standard_Boolean enforce = Standard_False);

		/****************** NameNumber ******************/
		%feature("compactdefaultargs") NameNumber;
		%feature("autodoc", "Returns the value number in the editor for a given name i.e. the true valuenumber which can be used in various methods of editform if it is not complete, for a recorded (in the editor) but non-loaded name, returns negative value (- number).

Parameters
----------
name: char *

Returns
-------
int
") NameNumber;
		Standard_Integer NameNumber(const char * name);

		/****************** NameRank ******************/
		%feature("compactdefaultargs") NameRank;
		%feature("autodoc", "Returns the rank of value in the editform for a given name i.e. if it is not complete, for a recorded (in the editor) but non-loaded name, returns 0.

Parameters
----------
name: char *

Returns
-------
int
") NameRank;
		Standard_Integer NameRank(const char * name);

		/****************** NbValues ******************/
		%feature("compactdefaultargs") NbValues;
		%feature("autodoc", "Returns the count of values <editable> true : count of editable values, i.e. for a complete editform, it is given by the editor else, it is the length of the extraction map <editable> false : all the values from the editor.

Parameters
----------
editable: bool

Returns
-------
int
") NbValues;
		Standard_Integer NbValues(const Standard_Boolean editable);

		/****************** NumberFromRank ******************/
		%feature("compactdefaultargs") NumberFromRank;
		%feature("autodoc", "Returns the value number in the editor from a given rank in the editform for a complete editform, both are equal else, it is given by the extraction map returns 0 if <rank> exceeds the count of editable values,.

Parameters
----------
rank: int

Returns
-------
int
") NumberFromRank;
		Standard_Integer NumberFromRank(const Standard_Integer rank);

		/****************** OriginalList ******************/
		%feature("compactdefaultargs") OriginalList;
		%feature("autodoc", "Returns an original value, as a list <num> is for the editform, not the editor for a single parameter, gives a null handle.

Parameters
----------
num: int

Returns
-------
opencascade::handle<TColStd_HSequenceOfHAsciiString>
") OriginalList;
		opencascade::handle<TColStd_HSequenceOfHAsciiString> OriginalList(const Standard_Integer num);

		/****************** OriginalValue ******************/
		%feature("compactdefaultargs") OriginalValue;
		%feature("autodoc", "From an edited value, returns its ... value (original one) null means that this value is not defined <num> is for the editform, not the editor it is for a single parameter. for a list, gives a null handle.

Parameters
----------
num: int

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") OriginalValue;
		opencascade::handle<TCollection_HAsciiString> OriginalValue(const Standard_Integer num);

		/****************** PrintDefs ******************/
		%feature("compactdefaultargs") PrintDefs;
		%feature("autodoc", "Prints definitions, relative to the editor.

Parameters
----------
S: Message_Messenger

Returns
-------
None
") PrintDefs;
		void PrintDefs(const opencascade::handle<Message_Messenger> & S);

		/****************** PrintValues ******************/
		%feature("compactdefaultargs") PrintValues;
		%feature("autodoc", "Prints values, according to what and alsolist <names> true : prints long names; false : prints short names <what> < 0 : prints original values (+ flag modified) <what> > 0 : prints final values (+flag modified) <what> = 0 : prints modified values (original + edited) <alsolist> false (d) : lists are printed only as their count <alsolist> true : lists are printed for all their items.

Parameters
----------
S: Message_Messenger
what: int
names: bool
alsolist: bool,optional
	default value is Standard_False

Returns
-------
None
") PrintValues;
		void PrintValues(const opencascade::handle<Message_Messenger> & S, const Standard_Integer what, const Standard_Boolean names, const Standard_Boolean alsolist = Standard_False);

		/****************** RankFromNumber ******************/
		%feature("compactdefaultargs") RankFromNumber;
		%feature("autodoc", "Returns the rank in the editform from a given number of value for the editor for a complete editform, both are equal else, it is given by the extraction map returns 0 if <number> is not forecast to be edited, or is out of range.

Parameters
----------
number: int

Returns
-------
int
") RankFromNumber;
		Standard_Integer RankFromNumber(const Standard_Integer number);

		/****************** Recognize ******************/
		%feature("compactdefaultargs") Recognize;
		%feature("autodoc", "Tells if this editform can work with its editor and its actual data (entity and model) default uses editor. can be redefined.

Returns
-------
bool
") Recognize;
		virtual Standard_Boolean Recognize();

		/****************** SetData ******************/
		%feature("compactdefaultargs") SetData;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: Standard_Transient
model: Interface_InterfaceModel

Returns
-------
None
") SetData;
		void SetData(const opencascade::handle<Standard_Transient> & ent, const opencascade::handle<Interface_InterfaceModel> & model);

		/****************** SetEntity ******************/
		%feature("compactdefaultargs") SetEntity;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: Standard_Transient

Returns
-------
None
") SetEntity;
		void SetEntity(const opencascade::handle<Standard_Transient> & ent);

		/****************** SetModel ******************/
		%feature("compactdefaultargs") SetModel;
		%feature("autodoc", "No available documentation.

Parameters
----------
model: Interface_InterfaceModel

Returns
-------
None
") SetModel;
		void SetModel(const opencascade::handle<Interface_InterfaceModel> & model);

		/****************** Touch ******************/
		%feature("compactdefaultargs") Touch;
		%feature("autodoc", "Gives a new value computed by the editor, if another parameter commands the value of <num> it is generally the case for a computed parameter for instance increments the counter of touched parameters warning : it gives no protection for readonly etc... while it is the internal way of touching parameters does not work (returns false) if <num> is for a list.

Parameters
----------
num: int
newval: TCollection_HAsciiString

Returns
-------
bool
") Touch;
		Standard_Boolean Touch(const Standard_Integer num, const opencascade::handle<TCollection_HAsciiString> & newval);

		/****************** TouchList ******************/
		%feature("compactdefaultargs") TouchList;
		%feature("autodoc", "Acts as touch but for a list does not work (returns false) if <num> is for a single param.

Parameters
----------
num: int
newlist: TColStd_HSequenceOfHAsciiString

Returns
-------
bool
") TouchList;
		Standard_Boolean TouchList(const Standard_Integer num, const opencascade::handle<TColStd_HSequenceOfHAsciiString> & newlist);

		/****************** Undo ******************/
		%feature("compactdefaultargs") Undo;
		%feature("autodoc", "For an undoable editform, applies ... origibal values ! and clears modified ones can be run only once.

Returns
-------
bool
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
		/****************** Apply ******************/
		%feature("compactdefaultargs") Apply;
		%feature("autodoc", "Applies modified values of the editform with some data remark: <ent> may be null, this means all <model> is concerned also <model> may be null, if no context applies for <ent> and both <ent> and <model> may be null, for a full static editor.

Parameters
----------
form: IFSelect_EditForm
ent: Standard_Transient
model: Interface_InterfaceModel

Returns
-------
bool
") Apply;
		virtual Standard_Boolean Apply(const opencascade::handle<IFSelect_EditForm> & form, const opencascade::handle<Standard_Transient> & ent, const opencascade::handle<Interface_InterfaceModel> & model);

		/****************** EditMode ******************/
		%feature("compactdefaultargs") EditMode;
		%feature("autodoc", "Returns the edit mode of a value.

Parameters
----------
num: int

Returns
-------
IFSelect_EditValue
") EditMode;
		IFSelect_EditValue EditMode(const Standard_Integer num);

		/****************** Form ******************/
		%feature("compactdefaultargs") Form;
		%feature("autodoc", "Builds and returns an editform, empty (no data yet) can be redefined to return a specific type of editform.

Parameters
----------
readonly: bool
undoable: bool,optional
	default value is Standard_True

Returns
-------
opencascade::handle<IFSelect_EditForm>
") Form;
		virtual opencascade::handle<IFSelect_EditForm> Form(const Standard_Boolean readonly, const Standard_Boolean undoable = Standard_True);

		/****************** IsList ******************/
		%feature("compactdefaultargs") IsList;
		%feature("autodoc", "Tells if a parameter is a list.

Parameters
----------
num: int

Returns
-------
bool
") IsList;
		Standard_Boolean IsList(const Standard_Integer num);

		/****************** Label ******************/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "Returns the specific label.

Returns
-------
TCollection_AsciiString
") Label;
		virtual TCollection_AsciiString Label();

		/****************** ListEditor ******************/
		%feature("compactdefaultargs") ListEditor;
		%feature("autodoc", "Returns a listeditor for a parameter which is a list default returns a basic listeditor for a list, a null handle if <num> is not for a list. can be redefined.

Parameters
----------
num: int

Returns
-------
opencascade::handle<IFSelect_ListEditor>
") ListEditor;
		virtual opencascade::handle<IFSelect_ListEditor> ListEditor(const Standard_Integer num);

		/****************** ListValue ******************/
		%feature("compactdefaultargs") ListValue;
		%feature("autodoc", "Returns the value of an editform as a list, for a given item if not a list, a null handle should be returned default returns a null handle, because many editors have no list to edit. to be redefined as required.

Parameters
----------
form: IFSelect_EditForm
num: int

Returns
-------
opencascade::handle<TColStd_HSequenceOfHAsciiString>
") ListValue;
		virtual opencascade::handle<TColStd_HSequenceOfHAsciiString> ListValue(const opencascade::handle<IFSelect_EditForm> & form, const Standard_Integer num);

		/****************** Load ******************/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "Loads original values from some data, to an editform remark: <ent> may be null, this means all <model> is concerned also <model> may be null, if no context applies for <ent> and both <ent> and <model> may be null, for a full static editor.

Parameters
----------
form: IFSelect_EditForm
ent: Standard_Transient
model: Interface_InterfaceModel

Returns
-------
bool
") Load;
		virtual Standard_Boolean Load(const opencascade::handle<IFSelect_EditForm> & form, const opencascade::handle<Standard_Transient> & ent, const opencascade::handle<Interface_InterfaceModel> & model);

		/****************** MaxList ******************/
		%feature("compactdefaultargs") MaxList;
		%feature("autodoc", "Returns max length allowed for a list = 0 means : list with no limit < 0 means : not a list.

Parameters
----------
num: int

Returns
-------
int
") MaxList;
		Standard_Integer MaxList(const Standard_Integer num);

		/****************** MaxNameLength ******************/
		%feature("compactdefaultargs") MaxNameLength;
		%feature("autodoc", "Returns the maxlength of, according to what : <what> = -1 : length of short names <what> = 0 : length of complete names <what> = 1 : length of values labels.

Parameters
----------
what: int

Returns
-------
int
") MaxNameLength;
		Standard_Integer MaxNameLength(const Standard_Integer what);

		/****************** Name ******************/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Returns the name of a value (complete or short) from its ident short name can be empty.

Parameters
----------
num: int
isshort: bool,optional
	default value is Standard_False

Returns
-------
char *
") Name;
		const char * Name(const Standard_Integer num, const Standard_Boolean isshort = Standard_False);

		/****************** NameNumber ******************/
		%feature("compactdefaultargs") NameNumber;
		%feature("autodoc", "Returns the number (ident) of a value, from its name, short or complete. if not found, returns 0.

Parameters
----------
name: char *

Returns
-------
int
") NameNumber;
		Standard_Integer NameNumber(const char * name);

		/****************** NbValues ******************/
		%feature("compactdefaultargs") NbValues;
		%feature("autodoc", "Returns the count of typed values.

Returns
-------
int
") NbValues;
		Standard_Integer NbValues();

		/****************** PrintDefs ******************/
		%feature("compactdefaultargs") PrintDefs;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: Message_Messenger
labels: bool,optional
	default value is Standard_False

Returns
-------
None
") PrintDefs;
		void PrintDefs(const opencascade::handle<Message_Messenger> & S, const Standard_Boolean labels = Standard_False);

		/****************** PrintNames ******************/
		%feature("compactdefaultargs") PrintNames;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: Message_Messenger

Returns
-------
None
") PrintNames;
		void PrintNames(const opencascade::handle<Message_Messenger> & S);

		/****************** Recognize ******************/
		%feature("compactdefaultargs") Recognize;
		%feature("autodoc", "Tells if this editor can work on this editform and its content (model, entity ?).

Parameters
----------
form: IFSelect_EditForm

Returns
-------
bool
") Recognize;
		virtual Standard_Boolean Recognize(const opencascade::handle<IFSelect_EditForm> & form);

		/****************** SetList ******************/
		%feature("compactdefaultargs") SetList;
		%feature("autodoc", "Sets a parameter to be a list max < 0 : not for a list (set when starting) max = 0 : list with no length limit (default for setlist) max > 0 : list limited to <max> items.

Parameters
----------
num: int
max: int,optional
	default value is 0

Returns
-------
None
") SetList;
		void SetList(const Standard_Integer num, const Standard_Integer max = 0);

		/****************** SetValue ******************/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "Sets a typed value for a given ident and short name, with an edit mode.

Parameters
----------
num: int
typval: Interface_TypedValue
shortname: char *,optional
	default value is ""
accessmode: IFSelect_EditValue,optional
	default value is IFSelect_Editable

Returns
-------
None
") SetValue;
		void SetValue(const Standard_Integer num, const opencascade::handle<Interface_TypedValue> & typval, const char * shortname = "", const IFSelect_EditValue accessmode = IFSelect_Editable);

		/****************** StringValue ******************/
		%feature("compactdefaultargs") StringValue;
		%feature("autodoc", "Returns the value of an editform, for a given item (if not a list. for a list, a null string may be returned).

Parameters
----------
form: IFSelect_EditForm
num: int

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") StringValue;
		virtual opencascade::handle<TCollection_HAsciiString> StringValue(const opencascade::handle<IFSelect_EditForm> & form, const Standard_Integer num);

		/****************** TypedValue ******************/
		%feature("compactdefaultargs") TypedValue;
		%feature("autodoc", "Returns a typed value from its ident.

Parameters
----------
num: int

Returns
-------
opencascade::handle<Interface_TypedValue>
") TypedValue;
		opencascade::handle<Interface_TypedValue> TypedValue(const Standard_Integer num);

		/****************** Update ******************/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "Updates the editform when a parameter is modified i.e. default does nothing, can be redefined, as follows : returns true when done (even if does nothing), false in case of refuse (for instance, if the new value is not suitable) <num> is the rank of the parameter for the editor itself <enforce> true means that protected parameters can be touched //! if a parameter commands the value of other ones, when it is modified, it is necessary to touch them by touch from editform.

Parameters
----------
form: IFSelect_EditForm
num: int
newval: TCollection_HAsciiString
enforce: bool

Returns
-------
bool
") Update;
		virtual Standard_Boolean Update(const opencascade::handle<IFSelect_EditForm> & form, const Standard_Integer num, const opencascade::handle<TCollection_HAsciiString> & newval, const Standard_Boolean enforce);

		/****************** UpdateList ******************/
		%feature("compactdefaultargs") UpdateList;
		%feature("autodoc", "Acts as update, but when the value is a list.

Parameters
----------
form: IFSelect_EditForm
num: int
newlist: TColStd_HSequenceOfHAsciiString
enforce: bool

Returns
-------
bool
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
		/****************** GiveDispatch ******************/
		%feature("compactdefaultargs") GiveDispatch;
		%feature("autodoc", "Evaluates and returns a dispatch, from data of a worksession if <mode> is false, searches for exact name of dispatch in ws else (d), allows a parameter between brackets : ex.: dispatch_name(parameter) the parameter can be: an integer for disppercount or dispperfiles or the name of a signature for disppersignature returns null handle if not found not well evaluated.

Parameters
----------
WS: IFSelect_WorkSession
name: char *
mode: bool,optional
	default value is Standard_True

Returns
-------
opencascade::handle<IFSelect_Dispatch>
") GiveDispatch;
		static opencascade::handle<IFSelect_Dispatch> GiveDispatch(const opencascade::handle<IFSelect_WorkSession> & WS, const char * name, const Standard_Boolean mode = Standard_True);

		/****************** GiveEntity ******************/
		%feature("compactdefaultargs") GiveEntity;
		%feature("autodoc", "Takes the name of an entity, either as argument, or (if <name> is empty) on keybord, and returns the entity name can be a label or a number (in alphanumeric), it is searched by numberfromlabel from worksession. if <name> doesn't match en entity, a null handle is returned.

Parameters
----------
WS: IFSelect_WorkSession
name: char *,optional
	default value is ""

Returns
-------
opencascade::handle<Standard_Transient>
") GiveEntity;
		static opencascade::handle<Standard_Transient> GiveEntity(const opencascade::handle<IFSelect_WorkSession> & WS, const char * name = "");

		/****************** GiveEntityNumber ******************/
		%feature("compactdefaultargs") GiveEntityNumber;
		%feature("autodoc", "Same as getentity, but returns the number in the model of the entity. returns 0 for null handle.

Parameters
----------
WS: IFSelect_WorkSession
name: char *,optional
	default value is ""

Returns
-------
int
") GiveEntityNumber;
		static Standard_Integer GiveEntityNumber(const opencascade::handle<IFSelect_WorkSession> & WS, const char * name = "");

		/****************** GiveList ******************/
		%feature("compactdefaultargs") GiveList;
		%feature("autodoc", "Computes a list of entities from a worksession and two idents, first and second, as follows : if <first> is a number or label of an entity : this entity if <first> is the name of a selection in <ws>, and <second> not defined, the standard result of this selection if <first> is for a selection and <second> is defined, the standard result of this selection from the list computed with <second> (an entity or a selection) if <second> is erroneous, it is ignored.

Parameters
----------
WS: IFSelect_WorkSession
first: char *,optional
	default value is ""
second: char *,optional
	default value is ""

Returns
-------
opencascade::handle<TColStd_HSequenceOfTransient>
") GiveList;
		static opencascade::handle<TColStd_HSequenceOfTransient> GiveList(const opencascade::handle<IFSelect_WorkSession> & WS, const char * first = "", const char * second = "");

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Defines and loads all basic functions (as actfunc).

Returns
-------
None
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
		/****************** Applies ******************/
		%feature("compactdefaultargs") Applies;
		%feature("autodoc", "Returns true if a model obtained from the dispatch <disp> is to be treated (apart from the selection criterium) if dispatch(me) is null, returns true. else, checks <disp>.

Parameters
----------
disp: IFSelect_Dispatch

Returns
-------
bool
") Applies;
		Standard_Boolean Applies(const opencascade::handle<IFSelect_Dispatch> & disp);

		/****************** Dispatch ******************/
		%feature("compactdefaultargs") Dispatch;
		%feature("autodoc", "Returns the dispatch to be matched, null if not set.

Returns
-------
opencascade::handle<IFSelect_Dispatch>
") Dispatch;
		opencascade::handle<IFSelect_Dispatch> Dispatch();

		/****************** HasSelection ******************/
		%feature("compactdefaultargs") HasSelection;
		%feature("autodoc", "Returns true if a selection is set as an additionnal criterium.

Returns
-------
bool
") HasSelection;
		Standard_Boolean HasSelection();

		/****************** Label ******************/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "Returns a short text which defines the operation performed.

Returns
-------
TCollection_AsciiString
") Label;
		virtual TCollection_AsciiString Label();

		/****************** MayChangeGraph ******************/
		%feature("compactdefaultargs") MayChangeGraph;
		%feature("autodoc", "Returns true if this modifier may change the graph of dependences (aknowledged at creation time).

Returns
-------
bool
") MayChangeGraph;
		Standard_Boolean MayChangeGraph();

		/****************** ResetSelection ******************/
		%feature("compactdefaultargs") ResetSelection;
		%feature("autodoc", "Resets the selection : this criterium is not longer active.

Returns
-------
None
") ResetSelection;
		void ResetSelection();

		/****************** Selection ******************/
		%feature("compactdefaultargs") Selection;
		%feature("autodoc", "Returns the selection, or a null handle if not set.

Returns
-------
opencascade::handle<IFSelect_Selection>
") Selection;
		opencascade::handle<IFSelect_Selection> Selection();

		/****************** SetDispatch ******************/
		%feature("compactdefaultargs") SetDispatch;
		%feature("autodoc", "Attaches to a dispatch. if <disp> is null, resets it (to apply the modifier on every dispatch).

Parameters
----------
disp: IFSelect_Dispatch

Returns
-------
None
") SetDispatch;
		void SetDispatch(const opencascade::handle<IFSelect_Dispatch> & disp);

		/****************** SetSelection ******************/
		%feature("compactdefaultargs") SetSelection;
		%feature("autodoc", "Sets a selection : a model is treated if it contains one or more entities designated by the selection.

Parameters
----------
sel: IFSelect_Selection

Returns
-------
None
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
		/****************** IFSelect_IntParam ******************/
		%feature("compactdefaultargs") IFSelect_IntParam;
		%feature("autodoc", "Creates an intparam. initial value is set to zer.

Returns
-------
None
") IFSelect_IntParam;
		 IFSelect_IntParam();

		/****************** SetStaticName ******************/
		%feature("compactdefaultargs") SetStaticName;
		%feature("autodoc", "Commands this intparam to be bound to a static hence, value will return the value if this static if it is set else, value works on the locally stored value setvalue also will set the value of the static this works only for a present static of type integer or enum else, it is ignored //! if <statname> is empty, disconnects the intparam from static.

Parameters
----------
statname: char *

Returns
-------
None
") SetStaticName;
		void SetStaticName(const char * statname);

		/****************** SetValue ******************/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "Sets a new integer value for the intparam. if a staticname is defined and the static is set, also sets the value of the static.

Parameters
----------
val: int

Returns
-------
None
") SetValue;
		void SetValue(const Standard_Integer val);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Reads integer value of the intparam. if a staticname is defined and the static is set, looks in priority the value of the static.

Returns
-------
int
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
		/****************** IFSelect_ListEditor ******************/
		%feature("compactdefaultargs") IFSelect_ListEditor;
		%feature("autodoc", "Creates a listeditor with absolutely no constraint.

Returns
-------
None
") IFSelect_ListEditor;
		 IFSelect_ListEditor();

		/****************** IFSelect_ListEditor ******************/
		%feature("compactdefaultargs") IFSelect_ListEditor;
		%feature("autodoc", "Creates a listeditor, for which items of the list to edit are defined by <def>, and <max> describes max length : 0 (d) means no limit value > 0 means : no more the <max> items are allowed.

Parameters
----------
def: Interface_TypedValue
max: int,optional
	default value is 0

Returns
-------
None
") IFSelect_ListEditor;
		 IFSelect_ListEditor(const opencascade::handle<Interface_TypedValue> & def, const Standard_Integer max = 0);

		/****************** AddValue ******************/
		%feature("compactdefaultargs") AddValue;
		%feature("autodoc", "Adds a new item. by default appends (at the end of the list) can insert before a given rank <num>, if positive returns true when done. false if maxlength may be overpassed or if <val> does not satisfy the definition.

Parameters
----------
val: TCollection_HAsciiString
atnum: int,optional
	default value is 0

Returns
-------
bool
") AddValue;
		virtual Standard_Boolean AddValue(const opencascade::handle<TCollection_HAsciiString> & val, const Standard_Integer atnum = 0);

		/****************** ClearEdit ******************/
		%feature("compactdefaultargs") ClearEdit;
		%feature("autodoc", "Clears all editions already recorded.

Returns
-------
None
") ClearEdit;
		void ClearEdit();

		/****************** EditedValues ******************/
		%feature("compactdefaultargs") EditedValues;
		%feature("autodoc", "Returns the result of the edition.

Returns
-------
opencascade::handle<TColStd_HSequenceOfHAsciiString>
") EditedValues;
		opencascade::handle<TColStd_HSequenceOfHAsciiString> EditedValues();

		/****************** IsAdded ******************/
		%feature("compactdefaultargs") IsAdded;
		%feature("autodoc", "Tells if a value (in edited list) has been added (new one).

Parameters
----------
num: int

Returns
-------
bool
") IsAdded;
		Standard_Boolean IsAdded(const Standard_Integer num);

		/****************** IsChanged ******************/
		%feature("compactdefaultargs") IsChanged;
		%feature("autodoc", "Tells if a value (in edited list) has been changed, i.e. either modified-value, or added.

Parameters
----------
num: int

Returns
-------
bool
") IsChanged;
		Standard_Boolean IsChanged(const Standard_Integer num);

		/****************** IsModified ******************/
		%feature("compactdefaultargs") IsModified;
		%feature("autodoc", "Tells if a value (in edited list) has been modified-value (not added).

Parameters
----------
num: int

Returns
-------
bool
") IsModified;
		Standard_Boolean IsModified(const Standard_Integer num);

		/****************** IsTouched ******************/
		%feature("compactdefaultargs") IsTouched;
		%feature("autodoc", "Tells if at least one edition (setvalue-addvalue-remove) has been recorded.

Returns
-------
bool
") IsTouched;
		Standard_Boolean IsTouched();

		/****************** LoadEdited ******************/
		%feature("compactdefaultargs") LoadEdited;
		%feature("autodoc", "Loads a new list to replace the older one, in once ! by default (can be redefined) checks the length of the list and the value of each item according to the def items are all recorded as modified //! if no def has been given at creation time, no check is done returns true when done, false if checks have failed ... a specialisation may also lock it by returning always false ...

Parameters
----------
list: TColStd_HSequenceOfHAsciiString

Returns
-------
bool
") LoadEdited;
		virtual Standard_Boolean LoadEdited(const opencascade::handle<TColStd_HSequenceOfHAsciiString> & list);

		/****************** LoadModel ******************/
		%feature("compactdefaultargs") LoadModel;
		%feature("autodoc", "Loads a model. it is used to check items of type entity(ident).

Parameters
----------
model: Interface_InterfaceModel

Returns
-------
None
") LoadModel;
		void LoadModel(const opencascade::handle<Interface_InterfaceModel> & model);

		/****************** LoadValues ******************/
		%feature("compactdefaultargs") LoadValues;
		%feature("autodoc", "Loads the original values for the list remark : if its length is mor then maxlength, editions remain allowed, except add.

Parameters
----------
vals: TColStd_HSequenceOfHAsciiString

Returns
-------
None
") LoadValues;
		void LoadValues(const opencascade::handle<TColStd_HSequenceOfHAsciiString> & vals);

		/****************** NbValues ******************/
		%feature("compactdefaultargs") NbValues;
		%feature("autodoc", "Returns count of values, edited (d) or original.

Parameters
----------
edited: bool,optional
	default value is Standard_True

Returns
-------
int
") NbValues;
		Standard_Integer NbValues(const Standard_Boolean edited = Standard_True);

		/****************** OriginalValues ******************/
		%feature("compactdefaultargs") OriginalValues;
		%feature("autodoc", "Returns the value from which the edition started.

Returns
-------
opencascade::handle<TColStd_HSequenceOfHAsciiString>
") OriginalValues;
		opencascade::handle<TColStd_HSequenceOfHAsciiString> OriginalValues();

		/****************** Remove ******************/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "Removes items from the list by default removes one item. else, count given by <howmany> remove from rank <num> included. by default, from the end returns true when done, false (and does not work) if case of out of range of if <howmany> is greater than current length.

Parameters
----------
num: int,optional
	default value is 0
howmany: int,optional
	default value is 1

Returns
-------
bool
") Remove;
		virtual Standard_Boolean Remove(const Standard_Integer num = 0, const Standard_Integer howmany = 1);

		/****************** SetTouched ******************/
		%feature("compactdefaultargs") SetTouched;
		%feature("autodoc", "Declares this listeditor to have been touched (whatever action).

Returns
-------
None
") SetTouched;
		void SetTouched();

		/****************** SetValue ******************/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "Sets a new value for the item <num> (in edited list) <val> may be a null handle, then the value will be cleared but not removed returns true when done. false if <num> is out of range or if <val> does not satisfy the definition.

Parameters
----------
num: int
val: TCollection_HAsciiString

Returns
-------
bool
") SetValue;
		virtual Standard_Boolean SetValue(const Standard_Integer num, const opencascade::handle<TCollection_HAsciiString> & val);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns a value given its rank. edited (d) or original a null string means the value is cleared but not removed.

Parameters
----------
num: int
edited: bool,optional
	default value is Standard_True

Returns
-------
opencascade::handle<TCollection_HAsciiString>
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
		/****************** IFSelect_ModelCopier ******************/
		%feature("compactdefaultargs") IFSelect_ModelCopier;
		%feature("autodoc", "Creates an empty modelcopier.

Returns
-------
None
") IFSelect_ModelCopier;
		 IFSelect_ModelCopier();

		/****************** AddFile ******************/
		%feature("compactdefaultargs") AddFile;
		%feature("autodoc", "Records a new file to be sent, as a couple (name as asciistring, content as interfacemodel) returns true if done, false if <filename> is already attached to another file.

Parameters
----------
filename: TCollection_AsciiString
content: Interface_InterfaceModel

Returns
-------
bool
") AddFile;
		Standard_Boolean AddFile(const TCollection_AsciiString & filename, const opencascade::handle<Interface_InterfaceModel> & content);

		/****************** AddSentFile ******************/
		%feature("compactdefaultargs") AddSentFile;
		%feature("autodoc", "Adds the name of a just sent file, if beginsentfiles has commanded recording; else does nothing it is called by methods sendcopied sending.

Parameters
----------
filename: char *

Returns
-------
None
") AddSentFile;
		void AddSentFile(const char * filename);

		/****************** AppliedModifiers ******************/
		%feature("compactdefaultargs") AppliedModifiers;
		%feature("autodoc", "Returns the list of file modifiers to be applied on a file when it will be sent, as computed by copiedmodel : if it is a null handle, no file modifier has to be applied.

Parameters
----------
num: int

Returns
-------
opencascade::handle<IFSelect_AppliedModifiers>
") AppliedModifiers;
		opencascade::handle<IFSelect_AppliedModifiers> AppliedModifiers(const Standard_Integer num);

		/****************** BeginSentFiles ******************/
		%feature("compactdefaultargs") BeginSentFiles;
		%feature("autodoc", "Begins a sequence of recording the really sent files <sho> : the default file numbering is cleared if <record> is false, clears the list and stops recording if <record> is true, clears the list and commands recording creation time corresponds to 'stop recording'.

Parameters
----------
sho: IFSelect_ShareOut
record: bool

Returns
-------
None
") BeginSentFiles;
		void BeginSentFiles(const opencascade::handle<IFSelect_ShareOut> & sho, const Standard_Boolean record);

		/****************** ClearAppliedModifiers ******************/
		%feature("compactdefaultargs") ClearAppliedModifiers;
		%feature("autodoc", "Clears the list of file modifiers to be applied on a file.

Parameters
----------
num: int

Returns
-------
bool
") ClearAppliedModifiers;
		Standard_Boolean ClearAppliedModifiers(const Standard_Integer num);

		/****************** ClearFile ******************/
		%feature("compactdefaultargs") ClearFile;
		%feature("autodoc", "Clears the name attached to a file which was formerly defined by a call to addfile. this clearing can be undone by a call to namefile (with same <num>) returns true if done, false else : if <num> is out of range.

Parameters
----------
num: int

Returns
-------
bool
") ClearFile;
		Standard_Boolean ClearFile(const Standard_Integer num);

		/****************** ClearResult ******************/
		%feature("compactdefaultargs") ClearResult;
		%feature("autodoc", "Clears the list of produced models.

Returns
-------
None
") ClearResult;
		void ClearResult();

		/****************** CopiedRemaining ******************/
		%feature("compactdefaultargs") CopiedRemaining;
		%feature("autodoc", "Produces a model copied from the remaining list as <newmod> <newmod> is a null handle if this list is empty <wl> performs the copy by using <tc> <tc> is assumed to have been defined with the starting model same as defined by <g>.

Parameters
----------
G: Interface_Graph
WL: IFSelect_WorkLibrary
TC: Interface_CopyTool
newmod: Interface_InterfaceModel

Returns
-------
None
") CopiedRemaining;
		void CopiedRemaining(const Interface_Graph & G, const opencascade::handle<IFSelect_WorkLibrary> & WL, Interface_CopyTool & TC, opencascade::handle<Interface_InterfaceModel> & newmod);

		/****************** Copy ******************/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Performs the copy operations, which include the modifications defined by the list of modifiers. memorizes the result, as a list of interfacemodels with the corresponding filenames they can then be sent, by the method send, or queried copy calls internal method copying. returns the produced checklist.

Parameters
----------
eval: IFSelect_ShareOutResult
WL: IFSelect_WorkLibrary
protocol: Interface_Protocol

Returns
-------
Interface_CheckIterator
") Copy;
		Interface_CheckIterator Copy(IFSelect_ShareOutResult & eval, const opencascade::handle<IFSelect_WorkLibrary> & WL, const opencascade::handle<Interface_Protocol> & protocol);

		/****************** FileModel ******************/
		%feature("compactdefaultargs") FileModel;
		%feature("autodoc", "Returns the content of a file before sending, under the form of an interfacemodel, given its rank.

Parameters
----------
num: int

Returns
-------
opencascade::handle<Interface_InterfaceModel>
") FileModel;
		opencascade::handle<Interface_InterfaceModel> FileModel(const Standard_Integer num);

		/****************** FileName ******************/
		%feature("compactdefaultargs") FileName;
		%feature("autodoc", "Returns the file name for a file given its rank it is empty after a call to clearfile on same <num>.

Parameters
----------
num: int

Returns
-------
TCollection_AsciiString
") FileName;
		TCollection_AsciiString FileName(const Standard_Integer num);

		/****************** NameFile ******************/
		%feature("compactdefaultargs") NameFile;
		%feature("autodoc", "Changes the name attached to a file which was formerly defined by a call to addfile returns true if done, false else : if <num> out of range or if the new <filename> is already attached to another file remark : giving an empty file name is equivalent to clearfile.

Parameters
----------
num: int
filename: TCollection_AsciiString

Returns
-------
bool
") NameFile;
		Standard_Boolean NameFile(const Standard_Integer num, const TCollection_AsciiString & filename);

		/****************** NbFiles ******************/
		%feature("compactdefaultargs") NbFiles;
		%feature("autodoc", "Returns the count of files produced, i.e. the count of models memorized (produced by the mmethod copy) with their file names.

Returns
-------
int
") NbFiles;
		Standard_Integer NbFiles();

		/****************** Send ******************/
		%feature("compactdefaultargs") Send;
		%feature("autodoc", "Performs the copy operations (which include the modifications) and sends the result on files, without memorizing it. (the memorized result is ignored : neither queried not filled).

Parameters
----------
eval: IFSelect_ShareOutResult
WL: IFSelect_WorkLibrary
protocol: Interface_Protocol

Returns
-------
Interface_CheckIterator
") Send;
		Interface_CheckIterator Send(IFSelect_ShareOutResult & eval, const opencascade::handle<IFSelect_WorkLibrary> & WL, const opencascade::handle<Interface_Protocol> & protocol);

		/****************** SendAll ******************/
		%feature("compactdefaultargs") SendAll;
		%feature("autodoc", "Sends a model (defined in <g>) into one file, without managing remaining data, already sent files, etc. applies the model and file modifiers. returns true if well done, false else.

Parameters
----------
filename: char *
G: Interface_Graph
WL: IFSelect_WorkLibrary
protocol: Interface_Protocol

Returns
-------
Interface_CheckIterator
") SendAll;
		Interface_CheckIterator SendAll(const char * filename, const Interface_Graph & G, const opencascade::handle<IFSelect_WorkLibrary> & WL, const opencascade::handle<Interface_Protocol> & protocol);

		/****************** SendCopied ******************/
		%feature("compactdefaultargs") SendCopied;
		%feature("autodoc", "Sends the formerly defined results (see method copy) to files, then clears it remark : a null file name cause file to be not produced.

Parameters
----------
WL: IFSelect_WorkLibrary
protocol: Interface_Protocol

Returns
-------
Interface_CheckIterator
") SendCopied;
		Interface_CheckIterator SendCopied(const opencascade::handle<IFSelect_WorkLibrary> & WL, const opencascade::handle<Interface_Protocol> & protocol);

		/****************** SendSelected ******************/
		%feature("compactdefaultargs") SendSelected;
		%feature("autodoc", "Sends a part of a model into one file. model is gotten from <g>, the part is defined in <iter>. remaining data are managed and can be later be worked on. returns true if well done, false else.

Parameters
----------
filename: char *
G: Interface_Graph
WL: IFSelect_WorkLibrary
protocol: Interface_Protocol
iter: Interface_EntityIterator

Returns
-------
Interface_CheckIterator
") SendSelected;
		Interface_CheckIterator SendSelected(const char * filename, const Interface_Graph & G, const opencascade::handle<IFSelect_WorkLibrary> & WL, const opencascade::handle<Interface_Protocol> & protocol, const Interface_EntityIterator & iter);

		/****************** SentFiles ******************/
		%feature("compactdefaultargs") SentFiles;
		%feature("autodoc", "Returns the list of recorded names of sent files. can be empty (if no file has been sent). returns a null handle if beginsentfiles has stopped recording.

Returns
-------
opencascade::handle<TColStd_HSequenceOfHAsciiString>
") SentFiles;
		opencascade::handle<TColStd_HSequenceOfHAsciiString> SentFiles();

		/****************** SetAppliedModifiers ******************/
		%feature("compactdefaultargs") SetAppliedModifiers;
		%feature("autodoc", "Sets a list of file modifiers to be applied on a file.

Parameters
----------
num: int
applied: IFSelect_AppliedModifiers

Returns
-------
bool
") SetAppliedModifiers;
		Standard_Boolean SetAppliedModifiers(const Standard_Integer num, const opencascade::handle<IFSelect_AppliedModifiers> & applied);

		/****************** SetRemaining ******************/
		%feature("compactdefaultargs") SetRemaining;
		%feature("autodoc", "Updates graph status for remaining data, for each entity : - entities just sent to file or copied (by copiedremaining) have their status set to 1 - the other keep their former status (1 for send/copied, 0 for remaining) these status are computed by copying/sending/copiedremaining then, setremaining updates graph status, and mustr be called just after one of these method has been called returns true if done, false if remaining info if not in phase which the graph (not same counts of items).

Parameters
----------
CG: Interface_Graph

Returns
-------
bool
") SetRemaining;
		Standard_Boolean SetRemaining(Interface_Graph & CG);

		/****************** SetShareOut ******************/
		%feature("compactdefaultargs") SetShareOut;
		%feature("autodoc", "Sets the shareout, which is used to define modifiers to apply.

Parameters
----------
sho: IFSelect_ShareOut

Returns
-------
None
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
		/****************** IFSelect_PacketList ******************/
		%feature("compactdefaultargs") IFSelect_PacketList;
		%feature("autodoc", "Creates a packlist, empty, ready to receive entities from a given model.

Parameters
----------
model: Interface_InterfaceModel

Returns
-------
None
") IFSelect_PacketList;
		 IFSelect_PacketList(const opencascade::handle<Interface_InterfaceModel> & model);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Adds an entity from the model into the current packet for add.

Parameters
----------
ent: Standard_Transient

Returns
-------
None
") Add;
		void Add(const opencascade::handle<Standard_Transient> & ent);

		/****************** AddList ******************/
		%feature("compactdefaultargs") AddList;
		%feature("autodoc", "Adds an list of entities into the current packet for add.

Parameters
----------
list: TColStd_HSequenceOfTransient

Returns
-------
None
") AddList;
		void AddList(const opencascade::handle<TColStd_HSequenceOfTransient> & list);

		/****************** AddPacket ******************/
		%feature("compactdefaultargs") AddPacket;
		%feature("autodoc", "Declares a new packet, ready to be filled the entities to be added will be added to this packet.

Returns
-------
None
") AddPacket;
		void AddPacket();

		/****************** Duplicated ******************/
		%feature("compactdefaultargs") Duplicated;
		%feature("autodoc", "Returns a list of entities duplicated : <count> times, if <andmore> is false, or <count> or more times, if <andmore> is true hence, count=2 & andmore=true gives all duplicated entities count=1 gives non-duplicated entities (in only one packet) count=0 gives remaining entities (in no packet at all).

Parameters
----------
count: int
andmore: bool

Returns
-------
Interface_EntityIterator
") Duplicated;
		Interface_EntityIterator Duplicated(const Standard_Integer count, const Standard_Boolean andmore);

		/****************** Entities ******************/
		%feature("compactdefaultargs") Entities;
		%feature("autodoc", "Returns the content of a packet given its rank null handle if <numpack> is out of range.

Parameters
----------
numpack: int

Returns
-------
Interface_EntityIterator
") Entities;
		Interface_EntityIterator Entities(const Standard_Integer numpack);

		/****************** HighestDuplicationCount ******************/
		%feature("compactdefaultargs") HighestDuplicationCount;
		%feature("autodoc", "Returns the highest number of packets which know a same entity for no duplication, should be one.

Returns
-------
int
") HighestDuplicationCount;
		Standard_Integer HighestDuplicationCount();

		/****************** Model ******************/
		%feature("compactdefaultargs") Model;
		%feature("autodoc", "Returns the model of reference.

Returns
-------
opencascade::handle<Interface_InterfaceModel>
") Model;
		opencascade::handle<Interface_InterfaceModel> Model();

		/****************** Name ******************/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Returns the recorded name for a packet list.

Returns
-------
char *
") Name;
		const char * Name();

		/****************** NbDuplicated ******************/
		%feature("compactdefaultargs") NbDuplicated;
		%feature("autodoc", "Returns the count of entities duplicated : <count> times, if <andmore> is false, or <count> or more times, if <andmore> is true see duplicated for more details.

Parameters
----------
count: int
andmore: bool

Returns
-------
int
") NbDuplicated;
		Standard_Integer NbDuplicated(const Standard_Integer count, const Standard_Boolean andmore);

		/****************** NbEntities ******************/
		%feature("compactdefaultargs") NbEntities;
		%feature("autodoc", "Returns the count of entities in a packet given its rank, or 0.

Parameters
----------
numpack: int

Returns
-------
int
") NbEntities;
		Standard_Integer NbEntities(const Standard_Integer numpack);

		/****************** NbPackets ******************/
		%feature("compactdefaultargs") NbPackets;
		%feature("autodoc", "Returns the count of non-empty packets.

Returns
-------
int
") NbPackets;
		Standard_Integer NbPackets();

		/****************** SetName ******************/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "Sets a name to a packet list : this makes easier a general routine to print it. default is 'packets'.

Parameters
----------
name: char *

Returns
-------
None
") SetName;
		void SetName(const char * name);

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
		/****************** CompleteResult ******************/
		%feature("compactdefaultargs") CompleteResult;
		%feature("autodoc", "Returns the list of entities involved by a selection, i.e. uniqueresult plus the shared entities (directly or not).

Parameters
----------
G: Interface_Graph

Returns
-------
Interface_EntityIterator
") CompleteResult;
		virtual Interface_EntityIterator CompleteResult(const Interface_Graph & G);

		/****************** FillIterator ******************/
		%feature("compactdefaultargs") FillIterator;
		%feature("autodoc", "Puts in an iterator the selections from which 'me' depends (there can be zero, or one, or a list). specific to each class of selection.

Parameters
----------
iter: IFSelect_SelectionIterator

Returns
-------
None
") FillIterator;
		virtual void FillIterator(IFSelect_SelectionIterator & iter);

		/****************** Label ******************/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "Returns a text which defines the criterium applied by a selection (can be used to be printed, displayed ...) specific to each class.

Returns
-------
TCollection_AsciiString
") Label;
		virtual TCollection_AsciiString Label();

		/****************** RootResult ******************/
		%feature("compactdefaultargs") RootResult;
		%feature("autodoc", "Returns the list of selected entities, computed from input given as a graph. specific to each class of selection note that uniqueness of each entity is not required here this method can raise an exception as necessary.

Parameters
----------
G: Interface_Graph

Returns
-------
Interface_EntityIterator
") RootResult;
		virtual Interface_EntityIterator RootResult(const Interface_Graph & G);

		/****************** UniqueResult ******************/
		%feature("compactdefaultargs") UniqueResult;
		%feature("autodoc", "Returns the list of selected entities, each of them beeing unique. default definition works from rootresult. according hasuniqueresult, uniqueresult returns directly rootresult, or build a unique result from it with a graph.

Parameters
----------
G: Interface_Graph

Returns
-------
Interface_EntityIterator
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
		/****************** IFSelect_SelectionIterator ******************/
		%feature("compactdefaultargs") IFSelect_SelectionIterator;
		%feature("autodoc", "Creates an empty iterator, ready to be filled.

Returns
-------
None
") IFSelect_SelectionIterator;
		 IFSelect_SelectionIterator();

		/****************** IFSelect_SelectionIterator ******************/
		%feature("compactdefaultargs") IFSelect_SelectionIterator;
		%feature("autodoc", "Creates an iterator from a selection : it lists the selections from which <sel> depends (given by its method filliterator).

Parameters
----------
sel: IFSelect_Selection

Returns
-------
None
") IFSelect_SelectionIterator;
		 IFSelect_SelectionIterator(const opencascade::handle<IFSelect_Selection> & sel);

		/****************** AddFromIter ******************/
		%feature("compactdefaultargs") AddFromIter;
		%feature("autodoc", "Adds to an iterator the content of another one (each selection is present only once in the result).

Parameters
----------
iter: IFSelect_SelectionIterator

Returns
-------
None
") AddFromIter;
		void AddFromIter(IFSelect_SelectionIterator & iter);

		/****************** AddItem ******************/
		%feature("compactdefaultargs") AddItem;
		%feature("autodoc", "Adds a selection to an iterator (if not yet noted).

Parameters
----------
sel: IFSelect_Selection

Returns
-------
None
") AddItem;
		void AddItem(const opencascade::handle<IFSelect_Selection> & sel);

		/****************** AddList ******************/
		%feature("compactdefaultargs") AddList;
		%feature("autodoc", "Adds a list of selections to an iterator (this list comes from the description of a selection or a dispatch, etc...).

Parameters
----------
list: IFSelect_TSeqOfSelection

Returns
-------
None
") AddList;
		void AddList(const IFSelect_TSeqOfSelection & list);

		/****************** More ******************/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Returns true if there are more selections to get.

Returns
-------
bool
") More;
		Standard_Boolean More();

		/****************** Next ******************/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Sets iterator to the next item.

Returns
-------
None
") Next;
		void Next();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the current selction beeing iterated error if count of selection has been passed.

Returns
-------
opencascade::handle<IFSelect_Selection>
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
		/****************** First ******************/
		%feature("compactdefaultargs") First;
		%feature("autodoc", "Returns the first item of the library of dumper. the next ones are then obtained by next on the returned items.

Returns
-------
opencascade::handle<IFSelect_SessionDumper>
") First;
		static opencascade::handle<IFSelect_SessionDumper> First();

		/****************** Next ******************/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Returns the next sesiondumper in the library. returns a null handle at the end.

Returns
-------
opencascade::handle<IFSelect_SessionDumper>
") Next;
		opencascade::handle<IFSelect_SessionDumper> Next();

		/****************** ReadOwn ******************/
		%feature("compactdefaultargs") ReadOwn;
		%feature("autodoc", "Recognizes a type (given as <type>) then creates an item of this type with the own parameter, as required. returns true if it has recognized the type (in this case, it is assumed to have created the item, returned as <item>), false else : in that case, sessionfile will try another sessiondumper in the library. readown can use these methods from sessionfile to access own parameters : nbownparams, isvoid, istext, textvalue, itemvalue.

Parameters
----------
file: IFSelect_SessionFile
type: TCollection_AsciiString
item: Standard_Transient

Returns
-------
bool
") ReadOwn;
		virtual Standard_Boolean ReadOwn(IFSelect_SessionFile & file, const TCollection_AsciiString & type, opencascade::handle<Standard_Transient> & item);

		/****************** WriteOwn ******************/
		%feature("compactdefaultargs") WriteOwn;
		%feature("autodoc", "Writes the own parameters of a given item, if it forecast to manage its type. returns true if it has recognized the type of the item (in this case, it is assumed to have written the own parameters if there are some), false else : in that case, sessionfile will try another sessiondumper in the library. writeown can use these methods from sessionfile : sendvoid, senditem, sendtext, and if necessary, worksession.

Parameters
----------
file: IFSelect_SessionFile
item: Standard_Transient

Returns
-------
bool
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
		/****************** IFSelect_SessionFile ******************/
		%feature("compactdefaultargs") IFSelect_SessionFile;
		%feature("autodoc", "Creates a sessionfile, ready to read files in order to load them into a given worksession. the following read operations must then be called. it is also possible to perform a write, which produces a complete file of all the content of the worksession.

Parameters
----------
WS: IFSelect_WorkSession

Returns
-------
None
") IFSelect_SessionFile;
		 IFSelect_SessionFile(const opencascade::handle<IFSelect_WorkSession> & WS);

		/****************** IFSelect_SessionFile ******************/
		%feature("compactdefaultargs") IFSelect_SessionFile;
		%feature("autodoc", "Creates a sessionfile which writes the content of a worksession to a file (directly calls write) then, isdone aknowledges on the result of the operation. but such a sessionfile may not read a file to a worksession.

Parameters
----------
WS: IFSelect_WorkSession
filename: char *

Returns
-------
None
") IFSelect_SessionFile;
		 IFSelect_SessionFile(const opencascade::handle<IFSelect_WorkSession> & WS, const char * filename);

		/****************** AddItem ******************/
		%feature("compactdefaultargs") AddItem;
		%feature("autodoc", "Adds an item to the worksession, taken as name the first item of the read line. if this name is not a name but a number or if this name is already recorded in the worksession, it adds the item but with no name. then the name is recorded in order to be used by the method itemvalue <active> commands to make <item> active or not in the session.

Parameters
----------
item: Standard_Transient
active: bool,optional
	default value is Standard_True

Returns
-------
None
") AddItem;
		void AddItem(const opencascade::handle<Standard_Transient> & item, const Standard_Boolean active = Standard_True);

		/****************** AddLine ******************/
		%feature("compactdefaultargs") AddLine;
		%feature("autodoc", "Adds a line to the list of recorded lines.

Parameters
----------
line: char *

Returns
-------
None
") AddLine;
		void AddLine(const char * line);

		/****************** ClearLines ******************/
		%feature("compactdefaultargs") ClearLines;
		%feature("autodoc", "Clears the lines recorded whatever for writing or for reading.

Returns
-------
None
") ClearLines;
		void ClearLines();

		/****************** Destroy ******************/
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "Specific destructor (closes the file if not yet done).

Returns
-------
None
") Destroy;
		void Destroy();

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the last read or write operation has been corectly performed. else returns false.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** IsText ******************/
		%feature("compactdefaultargs") IsText;
		%feature("autodoc", "Returns true if a parameter, in the own list (see nbownparams) is a text (between '...'). else it is an item (parameter, selection, dispatch ...), which can be void.

Parameters
----------
num: int

Returns
-------
bool
") IsText;
		Standard_Boolean IsText(const Standard_Integer num);

		/****************** IsVoid ******************/
		%feature("compactdefaultargs") IsVoid;
		%feature("autodoc", "Returns true if a parameter, given its rank in the own list (see nbownparams), is void. returns also true if <num> is out of range (undefined parameters).

Parameters
----------
num: int

Returns
-------
bool
") IsVoid;
		Standard_Boolean IsVoid(const Standard_Integer num);

		/****************** ItemValue ******************/
		%feature("compactdefaultargs") ItemValue;
		%feature("autodoc", "Returns a parameter as an item. returns a null handle if the parameter is a text, or if it is defined as void.

Parameters
----------
num: int

Returns
-------
opencascade::handle<Standard_Transient>
") ItemValue;
		opencascade::handle<Standard_Transient> ItemValue(const Standard_Integer num);

		/****************** Line ******************/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "Returns a line given its rank in the list of recorded lines.

Parameters
----------
num: int

Returns
-------
TCollection_AsciiString
") Line;
		const TCollection_AsciiString & Line(const Standard_Integer num);

		/****************** NbLines ******************/
		%feature("compactdefaultargs") NbLines;
		%feature("autodoc", "Returns the count of recorded lines.

Returns
-------
int
") NbLines;
		Standard_Integer NbLines();

		/****************** NbParams ******************/
		%feature("compactdefaultargs") NbParams;
		%feature("autodoc", "During a read operation, sessionfile processes sequencially the items to read. for each one, it gives access to the list of its parameters : they were defined by calls to sendvoid/sendparam/sendtext during writing the file. nbparams returns the count of parameters for the line currently read.

Returns
-------
int
") NbParams;
		Standard_Integer NbParams();

		/****************** NewItem ******************/
		%feature("compactdefaultargs") NewItem;
		%feature("autodoc", "At beginning of writing an item, writes its basics : - either its name in the session if it has one - or its relative number of item in the file, else (preceeded by a '_') - then, its dynamic type (in the sense of cdl : pk_class) this basic description can be followed by the parameters which are used in the definition of the item.

Parameters
----------
ident: int
par: Standard_Transient

Returns
-------
None
") NewItem;
		void NewItem(const Standard_Integer ident, const opencascade::handle<Standard_Transient> & par);

		/****************** ParamValue ******************/
		%feature("compactdefaultargs") ParamValue;
		%feature("autodoc", "Returns a parameter (alphanumeric item of a line) as it has been read.

Parameters
----------
num: int

Returns
-------
TCollection_AsciiString
") ParamValue;
		const TCollection_AsciiString & ParamValue(const Standard_Integer num);

		/****************** Read ******************/
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "Performs a read operation from a file to a worksession i.e. calls readfile, then readsession and readend returned value is : 0 for ok, -1 file could not be opened, >0 error during read (see writesession) isdone can be called too (will return true for ok).

Parameters
----------
filename: char *

Returns
-------
int
") Read;
		Standard_Integer Read(const char * filename);

		/****************** ReadEnd ******************/
		%feature("compactdefaultargs") ReadEnd;
		%feature("autodoc", "Reads the end of a file (its last line). returns 0 if ok, status >0 in case of error (not a suitable end line).

Returns
-------
int
") ReadEnd;
		Standard_Integer ReadEnd();

		/****************** ReadFile ******************/
		%feature("compactdefaultargs") ReadFile;
		%feature("autodoc", "Reads the recorded lines from a file named <name>, after having cleared the list (stops if recognizefile fails) returns false (with no clearing) if the file could not be read.

Parameters
----------
name: char *

Returns
-------
bool
") ReadFile;
		Standard_Boolean ReadFile(const char * name);

		/****************** ReadLine ******************/
		%feature("compactdefaultargs") ReadLine;
		%feature("autodoc", "Reads a line and splits it into a set of alphanumeric items, which can then be queried by nbparams/paramvalue ...

Returns
-------
bool
") ReadLine;
		Standard_Boolean ReadLine();

		/****************** ReadOwn ******************/
		%feature("compactdefaultargs") ReadOwn;
		%feature("autodoc", "Tries to read an item, by calling the library of dumpers sets the list of parameters of the line to be read from the first own one.

Parameters
----------
item: Standard_Transient

Returns
-------
bool
") ReadOwn;
		Standard_Boolean ReadOwn(opencascade::handle<Standard_Transient> & item);

		/****************** ReadSession ******************/
		%feature("compactdefaultargs") ReadSession;
		%feature("autodoc", "Performs a read operation from a file to a worksession, i.e. reads the list of line (which must have already been loaded, by readfile or by calls to addline) important remark : this excludes the reading of the last line, which is performed by readend returns 0 for ok, >0 status for read error (not a suitable file, or worksession given as immutable at creation time) isdone can be called too (will return true for ok).

Returns
-------
int
") ReadSession;
		Standard_Integer ReadSession();

		/****************** RecognizeFile ******************/
		%feature("compactdefaultargs") RecognizeFile;
		%feature("autodoc", "Recognizes the header line. returns true if ok, false else.

Parameters
----------
headerline: char *

Returns
-------
bool
") RecognizeFile;
		Standard_Boolean RecognizeFile(const char * headerline);

		/****************** RemoveLastLine ******************/
		%feature("compactdefaultargs") RemoveLastLine;
		%feature("autodoc", "Removes the last line. can be called recursively. does nothing if the list is empty.

Returns
-------
None
") RemoveLastLine;
		void RemoveLastLine();

		/****************** SendItem ******************/
		%feature("compactdefaultargs") SendItem;
		%feature("autodoc", "During a write action, commands to send the identification of a parameter : if it is null (undefined) it is send as void ($) if it is named in the worksession, its name is sent preceeded by ':', else a relative ident number is sent preceeded by '#' (relative to the present write, i.e. starting at one, without skip, and counted part from named items).

Parameters
----------
par: Standard_Transient

Returns
-------
None
") SendItem;
		void SendItem(const opencascade::handle<Standard_Transient> & par);

		/****************** SendText ******************/
		%feature("compactdefaultargs") SendText;
		%feature("autodoc", "During a write action, commands to send a text without interpretation. it will be sent as well.

Parameters
----------
text: char *

Returns
-------
None
") SendText;
		void SendText(const char * text);

		/****************** SendVoid ******************/
		%feature("compactdefaultargs") SendVoid;
		%feature("autodoc", "During a write action, commands to send a void parameter i.e. a parameter which is present but undefined its form will be the dollar sign : $.

Returns
-------
None
") SendVoid;
		void SendVoid();

		/****************** SetLastGeneral ******************/
		%feature("compactdefaultargs") SetLastGeneral;
		%feature("autodoc", "Sets the rank of last general parameter to a new value. it is followed by the fist own parameter of the item. used by sessionfile after reading general parameters.

Parameters
----------
lastgen: int

Returns
-------
None
") SetLastGeneral;
		void SetLastGeneral(const Standard_Integer lastgen);

		/****************** SetOwn ******************/
		%feature("compactdefaultargs") SetOwn;
		%feature("autodoc", "Sets parameters to be sent as own if <mode> is true (their name or number or void mark or text value is preceeded by a column sign ':') else they are sent normally hence, the own parameter are clearly identified in the file.

Parameters
----------
mode: bool

Returns
-------
None
") SetOwn;
		void SetOwn(const Standard_Boolean mode);

		/****************** SplitLine ******************/
		%feature("compactdefaultargs") SplitLine;
		%feature("autodoc", "Internal routine which processes a line into words and prepares its exploration.

Parameters
----------
line: char *

Returns
-------
None
") SplitLine;
		void SplitLine(const char * line);

		/****************** TextValue ******************/
		%feature("compactdefaultargs") TextValue;
		%feature("autodoc", "Returns the content of a text parameter (without the quotes). returns an empty string if the parameter is not a text.

Parameters
----------
num: int

Returns
-------
TCollection_AsciiString
") TextValue;
		TCollection_AsciiString TextValue(const Standard_Integer num);

		/****************** WorkSession ******************/
		%feature("compactdefaultargs") WorkSession;
		%feature("autodoc", "Returns the worksession on which a sessionfile works. remark that it is returned as immutable.

Returns
-------
opencascade::handle<IFSelect_WorkSession>
") WorkSession;
		opencascade::handle<IFSelect_WorkSession> WorkSession();

		/****************** Write ******************/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "Performs a write operation from a worksession to a file i.e. calls writesession then writeend, and writefile returned value is : 0 for ok, -1 file could not be created, >0 error during write (see writesession) isdone can be called too (will return true for ok).

Parameters
----------
filename: char *

Returns
-------
int
") Write;
		Standard_Integer Write(const char * filename);

		/****************** WriteEnd ******************/
		%feature("compactdefaultargs") WriteEnd;
		%feature("autodoc", "Writes the trailing line. it is separate from writesession, in order to allow to redefine writesession without touching writeend (writesession defines the body of the file) writeend fills the list of lines. returns a status of error, 0 if ok, >0 else.

Returns
-------
int
") WriteEnd;
		Standard_Integer WriteEnd();

		/****************** WriteFile ******************/
		%feature("compactdefaultargs") WriteFile;
		%feature("autodoc", "Writes the recorded lines to a file named <name> then clears the list of lines. returns false (with no clearing) if the file could not be created.

Parameters
----------
name: char *

Returns
-------
bool
") WriteFile;
		Standard_Boolean WriteFile(const char * name);

		/****************** WriteLine ******************/
		%feature("compactdefaultargs") WriteLine;
		%feature("autodoc", "Writes a line to the file. if <follow> is given, it is added at the following of the line. a newline must be added for the end.

Parameters
----------
line: char *
follow: Standard_Character,optional
	default value is 0

Returns
-------
None
") WriteLine;
		void WriteLine(const char * line, const Standard_Character follow = 0);

		/****************** WriteOwn ******************/
		%feature("compactdefaultargs") WriteOwn;
		%feature("autodoc", "Writes the parameters own to each type of item. uses the library of sessiondumpers returns true if done, false if <item> could not be treated (hence it remains written with no own parameter).

Parameters
----------
item: Standard_Transient

Returns
-------
bool
") WriteOwn;
		Standard_Boolean WriteOwn(const opencascade::handle<Standard_Transient> & item);

		/****************** WriteSession ******************/
		%feature("compactdefaultargs") WriteSession;
		%feature("autodoc", "Prepares the write operation from a worksession (ifselect) to a file, i.e. fills the list of lines (the file itself remains to be written; or nblines/line may be called) important remark : this excludes the reading of the last line, which is performed by writeend returns 0 if ok, status > 0 in case of error.

Returns
-------
int
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
		/****************** IFSelect_ShareOut ******************/
		%feature("compactdefaultargs") IFSelect_ShareOut;
		%feature("autodoc", "Creates an empty shareout.

Returns
-------
None
") IFSelect_ShareOut;
		 IFSelect_ShareOut();

		/****************** AddDispatch ******************/
		%feature("compactdefaultargs") AddDispatch;
		%feature("autodoc", "Adds a dispatch to the list.

Parameters
----------
disp: IFSelect_Dispatch

Returns
-------
None
") AddDispatch;
		void AddDispatch(const opencascade::handle<IFSelect_Dispatch> & disp);

		/****************** AddModif ******************/
		%feature("compactdefaultargs") AddModif;
		%feature("autodoc", "Adds a modifier to the list of modifiers : model modifiers if <formodel> is true, file modifiers else (internal).

Parameters
----------
modifier: IFSelect_GeneralModifier
formodel: bool
atnum: int,optional
	default value is 0

Returns
-------
None
") AddModif;
		void AddModif(const opencascade::handle<IFSelect_GeneralModifier> & modifier, const Standard_Boolean formodel, const Standard_Integer atnum = 0);

		/****************** AddModifier ******************/
		%feature("compactdefaultargs") AddModifier;
		%feature("autodoc", "Sets a modifier to be applied on all dispatches to be run if <modifier> is a modelmodifier, adds it to the list of model modifiers; else to the list of file modifiers by default (atnum = 0) at the end of the list, else at <atnum> each modifier is used, after each copy of a packet of entities into a model : its criteria are checked and if they are ok, the method perform of this modifier is run.

Parameters
----------
modifier: IFSelect_GeneralModifier
atnum: int

Returns
-------
None
") AddModifier;
		void AddModifier(const opencascade::handle<IFSelect_GeneralModifier> & modifier, const Standard_Integer atnum);

		/****************** AddModifier ******************/
		%feature("compactdefaultargs") AddModifier;
		%feature("autodoc", "Sets a modifier to be applied on the dispatch <dispnum> if <modifier> is a modelmodifier, adds it to the list of model modifiers; else to the list of file modifiers this is the same list as for all dispatches, but the modifier is qualified to be applied to one dispatch only then, <atnum> refers to the entire list by default (atnum = 0) at the end of the list, else at <atnum> remark : if the modifier was already in the list and if <atnum> = 0, the modifier is not moved, but only qualified for a dispatch.

Parameters
----------
modifier: IFSelect_GeneralModifier
dispnum: int
atnum: int

Returns
-------
None
") AddModifier;
		void AddModifier(const opencascade::handle<IFSelect_GeneralModifier> & modifier, const Standard_Integer dispnum, const Standard_Integer atnum);

		/****************** ChangeModifierRank ******************/
		%feature("compactdefaultargs") ChangeModifierRank;
		%feature("autodoc", "Changes the rank of a modifier in the list : model modifiers if <formodel> is true, file modifiers else from <before> to <after> returns true if done, false else (before or after out of range).

Parameters
----------
formodel: bool
befor: int
after: int

Returns
-------
bool
") ChangeModifierRank;
		Standard_Boolean ChangeModifierRank(const Standard_Boolean formodel, const Standard_Integer befor, const Standard_Integer after);

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Removes in one operation all the dispatches with their idents also clears all informations about names, and all results but naming informations which are : - kept if <onlydisp> is true. - cleared if <onlydisp> is false (complete clearing) if <onlydisp> is true, that's all. else, clears also modifiers.

Parameters
----------
onlydisp: bool

Returns
-------
None
") Clear;
		void Clear(const Standard_Boolean onlydisp);

		/****************** ClearResult ******************/
		%feature("compactdefaultargs") ClearResult;
		%feature("autodoc", "Clears all data produced (apart from dispatches, etc...) if <alsoname> is true, all is cleared. else, informations about produced names are kept (to maintain unicity of naming across clearings).

Parameters
----------
alsoname: bool

Returns
-------
None
") ClearResult;
		void ClearResult(const Standard_Boolean alsoname);

		/****************** DefaultRootName ******************/
		%feature("compactdefaultargs") DefaultRootName;
		%feature("autodoc", "Returns the default root name. can be empty.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") DefaultRootName;
		opencascade::handle<TCollection_HAsciiString> DefaultRootName();

		/****************** Dispatch ******************/
		%feature("compactdefaultargs") Dispatch;
		%feature("autodoc", "Returns a dispatch, given its rank in the list.

Parameters
----------
num: int

Returns
-------
opencascade::handle<IFSelect_Dispatch>
") Dispatch;
		const opencascade::handle<IFSelect_Dispatch> & Dispatch(const Standard_Integer num);

		/****************** DispatchRank ******************/
		%feature("compactdefaultargs") DispatchRank;
		%feature("autodoc", "Returns the rank of a dispatch, given its value (handle). returns 0 if the dispatch is unknown in the shareout.

Parameters
----------
disp: IFSelect_Dispatch

Returns
-------
int
") DispatchRank;
		Standard_Integer DispatchRank(const opencascade::handle<IFSelect_Dispatch> & disp);

		/****************** Extension ******************/
		%feature("compactdefaultargs") Extension;
		%feature("autodoc", "Returns the general extension. can be empty (not recommanded).

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Extension;
		opencascade::handle<TCollection_HAsciiString> Extension();

		/****************** FileName ******************/
		%feature("compactdefaultargs") FileName;
		%feature("autodoc", "Computes the complete file name for a packet of a dispatch, given dispatch number (rank), packet number, and count of packets generated by this dispatch (0 if unknown) //! file name is made of following strings, concatenated : general prefix, root name for dispatch, packet suffix, and general extension. if no root name is specified for a dispatch, defaultrootname is considered (and pnum is not used, but <thenbdefs> is incremented and used error if no root is defined for this <idnum>.

Parameters
----------
dnum: int
pnum: int
nbpack: int,optional
	default value is 0

Returns
-------
TCollection_AsciiString
") FileName;
		TCollection_AsciiString FileName(const Standard_Integer dnum, const Standard_Integer pnum, const Standard_Integer nbpack = 0);

		/****************** GeneralModifier ******************/
		%feature("compactdefaultargs") GeneralModifier;
		%feature("autodoc", "Returns a modifier of the list, given its rank : model modifiers if <formodel> is true, file modifiers else.

Parameters
----------
formodel: bool
num: int

Returns
-------
opencascade::handle<IFSelect_GeneralModifier>
") GeneralModifier;
		opencascade::handle<IFSelect_GeneralModifier> GeneralModifier(const Standard_Boolean formodel, const Standard_Integer num);

		/****************** HasRootName ******************/
		%feature("compactdefaultargs") HasRootName;
		%feature("autodoc", "Returns true if the dispatch of rank <num> has an attached root name. false else, or if num is out of range.

Parameters
----------
num: int

Returns
-------
bool
") HasRootName;
		Standard_Boolean HasRootName(const Standard_Integer num);

		/****************** LastRun ******************/
		%feature("compactdefaultargs") LastRun;
		%feature("autodoc", "Returns the rank of last run item (clearresult resets it to 0).

Returns
-------
int
") LastRun;
		Standard_Integer LastRun();

		/****************** ModelModifier ******************/
		%feature("compactdefaultargs") ModelModifier;
		%feature("autodoc", "Returns a modifier of the list of model modifiers, duely casted.

Parameters
----------
num: int

Returns
-------
opencascade::handle<IFSelect_Modifier>
") ModelModifier;
		opencascade::handle<IFSelect_Modifier> ModelModifier(const Standard_Integer num);

		/****************** ModifierRank ******************/
		%feature("compactdefaultargs") ModifierRank;
		%feature("autodoc", "Gives the rank of a modifier in the list, 0 if not in the list model modifiers if <modifier> is kind of modelmodifer, file modifiers else.

Parameters
----------
modifier: IFSelect_GeneralModifier

Returns
-------
int
") ModifierRank;
		Standard_Integer ModifierRank(const opencascade::handle<IFSelect_GeneralModifier> & modifier);

		/****************** NbDispatches ******************/
		%feature("compactdefaultargs") NbDispatches;
		%feature("autodoc", "Returns the count of dispatches.

Returns
-------
int
") NbDispatches;
		Standard_Integer NbDispatches();

		/****************** NbModifiers ******************/
		%feature("compactdefaultargs") NbModifiers;
		%feature("autodoc", "Returns count of modifiers (which apply to complete models) : model modifiers if <formodel> is true, file modifiers else.

Parameters
----------
formodel: bool

Returns
-------
int
") NbModifiers;
		Standard_Integer NbModifiers(const Standard_Boolean formodel);

		/****************** Prefix ******************/
		%feature("compactdefaultargs") Prefix;
		%feature("autodoc", "Returns the general prefix. can be empty.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Prefix;
		opencascade::handle<TCollection_HAsciiString> Prefix();

		/****************** RemoveDispatch ******************/
		%feature("compactdefaultargs") RemoveDispatch;
		%feature("autodoc", "Removes a dispatch, given its rank in the list returns true if done, false if rank is not between (lastrun + 1) and (nbdispatches).

Parameters
----------
rank: int

Returns
-------
bool
") RemoveDispatch;
		Standard_Boolean RemoveDispatch(const Standard_Integer rank);

		/****************** RemoveItem ******************/
		%feature("compactdefaultargs") RemoveItem;
		%feature("autodoc", "Removes an item, which can be, either a dispatch (removed from the list of dispatches), or a generalmodifier (removed from the list of model modifiers or from the list of file modifiers according to its type). returns true if done, false if has not been found or if it is neither a dispatch, nor a modifier.

Parameters
----------
item: Standard_Transient

Returns
-------
bool
") RemoveItem;
		Standard_Boolean RemoveItem(const opencascade::handle<Standard_Transient> & item);

		/****************** RemoveModifier ******************/
		%feature("compactdefaultargs") RemoveModifier;
		%feature("autodoc", "Removes a modifier, given it rank in the list : model modifiers if <formodel> is true, file modifiers else returns true if done, false if <num> is out of range.

Parameters
----------
formodel: bool
num: int

Returns
-------
bool
") RemoveModifier;
		Standard_Boolean RemoveModifier(const Standard_Boolean formodel, const Standard_Integer num);

		/****************** RootName ******************/
		%feature("compactdefaultargs") RootName;
		%feature("autodoc", "Returns the root bound to a dispatch, given its rank returns a null handle if not defined.

Parameters
----------
num: int

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") RootName;
		opencascade::handle<TCollection_HAsciiString> RootName(const Standard_Integer num);

		/****************** RootNumber ******************/
		%feature("compactdefaultargs") RootNumber;
		%feature("autodoc", "Returns an integer value about a given root name : - positive : it's the rank of the dispatch which has this name - null : this root name is unknown - negative (-1) : this root name is the default root name.

Parameters
----------
name: TCollection_HAsciiString

Returns
-------
int
") RootNumber;
		Standard_Integer RootNumber(const opencascade::handle<TCollection_HAsciiString> & name);

		/****************** SetDefaultRootName ******************/
		%feature("compactdefaultargs") SetDefaultRootName;
		%feature("autodoc", "Defines or changes the default root name to a new value (which is used for dispatches which have no attached root name). if this method is not called, defaultrootname remains empty returns true if ok, false if this name is already attached, for a dispatch or for default.

Parameters
----------
defrt: TCollection_HAsciiString

Returns
-------
bool
") SetDefaultRootName;
		Standard_Boolean SetDefaultRootName(const opencascade::handle<TCollection_HAsciiString> & defrt);

		/****************** SetExtension ******************/
		%feature("compactdefaultargs") SetExtension;
		%feature("autodoc", "Defines or changes the general extension (which is appended to complete file name generated). if this method is not call, extension remains empty.

Parameters
----------
ext: TCollection_HAsciiString

Returns
-------
None
") SetExtension;
		void SetExtension(const opencascade::handle<TCollection_HAsciiString> & ext);

		/****************** SetLastRun ******************/
		%feature("compactdefaultargs") SetLastRun;
		%feature("autodoc", "Records a new alue for the rank of last run item.

Parameters
----------
last: int

Returns
-------
None
") SetLastRun;
		void SetLastRun(const Standard_Integer last);

		/****************** SetPrefix ******************/
		%feature("compactdefaultargs") SetPrefix;
		%feature("autodoc", "Defines or changes the general prefix (which is prepended to complete file name generated). if this method is not call, prefix remains empty.

Parameters
----------
pref: TCollection_HAsciiString

Returns
-------
None
") SetPrefix;
		void SetPrefix(const opencascade::handle<TCollection_HAsciiString> & pref);

		/****************** SetRootName ******************/
		%feature("compactdefaultargs") SetRootName;
		%feature("autodoc", "Attaches a root name to a dispatch given its rank, as an hasciistring (standard form). a null handle resets this name. returns true if ok, false if this name is already attached, for a dispatch or for default, or <num> out of range.

Parameters
----------
num: int
name: TCollection_HAsciiString

Returns
-------
bool
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
		/****************** IFSelect_ShareOutResult ******************/
		%feature("compactdefaultargs") IFSelect_ShareOutResult;
		%feature("autodoc", "Creates a shareoutresult from a shareout, to work on a model (without any more precision; uses active protocol).

Parameters
----------
sho: IFSelect_ShareOut
mod: Interface_InterfaceModel

Returns
-------
None
") IFSelect_ShareOutResult;
		 IFSelect_ShareOutResult(const opencascade::handle<IFSelect_ShareOut> & sho, const opencascade::handle<Interface_InterfaceModel> & mod);

		/****************** IFSelect_ShareOutResult ******************/
		%feature("compactdefaultargs") IFSelect_ShareOutResult;
		%feature("autodoc", "Creates a shareoutresult from a shareout, to work on a graph already computed, which defines the input model and can specialize some entities.

Parameters
----------
sho: IFSelect_ShareOut
G: Interface_Graph

Returns
-------
None
") IFSelect_ShareOutResult;
		 IFSelect_ShareOutResult(const opencascade::handle<IFSelect_ShareOut> & sho, const Interface_Graph & G);

		/****************** IFSelect_ShareOutResult ******************/
		%feature("compactdefaultargs") IFSelect_ShareOutResult;
		%feature("autodoc", "Creates a shareoutresult from a unique dispatch, to work on a model. as if it was a shareout with only one dispatch (without any more precision; uses active protocol) allows to compute the effect of a single dispatch.

Parameters
----------
disp: IFSelect_Dispatch
mod: Interface_InterfaceModel

Returns
-------
None
") IFSelect_ShareOutResult;
		 IFSelect_ShareOutResult(const opencascade::handle<IFSelect_Dispatch> & disp, const opencascade::handle<Interface_InterfaceModel> & mod);

		/****************** IFSelect_ShareOutResult ******************/
		%feature("compactdefaultargs") IFSelect_ShareOutResult;
		%feature("autodoc", "Creates a shareoutresult from a unique dispatch, to work on a graph. as if it was a shareout with only one dispatch allows to compute the effect of a single dispatch.

Parameters
----------
disp: IFSelect_Dispatch
G: Interface_Graph

Returns
-------
None
") IFSelect_ShareOutResult;
		 IFSelect_ShareOutResult(const opencascade::handle<IFSelect_Dispatch> & disp, const Interface_Graph & G);

		/****************** Dispatch ******************/
		%feature("compactdefaultargs") Dispatch;
		%feature("autodoc", "Returns the current dispatch.

Returns
-------
opencascade::handle<IFSelect_Dispatch>
") Dispatch;
		opencascade::handle<IFSelect_Dispatch> Dispatch();

		/****************** DispatchRank ******************/
		%feature("compactdefaultargs") DispatchRank;
		%feature("autodoc", "Returns the rank of the current dispatch in the shareout returns zero if there is none (iteration finished).

Returns
-------
int
") DispatchRank;
		Standard_Integer DispatchRank();

		/****************** Evaluate ******************/
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "Evaluates the result of a shareout : determines entities to be forgotten by the shareout, entities to be transferred several times (duplicated), prepares an iteration on the packets to be produced called the first time anyone question is asked, or after a call to reset. works by calling the method prepare.

Returns
-------
None
") Evaluate;
		void Evaluate();

		/****************** FileName ******************/
		%feature("compactdefaultargs") FileName;
		%feature("autodoc", "Returns the file name which corresponds to current packet (computed by shareout) if current packet has no associated name (see shareout), the returned value is null.

Returns
-------
TCollection_AsciiString
") FileName;
		TCollection_AsciiString FileName();

		/****************** Graph ******************/
		%feature("compactdefaultargs") Graph;
		%feature("autodoc", "Returns the graph used to create theshareoutresult.

Returns
-------
Interface_Graph
") Graph;
		const Interface_Graph & Graph();

		/****************** More ******************/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Returns true if there is more packets in the current dispatch, else if there is more dispatch in the shareout.

Returns
-------
bool
") More;
		Standard_Boolean More();

		/****************** NbPackets ******************/
		%feature("compactdefaultargs") NbPackets;
		%feature("autodoc", "Returns the total count of produced non empty packets (in out : calls evaluate as necessary).

Returns
-------
int
") NbPackets;
		Standard_Integer NbPackets();

		/****************** Next ******************/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Passes to the next packet in the current dispatch, or if there is none, to the next dispatch in the shareout.

Returns
-------
None
") Next;
		void Next();

		/****************** NextDispatch ******************/
		%feature("compactdefaultargs") NextDispatch;
		%feature("autodoc", "Passes to the next dispatch, regardless about remaining packets.

Returns
-------
None
") NextDispatch;
		void NextDispatch();

		/****************** PacketContent ******************/
		%feature("compactdefaultargs") PacketContent;
		%feature("autodoc", "Returns the complete content of the current packet (i.e. with shared entities, which will also be put in the file).

Returns
-------
Interface_EntityIterator
") PacketContent;
		Interface_EntityIterator PacketContent();

		/****************** PacketRoot ******************/
		%feature("compactdefaultargs") PacketRoot;
		%feature("autodoc", "Returns the list of roots of the current packet (never empty) (i.e. the entities to be themselves asked for transfer) error if there is none (iteration finished).

Returns
-------
Interface_EntityIterator
") PacketRoot;
		Interface_EntityIterator PacketRoot();

		/****************** Packets ******************/
		%feature("compactdefaultargs") Packets;
		%feature("autodoc", "Returns the list of recorded packets, under two modes : - <complete> = false, the strict definition of packets, i.e. for each one, the root entities, to be explicitely sent - <complete> = true (default), the completely evaluated list, i.e. which really gives the destination of each entity : this mode allows to evaluate duplications remark that to send packets, iteration remains preferable (file names are managed).

Parameters
----------
complete: bool,optional
	default value is Standard_True

Returns
-------
opencascade::handle<IFSelect_PacketList>
") Packets;
		opencascade::handle<IFSelect_PacketList> Packets(const Standard_Boolean complete = Standard_True);

		/****************** PacketsInDispatch ******************/
		%feature("compactdefaultargs") PacketsInDispatch;
		%feature("autodoc", "Returns number (rank) of current packet in current dispatch, and total count of packets in current dispatch, as arguments.

Parameters
----------

Returns
-------
numpack: int
nbpacks: int
") PacketsInDispatch;
		void PacketsInDispatch(Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** Prepare ******************/
		%feature("compactdefaultargs") Prepare;
		%feature("autodoc", "Prepares the iteration on the packets this method is called by evaluate, but can be called anytime the iteration consists in taking each dispatch of the shareout beginning by the first one, compute its packets, then iterate on these packets. once all these packets are iterated, the iteration passes to the next dispatch, or stops. for a creation from a unique dispatch, same but with only this dispatch. each packet can be listed, or really transferred (producing a derived model, from which a file can be generated) //! prepare sets the iteration to the first dispatch, first packet.

Returns
-------
None
") Prepare;
		void Prepare();

		/****************** Reset ******************/
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", "Erases computed data, in order to command a new evaluation.

Returns
-------
None
") Reset;
		void Reset();

		/****************** ShareOut ******************/
		%feature("compactdefaultargs") ShareOut;
		%feature("autodoc", "Returns the shareout used to create the shareoutresult if creation from a dispatch, returns a null handle.

Returns
-------
opencascade::handle<IFSelect_ShareOut>
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
		/****************** AddCase ******************/
		%feature("compactdefaultargs") AddCase;
		%feature("autodoc", "Adds a possible case to be called when creating, if the list of possible cases for value is known when starting for instance, for cdl types, rather do not fill this, but for a specific enumeration (such as a status), can be used.

Parameters
----------
acase: char *

Returns
-------
None
") AddCase;
		void AddCase(const char * acase);

		/****************** CaseList ******************/
		%feature("compactdefaultargs") CaseList;
		%feature("autodoc", "Returns the predefined list of possible cases, filled by addcase null handle if no predefined list (hence, to be counted) useful to filter on really possible vase, for instance, or for a help.

Returns
-------
opencascade::handle<TColStd_HSequenceOfAsciiString>
") CaseList;
		opencascade::handle<TColStd_HSequenceOfAsciiString> CaseList();

		/****************** IntValue ******************/
		%feature("compactdefaultargs") IntValue;
		%feature("autodoc", "This procedure converts an integer to a cstring it is a convenient way when the value of a signature has the form of a simple integer value the value is to be used immediately (one buffer only, no copy).

Parameters
----------
val: int

Returns
-------
char *
") IntValue;
		static const char * IntValue(const Standard_Integer val);

		/****************** IsIntCase ******************/
		%feature("compactdefaultargs") IsIntCase;
		%feature("autodoc", "Tells if this signature gives integer values and returns values from setintcase if true.

Parameters
----------

Returns
-------
hasmin: bool
valmin: int
hasmax: bool
valmax: int
") IsIntCase;
		Standard_Boolean IsIntCase(Standard_Boolean &OutValue, Standard_Integer &OutValue, Standard_Boolean &OutValue, Standard_Integer &OutValue);

		/****************** Label ******************/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "The label of a signature uses its name as follow : 'signature : <name>'.

Returns
-------
TCollection_AsciiString
") Label;
		TCollection_AsciiString Label();

		/****************** MatchValue ******************/
		%feature("compactdefaultargs") MatchValue;
		%feature("autodoc", "Default procedure to tell if a value <val> matches a text with a criterium <exact>. <exact> = true requires equality, else only contained (no reg-exp).

Parameters
----------
val: char *
text: TCollection_AsciiString
exact: bool

Returns
-------
bool
") MatchValue;
		static Standard_Boolean MatchValue(const char * val, const TCollection_AsciiString & text, const Standard_Boolean exact);

		/****************** Matches ******************/
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "Tells if the value for <ent> in <model> matches a text, with a criterium <exact>. the default definition calls matchvalue can be redefined.

Parameters
----------
ent: Standard_Transient
model: Interface_InterfaceModel
text: TCollection_AsciiString
exact: bool

Returns
-------
bool
") Matches;
		virtual Standard_Boolean Matches(const opencascade::handle<Standard_Transient> & ent, const opencascade::handle<Interface_InterfaceModel> & model, const TCollection_AsciiString & text, const Standard_Boolean exact);

		/****************** Name ******************/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Returns an identification of the signature (a word), given at initialization time returns the signature for a transient object. it is specific of each sub-class of signature. for a null handle, it should provide '' it can work with the model which contains the entity.

Returns
-------
char *
") Name;
		const char * Name();

		/****************** SetIntCase ******************/
		%feature("compactdefaultargs") SetIntCase;
		%feature("autodoc", "Sets the information data to tell 'integer cases' with possible min and max values to be called when creating.

Parameters
----------
hasmin: bool
valmin: int
hasmax: bool
valmax: int

Returns
-------
None
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
		/****************** IFSelect_SignatureList ******************/
		%feature("compactdefaultargs") IFSelect_SignatureList;
		%feature("autodoc", "Creates a signaturelist. if <withlist> is true, entities will be not only counted per signature, but also listed.

Parameters
----------
withlist: bool,optional
	default value is Standard_False

Returns
-------
None
") IFSelect_SignatureList;
		 IFSelect_SignatureList(const Standard_Boolean withlist = Standard_False);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Adds an entity with its signature, i.e. : - counts an item more for <sign> - if record-list status is set, records the entity accepts a null entity (the signature is then for the global model). but if the string is empty, counts a null item. //! if signonly mode is set, this work is replaced by just setting lastvalue.

Parameters
----------
ent: Standard_Transient
sign: char *

Returns
-------
None
") Add;
		void Add(const opencascade::handle<Standard_Transient> & ent, const char * sign);

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Clear;
		virtual void Clear();

		/****************** Entities ******************/
		%feature("compactdefaultargs") Entities;
		%feature("autodoc", "Returns the list of entities attached to a signature it is empty if <sign> has not been recorded it is a null handle if the list of entities is not known.

Parameters
----------
sign: char *

Returns
-------
opencascade::handle<TColStd_HSequenceOfTransient>
") Entities;
		opencascade::handle<TColStd_HSequenceOfTransient> Entities(const char * sign);

		/****************** HasEntities ******************/
		%feature("compactdefaultargs") HasEntities;
		%feature("autodoc", "Returns true if the list of entities is aknowledged, else the method entities will always return a null handle.

Returns
-------
bool
") HasEntities;
		Standard_Boolean HasEntities();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Aknowledges the list in once. name identifies the signature.

Parameters
----------
name: char *
count: NCollection_IndexedDataMap<TCollection_AsciiString, int>
list: Standard_Transient
nbnuls: int

Returns
-------
None
") Init;
		void Init(const char * name, const NCollection_IndexedDataMap<TCollection_AsciiString, Standard_Integer> & count, const NCollection_IndexedDataMap<TCollection_AsciiString, opencascade::handle<Standard_Transient> > & list, const Standard_Integer nbnuls);

		/****************** LastValue ******************/
		%feature("compactdefaultargs") LastValue;
		%feature("autodoc", "Returns the last value recorded by add (only if signmode set) cleared by clear or init.

Returns
-------
char *
") LastValue;
		const char * LastValue();

		/****************** List ******************/
		%feature("compactdefaultargs") List;
		%feature("autodoc", "Returns the list of signatures, as a sequence of strings (but without their respective counts). it is ordered. by default, for all the signatures. if <root> is given non empty, for the signatures which begin by <root>.

Parameters
----------
root: char *,optional
	default value is ""

Returns
-------
opencascade::handle<TColStd_HSequenceOfHAsciiString>
") List;
		opencascade::handle<TColStd_HSequenceOfHAsciiString> List(const char * root = "");


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
		/****************** Name ******************/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Returns the recorded name. remark : default is '...' (no setname called).

Returns
-------
char *
") Name;
		virtual const char * Name();

		/****************** NbNulls ******************/
		%feature("compactdefaultargs") NbNulls;
		%feature("autodoc", "Returns the count of null entities.

Returns
-------
int
") NbNulls;
		Standard_Integer NbNulls();

		/****************** NbTimes ******************/
		%feature("compactdefaultargs") NbTimes;
		%feature("autodoc", "Returns the number of times a signature was counted, 0 if it has not been recorded at all.

Parameters
----------
sign: char *

Returns
-------
int
") NbTimes;
		Standard_Integer NbTimes(const char * sign);

		/****************** PrintCount ******************/
		%feature("compactdefaultargs") PrintCount;
		%feature("autodoc", "Prints the counts of items (not the list).

Parameters
----------
S: Message_Messenger

Returns
-------
None
") PrintCount;
		virtual void PrintCount(const opencascade::handle<Message_Messenger> & S);

		/****************** PrintList ******************/
		%feature("compactdefaultargs") PrintList;
		%feature("autodoc", "Prints the lists of items, if they are present (else, prints a message 'no list available') uses <model> to determine for each entity to be listed, its number, and its specific identifier (by printlabel) <mod> gives a mode for printing : - countbyitem : just count (as printcount) - shortbyitem : minimum i.e. count plus 5 first entity numbers - shortbyitem(d) complete list of entity numbers (0: 'global') - entitiesbyitem : list of (entity number/printlabel from the model) other modes are ignored.

Parameters
----------
S: Message_Messenger
model: Interface_InterfaceModel
mod: IFSelect_PrintCount,optional
	default value is IFSelect_ListByItem

Returns
-------
None
") PrintList;
		virtual void PrintList(const opencascade::handle<Message_Messenger> & S, const opencascade::handle<Interface_InterfaceModel> & model, const IFSelect_PrintCount mod = IFSelect_ListByItem);

		/****************** PrintSum ******************/
		%feature("compactdefaultargs") PrintSum;
		%feature("autodoc", "Prints a summary item which has the greatest count of entities for items which are numeric values : their count, maximum, minimum values, cumul, average.

Parameters
----------
S: Message_Messenger

Returns
-------
None
") PrintSum;
		virtual void PrintSum(const opencascade::handle<Message_Messenger> & S);

		/****************** SetList ******************/
		%feature("compactdefaultargs") SetList;
		%feature("autodoc", "Changes the record-list status. the list is not cleared but its use changes.

Parameters
----------
withlist: bool

Returns
-------
None
") SetList;
		void SetList(const Standard_Boolean withlist);

		/****************** SetName ******************/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "Defines a name for a signaturelist (used to print it).

Parameters
----------
name: char *

Returns
-------
None
") SetName;
		void SetName(const char * name);

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
		/****************** ChangeProtocol ******************/
		%feature("compactdefaultargs") ChangeProtocol;
		%feature("autodoc", "This methods allows to declare that the protocol applied to the new model has changed. it applies to the last call to perform. //! returns true if the protocol has changed, false else. the provided default keeps the starting protocol. this method should be redefined as required by the effect of perform.

Parameters
----------
newproto: Interface_Protocol

Returns
-------
bool
") ChangeProtocol;
		virtual Standard_Boolean ChangeProtocol(opencascade::handle<Interface_Protocol> & newproto);

		/****************** Label ******************/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "Returns a text which defines the way a transformer works (to identify the transformation it performs).

Returns
-------
TCollection_AsciiString
") Label;
		virtual TCollection_AsciiString Label();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Performs a transformation (defined by each sub-class) : <g> gives the input data (especially the starting model) and can be used for queries (by selections, etc...) <protocol> allows to work with general services as necessary (it applies to input data) if the change corresponds to a conversion to a new protocol, see also the method changeprotocol <checks> stores produced checks messages if any <newmod> gives the result of the transformation : - if it is null (i.e. has not been affected), the transformation has been made on the spot, it is assumed to cause no change to the graph of dependances - if it equates the starting model, it has been transformed on the spot (possibiliy some entities were replaced inside it) - if it is new, it corresponds to a new data set which replaces the starting one //! <self> is mutable to allow results for changeprotocol to be memorized if needed, and to store informations useful for the method updated //! returns true if done, false if an error occured : in this case, if a new data set has been produced, the transformation is ignored, else data may be corrupted.

Parameters
----------
G: Interface_Graph
protocol: Interface_Protocol
checks: Interface_CheckIterator
newmod: Interface_InterfaceModel

Returns
-------
bool
") Perform;
		virtual Standard_Boolean Perform(const Interface_Graph & G, const opencascade::handle<Interface_Protocol> & protocol, Interface_CheckIterator & checks, opencascade::handle<Interface_InterfaceModel> & newmod);

		/****************** Updated ******************/
		%feature("compactdefaultargs") Updated;
		%feature("autodoc", "This method allows to know what happened to a starting entity after the last perform. if <entfrom> (from starting model) has one and only one known item which corresponds in the new produced model, this method must return true and fill the argument <entto>. else, it returns false.

Parameters
----------
entfrom: Standard_Transient
entto: Standard_Transient

Returns
-------
bool
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
		/****************** CopyModel ******************/
		%feature("compactdefaultargs") CopyModel;
		%feature("autodoc", "Performs the copy of entities from an original model to a new one. it must also copy headers if any. returns true when done. the provided default works by copying the individual entities designated in the list, by using the general service class copytool. it can be redefined for a norm which, either implements copy by another way (do not forget to bind each copied result with its original entity in tc) and returns true, or does not know how to copy and returns false.

Parameters
----------
original: Interface_InterfaceModel
newmodel: Interface_InterfaceModel
list: Interface_EntityIterator
TC: Interface_CopyTool

Returns
-------
bool
") CopyModel;
		virtual Standard_Boolean CopyModel(const opencascade::handle<Interface_InterfaceModel> & original, const opencascade::handle<Interface_InterfaceModel> & newmodel, const Interface_EntityIterator & list, Interface_CopyTool & TC);

		/****************** DumpEntity ******************/
		%feature("compactdefaultargs") DumpEntity;
		%feature("autodoc", "Gives the way of dumping an entity under a form comprehensive for each norm. <model> helps to identify, number ... entities. <level> is to be interpreted for each norm (because of the formats which can be very different).

Parameters
----------
model: Interface_InterfaceModel
protocol: Interface_Protocol
entity: Standard_Transient
S: Message_Messenger
level: int

Returns
-------
None
") DumpEntity;
		virtual void DumpEntity(const opencascade::handle<Interface_InterfaceModel> & model, const opencascade::handle<Interface_Protocol> & protocol, const opencascade::handle<Standard_Transient> & entity, const opencascade::handle<Message_Messenger> & S, const Standard_Integer level);

		/****************** DumpEntity ******************/
		%feature("compactdefaultargs") DumpEntity;
		%feature("autodoc", "Calls deferred dumpentity with the recorded default level.

Parameters
----------
model: Interface_InterfaceModel
protocol: Interface_Protocol
entity: Standard_Transient
S: Message_Messenger

Returns
-------
None
") DumpEntity;
		void DumpEntity(const opencascade::handle<Interface_InterfaceModel> & model, const opencascade::handle<Interface_Protocol> & protocol, const opencascade::handle<Standard_Transient> & entity, const opencascade::handle<Message_Messenger> & S);

		/****************** DumpHelp ******************/
		%feature("compactdefaultargs") DumpHelp;
		%feature("autodoc", "Returns the help line recorded for <level>, or an empty string.

Parameters
----------
level: int

Returns
-------
char *
") DumpHelp;
		const char * DumpHelp(const Standard_Integer level);

		/****************** DumpLevels ******************/
		%feature("compactdefaultargs") DumpLevels;
		%feature("autodoc", "Returns the recorded default and maximum dump levels if none was recorded, max is returned negative, def as zero.

Parameters
----------

Returns
-------
def: int
max: int
") DumpLevels;
		void DumpLevels(Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** ReadFile ******************/
		%feature("compactdefaultargs") ReadFile;
		%feature("autodoc", "Gives the way to read a file and transfer it to a model <mod> is the resulting model, which has to be created by this method. in case of error, <mod> must be returned null return value is a status with free values. simply, 0 is for 'execution ok' the protocol can be used to work (e.g. create the model, read and recognize the entities).

Parameters
----------
name: char *
model: Interface_InterfaceModel
protocol: Interface_Protocol

Returns
-------
int
") ReadFile;
		virtual Standard_Integer ReadFile(const char * name, opencascade::handle<Interface_InterfaceModel> & model, const opencascade::handle<Interface_Protocol> & protocol);

		/****************** SetDumpHelp ******************/
		%feature("compactdefaultargs") SetDumpHelp;
		%feature("autodoc", "Records a short line of help for a level (0 - max).

Parameters
----------
level: int
help: char *

Returns
-------
None
") SetDumpHelp;
		void SetDumpHelp(const Standard_Integer level, const char * help);

		/****************** SetDumpLevels ******************/
		%feature("compactdefaultargs") SetDumpLevels;
		%feature("autodoc", "Records a default level and a maximum value for level level for dumpentity can go between 0 and <max> default value will be <def>.

Parameters
----------
def: int
max: int

Returns
-------
None
") SetDumpLevels;
		void SetDumpLevels(const Standard_Integer def, const Standard_Integer max);

		/****************** WriteFile ******************/
		%feature("compactdefaultargs") WriteFile;
		%feature("autodoc", "Gives the way to write a file from a model. <ctx> contains all necessary informations : the model, the protocol, the file name, and the list of file modifiers to be applied, also with restricted list of selected entities for each one, if required. in return, it brings the produced check-list //! the worklibrary has to query <applied> to get then run the contextwrite by looping like this (example) : for (numap = 1; numap <= ctx.nbmodifiers(); numap ++) { ctx.setmodifier (numap); cast ctx.filemodifier() to specific type -> variable filemod if (!filemod.isnull()) filemod->perform (ctx,writer); filemod then works with ctx. it can, either act on the model itself (for instance on its header), or iterate on selected entities (start/next/more/value) it can call addfail or addwarning, as necessary }.

Parameters
----------
ctx: IFSelect_ContextWrite

Returns
-------
bool
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
		/****************** IFSelect_WorkSession ******************/
		%feature("compactdefaultargs") IFSelect_WorkSession;
		%feature("autodoc", "Creates a work session it provides default, empty shareout and modelcopier, which can be replaced (if required, should be done just after creation).

Returns
-------
None
") IFSelect_WorkSession;
		 IFSelect_WorkSession();

		/****************** AddItem ******************/
		%feature("compactdefaultargs") AddItem;
		%feature("autodoc", "Adds an item and returns its attached ident. does nothing if <item> is already recorded (and returns its attached ident) <active> if true commands call to setactive (see below) remark : the determined ident is used if <item> is a dispatch, to fill the shareout.

Parameters
----------
item: Standard_Transient
active: bool,optional
	default value is Standard_True

Returns
-------
int
") AddItem;
		Standard_Integer AddItem(const opencascade::handle<Standard_Transient> & item, const Standard_Boolean active = Standard_True);

		/****************** AddNamedItem ******************/
		%feature("compactdefaultargs") AddNamedItem;
		%feature("autodoc", "Adds an item with an attached name. if the name is already known in the worksession, the older item losts it returns ident if done, 0 else, i.e. if <item> is null if <name> is empty, works as additem (i.e. with no name) if <item> is already known but with no attached name, this method tries to attached a name to it <active> if true commands call to setactive (see below).

Parameters
----------
name: char *
item: Standard_Transient
active: bool,optional
	default value is Standard_True

Returns
-------
int
") AddNamedItem;
		Standard_Integer AddNamedItem(const char * name, const opencascade::handle<Standard_Transient> & item, const Standard_Boolean active = Standard_True);

		/****************** AppliedDispatches ******************/
		%feature("compactdefaultargs") AppliedDispatches;
		%feature("autodoc", "Returns the ordered list of dispatches stored by the shareout.

Returns
-------
opencascade::handle<TColStd_HSequenceOfInteger>
") AppliedDispatches;
		opencascade::handle<TColStd_HSequenceOfInteger> AppliedDispatches();

		/****************** BeginSentFiles ******************/
		%feature("compactdefaultargs") BeginSentFiles;
		%feature("autodoc", "Commands file sending to clear the list of already sent files, commands to record a new one if <record> is true this list is managed by the modelcopier when sendsplit is called it allows a global exploitation of the set of sent files.

Parameters
----------
record: bool

Returns
-------
None
") BeginSentFiles;
		void BeginSentFiles(const Standard_Boolean record);

		/****************** CategoryName ******************/
		%feature("compactdefaultargs") CategoryName;
		%feature("autodoc", "Returns the category name determined for an entity it is computed by the class category remark : an unknown entity gives an empty string.

Parameters
----------
ent: Standard_Transient

Returns
-------
char *
") CategoryName;
		const char * CategoryName(const opencascade::handle<Standard_Transient> & ent);

		/****************** CategoryNumber ******************/
		%feature("compactdefaultargs") CategoryNumber;
		%feature("autodoc", "Returns the category number determined for an entity it is computed by the class category an unknown entity (number 0) gives a value -1.

Parameters
----------
ent: Standard_Transient

Returns
-------
int
") CategoryNumber;
		Standard_Integer CategoryNumber(const opencascade::handle<Standard_Transient> & ent);

		/****************** ChangeModifierRank ******************/
		%feature("compactdefaultargs") ChangeModifierRank;
		%feature("autodoc", "Changes the rank of a modifier in the session : model modifiers if <formodel> is true, file modifiers else the modifier n0 <before> is put to n0 <after> return true if done, false if <before> or <after> out of range.

Parameters
----------
formodel: bool
before: int
after: int

Returns
-------
bool
") ChangeModifierRank;
		Standard_Boolean ChangeModifierRank(const Standard_Boolean formodel, const Standard_Integer before, const Standard_Integer after);

		/****************** CheckOne ******************/
		%feature("compactdefaultargs") CheckOne;
		%feature("autodoc", "Returns a check for a single entity, under the form of a checkiterator (this gives only one form for the user) if <ent> is null or equates the current model, it gives the global check, else the check for the given entity <complete> as for modelchecklist.

Parameters
----------
ent: Standard_Transient
complete: bool,optional
	default value is Standard_True

Returns
-------
Interface_CheckIterator
") CheckOne;
		Interface_CheckIterator CheckOne(const opencascade::handle<Standard_Transient> & ent, const Standard_Boolean complete = Standard_True);

		/****************** ClearData ******************/
		%feature("compactdefaultargs") ClearData;
		%feature("autodoc", "Clears recorded data (not the items) according mode : 1 : all data : model, graph, checklist, + cleardata 4 2 : graph and checklist (they will then be recomputed later) 3 : checklist (it will be recomputed by computecheck) 4 : just content of selectpointed and counters plus 0 : does nothing but called by setmodel cleardata is virtual, hence it can be redefined to clear other data of a specialised work session.

Parameters
----------
mode: int

Returns
-------
None
") ClearData;
		virtual void ClearData(const Standard_Integer mode);

		/****************** ClearFile ******************/
		%feature("compactdefaultargs") ClearFile;
		%feature("autodoc", "Erases all stored data from the file evaluation (i.e. all former naming informations are lost).

Returns
-------
None
") ClearFile;
		void ClearFile();

		/****************** ClearFinalModifiers ******************/
		%feature("compactdefaultargs") ClearFinalModifiers;
		%feature("autodoc", "Removes all the modifiers active in the modelcopier : they become inactive and they are removed from the session.

Returns
-------
None
") ClearFinalModifiers;
		void ClearFinalModifiers();

		/****************** ClearItems ******************/
		%feature("compactdefaultargs") ClearItems;
		%feature("autodoc", "Clears all the recorded items : selections, dispatches, modifiers, and strings & intparams, with their idents & names. remark that if a model has been loaded, it is not cleared.

Returns
-------
None
") ClearItems;
		void ClearItems();

		/****************** ClearShareOut ******************/
		%feature("compactdefaultargs") ClearShareOut;
		%feature("autodoc", "Clears the list of dispatches recorded by the shareout if <only> disp is true, tha's all. else, clears also the lists of modifiers recorded by the shareout.

Parameters
----------
onlydisp: bool

Returns
-------
None
") ClearShareOut;
		void ClearShareOut(const Standard_Boolean onlydisp);

		/****************** CombineAdd ******************/
		%feature("compactdefaultargs") CombineAdd;
		%feature("autodoc", "Adds an input selection to a selectcombine (union or inters.). returns new count of inputs for this selectcombine if done or 0 if <sel> is not kind of selectcombine, or if <seladd> or <sel> is not in the worksession by default, adding is done at the end of the list else, it is an insertion to rank <atnum> (usefull for un-redo).

Parameters
----------
selcomb: IFSelect_Selection
seladd: IFSelect_Selection
atnum: int,optional
	default value is 0

Returns
-------
int
") CombineAdd;
		Standard_Integer CombineAdd(const opencascade::handle<IFSelect_Selection> & selcomb, const opencascade::handle<IFSelect_Selection> & seladd, const Standard_Integer atnum = 0);

		/****************** CombineRemove ******************/
		%feature("compactdefaultargs") CombineRemove;
		%feature("autodoc", "Removes an input selection from a selectcombine (union or intersection). returns true if done, false if <selcomb> is not kind of selectcombine or <selrem> is not source of <selcomb>.

Parameters
----------
selcomb: IFSelect_Selection
selrem: IFSelect_Selection

Returns
-------
bool
") CombineRemove;
		Standard_Boolean CombineRemove(const opencascade::handle<IFSelect_Selection> & selcomb, const opencascade::handle<IFSelect_Selection> & selrem);

		/****************** ComputeCheck ******************/
		%feature("compactdefaultargs") ComputeCheck;
		%feature("autodoc", "Computes the checklist for the model currently loaded it can then be used for displays, querries ... returns true if ok, false else (i.e. no protocol set, or model absent). if <enforce> is false, works only if not already done or if a new model has been loaded from last call. remark : computation is enforced by every call to setmodel or runtransformer.

Parameters
----------
enforce: bool,optional
	default value is Standard_False

Returns
-------
bool
") ComputeCheck;
		Standard_Boolean ComputeCheck(const Standard_Boolean enforce = Standard_False);

		/****************** ComputeCounter ******************/
		%feature("compactdefaultargs") ComputeCounter;
		%feature("autodoc", "Computes the content of a signcounter when it is defined with a selection, then returns true returns false if the signcounter is not defined with a selection, or if its selection mode is inhibited <forced> to work around optimisations.

Parameters
----------
counter: IFSelect_SignCounter
forced: bool,optional
	default value is Standard_False

Returns
-------
bool
") ComputeCounter;
		Standard_Boolean ComputeCounter(const opencascade::handle<IFSelect_SignCounter> & counter, const Standard_Boolean forced = Standard_False);

		/****************** ComputeCounterFromList ******************/
		%feature("compactdefaultargs") ComputeCounterFromList;
		%feature("autodoc", "Computes the content of a signcounter from an input list if <list> is null, uses internal definition of the counter : a selection, else the whole model (recomputation forced) if <clear> is true (d), starts from scratch else, cumulates computations.

Parameters
----------
counter: IFSelect_SignCounter
list: TColStd_HSequenceOfTransient
clear: bool,optional
	default value is Standard_True

Returns
-------
bool
") ComputeCounterFromList;
		Standard_Boolean ComputeCounterFromList(const opencascade::handle<IFSelect_SignCounter> & counter, const opencascade::handle<TColStd_HSequenceOfTransient> & list, const Standard_Boolean clear = Standard_True);

		/****************** ComputeGraph ******************/
		%feature("compactdefaultargs") ComputeGraph;
		%feature("autodoc", "Computes the graph used for selections, displays ... if a hgraph is already set, with same model as given by method model, does nothing. else, computes a new graph. if <enforce> is given true, computes a new graph anyway. remark that a call to cleargraph will cause computegraph to really compute a new graph returns true if graph is ok, false else (i.e. if no protocol is set, or if model is absent or empty).

Parameters
----------
enforce: bool,optional
	default value is Standard_False

Returns
-------
bool
") ComputeGraph;
		Standard_Boolean ComputeGraph(const Standard_Boolean enforce = Standard_False);

		/****************** DefaultFileRoot ******************/
		%feature("compactdefaultargs") DefaultFileRoot;
		%feature("autodoc", "Returns the defined default file root. it is used for dispatches which have no specific root attached. null handle if not defined.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") DefaultFileRoot;
		opencascade::handle<TCollection_HAsciiString> DefaultFileRoot();

		/****************** Dispatch ******************/
		%feature("compactdefaultargs") Dispatch;
		%feature("autodoc", "Returns a dispatch, given its ident in the session null result if <id> is not suitable for a dispatch (undefined, or defined for another kind of variable).

Parameters
----------
id: int

Returns
-------
opencascade::handle<IFSelect_Dispatch>
") Dispatch;
		opencascade::handle<IFSelect_Dispatch> Dispatch(const Standard_Integer id);

		/****************** DispatchRank ******************/
		%feature("compactdefaultargs") DispatchRank;
		%feature("autodoc", "Returns the rank of a dispatch in the shareout, or 0 if <disp> is not in the shareout or not in the worksession.

Parameters
----------
disp: IFSelect_Dispatch

Returns
-------
int
") DispatchRank;
		Standard_Integer DispatchRank(const opencascade::handle<IFSelect_Dispatch> & disp);

		/****************** DumpEntity ******************/
		%feature("compactdefaultargs") DumpEntity;
		%feature("autodoc", "Dumps a starting entity according to the current norm. to do this, it calls dumpentity from worklibrary. <level> is to be interpreted for each norm : see specific classes of worklibrary for it. generally, 0 if for very basic (only type ...), greater values give more and more details.

Parameters
----------
ent: Standard_Transient
level: int
S: Message_Messenger

Returns
-------
None
") DumpEntity;
		void DumpEntity(const opencascade::handle<Standard_Transient> & ent, const Standard_Integer level, const opencascade::handle<Message_Messenger> & S);

		/****************** DumpModel ******************/
		%feature("compactdefaultargs") DumpModel;
		%feature("autodoc", "Lists the content of the input model (if there is one) according level : 0 -> gives only count of entities and roots 1 -> lists also roots; 2 -> lists all entities (by tracetype) 3 -> performs a call to checklist (fails) and lists the result 4 -> as 3 but all checklist (fails + warnings) 5,6,7 : as 3 but resp. count,list,labels by fail 8,9,10 : as 4 but resp. count,list,labels by message.

Parameters
----------
level: int
S: Message_Messenger

Returns
-------
None
") DumpModel;
		void DumpModel(const Standard_Integer level, const opencascade::handle<Message_Messenger> & S);

		/****************** DumpSelection ******************/
		%feature("compactdefaultargs") DumpSelection;
		%feature("autodoc", "Lists a selection and its sources (see selectioniterator), given its rank in the list.

Parameters
----------
sel: IFSelect_Selection

Returns
-------
None
") DumpSelection;
		void DumpSelection(const opencascade::handle<IFSelect_Selection> & sel);

		/****************** DumpShare ******************/
		%feature("compactdefaultargs") DumpShare;
		%feature("autodoc", "Dumps contents of the shareout (on 'cout').

Returns
-------
None
") DumpShare;
		void DumpShare();

		/****************** EntityLabel ******************/
		%feature("compactdefaultargs") EntityLabel;
		%feature("autodoc", "Returns the label for <ent>, as the model does if <ent> is not in the model or if no model is loaded, a null handle is returned.

Parameters
----------
ent: Standard_Transient

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") EntityLabel;
		opencascade::handle<TCollection_HAsciiString> EntityLabel(const opencascade::handle<Standard_Transient> & ent);

		/****************** EntityName ******************/
		%feature("compactdefaultargs") EntityName;
		%feature("autodoc", "Returns the name of an entity this name is computed by the general service name returns a null handle if fails.

Parameters
----------
ent: Standard_Transient

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") EntityName;
		opencascade::handle<TCollection_HAsciiString> EntityName(const opencascade::handle<Standard_Transient> & ent);

		/****************** ErrorHandle ******************/
		%feature("compactdefaultargs") ErrorHandle;
		%feature("autodoc", "Returns the error handler status.

Returns
-------
bool
") ErrorHandle;
		Standard_Boolean ErrorHandle();

		/****************** EvalSelection ******************/
		%feature("compactdefaultargs") EvalSelection;
		%feature("autodoc", "Evaluates the effect of a selection applied on the input model returned result remains empty if no input model has been set.

Parameters
----------
sel: IFSelect_Selection

Returns
-------
Interface_EntityIterator
") EvalSelection;
		Interface_EntityIterator EvalSelection(const opencascade::handle<IFSelect_Selection> & sel);

		/****************** EvalSplit ******************/
		%feature("compactdefaultargs") EvalSplit;
		%feature("autodoc", "Returns an evaluation of the whole shareout definition : i.e. how the entities of the starting model are forecast to be sent to various files : list of packets according the dispatches, effective lists of roots for each packet (which determine the content of the corresponding file); plus evaluation of which entities are : forgotten (sent into no file), duplicated (sent into more than one file), sent into a given file. see the class packetlist for more details.

Returns
-------
opencascade::handle<IFSelect_PacketList>
") EvalSplit;
		opencascade::handle<IFSelect_PacketList> EvalSplit();

		/****************** EvaluateComplete ******************/
		%feature("compactdefaultargs") EvaluateComplete;
		%feature("autodoc", "Displays the effect of applying the shareout on the input model. <mode> = 0 (default) : displays only roots for each packet, <mode> = 1 : displays all entities for each packet, plus duplicated entities <mode> = 2 : same as <mode> = 1, plus displays forgotten entities (which are in no packet at all).

Parameters
----------
mode: int,optional
	default value is 0

Returns
-------
None
") EvaluateComplete;
		void EvaluateComplete(const Standard_Integer mode = 0);

		/****************** EvaluateDispatch ******************/
		%feature("compactdefaultargs") EvaluateDispatch;
		%feature("autodoc", "Displays the result of applying a dispatch on the input model (also shows remainder if there is) <mode> = 0 (default), displays nothing else <mode> = 1 : displays also duplicated entities (because of this dispatch) <mode> = 2 : displays the entities of the starting model which are not taken by this dispatch (forgotten entities) <mode> = 3 : displays both duplicated and forgotten entities remark : evaluatecomplete displays these data evaluated for for all the dispatches, if there are several.

Parameters
----------
disp: IFSelect_Dispatch
mode: int,optional
	default value is 0

Returns
-------
None
") EvaluateDispatch;
		void EvaluateDispatch(const opencascade::handle<IFSelect_Dispatch> & disp, const Standard_Integer mode = 0);

		/****************** EvaluateFile ******************/
		%feature("compactdefaultargs") EvaluateFile;
		%feature("autodoc", "Performs and stores a file evaluation. the results are a list of produced models and a list of names (strings), in parallel fills lastrunchecklist.

Returns
-------
None
") EvaluateFile;
		void EvaluateFile();

		/****************** EvaluateSelection ******************/
		%feature("compactdefaultargs") EvaluateSelection;
		%feature("autodoc", "Displays the list of entities selected by a selection (i.e. the result of evalselection).

Parameters
----------
sel: IFSelect_Selection

Returns
-------
None
") EvaluateSelection;
		void EvaluateSelection(const opencascade::handle<IFSelect_Selection> & sel);

		/****************** FileExtension ******************/
		%feature("compactdefaultargs") FileExtension;
		%feature("autodoc", "Returns the defined file extension. null handle if not defined.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") FileExtension;
		opencascade::handle<TCollection_HAsciiString> FileExtension();

		/****************** FileModel ******************/
		%feature("compactdefaultargs") FileModel;
		%feature("autodoc", "Returns a model, given its rank in the evaluation list.

Parameters
----------
num: int

Returns
-------
opencascade::handle<Interface_InterfaceModel>
") FileModel;
		opencascade::handle<Interface_InterfaceModel> FileModel(const Standard_Integer num);

		/****************** FileName ******************/
		%feature("compactdefaultargs") FileName;
		%feature("autodoc", "Returns the name of a file corresponding to a produced model, given its rank in the evaluation list.

Parameters
----------
num: int

Returns
-------
TCollection_AsciiString
") FileName;
		TCollection_AsciiString FileName(const Standard_Integer num);

		/****************** FilePrefix ******************/
		%feature("compactdefaultargs") FilePrefix;
		%feature("autodoc", "Returns the defined file prefix. null handle if not defined.

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") FilePrefix;
		opencascade::handle<TCollection_HAsciiString> FilePrefix();

		/****************** FileRoot ******************/
		%feature("compactdefaultargs") FileRoot;
		%feature("autodoc", "Returns the file root defined for a dispatch. null if no root name is defined for it (hence, no file will be produced).

Parameters
----------
disp: IFSelect_Dispatch

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") FileRoot;
		opencascade::handle<TCollection_HAsciiString> FileRoot(const opencascade::handle<IFSelect_Dispatch> & disp);

		/****************** FinalModifierIdents ******************/
		%feature("compactdefaultargs") FinalModifierIdents;
		%feature("autodoc", "Fills a sequence with a list of idents, those attached to the modifiers applied to final sending. model modifiers if <formodel> is true, file modifiers else this list is given in the order in which they will be applied (which takes into account the changes to modifier ranks).

Parameters
----------
formodel: bool

Returns
-------
opencascade::handle<TColStd_HSequenceOfInteger>
") FinalModifierIdents;
		opencascade::handle<TColStd_HSequenceOfInteger> FinalModifierIdents(const Standard_Boolean formodel);

		/****************** GeneralModifier ******************/
		%feature("compactdefaultargs") GeneralModifier;
		%feature("autodoc", "Returns a modifier, given its ident in the session null result if <id> is not suitable for a modifier (undefined, or defined for another kind of variable).

Parameters
----------
id: int

Returns
-------
opencascade::handle<IFSelect_GeneralModifier>
") GeneralModifier;
		opencascade::handle<IFSelect_GeneralModifier> GeneralModifier(const Standard_Integer id);

		/****************** GetModeStat ******************/
		%feature("compactdefaultargs") GetModeStat;
		%feature("autodoc", "Return value of mode defining of filling selection during loading.

Returns
-------
bool
") GetModeStat;
		Standard_Boolean GetModeStat();

		/****************** GiveFileComplete ******************/
		%feature("compactdefaultargs") GiveFileComplete;
		%feature("autodoc", "Completes a file name as required, with prefix and extension (if defined; for a non-defined item, completes nothing).

Parameters
----------
file: char *

Returns
-------
char *
") GiveFileComplete;
		const char * GiveFileComplete(const char * file);

		/****************** GiveFileRoot ******************/
		%feature("compactdefaultargs") GiveFileRoot;
		%feature("autodoc", "Extracts file root name from a given complete file name (uses osd_path).

Parameters
----------
file: char *

Returns
-------
char *
") GiveFileRoot;
		const char * GiveFileRoot(const char * file);

		/****************** GiveList ******************/
		%feature("compactdefaultargs") GiveList;
		%feature("autodoc", "Determines a list of entities from an object : <obj> already hsequenceoftransient : returned itself <obj> selection : its result of evaluation is returned <obj> an entity of the model : a hsequence which contains it else, an empty hsequence <obj> the model it self : all its content (not only the roots).

Parameters
----------
obj: Standard_Transient

Returns
-------
opencascade::handle<TColStd_HSequenceOfTransient>
") GiveList;
		opencascade::handle<TColStd_HSequenceOfTransient> GiveList(const opencascade::handle<Standard_Transient> & obj);

		/****************** GiveList ******************/
		%feature("compactdefaultargs") GiveList;
		%feature("autodoc", "Computes a list of entities from two alphanums, first and second, as follows : if <first> is a number or label of an entity : this entity if <first> is a list of numbers/labels : the list of entities if <first> is the name of a selection in <ws>, and <second> not defined, the standard result of this selection else, let's consider 'first second' : this whole phrase is splitted by blanks, as follows (recursive call) : - the leftest term is the final selection - the other terms define the result of the selection - and so on (the 'leftest minus one' is a selection, of which the input is given by the remaining ...).

Parameters
----------
first: char *
second: char *,optional
	default value is ""

Returns
-------
opencascade::handle<TColStd_HSequenceOfTransient>
") GiveList;
		opencascade::handle<TColStd_HSequenceOfTransient> GiveList(const char * first, const char * second = "");

		/****************** GiveListCombined ******************/
		%feature("compactdefaultargs") GiveListCombined;
		%feature("autodoc", "Combines two lists and returns the result, according to mode : <mode> < 0 : entities in <l1> and not in <l2> <mode> = 0 : entities in <l1> and in <l2> <mode> > 0 : entities in <l1> or in <l2>.

Parameters
----------
l1: TColStd_HSequenceOfTransient
l2: TColStd_HSequenceOfTransient
mode: int

Returns
-------
opencascade::handle<TColStd_HSequenceOfTransient>
") GiveListCombined;
		opencascade::handle<TColStd_HSequenceOfTransient> GiveListCombined(const opencascade::handle<TColStd_HSequenceOfTransient> & l1, const opencascade::handle<TColStd_HSequenceOfTransient> & l2, const Standard_Integer mode);

		/****************** GiveListFromList ******************/
		%feature("compactdefaultargs") GiveListFromList;
		%feature("autodoc", "Computes a list of entities from the model as follows <first> beeing a selection or a combination of selections, <ent> beeing an entity or a list of entities (as a hsequenceoftransient) : the standard result of this selection applied to this list if <ent> is null, the standard definition of the selection is used (which contains a default input selection) if <selname> is erroneous, a null handle is returned //! remark : selname is processed as <first second> of preceeding givelist.

Parameters
----------
selname: char *
ent: Standard_Transient

Returns
-------
opencascade::handle<TColStd_HSequenceOfTransient>
") GiveListFromList;
		opencascade::handle<TColStd_HSequenceOfTransient> GiveListFromList(const char * selname, const opencascade::handle<Standard_Transient> & ent);

		/****************** GiveSelection ******************/
		%feature("compactdefaultargs") GiveSelection;
		%feature("autodoc", "Returns a selection from a name : - the name of a selection : this selection - the name of a signature + criteria between (..) : a new selection from this signature - an entity or a list of entities : a new selectpointed else, returns a null handle.

Parameters
----------
selname: char *

Returns
-------
opencascade::handle<IFSelect_Selection>
") GiveSelection;
		opencascade::handle<IFSelect_Selection> GiveSelection(const char * selname);

		/****************** Graph ******************/
		%feature("compactdefaultargs") Graph;
		%feature("autodoc", "Returns the computed graph, for read only.

Returns
-------
Interface_Graph
") Graph;
		const Interface_Graph & Graph();

		/****************** HGraph ******************/
		%feature("compactdefaultargs") HGraph;
		%feature("autodoc", "Returns the computed graph as hgraph (null handle if not set).

Returns
-------
opencascade::handle<Interface_HGraph>
") HGraph;
		opencascade::handle<Interface_HGraph> HGraph();

		/****************** HasModel ******************/
		%feature("compactdefaultargs") HasModel;
		%feature("autodoc", "Returns true is a model has been set.

Returns
-------
bool
") HasModel;
		Standard_Boolean HasModel();

		/****************** HasName ******************/
		%feature("compactdefaultargs") HasName;
		%feature("autodoc", "Returns true if an item of the worksession has an attached name.

Parameters
----------
item: Standard_Transient

Returns
-------
bool
") HasName;
		Standard_Boolean HasName(const opencascade::handle<Standard_Transient> & item);

		/****************** IntParam ******************/
		%feature("compactdefaultargs") IntParam;
		%feature("autodoc", "Returns an intparam, given its ident in the session null result if <id> is not suitable for an intparam (undefined, or defined for another kind of variable).

Parameters
----------
id: int

Returns
-------
opencascade::handle<IFSelect_IntParam>
") IntParam;
		opencascade::handle<IFSelect_IntParam> IntParam(const Standard_Integer id);

		/****************** IntValue ******************/
		%feature("compactdefaultargs") IntValue;
		%feature("autodoc", "Returns integer value of an intparam.

Parameters
----------
it: IFSelect_IntParam

Returns
-------
int
") IntValue;
		Standard_Integer IntValue(const opencascade::handle<IFSelect_IntParam> & it);

		/****************** IsLoaded ******************/
		%feature("compactdefaultargs") IsLoaded;
		%feature("autodoc", "Returns true if a model is defined and really loaded (not empty), a protocol is set and a graph has been computed. in this case, the worksession can start to work.

Returns
-------
bool
") IsLoaded;
		Standard_Boolean IsLoaded();

		/****************** IsReversedSelectExtract ******************/
		%feature("compactdefaultargs") IsReversedSelectExtract;
		%feature("autodoc", "Returns true if <sel> a reversed selectextract, false else.

Parameters
----------
sel: IFSelect_Selection

Returns
-------
bool
") IsReversedSelectExtract;
		Standard_Boolean IsReversedSelectExtract(const opencascade::handle<IFSelect_Selection> & sel);

		/****************** Item ******************/
		%feature("compactdefaultargs") Item;
		%feature("autodoc", "Returns an item, given its ident. returns a null handle if no item corresponds to this ident.

Parameters
----------
id: int

Returns
-------
opencascade::handle<Standard_Transient>
") Item;
		opencascade::handle<Standard_Transient> Item(const Standard_Integer id);

		/****************** ItemIdent ******************/
		%feature("compactdefaultargs") ItemIdent;
		%feature("autodoc", "Returns the ident attached to an item in the worksession, or zero if it is unknown.

Parameters
----------
item: Standard_Transient

Returns
-------
int
") ItemIdent;
		Standard_Integer ItemIdent(const opencascade::handle<Standard_Transient> & item);

		/****************** ItemIdents ******************/
		%feature("compactdefaultargs") ItemIdents;
		%feature("autodoc", "Fills a sequence with the list of idents attached to the items of which type complies with (iskind) <type> (alphabetic order) remark : <type> = type(standard_transient) gives all the idents which are suitable in the worksession.

Parameters
----------
type: Standard_Type

Returns
-------
opencascade::handle<TColStd_HSequenceOfInteger>
") ItemIdents;
		opencascade::handle<TColStd_HSequenceOfInteger> ItemIdents(const opencascade::handle<Standard_Type> & type);

		/****************** ItemLabel ******************/
		%feature("compactdefaultargs") ItemLabel;
		%feature("autodoc", "Returns a label which illustrates the content of an item, given its ident. this label is : - for a text parameter, 'text:<text value>' - for an integer parameter, 'integer:<integer value>' - for a selection, a dispatch or a modifier, its label (see these classes) - for any other kind of variable, its cdl type.

Parameters
----------
id: int

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") ItemLabel;
		opencascade::handle<TCollection_HAsciiString> ItemLabel(const Standard_Integer id);

		/****************** ItemNames ******************/
		%feature("compactdefaultargs") ItemNames;
		%feature("autodoc", "Fills a sequence with the list of the names attached to items of which type complies with (iskind) <type> (alphabetic order) remark : <type> = type(standard_transient) gives all the names.

Parameters
----------
type: Standard_Type

Returns
-------
opencascade::handle<TColStd_HSequenceOfHAsciiString>
") ItemNames;
		opencascade::handle<TColStd_HSequenceOfHAsciiString> ItemNames(const opencascade::handle<Standard_Type> & type);

		/****************** ItemNamesForLabel ******************/
		%feature("compactdefaultargs") ItemNamesForLabel;
		%feature("autodoc", "Fills a sequence with the names of the control items, of which the label matches <label> (contain it) : see nextidentforlabel search mode is fixed to 'contained' if <label> is empty, returns all names.

Parameters
----------
label: char *

Returns
-------
opencascade::handle<TColStd_HSequenceOfHAsciiString>
") ItemNamesForLabel;
		opencascade::handle<TColStd_HSequenceOfHAsciiString> ItemNamesForLabel(const char * label);

		/****************** ItemSelection ******************/
		%feature("compactdefaultargs") ItemSelection;
		%feature("autodoc", "Returns the selection of a dispatch or a generalmodifier. returns a null handle if none is defined or <item> not good type.

Parameters
----------
item: Standard_Transient

Returns
-------
opencascade::handle<IFSelect_Selection>
") ItemSelection;
		opencascade::handle<IFSelect_Selection> ItemSelection(const opencascade::handle<Standard_Transient> & item);

		/****************** LastRunCheckList ******************/
		%feature("compactdefaultargs") LastRunCheckList;
		%feature("autodoc", "Returns the check list produced by the last execution of either : evaluatefile(for split), sendsplit, sendall, sendselected, runtransformer-runmodifier cleared by setmodel or cleardata(1) the field is protected, hence a specialized worksession may fill it.

Returns
-------
Interface_CheckIterator
") LastRunCheckList;
		Interface_CheckIterator LastRunCheckList();

		/****************** ListEntities ******************/
		%feature("compactdefaultargs") ListEntities;
		%feature("autodoc", "Internal method which displays an entityiterator <mode> 0 gives short display (only entity numbers) 1 gives a more complete trace (1 line per entity) (can be used each time a trace has to be output from a list) 2 gives a form suitable for givelist : (n1,n2,n3...).

Parameters
----------
iter: Interface_EntityIterator
mode: int

Returns
-------
None
") ListEntities;
		void ListEntities(const Interface_EntityIterator & iter, const Standard_Integer mode);

		/****************** ListFinalModifiers ******************/
		%feature("compactdefaultargs") ListFinalModifiers;
		%feature("autodoc", "Lists the modifiers of the session (for each one, displays its label). listing is done following ranks (modifiers are invoked following their ranks) model modifiers if <formodel> is true, file modifiers else.

Parameters
----------
formodel: bool

Returns
-------
None
") ListFinalModifiers;
		void ListFinalModifiers(const Standard_Boolean formodel);

		/****************** ListItems ******************/
		%feature("compactdefaultargs") ListItems;
		%feature("autodoc", "Lists the labels of all items of the worksession if <label> is defined, lists labels which contain it.

Parameters
----------
label: char *,optional
	default value is ""

Returns
-------
None
") ListItems;
		void ListItems(const char * label = "");

		/****************** LoadedFile ******************/
		%feature("compactdefaultargs") LoadedFile;
		%feature("autodoc", "Returns the filename used to load current model empty if unknown.

Returns
-------
char *
") LoadedFile;
		const char * LoadedFile();

		/****************** MaxIdent ******************/
		%feature("compactdefaultargs") MaxIdent;
		%feature("autodoc", "Returns the maximum value for an item identifier. it can be greater to the count of known items, because some can have been removed.

Returns
-------
int
") MaxIdent;
		Standard_Integer MaxIdent();

		/****************** MaxSendingCount ******************/
		%feature("compactdefaultargs") MaxSendingCount;
		%feature("autodoc", "Returns the greater count of different files in which any of the starting entities could be sent. before any file output, this count is 0. ideal count is 1. more than 1 means that duplications occur.

Returns
-------
int
") MaxSendingCount;
		Standard_Integer MaxSendingCount();

		/****************** Model ******************/
		%feature("compactdefaultargs") Model;
		%feature("autodoc", "Returns the model of the work session (null handle if none) should be c++ : return const &.

Returns
-------
opencascade::handle<Interface_InterfaceModel>
") Model;
		const opencascade::handle<Interface_InterfaceModel> & Model();

		/****************** ModelCheckList ******************/
		%feature("compactdefaultargs") ModelCheckList;
		%feature("autodoc", "Returns the check list for the model currently loaded : <complete> = true : complete (syntactic & semantic messages), computed if not yet done <complete> = false : only syntactic (check file form).

Parameters
----------
complete: bool,optional
	default value is Standard_True

Returns
-------
Interface_CheckIterator
") ModelCheckList;
		Interface_CheckIterator ModelCheckList(const Standard_Boolean complete = Standard_True);

		/****************** ModelCopier ******************/
		%feature("compactdefaultargs") ModelCopier;
		%feature("autodoc", "Gives access to the complete modelcopier.

Returns
-------
opencascade::handle<IFSelect_ModelCopier>
") ModelCopier;
		const opencascade::handle<IFSelect_ModelCopier> & ModelCopier();

		/****************** ModelModifier ******************/
		%feature("compactdefaultargs") ModelModifier;
		%feature("autodoc", "Returns a model modifier, given its ident in the session, i.e. typed as a modifier (not simply a generalmodifier) null result if <id> is not suitable for a modifier (undefined, or defined for another kind of variable).

Parameters
----------
id: int

Returns
-------
opencascade::handle<IFSelect_Modifier>
") ModelModifier;
		opencascade::handle<IFSelect_Modifier> ModelModifier(const Standard_Integer id);

		/****************** ModifierRank ******************/
		%feature("compactdefaultargs") ModifierRank;
		%feature("autodoc", "Returns the rank of a modifier given its ident. model or file modifier according its type (modelmodifier or not) remember that modifiers are applied sequencially following their rank : first model modifiers then file modifiers rank is given by rank of call to additem and can be changed by changemodifierrank.

Parameters
----------
item: IFSelect_GeneralModifier

Returns
-------
int
") ModifierRank;
		Standard_Integer ModifierRank(const opencascade::handle<IFSelect_GeneralModifier> & item);

		/****************** Name ******************/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Returns the name attached to an item as a variable of this worksession. if <item> is null or not recorded, returns an empty string.

Parameters
----------
item: Standard_Transient

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Name;
		opencascade::handle<TCollection_HAsciiString> Name(const opencascade::handle<Standard_Transient> & item);

		/****************** NameIdent ******************/
		%feature("compactdefaultargs") NameIdent;
		%feature("autodoc", "Returns the ident attached to a name, 0 if name not recorded.

Parameters
----------
name: char *

Returns
-------
int
") NameIdent;
		Standard_Integer NameIdent(const char * name);

		/****************** NamedItem ******************/
		%feature("compactdefaultargs") NamedItem;
		%feature("autodoc", "Returns the item which corresponds to a variable, given its name (whatever the type of this item). returns a null handle if this name is not recorded.

Parameters
----------
name: char *

Returns
-------
opencascade::handle<Standard_Transient>
") NamedItem;
		opencascade::handle<Standard_Transient> NamedItem(const char * name);

		/****************** NamedItem ******************/
		%feature("compactdefaultargs") NamedItem;
		%feature("autodoc", "Same as above, but <name> is given through a handle especially usefull with methods selectionnames, etc...

Parameters
----------
name: TCollection_HAsciiString

Returns
-------
opencascade::handle<Standard_Transient>
") NamedItem;
		opencascade::handle<Standard_Transient> NamedItem(const opencascade::handle<TCollection_HAsciiString> & name);

		/****************** NbFiles ******************/
		%feature("compactdefaultargs") NbFiles;
		%feature("autodoc", "Returns the count of produced models.

Returns
-------
int
") NbFiles;
		Standard_Integer NbFiles();

		/****************** NbFinalModifiers ******************/
		%feature("compactdefaultargs") NbFinalModifiers;
		%feature("autodoc", "Returns the count of modifiers applied to final sending model modifiers if <formodel> is true, file modifiers else (i.e. modifiers which apply once the models have been filled).

Parameters
----------
formodel: bool

Returns
-------
int
") NbFinalModifiers;
		Standard_Integer NbFinalModifiers(const Standard_Boolean formodel);

		/****************** NbSources ******************/
		%feature("compactdefaultargs") NbSources;
		%feature("autodoc", "Returns the count of input selections known for a selection, or 0 if <sel> not in the worksession. this count is one for a selectdeduct / selectextract kind, two for selectcontrol kind, variable for a selectcombine (union/intersection), zero else.

Parameters
----------
sel: IFSelect_Selection

Returns
-------
int
") NbSources;
		Standard_Integer NbSources(const opencascade::handle<IFSelect_Selection> & sel);

		/****************** NbStartingEntities ******************/
		%feature("compactdefaultargs") NbStartingEntities;
		%feature("autodoc", "Returns the count of entities stored in the model, or 0.

Returns
-------
int
") NbStartingEntities;
		Standard_Integer NbStartingEntities();

		/****************** NewIntParam ******************/
		%feature("compactdefaultargs") NewIntParam;
		%feature("autodoc", "Creates a new intparam. a name can be set (optional) returns the created intparam, or a null handle in case of failure (see additem/addnameditem).

Parameters
----------
name: char *,optional
	default value is ""

Returns
-------
opencascade::handle<IFSelect_IntParam>
") NewIntParam;
		opencascade::handle<IFSelect_IntParam> NewIntParam(const char * name = "");

		/****************** NewParamFromStatic ******************/
		%feature("compactdefaultargs") NewParamFromStatic;
		%feature("autodoc", "Creates a parameter as being bound to a static if the static is integer, this creates an intparam bound to it by its name. else this creates a string which is the value of the static. returns a null handle if <statname> is unknown as a static.

Parameters
----------
statname: char *
name: char *,optional
	default value is ""

Returns
-------
opencascade::handle<Standard_Transient>
") NewParamFromStatic;
		opencascade::handle<Standard_Transient> NewParamFromStatic(const char * statname, const char * name = "");

		/****************** NewSelectPointed ******************/
		%feature("compactdefaultargs") NewSelectPointed;
		%feature("autodoc", "Creates a new selection, of type selectpointed, its content starts with <list>. a name must be given (can be empty).

Parameters
----------
list: TColStd_HSequenceOfTransient
name: char *

Returns
-------
opencascade::handle<IFSelect_Selection>
") NewSelectPointed;
		opencascade::handle<IFSelect_Selection> NewSelectPointed(const opencascade::handle<TColStd_HSequenceOfTransient> & list, const char * name);

		/****************** NewTextParam ******************/
		%feature("compactdefaultargs") NewTextParam;
		%feature("autodoc", "Creates a new (empty) textparam. a name can be set (optional) returns the created textparam (as an hasciistring), or a null handle in case of failure (see additem/addnameditem).

Parameters
----------
name: char *,optional
	default value is ""

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") NewTextParam;
		opencascade::handle<TCollection_HAsciiString> NewTextParam(const char * name = "");

		/****************** NewTransformStandard ******************/
		%feature("compactdefaultargs") NewTransformStandard;
		%feature("autodoc", "Creates and returns a transformstandard, empty, with its copy option (true = copy, false = on the spot) and an optional name. to a transformstandard, the method setappliedmodifier applies.

Parameters
----------
copy: bool
name: char *,optional
	default value is ""

Returns
-------
opencascade::handle<IFSelect_Transformer>
") NewTransformStandard;
		opencascade::handle<IFSelect_Transformer> NewTransformStandard(const Standard_Boolean copy, const char * name = "");

		/****************** NextIdentForLabel ******************/
		%feature("compactdefaultargs") NextIdentForLabel;
		%feature("autodoc", "For query by label with possible iterations searches the ident of which item has a label which matches a given one, the search starts from an initial ident. returns the first found ident which follows <id>, or zero //! the search must start with <id> = 0, it returns the next ident which matches. to iterate, call again this method which this returned value as <id>. once an ident has been returned, the item can be obtained by the method item //! <mode> precises the required matching mode : - 0 (default) : <label> must match exactly with the item label - 1 : <label> must match the exact beginning (the end is free) - 2 : <label> must be at least once wherever in the item label - other values are ignored.

Parameters
----------
label: char *
id: int
mode: int,optional
	default value is 0

Returns
-------
int
") NextIdentForLabel;
		Standard_Integer NextIdentForLabel(const char * label, const Standard_Integer id, const Standard_Integer mode = 0);

		/****************** NumberFromLabel ******************/
		%feature("compactdefaultargs") NumberFromLabel;
		%feature("autodoc", "From a given label in model, returns the corresponding number starts from first entity by default, may start after a given number : this number may be given negative, its absolute value is then considered. hence a loop on numberfromlabel may be programmed (stop test is : returned value positive or null) //! returns 0 if not found, < 0 if more than one found (first found in negative). if <val> just gives an integer value, returns it.

Parameters
----------
val: char *
afternum: int,optional
	default value is 0

Returns
-------
int
") NumberFromLabel;
		Standard_Integer NumberFromLabel(const char * val, const Standard_Integer afternum = 0);

		/****************** PrintCheckList ******************/
		%feature("compactdefaultargs") PrintCheckList;
		%feature("autodoc", "Prints a checkiterator to the current trace file, controlled with the current model complete or fails only, according to <failsonly> <mode> defines the mode of printing 0 : sequential, according entities; else with a checkcounter 1 : according messages, count of entities 2 : id but with list of entities, designated by their numbers 3 : as 2 but with labels of entities.

Parameters
----------
checklist: Interface_CheckIterator
failsonly: bool
mode: IFSelect_PrintCount

Returns
-------
None
") PrintCheckList;
		void PrintCheckList(const Interface_CheckIterator & checklist, const Standard_Boolean failsonly, const IFSelect_PrintCount mode);

		/****************** PrintEntityStatus ******************/
		%feature("compactdefaultargs") PrintEntityStatus;
		%feature("autodoc", "Prints main informations about an entity : its number, type, validity (and checks if any), category, shareds and sharings.. mutable because it can recompute checks as necessary.

Parameters
----------
ent: Standard_Transient
S: Message_Messenger

Returns
-------
None
") PrintEntityStatus;
		void PrintEntityStatus(const opencascade::handle<Standard_Transient> & ent, const opencascade::handle<Message_Messenger> & S);

		/****************** PrintSignatureList ******************/
		%feature("compactdefaultargs") PrintSignatureList;
		%feature("autodoc", "Prints a signaturelist to the current trace file, controlled with the current model <mode> defines the mode of printing (see signaturelist).

Parameters
----------
signlist: IFSelect_SignatureList
mode: IFSelect_PrintCount

Returns
-------
None
") PrintSignatureList;
		void PrintSignatureList(const opencascade::handle<IFSelect_SignatureList> & signlist, const IFSelect_PrintCount mode);

		/****************** Protocol ******************/
		%feature("compactdefaultargs") Protocol;
		%feature("autodoc", "Returns the protocol. null handle if not yet set should be c++ : return const &.

Returns
-------
opencascade::handle<Interface_Protocol>
") Protocol;
		const opencascade::handle<Interface_Protocol> & Protocol();

		/****************** QueryCheckList ******************/
		%feature("compactdefaultargs") QueryCheckList;
		%feature("autodoc", "Loads data from a check iterator to query status on it.

Parameters
----------
chl: Interface_CheckIterator

Returns
-------
None
") QueryCheckList;
		void QueryCheckList(const Interface_CheckIterator & chl);

		/****************** QueryCheckStatus ******************/
		%feature("compactdefaultargs") QueryCheckStatus;
		%feature("autodoc", "Determines check status for an entity regarding last call to querychecklist : -1 : <ent> unknown in the model, ignored 0 : no check at all, immediate or inherited thru graph 1 : immediate warning (no fail), no inherited check 2 : immediate fail, no inherited check +10 : idem but some inherited warning (no fail) +20 : idem but some inherited fail.

Parameters
----------
ent: Standard_Transient

Returns
-------
int
") QueryCheckStatus;
		Standard_Integer QueryCheckStatus(const opencascade::handle<Standard_Transient> & ent);

		/****************** QueryParent ******************/
		%feature("compactdefaultargs") QueryParent;
		%feature("autodoc", "Determines if <entdad> is parent of <entson> (in the graph), returns : -1 if no; 0 if <entdad> = <entson> 1 if immediate parent, > 1 if parent, gives count of steps.

Parameters
----------
entdad: Standard_Transient
entson: Standard_Transient

Returns
-------
int
") QueryParent;
		Standard_Integer QueryParent(const opencascade::handle<Standard_Transient> & entdad, const opencascade::handle<Standard_Transient> & entson);

		/****************** ReadFile ******************/
		%feature("compactdefaultargs") ReadFile;
		%feature("autodoc", "Reads a file with the worklibrary (sets model and loadedfile) returns a integer status which can be : retdone if ok, retvoid if no protocol not defined, reterror for file not found, retfail if fail during read.

Parameters
----------
filename: char *

Returns
-------
IFSelect_ReturnStatus
") ReadFile;
		IFSelect_ReturnStatus ReadFile(const char * filename);

		/****************** RemoveItem ******************/
		%feature("compactdefaultargs") RemoveItem;
		%feature("autodoc", "Removes an item given its ident. returns false if <id> is attached to no item in the worksession. for a named item, also removes its name.

Parameters
----------
item: Standard_Transient

Returns
-------
bool
") RemoveItem;
		Standard_Boolean RemoveItem(const opencascade::handle<Standard_Transient> & item);

		/****************** RemoveName ******************/
		%feature("compactdefaultargs") RemoveName;
		%feature("autodoc", "Removes a name without removing the item returns true if done, false else (name not recorded).

Parameters
----------
name: char *

Returns
-------
bool
") RemoveName;
		Standard_Boolean RemoveName(const char * name);

		/****************** RemoveNamedItem ******************/
		%feature("compactdefaultargs") RemoveNamedItem;
		%feature("autodoc", "Removes an item from the session, given its name returns true if done, false else (name not recorded) (applies only on item which are named).

Parameters
----------
name: char *

Returns
-------
bool
") RemoveNamedItem;
		Standard_Boolean RemoveNamedItem(const char * name);

		/****************** ResetAppliedModifier ******************/
		%feature("compactdefaultargs") ResetAppliedModifier;
		%feature("autodoc", "Resets a generalmodifier to be applied returns true if done, false if <modif> was not applied.

Parameters
----------
modif: IFSelect_GeneralModifier

Returns
-------
bool
") ResetAppliedModifier;
		Standard_Boolean ResetAppliedModifier(const opencascade::handle<IFSelect_GeneralModifier> & modif);

		/****************** ResetItemSelection ******************/
		%feature("compactdefaultargs") ResetItemSelection;
		%feature("autodoc", "Resets input selection which was set by setitemselection same conditions as for setitemselection returns true if done, false if <item> is not in the worksession.

Parameters
----------
item: Standard_Transient

Returns
-------
bool
") ResetItemSelection;
		Standard_Boolean ResetItemSelection(const opencascade::handle<Standard_Transient> & item);

		/****************** RunModifier ******************/
		%feature("compactdefaultargs") RunModifier;
		%feature("autodoc", "Runs a modifier on starting model. it can modify entities, or add new ones. but the model or the protocol is unchanged. the modifier is applied on each entity of the model. see also runmodifierselected fills lastrunchecklist //! <copy> : if true, a new data set is produced which brings the modifications (model + its entities) if false, data are modified on the spot //! it works through a transformstandard defined with <modif> returned status as runtransformer : 0 nothing done, >0 ok, <0 problem, but only between -3 and 3 (protocol unchanged) remark : <copy> true will give <effect> = 3 or -3.

Parameters
----------
modif: IFSelect_Modifier
copy: bool

Returns
-------
int
") RunModifier;
		Standard_Integer RunModifier(const opencascade::handle<IFSelect_Modifier> & modif, const Standard_Boolean copy);

		/****************** RunModifierSelected ******************/
		%feature("compactdefaultargs") RunModifierSelected;
		%feature("autodoc", "Acts as runmodifier, but the modifier is applied on the list determined by a selection, rather than on the whole model if the selection is a null handle, the whole model is taken.

Parameters
----------
modif: IFSelect_Modifier
sel: IFSelect_Selection
copy: bool

Returns
-------
int
") RunModifierSelected;
		Standard_Integer RunModifierSelected(const opencascade::handle<IFSelect_Modifier> & modif, const opencascade::handle<IFSelect_Selection> & sel, const Standard_Boolean copy);

		/****************** RunTransformer ******************/
		%feature("compactdefaultargs") RunTransformer;
		%feature("autodoc", "Runs a transformer on starting model, which can then be edited or replaced by a new one. the protocol can also be changed. fills lastrunchecklist //! returned status is 0 if nothing done (<transf> or model undefined), positive if ok, negative else : 0 : nothing done 1 : ok, edition on the spot with no change to the graph of dependances (purely local) 2 : ok, model edited on the spot (graph recomputed, may have changed), protocol unchanged 3 : ok, new model produced, same protocol 4 : ok, model edited on the spot (graph recomputed), but protocol has changed 5 : ok, new model produced, protocol has changed -1 : error on the spot (slight changes), data may be corrupted (remark : corruption should not be profound) -2 : error on edition the spot, data may be corrupted (checking them is recommanded) -3 : error with a new data set, transformation ignored -4 : ok as 4, but graph of dependances count not be recomputed (the former one is kept) : check the protocol.

Parameters
----------
transf: IFSelect_Transformer

Returns
-------
int
") RunTransformer;
		Standard_Integer RunTransformer(const opencascade::handle<IFSelect_Transformer> & transf);

		/****************** Selection ******************/
		%feature("compactdefaultargs") Selection;
		%feature("autodoc", "Returns a selection, given its ident in the session null result if <id> is not suitable for a selection (undefined, or defined for another kind of variable).

Parameters
----------
id: int

Returns
-------
opencascade::handle<IFSelect_Selection>
") Selection;
		opencascade::handle<IFSelect_Selection> Selection(const Standard_Integer id);

		/****************** SelectionResult ******************/
		%feature("compactdefaultargs") SelectionResult;
		%feature("autodoc", "Returns the result of a selection, computed by evalselection (see above) under the form of a hsequence (hence, it can be used by a frontal-engine logic). it can be empty returns a null handle if <sel> is not in the worksession.

Parameters
----------
sel: IFSelect_Selection

Returns
-------
opencascade::handle<TColStd_HSequenceOfTransient>
") SelectionResult;
		opencascade::handle<TColStd_HSequenceOfTransient> SelectionResult(const opencascade::handle<IFSelect_Selection> & sel);

		/****************** SelectionResultFromList ******************/
		%feature("compactdefaultargs") SelectionResultFromList;
		%feature("autodoc", "Returns the result of a selection, by forcing its input with a given list <list> (unless <list> is null). rules : <list> applies only for a selectdeduct kind selection : its input is considered : if it is a selectdeduct kind selection, its input is considered, etc... until an input is not a deduct/extract : its result is replaced by <list> and all the chain of deductions is applied.

Parameters
----------
sel: IFSelect_Selection
list: TColStd_HSequenceOfTransient

Returns
-------
opencascade::handle<TColStd_HSequenceOfTransient>
") SelectionResultFromList;
		opencascade::handle<TColStd_HSequenceOfTransient> SelectionResultFromList(const opencascade::handle<IFSelect_Selection> & sel, const opencascade::handle<TColStd_HSequenceOfTransient> & list);

		/****************** SendAll ******************/
		%feature("compactdefaultargs") SendAll;
		%feature("autodoc", "Sends the starting model into one file, without splitting, managing remaining data or anything else. <computegraph> true commands the graph to be recomputed before sending : required when a model is filled in several steps //! the model and file modifiers recorded to be applied on sending files are. returns a status of execution : done if ok, void if no data available, error if errors occured (work library is not defined), errors during translation fail if exception during translation is raised stop if no disk space or disk, file is write protected fills lastrunchecklist.

Parameters
----------
filename: char *
computegraph: bool,optional
	default value is Standard_False

Returns
-------
IFSelect_ReturnStatus
") SendAll;
		IFSelect_ReturnStatus SendAll(const char * filename, const Standard_Boolean computegraph = Standard_False);

		/****************** SendSelected ******************/
		%feature("compactdefaultargs") SendSelected;
		%feature("autodoc", "Sends a part of the starting model into one file, without splitting. but remaining data are managed. <computegraph> true commands the graph to be recomputed before sending : required when a model is filled in several steps //! the model and file modifiers recorded to be applied on sending files are. returns a status : done if ok, fail if error during send, error : worklibrary not defined, void : selection list empty fills lastrunchecklist.

Parameters
----------
filename: char *
sel: IFSelect_Selection
computegraph: bool,optional
	default value is Standard_False

Returns
-------
IFSelect_ReturnStatus
") SendSelected;
		IFSelect_ReturnStatus SendSelected(const char * filename, const opencascade::handle<IFSelect_Selection> & sel, const Standard_Boolean computegraph = Standard_False);

		/****************** SendSplit ******************/
		%feature("compactdefaultargs") SendSplit;
		%feature("autodoc", "Performs creation of derived files from the input model takes its data (sub-models and names), from result evaluatefile if active, else by dynamic evaluation (not stored) after sendsplit, result of evaluatefile is cleared fills lastrunchecklist //! works with the worklibrary which acts on specific type of model and can work with file modifiers (managed by the model copier) and a modelcopier, which can work with model modifiers returns false if, either worklibrary has failed on at least one sub-file, or the work session is badly conditionned (no model defined, or filenaming not in phase with shareout).

Returns
-------
bool
") SendSplit;
		Standard_Boolean SendSplit();

		/****************** SentFiles ******************/
		%feature("compactdefaultargs") SentFiles;
		%feature("autodoc", "Returns the list of recorded sent files, or a null handle is recording has not been enabled.

Returns
-------
opencascade::handle<TColStd_HSequenceOfHAsciiString>
") SentFiles;
		opencascade::handle<TColStd_HSequenceOfHAsciiString> SentFiles();

		/****************** SentList ******************/
		%feature("compactdefaultargs") SentList;
		%feature("autodoc", "Returns the list of entities sent in files, accourding the count of files each one has been sent (these counts are reset by setmodel or setremaining(forget) ) stored in graph status <count> = -1 (default) is for entities sent at least once <count> = 0 is for the remaining list (entities not yet sent) <count> = 1 is for entities sent in one and only one file (the ideal case) remaining data are computed on each sending/copying output files (see methods evaluatefile and sendsplit) graph status is 0 for remaining entity, <count> for sent into <count> files this status is set to 0 (not yet sent) for all by setmodel and by setremaining(mode=forget,display).

Parameters
----------
count: int,optional
	default value is -1

Returns
-------
Interface_EntityIterator
") SentList;
		Interface_EntityIterator SentList(const Standard_Integer count = -1);

		/****************** SetActive ******************/
		%feature("compactdefaultargs") SetActive;
		%feature("autodoc", "Following the type of <item> : - dispatch : adds or removes it in the shareout & filenaming - generalmodifier : adds or removes it for final sending (i.e. in the modelcopier) returns true if it did something, false else (state unchanged).

Parameters
----------
item: Standard_Transient
mode: bool

Returns
-------
bool
") SetActive;
		Standard_Boolean SetActive(const opencascade::handle<Standard_Transient> & item, const Standard_Boolean mode);

		/****************** SetAppliedModifier ******************/
		%feature("compactdefaultargs") SetAppliedModifier;
		%feature("autodoc", "Sets a generalmodifier to be applied to an item : - item = shareout : applies for final sending (all dispatches) - item is a dispatch : applies for this dispatch only returns true if done, false if <modif> or <item> not in <self>.

Parameters
----------
modif: IFSelect_GeneralModifier
item: Standard_Transient

Returns
-------
bool
") SetAppliedModifier;
		Standard_Boolean SetAppliedModifier(const opencascade::handle<IFSelect_GeneralModifier> & modif, const opencascade::handle<Standard_Transient> & item);

		/****************** SetControl ******************/
		%feature("compactdefaultargs") SetControl;
		%feature("autodoc", "Sets an input selection, main if <formain> is true, second else (as <sc>) to a selectcontrol (as <sel>). returns true if done, false if <sel> is not a selectcontrol, or <sc> or <sel> is not in the worksession.

Parameters
----------
sel: IFSelect_Selection
sc: IFSelect_Selection
formain: bool,optional
	default value is Standard_True

Returns
-------
bool
") SetControl;
		Standard_Boolean SetControl(const opencascade::handle<IFSelect_Selection> & sel, const opencascade::handle<IFSelect_Selection> & sc, const Standard_Boolean formain = Standard_True);

		/****************** SetDefaultFileRoot ******************/
		%feature("compactdefaultargs") SetDefaultFileRoot;
		%feature("autodoc", "Defines a default file root name. clears it is <name> = '' returns true if ok, false if <name> already set for a dispatch.

Parameters
----------
name: char *

Returns
-------
bool
") SetDefaultFileRoot;
		Standard_Boolean SetDefaultFileRoot(const char * name);

		/****************** SetErrorHandle ******************/
		%feature("compactdefaultargs") SetErrorHandle;
		%feature("autodoc", "Changes the error handler status (by default, it is not set).

Parameters
----------
toHandle: bool

Returns
-------
None
") SetErrorHandle;
		void SetErrorHandle(const Standard_Boolean toHandle);

		/****************** SetFileExtension ******************/
		%feature("compactdefaultargs") SetFileExtension;
		%feature("autodoc", "Defines a file extension.

Parameters
----------
name: char *

Returns
-------
None
") SetFileExtension;
		void SetFileExtension(const char * name);

		/****************** SetFilePrefix ******************/
		%feature("compactdefaultargs") SetFilePrefix;
		%feature("autodoc", "Defines a file prefix.

Parameters
----------
name: char *

Returns
-------
None
") SetFilePrefix;
		void SetFilePrefix(const char * name);

		/****************** SetFileRoot ******************/
		%feature("compactdefaultargs") SetFileRoot;
		%feature("autodoc", "Defines a root for a dispatch if <name> is empty, clears root name this has as effect to inhibit the production of file by <disp> returns false if <disp> is not in the worksession or if a root name is already defined for it.

Parameters
----------
disp: IFSelect_Dispatch
name: char *

Returns
-------
bool
") SetFileRoot;
		Standard_Boolean SetFileRoot(const opencascade::handle<IFSelect_Dispatch> & disp, const char * name);

		/****************** SetInputSelection ******************/
		%feature("compactdefaultargs") SetInputSelection;
		%feature("autodoc", "Sets an input selection (as <input>) to a selectextract or a selectdeduct (as <sel>). returns true if done, false if <sel> is neither a selectextract nor a selectdeduct, or not in the worksession.

Parameters
----------
sel: IFSelect_Selection
input: IFSelect_Selection

Returns
-------
bool
") SetInputSelection;
		Standard_Boolean SetInputSelection(const opencascade::handle<IFSelect_Selection> & sel, const opencascade::handle<IFSelect_Selection> & input);

		/****************** SetIntValue ******************/
		%feature("compactdefaultargs") SetIntValue;
		%feature("autodoc", "Changes the integer value of an intparam returns true if done, false if <it> is not in the worksession.

Parameters
----------
it: IFSelect_IntParam
val: int

Returns
-------
bool
") SetIntValue;
		Standard_Boolean SetIntValue(const opencascade::handle<IFSelect_IntParam> & it, const Standard_Integer val);

		/****************** SetItemSelection ******************/
		%feature("compactdefaultargs") SetItemSelection;
		%feature("autodoc", "Sets a selection as input for an item, according its type : if <item> is a dispatch : as final selection if <item> is a generalmodifier (i.e. any kind of modifier) : as selection used to filter entities to modify <sel> null causes this selection to be nullified returns false if <item> is not of a suitable type, or <item> or <sel> is not in the worksession.

Parameters
----------
item: Standard_Transient
sel: IFSelect_Selection

Returns
-------
bool
") SetItemSelection;
		Standard_Boolean SetItemSelection(const opencascade::handle<Standard_Transient> & item, const opencascade::handle<IFSelect_Selection> & sel);

		/****************** SetLibrary ******************/
		%feature("compactdefaultargs") SetLibrary;
		%feature("autodoc", "Sets a worklibrary, which will be used to read and write files.

Parameters
----------
theLib: IFSelect_WorkLibrary

Returns
-------
None
") SetLibrary;
		void SetLibrary(const opencascade::handle<IFSelect_WorkLibrary> & theLib);

		/****************** SetLoadedFile ******************/
		%feature("compactdefaultargs") SetLoadedFile;
		%feature("autodoc", "Stores the filename used for read for setting the model it is cleared by setmodel and cleardata(1).

Parameters
----------
theFileName: char *

Returns
-------
None
") SetLoadedFile;
		void SetLoadedFile(const char * theFileName);

		/****************** SetModeStat ******************/
		%feature("compactdefaultargs") SetModeStat;
		%feature("autodoc", "Set value of mode responsible for precence of selections after loading if mode set to true that different selections will be accessible after loading else selections will be not accessible after loading( for economy memory in applicatios).

Parameters
----------
theMode: bool

Returns
-------
None
") SetModeStat;
		void SetModeStat(const Standard_Boolean theMode);

		/****************** SetModel ******************/
		%feature("compactdefaultargs") SetModel;
		%feature("autodoc", "Sets a model as input : this will be the model from which the shareout will work if <clearpointed> is true (default) all selectpointed items are cleared, else they must be managed by the caller remark : setmodel clears the graph, recomputes it if a protocol is set and if the model is not empty, of course.

Parameters
----------
model: Interface_InterfaceModel
clearpointed: bool,optional
	default value is Standard_True

Returns
-------
None
") SetModel;
		void SetModel(const opencascade::handle<Interface_InterfaceModel> & model, const Standard_Boolean clearpointed = Standard_True);

		/****************** SetModelContent ******************/
		%feature("compactdefaultargs") SetModelContent;
		%feature("autodoc", "Defines a new content from the former one if <keep> is true, it is given by entities selected by selection <sel> (and all shared entities) else, it is given by all the former content but entities selected by the selection <sel> (and properly shared ones) returns true if done. returns false if the selected list (from <sel>) is empty, hence nothing is done.

Parameters
----------
sel: IFSelect_Selection
keep: bool

Returns
-------
bool
") SetModelContent;
		Standard_Boolean SetModelContent(const opencascade::handle<IFSelect_Selection> & sel, const Standard_Boolean keep);

		/****************** SetModelCopier ******************/
		%feature("compactdefaultargs") SetModelCopier;
		%feature("autodoc", "Sets a new modelcopier. fills items which its content.

Parameters
----------
copier: IFSelect_ModelCopier

Returns
-------
None
") SetModelCopier;
		void SetModelCopier(const opencascade::handle<IFSelect_ModelCopier> & copier);

		/****************** SetParams ******************/
		%feature("compactdefaultargs") SetParams;
		%feature("autodoc", "Sets a list of parameters, i.e. typedvalue, to be handled through an editor the two lists are parallel, if <params> is longer than <uses>, surnumeral parameters are for general use //! editforms are created to handle these parameters (list, edit) on the basis of a parameditor xst-params-edit //! a use number dispatches the parameter to a given editform editforms are defined as follows name use means xst-params all all parameters (complete list) xst-params-general 1 generals xst-params-load 2 loadfile (no transfer) xst-params-send 3 sendfile (write, no transfer) xst-params-split 4 split xst-param-read 5 transfer on reading xst-param-write 6 transfer on writing.

Parameters
----------
params: Standard_Transient
uselist: NCollection_Vector<int>

Returns
-------
None
") SetParams;
		void SetParams(const NCollection_Vector<opencascade::handle<Standard_Transient> > & params, const NCollection_Vector<Standard_Integer> & uselist);

		/****************** SetProtocol ******************/
		%feature("compactdefaultargs") SetProtocol;
		%feature("autodoc", "Sets a protocol, which will be used to determine graphs, to read and to write files.

Parameters
----------
protocol: Interface_Protocol

Returns
-------
None
") SetProtocol;
		void SetProtocol(const opencascade::handle<Interface_Protocol> & protocol);

		/****************** SetRemaining ******************/
		%feature("compactdefaultargs") SetRemaining;
		%feature("autodoc", "Processes remaining data (after having sent files), mode : forget : forget remaining info (i.e. clear all 'sent' status) compute : compute and keep remaining (does nothing if : remaining is empty or if no files has been sent) display : display entities recorded as remaining undo : restore former state of data (after remaining(1) ) returns true if ok, false else (i.e. mode = 2 and remaining list is either empty or takes all the entities, or mode = 3 and no former computation of remaining data was done).

Parameters
----------
mode: IFSelect_RemainMode

Returns
-------
bool
") SetRemaining;
		Standard_Boolean SetRemaining(const IFSelect_RemainMode mode);

		/****************** SetSelectPointed ******************/
		%feature("compactdefaultargs") SetSelectPointed;
		%feature("autodoc", "Changes the content of a selection of type selectpointed according <mode> : 0 set <list> as new content (clear former) 1 : adds <list> to actual content -1 : removes <list> from actual content returns true if done, false if <sel> is not a selectpointed.

Parameters
----------
sel: IFSelect_Selection
list: TColStd_HSequenceOfTransient
mode: int

Returns
-------
bool
") SetSelectPointed;
		Standard_Boolean SetSelectPointed(const opencascade::handle<IFSelect_Selection> & sel, const opencascade::handle<TColStd_HSequenceOfTransient> & list, const Standard_Integer mode);

		/****************** SetShareOut ******************/
		%feature("compactdefaultargs") SetShareOut;
		%feature("autodoc", "Sets a new shareout. fills items which its content warning : data from the former shareout are lost.

Parameters
----------
shareout: IFSelect_ShareOut

Returns
-------
None
") SetShareOut;
		void SetShareOut(const opencascade::handle<IFSelect_ShareOut> & shareout);

		/****************** SetSignType ******************/
		%feature("compactdefaultargs") SetSignType;
		%feature("autodoc", "Sets a specific signature to be the signtype, i.e. the signature which will determine typename from the model (basic function). it is recorded in the gtool this signature is also set as 'xst-sign-type' (reserved name).

Parameters
----------
signtype: IFSelect_Signature

Returns
-------
None
") SetSignType;
		void SetSignType(const opencascade::handle<IFSelect_Signature> & signtype);

		/****************** SetTextValue ******************/
		%feature("compactdefaultargs") SetTextValue;
		%feature("autodoc", "Changes the text value of a textparam (an hasciistring) returns true if done, false if <it> is not in the worksession.

Parameters
----------
par: TCollection_HAsciiString
val: char *

Returns
-------
bool
") SetTextValue;
		Standard_Boolean SetTextValue(const opencascade::handle<TCollection_HAsciiString> & par, const char * val);

		/****************** ShareOut ******************/
		%feature("compactdefaultargs") ShareOut;
		%feature("autodoc", "Returns the shareout defined at creation time.

Returns
-------
opencascade::handle<IFSelect_ShareOut>
") ShareOut;
		const opencascade::handle<IFSelect_ShareOut> & ShareOut();

		/****************** Shareds ******************/
		%feature("compactdefaultargs") Shareds;
		%feature("autodoc", "Returns the list of entities shared by <ent> (can be empty) returns a null handle if <ent> is unknown.

Parameters
----------
ent: Standard_Transient

Returns
-------
opencascade::handle<TColStd_HSequenceOfTransient>
") Shareds;
		opencascade::handle<TColStd_HSequenceOfTransient> Shareds(const opencascade::handle<Standard_Transient> & ent);

		/****************** Sharings ******************/
		%feature("compactdefaultargs") Sharings;
		%feature("autodoc", "Returns the list of entities sharing <ent> (can be empty) returns a null handle if <ent> is unknown.

Parameters
----------
ent: Standard_Transient

Returns
-------
opencascade::handle<TColStd_HSequenceOfTransient>
") Sharings;
		opencascade::handle<TColStd_HSequenceOfTransient> Sharings(const opencascade::handle<Standard_Transient> & ent);

		/****************** SignCounter ******************/
		%feature("compactdefaultargs") SignCounter;
		%feature("autodoc", "Returns a signcounter from its ident in the session null result if <id> is not suitable for a signcounter (undefined, or defined for another kind of variable).

Parameters
----------
id: int

Returns
-------
opencascade::handle<IFSelect_SignCounter>
") SignCounter;
		opencascade::handle<IFSelect_SignCounter> SignCounter(const Standard_Integer id);

		/****************** SignType ******************/
		%feature("compactdefaultargs") SignType;
		%feature("autodoc", "Returns the current signtype.

Returns
-------
opencascade::handle<IFSelect_Signature>
") SignType;
		opencascade::handle<IFSelect_Signature> SignType();

		/****************** SignValue ******************/
		%feature("compactdefaultargs") SignValue;
		%feature("autodoc", "Returns the value computed by a signature for an entity returns an empty string if the entity does not belong to the loaded model.

Parameters
----------
sign: IFSelect_Signature
ent: Standard_Transient

Returns
-------
char *
") SignValue;
		const char * SignValue(const opencascade::handle<IFSelect_Signature> & sign, const opencascade::handle<Standard_Transient> & ent);

		/****************** Signature ******************/
		%feature("compactdefaultargs") Signature;
		%feature("autodoc", "Returns a signature, given its ident in the session null result if <id> is not suitable for a signature (undefined, or defined for another kind of variable).

Parameters
----------
id: int

Returns
-------
opencascade::handle<IFSelect_Signature>
") Signature;
		opencascade::handle<IFSelect_Signature> Signature(const Standard_Integer id);

		/****************** Source ******************/
		%feature("compactdefaultargs") Source;
		%feature("autodoc", "Returns the <num>th input selection of a selection (see nbsources). returns a null handle if <sel> is not in the worksession or if <num> is out of the range <1-nbsources> to obtain more details, see the method sources.

Parameters
----------
sel: IFSelect_Selection
num: int,optional
	default value is 1

Returns
-------
opencascade::handle<IFSelect_Selection>
") Source;
		opencascade::handle<IFSelect_Selection> Source(const opencascade::handle<IFSelect_Selection> & sel, const Standard_Integer num = 1);

		/****************** Sources ******************/
		%feature("compactdefaultargs") Sources;
		%feature("autodoc", "Returns the selections which are source of selection, given its rank in the list of selections (see selectioniterator) returned value is empty if <num> is out of range or if <sel> is not in the worksession.

Parameters
----------
sel: IFSelect_Selection

Returns
-------
IFSelect_SelectionIterator
") Sources;
		IFSelect_SelectionIterator Sources(const opencascade::handle<IFSelect_Selection> & sel);

		/****************** StartingEntity ******************/
		%feature("compactdefaultargs") StartingEntity;
		%feature("autodoc", "Returns an entity stored in the model of the worksession (null handle is no model or num out of range).

Parameters
----------
num: int

Returns
-------
opencascade::handle<Standard_Transient>
") StartingEntity;
		opencascade::handle<Standard_Transient> StartingEntity(const Standard_Integer num);

		/****************** StartingNumber ******************/
		%feature("compactdefaultargs") StartingNumber;
		%feature("autodoc", "Returns the number of an entity in the model (0 if no model set or <ent> not in the model).

Parameters
----------
ent: Standard_Transient

Returns
-------
int
") StartingNumber;
		Standard_Integer StartingNumber(const opencascade::handle<Standard_Transient> & ent);

		/****************** TextParam ******************/
		%feature("compactdefaultargs") TextParam;
		%feature("autodoc", "Returns a textparam, given its ident in the session null result if <id> is not suitable for a textparam (undefined, or defined for another kind of variable).

Parameters
----------
id: int

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") TextParam;
		opencascade::handle<TCollection_HAsciiString> TextParam(const Standard_Integer id);

		/****************** TextValue ******************/
		%feature("compactdefaultargs") TextValue;
		%feature("autodoc", "Returns text value of a textparam (a string) or an empty string if <it> is not in the worksession.

Parameters
----------
par: TCollection_HAsciiString

Returns
-------
TCollection_AsciiString
") TextValue;
		TCollection_AsciiString TextValue(const opencascade::handle<TCollection_HAsciiString> & par);

		/****************** ToggleSelectExtract ******************/
		%feature("compactdefaultargs") ToggleSelectExtract;
		%feature("autodoc", "Toggles the sense (direct <-> reversed) of a selectextract returns true if done, false if <sel> is not a selectextract or is not in the worksession.

Parameters
----------
sel: IFSelect_Selection

Returns
-------
bool
") ToggleSelectExtract;
		Standard_Boolean ToggleSelectExtract(const opencascade::handle<IFSelect_Selection> & sel);

		/****************** TraceDumpEntity ******************/
		%feature("compactdefaultargs") TraceDumpEntity;
		%feature("autodoc", "Dumps an entity from the current model as inherited dumpentity on currently defined default trace file (<level> interpreted according to the norm, see worklibrary).

Parameters
----------
ent: Standard_Transient
level: int

Returns
-------
None
") TraceDumpEntity;
		void TraceDumpEntity(const opencascade::handle<Standard_Transient> & ent, const Standard_Integer level);

		/****************** TraceDumpModel ******************/
		%feature("compactdefaultargs") TraceDumpModel;
		%feature("autodoc", "Dumps the current model (as inherited dumpmodel), on currently defined default trace file (default is standard output).

Parameters
----------
mode: int

Returns
-------
None
") TraceDumpModel;
		void TraceDumpModel(const Standard_Integer mode);

		/****************** TraceStatics ******************/
		%feature("compactdefaultargs") TraceStatics;
		%feature("autodoc", "Traces the statics attached to a given use number if <use> is given positive (normal), the trace is embedded with a header and a trailer if <use> is negative, just values are printed (this allows to make compositions) remark : use number 5 commands use -2 to be traced remark : use numbers 4 and 6 command use -3 to be traced.

Parameters
----------
use: int
mode: int,optional
	default value is 0

Returns
-------
None
") TraceStatics;
		void TraceStatics(const Standard_Integer use, const Standard_Integer mode = 0);

		/****************** Transformer ******************/
		%feature("compactdefaultargs") Transformer;
		%feature("autodoc", "Returns a transformer, given its ident in the session null result if <id> is not suitable for a transformer (undefined, or defined for another kind of variable).

Parameters
----------
id: int

Returns
-------
opencascade::handle<IFSelect_Transformer>
") Transformer;
		opencascade::handle<IFSelect_Transformer> Transformer(const Standard_Integer id);

		/****************** UsesAppliedModifier ******************/
		%feature("compactdefaultargs") UsesAppliedModifier;
		%feature("autodoc", "Returns the item on which a generalmodifier is applied : the shareout, or a given dispatch returns a null handle if <modif> is not applied.

Parameters
----------
modif: IFSelect_GeneralModifier

Returns
-------
opencascade::handle<Standard_Transient>
") UsesAppliedModifier;
		opencascade::handle<Standard_Transient> UsesAppliedModifier(const opencascade::handle<IFSelect_GeneralModifier> & modif);

		/****************** ValidityName ******************/
		%feature("compactdefaultargs") ValidityName;
		%feature("autodoc", "Returns the validity name determined for an entity it is computed by the class signvalidity remark : an unknown entity gives an empty string.

Parameters
----------
ent: Standard_Transient

Returns
-------
char *
") ValidityName;
		const char * ValidityName(const opencascade::handle<Standard_Transient> & ent);

		/****************** WorkLibrary ******************/
		%feature("compactdefaultargs") WorkLibrary;
		%feature("autodoc", "Returns the worklibrary. null handle if not yet set should be c++ : return const &.

Returns
-------
opencascade::handle<IFSelect_WorkLibrary>
") WorkLibrary;
		const opencascade::handle<IFSelect_WorkLibrary> & WorkLibrary();

		/****************** WriteFile ******************/
		%feature("compactdefaultargs") WriteFile;
		%feature("autodoc", "Writes the current interface model globally to a file, and returns a write status which can be : done ok, fail file could not be written, error no norm is selected remark : it is a simple, one-file writing, other operations are available (such as splitting ...) which calls sendall.

Parameters
----------
filename: char *

Returns
-------
IFSelect_ReturnStatus
") WriteFile;
		IFSelect_ReturnStatus WriteFile(const char * filename);

		/****************** WriteFile ******************/
		%feature("compactdefaultargs") WriteFile;
		%feature("autodoc", "Writes a sub-part of the current interface model to a file, as defined by a selection <sel>, recomputes the graph, and returns a write status which can be : done ok, fail file could not be written, error no norm is selected remark : it is a simple, one-file writing, other operations are available (such as splitting ...) which calls sendselected.

Parameters
----------
filename: char *
sel: IFSelect_Selection

Returns
-------
IFSelect_ReturnStatus
") WriteFile;
		IFSelect_ReturnStatus WriteFile(const char * filename, const opencascade::handle<IFSelect_Selection> & sel);

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
		/****************** IFSelect_Act ******************/
		%feature("compactdefaultargs") IFSelect_Act;
		%feature("autodoc", "Creates an act with a name, help and a function mode (add or addset) is given when recording.

Parameters
----------
name: char *
help: char *
func: IFSelect_ActFunc

Returns
-------
None
") IFSelect_Act;
		 IFSelect_Act(const char * name, const char * help, const IFSelect_ActFunc func);

		/****************** AddFSet ******************/
		%feature("compactdefaultargs") AddFSet;
		%feature("autodoc", "Adds a function with its name and help : creates an act then records it as function for xset (i.e. to create control item).

Parameters
----------
name: char *
help: char *
func: IFSelect_ActFunc

Returns
-------
None
") AddFSet;
		static void AddFSet(const char * name, const char * help, const IFSelect_ActFunc func);

		/****************** AddFunc ******************/
		%feature("compactdefaultargs") AddFunc;
		%feature("autodoc", "Adds a function with its name and help : creates an act then records it as normal function.

Parameters
----------
name: char *
help: char *
func: IFSelect_ActFunc

Returns
-------
None
") AddFunc;
		static void AddFunc(const char * name, const char * help, const IFSelect_ActFunc func);

		/****************** Do ******************/
		%feature("compactdefaultargs") Do;
		%feature("autodoc", "Execution of command line. remark that <number> is senseless because each act brings one and only one function.

Parameters
----------
number: int
pilot: IFSelect_SessionPilot

Returns
-------
IFSelect_ReturnStatus
") Do;
		IFSelect_ReturnStatus Do(const Standard_Integer number, const opencascade::handle<IFSelect_SessionPilot> & pilot);

		/****************** Help ******************/
		%feature("compactdefaultargs") Help;
		%feature("autodoc", "Short help for commands : returns the help given to create.

Parameters
----------
number: int

Returns
-------
char *
") Help;
		const char * Help(const Standard_Integer number);

		/****************** SetGroup ******************/
		%feature("compactdefaultargs") SetGroup;
		%feature("autodoc", "Changes the default group name for the following acts group empty means to come back to default from activator also a file name can be precised (to query by getsource).

Parameters
----------
group: char *
file: char *,optional
	default value is ""

Returns
-------
None
") SetGroup;
		static void SetGroup(const char * group, const char * file = "");

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
		/****************** IFSelect_BasicDumper ******************/
		%feature("compactdefaultargs") IFSelect_BasicDumper;
		%feature("autodoc", "Creates a basicdumper and puts it into the library of dumper.

Returns
-------
None
") IFSelect_BasicDumper;
		 IFSelect_BasicDumper();

		/****************** ReadOwn ******************/
		%feature("compactdefaultargs") ReadOwn;
		%feature("autodoc", "Recognizes and read own parameters for types of package ifselect. returns true if done and <item> created, false else.

Parameters
----------
file: IFSelect_SessionFile
type: TCollection_AsciiString
item: Standard_Transient

Returns
-------
bool
") ReadOwn;
		Standard_Boolean ReadOwn(IFSelect_SessionFile & file, const TCollection_AsciiString & type, opencascade::handle<Standard_Transient> & item);

		/****************** WriteOwn ******************/
		%feature("compactdefaultargs") WriteOwn;
		%feature("autodoc", "Write the own parameters of types defined in package ifselect returns true if <item> has been processed, false else.

Parameters
----------
file: IFSelect_SessionFile
item: Standard_Transient

Returns
-------
bool
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
		/****************** IFSelect_CheckCounter ******************/
		%feature("compactdefaultargs") IFSelect_CheckCounter;
		%feature("autodoc", "Creates a checkcounter, empty ready to work.

Parameters
----------
withlist: bool,optional
	default value is Standard_False

Returns
-------
None
") IFSelect_CheckCounter;
		 IFSelect_CheckCounter(const Standard_Boolean withlist = Standard_False);

		/****************** Analyse ******************/
		%feature("compactdefaultargs") Analyse;
		%feature("autodoc", "Analyses a checkiterator according a model (which detains the entities for which the checkiterator has messages), i.e. counts messages for entities if <original> is true, does not consider final messages but those before interpretation (such as inserting variables : integers, reals, strings) if <failsonly> is true, only fails are considered remark : global messages are recorded with a null entity.

Parameters
----------
list: Interface_CheckIterator
model: Interface_InterfaceModel
original: bool,optional
	default value is Standard_False
failsonly: bool,optional
	default value is Standard_False

Returns
-------
None
") Analyse;
		void Analyse(const Interface_CheckIterator & list, const opencascade::handle<Interface_InterfaceModel> & model, const Standard_Boolean original = Standard_False, const Standard_Boolean failsonly = Standard_False);

		/****************** SetSignature ******************/
		%feature("compactdefaultargs") SetSignature;
		%feature("autodoc", "Sets a specific signature else, the current signtype (in the model) is used.

Parameters
----------
sign: MoniTool_SignText

Returns
-------
None
") SetSignature;
		void SetSignature(const opencascade::handle<MoniTool_SignText> & sign);

		/****************** Signature ******************/
		%feature("compactdefaultargs") Signature;
		%feature("autodoc", "Returns the signature;.

Returns
-------
opencascade::handle<MoniTool_SignText>
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
		/****************** IFSelect_DispGlobal ******************/
		%feature("compactdefaultargs") IFSelect_DispGlobal;
		%feature("autodoc", "Creates a dispglobal.

Returns
-------
None
") IFSelect_DispGlobal;
		 IFSelect_DispGlobal();

		/****************** Label ******************/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "Returns as label, 'one file for all input'.

Returns
-------
TCollection_AsciiString
") Label;
		TCollection_AsciiString Label();

		/****************** LimitedMax ******************/
		%feature("compactdefaultargs") LimitedMax;
		%feature("autodoc", "Returns true : maximum equates 1.

Parameters
----------
nbent: int

Returns
-------
max: int
") LimitedMax;
		virtual Standard_Boolean LimitedMax(const Standard_Integer nbent, Standard_Integer &OutValue);

		/****************** Packets ******************/
		%feature("compactdefaultargs") Packets;
		%feature("autodoc", "Computes the list of produced packets. it is made of only one packet, which gets the rootresult from the final selection. remark : the inherited exception raising is never activated.

Parameters
----------
G: Interface_Graph
packs: IFGraph_SubPartsIterator

Returns
-------
None
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
		/****************** IFSelect_DispPerCount ******************/
		%feature("compactdefaultargs") IFSelect_DispPerCount;
		%feature("autodoc", "Creates a disppercount with no count (default value 1).

Returns
-------
None
") IFSelect_DispPerCount;
		 IFSelect_DispPerCount();

		/****************** Count ******************/
		%feature("compactdefaultargs") Count;
		%feature("autodoc", "Returns the count parameter used for splitting.

Returns
-------
opencascade::handle<IFSelect_IntParam>
") Count;
		opencascade::handle<IFSelect_IntParam> Count();

		/****************** CountValue ******************/
		%feature("compactdefaultargs") CountValue;
		%feature("autodoc", "Returns the effective value of the count parameter (if count parameter not set or value not positive, returns 1).

Returns
-------
int
") CountValue;
		Standard_Integer CountValue();

		/****************** Label ******************/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "Returns as label, 'one file per <count> input entities'.

Returns
-------
TCollection_AsciiString
") Label;
		TCollection_AsciiString Label();

		/****************** LimitedMax ******************/
		%feature("compactdefaultargs") LimitedMax;
		%feature("autodoc", "Returns true, maximum count is given as <nbent>.

Parameters
----------
nbent: int

Returns
-------
max: int
") LimitedMax;
		virtual Standard_Boolean LimitedMax(const Standard_Integer nbent, Standard_Integer &OutValue);

		/****************** Packets ******************/
		%feature("compactdefaultargs") Packets;
		%feature("autodoc", "Computes the list of produced packets. it defines packets in order to have at most <count> entities per packet, entities are given by rootresult from the final selection.

Parameters
----------
G: Interface_Graph
packs: IFGraph_SubPartsIterator

Returns
-------
None
") Packets;
		void Packets(const Interface_Graph & G, IFGraph_SubPartsIterator & packs);

		/****************** SetCount ******************/
		%feature("compactdefaultargs") SetCount;
		%feature("autodoc", "Sets a new parameter for count.

Parameters
----------
count: IFSelect_IntParam

Returns
-------
None
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
		/****************** IFSelect_DispPerFiles ******************/
		%feature("compactdefaultargs") IFSelect_DispPerFiles;
		%feature("autodoc", "Creates a dispperfiles with no count (default value 1 file).

Returns
-------
None
") IFSelect_DispPerFiles;
		 IFSelect_DispPerFiles();

		/****************** Count ******************/
		%feature("compactdefaultargs") Count;
		%feature("autodoc", "Returns the count parameter used for splitting.

Returns
-------
opencascade::handle<IFSelect_IntParam>
") Count;
		opencascade::handle<IFSelect_IntParam> Count();

		/****************** CountValue ******************/
		%feature("compactdefaultargs") CountValue;
		%feature("autodoc", "Returns the effective value of the count parameter (if count parameter not set or value not positive, returns 1).

Returns
-------
int
") CountValue;
		Standard_Integer CountValue();

		/****************** Label ******************/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "Returns as label, 'maximum <count> files'.

Returns
-------
TCollection_AsciiString
") Label;
		TCollection_AsciiString Label();

		/****************** LimitedMax ******************/
		%feature("compactdefaultargs") LimitedMax;
		%feature("autodoc", "Returns true, maximum count is given as countvalue.

Parameters
----------
nbent: int

Returns
-------
max: int
") LimitedMax;
		virtual Standard_Boolean LimitedMax(const Standard_Integer nbent, Standard_Integer &OutValue);

		/****************** Packets ******************/
		%feature("compactdefaultargs") Packets;
		%feature("autodoc", "Computes the list of produced packets. it defines packets in order to have <count> packets, except if the input count of entities is lower. entities are given by rootresult from the final selection.

Parameters
----------
G: Interface_Graph
packs: IFGraph_SubPartsIterator

Returns
-------
None
") Packets;
		void Packets(const Interface_Graph & G, IFGraph_SubPartsIterator & packs);

		/****************** SetCount ******************/
		%feature("compactdefaultargs") SetCount;
		%feature("autodoc", "Sets a new parameter for count.

Parameters
----------
count: IFSelect_IntParam

Returns
-------
None
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
		/****************** IFSelect_DispPerOne ******************/
		%feature("compactdefaultargs") IFSelect_DispPerOne;
		%feature("autodoc", "Creates a dispperone.

Returns
-------
None
") IFSelect_DispPerOne;
		 IFSelect_DispPerOne();

		/****************** Label ******************/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "Returns as label, 'one file per input entity'.

Returns
-------
TCollection_AsciiString
") Label;
		TCollection_AsciiString Label();

		/****************** LimitedMax ******************/
		%feature("compactdefaultargs") LimitedMax;
		%feature("autodoc", "Returns true, maximum limit is given as <nbent>.

Parameters
----------
nbent: int

Returns
-------
max: int
") LimitedMax;
		virtual Standard_Boolean LimitedMax(const Standard_Integer nbent, Standard_Integer &OutValue);

		/****************** Packets ******************/
		%feature("compactdefaultargs") Packets;
		%feature("autodoc", "Returns the list of produced packets. it defines one packet per entity given by rootresult from the final selection.

Parameters
----------
G: Interface_Graph
packs: IFGraph_SubPartsIterator

Returns
-------
None
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
		/****************** IFSelect_DispPerSignature ******************/
		%feature("compactdefaultargs") IFSelect_DispPerSignature;
		%feature("autodoc", "Creates a disppersignature with no signcounter (by default, produces only one packet).

Returns
-------
None
") IFSelect_DispPerSignature;
		 IFSelect_DispPerSignature();

		/****************** Label ******************/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "Returns as label, 'one file per signature <name>'.

Returns
-------
TCollection_AsciiString
") Label;
		TCollection_AsciiString Label();

		/****************** LimitedMax ******************/
		%feature("compactdefaultargs") LimitedMax;
		%feature("autodoc", "Returns true, maximum count is given as <nbent>.

Parameters
----------
nbent: int

Returns
-------
max: int
") LimitedMax;
		virtual Standard_Boolean LimitedMax(const Standard_Integer nbent, Standard_Integer &OutValue);

		/****************** Packets ******************/
		%feature("compactdefaultargs") Packets;
		%feature("autodoc", "Computes the list of produced packets. it defines packets from the signcounter, which sirts the input entities per signature (specific of the signcounter).

Parameters
----------
G: Interface_Graph
packs: IFGraph_SubPartsIterator

Returns
-------
None
") Packets;
		void Packets(const Interface_Graph & G, IFGraph_SubPartsIterator & packs);

		/****************** SetSignCounter ******************/
		%feature("compactdefaultargs") SetSignCounter;
		%feature("autodoc", "Sets a signcounter for sort remark : it is set to record lists of entities, not only counts.

Parameters
----------
sign: IFSelect_SignCounter

Returns
-------
None
") SetSignCounter;
		void SetSignCounter(const opencascade::handle<IFSelect_SignCounter> & sign);

		/****************** SignCounter ******************/
		%feature("compactdefaultargs") SignCounter;
		%feature("autodoc", "Returns the signcounter used for splitting.

Returns
-------
opencascade::handle<IFSelect_SignCounter>
") SignCounter;
		opencascade::handle<IFSelect_SignCounter> SignCounter();

		/****************** SignName ******************/
		%feature("compactdefaultargs") SignName;
		%feature("autodoc", "Returns the name of the signcounter, which caracterises the sorting criterium for this dispatch.

Returns
-------
char *
") SignName;
		const char * SignName();

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
		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "This deferred method defines the action specific to each class of modifier. it is called by a modelcopier, once the model generated and filled. modelcopier has already checked the criteria (dispatch, model rank, selection) before calling it. //! <ctx> detains informations about original data and selection. the result of copying, on which modifications are to be done, is <target>. <tc> allows to run additional copies as required //! in case of error, use methods ccheck from the contextmodif to aknowledge an entity check or a global check with messages.

Parameters
----------
ctx: IFSelect_ContextModif
target: Interface_InterfaceModel
protocol: Interface_Protocol
TC: Interface_CopyTool

Returns
-------
None
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
		/****************** IFSelect_ParamEditor ******************/
		%feature("compactdefaultargs") IFSelect_ParamEditor;
		%feature("autodoc", "Creates a parameditor, empty, with a maximum count of params (default is 100) and a label, by default it will be 'param editor'.

Parameters
----------
nbmax: int,optional
	default value is 100
label: char *,optional
	default value is ""

Returns
-------
None
") IFSelect_ParamEditor;
		 IFSelect_ParamEditor(const Standard_Integer nbmax = 100, const char * label = "");

		/****************** AddConstantText ******************/
		%feature("compactdefaultargs") AddConstantText;
		%feature("autodoc", "Adds a constant text, it will be read only by default, its long name equates its shortname.

Parameters
----------
val: char *
shortname: char *
completename: char *,optional
	default value is ""

Returns
-------
None
") AddConstantText;
		void AddConstantText(const char * val, const char * shortname, const char * completename = "");

		/****************** AddValue ******************/
		%feature("compactdefaultargs") AddValue;
		%feature("autodoc", "Adds a typedvalue by default, its short name equates its complete name, it can be explicited.

Parameters
----------
val: Interface_TypedValue
shortname: char *,optional
	default value is ""

Returns
-------
None
") AddValue;
		void AddValue(const opencascade::handle<Interface_TypedValue> & val, const char * shortname = "");

		/****************** Apply ******************/
		%feature("compactdefaultargs") Apply;
		%feature("autodoc", "No available documentation.

Parameters
----------
form: IFSelect_EditForm
ent: Standard_Transient
model: Interface_InterfaceModel

Returns
-------
bool
") Apply;
		Standard_Boolean Apply(const opencascade::handle<IFSelect_EditForm> & form, const opencascade::handle<Standard_Transient> & ent, const opencascade::handle<Interface_InterfaceModel> & model);

		/****************** Label ******************/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "No available documentation.

Returns
-------
TCollection_AsciiString
") Label;
		TCollection_AsciiString Label();

		/****************** Load ******************/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "No available documentation.

Parameters
----------
form: IFSelect_EditForm
ent: Standard_Transient
model: Interface_InterfaceModel

Returns
-------
bool
") Load;
		Standard_Boolean Load(const opencascade::handle<IFSelect_EditForm> & form, const opencascade::handle<Standard_Transient> & ent, const opencascade::handle<Interface_InterfaceModel> & model);

		/****************** Recognize ******************/
		%feature("compactdefaultargs") Recognize;
		%feature("autodoc", "No available documentation.

Parameters
----------
form: IFSelect_EditForm

Returns
-------
bool
") Recognize;
		Standard_Boolean Recognize(const opencascade::handle<IFSelect_EditForm> & form);

		/****************** StaticEditor ******************/
		%feature("compactdefaultargs") StaticEditor;
		%feature("autodoc", "Returns a parameditor to work on the static parameters of which names are listed in <list> null handle if <list> is null or empty.

Parameters
----------
list: TColStd_HSequenceOfHAsciiString
label: char *,optional
	default value is ""

Returns
-------
opencascade::handle<IFSelect_ParamEditor>
") StaticEditor;
		static opencascade::handle<IFSelect_ParamEditor> StaticEditor(const opencascade::handle<TColStd_HSequenceOfHAsciiString> & list, const char * label = "");

		/****************** StringValue ******************/
		%feature("compactdefaultargs") StringValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
form: IFSelect_EditForm
num: int

Returns
-------
opencascade::handle<TCollection_HAsciiString>
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
		/****************** FillIterator ******************/
		%feature("compactdefaultargs") FillIterator;
		%feature("autodoc", "Puts in an iterator the selections from which 'me' depends this list is empty for all selectbase type selections.

Parameters
----------
iter: IFSelect_SelectionIterator

Returns
-------
None
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
		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Adds a selection to the filling list by default, adds it to the end of the list a positive rank less then nbinputs gives an insertion rank (insertbefore : the new <atnum>th item of the list is <sel>).

Parameters
----------
sel: IFSelect_Selection
atnum: int,optional
	default value is 0

Returns
-------
None
") Add;
		void Add(const opencascade::handle<IFSelect_Selection> & sel, const Standard_Integer atnum = 0);

		/****************** FillIterator ******************/
		%feature("compactdefaultargs") FillIterator;
		%feature("autodoc", "Puts in an iterator the selections from which 'me' depends that is to say, the list of input selections.

Parameters
----------
iter: IFSelect_SelectionIterator

Returns
-------
None
") FillIterator;
		void FillIterator(IFSelect_SelectionIterator & iter);

		/****************** Input ******************/
		%feature("compactdefaultargs") Input;
		%feature("autodoc", "Returns an input selection, given its rank in the list.

Parameters
----------
num: int

Returns
-------
opencascade::handle<IFSelect_Selection>
") Input;
		opencascade::handle<IFSelect_Selection> Input(const Standard_Integer num);

		/****************** InputRank ******************/
		%feature("compactdefaultargs") InputRank;
		%feature("autodoc", "Returns the rank of an input selection, 0 if not in the list. most generally, its value is meaningless, except for testing the presence of an input selection : - == 0 if <sel> is not an input for <self> - > 0 if <sel> is an input for <self>.

Parameters
----------
sel: IFSelect_Selection

Returns
-------
int
") InputRank;
		Standard_Integer InputRank(const opencascade::handle<IFSelect_Selection> & sel);

		/****************** NbInputs ******************/
		%feature("compactdefaultargs") NbInputs;
		%feature("autodoc", "Returns the count of input selections.

Returns
-------
int
") NbInputs;
		Standard_Integer NbInputs();

		/****************** Remove ******************/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "Removes an input selection. returns true if done, false, if <sel> is not an input for <self>.

Parameters
----------
sel: IFSelect_Selection

Returns
-------
bool
") Remove;
		Standard_Boolean Remove(const opencascade::handle<IFSelect_Selection> & sel);

		/****************** Remove ******************/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "Removes an input selection, given its rank in the list returns true if done, false if <num> is out of range.

Parameters
----------
num: int

Returns
-------
bool
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
		/****************** FillIterator ******************/
		%feature("compactdefaultargs") FillIterator;
		%feature("autodoc", "Puts in an iterator the selections from which 'me' depends that is to say, the list of input selections.

Parameters
----------
iter: IFSelect_SelectionIterator

Returns
-------
None
") FillIterator;
		void FillIterator(IFSelect_SelectionIterator & iter);

		/****************** HasSecondInput ******************/
		%feature("compactdefaultargs") HasSecondInput;
		%feature("autodoc", "Returns true if a control input is defined thus, result can be computed differently if there is a control input or if there is none.

Returns
-------
bool
") HasSecondInput;
		Standard_Boolean HasSecondInput();

		/****************** MainInput ******************/
		%feature("compactdefaultargs") MainInput;
		%feature("autodoc", "Returns the main input selection.

Returns
-------
opencascade::handle<IFSelect_Selection>
") MainInput;
		opencascade::handle<IFSelect_Selection> MainInput();

		/****************** SecondInput ******************/
		%feature("compactdefaultargs") SecondInput;
		%feature("autodoc", "Returns the control input selection, or a null handle.

Returns
-------
opencascade::handle<IFSelect_Selection>
") SecondInput;
		opencascade::handle<IFSelect_Selection> SecondInput();

		/****************** SetMainInput ******************/
		%feature("compactdefaultargs") SetMainInput;
		%feature("autodoc", "Sets a selection to be the main input.

Parameters
----------
sel: IFSelect_Selection

Returns
-------
None
") SetMainInput;
		void SetMainInput(const opencascade::handle<IFSelect_Selection> & sel);

		/****************** SetSecondInput ******************/
		%feature("compactdefaultargs") SetSecondInput;
		%feature("autodoc", "Sets a selection to be the control input.

Parameters
----------
sel: IFSelect_Selection

Returns
-------
None
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
		/****************** Alternate ******************/
		%feature("compactdefaultargs") Alternate;
		%feature("autodoc", "Returns the alternate definition it is returned modifiable, hence an already defined selectpointed can be used but if it was not yet defined, it is created the first time //! it is exploited by inputresult.

Returns
-------
opencascade::handle<IFSelect_SelectPointed>
") Alternate;
		opencascade::handle<IFSelect_SelectPointed> & Alternate();

		/****************** FillIterator ******************/
		%feature("compactdefaultargs") FillIterator;
		%feature("autodoc", "Puts in an iterator the selections from which 'me' depends this list contains one selection : the inputselection.

Parameters
----------
iter: IFSelect_SelectionIterator

Returns
-------
None
") FillIterator;
		void FillIterator(IFSelect_SelectionIterator & iter);

		/****************** HasAlternate ******************/
		%feature("compactdefaultargs") HasAlternate;
		%feature("autodoc", "Tells if an alternate list has been set, i.e. : the alternate definition is present and set.

Returns
-------
bool
") HasAlternate;
		Standard_Boolean HasAlternate();

		/****************** HasInput ******************/
		%feature("compactdefaultargs") HasInput;
		%feature("autodoc", "Returns true if the input selection is defined, false else.

Returns
-------
bool
") HasInput;
		Standard_Boolean HasInput();

		/****************** Input ******************/
		%feature("compactdefaultargs") Input;
		%feature("autodoc", "Returns the input selection.

Returns
-------
opencascade::handle<IFSelect_Selection>
") Input;
		opencascade::handle<IFSelect_Selection> Input();

		/****************** InputResult ******************/
		%feature("compactdefaultargs") InputResult;
		%feature("autodoc", "Returns the result determined by input selection, as unique if input selection is not defined, returns an empty list. //! if alternate is set, inputresult takes its definition instead of calling the input selection, then clears it.

Parameters
----------
G: Interface_Graph

Returns
-------
Interface_EntityIterator
") InputResult;
		Interface_EntityIterator InputResult(const Interface_Graph & G);

		/****************** SetInput ******************/
		%feature("compactdefaultargs") SetInput;
		%feature("autodoc", "Defines or changes the input selection.

Parameters
----------
sel: IFSelect_Selection

Returns
-------
None
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
		/****************** IFSelect_SessionPilot ******************/
		%feature("compactdefaultargs") IFSelect_SessionPilot;
		%feature("autodoc", "Creates an empty sessionpilot, with a prompt which will be displayed on querying commands. if not precised (''), this prompt is set to 'test-xstep>'.

Parameters
----------
prompt: char *,optional
	default value is ""

Returns
-------
None
") IFSelect_SessionPilot;
		 IFSelect_SessionPilot(const char * prompt = "");

		/****************** Arg ******************/
		%feature("compactdefaultargs") Arg;
		%feature("autodoc", "Returns a word given its rank, as a cstring. as for word, begins at 0 (the command name), etc...

Parameters
----------
num: int

Returns
-------
char *
") Arg;
		const char * Arg(const Standard_Integer num);

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Clears the recorded informations (commands, objects).

Returns
-------
None
") Clear;
		void Clear();

		/****************** Command ******************/
		%feature("compactdefaultargs") Command;
		%feature("autodoc", "Returns a recorded command, given its rank (from 1).

Parameters
----------
num: int

Returns
-------
TCollection_AsciiString
") Command;
		const TCollection_AsciiString & Command(const Standard_Integer num);

		/****************** CommandLine ******************/
		%feature("compactdefaultargs") CommandLine;
		%feature("autodoc", "Returns the command line to be interpreted.

Returns
-------
TCollection_AsciiString
") CommandLine;
		const TCollection_AsciiString & CommandLine();

		/****************** CommandPart ******************/
		%feature("compactdefaultargs") CommandPart;
		%feature("autodoc", "Returns the part of the command line which begins at argument <numarg> between 0 and nbwords-1 (by default, all the line) empty string if out of range.

Parameters
----------
numarg: int,optional
	default value is 0

Returns
-------
char *
") CommandPart;
		const char * CommandPart(const Standard_Integer numarg = 0);

		/****************** Do ******************/
		%feature("compactdefaultargs") Do;
		%feature("autodoc", "Processes specific commands, which are : x or exit for end of session ? or help for help messages xcommand to control command lines (record mode, list, clear, file output ...) xsource to execute a command file (no nesting allowed), in case of error, source is stopped and keyword recovers xstep is a simple prefix (useful in a wider environment, to avoid conflicts on command names) xset control commands which create items with names.

Parameters
----------
number: int
session: IFSelect_SessionPilot

Returns
-------
IFSelect_ReturnStatus
") Do;
		IFSelect_ReturnStatus Do(const Standard_Integer number, const opencascade::handle<IFSelect_SessionPilot> & session);

		/****************** Execute ******************/
		%feature("compactdefaultargs") Execute;
		%feature("autodoc", "Sets the command then tries to execute it. return value : same as for perform.

Parameters
----------
command: TCollection_AsciiString

Returns
-------
IFSelect_ReturnStatus
") Execute;
		IFSelect_ReturnStatus Execute(const TCollection_AsciiString & command);

		/****************** ExecuteAlias ******************/
		%feature("compactdefaultargs") ExecuteAlias;
		%feature("autodoc", "Executes the commands, except that the command name (word 0) is aliased. the rest of the command line is unchanged if <alias> is empty, executes with no change //! error status is returned if the alias is unknown as command.

Parameters
----------
aliasname: TCollection_AsciiString

Returns
-------
IFSelect_ReturnStatus
") ExecuteAlias;
		IFSelect_ReturnStatus ExecuteAlias(const TCollection_AsciiString & aliasname);

		/****************** ExecuteCounter ******************/
		%feature("compactdefaultargs") ExecuteCounter;
		%feature("autodoc", "Executes a counter in a general way if <numword> is greater than count of command words, it counts all the model. else it considers the word <numword> as the identifier of a selection <mode> gives the mode of printing results, default is countbyitem.

Parameters
----------
counter: IFSelect_SignCounter
numword: int
mode: IFSelect_PrintCount,optional
	default value is IFSelect_CountByItem

Returns
-------
IFSelect_ReturnStatus
") ExecuteCounter;
		IFSelect_ReturnStatus ExecuteCounter(const opencascade::handle<IFSelect_SignCounter> & counter, const Standard_Integer numword, const IFSelect_PrintCount mode = IFSelect_CountByItem);

		/****************** Help ******************/
		%feature("compactdefaultargs") Help;
		%feature("autodoc", "Help for specific commands (apart from general command help).

Parameters
----------
number: int

Returns
-------
char *
") Help;
		const char * Help(const Standard_Integer number);

		/****************** Library ******************/
		%feature("compactdefaultargs") Library;
		%feature("autodoc", "Returns the worklibrary (null if not set). worklibrary is used to read and write files, according to the norm.

Returns
-------
opencascade::handle<IFSelect_WorkLibrary>
") Library;
		opencascade::handle<IFSelect_WorkLibrary> Library();

		/****************** NbCommands ******************/
		%feature("compactdefaultargs") NbCommands;
		%feature("autodoc", "Returns the count of recorded commands.

Returns
-------
int
") NbCommands;
		Standard_Integer NbCommands();

		/****************** NbWords ******************/
		%feature("compactdefaultargs") NbWords;
		%feature("autodoc", "Returns the count of words of the command line, separated by blanks : 0 if empty, one if a command without args, else it gives the count of args minus one. warning : limited to 10 (command title + 9 args).

Returns
-------
int
") NbWords;
		Standard_Integer NbWords();

		/****************** Number ******************/
		%feature("compactdefaultargs") Number;
		%feature("autodoc", "Interprets a string value as an entity number : if it gives an integer, returns its value else, considers it as entitylabel (preferably case sensitive) in case of failure, returns 0.

Parameters
----------
val: char *

Returns
-------
int
") Number;
		Standard_Integer Number(const char * val);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Executes the command, itself (for built-in commands, which have priority) or by using the list of activators. the value returned is : retvoid if nothing done (void command) retdone if execution ok, retend if end of session, reterror if command unknown or incorrect, retfail if error on execution if execution is ok and recordmode is set, this command line is recorded to the list (see below).

Returns
-------
IFSelect_ReturnStatus
") Perform;
		IFSelect_ReturnStatus Perform();

		/****************** ReadScript ******************/
		%feature("compactdefaultargs") ReadScript;
		%feature("autodoc", "Reads commands from a script file, named <file>. by default (file = ''), reads from standard input with a prompt else (reading from a file), the read commands are displayed onto standard output. allows nested reads. reading is stopped either by command x or exit, or by reaching end of file return value follows the rules of do : retend for normal end, retfail if script could not be opened.

Parameters
----------
file: char *,optional
	default value is ""

Returns
-------
IFSelect_ReturnStatus
") ReadScript;
		IFSelect_ReturnStatus ReadScript(const char * file = "");

		/****************** RecordItem ******************/
		%feature("compactdefaultargs") RecordItem;
		%feature("autodoc", "Allows to associate a transient value with the last execution as a partial result returns retdone if item is not null, retfail if item is null remark : it is nullified for each perform.

Parameters
----------
item: Standard_Transient

Returns
-------
IFSelect_ReturnStatus
") RecordItem;
		IFSelect_ReturnStatus RecordItem(const opencascade::handle<Standard_Transient> & item);

		/****************** RecordMode ******************/
		%feature("compactdefaultargs") RecordMode;
		%feature("autodoc", "Returns the record mode for commands. default is false.

Returns
-------
bool
") RecordMode;
		Standard_Boolean RecordMode();

		/****************** RecordedItem ******************/
		%feature("compactdefaultargs") RecordedItem;
		%feature("autodoc", "Returns the transient object which was recorded with the current line command. if none was, returns a null handle.

Returns
-------
opencascade::handle<Standard_Transient>
") RecordedItem;
		opencascade::handle<Standard_Transient> RecordedItem();

		/****************** RemoveWord ******************/
		%feature("compactdefaultargs") RemoveWord;
		%feature("autodoc", "Removes a word given its rank. returns true if done, false if <num> is out of range.

Parameters
----------
num: int

Returns
-------
bool
") RemoveWord;
		Standard_Boolean RemoveWord(const Standard_Integer num);

		/****************** Session ******************/
		%feature("compactdefaultargs") Session;
		%feature("autodoc", "Returns the worksession which is worked on.

Returns
-------
opencascade::handle<IFSelect_WorkSession>
") Session;
		opencascade::handle<IFSelect_WorkSession> Session();

		/****************** SetCommandLine ******************/
		%feature("compactdefaultargs") SetCommandLine;
		%feature("autodoc", "Sets the value of the command line to be interpreted also prepares the interpretation (splitting by blanks).

Parameters
----------
command: TCollection_AsciiString

Returns
-------
None
") SetCommandLine;
		void SetCommandLine(const TCollection_AsciiString & command);

		/****************** SetLibrary ******************/
		%feature("compactdefaultargs") SetLibrary;
		%feature("autodoc", "Sets a worklibrary.

Parameters
----------
WL: IFSelect_WorkLibrary

Returns
-------
None
") SetLibrary;
		void SetLibrary(const opencascade::handle<IFSelect_WorkLibrary> & WL);

		/****************** SetRecordMode ******************/
		%feature("compactdefaultargs") SetRecordMode;
		%feature("autodoc", "Changes the recordmode.

Parameters
----------
mode: bool

Returns
-------
None
") SetRecordMode;
		void SetRecordMode(const Standard_Boolean mode);

		/****************** SetSession ******************/
		%feature("compactdefaultargs") SetSession;
		%feature("autodoc", "Sets a worksession to be worked on.

Parameters
----------
WS: IFSelect_WorkSession

Returns
-------
None
") SetSession;
		void SetSession(const opencascade::handle<IFSelect_WorkSession> & WS);

		/****************** Word ******************/
		%feature("compactdefaultargs") Word;
		%feature("autodoc", "Returns a word given its rank in the command line. begins at 0 which is the command title, 1 is the 1st arg., etc...

Parameters
----------
num: int

Returns
-------
TCollection_AsciiString
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
		/****************** IFSelect_SignCategory ******************/
		%feature("compactdefaultargs") IFSelect_SignCategory;
		%feature("autodoc", "Returns a signcategory.

Returns
-------
None
") IFSelect_SignCategory;
		 IFSelect_SignCategory();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the signature for a transient object, as its category recorded in the model.

Parameters
----------
ent: Standard_Transient
model: Interface_InterfaceModel

Returns
-------
char *
") Value;
		const char * Value(const opencascade::handle<Standard_Transient> & ent, const opencascade::handle<Interface_InterfaceModel> & model);

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
		/****************** IFSelect_SignCounter ******************/
		%feature("compactdefaultargs") IFSelect_SignCounter;
		%feature("autodoc", "Creates a signcounter, without proper signature if <withmap> is true (default), added entities are counted only if they are not yet recorded in the map map control can be set off if the input garantees uniqueness of data <withlist> is transmitted to signaturelist (option to list entities, not only to count them).

Parameters
----------
withmap: bool,optional
	default value is Standard_True
withlist: bool,optional
	default value is Standard_False

Returns
-------
None
") IFSelect_SignCounter;
		 IFSelect_SignCounter(const Standard_Boolean withmap = Standard_True, const Standard_Boolean withlist = Standard_False);

		/****************** IFSelect_SignCounter ******************/
		%feature("compactdefaultargs") IFSelect_SignCounter;
		%feature("autodoc", "Creates a signcounter, with a predefined signature other arguments as for create without signature.

Parameters
----------
matcher: IFSelect_Signature
withmap: bool,optional
	default value is Standard_True
withlist: bool,optional
	default value is Standard_False

Returns
-------
None
") IFSelect_SignCounter;
		 IFSelect_SignCounter(const opencascade::handle<IFSelect_Signature> & matcher, const Standard_Boolean withmap = Standard_True, const Standard_Boolean withlist = Standard_False);

		/****************** AddEntity ******************/
		%feature("compactdefaultargs") AddEntity;
		%feature("autodoc", "Adds an entity by considering its signature, which is given by call to method addsign returns true if added, false if already in the map (and map control status set).

Parameters
----------
ent: Standard_Transient
model: Interface_InterfaceModel

Returns
-------
bool
") AddEntity;
		virtual Standard_Boolean AddEntity(const opencascade::handle<Standard_Transient> & ent, const opencascade::handle<Interface_InterfaceModel> & model);

		/****************** AddFromSelection ******************/
		%feature("compactdefaultargs") AddFromSelection;
		%feature("autodoc", "Adds the result determined by a selection from a graph remark : does not impact at all data from setselection & co.

Parameters
----------
sel: IFSelect_Selection
G: Interface_Graph

Returns
-------
None
") AddFromSelection;
		void AddFromSelection(const opencascade::handle<IFSelect_Selection> & sel, const Interface_Graph & G);

		/****************** AddList ******************/
		%feature("compactdefaultargs") AddList;
		%feature("autodoc", "Adds a list of entities by adding each of the items.

Parameters
----------
list: TColStd_HSequenceOfTransient
model: Interface_InterfaceModel

Returns
-------
None
") AddList;
		void AddList(const opencascade::handle<TColStd_HSequenceOfTransient> & list, const opencascade::handle<Interface_InterfaceModel> & model);

		/****************** AddModel ******************/
		%feature("compactdefaultargs") AddModel;
		%feature("autodoc", "Adds all the entities contained in a model.

Parameters
----------
model: Interface_InterfaceModel

Returns
-------
None
") AddModel;
		void AddModel(const opencascade::handle<Interface_InterfaceModel> & model);

		/****************** AddSign ******************/
		%feature("compactdefaultargs") AddSign;
		%feature("autodoc", "Adds an entity (already filtered by map) with its signature. this signature can be computed with the containing model. its value is provided by the object signature given at start, if no signature is defined, it does nothing. //! can be redefined (in this case, see also sign).

Parameters
----------
ent: Standard_Transient
model: Interface_InterfaceModel

Returns
-------
None
") AddSign;
		virtual void AddSign(const opencascade::handle<Standard_Transient> & ent, const opencascade::handle<Interface_InterfaceModel> & model);

		/****************** AddWithGraph ******************/
		%feature("compactdefaultargs") AddWithGraph;
		%feature("autodoc", "Adds a list of entities in the context given by the graph default just call basic addlist can be redefined to get a signature computed with the graph.

Parameters
----------
list: TColStd_HSequenceOfTransient
graph: Interface_Graph

Returns
-------
None
") AddWithGraph;
		virtual void AddWithGraph(const opencascade::handle<TColStd_HSequenceOfTransient> & list, const Interface_Graph & graph);

		/****************** ComputeSelected ******************/
		%feature("compactdefaultargs") ComputeSelected;
		%feature("autodoc", "Computes from the selection result, if selection is active (mode 2). if selection is not defined (mode 0) or is inhibited (mode 1) does nothing. returns true if computation is done (or optimised), false else this method is called by computecounter from worksession //! if <forced> is true, recomputes systematically else (d), if the counter was not cleared and if the former computed result started from the same total size of graph and same count of selected entities : computation is not redone unless <forced> is given as true.

Parameters
----------
G: Interface_Graph
forced: bool,optional
	default value is Standard_False

Returns
-------
bool
") ComputeSelected;
		Standard_Boolean ComputeSelected(const Interface_Graph & G, const Standard_Boolean forced = Standard_False);

		/****************** ComputedSign ******************/
		%feature("compactdefaultargs") ComputedSign;
		%feature("autodoc", "Applies addwithgraph on one entity, and returns the signature value which has been recorded to do this, add is called with signonly mode true during the call, the returned value is lastvalue.

Parameters
----------
ent: Standard_Transient
G: Interface_Graph

Returns
-------
char *
") ComputedSign;
		const char * ComputedSign(const opencascade::handle<Standard_Transient> & ent, const Interface_Graph & G);

		/****************** SelMode ******************/
		%feature("compactdefaultargs") SelMode;
		%feature("autodoc", "Returns the mode of working with the selection.

Returns
-------
int
") SelMode;
		Standard_Integer SelMode();

		/****************** Selection ******************/
		%feature("compactdefaultargs") Selection;
		%feature("autodoc", "Returns the selection, or a null handle.

Returns
-------
opencascade::handle<IFSelect_Selection>
") Selection;
		opencascade::handle<IFSelect_Selection> Selection();

		/****************** SetMap ******************/
		%feature("compactdefaultargs") SetMap;
		%feature("autodoc", "Changes the control status. the map is not cleared, simply its use changes.

Parameters
----------
withmap: bool

Returns
-------
None
") SetMap;
		void SetMap(const Standard_Boolean withmap);

		/****************** SetSelMode ******************/
		%feature("compactdefaultargs") SetSelMode;
		%feature("autodoc", "Changes the mode of working with the selection : -1 just clears optimisation data and nothing else 0 clears it 1 inhibits it for computing (but no clearing) 2 sets it active for computing default at creation is 0, after setselection (not null) is 2.

Parameters
----------
selmode: int

Returns
-------
None
") SetSelMode;
		void SetSelMode(const Standard_Integer selmode);

		/****************** SetSelection ******************/
		%feature("compactdefaultargs") SetSelection;
		%feature("autodoc", "Sets a selection as input : this causes content to be cleared then the selection to be ready to compute (but not immediatly).

Parameters
----------
sel: IFSelect_Selection

Returns
-------
None
") SetSelection;
		void SetSelection(const opencascade::handle<IFSelect_Selection> & sel);

		/****************** Sign ******************/
		%feature("compactdefaultargs") Sign;
		%feature("autodoc", "Determines and returns the value of the signature for an entity as an hasciistring. this method works exactly as addsign, which is optimized //! can be redefined, accorded with addsign.

Parameters
----------
ent: Standard_Transient
model: Interface_InterfaceModel

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") Sign;
		virtual opencascade::handle<TCollection_HAsciiString> Sign(const opencascade::handle<Standard_Transient> & ent, const opencascade::handle<Interface_InterfaceModel> & model);

		/****************** Signature ******************/
		%feature("compactdefaultargs") Signature;
		%feature("autodoc", "Returns the signature used to count entities. it can be null.

Returns
-------
opencascade::handle<IFSelect_Signature>
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
		/****************** IFSelect_SignMultiple ******************/
		%feature("compactdefaultargs") IFSelect_SignMultiple;
		%feature("autodoc", "Creates an empty signmultiple with a name this name should take expected tabulations into account.

Parameters
----------
name: char *

Returns
-------
None
") IFSelect_SignMultiple;
		 IFSelect_SignMultiple(const char * name);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Adds a signature. width, if given, gives the tabulation if <maxi> is true, it is a forced tabulation (overlength is replaced by a final dot) if <maxi> is false, just 3 blanks follow an overlength.

Parameters
----------
subsign: IFSelect_Signature
width: int,optional
	default value is 0
maxi: bool,optional
	default value is Standard_False

Returns
-------
None
") Add;
		void Add(const opencascade::handle<IFSelect_Signature> & subsign, const Standard_Integer width = 0, const Standard_Boolean maxi = Standard_False);

		/****************** Matches ******************/
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "Specialized match rule if <exact> is false, simply checks if at least one sub-item matches if <exact> is true, standard match with value (i.e. tabulations must be respected).

Parameters
----------
ent: Standard_Transient
model: Interface_InterfaceModel
text: TCollection_AsciiString
exact: bool

Returns
-------
bool
") Matches;
		virtual Standard_Boolean Matches(const opencascade::handle<Standard_Transient> & ent, const opencascade::handle<Interface_InterfaceModel> & model, const TCollection_AsciiString & text, const Standard_Boolean exact);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Concatenates the values of sub-signatures, with their tabulations.

Parameters
----------
ent: Standard_Transient
model: Interface_InterfaceModel

Returns
-------
char *
") Value;
		const char * Value(const opencascade::handle<Standard_Transient> & ent, const opencascade::handle<Interface_InterfaceModel> & model);

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
		/****************** IFSelect_SignType ******************/
		%feature("compactdefaultargs") IFSelect_SignType;
		%feature("autodoc", "Returns a signtype <nopk> false (d) : complete dynamic type (name = dynamic type) <nopk> true : class type without pk (name = class type).

Parameters
----------
nopk: bool,optional
	default value is Standard_False

Returns
-------
None
") IFSelect_SignType;
		 IFSelect_SignType(const Standard_Boolean nopk = Standard_False);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the signature for a transient object, as its dynamic type, with or without package name, according starting option.

Parameters
----------
ent: Standard_Transient
model: Interface_InterfaceModel

Returns
-------
char *
") Value;
		const char * Value(const opencascade::handle<Standard_Transient> & ent, const opencascade::handle<Interface_InterfaceModel> & model);

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
		/****************** IFSelect_SignValidity ******************/
		%feature("compactdefaultargs") IFSelect_SignValidity;
		%feature("autodoc", "Returns a signvalidity.

Returns
-------
None
") IFSelect_SignValidity;
		 IFSelect_SignValidity();

		/****************** CVal ******************/
		%feature("compactdefaultargs") CVal;
		%feature("autodoc", "Returns the signature for a transient object, as a validity deducted from data (reports) stored in the model. class method, can be called by any one.

Parameters
----------
ent: Standard_Transient
model: Interface_InterfaceModel

Returns
-------
char *
") CVal;
		static const char * CVal(const opencascade::handle<Standard_Transient> & ent, const opencascade::handle<Interface_InterfaceModel> & model);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the signature for a transient object, as a validity deducted from data (reports) stored in the model calls the class method cval.

Parameters
----------
ent: Standard_Transient
model: Interface_InterfaceModel

Returns
-------
char *
") Value;
		const char * Value(const opencascade::handle<Standard_Transient> & ent, const opencascade::handle<Interface_InterfaceModel> & model);

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
		/****************** IFSelect_TransformStandard ******************/
		%feature("compactdefaultargs") IFSelect_TransformStandard;
		%feature("autodoc", "Creates a transformstandard, option standardcopy, no modifier.

Returns
-------
None
") IFSelect_TransformStandard;
		 IFSelect_TransformStandard();

		/****************** AddModifier ******************/
		%feature("compactdefaultargs") AddModifier;
		%feature("autodoc", "Adds a modifier to the list : - <atnum> = 0 (default) : at the end of the list - <atnum> > 0 : at rank <atnum> returns true if done, false if <atnum> is out of range.

Parameters
----------
modif: IFSelect_Modifier
atnum: int,optional
	default value is 0

Returns
-------
bool
") AddModifier;
		Standard_Boolean AddModifier(const opencascade::handle<IFSelect_Modifier> & modif, const Standard_Integer atnum = 0);

		/****************** ApplyModifiers ******************/
		%feature("compactdefaultargs") ApplyModifiers;
		%feature("autodoc", "Applies the modifiers sequencially. for each one, prepares required data (if a selection is associated as a filter). for the option onthespot, it determines if the graph may be changed and updates <newmod> if required if a modifier causes an error (check 'hasfailed'), applymodifier stops : the following modifiers are ignored.

Parameters
----------
G: Interface_Graph
protocol: Interface_Protocol
TC: Interface_CopyTool
checks: Interface_CheckIterator
newmod: Interface_InterfaceModel

Returns
-------
bool
") ApplyModifiers;
		Standard_Boolean ApplyModifiers(const Interface_Graph & G, const opencascade::handle<Interface_Protocol> & protocol, Interface_CopyTool & TC, Interface_CheckIterator & checks, opencascade::handle<Interface_InterfaceModel> & newmod);

		/****************** Copy ******************/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "This the first operation. it calls standardcopy or onthespot according the option.

Parameters
----------
G: Interface_Graph
TC: Interface_CopyTool
newmod: Interface_InterfaceModel

Returns
-------
None
") Copy;
		void Copy(const Interface_Graph & G, Interface_CopyTool & TC, opencascade::handle<Interface_InterfaceModel> & newmod);

		/****************** CopyOption ******************/
		%feature("compactdefaultargs") CopyOption;
		%feature("autodoc", "Returns the copy option.

Returns
-------
bool
") CopyOption;
		Standard_Boolean CopyOption();

		/****************** Label ******************/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "Returns a text which defines the way a transformer works : 'on the spot edition' or 'standard copy' followed by '<nn> modifiers'.

Returns
-------
TCollection_AsciiString
") Label;
		TCollection_AsciiString Label();

		/****************** Modifier ******************/
		%feature("compactdefaultargs") Modifier;
		%feature("autodoc", "Returns a modifier given its rank in the list.

Parameters
----------
num: int

Returns
-------
opencascade::handle<IFSelect_Modifier>
") Modifier;
		opencascade::handle<IFSelect_Modifier> Modifier(const Standard_Integer num);

		/****************** ModifierRank ******************/
		%feature("compactdefaultargs") ModifierRank;
		%feature("autodoc", "Returns the rank of a modifier in the list, 0 if unknown.

Parameters
----------
modif: IFSelect_Modifier

Returns
-------
int
") ModifierRank;
		Standard_Integer ModifierRank(const opencascade::handle<IFSelect_Modifier> & modif);

		/****************** NbModifiers ******************/
		%feature("compactdefaultargs") NbModifiers;
		%feature("autodoc", "Returns the count of recorded modifiers.

Returns
-------
int
") NbModifiers;
		Standard_Integer NbModifiers();

		/****************** OnTheSpot ******************/
		%feature("compactdefaultargs") OnTheSpot;
		%feature("autodoc", "This is the onthespot action : each entity is bound with ... itself. the produced model is the same as the starting one.

Parameters
----------
G: Interface_Graph
TC: Interface_CopyTool
newmod: Interface_InterfaceModel

Returns
-------
None
") OnTheSpot;
		void OnTheSpot(const Interface_Graph & G, Interface_CopyTool & TC, opencascade::handle<Interface_InterfaceModel> & newmod);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Performs the standard transformation, by calling copy then applymodifiers (which can return an error status).

Parameters
----------
G: Interface_Graph
protocol: Interface_Protocol
checks: Interface_CheckIterator
newmod: Interface_InterfaceModel

Returns
-------
bool
") Perform;
		Standard_Boolean Perform(const Interface_Graph & G, const opencascade::handle<Interface_Protocol> & protocol, Interface_CheckIterator & checks, opencascade::handle<Interface_InterfaceModel> & newmod);

		/****************** RemoveModifier ******************/
		%feature("compactdefaultargs") RemoveModifier;
		%feature("autodoc", "Removes a modifier from the list returns true if done, false if <modif> not in the list.

Parameters
----------
modif: IFSelect_Modifier

Returns
-------
bool
") RemoveModifier;
		Standard_Boolean RemoveModifier(const opencascade::handle<IFSelect_Modifier> & modif);

		/****************** RemoveModifier ******************/
		%feature("compactdefaultargs") RemoveModifier;
		%feature("autodoc", "Removes a modifier from the list, given its rank returns true if done, false if <num> is out of range.

Parameters
----------
num: int

Returns
-------
bool
") RemoveModifier;
		Standard_Boolean RemoveModifier(const Standard_Integer num);

		/****************** Selection ******************/
		%feature("compactdefaultargs") Selection;
		%feature("autodoc", "Returns the selection, null by default.

Returns
-------
opencascade::handle<IFSelect_Selection>
") Selection;
		opencascade::handle<IFSelect_Selection> Selection();

		/****************** SetCopyOption ******************/
		%feature("compactdefaultargs") SetCopyOption;
		%feature("autodoc", "Sets the copy option to a new value : - true for standardcopy - false for onthespot.

Parameters
----------
option: bool

Returns
-------
None
") SetCopyOption;
		void SetCopyOption(const Standard_Boolean option);

		/****************** SetSelection ******************/
		%feature("compactdefaultargs") SetSelection;
		%feature("autodoc", "Sets a selection (or unsets if null) this selection then defines the list of entities on which the modifiers will be applied if it is set, it has priority on selections of modifiers else, for each modifier its selection is evaluated by default, all the model is taken.

Parameters
----------
sel: IFSelect_Selection

Returns
-------
None
") SetSelection;
		void SetSelection(const opencascade::handle<IFSelect_Selection> & sel);

		/****************** StandardCopy ******************/
		%feature("compactdefaultargs") StandardCopy;
		%feature("autodoc", "This is the standard action of copy : its takes into account only the remaining entities (noted by graph status positive) and their proper dependances of course. produces a new model.

Parameters
----------
G: Interface_Graph
TC: Interface_CopyTool
newmod: Interface_InterfaceModel

Returns
-------
None
") StandardCopy;
		void StandardCopy(const Interface_Graph & G, Interface_CopyTool & TC, opencascade::handle<Interface_InterfaceModel> & newmod);

		/****************** Updated ******************/
		%feature("compactdefaultargs") Updated;
		%feature("autodoc", "This methods allows to know what happened to a starting entity after the last perform. it reads result from the map which was filled by perform.

Parameters
----------
entfrom: Standard_Transient
entto: Standard_Transient

Returns
-------
bool
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
		/****************** IFSelect_GraphCounter ******************/
		%feature("compactdefaultargs") IFSelect_GraphCounter;
		%feature("autodoc", "Creates a graphcounter, without applied selection.

Parameters
----------
withmap: bool,optional
	default value is Standard_True
withlist: bool,optional
	default value is Standard_False

Returns
-------
None
") IFSelect_GraphCounter;
		 IFSelect_GraphCounter(const Standard_Boolean withmap = Standard_True, const Standard_Boolean withlist = Standard_False);

		/****************** AddWithGraph ******************/
		%feature("compactdefaultargs") AddWithGraph;
		%feature("autodoc", "Adds a list of entities in the context given by the graph default takes the count of entities selected by the applied selection, when it is given each entity of the list can be redefined.

Parameters
----------
list: TColStd_HSequenceOfTransient
graph: Interface_Graph

Returns
-------
None
") AddWithGraph;
		virtual void AddWithGraph(const opencascade::handle<TColStd_HSequenceOfTransient> & list, const Interface_Graph & graph);

		/****************** Applied ******************/
		%feature("compactdefaultargs") Applied;
		%feature("autodoc", "Returns the applied selection.

Returns
-------
opencascade::handle<IFSelect_SelectDeduct>
") Applied;
		opencascade::handle<IFSelect_SelectDeduct> Applied();

		/****************** SetApplied ******************/
		%feature("compactdefaultargs") SetApplied;
		%feature("autodoc", "Sets a new applied selection.

Parameters
----------
sel: IFSelect_SelectDeduct

Returns
-------
None
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
		/****************** IFSelect_ModifEditForm ******************/
		%feature("compactdefaultargs") IFSelect_ModifEditForm;
		%feature("autodoc", "Creates a modifeditform. it may not change the graph.

Parameters
----------
editform: IFSelect_EditForm

Returns
-------
None
") IFSelect_ModifEditForm;
		 IFSelect_ModifEditForm(const opencascade::handle<IFSelect_EditForm> & editform);

		/****************** EditForm ******************/
		%feature("compactdefaultargs") EditForm;
		%feature("autodoc", "Returns the editform.

Returns
-------
opencascade::handle<IFSelect_EditForm>
") EditForm;
		opencascade::handle<IFSelect_EditForm> EditForm();

		/****************** Label ******************/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "Returns label as 'apply editform <+ label of editform>'.

Returns
-------
TCollection_AsciiString
") Label;
		TCollection_AsciiString Label();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Acts by applying an editform to entities, selected or all model.

Parameters
----------
ctx: IFSelect_ContextModif
target: Interface_InterfaceModel
protocol: Interface_Protocol
TC: Interface_CopyTool

Returns
-------
None
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
		/****************** IFSelect_ModifReorder ******************/
		%feature("compactdefaultargs") IFSelect_ModifReorder;
		%feature("autodoc", "Creates a modifreorder. it may change the graph (it does !) if <rootlast> is true (d), roots are set at the end of packets else, they are set at beginning (as done by addwithrefs).

Parameters
----------
rootlast: bool,optional
	default value is Standard_True

Returns
-------
None
") IFSelect_ModifReorder;
		 IFSelect_ModifReorder(const Standard_Boolean rootlast = Standard_True);

		/****************** Label ******************/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "Returns label as 'reorder, roots (last or first)'.

Returns
-------
TCollection_AsciiString
") Label;
		TCollection_AsciiString Label();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Acts by computing orders (by method all from sharetool) then forcing them in the model. remark that selection is ignored : all the model is processed in once.

Parameters
----------
ctx: IFSelect_ContextModif
target: Interface_InterfaceModel
protocol: Interface_Protocol
TC: Interface_CopyTool

Returns
-------
None
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
		/****************** FillResult ******************/
		%feature("compactdefaultargs") FillResult;
		%feature("autodoc", "Puts into <res>, the sub-entities of the list, from n1 to n2 included. remark that adequation with entity's type and length of list has already been made at this stage called by rootresult.

Parameters
----------
n1: int
n2: int
ent: Standard_Transient
res: Interface_EntityIterator

Returns
-------
None
") FillResult;
		virtual void FillResult(const Standard_Integer n1, const Standard_Integer n2, const opencascade::handle<Standard_Transient> & ent, Interface_EntityIterator & res);

		/****************** HasLower ******************/
		%feature("compactdefaultargs") HasLower;
		%feature("autodoc", "Returns true if a lower limit is defined.

Returns
-------
bool
") HasLower;
		Standard_Boolean HasLower();

		/****************** HasUpper ******************/
		%feature("compactdefaultargs") HasUpper;
		%feature("autodoc", "Returns true if a lower limit is defined.

Returns
-------
bool
") HasUpper;
		Standard_Boolean HasUpper();

		/****************** KeepInputEntity ******************/
		%feature("compactdefaultargs") KeepInputEntity;
		%feature("autodoc", "Keeps input entity, as having required type. it works by keeping in <iter>, only suitable entities (selecttype can be used). called by rootresult (which waits for one entity max).

Parameters
----------
iter: Interface_EntityIterator

Returns
-------
None
") KeepInputEntity;
		virtual void KeepInputEntity(Interface_EntityIterator & iter);

		/****************** Label ******************/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "Returns a text defining the criterium : 'componants of list ' then specific list label, then, following cases : ' from .. until ..' or 'from ..' or 'until ..' or 'rank no ..' specific type is given by deferred method listlabel.

Returns
-------
TCollection_AsciiString
") Label;
		TCollection_AsciiString Label();

		/****************** ListLabel ******************/
		%feature("compactdefaultargs") ListLabel;
		%feature("autodoc", "Returns the specific label for the list, which is included as a part of label.

Returns
-------
TCollection_AsciiString
") ListLabel;
		virtual TCollection_AsciiString ListLabel();

		/****************** Lower ******************/
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "Returns lower limit (if there is; else, value is senseless).

Returns
-------
opencascade::handle<IFSelect_IntParam>
") Lower;
		opencascade::handle<IFSelect_IntParam> Lower();

		/****************** LowerValue ******************/
		%feature("compactdefaultargs") LowerValue;
		%feature("autodoc", "Returns integer value of lower limit (0 if none).

Returns
-------
int
") LowerValue;
		Standard_Integer LowerValue();

		/****************** NbItems ******************/
		%feature("compactdefaultargs") NbItems;
		%feature("autodoc", "Returns count of items in the list in the entity <ent> if <ent> has not required type, returned value must be zero.

Parameters
----------
ent: Standard_Transient

Returns
-------
int
") NbItems;
		virtual Standard_Integer NbItems(const opencascade::handle<Standard_Transient> & ent);

		/****************** RootResult ******************/
		%feature("compactdefaultargs") RootResult;
		%feature("autodoc", "Returns the list of selected entities (list of entities complying with rank criterium) error if the input list has more than one item.

Parameters
----------
G: Interface_Graph

Returns
-------
Interface_EntityIterator
") RootResult;
		Interface_EntityIterator RootResult(const Interface_Graph & G);

		/****************** SetFrom ******************/
		%feature("compactdefaultargs") SetFrom;
		%feature("autodoc", "Sets a lower limit but no upper limit.

Parameters
----------
rankfrom: IFSelect_IntParam

Returns
-------
None
") SetFrom;
		void SetFrom(const opencascade::handle<IFSelect_IntParam> & rankfrom);

		/****************** SetOne ******************/
		%feature("compactdefaultargs") SetOne;
		%feature("autodoc", "Sets a unique number (only one entity will be sorted as true).

Parameters
----------
rank: IFSelect_IntParam

Returns
-------
None
") SetOne;
		void SetOne(const opencascade::handle<IFSelect_IntParam> & rank);

		/****************** SetRange ******************/
		%feature("compactdefaultargs") SetRange;
		%feature("autodoc", "Sets a range for numbers, with a lower and a upper limits.

Parameters
----------
rankfrom: IFSelect_IntParam
rankto: IFSelect_IntParam

Returns
-------
None
") SetRange;
		void SetRange(const opencascade::handle<IFSelect_IntParam> & rankfrom, const opencascade::handle<IFSelect_IntParam> & rankto);

		/****************** SetUntil ******************/
		%feature("compactdefaultargs") SetUntil;
		%feature("autodoc", "Sets an upper limit but no lower limit (equivalent to lower 1).

Parameters
----------
rankto: IFSelect_IntParam

Returns
-------
None
") SetUntil;
		void SetUntil(const opencascade::handle<IFSelect_IntParam> & rankto);

		/****************** Upper ******************/
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "Returns upper limit (if there is; else, value is senseless).

Returns
-------
opencascade::handle<IFSelect_IntParam>
") Upper;
		opencascade::handle<IFSelect_IntParam> Upper();

		/****************** UpperValue ******************/
		%feature("compactdefaultargs") UpperValue;
		%feature("autodoc", "Returns integer value of upper limit (0 if none).

Returns
-------
int
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
		/****************** IFSelect_SelectDiff ******************/
		%feature("compactdefaultargs") IFSelect_SelectDiff;
		%feature("autodoc", "Creates an empty selectdiff.

Returns
-------
None
") IFSelect_SelectDiff;
		 IFSelect_SelectDiff();

		/****************** Label ******************/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "Returns a text defining the criterium : 'difference'.

Returns
-------
TCollection_AsciiString
") Label;
		TCollection_AsciiString Label();

		/****************** RootResult ******************/
		%feature("compactdefaultargs") RootResult;
		%feature("autodoc", "Returns the list of selected entities : they are the entities gotten from the main input but not from the diff input.

Parameters
----------
G: Interface_Graph

Returns
-------
Interface_EntityIterator
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
		/****************** IFSelect_SelectEntityNumber ******************/
		%feature("compactdefaultargs") IFSelect_SelectEntityNumber;
		%feature("autodoc", "Creates a selectentitynumber, initially with no specified number.

Returns
-------
None
") IFSelect_SelectEntityNumber;
		 IFSelect_SelectEntityNumber();

		/****************** Label ******************/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "Returns a text defining the criterium : 'entity number ...'.

Returns
-------
TCollection_AsciiString
") Label;
		TCollection_AsciiString Label();

		/****************** Number ******************/
		%feature("compactdefaultargs") Number;
		%feature("autodoc", "Returns specified number (as a parameter).

Returns
-------
opencascade::handle<IFSelect_IntParam>
") Number;
		opencascade::handle<IFSelect_IntParam> Number();

		/****************** RootResult ******************/
		%feature("compactdefaultargs") RootResult;
		%feature("autodoc", "Returns the list of selected entities : the entity having the specified number (this result assures naturally uniqueness).

Parameters
----------
G: Interface_Graph

Returns
-------
Interface_EntityIterator
") RootResult;
		Interface_EntityIterator RootResult(const Interface_Graph & G);

		/****************** SetNumber ******************/
		%feature("compactdefaultargs") SetNumber;
		%feature("autodoc", "Sets entity number to be taken (initially, none is set : 0).

Parameters
----------
num: IFSelect_IntParam

Returns
-------
None
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
		/****************** Explore ******************/
		%feature("compactdefaultargs") Explore;
		%feature("autodoc", "Analyses and, if required, explores an entity, as follows : the explored list starts as empty, it has to be filled by this method. if it returns false, <ent> is rejected for result (this is to be used only as safety) if it returns true and <explored> remains empty, <ent> is taken itself for result, not explored if it returns true and <explored> is not empty, the content of this list is considered : if maximum level is attained, it is taken for result else (or no max), each of its entity will be itself explored.

Parameters
----------
level: int
ent: Standard_Transient
G: Interface_Graph
explored: Interface_EntityIterator

Returns
-------
bool
") Explore;
		virtual Standard_Boolean Explore(const Standard_Integer level, const opencascade::handle<Standard_Transient> & ent, const Interface_Graph & G, Interface_EntityIterator & explored);

		/****************** ExploreLabel ******************/
		%feature("compactdefaultargs") ExploreLabel;
		%feature("autodoc", "Returns a text defining the way of exploration.

Returns
-------
TCollection_AsciiString
") ExploreLabel;
		virtual TCollection_AsciiString ExploreLabel();

		/****************** Label ******************/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "Returns a text saying '(recursive)' or '(level nn)' plus specific criterium returned by explorelabel (see below).

Returns
-------
TCollection_AsciiString
") Label;
		TCollection_AsciiString Label();

		/****************** Level ******************/
		%feature("compactdefaultargs") Level;
		%feature("autodoc", "Returns the required exploring level.

Returns
-------
int
") Level;
		Standard_Integer Level();

		/****************** RootResult ******************/
		%feature("compactdefaultargs") RootResult;
		%feature("autodoc", "Returns the list of selected entities. works by calling the method explore on each input entity : it can be rejected, taken for output, or to explore. if the maximum level has not yet been attained, or if no max level is specified, entities to be explored are themselves used as if they were input.

Parameters
----------
G: Interface_Graph

Returns
-------
Interface_EntityIterator
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
		/****************** ExtractLabel ******************/
		%feature("compactdefaultargs") ExtractLabel;
		%feature("autodoc", "Returns a text defining the criterium for extraction.

Returns
-------
TCollection_AsciiString
") ExtractLabel;
		virtual TCollection_AsciiString ExtractLabel();

		/****************** IsDirect ******************/
		%feature("compactdefaultargs") IsDirect;
		%feature("autodoc", "Returns true if sort criterium is direct, false if reverse.

Returns
-------
bool
") IsDirect;
		Standard_Boolean IsDirect();

		/****************** Label ******************/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "Returns a text saying 'picked' or 'removed', plus the specific criterium returned by extractlabel (see below).

Returns
-------
TCollection_AsciiString
") Label;
		TCollection_AsciiString Label();

		/****************** RootResult ******************/
		%feature("compactdefaultargs") RootResult;
		%feature("autodoc", "Returns the list of selected entities. works by calling the method sort on each input entity : the entity is kept as output if sort returns the same value as direct status.

Parameters
----------
G: Interface_Graph

Returns
-------
Interface_EntityIterator
") RootResult;
		virtual Interface_EntityIterator RootResult(const Interface_Graph & G);

		/****************** SetDirect ******************/
		%feature("compactdefaultargs") SetDirect;
		%feature("autodoc", "Sets sort criterium sense to a new value (true : direct , false : reverse).

Parameters
----------
direct: bool

Returns
-------
None
") SetDirect;
		void SetDirect(const Standard_Boolean direct);

		/****************** Sort ******************/
		%feature("compactdefaultargs") Sort;
		%feature("autodoc", "Returns true for an entity if it satisfies the sort criterium it receives : - <rank>, the rank of the entity in the iteration, - <ent> , the entity itself, and - <model>, the starting model hence, the entity to check is 'model->value(num)' (but an interfacemodel allows other checks) this method is specific to each class of selectextract.

Parameters
----------
rank: int
ent: Standard_Transient
model: Interface_InterfaceModel

Returns
-------
bool
") Sort;
		virtual Standard_Boolean Sort(const Standard_Integer rank, const opencascade::handle<Standard_Transient> & ent, const opencascade::handle<Interface_InterfaceModel> & model);

		/****************** SortInGraph ******************/
		%feature("compactdefaultargs") SortInGraph;
		%feature("autodoc", "Works as sort but works on the graph default directly calls sort, but it can be redefined if sortingraph is redefined, sort should be defined even if not called (to avoid deferred methods in a final class).

Parameters
----------
rank: int
ent: Standard_Transient
G: Interface_Graph

Returns
-------
bool
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
		/****************** IFSelect_SelectIntersection ******************/
		%feature("compactdefaultargs") IFSelect_SelectIntersection;
		%feature("autodoc", "Creates an empty selectintersection.

Returns
-------
None
") IFSelect_SelectIntersection;
		 IFSelect_SelectIntersection();

		/****************** Label ******************/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "Returns a text defining the criterium : 'intersection (and)'.

Returns
-------
TCollection_AsciiString
") Label;
		TCollection_AsciiString Label();

		/****************** RootResult ******************/
		%feature("compactdefaultargs") RootResult;
		%feature("autodoc", "Returns the list of selected entities, which is the common part of results from all input selections. uniqueness is guaranteed.

Parameters
----------
G: Interface_Graph

Returns
-------
Interface_EntityIterator
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
		/****************** IFSelect_SelectModelEntities ******************/
		%feature("compactdefaultargs") IFSelect_SelectModelEntities;
		%feature("autodoc", "Creates a selectmodelroot.

Returns
-------
None
") IFSelect_SelectModelEntities;
		 IFSelect_SelectModelEntities();

		/****************** CompleteResult ******************/
		%feature("compactdefaultargs") CompleteResult;
		%feature("autodoc", "The complete list of entities (including shared ones) ... is exactly identical to rootresults in this case.

Parameters
----------
G: Interface_Graph

Returns
-------
Interface_EntityIterator
") CompleteResult;
		virtual Interface_EntityIterator CompleteResult(const Interface_Graph & G);

		/****************** Label ******************/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "Returns a text defining the criterium : 'model entities'.

Returns
-------
TCollection_AsciiString
") Label;
		TCollection_AsciiString Label();

		/****************** RootResult ******************/
		%feature("compactdefaultargs") RootResult;
		%feature("autodoc", "Returns the list of selected entities : the entities of the model (note that this result assures naturally uniqueness).

Parameters
----------
G: Interface_Graph

Returns
-------
Interface_EntityIterator
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
		/****************** IFSelect_SelectModelRoots ******************/
		%feature("compactdefaultargs") IFSelect_SelectModelRoots;
		%feature("autodoc", "Creates a selectmodelroot.

Returns
-------
None
") IFSelect_SelectModelRoots;
		 IFSelect_SelectModelRoots();

		/****************** Label ******************/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "Returns a text defining the criterium : 'model roots'.

Returns
-------
TCollection_AsciiString
") Label;
		TCollection_AsciiString Label();

		/****************** RootResult ******************/
		%feature("compactdefaultargs") RootResult;
		%feature("autodoc", "Returns the list of selected entities : the roots of the model (note that this result assures naturally uniqueness).

Parameters
----------
G: Interface_Graph

Returns
-------
Interface_EntityIterator
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
		/****************** IFSelect_SelectPointed ******************/
		%feature("compactdefaultargs") IFSelect_SelectPointed;
		%feature("autodoc", "Creates a selectpointed.

Returns
-------
None
") IFSelect_SelectPointed;
		 IFSelect_SelectPointed();

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Adds an item. returns true if done, false if <item> is already in the selected list.

Parameters
----------
item: Standard_Transient

Returns
-------
bool
") Add;
		Standard_Boolean Add(const opencascade::handle<Standard_Transient> & item);

		/****************** AddList ******************/
		%feature("compactdefaultargs") AddList;
		%feature("autodoc", "Adds all the items defined in a list. returns true if at least one item has been added, false else.

Parameters
----------
list: TColStd_HSequenceOfTransient

Returns
-------
bool
") AddList;
		Standard_Boolean AddList(const opencascade::handle<TColStd_HSequenceOfTransient> & list);

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Clears the list of selected items also says the list is unset all add* methods and setlist say the list is set.

Returns
-------
None
") Clear;
		void Clear();

		/****************** IsSet ******************/
		%feature("compactdefaultargs") IsSet;
		%feature("autodoc", "Tells if the list has been set. even if empty.

Returns
-------
bool
") IsSet;
		Standard_Boolean IsSet();

		/****************** Item ******************/
		%feature("compactdefaultargs") Item;
		%feature("autodoc", "Returns an item given its rank, or a null handle.

Parameters
----------
num: int

Returns
-------
opencascade::handle<Standard_Transient>
") Item;
		opencascade::handle<Standard_Transient> Item(const Standard_Integer num);

		/****************** Label ******************/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "Returns a text which identifies the type of selection made. it is 'pointed entities'.

Returns
-------
TCollection_AsciiString
") Label;
		TCollection_AsciiString Label();

		/****************** NbItems ******************/
		%feature("compactdefaultargs") NbItems;
		%feature("autodoc", "Returns the count of selected items.

Returns
-------
int
") NbItems;
		Standard_Integer NbItems();

		/****************** Rank ******************/
		%feature("compactdefaultargs") Rank;
		%feature("autodoc", "Returns the rank of an item in the selected list, or 0.

Parameters
----------
item: Standard_Transient

Returns
-------
int
") Rank;
		Standard_Integer Rank(const opencascade::handle<Standard_Transient> & item);

		/****************** Remove ******************/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "Removes an item. returns true if done, false if <item> was not in the selected list.

Parameters
----------
item: Standard_Transient

Returns
-------
bool
") Remove;
		Standard_Boolean Remove(const opencascade::handle<Standard_Transient> & item);

		/****************** RemoveList ******************/
		%feature("compactdefaultargs") RemoveList;
		%feature("autodoc", "Removes all the items defined in a list. returns true if at least one item has been removed, false else.

Parameters
----------
list: TColStd_HSequenceOfTransient

Returns
-------
bool
") RemoveList;
		Standard_Boolean RemoveList(const opencascade::handle<TColStd_HSequenceOfTransient> & list);

		/****************** RootResult ******************/
		%feature("compactdefaultargs") RootResult;
		%feature("autodoc", "Returns the list of selected items. only the selected entities which are present in the graph are given (this result assures uniqueness).

Parameters
----------
G: Interface_Graph

Returns
-------
Interface_EntityIterator
") RootResult;
		Interface_EntityIterator RootResult(const Interface_Graph & G);

		/****************** SetEntity ******************/
		%feature("compactdefaultargs") SetEntity;
		%feature("autodoc", "As setlist but with only one entity if <ent> is null, the list is said as being set but is empty.

Parameters
----------
item: Standard_Transient

Returns
-------
None
") SetEntity;
		void SetEntity(const opencascade::handle<Standard_Transient> & item);

		/****************** SetList ******************/
		%feature("compactdefaultargs") SetList;
		%feature("autodoc", "Sets a given list to define the list of selected items <list> can be empty or null : in this case, the list is said as being set, but it is empty //! to use it as an alternate input, one shot : - setlist or setentity to define the input list - rootresult to get it - then clear to drop it.

Parameters
----------
list: TColStd_HSequenceOfTransient

Returns
-------
None
") SetList;
		void SetList(const opencascade::handle<TColStd_HSequenceOfTransient> & list);

		/****************** Toggle ******************/
		%feature("compactdefaultargs") Toggle;
		%feature("autodoc", "Toggles status of an item : adds it if not pointed or removes it if already pointed. returns the new status (pointed or not).

Parameters
----------
item: Standard_Transient

Returns
-------
bool
") Toggle;
		Standard_Boolean Toggle(const opencascade::handle<Standard_Transient> & item);

		/****************** ToggleList ******************/
		%feature("compactdefaultargs") ToggleList;
		%feature("autodoc", "Toggles status of all the items defined in a list : adds it if not pointed or removes it if already pointed.

Parameters
----------
list: TColStd_HSequenceOfTransient

Returns
-------
bool
") ToggleList;
		Standard_Boolean ToggleList(const opencascade::handle<TColStd_HSequenceOfTransient> & list);

		/****************** Update ******************/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "Rebuilds the selected list. any selected entity which has a bound result is replaced by this result, else it is removed.

Parameters
----------
control: Interface_CopyControl

Returns
-------
None
") Update;
		void Update(const opencascade::handle<Interface_CopyControl> & control);

		/****************** Update ******************/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "Rebuilds the selected list, by querying a transformer (same principle as from a copycontrol).

Parameters
----------
trf: IFSelect_Transformer

Returns
-------
None
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
		/****************** IFSelect_SelectShared ******************/
		%feature("compactdefaultargs") IFSelect_SelectShared;
		%feature("autodoc", "Creates a selectshared;.

Returns
-------
None
") IFSelect_SelectShared;
		 IFSelect_SelectShared();

		/****************** Label ******************/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "Returns a text defining the criterium : 'shared (one level)'.

Returns
-------
TCollection_AsciiString
") Label;
		TCollection_AsciiString Label();

		/****************** RootResult ******************/
		%feature("compactdefaultargs") RootResult;
		%feature("autodoc", "Returns the list of selected entities (list of entities shared by those of input list).

Parameters
----------
G: Interface_Graph

Returns
-------
Interface_EntityIterator
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
		/****************** IFSelect_SelectSharing ******************/
		%feature("compactdefaultargs") IFSelect_SelectSharing;
		%feature("autodoc", "Creates a selectsharing;.

Returns
-------
None
") IFSelect_SelectSharing;
		 IFSelect_SelectSharing();

		/****************** Label ******************/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "Returns a text defining the criterium : 'sharing (one level)'.

Returns
-------
TCollection_AsciiString
") Label;
		TCollection_AsciiString Label();

		/****************** RootResult ******************/
		%feature("compactdefaultargs") RootResult;
		%feature("autodoc", "Returns the list of selected entities (list of entities which share (level one) those of input list).

Parameters
----------
G: Interface_Graph

Returns
-------
Interface_EntityIterator
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
		/****************** IFSelect_SelectSuite ******************/
		%feature("compactdefaultargs") IFSelect_SelectSuite;
		%feature("autodoc", "Creates an empty selectsuite.

Returns
-------
None
") IFSelect_SelectSuite;
		 IFSelect_SelectSuite();

		/****************** AddInput ******************/
		%feature("compactdefaultargs") AddInput;
		%feature("autodoc", "Adds an input selection. i.e. : if <item> is a selectdeduct, adds it as previous, not as input else, sets it as input returns true when done returns false and refuses to work if input is already defined.

Parameters
----------
item: IFSelect_Selection

Returns
-------
bool
") AddInput;
		Standard_Boolean AddInput(const opencascade::handle<IFSelect_Selection> & item);

		/****************** AddNext ******************/
		%feature("compactdefaultargs") AddNext;
		%feature("autodoc", "Adds a new last item (prepends to the list) if <item> is null, does nothing.

Parameters
----------
item: IFSelect_SelectDeduct

Returns
-------
None
") AddNext;
		void AddNext(const opencascade::handle<IFSelect_SelectDeduct> & item);

		/****************** AddPrevious ******************/
		%feature("compactdefaultargs") AddPrevious;
		%feature("autodoc", "Adds a new first item (prepends to the list). the input is not touched if <item> is null, does nothing.

Parameters
----------
item: IFSelect_SelectDeduct

Returns
-------
None
") AddPrevious;
		void AddPrevious(const opencascade::handle<IFSelect_SelectDeduct> & item);

		/****************** Item ******************/
		%feature("compactdefaultargs") Item;
		%feature("autodoc", "Returns an item from its rank in the list (the input is always apart).

Parameters
----------
num: int

Returns
-------
opencascade::handle<IFSelect_SelectDeduct>
") Item;
		opencascade::handle<IFSelect_SelectDeduct> Item(const Standard_Integer num);

		/****************** Label ******************/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "Returns the label either it has been defined by setlabel, or it will give 'suite of nn selections'.

Returns
-------
TCollection_AsciiString
") Label;
		TCollection_AsciiString Label();

		/****************** NbItems ******************/
		%feature("compactdefaultargs") NbItems;
		%feature("autodoc", "Returns the count of items.

Returns
-------
int
") NbItems;
		Standard_Integer NbItems();

		/****************** RootResult ******************/
		%feature("compactdefaultargs") RootResult;
		%feature("autodoc", "Returns the list of selected entities to do this, once inputresult has been taken (if input or alternate has been defined, else the first item gives it) : this result is set as alternate input for the first item, which computes its result : this result is set as alternate input for the second item, etc...

Parameters
----------
G: Interface_Graph

Returns
-------
Interface_EntityIterator
") RootResult;
		Interface_EntityIterator RootResult(const Interface_Graph & G);

		/****************** SetLabel ******************/
		%feature("compactdefaultargs") SetLabel;
		%feature("autodoc", "Sets a value for the label.

Parameters
----------
lab: char *

Returns
-------
None
") SetLabel;
		void SetLabel(const char * lab);

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
		/****************** IFSelect_SelectUnion ******************/
		%feature("compactdefaultargs") IFSelect_SelectUnion;
		%feature("autodoc", "Creates an empty selectunion.

Returns
-------
None
") IFSelect_SelectUnion;
		 IFSelect_SelectUnion();

		/****************** Label ******************/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "Returns a text defining the criterium : 'union (or)'.

Returns
-------
TCollection_AsciiString
") Label;
		TCollection_AsciiString Label();

		/****************** RootResult ******************/
		%feature("compactdefaultargs") RootResult;
		%feature("autodoc", "Returns the list of selected entities, which is the addition result from all input selections. uniqueness is guaranteed.

Parameters
----------
G: Interface_Graph

Returns
-------
Interface_EntityIterator
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
		/****************** IFSelect_SignAncestor ******************/
		%feature("compactdefaultargs") IFSelect_SignAncestor;
		%feature("autodoc", "No available documentation.

Parameters
----------
nopk: bool,optional
	default value is Standard_False

Returns
-------
None
") IFSelect_SignAncestor;
		 IFSelect_SignAncestor(const Standard_Boolean nopk = Standard_False);

		/****************** Matches ******************/
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "No available documentation.

Parameters
----------
ent: Standard_Transient
model: Interface_InterfaceModel
text: TCollection_AsciiString
exact: bool

Returns
-------
bool
") Matches;
		virtual Standard_Boolean Matches(const opencascade::handle<Standard_Transient> & ent, const opencascade::handle<Interface_InterfaceModel> & model, const TCollection_AsciiString & text, const Standard_Boolean exact);

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
		/****************** Sort ******************/
		%feature("compactdefaultargs") Sort;
		%feature("autodoc", "Returns true for an entity (model->value(num)) which is kind of the choosen type, given by the method typeformatch. criterium is iskind.

Parameters
----------
rank: int
ent: Standard_Transient
model: Interface_InterfaceModel

Returns
-------
bool
") Sort;
		Standard_Boolean Sort(const Standard_Integer rank, const opencascade::handle<Standard_Transient> & ent, const opencascade::handle<Interface_InterfaceModel> & model);

		/****************** TypeForMatch ******************/
		%feature("compactdefaultargs") TypeForMatch;
		%feature("autodoc", "Returns the type which has to be matched for select.

Returns
-------
opencascade::handle<Standard_Type>
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
		/****************** IFSelect_SelectErrorEntities ******************/
		%feature("compactdefaultargs") IFSelect_SelectErrorEntities;
		%feature("autodoc", "Creates a selecterrorentities.

Returns
-------
None
") IFSelect_SelectErrorEntities;
		 IFSelect_SelectErrorEntities();

		/****************** ExtractLabel ******************/
		%feature("compactdefaultargs") ExtractLabel;
		%feature("autodoc", "Returns a text defining the criterium : 'error entities'.

Returns
-------
TCollection_AsciiString
") ExtractLabel;
		TCollection_AsciiString ExtractLabel();

		/****************** Sort ******************/
		%feature("compactdefaultargs") Sort;
		%feature("autodoc", "Returns true for an entity which is qualified as 'error', i.e. if <model> explicitly knows <ent> (through its number) as erroneous.

Parameters
----------
rank: int
ent: Standard_Transient
model: Interface_InterfaceModel

Returns
-------
bool
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
		/****************** IFSelect_SelectFlag ******************/
		%feature("compactdefaultargs") IFSelect_SelectFlag;
		%feature("autodoc", "Creates a select flag, to query a flag designated by its name.

Parameters
----------
flagname: char *

Returns
-------
None
") IFSelect_SelectFlag;
		 IFSelect_SelectFlag(const char * flagname);

		/****************** ExtractLabel ******************/
		%feature("compactdefaultargs") ExtractLabel;
		%feature("autodoc", "Returns a text defining the criterium, includes the flag name.

Returns
-------
TCollection_AsciiString
") ExtractLabel;
		TCollection_AsciiString ExtractLabel();

		/****************** FlagName ******************/
		%feature("compactdefaultargs") FlagName;
		%feature("autodoc", "Returns the name of the flag.

Returns
-------
char *
") FlagName;
		const char * FlagName();

		/****************** RootResult ******************/
		%feature("compactdefaultargs") RootResult;
		%feature("autodoc", "Returns the list of selected entities. it is redefined to work on the graph itself (not queried by sort) //! an entity is selected if its flag is true on direct mode, false on reversed mode //! if flag does not exist for the given name, returns an empty result, whatever the direct/reversed sense.

Parameters
----------
G: Interface_Graph

Returns
-------
Interface_EntityIterator
") RootResult;
		virtual Interface_EntityIterator RootResult(const Interface_Graph & G);

		/****************** Sort ******************/
		%feature("compactdefaultargs") Sort;
		%feature("autodoc", "Returns always false because rootresult has done the work.

Parameters
----------
rank: int
ent: Standard_Transient
model: Interface_InterfaceModel

Returns
-------
bool
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
		/****************** FillResult ******************/
		%feature("compactdefaultargs") FillResult;
		%feature("autodoc", "Puts into the result, the sub-entities of the list, from n1 to n2 included. remark that adequation with entity's type and length of list has already been made at this stage called by rootresult; calls listedentity (see below).

Parameters
----------
n1: int
n2: int
ent: Standard_Transient
result: Interface_EntityIterator

Returns
-------
None
") FillResult;
		void FillResult(const Standard_Integer n1, const Standard_Integer n2, const opencascade::handle<Standard_Transient> & ent, Interface_EntityIterator & result);

		/****************** ListedEntity ******************/
		%feature("compactdefaultargs") ListedEntity;
		%feature("autodoc", "Returns an entity, given its rank in the list.

Parameters
----------
num: int
ent: Standard_Transient

Returns
-------
opencascade::handle<Standard_Transient>
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
		/****************** IFSelect_SelectRange ******************/
		%feature("compactdefaultargs") IFSelect_SelectRange;
		%feature("autodoc", "Creates a selectrange. default is take all the input list.

Returns
-------
None
") IFSelect_SelectRange;
		 IFSelect_SelectRange();

		/****************** ExtractLabel ******************/
		%feature("compactdefaultargs") ExtractLabel;
		%feature("autodoc", "Returns a text defining the criterium : following cases, ' from .. until ..' or 'from ..' or 'until ..' or 'rank no ..'.

Returns
-------
TCollection_AsciiString
") ExtractLabel;
		TCollection_AsciiString ExtractLabel();

		/****************** HasLower ******************/
		%feature("compactdefaultargs") HasLower;
		%feature("autodoc", "Returns true if a lower limit is defined.

Returns
-------
bool
") HasLower;
		Standard_Boolean HasLower();

		/****************** HasUpper ******************/
		%feature("compactdefaultargs") HasUpper;
		%feature("autodoc", "Returns true if a lower limit is defined.

Returns
-------
bool
") HasUpper;
		Standard_Boolean HasUpper();

		/****************** Lower ******************/
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "Returns lower limit (if there is; else, value is senseless).

Returns
-------
opencascade::handle<IFSelect_IntParam>
") Lower;
		opencascade::handle<IFSelect_IntParam> Lower();

		/****************** LowerValue ******************/
		%feature("compactdefaultargs") LowerValue;
		%feature("autodoc", "Returns value of lower limit (0 if none is defined).

Returns
-------
int
") LowerValue;
		Standard_Integer LowerValue();

		/****************** SetFrom ******************/
		%feature("compactdefaultargs") SetFrom;
		%feature("autodoc", "Sets a lower limit but no upper limit.

Parameters
----------
rankfrom: IFSelect_IntParam

Returns
-------
None
") SetFrom;
		void SetFrom(const opencascade::handle<IFSelect_IntParam> & rankfrom);

		/****************** SetOne ******************/
		%feature("compactdefaultargs") SetOne;
		%feature("autodoc", "Sets a unique number (only one entity will be sorted as true).

Parameters
----------
rank: IFSelect_IntParam

Returns
-------
None
") SetOne;
		void SetOne(const opencascade::handle<IFSelect_IntParam> & rank);

		/****************** SetRange ******************/
		%feature("compactdefaultargs") SetRange;
		%feature("autodoc", "Sets a range for numbers, with a lower and a upper limits error if rankto is lower then rankfrom.

Parameters
----------
rankfrom: IFSelect_IntParam
rankto: IFSelect_IntParam

Returns
-------
None
") SetRange;
		void SetRange(const opencascade::handle<IFSelect_IntParam> & rankfrom, const opencascade::handle<IFSelect_IntParam> & rankto);

		/****************** SetUntil ******************/
		%feature("compactdefaultargs") SetUntil;
		%feature("autodoc", "Sets an upper limit but no lower limit (equivalent to lower 1).

Parameters
----------
rankto: IFSelect_IntParam

Returns
-------
None
") SetUntil;
		void SetUntil(const opencascade::handle<IFSelect_IntParam> & rankto);

		/****************** Sort ******************/
		%feature("compactdefaultargs") Sort;
		%feature("autodoc", "Returns true for an entity of which occurence number in the iteration is inside the selected range (considers <rank>).

Parameters
----------
rank: int
ent: Standard_Transient
model: Interface_InterfaceModel

Returns
-------
bool
") Sort;
		Standard_Boolean Sort(const Standard_Integer rank, const opencascade::handle<Standard_Transient> & ent, const opencascade::handle<Interface_InterfaceModel> & model);

		/****************** Upper ******************/
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "Returns upper limit (if there is; else, value is senseless).

Returns
-------
opencascade::handle<IFSelect_IntParam>
") Upper;
		opencascade::handle<IFSelect_IntParam> Upper();

		/****************** UpperValue ******************/
		%feature("compactdefaultargs") UpperValue;
		%feature("autodoc", "Returns value of upper limit (0 if none is defined).

Returns
-------
int
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
		/****************** IFSelect_SelectRootComps ******************/
		%feature("compactdefaultargs") IFSelect_SelectRootComps;
		%feature("autodoc", "Creates a selectrootcomps.

Returns
-------
None
") IFSelect_SelectRootComps;
		 IFSelect_SelectRootComps();

		/****************** ExtractLabel ******************/
		%feature("compactdefaultargs") ExtractLabel;
		%feature("autodoc", "Returns a text defining the criterium : 'local root componants'.

Returns
-------
TCollection_AsciiString
") ExtractLabel;
		TCollection_AsciiString ExtractLabel();

		/****************** RootResult ******************/
		%feature("compactdefaultargs") RootResult;
		%feature("autodoc", "Returns the list of local root strong componants, by one entity par componant. it is redefined for a purpose of effeciency : calling a sort routine for each entity would cost more ressource than to work in once using a map rootresult takes in account the direct status.

Parameters
----------
G: Interface_Graph

Returns
-------
Interface_EntityIterator
") RootResult;
		virtual Interface_EntityIterator RootResult(const Interface_Graph & G);

		/****************** Sort ******************/
		%feature("compactdefaultargs") Sort;
		%feature("autodoc", "Returns always true, because rootresult has done work.

Parameters
----------
rank: int
ent: Standard_Transient
model: Interface_InterfaceModel

Returns
-------
bool
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
		/****************** IFSelect_SelectRoots ******************/
		%feature("compactdefaultargs") IFSelect_SelectRoots;
		%feature("autodoc", "Creates a selectroots.

Returns
-------
None
") IFSelect_SelectRoots;
		 IFSelect_SelectRoots();

		/****************** ExtractLabel ******************/
		%feature("compactdefaultargs") ExtractLabel;
		%feature("autodoc", "Returns a text defining the criterium : 'local root entities'.

Returns
-------
TCollection_AsciiString
") ExtractLabel;
		TCollection_AsciiString ExtractLabel();

		/****************** RootResult ******************/
		%feature("compactdefaultargs") RootResult;
		%feature("autodoc", "Returns the list of local roots. it is redefined for a purpose of effeciency : calling a sort routine for each entity would cost more ressource than to work in once using a map rootresult takes in account the direct status.

Parameters
----------
G: Interface_Graph

Returns
-------
Interface_EntityIterator
") RootResult;
		virtual Interface_EntityIterator RootResult(const Interface_Graph & G);

		/****************** Sort ******************/
		%feature("compactdefaultargs") Sort;
		%feature("autodoc", "Returns always true, because rootresult has done work.

Parameters
----------
rank: int
ent: Standard_Transient
model: Interface_InterfaceModel

Returns
-------
bool
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
		/****************** IFSelect_SelectSent ******************/
		%feature("compactdefaultargs") IFSelect_SelectSent;
		%feature("autodoc", "Creates a selectsent : sentcount = 0 -> remaining (non-sent) entities sentcount = 1, atleast = true (d) -> sent (at least once) sentcount = 2, atleast = true -> duplicated (sent least twice) etc... sentcount = 1, atleast = false -> sent just once (non-dupl.d) sentcount = 2, atleast = false -> sent just twice etc...

Parameters
----------
sentcount: int,optional
	default value is 1
atleast: bool,optional
	default value is Standard_True

Returns
-------
None
") IFSelect_SelectSent;
		 IFSelect_SelectSent(const Standard_Integer sentcount = 1, const Standard_Boolean atleast = Standard_True);

		/****************** AtLeast ******************/
		%feature("compactdefaultargs") AtLeast;
		%feature("autodoc", "Returns the <atleast> status, true for sending at least the sending count, false for sending exactly the sending count remark : if sentcount is 0, atleast is ignored.

Returns
-------
bool
") AtLeast;
		Standard_Boolean AtLeast();

		/****************** ExtractLabel ******************/
		%feature("compactdefaultargs") ExtractLabel;
		%feature("autodoc", "Returns a text defining the criterium : query : sentcount = 0 -> 'remaining (non-sent) entities' sentcount = 1, atleast = true -> 'sent entities' sentcount = 1, atleast = false -> 'sent once (no duplicated)' sentcount = 2, atleast = true -> 'sent several times entities' sentcount = 2, atleast = false -> 'sent twice entities' sentcount > 2, atleast = true -> 'sent at least <count> times entities' sentcount > 2, atleast = false -> 'sent <count> times entities'.

Returns
-------
TCollection_AsciiString
") ExtractLabel;
		TCollection_AsciiString ExtractLabel();

		/****************** RootResult ******************/
		%feature("compactdefaultargs") RootResult;
		%feature("autodoc", "Returns the list of selected entities. it is redefined to work on the graph itself (not queried by sort) //! an entity is selected if its count complies to the query in direct mode, rejected in reversed mode //! query works on the sending count recorded as status in graph.

Parameters
----------
G: Interface_Graph

Returns
-------
Interface_EntityIterator
") RootResult;
		virtual Interface_EntityIterator RootResult(const Interface_Graph & G);

		/****************** SentCount ******************/
		%feature("compactdefaultargs") SentCount;
		%feature("autodoc", "Returns the queried count of sending.

Returns
-------
int
") SentCount;
		Standard_Integer SentCount();

		/****************** Sort ******************/
		%feature("compactdefaultargs") Sort;
		%feature("autodoc", "Returns always false because rootresult has done the work.

Parameters
----------
rank: int
ent: Standard_Transient
model: Interface_InterfaceModel

Returns
-------
bool
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
		/****************** IFSelect_SelectSignature ******************/
		%feature("compactdefaultargs") IFSelect_SelectSignature;
		%feature("autodoc", "Creates a selectsignature with its signature and its text to match. <exact> if true requires exact match, if false requires <signtext> to be contained in the signature of the entity (default is 'exact').

Parameters
----------
matcher: IFSelect_Signature
signtext: char *
exact: bool,optional
	default value is Standard_True

Returns
-------
None
") IFSelect_SelectSignature;
		 IFSelect_SelectSignature(const opencascade::handle<IFSelect_Signature> & matcher, const char * signtext, const Standard_Boolean exact = Standard_True);

		/****************** IFSelect_SelectSignature ******************/
		%feature("compactdefaultargs") IFSelect_SelectSignature;
		%feature("autodoc", "As above with an asciistring.

Parameters
----------
matcher: IFSelect_Signature
signtext: TCollection_AsciiString
exact: bool,optional
	default value is Standard_True

Returns
-------
None
") IFSelect_SelectSignature;
		 IFSelect_SelectSignature(const opencascade::handle<IFSelect_Signature> & matcher, const TCollection_AsciiString & signtext, const Standard_Boolean exact = Standard_True);

		/****************** IFSelect_SelectSignature ******************/
		%feature("compactdefaultargs") IFSelect_SelectSignature;
		%feature("autodoc", "Creates a selectsignature with a counter, more precisely a selectsignature. which is used here to just give a signature value (by signonly mode) matching is the default provided by the class signature.

Parameters
----------
matcher: IFSelect_SignCounter
signtext: char *
exact: bool,optional
	default value is Standard_True

Returns
-------
None
") IFSelect_SelectSignature;
		 IFSelect_SelectSignature(const opencascade::handle<IFSelect_SignCounter> & matcher, const char * signtext, const Standard_Boolean exact = Standard_True);

		/****************** Counter ******************/
		%feature("compactdefaultargs") Counter;
		%feature("autodoc", "Returns the used signcounter. can be used as alternative for signature.

Returns
-------
opencascade::handle<IFSelect_SignCounter>
") Counter;
		opencascade::handle<IFSelect_SignCounter> Counter();

		/****************** ExtractLabel ******************/
		%feature("compactdefaultargs") ExtractLabel;
		%feature("autodoc", "Returns a text defining the criterium. (it refers to the text and exact flag to be matched, and is qualified by the name provided by the signature).

Returns
-------
TCollection_AsciiString
") ExtractLabel;
		TCollection_AsciiString ExtractLabel();

		/****************** IsExact ******************/
		%feature("compactdefaultargs") IsExact;
		%feature("autodoc", "Returns true if match must be exact.

Returns
-------
bool
") IsExact;
		Standard_Boolean IsExact();

		/****************** Signature ******************/
		%feature("compactdefaultargs") Signature;
		%feature("autodoc", "Returns the used signature, then it is possible to access it, modify it as required. can be null, hence see counter.

Returns
-------
opencascade::handle<IFSelect_Signature>
") Signature;
		opencascade::handle<IFSelect_Signature> Signature();

		/****************** SignatureText ******************/
		%feature("compactdefaultargs") SignatureText;
		%feature("autodoc", "Returns text used to sort entity on its signature or signcounter.

Returns
-------
TCollection_AsciiString
") SignatureText;
		const TCollection_AsciiString & SignatureText();

		/****************** Sort ******************/
		%feature("compactdefaultargs") Sort;
		%feature("autodoc", "Not called, defined only to remove a deferred method here.

Parameters
----------
rank: int
ent: Standard_Transient
model: Interface_InterfaceModel

Returns
-------
bool
") Sort;
		Standard_Boolean Sort(const Standard_Integer rank, const opencascade::handle<Standard_Transient> & ent, const opencascade::handle<Interface_InterfaceModel> & model);

		/****************** SortInGraph ******************/
		%feature("compactdefaultargs") SortInGraph;
		%feature("autodoc", "Returns true for an entity (model->value(num)) of which the signature matches the text given as creation time may also work with a counter from the graph.

Parameters
----------
rank: int
ent: Standard_Transient
G: Interface_Graph

Returns
-------
bool
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
		/****************** IFSelect_SelectSignedShared ******************/
		%feature("compactdefaultargs") IFSelect_SelectSignedShared;
		%feature("autodoc", "Creates a selectsignedshared, defaulted for any level with a given signature and text to match.

Parameters
----------
matcher: IFSelect_Signature
signtext: char *
exact: bool,optional
	default value is Standard_True
level: int,optional
	default value is 0

Returns
-------
None
") IFSelect_SelectSignedShared;
		 IFSelect_SelectSignedShared(const opencascade::handle<IFSelect_Signature> & matcher, const char * signtext, const Standard_Boolean exact = Standard_True, const Standard_Integer level = 0);

		/****************** Explore ******************/
		%feature("compactdefaultargs") Explore;
		%feature("autodoc", "Explores an entity : its shared entities <ent> to take if it matches the signature at level max, filters the result. else gives all shareds.

Parameters
----------
level: int
ent: Standard_Transient
G: Interface_Graph
explored: Interface_EntityIterator

Returns
-------
bool
") Explore;
		Standard_Boolean Explore(const Standard_Integer level, const opencascade::handle<Standard_Transient> & ent, const Interface_Graph & G, Interface_EntityIterator & explored);

		/****************** ExploreLabel ******************/
		%feature("compactdefaultargs") ExploreLabel;
		%feature("autodoc", "Returns a text defining the criterium. (it refers to the text and exact flag to be matched, and is qualified by the name provided by the signature).

Returns
-------
TCollection_AsciiString
") ExploreLabel;
		TCollection_AsciiString ExploreLabel();

		/****************** IsExact ******************/
		%feature("compactdefaultargs") IsExact;
		%feature("autodoc", "Returns true if match must be exact.

Returns
-------
bool
") IsExact;
		Standard_Boolean IsExact();

		/****************** Signature ******************/
		%feature("compactdefaultargs") Signature;
		%feature("autodoc", "Returns the used signature, then it is possible to access it, modify it as required.

Returns
-------
opencascade::handle<IFSelect_Signature>
") Signature;
		opencascade::handle<IFSelect_Signature> Signature();

		/****************** SignatureText ******************/
		%feature("compactdefaultargs") SignatureText;
		%feature("autodoc", "Returns text used to sort entity on its signature.

Returns
-------
TCollection_AsciiString
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
		/****************** IFSelect_SelectSignedSharing ******************/
		%feature("compactdefaultargs") IFSelect_SelectSignedSharing;
		%feature("autodoc", "Creates a selectsignedsharing, defaulted for any level with a given signature and text to match.

Parameters
----------
matcher: IFSelect_Signature
signtext: char *
exact: bool,optional
	default value is Standard_True
level: int,optional
	default value is 0

Returns
-------
None
") IFSelect_SelectSignedSharing;
		 IFSelect_SelectSignedSharing(const opencascade::handle<IFSelect_Signature> & matcher, const char * signtext, const Standard_Boolean exact = Standard_True, const Standard_Integer level = 0);

		/****************** Explore ******************/
		%feature("compactdefaultargs") Explore;
		%feature("autodoc", "Explores an entity : its sharing entities <ent> to take if it matches the signature at level max, filters the result. else gives all sharings.

Parameters
----------
level: int
ent: Standard_Transient
G: Interface_Graph
explored: Interface_EntityIterator

Returns
-------
bool
") Explore;
		Standard_Boolean Explore(const Standard_Integer level, const opencascade::handle<Standard_Transient> & ent, const Interface_Graph & G, Interface_EntityIterator & explored);

		/****************** ExploreLabel ******************/
		%feature("compactdefaultargs") ExploreLabel;
		%feature("autodoc", "Returns a text defining the criterium. (it refers to the text and exact flag to be matched, and is qualified by the name provided by the signature).

Returns
-------
TCollection_AsciiString
") ExploreLabel;
		TCollection_AsciiString ExploreLabel();

		/****************** IsExact ******************/
		%feature("compactdefaultargs") IsExact;
		%feature("autodoc", "Returns true if match must be exact.

Returns
-------
bool
") IsExact;
		Standard_Boolean IsExact();

		/****************** Signature ******************/
		%feature("compactdefaultargs") Signature;
		%feature("autodoc", "Returns the used signature, then it is possible to access it, modify it as required.

Returns
-------
opencascade::handle<IFSelect_Signature>
") Signature;
		opencascade::handle<IFSelect_Signature> Signature();

		/****************** SignatureText ******************/
		%feature("compactdefaultargs") SignatureText;
		%feature("autodoc", "Returns text used to sort entity on its signature.

Returns
-------
TCollection_AsciiString
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
		/****************** IFSelect_SelectUnknownEntities ******************/
		%feature("compactdefaultargs") IFSelect_SelectUnknownEntities;
		%feature("autodoc", "Creates a selectunknownentities.

Returns
-------
None
") IFSelect_SelectUnknownEntities;
		 IFSelect_SelectUnknownEntities();

		/****************** ExtractLabel ******************/
		%feature("compactdefaultargs") ExtractLabel;
		%feature("autodoc", "Returns a text defining the criterium : 'recognized entities'.

Returns
-------
TCollection_AsciiString
") ExtractLabel;
		TCollection_AsciiString ExtractLabel();

		/****************** Sort ******************/
		%feature("compactdefaultargs") Sort;
		%feature("autodoc", "Returns true for an entity which is qualified as 'unknown', i.e. if <model> known <ent> (through its number) as unknown.

Parameters
----------
rank: int
ent: Standard_Transient
model: Interface_InterfaceModel

Returns
-------
bool
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
		/****************** IFSelect_SelectIncorrectEntities ******************/
		%feature("compactdefaultargs") IFSelect_SelectIncorrectEntities;
		%feature("autodoc", "Creates a selectincorrectentities i.e. a selectflag('incorrect').

Returns
-------
None
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
		/****************** IFSelect_SelectType ******************/
		%feature("compactdefaultargs") IFSelect_SelectType;
		%feature("autodoc", "Creates a selecttype. default is no filter.

Returns
-------
None
") IFSelect_SelectType;
		 IFSelect_SelectType();

		/****************** IFSelect_SelectType ******************/
		%feature("compactdefaultargs") IFSelect_SelectType;
		%feature("autodoc", "Creates a selecttype for a given type.

Parameters
----------
atype: Standard_Type

Returns
-------
None
") IFSelect_SelectType;
		 IFSelect_SelectType(const opencascade::handle<Standard_Type> & atype);

		/****************** ExtractLabel ******************/
		%feature("compactdefaultargs") ExtractLabel;
		%feature("autodoc", "Returns a text defining the criterium. (should by gotten from type of entity used for instantiation).

Returns
-------
TCollection_AsciiString
") ExtractLabel;
		TCollection_AsciiString ExtractLabel();

		/****************** SetType ******************/
		%feature("compactdefaultargs") SetType;
		%feature("autodoc", "Sets a type for filter.

Parameters
----------
atype: Standard_Type

Returns
-------
None
") SetType;
		void SetType(const opencascade::handle<Standard_Type> & atype);

		/****************** TypeForMatch ******************/
		%feature("compactdefaultargs") TypeForMatch;
		%feature("autodoc", "Returns the type to be matched for select : this is the type given at instantiation time.

Returns
-------
opencascade::handle<Standard_Type>
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


