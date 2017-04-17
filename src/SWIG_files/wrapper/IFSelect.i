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
%module (package="OCC") IFSelect

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


%include IFSelect_headers.i


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
typedef IFSelect_ReturnStatus ( * IFSelect_ActFunc ) ( const Handle_IFSelect_SessionPilot & );
typedef Handle_MoniTool_Option Handle_IFSelect_Option;
typedef MoniTool_Option IFSelect_Option;
typedef Handle_MoniTool_Profile Handle_IFSelect_Profile;
typedef MoniTool_Profile IFSelect_Profile;
/* end typedefs declaration */

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

%rename(ifselect) IFSelect;
class IFSelect {
	public:
		%feature("compactdefaultargs") SaveSession;
		%feature("autodoc", "	* Saves the state of a WorkSession from IFSelect, by using a SessionFile from IFSelect. Returns True if Done, False in case of Error on Writing. <file> gives the name of the File to be produced (this avoids to export the class SessionFile).

	:param WS:
	:type WS: Handle_IFSelect_WorkSession &
	:param file:
	:type file: char *
	:rtype: bool
") SaveSession;
		static Standard_Boolean SaveSession (const Handle_IFSelect_WorkSession & WS,const char * file);
		%feature("compactdefaultargs") RestoreSession;
		%feature("autodoc", "	* Restore the state of a WorkSession from IFSelect, by using a SessionFile from IFSelect. Returns True if Done, False in case of Error on Writing. <file> gives the name of the File to be used (this avoids to export the class SessionFile).

	:param WS:
	:type WS: Handle_IFSelect_WorkSession &
	:param file:
	:type file: char *
	:rtype: bool
") RestoreSession;
		static Standard_Boolean RestoreSession (const Handle_IFSelect_WorkSession & WS,const char * file);
};


%extend IFSelect {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IFSelect_Activator;
class IFSelect_Activator : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") Adding;
		%feature("autodoc", "	* Records, in a Dictionary available for all the Activators, the command title an Activator can process, attached with its number, proper for this Activator <mode> allows to distinguish various execution modes 0: default mode; 1 : for xset

	:param actor:
	:type actor: Handle_IFSelect_Activator &
	:param number:
	:type number: int
	:param command:
	:type command: char *
	:param mode:
	:type mode: int
	:rtype: void
") Adding;
		static void Adding (const Handle_IFSelect_Activator & actor,const Standard_Integer number,const char * command,const Standard_Integer mode);
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* Allows a self-definition by an Activator of the Commands it processes, call the class method Adding (mode 0)

	:param number:
	:type number: int
	:param command:
	:type command: char *
	:rtype: None
") Add;
		void Add (const Standard_Integer number,const char * command);
		%feature("compactdefaultargs") AddSet;
		%feature("autodoc", "	* Same as Add but specifies that this command is candidate for xset (creation of items, xset : named items; mode 1)

	:param number:
	:type number: int
	:param command:
	:type command: char *
	:rtype: None
") AddSet;
		void AddSet (const Standard_Integer number,const char * command);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	* Removes a Command, if it is recorded (else, does nothing)

	:param command:
	:type command: char *
	:rtype: void
") Remove;
		static void Remove (const char * command);
		%feature("compactdefaultargs") SetAlias;
		%feature("autodoc", "	* Records, for a configuration named <conf>, that the command <command> may be aliased by another command <alias> //! To be used by call to Alias (no automatic redirection) The configuration typically refers to a norm

	:param conf:
	:type conf: char *
	:param command:
	:type command: char *
	:param aliasname:
	:type aliasname: char *
	:rtype: void
") SetAlias;
		static void SetAlias (const char * conf,const char * command,const char * aliasname);
		%feature("compactdefaultargs") SetCurrentAlias;
		%feature("autodoc", "	* Sets <conf> as current configuration for aliases

	:param conf:
	:type conf: char *
	:rtype: void
") SetCurrentAlias;
		static void SetCurrentAlias (const char * conf);
		%feature("compactdefaultargs") Alias;
		%feature("autodoc", "	* Returns, in the current configuration, what alias has been recorded for <command> The returned string is empty if no alias is recorded

	:param command:
	:type command: char *
	:rtype: TCollection_AsciiString
") Alias;
		static TCollection_AsciiString Alias (const char * command);
		%feature("compactdefaultargs") Select;
		%feature("autodoc", "	* Selects, for a Command given by its title, an actor with its command number. Returns True if found, False else

	:param command:
	:type command: char *
	:param number:
	:type number: int &
	:param actor:
	:type actor: Handle_IFSelect_Activator &
	:rtype: bool
") Select;
		static Standard_Boolean Select (const char * command,Standard_Integer &OutValue,Handle_IFSelect_Activator & actor);
		%feature("compactdefaultargs") Mode;
		%feature("autodoc", "	* Returns mode recorded for a command. -1 if not found

	:param command:
	:type command: char *
	:rtype: int
") Mode;
		static Standard_Integer Mode (const char * command);
		%feature("compactdefaultargs") Commands;
		%feature("autodoc", "	* Returns, for a root of command title, the list of possible commands. <mode> : -1 (D) for all commands if <commands> is empty -1 + command : about a Group , >= 0 see Adding By default, it returns the whole list of known commands.

	:param mode: default value is -1
	:type mode: int
	:param command: default value is ""
	:type command: char *
	:rtype: Handle_TColStd_HSequenceOfAsciiString
") Commands;
		static Handle_TColStd_HSequenceOfAsciiString Commands (const Standard_Integer mode = -1,const char * command = "");
		%feature("compactdefaultargs") Do;
		%feature("autodoc", "	* Tries to execute a Command Line. <number> is the number of the command for this Activator. It Must forecast to record the result of the execution, for need of Undo-Redo Must Returns : 0 for a void command (not to be recorded), 1 if execution OK, -1 if command incorrect, -2 if error on execution

	:param number:
	:type number: int
	:param pilot:
	:type pilot: Handle_IFSelect_SessionPilot &
	:rtype: IFSelect_ReturnStatus
") Do;
		virtual IFSelect_ReturnStatus Do (const Standard_Integer number,const Handle_IFSelect_SessionPilot & pilot);
		%feature("compactdefaultargs") Help;
		%feature("autodoc", "	* Sends a short help message for a given command identified by it number for this Activator (must take one line max)

	:param number:
	:type number: int
	:rtype: char *
") Help;
		virtual const char * Help (const Standard_Integer number);
		%feature("compactdefaultargs") Group;
		%feature("autodoc", "	:rtype: char *
") Group;
		const char * Group ();
		%feature("compactdefaultargs") File;
		%feature("autodoc", "	:rtype: char *
") File;
		const char * File ();
		%feature("compactdefaultargs") SetForGroup;
		%feature("autodoc", "	* Group and SetGroup define a 'Group of commands' which correspond to an Activator. Default is 'XSTEP' Also a file may be attached

	:param group:
	:type group: char *
	:param file: default value is ""
	:type file: char *
	:rtype: None
") SetForGroup;
		void SetForGroup (const char * group,const char * file = "");
};


%extend IFSelect_Activator {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_IFSelect_Activator(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_IFSelect_Activator::Handle_IFSelect_Activator %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_IFSelect_Activator;
class Handle_IFSelect_Activator : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_IFSelect_Activator();
        Handle_IFSelect_Activator(const Handle_IFSelect_Activator &aHandle);
        Handle_IFSelect_Activator(const IFSelect_Activator *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_IFSelect_Activator DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_IFSelect_Activator {
    IFSelect_Activator* _get_reference() {
    return (IFSelect_Activator*)$self->Access();
    }
};

%extend Handle_IFSelect_Activator {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend IFSelect_Activator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IFSelect_AppliedModifiers;
class IFSelect_AppliedModifiers : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") IFSelect_AppliedModifiers;
		%feature("autodoc", "	* Creates an AppliedModifiers, ready to record up to <nbmax> modifiers, on a model of <nbent> entities

	:param nbmax:
	:type nbmax: int
	:param nbent:
	:type nbent: int
	:rtype: None
") IFSelect_AppliedModifiers;
		 IFSelect_AppliedModifiers (const Standard_Integer nbmax,const Standard_Integer nbent);
		%feature("compactdefaultargs") AddModif;
		%feature("autodoc", "	* Records a modifier. By default, it is to apply on all a produced file. Further calls to AddNum will restrict this. Returns True if done, False if too many modifiers are already recorded

	:param modif:
	:type modif: Handle_IFSelect_GeneralModifier &
	:rtype: bool
") AddModif;
		Standard_Boolean AddModif (const Handle_IFSelect_GeneralModifier & modif);
		%feature("compactdefaultargs") AddNum;
		%feature("autodoc", "	* Adds a number of entity of the output file to be applied on. If a sequence of AddNum is called after AddModif, this Modifier will be applied on the list of designated entities. Else, it will be applied on all the file Returns True if done, False if no modifier has yet been added

	:param nument:
	:type nument: int
	:rtype: bool
") AddNum;
		Standard_Boolean AddNum (const Standard_Integer nument);
		%feature("compactdefaultargs") Count;
		%feature("autodoc", "	* Returns the count of recorded modifiers

	:rtype: int
") Count;
		Standard_Integer Count ();
		%feature("compactdefaultargs") Item;
		%feature("autodoc", "	* Returns the description for applied modifier n0 <num> : the modifier itself, and the count of entities to be applied on. If no specific list of number has been defined, returns the total count of entities of the file If this count is zero, then the modifier applies to all the file (see below). Else, the numbers are then queried by calls to ItemNum between 1 and <entcount> Returns True if OK, False if <num> is out of range

	:param num:
	:type num: int
	:param modif:
	:type modif: Handle_IFSelect_GeneralModifier &
	:param entcount:
	:type entcount: int &
	:rtype: bool
") Item;
		Standard_Boolean Item (const Standard_Integer num,Handle_IFSelect_GeneralModifier & modif,Standard_Integer &OutValue);
		%feature("compactdefaultargs") ItemNum;
		%feature("autodoc", "	* Returns a numero of entity to be applied on, given its rank in the list. If no list is defined (i.e. for all the file), returns <nument> itself, to give all the entities of the file Returns 0 if <nument> out of range

	:param nument:
	:type nument: int
	:rtype: int
") ItemNum;
		Standard_Integer ItemNum (const Standard_Integer nument);
		%feature("compactdefaultargs") ItemList;
		%feature("autodoc", "	* Returns the list of entities to be applied on (see Item) as a HSequence (IsForAll produces the complete list of all the entity numbers of the file

	:rtype: Handle_TColStd_HSequenceOfInteger
") ItemList;
		Handle_TColStd_HSequenceOfInteger ItemList ();
		%feature("compactdefaultargs") IsForAll;
		%feature("autodoc", "	* Returns True if the applied modifier queried by last call to Item is to be applied to all the produced file. Else, <entcount> returned by Item gives the count of entity numbers, each one is queried by ItemNum

	:rtype: bool
") IsForAll;
		Standard_Boolean IsForAll ();
};


%extend IFSelect_AppliedModifiers {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_IFSelect_AppliedModifiers(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_IFSelect_AppliedModifiers::Handle_IFSelect_AppliedModifiers %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_IFSelect_AppliedModifiers;
class Handle_IFSelect_AppliedModifiers : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_IFSelect_AppliedModifiers();
        Handle_IFSelect_AppliedModifiers(const Handle_IFSelect_AppliedModifiers &aHandle);
        Handle_IFSelect_AppliedModifiers(const IFSelect_AppliedModifiers *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_IFSelect_AppliedModifiers DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_IFSelect_AppliedModifiers {
    IFSelect_AppliedModifiers* _get_reference() {
    return (IFSelect_AppliedModifiers*)$self->Access();
    }
};

%extend Handle_IFSelect_AppliedModifiers {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend IFSelect_AppliedModifiers {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IFSelect_ContextModif;
class IFSelect_ContextModif {
	public:
		%feature("compactdefaultargs") IFSelect_ContextModif;
		%feature("autodoc", "	* Prepares a ContextModif with these informations : - the graph established from original model (target passed directly to Modifier) - the CopyTool which detains the CopyControl, which maps starting (in original) and result (in target) entities - an optional file name (for file output) //! Such a ContextModif is considered to be applied on all transferred entities (no filter active)

	:param graph:
	:type graph: Interface_Graph &
	:param TC:
	:type TC: Interface_CopyTool &
	:param filename: default value is ""
	:type filename: char *
	:rtype: None
") IFSelect_ContextModif;
		 IFSelect_ContextModif (const Interface_Graph & graph,const Interface_CopyTool & TC,const char * filename = "");
		%feature("compactdefaultargs") IFSelect_ContextModif;
		%feature("autodoc", "	* Prepares a ContextModif with these informations : - the graph established from original model (target passed directly to Modifier) - an optional file name (for file output) Here, no CopyControl, hence all entities are considered equal as starting and result //! Such a ContextModif is considered to be applied on all transferred entities (no filter active)

	:param graph:
	:type graph: Interface_Graph &
	:param filename: default value is ""
	:type filename: char *
	:rtype: None
") IFSelect_ContextModif;
		 IFSelect_ContextModif (const Interface_Graph & graph,const char * filename = "");
		%feature("compactdefaultargs") Select;
		%feature("autodoc", "	* This method requires ContextModif to be applied with a filter. If a ModelModifier is defined with a Selection criterium, the result of this Selection is used as a filter : - if none of its items has been transferred, the modification does not apply at all - else, the Modifier can query for what entities were selected and what are their results - if this method is not called before working, the Modifier has to work on the whole Model

	:param list:
	:type list: Interface_EntityIterator &
	:rtype: None
") Select;
		void Select (Interface_EntityIterator & list);
		%feature("compactdefaultargs") OriginalGraph;
		%feature("autodoc", "	* Returns the original Graph (compared to OriginalModel, it gives more query capabilitites)

	:rtype: Interface_Graph
") OriginalGraph;
		const Interface_Graph & OriginalGraph ();
		%feature("compactdefaultargs") OriginalModel;
		%feature("autodoc", "	* Returns the original model

	:rtype: Handle_Interface_InterfaceModel
") OriginalModel;
		Handle_Interface_InterfaceModel OriginalModel ();
		%feature("compactdefaultargs") SetProtocol;
		%feature("autodoc", "	* Allows to transmit a Protocol as part of a ContextModif

	:param proto:
	:type proto: Handle_Interface_Protocol &
	:rtype: None
") SetProtocol;
		void SetProtocol (const Handle_Interface_Protocol & proto);
		%feature("compactdefaultargs") Protocol;
		%feature("autodoc", "	* Returns the Protocol (Null if not set)

	:rtype: Handle_Interface_Protocol
") Protocol;
		Handle_Interface_Protocol Protocol ();
		%feature("compactdefaultargs") HasFileName;
		%feature("autodoc", "	* Returns True if a non empty file name has been defined

	:rtype: bool
") HasFileName;
		Standard_Boolean HasFileName ();
		%feature("compactdefaultargs") FileName;
		%feature("autodoc", "	* Returns File Name (can be empty)

	:rtype: char *
") FileName;
		const char * FileName ();
		%feature("compactdefaultargs") Control;
		%feature("autodoc", "	* Returns the map for a direct use, if required

	:rtype: Handle_Interface_CopyControl
") Control;
		Handle_Interface_CopyControl Control ();
		%feature("compactdefaultargs") IsForNone;
		%feature("autodoc", "	* Returns True if Select has determined that a Modifier may not be run (filter defined and empty)

	:rtype: bool
") IsForNone;
		Standard_Boolean IsForNone ();
		%feature("compactdefaultargs") IsForAll;
		%feature("autodoc", "	* Returns True if no filter is defined : a Modifier has to work on all entities of the resulting (target) model

	:rtype: bool
") IsForAll;
		Standard_Boolean IsForAll ();
		%feature("compactdefaultargs") IsTransferred;
		%feature("autodoc", "	* Returns True if a starting item has been transferred

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: bool
") IsTransferred;
		Standard_Boolean IsTransferred (const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") IsSelected;
		%feature("autodoc", "	* Returns True if a starting item has been transferred and selected

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: bool
") IsSelected;
		Standard_Boolean IsSelected (const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") SelectedOriginal;
		%feature("autodoc", "	* Returns the list of original selected items. See also the iteration

	:rtype: Interface_EntityIterator
") SelectedOriginal;
		Interface_EntityIterator SelectedOriginal ();
		%feature("compactdefaultargs") SelectedResult;
		%feature("autodoc", "	* Returns the list of resulting counterparts of selected items. See also the iteration

	:rtype: Interface_EntityIterator
") SelectedResult;
		Interface_EntityIterator SelectedResult ();
		%feature("compactdefaultargs") SelectedCount;
		%feature("autodoc", "	* Returns the count of selected and transferred items

	:rtype: int
") SelectedCount;
		Standard_Integer SelectedCount ();
		%feature("compactdefaultargs") Start;
		%feature("autodoc", "	* Starts an iteration on selected items. It takes into account IsForAll/IsForNone, by really iterating on all selected items.

	:rtype: None
") Start;
		void Start ();
		%feature("compactdefaultargs") More;
		%feature("autodoc", "	* Returns True until the iteration has finished

	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "	* Advances the iteration

	:rtype: None
") Next;
		void Next ();
		%feature("compactdefaultargs") ValueOriginal;
		%feature("autodoc", "	* Returns the current selected item in the original model

	:rtype: Handle_Standard_Transient
") ValueOriginal;
		Handle_Standard_Transient ValueOriginal ();
		%feature("compactdefaultargs") ValueResult;
		%feature("autodoc", "	* Returns the result counterpart of current selected item (in the target model)

	:rtype: Handle_Standard_Transient
") ValueResult;
		Handle_Standard_Transient ValueResult ();
		%feature("compactdefaultargs") TraceModifier;
		%feature("autodoc", "	* Traces the application of a Modifier. Works with default trace File and Level. Fills the trace if default trace level is at least 1. Traces the Modifier (its Label) and its Selection if there is one (its Label). To be called after Select (because status IsForAll is printed) Worths to trace a global modification. See also Trace below

	:param modif:
	:type modif: Handle_IFSelect_GeneralModifier &
	:rtype: None
") TraceModifier;
		void TraceModifier (const Handle_IFSelect_GeneralModifier & modif);
		%feature("compactdefaultargs") Trace;
		%feature("autodoc", "	* Traces the modification of the current entity (see above, ValueOriginal and ValueResult) for default trace level >= 2. To be called on each indivudual entity really modified <mess> is an optionnal additional message

	:param mess: default value is ""
	:type mess: char *
	:rtype: None
") Trace;
		void Trace (const char * mess = "");
		%feature("compactdefaultargs") AddCheck;
		%feature("autodoc", "	* Adds a Check to the CheckList. If it is empty, nothing is done If it concerns an Entity from the Original Model (by SetEntity) to which another Check is attached, it is merged to it. Else, it is added or merged as to GlobalCheck.

	:param check:
	:type check: Handle_Interface_Check &
	:rtype: None
") AddCheck;
		void AddCheck (const Handle_Interface_Check & check);
		%feature("compactdefaultargs") AddWarning;
		%feature("autodoc", "	* Adds a Warning Message for an Entity from the original Model If <start> is not an Entity from the original model (e.g. the model itself) this message is added to Global Check.

	:param start:
	:type start: Handle_Standard_Transient &
	:param mess:
	:type mess: char *
	:param orig: default value is ""
	:type orig: char *
	:rtype: None
") AddWarning;
		void AddWarning (const Handle_Standard_Transient & start,const char * mess,const char * orig = "");
		%feature("compactdefaultargs") AddFail;
		%feature("autodoc", "	* Adds a Fail Message for an Entity from the original Model If <start> is not an Entity from the original model (e.g. the model itself) this message is added to Global Check.

	:param start:
	:type start: Handle_Standard_Transient &
	:param mess:
	:type mess: char *
	:param orig: default value is ""
	:type orig: char *
	:rtype: None
") AddFail;
		void AddFail (const Handle_Standard_Transient & start,const char * mess,const char * orig = "");
		%feature("compactdefaultargs") CCheck;
		%feature("autodoc", "	* Returns a Check given an Entity number (in the original Model) by default a Global Check. Creates it the first time. It can then be acknowledged on the spot, in condition that the caller works by reference ('Interface_Check& check = ...')

	:param num: default value is 0
	:type num: int
	:rtype: Handle_Interface_Check
") CCheck;
		Handle_Interface_Check CCheck (const Standard_Integer num = 0);
		%feature("compactdefaultargs") CCheck;
		%feature("autodoc", "	* Returns a Check attached to an Entity from the original Model It can then be acknowledged on the spot, in condition that the caller works by reference ('Interface_Check& check = ...')

	:param start:
	:type start: Handle_Standard_Transient &
	:rtype: Handle_Interface_Check
") CCheck;
		Handle_Interface_Check CCheck (const Handle_Standard_Transient & start);
		%feature("compactdefaultargs") CheckList;
		%feature("autodoc", "	* Returns the complete CheckList

	:rtype: Interface_CheckIterator
") CheckList;
		Interface_CheckIterator CheckList ();
};


%extend IFSelect_ContextModif {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IFSelect_ContextWrite;
class IFSelect_ContextWrite {
	public:
		%feature("compactdefaultargs") IFSelect_ContextWrite;
		%feature("autodoc", "	* Prepares a ContextWrite with these informations : - the model which is to be written - the protocol to be used - the filename - an object AppliedModifiers to work. It gives a list of FileModifiers to be ran, and for each one it can give a restricted list of entities (in the model), else all the model is considered

	:param model:
	:type model: Handle_Interface_InterfaceModel &
	:param proto:
	:type proto: Handle_Interface_Protocol &
	:param applieds:
	:type applieds: Handle_IFSelect_AppliedModifiers &
	:param filename:
	:type filename: char *
	:rtype: None
") IFSelect_ContextWrite;
		 IFSelect_ContextWrite (const Handle_Interface_InterfaceModel & model,const Handle_Interface_Protocol & proto,const Handle_IFSelect_AppliedModifiers & applieds,const char * filename);
		%feature("compactdefaultargs") IFSelect_ContextWrite;
		%feature("autodoc", "	* Same as above but with an already computed Graph

	:param hgraph:
	:type hgraph: Handle_Interface_HGraph &
	:param proto:
	:type proto: Handle_Interface_Protocol &
	:param applieds:
	:type applieds: Handle_IFSelect_AppliedModifiers &
	:param filename:
	:type filename: char *
	:rtype: None
") IFSelect_ContextWrite;
		 IFSelect_ContextWrite (const Handle_Interface_HGraph & hgraph,const Handle_Interface_Protocol & proto,const Handle_IFSelect_AppliedModifiers & applieds,const char * filename);
		%feature("compactdefaultargs") Model;
		%feature("autodoc", "	* Returns the Model

	:rtype: Handle_Interface_InterfaceModel
") Model;
		Handle_Interface_InterfaceModel Model ();
		%feature("compactdefaultargs") Protocol;
		%feature("autodoc", "	* Returns the Protocol;

	:rtype: Handle_Interface_Protocol
") Protocol;
		Handle_Interface_Protocol Protocol ();
		%feature("compactdefaultargs") FileName;
		%feature("autodoc", "	* Returns the File Name

	:rtype: char *
") FileName;
		const char * FileName ();
		%feature("compactdefaultargs") AppliedModifiers;
		%feature("autodoc", "	* Returns the object AppliedModifiers

	:rtype: Handle_IFSelect_AppliedModifiers
") AppliedModifiers;
		Handle_IFSelect_AppliedModifiers AppliedModifiers ();
		%feature("compactdefaultargs") Graph;
		%feature("autodoc", "	* Returns the Graph, either given when created, else created the first time it is queried

	:rtype: Interface_Graph
") Graph;
		const Interface_Graph & Graph ();
		%feature("compactdefaultargs") NbModifiers;
		%feature("autodoc", "	* Returns the count of recorded File Modifiers

	:rtype: int
") NbModifiers;
		Standard_Integer NbModifiers ();
		%feature("compactdefaultargs") SetModifier;
		%feature("autodoc", "	* Sets active the File Modifier n0 <numod> Then, it prepares the list of entities to consider, if any Returns False if <numod> out of range

	:param numod:
	:type numod: int
	:rtype: bool
") SetModifier;
		Standard_Boolean SetModifier (const Standard_Integer numod);
		%feature("compactdefaultargs") FileModifier;
		%feature("autodoc", "	* Returns the currently active File Modifier. Cast to be done Null if not properly set : must be test IsNull after casting

	:rtype: Handle_IFSelect_GeneralModifier
") FileModifier;
		Handle_IFSelect_GeneralModifier FileModifier ();
		%feature("compactdefaultargs") IsForNone;
		%feature("autodoc", "	* Returns True if no modifier is currently set

	:rtype: bool
") IsForNone;
		Standard_Boolean IsForNone ();
		%feature("compactdefaultargs") IsForAll;
		%feature("autodoc", "	* Returns True if the current modifier is to be applied to the whole model. Else, a restricted list of selected entities is defined, it can be exploited by the File Modifier

	:rtype: bool
") IsForAll;
		Standard_Boolean IsForAll ();
		%feature("compactdefaultargs") NbEntities;
		%feature("autodoc", "	* Returns the total count of selected entities

	:rtype: int
") NbEntities;
		Standard_Integer NbEntities ();
		%feature("compactdefaultargs") Start;
		%feature("autodoc", "	* Starts an iteration on selected items. It takes into account IsForAll/IsForNone, by really iterating on all selected items.

	:rtype: None
") Start;
		void Start ();
		%feature("compactdefaultargs") More;
		%feature("autodoc", "	* Returns True until the iteration has finished

	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "	* Advances the iteration

	:rtype: None
") Next;
		void Next ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Returns the current selected entity in the model

	:rtype: Handle_Standard_Transient
") Value;
		Handle_Standard_Transient Value ();
		%feature("compactdefaultargs") AddCheck;
		%feature("autodoc", "	* Adds a Check to the CheckList. If it is empty, nothing is done If it concerns an Entity from the Model (by SetEntity) to which another Check is attached, it is merged to it. Else, it is added or merged as to GlobalCheck.

	:param check:
	:type check: Handle_Interface_Check &
	:rtype: None
") AddCheck;
		void AddCheck (const Handle_Interface_Check & check);
		%feature("compactdefaultargs") AddWarning;
		%feature("autodoc", "	* Adds a Warning Message for an Entity from the Model If <start> is not an Entity from the model (e.g. the model itself) this message is added to Global Check.

	:param start:
	:type start: Handle_Standard_Transient &
	:param mess:
	:type mess: char *
	:param orig: default value is ""
	:type orig: char *
	:rtype: None
") AddWarning;
		void AddWarning (const Handle_Standard_Transient & start,const char * mess,const char * orig = "");
		%feature("compactdefaultargs") AddFail;
		%feature("autodoc", "	* Adds a Fail Message for an Entity from the Model If <start> is not an Entity from the model (e.g. the model itself) this message is added to Global Check.

	:param start:
	:type start: Handle_Standard_Transient &
	:param mess:
	:type mess: char *
	:param orig: default value is ""
	:type orig: char *
	:rtype: None
") AddFail;
		void AddFail (const Handle_Standard_Transient & start,const char * mess,const char * orig = "");
		%feature("compactdefaultargs") CCheck;
		%feature("autodoc", "	* Returns a Check given an Entity number (in the Model) by default a Global Check. Creates it the first time. It can then be acknowledged on the spot, in condition that the caller works by reference ('Interface_Check& check = ...')

	:param num: default value is 0
	:type num: int
	:rtype: Handle_Interface_Check
") CCheck;
		Handle_Interface_Check CCheck (const Standard_Integer num = 0);
		%feature("compactdefaultargs") CCheck;
		%feature("autodoc", "	* Returns a Check attached to an Entity from the Model It can then be acknowledged on the spot, in condition that the caller works by reference ('Interface_Check& check = ...')

	:param start:
	:type start: Handle_Standard_Transient &
	:rtype: Handle_Interface_Check
") CCheck;
		Handle_Interface_Check CCheck (const Handle_Standard_Transient & start);
		%feature("compactdefaultargs") CheckList;
		%feature("autodoc", "	* Returns the complete CheckList

	:rtype: Interface_CheckIterator
") CheckList;
		Interface_CheckIterator CheckList ();
};


%extend IFSelect_ContextWrite {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IFSelect_Dispatch;
class IFSelect_Dispatch : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") SetRootName;
		%feature("autodoc", "	* Sets a Root Name as an HAsciiString To reset it, give a Null Handle (then, a ShareOut will have to define the Default Root Name)

	:param name:
	:type name: Handle_TCollection_HAsciiString &
	:rtype: None
") SetRootName;
		void SetRootName (const Handle_TCollection_HAsciiString & name);
		%feature("compactdefaultargs") HasRootName;
		%feature("autodoc", "	* Returns True if a specific Root Name has been set (else, the Default Root Name has to be used)

	:rtype: bool
") HasRootName;
		Standard_Boolean HasRootName ();
		%feature("compactdefaultargs") RootName;
		%feature("autodoc", "	* Returns the Root Name for files produced by this dispatch It is empty if it has not been set or if it has been reset

	:rtype: Handle_TCollection_HAsciiString
") RootName;
		Handle_TCollection_HAsciiString RootName ();
		%feature("compactdefaultargs") SetFinalSelection;
		%feature("autodoc", "	* Stores (or Changes) the Final Selection for a Dispatch

	:param sel:
	:type sel: Handle_IFSelect_Selection &
	:rtype: None
") SetFinalSelection;
		void SetFinalSelection (const Handle_IFSelect_Selection & sel);
		%feature("compactdefaultargs") FinalSelection;
		%feature("autodoc", "	* Returns the Final Selection of a Dispatch we 'd like : C++ : return const &

	:rtype: Handle_IFSelect_Selection
") FinalSelection;
		Handle_IFSelect_Selection FinalSelection ();
		%feature("compactdefaultargs") Selections;
		%feature("autodoc", "	* Returns the complete list of source Selections (starting from FinalSelection)

	:rtype: IFSelect_SelectionIterator
") Selections;
		IFSelect_SelectionIterator Selections ();
		%feature("compactdefaultargs") CanHaveRemainder;
		%feature("autodoc", "	* Returns True if a Dispatch can have a Remainder, i.e. if its criterium can let entities apart. It is a potential answer, remainder can be empty at run-time even if answer is True. (to attach a RemainderFromDispatch Selection is not allowed if answer is True). Default answer given here is False (can be redefined)

	:rtype: bool
") CanHaveRemainder;
		virtual Standard_Boolean CanHaveRemainder ();
		%feature("compactdefaultargs") LimitedMax;
		%feature("autodoc", "	* Returns True if a Dispatch generates a count of Packets always less than or equal to a maximum value : it can be computed from the total count of Entities to be dispatched : <nbent>. If answer is False, no limited maximum is expected for account If answer is True, expected maximum is given in argument <max> Default answer given here is False (can be redefined)

	:param nbent:
	:type nbent: int
	:param max:
	:type max: int &
	:rtype: bool
") LimitedMax;
		virtual Standard_Boolean LimitedMax (const Standard_Integer nbent,Standard_Integer &OutValue);
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "	* Returns a text which defines the way a Dispatch produces packets (which will become files) from its Input

	:rtype: TCollection_AsciiString
") Label;
		virtual TCollection_AsciiString Label ();
		%feature("compactdefaultargs") GetEntities;
		%feature("autodoc", "	* Gets Unique Root Entities from the Final Selection, given an input Graph This the starting step for an Evaluation (Packets - Remainder)

	:param G:
	:type G: Interface_Graph &
	:rtype: Interface_EntityIterator
") GetEntities;
		Interface_EntityIterator GetEntities (const Interface_Graph & G);
		%feature("compactdefaultargs") PacketsCount;
		%feature("autodoc", "	* Returns True if Count of Packets is actually known, and the value of the count in argument 'count'. Returns False if this count is unknown. Input is given as a Graph. This method is intended to be quick (used for file names) hence if this count is long to compute (that is, as a result of complete evaluation made by method Packets), it is preferable to answer 'unknown' by returning False Default answer if False. Can be redefined.

	:param G:
	:type G: Interface_Graph &
	:param count:
	:type count: int &
	:rtype: int
") PacketsCount;
		virtual Standard_Integer PacketsCount (const Interface_Graph & G,Standard_Integer &OutValue);
		%feature("compactdefaultargs") Packets;
		%feature("autodoc", "	* Returns the list of produced Packets into argument <pack>. Each Packet corresponds to a Part, the Entities listed are the Roots given by the Selection. Input is given as a Graph. Thus, to create a file from a packet, it suffices to take the entities listed in a Part of Packets (that is, a Packet) without worrying about Shared entities This method can raise an Exception if data are not coherent

	:param G:
	:type G: Interface_Graph &
	:param packs:
	:type packs: IFGraph_SubPartsIterator &
	:rtype: void
") Packets;
		virtual void Packets (const Interface_Graph & G,IFGraph_SubPartsIterator & packs);
		%feature("compactdefaultargs") Packeted;
		%feature("autodoc", "	* Returns the list of all Input Entities (see GetEntities) which are put in a Packet. That is, Entities listed in GetEntities but not in Remainder (see below). Input is given as a Graph.

	:param G:
	:type G: Interface_Graph &
	:rtype: Interface_EntityIterator
") Packeted;
		Interface_EntityIterator Packeted (const Interface_Graph & G);
		%feature("compactdefaultargs") Remainder;
		%feature("autodoc", "	* Returns Remainder which is a set of Entities. Can be empty. Default evaluation is empty (has to be redefined if CanHaveRemainder is redefined to return True).

	:param G:
	:type G: Interface_Graph &
	:rtype: Interface_EntityIterator
") Remainder;
		virtual Interface_EntityIterator Remainder (const Interface_Graph & G);
};


%extend IFSelect_Dispatch {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_IFSelect_Dispatch(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_IFSelect_Dispatch::Handle_IFSelect_Dispatch %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_IFSelect_Dispatch;
class Handle_IFSelect_Dispatch : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_IFSelect_Dispatch();
        Handle_IFSelect_Dispatch(const Handle_IFSelect_Dispatch &aHandle);
        Handle_IFSelect_Dispatch(const IFSelect_Dispatch *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_IFSelect_Dispatch DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_IFSelect_Dispatch {
    IFSelect_Dispatch* _get_reference() {
    return (IFSelect_Dispatch*)$self->Access();
    }
};

%extend Handle_IFSelect_Dispatch {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend IFSelect_Dispatch {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IFSelect_EditForm;
class IFSelect_EditForm : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") IFSelect_EditForm;
		%feature("autodoc", "	* Creates a complete EditForm from an Editor A specific Label can be given

	:param editor:
	:type editor: Handle_IFSelect_Editor &
	:param readonly:
	:type readonly: bool
	:param undoable:
	:type undoable: bool
	:param label: default value is ""
	:type label: char *
	:rtype: None
") IFSelect_EditForm;
		 IFSelect_EditForm (const Handle_IFSelect_Editor & editor,const Standard_Boolean readonly,const Standard_Boolean undoable,const char * label = "");
		%feature("compactdefaultargs") IFSelect_EditForm;
		%feature("autodoc", "	* Creates an extracted EditForm from an Editor, limited to the values identified in <nums> A specific Label can be given

	:param editor:
	:type editor: Handle_IFSelect_Editor &
	:param nums:
	:type nums: TColStd_SequenceOfInteger &
	:param readonly:
	:type readonly: bool
	:param undoable:
	:type undoable: bool
	:param label: default value is ""
	:type label: char *
	:rtype: None
") IFSelect_EditForm;
		 IFSelect_EditForm (const Handle_IFSelect_Editor & editor,const TColStd_SequenceOfInteger & nums,const Standard_Boolean readonly,const Standard_Boolean undoable,const char * label = "");

            %feature("autodoc","1");
            %extend {
                Standard_Boolean GetEditKeepStatus() {
                return (Standard_Boolean) $self->EditKeepStatus();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetEditKeepStatus(Standard_Boolean value ) {
                $self->EditKeepStatus()=value;
                }
            };
            		%feature("compactdefaultargs") Label;
		%feature("autodoc", "	:rtype: char *
") Label;
		const char * Label ();
		%feature("compactdefaultargs") IsLoaded;
		%feature("autodoc", "	* Tells if the EditForm is loaded now

	:rtype: bool
") IsLoaded;
		Standard_Boolean IsLoaded ();
		%feature("compactdefaultargs") ClearData;
		%feature("autodoc", "	:rtype: None
") ClearData;
		void ClearData ();
		%feature("compactdefaultargs") SetData;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_Standard_Transient &
	:param model:
	:type model: Handle_Interface_InterfaceModel &
	:rtype: None
") SetData;
		void SetData (const Handle_Standard_Transient & ent,const Handle_Interface_InterfaceModel & model);
		%feature("compactdefaultargs") SetEntity;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: None
") SetEntity;
		void SetEntity (const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") SetModel;
		%feature("autodoc", "	:param model:
	:type model: Handle_Interface_InterfaceModel &
	:rtype: None
") SetModel;
		void SetModel (const Handle_Interface_InterfaceModel & model);
		%feature("compactdefaultargs") Entity;
		%feature("autodoc", "	:rtype: Handle_Standard_Transient
") Entity;
		Handle_Standard_Transient Entity ();
		%feature("compactdefaultargs") Model;
		%feature("autodoc", "	:rtype: Handle_Interface_InterfaceModel
") Model;
		Handle_Interface_InterfaceModel Model ();
		%feature("compactdefaultargs") Editor;
		%feature("autodoc", "	:rtype: Handle_IFSelect_Editor
") Editor;
		Handle_IFSelect_Editor Editor ();
		%feature("compactdefaultargs") IsComplete;
		%feature("autodoc", "	* Tells if an EditForm is complete or is an extract from Editor

	:rtype: bool
") IsComplete;
		Standard_Boolean IsComplete ();
		%feature("compactdefaultargs") NbValues;
		%feature("autodoc", "	* Returns the count of values <editable> True : count of editable values, i.e. For a complete EditForm, it is given by the Editor Else, it is the length of the extraction map <editable> False : all the values from the Editor

	:param editable:
	:type editable: bool
	:rtype: int
") NbValues;
		Standard_Integer NbValues (const Standard_Boolean editable);
		%feature("compactdefaultargs") NumberFromRank;
		%feature("autodoc", "	* Returns the Value Number in the Editor from a given Rank in the EditForm For a complete EditForm, both are equal Else, it is given by the extraction map Returns 0 if <rank> exceeds the count of editable values,

	:param rank:
	:type rank: int
	:rtype: int
") NumberFromRank;
		Standard_Integer NumberFromRank (const Standard_Integer rank);
		%feature("compactdefaultargs") RankFromNumber;
		%feature("autodoc", "	* Returns the Rank in the EditForm from a given Number of Value for the Editor For a complete EditForm, both are equal Else, it is given by the extraction map Returns 0 if <number> is not forecast to be edited, or is out of range

	:param number:
	:type number: int
	:rtype: int
") RankFromNumber;
		Standard_Integer RankFromNumber (const Standard_Integer number);
		%feature("compactdefaultargs") NameNumber;
		%feature("autodoc", "	* Returns the Value Number in the Editor for a given Name i.e. the true ValueNumber which can be used in various methods of EditForm If it is not complete, for a recorded (in the Editor) but non-loaded name, returns negative value (- number)

	:param name:
	:type name: char *
	:rtype: int
") NameNumber;
		Standard_Integer NameNumber (const char * name);
		%feature("compactdefaultargs") NameRank;
		%feature("autodoc", "	* Returns the Rank of Value in the EditForm for a given Name i.e. if it is not complete, for a recorded (in the Editor) but non-loaded name, returns 0

	:param name:
	:type name: char *
	:rtype: int
") NameRank;
		Standard_Integer NameRank (const char * name);
		%feature("compactdefaultargs") LoadDefault;
		%feature("autodoc", "	* For a read-write undoable EditForm, loads original values from defaults stored in the Editor

	:rtype: None
") LoadDefault;
		void LoadDefault ();
		%feature("compactdefaultargs") LoadData;
		%feature("autodoc", "	* Loads modifications to data Default uses Editor. Can be redefined Remark that <ent> and/or <model> may be null, according to the kind of Editor. Shortcuts are available for these cases, but they finally call LoadData (hence, just ignore non-used args)

	:param ent:
	:type ent: Handle_Standard_Transient &
	:param model:
	:type model: Handle_Interface_InterfaceModel &
	:rtype: bool
") LoadData;
		virtual Standard_Boolean LoadData (const Handle_Standard_Transient & ent,const Handle_Interface_InterfaceModel & model);
		%feature("compactdefaultargs") LoadEntity;
		%feature("autodoc", "	* Shortcut for LoadData when <model> is not used

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: bool
") LoadEntity;
		Standard_Boolean LoadEntity (const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") LoadModel;
		%feature("autodoc", "	* Shortcut for LoadData when only the model is concerned

	:param model:
	:type model: Handle_Interface_InterfaceModel &
	:rtype: bool
") LoadModel;
		Standard_Boolean LoadModel (const Handle_Interface_InterfaceModel & model);
		%feature("compactdefaultargs") LoadData;
		%feature("autodoc", "	* Shortcut when both <ent> and <model> are not used (when the Editor works on fully static or global data)

	:rtype: bool
") LoadData;
		Standard_Boolean LoadData ();
		%feature("compactdefaultargs") ListEditor;
		%feature("autodoc", "	* Returns a ListEditor to edit the parameter <num> of the EditForm, if it is a List The Editor created it (by ListEditor) then loads it (by ListValue) For a single parameter, returns a Null Handle ...

	:param num:
	:type num: int
	:rtype: Handle_IFSelect_ListEditor
") ListEditor;
		Handle_IFSelect_ListEditor ListEditor (const Standard_Integer num);
		%feature("compactdefaultargs") LoadValue;
		%feature("autodoc", "	* Loads an original value (single). Called by the Editor only

	:param num:
	:type num: int
	:param val:
	:type val: Handle_TCollection_HAsciiString &
	:rtype: None
") LoadValue;
		void LoadValue (const Standard_Integer num,const Handle_TCollection_HAsciiString & val);
		%feature("compactdefaultargs") LoadList;
		%feature("autodoc", "	* Loads an original value as a list. Called by the Editor only

	:param num:
	:type num: int
	:param list:
	:type list: Handle_TColStd_HSequenceOfHAsciiString &
	:rtype: None
") LoadList;
		void LoadList (const Standard_Integer num,const Handle_TColStd_HSequenceOfHAsciiString & list);
		%feature("compactdefaultargs") OriginalValue;
		%feature("autodoc", "	* From an edited value, returns its ... value (original one) Null means that this value is not defined <num> is for the EditForm, not the Editor It is for a single parameter. For a list, gives a Null Handle

	:param num:
	:type num: int
	:rtype: Handle_TCollection_HAsciiString
") OriginalValue;
		Handle_TCollection_HAsciiString OriginalValue (const Standard_Integer num);
		%feature("compactdefaultargs") OriginalList;
		%feature("autodoc", "	* Returns an original value, as a list <num> is for the EditForm, not the Editor For a single parameter, gives a Null Handle

	:param num:
	:type num: int
	:rtype: Handle_TColStd_HSequenceOfHAsciiString
") OriginalList;
		Handle_TColStd_HSequenceOfHAsciiString OriginalList (const Standard_Integer num);
		%feature("compactdefaultargs") EditedValue;
		%feature("autodoc", "	* Returns the Edited (i.e. Modified) Value (string for single) <num> reports to the EditForm If IsModified is False, returns OriginalValue Null with IsModified True : means that this value is not defined or has been removed It is for a single parameter. For a list, gives a Null Handle

	:param num:
	:type num: int
	:rtype: Handle_TCollection_HAsciiString
") EditedValue;
		Handle_TCollection_HAsciiString EditedValue (const Standard_Integer num);
		%feature("compactdefaultargs") EditedList;
		%feature("autodoc", "	* Returns the Edited Value as a list If IsModified is False, returns OriginalValue Null with IsModified True : means that this value is not defined or has been removed For a single parameter, gives a Null Handle

	:param num:
	:type num: int
	:rtype: Handle_TColStd_HSequenceOfHAsciiString
") EditedList;
		Handle_TColStd_HSequenceOfHAsciiString EditedList (const Standard_Integer num);
		%feature("compactdefaultargs") IsModified;
		%feature("autodoc", "	* Tells if a Value (of the EditForm) is modified (directly or through touching by Update)

	:param num:
	:type num: int
	:rtype: bool
") IsModified;
		Standard_Boolean IsModified (const Standard_Integer num);
		%feature("compactdefaultargs") IsTouched;
		%feature("autodoc", "	* Tells if a Value (of the EditForm) has been touched, i.e. not modified directly but by the modification of another one (by method Update from the Editor)

	:param num:
	:type num: int
	:rtype: bool
") IsTouched;
		Standard_Boolean IsTouched (const Standard_Integer num);
		%feature("compactdefaultargs") Modify;
		%feature("autodoc", "	* Gives a new value for the item <num> of the EditForm, if it is a single parameter (for a list, just returns False) Null means to Remove it <enforce> True to overpass Protected or Computed Access Mode Calls the method Update from the Editor, which can touch other parameters (see NbTouched) Returns True if well recorded, False if this value is not allowed Warning : Does not apply immediately : will be applied by the method Apply

	:param num:
	:type num: int
	:param newval:
	:type newval: Handle_TCollection_HAsciiString &
	:param enforce: default value is Standard_False
	:type enforce: bool
	:rtype: bool
") Modify;
		Standard_Boolean Modify (const Standard_Integer num,const Handle_TCollection_HAsciiString & newval,const Standard_Boolean enforce = Standard_False);
		%feature("compactdefaultargs") ModifyList;
		%feature("autodoc", "	* Changes the value of an item of the EditForm, if it is a List (else, just returns False) The ListEditor contains the edited values of the list If no edition was recorded, just returns False Calls the method Update from the Editor, which can touch other parameters (see NbTouched) Returns True if well recorded, False if this value is not allowed Warning : Does not apply immediately : will be applied by the method Apply

	:param num:
	:type num: int
	:param edited:
	:type edited: Handle_IFSelect_ListEditor &
	:param enforce: default value is Standard_False
	:type enforce: bool
	:rtype: bool
") ModifyList;
		Standard_Boolean ModifyList (const Standard_Integer num,const Handle_IFSelect_ListEditor & edited,const Standard_Boolean enforce = Standard_False);
		%feature("compactdefaultargs") ModifyListValue;
		%feature("autodoc", "	* As ModifyList but the new value is given as such Creates a ListEditor, Loads it, then calls ModifyList

	:param num:
	:type num: int
	:param list:
	:type list: Handle_TColStd_HSequenceOfHAsciiString &
	:param enforce: default value is Standard_False
	:type enforce: bool
	:rtype: bool
") ModifyListValue;
		Standard_Boolean ModifyListValue (const Standard_Integer num,const Handle_TColStd_HSequenceOfHAsciiString & list,const Standard_Boolean enforce = Standard_False);
		%feature("compactdefaultargs") TouchList;
		%feature("autodoc", "	* Acts as Touch but for a list Does not work (returns False) if <num> is for a single param

	:param num:
	:type num: int
	:param newlist:
	:type newlist: Handle_TColStd_HSequenceOfHAsciiString &
	:rtype: bool
") TouchList;
		Standard_Boolean TouchList (const Standard_Integer num,const Handle_TColStd_HSequenceOfHAsciiString & newlist);
		%feature("compactdefaultargs") ClearEdit;
		%feature("autodoc", "	* Clears modification status : by default all, or one by its numbers (in the Editor)

	:param num: default value is 0
	:type num: int
	:rtype: None
") ClearEdit;
		void ClearEdit (const Standard_Integer num = 0);
		%feature("compactdefaultargs") PrintDefs;
		%feature("autodoc", "	* Prints Definitions, relative to the Editor

	:param S:
	:type S: Handle_Message_Messenger &
	:rtype: None
") PrintDefs;
		void PrintDefs (const Handle_Message_Messenger & S);
		%feature("compactdefaultargs") PrintValues;
		%feature("autodoc", "	* Prints Values, according to what and alsolist <names> True : prints Long Names; False : prints Short Names <what> < 0 : prints Original Values (+ flag Modified) <what> > 0 : prints Final Values (+flag Modified) <what> = 0 : prints Modified Values (Original + Edited) <alsolist> False (D) : lists are printed only as their count <alsolist> True : lists are printed for all their items

	:param S:
	:type S: Handle_Message_Messenger &
	:param what:
	:type what: int
	:param names:
	:type names: bool
	:param alsolist: default value is Standard_False
	:type alsolist: bool
	:rtype: None
") PrintValues;
		void PrintValues (const Handle_Message_Messenger & S,const Standard_Integer what,const Standard_Boolean names,const Standard_Boolean alsolist = Standard_False);
		%feature("compactdefaultargs") Apply;
		%feature("autodoc", "	* Applies modifications to own data Calls ApplyData then Clears Status according EditKeepStatus

	:rtype: bool
") Apply;
		Standard_Boolean Apply ();
		%feature("compactdefaultargs") Recognize;
		%feature("autodoc", "	* Tells if this EditForm can work with its Editor and its actual Data (Entity and Model) Default uses Editor. Can be redefined

	:rtype: bool
") Recognize;
		virtual Standard_Boolean Recognize ();
		%feature("compactdefaultargs") ApplyData;
		%feature("autodoc", "	* Applies modifications to data Default uses Editor. Can be redefined

	:param ent:
	:type ent: Handle_Standard_Transient &
	:param model:
	:type model: Handle_Interface_InterfaceModel &
	:rtype: bool
") ApplyData;
		virtual Standard_Boolean ApplyData (const Handle_Standard_Transient & ent,const Handle_Interface_InterfaceModel & model);
		%feature("compactdefaultargs") Undo;
		%feature("autodoc", "	* For an undoable EditForm, Applies ... origibal values ! and clears modified ones Can be run only once

	:rtype: bool
") Undo;
		Standard_Boolean Undo ();
};


%extend IFSelect_EditForm {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_IFSelect_EditForm(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_IFSelect_EditForm::Handle_IFSelect_EditForm %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_IFSelect_EditForm;
class Handle_IFSelect_EditForm : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_IFSelect_EditForm();
        Handle_IFSelect_EditForm(const Handle_IFSelect_EditForm &aHandle);
        Handle_IFSelect_EditForm(const IFSelect_EditForm *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_IFSelect_EditForm DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_IFSelect_EditForm {
    IFSelect_EditForm* _get_reference() {
    return (IFSelect_EditForm*)$self->Access();
    }
};

%extend Handle_IFSelect_EditForm {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend IFSelect_EditForm {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IFSelect_Editor;
class IFSelect_Editor : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	* Sets a Typed Value for a given ident and short name, with an Edit Mode

	:param num:
	:type num: int
	:param typval:
	:type typval: Handle_Interface_TypedValue &
	:param shortname: default value is ""
	:type shortname: char *
	:param accessmode: default value is IFSelect_Editable
	:type accessmode: IFSelect_EditValue
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer num,const Handle_Interface_TypedValue & typval,const char * shortname = "",const IFSelect_EditValue accessmode = IFSelect_Editable);
		%feature("compactdefaultargs") SetList;
		%feature("autodoc", "	* Sets a parameter to be a List max < 0 : not for a list (set when starting) max = 0 : list with no length limit (default for SetList) max > 0 : list limited to <max> items

	:param num:
	:type num: int
	:param max: default value is 0
	:type max: int
	:rtype: None
") SetList;
		void SetList (const Standard_Integer num,const Standard_Integer max = 0);
		%feature("compactdefaultargs") NbValues;
		%feature("autodoc", "	* Returns the count of Typed Values

	:rtype: int
") NbValues;
		Standard_Integer NbValues ();
		%feature("compactdefaultargs") TypedValue;
		%feature("autodoc", "	* Returns a Typed Value from its ident

	:param num:
	:type num: int
	:rtype: Handle_Interface_TypedValue
") TypedValue;
		Handle_Interface_TypedValue TypedValue (const Standard_Integer num);
		%feature("compactdefaultargs") IsList;
		%feature("autodoc", "	* Tells if a parameter is a list

	:param num:
	:type num: int
	:rtype: bool
") IsList;
		Standard_Boolean IsList (const Standard_Integer num);
		%feature("compactdefaultargs") MaxList;
		%feature("autodoc", "	* Returns max length allowed for a list = 0 means : list with no limit < 0 means : not a list

	:param num:
	:type num: int
	:rtype: int
") MaxList;
		Standard_Integer MaxList (const Standard_Integer num);
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "	* Returns the name of a Value (complete or short) from its ident Short Name can be empty

	:param num:
	:type num: int
	:param isshort: default value is Standard_False
	:type isshort: bool
	:rtype: char *
") Name;
		const char * Name (const Standard_Integer num,const Standard_Boolean isshort = Standard_False);
		%feature("compactdefaultargs") EditMode;
		%feature("autodoc", "	* Returns the edit mode of a Value

	:param num:
	:type num: int
	:rtype: IFSelect_EditValue
") EditMode;
		IFSelect_EditValue EditMode (const Standard_Integer num);
		%feature("compactdefaultargs") NameNumber;
		%feature("autodoc", "	* Returns the number (ident) of a Value, from its name, short or complete. If not found, returns 0

	:param name:
	:type name: char *
	:rtype: int
") NameNumber;
		Standard_Integer NameNumber (const char * name);
		%feature("compactdefaultargs") PrintNames;
		%feature("autodoc", "	:param S:
	:type S: Handle_Message_Messenger &
	:rtype: None
") PrintNames;
		void PrintNames (const Handle_Message_Messenger & S);
		%feature("compactdefaultargs") PrintDefs;
		%feature("autodoc", "	:param S:
	:type S: Handle_Message_Messenger &
	:param labels: default value is Standard_False
	:type labels: bool
	:rtype: None
") PrintDefs;
		void PrintDefs (const Handle_Message_Messenger & S,const Standard_Boolean labels = Standard_False);
		%feature("compactdefaultargs") MaxNameLength;
		%feature("autodoc", "	* Returns the MaxLength of, according to what : <what> = -1 : length of short names <what> = 0 : length of complete names <what> = 1 : length of values labels

	:param what:
	:type what: int
	:rtype: int
") MaxNameLength;
		Standard_Integer MaxNameLength (const Standard_Integer what);
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "	* Returns the specific label

	:rtype: TCollection_AsciiString
") Label;
		virtual TCollection_AsciiString Label ();
		%feature("compactdefaultargs") Form;
		%feature("autodoc", "	* Builds and Returns an EditForm, empty (no data yet) Can be redefined to return a specific type of EditForm

	:param readonly:
	:type readonly: bool
	:param undoable: default value is Standard_True
	:type undoable: bool
	:rtype: Handle_IFSelect_EditForm
") Form;
		virtual Handle_IFSelect_EditForm Form (const Standard_Boolean readonly,const Standard_Boolean undoable = Standard_True);
		%feature("compactdefaultargs") Recognize;
		%feature("autodoc", "	* Tells if this Editor can work on this EditForm and its content (model, entity ?)

	:param form:
	:type form: Handle_IFSelect_EditForm &
	:rtype: bool
") Recognize;
		virtual Standard_Boolean Recognize (const Handle_IFSelect_EditForm & form);
		%feature("compactdefaultargs") StringValue;
		%feature("autodoc", "	* Returns the value of an EditForm, for a given item (if not a list. for a list, a Null String may be returned)

	:param form:
	:type form: Handle_IFSelect_EditForm &
	:param num:
	:type num: int
	:rtype: Handle_TCollection_HAsciiString
") StringValue;
		virtual Handle_TCollection_HAsciiString StringValue (const Handle_IFSelect_EditForm & form,const Standard_Integer num);
		%feature("compactdefaultargs") ListEditor;
		%feature("autodoc", "	* Returns a ListEditor for a parameter which is a List Default returns a basic ListEditor for a List, a Null Handle if <num> is not for a List. Can be redefined

	:param num:
	:type num: int
	:rtype: Handle_IFSelect_ListEditor
") ListEditor;
		virtual Handle_IFSelect_ListEditor ListEditor (const Standard_Integer num);
		%feature("compactdefaultargs") ListValue;
		%feature("autodoc", "	* Returns the value of an EditForm as a List, for a given item If not a list, a Null Handle should be returned Default returns a Null Handle, because many Editors have no list to edit. To be redefined as required

	:param form:
	:type form: Handle_IFSelect_EditForm &
	:param num:
	:type num: int
	:rtype: Handle_TColStd_HSequenceOfHAsciiString
") ListValue;
		virtual Handle_TColStd_HSequenceOfHAsciiString ListValue (const Handle_IFSelect_EditForm & form,const Standard_Integer num);
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "	* Loads original values from some data, to an EditForm Remark: <ent> may be Null, this means all <model> is concerned Also <model> may be Null, if no context applies for <ent> And both <ent> and <model> may be Null, for a full static editor

	:param form:
	:type form: Handle_IFSelect_EditForm &
	:param ent:
	:type ent: Handle_Standard_Transient &
	:param model:
	:type model: Handle_Interface_InterfaceModel &
	:rtype: bool
") Load;
		virtual Standard_Boolean Load (const Handle_IFSelect_EditForm & form,const Handle_Standard_Transient & ent,const Handle_Interface_InterfaceModel & model);
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "	* Updates the EditForm when a parameter is modified I.E. default does nothing, can be redefined, as follows : Returns True when done (even if does nothing), False in case of refuse (for instance, if the new value is not suitable) <num> is the rank of the parameter for the EDITOR itself <enforce> True means that protected parameters can be touched //! If a parameter commands the value of other ones, when it is modified, it is necessary to touch them by Touch from EditForm

	:param form:
	:type form: Handle_IFSelect_EditForm &
	:param num:
	:type num: int
	:param newval:
	:type newval: Handle_TCollection_HAsciiString &
	:param enforce:
	:type enforce: bool
	:rtype: bool
") Update;
		virtual Standard_Boolean Update (const Handle_IFSelect_EditForm & form,const Standard_Integer num,const Handle_TCollection_HAsciiString & newval,const Standard_Boolean enforce);
		%feature("compactdefaultargs") UpdateList;
		%feature("autodoc", "	* Acts as Update, but when the value is a list

	:param form:
	:type form: Handle_IFSelect_EditForm &
	:param num:
	:type num: int
	:param newlist:
	:type newlist: Handle_TColStd_HSequenceOfHAsciiString &
	:param enforce:
	:type enforce: bool
	:rtype: bool
") UpdateList;
		virtual Standard_Boolean UpdateList (const Handle_IFSelect_EditForm & form,const Standard_Integer num,const Handle_TColStd_HSequenceOfHAsciiString & newlist,const Standard_Boolean enforce);
		%feature("compactdefaultargs") Apply;
		%feature("autodoc", "	* Applies modified values of the EditForm with some data Remark: <ent> may be Null, this means all <model> is concerned Also <model> may be Null, if no context applies for <ent> And both <ent> and <model> may be Null, for a full static editor

	:param form:
	:type form: Handle_IFSelect_EditForm &
	:param ent:
	:type ent: Handle_Standard_Transient &
	:param model:
	:type model: Handle_Interface_InterfaceModel &
	:rtype: bool
") Apply;
		virtual Standard_Boolean Apply (const Handle_IFSelect_EditForm & form,const Handle_Standard_Transient & ent,const Handle_Interface_InterfaceModel & model);
};


%extend IFSelect_Editor {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_IFSelect_Editor(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_IFSelect_Editor::Handle_IFSelect_Editor %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_IFSelect_Editor;
class Handle_IFSelect_Editor : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_IFSelect_Editor();
        Handle_IFSelect_Editor(const Handle_IFSelect_Editor &aHandle);
        Handle_IFSelect_Editor(const IFSelect_Editor *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_IFSelect_Editor DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_IFSelect_Editor {
    IFSelect_Editor* _get_reference() {
    return (IFSelect_Editor*)$self->Access();
    }
};

%extend Handle_IFSelect_Editor {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend IFSelect_Editor {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class IFSelect_Functions {
	public:
		%feature("compactdefaultargs") GiveEntity;
		%feature("autodoc", "	* Takes the name of an entity, either as argument, or (if <name> is empty) on keybord, and returns the entity name can be a label or a number (in alphanumeric), it is searched by NumberFromLabel from WorkSession. If <name> doesn't match en entity, a Null Handle is returned

	:param WS:
	:type WS: Handle_IFSelect_WorkSession &
	:param name: default value is ""
	:type name: char *
	:rtype: Handle_Standard_Transient
") GiveEntity;
		static Handle_Standard_Transient GiveEntity (const Handle_IFSelect_WorkSession & WS,const char * name = "");
		%feature("compactdefaultargs") GiveEntityNumber;
		%feature("autodoc", "	* Same as GetEntity, but returns the number in the model of the entity. Returns 0 for null handle

	:param WS:
	:type WS: Handle_IFSelect_WorkSession &
	:param name: default value is ""
	:type name: char *
	:rtype: int
") GiveEntityNumber;
		static Standard_Integer GiveEntityNumber (const Handle_IFSelect_WorkSession & WS,const char * name = "");
		%feature("compactdefaultargs") GiveList;
		%feature("autodoc", "	* Computes a List of entities from a WorkSession and two idents, first and second, as follows : if <first> is a Number or Label of an entity : this entity if <first> is the name of a Selection in <WS>, and <second> not defined, the standard result of this Selection if <first> is for a Selection and <second> is defined, the standard result of this selection from the list computed with <second> (an entity or a selection) If <second> is erroneous, it is ignored

	:param WS:
	:type WS: Handle_IFSelect_WorkSession &
	:param first: default value is ""
	:type first: char *
	:param second: default value is ""
	:type second: char *
	:rtype: Handle_TColStd_HSequenceOfTransient
") GiveList;
		static Handle_TColStd_HSequenceOfTransient GiveList (const Handle_IFSelect_WorkSession & WS,const char * first = "",const char * second = "");
		%feature("compactdefaultargs") GiveDispatch;
		%feature("autodoc", "	* Evaluates and returns a Dispatch, from data of a WorkSession if <mode> is False, searches for exact name of Dispatch in WS Else (D), allows a parameter between brackets : ex.: dispatch_name(parameter) The parameter can be: an integer for DispPerCount or DispPerFiles or the name of a Signature for DispPerSignature Returns Null Handle if not found not well evaluated

	:param WS:
	:type WS: Handle_IFSelect_WorkSession &
	:param name:
	:type name: char *
	:param mode: default value is Standard_True
	:type mode: bool
	:rtype: Handle_IFSelect_Dispatch
") GiveDispatch;
		static Handle_IFSelect_Dispatch GiveDispatch (const Handle_IFSelect_WorkSession & WS,const char * name,const Standard_Boolean mode = Standard_True);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Defines and loads all basic functions (as ActFunc)

	:rtype: void
") Init;
		static void Init ();
};


%extend IFSelect_Functions {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IFSelect_GeneralModifier;
class IFSelect_GeneralModifier : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") MayChangeGraph;
		%feature("autodoc", "	* Returns True if this modifier may change the graph of dependences (aknowledged at creation time)

	:rtype: bool
") MayChangeGraph;
		Standard_Boolean MayChangeGraph ();
		%feature("compactdefaultargs") SetDispatch;
		%feature("autodoc", "	* Attaches to a Dispatch. If <disp> is Null, Resets it (to apply the Modifier on every Dispatch)

	:param disp:
	:type disp: Handle_IFSelect_Dispatch &
	:rtype: None
") SetDispatch;
		void SetDispatch (const Handle_IFSelect_Dispatch & disp);
		%feature("compactdefaultargs") Dispatch;
		%feature("autodoc", "	* Returns the Dispatch to be matched, Null if not set

	:rtype: Handle_IFSelect_Dispatch
") Dispatch;
		Handle_IFSelect_Dispatch Dispatch ();
		%feature("compactdefaultargs") Applies;
		%feature("autodoc", "	* Returns True if a Model obtained from the Dispatch <disp> is to be treated (apart from the Selection criterium) If Dispatch(me) is Null, returns True. Else, checks <disp>

	:param disp:
	:type disp: Handle_IFSelect_Dispatch &
	:rtype: bool
") Applies;
		Standard_Boolean Applies (const Handle_IFSelect_Dispatch & disp);
		%feature("compactdefaultargs") SetSelection;
		%feature("autodoc", "	* Sets a Selection : a Model is treated if it contains one or more Entities designated by the Selection

	:param sel:
	:type sel: Handle_IFSelect_Selection &
	:rtype: None
") SetSelection;
		void SetSelection (const Handle_IFSelect_Selection & sel);
		%feature("compactdefaultargs") ResetSelection;
		%feature("autodoc", "	* Resets the Selection : this criterium is not longer active

	:rtype: None
") ResetSelection;
		void ResetSelection ();
		%feature("compactdefaultargs") HasSelection;
		%feature("autodoc", "	* Returns True if a Selection is set as an additionnal criterium

	:rtype: bool
") HasSelection;
		Standard_Boolean HasSelection ();
		%feature("compactdefaultargs") Selection;
		%feature("autodoc", "	* Returns the Selection, or a Null Handle if not set

	:rtype: Handle_IFSelect_Selection
") Selection;
		Handle_IFSelect_Selection Selection ();
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "	* Returns a short text which defines the operation performed

	:rtype: TCollection_AsciiString
") Label;
		virtual TCollection_AsciiString Label ();
};


%extend IFSelect_GeneralModifier {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_IFSelect_GeneralModifier(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_IFSelect_GeneralModifier::Handle_IFSelect_GeneralModifier %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_IFSelect_GeneralModifier;
class Handle_IFSelect_GeneralModifier : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_IFSelect_GeneralModifier();
        Handle_IFSelect_GeneralModifier(const Handle_IFSelect_GeneralModifier &aHandle);
        Handle_IFSelect_GeneralModifier(const IFSelect_GeneralModifier *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_IFSelect_GeneralModifier DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_IFSelect_GeneralModifier {
    IFSelect_GeneralModifier* _get_reference() {
    return (IFSelect_GeneralModifier*)$self->Access();
    }
};

%extend Handle_IFSelect_GeneralModifier {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend IFSelect_GeneralModifier {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IFSelect_HSeqOfSelection;
class IFSelect_HSeqOfSelection : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") IFSelect_HSeqOfSelection;
		%feature("autodoc", "	:rtype: None
") IFSelect_HSeqOfSelection;
		 IFSelect_HSeqOfSelection ();
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
	:type anItem: Handle_IFSelect_Selection &
	:rtype: None
") Append;
		void Append (const Handle_IFSelect_Selection & anItem);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_IFSelect_HSeqOfSelection &
	:rtype: None
") Append;
		void Append (const Handle_IFSelect_HSeqOfSelection & aSequence);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param anItem:
	:type anItem: Handle_IFSelect_Selection &
	:rtype: None
") Prepend;
		void Prepend (const Handle_IFSelect_Selection & anItem);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param aSequence:
	:type aSequence: Handle_IFSelect_HSeqOfSelection &
	:rtype: None
") Prepend;
		void Prepend (const Handle_IFSelect_HSeqOfSelection & aSequence);
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "	:rtype: None
") Reverse;
		void Reverse ();
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: Handle_IFSelect_Selection &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_IFSelect_Selection & anItem);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param aSequence:
	:type aSequence: Handle_IFSelect_HSeqOfSelection &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_IFSelect_HSeqOfSelection & aSequence);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: Handle_IFSelect_Selection &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_IFSelect_Selection & anItem);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param aSequence:
	:type aSequence: Handle_IFSelect_HSeqOfSelection &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_IFSelect_HSeqOfSelection & aSequence);
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
	:rtype: Handle_IFSelect_HSeqOfSelection
") Split;
		Handle_IFSelect_HSeqOfSelection Split (const Standard_Integer anIndex);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:param anItem:
	:type anItem: Handle_IFSelect_Selection &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer anIndex,const Handle_IFSelect_Selection & anItem);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: Handle_IFSelect_Selection
") Value;
		Handle_IFSelect_Selection Value (const Standard_Integer anIndex);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param anIndex:
	:type anIndex: int
	:rtype: Handle_IFSelect_Selection
") ChangeValue;
		Handle_IFSelect_Selection ChangeValue (const Standard_Integer anIndex);
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
		%feature("autodoc", "	:rtype: IFSelect_TSeqOfSelection
") Sequence;
		const IFSelect_TSeqOfSelection & Sequence ();
		%feature("compactdefaultargs") ChangeSequence;
		%feature("autodoc", "	:rtype: IFSelect_TSeqOfSelection
") ChangeSequence;
		IFSelect_TSeqOfSelection & ChangeSequence ();
};


%extend IFSelect_HSeqOfSelection {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_IFSelect_HSeqOfSelection(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_IFSelect_HSeqOfSelection::Handle_IFSelect_HSeqOfSelection %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_IFSelect_HSeqOfSelection;
class Handle_IFSelect_HSeqOfSelection : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_IFSelect_HSeqOfSelection();
        Handle_IFSelect_HSeqOfSelection(const Handle_IFSelect_HSeqOfSelection &aHandle);
        Handle_IFSelect_HSeqOfSelection(const IFSelect_HSeqOfSelection *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_IFSelect_HSeqOfSelection DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_IFSelect_HSeqOfSelection {
    IFSelect_HSeqOfSelection* _get_reference() {
    return (IFSelect_HSeqOfSelection*)$self->Access();
    }
};

%extend Handle_IFSelect_HSeqOfSelection {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend IFSelect_HSeqOfSelection {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IFSelect_IntParam;
class IFSelect_IntParam : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") IFSelect_IntParam;
		%feature("autodoc", "	* Creates an IntParam. Initial value is set to zer

	:rtype: None
") IFSelect_IntParam;
		 IFSelect_IntParam ();
		%feature("compactdefaultargs") SetStaticName;
		%feature("autodoc", "	* Commands this IntParam to be bound to a Static Hence, Value will return the value if this Static if it is set Else, Value works on the locally stored value SetValue also will set the value of the Static This works only for a present static of type integer or enum Else, it is ignored //! If <statname> is empty, disconnects the IntParam from Static

	:param statname:
	:type statname: char *
	:rtype: None
") SetStaticName;
		void SetStaticName (const char * statname);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Reads Integer Value of the IntParam. If a StaticName is defined and the Static is set, looks in priority the value of the static

	:rtype: int
") Value;
		Standard_Integer Value ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	* Sets a new Integer Value for the IntParam. If a StaticName is defined and the Static is set, also sets the value of the static

	:param val:
	:type val: int
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer val);
};


%extend IFSelect_IntParam {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_IFSelect_IntParam(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_IFSelect_IntParam::Handle_IFSelect_IntParam %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_IFSelect_IntParam;
class Handle_IFSelect_IntParam : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_IFSelect_IntParam();
        Handle_IFSelect_IntParam(const Handle_IFSelect_IntParam &aHandle);
        Handle_IFSelect_IntParam(const IFSelect_IntParam *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_IFSelect_IntParam DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_IFSelect_IntParam {
    IFSelect_IntParam* _get_reference() {
    return (IFSelect_IntParam*)$self->Access();
    }
};

%extend Handle_IFSelect_IntParam {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend IFSelect_IntParam {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IFSelect_ListEditor;
class IFSelect_ListEditor : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") IFSelect_ListEditor;
		%feature("autodoc", "	* Creates a ListEditor with absolutely no constraint

	:rtype: None
") IFSelect_ListEditor;
		 IFSelect_ListEditor ();
		%feature("compactdefaultargs") IFSelect_ListEditor;
		%feature("autodoc", "	* Creates a ListEditor, for which items of the list to edit are defined by <def>, and <max> describes max length : 0 (D) means no limit value > 0 means : no more the <max> items are allowed

	:param def:
	:type def: Handle_Interface_TypedValue &
	:param max: default value is 0
	:type max: int
	:rtype: None
") IFSelect_ListEditor;
		 IFSelect_ListEditor (const Handle_Interface_TypedValue & def,const Standard_Integer max = 0);
		%feature("compactdefaultargs") LoadModel;
		%feature("autodoc", "	* Loads a Model. It is used to check items of type Entity(Ident)

	:param model:
	:type model: Handle_Interface_InterfaceModel &
	:rtype: None
") LoadModel;
		void LoadModel (const Handle_Interface_InterfaceModel & model);
		%feature("compactdefaultargs") LoadValues;
		%feature("autodoc", "	* Loads the original values for the list Remark : If its length is mor then MaxLength, editions remain allowed, except Add

	:param vals:
	:type vals: Handle_TColStd_HSequenceOfHAsciiString &
	:rtype: None
") LoadValues;
		void LoadValues (const Handle_TColStd_HSequenceOfHAsciiString & vals);
		%feature("compactdefaultargs") SetTouched;
		%feature("autodoc", "	* Declares this ListEditor to have been touched (whatever action)

	:rtype: None
") SetTouched;
		void SetTouched ();
		%feature("compactdefaultargs") ClearEdit;
		%feature("autodoc", "	* Clears all editions already recorded

	:rtype: None
") ClearEdit;
		void ClearEdit ();
		%feature("compactdefaultargs") LoadEdited;
		%feature("autodoc", "	* Loads a new list to replace the older one, in once ! By default (can be redefined) checks the length of the list and the value of each item according to the def Items are all recorded as Modified //! If no def has been given at creation time, no check is done Returns True when done, False if checks have failed ... a specialisation may also lock it by returning always False ...

	:param list:
	:type list: Handle_TColStd_HSequenceOfHAsciiString &
	:rtype: bool
") LoadEdited;
		virtual Standard_Boolean LoadEdited (const Handle_TColStd_HSequenceOfHAsciiString & list);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	* Sets a new value for the item <num> (in edited list) <val> may be a Null Handle, then the value will be cleared but not removed Returns True when done. False if <num> is out of range or if <val> does not satisfy the definition

	:param num:
	:type num: int
	:param val:
	:type val: Handle_TCollection_HAsciiString &
	:rtype: bool
") SetValue;
		virtual Standard_Boolean SetValue (const Standard_Integer num,const Handle_TCollection_HAsciiString & val);
		%feature("compactdefaultargs") AddValue;
		%feature("autodoc", "	* Adds a new item. By default appends (at the end of the list) Can insert before a given rank <num>, if positive Returns True when done. False if MaxLength may be overpassed or if <val> does not satisfy the definition

	:param val:
	:type val: Handle_TCollection_HAsciiString &
	:param atnum: default value is 0
	:type atnum: int
	:rtype: bool
") AddValue;
		virtual Standard_Boolean AddValue (const Handle_TCollection_HAsciiString & val,const Standard_Integer atnum = 0);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	* Removes items from the list By default removes one item. Else, count given by <howmany> Remove from rank <num> included. By default, from the end Returns True when done, False (and does not work) if case of out of range of if <howmany> is greater than current length

	:param num: default value is 0
	:type num: int
	:param howmany: default value is 1
	:type howmany: int
	:rtype: bool
") Remove;
		virtual Standard_Boolean Remove (const Standard_Integer num = 0,const Standard_Integer howmany = 1);
		%feature("compactdefaultargs") OriginalValues;
		%feature("autodoc", "	* Returns the value from which the edition started

	:rtype: Handle_TColStd_HSequenceOfHAsciiString
") OriginalValues;
		Handle_TColStd_HSequenceOfHAsciiString OriginalValues ();
		%feature("compactdefaultargs") EditedValues;
		%feature("autodoc", "	* Returns the result of the edition

	:rtype: Handle_TColStd_HSequenceOfHAsciiString
") EditedValues;
		Handle_TColStd_HSequenceOfHAsciiString EditedValues ();
		%feature("compactdefaultargs") NbValues;
		%feature("autodoc", "	* Returns count of values, edited (D) or original

	:param edited: default value is Standard_True
	:type edited: bool
	:rtype: int
") NbValues;
		Standard_Integer NbValues (const Standard_Boolean edited = Standard_True);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Returns a value given its rank. Edited (D) or Original A Null String means the value is cleared but not removed

	:param num:
	:type num: int
	:param edited: default value is Standard_True
	:type edited: bool
	:rtype: Handle_TCollection_HAsciiString
") Value;
		Handle_TCollection_HAsciiString Value (const Standard_Integer num,const Standard_Boolean edited = Standard_True);
		%feature("compactdefaultargs") IsChanged;
		%feature("autodoc", "	* Tells if a value (in edited list) has been changed, i.e. either modified-value, or added

	:param num:
	:type num: int
	:rtype: bool
") IsChanged;
		Standard_Boolean IsChanged (const Standard_Integer num);
		%feature("compactdefaultargs") IsModified;
		%feature("autodoc", "	* Tells if a value (in edited list) has been modified-value (not added)

	:param num:
	:type num: int
	:rtype: bool
") IsModified;
		Standard_Boolean IsModified (const Standard_Integer num);
		%feature("compactdefaultargs") IsAdded;
		%feature("autodoc", "	* Tells if a value (in edited list) has been added (new one)

	:param num:
	:type num: int
	:rtype: bool
") IsAdded;
		Standard_Boolean IsAdded (const Standard_Integer num);
		%feature("compactdefaultargs") IsTouched;
		%feature("autodoc", "	* Tells if at least one edition (SetValue-AddValue-Remove) has been recorded

	:rtype: bool
") IsTouched;
		Standard_Boolean IsTouched ();
};


%extend IFSelect_ListEditor {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_IFSelect_ListEditor(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_IFSelect_ListEditor::Handle_IFSelect_ListEditor %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_IFSelect_ListEditor;
class Handle_IFSelect_ListEditor : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_IFSelect_ListEditor();
        Handle_IFSelect_ListEditor(const Handle_IFSelect_ListEditor &aHandle);
        Handle_IFSelect_ListEditor(const IFSelect_ListEditor *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_IFSelect_ListEditor DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_IFSelect_ListEditor {
    IFSelect_ListEditor* _get_reference() {
    return (IFSelect_ListEditor*)$self->Access();
    }
};

%extend Handle_IFSelect_ListEditor {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend IFSelect_ListEditor {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IFSelect_ModelCopier;
class IFSelect_ModelCopier : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") IFSelect_ModelCopier;
		%feature("autodoc", "	* Creates an empty ModelCopier

	:rtype: None
") IFSelect_ModelCopier;
		 IFSelect_ModelCopier ();
		%feature("compactdefaultargs") SetShareOut;
		%feature("autodoc", "	* Sets the ShareOut, which is used to define Modifiers to apply

	:param sho:
	:type sho: Handle_IFSelect_ShareOut &
	:rtype: None
") SetShareOut;
		void SetShareOut (const Handle_IFSelect_ShareOut & sho);
		%feature("compactdefaultargs") ClearResult;
		%feature("autodoc", "	* Clears the list of produced Models

	:rtype: None
") ClearResult;
		void ClearResult ();
		%feature("compactdefaultargs") AddFile;
		%feature("autodoc", "	* Records a new File to be sent, as a couple (Name as AsciiString, Content as InterfaceModel) Returns True if Done, False if <filename> is already attached to another File

	:param filename:
	:type filename: TCollection_AsciiString &
	:param content:
	:type content: Handle_Interface_InterfaceModel &
	:rtype: bool
") AddFile;
		Standard_Boolean AddFile (const TCollection_AsciiString & filename,const Handle_Interface_InterfaceModel & content);
		%feature("compactdefaultargs") NameFile;
		%feature("autodoc", "	* Changes the Name attached to a File which was formerly defined by a call to AddFile Returns True if Done, False else : if <num> out of range or if the new <filename> is already attached to another File Remark : Giving an empty File Name is equivalent to ClearFile

	:param num:
	:type num: int
	:param filename:
	:type filename: TCollection_AsciiString &
	:rtype: bool
") NameFile;
		Standard_Boolean NameFile (const Standard_Integer num,const TCollection_AsciiString & filename);
		%feature("compactdefaultargs") ClearFile;
		%feature("autodoc", "	* Clears the Name attached to a File which was formerly defined by a call to AddFile. This Clearing can be undone by a call to NameFile (with same <num>) Returns True if Done, False else : if <num> is out of range

	:param num:
	:type num: int
	:rtype: bool
") ClearFile;
		Standard_Boolean ClearFile (const Standard_Integer num);
		%feature("compactdefaultargs") SetAppliedModifiers;
		%feature("autodoc", "	* Sets a list of File Modifiers to be applied on a file

	:param num:
	:type num: int
	:param applied:
	:type applied: Handle_IFSelect_AppliedModifiers &
	:rtype: bool
") SetAppliedModifiers;
		Standard_Boolean SetAppliedModifiers (const Standard_Integer num,const Handle_IFSelect_AppliedModifiers & applied);
		%feature("compactdefaultargs") ClearAppliedModifiers;
		%feature("autodoc", "	* Clears the list of File Modifiers to be applied on a file

	:param num:
	:type num: int
	:rtype: bool
") ClearAppliedModifiers;
		Standard_Boolean ClearAppliedModifiers (const Standard_Integer num);
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "	* Performs the Copy Operations, which include the Modifications defined by the list of Modifiers. Memorizes the result, as a list of InterfaceModels with the corresponding FileNames They can then be sent, by the method Send, or queried Copy calls internal method Copying. Returns the produced CheckList

	:param eval:
	:type eval: IFSelect_ShareOutResult &
	:param WL:
	:type WL: Handle_IFSelect_WorkLibrary &
	:param protocol:
	:type protocol: Handle_Interface_Protocol &
	:rtype: Interface_CheckIterator
") Copy;
		Interface_CheckIterator Copy (IFSelect_ShareOutResult & eval,const Handle_IFSelect_WorkLibrary & WL,const Handle_Interface_Protocol & protocol);
		%feature("compactdefaultargs") SendCopied;
		%feature("autodoc", "	* Sends the formerly defined results (see method Copy) to files, then clears it Remark : A Null File Name cause file to be not produced

	:param WL:
	:type WL: Handle_IFSelect_WorkLibrary &
	:param protocol:
	:type protocol: Handle_Interface_Protocol &
	:rtype: Interface_CheckIterator
") SendCopied;
		Interface_CheckIterator SendCopied (const Handle_IFSelect_WorkLibrary & WL,const Handle_Interface_Protocol & protocol);
		%feature("compactdefaultargs") Send;
		%feature("autodoc", "	* Performs the Copy Operations (which include the Modifications) and Sends the result on files, without memorizing it. (the memorized result is ignored : neither queried not filled)

	:param eval:
	:type eval: IFSelect_ShareOutResult &
	:param WL:
	:type WL: Handle_IFSelect_WorkLibrary &
	:param protocol:
	:type protocol: Handle_Interface_Protocol &
	:rtype: Interface_CheckIterator
") Send;
		Interface_CheckIterator Send (IFSelect_ShareOutResult & eval,const Handle_IFSelect_WorkLibrary & WL,const Handle_Interface_Protocol & protocol);
		%feature("compactdefaultargs") SendAll;
		%feature("autodoc", "	* Sends a model (defined in <G>) into one file, without managing remaining data, already sent files, etc. Applies the Model and File Modifiers. Returns True if well done, False else

	:param filename:
	:type filename: char *
	:param G:
	:type G: Interface_Graph &
	:param WL:
	:type WL: Handle_IFSelect_WorkLibrary &
	:param protocol:
	:type protocol: Handle_Interface_Protocol &
	:rtype: Interface_CheckIterator
") SendAll;
		Interface_CheckIterator SendAll (const char * filename,const Interface_Graph & G,const Handle_IFSelect_WorkLibrary & WL,const Handle_Interface_Protocol & protocol);
		%feature("compactdefaultargs") SendSelected;
		%feature("autodoc", "	* Sends a part of a model into one file. Model is gotten from <G>, the part is defined in <iter>. Remaining data are managed and can be later be worked on. Returns True if well done, False else

	:param filename:
	:type filename: char *
	:param G:
	:type G: Interface_Graph &
	:param WL:
	:type WL: Handle_IFSelect_WorkLibrary &
	:param protocol:
	:type protocol: Handle_Interface_Protocol &
	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: Interface_CheckIterator
") SendSelected;
		Interface_CheckIterator SendSelected (const char * filename,const Interface_Graph & G,const Handle_IFSelect_WorkLibrary & WL,const Handle_Interface_Protocol & protocol,const Interface_EntityIterator & iter);
		%feature("compactdefaultargs") CopiedRemaining;
		%feature("autodoc", "	* Produces a Model copied from the Remaining List as <newmod> <newmod> is a Null Handle if this list is empty <WL> performs the copy by using <TC> <TC> is assumed to have been defined with the starting model same as defined by <G>.

	:param G:
	:type G: Interface_Graph &
	:param WL:
	:type WL: Handle_IFSelect_WorkLibrary &
	:param TC:
	:type TC: Interface_CopyTool &
	:param newmod:
	:type newmod: Handle_Interface_InterfaceModel &
	:rtype: None
") CopiedRemaining;
		void CopiedRemaining (const Interface_Graph & G,const Handle_IFSelect_WorkLibrary & WL,Interface_CopyTool & TC,Handle_Interface_InterfaceModel & newmod);
		%feature("compactdefaultargs") SetRemaining;
		%feature("autodoc", "	* Updates Graph status for remaining data, for each entity : - Entities just Sent to file or Copied (by CopiedRemaining) have their status set to 1 - the other keep their former status (1 for Send/Copied, 0 for Remaining) These status are computed by Copying/Sending/CopiedRemaining Then, SetRemaining updates graph status, and mustr be called just after one of these method has been called Returns True if done, False if remaining info if not in phase which the Graph (not same counts of items)

	:param CG:
	:type CG: Interface_Graph &
	:rtype: bool
") SetRemaining;
		Standard_Boolean SetRemaining (Interface_Graph & CG);
		%feature("compactdefaultargs") NbFiles;
		%feature("autodoc", "	* Returns the count of Files produced, i.e. the count of Models memorized (produced by the mmethod Copy) with their file names

	:rtype: int
") NbFiles;
		Standard_Integer NbFiles ();
		%feature("compactdefaultargs") FileName;
		%feature("autodoc", "	* Returns the File Name for a file given its rank It is empty after a call to ClearFile on same <num>

	:param num:
	:type num: int
	:rtype: TCollection_AsciiString
") FileName;
		TCollection_AsciiString FileName (const Standard_Integer num);
		%feature("compactdefaultargs") FileModel;
		%feature("autodoc", "	* Returns the content of a file before sending, under the form of an InterfaceModel, given its rank

	:param num:
	:type num: int
	:rtype: Handle_Interface_InterfaceModel
") FileModel;
		Handle_Interface_InterfaceModel FileModel (const Standard_Integer num);
		%feature("compactdefaultargs") AppliedModifiers;
		%feature("autodoc", "	* Returns the list of File Modifiers to be applied on a file when it will be sent, as computed by CopiedModel : If it is a null handle, no File Modifier has to be applied.

	:param num:
	:type num: int
	:rtype: Handle_IFSelect_AppliedModifiers
") AppliedModifiers;
		Handle_IFSelect_AppliedModifiers AppliedModifiers (const Standard_Integer num);
		%feature("compactdefaultargs") BeginSentFiles;
		%feature("autodoc", "	* Begins a sequence of recording the really sent files <sho> : the default file numbering is cleared If <record> is False, clears the list and stops recording If <record> is True, clears the list and commands recording Creation time corresponds to 'stop recording'

	:param sho:
	:type sho: Handle_IFSelect_ShareOut &
	:param record:
	:type record: bool
	:rtype: None
") BeginSentFiles;
		void BeginSentFiles (const Handle_IFSelect_ShareOut & sho,const Standard_Boolean record);
		%feature("compactdefaultargs") AddSentFile;
		%feature("autodoc", "	* Adds the name of a just sent file, if BeginSentFiles has commanded recording; else does nothing It is called by methods SendCopied Sending

	:param filename:
	:type filename: char *
	:rtype: None
") AddSentFile;
		void AddSentFile (const char * filename);
		%feature("compactdefaultargs") SentFiles;
		%feature("autodoc", "	* Returns the list of recorded names of sent files. Can be empty (if no file has been sent). Returns a Null Handle if BeginSentFiles has stopped recording.

	:rtype: Handle_TColStd_HSequenceOfHAsciiString
") SentFiles;
		Handle_TColStd_HSequenceOfHAsciiString SentFiles ();
};


%extend IFSelect_ModelCopier {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_IFSelect_ModelCopier(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_IFSelect_ModelCopier::Handle_IFSelect_ModelCopier %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_IFSelect_ModelCopier;
class Handle_IFSelect_ModelCopier : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_IFSelect_ModelCopier();
        Handle_IFSelect_ModelCopier(const Handle_IFSelect_ModelCopier &aHandle);
        Handle_IFSelect_ModelCopier(const IFSelect_ModelCopier *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_IFSelect_ModelCopier DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_IFSelect_ModelCopier {
    IFSelect_ModelCopier* _get_reference() {
    return (IFSelect_ModelCopier*)$self->Access();
    }
};

%extend Handle_IFSelect_ModelCopier {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend IFSelect_ModelCopier {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IFSelect_PacketList;
class IFSelect_PacketList : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") IFSelect_PacketList;
		%feature("autodoc", "	* Creates a PackList, empty, ready to receive entities from a given Model

	:param model:
	:type model: Handle_Interface_InterfaceModel &
	:rtype: None
") IFSelect_PacketList;
		 IFSelect_PacketList (const Handle_Interface_InterfaceModel & model);
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "	* Sets a name to a packet list : this makes easier a general routine to print it. Default is 'Packets'

	:param name:
	:type name: char *
	:rtype: None
") SetName;
		void SetName (const char * name);
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "	* Returns the recorded name for a packet list

	:rtype: char *
") Name;
		const char * Name ();
		%feature("compactdefaultargs") Model;
		%feature("autodoc", "	* Returns the Model of reference

	:rtype: Handle_Interface_InterfaceModel
") Model;
		Handle_Interface_InterfaceModel Model ();
		%feature("compactdefaultargs") AddPacket;
		%feature("autodoc", "	* Declares a new Packet, ready to be filled The entities to be added will be added to this Packet

	:rtype: None
") AddPacket;
		void AddPacket ();
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* Adds an entity from the Model into the current packet for Add

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: None
") Add;
		void Add (const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") AddList;
		%feature("autodoc", "	* Adds an list of entities into the current packet for Add

	:param list:
	:type list: Handle_TColStd_HSequenceOfTransient &
	:rtype: None
") AddList;
		void AddList (const Handle_TColStd_HSequenceOfTransient & list);
		%feature("compactdefaultargs") NbPackets;
		%feature("autodoc", "	* Returns the count of non-empty packets

	:rtype: int
") NbPackets;
		Standard_Integer NbPackets ();
		%feature("compactdefaultargs") NbEntities;
		%feature("autodoc", "	* Returns the count of entities in a Packet given its rank, or 0

	:param numpack:
	:type numpack: int
	:rtype: int
") NbEntities;
		Standard_Integer NbEntities (const Standard_Integer numpack);
		%feature("compactdefaultargs") Entities;
		%feature("autodoc", "	* Returns the content of a Packet given its rank Null Handle if <numpack> is out of range

	:param numpack:
	:type numpack: int
	:rtype: Interface_EntityIterator
") Entities;
		Interface_EntityIterator Entities (const Standard_Integer numpack);
		%feature("compactdefaultargs") HighestDuplicationCount;
		%feature("autodoc", "	* Returns the highest number of packets which know a same entity For no duplication, should be one

	:rtype: int
") HighestDuplicationCount;
		Standard_Integer HighestDuplicationCount ();
		%feature("compactdefaultargs") NbDuplicated;
		%feature("autodoc", "	* Returns the count of entities duplicated : <count> times, if <andmore> is False, or <count> or more times, if <andmore> is True See Duplicated for more details

	:param count:
	:type count: int
	:param andmore:
	:type andmore: bool
	:rtype: int
") NbDuplicated;
		Standard_Integer NbDuplicated (const Standard_Integer count,const Standard_Boolean andmore);
		%feature("compactdefaultargs") Duplicated;
		%feature("autodoc", "	* Returns a list of entities duplicated : <count> times, if <andmore> is False, or <count> or more times, if <andmore> is True Hence, count=2 & andmore=True gives all duplicated entities count=1 gives non-duplicated entities (in only one packet) count=0 gives remaining entities (in no packet at all)

	:param count:
	:type count: int
	:param andmore:
	:type andmore: bool
	:rtype: Interface_EntityIterator
") Duplicated;
		Interface_EntityIterator Duplicated (const Standard_Integer count,const Standard_Boolean andmore);
};


%extend IFSelect_PacketList {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_IFSelect_PacketList(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_IFSelect_PacketList::Handle_IFSelect_PacketList %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_IFSelect_PacketList;
class Handle_IFSelect_PacketList : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_IFSelect_PacketList();
        Handle_IFSelect_PacketList(const Handle_IFSelect_PacketList &aHandle);
        Handle_IFSelect_PacketList(const IFSelect_PacketList *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_IFSelect_PacketList DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_IFSelect_PacketList {
    IFSelect_PacketList* _get_reference() {
    return (IFSelect_PacketList*)$self->Access();
    }
};

%extend Handle_IFSelect_PacketList {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend IFSelect_PacketList {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IFSelect_Selection;
class IFSelect_Selection : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") RootResult;
		%feature("autodoc", "	* Returns the list of selected entities, computed from Input given as a Graph. Specific to each class of Selection Note that uniqueness of each entity is not required here This method can raise an exception as necessary

	:param G:
	:type G: Interface_Graph &
	:rtype: Interface_EntityIterator
") RootResult;
		virtual Interface_EntityIterator RootResult (const Interface_Graph & G);
		%feature("compactdefaultargs") UniqueResult;
		%feature("autodoc", "	* Returns the list of selected entities, each of them beeing unique. Default definition works from RootResult. According HasUniqueResult, UniqueResult returns directly RootResult, or build a Unique Result from it with a Graph.

	:param G:
	:type G: Interface_Graph &
	:rtype: Interface_EntityIterator
") UniqueResult;
		Interface_EntityIterator UniqueResult (const Interface_Graph & G);
		%feature("compactdefaultargs") CompleteResult;
		%feature("autodoc", "	* Returns the list of entities involved by a Selection, i.e. UniqueResult plus the shared entities (directly or not)

	:param G:
	:type G: Interface_Graph &
	:rtype: Interface_EntityIterator
") CompleteResult;
		virtual Interface_EntityIterator CompleteResult (const Interface_Graph & G);
		%feature("compactdefaultargs") FillIterator;
		%feature("autodoc", "	* Puts in an Iterator the Selections from which 'me' depends (there can be zero, or one, or a list). Specific to each class of Selection

	:param iter:
	:type iter: IFSelect_SelectionIterator &
	:rtype: void
") FillIterator;
		virtual void FillIterator (IFSelect_SelectionIterator & iter);
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "	* Returns a text which defines the criterium applied by a Selection (can be used to be printed, displayed ...) Specific to each class

	:rtype: TCollection_AsciiString
") Label;
		virtual TCollection_AsciiString Label ();
};


%extend IFSelect_Selection {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_IFSelect_Selection(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_IFSelect_Selection::Handle_IFSelect_Selection %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_IFSelect_Selection;
class Handle_IFSelect_Selection : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_IFSelect_Selection();
        Handle_IFSelect_Selection(const Handle_IFSelect_Selection &aHandle);
        Handle_IFSelect_Selection(const IFSelect_Selection *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_IFSelect_Selection DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_IFSelect_Selection {
    IFSelect_Selection* _get_reference() {
    return (IFSelect_Selection*)$self->Access();
    }
};

%extend Handle_IFSelect_Selection {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend IFSelect_Selection {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IFSelect_SelectionIterator;
class IFSelect_SelectionIterator {
	public:
		%feature("compactdefaultargs") IFSelect_SelectionIterator;
		%feature("autodoc", "	* Creates an empty iterator, ready to be filled

	:rtype: None
") IFSelect_SelectionIterator;
		 IFSelect_SelectionIterator ();
		%feature("compactdefaultargs") IFSelect_SelectionIterator;
		%feature("autodoc", "	* Creates an iterator from a Selection : it lists the Selections from which <sel> depends (given by its method FillIterator)

	:param sel:
	:type sel: Handle_IFSelect_Selection &
	:rtype: None
") IFSelect_SelectionIterator;
		 IFSelect_SelectionIterator (const Handle_IFSelect_Selection & sel);
		%feature("compactdefaultargs") AddFromIter;
		%feature("autodoc", "	* Adds to an iterator the content of another one (each selection is present only once in the result)

	:param iter:
	:type iter: IFSelect_SelectionIterator &
	:rtype: None
") AddFromIter;
		void AddFromIter (IFSelect_SelectionIterator & iter);
		%feature("compactdefaultargs") AddItem;
		%feature("autodoc", "	* Adds a Selection to an iterator (if not yet noted)

	:param sel:
	:type sel: Handle_IFSelect_Selection &
	:rtype: None
") AddItem;
		void AddItem (const Handle_IFSelect_Selection & sel);
		%feature("compactdefaultargs") AddList;
		%feature("autodoc", "	* Adds a list of Selections to an iterator (this list comes from the description of a Selection or a Dispatch, etc...)

	:param list:
	:type list: IFSelect_TSeqOfSelection &
	:rtype: None
") AddList;
		void AddList (const IFSelect_TSeqOfSelection & list);
		%feature("compactdefaultargs") More;
		%feature("autodoc", "	* Returns True if there are more Selections to get

	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "	* Sets iterator to the next item

	:rtype: None
") Next;
		void Next ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Returns the current Selction beeing iterated Error if count of Selection has been passed

	:rtype: Handle_IFSelect_Selection
") Value;
		Handle_IFSelect_Selection Value ();
};


%extend IFSelect_SelectionIterator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IFSelect_SequenceNodeOfSequenceOfAppliedModifiers;
class IFSelect_SequenceNodeOfSequenceOfAppliedModifiers : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") IFSelect_SequenceNodeOfSequenceOfAppliedModifiers;
		%feature("autodoc", "	:param I:
	:type I: Handle_IFSelect_AppliedModifiers &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") IFSelect_SequenceNodeOfSequenceOfAppliedModifiers;
		 IFSelect_SequenceNodeOfSequenceOfAppliedModifiers (const Handle_IFSelect_AppliedModifiers & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_IFSelect_AppliedModifiers
") Value;
		Handle_IFSelect_AppliedModifiers Value ();
};


%extend IFSelect_SequenceNodeOfSequenceOfAppliedModifiers {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_IFSelect_SequenceNodeOfSequenceOfAppliedModifiers(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_IFSelect_SequenceNodeOfSequenceOfAppliedModifiers::Handle_IFSelect_SequenceNodeOfSequenceOfAppliedModifiers %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_IFSelect_SequenceNodeOfSequenceOfAppliedModifiers;
class Handle_IFSelect_SequenceNodeOfSequenceOfAppliedModifiers : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_IFSelect_SequenceNodeOfSequenceOfAppliedModifiers();
        Handle_IFSelect_SequenceNodeOfSequenceOfAppliedModifiers(const Handle_IFSelect_SequenceNodeOfSequenceOfAppliedModifiers &aHandle);
        Handle_IFSelect_SequenceNodeOfSequenceOfAppliedModifiers(const IFSelect_SequenceNodeOfSequenceOfAppliedModifiers *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_IFSelect_SequenceNodeOfSequenceOfAppliedModifiers DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_IFSelect_SequenceNodeOfSequenceOfAppliedModifiers {
    IFSelect_SequenceNodeOfSequenceOfAppliedModifiers* _get_reference() {
    return (IFSelect_SequenceNodeOfSequenceOfAppliedModifiers*)$self->Access();
    }
};

%extend Handle_IFSelect_SequenceNodeOfSequenceOfAppliedModifiers {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend IFSelect_SequenceNodeOfSequenceOfAppliedModifiers {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IFSelect_SequenceNodeOfSequenceOfGeneralModifier;
class IFSelect_SequenceNodeOfSequenceOfGeneralModifier : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") IFSelect_SequenceNodeOfSequenceOfGeneralModifier;
		%feature("autodoc", "	:param I:
	:type I: Handle_IFSelect_GeneralModifier &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") IFSelect_SequenceNodeOfSequenceOfGeneralModifier;
		 IFSelect_SequenceNodeOfSequenceOfGeneralModifier (const Handle_IFSelect_GeneralModifier & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_IFSelect_GeneralModifier
") Value;
		Handle_IFSelect_GeneralModifier Value ();
};


%extend IFSelect_SequenceNodeOfSequenceOfGeneralModifier {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_IFSelect_SequenceNodeOfSequenceOfGeneralModifier(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_IFSelect_SequenceNodeOfSequenceOfGeneralModifier::Handle_IFSelect_SequenceNodeOfSequenceOfGeneralModifier %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_IFSelect_SequenceNodeOfSequenceOfGeneralModifier;
class Handle_IFSelect_SequenceNodeOfSequenceOfGeneralModifier : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_IFSelect_SequenceNodeOfSequenceOfGeneralModifier();
        Handle_IFSelect_SequenceNodeOfSequenceOfGeneralModifier(const Handle_IFSelect_SequenceNodeOfSequenceOfGeneralModifier &aHandle);
        Handle_IFSelect_SequenceNodeOfSequenceOfGeneralModifier(const IFSelect_SequenceNodeOfSequenceOfGeneralModifier *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_IFSelect_SequenceNodeOfSequenceOfGeneralModifier DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_IFSelect_SequenceNodeOfSequenceOfGeneralModifier {
    IFSelect_SequenceNodeOfSequenceOfGeneralModifier* _get_reference() {
    return (IFSelect_SequenceNodeOfSequenceOfGeneralModifier*)$self->Access();
    }
};

%extend Handle_IFSelect_SequenceNodeOfSequenceOfGeneralModifier {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend IFSelect_SequenceNodeOfSequenceOfGeneralModifier {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IFSelect_SequenceNodeOfSequenceOfInterfaceModel;
class IFSelect_SequenceNodeOfSequenceOfInterfaceModel : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") IFSelect_SequenceNodeOfSequenceOfInterfaceModel;
		%feature("autodoc", "	:param I:
	:type I: Handle_Interface_InterfaceModel &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") IFSelect_SequenceNodeOfSequenceOfInterfaceModel;
		 IFSelect_SequenceNodeOfSequenceOfInterfaceModel (const Handle_Interface_InterfaceModel & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_Interface_InterfaceModel
") Value;
		Handle_Interface_InterfaceModel Value ();
};


%extend IFSelect_SequenceNodeOfSequenceOfInterfaceModel {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_IFSelect_SequenceNodeOfSequenceOfInterfaceModel(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_IFSelect_SequenceNodeOfSequenceOfInterfaceModel::Handle_IFSelect_SequenceNodeOfSequenceOfInterfaceModel %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_IFSelect_SequenceNodeOfSequenceOfInterfaceModel;
class Handle_IFSelect_SequenceNodeOfSequenceOfInterfaceModel : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_IFSelect_SequenceNodeOfSequenceOfInterfaceModel();
        Handle_IFSelect_SequenceNodeOfSequenceOfInterfaceModel(const Handle_IFSelect_SequenceNodeOfSequenceOfInterfaceModel &aHandle);
        Handle_IFSelect_SequenceNodeOfSequenceOfInterfaceModel(const IFSelect_SequenceNodeOfSequenceOfInterfaceModel *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_IFSelect_SequenceNodeOfSequenceOfInterfaceModel DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_IFSelect_SequenceNodeOfSequenceOfInterfaceModel {
    IFSelect_SequenceNodeOfSequenceOfInterfaceModel* _get_reference() {
    return (IFSelect_SequenceNodeOfSequenceOfInterfaceModel*)$self->Access();
    }
};

%extend Handle_IFSelect_SequenceNodeOfSequenceOfInterfaceModel {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend IFSelect_SequenceNodeOfSequenceOfInterfaceModel {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IFSelect_SequenceNodeOfTSeqOfDispatch;
class IFSelect_SequenceNodeOfTSeqOfDispatch : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") IFSelect_SequenceNodeOfTSeqOfDispatch;
		%feature("autodoc", "	:param I:
	:type I: Handle_IFSelect_Dispatch &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") IFSelect_SequenceNodeOfTSeqOfDispatch;
		 IFSelect_SequenceNodeOfTSeqOfDispatch (const Handle_IFSelect_Dispatch & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_IFSelect_Dispatch
") Value;
		Handle_IFSelect_Dispatch Value ();
};


%extend IFSelect_SequenceNodeOfTSeqOfDispatch {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_IFSelect_SequenceNodeOfTSeqOfDispatch(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_IFSelect_SequenceNodeOfTSeqOfDispatch::Handle_IFSelect_SequenceNodeOfTSeqOfDispatch %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_IFSelect_SequenceNodeOfTSeqOfDispatch;
class Handle_IFSelect_SequenceNodeOfTSeqOfDispatch : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_IFSelect_SequenceNodeOfTSeqOfDispatch();
        Handle_IFSelect_SequenceNodeOfTSeqOfDispatch(const Handle_IFSelect_SequenceNodeOfTSeqOfDispatch &aHandle);
        Handle_IFSelect_SequenceNodeOfTSeqOfDispatch(const IFSelect_SequenceNodeOfTSeqOfDispatch *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_IFSelect_SequenceNodeOfTSeqOfDispatch DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_IFSelect_SequenceNodeOfTSeqOfDispatch {
    IFSelect_SequenceNodeOfTSeqOfDispatch* _get_reference() {
    return (IFSelect_SequenceNodeOfTSeqOfDispatch*)$self->Access();
    }
};

%extend Handle_IFSelect_SequenceNodeOfTSeqOfDispatch {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend IFSelect_SequenceNodeOfTSeqOfDispatch {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IFSelect_SequenceNodeOfTSeqOfSelection;
class IFSelect_SequenceNodeOfTSeqOfSelection : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") IFSelect_SequenceNodeOfTSeqOfSelection;
		%feature("autodoc", "	:param I:
	:type I: Handle_IFSelect_Selection &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") IFSelect_SequenceNodeOfTSeqOfSelection;
		 IFSelect_SequenceNodeOfTSeqOfSelection (const Handle_IFSelect_Selection & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_IFSelect_Selection
") Value;
		Handle_IFSelect_Selection Value ();
};


%extend IFSelect_SequenceNodeOfTSeqOfSelection {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_IFSelect_SequenceNodeOfTSeqOfSelection(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_IFSelect_SequenceNodeOfTSeqOfSelection::Handle_IFSelect_SequenceNodeOfTSeqOfSelection %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_IFSelect_SequenceNodeOfTSeqOfSelection;
class Handle_IFSelect_SequenceNodeOfTSeqOfSelection : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_IFSelect_SequenceNodeOfTSeqOfSelection();
        Handle_IFSelect_SequenceNodeOfTSeqOfSelection(const Handle_IFSelect_SequenceNodeOfTSeqOfSelection &aHandle);
        Handle_IFSelect_SequenceNodeOfTSeqOfSelection(const IFSelect_SequenceNodeOfTSeqOfSelection *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_IFSelect_SequenceNodeOfTSeqOfSelection DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_IFSelect_SequenceNodeOfTSeqOfSelection {
    IFSelect_SequenceNodeOfTSeqOfSelection* _get_reference() {
    return (IFSelect_SequenceNodeOfTSeqOfSelection*)$self->Access();
    }
};

%extend Handle_IFSelect_SequenceNodeOfTSeqOfSelection {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend IFSelect_SequenceNodeOfTSeqOfSelection {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IFSelect_SequenceOfAppliedModifiers;
class IFSelect_SequenceOfAppliedModifiers : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") IFSelect_SequenceOfAppliedModifiers;
		%feature("autodoc", "	:rtype: None
") IFSelect_SequenceOfAppliedModifiers;
		 IFSelect_SequenceOfAppliedModifiers ();
		%feature("compactdefaultargs") IFSelect_SequenceOfAppliedModifiers;
		%feature("autodoc", "	:param Other:
	:type Other: IFSelect_SequenceOfAppliedModifiers &
	:rtype: None
") IFSelect_SequenceOfAppliedModifiers;
		 IFSelect_SequenceOfAppliedModifiers (const IFSelect_SequenceOfAppliedModifiers & Other);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: IFSelect_SequenceOfAppliedModifiers &
	:rtype: IFSelect_SequenceOfAppliedModifiers
") Assign;
		const IFSelect_SequenceOfAppliedModifiers & Assign (const IFSelect_SequenceOfAppliedModifiers & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: IFSelect_SequenceOfAppliedModifiers &
	:rtype: IFSelect_SequenceOfAppliedModifiers
") operator =;
		const IFSelect_SequenceOfAppliedModifiers & operator = (const IFSelect_SequenceOfAppliedModifiers & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: Handle_IFSelect_AppliedModifiers &
	:rtype: None
") Append;
		void Append (const Handle_IFSelect_AppliedModifiers & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: IFSelect_SequenceOfAppliedModifiers &
	:rtype: None
") Append;
		void Append (IFSelect_SequenceOfAppliedModifiers & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: Handle_IFSelect_AppliedModifiers &
	:rtype: None
") Prepend;
		void Prepend (const Handle_IFSelect_AppliedModifiers & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: IFSelect_SequenceOfAppliedModifiers &
	:rtype: None
") Prepend;
		void Prepend (IFSelect_SequenceOfAppliedModifiers & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_IFSelect_AppliedModifiers &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_IFSelect_AppliedModifiers & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: IFSelect_SequenceOfAppliedModifiers &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,IFSelect_SequenceOfAppliedModifiers & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_IFSelect_AppliedModifiers &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_IFSelect_AppliedModifiers & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: IFSelect_SequenceOfAppliedModifiers &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,IFSelect_SequenceOfAppliedModifiers & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: Handle_IFSelect_AppliedModifiers
") First;
		Handle_IFSelect_AppliedModifiers First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: Handle_IFSelect_AppliedModifiers
") Last;
		Handle_IFSelect_AppliedModifiers Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: IFSelect_SequenceOfAppliedModifiers &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,IFSelect_SequenceOfAppliedModifiers & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_IFSelect_AppliedModifiers
") Value;
		Handle_IFSelect_AppliedModifiers Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: Handle_IFSelect_AppliedModifiers &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_IFSelect_AppliedModifiers & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_IFSelect_AppliedModifiers
") ChangeValue;
		Handle_IFSelect_AppliedModifiers ChangeValue (const Standard_Integer Index);
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


%extend IFSelect_SequenceOfAppliedModifiers {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IFSelect_SequenceOfGeneralModifier;
class IFSelect_SequenceOfGeneralModifier : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") IFSelect_SequenceOfGeneralModifier;
		%feature("autodoc", "	:rtype: None
") IFSelect_SequenceOfGeneralModifier;
		 IFSelect_SequenceOfGeneralModifier ();
		%feature("compactdefaultargs") IFSelect_SequenceOfGeneralModifier;
		%feature("autodoc", "	:param Other:
	:type Other: IFSelect_SequenceOfGeneralModifier &
	:rtype: None
") IFSelect_SequenceOfGeneralModifier;
		 IFSelect_SequenceOfGeneralModifier (const IFSelect_SequenceOfGeneralModifier & Other);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: IFSelect_SequenceOfGeneralModifier &
	:rtype: IFSelect_SequenceOfGeneralModifier
") Assign;
		const IFSelect_SequenceOfGeneralModifier & Assign (const IFSelect_SequenceOfGeneralModifier & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: IFSelect_SequenceOfGeneralModifier &
	:rtype: IFSelect_SequenceOfGeneralModifier
") operator =;
		const IFSelect_SequenceOfGeneralModifier & operator = (const IFSelect_SequenceOfGeneralModifier & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: Handle_IFSelect_GeneralModifier &
	:rtype: None
") Append;
		void Append (const Handle_IFSelect_GeneralModifier & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: IFSelect_SequenceOfGeneralModifier &
	:rtype: None
") Append;
		void Append (IFSelect_SequenceOfGeneralModifier & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: Handle_IFSelect_GeneralModifier &
	:rtype: None
") Prepend;
		void Prepend (const Handle_IFSelect_GeneralModifier & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: IFSelect_SequenceOfGeneralModifier &
	:rtype: None
") Prepend;
		void Prepend (IFSelect_SequenceOfGeneralModifier & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_IFSelect_GeneralModifier &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_IFSelect_GeneralModifier & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: IFSelect_SequenceOfGeneralModifier &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,IFSelect_SequenceOfGeneralModifier & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_IFSelect_GeneralModifier &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_IFSelect_GeneralModifier & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: IFSelect_SequenceOfGeneralModifier &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,IFSelect_SequenceOfGeneralModifier & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: Handle_IFSelect_GeneralModifier
") First;
		Handle_IFSelect_GeneralModifier First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: Handle_IFSelect_GeneralModifier
") Last;
		Handle_IFSelect_GeneralModifier Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: IFSelect_SequenceOfGeneralModifier &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,IFSelect_SequenceOfGeneralModifier & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_IFSelect_GeneralModifier
") Value;
		Handle_IFSelect_GeneralModifier Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: Handle_IFSelect_GeneralModifier &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_IFSelect_GeneralModifier & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_IFSelect_GeneralModifier
") ChangeValue;
		Handle_IFSelect_GeneralModifier ChangeValue (const Standard_Integer Index);
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


%extend IFSelect_SequenceOfGeneralModifier {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IFSelect_SequenceOfInterfaceModel;
class IFSelect_SequenceOfInterfaceModel : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") IFSelect_SequenceOfInterfaceModel;
		%feature("autodoc", "	:rtype: None
") IFSelect_SequenceOfInterfaceModel;
		 IFSelect_SequenceOfInterfaceModel ();
		%feature("compactdefaultargs") IFSelect_SequenceOfInterfaceModel;
		%feature("autodoc", "	:param Other:
	:type Other: IFSelect_SequenceOfInterfaceModel &
	:rtype: None
") IFSelect_SequenceOfInterfaceModel;
		 IFSelect_SequenceOfInterfaceModel (const IFSelect_SequenceOfInterfaceModel & Other);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: IFSelect_SequenceOfInterfaceModel &
	:rtype: IFSelect_SequenceOfInterfaceModel
") Assign;
		const IFSelect_SequenceOfInterfaceModel & Assign (const IFSelect_SequenceOfInterfaceModel & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: IFSelect_SequenceOfInterfaceModel &
	:rtype: IFSelect_SequenceOfInterfaceModel
") operator =;
		const IFSelect_SequenceOfInterfaceModel & operator = (const IFSelect_SequenceOfInterfaceModel & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: Handle_Interface_InterfaceModel &
	:rtype: None
") Append;
		void Append (const Handle_Interface_InterfaceModel & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: IFSelect_SequenceOfInterfaceModel &
	:rtype: None
") Append;
		void Append (IFSelect_SequenceOfInterfaceModel & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: Handle_Interface_InterfaceModel &
	:rtype: None
") Prepend;
		void Prepend (const Handle_Interface_InterfaceModel & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: IFSelect_SequenceOfInterfaceModel &
	:rtype: None
") Prepend;
		void Prepend (IFSelect_SequenceOfInterfaceModel & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_Interface_InterfaceModel &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_Interface_InterfaceModel & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: IFSelect_SequenceOfInterfaceModel &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,IFSelect_SequenceOfInterfaceModel & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_Interface_InterfaceModel &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_Interface_InterfaceModel & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: IFSelect_SequenceOfInterfaceModel &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,IFSelect_SequenceOfInterfaceModel & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: Handle_Interface_InterfaceModel
") First;
		Handle_Interface_InterfaceModel First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: Handle_Interface_InterfaceModel
") Last;
		Handle_Interface_InterfaceModel Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: IFSelect_SequenceOfInterfaceModel &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,IFSelect_SequenceOfInterfaceModel & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_Interface_InterfaceModel
") Value;
		Handle_Interface_InterfaceModel Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: Handle_Interface_InterfaceModel &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Interface_InterfaceModel & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_Interface_InterfaceModel
") ChangeValue;
		Handle_Interface_InterfaceModel ChangeValue (const Standard_Integer Index);
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


%extend IFSelect_SequenceOfInterfaceModel {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IFSelect_SessionDumper;
class IFSelect_SessionDumper : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	* Returns the First item of the Library of Dumper. The Next ones are then obtained by Next on the returned items

	:rtype: Handle_IFSelect_SessionDumper
") First;
		static Handle_IFSelect_SessionDumper First ();
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "	* Returns the Next SesionDumper in the Library. Returns a Null Handle at the End.

	:rtype: Handle_IFSelect_SessionDumper
") Next;
		Handle_IFSelect_SessionDumper Next ();
		%feature("compactdefaultargs") WriteOwn;
		%feature("autodoc", "	* Writes the Own Parameters of a given Item, if it forecast to manage its Type. Returns True if it has recognized the Type of the Item (in this case, it is assumed to have written the Own Parameters if there are some), False else : in that case, SessionFile will try another SessionDumper in the Library. WriteOwn can use these methods from SessionFile : SendVoid, SendItem, SendText, and if necessary, WorkSession.

	:param file:
	:type file: IFSelect_SessionFile &
	:param item:
	:type item: Handle_Standard_Transient &
	:rtype: bool
") WriteOwn;
		virtual Standard_Boolean WriteOwn (IFSelect_SessionFile & file,const Handle_Standard_Transient & item);
		%feature("compactdefaultargs") ReadOwn;
		%feature("autodoc", "	* Recognizes a Type (given as <type>) then Creates an Item of this Type with the Own Parameter, as required. Returns True if it has recognized the Type (in this case, it is assumed to have created the Item, returned as <item>), False else : in that case, SessionFile will try another SessionDumper in the Library. ReadOwn can use these methods from SessionFile to access Own Parameters : NbOwnParams, IsVoid, IsText, TextValue, ItemValue

	:param file:
	:type file: IFSelect_SessionFile &
	:param type:
	:type type: TCollection_AsciiString &
	:param item:
	:type item: Handle_Standard_Transient &
	:rtype: bool
") ReadOwn;
		virtual Standard_Boolean ReadOwn (IFSelect_SessionFile & file,const TCollection_AsciiString & type,Handle_Standard_Transient & item);
};


%extend IFSelect_SessionDumper {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_IFSelect_SessionDumper(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_IFSelect_SessionDumper::Handle_IFSelect_SessionDumper %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_IFSelect_SessionDumper;
class Handle_IFSelect_SessionDumper : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_IFSelect_SessionDumper();
        Handle_IFSelect_SessionDumper(const Handle_IFSelect_SessionDumper &aHandle);
        Handle_IFSelect_SessionDumper(const IFSelect_SessionDumper *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_IFSelect_SessionDumper DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_IFSelect_SessionDumper {
    IFSelect_SessionDumper* _get_reference() {
    return (IFSelect_SessionDumper*)$self->Access();
    }
};

%extend Handle_IFSelect_SessionDumper {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend IFSelect_SessionDumper {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IFSelect_SessionFile;
class IFSelect_SessionFile {
	public:
		%feature("compactdefaultargs") IFSelect_SessionFile;
		%feature("autodoc", "	* Creates a SessionFile, ready to read Files in order to load them into a given WorkSession. The following Read Operations must then be called. It is also possible to perform a Write, which produces a complete File of all the content of the WorkSession.

	:param WS:
	:type WS: Handle_IFSelect_WorkSession &
	:rtype: None
") IFSelect_SessionFile;
		 IFSelect_SessionFile (const Handle_IFSelect_WorkSession & WS);
		%feature("compactdefaultargs") IFSelect_SessionFile;
		%feature("autodoc", "	* Creates a SessionFile which Writes the content of a WorkSession to a File (directly calls Write) Then, IsDone aknowledges on the result of the Operation. But such a SessionFile may not Read a File to a WorkSession.

	:param WS:
	:type WS: Handle_IFSelect_WorkSession &
	:param filename:
	:type filename: char *
	:rtype: None
") IFSelect_SessionFile;
		 IFSelect_SessionFile (const Handle_IFSelect_WorkSession & WS,const char * filename);
		%feature("compactdefaultargs") ClearLines;
		%feature("autodoc", "	* Clears the lines recorded whatever for writing or for reading

	:rtype: None
") ClearLines;
		void ClearLines ();
		%feature("compactdefaultargs") NbLines;
		%feature("autodoc", "	* Returns the count of recorded lines

	:rtype: int
") NbLines;
		Standard_Integer NbLines ();
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "	* Returns a line given its rank in the list of recorded lines

	:param num:
	:type num: int
	:rtype: TCollection_AsciiString
") Line;
		const TCollection_AsciiString & Line (const Standard_Integer num);
		%feature("compactdefaultargs") AddLine;
		%feature("autodoc", "	* Adds a line to the list of recorded lines

	:param line:
	:type line: char *
	:rtype: None
") AddLine;
		void AddLine (const char * line);
		%feature("compactdefaultargs") RemoveLastLine;
		%feature("autodoc", "	* Removes the last line. Can be called recursively. Does nothing if the list is empty

	:rtype: None
") RemoveLastLine;
		void RemoveLastLine ();
		%feature("compactdefaultargs") WriteFile;
		%feature("autodoc", "	* Writes the recorded lines to a file named <name> then clears the list of lines. Returns False (with no clearing) if the file could not be created

	:param name:
	:type name: char *
	:rtype: bool
") WriteFile;
		Standard_Boolean WriteFile (const char * name);
		%feature("compactdefaultargs") ReadFile;
		%feature("autodoc", "	* Reads the recorded lines from a file named <name>, after having cleared the list (stops if RecognizeFile fails) Returns False (with no clearing) if the file could not be read

	:param name:
	:type name: char *
	:rtype: bool
") ReadFile;
		Standard_Boolean ReadFile (const char * name);
		%feature("compactdefaultargs") RecognizeFile;
		%feature("autodoc", "	* Recognizes the header line. returns True if OK, False else

	:param headerline:
	:type headerline: char *
	:rtype: bool
") RecognizeFile;
		Standard_Boolean RecognizeFile (const char * headerline);
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "	* Performs a Write Operation from a WorkSession to a File i.e. calls WriteSession then WriteEnd, and WriteFile Returned Value is : 0 for OK, -1 File could not be created, >0 Error during Write (see WriteSession) IsDone can be called too (will return True for OK)

	:param filename:
	:type filename: char *
	:rtype: int
") Write;
		Standard_Integer Write (const char * filename);
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "	* Performs a Read Operation from a file to a WorkSession i.e. calls ReadFile, then ReadSession and ReadEnd Returned Value is : 0 for OK, -1 File could not be opened, >0 Error during Read (see WriteSession) IsDone can be called too (will return True for OK)

	:param filename:
	:type filename: char *
	:rtype: int
") Read;
		Standard_Integer Read (const char * filename);
		%feature("compactdefaultargs") WriteSession;
		%feature("autodoc", "	* Prepares the Write operation from a WorkSession (IFSelect) to a File, i.e. fills the list of lines (the file itself remains to be written; or NbLines/Line may be called) Important Remark : this excludes the reading of the last line, which is performed by WriteEnd Returns 0 if OK, status > 0 in case of error

	:rtype: int
") WriteSession;
		Standard_Integer WriteSession ();
		%feature("compactdefaultargs") WriteEnd;
		%feature("autodoc", "	* Writes the trailing line. It is separate from WriteSession, in order to allow to redefine WriteSession without touching WriteEnd (WriteSession defines the body of the file) WriteEnd fills the list of lines. Returns a status of error, 0 if OK, >0 else

	:rtype: int
") WriteEnd;
		Standard_Integer WriteEnd ();
		%feature("compactdefaultargs") WriteLine;
		%feature("autodoc", "	* Writes a line to the File. If <follow> is given, it is added at the following of the line. A newline must be added for the end.

	:param line:
	:type line: char *
	:param follow: default value is 0
	:type follow: Standard_Character
	:rtype: None
") WriteLine;
		void WriteLine (const char * line,const Standard_Character follow = 0);
		%feature("compactdefaultargs") WriteOwn;
		%feature("autodoc", "	* Writes the Parameters own to each type of Item. Uses the Library of SessionDumpers Returns True if Done, False if <item> could not be treated (hence it remains written with no Own Parameter)

	:param item:
	:type item: Handle_Standard_Transient &
	:rtype: bool
") WriteOwn;
		Standard_Boolean WriteOwn (const Handle_Standard_Transient & item);
		%feature("compactdefaultargs") ReadSession;
		%feature("autodoc", "	* Performs a Read Operation from a File to a WorkSession, i.e. reads the list of line (which must have already been loaded, by ReadFile or by calls to AddLine) Important Remark : this excludes the reading of the last line, which is performed by ReadEnd Returns 0 for OK, >0 status for Read Error (not a suitable File, or WorkSession given as Immutable at Creation Time) IsDone can be called too (will return True for OK)

	:rtype: int
") ReadSession;
		Standard_Integer ReadSession ();
		%feature("compactdefaultargs") ReadEnd;
		%feature("autodoc", "	* Reads the end of a file (its last line). Returns 0 if OK, status >0 in case of error (not a suitable end line).

	:rtype: int
") ReadEnd;
		Standard_Integer ReadEnd ();
		%feature("compactdefaultargs") ReadLine;
		%feature("autodoc", "	* Reads a Line and splits it into a set of alphanumeric items, which can then be queried by NbParams/ParamValue ...

	:rtype: bool
") ReadLine;
		Standard_Boolean ReadLine ();
		%feature("compactdefaultargs") SplitLine;
		%feature("autodoc", "	* Internal routine which processes a line into words and prepares its exploration

	:param line:
	:type line: char *
	:rtype: None
") SplitLine;
		void SplitLine (const char * line);
		%feature("compactdefaultargs") ReadOwn;
		%feature("autodoc", "	* Tries to Read an Item, by calling the Library of Dumpers Sets the list of parameters of the line to be read from the first own one

	:param item:
	:type item: Handle_Standard_Transient &
	:rtype: bool
") ReadOwn;
		Standard_Boolean ReadOwn (Handle_Standard_Transient & item);
		%feature("compactdefaultargs") AddItem;
		%feature("autodoc", "	* Adds an Item to the WorkSession, taken as Name the first item of the read Line. If this Name is not a Name but a Number or if this Name is already recorded in the WorkSession, it adds the Item but with no Name. Then the Name is recorded in order to be used by the method ItemValue <active> commands to make <item> active or not in the session

	:param item:
	:type item: Handle_Standard_Transient &
	:param active: default value is Standard_True
	:type active: bool
	:rtype: None
") AddItem;
		void AddItem (const Handle_Standard_Transient & item,const Standard_Boolean active = Standard_True);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* Returns True if the last Read or Write operation has been corectly performed. ELse returns False.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") WorkSession;
		%feature("autodoc", "	* Returns the WorkSession on which a SessionFile works. Remark that it is returned as Immutable.

	:rtype: Handle_IFSelect_WorkSession
") WorkSession;
		Handle_IFSelect_WorkSession WorkSession ();
		%feature("compactdefaultargs") NewItem;
		%feature("autodoc", "	* At beginning of writing an Item, writes its basics : - either its name in the session if it has one - or its relative number of item in the file, else (preceeded by a '_') - then, its Dynamic Type (in the sense of cdl : pk_class) This basic description can be followed by the parameters which are used in the definition of the item.

	:param ident:
	:type ident: int
	:param par:
	:type par: Handle_Standard_Transient &
	:rtype: None
") NewItem;
		void NewItem (const Standard_Integer ident,const Handle_Standard_Transient & par);
		%feature("compactdefaultargs") SetOwn;
		%feature("autodoc", "	* Sets Parameters to be sent as Own if <mode> is True (their Name or Number or Void Mark or Text Value is preceeded by a Column sign ':') else they are sent normally Hence, the Own Parameter are clearly identified in the File

	:param mode:
	:type mode: bool
	:rtype: None
") SetOwn;
		void SetOwn (const Standard_Boolean mode);
		%feature("compactdefaultargs") SendVoid;
		%feature("autodoc", "	* During a Write action, commands to send a Void Parameter i.e. a Parameter which is present but undefined Its form will be the dollar sign : $

	:rtype: None
") SendVoid;
		void SendVoid ();
		%feature("compactdefaultargs") SendItem;
		%feature("autodoc", "	* During a Write action, commands to send the identification of a Parameter : if it is Null (undefined) it is send as Void ($) if it is Named in the WorkSession, its Name is sent preceeded by ':', else a relative Ident Number is sent preceeded by '#' (relative to the present Write, i.e. starting at one, without skip, and counted part from Named Items)

	:param par:
	:type par: Handle_Standard_Transient &
	:rtype: None
") SendItem;
		void SendItem (const Handle_Standard_Transient & par);
		%feature("compactdefaultargs") SendText;
		%feature("autodoc", "	* During a Write action, commands to send a Text without interpretation. It will be sent as well

	:param text:
	:type text: char *
	:rtype: None
") SendText;
		void SendText (const char * text);
		%feature("compactdefaultargs") SetLastGeneral;
		%feature("autodoc", "	* Sets the rank of Last General Parameter to a new value. It is followed by the Fist Own Parameter of the item. Used by SessionFile after reading general parameters.

	:param lastgen:
	:type lastgen: int
	:rtype: None
") SetLastGeneral;
		void SetLastGeneral (const Standard_Integer lastgen);
		%feature("compactdefaultargs") NbParams;
		%feature("autodoc", "	* During a Read operation, SessionFile processes sequencially the Items to read. For each one, it gives access to the list of its Parameters : they were defined by calls to SendVoid/SendParam/SendText during Writing the File. NbParams returns the count of Parameters for the line currently read.

	:rtype: int
") NbParams;
		Standard_Integer NbParams ();
		%feature("compactdefaultargs") IsVoid;
		%feature("autodoc", "	* Returns True if a Parameter, given its rank in the Own List (see NbOwnParams), is Void. Returns also True if <num> is out of range (undefined parameters)

	:param num:
	:type num: int
	:rtype: bool
") IsVoid;
		Standard_Boolean IsVoid (const Standard_Integer num);
		%feature("compactdefaultargs") IsText;
		%feature("autodoc", "	* Returns True if a Parameter, in the Own List (see NbOwnParams) is a Text (between '...'). Else it is an Item (Parameter, Selection, Dispatch ...), which can be Void.

	:param num:
	:type num: int
	:rtype: bool
") IsText;
		Standard_Boolean IsText (const Standard_Integer num);
		%feature("compactdefaultargs") ParamValue;
		%feature("autodoc", "	* Returns a Parameter (alphanumeric item of a line) as it has been read

	:param num:
	:type num: int
	:rtype: TCollection_AsciiString
") ParamValue;
		const TCollection_AsciiString & ParamValue (const Standard_Integer num);
		%feature("compactdefaultargs") TextValue;
		%feature("autodoc", "	* Returns the content of a Text Parameter (without the quotes). Returns an empty string if the Parameter is not a Text.

	:param num:
	:type num: int
	:rtype: TCollection_AsciiString
") TextValue;
		TCollection_AsciiString TextValue (const Standard_Integer num);
		%feature("compactdefaultargs") ItemValue;
		%feature("autodoc", "	* Returns a Parameter as an Item. Returns a Null Handle if the Parameter is a Text, or if it is defined as Void

	:param num:
	:type num: int
	:rtype: Handle_Standard_Transient
") ItemValue;
		Handle_Standard_Transient ItemValue (const Standard_Integer num);
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	* Specific Destructor (closes the File if not yet done)

	:rtype: None
") Destroy;
		void Destroy ();
};


%extend IFSelect_SessionFile {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IFSelect_ShareOut;
class IFSelect_ShareOut : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") IFSelect_ShareOut;
		%feature("autodoc", "	* Creates an empty ShareOut

	:rtype: None
") IFSelect_ShareOut;
		 IFSelect_ShareOut ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	* Removes in one operation all the Dispatches with their Idents Also clears all informations about Names, and all Results but naming informations which are : - kept if <onlydisp> is True. - cleared if <onlydisp> is False (complete clearing) If <onlydisp> is True, that's all. Else, clears also Modifiers

	:param onlydisp:
	:type onlydisp: bool
	:rtype: None
") Clear;
		void Clear (const Standard_Boolean onlydisp);
		%feature("compactdefaultargs") ClearResult;
		%feature("autodoc", "	* Clears all data produced (apart from Dispatches, etc...) if <alsoname> is True, all is cleared. Else, informations about produced Names are kept (to maintain unicity of naming across clearings)

	:param alsoname:
	:type alsoname: bool
	:rtype: None
") ClearResult;
		void ClearResult (const Standard_Boolean alsoname);
		%feature("compactdefaultargs") RemoveItem;
		%feature("autodoc", "	* Removes an item, which can be, either a Dispatch (removed from the list of Dispatches), or a GeneralModifier (removed from the list of Model Modifiers or from the list of File Modifiers according to its type). Returns True if done, False if has not been found or if it is neither a Dispatch, nor a Modifier.

	:param item:
	:type item: Handle_Standard_Transient &
	:rtype: bool
") RemoveItem;
		Standard_Boolean RemoveItem (const Handle_Standard_Transient & item);
		%feature("compactdefaultargs") LastRun;
		%feature("autodoc", "	* Returns the rank of last run item (ClearResult resets it to 0)

	:rtype: int
") LastRun;
		Standard_Integer LastRun ();
		%feature("compactdefaultargs") SetLastRun;
		%feature("autodoc", "	* Records a new alue for the rank of last run item

	:param last:
	:type last: int
	:rtype: None
") SetLastRun;
		void SetLastRun (const Standard_Integer last);
		%feature("compactdefaultargs") NbDispatches;
		%feature("autodoc", "	* Returns the count of Dispatches

	:rtype: int
") NbDispatches;
		Standard_Integer NbDispatches ();
		%feature("compactdefaultargs") DispatchRank;
		%feature("autodoc", "	* Returns the Rank of a Dispatch, given its Value (Handle). Returns 0 if the Dispatch is unknown in the ShareOut

	:param disp:
	:type disp: Handle_IFSelect_Dispatch &
	:rtype: int
") DispatchRank;
		Standard_Integer DispatchRank (const Handle_IFSelect_Dispatch & disp);
		%feature("compactdefaultargs") Dispatch;
		%feature("autodoc", "	* Returns a Dispatch, given its rank in the list

	:param num:
	:type num: int
	:rtype: Handle_IFSelect_Dispatch
") Dispatch;
		Handle_IFSelect_Dispatch Dispatch (const Standard_Integer num);
		%feature("compactdefaultargs") AddDispatch;
		%feature("autodoc", "	* Adds a Dispatch to the list

	:param disp:
	:type disp: Handle_IFSelect_Dispatch &
	:rtype: None
") AddDispatch;
		void AddDispatch (const Handle_IFSelect_Dispatch & disp);
		%feature("compactdefaultargs") RemoveDispatch;
		%feature("autodoc", "	* Removes a Dispatch, given its rank in the list Returns True if done, False if rank is not between (LastRun + 1) and (NbDispatches)

	:param rank:
	:type rank: int
	:rtype: bool
") RemoveDispatch;
		Standard_Boolean RemoveDispatch (const Standard_Integer rank);
		%feature("compactdefaultargs") AddModifier;
		%feature("autodoc", "	* Sets a Modifier to be applied on all Dispatches to be run If <modifier> is a ModelModifier, adds it to the list of Model Modifiers; else to the list of File Modifiers By default (atnum = 0) at the end of the list, else at <atnum> Each Modifier is used, after each copy of a packet of Entities into a Model : its criteria are checked and if they are OK, the method Perform of this Modifier is run.

	:param modifier:
	:type modifier: Handle_IFSelect_GeneralModifier &
	:param atnum:
	:type atnum: int
	:rtype: None
") AddModifier;
		void AddModifier (const Handle_IFSelect_GeneralModifier & modifier,const Standard_Integer atnum);
		%feature("compactdefaultargs") AddModifier;
		%feature("autodoc", "	* Sets a Modifier to be applied on the Dispatch <dispnum> If <modifier> is a ModelModifier, adds it to the list of Model Modifiers; else to the list of File Modifiers This is the same list as for all Dispatches, but the Modifier is qualified to be applied to one Dispatch only Then, <atnum> refers to the entire list By default (atnum = 0) at the end of the list, else at <atnum> Remark : if the Modifier was already in the list and if <atnum> = 0, the Modifier is not moved, but only qualified for a Dispatch

	:param modifier:
	:type modifier: Handle_IFSelect_GeneralModifier &
	:param dispnum:
	:type dispnum: int
	:param atnum:
	:type atnum: int
	:rtype: None
") AddModifier;
		void AddModifier (const Handle_IFSelect_GeneralModifier & modifier,const Standard_Integer dispnum,const Standard_Integer atnum);
		%feature("compactdefaultargs") AddModif;
		%feature("autodoc", "	* Adds a Modifier to the list of Modifiers : Model Modifiers if <formodel> is True, File Modifiers else (internal).

	:param modifier:
	:type modifier: Handle_IFSelect_GeneralModifier &
	:param formodel:
	:type formodel: bool
	:param atnum: default value is 0
	:type atnum: int
	:rtype: None
") AddModif;
		void AddModif (const Handle_IFSelect_GeneralModifier & modifier,const Standard_Boolean formodel,const Standard_Integer atnum = 0);
		%feature("compactdefaultargs") NbModifiers;
		%feature("autodoc", "	* Returns count of Modifiers (which apply to complete Models) : Model Modifiers if <formodel> is True, File Modifiers else

	:param formodel:
	:type formodel: bool
	:rtype: int
") NbModifiers;
		Standard_Integer NbModifiers (const Standard_Boolean formodel);
		%feature("compactdefaultargs") GeneralModifier;
		%feature("autodoc", "	* Returns a Modifier of the list, given its rank : Model Modifiers if <formodel> is True, File Modifiers else

	:param formodel:
	:type formodel: bool
	:param num:
	:type num: int
	:rtype: Handle_IFSelect_GeneralModifier
") GeneralModifier;
		Handle_IFSelect_GeneralModifier GeneralModifier (const Standard_Boolean formodel,const Standard_Integer num);
		%feature("compactdefaultargs") ModelModifier;
		%feature("autodoc", "	* Returns a Modifier of the list of Model Modifiers, duely casted

	:param num:
	:type num: int
	:rtype: Handle_IFSelect_Modifier
") ModelModifier;
		Handle_IFSelect_Modifier ModelModifier (const Standard_Integer num);
		%feature("compactdefaultargs") ModifierRank;
		%feature("autodoc", "	* Gives the rank of a Modifier in the list, 0 if not in the list Model Modifiers if <modifier> is kind of ModelModifer, File Modifiers else

	:param modifier:
	:type modifier: Handle_IFSelect_GeneralModifier &
	:rtype: int
") ModifierRank;
		Standard_Integer ModifierRank (const Handle_IFSelect_GeneralModifier & modifier);
		%feature("compactdefaultargs") RemoveModifier;
		%feature("autodoc", "	* Removes a Modifier, given it rank in the list : Model Modifiers if <formodel> is True, File Modifiers else Returns True if done, False if <num> is out of range

	:param formodel:
	:type formodel: bool
	:param num:
	:type num: int
	:rtype: bool
") RemoveModifier;
		Standard_Boolean RemoveModifier (const Standard_Boolean formodel,const Standard_Integer num);
		%feature("compactdefaultargs") ChangeModifierRank;
		%feature("autodoc", "	* Changes the rank of a modifier in the list : Model Modifiers if <formodel> is True, File Modifiers else from <before> to <after> Returns True if done, False else (before or after out of range)

	:param formodel:
	:type formodel: bool
	:param befor:
	:type befor: int
	:param after:
	:type after: int
	:rtype: bool
") ChangeModifierRank;
		Standard_Boolean ChangeModifierRank (const Standard_Boolean formodel,const Standard_Integer befor,const Standard_Integer after);
		%feature("compactdefaultargs") SetRootName;
		%feature("autodoc", "	* Attaches a Root Name to a Dispatch given its rank, as an HAsciiString (standard form). A Null Handle resets this name. Returns True if OK, False if this Name is already attached, for a Dispatch or for Default, or <num> out of range

	:param num:
	:type num: int
	:param name:
	:type name: Handle_TCollection_HAsciiString &
	:rtype: bool
") SetRootName;
		Standard_Boolean SetRootName (const Standard_Integer num,const Handle_TCollection_HAsciiString & name);
		%feature("compactdefaultargs") HasRootName;
		%feature("autodoc", "	* Returns True if the Dispatch of rank <num> has an attached Root Name. False else, or if num is out of range

	:param num:
	:type num: int
	:rtype: bool
") HasRootName;
		Standard_Boolean HasRootName (const Standard_Integer num);
		%feature("compactdefaultargs") RootName;
		%feature("autodoc", "	* Returns the Root bound to a Dispatch, given its rank Returns a Null Handle if not defined

	:param num:
	:type num: int
	:rtype: Handle_TCollection_HAsciiString
") RootName;
		Handle_TCollection_HAsciiString RootName (const Standard_Integer num);
		%feature("compactdefaultargs") RootNumber;
		%feature("autodoc", "	* Returns an integer value about a given root name : - positive : it's the rank of the Dispatch which has this name - null : this root name is unknown - negative (-1) : this root name is the default root name

	:param name:
	:type name: Handle_TCollection_HAsciiString &
	:rtype: int
") RootNumber;
		Standard_Integer RootNumber (const Handle_TCollection_HAsciiString & name);
		%feature("compactdefaultargs") SetPrefix;
		%feature("autodoc", "	* Defines or Changes the general Prefix (which is prepended to complete file name generated). If this method is not call, Prefix remains empty

	:param pref:
	:type pref: Handle_TCollection_HAsciiString &
	:rtype: None
") SetPrefix;
		void SetPrefix (const Handle_TCollection_HAsciiString & pref);
		%feature("compactdefaultargs") SetDefaultRootName;
		%feature("autodoc", "	* Defines or Changes the Default Root Name to a new value (which is used for dispatches which have no attached root name). If this method is not called, DefaultRootName remains empty Returns True if OK, False if this Name is already attached, for a Dispatch or for Default

	:param defrt:
	:type defrt: Handle_TCollection_HAsciiString &
	:rtype: bool
") SetDefaultRootName;
		Standard_Boolean SetDefaultRootName (const Handle_TCollection_HAsciiString & defrt);
		%feature("compactdefaultargs") SetExtension;
		%feature("autodoc", "	* Defines or Changes the general Extension (which is appended to complete file name generated). If this method is not call, Extension remains empty

	:param ext:
	:type ext: Handle_TCollection_HAsciiString &
	:rtype: None
") SetExtension;
		void SetExtension (const Handle_TCollection_HAsciiString & ext);
		%feature("compactdefaultargs") Prefix;
		%feature("autodoc", "	* Returns the general Prefix. Can be empty.

	:rtype: Handle_TCollection_HAsciiString
") Prefix;
		Handle_TCollection_HAsciiString Prefix ();
		%feature("compactdefaultargs") DefaultRootName;
		%feature("autodoc", "	* Returns the Default Root Name. Can be empty.

	:rtype: Handle_TCollection_HAsciiString
") DefaultRootName;
		Handle_TCollection_HAsciiString DefaultRootName ();
		%feature("compactdefaultargs") Extension;
		%feature("autodoc", "	* Returns the general Extension. Can be empty (not recommanded)

	:rtype: Handle_TCollection_HAsciiString
") Extension;
		Handle_TCollection_HAsciiString Extension ();
		%feature("compactdefaultargs") FileName;
		%feature("autodoc", "	* Computes the complete file name for a Packet of a Dispatch, given Dispatch Number (Rank), Packet Number, and Count of Packets generated by this Dispatch (0 if unknown) //! File Name is made of following strings, concatenated : General Prefix, Root Name for Dispatch, Packet Suffix, and General Extension. If no Root Name is specified for a Dispatch, DefaultRootName is considered (and pnum is not used, but <thenbdefs> is incremented and used Error if no Root is defined for this <idnum>

	:param dnum:
	:type dnum: int
	:param pnum:
	:type pnum: int
	:param nbpack: default value is 0
	:type nbpack: int
	:rtype: TCollection_AsciiString
") FileName;
		TCollection_AsciiString FileName (const Standard_Integer dnum,const Standard_Integer pnum,const Standard_Integer nbpack = 0);
};


%extend IFSelect_ShareOut {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_IFSelect_ShareOut(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_IFSelect_ShareOut::Handle_IFSelect_ShareOut %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_IFSelect_ShareOut;
class Handle_IFSelect_ShareOut : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_IFSelect_ShareOut();
        Handle_IFSelect_ShareOut(const Handle_IFSelect_ShareOut &aHandle);
        Handle_IFSelect_ShareOut(const IFSelect_ShareOut *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_IFSelect_ShareOut DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_IFSelect_ShareOut {
    IFSelect_ShareOut* _get_reference() {
    return (IFSelect_ShareOut*)$self->Access();
    }
};

%extend Handle_IFSelect_ShareOut {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend IFSelect_ShareOut {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IFSelect_ShareOutResult;
class IFSelect_ShareOutResult {
	public:
		%feature("compactdefaultargs") IFSelect_ShareOutResult;
		%feature("autodoc", "	* Creates a ShareOutResult from a ShareOut, to work on a Model (without any more precision; uses Active Protocol)

	:param sho:
	:type sho: Handle_IFSelect_ShareOut &
	:param mod:
	:type mod: Handle_Interface_InterfaceModel &
	:rtype: None
") IFSelect_ShareOutResult;
		 IFSelect_ShareOutResult (const Handle_IFSelect_ShareOut & sho,const Handle_Interface_InterfaceModel & mod);
		%feature("compactdefaultargs") IFSelect_ShareOutResult;
		%feature("autodoc", "	* Creates a ShareOutResult from a ShareOut, to work on a Graph already computed, which defines the Input Model and can specialize some Entities

	:param sho:
	:type sho: Handle_IFSelect_ShareOut &
	:param G:
	:type G: Interface_Graph &
	:rtype: None
") IFSelect_ShareOutResult;
		 IFSelect_ShareOutResult (const Handle_IFSelect_ShareOut & sho,const Interface_Graph & G);
		%feature("compactdefaultargs") IFSelect_ShareOutResult;
		%feature("autodoc", "	* Creates a ShareOutResult from a unique Dispatch, to work on a Model. As if it was a ShareOut with only one Dispatch (without any more precision; uses Active Protocol) Allows to compute the effect of a single Dispatch

	:param disp:
	:type disp: Handle_IFSelect_Dispatch &
	:param mod:
	:type mod: Handle_Interface_InterfaceModel &
	:rtype: None
") IFSelect_ShareOutResult;
		 IFSelect_ShareOutResult (const Handle_IFSelect_Dispatch & disp,const Handle_Interface_InterfaceModel & mod);
		%feature("compactdefaultargs") IFSelect_ShareOutResult;
		%feature("autodoc", "	* Creates a ShareOutResult from a unique Dispatch, to work on a Graph. As if it was a ShareOut with only one Dispatch Allows to compute the effect of a single Dispatch

	:param disp:
	:type disp: Handle_IFSelect_Dispatch &
	:param G:
	:type G: Interface_Graph &
	:rtype: None
") IFSelect_ShareOutResult;
		 IFSelect_ShareOutResult (const Handle_IFSelect_Dispatch & disp,const Interface_Graph & G);
		%feature("compactdefaultargs") ShareOut;
		%feature("autodoc", "	* Returns the ShareOut used to create the ShareOutResult if creation from a Dispatch, returns a Null Handle

	:rtype: Handle_IFSelect_ShareOut
") ShareOut;
		Handle_IFSelect_ShareOut ShareOut ();
		%feature("compactdefaultargs") Graph;
		%feature("autodoc", "	* Returns the Graph used to create theShareOutResult

	:rtype: Interface_Graph
") Graph;
		const Interface_Graph & Graph ();
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", "	* Erases computed data, in order to command a new Evaluation

	:rtype: None
") Reset;
		void Reset ();
		%feature("compactdefaultargs") Evaluate;
		%feature("autodoc", "	* Evaluates the result of a ShareOut : determines Entities to be forgotten by the ShareOut, Entities to be transferred several times (duplicated), prepares an iteration on the packets to be produced Called the first time anyone question is asked, or after a call to Reset. Works by calling the method Prepare.

	:rtype: None
") Evaluate;
		void Evaluate ();
		%feature("compactdefaultargs") Packets;
		%feature("autodoc", "	* Returns the list of recorded Packets, under two modes : - <complete> = False, the strict definition of Packets, i.e. for each one, the Root Entities, to be explicitely sent - <complete> = True (Default), the completely evaluated list, i.e. which really gives the destination of each entity : this mode allows to evaluate duplications Remark that to send packets, iteration remains preferable (file names are managed)

	:param complete: default value is Standard_True
	:type complete: bool
	:rtype: Handle_IFSelect_PacketList
") Packets;
		Handle_IFSelect_PacketList Packets (const Standard_Boolean complete = Standard_True);
		%feature("compactdefaultargs") NbPackets;
		%feature("autodoc", "	* Returns the total count of produced non empty packets (in out : calls Evaluate as necessary)

	:rtype: int
") NbPackets;
		Standard_Integer NbPackets ();
		%feature("compactdefaultargs") Prepare;
		%feature("autodoc", "	* Prepares the iteration on the packets This method is called by Evaluate, but can be called anytime The iteration consists in taking each Dispatch of the ShareOut beginning by the first one, compute its packets, then iterate on these packets. Once all these packets are iterated, the iteration passes to the next Dispatch, or stops. For a creation from a unique Dispatch, same but with only this Dispatch. Each packet can be listed, or really transferred (producing a derived Model, from which a file can be generated) //! Prepare sets the iteration to the first Dispatch, first Packet

	:rtype: None
") Prepare;
		void Prepare ();
		%feature("compactdefaultargs") More;
		%feature("autodoc", "	* Returns True if there is more packets in the current Dispatch, else if there is more Dispatch in the ShareOut

	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "	* Passes to the next Packet in the current Dispatch, or if there is none, to the next Dispatch in the ShareOut

	:rtype: None
") Next;
		void Next ();
		%feature("compactdefaultargs") NextDispatch;
		%feature("autodoc", "	* Passes to the next Dispatch, regardless about remaining packets

	:rtype: None
") NextDispatch;
		void NextDispatch ();
		%feature("compactdefaultargs") Dispatch;
		%feature("autodoc", "	* Returns the current Dispatch

	:rtype: Handle_IFSelect_Dispatch
") Dispatch;
		Handle_IFSelect_Dispatch Dispatch ();
		%feature("compactdefaultargs") DispatchRank;
		%feature("autodoc", "	* Returns the Rank of the current Dispatch in the ShareOut Returns Zero if there is none (iteration finished)

	:rtype: int
") DispatchRank;
		Standard_Integer DispatchRank ();
		%feature("compactdefaultargs") PacketsInDispatch;
		%feature("autodoc", "	* Returns Number (rank) of current Packet in current Dispatch, and total count of Packets in current Dispatch, as arguments

	:param numpack:
	:type numpack: int &
	:param nbpacks:
	:type nbpacks: int &
	:rtype: None
") PacketsInDispatch;
		void PacketsInDispatch (Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("compactdefaultargs") PacketRoot;
		%feature("autodoc", "	* Returns the list of Roots of the current Packet (never empty) (i.e. the Entities to be themselves asked for transfer) Error if there is none (iteration finished)

	:rtype: Interface_EntityIterator
") PacketRoot;
		Interface_EntityIterator PacketRoot ();
		%feature("compactdefaultargs") PacketContent;
		%feature("autodoc", "	* Returns the complete content of the current Packet (i.e. with shared entities, which will also be put in the file)

	:rtype: Interface_EntityIterator
") PacketContent;
		Interface_EntityIterator PacketContent ();
		%feature("compactdefaultargs") FileName;
		%feature("autodoc", "	* Returns the File Name which corresponds to current Packet (computed by ShareOut) If current Packet has no associated name (see ShareOut), the returned value is Null

	:rtype: TCollection_AsciiString
") FileName;
		TCollection_AsciiString FileName ();
};


%extend IFSelect_ShareOutResult {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IFSelect_Signature;
class IFSelect_Signature : public Interface_SignType {
	public:
		%feature("compactdefaultargs") SetIntCase;
		%feature("autodoc", "	* Sets the information data to tell 'integer cases' with possible min and max values To be called when creating

	:param hasmin:
	:type hasmin: bool
	:param valmin:
	:type valmin: int
	:param hasmax:
	:type hasmax: bool
	:param valmax:
	:type valmax: int
	:rtype: None
") SetIntCase;
		void SetIntCase (const Standard_Boolean hasmin,const Standard_Integer valmin,const Standard_Boolean hasmax,const Standard_Integer valmax);
		%feature("compactdefaultargs") IsIntCase;
		%feature("autodoc", "	* Tells if this Signature gives integer values and returns values from SetIntCase if True

	:param hasmin:
	:type hasmin: bool
	:param valmin:
	:type valmin: int &
	:param hasmax:
	:type hasmax: bool
	:param valmax:
	:type valmax: int &
	:rtype: bool
") IsIntCase;
		Standard_Boolean IsIntCase (Standard_Boolean &OutValue,Standard_Integer &OutValue,Standard_Boolean &OutValue,Standard_Integer &OutValue);
		%feature("compactdefaultargs") AddCase;
		%feature("autodoc", "	* Adds a possible case To be called when creating, IF the list of possible cases for Value is known when starting For instance, for CDL types, rather do not fill this, but for a specific enumeration (such as a status), can be used

	:param acase:
	:type acase: char *
	:rtype: None
") AddCase;
		void AddCase (const char * acase);
		%feature("compactdefaultargs") CaseList;
		%feature("autodoc", "	* Returns the predefined list of possible cases, filled by AddCase Null Handle if no predefined list (hence, to be counted) Useful to filter on really possible vase, for instance, or for a help

	:rtype: Handle_TColStd_HSequenceOfAsciiString
") CaseList;
		Handle_TColStd_HSequenceOfAsciiString CaseList ();
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "	* Returns an identification of the Signature (a word), given at initialization time Returns the Signature for a Transient object. It is specific of each sub-class of Signature. For a Null Handle, it should provide '' It can work with the model which contains the entity

	:rtype: char *
") Name;
		const char * Name ();
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "	* The label of a Signature uses its name as follow : 'Signature : <name>'

	:rtype: TCollection_AsciiString
") Label;
		TCollection_AsciiString Label ();
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "	* Tells if the value for <ent> in <model> matches a text, with a criterium <exact>. The default definition calls MatchValue Can be redefined

	:param ent:
	:type ent: Handle_Standard_Transient &
	:param model:
	:type model: Handle_Interface_InterfaceModel &
	:param text:
	:type text: TCollection_AsciiString &
	:param exact:
	:type exact: bool
	:rtype: bool
") Matches;
		virtual Standard_Boolean Matches (const Handle_Standard_Transient & ent,const Handle_Interface_InterfaceModel & model,const TCollection_AsciiString & text,const Standard_Boolean exact);
		%feature("compactdefaultargs") MatchValue;
		%feature("autodoc", "	* Default procedure to tell if a value <val> matches a text with a criterium <exact>. <exact> = True requires equality, else only contained (no reg-exp)

	:param val:
	:type val: char *
	:param text:
	:type text: TCollection_AsciiString &
	:param exact:
	:type exact: bool
	:rtype: bool
") MatchValue;
		static Standard_Boolean MatchValue (const char * val,const TCollection_AsciiString & text,const Standard_Boolean exact);
		%feature("compactdefaultargs") IntValue;
		%feature("autodoc", "	* This procedure converts an Integer to a CString It is a convenient way when the value of a signature has the form of a simple integer value The value is to be used immediately (one buffer only, no copy)

	:param val:
	:type val: int
	:rtype: char *
") IntValue;
		static const char * IntValue (const Standard_Integer val);
};


%extend IFSelect_Signature {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_IFSelect_Signature(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_IFSelect_Signature::Handle_IFSelect_Signature %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_IFSelect_Signature;
class Handle_IFSelect_Signature : public Handle_Interface_SignType {

    public:
        // constructors
        Handle_IFSelect_Signature();
        Handle_IFSelect_Signature(const Handle_IFSelect_Signature &aHandle);
        Handle_IFSelect_Signature(const IFSelect_Signature *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_IFSelect_Signature DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_IFSelect_Signature {
    IFSelect_Signature* _get_reference() {
    return (IFSelect_Signature*)$self->Access();
    }
};

%extend Handle_IFSelect_Signature {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend IFSelect_Signature {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IFSelect_SignatureList;
class IFSelect_SignatureList : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") IFSelect_SignatureList;
		%feature("autodoc", "	* Creates a SignatureList. If <withlist> is True, entities will be not only counted per signature, but also listed.

	:param withlist: default value is Standard_False
	:type withlist: bool
	:rtype: None
") IFSelect_SignatureList;
		 IFSelect_SignatureList (const Standard_Boolean withlist = Standard_False);
		%feature("compactdefaultargs") SetList;
		%feature("autodoc", "	* Changes the record-list status. The list is not cleared but its use changes

	:param withlist:
	:type withlist: bool
	:rtype: None
") SetList;
		void SetList (const Standard_Boolean withlist);

            %feature("autodoc","1");
            %extend {
                Standard_Boolean GetModeSignOnly() {
                return (Standard_Boolean) $self->ModeSignOnly();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetModeSignOnly(Standard_Boolean value ) {
                $self->ModeSignOnly()=value;
                }
            };
            		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: void
") Clear;
		virtual void Clear ();
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* Adds an entity with its signature, i.e. : - counts an item more for <sign> - if record-list status is set, records the entity Accepts a null entity (the signature is then for the global model). But if the string is empty, counts a Null item. //! If SignOnly Mode is set, this work is replaced by just setting LastValue

	:param ent:
	:type ent: Handle_Standard_Transient &
	:param sign:
	:type sign: char *
	:rtype: None
") Add;
		void Add (const Handle_Standard_Transient & ent,const char * sign);
		%feature("compactdefaultargs") LastValue;
		%feature("autodoc", "	* Returns the last value recorded by Add (only if SignMode set) Cleared by Clear or Init

	:rtype: char *
") LastValue;
		const char * LastValue ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Aknowledges the list in once. Name identifies the Signature

	:param name:
	:type name: char *
	:param count:
	:type count: Handle_Dico_DictionaryOfInteger &
	:param list:
	:type list: Handle_Dico_DictionaryOfTransient &
	:param nbnuls:
	:type nbnuls: int
	:rtype: None
") Init;
		void Init (const char * name,const Handle_Dico_DictionaryOfInteger & count,const Handle_Dico_DictionaryOfTransient & list,const Standard_Integer nbnuls);
		%feature("compactdefaultargs") List;
		%feature("autodoc", "	* Returns the list of signatures, as a sequence of strings (but without their respective counts). It is ordered. By default, for all the signatures. If <root> is given non empty, for the signatures which begin by <root>

	:param root: default value is ""
	:type root: char *
	:rtype: Handle_TColStd_HSequenceOfHAsciiString
") List;
		Handle_TColStd_HSequenceOfHAsciiString List (const char * root = "");
		%feature("compactdefaultargs") HasEntities;
		%feature("autodoc", "	* Returns True if the list of Entities is aknowledged, else the method Entities will always return a Null Handle

	:rtype: bool
") HasEntities;
		Standard_Boolean HasEntities ();
		%feature("compactdefaultargs") NbNulls;
		%feature("autodoc", "	* Returns the count of null entities

	:rtype: int
") NbNulls;
		Standard_Integer NbNulls ();
		%feature("compactdefaultargs") NbTimes;
		%feature("autodoc", "	* Returns the number of times a signature was counted, 0 if it has not been recorded at all

	:param sign:
	:type sign: char *
	:rtype: int
") NbTimes;
		Standard_Integer NbTimes (const char * sign);
		%feature("compactdefaultargs") Entities;
		%feature("autodoc", "	* Returns the list of entities attached to a signature It is empty if <sign> has not been recorded It is a Null Handle if the list of entities is not known

	:param sign:
	:type sign: char *
	:rtype: Handle_TColStd_HSequenceOfTransient
") Entities;
		Handle_TColStd_HSequenceOfTransient Entities (const char * sign);
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "	* Defines a name for a SignatureList (used to print it)

	:param name:
	:type name: char *
	:rtype: None
") SetName;
		void SetName (const char * name);
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "	* Returns the recorded Name. Remark : default is '...' (no SetName called)

	:rtype: char *
") Name;
		virtual const char * Name ();
		%feature("compactdefaultargs") PrintCount;
		%feature("autodoc", "	* Prints the counts of items (not the list)

	:param S:
	:type S: Handle_Message_Messenger &
	:rtype: void
") PrintCount;
		virtual void PrintCount (const Handle_Message_Messenger & S);
		%feature("compactdefaultargs") PrintList;
		%feature("autodoc", "	* Prints the lists of items, if they are present (else, prints a message 'no list available') Uses <model> to determine for each entity to be listed, its number, and its specific identifier (by PrintLabel) <mod> gives a mode for printing : - CountByItem : just count (as PrintCount) - ShortByItem : minimum i.e. count plus 5 first entity numbers - ShortByItem(D) complete list of entity numbers (0: 'Global') - EntitiesByItem : list of (entity number/PrintLabel from the model) other modes are ignored

	:param S:
	:type S: Handle_Message_Messenger &
	:param model:
	:type model: Handle_Interface_InterfaceModel &
	:param mod: default value is IFSelect_ListByItem
	:type mod: IFSelect_PrintCount
	:rtype: void
") PrintList;
		virtual void PrintList (const Handle_Message_Messenger & S,const Handle_Interface_InterfaceModel & model,const IFSelect_PrintCount mod = IFSelect_ListByItem);
		%feature("compactdefaultargs") PrintSum;
		%feature("autodoc", "	* Prints a summary Item which has the greatest count of entities For items which are numeric values : their count, maximum, minimum values, cumul, average

	:param S:
	:type S: Handle_Message_Messenger &
	:rtype: void
") PrintSum;
		virtual void PrintSum (const Handle_Message_Messenger & S);
};


%extend IFSelect_SignatureList {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_IFSelect_SignatureList(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_IFSelect_SignatureList::Handle_IFSelect_SignatureList %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_IFSelect_SignatureList;
class Handle_IFSelect_SignatureList : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_IFSelect_SignatureList();
        Handle_IFSelect_SignatureList(const Handle_IFSelect_SignatureList &aHandle);
        Handle_IFSelect_SignatureList(const IFSelect_SignatureList *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_IFSelect_SignatureList DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_IFSelect_SignatureList {
    IFSelect_SignatureList* _get_reference() {
    return (IFSelect_SignatureList*)$self->Access();
    }
};

%extend Handle_IFSelect_SignatureList {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend IFSelect_SignatureList {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IFSelect_TSeqOfDispatch;
class IFSelect_TSeqOfDispatch : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") IFSelect_TSeqOfDispatch;
		%feature("autodoc", "	:rtype: None
") IFSelect_TSeqOfDispatch;
		 IFSelect_TSeqOfDispatch ();
		%feature("compactdefaultargs") IFSelect_TSeqOfDispatch;
		%feature("autodoc", "	:param Other:
	:type Other: IFSelect_TSeqOfDispatch &
	:rtype: None
") IFSelect_TSeqOfDispatch;
		 IFSelect_TSeqOfDispatch (const IFSelect_TSeqOfDispatch & Other);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: IFSelect_TSeqOfDispatch &
	:rtype: IFSelect_TSeqOfDispatch
") Assign;
		const IFSelect_TSeqOfDispatch & Assign (const IFSelect_TSeqOfDispatch & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: IFSelect_TSeqOfDispatch &
	:rtype: IFSelect_TSeqOfDispatch
") operator =;
		const IFSelect_TSeqOfDispatch & operator = (const IFSelect_TSeqOfDispatch & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: Handle_IFSelect_Dispatch &
	:rtype: None
") Append;
		void Append (const Handle_IFSelect_Dispatch & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: IFSelect_TSeqOfDispatch &
	:rtype: None
") Append;
		void Append (IFSelect_TSeqOfDispatch & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: Handle_IFSelect_Dispatch &
	:rtype: None
") Prepend;
		void Prepend (const Handle_IFSelect_Dispatch & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: IFSelect_TSeqOfDispatch &
	:rtype: None
") Prepend;
		void Prepend (IFSelect_TSeqOfDispatch & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_IFSelect_Dispatch &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_IFSelect_Dispatch & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: IFSelect_TSeqOfDispatch &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,IFSelect_TSeqOfDispatch & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_IFSelect_Dispatch &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_IFSelect_Dispatch & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: IFSelect_TSeqOfDispatch &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,IFSelect_TSeqOfDispatch & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: Handle_IFSelect_Dispatch
") First;
		Handle_IFSelect_Dispatch First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: Handle_IFSelect_Dispatch
") Last;
		Handle_IFSelect_Dispatch Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: IFSelect_TSeqOfDispatch &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,IFSelect_TSeqOfDispatch & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_IFSelect_Dispatch
") Value;
		Handle_IFSelect_Dispatch Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: Handle_IFSelect_Dispatch &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_IFSelect_Dispatch & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_IFSelect_Dispatch
") ChangeValue;
		Handle_IFSelect_Dispatch ChangeValue (const Standard_Integer Index);
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


%extend IFSelect_TSeqOfDispatch {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IFSelect_TSeqOfSelection;
class IFSelect_TSeqOfSelection : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") IFSelect_TSeqOfSelection;
		%feature("autodoc", "	:rtype: None
") IFSelect_TSeqOfSelection;
		 IFSelect_TSeqOfSelection ();
		%feature("compactdefaultargs") IFSelect_TSeqOfSelection;
		%feature("autodoc", "	:param Other:
	:type Other: IFSelect_TSeqOfSelection &
	:rtype: None
") IFSelect_TSeqOfSelection;
		 IFSelect_TSeqOfSelection (const IFSelect_TSeqOfSelection & Other);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: IFSelect_TSeqOfSelection &
	:rtype: IFSelect_TSeqOfSelection
") Assign;
		const IFSelect_TSeqOfSelection & Assign (const IFSelect_TSeqOfSelection & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: IFSelect_TSeqOfSelection &
	:rtype: IFSelect_TSeqOfSelection
") operator =;
		const IFSelect_TSeqOfSelection & operator = (const IFSelect_TSeqOfSelection & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: Handle_IFSelect_Selection &
	:rtype: None
") Append;
		void Append (const Handle_IFSelect_Selection & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: IFSelect_TSeqOfSelection &
	:rtype: None
") Append;
		void Append (IFSelect_TSeqOfSelection & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: Handle_IFSelect_Selection &
	:rtype: None
") Prepend;
		void Prepend (const Handle_IFSelect_Selection & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: IFSelect_TSeqOfSelection &
	:rtype: None
") Prepend;
		void Prepend (IFSelect_TSeqOfSelection & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_IFSelect_Selection &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_IFSelect_Selection & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: IFSelect_TSeqOfSelection &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,IFSelect_TSeqOfSelection & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_IFSelect_Selection &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_IFSelect_Selection & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: IFSelect_TSeqOfSelection &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,IFSelect_TSeqOfSelection & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: Handle_IFSelect_Selection
") First;
		Handle_IFSelect_Selection First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: Handle_IFSelect_Selection
") Last;
		Handle_IFSelect_Selection Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: IFSelect_TSeqOfSelection &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,IFSelect_TSeqOfSelection & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_IFSelect_Selection
") Value;
		Handle_IFSelect_Selection Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: Handle_IFSelect_Selection &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_IFSelect_Selection & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_IFSelect_Selection
") ChangeValue;
		Handle_IFSelect_Selection ChangeValue (const Standard_Integer Index);
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


%extend IFSelect_TSeqOfSelection {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IFSelect_Transformer;
class IFSelect_Transformer : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Performs a Transformation (defined by each sub-class) : <G> gives the input data (especially the starting model) and can be used for queries (by Selections, etc...) <protocol> allows to work with General Services as necessary (it applies to input data) If the change corresponds to a conversion to a new protocol, see also the method ChangeProtocol <checks> stores produced checks messages if any <newmod> gives the result of the transformation : - if it is Null (i.e. has not been affected), the transformation has been made on the spot, it is assumed to cause no change to the graph of dependances - if it equates the starting Model, it has been transformed on the spot (possibiliy some entities were replaced inside it) - if it is new, it corresponds to a new data set which replaces the starting one //! <self> is mutable to allow results for ChangeProtocol to be memorized if needed, and to store informations useful for the method Updated //! Returns True if Done, False if an Error occured : in this case, if a new data set has been produced, the transformation is ignored, else data may be corrupted.

	:param G:
	:type G: Interface_Graph &
	:param protocol:
	:type protocol: Handle_Interface_Protocol &
	:param checks:
	:type checks: Interface_CheckIterator &
	:param newmod:
	:type newmod: Handle_Interface_InterfaceModel &
	:rtype: bool
") Perform;
		virtual Standard_Boolean Perform (const Interface_Graph & G,const Handle_Interface_Protocol & protocol,Interface_CheckIterator & checks,Handle_Interface_InterfaceModel & newmod);
		%feature("compactdefaultargs") ChangeProtocol;
		%feature("autodoc", "	* This methods allows to declare that the Protocol applied to the new Model has changed. It applies to the last call to Perform. //! Returns True if the Protocol has changed, False else. The provided default keeps the starting Protocol. This method should be redefined as required by the effect of Perform.

	:param newproto:
	:type newproto: Handle_Interface_Protocol &
	:rtype: bool
") ChangeProtocol;
		virtual Standard_Boolean ChangeProtocol (Handle_Interface_Protocol & newproto);
		%feature("compactdefaultargs") Updated;
		%feature("autodoc", "	* This method allows to know what happened to a starting entity after the last Perform. If <entfrom> (from starting model) has one and only one known item which corresponds in the new produced model, this method must return True and fill the argument <entto>. Else, it returns False.

	:param entfrom:
	:type entfrom: Handle_Standard_Transient &
	:param entto:
	:type entto: Handle_Standard_Transient &
	:rtype: bool
") Updated;
		virtual Standard_Boolean Updated (const Handle_Standard_Transient & entfrom,Handle_Standard_Transient & entto);
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "	* Returns a text which defines the way a Transformer works (to identify the transformation it performs)

	:rtype: TCollection_AsciiString
") Label;
		virtual TCollection_AsciiString Label ();
};


%extend IFSelect_Transformer {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_IFSelect_Transformer(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_IFSelect_Transformer::Handle_IFSelect_Transformer %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_IFSelect_Transformer;
class Handle_IFSelect_Transformer : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_IFSelect_Transformer();
        Handle_IFSelect_Transformer(const Handle_IFSelect_Transformer &aHandle);
        Handle_IFSelect_Transformer(const IFSelect_Transformer *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_IFSelect_Transformer DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_IFSelect_Transformer {
    IFSelect_Transformer* _get_reference() {
    return (IFSelect_Transformer*)$self->Access();
    }
};

%extend Handle_IFSelect_Transformer {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend IFSelect_Transformer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IFSelect_WorkLibrary;
class IFSelect_WorkLibrary : public Standard_Transient {
	public:
		%feature("compactdefaultargs") ReadFile;
		%feature("autodoc", "	* Gives the way to Read a File and transfer it to a Model <mod> is the resulting Model, which has to be created by this method. In case of error, <mod> must be returned Null Return value is a status with free values. Simply, 0 is for 'Execution OK' The Protocol can be used to work (e.g. create the Model, read and recognize the Entities)

	:param name:
	:type name: char *
	:param model:
	:type model: Handle_Interface_InterfaceModel &
	:param protocol:
	:type protocol: Handle_Interface_Protocol &
	:rtype: int
") ReadFile;
		virtual Standard_Integer ReadFile (const char * name,Handle_Interface_InterfaceModel & model,const Handle_Interface_Protocol & protocol);
		%feature("compactdefaultargs") WriteFile;
		%feature("autodoc", "	* Gives the way to Write a File from a Model. <ctx> contains all necessary informations : the model, the protocol, the file name, and the list of File Modifiers to be applied, also with restricted list of selected entities for each one, if required. In return, it brings the produced check-list //! The WorkLibrary has to query <applied> to get then run the ContextWrite by looping like this (example) : for (numap = 1; numap <= ctx.NbModifiers(); numap ++) { ctx.SetModifier (numap); cast ctx.FileModifier() to specific type -> variable filemod if (!filemod.IsNull()) filemod->Perform (ctx,writer); filemod then works with ctx. It can, either act on the model itself (for instance on its header), or iterate on selected entities (Start/Next/More/Value) it can call AddFail or AddWarning, as necessary }

	:param ctx:
	:type ctx: IFSelect_ContextWrite &
	:rtype: bool
") WriteFile;
		virtual Standard_Boolean WriteFile (IFSelect_ContextWrite & ctx);
		%feature("compactdefaultargs") CopyModel;
		%feature("autodoc", "	* Performs the copy of entities from an original model to a new one. It must also copy headers if any. Returns True when done. The provided default works by copying the individual entities designated in the list, by using the general service class CopyTool. It can be redefined for a norm which, either implements Copy by another way (do not forget to Bind each copied result with its original entity in TC) and returns True, or does not know how to copy and returns False

	:param original:
	:type original: Handle_Interface_InterfaceModel &
	:param newmodel:
	:type newmodel: Handle_Interface_InterfaceModel &
	:param list:
	:type list: Interface_EntityIterator &
	:param TC:
	:type TC: Interface_CopyTool &
	:rtype: bool
") CopyModel;
		virtual Standard_Boolean CopyModel (const Handle_Interface_InterfaceModel & original,const Handle_Interface_InterfaceModel & newmodel,const Interface_EntityIterator & list,Interface_CopyTool & TC);
		%feature("compactdefaultargs") DumpEntity;
		%feature("autodoc", "	* Gives the way of dumping an entity under a form comprehensive for each norm. <model> helps to identify, number ... entities. <level> is to be interpreted for each norm (because of the formats which can be very different)

	:param model:
	:type model: Handle_Interface_InterfaceModel &
	:param protocol:
	:type protocol: Handle_Interface_Protocol &
	:param entity:
	:type entity: Handle_Standard_Transient &
	:param S:
	:type S: Handle_Message_Messenger &
	:param level:
	:type level: int
	:rtype: void
") DumpEntity;
		virtual void DumpEntity (const Handle_Interface_InterfaceModel & model,const Handle_Interface_Protocol & protocol,const Handle_Standard_Transient & entity,const Handle_Message_Messenger & S,const Standard_Integer level);
		%feature("compactdefaultargs") DumpEntity;
		%feature("autodoc", "	* Calls deferred DumpEntity with the recorded default level

	:param model:
	:type model: Handle_Interface_InterfaceModel &
	:param protocol:
	:type protocol: Handle_Interface_Protocol &
	:param entity:
	:type entity: Handle_Standard_Transient &
	:param S:
	:type S: Handle_Message_Messenger &
	:rtype: None
") DumpEntity;
		void DumpEntity (const Handle_Interface_InterfaceModel & model,const Handle_Interface_Protocol & protocol,const Handle_Standard_Transient & entity,const Handle_Message_Messenger & S);
		%feature("compactdefaultargs") SetDumpLevels;
		%feature("autodoc", "	* Records a default level and a maximum value for level level for DumpEntity can go between 0 and <max> default value will be <def>

	:param def:
	:type def: int
	:param max:
	:type max: int
	:rtype: None
") SetDumpLevels;
		void SetDumpLevels (const Standard_Integer def,const Standard_Integer max);
		%feature("compactdefaultargs") DumpLevels;
		%feature("autodoc", "	* Returns the recorded default and maximum dump levels If none was recorded, max is returned negative, def as zero

	:param def:
	:type def: int &
	:param max:
	:type max: int &
	:rtype: None
") DumpLevels;
		void DumpLevels (Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("compactdefaultargs") SetDumpHelp;
		%feature("autodoc", "	* Records a short line of help for a level (0 - max)

	:param level:
	:type level: int
	:param help:
	:type help: char *
	:rtype: None
") SetDumpHelp;
		void SetDumpHelp (const Standard_Integer level,const char * help);
		%feature("compactdefaultargs") DumpHelp;
		%feature("autodoc", "	* Returns the help line recorded for <level>, or an empty string

	:param level:
	:type level: int
	:rtype: char *
") DumpHelp;
		const char * DumpHelp (const Standard_Integer level);
};


%extend IFSelect_WorkLibrary {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_IFSelect_WorkLibrary(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_IFSelect_WorkLibrary::Handle_IFSelect_WorkLibrary %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_IFSelect_WorkLibrary;
class Handle_IFSelect_WorkLibrary : public Handle_Standard_Transient {

    public:
        // constructors
        Handle_IFSelect_WorkLibrary();
        Handle_IFSelect_WorkLibrary(const Handle_IFSelect_WorkLibrary &aHandle);
        Handle_IFSelect_WorkLibrary(const IFSelect_WorkLibrary *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_IFSelect_WorkLibrary DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_IFSelect_WorkLibrary {
    IFSelect_WorkLibrary* _get_reference() {
    return (IFSelect_WorkLibrary*)$self->Access();
    }
};

%extend Handle_IFSelect_WorkLibrary {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend IFSelect_WorkLibrary {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IFSelect_WorkSession;
class IFSelect_WorkSession : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") IFSelect_WorkSession;
		%feature("autodoc", "	* Creates a Work Session It provides default, empty ShareOut and ModelCopier, which can be replaced (if required, should be done just after creation).

	:rtype: None
") IFSelect_WorkSession;
		 IFSelect_WorkSession ();
		%feature("compactdefaultargs") ShareOut;
		%feature("autodoc", "	* Returns the ShareOut defined at creation time

	:rtype: Handle_IFSelect_ShareOut
") ShareOut;
		Handle_IFSelect_ShareOut ShareOut ();
		%feature("compactdefaultargs") SetShareOut;
		%feature("autodoc", "	* Sets a new ShareOut. Fills Items which its content Warning : data from the former ShareOut are lost

	:param shareout:
	:type shareout: Handle_IFSelect_ShareOut &
	:rtype: None
") SetShareOut;
		void SetShareOut (const Handle_IFSelect_ShareOut & shareout);
		%feature("compactdefaultargs") SetModeStat;
		%feature("autodoc", "	* Set value of mode responsible for precence of selections after loading If mode set to true that different selections will be accessible after loading else selections will be not accessible after loading( for economy memory in applicatios)

	:param theMode:
	:type theMode: bool
	:rtype: None
") SetModeStat;
		void SetModeStat (const Standard_Boolean theMode);
		%feature("compactdefaultargs") GetModeStat;
		%feature("autodoc", "	* Return value of mode defining of filling selection during loading

	:rtype: bool
") GetModeStat;
		Standard_Boolean GetModeStat ();
		%feature("compactdefaultargs") SetLibrary;
		%feature("autodoc", "	* Sets a WorkLibrary, which will be used to Read and Write Files

	:param lib:
	:type lib: Handle_IFSelect_WorkLibrary &
	:rtype: None
") SetLibrary;
		void SetLibrary (const Handle_IFSelect_WorkLibrary & lib);
		%feature("compactdefaultargs") WorkLibrary;
		%feature("autodoc", "	* Returns the WorkLibrary. Null Handle if not yet set should be C++ : return const &

	:rtype: Handle_IFSelect_WorkLibrary
") WorkLibrary;
		Handle_IFSelect_WorkLibrary WorkLibrary ();
		%feature("compactdefaultargs") SetProtocol;
		%feature("autodoc", "	* Sets a Protocol, which will be used to determine Graphs, to Read and to Write Files

	:param protocol:
	:type protocol: Handle_Interface_Protocol &
	:rtype: None
") SetProtocol;
		void SetProtocol (const Handle_Interface_Protocol & protocol);
		%feature("compactdefaultargs") Protocol;
		%feature("autodoc", "	* Returns the Protocol. Null Handle if not yet set should be C++ : return const &

	:rtype: Handle_Interface_Protocol
") Protocol;
		Handle_Interface_Protocol Protocol ();
		%feature("compactdefaultargs") SetSignType;
		%feature("autodoc", "	* Sets a specific Signature to be the SignType, i.e. the Signature which will determine TypeName from the Model (basic function). It is recorded in the GTool This Signature is also set as 'xst-sign-type' (reserved name)

	:param signtype:
	:type signtype: Handle_IFSelect_Signature &
	:rtype: None
") SetSignType;
		void SetSignType (const Handle_IFSelect_Signature & signtype);
		%feature("compactdefaultargs") SignType;
		%feature("autodoc", "	* Returns the current SignType

	:rtype: Handle_IFSelect_Signature
") SignType;
		Handle_IFSelect_Signature SignType ();
		%feature("compactdefaultargs") HasModel;
		%feature("autodoc", "	* Returns True is a Model has been set

	:rtype: bool
") HasModel;
		Standard_Boolean HasModel ();
		%feature("compactdefaultargs") SetModel;
		%feature("autodoc", "	* Sets a Model as input : this will be the Model from which the ShareOut will work if <clearpointed> is True (default) all SelectPointed items are cleared, else they must be managed by the caller Remark : SetModel clears the Graph, recomputes it if a Protocol is set and if the Model is not empty, of course

	:param model:
	:type model: Handle_Interface_InterfaceModel &
	:param clearpointed: default value is Standard_True
	:type clearpointed: bool
	:rtype: None
") SetModel;
		void SetModel (const Handle_Interface_InterfaceModel & model,const Standard_Boolean clearpointed = Standard_True);
		%feature("compactdefaultargs") Model;
		%feature("autodoc", "	* Returns the Model of the Work Session (Null Handle if none) should be C++ : return const &

	:rtype: Handle_Interface_InterfaceModel
") Model;
		Handle_Interface_InterfaceModel Model ();
		%feature("compactdefaultargs") SetLoadedFile;
		%feature("autodoc", "	* Stores the filename used for read for setting the model It is cleared by SetModel and ClearData(1)

	:param filename:
	:type filename: char *
	:rtype: None
") SetLoadedFile;
		void SetLoadedFile (const char * filename);
		%feature("compactdefaultargs") LoadedFile;
		%feature("autodoc", "	* Returns the filename used to load current model empty if unknown

	:rtype: char *
") LoadedFile;
		const char * LoadedFile ();
		%feature("compactdefaultargs") ReadFile;
		%feature("autodoc", "	* Reads a file with the WorkLibrary (sets Model and LoadedFile) Returns a integer status which can be : RetDone if OK, RetVoid if no Protocol not defined, RetError for file not found, RetFail if fail during read

	:param filename:
	:type filename: char *
	:rtype: IFSelect_ReturnStatus
") ReadFile;
		IFSelect_ReturnStatus ReadFile (const char * filename);
		%feature("compactdefaultargs") NbStartingEntities;
		%feature("autodoc", "	* Returns the count of Entities stored in the Model, or 0

	:rtype: int
") NbStartingEntities;
		Standard_Integer NbStartingEntities ();
		%feature("compactdefaultargs") StartingEntity;
		%feature("autodoc", "	* Returns an Entity stored in the Model of the WorkSession (Null Handle is no Model or num out of range)

	:param num:
	:type num: int
	:rtype: Handle_Standard_Transient
") StartingEntity;
		Handle_Standard_Transient StartingEntity (const Standard_Integer num);
		%feature("compactdefaultargs") StartingNumber;
		%feature("autodoc", "	* Returns the Number of an Entity in the Model (0 if no Model set or <ent> not in the Model)

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: int
") StartingNumber;
		Standard_Integer StartingNumber (const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") NumberFromLabel;
		%feature("autodoc", "	* From a given label in Model, returns the corresponding number Starts from first entity by Default, may start after a given number : this number may be given negative, its absolute value is then considered. Hence a loop on NumberFromLabel may be programmed (stop test is : returned value positive or null) //! Returns 0 if not found, < 0 if more than one found (first found in negative). If <val> just gives an integer value, returns it

	:param val:
	:type val: char *
	:param afternum: default value is 0
	:type afternum: int
	:rtype: int
") NumberFromLabel;
		Standard_Integer NumberFromLabel (const char * val,const Standard_Integer afternum = 0);
		%feature("compactdefaultargs") EntityLabel;
		%feature("autodoc", "	* Returns the label for <ent>, as the Model does If <ent> is not in the Model or if no Model is loaded, a Null Handle is returned

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: Handle_TCollection_HAsciiString
") EntityLabel;
		Handle_TCollection_HAsciiString EntityLabel (const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") EntityName;
		%feature("autodoc", "	* Returns the Name of an Entity This Name is computed by the general service Name Returns a Null Handle if fails

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: Handle_TCollection_HAsciiString
") EntityName;
		Handle_TCollection_HAsciiString EntityName (const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") CategoryNumber;
		%feature("autodoc", "	* Returns the Category Number determined for an entity it is computed by the class Category An unknown entity (number 0) gives a value -1

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: int
") CategoryNumber;
		Standard_Integer CategoryNumber (const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") CategoryName;
		%feature("autodoc", "	* Returns the Category Name determined for an entity it is computed by the class Category Remark : an unknown entity gives an empty string

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: char *
") CategoryName;
		const char * CategoryName (const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") ValidityName;
		%feature("autodoc", "	* Returns the Validity Name determined for an entity it is computed by the class SignValidity Remark : an unknown entity gives an empty string

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: char *
") ValidityName;
		const char * ValidityName (const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") ClearData;
		%feature("autodoc", "	* Clears recorded data (not the items) according mode : 1 : all Data : Model, Graph, CheckList, + ClearData 4 2 : Graph and CheckList (they will then be recomputed later) 3 : CheckList (it will be recomputed by ComputeCheck) 4 : just content of SelectPointed and Counters Plus 0 : does nothing but called by SetModel ClearData is virtual, hence it can be redefined to clear other data of a specialised Work Session

	:param mode:
	:type mode: int
	:rtype: void
") ClearData;
		virtual void ClearData (const Standard_Integer mode);
		%feature("compactdefaultargs") ComputeGraph;
		%feature("autodoc", "	* Computes the Graph used for Selections, Displays ... If a HGraph is already set, with same model as given by method Model, does nothing. Else, computes a new Graph. If <enforce> is given True, computes a new Graph anyway. Remark that a call to ClearGraph will cause ComputeGraph to really compute a new Graph Returns True if Graph is OK, False else (i.e. if no Protocol is set, or if Model is absent or empty).

	:param enforce: default value is Standard_False
	:type enforce: bool
	:rtype: bool
") ComputeGraph;
		Standard_Boolean ComputeGraph (const Standard_Boolean enforce = Standard_False);
		%feature("compactdefaultargs") HGraph;
		%feature("autodoc", "	* Returns the Computed Graph as HGraph (Null Handle if not set)

	:rtype: Handle_Interface_HGraph
") HGraph;
		Handle_Interface_HGraph HGraph ();
		%feature("compactdefaultargs") Graph;
		%feature("autodoc", "	* Returns the Computed Graph, for Read only

	:rtype: Interface_Graph
") Graph;
		const Interface_Graph & Graph ();
		%feature("compactdefaultargs") Shareds;
		%feature("autodoc", "	* Returns the list of entities shared by <ent> (can be empty) Returns a null Handle if <ent> is unknown

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: Handle_TColStd_HSequenceOfTransient
") Shareds;
		Handle_TColStd_HSequenceOfTransient Shareds (const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") Sharings;
		%feature("autodoc", "	* Returns the list of entities sharing <ent> (can be empty) Returns a null Handle if <ent> is unknown

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: Handle_TColStd_HSequenceOfTransient
") Sharings;
		Handle_TColStd_HSequenceOfTransient Sharings (const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") IsLoaded;
		%feature("autodoc", "	* Returns True if a Model is defined and really loaded (not empty), a Protocol is set and a Graph has been computed. In this case, the WorkSession can start to work

	:rtype: bool
") IsLoaded;
		Standard_Boolean IsLoaded ();
		%feature("compactdefaultargs") ComputeCheck;
		%feature("autodoc", "	* Computes the CheckList for the Model currently loaded It can then be used for displays, querries ... Returns True if OK, False else (i.e. no Protocol set, or Model absent). If <enforce> is False, works only if not already done or if a new Model has been loaded from last call. Remark : computation is enforced by every call to SetModel or RunTransformer

	:param enforce: default value is Standard_False
	:type enforce: bool
	:rtype: bool
") ComputeCheck;
		Standard_Boolean ComputeCheck (const Standard_Boolean enforce = Standard_False);
		%feature("compactdefaultargs") ModelCheckList;
		%feature("autodoc", "	* Returns the Check List for the Model currently loaded : <complete> = True : complete (syntactic & semantic messages), computed if not yet done <complete> = False : only syntactic (check file form)

	:param complete: default value is Standard_True
	:type complete: bool
	:rtype: Interface_CheckIterator
") ModelCheckList;
		Interface_CheckIterator ModelCheckList (const Standard_Boolean complete = Standard_True);
		%feature("compactdefaultargs") CheckOne;
		%feature("autodoc", "	* Returns a Check for a single entity, under the form of a CheckIterator (this gives only one form for the user) if <ent> is Null or equates the current Model, it gives the Global Check, else the Check for the given entity <complete> as for ModelCheckList

	:param ent:
	:type ent: Handle_Standard_Transient &
	:param complete: default value is Standard_True
	:type complete: bool
	:rtype: Interface_CheckIterator
") CheckOne;
		Interface_CheckIterator CheckOne (const Handle_Standard_Transient & ent,const Standard_Boolean complete = Standard_True);
		%feature("compactdefaultargs") LastRunCheckList;
		%feature("autodoc", "	* Returns the Check List produced by the last execution of either : EvaluateFile(for Split), SendSplit, SendAll, SendSelected, RunTransformer-RunModifier Cleared by SetModel or ClearData(1) The field is protected, hence a specialized WorkSession may fill it

	:rtype: Interface_CheckIterator
") LastRunCheckList;
		Interface_CheckIterator LastRunCheckList ();
		%feature("compactdefaultargs") MaxIdent;
		%feature("autodoc", "	* Returns the Maximum Value for an Item Identifier. It can be greater to the count of known Items, because some can have been removed

	:rtype: int
") MaxIdent;
		Standard_Integer MaxIdent ();
		%feature("compactdefaultargs") Item;
		%feature("autodoc", "	* Returns an Item, given its Ident. Returns a Null Handle if no Item corresponds to this Ident.

	:param id:
	:type id: int
	:rtype: Handle_Standard_Transient
") Item;
		Handle_Standard_Transient Item (const Standard_Integer id);
		%feature("compactdefaultargs") ItemIdent;
		%feature("autodoc", "	* Returns the Ident attached to an Item in the WorkSession, or Zero if it is unknown

	:param item:
	:type item: Handle_Standard_Transient &
	:rtype: int
") ItemIdent;
		Standard_Integer ItemIdent (const Handle_Standard_Transient & item);
		%feature("compactdefaultargs") NamedItem;
		%feature("autodoc", "	* Returns the Item which corresponds to a Variable, given its Name (whatever the type of this Item). Returns a Null Handle if this Name is not recorded

	:param name:
	:type name: char *
	:rtype: Handle_Standard_Transient
") NamedItem;
		Handle_Standard_Transient NamedItem (const char * name);
		%feature("compactdefaultargs") NamedItem;
		%feature("autodoc", "	* Same as above, but <name> is given through a Handle Especially Usefull with methods SelectionNames, etc...

	:param name:
	:type name: Handle_TCollection_HAsciiString &
	:rtype: Handle_Standard_Transient
") NamedItem;
		Handle_Standard_Transient NamedItem (const Handle_TCollection_HAsciiString & name);
		%feature("compactdefaultargs") NameIdent;
		%feature("autodoc", "	* Returns the Ident attached to a Name, 0 if name not recorded

	:param name:
	:type name: char *
	:rtype: int
") NameIdent;
		Standard_Integer NameIdent (const char * name);
		%feature("compactdefaultargs") HasName;
		%feature("autodoc", "	* Returns True if an Item of the WorkSession has an attached Name

	:param item:
	:type item: Handle_Standard_Transient &
	:rtype: bool
") HasName;
		Standard_Boolean HasName (const Handle_Standard_Transient & item);
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "	* Returns the Name attached to an Item as a Variable of this WorkSession. If <item> is Null or not recorded, returns an empty string.

	:param item:
	:type item: Handle_Standard_Transient &
	:rtype: Handle_TCollection_HAsciiString
") Name;
		Handle_TCollection_HAsciiString Name (const Handle_Standard_Transient & item);
		%feature("compactdefaultargs") AddItem;
		%feature("autodoc", "	* Adds an Item and returns its attached Ident. Does nothing if <item> is already recorded (and returns its attached Ident) <active> if True commands call to SetActive (see below) Remark : the determined Ident is used if <item> is a Dispatch, to fill the ShareOut

	:param item:
	:type item: Handle_Standard_Transient &
	:param active: default value is Standard_True
	:type active: bool
	:rtype: int
") AddItem;
		Standard_Integer AddItem (const Handle_Standard_Transient & item,const Standard_Boolean active = Standard_True);
		%feature("compactdefaultargs") AddNamedItem;
		%feature("autodoc", "	* Adds an Item with an attached Name. If the Name is already known in the WorkSession, the older item losts it Returns Ident if Done, 0 else, i.e. if <item> is null If <name> is empty, works as AddItem (i.e. with no name) If <item> is already known but with no attached Name, this method tries to attached a Name to it <active> if True commands call to SetActive (see below)

	:param name:
	:type name: char *
	:param item:
	:type item: Handle_Standard_Transient &
	:param active: default value is Standard_True
	:type active: bool
	:rtype: int
") AddNamedItem;
		Standard_Integer AddNamedItem (const char * name,const Handle_Standard_Transient & item,const Standard_Boolean active = Standard_True);
		%feature("compactdefaultargs") SetActive;
		%feature("autodoc", "	* Following the type of <item> : - Dispatch : Adds or Removes it in the ShareOut & FileNaming - GeneralModifier : Adds or Removes it for final sending (i.e. in the ModelCopier) Returns True if it did something, False else (state unchanged)

	:param item:
	:type item: Handle_Standard_Transient &
	:param mode:
	:type mode: bool
	:rtype: bool
") SetActive;
		Standard_Boolean SetActive (const Handle_Standard_Transient & item,const Standard_Boolean mode);
		%feature("compactdefaultargs") RemoveNamedItem;
		%feature("autodoc", "	* Removes an Item from the Session, given its Name Returns True if Done, False else (Name not recorded) (Applies only on Item which are Named)

	:param name:
	:type name: char *
	:rtype: bool
") RemoveNamedItem;
		Standard_Boolean RemoveNamedItem (const char * name);
		%feature("compactdefaultargs") RemoveName;
		%feature("autodoc", "	* Removes a Name without removing the Item Returns True if Done, False else (Name not recorded)

	:param name:
	:type name: char *
	:rtype: bool
") RemoveName;
		Standard_Boolean RemoveName (const char * name);
		%feature("compactdefaultargs") RemoveItem;
		%feature("autodoc", "	* Removes an Item given its Ident. Returns False if <id> is attached to no Item in the WorkSession. For a Named Item, also removes its Name.

	:param item:
	:type item: Handle_Standard_Transient &
	:rtype: bool
") RemoveItem;
		Standard_Boolean RemoveItem (const Handle_Standard_Transient & item);
		%feature("compactdefaultargs") ClearItems;
		%feature("autodoc", "	* Clears all the recorded Items : Selections, Dispatches, Modifiers, and Strings & IntParams, with their Idents & Names. Remark that if a Model has been loaded, it is not cleared.

	:rtype: None
") ClearItems;
		void ClearItems ();
		%feature("compactdefaultargs") ItemLabel;
		%feature("autodoc", "	* Returns a Label which illustrates the content of an Item, given its Ident. This Label is : - for a Text Parameter, 'Text:<text value>' - for an Integer Parameter, 'Integer:<integer value>' - for a Selection, a Dispatch or a Modifier, its Label (see these classes) - for any other kind of Variable, its cdl type

	:param id:
	:type id: int
	:rtype: Handle_TCollection_HAsciiString
") ItemLabel;
		Handle_TCollection_HAsciiString ItemLabel (const Standard_Integer id);
		%feature("compactdefaultargs") ItemIdents;
		%feature("autodoc", "	* Fills a Sequence with the List of Idents attached to the Items of which Type complies with (IsKind) <type> (alphabetic order) Remark : <type> = TYPE(Standard_Transient) gives all the Idents which are suitable in the WorkSession

	:param type:
	:type type: Handle_Standard_Type &
	:rtype: Handle_TColStd_HSequenceOfInteger
") ItemIdents;
		Handle_TColStd_HSequenceOfInteger ItemIdents (const Handle_Standard_Type & type);
		%feature("compactdefaultargs") ItemNames;
		%feature("autodoc", "	* Fills a Sequence with the list of the Names attached to Items of which Type complies with (IsKind) <type> (alphabetic order) Remark : <type> = TYPE(Standard_Transient) gives all the Names

	:param type:
	:type type: Handle_Standard_Type &
	:rtype: Handle_TColStd_HSequenceOfHAsciiString
") ItemNames;
		Handle_TColStd_HSequenceOfHAsciiString ItemNames (const Handle_Standard_Type & type);
		%feature("compactdefaultargs") ItemNamesForLabel;
		%feature("autodoc", "	* Fills a Sequence with the NAMES of the control items, of which the label matches <label> (contain it) : see NextIdentForLabel Search mode is fixed to 'contained' If <label> is empty, returns all Names

	:param label:
	:type label: char *
	:rtype: Handle_TColStd_HSequenceOfHAsciiString
") ItemNamesForLabel;
		Handle_TColStd_HSequenceOfHAsciiString ItemNamesForLabel (const char * label);
		%feature("compactdefaultargs") NextIdentForLabel;
		%feature("autodoc", "	* For query by Label with possible iterations Searches the Ident of which Item has a Label which matches a given one, the search starts from an initial Ident. Returns the first found Ident which follows <id>, or ZERO //! The search must start with <id> = 0, it returns the next Ident which matches. To iterate, call again this method which this returned value as <id>. Once an Ident has been returned, the Item can be obtained by the method Item //! <mode> precises the required matching mode : - 0 (Default) : <label> must match exactly with the Item Label - 1 : <label> must match the exact beginning (the end is free) - 2 : <label> must be at least once wherever in the Item Label - other values are ignored

	:param label:
	:type label: char *
	:param id:
	:type id: int
	:param mode: default value is 0
	:type mode: int
	:rtype: int
") NextIdentForLabel;
		Standard_Integer NextIdentForLabel (const char * label,const Standard_Integer id,const Standard_Integer mode = 0);
		%feature("compactdefaultargs") NewParamFromStatic;
		%feature("autodoc", "	* Creates a parameter as being bound to a Static If the Static is Integer, this creates an IntParam bound to it by its name. Else this creates a String which is the value of the Static. Returns a null handle if <statname> is unknown as a Static

	:param statname:
	:type statname: char *
	:param name: default value is ""
	:type name: char *
	:rtype: Handle_Standard_Transient
") NewParamFromStatic;
		Handle_Standard_Transient NewParamFromStatic (const char * statname,const char * name = "");
		%feature("compactdefaultargs") IntParam;
		%feature("autodoc", "	* Returns an IntParam, given its Ident in the Session Null result if <id> is not suitable for an IntParam (undefined, or defined for another kind of variable)

	:param id:
	:type id: int
	:rtype: Handle_IFSelect_IntParam
") IntParam;
		Handle_IFSelect_IntParam IntParam (const Standard_Integer id);
		%feature("compactdefaultargs") IntValue;
		%feature("autodoc", "	* Returns Integer Value of an IntParam

	:param it:
	:type it: Handle_IFSelect_IntParam &
	:rtype: int
") IntValue;
		Standard_Integer IntValue (const Handle_IFSelect_IntParam & it);
		%feature("compactdefaultargs") NewIntParam;
		%feature("autodoc", "	* Creates a new IntParam. A Name can be set (Optional) Returns the created IntParam, or a Null Handle in case of Failure (see AddItem/AddNamedItem)

	:param name: default value is ""
	:type name: char *
	:rtype: Handle_IFSelect_IntParam
") NewIntParam;
		Handle_IFSelect_IntParam NewIntParam (const char * name = "");
		%feature("compactdefaultargs") SetIntValue;
		%feature("autodoc", "	* Changes the Integer Value of an IntParam Returns True if Done, False if <it> is not in the WorkSession

	:param it:
	:type it: Handle_IFSelect_IntParam &
	:param val:
	:type val: int
	:rtype: bool
") SetIntValue;
		Standard_Boolean SetIntValue (const Handle_IFSelect_IntParam & it,const Standard_Integer val);
		%feature("compactdefaultargs") TextParam;
		%feature("autodoc", "	* Returns a TextParam, given its Ident in the Session Null result if <id> is not suitable for a TextParam (undefined, or defined for another kind of variable)

	:param id:
	:type id: int
	:rtype: Handle_TCollection_HAsciiString
") TextParam;
		Handle_TCollection_HAsciiString TextParam (const Standard_Integer id);
		%feature("compactdefaultargs") TextValue;
		%feature("autodoc", "	* Returns Text Value of a TextParam (a String) or an empty string if <it> is not in the WorkSession

	:param par:
	:type par: Handle_TCollection_HAsciiString &
	:rtype: TCollection_AsciiString
") TextValue;
		TCollection_AsciiString TextValue (const Handle_TCollection_HAsciiString & par);
		%feature("compactdefaultargs") NewTextParam;
		%feature("autodoc", "	* Creates a new (empty) TextParam. A Name can be set (Optional) Returns the created TextParam (as an HAsciiString), or a Null Handle in case of Failure (see AddItem/AddNamedItem)

	:param name: default value is ""
	:type name: char *
	:rtype: Handle_TCollection_HAsciiString
") NewTextParam;
		Handle_TCollection_HAsciiString NewTextParam (const char * name = "");
		%feature("compactdefaultargs") SetTextValue;
		%feature("autodoc", "	* Changes the Text Value of a TextParam (an HAsciiString) Returns True if Done, False if <it> is not in the WorkSession

	:param par:
	:type par: Handle_TCollection_HAsciiString &
	:param val:
	:type val: char *
	:rtype: bool
") SetTextValue;
		Standard_Boolean SetTextValue (const Handle_TCollection_HAsciiString & par,const char * val);
		%feature("compactdefaultargs") Signature;
		%feature("autodoc", "	* Returns a Signature, given its Ident in the Session Null result if <id> is not suitable for a Signature (undefined, or defined for another kind of variable)

	:param id:
	:type id: int
	:rtype: Handle_IFSelect_Signature
") Signature;
		Handle_IFSelect_Signature Signature (const Standard_Integer id);
		%feature("compactdefaultargs") SignValue;
		%feature("autodoc", "	* Returns the Value computed by a Signature for an Entity Returns an empty string if the entity does not belong to the loaded model

	:param sign:
	:type sign: Handle_IFSelect_Signature &
	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: char *
") SignValue;
		const char * SignValue (const Handle_IFSelect_Signature & sign,const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") Selection;
		%feature("autodoc", "	* Returns a Selection, given its Ident in the Session Null result if <id> is not suitable for a Selection (undefined, or defined for another kind of variable)

	:param id:
	:type id: int
	:rtype: Handle_IFSelect_Selection
") Selection;
		Handle_IFSelect_Selection Selection (const Standard_Integer id);
		%feature("compactdefaultargs") EvalSelection;
		%feature("autodoc", "	* Evaluates the effect of a Selection applied on the input Model Returned Result remains empty if no input Model has been set

	:param sel:
	:type sel: Handle_IFSelect_Selection &
	:rtype: Interface_EntityIterator
") EvalSelection;
		Interface_EntityIterator EvalSelection (const Handle_IFSelect_Selection & sel);
		%feature("compactdefaultargs") Sources;
		%feature("autodoc", "	* Returns the Selections which are source of Selection, given its rank in the List of Selections (see SelectionIterator) Returned value is empty if <num> is out of range or if <sel> is not in the WorkSession

	:param sel:
	:type sel: Handle_IFSelect_Selection &
	:rtype: IFSelect_SelectionIterator
") Sources;
		IFSelect_SelectionIterator Sources (const Handle_IFSelect_Selection & sel);
		%feature("compactdefaultargs") SelectionResult;
		%feature("autodoc", "	* Returns the result of a Selection, computed by EvalSelection (see above) under the form of a HSequence (hence, it can be used by a frontal-engine logic). It can be empty Returns a Null Handle if <sel> is not in the WorkSession

	:param sel:
	:type sel: Handle_IFSelect_Selection &
	:rtype: Handle_TColStd_HSequenceOfTransient
") SelectionResult;
		Handle_TColStd_HSequenceOfTransient SelectionResult (const Handle_IFSelect_Selection & sel);
		%feature("compactdefaultargs") SelectionResultFromList;
		%feature("autodoc", "	* Returns the result of a Selection, by forcing its input with a given list <list> (unless <list> is Null). RULES : <list> applies only for a SelectDeduct kind Selection : its Input is considered : if it is a SelectDeduct kind Selection, its Input is considered, etc... until an Input is not a Deduct/Extract : its result is replaced by <list> and all the chain of deductions is applied

	:param sel:
	:type sel: Handle_IFSelect_Selection &
	:param list:
	:type list: Handle_TColStd_HSequenceOfTransient &
	:rtype: Handle_TColStd_HSequenceOfTransient
") SelectionResultFromList;
		Handle_TColStd_HSequenceOfTransient SelectionResultFromList (const Handle_IFSelect_Selection & sel,const Handle_TColStd_HSequenceOfTransient & list);
		%feature("compactdefaultargs") SetItemSelection;
		%feature("autodoc", "	* Sets a Selection as input for an item, according its type : if <item> is a Dispatch : as Final Selection if <item> is a GeneralModifier (i.e. any kind of Modifier) : as Selection used to filter entities to modify <sel> Null causes this Selection to be nullified Returns False if <item> is not of a suitable type, or <item> or <sel> is not in the WorkSession

	:param item:
	:type item: Handle_Standard_Transient &
	:param sel:
	:type sel: Handle_IFSelect_Selection &
	:rtype: bool
") SetItemSelection;
		Standard_Boolean SetItemSelection (const Handle_Standard_Transient & item,const Handle_IFSelect_Selection & sel);
		%feature("compactdefaultargs") ResetItemSelection;
		%feature("autodoc", "	* Resets input Selection which was set by SetItemSelection Same conditions as for SetItemSelection Returns True if done, False if <item> is not in the WorkSession

	:param item:
	:type item: Handle_Standard_Transient &
	:rtype: bool
") ResetItemSelection;
		Standard_Boolean ResetItemSelection (const Handle_Standard_Transient & item);
		%feature("compactdefaultargs") ItemSelection;
		%feature("autodoc", "	* Returns the Selection of a Dispatch or a GeneralModifier. Returns a Null Handle if none is defined or <item> not good type

	:param item:
	:type item: Handle_Standard_Transient &
	:rtype: Handle_IFSelect_Selection
") ItemSelection;
		Handle_IFSelect_Selection ItemSelection (const Handle_Standard_Transient & item);
		%feature("compactdefaultargs") SignCounter;
		%feature("autodoc", "	* Returns a SignCounter from its ident in the Session Null result if <id> is not suitable for a SignCounter (undefined, or defined for another kind of variable)

	:param id:
	:type id: int
	:rtype: Handle_IFSelect_SignCounter
") SignCounter;
		Handle_IFSelect_SignCounter SignCounter (const Standard_Integer id);
		%feature("compactdefaultargs") ComputeCounter;
		%feature("autodoc", "	* Computes the content of a SignCounter when it is defined with a Selection, then returns True Returns False if the SignCounter is not defined with a Selection, or if its Selection Mode is inhibited <forced> to work around optimisations

	:param counter:
	:type counter: Handle_IFSelect_SignCounter &
	:param forced: default value is Standard_False
	:type forced: bool
	:rtype: bool
") ComputeCounter;
		Standard_Boolean ComputeCounter (const Handle_IFSelect_SignCounter & counter,const Standard_Boolean forced = Standard_False);
		%feature("compactdefaultargs") ComputeCounterFromList;
		%feature("autodoc", "	* Computes the content of a SignCounter from an input list If <list> is Null, uses internal definition of the Counter : a Selection, else the whole Model (recomputation forced) If <clear> is True (D), starts from scratch Else, cumulates computations

	:param counter:
	:type counter: Handle_IFSelect_SignCounter &
	:param list:
	:type list: Handle_TColStd_HSequenceOfTransient &
	:param clear: default value is Standard_True
	:type clear: bool
	:rtype: bool
") ComputeCounterFromList;
		Standard_Boolean ComputeCounterFromList (const Handle_IFSelect_SignCounter & counter,const Handle_TColStd_HSequenceOfTransient & list,const Standard_Boolean clear = Standard_True);
		%feature("compactdefaultargs") AppliedDispatches;
		%feature("autodoc", "	* Returns the ordered list of dispatches stored by the ShareOut

	:rtype: Handle_TColStd_HSequenceOfInteger
") AppliedDispatches;
		Handle_TColStd_HSequenceOfInteger AppliedDispatches ();
		%feature("compactdefaultargs") ClearShareOut;
		%feature("autodoc", "	* Clears the list of Dispatches recorded by the ShareOut if <only> disp is True, tha's all. Else, clears also the lists of Modifiers recorded by the ShareOut

	:param onlydisp:
	:type onlydisp: bool
	:rtype: None
") ClearShareOut;
		void ClearShareOut (const Standard_Boolean onlydisp);
		%feature("compactdefaultargs") Dispatch;
		%feature("autodoc", "	* Returns a Dispatch, given its Ident in the Session Null result if <id> is not suitable for a Dispatch (undefined, or defined for another kind of variable)

	:param id:
	:type id: int
	:rtype: Handle_IFSelect_Dispatch
") Dispatch;
		Handle_IFSelect_Dispatch Dispatch (const Standard_Integer id);
		%feature("compactdefaultargs") DispatchRank;
		%feature("autodoc", "	* Returns the rank of a Dispatch in the ShareOut, or 0 if <disp> is not in the ShareOut or not in the WorkSession

	:param disp:
	:type disp: Handle_IFSelect_Dispatch &
	:rtype: int
") DispatchRank;
		Standard_Integer DispatchRank (const Handle_IFSelect_Dispatch & disp);
		%feature("compactdefaultargs") ModelCopier;
		%feature("autodoc", "	* Gives access to the complete ModelCopier

	:rtype: Handle_IFSelect_ModelCopier
") ModelCopier;
		Handle_IFSelect_ModelCopier ModelCopier ();
		%feature("compactdefaultargs") SetModelCopier;
		%feature("autodoc", "	* Sets a new ModelCopier. Fills Items which its content

	:param copier:
	:type copier: Handle_IFSelect_ModelCopier &
	:rtype: None
") SetModelCopier;
		void SetModelCopier (const Handle_IFSelect_ModelCopier & copier);
		%feature("compactdefaultargs") NbFinalModifiers;
		%feature("autodoc", "	* Returns the count of Modifiers applied to final sending Model Modifiers if <formodel> is True, File Modifiers else (i.e. Modifiers which apply once the Models have been filled)

	:param formodel:
	:type formodel: bool
	:rtype: int
") NbFinalModifiers;
		Standard_Integer NbFinalModifiers (const Standard_Boolean formodel);
		%feature("compactdefaultargs") FinalModifierIdents;
		%feature("autodoc", "	* Fills a Sequence with a list of Idents, those attached to the Modifiers applied to final sending. Model Modifiers if <formodel> is True, File Modifiers else This list is given in the order in which they will be applied (which takes into account the Changes to Modifier Ranks)

	:param formodel:
	:type formodel: bool
	:rtype: Handle_TColStd_HSequenceOfInteger
") FinalModifierIdents;
		Handle_TColStd_HSequenceOfInteger FinalModifierIdents (const Standard_Boolean formodel);
		%feature("compactdefaultargs") GeneralModifier;
		%feature("autodoc", "	* Returns a Modifier, given its Ident in the Session Null result if <id> is not suitable for a Modifier (undefined, or defined for another kind of variable)

	:param id:
	:type id: int
	:rtype: Handle_IFSelect_GeneralModifier
") GeneralModifier;
		Handle_IFSelect_GeneralModifier GeneralModifier (const Standard_Integer id);
		%feature("compactdefaultargs") ModelModifier;
		%feature("autodoc", "	* Returns a Model Modifier, given its Ident in the Session, i.e. typed as a Modifier (not simply a GeneralModifier) Null result if <id> is not suitable for a Modifier (undefined, or defined for another kind of variable)

	:param id:
	:type id: int
	:rtype: Handle_IFSelect_Modifier
") ModelModifier;
		Handle_IFSelect_Modifier ModelModifier (const Standard_Integer id);
		%feature("compactdefaultargs") ModifierRank;
		%feature("autodoc", "	* Returns the Rank of a Modifier given its Ident. Model or File Modifier according its type (ModelModifier or not) Remember that Modifiers are applied sequencially following their Rank : first Model Modifiers then File Modifiers Rank is given by rank of call to AddItem and can be changed by ChangeModifierRank

	:param item:
	:type item: Handle_IFSelect_GeneralModifier &
	:rtype: int
") ModifierRank;
		Standard_Integer ModifierRank (const Handle_IFSelect_GeneralModifier & item);
		%feature("compactdefaultargs") ChangeModifierRank;
		%feature("autodoc", "	* Changes the Rank of a Modifier in the Session : Model Modifiers if <formodel> is True, File Modifiers else the Modifier n0 <before> is put to n0 <after> Return True if Done, False if <before> or <after> out of range

	:param formodel:
	:type formodel: bool
	:param before:
	:type before: int
	:param after:
	:type after: int
	:rtype: bool
") ChangeModifierRank;
		Standard_Boolean ChangeModifierRank (const Standard_Boolean formodel,const Standard_Integer before,const Standard_Integer after);
		%feature("compactdefaultargs") ClearFinalModifiers;
		%feature("autodoc", "	* Removes all the Modifiers active in the ModelCopier : they become inactive and they are removed from the Session

	:rtype: None
") ClearFinalModifiers;
		void ClearFinalModifiers ();
		%feature("compactdefaultargs") SetAppliedModifier;
		%feature("autodoc", "	* Sets a GeneralModifier to be applied to an item : - item = ShareOut : applies for final sending (all dispatches) - item is a Dispatch : applies for this dispatch only Returns True if done, False if <modif> or <item> not in <self>

	:param modif:
	:type modif: Handle_IFSelect_GeneralModifier &
	:param item:
	:type item: Handle_Standard_Transient &
	:rtype: bool
") SetAppliedModifier;
		Standard_Boolean SetAppliedModifier (const Handle_IFSelect_GeneralModifier & modif,const Handle_Standard_Transient & item);
		%feature("compactdefaultargs") ResetAppliedModifier;
		%feature("autodoc", "	* Resets a GeneralModifier to be applied Returns True if done, False if <modif> was not applied

	:param modif:
	:type modif: Handle_IFSelect_GeneralModifier &
	:rtype: bool
") ResetAppliedModifier;
		Standard_Boolean ResetAppliedModifier (const Handle_IFSelect_GeneralModifier & modif);
		%feature("compactdefaultargs") UsesAppliedModifier;
		%feature("autodoc", "	* Returns the item on which a GeneralModifier is applied : the ShareOut, or a given Dispatch Returns a Null Handle if <modif> is not applied

	:param modif:
	:type modif: Handle_IFSelect_GeneralModifier &
	:rtype: Handle_Standard_Transient
") UsesAppliedModifier;
		Handle_Standard_Transient UsesAppliedModifier (const Handle_IFSelect_GeneralModifier & modif);
		%feature("compactdefaultargs") Transformer;
		%feature("autodoc", "	* Returns a Transformer, given its Ident in the Session Null result if <id> is not suitable for a Transformer (undefined, or defined for another kind of variable)

	:param id:
	:type id: int
	:rtype: Handle_IFSelect_Transformer
") Transformer;
		Handle_IFSelect_Transformer Transformer (const Standard_Integer id);
		%feature("compactdefaultargs") RunTransformer;
		%feature("autodoc", "	* Runs a Transformer on starting Model, which can then be edited or replaced by a new one. The Protocol can also be changed. Fills LastRunCheckList //! Returned status is 0 if nothing done (<transf> or model undefined), positive if OK, negative else : 0 : Nothing done 1 : OK, edition on the spot with no change to the graph of dependances (purely local) 2 : OK, model edited on the spot (graph recomputed, may have changed), protocol unchanged 3 : OK, new model produced, same protocol 4 : OK, model edited on the spot (graph recomputed), but protocol has changed 5 : OK, new model produced, protocol has changed -1 : Error on the spot (slight changes), data may be corrupted (remark : corruption should not be profound) -2 : Error on edition the spot, data may be corrupted (checking them is recommanded) -3 : Error with a new data set, transformation ignored -4 : OK as 4, but graph of dependances count not be recomputed (the former one is kept) : check the protocol

	:param transf:
	:type transf: Handle_IFSelect_Transformer &
	:rtype: int
") RunTransformer;
		Standard_Integer RunTransformer (const Handle_IFSelect_Transformer & transf);
		%feature("compactdefaultargs") RunModifier;
		%feature("autodoc", "	* Runs a Modifier on Starting Model. It can modify entities, or add new ones. But the Model or the Protocol is unchanged. The Modifier is applied on each entity of the Model. See also RunModifierSelected Fills LastRunCheckList //! <copy> : if True, a new data set is produced which brings the modifications (Model + its Entities) if False, data are modified on the spot //! It works through a TransformStandard defined with <modif> Returned status as RunTransformer : 0 nothing done, >0 OK, <0 problem, but only between -3 and 3 (protocol unchanged) Remark : <copy> True will give <effect> = 3 or -3

	:param modif:
	:type modif: Handle_IFSelect_Modifier &
	:param copy:
	:type copy: bool
	:rtype: int
") RunModifier;
		Standard_Integer RunModifier (const Handle_IFSelect_Modifier & modif,const Standard_Boolean copy);
		%feature("compactdefaultargs") RunModifierSelected;
		%feature("autodoc", "	* Acts as RunModifier, but the Modifier is applied on the list determined by a Selection, rather than on the whole Model If the selection is a null handle, the whole model is taken

	:param modif:
	:type modif: Handle_IFSelect_Modifier &
	:param sel:
	:type sel: Handle_IFSelect_Selection &
	:param copy:
	:type copy: bool
	:rtype: int
") RunModifierSelected;
		Standard_Integer RunModifierSelected (const Handle_IFSelect_Modifier & modif,const Handle_IFSelect_Selection & sel,const Standard_Boolean copy);
		%feature("compactdefaultargs") NewTransformStandard;
		%feature("autodoc", "	* Creates and returns a TransformStandard, empty, with its Copy Option (True = Copy, False = On the Spot) and an optional name. To a TransformStandard, the method SetAppliedModifier applies

	:param copy:
	:type copy: bool
	:param name: default value is ""
	:type name: char *
	:rtype: Handle_IFSelect_Transformer
") NewTransformStandard;
		Handle_IFSelect_Transformer NewTransformStandard (const Standard_Boolean copy,const char * name = "");
		%feature("compactdefaultargs") SetModelContent;
		%feature("autodoc", "	* Defines a new content from the former one If <keep> is True, it is given by entities selected by Selection <sel> (and all shared entities) Else, it is given by all the former content but entities selected by the Selection <sel> (and properly shared ones) Returns True if done. Returns False if the selected list (from <sel>) is empty, hence nothing is done

	:param sel:
	:type sel: Handle_IFSelect_Selection &
	:param keep:
	:type keep: bool
	:rtype: bool
") SetModelContent;
		Standard_Boolean SetModelContent (const Handle_IFSelect_Selection & sel,const Standard_Boolean keep);
		%feature("compactdefaultargs") FilePrefix;
		%feature("autodoc", "	* Returns the defined File Prefix. Null Handle if not defined

	:rtype: Handle_TCollection_HAsciiString
") FilePrefix;
		Handle_TCollection_HAsciiString FilePrefix ();
		%feature("compactdefaultargs") DefaultFileRoot;
		%feature("autodoc", "	* Returns the defined Default File Root. It is used for Dispatches which have no specific root attached. Null Handle if not defined

	:rtype: Handle_TCollection_HAsciiString
") DefaultFileRoot;
		Handle_TCollection_HAsciiString DefaultFileRoot ();
		%feature("compactdefaultargs") FileExtension;
		%feature("autodoc", "	* Returns the defined File Extension. Null Handle if not defined

	:rtype: Handle_TCollection_HAsciiString
") FileExtension;
		Handle_TCollection_HAsciiString FileExtension ();
		%feature("compactdefaultargs") FileRoot;
		%feature("autodoc", "	* Returns the File Root defined for a Dispatch. Null if no Root Name is defined for it (hence, no File will be produced)

	:param disp:
	:type disp: Handle_IFSelect_Dispatch &
	:rtype: Handle_TCollection_HAsciiString
") FileRoot;
		Handle_TCollection_HAsciiString FileRoot (const Handle_IFSelect_Dispatch & disp);
		%feature("compactdefaultargs") SetFilePrefix;
		%feature("autodoc", "	* Defines a File Prefix

	:param name:
	:type name: char *
	:rtype: None
") SetFilePrefix;
		void SetFilePrefix (const char * name);
		%feature("compactdefaultargs") SetDefaultFileRoot;
		%feature("autodoc", "	* Defines a Default File Root Name. Clears it is <name> = '' Returns True if OK, False if <name> already set for a Dispatch

	:param name:
	:type name: char *
	:rtype: bool
") SetDefaultFileRoot;
		Standard_Boolean SetDefaultFileRoot (const char * name);
		%feature("compactdefaultargs") SetFileExtension;
		%feature("autodoc", "	* Defines a File Extension

	:param name:
	:type name: char *
	:rtype: None
") SetFileExtension;
		void SetFileExtension (const char * name);
		%feature("compactdefaultargs") SetFileRoot;
		%feature("autodoc", "	* Defines a Root for a Dispatch If <name> is empty, clears Root Name This has as effect to inhibit the production of File by <disp> Returns False if <disp> is not in the WorkSession or if a root name is already defined for it

	:param disp:
	:type disp: Handle_IFSelect_Dispatch &
	:param name:
	:type name: char *
	:rtype: bool
") SetFileRoot;
		Standard_Boolean SetFileRoot (const Handle_IFSelect_Dispatch & disp,const char * name);
		%feature("compactdefaultargs") GiveFileRoot;
		%feature("autodoc", "	* Extracts File Root Name from a given complete file name (uses OSD_Path)

	:param file:
	:type file: char *
	:rtype: char *
") GiveFileRoot;
		const char * GiveFileRoot (const char * file);
		%feature("compactdefaultargs") GiveFileComplete;
		%feature("autodoc", "	* Completes a file name as required, with Prefix and Extension (if defined; for a non-defined item, completes nothing)

	:param file:
	:type file: char *
	:rtype: char *
") GiveFileComplete;
		const char * GiveFileComplete (const char * file);
		%feature("compactdefaultargs") ClearFile;
		%feature("autodoc", "	* Erases all stored data from the File Evaluation (i.e. ALL former naming informations are lost)

	:rtype: None
") ClearFile;
		void ClearFile ();
		%feature("compactdefaultargs") EvaluateFile;
		%feature("autodoc", "	* Performs and stores a File Evaluation. The Results are a List of produced Models and a List of names (Strings), in parallel Fills LastRunCheckList

	:rtype: None
") EvaluateFile;
		void EvaluateFile ();
		%feature("compactdefaultargs") NbFiles;
		%feature("autodoc", "	* Returns the count of produced Models

	:rtype: int
") NbFiles;
		Standard_Integer NbFiles ();
		%feature("compactdefaultargs") FileModel;
		%feature("autodoc", "	* Returns a Model, given its rank in the Evaluation List

	:param num:
	:type num: int
	:rtype: Handle_Interface_InterfaceModel
") FileModel;
		Handle_Interface_InterfaceModel FileModel (const Standard_Integer num);
		%feature("compactdefaultargs") FileName;
		%feature("autodoc", "	* Returns the name of a file corresponding to a produced Model, given its rank in the Evaluation List

	:param num:
	:type num: int
	:rtype: TCollection_AsciiString
") FileName;
		TCollection_AsciiString FileName (const Standard_Integer num);
		%feature("compactdefaultargs") BeginSentFiles;
		%feature("autodoc", "	* Commands file sending to clear the list of already sent files, commands to record a new one if <record> is True This list is managed by the ModelCopier when SendSplit is called It allows a global exploitation of the set of sent files

	:param record:
	:type record: bool
	:rtype: None
") BeginSentFiles;
		void BeginSentFiles (const Standard_Boolean record);
		%feature("compactdefaultargs") SentFiles;
		%feature("autodoc", "	* Returns the list of recorded sent files, or a Null Handle is recording has not been enabled

	:rtype: Handle_TColStd_HSequenceOfHAsciiString
") SentFiles;
		Handle_TColStd_HSequenceOfHAsciiString SentFiles ();
		%feature("compactdefaultargs") SendSplit;
		%feature("autodoc", "	* Performs creation of derived files from the input Model Takes its data (sub-models and names), from result EvaluateFile if active, else by dynamic Evaluation (not stored) After SendSplit, result of EvaluateFile is Cleared Fills LastRunCheckList //! Works with the WorkLibrary which acts on specific type of Model and can work with File Modifiers (managed by the Model Copier) and a ModelCopier, which can work with Model Modifiers Returns False if, either WorkLibrary has failed on at least one sub-file, or the Work Session is badly conditionned (no Model defined, or FileNaming not in phase with ShareOut)

	:rtype: bool
") SendSplit;
		Standard_Boolean SendSplit ();
		%feature("compactdefaultargs") EvalSplit;
		%feature("autodoc", "	* Returns an Evaluation of the whole ShareOut definition : i.e. how the entities of the starting model are forecast to be sent to various files : list of packets according the dispatches, effective lists of roots for each packet (which determine the content of the corresponding file); plus evaluation of which entities are : forgotten (sent into no file), duplicated (sent into more than one file), sent into a given file. See the class PacketList for more details.

	:rtype: Handle_IFSelect_PacketList
") EvalSplit;
		Handle_IFSelect_PacketList EvalSplit ();
		%feature("compactdefaultargs") SentList;
		%feature("autodoc", "	* Returns the list of Entities sent in files, accourding the count of files each one has been sent (these counts are reset by SetModel or SetRemaining(Forget) ) stored in Graph Status <count> = -1 (default) is for ENtities sent at least once <count> = 0 is for the Remaining List (entities not yet sent) <count> = 1 is for entities sent in one and only one file (the ideal case) Remaining Data are computed on each Sending/Copying output files (see methods EvaluateFile and SendSplit) Graph Status is 0 for Remaining Entity, <count> for Sent into <count> files This status is set to 0 (not yet sent) for all by SetModel and by SetRemaining(mode=Forget,Display)

	:param count: default value is -1
	:type count: int
	:rtype: Interface_EntityIterator
") SentList;
		Interface_EntityIterator SentList (const Standard_Integer count = -1);
		%feature("compactdefaultargs") MaxSendingCount;
		%feature("autodoc", "	* Returns the greater count of different files in which any of the starting entities could be sent. Before any file output, this count is 0. Ideal count is 1. More than 1 means that duplications occur.

	:rtype: int
") MaxSendingCount;
		Standard_Integer MaxSendingCount ();
		%feature("compactdefaultargs") SetRemaining;
		%feature("autodoc", "	* Processes Remaining data (after having sent files), mode : Forget : forget remaining info (i.e. clear all 'Sent' status) Compute : compute and keep remaining (does nothing if : remaining is empty or if no files has been sent) Display : display entities recorded as remaining Undo : restore former state of data (after Remaining(1) ) Returns True if OK, False else (i.e. mode = 2 and Remaining List is either empty or takes all the entities, or mode = 3 and no former computation of remaining data was done)

	:param mode:
	:type mode: IFSelect_RemainMode
	:rtype: bool
") SetRemaining;
		Standard_Boolean SetRemaining (const IFSelect_RemainMode mode);
		%feature("compactdefaultargs") SendAll;
		%feature("autodoc", "	* Sends the starting Model into one file, without splitting, managing remaining data or anything else. <computegraph> true commands the Graph to be recomputed before sending : required when a Model is filled in several steps //! The Model and File Modifiers recorded to be applied on sending files are. Returns a status of execution : Done if OK, Void if no data available, Error if errors occured (work library is not defined), errors during translation Fail if exception during translation is raised Stop if no disk space or disk, file is write protected Fills LastRunCheckList

	:param filename:
	:type filename: char *
	:param computegraph: default value is Standard_False
	:type computegraph: bool
	:rtype: IFSelect_ReturnStatus
") SendAll;
		IFSelect_ReturnStatus SendAll (const char * filename,const Standard_Boolean computegraph = Standard_False);
		%feature("compactdefaultargs") SendSelected;
		%feature("autodoc", "	* Sends a part of the starting Model into one file, without splitting. But remaining data are managed. <computegraph> true commands the Graph to be recomputed before sending : required when a Model is filled in several steps //! The Model and File Modifiers recorded to be applied on sending files are. Returns a status : Done if OK, Fail if error during send, Error : WorkLibrary not defined, Void : selection list empty Fills LastRunCheckList

	:param filename:
	:type filename: char *
	:param sel:
	:type sel: Handle_IFSelect_Selection &
	:param computegraph: default value is Standard_False
	:type computegraph: bool
	:rtype: IFSelect_ReturnStatus
") SendSelected;
		IFSelect_ReturnStatus SendSelected (const char * filename,const Handle_IFSelect_Selection & sel,const Standard_Boolean computegraph = Standard_False);
		%feature("compactdefaultargs") WriteFile;
		%feature("autodoc", "	* Writes the current Interface Model globally to a File, and returns a write status which can be : Done OK, Fail file could not be written, Error no norm is selected Remark : It is a simple, one-file writing, other operations are available (such as splitting ...) which calls SendAll

	:param filename:
	:type filename: char *
	:rtype: IFSelect_ReturnStatus
") WriteFile;
		IFSelect_ReturnStatus WriteFile (const char * filename);
		%feature("compactdefaultargs") WriteFile;
		%feature("autodoc", "	* Writes a sub-part of the current Interface Model to a File, as defined by a Selection <sel>, recomputes the Graph, and returns a write status which can be : Done OK, Fail file could not be written, Error no norm is selected Remark : It is a simple, one-file writing, other operations are available (such as splitting ...) which calls SendSelected

	:param filename:
	:type filename: char *
	:param sel:
	:type sel: Handle_IFSelect_Selection &
	:rtype: IFSelect_ReturnStatus
") WriteFile;
		IFSelect_ReturnStatus WriteFile (const char * filename,const Handle_IFSelect_Selection & sel);
		%feature("compactdefaultargs") NbSources;
		%feature("autodoc", "	* Returns the count of Input Selections known for a Selection, or 0 if <sel> not in the WorkSession. This count is one for a SelectDeduct / SelectExtract kind, two for SelectControl kind, variable for a SelectCombine (Union/Intersection), zero else

	:param sel:
	:type sel: Handle_IFSelect_Selection &
	:rtype: int
") NbSources;
		Standard_Integer NbSources (const Handle_IFSelect_Selection & sel);
		%feature("compactdefaultargs") Source;
		%feature("autodoc", "	* Returns the <num>th Input Selection of a Selection (see NbSources). Returns a Null Handle if <sel> is not in the WorkSession or if <num> is out of the range <1-NbSources> To obtain more details, see the method Sources

	:param sel:
	:type sel: Handle_IFSelect_Selection &
	:param num: default value is 1
	:type num: int
	:rtype: Handle_IFSelect_Selection
") Source;
		Handle_IFSelect_Selection Source (const Handle_IFSelect_Selection & sel,const Standard_Integer num = 1);
		%feature("compactdefaultargs") IsReversedSelectExtract;
		%feature("autodoc", "	* Returns True if <sel> a Reversed SelectExtract, False else

	:param sel:
	:type sel: Handle_IFSelect_Selection &
	:rtype: bool
") IsReversedSelectExtract;
		Standard_Boolean IsReversedSelectExtract (const Handle_IFSelect_Selection & sel);
		%feature("compactdefaultargs") ToggleSelectExtract;
		%feature("autodoc", "	* Toggles the Sense (Direct <-> Reversed) of a SelectExtract Returns True if Done, False if <sel> is not a SelectExtract or is not in the WorkSession

	:param sel:
	:type sel: Handle_IFSelect_Selection &
	:rtype: bool
") ToggleSelectExtract;
		Standard_Boolean ToggleSelectExtract (const Handle_IFSelect_Selection & sel);
		%feature("compactdefaultargs") SetInputSelection;
		%feature("autodoc", "	* Sets an Input Selection (as <input>) to a SelectExtract or a SelectDeduct (as <sel>). Returns True if Done, False if <sel> is neither a SelectExtract nor a SelectDeduct, or not in the WorkSession

	:param sel:
	:type sel: Handle_IFSelect_Selection &
	:param input:
	:type input: Handle_IFSelect_Selection &
	:rtype: bool
") SetInputSelection;
		Standard_Boolean SetInputSelection (const Handle_IFSelect_Selection & sel,const Handle_IFSelect_Selection & input);
		%feature("compactdefaultargs") SetControl;
		%feature("autodoc", "	* Sets an Input Selection, Main if <formain> is True, Second else (as <sc>) to a SelectControl (as <sel>). Returns True if Done, False if <sel> is not a SelectControl, or <sc> or <sel> is not in the WorkSession

	:param sel:
	:type sel: Handle_IFSelect_Selection &
	:param sc:
	:type sc: Handle_IFSelect_Selection &
	:param formain: default value is Standard_True
	:type formain: bool
	:rtype: bool
") SetControl;
		Standard_Boolean SetControl (const Handle_IFSelect_Selection & sel,const Handle_IFSelect_Selection & sc,const Standard_Boolean formain = Standard_True);
		%feature("compactdefaultargs") CombineAdd;
		%feature("autodoc", "	* Adds an input selection to a SelectCombine (Union or Inters.). Returns new count of inputs for this SelectCombine if Done or 0 if <sel> is not kind of SelectCombine, or if <seladd> or <sel> is not in the WorkSession By default, adding is done at the end of the list Else, it is an insertion to rank <atnum> (usefull for Un-ReDo)

	:param selcomb:
	:type selcomb: Handle_IFSelect_Selection &
	:param seladd:
	:type seladd: Handle_IFSelect_Selection &
	:param atnum: default value is 0
	:type atnum: int
	:rtype: int
") CombineAdd;
		Standard_Integer CombineAdd (const Handle_IFSelect_Selection & selcomb,const Handle_IFSelect_Selection & seladd,const Standard_Integer atnum = 0);
		%feature("compactdefaultargs") CombineRemove;
		%feature("autodoc", "	* Removes an input selection from a SelectCombine (Union or Intersection). Returns True if done, False if <selcomb> is not kind of SelectCombine or <selrem> is not source of <selcomb>

	:param selcomb:
	:type selcomb: Handle_IFSelect_Selection &
	:param selrem:
	:type selrem: Handle_IFSelect_Selection &
	:rtype: bool
") CombineRemove;
		Standard_Boolean CombineRemove (const Handle_IFSelect_Selection & selcomb,const Handle_IFSelect_Selection & selrem);
		%feature("compactdefaultargs") NewSelectPointed;
		%feature("autodoc", "	* Creates a new Selection, of type SelectPointed, its content starts with <list>. A name must be given (can be empty)

	:param list:
	:type list: Handle_TColStd_HSequenceOfTransient &
	:param name:
	:type name: char *
	:rtype: Handle_IFSelect_Selection
") NewSelectPointed;
		Handle_IFSelect_Selection NewSelectPointed (const Handle_TColStd_HSequenceOfTransient & list,const char * name);
		%feature("compactdefaultargs") SetSelectPointed;
		%feature("autodoc", "	* Changes the content of a Selection of type SelectPointed According <mode> : 0 set <list> as new content (clear former) 1 : adds <list> to actual content -1 : removes <list> from actual content Returns True if done, False if <sel> is not a SelectPointed

	:param sel:
	:type sel: Handle_IFSelect_Selection &
	:param list:
	:type list: Handle_TColStd_HSequenceOfTransient &
	:param mode:
	:type mode: int
	:rtype: bool
") SetSelectPointed;
		Standard_Boolean SetSelectPointed (const Handle_IFSelect_Selection & sel,const Handle_TColStd_HSequenceOfTransient & list,const Standard_Integer mode);
		%feature("compactdefaultargs") GiveSelection;
		%feature("autodoc", "	* Returns a Selection from a Name : - the name of a Selection : this Selection - the name of a Signature + criteria between (..) : a new Selection from this Signature - an entity or a list of entities : a new SelectPointed Else, returns a Null Handle

	:param selname:
	:type selname: char *
	:rtype: Handle_IFSelect_Selection
") GiveSelection;
		Handle_IFSelect_Selection GiveSelection (const char * selname);
		%feature("compactdefaultargs") GiveList;
		%feature("autodoc", "	* Determines a list of entities from an object : <obj> already HSequenceOfTransient : returned itself <obj> Selection : its Result of Evaluation is returned <obj> an entity of the Model : a HSequence which contains it else, an empty HSequence <obj> the Model it self : ALL its content (not only the roots)

	:param obj:
	:type obj: Handle_Standard_Transient &
	:rtype: Handle_TColStd_HSequenceOfTransient
") GiveList;
		Handle_TColStd_HSequenceOfTransient GiveList (const Handle_Standard_Transient & obj);
		%feature("compactdefaultargs") GiveList;
		%feature("autodoc", "	* Computes a List of entities from two alphanums, first and second, as follows : if <first> is a Number or Label of an entity : this entity if <first> is a list of Numbers/Labels : the list of entities if <first> is the name of a Selection in <WS>, and <second> not defined, the standard result of this Selection else, let's consider 'first second' : this whole phrase is splitted by blanks, as follows (RECURSIVE CALL) : - the leftest term is the final selection - the other terms define the result of the selection - and so on (the 'leftest minus one' is a selection, of which the input is given by the remaining ...)

	:param first:
	:type first: char *
	:param second: default value is ""
	:type second: char *
	:rtype: Handle_TColStd_HSequenceOfTransient
") GiveList;
		Handle_TColStd_HSequenceOfTransient GiveList (const char * first,const char * second = "");
		%feature("compactdefaultargs") GiveListFromList;
		%feature("autodoc", "	* Computes a List of entities from the model as follows <first> beeing a Selection or a combination of Selections, <ent> beeing an entity or a list of entities (as a HSequenceOfTransient) : the standard result of this selection applied to this list if <ent> is Null, the standard definition of the selection is used (which contains a default input selection) if <selname> is erroneous, a null handle is returned //! REMARK : selname is processed as <first second> of preceeding GiveList

	:param selname:
	:type selname: char *
	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: Handle_TColStd_HSequenceOfTransient
") GiveListFromList;
		Handle_TColStd_HSequenceOfTransient GiveListFromList (const char * selname,const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") GiveListCombined;
		%feature("autodoc", "	* Combines two lists and returns the result, according to mode : <mode> < 0 : entities in <l1> AND NOT in <l2> <mode> = 0 : entities in <l1> AND in <l2> <mode> > 0 : entities in <l1> OR in <l2>

	:param l1:
	:type l1: Handle_TColStd_HSequenceOfTransient &
	:param l2:
	:type l2: Handle_TColStd_HSequenceOfTransient &
	:param mode:
	:type mode: int
	:rtype: Handle_TColStd_HSequenceOfTransient
") GiveListCombined;
		Handle_TColStd_HSequenceOfTransient GiveListCombined (const Handle_TColStd_HSequenceOfTransient & l1,const Handle_TColStd_HSequenceOfTransient & l2,const Standard_Integer mode);
		%feature("compactdefaultargs") QueryCheckList;
		%feature("autodoc", "	* Loads data from a check iterator to query status on it

	:param chl:
	:type chl: Interface_CheckIterator &
	:rtype: None
") QueryCheckList;
		void QueryCheckList (const Interface_CheckIterator & chl);
		%feature("compactdefaultargs") QueryCheckStatus;
		%feature("autodoc", "	* Determines check status for an entity regarding last call to QueryCheckList : -1 : <ent> unknown in the model, ignored 0 : no check at all, immediate or inherited thru Graph 1 : immediate warning (no fail), no inherited check 2 : immediate fail, no inherited check +10 : idem but some inherited warning (no fail) +20 : idem but some inherited fail

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: int
") QueryCheckStatus;
		Standard_Integer QueryCheckStatus (const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") QueryParent;
		%feature("autodoc", "	* Determines if <entdad> is parent of <entson> (in the graph), returns : -1 if no; 0 if <entdad> = <entson> 1 if immediate parent, > 1 if parent, gives count of steps

	:param entdad:
	:type entdad: Handle_Standard_Transient &
	:param entson:
	:type entson: Handle_Standard_Transient &
	:rtype: int
") QueryParent;
		Standard_Integer QueryParent (const Handle_Standard_Transient & entdad,const Handle_Standard_Transient & entson);
		%feature("compactdefaultargs") SetParams;
		%feature("autodoc", "	* Sets a list of Parameters, i.e. TypedValue, to be handled through an Editor The two lists are parallel, if <params> is longer than <uses>, surnumeral parameters are for general use //! EditForms are created to handle these parameters (list, edit) on the basis of a ParamEditor xst-params-edit //! A use number dispatches the parameter to a given EditForm EditForms are defined as follows Name Use Means xst-params all All Parameters (complete list) xst-params-general 1 Generals xst-params-load 2 LoadFile (no Transfer) xst-params-send 3 SendFile (Write, no Transfer) xst-params-split 4 Split xst-param-read 5 Transfer on Reading xst-param-write 6 Transfer on Writing

	:param params:
	:type params: TColStd_SequenceOfTransient &
	:param uselist:
	:type uselist: TColStd_SequenceOfInteger &
	:rtype: None
") SetParams;
		void SetParams (const TColStd_SequenceOfTransient & params,const TColStd_SequenceOfInteger & uselist);
		%feature("compactdefaultargs") TraceStatics;
		%feature("autodoc", "	* Traces the Statics attached to a given use number If <use> is given positive (normal), the trace is embedded with a header and a trailer If <use> is negative, just values are printed (this allows to make compositions) Remark : use number 5 commands use -2 to be traced Remark : use numbers 4 and 6 command use -3 to be traced

	:param use:
	:type use: int
	:param mode: default value is 0
	:type mode: int
	:rtype: None
") TraceStatics;
		void TraceStatics (const Standard_Integer use,const Standard_Integer mode = 0);
		%feature("compactdefaultargs") DumpShare;
		%feature("autodoc", "	* Dumps contents of the ShareOut (on 'cout')

	:rtype: None
") DumpShare;
		void DumpShare ();
		%feature("compactdefaultargs") ListItems;
		%feature("autodoc", "	* Lists the Labels of all Items of the WorkSession If <label> is defined, lists labels which contain it

	:param label: default value is ""
	:type label: char *
	:rtype: None
") ListItems;
		void ListItems (const char * label = "");
		%feature("compactdefaultargs") ListFinalModifiers;
		%feature("autodoc", "	* Lists the Modifiers of the session (for each one, displays its Label). Listing is done following Ranks (Modifiers are invoked following their ranks) Model Modifiers if <formodel> is True, File Modifiers else

	:param formodel:
	:type formodel: bool
	:rtype: None
") ListFinalModifiers;
		void ListFinalModifiers (const Standard_Boolean formodel);
		%feature("compactdefaultargs") DumpSelection;
		%feature("autodoc", "	* Lists a Selection and its Sources (see SelectionIterator), given its rank in the list

	:param sel:
	:type sel: Handle_IFSelect_Selection &
	:rtype: None
") DumpSelection;
		void DumpSelection (const Handle_IFSelect_Selection & sel);
		%feature("compactdefaultargs") DumpModel;
		%feature("autodoc", "	* Lists the content of the Input Model (if there is one) According level : 0 -> gives only count of Entities and Roots 1 -> Lists also Roots; 2 -> Lists all Entities (by TraceType) 3 -> Performs a call to CheckList (Fails) and lists the result 4 -> as 3 but all CheckList (Fails + Warnings) 5,6,7 : as 3 but resp. Count,List,Labels by Fail 8,9,10 : as 4 but resp. Count,List,Labels by message

	:param level:
	:type level: int
	:param S:
	:type S: Handle_Message_Messenger &
	:rtype: None
") DumpModel;
		void DumpModel (const Standard_Integer level,const Handle_Message_Messenger & S);
		%feature("compactdefaultargs") TraceDumpModel;
		%feature("autodoc", "	* Dumps the current Model (as inherited DumpModel), on currently defined Default Trace File (default is standard output)

	:param mode:
	:type mode: int
	:rtype: None
") TraceDumpModel;
		void TraceDumpModel (const Standard_Integer mode);
		%feature("compactdefaultargs") DumpEntity;
		%feature("autodoc", "	* Dumps a starting entity according to the current norm. To do this, it calls DumpEntity from WorkLibrary. <level> is to be interpreted for each norm : see specific classes of WorkLibrary for it. Generally, 0 if for very basic (only type ...), greater values give more and more details.

	:param ent:
	:type ent: Handle_Standard_Transient &
	:param level:
	:type level: int
	:param S:
	:type S: Handle_Message_Messenger &
	:rtype: None
") DumpEntity;
		void DumpEntity (const Handle_Standard_Transient & ent,const Standard_Integer level,const Handle_Message_Messenger & S);
		%feature("compactdefaultargs") PrintEntityStatus;
		%feature("autodoc", "	* Prints main informations about an entity : its number, type, validity (and checks if any), category, shareds and sharings.. mutable because it can recompute checks as necessary

	:param ent:
	:type ent: Handle_Standard_Transient &
	:param S:
	:type S: Handle_Message_Messenger &
	:rtype: None
") PrintEntityStatus;
		void PrintEntityStatus (const Handle_Standard_Transient & ent,const Handle_Message_Messenger & S);
		%feature("compactdefaultargs") TraceDumpEntity;
		%feature("autodoc", "	* Dumps an entity from the current Model as inherited DumpEntity on currently defined Default Trace File (<level> interpreted according to the Norm, see WorkLibrary)

	:param ent:
	:type ent: Handle_Standard_Transient &
	:param level:
	:type level: int
	:rtype: None
") TraceDumpEntity;
		void TraceDumpEntity (const Handle_Standard_Transient & ent,const Standard_Integer level);
		%feature("compactdefaultargs") PrintCheckList;
		%feature("autodoc", "	* Prints a CheckIterator to the current Trace File, controlled with the current Model complete or fails only, according to <failsonly> <mode> defines the mode of printing 0 : sequential, according entities; else with a CheckCounter 1 : according messages, count of entities 2 : id but with list of entities, designated by their numbers 3 : as 2 but with labels of entities

	:param checklist:
	:type checklist: Interface_CheckIterator &
	:param failsonly:
	:type failsonly: bool
	:param mode:
	:type mode: IFSelect_PrintCount
	:rtype: None
") PrintCheckList;
		void PrintCheckList (const Interface_CheckIterator & checklist,const Standard_Boolean failsonly,const IFSelect_PrintCount mode);
		%feature("compactdefaultargs") PrintSignatureList;
		%feature("autodoc", "	* Prints a SignatureList to the current Trace File, controlled with the current Model <mode> defines the mode of printing (see SignatureList)

	:param signlist:
	:type signlist: Handle_IFSelect_SignatureList &
	:param mode:
	:type mode: IFSelect_PrintCount
	:rtype: None
") PrintSignatureList;
		void PrintSignatureList (const Handle_IFSelect_SignatureList & signlist,const IFSelect_PrintCount mode);
		%feature("compactdefaultargs") EvaluateSelection;
		%feature("autodoc", "	* Displays the list of Entities selected by a Selection (i.e. the result of EvalSelection).

	:param sel:
	:type sel: Handle_IFSelect_Selection &
	:rtype: None
") EvaluateSelection;
		void EvaluateSelection (const Handle_IFSelect_Selection & sel);
		%feature("compactdefaultargs") EvaluateDispatch;
		%feature("autodoc", "	* Displays the result of applying a Dispatch on the input Model (also shows Remainder if there is) <mode> = 0 (default), displays nothing else <mode> = 1 : displays also duplicated entities (because of this dispatch) <mode> = 2 : displays the entities of the starting Model which are not taken by this dispatch (forgotten entities) <mode> = 3 : displays both duplicated and forgotten entities Remark : EvaluateComplete displays these data evaluated for for all the dispatches, if there are several

	:param disp:
	:type disp: Handle_IFSelect_Dispatch &
	:param mode: default value is 0
	:type mode: int
	:rtype: None
") EvaluateDispatch;
		void EvaluateDispatch (const Handle_IFSelect_Dispatch & disp,const Standard_Integer mode = 0);
		%feature("compactdefaultargs") EvaluateComplete;
		%feature("autodoc", "	* Displays the effect of applying the ShareOut on the input Model. <mode> = 0 (default) : displays only roots for each packet, <mode> = 1 : displays all entities for each packet, plus duplicated entities <mode> = 2 : same as <mode> = 1, plus displays forgotten entities (which are in no packet at all)

	:param mode: default value is 0
	:type mode: int
	:rtype: None
") EvaluateComplete;
		void EvaluateComplete (const Standard_Integer mode = 0);
		%feature("compactdefaultargs") ListEntities;
		%feature("autodoc", "	* Internal method which displays an EntityIterator <mode> 0 gives short display (only entity numbers) 1 gives a more complete trace (1 line per Entity) (can be used each time a trace has to be output from a list) 2 gives a form suitable for givelist : (n1,n2,n3...)

	:param iter:
	:type iter: Interface_EntityIterator &
	:param mode:
	:type mode: int
	:rtype: None
") ListEntities;
		void ListEntities (const Interface_EntityIterator & iter,const Standard_Integer mode);
};


%extend IFSelect_WorkSession {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_IFSelect_WorkSession(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_IFSelect_WorkSession::Handle_IFSelect_WorkSession %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_IFSelect_WorkSession;
class Handle_IFSelect_WorkSession : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_IFSelect_WorkSession();
        Handle_IFSelect_WorkSession(const Handle_IFSelect_WorkSession &aHandle);
        Handle_IFSelect_WorkSession(const IFSelect_WorkSession *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_IFSelect_WorkSession DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_IFSelect_WorkSession {
    IFSelect_WorkSession* _get_reference() {
    return (IFSelect_WorkSession*)$self->Access();
    }
};

%extend Handle_IFSelect_WorkSession {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend IFSelect_WorkSession {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IFSelect_Act;
class IFSelect_Act : public IFSelect_Activator {
	public:
		%feature("compactdefaultargs") IFSelect_Act;
		%feature("autodoc", "	* Creates an Act with a name, help and a function mode (Add or AddSet) is given when recording

	:param name:
	:type name: char *
	:param help:
	:type help: char *
	:param func:
	:type func: IFSelect_ActFunc
	:rtype: None
") IFSelect_Act;
		 IFSelect_Act (const char * name,const char * help,const IFSelect_ActFunc func);
		%feature("compactdefaultargs") Do;
		%feature("autodoc", "	* Execution of Command Line. remark that <number> is senseless because each Act brings one and only one function

	:param number:
	:type number: int
	:param pilot:
	:type pilot: Handle_IFSelect_SessionPilot &
	:rtype: IFSelect_ReturnStatus
") Do;
		IFSelect_ReturnStatus Do (const Standard_Integer number,const Handle_IFSelect_SessionPilot & pilot);
		%feature("compactdefaultargs") Help;
		%feature("autodoc", "	* Short Help for commands : returns the help given to create

	:param number:
	:type number: int
	:rtype: char *
") Help;
		const char * Help (const Standard_Integer number);
		%feature("compactdefaultargs") SetGroup;
		%feature("autodoc", "	* Changes the default group name for the following Acts group empty means to come back to default from Activator Also a file name can be precised (to query by getsource)

	:param group:
	:type group: char *
	:param file: default value is ""
	:type file: char *
	:rtype: void
") SetGroup;
		static void SetGroup (const char * group,const char * file = "");
		%feature("compactdefaultargs") AddFunc;
		%feature("autodoc", "	* Adds a function with its name and help : creates an Act then records it as normal function

	:param name:
	:type name: char *
	:param help:
	:type help: char *
	:param func:
	:type func: IFSelect_ActFunc
	:rtype: void
") AddFunc;
		static void AddFunc (const char * name,const char * help,const IFSelect_ActFunc func);
		%feature("compactdefaultargs") AddFSet;
		%feature("autodoc", "	* Adds a function with its name and help : creates an Act then records it as function for XSET (i.e. to create control item)

	:param name:
	:type name: char *
	:param help:
	:type help: char *
	:param func:
	:type func: IFSelect_ActFunc
	:rtype: void
") AddFSet;
		static void AddFSet (const char * name,const char * help,const IFSelect_ActFunc func);
};


%extend IFSelect_Act {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_IFSelect_Act(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_IFSelect_Act::Handle_IFSelect_Act %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_IFSelect_Act;
class Handle_IFSelect_Act : public Handle_IFSelect_Activator {

    public:
        // constructors
        Handle_IFSelect_Act();
        Handle_IFSelect_Act(const Handle_IFSelect_Act &aHandle);
        Handle_IFSelect_Act(const IFSelect_Act *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_IFSelect_Act DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_IFSelect_Act {
    IFSelect_Act* _get_reference() {
    return (IFSelect_Act*)$self->Access();
    }
};

%extend Handle_IFSelect_Act {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend IFSelect_Act {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IFSelect_BasicDumper;
class IFSelect_BasicDumper : public IFSelect_SessionDumper {
	public:
		%feature("compactdefaultargs") IFSelect_BasicDumper;
		%feature("autodoc", "	* Creates a BasicDumper and puts it into the Library of Dumper

	:rtype: None
") IFSelect_BasicDumper;
		 IFSelect_BasicDumper ();
		%feature("compactdefaultargs") WriteOwn;
		%feature("autodoc", "	* Write the Own Parameters of Types defined in package IFSelect Returns True if <item> has been processed, False else

	:param file:
	:type file: IFSelect_SessionFile &
	:param item:
	:type item: Handle_Standard_Transient &
	:rtype: bool
") WriteOwn;
		Standard_Boolean WriteOwn (IFSelect_SessionFile & file,const Handle_Standard_Transient & item);
		%feature("compactdefaultargs") ReadOwn;
		%feature("autodoc", "	* Recognizes and Read Own Parameters for Types of package IFSelect. Returns True if done and <item> created, False else

	:param file:
	:type file: IFSelect_SessionFile &
	:param type:
	:type type: TCollection_AsciiString &
	:param item:
	:type item: Handle_Standard_Transient &
	:rtype: bool
") ReadOwn;
		Standard_Boolean ReadOwn (IFSelect_SessionFile & file,const TCollection_AsciiString & type,Handle_Standard_Transient & item);
};


%extend IFSelect_BasicDumper {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_IFSelect_BasicDumper(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_IFSelect_BasicDumper::Handle_IFSelect_BasicDumper %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_IFSelect_BasicDumper;
class Handle_IFSelect_BasicDumper : public Handle_IFSelect_SessionDumper {

    public:
        // constructors
        Handle_IFSelect_BasicDumper();
        Handle_IFSelect_BasicDumper(const Handle_IFSelect_BasicDumper &aHandle);
        Handle_IFSelect_BasicDumper(const IFSelect_BasicDumper *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_IFSelect_BasicDumper DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_IFSelect_BasicDumper {
    IFSelect_BasicDumper* _get_reference() {
    return (IFSelect_BasicDumper*)$self->Access();
    }
};

%extend Handle_IFSelect_BasicDumper {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend IFSelect_BasicDumper {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IFSelect_CheckCounter;
class IFSelect_CheckCounter : public IFSelect_SignatureList {
	public:
		%feature("compactdefaultargs") IFSelect_CheckCounter;
		%feature("autodoc", "	* Creates a CheckCounter, empty ready to work

	:param withlist: default value is Standard_False
	:type withlist: bool
	:rtype: None
") IFSelect_CheckCounter;
		 IFSelect_CheckCounter (const Standard_Boolean withlist = Standard_False);
		%feature("compactdefaultargs") SetSignature;
		%feature("autodoc", "	* Sets a specific signature Else, the current SignType (in the model) is used

	:param sign:
	:type sign: Handle_MoniTool_SignText &
	:rtype: None
") SetSignature;
		void SetSignature (const Handle_MoniTool_SignText & sign);
		%feature("compactdefaultargs") Signature;
		%feature("autodoc", "	* Returns the Signature;

	:rtype: Handle_MoniTool_SignText
") Signature;
		Handle_MoniTool_SignText Signature ();
		%feature("compactdefaultargs") Analyse;
		%feature("autodoc", "	* Analyses a CheckIterator according a Model (which detains the entities for which the CheckIterator has messages), i.e. counts messages for entities If <original> is True, does not consider final messages but those before interpretation (such as inserting variables : integers, reals, strings) If <failsonly> is True, only Fails are considered Remark : global messages are recorded with a Null entity

	:param list:
	:type list: Interface_CheckIterator &
	:param model:
	:type model: Handle_Interface_InterfaceModel &
	:param original: default value is Standard_False
	:type original: bool
	:param failsonly: default value is Standard_False
	:type failsonly: bool
	:rtype: None
") Analyse;
		void Analyse (const Interface_CheckIterator & list,const Handle_Interface_InterfaceModel & model,const Standard_Boolean original = Standard_False,const Standard_Boolean failsonly = Standard_False);
};


%extend IFSelect_CheckCounter {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_IFSelect_CheckCounter(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_IFSelect_CheckCounter::Handle_IFSelect_CheckCounter %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_IFSelect_CheckCounter;
class Handle_IFSelect_CheckCounter : public Handle_IFSelect_SignatureList {

    public:
        // constructors
        Handle_IFSelect_CheckCounter();
        Handle_IFSelect_CheckCounter(const Handle_IFSelect_CheckCounter &aHandle);
        Handle_IFSelect_CheckCounter(const IFSelect_CheckCounter *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_IFSelect_CheckCounter DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_IFSelect_CheckCounter {
    IFSelect_CheckCounter* _get_reference() {
    return (IFSelect_CheckCounter*)$self->Access();
    }
};

%extend Handle_IFSelect_CheckCounter {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend IFSelect_CheckCounter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IFSelect_DispGlobal;
class IFSelect_DispGlobal : public IFSelect_Dispatch {
	public:
		%feature("compactdefaultargs") IFSelect_DispGlobal;
		%feature("autodoc", "	* Creates a DispGlobal

	:rtype: None
") IFSelect_DispGlobal;
		 IFSelect_DispGlobal ();
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "	* Returns as Label, 'One File for all Input'

	:rtype: TCollection_AsciiString
") Label;
		TCollection_AsciiString Label ();
		%feature("compactdefaultargs") LimitedMax;
		%feature("autodoc", "	* Returns True : maximum equates 1

	:param nbent:
	:type nbent: int
	:param max:
	:type max: int &
	:rtype: bool
") LimitedMax;
		virtual Standard_Boolean LimitedMax (const Standard_Integer nbent,Standard_Integer &OutValue);
		%feature("compactdefaultargs") PacketsCount;
		%feature("autodoc", "	* Returns True (count of packets is well known) and count is 1

	:param G:
	:type G: Interface_Graph &
	:param count:
	:type count: int &
	:rtype: int
") PacketsCount;
		virtual Standard_Integer PacketsCount (const Interface_Graph & G,Standard_Integer &OutValue);
		%feature("compactdefaultargs") Packets;
		%feature("autodoc", "	* Computes the list of produced Packets. It is made of only ONE Packet, which gets the RootResult from the Final Selection. Remark : the inherited exception raising is never activated.

	:param G:
	:type G: Interface_Graph &
	:param packs:
	:type packs: IFGraph_SubPartsIterator &
	:rtype: None
") Packets;
		void Packets (const Interface_Graph & G,IFGraph_SubPartsIterator & packs);
};


%extend IFSelect_DispGlobal {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_IFSelect_DispGlobal(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_IFSelect_DispGlobal::Handle_IFSelect_DispGlobal %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_IFSelect_DispGlobal;
class Handle_IFSelect_DispGlobal : public Handle_IFSelect_Dispatch {

    public:
        // constructors
        Handle_IFSelect_DispGlobal();
        Handle_IFSelect_DispGlobal(const Handle_IFSelect_DispGlobal &aHandle);
        Handle_IFSelect_DispGlobal(const IFSelect_DispGlobal *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_IFSelect_DispGlobal DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_IFSelect_DispGlobal {
    IFSelect_DispGlobal* _get_reference() {
    return (IFSelect_DispGlobal*)$self->Access();
    }
};

%extend Handle_IFSelect_DispGlobal {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend IFSelect_DispGlobal {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IFSelect_DispPerCount;
class IFSelect_DispPerCount : public IFSelect_Dispatch {
	public:
		%feature("compactdefaultargs") IFSelect_DispPerCount;
		%feature("autodoc", "	* Creates a DispPerCount with no Count (default value 1)

	:rtype: None
") IFSelect_DispPerCount;
		 IFSelect_DispPerCount ();
		%feature("compactdefaultargs") Count;
		%feature("autodoc", "	* Returns the Count Parameter used for splitting

	:rtype: Handle_IFSelect_IntParam
") Count;
		Handle_IFSelect_IntParam Count ();
		%feature("compactdefaultargs") SetCount;
		%feature("autodoc", "	* Sets a new Parameter for Count

	:param count:
	:type count: Handle_IFSelect_IntParam &
	:rtype: None
") SetCount;
		void SetCount (const Handle_IFSelect_IntParam & count);
		%feature("compactdefaultargs") CountValue;
		%feature("autodoc", "	* Returns the effective value of the count parameter (if Count Parameter not Set or value not positive, returns 1)

	:rtype: int
") CountValue;
		Standard_Integer CountValue ();
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "	* Returns as Label, 'One File per <count> Input Entities'

	:rtype: TCollection_AsciiString
") Label;
		TCollection_AsciiString Label ();
		%feature("compactdefaultargs") LimitedMax;
		%feature("autodoc", "	* Returns True, maximum count is given as <nbent>

	:param nbent:
	:type nbent: int
	:param max:
	:type max: int &
	:rtype: bool
") LimitedMax;
		virtual Standard_Boolean LimitedMax (const Standard_Integer nbent,Standard_Integer &OutValue);
		%feature("compactdefaultargs") PacketsCount;
		%feature("autodoc", "	* Returns True (count is easy to know) and count is computed from length of input list (RootResult from Final Selection)

	:param G:
	:type G: Interface_Graph &
	:param count:
	:type count: int &
	:rtype: int
") PacketsCount;
		virtual Standard_Integer PacketsCount (const Interface_Graph & G,Standard_Integer &OutValue);
		%feature("compactdefaultargs") Packets;
		%feature("autodoc", "	* Computes the list of produced Packets. It defines Packets in order to have at most <Count> Entities per Packet, Entities are given by RootResult from the Final Selection.

	:param G:
	:type G: Interface_Graph &
	:param packs:
	:type packs: IFGraph_SubPartsIterator &
	:rtype: None
") Packets;
		void Packets (const Interface_Graph & G,IFGraph_SubPartsIterator & packs);
};


%extend IFSelect_DispPerCount {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_IFSelect_DispPerCount(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_IFSelect_DispPerCount::Handle_IFSelect_DispPerCount %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_IFSelect_DispPerCount;
class Handle_IFSelect_DispPerCount : public Handle_IFSelect_Dispatch {

    public:
        // constructors
        Handle_IFSelect_DispPerCount();
        Handle_IFSelect_DispPerCount(const Handle_IFSelect_DispPerCount &aHandle);
        Handle_IFSelect_DispPerCount(const IFSelect_DispPerCount *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_IFSelect_DispPerCount DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_IFSelect_DispPerCount {
    IFSelect_DispPerCount* _get_reference() {
    return (IFSelect_DispPerCount*)$self->Access();
    }
};

%extend Handle_IFSelect_DispPerCount {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend IFSelect_DispPerCount {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IFSelect_DispPerFiles;
class IFSelect_DispPerFiles : public IFSelect_Dispatch {
	public:
		%feature("compactdefaultargs") IFSelect_DispPerFiles;
		%feature("autodoc", "	* Creates a DispPerFiles with no Count (default value 1 file)

	:rtype: None
") IFSelect_DispPerFiles;
		 IFSelect_DispPerFiles ();
		%feature("compactdefaultargs") Count;
		%feature("autodoc", "	* Returns the Count Parameter used for splitting

	:rtype: Handle_IFSelect_IntParam
") Count;
		Handle_IFSelect_IntParam Count ();
		%feature("compactdefaultargs") SetCount;
		%feature("autodoc", "	* Sets a new Parameter for Count

	:param count:
	:type count: Handle_IFSelect_IntParam &
	:rtype: None
") SetCount;
		void SetCount (const Handle_IFSelect_IntParam & count);
		%feature("compactdefaultargs") CountValue;
		%feature("autodoc", "	* Returns the effective value of the count parameter (if Count Parameter not Set or value not positive, returns 1)

	:rtype: int
") CountValue;
		Standard_Integer CountValue ();
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "	* Returns as Label, 'Maximum <count> Files'

	:rtype: TCollection_AsciiString
") Label;
		TCollection_AsciiString Label ();
		%feature("compactdefaultargs") LimitedMax;
		%feature("autodoc", "	* Returns True, maximum count is given as CountValue

	:param nbent:
	:type nbent: int
	:param max:
	:type max: int &
	:rtype: bool
") LimitedMax;
		virtual Standard_Boolean LimitedMax (const Standard_Integer nbent,Standard_Integer &OutValue);
		%feature("compactdefaultargs") PacketsCount;
		%feature("autodoc", "	* Returns True (count is easy to know) and count is the minimum value between length of input list and CountValue

	:param G:
	:type G: Interface_Graph &
	:param count:
	:type count: int &
	:rtype: int
") PacketsCount;
		virtual Standard_Integer PacketsCount (const Interface_Graph & G,Standard_Integer &OutValue);
		%feature("compactdefaultargs") Packets;
		%feature("autodoc", "	* Computes the list of produced Packets. It defines Packets in order to have <Count> Packets, except if the input count of Entities is lower. Entities are given by RootResult from the Final Selection.

	:param G:
	:type G: Interface_Graph &
	:param packs:
	:type packs: IFGraph_SubPartsIterator &
	:rtype: None
") Packets;
		void Packets (const Interface_Graph & G,IFGraph_SubPartsIterator & packs);
};


%extend IFSelect_DispPerFiles {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_IFSelect_DispPerFiles(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_IFSelect_DispPerFiles::Handle_IFSelect_DispPerFiles %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_IFSelect_DispPerFiles;
class Handle_IFSelect_DispPerFiles : public Handle_IFSelect_Dispatch {

    public:
        // constructors
        Handle_IFSelect_DispPerFiles();
        Handle_IFSelect_DispPerFiles(const Handle_IFSelect_DispPerFiles &aHandle);
        Handle_IFSelect_DispPerFiles(const IFSelect_DispPerFiles *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_IFSelect_DispPerFiles DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_IFSelect_DispPerFiles {
    IFSelect_DispPerFiles* _get_reference() {
    return (IFSelect_DispPerFiles*)$self->Access();
    }
};

%extend Handle_IFSelect_DispPerFiles {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend IFSelect_DispPerFiles {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IFSelect_DispPerOne;
class IFSelect_DispPerOne : public IFSelect_Dispatch {
	public:
		%feature("compactdefaultargs") IFSelect_DispPerOne;
		%feature("autodoc", "	* Creates a DispPerOne

	:rtype: None
") IFSelect_DispPerOne;
		 IFSelect_DispPerOne ();
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "	* Returns as Label, 'One File per Input Entity'

	:rtype: TCollection_AsciiString
") Label;
		TCollection_AsciiString Label ();
		%feature("compactdefaultargs") LimitedMax;
		%feature("autodoc", "	* Returns True, maximum limit is given as <nbent>

	:param nbent:
	:type nbent: int
	:param max:
	:type max: int &
	:rtype: bool
") LimitedMax;
		virtual Standard_Boolean LimitedMax (const Standard_Integer nbent,Standard_Integer &OutValue);
		%feature("compactdefaultargs") PacketsCount;
		%feature("autodoc", "	* Returns True (count is easy to know) and count is the length of the input list (RootResult from FinalSelection)

	:param G:
	:type G: Interface_Graph &
	:param count:
	:type count: int &
	:rtype: int
") PacketsCount;
		virtual Standard_Integer PacketsCount (const Interface_Graph & G,Standard_Integer &OutValue);
		%feature("compactdefaultargs") Packets;
		%feature("autodoc", "	* Returns the list of produced Packets. It defines one Packet per Entity given by RootResult from the Final Selection.

	:param G:
	:type G: Interface_Graph &
	:param packs:
	:type packs: IFGraph_SubPartsIterator &
	:rtype: None
") Packets;
		void Packets (const Interface_Graph & G,IFGraph_SubPartsIterator & packs);
};


%extend IFSelect_DispPerOne {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_IFSelect_DispPerOne(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_IFSelect_DispPerOne::Handle_IFSelect_DispPerOne %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_IFSelect_DispPerOne;
class Handle_IFSelect_DispPerOne : public Handle_IFSelect_Dispatch {

    public:
        // constructors
        Handle_IFSelect_DispPerOne();
        Handle_IFSelect_DispPerOne(const Handle_IFSelect_DispPerOne &aHandle);
        Handle_IFSelect_DispPerOne(const IFSelect_DispPerOne *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_IFSelect_DispPerOne DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_IFSelect_DispPerOne {
    IFSelect_DispPerOne* _get_reference() {
    return (IFSelect_DispPerOne*)$self->Access();
    }
};

%extend Handle_IFSelect_DispPerOne {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend IFSelect_DispPerOne {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IFSelect_DispPerSignature;
class IFSelect_DispPerSignature : public IFSelect_Dispatch {
	public:
		%feature("compactdefaultargs") IFSelect_DispPerSignature;
		%feature("autodoc", "	* Creates a DispPerSignature with no SignCounter (by default, produces only one packet)

	:rtype: None
") IFSelect_DispPerSignature;
		 IFSelect_DispPerSignature ();
		%feature("compactdefaultargs") SignCounter;
		%feature("autodoc", "	* Returns the SignCounter used for splitting

	:rtype: Handle_IFSelect_SignCounter
") SignCounter;
		Handle_IFSelect_SignCounter SignCounter ();
		%feature("compactdefaultargs") SetSignCounter;
		%feature("autodoc", "	* Sets a SignCounter for sort Remark : it is set to record lists of entities, not only counts

	:param sign:
	:type sign: Handle_IFSelect_SignCounter &
	:rtype: None
") SetSignCounter;
		void SetSignCounter (const Handle_IFSelect_SignCounter & sign);
		%feature("compactdefaultargs") SignName;
		%feature("autodoc", "	* Returns the name of the SignCounter, which caracterises the sorting criterium for this Dispatch

	:rtype: char *
") SignName;
		const char * SignName ();
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "	* Returns as Label, 'One File per Signature <name>'

	:rtype: TCollection_AsciiString
") Label;
		TCollection_AsciiString Label ();
		%feature("compactdefaultargs") LimitedMax;
		%feature("autodoc", "	* Returns True, maximum count is given as <nbent>

	:param nbent:
	:type nbent: int
	:param max:
	:type max: int &
	:rtype: bool
") LimitedMax;
		virtual Standard_Boolean LimitedMax (const Standard_Integer nbent,Standard_Integer &OutValue);
		%feature("compactdefaultargs") Packets;
		%feature("autodoc", "	* Computes the list of produced Packets. It defines Packets from the SignCounter, which sirts the input Entities per Signature (specific of the SignCounter).

	:param G:
	:type G: Interface_Graph &
	:param packs:
	:type packs: IFGraph_SubPartsIterator &
	:rtype: None
") Packets;
		void Packets (const Interface_Graph & G,IFGraph_SubPartsIterator & packs);
};


%extend IFSelect_DispPerSignature {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_IFSelect_DispPerSignature(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_IFSelect_DispPerSignature::Handle_IFSelect_DispPerSignature %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_IFSelect_DispPerSignature;
class Handle_IFSelect_DispPerSignature : public Handle_IFSelect_Dispatch {

    public:
        // constructors
        Handle_IFSelect_DispPerSignature();
        Handle_IFSelect_DispPerSignature(const Handle_IFSelect_DispPerSignature &aHandle);
        Handle_IFSelect_DispPerSignature(const IFSelect_DispPerSignature *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_IFSelect_DispPerSignature DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_IFSelect_DispPerSignature {
    IFSelect_DispPerSignature* _get_reference() {
    return (IFSelect_DispPerSignature*)$self->Access();
    }
};

%extend Handle_IFSelect_DispPerSignature {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend IFSelect_DispPerSignature {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IFSelect_Modifier;
class IFSelect_Modifier : public IFSelect_GeneralModifier {
	public:
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* This deferred method defines the action specific to each class of Modifier. It is called by a ModelCopier, once the Model generated and filled. ModelCopier has already checked the criteria (Dispatch, Model Rank, Selection) before calling it. //! <ctx> detains informations about original data and selection. The result of copying, on which modifications are to be done, is <target>. <TC> allows to run additional copies as required //! In case of Error, use methods CCheck from the ContextModif to aknowledge an entity Check or a Global Check with messages

	:param ctx:
	:type ctx: IFSelect_ContextModif &
	:param target:
	:type target: Handle_Interface_InterfaceModel &
	:param protocol:
	:type protocol: Handle_Interface_Protocol &
	:param TC:
	:type TC: Interface_CopyTool &
	:rtype: void
") Perform;
		virtual void Perform (IFSelect_ContextModif & ctx,const Handle_Interface_InterfaceModel & target,const Handle_Interface_Protocol & protocol,Interface_CopyTool & TC);
};


%extend IFSelect_Modifier {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_IFSelect_Modifier(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_IFSelect_Modifier::Handle_IFSelect_Modifier %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_IFSelect_Modifier;
class Handle_IFSelect_Modifier : public Handle_IFSelect_GeneralModifier {

    public:
        // constructors
        Handle_IFSelect_Modifier();
        Handle_IFSelect_Modifier(const Handle_IFSelect_Modifier &aHandle);
        Handle_IFSelect_Modifier(const IFSelect_Modifier *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_IFSelect_Modifier DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_IFSelect_Modifier {
    IFSelect_Modifier* _get_reference() {
    return (IFSelect_Modifier*)$self->Access();
    }
};

%extend Handle_IFSelect_Modifier {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend IFSelect_Modifier {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IFSelect_ParamEditor;
class IFSelect_ParamEditor : public IFSelect_Editor {
	public:
		%feature("compactdefaultargs") IFSelect_ParamEditor;
		%feature("autodoc", "	* Creates a ParamEditor, empty, with a maximum count of params (default is 100) And a label, by default it will be 'Param Editor'

	:param nbmax: default value is 100
	:type nbmax: int
	:param label: default value is ""
	:type label: char *
	:rtype: None
") IFSelect_ParamEditor;
		 IFSelect_ParamEditor (const Standard_Integer nbmax = 100,const char * label = "");
		%feature("compactdefaultargs") AddValue;
		%feature("autodoc", "	* Adds a TypedValue By default, its short name equates its complete name, it can be explicited

	:param val:
	:type val: Handle_Interface_TypedValue &
	:param shortname: default value is ""
	:type shortname: char *
	:rtype: None
") AddValue;
		void AddValue (const Handle_Interface_TypedValue & val,const char * shortname = "");
		%feature("compactdefaultargs") AddConstantText;
		%feature("autodoc", "	* Adds a Constant Text, it will be Read Only By default, its long name equates its shortname

	:param val:
	:type val: char *
	:param shortname:
	:type shortname: char *
	:param completename: default value is ""
	:type completename: char *
	:rtype: None
") AddConstantText;
		void AddConstantText (const char * val,const char * shortname,const char * completename = "");
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "	:rtype: TCollection_AsciiString
") Label;
		TCollection_AsciiString Label ();
		%feature("compactdefaultargs") Recognize;
		%feature("autodoc", "	:param form:
	:type form: Handle_IFSelect_EditForm &
	:rtype: bool
") Recognize;
		Standard_Boolean Recognize (const Handle_IFSelect_EditForm & form);
		%feature("compactdefaultargs") StringValue;
		%feature("autodoc", "	:param form:
	:type form: Handle_IFSelect_EditForm &
	:param num:
	:type num: int
	:rtype: Handle_TCollection_HAsciiString
") StringValue;
		Handle_TCollection_HAsciiString StringValue (const Handle_IFSelect_EditForm & form,const Standard_Integer num);
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "	:param form:
	:type form: Handle_IFSelect_EditForm &
	:param ent:
	:type ent: Handle_Standard_Transient &
	:param model:
	:type model: Handle_Interface_InterfaceModel &
	:rtype: bool
") Load;
		Standard_Boolean Load (const Handle_IFSelect_EditForm & form,const Handle_Standard_Transient & ent,const Handle_Interface_InterfaceModel & model);
		%feature("compactdefaultargs") Apply;
		%feature("autodoc", "	:param form:
	:type form: Handle_IFSelect_EditForm &
	:param ent:
	:type ent: Handle_Standard_Transient &
	:param model:
	:type model: Handle_Interface_InterfaceModel &
	:rtype: bool
") Apply;
		Standard_Boolean Apply (const Handle_IFSelect_EditForm & form,const Handle_Standard_Transient & ent,const Handle_Interface_InterfaceModel & model);
		%feature("compactdefaultargs") StaticEditor;
		%feature("autodoc", "	* Returns a ParamEditor to work on the Static Parameters of which names are listed in <list> Null Handle if <list> is null or empty

	:param list:
	:type list: Handle_TColStd_HSequenceOfHAsciiString &
	:param label: default value is ""
	:type label: char *
	:rtype: Handle_IFSelect_ParamEditor
") StaticEditor;
		static Handle_IFSelect_ParamEditor StaticEditor (const Handle_TColStd_HSequenceOfHAsciiString & list,const char * label = "");
};


%extend IFSelect_ParamEditor {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_IFSelect_ParamEditor(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_IFSelect_ParamEditor::Handle_IFSelect_ParamEditor %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_IFSelect_ParamEditor;
class Handle_IFSelect_ParamEditor : public Handle_IFSelect_Editor {

    public:
        // constructors
        Handle_IFSelect_ParamEditor();
        Handle_IFSelect_ParamEditor(const Handle_IFSelect_ParamEditor &aHandle);
        Handle_IFSelect_ParamEditor(const IFSelect_ParamEditor *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_IFSelect_ParamEditor DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_IFSelect_ParamEditor {
    IFSelect_ParamEditor* _get_reference() {
    return (IFSelect_ParamEditor*)$self->Access();
    }
};

%extend Handle_IFSelect_ParamEditor {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend IFSelect_ParamEditor {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IFSelect_SelectBase;
class IFSelect_SelectBase : public IFSelect_Selection {
	public:
		%feature("compactdefaultargs") FillIterator;
		%feature("autodoc", "	* Puts in an Iterator the Selections from which 'me' depends This list is empty for all SelectBase type Selections

	:param iter:
	:type iter: IFSelect_SelectionIterator &
	:rtype: None
") FillIterator;
		void FillIterator (IFSelect_SelectionIterator & iter);
};


%extend IFSelect_SelectBase {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_IFSelect_SelectBase(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_IFSelect_SelectBase::Handle_IFSelect_SelectBase %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_IFSelect_SelectBase;
class Handle_IFSelect_SelectBase : public Handle_IFSelect_Selection {

    public:
        // constructors
        Handle_IFSelect_SelectBase();
        Handle_IFSelect_SelectBase(const Handle_IFSelect_SelectBase &aHandle);
        Handle_IFSelect_SelectBase(const IFSelect_SelectBase *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_IFSelect_SelectBase DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_IFSelect_SelectBase {
    IFSelect_SelectBase* _get_reference() {
    return (IFSelect_SelectBase*)$self->Access();
    }
};

%extend Handle_IFSelect_SelectBase {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend IFSelect_SelectBase {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IFSelect_SelectCombine;
class IFSelect_SelectCombine : public IFSelect_Selection {
	public:
		%feature("compactdefaultargs") NbInputs;
		%feature("autodoc", "	* Returns the count of Input Selections

	:rtype: int
") NbInputs;
		Standard_Integer NbInputs ();
		%feature("compactdefaultargs") Input;
		%feature("autodoc", "	* Returns an Input Selection, given its rank in the list

	:param num:
	:type num: int
	:rtype: Handle_IFSelect_Selection
") Input;
		Handle_IFSelect_Selection Input (const Standard_Integer num);
		%feature("compactdefaultargs") InputRank;
		%feature("autodoc", "	* Returns the rank of an input Selection, 0 if not in the list. Most generally, its value is meaningless, except for testing the presence of an input Selection : - == 0 if <sel> is not an input for <self> - > 0 if <sel> is an input for <self>

	:param sel:
	:type sel: Handle_IFSelect_Selection &
	:rtype: int
") InputRank;
		Standard_Integer InputRank (const Handle_IFSelect_Selection & sel);
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* Adds a Selection to the filling list By default, adds it to the end of the list A Positive rank less then NbInputs gives an insertion rank (InsertBefore : the new <atnum>th item of the list is <sel>)

	:param sel:
	:type sel: Handle_IFSelect_Selection &
	:param atnum: default value is 0
	:type atnum: int
	:rtype: None
") Add;
		void Add (const Handle_IFSelect_Selection & sel,const Standard_Integer atnum = 0);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	* Removes an input Selection. Returns True if Done, False, if <sel> is not an input for <self>

	:param sel:
	:type sel: Handle_IFSelect_Selection &
	:rtype: bool
") Remove;
		Standard_Boolean Remove (const Handle_IFSelect_Selection & sel);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	* Removes an input Selection, given its rank in the list Returns True if Done, False if <num> is out of range

	:param num:
	:type num: int
	:rtype: bool
") Remove;
		Standard_Boolean Remove (const Standard_Integer num);
		%feature("compactdefaultargs") FillIterator;
		%feature("autodoc", "	* Puts in an Iterator the Selections from which 'me' depends That is to say, the list of Input Selections

	:param iter:
	:type iter: IFSelect_SelectionIterator &
	:rtype: None
") FillIterator;
		void FillIterator (IFSelect_SelectionIterator & iter);
};


%extend IFSelect_SelectCombine {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_IFSelect_SelectCombine(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_IFSelect_SelectCombine::Handle_IFSelect_SelectCombine %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_IFSelect_SelectCombine;
class Handle_IFSelect_SelectCombine : public Handle_IFSelect_Selection {

    public:
        // constructors
        Handle_IFSelect_SelectCombine();
        Handle_IFSelect_SelectCombine(const Handle_IFSelect_SelectCombine &aHandle);
        Handle_IFSelect_SelectCombine(const IFSelect_SelectCombine *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_IFSelect_SelectCombine DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_IFSelect_SelectCombine {
    IFSelect_SelectCombine* _get_reference() {
    return (IFSelect_SelectCombine*)$self->Access();
    }
};

%extend Handle_IFSelect_SelectCombine {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend IFSelect_SelectCombine {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IFSelect_SelectControl;
class IFSelect_SelectControl : public IFSelect_Selection {
	public:
		%feature("compactdefaultargs") MainInput;
		%feature("autodoc", "	* Returns the Main Input Selection

	:rtype: Handle_IFSelect_Selection
") MainInput;
		Handle_IFSelect_Selection MainInput ();
		%feature("compactdefaultargs") HasSecondInput;
		%feature("autodoc", "	* Returns True if a Control Input is defined Thus, Result can be computed differently if there is a Control Input or if there is none

	:rtype: bool
") HasSecondInput;
		Standard_Boolean HasSecondInput ();
		%feature("compactdefaultargs") SecondInput;
		%feature("autodoc", "	* Returns the Control Input Selection, or a Null Handle

	:rtype: Handle_IFSelect_Selection
") SecondInput;
		Handle_IFSelect_Selection SecondInput ();
		%feature("compactdefaultargs") SetMainInput;
		%feature("autodoc", "	* Sets a Selection to be the Main Input

	:param sel:
	:type sel: Handle_IFSelect_Selection &
	:rtype: None
") SetMainInput;
		void SetMainInput (const Handle_IFSelect_Selection & sel);
		%feature("compactdefaultargs") SetSecondInput;
		%feature("autodoc", "	* Sets a Selection to be the Control Input

	:param sel:
	:type sel: Handle_IFSelect_Selection &
	:rtype: None
") SetSecondInput;
		void SetSecondInput (const Handle_IFSelect_Selection & sel);
		%feature("compactdefaultargs") FillIterator;
		%feature("autodoc", "	* Puts in an Iterator the Selections from which 'me' depends That is to say, the list of Input Selections

	:param iter:
	:type iter: IFSelect_SelectionIterator &
	:rtype: None
") FillIterator;
		void FillIterator (IFSelect_SelectionIterator & iter);
};


%extend IFSelect_SelectControl {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_IFSelect_SelectControl(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_IFSelect_SelectControl::Handle_IFSelect_SelectControl %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_IFSelect_SelectControl;
class Handle_IFSelect_SelectControl : public Handle_IFSelect_Selection {

    public:
        // constructors
        Handle_IFSelect_SelectControl();
        Handle_IFSelect_SelectControl(const Handle_IFSelect_SelectControl &aHandle);
        Handle_IFSelect_SelectControl(const IFSelect_SelectControl *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_IFSelect_SelectControl DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_IFSelect_SelectControl {
    IFSelect_SelectControl* _get_reference() {
    return (IFSelect_SelectControl*)$self->Access();
    }
};

%extend Handle_IFSelect_SelectControl {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend IFSelect_SelectControl {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IFSelect_SelectDeduct;
class IFSelect_SelectDeduct : public IFSelect_Selection {
	public:
		%feature("compactdefaultargs") SetInput;
		%feature("autodoc", "	* Defines or Changes the Input Selection

	:param sel:
	:type sel: Handle_IFSelect_Selection &
	:rtype: None
") SetInput;
		void SetInput (const Handle_IFSelect_Selection & sel);
		%feature("compactdefaultargs") Input;
		%feature("autodoc", "	* Returns the Input Selection

	:rtype: Handle_IFSelect_Selection
") Input;
		Handle_IFSelect_Selection Input ();
		%feature("compactdefaultargs") HasInput;
		%feature("autodoc", "	* Returns True if the Input Selection is defined, False else

	:rtype: bool
") HasInput;
		Standard_Boolean HasInput ();
		%feature("compactdefaultargs") HasAlternate;
		%feature("autodoc", "	* Tells if an Alternate List has been set, i.e. : the Alternate Definition is present and set

	:rtype: bool
") HasAlternate;
		Standard_Boolean HasAlternate ();
		%feature("compactdefaultargs") Alternate;
		%feature("autodoc", "	* Returns the Alternate Definition It is returned modifiable, hence an already defined SelectPointed can be used But if it was not yet defined, it is created the first time //! It is exploited by InputResult

	:rtype: Handle_IFSelect_SelectPointed
") Alternate;
		Handle_IFSelect_SelectPointed Alternate ();
		%feature("compactdefaultargs") InputResult;
		%feature("autodoc", "	* Returns the Result determined by Input Selection, as Unique if Input Selection is not defined, returns an empty list. //! If Alternate is set, InputResult takes its definition instead of calling the Input Selection, then clears it

	:param G:
	:type G: Interface_Graph &
	:rtype: Interface_EntityIterator
") InputResult;
		Interface_EntityIterator InputResult (const Interface_Graph & G);
		%feature("compactdefaultargs") FillIterator;
		%feature("autodoc", "	* Puts in an Iterator the Selections from which 'me' depends This list contains one Selection : the InputSelection

	:param iter:
	:type iter: IFSelect_SelectionIterator &
	:rtype: None
") FillIterator;
		void FillIterator (IFSelect_SelectionIterator & iter);
};


%extend IFSelect_SelectDeduct {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_IFSelect_SelectDeduct(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_IFSelect_SelectDeduct::Handle_IFSelect_SelectDeduct %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_IFSelect_SelectDeduct;
class Handle_IFSelect_SelectDeduct : public Handle_IFSelect_Selection {

    public:
        // constructors
        Handle_IFSelect_SelectDeduct();
        Handle_IFSelect_SelectDeduct(const Handle_IFSelect_SelectDeduct &aHandle);
        Handle_IFSelect_SelectDeduct(const IFSelect_SelectDeduct *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_IFSelect_SelectDeduct DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_IFSelect_SelectDeduct {
    IFSelect_SelectDeduct* _get_reference() {
    return (IFSelect_SelectDeduct*)$self->Access();
    }
};

%extend Handle_IFSelect_SelectDeduct {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend IFSelect_SelectDeduct {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IFSelect_SessionPilot;
class IFSelect_SessionPilot : public IFSelect_Activator {
	public:
		%feature("compactdefaultargs") IFSelect_SessionPilot;
		%feature("autodoc", "	* Creates an empty SessionPilot, with a prompt which will be displayed on querying commands. If not precised (''), this prompt is set to 'Test-XSTEP>'

	:param prompt: default value is ""
	:type prompt: char *
	:rtype: None
") IFSelect_SessionPilot;
		 IFSelect_SessionPilot (const char * prompt = "");
		%feature("compactdefaultargs") Session;
		%feature("autodoc", "	* Returns the WorkSession which is worked on

	:rtype: Handle_IFSelect_WorkSession
") Session;
		Handle_IFSelect_WorkSession Session ();
		%feature("compactdefaultargs") Library;
		%feature("autodoc", "	* Returns the WorKlibrary (Null if not set). WorkLibrary is used to Read and Write Files, according to the Norm

	:rtype: Handle_IFSelect_WorkLibrary
") Library;
		Handle_IFSelect_WorkLibrary Library ();
		%feature("compactdefaultargs") RecordMode;
		%feature("autodoc", "	* Returns the Record Mode for Commands. Default is False.

	:rtype: bool
") RecordMode;
		Standard_Boolean RecordMode ();
		%feature("compactdefaultargs") SetSession;
		%feature("autodoc", "	* Sets a WorkSession to be worked on

	:param WS:
	:type WS: Handle_IFSelect_WorkSession &
	:rtype: None
") SetSession;
		void SetSession (const Handle_IFSelect_WorkSession & WS);
		%feature("compactdefaultargs") SetLibrary;
		%feature("autodoc", "	* Sets a WorkLibrary

	:param WL:
	:type WL: Handle_IFSelect_WorkLibrary &
	:rtype: None
") SetLibrary;
		void SetLibrary (const Handle_IFSelect_WorkLibrary & WL);
		%feature("compactdefaultargs") SetRecordMode;
		%feature("autodoc", "	* Changes the RecordMode.

	:param mode:
	:type mode: bool
	:rtype: None
") SetRecordMode;
		void SetRecordMode (const Standard_Boolean mode);
		%feature("compactdefaultargs") SetCommandLine;
		%feature("autodoc", "	* Sets the value of the Command Line to be interpreted Also prepares the interpretation (splitting by blanks)

	:param command:
	:type command: TCollection_AsciiString &
	:rtype: None
") SetCommandLine;
		void SetCommandLine (const TCollection_AsciiString & command);
		%feature("compactdefaultargs") CommandLine;
		%feature("autodoc", "	* Returns the Command Line to be interpreted

	:rtype: TCollection_AsciiString
") CommandLine;
		const TCollection_AsciiString & CommandLine ();
		%feature("compactdefaultargs") CommandPart;
		%feature("autodoc", "	* Returns the part of the command line which begins at argument <numarg> between 0 and NbWords-1 (by default, all the line) Empty string if out of range

	:param numarg: default value is 0
	:type numarg: int
	:rtype: char *
") CommandPart;
		const char * CommandPart (const Standard_Integer numarg = 0);
		%feature("compactdefaultargs") NbWords;
		%feature("autodoc", "	* Returns the count of words of the Command Line, separated by blanks : 0 if empty, one if a command without args, else it gives the count of args minus one. Warning : limited to 10 (command title + 9 args)

	:rtype: int
") NbWords;
		Standard_Integer NbWords ();
		%feature("compactdefaultargs") Word;
		%feature("autodoc", "	* Returns a word given its rank in the Command Line. Begins at 0 which is the Command Title, 1 is the 1st arg., etc...

	:param num:
	:type num: int
	:rtype: TCollection_AsciiString
") Word;
		const TCollection_AsciiString & Word (const Standard_Integer num);
		%feature("compactdefaultargs") Arg;
		%feature("autodoc", "	* Returns a word given its rank, as a CString. As for Word, begins at 0 (the command name), etc...

	:param num:
	:type num: int
	:rtype: char *
") Arg;
		const char * Arg (const Standard_Integer num);
		%feature("compactdefaultargs") RemoveWord;
		%feature("autodoc", "	* Removes a word given its rank. Returns True if Done, False if <num> is out of range

	:param num:
	:type num: int
	:rtype: bool
") RemoveWord;
		Standard_Boolean RemoveWord (const Standard_Integer num);
		%feature("compactdefaultargs") NbCommands;
		%feature("autodoc", "	* Returns the count of recorded Commands

	:rtype: int
") NbCommands;
		Standard_Integer NbCommands ();
		%feature("compactdefaultargs") Command;
		%feature("autodoc", "	* Returns a recorded Command, given its rank (from 1)

	:param num:
	:type num: int
	:rtype: TCollection_AsciiString
") Command;
		const TCollection_AsciiString & Command (const Standard_Integer num);
		%feature("compactdefaultargs") RecordItem;
		%feature("autodoc", "	* Allows to associate a Transient Value with the last execution as a partial result Returns RetDone if item is not Null, RetFail if item is Null Remark : it is nullified for each Perform

	:param item:
	:type item: Handle_Standard_Transient &
	:rtype: IFSelect_ReturnStatus
") RecordItem;
		IFSelect_ReturnStatus RecordItem (const Handle_Standard_Transient & item);
		%feature("compactdefaultargs") RecordedItem;
		%feature("autodoc", "	* Returns the Transient Object which was recorded with the current Line Command. If none was, returns a Null Handle

	:rtype: Handle_Standard_Transient
") RecordedItem;
		Handle_Standard_Transient RecordedItem ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	* Clears the recorded informations (commands, objects)

	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") ReadScript;
		%feature("autodoc", "	* Reads commands from a Script File, named <file>. By default (file = ''), reads from standard input with a prompt Else (reading from a file), the read commands are displayed onto standard output. Allows nested reads. Reading is stopped either by command x or exit, or by reaching end of file Return Value follows the rules of Do : RetEnd for normal end, RetFail if script could not be opened

	:param file: default value is ""
	:type file: char *
	:rtype: IFSelect_ReturnStatus
") ReadScript;
		IFSelect_ReturnStatus ReadScript (const char * file = "");
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Executes the Command, itself (for built-in commands, which have priority) or by using the list of Activators. The value returned is : RetVoid if nothing done (void command) RetDone if execution OK, RetEnd if END OF SESSION, RetError if command unknown or incorrect, RetFail if error on execution If execution is OK and RecordMode is set, this Command Line is recorded to the list (see below).

	:rtype: IFSelect_ReturnStatus
") Perform;
		IFSelect_ReturnStatus Perform ();
		%feature("compactdefaultargs") ExecuteAlias;
		%feature("autodoc", "	* Executes the Commands, except that the command name (word 0) is aliased. The rest of the command line is unchanged If <alias> is empty, Executes with no change //! Error status is returned if the alias is unknown as command

	:param aliasname:
	:type aliasname: TCollection_AsciiString &
	:rtype: IFSelect_ReturnStatus
") ExecuteAlias;
		IFSelect_ReturnStatus ExecuteAlias (const TCollection_AsciiString & aliasname);
		%feature("compactdefaultargs") Execute;
		%feature("autodoc", "	* Sets the Command then tries to execute it. Return value : same as for Perform

	:param command:
	:type command: TCollection_AsciiString &
	:rtype: IFSelect_ReturnStatus
") Execute;
		IFSelect_ReturnStatus Execute (const TCollection_AsciiString & command);
		%feature("compactdefaultargs") ExecuteCounter;
		%feature("autodoc", "	* Executes a Counter in a general way If <numword> is greater than count of command words, it counts all the model. Else it considers the word <numword> as the identifier of a Selection <mode> gives the mode of printing results, default is CountByItem

	:param counter:
	:type counter: Handle_IFSelect_SignCounter &
	:param numword:
	:type numword: int
	:param mode: default value is IFSelect_CountByItem
	:type mode: IFSelect_PrintCount
	:rtype: IFSelect_ReturnStatus
") ExecuteCounter;
		IFSelect_ReturnStatus ExecuteCounter (const Handle_IFSelect_SignCounter & counter,const Standard_Integer numword,const IFSelect_PrintCount mode = IFSelect_CountByItem);
		%feature("compactdefaultargs") Number;
		%feature("autodoc", "	* Interprets a string value as an entity number : if it gives an integer, returns its value else, considers it as ENtityLabel (preferably case sensitive) in case of failure, returns 0

	:param val:
	:type val: char *
	:rtype: int
") Number;
		Standard_Integer Number (const char * val);
		%feature("compactdefaultargs") Do;
		%feature("autodoc", "	* Processes specific commands, which are : x or exit for end of session ? or help for help messages xcommand to control command lines (Record Mode, List, Clear, File Output ...) xsource to execute a command file (no nesting allowed), in case of error, source is stopped and keyword recovers xstep is a simple prefix (useful in a wider environment, to avoid conflicts on command names) xset control commands which create items with names

	:param number:
	:type number: int
	:param session:
	:type session: Handle_IFSelect_SessionPilot &
	:rtype: IFSelect_ReturnStatus
") Do;
		IFSelect_ReturnStatus Do (const Standard_Integer number,const Handle_IFSelect_SessionPilot & session);
		%feature("compactdefaultargs") Help;
		%feature("autodoc", "	* Help for specific commands (apart from general command help)

	:param number:
	:type number: int
	:rtype: char *
") Help;
		const char * Help (const Standard_Integer number);
};


%extend IFSelect_SessionPilot {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_IFSelect_SessionPilot(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_IFSelect_SessionPilot::Handle_IFSelect_SessionPilot %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_IFSelect_SessionPilot;
class Handle_IFSelect_SessionPilot : public Handle_IFSelect_Activator {

    public:
        // constructors
        Handle_IFSelect_SessionPilot();
        Handle_IFSelect_SessionPilot(const Handle_IFSelect_SessionPilot &aHandle);
        Handle_IFSelect_SessionPilot(const IFSelect_SessionPilot *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_IFSelect_SessionPilot DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_IFSelect_SessionPilot {
    IFSelect_SessionPilot* _get_reference() {
    return (IFSelect_SessionPilot*)$self->Access();
    }
};

%extend Handle_IFSelect_SessionPilot {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend IFSelect_SessionPilot {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IFSelect_SignCategory;
class IFSelect_SignCategory : public IFSelect_Signature {
	public:
		%feature("compactdefaultargs") IFSelect_SignCategory;
		%feature("autodoc", "	* Returns a SignCategory

	:rtype: None
") IFSelect_SignCategory;
		 IFSelect_SignCategory ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Returns the Signature for a Transient object, as its Category recorded in the model

	:param ent:
	:type ent: Handle_Standard_Transient &
	:param model:
	:type model: Handle_Interface_InterfaceModel &
	:rtype: char *
") Value;
		const char * Value (const Handle_Standard_Transient & ent,const Handle_Interface_InterfaceModel & model);
};


%extend IFSelect_SignCategory {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_IFSelect_SignCategory(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_IFSelect_SignCategory::Handle_IFSelect_SignCategory %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_IFSelect_SignCategory;
class Handle_IFSelect_SignCategory : public Handle_IFSelect_Signature {

    public:
        // constructors
        Handle_IFSelect_SignCategory();
        Handle_IFSelect_SignCategory(const Handle_IFSelect_SignCategory &aHandle);
        Handle_IFSelect_SignCategory(const IFSelect_SignCategory *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_IFSelect_SignCategory DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_IFSelect_SignCategory {
    IFSelect_SignCategory* _get_reference() {
    return (IFSelect_SignCategory*)$self->Access();
    }
};

%extend Handle_IFSelect_SignCategory {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend IFSelect_SignCategory {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IFSelect_SignCounter;
class IFSelect_SignCounter : public IFSelect_SignatureList {
	public:
		%feature("compactdefaultargs") IFSelect_SignCounter;
		%feature("autodoc", "	* Creates a SignCounter, without proper Signature If <withmap> is True (default), added entities are counted only if they are not yet recorded in the map Map control can be set off if the input garantees uniqueness of data <withlist> is transmitted to SignatureList (option to list entities, not only to count them).

	:param withmap: default value is Standard_True
	:type withmap: bool
	:param withlist: default value is Standard_False
	:type withlist: bool
	:rtype: None
") IFSelect_SignCounter;
		 IFSelect_SignCounter (const Standard_Boolean withmap = Standard_True,const Standard_Boolean withlist = Standard_False);
		%feature("compactdefaultargs") IFSelect_SignCounter;
		%feature("autodoc", "	* Creates a SignCounter, with a predefined Signature Other arguments as for Create without Signature.

	:param matcher:
	:type matcher: Handle_IFSelect_Signature &
	:param withmap: default value is Standard_True
	:type withmap: bool
	:param withlist: default value is Standard_False
	:type withlist: bool
	:rtype: None
") IFSelect_SignCounter;
		 IFSelect_SignCounter (const Handle_IFSelect_Signature & matcher,const Standard_Boolean withmap = Standard_True,const Standard_Boolean withlist = Standard_False);
		%feature("compactdefaultargs") Signature;
		%feature("autodoc", "	* Returns the Signature used to count entities. It can be null.

	:rtype: Handle_IFSelect_Signature
") Signature;
		Handle_IFSelect_Signature Signature ();
		%feature("compactdefaultargs") SetMap;
		%feature("autodoc", "	* Changes the control status. The map is not cleared, simply its use changes

	:param withmap:
	:type withmap: bool
	:rtype: None
") SetMap;
		void SetMap (const Standard_Boolean withmap);
		%feature("compactdefaultargs") AddEntity;
		%feature("autodoc", "	* Adds an entity by considering its signature, which is given by call to method AddSign Returns True if added, False if already in the map (and map control status set)

	:param ent:
	:type ent: Handle_Standard_Transient &
	:param model:
	:type model: Handle_Interface_InterfaceModel &
	:rtype: bool
") AddEntity;
		virtual Standard_Boolean AddEntity (const Handle_Standard_Transient & ent,const Handle_Interface_InterfaceModel & model);
		%feature("compactdefaultargs") AddSign;
		%feature("autodoc", "	* Adds an entity (already filtered by Map) with its signature. This signature can be computed with the containing model. Its value is provided by the object Signature given at start, if no Signature is defined, it does nothing. //! Can be redefined (in this case, see also Sign)

	:param ent:
	:type ent: Handle_Standard_Transient &
	:param model:
	:type model: Handle_Interface_InterfaceModel &
	:rtype: void
") AddSign;
		virtual void AddSign (const Handle_Standard_Transient & ent,const Handle_Interface_InterfaceModel & model);
		%feature("compactdefaultargs") AddList;
		%feature("autodoc", "	* Adds a list of entities by adding each of the items

	:param list:
	:type list: Handle_TColStd_HSequenceOfTransient &
	:param model:
	:type model: Handle_Interface_InterfaceModel &
	:rtype: None
") AddList;
		void AddList (const Handle_TColStd_HSequenceOfTransient & list,const Handle_Interface_InterfaceModel & model);
		%feature("compactdefaultargs") AddWithGraph;
		%feature("autodoc", "	* Adds a list of entities in the context given by the graph Default just call basic AddList Can be redefined to get a signature computed with the graph

	:param list:
	:type list: Handle_TColStd_HSequenceOfTransient &
	:param graph:
	:type graph: Interface_Graph &
	:rtype: void
") AddWithGraph;
		virtual void AddWithGraph (const Handle_TColStd_HSequenceOfTransient & list,const Interface_Graph & graph);
		%feature("compactdefaultargs") AddModel;
		%feature("autodoc", "	* Adds all the entities contained in a Model

	:param model:
	:type model: Handle_Interface_InterfaceModel &
	:rtype: None
") AddModel;
		void AddModel (const Handle_Interface_InterfaceModel & model);
		%feature("compactdefaultargs") AddFromSelection;
		%feature("autodoc", "	* Adds the result determined by a Selection from a Graph Remark : does not impact at all data from SetSelection & Co

	:param sel:
	:type sel: Handle_IFSelect_Selection &
	:param G:
	:type G: Interface_Graph &
	:rtype: None
") AddFromSelection;
		void AddFromSelection (const Handle_IFSelect_Selection & sel,const Interface_Graph & G);
		%feature("compactdefaultargs") SetSelection;
		%feature("autodoc", "	* Sets a Selection as input : this causes content to be cleared then the Selection to be ready to compute (but not immediatly)

	:param sel:
	:type sel: Handle_IFSelect_Selection &
	:rtype: None
") SetSelection;
		void SetSelection (const Handle_IFSelect_Selection & sel);
		%feature("compactdefaultargs") Selection;
		%feature("autodoc", "	* Returns the selection, or a null Handle

	:rtype: Handle_IFSelect_Selection
") Selection;
		Handle_IFSelect_Selection Selection ();
		%feature("compactdefaultargs") SetSelMode;
		%feature("autodoc", "	* Changes the mode of working with the selection : -1 just clears optimisation data and nothing else 0 clears it 1 inhibits it for computing (but no clearing) 2 sets it active for computing Default at creation is 0, after SetSelection (not null) is 2

	:param selmode:
	:type selmode: int
	:rtype: None
") SetSelMode;
		void SetSelMode (const Standard_Integer selmode);
		%feature("compactdefaultargs") SelMode;
		%feature("autodoc", "	* Returns the mode of working with the selection

	:rtype: int
") SelMode;
		Standard_Integer SelMode ();
		%feature("compactdefaultargs") ComputeSelected;
		%feature("autodoc", "	* Computes from the selection result, if selection is active (mode 2). If selection is not defined (mode 0) or is inhibited (mode 1) does nothing. Returns True if computation is done (or optimised), False else This method is called by ComputeCounter from WorkSession //! If <forced> is True, recomputes systematically Else (D), if the counter was not cleared and if the former computed result started from the same total size of Graph and same count of selected entities : computation is not redone unless <forced> is given as True

	:param G:
	:type G: Interface_Graph &
	:param forced: default value is Standard_False
	:type forced: bool
	:rtype: bool
") ComputeSelected;
		Standard_Boolean ComputeSelected (const Interface_Graph & G,const Standard_Boolean forced = Standard_False);
		%feature("compactdefaultargs") Sign;
		%feature("autodoc", "	* Determines and returns the value of the signature for an entity as an HAsciiString. This method works exactly as AddSign, which is optimized //! Can be redefined, accorded with AddSign

	:param ent:
	:type ent: Handle_Standard_Transient &
	:param model:
	:type model: Handle_Interface_InterfaceModel &
	:rtype: Handle_TCollection_HAsciiString
") Sign;
		virtual Handle_TCollection_HAsciiString Sign (const Handle_Standard_Transient & ent,const Handle_Interface_InterfaceModel & model);
		%feature("compactdefaultargs") ComputedSign;
		%feature("autodoc", "	* Applies AddWithGraph on one entity, and returns the Signature Value which has been recorded To do this, Add is called with SignOnly Mode True during the call, the returned value is LastValue

	:param ent:
	:type ent: Handle_Standard_Transient &
	:param G:
	:type G: Interface_Graph &
	:rtype: char *
") ComputedSign;
		const char * ComputedSign (const Handle_Standard_Transient & ent,const Interface_Graph & G);
};


%extend IFSelect_SignCounter {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_IFSelect_SignCounter(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_IFSelect_SignCounter::Handle_IFSelect_SignCounter %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_IFSelect_SignCounter;
class Handle_IFSelect_SignCounter : public Handle_IFSelect_SignatureList {

    public:
        // constructors
        Handle_IFSelect_SignCounter();
        Handle_IFSelect_SignCounter(const Handle_IFSelect_SignCounter &aHandle);
        Handle_IFSelect_SignCounter(const IFSelect_SignCounter *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_IFSelect_SignCounter DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_IFSelect_SignCounter {
    IFSelect_SignCounter* _get_reference() {
    return (IFSelect_SignCounter*)$self->Access();
    }
};

%extend Handle_IFSelect_SignCounter {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend IFSelect_SignCounter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IFSelect_SignMultiple;
class IFSelect_SignMultiple : public IFSelect_Signature {
	public:
		%feature("compactdefaultargs") IFSelect_SignMultiple;
		%feature("autodoc", "	* Creates an empty SignMultiple with a Name This name should take expected tabulations into account

	:param name:
	:type name: char *
	:rtype: None
") IFSelect_SignMultiple;
		 IFSelect_SignMultiple (const char * name);
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* Adds a Signature. Width, if given, gives the tabulation If <maxi> is True, it is a forced tabulation (overlength is replaced by a final dot) If <maxi> is False, just 3 blanks follow an overlength

	:param subsign:
	:type subsign: Handle_IFSelect_Signature &
	:param width: default value is 0
	:type width: int
	:param maxi: default value is Standard_False
	:type maxi: bool
	:rtype: None
") Add;
		void Add (const Handle_IFSelect_Signature & subsign,const Standard_Integer width = 0,const Standard_Boolean maxi = Standard_False);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Concatenates the values of sub-signatures, with their tabulations

	:param ent:
	:type ent: Handle_Standard_Transient &
	:param model:
	:type model: Handle_Interface_InterfaceModel &
	:rtype: char *
") Value;
		const char * Value (const Handle_Standard_Transient & ent,const Handle_Interface_InterfaceModel & model);
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "	* Specialized Match Rule If <exact> is False, simply checks if at least one sub-item matches If <exact> is True, standard match with Value (i.e. tabulations must be respected)

	:param ent:
	:type ent: Handle_Standard_Transient &
	:param model:
	:type model: Handle_Interface_InterfaceModel &
	:param text:
	:type text: TCollection_AsciiString &
	:param exact:
	:type exact: bool
	:rtype: bool
") Matches;
		virtual Standard_Boolean Matches (const Handle_Standard_Transient & ent,const Handle_Interface_InterfaceModel & model,const TCollection_AsciiString & text,const Standard_Boolean exact);
};


%extend IFSelect_SignMultiple {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_IFSelect_SignMultiple(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_IFSelect_SignMultiple::Handle_IFSelect_SignMultiple %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_IFSelect_SignMultiple;
class Handle_IFSelect_SignMultiple : public Handle_IFSelect_Signature {

    public:
        // constructors
        Handle_IFSelect_SignMultiple();
        Handle_IFSelect_SignMultiple(const Handle_IFSelect_SignMultiple &aHandle);
        Handle_IFSelect_SignMultiple(const IFSelect_SignMultiple *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_IFSelect_SignMultiple DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_IFSelect_SignMultiple {
    IFSelect_SignMultiple* _get_reference() {
    return (IFSelect_SignMultiple*)$self->Access();
    }
};

%extend Handle_IFSelect_SignMultiple {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend IFSelect_SignMultiple {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IFSelect_SignType;
class IFSelect_SignType : public IFSelect_Signature {
	public:
		%feature("compactdefaultargs") IFSelect_SignType;
		%feature("autodoc", "	* Returns a SignType <nopk> false (D) : complete dynamic type (name = Dynamic Type) <nopk> true : class type without pk (name = Class Type)

	:param nopk: default value is Standard_False
	:type nopk: bool
	:rtype: None
") IFSelect_SignType;
		 IFSelect_SignType (const Standard_Boolean nopk = Standard_False);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Returns the Signature for a Transient object, as its Dynamic Type, with or without package name, according starting option

	:param ent:
	:type ent: Handle_Standard_Transient &
	:param model:
	:type model: Handle_Interface_InterfaceModel &
	:rtype: char *
") Value;
		const char * Value (const Handle_Standard_Transient & ent,const Handle_Interface_InterfaceModel & model);
};


%extend IFSelect_SignType {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_IFSelect_SignType(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_IFSelect_SignType::Handle_IFSelect_SignType %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_IFSelect_SignType;
class Handle_IFSelect_SignType : public Handle_IFSelect_Signature {

    public:
        // constructors
        Handle_IFSelect_SignType();
        Handle_IFSelect_SignType(const Handle_IFSelect_SignType &aHandle);
        Handle_IFSelect_SignType(const IFSelect_SignType *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_IFSelect_SignType DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_IFSelect_SignType {
    IFSelect_SignType* _get_reference() {
    return (IFSelect_SignType*)$self->Access();
    }
};

%extend Handle_IFSelect_SignType {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend IFSelect_SignType {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IFSelect_SignValidity;
class IFSelect_SignValidity : public IFSelect_Signature {
	public:
		%feature("compactdefaultargs") IFSelect_SignValidity;
		%feature("autodoc", "	* Returns a SignValidity

	:rtype: None
") IFSelect_SignValidity;
		 IFSelect_SignValidity ();
		%feature("compactdefaultargs") CVal;
		%feature("autodoc", "	* Returns the Signature for a Transient object, as a validity deducted from data (reports) stored in the model. Class method, can be called by any one

	:param ent:
	:type ent: Handle_Standard_Transient &
	:param model:
	:type model: Handle_Interface_InterfaceModel &
	:rtype: char *
") CVal;
		static const char * CVal (const Handle_Standard_Transient & ent,const Handle_Interface_InterfaceModel & model);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Returns the Signature for a Transient object, as a validity deducted from data (reports) stored in the model Calls the class method CVal

	:param ent:
	:type ent: Handle_Standard_Transient &
	:param model:
	:type model: Handle_Interface_InterfaceModel &
	:rtype: char *
") Value;
		const char * Value (const Handle_Standard_Transient & ent,const Handle_Interface_InterfaceModel & model);
};


%extend IFSelect_SignValidity {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_IFSelect_SignValidity(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_IFSelect_SignValidity::Handle_IFSelect_SignValidity %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_IFSelect_SignValidity;
class Handle_IFSelect_SignValidity : public Handle_IFSelect_Signature {

    public:
        // constructors
        Handle_IFSelect_SignValidity();
        Handle_IFSelect_SignValidity(const Handle_IFSelect_SignValidity &aHandle);
        Handle_IFSelect_SignValidity(const IFSelect_SignValidity *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_IFSelect_SignValidity DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_IFSelect_SignValidity {
    IFSelect_SignValidity* _get_reference() {
    return (IFSelect_SignValidity*)$self->Access();
    }
};

%extend Handle_IFSelect_SignValidity {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend IFSelect_SignValidity {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IFSelect_TransformStandard;
class IFSelect_TransformStandard : public IFSelect_Transformer {
	public:
		%feature("compactdefaultargs") IFSelect_TransformStandard;
		%feature("autodoc", "	* Creates a TransformStandard, option StandardCopy, no Modifier

	:rtype: None
") IFSelect_TransformStandard;
		 IFSelect_TransformStandard ();
		%feature("compactdefaultargs") SetCopyOption;
		%feature("autodoc", "	* Sets the Copy option to a new value : - True for StandardCopy - False for OnTheSpot

	:param option:
	:type option: bool
	:rtype: None
") SetCopyOption;
		void SetCopyOption (const Standard_Boolean option);
		%feature("compactdefaultargs") CopyOption;
		%feature("autodoc", "	* Returns the Copy option

	:rtype: bool
") CopyOption;
		Standard_Boolean CopyOption ();
		%feature("compactdefaultargs") SetSelection;
		%feature("autodoc", "	* Sets a Selection (or unsets if Null) This Selection then defines the list of entities on which the Modifiers will be applied If it is set, it has priority on Selections of Modifiers Else, for each Modifier its Selection is evaluated By default, all the Model is taken

	:param sel:
	:type sel: Handle_IFSelect_Selection &
	:rtype: None
") SetSelection;
		void SetSelection (const Handle_IFSelect_Selection & sel);
		%feature("compactdefaultargs") Selection;
		%feature("autodoc", "	* Returns the Selection, Null by default

	:rtype: Handle_IFSelect_Selection
") Selection;
		Handle_IFSelect_Selection Selection ();
		%feature("compactdefaultargs") NbModifiers;
		%feature("autodoc", "	* Returns the count of recorded Modifiers

	:rtype: int
") NbModifiers;
		Standard_Integer NbModifiers ();
		%feature("compactdefaultargs") Modifier;
		%feature("autodoc", "	* Returns a Modifier given its rank in the list

	:param num:
	:type num: int
	:rtype: Handle_IFSelect_Modifier
") Modifier;
		Handle_IFSelect_Modifier Modifier (const Standard_Integer num);
		%feature("compactdefaultargs") ModifierRank;
		%feature("autodoc", "	* Returns the rank of a Modifier in the list, 0 if unknown

	:param modif:
	:type modif: Handle_IFSelect_Modifier &
	:rtype: int
") ModifierRank;
		Standard_Integer ModifierRank (const Handle_IFSelect_Modifier & modif);
		%feature("compactdefaultargs") AddModifier;
		%feature("autodoc", "	* Adds a Modifier to the list : - <atnum> = 0 (default) : at the end of the list - <atnum> > 0 : at rank <atnum> Returns True if done, False if <atnum> is out of range

	:param modif:
	:type modif: Handle_IFSelect_Modifier &
	:param atnum: default value is 0
	:type atnum: int
	:rtype: bool
") AddModifier;
		Standard_Boolean AddModifier (const Handle_IFSelect_Modifier & modif,const Standard_Integer atnum = 0);
		%feature("compactdefaultargs") RemoveModifier;
		%feature("autodoc", "	* Removes a Modifier from the list Returns True if done, False if <modif> not in the list

	:param modif:
	:type modif: Handle_IFSelect_Modifier &
	:rtype: bool
") RemoveModifier;
		Standard_Boolean RemoveModifier (const Handle_IFSelect_Modifier & modif);
		%feature("compactdefaultargs") RemoveModifier;
		%feature("autodoc", "	* Removes a Modifier from the list, given its rank Returns True if done, False if <num> is out of range

	:param num:
	:type num: int
	:rtype: bool
") RemoveModifier;
		Standard_Boolean RemoveModifier (const Standard_Integer num);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Performs the Standard Transformation, by calling Copy then ApplyModifiers (which can return an error status)

	:param G:
	:type G: Interface_Graph &
	:param protocol:
	:type protocol: Handle_Interface_Protocol &
	:param checks:
	:type checks: Interface_CheckIterator &
	:param newmod:
	:type newmod: Handle_Interface_InterfaceModel &
	:rtype: bool
") Perform;
		Standard_Boolean Perform (const Interface_Graph & G,const Handle_Interface_Protocol & protocol,Interface_CheckIterator & checks,Handle_Interface_InterfaceModel & newmod);
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "	* This the first operation. It calls StandardCopy or OnTheSpot according the option

	:param G:
	:type G: Interface_Graph &
	:param TC:
	:type TC: Interface_CopyTool &
	:param newmod:
	:type newmod: Handle_Interface_InterfaceModel &
	:rtype: None
") Copy;
		void Copy (const Interface_Graph & G,Interface_CopyTool & TC,Handle_Interface_InterfaceModel & newmod);
		%feature("compactdefaultargs") StandardCopy;
		%feature("autodoc", "	* This is the standard action of Copy : its takes into account only the remaining entities (noted by Graph Status positive) and their proper dependances of course. Produces a new model.

	:param G:
	:type G: Interface_Graph &
	:param TC:
	:type TC: Interface_CopyTool &
	:param newmod:
	:type newmod: Handle_Interface_InterfaceModel &
	:rtype: None
") StandardCopy;
		void StandardCopy (const Interface_Graph & G,Interface_CopyTool & TC,Handle_Interface_InterfaceModel & newmod);
		%feature("compactdefaultargs") OnTheSpot;
		%feature("autodoc", "	* This is the OnTheSpot action : each entity is bound with ... itself. The produced model is the same as the starting one.

	:param G:
	:type G: Interface_Graph &
	:param TC:
	:type TC: Interface_CopyTool &
	:param newmod:
	:type newmod: Handle_Interface_InterfaceModel &
	:rtype: None
") OnTheSpot;
		void OnTheSpot (const Interface_Graph & G,Interface_CopyTool & TC,Handle_Interface_InterfaceModel & newmod);
		%feature("compactdefaultargs") ApplyModifiers;
		%feature("autodoc", "	* Applies the modifiers sequencially. For each one, prepares required data (if a Selection is associated as a filter). For the option OnTheSpot, it determines if the graph may be changed and updates <newmod> if required If a Modifier causes an error (check 'HasFailed'), ApplyModifier stops : the following Modifiers are ignored

	:param G:
	:type G: Interface_Graph &
	:param protocol:
	:type protocol: Handle_Interface_Protocol &
	:param TC:
	:type TC: Interface_CopyTool &
	:param checks:
	:type checks: Interface_CheckIterator &
	:param newmod:
	:type newmod: Handle_Interface_InterfaceModel &
	:rtype: bool
") ApplyModifiers;
		Standard_Boolean ApplyModifiers (const Interface_Graph & G,const Handle_Interface_Protocol & protocol,Interface_CopyTool & TC,Interface_CheckIterator & checks,Handle_Interface_InterfaceModel & newmod);
		%feature("compactdefaultargs") Updated;
		%feature("autodoc", "	* This methods allows to know what happened to a starting entity after the last Perform. It reads result from the map which was filled by Perform.

	:param entfrom:
	:type entfrom: Handle_Standard_Transient &
	:param entto:
	:type entto: Handle_Standard_Transient &
	:rtype: bool
") Updated;
		Standard_Boolean Updated (const Handle_Standard_Transient & entfrom,Handle_Standard_Transient & entto);
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "	* Returns a text which defines the way a Transformer works : 'On the spot edition' or 'Standard Copy' followed by '<nn> Modifiers'

	:rtype: TCollection_AsciiString
") Label;
		TCollection_AsciiString Label ();
};


%extend IFSelect_TransformStandard {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_IFSelect_TransformStandard(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_IFSelect_TransformStandard::Handle_IFSelect_TransformStandard %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_IFSelect_TransformStandard;
class Handle_IFSelect_TransformStandard : public Handle_IFSelect_Transformer {

    public:
        // constructors
        Handle_IFSelect_TransformStandard();
        Handle_IFSelect_TransformStandard(const Handle_IFSelect_TransformStandard &aHandle);
        Handle_IFSelect_TransformStandard(const IFSelect_TransformStandard *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_IFSelect_TransformStandard DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_IFSelect_TransformStandard {
    IFSelect_TransformStandard* _get_reference() {
    return (IFSelect_TransformStandard*)$self->Access();
    }
};

%extend Handle_IFSelect_TransformStandard {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend IFSelect_TransformStandard {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IFSelect_GraphCounter;
class IFSelect_GraphCounter : public IFSelect_SignCounter {
	public:
		%feature("compactdefaultargs") IFSelect_GraphCounter;
		%feature("autodoc", "	* Creates a GraphCounter, without applied selection

	:param withmap: default value is Standard_True
	:type withmap: bool
	:param withlist: default value is Standard_False
	:type withlist: bool
	:rtype: None
") IFSelect_GraphCounter;
		 IFSelect_GraphCounter (const Standard_Boolean withmap = Standard_True,const Standard_Boolean withlist = Standard_False);
		%feature("compactdefaultargs") Applied;
		%feature("autodoc", "	* Returns the applied selection

	:rtype: Handle_IFSelect_SelectDeduct
") Applied;
		Handle_IFSelect_SelectDeduct Applied ();
		%feature("compactdefaultargs") SetApplied;
		%feature("autodoc", "	* Sets a new applied selection

	:param sel:
	:type sel: Handle_IFSelect_SelectDeduct &
	:rtype: None
") SetApplied;
		void SetApplied (const Handle_IFSelect_SelectDeduct & sel);
		%feature("compactdefaultargs") AddWithGraph;
		%feature("autodoc", "	* Adds a list of entities in the context given by the graph Default takes the count of entities selected by the applied selection, when it is given each entity of the list Can be redefined

	:param list:
	:type list: Handle_TColStd_HSequenceOfTransient &
	:param graph:
	:type graph: Interface_Graph &
	:rtype: void
") AddWithGraph;
		virtual void AddWithGraph (const Handle_TColStd_HSequenceOfTransient & list,const Interface_Graph & graph);
};


%extend IFSelect_GraphCounter {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_IFSelect_GraphCounter(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_IFSelect_GraphCounter::Handle_IFSelect_GraphCounter %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_IFSelect_GraphCounter;
class Handle_IFSelect_GraphCounter : public Handle_IFSelect_SignCounter {

    public:
        // constructors
        Handle_IFSelect_GraphCounter();
        Handle_IFSelect_GraphCounter(const Handle_IFSelect_GraphCounter &aHandle);
        Handle_IFSelect_GraphCounter(const IFSelect_GraphCounter *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_IFSelect_GraphCounter DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_IFSelect_GraphCounter {
    IFSelect_GraphCounter* _get_reference() {
    return (IFSelect_GraphCounter*)$self->Access();
    }
};

%extend Handle_IFSelect_GraphCounter {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend IFSelect_GraphCounter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IFSelect_ModifEditForm;
class IFSelect_ModifEditForm : public IFSelect_Modifier {
	public:
		%feature("compactdefaultargs") IFSelect_ModifEditForm;
		%feature("autodoc", "	* Creates a ModifEditForm. It may not change the graph

	:param editform:
	:type editform: Handle_IFSelect_EditForm &
	:rtype: None
") IFSelect_ModifEditForm;
		 IFSelect_ModifEditForm (const Handle_IFSelect_EditForm & editform);
		%feature("compactdefaultargs") EditForm;
		%feature("autodoc", "	* Returns the EditForm

	:rtype: Handle_IFSelect_EditForm
") EditForm;
		Handle_IFSelect_EditForm EditForm ();
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Acts by applying an EditForm to entities, selected or all model

	:param ctx:
	:type ctx: IFSelect_ContextModif &
	:param target:
	:type target: Handle_Interface_InterfaceModel &
	:param protocol:
	:type protocol: Handle_Interface_Protocol &
	:param TC:
	:type TC: Interface_CopyTool &
	:rtype: None
") Perform;
		void Perform (IFSelect_ContextModif & ctx,const Handle_Interface_InterfaceModel & target,const Handle_Interface_Protocol & protocol,Interface_CopyTool & TC);
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "	* Returns Label as 'Apply EditForm <+ label of EditForm>'

	:rtype: TCollection_AsciiString
") Label;
		TCollection_AsciiString Label ();
};


%extend IFSelect_ModifEditForm {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_IFSelect_ModifEditForm(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_IFSelect_ModifEditForm::Handle_IFSelect_ModifEditForm %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_IFSelect_ModifEditForm;
class Handle_IFSelect_ModifEditForm : public Handle_IFSelect_Modifier {

    public:
        // constructors
        Handle_IFSelect_ModifEditForm();
        Handle_IFSelect_ModifEditForm(const Handle_IFSelect_ModifEditForm &aHandle);
        Handle_IFSelect_ModifEditForm(const IFSelect_ModifEditForm *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_IFSelect_ModifEditForm DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_IFSelect_ModifEditForm {
    IFSelect_ModifEditForm* _get_reference() {
    return (IFSelect_ModifEditForm*)$self->Access();
    }
};

%extend Handle_IFSelect_ModifEditForm {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend IFSelect_ModifEditForm {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IFSelect_ModifReorder;
class IFSelect_ModifReorder : public IFSelect_Modifier {
	public:
		%feature("compactdefaultargs") IFSelect_ModifReorder;
		%feature("autodoc", "	* Creates a ModifReorder. It may change the graph (it does !) If <rootlast> is True (D), roots are set at the end of packets Else, they are set at beginning (as done by AddWithRefs)

	:param rootlast: default value is Standard_True
	:type rootlast: bool
	:rtype: None
") IFSelect_ModifReorder;
		 IFSelect_ModifReorder (const Standard_Boolean rootlast = Standard_True);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Acts by computing orders (by method All from ShareTool) then forcing them in the model. Remark that selection is ignored : ALL the model is processed in once

	:param ctx:
	:type ctx: IFSelect_ContextModif &
	:param target:
	:type target: Handle_Interface_InterfaceModel &
	:param protocol:
	:type protocol: Handle_Interface_Protocol &
	:param TC:
	:type TC: Interface_CopyTool &
	:rtype: None
") Perform;
		void Perform (IFSelect_ContextModif & ctx,const Handle_Interface_InterfaceModel & target,const Handle_Interface_Protocol & protocol,Interface_CopyTool & TC);
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "	* Returns Label as 'Reorder, Roots (last or first)'

	:rtype: TCollection_AsciiString
") Label;
		TCollection_AsciiString Label ();
};


%extend IFSelect_ModifReorder {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_IFSelect_ModifReorder(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_IFSelect_ModifReorder::Handle_IFSelect_ModifReorder %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_IFSelect_ModifReorder;
class Handle_IFSelect_ModifReorder : public Handle_IFSelect_Modifier {

    public:
        // constructors
        Handle_IFSelect_ModifReorder();
        Handle_IFSelect_ModifReorder(const Handle_IFSelect_ModifReorder &aHandle);
        Handle_IFSelect_ModifReorder(const IFSelect_ModifReorder *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_IFSelect_ModifReorder DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_IFSelect_ModifReorder {
    IFSelect_ModifReorder* _get_reference() {
    return (IFSelect_ModifReorder*)$self->Access();
    }
};

%extend Handle_IFSelect_ModifReorder {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend IFSelect_ModifReorder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IFSelect_SelectAnyList;
class IFSelect_SelectAnyList : public IFSelect_SelectDeduct {
	public:
		%feature("compactdefaultargs") KeepInputEntity;
		%feature("autodoc", "	* Keeps Input Entity, as having required type. It works by keeping in <iter>, only suitable Entities (SelectType can be used). Called by RootResult (which waits for ONE ENTITY MAX)

	:param iter:
	:type iter: Interface_EntityIterator &
	:rtype: void
") KeepInputEntity;
		virtual void KeepInputEntity (Interface_EntityIterator & iter);
		%feature("compactdefaultargs") NbItems;
		%feature("autodoc", "	* Returns count of Items in the list in the Entity <ent> If <ent> has not required type, returned value must be Zero

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: int
") NbItems;
		virtual Standard_Integer NbItems (const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") SetRange;
		%feature("autodoc", "	* Sets a Range for numbers, with a lower and a upper limits

	:param rankfrom:
	:type rankfrom: Handle_IFSelect_IntParam &
	:param rankto:
	:type rankto: Handle_IFSelect_IntParam &
	:rtype: None
") SetRange;
		void SetRange (const Handle_IFSelect_IntParam & rankfrom,const Handle_IFSelect_IntParam & rankto);
		%feature("compactdefaultargs") SetOne;
		%feature("autodoc", "	* Sets a unique number (only one Entity will be sorted as True)

	:param rank:
	:type rank: Handle_IFSelect_IntParam &
	:rtype: None
") SetOne;
		void SetOne (const Handle_IFSelect_IntParam & rank);
		%feature("compactdefaultargs") SetFrom;
		%feature("autodoc", "	* Sets a Lower limit but no upper limit

	:param rankfrom:
	:type rankfrom: Handle_IFSelect_IntParam &
	:rtype: None
") SetFrom;
		void SetFrom (const Handle_IFSelect_IntParam & rankfrom);
		%feature("compactdefaultargs") SetUntil;
		%feature("autodoc", "	* Sets an Upper limit but no lower limit (equivalent to lower 1)

	:param rankto:
	:type rankto: Handle_IFSelect_IntParam &
	:rtype: None
") SetUntil;
		void SetUntil (const Handle_IFSelect_IntParam & rankto);
		%feature("compactdefaultargs") HasLower;
		%feature("autodoc", "	* Returns True if a Lower limit is defined

	:rtype: bool
") HasLower;
		Standard_Boolean HasLower ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	* Returns Lower limit (if there is; else, value is senseless)

	:rtype: Handle_IFSelect_IntParam
") Lower;
		Handle_IFSelect_IntParam Lower ();
		%feature("compactdefaultargs") LowerValue;
		%feature("autodoc", "	* Returns Integer Value of Lower Limit (0 if none)

	:rtype: int
") LowerValue;
		Standard_Integer LowerValue ();
		%feature("compactdefaultargs") HasUpper;
		%feature("autodoc", "	* Returns True if a Lower limit is defined

	:rtype: bool
") HasUpper;
		Standard_Boolean HasUpper ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	* Returns Upper limit (if there is; else, value is senseless)

	:rtype: Handle_IFSelect_IntParam
") Upper;
		Handle_IFSelect_IntParam Upper ();
		%feature("compactdefaultargs") UpperValue;
		%feature("autodoc", "	* Returns Integer Value of Upper Limit (0 if none)

	:rtype: int
") UpperValue;
		Standard_Integer UpperValue ();
		%feature("compactdefaultargs") RootResult;
		%feature("autodoc", "	* Returns the list of selected entities (list of entities complying with rank criterium) Error if the input list has more than one Item

	:param G:
	:type G: Interface_Graph &
	:rtype: Interface_EntityIterator
") RootResult;
		Interface_EntityIterator RootResult (const Interface_Graph & G);
		%feature("compactdefaultargs") FillResult;
		%feature("autodoc", "	* Puts into <res>, the sub-entities of the list, from n1 to n2 included. Remark that adequation with Entity's type and length of list has already been made at this stage Called by RootResult

	:param n1:
	:type n1: int
	:param n2:
	:type n2: int
	:param ent:
	:type ent: Handle_Standard_Transient &
	:param res:
	:type res: Interface_EntityIterator &
	:rtype: void
") FillResult;
		virtual void FillResult (const Standard_Integer n1,const Standard_Integer n2,const Handle_Standard_Transient & ent,Interface_EntityIterator & res);
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "	* Returns a text defining the criterium : 'Componants of List ' then Specific List Label, then, following cases : ' From .. Until ..' or 'From ..' or 'Until ..' or 'Rank no ..' Specific type is given by deferred method ListLabel

	:rtype: TCollection_AsciiString
") Label;
		TCollection_AsciiString Label ();
		%feature("compactdefaultargs") ListLabel;
		%feature("autodoc", "	* Returns the specific label for the list, which is included as a part of Label

	:rtype: TCollection_AsciiString
") ListLabel;
		virtual TCollection_AsciiString ListLabel ();
};


%extend IFSelect_SelectAnyList {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_IFSelect_SelectAnyList(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_IFSelect_SelectAnyList::Handle_IFSelect_SelectAnyList %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_IFSelect_SelectAnyList;
class Handle_IFSelect_SelectAnyList : public Handle_IFSelect_SelectDeduct {

    public:
        // constructors
        Handle_IFSelect_SelectAnyList();
        Handle_IFSelect_SelectAnyList(const Handle_IFSelect_SelectAnyList &aHandle);
        Handle_IFSelect_SelectAnyList(const IFSelect_SelectAnyList *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_IFSelect_SelectAnyList DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_IFSelect_SelectAnyList {
    IFSelect_SelectAnyList* _get_reference() {
    return (IFSelect_SelectAnyList*)$self->Access();
    }
};

%extend Handle_IFSelect_SelectAnyList {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend IFSelect_SelectAnyList {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IFSelect_SelectDiff;
class IFSelect_SelectDiff : public IFSelect_SelectControl {
	public:
		%feature("compactdefaultargs") IFSelect_SelectDiff;
		%feature("autodoc", "	* Creates an empty SelectDiff

	:rtype: None
") IFSelect_SelectDiff;
		 IFSelect_SelectDiff ();
		%feature("compactdefaultargs") RootResult;
		%feature("autodoc", "	* Returns the list of selected entities : they are the Entities gotten from the Main Input but not from the Diff Input

	:param G:
	:type G: Interface_Graph &
	:rtype: Interface_EntityIterator
") RootResult;
		Interface_EntityIterator RootResult (const Interface_Graph & G);
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "	* Returns a text defining the criterium : 'Difference'

	:rtype: TCollection_AsciiString
") Label;
		TCollection_AsciiString Label ();
};


%extend IFSelect_SelectDiff {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_IFSelect_SelectDiff(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_IFSelect_SelectDiff::Handle_IFSelect_SelectDiff %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_IFSelect_SelectDiff;
class Handle_IFSelect_SelectDiff : public Handle_IFSelect_SelectControl {

    public:
        // constructors
        Handle_IFSelect_SelectDiff();
        Handle_IFSelect_SelectDiff(const Handle_IFSelect_SelectDiff &aHandle);
        Handle_IFSelect_SelectDiff(const IFSelect_SelectDiff *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_IFSelect_SelectDiff DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_IFSelect_SelectDiff {
    IFSelect_SelectDiff* _get_reference() {
    return (IFSelect_SelectDiff*)$self->Access();
    }
};

%extend Handle_IFSelect_SelectDiff {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend IFSelect_SelectDiff {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IFSelect_SelectEntityNumber;
class IFSelect_SelectEntityNumber : public IFSelect_SelectBase {
	public:
		%feature("compactdefaultargs") IFSelect_SelectEntityNumber;
		%feature("autodoc", "	* Creates a SelectEntityNumber, initially with no specified Number

	:rtype: None
") IFSelect_SelectEntityNumber;
		 IFSelect_SelectEntityNumber ();
		%feature("compactdefaultargs") SetNumber;
		%feature("autodoc", "	* Sets Entity Number to be taken (initially, none is set : 0)

	:param num:
	:type num: Handle_IFSelect_IntParam &
	:rtype: None
") SetNumber;
		void SetNumber (const Handle_IFSelect_IntParam & num);
		%feature("compactdefaultargs") Number;
		%feature("autodoc", "	* Returns specified Number (as a Parameter)

	:rtype: Handle_IFSelect_IntParam
") Number;
		Handle_IFSelect_IntParam Number ();
		%feature("compactdefaultargs") RootResult;
		%feature("autodoc", "	* Returns the list of selected entities : the Entity having the specified Number (this result assures naturally uniqueness)

	:param G:
	:type G: Interface_Graph &
	:rtype: Interface_EntityIterator
") RootResult;
		Interface_EntityIterator RootResult (const Interface_Graph & G);
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "	* Returns a text defining the criterium : 'Entity Number ...'

	:rtype: TCollection_AsciiString
") Label;
		TCollection_AsciiString Label ();
};


%extend IFSelect_SelectEntityNumber {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_IFSelect_SelectEntityNumber(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_IFSelect_SelectEntityNumber::Handle_IFSelect_SelectEntityNumber %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_IFSelect_SelectEntityNumber;
class Handle_IFSelect_SelectEntityNumber : public Handle_IFSelect_SelectBase {

    public:
        // constructors
        Handle_IFSelect_SelectEntityNumber();
        Handle_IFSelect_SelectEntityNumber(const Handle_IFSelect_SelectEntityNumber &aHandle);
        Handle_IFSelect_SelectEntityNumber(const IFSelect_SelectEntityNumber *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_IFSelect_SelectEntityNumber DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_IFSelect_SelectEntityNumber {
    IFSelect_SelectEntityNumber* _get_reference() {
    return (IFSelect_SelectEntityNumber*)$self->Access();
    }
};

%extend Handle_IFSelect_SelectEntityNumber {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend IFSelect_SelectEntityNumber {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IFSelect_SelectExplore;
class IFSelect_SelectExplore : public IFSelect_SelectDeduct {
	public:
		%feature("compactdefaultargs") Level;
		%feature("autodoc", "	* Returns the required exploring level

	:rtype: int
") Level;
		Standard_Integer Level ();
		%feature("compactdefaultargs") RootResult;
		%feature("autodoc", "	* Returns the list of selected entities. Works by calling the method Explore on each input entity : it can be rejected, taken for output, or to explore. If the maximum level has not yet been attained, or if no max level is specified, entities to be explored are themselves used as if they were input

	:param G:
	:type G: Interface_Graph &
	:rtype: Interface_EntityIterator
") RootResult;
		Interface_EntityIterator RootResult (const Interface_Graph & G);
		%feature("compactdefaultargs") Explore;
		%feature("autodoc", "	* Analyses and, if required, Explores an entity, as follows : The explored list starts as empty, it has to be filled by this method. If it returns False, <ent> is rejected for result (this is to be used only as safety) If it returns True and <explored> remains empty, <ent> is taken itself for result, not explored If it returns True and <explored> is not empty, the content of this list is considered : If maximum level is attained, it is taken for result Else (or no max), each of its entity will be itself explored

	:param level:
	:type level: int
	:param ent:
	:type ent: Handle_Standard_Transient &
	:param G:
	:type G: Interface_Graph &
	:param explored:
	:type explored: Interface_EntityIterator &
	:rtype: bool
") Explore;
		virtual Standard_Boolean Explore (const Standard_Integer level,const Handle_Standard_Transient & ent,const Interface_Graph & G,Interface_EntityIterator & explored);
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "	* Returns a text saying '(Recursive)' or '(Level nn)' plus specific criterium returned by ExploreLabel (see below)

	:rtype: TCollection_AsciiString
") Label;
		TCollection_AsciiString Label ();
		%feature("compactdefaultargs") ExploreLabel;
		%feature("autodoc", "	* Returns a text defining the way of exploration

	:rtype: TCollection_AsciiString
") ExploreLabel;
		virtual TCollection_AsciiString ExploreLabel ();
};


%extend IFSelect_SelectExplore {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_IFSelect_SelectExplore(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_IFSelect_SelectExplore::Handle_IFSelect_SelectExplore %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_IFSelect_SelectExplore;
class Handle_IFSelect_SelectExplore : public Handle_IFSelect_SelectDeduct {

    public:
        // constructors
        Handle_IFSelect_SelectExplore();
        Handle_IFSelect_SelectExplore(const Handle_IFSelect_SelectExplore &aHandle);
        Handle_IFSelect_SelectExplore(const IFSelect_SelectExplore *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_IFSelect_SelectExplore DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_IFSelect_SelectExplore {
    IFSelect_SelectExplore* _get_reference() {
    return (IFSelect_SelectExplore*)$self->Access();
    }
};

%extend Handle_IFSelect_SelectExplore {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend IFSelect_SelectExplore {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IFSelect_SelectExtract;
class IFSelect_SelectExtract : public IFSelect_SelectDeduct {
	public:
		%feature("compactdefaultargs") IsDirect;
		%feature("autodoc", "	* Returns True if Sort criterium is Direct, False if Reverse

	:rtype: bool
") IsDirect;
		Standard_Boolean IsDirect ();
		%feature("compactdefaultargs") SetDirect;
		%feature("autodoc", "	* Sets Sort criterium sense to a new value (True : Direct , False : Reverse)

	:param direct:
	:type direct: bool
	:rtype: None
") SetDirect;
		void SetDirect (const Standard_Boolean direct);
		%feature("compactdefaultargs") RootResult;
		%feature("autodoc", "	* Returns the list of selected entities. Works by calling the method Sort on each input Entity : the Entity is kept as output if Sort returns the same value as Direct status

	:param G:
	:type G: Interface_Graph &
	:rtype: Interface_EntityIterator
") RootResult;
		virtual Interface_EntityIterator RootResult (const Interface_Graph & G);
		%feature("compactdefaultargs") Sort;
		%feature("autodoc", "	* Returns True for an Entity if it satisfies the Sort criterium It receives : - <rank>, the rank of the Entity in the Iteration, - <ent> , the Entity itself, and - <model>, the Starting Model Hence, the Entity to check is 'model->Value(num)' (but an InterfaceModel allows other checks) This method is specific to each class of SelectExtract

	:param rank:
	:type rank: int
	:param ent:
	:type ent: Handle_Standard_Transient &
	:param model:
	:type model: Handle_Interface_InterfaceModel &
	:rtype: bool
") Sort;
		virtual Standard_Boolean Sort (const Standard_Integer rank,const Handle_Standard_Transient & ent,const Handle_Interface_InterfaceModel & model);
		%feature("compactdefaultargs") SortInGraph;
		%feature("autodoc", "	* Works as Sort but works on the Graph Default directly calls Sort, but it can be redefined If SortInGraph is redefined, Sort should be defined even if not called (to avoid deferred methods in a final class)

	:param rank:
	:type rank: int
	:param ent:
	:type ent: Handle_Standard_Transient &
	:param G:
	:type G: Interface_Graph &
	:rtype: bool
") SortInGraph;
		virtual Standard_Boolean SortInGraph (const Standard_Integer rank,const Handle_Standard_Transient & ent,const Interface_Graph & G);
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "	* Returns a text saying 'Picked' or 'Removed', plus the specific criterium returned by ExtractLabel (see below)

	:rtype: TCollection_AsciiString
") Label;
		TCollection_AsciiString Label ();
		%feature("compactdefaultargs") ExtractLabel;
		%feature("autodoc", "	* Returns a text defining the criterium for extraction

	:rtype: TCollection_AsciiString
") ExtractLabel;
		virtual TCollection_AsciiString ExtractLabel ();
};


%extend IFSelect_SelectExtract {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_IFSelect_SelectExtract(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_IFSelect_SelectExtract::Handle_IFSelect_SelectExtract %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_IFSelect_SelectExtract;
class Handle_IFSelect_SelectExtract : public Handle_IFSelect_SelectDeduct {

    public:
        // constructors
        Handle_IFSelect_SelectExtract();
        Handle_IFSelect_SelectExtract(const Handle_IFSelect_SelectExtract &aHandle);
        Handle_IFSelect_SelectExtract(const IFSelect_SelectExtract *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_IFSelect_SelectExtract DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_IFSelect_SelectExtract {
    IFSelect_SelectExtract* _get_reference() {
    return (IFSelect_SelectExtract*)$self->Access();
    }
};

%extend Handle_IFSelect_SelectExtract {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend IFSelect_SelectExtract {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IFSelect_SelectIntersection;
class IFSelect_SelectIntersection : public IFSelect_SelectCombine {
	public:
		%feature("compactdefaultargs") IFSelect_SelectIntersection;
		%feature("autodoc", "	* Creates an empty SelectIntersection

	:rtype: None
") IFSelect_SelectIntersection;
		 IFSelect_SelectIntersection ();
		%feature("compactdefaultargs") RootResult;
		%feature("autodoc", "	* Returns the list of selected Entities, which is the common part of results from all input selections. Uniqueness is guaranteed.

	:param G:
	:type G: Interface_Graph &
	:rtype: Interface_EntityIterator
") RootResult;
		Interface_EntityIterator RootResult (const Interface_Graph & G);
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "	* Returns a text defining the criterium : 'Intersection (AND)'

	:rtype: TCollection_AsciiString
") Label;
		TCollection_AsciiString Label ();
};


%extend IFSelect_SelectIntersection {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_IFSelect_SelectIntersection(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_IFSelect_SelectIntersection::Handle_IFSelect_SelectIntersection %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_IFSelect_SelectIntersection;
class Handle_IFSelect_SelectIntersection : public Handle_IFSelect_SelectCombine {

    public:
        // constructors
        Handle_IFSelect_SelectIntersection();
        Handle_IFSelect_SelectIntersection(const Handle_IFSelect_SelectIntersection &aHandle);
        Handle_IFSelect_SelectIntersection(const IFSelect_SelectIntersection *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_IFSelect_SelectIntersection DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_IFSelect_SelectIntersection {
    IFSelect_SelectIntersection* _get_reference() {
    return (IFSelect_SelectIntersection*)$self->Access();
    }
};

%extend Handle_IFSelect_SelectIntersection {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend IFSelect_SelectIntersection {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IFSelect_SelectModelEntities;
class IFSelect_SelectModelEntities : public IFSelect_SelectBase {
	public:
		%feature("compactdefaultargs") IFSelect_SelectModelEntities;
		%feature("autodoc", "	* Creates a SelectModelRoot

	:rtype: None
") IFSelect_SelectModelEntities;
		 IFSelect_SelectModelEntities ();
		%feature("compactdefaultargs") RootResult;
		%feature("autodoc", "	* Returns the list of selected entities : the Entities of the Model (note that this result assures naturally uniqueness)

	:param G:
	:type G: Interface_Graph &
	:rtype: Interface_EntityIterator
") RootResult;
		Interface_EntityIterator RootResult (const Interface_Graph & G);
		%feature("compactdefaultargs") CompleteResult;
		%feature("autodoc", "	* The complete list of Entities (including shared ones) ... is exactly identical to RootResults in this case

	:param G:
	:type G: Interface_Graph &
	:rtype: Interface_EntityIterator
") CompleteResult;
		virtual Interface_EntityIterator CompleteResult (const Interface_Graph & G);
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "	* Returns a text defining the criterium : 'Model Entities'

	:rtype: TCollection_AsciiString
") Label;
		TCollection_AsciiString Label ();
};


%extend IFSelect_SelectModelEntities {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_IFSelect_SelectModelEntities(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_IFSelect_SelectModelEntities::Handle_IFSelect_SelectModelEntities %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_IFSelect_SelectModelEntities;
class Handle_IFSelect_SelectModelEntities : public Handle_IFSelect_SelectBase {

    public:
        // constructors
        Handle_IFSelect_SelectModelEntities();
        Handle_IFSelect_SelectModelEntities(const Handle_IFSelect_SelectModelEntities &aHandle);
        Handle_IFSelect_SelectModelEntities(const IFSelect_SelectModelEntities *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_IFSelect_SelectModelEntities DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_IFSelect_SelectModelEntities {
    IFSelect_SelectModelEntities* _get_reference() {
    return (IFSelect_SelectModelEntities*)$self->Access();
    }
};

%extend Handle_IFSelect_SelectModelEntities {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend IFSelect_SelectModelEntities {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IFSelect_SelectModelRoots;
class IFSelect_SelectModelRoots : public IFSelect_SelectBase {
	public:
		%feature("compactdefaultargs") IFSelect_SelectModelRoots;
		%feature("autodoc", "	* Creates a SelectModelRoot

	:rtype: None
") IFSelect_SelectModelRoots;
		 IFSelect_SelectModelRoots ();
		%feature("compactdefaultargs") RootResult;
		%feature("autodoc", "	* Returns the list of selected entities : the Roots of the Model (note that this result assures naturally uniqueness)

	:param G:
	:type G: Interface_Graph &
	:rtype: Interface_EntityIterator
") RootResult;
		Interface_EntityIterator RootResult (const Interface_Graph & G);
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "	* Returns a text defining the criterium : 'Model Roots'

	:rtype: TCollection_AsciiString
") Label;
		TCollection_AsciiString Label ();
};


%extend IFSelect_SelectModelRoots {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_IFSelect_SelectModelRoots(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_IFSelect_SelectModelRoots::Handle_IFSelect_SelectModelRoots %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_IFSelect_SelectModelRoots;
class Handle_IFSelect_SelectModelRoots : public Handle_IFSelect_SelectBase {

    public:
        // constructors
        Handle_IFSelect_SelectModelRoots();
        Handle_IFSelect_SelectModelRoots(const Handle_IFSelect_SelectModelRoots &aHandle);
        Handle_IFSelect_SelectModelRoots(const IFSelect_SelectModelRoots *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_IFSelect_SelectModelRoots DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_IFSelect_SelectModelRoots {
    IFSelect_SelectModelRoots* _get_reference() {
    return (IFSelect_SelectModelRoots*)$self->Access();
    }
};

%extend Handle_IFSelect_SelectModelRoots {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend IFSelect_SelectModelRoots {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IFSelect_SelectPointed;
class IFSelect_SelectPointed : public IFSelect_SelectBase {
	public:
		%feature("compactdefaultargs") IFSelect_SelectPointed;
		%feature("autodoc", "	* Creates a SelectPointed

	:rtype: None
") IFSelect_SelectPointed;
		 IFSelect_SelectPointed ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	* Clears the list of selected items Also says the list is unset All Add* methods and SetList say the list is set

	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") IsSet;
		%feature("autodoc", "	* Tells if the list has been set. Even if empty

	:rtype: bool
") IsSet;
		Standard_Boolean IsSet ();
		%feature("compactdefaultargs") SetEntity;
		%feature("autodoc", "	* As SetList but with only one entity If <ent> is Null, the list is said as being set but is empty

	:param item:
	:type item: Handle_Standard_Transient &
	:rtype: None
") SetEntity;
		void SetEntity (const Handle_Standard_Transient & item);
		%feature("compactdefaultargs") SetList;
		%feature("autodoc", "	* Sets a given list to define the list of selected items <list> can be empty or null : in this case, the list is said as being set, but it is empty //! To use it as an alternate input, one shot : - SetList or SetEntity to define the input list - RootResult to get it - then Clear to drop it

	:param list:
	:type list: Handle_TColStd_HSequenceOfTransient &
	:rtype: None
") SetList;
		void SetList (const Handle_TColStd_HSequenceOfTransient & list);
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* Adds an item. Returns True if Done, False if <item> is already in the selected list

	:param item:
	:type item: Handle_Standard_Transient &
	:rtype: bool
") Add;
		Standard_Boolean Add (const Handle_Standard_Transient & item);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	* Removes an item. Returns True if Done, False if <item> was not in the selected list

	:param item:
	:type item: Handle_Standard_Transient &
	:rtype: bool
") Remove;
		Standard_Boolean Remove (const Handle_Standard_Transient & item);
		%feature("compactdefaultargs") Toggle;
		%feature("autodoc", "	* Toggles status of an item : adds it if not pointed or removes it if already pointed. Returns the new status (Pointed or not)

	:param item:
	:type item: Handle_Standard_Transient &
	:rtype: bool
") Toggle;
		Standard_Boolean Toggle (const Handle_Standard_Transient & item);
		%feature("compactdefaultargs") AddList;
		%feature("autodoc", "	* Adds all the items defined in a list. Returns True if at least one item has been added, False else

	:param list:
	:type list: Handle_TColStd_HSequenceOfTransient &
	:rtype: bool
") AddList;
		Standard_Boolean AddList (const Handle_TColStd_HSequenceOfTransient & list);
		%feature("compactdefaultargs") RemoveList;
		%feature("autodoc", "	* Removes all the items defined in a list. Returns True if at least one item has been removed, False else

	:param list:
	:type list: Handle_TColStd_HSequenceOfTransient &
	:rtype: bool
") RemoveList;
		Standard_Boolean RemoveList (const Handle_TColStd_HSequenceOfTransient & list);
		%feature("compactdefaultargs") ToggleList;
		%feature("autodoc", "	* Toggles status of all the items defined in a list : adds it if not pointed or removes it if already pointed.

	:param list:
	:type list: Handle_TColStd_HSequenceOfTransient &
	:rtype: bool
") ToggleList;
		Standard_Boolean ToggleList (const Handle_TColStd_HSequenceOfTransient & list);
		%feature("compactdefaultargs") Rank;
		%feature("autodoc", "	* Returns the rank of an item in the selected list, or 0.

	:param item:
	:type item: Handle_Standard_Transient &
	:rtype: int
") Rank;
		Standard_Integer Rank (const Handle_Standard_Transient & item);
		%feature("compactdefaultargs") NbItems;
		%feature("autodoc", "	* Returns the count of selected items

	:rtype: int
") NbItems;
		Standard_Integer NbItems ();
		%feature("compactdefaultargs") Item;
		%feature("autodoc", "	* Returns an item given its rank, or a Null Handle

	:param num:
	:type num: int
	:rtype: Handle_Standard_Transient
") Item;
		Handle_Standard_Transient Item (const Standard_Integer num);
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "	* Rebuilds the selected list. Any selected entity which has a bound result is replaced by this result, else it is removed.

	:param control:
	:type control: Handle_Interface_CopyControl &
	:rtype: None
") Update;
		void Update (const Handle_Interface_CopyControl & control);
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "	* Rebuilds the selected list, by querying a Transformer (same principle as from a CopyControl)

	:param trf:
	:type trf: Handle_IFSelect_Transformer &
	:rtype: None
") Update;
		void Update (const Handle_IFSelect_Transformer & trf);
		%feature("compactdefaultargs") RootResult;
		%feature("autodoc", "	* Returns the list of selected items. Only the selected entities which are present in the graph are given (this result assures uniqueness).

	:param G:
	:type G: Interface_Graph &
	:rtype: Interface_EntityIterator
") RootResult;
		Interface_EntityIterator RootResult (const Interface_Graph & G);
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "	* Returns a text which identifies the type of selection made. It is 'Pointed Entities'

	:rtype: TCollection_AsciiString
") Label;
		TCollection_AsciiString Label ();
};


%extend IFSelect_SelectPointed {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_IFSelect_SelectPointed(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_IFSelect_SelectPointed::Handle_IFSelect_SelectPointed %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_IFSelect_SelectPointed;
class Handle_IFSelect_SelectPointed : public Handle_IFSelect_SelectBase {

    public:
        // constructors
        Handle_IFSelect_SelectPointed();
        Handle_IFSelect_SelectPointed(const Handle_IFSelect_SelectPointed &aHandle);
        Handle_IFSelect_SelectPointed(const IFSelect_SelectPointed *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_IFSelect_SelectPointed DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_IFSelect_SelectPointed {
    IFSelect_SelectPointed* _get_reference() {
    return (IFSelect_SelectPointed*)$self->Access();
    }
};

%extend Handle_IFSelect_SelectPointed {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend IFSelect_SelectPointed {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IFSelect_SelectShared;
class IFSelect_SelectShared : public IFSelect_SelectDeduct {
	public:
		%feature("compactdefaultargs") IFSelect_SelectShared;
		%feature("autodoc", "	* Creates a SelectShared;

	:rtype: None
") IFSelect_SelectShared;
		 IFSelect_SelectShared ();
		%feature("compactdefaultargs") RootResult;
		%feature("autodoc", "	* Returns the list of selected entities (list of entities shared by those of input list)

	:param G:
	:type G: Interface_Graph &
	:rtype: Interface_EntityIterator
") RootResult;
		Interface_EntityIterator RootResult (const Interface_Graph & G);
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "	* Returns a text defining the criterium : 'Shared (one level)'

	:rtype: TCollection_AsciiString
") Label;
		TCollection_AsciiString Label ();
};


%extend IFSelect_SelectShared {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_IFSelect_SelectShared(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_IFSelect_SelectShared::Handle_IFSelect_SelectShared %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_IFSelect_SelectShared;
class Handle_IFSelect_SelectShared : public Handle_IFSelect_SelectDeduct {

    public:
        // constructors
        Handle_IFSelect_SelectShared();
        Handle_IFSelect_SelectShared(const Handle_IFSelect_SelectShared &aHandle);
        Handle_IFSelect_SelectShared(const IFSelect_SelectShared *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_IFSelect_SelectShared DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_IFSelect_SelectShared {
    IFSelect_SelectShared* _get_reference() {
    return (IFSelect_SelectShared*)$self->Access();
    }
};

%extend Handle_IFSelect_SelectShared {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend IFSelect_SelectShared {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IFSelect_SelectSharing;
class IFSelect_SelectSharing : public IFSelect_SelectDeduct {
	public:
		%feature("compactdefaultargs") IFSelect_SelectSharing;
		%feature("autodoc", "	* Creates a SelectSharing;

	:rtype: None
") IFSelect_SelectSharing;
		 IFSelect_SelectSharing ();
		%feature("compactdefaultargs") RootResult;
		%feature("autodoc", "	* Returns the list of selected entities (list of entities which share (level one) those of input list)

	:param G:
	:type G: Interface_Graph &
	:rtype: Interface_EntityIterator
") RootResult;
		Interface_EntityIterator RootResult (const Interface_Graph & G);
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "	* Returns a text defining the criterium : 'Sharing (one level)'

	:rtype: TCollection_AsciiString
") Label;
		TCollection_AsciiString Label ();
};


%extend IFSelect_SelectSharing {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_IFSelect_SelectSharing(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_IFSelect_SelectSharing::Handle_IFSelect_SelectSharing %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_IFSelect_SelectSharing;
class Handle_IFSelect_SelectSharing : public Handle_IFSelect_SelectDeduct {

    public:
        // constructors
        Handle_IFSelect_SelectSharing();
        Handle_IFSelect_SelectSharing(const Handle_IFSelect_SelectSharing &aHandle);
        Handle_IFSelect_SelectSharing(const IFSelect_SelectSharing *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_IFSelect_SelectSharing DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_IFSelect_SelectSharing {
    IFSelect_SelectSharing* _get_reference() {
    return (IFSelect_SelectSharing*)$self->Access();
    }
};

%extend Handle_IFSelect_SelectSharing {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend IFSelect_SelectSharing {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IFSelect_SelectSuite;
class IFSelect_SelectSuite : public IFSelect_SelectDeduct {
	public:
		%feature("compactdefaultargs") IFSelect_SelectSuite;
		%feature("autodoc", "	* Creates an empty SelectSuite

	:rtype: None
") IFSelect_SelectSuite;
		 IFSelect_SelectSuite ();
		%feature("compactdefaultargs") AddInput;
		%feature("autodoc", "	* Adds an input selection. I.E. : If <item> is a SelectDeduct, adds it as Previous, not as Input Else, sets it as Input Returns True when done Returns False and refuses to work if Input is already defined

	:param item:
	:type item: Handle_IFSelect_Selection &
	:rtype: bool
") AddInput;
		Standard_Boolean AddInput (const Handle_IFSelect_Selection & item);
		%feature("compactdefaultargs") AddPrevious;
		%feature("autodoc", "	* Adds a new first item (prepends to the list). The Input is not touched If <item> is null, does nothing

	:param item:
	:type item: Handle_IFSelect_SelectDeduct &
	:rtype: None
") AddPrevious;
		void AddPrevious (const Handle_IFSelect_SelectDeduct & item);
		%feature("compactdefaultargs") AddNext;
		%feature("autodoc", "	* Adds a new last item (prepends to the list) If <item> is null, does nothing

	:param item:
	:type item: Handle_IFSelect_SelectDeduct &
	:rtype: None
") AddNext;
		void AddNext (const Handle_IFSelect_SelectDeduct & item);
		%feature("compactdefaultargs") NbItems;
		%feature("autodoc", "	* Returns the count of Items

	:rtype: int
") NbItems;
		Standard_Integer NbItems ();
		%feature("compactdefaultargs") Item;
		%feature("autodoc", "	* Returns an item from its rank in the list (the Input is always apart)

	:param num:
	:type num: int
	:rtype: Handle_IFSelect_SelectDeduct
") Item;
		Handle_IFSelect_SelectDeduct Item (const Standard_Integer num);
		%feature("compactdefaultargs") SetLabel;
		%feature("autodoc", "	* Sets a value for the Label

	:param lab:
	:type lab: char *
	:rtype: None
") SetLabel;
		void SetLabel (const char * lab);
		%feature("compactdefaultargs") RootResult;
		%feature("autodoc", "	* Returns the list of selected entities To do this, once InputResult has been taken (if Input or Alternate has been defined, else the first Item gives it) : this result is set as alternate input for the first item, which computes its result : this result is set as alternate input for the second item, etc...

	:param G:
	:type G: Interface_Graph &
	:rtype: Interface_EntityIterator
") RootResult;
		Interface_EntityIterator RootResult (const Interface_Graph & G);
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "	* Returns the Label Either it has been defined by SetLabel, or it will give 'Suite of nn Selections'

	:rtype: TCollection_AsciiString
") Label;
		TCollection_AsciiString Label ();
};


%extend IFSelect_SelectSuite {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_IFSelect_SelectSuite(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_IFSelect_SelectSuite::Handle_IFSelect_SelectSuite %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_IFSelect_SelectSuite;
class Handle_IFSelect_SelectSuite : public Handle_IFSelect_SelectDeduct {

    public:
        // constructors
        Handle_IFSelect_SelectSuite();
        Handle_IFSelect_SelectSuite(const Handle_IFSelect_SelectSuite &aHandle);
        Handle_IFSelect_SelectSuite(const IFSelect_SelectSuite *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_IFSelect_SelectSuite DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_IFSelect_SelectSuite {
    IFSelect_SelectSuite* _get_reference() {
    return (IFSelect_SelectSuite*)$self->Access();
    }
};

%extend Handle_IFSelect_SelectSuite {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend IFSelect_SelectSuite {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IFSelect_SelectUnion;
class IFSelect_SelectUnion : public IFSelect_SelectCombine {
	public:
		%feature("compactdefaultargs") IFSelect_SelectUnion;
		%feature("autodoc", "	* Creates an empty SelectUnion

	:rtype: None
") IFSelect_SelectUnion;
		 IFSelect_SelectUnion ();
		%feature("compactdefaultargs") RootResult;
		%feature("autodoc", "	* Returns the list of selected Entities, which is the addition result from all input selections. Uniqueness is guaranteed.

	:param G:
	:type G: Interface_Graph &
	:rtype: Interface_EntityIterator
") RootResult;
		Interface_EntityIterator RootResult (const Interface_Graph & G);
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "	* Returns a text defining the criterium : 'Union (OR)'

	:rtype: TCollection_AsciiString
") Label;
		TCollection_AsciiString Label ();
};


%extend IFSelect_SelectUnion {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_IFSelect_SelectUnion(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_IFSelect_SelectUnion::Handle_IFSelect_SelectUnion %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_IFSelect_SelectUnion;
class Handle_IFSelect_SelectUnion : public Handle_IFSelect_SelectCombine {

    public:
        // constructors
        Handle_IFSelect_SelectUnion();
        Handle_IFSelect_SelectUnion(const Handle_IFSelect_SelectUnion &aHandle);
        Handle_IFSelect_SelectUnion(const IFSelect_SelectUnion *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_IFSelect_SelectUnion DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_IFSelect_SelectUnion {
    IFSelect_SelectUnion* _get_reference() {
    return (IFSelect_SelectUnion*)$self->Access();
    }
};

%extend Handle_IFSelect_SelectUnion {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend IFSelect_SelectUnion {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IFSelect_SignAncestor;
class IFSelect_SignAncestor : public IFSelect_SignType {
	public:
		%feature("compactdefaultargs") IFSelect_SignAncestor;
		%feature("autodoc", "	:param nopk: default value is Standard_False
	:type nopk: bool
	:rtype: None
") IFSelect_SignAncestor;
		 IFSelect_SignAncestor (const Standard_Boolean nopk = Standard_False);
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "	:param ent:
	:type ent: Handle_Standard_Transient &
	:param model:
	:type model: Handle_Interface_InterfaceModel &
	:param text:
	:type text: TCollection_AsciiString &
	:param exact:
	:type exact: bool
	:rtype: bool
") Matches;
		virtual Standard_Boolean Matches (const Handle_Standard_Transient & ent,const Handle_Interface_InterfaceModel & model,const TCollection_AsciiString & text,const Standard_Boolean exact);
};


%extend IFSelect_SignAncestor {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_IFSelect_SignAncestor(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_IFSelect_SignAncestor::Handle_IFSelect_SignAncestor %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_IFSelect_SignAncestor;
class Handle_IFSelect_SignAncestor : public Handle_IFSelect_SignType {

    public:
        // constructors
        Handle_IFSelect_SignAncestor();
        Handle_IFSelect_SignAncestor(const Handle_IFSelect_SignAncestor &aHandle);
        Handle_IFSelect_SignAncestor(const IFSelect_SignAncestor *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_IFSelect_SignAncestor DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_IFSelect_SignAncestor {
    IFSelect_SignAncestor* _get_reference() {
    return (IFSelect_SignAncestor*)$self->Access();
    }
};

%extend Handle_IFSelect_SignAncestor {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend IFSelect_SignAncestor {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IFSelect_SelectAnyType;
class IFSelect_SelectAnyType : public IFSelect_SelectExtract {
	public:
		%feature("compactdefaultargs") TypeForMatch;
		%feature("autodoc", "	* Returns the Type which has to be matched for select

	:rtype: Handle_Standard_Type
") TypeForMatch;
		virtual Handle_Standard_Type TypeForMatch ();
		%feature("compactdefaultargs") Sort;
		%feature("autodoc", "	* Returns True for an Entity (model->Value(num)) which is kind of the choosen type, given by the method TypeForMatch. Criterium is IsKind.

	:param rank:
	:type rank: int
	:param ent:
	:type ent: Handle_Standard_Transient &
	:param model:
	:type model: Handle_Interface_InterfaceModel &
	:rtype: bool
") Sort;
		Standard_Boolean Sort (const Standard_Integer rank,const Handle_Standard_Transient & ent,const Handle_Interface_InterfaceModel & model);
};


%extend IFSelect_SelectAnyType {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_IFSelect_SelectAnyType(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_IFSelect_SelectAnyType::Handle_IFSelect_SelectAnyType %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_IFSelect_SelectAnyType;
class Handle_IFSelect_SelectAnyType : public Handle_IFSelect_SelectExtract {

    public:
        // constructors
        Handle_IFSelect_SelectAnyType();
        Handle_IFSelect_SelectAnyType(const Handle_IFSelect_SelectAnyType &aHandle);
        Handle_IFSelect_SelectAnyType(const IFSelect_SelectAnyType *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_IFSelect_SelectAnyType DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_IFSelect_SelectAnyType {
    IFSelect_SelectAnyType* _get_reference() {
    return (IFSelect_SelectAnyType*)$self->Access();
    }
};

%extend Handle_IFSelect_SelectAnyType {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend IFSelect_SelectAnyType {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IFSelect_SelectErrorEntities;
class IFSelect_SelectErrorEntities : public IFSelect_SelectExtract {
	public:
		%feature("compactdefaultargs") IFSelect_SelectErrorEntities;
		%feature("autodoc", "	* Creates a SelectErrorEntities

	:rtype: None
") IFSelect_SelectErrorEntities;
		 IFSelect_SelectErrorEntities ();
		%feature("compactdefaultargs") Sort;
		%feature("autodoc", "	* Returns True for an Entity which is qualified as 'Error', i.e. if <model> explicitly knows <ent> (through its Number) as Erroneous

	:param rank:
	:type rank: int
	:param ent:
	:type ent: Handle_Standard_Transient &
	:param model:
	:type model: Handle_Interface_InterfaceModel &
	:rtype: bool
") Sort;
		Standard_Boolean Sort (const Standard_Integer rank,const Handle_Standard_Transient & ent,const Handle_Interface_InterfaceModel & model);
		%feature("compactdefaultargs") ExtractLabel;
		%feature("autodoc", "	* Returns a text defining the criterium : 'Error Entities'

	:rtype: TCollection_AsciiString
") ExtractLabel;
		TCollection_AsciiString ExtractLabel ();
};


%extend IFSelect_SelectErrorEntities {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_IFSelect_SelectErrorEntities(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_IFSelect_SelectErrorEntities::Handle_IFSelect_SelectErrorEntities %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_IFSelect_SelectErrorEntities;
class Handle_IFSelect_SelectErrorEntities : public Handle_IFSelect_SelectExtract {

    public:
        // constructors
        Handle_IFSelect_SelectErrorEntities();
        Handle_IFSelect_SelectErrorEntities(const Handle_IFSelect_SelectErrorEntities &aHandle);
        Handle_IFSelect_SelectErrorEntities(const IFSelect_SelectErrorEntities *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_IFSelect_SelectErrorEntities DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_IFSelect_SelectErrorEntities {
    IFSelect_SelectErrorEntities* _get_reference() {
    return (IFSelect_SelectErrorEntities*)$self->Access();
    }
};

%extend Handle_IFSelect_SelectErrorEntities {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend IFSelect_SelectErrorEntities {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IFSelect_SelectFlag;
class IFSelect_SelectFlag : public IFSelect_SelectExtract {
	public:
		%feature("compactdefaultargs") IFSelect_SelectFlag;
		%feature("autodoc", "	* Creates a Select Flag, to query a flag designated by its name

	:param flagname:
	:type flagname: char *
	:rtype: None
") IFSelect_SelectFlag;
		 IFSelect_SelectFlag (const char * flagname);
		%feature("compactdefaultargs") FlagName;
		%feature("autodoc", "	* Returns the name of the flag

	:rtype: char *
") FlagName;
		const char * FlagName ();
		%feature("compactdefaultargs") RootResult;
		%feature("autodoc", "	* Returns the list of selected entities. It is redefined to work on the graph itself (not queried by sort) //! An entity is selected if its flag is True on Direct mode, False on Reversed mode //! If flag does not exist for the given name, returns an empty result, whatever the Direct/Reversed sense

	:param G:
	:type G: Interface_Graph &
	:rtype: Interface_EntityIterator
") RootResult;
		virtual Interface_EntityIterator RootResult (const Interface_Graph & G);
		%feature("compactdefaultargs") Sort;
		%feature("autodoc", "	* Returns always False because RootResult has done the work

	:param rank:
	:type rank: int
	:param ent:
	:type ent: Handle_Standard_Transient &
	:param model:
	:type model: Handle_Interface_InterfaceModel &
	:rtype: bool
") Sort;
		Standard_Boolean Sort (const Standard_Integer rank,const Handle_Standard_Transient & ent,const Handle_Interface_InterfaceModel & model);
		%feature("compactdefaultargs") ExtractLabel;
		%feature("autodoc", "	* Returns a text defining the criterium, includes the flag name

	:rtype: TCollection_AsciiString
") ExtractLabel;
		TCollection_AsciiString ExtractLabel ();
};


%extend IFSelect_SelectFlag {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_IFSelect_SelectFlag(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_IFSelect_SelectFlag::Handle_IFSelect_SelectFlag %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_IFSelect_SelectFlag;
class Handle_IFSelect_SelectFlag : public Handle_IFSelect_SelectExtract {

    public:
        // constructors
        Handle_IFSelect_SelectFlag();
        Handle_IFSelect_SelectFlag(const Handle_IFSelect_SelectFlag &aHandle);
        Handle_IFSelect_SelectFlag(const IFSelect_SelectFlag *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_IFSelect_SelectFlag DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_IFSelect_SelectFlag {
    IFSelect_SelectFlag* _get_reference() {
    return (IFSelect_SelectFlag*)$self->Access();
    }
};

%extend Handle_IFSelect_SelectFlag {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend IFSelect_SelectFlag {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IFSelect_SelectInList;
class IFSelect_SelectInList : public IFSelect_SelectAnyList {
	public:
		%feature("compactdefaultargs") ListedEntity;
		%feature("autodoc", "	* Returns an Entity, given its rank in the list

	:param num:
	:type num: int
	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: Handle_Standard_Transient
") ListedEntity;
		virtual Handle_Standard_Transient ListedEntity (const Standard_Integer num,const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") FillResult;
		%feature("autodoc", "	* Puts into the result, the sub-entities of the list, from n1 to n2 included. Remark that adequation with Entity's type and length of list has already been made at this stage Called by RootResult; calls ListedEntity (see below)

	:param n1:
	:type n1: int
	:param n2:
	:type n2: int
	:param ent:
	:type ent: Handle_Standard_Transient &
	:param result:
	:type result: Interface_EntityIterator &
	:rtype: None
") FillResult;
		void FillResult (const Standard_Integer n1,const Standard_Integer n2,const Handle_Standard_Transient & ent,Interface_EntityIterator & result);
};


%extend IFSelect_SelectInList {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_IFSelect_SelectInList(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_IFSelect_SelectInList::Handle_IFSelect_SelectInList %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_IFSelect_SelectInList;
class Handle_IFSelect_SelectInList : public Handle_IFSelect_SelectAnyList {

    public:
        // constructors
        Handle_IFSelect_SelectInList();
        Handle_IFSelect_SelectInList(const Handle_IFSelect_SelectInList &aHandle);
        Handle_IFSelect_SelectInList(const IFSelect_SelectInList *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_IFSelect_SelectInList DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_IFSelect_SelectInList {
    IFSelect_SelectInList* _get_reference() {
    return (IFSelect_SelectInList*)$self->Access();
    }
};

%extend Handle_IFSelect_SelectInList {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend IFSelect_SelectInList {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IFSelect_SelectRange;
class IFSelect_SelectRange : public IFSelect_SelectExtract {
	public:
		%feature("compactdefaultargs") IFSelect_SelectRange;
		%feature("autodoc", "	* Creates a SelectRange. Default is Take all the input list

	:rtype: None
") IFSelect_SelectRange;
		 IFSelect_SelectRange ();
		%feature("compactdefaultargs") SetRange;
		%feature("autodoc", "	* Sets a Range for numbers, with a lower and a upper limits Error if rankto is lower then rankfrom

	:param rankfrom:
	:type rankfrom: Handle_IFSelect_IntParam &
	:param rankto:
	:type rankto: Handle_IFSelect_IntParam &
	:rtype: None
") SetRange;
		void SetRange (const Handle_IFSelect_IntParam & rankfrom,const Handle_IFSelect_IntParam & rankto);
		%feature("compactdefaultargs") SetOne;
		%feature("autodoc", "	* Sets a unique number (only one Entity will be sorted as True)

	:param rank:
	:type rank: Handle_IFSelect_IntParam &
	:rtype: None
") SetOne;
		void SetOne (const Handle_IFSelect_IntParam & rank);
		%feature("compactdefaultargs") SetFrom;
		%feature("autodoc", "	* Sets a Lower limit but no upper limit

	:param rankfrom:
	:type rankfrom: Handle_IFSelect_IntParam &
	:rtype: None
") SetFrom;
		void SetFrom (const Handle_IFSelect_IntParam & rankfrom);
		%feature("compactdefaultargs") SetUntil;
		%feature("autodoc", "	* Sets an Upper limit but no lower limit (equivalent to lower 1)

	:param rankto:
	:type rankto: Handle_IFSelect_IntParam &
	:rtype: None
") SetUntil;
		void SetUntil (const Handle_IFSelect_IntParam & rankto);
		%feature("compactdefaultargs") HasLower;
		%feature("autodoc", "	* Returns True if a Lower limit is defined

	:rtype: bool
") HasLower;
		Standard_Boolean HasLower ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	* Returns Lower limit (if there is; else, value is senseless)

	:rtype: Handle_IFSelect_IntParam
") Lower;
		Handle_IFSelect_IntParam Lower ();
		%feature("compactdefaultargs") LowerValue;
		%feature("autodoc", "	* Returns Value of Lower Limit (0 if none is defined)

	:rtype: int
") LowerValue;
		Standard_Integer LowerValue ();
		%feature("compactdefaultargs") HasUpper;
		%feature("autodoc", "	* Returns True if a Lower limit is defined

	:rtype: bool
") HasUpper;
		Standard_Boolean HasUpper ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	* Returns Upper limit (if there is; else, value is senseless)

	:rtype: Handle_IFSelect_IntParam
") Upper;
		Handle_IFSelect_IntParam Upper ();
		%feature("compactdefaultargs") UpperValue;
		%feature("autodoc", "	* Returns Value of Upper Limit (0 if none is defined)

	:rtype: int
") UpperValue;
		Standard_Integer UpperValue ();
		%feature("compactdefaultargs") Sort;
		%feature("autodoc", "	* Returns True for an Entity of which occurence number in the iteration is inside the selected Range (considers <rank>)

	:param rank:
	:type rank: int
	:param ent:
	:type ent: Handle_Standard_Transient &
	:param model:
	:type model: Handle_Interface_InterfaceModel &
	:rtype: bool
") Sort;
		Standard_Boolean Sort (const Standard_Integer rank,const Handle_Standard_Transient & ent,const Handle_Interface_InterfaceModel & model);
		%feature("compactdefaultargs") ExtractLabel;
		%feature("autodoc", "	* Returns a text defining the criterium : following cases, ' From .. Until ..' or 'From ..' or 'Until ..' or 'Rank no ..'

	:rtype: TCollection_AsciiString
") ExtractLabel;
		TCollection_AsciiString ExtractLabel ();
};


%extend IFSelect_SelectRange {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_IFSelect_SelectRange(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_IFSelect_SelectRange::Handle_IFSelect_SelectRange %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_IFSelect_SelectRange;
class Handle_IFSelect_SelectRange : public Handle_IFSelect_SelectExtract {

    public:
        // constructors
        Handle_IFSelect_SelectRange();
        Handle_IFSelect_SelectRange(const Handle_IFSelect_SelectRange &aHandle);
        Handle_IFSelect_SelectRange(const IFSelect_SelectRange *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_IFSelect_SelectRange DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_IFSelect_SelectRange {
    IFSelect_SelectRange* _get_reference() {
    return (IFSelect_SelectRange*)$self->Access();
    }
};

%extend Handle_IFSelect_SelectRange {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend IFSelect_SelectRange {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IFSelect_SelectRootComps;
class IFSelect_SelectRootComps : public IFSelect_SelectExtract {
	public:
		%feature("compactdefaultargs") IFSelect_SelectRootComps;
		%feature("autodoc", "	* Creates a SelectRootComps

	:rtype: None
") IFSelect_SelectRootComps;
		 IFSelect_SelectRootComps ();
		%feature("compactdefaultargs") RootResult;
		%feature("autodoc", "	* Returns the list of local root strong componants, by one Entity par componant. It is redefined for a purpose of effeciency : calling a Sort routine for each Entity would cost more ressource than to work in once using a Map RootResult takes in account the Direct status

	:param G:
	:type G: Interface_Graph &
	:rtype: Interface_EntityIterator
") RootResult;
		virtual Interface_EntityIterator RootResult (const Interface_Graph & G);
		%feature("compactdefaultargs") Sort;
		%feature("autodoc", "	* Returns always True, because RootResult has done work

	:param rank:
	:type rank: int
	:param ent:
	:type ent: Handle_Standard_Transient &
	:param model:
	:type model: Handle_Interface_InterfaceModel &
	:rtype: bool
") Sort;
		Standard_Boolean Sort (const Standard_Integer rank,const Handle_Standard_Transient & ent,const Handle_Interface_InterfaceModel & model);
		%feature("compactdefaultargs") ExtractLabel;
		%feature("autodoc", "	* Returns a text defining the criterium : 'Local Root Componants'

	:rtype: TCollection_AsciiString
") ExtractLabel;
		TCollection_AsciiString ExtractLabel ();
};


%extend IFSelect_SelectRootComps {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_IFSelect_SelectRootComps(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_IFSelect_SelectRootComps::Handle_IFSelect_SelectRootComps %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_IFSelect_SelectRootComps;
class Handle_IFSelect_SelectRootComps : public Handle_IFSelect_SelectExtract {

    public:
        // constructors
        Handle_IFSelect_SelectRootComps();
        Handle_IFSelect_SelectRootComps(const Handle_IFSelect_SelectRootComps &aHandle);
        Handle_IFSelect_SelectRootComps(const IFSelect_SelectRootComps *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_IFSelect_SelectRootComps DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_IFSelect_SelectRootComps {
    IFSelect_SelectRootComps* _get_reference() {
    return (IFSelect_SelectRootComps*)$self->Access();
    }
};

%extend Handle_IFSelect_SelectRootComps {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend IFSelect_SelectRootComps {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IFSelect_SelectRoots;
class IFSelect_SelectRoots : public IFSelect_SelectExtract {
	public:
		%feature("compactdefaultargs") IFSelect_SelectRoots;
		%feature("autodoc", "	* Creates a SelectRoots

	:rtype: None
") IFSelect_SelectRoots;
		 IFSelect_SelectRoots ();
		%feature("compactdefaultargs") RootResult;
		%feature("autodoc", "	* Returns the list of local roots. It is redefined for a purpose of effeciency : calling a Sort routine for each Entity would cost more ressource than to work in once using a Map RootResult takes in account the Direct status

	:param G:
	:type G: Interface_Graph &
	:rtype: Interface_EntityIterator
") RootResult;
		virtual Interface_EntityIterator RootResult (const Interface_Graph & G);
		%feature("compactdefaultargs") Sort;
		%feature("autodoc", "	* Returns always True, because RootResult has done work

	:param rank:
	:type rank: int
	:param ent:
	:type ent: Handle_Standard_Transient &
	:param model:
	:type model: Handle_Interface_InterfaceModel &
	:rtype: bool
") Sort;
		Standard_Boolean Sort (const Standard_Integer rank,const Handle_Standard_Transient & ent,const Handle_Interface_InterfaceModel & model);
		%feature("compactdefaultargs") ExtractLabel;
		%feature("autodoc", "	* Returns a text defining the criterium : 'Local Root Entities'

	:rtype: TCollection_AsciiString
") ExtractLabel;
		TCollection_AsciiString ExtractLabel ();
};


%extend IFSelect_SelectRoots {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_IFSelect_SelectRoots(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_IFSelect_SelectRoots::Handle_IFSelect_SelectRoots %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_IFSelect_SelectRoots;
class Handle_IFSelect_SelectRoots : public Handle_IFSelect_SelectExtract {

    public:
        // constructors
        Handle_IFSelect_SelectRoots();
        Handle_IFSelect_SelectRoots(const Handle_IFSelect_SelectRoots &aHandle);
        Handle_IFSelect_SelectRoots(const IFSelect_SelectRoots *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_IFSelect_SelectRoots DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_IFSelect_SelectRoots {
    IFSelect_SelectRoots* _get_reference() {
    return (IFSelect_SelectRoots*)$self->Access();
    }
};

%extend Handle_IFSelect_SelectRoots {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend IFSelect_SelectRoots {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IFSelect_SelectSent;
class IFSelect_SelectSent : public IFSelect_SelectExtract {
	public:
		%feature("compactdefaultargs") IFSelect_SelectSent;
		%feature("autodoc", "	* Creates a SelectSent : sentcount = 0 -> remaining (non-sent) entities sentcount = 1, atleast = True (D) -> sent (at least once) sentcount = 2, atleast = True -> duplicated (sent least twice) etc... sentcount = 1, atleast = False -> sent just once (non-dupl.d) sentcount = 2, atleast = False -> sent just twice etc...

	:param sentcount: default value is 1
	:type sentcount: int
	:param atleast: default value is Standard_True
	:type atleast: bool
	:rtype: None
") IFSelect_SelectSent;
		 IFSelect_SelectSent (const Standard_Integer sentcount = 1,const Standard_Boolean atleast = Standard_True);
		%feature("compactdefaultargs") SentCount;
		%feature("autodoc", "	* Returns the queried count of sending

	:rtype: int
") SentCount;
		Standard_Integer SentCount ();
		%feature("compactdefaultargs") AtLeast;
		%feature("autodoc", "	* Returns the <atleast> status, True for sending at least the sending count, False for sending exactly the sending count Remark : if SentCount is 0, AtLeast is ignored

	:rtype: bool
") AtLeast;
		Standard_Boolean AtLeast ();
		%feature("compactdefaultargs") RootResult;
		%feature("autodoc", "	* Returns the list of selected entities. It is redefined to work on the graph itself (not queried by sort) //! An entity is selected if its count complies to the query in Direct Mode, rejected in Reversed Mode //! Query works on the sending count recorded as status in Graph

	:param G:
	:type G: Interface_Graph &
	:rtype: Interface_EntityIterator
") RootResult;
		virtual Interface_EntityIterator RootResult (const Interface_Graph & G);
		%feature("compactdefaultargs") Sort;
		%feature("autodoc", "	* Returns always False because RootResult has done the work

	:param rank:
	:type rank: int
	:param ent:
	:type ent: Handle_Standard_Transient &
	:param model:
	:type model: Handle_Interface_InterfaceModel &
	:rtype: bool
") Sort;
		Standard_Boolean Sort (const Standard_Integer rank,const Handle_Standard_Transient & ent,const Handle_Interface_InterfaceModel & model);
		%feature("compactdefaultargs") ExtractLabel;
		%feature("autodoc", "	* Returns a text defining the criterium : query : SentCount = 0 -> 'Remaining (non-sent) entities' SentCount = 1, AtLeast = True -> 'Sent entities' SentCount = 1, AtLeast = False -> 'Sent once (no duplicated)' SentCount = 2, AtLeast = True -> 'Sent several times entities' SentCount = 2, AtLeast = False -> 'Sent twice entities' SentCount > 2, AtLeast = True -> 'Sent at least <count> times entities' SentCount > 2, AtLeast = False -> 'Sent <count> times entities'

	:rtype: TCollection_AsciiString
") ExtractLabel;
		TCollection_AsciiString ExtractLabel ();
};


%extend IFSelect_SelectSent {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_IFSelect_SelectSent(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_IFSelect_SelectSent::Handle_IFSelect_SelectSent %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_IFSelect_SelectSent;
class Handle_IFSelect_SelectSent : public Handle_IFSelect_SelectExtract {

    public:
        // constructors
        Handle_IFSelect_SelectSent();
        Handle_IFSelect_SelectSent(const Handle_IFSelect_SelectSent &aHandle);
        Handle_IFSelect_SelectSent(const IFSelect_SelectSent *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_IFSelect_SelectSent DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_IFSelect_SelectSent {
    IFSelect_SelectSent* _get_reference() {
    return (IFSelect_SelectSent*)$self->Access();
    }
};

%extend Handle_IFSelect_SelectSent {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend IFSelect_SelectSent {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IFSelect_SelectSignature;
class IFSelect_SelectSignature : public IFSelect_SelectExtract {
	public:
		%feature("compactdefaultargs") IFSelect_SelectSignature;
		%feature("autodoc", "	* Creates a SelectSignature with its Signature and its Text to Match. <exact> if True requires exact match, if False requires <signtext> to be contained in the Signature of the entity (default is 'exact')

	:param matcher:
	:type matcher: Handle_IFSelect_Signature &
	:param signtext:
	:type signtext: char *
	:param exact: default value is Standard_True
	:type exact: bool
	:rtype: None
") IFSelect_SelectSignature;
		 IFSelect_SelectSignature (const Handle_IFSelect_Signature & matcher,const char * signtext,const Standard_Boolean exact = Standard_True);
		%feature("compactdefaultargs") IFSelect_SelectSignature;
		%feature("autodoc", "	* As above with an AsciiString

	:param matcher:
	:type matcher: Handle_IFSelect_Signature &
	:param signtext:
	:type signtext: TCollection_AsciiString &
	:param exact: default value is Standard_True
	:type exact: bool
	:rtype: None
") IFSelect_SelectSignature;
		 IFSelect_SelectSignature (const Handle_IFSelect_Signature & matcher,const TCollection_AsciiString & signtext,const Standard_Boolean exact = Standard_True);
		%feature("compactdefaultargs") IFSelect_SelectSignature;
		%feature("autodoc", "	* Creates a SelectSignature with a Counter, more precisely a SelectSignature. Which is used here to just give a Signature Value (by SignOnly Mode) Matching is the default provided by the class Signature

	:param matcher:
	:type matcher: Handle_IFSelect_SignCounter &
	:param signtext:
	:type signtext: char *
	:param exact: default value is Standard_True
	:type exact: bool
	:rtype: None
") IFSelect_SelectSignature;
		 IFSelect_SelectSignature (const Handle_IFSelect_SignCounter & matcher,const char * signtext,const Standard_Boolean exact = Standard_True);
		%feature("compactdefaultargs") Signature;
		%feature("autodoc", "	* Returns the used Signature, then it is possible to access it, modify it as required. Can be null, hence see Counter

	:rtype: Handle_IFSelect_Signature
") Signature;
		Handle_IFSelect_Signature Signature ();
		%feature("compactdefaultargs") Counter;
		%feature("autodoc", "	* Returns the used SignCounter. Can be used as alternative for Signature

	:rtype: Handle_IFSelect_SignCounter
") Counter;
		Handle_IFSelect_SignCounter Counter ();
		%feature("compactdefaultargs") SortInGraph;
		%feature("autodoc", "	* Returns True for an Entity (model->Value(num)) of which the signature matches the text given as creation time May also work with a Counter from the Graph

	:param rank:
	:type rank: int
	:param ent:
	:type ent: Handle_Standard_Transient &
	:param G:
	:type G: Interface_Graph &
	:rtype: bool
") SortInGraph;
		virtual Standard_Boolean SortInGraph (const Standard_Integer rank,const Handle_Standard_Transient & ent,const Interface_Graph & G);
		%feature("compactdefaultargs") Sort;
		%feature("autodoc", "	* Not called, defined only to remove a deferred method here

	:param rank:
	:type rank: int
	:param ent:
	:type ent: Handle_Standard_Transient &
	:param model:
	:type model: Handle_Interface_InterfaceModel &
	:rtype: bool
") Sort;
		Standard_Boolean Sort (const Standard_Integer rank,const Handle_Standard_Transient & ent,const Handle_Interface_InterfaceModel & model);
		%feature("compactdefaultargs") SignatureText;
		%feature("autodoc", "	* Returns Text used to Sort Entity on its Signature or SignCounter

	:rtype: TCollection_AsciiString
") SignatureText;
		const TCollection_AsciiString & SignatureText ();
		%feature("compactdefaultargs") IsExact;
		%feature("autodoc", "	* Returns True if match must be exact

	:rtype: bool
") IsExact;
		Standard_Boolean IsExact ();
		%feature("compactdefaultargs") ExtractLabel;
		%feature("autodoc", "	* Returns a text defining the criterium. (it refers to the text and exact flag to be matched, and is qualified by the Name provided by the Signature)

	:rtype: TCollection_AsciiString
") ExtractLabel;
		TCollection_AsciiString ExtractLabel ();
};


%extend IFSelect_SelectSignature {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_IFSelect_SelectSignature(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_IFSelect_SelectSignature::Handle_IFSelect_SelectSignature %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_IFSelect_SelectSignature;
class Handle_IFSelect_SelectSignature : public Handle_IFSelect_SelectExtract {

    public:
        // constructors
        Handle_IFSelect_SelectSignature();
        Handle_IFSelect_SelectSignature(const Handle_IFSelect_SelectSignature &aHandle);
        Handle_IFSelect_SelectSignature(const IFSelect_SelectSignature *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_IFSelect_SelectSignature DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_IFSelect_SelectSignature {
    IFSelect_SelectSignature* _get_reference() {
    return (IFSelect_SelectSignature*)$self->Access();
    }
};

%extend Handle_IFSelect_SelectSignature {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend IFSelect_SelectSignature {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IFSelect_SelectSignedShared;
class IFSelect_SelectSignedShared : public IFSelect_SelectExplore {
	public:
		%feature("compactdefaultargs") IFSelect_SelectSignedShared;
		%feature("autodoc", "	* Creates a SelectSignedShared, defaulted for any level with a given Signature and text to match

	:param matcher:
	:type matcher: Handle_IFSelect_Signature &
	:param signtext:
	:type signtext: char *
	:param exact: default value is Standard_True
	:type exact: bool
	:param level: default value is 0
	:type level: int
	:rtype: None
") IFSelect_SelectSignedShared;
		 IFSelect_SelectSignedShared (const Handle_IFSelect_Signature & matcher,const char * signtext,const Standard_Boolean exact = Standard_True,const Standard_Integer level = 0);
		%feature("compactdefaultargs") Signature;
		%feature("autodoc", "	* Returns the used Signature, then it is possible to access it, modify it as required

	:rtype: Handle_IFSelect_Signature
") Signature;
		Handle_IFSelect_Signature Signature ();
		%feature("compactdefaultargs") SignatureText;
		%feature("autodoc", "	* Returns Text used to Sort Entity on its Signature

	:rtype: TCollection_AsciiString
") SignatureText;
		const TCollection_AsciiString & SignatureText ();
		%feature("compactdefaultargs") IsExact;
		%feature("autodoc", "	* Returns True if match must be exact

	:rtype: bool
") IsExact;
		Standard_Boolean IsExact ();
		%feature("compactdefaultargs") Explore;
		%feature("autodoc", "	* Explores an entity : its Shared entities <ent> to take if it matches the Signature At level max, filters the result. Else gives all Shareds

	:param level:
	:type level: int
	:param ent:
	:type ent: Handle_Standard_Transient &
	:param G:
	:type G: Interface_Graph &
	:param explored:
	:type explored: Interface_EntityIterator &
	:rtype: bool
") Explore;
		Standard_Boolean Explore (const Standard_Integer level,const Handle_Standard_Transient & ent,const Interface_Graph & G,Interface_EntityIterator & explored);
		%feature("compactdefaultargs") ExploreLabel;
		%feature("autodoc", "	* Returns a text defining the criterium. (it refers to the text and exact flag to be matched, and is qualified by the Name provided by the Signature)

	:rtype: TCollection_AsciiString
") ExploreLabel;
		TCollection_AsciiString ExploreLabel ();
};


%extend IFSelect_SelectSignedShared {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_IFSelect_SelectSignedShared(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_IFSelect_SelectSignedShared::Handle_IFSelect_SelectSignedShared %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_IFSelect_SelectSignedShared;
class Handle_IFSelect_SelectSignedShared : public Handle_IFSelect_SelectExplore {

    public:
        // constructors
        Handle_IFSelect_SelectSignedShared();
        Handle_IFSelect_SelectSignedShared(const Handle_IFSelect_SelectSignedShared &aHandle);
        Handle_IFSelect_SelectSignedShared(const IFSelect_SelectSignedShared *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_IFSelect_SelectSignedShared DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_IFSelect_SelectSignedShared {
    IFSelect_SelectSignedShared* _get_reference() {
    return (IFSelect_SelectSignedShared*)$self->Access();
    }
};

%extend Handle_IFSelect_SelectSignedShared {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend IFSelect_SelectSignedShared {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IFSelect_SelectSignedSharing;
class IFSelect_SelectSignedSharing : public IFSelect_SelectExplore {
	public:
		%feature("compactdefaultargs") IFSelect_SelectSignedSharing;
		%feature("autodoc", "	* Creates a SelectSignedSharing, defaulted for any level with a given Signature and text to match

	:param matcher:
	:type matcher: Handle_IFSelect_Signature &
	:param signtext:
	:type signtext: char *
	:param exact: default value is Standard_True
	:type exact: bool
	:param level: default value is 0
	:type level: int
	:rtype: None
") IFSelect_SelectSignedSharing;
		 IFSelect_SelectSignedSharing (const Handle_IFSelect_Signature & matcher,const char * signtext,const Standard_Boolean exact = Standard_True,const Standard_Integer level = 0);
		%feature("compactdefaultargs") Signature;
		%feature("autodoc", "	* Returns the used Signature, then it is possible to access it, modify it as required

	:rtype: Handle_IFSelect_Signature
") Signature;
		Handle_IFSelect_Signature Signature ();
		%feature("compactdefaultargs") SignatureText;
		%feature("autodoc", "	* Returns Text used to Sort Entity on its Signature

	:rtype: TCollection_AsciiString
") SignatureText;
		const TCollection_AsciiString & SignatureText ();
		%feature("compactdefaultargs") IsExact;
		%feature("autodoc", "	* Returns True if match must be exact

	:rtype: bool
") IsExact;
		Standard_Boolean IsExact ();
		%feature("compactdefaultargs") Explore;
		%feature("autodoc", "	* Explores an entity : its sharing entities <ent> to take if it matches the Signature At level max, filters the result. Else gives all sharings

	:param level:
	:type level: int
	:param ent:
	:type ent: Handle_Standard_Transient &
	:param G:
	:type G: Interface_Graph &
	:param explored:
	:type explored: Interface_EntityIterator &
	:rtype: bool
") Explore;
		Standard_Boolean Explore (const Standard_Integer level,const Handle_Standard_Transient & ent,const Interface_Graph & G,Interface_EntityIterator & explored);
		%feature("compactdefaultargs") ExploreLabel;
		%feature("autodoc", "	* Returns a text defining the criterium. (it refers to the text and exact flag to be matched, and is qualified by the Name provided by the Signature)

	:rtype: TCollection_AsciiString
") ExploreLabel;
		TCollection_AsciiString ExploreLabel ();
};


%extend IFSelect_SelectSignedSharing {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_IFSelect_SelectSignedSharing(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_IFSelect_SelectSignedSharing::Handle_IFSelect_SelectSignedSharing %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_IFSelect_SelectSignedSharing;
class Handle_IFSelect_SelectSignedSharing : public Handle_IFSelect_SelectExplore {

    public:
        // constructors
        Handle_IFSelect_SelectSignedSharing();
        Handle_IFSelect_SelectSignedSharing(const Handle_IFSelect_SelectSignedSharing &aHandle);
        Handle_IFSelect_SelectSignedSharing(const IFSelect_SelectSignedSharing *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_IFSelect_SelectSignedSharing DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_IFSelect_SelectSignedSharing {
    IFSelect_SelectSignedSharing* _get_reference() {
    return (IFSelect_SelectSignedSharing*)$self->Access();
    }
};

%extend Handle_IFSelect_SelectSignedSharing {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend IFSelect_SelectSignedSharing {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IFSelect_SelectUnknownEntities;
class IFSelect_SelectUnknownEntities : public IFSelect_SelectExtract {
	public:
		%feature("compactdefaultargs") IFSelect_SelectUnknownEntities;
		%feature("autodoc", "	* Creates a SelectUnknownEntities

	:rtype: None
") IFSelect_SelectUnknownEntities;
		 IFSelect_SelectUnknownEntities ();
		%feature("compactdefaultargs") Sort;
		%feature("autodoc", "	* Returns True for an Entity which is qualified as 'Unknown', i.e. if <model> known <ent> (through its Number) as Unknown

	:param rank:
	:type rank: int
	:param ent:
	:type ent: Handle_Standard_Transient &
	:param model:
	:type model: Handle_Interface_InterfaceModel &
	:rtype: bool
") Sort;
		Standard_Boolean Sort (const Standard_Integer rank,const Handle_Standard_Transient & ent,const Handle_Interface_InterfaceModel & model);
		%feature("compactdefaultargs") ExtractLabel;
		%feature("autodoc", "	* Returns a text defining the criterium : 'Recognized Entities'

	:rtype: TCollection_AsciiString
") ExtractLabel;
		TCollection_AsciiString ExtractLabel ();
};


%extend IFSelect_SelectUnknownEntities {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_IFSelect_SelectUnknownEntities(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_IFSelect_SelectUnknownEntities::Handle_IFSelect_SelectUnknownEntities %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_IFSelect_SelectUnknownEntities;
class Handle_IFSelect_SelectUnknownEntities : public Handle_IFSelect_SelectExtract {

    public:
        // constructors
        Handle_IFSelect_SelectUnknownEntities();
        Handle_IFSelect_SelectUnknownEntities(const Handle_IFSelect_SelectUnknownEntities &aHandle);
        Handle_IFSelect_SelectUnknownEntities(const IFSelect_SelectUnknownEntities *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_IFSelect_SelectUnknownEntities DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_IFSelect_SelectUnknownEntities {
    IFSelect_SelectUnknownEntities* _get_reference() {
    return (IFSelect_SelectUnknownEntities*)$self->Access();
    }
};

%extend Handle_IFSelect_SelectUnknownEntities {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend IFSelect_SelectUnknownEntities {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IFSelect_SelectIncorrectEntities;
class IFSelect_SelectIncorrectEntities : public IFSelect_SelectFlag {
	public:
		%feature("compactdefaultargs") IFSelect_SelectIncorrectEntities;
		%feature("autodoc", "	* Creates a SelectIncorrectEntities i.e. a SelectFlag('Incorrect')

	:rtype: None
") IFSelect_SelectIncorrectEntities;
		 IFSelect_SelectIncorrectEntities ();
};


%extend IFSelect_SelectIncorrectEntities {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_IFSelect_SelectIncorrectEntities(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_IFSelect_SelectIncorrectEntities::Handle_IFSelect_SelectIncorrectEntities %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_IFSelect_SelectIncorrectEntities;
class Handle_IFSelect_SelectIncorrectEntities : public Handle_IFSelect_SelectFlag {

    public:
        // constructors
        Handle_IFSelect_SelectIncorrectEntities();
        Handle_IFSelect_SelectIncorrectEntities(const Handle_IFSelect_SelectIncorrectEntities &aHandle);
        Handle_IFSelect_SelectIncorrectEntities(const IFSelect_SelectIncorrectEntities *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_IFSelect_SelectIncorrectEntities DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_IFSelect_SelectIncorrectEntities {
    IFSelect_SelectIncorrectEntities* _get_reference() {
    return (IFSelect_SelectIncorrectEntities*)$self->Access();
    }
};

%extend Handle_IFSelect_SelectIncorrectEntities {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend IFSelect_SelectIncorrectEntities {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IFSelect_SelectType;
class IFSelect_SelectType : public IFSelect_SelectAnyType {
	public:
		%feature("compactdefaultargs") IFSelect_SelectType;
		%feature("autodoc", "	* Creates a SelectType. Default is no filter

	:rtype: None
") IFSelect_SelectType;
		 IFSelect_SelectType ();
		%feature("compactdefaultargs") IFSelect_SelectType;
		%feature("autodoc", "	* Creates a SelectType for a given Type

	:param atype:
	:type atype: Handle_Standard_Type &
	:rtype: None
") IFSelect_SelectType;
		 IFSelect_SelectType (const Handle_Standard_Type & atype);
		%feature("compactdefaultargs") SetType;
		%feature("autodoc", "	* Sets a TYpe for filter

	:param atype:
	:type atype: Handle_Standard_Type &
	:rtype: None
") SetType;
		void SetType (const Handle_Standard_Type & atype);
		%feature("compactdefaultargs") TypeForMatch;
		%feature("autodoc", "	* Returns the Type to be matched for select : this is the type given at instantiation time

	:rtype: Handle_Standard_Type
") TypeForMatch;
		Handle_Standard_Type TypeForMatch ();
		%feature("compactdefaultargs") ExtractLabel;
		%feature("autodoc", "	* Returns a text defining the criterium. (should by gotten from Type of Entity used for instantiation)

	:rtype: TCollection_AsciiString
") ExtractLabel;
		TCollection_AsciiString ExtractLabel ();
};


%extend IFSelect_SelectType {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_IFSelect_SelectType(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_IFSelect_SelectType::Handle_IFSelect_SelectType %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_IFSelect_SelectType;
class Handle_IFSelect_SelectType : public Handle_IFSelect_SelectAnyType {

    public:
        // constructors
        Handle_IFSelect_SelectType();
        Handle_IFSelect_SelectType(const Handle_IFSelect_SelectType &aHandle);
        Handle_IFSelect_SelectType(const IFSelect_SelectType *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_IFSelect_SelectType DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_IFSelect_SelectType {
    IFSelect_SelectType* _get_reference() {
    return (IFSelect_SelectType*)$self->Access();
    }
};

%extend Handle_IFSelect_SelectType {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend IFSelect_SelectType {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
