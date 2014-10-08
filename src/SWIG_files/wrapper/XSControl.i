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
%module (package="OCC") XSControl

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

%include XSControl_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%rename(xscontrol) XSControl;
%nodefaultctor XSControl;
class XSControl {
	public:
		%feature("autodoc", "Args:
	pilot(Handle_IFSelect_SessionPilot)

Returns:
	static Handle_XSControl_WorkSession

Returns the WorkSession of a SessionPilot, but casts it as  
          from XSControl : it then gives access to Control & Transfers") Session;
		static Handle_XSControl_WorkSession Session (const Handle_IFSelect_SessionPilot & pilot);
		%feature("autodoc", "Args:
	pilot(Handle_IFSelect_SessionPilot)

Returns:
	static Handle_XSControl_Vars

Returns the Vars of a SessionPilot, it is brought by Session  
          it provides access to external variables") Vars;
		static Handle_XSControl_Vars Vars (const Handle_IFSelect_SessionPilot & pilot);
};


%feature("shadow") XSControl::~XSControl %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend XSControl {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor XSControl_ConnectedShapes;
class XSControl_ConnectedShapes : public IFSelect_SelectExplore {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates a Selection ConnectedShapes. It remains to be set a  
          TransferReader") XSControl_ConnectedShapes;
		 XSControl_ConnectedShapes ();
		%feature("autodoc", "Args:
	TR(Handle_XSControl_TransferReader)

Returns:
	None

Creates a Selection ConnectedShapes, which will work with the  
          current TransferProcess brought by the TransferReader") XSControl_ConnectedShapes;
		 XSControl_ConnectedShapes (const Handle_XSControl_TransferReader & TR);
		%feature("autodoc", "Args:
	TR(Handle_XSControl_TransferReader)

Returns:
	None

Sets a TransferReader to sort entities : it brings the  
          TransferProcess which may change, while the TransferReader does not") SetReader;
		void SetReader (const Handle_XSControl_TransferReader & TR);
		%feature("autodoc", "Args:
	level(Standard_Integer)
	ent(Handle_Standard_Transient)
	G(Interface_Graph)
	explored(Interface_EntityIterator)

Returns:
	Standard_Boolean

Explores an entity : entities from which are connected to that  
          produced by this entity, including itself") Explore;
		Standard_Boolean Explore (const Standard_Integer level,const Handle_Standard_Transient & ent,const Interface_Graph & G,Interface_EntityIterator & explored);
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

Returns a text defining the criterium.  
          'Connected Entities through produced Shapes'") ExploreLabel;
		TCollection_AsciiString ExploreLabel ();
		%feature("autodoc", "Args:
	ashape(TopoDS_Shape)
	TP(Handle_Transfer_TransientProcess)
	type(TopAbs_ShapeEnum)

Returns:
	static Handle_TColStd_HSequenceOfTransient

This functions considers a shape from a transfer and performs  
          the search function explained above") AdjacentEntities;
		static Handle_TColStd_HSequenceOfTransient AdjacentEntities (const TopoDS_Shape & ashape,const Handle_Transfer_TransientProcess & TP,const TopAbs_ShapeEnum type);
};


%feature("shadow") XSControl_ConnectedShapes::~XSControl_ConnectedShapes %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend XSControl_ConnectedShapes {
	void _kill_pointed() {
		delete $self;
	}
};
%extend XSControl_ConnectedShapes {
	Handle_XSControl_ConnectedShapes GetHandle() {
	return *(Handle_XSControl_ConnectedShapes*) &$self;
	}
};

%nodefaultctor Handle_XSControl_ConnectedShapes;
class Handle_XSControl_ConnectedShapes : public Handle_IFSelect_SelectExplore {

    public:
        // constructors
        Handle_XSControl_ConnectedShapes();
        Handle_XSControl_ConnectedShapes(const Handle_XSControl_ConnectedShapes &aHandle);
        Handle_XSControl_ConnectedShapes(const XSControl_ConnectedShapes *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_XSControl_ConnectedShapes DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_XSControl_ConnectedShapes {
    XSControl_ConnectedShapes* GetObject() {
    return (XSControl_ConnectedShapes*)$self->Access();
    }
};
%feature("shadow") Handle_XSControl_ConnectedShapes::~Handle_XSControl_ConnectedShapes %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_XSControl_ConnectedShapes {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor XSControl_Controller;
class XSControl_Controller : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	longname(char *)
	shortname(char *)

Returns:
	None

Changes names  
          if a name is empty, the formerly set one remains  
          Remark : Does not call Record or AutoRecord") SetNames;
		void SetNames (const char * longname,const char * shortname);
		%feature("autodoc", "Args:
	None
Returns:
	None

Records <self> is a general dictionary under Short and Long  
          Names (see method Name)") AutoRecord;
		void AutoRecord ();
		%feature("autodoc", "Args:
	name(char *)

Returns:
	None

Records <self> in a general dictionary under a name  
          Error if <name> already used for another one") Record;
		void Record (const char * name);
		%feature("autodoc", "Args:
	name(char *)

Returns:
	static Handle_XSControl_Controller

Returns the Controller attached to a given name  
          Returns a Null Handle if <name> is unknown") Recorded;
		static Handle_XSControl_Controller Recorded (const char * name);
		%feature("autodoc", "Args:
	mode(Standard_Integer)=0

Returns:
	static Handle_TColStd_HSequenceOfHAsciiString

Returns the list of names of recorded norms, according to mode  
          = 0 (D) : all the recorded names  
          < 0 : for each distinct norm, its resource (short) name  
          > 0 : for each distinct norm, its complete (long)  name") ListRecorded;
		static Handle_TColStd_HSequenceOfHAsciiString ListRecorded (const Standard_Integer mode = 0);
		%feature("autodoc", "Args:
	rsc(Standard_Boolean)=Standard_False

Returns:
	char *

Returns a name, as given when initializing :  
          rsc = False (D) : True Name attached to the Norm (long name)  
          rsc = True : Name of the ressource set (i.e. short name)") Name;
		char * Name (const Standard_Boolean rsc = Standard_False);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_IFSelect_Profile

Returns the Profile  
          It starts with a first configuration Base (empty) and the  
          following options :  
          protocol    for the Protocol  
          sign-type   for the SignType (Default Signature for Type)  
          access      for the WorkLibrary  
          tr-read  for ActorRead  (import processor)  
          tr-write for ActorWrite (export processor)") Profile;
		Handle_IFSelect_Profile Profile ();
		%feature("autodoc", "Args:
	confname(char *)

Returns:
	None

Considers the current state of the Controller as defining a  
          configuration, newly created or already existing") DefineProfile;
		void DefineProfile (const char * confname);
		%feature("autodoc", "Args:
	confname(char *)

Returns:
	Standard_Boolean

Sets the Controller in a given Configuration of its Profile  
          Calls SettingProfile (which can be redefined)  
 
          Returns True if done, False if <confname> unknown") SetProfile;
		Standard_Boolean SetProfile (const char * confname);
		%feature("autodoc", "Args:
	confname(char *)

Returns:
	virtual Standard_Boolean

This method is called by SetProfile, it can be redefined  
          for specific sub-class of Controller  
          The default does nothing") SettingProfile;
		virtual Standard_Boolean SettingProfile (const char * confname);
		%feature("autodoc", "Args:
	WS(Handle_XSControl_WorkSession)
	confname(char *)

Returns:
	Standard_Boolean

Applies a Configuration of the Profile to the WorkSession  
          I.E. calls SetProfile then fills WorkSession with definitions") ApplyProfile;
		Standard_Boolean ApplyProfile (const Handle_XSControl_WorkSession & WS,const char * confname);
		%feature("autodoc", "Args:
	WS(Handle_XSControl_WorkSession)
	confname(char *)

Returns:
	virtual Standard_Boolean

Called by ApplyProfile, can be redefined for specific  
          sub-class of Controller  
          The default does nothing") ApplyingProfile;
		virtual Standard_Boolean ApplyingProfile (const Handle_XSControl_WorkSession & WS,const char * confname);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Interface_Protocol

Returns the Protocol attached to the Norm (from field)") Protocol;
		Handle_Interface_Protocol Protocol ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_IFSelect_Signature

Returns the SignType attached to the norm (from field)") SignType;
		Handle_IFSelect_Signature SignType ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_IFSelect_WorkLibrary

Returns the WorkLibrary attached to the Norm. Remark that it  
          has to be in phase with the Protocol  (read from field)") WorkLibrary;
		Handle_IFSelect_WorkLibrary WorkLibrary ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Handle_Interface_InterfaceModel

Creates a new empty Model ready to receive data of the Norm  
          Used to write data from Imagine to an interface file") NewModel;
		virtual Handle_Interface_InterfaceModel NewModel ();
		%feature("autodoc", "Args:
	model(Handle_Interface_InterfaceModel)

Returns:
	virtual Handle_Transfer_ActorOfTransientProcess

Returns the Actor for Read attached to the pair (norm,appli)  
          It can be adapted for data of the input Model, as required  
          Can be read from field then adapted with Model as required") ActorRead;
		virtual Handle_Transfer_ActorOfTransientProcess ActorRead (const Handle_Interface_InterfaceModel & model);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Handle_Transfer_ActorOfFinderProcess

Returns the Actor for Write attached to the pair (norm,appli)  
          Read from field. Can be redefined") ActorWrite;
		virtual Handle_Transfer_ActorOfFinderProcess ActorWrite ();
		%feature("autodoc", "Args:
	mode(Standard_Integer)
	criter(char *)=

Returns:
	virtual void

Updates static values  
          <mode> precises the kind of updating : (see Items from Static)  
          -1 : a precise static item : criter = its name  
          0  : all items of a family : criter = the family name  
          1  : all items which match regexp name : criter = regexp name  
          By default (criter empty) should consider all relevant statics  
          If <name> is defined, can consider only this static item  
          The provided default method does nothing, to be redefined") UpdateStatics;
		virtual void UpdateStatics (const Standard_Integer mode,const char * criter = "");
		%feature("autodoc", "Args:
	modemin(Standard_Integer)
	modemax(Standard_Integer)
	shape(Standard_Boolean)=Standard_True

Returns:
	None

Sets mininum and maximum values for modetrans (write)  
          Erases formerly recorded bounds and values  
          Actually only for shape  
          Then, for each value a little help can be attached") SetModeWrite;
		void SetModeWrite (const Standard_Integer modemin,const Standard_Integer modemax,const Standard_Boolean shape = Standard_True);
		%feature("autodoc", "Args:
	modetrans(Standard_Integer)
	help(char *)
	shape(Standard_Boolean)=Standard_True

Returns:
	None

Attaches a short line of help to a value of modetrans (write)") SetModeWriteHelp;
		void SetModeWriteHelp (const Standard_Integer modetrans,const char * help,const Standard_Boolean shape = Standard_True);
		%feature("autodoc", "Args:
	modemin(Standard_Integer)
	modemax(Standard_Integer)
	shape(Standard_Boolean)=Standard_True

Returns:
	Standard_Boolean

Returns recorded min and max values for modetrans (write)  
          Actually only for shapes  
          Returns True if bounds are set, False else (then, free value)") ModeWriteBounds;
		Standard_Boolean ModeWriteBounds (Standard_Integer &OutValue,Standard_Integer &OutValue,const Standard_Boolean shape = Standard_True);
		%feature("autodoc", "Args:
	modetrans(Standard_Integer)
	shape(Standard_Boolean)=Standard_True

Returns:
	Standard_Boolean

Tells if a value of <modetrans> is a good value(within bounds)  
          Actually only for shapes") IsModeWrite;
		Standard_Boolean IsModeWrite (const Standard_Integer modetrans,const Standard_Boolean shape = Standard_True);
		%feature("autodoc", "Args:
	modetrans(Standard_Integer)
	shape(Standard_Boolean)=Standard_True

Returns:
	char *

Returns the help line recorded for a value of modetrans  
          empty if help not defined or not within bounds or if values are free") ModeWriteHelp;
		char * ModeWriteHelp (const Standard_Integer modetrans,const Standard_Boolean shape = Standard_True);
		%feature("autodoc", "Args:
	obj(Handle_Standard_Transient)
	modetrans(Standard_Integer)=0

Returns:
	virtual Standard_Boolean

Tells if <obj> (an application object) is a valid candidate  
          for a transfer to a Model.  
          By default, asks the ActorWrite if known (through a  
          TransientMapper). Can be redefined") RecognizeWriteTransient;
		virtual Standard_Boolean RecognizeWriteTransient (const Handle_Standard_Transient & obj,const Standard_Integer modetrans = 0);
		%feature("autodoc", "Args:
	obj(Handle_Standard_Transient)
	FP(Handle_Transfer_FinderProcess)
	model(Handle_Interface_InterfaceModel)
	modetrans(Standard_Integer)=0

Returns:
	virtual IFSelect_ReturnStatus

Takes one Transient Object and transfers it to an  
            InterfaceModel (already created, e.g. by NewModel)  
          (result is recorded in the model by AddWithRefs)  
          FP records produced results and checks  
 
          Default uses ActorWrite; can be redefined as necessary  
          Returned value is a status, as follows :  
            0  OK ,  1 No Result ,  2 Fail (e.g. exception raised)  
            -1 bad conditions ,  -2 bad model or null model  
          For type of object not recognized : should return 1") TransferWriteTransient;
		virtual IFSelect_ReturnStatus TransferWriteTransient (const Handle_Standard_Transient & obj,const Handle_Transfer_FinderProcess & FP,const Handle_Interface_InterfaceModel & model,const Standard_Integer modetrans = 0);
		%feature("autodoc", "Args:
	shape(TopoDS_Shape)
	modetrans(Standard_Integer)=0

Returns:
	virtual Standard_Boolean

Tells if a shape is valid for a transfer to a model  
          Asks the ActorWrite (through a ShapeMapper)") RecognizeWriteShape;
		virtual Standard_Boolean RecognizeWriteShape (const TopoDS_Shape & shape,const Standard_Integer modetrans = 0);
		%feature("autodoc", "Args:
	shape(TopoDS_Shape)
	FP(Handle_Transfer_FinderProcess)
	model(Handle_Interface_InterfaceModel)
	modetrans(Standard_Integer)=0

Returns:
	virtual IFSelect_ReturnStatus

Takes one Shape and transfers it to an  
            InterfaceModel (already created, e.g. by NewModel)  
          Default uses ActorWrite; can be redefined as necessary  
          Returned value is a status, as follows :  
            Done  OK ,  Void : No Result ,  Fail : Fail (e.g. exception)  
            Error : bad conditions , bad model or null model  
 Resolution of file clusters  
 According to each norm, there can (or not) be files of which  
 definition is not complete but refers to other files : this defines  
 a file cluster.  
 It can then be resolved by two calls :  
 - ClusterContext prepares the resolution, specific of each case  
 - ResolveCluster performs the resolution, its result consists in  
   having all data gathered in one final model") TransferWriteShape;
		virtual IFSelect_ReturnStatus TransferWriteShape (const TopoDS_Shape & shape,const Handle_Transfer_FinderProcess & FP,const Handle_Interface_InterfaceModel & model,const Standard_Integer modetrans = 0);
		%feature("autodoc", "Args:
	WS(Handle_XSControl_WorkSession)

Returns:
	virtual Handle_Standard_Transient

Prepares and returns a context to resolve a cluster  
          All data to be used are detained by the WorkSession  
          The definition of this context is free and proper to each case  
          remark that it is aimed to be used in ResolveCluster  
 
          The context must be prepared, but resolution must not have  
          began  
 
          If no cluster has to be resolved, should return a null handle  
          This is the default case, which can be redefined") ClusterContext;
		virtual Handle_Standard_Transient ClusterContext (const Handle_XSControl_WorkSession & WS);
		%feature("autodoc", "Args:
	WS(Handle_XSControl_WorkSession)
	context(Handle_Standard_Transient)

Returns:
	virtual Interface_CheckIterator

Performs the resolution itself, from the starting data and  
          the cluster context  
 
          Can fill a CheckList as necessary (especially when one or  
          more references remain unresolved)  
 
          Default does nothing and returns an empty CheckList") ResolveCluster;
		virtual Interface_CheckIterator ResolveCluster (const Handle_XSControl_WorkSession & WS,const Handle_Standard_Transient & context);
		%feature("autodoc", "Args:
	item(Handle_Standard_Transient)
	name(char *)

Returns:
	None

Adds an item in the control list  
          A control item of a controller is accessed by its name which  
          is specific of a kind of item (i.e. a kind of functionnality)  
          Adds or replaces if <name> is already recorded") AddControlItem;
		void AddControlItem (const Handle_Standard_Transient & item,const char * name);
		%feature("autodoc", "Args:
	name(char *)

Returns:
	Handle_Standard_Transient

Returns a control item from its name, Null if <name> unknown  
          To be used then, it just remains to be down-casted") ControlItem;
		Handle_Standard_Transient ControlItem (const char * name);
		%feature("autodoc", "Args:
	name(char *)
	use(Standard_Integer)

Returns:
	None

Records the name of a Static to be traced for a given use") TraceStatic;
		void TraceStatic (const char * name,const Standard_Integer use);
		%feature("autodoc", "Args:
	item(Handle_Standard_Transient)
	name(char *)
	setapplied(char *)=

Returns:
	None

Records a Session Item, to be added for customisation of the  
          Work Session. It must have a specific name.  
          <setapplied> is used if <item> is a GeneralModifier, to decide  
          to which hook list it will be applied, if not empty (else,  
          not applied to any hook list)  
          ACTUAL : only one hook list is managed : 'send'  
          Remark : this method is to be called at Create time, the  
          recorded items will be used by Customise  
 Warning : if <name> conflicts, the last recorded item is kept") AddSessionItem;
		void AddSessionItem (const Handle_Standard_Transient & item,const char * name,const char * setapplied = "");
		%feature("autodoc", "Args:
	name(char *)

Returns:
	Handle_Standard_Transient

Returns an item given its name to record in a Session  
          If <name> is unknown, returns a Null Handle") SessionItem;
		Handle_Standard_Transient SessionItem (const char * name);
		%feature("autodoc", "Args:
	item(Handle_Standard_Transient)

Returns:
	Standard_Boolean

Returns True if <item> is recorded as <setapplied = True>") IsApplied;
		Standard_Boolean IsApplied (const Handle_Standard_Transient & item);
		%feature("autodoc", "Args:
	WS(Handle_XSControl_WorkSession)

Returns:
	virtual void

Customises a WorkSession, by adding to it the recorded items  
          (by AddSessionItem), then by calling a specific method  
          Customising, set by default to do nothing") Customise;
		virtual void Customise (Handle_XSControl_WorkSession & WS);
		%feature("autodoc", "Args:
	WS(Handle_XSControl_WorkSession)

Returns:
	None

Specific customisation method, which can be redefined  
          Default does nothing") Customising;
		void Customising (Handle_XSControl_WorkSession & WS);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Dico_DictionaryOfTransient

No detailed docstring for this function.") AdaptorSession;
		Handle_Dico_DictionaryOfTransient AdaptorSession ();
};


%feature("shadow") XSControl_Controller::~XSControl_Controller %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend XSControl_Controller {
	void _kill_pointed() {
		delete $self;
	}
};
%extend XSControl_Controller {
	Handle_XSControl_Controller GetHandle() {
	return *(Handle_XSControl_Controller*) &$self;
	}
};

%nodefaultctor Handle_XSControl_Controller;
class Handle_XSControl_Controller : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_XSControl_Controller();
        Handle_XSControl_Controller(const Handle_XSControl_Controller &aHandle);
        Handle_XSControl_Controller(const XSControl_Controller *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_XSControl_Controller DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_XSControl_Controller {
    XSControl_Controller* GetObject() {
    return (XSControl_Controller*)$self->Access();
    }
};
%feature("shadow") Handle_XSControl_Controller::~Handle_XSControl_Controller %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_XSControl_Controller {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor XSControl_FuncShape;
class XSControl_FuncShape {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	static void

Defines and loads all functions which work on shapes for XSControl (as ActFunc)") Init;
		static void Init ();
		%feature("autodoc", "Args:
	session(Handle_XSControl_WorkSession)
	list(Handle_TopTools_HSequenceOfShape)
	name(char *)

Returns:
	static Standard_Integer

Analyses a name as designating Shapes from a Vars or from  
          XSTEP transfer (last Transfer on Reading). <name> can be :  
          '*' : all the root shapes produced by last Transfer (Read)  
                i.e. considers roots of the TransientProcess  
          a name : a name of a variable DRAW  
 
          Returns the count of designated Shapes. Their list is put in  
          <list>. If <list> is null, it is firstly created. Then it is  
          completed (Append without Clear) by the Shapes found  
          Returns 0 if no Shape could be found") MoreShapes;
		static Standard_Integer MoreShapes (const Handle_XSControl_WorkSession & session,Handle_TopTools_HSequenceOfShape & list,const char * name);
		%feature("autodoc", "Args:
	session(Handle_XSControl_WorkSession)
	file(char *)
	var(char *)
	def(char *)
	resfile(TCollection_AsciiString)
	resvar(TCollection_AsciiString)

Returns:
	static Standard_Boolean

Analyses given file name and variable name, with a default  
          name for variables. Returns resulting file name and variable  
          name plus status 'file to read'(True) or 'already read'(False)  
          In the latter case, empty resfile means no file available  
 
          If <file> is null or empty or equates '.', considers Session  
            and returned status is False  
          Else, returns resfile = file and status is True  
          If <var> is neither null nor empty, resvar = var  
          Else, the root part of <resfile> is considered, if defined  
          Else, <def> is taken") FileAndVar;
		static Standard_Boolean FileAndVar (const Handle_XSControl_WorkSession & session,const char * file,const char * var,const char * def,TCollection_AsciiString & resfile,TCollection_AsciiString & resvar);
};


%feature("shadow") XSControl_FuncShape::~XSControl_FuncShape %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend XSControl_FuncShape {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor XSControl_Functions;
class XSControl_Functions {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	static void

Defines and loads all functions for XSControl (as ActFunc)") Init;
		static void Init ();
};


%feature("shadow") XSControl_Functions::~XSControl_Functions %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend XSControl_Functions {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor XSControl_Reader;
class XSControl_Reader {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates a Reader from scratch (creates an empty WorkSession)  
          A WorkSession or a Controller must be provided before running") XSControl_Reader;
		 XSControl_Reader ();
		%feature("autodoc", "Args:
	norm(char *)

Returns:
	None

Creates a Reader from scratch, with a norm name which  
          identifies a Controller") XSControl_Reader;
		 XSControl_Reader (const char * norm);
		%feature("autodoc", "Args:
	WS(Handle_XSControl_WorkSession)
	scratch(Standard_Boolean)=Standard_True

Returns:
	None

Creates a Reader from an already existing Session, with a  
          Controller already set  Virtual destructor") XSControl_Reader;
		 XSControl_Reader (const Handle_XSControl_WorkSession & WS,const Standard_Boolean scratch = Standard_True);
		%feature("autodoc", "Args:
	norm(char *)

Returns:
	Standard_Boolean

Sets a specific norm to <self>  
          Returns True if done, False if <norm> is not available") SetNorm;
		Standard_Boolean SetNorm (const char * norm);
		%feature("autodoc", "Args:
	WS(Handle_XSControl_WorkSession)
	scratch(Standard_Boolean)=Standard_True

Returns:
	None

Sets a specific session to <self>") SetWS;
		void SetWS (const Handle_XSControl_WorkSession & WS,const Standard_Boolean scratch = Standard_True);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_XSControl_WorkSession

Returns the session used in <self>") WS;
		Handle_XSControl_WorkSession WS ();
		%feature("autodoc", "Args:
	filename(char *)

Returns:
	IFSelect_ReturnStatus

Loads a file and returns the read status  
          Zero for a Model which compies with the Controller") ReadFile;
		IFSelect_ReturnStatus ReadFile (const char * filename);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Interface_InterfaceModel

Returns the model. It can then be consulted (header, product)") Model;
		Handle_Interface_InterfaceModel Model ();
		%feature("autodoc", "Args:
	first(char *)=
	second(char *)=

Returns:
	Handle_TColStd_HSequenceOfTransient

Returns a list of entities from the IGES or STEP file  
according to the following rules:  
- if first and second are empty strings, the whole file is selected.  
- if first is an entity number or label, the entity referred to is selected.  
- if first is a list of entity numbers/labels separated by commas, the entities referred to are selected,  
- if first is the name of a selection in the worksession and second is not defined,  
the list contains the standard output for that selection.  
- if first is the name of a selection and second is defined, the criterion defined  
by second is applied to the result of the first selection.  
 A selection is an operator which computes a list of entities from a list given in  
input according to its type. If no list is specified, the selection computes its  
list of entities from the whole model.  
  A selection can be:  
- A predefined selection (xst-transferrable-mode)  
- A filter based on a signature  
A Signature is an operator which returns a string from an entity according to its type. For example:  
- 'xst-type' (CDL)  
- 'iges-level'  
- 'step-type'.  
For example, if you wanted to select only the advanced_faces in a STEP file you  
would use the following code:  
Example  
Reader.GiveList('xst-transferrable-roots','step-type(ADVANCED_FACE)');  
Warning  
If the value given to second is incorrect, it will simply be ignored.") GiveList;
		Handle_TColStd_HSequenceOfTransient GiveList (const char * first = "",const char * second = "");
		%feature("autodoc", "Args:
	first(char *)
	ent(Handle_Standard_Transient)

Returns:
	Handle_TColStd_HSequenceOfTransient

Computes a List of entities from the model as follows  
          <first> beeing a Selection, <ent> beeing an entity or a list  
          of entities (as a HSequenceOfTransient) :  
            the standard result of this selection applied to this list  
          if <first> is erroneous, a null handle is returned") GiveList;
		Handle_TColStd_HSequenceOfTransient GiveList (const char * first,const Handle_Standard_Transient & ent);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Integer

Determines the list of root entities which are candidate for  
          a transfer to a Shape, and returns the number  
          of entities in the list") NbRootsForTransfer;
		virtual Standard_Integer NbRootsForTransfer ();
		%feature("autodoc", "Args:
	num(Standard_Integer)=1

Returns:
	Handle_Standard_Transient

Returns an IGES or STEP root  
          entity for translation. The entity is identified by its  
          rank in a list.") RootForTransfer;
		Handle_Standard_Transient RootForTransfer (const Standard_Integer num = 1);
		%feature("autodoc", "Args:
	num(Standard_Integer)=1

Returns:
	Standard_Boolean

Translates a root identified by the rank num in the model.  
          false is returned if no shape is produced.") TransferOneRoot;
		Standard_Boolean TransferOneRoot (const Standard_Integer num = 1);
		%feature("autodoc", "Args:
	num(Standard_Integer)

Returns:
	Standard_Boolean

Translates an IGES or STEP  
          entity identified by the rank num in the model.  
          false is returned if no shape is produced.") TransferOne;
		Standard_Boolean TransferOne (const Standard_Integer num);
		%feature("autodoc", "Args:
	start(Handle_Standard_Transient)

Returns:
	Standard_Boolean

Translates an IGES or STEP  
          entity in the model. true is returned if a shape is  
          produced; otherwise, false is returned.") TransferEntity;
		Standard_Boolean TransferEntity (const Handle_Standard_Transient & start);
		%feature("autodoc", "Args:
	list(Handle_TColStd_HSequenceOfTransient)

Returns:
	Standard_Integer

Translates a list of entities.  
          Returns the number of IGES or STEP entities that were  
          successfully translated. The list can be produced with GiveList.  
          Warning - This function does not clear the existing output shapes.") TransferList;
		Standard_Integer TransferList (const Handle_TColStd_HSequenceOfTransient & list);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Translates all translatable  
          roots and returns the number of successful translations.  
          Warning - This function clears existing output shapes first.") TransferRoots;
		Standard_Integer TransferRoots ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Clears the list of shapes that  
          may have accumulated in calls to TransferOne or TransferRoot.C") ClearShapes;
		void ClearShapes ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the number of shapes produced by translation.") NbShapes;
		Standard_Integer NbShapes ();
		%feature("autodoc", "Args:
	num(Standard_Integer)=1

Returns:
	TopoDS_Shape

Returns the shape resulting  
from a translation and identified by the rank num.  
num equals 1 by default. In other words, the first shape  
resulting from the translation is returned.") Shape;
		TopoDS_Shape Shape (const Standard_Integer num = 1);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

Returns all of the results in  
a single shape which is:  
- a null shape if there are no results,  
- a shape if there is one result,  
- a compound containing the resulting shapes if there are more than one.") OneShape;
		TopoDS_Shape OneShape ();
		%feature("autodoc", "Args:
	failsonly(Standard_Boolean)
	mode(IFSelect_PrintCount)

Returns:
	None

Prints the check list attached to loaded data, on the Standard  
           Trace File (starts at cout)  
          All messages or fails only, according to <failsonly>  
          mode = 0 : per entity, prints messages  
          mode = 1 : per message, just gives count of entities per check  
          mode = 2 : also gives entity numbers") PrintCheckLoad;
		void PrintCheckLoad (const Standard_Boolean failsonly,const IFSelect_PrintCount mode);
		%feature("autodoc", "Args:
	failsonly(Standard_Boolean)
	mode(IFSelect_PrintCount)

Returns:
	None

Displays check results for the  
last translation of IGES or STEP entities to Open CASCADE  
entities. Only fail messages are displayed if failsonly is  
true. All messages are displayed if failsonly is  
false. mode determines the contents and the order of the  
messages according to the terms of the IFSelect_PrintCount enumeration.") PrintCheckTransfer;
		void PrintCheckTransfer (const Standard_Boolean failsonly,const IFSelect_PrintCount mode);
		%feature("autodoc", "Args:
	what(Standard_Integer)
	mode(Standard_Integer)=0

Returns:
	None

Displays the statistics for  
the last translation. what defines the kind of  
statistics that are displayed as follows:  
- 0 gives general statistics (number of translated roots,  
number of warnings, number of fail messages),  
- 1 gives root results,  
   - 2 gives statistics for all checked entities,  
- 3 gives the list of translated entities,  
- 4 gives warning and fail messages,  
- 5 gives fail messages only.  
The use of mode depends on the value of what. If what is 0,  
mode is ignored. If what is 1, 2 or 3, mode defines the following:  
- 0 lists the numbers of IGES or STEP entities in the respective model  
- 1 gives the number, identifier, type and result  
type for each IGES or STEP entity and/or its status  
(fail, warning, etc.)  
- 2 gives maximum information for each IGES or STEP entity (i.e. checks)  
- 3 gives the number of entities per type of IGES or STEP entity  
- 4 gives the number of IGES or STEP entities per result type and/or status  
- 5 gives the number of pairs (IGES or STEP or result type and status)  
- 6 gives the number of pairs (IGES or STEP or result type  
and status) AND the list of entity numbers in the IGES or STEP model.  
  If what is 4 or 5, mode defines the warning and fail  
messages as follows:  
- if mode is 0 all warnings and checks per entity are returned  
- if mode is 2 the list of entities per warning is returned.  
  If mode is not set, only the list of all entities per warning is given.") PrintStatsTransfer;
		void PrintStatsTransfer (const Standard_Integer what,const Standard_Integer mode = 0);
		%feature("autodoc", "Args:
	list(Handle_TColStd_HSequenceOfTransient)
	nbMapped(Standard_Integer)
	nbWithResult(Standard_Integer)
	nbWithFail(Standard_Integer)

Returns:
	None

Gives statistics about Transfer") GetStatsTransfer;
		void GetStatsTransfer (const Handle_TColStd_HSequenceOfTransient & list,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue);
};


%feature("shadow") XSControl_Reader::~XSControl_Reader %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend XSControl_Reader {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor XSControl_SelectForTransfer;
class XSControl_SelectForTransfer : public IFSelect_SelectExtract {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates a SelectForTransfer, non initialised  
          it sorts nothing, unless an Actor has been defined") XSControl_SelectForTransfer;
		 XSControl_SelectForTransfer ();
		%feature("autodoc", "Args:
	TR(Handle_XSControl_TransferReader)

Returns:
	None

Creates a SelectForTransfer, which will work with the  
          currently defined Actor brought by the TransferReader") XSControl_SelectForTransfer;
		 XSControl_SelectForTransfer (const Handle_XSControl_TransferReader & TR);
		%feature("autodoc", "Args:
	TR(Handle_XSControl_TransferReader)

Returns:
	None

Sets a TransferReader to sort entities : it brings the Actor,  
          which may change, while the TransferReader does not") SetReader;
		void SetReader (const Handle_XSControl_TransferReader & TR);
		%feature("autodoc", "Args:
	act(Handle_Transfer_ActorOfTransientProcess)

Returns:
	None

Sets a precise actor to sort entities  
          This definition oversedes the creation with a TransferReader") SetActor;
		void SetActor (const Handle_Transfer_ActorOfTransientProcess & act);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Transfer_ActorOfTransientProcess

Returns the Actor used as precised one.  
          Returns a Null Handle for a creation from a TransferReader  
          without any further setting") Actor;
		Handle_Transfer_ActorOfTransientProcess Actor ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_XSControl_TransferReader

Returns the Reader (if created with a Reader)  
          Returns a Null Handle if not created with a Reader") Reader;
		Handle_XSControl_TransferReader Reader ();
		%feature("autodoc", "Args:
	rank(Standard_Integer)
	ent(Handle_Standard_Transient)
	model(Handle_Interface_InterfaceModel)

Returns:
	Standard_Boolean

Returns True for an Entity which is recognized by the Actor,  
          either the precised one, or the one defined by TransferReader") Sort;
		Standard_Boolean Sort (const Standard_Integer rank,const Handle_Standard_Transient & ent,const Handle_Interface_InterfaceModel & model);
		%feature("autodoc", "Args:
	None
Returns:
	TCollection_AsciiString

Returns a text defining the criterium : 'Recognized for Transfer [(current actor)]'") ExtractLabel;
		TCollection_AsciiString ExtractLabel ();
};


%feature("shadow") XSControl_SelectForTransfer::~XSControl_SelectForTransfer %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend XSControl_SelectForTransfer {
	void _kill_pointed() {
		delete $self;
	}
};
%extend XSControl_SelectForTransfer {
	Handle_XSControl_SelectForTransfer GetHandle() {
	return *(Handle_XSControl_SelectForTransfer*) &$self;
	}
};

%nodefaultctor Handle_XSControl_SelectForTransfer;
class Handle_XSControl_SelectForTransfer : public Handle_IFSelect_SelectExtract {

    public:
        // constructors
        Handle_XSControl_SelectForTransfer();
        Handle_XSControl_SelectForTransfer(const Handle_XSControl_SelectForTransfer &aHandle);
        Handle_XSControl_SelectForTransfer(const XSControl_SelectForTransfer *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_XSControl_SelectForTransfer DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_XSControl_SelectForTransfer {
    XSControl_SelectForTransfer* GetObject() {
    return (XSControl_SelectForTransfer*)$self->Access();
    }
};
%feature("shadow") Handle_XSControl_SelectForTransfer::~Handle_XSControl_SelectForTransfer %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_XSControl_SelectForTransfer {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor XSControl_SignTransferStatus;
class XSControl_SignTransferStatus : public IFSelect_Signature {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates a SignTransferStatus, not initialised  
          it gives nothing (empty string)") XSControl_SignTransferStatus;
		 XSControl_SignTransferStatus ();
		%feature("autodoc", "Args:
	TR(Handle_XSControl_TransferReader)

Returns:
	None

Creates a SignTransferStatus, which will work on the current  
          TransientProcess brought by the TransferReader (its MapReader)") XSControl_SignTransferStatus;
		 XSControl_SignTransferStatus (const Handle_XSControl_TransferReader & TR);
		%feature("autodoc", "Args:
	TR(Handle_XSControl_TransferReader)

Returns:
	None

Sets a TransferReader to work") SetReader;
		void SetReader (const Handle_XSControl_TransferReader & TR);
		%feature("autodoc", "Args:
	TP(Handle_Transfer_TransientProcess)

Returns:
	None

Sets a precise map to sign entities  
          This definition oversedes the creation with a TransferReader") SetMap;
		void SetMap (const Handle_Transfer_TransientProcess & TP);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Transfer_TransientProcess

Returns the TransientProcess used as precised one  
          Returns a Null Handle for a creation from a TransferReader  
          without any further setting") Map;
		Handle_Transfer_TransientProcess Map ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_XSControl_TransferReader

Returns the Reader (if created with a Reader)  
          Returns a Null Handle if not created with a Reader") Reader;
		Handle_XSControl_TransferReader Reader ();
		%feature("autodoc", "Args:
	ent(Handle_Standard_Transient)
	model(Handle_Interface_InterfaceModel)

Returns:
	char *

Returns the Signature for a Transient object, as its transfer  
          status") Value;
		char * Value (const Handle_Standard_Transient & ent,const Handle_Interface_InterfaceModel & model);
};


%feature("shadow") XSControl_SignTransferStatus::~XSControl_SignTransferStatus %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend XSControl_SignTransferStatus {
	void _kill_pointed() {
		delete $self;
	}
};
%extend XSControl_SignTransferStatus {
	Handle_XSControl_SignTransferStatus GetHandle() {
	return *(Handle_XSControl_SignTransferStatus*) &$self;
	}
};

%nodefaultctor Handle_XSControl_SignTransferStatus;
class Handle_XSControl_SignTransferStatus : public Handle_IFSelect_Signature {

    public:
        // constructors
        Handle_XSControl_SignTransferStatus();
        Handle_XSControl_SignTransferStatus(const Handle_XSControl_SignTransferStatus &aHandle);
        Handle_XSControl_SignTransferStatus(const XSControl_SignTransferStatus *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_XSControl_SignTransferStatus DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_XSControl_SignTransferStatus {
    XSControl_SignTransferStatus* GetObject() {
    return (XSControl_SignTransferStatus*)$self->Access();
    }
};
%feature("shadow") Handle_XSControl_SignTransferStatus::~Handle_XSControl_SignTransferStatus %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_XSControl_SignTransferStatus {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor XSControl_TransferReader;
class XSControl_TransferReader : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates a TransferReader, empty") XSControl_TransferReader;
		 XSControl_TransferReader ();
		%feature("autodoc", "Args:
	control(Handle_XSControl_Controller)

Returns:
	None

Sets a Controller. It is required to generate the Actor.  
          Elsewhere, the Actor must be provided directly") SetController;
		void SetController (const Handle_XSControl_Controller & control);
		%feature("autodoc", "Args:
	actor(Handle_Transfer_ActorOfTransientProcess)

Returns:
	None

Sets the Actor directly : this value will be used if the  
          Controller is not set") SetActor;
		void SetActor (const Handle_Transfer_ActorOfTransientProcess & actor);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Transfer_ActorOfTransientProcess

Returns the Actor, determined by the Controller, or if this  
          one is unknown, directly set.  
          Once it has been defined, it can then be edited.") Actor;
		Handle_Transfer_ActorOfTransientProcess Actor ();
		%feature("autodoc", "Args:
	model(Handle_Interface_InterfaceModel)

Returns:
	None

Sets an InterfaceModel. This causes former results, computed  
          from another one, to be lost (see also Clear)") SetModel;
		void SetModel (const Handle_Interface_InterfaceModel & model);
		%feature("autodoc", "Args:
	graph(Handle_Interface_HGraph)

Returns:
	None

Sets a Graph and its InterfaceModel (calls SetModel)") SetGraph;
		void SetGraph (const Handle_Interface_HGraph & graph);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Interface_InterfaceModel

Returns the currently set InterfaceModel") Model;
		Handle_Interface_InterfaceModel Model ();
		%feature("autodoc", "Args:
	name(char *)
	ctx(Handle_Standard_Transient)

Returns:
	None

Sets a Context : according to receiving appli, to be  
          interpreted by the Actor") SetContext;
		void SetContext (const char * name,const Handle_Standard_Transient & ctx);
		%feature("autodoc", "Args:
	name(char *)
	type(Handle_Standard_Type)
	ctx(Handle_Standard_Transient)

Returns:
	Standard_Boolean

Returns the Context attached to a name, if set and if it is  
          Kind of the type, else a Null Handle  
          Returns True if OK, False if no Context") GetContext;
		Standard_Boolean GetContext (const char * name,const Handle_Standard_Type & type,Handle_Standard_Transient & ctx);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Dico_DictionaryOfTransient

Returns (modifiable) the whole definition of Context  
          Rather for internal use (ex.: preparing and setting in once)") Context;
		Handle_Dico_DictionaryOfTransient & Context ();
		%feature("autodoc", "Args:
	name(char *)

Returns:
	None

Sets a new value for (loaded) file name") SetFileName;
		void SetFileName (const char * name);
		%feature("autodoc", "Args:
	None
Returns:
	char *

Returns actual value of file name") FileName;
		char * FileName ();
		%feature("autodoc", "Args:
	mode(Standard_Integer)

Returns:
	None

Clears data, according mode :  
          -1 all  
           0 nothing done  
          +1 final results  
          +2 working data (model, context, transfer process)") Clear;
		void Clear (const Standard_Integer mode);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Transfer_TransientProcess

Returns the currently used TransientProcess  
          It is computed from the model by TransferReadRoots, or by  
          BeginTransferRead") TransientProcess;
		Handle_Transfer_TransientProcess TransientProcess ();
		%feature("autodoc", "Args:
	TP(Handle_Transfer_TransientProcess)

Returns:
	None

Forces the TransientProcess  
          Remark : it also changes the Model and the Actor, from those  
          recorded in the new TransientProcess") SetTransientProcess;
		void SetTransientProcess (const Handle_Transfer_TransientProcess & TP);
		%feature("autodoc", "Args:
	ent(Handle_Standard_Transient)

Returns:
	Standard_Boolean

Records a final result of transferring an entity  
          This result is recorded as a ResultFromModel, taken from  
          the TransientProcess  
          Returns True if a result is available, False else") RecordResult;
		Standard_Boolean RecordResult (const Handle_Standard_Transient & ent);
		%feature("autodoc", "Args:
	ent(Handle_Standard_Transient)

Returns:
	Standard_Boolean

Returns True if a final result is recorded for an entity  
          Remark that it can bring no effective result if transfer has  
          completely failed (FinalResult brings only fail messages ...)") IsRecorded;
		Standard_Boolean IsRecorded (const Handle_Standard_Transient & ent);
		%feature("autodoc", "Args:
	ent(Handle_Standard_Transient)

Returns:
	Standard_Boolean

Returns True if a final result is recorded AND BRINGS AN  
          EFFECTIVE RESULT (else, it brings only fail messages)") HasResult;
		Standard_Boolean HasResult (const Handle_Standard_Transient & ent);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TColStd_HSequenceOfTransient

Returns the list of entities to which a final result is  
          attached (i.e. processed by RecordResult)") RecordedList;
		Handle_TColStd_HSequenceOfTransient RecordedList ();
		%feature("autodoc", "Args:
	ent(Handle_Standard_Transient)

Returns:
	Standard_Boolean

Note that an entity has been required for transfer but no  
          result at all is available (typically : case not implemented)  
          It is not an error, but it gives a specific status : Skipped  
          Returns True if done, False if <ent> is not in starting model") Skip;
		Standard_Boolean Skip (const Handle_Standard_Transient & ent);
		%feature("autodoc", "Args:
	ent(Handle_Standard_Transient)

Returns:
	Standard_Boolean

Returns True if an entity is noted as skipped") IsSkipped;
		Standard_Boolean IsSkipped (const Handle_Standard_Transient & ent);
		%feature("autodoc", "Args:
	ent(Handle_Standard_Transient)

Returns:
	Standard_Boolean

Returns True if an entity has been asked for transfert, hence  
          it is marked, as : Recorded (a computation has ran, with or  
          without an effective result), or Skipped (case ignored)") IsMarked;
		Standard_Boolean IsMarked (const Handle_Standard_Transient & ent);
		%feature("autodoc", "Args:
	ent(Handle_Standard_Transient)

Returns:
	Handle_Transfer_ResultFromModel

Returns the final result recorded for an entity, as such") FinalResult;
		Handle_Transfer_ResultFromModel FinalResult (const Handle_Standard_Transient & ent);
		%feature("autodoc", "Args:
	ent(Handle_Standard_Transient)

Returns:
	char *

Returns the label attached to an entity recorded for final,  
          or an empty string if not recorded") FinalEntityLabel;
		char * FinalEntityLabel (const Handle_Standard_Transient & ent);
		%feature("autodoc", "Args:
	ent(Handle_Standard_Transient)

Returns:
	Standard_Integer

Returns the number attached to the entity recorded for final,  
          or zero if not recorded (looks in the ResultFromModel)") FinalEntityNumber;
		Standard_Integer FinalEntityNumber (const Handle_Standard_Transient & ent);
		%feature("autodoc", "Args:
	num(Standard_Integer)

Returns:
	Handle_Transfer_ResultFromModel

Returns the final result recorded for a NUMBER of entity  
          (internal use). Null if out of range") ResultFromNumber;
		Handle_Transfer_ResultFromModel ResultFromNumber (const Standard_Integer num);
		%feature("autodoc", "Args:
	ent(Handle_Standard_Transient)

Returns:
	Handle_Standard_Transient

Returns the resulting object as a Transient  
          Null Handle if no result or result not transient") TransientResult;
		Handle_Standard_Transient TransientResult (const Handle_Standard_Transient & ent);
		%feature("autodoc", "Args:
	ent(Handle_Standard_Transient)

Returns:
	TopoDS_Shape

Returns the resulting object as a Shape  
          Null Shape if no result or result not a shape") ShapeResult;
		TopoDS_Shape ShapeResult (const Handle_Standard_Transient & ent);
		%feature("autodoc", "Args:
	ent(Handle_Standard_Transient)
	mode(Standard_Integer)

Returns:
	Standard_Boolean

Clears recorded result for an entity, according mode  
          <mode> = -1 : true, complete, clearing (erasing result)  
          <mode> >= 0 : simple 'stripping', see ResultFromModel,  
            in particular, 0 for simple internal strip,  
            10 for all but final result,  
            11 for all : just label, status and filename are kept  
          Returns True when done, False if nothing was to clear") ClearResult;
		Standard_Boolean ClearResult (const Handle_Standard_Transient & ent,const Standard_Integer mode);
		%feature("autodoc", "Args:
	res(Handle_Standard_Transient)
	mode(Standard_Integer)=0

Returns:
	Handle_Standard_Transient

Returns an entity from which a given result was produced.  
          If <mode> = 0 (D), searches in last root transfers  
          If <mode> = 1,     searches in last (root & sub) transfers  
          If <mode> = 2,     searches in root recorded results  
          If <mode> = 3,     searches in all (root & sub) recordeds  
          <res> can be, either a transient object (result itself) or  
          a binder. For a binder of shape, calls EntityFromShapeResult  
          Returns a Null Handle if <res> not recorded") EntityFromResult;
		Handle_Standard_Transient EntityFromResult (const Handle_Standard_Transient & res,const Standard_Integer mode = 0);
		%feature("autodoc", "Args:
	res(TopoDS_Shape)
	mode(Standard_Integer)=0

Returns:
	Handle_Standard_Transient

Returns an entity from which a given shape result was produced  
          Returns a Null Handle if <res> not recorded or not a Shape") EntityFromShapeResult;
		Handle_Standard_Transient EntityFromShapeResult (const TopoDS_Shape & res,const Standard_Integer mode = 0);
		%feature("autodoc", "Args:
	res(Handle_TopTools_HSequenceOfShape)
	mode(Standard_Integer)=0

Returns:
	Handle_TColStd_HSequenceOfTransient

Returns the list of entities from which some shapes were  
          produced : it corresponds to a loop on EntityFromShapeResult,  
          but is optimised") EntitiesFromShapeList;
		Handle_TColStd_HSequenceOfTransient EntitiesFromShapeList (const Handle_TopTools_HSequenceOfShape & res,const Standard_Integer mode = 0);
		%feature("autodoc", "Args:
	ent(Handle_Standard_Transient)
	level(Standard_Integer)=0

Returns:
	Interface_CheckIterator

Returns the CheckList resulting from transferring <ent>, i.e.  
          stored in its recorded form ResultFromModel  
          (empty if transfer successful or not recorded ...)  
 
          If <ent> is the Model, returns the complete cumulated  
          check-list, <level> is ignored  
 
          If <ent> is an entity of the Model, <level> applies as follows  
          <level> : -1 for <ent> only, LAST transfer (TransientProcess)  
          <level> : 0  for <ent> only (D)  
                    1  for <ent> and its immediate subtransfers, if any  
                    2  for <ent> and subtransferts at all levels") CheckList;
		Interface_CheckIterator CheckList (const Handle_Standard_Transient & ent,const Standard_Integer level = 0);
		%feature("autodoc", "Args:
	ent(Handle_Standard_Transient)
	failsonly(Standard_Boolean)

Returns:
	Standard_Boolean

Returns True if an entity (with a final result) has checks :  
          - failsonly = False : any kind of check message  
          - failsonly = True  : fails only  
          Returns False if <ent> is not recorded") HasChecks;
		Standard_Boolean HasChecks (const Handle_Standard_Transient & ent,const Standard_Boolean failsonly);
		%feature("autodoc", "Args:
	ent(Handle_Standard_Transient)
	withcheck(Interface_CheckStatus)=Interface_CheckAny
	result(Standard_Boolean)=Standard_True

Returns:
	Handle_TColStd_HSequenceOfTransient

Returns the list of starting entities to which a given check  
          status is attached, IN FINAL RESULTS  
          <ent> can be an entity, or the model to query all entities  
          Below, 'entities' are, either <ent> plus its sub-transferred,  
          or all the entities of the model  
 
          <check> = -2 , all entities whatever the check (see result)  
          <check> = -1 , entities with no fail (warning allowed)  
          <check> =  0 , entities with no check at all  
          <check> =  1 , entities with warning but no fail  
          <check> =  2 , entities with fail  
          <result> : if True, only entities with an attached result  
          Remark : result True and check=0 will give an empty list") CheckedList;
		Handle_TColStd_HSequenceOfTransient CheckedList (const Handle_Standard_Transient & ent,const Interface_CheckStatus withcheck = Interface_CheckAny,const Standard_Boolean result = Standard_True);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Defines a new TransferProcess for reading transfer  
          Returns True if done, False if data are not properly defined  
          (the Model, the Actor for Read)") BeginTransfer;
		Standard_Boolean BeginTransfer ();
		%feature("autodoc", "Args:
	ent(Handle_Standard_Transient)

Returns:
	Standard_Boolean

Tells if an entity is recognized as a valid candidate for  
          Transfer. Calls method Recognize from the Actor (if known)") Recognize;
		Standard_Boolean Recognize (const Handle_Standard_Transient & ent);
		%feature("autodoc", "Args:
	ent(Handle_Standard_Transient)
	rec(Standard_Boolean)=Standard_True

Returns:
	Standard_Integer

Commands the transfer on reading for an entity to data for  
          Imagine, using the selected Actor for Read  
          Returns count of transferred entities, ok or with fails (0/1)  
          If <rec> is True (D), the result is recorded by RecordResult") TransferOne;
		Standard_Integer TransferOne (const Handle_Standard_Transient & ent,const Standard_Boolean rec = Standard_True);
		%feature("autodoc", "Args:
	list(Handle_TColStd_HSequenceOfTransient)
	rec(Standard_Boolean)=Standard_True

Returns:
	Standard_Integer

Commands the transfer on reading for a list of entities to  
          data for Imagine, using the selected Actor for Read  
          Returns count of transferred entities, ok or with fails (0/1)  
          If <rec> is True (D), the results are recorded by RecordResult") TransferList;
		Standard_Integer TransferList (const Handle_TColStd_HSequenceOfTransient & list,const Standard_Boolean rec = Standard_True);
		%feature("autodoc", "Args:
	G(Interface_Graph)

Returns:
	Standard_Integer

Transfers the content of the current Interface Model to  
          data handled by Imagine, starting from its Roots (determined  
          by the Graph <G>),  using the selected Actor for Read  
          Returns the count of performed root transfers (i.e. 0 if none)  
          or -1 if no actor is defined") TransferRoots;
		Standard_Integer TransferRoots (const Interface_Graph & G);
		%feature("autodoc", "Args:
	ent(Handle_Standard_Transient)
	level(Standard_Integer)=0

Returns:
	None

Clears the results attached to an entity  
          if <ents> equates the starting model, clears all results") TransferClear;
		void TransferClear (const Handle_Standard_Transient & ent,const Standard_Integer level = 0);
		%feature("autodoc", "Args:
	what(Standard_Integer)
	mode(Standard_Integer)=0

Returns:
	None

Prints statistics on current Trace File, according <what> and  
          <mode>.  See PrintStatsProcess for details") PrintStats;
		void PrintStats (const Standard_Integer what,const Standard_Integer mode = 0);
		%feature("autodoc", "Args:
	None
Returns:
	Interface_CheckIterator

Returns the CheckList resulting from last TransferRead  
          i.e. from TransientProcess itself, recorded from last Clear") LastCheckList;
		Interface_CheckIterator LastCheckList ();
		%feature("autodoc", "Args:
	roots(Standard_Boolean)

Returns:
	Handle_TColStd_HSequenceOfTransient

Returns the list of entities recorded as lastly transferred  
          i.e. from TransientProcess itself, recorded from last Clear  
          If <roots> is True , considers only roots of transfer  
          If <roots> is False, considers all entities bound with result") LastTransferList;
		Handle_TColStd_HSequenceOfTransient LastTransferList (const Standard_Boolean roots);
		%feature("autodoc", "Args:
	rec(Standard_Boolean)

Returns:
	Handle_TopTools_HSequenceOfShape

Returns a list of result Shapes  
          If <rec> is True , sees RecordedList  
          If <rec> is False, sees LastTransferList (last ROOT transfers)  
          For each one, if it is a Shape, it is cumulated to the list  
          If no Shape is found, returns an empty Sequence") ShapeResultList;
		Handle_TopTools_HSequenceOfShape ShapeResultList (const Standard_Boolean rec);
		%feature("autodoc", "Args:
	TP(Handle_Transfer_TransientProcess)
	what(Standard_Integer)
	mode(Standard_Integer)=0

Returns:
	static void

This routines prints statistics about a TransientProcess  
          It can be called, by a TransferReader, or isolately  
          Prints are done on the default trace file  
          <what> defines what kind of statistics are to be printed :  
          0 : basic figures  
          1 : root results  
          2 : all recorded (roots, intermediate, checked entities)  
          3 : abnormal records  
          4 : check messages (warnings and fails)  
          5 : fail messages  
 
          <mode> is used according <what> :  
          <what> = 0 : <mode> is ignored  
          <what> = 1,2,3 : <mode> as follows :  
          0 (D) : just lists numbers of concerned entities in the model  
          1 : for each entity, gives number,label, type and result  
                 type and/or status (fail/warning...)  
          2 : for each entity, gives maximal information (i.e. checks)  
          3 : counts per type of starting entity (class type)  
          4 : counts per result type and/or status  
          5 : counts per couple (starting type / result type/status)  
          6 : idem plus gives for each item, the list of numbers of  
                 entities in the starting model  
 
          <what> = 4,5 : modes relays on an enum PrintCount :  
          0 (D) : ItemsByEntity (sequential list by entity)  
          1 : CountByItem  
          2 : ShortByItem       (count + 5 first numbers)  
          3 : ListByItem        (count + entity numbers)  
          4 : EntitiesByItem    (count + entity numbers and labels)") PrintStatsProcess;
		static void PrintStatsProcess (const Handle_Transfer_TransientProcess & TP,const Standard_Integer what,const Standard_Integer mode = 0);
		%feature("autodoc", "Args:
	TP(Handle_Transfer_TransientProcess)
	list(Handle_TColStd_HSequenceOfTransient)
	what(Standard_Integer)
	mode(Standard_Integer)=0

Returns:
	static void

Works as PrintStatsProcess, but displays data only on the  
          entities which are in <list> (filter)") PrintStatsOnList;
		static void PrintStatsOnList (const Handle_Transfer_TransientProcess & TP,const Handle_TColStd_HSequenceOfTransient & list,const Standard_Integer what,const Standard_Integer mode = 0);
};


%feature("shadow") XSControl_TransferReader::~XSControl_TransferReader %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend XSControl_TransferReader {
	void _kill_pointed() {
		delete $self;
	}
};
%extend XSControl_TransferReader {
	Handle_XSControl_TransferReader GetHandle() {
	return *(Handle_XSControl_TransferReader*) &$self;
	}
};

%nodefaultctor Handle_XSControl_TransferReader;
class Handle_XSControl_TransferReader : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_XSControl_TransferReader();
        Handle_XSControl_TransferReader(const Handle_XSControl_TransferReader &aHandle);
        Handle_XSControl_TransferReader(const XSControl_TransferReader *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_XSControl_TransferReader DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_XSControl_TransferReader {
    XSControl_TransferReader* GetObject() {
    return (XSControl_TransferReader*)$self->Access();
    }
};
%feature("shadow") Handle_XSControl_TransferReader::~Handle_XSControl_TransferReader %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_XSControl_TransferReader {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor XSControl_TransferWriter;
class XSControl_TransferWriter : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates a TransferWriter, empty, ready to run  
          with an empty FinderProcess (but no controller, etc)") XSControl_TransferWriter;
		 XSControl_TransferWriter ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Transfer_FinderProcess

Returns the FinderProcess itself") FinderProcess;
		Handle_Transfer_FinderProcess FinderProcess ();
		%feature("autodoc", "Args:
	FP(Handle_Transfer_FinderProcess)

Returns:
	None

Sets a new FinderProcess and forgets the former one") SetFinderProcess;
		void SetFinderProcess (const Handle_Transfer_FinderProcess & FP);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_XSControl_Controller

Returns the currently used Controller") Controller;
		Handle_XSControl_Controller Controller ();
		%feature("autodoc", "Args:
	ctl(Handle_XSControl_Controller)

Returns:
	None

Sets a new Controller, also sets a new FinderProcess") SetController;
		void SetController (const Handle_XSControl_Controller & ctl);
		%feature("autodoc", "Args:
	mode(Standard_Integer)

Returns:
	None

Clears recorded data according a mode  
          0 clears FinderProcess (results, checks)  
         -1 create a new FinderProcess") Clear;
		void Clear (const Standard_Integer mode);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the current Transfer Mode (an Integer)  
          It will be interpreted by the Controller to run Transfers  
          This call form could be later replaced by more specific ones  
            (parameters suited for each norm / transfer case)") TransferMode;
		Standard_Integer TransferMode ();
		%feature("autodoc", "Args:
	mode(Standard_Integer)

Returns:
	None

Changes the Transfer Mode") SetTransferMode;
		void SetTransferMode (const Standard_Integer mode);
		%feature("autodoc", "Args:
	what(Standard_Integer)
	mode(Standard_Integer)=0

Returns:
	None

Prints statistics on current Trace File, according what,mode  
          See PrintStatsProcess for details") PrintStats;
		void PrintStats (const Standard_Integer what,const Standard_Integer mode = 0);
		%feature("autodoc", "Args:
	obj(Handle_Standard_Transient)

Returns:
	Standard_Boolean

Tells if a transient object (from an application) is a valid  
          candidate for a transfer to a model  
          Asks the Controller (RecognizeWriteTransient)  
          If <obj> is a HShape, calls RecognizeShape") RecognizeTransient;
		Standard_Boolean RecognizeTransient (const Handle_Standard_Transient & obj);
		%feature("autodoc", "Args:
	model(Handle_Interface_InterfaceModel)
	obj(Handle_Standard_Transient)

Returns:
	IFSelect_ReturnStatus

Transfers a Transient object (from an application) to a model  
          of current norm, according to the last call to SetTransferMode  
          Works by calling the Controller  
          Returns status : =0 if OK, >0 if error during transfer, <0 if  
              transfer badly initialised") TransferWriteTransient;
		IFSelect_ReturnStatus TransferWriteTransient (const Handle_Interface_InterfaceModel & model,const Handle_Standard_Transient & obj);
		%feature("autodoc", "Args:
	shape(TopoDS_Shape)

Returns:
	Standard_Boolean

Tells if a Shape is valid for a transfer to a model  
          Asks the Controller (RecognizeWriteShape)") RecognizeShape;
		Standard_Boolean RecognizeShape (const TopoDS_Shape & shape);
		%feature("autodoc", "Args:
	model(Handle_Interface_InterfaceModel)
	shape(TopoDS_Shape)

Returns:
	IFSelect_ReturnStatus

Transfers a Shape from CasCade to a model of current norm,  
          according to the last call to SetTransferMode  
          Works by calling the Controller  
          Returns status : =0 if OK, >0 if error during transfer, <0 if  
              transfer badly initialised") TransferWriteShape;
		IFSelect_ReturnStatus TransferWriteShape (const Handle_Interface_InterfaceModel & model,const TopoDS_Shape & shape);
		%feature("autodoc", "Args:
	None
Returns:
	Interface_CheckIterator

Returns the check-list of last transfer (write), i.e. the  
          check-list currently recorded in the FinderProcess") CheckList;
		Interface_CheckIterator CheckList ();
		%feature("autodoc", "Args:
	model(Handle_Interface_InterfaceModel)

Returns:
	Interface_CheckIterator

Returns the check-list of last transfer (write), but tries  
          to bind to each check, the resulting entity in the model  
          instead of keeping the original Mapper, whenever known") ResultCheckList;
		Interface_CheckIterator ResultCheckList (const Handle_Interface_InterfaceModel & model);
		%feature("autodoc", "Args:
	TP(Handle_Transfer_FinderProcess)
	what(Standard_Integer)
	mode(Standard_Integer)=0

Returns:
	static void

Forecast to print statitics about a FinderProcess") PrintStatsProcess;
		static void PrintStatsProcess (const Handle_Transfer_FinderProcess & TP,const Standard_Integer what,const Standard_Integer mode = 0);
};


%feature("shadow") XSControl_TransferWriter::~XSControl_TransferWriter %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend XSControl_TransferWriter {
	void _kill_pointed() {
		delete $self;
	}
};
%extend XSControl_TransferWriter {
	Handle_XSControl_TransferWriter GetHandle() {
	return *(Handle_XSControl_TransferWriter*) &$self;
	}
};

%nodefaultctor Handle_XSControl_TransferWriter;
class Handle_XSControl_TransferWriter : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_XSControl_TransferWriter();
        Handle_XSControl_TransferWriter(const Handle_XSControl_TransferWriter &aHandle);
        Handle_XSControl_TransferWriter(const XSControl_TransferWriter *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_XSControl_TransferWriter DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_XSControl_TransferWriter {
    XSControl_TransferWriter* GetObject() {
    return (XSControl_TransferWriter*)$self->Access();
    }
};
%feature("shadow") Handle_XSControl_TransferWriter::~Handle_XSControl_TransferWriter %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_XSControl_TransferWriter {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor XSControl_Utils;
class XSControl_Utils {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

the only use of this, is to allow a frontal to get one  
          distinct 'Utils' set per separate engine") XSControl_Utils;
		 XSControl_Utils ();
		%feature("autodoc", "Args:
	line(char *)

Returns:
	None

Just prints a line into the current Trace File. This allows to  
          better characterise the various trace outputs, as desired.") TraceLine;
		void TraceLine (const char * line);
		%feature("autodoc", "Args:
	lines(Handle_Standard_Transient)

Returns:
	None

Just prints a line or a set of lines into the current Trace  
          File. <lines> can be a HAscii/ExtendedString (produces a print  
          without ending line) or a HSequence or HArray1 Of ..  
           (one new line per item)") TraceLines;
		void TraceLines (const Handle_Standard_Transient & lines);
		%feature("autodoc", "Args:
	item(Handle_Standard_Transient)
	what(Handle_Standard_Type)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsKind;
		Standard_Boolean IsKind (const Handle_Standard_Transient & item,const Handle_Standard_Type & what);
		%feature("autodoc", "Args:
	item(Handle_Standard_Transient)
	nopk(Standard_Boolean)=Standard_False

Returns:
	char *

Returns the name of the dynamic type of an object, i.e. :  
          If it is a Type, its Name  
          If it is a object not a type, the Name of its DynamicType  
          If it is Null, an empty string  
          If <nopk> is False (D), gives complete name  
          If <nopk> is True, returns class name without package") TypeName;
		char * TypeName (const Handle_Standard_Transient & item,const Standard_Boolean nopk = Standard_False);
		%feature("autodoc", "Args:
	list(Handle_Standard_Transient)
	num(Standard_Integer)

Returns:
	Handle_Standard_Transient

No detailed docstring for this function.") TraValue;
		Handle_Standard_Transient TraValue (const Handle_Standard_Transient & list,const Standard_Integer num);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TColStd_HSequenceOfTransient

No detailed docstring for this function.") NewSeqTra;
		Handle_TColStd_HSequenceOfTransient NewSeqTra ();
		%feature("autodoc", "Args:
	seqval(Handle_TColStd_HSequenceOfTransient)
	traval(Handle_Standard_Transient)

Returns:
	None

No detailed docstring for this function.") AppendTra;
		void AppendTra (const Handle_TColStd_HSequenceOfTransient & seqval,const Handle_Standard_Transient & traval);
		%feature("autodoc", "Args:
	yy(Standard_Integer)
	mm(Standard_Integer)
	dd(Standard_Integer)
	hh(Standard_Integer)
	mn(Standard_Integer)
	ss(Standard_Integer)

Returns:
	char *

No detailed docstring for this function.") DateString;
		char * DateString (const Standard_Integer yy,const Standard_Integer mm,const Standard_Integer dd,const Standard_Integer hh,const Standard_Integer mn,const Standard_Integer ss);
		%feature("autodoc", "Args:
	text(char *)
	yy(Standard_Integer)
	mm(Standard_Integer)
	dd(Standard_Integer)
	hh(Standard_Integer)
	mn(Standard_Integer)
	ss(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") DateValues;
		void DateValues (const char * text,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	strval(Handle_TCollection_HAsciiString)

Returns:
	char *

No detailed docstring for this function.") ToCString;
		char * ToCString (const Handle_TCollection_HAsciiString & strval);
		%feature("autodoc", "Args:
	strval(TCollection_AsciiString)

Returns:
	char *

No detailed docstring for this function.") ToCString;
		char * ToCString (const TCollection_AsciiString & strval);
		%feature("autodoc", "Args:
	strcon(char *)

Returns:
	Handle_TCollection_HAsciiString

No detailed docstring for this function.") ToHString;
		Handle_TCollection_HAsciiString ToHString (const char * strcon);
		%feature("autodoc", "Args:
	strcon(char *)

Returns:
	TCollection_AsciiString

No detailed docstring for this function.") ToAString;
		TCollection_AsciiString ToAString (const char * strcon);
		%feature("autodoc", "Args:
	strval(Handle_TCollection_HExtendedString)

Returns:
	Standard_ExtString

No detailed docstring for this function.") ToEString;
		Standard_ExtString ToEString (const Handle_TCollection_HExtendedString & strval);
		%feature("autodoc", "Args:
	strval(TCollection_ExtendedString)

Returns:
	Standard_ExtString

No detailed docstring for this function.") ToEString;
		Standard_ExtString ToEString (const TCollection_ExtendedString & strval);
		%feature("autodoc", "Args:
	strcon(Standard_ExtString)

Returns:
	Handle_TCollection_HExtendedString

No detailed docstring for this function.") ToHString;
		Handle_TCollection_HExtendedString ToHString (const Standard_ExtString strcon);
		%feature("autodoc", "Args:
	strcon(Standard_ExtString)

Returns:
	TCollection_ExtendedString

No detailed docstring for this function.") ToXString;
		TCollection_ExtendedString ToXString (const Standard_ExtString strcon);
		%feature("autodoc", "Args:
	str(char *)

Returns:
	Standard_ExtString

No detailed docstring for this function.") AsciiToExtended;
		Standard_ExtString AsciiToExtended (const char * str);
		%feature("autodoc", "Args:
	str(Standard_ExtString)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsAscii;
		Standard_Boolean IsAscii (const Standard_ExtString str);
		%feature("autodoc", "Args:
	str(Standard_ExtString)

Returns:
	char *

No detailed docstring for this function.") ExtendedToAscii;
		char * ExtendedToAscii (const Standard_ExtString str);
		%feature("autodoc", "Args:
	list(Handle_Standard_Transient)
	num(Standard_Integer)

Returns:
	char *

No detailed docstring for this function.") CStrValue;
		char * CStrValue (const Handle_Standard_Transient & list,const Standard_Integer num);
		%feature("autodoc", "Args:
	list(Handle_Standard_Transient)
	num(Standard_Integer)

Returns:
	Standard_ExtString

No detailed docstring for this function.") EStrValue;
		Standard_ExtString EStrValue (const Handle_Standard_Transient & list,const Standard_Integer num);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TColStd_HSequenceOfHAsciiString

No detailed docstring for this function.") NewSeqCStr;
		Handle_TColStd_HSequenceOfHAsciiString NewSeqCStr ();
		%feature("autodoc", "Args:
	seqval(Handle_TColStd_HSequenceOfHAsciiString)
	strval(char *)

Returns:
	None

No detailed docstring for this function.") AppendCStr;
		void AppendCStr (const Handle_TColStd_HSequenceOfHAsciiString & seqval,const char * strval);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TColStd_HSequenceOfHExtendedString

No detailed docstring for this function.") NewSeqEStr;
		Handle_TColStd_HSequenceOfHExtendedString NewSeqEStr ();
		%feature("autodoc", "Args:
	seqval(Handle_TColStd_HSequenceOfHExtendedString)
	strval(Standard_ExtString)

Returns:
	None

No detailed docstring for this function.") AppendEStr;
		void AppendEStr (const Handle_TColStd_HSequenceOfHExtendedString & seqval,const Standard_ExtString strval);
		%feature("autodoc", "Args:
	shape(TopoDS_Shape)
	filename(char *)

Returns:
	Standard_Boolean

Writes a Shape under the internal BRepTools form  
          (an internal help utility)  
          Returns True if writing has succeeded, False else") WriteShape;
		Standard_Boolean WriteShape (const TopoDS_Shape & shape,const char * filename);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

Returns a new empty, undefined Shape, which can then be filled  
          by ReadShape") NewShape;
		TopoDS_Shape NewShape ();
		%feature("autodoc", "Args:
	shape(TopoDS_Shape)
	filename(char *)

Returns:
	Standard_Boolean

Reads a Shape from the internal BRepTools form and returns it  
          (an internal help utility)  
          Returns True if reading has succeeded, False else") ReadShape;
		Standard_Boolean ReadShape (TopoDS_Shape & shape,const char * filename);
		%feature("autodoc", "Args:
	shape(TopoDS_Shape)

Returns:
	Standard_Boolean

Returns True if a Shape is Null") IsNullShape;
		Standard_Boolean IsNullShape (const TopoDS_Shape & shape);
		%feature("autodoc", "Args:
	seqval(Handle_TopTools_HSequenceOfShape)

Returns:
	TopoDS_Shape

Converts a list of Shapes to a Compound (a kind of Shape)") CompoundFromSeq;
		TopoDS_Shape CompoundFromSeq (const Handle_TopTools_HSequenceOfShape & seqval);
		%feature("autodoc", "Args:
	shape(TopoDS_Shape)
	compound(Standard_Boolean)

Returns:
	TopAbs_ShapeEnum

Returns the type of a Shape : true type if <compound> is False  
          If <compound> is True and <shape> is a Compound, iterates on  
          its items. If all are of the same type, returns this type.  
          Else, returns COMPOUND. If it is empty, returns SHAPE  
          For a Null Shape, returns SHAPE") ShapeType;
		TopAbs_ShapeEnum ShapeType (const TopoDS_Shape & shape,const Standard_Boolean compound);
		%feature("autodoc", "Args:
	shape(TopoDS_Shape)
	type(TopAbs_ShapeEnum)
	explore(Standard_Boolean)
	compound(Standard_Boolean)

Returns:
	TopoDS_Shape

From a Shape, builds a Compound as follows :  
          explores it level by level  
          If <explore> is False, only COMPOUND items. Else, all items  
          Adds to the result, shapes which comply to <type>  
          + if <type> is WIRE, considers free edges (and makes wires)  
          + if <type> is SHELL, considers free faces (and makes shells)  
          If <compound> is True, gathers items in compounds which  
          correspond to starting COMPOUND,SOLID or SHELL containers, or  
          items directly contained in a Compound") SortedCompound;
		TopoDS_Shape SortedCompound (const TopoDS_Shape & shape,const TopAbs_ShapeEnum type,const Standard_Boolean explore,const Standard_Boolean compound);
		%feature("autodoc", "Args:
	seqv(Handle_TopTools_HSequenceOfShape)
	num(Standard_Integer)

Returns:
	TopoDS_Shape

No detailed docstring for this function.") ShapeValue;
		TopoDS_Shape ShapeValue (const Handle_TopTools_HSequenceOfShape & seqv,const Standard_Integer num);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TopTools_HSequenceOfShape

No detailed docstring for this function.") NewSeqShape;
		Handle_TopTools_HSequenceOfShape NewSeqShape ();
		%feature("autodoc", "Args:
	seqv(Handle_TopTools_HSequenceOfShape)
	shape(TopoDS_Shape)

Returns:
	None

No detailed docstring for this function.") AppendShape;
		void AppendShape (const Handle_TopTools_HSequenceOfShape & seqv,const TopoDS_Shape & shape);
		%feature("autodoc", "Args:
	shape(TopoDS_Shape)
	hs(Standard_Boolean)=Standard_True

Returns:
	Handle_Standard_Transient

Creates a Transient Object from a Shape : it is either a Binder  
          (used by functions which require a Transient but can process  
          a Shape, such as viewing functions) or a HShape (according to hs)  
          Default is a HShape") ShapeBinder;
		Handle_Standard_Transient ShapeBinder (const TopoDS_Shape & shape,const Standard_Boolean hs = Standard_True);
		%feature("autodoc", "Args:
	tr(Handle_Standard_Transient)

Returns:
	TopoDS_Shape

From a Transient, returns a Shape.  
          In fact, recognizes ShapeBinder ShapeMapper and HShape") BinderShape;
		TopoDS_Shape BinderShape (const Handle_Standard_Transient & tr);
		%feature("autodoc", "Args:
	list(Handle_Standard_Transient)

Returns:
	Standard_Integer

No detailed docstring for this function.") SeqLength;
		Standard_Integer SeqLength (const Handle_Standard_Transient & list);
		%feature("autodoc", "Args:
	seq(Handle_Standard_Transient)
	first(Standard_Integer)=1

Returns:
	Handle_Standard_Transient

No detailed docstring for this function.") SeqToArr;
		Handle_Standard_Transient SeqToArr (const Handle_Standard_Transient & seq,const Standard_Integer first = 1);
		%feature("autodoc", "Args:
	arr(Handle_Standard_Transient)

Returns:
	Handle_Standard_Transient

No detailed docstring for this function.") ArrToSeq;
		Handle_Standard_Transient ArrToSeq (const Handle_Standard_Transient & arr);
		%feature("autodoc", "Args:
	list(Handle_TColStd_HSequenceOfInteger)
	num(Standard_Integer)

Returns:
	Standard_Integer

No detailed docstring for this function.") SeqIntValue;
		Standard_Integer SeqIntValue (const Handle_TColStd_HSequenceOfInteger & list,const Standard_Integer num);
};


%feature("shadow") XSControl_Utils::~XSControl_Utils %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend XSControl_Utils {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor XSControl_WorkSession;
class XSControl_WorkSession : public IFSelect_WorkSession {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") XSControl_WorkSession;
		 XSControl_WorkSession ();
		%feature("autodoc", "Args:
	mode(Standard_Integer)

Returns:
	virtual void

In addition to basic ClearData, clears Transfer and Management  
          for interactive use, for mode = 0,1,2 and over 4  
          Plus : mode = 5 to clear Transfers (both ways) only  
                 mode = 6 to clear enforced results  
                 mode = 7 to clear transfers, results") ClearData;
		virtual void ClearData (const Standard_Integer mode);
		%feature("autodoc", "Args:
	normname(char *)
	profile(char *)=

Returns:
	Standard_Boolean

Selects a Norm defined by its name.  
          A Norm is described and handled by a Controller  
          Returns True if done, False if <normname> is unknown  
 
          A Profile may be set too. If no Profile is provided, the  
          current Profile for this Norm is taken  
          If the asked Profile is not defined for this Norm, it remains  
          in current Profile, returned value is True") SelectNorm;
		Standard_Boolean SelectNorm (const char * normname,const char * profile = "");
		%feature("autodoc", "Args:
	profile(char *)

Returns:
	Standard_Boolean

Sets a Profile as current for the current Norm  
          Returns True if done, False if <profile> is unknown for this norm  
 
          For more infos on Profile, query the Profile of the Controller") SelectProfile;
		Standard_Boolean SelectProfile (const char * profile);
		%feature("autodoc", "Args:
	ctl(Handle_XSControl_Controller)

Returns:
	None

Selects a Norm defined by its Controller itself") SetController;
		void SetController (const Handle_XSControl_Controller & ctl);
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

This method is called once a new norm has been successfully  
          selected. It can be redefined, default does nothing") AdaptNorm;
		virtual void AdaptNorm ();
		%feature("autodoc", "Args:
	rsc(Standard_Boolean)=Standard_False

Returns:
	char *

Returns the name of the last Selected Norm. If none is  
          defined, returns an empty string  
          By default, returns the complete name of the norm  
          If <rsc> is True, returns the short name used for resource") SelectedNorm;
		char * SelectedNorm (const Standard_Boolean rsc = Standard_False);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_XSControl_Controller

Returns the norm controller itself") NormAdaptor;
		Handle_XSControl_Controller NormAdaptor ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Dico_DictionaryOfTransient

Returns the current Context List, Null if not defined  
          The Context is given to the TransientProcess for TransferRead") Context;
		Handle_Dico_DictionaryOfTransient Context ();
		%feature("autodoc", "Args:
	context(Handle_Dico_DictionaryOfTransient)

Returns:
	None

Sets the current Context List, as a whole  
          Sets it to the TransferReader") SetAllContext;
		void SetAllContext (const Handle_Dico_DictionaryOfTransient & context);
		%feature("autodoc", "Args:
	None
Returns:
	None

Clears the whole current Context (nullifies it)") ClearContext;
		void ClearContext ();
		%feature("autodoc", "Args:
	num(Standard_Integer)
	wri(Standard_Boolean)
	S(Handle_Message_Messenger)

Returns:
	Standard_Boolean

Prints the transfer status of a transferred item, as beeing  
          the Mapped n0 <num>, from MapWriter if <wri> is True, or  
          from MapReader if <wri> is False  
          Returns True when done, False else (i.e. num out of range)") PrintTransferStatus;
		Standard_Boolean PrintTransferStatus (const Standard_Integer num,const Standard_Boolean wri,const Handle_Message_Messenger & S);
		%feature("autodoc", "Args:
	mode(Standard_Integer)

Returns:
	None

Sets a Transfer Reader, by internal ways, according mode :  
          0 recreates it clear,  1 clears it (does not recreate)  
          2 aligns Roots of TransientProcess from final Results  
          3 aligns final Results from Roots of TransientProcess  
          4 begins a new transfer (by BeginTransfer)  
          5 recreates TransferReader then begins a new transfer") InitTransferReader;
		void InitTransferReader (const Standard_Integer mode);
		%feature("autodoc", "Args:
	TR(Handle_XSControl_TransferReader)

Returns:
	None

Sets a Transfer Reader, which manages transfers on reading") SetTransferReader;
		void SetTransferReader (const Handle_XSControl_TransferReader & TR);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_XSControl_TransferReader

Returns the Transfer Reader, Null if not set") TransferReader;
		Handle_XSControl_TransferReader TransferReader ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Transfer_TransientProcess

Returns the TransientProcess(internal data for TransferReader)") MapReader;
		Handle_Transfer_TransientProcess MapReader ();
		%feature("autodoc", "Args:
	TP(Handle_Transfer_TransientProcess)

Returns:
	Standard_Boolean

Changes the Map Reader, i.e. considers that the new one  
          defines the relevant read results (forgets the former ones)  
          Returns True when done, False in case of bad definition, i.e.  
          if Model from TP differs from that of Session") SetMapReader;
		Standard_Boolean SetMapReader (const Handle_Transfer_TransientProcess & TP);
		%feature("autodoc", "Args:
	ent(Handle_Standard_Transient)
	mode(Standard_Integer)

Returns:
	Handle_Standard_Transient

Returns the result attached to a starting entity  
          If <mode> = 0, returns Final Result  
          If <mode> = 1, considers Last Result  
          If <mode> = 2, considers Final, else if absent, Last  
            returns it as Transient, if result is not transient returns  
            the Binder  
          <mode> = 10,11,12 idem but returns the Binder itself  
            (if it is not, e.g. Shape, returns the Binder)  
          <mode> = 20, returns the ResultFromModel") Result;
		Handle_Standard_Transient Result (const Handle_Standard_Transient & ent,const Standard_Integer mode);
		%feature("autodoc", "Args:
	ents(Handle_Standard_Transient)

Returns:
	Standard_Integer

Commands the transfer of, either one entity, or a list  
          I.E. calls the TransferReader after having analysed <ents>  
          It is cumulated from the last BeginTransfer  
          <ents> is processed by GiveList, hence :  
          - <ents> a Selection : its SelectionResult  
          - <ents> a HSequenceOfTransient : this list  
          - <ents> the Model : in this specific case, all the roots,  
            with no cumulation of former transfers (TransferReadRoots)") TransferReadOne;
		Standard_Integer TransferReadOne (const Handle_Standard_Transient & ents);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Commands the transfer of all the root entities of the model  
          i.e. calls TransferRoot from the TransferReader with the Graph  
          No cumulation with former calls to TransferReadOne") TransferReadRoots;
		Standard_Integer TransferReadRoots ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Interface_InterfaceModel

produces and returns a new Model well conditionned  
          It is produced by the Norm Controller  
          It can be Null (if this function is not implemented)") NewModel;
		Handle_Interface_InterfaceModel NewModel ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_XSControl_TransferWriter

Returns the Transfer Reader, Null if not set") TransferWriter;
		Handle_XSControl_TransferWriter TransferWriter ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Transfer_FinderProcess

Returns the FinderProcess (internal data for TransferWriter)") MapWriter;
		Handle_Transfer_FinderProcess MapWriter ();
		%feature("autodoc", "Args:
	FP(Handle_Transfer_FinderProcess)

Returns:
	Standard_Boolean

Changes the Map Reader, i.e. considers that the new one  
          defines the relevant read results (forgets the former ones)  
          Returns True when done, False if <FP> is Null") SetMapWriter;
		Standard_Boolean SetMapWriter (const Handle_Transfer_FinderProcess & FP);
		%feature("autodoc", "Args:
	mode(Standard_Integer)

Returns:
	None

Sets a mode to transfer Shapes from CasCade to entities of the  
          current norm, which interprets it (see various Controllers)  
          This call form could be later replaced by a more general one") SetModeWriteShape;
		void SetModeWriteShape (const Standard_Integer mode);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Records the current Mode to Write Shapes") ModeWriteShape;
		Standard_Integer ModeWriteShape ();
		%feature("autodoc", "Args:
	shape(TopoDS_Shape)
	compgraph(Standard_Boolean)=Standard_True

Returns:
	IFSelect_ReturnStatus

Transfers a Shape from CasCade to a model of current norm,  
          according to the last call to SetModeWriteShape  
          Returns status :Done if OK, Fail if error during transfer,  
            Error if transfer badly initialised") TransferWriteShape;
		IFSelect_ReturnStatus TransferWriteShape (const TopoDS_Shape & shape,const Standard_Boolean compgraph = Standard_True);
		%feature("autodoc", "Args:
	None
Returns:
	Interface_CheckIterator

Returns the check-list of last transfer (write)  
          It is recorded in the FinderProcess, but it must be bound with  
          resulting entities (in the resulting file model) rather than  
          with original objects (in fact, their mappers)") TransferWriteCheckList;
		Interface_CheckIterator TransferWriteCheckList ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_XSControl_Vars

No detailed docstring for this function.") Vars;
		Handle_XSControl_Vars Vars ();
		%feature("autodoc", "Args:
	newvars(Handle_XSControl_Vars)

Returns:
	None

No detailed docstring for this function.") SetVars;
		void SetVars (const Handle_XSControl_Vars & newvars);
		%feature("autodoc", "Args:
	None
Returns:
	None

Clears binders") ClearBinders;
		void ClearBinders ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Destroy;
		void Destroy ();
};


%feature("shadow") XSControl_WorkSession::~XSControl_WorkSession %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend XSControl_WorkSession {
	void _kill_pointed() {
		delete $self;
	}
};
%extend XSControl_WorkSession {
	Handle_XSControl_WorkSession GetHandle() {
	return *(Handle_XSControl_WorkSession*) &$self;
	}
};

%nodefaultctor Handle_XSControl_WorkSession;
class Handle_XSControl_WorkSession : public Handle_IFSelect_WorkSession {

    public:
        // constructors
        Handle_XSControl_WorkSession();
        Handle_XSControl_WorkSession(const Handle_XSControl_WorkSession &aHandle);
        Handle_XSControl_WorkSession(const XSControl_WorkSession *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_XSControl_WorkSession DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_XSControl_WorkSession {
    XSControl_WorkSession* GetObject() {
    return (XSControl_WorkSession*)$self->Access();
    }
};
%feature("shadow") Handle_XSControl_WorkSession::~Handle_XSControl_WorkSession %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_XSControl_WorkSession {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor XSControl_Writer;
class XSControl_Writer {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates a Writer from scratch") XSControl_Writer;
		 XSControl_Writer ();
		%feature("autodoc", "Args:
	norm(char *)

Returns:
	None

Creates a Writer from scratch, with a norm name which  
          identifie a Controller") XSControl_Writer;
		 XSControl_Writer (const char * norm);
		%feature("autodoc", "Args:
	WS(Handle_XSControl_WorkSession)
	scratch(Standard_Boolean)=Standard_True

Returns:
	None

Creates a Writer from an already existing Session  
          If <scratch> is True (D), clears already recorded data") XSControl_Writer;
		 XSControl_Writer (const Handle_XSControl_WorkSession & WS,const Standard_Boolean scratch = Standard_True);
		%feature("autodoc", "Args:
	norm(char *)

Returns:
	Standard_Boolean

Sets a specific norm to <self>  
          Returns True if done, False if <norm> is not available") SetNorm;
		Standard_Boolean SetNorm (const char * norm);
		%feature("autodoc", "Args:
	WS(Handle_XSControl_WorkSession)
	scratch(Standard_Boolean)=Standard_True

Returns:
	None

Sets a specific session to <self>") SetWS;
		void SetWS (const Handle_XSControl_WorkSession & WS,const Standard_Boolean scratch = Standard_True);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_XSControl_WorkSession

Returns the session used in <self>") WS;
		Handle_XSControl_WorkSession WS ();
		%feature("autodoc", "Args:
	newone(Standard_Boolean)=Standard_False

Returns:
	Handle_Interface_InterfaceModel

Returns the produced model. Produces a new one if not yet done  
          or if <newone> is True  
          This method allows for instance to edit product or header  
          data before writing") Model;
		Handle_Interface_InterfaceModel Model (const Standard_Boolean newone = Standard_False);
		%feature("autodoc", "Args:
	sh(TopoDS_Shape)
	mode(Standard_Integer)=0

Returns:
	IFSelect_ReturnStatus

Transfers a Shape according to the mode") TransferShape;
		IFSelect_ReturnStatus TransferShape (const TopoDS_Shape & sh,const Standard_Integer mode = 0);
		%feature("autodoc", "Args:
	filename(char *)

Returns:
	IFSelect_ReturnStatus

Writes the produced model") WriteFile;
		IFSelect_ReturnStatus WriteFile (const char * filename);
		%feature("autodoc", "Args:
	what(Standard_Integer)
	mode(Standard_Integer)=0

Returns:
	None

Prints Statistics about Transfer") PrintStatsTransfer;
		void PrintStatsTransfer (const Standard_Integer what,const Standard_Integer mode = 0);
};


%feature("shadow") XSControl_Writer::~XSControl_Writer %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend XSControl_Writer {
	void _kill_pointed() {
		delete $self;
	}
};
