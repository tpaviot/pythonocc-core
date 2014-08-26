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
%module IFSelect

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

%include IFSelect_required_python_modules.i
%include IFSelect_headers.i

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
%nodefaultctor IFSelect;
class IFSelect {
	public:
		%feature("autodoc", "Args:
	WS(Handle_IFSelect_WorkSession)
	file(char *)

Returns:
	static Standard_Boolean

Saves the state of a WorkSession from IFSelect, by using a  
          SessionFile from IFSelect. Returns True if Done, False in  
          case of Error on Writing. <file> gives the name of the File  
          to be produced (this avoids to export the class SessionFile).") SaveSession;
		static Standard_Boolean SaveSession (const Handle_IFSelect_WorkSession & WS,const char * file);
		%feature("autodoc", "Args:
	WS(Handle_IFSelect_WorkSession)
	file(char *)

Returns:
	static Standard_Boolean

Restore the state of a WorkSession from IFSelect, by using a  
          SessionFile from IFSelect. Returns True if Done, False in  
          case of Error on Writing. <file> gives the name of the File  
          to be used (this avoids to export the class SessionFile).") RestoreSession;
		static Standard_Boolean RestoreSession (const Handle_IFSelect_WorkSession & WS,const char * file);
};


%feature("shadow") IFSelect::~IFSelect %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IFSelect {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IFSelect_Activator;
class IFSelect_Activator : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	actor(Handle_IFSelect_Activator)
	number(Standard_Integer)
	command(char *)
	mode(Standard_Integer)

Returns:
	static void

Records, in a Dictionary available for all the Activators,  
          the command title an Activator can process, attached with  
          its number, proper for this Activator  
          <mode> allows to distinguish various execution modes  
            0: default mode; 1 : for xset") Adding;
		static void Adding (const Handle_IFSelect_Activator & actor,const Standard_Integer number,const char * command,const Standard_Integer mode);
		%feature("autodoc", "Args:
	number(Standard_Integer)
	command(char *)

Returns:
	None

Allows a self-definition by an Activator of the Commands it  
          processes, call the class method Adding (mode 0)") Add;
		void Add (const Standard_Integer number,const char * command);
		%feature("autodoc", "Args:
	number(Standard_Integer)
	command(char *)

Returns:
	None

Same as Add but specifies that this command is candidate for  
          xset (creation of items, xset : named items; mode 1)") AddSet;
		void AddSet (const Standard_Integer number,const char * command);
		%feature("autodoc", "Args:
	command(char *)

Returns:
	static void

Removes a Command, if it is recorded (else, does nothing)") Remove;
		static void Remove (const char * command);
		%feature("autodoc", "Args:
	conf(char *)
	command(char *)
	aliasname(char *)

Returns:
	static void

Records, for a configuration named <conf>, that the command  
          <command> may be aliased by another command <alias>  
 
          To be used by call to Alias (no automatic redirection)  
          The configuration typically refers to a norm") SetAlias;
		static void SetAlias (const char * conf,const char * command,const char * aliasname);
		%feature("autodoc", "Args:
	conf(char *)

Returns:
	static void

Sets <conf> as current configuration for aliases") SetCurrentAlias;
		static void SetCurrentAlias (const char * conf);
		%feature("autodoc", "Args:
	command(char *)

Returns:
	static TCollection_AsciiString

Returns, in the current configuration, what alias has been  
          recorded for <command>  
          The returned string is empty if no alias is recorded") Alias;
		static TCollection_AsciiString Alias (const char * command);
		%feature("autodoc", "Args:
	command(char *)
	number(Standard_Integer)
	actor(Handle_IFSelect_Activator)

Returns:
	static Standard_Boolean

Selects, for a Command given by its title, an actor with its  
          command number. Returns True if found, False else") Select;
		static Standard_Boolean Select (const char * command,Standard_Integer &OutValue,Handle_IFSelect_Activator & actor);
		%feature("autodoc", "Args:
	command(char *)

Returns:
	static Standard_Integer

Returns mode recorded for a command. -1 if not found") Mode;
		static Standard_Integer Mode (const char * command);
		%feature("autodoc", "Args:
	mode(Standard_Integer)=- 1
	command(char *)=

Returns:
	static Handle_TColStd_HSequenceOfAsciiString

Returns, for a root of command title, the list of possible  
          commands.  
          <mode> : -1 (D) for all commands if <commands> is empty  
          -1 + command : about a Group , >= 0 see Adding  
          By default, it returns the whole list of known commands.") Commands;
		static Handle_TColStd_HSequenceOfAsciiString Commands (const Standard_Integer mode = - 1,const char * command = "");
		%feature("autodoc", "Args:
	number(Standard_Integer)
	pilot(Handle_IFSelect_SessionPilot)

Returns:
	virtual IFSelect_ReturnStatus

Tries to execute a Command Line. <number> is the number of the  
          command for this Activator. It Must forecast to record the  
          result of the execution, for need of Undo-Redo  
          Must Returns : 0 for a void command (not to be recorded),  
          1 if execution OK, -1 if command incorrect, -2 if error  
          on execution") Do;
		virtual IFSelect_ReturnStatus Do (const Standard_Integer number,const Handle_IFSelect_SessionPilot & pilot);
		%feature("autodoc", "Args:
	number(Standard_Integer)

Returns:
	virtual char *

Sends a short help message for a given command identified by  
          it number for this Activator (must take one line max)") Help;
		virtual char * Help (const Standard_Integer number);
		%feature("autodoc", "Args:
	None
Returns:
	char *

No detailed docstring for this function.") Group;
		char * Group ();
		%feature("autodoc", "Args:
	None
Returns:
	char *

No detailed docstring for this function.") File;
		char * File ();
		%feature("autodoc", "Args:
	group(char *)
	file(char *)=

Returns:
	None

Group and SetGroup define a 'Group of commands' which  
          correspond to an Activator. Default is 'XSTEP'  
          Also a file may be attached") SetForGroup;
		void SetForGroup (const char * group,const char * file = "");
};


%feature("shadow") IFSelect_Activator::~IFSelect_Activator %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IFSelect_Activator {
	void _kill_pointed() {
		delete $self;
	}
};
%extend IFSelect_Activator {
	Handle_IFSelect_Activator GetHandle() {
	return *(Handle_IFSelect_Activator*) &$self;
	}
};

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
    IFSelect_Activator* GetObject() {
    return (IFSelect_Activator*)$self->Access();
    }
};
%feature("shadow") Handle_IFSelect_Activator::~Handle_IFSelect_Activator %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_IFSelect_Activator {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor IFSelect_AppliedModifiers;
class IFSelect_AppliedModifiers : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	nbmax(Standard_Integer)
	nbent(Standard_Integer)

Returns:
	None

Creates an AppliedModifiers, ready to record up to <nbmax>  
          modifiers, on a model of <nbent> entities") IFSelect_AppliedModifiers;
		 IFSelect_AppliedModifiers (const Standard_Integer nbmax,const Standard_Integer nbent);
		%feature("autodoc", "Args:
	modif(Handle_IFSelect_GeneralModifier)

Returns:
	Standard_Boolean

Records a modifier. By default, it is to apply on all a  
          produced file. Further calls to AddNum will restrict this.  
          Returns True if done, False if too many modifiers are already  
          recorded") AddModif;
		Standard_Boolean AddModif (const Handle_IFSelect_GeneralModifier & modif);
		%feature("autodoc", "Args:
	nument(Standard_Integer)

Returns:
	Standard_Boolean

Adds a number of entity of the output file to be applied on.  
          If a sequence of AddNum is called after AddModif, this  
          Modifier will be applied on the list of designated entities.  
          Else, it will be applied on all the file  
          Returns True if done, False if no modifier has yet been added") AddNum;
		Standard_Boolean AddNum (const Standard_Integer nument);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the count of recorded modifiers") Count;
		Standard_Integer Count ();
		%feature("autodoc", "Args:
	num(Standard_Integer)
	modif(Handle_IFSelect_GeneralModifier)
	entcount(Standard_Integer)

Returns:
	Standard_Boolean

Returns the description for applied modifier n0 <num> :  
          the modifier itself, and the count of entities to be applied  
          on. If no specific list of number has been defined, returns  
          the total count of entities of the file  
          If this count is zero, then the modifier applies to all  
          the file (see below). Else, the numbers are then queried by  
          calls to ItemNum between 1 and <entcount>  
          Returns True if OK, False if <num> is out of range") Item;
		Standard_Boolean Item (const Standard_Integer num,Handle_IFSelect_GeneralModifier & modif,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	nument(Standard_Integer)

Returns:
	Standard_Integer

Returns a numero of entity to be applied on, given its rank  
          in the list. If no list is defined (i.e. for all the file),  
          returns <nument> itself, to give all the entities of the file  
          Returns 0 if <nument> out of range") ItemNum;
		Standard_Integer ItemNum (const Standard_Integer nument);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TColStd_HSequenceOfInteger

Returns the list of entities to be applied on (see Item)  
          as a HSequence (IsForAll produces the complete list of all  
          the entity numbers of the file") ItemList;
		Handle_TColStd_HSequenceOfInteger ItemList ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True if the applied modifier queried by last call to  
          Item is to be applied to all the produced file.  
          Else, <entcount> returned by Item gives the count of entity  
          numbers, each one is queried by ItemNum") IsForAll;
		Standard_Boolean IsForAll ();
};


%feature("shadow") IFSelect_AppliedModifiers::~IFSelect_AppliedModifiers %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IFSelect_AppliedModifiers {
	void _kill_pointed() {
		delete $self;
	}
};
%extend IFSelect_AppliedModifiers {
	Handle_IFSelect_AppliedModifiers GetHandle() {
	return *(Handle_IFSelect_AppliedModifiers*) &$self;
	}
};

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
    IFSelect_AppliedModifiers* GetObject() {
    return (IFSelect_AppliedModifiers*)$self->Access();
    }
};
%feature("shadow") Handle_IFSelect_AppliedModifiers::~Handle_IFSelect_AppliedModifiers %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_IFSelect_AppliedModifiers {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor IFSelect_ContextModif;
class IFSelect_ContextModif {
	public:
		%feature("autodoc", "Args:
	graph(Interface_Graph)
	TC(Interface_CopyTool)
	filename(char *)=

Returns:
	None

Prepares a ContextModif with these informations :  
          - the graph established from original model (target passed  
            directly to Modifier)  
          - the CopyTool which detains the CopyControl, which maps  
            starting (in original) and result (in target) entities  
          - an optional file name (for file output)  
 
          Such a ContextModif is considered to be applied on all  
          transferred entities (no filter active)") IFSelect_ContextModif;
		 IFSelect_ContextModif (const Interface_Graph & graph,const Interface_CopyTool & TC,const char * filename = "");
		%feature("autodoc", "Args:
	graph(Interface_Graph)
	filename(char *)=

Returns:
	None

Prepares a ContextModif with these informations :  
          - the graph established from original model (target passed  
            directly to Modifier)  
          - an optional file name (for file output)  
          Here, no CopyControl, hence all entities are considered equal  
          as starting and result  
 
          Such a ContextModif is considered to be applied on all  
          transferred entities (no filter active)") IFSelect_ContextModif;
		 IFSelect_ContextModif (const Interface_Graph & graph,const char * filename = "");
		%feature("autodoc", "Args:
	list(Interface_EntityIterator)

Returns:
	None

This method requires ContextModif to be applied with a filter.  
          If a ModelModifier is defined with a Selection criterium,  
          the result of this Selection is used as a filter :  
          - if none of its items has been transferred, the modification  
            does not apply at all  
          - else, the Modifier can query for what entities were selected  
            and what are their results  
          - if this method is not called before working, the Modifier  
            has to work on the whole Model") Select;
		void Select (Interface_EntityIterator & list);
		%feature("autodoc", "Args:
	None
Returns:
	Interface_Graph

Returns the original Graph (compared to OriginalModel, it  
          gives more query capabilitites)") OriginalGraph;
		const Interface_Graph & OriginalGraph ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Interface_InterfaceModel

Returns the original model") OriginalModel;
		Handle_Interface_InterfaceModel OriginalModel ();
		%feature("autodoc", "Args:
	proto(Handle_Interface_Protocol)

Returns:
	None

Allows to transmit a Protocol as part of a ContextModif") SetProtocol;
		void SetProtocol (const Handle_Interface_Protocol & proto);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Interface_Protocol

Returns the Protocol (Null if not set)") Protocol;
		Handle_Interface_Protocol Protocol ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True if a non empty file name has been defined") HasFileName;
		Standard_Boolean HasFileName ();
		%feature("autodoc", "Args:
	None
Returns:
	char *

Returns File Name (can be empty)") FileName;
		char * FileName ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Interface_CopyControl

Returns the map for a direct use, if required") Control;
		Handle_Interface_CopyControl Control ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True if Select has determined that a Modifier may not  
          be run (filter defined and empty)") IsForNone;
		Standard_Boolean IsForNone ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True if no filter is defined : a Modifier has to work  
          on all entities of the resulting (target) model") IsForAll;
		Standard_Boolean IsForAll ();
		%feature("autodoc", "Args:
	ent(Handle_Standard_Transient)

Returns:
	Standard_Boolean

Returns True if a starting item has been transferred") IsTransferred;
		Standard_Boolean IsTransferred (const Handle_Standard_Transient & ent);
		%feature("autodoc", "Args:
	ent(Handle_Standard_Transient)

Returns:
	Standard_Boolean

Returns True if a starting item has been transferred and selected") IsSelected;
		Standard_Boolean IsSelected (const Handle_Standard_Transient & ent);
		%feature("autodoc", "Args:
	None
Returns:
	Interface_EntityIterator

Returns the list of original selected items.  
          See also the iteration") SelectedOriginal;
		Interface_EntityIterator SelectedOriginal ();
		%feature("autodoc", "Args:
	None
Returns:
	Interface_EntityIterator

Returns the list of resulting counterparts of selected items.  
          See also the iteration") SelectedResult;
		Interface_EntityIterator SelectedResult ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the count of selected and transferred items") SelectedCount;
		Standard_Integer SelectedCount ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Starts an iteration on selected items. It takes into account  
          IsForAll/IsForNone, by really iterating on all selected items.") Start;
		void Start ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True until the iteration has finished") More;
		Standard_Boolean More ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Advances the iteration") Next;
		void Next ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Standard_Transient

Returns the current selected item in the original model") ValueOriginal;
		Handle_Standard_Transient ValueOriginal ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Standard_Transient

Returns the result counterpart of current selected item  
          (in the target model)") ValueResult;
		Handle_Standard_Transient ValueResult ();
		%feature("autodoc", "Args:
	modif(Handle_IFSelect_GeneralModifier)

Returns:
	None

Traces the application of a Modifier. Works with default trace  
          File and Level. Fills the trace if default trace level is at  
          least 1. Traces the Modifier (its Label) and its Selection if  
          there is one (its Label).  
          To be called after Select (because status IsForAll is printed)  
          Worths to trace a global modification. See also Trace below") TraceModifier;
		void TraceModifier (const Handle_IFSelect_GeneralModifier & modif);
		%feature("autodoc", "Args:
	mess(char *)=

Returns:
	None

Traces the modification of the current entity (see above,  
          ValueOriginal and ValueResult) for default trace level >= 2.  
          To be called on each indivudual entity really modified  
          <mess> is an optionnal additional message") Trace;
		void Trace (const char * mess = "");
		%feature("autodoc", "Args:
	check(Handle_Interface_Check)

Returns:
	None

Adds a Check to the CheckList. If it is empty, nothing is done  
          If it concerns an Entity from the Original Model (by SetEntity)  
          to which another Check is attached, it is merged to it.  
          Else, it is added or merged as to GlobalCheck.") AddCheck;
		void AddCheck (const Handle_Interface_Check & check);
		%feature("autodoc", "Args:
	start(Handle_Standard_Transient)
	mess(char *)
	orig(char *)=

Returns:
	None

Adds a Warning Message for an Entity from the original Model  
          If <start> is not an Entity from the original model (e.g. the  
          model itself) this message is added to Global Check.") AddWarning;
		void AddWarning (const Handle_Standard_Transient & start,const char * mess,const char * orig = "");
		%feature("autodoc", "Args:
	start(Handle_Standard_Transient)
	mess(char *)
	orig(char *)=

Returns:
	None

Adds a Fail Message for an Entity from the original Model  
          If <start> is not an Entity from the original model (e.g. the  
          model itself) this message is added to Global Check.") AddFail;
		void AddFail (const Handle_Standard_Transient & start,const char * mess,const char * orig = "");
		%feature("autodoc", "Args:
	num(Standard_Integer)=0

Returns:
	Handle_Interface_Check

Returns a Check given an Entity number (in the original Model)  
          by default a Global Check. Creates it the first time.  
          It can then be acknowledged on the spot, in condition that the  
          caller works by reference ('Interface_Check& check = ...')") CCheck;
		Handle_Interface_Check CCheck (const Standard_Integer num = 0);
		%feature("autodoc", "Args:
	start(Handle_Standard_Transient)

Returns:
	Handle_Interface_Check

Returns a Check attached to an Entity from the original Model  
          It can then be acknowledged on the spot, in condition that the  
          caller works by reference ('Interface_Check& check = ...')") CCheck;
		Handle_Interface_Check CCheck (const Handle_Standard_Transient & start);
		%feature("autodoc", "Args:
	None
Returns:
	Interface_CheckIterator

Returns the complete CheckList") CheckList;
		Interface_CheckIterator CheckList ();
};


%feature("shadow") IFSelect_ContextModif::~IFSelect_ContextModif %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IFSelect_ContextModif {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IFSelect_ContextWrite;
class IFSelect_ContextWrite {
	public:
		%feature("autodoc", "Args:
	model(Handle_Interface_InterfaceModel)
	proto(Handle_Interface_Protocol)
	applieds(Handle_IFSelect_AppliedModifiers)
	filename(char *)

Returns:
	None

Prepares a ContextWrite with these informations :  
          - the model which is to be written  
          - the protocol to be used  
          - the filename  
          - an object AppliedModifiers to work. It gives a list of  
            FileModifiers to be ran, and for each one it can give  
            a restricted list of entities (in the model), else all  
            the model is considered") IFSelect_ContextWrite;
		 IFSelect_ContextWrite (const Handle_Interface_InterfaceModel & model,const Handle_Interface_Protocol & proto,const Handle_IFSelect_AppliedModifiers & applieds,const char * filename);
		%feature("autodoc", "Args:
	hgraph(Handle_Interface_HGraph)
	proto(Handle_Interface_Protocol)
	applieds(Handle_IFSelect_AppliedModifiers)
	filename(char *)

Returns:
	None

Same as above but with an already computed Graph") IFSelect_ContextWrite;
		 IFSelect_ContextWrite (const Handle_Interface_HGraph & hgraph,const Handle_Interface_Protocol & proto,const Handle_IFSelect_AppliedModifiers & applieds,const char * filename);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Interface_InterfaceModel

Returns the Model") Model;
		Handle_Interface_InterfaceModel Model ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Interface_Protocol

Returns the Protocol;") Protocol;
		Handle_Interface_Protocol Protocol ();
		%feature("autodoc", "Args:
	None
Returns:
	char *

Returns the File Name") FileName;
		char * FileName ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_IFSelect_AppliedModifiers

Returns the object AppliedModifiers") AppliedModifiers;
		Handle_IFSelect_AppliedModifiers AppliedModifiers ();
		%feature("autodoc", "Args:
	None
Returns:
	Interface_Graph

Returns the Graph, either given when created, else created  
          the first time it is queried") Graph;
		const Interface_Graph & Graph ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the count of recorded File Modifiers") NbModifiers;
		Standard_Integer NbModifiers ();
		%feature("autodoc", "Args:
	numod(Standard_Integer)

Returns:
	Standard_Boolean

Sets active the File Modifier n0 <numod>  
          Then, it prepares the list of entities to consider, if any  
          Returns False if <numod> out of range") SetModifier;
		Standard_Boolean SetModifier (const Standard_Integer numod);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_IFSelect_GeneralModifier

Returns the currently active File Modifier. Cast to be done  
          Null if not properly set : must be test IsNull after casting") FileModifier;
		Handle_IFSelect_GeneralModifier FileModifier ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True if no modifier is currently set") IsForNone;
		Standard_Boolean IsForNone ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True if the current modifier is to be applied to  
          the whole model. Else, a restricted list of selected entities  
          is defined, it can be exploited by the File Modifier") IsForAll;
		Standard_Boolean IsForAll ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the total count of selected entities") NbEntities;
		Standard_Integer NbEntities ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Starts an iteration on selected items. It takes into account  
          IsForAll/IsForNone, by really iterating on all selected items.") Start;
		void Start ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True until the iteration has finished") More;
		Standard_Boolean More ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Advances the iteration") Next;
		void Next ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Standard_Transient

Returns the current selected entity in the model") Value;
		Handle_Standard_Transient Value ();
		%feature("autodoc", "Args:
	check(Handle_Interface_Check)

Returns:
	None

Adds a Check to the CheckList. If it is empty, nothing is done  
          If it concerns an Entity from the Model (by SetEntity)  
          to which another Check is attached, it is merged to it.  
          Else, it is added or merged as to GlobalCheck.") AddCheck;
		void AddCheck (const Handle_Interface_Check & check);
		%feature("autodoc", "Args:
	start(Handle_Standard_Transient)
	mess(char *)
	orig(char *)=

Returns:
	None

Adds a Warning Message for an Entity from the Model  
          If <start> is not an Entity from the model (e.g. the  
          model itself) this message is added to Global Check.") AddWarning;
		void AddWarning (const Handle_Standard_Transient & start,const char * mess,const char * orig = "");
		%feature("autodoc", "Args:
	start(Handle_Standard_Transient)
	mess(char *)
	orig(char *)=

Returns:
	None

Adds a Fail Message for an Entity from the Model  
          If <start> is not an Entity from the model (e.g. the  
          model itself) this message is added to Global Check.") AddFail;
		void AddFail (const Handle_Standard_Transient & start,const char * mess,const char * orig = "");
		%feature("autodoc", "Args:
	num(Standard_Integer)=0

Returns:
	Handle_Interface_Check

Returns a Check given an Entity number (in the Model)  
          by default a Global Check. Creates it the first time.  
          It can then be acknowledged on the spot, in condition that the  
          caller works by reference ('Interface_Check& check = ...')") CCheck;
		Handle_Interface_Check CCheck (const Standard_Integer num = 0);
		%feature("autodoc", "Args:
	start(Handle_Standard_Transient)

Returns:
	Handle_Interface_Check

Returns a Check attached to an Entity from the Model  
          It can then be acknowledged on the spot, in condition that the  
          caller works by reference ('Interface_Check& check = ...')") CCheck;
		Handle_Interface_Check CCheck (const Handle_Standard_Transient & start);
		%feature("autodoc", "Args:
	None
Returns:
	Interface_CheckIterator

Returns the complete CheckList") CheckList;
		Interface_CheckIterator CheckList ();
};


%feature("shadow") IFSelect_ContextWrite::~IFSelect_ContextWrite %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IFSelect_ContextWrite {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IFSelect_Dispatch;
class IFSelect_Dispatch : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	name(Handle_TCollection_HAsciiString)

Returns:
	None

Sets a Root Name as an HAsciiString  
          To reset it, give a Null Handle (then, a ShareOut will have  
          to define the Default Root Name)") SetRootName;
		void SetRootName (const Handle_TCollection_HAsciiString & name);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True if a specific Root Name has been set  
          (else, the Default Root Name has to be used)") HasRootName;
		Standard_Boolean HasRootName ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TCollection_HAsciiString

Returns the Root Name for files produced by this dispatch  
          It is empty if it has not been set or if it has been reset") RootName;
		const Handle_TCollection_HAsciiString & RootName ();
		%feature("autodoc", "Args:
	sel(Handle_IFSelect_Selection)

Returns:
	None

Stores (or Changes) the Final Selection for a Dispatch") SetFinalSelection;
		void SetFinalSelection (const Handle_IFSelect_Selection & sel);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_IFSelect_Selection

Returns the Final Selection of a Dispatch  
we 'd like : C++ : return const &") FinalSelection;
		Handle_IFSelect_Selection FinalSelection ();
		%feature("autodoc", "Args:
	None
Returns:
	IFSelect_SelectionIterator

Returns the complete list of source Selections (starting  
          from FinalSelection)") Selections;
		IFSelect_SelectionIterator Selections ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

Returns True if a Dispatch can have a Remainder, i.e. if its  
          criterium can let entities apart. It is a potential answer,  
          remainder can be empty at run-time even if answer is True.  
          (to attach a RemainderFromDispatch Selection is not allowed if  
          answer is True).  
          Default answer given here is False (can be redefined)") CanHaveRemainder;
		virtual Standard_Boolean CanHaveRemainder ();
		%feature("autodoc", "Args:
	nbent(Standard_Integer)
	max(Standard_Integer)

Returns:
	virtual Standard_Boolean

Returns True if a Dispatch generates a count of Packets always  
          less than or equal to a maximum value : it can be computed  
          from the total count of Entities to be dispatched : <nbent>.  
          If answer is False, no limited maximum is expected for account  
          If answer is True, expected maximum is given in argument <max>  
          Default answer given here is False (can be redefined)") LimitedMax;
		virtual Standard_Boolean LimitedMax (const Standard_Integer nbent,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	virtual TCollection_AsciiString

Returns a text which defines the way a Dispatch produces  
          packets (which will become files) from its Input") Label;
		virtual TCollection_AsciiString Label ();
		%feature("autodoc", "Args:
	G(Interface_Graph)

Returns:
	Interface_EntityIterator

Gets Unique Root Entities from the Final Selection, given an  
          input Graph  
          This the starting step for an Evaluation (Packets - Remainder)") GetEntities;
		Interface_EntityIterator GetEntities (const Interface_Graph & G);
		%feature("autodoc", "Args:
	G(Interface_Graph)
	count(Standard_Integer)

Returns:
	virtual Standard_Integer

Returns True if Count of Packets is actually known, and the  
          value of the count in argument 'count'. Returns False if  
          this count is unknown. Input is given as a Graph.  
          This method is intended to be quick (used for file names)  
          hence if this count is long to compute (that is, as a result  
          of complete evaluation made by method Packets), it is  
          preferable to answer 'unknown' by returning False  
          Default answer if False. Can be redefined.") PacketsCount;
		virtual Standard_Integer PacketsCount (const Interface_Graph & G,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	G(Interface_Graph)
	packs(IFGraph_SubPartsIterator)

Returns:
	virtual void

Returns the list of produced Packets into argument <pack>.  
          Each Packet corresponds to a Part, the Entities listed are the  
          Roots given by the Selection. Input is given as a Graph.  
          Thus, to create a file from a packet, it suffices to take the  
          entities listed in a Part of Packets (that is, a Packet)  
          without worrying about Shared entities  
          This method can raise an Exception if data are not coherent") Packets;
		virtual void Packets (const Interface_Graph & G,IFGraph_SubPartsIterator & packs);
		%feature("autodoc", "Args:
	G(Interface_Graph)

Returns:
	Interface_EntityIterator

Returns the list of all Input Entities (see GetEntities) which  
          are put in a Packet. That is, Entities listed in GetEntities  
          but not in Remainder (see below). Input is given as a Graph.") Packeted;
		Interface_EntityIterator Packeted (const Interface_Graph & G);
		%feature("autodoc", "Args:
	G(Interface_Graph)

Returns:
	virtual Interface_EntityIterator

Returns Remainder which is a set of Entities. Can be empty.  
          Default evaluation is empty (has to be redefined if  
          CanHaveRemainder is redefined to return True).") Remainder;
		virtual Interface_EntityIterator Remainder (const Interface_Graph & G);
};


%feature("shadow") IFSelect_Dispatch::~IFSelect_Dispatch %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IFSelect_Dispatch {
	void _kill_pointed() {
		delete $self;
	}
};
%extend IFSelect_Dispatch {
	Handle_IFSelect_Dispatch GetHandle() {
	return *(Handle_IFSelect_Dispatch*) &$self;
	}
};

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
    IFSelect_Dispatch* GetObject() {
    return (IFSelect_Dispatch*)$self->Access();
    }
};
%feature("shadow") Handle_IFSelect_Dispatch::~Handle_IFSelect_Dispatch %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_IFSelect_Dispatch {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor IFSelect_EditForm;
class IFSelect_EditForm : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	editor(Handle_IFSelect_Editor)
	readonly(Standard_Boolean)
	undoable(Standard_Boolean)
	label(char *)=

Returns:
	None

Creates a complete EditForm from an Editor  
          A specific Label can be given") IFSelect_EditForm;
		 IFSelect_EditForm (const Handle_IFSelect_Editor & editor,const Standard_Boolean readonly,const Standard_Boolean undoable,const char * label = "");
		%feature("autodoc", "Args:
	editor(Handle_IFSelect_Editor)
	nums(TColStd_SequenceOfInteger)
	readonly(Standard_Boolean)
	undoable(Standard_Boolean)
	label(char *)=

Returns:
	None

Creates an extracted EditForm from an Editor, limited to  
          the values identified in <nums>  
          A specific Label can be given") IFSelect_EditForm;
		 IFSelect_EditForm (const Handle_IFSelect_Editor & editor,const TColStd_SequenceOfInteger & nums,const Standard_Boolean readonly,const Standard_Boolean undoable,const char * label = "");
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns and may change the keep status on modif  
          It starts as False  
          If it is True, Apply does not clear modification status  
          and the EditForm can be loaded again, modified value remain  
          and may be applied again  
          Remark that ApplyData does not clear the modification status,  
          a call to ClearEdit does") EditKeepStatus;
		Standard_Boolean & EditKeepStatus ();
		%feature("autodoc", "Args:
	None
Returns:
	char *

No detailed docstring for this function.") Label;
		char * Label ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Tells if the EditForm is loaded now") IsLoaded;
		Standard_Boolean IsLoaded ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") ClearData;
		void ClearData ();
		%feature("autodoc", "Args:
	ent(Handle_Standard_Transient)
	model(Handle_Interface_InterfaceModel)

Returns:
	None

No detailed docstring for this function.") SetData;
		void SetData (const Handle_Standard_Transient & ent,const Handle_Interface_InterfaceModel & model);
		%feature("autodoc", "Args:
	ent(Handle_Standard_Transient)

Returns:
	None

No detailed docstring for this function.") SetEntity;
		void SetEntity (const Handle_Standard_Transient & ent);
		%feature("autodoc", "Args:
	model(Handle_Interface_InterfaceModel)

Returns:
	None

No detailed docstring for this function.") SetModel;
		void SetModel (const Handle_Interface_InterfaceModel & model);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Standard_Transient

No detailed docstring for this function.") Entity;
		Handle_Standard_Transient Entity ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Interface_InterfaceModel

No detailed docstring for this function.") Model;
		Handle_Interface_InterfaceModel Model ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_IFSelect_Editor

No detailed docstring for this function.") Editor;
		Handle_IFSelect_Editor Editor ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Tells if an EditForm is complete or is an extract from Editor") IsComplete;
		Standard_Boolean IsComplete ();
		%feature("autodoc", "Args:
	editable(Standard_Boolean)

Returns:
	Standard_Integer

Returns the count of values  
          <editable> True : count of editable values, i.e.  
            For a complete EditForm, it is given by the Editor  
            Else, it is the length of the extraction map  
          <editable> False : all the values from the Editor") NbValues;
		Standard_Integer NbValues (const Standard_Boolean editable);
		%feature("autodoc", "Args:
	rank(Standard_Integer)

Returns:
	Standard_Integer

Returns the Value Number in the Editor from a given Rank in  
          the EditForm  
          For a complete EditForm, both are equal  
          Else, it is given by the extraction map  
          Returns 0 if <rank> exceeds the count of editable values,") NumberFromRank;
		Standard_Integer NumberFromRank (const Standard_Integer rank);
		%feature("autodoc", "Args:
	number(Standard_Integer)

Returns:
	Standard_Integer

Returns the Rank in the EditForm from a given Number of Value  
          for the Editor  
          For a complete EditForm, both are equal  
          Else, it is given by the extraction map  
          Returns 0 if <number> is not forecast to be edited, or is  
            out of range") RankFromNumber;
		Standard_Integer RankFromNumber (const Standard_Integer number);
		%feature("autodoc", "Args:
	name(char *)

Returns:
	Standard_Integer

Returns the Value Number in the Editor for a given Name  
          i.e. the true ValueNumber which can be used in various methods  
          of EditForm  
          If it is not complete, for a recorded (in the Editor) but  
          non-loaded name, returns negative value (- number)") NameNumber;
		Standard_Integer NameNumber (const char * name);
		%feature("autodoc", "Args:
	name(char *)

Returns:
	Standard_Integer

Returns the Rank of Value in the EditForm for a given Name  
          i.e. if it is not complete, for a recorded (in the Editor) but  
          non-loaded name, returns 0") NameRank;
		Standard_Integer NameRank (const char * name);
		%feature("autodoc", "Args:
	None
Returns:
	None

For a read-write undoable EditForm, loads original values  
          from defaults stored in the Editor") LoadDefault;
		void LoadDefault ();
		%feature("autodoc", "Args:
	ent(Handle_Standard_Transient)
	model(Handle_Interface_InterfaceModel)

Returns:
	virtual Standard_Boolean

Loads modifications to data  
          Default uses Editor. Can be redefined  
          Remark that <ent> and/or <model> may be null, according to the  
          kind of Editor. Shortcuts are available for these cases, but  
          they finally call LoadData (hence, just ignore non-used args)") LoadData;
		virtual Standard_Boolean LoadData (const Handle_Standard_Transient & ent,const Handle_Interface_InterfaceModel & model);
		%feature("autodoc", "Args:
	ent(Handle_Standard_Transient)

Returns:
	Standard_Boolean

Shortcut for LoadData when <model> is not used") LoadEntity;
		Standard_Boolean LoadEntity (const Handle_Standard_Transient & ent);
		%feature("autodoc", "Args:
	model(Handle_Interface_InterfaceModel)

Returns:
	Standard_Boolean

Shortcut for LoadData when only the model is concerned") LoadModel;
		Standard_Boolean LoadModel (const Handle_Interface_InterfaceModel & model);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Shortcut when both <ent> and <model> are not used  
          (when the Editor works on fully static or global data)") LoadData;
		Standard_Boolean LoadData ();
		%feature("autodoc", "Args:
	num(Standard_Integer)

Returns:
	Handle_IFSelect_ListEditor

Returns a ListEditor to edit the parameter <num> of the  
          EditForm, if it is a List  
          The Editor created it (by ListEditor) then loads it (by  
            ListValue)  
          For a single parameter, returns a Null Handle ...") ListEditor;
		Handle_IFSelect_ListEditor ListEditor (const Standard_Integer num);
		%feature("autodoc", "Args:
	num(Standard_Integer)
	val(Handle_TCollection_HAsciiString)

Returns:
	None

Loads an original value (single). Called by the Editor only") LoadValue;
		void LoadValue (const Standard_Integer num,const Handle_TCollection_HAsciiString & val);
		%feature("autodoc", "Args:
	num(Standard_Integer)
	list(Handle_TColStd_HSequenceOfHAsciiString)

Returns:
	None

Loads an original value as a list. Called by the Editor only") LoadList;
		void LoadList (const Standard_Integer num,const Handle_TColStd_HSequenceOfHAsciiString & list);
		%feature("autodoc", "Args:
	num(Standard_Integer)

Returns:
	Handle_TCollection_HAsciiString

From an edited value, returns its ... value (original one)  
          Null means that this value is not defined  
          <num> is for the EditForm, not the Editor  
          It is for a single parameter. For a list, gives a Null Handle") OriginalValue;
		Handle_TCollection_HAsciiString OriginalValue (const Standard_Integer num);
		%feature("autodoc", "Args:
	num(Standard_Integer)

Returns:
	Handle_TColStd_HSequenceOfHAsciiString

Returns an original value, as a list  
          <num> is for the EditForm, not the Editor  
          For a single parameter, gives a Null Handle") OriginalList;
		Handle_TColStd_HSequenceOfHAsciiString OriginalList (const Standard_Integer num);
		%feature("autodoc", "Args:
	num(Standard_Integer)

Returns:
	Handle_TCollection_HAsciiString

Returns the Edited (i.e. Modified) Value (string for single)  
          <num> reports to the EditForm  
          If IsModified is False, returns OriginalValue  
          Null with IsModified True : means that this value is not  
            defined or has been removed  
          It is for a single parameter. For a list, gives a Null Handle") EditedValue;
		Handle_TCollection_HAsciiString EditedValue (const Standard_Integer num);
		%feature("autodoc", "Args:
	num(Standard_Integer)

Returns:
	Handle_TColStd_HSequenceOfHAsciiString

Returns the Edited Value as a list  
          If IsModified is False, returns OriginalValue  
          Null with IsModified True : means that this value is not  
            defined or has been removed  
          For a single parameter, gives a Null Handle") EditedList;
		Handle_TColStd_HSequenceOfHAsciiString EditedList (const Standard_Integer num);
		%feature("autodoc", "Args:
	num(Standard_Integer)

Returns:
	Standard_Boolean

Tells if a Value (of the EditForm) is modified (directly or  
          through touching by Update)") IsModified;
		Standard_Boolean IsModified (const Standard_Integer num);
		%feature("autodoc", "Args:
	num(Standard_Integer)

Returns:
	Standard_Boolean

Tells if a Value (of the EditForm) has been touched, i.e.  
          not modified directly but by the modification of another one  
          (by method Update from the Editor)") IsTouched;
		Standard_Boolean IsTouched (const Standard_Integer num);
		%feature("autodoc", "Args:
	num(Standard_Integer)
	newval(Handle_TCollection_HAsciiString)
	enforce(Standard_Boolean)=Standard_False

Returns:
	Standard_Boolean

Gives a new value for the item <num> of the EditForm, if  
          it is a single parameter (for a list, just returns False)  
          Null means to Remove it  
          <enforce> True to overpass Protected or Computed Access Mode  
          Calls the method Update from the Editor, which can touch other  
          parameters (see NbTouched)  
          Returns True if well recorded, False if this value is not  
          allowed  
 Warning : Does not apply immediately : will be applied by the method  
          Apply") Modify;
		Standard_Boolean Modify (const Standard_Integer num,const Handle_TCollection_HAsciiString & newval,const Standard_Boolean enforce = Standard_False);
		%feature("autodoc", "Args:
	num(Standard_Integer)
	edited(Handle_IFSelect_ListEditor)
	enforce(Standard_Boolean)=Standard_False

Returns:
	Standard_Boolean

Changes the value of an item of the EditForm, if it is a List  
          (else, just returns False)  
          The ListEditor contains the edited values of the list  
          If no edition was recorded, just returns False  
          Calls the method Update from the Editor, which can touch other  
          parameters (see NbTouched)  
          Returns True if well recorded, False if this value is not  
          allowed  
 Warning : Does not apply immediately : will be applied by the method  
          Apply") ModifyList;
		Standard_Boolean ModifyList (const Standard_Integer num,const Handle_IFSelect_ListEditor & edited,const Standard_Boolean enforce = Standard_False);
		%feature("autodoc", "Args:
	num(Standard_Integer)
	list(Handle_TColStd_HSequenceOfHAsciiString)
	enforce(Standard_Boolean)=Standard_False

Returns:
	Standard_Boolean

As ModifyList but the new value is given as such  
          Creates a ListEditor, Loads it, then calls ModifyList") ModifyListValue;
		Standard_Boolean ModifyListValue (const Standard_Integer num,const Handle_TColStd_HSequenceOfHAsciiString & list,const Standard_Boolean enforce = Standard_False);
		%feature("autodoc", "Args:
	num(Standard_Integer)
	newlist(Handle_TColStd_HSequenceOfHAsciiString)

Returns:
	Standard_Boolean

Acts as Touch but for a list  
          Does not work (returns False) if <num> is for a single param") TouchList;
		Standard_Boolean TouchList (const Standard_Integer num,const Handle_TColStd_HSequenceOfHAsciiString & newlist);
		%feature("autodoc", "Args:
	num(Standard_Integer)=0

Returns:
	None

Clears modification status : by default all, or one by its  
          numbers (in the Editor)") ClearEdit;
		void ClearEdit (const Standard_Integer num = 0);
		%feature("autodoc", "Args:
	S(Handle_Message_Messenger)

Returns:
	None

Prints Definitions, relative to the Editor") PrintDefs;
		void PrintDefs (const Handle_Message_Messenger & S);
		%feature("autodoc", "Args:
	S(Handle_Message_Messenger)
	what(Standard_Integer)
	names(Standard_Boolean)
	alsolist(Standard_Boolean)=Standard_False

Returns:
	None

Prints Values, according to what and alsolist  
          <names> True : prints Long Names; False : prints Short Names  
          <what> < 0 : prints Original Values (+ flag Modified)  
          <what> > 0 : prints Final Values (+flag Modified)  
          <what> = 0 : prints Modified Values (Original + Edited)  
          <alsolist> False (D) : lists are printed only as their count  
          <alsolist> True : lists are printed for all their items") PrintValues;
		void PrintValues (const Handle_Message_Messenger & S,const Standard_Integer what,const Standard_Boolean names,const Standard_Boolean alsolist = Standard_False);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Applies modifications to own data  
          Calls ApplyData then Clears Status according EditKeepStatus") Apply;
		Standard_Boolean Apply ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

Tells if this EditForm can work with its Editor and its actual  
          Data (Entity and Model)  
          Default uses Editor. Can be redefined") Recognize;
		virtual Standard_Boolean Recognize ();
		%feature("autodoc", "Args:
	ent(Handle_Standard_Transient)
	model(Handle_Interface_InterfaceModel)

Returns:
	virtual Standard_Boolean

Applies modifications to data  
          Default uses Editor. Can be redefined") ApplyData;
		virtual Standard_Boolean ApplyData (const Handle_Standard_Transient & ent,const Handle_Interface_InterfaceModel & model);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

For an undoable EditForm, Applies ... origibal values !  
          and clears modified ones  
          Can be run only once") Undo;
		Standard_Boolean Undo ();
};


%feature("shadow") IFSelect_EditForm::~IFSelect_EditForm %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IFSelect_EditForm {
	void _kill_pointed() {
		delete $self;
	}
};
%extend IFSelect_EditForm {
	Handle_IFSelect_EditForm GetHandle() {
	return *(Handle_IFSelect_EditForm*) &$self;
	}
};

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
    IFSelect_EditForm* GetObject() {
    return (IFSelect_EditForm*)$self->Access();
    }
};
%feature("shadow") Handle_IFSelect_EditForm::~Handle_IFSelect_EditForm %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_IFSelect_EditForm {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor IFSelect_Editor;
class IFSelect_Editor : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	num(Standard_Integer)
	typval(Handle_Interface_TypedValue)
	shortname(char *)=
	accessmode(IFSelect_EditValue)=IFSelect_Editable

Returns:
	None

Sets a Typed Value for a given ident and short name, with an  
          Edit Mode") SetValue;
		void SetValue (const Standard_Integer num,const Handle_Interface_TypedValue & typval,const char * shortname = "",const IFSelect_EditValue accessmode = IFSelect_Editable);
		%feature("autodoc", "Args:
	num(Standard_Integer)
	max(Standard_Integer)=0

Returns:
	None

Sets a parameter to be a List  
          max < 0 : not for a list (set when starting)  
          max = 0 : list with no length limit (default for SetList)  
          max > 0 : list limited to <max> items") SetList;
		void SetList (const Standard_Integer num,const Standard_Integer max = 0);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the count of Typed Values") NbValues;
		Standard_Integer NbValues ();
		%feature("autodoc", "Args:
	num(Standard_Integer)

Returns:
	Handle_Interface_TypedValue

Returns a Typed Value from its ident") TypedValue;
		Handle_Interface_TypedValue TypedValue (const Standard_Integer num);
		%feature("autodoc", "Args:
	num(Standard_Integer)

Returns:
	Standard_Boolean

Tells if a parameter is a list") IsList;
		Standard_Boolean IsList (const Standard_Integer num);
		%feature("autodoc", "Args:
	num(Standard_Integer)

Returns:
	Standard_Integer

Returns max length allowed for a list  
          = 0 means : list with no limit  
          < 0 means : not a list") MaxList;
		Standard_Integer MaxList (const Standard_Integer num);
		%feature("autodoc", "Args:
	num(Standard_Integer)
	isshort(Standard_Boolean)=Standard_False

Returns:
	char *

Returns the name of a Value (complete or short) from its ident  
          Short Name can be empty") Name;
		char * Name (const Standard_Integer num,const Standard_Boolean isshort = Standard_False);
		%feature("autodoc", "Args:
	num(Standard_Integer)

Returns:
	IFSelect_EditValue

Returns the edit mode of a Value") EditMode;
		IFSelect_EditValue EditMode (const Standard_Integer num);
		%feature("autodoc", "Args:
	name(char *)

Returns:
	Standard_Integer

Returns the number (ident) of a Value, from its name, short or  
          complete. If not found, returns 0") NameNumber;
		Standard_Integer NameNumber (const char * name);
		%feature("autodoc", "Args:
	S(Handle_Message_Messenger)

Returns:
	None

No detailed docstring for this function.") PrintNames;
		void PrintNames (const Handle_Message_Messenger & S);
		%feature("autodoc", "Args:
	S(Handle_Message_Messenger)
	labels(Standard_Boolean)=Standard_False

Returns:
	None

No detailed docstring for this function.") PrintDefs;
		void PrintDefs (const Handle_Message_Messenger & S,const Standard_Boolean labels = Standard_False);
		%feature("autodoc", "Args:
	what(Standard_Integer)

Returns:
	Standard_Integer

Returns the MaxLength of, according to what :  
          <what> = -1 : length of short names  
          <what> =  0 : length of complete names  
          <what> =  1 : length of values labels") MaxNameLength;
		Standard_Integer MaxNameLength (const Standard_Integer what);
		%feature("autodoc", "Args:
	None
Returns:
	virtual TCollection_AsciiString

Returns the specific label") Label;
		virtual TCollection_AsciiString Label ();
		%feature("autodoc", "Args:
	readonly(Standard_Boolean)
	undoable(Standard_Boolean)=Standard_True

Returns:
	virtual Handle_IFSelect_EditForm

Builds and Returns an EditForm, empty (no data yet)  
          Can be redefined to return a specific type of EditForm") Form;
		virtual Handle_IFSelect_EditForm Form (const Standard_Boolean readonly,const Standard_Boolean undoable = Standard_True);
		%feature("autodoc", "Args:
	form(Handle_IFSelect_EditForm)

Returns:
	virtual Standard_Boolean

Tells if this Editor can work on this EditForm and its content  
          (model, entity ?)") Recognize;
		virtual Standard_Boolean Recognize (const Handle_IFSelect_EditForm & form);
		%feature("autodoc", "Args:
	form(Handle_IFSelect_EditForm)
	num(Standard_Integer)

Returns:
	virtual Handle_TCollection_HAsciiString

Returns the value of an EditForm, for a given item  
          (if not a list. for a list, a Null String may be returned)") StringValue;
		virtual Handle_TCollection_HAsciiString StringValue (const Handle_IFSelect_EditForm & form,const Standard_Integer num);
		%feature("autodoc", "Args:
	num(Standard_Integer)

Returns:
	virtual Handle_IFSelect_ListEditor

Returns a ListEditor for a parameter which is a List  
          Default returns a basic ListEditor for a List, a Null Handle  
          if <num> is not for a List. Can be redefined") ListEditor;
		virtual Handle_IFSelect_ListEditor ListEditor (const Standard_Integer num);
		%feature("autodoc", "Args:
	form(Handle_IFSelect_EditForm)
	num(Standard_Integer)

Returns:
	virtual Handle_TColStd_HSequenceOfHAsciiString

Returns the value of an EditForm as a List, for a given item  
          If not a list, a Null Handle should be returned  
          Default returns a Null Handle, because many Editors have  
          no list to edit. To be redefined as required") ListValue;
		virtual Handle_TColStd_HSequenceOfHAsciiString ListValue (const Handle_IFSelect_EditForm & form,const Standard_Integer num);
		%feature("autodoc", "Args:
	form(Handle_IFSelect_EditForm)
	ent(Handle_Standard_Transient)
	model(Handle_Interface_InterfaceModel)

Returns:
	virtual Standard_Boolean

Loads original values from some data, to an EditForm  
          Remark: <ent> may be Null, this means all <model> is concerned  
          Also <model> may be Null, if no context applies for <ent>  
          And both <ent> and <model> may be Null, for a full static  
          editor") Load;
		virtual Standard_Boolean Load (const Handle_IFSelect_EditForm & form,const Handle_Standard_Transient & ent,const Handle_Interface_InterfaceModel & model);
		%feature("autodoc", "Args:
	form(Handle_IFSelect_EditForm)
	num(Standard_Integer)
	newval(Handle_TCollection_HAsciiString)
	enforce(Standard_Boolean)

Returns:
	virtual Standard_Boolean

Updates the EditForm when a parameter is modified  
          I.E.  default does nothing, can be redefined, as follows :  
          Returns True when done (even if does nothing), False in case  
          of refuse (for instance, if the new value is not suitable)  
          <num> is the rank of the parameter for the EDITOR itself  
          <enforce> True means that protected parameters can be touched  
 
          If a parameter commands the value of other ones, when it is  
          modified, it is necessary to touch them by Touch from EditForm") Update;
		virtual Standard_Boolean Update (const Handle_IFSelect_EditForm & form,const Standard_Integer num,const Handle_TCollection_HAsciiString & newval,const Standard_Boolean enforce);
		%feature("autodoc", "Args:
	form(Handle_IFSelect_EditForm)
	num(Standard_Integer)
	newlist(Handle_TColStd_HSequenceOfHAsciiString)
	enforce(Standard_Boolean)

Returns:
	virtual Standard_Boolean

Acts as Update, but when the value is a list") UpdateList;
		virtual Standard_Boolean UpdateList (const Handle_IFSelect_EditForm & form,const Standard_Integer num,const Handle_TColStd_HSequenceOfHAsciiString & newlist,const Standard_Boolean enforce);
		%feature("autodoc", "Args:
	form(Handle_IFSelect_EditForm)
	ent(Handle_Standard_Transient)
	model(Handle_Interface_InterfaceModel)

Returns:
	virtual Standard_Boolean

Applies modified values of the EditForm with some data  
          Remark: <ent> may be Null, this means all <model> is concerned  
          Also <model> may be Null, if no context applies for <ent>  
          And both <ent> and <model> may be Null, for a full static  
          editor") Apply;
		virtual Standard_Boolean Apply (const Handle_IFSelect_EditForm & form,const Handle_Standard_Transient & ent,const Handle_Interface_InterfaceModel & model);
};


%feature("shadow") IFSelect_Editor::~IFSelect_Editor %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IFSelect_Editor {
	void _kill_pointed() {
		delete $self;
	}
};
%extend IFSelect_Editor {
	Handle_IFSelect_Editor GetHandle() {
	return *(Handle_IFSelect_Editor*) &$self;
	}
};

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
    IFSelect_Editor* GetObject() {
    return (IFSelect_Editor*)$self->Access();
    }
};
%feature("shadow") Handle_IFSelect_Editor::~Handle_IFSelect_Editor %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_IFSelect_Editor {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor IFSelect_Functions;
class IFSelect_Functions {
	public:
		%feature("autodoc", "Args:
	WS(Handle_IFSelect_WorkSession)
	name(char *)=

Returns:
	static Handle_Standard_Transient

Takes the name of an entity, either as argument, or (if <name>  
          is empty) on keybord, and returns the entity  
          name can be a label or a number (in alphanumeric), it is  
          searched by NumberFromLabel from WorkSession.  
          If <name> doesn't match en entity, a Null Handle is returned") GiveEntity;
		static Handle_Standard_Transient GiveEntity (const Handle_IFSelect_WorkSession & WS,const char * name = "");
		%feature("autodoc", "Args:
	WS(Handle_IFSelect_WorkSession)
	name(char *)=

Returns:
	static Standard_Integer

Same as GetEntity, but returns the number in the model of the  
          entity. Returns 0 for null handle") GiveEntityNumber;
		static Standard_Integer GiveEntityNumber (const Handle_IFSelect_WorkSession & WS,const char * name = "");
		%feature("autodoc", "Args:
	WS(Handle_IFSelect_WorkSession)
	first(char *)=
	second(char *)=

Returns:
	static Handle_TColStd_HSequenceOfTransient

Computes a List of entities from a WorkSession and two idents,  
          first and second, as follows :  
          if <first> is a Number or Label of an entity : this entity  
          if <first> is the name of a Selection in <WS>, and <second>  
            not defined, the standard result of this Selection  
          if <first> is for a Selection and <second> is defined, the  
            standard result of this selection from the list computed  
            with <second> (an entity or a selection)  
          If <second> is erroneous, it is ignored") GiveList;
		static Handle_TColStd_HSequenceOfTransient GiveList (const Handle_IFSelect_WorkSession & WS,const char * first = "",const char * second = "");
		%feature("autodoc", "Args:
	WS(Handle_IFSelect_WorkSession)
	name(char *)
	mode(Standard_Boolean)=Standard_True

Returns:
	static Handle_IFSelect_Dispatch

Evaluates and returns a Dispatch, from data of a WorkSession  
          if <mode> is False, searches for exact name of Dispatch in WS  
          Else (D), allows a parameter between brackets :  
          ex.: dispatch_name(parameter)  
          The parameter can be: an integer for DispPerCount or DispPerFiles  
          or the name of a Signature for DispPerSignature  
          Returns Null Handle if not found not well evaluated") GiveDispatch;
		static Handle_IFSelect_Dispatch GiveDispatch (const Handle_IFSelect_WorkSession & WS,const char * name,const Standard_Boolean mode = Standard_True);
		%feature("autodoc", "Args:
	None
Returns:
	static void

Defines and loads all basic functions (as ActFunc)") Init;
		static void Init ();
};


%feature("shadow") IFSelect_Functions::~IFSelect_Functions %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IFSelect_Functions {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IFSelect_GeneralModifier;
class IFSelect_GeneralModifier : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True if this modifier may change the graph of  
          dependences (aknowledged at creation time)") MayChangeGraph;
		Standard_Boolean MayChangeGraph ();
		%feature("autodoc", "Args:
	disp(Handle_IFSelect_Dispatch)

Returns:
	None

Attaches to a Dispatch. If <disp> is Null, Resets it  
          (to apply the Modifier on every Dispatch)") SetDispatch;
		void SetDispatch (const Handle_IFSelect_Dispatch & disp);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_IFSelect_Dispatch

Returns the Dispatch to be matched, Null if not set") Dispatch;
		Handle_IFSelect_Dispatch Dispatch ();
		%feature("autodoc", "Args:
	disp(Handle_IFSelect_Dispatch)

Returns:
	Standard_Boolean

Returns True if a Model obtained from the Dispatch <disp>  
          is to be treated (apart from the Selection criterium)  
          If Dispatch(me) is Null, returns True. Else, checks <disp>") Applies;
		Standard_Boolean Applies (const Handle_IFSelect_Dispatch & disp);
		%feature("autodoc", "Args:
	sel(Handle_IFSelect_Selection)

Returns:
	None

Sets a Selection : a Model is treated if it contains one or  
          more Entities designated by the Selection") SetSelection;
		void SetSelection (const Handle_IFSelect_Selection & sel);
		%feature("autodoc", "Args:
	None
Returns:
	None

Resets the Selection : this criterium is not longer active") ResetSelection;
		void ResetSelection ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True if a Selection is set as an additionnal criterium") HasSelection;
		Standard_Boolean HasSelection ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_IFSelect_Selection

Returns the Selection, or a Null Handle if not set") Selection;
		Handle_IFSelect_Selection Selection ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual TCollection_AsciiString

Returns a short text which defines the operation performed") Label;
		virtual TCollection_AsciiString Label ();
};


%feature("shadow") IFSelect_GeneralModifier::~IFSelect_GeneralModifier %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IFSelect_GeneralModifier {
	void _kill_pointed() {
		delete $self;
	}
};
%extend IFSelect_GeneralModifier {
	Handle_IFSelect_GeneralModifier GetHandle() {
	return *(Handle_IFSelect_GeneralModifier*) &$self;
	}
};

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
    IFSelect_GeneralModifier* GetObject() {
    return (IFSelect_GeneralModifier*)$self->Access();
    }
};
%feature("shadow") Handle_IFSelect_GeneralModifier::~Handle_IFSelect_GeneralModifier %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_IFSelect_GeneralModifier {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor IFSelect_HSeqOfSelection;
class IFSelect_HSeqOfSelection : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") IFSelect_HSeqOfSelection;
		 IFSelect_HSeqOfSelection ();
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
	anItem(Handle_IFSelect_Selection)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_IFSelect_Selection & anItem);
		%feature("autodoc", "Args:
	aSequence(Handle_IFSelect_HSeqOfSelection)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_IFSelect_HSeqOfSelection & aSequence);
		%feature("autodoc", "Args:
	anItem(Handle_IFSelect_Selection)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_IFSelect_Selection & anItem);
		%feature("autodoc", "Args:
	aSequence(Handle_IFSelect_HSeqOfSelection)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_IFSelect_HSeqOfSelection & aSequence);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Reverse;
		void Reverse ();
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	anItem(Handle_IFSelect_Selection)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_IFSelect_Selection & anItem);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	aSequence(Handle_IFSelect_HSeqOfSelection)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer anIndex,const Handle_IFSelect_HSeqOfSelection & aSequence);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	anItem(Handle_IFSelect_Selection)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_IFSelect_Selection & anItem);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	aSequence(Handle_IFSelect_HSeqOfSelection)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer anIndex,const Handle_IFSelect_HSeqOfSelection & aSequence);
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
	Handle_IFSelect_HSeqOfSelection

No detailed docstring for this function.") Split;
		Handle_IFSelect_HSeqOfSelection Split (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)
	anItem(Handle_IFSelect_Selection)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer anIndex,const Handle_IFSelect_Selection & anItem);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	Handle_IFSelect_Selection

No detailed docstring for this function.") Value;
		const Handle_IFSelect_Selection & Value (const Standard_Integer anIndex);
		%feature("autodoc", "Args:
	anIndex(Standard_Integer)

Returns:
	Handle_IFSelect_Selection

No detailed docstring for this function.") ChangeValue;
		Handle_IFSelect_Selection & ChangeValue (const Standard_Integer anIndex);
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
	IFSelect_TSeqOfSelection

No detailed docstring for this function.") Sequence;
		const IFSelect_TSeqOfSelection & Sequence ();
		%feature("autodoc", "Args:
	None
Returns:
	IFSelect_TSeqOfSelection

No detailed docstring for this function.") ChangeSequence;
		IFSelect_TSeqOfSelection & ChangeSequence ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_IFSelect_HSeqOfSelection

No detailed docstring for this function.") ShallowCopy;
		Handle_IFSelect_HSeqOfSelection ShallowCopy ();
};


%feature("shadow") IFSelect_HSeqOfSelection::~IFSelect_HSeqOfSelection %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IFSelect_HSeqOfSelection {
	void _kill_pointed() {
		delete $self;
	}
};
%extend IFSelect_HSeqOfSelection {
	Handle_IFSelect_HSeqOfSelection GetHandle() {
	return *(Handle_IFSelect_HSeqOfSelection*) &$self;
	}
};

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
    IFSelect_HSeqOfSelection* GetObject() {
    return (IFSelect_HSeqOfSelection*)$self->Access();
    }
};
%feature("shadow") Handle_IFSelect_HSeqOfSelection::~Handle_IFSelect_HSeqOfSelection %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_IFSelect_HSeqOfSelection {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor IFSelect_IntParam;
class IFSelect_IntParam : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates an IntParam. Initial value is set to zer") IFSelect_IntParam;
		 IFSelect_IntParam ();
		%feature("autodoc", "Args:
	statname(char *)

Returns:
	None

Commands this IntParam to be bound to a Static  
          Hence, Value will return the value if this Static if it is set  
          Else, Value works on the locally stored value  
          SetValue also will set the value of the Static  
          This works only for a present static of type integer or enum  
          Else, it is ignored  
 
          If <statname> is empty, disconnects the IntParam from Static") SetStaticName;
		void SetStaticName (const char * statname);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Reads Integer Value of the IntParam. If a StaticName is  
          defined and the Static is set, looks in priority the value  
          of the static") Value;
		Standard_Integer Value ();
		%feature("autodoc", "Args:
	val(Standard_Integer)

Returns:
	None

Sets a new Integer Value for the IntParam. If a StaticName is  
          defined and the Static is set, also sets the value of the static") SetValue;
		void SetValue (const Standard_Integer val);
};


%feature("shadow") IFSelect_IntParam::~IFSelect_IntParam %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IFSelect_IntParam {
	void _kill_pointed() {
		delete $self;
	}
};
%extend IFSelect_IntParam {
	Handle_IFSelect_IntParam GetHandle() {
	return *(Handle_IFSelect_IntParam*) &$self;
	}
};

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
    IFSelect_IntParam* GetObject() {
    return (IFSelect_IntParam*)$self->Access();
    }
};
%feature("shadow") Handle_IFSelect_IntParam::~Handle_IFSelect_IntParam %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_IFSelect_IntParam {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor IFSelect_ListEditor;
class IFSelect_ListEditor : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates a ListEditor with absolutely no constraint") IFSelect_ListEditor;
		 IFSelect_ListEditor ();
		%feature("autodoc", "Args:
	def(Handle_Interface_TypedValue)
	max(Standard_Integer)=0

Returns:
	None

Creates a ListEditor, for which items of the list to edit are  
          defined by <def>, and <max> describes max length :  
          0 (D) means no limit  
          value > 0 means : no more the <max> items are allowed") IFSelect_ListEditor;
		 IFSelect_ListEditor (const Handle_Interface_TypedValue & def,const Standard_Integer max = 0);
		%feature("autodoc", "Args:
	model(Handle_Interface_InterfaceModel)

Returns:
	None

Loads a Model. It is used to check items of type Entity(Ident)") LoadModel;
		void LoadModel (const Handle_Interface_InterfaceModel & model);
		%feature("autodoc", "Args:
	vals(Handle_TColStd_HSequenceOfHAsciiString)

Returns:
	None

Loads the original values for the list  
          Remark : If its length is mor then MaxLength, editions remain  
          allowed, except Add") LoadValues;
		void LoadValues (const Handle_TColStd_HSequenceOfHAsciiString & vals);
		%feature("autodoc", "Args:
	None
Returns:
	None

Declares this ListEditor to have been touched (whatever action)") SetTouched;
		void SetTouched ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Clears all editions already recorded") ClearEdit;
		void ClearEdit ();
		%feature("autodoc", "Args:
	list(Handle_TColStd_HSequenceOfHAsciiString)

Returns:
	virtual Standard_Boolean

Loads a new list to replace the older one, in once !  
          By default (can be redefined) checks the length of the list  
          and the value of each item according to the def  
          Items are all recorded as Modified  
 
          If no def has been given at creation time, no check is done  
          Returns True when done, False if checks have failed ... a  
          specialisation may also lock it by returning always False ...") LoadEdited;
		virtual Standard_Boolean LoadEdited (const Handle_TColStd_HSequenceOfHAsciiString & list);
		%feature("autodoc", "Args:
	num(Standard_Integer)
	val(Handle_TCollection_HAsciiString)

Returns:
	virtual Standard_Boolean

Sets a new value for the item <num> (in edited list)  
          <val> may be a Null Handle, then the value will be cleared but  
          not removed  
          Returns True when done. False if <num> is out of range or if  
          <val> does not satisfy the definition") SetValue;
		virtual Standard_Boolean SetValue (const Standard_Integer num,const Handle_TCollection_HAsciiString & val);
		%feature("autodoc", "Args:
	val(Handle_TCollection_HAsciiString)
	atnum(Standard_Integer)=0

Returns:
	virtual Standard_Boolean

Adds a new item. By default appends (at the end of the list)  
          Can insert before a given rank <num>, if positive  
          Returns True when done. False if MaxLength may be overpassed  
          or if <val> does not satisfy the definition") AddValue;
		virtual Standard_Boolean AddValue (const Handle_TCollection_HAsciiString & val,const Standard_Integer atnum = 0);
		%feature("autodoc", "Args:
	num(Standard_Integer)=0
	howmany(Standard_Integer)=1

Returns:
	virtual Standard_Boolean

Removes items from the list  
          By default removes one item. Else, count given by <howmany>  
          Remove from rank <num> included. By default, from the end  
          Returns True when done, False (and does not work) if case of  
          out of range of if <howmany> is greater than current length") Remove;
		virtual Standard_Boolean Remove (const Standard_Integer num = 0,const Standard_Integer howmany = 1);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TColStd_HSequenceOfHAsciiString

Returns the value from which the edition started") OriginalValues;
		Handle_TColStd_HSequenceOfHAsciiString OriginalValues ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TColStd_HSequenceOfHAsciiString

Returns the result of the edition") EditedValues;
		Handle_TColStd_HSequenceOfHAsciiString EditedValues ();
		%feature("autodoc", "Args:
	edited(Standard_Boolean)=Standard_True

Returns:
	Standard_Integer

Returns count of values, edited (D) or original") NbValues;
		Standard_Integer NbValues (const Standard_Boolean edited = Standard_True);
		%feature("autodoc", "Args:
	num(Standard_Integer)
	edited(Standard_Boolean)=Standard_True

Returns:
	Handle_TCollection_HAsciiString

Returns a value given its rank. Edited (D) or Original  
          A Null String means the value is cleared but not removed") Value;
		Handle_TCollection_HAsciiString Value (const Standard_Integer num,const Standard_Boolean edited = Standard_True);
		%feature("autodoc", "Args:
	num(Standard_Integer)

Returns:
	Standard_Boolean

Tells if a value (in edited list) has been changed, i.e.  
          either modified-value, or added") IsChanged;
		Standard_Boolean IsChanged (const Standard_Integer num);
		%feature("autodoc", "Args:
	num(Standard_Integer)

Returns:
	Standard_Boolean

Tells if a value (in edited list) has been modified-value  
          (not added)") IsModified;
		Standard_Boolean IsModified (const Standard_Integer num);
		%feature("autodoc", "Args:
	num(Standard_Integer)

Returns:
	Standard_Boolean

Tells if a value (in edited list) has been added (new one)") IsAdded;
		Standard_Boolean IsAdded (const Standard_Integer num);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Tells if at least one edition (SetValue-AddValue-Remove) has  
          been recorded") IsTouched;
		Standard_Boolean IsTouched ();
};


%feature("shadow") IFSelect_ListEditor::~IFSelect_ListEditor %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IFSelect_ListEditor {
	void _kill_pointed() {
		delete $self;
	}
};
%extend IFSelect_ListEditor {
	Handle_IFSelect_ListEditor GetHandle() {
	return *(Handle_IFSelect_ListEditor*) &$self;
	}
};

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
    IFSelect_ListEditor* GetObject() {
    return (IFSelect_ListEditor*)$self->Access();
    }
};
%feature("shadow") Handle_IFSelect_ListEditor::~Handle_IFSelect_ListEditor %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_IFSelect_ListEditor {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor IFSelect_ModelCopier;
class IFSelect_ModelCopier : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates an empty ModelCopier") IFSelect_ModelCopier;
		 IFSelect_ModelCopier ();
		%feature("autodoc", "Args:
	sho(Handle_IFSelect_ShareOut)

Returns:
	None

Sets the ShareOut, which is used to define Modifiers to apply") SetShareOut;
		void SetShareOut (const Handle_IFSelect_ShareOut & sho);
		%feature("autodoc", "Args:
	None
Returns:
	None

Clears the list of produced Models") ClearResult;
		void ClearResult ();
		%feature("autodoc", "Args:
	filename(TCollection_AsciiString)
	content(Handle_Interface_InterfaceModel)

Returns:
	Standard_Boolean

Records a new File to be sent, as a couple  
          (Name as AsciiString, Content as InterfaceModel)  
          Returns True if Done, False if <filename> is already attached  
            to another File") AddFile;
		Standard_Boolean AddFile (const TCollection_AsciiString & filename,const Handle_Interface_InterfaceModel & content);
		%feature("autodoc", "Args:
	num(Standard_Integer)
	filename(TCollection_AsciiString)

Returns:
	Standard_Boolean

Changes the Name attached to a File which was formerly defined  
          by a call to AddFile  
          Returns True if Done, False else : if <num> out of range or if  
            the new <filename> is already attached to another File  
          Remark : Giving an empty File Name is equivalent to ClearFile") NameFile;
		Standard_Boolean NameFile (const Standard_Integer num,const TCollection_AsciiString & filename);
		%feature("autodoc", "Args:
	num(Standard_Integer)

Returns:
	Standard_Boolean

Clears the Name attached to a File which was formerly defined  
          by a call to AddFile. This Clearing can be undone by a call to  
          NameFile (with same <num>)  
          Returns True if Done, False else : if <num> is out of range") ClearFile;
		Standard_Boolean ClearFile (const Standard_Integer num);
		%feature("autodoc", "Args:
	num(Standard_Integer)
	applied(Handle_IFSelect_AppliedModifiers)

Returns:
	Standard_Boolean

Sets a list of File Modifiers to be applied on a file") SetAppliedModifiers;
		Standard_Boolean SetAppliedModifiers (const Standard_Integer num,const Handle_IFSelect_AppliedModifiers & applied);
		%feature("autodoc", "Args:
	num(Standard_Integer)

Returns:
	Standard_Boolean

Clears the list of File Modifiers to be applied on a file") ClearAppliedModifiers;
		Standard_Boolean ClearAppliedModifiers (const Standard_Integer num);
		%feature("autodoc", "Args:
	eval(IFSelect_ShareOutResult)
	WL(Handle_IFSelect_WorkLibrary)
	protocol(Handle_Interface_Protocol)

Returns:
	Interface_CheckIterator

Performs the Copy Operations, which include the Modifications  
          defined by the list of Modifiers. Memorizes the result, as a  
          list of InterfaceModels with the corresponding FileNames  
          They can then be sent, by the method Send, or queried  
          Copy calls internal method Copying.  
          Returns the produced CheckList") Copy;
		Interface_CheckIterator Copy (IFSelect_ShareOutResult & eval,const Handle_IFSelect_WorkLibrary & WL,const Handle_Interface_Protocol & protocol);
		%feature("autodoc", "Args:
	WL(Handle_IFSelect_WorkLibrary)
	protocol(Handle_Interface_Protocol)

Returns:
	Interface_CheckIterator

Sends the formerly defined results (see method Copy) to files,  
          then clears it  
          Remark : A Null File Name cause file to be not produced") SendCopied;
		Interface_CheckIterator SendCopied (const Handle_IFSelect_WorkLibrary & WL,const Handle_Interface_Protocol & protocol);
		%feature("autodoc", "Args:
	eval(IFSelect_ShareOutResult)
	WL(Handle_IFSelect_WorkLibrary)
	protocol(Handle_Interface_Protocol)

Returns:
	Interface_CheckIterator

Performs the Copy Operations (which include the Modifications)  
          and Sends the result on files, without memorizing it.  
          (the memorized result is ignored : neither queried not filled)") Send;
		Interface_CheckIterator Send (IFSelect_ShareOutResult & eval,const Handle_IFSelect_WorkLibrary & WL,const Handle_Interface_Protocol & protocol);
		%feature("autodoc", "Args:
	filename(char *)
	G(Interface_Graph)
	WL(Handle_IFSelect_WorkLibrary)
	protocol(Handle_Interface_Protocol)

Returns:
	Interface_CheckIterator

Sends a model (defined in <G>) into one file, without managing  
          remaining data, already sent files, etc. Applies the Model and  
          File Modifiers.  
          Returns True if well done, False else") SendAll;
		Interface_CheckIterator SendAll (const char * filename,const Interface_Graph & G,const Handle_IFSelect_WorkLibrary & WL,const Handle_Interface_Protocol & protocol);
		%feature("autodoc", "Args:
	filename(char *)
	G(Interface_Graph)
	WL(Handle_IFSelect_WorkLibrary)
	protocol(Handle_Interface_Protocol)
	iter(Interface_EntityIterator)

Returns:
	Interface_CheckIterator

Sends a part of a model into one file. Model is gotten from  
          <G>, the part is defined in <iter>.  
          Remaining data are managed and can be later be worked on.  
          Returns True if well done, False else") SendSelected;
		Interface_CheckIterator SendSelected (const char * filename,const Interface_Graph & G,const Handle_IFSelect_WorkLibrary & WL,const Handle_Interface_Protocol & protocol,const Interface_EntityIterator & iter);
		%feature("autodoc", "Args:
	G(Interface_Graph)
	WL(Handle_IFSelect_WorkLibrary)
	TC(Interface_CopyTool)
	newmod(Handle_Interface_InterfaceModel)

Returns:
	None

Produces a Model copied from the Remaining List as <newmod>  
          <newmod> is a Null Handle if this list is empty  
          <WL> performs the copy by using <TC>  
          <TC> is assumed to have been defined with the starting model  
          same as defined by <G>.") CopiedRemaining;
		void CopiedRemaining (const Interface_Graph & G,const Handle_IFSelect_WorkLibrary & WL,Interface_CopyTool & TC,Handle_Interface_InterfaceModel & newmod);
		%feature("autodoc", "Args:
	CG(Interface_Graph)

Returns:
	Standard_Boolean

Updates Graph status for remaining data, for each entity :  
          - Entities just Sent to file or Copied (by CopiedRemaining)  
            have their status set to 1  
          - the other keep their former status (1 for Send/Copied,  
            0 for Remaining)  
          These status are computed by Copying/Sending/CopiedRemaining  
          Then, SetRemaining updates graph status, and mustr be called  
          just after one of these method has been called  
          Returns True if done, False if remaining info if not in phase  
          which the Graph (not same counts of items)") SetRemaining;
		Standard_Boolean SetRemaining (Interface_Graph & CG);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the count of Files produced, i.e. the count of Models  
          memorized (produced by the mmethod Copy) with their file names") NbFiles;
		Standard_Integer NbFiles ();
		%feature("autodoc", "Args:
	num(Standard_Integer)

Returns:
	TCollection_AsciiString

Returns the File Name for a file given its rank  
          It is empty after a call to ClearFile on same <num>") FileName;
		TCollection_AsciiString FileName (const Standard_Integer num);
		%feature("autodoc", "Args:
	num(Standard_Integer)

Returns:
	Handle_Interface_InterfaceModel

Returns the content of a file before sending, under the form  
          of an InterfaceModel, given its rank") FileModel;
		Handle_Interface_InterfaceModel FileModel (const Standard_Integer num);
		%feature("autodoc", "Args:
	num(Standard_Integer)

Returns:
	Handle_IFSelect_AppliedModifiers

Returns the list of File Modifiers to be applied on a file  
          when it will be sent, as computed by CopiedModel :  
          If it is a null handle, no File Modifier has to be applied.") AppliedModifiers;
		Handle_IFSelect_AppliedModifiers AppliedModifiers (const Standard_Integer num);
		%feature("autodoc", "Args:
	sho(Handle_IFSelect_ShareOut)
	record(Standard_Boolean)

Returns:
	None

Begins a sequence of recording the really sent files  
          <sho> : the default file numbering is cleared  
          If <record> is False, clears the list and stops recording  
          If <record> is True, clears the list and commands recording  
          Creation time corresponds to 'stop recording'") BeginSentFiles;
		void BeginSentFiles (const Handle_IFSelect_ShareOut & sho,const Standard_Boolean record);
		%feature("autodoc", "Args:
	filename(char *)

Returns:
	None

Adds the name of a just sent file, if BeginSentFiles  
          has commanded recording; else does nothing  
          It is called by methods SendCopied Sending") AddSentFile;
		void AddSentFile (const char * filename);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TColStd_HSequenceOfHAsciiString

Returns the list of recorded names of sent files. Can be empty  
          (if no file has been sent). Returns a Null Handle if  
          BeginSentFiles has stopped recording.") SentFiles;
		Handle_TColStd_HSequenceOfHAsciiString SentFiles ();
};


%feature("shadow") IFSelect_ModelCopier::~IFSelect_ModelCopier %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IFSelect_ModelCopier {
	void _kill_pointed() {
		delete $self;
	}
};
%extend IFSelect_ModelCopier {
	Handle_IFSelect_ModelCopier GetHandle() {
	return *(Handle_IFSelect_ModelCopier*) &$self;
	}
};

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
    IFSelect_ModelCopier* GetObject() {
    return (IFSelect_ModelCopier*)$self->Access();
    }
};
%feature("shadow") Handle_IFSelect_ModelCopier::~Handle_IFSelect_ModelCopier %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_IFSelect_ModelCopier {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor IFSelect_PacketList;
class IFSelect_PacketList : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	model(Handle_Interface_InterfaceModel)

Returns:
	None

Creates a PackList, empty, ready to receive entities from a  
          given Model") IFSelect_PacketList;
		 IFSelect_PacketList (const Handle_Interface_InterfaceModel & model);
		%feature("autodoc", "Args:
	name(char *)

Returns:
	None

Sets a name to a packet list : this makes easier a general  
          routine to print it. Default is 'Packets'") SetName;
		void SetName (const char * name);
		%feature("autodoc", "Args:
	None
Returns:
	char *

Returns the recorded name for a packet list") Name;
		char * Name ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Interface_InterfaceModel

Returns the Model of reference") Model;
		Handle_Interface_InterfaceModel Model ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Declares a new Packet, ready to be filled  
          The entities to be added will be added to this Packet") AddPacket;
		void AddPacket ();
		%feature("autodoc", "Args:
	ent(Handle_Standard_Transient)

Returns:
	None

Adds an entity from the Model into the current packet for Add") Add;
		void Add (const Handle_Standard_Transient & ent);
		%feature("autodoc", "Args:
	list(Handle_TColStd_HSequenceOfTransient)

Returns:
	None

Adds an list of entities into the current packet for Add") AddList;
		void AddList (const Handle_TColStd_HSequenceOfTransient & list);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the count of non-empty packets") NbPackets;
		Standard_Integer NbPackets ();
		%feature("autodoc", "Args:
	numpack(Standard_Integer)

Returns:
	Standard_Integer

Returns the count of entities in a Packet given its rank, or 0") NbEntities;
		Standard_Integer NbEntities (const Standard_Integer numpack);
		%feature("autodoc", "Args:
	numpack(Standard_Integer)

Returns:
	Interface_EntityIterator

Returns the content of a Packet given its rank  
          Null Handle if <numpack> is out of range") Entities;
		Interface_EntityIterator Entities (const Standard_Integer numpack);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the highest number of packets which know a same entity  
          For no duplication, should be one") HighestDuplicationCount;
		Standard_Integer HighestDuplicationCount ();
		%feature("autodoc", "Args:
	count(Standard_Integer)
	andmore(Standard_Boolean)

Returns:
	Standard_Integer

Returns the count of entities duplicated :  
          <count> times, if <andmore> is False, or  
          <count> or more times, if <andmore> is True  
          See Duplicated for more details") NbDuplicated;
		Standard_Integer NbDuplicated (const Standard_Integer count,const Standard_Boolean andmore);
		%feature("autodoc", "Args:
	count(Standard_Integer)
	andmore(Standard_Boolean)

Returns:
	Interface_EntityIterator

Returns a list of entities duplicated :  
          <count> times, if <andmore> is False, or  
          <count> or more times, if <andmore> is True  
          Hence, count=2 & andmore=True gives all duplicated entities  
          count=1 gives non-duplicated entities (in only one packet)  
          count=0 gives remaining entities (in no packet at all)") Duplicated;
		Interface_EntityIterator Duplicated (const Standard_Integer count,const Standard_Boolean andmore);
};


%feature("shadow") IFSelect_PacketList::~IFSelect_PacketList %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IFSelect_PacketList {
	void _kill_pointed() {
		delete $self;
	}
};
%extend IFSelect_PacketList {
	Handle_IFSelect_PacketList GetHandle() {
	return *(Handle_IFSelect_PacketList*) &$self;
	}
};

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
    IFSelect_PacketList* GetObject() {
    return (IFSelect_PacketList*)$self->Access();
    }
};
%feature("shadow") Handle_IFSelect_PacketList::~Handle_IFSelect_PacketList %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_IFSelect_PacketList {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor IFSelect_Selection;
class IFSelect_Selection : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	G(Interface_Graph)

Returns:
	virtual Interface_EntityIterator

Returns the list of selected entities, computed from Input  
          given as a Graph. Specific to each class of Selection  
          Note that uniqueness of each entity is not required here  
          This method can raise an exception as necessary") RootResult;
		virtual Interface_EntityIterator RootResult (const Interface_Graph & G);
		%feature("autodoc", "Args:
	G(Interface_Graph)

Returns:
	Interface_EntityIterator

Returns the list of selected entities, each of them beeing  
          unique. Default definition works from RootResult. According  
          HasUniqueResult, UniqueResult returns directly RootResult,  
          or build a Unique Result from it with a Graph.") UniqueResult;
		Interface_EntityIterator UniqueResult (const Interface_Graph & G);
		%feature("autodoc", "Args:
	G(Interface_Graph)

Returns:
	virtual Interface_EntityIterator

Returns the list of entities involved by a Selection, i.e.  
          UniqueResult plus the shared entities (directly or not)") CompleteResult;
		virtual Interface_EntityIterator CompleteResult (const Interface_Graph & G);
		%feature("autodoc", "Args:
	iter(IFSelect_SelectionIterator)

Returns:
	virtual void

Puts in an Iterator the Selections from which 'me' depends  
          (there can be zero, or one, or a list).  
          Specific to each class of Selection") FillIterator;
		virtual void FillIterator (IFSelect_SelectionIterator & iter);
		%feature("autodoc", "Args:
	None
Returns:
	virtual TCollection_AsciiString

Returns a text which defines the criterium applied by a  
          Selection (can be used to be printed, displayed ...)  
          Specific to each class") Label;
		virtual TCollection_AsciiString Label ();
};


%feature("shadow") IFSelect_Selection::~IFSelect_Selection %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IFSelect_Selection {
	void _kill_pointed() {
		delete $self;
	}
};
%extend IFSelect_Selection {
	Handle_IFSelect_Selection GetHandle() {
	return *(Handle_IFSelect_Selection*) &$self;
	}
};

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
    IFSelect_Selection* GetObject() {
    return (IFSelect_Selection*)$self->Access();
    }
};
%feature("shadow") Handle_IFSelect_Selection::~Handle_IFSelect_Selection %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_IFSelect_Selection {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor IFSelect_SelectionIterator;
class IFSelect_SelectionIterator {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates an empty iterator, ready to be filled") IFSelect_SelectionIterator;
		 IFSelect_SelectionIterator ();
		%feature("autodoc", "Args:
	sel(Handle_IFSelect_Selection)

Returns:
	None

Creates an iterator from a Selection : it lists the Selections  
          from which <sel> depends (given by its method FillIterator)") IFSelect_SelectionIterator;
		 IFSelect_SelectionIterator (const Handle_IFSelect_Selection & sel);
		%feature("autodoc", "Args:
	iter(IFSelect_SelectionIterator)

Returns:
	None

Adds to an iterator the content of another one  
          (each selection is present only once in the result)") AddFromIter;
		void AddFromIter (IFSelect_SelectionIterator & iter);
		%feature("autodoc", "Args:
	sel(Handle_IFSelect_Selection)

Returns:
	None

Adds a Selection to an iterator (if not yet noted)") AddItem;
		void AddItem (const Handle_IFSelect_Selection & sel);
		%feature("autodoc", "Args:
	list(IFSelect_TSeqOfSelection)

Returns:
	None

Adds a list of Selections to an iterator (this list comes  
          from the description of a Selection or a Dispatch, etc...)") AddList;
		void AddList (const IFSelect_TSeqOfSelection & list);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True if there are more Selections to get") More;
		Standard_Boolean More ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Sets iterator to the next item") Next;
		void Next ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_IFSelect_Selection

Returns the current Selction beeing iterated  
          Error if count of Selection has been passed") Value;
		const Handle_IFSelect_Selection & Value ();
};


%feature("shadow") IFSelect_SelectionIterator::~IFSelect_SelectionIterator %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IFSelect_SelectionIterator {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IFSelect_SequenceNodeOfSequenceOfAppliedModifiers;
class IFSelect_SequenceNodeOfSequenceOfAppliedModifiers : public TCollection_SeqNode {
	public:
		%feature("autodoc", "Args:
	I(Handle_IFSelect_AppliedModifiers)
	n(TCollection_SeqNodePtr)
	p(TCollection_SeqNodePtr)

Returns:
	None

No detailed docstring for this function.") IFSelect_SequenceNodeOfSequenceOfAppliedModifiers;
		 IFSelect_SequenceNodeOfSequenceOfAppliedModifiers (const Handle_IFSelect_AppliedModifiers & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_IFSelect_AppliedModifiers

No detailed docstring for this function.") Value;
		Handle_IFSelect_AppliedModifiers & Value ();
};


%feature("shadow") IFSelect_SequenceNodeOfSequenceOfAppliedModifiers::~IFSelect_SequenceNodeOfSequenceOfAppliedModifiers %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IFSelect_SequenceNodeOfSequenceOfAppliedModifiers {
	void _kill_pointed() {
		delete $self;
	}
};
%extend IFSelect_SequenceNodeOfSequenceOfAppliedModifiers {
	Handle_IFSelect_SequenceNodeOfSequenceOfAppliedModifiers GetHandle() {
	return *(Handle_IFSelect_SequenceNodeOfSequenceOfAppliedModifiers*) &$self;
	}
};

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
    IFSelect_SequenceNodeOfSequenceOfAppliedModifiers* GetObject() {
    return (IFSelect_SequenceNodeOfSequenceOfAppliedModifiers*)$self->Access();
    }
};
%feature("shadow") Handle_IFSelect_SequenceNodeOfSequenceOfAppliedModifiers::~Handle_IFSelect_SequenceNodeOfSequenceOfAppliedModifiers %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_IFSelect_SequenceNodeOfSequenceOfAppliedModifiers {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor IFSelect_SequenceNodeOfSequenceOfGeneralModifier;
class IFSelect_SequenceNodeOfSequenceOfGeneralModifier : public TCollection_SeqNode {
	public:
		%feature("autodoc", "Args:
	I(Handle_IFSelect_GeneralModifier)
	n(TCollection_SeqNodePtr)
	p(TCollection_SeqNodePtr)

Returns:
	None

No detailed docstring for this function.") IFSelect_SequenceNodeOfSequenceOfGeneralModifier;
		 IFSelect_SequenceNodeOfSequenceOfGeneralModifier (const Handle_IFSelect_GeneralModifier & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_IFSelect_GeneralModifier

No detailed docstring for this function.") Value;
		Handle_IFSelect_GeneralModifier & Value ();
};


%feature("shadow") IFSelect_SequenceNodeOfSequenceOfGeneralModifier::~IFSelect_SequenceNodeOfSequenceOfGeneralModifier %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IFSelect_SequenceNodeOfSequenceOfGeneralModifier {
	void _kill_pointed() {
		delete $self;
	}
};
%extend IFSelect_SequenceNodeOfSequenceOfGeneralModifier {
	Handle_IFSelect_SequenceNodeOfSequenceOfGeneralModifier GetHandle() {
	return *(Handle_IFSelect_SequenceNodeOfSequenceOfGeneralModifier*) &$self;
	}
};

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
    IFSelect_SequenceNodeOfSequenceOfGeneralModifier* GetObject() {
    return (IFSelect_SequenceNodeOfSequenceOfGeneralModifier*)$self->Access();
    }
};
%feature("shadow") Handle_IFSelect_SequenceNodeOfSequenceOfGeneralModifier::~Handle_IFSelect_SequenceNodeOfSequenceOfGeneralModifier %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_IFSelect_SequenceNodeOfSequenceOfGeneralModifier {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor IFSelect_SequenceNodeOfSequenceOfInterfaceModel;
class IFSelect_SequenceNodeOfSequenceOfInterfaceModel : public TCollection_SeqNode {
	public:
		%feature("autodoc", "Args:
	I(Handle_Interface_InterfaceModel)
	n(TCollection_SeqNodePtr)
	p(TCollection_SeqNodePtr)

Returns:
	None

No detailed docstring for this function.") IFSelect_SequenceNodeOfSequenceOfInterfaceModel;
		 IFSelect_SequenceNodeOfSequenceOfInterfaceModel (const Handle_Interface_InterfaceModel & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Interface_InterfaceModel

No detailed docstring for this function.") Value;
		Handle_Interface_InterfaceModel & Value ();
};


%feature("shadow") IFSelect_SequenceNodeOfSequenceOfInterfaceModel::~IFSelect_SequenceNodeOfSequenceOfInterfaceModel %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IFSelect_SequenceNodeOfSequenceOfInterfaceModel {
	void _kill_pointed() {
		delete $self;
	}
};
%extend IFSelect_SequenceNodeOfSequenceOfInterfaceModel {
	Handle_IFSelect_SequenceNodeOfSequenceOfInterfaceModel GetHandle() {
	return *(Handle_IFSelect_SequenceNodeOfSequenceOfInterfaceModel*) &$self;
	}
};

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
    IFSelect_SequenceNodeOfSequenceOfInterfaceModel* GetObject() {
    return (IFSelect_SequenceNodeOfSequenceOfInterfaceModel*)$self->Access();
    }
};
%feature("shadow") Handle_IFSelect_SequenceNodeOfSequenceOfInterfaceModel::~Handle_IFSelect_SequenceNodeOfSequenceOfInterfaceModel %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_IFSelect_SequenceNodeOfSequenceOfInterfaceModel {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor IFSelect_SequenceNodeOfTSeqOfDispatch;
class IFSelect_SequenceNodeOfTSeqOfDispatch : public TCollection_SeqNode {
	public:
		%feature("autodoc", "Args:
	I(Handle_IFSelect_Dispatch)
	n(TCollection_SeqNodePtr)
	p(TCollection_SeqNodePtr)

Returns:
	None

No detailed docstring for this function.") IFSelect_SequenceNodeOfTSeqOfDispatch;
		 IFSelect_SequenceNodeOfTSeqOfDispatch (const Handle_IFSelect_Dispatch & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_IFSelect_Dispatch

No detailed docstring for this function.") Value;
		Handle_IFSelect_Dispatch & Value ();
};


%feature("shadow") IFSelect_SequenceNodeOfTSeqOfDispatch::~IFSelect_SequenceNodeOfTSeqOfDispatch %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IFSelect_SequenceNodeOfTSeqOfDispatch {
	void _kill_pointed() {
		delete $self;
	}
};
%extend IFSelect_SequenceNodeOfTSeqOfDispatch {
	Handle_IFSelect_SequenceNodeOfTSeqOfDispatch GetHandle() {
	return *(Handle_IFSelect_SequenceNodeOfTSeqOfDispatch*) &$self;
	}
};

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
    IFSelect_SequenceNodeOfTSeqOfDispatch* GetObject() {
    return (IFSelect_SequenceNodeOfTSeqOfDispatch*)$self->Access();
    }
};
%feature("shadow") Handle_IFSelect_SequenceNodeOfTSeqOfDispatch::~Handle_IFSelect_SequenceNodeOfTSeqOfDispatch %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_IFSelect_SequenceNodeOfTSeqOfDispatch {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor IFSelect_SequenceNodeOfTSeqOfSelection;
class IFSelect_SequenceNodeOfTSeqOfSelection : public TCollection_SeqNode {
	public:
		%feature("autodoc", "Args:
	I(Handle_IFSelect_Selection)
	n(TCollection_SeqNodePtr)
	p(TCollection_SeqNodePtr)

Returns:
	None

No detailed docstring for this function.") IFSelect_SequenceNodeOfTSeqOfSelection;
		 IFSelect_SequenceNodeOfTSeqOfSelection (const Handle_IFSelect_Selection & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_IFSelect_Selection

No detailed docstring for this function.") Value;
		Handle_IFSelect_Selection & Value ();
};


%feature("shadow") IFSelect_SequenceNodeOfTSeqOfSelection::~IFSelect_SequenceNodeOfTSeqOfSelection %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IFSelect_SequenceNodeOfTSeqOfSelection {
	void _kill_pointed() {
		delete $self;
	}
};
%extend IFSelect_SequenceNodeOfTSeqOfSelection {
	Handle_IFSelect_SequenceNodeOfTSeqOfSelection GetHandle() {
	return *(Handle_IFSelect_SequenceNodeOfTSeqOfSelection*) &$self;
	}
};

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
    IFSelect_SequenceNodeOfTSeqOfSelection* GetObject() {
    return (IFSelect_SequenceNodeOfTSeqOfSelection*)$self->Access();
    }
};
%feature("shadow") Handle_IFSelect_SequenceNodeOfTSeqOfSelection::~Handle_IFSelect_SequenceNodeOfTSeqOfSelection %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_IFSelect_SequenceNodeOfTSeqOfSelection {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor IFSelect_SequenceOfAppliedModifiers;
class IFSelect_SequenceOfAppliedModifiers : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") IFSelect_SequenceOfAppliedModifiers;
		 IFSelect_SequenceOfAppliedModifiers ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	Other(IFSelect_SequenceOfAppliedModifiers)

Returns:
	IFSelect_SequenceOfAppliedModifiers

No detailed docstring for this function.") Assign;
		const IFSelect_SequenceOfAppliedModifiers & Assign (const IFSelect_SequenceOfAppliedModifiers & Other);
		%feature("autodoc", "Args:
	Other(IFSelect_SequenceOfAppliedModifiers)

Returns:
	IFSelect_SequenceOfAppliedModifiers

No detailed docstring for this function.") operator=;
		const IFSelect_SequenceOfAppliedModifiers & operator = (const IFSelect_SequenceOfAppliedModifiers & Other);
		%feature("autodoc", "Args:
	T(Handle_IFSelect_AppliedModifiers)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_IFSelect_AppliedModifiers & T);
		%feature("autodoc", "Args:
	S(IFSelect_SequenceOfAppliedModifiers)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (IFSelect_SequenceOfAppliedModifiers & S);
		%feature("autodoc", "Args:
	T(Handle_IFSelect_AppliedModifiers)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_IFSelect_AppliedModifiers & T);
		%feature("autodoc", "Args:
	S(IFSelect_SequenceOfAppliedModifiers)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (IFSelect_SequenceOfAppliedModifiers & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Handle_IFSelect_AppliedModifiers)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_IFSelect_AppliedModifiers & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(IFSelect_SequenceOfAppliedModifiers)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,IFSelect_SequenceOfAppliedModifiers & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Handle_IFSelect_AppliedModifiers)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_IFSelect_AppliedModifiers & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(IFSelect_SequenceOfAppliedModifiers)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,IFSelect_SequenceOfAppliedModifiers & S);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_IFSelect_AppliedModifiers

No detailed docstring for this function.") First;
		const Handle_IFSelect_AppliedModifiers & First ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_IFSelect_AppliedModifiers

No detailed docstring for this function.") Last;
		const Handle_IFSelect_AppliedModifiers & Last ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Sub(IFSelect_SequenceOfAppliedModifiers)

Returns:
	None

No detailed docstring for this function.") Split;
		void Split (const Standard_Integer Index,IFSelect_SequenceOfAppliedModifiers & Sub);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_IFSelect_AppliedModifiers

No detailed docstring for this function.") Value;
		const Handle_IFSelect_AppliedModifiers & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	I(Handle_IFSelect_AppliedModifiers)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_IFSelect_AppliedModifiers & I);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_IFSelect_AppliedModifiers

No detailed docstring for this function.") ChangeValue;
		Handle_IFSelect_AppliedModifiers & ChangeValue (const Standard_Integer Index);
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


%feature("shadow") IFSelect_SequenceOfAppliedModifiers::~IFSelect_SequenceOfAppliedModifiers %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IFSelect_SequenceOfAppliedModifiers {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IFSelect_SequenceOfGeneralModifier;
class IFSelect_SequenceOfGeneralModifier : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") IFSelect_SequenceOfGeneralModifier;
		 IFSelect_SequenceOfGeneralModifier ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	Other(IFSelect_SequenceOfGeneralModifier)

Returns:
	IFSelect_SequenceOfGeneralModifier

No detailed docstring for this function.") Assign;
		const IFSelect_SequenceOfGeneralModifier & Assign (const IFSelect_SequenceOfGeneralModifier & Other);
		%feature("autodoc", "Args:
	Other(IFSelect_SequenceOfGeneralModifier)

Returns:
	IFSelect_SequenceOfGeneralModifier

No detailed docstring for this function.") operator=;
		const IFSelect_SequenceOfGeneralModifier & operator = (const IFSelect_SequenceOfGeneralModifier & Other);
		%feature("autodoc", "Args:
	T(Handle_IFSelect_GeneralModifier)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_IFSelect_GeneralModifier & T);
		%feature("autodoc", "Args:
	S(IFSelect_SequenceOfGeneralModifier)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (IFSelect_SequenceOfGeneralModifier & S);
		%feature("autodoc", "Args:
	T(Handle_IFSelect_GeneralModifier)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_IFSelect_GeneralModifier & T);
		%feature("autodoc", "Args:
	S(IFSelect_SequenceOfGeneralModifier)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (IFSelect_SequenceOfGeneralModifier & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Handle_IFSelect_GeneralModifier)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_IFSelect_GeneralModifier & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(IFSelect_SequenceOfGeneralModifier)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,IFSelect_SequenceOfGeneralModifier & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Handle_IFSelect_GeneralModifier)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_IFSelect_GeneralModifier & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(IFSelect_SequenceOfGeneralModifier)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,IFSelect_SequenceOfGeneralModifier & S);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_IFSelect_GeneralModifier

No detailed docstring for this function.") First;
		const Handle_IFSelect_GeneralModifier & First ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_IFSelect_GeneralModifier

No detailed docstring for this function.") Last;
		const Handle_IFSelect_GeneralModifier & Last ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Sub(IFSelect_SequenceOfGeneralModifier)

Returns:
	None

No detailed docstring for this function.") Split;
		void Split (const Standard_Integer Index,IFSelect_SequenceOfGeneralModifier & Sub);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_IFSelect_GeneralModifier

No detailed docstring for this function.") Value;
		const Handle_IFSelect_GeneralModifier & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	I(Handle_IFSelect_GeneralModifier)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_IFSelect_GeneralModifier & I);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_IFSelect_GeneralModifier

No detailed docstring for this function.") ChangeValue;
		Handle_IFSelect_GeneralModifier & ChangeValue (const Standard_Integer Index);
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


%feature("shadow") IFSelect_SequenceOfGeneralModifier::~IFSelect_SequenceOfGeneralModifier %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IFSelect_SequenceOfGeneralModifier {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IFSelect_SequenceOfInterfaceModel;
class IFSelect_SequenceOfInterfaceModel : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") IFSelect_SequenceOfInterfaceModel;
		 IFSelect_SequenceOfInterfaceModel ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	Other(IFSelect_SequenceOfInterfaceModel)

Returns:
	IFSelect_SequenceOfInterfaceModel

No detailed docstring for this function.") Assign;
		const IFSelect_SequenceOfInterfaceModel & Assign (const IFSelect_SequenceOfInterfaceModel & Other);
		%feature("autodoc", "Args:
	Other(IFSelect_SequenceOfInterfaceModel)

Returns:
	IFSelect_SequenceOfInterfaceModel

No detailed docstring for this function.") operator=;
		const IFSelect_SequenceOfInterfaceModel & operator = (const IFSelect_SequenceOfInterfaceModel & Other);
		%feature("autodoc", "Args:
	T(Handle_Interface_InterfaceModel)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_Interface_InterfaceModel & T);
		%feature("autodoc", "Args:
	S(IFSelect_SequenceOfInterfaceModel)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (IFSelect_SequenceOfInterfaceModel & S);
		%feature("autodoc", "Args:
	T(Handle_Interface_InterfaceModel)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_Interface_InterfaceModel & T);
		%feature("autodoc", "Args:
	S(IFSelect_SequenceOfInterfaceModel)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (IFSelect_SequenceOfInterfaceModel & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Handle_Interface_InterfaceModel)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_Interface_InterfaceModel & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(IFSelect_SequenceOfInterfaceModel)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,IFSelect_SequenceOfInterfaceModel & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Handle_Interface_InterfaceModel)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_Interface_InterfaceModel & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(IFSelect_SequenceOfInterfaceModel)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,IFSelect_SequenceOfInterfaceModel & S);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Interface_InterfaceModel

No detailed docstring for this function.") First;
		const Handle_Interface_InterfaceModel & First ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Interface_InterfaceModel

No detailed docstring for this function.") Last;
		const Handle_Interface_InterfaceModel & Last ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Sub(IFSelect_SequenceOfInterfaceModel)

Returns:
	None

No detailed docstring for this function.") Split;
		void Split (const Standard_Integer Index,IFSelect_SequenceOfInterfaceModel & Sub);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Interface_InterfaceModel

No detailed docstring for this function.") Value;
		const Handle_Interface_InterfaceModel & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	I(Handle_Interface_InterfaceModel)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_Interface_InterfaceModel & I);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Interface_InterfaceModel

No detailed docstring for this function.") ChangeValue;
		Handle_Interface_InterfaceModel & ChangeValue (const Standard_Integer Index);
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


%feature("shadow") IFSelect_SequenceOfInterfaceModel::~IFSelect_SequenceOfInterfaceModel %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IFSelect_SequenceOfInterfaceModel {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IFSelect_SessionDumper;
class IFSelect_SessionDumper : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	static Handle_IFSelect_SessionDumper

Returns the First item of the Library of Dumper. The Next ones  
          are then obtained by Next on the returned items") First;
		static Handle_IFSelect_SessionDumper First ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_IFSelect_SessionDumper

Returns the Next SesionDumper in the Library. Returns a Null  
          Handle at the End.") Next;
		Handle_IFSelect_SessionDumper Next ();
		%feature("autodoc", "Args:
	file(IFSelect_SessionFile)
	item(Handle_Standard_Transient)

Returns:
	virtual Standard_Boolean

Writes the Own Parameters of a given Item, if it forecast to  
          manage its Type.  
          Returns True if it has recognized the Type of the Item (in  
          this case, it is assumed to have written the Own Parameters if  
          there are some), False else : in that case, SessionFile will  
          try another SessionDumper in the Library.  
          WriteOwn can use these methods from SessionFile : SendVoid,  
          SendItem, SendText, and if necessary, WorkSession.") WriteOwn;
		virtual Standard_Boolean WriteOwn (IFSelect_SessionFile & file,const Handle_Standard_Transient & item);
		%feature("autodoc", "Args:
	file(IFSelect_SessionFile)
	type(TCollection_AsciiString)
	item(Handle_Standard_Transient)

Returns:
	virtual Standard_Boolean

Recognizes a Type (given as <type>) then Creates an Item of  
          this Type with the Own Parameter, as required.  
          Returns True if it has recognized the Type (in this case, it  
          is assumed to have created the Item, returned as <item>),  
          False else : in that case, SessionFile will try another  
          SessionDumper in the Library.  
          ReadOwn can use these methods from SessionFile to access Own  
          Parameters : NbOwnParams, IsVoid, IsText, TextValue, ItemValue") ReadOwn;
		virtual Standard_Boolean ReadOwn (IFSelect_SessionFile & file,const TCollection_AsciiString & type,Handle_Standard_Transient & item);
};


%feature("shadow") IFSelect_SessionDumper::~IFSelect_SessionDumper %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IFSelect_SessionDumper {
	void _kill_pointed() {
		delete $self;
	}
};
%extend IFSelect_SessionDumper {
	Handle_IFSelect_SessionDumper GetHandle() {
	return *(Handle_IFSelect_SessionDumper*) &$self;
	}
};

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
    IFSelect_SessionDumper* GetObject() {
    return (IFSelect_SessionDumper*)$self->Access();
    }
};
%feature("shadow") Handle_IFSelect_SessionDumper::~Handle_IFSelect_SessionDumper %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_IFSelect_SessionDumper {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor IFSelect_SessionFile;
class IFSelect_SessionFile {
	public:
		%feature("autodoc", "Args:
	WS(Handle_IFSelect_WorkSession)

Returns:
	None

Creates a SessionFile, ready to read Files in order to load  
          them into a given WorkSession.  
          The following Read Operations must then be called.  
          It is also possible to perform a Write, which produces a  
          complete File of all the content of the WorkSession.") IFSelect_SessionFile;
		 IFSelect_SessionFile (const Handle_IFSelect_WorkSession & WS);
		%feature("autodoc", "Args:
	WS(Handle_IFSelect_WorkSession)
	filename(char *)

Returns:
	None

Creates a SessionFile which Writes the content of a WorkSession  
          to a File (directly calls Write)  
          Then, IsDone aknowledges on the result of the Operation.  
          But such a SessionFile may not Read a File to a WorkSession.") IFSelect_SessionFile;
		 IFSelect_SessionFile (const Handle_IFSelect_WorkSession & WS,const char * filename);
		%feature("autodoc", "Args:
	None
Returns:
	None

Clears the lines recorded whatever for writing or for reading") ClearLines;
		void ClearLines ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the count of recorded lines") NbLines;
		Standard_Integer NbLines ();
		%feature("autodoc", "Args:
	num(Standard_Integer)

Returns:
	TCollection_AsciiString

Returns a line given its rank in the list of recorded lines") Line;
		const TCollection_AsciiString & Line (const Standard_Integer num);
		%feature("autodoc", "Args:
	line(char *)

Returns:
	None

Adds a line to the list of recorded lines") AddLine;
		void AddLine (const char * line);
		%feature("autodoc", "Args:
	None
Returns:
	None

Removes the last line. Can be called recursively.  
          Does nothing if the list is empty") RemoveLastLine;
		void RemoveLastLine ();
		%feature("autodoc", "Args:
	name(char *)

Returns:
	Standard_Boolean

Writes the recorded lines to a file named <name> then clears  
          the list of lines.  
          Returns False (with no clearing) if the file could not be  
          created") WriteFile;
		Standard_Boolean WriteFile (const char * name);
		%feature("autodoc", "Args:
	name(char *)

Returns:
	Standard_Boolean

Reads the recorded lines from a file named <name>, after  
          having cleared the list (stops if RecognizeFile fails)  
          Returns False (with no clearing) if the file could not be read") ReadFile;
		Standard_Boolean ReadFile (const char * name);
		%feature("autodoc", "Args:
	headerline(char *)

Returns:
	Standard_Boolean

Recognizes the header line. returns True if OK, False else") RecognizeFile;
		Standard_Boolean RecognizeFile (const char * headerline);
		%feature("autodoc", "Args:
	filename(char *)

Returns:
	Standard_Integer

Performs a Write Operation from a WorkSession to a File  
          i.e. calls WriteSession then WriteEnd, and WriteFile  
          Returned Value is : 0 for OK, -1 File could not be created,  
           >0 Error during Write (see WriteSession)  
          IsDone can be called too (will return True for OK)") Write;
		Standard_Integer Write (const char * filename);
		%feature("autodoc", "Args:
	filename(char *)

Returns:
	Standard_Integer

Performs a Read Operation from a file to a WorkSession  
          i.e. calls ReadFile, then ReadSession and ReadEnd  
          Returned Value is : 0 for OK, -1 File could not be opened,  
           >0 Error during Read  (see WriteSession)  
          IsDone can be called too (will return True for OK)") Read;
		Standard_Integer Read (const char * filename);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Prepares the Write operation from a WorkSession (IFSelect) to  
          a File, i.e. fills the list of lines (the file itself remains  
          to be written; or NbLines/Line may be called)  
          Important Remark : this excludes the reading of the last line,  
          which is performed by WriteEnd  
          Returns 0 if OK, status > 0 in case of error") WriteSession;
		Standard_Integer WriteSession ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Writes the trailing line. It is separate from WriteSession,  
          in order to allow to redefine WriteSession without touching  
          WriteEnd (WriteSession defines the body of the file)  
          WriteEnd fills the list of lines. Returns a status of error,  
          0 if OK, >0 else") WriteEnd;
		Standard_Integer WriteEnd ();
		%feature("autodoc", "Args:
	line(char *)
	follow(Standard_Character)=0

Returns:
	None

Writes a line to the File. If <follow> is given, it is added  
          at the following of the line. '\n' must be added for the end.") WriteLine;
		void WriteLine (const char * line,const Standard_Character follow = 0);
		%feature("autodoc", "Args:
	item(Handle_Standard_Transient)

Returns:
	Standard_Boolean

Writes the Parameters own to each type of Item. Uses the  
          Library of SessionDumpers  
          Returns True if Done, False if <item> could not be treated  
          (hence it remains written with no Own Parameter)") WriteOwn;
		Standard_Boolean WriteOwn (const Handle_Standard_Transient & item);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Performs a Read Operation from a File to a WorkSession, i.e.  
          reads the list of line (which must have already been loaded,  
          by ReadFile or by calls to AddLine)  
          Important Remark : this excludes the reading of the last line,  
          which is performed by ReadEnd  
          Returns 0 for OK, >0 status for Read Error (not a suitable  
          File, or WorkSession given as Immutable at Creation Time)  
          IsDone can be called too (will return True for OK)") ReadSession;
		Standard_Integer ReadSession ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Reads the end of a file (its last line). Returns 0 if OK,  
          status >0 in case of error (not a suitable end line).") ReadEnd;
		Standard_Integer ReadEnd ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Reads a Line and splits it into a set of alphanumeric items,  
          which can then be queried by NbParams/ParamValue ...") ReadLine;
		Standard_Boolean ReadLine ();
		%feature("autodoc", "Args:
	line(char *)

Returns:
	None

Internal routine which processes a line into words  
          and prepares its exploration") SplitLine;
		void SplitLine (const char * line);
		%feature("autodoc", "Args:
	item(Handle_Standard_Transient)

Returns:
	Standard_Boolean

Tries to Read an Item, by calling the Library of Dumpers  
          Sets the list of parameters of the line to be read from the  
          first own one") ReadOwn;
		Standard_Boolean ReadOwn (Handle_Standard_Transient & item);
		%feature("autodoc", "Args:
	item(Handle_Standard_Transient)
	active(Standard_Boolean)=Standard_True

Returns:
	None

Adds an Item to the WorkSession, taken as Name the first  
          item of the read Line. If this Name is not a Name but a Number  
          or if this Name is already recorded in the WorkSession, it  
          adds the Item but with no Name. Then the Name is recorded  
          in order to be used by the method ItemValue  
          <active> commands to make <item> active or not in the session") AddItem;
		void AddItem (const Handle_Standard_Transient & item,const Standard_Boolean active = Standard_True);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True if the last Read or Write operation has been  
          corectly performed. ELse returns False.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_IFSelect_WorkSession

Returns the WorkSession on which a SessionFile works.  
          Remark that it is returned as Immutable.") WorkSession;
		Handle_IFSelect_WorkSession WorkSession ();
		%feature("autodoc", "Args:
	ident(Standard_Integer)
	par(Handle_Standard_Transient)

Returns:
	None

At beginning of writing an Item, writes its basics :  
          - either its name in the session if it has one  
          - or its relative number of item in the file, else  
            (preceeded by a '_')  
          - then, its Dynamic Type (in the sense of cdl : pk_class)  
          This basic description can be followed by the parameters  
          which are used in the definition of the item.") NewItem;
		void NewItem (const Standard_Integer ident,const Handle_Standard_Transient & par);
		%feature("autodoc", "Args:
	mode(Standard_Boolean)

Returns:
	None

Sets Parameters to be sent as Own if <mode> is True (their  
          Name or Number or Void Mark or Text Value is preceeded by a  
          Column sign ':') else they are sent normally  
          Hence, the Own Parameter are clearly identified in the File") SetOwn;
		void SetOwn (const Standard_Boolean mode);
		%feature("autodoc", "Args:
	None
Returns:
	None

During a Write action, commands to send a Void Parameter  
          i.e. a Parameter which is present but undefined  
          Its form will be the dollar sign : $") SendVoid;
		void SendVoid ();
		%feature("autodoc", "Args:
	par(Handle_Standard_Transient)

Returns:
	None

During a Write action, commands to send the identification of  
          a Parameter : if it is Null (undefined) it is send as Void ($)  
          if it is Named in the WorkSession, its Name is sent preceeded  
          by ':', else a relative Ident Number is sent preceeded by '#'  
          (relative to the present Write, i.e. starting at one, without  
          skip, and counted part from Named Items)") SendItem;
		void SendItem (const Handle_Standard_Transient & par);
		%feature("autodoc", "Args:
	text(char *)

Returns:
	None

During a Write action, commands to send a Text without  
          interpretation. It will be sent as well") SendText;
		void SendText (const char * text);
		%feature("autodoc", "Args:
	lastgen(Standard_Integer)

Returns:
	None

Sets the rank of Last General Parameter to a new value. It is  
          followed by the Fist Own Parameter of the item.  
          Used by SessionFile after reading general parameters.") SetLastGeneral;
		void SetLastGeneral (const Standard_Integer lastgen);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

During a Read operation, SessionFile processes sequencially  
          the Items to read. For each one, it gives access to the list  
          of its Parameters : they were defined by calls to  
          SendVoid/SendParam/SendText during Writing the File.  
          NbParams returns the count of Parameters for the line  
          currently read.") NbParams;
		Standard_Integer NbParams ();
		%feature("autodoc", "Args:
	num(Standard_Integer)

Returns:
	Standard_Boolean

Returns True if a Parameter, given its rank in the Own List  
          (see NbOwnParams), is Void. Returns also True if <num> is  
          out of range (undefined parameters)") IsVoid;
		Standard_Boolean IsVoid (const Standard_Integer num);
		%feature("autodoc", "Args:
	num(Standard_Integer)

Returns:
	Standard_Boolean

Returns True if a Parameter, in the Own List (see NbOwnParams)  
          is a Text (between '...'). Else it is an Item (Parameter,  
          Selection, Dispatch ...), which can be Void.") IsText;
		Standard_Boolean IsText (const Standard_Integer num);
		%feature("autodoc", "Args:
	num(Standard_Integer)

Returns:
	TCollection_AsciiString

Returns a Parameter (alphanumeric item of a line) as it  
          has been read") ParamValue;
		const TCollection_AsciiString & ParamValue (const Standard_Integer num);
		%feature("autodoc", "Args:
	num(Standard_Integer)

Returns:
	TCollection_AsciiString

Returns the content of a Text Parameter (without the quotes).  
          Returns an empty string if the Parameter is not a Text.") TextValue;
		TCollection_AsciiString TextValue (const Standard_Integer num);
		%feature("autodoc", "Args:
	num(Standard_Integer)

Returns:
	Handle_Standard_Transient

Returns a Parameter as an Item. Returns a Null Handle if the  
          Parameter is a Text, or if it is defined as Void") ItemValue;
		Handle_Standard_Transient ItemValue (const Standard_Integer num);
		%feature("autodoc", "Args:
	None
Returns:
	None

Specific Destructor (closes the File if not yet done)") Destroy;
		void Destroy ();
};


%feature("shadow") IFSelect_SessionFile::~IFSelect_SessionFile %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IFSelect_SessionFile {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IFSelect_ShareOut;
class IFSelect_ShareOut : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates an empty ShareOut") IFSelect_ShareOut;
		 IFSelect_ShareOut ();
		%feature("autodoc", "Args:
	onlydisp(Standard_Boolean)

Returns:
	None

Removes in one operation all the Dispatches with their Idents  
          Also clears all informations about Names, and all Results but  
          naming informations which are :  
          - kept if <onlydisp> is True.  
          - cleared if <onlydisp> is False (complete clearing)  
          If <onlydisp> is True, that's all. Else, clears also Modifiers") Clear;
		void Clear (const Standard_Boolean onlydisp);
		%feature("autodoc", "Args:
	alsoname(Standard_Boolean)

Returns:
	None

Clears all data produced (apart from Dispatches, etc...)  
          if <alsoname> is True, all is cleared. Else, informations  
          about produced Names are kept (to maintain unicity of naming  
          across clearings)") ClearResult;
		void ClearResult (const Standard_Boolean alsoname);
		%feature("autodoc", "Args:
	item(Handle_Standard_Transient)

Returns:
	Standard_Boolean

Removes an item, which can be, either a Dispatch (removed from  
          the list of Dispatches), or a GeneralModifier (removed from  
          the list of Model Modifiers or from the list of File Modifiers  
          according to its type).  
          Returns True if done, False if has not been found or if it is  
          neither a Dispatch, nor a Modifier.") RemoveItem;
		Standard_Boolean RemoveItem (const Handle_Standard_Transient & item);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the rank of last run item (ClearResult resets it to 0)") LastRun;
		Standard_Integer LastRun ();
		%feature("autodoc", "Args:
	last(Standard_Integer)

Returns:
	None

Records a new alue for the rank of last run item") SetLastRun;
		void SetLastRun (const Standard_Integer last);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the count of Dispatches") NbDispatches;
		Standard_Integer NbDispatches ();
		%feature("autodoc", "Args:
	disp(Handle_IFSelect_Dispatch)

Returns:
	Standard_Integer

Returns the Rank of a Dispatch, given its Value (Handle).  
          Returns 0 if the Dispatch is unknown in the ShareOut") DispatchRank;
		Standard_Integer DispatchRank (const Handle_IFSelect_Dispatch & disp);
		%feature("autodoc", "Args:
	num(Standard_Integer)

Returns:
	Handle_IFSelect_Dispatch

Returns a Dispatch, given its rank in the list") Dispatch;
		const Handle_IFSelect_Dispatch & Dispatch (const Standard_Integer num);
		%feature("autodoc", "Args:
	disp(Handle_IFSelect_Dispatch)

Returns:
	None

Adds a Dispatch to the list") AddDispatch;
		void AddDispatch (const Handle_IFSelect_Dispatch & disp);
		%feature("autodoc", "Args:
	rank(Standard_Integer)

Returns:
	Standard_Boolean

Removes a Dispatch, given its rank in the list  
          Returns True if done, False if rank is not between  
          (LastRun + 1) and (NbDispatches)") RemoveDispatch;
		Standard_Boolean RemoveDispatch (const Standard_Integer rank);
		%feature("autodoc", "Args:
	modifier(Handle_IFSelect_GeneralModifier)
	atnum(Standard_Integer)

Returns:
	None

Sets a Modifier to be applied on all Dispatches to be run  
          If <modifier> is a ModelModifier, adds it to the list of  
          Model Modifiers; else to the list of File Modifiers  
          By default (atnum = 0) at the end of the list, else at <atnum>  
          Each Modifier is used, after each copy of a packet of Entities  
          into a Model : its criteria are checked and if they are OK,  
          the method Perform of this Modifier is run.") AddModifier;
		void AddModifier (const Handle_IFSelect_GeneralModifier & modifier,const Standard_Integer atnum);
		%feature("autodoc", "Args:
	modifier(Handle_IFSelect_GeneralModifier)
	dispnum(Standard_Integer)
	atnum(Standard_Integer)

Returns:
	None

Sets a Modifier to be applied on the Dispatch <dispnum>  
          If <modifier> is a ModelModifier, adds it to the list of  
          Model Modifiers; else to the list of File Modifiers  
          This is the same list as for all Dispatches, but the  
          Modifier is qualified to be applied to one Dispatch only  
          Then, <atnum> refers to the entire list  
          By default (atnum = 0) at the end of the list, else at <atnum>  
          Remark : if the Modifier was already in the list and if  
            <atnum> = 0, the Modifier is not moved, but only qualified  
            for a Dispatch") AddModifier;
		void AddModifier (const Handle_IFSelect_GeneralModifier & modifier,const Standard_Integer dispnum,const Standard_Integer atnum);
		%feature("autodoc", "Args:
	modifier(Handle_IFSelect_GeneralModifier)
	formodel(Standard_Boolean)
	atnum(Standard_Integer)=0

Returns:
	None

Adds a Modifier to the list of Modifiers : Model Modifiers if  
          <formodel> is True, File Modifiers else (internal).") AddModif;
		void AddModif (const Handle_IFSelect_GeneralModifier & modifier,const Standard_Boolean formodel,const Standard_Integer atnum = 0);
		%feature("autodoc", "Args:
	formodel(Standard_Boolean)

Returns:
	Standard_Integer

Returns count of Modifiers (which apply to complete Models) :  
          Model Modifiers if <formodel> is True, File Modifiers else") NbModifiers;
		Standard_Integer NbModifiers (const Standard_Boolean formodel);
		%feature("autodoc", "Args:
	formodel(Standard_Boolean)
	num(Standard_Integer)

Returns:
	Handle_IFSelect_GeneralModifier

Returns a Modifier of the list, given its rank :  
          Model Modifiers if <formodel> is True, File Modifiers else") GeneralModifier;
		Handle_IFSelect_GeneralModifier GeneralModifier (const Standard_Boolean formodel,const Standard_Integer num);
		%feature("autodoc", "Args:
	num(Standard_Integer)

Returns:
	Handle_IFSelect_Modifier

Returns a Modifier of the list of Model Modifiers, duely casted") ModelModifier;
		Handle_IFSelect_Modifier ModelModifier (const Standard_Integer num);
		%feature("autodoc", "Args:
	modifier(Handle_IFSelect_GeneralModifier)

Returns:
	Standard_Integer

Gives the rank of a Modifier in the list, 0 if not in the list  
          Model Modifiers if <modifier> is kind of ModelModifer,  
          File Modifiers else") ModifierRank;
		Standard_Integer ModifierRank (const Handle_IFSelect_GeneralModifier & modifier);
		%feature("autodoc", "Args:
	formodel(Standard_Boolean)
	num(Standard_Integer)

Returns:
	Standard_Boolean

Removes a Modifier, given it rank in the list :  
          Model Modifiers if <formodel> is True, File Modifiers else  
          Returns True if done, False if <num> is out of range") RemoveModifier;
		Standard_Boolean RemoveModifier (const Standard_Boolean formodel,const Standard_Integer num);
		%feature("autodoc", "Args:
	formodel(Standard_Boolean)
	befor(Standard_Integer)
	after(Standard_Integer)

Returns:
	Standard_Boolean

Changes the rank of a modifier in the list :  
          Model Modifiers if <formodel> is True, File Modifiers else  
          from <before> to <after>  
          Returns True if done, False else (before or after out of range)") ChangeModifierRank;
		Standard_Boolean ChangeModifierRank (const Standard_Boolean formodel,const Standard_Integer befor,const Standard_Integer after);
		%feature("autodoc", "Args:
	num(Standard_Integer)
	name(Handle_TCollection_HAsciiString)

Returns:
	Standard_Boolean

Attaches a Root Name to a Dispatch given its rank, as an  
          HAsciiString (standard form). A Null Handle resets this name.  
          Returns True if OK, False if this Name is already attached,  
          for a Dispatch or for Default, or <num> out of range") SetRootName;
		Standard_Boolean SetRootName (const Standard_Integer num,const Handle_TCollection_HAsciiString & name);
		%feature("autodoc", "Args:
	num(Standard_Integer)

Returns:
	Standard_Boolean

Returns True if the Dispatch of rank <num> has an attached  
          Root Name. False else, or if num is out of range") HasRootName;
		Standard_Boolean HasRootName (const Standard_Integer num);
		%feature("autodoc", "Args:
	num(Standard_Integer)

Returns:
	Handle_TCollection_HAsciiString

Returns the Root bound to a Dispatch, given its rank  
          Returns a Null Handle if not defined") RootName;
		Handle_TCollection_HAsciiString RootName (const Standard_Integer num);
		%feature("autodoc", "Args:
	name(Handle_TCollection_HAsciiString)

Returns:
	Standard_Integer

Returns an integer value about a given root name :  
          - positive : it's the rank of the Dispatch which has this name  
          - null : this root name is unknown  
          - negative (-1) : this root name is the default root name") RootNumber;
		Standard_Integer RootNumber (const Handle_TCollection_HAsciiString & name);
		%feature("autodoc", "Args:
	pref(Handle_TCollection_HAsciiString)

Returns:
	None

Defines or Changes the general Prefix (which is prepended to  
          complete file name generated). If this method is not call,  
          Prefix remains empty") SetPrefix;
		void SetPrefix (const Handle_TCollection_HAsciiString & pref);
		%feature("autodoc", "Args:
	defrt(Handle_TCollection_HAsciiString)

Returns:
	Standard_Boolean

Defines or Changes the Default Root Name to a new value (which  
          is used for dispatches which have no attached root name).  
          If this method is not called, DefaultRootName remains empty  
          Returns True if OK, False if this Name is already attached,  
          for a Dispatch or for Default") SetDefaultRootName;
		Standard_Boolean SetDefaultRootName (const Handle_TCollection_HAsciiString & defrt);
		%feature("autodoc", "Args:
	ext(Handle_TCollection_HAsciiString)

Returns:
	None

Defines or Changes the general Extension (which is appended to  
          complete file name generated). If this method is not call,  
          Extension remains empty") SetExtension;
		void SetExtension (const Handle_TCollection_HAsciiString & ext);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TCollection_HAsciiString

Returns the general Prefix. Can be empty.") Prefix;
		Handle_TCollection_HAsciiString Prefix ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TCollection_HAsciiString

Returns the Default Root Name. Can be empty.") DefaultRootName;
		Handle_TCollection_HAsciiString DefaultRootName ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TCollection_HAsciiString

Returns the general Extension. Can be empty (not recommanded)") Extension;
		Handle_TCollection_HAsciiString Extension ();
		%feature("autodoc", "Args:
	dnum(Standard_Integer)
	pnum(Standard_Integer)
	nbpack(Standard_Integer)=0

Returns:
	TCollection_AsciiString

Computes the complete file name for a Packet of a Dispatch,  
          given Dispatch Number (Rank), Packet Number, and Count of  
          Packets generated by this Dispatch (0 if unknown)  
 
          File Name is made of following strings, concatenated :  
          General Prefix, Root Name for Dispatch, Packet Suffix, and  
          General Extension. If no Root Name is specified for a  
          Dispatch, DefaultRootName is considered (and pnum is not used,  
          but <thenbdefs> is incremented and used  
          Error if no Root is defined for this <idnum>") FileName;
		TCollection_AsciiString FileName (const Standard_Integer dnum,const Standard_Integer pnum,const Standard_Integer nbpack = 0);
};


%feature("shadow") IFSelect_ShareOut::~IFSelect_ShareOut %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IFSelect_ShareOut {
	void _kill_pointed() {
		delete $self;
	}
};
%extend IFSelect_ShareOut {
	Handle_IFSelect_ShareOut GetHandle() {
	return *(Handle_IFSelect_ShareOut*) &$self;
	}
};

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
    IFSelect_ShareOut* GetObject() {
    return (IFSelect_ShareOut*)$self->Access();
    }
};
%feature("shadow") Handle_IFSelect_ShareOut::~Handle_IFSelect_ShareOut %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_IFSelect_ShareOut {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor IFSelect_ShareOutResult;
class IFSelect_ShareOutResult {
	public:
		%feature("autodoc", "Args:
	sho(Handle_IFSelect_ShareOut)
	mod(Handle_Interface_InterfaceModel)

Returns:
	None

Creates a ShareOutResult from a ShareOut, to work on a Model  
          (without any more precision; uses Active Protocol)") IFSelect_ShareOutResult;
		 IFSelect_ShareOutResult (const Handle_IFSelect_ShareOut & sho,const Handle_Interface_InterfaceModel & mod);
		%feature("autodoc", "Args:
	sho(Handle_IFSelect_ShareOut)
	G(Interface_Graph)

Returns:
	None

Creates a ShareOutResult from a ShareOut, to work on a Graph  
          already computed, which defines the Input Model and can  
          specialize some Entities") IFSelect_ShareOutResult;
		 IFSelect_ShareOutResult (const Handle_IFSelect_ShareOut & sho,const Interface_Graph & G);
		%feature("autodoc", "Args:
	disp(Handle_IFSelect_Dispatch)
	mod(Handle_Interface_InterfaceModel)

Returns:
	None

Creates a ShareOutResult from a unique Dispatch, to work on  
          a Model. As if it was a ShareOut with only one Dispatch  
          (without any more precision; uses Active Protocol)  
          Allows to compute the effect of a single Dispatch") IFSelect_ShareOutResult;
		 IFSelect_ShareOutResult (const Handle_IFSelect_Dispatch & disp,const Handle_Interface_InterfaceModel & mod);
		%feature("autodoc", "Args:
	disp(Handle_IFSelect_Dispatch)
	G(Interface_Graph)

Returns:
	None

Creates a ShareOutResult from a unique Dispatch, to work on  
          a Graph. As if it was a ShareOut with only one Dispatch  
          Allows to compute the effect of a single Dispatch") IFSelect_ShareOutResult;
		 IFSelect_ShareOutResult (const Handle_IFSelect_Dispatch & disp,const Interface_Graph & G);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_IFSelect_ShareOut

Returns the ShareOut used to create the ShareOutResult  
          if creation from a Dispatch, returns a Null Handle") ShareOut;
		Handle_IFSelect_ShareOut ShareOut ();
		%feature("autodoc", "Args:
	None
Returns:
	Interface_Graph

Returns the Graph used to create theShareOutResult") Graph;
		const Interface_Graph & Graph ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Erases computed data, in order to command a new Evaluation") Reset;
		void Reset ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Evaluates the result of a ShareOut : determines Entities to be  
          forgotten by the ShareOut, Entities to be transferred several  
          times (duplicated), prepares an iteration on the packets to be  
          produced  
          Called the first time anyone question is asked, or after a  
          call to Reset. Works by calling the method Prepare.") Evaluate;
		void Evaluate ();
		%feature("autodoc", "Args:
	complete(Standard_Boolean)=Standard_True

Returns:
	Handle_IFSelect_PacketList

Returns the list of recorded Packets, under two modes :  
          - <complete> = False, the strict definition of Packets, i.e.  
            for each one, the Root Entities, to be explicitely sent  
          - <complete> = True (Default), the completely evaluated list,  
            i.e. which really gives the destination of each entity :  
            this mode allows to evaluate duplications  
          Remark that to send packets, iteration remains preferable  
          (file names are managed)") Packets;
		Handle_IFSelect_PacketList Packets (const Standard_Boolean complete = Standard_True);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the total count of produced non empty packets  
          (in out : calls Evaluate as necessary)") NbPackets;
		Standard_Integer NbPackets ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Prepares the iteration on the packets  
          This method is called by Evaluate, but can be called anytime  
          The iteration consists in taking each Dispatch of the ShareOut  
          beginning by the first one, compute its packets, then iterate  
          on these packets. Once all these packets are iterated, the  
          iteration passes to the next Dispatch, or stops.  
          For a creation from a unique Dispatch, same but with only  
          this Dispatch.  
          Each packet can be listed, or really transferred (producing  
          a derived Model, from which a file can be generated)  
 
          Prepare sets the iteration to the first Dispatch, first Packet") Prepare;
		void Prepare ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True if there is more packets in the current Dispatch,  
          else if there is more Dispatch in the ShareOut") More;
		Standard_Boolean More ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Passes to the next Packet in the current Dispatch, or if there  
          is none, to the next Dispatch in the ShareOut") Next;
		void Next ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Passes to the next Dispatch, regardless about remaining packets") NextDispatch;
		void NextDispatch ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_IFSelect_Dispatch

Returns the current Dispatch") Dispatch;
		Handle_IFSelect_Dispatch Dispatch ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the Rank of the current Dispatch in the ShareOut  
          Returns Zero if there is none (iteration finished)") DispatchRank;
		Standard_Integer DispatchRank ();
		%feature("autodoc", "Args:
	numpack(Standard_Integer)
	nbpacks(Standard_Integer)

Returns:
	None

Returns Number (rank) of current Packet in current Dispatch,  
          and total count of Packets in current Dispatch, as arguments") PacketsInDispatch;
		void PacketsInDispatch (Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	Interface_EntityIterator

Returns the list of Roots of the current Packet (never empty)  
          (i.e. the Entities to be themselves asked for transfer)  
          Error if there is none (iteration finished)") PacketRoot;
		Interface_EntityIterator PacketRoot ();
		%feature("autodoc", "Args:
	None
Returns:
	Interface_EntityIterator

Returns the complete content of the current Packet (i.e.  
          with shared entities, which will also be put in the file)") PacketContent;
		Interface_EntityIterator PacketContent ();
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

Returns the File Name which corresponds to current Packet  
          (computed by ShareOut)  
          If current Packet has no associated name (see ShareOut),  
          the returned value is Null") FileName;
		TCollection_AsciiString FileName ();
};


%feature("shadow") IFSelect_ShareOutResult::~IFSelect_ShareOutResult %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IFSelect_ShareOutResult {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IFSelect_Signature;
class IFSelect_Signature : public Interface_SignType {
	public:
		%feature("autodoc", "Args:
	hasmin(Standard_Boolean)
	valmin(Standard_Integer)
	hasmax(Standard_Boolean)
	valmax(Standard_Integer)

Returns:
	None

Sets the information data to tell 'integer cases' with  
          possible min and max values  
          To be called when creating") SetIntCase;
		void SetIntCase (const Standard_Boolean hasmin,const Standard_Integer valmin,const Standard_Boolean hasmax,const Standard_Integer valmax);
		%feature("autodoc", "Args:
	hasmin(Standard_Boolean)
	valmin(Standard_Integer)
	hasmax(Standard_Boolean)
	valmax(Standard_Integer)

Returns:
	Standard_Boolean

Tells if this Signature gives integer values  
          and returns values from SetIntCase if True") IsIntCase;
		Standard_Boolean IsIntCase (Standard_Boolean & hasmin,Standard_Integer &OutValue,Standard_Boolean & hasmax,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	acase(char *)

Returns:
	None

Adds a possible case  
          To be called when creating, IF the list of possible cases for  
          Value is known when starting  
          For instance, for CDL types, rather do not fill this,  
          but for a specific enumeration (such as a status), can be used") AddCase;
		void AddCase (const char * acase);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TColStd_HSequenceOfAsciiString

Returns the predefined list of possible cases, filled by AddCase  
          Null Handle if no predefined list (hence, to be counted)  
          Useful to filter on  really possible vase, for instance, or  
          for a help") CaseList;
		Handle_TColStd_HSequenceOfAsciiString CaseList ();
		%feature("autodoc", "Args:
	None
Returns:
	char *

Returns an identification of the Signature (a word), given at  
          initialization time  Returns the Signature for a Transient object. It is specific  
          of each sub-class of Signature. For a Null Handle, it should  
          provide ''  
          It can work with the model which contains the entity") Name;
		char * Name ();
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

The label of a Signature uses its name as follow :  
          'Signature : <name>'") Label;
		TCollection_AsciiString Label ();
		%feature("autodoc", "Args:
	ent(Handle_Standard_Transient)
	model(Handle_Interface_InterfaceModel)
	text(TCollection_AsciiString)
	exact(Standard_Boolean)

Returns:
	virtual Standard_Boolean

Tells if the value for <ent> in <model> matches a text, with  
          a criterium <exact>.  
          The default definition calls MatchValue  
          Can be redefined") Matches;
		virtual Standard_Boolean Matches (const Handle_Standard_Transient & ent,const Handle_Interface_InterfaceModel & model,const TCollection_AsciiString & text,const Standard_Boolean exact);
		%feature("autodoc", "Args:
	val(char *)
	text(TCollection_AsciiString)
	exact(Standard_Boolean)

Returns:
	static Standard_Boolean

Default procedure to tell if a value <val> matches a text  
          with a criterium <exact>. <exact> = True requires equality,  
          else only contained (no reg-exp)") MatchValue;
		static Standard_Boolean MatchValue (const char * val,const TCollection_AsciiString & text,const Standard_Boolean exact);
		%feature("autodoc", "Args:
	val(Standard_Integer)

Returns:
	static char *

This procedure converts an Integer to a CString  
          It is a convenient way when the value of a signature has the  
          form of a simple integer value  
          The value is to be used immediately (one buffer only, no copy)") IntValue;
		static char * IntValue (const Standard_Integer val);
};


%feature("shadow") IFSelect_Signature::~IFSelect_Signature %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IFSelect_Signature {
	void _kill_pointed() {
		delete $self;
	}
};
%extend IFSelect_Signature {
	Handle_IFSelect_Signature GetHandle() {
	return *(Handle_IFSelect_Signature*) &$self;
	}
};

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
    IFSelect_Signature* GetObject() {
    return (IFSelect_Signature*)$self->Access();
    }
};
%feature("shadow") Handle_IFSelect_Signature::~Handle_IFSelect_Signature %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_IFSelect_Signature {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor IFSelect_SignatureList;
class IFSelect_SignatureList : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	withlist(Standard_Boolean)=Standard_False

Returns:
	None

Creates a SignatureList. If <withlist> is True, entities will  
          be not only counted per signature, but also listed.") IFSelect_SignatureList;
		 IFSelect_SignatureList (const Standard_Boolean withlist = Standard_False);
		%feature("autodoc", "Args:
	withlist(Standard_Boolean)

Returns:
	None

Changes the record-list status. The list is not cleared but  
          its use changes") SetList;
		void SetList (const Standard_Boolean withlist);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns modifiable the SignOnly Mode  
          If False (D), the counter normally counts  
          If True, the counting work is turned off, Add only fills the  
          LastValue, which can be used as signature, when a counter  
          works from data which are not available from a Signature") ModeSignOnly;
		Standard_Boolean & ModeSignOnly ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

No detailed docstring for this function.") Clear;
		virtual void Clear ();
		%feature("autodoc", "Args:
	ent(Handle_Standard_Transient)
	sign(char *)

Returns:
	None

Adds an entity with its signature, i.e. :  
          - counts an item more for <sign>  
          - if record-list status is set, records the entity  
          Accepts a null entity (the signature is then for the global  
          model). But if the string is empty, counts a Null item.  
 
          If SignOnly Mode is set, this work is replaced by just  
          setting LastValue") Add;
		void Add (const Handle_Standard_Transient & ent,const char * sign);
		%feature("autodoc", "Args:
	None
Returns:
	char *

Returns the last value recorded by Add (only if SignMode set)  
          Cleared by Clear or Init") LastValue;
		char * LastValue ();
		%feature("autodoc", "Args:
	name(char *)
	count(Handle_Dico_DictionaryOfInteger)
	list(Handle_Dico_DictionaryOfTransient)
	nbnuls(Standard_Integer)

Returns:
	None

Aknowledges the list in once. Name identifies the Signature") Init;
		void Init (const char * name,const Handle_Dico_DictionaryOfInteger & count,const Handle_Dico_DictionaryOfTransient & list,const Standard_Integer nbnuls);
		%feature("autodoc", "Args:
	root(char *)=

Returns:
	Handle_TColStd_HSequenceOfHAsciiString

Returns the list of signatures, as a sequence of strings  
          (but without their respective counts). It is ordered.  
          By default, for all the signatures.  
          If <root> is given non empty, for the signatures which  
          begin by <root>") List;
		Handle_TColStd_HSequenceOfHAsciiString List (const char * root = "");
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True if the list of Entities is aknowledged, else  
          the method Entities will always return a Null Handle") HasEntities;
		Standard_Boolean HasEntities ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the count of null entities") NbNulls;
		Standard_Integer NbNulls ();
		%feature("autodoc", "Args:
	sign(char *)

Returns:
	Standard_Integer

Returns the number of times a signature was counted,  
          0 if it has not been recorded at all") NbTimes;
		Standard_Integer NbTimes (const char * sign);
		%feature("autodoc", "Args:
	sign(char *)

Returns:
	Handle_TColStd_HSequenceOfTransient

Returns the list of entities attached to a signature  
          It is empty if <sign> has not been recorded  
          It is a Null Handle if the list of entities is not known") Entities;
		Handle_TColStd_HSequenceOfTransient Entities (const char * sign);
		%feature("autodoc", "Args:
	name(char *)

Returns:
	None

Defines a name for a SignatureList (used to print it)") SetName;
		void SetName (const char * name);
		%feature("autodoc", "Args:
	None
Returns:
	virtual char *

Returns the recorded Name.  
          Remark : default is '...' (no SetName called)") Name;
		virtual char * Name ();
		%feature("autodoc", "Args:
	S(Handle_Message_Messenger)

Returns:
	virtual void

Prints the counts of items (not the list)") PrintCount;
		virtual void PrintCount (const Handle_Message_Messenger & S);
		%feature("autodoc", "Args:
	S(Handle_Message_Messenger)
	model(Handle_Interface_InterfaceModel)
	mod(IFSelect_PrintCount)=IFSelect_ListByItem

Returns:
	virtual void

Prints the lists of items, if they are present (else, prints  
          a message 'no list available')  
          Uses <model> to determine for each entity to be listed, its  
          number, and its specific identifier (by PrintLabel)  
          <mod> gives a mode for printing :  
          - CountByItem : just count (as PrintCount)  
          - ShortByItem : minimum i.e. count plus 5 first entity numbers  
          - ShortByItem(D) complete list of entity numbers (0: 'Global')  
          - EntitiesByItem : list of (entity number/PrintLabel from the model)  
          other modes are ignored") PrintList;
		virtual void PrintList (const Handle_Message_Messenger & S,const Handle_Interface_InterfaceModel & model,const IFSelect_PrintCount mod = IFSelect_ListByItem);
		%feature("autodoc", "Args:
	S(Handle_Message_Messenger)

Returns:
	virtual void

Prints a summary  
          Item which has the greatest count of entities  
          For items which are numeric values : their count, maximum,  
          minimum values, cumul, average") PrintSum;
		virtual void PrintSum (const Handle_Message_Messenger & S);
};


%feature("shadow") IFSelect_SignatureList::~IFSelect_SignatureList %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IFSelect_SignatureList {
	void _kill_pointed() {
		delete $self;
	}
};
%extend IFSelect_SignatureList {
	Handle_IFSelect_SignatureList GetHandle() {
	return *(Handle_IFSelect_SignatureList*) &$self;
	}
};

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
    IFSelect_SignatureList* GetObject() {
    return (IFSelect_SignatureList*)$self->Access();
    }
};
%feature("shadow") Handle_IFSelect_SignatureList::~Handle_IFSelect_SignatureList %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_IFSelect_SignatureList {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor IFSelect_TSeqOfDispatch;
class IFSelect_TSeqOfDispatch : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") IFSelect_TSeqOfDispatch;
		 IFSelect_TSeqOfDispatch ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	Other(IFSelect_TSeqOfDispatch)

Returns:
	IFSelect_TSeqOfDispatch

No detailed docstring for this function.") Assign;
		const IFSelect_TSeqOfDispatch & Assign (const IFSelect_TSeqOfDispatch & Other);
		%feature("autodoc", "Args:
	Other(IFSelect_TSeqOfDispatch)

Returns:
	IFSelect_TSeqOfDispatch

No detailed docstring for this function.") operator=;
		const IFSelect_TSeqOfDispatch & operator = (const IFSelect_TSeqOfDispatch & Other);
		%feature("autodoc", "Args:
	T(Handle_IFSelect_Dispatch)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_IFSelect_Dispatch & T);
		%feature("autodoc", "Args:
	S(IFSelect_TSeqOfDispatch)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (IFSelect_TSeqOfDispatch & S);
		%feature("autodoc", "Args:
	T(Handle_IFSelect_Dispatch)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_IFSelect_Dispatch & T);
		%feature("autodoc", "Args:
	S(IFSelect_TSeqOfDispatch)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (IFSelect_TSeqOfDispatch & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Handle_IFSelect_Dispatch)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_IFSelect_Dispatch & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(IFSelect_TSeqOfDispatch)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,IFSelect_TSeqOfDispatch & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Handle_IFSelect_Dispatch)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_IFSelect_Dispatch & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(IFSelect_TSeqOfDispatch)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,IFSelect_TSeqOfDispatch & S);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_IFSelect_Dispatch

No detailed docstring for this function.") First;
		const Handle_IFSelect_Dispatch & First ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_IFSelect_Dispatch

No detailed docstring for this function.") Last;
		const Handle_IFSelect_Dispatch & Last ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Sub(IFSelect_TSeqOfDispatch)

Returns:
	None

No detailed docstring for this function.") Split;
		void Split (const Standard_Integer Index,IFSelect_TSeqOfDispatch & Sub);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_IFSelect_Dispatch

No detailed docstring for this function.") Value;
		const Handle_IFSelect_Dispatch & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	I(Handle_IFSelect_Dispatch)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_IFSelect_Dispatch & I);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_IFSelect_Dispatch

No detailed docstring for this function.") ChangeValue;
		Handle_IFSelect_Dispatch & ChangeValue (const Standard_Integer Index);
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


%feature("shadow") IFSelect_TSeqOfDispatch::~IFSelect_TSeqOfDispatch %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IFSelect_TSeqOfDispatch {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IFSelect_TSeqOfSelection;
class IFSelect_TSeqOfSelection : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") IFSelect_TSeqOfSelection;
		 IFSelect_TSeqOfSelection ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	Other(IFSelect_TSeqOfSelection)

Returns:
	IFSelect_TSeqOfSelection

No detailed docstring for this function.") Assign;
		const IFSelect_TSeqOfSelection & Assign (const IFSelect_TSeqOfSelection & Other);
		%feature("autodoc", "Args:
	Other(IFSelect_TSeqOfSelection)

Returns:
	IFSelect_TSeqOfSelection

No detailed docstring for this function.") operator=;
		const IFSelect_TSeqOfSelection & operator = (const IFSelect_TSeqOfSelection & Other);
		%feature("autodoc", "Args:
	T(Handle_IFSelect_Selection)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_IFSelect_Selection & T);
		%feature("autodoc", "Args:
	S(IFSelect_TSeqOfSelection)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (IFSelect_TSeqOfSelection & S);
		%feature("autodoc", "Args:
	T(Handle_IFSelect_Selection)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_IFSelect_Selection & T);
		%feature("autodoc", "Args:
	S(IFSelect_TSeqOfSelection)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (IFSelect_TSeqOfSelection & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Handle_IFSelect_Selection)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_IFSelect_Selection & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(IFSelect_TSeqOfSelection)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,IFSelect_TSeqOfSelection & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Handle_IFSelect_Selection)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_IFSelect_Selection & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(IFSelect_TSeqOfSelection)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,IFSelect_TSeqOfSelection & S);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_IFSelect_Selection

No detailed docstring for this function.") First;
		const Handle_IFSelect_Selection & First ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_IFSelect_Selection

No detailed docstring for this function.") Last;
		const Handle_IFSelect_Selection & Last ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Sub(IFSelect_TSeqOfSelection)

Returns:
	None

No detailed docstring for this function.") Split;
		void Split (const Standard_Integer Index,IFSelect_TSeqOfSelection & Sub);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_IFSelect_Selection

No detailed docstring for this function.") Value;
		const Handle_IFSelect_Selection & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	I(Handle_IFSelect_Selection)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_IFSelect_Selection & I);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_IFSelect_Selection

No detailed docstring for this function.") ChangeValue;
		Handle_IFSelect_Selection & ChangeValue (const Standard_Integer Index);
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


%feature("shadow") IFSelect_TSeqOfSelection::~IFSelect_TSeqOfSelection %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IFSelect_TSeqOfSelection {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IFSelect_Transformer;
class IFSelect_Transformer : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	G(Interface_Graph)
	protocol(Handle_Interface_Protocol)
	checks(Interface_CheckIterator)
	newmod(Handle_Interface_InterfaceModel)

Returns:
	virtual Standard_Boolean

Performs a Transformation (defined by each sub-class) :  
        <G> gives the input data (especially the starting model) and  
          can be used for queries (by Selections, etc...)  
        <protocol> allows to work with General Services as necessary  
          (it applies to input data)  
          If the change corresponds to a conversion to a new protocol,  
          see also the method ChangeProtocol  
        <checks> stores produced checks messages if any  
        <newmod> gives the result of the transformation :  
        - if it is Null (i.e. has not been affected), the transformation  
          has been made on the spot, it is assumed to cause no change  
          to the graph of dependances  
        - if it equates the starting Model, it has been transformed on  
          the spot (possibiliy some entities were replaced inside it)  
        - if it is new, it corresponds to a new data set which replaces  
          the starting one  
 
        <self> is mutable to allow results for ChangeProtocol to be  
          memorized if needed, and to store informations useful for  
          the method Updated  
 
        Returns True if Done, False if an Error occured : in this case,  
          if a new data set has been produced, the transformation  
          is ignored, else data may be corrupted.") Perform;
		virtual Standard_Boolean Perform (const Interface_Graph & G,const Handle_Interface_Protocol & protocol,Interface_CheckIterator & checks,Handle_Interface_InterfaceModel & newmod);
		%feature("autodoc", "Args:
	newproto(Handle_Interface_Protocol)

Returns:
	virtual Standard_Boolean

This methods allows to declare that the Protocol applied to  
          the new Model has changed. It applies to the last call to  
          Perform.  
 
          Returns True if the Protocol has changed, False else.  
          The provided default keeps the starting Protocol. This method  
          should be redefined as required by the effect of Perform.") ChangeProtocol;
		virtual Standard_Boolean ChangeProtocol (Handle_Interface_Protocol & newproto);
		%feature("autodoc", "Args:
	entfrom(Handle_Standard_Transient)
	entto(Handle_Standard_Transient)

Returns:
	virtual Standard_Boolean

This method allows to know what happened to a starting  
          entity after the last Perform. If <entfrom> (from starting  
          model) has one and only one known item which corresponds in  
          the new produced model, this method must return True and  
          fill the argument <entto>. Else, it returns False.") Updated;
		virtual Standard_Boolean Updated (const Handle_Standard_Transient & entfrom,Handle_Standard_Transient & entto);
		%feature("autodoc", "Args:
	None
Returns:
	virtual TCollection_AsciiString

Returns a text which defines the way a Transformer works  
          (to identify the transformation it performs)") Label;
		virtual TCollection_AsciiString Label ();
};


%feature("shadow") IFSelect_Transformer::~IFSelect_Transformer %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IFSelect_Transformer {
	void _kill_pointed() {
		delete $self;
	}
};
%extend IFSelect_Transformer {
	Handle_IFSelect_Transformer GetHandle() {
	return *(Handle_IFSelect_Transformer*) &$self;
	}
};

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
    IFSelect_Transformer* GetObject() {
    return (IFSelect_Transformer*)$self->Access();
    }
};
%feature("shadow") Handle_IFSelect_Transformer::~Handle_IFSelect_Transformer %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_IFSelect_Transformer {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor IFSelect_WorkLibrary;
class IFSelect_WorkLibrary : public Standard_Transient {
	public:
		%feature("autodoc", "Args:
	name(char *)
	model(Handle_Interface_InterfaceModel)
	protocol(Handle_Interface_Protocol)

Returns:
	virtual Standard_Integer

Gives the way to Read a File and transfer it to a Model  
          <mod> is the resulting Model, which has to be created by this  
          method. In case of error, <mod> must be returned Null  
          Return value is a status with free values.  
          Simply, 0 is for 'Execution OK'  
          The Protocol can be used to work (e.g. create the Model, read  
          and recognize the Entities)") ReadFile;
		virtual Standard_Integer ReadFile (const char * name,Handle_Interface_InterfaceModel & model,const Handle_Interface_Protocol & protocol);
		%feature("autodoc", "Args:
	ctx(IFSelect_ContextWrite)

Returns:
	virtual Standard_Boolean

Gives the way to Write a File from a Model.  
          <ctx> contains all necessary informations : the model, the  
          protocol, the file name, and the list of File Modifiers to be  
          applied, also with restricted list of selected entities for  
          each one, if required.  
          In return, it brings the produced check-list  
 
          The WorkLibrary has to query <applied> to get then run the  
          ContextWrite by looping like this (example) :  
            for (numap = 1; numap <= ctx.NbModifiers(); numap ++) {  
              ctx.SetModifier (numap);  
              cast ctx.FileModifier()  to specific type -> variable filemod  
              if (!filemod.IsNull()) filemod->Perform (ctx,writer);  
                filemod then works with ctx. It can, either act on the  
                model itself (for instance on its header), or iterate  
                on selected entities (Start/Next/More/Value)  
                it can call AddFail or AddWarning, as necessary  
            }") WriteFile;
		virtual Standard_Boolean WriteFile (IFSelect_ContextWrite & ctx);
		%feature("autodoc", "Args:
	original(Handle_Interface_InterfaceModel)
	newmodel(Handle_Interface_InterfaceModel)
	list(Interface_EntityIterator)
	TC(Interface_CopyTool)

Returns:
	virtual Standard_Boolean

Performs the copy of entities from an original model to a new  
          one. It must also copy headers if any. Returns True when done.  
          The provided default works by copying the individual entities  
          designated in the list, by using the general service class  
          CopyTool.  
          It can be redefined for a norm which, either implements Copy  
          by another way (do not forget to Bind each copied result with  
          its original entity in TC) and returns True, or does not know  
          how to copy and returns False") CopyModel;
		virtual Standard_Boolean CopyModel (const Handle_Interface_InterfaceModel & original,const Handle_Interface_InterfaceModel & newmodel,const Interface_EntityIterator & list,Interface_CopyTool & TC);
		%feature("autodoc", "Args:
	model(Handle_Interface_InterfaceModel)
	protocol(Handle_Interface_Protocol)
	entity(Handle_Standard_Transient)
	S(Handle_Message_Messenger)
	level(Standard_Integer)

Returns:
	virtual void

Gives the way of dumping an entity under a form comprehensive  
          for each norm. <model> helps to identify, number ... entities.  
          <level> is to be interpreted for each norm (because of the  
          formats which can be very different)") DumpEntity;
		virtual void DumpEntity (const Handle_Interface_InterfaceModel & model,const Handle_Interface_Protocol & protocol,const Handle_Standard_Transient & entity,const Handle_Message_Messenger & S,const Standard_Integer level);
		%feature("autodoc", "Args:
	model(Handle_Interface_InterfaceModel)
	protocol(Handle_Interface_Protocol)
	entity(Handle_Standard_Transient)
	S(Handle_Message_Messenger)

Returns:
	None

Calls deferred DumpEntity with the recorded default level") DumpEntity;
		void DumpEntity (const Handle_Interface_InterfaceModel & model,const Handle_Interface_Protocol & protocol,const Handle_Standard_Transient & entity,const Handle_Message_Messenger & S);
		%feature("autodoc", "Args:
	def(Standard_Integer)
	max(Standard_Integer)

Returns:
	None

Records a default level and a maximum value for level  
          level for DumpEntity can go between 0 and <max>  
          default value will be <def>") SetDumpLevels;
		void SetDumpLevels (const Standard_Integer def,const Standard_Integer max);
		%feature("autodoc", "Args:
	def(Standard_Integer)
	max(Standard_Integer)

Returns:
	None

Returns the recorded default and maximum dump levels  
          If none was recorded, max is returned negative, def as zero") DumpLevels;
		void DumpLevels (Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	level(Standard_Integer)
	help(char *)

Returns:
	None

Records a short line of help for a level (0 - max)") SetDumpHelp;
		void SetDumpHelp (const Standard_Integer level,const char * help);
		%feature("autodoc", "Args:
	level(Standard_Integer)

Returns:
	char *

Returns the help line recorded for <level>, or an empty string") DumpHelp;
		char * DumpHelp (const Standard_Integer level);
};


%feature("shadow") IFSelect_WorkLibrary::~IFSelect_WorkLibrary %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IFSelect_WorkLibrary {
	void _kill_pointed() {
		delete $self;
	}
};
%extend IFSelect_WorkLibrary {
	Handle_IFSelect_WorkLibrary GetHandle() {
	return *(Handle_IFSelect_WorkLibrary*) &$self;
	}
};

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
    IFSelect_WorkLibrary* GetObject() {
    return (IFSelect_WorkLibrary*)$self->Access();
    }
};
%feature("shadow") Handle_IFSelect_WorkLibrary::~Handle_IFSelect_WorkLibrary %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_IFSelect_WorkLibrary {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor IFSelect_WorkSession;
class IFSelect_WorkSession : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates a Work Session  
          It provides default, empty ShareOut and ModelCopier, which can  
          be replaced (if required, should be done just after creation).") IFSelect_WorkSession;
		 IFSelect_WorkSession ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_IFSelect_ShareOut

Returns the ShareOut defined at creation time") ShareOut;
		const Handle_IFSelect_ShareOut & ShareOut ();
		%feature("autodoc", "Args:
	shareout(Handle_IFSelect_ShareOut)

Returns:
	None

Sets a new ShareOut. Fills Items which its content  
 Warning : data from the former ShareOut are lost") SetShareOut;
		void SetShareOut (const Handle_IFSelect_ShareOut & shareout);
		%feature("autodoc", "Args:
	theMode(Standard_Boolean)

Returns:
	None

Set value of mode responsible for precence of selections after loading  
If mode set to true that different selections will be accessible after loading  
else selections will be not accessible after loading( for economy memory in applicatios)") SetModeStat;
		void SetModeStat (const Standard_Boolean theMode);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Return value of mode defining of filling selection during loading") GetModeStat;
		Standard_Boolean GetModeStat ();
		%feature("autodoc", "Args:
	lib(Handle_IFSelect_WorkLibrary)

Returns:
	None

Sets a WorkLibrary, which will be used to Read and Write Files") SetLibrary;
		void SetLibrary (const Handle_IFSelect_WorkLibrary & lib);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_IFSelect_WorkLibrary

Returns the WorkLibrary. Null Handle if not yet set  
should be C++ : return const &") WorkLibrary;
		Handle_IFSelect_WorkLibrary WorkLibrary ();
		%feature("autodoc", "Args:
	protocol(Handle_Interface_Protocol)

Returns:
	None

Sets a Protocol, which will be used to determine Graphs, to  
          Read and to Write Files") SetProtocol;
		void SetProtocol (const Handle_Interface_Protocol & protocol);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Interface_Protocol

Returns the Protocol. Null Handle if not yet set  
should be C++ : return const &") Protocol;
		Handle_Interface_Protocol Protocol ();
		%feature("autodoc", "Args:
	signtype(Handle_IFSelect_Signature)

Returns:
	None

Sets a specific Signature to be the SignType, i.e. the  
          Signature which will determine TypeName from the Model  
          (basic function). It is recorded in the GTool  
          This Signature is also set as 'xst-sign-type' (reserved name)") SetSignType;
		void SetSignType (const Handle_IFSelect_Signature & signtype);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_IFSelect_Signature

Returns the current SignType") SignType;
		Handle_IFSelect_Signature SignType ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True is a Model has been set") HasModel;
		Standard_Boolean HasModel ();
		%feature("autodoc", "Args:
	model(Handle_Interface_InterfaceModel)
	clearpointed(Standard_Boolean)=Standard_True

Returns:
	None

Sets a Model as input : this will be the Model from which the  
          ShareOut will work  
          if <clearpointed> is True (default) all SelectPointed items  
             are cleared, else they must be managed by the caller  
          Remark : SetModel clears the Graph, recomputes it if a  
          Protocol is set and if the Model is not empty, of course") SetModel;
		void SetModel (const Handle_Interface_InterfaceModel & model,const Standard_Boolean clearpointed = Standard_True);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Interface_InterfaceModel

Returns the Model of the Work Session (Null Handle if none)  
should be C++ : return const &") Model;
		Handle_Interface_InterfaceModel Model ();
		%feature("autodoc", "Args:
	filename(char *)

Returns:
	None

Stores the filename used for read for setting the model  
          It is cleared by SetModel and ClearData(1)") SetLoadedFile;
		void SetLoadedFile (const char * filename);
		%feature("autodoc", "Args:
	None
Returns:
	char *

Returns the filename used to load current model  
          empty if unknown") LoadedFile;
		char * LoadedFile ();
		%feature("autodoc", "Args:
	filename(char *)

Returns:
	IFSelect_ReturnStatus

Reads a file with the WorkLibrary (sets Model and LoadedFile)  
          Returns a integer status which can be :  
          RetDone if OK,  RetVoid if no Protocol not defined,  
          RetError for file not found, RetFail if fail during read") ReadFile;
		IFSelect_ReturnStatus ReadFile (const char * filename);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the count of Entities stored in the Model, or 0") NbStartingEntities;
		Standard_Integer NbStartingEntities ();
		%feature("autodoc", "Args:
	num(Standard_Integer)

Returns:
	Handle_Standard_Transient

Returns an  Entity stored in the Model of the WorkSession  
          (Null Handle is no Model or num out of range)") StartingEntity;
		Handle_Standard_Transient StartingEntity (const Standard_Integer num);
		%feature("autodoc", "Args:
	ent(Handle_Standard_Transient)

Returns:
	Standard_Integer

Returns the Number of an Entity in the Model  
          (0 if no Model set or <ent> not in the Model)") StartingNumber;
		Standard_Integer StartingNumber (const Handle_Standard_Transient & ent);
		%feature("autodoc", "Args:
	val(char *)
	afternum(Standard_Integer)=0

Returns:
	Standard_Integer

From a given label in Model, returns the corresponding number  
          Starts from first entity by Default, may start after a given  
          number : this number may be given negative, its absolute value  
          is then considered. Hence a loop on NumberFromLabel may be  
          programmed (stop test is : returned value positive or null)  
 
          Returns 0 if not found, < 0 if more than one found (first  
          found in negative).  
          If <val> just gives an integer value, returns it") NumberFromLabel;
		Standard_Integer NumberFromLabel (const char * val,const Standard_Integer afternum = 0);
		%feature("autodoc", "Args:
	ent(Handle_Standard_Transient)

Returns:
	Handle_TCollection_HAsciiString

Returns the label for <ent>, as the Model does  
          If <ent> is not in the Model or if no Model is loaded, a Null  
          Handle is returned") EntityLabel;
		Handle_TCollection_HAsciiString EntityLabel (const Handle_Standard_Transient & ent);
		%feature("autodoc", "Args:
	ent(Handle_Standard_Transient)

Returns:
	Handle_TCollection_HAsciiString

Returns the Name of an Entity  
          This Name is computed by the general service Name  
          Returns a Null Handle if fails") EntityName;
		Handle_TCollection_HAsciiString EntityName (const Handle_Standard_Transient & ent);
		%feature("autodoc", "Args:
	ent(Handle_Standard_Transient)

Returns:
	Standard_Integer

Returns the Category Number determined for an entity  
          it is computed by the class Category  
          An unknown entity (number 0) gives a value -1") CategoryNumber;
		Standard_Integer CategoryNumber (const Handle_Standard_Transient & ent);
		%feature("autodoc", "Args:
	ent(Handle_Standard_Transient)

Returns:
	char *

Returns the Category Name determined for an entity  
          it is computed by the class Category  
          Remark : an unknown entity gives an empty string") CategoryName;
		char * CategoryName (const Handle_Standard_Transient & ent);
		%feature("autodoc", "Args:
	ent(Handle_Standard_Transient)

Returns:
	char *

Returns the Validity Name determined for an entity  
          it is computed by the class SignValidity  
          Remark : an unknown entity gives an empty string") ValidityName;
		char * ValidityName (const Handle_Standard_Transient & ent);
		%feature("autodoc", "Args:
	mode(Standard_Integer)

Returns:
	virtual void

Clears recorded data (not the items) according mode :  
          1 : all Data : Model, Graph, CheckList, + ClearData 4  
          2 : Graph and CheckList (they will then be recomputed later)  
          3 : CheckList (it will be recomputed by ComputeCheck)  
          4 : just content of SelectPointed and Counters  
          Plus 0 : does nothing but called by SetModel  
          ClearData is virtual, hence it can be redefined to clear  
            other data of a specialised Work Session") ClearData;
		virtual void ClearData (const Standard_Integer mode);
		%feature("autodoc", "Args:
	enforce(Standard_Boolean)=Standard_False

Returns:
	Standard_Boolean

Computes the Graph used for Selections, Displays ...  
          If a HGraph is already set, with same model as given by method  
          Model, does nothing. Else, computes a new Graph.  
          If <enforce> is given True, computes a new Graph anyway.  
          Remark that a call to ClearGraph will cause ComputeGraph to  
          really compute a new Graph  
          Returns True if Graph is OK, False else (i.e. if no Protocol  
          is set, or if Model is absent or empty).") ComputeGraph;
		Standard_Boolean ComputeGraph (const Standard_Boolean enforce = Standard_False);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Interface_HGraph

Returns the Computed Graph as HGraph (Null Handle if not set)") HGraph;
		Handle_Interface_HGraph HGraph ();
		%feature("autodoc", "Args:
	None
Returns:
	Interface_Graph

Returns the Computed Graph, for Read only") Graph;
		const Interface_Graph & Graph ();
		%feature("autodoc", "Args:
	ent(Handle_Standard_Transient)

Returns:
	Handle_TColStd_HSequenceOfTransient

Returns the list of entities shared by <ent> (can be empty)  
          Returns a null Handle if <ent> is unknown") Shareds;
		Handle_TColStd_HSequenceOfTransient Shareds (const Handle_Standard_Transient & ent);
		%feature("autodoc", "Args:
	ent(Handle_Standard_Transient)

Returns:
	Handle_TColStd_HSequenceOfTransient

Returns the list of entities sharing <ent> (can be empty)  
          Returns a null Handle if <ent> is unknown") Sharings;
		Handle_TColStd_HSequenceOfTransient Sharings (const Handle_Standard_Transient & ent);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True if a Model is defined and really loaded (not  
          empty), a Protocol is set and a Graph has been computed.  
          In this case, the WorkSession can start to work") IsLoaded;
		Standard_Boolean IsLoaded ();
		%feature("autodoc", "Args:
	enforce(Standard_Boolean)=Standard_False

Returns:
	Standard_Boolean

Computes the CheckList for the Model currently loaded  
          It can then be used for displays, querries ...  
          Returns True if OK, False else (i.e. no Protocol set, or Model  
          absent). If <enforce> is False, works only if not already done  
          or if a new Model has been loaded from last call.  
Remark : computation is enforced by every call to  
         SetModel or RunTransformer") ComputeCheck;
		Standard_Boolean ComputeCheck (const Standard_Boolean enforce = Standard_False);
		%feature("autodoc", "Args:
	complete(Standard_Boolean)=Standard_True

Returns:
	Interface_CheckIterator

Returns the Check List for the Model currently loaded :  
          <complete> = True  : complete (syntactic & semantic messages),  
              computed if not yet done  
          <complete> = False : only syntactic (check file form)") ModelCheckList;
		Interface_CheckIterator ModelCheckList (const Standard_Boolean complete = Standard_True);
		%feature("autodoc", "Args:
	ent(Handle_Standard_Transient)
	complete(Standard_Boolean)=Standard_True

Returns:
	Interface_CheckIterator

Returns a Check for a single entity, under the form of a  
          CheckIterator (this gives only one form for the user)  
          if <ent> is Null or equates the current Model, it gives the  
          Global Check, else the Check for the given entity  
          <complete> as for ModelCheckList") CheckOne;
		Interface_CheckIterator CheckOne (const Handle_Standard_Transient & ent,const Standard_Boolean complete = Standard_True);
		%feature("autodoc", "Args:
	None
Returns:
	Interface_CheckIterator

Returns the Check List produced by the last execution of  
          either : EvaluateFile(for Split), SendSplit, SendAll,  
          SendSelected, RunTransformer-RunModifier  
          Cleared by SetModel or ClearData(1)  
          The field is protected, hence a specialized WorkSession may  
          fill it") LastRunCheckList;
		Interface_CheckIterator LastRunCheckList ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the Maximum Value for an Item Identifier. It can be  
          greater to the count of known Items, because some can have  
          been removed") MaxIdent;
		Standard_Integer MaxIdent ();
		%feature("autodoc", "Args:
	id(Standard_Integer)

Returns:
	Handle_Standard_Transient

Returns an Item, given its Ident. Returns a Null Handle if  
          no Item corresponds to this Ident.") Item;
		Handle_Standard_Transient Item (const Standard_Integer id);
		%feature("autodoc", "Args:
	item(Handle_Standard_Transient)

Returns:
	Standard_Integer

Returns the Ident attached to an Item in the WorkSession, or  
          Zero if it is unknown") ItemIdent;
		Standard_Integer ItemIdent (const Handle_Standard_Transient & item);
		%feature("autodoc", "Args:
	name(char *)

Returns:
	Handle_Standard_Transient

Returns the Item which corresponds to a Variable, given its  
          Name (whatever the type of this Item).  
          Returns a Null Handle if this Name is not recorded") NamedItem;
		Handle_Standard_Transient NamedItem (const char * name);
		%feature("autodoc", "Args:
	name(Handle_TCollection_HAsciiString)

Returns:
	Handle_Standard_Transient

Same as above, but <name> is given through a Handle  
          Especially Usefull with methods SelectionNames, etc...") NamedItem;
		Handle_Standard_Transient NamedItem (const Handle_TCollection_HAsciiString & name);
		%feature("autodoc", "Args:
	name(char *)

Returns:
	Standard_Integer

Returns the Ident attached to a Name, 0 if name not recorded") NameIdent;
		Standard_Integer NameIdent (const char * name);
		%feature("autodoc", "Args:
	item(Handle_Standard_Transient)

Returns:
	Standard_Boolean

Returns True if an Item of the WorkSession has an attached Name") HasName;
		Standard_Boolean HasName (const Handle_Standard_Transient & item);
		%feature("autodoc", "Args:
	item(Handle_Standard_Transient)

Returns:
	Handle_TCollection_HAsciiString

Returns the Name attached to an Item as a Variable of this  
          WorkSession. If <item> is Null or not recorded, returns an  
          empty string.") Name;
		Handle_TCollection_HAsciiString Name (const Handle_Standard_Transient & item);
		%feature("autodoc", "Args:
	item(Handle_Standard_Transient)
	active(Standard_Boolean)=Standard_True

Returns:
	Standard_Integer

Adds an Item and returns its attached Ident. Does nothing  
          if <item> is already recorded (and returns its attached Ident)  
          <active> if True commands call to SetActive (see below)  
          Remark : the determined Ident is used if <item> is a Dispatch,  
          to fill the ShareOut") AddItem;
		Standard_Integer AddItem (const Handle_Standard_Transient & item,const Standard_Boolean active = Standard_True);
		%feature("autodoc", "Args:
	name(char *)
	item(Handle_Standard_Transient)
	active(Standard_Boolean)=Standard_True

Returns:
	Standard_Integer

Adds an Item with an attached Name. If the Name is already  
          known in the WorkSession, the older item losts it  
          Returns Ident if Done, 0 else, i.e. if <item> is null  
          If <name> is empty, works as AddItem (i.e. with no name)  
          If <item> is already known but with no attached Name, this  
          method tries to attached a Name to it  
          <active> if True commands call to SetActive (see below)") AddNamedItem;
		Standard_Integer AddNamedItem (const char * name,const Handle_Standard_Transient & item,const Standard_Boolean active = Standard_True);
		%feature("autodoc", "Args:
	item(Handle_Standard_Transient)
	mode(Standard_Boolean)

Returns:
	Standard_Boolean

Following the type of <item> :  
          - Dispatch : Adds or Removes it in the ShareOut & FileNaming  
          - GeneralModifier : Adds or Removes it for final sending  
            (i.e. in the ModelCopier)  
          Returns True if it did something, False else (state unchanged)") SetActive;
		Standard_Boolean SetActive (const Handle_Standard_Transient & item,const Standard_Boolean mode);
		%feature("autodoc", "Args:
	name(char *)

Returns:
	Standard_Boolean

Removes an Item from the Session, given its Name  
          Returns True if Done, False else (Name not recorded)  
          (Applies only on Item which are Named)") RemoveNamedItem;
		Standard_Boolean RemoveNamedItem (const char * name);
		%feature("autodoc", "Args:
	name(char *)

Returns:
	Standard_Boolean

Removes a Name without removing the Item  
          Returns True if Done, False else (Name not recorded)") RemoveName;
		Standard_Boolean RemoveName (const char * name);
		%feature("autodoc", "Args:
	item(Handle_Standard_Transient)

Returns:
	Standard_Boolean

Removes an Item given its Ident. Returns False if <id> is  
          attached to no Item in the WorkSession. For a Named Item,  
          also removes its Name.") RemoveItem;
		Standard_Boolean RemoveItem (const Handle_Standard_Transient & item);
		%feature("autodoc", "Args:
	None
Returns:
	None

Clears all the recorded Items : Selections, Dispatches,  
          Modifiers, and Strings & IntParams, with their Idents & Names.  
          Remark that if a Model has been loaded, it is not cleared.") ClearItems;
		void ClearItems ();
		%feature("autodoc", "Args:
	id(Standard_Integer)

Returns:
	Handle_TCollection_HAsciiString

Returns a Label which illustrates the content of an Item,  
          given its Ident. This Label is :  
          - for a Text Parameter, 'Text:<text value>'  
          - for an Integer Parameter, 'Integer:<integer value>'  
          - for a Selection, a Dispatch or a Modifier, its Label  
            (see these classes)  
          - for any other kind of Variable, its cdl type") ItemLabel;
		Handle_TCollection_HAsciiString ItemLabel (const Standard_Integer id);
		%feature("autodoc", "Args:
	type(Handle_Standard_Type)

Returns:
	Handle_TColStd_HSequenceOfInteger

Fills a Sequence with the List of Idents attached to the Items  
          of which Type complies with (IsKind) <type> (alphabetic order)  
          Remark : <type> = TYPE(Standard_Transient) gives all the  
          Idents which are suitable in the WorkSession") ItemIdents;
		Handle_TColStd_HSequenceOfInteger ItemIdents (const Handle_Standard_Type & type);
		%feature("autodoc", "Args:
	type(Handle_Standard_Type)

Returns:
	Handle_TColStd_HSequenceOfHAsciiString

Fills a Sequence with the list of the Names attached to Items  
          of which Type complies with (IsKind) <type> (alphabetic order)  
          Remark : <type> = TYPE(Standard_Transient) gives all the Names") ItemNames;
		Handle_TColStd_HSequenceOfHAsciiString ItemNames (const Handle_Standard_Type & type);
		%feature("autodoc", "Args:
	label(char *)

Returns:
	Handle_TColStd_HSequenceOfHAsciiString

Fills a Sequence with the NAMES of the control items, of which  
          the label matches <label> (contain it) : see NextIdentForLabel  
          Search mode is fixed to 'contained'  
          If <label> is empty, returns all Names") ItemNamesForLabel;
		Handle_TColStd_HSequenceOfHAsciiString ItemNamesForLabel (const char * label);
		%feature("autodoc", "Args:
	label(char *)
	id(Standard_Integer)
	mode(Standard_Integer)=0

Returns:
	Standard_Integer

For query by Label with possible iterations  
          Searches the Ident of which Item has a Label which matches a  
          given one, the search starts from an initial Ident.  
          Returns the first found Ident which follows <id>, or ZERO  
 
          The search must start with <id> = 0, it returns the next Ident  
          which matches. To iterate, call again this method which this  
          returned value as <id>. Once an Ident has been returned, the  
          Item can be obtained by the method Item  
 
          <mode> precises the required matching mode :  
          - 0 (Default) : <label> must match exactly with the Item Label  
          - 1 : <label> must match the exact beginning (the end is free)  
          - 2 : <label> must be at least once wherever in the Item Label  
          - other values are ignored") NextIdentForLabel;
		Standard_Integer NextIdentForLabel (const char * label,const Standard_Integer id,const Standard_Integer mode = 0);
		%feature("autodoc", "Args:
	statname(char *)
	name(char *)=

Returns:
	Handle_Standard_Transient

Creates a parameter as being bound to a Static  
          If the Static is Integer, this creates an IntParam bound to  
          it by its name. Else this creates a String which is the value  
          of the Static.  
          Returns a null handle if <statname> is unknown as a Static") NewParamFromStatic;
		Handle_Standard_Transient NewParamFromStatic (const char * statname,const char * name = "");
		%feature("autodoc", "Args:
	id(Standard_Integer)

Returns:
	Handle_IFSelect_IntParam

Returns an IntParam, given its Ident in the Session  
          Null result if <id> is not suitable for an IntParam  
          (undefined, or defined for another kind of variable)") IntParam;
		Handle_IFSelect_IntParam IntParam (const Standard_Integer id);
		%feature("autodoc", "Args:
	it(Handle_IFSelect_IntParam)

Returns:
	Standard_Integer

Returns Integer Value of an IntParam") IntValue;
		Standard_Integer IntValue (const Handle_IFSelect_IntParam & it);
		%feature("autodoc", "Args:
	name(char *)=

Returns:
	Handle_IFSelect_IntParam

Creates a new IntParam. A Name can be set (Optional)  
          Returns the created IntParam, or a Null Handle in case of  
          Failure (see AddItem/AddNamedItem)") NewIntParam;
		Handle_IFSelect_IntParam NewIntParam (const char * name = "");
		%feature("autodoc", "Args:
	it(Handle_IFSelect_IntParam)
	val(Standard_Integer)

Returns:
	Standard_Boolean

Changes the Integer Value of an IntParam  
          Returns True if Done, False if <it> is not in the WorkSession") SetIntValue;
		Standard_Boolean SetIntValue (const Handle_IFSelect_IntParam & it,const Standard_Integer val);
		%feature("autodoc", "Args:
	id(Standard_Integer)

Returns:
	Handle_TCollection_HAsciiString

Returns a TextParam, given its Ident in the Session  
          Null result if <id> is not suitable for a TextParam  
          (undefined, or defined for another kind of variable)") TextParam;
		Handle_TCollection_HAsciiString TextParam (const Standard_Integer id);
		%feature("autodoc", "Args:
	par(Handle_TCollection_HAsciiString)

Returns:
	TCollection_AsciiString

Returns Text Value of a TextParam (a String)  
          or an empty string if <it> is not in the WorkSession") TextValue;
		TCollection_AsciiString TextValue (const Handle_TCollection_HAsciiString & par);
		%feature("autodoc", "Args:
	name(char *)=

Returns:
	Handle_TCollection_HAsciiString

Creates a new (empty) TextParam. A Name can be set (Optional)  
          Returns the created TextParam (as an HAsciiString), or a Null  
          Handle in case of Failure (see AddItem/AddNamedItem)") NewTextParam;
		Handle_TCollection_HAsciiString NewTextParam (const char * name = "");
		%feature("autodoc", "Args:
	par(Handle_TCollection_HAsciiString)
	val(char *)

Returns:
	Standard_Boolean

Changes the Text Value of a TextParam (an HAsciiString)  
          Returns True if Done, False if <it> is not in the WorkSession") SetTextValue;
		Standard_Boolean SetTextValue (const Handle_TCollection_HAsciiString & par,const char * val);
		%feature("autodoc", "Args:
	id(Standard_Integer)

Returns:
	Handle_IFSelect_Signature

Returns a Signature, given its Ident in the Session  
          Null result if <id> is not suitable for a Signature  
          (undefined, or defined for another kind of variable)") Signature;
		Handle_IFSelect_Signature Signature (const Standard_Integer id);
		%feature("autodoc", "Args:
	sign(Handle_IFSelect_Signature)
	ent(Handle_Standard_Transient)

Returns:
	char *

Returns the Value computed by a Signature for an Entity  
          Returns an empty string if the entity does not belong to the  
          loaded model") SignValue;
		char * SignValue (const Handle_IFSelect_Signature & sign,const Handle_Standard_Transient & ent);
		%feature("autodoc", "Args:
	id(Standard_Integer)

Returns:
	Handle_IFSelect_Selection

Returns a Selection, given its Ident in the Session  
          Null result if <id> is not suitable for a Selection  
          (undefined, or defined for another kind of variable)") Selection;
		Handle_IFSelect_Selection Selection (const Standard_Integer id);
		%feature("autodoc", "Args:
	sel(Handle_IFSelect_Selection)

Returns:
	Interface_EntityIterator

Evaluates the effect of a Selection applied on the input Model  
          Returned Result remains empty if no input Model has been set") EvalSelection;
		Interface_EntityIterator EvalSelection (const Handle_IFSelect_Selection & sel);
		%feature("autodoc", "Args:
	sel(Handle_IFSelect_Selection)

Returns:
	IFSelect_SelectionIterator

Returns the Selections which are source of Selection, given  
          its rank in the List of Selections (see SelectionIterator)  
          Returned value is empty if <num> is out of range or if  
          <sel> is not in the WorkSession") Sources;
		IFSelect_SelectionIterator Sources (const Handle_IFSelect_Selection & sel);
		%feature("autodoc", "Args:
	sel(Handle_IFSelect_Selection)

Returns:
	Handle_TColStd_HSequenceOfTransient

Returns the result of a Selection, computed by EvalSelection  
          (see above) under the form of a HSequence (hence, it can be  
          used by a frontal-engine logic). It can be empty  
          Returns a Null Handle if <sel> is not in the WorkSession") SelectionResult;
		Handle_TColStd_HSequenceOfTransient SelectionResult (const Handle_IFSelect_Selection & sel);
		%feature("autodoc", "Args:
	sel(Handle_IFSelect_Selection)
	list(Handle_TColStd_HSequenceOfTransient)

Returns:
	Handle_TColStd_HSequenceOfTransient

Returns the result of a Selection, by forcing its input with  
          a given list <list> (unless <list> is Null).  
              RULES :  
          <list> applies only for a SelectDeduct kind Selection :  
          its Input is considered : if it is a SelectDeduct kind  
           Selection, its Input is considered, etc... until an Input  
          is not a Deduct/Extract : its result is replaced by <list>  
          and all the chain of deductions is applied") SelectionResultFromList;
		Handle_TColStd_HSequenceOfTransient SelectionResultFromList (const Handle_IFSelect_Selection & sel,const Handle_TColStd_HSequenceOfTransient & list);
		%feature("autodoc", "Args:
	item(Handle_Standard_Transient)
	sel(Handle_IFSelect_Selection)

Returns:
	Standard_Boolean

Sets a Selection as input for an item, according its type :  
          if <item> is a Dispatch : as Final Selection  
          if <item> is a GeneralModifier (i.e. any kind of Modifier) :  
            as Selection used to filter entities to modify  
          <sel>  Null  causes this Selection to be nullified  
          Returns False if <item> is not of a suitable type, or  
            <item> or <sel> is not in the WorkSession") SetItemSelection;
		Standard_Boolean SetItemSelection (const Handle_Standard_Transient & item,const Handle_IFSelect_Selection & sel);
		%feature("autodoc", "Args:
	item(Handle_Standard_Transient)

Returns:
	Standard_Boolean

Resets input Selection which was set by SetItemSelection  
          Same conditions as for SetItemSelection  
          Returns True if done, False if <item> is not in the WorkSession") ResetItemSelection;
		Standard_Boolean ResetItemSelection (const Handle_Standard_Transient & item);
		%feature("autodoc", "Args:
	item(Handle_Standard_Transient)

Returns:
	Handle_IFSelect_Selection

Returns the Selection of a Dispatch or a GeneralModifier.  
          Returns a Null Handle if none is defined or <item> not good type") ItemSelection;
		Handle_IFSelect_Selection ItemSelection (const Handle_Standard_Transient & item);
		%feature("autodoc", "Args:
	id(Standard_Integer)

Returns:
	Handle_IFSelect_SignCounter

Returns a SignCounter from its ident in the Session  
          Null result if <id> is not suitable for a SignCounter  
          (undefined, or defined for another kind of variable)") SignCounter;
		Handle_IFSelect_SignCounter SignCounter (const Standard_Integer id);
		%feature("autodoc", "Args:
	counter(Handle_IFSelect_SignCounter)
	forced(Standard_Boolean)=Standard_False

Returns:
	Standard_Boolean

Computes the content of a SignCounter when it is defined with  
          a Selection, then returns True  
          Returns False if the SignCounter is not defined with a  
          Selection, or if its Selection Mode is inhibited  
          <forced> to work around optimisations") ComputeCounter;
		Standard_Boolean ComputeCounter (const Handle_IFSelect_SignCounter & counter,const Standard_Boolean forced = Standard_False);
		%feature("autodoc", "Args:
	counter(Handle_IFSelect_SignCounter)
	list(Handle_TColStd_HSequenceOfTransient)
	clear(Standard_Boolean)=Standard_True

Returns:
	Standard_Boolean

Computes the content of a SignCounter from an input list  
          If <list> is Null, uses internal definition of the Counter :  
            a Selection, else the whole Model (recomputation forced)  
          If <clear> is True (D), starts from scratch  
          Else, cumulates computations") ComputeCounterFromList;
		Standard_Boolean ComputeCounterFromList (const Handle_IFSelect_SignCounter & counter,const Handle_TColStd_HSequenceOfTransient & list,const Standard_Boolean clear = Standard_True);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TColStd_HSequenceOfInteger

Returns the ordered list of dispatches stored by the ShareOut") AppliedDispatches;
		Handle_TColStd_HSequenceOfInteger AppliedDispatches ();
		%feature("autodoc", "Args:
	onlydisp(Standard_Boolean)

Returns:
	None

Clears the list of Dispatches recorded by the ShareOut  
          if <only> disp is True, tha's all. Else, clears also the lists  
          of Modifiers recorded by the ShareOut") ClearShareOut;
		void ClearShareOut (const Standard_Boolean onlydisp);
		%feature("autodoc", "Args:
	id(Standard_Integer)

Returns:
	Handle_IFSelect_Dispatch

Returns a Dispatch, given its Ident in the Session  
          Null result if <id> is not suitable for a Dispatch  
          (undefined, or defined for another kind of variable)") Dispatch;
		Handle_IFSelect_Dispatch Dispatch (const Standard_Integer id);
		%feature("autodoc", "Args:
	disp(Handle_IFSelect_Dispatch)

Returns:
	Standard_Integer

Returns the rank of a Dispatch in the ShareOut, or 0 if <disp>  
          is not in the ShareOut or not in the WorkSession") DispatchRank;
		Standard_Integer DispatchRank (const Handle_IFSelect_Dispatch & disp);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_IFSelect_ModelCopier

Gives access to the complete ModelCopier") ModelCopier;
		Handle_IFSelect_ModelCopier ModelCopier ();
		%feature("autodoc", "Args:
	copier(Handle_IFSelect_ModelCopier)

Returns:
	None

Sets a new ModelCopier. Fills Items which its content") SetModelCopier;
		void SetModelCopier (const Handle_IFSelect_ModelCopier & copier);
		%feature("autodoc", "Args:
	formodel(Standard_Boolean)

Returns:
	Standard_Integer

Returns the count of Modifiers applied to final sending  
          Model Modifiers if <formodel> is True, File Modifiers else  
          (i.e. Modifiers which apply once the Models have been filled)") NbFinalModifiers;
		Standard_Integer NbFinalModifiers (const Standard_Boolean formodel);
		%feature("autodoc", "Args:
	formodel(Standard_Boolean)

Returns:
	Handle_TColStd_HSequenceOfInteger

Fills a Sequence with a list of Idents, those attached to  
          the Modifiers applied to final sending.  
          Model Modifiers if <formodel> is True, File Modifiers else  
          This list is given in the order in which they will be applied  
          (which takes into account the Changes to Modifier Ranks)") FinalModifierIdents;
		Handle_TColStd_HSequenceOfInteger FinalModifierIdents (const Standard_Boolean formodel);
		%feature("autodoc", "Args:
	id(Standard_Integer)

Returns:
	Handle_IFSelect_GeneralModifier

Returns a Modifier, given its Ident in the Session  
          Null result if <id> is not suitable for a Modifier  
          (undefined, or defined for another kind of variable)") GeneralModifier;
		Handle_IFSelect_GeneralModifier GeneralModifier (const Standard_Integer id);
		%feature("autodoc", "Args:
	id(Standard_Integer)

Returns:
	Handle_IFSelect_Modifier

Returns a Model Modifier, given its Ident in the Session,  
          i.e. typed as a Modifier (not simply a GeneralModifier)  
          Null result if <id> is not suitable for a Modifier  
          (undefined, or defined for another kind of variable)") ModelModifier;
		Handle_IFSelect_Modifier ModelModifier (const Standard_Integer id);
		%feature("autodoc", "Args:
	item(Handle_IFSelect_GeneralModifier)

Returns:
	Standard_Integer

Returns the Rank of a Modifier given its Ident. Model or File  
          Modifier according its type (ModelModifier or not)  
          Remember that Modifiers are applied sequencially following  
          their Rank : first Model Modifiers then File Modifiers  
          Rank is given by rank of call to AddItem and can be  
          changed by ChangeModifierRank") ModifierRank;
		Standard_Integer ModifierRank (const Handle_IFSelect_GeneralModifier & item);
		%feature("autodoc", "Args:
	formodel(Standard_Boolean)
	before(Standard_Integer)
	after(Standard_Integer)

Returns:
	Standard_Boolean

Changes the Rank of a Modifier in the Session :  
          Model Modifiers if <formodel> is True, File Modifiers else  
          the Modifier n0 <before> is put to n0 <after>  
          Return True if Done, False if <before> or <after> out of range") ChangeModifierRank;
		Standard_Boolean ChangeModifierRank (const Standard_Boolean formodel,const Standard_Integer before,const Standard_Integer after);
		%feature("autodoc", "Args:
	None
Returns:
	None

Removes all the Modifiers active in the ModelCopier : they  
          become inactive and they are removed from the Session") ClearFinalModifiers;
		void ClearFinalModifiers ();
		%feature("autodoc", "Args:
	modif(Handle_IFSelect_GeneralModifier)
	item(Handle_Standard_Transient)

Returns:
	Standard_Boolean

Sets a GeneralModifier to be applied to an item :  
          - item = ShareOut : applies for final sending (all dispatches)  
          - item is a Dispatch : applies for this dispatch only  
          Returns True if done, False if <modif> or <item> not in <self>") SetAppliedModifier;
		Standard_Boolean SetAppliedModifier (const Handle_IFSelect_GeneralModifier & modif,const Handle_Standard_Transient & item);
		%feature("autodoc", "Args:
	modif(Handle_IFSelect_GeneralModifier)

Returns:
	Standard_Boolean

Resets a GeneralModifier to be applied  
          Returns True if done, False if <modif> was not applied") ResetAppliedModifier;
		Standard_Boolean ResetAppliedModifier (const Handle_IFSelect_GeneralModifier & modif);
		%feature("autodoc", "Args:
	modif(Handle_IFSelect_GeneralModifier)

Returns:
	Handle_Standard_Transient

Returns the item on which a GeneralModifier is applied :  
          the ShareOut, or a given Dispatch  
          Returns a Null Handle if <modif> is not applied") UsesAppliedModifier;
		Handle_Standard_Transient UsesAppliedModifier (const Handle_IFSelect_GeneralModifier & modif);
		%feature("autodoc", "Args:
	id(Standard_Integer)

Returns:
	Handle_IFSelect_Transformer

Returns a Transformer, given its Ident in the Session  
          Null result if <id> is not suitable for a Transformer  
          (undefined, or defined for another kind of variable)") Transformer;
		Handle_IFSelect_Transformer Transformer (const Standard_Integer id);
		%feature("autodoc", "Args:
	transf(Handle_IFSelect_Transformer)

Returns:
	Standard_Integer

Runs a Transformer on starting Model, which can then be edited  
          or replaced by a new one. The Protocol can also be changed.  
          Fills LastRunCheckList  
 
          Returned status is 0 if nothing done (<transf> or model  
            undefined), positive if OK, negative else :  
          0  : Nothing done  
          1  : OK, edition on the spot with no change to the graph  
               of dependances (purely local)  
          2  : OK, model edited on the spot (graph recomputed, may  
              have changed), protocol unchanged  
          3  : OK, new model produced, same protocol  
          4  : OK, model edited on the spot (graph recomputed),  
               but protocol has changed  
          5  : OK, new model produced, protocol has changed  
          -1 : Error on the spot (slight changes), data may be corrupted  
               (remark : corruption should not be profound)  
          -2 : Error on edition the spot, data may be corrupted  
               (checking them is recommanded)  
          -3 : Error with a new data set, transformation ignored  
          -4 : OK as 4, but graph of dependances count not be recomputed  
               (the former one is kept) : check the protocol") RunTransformer;
		Standard_Integer RunTransformer (const Handle_IFSelect_Transformer & transf);
		%feature("autodoc", "Args:
	modif(Handle_IFSelect_Modifier)
	copy(Standard_Boolean)

Returns:
	Standard_Integer

Runs a Modifier on Starting Model. It can modify entities, or  
          add new ones. But the Model or the Protocol is unchanged.  
          The Modifier is applied on each entity of the Model. See also  
            RunModifierSelected  
          Fills LastRunCheckList  
 
          <copy> : if True, a new data set is produced which brings  
            the modifications (Model + its Entities)  
          if False, data are modified on the spot  
 
          It works through a TransformStandard defined with <modif>  
          Returned status as RunTransformer : 0 nothing done, >0 OK,  
          <0 problem, but only between -3 and 3 (protocol unchanged)  
          Remark : <copy> True will give <effect> = 3 or -3") RunModifier;
		Standard_Integer RunModifier (const Handle_IFSelect_Modifier & modif,const Standard_Boolean copy);
		%feature("autodoc", "Args:
	modif(Handle_IFSelect_Modifier)
	sel(Handle_IFSelect_Selection)
	copy(Standard_Boolean)

Returns:
	Standard_Integer

Acts as RunModifier, but the Modifier is applied on the list  
          determined by a Selection, rather than on the whole Model  
          If the selection is a null handle, the whole model is taken") RunModifierSelected;
		Standard_Integer RunModifierSelected (const Handle_IFSelect_Modifier & modif,const Handle_IFSelect_Selection & sel,const Standard_Boolean copy);
		%feature("autodoc", "Args:
	copy(Standard_Boolean)
	name(char *)=

Returns:
	Handle_IFSelect_Transformer

Creates and returns a TransformStandard, empty, with its  
          Copy Option (True = Copy, False = On the Spot) and an  
          optional name.  
          To a TransformStandard, the method SetAppliedModifier applies") NewTransformStandard;
		Handle_IFSelect_Transformer NewTransformStandard (const Standard_Boolean copy,const char * name = "");
		%feature("autodoc", "Args:
	sel(Handle_IFSelect_Selection)
	keep(Standard_Boolean)

Returns:
	Standard_Boolean

Defines a new content from the former one  
          If <keep> is True, it is given by entities selected by  
             Selection <sel>  (and all shared entities)  
          Else, it is given by all the former content but entities  
             selected by the Selection <sel> (and properly shared ones)  
          Returns True if done. Returns False if the selected list  
          (from <sel>) is empty, hence nothing is done") SetModelContent;
		Standard_Boolean SetModelContent (const Handle_IFSelect_Selection & sel,const Standard_Boolean keep);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TCollection_HAsciiString

Returns the defined File Prefix. Null Handle if not defined") FilePrefix;
		Handle_TCollection_HAsciiString FilePrefix ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TCollection_HAsciiString

Returns the defined Default File Root. It is used for  
          Dispatches which have no specific root attached.  
          Null Handle if not defined") DefaultFileRoot;
		Handle_TCollection_HAsciiString DefaultFileRoot ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TCollection_HAsciiString

Returns the defined File Extension. Null Handle if not defined") FileExtension;
		Handle_TCollection_HAsciiString FileExtension ();
		%feature("autodoc", "Args:
	disp(Handle_IFSelect_Dispatch)

Returns:
	Handle_TCollection_HAsciiString

Returns the File Root defined for a Dispatch. Null if no  
          Root Name is defined for it (hence, no File will be produced)") FileRoot;
		Handle_TCollection_HAsciiString FileRoot (const Handle_IFSelect_Dispatch & disp);
		%feature("autodoc", "Args:
	name(char *)

Returns:
	None

Defines a File Prefix") SetFilePrefix;
		void SetFilePrefix (const char * name);
		%feature("autodoc", "Args:
	name(char *)

Returns:
	Standard_Boolean

Defines a Default File Root Name. Clears it is <name> = ''  
          Returns True if OK, False if <name> already set for a Dispatch") SetDefaultFileRoot;
		Standard_Boolean SetDefaultFileRoot (const char * name);
		%feature("autodoc", "Args:
	name(char *)

Returns:
	None

Defines a File Extension") SetFileExtension;
		void SetFileExtension (const char * name);
		%feature("autodoc", "Args:
	disp(Handle_IFSelect_Dispatch)
	name(char *)

Returns:
	Standard_Boolean

Defines a Root for a Dispatch  
          If <name> is empty, clears Root Name  
          This has as effect to inhibit the production of File by <disp>  
          Returns False if <disp> is not in the WorkSession or if a  
          root name is already defined for it") SetFileRoot;
		Standard_Boolean SetFileRoot (const Handle_IFSelect_Dispatch & disp,const char * name);
		%feature("autodoc", "Args:
	file(char *)

Returns:
	char *

Extracts File Root Name from a given complete file name  
          (uses OSD_Path)") GiveFileRoot;
		char * GiveFileRoot (const char * file);
		%feature("autodoc", "Args:
	file(char *)

Returns:
	char *

Completes a file name as required, with Prefix and Extension  
          (if defined; for a non-defined item, completes nothing)") GiveFileComplete;
		char * GiveFileComplete (const char * file);
		%feature("autodoc", "Args:
	None
Returns:
	None

Erases all stored data from the File Evaluation  
          (i.e. ALL former naming informations are lost)") ClearFile;
		void ClearFile ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Performs and stores a File Evaluation. The Results are a List  
          of produced Models and a List of names (Strings), in parallel  
          Fills LastRunCheckList") EvaluateFile;
		void EvaluateFile ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the count of produced Models") NbFiles;
		Standard_Integer NbFiles ();
		%feature("autodoc", "Args:
	num(Standard_Integer)

Returns:
	Handle_Interface_InterfaceModel

Returns a Model, given its rank in the Evaluation List") FileModel;
		Handle_Interface_InterfaceModel FileModel (const Standard_Integer num);
		%feature("autodoc", "Args:
	num(Standard_Integer)

Returns:
	TCollection_AsciiString

Returns the name of a file corresponding to a produced Model,  
          given its rank in the Evaluation List") FileName;
		TCollection_AsciiString FileName (const Standard_Integer num);
		%feature("autodoc", "Args:
	record(Standard_Boolean)

Returns:
	None

Commands file sending to clear the list of already sent files,  
          commands to record a new one if <record> is True  
          This list is managed by the ModelCopier when SendSplit is called  
          It allows a global exploitation of the set of sent files") BeginSentFiles;
		void BeginSentFiles (const Standard_Boolean record);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TColStd_HSequenceOfHAsciiString

Returns the list of recorded sent files, or a Null Handle is  
          recording has not been enabled") SentFiles;
		Handle_TColStd_HSequenceOfHAsciiString SentFiles ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Performs creation of derived files from the input Model  
          Takes its data (sub-models and names), from result EvaluateFile  
          if active, else by dynamic Evaluation (not stored)  
          After SendSplit, result of EvaluateFile is Cleared  
          Fills LastRunCheckList  
 
          Works with the WorkLibrary which acts on specific type of Model  
          and can work with File Modifiers (managed by the Model Copier)  
          and a ModelCopier, which can work with Model Modifiers  
          Returns False if, either WorkLibrary has failed on at least  
          one sub-file, or the Work Session is badly conditionned  
          (no Model defined, or FileNaming not in phase with ShareOut)") SendSplit;
		Standard_Boolean SendSplit ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_IFSelect_PacketList

Returns an Evaluation of the whole ShareOut definition : i.e.  
          how the entities of the starting model are forecast to be sent  
          to various files :  list of packets according the dispatches,  
          effective lists of roots for each packet (which determine the  
          content of the corresponding file); plus evaluation of which  
          entities are : forgotten (sent into no file), duplicated (sent  
          into more than one file), sent into a given file.  
          See the class PacketList for more details.") EvalSplit;
		Handle_IFSelect_PacketList EvalSplit ();
		%feature("autodoc", "Args:
	count(Standard_Integer)=- 1

Returns:
	Interface_EntityIterator

Returns the list of Entities sent in files, accourding the  
          count of files each one has been sent (these counts are reset  
          by SetModel or SetRemaining(Forget) ) stored in Graph Status  
          <count> = -1 (default) is for ENtities sent at least once  
          <count> = 0 is for the Remaining List (entities not yet sent)  
          <count> = 1 is for entities sent in one and only one file  
            (the ideal case)  
          Remaining Data are computed on each Sending/Copying output  
          files (see methods EvaluateFile and SendSplit)  
          Graph Status is 0 for Remaining Entity, <count> for Sent into  
          <count> files  
          This status is set to 0 (not yet sent) for all by SetModel  
          and by SetRemaining(mode=Forget,Display)") SentList;
		Interface_EntityIterator SentList (const Standard_Integer count = - 1);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the greater count of different files in which any of  
          the starting entities could be sent.  
          Before any file output, this count is 0.  
          Ideal count is 1. More than 1 means that duplications occur.") MaxSendingCount;
		Standard_Integer MaxSendingCount ();
		%feature("autodoc", "Args:
	mode(IFSelect_RemainMode)

Returns:
	Standard_Boolean

Processes Remaining data (after having sent files), mode :  
          Forget  : forget remaining info (i.e. clear all 'Sent' status)  
          Compute : compute and keep remaining (does nothing if :  
                remaining is empty or if no files has been sent)  
          Display : display entities recorded as remaining  
          Undo    : restore former state of data (after Remaining(1) )  
          Returns True if OK, False else (i.e. mode = 2 and Remaining  
          List is either empty or takes all the entities, or mode = 3  
          and no former computation of remaining data was done)") SetRemaining;
		Standard_Boolean SetRemaining (const IFSelect_RemainMode mode);
		%feature("autodoc", "Args:
	filename(char *)
	computegraph(Standard_Boolean)=Standard_False

Returns:
	IFSelect_ReturnStatus

Sends the starting Model into one file, without splitting,  
          managing remaining data or anything else.  
          <computegraph> true commands the Graph to be recomputed before  
          sending : required when a Model is filled in several steps  
 
          The Model and File Modifiers recorded to be applied on sending  
          files are.  
          Returns a status of execution :  
            Done if OK,  
            Void if no data available,  
            Error if errors occured (work library is not defined), errors  
            during translation  
            Fail if exception during translation is raised  
            Stop if no disk space or disk, file is write protected  
          Fills LastRunCheckList") SendAll;
		IFSelect_ReturnStatus SendAll (const char * filename,const Standard_Boolean computegraph = Standard_False);
		%feature("autodoc", "Args:
	filename(char *)
	sel(Handle_IFSelect_Selection)
	computegraph(Standard_Boolean)=Standard_False

Returns:
	IFSelect_ReturnStatus

Sends a part of the starting Model into one file, without  
          splitting. But remaining data are managed.  
          <computegraph> true commands the Graph to be recomputed before  
          sending : required when a Model is filled in several steps  
 
          The Model and File Modifiers recorded to be applied on sending  
          files are.  
          Returns a status : Done if OK,  Fail if error during send,  
           Error : WorkLibrary not defined, Void : selection list empty  
          Fills LastRunCheckList") SendSelected;
		IFSelect_ReturnStatus SendSelected (const char * filename,const Handle_IFSelect_Selection & sel,const Standard_Boolean computegraph = Standard_False);
		%feature("autodoc", "Args:
	filename(char *)

Returns:
	IFSelect_ReturnStatus

Writes the current Interface Model globally to a File, and  
          returns a write status which can be :  
            Done OK, Fail file could not be written, Error no norm is selected  
Remark  : It is a simple, one-file writing, other operations are  
          available (such as splitting ...) which calls SendAll") WriteFile;
		IFSelect_ReturnStatus WriteFile (const char * filename);
		%feature("autodoc", "Args:
	filename(char *)
	sel(Handle_IFSelect_Selection)

Returns:
	IFSelect_ReturnStatus

Writes a sub-part of the current Interface Model to a File,  
          as defined by a Selection <sel>, recomputes the Graph, and  
          returns a write status which can be :  
            Done OK, Fail file could not be written, Error no norm is selected  
Remark  : It is a simple, one-file writing, other operations are  
          available (such as splitting ...) which calls SendSelected") WriteFile;
		IFSelect_ReturnStatus WriteFile (const char * filename,const Handle_IFSelect_Selection & sel);
		%feature("autodoc", "Args:
	sel(Handle_IFSelect_Selection)

Returns:
	Standard_Integer

Returns the count of Input Selections known for a Selection,  
          or 0 if <sel> not in the WorkSession. This count is one for a  
          SelectDeduct / SelectExtract kind, two for SelectControl kind,  
          variable for a SelectCombine (Union/Intersection), zero else") NbSources;
		Standard_Integer NbSources (const Handle_IFSelect_Selection & sel);
		%feature("autodoc", "Args:
	sel(Handle_IFSelect_Selection)
	num(Standard_Integer)=1

Returns:
	Handle_IFSelect_Selection

Returns the <num>th Input Selection of a Selection  
          (see NbSources).  
          Returns a Null Handle if <sel> is not in the WorkSession or if  
          <num> is out of the range <1-NbSources>  
          To obtain more details, see the method Sources") Source;
		Handle_IFSelect_Selection Source (const Handle_IFSelect_Selection & sel,const Standard_Integer num = 1);
		%feature("autodoc", "Args:
	sel(Handle_IFSelect_Selection)

Returns:
	Standard_Boolean

Returns True if <sel> a Reversed SelectExtract, False else") IsReversedSelectExtract;
		Standard_Boolean IsReversedSelectExtract (const Handle_IFSelect_Selection & sel);
		%feature("autodoc", "Args:
	sel(Handle_IFSelect_Selection)

Returns:
	Standard_Boolean

Toggles the Sense (Direct <-> Reversed) of a SelectExtract  
          Returns True if Done, False if <sel> is not a SelectExtract or  
          is not in the WorkSession") ToggleSelectExtract;
		Standard_Boolean ToggleSelectExtract (const Handle_IFSelect_Selection & sel);
		%feature("autodoc", "Args:
	sel(Handle_IFSelect_Selection)
	input(Handle_IFSelect_Selection)

Returns:
	Standard_Boolean

Sets an Input Selection (as <input>) to a SelectExtract or  
          a SelectDeduct (as <sel>).  
          Returns True if Done, False if <sel> is neither a  
          SelectExtract nor a SelectDeduct, or not in the WorkSession") SetInputSelection;
		Standard_Boolean SetInputSelection (const Handle_IFSelect_Selection & sel,const Handle_IFSelect_Selection & input);
		%feature("autodoc", "Args:
	sel(Handle_IFSelect_Selection)
	sc(Handle_IFSelect_Selection)
	formain(Standard_Boolean)=Standard_True

Returns:
	Standard_Boolean

Sets an Input Selection, Main if <formain> is True, Second else  
          (as <sc>) to a SelectControl (as <sel>). Returns True if Done,  
          False if <sel> is not a SelectControl, or <sc> or <sel> is not  
          in the WorkSession") SetControl;
		Standard_Boolean SetControl (const Handle_IFSelect_Selection & sel,const Handle_IFSelect_Selection & sc,const Standard_Boolean formain = Standard_True);
		%feature("autodoc", "Args:
	selcomb(Handle_IFSelect_Selection)
	seladd(Handle_IFSelect_Selection)
	atnum(Standard_Integer)=0

Returns:
	Standard_Integer

Adds an input selection to a SelectCombine (Union or Inters.).  
          Returns new count of inputs for this SelectCombine if Done or  
          0 if <sel> is not kind of SelectCombine, or if <seladd> or  
          <sel> is not in the WorkSession  
          By default, adding is done at the end of the list  
          Else, it is an insertion to rank <atnum> (usefull for Un-ReDo)") CombineAdd;
		Standard_Integer CombineAdd (const Handle_IFSelect_Selection & selcomb,const Handle_IFSelect_Selection & seladd,const Standard_Integer atnum = 0);
		%feature("autodoc", "Args:
	selcomb(Handle_IFSelect_Selection)
	selrem(Handle_IFSelect_Selection)

Returns:
	Standard_Boolean

Removes an input selection from a SelectCombine (Union or  
          Intersection). Returns True if done, False if <selcomb> is not  
          kind of SelectCombine or <selrem> is not source of <selcomb>") CombineRemove;
		Standard_Boolean CombineRemove (const Handle_IFSelect_Selection & selcomb,const Handle_IFSelect_Selection & selrem);
		%feature("autodoc", "Args:
	list(Handle_TColStd_HSequenceOfTransient)
	name(char *)

Returns:
	Handle_IFSelect_Selection

Creates a new Selection, of type SelectPointed, its content  
          starts with <list>. A name must be given (can be empty)") NewSelectPointed;
		Handle_IFSelect_Selection NewSelectPointed (const Handle_TColStd_HSequenceOfTransient & list,const char * name);
		%feature("autodoc", "Args:
	sel(Handle_IFSelect_Selection)
	list(Handle_TColStd_HSequenceOfTransient)
	mode(Standard_Integer)

Returns:
	Standard_Boolean

Changes the content of a Selection of type SelectPointed  
          According <mode> : 0  set <list> as new content (clear former)  
            1  : adds <list> to actual content  
           -1  : removes <list> from actual content  
          Returns True if done, False if <sel> is not a SelectPointed") SetSelectPointed;
		Standard_Boolean SetSelectPointed (const Handle_IFSelect_Selection & sel,const Handle_TColStd_HSequenceOfTransient & list,const Standard_Integer mode);
		%feature("autodoc", "Args:
	selname(char *)

Returns:
	Handle_IFSelect_Selection

Returns a Selection from a Name :  
          - the name of a Selection : this Selection  
          - the name of a Signature + criteria between (..) : a new  
            Selection from this Signature  
          - an entity or a list of entities : a new SelectPointed  
          Else, returns a Null Handle") GiveSelection;
		Handle_IFSelect_Selection GiveSelection (const char * selname);
		%feature("autodoc", "Args:
	obj(Handle_Standard_Transient)

Returns:
	Handle_TColStd_HSequenceOfTransient

Determines a list of entities from an object :  
          <obj> already HSequenceOfTransient : returned itself  
          <obj> Selection : its Result of Evaluation is returned  
          <obj> an entity of the Model : a HSequence which contains it  
          else, an empty HSequence  
          <obj> the Model it self : ALL its content (not only the roots)") GiveList;
		Handle_TColStd_HSequenceOfTransient GiveList (const Handle_Standard_Transient & obj);
		%feature("autodoc", "Args:
	first(char *)
	second(char *)=

Returns:
	Handle_TColStd_HSequenceOfTransient

Computes a List of entities from two alphanums,  
          first and second, as follows :  
          if <first> is a Number or Label of an entity : this entity  
          if <first> is a list of Numbers/Labels : the list of entities  
          if <first> is the name of a Selection in <WS>, and <second>  
            not defined, the standard result of this Selection  
          else, let's consider 'first second' : this whole phrase is  
          splitted by blanks, as follows (RECURSIVE CALL) :  
          - the leftest term is the final selection  
          - the other terms define the result of the selection  
          - and so on (the 'leftest minus one' is a selection, of which  
            the input is given by the remaining ...)") GiveList;
		Handle_TColStd_HSequenceOfTransient GiveList (const char * first,const char * second = "");
		%feature("autodoc", "Args:
	selname(char *)
	ent(Handle_Standard_Transient)

Returns:
	Handle_TColStd_HSequenceOfTransient

Computes a List of entities from the model as follows  
          <first> beeing a Selection or a combination of Selections,  
            <ent> beeing an entity or a list  
          of entities (as a HSequenceOfTransient) :  
            the standard result of this selection applied to this list  
          if <ent> is Null, the standard definition of the selection is  
            used (which contains a default input selection)  
          if <selname> is erroneous, a null handle is returned  
 
          REMARK : selname is processed as <first second> of preceeding  
            GiveList") GiveListFromList;
		Handle_TColStd_HSequenceOfTransient GiveListFromList (const char * selname,const Handle_Standard_Transient & ent);
		%feature("autodoc", "Args:
	l1(Handle_TColStd_HSequenceOfTransient)
	l2(Handle_TColStd_HSequenceOfTransient)
	mode(Standard_Integer)

Returns:
	Handle_TColStd_HSequenceOfTransient

Combines two lists and returns the result, according to mode :  
          <mode> < 0 : entities in <l1> AND NOT in <l2>  
          <mode> = 0 : entities in <l1> AND in <l2>  
          <mode> > 0 : entities in <l1> OR  in <l2>") GiveListCombined;
		Handle_TColStd_HSequenceOfTransient GiveListCombined (const Handle_TColStd_HSequenceOfTransient & l1,const Handle_TColStd_HSequenceOfTransient & l2,const Standard_Integer mode);
		%feature("autodoc", "Args:
	chl(Interface_CheckIterator)

Returns:
	None

Loads data from a check iterator to query status on it") QueryCheckList;
		void QueryCheckList (const Interface_CheckIterator & chl);
		%feature("autodoc", "Args:
	ent(Handle_Standard_Transient)

Returns:
	Standard_Integer

Determines check status for an entity regarding last call to  
          QueryCheckList :  
          -1 : <ent> unknown in the model, ignored  
           0 : no check at all, immediate or inherited thru Graph  
           1 : immediate warning (no fail), no inherited check  
           2 : immediate fail, no inherited check  
          +10 : idem but some inherited warning (no fail)  
          +20 : idem but some inherited fail") QueryCheckStatus;
		Standard_Integer QueryCheckStatus (const Handle_Standard_Transient & ent);
		%feature("autodoc", "Args:
	entdad(Handle_Standard_Transient)
	entson(Handle_Standard_Transient)

Returns:
	Standard_Integer

Determines if <entdad> is parent of <entson> (in the graph),  
          returns : -1 if no; 0 if <entdad> = <entson>  
          1 if immediate parent, > 1 if parent, gives count of steps") QueryParent;
		Standard_Integer QueryParent (const Handle_Standard_Transient & entdad,const Handle_Standard_Transient & entson);
		%feature("autodoc", "Args:
	params(TColStd_SequenceOfTransient)
	uselist(TColStd_SequenceOfInteger)

Returns:
	None

Sets a list of Parameters, i.e. TypedValue, to be handled  
          through an Editor  
          The two lists are parallel, if <params> is longer than <uses>,  
          surnumeral parameters are for general use  
 
          EditForms are created to handle these parameters (list, edit)  
          on the basis of a ParamEditor  xst-params-edit  
 
          A use number dispatches the parameter to a given EditForm  
          EditForms are defined as follows  
          Name                Use   Means  
          xst-params          all   All Parameters (complete list)  
          xst-params-general  1     Generals  
          xst-params-load     2     LoadFile (no Transfer)  
          xst-params-send     3     SendFile (Write, no Transfer)  
          xst-params-split    4     Split  
          xst-param-read      5     Transfer on Reading  
          xst-param-write     6     Transfer on Writing") SetParams;
		void SetParams (const TColStd_SequenceOfTransient & params,const TColStd_SequenceOfInteger & uselist);
		%feature("autodoc", "Args:
	use(Standard_Integer)
	mode(Standard_Integer)=0

Returns:
	None

Traces the Statics attached to a given use number  
          If <use> is given positive (normal), the trace is embedded  
          with a header and a trailer  
          If <use> is negative, just values are printed  
            (this allows to make compositions)  
          Remark : use number  5 commands use -2 to be traced  
          Remark : use numbers 4 and 6 command use -3 to be traced") TraceStatics;
		void TraceStatics (const Standard_Integer use,const Standard_Integer mode = 0);
		%feature("autodoc", "Args:
	None
Returns:
	None

Dumps contents of the ShareOut (on 'cout')") DumpShare;
		void DumpShare ();
		%feature("autodoc", "Args:
	label(char *)=

Returns:
	None

Lists the Labels of all Items of the WorkSession  
          If <label> is defined, lists labels which contain it") ListItems;
		void ListItems (const char * label = "");
		%feature("autodoc", "Args:
	formodel(Standard_Boolean)

Returns:
	None

Lists the Modifiers of the session (for each one, displays  
          its Label). Listing is done following Ranks (Modifiers are  
          invoked following their ranks)  
          Model Modifiers if <formodel> is True, File Modifiers else") ListFinalModifiers;
		void ListFinalModifiers (const Standard_Boolean formodel);
		%feature("autodoc", "Args:
	sel(Handle_IFSelect_Selection)

Returns:
	None

Lists a Selection and its Sources (see SelectionIterator),  
          given its rank in the list") DumpSelection;
		void DumpSelection (const Handle_IFSelect_Selection & sel);
		%feature("autodoc", "Args:
	level(Standard_Integer)
	S(Handle_Message_Messenger)

Returns:
	None

Lists the content of the Input Model (if there is one)  
          According level : 0 -> gives only count of Entities and Roots  
          1 -> Lists also Roots;  2 -> Lists all Entities (by TraceType)  
          3 -> Performs a call to CheckList (Fails) and lists the result  
          4 -> as 3 but all CheckList (Fails + Warnings)  
          5,6,7  : as 3 but resp. Count,List,Labels by Fail  
          8,9,10 : as 4 but resp. Count,List,Labels by message") DumpModel;
		void DumpModel (const Standard_Integer level,const Handle_Message_Messenger & S);
		%feature("autodoc", "Args:
	mode(Standard_Integer)

Returns:
	None

Dumps the current Model (as inherited DumpModel), on currently  
          defined Default Trace File (default is standard output)") TraceDumpModel;
		void TraceDumpModel (const Standard_Integer mode);
		%feature("autodoc", "Args:
	ent(Handle_Standard_Transient)
	level(Standard_Integer)
	S(Handle_Message_Messenger)

Returns:
	None

Dumps a starting entity according to the current norm.  
          To do this, it calls DumpEntity from WorkLibrary.  
          <level> is to be interpreted for each norm : see specific  
          classes of WorkLibrary for it. Generally, 0 if for very basic  
          (only type ...), greater values give more and more details.") DumpEntity;
		void DumpEntity (const Handle_Standard_Transient & ent,const Standard_Integer level,const Handle_Message_Messenger & S);
		%feature("autodoc", "Args:
	ent(Handle_Standard_Transient)
	S(Handle_Message_Messenger)

Returns:
	None

Prints main informations about an entity : its number, type,  
          validity (and checks if any), category, shareds and sharings..  
          mutable because it can recompute checks as necessary") PrintEntityStatus;
		void PrintEntityStatus (const Handle_Standard_Transient & ent,const Handle_Message_Messenger & S);
		%feature("autodoc", "Args:
	ent(Handle_Standard_Transient)
	level(Standard_Integer)

Returns:
	None

Dumps an entity from the current Model as inherited DumpEntity  
          on currently defined Default Trace File  
          (<level> interpreted according to the Norm, see WorkLibrary)") TraceDumpEntity;
		void TraceDumpEntity (const Handle_Standard_Transient & ent,const Standard_Integer level);
		%feature("autodoc", "Args:
	checklist(Interface_CheckIterator)
	failsonly(Standard_Boolean)
	mode(IFSelect_PrintCount)

Returns:
	None

Prints a CheckIterator to the current Trace File, controlled  
          with the current Model  
          complete or fails only, according to <failsonly>  
          <mode> defines the mode of printing  
          0 : sequential, according entities; else with a CheckCounter  
          1 : according messages, count of entities  
          2 : id but with list of entities, designated by their numbers  
          3 : as 2 but with labels of entities") PrintCheckList;
		void PrintCheckList (const Interface_CheckIterator & checklist,const Standard_Boolean failsonly,const IFSelect_PrintCount mode);
		%feature("autodoc", "Args:
	signlist(Handle_IFSelect_SignatureList)
	mode(IFSelect_PrintCount)

Returns:
	None

Prints a SignatureList to the current Trace File, controlled  
          with the current Model  
          <mode> defines the mode of printing (see SignatureList)") PrintSignatureList;
		void PrintSignatureList (const Handle_IFSelect_SignatureList & signlist,const IFSelect_PrintCount mode);
		%feature("autodoc", "Args:
	sel(Handle_IFSelect_Selection)

Returns:
	None

Displays the list of Entities selected by a Selection (i.e.  
          the result of EvalSelection).") EvaluateSelection;
		void EvaluateSelection (const Handle_IFSelect_Selection & sel);
		%feature("autodoc", "Args:
	disp(Handle_IFSelect_Dispatch)
	mode(Standard_Integer)=0

Returns:
	None

Displays the result of applying a Dispatch on the input Model  
          (also shows Remainder if there is)  
          <mode> = 0 (default), displays nothing else  
          <mode> = 1 : displays also duplicated entities (because of  
             this dispatch)  
          <mode> = 2 : displays the entities of the starting Model  
             which are not taken by this dispatch (forgotten entities)  
          <mode> = 3 : displays both duplicated and forgotten entities  
          Remark : EvaluateComplete displays these data evaluated for  
          for all the dispatches, if there are several") EvaluateDispatch;
		void EvaluateDispatch (const Handle_IFSelect_Dispatch & disp,const Standard_Integer mode = 0);
		%feature("autodoc", "Args:
	mode(Standard_Integer)=0

Returns:
	None

Displays the effect of applying the ShareOut on the input  
          Model.  
          <mode> = 0 (default) : displays only roots for each packet,  
          <mode> = 1 : displays all entities for each packet, plus  
            duplicated entities  
          <mode> = 2 : same as <mode> = 1, plus displays forgotten  
            entities (which are in no packet at all)") EvaluateComplete;
		void EvaluateComplete (const Standard_Integer mode = 0);
		%feature("autodoc", "Args:
	iter(Interface_EntityIterator)
	mode(Standard_Integer)

Returns:
	None

Internal method which displays an EntityIterator  
          <mode> 0 gives short display (only entity numbers)  
          1 gives a more complete trace (1 line per Entity)  
          (can be used each time a trace has to be output from a list)  
          2 gives a form suitable for givelist : (n1,n2,n3...)") ListEntities;
		void ListEntities (const Interface_EntityIterator & iter,const Standard_Integer mode);
};


%feature("shadow") IFSelect_WorkSession::~IFSelect_WorkSession %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IFSelect_WorkSession {
	void _kill_pointed() {
		delete $self;
	}
};
%extend IFSelect_WorkSession {
	Handle_IFSelect_WorkSession GetHandle() {
	return *(Handle_IFSelect_WorkSession*) &$self;
	}
};

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
    IFSelect_WorkSession* GetObject() {
    return (IFSelect_WorkSession*)$self->Access();
    }
};
%feature("shadow") Handle_IFSelect_WorkSession::~Handle_IFSelect_WorkSession %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_IFSelect_WorkSession {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor IFSelect_Act;
class IFSelect_Act : public IFSelect_Activator {
	public:
		%feature("autodoc", "Args:
	name(char *)
	help(char *)
	func(IFSelect_ActFunc)

Returns:
	None

Creates an Act with a name, help and a function  
          mode (Add or AddSet) is given when recording") IFSelect_Act;
		 IFSelect_Act (const char * name,const char * help,const IFSelect_ActFunc func);
		%feature("autodoc", "Args:
	number(Standard_Integer)
	pilot(Handle_IFSelect_SessionPilot)

Returns:
	IFSelect_ReturnStatus

Execution of Command Line. remark that <number> is senseless  
          because each Act brings one and only one function") Do;
		IFSelect_ReturnStatus Do (const Standard_Integer number,const Handle_IFSelect_SessionPilot & pilot);
		%feature("autodoc", "Args:
	number(Standard_Integer)

Returns:
	char *

Short Help for commands : returns the help given to create") Help;
		char * Help (const Standard_Integer number);
		%feature("autodoc", "Args:
	group(char *)
	file(char *)=

Returns:
	static void

Changes the default group name for the following Acts  
          group empty means to come back to default from Activator  
          Also a file name can be precised (to query by getsource)") SetGroup;
		static void SetGroup (const char * group,const char * file = "");
		%feature("autodoc", "Args:
	name(char *)
	help(char *)
	func(IFSelect_ActFunc)

Returns:
	static void

Adds a function with its name and help : creates an Act then  
          records it as normal function") AddFunc;
		static void AddFunc (const char * name,const char * help,const IFSelect_ActFunc func);
		%feature("autodoc", "Args:
	name(char *)
	help(char *)
	func(IFSelect_ActFunc)

Returns:
	static void

Adds a function with its name and help : creates an Act then  
          records it as function for XSET (i.e. to create control item)") AddFSet;
		static void AddFSet (const char * name,const char * help,const IFSelect_ActFunc func);
};


%feature("shadow") IFSelect_Act::~IFSelect_Act %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IFSelect_Act {
	void _kill_pointed() {
		delete $self;
	}
};
%extend IFSelect_Act {
	Handle_IFSelect_Act GetHandle() {
	return *(Handle_IFSelect_Act*) &$self;
	}
};

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
    IFSelect_Act* GetObject() {
    return (IFSelect_Act*)$self->Access();
    }
};
%feature("shadow") Handle_IFSelect_Act::~Handle_IFSelect_Act %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_IFSelect_Act {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor IFSelect_BasicDumper;
class IFSelect_BasicDumper : public IFSelect_SessionDumper {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates a BasicDumper and puts it into the Library of Dumper") IFSelect_BasicDumper;
		 IFSelect_BasicDumper ();
		%feature("autodoc", "Args:
	file(IFSelect_SessionFile)
	item(Handle_Standard_Transient)

Returns:
	Standard_Boolean

Write the Own Parameters of Types defined in package IFSelect  
          Returns True if <item> has been processed, False else") WriteOwn;
		Standard_Boolean WriteOwn (IFSelect_SessionFile & file,const Handle_Standard_Transient & item);
		%feature("autodoc", "Args:
	file(IFSelect_SessionFile)
	type(TCollection_AsciiString)
	item(Handle_Standard_Transient)

Returns:
	Standard_Boolean

Recognizes and Read Own Parameters for Types of package  
          IFSelect. Returns True if done and <item> created, False else") ReadOwn;
		Standard_Boolean ReadOwn (IFSelect_SessionFile & file,const TCollection_AsciiString & type,Handle_Standard_Transient & item);
};


%feature("shadow") IFSelect_BasicDumper::~IFSelect_BasicDumper %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IFSelect_BasicDumper {
	void _kill_pointed() {
		delete $self;
	}
};
%extend IFSelect_BasicDumper {
	Handle_IFSelect_BasicDumper GetHandle() {
	return *(Handle_IFSelect_BasicDumper*) &$self;
	}
};

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
    IFSelect_BasicDumper* GetObject() {
    return (IFSelect_BasicDumper*)$self->Access();
    }
};
%feature("shadow") Handle_IFSelect_BasicDumper::~Handle_IFSelect_BasicDumper %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_IFSelect_BasicDumper {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor IFSelect_CheckCounter;
class IFSelect_CheckCounter : public IFSelect_SignatureList {
	public:
		%feature("autodoc", "Args:
	withlist(Standard_Boolean)=Standard_False

Returns:
	None

Creates a CheckCounter, empty ready to work") IFSelect_CheckCounter;
		 IFSelect_CheckCounter (const Standard_Boolean withlist = Standard_False);
		%feature("autodoc", "Args:
	sign(Handle_MoniTool_SignText)

Returns:
	None

Sets a specific signature  
          Else, the current SignType (in the model) is used") SetSignature;
		void SetSignature (const Handle_MoniTool_SignText & sign);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_MoniTool_SignText

Returns the Signature;") Signature;
		Handle_MoniTool_SignText Signature ();
		%feature("autodoc", "Args:
	list(Interface_CheckIterator)
	model(Handle_Interface_InterfaceModel)
	original(Standard_Boolean)=Standard_False
	failsonly(Standard_Boolean)=Standard_False

Returns:
	None

Analyses a CheckIterator according a Model (which detains the  
          entities for which the CheckIterator has messages), i.e.  
          counts messages for entities  
          If <original> is True, does not consider final messages but  
            those before interpretation (such as inserting variables :  
            integers, reals, strings)  
          If <failsonly> is True, only Fails are considered  
          Remark : global messages are recorded with a Null entity") Analyse;
		void Analyse (const Interface_CheckIterator & list,const Handle_Interface_InterfaceModel & model,const Standard_Boolean original = Standard_False,const Standard_Boolean failsonly = Standard_False);
};


%feature("shadow") IFSelect_CheckCounter::~IFSelect_CheckCounter %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IFSelect_CheckCounter {
	void _kill_pointed() {
		delete $self;
	}
};
%extend IFSelect_CheckCounter {
	Handle_IFSelect_CheckCounter GetHandle() {
	return *(Handle_IFSelect_CheckCounter*) &$self;
	}
};

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
    IFSelect_CheckCounter* GetObject() {
    return (IFSelect_CheckCounter*)$self->Access();
    }
};
%feature("shadow") Handle_IFSelect_CheckCounter::~Handle_IFSelect_CheckCounter %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_IFSelect_CheckCounter {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor IFSelect_DispGlobal;
class IFSelect_DispGlobal : public IFSelect_Dispatch {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates a DispGlobal") IFSelect_DispGlobal;
		 IFSelect_DispGlobal ();
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

Returns as Label, 'One File for all Input'") Label;
		TCollection_AsciiString Label ();
		%feature("autodoc", "Args:
	nbent(Standard_Integer)
	max(Standard_Integer)

Returns:
	virtual Standard_Boolean

Returns True : maximum equates 1") LimitedMax;
		virtual Standard_Boolean LimitedMax (const Standard_Integer nbent,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	G(Interface_Graph)
	count(Standard_Integer)

Returns:
	virtual Standard_Integer

Returns True (count of packets is well known) and count is 1") PacketsCount;
		virtual Standard_Integer PacketsCount (const Interface_Graph & G,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	G(Interface_Graph)
	packs(IFGraph_SubPartsIterator)

Returns:
	None

Computes the list of produced Packets. It is made of only ONE  
          Packet, which gets the RootResult from the Final Selection.  
          Remark : the inherited exception raising is never activated.") Packets;
		void Packets (const Interface_Graph & G,IFGraph_SubPartsIterator & packs);
};


%feature("shadow") IFSelect_DispGlobal::~IFSelect_DispGlobal %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IFSelect_DispGlobal {
	void _kill_pointed() {
		delete $self;
	}
};
%extend IFSelect_DispGlobal {
	Handle_IFSelect_DispGlobal GetHandle() {
	return *(Handle_IFSelect_DispGlobal*) &$self;
	}
};

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
    IFSelect_DispGlobal* GetObject() {
    return (IFSelect_DispGlobal*)$self->Access();
    }
};
%feature("shadow") Handle_IFSelect_DispGlobal::~Handle_IFSelect_DispGlobal %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_IFSelect_DispGlobal {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor IFSelect_DispPerCount;
class IFSelect_DispPerCount : public IFSelect_Dispatch {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates a DispPerCount with no Count (default value 1)") IFSelect_DispPerCount;
		 IFSelect_DispPerCount ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_IFSelect_IntParam

Returns the Count Parameter used for splitting") Count;
		Handle_IFSelect_IntParam Count ();
		%feature("autodoc", "Args:
	count(Handle_IFSelect_IntParam)

Returns:
	None

Sets a new Parameter for Count") SetCount;
		void SetCount (const Handle_IFSelect_IntParam & count);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the effective value of the count parameter  
          (if Count Parameter not Set or value not positive, returns 1)") CountValue;
		Standard_Integer CountValue ();
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

Returns as Label, 'One File per <count> Input Entities'") Label;
		TCollection_AsciiString Label ();
		%feature("autodoc", "Args:
	nbent(Standard_Integer)
	max(Standard_Integer)

Returns:
	virtual Standard_Boolean

Returns True, maximum count is given as <nbent>") LimitedMax;
		virtual Standard_Boolean LimitedMax (const Standard_Integer nbent,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	G(Interface_Graph)
	count(Standard_Integer)

Returns:
	virtual Standard_Integer

Returns True (count is easy to know) and count is computed  
          from length of input list (RootResult from Final Selection)") PacketsCount;
		virtual Standard_Integer PacketsCount (const Interface_Graph & G,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	G(Interface_Graph)
	packs(IFGraph_SubPartsIterator)

Returns:
	None

Computes the list of produced Packets. It defines Packets in  
          order to have at most <Count> Entities per Packet, Entities  
          are given by RootResult from the Final Selection.") Packets;
		void Packets (const Interface_Graph & G,IFGraph_SubPartsIterator & packs);
};


%feature("shadow") IFSelect_DispPerCount::~IFSelect_DispPerCount %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IFSelect_DispPerCount {
	void _kill_pointed() {
		delete $self;
	}
};
%extend IFSelect_DispPerCount {
	Handle_IFSelect_DispPerCount GetHandle() {
	return *(Handle_IFSelect_DispPerCount*) &$self;
	}
};

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
    IFSelect_DispPerCount* GetObject() {
    return (IFSelect_DispPerCount*)$self->Access();
    }
};
%feature("shadow") Handle_IFSelect_DispPerCount::~Handle_IFSelect_DispPerCount %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_IFSelect_DispPerCount {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor IFSelect_DispPerFiles;
class IFSelect_DispPerFiles : public IFSelect_Dispatch {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates a DispPerFiles with no Count (default value 1 file)") IFSelect_DispPerFiles;
		 IFSelect_DispPerFiles ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_IFSelect_IntParam

Returns the Count Parameter used for splitting") Count;
		Handle_IFSelect_IntParam Count ();
		%feature("autodoc", "Args:
	count(Handle_IFSelect_IntParam)

Returns:
	None

Sets a new Parameter for Count") SetCount;
		void SetCount (const Handle_IFSelect_IntParam & count);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the effective value of the count parameter  
          (if Count Parameter not Set or value not positive, returns 1)") CountValue;
		Standard_Integer CountValue ();
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

Returns as Label, 'Maximum <count> Files'") Label;
		TCollection_AsciiString Label ();
		%feature("autodoc", "Args:
	nbent(Standard_Integer)
	max(Standard_Integer)

Returns:
	virtual Standard_Boolean

Returns True, maximum count is given as CountValue") LimitedMax;
		virtual Standard_Boolean LimitedMax (const Standard_Integer nbent,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	G(Interface_Graph)
	count(Standard_Integer)

Returns:
	virtual Standard_Integer

Returns True (count is easy to know) and count is the minimum  
          value between  length of input list and CountValue") PacketsCount;
		virtual Standard_Integer PacketsCount (const Interface_Graph & G,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	G(Interface_Graph)
	packs(IFGraph_SubPartsIterator)

Returns:
	None

Computes the list of produced Packets. It defines Packets in  
          order to have <Count> Packets, except if the input count of  
          Entities is lower. Entities are given by RootResult from the  
          Final Selection.") Packets;
		void Packets (const Interface_Graph & G,IFGraph_SubPartsIterator & packs);
};


%feature("shadow") IFSelect_DispPerFiles::~IFSelect_DispPerFiles %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IFSelect_DispPerFiles {
	void _kill_pointed() {
		delete $self;
	}
};
%extend IFSelect_DispPerFiles {
	Handle_IFSelect_DispPerFiles GetHandle() {
	return *(Handle_IFSelect_DispPerFiles*) &$self;
	}
};

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
    IFSelect_DispPerFiles* GetObject() {
    return (IFSelect_DispPerFiles*)$self->Access();
    }
};
%feature("shadow") Handle_IFSelect_DispPerFiles::~Handle_IFSelect_DispPerFiles %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_IFSelect_DispPerFiles {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor IFSelect_DispPerOne;
class IFSelect_DispPerOne : public IFSelect_Dispatch {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates a DispPerOne") IFSelect_DispPerOne;
		 IFSelect_DispPerOne ();
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

Returns as Label, 'One File per Input Entity'") Label;
		TCollection_AsciiString Label ();
		%feature("autodoc", "Args:
	nbent(Standard_Integer)
	max(Standard_Integer)

Returns:
	virtual Standard_Boolean

Returns True, maximum limit is given as <nbent>") LimitedMax;
		virtual Standard_Boolean LimitedMax (const Standard_Integer nbent,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	G(Interface_Graph)
	count(Standard_Integer)

Returns:
	virtual Standard_Integer

Returns True (count is easy to know) and count is the length  
          of the input list (RootResult from FinalSelection)") PacketsCount;
		virtual Standard_Integer PacketsCount (const Interface_Graph & G,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	G(Interface_Graph)
	packs(IFGraph_SubPartsIterator)

Returns:
	None

Returns the list of produced Packets. It defines one Packet  
          per Entity given by RootResult from the Final Selection.") Packets;
		void Packets (const Interface_Graph & G,IFGraph_SubPartsIterator & packs);
};


%feature("shadow") IFSelect_DispPerOne::~IFSelect_DispPerOne %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IFSelect_DispPerOne {
	void _kill_pointed() {
		delete $self;
	}
};
%extend IFSelect_DispPerOne {
	Handle_IFSelect_DispPerOne GetHandle() {
	return *(Handle_IFSelect_DispPerOne*) &$self;
	}
};

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
    IFSelect_DispPerOne* GetObject() {
    return (IFSelect_DispPerOne*)$self->Access();
    }
};
%feature("shadow") Handle_IFSelect_DispPerOne::~Handle_IFSelect_DispPerOne %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_IFSelect_DispPerOne {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor IFSelect_DispPerSignature;
class IFSelect_DispPerSignature : public IFSelect_Dispatch {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates a DispPerSignature with no SignCounter (by default,  
          produces only one packet)") IFSelect_DispPerSignature;
		 IFSelect_DispPerSignature ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_IFSelect_SignCounter

Returns the SignCounter used for splitting") SignCounter;
		Handle_IFSelect_SignCounter SignCounter ();
		%feature("autodoc", "Args:
	sign(Handle_IFSelect_SignCounter)

Returns:
	None

Sets a SignCounter for sort  
          Remark : it is set to record lists of entities, not only counts") SetSignCounter;
		void SetSignCounter (const Handle_IFSelect_SignCounter & sign);
		%feature("autodoc", "Args:
	None
Returns:
	char *

Returns the name of the SignCounter, which caracterises the  
          sorting criterium for this Dispatch") SignName;
		char * SignName ();
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

Returns as Label, 'One File per Signature <name>'") Label;
		TCollection_AsciiString Label ();
		%feature("autodoc", "Args:
	nbent(Standard_Integer)
	max(Standard_Integer)

Returns:
	virtual Standard_Boolean

Returns True, maximum count is given as <nbent>") LimitedMax;
		virtual Standard_Boolean LimitedMax (const Standard_Integer nbent,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	G(Interface_Graph)
	packs(IFGraph_SubPartsIterator)

Returns:
	None

Computes the list of produced Packets. It defines Packets from  
          the SignCounter, which sirts the input Entities per Signature  
          (specific of the SignCounter).") Packets;
		void Packets (const Interface_Graph & G,IFGraph_SubPartsIterator & packs);
};


%feature("shadow") IFSelect_DispPerSignature::~IFSelect_DispPerSignature %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IFSelect_DispPerSignature {
	void _kill_pointed() {
		delete $self;
	}
};
%extend IFSelect_DispPerSignature {
	Handle_IFSelect_DispPerSignature GetHandle() {
	return *(Handle_IFSelect_DispPerSignature*) &$self;
	}
};

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
    IFSelect_DispPerSignature* GetObject() {
    return (IFSelect_DispPerSignature*)$self->Access();
    }
};
%feature("shadow") Handle_IFSelect_DispPerSignature::~Handle_IFSelect_DispPerSignature %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_IFSelect_DispPerSignature {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor IFSelect_Modifier;
class IFSelect_Modifier : public IFSelect_GeneralModifier {
	public:
		%feature("autodoc", "Args:
	ctx(IFSelect_ContextModif)
	target(Handle_Interface_InterfaceModel)
	protocol(Handle_Interface_Protocol)
	TC(Interface_CopyTool)

Returns:
	virtual void

This deferred method defines the action specific to each class  
          of Modifier. It is called by a ModelCopier, once the Model  
          generated and filled. ModelCopier has already checked the  
          criteria (Dispatch, Model Rank, Selection) before calling it.  
 
          <ctx> detains informations about original data and selection.  
          The result of copying, on which modifications are to be done,  
          is <target>.  
          <TC> allows to run additional copies as required  
 
          In case of Error, use methods CCheck from the ContextModif  
          to aknowledge an entity Check or a Global Check with messages") Perform;
		virtual void Perform (IFSelect_ContextModif & ctx,const Handle_Interface_InterfaceModel & target,const Handle_Interface_Protocol & protocol,Interface_CopyTool & TC);
};


%feature("shadow") IFSelect_Modifier::~IFSelect_Modifier %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IFSelect_Modifier {
	void _kill_pointed() {
		delete $self;
	}
};
%extend IFSelect_Modifier {
	Handle_IFSelect_Modifier GetHandle() {
	return *(Handle_IFSelect_Modifier*) &$self;
	}
};

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
    IFSelect_Modifier* GetObject() {
    return (IFSelect_Modifier*)$self->Access();
    }
};
%feature("shadow") Handle_IFSelect_Modifier::~Handle_IFSelect_Modifier %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_IFSelect_Modifier {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor IFSelect_ParamEditor;
class IFSelect_ParamEditor : public IFSelect_Editor {
	public:
		%feature("autodoc", "Args:
	nbmax(Standard_Integer)=100
	label(char *)=

Returns:
	None

Creates a ParamEditor, empty, with a maximum count of params  
          (default is 100)  
          And a label, by default it will be 'Param Editor'") IFSelect_ParamEditor;
		 IFSelect_ParamEditor (const Standard_Integer nbmax = 100,const char * label = "");
		%feature("autodoc", "Args:
	val(Handle_Interface_TypedValue)
	shortname(char *)=

Returns:
	None

Adds a TypedValue  
          By default, its short name equates its complete name, it can  
          be explicited") AddValue;
		void AddValue (const Handle_Interface_TypedValue & val,const char * shortname = "");
		%feature("autodoc", "Args:
	val(char *)
	shortname(char *)
	completename(char *)=

Returns:
	None

Adds a Constant Text, it will be Read Only  
          By default, its long name equates its shortname") AddConstantText;
		void AddConstantText (const char * val,const char * shortname,const char * completename = "");
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

No detailed docstring for this function.") Label;
		TCollection_AsciiString Label ();
		%feature("autodoc", "Args:
	form(Handle_IFSelect_EditForm)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Recognize;
		Standard_Boolean Recognize (const Handle_IFSelect_EditForm & form);
		%feature("autodoc", "Args:
	form(Handle_IFSelect_EditForm)
	num(Standard_Integer)

Returns:
	Handle_TCollection_HAsciiString

No detailed docstring for this function.") StringValue;
		Handle_TCollection_HAsciiString StringValue (const Handle_IFSelect_EditForm & form,const Standard_Integer num);
		%feature("autodoc", "Args:
	form(Handle_IFSelect_EditForm)
	ent(Handle_Standard_Transient)
	model(Handle_Interface_InterfaceModel)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Load;
		Standard_Boolean Load (const Handle_IFSelect_EditForm & form,const Handle_Standard_Transient & ent,const Handle_Interface_InterfaceModel & model);
		%feature("autodoc", "Args:
	form(Handle_IFSelect_EditForm)
	ent(Handle_Standard_Transient)
	model(Handle_Interface_InterfaceModel)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Apply;
		Standard_Boolean Apply (const Handle_IFSelect_EditForm & form,const Handle_Standard_Transient & ent,const Handle_Interface_InterfaceModel & model);
		%feature("autodoc", "Args:
	list(Handle_TColStd_HSequenceOfHAsciiString)
	label(char *)=

Returns:
	static Handle_IFSelect_ParamEditor

Returns a ParamEditor to work on the Static Parameters of  
          which names are listed in <list>  
          Null Handle if <list> is null or empty") StaticEditor;
		static Handle_IFSelect_ParamEditor StaticEditor (const Handle_TColStd_HSequenceOfHAsciiString & list,const char * label = "");
};


%feature("shadow") IFSelect_ParamEditor::~IFSelect_ParamEditor %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IFSelect_ParamEditor {
	void _kill_pointed() {
		delete $self;
	}
};
%extend IFSelect_ParamEditor {
	Handle_IFSelect_ParamEditor GetHandle() {
	return *(Handle_IFSelect_ParamEditor*) &$self;
	}
};

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
    IFSelect_ParamEditor* GetObject() {
    return (IFSelect_ParamEditor*)$self->Access();
    }
};
%feature("shadow") Handle_IFSelect_ParamEditor::~Handle_IFSelect_ParamEditor %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_IFSelect_ParamEditor {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor IFSelect_SelectBase;
class IFSelect_SelectBase : public IFSelect_Selection {
	public:
		%feature("autodoc", "Args:
	iter(IFSelect_SelectionIterator)

Returns:
	None

Puts in an Iterator the Selections from which 'me' depends  
          This list is empty for all SelectBase type Selections") FillIterator;
		void FillIterator (IFSelect_SelectionIterator & iter);
};


%feature("shadow") IFSelect_SelectBase::~IFSelect_SelectBase %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IFSelect_SelectBase {
	void _kill_pointed() {
		delete $self;
	}
};
%extend IFSelect_SelectBase {
	Handle_IFSelect_SelectBase GetHandle() {
	return *(Handle_IFSelect_SelectBase*) &$self;
	}
};

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
    IFSelect_SelectBase* GetObject() {
    return (IFSelect_SelectBase*)$self->Access();
    }
};
%feature("shadow") Handle_IFSelect_SelectBase::~Handle_IFSelect_SelectBase %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_IFSelect_SelectBase {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor IFSelect_SelectCombine;
class IFSelect_SelectCombine : public IFSelect_Selection {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the count of Input Selections") NbInputs;
		Standard_Integer NbInputs ();
		%feature("autodoc", "Args:
	num(Standard_Integer)

Returns:
	Handle_IFSelect_Selection

Returns an Input Selection, given its rank in the list") Input;
		Handle_IFSelect_Selection Input (const Standard_Integer num);
		%feature("autodoc", "Args:
	sel(Handle_IFSelect_Selection)

Returns:
	Standard_Integer

Returns the rank of an input Selection, 0 if not in the list.  
          Most generally, its value is meaningless, except for testing  
          the presence of an input Selection :  
          - == 0  if <sel> is not an input for <self>  
          - >  0  if <sel> is an input for <self>") InputRank;
		Standard_Integer InputRank (const Handle_IFSelect_Selection & sel);
		%feature("autodoc", "Args:
	sel(Handle_IFSelect_Selection)
	atnum(Standard_Integer)=0

Returns:
	None

Adds a Selection to the filling list  
          By default, adds it to the end of the list  
          A Positive rank less then NbInputs gives an insertion rank  
          (InsertBefore : the new <atnum>th item of the list is <sel>)") Add;
		void Add (const Handle_IFSelect_Selection & sel,const Standard_Integer atnum = 0);
		%feature("autodoc", "Args:
	sel(Handle_IFSelect_Selection)

Returns:
	Standard_Boolean

Removes an input Selection.  
          Returns True if Done, False, if <sel> is not an input for <self>") Remove;
		Standard_Boolean Remove (const Handle_IFSelect_Selection & sel);
		%feature("autodoc", "Args:
	num(Standard_Integer)

Returns:
	Standard_Boolean

Removes an input Selection, given its rank in the list  
          Returns True if Done, False if <num> is out of range") Remove;
		Standard_Boolean Remove (const Standard_Integer num);
		%feature("autodoc", "Args:
	iter(IFSelect_SelectionIterator)

Returns:
	None

Puts in an Iterator the Selections from which 'me' depends  
          That is to say, the list of Input Selections") FillIterator;
		void FillIterator (IFSelect_SelectionIterator & iter);
};


%feature("shadow") IFSelect_SelectCombine::~IFSelect_SelectCombine %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IFSelect_SelectCombine {
	void _kill_pointed() {
		delete $self;
	}
};
%extend IFSelect_SelectCombine {
	Handle_IFSelect_SelectCombine GetHandle() {
	return *(Handle_IFSelect_SelectCombine*) &$self;
	}
};

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
    IFSelect_SelectCombine* GetObject() {
    return (IFSelect_SelectCombine*)$self->Access();
    }
};
%feature("shadow") Handle_IFSelect_SelectCombine::~Handle_IFSelect_SelectCombine %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_IFSelect_SelectCombine {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor IFSelect_SelectControl;
class IFSelect_SelectControl : public IFSelect_Selection {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	Handle_IFSelect_Selection

Returns the Main Input Selection") MainInput;
		Handle_IFSelect_Selection MainInput ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True if a Control Input is defined  
          Thus, Result can be computed differently if there is a  
          Control Input or if there is none") HasSecondInput;
		Standard_Boolean HasSecondInput ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_IFSelect_Selection

Returns the Control Input Selection, or a Null Handle") SecondInput;
		Handle_IFSelect_Selection SecondInput ();
		%feature("autodoc", "Args:
	sel(Handle_IFSelect_Selection)

Returns:
	None

Sets a Selection to be the Main Input") SetMainInput;
		void SetMainInput (const Handle_IFSelect_Selection & sel);
		%feature("autodoc", "Args:
	sel(Handle_IFSelect_Selection)

Returns:
	None

Sets a Selection to be the Control Input") SetSecondInput;
		void SetSecondInput (const Handle_IFSelect_Selection & sel);
		%feature("autodoc", "Args:
	iter(IFSelect_SelectionIterator)

Returns:
	None

Puts in an Iterator the Selections from which 'me' depends  
          That is to say, the list of Input Selections") FillIterator;
		void FillIterator (IFSelect_SelectionIterator & iter);
};


%feature("shadow") IFSelect_SelectControl::~IFSelect_SelectControl %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IFSelect_SelectControl {
	void _kill_pointed() {
		delete $self;
	}
};
%extend IFSelect_SelectControl {
	Handle_IFSelect_SelectControl GetHandle() {
	return *(Handle_IFSelect_SelectControl*) &$self;
	}
};

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
    IFSelect_SelectControl* GetObject() {
    return (IFSelect_SelectControl*)$self->Access();
    }
};
%feature("shadow") Handle_IFSelect_SelectControl::~Handle_IFSelect_SelectControl %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_IFSelect_SelectControl {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor IFSelect_SelectDeduct;
class IFSelect_SelectDeduct : public IFSelect_Selection {
	public:
		%feature("autodoc", "Args:
	sel(Handle_IFSelect_Selection)

Returns:
	None

Defines or Changes the Input Selection") SetInput;
		void SetInput (const Handle_IFSelect_Selection & sel);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_IFSelect_Selection

Returns the Input Selection") Input;
		Handle_IFSelect_Selection Input ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True if the Input Selection is defined, False else") HasInput;
		Standard_Boolean HasInput ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Tells if an Alternate List has been set, i.e. : the Alternate  
          Definition is present and set") HasAlternate;
		Standard_Boolean HasAlternate ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_IFSelect_SelectPointed

Returns the Alternate Definition  
          It is returned modifiable, hence an already defined  
          SelectPointed can be used  
          But if it was not yet defined, it is created the first time  
 
          It is exploited by InputResult") Alternate;
		Handle_IFSelect_SelectPointed & Alternate ();
		%feature("autodoc", "Args:
	G(Interface_Graph)

Returns:
	Interface_EntityIterator

Returns the Result determined by Input Selection, as Unique  
          if Input Selection is not defined, returns an empty list.  
 
          If Alternate is set, InputResult takes its definition instead  
          of calling the Input Selection, then clears it") InputResult;
		Interface_EntityIterator InputResult (const Interface_Graph & G);
		%feature("autodoc", "Args:
	iter(IFSelect_SelectionIterator)

Returns:
	None

Puts in an Iterator the Selections from which 'me' depends  
          This list contains one Selection : the InputSelection") FillIterator;
		void FillIterator (IFSelect_SelectionIterator & iter);
};


%feature("shadow") IFSelect_SelectDeduct::~IFSelect_SelectDeduct %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IFSelect_SelectDeduct {
	void _kill_pointed() {
		delete $self;
	}
};
%extend IFSelect_SelectDeduct {
	Handle_IFSelect_SelectDeduct GetHandle() {
	return *(Handle_IFSelect_SelectDeduct*) &$self;
	}
};

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
    IFSelect_SelectDeduct* GetObject() {
    return (IFSelect_SelectDeduct*)$self->Access();
    }
};
%feature("shadow") Handle_IFSelect_SelectDeduct::~Handle_IFSelect_SelectDeduct %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_IFSelect_SelectDeduct {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor IFSelect_SessionPilot;
class IFSelect_SessionPilot : public IFSelect_Activator {
	public:
		%feature("autodoc", "Args:
	prompt(char *)=

Returns:
	None

Creates an empty SessionPilot, with a prompt which will be  
          displayed on querying commands. If not precised (''), this  
          prompt is set to 'Test-XSTEP>'") IFSelect_SessionPilot;
		 IFSelect_SessionPilot (const char * prompt = "");
		%feature("autodoc", "Args:
	None
Returns:
	Handle_IFSelect_WorkSession

Returns the WorkSession which is worked on") Session;
		Handle_IFSelect_WorkSession Session ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_IFSelect_WorkLibrary

Returns the WorKlibrary (Null if not set). WorkLibrary is used  
          to Read and Write Files, according to the Norm") Library;
		Handle_IFSelect_WorkLibrary Library ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns the Record Mode for Commands. Default is False.") RecordMode;
		Standard_Boolean RecordMode ();
		%feature("autodoc", "Args:
	WS(Handle_IFSelect_WorkSession)

Returns:
	None

Sets a WorkSession to be worked on") SetSession;
		void SetSession (const Handle_IFSelect_WorkSession & WS);
		%feature("autodoc", "Args:
	WL(Handle_IFSelect_WorkLibrary)

Returns:
	None

Sets a WorkLibrary") SetLibrary;
		void SetLibrary (const Handle_IFSelect_WorkLibrary & WL);
		%feature("autodoc", "Args:
	mode(Standard_Boolean)

Returns:
	None

Changes the RecordMode.") SetRecordMode;
		void SetRecordMode (const Standard_Boolean mode);
		%feature("autodoc", "Args:
	command(TCollection_AsciiString)

Returns:
	None

Sets the value of the Command Line to be interpreted  
          Also prepares the interpretation (splitting by blanks)") SetCommandLine;
		void SetCommandLine (const TCollection_AsciiString & command);
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

Returns the Command Line to be interpreted") CommandLine;
		const TCollection_AsciiString & CommandLine ();
		%feature("autodoc", "Args:
	numarg(Standard_Integer)=0

Returns:
	char *

Returns the part of the command line which begins at argument  
          <numarg> between 0 and NbWords-1 (by default, all the line)  
          Empty string if out of range") CommandPart;
		char * CommandPart (const Standard_Integer numarg = 0);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the count of words of the Command Line, separated by  
          blanks : 0 if empty, one if a command without args, else it  
          gives the count of args minus one.  
 Warning : limited to 10 (command title + 9 args)") NbWords;
		Standard_Integer NbWords ();
		%feature("autodoc", "Args:
	num(Standard_Integer)

Returns:
	TCollection_AsciiString

Returns a word given its rank in the Command Line. Begins at 0  
          which is the Command Title, 1 is the 1st arg., etc...") Word;
		const TCollection_AsciiString & Word (const Standard_Integer num);
		%feature("autodoc", "Args:
	num(Standard_Integer)

Returns:
	char *

Returns a word given its rank, as a CString.  
          As for Word, begins at 0 (the command name), etc...") Arg;
		char * Arg (const Standard_Integer num);
		%feature("autodoc", "Args:
	num(Standard_Integer)

Returns:
	Standard_Boolean

Removes a word given its rank. Returns True if Done, False if  
          <num> is out of range") RemoveWord;
		Standard_Boolean RemoveWord (const Standard_Integer num);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the count of recorded Commands") NbCommands;
		Standard_Integer NbCommands ();
		%feature("autodoc", "Args:
	num(Standard_Integer)

Returns:
	TCollection_AsciiString

Returns a recorded Command, given its rank (from 1)") Command;
		const TCollection_AsciiString & Command (const Standard_Integer num);
		%feature("autodoc", "Args:
	item(Handle_Standard_Transient)

Returns:
	IFSelect_ReturnStatus

Allows to associate a Transient Value with the last execution  
          as a partial result  
          Returns RetDone if item is not Null, RetFail if item is Null  
          Remark : it is nullified for each Perform") RecordItem;
		IFSelect_ReturnStatus RecordItem (const Handle_Standard_Transient & item);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Standard_Transient

Returns the Transient Object which was recorded with the  
          current Line Command. If none was, returns a Null Handle") RecordedItem;
		Handle_Standard_Transient RecordedItem ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Clears the recorded informations (commands, objects)") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	file(char *)=

Returns:
	IFSelect_ReturnStatus

Reads commands from a Script File, named <file>. By default  
          (file = ''), reads from standard input with a prompt  
          Else (reading from a file), the read commands are displayed  
          onto standard output. Allows nested reads. Reading is stopped  
          either by command x or exit, or by reaching end of file  
          Return Value follows the rules of Do : RetEnd for normal end,  
          RetFail if script could not be opened") ReadScript;
		IFSelect_ReturnStatus ReadScript (const char * file = "");
		%feature("autodoc", "Args:
	None
Returns:
	IFSelect_ReturnStatus

Executes the Command, itself (for built-in commands, which  
          have priority) or by using the list of Activators.  
          The value returned is : RetVoid if nothing done (void command)  
          RetDone if execution OK, RetEnd if END OF SESSION, RetError if  
          command unknown or incorrect, RetFail if error on execution  
          If execution is OK and RecordMode is set, this Command Line is  
          recorded to the list (see below).") Perform;
		IFSelect_ReturnStatus Perform ();
		%feature("autodoc", "Args:
	aliasname(TCollection_AsciiString)

Returns:
	IFSelect_ReturnStatus

Executes the Commands, except that the command name (word 0)  
          is aliased. The rest of the command line is unchanged  
          If <alias> is empty, Executes with no change  
 
          Error status is returned if the alias is unknown as command") ExecuteAlias;
		IFSelect_ReturnStatus ExecuteAlias (const TCollection_AsciiString & aliasname);
		%feature("autodoc", "Args:
	command(TCollection_AsciiString)

Returns:
	IFSelect_ReturnStatus

Sets the Command then tries to execute it. Return value :  
          same as for Perform") Execute;
		IFSelect_ReturnStatus Execute (const TCollection_AsciiString & command);
		%feature("autodoc", "Args:
	counter(Handle_IFSelect_SignCounter)
	numword(Standard_Integer)
	mode(IFSelect_PrintCount)=IFSelect_CountByItem

Returns:
	IFSelect_ReturnStatus

Executes a Counter in a general way  
          If <numword> is greater than count of command words, it counts  
          all the model. Else it considers the word <numword> as the  
          identifier of a Selection  
          <mode> gives the mode of printing results, default is  
          CountByItem") ExecuteCounter;
		IFSelect_ReturnStatus ExecuteCounter (const Handle_IFSelect_SignCounter & counter,const Standard_Integer numword,const IFSelect_PrintCount mode = IFSelect_CountByItem);
		%feature("autodoc", "Args:
	val(char *)

Returns:
	Standard_Integer

Interprets a string value as an entity number :  
          if it gives an integer, returns its value  
          else, considers it as ENtityLabel (preferably case sensitive)  
          in case of failure, returns 0") Number;
		Standard_Integer Number (const char * val);
		%feature("autodoc", "Args:
	number(Standard_Integer)
	session(Handle_IFSelect_SessionPilot)

Returns:
	IFSelect_ReturnStatus

Processes specific commands, which are :  
          x or exit for end of session  
          ? or help for help messages  
          xcommand to control command lines (Record Mode, List, Clear,  
            File Output ...)  
          xsource to execute a command file (no nesting allowed),  
            in case of error, source is stopped and keyword recovers  
          xstep is a simple prefix (useful in a wider environment, to  
            avoid conflicts on command names)  
          xset control commands which create items with names") Do;
		IFSelect_ReturnStatus Do (const Standard_Integer number,const Handle_IFSelect_SessionPilot & session);
		%feature("autodoc", "Args:
	number(Standard_Integer)

Returns:
	char *

Help for specific commands (apart from general command help)") Help;
		char * Help (const Standard_Integer number);
};


%feature("shadow") IFSelect_SessionPilot::~IFSelect_SessionPilot %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IFSelect_SessionPilot {
	void _kill_pointed() {
		delete $self;
	}
};
%extend IFSelect_SessionPilot {
	Handle_IFSelect_SessionPilot GetHandle() {
	return *(Handle_IFSelect_SessionPilot*) &$self;
	}
};

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
    IFSelect_SessionPilot* GetObject() {
    return (IFSelect_SessionPilot*)$self->Access();
    }
};
%feature("shadow") Handle_IFSelect_SessionPilot::~Handle_IFSelect_SessionPilot %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_IFSelect_SessionPilot {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor IFSelect_SignCategory;
class IFSelect_SignCategory : public IFSelect_Signature {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Returns a SignCategory") IFSelect_SignCategory;
		 IFSelect_SignCategory ();
		%feature("autodoc", "Args:
	ent(Handle_Standard_Transient)
	model(Handle_Interface_InterfaceModel)

Returns:
	char *

Returns the Signature for a Transient object, as its Category  
          recorded in the model") Value;
		char * Value (const Handle_Standard_Transient & ent,const Handle_Interface_InterfaceModel & model);
};


%feature("shadow") IFSelect_SignCategory::~IFSelect_SignCategory %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IFSelect_SignCategory {
	void _kill_pointed() {
		delete $self;
	}
};
%extend IFSelect_SignCategory {
	Handle_IFSelect_SignCategory GetHandle() {
	return *(Handle_IFSelect_SignCategory*) &$self;
	}
};

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
    IFSelect_SignCategory* GetObject() {
    return (IFSelect_SignCategory*)$self->Access();
    }
};
%feature("shadow") Handle_IFSelect_SignCategory::~Handle_IFSelect_SignCategory %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_IFSelect_SignCategory {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor IFSelect_SignCounter;
class IFSelect_SignCounter : public IFSelect_SignatureList {
	public:
		%feature("autodoc", "Args:
	withmap(Standard_Boolean)=Standard_True
	withlist(Standard_Boolean)=Standard_False

Returns:
	None

Creates a SignCounter, without proper Signature  
          If <withmap> is True (default), added entities are counted  
          only if they are not yet recorded in the map  
          Map control can be set off if the input garantees uniqueness  
          of data  
          <withlist> is transmitted to SignatureList (option to list  
          entities, not only to count them).") IFSelect_SignCounter;
		 IFSelect_SignCounter (const Standard_Boolean withmap = Standard_True,const Standard_Boolean withlist = Standard_False);
		%feature("autodoc", "Args:
	matcher(Handle_IFSelect_Signature)
	withmap(Standard_Boolean)=Standard_True
	withlist(Standard_Boolean)=Standard_False

Returns:
	None

Creates a SignCounter, with a predefined Signature  
          Other arguments as for Create without Signature.") IFSelect_SignCounter;
		 IFSelect_SignCounter (const Handle_IFSelect_Signature & matcher,const Standard_Boolean withmap = Standard_True,const Standard_Boolean withlist = Standard_False);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_IFSelect_Signature

Returns the Signature used to count entities. It can be null.") Signature;
		Handle_IFSelect_Signature Signature ();
		%feature("autodoc", "Args:
	withmap(Standard_Boolean)

Returns:
	None

Changes the control status. The map is not cleared, simply  
          its use changes") SetMap;
		void SetMap (const Standard_Boolean withmap);
		%feature("autodoc", "Args:
	ent(Handle_Standard_Transient)
	model(Handle_Interface_InterfaceModel)

Returns:
	virtual Standard_Boolean

Adds an entity by considering its signature, which is given by  
          call to method AddSign  
          Returns True if added, False if already in the map (and  
          map control status set)") AddEntity;
		virtual Standard_Boolean AddEntity (const Handle_Standard_Transient & ent,const Handle_Interface_InterfaceModel & model);
		%feature("autodoc", "Args:
	ent(Handle_Standard_Transient)
	model(Handle_Interface_InterfaceModel)

Returns:
	virtual void

Adds an entity (already filtered by Map) with its signature.  
          This signature can be computed with the containing model.  
          Its value is provided by the object Signature given at start,  
          if no Signature is defined, it does nothing.  
 
          Can be redefined (in this case, see also Sign)") AddSign;
		virtual void AddSign (const Handle_Standard_Transient & ent,const Handle_Interface_InterfaceModel & model);
		%feature("autodoc", "Args:
	list(Handle_TColStd_HSequenceOfTransient)
	model(Handle_Interface_InterfaceModel)

Returns:
	None

Adds a list of entities by adding each of the items") AddList;
		void AddList (const Handle_TColStd_HSequenceOfTransient & list,const Handle_Interface_InterfaceModel & model);
		%feature("autodoc", "Args:
	list(Handle_TColStd_HSequenceOfTransient)
	graph(Interface_Graph)

Returns:
	virtual void

Adds a list of entities in the context given by the graph  
          Default just call basic AddList  
          Can be redefined to get a signature computed with the graph") AddWithGraph;
		virtual void AddWithGraph (const Handle_TColStd_HSequenceOfTransient & list,const Interface_Graph & graph);
		%feature("autodoc", "Args:
	model(Handle_Interface_InterfaceModel)

Returns:
	None

Adds all the entities contained in a Model") AddModel;
		void AddModel (const Handle_Interface_InterfaceModel & model);
		%feature("autodoc", "Args:
	sel(Handle_IFSelect_Selection)
	G(Interface_Graph)

Returns:
	None

Adds the result determined by a Selection from a Graph  
          Remark : does not impact at all data from SetSelection & Co") AddFromSelection;
		void AddFromSelection (const Handle_IFSelect_Selection & sel,const Interface_Graph & G);
		%feature("autodoc", "Args:
	sel(Handle_IFSelect_Selection)

Returns:
	None

Sets a Selection as input : this causes content to be cleared  
          then the Selection to be ready to compute (but not immediatly)") SetSelection;
		void SetSelection (const Handle_IFSelect_Selection & sel);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_IFSelect_Selection

Returns the selection, or a null Handle") Selection;
		Handle_IFSelect_Selection Selection ();
		%feature("autodoc", "Args:
	selmode(Standard_Integer)

Returns:
	None

Changes the mode of working with the selection :  
          -1 just clears optimisation data and nothing else  
          0 clears it   1 inhibits it for computing (but no clearing)  
          2 sets it active for computing  
          Default at creation is 0, after SetSelection (not null) is 2") SetSelMode;
		void SetSelMode (const Standard_Integer selmode);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the mode of working with the selection") SelMode;
		Standard_Integer SelMode ();
		%feature("autodoc", "Args:
	G(Interface_Graph)
	forced(Standard_Boolean)=Standard_False

Returns:
	Standard_Boolean

Computes from the selection result, if selection is active  
          (mode 2). If selection is not defined (mode 0) or is inhibited  
          (mode 1) does nothing.  
          Returns True if computation is done (or optimised), False else  
          This method is called by ComputeCounter from WorkSession  
 
          If <forced> is True, recomputes systematically  
          Else (D), if the counter was not cleared and if the former  
          computed result started from the same total size of Graph and  
          same count of selected entities : computation is not redone  
          unless <forced> is given as True") ComputeSelected;
		Standard_Boolean ComputeSelected (const Interface_Graph & G,const Standard_Boolean forced = Standard_False);
		%feature("autodoc", "Args:
	ent(Handle_Standard_Transient)
	model(Handle_Interface_InterfaceModel)

Returns:
	virtual Handle_TCollection_HAsciiString

Determines and returns the value of the signature for an  
          entity as an HAsciiString. This method works exactly as  
          AddSign, which is optimized  
 
          Can be redefined, accorded with AddSign") Sign;
		virtual Handle_TCollection_HAsciiString Sign (const Handle_Standard_Transient & ent,const Handle_Interface_InterfaceModel & model);
		%feature("autodoc", "Args:
	ent(Handle_Standard_Transient)
	G(Interface_Graph)

Returns:
	char *

Applies AddWithGraph on one entity, and returns the Signature  
          Value which has been recorded  
          To do this, Add is called with SignOnly Mode True during the  
          call, the returned value is LastValue") ComputedSign;
		char * ComputedSign (const Handle_Standard_Transient & ent,const Interface_Graph & G);
};


%feature("shadow") IFSelect_SignCounter::~IFSelect_SignCounter %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IFSelect_SignCounter {
	void _kill_pointed() {
		delete $self;
	}
};
%extend IFSelect_SignCounter {
	Handle_IFSelect_SignCounter GetHandle() {
	return *(Handle_IFSelect_SignCounter*) &$self;
	}
};

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
    IFSelect_SignCounter* GetObject() {
    return (IFSelect_SignCounter*)$self->Access();
    }
};
%feature("shadow") Handle_IFSelect_SignCounter::~Handle_IFSelect_SignCounter %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_IFSelect_SignCounter {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor IFSelect_SignMultiple;
class IFSelect_SignMultiple : public IFSelect_Signature {
	public:
		%feature("autodoc", "Args:
	name(char *)

Returns:
	None

Creates an empty SignMultiple with a Name  
          This name should take expected tabulations into account") IFSelect_SignMultiple;
		 IFSelect_SignMultiple (const char * name);
		%feature("autodoc", "Args:
	subsign(Handle_IFSelect_Signature)
	width(Standard_Integer)=0
	maxi(Standard_Boolean)=Standard_False

Returns:
	None

Adds a Signature. Width, if given, gives the tabulation  
          If <maxi> is True, it is a forced tabulation (overlength is  
          replaced by a final dot)  
          If <maxi> is False, just 3 blanks follow an overlength") Add;
		void Add (const Handle_IFSelect_Signature & subsign,const Standard_Integer width = 0,const Standard_Boolean maxi = Standard_False);
		%feature("autodoc", "Args:
	ent(Handle_Standard_Transient)
	model(Handle_Interface_InterfaceModel)

Returns:
	char *

Concatenates the values of sub-signatures, with their  
          tabulations") Value;
		char * Value (const Handle_Standard_Transient & ent,const Handle_Interface_InterfaceModel & model);
		%feature("autodoc", "Args:
	ent(Handle_Standard_Transient)
	model(Handle_Interface_InterfaceModel)
	text(TCollection_AsciiString)
	exact(Standard_Boolean)

Returns:
	virtual Standard_Boolean

Specialized Match Rule  
          If <exact> is False, simply checks if at least one sub-item  
          matches  
          If <exact> is True, standard match with Value  
          (i.e. tabulations must be respected)") Matches;
		virtual Standard_Boolean Matches (const Handle_Standard_Transient & ent,const Handle_Interface_InterfaceModel & model,const TCollection_AsciiString & text,const Standard_Boolean exact);
};


%feature("shadow") IFSelect_SignMultiple::~IFSelect_SignMultiple %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IFSelect_SignMultiple {
	void _kill_pointed() {
		delete $self;
	}
};
%extend IFSelect_SignMultiple {
	Handle_IFSelect_SignMultiple GetHandle() {
	return *(Handle_IFSelect_SignMultiple*) &$self;
	}
};

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
    IFSelect_SignMultiple* GetObject() {
    return (IFSelect_SignMultiple*)$self->Access();
    }
};
%feature("shadow") Handle_IFSelect_SignMultiple::~Handle_IFSelect_SignMultiple %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_IFSelect_SignMultiple {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor IFSelect_SignType;
class IFSelect_SignType : public IFSelect_Signature {
	public:
		%feature("autodoc", "Args:
	nopk(Standard_Boolean)=Standard_False

Returns:
	None

Returns a SignType  
          <nopk> false (D) : complete dynamic type (name = Dynamic Type)  
          <nopk> true : class type without pk (name = Class Type)") IFSelect_SignType;
		 IFSelect_SignType (const Standard_Boolean nopk = Standard_False);
		%feature("autodoc", "Args:
	ent(Handle_Standard_Transient)
	model(Handle_Interface_InterfaceModel)

Returns:
	char *

Returns the Signature for a Transient object, as its Dynamic  
          Type, with or without package name, according starting option") Value;
		char * Value (const Handle_Standard_Transient & ent,const Handle_Interface_InterfaceModel & model);
};


%feature("shadow") IFSelect_SignType::~IFSelect_SignType %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IFSelect_SignType {
	void _kill_pointed() {
		delete $self;
	}
};
%extend IFSelect_SignType {
	Handle_IFSelect_SignType GetHandle() {
	return *(Handle_IFSelect_SignType*) &$self;
	}
};

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
    IFSelect_SignType* GetObject() {
    return (IFSelect_SignType*)$self->Access();
    }
};
%feature("shadow") Handle_IFSelect_SignType::~Handle_IFSelect_SignType %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_IFSelect_SignType {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor IFSelect_SignValidity;
class IFSelect_SignValidity : public IFSelect_Signature {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Returns a SignValidity") IFSelect_SignValidity;
		 IFSelect_SignValidity ();
		%feature("autodoc", "Args:
	ent(Handle_Standard_Transient)
	model(Handle_Interface_InterfaceModel)

Returns:
	static char *

Returns the Signature for a Transient object, as a validity  
          deducted from data (reports) stored in the model.  
          Class method, can be called by any one") CVal;
		static char * CVal (const Handle_Standard_Transient & ent,const Handle_Interface_InterfaceModel & model);
		%feature("autodoc", "Args:
	ent(Handle_Standard_Transient)
	model(Handle_Interface_InterfaceModel)

Returns:
	char *

Returns the Signature for a Transient object, as a validity  
          deducted from data (reports) stored in the model  
          Calls the class method CVal") Value;
		char * Value (const Handle_Standard_Transient & ent,const Handle_Interface_InterfaceModel & model);
};


%feature("shadow") IFSelect_SignValidity::~IFSelect_SignValidity %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IFSelect_SignValidity {
	void _kill_pointed() {
		delete $self;
	}
};
%extend IFSelect_SignValidity {
	Handle_IFSelect_SignValidity GetHandle() {
	return *(Handle_IFSelect_SignValidity*) &$self;
	}
};

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
    IFSelect_SignValidity* GetObject() {
    return (IFSelect_SignValidity*)$self->Access();
    }
};
%feature("shadow") Handle_IFSelect_SignValidity::~Handle_IFSelect_SignValidity %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_IFSelect_SignValidity {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor IFSelect_TransformStandard;
class IFSelect_TransformStandard : public IFSelect_Transformer {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates a TransformStandard, option StandardCopy, no Modifier") IFSelect_TransformStandard;
		 IFSelect_TransformStandard ();
		%feature("autodoc", "Args:
	option(Standard_Boolean)

Returns:
	None

Sets the Copy option to a new value :  
          - True for StandardCopy  - False for OnTheSpot") SetCopyOption;
		void SetCopyOption (const Standard_Boolean option);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns the Copy option") CopyOption;
		Standard_Boolean CopyOption ();
		%feature("autodoc", "Args:
	sel(Handle_IFSelect_Selection)

Returns:
	None

Sets a Selection (or unsets if Null)  
          This Selection then defines the list of entities on which the  
          Modifiers will be applied  
          If it is set, it has priority on Selections of Modifiers  
          Else, for each Modifier its Selection is evaluated  
          By default, all the Model is taken") SetSelection;
		void SetSelection (const Handle_IFSelect_Selection & sel);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_IFSelect_Selection

Returns the Selection, Null by default") Selection;
		Handle_IFSelect_Selection Selection ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the count of recorded Modifiers") NbModifiers;
		Standard_Integer NbModifiers ();
		%feature("autodoc", "Args:
	num(Standard_Integer)

Returns:
	Handle_IFSelect_Modifier

Returns a Modifier given its rank in the list") Modifier;
		Handle_IFSelect_Modifier Modifier (const Standard_Integer num);
		%feature("autodoc", "Args:
	modif(Handle_IFSelect_Modifier)

Returns:
	Standard_Integer

Returns the rank of a Modifier in the list, 0 if unknown") ModifierRank;
		Standard_Integer ModifierRank (const Handle_IFSelect_Modifier & modif);
		%feature("autodoc", "Args:
	modif(Handle_IFSelect_Modifier)
	atnum(Standard_Integer)=0

Returns:
	Standard_Boolean

Adds a Modifier to the list :  
          - <atnum> = 0 (default) : at the end of the list  
          - <atnum> > 0 : at rank <atnum>  
          Returns True if done, False if <atnum> is out of range") AddModifier;
		Standard_Boolean AddModifier (const Handle_IFSelect_Modifier & modif,const Standard_Integer atnum = 0);
		%feature("autodoc", "Args:
	modif(Handle_IFSelect_Modifier)

Returns:
	Standard_Boolean

Removes a Modifier from the list  
          Returns True if done, False if <modif> not in the list") RemoveModifier;
		Standard_Boolean RemoveModifier (const Handle_IFSelect_Modifier & modif);
		%feature("autodoc", "Args:
	num(Standard_Integer)

Returns:
	Standard_Boolean

Removes a Modifier from the list, given its rank  
          Returns True if done, False if <num> is out of range") RemoveModifier;
		Standard_Boolean RemoveModifier (const Standard_Integer num);
		%feature("autodoc", "Args:
	G(Interface_Graph)
	protocol(Handle_Interface_Protocol)
	checks(Interface_CheckIterator)
	newmod(Handle_Interface_InterfaceModel)

Returns:
	Standard_Boolean

Performs the Standard Transformation, by calling Copy then  
          ApplyModifiers (which can return an error status)") Perform;
		Standard_Boolean Perform (const Interface_Graph & G,const Handle_Interface_Protocol & protocol,Interface_CheckIterator & checks,Handle_Interface_InterfaceModel & newmod);
		%feature("autodoc", "Args:
	G(Interface_Graph)
	TC(Interface_CopyTool)
	newmod(Handle_Interface_InterfaceModel)

Returns:
	None

This the first operation. It calls StandardCopy or OnTheSpot  
          according the option") Copy;
		void Copy (const Interface_Graph & G,Interface_CopyTool & TC,Handle_Interface_InterfaceModel & newmod);
		%feature("autodoc", "Args:
	G(Interface_Graph)
	TC(Interface_CopyTool)
	newmod(Handle_Interface_InterfaceModel)

Returns:
	None

This is the standard action of Copy : its takes into account  
          only the remaining entities (noted by Graph Status positive)  
          and their proper dependances of course. Produces a new model.") StandardCopy;
		void StandardCopy (const Interface_Graph & G,Interface_CopyTool & TC,Handle_Interface_InterfaceModel & newmod);
		%feature("autodoc", "Args:
	G(Interface_Graph)
	TC(Interface_CopyTool)
	newmod(Handle_Interface_InterfaceModel)

Returns:
	None

This is the OnTheSpot action : each entity is bound with ...  
          itself. The produced model is the same as the starting one.") OnTheSpot;
		void OnTheSpot (const Interface_Graph & G,Interface_CopyTool & TC,Handle_Interface_InterfaceModel & newmod);
		%feature("autodoc", "Args:
	G(Interface_Graph)
	protocol(Handle_Interface_Protocol)
	TC(Interface_CopyTool)
	checks(Interface_CheckIterator)
	newmod(Handle_Interface_InterfaceModel)

Returns:
	Standard_Boolean

Applies the modifiers sequencially.  
          For each one, prepares required data (if a Selection is  
          associated as a filter).  
          For the option OnTheSpot, it determines if the graph may be  
          changed and updates <newmod> if required  
          If a Modifier causes an error (check 'HasFailed'),  
          ApplyModifier stops : the following Modifiers are ignored") ApplyModifiers;
		Standard_Boolean ApplyModifiers (const Interface_Graph & G,const Handle_Interface_Protocol & protocol,Interface_CopyTool & TC,Interface_CheckIterator & checks,Handle_Interface_InterfaceModel & newmod);
		%feature("autodoc", "Args:
	entfrom(Handle_Standard_Transient)
	entto(Handle_Standard_Transient)

Returns:
	Standard_Boolean

This methods allows to know what happened to a starting  
          entity after the last Perform. It reads result from the map  
          which was filled by Perform.") Updated;
		Standard_Boolean Updated (const Handle_Standard_Transient & entfrom,Handle_Standard_Transient & entto);
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

Returns a text which defines the way a Transformer works :  
          'On the spot edition' or 'Standard Copy' followed by  
          '<nn> Modifiers'") Label;
		TCollection_AsciiString Label ();
};


%feature("shadow") IFSelect_TransformStandard::~IFSelect_TransformStandard %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IFSelect_TransformStandard {
	void _kill_pointed() {
		delete $self;
	}
};
%extend IFSelect_TransformStandard {
	Handle_IFSelect_TransformStandard GetHandle() {
	return *(Handle_IFSelect_TransformStandard*) &$self;
	}
};

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
    IFSelect_TransformStandard* GetObject() {
    return (IFSelect_TransformStandard*)$self->Access();
    }
};
%feature("shadow") Handle_IFSelect_TransformStandard::~Handle_IFSelect_TransformStandard %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_IFSelect_TransformStandard {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor IFSelect_GraphCounter;
class IFSelect_GraphCounter : public IFSelect_SignCounter {
	public:
		%feature("autodoc", "Args:
	withmap(Standard_Boolean)=Standard_True
	withlist(Standard_Boolean)=Standard_False

Returns:
	None

Creates a GraphCounter, without applied selection") IFSelect_GraphCounter;
		 IFSelect_GraphCounter (const Standard_Boolean withmap = Standard_True,const Standard_Boolean withlist = Standard_False);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_IFSelect_SelectDeduct

Returns the applied selection") Applied;
		Handle_IFSelect_SelectDeduct Applied ();
		%feature("autodoc", "Args:
	sel(Handle_IFSelect_SelectDeduct)

Returns:
	None

Sets a new applied selection") SetApplied;
		void SetApplied (const Handle_IFSelect_SelectDeduct & sel);
		%feature("autodoc", "Args:
	list(Handle_TColStd_HSequenceOfTransient)
	graph(Interface_Graph)

Returns:
	virtual void

Adds a list of entities in the context given by the graph  
          Default takes the count of entities selected by the applied  
          selection, when it is given each entity of the list  
          Can be redefined") AddWithGraph;
		virtual void AddWithGraph (const Handle_TColStd_HSequenceOfTransient & list,const Interface_Graph & graph);
};


%feature("shadow") IFSelect_GraphCounter::~IFSelect_GraphCounter %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IFSelect_GraphCounter {
	void _kill_pointed() {
		delete $self;
	}
};
%extend IFSelect_GraphCounter {
	Handle_IFSelect_GraphCounter GetHandle() {
	return *(Handle_IFSelect_GraphCounter*) &$self;
	}
};

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
    IFSelect_GraphCounter* GetObject() {
    return (IFSelect_GraphCounter*)$self->Access();
    }
};
%feature("shadow") Handle_IFSelect_GraphCounter::~Handle_IFSelect_GraphCounter %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_IFSelect_GraphCounter {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor IFSelect_ModifEditForm;
class IFSelect_ModifEditForm : public IFSelect_Modifier {
	public:
		%feature("autodoc", "Args:
	editform(Handle_IFSelect_EditForm)

Returns:
	None

Creates a ModifEditForm. It may not change the graph") IFSelect_ModifEditForm;
		 IFSelect_ModifEditForm (const Handle_IFSelect_EditForm & editform);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_IFSelect_EditForm

Returns the EditForm") EditForm;
		Handle_IFSelect_EditForm EditForm ();
		%feature("autodoc", "Args:
	ctx(IFSelect_ContextModif)
	target(Handle_Interface_InterfaceModel)
	protocol(Handle_Interface_Protocol)
	TC(Interface_CopyTool)

Returns:
	None

Acts by applying an EditForm to entities, selected or all model") Perform;
		void Perform (IFSelect_ContextModif & ctx,const Handle_Interface_InterfaceModel & target,const Handle_Interface_Protocol & protocol,Interface_CopyTool & TC);
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

Returns Label as 'Apply EditForm <+ label of EditForm>'") Label;
		TCollection_AsciiString Label ();
};


%feature("shadow") IFSelect_ModifEditForm::~IFSelect_ModifEditForm %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IFSelect_ModifEditForm {
	void _kill_pointed() {
		delete $self;
	}
};
%extend IFSelect_ModifEditForm {
	Handle_IFSelect_ModifEditForm GetHandle() {
	return *(Handle_IFSelect_ModifEditForm*) &$self;
	}
};

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
    IFSelect_ModifEditForm* GetObject() {
    return (IFSelect_ModifEditForm*)$self->Access();
    }
};
%feature("shadow") Handle_IFSelect_ModifEditForm::~Handle_IFSelect_ModifEditForm %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_IFSelect_ModifEditForm {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor IFSelect_ModifReorder;
class IFSelect_ModifReorder : public IFSelect_Modifier {
	public:
		%feature("autodoc", "Args:
	rootlast(Standard_Boolean)=Standard_True

Returns:
	None

Creates a ModifReorder. It may change the graph (it does !)  
          If <rootlast> is True (D), roots are set at the end of packets  
          Else, they are set at beginning (as done by AddWithRefs)") IFSelect_ModifReorder;
		 IFSelect_ModifReorder (const Standard_Boolean rootlast = Standard_True);
		%feature("autodoc", "Args:
	ctx(IFSelect_ContextModif)
	target(Handle_Interface_InterfaceModel)
	protocol(Handle_Interface_Protocol)
	TC(Interface_CopyTool)

Returns:
	None

Acts by computing orders (by method All from ShareTool) then  
          forcing them in the model. Remark that selection is ignored :  
          ALL the model is processed in once") Perform;
		void Perform (IFSelect_ContextModif & ctx,const Handle_Interface_InterfaceModel & target,const Handle_Interface_Protocol & protocol,Interface_CopyTool & TC);
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

Returns Label as 'Reorder, Roots (last or first)'") Label;
		TCollection_AsciiString Label ();
};


%feature("shadow") IFSelect_ModifReorder::~IFSelect_ModifReorder %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IFSelect_ModifReorder {
	void _kill_pointed() {
		delete $self;
	}
};
%extend IFSelect_ModifReorder {
	Handle_IFSelect_ModifReorder GetHandle() {
	return *(Handle_IFSelect_ModifReorder*) &$self;
	}
};

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
    IFSelect_ModifReorder* GetObject() {
    return (IFSelect_ModifReorder*)$self->Access();
    }
};
%feature("shadow") Handle_IFSelect_ModifReorder::~Handle_IFSelect_ModifReorder %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_IFSelect_ModifReorder {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor IFSelect_SelectAnyList;
class IFSelect_SelectAnyList : public IFSelect_SelectDeduct {
	public:
		%feature("autodoc", "Args:
	iter(Interface_EntityIterator)

Returns:
	virtual void

Keeps Input Entity, as having required type. It works by  
          keeping in <iter>, only suitable Entities (SelectType can be  
          used). Called by RootResult (which waits for ONE ENTITY MAX)") KeepInputEntity;
		virtual void KeepInputEntity (Interface_EntityIterator & iter);
		%feature("autodoc", "Args:
	ent(Handle_Standard_Transient)

Returns:
	virtual Standard_Integer

Returns count of Items in the list in the Entity <ent>  
          If <ent> has not required type, returned value must be Zero") NbItems;
		virtual Standard_Integer NbItems (const Handle_Standard_Transient & ent);
		%feature("autodoc", "Args:
	rankfrom(Handle_IFSelect_IntParam)
	rankto(Handle_IFSelect_IntParam)

Returns:
	None

Sets a Range for numbers, with a lower and a upper limits") SetRange;
		void SetRange (const Handle_IFSelect_IntParam & rankfrom,const Handle_IFSelect_IntParam & rankto);
		%feature("autodoc", "Args:
	rank(Handle_IFSelect_IntParam)

Returns:
	None

Sets a unique number (only one Entity will be sorted as True)") SetOne;
		void SetOne (const Handle_IFSelect_IntParam & rank);
		%feature("autodoc", "Args:
	rankfrom(Handle_IFSelect_IntParam)

Returns:
	None

Sets a Lower limit but no upper limit") SetFrom;
		void SetFrom (const Handle_IFSelect_IntParam & rankfrom);
		%feature("autodoc", "Args:
	rankto(Handle_IFSelect_IntParam)

Returns:
	None

Sets an Upper limit but no lower limit (equivalent to lower 1)") SetUntil;
		void SetUntil (const Handle_IFSelect_IntParam & rankto);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True if a Lower limit is defined") HasLower;
		Standard_Boolean HasLower ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_IFSelect_IntParam

Returns Lower limit (if there is; else, value is senseless)") Lower;
		Handle_IFSelect_IntParam Lower ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns Integer Value of Lower Limit (0 if none)") LowerValue;
		Standard_Integer LowerValue ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True if a Lower limit is defined") HasUpper;
		Standard_Boolean HasUpper ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_IFSelect_IntParam

Returns Upper limit (if there is; else, value is senseless)") Upper;
		Handle_IFSelect_IntParam Upper ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns Integer Value of Upper Limit (0 if none)") UpperValue;
		Standard_Integer UpperValue ();
		%feature("autodoc", "Args:
	G(Interface_Graph)

Returns:
	Interface_EntityIterator

Returns the list of selected entities (list of entities  
          complying with rank criterium)  
          Error if the input list has more than one Item") RootResult;
		Interface_EntityIterator RootResult (const Interface_Graph & G);
		%feature("autodoc", "Args:
	n1(Standard_Integer)
	n2(Standard_Integer)
	ent(Handle_Standard_Transient)
	res(Interface_EntityIterator)

Returns:
	virtual void

Puts into <res>, the sub-entities of the list, from n1 to  
          n2 included. Remark that adequation with Entity's type and  
          length of list has already been made at this stage  
          Called by RootResult") FillResult;
		virtual void FillResult (const Standard_Integer n1,const Standard_Integer n2,const Handle_Standard_Transient & ent,Interface_EntityIterator & res);
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

Returns a text defining the criterium : 'Componants of List '  
          then Specific List Label, then, following cases :  
          ' From .. Until ..' or 'From ..' or 'Until ..' or 'Rank no ..'  
          Specific type is given by deferred method ListLabel") Label;
		TCollection_AsciiString Label ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual TCollection_AsciiString

Returns the specific label for the list, which is included as  
          a part of Label") ListLabel;
		virtual TCollection_AsciiString ListLabel ();
};


%feature("shadow") IFSelect_SelectAnyList::~IFSelect_SelectAnyList %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IFSelect_SelectAnyList {
	void _kill_pointed() {
		delete $self;
	}
};
%extend IFSelect_SelectAnyList {
	Handle_IFSelect_SelectAnyList GetHandle() {
	return *(Handle_IFSelect_SelectAnyList*) &$self;
	}
};

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
    IFSelect_SelectAnyList* GetObject() {
    return (IFSelect_SelectAnyList*)$self->Access();
    }
};
%feature("shadow") Handle_IFSelect_SelectAnyList::~Handle_IFSelect_SelectAnyList %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_IFSelect_SelectAnyList {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor IFSelect_SelectDiff;
class IFSelect_SelectDiff : public IFSelect_SelectControl {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates an empty SelectDiff") IFSelect_SelectDiff;
		 IFSelect_SelectDiff ();
		%feature("autodoc", "Args:
	G(Interface_Graph)

Returns:
	Interface_EntityIterator

Returns the list of selected entities : they are the Entities  
          gotten from the Main Input but not from the Diff Input") RootResult;
		Interface_EntityIterator RootResult (const Interface_Graph & G);
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

Returns a text defining the criterium : 'Difference'") Label;
		TCollection_AsciiString Label ();
};


%feature("shadow") IFSelect_SelectDiff::~IFSelect_SelectDiff %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IFSelect_SelectDiff {
	void _kill_pointed() {
		delete $self;
	}
};
%extend IFSelect_SelectDiff {
	Handle_IFSelect_SelectDiff GetHandle() {
	return *(Handle_IFSelect_SelectDiff*) &$self;
	}
};

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
    IFSelect_SelectDiff* GetObject() {
    return (IFSelect_SelectDiff*)$self->Access();
    }
};
%feature("shadow") Handle_IFSelect_SelectDiff::~Handle_IFSelect_SelectDiff %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_IFSelect_SelectDiff {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor IFSelect_SelectEntityNumber;
class IFSelect_SelectEntityNumber : public IFSelect_SelectBase {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates a SelectEntityNumber, initially with no specified Number") IFSelect_SelectEntityNumber;
		 IFSelect_SelectEntityNumber ();
		%feature("autodoc", "Args:
	num(Handle_IFSelect_IntParam)

Returns:
	None

Sets Entity Number to be taken (initially, none is set : 0)") SetNumber;
		void SetNumber (const Handle_IFSelect_IntParam & num);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_IFSelect_IntParam

Returns specified Number (as a Parameter)") Number;
		Handle_IFSelect_IntParam Number ();
		%feature("autodoc", "Args:
	G(Interface_Graph)

Returns:
	Interface_EntityIterator

Returns the list of selected entities : the Entity having the  
          specified Number (this result assures naturally uniqueness)") RootResult;
		Interface_EntityIterator RootResult (const Interface_Graph & G);
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

Returns a text defining the criterium : 'Entity Number ...'") Label;
		TCollection_AsciiString Label ();
};


%feature("shadow") IFSelect_SelectEntityNumber::~IFSelect_SelectEntityNumber %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IFSelect_SelectEntityNumber {
	void _kill_pointed() {
		delete $self;
	}
};
%extend IFSelect_SelectEntityNumber {
	Handle_IFSelect_SelectEntityNumber GetHandle() {
	return *(Handle_IFSelect_SelectEntityNumber*) &$self;
	}
};

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
    IFSelect_SelectEntityNumber* GetObject() {
    return (IFSelect_SelectEntityNumber*)$self->Access();
    }
};
%feature("shadow") Handle_IFSelect_SelectEntityNumber::~Handle_IFSelect_SelectEntityNumber %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_IFSelect_SelectEntityNumber {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor IFSelect_SelectExplore;
class IFSelect_SelectExplore : public IFSelect_SelectDeduct {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the required exploring level") Level;
		Standard_Integer Level ();
		%feature("autodoc", "Args:
	G(Interface_Graph)

Returns:
	Interface_EntityIterator

Returns the list of selected entities. Works by calling the  
          method Explore on each input entity : it can be rejected,  
          taken for output, or to explore. If the maximum level has not  
          yet been attained, or if no max level is specified, entities  
          to be explored are themselves used as if they were input") RootResult;
		Interface_EntityIterator RootResult (const Interface_Graph & G);
		%feature("autodoc", "Args:
	level(Standard_Integer)
	ent(Handle_Standard_Transient)
	G(Interface_Graph)
	explored(Interface_EntityIterator)

Returns:
	virtual Standard_Boolean

Analyses and, if required, Explores an entity, as follows :  
          The explored list starts as empty, it has to be filled by this  
          method.  
          If it returns False, <ent> is rejected for result (this is to  
              be used only as safety)  
          If it returns True and <explored> remains empty, <ent> is  
            taken itself for result, not explored  
          If it returns True and <explored> is not empty, the content  
            of this list is considered :  
            If maximum level is attained, it is taken for result  
            Else (or no max), each of its entity will be itself explored") Explore;
		virtual Standard_Boolean Explore (const Standard_Integer level,const Handle_Standard_Transient & ent,const Interface_Graph & G,Interface_EntityIterator & explored);
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

Returns a text saying '(Recursive)' or '(Level nn)' plus  
          specific criterium returned by ExploreLabel (see below)") Label;
		TCollection_AsciiString Label ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual TCollection_AsciiString

Returns a text defining the way of exploration") ExploreLabel;
		virtual TCollection_AsciiString ExploreLabel ();
};


%feature("shadow") IFSelect_SelectExplore::~IFSelect_SelectExplore %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IFSelect_SelectExplore {
	void _kill_pointed() {
		delete $self;
	}
};
%extend IFSelect_SelectExplore {
	Handle_IFSelect_SelectExplore GetHandle() {
	return *(Handle_IFSelect_SelectExplore*) &$self;
	}
};

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
    IFSelect_SelectExplore* GetObject() {
    return (IFSelect_SelectExplore*)$self->Access();
    }
};
%feature("shadow") Handle_IFSelect_SelectExplore::~Handle_IFSelect_SelectExplore %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_IFSelect_SelectExplore {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor IFSelect_SelectExtract;
class IFSelect_SelectExtract : public IFSelect_SelectDeduct {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True if Sort criterium is Direct, False if Reverse") IsDirect;
		Standard_Boolean IsDirect ();
		%feature("autodoc", "Args:
	direct(Standard_Boolean)

Returns:
	None

Sets Sort criterium sense to a new value  
          (True : Direct , False : Reverse)") SetDirect;
		void SetDirect (const Standard_Boolean direct);
		%feature("autodoc", "Args:
	G(Interface_Graph)

Returns:
	virtual Interface_EntityIterator

Returns the list of selected entities. Works by calling the  
          method Sort on each input Entity : the Entity is kept as  
          output if Sort returns the same value as Direct status") RootResult;
		virtual Interface_EntityIterator RootResult (const Interface_Graph & G);
		%feature("autodoc", "Args:
	rank(Standard_Integer)
	ent(Handle_Standard_Transient)
	model(Handle_Interface_InterfaceModel)

Returns:
	virtual Standard_Boolean

Returns True for an Entity if it satisfies the Sort criterium  
          It receives :  
          - <rank>, the rank of the Entity in the Iteration,  
          - <ent> , the Entity itself, and  
          - <model>, the Starting Model  
            Hence, the Entity to check is 'model->Value(num)' (but an  
            InterfaceModel allows other checks)  
          This method is specific to each class of SelectExtract") Sort;
		virtual Standard_Boolean Sort (const Standard_Integer rank,const Handle_Standard_Transient & ent,const Handle_Interface_InterfaceModel & model);
		%feature("autodoc", "Args:
	rank(Standard_Integer)
	ent(Handle_Standard_Transient)
	G(Interface_Graph)

Returns:
	virtual Standard_Boolean

Works as Sort but works on the Graph  
          Default directly calls Sort, but it can be redefined  
          If SortInGraph is redefined, Sort should be defined even if  
          not called (to avoid deferred methods in a final class)") SortInGraph;
		virtual Standard_Boolean SortInGraph (const Standard_Integer rank,const Handle_Standard_Transient & ent,const Interface_Graph & G);
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

Returns a text saying 'Picked' or 'Removed', plus the  
          specific criterium returned by ExtractLabel (see below)") Label;
		TCollection_AsciiString Label ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual TCollection_AsciiString

Returns a text defining the criterium for extraction") ExtractLabel;
		virtual TCollection_AsciiString ExtractLabel ();
};


%feature("shadow") IFSelect_SelectExtract::~IFSelect_SelectExtract %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IFSelect_SelectExtract {
	void _kill_pointed() {
		delete $self;
	}
};
%extend IFSelect_SelectExtract {
	Handle_IFSelect_SelectExtract GetHandle() {
	return *(Handle_IFSelect_SelectExtract*) &$self;
	}
};

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
    IFSelect_SelectExtract* GetObject() {
    return (IFSelect_SelectExtract*)$self->Access();
    }
};
%feature("shadow") Handle_IFSelect_SelectExtract::~Handle_IFSelect_SelectExtract %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_IFSelect_SelectExtract {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor IFSelect_SelectIntersection;
class IFSelect_SelectIntersection : public IFSelect_SelectCombine {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates an empty SelectIntersection") IFSelect_SelectIntersection;
		 IFSelect_SelectIntersection ();
		%feature("autodoc", "Args:
	G(Interface_Graph)

Returns:
	Interface_EntityIterator

Returns the list of selected Entities, which is the common part  
          of results from all input selections. Uniqueness is guaranteed.") RootResult;
		Interface_EntityIterator RootResult (const Interface_Graph & G);
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

Returns a text defining the criterium : 'Intersection (AND)'") Label;
		TCollection_AsciiString Label ();
};


%feature("shadow") IFSelect_SelectIntersection::~IFSelect_SelectIntersection %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IFSelect_SelectIntersection {
	void _kill_pointed() {
		delete $self;
	}
};
%extend IFSelect_SelectIntersection {
	Handle_IFSelect_SelectIntersection GetHandle() {
	return *(Handle_IFSelect_SelectIntersection*) &$self;
	}
};

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
    IFSelect_SelectIntersection* GetObject() {
    return (IFSelect_SelectIntersection*)$self->Access();
    }
};
%feature("shadow") Handle_IFSelect_SelectIntersection::~Handle_IFSelect_SelectIntersection %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_IFSelect_SelectIntersection {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor IFSelect_SelectModelEntities;
class IFSelect_SelectModelEntities : public IFSelect_SelectBase {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates a SelectModelRoot") IFSelect_SelectModelEntities;
		 IFSelect_SelectModelEntities ();
		%feature("autodoc", "Args:
	G(Interface_Graph)

Returns:
	Interface_EntityIterator

Returns the list of selected entities : the Entities of the  
          Model (note that this result assures naturally uniqueness)") RootResult;
		Interface_EntityIterator RootResult (const Interface_Graph & G);
		%feature("autodoc", "Args:
	G(Interface_Graph)

Returns:
	virtual Interface_EntityIterator

The complete list of Entities (including shared ones) ...  
          is exactly identical to RootResults in this case") CompleteResult;
		virtual Interface_EntityIterator CompleteResult (const Interface_Graph & G);
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

Returns a text defining the criterium : 'Model Entities'") Label;
		TCollection_AsciiString Label ();
};


%feature("shadow") IFSelect_SelectModelEntities::~IFSelect_SelectModelEntities %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IFSelect_SelectModelEntities {
	void _kill_pointed() {
		delete $self;
	}
};
%extend IFSelect_SelectModelEntities {
	Handle_IFSelect_SelectModelEntities GetHandle() {
	return *(Handle_IFSelect_SelectModelEntities*) &$self;
	}
};

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
    IFSelect_SelectModelEntities* GetObject() {
    return (IFSelect_SelectModelEntities*)$self->Access();
    }
};
%feature("shadow") Handle_IFSelect_SelectModelEntities::~Handle_IFSelect_SelectModelEntities %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_IFSelect_SelectModelEntities {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor IFSelect_SelectModelRoots;
class IFSelect_SelectModelRoots : public IFSelect_SelectBase {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates a SelectModelRoot") IFSelect_SelectModelRoots;
		 IFSelect_SelectModelRoots ();
		%feature("autodoc", "Args:
	G(Interface_Graph)

Returns:
	Interface_EntityIterator

Returns the list of selected entities : the Roots of the Model  
          (note that this result assures naturally uniqueness)") RootResult;
		Interface_EntityIterator RootResult (const Interface_Graph & G);
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

Returns a text defining the criterium : 'Model Roots'") Label;
		TCollection_AsciiString Label ();
};


%feature("shadow") IFSelect_SelectModelRoots::~IFSelect_SelectModelRoots %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IFSelect_SelectModelRoots {
	void _kill_pointed() {
		delete $self;
	}
};
%extend IFSelect_SelectModelRoots {
	Handle_IFSelect_SelectModelRoots GetHandle() {
	return *(Handle_IFSelect_SelectModelRoots*) &$self;
	}
};

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
    IFSelect_SelectModelRoots* GetObject() {
    return (IFSelect_SelectModelRoots*)$self->Access();
    }
};
%feature("shadow") Handle_IFSelect_SelectModelRoots::~Handle_IFSelect_SelectModelRoots %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_IFSelect_SelectModelRoots {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor IFSelect_SelectPointed;
class IFSelect_SelectPointed : public IFSelect_SelectBase {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates a SelectPointed") IFSelect_SelectPointed;
		 IFSelect_SelectPointed ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Clears the list of selected items  
          Also says the list is unset  
          All Add* methods and SetList say the list is set") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Tells if the list has been set. Even if empty") IsSet;
		Standard_Boolean IsSet ();
		%feature("autodoc", "Args:
	item(Handle_Standard_Transient)

Returns:
	None

As SetList but with only one entity  
          If <ent> is Null, the list is said as being set but is empty") SetEntity;
		void SetEntity (const Handle_Standard_Transient & item);
		%feature("autodoc", "Args:
	list(Handle_TColStd_HSequenceOfTransient)

Returns:
	None

Sets a given list to define the list of selected items  
          <list> can be empty or null : in this case, the list is said  
          as being set, but it is empty  
 
          To use it as an alternate input, one shot :  
          - SetList or SetEntity to define the input list  
          - RootResult to get it  
          - then Clear to drop it") SetList;
		void SetList (const Handle_TColStd_HSequenceOfTransient & list);
		%feature("autodoc", "Args:
	item(Handle_Standard_Transient)

Returns:
	Standard_Boolean

Adds an item. Returns True if Done, False if <item> is already  
          in the selected list") Add;
		Standard_Boolean Add (const Handle_Standard_Transient & item);
		%feature("autodoc", "Args:
	item(Handle_Standard_Transient)

Returns:
	Standard_Boolean

Removes an item. Returns True if Done, False if <item> was not  
          in the selected list") Remove;
		Standard_Boolean Remove (const Handle_Standard_Transient & item);
		%feature("autodoc", "Args:
	item(Handle_Standard_Transient)

Returns:
	Standard_Boolean

Toggles status of an item : adds it if not pointed or removes  
          it if already pointed. Returns the new status (Pointed or not)") Toggle;
		Standard_Boolean Toggle (const Handle_Standard_Transient & item);
		%feature("autodoc", "Args:
	list(Handle_TColStd_HSequenceOfTransient)

Returns:
	Standard_Boolean

Adds all the items defined in a list. Returns True if at least  
          one item has been added, False else") AddList;
		Standard_Boolean AddList (const Handle_TColStd_HSequenceOfTransient & list);
		%feature("autodoc", "Args:
	list(Handle_TColStd_HSequenceOfTransient)

Returns:
	Standard_Boolean

Removes all the items defined in a list. Returns True if at  
          least one item has been removed, False else") RemoveList;
		Standard_Boolean RemoveList (const Handle_TColStd_HSequenceOfTransient & list);
		%feature("autodoc", "Args:
	list(Handle_TColStd_HSequenceOfTransient)

Returns:
	Standard_Boolean

Toggles status of all the items defined in a list : adds it if  
          not pointed or removes it if already pointed.") ToggleList;
		Standard_Boolean ToggleList (const Handle_TColStd_HSequenceOfTransient & list);
		%feature("autodoc", "Args:
	item(Handle_Standard_Transient)

Returns:
	Standard_Integer

Returns the rank of an item in the selected list, or 0.") Rank;
		Standard_Integer Rank (const Handle_Standard_Transient & item);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the count of selected items") NbItems;
		Standard_Integer NbItems ();
		%feature("autodoc", "Args:
	num(Standard_Integer)

Returns:
	Handle_Standard_Transient

Returns an item given its rank, or a Null Handle") Item;
		Handle_Standard_Transient Item (const Standard_Integer num);
		%feature("autodoc", "Args:
	control(Handle_Interface_CopyControl)

Returns:
	None

Rebuilds the selected list. Any selected entity which has a  
          bound result is replaced by this result, else it is removed.") Update;
		void Update (const Handle_Interface_CopyControl & control);
		%feature("autodoc", "Args:
	trf(Handle_IFSelect_Transformer)

Returns:
	None

Rebuilds the selected list, by querying a Transformer  
          (same principle as from a CopyControl)") Update;
		void Update (const Handle_IFSelect_Transformer & trf);
		%feature("autodoc", "Args:
	G(Interface_Graph)

Returns:
	Interface_EntityIterator

Returns the list of selected items. Only the selected entities  
          which are present in the graph are given (this result assures  
          uniqueness).") RootResult;
		Interface_EntityIterator RootResult (const Interface_Graph & G);
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

Returns a text which identifies the type of selection made.  
          It is 'Pointed Entities'") Label;
		TCollection_AsciiString Label ();
};


%feature("shadow") IFSelect_SelectPointed::~IFSelect_SelectPointed %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IFSelect_SelectPointed {
	void _kill_pointed() {
		delete $self;
	}
};
%extend IFSelect_SelectPointed {
	Handle_IFSelect_SelectPointed GetHandle() {
	return *(Handle_IFSelect_SelectPointed*) &$self;
	}
};

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
    IFSelect_SelectPointed* GetObject() {
    return (IFSelect_SelectPointed*)$self->Access();
    }
};
%feature("shadow") Handle_IFSelect_SelectPointed::~Handle_IFSelect_SelectPointed %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_IFSelect_SelectPointed {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor IFSelect_SelectShared;
class IFSelect_SelectShared : public IFSelect_SelectDeduct {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates a SelectShared;") IFSelect_SelectShared;
		 IFSelect_SelectShared ();
		%feature("autodoc", "Args:
	G(Interface_Graph)

Returns:
	Interface_EntityIterator

Returns the list of selected entities (list of entities  
          shared by those of input list)") RootResult;
		Interface_EntityIterator RootResult (const Interface_Graph & G);
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

Returns a text defining the criterium : 'Shared (one level)'") Label;
		TCollection_AsciiString Label ();
};


%feature("shadow") IFSelect_SelectShared::~IFSelect_SelectShared %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IFSelect_SelectShared {
	void _kill_pointed() {
		delete $self;
	}
};
%extend IFSelect_SelectShared {
	Handle_IFSelect_SelectShared GetHandle() {
	return *(Handle_IFSelect_SelectShared*) &$self;
	}
};

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
    IFSelect_SelectShared* GetObject() {
    return (IFSelect_SelectShared*)$self->Access();
    }
};
%feature("shadow") Handle_IFSelect_SelectShared::~Handle_IFSelect_SelectShared %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_IFSelect_SelectShared {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor IFSelect_SelectSharing;
class IFSelect_SelectSharing : public IFSelect_SelectDeduct {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates a SelectSharing;") IFSelect_SelectSharing;
		 IFSelect_SelectSharing ();
		%feature("autodoc", "Args:
	G(Interface_Graph)

Returns:
	Interface_EntityIterator

Returns the list of selected entities (list of entities  
          which share (level one) those of input list)") RootResult;
		Interface_EntityIterator RootResult (const Interface_Graph & G);
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

Returns a text defining the criterium : 'Sharing (one level)'") Label;
		TCollection_AsciiString Label ();
};


%feature("shadow") IFSelect_SelectSharing::~IFSelect_SelectSharing %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IFSelect_SelectSharing {
	void _kill_pointed() {
		delete $self;
	}
};
%extend IFSelect_SelectSharing {
	Handle_IFSelect_SelectSharing GetHandle() {
	return *(Handle_IFSelect_SelectSharing*) &$self;
	}
};

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
    IFSelect_SelectSharing* GetObject() {
    return (IFSelect_SelectSharing*)$self->Access();
    }
};
%feature("shadow") Handle_IFSelect_SelectSharing::~Handle_IFSelect_SelectSharing %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_IFSelect_SelectSharing {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor IFSelect_SelectSuite;
class IFSelect_SelectSuite : public IFSelect_SelectDeduct {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates an empty SelectSuite") IFSelect_SelectSuite;
		 IFSelect_SelectSuite ();
		%feature("autodoc", "Args:
	item(Handle_IFSelect_Selection)

Returns:
	Standard_Boolean

Adds an input selection. I.E. :  
          If <item> is a SelectDeduct, adds it as Previous, not as Input  
          Else, sets it as Input  
          Returns True when done  
          Returns False and refuses to work if Input is already defined") AddInput;
		Standard_Boolean AddInput (const Handle_IFSelect_Selection & item);
		%feature("autodoc", "Args:
	item(Handle_IFSelect_SelectDeduct)

Returns:
	None

Adds a new first item (prepends to the list). The Input is not  
          touched  
          If <item> is null, does nothing") AddPrevious;
		void AddPrevious (const Handle_IFSelect_SelectDeduct & item);
		%feature("autodoc", "Args:
	item(Handle_IFSelect_SelectDeduct)

Returns:
	None

Adds a new last item (prepends to the list)  
          If <item> is null, does nothing") AddNext;
		void AddNext (const Handle_IFSelect_SelectDeduct & item);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the count of Items") NbItems;
		Standard_Integer NbItems ();
		%feature("autodoc", "Args:
	num(Standard_Integer)

Returns:
	Handle_IFSelect_SelectDeduct

Returns an item from its rank in the list  
          (the Input is always apart)") Item;
		Handle_IFSelect_SelectDeduct Item (const Standard_Integer num);
		%feature("autodoc", "Args:
	lab(char *)

Returns:
	None

Sets a value for the Label") SetLabel;
		void SetLabel (const char * lab);
		%feature("autodoc", "Args:
	G(Interface_Graph)

Returns:
	Interface_EntityIterator

Returns the list of selected entities  
          To do this, once InputResult has been taken (if Input or  
          Alternate has been defined, else the first Item gives it) :  
          this result is set as alternate input for the first item,  
          which computes its result : this result is set as alternate  
          input for the second item, etc...") RootResult;
		Interface_EntityIterator RootResult (const Interface_Graph & G);
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

Returns the Label  
          Either it has been defined by SetLabel, or it will give  
          'Suite of nn Selections'") Label;
		TCollection_AsciiString Label ();
};


%feature("shadow") IFSelect_SelectSuite::~IFSelect_SelectSuite %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IFSelect_SelectSuite {
	void _kill_pointed() {
		delete $self;
	}
};
%extend IFSelect_SelectSuite {
	Handle_IFSelect_SelectSuite GetHandle() {
	return *(Handle_IFSelect_SelectSuite*) &$self;
	}
};

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
    IFSelect_SelectSuite* GetObject() {
    return (IFSelect_SelectSuite*)$self->Access();
    }
};
%feature("shadow") Handle_IFSelect_SelectSuite::~Handle_IFSelect_SelectSuite %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_IFSelect_SelectSuite {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor IFSelect_SelectUnion;
class IFSelect_SelectUnion : public IFSelect_SelectCombine {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates an empty SelectUnion") IFSelect_SelectUnion;
		 IFSelect_SelectUnion ();
		%feature("autodoc", "Args:
	G(Interface_Graph)

Returns:
	Interface_EntityIterator

Returns the list of selected Entities, which is the addition  
          result from all input selections. Uniqueness is guaranteed.") RootResult;
		Interface_EntityIterator RootResult (const Interface_Graph & G);
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

Returns a text defining the criterium : 'Union (OR)'") Label;
		TCollection_AsciiString Label ();
};


%feature("shadow") IFSelect_SelectUnion::~IFSelect_SelectUnion %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IFSelect_SelectUnion {
	void _kill_pointed() {
		delete $self;
	}
};
%extend IFSelect_SelectUnion {
	Handle_IFSelect_SelectUnion GetHandle() {
	return *(Handle_IFSelect_SelectUnion*) &$self;
	}
};

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
    IFSelect_SelectUnion* GetObject() {
    return (IFSelect_SelectUnion*)$self->Access();
    }
};
%feature("shadow") Handle_IFSelect_SelectUnion::~Handle_IFSelect_SelectUnion %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_IFSelect_SelectUnion {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor IFSelect_SignAncestor;
class IFSelect_SignAncestor : public IFSelect_SignType {
	public:
		%feature("autodoc", "Args:
	nopk(Standard_Boolean)=Standard_False

Returns:
	None

No detailed docstring for this function.") IFSelect_SignAncestor;
		 IFSelect_SignAncestor (const Standard_Boolean nopk = Standard_False);
		%feature("autodoc", "Args:
	ent(Handle_Standard_Transient)
	model(Handle_Interface_InterfaceModel)
	text(TCollection_AsciiString)
	exact(Standard_Boolean)

Returns:
	virtual Standard_Boolean

No detailed docstring for this function.") Matches;
		virtual Standard_Boolean Matches (const Handle_Standard_Transient & ent,const Handle_Interface_InterfaceModel & model,const TCollection_AsciiString & text,const Standard_Boolean exact);
};


%feature("shadow") IFSelect_SignAncestor::~IFSelect_SignAncestor %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IFSelect_SignAncestor {
	void _kill_pointed() {
		delete $self;
	}
};
%extend IFSelect_SignAncestor {
	Handle_IFSelect_SignAncestor GetHandle() {
	return *(Handle_IFSelect_SignAncestor*) &$self;
	}
};

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
    IFSelect_SignAncestor* GetObject() {
    return (IFSelect_SignAncestor*)$self->Access();
    }
};
%feature("shadow") Handle_IFSelect_SignAncestor::~Handle_IFSelect_SignAncestor %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_IFSelect_SignAncestor {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor IFSelect_SelectAnyType;
class IFSelect_SelectAnyType : public IFSelect_SelectExtract {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	virtual Handle_Standard_Type

Returns the Type which has to be matched for select") TypeForMatch;
		virtual Handle_Standard_Type TypeForMatch ();
		%feature("autodoc", "Args:
	rank(Standard_Integer)
	ent(Handle_Standard_Transient)
	model(Handle_Interface_InterfaceModel)

Returns:
	Standard_Boolean

Returns True for an Entity (model->Value(num)) which is kind  
          of the choosen type, given by the method TypeForMatch.  
          Criterium is IsKind.") Sort;
		Standard_Boolean Sort (const Standard_Integer rank,const Handle_Standard_Transient & ent,const Handle_Interface_InterfaceModel & model);
};


%feature("shadow") IFSelect_SelectAnyType::~IFSelect_SelectAnyType %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IFSelect_SelectAnyType {
	void _kill_pointed() {
		delete $self;
	}
};
%extend IFSelect_SelectAnyType {
	Handle_IFSelect_SelectAnyType GetHandle() {
	return *(Handle_IFSelect_SelectAnyType*) &$self;
	}
};

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
    IFSelect_SelectAnyType* GetObject() {
    return (IFSelect_SelectAnyType*)$self->Access();
    }
};
%feature("shadow") Handle_IFSelect_SelectAnyType::~Handle_IFSelect_SelectAnyType %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_IFSelect_SelectAnyType {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor IFSelect_SelectErrorEntities;
class IFSelect_SelectErrorEntities : public IFSelect_SelectExtract {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates a SelectErrorEntities") IFSelect_SelectErrorEntities;
		 IFSelect_SelectErrorEntities ();
		%feature("autodoc", "Args:
	rank(Standard_Integer)
	ent(Handle_Standard_Transient)
	model(Handle_Interface_InterfaceModel)

Returns:
	Standard_Boolean

Returns True for an Entity which is qualified as 'Error', i.e.  
          if <model> explicitly knows <ent> (through its Number) as  
          Erroneous") Sort;
		Standard_Boolean Sort (const Standard_Integer rank,const Handle_Standard_Transient & ent,const Handle_Interface_InterfaceModel & model);
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

Returns a text defining the criterium : 'Error Entities'") ExtractLabel;
		TCollection_AsciiString ExtractLabel ();
};


%feature("shadow") IFSelect_SelectErrorEntities::~IFSelect_SelectErrorEntities %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IFSelect_SelectErrorEntities {
	void _kill_pointed() {
		delete $self;
	}
};
%extend IFSelect_SelectErrorEntities {
	Handle_IFSelect_SelectErrorEntities GetHandle() {
	return *(Handle_IFSelect_SelectErrorEntities*) &$self;
	}
};

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
    IFSelect_SelectErrorEntities* GetObject() {
    return (IFSelect_SelectErrorEntities*)$self->Access();
    }
};
%feature("shadow") Handle_IFSelect_SelectErrorEntities::~Handle_IFSelect_SelectErrorEntities %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_IFSelect_SelectErrorEntities {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor IFSelect_SelectFlag;
class IFSelect_SelectFlag : public IFSelect_SelectExtract {
	public:
		%feature("autodoc", "Args:
	flagname(char *)

Returns:
	None

Creates a Select Flag, to query a flag designated by its name") IFSelect_SelectFlag;
		 IFSelect_SelectFlag (const char * flagname);
		%feature("autodoc", "Args:
	None
Returns:
	char *

Returns the name of the flag") FlagName;
		char * FlagName ();
		%feature("autodoc", "Args:
	G(Interface_Graph)

Returns:
	virtual Interface_EntityIterator

Returns the list of selected entities. It is redefined to  
          work on the graph itself (not queried by sort)  
 
          An entity is selected if its flag is True on Direct mode,  
          False on Reversed mode  
 
          If flag does not exist for the given name, returns an empty  
          result, whatever the Direct/Reversed sense") RootResult;
		virtual Interface_EntityIterator RootResult (const Interface_Graph & G);
		%feature("autodoc", "Args:
	rank(Standard_Integer)
	ent(Handle_Standard_Transient)
	model(Handle_Interface_InterfaceModel)

Returns:
	Standard_Boolean

Returns always False because RootResult has done the work") Sort;
		Standard_Boolean Sort (const Standard_Integer rank,const Handle_Standard_Transient & ent,const Handle_Interface_InterfaceModel & model);
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

Returns a text defining the criterium, includes the flag name") ExtractLabel;
		TCollection_AsciiString ExtractLabel ();
};


%feature("shadow") IFSelect_SelectFlag::~IFSelect_SelectFlag %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IFSelect_SelectFlag {
	void _kill_pointed() {
		delete $self;
	}
};
%extend IFSelect_SelectFlag {
	Handle_IFSelect_SelectFlag GetHandle() {
	return *(Handle_IFSelect_SelectFlag*) &$self;
	}
};

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
    IFSelect_SelectFlag* GetObject() {
    return (IFSelect_SelectFlag*)$self->Access();
    }
};
%feature("shadow") Handle_IFSelect_SelectFlag::~Handle_IFSelect_SelectFlag %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_IFSelect_SelectFlag {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor IFSelect_SelectInList;
class IFSelect_SelectInList : public IFSelect_SelectAnyList {
	public:
		%feature("autodoc", "Args:
	num(Standard_Integer)
	ent(Handle_Standard_Transient)

Returns:
	virtual Handle_Standard_Transient

Returns an Entity, given its rank in the list") ListedEntity;
		virtual Handle_Standard_Transient ListedEntity (const Standard_Integer num,const Handle_Standard_Transient & ent);
		%feature("autodoc", "Args:
	n1(Standard_Integer)
	n2(Standard_Integer)
	ent(Handle_Standard_Transient)
	result(Interface_EntityIterator)

Returns:
	None

Puts into the result, the sub-entities of the list, from n1 to  
          n2 included. Remark that adequation with Entity's type and  
          length of list has already been made at this stage  
          Called by RootResult; calls ListedEntity (see below)") FillResult;
		void FillResult (const Standard_Integer n1,const Standard_Integer n2,const Handle_Standard_Transient & ent,Interface_EntityIterator & result);
};


%feature("shadow") IFSelect_SelectInList::~IFSelect_SelectInList %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IFSelect_SelectInList {
	void _kill_pointed() {
		delete $self;
	}
};
%extend IFSelect_SelectInList {
	Handle_IFSelect_SelectInList GetHandle() {
	return *(Handle_IFSelect_SelectInList*) &$self;
	}
};

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
    IFSelect_SelectInList* GetObject() {
    return (IFSelect_SelectInList*)$self->Access();
    }
};
%feature("shadow") Handle_IFSelect_SelectInList::~Handle_IFSelect_SelectInList %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_IFSelect_SelectInList {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor IFSelect_SelectRange;
class IFSelect_SelectRange : public IFSelect_SelectExtract {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates a SelectRange. Default is Take all the input list") IFSelect_SelectRange;
		 IFSelect_SelectRange ();
		%feature("autodoc", "Args:
	rankfrom(Handle_IFSelect_IntParam)
	rankto(Handle_IFSelect_IntParam)

Returns:
	None

Sets a Range for numbers, with a lower and a upper limits  
          Error if rankto is lower then rankfrom") SetRange;
		void SetRange (const Handle_IFSelect_IntParam & rankfrom,const Handle_IFSelect_IntParam & rankto);
		%feature("autodoc", "Args:
	rank(Handle_IFSelect_IntParam)

Returns:
	None

Sets a unique number (only one Entity will be sorted as True)") SetOne;
		void SetOne (const Handle_IFSelect_IntParam & rank);
		%feature("autodoc", "Args:
	rankfrom(Handle_IFSelect_IntParam)

Returns:
	None

Sets a Lower limit but no upper limit") SetFrom;
		void SetFrom (const Handle_IFSelect_IntParam & rankfrom);
		%feature("autodoc", "Args:
	rankto(Handle_IFSelect_IntParam)

Returns:
	None

Sets an Upper limit but no lower limit (equivalent to lower 1)") SetUntil;
		void SetUntil (const Handle_IFSelect_IntParam & rankto);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True if a Lower limit is defined") HasLower;
		Standard_Boolean HasLower ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_IFSelect_IntParam

Returns Lower limit (if there is; else, value is senseless)") Lower;
		Handle_IFSelect_IntParam Lower ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns Value of Lower Limit (0 if none is defined)") LowerValue;
		Standard_Integer LowerValue ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True if a Lower limit is defined") HasUpper;
		Standard_Boolean HasUpper ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_IFSelect_IntParam

Returns Upper limit (if there is; else, value is senseless)") Upper;
		Handle_IFSelect_IntParam Upper ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns Value of Upper Limit (0 if none is defined)") UpperValue;
		Standard_Integer UpperValue ();
		%feature("autodoc", "Args:
	rank(Standard_Integer)
	ent(Handle_Standard_Transient)
	model(Handle_Interface_InterfaceModel)

Returns:
	Standard_Boolean

Returns True for an Entity of which occurence number in the  
          iteration is inside the selected Range (considers <rank>)") Sort;
		Standard_Boolean Sort (const Standard_Integer rank,const Handle_Standard_Transient & ent,const Handle_Interface_InterfaceModel & model);
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

Returns a text defining the criterium : following cases,  
          ' From .. Until ..' or 'From ..' or 'Until ..' or 'Rank no ..'") ExtractLabel;
		TCollection_AsciiString ExtractLabel ();
};


%feature("shadow") IFSelect_SelectRange::~IFSelect_SelectRange %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IFSelect_SelectRange {
	void _kill_pointed() {
		delete $self;
	}
};
%extend IFSelect_SelectRange {
	Handle_IFSelect_SelectRange GetHandle() {
	return *(Handle_IFSelect_SelectRange*) &$self;
	}
};

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
    IFSelect_SelectRange* GetObject() {
    return (IFSelect_SelectRange*)$self->Access();
    }
};
%feature("shadow") Handle_IFSelect_SelectRange::~Handle_IFSelect_SelectRange %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_IFSelect_SelectRange {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor IFSelect_SelectRootComps;
class IFSelect_SelectRootComps : public IFSelect_SelectExtract {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates a SelectRootComps") IFSelect_SelectRootComps;
		 IFSelect_SelectRootComps ();
		%feature("autodoc", "Args:
	G(Interface_Graph)

Returns:
	virtual Interface_EntityIterator

Returns the list of local root strong componants, by one  
          Entity par componant. It is redefined for a purpose of  
          effeciency : calling a Sort routine for each Entity would  
          cost more ressource than to work in once using a Map  
          RootResult takes in account the Direct status") RootResult;
		virtual Interface_EntityIterator RootResult (const Interface_Graph & G);
		%feature("autodoc", "Args:
	rank(Standard_Integer)
	ent(Handle_Standard_Transient)
	model(Handle_Interface_InterfaceModel)

Returns:
	Standard_Boolean

Returns always True, because RootResult has done work") Sort;
		Standard_Boolean Sort (const Standard_Integer rank,const Handle_Standard_Transient & ent,const Handle_Interface_InterfaceModel & model);
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

Returns a text defining the criterium : 'Local Root Componants'") ExtractLabel;
		TCollection_AsciiString ExtractLabel ();
};


%feature("shadow") IFSelect_SelectRootComps::~IFSelect_SelectRootComps %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IFSelect_SelectRootComps {
	void _kill_pointed() {
		delete $self;
	}
};
%extend IFSelect_SelectRootComps {
	Handle_IFSelect_SelectRootComps GetHandle() {
	return *(Handle_IFSelect_SelectRootComps*) &$self;
	}
};

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
    IFSelect_SelectRootComps* GetObject() {
    return (IFSelect_SelectRootComps*)$self->Access();
    }
};
%feature("shadow") Handle_IFSelect_SelectRootComps::~Handle_IFSelect_SelectRootComps %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_IFSelect_SelectRootComps {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor IFSelect_SelectRoots;
class IFSelect_SelectRoots : public IFSelect_SelectExtract {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates a SelectRoots") IFSelect_SelectRoots;
		 IFSelect_SelectRoots ();
		%feature("autodoc", "Args:
	G(Interface_Graph)

Returns:
	virtual Interface_EntityIterator

Returns the list of local roots. It is redefined for a purpose  
          of effeciency : calling a Sort routine for each Entity would  
          cost more ressource than to work in once using a Map  
          RootResult takes in account the Direct status") RootResult;
		virtual Interface_EntityIterator RootResult (const Interface_Graph & G);
		%feature("autodoc", "Args:
	rank(Standard_Integer)
	ent(Handle_Standard_Transient)
	model(Handle_Interface_InterfaceModel)

Returns:
	Standard_Boolean

Returns always True, because RootResult has done work") Sort;
		Standard_Boolean Sort (const Standard_Integer rank,const Handle_Standard_Transient & ent,const Handle_Interface_InterfaceModel & model);
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

Returns a text defining the criterium : 'Local Root Entities'") ExtractLabel;
		TCollection_AsciiString ExtractLabel ();
};


%feature("shadow") IFSelect_SelectRoots::~IFSelect_SelectRoots %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IFSelect_SelectRoots {
	void _kill_pointed() {
		delete $self;
	}
};
%extend IFSelect_SelectRoots {
	Handle_IFSelect_SelectRoots GetHandle() {
	return *(Handle_IFSelect_SelectRoots*) &$self;
	}
};

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
    IFSelect_SelectRoots* GetObject() {
    return (IFSelect_SelectRoots*)$self->Access();
    }
};
%feature("shadow") Handle_IFSelect_SelectRoots::~Handle_IFSelect_SelectRoots %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_IFSelect_SelectRoots {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor IFSelect_SelectSent;
class IFSelect_SelectSent : public IFSelect_SelectExtract {
	public:
		%feature("autodoc", "Args:
	sentcount(Standard_Integer)=1
	atleast(Standard_Boolean)=Standard_True

Returns:
	None

Creates a SelectSent :  
          sentcount = 0 -> remaining (non-sent) entities  
          sentcount = 1, atleast = True (D) -> sent (at least once)  
          sentcount = 2, atleast = True -> duplicated (sent least twice)  
            etc...  
          sentcount = 1, atleast = False -> sent just once (non-dupl.d)  
          sentcount = 2, atleast = False -> sent just twice  
            etc...") IFSelect_SelectSent;
		 IFSelect_SelectSent (const Standard_Integer sentcount = 1,const Standard_Boolean atleast = Standard_True);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the queried count of sending") SentCount;
		Standard_Integer SentCount ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns the <atleast> status, True for sending at least the  
          sending count, False for sending exactly the sending count  
          Remark : if SentCount is 0, AtLeast is ignored") AtLeast;
		Standard_Boolean AtLeast ();
		%feature("autodoc", "Args:
	G(Interface_Graph)

Returns:
	virtual Interface_EntityIterator

Returns the list of selected entities. It is redefined to  
          work on the graph itself (not queried by sort)  
 
          An entity is selected if its count complies to the query in  
          Direct Mode, rejected in Reversed Mode  
 
          Query works on the sending count recorded as status in Graph") RootResult;
		virtual Interface_EntityIterator RootResult (const Interface_Graph & G);
		%feature("autodoc", "Args:
	rank(Standard_Integer)
	ent(Handle_Standard_Transient)
	model(Handle_Interface_InterfaceModel)

Returns:
	Standard_Boolean

Returns always False because RootResult has done the work") Sort;
		Standard_Boolean Sort (const Standard_Integer rank,const Handle_Standard_Transient & ent,const Handle_Interface_InterfaceModel & model);
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

Returns a text defining the criterium : query :  
          SentCount = 0 -> 'Remaining (non-sent) entities'  
          SentCount = 1, AtLeast = True  -> 'Sent entities'  
          SentCount = 1, AtLeast = False -> 'Sent once (no duplicated)'  
          SentCount = 2, AtLeast = True  -> 'Sent several times entities'  
          SentCount = 2, AtLeast = False -> 'Sent twice entities'  
          SentCount > 2, AtLeast = True  -> 'Sent at least <count> times entities'  
          SentCount > 2, AtLeast = False -> 'Sent <count> times entities'") ExtractLabel;
		TCollection_AsciiString ExtractLabel ();
};


%feature("shadow") IFSelect_SelectSent::~IFSelect_SelectSent %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IFSelect_SelectSent {
	void _kill_pointed() {
		delete $self;
	}
};
%extend IFSelect_SelectSent {
	Handle_IFSelect_SelectSent GetHandle() {
	return *(Handle_IFSelect_SelectSent*) &$self;
	}
};

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
    IFSelect_SelectSent* GetObject() {
    return (IFSelect_SelectSent*)$self->Access();
    }
};
%feature("shadow") Handle_IFSelect_SelectSent::~Handle_IFSelect_SelectSent %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_IFSelect_SelectSent {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor IFSelect_SelectSignature;
class IFSelect_SelectSignature : public IFSelect_SelectExtract {
	public:
		%feature("autodoc", "Args:
	matcher(Handle_IFSelect_Signature)
	signtext(char *)
	exact(Standard_Boolean)=Standard_True

Returns:
	None

Creates a SelectSignature with its Signature and its Text to  
          Match.  
          <exact> if True requires exact match,  
          if False requires <signtext> to be contained in the Signature  
          of the entity (default is 'exact')") IFSelect_SelectSignature;
		 IFSelect_SelectSignature (const Handle_IFSelect_Signature & matcher,const char * signtext,const Standard_Boolean exact = Standard_True);
		%feature("autodoc", "Args:
	matcher(Handle_IFSelect_Signature)
	signtext(TCollection_AsciiString)
	exact(Standard_Boolean)=Standard_True

Returns:
	None

As above with an AsciiString") IFSelect_SelectSignature;
		 IFSelect_SelectSignature (const Handle_IFSelect_Signature & matcher,const TCollection_AsciiString & signtext,const Standard_Boolean exact = Standard_True);
		%feature("autodoc", "Args:
	matcher(Handle_IFSelect_SignCounter)
	signtext(char *)
	exact(Standard_Boolean)=Standard_True

Returns:
	None

Creates a SelectSignature with a Counter, more precisely a  
          SelectSignature. Which is used here to just give a Signature  
          Value (by SignOnly Mode)  
          Matching is the default provided by the class Signature") IFSelect_SelectSignature;
		 IFSelect_SelectSignature (const Handle_IFSelect_SignCounter & matcher,const char * signtext,const Standard_Boolean exact = Standard_True);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_IFSelect_Signature

Returns the used Signature, then it is possible to access it,  
          modify it as required. Can be null, hence see Counter") Signature;
		Handle_IFSelect_Signature Signature ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_IFSelect_SignCounter

Returns the used SignCounter. Can be used as alternative for  
          Signature") Counter;
		Handle_IFSelect_SignCounter Counter ();
		%feature("autodoc", "Args:
	rank(Standard_Integer)
	ent(Handle_Standard_Transient)
	G(Interface_Graph)

Returns:
	virtual Standard_Boolean

Returns True for an Entity (model->Value(num)) of which the  
          signature matches the text given as creation time  
          May also work with a Counter from the Graph") SortInGraph;
		virtual Standard_Boolean SortInGraph (const Standard_Integer rank,const Handle_Standard_Transient & ent,const Interface_Graph & G);
		%feature("autodoc", "Args:
	rank(Standard_Integer)
	ent(Handle_Standard_Transient)
	model(Handle_Interface_InterfaceModel)

Returns:
	Standard_Boolean

Not called, defined only to remove a deferred method here") Sort;
		Standard_Boolean Sort (const Standard_Integer rank,const Handle_Standard_Transient & ent,const Handle_Interface_InterfaceModel & model);
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

Returns Text used to Sort Entity on its Signature or SignCounter") SignatureText;
		const TCollection_AsciiString & SignatureText ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True if match must be exact") IsExact;
		Standard_Boolean IsExact ();
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

Returns a text defining the criterium.  
          (it refers to the text and exact flag to be matched, and is  
          qualified by the Name provided by the Signature)") ExtractLabel;
		TCollection_AsciiString ExtractLabel ();
};


%feature("shadow") IFSelect_SelectSignature::~IFSelect_SelectSignature %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IFSelect_SelectSignature {
	void _kill_pointed() {
		delete $self;
	}
};
%extend IFSelect_SelectSignature {
	Handle_IFSelect_SelectSignature GetHandle() {
	return *(Handle_IFSelect_SelectSignature*) &$self;
	}
};

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
    IFSelect_SelectSignature* GetObject() {
    return (IFSelect_SelectSignature*)$self->Access();
    }
};
%feature("shadow") Handle_IFSelect_SelectSignature::~Handle_IFSelect_SelectSignature %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_IFSelect_SelectSignature {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor IFSelect_SelectSignedShared;
class IFSelect_SelectSignedShared : public IFSelect_SelectExplore {
	public:
		%feature("autodoc", "Args:
	matcher(Handle_IFSelect_Signature)
	signtext(char *)
	exact(Standard_Boolean)=Standard_True
	level(Standard_Integer)=0

Returns:
	None

Creates a SelectSignedShared, defaulted for any level  
          with a given Signature and text to match") IFSelect_SelectSignedShared;
		 IFSelect_SelectSignedShared (const Handle_IFSelect_Signature & matcher,const char * signtext,const Standard_Boolean exact = Standard_True,const Standard_Integer level = 0);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_IFSelect_Signature

Returns the used Signature, then it is possible to access it,  
          modify it as required") Signature;
		Handle_IFSelect_Signature Signature ();
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

Returns Text used to Sort Entity on its Signature") SignatureText;
		const TCollection_AsciiString & SignatureText ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True if match must be exact") IsExact;
		Standard_Boolean IsExact ();
		%feature("autodoc", "Args:
	level(Standard_Integer)
	ent(Handle_Standard_Transient)
	G(Interface_Graph)
	explored(Interface_EntityIterator)

Returns:
	Standard_Boolean

Explores an entity : its Shared entities  
          <ent> to take if it matches the Signature  
          At level max, filters the result. Else gives all Shareds") Explore;
		Standard_Boolean Explore (const Standard_Integer level,const Handle_Standard_Transient & ent,const Interface_Graph & G,Interface_EntityIterator & explored);
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

Returns a text defining the criterium.  
          (it refers to the text and exact flag to be matched, and is  
          qualified by the Name provided by the Signature)") ExploreLabel;
		TCollection_AsciiString ExploreLabel ();
};


%feature("shadow") IFSelect_SelectSignedShared::~IFSelect_SelectSignedShared %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IFSelect_SelectSignedShared {
	void _kill_pointed() {
		delete $self;
	}
};
%extend IFSelect_SelectSignedShared {
	Handle_IFSelect_SelectSignedShared GetHandle() {
	return *(Handle_IFSelect_SelectSignedShared*) &$self;
	}
};

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
    IFSelect_SelectSignedShared* GetObject() {
    return (IFSelect_SelectSignedShared*)$self->Access();
    }
};
%feature("shadow") Handle_IFSelect_SelectSignedShared::~Handle_IFSelect_SelectSignedShared %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_IFSelect_SelectSignedShared {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor IFSelect_SelectSignedSharing;
class IFSelect_SelectSignedSharing : public IFSelect_SelectExplore {
	public:
		%feature("autodoc", "Args:
	matcher(Handle_IFSelect_Signature)
	signtext(char *)
	exact(Standard_Boolean)=Standard_True
	level(Standard_Integer)=0

Returns:
	None

Creates a SelectSignedSharing, defaulted for any level  
          with a given Signature and text to match") IFSelect_SelectSignedSharing;
		 IFSelect_SelectSignedSharing (const Handle_IFSelect_Signature & matcher,const char * signtext,const Standard_Boolean exact = Standard_True,const Standard_Integer level = 0);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_IFSelect_Signature

Returns the used Signature, then it is possible to access it,  
          modify it as required") Signature;
		Handle_IFSelect_Signature Signature ();
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

Returns Text used to Sort Entity on its Signature") SignatureText;
		const TCollection_AsciiString & SignatureText ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True if match must be exact") IsExact;
		Standard_Boolean IsExact ();
		%feature("autodoc", "Args:
	level(Standard_Integer)
	ent(Handle_Standard_Transient)
	G(Interface_Graph)
	explored(Interface_EntityIterator)

Returns:
	Standard_Boolean

Explores an entity : its sharing entities  
          <ent> to take if it matches the Signature  
          At level max, filters the result. Else gives all sharings") Explore;
		Standard_Boolean Explore (const Standard_Integer level,const Handle_Standard_Transient & ent,const Interface_Graph & G,Interface_EntityIterator & explored);
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

Returns a text defining the criterium.  
          (it refers to the text and exact flag to be matched, and is  
          qualified by the Name provided by the Signature)") ExploreLabel;
		TCollection_AsciiString ExploreLabel ();
};


%feature("shadow") IFSelect_SelectSignedSharing::~IFSelect_SelectSignedSharing %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IFSelect_SelectSignedSharing {
	void _kill_pointed() {
		delete $self;
	}
};
%extend IFSelect_SelectSignedSharing {
	Handle_IFSelect_SelectSignedSharing GetHandle() {
	return *(Handle_IFSelect_SelectSignedSharing*) &$self;
	}
};

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
    IFSelect_SelectSignedSharing* GetObject() {
    return (IFSelect_SelectSignedSharing*)$self->Access();
    }
};
%feature("shadow") Handle_IFSelect_SelectSignedSharing::~Handle_IFSelect_SelectSignedSharing %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_IFSelect_SelectSignedSharing {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor IFSelect_SelectUnknownEntities;
class IFSelect_SelectUnknownEntities : public IFSelect_SelectExtract {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates a SelectUnknownEntities") IFSelect_SelectUnknownEntities;
		 IFSelect_SelectUnknownEntities ();
		%feature("autodoc", "Args:
	rank(Standard_Integer)
	ent(Handle_Standard_Transient)
	model(Handle_Interface_InterfaceModel)

Returns:
	Standard_Boolean

Returns True for an Entity which is qualified as 'Unknown',  
          i.e. if <model> known <ent> (through its Number) as Unknown") Sort;
		Standard_Boolean Sort (const Standard_Integer rank,const Handle_Standard_Transient & ent,const Handle_Interface_InterfaceModel & model);
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

Returns a text defining the criterium : 'Recognized Entities'") ExtractLabel;
		TCollection_AsciiString ExtractLabel ();
};


%feature("shadow") IFSelect_SelectUnknownEntities::~IFSelect_SelectUnknownEntities %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IFSelect_SelectUnknownEntities {
	void _kill_pointed() {
		delete $self;
	}
};
%extend IFSelect_SelectUnknownEntities {
	Handle_IFSelect_SelectUnknownEntities GetHandle() {
	return *(Handle_IFSelect_SelectUnknownEntities*) &$self;
	}
};

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
    IFSelect_SelectUnknownEntities* GetObject() {
    return (IFSelect_SelectUnknownEntities*)$self->Access();
    }
};
%feature("shadow") Handle_IFSelect_SelectUnknownEntities::~Handle_IFSelect_SelectUnknownEntities %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_IFSelect_SelectUnknownEntities {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor IFSelect_SelectIncorrectEntities;
class IFSelect_SelectIncorrectEntities : public IFSelect_SelectFlag {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates a SelectIncorrectEntities  
          i.e. a SelectFlag('Incorrect')") IFSelect_SelectIncorrectEntities;
		 IFSelect_SelectIncorrectEntities ();
};


%feature("shadow") IFSelect_SelectIncorrectEntities::~IFSelect_SelectIncorrectEntities %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IFSelect_SelectIncorrectEntities {
	void _kill_pointed() {
		delete $self;
	}
};
%extend IFSelect_SelectIncorrectEntities {
	Handle_IFSelect_SelectIncorrectEntities GetHandle() {
	return *(Handle_IFSelect_SelectIncorrectEntities*) &$self;
	}
};

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
    IFSelect_SelectIncorrectEntities* GetObject() {
    return (IFSelect_SelectIncorrectEntities*)$self->Access();
    }
};
%feature("shadow") Handle_IFSelect_SelectIncorrectEntities::~Handle_IFSelect_SelectIncorrectEntities %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_IFSelect_SelectIncorrectEntities {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor IFSelect_SelectType;
class IFSelect_SelectType : public IFSelect_SelectAnyType {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates a SelectType. Default is no filter") IFSelect_SelectType;
		 IFSelect_SelectType ();
		%feature("autodoc", "Args:
	atype(Handle_Standard_Type)

Returns:
	None

Creates a SelectType for a given Type") IFSelect_SelectType;
		 IFSelect_SelectType (const Handle_Standard_Type & atype);
		%feature("autodoc", "Args:
	atype(Handle_Standard_Type)

Returns:
	None

Sets a TYpe for filter") SetType;
		void SetType (const Handle_Standard_Type & atype);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Standard_Type

Returns the Type to be matched for select : this is the type  
          given at instantiation time") TypeForMatch;
		Handle_Standard_Type TypeForMatch ();
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

Returns a text defining the criterium.  
          (should by gotten from Type of Entity used for instantiation)") ExtractLabel;
		TCollection_AsciiString ExtractLabel ();
};


%feature("shadow") IFSelect_SelectType::~IFSelect_SelectType %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IFSelect_SelectType {
	void _kill_pointed() {
		delete $self;
	}
};
%extend IFSelect_SelectType {
	Handle_IFSelect_SelectType GetHandle() {
	return *(Handle_IFSelect_SelectType*) &$self;
	}
};

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
    IFSelect_SelectType* GetObject() {
    return (IFSelect_SelectType*)$self->Access();
    }
};
%feature("shadow") Handle_IFSelect_SelectType::~Handle_IFSelect_SelectType %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_IFSelect_SelectType {
    void _kill_pointed() {
        delete $self;
    }
};

