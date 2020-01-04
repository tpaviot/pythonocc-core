/*
Copyright 2008-2019 Thomas Paviot (tpaviot@gmail.com)

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
%template(IFSelect_TSeqOfSelection) NCollection_Sequence <opencascade::handle <IFSelect_Selection>>;
%template(IFSelect_SequenceOfGeneralModifier) NCollection_Sequence <opencascade::handle <IFSelect_GeneralModifier>>;
%template(IFSelect_TSeqOfDispatch) NCollection_Sequence <opencascade::handle <IFSelect_Dispatch>>;
%template(IFSelect_SequenceOfAppliedModifiers) NCollection_Sequence <opencascade::handle <IFSelect_AppliedModifiers>>;
%template(IFSelect_SequenceOfInterfaceModel) NCollection_Sequence <opencascade::handle <Interface_InterfaceModel>>;
/* end templates declaration */

/* typedefs */
typedef NCollection_Sequence <opencascade::handle <IFSelect_Selection>> IFSelect_TSeqOfSelection;
typedef NCollection_Sequence <opencascade::handle <IFSelect_GeneralModifier>> IFSelect_SequenceOfGeneralModifier;
typedef NCollection_Sequence <opencascade::handle <IFSelect_Dispatch>> IFSelect_TSeqOfDispatch;
typedef NCollection_Sequence <opencascade::handle <IFSelect_AppliedModifiers>> IFSelect_SequenceOfAppliedModifiers;
typedef IFSelect_ReturnStatus ( * IFSelect_ActFunc ) ( const opencascade::handle <IFSelect_SessionPilot>& );
typedef NCollection_Sequence <opencascade::handle <Interface_InterfaceModel>> IFSelect_SequenceOfInterfaceModel;
/* end typedefs declaration */

/*****************
* class IFSelect *
*****************/
%rename(ifselect) IFSelect;
class IFSelect {
	public:
		/****************** RestoreSession ******************/
		%feature("compactdefaultargs") RestoreSession;
		%feature("autodoc", "* Restore the state of a WorkSession from IFSelect, by using a SessionFile from IFSelect. Returns True if Done, False in case of Error on Writing. <file> gives the name of the File to be used (this avoids to export the class SessionFile).
	:param WS:
	:type WS: IFSelect_WorkSession
	:param file:
	:type file: char *
	:rtype: bool") RestoreSession;
		static Standard_Boolean RestoreSession (const opencascade::handle<IFSelect_WorkSession> & WS,const char * file);

		/****************** SaveSession ******************/
		%feature("compactdefaultargs") SaveSession;
		%feature("autodoc", "* Saves the state of a WorkSession from IFSelect, by using a SessionFile from IFSelect. Returns True if Done, False in case of Error on Writing. <file> gives the name of the File to be produced (this avoids to export the class SessionFile).
	:param WS:
	:type WS: IFSelect_WorkSession
	:param file:
	:type file: char *
	:rtype: bool") SaveSession;
		static Standard_Boolean SaveSession (const opencascade::handle<IFSelect_WorkSession> & WS,const char * file);

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
		%feature("autodoc", "* Allows a self-definition by an Activator of the Commands it processes, call the class method Adding (mode 0)
	:param number:
	:type number: int
	:param command:
	:type command: char *
	:rtype: None") Add;
		void Add (const Standard_Integer number,const char * command);

		/****************** AddSet ******************/
		%feature("compactdefaultargs") AddSet;
		%feature("autodoc", "* Same as Add but specifies that this command is candidate for xset (creation of items, xset : named items; mode 1)
	:param number:
	:type number: int
	:param command:
	:type command: char *
	:rtype: None") AddSet;
		void AddSet (const Standard_Integer number,const char * command);

		/****************** Adding ******************/
		%feature("compactdefaultargs") Adding;
		%feature("autodoc", "* Records, in a Dictionary available for all the Activators, the command title an Activator can process, attached with its number, proper for this Activator <mode> allows to distinguish various execution modes 0: default mode; 1 : for xset
	:param actor:
	:type actor: IFSelect_Activator
	:param number:
	:type number: int
	:param command:
	:type command: char *
	:param mode:
	:type mode: int
	:rtype: void") Adding;
		static void Adding (const opencascade::handle<IFSelect_Activator> & actor,const Standard_Integer number,const char * command,const Standard_Integer mode);

		/****************** Commands ******************/
		%feature("compactdefaultargs") Commands;
		%feature("autodoc", "* Returns, for a root of command title, the list of possible commands. <mode> : -1 (D) for all commands if <commands> is empty -1 + command : about a Group , >= 0 see Adding By default, it returns the whole list of known commands.
	:param mode: default value is -1
	:type mode: int
	:param command: default value is ""
	:type command: char *
	:rtype: opencascade::handle<TColStd_HSequenceOfAsciiString>") Commands;
		static opencascade::handle<TColStd_HSequenceOfAsciiString> Commands (const Standard_Integer mode = -1,const char * command = "");

		/****************** Do ******************/
		%feature("compactdefaultargs") Do;
		%feature("autodoc", "* Tries to execute a Command Line. <number> is the number of the command for this Activator. It Must forecast to record the result of the execution, for need of Undo-Redo Must Returns : 0 for a void command (not to be recorded), 1 if execution OK, -1 if command incorrect, -2 if error on execution
	:param number:
	:type number: int
	:param pilot:
	:type pilot: IFSelect_SessionPilot
	:rtype: IFSelect_ReturnStatus") Do;
		virtual IFSelect_ReturnStatus Do (const Standard_Integer number,const opencascade::handle<IFSelect_SessionPilot> & pilot);

		/****************** File ******************/
		%feature("compactdefaultargs") File;
		%feature("autodoc", ":rtype: char *") File;
		const char * File ();

		/****************** Group ******************/
		%feature("compactdefaultargs") Group;
		%feature("autodoc", ":rtype: char *") Group;
		const char * Group ();

		/****************** Help ******************/
		%feature("compactdefaultargs") Help;
		%feature("autodoc", "* Sends a short help message for a given command identified by it number for this Activator (must take one line max)
	:param number:
	:type number: int
	:rtype: char *") Help;
		virtual const char * Help (const Standard_Integer number);

		/****************** Mode ******************/
		%feature("compactdefaultargs") Mode;
		%feature("autodoc", "* Returns mode recorded for a command. -1 if not found
	:param command:
	:type command: char *
	:rtype: int") Mode;
		static Standard_Integer Mode (const char * command);

		/****************** Remove ******************/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "* Removes a Command, if it is recorded (else, does nothing)
	:param command:
	:type command: char *
	:rtype: void") Remove;
		static void Remove (const char * command);

		/****************** Select ******************/
		%feature("compactdefaultargs") Select;
		%feature("autodoc", "* Selects, for a Command given by its title, an actor with its command number. Returns True if found, False else
	:param command:
	:type command: char *
	:param number:
	:type number: int
	:param actor:
	:type actor: IFSelect_Activator
	:rtype: bool") Select;
		static Standard_Boolean Select (const char * command,Standard_Integer &OutValue,opencascade::handle<IFSelect_Activator> & actor);

		/****************** SetForGroup ******************/
		%feature("compactdefaultargs") SetForGroup;
		%feature("autodoc", "* Group and SetGroup define a 'Group of commands' which correspond to an Activator. Default is 'XSTEP' Also a file may be attached
	:param group:
	:type group: char *
	:param file: default value is ""
	:type file: char *
	:rtype: None") SetForGroup;
		void SetForGroup (const char * group,const char * file = "");

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
		/****************** AddModif ******************/
		%feature("compactdefaultargs") AddModif;
		%feature("autodoc", "* Records a modifier. By default, it is to apply on all a produced file. Further calls to AddNum will restrict this. Returns True if done, False if too many modifiers are already recorded
	:param modif:
	:type modif: IFSelect_GeneralModifier
	:rtype: bool") AddModif;
		Standard_Boolean AddModif (const opencascade::handle<IFSelect_GeneralModifier> & modif);

		/****************** AddNum ******************/
		%feature("compactdefaultargs") AddNum;
		%feature("autodoc", "* Adds a number of entity of the output file to be applied on. If a sequence of AddNum is called after AddModif, this Modifier will be applied on the list of designated entities. Else, it will be applied on all the file Returns True if done, False if no modifier has yet been added
	:param nument:
	:type nument: int
	:rtype: bool") AddNum;
		Standard_Boolean AddNum (const Standard_Integer nument);

		/****************** Count ******************/
		%feature("compactdefaultargs") Count;
		%feature("autodoc", "* Returns the count of recorded modifiers
	:rtype: int") Count;
		Standard_Integer Count ();

		/****************** IFSelect_AppliedModifiers ******************/
		%feature("compactdefaultargs") IFSelect_AppliedModifiers;
		%feature("autodoc", "* Creates an AppliedModifiers, ready to record up to <nbmax> modifiers, on a model of <nbent> entities
	:param nbmax:
	:type nbmax: int
	:param nbent:
	:type nbent: int
	:rtype: None") IFSelect_AppliedModifiers;
		 IFSelect_AppliedModifiers (const Standard_Integer nbmax,const Standard_Integer nbent);

		/****************** IsForAll ******************/
		%feature("compactdefaultargs") IsForAll;
		%feature("autodoc", "* Returns True if the applied modifier queried by last call to Item is to be applied to all the produced file. Else, <entcount> returned by Item gives the count of entity numbers, each one is queried by ItemNum
	:rtype: bool") IsForAll;
		Standard_Boolean IsForAll ();

		/****************** Item ******************/
		%feature("compactdefaultargs") Item;
		%feature("autodoc", "* Returns the description for applied modifier n0 <num> : the modifier itself, and the count of entities to be applied on. If no specific list of number has been defined, returns the total count of entities of the file If this count is zero, then the modifier applies to all the file (see below). Else, the numbers are then queried by calls to ItemNum between 1 and <entcount> Returns True if OK, False if <num> is out of range
	:param num:
	:type num: int
	:param modif:
	:type modif: IFSelect_GeneralModifier
	:param entcount:
	:type entcount: int
	:rtype: bool") Item;
		Standard_Boolean Item (const Standard_Integer num,opencascade::handle<IFSelect_GeneralModifier> & modif,Standard_Integer &OutValue);

		/****************** ItemList ******************/
		%feature("compactdefaultargs") ItemList;
		%feature("autodoc", "* Returns the list of entities to be applied on (see Item) as a HSequence (IsForAll produces the complete list of all the entity numbers of the file
	:rtype: opencascade::handle<TColStd_HSequenceOfInteger>") ItemList;
		opencascade::handle<TColStd_HSequenceOfInteger> ItemList ();

		/****************** ItemNum ******************/
		%feature("compactdefaultargs") ItemNum;
		%feature("autodoc", "* Returns a numero of entity to be applied on, given its rank in the list. If no list is defined (i.e. for all the file), returns <nument> itself, to give all the entities of the file Returns 0 if <nument> out of range
	:param nument:
	:type nument: int
	:rtype: int") ItemNum;
		Standard_Integer ItemNum (const Standard_Integer nument);

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
		/****************** AddCheck ******************/
		%feature("compactdefaultargs") AddCheck;
		%feature("autodoc", "* Adds a Check to the CheckList. If it is empty, nothing is done If it concerns an Entity from the Original Model (by SetEntity) to which another Check is attached, it is merged to it. Else, it is added or merged as to GlobalCheck.
	:param check:
	:type check: Interface_Check
	:rtype: None") AddCheck;
		void AddCheck (const opencascade::handle<Interface_Check> & check);

		/****************** AddFail ******************/
		%feature("compactdefaultargs") AddFail;
		%feature("autodoc", "* Adds a Fail Message for an Entity from the original Model If <start> is not an Entity from the original model (e.g. the model itself) this message is added to Global Check.
	:param start:
	:type start: Standard_Transient
	:param mess:
	:type mess: char *
	:param orig: default value is ""
	:type orig: char *
	:rtype: None") AddFail;
		void AddFail (const opencascade::handle<Standard_Transient> & start,const char * mess,const char * orig = "");

		/****************** AddWarning ******************/
		%feature("compactdefaultargs") AddWarning;
		%feature("autodoc", "* Adds a Warning Message for an Entity from the original Model If <start> is not an Entity from the original model (e.g. the model itself) this message is added to Global Check.
	:param start:
	:type start: Standard_Transient
	:param mess:
	:type mess: char *
	:param orig: default value is ""
	:type orig: char *
	:rtype: None") AddWarning;
		void AddWarning (const opencascade::handle<Standard_Transient> & start,const char * mess,const char * orig = "");

		/****************** CCheck ******************/
		%feature("compactdefaultargs") CCheck;
		%feature("autodoc", "* Returns a Check given an Entity number (in the original Model) by default a Global Check. Creates it the first time. It can then be acknowledged on the spot, in condition that the caller works by reference ('Interface_Check& check = ...')
	:param num: default value is 0
	:type num: int
	:rtype: opencascade::handle<Interface_Check>") CCheck;
		opencascade::handle<Interface_Check> CCheck (const Standard_Integer num = 0);

		/****************** CCheck ******************/
		%feature("compactdefaultargs") CCheck;
		%feature("autodoc", "* Returns a Check attached to an Entity from the original Model It can then be acknowledged on the spot, in condition that the caller works by reference ('Interface_Check& check = ...')
	:param start:
	:type start: Standard_Transient
	:rtype: opencascade::handle<Interface_Check>") CCheck;
		opencascade::handle<Interface_Check> CCheck (const opencascade::handle<Standard_Transient> & start);

		/****************** CheckList ******************/
		%feature("compactdefaultargs") CheckList;
		%feature("autodoc", "* Returns the complete CheckList
	:rtype: Interface_CheckIterator") CheckList;
		Interface_CheckIterator CheckList ();

		/****************** Control ******************/
		%feature("compactdefaultargs") Control;
		%feature("autodoc", "* Returns the map for a direct use, if required
	:rtype: opencascade::handle<Interface_CopyControl>") Control;
		opencascade::handle<Interface_CopyControl> Control ();

		/****************** FileName ******************/
		%feature("compactdefaultargs") FileName;
		%feature("autodoc", "* Returns File Name (can be empty)
	:rtype: char *") FileName;
		const char * FileName ();

		/****************** HasFileName ******************/
		%feature("compactdefaultargs") HasFileName;
		%feature("autodoc", "* Returns True if a non empty file name has been defined
	:rtype: bool") HasFileName;
		Standard_Boolean HasFileName ();

		/****************** IFSelect_ContextModif ******************/
		%feature("compactdefaultargs") IFSelect_ContextModif;
		%feature("autodoc", "* Prepares a ContextModif with these informations : - the graph established from original model (target passed directly to Modifier) - the CopyTool which detains the CopyControl, which maps starting (in original) and result (in target) entities - an optional file name (for file output) //! Such a ContextModif is considered to be applied on all transferred entities (no filter active)
	:param graph:
	:type graph: Interface_Graph
	:param TC:
	:type TC: Interface_CopyTool
	:param filename: default value is ""
	:type filename: char *
	:rtype: None") IFSelect_ContextModif;
		 IFSelect_ContextModif (const Interface_Graph & graph,const Interface_CopyTool & TC,const char * filename = "");

		/****************** IFSelect_ContextModif ******************/
		%feature("compactdefaultargs") IFSelect_ContextModif;
		%feature("autodoc", "* Prepares a ContextModif with these informations : - the graph established from original model (target passed directly to Modifier) - an optional file name (for file output) Here, no CopyControl, hence all entities are considered equal as starting and result //! Such a ContextModif is considered to be applied on all transferred entities (no filter active)
	:param graph:
	:type graph: Interface_Graph
	:param filename: default value is ""
	:type filename: char *
	:rtype: None") IFSelect_ContextModif;
		 IFSelect_ContextModif (const Interface_Graph & graph,const char * filename = "");

		/****************** IsForAll ******************/
		%feature("compactdefaultargs") IsForAll;
		%feature("autodoc", "* Returns True if no filter is defined : a Modifier has to work on all entities of the resulting (target) model
	:rtype: bool") IsForAll;
		Standard_Boolean IsForAll ();

		/****************** IsForNone ******************/
		%feature("compactdefaultargs") IsForNone;
		%feature("autodoc", "* Returns True if Select has determined that a Modifier may not be run (filter defined and empty)
	:rtype: bool") IsForNone;
		Standard_Boolean IsForNone ();

		/****************** IsSelected ******************/
		%feature("compactdefaultargs") IsSelected;
		%feature("autodoc", "* Returns True if a starting item has been transferred and selected
	:param ent:
	:type ent: Standard_Transient
	:rtype: bool") IsSelected;
		Standard_Boolean IsSelected (const opencascade::handle<Standard_Transient> & ent);

		/****************** IsTransferred ******************/
		%feature("compactdefaultargs") IsTransferred;
		%feature("autodoc", "* Returns True if a starting item has been transferred
	:param ent:
	:type ent: Standard_Transient
	:rtype: bool") IsTransferred;
		Standard_Boolean IsTransferred (const opencascade::handle<Standard_Transient> & ent);

		/****************** More ******************/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "* Returns True until the iteration has finished
	:rtype: bool") More;
		Standard_Boolean More ();

		/****************** Next ******************/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "* Advances the iteration
	:rtype: None") Next;
		void Next ();

		/****************** OriginalGraph ******************/
		%feature("compactdefaultargs") OriginalGraph;
		%feature("autodoc", "* Returns the original Graph (compared to OriginalModel, it gives more query capabilitites)
	:rtype: Interface_Graph") OriginalGraph;
		const Interface_Graph & OriginalGraph ();

		/****************** OriginalModel ******************/
		%feature("compactdefaultargs") OriginalModel;
		%feature("autodoc", "* Returns the original model
	:rtype: opencascade::handle<Interface_InterfaceModel>") OriginalModel;
		opencascade::handle<Interface_InterfaceModel> OriginalModel ();

		/****************** Protocol ******************/
		%feature("compactdefaultargs") Protocol;
		%feature("autodoc", "* Returns the Protocol (Null if not set)
	:rtype: opencascade::handle<Interface_Protocol>") Protocol;
		opencascade::handle<Interface_Protocol> Protocol ();

		/****************** Select ******************/
		%feature("compactdefaultargs") Select;
		%feature("autodoc", "* This method requires ContextModif to be applied with a filter. If a ModelModifier is defined with a Selection criterium, the result of this Selection is used as a filter : - if none of its items has been transferred, the modification does not apply at all - else, the Modifier can query for what entities were selected and what are their results - if this method is not called before working, the Modifier has to work on the whole Model
	:param list:
	:type list: Interface_EntityIterator
	:rtype: None") Select;
		void Select (Interface_EntityIterator & list);

		/****************** SelectedCount ******************/
		%feature("compactdefaultargs") SelectedCount;
		%feature("autodoc", "* Returns the count of selected and transferred items
	:rtype: int") SelectedCount;
		Standard_Integer SelectedCount ();

		/****************** SelectedOriginal ******************/
		%feature("compactdefaultargs") SelectedOriginal;
		%feature("autodoc", "* Returns the list of original selected items. See also the iteration
	:rtype: Interface_EntityIterator") SelectedOriginal;
		Interface_EntityIterator SelectedOriginal ();

		/****************** SelectedResult ******************/
		%feature("compactdefaultargs") SelectedResult;
		%feature("autodoc", "* Returns the list of resulting counterparts of selected items. See also the iteration
	:rtype: Interface_EntityIterator") SelectedResult;
		Interface_EntityIterator SelectedResult ();

		/****************** SetProtocol ******************/
		%feature("compactdefaultargs") SetProtocol;
		%feature("autodoc", "* Allows to transmit a Protocol as part of a ContextModif
	:param proto:
	:type proto: Interface_Protocol
	:rtype: None") SetProtocol;
		void SetProtocol (const opencascade::handle<Interface_Protocol> & proto);

		/****************** Start ******************/
		%feature("compactdefaultargs") Start;
		%feature("autodoc", "* Starts an iteration on selected items. It takes into account IsForAll/IsForNone, by really iterating on all selected items.
	:rtype: None") Start;
		void Start ();

		/****************** Trace ******************/
		%feature("compactdefaultargs") Trace;
		%feature("autodoc", "* Traces the modification of the current entity (see above, ValueOriginal and ValueResult) for default trace level >= 2. To be called on each indivudual entity really modified <mess> is an optionnal additional message
	:param mess: default value is ""
	:type mess: char *
	:rtype: None") Trace;
		void Trace (const char * mess = "");

		/****************** TraceModifier ******************/
		%feature("compactdefaultargs") TraceModifier;
		%feature("autodoc", "* Traces the application of a Modifier. Works with default trace File and Level. Fills the trace if default trace level is at least 1. Traces the Modifier (its Label) and its Selection if there is one (its Label). To be called after Select (because status IsForAll is printed) Worths to trace a global modification. See also Trace below
	:param modif:
	:type modif: IFSelect_GeneralModifier
	:rtype: None") TraceModifier;
		void TraceModifier (const opencascade::handle<IFSelect_GeneralModifier> & modif);

		/****************** ValueOriginal ******************/
		%feature("compactdefaultargs") ValueOriginal;
		%feature("autodoc", "* Returns the current selected item in the original model
	:rtype: opencascade::handle<Standard_Transient>") ValueOriginal;
		opencascade::handle<Standard_Transient> ValueOriginal ();

		/****************** ValueResult ******************/
		%feature("compactdefaultargs") ValueResult;
		%feature("autodoc", "* Returns the result counterpart of current selected item (in the target model)
	:rtype: opencascade::handle<Standard_Transient>") ValueResult;
		opencascade::handle<Standard_Transient> ValueResult ();

};


%extend IFSelect_ContextModif {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class IFSelect_ContextWrite *
******************************/
class IFSelect_ContextWrite {
	public:
		/****************** AddCheck ******************/
		%feature("compactdefaultargs") AddCheck;
		%feature("autodoc", "* Adds a Check to the CheckList. If it is empty, nothing is done If it concerns an Entity from the Model (by SetEntity) to which another Check is attached, it is merged to it. Else, it is added or merged as to GlobalCheck.
	:param check:
	:type check: Interface_Check
	:rtype: None") AddCheck;
		void AddCheck (const opencascade::handle<Interface_Check> & check);

		/****************** AddFail ******************/
		%feature("compactdefaultargs") AddFail;
		%feature("autodoc", "* Adds a Fail Message for an Entity from the Model If <start> is not an Entity from the model (e.g. the model itself) this message is added to Global Check.
	:param start:
	:type start: Standard_Transient
	:param mess:
	:type mess: char *
	:param orig: default value is ""
	:type orig: char *
	:rtype: None") AddFail;
		void AddFail (const opencascade::handle<Standard_Transient> & start,const char * mess,const char * orig = "");

		/****************** AddWarning ******************/
		%feature("compactdefaultargs") AddWarning;
		%feature("autodoc", "* Adds a Warning Message for an Entity from the Model If <start> is not an Entity from the model (e.g. the model itself) this message is added to Global Check.
	:param start:
	:type start: Standard_Transient
	:param mess:
	:type mess: char *
	:param orig: default value is ""
	:type orig: char *
	:rtype: None") AddWarning;
		void AddWarning (const opencascade::handle<Standard_Transient> & start,const char * mess,const char * orig = "");

		/****************** AppliedModifiers ******************/
		%feature("compactdefaultargs") AppliedModifiers;
		%feature("autodoc", "* Returns the object AppliedModifiers
	:rtype: opencascade::handle<IFSelect_AppliedModifiers>") AppliedModifiers;
		opencascade::handle<IFSelect_AppliedModifiers> AppliedModifiers ();

		/****************** CCheck ******************/
		%feature("compactdefaultargs") CCheck;
		%feature("autodoc", "* Returns a Check given an Entity number (in the Model) by default a Global Check. Creates it the first time. It can then be acknowledged on the spot, in condition that the caller works by reference ('Interface_Check& check = ...')
	:param num: default value is 0
	:type num: int
	:rtype: opencascade::handle<Interface_Check>") CCheck;
		opencascade::handle<Interface_Check> CCheck (const Standard_Integer num = 0);

		/****************** CCheck ******************/
		%feature("compactdefaultargs") CCheck;
		%feature("autodoc", "* Returns a Check attached to an Entity from the Model It can then be acknowledged on the spot, in condition that the caller works by reference ('Interface_Check& check = ...')
	:param start:
	:type start: Standard_Transient
	:rtype: opencascade::handle<Interface_Check>") CCheck;
		opencascade::handle<Interface_Check> CCheck (const opencascade::handle<Standard_Transient> & start);

		/****************** CheckList ******************/
		%feature("compactdefaultargs") CheckList;
		%feature("autodoc", "* Returns the complete CheckList
	:rtype: Interface_CheckIterator") CheckList;
		Interface_CheckIterator CheckList ();

		/****************** FileModifier ******************/
		%feature("compactdefaultargs") FileModifier;
		%feature("autodoc", "* Returns the currently active File Modifier. Cast to be done Null if not properly set : must be test IsNull after casting
	:rtype: opencascade::handle<IFSelect_GeneralModifier>") FileModifier;
		opencascade::handle<IFSelect_GeneralModifier> FileModifier ();

		/****************** FileName ******************/
		%feature("compactdefaultargs") FileName;
		%feature("autodoc", "* Returns the File Name
	:rtype: char *") FileName;
		const char * FileName ();

		/****************** Graph ******************/
		%feature("compactdefaultargs") Graph;
		%feature("autodoc", "* Returns the Graph, either given when created, else created the first time it is queried
	:rtype: Interface_Graph") Graph;
		const Interface_Graph & Graph ();

		/****************** IFSelect_ContextWrite ******************/
		%feature("compactdefaultargs") IFSelect_ContextWrite;
		%feature("autodoc", "* Prepares a ContextWrite with these informations : - the model which is to be written - the protocol to be used - the filename - an object AppliedModifiers to work. It gives a list of FileModifiers to be ran, and for each one it can give a restricted list of entities (in the model), else all the model is considered
	:param model:
	:type model: Interface_InterfaceModel
	:param proto:
	:type proto: Interface_Protocol
	:param applieds:
	:type applieds: IFSelect_AppliedModifiers
	:param filename:
	:type filename: char *
	:rtype: None") IFSelect_ContextWrite;
		 IFSelect_ContextWrite (const opencascade::handle<Interface_InterfaceModel> & model,const opencascade::handle<Interface_Protocol> & proto,const opencascade::handle<IFSelect_AppliedModifiers> & applieds,const char * filename);

		/****************** IFSelect_ContextWrite ******************/
		%feature("compactdefaultargs") IFSelect_ContextWrite;
		%feature("autodoc", "* Same as above but with an already computed Graph
	:param hgraph:
	:type hgraph: Interface_HGraph
	:param proto:
	:type proto: Interface_Protocol
	:param applieds:
	:type applieds: IFSelect_AppliedModifiers
	:param filename:
	:type filename: char *
	:rtype: None") IFSelect_ContextWrite;
		 IFSelect_ContextWrite (const opencascade::handle<Interface_HGraph> & hgraph,const opencascade::handle<Interface_Protocol> & proto,const opencascade::handle<IFSelect_AppliedModifiers> & applieds,const char * filename);

		/****************** IsForAll ******************/
		%feature("compactdefaultargs") IsForAll;
		%feature("autodoc", "* Returns True if the current modifier is to be applied to the whole model. Else, a restricted list of selected entities is defined, it can be exploited by the File Modifier
	:rtype: bool") IsForAll;
		Standard_Boolean IsForAll ();

		/****************** IsForNone ******************/
		%feature("compactdefaultargs") IsForNone;
		%feature("autodoc", "* Returns True if no modifier is currently set
	:rtype: bool") IsForNone;
		Standard_Boolean IsForNone ();

		/****************** Model ******************/
		%feature("compactdefaultargs") Model;
		%feature("autodoc", "* Returns the Model
	:rtype: opencascade::handle<Interface_InterfaceModel>") Model;
		opencascade::handle<Interface_InterfaceModel> Model ();

		/****************** More ******************/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "* Returns True until the iteration has finished
	:rtype: bool") More;
		Standard_Boolean More ();

		/****************** NbEntities ******************/
		%feature("compactdefaultargs") NbEntities;
		%feature("autodoc", "* Returns the total count of selected entities
	:rtype: int") NbEntities;
		Standard_Integer NbEntities ();

		/****************** NbModifiers ******************/
		%feature("compactdefaultargs") NbModifiers;
		%feature("autodoc", "* Returns the count of recorded File Modifiers
	:rtype: int") NbModifiers;
		Standard_Integer NbModifiers ();

		/****************** Next ******************/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "* Advances the iteration
	:rtype: None") Next;
		void Next ();

		/****************** Protocol ******************/
		%feature("compactdefaultargs") Protocol;
		%feature("autodoc", "* Returns the Protocol;
	:rtype: opencascade::handle<Interface_Protocol>") Protocol;
		opencascade::handle<Interface_Protocol> Protocol ();

		/****************** SetModifier ******************/
		%feature("compactdefaultargs") SetModifier;
		%feature("autodoc", "* Sets active the File Modifier n0 <numod> Then, it prepares the list of entities to consider, if any Returns False if <numod> out of range
	:param numod:
	:type numod: int
	:rtype: bool") SetModifier;
		Standard_Boolean SetModifier (const Standard_Integer numod);

		/****************** Start ******************/
		%feature("compactdefaultargs") Start;
		%feature("autodoc", "* Starts an iteration on selected items. It takes into account IsForAll/IsForNone, by really iterating on all selected items.
	:rtype: None") Start;
		void Start ();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* Returns the current selected entity in the model
	:rtype: opencascade::handle<Standard_Transient>") Value;
		opencascade::handle<Standard_Transient> Value ();

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
		%feature("autodoc", "* Returns True if a Dispatch can have a Remainder, i.e. if its criterium can let entities apart. It is a potential answer, remainder can be empty at run-time even if answer is True. (to attach a RemainderFromDispatch Selection is not allowed if answer is True). Default answer given here is False (can be redefined)
	:rtype: bool") CanHaveRemainder;
		virtual Standard_Boolean CanHaveRemainder ();

		/****************** FinalSelection ******************/
		%feature("compactdefaultargs") FinalSelection;
		%feature("autodoc", "* Returns the Final Selection of a Dispatch we 'd like : C++ : return const &
	:rtype: opencascade::handle<IFSelect_Selection>") FinalSelection;
		opencascade::handle<IFSelect_Selection> FinalSelection ();

		/****************** GetEntities ******************/
		%feature("compactdefaultargs") GetEntities;
		%feature("autodoc", "* Gets Unique Root Entities from the Final Selection, given an input Graph This the starting step for an Evaluation (Packets - Remainder)
	:param G:
	:type G: Interface_Graph
	:rtype: Interface_EntityIterator") GetEntities;
		Interface_EntityIterator GetEntities (const Interface_Graph & G);

		/****************** HasRootName ******************/
		%feature("compactdefaultargs") HasRootName;
		%feature("autodoc", "* Returns True if a specific Root Name has been set (else, the Default Root Name has to be used)
	:rtype: bool") HasRootName;
		Standard_Boolean HasRootName ();

		/****************** Label ******************/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "* Returns a text which defines the way a Dispatch produces packets (which will become files) from its Input
	:rtype: TCollection_AsciiString") Label;
		virtual TCollection_AsciiString Label ();

		/****************** LimitedMax ******************/
		%feature("compactdefaultargs") LimitedMax;
		%feature("autodoc", "* Returns True if a Dispatch generates a count of Packets always less than or equal to a maximum value : it can be computed from the total count of Entities to be dispatched : <nbent>. If answer is False, no limited maximum is expected for account If answer is True, expected maximum is given in argument <max> Default answer given here is False (can be redefined)
	:param nbent:
	:type nbent: int
	:param max:
	:type max: int
	:rtype: bool") LimitedMax;
		virtual Standard_Boolean LimitedMax (const Standard_Integer nbent,Standard_Integer &OutValue);

		/****************** Packeted ******************/
		%feature("compactdefaultargs") Packeted;
		%feature("autodoc", "* Returns the list of all Input Entities (see GetEntities) which are put in a Packet. That is, Entities listed in GetEntities but not in Remainder (see below). Input is given as a Graph.
	:param G:
	:type G: Interface_Graph
	:rtype: Interface_EntityIterator") Packeted;
		Interface_EntityIterator Packeted (const Interface_Graph & G);

		/****************** Packets ******************/
		%feature("compactdefaultargs") Packets;
		%feature("autodoc", "* Returns the list of produced Packets into argument <pack>. Each Packet corresponds to a Part, the Entities listed are the Roots given by the Selection. Input is given as a Graph. Thus, to create a file from a packet, it suffices to take the entities listed in a Part of Packets (that is, a Packet) without worrying about Shared entities This method can raise an Exception if data are not coherent
	:param G:
	:type G: Interface_Graph
	:param packs:
	:type packs: IFGraph_SubPartsIterator
	:rtype: void") Packets;
		virtual void Packets (const Interface_Graph & G,IFGraph_SubPartsIterator & packs);

		/****************** Remainder ******************/
		%feature("compactdefaultargs") Remainder;
		%feature("autodoc", "* Returns Remainder which is a set of Entities. Can be empty. Default evaluation is empty (has to be redefined if CanHaveRemainder is redefined to return True).
	:param G:
	:type G: Interface_Graph
	:rtype: Interface_EntityIterator") Remainder;
		virtual Interface_EntityIterator Remainder (const Interface_Graph & G);

		/****************** RootName ******************/
		%feature("compactdefaultargs") RootName;
		%feature("autodoc", "* Returns the Root Name for files produced by this dispatch It is empty if it has not been set or if it has been reset
	:rtype: opencascade::handle<TCollection_HAsciiString>") RootName;
		const opencascade::handle<TCollection_HAsciiString> & RootName ();

		/****************** Selections ******************/
		%feature("compactdefaultargs") Selections;
		%feature("autodoc", "* Returns the complete list of source Selections (starting from FinalSelection)
	:rtype: IFSelect_SelectionIterator") Selections;
		IFSelect_SelectionIterator Selections ();

		/****************** SetFinalSelection ******************/
		%feature("compactdefaultargs") SetFinalSelection;
		%feature("autodoc", "* Stores (or Changes) the Final Selection for a Dispatch
	:param sel:
	:type sel: IFSelect_Selection
	:rtype: None") SetFinalSelection;
		void SetFinalSelection (const opencascade::handle<IFSelect_Selection> & sel);

		/****************** SetRootName ******************/
		%feature("compactdefaultargs") SetRootName;
		%feature("autodoc", "* Sets a Root Name as an HAsciiString To reset it, give a Null Handle (then, a ShareOut will have to define the Default Root Name)
	:param name:
	:type name: TCollection_HAsciiString
	:rtype: None") SetRootName;
		void SetRootName (const opencascade::handle<TCollection_HAsciiString> & name);

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
		/****************** Apply ******************/
		%feature("compactdefaultargs") Apply;
		%feature("autodoc", "* Applies modifications to own data Calls ApplyData then Clears Status according EditKeepStatus
	:rtype: bool") Apply;
		Standard_Boolean Apply ();

		/****************** ApplyData ******************/
		%feature("compactdefaultargs") ApplyData;
		%feature("autodoc", "* Applies modifications to data Default uses Editor. Can be redefined
	:param ent:
	:type ent: Standard_Transient
	:param model:
	:type model: Interface_InterfaceModel
	:rtype: bool") ApplyData;
		virtual Standard_Boolean ApplyData (const opencascade::handle<Standard_Transient> & ent,const opencascade::handle<Interface_InterfaceModel> & model);

		/****************** ClearData ******************/
		%feature("compactdefaultargs") ClearData;
		%feature("autodoc", ":rtype: None") ClearData;
		void ClearData ();

		/****************** ClearEdit ******************/
		%feature("compactdefaultargs") ClearEdit;
		%feature("autodoc", "* Clears modification status : by default all, or one by its numbers (in the Editor)
	:param num: default value is 0
	:type num: int
	:rtype: None") ClearEdit;
		void ClearEdit (const Standard_Integer num = 0);


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
		%feature("autodoc", "* Returns the Edited Value as a list If IsModified is False, returns OriginalValue Null with IsModified True : means that this value is not defined or has been removed For a single parameter, gives a Null Handle
	:param num:
	:type num: int
	:rtype: opencascade::handle<TColStd_HSequenceOfHAsciiString>") EditedList;
		opencascade::handle<TColStd_HSequenceOfHAsciiString> EditedList (const Standard_Integer num);

		/****************** EditedValue ******************/
		%feature("compactdefaultargs") EditedValue;
		%feature("autodoc", "* Returns the Edited (i.e. Modified) Value (string for single) <num> reports to the EditForm If IsModified is False, returns OriginalValue Null with IsModified True : means that this value is not defined or has been removed It is for a single parameter. For a list, gives a Null Handle
	:param num:
	:type num: int
	:rtype: opencascade::handle<TCollection_HAsciiString>") EditedValue;
		opencascade::handle<TCollection_HAsciiString> EditedValue (const Standard_Integer num);

		/****************** Editor ******************/
		%feature("compactdefaultargs") Editor;
		%feature("autodoc", ":rtype: opencascade::handle<IFSelect_Editor>") Editor;
		opencascade::handle<IFSelect_Editor> Editor ();

		/****************** Entity ******************/
		%feature("compactdefaultargs") Entity;
		%feature("autodoc", ":rtype: opencascade::handle<Standard_Transient>") Entity;
		opencascade::handle<Standard_Transient> Entity ();

		/****************** IFSelect_EditForm ******************/
		%feature("compactdefaultargs") IFSelect_EditForm;
		%feature("autodoc", "* Creates a complete EditForm from an Editor A specific Label can be given
	:param editor:
	:type editor: IFSelect_Editor
	:param readonly:
	:type readonly: bool
	:param undoable:
	:type undoable: bool
	:param label: default value is ""
	:type label: char *
	:rtype: None") IFSelect_EditForm;
		 IFSelect_EditForm (const opencascade::handle<IFSelect_Editor> & editor,const Standard_Boolean readonly,const Standard_Boolean undoable,const char * label = "");

		/****************** IFSelect_EditForm ******************/
		%feature("compactdefaultargs") IFSelect_EditForm;
		%feature("autodoc", "* Creates an extracted EditForm from an Editor, limited to the values identified in <nums> A specific Label can be given
	:param editor:
	:type editor: IFSelect_Editor
	:param nums:
	:type nums: TColStd_SequenceOfInteger
	:param readonly:
	:type readonly: bool
	:param undoable:
	:type undoable: bool
	:param label: default value is ""
	:type label: char *
	:rtype: None") IFSelect_EditForm;
		 IFSelect_EditForm (const opencascade::handle<IFSelect_Editor> & editor,const TColStd_SequenceOfInteger & nums,const Standard_Boolean readonly,const Standard_Boolean undoable,const char * label = "");

		/****************** IsComplete ******************/
		%feature("compactdefaultargs") IsComplete;
		%feature("autodoc", "* Tells if an EditForm is complete or is an extract from Editor
	:rtype: bool") IsComplete;
		Standard_Boolean IsComplete ();

		/****************** IsLoaded ******************/
		%feature("compactdefaultargs") IsLoaded;
		%feature("autodoc", "* Tells if the EditForm is loaded now
	:rtype: bool") IsLoaded;
		Standard_Boolean IsLoaded ();

		/****************** IsModified ******************/
		%feature("compactdefaultargs") IsModified;
		%feature("autodoc", "* Tells if a Value (of the EditForm) is modified (directly or through touching by Update)
	:param num:
	:type num: int
	:rtype: bool") IsModified;
		Standard_Boolean IsModified (const Standard_Integer num);

		/****************** IsTouched ******************/
		%feature("compactdefaultargs") IsTouched;
		%feature("autodoc", "* Tells if a Value (of the EditForm) has been touched, i.e. not modified directly but by the modification of another one (by method Update from the Editor)
	:param num:
	:type num: int
	:rtype: bool") IsTouched;
		Standard_Boolean IsTouched (const Standard_Integer num);

		/****************** Label ******************/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", ":rtype: char *") Label;
		const char * Label ();

		/****************** ListEditor ******************/
		%feature("compactdefaultargs") ListEditor;
		%feature("autodoc", "* Returns a ListEditor to edit the parameter <num> of the EditForm, if it is a List The Editor created it (by ListEditor) then loads it (by ListValue) For a single parameter, returns a Null Handle ...
	:param num:
	:type num: int
	:rtype: opencascade::handle<IFSelect_ListEditor>") ListEditor;
		opencascade::handle<IFSelect_ListEditor> ListEditor (const Standard_Integer num);

		/****************** LoadData ******************/
		%feature("compactdefaultargs") LoadData;
		%feature("autodoc", "* Loads modifications to data Default uses Editor. Can be redefined Remark that <ent> and/or <model> may be null, according to the kind of Editor. Shortcuts are available for these cases, but they finally call LoadData (hence, just ignore non-used args)
	:param ent:
	:type ent: Standard_Transient
	:param model:
	:type model: Interface_InterfaceModel
	:rtype: bool") LoadData;
		virtual Standard_Boolean LoadData (const opencascade::handle<Standard_Transient> & ent,const opencascade::handle<Interface_InterfaceModel> & model);

		/****************** LoadData ******************/
		%feature("compactdefaultargs") LoadData;
		%feature("autodoc", "* Shortcut when both <ent> and <model> are not used (when the Editor works on fully static or global data)
	:rtype: bool") LoadData;
		Standard_Boolean LoadData ();

		/****************** LoadDefault ******************/
		%feature("compactdefaultargs") LoadDefault;
		%feature("autodoc", "* For a read-write undoable EditForm, loads original values from defaults stored in the Editor
	:rtype: None") LoadDefault;
		void LoadDefault ();

		/****************** LoadEntity ******************/
		%feature("compactdefaultargs") LoadEntity;
		%feature("autodoc", "* Shortcut for LoadData when <model> is not used
	:param ent:
	:type ent: Standard_Transient
	:rtype: bool") LoadEntity;
		Standard_Boolean LoadEntity (const opencascade::handle<Standard_Transient> & ent);

		/****************** LoadList ******************/
		%feature("compactdefaultargs") LoadList;
		%feature("autodoc", "* Loads an original value as a list. Called by the Editor only
	:param num:
	:type num: int
	:param list:
	:type list: TColStd_HSequenceOfHAsciiString
	:rtype: None") LoadList;
		void LoadList (const Standard_Integer num,const opencascade::handle<TColStd_HSequenceOfHAsciiString> & list);

		/****************** LoadModel ******************/
		%feature("compactdefaultargs") LoadModel;
		%feature("autodoc", "* Shortcut for LoadData when only the model is concerned
	:param model:
	:type model: Interface_InterfaceModel
	:rtype: bool") LoadModel;
		Standard_Boolean LoadModel (const opencascade::handle<Interface_InterfaceModel> & model);

		/****************** LoadValue ******************/
		%feature("compactdefaultargs") LoadValue;
		%feature("autodoc", "* Loads an original value (single). Called by the Editor only
	:param num:
	:type num: int
	:param val:
	:type val: TCollection_HAsciiString
	:rtype: None") LoadValue;
		void LoadValue (const Standard_Integer num,const opencascade::handle<TCollection_HAsciiString> & val);

		/****************** Model ******************/
		%feature("compactdefaultargs") Model;
		%feature("autodoc", ":rtype: opencascade::handle<Interface_InterfaceModel>") Model;
		opencascade::handle<Interface_InterfaceModel> Model ();

		/****************** Modify ******************/
		%feature("compactdefaultargs") Modify;
		%feature("autodoc", "* Gives a new value for the item <num> of the EditForm, if it is a single parameter (for a list, just returns False) Null means to Remove it <enforce> True to overpass Protected or Computed Access Mode Calls the method Update from the Editor, which can touch other parameters (see NbTouched) Returns True if well recorded, False if this value is not allowed Warning : Does not apply immediately : will be applied by the method Apply
	:param num:
	:type num: int
	:param newval:
	:type newval: TCollection_HAsciiString
	:param enforce: default value is Standard_False
	:type enforce: bool
	:rtype: bool") Modify;
		Standard_Boolean Modify (const Standard_Integer num,const opencascade::handle<TCollection_HAsciiString> & newval,const Standard_Boolean enforce = Standard_False);

		/****************** ModifyList ******************/
		%feature("compactdefaultargs") ModifyList;
		%feature("autodoc", "* Changes the value of an item of the EditForm, if it is a List (else, just returns False) The ListEditor contains the edited values of the list If no edition was recorded, just returns False Calls the method Update from the Editor, which can touch other parameters (see NbTouched) Returns True if well recorded, False if this value is not allowed Warning : Does not apply immediately : will be applied by the method Apply
	:param num:
	:type num: int
	:param edited:
	:type edited: IFSelect_ListEditor
	:param enforce: default value is Standard_False
	:type enforce: bool
	:rtype: bool") ModifyList;
		Standard_Boolean ModifyList (const Standard_Integer num,const opencascade::handle<IFSelect_ListEditor> & edited,const Standard_Boolean enforce = Standard_False);

		/****************** ModifyListValue ******************/
		%feature("compactdefaultargs") ModifyListValue;
		%feature("autodoc", "* As ModifyList but the new value is given as such Creates a ListEditor, Loads it, then calls ModifyList
	:param num:
	:type num: int
	:param list:
	:type list: TColStd_HSequenceOfHAsciiString
	:param enforce: default value is Standard_False
	:type enforce: bool
	:rtype: bool") ModifyListValue;
		Standard_Boolean ModifyListValue (const Standard_Integer num,const opencascade::handle<TColStd_HSequenceOfHAsciiString> & list,const Standard_Boolean enforce = Standard_False);

		/****************** NameNumber ******************/
		%feature("compactdefaultargs") NameNumber;
		%feature("autodoc", "* Returns the Value Number in the Editor for a given Name i.e. the true ValueNumber which can be used in various methods of EditForm If it is not complete, for a recorded (in the Editor) but non-loaded name, returns negative value (- number)
	:param name:
	:type name: char *
	:rtype: int") NameNumber;
		Standard_Integer NameNumber (const char * name);

		/****************** NameRank ******************/
		%feature("compactdefaultargs") NameRank;
		%feature("autodoc", "* Returns the Rank of Value in the EditForm for a given Name i.e. if it is not complete, for a recorded (in the Editor) but non-loaded name, returns 0
	:param name:
	:type name: char *
	:rtype: int") NameRank;
		Standard_Integer NameRank (const char * name);

		/****************** NbValues ******************/
		%feature("compactdefaultargs") NbValues;
		%feature("autodoc", "* Returns the count of values <editable> True : count of editable values, i.e. For a complete EditForm, it is given by the Editor Else, it is the length of the extraction map <editable> False : all the values from the Editor
	:param editable:
	:type editable: bool
	:rtype: int") NbValues;
		Standard_Integer NbValues (const Standard_Boolean editable);

		/****************** NumberFromRank ******************/
		%feature("compactdefaultargs") NumberFromRank;
		%feature("autodoc", "* Returns the Value Number in the Editor from a given Rank in the EditForm For a complete EditForm, both are equal Else, it is given by the extraction map Returns 0 if <rank> exceeds the count of editable values,
	:param rank:
	:type rank: int
	:rtype: int") NumberFromRank;
		Standard_Integer NumberFromRank (const Standard_Integer rank);

		/****************** OriginalList ******************/
		%feature("compactdefaultargs") OriginalList;
		%feature("autodoc", "* Returns an original value, as a list <num> is for the EditForm, not the Editor For a single parameter, gives a Null Handle
	:param num:
	:type num: int
	:rtype: opencascade::handle<TColStd_HSequenceOfHAsciiString>") OriginalList;
		opencascade::handle<TColStd_HSequenceOfHAsciiString> OriginalList (const Standard_Integer num);

		/****************** OriginalValue ******************/
		%feature("compactdefaultargs") OriginalValue;
		%feature("autodoc", "* From an edited value, returns its ... value (original one) Null means that this value is not defined <num> is for the EditForm, not the Editor It is for a single parameter. For a list, gives a Null Handle
	:param num:
	:type num: int
	:rtype: opencascade::handle<TCollection_HAsciiString>") OriginalValue;
		opencascade::handle<TCollection_HAsciiString> OriginalValue (const Standard_Integer num);

		/****************** PrintDefs ******************/
		%feature("compactdefaultargs") PrintDefs;
		%feature("autodoc", "* Prints Definitions, relative to the Editor
	:param S:
	:type S: Message_Messenger
	:rtype: None") PrintDefs;
		void PrintDefs (const opencascade::handle<Message_Messenger> & S);

		/****************** PrintValues ******************/
		%feature("compactdefaultargs") PrintValues;
		%feature("autodoc", "* Prints Values, according to what and alsolist <names> True : prints Long Names; False : prints Short Names <what> < 0 : prints Original Values (+ flag Modified) <what> > 0 : prints Final Values (+flag Modified) <what> = 0 : prints Modified Values (Original + Edited) <alsolist> False (D) : lists are printed only as their count <alsolist> True : lists are printed for all their items
	:param S:
	:type S: Message_Messenger
	:param what:
	:type what: int
	:param names:
	:type names: bool
	:param alsolist: default value is Standard_False
	:type alsolist: bool
	:rtype: None") PrintValues;
		void PrintValues (const opencascade::handle<Message_Messenger> & S,const Standard_Integer what,const Standard_Boolean names,const Standard_Boolean alsolist = Standard_False);

		/****************** RankFromNumber ******************/
		%feature("compactdefaultargs") RankFromNumber;
		%feature("autodoc", "* Returns the Rank in the EditForm from a given Number of Value for the Editor For a complete EditForm, both are equal Else, it is given by the extraction map Returns 0 if <number> is not forecast to be edited, or is out of range
	:param number:
	:type number: int
	:rtype: int") RankFromNumber;
		Standard_Integer RankFromNumber (const Standard_Integer number);

		/****************** Recognize ******************/
		%feature("compactdefaultargs") Recognize;
		%feature("autodoc", "* Tells if this EditForm can work with its Editor and its actual Data (Entity and Model) Default uses Editor. Can be redefined
	:rtype: bool") Recognize;
		virtual Standard_Boolean Recognize ();

		/****************** SetData ******************/
		%feature("compactdefaultargs") SetData;
		%feature("autodoc", ":param ent:
	:type ent: Standard_Transient
	:param model:
	:type model: Interface_InterfaceModel
	:rtype: None") SetData;
		void SetData (const opencascade::handle<Standard_Transient> & ent,const opencascade::handle<Interface_InterfaceModel> & model);

		/****************** SetEntity ******************/
		%feature("compactdefaultargs") SetEntity;
		%feature("autodoc", ":param ent:
	:type ent: Standard_Transient
	:rtype: None") SetEntity;
		void SetEntity (const opencascade::handle<Standard_Transient> & ent);

		/****************** SetModel ******************/
		%feature("compactdefaultargs") SetModel;
		%feature("autodoc", ":param model:
	:type model: Interface_InterfaceModel
	:rtype: None") SetModel;
		void SetModel (const opencascade::handle<Interface_InterfaceModel> & model);

		/****************** TouchList ******************/
		%feature("compactdefaultargs") TouchList;
		%feature("autodoc", "* Acts as Touch but for a list Does not work (returns False) if <num> is for a single param
	:param num:
	:type num: int
	:param newlist:
	:type newlist: TColStd_HSequenceOfHAsciiString
	:rtype: bool") TouchList;
		Standard_Boolean TouchList (const Standard_Integer num,const opencascade::handle<TColStd_HSequenceOfHAsciiString> & newlist);

		/****************** Undo ******************/
		%feature("compactdefaultargs") Undo;
		%feature("autodoc", "* For an undoable EditForm, Applies ... origibal values ! and clears modified ones Can be run only once
	:rtype: bool") Undo;
		Standard_Boolean Undo ();

};


%make_alias(IFSelect_EditForm)

%extend IFSelect_EditForm {
	%pythoncode {
	__repr__ = _dumps_object
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
		%feature("autodoc", "* Applies modified values of the EditForm with some data Remark: <ent> may be Null, this means all <model> is concerned Also <model> may be Null, if no context applies for <ent> And both <ent> and <model> may be Null, for a full static editor
	:param form:
	:type form: IFSelect_EditForm
	:param ent:
	:type ent: Standard_Transient
	:param model:
	:type model: Interface_InterfaceModel
	:rtype: bool") Apply;
		virtual Standard_Boolean Apply (const opencascade::handle<IFSelect_EditForm> & form,const opencascade::handle<Standard_Transient> & ent,const opencascade::handle<Interface_InterfaceModel> & model);

		/****************** EditMode ******************/
		%feature("compactdefaultargs") EditMode;
		%feature("autodoc", "* Returns the edit mode of a Value
	:param num:
	:type num: int
	:rtype: IFSelect_EditValue") EditMode;
		IFSelect_EditValue EditMode (const Standard_Integer num);

		/****************** Form ******************/
		%feature("compactdefaultargs") Form;
		%feature("autodoc", "* Builds and Returns an EditForm, empty (no data yet) Can be redefined to return a specific type of EditForm
	:param readonly:
	:type readonly: bool
	:param undoable: default value is Standard_True
	:type undoable: bool
	:rtype: opencascade::handle<IFSelect_EditForm>") Form;
		virtual opencascade::handle<IFSelect_EditForm> Form (const Standard_Boolean readonly,const Standard_Boolean undoable = Standard_True);

		/****************** IsList ******************/
		%feature("compactdefaultargs") IsList;
		%feature("autodoc", "* Tells if a parameter is a list
	:param num:
	:type num: int
	:rtype: bool") IsList;
		Standard_Boolean IsList (const Standard_Integer num);

		/****************** Label ******************/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "* Returns the specific label
	:rtype: TCollection_AsciiString") Label;
		virtual TCollection_AsciiString Label ();

		/****************** ListEditor ******************/
		%feature("compactdefaultargs") ListEditor;
		%feature("autodoc", "* Returns a ListEditor for a parameter which is a List Default returns a basic ListEditor for a List, a Null Handle if <num> is not for a List. Can be redefined
	:param num:
	:type num: int
	:rtype: opencascade::handle<IFSelect_ListEditor>") ListEditor;
		virtual opencascade::handle<IFSelect_ListEditor> ListEditor (const Standard_Integer num);

		/****************** ListValue ******************/
		%feature("compactdefaultargs") ListValue;
		%feature("autodoc", "* Returns the value of an EditForm as a List, for a given item If not a list, a Null Handle should be returned Default returns a Null Handle, because many Editors have no list to edit. To be redefined as required
	:param form:
	:type form: IFSelect_EditForm
	:param num:
	:type num: int
	:rtype: opencascade::handle<TColStd_HSequenceOfHAsciiString>") ListValue;
		virtual opencascade::handle<TColStd_HSequenceOfHAsciiString> ListValue (const opencascade::handle<IFSelect_EditForm> & form,const Standard_Integer num);

		/****************** Load ******************/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "* Loads original values from some data, to an EditForm Remark: <ent> may be Null, this means all <model> is concerned Also <model> may be Null, if no context applies for <ent> And both <ent> and <model> may be Null, for a full static editor
	:param form:
	:type form: IFSelect_EditForm
	:param ent:
	:type ent: Standard_Transient
	:param model:
	:type model: Interface_InterfaceModel
	:rtype: bool") Load;
		virtual Standard_Boolean Load (const opencascade::handle<IFSelect_EditForm> & form,const opencascade::handle<Standard_Transient> & ent,const opencascade::handle<Interface_InterfaceModel> & model);

		/****************** MaxList ******************/
		%feature("compactdefaultargs") MaxList;
		%feature("autodoc", "* Returns max length allowed for a list = 0 means : list with no limit < 0 means : not a list
	:param num:
	:type num: int
	:rtype: int") MaxList;
		Standard_Integer MaxList (const Standard_Integer num);

		/****************** MaxNameLength ******************/
		%feature("compactdefaultargs") MaxNameLength;
		%feature("autodoc", "* Returns the MaxLength of, according to what : <what> = -1 : length of short names <what> = 0 : length of complete names <what> = 1 : length of values labels
	:param what:
	:type what: int
	:rtype: int") MaxNameLength;
		Standard_Integer MaxNameLength (const Standard_Integer what);

		/****************** Name ******************/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "* Returns the name of a Value (complete or short) from its ident Short Name can be empty
	:param num:
	:type num: int
	:param isshort: default value is Standard_False
	:type isshort: bool
	:rtype: char *") Name;
		const char * Name (const Standard_Integer num,const Standard_Boolean isshort = Standard_False);

		/****************** NameNumber ******************/
		%feature("compactdefaultargs") NameNumber;
		%feature("autodoc", "* Returns the number (ident) of a Value, from its name, short or complete. If not found, returns 0
	:param name:
	:type name: char *
	:rtype: int") NameNumber;
		Standard_Integer NameNumber (const char * name);

		/****************** NbValues ******************/
		%feature("compactdefaultargs") NbValues;
		%feature("autodoc", "* Returns the count of Typed Values
	:rtype: int") NbValues;
		Standard_Integer NbValues ();

		/****************** PrintDefs ******************/
		%feature("compactdefaultargs") PrintDefs;
		%feature("autodoc", ":param S:
	:type S: Message_Messenger
	:param labels: default value is Standard_False
	:type labels: bool
	:rtype: None") PrintDefs;
		void PrintDefs (const opencascade::handle<Message_Messenger> & S,const Standard_Boolean labels = Standard_False);

		/****************** PrintNames ******************/
		%feature("compactdefaultargs") PrintNames;
		%feature("autodoc", ":param S:
	:type S: Message_Messenger
	:rtype: None") PrintNames;
		void PrintNames (const opencascade::handle<Message_Messenger> & S);

		/****************** Recognize ******************/
		%feature("compactdefaultargs") Recognize;
		%feature("autodoc", "* Tells if this Editor can work on this EditForm and its content (model, entity ?)
	:param form:
	:type form: IFSelect_EditForm
	:rtype: bool") Recognize;
		virtual Standard_Boolean Recognize (const opencascade::handle<IFSelect_EditForm> & form);

		/****************** SetList ******************/
		%feature("compactdefaultargs") SetList;
		%feature("autodoc", "* Sets a parameter to be a List max < 0 : not for a list (set when starting) max = 0 : list with no length limit (default for SetList) max > 0 : list limited to <max> items
	:param num:
	:type num: int
	:param max: default value is 0
	:type max: int
	:rtype: None") SetList;
		void SetList (const Standard_Integer num,const Standard_Integer max = 0);

		/****************** SetValue ******************/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "* Sets a Typed Value for a given ident and short name, with an Edit Mode
	:param num:
	:type num: int
	:param typval:
	:type typval: Interface_TypedValue
	:param shortname: default value is ""
	:type shortname: char *
	:param accessmode: default value is IFSelect_Editable
	:type accessmode: IFSelect_EditValue
	:rtype: None") SetValue;
		void SetValue (const Standard_Integer num,const opencascade::handle<Interface_TypedValue> & typval,const char * shortname = "",const IFSelect_EditValue accessmode = IFSelect_Editable);

		/****************** StringValue ******************/
		%feature("compactdefaultargs") StringValue;
		%feature("autodoc", "* Returns the value of an EditForm, for a given item (if not a list. for a list, a Null String may be returned)
	:param form:
	:type form: IFSelect_EditForm
	:param num:
	:type num: int
	:rtype: opencascade::handle<TCollection_HAsciiString>") StringValue;
		virtual opencascade::handle<TCollection_HAsciiString> StringValue (const opencascade::handle<IFSelect_EditForm> & form,const Standard_Integer num);

		/****************** TypedValue ******************/
		%feature("compactdefaultargs") TypedValue;
		%feature("autodoc", "* Returns a Typed Value from its ident
	:param num:
	:type num: int
	:rtype: opencascade::handle<Interface_TypedValue>") TypedValue;
		opencascade::handle<Interface_TypedValue> TypedValue (const Standard_Integer num);

		/****************** Update ******************/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "* Updates the EditForm when a parameter is modified I.E. default does nothing, can be redefined, as follows : Returns True when done (even if does nothing), False in case of refuse (for instance, if the new value is not suitable) <num> is the rank of the parameter for the EDITOR itself <enforce> True means that protected parameters can be touched //! If a parameter commands the value of other ones, when it is modified, it is necessary to touch them by Touch from EditForm
	:param form:
	:type form: IFSelect_EditForm
	:param num:
	:type num: int
	:param newval:
	:type newval: TCollection_HAsciiString
	:param enforce:
	:type enforce: bool
	:rtype: bool") Update;
		virtual Standard_Boolean Update (const opencascade::handle<IFSelect_EditForm> & form,const Standard_Integer num,const opencascade::handle<TCollection_HAsciiString> & newval,const Standard_Boolean enforce);

		/****************** UpdateList ******************/
		%feature("compactdefaultargs") UpdateList;
		%feature("autodoc", "* Acts as Update, but when the value is a list
	:param form:
	:type form: IFSelect_EditForm
	:param num:
	:type num: int
	:param newlist:
	:type newlist: TColStd_HSequenceOfHAsciiString
	:param enforce:
	:type enforce: bool
	:rtype: bool") UpdateList;
		virtual Standard_Boolean UpdateList (const opencascade::handle<IFSelect_EditForm> & form,const Standard_Integer num,const opencascade::handle<TColStd_HSequenceOfHAsciiString> & newlist,const Standard_Boolean enforce);

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
		%feature("autodoc", "* Evaluates and returns a Dispatch, from data of a WorkSession if <mode> is False, searches for exact name of Dispatch in WS Else (D), allows a parameter between brackets : ex.: dispatch_name(parameter) The parameter can be: an integer for DispPerCount or DispPerFiles or the name of a Signature for DispPerSignature Returns Null Handle if not found not well evaluated
	:param WS:
	:type WS: IFSelect_WorkSession
	:param name:
	:type name: char *
	:param mode: default value is Standard_True
	:type mode: bool
	:rtype: opencascade::handle<IFSelect_Dispatch>") GiveDispatch;
		static opencascade::handle<IFSelect_Dispatch> GiveDispatch (const opencascade::handle<IFSelect_WorkSession> & WS,const char * name,const Standard_Boolean mode = Standard_True);

		/****************** GiveEntity ******************/
		%feature("compactdefaultargs") GiveEntity;
		%feature("autodoc", "* Takes the name of an entity, either as argument, or (if <name> is empty) on keybord, and returns the entity name can be a label or a number (in alphanumeric), it is searched by NumberFromLabel from WorkSession. If <name> doesn't match en entity, a Null Handle is returned
	:param WS:
	:type WS: IFSelect_WorkSession
	:param name: default value is ""
	:type name: char *
	:rtype: opencascade::handle<Standard_Transient>") GiveEntity;
		static opencascade::handle<Standard_Transient> GiveEntity (const opencascade::handle<IFSelect_WorkSession> & WS,const char * name = "");

		/****************** GiveEntityNumber ******************/
		%feature("compactdefaultargs") GiveEntityNumber;
		%feature("autodoc", "* Same as GetEntity, but returns the number in the model of the entity. Returns 0 for null handle
	:param WS:
	:type WS: IFSelect_WorkSession
	:param name: default value is ""
	:type name: char *
	:rtype: int") GiveEntityNumber;
		static Standard_Integer GiveEntityNumber (const opencascade::handle<IFSelect_WorkSession> & WS,const char * name = "");

		/****************** GiveList ******************/
		%feature("compactdefaultargs") GiveList;
		%feature("autodoc", "* Computes a List of entities from a WorkSession and two idents, first and second, as follows : if <first> is a Number or Label of an entity : this entity if <first> is the name of a Selection in <WS>, and <second> not defined, the standard result of this Selection if <first> is for a Selection and <second> is defined, the standard result of this selection from the list computed with <second> (an entity or a selection) If <second> is erroneous, it is ignored
	:param WS:
	:type WS: IFSelect_WorkSession
	:param first: default value is ""
	:type first: char *
	:param second: default value is ""
	:type second: char *
	:rtype: opencascade::handle<TColStd_HSequenceOfTransient>") GiveList;
		static opencascade::handle<TColStd_HSequenceOfTransient> GiveList (const opencascade::handle<IFSelect_WorkSession> & WS,const char * first = "",const char * second = "");

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Defines and loads all basic functions (as ActFunc)
	:rtype: void") Init;
		static void Init ();

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
		%feature("autodoc", "* Returns True if a Model obtained from the Dispatch <disp> is to be treated (apart from the Selection criterium) If Dispatch(me) is Null, returns True. Else, checks <disp>
	:param disp:
	:type disp: IFSelect_Dispatch
	:rtype: bool") Applies;
		Standard_Boolean Applies (const opencascade::handle<IFSelect_Dispatch> & disp);

		/****************** Dispatch ******************/
		%feature("compactdefaultargs") Dispatch;
		%feature("autodoc", "* Returns the Dispatch to be matched, Null if not set
	:rtype: opencascade::handle<IFSelect_Dispatch>") Dispatch;
		opencascade::handle<IFSelect_Dispatch> Dispatch ();

		/****************** HasSelection ******************/
		%feature("compactdefaultargs") HasSelection;
		%feature("autodoc", "* Returns True if a Selection is set as an additionnal criterium
	:rtype: bool") HasSelection;
		Standard_Boolean HasSelection ();

		/****************** Label ******************/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "* Returns a short text which defines the operation performed
	:rtype: TCollection_AsciiString") Label;
		virtual TCollection_AsciiString Label ();

		/****************** MayChangeGraph ******************/
		%feature("compactdefaultargs") MayChangeGraph;
		%feature("autodoc", "* Returns True if this modifier may change the graph of dependences (aknowledged at creation time)
	:rtype: bool") MayChangeGraph;
		Standard_Boolean MayChangeGraph ();

		/****************** ResetSelection ******************/
		%feature("compactdefaultargs") ResetSelection;
		%feature("autodoc", "* Resets the Selection : this criterium is not longer active
	:rtype: None") ResetSelection;
		void ResetSelection ();

		/****************** Selection ******************/
		%feature("compactdefaultargs") Selection;
		%feature("autodoc", "* Returns the Selection, or a Null Handle if not set
	:rtype: opencascade::handle<IFSelect_Selection>") Selection;
		opencascade::handle<IFSelect_Selection> Selection ();

		/****************** SetDispatch ******************/
		%feature("compactdefaultargs") SetDispatch;
		%feature("autodoc", "* Attaches to a Dispatch. If <disp> is Null, Resets it (to apply the Modifier on every Dispatch)
	:param disp:
	:type disp: IFSelect_Dispatch
	:rtype: None") SetDispatch;
		void SetDispatch (const opencascade::handle<IFSelect_Dispatch> & disp);

		/****************** SetSelection ******************/
		%feature("compactdefaultargs") SetSelection;
		%feature("autodoc", "* Sets a Selection : a Model is treated if it contains one or more Entities designated by the Selection
	:param sel:
	:type sel: IFSelect_Selection
	:rtype: None") SetSelection;
		void SetSelection (const opencascade::handle<IFSelect_Selection> & sel);

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
		%feature("autodoc", "* Creates an IntParam. Initial value is set to zer
	:rtype: None") IFSelect_IntParam;
		 IFSelect_IntParam ();

		/****************** SetStaticName ******************/
		%feature("compactdefaultargs") SetStaticName;
		%feature("autodoc", "* Commands this IntParam to be bound to a Static Hence, Value will return the value if this Static if it is set Else, Value works on the locally stored value SetValue also will set the value of the Static This works only for a present static of type integer or enum Else, it is ignored //! If <statname> is empty, disconnects the IntParam from Static
	:param statname:
	:type statname: char *
	:rtype: None") SetStaticName;
		void SetStaticName (const char * statname);

		/****************** SetValue ******************/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "* Sets a new Integer Value for the IntParam. If a StaticName is defined and the Static is set, also sets the value of the static
	:param val:
	:type val: int
	:rtype: None") SetValue;
		void SetValue (const Standard_Integer val);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* Reads Integer Value of the IntParam. If a StaticName is defined and the Static is set, looks in priority the value of the static
	:rtype: int") Value;
		Standard_Integer Value ();

};


%make_alias(IFSelect_IntParam)

%extend IFSelect_IntParam {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class IFSelect_ListEditor *
****************************/
class IFSelect_ListEditor : public Standard_Transient {
	public:
		/****************** AddValue ******************/
		%feature("compactdefaultargs") AddValue;
		%feature("autodoc", "* Adds a new item. By default appends (at the end of the list) Can insert before a given rank <num>, if positive Returns True when done. False if MaxLength may be overpassed or if <val> does not satisfy the definition
	:param val:
	:type val: TCollection_HAsciiString
	:param atnum: default value is 0
	:type atnum: int
	:rtype: bool") AddValue;
		virtual Standard_Boolean AddValue (const opencascade::handle<TCollection_HAsciiString> & val,const Standard_Integer atnum = 0);

		/****************** ClearEdit ******************/
		%feature("compactdefaultargs") ClearEdit;
		%feature("autodoc", "* Clears all editions already recorded
	:rtype: None") ClearEdit;
		void ClearEdit ();

		/****************** EditedValues ******************/
		%feature("compactdefaultargs") EditedValues;
		%feature("autodoc", "* Returns the result of the edition
	:rtype: opencascade::handle<TColStd_HSequenceOfHAsciiString>") EditedValues;
		opencascade::handle<TColStd_HSequenceOfHAsciiString> EditedValues ();

		/****************** IFSelect_ListEditor ******************/
		%feature("compactdefaultargs") IFSelect_ListEditor;
		%feature("autodoc", "* Creates a ListEditor with absolutely no constraint
	:rtype: None") IFSelect_ListEditor;
		 IFSelect_ListEditor ();

		/****************** IFSelect_ListEditor ******************/
		%feature("compactdefaultargs") IFSelect_ListEditor;
		%feature("autodoc", "* Creates a ListEditor, for which items of the list to edit are defined by <def>, and <max> describes max length : 0 (D) means no limit value > 0 means : no more the <max> items are allowed
	:param def:
	:type def: Interface_TypedValue
	:param max: default value is 0
	:type max: int
	:rtype: None") IFSelect_ListEditor;
		 IFSelect_ListEditor (const opencascade::handle<Interface_TypedValue> & def,const Standard_Integer max = 0);

		/****************** IsAdded ******************/
		%feature("compactdefaultargs") IsAdded;
		%feature("autodoc", "* Tells if a value (in edited list) has been added (new one)
	:param num:
	:type num: int
	:rtype: bool") IsAdded;
		Standard_Boolean IsAdded (const Standard_Integer num);

		/****************** IsChanged ******************/
		%feature("compactdefaultargs") IsChanged;
		%feature("autodoc", "* Tells if a value (in edited list) has been changed, i.e. either modified-value, or added
	:param num:
	:type num: int
	:rtype: bool") IsChanged;
		Standard_Boolean IsChanged (const Standard_Integer num);

		/****************** IsModified ******************/
		%feature("compactdefaultargs") IsModified;
		%feature("autodoc", "* Tells if a value (in edited list) has been modified-value (not added)
	:param num:
	:type num: int
	:rtype: bool") IsModified;
		Standard_Boolean IsModified (const Standard_Integer num);

		/****************** IsTouched ******************/
		%feature("compactdefaultargs") IsTouched;
		%feature("autodoc", "* Tells if at least one edition (SetValue-AddValue-Remove) has been recorded
	:rtype: bool") IsTouched;
		Standard_Boolean IsTouched ();

		/****************** LoadEdited ******************/
		%feature("compactdefaultargs") LoadEdited;
		%feature("autodoc", "* Loads a new list to replace the older one, in once ! By default (can be redefined) checks the length of the list and the value of each item according to the def Items are all recorded as Modified //! If no def has been given at creation time, no check is done Returns True when done, False if checks have failed ... a specialisation may also lock it by returning always False ...
	:param list:
	:type list: TColStd_HSequenceOfHAsciiString
	:rtype: bool") LoadEdited;
		virtual Standard_Boolean LoadEdited (const opencascade::handle<TColStd_HSequenceOfHAsciiString> & list);

		/****************** LoadModel ******************/
		%feature("compactdefaultargs") LoadModel;
		%feature("autodoc", "* Loads a Model. It is used to check items of type Entity(Ident)
	:param model:
	:type model: Interface_InterfaceModel
	:rtype: None") LoadModel;
		void LoadModel (const opencascade::handle<Interface_InterfaceModel> & model);

		/****************** LoadValues ******************/
		%feature("compactdefaultargs") LoadValues;
		%feature("autodoc", "* Loads the original values for the list Remark : If its length is mor then MaxLength, editions remain allowed, except Add
	:param vals:
	:type vals: TColStd_HSequenceOfHAsciiString
	:rtype: None") LoadValues;
		void LoadValues (const opencascade::handle<TColStd_HSequenceOfHAsciiString> & vals);

		/****************** NbValues ******************/
		%feature("compactdefaultargs") NbValues;
		%feature("autodoc", "* Returns count of values, edited (D) or original
	:param edited: default value is Standard_True
	:type edited: bool
	:rtype: int") NbValues;
		Standard_Integer NbValues (const Standard_Boolean edited = Standard_True);

		/****************** OriginalValues ******************/
		%feature("compactdefaultargs") OriginalValues;
		%feature("autodoc", "* Returns the value from which the edition started
	:rtype: opencascade::handle<TColStd_HSequenceOfHAsciiString>") OriginalValues;
		opencascade::handle<TColStd_HSequenceOfHAsciiString> OriginalValues ();

		/****************** Remove ******************/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "* Removes items from the list By default removes one item. Else, count given by <howmany> Remove from rank <num> included. By default, from the end Returns True when done, False (and does not work) if case of out of range of if <howmany> is greater than current length
	:param num: default value is 0
	:type num: int
	:param howmany: default value is 1
	:type howmany: int
	:rtype: bool") Remove;
		virtual Standard_Boolean Remove (const Standard_Integer num = 0,const Standard_Integer howmany = 1);

		/****************** SetTouched ******************/
		%feature("compactdefaultargs") SetTouched;
		%feature("autodoc", "* Declares this ListEditor to have been touched (whatever action)
	:rtype: None") SetTouched;
		void SetTouched ();

		/****************** SetValue ******************/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "* Sets a new value for the item <num> (in edited list) <val> may be a Null Handle, then the value will be cleared but not removed Returns True when done. False if <num> is out of range or if <val> does not satisfy the definition
	:param num:
	:type num: int
	:param val:
	:type val: TCollection_HAsciiString
	:rtype: bool") SetValue;
		virtual Standard_Boolean SetValue (const Standard_Integer num,const opencascade::handle<TCollection_HAsciiString> & val);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* Returns a value given its rank. Edited (D) or Original A Null String means the value is cleared but not removed
	:param num:
	:type num: int
	:param edited: default value is Standard_True
	:type edited: bool
	:rtype: opencascade::handle<TCollection_HAsciiString>") Value;
		opencascade::handle<TCollection_HAsciiString> Value (const Standard_Integer num,const Standard_Boolean edited = Standard_True);

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
		/****************** AddFile ******************/
		%feature("compactdefaultargs") AddFile;
		%feature("autodoc", "* Records a new File to be sent, as a couple (Name as AsciiString, Content as InterfaceModel) Returns True if Done, False if <filename> is already attached to another File
	:param filename:
	:type filename: TCollection_AsciiString
	:param content:
	:type content: Interface_InterfaceModel
	:rtype: bool") AddFile;
		Standard_Boolean AddFile (const TCollection_AsciiString & filename,const opencascade::handle<Interface_InterfaceModel> & content);

		/****************** AddSentFile ******************/
		%feature("compactdefaultargs") AddSentFile;
		%feature("autodoc", "* Adds the name of a just sent file, if BeginSentFiles has commanded recording; else does nothing It is called by methods SendCopied Sending
	:param filename:
	:type filename: char *
	:rtype: None") AddSentFile;
		void AddSentFile (const char * filename);

		/****************** AppliedModifiers ******************/
		%feature("compactdefaultargs") AppliedModifiers;
		%feature("autodoc", "* Returns the list of File Modifiers to be applied on a file when it will be sent, as computed by CopiedModel : If it is a null handle, no File Modifier has to be applied.
	:param num:
	:type num: int
	:rtype: opencascade::handle<IFSelect_AppliedModifiers>") AppliedModifiers;
		opencascade::handle<IFSelect_AppliedModifiers> AppliedModifiers (const Standard_Integer num);

		/****************** BeginSentFiles ******************/
		%feature("compactdefaultargs") BeginSentFiles;
		%feature("autodoc", "* Begins a sequence of recording the really sent files <sho> : the default file numbering is cleared If <record> is False, clears the list and stops recording If <record> is True, clears the list and commands recording Creation time corresponds to 'stop recording'
	:param sho:
	:type sho: IFSelect_ShareOut
	:param record:
	:type record: bool
	:rtype: None") BeginSentFiles;
		void BeginSentFiles (const opencascade::handle<IFSelect_ShareOut> & sho,const Standard_Boolean record);

		/****************** ClearAppliedModifiers ******************/
		%feature("compactdefaultargs") ClearAppliedModifiers;
		%feature("autodoc", "* Clears the list of File Modifiers to be applied on a file
	:param num:
	:type num: int
	:rtype: bool") ClearAppliedModifiers;
		Standard_Boolean ClearAppliedModifiers (const Standard_Integer num);

		/****************** ClearFile ******************/
		%feature("compactdefaultargs") ClearFile;
		%feature("autodoc", "* Clears the Name attached to a File which was formerly defined by a call to AddFile. This Clearing can be undone by a call to NameFile (with same <num>) Returns True if Done, False else : if <num> is out of range
	:param num:
	:type num: int
	:rtype: bool") ClearFile;
		Standard_Boolean ClearFile (const Standard_Integer num);

		/****************** ClearResult ******************/
		%feature("compactdefaultargs") ClearResult;
		%feature("autodoc", "* Clears the list of produced Models
	:rtype: None") ClearResult;
		void ClearResult ();

		/****************** CopiedRemaining ******************/
		%feature("compactdefaultargs") CopiedRemaining;
		%feature("autodoc", "* Produces a Model copied from the Remaining List as <newmod> <newmod> is a Null Handle if this list is empty <WL> performs the copy by using <TC> <TC> is assumed to have been defined with the starting model same as defined by <G>.
	:param G:
	:type G: Interface_Graph
	:param WL:
	:type WL: IFSelect_WorkLibrary
	:param TC:
	:type TC: Interface_CopyTool
	:param newmod:
	:type newmod: Interface_InterfaceModel
	:rtype: None") CopiedRemaining;
		void CopiedRemaining (const Interface_Graph & G,const opencascade::handle<IFSelect_WorkLibrary> & WL,Interface_CopyTool & TC,opencascade::handle<Interface_InterfaceModel> & newmod);

		/****************** Copy ******************/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "* Performs the Copy Operations, which include the Modifications defined by the list of Modifiers. Memorizes the result, as a list of InterfaceModels with the corresponding FileNames They can then be sent, by the method Send, or queried Copy calls internal method Copying. Returns the produced CheckList
	:param eval:
	:type eval: IFSelect_ShareOutResult
	:param WL:
	:type WL: IFSelect_WorkLibrary
	:param protocol:
	:type protocol: Interface_Protocol
	:rtype: Interface_CheckIterator") Copy;
		Interface_CheckIterator Copy (IFSelect_ShareOutResult & eval,const opencascade::handle<IFSelect_WorkLibrary> & WL,const opencascade::handle<Interface_Protocol> & protocol);

		/****************** FileModel ******************/
		%feature("compactdefaultargs") FileModel;
		%feature("autodoc", "* Returns the content of a file before sending, under the form of an InterfaceModel, given its rank
	:param num:
	:type num: int
	:rtype: opencascade::handle<Interface_InterfaceModel>") FileModel;
		opencascade::handle<Interface_InterfaceModel> FileModel (const Standard_Integer num);

		/****************** FileName ******************/
		%feature("compactdefaultargs") FileName;
		%feature("autodoc", "* Returns the File Name for a file given its rank It is empty after a call to ClearFile on same <num>
	:param num:
	:type num: int
	:rtype: TCollection_AsciiString") FileName;
		TCollection_AsciiString FileName (const Standard_Integer num);

		/****************** IFSelect_ModelCopier ******************/
		%feature("compactdefaultargs") IFSelect_ModelCopier;
		%feature("autodoc", "* Creates an empty ModelCopier
	:rtype: None") IFSelect_ModelCopier;
		 IFSelect_ModelCopier ();

		/****************** NameFile ******************/
		%feature("compactdefaultargs") NameFile;
		%feature("autodoc", "* Changes the Name attached to a File which was formerly defined by a call to AddFile Returns True if Done, False else : if <num> out of range or if the new <filename> is already attached to another File Remark : Giving an empty File Name is equivalent to ClearFile
	:param num:
	:type num: int
	:param filename:
	:type filename: TCollection_AsciiString
	:rtype: bool") NameFile;
		Standard_Boolean NameFile (const Standard_Integer num,const TCollection_AsciiString & filename);

		/****************** NbFiles ******************/
		%feature("compactdefaultargs") NbFiles;
		%feature("autodoc", "* Returns the count of Files produced, i.e. the count of Models memorized (produced by the mmethod Copy) with their file names
	:rtype: int") NbFiles;
		Standard_Integer NbFiles ();

		/****************** Send ******************/
		%feature("compactdefaultargs") Send;
		%feature("autodoc", "* Performs the Copy Operations (which include the Modifications) and Sends the result on files, without memorizing it. (the memorized result is ignored : neither queried not filled)
	:param eval:
	:type eval: IFSelect_ShareOutResult
	:param WL:
	:type WL: IFSelect_WorkLibrary
	:param protocol:
	:type protocol: Interface_Protocol
	:rtype: Interface_CheckIterator") Send;
		Interface_CheckIterator Send (IFSelect_ShareOutResult & eval,const opencascade::handle<IFSelect_WorkLibrary> & WL,const opencascade::handle<Interface_Protocol> & protocol);

		/****************** SendAll ******************/
		%feature("compactdefaultargs") SendAll;
		%feature("autodoc", "* Sends a model (defined in <G>) into one file, without managing remaining data, already sent files, etc. Applies the Model and File Modifiers. Returns True if well done, False else
	:param filename:
	:type filename: char *
	:param G:
	:type G: Interface_Graph
	:param WL:
	:type WL: IFSelect_WorkLibrary
	:param protocol:
	:type protocol: Interface_Protocol
	:rtype: Interface_CheckIterator") SendAll;
		Interface_CheckIterator SendAll (const char * filename,const Interface_Graph & G,const opencascade::handle<IFSelect_WorkLibrary> & WL,const opencascade::handle<Interface_Protocol> & protocol);

		/****************** SendCopied ******************/
		%feature("compactdefaultargs") SendCopied;
		%feature("autodoc", "* Sends the formerly defined results (see method Copy) to files, then clears it Remark : A Null File Name cause file to be not produced
	:param WL:
	:type WL: IFSelect_WorkLibrary
	:param protocol:
	:type protocol: Interface_Protocol
	:rtype: Interface_CheckIterator") SendCopied;
		Interface_CheckIterator SendCopied (const opencascade::handle<IFSelect_WorkLibrary> & WL,const opencascade::handle<Interface_Protocol> & protocol);

		/****************** SendSelected ******************/
		%feature("compactdefaultargs") SendSelected;
		%feature("autodoc", "* Sends a part of a model into one file. Model is gotten from <G>, the part is defined in <iter>. Remaining data are managed and can be later be worked on. Returns True if well done, False else
	:param filename:
	:type filename: char *
	:param G:
	:type G: Interface_Graph
	:param WL:
	:type WL: IFSelect_WorkLibrary
	:param protocol:
	:type protocol: Interface_Protocol
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: Interface_CheckIterator") SendSelected;
		Interface_CheckIterator SendSelected (const char * filename,const Interface_Graph & G,const opencascade::handle<IFSelect_WorkLibrary> & WL,const opencascade::handle<Interface_Protocol> & protocol,const Interface_EntityIterator & iter);

		/****************** SentFiles ******************/
		%feature("compactdefaultargs") SentFiles;
		%feature("autodoc", "* Returns the list of recorded names of sent files. Can be empty (if no file has been sent). Returns a Null Handle if BeginSentFiles has stopped recording.
	:rtype: opencascade::handle<TColStd_HSequenceOfHAsciiString>") SentFiles;
		opencascade::handle<TColStd_HSequenceOfHAsciiString> SentFiles ();

		/****************** SetAppliedModifiers ******************/
		%feature("compactdefaultargs") SetAppliedModifiers;
		%feature("autodoc", "* Sets a list of File Modifiers to be applied on a file
	:param num:
	:type num: int
	:param applied:
	:type applied: IFSelect_AppliedModifiers
	:rtype: bool") SetAppliedModifiers;
		Standard_Boolean SetAppliedModifiers (const Standard_Integer num,const opencascade::handle<IFSelect_AppliedModifiers> & applied);

		/****************** SetRemaining ******************/
		%feature("compactdefaultargs") SetRemaining;
		%feature("autodoc", "* Updates Graph status for remaining data, for each entity : - Entities just Sent to file or Copied (by CopiedRemaining) have their status set to 1 - the other keep their former status (1 for Send/Copied, 0 for Remaining) These status are computed by Copying/Sending/CopiedRemaining Then, SetRemaining updates graph status, and mustr be called just after one of these method has been called Returns True if done, False if remaining info if not in phase which the Graph (not same counts of items)
	:param CG:
	:type CG: Interface_Graph
	:rtype: bool") SetRemaining;
		Standard_Boolean SetRemaining (Interface_Graph & CG);

		/****************** SetShareOut ******************/
		%feature("compactdefaultargs") SetShareOut;
		%feature("autodoc", "* Sets the ShareOut, which is used to define Modifiers to apply
	:param sho:
	:type sho: IFSelect_ShareOut
	:rtype: None") SetShareOut;
		void SetShareOut (const opencascade::handle<IFSelect_ShareOut> & sho);

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
		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "* Adds an entity from the Model into the current packet for Add
	:param ent:
	:type ent: Standard_Transient
	:rtype: None") Add;
		void Add (const opencascade::handle<Standard_Transient> & ent);

		/****************** AddList ******************/
		%feature("compactdefaultargs") AddList;
		%feature("autodoc", "* Adds an list of entities into the current packet for Add
	:param list:
	:type list: TColStd_HSequenceOfTransient
	:rtype: None") AddList;
		void AddList (const opencascade::handle<TColStd_HSequenceOfTransient> & list);

		/****************** AddPacket ******************/
		%feature("compactdefaultargs") AddPacket;
		%feature("autodoc", "* Declares a new Packet, ready to be filled The entities to be added will be added to this Packet
	:rtype: None") AddPacket;
		void AddPacket ();

		/****************** Duplicated ******************/
		%feature("compactdefaultargs") Duplicated;
		%feature("autodoc", "* Returns a list of entities duplicated : <count> times, if <andmore> is False, or <count> or more times, if <andmore> is True Hence, count=2 & andmore=True gives all duplicated entities count=1 gives non-duplicated entities (in only one packet) count=0 gives remaining entities (in no packet at all)
	:param count:
	:type count: int
	:param andmore:
	:type andmore: bool
	:rtype: Interface_EntityIterator") Duplicated;
		Interface_EntityIterator Duplicated (const Standard_Integer count,const Standard_Boolean andmore);

		/****************** Entities ******************/
		%feature("compactdefaultargs") Entities;
		%feature("autodoc", "* Returns the content of a Packet given its rank Null Handle if <numpack> is out of range
	:param numpack:
	:type numpack: int
	:rtype: Interface_EntityIterator") Entities;
		Interface_EntityIterator Entities (const Standard_Integer numpack);

		/****************** HighestDuplicationCount ******************/
		%feature("compactdefaultargs") HighestDuplicationCount;
		%feature("autodoc", "* Returns the highest number of packets which know a same entity For no duplication, should be one
	:rtype: int") HighestDuplicationCount;
		Standard_Integer HighestDuplicationCount ();

		/****************** IFSelect_PacketList ******************/
		%feature("compactdefaultargs") IFSelect_PacketList;
		%feature("autodoc", "* Creates a PackList, empty, ready to receive entities from a given Model
	:param model:
	:type model: Interface_InterfaceModel
	:rtype: None") IFSelect_PacketList;
		 IFSelect_PacketList (const opencascade::handle<Interface_InterfaceModel> & model);

		/****************** Model ******************/
		%feature("compactdefaultargs") Model;
		%feature("autodoc", "* Returns the Model of reference
	:rtype: opencascade::handle<Interface_InterfaceModel>") Model;
		opencascade::handle<Interface_InterfaceModel> Model ();

		/****************** Name ******************/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "* Returns the recorded name for a packet list
	:rtype: char *") Name;
		const char * Name ();

		/****************** NbDuplicated ******************/
		%feature("compactdefaultargs") NbDuplicated;
		%feature("autodoc", "* Returns the count of entities duplicated : <count> times, if <andmore> is False, or <count> or more times, if <andmore> is True See Duplicated for more details
	:param count:
	:type count: int
	:param andmore:
	:type andmore: bool
	:rtype: int") NbDuplicated;
		Standard_Integer NbDuplicated (const Standard_Integer count,const Standard_Boolean andmore);

		/****************** NbEntities ******************/
		%feature("compactdefaultargs") NbEntities;
		%feature("autodoc", "* Returns the count of entities in a Packet given its rank, or 0
	:param numpack:
	:type numpack: int
	:rtype: int") NbEntities;
		Standard_Integer NbEntities (const Standard_Integer numpack);

		/****************** NbPackets ******************/
		%feature("compactdefaultargs") NbPackets;
		%feature("autodoc", "* Returns the count of non-empty packets
	:rtype: int") NbPackets;
		Standard_Integer NbPackets ();

		/****************** SetName ******************/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "* Sets a name to a packet list : this makes easier a general routine to print it. Default is 'Packets'
	:param name:
	:type name: char *
	:rtype: None") SetName;
		void SetName (const char * name);

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
		%feature("autodoc", "* Returns the list of entities involved by a Selection, i.e. UniqueResult plus the shared entities (directly or not)
	:param G:
	:type G: Interface_Graph
	:rtype: Interface_EntityIterator") CompleteResult;
		virtual Interface_EntityIterator CompleteResult (const Interface_Graph & G);

		/****************** FillIterator ******************/
		%feature("compactdefaultargs") FillIterator;
		%feature("autodoc", "* Puts in an Iterator the Selections from which 'me' depends (there can be zero, or one, or a list). Specific to each class of Selection
	:param iter:
	:type iter: IFSelect_SelectionIterator
	:rtype: void") FillIterator;
		virtual void FillIterator (IFSelect_SelectionIterator & iter);

		/****************** Label ******************/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "* Returns a text which defines the criterium applied by a Selection (can be used to be printed, displayed ...) Specific to each class
	:rtype: TCollection_AsciiString") Label;
		virtual TCollection_AsciiString Label ();

		/****************** RootResult ******************/
		%feature("compactdefaultargs") RootResult;
		%feature("autodoc", "* Returns the list of selected entities, computed from Input given as a Graph. Specific to each class of Selection Note that uniqueness of each entity is not required here This method can raise an exception as necessary
	:param G:
	:type G: Interface_Graph
	:rtype: Interface_EntityIterator") RootResult;
		virtual Interface_EntityIterator RootResult (const Interface_Graph & G);

		/****************** UniqueResult ******************/
		%feature("compactdefaultargs") UniqueResult;
		%feature("autodoc", "* Returns the list of selected entities, each of them beeing unique. Default definition works from RootResult. According HasUniqueResult, UniqueResult returns directly RootResult, or build a Unique Result from it with a Graph.
	:param G:
	:type G: Interface_Graph
	:rtype: Interface_EntityIterator") UniqueResult;
		Interface_EntityIterator UniqueResult (const Interface_Graph & G);

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
		/****************** AddFromIter ******************/
		%feature("compactdefaultargs") AddFromIter;
		%feature("autodoc", "* Adds to an iterator the content of another one (each selection is present only once in the result)
	:param iter:
	:type iter: IFSelect_SelectionIterator
	:rtype: None") AddFromIter;
		void AddFromIter (IFSelect_SelectionIterator & iter);

		/****************** AddItem ******************/
		%feature("compactdefaultargs") AddItem;
		%feature("autodoc", "* Adds a Selection to an iterator (if not yet noted)
	:param sel:
	:type sel: IFSelect_Selection
	:rtype: None") AddItem;
		void AddItem (const opencascade::handle<IFSelect_Selection> & sel);

		/****************** AddList ******************/
		%feature("compactdefaultargs") AddList;
		%feature("autodoc", "* Adds a list of Selections to an iterator (this list comes from the description of a Selection or a Dispatch, etc...)
	:param list:
	:type list: IFSelect_TSeqOfSelection
	:rtype: None") AddList;
		void AddList (const IFSelect_TSeqOfSelection & list);

		/****************** IFSelect_SelectionIterator ******************/
		%feature("compactdefaultargs") IFSelect_SelectionIterator;
		%feature("autodoc", "* Creates an empty iterator, ready to be filled
	:rtype: None") IFSelect_SelectionIterator;
		 IFSelect_SelectionIterator ();

		/****************** IFSelect_SelectionIterator ******************/
		%feature("compactdefaultargs") IFSelect_SelectionIterator;
		%feature("autodoc", "* Creates an iterator from a Selection : it lists the Selections from which <sel> depends (given by its method FillIterator)
	:param sel:
	:type sel: IFSelect_Selection
	:rtype: None") IFSelect_SelectionIterator;
		 IFSelect_SelectionIterator (const opencascade::handle<IFSelect_Selection> & sel);

		/****************** More ******************/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "* Returns True if there are more Selections to get
	:rtype: bool") More;
		Standard_Boolean More ();

		/****************** Next ******************/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "* Sets iterator to the next item
	:rtype: None") Next;
		void Next ();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* Returns the current Selction beeing iterated Error if count of Selection has been passed
	:rtype: opencascade::handle<IFSelect_Selection>") Value;
		const opencascade::handle<IFSelect_Selection> & Value ();

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
		%feature("autodoc", "* Returns the First item of the Library of Dumper. The Next ones are then obtained by Next on the returned items
	:rtype: opencascade::handle<IFSelect_SessionDumper>") First;
		static opencascade::handle<IFSelect_SessionDumper> First ();

		/****************** Next ******************/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "* Returns the Next SesionDumper in the Library. Returns a Null Handle at the End.
	:rtype: opencascade::handle<IFSelect_SessionDumper>") Next;
		opencascade::handle<IFSelect_SessionDumper> Next ();

		/****************** ReadOwn ******************/
		%feature("compactdefaultargs") ReadOwn;
		%feature("autodoc", "* Recognizes a Type (given as <type>) then Creates an Item of this Type with the Own Parameter, as required. Returns True if it has recognized the Type (in this case, it is assumed to have created the Item, returned as <item>), False else : in that case, SessionFile will try another SessionDumper in the Library. ReadOwn can use these methods from SessionFile to access Own Parameters : NbOwnParams, IsVoid, IsText, TextValue, ItemValue
	:param file:
	:type file: IFSelect_SessionFile
	:param type:
	:type type: TCollection_AsciiString
	:param item:
	:type item: Standard_Transient
	:rtype: bool") ReadOwn;
		virtual Standard_Boolean ReadOwn (IFSelect_SessionFile & file,const TCollection_AsciiString & type,opencascade::handle<Standard_Transient> & item);

		/****************** WriteOwn ******************/
		%feature("compactdefaultargs") WriteOwn;
		%feature("autodoc", "* Writes the Own Parameters of a given Item, if it forecast to manage its Type. Returns True if it has recognized the Type of the Item (in this case, it is assumed to have written the Own Parameters if there are some), False else : in that case, SessionFile will try another SessionDumper in the Library. WriteOwn can use these methods from SessionFile : SendVoid, SendItem, SendText, and if necessary, WorkSession.
	:param file:
	:type file: IFSelect_SessionFile
	:param item:
	:type item: Standard_Transient
	:rtype: bool") WriteOwn;
		virtual Standard_Boolean WriteOwn (IFSelect_SessionFile & file,const opencascade::handle<Standard_Transient> & item);

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
		/****************** AddItem ******************/
		%feature("compactdefaultargs") AddItem;
		%feature("autodoc", "* Adds an Item to the WorkSession, taken as Name the first item of the read Line. If this Name is not a Name but a Number or if this Name is already recorded in the WorkSession, it adds the Item but with no Name. Then the Name is recorded in order to be used by the method ItemValue <active> commands to make <item> active or not in the session
	:param item:
	:type item: Standard_Transient
	:param active: default value is Standard_True
	:type active: bool
	:rtype: None") AddItem;
		void AddItem (const opencascade::handle<Standard_Transient> & item,const Standard_Boolean active = Standard_True);

		/****************** AddLine ******************/
		%feature("compactdefaultargs") AddLine;
		%feature("autodoc", "* Adds a line to the list of recorded lines
	:param line:
	:type line: char *
	:rtype: None") AddLine;
		void AddLine (const char * line);

		/****************** ClearLines ******************/
		%feature("compactdefaultargs") ClearLines;
		%feature("autodoc", "* Clears the lines recorded whatever for writing or for reading
	:rtype: None") ClearLines;
		void ClearLines ();

		/****************** Destroy ******************/
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "* Specific Destructor (closes the File if not yet done)
	:rtype: None") Destroy;
		void Destroy ();

		/****************** IFSelect_SessionFile ******************/
		%feature("compactdefaultargs") IFSelect_SessionFile;
		%feature("autodoc", "* Creates a SessionFile, ready to read Files in order to load them into a given WorkSession. The following Read Operations must then be called. It is also possible to perform a Write, which produces a complete File of all the content of the WorkSession.
	:param WS:
	:type WS: IFSelect_WorkSession
	:rtype: None") IFSelect_SessionFile;
		 IFSelect_SessionFile (const opencascade::handle<IFSelect_WorkSession> & WS);

		/****************** IFSelect_SessionFile ******************/
		%feature("compactdefaultargs") IFSelect_SessionFile;
		%feature("autodoc", "* Creates a SessionFile which Writes the content of a WorkSession to a File (directly calls Write) Then, IsDone aknowledges on the result of the Operation. But such a SessionFile may not Read a File to a WorkSession.
	:param WS:
	:type WS: IFSelect_WorkSession
	:param filename:
	:type filename: char *
	:rtype: None") IFSelect_SessionFile;
		 IFSelect_SessionFile (const opencascade::handle<IFSelect_WorkSession> & WS,const char * filename);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "* Returns True if the last Read or Write operation has been corectly performed. ELse returns False.
	:rtype: bool") IsDone;
		Standard_Boolean IsDone ();

		/****************** IsText ******************/
		%feature("compactdefaultargs") IsText;
		%feature("autodoc", "* Returns True if a Parameter, in the Own List (see NbOwnParams) is a Text (between '...'). Else it is an Item (Parameter, Selection, Dispatch ...), which can be Void.
	:param num:
	:type num: int
	:rtype: bool") IsText;
		Standard_Boolean IsText (const Standard_Integer num);

		/****************** IsVoid ******************/
		%feature("compactdefaultargs") IsVoid;
		%feature("autodoc", "* Returns True if a Parameter, given its rank in the Own List (see NbOwnParams), is Void. Returns also True if <num> is out of range (undefined parameters)
	:param num:
	:type num: int
	:rtype: bool") IsVoid;
		Standard_Boolean IsVoid (const Standard_Integer num);

		/****************** ItemValue ******************/
		%feature("compactdefaultargs") ItemValue;
		%feature("autodoc", "* Returns a Parameter as an Item. Returns a Null Handle if the Parameter is a Text, or if it is defined as Void
	:param num:
	:type num: int
	:rtype: opencascade::handle<Standard_Transient>") ItemValue;
		opencascade::handle<Standard_Transient> ItemValue (const Standard_Integer num);

		/****************** Line ******************/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "* Returns a line given its rank in the list of recorded lines
	:param num:
	:type num: int
	:rtype: TCollection_AsciiString") Line;
		const TCollection_AsciiString & Line (const Standard_Integer num);

		/****************** NbLines ******************/
		%feature("compactdefaultargs") NbLines;
		%feature("autodoc", "* Returns the count of recorded lines
	:rtype: int") NbLines;
		Standard_Integer NbLines ();

		/****************** NbParams ******************/
		%feature("compactdefaultargs") NbParams;
		%feature("autodoc", "* During a Read operation, SessionFile processes sequencially the Items to read. For each one, it gives access to the list of its Parameters : they were defined by calls to SendVoid/SendParam/SendText during Writing the File. NbParams returns the count of Parameters for the line currently read.
	:rtype: int") NbParams;
		Standard_Integer NbParams ();

		/****************** NewItem ******************/
		%feature("compactdefaultargs") NewItem;
		%feature("autodoc", "* At beginning of writing an Item, writes its basics : - either its name in the session if it has one - or its relative number of item in the file, else (preceeded by a '_') - then, its Dynamic Type (in the sense of cdl : pk_class) This basic description can be followed by the parameters which are used in the definition of the item.
	:param ident:
	:type ident: int
	:param par:
	:type par: Standard_Transient
	:rtype: None") NewItem;
		void NewItem (const Standard_Integer ident,const opencascade::handle<Standard_Transient> & par);

		/****************** ParamValue ******************/
		%feature("compactdefaultargs") ParamValue;
		%feature("autodoc", "* Returns a Parameter (alphanumeric item of a line) as it has been read
	:param num:
	:type num: int
	:rtype: TCollection_AsciiString") ParamValue;
		const TCollection_AsciiString & ParamValue (const Standard_Integer num);

		/****************** Read ******************/
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "* Performs a Read Operation from a file to a WorkSession i.e. calls ReadFile, then ReadSession and ReadEnd Returned Value is : 0 for OK, -1 File could not be opened, >0 Error during Read (see WriteSession) IsDone can be called too (will return True for OK)
	:param filename:
	:type filename: char *
	:rtype: int") Read;
		Standard_Integer Read (const char * filename);

		/****************** ReadEnd ******************/
		%feature("compactdefaultargs") ReadEnd;
		%feature("autodoc", "* Reads the end of a file (its last line). Returns 0 if OK, status >0 in case of error (not a suitable end line).
	:rtype: int") ReadEnd;
		Standard_Integer ReadEnd ();

		/****************** ReadFile ******************/
		%feature("compactdefaultargs") ReadFile;
		%feature("autodoc", "* Reads the recorded lines from a file named <name>, after having cleared the list (stops if RecognizeFile fails) Returns False (with no clearing) if the file could not be read
	:param name:
	:type name: char *
	:rtype: bool") ReadFile;
		Standard_Boolean ReadFile (const char * name);

		/****************** ReadLine ******************/
		%feature("compactdefaultargs") ReadLine;
		%feature("autodoc", "* Reads a Line and splits it into a set of alphanumeric items, which can then be queried by NbParams/ParamValue ...
	:rtype: bool") ReadLine;
		Standard_Boolean ReadLine ();

		/****************** ReadOwn ******************/
		%feature("compactdefaultargs") ReadOwn;
		%feature("autodoc", "* Tries to Read an Item, by calling the Library of Dumpers Sets the list of parameters of the line to be read from the first own one
	:param item:
	:type item: Standard_Transient
	:rtype: bool") ReadOwn;
		Standard_Boolean ReadOwn (opencascade::handle<Standard_Transient> & item);

		/****************** ReadSession ******************/
		%feature("compactdefaultargs") ReadSession;
		%feature("autodoc", "* Performs a Read Operation from a File to a WorkSession, i.e. reads the list of line (which must have already been loaded, by ReadFile or by calls to AddLine) Important Remark : this excludes the reading of the last line, which is performed by ReadEnd Returns 0 for OK, >0 status for Read Error (not a suitable File, or WorkSession given as Immutable at Creation Time) IsDone can be called too (will return True for OK)
	:rtype: int") ReadSession;
		Standard_Integer ReadSession ();

		/****************** RecognizeFile ******************/
		%feature("compactdefaultargs") RecognizeFile;
		%feature("autodoc", "* Recognizes the header line. returns True if OK, False else
	:param headerline:
	:type headerline: char *
	:rtype: bool") RecognizeFile;
		Standard_Boolean RecognizeFile (const char * headerline);

		/****************** RemoveLastLine ******************/
		%feature("compactdefaultargs") RemoveLastLine;
		%feature("autodoc", "* Removes the last line. Can be called recursively. Does nothing if the list is empty
	:rtype: None") RemoveLastLine;
		void RemoveLastLine ();

		/****************** SendItem ******************/
		%feature("compactdefaultargs") SendItem;
		%feature("autodoc", "* During a Write action, commands to send the identification of a Parameter : if it is Null (undefined) it is send as Void ($) if it is Named in the WorkSession, its Name is sent preceeded by ':', else a relative Ident Number is sent preceeded by '#' (relative to the present Write, i.e. starting at one, without skip, and counted part from Named Items)
	:param par:
	:type par: Standard_Transient
	:rtype: None") SendItem;
		void SendItem (const opencascade::handle<Standard_Transient> & par);

		/****************** SendText ******************/
		%feature("compactdefaultargs") SendText;
		%feature("autodoc", "* During a Write action, commands to send a Text without interpretation. It will be sent as well
	:param text:
	:type text: char *
	:rtype: None") SendText;
		void SendText (const char * text);

		/****************** SendVoid ******************/
		%feature("compactdefaultargs") SendVoid;
		%feature("autodoc", "* During a Write action, commands to send a Void Parameter i.e. a Parameter which is present but undefined Its form will be the dollar sign : $
	:rtype: None") SendVoid;
		void SendVoid ();

		/****************** SetLastGeneral ******************/
		%feature("compactdefaultargs") SetLastGeneral;
		%feature("autodoc", "* Sets the rank of Last General Parameter to a new value. It is followed by the Fist Own Parameter of the item. Used by SessionFile after reading general parameters.
	:param lastgen:
	:type lastgen: int
	:rtype: None") SetLastGeneral;
		void SetLastGeneral (const Standard_Integer lastgen);

		/****************** SetOwn ******************/
		%feature("compactdefaultargs") SetOwn;
		%feature("autodoc", "* Sets Parameters to be sent as Own if <mode> is True (their Name or Number or Void Mark or Text Value is preceeded by a Column sign ':') else they are sent normally Hence, the Own Parameter are clearly identified in the File
	:param mode:
	:type mode: bool
	:rtype: None") SetOwn;
		void SetOwn (const Standard_Boolean mode);

		/****************** SplitLine ******************/
		%feature("compactdefaultargs") SplitLine;
		%feature("autodoc", "* Internal routine which processes a line into words and prepares its exploration
	:param line:
	:type line: char *
	:rtype: None") SplitLine;
		void SplitLine (const char * line);

		/****************** TextValue ******************/
		%feature("compactdefaultargs") TextValue;
		%feature("autodoc", "* Returns the content of a Text Parameter (without the quotes). Returns an empty string if the Parameter is not a Text.
	:param num:
	:type num: int
	:rtype: TCollection_AsciiString") TextValue;
		TCollection_AsciiString TextValue (const Standard_Integer num);

		/****************** WorkSession ******************/
		%feature("compactdefaultargs") WorkSession;
		%feature("autodoc", "* Returns the WorkSession on which a SessionFile works. Remark that it is returned as Immutable.
	:rtype: opencascade::handle<IFSelect_WorkSession>") WorkSession;
		opencascade::handle<IFSelect_WorkSession> WorkSession ();

		/****************** Write ******************/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "* Performs a Write Operation from a WorkSession to a File i.e. calls WriteSession then WriteEnd, and WriteFile Returned Value is : 0 for OK, -1 File could not be created, >0 Error during Write (see WriteSession) IsDone can be called too (will return True for OK)
	:param filename:
	:type filename: char *
	:rtype: int") Write;
		Standard_Integer Write (const char * filename);

		/****************** WriteEnd ******************/
		%feature("compactdefaultargs") WriteEnd;
		%feature("autodoc", "* Writes the trailing line. It is separate from WriteSession, in order to allow to redefine WriteSession without touching WriteEnd (WriteSession defines the body of the file) WriteEnd fills the list of lines. Returns a status of error, 0 if OK, >0 else
	:rtype: int") WriteEnd;
		Standard_Integer WriteEnd ();

		/****************** WriteFile ******************/
		%feature("compactdefaultargs") WriteFile;
		%feature("autodoc", "* Writes the recorded lines to a file named <name> then clears the list of lines. Returns False (with no clearing) if the file could not be created
	:param name:
	:type name: char *
	:rtype: bool") WriteFile;
		Standard_Boolean WriteFile (const char * name);

		/****************** WriteLine ******************/
		%feature("compactdefaultargs") WriteLine;
		%feature("autodoc", "* Writes a line to the File. If <follow> is given, it is added at the following of the line. A newline must be added for the end.
	:param line:
	:type line: char *
	:param follow: default value is 0
	:type follow: Standard_Character
	:rtype: None") WriteLine;
		void WriteLine (const char * line,const Standard_Character follow = 0);

		/****************** WriteOwn ******************/
		%feature("compactdefaultargs") WriteOwn;
		%feature("autodoc", "* Writes the Parameters own to each type of Item. Uses the Library of SessionDumpers Returns True if Done, False if <item> could not be treated (hence it remains written with no Own Parameter)
	:param item:
	:type item: Standard_Transient
	:rtype: bool") WriteOwn;
		Standard_Boolean WriteOwn (const opencascade::handle<Standard_Transient> & item);

		/****************** WriteSession ******************/
		%feature("compactdefaultargs") WriteSession;
		%feature("autodoc", "* Prepares the Write operation from a WorkSession (IFSelect) to a File, i.e. fills the list of lines (the file itself remains to be written; or NbLines/Line may be called) Important Remark : this excludes the reading of the last line, which is performed by WriteEnd Returns 0 if OK, status > 0 in case of error
	:rtype: int") WriteSession;
		Standard_Integer WriteSession ();

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
		/****************** AddDispatch ******************/
		%feature("compactdefaultargs") AddDispatch;
		%feature("autodoc", "* Adds a Dispatch to the list
	:param disp:
	:type disp: IFSelect_Dispatch
	:rtype: None") AddDispatch;
		void AddDispatch (const opencascade::handle<IFSelect_Dispatch> & disp);

		/****************** AddModif ******************/
		%feature("compactdefaultargs") AddModif;
		%feature("autodoc", "* Adds a Modifier to the list of Modifiers : Model Modifiers if <formodel> is True, File Modifiers else (internal).
	:param modifier:
	:type modifier: IFSelect_GeneralModifier
	:param formodel:
	:type formodel: bool
	:param atnum: default value is 0
	:type atnum: int
	:rtype: None") AddModif;
		void AddModif (const opencascade::handle<IFSelect_GeneralModifier> & modifier,const Standard_Boolean formodel,const Standard_Integer atnum = 0);

		/****************** AddModifier ******************/
		%feature("compactdefaultargs") AddModifier;
		%feature("autodoc", "* Sets a Modifier to be applied on all Dispatches to be run If <modifier> is a ModelModifier, adds it to the list of Model Modifiers; else to the list of File Modifiers By default (atnum = 0) at the end of the list, else at <atnum> Each Modifier is used, after each copy of a packet of Entities into a Model : its criteria are checked and if they are OK, the method Perform of this Modifier is run.
	:param modifier:
	:type modifier: IFSelect_GeneralModifier
	:param atnum:
	:type atnum: int
	:rtype: None") AddModifier;
		void AddModifier (const opencascade::handle<IFSelect_GeneralModifier> & modifier,const Standard_Integer atnum);

		/****************** AddModifier ******************/
		%feature("compactdefaultargs") AddModifier;
		%feature("autodoc", "* Sets a Modifier to be applied on the Dispatch <dispnum> If <modifier> is a ModelModifier, adds it to the list of Model Modifiers; else to the list of File Modifiers This is the same list as for all Dispatches, but the Modifier is qualified to be applied to one Dispatch only Then, <atnum> refers to the entire list By default (atnum = 0) at the end of the list, else at <atnum> Remark : if the Modifier was already in the list and if <atnum> = 0, the Modifier is not moved, but only qualified for a Dispatch
	:param modifier:
	:type modifier: IFSelect_GeneralModifier
	:param dispnum:
	:type dispnum: int
	:param atnum:
	:type atnum: int
	:rtype: None") AddModifier;
		void AddModifier (const opencascade::handle<IFSelect_GeneralModifier> & modifier,const Standard_Integer dispnum,const Standard_Integer atnum);

		/****************** ChangeModifierRank ******************/
		%feature("compactdefaultargs") ChangeModifierRank;
		%feature("autodoc", "* Changes the rank of a modifier in the list : Model Modifiers if <formodel> is True, File Modifiers else from <before> to <after> Returns True if done, False else (before or after out of range)
	:param formodel:
	:type formodel: bool
	:param befor:
	:type befor: int
	:param after:
	:type after: int
	:rtype: bool") ChangeModifierRank;
		Standard_Boolean ChangeModifierRank (const Standard_Boolean formodel,const Standard_Integer befor,const Standard_Integer after);

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "* Removes in one operation all the Dispatches with their Idents Also clears all informations about Names, and all Results but naming informations which are : - kept if <onlydisp> is True. - cleared if <onlydisp> is False (complete clearing) If <onlydisp> is True, that's all. Else, clears also Modifiers
	:param onlydisp:
	:type onlydisp: bool
	:rtype: None") Clear;
		void Clear (const Standard_Boolean onlydisp);

		/****************** ClearResult ******************/
		%feature("compactdefaultargs") ClearResult;
		%feature("autodoc", "* Clears all data produced (apart from Dispatches, etc...) if <alsoname> is True, all is cleared. Else, informations about produced Names are kept (to maintain unicity of naming across clearings)
	:param alsoname:
	:type alsoname: bool
	:rtype: None") ClearResult;
		void ClearResult (const Standard_Boolean alsoname);

		/****************** DefaultRootName ******************/
		%feature("compactdefaultargs") DefaultRootName;
		%feature("autodoc", "* Returns the Default Root Name. Can be empty.
	:rtype: opencascade::handle<TCollection_HAsciiString>") DefaultRootName;
		opencascade::handle<TCollection_HAsciiString> DefaultRootName ();

		/****************** Dispatch ******************/
		%feature("compactdefaultargs") Dispatch;
		%feature("autodoc", "* Returns a Dispatch, given its rank in the list
	:param num:
	:type num: int
	:rtype: opencascade::handle<IFSelect_Dispatch>") Dispatch;
		const opencascade::handle<IFSelect_Dispatch> & Dispatch (const Standard_Integer num);

		/****************** DispatchRank ******************/
		%feature("compactdefaultargs") DispatchRank;
		%feature("autodoc", "* Returns the Rank of a Dispatch, given its Value (Handle). Returns 0 if the Dispatch is unknown in the ShareOut
	:param disp:
	:type disp: IFSelect_Dispatch
	:rtype: int") DispatchRank;
		Standard_Integer DispatchRank (const opencascade::handle<IFSelect_Dispatch> & disp);

		/****************** Extension ******************/
		%feature("compactdefaultargs") Extension;
		%feature("autodoc", "* Returns the general Extension. Can be empty (not recommanded)
	:rtype: opencascade::handle<TCollection_HAsciiString>") Extension;
		opencascade::handle<TCollection_HAsciiString> Extension ();

		/****************** FileName ******************/
		%feature("compactdefaultargs") FileName;
		%feature("autodoc", "* Computes the complete file name for a Packet of a Dispatch, given Dispatch Number (Rank), Packet Number, and Count of Packets generated by this Dispatch (0 if unknown) //! File Name is made of following strings, concatenated : General Prefix, Root Name for Dispatch, Packet Suffix, and General Extension. If no Root Name is specified for a Dispatch, DefaultRootName is considered (and pnum is not used, but <thenbdefs> is incremented and used Error if no Root is defined for this <idnum>
	:param dnum:
	:type dnum: int
	:param pnum:
	:type pnum: int
	:param nbpack: default value is 0
	:type nbpack: int
	:rtype: TCollection_AsciiString") FileName;
		TCollection_AsciiString FileName (const Standard_Integer dnum,const Standard_Integer pnum,const Standard_Integer nbpack = 0);

		/****************** GeneralModifier ******************/
		%feature("compactdefaultargs") GeneralModifier;
		%feature("autodoc", "* Returns a Modifier of the list, given its rank : Model Modifiers if <formodel> is True, File Modifiers else
	:param formodel:
	:type formodel: bool
	:param num:
	:type num: int
	:rtype: opencascade::handle<IFSelect_GeneralModifier>") GeneralModifier;
		opencascade::handle<IFSelect_GeneralModifier> GeneralModifier (const Standard_Boolean formodel,const Standard_Integer num);

		/****************** HasRootName ******************/
		%feature("compactdefaultargs") HasRootName;
		%feature("autodoc", "* Returns True if the Dispatch of rank <num> has an attached Root Name. False else, or if num is out of range
	:param num:
	:type num: int
	:rtype: bool") HasRootName;
		Standard_Boolean HasRootName (const Standard_Integer num);

		/****************** IFSelect_ShareOut ******************/
		%feature("compactdefaultargs") IFSelect_ShareOut;
		%feature("autodoc", "* Creates an empty ShareOut
	:rtype: None") IFSelect_ShareOut;
		 IFSelect_ShareOut ();

		/****************** LastRun ******************/
		%feature("compactdefaultargs") LastRun;
		%feature("autodoc", "* Returns the rank of last run item (ClearResult resets it to 0)
	:rtype: int") LastRun;
		Standard_Integer LastRun ();

		/****************** ModelModifier ******************/
		%feature("compactdefaultargs") ModelModifier;
		%feature("autodoc", "* Returns a Modifier of the list of Model Modifiers, duely casted
	:param num:
	:type num: int
	:rtype: opencascade::handle<IFSelect_Modifier>") ModelModifier;
		opencascade::handle<IFSelect_Modifier> ModelModifier (const Standard_Integer num);

		/****************** ModifierRank ******************/
		%feature("compactdefaultargs") ModifierRank;
		%feature("autodoc", "* Gives the rank of a Modifier in the list, 0 if not in the list Model Modifiers if <modifier> is kind of ModelModifer, File Modifiers else
	:param modifier:
	:type modifier: IFSelect_GeneralModifier
	:rtype: int") ModifierRank;
		Standard_Integer ModifierRank (const opencascade::handle<IFSelect_GeneralModifier> & modifier);

		/****************** NbDispatches ******************/
		%feature("compactdefaultargs") NbDispatches;
		%feature("autodoc", "* Returns the count of Dispatches
	:rtype: int") NbDispatches;
		Standard_Integer NbDispatches ();

		/****************** NbModifiers ******************/
		%feature("compactdefaultargs") NbModifiers;
		%feature("autodoc", "* Returns count of Modifiers (which apply to complete Models) : Model Modifiers if <formodel> is True, File Modifiers else
	:param formodel:
	:type formodel: bool
	:rtype: int") NbModifiers;
		Standard_Integer NbModifiers (const Standard_Boolean formodel);

		/****************** Prefix ******************/
		%feature("compactdefaultargs") Prefix;
		%feature("autodoc", "* Returns the general Prefix. Can be empty.
	:rtype: opencascade::handle<TCollection_HAsciiString>") Prefix;
		opencascade::handle<TCollection_HAsciiString> Prefix ();

		/****************** RemoveDispatch ******************/
		%feature("compactdefaultargs") RemoveDispatch;
		%feature("autodoc", "* Removes a Dispatch, given its rank in the list Returns True if done, False if rank is not between (LastRun + 1) and (NbDispatches)
	:param rank:
	:type rank: int
	:rtype: bool") RemoveDispatch;
		Standard_Boolean RemoveDispatch (const Standard_Integer rank);

		/****************** RemoveItem ******************/
		%feature("compactdefaultargs") RemoveItem;
		%feature("autodoc", "* Removes an item, which can be, either a Dispatch (removed from the list of Dispatches), or a GeneralModifier (removed from the list of Model Modifiers or from the list of File Modifiers according to its type). Returns True if done, False if has not been found or if it is neither a Dispatch, nor a Modifier.
	:param item:
	:type item: Standard_Transient
	:rtype: bool") RemoveItem;
		Standard_Boolean RemoveItem (const opencascade::handle<Standard_Transient> & item);

		/****************** RemoveModifier ******************/
		%feature("compactdefaultargs") RemoveModifier;
		%feature("autodoc", "* Removes a Modifier, given it rank in the list : Model Modifiers if <formodel> is True, File Modifiers else Returns True if done, False if <num> is out of range
	:param formodel:
	:type formodel: bool
	:param num:
	:type num: int
	:rtype: bool") RemoveModifier;
		Standard_Boolean RemoveModifier (const Standard_Boolean formodel,const Standard_Integer num);

		/****************** RootName ******************/
		%feature("compactdefaultargs") RootName;
		%feature("autodoc", "* Returns the Root bound to a Dispatch, given its rank Returns a Null Handle if not defined
	:param num:
	:type num: int
	:rtype: opencascade::handle<TCollection_HAsciiString>") RootName;
		opencascade::handle<TCollection_HAsciiString> RootName (const Standard_Integer num);

		/****************** RootNumber ******************/
		%feature("compactdefaultargs") RootNumber;
		%feature("autodoc", "* Returns an integer value about a given root name : - positive : it's the rank of the Dispatch which has this name - null : this root name is unknown - negative (-1) : this root name is the default root name
	:param name:
	:type name: TCollection_HAsciiString
	:rtype: int") RootNumber;
		Standard_Integer RootNumber (const opencascade::handle<TCollection_HAsciiString> & name);

		/****************** SetDefaultRootName ******************/
		%feature("compactdefaultargs") SetDefaultRootName;
		%feature("autodoc", "* Defines or Changes the Default Root Name to a new value (which is used for dispatches which have no attached root name). If this method is not called, DefaultRootName remains empty Returns True if OK, False if this Name is already attached, for a Dispatch or for Default
	:param defrt:
	:type defrt: TCollection_HAsciiString
	:rtype: bool") SetDefaultRootName;
		Standard_Boolean SetDefaultRootName (const opencascade::handle<TCollection_HAsciiString> & defrt);

		/****************** SetExtension ******************/
		%feature("compactdefaultargs") SetExtension;
		%feature("autodoc", "* Defines or Changes the general Extension (which is appended to complete file name generated). If this method is not call, Extension remains empty
	:param ext:
	:type ext: TCollection_HAsciiString
	:rtype: None") SetExtension;
		void SetExtension (const opencascade::handle<TCollection_HAsciiString> & ext);

		/****************** SetLastRun ******************/
		%feature("compactdefaultargs") SetLastRun;
		%feature("autodoc", "* Records a new alue for the rank of last run item
	:param last:
	:type last: int
	:rtype: None") SetLastRun;
		void SetLastRun (const Standard_Integer last);

		/****************** SetPrefix ******************/
		%feature("compactdefaultargs") SetPrefix;
		%feature("autodoc", "* Defines or Changes the general Prefix (which is prepended to complete file name generated). If this method is not call, Prefix remains empty
	:param pref:
	:type pref: TCollection_HAsciiString
	:rtype: None") SetPrefix;
		void SetPrefix (const opencascade::handle<TCollection_HAsciiString> & pref);

		/****************** SetRootName ******************/
		%feature("compactdefaultargs") SetRootName;
		%feature("autodoc", "* Attaches a Root Name to a Dispatch given its rank, as an HAsciiString (standard form). A Null Handle resets this name. Returns True if OK, False if this Name is already attached, for a Dispatch or for Default, or <num> out of range
	:param num:
	:type num: int
	:param name:
	:type name: TCollection_HAsciiString
	:rtype: bool") SetRootName;
		Standard_Boolean SetRootName (const Standard_Integer num,const opencascade::handle<TCollection_HAsciiString> & name);

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
		/****************** Dispatch ******************/
		%feature("compactdefaultargs") Dispatch;
		%feature("autodoc", "* Returns the current Dispatch
	:rtype: opencascade::handle<IFSelect_Dispatch>") Dispatch;
		opencascade::handle<IFSelect_Dispatch> Dispatch ();

		/****************** DispatchRank ******************/
		%feature("compactdefaultargs") DispatchRank;
		%feature("autodoc", "* Returns the Rank of the current Dispatch in the ShareOut Returns Zero if there is none (iteration finished)
	:rtype: int") DispatchRank;
		Standard_Integer DispatchRank ();

		/****************** Evaluate ******************/
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "* Evaluates the result of a ShareOut : determines Entities to be forgotten by the ShareOut, Entities to be transferred several times (duplicated), prepares an iteration on the packets to be produced Called the first time anyone question is asked, or after a call to Reset. Works by calling the method Prepare.
	:rtype: None") Evaluate;
		void Evaluate ();

		/****************** FileName ******************/
		%feature("compactdefaultargs") FileName;
		%feature("autodoc", "* Returns the File Name which corresponds to current Packet (computed by ShareOut) If current Packet has no associated name (see ShareOut), the returned value is Null
	:rtype: TCollection_AsciiString") FileName;
		TCollection_AsciiString FileName ();

		/****************** Graph ******************/
		%feature("compactdefaultargs") Graph;
		%feature("autodoc", "* Returns the Graph used to create theShareOutResult
	:rtype: Interface_Graph") Graph;
		const Interface_Graph & Graph ();

		/****************** IFSelect_ShareOutResult ******************/
		%feature("compactdefaultargs") IFSelect_ShareOutResult;
		%feature("autodoc", "* Creates a ShareOutResult from a ShareOut, to work on a Model (without any more precision; uses Active Protocol)
	:param sho:
	:type sho: IFSelect_ShareOut
	:param mod:
	:type mod: Interface_InterfaceModel
	:rtype: None") IFSelect_ShareOutResult;
		 IFSelect_ShareOutResult (const opencascade::handle<IFSelect_ShareOut> & sho,const opencascade::handle<Interface_InterfaceModel> & mod);

		/****************** IFSelect_ShareOutResult ******************/
		%feature("compactdefaultargs") IFSelect_ShareOutResult;
		%feature("autodoc", "* Creates a ShareOutResult from a ShareOut, to work on a Graph already computed, which defines the Input Model and can specialize some Entities
	:param sho:
	:type sho: IFSelect_ShareOut
	:param G:
	:type G: Interface_Graph
	:rtype: None") IFSelect_ShareOutResult;
		 IFSelect_ShareOutResult (const opencascade::handle<IFSelect_ShareOut> & sho,const Interface_Graph & G);

		/****************** IFSelect_ShareOutResult ******************/
		%feature("compactdefaultargs") IFSelect_ShareOutResult;
		%feature("autodoc", "* Creates a ShareOutResult from a unique Dispatch, to work on a Model. As if it was a ShareOut with only one Dispatch (without any more precision; uses Active Protocol) Allows to compute the effect of a single Dispatch
	:param disp:
	:type disp: IFSelect_Dispatch
	:param mod:
	:type mod: Interface_InterfaceModel
	:rtype: None") IFSelect_ShareOutResult;
		 IFSelect_ShareOutResult (const opencascade::handle<IFSelect_Dispatch> & disp,const opencascade::handle<Interface_InterfaceModel> & mod);

		/****************** IFSelect_ShareOutResult ******************/
		%feature("compactdefaultargs") IFSelect_ShareOutResult;
		%feature("autodoc", "* Creates a ShareOutResult from a unique Dispatch, to work on a Graph. As if it was a ShareOut with only one Dispatch Allows to compute the effect of a single Dispatch
	:param disp:
	:type disp: IFSelect_Dispatch
	:param G:
	:type G: Interface_Graph
	:rtype: None") IFSelect_ShareOutResult;
		 IFSelect_ShareOutResult (const opencascade::handle<IFSelect_Dispatch> & disp,const Interface_Graph & G);

		/****************** More ******************/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "* Returns True if there is more packets in the current Dispatch, else if there is more Dispatch in the ShareOut
	:rtype: bool") More;
		Standard_Boolean More ();

		/****************** NbPackets ******************/
		%feature("compactdefaultargs") NbPackets;
		%feature("autodoc", "* Returns the total count of produced non empty packets (in out : calls Evaluate as necessary)
	:rtype: int") NbPackets;
		Standard_Integer NbPackets ();

		/****************** Next ******************/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "* Passes to the next Packet in the current Dispatch, or if there is none, to the next Dispatch in the ShareOut
	:rtype: None") Next;
		void Next ();

		/****************** NextDispatch ******************/
		%feature("compactdefaultargs") NextDispatch;
		%feature("autodoc", "* Passes to the next Dispatch, regardless about remaining packets
	:rtype: None") NextDispatch;
		void NextDispatch ();

		/****************** PacketContent ******************/
		%feature("compactdefaultargs") PacketContent;
		%feature("autodoc", "* Returns the complete content of the current Packet (i.e. with shared entities, which will also be put in the file)
	:rtype: Interface_EntityIterator") PacketContent;
		Interface_EntityIterator PacketContent ();

		/****************** PacketRoot ******************/
		%feature("compactdefaultargs") PacketRoot;
		%feature("autodoc", "* Returns the list of Roots of the current Packet (never empty) (i.e. the Entities to be themselves asked for transfer) Error if there is none (iteration finished)
	:rtype: Interface_EntityIterator") PacketRoot;
		Interface_EntityIterator PacketRoot ();

		/****************** Packets ******************/
		%feature("compactdefaultargs") Packets;
		%feature("autodoc", "* Returns the list of recorded Packets, under two modes : - <complete> = False, the strict definition of Packets, i.e. for each one, the Root Entities, to be explicitely sent - <complete> = True (Default), the completely evaluated list, i.e. which really gives the destination of each entity : this mode allows to evaluate duplications Remark that to send packets, iteration remains preferable (file names are managed)
	:param complete: default value is Standard_True
	:type complete: bool
	:rtype: opencascade::handle<IFSelect_PacketList>") Packets;
		opencascade::handle<IFSelect_PacketList> Packets (const Standard_Boolean complete = Standard_True);

		/****************** PacketsInDispatch ******************/
		%feature("compactdefaultargs") PacketsInDispatch;
		%feature("autodoc", "* Returns Number (rank) of current Packet in current Dispatch, and total count of Packets in current Dispatch, as arguments
	:param numpack:
	:type numpack: int
	:param nbpacks:
	:type nbpacks: int
	:rtype: None") PacketsInDispatch;
		void PacketsInDispatch (Standard_Integer &OutValue,Standard_Integer &OutValue);

		/****************** Prepare ******************/
		%feature("compactdefaultargs") Prepare;
		%feature("autodoc", "* Prepares the iteration on the packets This method is called by Evaluate, but can be called anytime The iteration consists in taking each Dispatch of the ShareOut beginning by the first one, compute its packets, then iterate on these packets. Once all these packets are iterated, the iteration passes to the next Dispatch, or stops. For a creation from a unique Dispatch, same but with only this Dispatch. Each packet can be listed, or really transferred (producing a derived Model, from which a file can be generated) //! Prepare sets the iteration to the first Dispatch, first Packet
	:rtype: None") Prepare;
		void Prepare ();

		/****************** Reset ******************/
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", "* Erases computed data, in order to command a new Evaluation
	:rtype: None") Reset;
		void Reset ();

		/****************** ShareOut ******************/
		%feature("compactdefaultargs") ShareOut;
		%feature("autodoc", "* Returns the ShareOut used to create the ShareOutResult if creation from a Dispatch, returns a Null Handle
	:rtype: opencascade::handle<IFSelect_ShareOut>") ShareOut;
		opencascade::handle<IFSelect_ShareOut> ShareOut ();

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
		%feature("autodoc", "* Adds a possible case To be called when creating, IF the list of possible cases for Value is known when starting For instance, for CDL types, rather do not fill this, but for a specific enumeration (such as a status), can be used
	:param acase:
	:type acase: char *
	:rtype: None") AddCase;
		void AddCase (const char * acase);

		/****************** CaseList ******************/
		%feature("compactdefaultargs") CaseList;
		%feature("autodoc", "* Returns the predefined list of possible cases, filled by AddCase Null Handle if no predefined list (hence, to be counted) Useful to filter on really possible vase, for instance, or for a help
	:rtype: opencascade::handle<TColStd_HSequenceOfAsciiString>") CaseList;
		opencascade::handle<TColStd_HSequenceOfAsciiString> CaseList ();

		/****************** IntValue ******************/
		%feature("compactdefaultargs") IntValue;
		%feature("autodoc", "* This procedure converts an Integer to a CString It is a convenient way when the value of a signature has the form of a simple integer value The value is to be used immediately (one buffer only, no copy)
	:param val:
	:type val: int
	:rtype: char *") IntValue;
		static const char * IntValue (const Standard_Integer val);

		/****************** IsIntCase ******************/
		%feature("compactdefaultargs") IsIntCase;
		%feature("autodoc", "* Tells if this Signature gives integer values and returns values from SetIntCase if True
	:param hasmin:
	:type hasmin: bool
	:param valmin:
	:type valmin: int
	:param hasmax:
	:type hasmax: bool
	:param valmax:
	:type valmax: int
	:rtype: bool") IsIntCase;
		Standard_Boolean IsIntCase (Standard_Boolean &OutValue,Standard_Integer &OutValue,Standard_Boolean &OutValue,Standard_Integer &OutValue);

		/****************** Label ******************/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "* The label of a Signature uses its name as follow : 'Signature : <name>'
	:rtype: TCollection_AsciiString") Label;
		TCollection_AsciiString Label ();

		/****************** MatchValue ******************/
		%feature("compactdefaultargs") MatchValue;
		%feature("autodoc", "* Default procedure to tell if a value <val> matches a text with a criterium <exact>. <exact> = True requires equality, else only contained (no reg-exp)
	:param val:
	:type val: char *
	:param text:
	:type text: TCollection_AsciiString
	:param exact:
	:type exact: bool
	:rtype: bool") MatchValue;
		static Standard_Boolean MatchValue (const char * val,const TCollection_AsciiString & text,const Standard_Boolean exact);

		/****************** Matches ******************/
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "* Tells if the value for <ent> in <model> matches a text, with a criterium <exact>. The default definition calls MatchValue Can be redefined
	:param ent:
	:type ent: Standard_Transient
	:param model:
	:type model: Interface_InterfaceModel
	:param text:
	:type text: TCollection_AsciiString
	:param exact:
	:type exact: bool
	:rtype: bool") Matches;
		virtual Standard_Boolean Matches (const opencascade::handle<Standard_Transient> & ent,const opencascade::handle<Interface_InterfaceModel> & model,const TCollection_AsciiString & text,const Standard_Boolean exact);

		/****************** Name ******************/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "* Returns an identification of the Signature (a word), given at initialization time Returns the Signature for a Transient object. It is specific of each sub-class of Signature. For a Null Handle, it should provide '' It can work with the model which contains the entity
	:rtype: char *") Name;
		const char * Name ();

		/****************** SetIntCase ******************/
		%feature("compactdefaultargs") SetIntCase;
		%feature("autodoc", "* Sets the information data to tell 'integer cases' with possible min and max values To be called when creating
	:param hasmin:
	:type hasmin: bool
	:param valmin:
	:type valmin: int
	:param hasmax:
	:type hasmax: bool
	:param valmax:
	:type valmax: int
	:rtype: None") SetIntCase;
		void SetIntCase (const Standard_Boolean hasmin,const Standard_Integer valmin,const Standard_Boolean hasmax,const Standard_Integer valmax);

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
		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "* Adds an entity with its signature, i.e. : - counts an item more for <sign> - if record-list status is set, records the entity Accepts a null entity (the signature is then for the global model). But if the string is empty, counts a Null item. //! If SignOnly Mode is set, this work is replaced by just setting LastValue
	:param ent:
	:type ent: Standard_Transient
	:param sign:
	:type sign: char *
	:rtype: None") Add;
		void Add (const opencascade::handle<Standard_Transient> & ent,const char * sign);

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", ":rtype: void") Clear;
		virtual void Clear ();

		/****************** Entities ******************/
		%feature("compactdefaultargs") Entities;
		%feature("autodoc", "* Returns the list of entities attached to a signature It is empty if <sign> has not been recorded It is a Null Handle if the list of entities is not known
	:param sign:
	:type sign: char *
	:rtype: opencascade::handle<TColStd_HSequenceOfTransient>") Entities;
		opencascade::handle<TColStd_HSequenceOfTransient> Entities (const char * sign);

		/****************** HasEntities ******************/
		%feature("compactdefaultargs") HasEntities;
		%feature("autodoc", "* Returns True if the list of Entities is aknowledged, else the method Entities will always return a Null Handle
	:rtype: bool") HasEntities;
		Standard_Boolean HasEntities ();

		/****************** IFSelect_SignatureList ******************/
		%feature("compactdefaultargs") IFSelect_SignatureList;
		%feature("autodoc", "* Creates a SignatureList. If <withlist> is True, entities will be not only counted per signature, but also listed.
	:param withlist: default value is Standard_False
	:type withlist: bool
	:rtype: None") IFSelect_SignatureList;
		 IFSelect_SignatureList (const Standard_Boolean withlist = Standard_False);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Aknowledges the list in once. Name identifies the Signature
	:param name:
	:type name: char *
	:param count:
	:type count: NCollection_IndexedDataMap<TCollection_AsciiString, int>
	:param list:
	:type list: Standard_Transient
	:param nbnuls:
	:type nbnuls: int
	:rtype: None") Init;
		void Init (const char * name,const NCollection_IndexedDataMap<TCollection_AsciiString, Standard_Integer> & count,const NCollection_IndexedDataMap<TCollection_AsciiString, opencascade::handle<Standard_Transient> > & list,const Standard_Integer nbnuls);

		/****************** LastValue ******************/
		%feature("compactdefaultargs") LastValue;
		%feature("autodoc", "* Returns the last value recorded by Add (only if SignMode set) Cleared by Clear or Init
	:rtype: char *") LastValue;
		const char * LastValue ();

		/****************** List ******************/
		%feature("compactdefaultargs") List;
		%feature("autodoc", "* Returns the list of signatures, as a sequence of strings (but without their respective counts). It is ordered. By default, for all the signatures. If <root> is given non empty, for the signatures which begin by <root>
	:param root: default value is ""
	:type root: char *
	:rtype: opencascade::handle<TColStd_HSequenceOfHAsciiString>") List;
		opencascade::handle<TColStd_HSequenceOfHAsciiString> List (const char * root = "");


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
		%feature("autodoc", "* Returns the recorded Name. Remark : default is '...' (no SetName called)
	:rtype: char *") Name;
		virtual const char * Name ();

		/****************** NbNulls ******************/
		%feature("compactdefaultargs") NbNulls;
		%feature("autodoc", "* Returns the count of null entities
	:rtype: int") NbNulls;
		Standard_Integer NbNulls ();

		/****************** NbTimes ******************/
		%feature("compactdefaultargs") NbTimes;
		%feature("autodoc", "* Returns the number of times a signature was counted, 0 if it has not been recorded at all
	:param sign:
	:type sign: char *
	:rtype: int") NbTimes;
		Standard_Integer NbTimes (const char * sign);

		/****************** PrintCount ******************/
		%feature("compactdefaultargs") PrintCount;
		%feature("autodoc", "* Prints the counts of items (not the list)
	:param S:
	:type S: Message_Messenger
	:rtype: void") PrintCount;
		virtual void PrintCount (const opencascade::handle<Message_Messenger> & S);

		/****************** PrintList ******************/
		%feature("compactdefaultargs") PrintList;
		%feature("autodoc", "* Prints the lists of items, if they are present (else, prints a message 'no list available') Uses <model> to determine for each entity to be listed, its number, and its specific identifier (by PrintLabel) <mod> gives a mode for printing : - CountByItem : just count (as PrintCount) - ShortByItem : minimum i.e. count plus 5 first entity numbers - ShortByItem(D) complete list of entity numbers (0: 'Global') - EntitiesByItem : list of (entity number/PrintLabel from the model) other modes are ignored
	:param S:
	:type S: Message_Messenger
	:param model:
	:type model: Interface_InterfaceModel
	:param mod: default value is IFSelect_ListByItem
	:type mod: IFSelect_PrintCount
	:rtype: void") PrintList;
		virtual void PrintList (const opencascade::handle<Message_Messenger> & S,const opencascade::handle<Interface_InterfaceModel> & model,const IFSelect_PrintCount mod = IFSelect_ListByItem);

		/****************** PrintSum ******************/
		%feature("compactdefaultargs") PrintSum;
		%feature("autodoc", "* Prints a summary Item which has the greatest count of entities For items which are numeric values : their count, maximum, minimum values, cumul, average
	:param S:
	:type S: Message_Messenger
	:rtype: void") PrintSum;
		virtual void PrintSum (const opencascade::handle<Message_Messenger> & S);

		/****************** SetList ******************/
		%feature("compactdefaultargs") SetList;
		%feature("autodoc", "* Changes the record-list status. The list is not cleared but its use changes
	:param withlist:
	:type withlist: bool
	:rtype: None") SetList;
		void SetList (const Standard_Boolean withlist);

		/****************** SetName ******************/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "* Defines a name for a SignatureList (used to print it)
	:param name:
	:type name: char *
	:rtype: None") SetName;
		void SetName (const char * name);

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
		%feature("autodoc", "* This methods allows to declare that the Protocol applied to the new Model has changed. It applies to the last call to Perform. //! Returns True if the Protocol has changed, False else. The provided default keeps the starting Protocol. This method should be redefined as required by the effect of Perform.
	:param newproto:
	:type newproto: Interface_Protocol
	:rtype: bool") ChangeProtocol;
		virtual Standard_Boolean ChangeProtocol (opencascade::handle<Interface_Protocol> & newproto);

		/****************** Label ******************/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "* Returns a text which defines the way a Transformer works (to identify the transformation it performs)
	:rtype: TCollection_AsciiString") Label;
		virtual TCollection_AsciiString Label ();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Performs a Transformation (defined by each sub-class) : <G> gives the input data (especially the starting model) and can be used for queries (by Selections, etc...) <protocol> allows to work with General Services as necessary (it applies to input data) If the change corresponds to a conversion to a new protocol, see also the method ChangeProtocol <checks> stores produced checks messages if any <newmod> gives the result of the transformation : - if it is Null (i.e. has not been affected), the transformation has been made on the spot, it is assumed to cause no change to the graph of dependances - if it equates the starting Model, it has been transformed on the spot (possibiliy some entities were replaced inside it) - if it is new, it corresponds to a new data set which replaces the starting one //! <self> is mutable to allow results for ChangeProtocol to be memorized if needed, and to store informations useful for the method Updated //! Returns True if Done, False if an Error occured : in this case, if a new data set has been produced, the transformation is ignored, else data may be corrupted.
	:param G:
	:type G: Interface_Graph
	:param protocol:
	:type protocol: Interface_Protocol
	:param checks:
	:type checks: Interface_CheckIterator
	:param newmod:
	:type newmod: Interface_InterfaceModel
	:rtype: bool") Perform;
		virtual Standard_Boolean Perform (const Interface_Graph & G,const opencascade::handle<Interface_Protocol> & protocol,Interface_CheckIterator & checks,opencascade::handle<Interface_InterfaceModel> & newmod);

		/****************** Updated ******************/
		%feature("compactdefaultargs") Updated;
		%feature("autodoc", "* This method allows to know what happened to a starting entity after the last Perform. If <entfrom> (from starting model) has one and only one known item which corresponds in the new produced model, this method must return True and fill the argument <entto>. Else, it returns False.
	:param entfrom:
	:type entfrom: Standard_Transient
	:param entto:
	:type entto: Standard_Transient
	:rtype: bool") Updated;
		virtual Standard_Boolean Updated (const opencascade::handle<Standard_Transient> & entfrom,opencascade::handle<Standard_Transient> & entto);

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
		%feature("autodoc", "* Performs the copy of entities from an original model to a new one. It must also copy headers if any. Returns True when done. The provided default works by copying the individual entities designated in the list, by using the general service class CopyTool. It can be redefined for a norm which, either implements Copy by another way (do not forget to Bind each copied result with its original entity in TC) and returns True, or does not know how to copy and returns False
	:param original:
	:type original: Interface_InterfaceModel
	:param newmodel:
	:type newmodel: Interface_InterfaceModel
	:param list:
	:type list: Interface_EntityIterator
	:param TC:
	:type TC: Interface_CopyTool
	:rtype: bool") CopyModel;
		virtual Standard_Boolean CopyModel (const opencascade::handle<Interface_InterfaceModel> & original,const opencascade::handle<Interface_InterfaceModel> & newmodel,const Interface_EntityIterator & list,Interface_CopyTool & TC);

		/****************** DumpEntity ******************/
		%feature("compactdefaultargs") DumpEntity;
		%feature("autodoc", "* Gives the way of dumping an entity under a form comprehensive for each norm. <model> helps to identify, number ... entities. <level> is to be interpreted for each norm (because of the formats which can be very different)
	:param model:
	:type model: Interface_InterfaceModel
	:param protocol:
	:type protocol: Interface_Protocol
	:param entity:
	:type entity: Standard_Transient
	:param S:
	:type S: Message_Messenger
	:param level:
	:type level: int
	:rtype: void") DumpEntity;
		virtual void DumpEntity (const opencascade::handle<Interface_InterfaceModel> & model,const opencascade::handle<Interface_Protocol> & protocol,const opencascade::handle<Standard_Transient> & entity,const opencascade::handle<Message_Messenger> & S,const Standard_Integer level);

		/****************** DumpEntity ******************/
		%feature("compactdefaultargs") DumpEntity;
		%feature("autodoc", "* Calls deferred DumpEntity with the recorded default level
	:param model:
	:type model: Interface_InterfaceModel
	:param protocol:
	:type protocol: Interface_Protocol
	:param entity:
	:type entity: Standard_Transient
	:param S:
	:type S: Message_Messenger
	:rtype: None") DumpEntity;
		void DumpEntity (const opencascade::handle<Interface_InterfaceModel> & model,const opencascade::handle<Interface_Protocol> & protocol,const opencascade::handle<Standard_Transient> & entity,const opencascade::handle<Message_Messenger> & S);

		/****************** DumpHelp ******************/
		%feature("compactdefaultargs") DumpHelp;
		%feature("autodoc", "* Returns the help line recorded for <level>, or an empty string
	:param level:
	:type level: int
	:rtype: char *") DumpHelp;
		const char * DumpHelp (const Standard_Integer level);

		/****************** DumpLevels ******************/
		%feature("compactdefaultargs") DumpLevels;
		%feature("autodoc", "* Returns the recorded default and maximum dump levels If none was recorded, max is returned negative, def as zero
	:param def:
	:type def: int
	:param max:
	:type max: int
	:rtype: None") DumpLevels;
		void DumpLevels (Standard_Integer &OutValue,Standard_Integer &OutValue);

		/****************** ReadFile ******************/
		%feature("compactdefaultargs") ReadFile;
		%feature("autodoc", "* Gives the way to Read a File and transfer it to a Model <mod> is the resulting Model, which has to be created by this method. In case of error, <mod> must be returned Null Return value is a status with free values. Simply, 0 is for 'Execution OK' The Protocol can be used to work (e.g. create the Model, read and recognize the Entities)
	:param name:
	:type name: char *
	:param model:
	:type model: Interface_InterfaceModel
	:param protocol:
	:type protocol: Interface_Protocol
	:rtype: int") ReadFile;
		virtual Standard_Integer ReadFile (const char * name,opencascade::handle<Interface_InterfaceModel> & model,const opencascade::handle<Interface_Protocol> & protocol);

		/****************** SetDumpHelp ******************/
		%feature("compactdefaultargs") SetDumpHelp;
		%feature("autodoc", "* Records a short line of help for a level (0 - max)
	:param level:
	:type level: int
	:param help:
	:type help: char *
	:rtype: None") SetDumpHelp;
		void SetDumpHelp (const Standard_Integer level,const char * help);

		/****************** SetDumpLevels ******************/
		%feature("compactdefaultargs") SetDumpLevels;
		%feature("autodoc", "* Records a default level and a maximum value for level level for DumpEntity can go between 0 and <max> default value will be <def>
	:param def:
	:type def: int
	:param max:
	:type max: int
	:rtype: None") SetDumpLevels;
		void SetDumpLevels (const Standard_Integer def,const Standard_Integer max);

		/****************** WriteFile ******************/
		%feature("compactdefaultargs") WriteFile;
		%feature("autodoc", "* Gives the way to Write a File from a Model. <ctx> contains all necessary informations : the model, the protocol, the file name, and the list of File Modifiers to be applied, also with restricted list of selected entities for each one, if required. In return, it brings the produced check-list //! The WorkLibrary has to query <applied> to get then run the ContextWrite by looping like this (example) : for (numap = 1; numap <= ctx.NbModifiers(); numap ++) { ctx.SetModifier (numap); cast ctx.FileModifier() to specific type -> variable filemod if (!filemod.IsNull()) filemod->Perform (ctx,writer); filemod then works with ctx. It can, either act on the model itself (for instance on its header), or iterate on selected entities (Start/Next/More/Value) it can call AddFail or AddWarning, as necessary }
	:param ctx:
	:type ctx: IFSelect_ContextWrite
	:rtype: bool") WriteFile;
		virtual Standard_Boolean WriteFile (IFSelect_ContextWrite & ctx);

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
		/****************** AddItem ******************/
		%feature("compactdefaultargs") AddItem;
		%feature("autodoc", "* Adds an Item and returns its attached Ident. Does nothing if <item> is already recorded (and returns its attached Ident) <active> if True commands call to SetActive (see below) Remark : the determined Ident is used if <item> is a Dispatch, to fill the ShareOut
	:param item:
	:type item: Standard_Transient
	:param active: default value is Standard_True
	:type active: bool
	:rtype: int") AddItem;
		Standard_Integer AddItem (const opencascade::handle<Standard_Transient> & item,const Standard_Boolean active = Standard_True);

		/****************** AddNamedItem ******************/
		%feature("compactdefaultargs") AddNamedItem;
		%feature("autodoc", "* Adds an Item with an attached Name. If the Name is already known in the WorkSession, the older item losts it Returns Ident if Done, 0 else, i.e. if <item> is null If <name> is empty, works as AddItem (i.e. with no name) If <item> is already known but with no attached Name, this method tries to attached a Name to it <active> if True commands call to SetActive (see below)
	:param name:
	:type name: char *
	:param item:
	:type item: Standard_Transient
	:param active: default value is Standard_True
	:type active: bool
	:rtype: int") AddNamedItem;
		Standard_Integer AddNamedItem (const char * name,const opencascade::handle<Standard_Transient> & item,const Standard_Boolean active = Standard_True);

		/****************** AppliedDispatches ******************/
		%feature("compactdefaultargs") AppliedDispatches;
		%feature("autodoc", "* Returns the ordered list of dispatches stored by the ShareOut
	:rtype: opencascade::handle<TColStd_HSequenceOfInteger>") AppliedDispatches;
		opencascade::handle<TColStd_HSequenceOfInteger> AppliedDispatches ();

		/****************** BeginSentFiles ******************/
		%feature("compactdefaultargs") BeginSentFiles;
		%feature("autodoc", "* Commands file sending to clear the list of already sent files, commands to record a new one if <record> is True This list is managed by the ModelCopier when SendSplit is called It allows a global exploitation of the set of sent files
	:param record:
	:type record: bool
	:rtype: None") BeginSentFiles;
		void BeginSentFiles (const Standard_Boolean record);

		/****************** CategoryName ******************/
		%feature("compactdefaultargs") CategoryName;
		%feature("autodoc", "* Returns the Category Name determined for an entity it is computed by the class Category Remark : an unknown entity gives an empty string
	:param ent:
	:type ent: Standard_Transient
	:rtype: char *") CategoryName;
		const char * CategoryName (const opencascade::handle<Standard_Transient> & ent);

		/****************** CategoryNumber ******************/
		%feature("compactdefaultargs") CategoryNumber;
		%feature("autodoc", "* Returns the Category Number determined for an entity it is computed by the class Category An unknown entity (number 0) gives a value -1
	:param ent:
	:type ent: Standard_Transient
	:rtype: int") CategoryNumber;
		Standard_Integer CategoryNumber (const opencascade::handle<Standard_Transient> & ent);

		/****************** ChangeModifierRank ******************/
		%feature("compactdefaultargs") ChangeModifierRank;
		%feature("autodoc", "* Changes the Rank of a Modifier in the Session : Model Modifiers if <formodel> is True, File Modifiers else the Modifier n0 <before> is put to n0 <after> Return True if Done, False if <before> or <after> out of range
	:param formodel:
	:type formodel: bool
	:param before:
	:type before: int
	:param after:
	:type after: int
	:rtype: bool") ChangeModifierRank;
		Standard_Boolean ChangeModifierRank (const Standard_Boolean formodel,const Standard_Integer before,const Standard_Integer after);

		/****************** CheckOne ******************/
		%feature("compactdefaultargs") CheckOne;
		%feature("autodoc", "* Returns a Check for a single entity, under the form of a CheckIterator (this gives only one form for the user) if <ent> is Null or equates the current Model, it gives the Global Check, else the Check for the given entity <complete> as for ModelCheckList
	:param ent:
	:type ent: Standard_Transient
	:param complete: default value is Standard_True
	:type complete: bool
	:rtype: Interface_CheckIterator") CheckOne;
		Interface_CheckIterator CheckOne (const opencascade::handle<Standard_Transient> & ent,const Standard_Boolean complete = Standard_True);

		/****************** ClearData ******************/
		%feature("compactdefaultargs") ClearData;
		%feature("autodoc", "* Clears recorded data (not the items) according mode : 1 : all Data : Model, Graph, CheckList, + ClearData 4 2 : Graph and CheckList (they will then be recomputed later) 3 : CheckList (it will be recomputed by ComputeCheck) 4 : just content of SelectPointed and Counters Plus 0 : does nothing but called by SetModel ClearData is virtual, hence it can be redefined to clear other data of a specialised Work Session
	:param mode:
	:type mode: int
	:rtype: void") ClearData;
		virtual void ClearData (const Standard_Integer mode);

		/****************** ClearFile ******************/
		%feature("compactdefaultargs") ClearFile;
		%feature("autodoc", "* Erases all stored data from the File Evaluation (i.e. ALL former naming informations are lost)
	:rtype: None") ClearFile;
		void ClearFile ();

		/****************** ClearFinalModifiers ******************/
		%feature("compactdefaultargs") ClearFinalModifiers;
		%feature("autodoc", "* Removes all the Modifiers active in the ModelCopier : they become inactive and they are removed from the Session
	:rtype: None") ClearFinalModifiers;
		void ClearFinalModifiers ();

		/****************** ClearItems ******************/
		%feature("compactdefaultargs") ClearItems;
		%feature("autodoc", "* Clears all the recorded Items : Selections, Dispatches, Modifiers, and Strings & IntParams, with their Idents & Names. Remark that if a Model has been loaded, it is not cleared.
	:rtype: None") ClearItems;
		void ClearItems ();

		/****************** ClearShareOut ******************/
		%feature("compactdefaultargs") ClearShareOut;
		%feature("autodoc", "* Clears the list of Dispatches recorded by the ShareOut if <only> disp is True, tha's all. Else, clears also the lists of Modifiers recorded by the ShareOut
	:param onlydisp:
	:type onlydisp: bool
	:rtype: None") ClearShareOut;
		void ClearShareOut (const Standard_Boolean onlydisp);

		/****************** CombineAdd ******************/
		%feature("compactdefaultargs") CombineAdd;
		%feature("autodoc", "* Adds an input selection to a SelectCombine (Union or Inters.). Returns new count of inputs for this SelectCombine if Done or 0 if <sel> is not kind of SelectCombine, or if <seladd> or <sel> is not in the WorkSession By default, adding is done at the end of the list Else, it is an insertion to rank <atnum> (usefull for Un-ReDo)
	:param selcomb:
	:type selcomb: IFSelect_Selection
	:param seladd:
	:type seladd: IFSelect_Selection
	:param atnum: default value is 0
	:type atnum: int
	:rtype: int") CombineAdd;
		Standard_Integer CombineAdd (const opencascade::handle<IFSelect_Selection> & selcomb,const opencascade::handle<IFSelect_Selection> & seladd,const Standard_Integer atnum = 0);

		/****************** CombineRemove ******************/
		%feature("compactdefaultargs") CombineRemove;
		%feature("autodoc", "* Removes an input selection from a SelectCombine (Union or Intersection). Returns True if done, False if <selcomb> is not kind of SelectCombine or <selrem> is not source of <selcomb>
	:param selcomb:
	:type selcomb: IFSelect_Selection
	:param selrem:
	:type selrem: IFSelect_Selection
	:rtype: bool") CombineRemove;
		Standard_Boolean CombineRemove (const opencascade::handle<IFSelect_Selection> & selcomb,const opencascade::handle<IFSelect_Selection> & selrem);

		/****************** ComputeCheck ******************/
		%feature("compactdefaultargs") ComputeCheck;
		%feature("autodoc", "* Computes the CheckList for the Model currently loaded It can then be used for displays, querries ... Returns True if OK, False else (i.e. no Protocol set, or Model absent). If <enforce> is False, works only if not already done or if a new Model has been loaded from last call. Remark : computation is enforced by every call to SetModel or RunTransformer
	:param enforce: default value is Standard_False
	:type enforce: bool
	:rtype: bool") ComputeCheck;
		Standard_Boolean ComputeCheck (const Standard_Boolean enforce = Standard_False);

		/****************** ComputeCounter ******************/
		%feature("compactdefaultargs") ComputeCounter;
		%feature("autodoc", "* Computes the content of a SignCounter when it is defined with a Selection, then returns True Returns False if the SignCounter is not defined with a Selection, or if its Selection Mode is inhibited <forced> to work around optimisations
	:param counter:
	:type counter: IFSelect_SignCounter
	:param forced: default value is Standard_False
	:type forced: bool
	:rtype: bool") ComputeCounter;
		Standard_Boolean ComputeCounter (const opencascade::handle<IFSelect_SignCounter> & counter,const Standard_Boolean forced = Standard_False);

		/****************** ComputeCounterFromList ******************/
		%feature("compactdefaultargs") ComputeCounterFromList;
		%feature("autodoc", "* Computes the content of a SignCounter from an input list If <list> is Null, uses internal definition of the Counter : a Selection, else the whole Model (recomputation forced) If <clear> is True (D), starts from scratch Else, cumulates computations
	:param counter:
	:type counter: IFSelect_SignCounter
	:param list:
	:type list: TColStd_HSequenceOfTransient
	:param clear: default value is Standard_True
	:type clear: bool
	:rtype: bool") ComputeCounterFromList;
		Standard_Boolean ComputeCounterFromList (const opencascade::handle<IFSelect_SignCounter> & counter,const opencascade::handle<TColStd_HSequenceOfTransient> & list,const Standard_Boolean clear = Standard_True);

		/****************** ComputeGraph ******************/
		%feature("compactdefaultargs") ComputeGraph;
		%feature("autodoc", "* Computes the Graph used for Selections, Displays ... If a HGraph is already set, with same model as given by method Model, does nothing. Else, computes a new Graph. If <enforce> is given True, computes a new Graph anyway. Remark that a call to ClearGraph will cause ComputeGraph to really compute a new Graph Returns True if Graph is OK, False else (i.e. if no Protocol is set, or if Model is absent or empty).
	:param enforce: default value is Standard_False
	:type enforce: bool
	:rtype: bool") ComputeGraph;
		Standard_Boolean ComputeGraph (const Standard_Boolean enforce = Standard_False);

		/****************** DefaultFileRoot ******************/
		%feature("compactdefaultargs") DefaultFileRoot;
		%feature("autodoc", "* Returns the defined Default File Root. It is used for Dispatches which have no specific root attached. Null Handle if not defined
	:rtype: opencascade::handle<TCollection_HAsciiString>") DefaultFileRoot;
		opencascade::handle<TCollection_HAsciiString> DefaultFileRoot ();

		/****************** Dispatch ******************/
		%feature("compactdefaultargs") Dispatch;
		%feature("autodoc", "* Returns a Dispatch, given its Ident in the Session Null result if <id> is not suitable for a Dispatch (undefined, or defined for another kind of variable)
	:param id:
	:type id: int
	:rtype: opencascade::handle<IFSelect_Dispatch>") Dispatch;
		opencascade::handle<IFSelect_Dispatch> Dispatch (const Standard_Integer id);

		/****************** DispatchRank ******************/
		%feature("compactdefaultargs") DispatchRank;
		%feature("autodoc", "* Returns the rank of a Dispatch in the ShareOut, or 0 if <disp> is not in the ShareOut or not in the WorkSession
	:param disp:
	:type disp: IFSelect_Dispatch
	:rtype: int") DispatchRank;
		Standard_Integer DispatchRank (const opencascade::handle<IFSelect_Dispatch> & disp);

		/****************** DumpEntity ******************/
		%feature("compactdefaultargs") DumpEntity;
		%feature("autodoc", "* Dumps a starting entity according to the current norm. To do this, it calls DumpEntity from WorkLibrary. <level> is to be interpreted for each norm : see specific classes of WorkLibrary for it. Generally, 0 if for very basic (only type ...), greater values give more and more details.
	:param ent:
	:type ent: Standard_Transient
	:param level:
	:type level: int
	:param S:
	:type S: Message_Messenger
	:rtype: None") DumpEntity;
		void DumpEntity (const opencascade::handle<Standard_Transient> & ent,const Standard_Integer level,const opencascade::handle<Message_Messenger> & S);

		/****************** DumpModel ******************/
		%feature("compactdefaultargs") DumpModel;
		%feature("autodoc", "* Lists the content of the Input Model (if there is one) According level : 0 -> gives only count of Entities and Roots 1 -> Lists also Roots; 2 -> Lists all Entities (by TraceType) 3 -> Performs a call to CheckList (Fails) and lists the result 4 -> as 3 but all CheckList (Fails + Warnings) 5,6,7 : as 3 but resp. Count,List,Labels by Fail 8,9,10 : as 4 but resp. Count,List,Labels by message
	:param level:
	:type level: int
	:param S:
	:type S: Message_Messenger
	:rtype: None") DumpModel;
		void DumpModel (const Standard_Integer level,const opencascade::handle<Message_Messenger> & S);

		/****************** DumpSelection ******************/
		%feature("compactdefaultargs") DumpSelection;
		%feature("autodoc", "* Lists a Selection and its Sources (see SelectionIterator), given its rank in the list
	:param sel:
	:type sel: IFSelect_Selection
	:rtype: None") DumpSelection;
		void DumpSelection (const opencascade::handle<IFSelect_Selection> & sel);

		/****************** DumpShare ******************/
		%feature("compactdefaultargs") DumpShare;
		%feature("autodoc", "* Dumps contents of the ShareOut (on 'cout')
	:rtype: None") DumpShare;
		void DumpShare ();

		/****************** EntityLabel ******************/
		%feature("compactdefaultargs") EntityLabel;
		%feature("autodoc", "* Returns the label for <ent>, as the Model does If <ent> is not in the Model or if no Model is loaded, a Null Handle is returned
	:param ent:
	:type ent: Standard_Transient
	:rtype: opencascade::handle<TCollection_HAsciiString>") EntityLabel;
		opencascade::handle<TCollection_HAsciiString> EntityLabel (const opencascade::handle<Standard_Transient> & ent);

		/****************** EntityName ******************/
		%feature("compactdefaultargs") EntityName;
		%feature("autodoc", "* Returns the Name of an Entity This Name is computed by the general service Name Returns a Null Handle if fails
	:param ent:
	:type ent: Standard_Transient
	:rtype: opencascade::handle<TCollection_HAsciiString>") EntityName;
		opencascade::handle<TCollection_HAsciiString> EntityName (const opencascade::handle<Standard_Transient> & ent);

		/****************** EvalSelection ******************/
		%feature("compactdefaultargs") EvalSelection;
		%feature("autodoc", "* Evaluates the effect of a Selection applied on the input Model Returned Result remains empty if no input Model has been set
	:param sel:
	:type sel: IFSelect_Selection
	:rtype: Interface_EntityIterator") EvalSelection;
		Interface_EntityIterator EvalSelection (const opencascade::handle<IFSelect_Selection> & sel);

		/****************** EvalSplit ******************/
		%feature("compactdefaultargs") EvalSplit;
		%feature("autodoc", "* Returns an Evaluation of the whole ShareOut definition : i.e. how the entities of the starting model are forecast to be sent to various files : list of packets according the dispatches, effective lists of roots for each packet (which determine the content of the corresponding file); plus evaluation of which entities are : forgotten (sent into no file), duplicated (sent into more than one file), sent into a given file. See the class PacketList for more details.
	:rtype: opencascade::handle<IFSelect_PacketList>") EvalSplit;
		opencascade::handle<IFSelect_PacketList> EvalSplit ();

		/****************** EvaluateComplete ******************/
		%feature("compactdefaultargs") EvaluateComplete;
		%feature("autodoc", "* Displays the effect of applying the ShareOut on the input Model. <mode> = 0 (default) : displays only roots for each packet, <mode> = 1 : displays all entities for each packet, plus duplicated entities <mode> = 2 : same as <mode> = 1, plus displays forgotten entities (which are in no packet at all)
	:param mode: default value is 0
	:type mode: int
	:rtype: None") EvaluateComplete;
		void EvaluateComplete (const Standard_Integer mode = 0);

		/****************** EvaluateDispatch ******************/
		%feature("compactdefaultargs") EvaluateDispatch;
		%feature("autodoc", "* Displays the result of applying a Dispatch on the input Model (also shows Remainder if there is) <mode> = 0 (default), displays nothing else <mode> = 1 : displays also duplicated entities (because of this dispatch) <mode> = 2 : displays the entities of the starting Model which are not taken by this dispatch (forgotten entities) <mode> = 3 : displays both duplicated and forgotten entities Remark : EvaluateComplete displays these data evaluated for for all the dispatches, if there are several
	:param disp:
	:type disp: IFSelect_Dispatch
	:param mode: default value is 0
	:type mode: int
	:rtype: None") EvaluateDispatch;
		void EvaluateDispatch (const opencascade::handle<IFSelect_Dispatch> & disp,const Standard_Integer mode = 0);

		/****************** EvaluateFile ******************/
		%feature("compactdefaultargs") EvaluateFile;
		%feature("autodoc", "* Performs and stores a File Evaluation. The Results are a List of produced Models and a List of names (Strings), in parallel Fills LastRunCheckList
	:rtype: None") EvaluateFile;
		void EvaluateFile ();

		/****************** EvaluateSelection ******************/
		%feature("compactdefaultargs") EvaluateSelection;
		%feature("autodoc", "* Displays the list of Entities selected by a Selection (i.e. the result of EvalSelection).
	:param sel:
	:type sel: IFSelect_Selection
	:rtype: None") EvaluateSelection;
		void EvaluateSelection (const opencascade::handle<IFSelect_Selection> & sel);

		/****************** FileExtension ******************/
		%feature("compactdefaultargs") FileExtension;
		%feature("autodoc", "* Returns the defined File Extension. Null Handle if not defined
	:rtype: opencascade::handle<TCollection_HAsciiString>") FileExtension;
		opencascade::handle<TCollection_HAsciiString> FileExtension ();

		/****************** FileModel ******************/
		%feature("compactdefaultargs") FileModel;
		%feature("autodoc", "* Returns a Model, given its rank in the Evaluation List
	:param num:
	:type num: int
	:rtype: opencascade::handle<Interface_InterfaceModel>") FileModel;
		opencascade::handle<Interface_InterfaceModel> FileModel (const Standard_Integer num);

		/****************** FileName ******************/
		%feature("compactdefaultargs") FileName;
		%feature("autodoc", "* Returns the name of a file corresponding to a produced Model, given its rank in the Evaluation List
	:param num:
	:type num: int
	:rtype: TCollection_AsciiString") FileName;
		TCollection_AsciiString FileName (const Standard_Integer num);

		/****************** FilePrefix ******************/
		%feature("compactdefaultargs") FilePrefix;
		%feature("autodoc", "* Returns the defined File Prefix. Null Handle if not defined
	:rtype: opencascade::handle<TCollection_HAsciiString>") FilePrefix;
		opencascade::handle<TCollection_HAsciiString> FilePrefix ();

		/****************** FileRoot ******************/
		%feature("compactdefaultargs") FileRoot;
		%feature("autodoc", "* Returns the File Root defined for a Dispatch. Null if no Root Name is defined for it (hence, no File will be produced)
	:param disp:
	:type disp: IFSelect_Dispatch
	:rtype: opencascade::handle<TCollection_HAsciiString>") FileRoot;
		opencascade::handle<TCollection_HAsciiString> FileRoot (const opencascade::handle<IFSelect_Dispatch> & disp);

		/****************** FinalModifierIdents ******************/
		%feature("compactdefaultargs") FinalModifierIdents;
		%feature("autodoc", "* Fills a Sequence with a list of Idents, those attached to the Modifiers applied to final sending. Model Modifiers if <formodel> is True, File Modifiers else This list is given in the order in which they will be applied (which takes into account the Changes to Modifier Ranks)
	:param formodel:
	:type formodel: bool
	:rtype: opencascade::handle<TColStd_HSequenceOfInteger>") FinalModifierIdents;
		opencascade::handle<TColStd_HSequenceOfInteger> FinalModifierIdents (const Standard_Boolean formodel);

		/****************** GeneralModifier ******************/
		%feature("compactdefaultargs") GeneralModifier;
		%feature("autodoc", "* Returns a Modifier, given its Ident in the Session Null result if <id> is not suitable for a Modifier (undefined, or defined for another kind of variable)
	:param id:
	:type id: int
	:rtype: opencascade::handle<IFSelect_GeneralModifier>") GeneralModifier;
		opencascade::handle<IFSelect_GeneralModifier> GeneralModifier (const Standard_Integer id);

		/****************** GetModeStat ******************/
		%feature("compactdefaultargs") GetModeStat;
		%feature("autodoc", "* Return value of mode defining of filling selection during loading
	:rtype: bool") GetModeStat;
		Standard_Boolean GetModeStat ();

		/****************** GiveFileComplete ******************/
		%feature("compactdefaultargs") GiveFileComplete;
		%feature("autodoc", "* Completes a file name as required, with Prefix and Extension (if defined; for a non-defined item, completes nothing)
	:param file:
	:type file: char *
	:rtype: char *") GiveFileComplete;
		const char * GiveFileComplete (const char * file);

		/****************** GiveFileRoot ******************/
		%feature("compactdefaultargs") GiveFileRoot;
		%feature("autodoc", "* Extracts File Root Name from a given complete file name (uses OSD_Path)
	:param file:
	:type file: char *
	:rtype: char *") GiveFileRoot;
		const char * GiveFileRoot (const char * file);

		/****************** GiveList ******************/
		%feature("compactdefaultargs") GiveList;
		%feature("autodoc", "* Determines a list of entities from an object : <obj> already HSequenceOfTransient : returned itself <obj> Selection : its Result of Evaluation is returned <obj> an entity of the Model : a HSequence which contains it else, an empty HSequence <obj> the Model it self : ALL its content (not only the roots)
	:param obj:
	:type obj: Standard_Transient
	:rtype: opencascade::handle<TColStd_HSequenceOfTransient>") GiveList;
		opencascade::handle<TColStd_HSequenceOfTransient> GiveList (const opencascade::handle<Standard_Transient> & obj);

		/****************** GiveList ******************/
		%feature("compactdefaultargs") GiveList;
		%feature("autodoc", "* Computes a List of entities from two alphanums, first and second, as follows : if <first> is a Number or Label of an entity : this entity if <first> is a list of Numbers/Labels : the list of entities if <first> is the name of a Selection in <WS>, and <second> not defined, the standard result of this Selection else, let's consider 'first second' : this whole phrase is splitted by blanks, as follows (RECURSIVE CALL) : - the leftest term is the final selection - the other terms define the result of the selection - and so on (the 'leftest minus one' is a selection, of which the input is given by the remaining ...)
	:param first:
	:type first: char *
	:param second: default value is ""
	:type second: char *
	:rtype: opencascade::handle<TColStd_HSequenceOfTransient>") GiveList;
		opencascade::handle<TColStd_HSequenceOfTransient> GiveList (const char * first,const char * second = "");

		/****************** GiveListCombined ******************/
		%feature("compactdefaultargs") GiveListCombined;
		%feature("autodoc", "* Combines two lists and returns the result, according to mode : <mode> < 0 : entities in <l1> AND NOT in <l2> <mode> = 0 : entities in <l1> AND in <l2> <mode> > 0 : entities in <l1> OR in <l2>
	:param l1:
	:type l1: TColStd_HSequenceOfTransient
	:param l2:
	:type l2: TColStd_HSequenceOfTransient
	:param mode:
	:type mode: int
	:rtype: opencascade::handle<TColStd_HSequenceOfTransient>") GiveListCombined;
		opencascade::handle<TColStd_HSequenceOfTransient> GiveListCombined (const opencascade::handle<TColStd_HSequenceOfTransient> & l1,const opencascade::handle<TColStd_HSequenceOfTransient> & l2,const Standard_Integer mode);

		/****************** GiveListFromList ******************/
		%feature("compactdefaultargs") GiveListFromList;
		%feature("autodoc", "* Computes a List of entities from the model as follows <first> beeing a Selection or a combination of Selections, <ent> beeing an entity or a list of entities (as a HSequenceOfTransient) : the standard result of this selection applied to this list if <ent> is Null, the standard definition of the selection is used (which contains a default input selection) if <selname> is erroneous, a null handle is returned //! REMARK : selname is processed as <first second> of preceeding GiveList
	:param selname:
	:type selname: char *
	:param ent:
	:type ent: Standard_Transient
	:rtype: opencascade::handle<TColStd_HSequenceOfTransient>") GiveListFromList;
		opencascade::handle<TColStd_HSequenceOfTransient> GiveListFromList (const char * selname,const opencascade::handle<Standard_Transient> & ent);

		/****************** GiveSelection ******************/
		%feature("compactdefaultargs") GiveSelection;
		%feature("autodoc", "* Returns a Selection from a Name : - the name of a Selection : this Selection - the name of a Signature + criteria between (..) : a new Selection from this Signature - an entity or a list of entities : a new SelectPointed Else, returns a Null Handle
	:param selname:
	:type selname: char *
	:rtype: opencascade::handle<IFSelect_Selection>") GiveSelection;
		opencascade::handle<IFSelect_Selection> GiveSelection (const char * selname);

		/****************** Graph ******************/
		%feature("compactdefaultargs") Graph;
		%feature("autodoc", "* Returns the Computed Graph, for Read only
	:rtype: Interface_Graph") Graph;
		const Interface_Graph & Graph ();

		/****************** HGraph ******************/
		%feature("compactdefaultargs") HGraph;
		%feature("autodoc", "* Returns the Computed Graph as HGraph (Null Handle if not set)
	:rtype: opencascade::handle<Interface_HGraph>") HGraph;
		opencascade::handle<Interface_HGraph> HGraph ();

		/****************** HasModel ******************/
		%feature("compactdefaultargs") HasModel;
		%feature("autodoc", "* Returns True is a Model has been set
	:rtype: bool") HasModel;
		Standard_Boolean HasModel ();

		/****************** HasName ******************/
		%feature("compactdefaultargs") HasName;
		%feature("autodoc", "* Returns True if an Item of the WorkSession has an attached Name
	:param item:
	:type item: Standard_Transient
	:rtype: bool") HasName;
		Standard_Boolean HasName (const opencascade::handle<Standard_Transient> & item);

		/****************** IFSelect_WorkSession ******************/
		%feature("compactdefaultargs") IFSelect_WorkSession;
		%feature("autodoc", "* Creates a Work Session It provides default, empty ShareOut and ModelCopier, which can be replaced (if required, should be done just after creation).
	:rtype: None") IFSelect_WorkSession;
		 IFSelect_WorkSession ();

		/****************** IntParam ******************/
		%feature("compactdefaultargs") IntParam;
		%feature("autodoc", "* Returns an IntParam, given its Ident in the Session Null result if <id> is not suitable for an IntParam (undefined, or defined for another kind of variable)
	:param id:
	:type id: int
	:rtype: opencascade::handle<IFSelect_IntParam>") IntParam;
		opencascade::handle<IFSelect_IntParam> IntParam (const Standard_Integer id);

		/****************** IntValue ******************/
		%feature("compactdefaultargs") IntValue;
		%feature("autodoc", "* Returns Integer Value of an IntParam
	:param it:
	:type it: IFSelect_IntParam
	:rtype: int") IntValue;
		Standard_Integer IntValue (const opencascade::handle<IFSelect_IntParam> & it);

		/****************** IsLoaded ******************/
		%feature("compactdefaultargs") IsLoaded;
		%feature("autodoc", "* Returns True if a Model is defined and really loaded (not empty), a Protocol is set and a Graph has been computed. In this case, the WorkSession can start to work
	:rtype: bool") IsLoaded;
		Standard_Boolean IsLoaded ();

		/****************** IsReversedSelectExtract ******************/
		%feature("compactdefaultargs") IsReversedSelectExtract;
		%feature("autodoc", "* Returns True if <sel> a Reversed SelectExtract, False else
	:param sel:
	:type sel: IFSelect_Selection
	:rtype: bool") IsReversedSelectExtract;
		Standard_Boolean IsReversedSelectExtract (const opencascade::handle<IFSelect_Selection> & sel);

		/****************** Item ******************/
		%feature("compactdefaultargs") Item;
		%feature("autodoc", "* Returns an Item, given its Ident. Returns a Null Handle if no Item corresponds to this Ident.
	:param id:
	:type id: int
	:rtype: opencascade::handle<Standard_Transient>") Item;
		opencascade::handle<Standard_Transient> Item (const Standard_Integer id);

		/****************** ItemIdent ******************/
		%feature("compactdefaultargs") ItemIdent;
		%feature("autodoc", "* Returns the Ident attached to an Item in the WorkSession, or Zero if it is unknown
	:param item:
	:type item: Standard_Transient
	:rtype: int") ItemIdent;
		Standard_Integer ItemIdent (const opencascade::handle<Standard_Transient> & item);

		/****************** ItemIdents ******************/
		%feature("compactdefaultargs") ItemIdents;
		%feature("autodoc", "* Fills a Sequence with the List of Idents attached to the Items of which Type complies with (IsKind) <type> (alphabetic order) Remark : <type> = TYPE(Standard_Transient) gives all the Idents which are suitable in the WorkSession
	:param type:
	:type type: Standard_Type
	:rtype: opencascade::handle<TColStd_HSequenceOfInteger>") ItemIdents;
		opencascade::handle<TColStd_HSequenceOfInteger> ItemIdents (const opencascade::handle<Standard_Type> & type);

		/****************** ItemLabel ******************/
		%feature("compactdefaultargs") ItemLabel;
		%feature("autodoc", "* Returns a Label which illustrates the content of an Item, given its Ident. This Label is : - for a Text Parameter, 'Text:<text value>' - for an Integer Parameter, 'Integer:<integer value>' - for a Selection, a Dispatch or a Modifier, its Label (see these classes) - for any other kind of Variable, its cdl type
	:param id:
	:type id: int
	:rtype: opencascade::handle<TCollection_HAsciiString>") ItemLabel;
		opencascade::handle<TCollection_HAsciiString> ItemLabel (const Standard_Integer id);

		/****************** ItemNames ******************/
		%feature("compactdefaultargs") ItemNames;
		%feature("autodoc", "* Fills a Sequence with the list of the Names attached to Items of which Type complies with (IsKind) <type> (alphabetic order) Remark : <type> = TYPE(Standard_Transient) gives all the Names
	:param type:
	:type type: Standard_Type
	:rtype: opencascade::handle<TColStd_HSequenceOfHAsciiString>") ItemNames;
		opencascade::handle<TColStd_HSequenceOfHAsciiString> ItemNames (const opencascade::handle<Standard_Type> & type);

		/****************** ItemNamesForLabel ******************/
		%feature("compactdefaultargs") ItemNamesForLabel;
		%feature("autodoc", "* Fills a Sequence with the NAMES of the control items, of which the label matches <label> (contain it) : see NextIdentForLabel Search mode is fixed to 'contained' If <label> is empty, returns all Names
	:param label:
	:type label: char *
	:rtype: opencascade::handle<TColStd_HSequenceOfHAsciiString>") ItemNamesForLabel;
		opencascade::handle<TColStd_HSequenceOfHAsciiString> ItemNamesForLabel (const char * label);

		/****************** ItemSelection ******************/
		%feature("compactdefaultargs") ItemSelection;
		%feature("autodoc", "* Returns the Selection of a Dispatch or a GeneralModifier. Returns a Null Handle if none is defined or <item> not good type
	:param item:
	:type item: Standard_Transient
	:rtype: opencascade::handle<IFSelect_Selection>") ItemSelection;
		opencascade::handle<IFSelect_Selection> ItemSelection (const opencascade::handle<Standard_Transient> & item);

		/****************** LastRunCheckList ******************/
		%feature("compactdefaultargs") LastRunCheckList;
		%feature("autodoc", "* Returns the Check List produced by the last execution of either : EvaluateFile(for Split), SendSplit, SendAll, SendSelected, RunTransformer-RunModifier Cleared by SetModel or ClearData(1) The field is protected, hence a specialized WorkSession may fill it
	:rtype: Interface_CheckIterator") LastRunCheckList;
		Interface_CheckIterator LastRunCheckList ();

		/****************** ListEntities ******************/
		%feature("compactdefaultargs") ListEntities;
		%feature("autodoc", "* Internal method which displays an EntityIterator <mode> 0 gives short display (only entity numbers) 1 gives a more complete trace (1 line per Entity) (can be used each time a trace has to be output from a list) 2 gives a form suitable for givelist : (n1,n2,n3...)
	:param iter:
	:type iter: Interface_EntityIterator
	:param mode:
	:type mode: int
	:rtype: None") ListEntities;
		void ListEntities (const Interface_EntityIterator & iter,const Standard_Integer mode);

		/****************** ListFinalModifiers ******************/
		%feature("compactdefaultargs") ListFinalModifiers;
		%feature("autodoc", "* Lists the Modifiers of the session (for each one, displays its Label). Listing is done following Ranks (Modifiers are invoked following their ranks) Model Modifiers if <formodel> is True, File Modifiers else
	:param formodel:
	:type formodel: bool
	:rtype: None") ListFinalModifiers;
		void ListFinalModifiers (const Standard_Boolean formodel);

		/****************** ListItems ******************/
		%feature("compactdefaultargs") ListItems;
		%feature("autodoc", "* Lists the Labels of all Items of the WorkSession If <label> is defined, lists labels which contain it
	:param label: default value is ""
	:type label: char *
	:rtype: None") ListItems;
		void ListItems (const char * label = "");

		/****************** LoadedFile ******************/
		%feature("compactdefaultargs") LoadedFile;
		%feature("autodoc", "* Returns the filename used to load current model empty if unknown
	:rtype: char *") LoadedFile;
		const char * LoadedFile ();

		/****************** MaxIdent ******************/
		%feature("compactdefaultargs") MaxIdent;
		%feature("autodoc", "* Returns the Maximum Value for an Item Identifier. It can be greater to the count of known Items, because some can have been removed
	:rtype: int") MaxIdent;
		Standard_Integer MaxIdent ();

		/****************** MaxSendingCount ******************/
		%feature("compactdefaultargs") MaxSendingCount;
		%feature("autodoc", "* Returns the greater count of different files in which any of the starting entities could be sent. Before any file output, this count is 0. Ideal count is 1. More than 1 means that duplications occur.
	:rtype: int") MaxSendingCount;
		Standard_Integer MaxSendingCount ();

		/****************** Model ******************/
		%feature("compactdefaultargs") Model;
		%feature("autodoc", "* Returns the Model of the Work Session (Null Handle if none) should be C++ : return const &
	:rtype: opencascade::handle<Interface_InterfaceModel>") Model;
		const opencascade::handle<Interface_InterfaceModel> & Model ();

		/****************** ModelCheckList ******************/
		%feature("compactdefaultargs") ModelCheckList;
		%feature("autodoc", "* Returns the Check List for the Model currently loaded : <complete> = True : complete (syntactic & semantic messages), computed if not yet done <complete> = False : only syntactic (check file form)
	:param complete: default value is Standard_True
	:type complete: bool
	:rtype: Interface_CheckIterator") ModelCheckList;
		Interface_CheckIterator ModelCheckList (const Standard_Boolean complete = Standard_True);

		/****************** ModelCopier ******************/
		%feature("compactdefaultargs") ModelCopier;
		%feature("autodoc", "* Gives access to the complete ModelCopier
	:rtype: opencascade::handle<IFSelect_ModelCopier>") ModelCopier;
		const opencascade::handle<IFSelect_ModelCopier> & ModelCopier ();

		/****************** ModelModifier ******************/
		%feature("compactdefaultargs") ModelModifier;
		%feature("autodoc", "* Returns a Model Modifier, given its Ident in the Session, i.e. typed as a Modifier (not simply a GeneralModifier) Null result if <id> is not suitable for a Modifier (undefined, or defined for another kind of variable)
	:param id:
	:type id: int
	:rtype: opencascade::handle<IFSelect_Modifier>") ModelModifier;
		opencascade::handle<IFSelect_Modifier> ModelModifier (const Standard_Integer id);

		/****************** ModifierRank ******************/
		%feature("compactdefaultargs") ModifierRank;
		%feature("autodoc", "* Returns the Rank of a Modifier given its Ident. Model or File Modifier according its type (ModelModifier or not) Remember that Modifiers are applied sequencially following their Rank : first Model Modifiers then File Modifiers Rank is given by rank of call to AddItem and can be changed by ChangeModifierRank
	:param item:
	:type item: IFSelect_GeneralModifier
	:rtype: int") ModifierRank;
		Standard_Integer ModifierRank (const opencascade::handle<IFSelect_GeneralModifier> & item);

		/****************** Name ******************/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "* Returns the Name attached to an Item as a Variable of this WorkSession. If <item> is Null or not recorded, returns an empty string.
	:param item:
	:type item: Standard_Transient
	:rtype: opencascade::handle<TCollection_HAsciiString>") Name;
		opencascade::handle<TCollection_HAsciiString> Name (const opencascade::handle<Standard_Transient> & item);

		/****************** NameIdent ******************/
		%feature("compactdefaultargs") NameIdent;
		%feature("autodoc", "* Returns the Ident attached to a Name, 0 if name not recorded
	:param name:
	:type name: char *
	:rtype: int") NameIdent;
		Standard_Integer NameIdent (const char * name);

		/****************** NamedItem ******************/
		%feature("compactdefaultargs") NamedItem;
		%feature("autodoc", "* Returns the Item which corresponds to a Variable, given its Name (whatever the type of this Item). Returns a Null Handle if this Name is not recorded
	:param name:
	:type name: char *
	:rtype: opencascade::handle<Standard_Transient>") NamedItem;
		opencascade::handle<Standard_Transient> NamedItem (const char * name);

		/****************** NamedItem ******************/
		%feature("compactdefaultargs") NamedItem;
		%feature("autodoc", "* Same as above, but <name> is given through a Handle Especially Usefull with methods SelectionNames, etc...
	:param name:
	:type name: TCollection_HAsciiString
	:rtype: opencascade::handle<Standard_Transient>") NamedItem;
		opencascade::handle<Standard_Transient> NamedItem (const opencascade::handle<TCollection_HAsciiString> & name);

		/****************** NbFiles ******************/
		%feature("compactdefaultargs") NbFiles;
		%feature("autodoc", "* Returns the count of produced Models
	:rtype: int") NbFiles;
		Standard_Integer NbFiles ();

		/****************** NbFinalModifiers ******************/
		%feature("compactdefaultargs") NbFinalModifiers;
		%feature("autodoc", "* Returns the count of Modifiers applied to final sending Model Modifiers if <formodel> is True, File Modifiers else (i.e. Modifiers which apply once the Models have been filled)
	:param formodel:
	:type formodel: bool
	:rtype: int") NbFinalModifiers;
		Standard_Integer NbFinalModifiers (const Standard_Boolean formodel);

		/****************** NbSources ******************/
		%feature("compactdefaultargs") NbSources;
		%feature("autodoc", "* Returns the count of Input Selections known for a Selection, or 0 if <sel> not in the WorkSession. This count is one for a SelectDeduct / SelectExtract kind, two for SelectControl kind, variable for a SelectCombine (Union/Intersection), zero else
	:param sel:
	:type sel: IFSelect_Selection
	:rtype: int") NbSources;
		Standard_Integer NbSources (const opencascade::handle<IFSelect_Selection> & sel);

		/****************** NbStartingEntities ******************/
		%feature("compactdefaultargs") NbStartingEntities;
		%feature("autodoc", "* Returns the count of Entities stored in the Model, or 0
	:rtype: int") NbStartingEntities;
		Standard_Integer NbStartingEntities ();

		/****************** NewIntParam ******************/
		%feature("compactdefaultargs") NewIntParam;
		%feature("autodoc", "* Creates a new IntParam. A Name can be set (Optional) Returns the created IntParam, or a Null Handle in case of Failure (see AddItem/AddNamedItem)
	:param name: default value is ""
	:type name: char *
	:rtype: opencascade::handle<IFSelect_IntParam>") NewIntParam;
		opencascade::handle<IFSelect_IntParam> NewIntParam (const char * name = "");

		/****************** NewParamFromStatic ******************/
		%feature("compactdefaultargs") NewParamFromStatic;
		%feature("autodoc", "* Creates a parameter as being bound to a Static If the Static is Integer, this creates an IntParam bound to it by its name. Else this creates a String which is the value of the Static. Returns a null handle if <statname> is unknown as a Static
	:param statname:
	:type statname: char *
	:param name: default value is ""
	:type name: char *
	:rtype: opencascade::handle<Standard_Transient>") NewParamFromStatic;
		opencascade::handle<Standard_Transient> NewParamFromStatic (const char * statname,const char * name = "");

		/****************** NewSelectPointed ******************/
		%feature("compactdefaultargs") NewSelectPointed;
		%feature("autodoc", "* Creates a new Selection, of type SelectPointed, its content starts with <list>. A name must be given (can be empty)
	:param list:
	:type list: TColStd_HSequenceOfTransient
	:param name:
	:type name: char *
	:rtype: opencascade::handle<IFSelect_Selection>") NewSelectPointed;
		opencascade::handle<IFSelect_Selection> NewSelectPointed (const opencascade::handle<TColStd_HSequenceOfTransient> & list,const char * name);

		/****************** NewTextParam ******************/
		%feature("compactdefaultargs") NewTextParam;
		%feature("autodoc", "* Creates a new (empty) TextParam. A Name can be set (Optional) Returns the created TextParam (as an HAsciiString), or a Null Handle in case of Failure (see AddItem/AddNamedItem)
	:param name: default value is ""
	:type name: char *
	:rtype: opencascade::handle<TCollection_HAsciiString>") NewTextParam;
		opencascade::handle<TCollection_HAsciiString> NewTextParam (const char * name = "");

		/****************** NewTransformStandard ******************/
		%feature("compactdefaultargs") NewTransformStandard;
		%feature("autodoc", "* Creates and returns a TransformStandard, empty, with its Copy Option (True = Copy, False = On the Spot) and an optional name. To a TransformStandard, the method SetAppliedModifier applies
	:param copy:
	:type copy: bool
	:param name: default value is ""
	:type name: char *
	:rtype: opencascade::handle<IFSelect_Transformer>") NewTransformStandard;
		opencascade::handle<IFSelect_Transformer> NewTransformStandard (const Standard_Boolean copy,const char * name = "");

		/****************** NextIdentForLabel ******************/
		%feature("compactdefaultargs") NextIdentForLabel;
		%feature("autodoc", "* For query by Label with possible iterations Searches the Ident of which Item has a Label which matches a given one, the search starts from an initial Ident. Returns the first found Ident which follows <id>, or ZERO //! The search must start with <id> = 0, it returns the next Ident which matches. To iterate, call again this method which this returned value as <id>. Once an Ident has been returned, the Item can be obtained by the method Item //! <mode> precises the required matching mode : - 0 (Default) : <label> must match exactly with the Item Label - 1 : <label> must match the exact beginning (the end is free) - 2 : <label> must be at least once wherever in the Item Label - other values are ignored
	:param label:
	:type label: char *
	:param id:
	:type id: int
	:param mode: default value is 0
	:type mode: int
	:rtype: int") NextIdentForLabel;
		Standard_Integer NextIdentForLabel (const char * label,const Standard_Integer id,const Standard_Integer mode = 0);

		/****************** NumberFromLabel ******************/
		%feature("compactdefaultargs") NumberFromLabel;
		%feature("autodoc", "* From a given label in Model, returns the corresponding number Starts from first entity by Default, may start after a given number : this number may be given negative, its absolute value is then considered. Hence a loop on NumberFromLabel may be programmed (stop test is : returned value positive or null) //! Returns 0 if not found, < 0 if more than one found (first found in negative). If <val> just gives an integer value, returns it
	:param val:
	:type val: char *
	:param afternum: default value is 0
	:type afternum: int
	:rtype: int") NumberFromLabel;
		Standard_Integer NumberFromLabel (const char * val,const Standard_Integer afternum = 0);

		/****************** PrintCheckList ******************/
		%feature("compactdefaultargs") PrintCheckList;
		%feature("autodoc", "* Prints a CheckIterator to the current Trace File, controlled with the current Model complete or fails only, according to <failsonly> <mode> defines the mode of printing 0 : sequential, according entities; else with a CheckCounter 1 : according messages, count of entities 2 : id but with list of entities, designated by their numbers 3 : as 2 but with labels of entities
	:param checklist:
	:type checklist: Interface_CheckIterator
	:param failsonly:
	:type failsonly: bool
	:param mode:
	:type mode: IFSelect_PrintCount
	:rtype: None") PrintCheckList;
		void PrintCheckList (const Interface_CheckIterator & checklist,const Standard_Boolean failsonly,const IFSelect_PrintCount mode);

		/****************** PrintEntityStatus ******************/
		%feature("compactdefaultargs") PrintEntityStatus;
		%feature("autodoc", "* Prints main informations about an entity : its number, type, validity (and checks if any), category, shareds and sharings.. mutable because it can recompute checks as necessary
	:param ent:
	:type ent: Standard_Transient
	:param S:
	:type S: Message_Messenger
	:rtype: None") PrintEntityStatus;
		void PrintEntityStatus (const opencascade::handle<Standard_Transient> & ent,const opencascade::handle<Message_Messenger> & S);

		/****************** PrintSignatureList ******************/
		%feature("compactdefaultargs") PrintSignatureList;
		%feature("autodoc", "* Prints a SignatureList to the current Trace File, controlled with the current Model <mode> defines the mode of printing (see SignatureList)
	:param signlist:
	:type signlist: IFSelect_SignatureList
	:param mode:
	:type mode: IFSelect_PrintCount
	:rtype: None") PrintSignatureList;
		void PrintSignatureList (const opencascade::handle<IFSelect_SignatureList> & signlist,const IFSelect_PrintCount mode);

		/****************** Protocol ******************/
		%feature("compactdefaultargs") Protocol;
		%feature("autodoc", "* Returns the Protocol. Null Handle if not yet set should be C++ : return const &
	:rtype: opencascade::handle<Interface_Protocol>") Protocol;
		const opencascade::handle<Interface_Protocol> & Protocol ();

		/****************** QueryCheckList ******************/
		%feature("compactdefaultargs") QueryCheckList;
		%feature("autodoc", "* Loads data from a check iterator to query status on it
	:param chl:
	:type chl: Interface_CheckIterator
	:rtype: None") QueryCheckList;
		void QueryCheckList (const Interface_CheckIterator & chl);

		/****************** QueryCheckStatus ******************/
		%feature("compactdefaultargs") QueryCheckStatus;
		%feature("autodoc", "* Determines check status for an entity regarding last call to QueryCheckList : -1 : <ent> unknown in the model, ignored 0 : no check at all, immediate or inherited thru Graph 1 : immediate warning (no fail), no inherited check 2 : immediate fail, no inherited check +10 : idem but some inherited warning (no fail) +20 : idem but some inherited fail
	:param ent:
	:type ent: Standard_Transient
	:rtype: int") QueryCheckStatus;
		Standard_Integer QueryCheckStatus (const opencascade::handle<Standard_Transient> & ent);

		/****************** QueryParent ******************/
		%feature("compactdefaultargs") QueryParent;
		%feature("autodoc", "* Determines if <entdad> is parent of <entson> (in the graph), returns : -1 if no; 0 if <entdad> = <entson> 1 if immediate parent, > 1 if parent, gives count of steps
	:param entdad:
	:type entdad: Standard_Transient
	:param entson:
	:type entson: Standard_Transient
	:rtype: int") QueryParent;
		Standard_Integer QueryParent (const opencascade::handle<Standard_Transient> & entdad,const opencascade::handle<Standard_Transient> & entson);

		/****************** ReadFile ******************/
		%feature("compactdefaultargs") ReadFile;
		%feature("autodoc", "* Reads a file with the WorkLibrary (sets Model and LoadedFile) Returns a integer status which can be : RetDone if OK, RetVoid if no Protocol not defined, RetError for file not found, RetFail if fail during read
	:param filename:
	:type filename: char *
	:rtype: IFSelect_ReturnStatus") ReadFile;
		IFSelect_ReturnStatus ReadFile (const char * filename);

		/****************** RemoveItem ******************/
		%feature("compactdefaultargs") RemoveItem;
		%feature("autodoc", "* Removes an Item given its Ident. Returns False if <id> is attached to no Item in the WorkSession. For a Named Item, also removes its Name.
	:param item:
	:type item: Standard_Transient
	:rtype: bool") RemoveItem;
		Standard_Boolean RemoveItem (const opencascade::handle<Standard_Transient> & item);

		/****************** RemoveName ******************/
		%feature("compactdefaultargs") RemoveName;
		%feature("autodoc", "* Removes a Name without removing the Item Returns True if Done, False else (Name not recorded)
	:param name:
	:type name: char *
	:rtype: bool") RemoveName;
		Standard_Boolean RemoveName (const char * name);

		/****************** RemoveNamedItem ******************/
		%feature("compactdefaultargs") RemoveNamedItem;
		%feature("autodoc", "* Removes an Item from the Session, given its Name Returns True if Done, False else (Name not recorded) (Applies only on Item which are Named)
	:param name:
	:type name: char *
	:rtype: bool") RemoveNamedItem;
		Standard_Boolean RemoveNamedItem (const char * name);

		/****************** ResetAppliedModifier ******************/
		%feature("compactdefaultargs") ResetAppliedModifier;
		%feature("autodoc", "* Resets a GeneralModifier to be applied Returns True if done, False if <modif> was not applied
	:param modif:
	:type modif: IFSelect_GeneralModifier
	:rtype: bool") ResetAppliedModifier;
		Standard_Boolean ResetAppliedModifier (const opencascade::handle<IFSelect_GeneralModifier> & modif);

		/****************** ResetItemSelection ******************/
		%feature("compactdefaultargs") ResetItemSelection;
		%feature("autodoc", "* Resets input Selection which was set by SetItemSelection Same conditions as for SetItemSelection Returns True if done, False if <item> is not in the WorkSession
	:param item:
	:type item: Standard_Transient
	:rtype: bool") ResetItemSelection;
		Standard_Boolean ResetItemSelection (const opencascade::handle<Standard_Transient> & item);

		/****************** RunModifier ******************/
		%feature("compactdefaultargs") RunModifier;
		%feature("autodoc", "* Runs a Modifier on Starting Model. It can modify entities, or add new ones. But the Model or the Protocol is unchanged. The Modifier is applied on each entity of the Model. See also RunModifierSelected Fills LastRunCheckList //! <copy> : if True, a new data set is produced which brings the modifications (Model + its Entities) if False, data are modified on the spot //! It works through a TransformStandard defined with <modif> Returned status as RunTransformer : 0 nothing done, >0 OK, <0 problem, but only between -3 and 3 (protocol unchanged) Remark : <copy> True will give <effect> = 3 or -3
	:param modif:
	:type modif: IFSelect_Modifier
	:param copy:
	:type copy: bool
	:rtype: int") RunModifier;
		Standard_Integer RunModifier (const opencascade::handle<IFSelect_Modifier> & modif,const Standard_Boolean copy);

		/****************** RunModifierSelected ******************/
		%feature("compactdefaultargs") RunModifierSelected;
		%feature("autodoc", "* Acts as RunModifier, but the Modifier is applied on the list determined by a Selection, rather than on the whole Model If the selection is a null handle, the whole model is taken
	:param modif:
	:type modif: IFSelect_Modifier
	:param sel:
	:type sel: IFSelect_Selection
	:param copy:
	:type copy: bool
	:rtype: int") RunModifierSelected;
		Standard_Integer RunModifierSelected (const opencascade::handle<IFSelect_Modifier> & modif,const opencascade::handle<IFSelect_Selection> & sel,const Standard_Boolean copy);

		/****************** RunTransformer ******************/
		%feature("compactdefaultargs") RunTransformer;
		%feature("autodoc", "* Runs a Transformer on starting Model, which can then be edited or replaced by a new one. The Protocol can also be changed. Fills LastRunCheckList //! Returned status is 0 if nothing done (<transf> or model undefined), positive if OK, negative else : 0 : Nothing done 1 : OK, edition on the spot with no change to the graph of dependances (purely local) 2 : OK, model edited on the spot (graph recomputed, may have changed), protocol unchanged 3 : OK, new model produced, same protocol 4 : OK, model edited on the spot (graph recomputed), but protocol has changed 5 : OK, new model produced, protocol has changed -1 : Error on the spot (slight changes), data may be corrupted (remark : corruption should not be profound) -2 : Error on edition the spot, data may be corrupted (checking them is recommanded) -3 : Error with a new data set, transformation ignored -4 : OK as 4, but graph of dependances count not be recomputed (the former one is kept) : check the protocol
	:param transf:
	:type transf: IFSelect_Transformer
	:rtype: int") RunTransformer;
		Standard_Integer RunTransformer (const opencascade::handle<IFSelect_Transformer> & transf);

		/****************** Selection ******************/
		%feature("compactdefaultargs") Selection;
		%feature("autodoc", "* Returns a Selection, given its Ident in the Session Null result if <id> is not suitable for a Selection (undefined, or defined for another kind of variable)
	:param id:
	:type id: int
	:rtype: opencascade::handle<IFSelect_Selection>") Selection;
		opencascade::handle<IFSelect_Selection> Selection (const Standard_Integer id);

		/****************** SelectionResult ******************/
		%feature("compactdefaultargs") SelectionResult;
		%feature("autodoc", "* Returns the result of a Selection, computed by EvalSelection (see above) under the form of a HSequence (hence, it can be used by a frontal-engine logic). It can be empty Returns a Null Handle if <sel> is not in the WorkSession
	:param sel:
	:type sel: IFSelect_Selection
	:rtype: opencascade::handle<TColStd_HSequenceOfTransient>") SelectionResult;
		opencascade::handle<TColStd_HSequenceOfTransient> SelectionResult (const opencascade::handle<IFSelect_Selection> & sel);

		/****************** SelectionResultFromList ******************/
		%feature("compactdefaultargs") SelectionResultFromList;
		%feature("autodoc", "* Returns the result of a Selection, by forcing its input with a given list <list> (unless <list> is Null). RULES : <list> applies only for a SelectDeduct kind Selection : its Input is considered : if it is a SelectDeduct kind Selection, its Input is considered, etc... until an Input is not a Deduct/Extract : its result is replaced by <list> and all the chain of deductions is applied
	:param sel:
	:type sel: IFSelect_Selection
	:param list:
	:type list: TColStd_HSequenceOfTransient
	:rtype: opencascade::handle<TColStd_HSequenceOfTransient>") SelectionResultFromList;
		opencascade::handle<TColStd_HSequenceOfTransient> SelectionResultFromList (const opencascade::handle<IFSelect_Selection> & sel,const opencascade::handle<TColStd_HSequenceOfTransient> & list);

		/****************** SendAll ******************/
		%feature("compactdefaultargs") SendAll;
		%feature("autodoc", "* Sends the starting Model into one file, without splitting, managing remaining data or anything else. <computegraph> true commands the Graph to be recomputed before sending : required when a Model is filled in several steps //! The Model and File Modifiers recorded to be applied on sending files are. Returns a status of execution : Done if OK, Void if no data available, Error if errors occured (work library is not defined), errors during translation Fail if exception during translation is raised Stop if no disk space or disk, file is write protected Fills LastRunCheckList
	:param filename:
	:type filename: char *
	:param computegraph: default value is Standard_False
	:type computegraph: bool
	:rtype: IFSelect_ReturnStatus") SendAll;
		IFSelect_ReturnStatus SendAll (const char * filename,const Standard_Boolean computegraph = Standard_False);

		/****************** SendSelected ******************/
		%feature("compactdefaultargs") SendSelected;
		%feature("autodoc", "* Sends a part of the starting Model into one file, without splitting. But remaining data are managed. <computegraph> true commands the Graph to be recomputed before sending : required when a Model is filled in several steps //! The Model and File Modifiers recorded to be applied on sending files are. Returns a status : Done if OK, Fail if error during send, Error : WorkLibrary not defined, Void : selection list empty Fills LastRunCheckList
	:param filename:
	:type filename: char *
	:param sel:
	:type sel: IFSelect_Selection
	:param computegraph: default value is Standard_False
	:type computegraph: bool
	:rtype: IFSelect_ReturnStatus") SendSelected;
		IFSelect_ReturnStatus SendSelected (const char * filename,const opencascade::handle<IFSelect_Selection> & sel,const Standard_Boolean computegraph = Standard_False);

		/****************** SendSplit ******************/
		%feature("compactdefaultargs") SendSplit;
		%feature("autodoc", "* Performs creation of derived files from the input Model Takes its data (sub-models and names), from result EvaluateFile if active, else by dynamic Evaluation (not stored) After SendSplit, result of EvaluateFile is Cleared Fills LastRunCheckList //! Works with the WorkLibrary which acts on specific type of Model and can work with File Modifiers (managed by the Model Copier) and a ModelCopier, which can work with Model Modifiers Returns False if, either WorkLibrary has failed on at least one sub-file, or the Work Session is badly conditionned (no Model defined, or FileNaming not in phase with ShareOut)
	:rtype: bool") SendSplit;
		Standard_Boolean SendSplit ();

		/****************** SentFiles ******************/
		%feature("compactdefaultargs") SentFiles;
		%feature("autodoc", "* Returns the list of recorded sent files, or a Null Handle is recording has not been enabled
	:rtype: opencascade::handle<TColStd_HSequenceOfHAsciiString>") SentFiles;
		opencascade::handle<TColStd_HSequenceOfHAsciiString> SentFiles ();

		/****************** SentList ******************/
		%feature("compactdefaultargs") SentList;
		%feature("autodoc", "* Returns the list of Entities sent in files, accourding the count of files each one has been sent (these counts are reset by SetModel or SetRemaining(Forget) ) stored in Graph Status <count> = -1 (default) is for ENtities sent at least once <count> = 0 is for the Remaining List (entities not yet sent) <count> = 1 is for entities sent in one and only one file (the ideal case) Remaining Data are computed on each Sending/Copying output files (see methods EvaluateFile and SendSplit) Graph Status is 0 for Remaining Entity, <count> for Sent into <count> files This status is set to 0 (not yet sent) for all by SetModel and by SetRemaining(mode=Forget,Display)
	:param count: default value is -1
	:type count: int
	:rtype: Interface_EntityIterator") SentList;
		Interface_EntityIterator SentList (const Standard_Integer count = -1);

		/****************** SetActive ******************/
		%feature("compactdefaultargs") SetActive;
		%feature("autodoc", "* Following the type of <item> : - Dispatch : Adds or Removes it in the ShareOut & FileNaming - GeneralModifier : Adds or Removes it for final sending (i.e. in the ModelCopier) Returns True if it did something, False else (state unchanged)
	:param item:
	:type item: Standard_Transient
	:param mode:
	:type mode: bool
	:rtype: bool") SetActive;
		Standard_Boolean SetActive (const opencascade::handle<Standard_Transient> & item,const Standard_Boolean mode);

		/****************** SetAppliedModifier ******************/
		%feature("compactdefaultargs") SetAppliedModifier;
		%feature("autodoc", "* Sets a GeneralModifier to be applied to an item : - item = ShareOut : applies for final sending (all dispatches) - item is a Dispatch : applies for this dispatch only Returns True if done, False if <modif> or <item> not in <self>
	:param modif:
	:type modif: IFSelect_GeneralModifier
	:param item:
	:type item: Standard_Transient
	:rtype: bool") SetAppliedModifier;
		Standard_Boolean SetAppliedModifier (const opencascade::handle<IFSelect_GeneralModifier> & modif,const opencascade::handle<Standard_Transient> & item);

		/****************** SetControl ******************/
		%feature("compactdefaultargs") SetControl;
		%feature("autodoc", "* Sets an Input Selection, Main if <formain> is True, Second else (as <sc>) to a SelectControl (as <sel>). Returns True if Done, False if <sel> is not a SelectControl, or <sc> or <sel> is not in the WorkSession
	:param sel:
	:type sel: IFSelect_Selection
	:param sc:
	:type sc: IFSelect_Selection
	:param formain: default value is Standard_True
	:type formain: bool
	:rtype: bool") SetControl;
		Standard_Boolean SetControl (const opencascade::handle<IFSelect_Selection> & sel,const opencascade::handle<IFSelect_Selection> & sc,const Standard_Boolean formain = Standard_True);

		/****************** SetDefaultFileRoot ******************/
		%feature("compactdefaultargs") SetDefaultFileRoot;
		%feature("autodoc", "* Defines a Default File Root Name. Clears it is <name> = '' Returns True if OK, False if <name> already set for a Dispatch
	:param name:
	:type name: char *
	:rtype: bool") SetDefaultFileRoot;
		Standard_Boolean SetDefaultFileRoot (const char * name);

		/****************** SetFileExtension ******************/
		%feature("compactdefaultargs") SetFileExtension;
		%feature("autodoc", "* Defines a File Extension
	:param name:
	:type name: char *
	:rtype: None") SetFileExtension;
		void SetFileExtension (const char * name);

		/****************** SetFilePrefix ******************/
		%feature("compactdefaultargs") SetFilePrefix;
		%feature("autodoc", "* Defines a File Prefix
	:param name:
	:type name: char *
	:rtype: None") SetFilePrefix;
		void SetFilePrefix (const char * name);

		/****************** SetFileRoot ******************/
		%feature("compactdefaultargs") SetFileRoot;
		%feature("autodoc", "* Defines a Root for a Dispatch If <name> is empty, clears Root Name This has as effect to inhibit the production of File by <disp> Returns False if <disp> is not in the WorkSession or if a root name is already defined for it
	:param disp:
	:type disp: IFSelect_Dispatch
	:param name:
	:type name: char *
	:rtype: bool") SetFileRoot;
		Standard_Boolean SetFileRoot (const opencascade::handle<IFSelect_Dispatch> & disp,const char * name);

		/****************** SetInputSelection ******************/
		%feature("compactdefaultargs") SetInputSelection;
		%feature("autodoc", "* Sets an Input Selection (as <input>) to a SelectExtract or a SelectDeduct (as <sel>). Returns True if Done, False if <sel> is neither a SelectExtract nor a SelectDeduct, or not in the WorkSession
	:param sel:
	:type sel: IFSelect_Selection
	:param input:
	:type input: IFSelect_Selection
	:rtype: bool") SetInputSelection;
		Standard_Boolean SetInputSelection (const opencascade::handle<IFSelect_Selection> & sel,const opencascade::handle<IFSelect_Selection> & input);

		/****************** SetIntValue ******************/
		%feature("compactdefaultargs") SetIntValue;
		%feature("autodoc", "* Changes the Integer Value of an IntParam Returns True if Done, False if <it> is not in the WorkSession
	:param it:
	:type it: IFSelect_IntParam
	:param val:
	:type val: int
	:rtype: bool") SetIntValue;
		Standard_Boolean SetIntValue (const opencascade::handle<IFSelect_IntParam> & it,const Standard_Integer val);

		/****************** SetItemSelection ******************/
		%feature("compactdefaultargs") SetItemSelection;
		%feature("autodoc", "* Sets a Selection as input for an item, according its type : if <item> is a Dispatch : as Final Selection if <item> is a GeneralModifier (i.e. any kind of Modifier) : as Selection used to filter entities to modify <sel> Null causes this Selection to be nullified Returns False if <item> is not of a suitable type, or <item> or <sel> is not in the WorkSession
	:param item:
	:type item: Standard_Transient
	:param sel:
	:type sel: IFSelect_Selection
	:rtype: bool") SetItemSelection;
		Standard_Boolean SetItemSelection (const opencascade::handle<Standard_Transient> & item,const opencascade::handle<IFSelect_Selection> & sel);

		/****************** SetLibrary ******************/
		%feature("compactdefaultargs") SetLibrary;
		%feature("autodoc", "* Sets a WorkLibrary, which will be used to Read and Write Files
	:param theLib:
	:type theLib: IFSelect_WorkLibrary
	:rtype: None") SetLibrary;
		void SetLibrary (const opencascade::handle<IFSelect_WorkLibrary> & theLib);

		/****************** SetLoadedFile ******************/
		%feature("compactdefaultargs") SetLoadedFile;
		%feature("autodoc", "* Stores the filename used for read for setting the model It is cleared by SetModel and ClearData(1)
	:param theFileName:
	:type theFileName: char *
	:rtype: None") SetLoadedFile;
		void SetLoadedFile (const char * theFileName);

		/****************** SetModeStat ******************/
		%feature("compactdefaultargs") SetModeStat;
		%feature("autodoc", "* Set value of mode responsible for precence of selections after loading If mode set to true that different selections will be accessible after loading else selections will be not accessible after loading( for economy memory in applicatios)
	:param theMode:
	:type theMode: bool
	:rtype: None") SetModeStat;
		void SetModeStat (const Standard_Boolean theMode);

		/****************** SetModel ******************/
		%feature("compactdefaultargs") SetModel;
		%feature("autodoc", "* Sets a Model as input : this will be the Model from which the ShareOut will work if <clearpointed> is True (default) all SelectPointed items are cleared, else they must be managed by the caller Remark : SetModel clears the Graph, recomputes it if a Protocol is set and if the Model is not empty, of course
	:param model:
	:type model: Interface_InterfaceModel
	:param clearpointed: default value is Standard_True
	:type clearpointed: bool
	:rtype: None") SetModel;
		void SetModel (const opencascade::handle<Interface_InterfaceModel> & model,const Standard_Boolean clearpointed = Standard_True);

		/****************** SetModelContent ******************/
		%feature("compactdefaultargs") SetModelContent;
		%feature("autodoc", "* Defines a new content from the former one If <keep> is True, it is given by entities selected by Selection <sel> (and all shared entities) Else, it is given by all the former content but entities selected by the Selection <sel> (and properly shared ones) Returns True if done. Returns False if the selected list (from <sel>) is empty, hence nothing is done
	:param sel:
	:type sel: IFSelect_Selection
	:param keep:
	:type keep: bool
	:rtype: bool") SetModelContent;
		Standard_Boolean SetModelContent (const opencascade::handle<IFSelect_Selection> & sel,const Standard_Boolean keep);

		/****************** SetModelCopier ******************/
		%feature("compactdefaultargs") SetModelCopier;
		%feature("autodoc", "* Sets a new ModelCopier. Fills Items which its content
	:param copier:
	:type copier: IFSelect_ModelCopier
	:rtype: None") SetModelCopier;
		void SetModelCopier (const opencascade::handle<IFSelect_ModelCopier> & copier);

		/****************** SetParams ******************/
		%feature("compactdefaultargs") SetParams;
		%feature("autodoc", "* Sets a list of Parameters, i.e. TypedValue, to be handled through an Editor The two lists are parallel, if <params> is longer than <uses>, surnumeral parameters are for general use //! EditForms are created to handle these parameters (list, edit) on the basis of a ParamEditor xst-params-edit //! A use number dispatches the parameter to a given EditForm EditForms are defined as follows Name Use Means xst-params all All Parameters (complete list) xst-params-general 1 Generals xst-params-load 2 LoadFile (no Transfer) xst-params-send 3 SendFile (Write, no Transfer) xst-params-split 4 Split xst-param-read 5 Transfer on Reading xst-param-write 6 Transfer on Writing
	:param params:
	:type params: Standard_Transient
	:param uselist:
	:type uselist: NCollection_Vector<int>
	:rtype: None") SetParams;
		void SetParams (const NCollection_Vector<opencascade::handle<Standard_Transient> > & params,const NCollection_Vector<Standard_Integer> & uselist);

		/****************** SetProtocol ******************/
		%feature("compactdefaultargs") SetProtocol;
		%feature("autodoc", "* Sets a Protocol, which will be used to determine Graphs, to Read and to Write Files
	:param protocol:
	:type protocol: Interface_Protocol
	:rtype: None") SetProtocol;
		void SetProtocol (const opencascade::handle<Interface_Protocol> & protocol);

		/****************** SetRemaining ******************/
		%feature("compactdefaultargs") SetRemaining;
		%feature("autodoc", "* Processes Remaining data (after having sent files), mode : Forget : forget remaining info (i.e. clear all 'Sent' status) Compute : compute and keep remaining (does nothing if : remaining is empty or if no files has been sent) Display : display entities recorded as remaining Undo : restore former state of data (after Remaining(1) ) Returns True if OK, False else (i.e. mode = 2 and Remaining List is either empty or takes all the entities, or mode = 3 and no former computation of remaining data was done)
	:param mode:
	:type mode: IFSelect_RemainMode
	:rtype: bool") SetRemaining;
		Standard_Boolean SetRemaining (const IFSelect_RemainMode mode);

		/****************** SetSelectPointed ******************/
		%feature("compactdefaultargs") SetSelectPointed;
		%feature("autodoc", "* Changes the content of a Selection of type SelectPointed According <mode> : 0 set <list> as new content (clear former) 1 : adds <list> to actual content -1 : removes <list> from actual content Returns True if done, False if <sel> is not a SelectPointed
	:param sel:
	:type sel: IFSelect_Selection
	:param list:
	:type list: TColStd_HSequenceOfTransient
	:param mode:
	:type mode: int
	:rtype: bool") SetSelectPointed;
		Standard_Boolean SetSelectPointed (const opencascade::handle<IFSelect_Selection> & sel,const opencascade::handle<TColStd_HSequenceOfTransient> & list,const Standard_Integer mode);

		/****************** SetShareOut ******************/
		%feature("compactdefaultargs") SetShareOut;
		%feature("autodoc", "* Sets a new ShareOut. Fills Items which its content Warning : data from the former ShareOut are lost
	:param shareout:
	:type shareout: IFSelect_ShareOut
	:rtype: None") SetShareOut;
		void SetShareOut (const opencascade::handle<IFSelect_ShareOut> & shareout);

		/****************** SetSignType ******************/
		%feature("compactdefaultargs") SetSignType;
		%feature("autodoc", "* Sets a specific Signature to be the SignType, i.e. the Signature which will determine TypeName from the Model (basic function). It is recorded in the GTool This Signature is also set as 'xst-sign-type' (reserved name)
	:param signtype:
	:type signtype: IFSelect_Signature
	:rtype: None") SetSignType;
		void SetSignType (const opencascade::handle<IFSelect_Signature> & signtype);

		/****************** SetTextValue ******************/
		%feature("compactdefaultargs") SetTextValue;
		%feature("autodoc", "* Changes the Text Value of a TextParam (an HAsciiString) Returns True if Done, False if <it> is not in the WorkSession
	:param par:
	:type par: TCollection_HAsciiString
	:param val:
	:type val: char *
	:rtype: bool") SetTextValue;
		Standard_Boolean SetTextValue (const opencascade::handle<TCollection_HAsciiString> & par,const char * val);

		/****************** ShareOut ******************/
		%feature("compactdefaultargs") ShareOut;
		%feature("autodoc", "* Returns the ShareOut defined at creation time
	:rtype: opencascade::handle<IFSelect_ShareOut>") ShareOut;
		const opencascade::handle<IFSelect_ShareOut> & ShareOut ();

		/****************** Shareds ******************/
		%feature("compactdefaultargs") Shareds;
		%feature("autodoc", "* Returns the list of entities shared by <ent> (can be empty) Returns a null Handle if <ent> is unknown
	:param ent:
	:type ent: Standard_Transient
	:rtype: opencascade::handle<TColStd_HSequenceOfTransient>") Shareds;
		opencascade::handle<TColStd_HSequenceOfTransient> Shareds (const opencascade::handle<Standard_Transient> & ent);

		/****************** Sharings ******************/
		%feature("compactdefaultargs") Sharings;
		%feature("autodoc", "* Returns the list of entities sharing <ent> (can be empty) Returns a null Handle if <ent> is unknown
	:param ent:
	:type ent: Standard_Transient
	:rtype: opencascade::handle<TColStd_HSequenceOfTransient>") Sharings;
		opencascade::handle<TColStd_HSequenceOfTransient> Sharings (const opencascade::handle<Standard_Transient> & ent);

		/****************** SignCounter ******************/
		%feature("compactdefaultargs") SignCounter;
		%feature("autodoc", "* Returns a SignCounter from its ident in the Session Null result if <id> is not suitable for a SignCounter (undefined, or defined for another kind of variable)
	:param id:
	:type id: int
	:rtype: opencascade::handle<IFSelect_SignCounter>") SignCounter;
		opencascade::handle<IFSelect_SignCounter> SignCounter (const Standard_Integer id);

		/****************** SignType ******************/
		%feature("compactdefaultargs") SignType;
		%feature("autodoc", "* Returns the current SignType
	:rtype: opencascade::handle<IFSelect_Signature>") SignType;
		opencascade::handle<IFSelect_Signature> SignType ();

		/****************** SignValue ******************/
		%feature("compactdefaultargs") SignValue;
		%feature("autodoc", "* Returns the Value computed by a Signature for an Entity Returns an empty string if the entity does not belong to the loaded model
	:param sign:
	:type sign: IFSelect_Signature
	:param ent:
	:type ent: Standard_Transient
	:rtype: char *") SignValue;
		const char * SignValue (const opencascade::handle<IFSelect_Signature> & sign,const opencascade::handle<Standard_Transient> & ent);

		/****************** Signature ******************/
		%feature("compactdefaultargs") Signature;
		%feature("autodoc", "* Returns a Signature, given its Ident in the Session Null result if <id> is not suitable for a Signature (undefined, or defined for another kind of variable)
	:param id:
	:type id: int
	:rtype: opencascade::handle<IFSelect_Signature>") Signature;
		opencascade::handle<IFSelect_Signature> Signature (const Standard_Integer id);

		/****************** Source ******************/
		%feature("compactdefaultargs") Source;
		%feature("autodoc", "* Returns the <num>th Input Selection of a Selection (see NbSources). Returns a Null Handle if <sel> is not in the WorkSession or if <num> is out of the range <1-NbSources> To obtain more details, see the method Sources
	:param sel:
	:type sel: IFSelect_Selection
	:param num: default value is 1
	:type num: int
	:rtype: opencascade::handle<IFSelect_Selection>") Source;
		opencascade::handle<IFSelect_Selection> Source (const opencascade::handle<IFSelect_Selection> & sel,const Standard_Integer num = 1);

		/****************** Sources ******************/
		%feature("compactdefaultargs") Sources;
		%feature("autodoc", "* Returns the Selections which are source of Selection, given its rank in the List of Selections (see SelectionIterator) Returned value is empty if <num> is out of range or if <sel> is not in the WorkSession
	:param sel:
	:type sel: IFSelect_Selection
	:rtype: IFSelect_SelectionIterator") Sources;
		IFSelect_SelectionIterator Sources (const opencascade::handle<IFSelect_Selection> & sel);

		/****************** StartingEntity ******************/
		%feature("compactdefaultargs") StartingEntity;
		%feature("autodoc", "* Returns an Entity stored in the Model of the WorkSession (Null Handle is no Model or num out of range)
	:param num:
	:type num: int
	:rtype: opencascade::handle<Standard_Transient>") StartingEntity;
		opencascade::handle<Standard_Transient> StartingEntity (const Standard_Integer num);

		/****************** StartingNumber ******************/
		%feature("compactdefaultargs") StartingNumber;
		%feature("autodoc", "* Returns the Number of an Entity in the Model (0 if no Model set or <ent> not in the Model)
	:param ent:
	:type ent: Standard_Transient
	:rtype: int") StartingNumber;
		Standard_Integer StartingNumber (const opencascade::handle<Standard_Transient> & ent);

		/****************** TextParam ******************/
		%feature("compactdefaultargs") TextParam;
		%feature("autodoc", "* Returns a TextParam, given its Ident in the Session Null result if <id> is not suitable for a TextParam (undefined, or defined for another kind of variable)
	:param id:
	:type id: int
	:rtype: opencascade::handle<TCollection_HAsciiString>") TextParam;
		opencascade::handle<TCollection_HAsciiString> TextParam (const Standard_Integer id);

		/****************** TextValue ******************/
		%feature("compactdefaultargs") TextValue;
		%feature("autodoc", "* Returns Text Value of a TextParam (a String) or an empty string if <it> is not in the WorkSession
	:param par:
	:type par: TCollection_HAsciiString
	:rtype: TCollection_AsciiString") TextValue;
		TCollection_AsciiString TextValue (const opencascade::handle<TCollection_HAsciiString> & par);

		/****************** ToggleSelectExtract ******************/
		%feature("compactdefaultargs") ToggleSelectExtract;
		%feature("autodoc", "* Toggles the Sense (Direct <-> Reversed) of a SelectExtract Returns True if Done, False if <sel> is not a SelectExtract or is not in the WorkSession
	:param sel:
	:type sel: IFSelect_Selection
	:rtype: bool") ToggleSelectExtract;
		Standard_Boolean ToggleSelectExtract (const opencascade::handle<IFSelect_Selection> & sel);

		/****************** TraceDumpEntity ******************/
		%feature("compactdefaultargs") TraceDumpEntity;
		%feature("autodoc", "* Dumps an entity from the current Model as inherited DumpEntity on currently defined Default Trace File (<level> interpreted according to the Norm, see WorkLibrary)
	:param ent:
	:type ent: Standard_Transient
	:param level:
	:type level: int
	:rtype: None") TraceDumpEntity;
		void TraceDumpEntity (const opencascade::handle<Standard_Transient> & ent,const Standard_Integer level);

		/****************** TraceDumpModel ******************/
		%feature("compactdefaultargs") TraceDumpModel;
		%feature("autodoc", "* Dumps the current Model (as inherited DumpModel), on currently defined Default Trace File (default is standard output)
	:param mode:
	:type mode: int
	:rtype: None") TraceDumpModel;
		void TraceDumpModel (const Standard_Integer mode);

		/****************** TraceStatics ******************/
		%feature("compactdefaultargs") TraceStatics;
		%feature("autodoc", "* Traces the Statics attached to a given use number If <use> is given positive (normal), the trace is embedded with a header and a trailer If <use> is negative, just values are printed (this allows to make compositions) Remark : use number 5 commands use -2 to be traced Remark : use numbers 4 and 6 command use -3 to be traced
	:param use:
	:type use: int
	:param mode: default value is 0
	:type mode: int
	:rtype: None") TraceStatics;
		void TraceStatics (const Standard_Integer use,const Standard_Integer mode = 0);

		/****************** Transformer ******************/
		%feature("compactdefaultargs") Transformer;
		%feature("autodoc", "* Returns a Transformer, given its Ident in the Session Null result if <id> is not suitable for a Transformer (undefined, or defined for another kind of variable)
	:param id:
	:type id: int
	:rtype: opencascade::handle<IFSelect_Transformer>") Transformer;
		opencascade::handle<IFSelect_Transformer> Transformer (const Standard_Integer id);

		/****************** UsesAppliedModifier ******************/
		%feature("compactdefaultargs") UsesAppliedModifier;
		%feature("autodoc", "* Returns the item on which a GeneralModifier is applied : the ShareOut, or a given Dispatch Returns a Null Handle if <modif> is not applied
	:param modif:
	:type modif: IFSelect_GeneralModifier
	:rtype: opencascade::handle<Standard_Transient>") UsesAppliedModifier;
		opencascade::handle<Standard_Transient> UsesAppliedModifier (const opencascade::handle<IFSelect_GeneralModifier> & modif);

		/****************** ValidityName ******************/
		%feature("compactdefaultargs") ValidityName;
		%feature("autodoc", "* Returns the Validity Name determined for an entity it is computed by the class SignValidity Remark : an unknown entity gives an empty string
	:param ent:
	:type ent: Standard_Transient
	:rtype: char *") ValidityName;
		const char * ValidityName (const opencascade::handle<Standard_Transient> & ent);

		/****************** WorkLibrary ******************/
		%feature("compactdefaultargs") WorkLibrary;
		%feature("autodoc", "* Returns the WorkLibrary. Null Handle if not yet set should be C++ : return const &
	:rtype: opencascade::handle<IFSelect_WorkLibrary>") WorkLibrary;
		const opencascade::handle<IFSelect_WorkLibrary> & WorkLibrary ();

		/****************** WriteFile ******************/
		%feature("compactdefaultargs") WriteFile;
		%feature("autodoc", "* Writes the current Interface Model globally to a File, and returns a write status which can be : Done OK, Fail file could not be written, Error no norm is selected Remark : It is a simple, one-file writing, other operations are available (such as splitting ...) which calls SendAll
	:param filename:
	:type filename: char *
	:rtype: IFSelect_ReturnStatus") WriteFile;
		IFSelect_ReturnStatus WriteFile (const char * filename);

		/****************** WriteFile ******************/
		%feature("compactdefaultargs") WriteFile;
		%feature("autodoc", "* Writes a sub-part of the current Interface Model to a File, as defined by a Selection <sel>, recomputes the Graph, and returns a write status which can be : Done OK, Fail file could not be written, Error no norm is selected Remark : It is a simple, one-file writing, other operations are available (such as splitting ...) which calls SendSelected
	:param filename:
	:type filename: char *
	:param sel:
	:type sel: IFSelect_Selection
	:rtype: IFSelect_ReturnStatus") WriteFile;
		IFSelect_ReturnStatus WriteFile (const char * filename,const opencascade::handle<IFSelect_Selection> & sel);

};


%make_alias(IFSelect_WorkSession)

%extend IFSelect_WorkSession {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************
* class IFSelect_Act *
*********************/
class IFSelect_Act : public IFSelect_Activator {
	public:
		/****************** AddFSet ******************/
		%feature("compactdefaultargs") AddFSet;
		%feature("autodoc", "* Adds a function with its name and help : creates an Act then records it as function for XSET (i.e. to create control item)
	:param name:
	:type name: char *
	:param help:
	:type help: char *
	:param func:
	:type func: IFSelect_ActFunc
	:rtype: void") AddFSet;
		static void AddFSet (const char * name,const char * help,const IFSelect_ActFunc func);

		/****************** AddFunc ******************/
		%feature("compactdefaultargs") AddFunc;
		%feature("autodoc", "* Adds a function with its name and help : creates an Act then records it as normal function
	:param name:
	:type name: char *
	:param help:
	:type help: char *
	:param func:
	:type func: IFSelect_ActFunc
	:rtype: void") AddFunc;
		static void AddFunc (const char * name,const char * help,const IFSelect_ActFunc func);

		/****************** Do ******************/
		%feature("compactdefaultargs") Do;
		%feature("autodoc", "* Execution of Command Line. remark that <number> is senseless because each Act brings one and only one function
	:param number:
	:type number: int
	:param pilot:
	:type pilot: IFSelect_SessionPilot
	:rtype: IFSelect_ReturnStatus") Do;
		IFSelect_ReturnStatus Do (const Standard_Integer number,const opencascade::handle<IFSelect_SessionPilot> & pilot);

		/****************** Help ******************/
		%feature("compactdefaultargs") Help;
		%feature("autodoc", "* Short Help for commands : returns the help given to create
	:param number:
	:type number: int
	:rtype: char *") Help;
		const char * Help (const Standard_Integer number);

		/****************** IFSelect_Act ******************/
		%feature("compactdefaultargs") IFSelect_Act;
		%feature("autodoc", "* Creates an Act with a name, help and a function mode (Add or AddSet) is given when recording
	:param name:
	:type name: char *
	:param help:
	:type help: char *
	:param func:
	:type func: IFSelect_ActFunc
	:rtype: None") IFSelect_Act;
		 IFSelect_Act (const char * name,const char * help,const IFSelect_ActFunc func);

		/****************** SetGroup ******************/
		%feature("compactdefaultargs") SetGroup;
		%feature("autodoc", "* Changes the default group name for the following Acts group empty means to come back to default from Activator Also a file name can be precised (to query by getsource)
	:param group:
	:type group: char *
	:param file: default value is ""
	:type file: char *
	:rtype: void") SetGroup;
		static void SetGroup (const char * group,const char * file = "");

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
		%feature("autodoc", "* Creates a BasicDumper and puts it into the Library of Dumper
	:rtype: None") IFSelect_BasicDumper;
		 IFSelect_BasicDumper ();

		/****************** ReadOwn ******************/
		%feature("compactdefaultargs") ReadOwn;
		%feature("autodoc", "* Recognizes and Read Own Parameters for Types of package IFSelect. Returns True if done and <item> created, False else
	:param file:
	:type file: IFSelect_SessionFile
	:param type:
	:type type: TCollection_AsciiString
	:param item:
	:type item: Standard_Transient
	:rtype: bool") ReadOwn;
		Standard_Boolean ReadOwn (IFSelect_SessionFile & file,const TCollection_AsciiString & type,opencascade::handle<Standard_Transient> & item);

		/****************** WriteOwn ******************/
		%feature("compactdefaultargs") WriteOwn;
		%feature("autodoc", "* Write the Own Parameters of Types defined in package IFSelect Returns True if <item> has been processed, False else
	:param file:
	:type file: IFSelect_SessionFile
	:param item:
	:type item: Standard_Transient
	:rtype: bool") WriteOwn;
		Standard_Boolean WriteOwn (IFSelect_SessionFile & file,const opencascade::handle<Standard_Transient> & item);

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
		/****************** Analyse ******************/
		%feature("compactdefaultargs") Analyse;
		%feature("autodoc", "* Analyses a CheckIterator according a Model (which detains the entities for which the CheckIterator has messages), i.e. counts messages for entities If <original> is True, does not consider final messages but those before interpretation (such as inserting variables : integers, reals, strings) If <failsonly> is True, only Fails are considered Remark : global messages are recorded with a Null entity
	:param list:
	:type list: Interface_CheckIterator
	:param model:
	:type model: Interface_InterfaceModel
	:param original: default value is Standard_False
	:type original: bool
	:param failsonly: default value is Standard_False
	:type failsonly: bool
	:rtype: None") Analyse;
		void Analyse (const Interface_CheckIterator & list,const opencascade::handle<Interface_InterfaceModel> & model,const Standard_Boolean original = Standard_False,const Standard_Boolean failsonly = Standard_False);

		/****************** IFSelect_CheckCounter ******************/
		%feature("compactdefaultargs") IFSelect_CheckCounter;
		%feature("autodoc", "* Creates a CheckCounter, empty ready to work
	:param withlist: default value is Standard_False
	:type withlist: bool
	:rtype: None") IFSelect_CheckCounter;
		 IFSelect_CheckCounter (const Standard_Boolean withlist = Standard_False);

		/****************** SetSignature ******************/
		%feature("compactdefaultargs") SetSignature;
		%feature("autodoc", "* Sets a specific signature Else, the current SignType (in the model) is used
	:param sign:
	:type sign: MoniTool_SignText
	:rtype: None") SetSignature;
		void SetSignature (const opencascade::handle<MoniTool_SignText> & sign);

		/****************** Signature ******************/
		%feature("compactdefaultargs") Signature;
		%feature("autodoc", "* Returns the Signature;
	:rtype: opencascade::handle<MoniTool_SignText>") Signature;
		opencascade::handle<MoniTool_SignText> Signature ();

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
		%feature("autodoc", "* Creates a DispGlobal
	:rtype: None") IFSelect_DispGlobal;
		 IFSelect_DispGlobal ();

		/****************** Label ******************/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "* Returns as Label, 'One File for all Input'
	:rtype: TCollection_AsciiString") Label;
		TCollection_AsciiString Label ();

		/****************** LimitedMax ******************/
		%feature("compactdefaultargs") LimitedMax;
		%feature("autodoc", "* Returns True : maximum equates 1
	:param nbent:
	:type nbent: int
	:param max:
	:type max: int
	:rtype: bool") LimitedMax;
		virtual Standard_Boolean LimitedMax (const Standard_Integer nbent,Standard_Integer &OutValue);

		/****************** Packets ******************/
		%feature("compactdefaultargs") Packets;
		%feature("autodoc", "* Computes the list of produced Packets. It is made of only ONE Packet, which gets the RootResult from the Final Selection. Remark : the inherited exception raising is never activated.
	:param G:
	:type G: Interface_Graph
	:param packs:
	:type packs: IFGraph_SubPartsIterator
	:rtype: None") Packets;
		void Packets (const Interface_Graph & G,IFGraph_SubPartsIterator & packs);

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
		/****************** Count ******************/
		%feature("compactdefaultargs") Count;
		%feature("autodoc", "* Returns the Count Parameter used for splitting
	:rtype: opencascade::handle<IFSelect_IntParam>") Count;
		opencascade::handle<IFSelect_IntParam> Count ();

		/****************** CountValue ******************/
		%feature("compactdefaultargs") CountValue;
		%feature("autodoc", "* Returns the effective value of the count parameter (if Count Parameter not Set or value not positive, returns 1)
	:rtype: int") CountValue;
		Standard_Integer CountValue ();

		/****************** IFSelect_DispPerCount ******************/
		%feature("compactdefaultargs") IFSelect_DispPerCount;
		%feature("autodoc", "* Creates a DispPerCount with no Count (default value 1)
	:rtype: None") IFSelect_DispPerCount;
		 IFSelect_DispPerCount ();

		/****************** Label ******************/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "* Returns as Label, 'One File per <count> Input Entities'
	:rtype: TCollection_AsciiString") Label;
		TCollection_AsciiString Label ();

		/****************** LimitedMax ******************/
		%feature("compactdefaultargs") LimitedMax;
		%feature("autodoc", "* Returns True, maximum count is given as <nbent>
	:param nbent:
	:type nbent: int
	:param max:
	:type max: int
	:rtype: bool") LimitedMax;
		virtual Standard_Boolean LimitedMax (const Standard_Integer nbent,Standard_Integer &OutValue);

		/****************** Packets ******************/
		%feature("compactdefaultargs") Packets;
		%feature("autodoc", "* Computes the list of produced Packets. It defines Packets in order to have at most <Count> Entities per Packet, Entities are given by RootResult from the Final Selection.
	:param G:
	:type G: Interface_Graph
	:param packs:
	:type packs: IFGraph_SubPartsIterator
	:rtype: None") Packets;
		void Packets (const Interface_Graph & G,IFGraph_SubPartsIterator & packs);

		/****************** SetCount ******************/
		%feature("compactdefaultargs") SetCount;
		%feature("autodoc", "* Sets a new Parameter for Count
	:param count:
	:type count: IFSelect_IntParam
	:rtype: None") SetCount;
		void SetCount (const opencascade::handle<IFSelect_IntParam> & count);

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
		/****************** Count ******************/
		%feature("compactdefaultargs") Count;
		%feature("autodoc", "* Returns the Count Parameter used for splitting
	:rtype: opencascade::handle<IFSelect_IntParam>") Count;
		opencascade::handle<IFSelect_IntParam> Count ();

		/****************** CountValue ******************/
		%feature("compactdefaultargs") CountValue;
		%feature("autodoc", "* Returns the effective value of the count parameter (if Count Parameter not Set or value not positive, returns 1)
	:rtype: int") CountValue;
		Standard_Integer CountValue ();

		/****************** IFSelect_DispPerFiles ******************/
		%feature("compactdefaultargs") IFSelect_DispPerFiles;
		%feature("autodoc", "* Creates a DispPerFiles with no Count (default value 1 file)
	:rtype: None") IFSelect_DispPerFiles;
		 IFSelect_DispPerFiles ();

		/****************** Label ******************/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "* Returns as Label, 'Maximum <count> Files'
	:rtype: TCollection_AsciiString") Label;
		TCollection_AsciiString Label ();

		/****************** LimitedMax ******************/
		%feature("compactdefaultargs") LimitedMax;
		%feature("autodoc", "* Returns True, maximum count is given as CountValue
	:param nbent:
	:type nbent: int
	:param max:
	:type max: int
	:rtype: bool") LimitedMax;
		virtual Standard_Boolean LimitedMax (const Standard_Integer nbent,Standard_Integer &OutValue);

		/****************** Packets ******************/
		%feature("compactdefaultargs") Packets;
		%feature("autodoc", "* Computes the list of produced Packets. It defines Packets in order to have <Count> Packets, except if the input count of Entities is lower. Entities are given by RootResult from the Final Selection.
	:param G:
	:type G: Interface_Graph
	:param packs:
	:type packs: IFGraph_SubPartsIterator
	:rtype: None") Packets;
		void Packets (const Interface_Graph & G,IFGraph_SubPartsIterator & packs);

		/****************** SetCount ******************/
		%feature("compactdefaultargs") SetCount;
		%feature("autodoc", "* Sets a new Parameter for Count
	:param count:
	:type count: IFSelect_IntParam
	:rtype: None") SetCount;
		void SetCount (const opencascade::handle<IFSelect_IntParam> & count);

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
		%feature("autodoc", "* Creates a DispPerOne
	:rtype: None") IFSelect_DispPerOne;
		 IFSelect_DispPerOne ();

		/****************** Label ******************/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "* Returns as Label, 'One File per Input Entity'
	:rtype: TCollection_AsciiString") Label;
		TCollection_AsciiString Label ();

		/****************** LimitedMax ******************/
		%feature("compactdefaultargs") LimitedMax;
		%feature("autodoc", "* Returns True, maximum limit is given as <nbent>
	:param nbent:
	:type nbent: int
	:param max:
	:type max: int
	:rtype: bool") LimitedMax;
		virtual Standard_Boolean LimitedMax (const Standard_Integer nbent,Standard_Integer &OutValue);

		/****************** Packets ******************/
		%feature("compactdefaultargs") Packets;
		%feature("autodoc", "* Returns the list of produced Packets. It defines one Packet per Entity given by RootResult from the Final Selection.
	:param G:
	:type G: Interface_Graph
	:param packs:
	:type packs: IFGraph_SubPartsIterator
	:rtype: None") Packets;
		void Packets (const Interface_Graph & G,IFGraph_SubPartsIterator & packs);

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
		%feature("autodoc", "* Creates a DispPerSignature with no SignCounter (by default, produces only one packet)
	:rtype: None") IFSelect_DispPerSignature;
		 IFSelect_DispPerSignature ();

		/****************** Label ******************/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "* Returns as Label, 'One File per Signature <name>'
	:rtype: TCollection_AsciiString") Label;
		TCollection_AsciiString Label ();

		/****************** LimitedMax ******************/
		%feature("compactdefaultargs") LimitedMax;
		%feature("autodoc", "* Returns True, maximum count is given as <nbent>
	:param nbent:
	:type nbent: int
	:param max:
	:type max: int
	:rtype: bool") LimitedMax;
		virtual Standard_Boolean LimitedMax (const Standard_Integer nbent,Standard_Integer &OutValue);

		/****************** Packets ******************/
		%feature("compactdefaultargs") Packets;
		%feature("autodoc", "* Computes the list of produced Packets. It defines Packets from the SignCounter, which sirts the input Entities per Signature (specific of the SignCounter).
	:param G:
	:type G: Interface_Graph
	:param packs:
	:type packs: IFGraph_SubPartsIterator
	:rtype: None") Packets;
		void Packets (const Interface_Graph & G,IFGraph_SubPartsIterator & packs);

		/****************** SetSignCounter ******************/
		%feature("compactdefaultargs") SetSignCounter;
		%feature("autodoc", "* Sets a SignCounter for sort Remark : it is set to record lists of entities, not only counts
	:param sign:
	:type sign: IFSelect_SignCounter
	:rtype: None") SetSignCounter;
		void SetSignCounter (const opencascade::handle<IFSelect_SignCounter> & sign);

		/****************** SignCounter ******************/
		%feature("compactdefaultargs") SignCounter;
		%feature("autodoc", "* Returns the SignCounter used for splitting
	:rtype: opencascade::handle<IFSelect_SignCounter>") SignCounter;
		opencascade::handle<IFSelect_SignCounter> SignCounter ();

		/****************** SignName ******************/
		%feature("compactdefaultargs") SignName;
		%feature("autodoc", "* Returns the name of the SignCounter, which caracterises the sorting criterium for this Dispatch
	:rtype: char *") SignName;
		const char * SignName ();

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
		%feature("autodoc", "* This deferred method defines the action specific to each class of Modifier. It is called by a ModelCopier, once the Model generated and filled. ModelCopier has already checked the criteria (Dispatch, Model Rank, Selection) before calling it. //! <ctx> detains informations about original data and selection. The result of copying, on which modifications are to be done, is <target>. <TC> allows to run additional copies as required //! In case of Error, use methods CCheck from the ContextModif to aknowledge an entity Check or a Global Check with messages
	:param ctx:
	:type ctx: IFSelect_ContextModif
	:param target:
	:type target: Interface_InterfaceModel
	:param protocol:
	:type protocol: Interface_Protocol
	:param TC:
	:type TC: Interface_CopyTool
	:rtype: void") Perform;
		virtual void Perform (IFSelect_ContextModif & ctx,const opencascade::handle<Interface_InterfaceModel> & target,const opencascade::handle<Interface_Protocol> & protocol,Interface_CopyTool & TC);

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
		/****************** AddConstantText ******************/
		%feature("compactdefaultargs") AddConstantText;
		%feature("autodoc", "* Adds a Constant Text, it will be Read Only By default, its long name equates its shortname
	:param val:
	:type val: char *
	:param shortname:
	:type shortname: char *
	:param completename: default value is ""
	:type completename: char *
	:rtype: None") AddConstantText;
		void AddConstantText (const char * val,const char * shortname,const char * completename = "");

		/****************** AddValue ******************/
		%feature("compactdefaultargs") AddValue;
		%feature("autodoc", "* Adds a TypedValue By default, its short name equates its complete name, it can be explicited
	:param val:
	:type val: Interface_TypedValue
	:param shortname: default value is ""
	:type shortname: char *
	:rtype: None") AddValue;
		void AddValue (const opencascade::handle<Interface_TypedValue> & val,const char * shortname = "");

		/****************** Apply ******************/
		%feature("compactdefaultargs") Apply;
		%feature("autodoc", ":param form:
	:type form: IFSelect_EditForm
	:param ent:
	:type ent: Standard_Transient
	:param model:
	:type model: Interface_InterfaceModel
	:rtype: bool") Apply;
		Standard_Boolean Apply (const opencascade::handle<IFSelect_EditForm> & form,const opencascade::handle<Standard_Transient> & ent,const opencascade::handle<Interface_InterfaceModel> & model);

		/****************** IFSelect_ParamEditor ******************/
		%feature("compactdefaultargs") IFSelect_ParamEditor;
		%feature("autodoc", "* Creates a ParamEditor, empty, with a maximum count of params (default is 100) And a label, by default it will be 'Param Editor'
	:param nbmax: default value is 100
	:type nbmax: int
	:param label: default value is ""
	:type label: char *
	:rtype: None") IFSelect_ParamEditor;
		 IFSelect_ParamEditor (const Standard_Integer nbmax = 100,const char * label = "");

		/****************** Label ******************/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", ":rtype: TCollection_AsciiString") Label;
		TCollection_AsciiString Label ();

		/****************** Load ******************/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", ":param form:
	:type form: IFSelect_EditForm
	:param ent:
	:type ent: Standard_Transient
	:param model:
	:type model: Interface_InterfaceModel
	:rtype: bool") Load;
		Standard_Boolean Load (const opencascade::handle<IFSelect_EditForm> & form,const opencascade::handle<Standard_Transient> & ent,const opencascade::handle<Interface_InterfaceModel> & model);

		/****************** Recognize ******************/
		%feature("compactdefaultargs") Recognize;
		%feature("autodoc", ":param form:
	:type form: IFSelect_EditForm
	:rtype: bool") Recognize;
		Standard_Boolean Recognize (const opencascade::handle<IFSelect_EditForm> & form);

		/****************** StaticEditor ******************/
		%feature("compactdefaultargs") StaticEditor;
		%feature("autodoc", "* Returns a ParamEditor to work on the Static Parameters of which names are listed in <list> Null Handle if <list> is null or empty
	:param list:
	:type list: TColStd_HSequenceOfHAsciiString
	:param label: default value is ""
	:type label: char *
	:rtype: opencascade::handle<IFSelect_ParamEditor>") StaticEditor;
		static opencascade::handle<IFSelect_ParamEditor> StaticEditor (const opencascade::handle<TColStd_HSequenceOfHAsciiString> & list,const char * label = "");

		/****************** StringValue ******************/
		%feature("compactdefaultargs") StringValue;
		%feature("autodoc", ":param form:
	:type form: IFSelect_EditForm
	:param num:
	:type num: int
	:rtype: opencascade::handle<TCollection_HAsciiString>") StringValue;
		opencascade::handle<TCollection_HAsciiString> StringValue (const opencascade::handle<IFSelect_EditForm> & form,const Standard_Integer num);

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
		%feature("autodoc", "* Puts in an Iterator the Selections from which 'me' depends This list is empty for all SelectBase type Selections
	:param iter:
	:type iter: IFSelect_SelectionIterator
	:rtype: None") FillIterator;
		void FillIterator (IFSelect_SelectionIterator & iter);

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
		%feature("autodoc", "* Adds a Selection to the filling list By default, adds it to the end of the list A Positive rank less then NbInputs gives an insertion rank (InsertBefore : the new <atnum>th item of the list is <sel>)
	:param sel:
	:type sel: IFSelect_Selection
	:param atnum: default value is 0
	:type atnum: int
	:rtype: None") Add;
		void Add (const opencascade::handle<IFSelect_Selection> & sel,const Standard_Integer atnum = 0);

		/****************** FillIterator ******************/
		%feature("compactdefaultargs") FillIterator;
		%feature("autodoc", "* Puts in an Iterator the Selections from which 'me' depends That is to say, the list of Input Selections
	:param iter:
	:type iter: IFSelect_SelectionIterator
	:rtype: None") FillIterator;
		void FillIterator (IFSelect_SelectionIterator & iter);

		/****************** Input ******************/
		%feature("compactdefaultargs") Input;
		%feature("autodoc", "* Returns an Input Selection, given its rank in the list
	:param num:
	:type num: int
	:rtype: opencascade::handle<IFSelect_Selection>") Input;
		opencascade::handle<IFSelect_Selection> Input (const Standard_Integer num);

		/****************** InputRank ******************/
		%feature("compactdefaultargs") InputRank;
		%feature("autodoc", "* Returns the rank of an input Selection, 0 if not in the list. Most generally, its value is meaningless, except for testing the presence of an input Selection : - == 0 if <sel> is not an input for <self> - > 0 if <sel> is an input for <self>
	:param sel:
	:type sel: IFSelect_Selection
	:rtype: int") InputRank;
		Standard_Integer InputRank (const opencascade::handle<IFSelect_Selection> & sel);

		/****************** NbInputs ******************/
		%feature("compactdefaultargs") NbInputs;
		%feature("autodoc", "* Returns the count of Input Selections
	:rtype: int") NbInputs;
		Standard_Integer NbInputs ();

		/****************** Remove ******************/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "* Removes an input Selection. Returns True if Done, False, if <sel> is not an input for <self>
	:param sel:
	:type sel: IFSelect_Selection
	:rtype: bool") Remove;
		Standard_Boolean Remove (const opencascade::handle<IFSelect_Selection> & sel);

		/****************** Remove ******************/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "* Removes an input Selection, given its rank in the list Returns True if Done, False if <num> is out of range
	:param num:
	:type num: int
	:rtype: bool") Remove;
		Standard_Boolean Remove (const Standard_Integer num);

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
		%feature("autodoc", "* Puts in an Iterator the Selections from which 'me' depends That is to say, the list of Input Selections
	:param iter:
	:type iter: IFSelect_SelectionIterator
	:rtype: None") FillIterator;
		void FillIterator (IFSelect_SelectionIterator & iter);

		/****************** HasSecondInput ******************/
		%feature("compactdefaultargs") HasSecondInput;
		%feature("autodoc", "* Returns True if a Control Input is defined Thus, Result can be computed differently if there is a Control Input or if there is none
	:rtype: bool") HasSecondInput;
		Standard_Boolean HasSecondInput ();

		/****************** MainInput ******************/
		%feature("compactdefaultargs") MainInput;
		%feature("autodoc", "* Returns the Main Input Selection
	:rtype: opencascade::handle<IFSelect_Selection>") MainInput;
		opencascade::handle<IFSelect_Selection> MainInput ();

		/****************** SecondInput ******************/
		%feature("compactdefaultargs") SecondInput;
		%feature("autodoc", "* Returns the Control Input Selection, or a Null Handle
	:rtype: opencascade::handle<IFSelect_Selection>") SecondInput;
		opencascade::handle<IFSelect_Selection> SecondInput ();

		/****************** SetMainInput ******************/
		%feature("compactdefaultargs") SetMainInput;
		%feature("autodoc", "* Sets a Selection to be the Main Input
	:param sel:
	:type sel: IFSelect_Selection
	:rtype: None") SetMainInput;
		void SetMainInput (const opencascade::handle<IFSelect_Selection> & sel);

		/****************** SetSecondInput ******************/
		%feature("compactdefaultargs") SetSecondInput;
		%feature("autodoc", "* Sets a Selection to be the Control Input
	:param sel:
	:type sel: IFSelect_Selection
	:rtype: None") SetSecondInput;
		void SetSecondInput (const opencascade::handle<IFSelect_Selection> & sel);

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
		%feature("autodoc", "* Returns the Alternate Definition It is returned modifiable, hence an already defined SelectPointed can be used But if it was not yet defined, it is created the first time //! It is exploited by InputResult
	:rtype: opencascade::handle<IFSelect_SelectPointed>") Alternate;
		opencascade::handle<IFSelect_SelectPointed> & Alternate ();

		/****************** FillIterator ******************/
		%feature("compactdefaultargs") FillIterator;
		%feature("autodoc", "* Puts in an Iterator the Selections from which 'me' depends This list contains one Selection : the InputSelection
	:param iter:
	:type iter: IFSelect_SelectionIterator
	:rtype: None") FillIterator;
		void FillIterator (IFSelect_SelectionIterator & iter);

		/****************** HasAlternate ******************/
		%feature("compactdefaultargs") HasAlternate;
		%feature("autodoc", "* Tells if an Alternate List has been set, i.e. : the Alternate Definition is present and set
	:rtype: bool") HasAlternate;
		Standard_Boolean HasAlternate ();

		/****************** HasInput ******************/
		%feature("compactdefaultargs") HasInput;
		%feature("autodoc", "* Returns True if the Input Selection is defined, False else
	:rtype: bool") HasInput;
		Standard_Boolean HasInput ();

		/****************** Input ******************/
		%feature("compactdefaultargs") Input;
		%feature("autodoc", "* Returns the Input Selection
	:rtype: opencascade::handle<IFSelect_Selection>") Input;
		opencascade::handle<IFSelect_Selection> Input ();

		/****************** InputResult ******************/
		%feature("compactdefaultargs") InputResult;
		%feature("autodoc", "* Returns the Result determined by Input Selection, as Unique if Input Selection is not defined, returns an empty list. //! If Alternate is set, InputResult takes its definition instead of calling the Input Selection, then clears it
	:param G:
	:type G: Interface_Graph
	:rtype: Interface_EntityIterator") InputResult;
		Interface_EntityIterator InputResult (const Interface_Graph & G);

		/****************** SetInput ******************/
		%feature("compactdefaultargs") SetInput;
		%feature("autodoc", "* Defines or Changes the Input Selection
	:param sel:
	:type sel: IFSelect_Selection
	:rtype: None") SetInput;
		void SetInput (const opencascade::handle<IFSelect_Selection> & sel);

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
		/****************** Arg ******************/
		%feature("compactdefaultargs") Arg;
		%feature("autodoc", "* Returns a word given its rank, as a CString. As for Word, begins at 0 (the command name), etc...
	:param num:
	:type num: int
	:rtype: char *") Arg;
		const char * Arg (const Standard_Integer num);

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "* Clears the recorded informations (commands, objects)
	:rtype: None") Clear;
		void Clear ();

		/****************** Command ******************/
		%feature("compactdefaultargs") Command;
		%feature("autodoc", "* Returns a recorded Command, given its rank (from 1)
	:param num:
	:type num: int
	:rtype: TCollection_AsciiString") Command;
		const TCollection_AsciiString & Command (const Standard_Integer num);

		/****************** CommandLine ******************/
		%feature("compactdefaultargs") CommandLine;
		%feature("autodoc", "* Returns the Command Line to be interpreted
	:rtype: TCollection_AsciiString") CommandLine;
		const TCollection_AsciiString & CommandLine ();

		/****************** CommandPart ******************/
		%feature("compactdefaultargs") CommandPart;
		%feature("autodoc", "* Returns the part of the command line which begins at argument <numarg> between 0 and NbWords-1 (by default, all the line) Empty string if out of range
	:param numarg: default value is 0
	:type numarg: int
	:rtype: char *") CommandPart;
		const char * CommandPart (const Standard_Integer numarg = 0);

		/****************** Do ******************/
		%feature("compactdefaultargs") Do;
		%feature("autodoc", "* Processes specific commands, which are : x or exit for end of session ? or help for help messages xcommand to control command lines (Record Mode, List, Clear, File Output ...) xsource to execute a command file (no nesting allowed), in case of error, source is stopped and keyword recovers xstep is a simple prefix (useful in a wider environment, to avoid conflicts on command names) xset control commands which create items with names
	:param number:
	:type number: int
	:param session:
	:type session: IFSelect_SessionPilot
	:rtype: IFSelect_ReturnStatus") Do;
		IFSelect_ReturnStatus Do (const Standard_Integer number,const opencascade::handle<IFSelect_SessionPilot> & session);

		/****************** Execute ******************/
		%feature("compactdefaultargs") Execute;
		%feature("autodoc", "* Sets the Command then tries to execute it. Return value : same as for Perform
	:param command:
	:type command: TCollection_AsciiString
	:rtype: IFSelect_ReturnStatus") Execute;
		IFSelect_ReturnStatus Execute (const TCollection_AsciiString & command);

		/****************** ExecuteAlias ******************/
		%feature("compactdefaultargs") ExecuteAlias;
		%feature("autodoc", "* Executes the Commands, except that the command name (word 0) is aliased. The rest of the command line is unchanged If <alias> is empty, Executes with no change //! Error status is returned if the alias is unknown as command
	:param aliasname:
	:type aliasname: TCollection_AsciiString
	:rtype: IFSelect_ReturnStatus") ExecuteAlias;
		IFSelect_ReturnStatus ExecuteAlias (const TCollection_AsciiString & aliasname);

		/****************** ExecuteCounter ******************/
		%feature("compactdefaultargs") ExecuteCounter;
		%feature("autodoc", "* Executes a Counter in a general way If <numword> is greater than count of command words, it counts all the model. Else it considers the word <numword> as the identifier of a Selection <mode> gives the mode of printing results, default is CountByItem
	:param counter:
	:type counter: IFSelect_SignCounter
	:param numword:
	:type numword: int
	:param mode: default value is IFSelect_CountByItem
	:type mode: IFSelect_PrintCount
	:rtype: IFSelect_ReturnStatus") ExecuteCounter;
		IFSelect_ReturnStatus ExecuteCounter (const opencascade::handle<IFSelect_SignCounter> & counter,const Standard_Integer numword,const IFSelect_PrintCount mode = IFSelect_CountByItem);

		/****************** Help ******************/
		%feature("compactdefaultargs") Help;
		%feature("autodoc", "* Help for specific commands (apart from general command help)
	:param number:
	:type number: int
	:rtype: char *") Help;
		const char * Help (const Standard_Integer number);

		/****************** IFSelect_SessionPilot ******************/
		%feature("compactdefaultargs") IFSelect_SessionPilot;
		%feature("autodoc", "* Creates an empty SessionPilot, with a prompt which will be displayed on querying commands. If not precised (''), this prompt is set to 'Test-XSTEP>'
	:param prompt: default value is ""
	:type prompt: char *
	:rtype: None") IFSelect_SessionPilot;
		 IFSelect_SessionPilot (const char * prompt = "");

		/****************** Library ******************/
		%feature("compactdefaultargs") Library;
		%feature("autodoc", "* Returns the WorKlibrary (Null if not set). WorkLibrary is used to Read and Write Files, according to the Norm
	:rtype: opencascade::handle<IFSelect_WorkLibrary>") Library;
		opencascade::handle<IFSelect_WorkLibrary> Library ();

		/****************** NbCommands ******************/
		%feature("compactdefaultargs") NbCommands;
		%feature("autodoc", "* Returns the count of recorded Commands
	:rtype: int") NbCommands;
		Standard_Integer NbCommands ();

		/****************** NbWords ******************/
		%feature("compactdefaultargs") NbWords;
		%feature("autodoc", "* Returns the count of words of the Command Line, separated by blanks : 0 if empty, one if a command without args, else it gives the count of args minus one. Warning : limited to 10 (command title + 9 args)
	:rtype: int") NbWords;
		Standard_Integer NbWords ();

		/****************** Number ******************/
		%feature("compactdefaultargs") Number;
		%feature("autodoc", "* Interprets a string value as an entity number : if it gives an integer, returns its value else, considers it as ENtityLabel (preferably case sensitive) in case of failure, returns 0
	:param val:
	:type val: char *
	:rtype: int") Number;
		Standard_Integer Number (const char * val);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Executes the Command, itself (for built-in commands, which have priority) or by using the list of Activators. The value returned is : RetVoid if nothing done (void command) RetDone if execution OK, RetEnd if END OF SESSION, RetError if command unknown or incorrect, RetFail if error on execution If execution is OK and RecordMode is set, this Command Line is recorded to the list (see below).
	:rtype: IFSelect_ReturnStatus") Perform;
		IFSelect_ReturnStatus Perform ();

		/****************** ReadScript ******************/
		%feature("compactdefaultargs") ReadScript;
		%feature("autodoc", "* Reads commands from a Script File, named <file>. By default (file = ''), reads from standard input with a prompt Else (reading from a file), the read commands are displayed onto standard output. Allows nested reads. Reading is stopped either by command x or exit, or by reaching end of file Return Value follows the rules of Do : RetEnd for normal end, RetFail if script could not be opened
	:param file: default value is ""
	:type file: char *
	:rtype: IFSelect_ReturnStatus") ReadScript;
		IFSelect_ReturnStatus ReadScript (const char * file = "");

		/****************** RecordItem ******************/
		%feature("compactdefaultargs") RecordItem;
		%feature("autodoc", "* Allows to associate a Transient Value with the last execution as a partial result Returns RetDone if item is not Null, RetFail if item is Null Remark : it is nullified for each Perform
	:param item:
	:type item: Standard_Transient
	:rtype: IFSelect_ReturnStatus") RecordItem;
		IFSelect_ReturnStatus RecordItem (const opencascade::handle<Standard_Transient> & item);

		/****************** RecordMode ******************/
		%feature("compactdefaultargs") RecordMode;
		%feature("autodoc", "* Returns the Record Mode for Commands. Default is False.
	:rtype: bool") RecordMode;
		Standard_Boolean RecordMode ();

		/****************** RecordedItem ******************/
		%feature("compactdefaultargs") RecordedItem;
		%feature("autodoc", "* Returns the Transient Object which was recorded with the current Line Command. If none was, returns a Null Handle
	:rtype: opencascade::handle<Standard_Transient>") RecordedItem;
		opencascade::handle<Standard_Transient> RecordedItem ();

		/****************** RemoveWord ******************/
		%feature("compactdefaultargs") RemoveWord;
		%feature("autodoc", "* Removes a word given its rank. Returns True if Done, False if <num> is out of range
	:param num:
	:type num: int
	:rtype: bool") RemoveWord;
		Standard_Boolean RemoveWord (const Standard_Integer num);

		/****************** Session ******************/
		%feature("compactdefaultargs") Session;
		%feature("autodoc", "* Returns the WorkSession which is worked on
	:rtype: opencascade::handle<IFSelect_WorkSession>") Session;
		opencascade::handle<IFSelect_WorkSession> Session ();

		/****************** SetCommandLine ******************/
		%feature("compactdefaultargs") SetCommandLine;
		%feature("autodoc", "* Sets the value of the Command Line to be interpreted Also prepares the interpretation (splitting by blanks)
	:param command:
	:type command: TCollection_AsciiString
	:rtype: None") SetCommandLine;
		void SetCommandLine (const TCollection_AsciiString & command);

		/****************** SetLibrary ******************/
		%feature("compactdefaultargs") SetLibrary;
		%feature("autodoc", "* Sets a WorkLibrary
	:param WL:
	:type WL: IFSelect_WorkLibrary
	:rtype: None") SetLibrary;
		void SetLibrary (const opencascade::handle<IFSelect_WorkLibrary> & WL);

		/****************** SetRecordMode ******************/
		%feature("compactdefaultargs") SetRecordMode;
		%feature("autodoc", "* Changes the RecordMode.
	:param mode:
	:type mode: bool
	:rtype: None") SetRecordMode;
		void SetRecordMode (const Standard_Boolean mode);

		/****************** SetSession ******************/
		%feature("compactdefaultargs") SetSession;
		%feature("autodoc", "* Sets a WorkSession to be worked on
	:param WS:
	:type WS: IFSelect_WorkSession
	:rtype: None") SetSession;
		void SetSession (const opencascade::handle<IFSelect_WorkSession> & WS);

		/****************** Word ******************/
		%feature("compactdefaultargs") Word;
		%feature("autodoc", "* Returns a word given its rank in the Command Line. Begins at 0 which is the Command Title, 1 is the 1st arg., etc...
	:param num:
	:type num: int
	:rtype: TCollection_AsciiString") Word;
		const TCollection_AsciiString & Word (const Standard_Integer num);

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
		%feature("autodoc", "* Returns a SignCategory
	:rtype: None") IFSelect_SignCategory;
		 IFSelect_SignCategory ();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* Returns the Signature for a Transient object, as its Category recorded in the model
	:param ent:
	:type ent: Standard_Transient
	:param model:
	:type model: Interface_InterfaceModel
	:rtype: char *") Value;
		const char * Value (const opencascade::handle<Standard_Transient> & ent,const opencascade::handle<Interface_InterfaceModel> & model);

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
		/****************** AddEntity ******************/
		%feature("compactdefaultargs") AddEntity;
		%feature("autodoc", "* Adds an entity by considering its signature, which is given by call to method AddSign Returns True if added, False if already in the map (and map control status set)
	:param ent:
	:type ent: Standard_Transient
	:param model:
	:type model: Interface_InterfaceModel
	:rtype: bool") AddEntity;
		virtual Standard_Boolean AddEntity (const opencascade::handle<Standard_Transient> & ent,const opencascade::handle<Interface_InterfaceModel> & model);

		/****************** AddFromSelection ******************/
		%feature("compactdefaultargs") AddFromSelection;
		%feature("autodoc", "* Adds the result determined by a Selection from a Graph Remark : does not impact at all data from SetSelection & Co
	:param sel:
	:type sel: IFSelect_Selection
	:param G:
	:type G: Interface_Graph
	:rtype: None") AddFromSelection;
		void AddFromSelection (const opencascade::handle<IFSelect_Selection> & sel,const Interface_Graph & G);

		/****************** AddList ******************/
		%feature("compactdefaultargs") AddList;
		%feature("autodoc", "* Adds a list of entities by adding each of the items
	:param list:
	:type list: TColStd_HSequenceOfTransient
	:param model:
	:type model: Interface_InterfaceModel
	:rtype: None") AddList;
		void AddList (const opencascade::handle<TColStd_HSequenceOfTransient> & list,const opencascade::handle<Interface_InterfaceModel> & model);

		/****************** AddModel ******************/
		%feature("compactdefaultargs") AddModel;
		%feature("autodoc", "* Adds all the entities contained in a Model
	:param model:
	:type model: Interface_InterfaceModel
	:rtype: None") AddModel;
		void AddModel (const opencascade::handle<Interface_InterfaceModel> & model);

		/****************** AddSign ******************/
		%feature("compactdefaultargs") AddSign;
		%feature("autodoc", "* Adds an entity (already filtered by Map) with its signature. This signature can be computed with the containing model. Its value is provided by the object Signature given at start, if no Signature is defined, it does nothing. //! Can be redefined (in this case, see also Sign)
	:param ent:
	:type ent: Standard_Transient
	:param model:
	:type model: Interface_InterfaceModel
	:rtype: void") AddSign;
		virtual void AddSign (const opencascade::handle<Standard_Transient> & ent,const opencascade::handle<Interface_InterfaceModel> & model);

		/****************** AddWithGraph ******************/
		%feature("compactdefaultargs") AddWithGraph;
		%feature("autodoc", "* Adds a list of entities in the context given by the graph Default just call basic AddList Can be redefined to get a signature computed with the graph
	:param list:
	:type list: TColStd_HSequenceOfTransient
	:param graph:
	:type graph: Interface_Graph
	:rtype: void") AddWithGraph;
		virtual void AddWithGraph (const opencascade::handle<TColStd_HSequenceOfTransient> & list,const Interface_Graph & graph);

		/****************** ComputeSelected ******************/
		%feature("compactdefaultargs") ComputeSelected;
		%feature("autodoc", "* Computes from the selection result, if selection is active (mode 2). If selection is not defined (mode 0) or is inhibited (mode 1) does nothing. Returns True if computation is done (or optimised), False else This method is called by ComputeCounter from WorkSession //! If <forced> is True, recomputes systematically Else (D), if the counter was not cleared and if the former computed result started from the same total size of Graph and same count of selected entities : computation is not redone unless <forced> is given as True
	:param G:
	:type G: Interface_Graph
	:param forced: default value is Standard_False
	:type forced: bool
	:rtype: bool") ComputeSelected;
		Standard_Boolean ComputeSelected (const Interface_Graph & G,const Standard_Boolean forced = Standard_False);

		/****************** ComputedSign ******************/
		%feature("compactdefaultargs") ComputedSign;
		%feature("autodoc", "* Applies AddWithGraph on one entity, and returns the Signature Value which has been recorded To do this, Add is called with SignOnly Mode True during the call, the returned value is LastValue
	:param ent:
	:type ent: Standard_Transient
	:param G:
	:type G: Interface_Graph
	:rtype: char *") ComputedSign;
		const char * ComputedSign (const opencascade::handle<Standard_Transient> & ent,const Interface_Graph & G);

		/****************** IFSelect_SignCounter ******************/
		%feature("compactdefaultargs") IFSelect_SignCounter;
		%feature("autodoc", "* Creates a SignCounter, without proper Signature If <withmap> is True (default), added entities are counted only if they are not yet recorded in the map Map control can be set off if the input garantees uniqueness of data <withlist> is transmitted to SignatureList (option to list entities, not only to count them).
	:param withmap: default value is Standard_True
	:type withmap: bool
	:param withlist: default value is Standard_False
	:type withlist: bool
	:rtype: None") IFSelect_SignCounter;
		 IFSelect_SignCounter (const Standard_Boolean withmap = Standard_True,const Standard_Boolean withlist = Standard_False);

		/****************** IFSelect_SignCounter ******************/
		%feature("compactdefaultargs") IFSelect_SignCounter;
		%feature("autodoc", "* Creates a SignCounter, with a predefined Signature Other arguments as for Create without Signature.
	:param matcher:
	:type matcher: IFSelect_Signature
	:param withmap: default value is Standard_True
	:type withmap: bool
	:param withlist: default value is Standard_False
	:type withlist: bool
	:rtype: None") IFSelect_SignCounter;
		 IFSelect_SignCounter (const opencascade::handle<IFSelect_Signature> & matcher,const Standard_Boolean withmap = Standard_True,const Standard_Boolean withlist = Standard_False);

		/****************** SelMode ******************/
		%feature("compactdefaultargs") SelMode;
		%feature("autodoc", "* Returns the mode of working with the selection
	:rtype: int") SelMode;
		Standard_Integer SelMode ();

		/****************** Selection ******************/
		%feature("compactdefaultargs") Selection;
		%feature("autodoc", "* Returns the selection, or a null Handle
	:rtype: opencascade::handle<IFSelect_Selection>") Selection;
		opencascade::handle<IFSelect_Selection> Selection ();

		/****************** SetMap ******************/
		%feature("compactdefaultargs") SetMap;
		%feature("autodoc", "* Changes the control status. The map is not cleared, simply its use changes
	:param withmap:
	:type withmap: bool
	:rtype: None") SetMap;
		void SetMap (const Standard_Boolean withmap);

		/****************** SetSelMode ******************/
		%feature("compactdefaultargs") SetSelMode;
		%feature("autodoc", "* Changes the mode of working with the selection : -1 just clears optimisation data and nothing else 0 clears it 1 inhibits it for computing (but no clearing) 2 sets it active for computing Default at creation is 0, after SetSelection (not null) is 2
	:param selmode:
	:type selmode: int
	:rtype: None") SetSelMode;
		void SetSelMode (const Standard_Integer selmode);

		/****************** SetSelection ******************/
		%feature("compactdefaultargs") SetSelection;
		%feature("autodoc", "* Sets a Selection as input : this causes content to be cleared then the Selection to be ready to compute (but not immediatly)
	:param sel:
	:type sel: IFSelect_Selection
	:rtype: None") SetSelection;
		void SetSelection (const opencascade::handle<IFSelect_Selection> & sel);

		/****************** Sign ******************/
		%feature("compactdefaultargs") Sign;
		%feature("autodoc", "* Determines and returns the value of the signature for an entity as an HAsciiString. This method works exactly as AddSign, which is optimized //! Can be redefined, accorded with AddSign
	:param ent:
	:type ent: Standard_Transient
	:param model:
	:type model: Interface_InterfaceModel
	:rtype: opencascade::handle<TCollection_HAsciiString>") Sign;
		virtual opencascade::handle<TCollection_HAsciiString> Sign (const opencascade::handle<Standard_Transient> & ent,const opencascade::handle<Interface_InterfaceModel> & model);

		/****************** Signature ******************/
		%feature("compactdefaultargs") Signature;
		%feature("autodoc", "* Returns the Signature used to count entities. It can be null.
	:rtype: opencascade::handle<IFSelect_Signature>") Signature;
		opencascade::handle<IFSelect_Signature> Signature ();

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
		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "* Adds a Signature. Width, if given, gives the tabulation If <maxi> is True, it is a forced tabulation (overlength is replaced by a final dot) If <maxi> is False, just 3 blanks follow an overlength
	:param subsign:
	:type subsign: IFSelect_Signature
	:param width: default value is 0
	:type width: int
	:param maxi: default value is Standard_False
	:type maxi: bool
	:rtype: None") Add;
		void Add (const opencascade::handle<IFSelect_Signature> & subsign,const Standard_Integer width = 0,const Standard_Boolean maxi = Standard_False);

		/****************** IFSelect_SignMultiple ******************/
		%feature("compactdefaultargs") IFSelect_SignMultiple;
		%feature("autodoc", "* Creates an empty SignMultiple with a Name This name should take expected tabulations into account
	:param name:
	:type name: char *
	:rtype: None") IFSelect_SignMultiple;
		 IFSelect_SignMultiple (const char * name);

		/****************** Matches ******************/
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "* Specialized Match Rule If <exact> is False, simply checks if at least one sub-item matches If <exact> is True, standard match with Value (i.e. tabulations must be respected)
	:param ent:
	:type ent: Standard_Transient
	:param model:
	:type model: Interface_InterfaceModel
	:param text:
	:type text: TCollection_AsciiString
	:param exact:
	:type exact: bool
	:rtype: bool") Matches;
		virtual Standard_Boolean Matches (const opencascade::handle<Standard_Transient> & ent,const opencascade::handle<Interface_InterfaceModel> & model,const TCollection_AsciiString & text,const Standard_Boolean exact);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* Concatenates the values of sub-signatures, with their tabulations
	:param ent:
	:type ent: Standard_Transient
	:param model:
	:type model: Interface_InterfaceModel
	:rtype: char *") Value;
		const char * Value (const opencascade::handle<Standard_Transient> & ent,const opencascade::handle<Interface_InterfaceModel> & model);

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
		%feature("autodoc", "* Returns a SignType <nopk> false (D) : complete dynamic type (name = Dynamic Type) <nopk> true : class type without pk (name = Class Type)
	:param nopk: default value is Standard_False
	:type nopk: bool
	:rtype: None") IFSelect_SignType;
		 IFSelect_SignType (const Standard_Boolean nopk = Standard_False);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* Returns the Signature for a Transient object, as its Dynamic Type, with or without package name, according starting option
	:param ent:
	:type ent: Standard_Transient
	:param model:
	:type model: Interface_InterfaceModel
	:rtype: char *") Value;
		const char * Value (const opencascade::handle<Standard_Transient> & ent,const opencascade::handle<Interface_InterfaceModel> & model);

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
		/****************** CVal ******************/
		%feature("compactdefaultargs") CVal;
		%feature("autodoc", "* Returns the Signature for a Transient object, as a validity deducted from data (reports) stored in the model. Class method, can be called by any one
	:param ent:
	:type ent: Standard_Transient
	:param model:
	:type model: Interface_InterfaceModel
	:rtype: char *") CVal;
		static const char * CVal (const opencascade::handle<Standard_Transient> & ent,const opencascade::handle<Interface_InterfaceModel> & model);

		/****************** IFSelect_SignValidity ******************/
		%feature("compactdefaultargs") IFSelect_SignValidity;
		%feature("autodoc", "* Returns a SignValidity
	:rtype: None") IFSelect_SignValidity;
		 IFSelect_SignValidity ();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* Returns the Signature for a Transient object, as a validity deducted from data (reports) stored in the model Calls the class method CVal
	:param ent:
	:type ent: Standard_Transient
	:param model:
	:type model: Interface_InterfaceModel
	:rtype: char *") Value;
		const char * Value (const opencascade::handle<Standard_Transient> & ent,const opencascade::handle<Interface_InterfaceModel> & model);

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
		/****************** AddModifier ******************/
		%feature("compactdefaultargs") AddModifier;
		%feature("autodoc", "* Adds a Modifier to the list : - <atnum> = 0 (default) : at the end of the list - <atnum> > 0 : at rank <atnum> Returns True if done, False if <atnum> is out of range
	:param modif:
	:type modif: IFSelect_Modifier
	:param atnum: default value is 0
	:type atnum: int
	:rtype: bool") AddModifier;
		Standard_Boolean AddModifier (const opencascade::handle<IFSelect_Modifier> & modif,const Standard_Integer atnum = 0);

		/****************** ApplyModifiers ******************/
		%feature("compactdefaultargs") ApplyModifiers;
		%feature("autodoc", "* Applies the modifiers sequencially. For each one, prepares required data (if a Selection is associated as a filter). For the option OnTheSpot, it determines if the graph may be changed and updates <newmod> if required If a Modifier causes an error (check 'HasFailed'), ApplyModifier stops : the following Modifiers are ignored
	:param G:
	:type G: Interface_Graph
	:param protocol:
	:type protocol: Interface_Protocol
	:param TC:
	:type TC: Interface_CopyTool
	:param checks:
	:type checks: Interface_CheckIterator
	:param newmod:
	:type newmod: Interface_InterfaceModel
	:rtype: bool") ApplyModifiers;
		Standard_Boolean ApplyModifiers (const Interface_Graph & G,const opencascade::handle<Interface_Protocol> & protocol,Interface_CopyTool & TC,Interface_CheckIterator & checks,opencascade::handle<Interface_InterfaceModel> & newmod);

		/****************** Copy ******************/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "* This the first operation. It calls StandardCopy or OnTheSpot according the option
	:param G:
	:type G: Interface_Graph
	:param TC:
	:type TC: Interface_CopyTool
	:param newmod:
	:type newmod: Interface_InterfaceModel
	:rtype: None") Copy;
		void Copy (const Interface_Graph & G,Interface_CopyTool & TC,opencascade::handle<Interface_InterfaceModel> & newmod);

		/****************** CopyOption ******************/
		%feature("compactdefaultargs") CopyOption;
		%feature("autodoc", "* Returns the Copy option
	:rtype: bool") CopyOption;
		Standard_Boolean CopyOption ();

		/****************** IFSelect_TransformStandard ******************/
		%feature("compactdefaultargs") IFSelect_TransformStandard;
		%feature("autodoc", "* Creates a TransformStandard, option StandardCopy, no Modifier
	:rtype: None") IFSelect_TransformStandard;
		 IFSelect_TransformStandard ();

		/****************** Label ******************/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "* Returns a text which defines the way a Transformer works : 'On the spot edition' or 'Standard Copy' followed by '<nn> Modifiers'
	:rtype: TCollection_AsciiString") Label;
		TCollection_AsciiString Label ();

		/****************** Modifier ******************/
		%feature("compactdefaultargs") Modifier;
		%feature("autodoc", "* Returns a Modifier given its rank in the list
	:param num:
	:type num: int
	:rtype: opencascade::handle<IFSelect_Modifier>") Modifier;
		opencascade::handle<IFSelect_Modifier> Modifier (const Standard_Integer num);

		/****************** ModifierRank ******************/
		%feature("compactdefaultargs") ModifierRank;
		%feature("autodoc", "* Returns the rank of a Modifier in the list, 0 if unknown
	:param modif:
	:type modif: IFSelect_Modifier
	:rtype: int") ModifierRank;
		Standard_Integer ModifierRank (const opencascade::handle<IFSelect_Modifier> & modif);

		/****************** NbModifiers ******************/
		%feature("compactdefaultargs") NbModifiers;
		%feature("autodoc", "* Returns the count of recorded Modifiers
	:rtype: int") NbModifiers;
		Standard_Integer NbModifiers ();

		/****************** OnTheSpot ******************/
		%feature("compactdefaultargs") OnTheSpot;
		%feature("autodoc", "* This is the OnTheSpot action : each entity is bound with ... itself. The produced model is the same as the starting one.
	:param G:
	:type G: Interface_Graph
	:param TC:
	:type TC: Interface_CopyTool
	:param newmod:
	:type newmod: Interface_InterfaceModel
	:rtype: None") OnTheSpot;
		void OnTheSpot (const Interface_Graph & G,Interface_CopyTool & TC,opencascade::handle<Interface_InterfaceModel> & newmod);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Performs the Standard Transformation, by calling Copy then ApplyModifiers (which can return an error status)
	:param G:
	:type G: Interface_Graph
	:param protocol:
	:type protocol: Interface_Protocol
	:param checks:
	:type checks: Interface_CheckIterator
	:param newmod:
	:type newmod: Interface_InterfaceModel
	:rtype: bool") Perform;
		Standard_Boolean Perform (const Interface_Graph & G,const opencascade::handle<Interface_Protocol> & protocol,Interface_CheckIterator & checks,opencascade::handle<Interface_InterfaceModel> & newmod);

		/****************** RemoveModifier ******************/
		%feature("compactdefaultargs") RemoveModifier;
		%feature("autodoc", "* Removes a Modifier from the list Returns True if done, False if <modif> not in the list
	:param modif:
	:type modif: IFSelect_Modifier
	:rtype: bool") RemoveModifier;
		Standard_Boolean RemoveModifier (const opencascade::handle<IFSelect_Modifier> & modif);

		/****************** RemoveModifier ******************/
		%feature("compactdefaultargs") RemoveModifier;
		%feature("autodoc", "* Removes a Modifier from the list, given its rank Returns True if done, False if <num> is out of range
	:param num:
	:type num: int
	:rtype: bool") RemoveModifier;
		Standard_Boolean RemoveModifier (const Standard_Integer num);

		/****************** Selection ******************/
		%feature("compactdefaultargs") Selection;
		%feature("autodoc", "* Returns the Selection, Null by default
	:rtype: opencascade::handle<IFSelect_Selection>") Selection;
		opencascade::handle<IFSelect_Selection> Selection ();

		/****************** SetCopyOption ******************/
		%feature("compactdefaultargs") SetCopyOption;
		%feature("autodoc", "* Sets the Copy option to a new value : - True for StandardCopy - False for OnTheSpot
	:param option:
	:type option: bool
	:rtype: None") SetCopyOption;
		void SetCopyOption (const Standard_Boolean option);

		/****************** SetSelection ******************/
		%feature("compactdefaultargs") SetSelection;
		%feature("autodoc", "* Sets a Selection (or unsets if Null) This Selection then defines the list of entities on which the Modifiers will be applied If it is set, it has priority on Selections of Modifiers Else, for each Modifier its Selection is evaluated By default, all the Model is taken
	:param sel:
	:type sel: IFSelect_Selection
	:rtype: None") SetSelection;
		void SetSelection (const opencascade::handle<IFSelect_Selection> & sel);

		/****************** StandardCopy ******************/
		%feature("compactdefaultargs") StandardCopy;
		%feature("autodoc", "* This is the standard action of Copy : its takes into account only the remaining entities (noted by Graph Status positive) and their proper dependances of course. Produces a new model.
	:param G:
	:type G: Interface_Graph
	:param TC:
	:type TC: Interface_CopyTool
	:param newmod:
	:type newmod: Interface_InterfaceModel
	:rtype: None") StandardCopy;
		void StandardCopy (const Interface_Graph & G,Interface_CopyTool & TC,opencascade::handle<Interface_InterfaceModel> & newmod);

		/****************** Updated ******************/
		%feature("compactdefaultargs") Updated;
		%feature("autodoc", "* This methods allows to know what happened to a starting entity after the last Perform. It reads result from the map which was filled by Perform.
	:param entfrom:
	:type entfrom: Standard_Transient
	:param entto:
	:type entto: Standard_Transient
	:rtype: bool") Updated;
		Standard_Boolean Updated (const opencascade::handle<Standard_Transient> & entfrom,opencascade::handle<Standard_Transient> & entto);

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
		/****************** AddWithGraph ******************/
		%feature("compactdefaultargs") AddWithGraph;
		%feature("autodoc", "* Adds a list of entities in the context given by the graph Default takes the count of entities selected by the applied selection, when it is given each entity of the list Can be redefined
	:param list:
	:type list: TColStd_HSequenceOfTransient
	:param graph:
	:type graph: Interface_Graph
	:rtype: void") AddWithGraph;
		virtual void AddWithGraph (const opencascade::handle<TColStd_HSequenceOfTransient> & list,const Interface_Graph & graph);

		/****************** Applied ******************/
		%feature("compactdefaultargs") Applied;
		%feature("autodoc", "* Returns the applied selection
	:rtype: opencascade::handle<IFSelect_SelectDeduct>") Applied;
		opencascade::handle<IFSelect_SelectDeduct> Applied ();

		/****************** IFSelect_GraphCounter ******************/
		%feature("compactdefaultargs") IFSelect_GraphCounter;
		%feature("autodoc", "* Creates a GraphCounter, without applied selection
	:param withmap: default value is Standard_True
	:type withmap: bool
	:param withlist: default value is Standard_False
	:type withlist: bool
	:rtype: None") IFSelect_GraphCounter;
		 IFSelect_GraphCounter (const Standard_Boolean withmap = Standard_True,const Standard_Boolean withlist = Standard_False);

		/****************** SetApplied ******************/
		%feature("compactdefaultargs") SetApplied;
		%feature("autodoc", "* Sets a new applied selection
	:param sel:
	:type sel: IFSelect_SelectDeduct
	:rtype: None") SetApplied;
		void SetApplied (const opencascade::handle<IFSelect_SelectDeduct> & sel);

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
		/****************** EditForm ******************/
		%feature("compactdefaultargs") EditForm;
		%feature("autodoc", "* Returns the EditForm
	:rtype: opencascade::handle<IFSelect_EditForm>") EditForm;
		opencascade::handle<IFSelect_EditForm> EditForm ();

		/****************** IFSelect_ModifEditForm ******************/
		%feature("compactdefaultargs") IFSelect_ModifEditForm;
		%feature("autodoc", "* Creates a ModifEditForm. It may not change the graph
	:param editform:
	:type editform: IFSelect_EditForm
	:rtype: None") IFSelect_ModifEditForm;
		 IFSelect_ModifEditForm (const opencascade::handle<IFSelect_EditForm> & editform);

		/****************** Label ******************/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "* Returns Label as 'Apply EditForm <+ label of EditForm>'
	:rtype: TCollection_AsciiString") Label;
		TCollection_AsciiString Label ();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Acts by applying an EditForm to entities, selected or all model
	:param ctx:
	:type ctx: IFSelect_ContextModif
	:param target:
	:type target: Interface_InterfaceModel
	:param protocol:
	:type protocol: Interface_Protocol
	:param TC:
	:type TC: Interface_CopyTool
	:rtype: None") Perform;
		void Perform (IFSelect_ContextModif & ctx,const opencascade::handle<Interface_InterfaceModel> & target,const opencascade::handle<Interface_Protocol> & protocol,Interface_CopyTool & TC);

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
		%feature("autodoc", "* Creates a ModifReorder. It may change the graph (it does !) If <rootlast> is True (D), roots are set at the end of packets Else, they are set at beginning (as done by AddWithRefs)
	:param rootlast: default value is Standard_True
	:type rootlast: bool
	:rtype: None") IFSelect_ModifReorder;
		 IFSelect_ModifReorder (const Standard_Boolean rootlast = Standard_True);

		/****************** Label ******************/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "* Returns Label as 'Reorder, Roots (last or first)'
	:rtype: TCollection_AsciiString") Label;
		TCollection_AsciiString Label ();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Acts by computing orders (by method All from ShareTool) then forcing them in the model. Remark that selection is ignored : ALL the model is processed in once
	:param ctx:
	:type ctx: IFSelect_ContextModif
	:param target:
	:type target: Interface_InterfaceModel
	:param protocol:
	:type protocol: Interface_Protocol
	:param TC:
	:type TC: Interface_CopyTool
	:rtype: None") Perform;
		void Perform (IFSelect_ContextModif & ctx,const opencascade::handle<Interface_InterfaceModel> & target,const opencascade::handle<Interface_Protocol> & protocol,Interface_CopyTool & TC);

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
		%feature("autodoc", "* Puts into <res>, the sub-entities of the list, from n1 to n2 included. Remark that adequation with Entity's type and length of list has already been made at this stage Called by RootResult
	:param n1:
	:type n1: int
	:param n2:
	:type n2: int
	:param ent:
	:type ent: Standard_Transient
	:param res:
	:type res: Interface_EntityIterator
	:rtype: void") FillResult;
		virtual void FillResult (const Standard_Integer n1,const Standard_Integer n2,const opencascade::handle<Standard_Transient> & ent,Interface_EntityIterator & res);

		/****************** HasLower ******************/
		%feature("compactdefaultargs") HasLower;
		%feature("autodoc", "* Returns True if a Lower limit is defined
	:rtype: bool") HasLower;
		Standard_Boolean HasLower ();

		/****************** HasUpper ******************/
		%feature("compactdefaultargs") HasUpper;
		%feature("autodoc", "* Returns True if a Lower limit is defined
	:rtype: bool") HasUpper;
		Standard_Boolean HasUpper ();

		/****************** KeepInputEntity ******************/
		%feature("compactdefaultargs") KeepInputEntity;
		%feature("autodoc", "* Keeps Input Entity, as having required type. It works by keeping in <iter>, only suitable Entities (SelectType can be used). Called by RootResult (which waits for ONE ENTITY MAX)
	:param iter:
	:type iter: Interface_EntityIterator
	:rtype: void") KeepInputEntity;
		virtual void KeepInputEntity (Interface_EntityIterator & iter);

		/****************** Label ******************/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "* Returns a text defining the criterium : 'Componants of List ' then Specific List Label, then, following cases : ' From .. Until ..' or 'From ..' or 'Until ..' or 'Rank no ..' Specific type is given by deferred method ListLabel
	:rtype: TCollection_AsciiString") Label;
		TCollection_AsciiString Label ();

		/****************** ListLabel ******************/
		%feature("compactdefaultargs") ListLabel;
		%feature("autodoc", "* Returns the specific label for the list, which is included as a part of Label
	:rtype: TCollection_AsciiString") ListLabel;
		virtual TCollection_AsciiString ListLabel ();

		/****************** Lower ******************/
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "* Returns Lower limit (if there is; else, value is senseless)
	:rtype: opencascade::handle<IFSelect_IntParam>") Lower;
		opencascade::handle<IFSelect_IntParam> Lower ();

		/****************** LowerValue ******************/
		%feature("compactdefaultargs") LowerValue;
		%feature("autodoc", "* Returns Integer Value of Lower Limit (0 if none)
	:rtype: int") LowerValue;
		Standard_Integer LowerValue ();

		/****************** NbItems ******************/
		%feature("compactdefaultargs") NbItems;
		%feature("autodoc", "* Returns count of Items in the list in the Entity <ent> If <ent> has not required type, returned value must be Zero
	:param ent:
	:type ent: Standard_Transient
	:rtype: int") NbItems;
		virtual Standard_Integer NbItems (const opencascade::handle<Standard_Transient> & ent);

		/****************** RootResult ******************/
		%feature("compactdefaultargs") RootResult;
		%feature("autodoc", "* Returns the list of selected entities (list of entities complying with rank criterium) Error if the input list has more than one Item
	:param G:
	:type G: Interface_Graph
	:rtype: Interface_EntityIterator") RootResult;
		Interface_EntityIterator RootResult (const Interface_Graph & G);

		/****************** SetFrom ******************/
		%feature("compactdefaultargs") SetFrom;
		%feature("autodoc", "* Sets a Lower limit but no upper limit
	:param rankfrom:
	:type rankfrom: IFSelect_IntParam
	:rtype: None") SetFrom;
		void SetFrom (const opencascade::handle<IFSelect_IntParam> & rankfrom);

		/****************** SetOne ******************/
		%feature("compactdefaultargs") SetOne;
		%feature("autodoc", "* Sets a unique number (only one Entity will be sorted as True)
	:param rank:
	:type rank: IFSelect_IntParam
	:rtype: None") SetOne;
		void SetOne (const opencascade::handle<IFSelect_IntParam> & rank);

		/****************** SetRange ******************/
		%feature("compactdefaultargs") SetRange;
		%feature("autodoc", "* Sets a Range for numbers, with a lower and a upper limits
	:param rankfrom:
	:type rankfrom: IFSelect_IntParam
	:param rankto:
	:type rankto: IFSelect_IntParam
	:rtype: None") SetRange;
		void SetRange (const opencascade::handle<IFSelect_IntParam> & rankfrom,const opencascade::handle<IFSelect_IntParam> & rankto);

		/****************** SetUntil ******************/
		%feature("compactdefaultargs") SetUntil;
		%feature("autodoc", "* Sets an Upper limit but no lower limit (equivalent to lower 1)
	:param rankto:
	:type rankto: IFSelect_IntParam
	:rtype: None") SetUntil;
		void SetUntil (const opencascade::handle<IFSelect_IntParam> & rankto);

		/****************** Upper ******************/
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "* Returns Upper limit (if there is; else, value is senseless)
	:rtype: opencascade::handle<IFSelect_IntParam>") Upper;
		opencascade::handle<IFSelect_IntParam> Upper ();

		/****************** UpperValue ******************/
		%feature("compactdefaultargs") UpperValue;
		%feature("autodoc", "* Returns Integer Value of Upper Limit (0 if none)
	:rtype: int") UpperValue;
		Standard_Integer UpperValue ();

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
		%feature("autodoc", "* Creates an empty SelectDiff
	:rtype: None") IFSelect_SelectDiff;
		 IFSelect_SelectDiff ();

		/****************** Label ******************/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "* Returns a text defining the criterium : 'Difference'
	:rtype: TCollection_AsciiString") Label;
		TCollection_AsciiString Label ();

		/****************** RootResult ******************/
		%feature("compactdefaultargs") RootResult;
		%feature("autodoc", "* Returns the list of selected entities : they are the Entities gotten from the Main Input but not from the Diff Input
	:param G:
	:type G: Interface_Graph
	:rtype: Interface_EntityIterator") RootResult;
		Interface_EntityIterator RootResult (const Interface_Graph & G);

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
		%feature("autodoc", "* Creates a SelectEntityNumber, initially with no specified Number
	:rtype: None") IFSelect_SelectEntityNumber;
		 IFSelect_SelectEntityNumber ();

		/****************** Label ******************/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "* Returns a text defining the criterium : 'Entity Number ...'
	:rtype: TCollection_AsciiString") Label;
		TCollection_AsciiString Label ();

		/****************** Number ******************/
		%feature("compactdefaultargs") Number;
		%feature("autodoc", "* Returns specified Number (as a Parameter)
	:rtype: opencascade::handle<IFSelect_IntParam>") Number;
		opencascade::handle<IFSelect_IntParam> Number ();

		/****************** RootResult ******************/
		%feature("compactdefaultargs") RootResult;
		%feature("autodoc", "* Returns the list of selected entities : the Entity having the specified Number (this result assures naturally uniqueness)
	:param G:
	:type G: Interface_Graph
	:rtype: Interface_EntityIterator") RootResult;
		Interface_EntityIterator RootResult (const Interface_Graph & G);

		/****************** SetNumber ******************/
		%feature("compactdefaultargs") SetNumber;
		%feature("autodoc", "* Sets Entity Number to be taken (initially, none is set : 0)
	:param num:
	:type num: IFSelect_IntParam
	:rtype: None") SetNumber;
		void SetNumber (const opencascade::handle<IFSelect_IntParam> & num);

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
		%feature("autodoc", "* Analyses and, if required, Explores an entity, as follows : The explored list starts as empty, it has to be filled by this method. If it returns False, <ent> is rejected for result (this is to be used only as safety) If it returns True and <explored> remains empty, <ent> is taken itself for result, not explored If it returns True and <explored> is not empty, the content of this list is considered : If maximum level is attained, it is taken for result Else (or no max), each of its entity will be itself explored
	:param level:
	:type level: int
	:param ent:
	:type ent: Standard_Transient
	:param G:
	:type G: Interface_Graph
	:param explored:
	:type explored: Interface_EntityIterator
	:rtype: bool") Explore;
		virtual Standard_Boolean Explore (const Standard_Integer level,const opencascade::handle<Standard_Transient> & ent,const Interface_Graph & G,Interface_EntityIterator & explored);

		/****************** ExploreLabel ******************/
		%feature("compactdefaultargs") ExploreLabel;
		%feature("autodoc", "* Returns a text defining the way of exploration
	:rtype: TCollection_AsciiString") ExploreLabel;
		virtual TCollection_AsciiString ExploreLabel ();

		/****************** Label ******************/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "* Returns a text saying '(Recursive)' or '(Level nn)' plus specific criterium returned by ExploreLabel (see below)
	:rtype: TCollection_AsciiString") Label;
		TCollection_AsciiString Label ();

		/****************** Level ******************/
		%feature("compactdefaultargs") Level;
		%feature("autodoc", "* Returns the required exploring level
	:rtype: int") Level;
		Standard_Integer Level ();

		/****************** RootResult ******************/
		%feature("compactdefaultargs") RootResult;
		%feature("autodoc", "* Returns the list of selected entities. Works by calling the method Explore on each input entity : it can be rejected, taken for output, or to explore. If the maximum level has not yet been attained, or if no max level is specified, entities to be explored are themselves used as if they were input
	:param G:
	:type G: Interface_Graph
	:rtype: Interface_EntityIterator") RootResult;
		Interface_EntityIterator RootResult (const Interface_Graph & G);

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
		%feature("autodoc", "* Returns a text defining the criterium for extraction
	:rtype: TCollection_AsciiString") ExtractLabel;
		virtual TCollection_AsciiString ExtractLabel ();

		/****************** IsDirect ******************/
		%feature("compactdefaultargs") IsDirect;
		%feature("autodoc", "* Returns True if Sort criterium is Direct, False if Reverse
	:rtype: bool") IsDirect;
		Standard_Boolean IsDirect ();

		/****************** Label ******************/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "* Returns a text saying 'Picked' or 'Removed', plus the specific criterium returned by ExtractLabel (see below)
	:rtype: TCollection_AsciiString") Label;
		TCollection_AsciiString Label ();

		/****************** RootResult ******************/
		%feature("compactdefaultargs") RootResult;
		%feature("autodoc", "* Returns the list of selected entities. Works by calling the method Sort on each input Entity : the Entity is kept as output if Sort returns the same value as Direct status
	:param G:
	:type G: Interface_Graph
	:rtype: Interface_EntityIterator") RootResult;
		virtual Interface_EntityIterator RootResult (const Interface_Graph & G);

		/****************** SetDirect ******************/
		%feature("compactdefaultargs") SetDirect;
		%feature("autodoc", "* Sets Sort criterium sense to a new value (True : Direct , False : Reverse)
	:param direct:
	:type direct: bool
	:rtype: None") SetDirect;
		void SetDirect (const Standard_Boolean direct);

		/****************** Sort ******************/
		%feature("compactdefaultargs") Sort;
		%feature("autodoc", "* Returns True for an Entity if it satisfies the Sort criterium It receives : - <rank>, the rank of the Entity in the Iteration, - <ent> , the Entity itself, and - <model>, the Starting Model Hence, the Entity to check is 'model->Value(num)' (but an InterfaceModel allows other checks) This method is specific to each class of SelectExtract
	:param rank:
	:type rank: int
	:param ent:
	:type ent: Standard_Transient
	:param model:
	:type model: Interface_InterfaceModel
	:rtype: bool") Sort;
		virtual Standard_Boolean Sort (const Standard_Integer rank,const opencascade::handle<Standard_Transient> & ent,const opencascade::handle<Interface_InterfaceModel> & model);

		/****************** SortInGraph ******************/
		%feature("compactdefaultargs") SortInGraph;
		%feature("autodoc", "* Works as Sort but works on the Graph Default directly calls Sort, but it can be redefined If SortInGraph is redefined, Sort should be defined even if not called (to avoid deferred methods in a final class)
	:param rank:
	:type rank: int
	:param ent:
	:type ent: Standard_Transient
	:param G:
	:type G: Interface_Graph
	:rtype: bool") SortInGraph;
		virtual Standard_Boolean SortInGraph (const Standard_Integer rank,const opencascade::handle<Standard_Transient> & ent,const Interface_Graph & G);

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
		%feature("autodoc", "* Creates an empty SelectIntersection
	:rtype: None") IFSelect_SelectIntersection;
		 IFSelect_SelectIntersection ();

		/****************** Label ******************/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "* Returns a text defining the criterium : 'Intersection (AND)'
	:rtype: TCollection_AsciiString") Label;
		TCollection_AsciiString Label ();

		/****************** RootResult ******************/
		%feature("compactdefaultargs") RootResult;
		%feature("autodoc", "* Returns the list of selected Entities, which is the common part of results from all input selections. Uniqueness is guaranteed.
	:param G:
	:type G: Interface_Graph
	:rtype: Interface_EntityIterator") RootResult;
		Interface_EntityIterator RootResult (const Interface_Graph & G);

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
		/****************** CompleteResult ******************/
		%feature("compactdefaultargs") CompleteResult;
		%feature("autodoc", "* The complete list of Entities (including shared ones) ... is exactly identical to RootResults in this case
	:param G:
	:type G: Interface_Graph
	:rtype: Interface_EntityIterator") CompleteResult;
		virtual Interface_EntityIterator CompleteResult (const Interface_Graph & G);

		/****************** IFSelect_SelectModelEntities ******************/
		%feature("compactdefaultargs") IFSelect_SelectModelEntities;
		%feature("autodoc", "* Creates a SelectModelRoot
	:rtype: None") IFSelect_SelectModelEntities;
		 IFSelect_SelectModelEntities ();

		/****************** Label ******************/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "* Returns a text defining the criterium : 'Model Entities'
	:rtype: TCollection_AsciiString") Label;
		TCollection_AsciiString Label ();

		/****************** RootResult ******************/
		%feature("compactdefaultargs") RootResult;
		%feature("autodoc", "* Returns the list of selected entities : the Entities of the Model (note that this result assures naturally uniqueness)
	:param G:
	:type G: Interface_Graph
	:rtype: Interface_EntityIterator") RootResult;
		Interface_EntityIterator RootResult (const Interface_Graph & G);

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
		%feature("autodoc", "* Creates a SelectModelRoot
	:rtype: None") IFSelect_SelectModelRoots;
		 IFSelect_SelectModelRoots ();

		/****************** Label ******************/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "* Returns a text defining the criterium : 'Model Roots'
	:rtype: TCollection_AsciiString") Label;
		TCollection_AsciiString Label ();

		/****************** RootResult ******************/
		%feature("compactdefaultargs") RootResult;
		%feature("autodoc", "* Returns the list of selected entities : the Roots of the Model (note that this result assures naturally uniqueness)
	:param G:
	:type G: Interface_Graph
	:rtype: Interface_EntityIterator") RootResult;
		Interface_EntityIterator RootResult (const Interface_Graph & G);

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
		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "* Adds an item. Returns True if Done, False if <item> is already in the selected list
	:param item:
	:type item: Standard_Transient
	:rtype: bool") Add;
		Standard_Boolean Add (const opencascade::handle<Standard_Transient> & item);

		/****************** AddList ******************/
		%feature("compactdefaultargs") AddList;
		%feature("autodoc", "* Adds all the items defined in a list. Returns True if at least one item has been added, False else
	:param list:
	:type list: TColStd_HSequenceOfTransient
	:rtype: bool") AddList;
		Standard_Boolean AddList (const opencascade::handle<TColStd_HSequenceOfTransient> & list);

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "* Clears the list of selected items Also says the list is unset All Add* methods and SetList say the list is set
	:rtype: None") Clear;
		void Clear ();

		/****************** IFSelect_SelectPointed ******************/
		%feature("compactdefaultargs") IFSelect_SelectPointed;
		%feature("autodoc", "* Creates a SelectPointed
	:rtype: None") IFSelect_SelectPointed;
		 IFSelect_SelectPointed ();

		/****************** IsSet ******************/
		%feature("compactdefaultargs") IsSet;
		%feature("autodoc", "* Tells if the list has been set. Even if empty
	:rtype: bool") IsSet;
		Standard_Boolean IsSet ();

		/****************** Item ******************/
		%feature("compactdefaultargs") Item;
		%feature("autodoc", "* Returns an item given its rank, or a Null Handle
	:param num:
	:type num: int
	:rtype: opencascade::handle<Standard_Transient>") Item;
		opencascade::handle<Standard_Transient> Item (const Standard_Integer num);

		/****************** Label ******************/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "* Returns a text which identifies the type of selection made. It is 'Pointed Entities'
	:rtype: TCollection_AsciiString") Label;
		TCollection_AsciiString Label ();

		/****************** NbItems ******************/
		%feature("compactdefaultargs") NbItems;
		%feature("autodoc", "* Returns the count of selected items
	:rtype: int") NbItems;
		Standard_Integer NbItems ();

		/****************** Rank ******************/
		%feature("compactdefaultargs") Rank;
		%feature("autodoc", "* Returns the rank of an item in the selected list, or 0.
	:param item:
	:type item: Standard_Transient
	:rtype: int") Rank;
		Standard_Integer Rank (const opencascade::handle<Standard_Transient> & item);

		/****************** Remove ******************/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "* Removes an item. Returns True if Done, False if <item> was not in the selected list
	:param item:
	:type item: Standard_Transient
	:rtype: bool") Remove;
		Standard_Boolean Remove (const opencascade::handle<Standard_Transient> & item);

		/****************** RemoveList ******************/
		%feature("compactdefaultargs") RemoveList;
		%feature("autodoc", "* Removes all the items defined in a list. Returns True if at least one item has been removed, False else
	:param list:
	:type list: TColStd_HSequenceOfTransient
	:rtype: bool") RemoveList;
		Standard_Boolean RemoveList (const opencascade::handle<TColStd_HSequenceOfTransient> & list);

		/****************** RootResult ******************/
		%feature("compactdefaultargs") RootResult;
		%feature("autodoc", "* Returns the list of selected items. Only the selected entities which are present in the graph are given (this result assures uniqueness).
	:param G:
	:type G: Interface_Graph
	:rtype: Interface_EntityIterator") RootResult;
		Interface_EntityIterator RootResult (const Interface_Graph & G);

		/****************** SetEntity ******************/
		%feature("compactdefaultargs") SetEntity;
		%feature("autodoc", "* As SetList but with only one entity If <ent> is Null, the list is said as being set but is empty
	:param item:
	:type item: Standard_Transient
	:rtype: None") SetEntity;
		void SetEntity (const opencascade::handle<Standard_Transient> & item);

		/****************** SetList ******************/
		%feature("compactdefaultargs") SetList;
		%feature("autodoc", "* Sets a given list to define the list of selected items <list> can be empty or null : in this case, the list is said as being set, but it is empty //! To use it as an alternate input, one shot : - SetList or SetEntity to define the input list - RootResult to get it - then Clear to drop it
	:param list:
	:type list: TColStd_HSequenceOfTransient
	:rtype: None") SetList;
		void SetList (const opencascade::handle<TColStd_HSequenceOfTransient> & list);

		/****************** Toggle ******************/
		%feature("compactdefaultargs") Toggle;
		%feature("autodoc", "* Toggles status of an item : adds it if not pointed or removes it if already pointed. Returns the new status (Pointed or not)
	:param item:
	:type item: Standard_Transient
	:rtype: bool") Toggle;
		Standard_Boolean Toggle (const opencascade::handle<Standard_Transient> & item);

		/****************** ToggleList ******************/
		%feature("compactdefaultargs") ToggleList;
		%feature("autodoc", "* Toggles status of all the items defined in a list : adds it if not pointed or removes it if already pointed.
	:param list:
	:type list: TColStd_HSequenceOfTransient
	:rtype: bool") ToggleList;
		Standard_Boolean ToggleList (const opencascade::handle<TColStd_HSequenceOfTransient> & list);

		/****************** Update ******************/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "* Rebuilds the selected list. Any selected entity which has a bound result is replaced by this result, else it is removed.
	:param control:
	:type control: Interface_CopyControl
	:rtype: None") Update;
		void Update (const opencascade::handle<Interface_CopyControl> & control);

		/****************** Update ******************/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "* Rebuilds the selected list, by querying a Transformer (same principle as from a CopyControl)
	:param trf:
	:type trf: IFSelect_Transformer
	:rtype: None") Update;
		void Update (const opencascade::handle<IFSelect_Transformer> & trf);

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
		%feature("autodoc", "* Creates a SelectShared;
	:rtype: None") IFSelect_SelectShared;
		 IFSelect_SelectShared ();

		/****************** Label ******************/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "* Returns a text defining the criterium : 'Shared (one level)'
	:rtype: TCollection_AsciiString") Label;
		TCollection_AsciiString Label ();

		/****************** RootResult ******************/
		%feature("compactdefaultargs") RootResult;
		%feature("autodoc", "* Returns the list of selected entities (list of entities shared by those of input list)
	:param G:
	:type G: Interface_Graph
	:rtype: Interface_EntityIterator") RootResult;
		Interface_EntityIterator RootResult (const Interface_Graph & G);

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
		%feature("autodoc", "* Creates a SelectSharing;
	:rtype: None") IFSelect_SelectSharing;
		 IFSelect_SelectSharing ();

		/****************** Label ******************/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "* Returns a text defining the criterium : 'Sharing (one level)'
	:rtype: TCollection_AsciiString") Label;
		TCollection_AsciiString Label ();

		/****************** RootResult ******************/
		%feature("compactdefaultargs") RootResult;
		%feature("autodoc", "* Returns the list of selected entities (list of entities which share (level one) those of input list)
	:param G:
	:type G: Interface_Graph
	:rtype: Interface_EntityIterator") RootResult;
		Interface_EntityIterator RootResult (const Interface_Graph & G);

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
		/****************** AddInput ******************/
		%feature("compactdefaultargs") AddInput;
		%feature("autodoc", "* Adds an input selection. I.E. : If <item> is a SelectDeduct, adds it as Previous, not as Input Else, sets it as Input Returns True when done Returns False and refuses to work if Input is already defined
	:param item:
	:type item: IFSelect_Selection
	:rtype: bool") AddInput;
		Standard_Boolean AddInput (const opencascade::handle<IFSelect_Selection> & item);

		/****************** AddNext ******************/
		%feature("compactdefaultargs") AddNext;
		%feature("autodoc", "* Adds a new last item (prepends to the list) If <item> is null, does nothing
	:param item:
	:type item: IFSelect_SelectDeduct
	:rtype: None") AddNext;
		void AddNext (const opencascade::handle<IFSelect_SelectDeduct> & item);

		/****************** AddPrevious ******************/
		%feature("compactdefaultargs") AddPrevious;
		%feature("autodoc", "* Adds a new first item (prepends to the list). The Input is not touched If <item> is null, does nothing
	:param item:
	:type item: IFSelect_SelectDeduct
	:rtype: None") AddPrevious;
		void AddPrevious (const opencascade::handle<IFSelect_SelectDeduct> & item);

		/****************** IFSelect_SelectSuite ******************/
		%feature("compactdefaultargs") IFSelect_SelectSuite;
		%feature("autodoc", "* Creates an empty SelectSuite
	:rtype: None") IFSelect_SelectSuite;
		 IFSelect_SelectSuite ();

		/****************** Item ******************/
		%feature("compactdefaultargs") Item;
		%feature("autodoc", "* Returns an item from its rank in the list (the Input is always apart)
	:param num:
	:type num: int
	:rtype: opencascade::handle<IFSelect_SelectDeduct>") Item;
		opencascade::handle<IFSelect_SelectDeduct> Item (const Standard_Integer num);

		/****************** Label ******************/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "* Returns the Label Either it has been defined by SetLabel, or it will give 'Suite of nn Selections'
	:rtype: TCollection_AsciiString") Label;
		TCollection_AsciiString Label ();

		/****************** NbItems ******************/
		%feature("compactdefaultargs") NbItems;
		%feature("autodoc", "* Returns the count of Items
	:rtype: int") NbItems;
		Standard_Integer NbItems ();

		/****************** RootResult ******************/
		%feature("compactdefaultargs") RootResult;
		%feature("autodoc", "* Returns the list of selected entities To do this, once InputResult has been taken (if Input or Alternate has been defined, else the first Item gives it) : this result is set as alternate input for the first item, which computes its result : this result is set as alternate input for the second item, etc...
	:param G:
	:type G: Interface_Graph
	:rtype: Interface_EntityIterator") RootResult;
		Interface_EntityIterator RootResult (const Interface_Graph & G);

		/****************** SetLabel ******************/
		%feature("compactdefaultargs") SetLabel;
		%feature("autodoc", "* Sets a value for the Label
	:param lab:
	:type lab: char *
	:rtype: None") SetLabel;
		void SetLabel (const char * lab);

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
		%feature("autodoc", "* Creates an empty SelectUnion
	:rtype: None") IFSelect_SelectUnion;
		 IFSelect_SelectUnion ();

		/****************** Label ******************/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "* Returns a text defining the criterium : 'Union (OR)'
	:rtype: TCollection_AsciiString") Label;
		TCollection_AsciiString Label ();

		/****************** RootResult ******************/
		%feature("compactdefaultargs") RootResult;
		%feature("autodoc", "* Returns the list of selected Entities, which is the addition result from all input selections. Uniqueness is guaranteed.
	:param G:
	:type G: Interface_Graph
	:rtype: Interface_EntityIterator") RootResult;
		Interface_EntityIterator RootResult (const Interface_Graph & G);

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
		%feature("autodoc", ":param nopk: default value is Standard_False
	:type nopk: bool
	:rtype: None") IFSelect_SignAncestor;
		 IFSelect_SignAncestor (const Standard_Boolean nopk = Standard_False);

		/****************** Matches ******************/
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", ":param ent:
	:type ent: Standard_Transient
	:param model:
	:type model: Interface_InterfaceModel
	:param text:
	:type text: TCollection_AsciiString
	:param exact:
	:type exact: bool
	:rtype: bool") Matches;
		virtual Standard_Boolean Matches (const opencascade::handle<Standard_Transient> & ent,const opencascade::handle<Interface_InterfaceModel> & model,const TCollection_AsciiString & text,const Standard_Boolean exact);

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
		%feature("autodoc", "* Returns True for an Entity (model->Value(num)) which is kind of the choosen type, given by the method TypeForMatch. Criterium is IsKind.
	:param rank:
	:type rank: int
	:param ent:
	:type ent: Standard_Transient
	:param model:
	:type model: Interface_InterfaceModel
	:rtype: bool") Sort;
		Standard_Boolean Sort (const Standard_Integer rank,const opencascade::handle<Standard_Transient> & ent,const opencascade::handle<Interface_InterfaceModel> & model);

		/****************** TypeForMatch ******************/
		%feature("compactdefaultargs") TypeForMatch;
		%feature("autodoc", "* Returns the Type which has to be matched for select
	:rtype: opencascade::handle<Standard_Type>") TypeForMatch;
		virtual opencascade::handle<Standard_Type> TypeForMatch ();

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
		/****************** ExtractLabel ******************/
		%feature("compactdefaultargs") ExtractLabel;
		%feature("autodoc", "* Returns a text defining the criterium : 'Error Entities'
	:rtype: TCollection_AsciiString") ExtractLabel;
		TCollection_AsciiString ExtractLabel ();

		/****************** IFSelect_SelectErrorEntities ******************/
		%feature("compactdefaultargs") IFSelect_SelectErrorEntities;
		%feature("autodoc", "* Creates a SelectErrorEntities
	:rtype: None") IFSelect_SelectErrorEntities;
		 IFSelect_SelectErrorEntities ();

		/****************** Sort ******************/
		%feature("compactdefaultargs") Sort;
		%feature("autodoc", "* Returns True for an Entity which is qualified as 'Error', i.e. if <model> explicitly knows <ent> (through its Number) as Erroneous
	:param rank:
	:type rank: int
	:param ent:
	:type ent: Standard_Transient
	:param model:
	:type model: Interface_InterfaceModel
	:rtype: bool") Sort;
		Standard_Boolean Sort (const Standard_Integer rank,const opencascade::handle<Standard_Transient> & ent,const opencascade::handle<Interface_InterfaceModel> & model);

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
		/****************** ExtractLabel ******************/
		%feature("compactdefaultargs") ExtractLabel;
		%feature("autodoc", "* Returns a text defining the criterium, includes the flag name
	:rtype: TCollection_AsciiString") ExtractLabel;
		TCollection_AsciiString ExtractLabel ();

		/****************** FlagName ******************/
		%feature("compactdefaultargs") FlagName;
		%feature("autodoc", "* Returns the name of the flag
	:rtype: char *") FlagName;
		const char * FlagName ();

		/****************** IFSelect_SelectFlag ******************/
		%feature("compactdefaultargs") IFSelect_SelectFlag;
		%feature("autodoc", "* Creates a Select Flag, to query a flag designated by its name
	:param flagname:
	:type flagname: char *
	:rtype: None") IFSelect_SelectFlag;
		 IFSelect_SelectFlag (const char * flagname);

		/****************** RootResult ******************/
		%feature("compactdefaultargs") RootResult;
		%feature("autodoc", "* Returns the list of selected entities. It is redefined to work on the graph itself (not queried by sort) //! An entity is selected if its flag is True on Direct mode, False on Reversed mode //! If flag does not exist for the given name, returns an empty result, whatever the Direct/Reversed sense
	:param G:
	:type G: Interface_Graph
	:rtype: Interface_EntityIterator") RootResult;
		virtual Interface_EntityIterator RootResult (const Interface_Graph & G);

		/****************** Sort ******************/
		%feature("compactdefaultargs") Sort;
		%feature("autodoc", "* Returns always False because RootResult has done the work
	:param rank:
	:type rank: int
	:param ent:
	:type ent: Standard_Transient
	:param model:
	:type model: Interface_InterfaceModel
	:rtype: bool") Sort;
		Standard_Boolean Sort (const Standard_Integer rank,const opencascade::handle<Standard_Transient> & ent,const opencascade::handle<Interface_InterfaceModel> & model);

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
		%feature("autodoc", "* Puts into the result, the sub-entities of the list, from n1 to n2 included. Remark that adequation with Entity's type and length of list has already been made at this stage Called by RootResult; calls ListedEntity (see below)
	:param n1:
	:type n1: int
	:param n2:
	:type n2: int
	:param ent:
	:type ent: Standard_Transient
	:param result:
	:type result: Interface_EntityIterator
	:rtype: None") FillResult;
		void FillResult (const Standard_Integer n1,const Standard_Integer n2,const opencascade::handle<Standard_Transient> & ent,Interface_EntityIterator & result);

		/****************** ListedEntity ******************/
		%feature("compactdefaultargs") ListedEntity;
		%feature("autodoc", "* Returns an Entity, given its rank in the list
	:param num:
	:type num: int
	:param ent:
	:type ent: Standard_Transient
	:rtype: opencascade::handle<Standard_Transient>") ListedEntity;
		virtual opencascade::handle<Standard_Transient> ListedEntity (const Standard_Integer num,const opencascade::handle<Standard_Transient> & ent);

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
		/****************** ExtractLabel ******************/
		%feature("compactdefaultargs") ExtractLabel;
		%feature("autodoc", "* Returns a text defining the criterium : following cases, ' From .. Until ..' or 'From ..' or 'Until ..' or 'Rank no ..'
	:rtype: TCollection_AsciiString") ExtractLabel;
		TCollection_AsciiString ExtractLabel ();

		/****************** HasLower ******************/
		%feature("compactdefaultargs") HasLower;
		%feature("autodoc", "* Returns True if a Lower limit is defined
	:rtype: bool") HasLower;
		Standard_Boolean HasLower ();

		/****************** HasUpper ******************/
		%feature("compactdefaultargs") HasUpper;
		%feature("autodoc", "* Returns True if a Lower limit is defined
	:rtype: bool") HasUpper;
		Standard_Boolean HasUpper ();

		/****************** IFSelect_SelectRange ******************/
		%feature("compactdefaultargs") IFSelect_SelectRange;
		%feature("autodoc", "* Creates a SelectRange. Default is Take all the input list
	:rtype: None") IFSelect_SelectRange;
		 IFSelect_SelectRange ();

		/****************** Lower ******************/
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "* Returns Lower limit (if there is; else, value is senseless)
	:rtype: opencascade::handle<IFSelect_IntParam>") Lower;
		opencascade::handle<IFSelect_IntParam> Lower ();

		/****************** LowerValue ******************/
		%feature("compactdefaultargs") LowerValue;
		%feature("autodoc", "* Returns Value of Lower Limit (0 if none is defined)
	:rtype: int") LowerValue;
		Standard_Integer LowerValue ();

		/****************** SetFrom ******************/
		%feature("compactdefaultargs") SetFrom;
		%feature("autodoc", "* Sets a Lower limit but no upper limit
	:param rankfrom:
	:type rankfrom: IFSelect_IntParam
	:rtype: None") SetFrom;
		void SetFrom (const opencascade::handle<IFSelect_IntParam> & rankfrom);

		/****************** SetOne ******************/
		%feature("compactdefaultargs") SetOne;
		%feature("autodoc", "* Sets a unique number (only one Entity will be sorted as True)
	:param rank:
	:type rank: IFSelect_IntParam
	:rtype: None") SetOne;
		void SetOne (const opencascade::handle<IFSelect_IntParam> & rank);

		/****************** SetRange ******************/
		%feature("compactdefaultargs") SetRange;
		%feature("autodoc", "* Sets a Range for numbers, with a lower and a upper limits Error if rankto is lower then rankfrom
	:param rankfrom:
	:type rankfrom: IFSelect_IntParam
	:param rankto:
	:type rankto: IFSelect_IntParam
	:rtype: None") SetRange;
		void SetRange (const opencascade::handle<IFSelect_IntParam> & rankfrom,const opencascade::handle<IFSelect_IntParam> & rankto);

		/****************** SetUntil ******************/
		%feature("compactdefaultargs") SetUntil;
		%feature("autodoc", "* Sets an Upper limit but no lower limit (equivalent to lower 1)
	:param rankto:
	:type rankto: IFSelect_IntParam
	:rtype: None") SetUntil;
		void SetUntil (const opencascade::handle<IFSelect_IntParam> & rankto);

		/****************** Sort ******************/
		%feature("compactdefaultargs") Sort;
		%feature("autodoc", "* Returns True for an Entity of which occurence number in the iteration is inside the selected Range (considers <rank>)
	:param rank:
	:type rank: int
	:param ent:
	:type ent: Standard_Transient
	:param model:
	:type model: Interface_InterfaceModel
	:rtype: bool") Sort;
		Standard_Boolean Sort (const Standard_Integer rank,const opencascade::handle<Standard_Transient> & ent,const opencascade::handle<Interface_InterfaceModel> & model);

		/****************** Upper ******************/
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "* Returns Upper limit (if there is; else, value is senseless)
	:rtype: opencascade::handle<IFSelect_IntParam>") Upper;
		opencascade::handle<IFSelect_IntParam> Upper ();

		/****************** UpperValue ******************/
		%feature("compactdefaultargs") UpperValue;
		%feature("autodoc", "* Returns Value of Upper Limit (0 if none is defined)
	:rtype: int") UpperValue;
		Standard_Integer UpperValue ();

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
		/****************** ExtractLabel ******************/
		%feature("compactdefaultargs") ExtractLabel;
		%feature("autodoc", "* Returns a text defining the criterium : 'Local Root Componants'
	:rtype: TCollection_AsciiString") ExtractLabel;
		TCollection_AsciiString ExtractLabel ();

		/****************** IFSelect_SelectRootComps ******************/
		%feature("compactdefaultargs") IFSelect_SelectRootComps;
		%feature("autodoc", "* Creates a SelectRootComps
	:rtype: None") IFSelect_SelectRootComps;
		 IFSelect_SelectRootComps ();

		/****************** RootResult ******************/
		%feature("compactdefaultargs") RootResult;
		%feature("autodoc", "* Returns the list of local root strong componants, by one Entity par componant. It is redefined for a purpose of effeciency : calling a Sort routine for each Entity would cost more ressource than to work in once using a Map RootResult takes in account the Direct status
	:param G:
	:type G: Interface_Graph
	:rtype: Interface_EntityIterator") RootResult;
		virtual Interface_EntityIterator RootResult (const Interface_Graph & G);

		/****************** Sort ******************/
		%feature("compactdefaultargs") Sort;
		%feature("autodoc", "* Returns always True, because RootResult has done work
	:param rank:
	:type rank: int
	:param ent:
	:type ent: Standard_Transient
	:param model:
	:type model: Interface_InterfaceModel
	:rtype: bool") Sort;
		Standard_Boolean Sort (const Standard_Integer rank,const opencascade::handle<Standard_Transient> & ent,const opencascade::handle<Interface_InterfaceModel> & model);

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
		/****************** ExtractLabel ******************/
		%feature("compactdefaultargs") ExtractLabel;
		%feature("autodoc", "* Returns a text defining the criterium : 'Local Root Entities'
	:rtype: TCollection_AsciiString") ExtractLabel;
		TCollection_AsciiString ExtractLabel ();

		/****************** IFSelect_SelectRoots ******************/
		%feature("compactdefaultargs") IFSelect_SelectRoots;
		%feature("autodoc", "* Creates a SelectRoots
	:rtype: None") IFSelect_SelectRoots;
		 IFSelect_SelectRoots ();

		/****************** RootResult ******************/
		%feature("compactdefaultargs") RootResult;
		%feature("autodoc", "* Returns the list of local roots. It is redefined for a purpose of effeciency : calling a Sort routine for each Entity would cost more ressource than to work in once using a Map RootResult takes in account the Direct status
	:param G:
	:type G: Interface_Graph
	:rtype: Interface_EntityIterator") RootResult;
		virtual Interface_EntityIterator RootResult (const Interface_Graph & G);

		/****************** Sort ******************/
		%feature("compactdefaultargs") Sort;
		%feature("autodoc", "* Returns always True, because RootResult has done work
	:param rank:
	:type rank: int
	:param ent:
	:type ent: Standard_Transient
	:param model:
	:type model: Interface_InterfaceModel
	:rtype: bool") Sort;
		Standard_Boolean Sort (const Standard_Integer rank,const opencascade::handle<Standard_Transient> & ent,const opencascade::handle<Interface_InterfaceModel> & model);

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
		/****************** AtLeast ******************/
		%feature("compactdefaultargs") AtLeast;
		%feature("autodoc", "* Returns the <atleast> status, True for sending at least the sending count, False for sending exactly the sending count Remark : if SentCount is 0, AtLeast is ignored
	:rtype: bool") AtLeast;
		Standard_Boolean AtLeast ();

		/****************** ExtractLabel ******************/
		%feature("compactdefaultargs") ExtractLabel;
		%feature("autodoc", "* Returns a text defining the criterium : query : SentCount = 0 -> 'Remaining (non-sent) entities' SentCount = 1, AtLeast = True -> 'Sent entities' SentCount = 1, AtLeast = False -> 'Sent once (no duplicated)' SentCount = 2, AtLeast = True -> 'Sent several times entities' SentCount = 2, AtLeast = False -> 'Sent twice entities' SentCount > 2, AtLeast = True -> 'Sent at least <count> times entities' SentCount > 2, AtLeast = False -> 'Sent <count> times entities'
	:rtype: TCollection_AsciiString") ExtractLabel;
		TCollection_AsciiString ExtractLabel ();

		/****************** IFSelect_SelectSent ******************/
		%feature("compactdefaultargs") IFSelect_SelectSent;
		%feature("autodoc", "* Creates a SelectSent : sentcount = 0 -> remaining (non-sent) entities sentcount = 1, atleast = True (D) -> sent (at least once) sentcount = 2, atleast = True -> duplicated (sent least twice) etc... sentcount = 1, atleast = False -> sent just once (non-dupl.d) sentcount = 2, atleast = False -> sent just twice etc...
	:param sentcount: default value is 1
	:type sentcount: int
	:param atleast: default value is Standard_True
	:type atleast: bool
	:rtype: None") IFSelect_SelectSent;
		 IFSelect_SelectSent (const Standard_Integer sentcount = 1,const Standard_Boolean atleast = Standard_True);

		/****************** RootResult ******************/
		%feature("compactdefaultargs") RootResult;
		%feature("autodoc", "* Returns the list of selected entities. It is redefined to work on the graph itself (not queried by sort) //! An entity is selected if its count complies to the query in Direct Mode, rejected in Reversed Mode //! Query works on the sending count recorded as status in Graph
	:param G:
	:type G: Interface_Graph
	:rtype: Interface_EntityIterator") RootResult;
		virtual Interface_EntityIterator RootResult (const Interface_Graph & G);

		/****************** SentCount ******************/
		%feature("compactdefaultargs") SentCount;
		%feature("autodoc", "* Returns the queried count of sending
	:rtype: int") SentCount;
		Standard_Integer SentCount ();

		/****************** Sort ******************/
		%feature("compactdefaultargs") Sort;
		%feature("autodoc", "* Returns always False because RootResult has done the work
	:param rank:
	:type rank: int
	:param ent:
	:type ent: Standard_Transient
	:param model:
	:type model: Interface_InterfaceModel
	:rtype: bool") Sort;
		Standard_Boolean Sort (const Standard_Integer rank,const opencascade::handle<Standard_Transient> & ent,const opencascade::handle<Interface_InterfaceModel> & model);

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
		/****************** Counter ******************/
		%feature("compactdefaultargs") Counter;
		%feature("autodoc", "* Returns the used SignCounter. Can be used as alternative for Signature
	:rtype: opencascade::handle<IFSelect_SignCounter>") Counter;
		opencascade::handle<IFSelect_SignCounter> Counter ();

		/****************** ExtractLabel ******************/
		%feature("compactdefaultargs") ExtractLabel;
		%feature("autodoc", "* Returns a text defining the criterium. (it refers to the text and exact flag to be matched, and is qualified by the Name provided by the Signature)
	:rtype: TCollection_AsciiString") ExtractLabel;
		TCollection_AsciiString ExtractLabel ();

		/****************** IFSelect_SelectSignature ******************/
		%feature("compactdefaultargs") IFSelect_SelectSignature;
		%feature("autodoc", "* Creates a SelectSignature with its Signature and its Text to Match. <exact> if True requires exact match, if False requires <signtext> to be contained in the Signature of the entity (default is 'exact')
	:param matcher:
	:type matcher: IFSelect_Signature
	:param signtext:
	:type signtext: char *
	:param exact: default value is Standard_True
	:type exact: bool
	:rtype: None") IFSelect_SelectSignature;
		 IFSelect_SelectSignature (const opencascade::handle<IFSelect_Signature> & matcher,const char * signtext,const Standard_Boolean exact = Standard_True);

		/****************** IFSelect_SelectSignature ******************/
		%feature("compactdefaultargs") IFSelect_SelectSignature;
		%feature("autodoc", "* As above with an AsciiString
	:param matcher:
	:type matcher: IFSelect_Signature
	:param signtext:
	:type signtext: TCollection_AsciiString
	:param exact: default value is Standard_True
	:type exact: bool
	:rtype: None") IFSelect_SelectSignature;
		 IFSelect_SelectSignature (const opencascade::handle<IFSelect_Signature> & matcher,const TCollection_AsciiString & signtext,const Standard_Boolean exact = Standard_True);

		/****************** IFSelect_SelectSignature ******************/
		%feature("compactdefaultargs") IFSelect_SelectSignature;
		%feature("autodoc", "* Creates a SelectSignature with a Counter, more precisely a SelectSignature. Which is used here to just give a Signature Value (by SignOnly Mode) Matching is the default provided by the class Signature
	:param matcher:
	:type matcher: IFSelect_SignCounter
	:param signtext:
	:type signtext: char *
	:param exact: default value is Standard_True
	:type exact: bool
	:rtype: None") IFSelect_SelectSignature;
		 IFSelect_SelectSignature (const opencascade::handle<IFSelect_SignCounter> & matcher,const char * signtext,const Standard_Boolean exact = Standard_True);

		/****************** IsExact ******************/
		%feature("compactdefaultargs") IsExact;
		%feature("autodoc", "* Returns True if match must be exact
	:rtype: bool") IsExact;
		Standard_Boolean IsExact ();

		/****************** Signature ******************/
		%feature("compactdefaultargs") Signature;
		%feature("autodoc", "* Returns the used Signature, then it is possible to access it, modify it as required. Can be null, hence see Counter
	:rtype: opencascade::handle<IFSelect_Signature>") Signature;
		opencascade::handle<IFSelect_Signature> Signature ();

		/****************** SignatureText ******************/
		%feature("compactdefaultargs") SignatureText;
		%feature("autodoc", "* Returns Text used to Sort Entity on its Signature or SignCounter
	:rtype: TCollection_AsciiString") SignatureText;
		const TCollection_AsciiString & SignatureText ();

		/****************** Sort ******************/
		%feature("compactdefaultargs") Sort;
		%feature("autodoc", "* Not called, defined only to remove a deferred method here
	:param rank:
	:type rank: int
	:param ent:
	:type ent: Standard_Transient
	:param model:
	:type model: Interface_InterfaceModel
	:rtype: bool") Sort;
		Standard_Boolean Sort (const Standard_Integer rank,const opencascade::handle<Standard_Transient> & ent,const opencascade::handle<Interface_InterfaceModel> & model);

		/****************** SortInGraph ******************/
		%feature("compactdefaultargs") SortInGraph;
		%feature("autodoc", "* Returns True for an Entity (model->Value(num)) of which the signature matches the text given as creation time May also work with a Counter from the Graph
	:param rank:
	:type rank: int
	:param ent:
	:type ent: Standard_Transient
	:param G:
	:type G: Interface_Graph
	:rtype: bool") SortInGraph;
		virtual Standard_Boolean SortInGraph (const Standard_Integer rank,const opencascade::handle<Standard_Transient> & ent,const Interface_Graph & G);

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
		/****************** Explore ******************/
		%feature("compactdefaultargs") Explore;
		%feature("autodoc", "* Explores an entity : its Shared entities <ent> to take if it matches the Signature At level max, filters the result. Else gives all Shareds
	:param level:
	:type level: int
	:param ent:
	:type ent: Standard_Transient
	:param G:
	:type G: Interface_Graph
	:param explored:
	:type explored: Interface_EntityIterator
	:rtype: bool") Explore;
		Standard_Boolean Explore (const Standard_Integer level,const opencascade::handle<Standard_Transient> & ent,const Interface_Graph & G,Interface_EntityIterator & explored);

		/****************** ExploreLabel ******************/
		%feature("compactdefaultargs") ExploreLabel;
		%feature("autodoc", "* Returns a text defining the criterium. (it refers to the text and exact flag to be matched, and is qualified by the Name provided by the Signature)
	:rtype: TCollection_AsciiString") ExploreLabel;
		TCollection_AsciiString ExploreLabel ();

		/****************** IFSelect_SelectSignedShared ******************/
		%feature("compactdefaultargs") IFSelect_SelectSignedShared;
		%feature("autodoc", "* Creates a SelectSignedShared, defaulted for any level with a given Signature and text to match
	:param matcher:
	:type matcher: IFSelect_Signature
	:param signtext:
	:type signtext: char *
	:param exact: default value is Standard_True
	:type exact: bool
	:param level: default value is 0
	:type level: int
	:rtype: None") IFSelect_SelectSignedShared;
		 IFSelect_SelectSignedShared (const opencascade::handle<IFSelect_Signature> & matcher,const char * signtext,const Standard_Boolean exact = Standard_True,const Standard_Integer level = 0);

		/****************** IsExact ******************/
		%feature("compactdefaultargs") IsExact;
		%feature("autodoc", "* Returns True if match must be exact
	:rtype: bool") IsExact;
		Standard_Boolean IsExact ();

		/****************** Signature ******************/
		%feature("compactdefaultargs") Signature;
		%feature("autodoc", "* Returns the used Signature, then it is possible to access it, modify it as required
	:rtype: opencascade::handle<IFSelect_Signature>") Signature;
		opencascade::handle<IFSelect_Signature> Signature ();

		/****************** SignatureText ******************/
		%feature("compactdefaultargs") SignatureText;
		%feature("autodoc", "* Returns Text used to Sort Entity on its Signature
	:rtype: TCollection_AsciiString") SignatureText;
		const TCollection_AsciiString & SignatureText ();

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
		/****************** Explore ******************/
		%feature("compactdefaultargs") Explore;
		%feature("autodoc", "* Explores an entity : its sharing entities <ent> to take if it matches the Signature At level max, filters the result. Else gives all sharings
	:param level:
	:type level: int
	:param ent:
	:type ent: Standard_Transient
	:param G:
	:type G: Interface_Graph
	:param explored:
	:type explored: Interface_EntityIterator
	:rtype: bool") Explore;
		Standard_Boolean Explore (const Standard_Integer level,const opencascade::handle<Standard_Transient> & ent,const Interface_Graph & G,Interface_EntityIterator & explored);

		/****************** ExploreLabel ******************/
		%feature("compactdefaultargs") ExploreLabel;
		%feature("autodoc", "* Returns a text defining the criterium. (it refers to the text and exact flag to be matched, and is qualified by the Name provided by the Signature)
	:rtype: TCollection_AsciiString") ExploreLabel;
		TCollection_AsciiString ExploreLabel ();

		/****************** IFSelect_SelectSignedSharing ******************/
		%feature("compactdefaultargs") IFSelect_SelectSignedSharing;
		%feature("autodoc", "* Creates a SelectSignedSharing, defaulted for any level with a given Signature and text to match
	:param matcher:
	:type matcher: IFSelect_Signature
	:param signtext:
	:type signtext: char *
	:param exact: default value is Standard_True
	:type exact: bool
	:param level: default value is 0
	:type level: int
	:rtype: None") IFSelect_SelectSignedSharing;
		 IFSelect_SelectSignedSharing (const opencascade::handle<IFSelect_Signature> & matcher,const char * signtext,const Standard_Boolean exact = Standard_True,const Standard_Integer level = 0);

		/****************** IsExact ******************/
		%feature("compactdefaultargs") IsExact;
		%feature("autodoc", "* Returns True if match must be exact
	:rtype: bool") IsExact;
		Standard_Boolean IsExact ();

		/****************** Signature ******************/
		%feature("compactdefaultargs") Signature;
		%feature("autodoc", "* Returns the used Signature, then it is possible to access it, modify it as required
	:rtype: opencascade::handle<IFSelect_Signature>") Signature;
		opencascade::handle<IFSelect_Signature> Signature ();

		/****************** SignatureText ******************/
		%feature("compactdefaultargs") SignatureText;
		%feature("autodoc", "* Returns Text used to Sort Entity on its Signature
	:rtype: TCollection_AsciiString") SignatureText;
		const TCollection_AsciiString & SignatureText ();

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
		/****************** ExtractLabel ******************/
		%feature("compactdefaultargs") ExtractLabel;
		%feature("autodoc", "* Returns a text defining the criterium : 'Recognized Entities'
	:rtype: TCollection_AsciiString") ExtractLabel;
		TCollection_AsciiString ExtractLabel ();

		/****************** IFSelect_SelectUnknownEntities ******************/
		%feature("compactdefaultargs") IFSelect_SelectUnknownEntities;
		%feature("autodoc", "* Creates a SelectUnknownEntities
	:rtype: None") IFSelect_SelectUnknownEntities;
		 IFSelect_SelectUnknownEntities ();

		/****************** Sort ******************/
		%feature("compactdefaultargs") Sort;
		%feature("autodoc", "* Returns True for an Entity which is qualified as 'Unknown', i.e. if <model> known <ent> (through its Number) as Unknown
	:param rank:
	:type rank: int
	:param ent:
	:type ent: Standard_Transient
	:param model:
	:type model: Interface_InterfaceModel
	:rtype: bool") Sort;
		Standard_Boolean Sort (const Standard_Integer rank,const opencascade::handle<Standard_Transient> & ent,const opencascade::handle<Interface_InterfaceModel> & model);

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
		%feature("autodoc", "* Creates a SelectIncorrectEntities i.e. a SelectFlag('Incorrect')
	:rtype: None") IFSelect_SelectIncorrectEntities;
		 IFSelect_SelectIncorrectEntities ();

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
		/****************** ExtractLabel ******************/
		%feature("compactdefaultargs") ExtractLabel;
		%feature("autodoc", "* Returns a text defining the criterium. (should by gotten from Type of Entity used for instantiation)
	:rtype: TCollection_AsciiString") ExtractLabel;
		TCollection_AsciiString ExtractLabel ();

		/****************** IFSelect_SelectType ******************/
		%feature("compactdefaultargs") IFSelect_SelectType;
		%feature("autodoc", "* Creates a SelectType. Default is no filter
	:rtype: None") IFSelect_SelectType;
		 IFSelect_SelectType ();

		/****************** IFSelect_SelectType ******************/
		%feature("compactdefaultargs") IFSelect_SelectType;
		%feature("autodoc", "* Creates a SelectType for a given Type
	:param atype:
	:type atype: Standard_Type
	:rtype: None") IFSelect_SelectType;
		 IFSelect_SelectType (const opencascade::handle<Standard_Type> & atype);

		/****************** SetType ******************/
		%feature("compactdefaultargs") SetType;
		%feature("autodoc", "* Sets a TYpe for filter
	:param atype:
	:type atype: Standard_Type
	:rtype: None") SetType;
		void SetType (const opencascade::handle<Standard_Type> & atype);

		/****************** TypeForMatch ******************/
		%feature("compactdefaultargs") TypeForMatch;
		%feature("autodoc", "* Returns the Type to be matched for select : this is the type given at instantiation time
	:rtype: opencascade::handle<Standard_Type>") TypeForMatch;
		opencascade::handle<Standard_Type> TypeForMatch ();

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
class IFSelect_HSeqOfSelection : public  IFSelect_TSeqOfSelection, public Standard_Transient {
  public:
    IFSelect_HSeqOfSelection();
    IFSelect_HSeqOfSelection(const  IFSelect_TSeqOfSelection& theOther);
    const  IFSelect_TSeqOfSelection& Sequence();
    void Append (const  IFSelect_TSeqOfSelection::value_type& theItem);
    void Append ( IFSelect_TSeqOfSelection& theSequence);
     IFSelect_TSeqOfSelection& ChangeSequence();
};
%make_alias(IFSelect_HSeqOfSelection)


