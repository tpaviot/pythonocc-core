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
%module (package="OCC") XSControl

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


%include XSControl_headers.i


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
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%rename(xscontrol) XSControl;
class XSControl {
	public:
		%feature("compactdefaultargs") Session;
		%feature("autodoc", "	* Returns the WorkSession of a SessionPilot, but casts it as from XSControl : it then gives access to Control & Transfers

	:param pilot:
	:type pilot: Handle_IFSelect_SessionPilot &
	:rtype: Handle_XSControl_WorkSession
") Session;
		static Handle_XSControl_WorkSession Session (const Handle_IFSelect_SessionPilot & pilot);
		%feature("compactdefaultargs") Vars;
		%feature("autodoc", "	* Returns the Vars of a SessionPilot, it is brought by Session it provides access to external variables

	:param pilot:
	:type pilot: Handle_IFSelect_SessionPilot &
	:rtype: Handle_XSControl_Vars
") Vars;
		static Handle_XSControl_Vars Vars (const Handle_IFSelect_SessionPilot & pilot);
};


%extend XSControl {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XSControl_ConnectedShapes;
class XSControl_ConnectedShapes : public IFSelect_SelectExplore {
	public:
		%feature("compactdefaultargs") XSControl_ConnectedShapes;
		%feature("autodoc", "	* Creates a Selection ConnectedShapes. It remains to be set a TransferReader

	:rtype: None
") XSControl_ConnectedShapes;
		 XSControl_ConnectedShapes ();
		%feature("compactdefaultargs") XSControl_ConnectedShapes;
		%feature("autodoc", "	* Creates a Selection ConnectedShapes, which will work with the current TransferProcess brought by the TransferReader

	:param TR:
	:type TR: Handle_XSControl_TransferReader &
	:rtype: None
") XSControl_ConnectedShapes;
		 XSControl_ConnectedShapes (const Handle_XSControl_TransferReader & TR);
		%feature("compactdefaultargs") SetReader;
		%feature("autodoc", "	* Sets a TransferReader to sort entities : it brings the TransferProcess which may change, while the TransferReader does not

	:param TR:
	:type TR: Handle_XSControl_TransferReader &
	:rtype: None
") SetReader;
		void SetReader (const Handle_XSControl_TransferReader & TR);
		%feature("compactdefaultargs") Explore;
		%feature("autodoc", "	* Explores an entity : entities from which are connected to that produced by this entity, including itself

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
		%feature("autodoc", "	* Returns a text defining the criterium. 'Connected Entities through produced Shapes'

	:rtype: TCollection_AsciiString
") ExploreLabel;
		TCollection_AsciiString ExploreLabel ();
		%feature("compactdefaultargs") AdjacentEntities;
		%feature("autodoc", "	* This functions considers a shape from a transfer and performs the search function explained above

	:param ashape:
	:type ashape: TopoDS_Shape &
	:param TP:
	:type TP: Handle_Transfer_TransientProcess &
	:param type:
	:type type: TopAbs_ShapeEnum
	:rtype: Handle_TColStd_HSequenceOfTransient
") AdjacentEntities;
		static Handle_TColStd_HSequenceOfTransient AdjacentEntities (const TopoDS_Shape & ashape,const Handle_Transfer_TransientProcess & TP,const TopAbs_ShapeEnum type);
};


%extend XSControl_ConnectedShapes {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_XSControl_ConnectedShapes(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_XSControl_ConnectedShapes::Handle_XSControl_ConnectedShapes %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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
    XSControl_ConnectedShapes* _get_reference() {
    return (XSControl_ConnectedShapes*)$self->Access();
    }
};

%extend Handle_XSControl_ConnectedShapes {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend XSControl_ConnectedShapes {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XSControl_Controller;
class XSControl_Controller : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") SetNames;
		%feature("autodoc", "	* Changes names if a name is empty, the formerly set one remains Remark : Does not call Record or AutoRecord

	:param longname:
	:type longname: char *
	:param shortname:
	:type shortname: char *
	:rtype: None
") SetNames;
		void SetNames (const char * longname,const char * shortname);
		%feature("compactdefaultargs") AutoRecord;
		%feature("autodoc", "	* Records <self> is a general dictionary under Short and Long Names (see method Name)

	:rtype: None
") AutoRecord;
		void AutoRecord ();
		%feature("compactdefaultargs") Record;
		%feature("autodoc", "	* Records <self> in a general dictionary under a name Error if <name> already used for another one

	:param name:
	:type name: char *
	:rtype: None
") Record;
		void Record (const char * name);
		%feature("compactdefaultargs") Recorded;
		%feature("autodoc", "	* Returns the Controller attached to a given name Returns a Null Handle if <name> is unknown

	:param name:
	:type name: char *
	:rtype: Handle_XSControl_Controller
") Recorded;
		static Handle_XSControl_Controller Recorded (const char * name);
		%feature("compactdefaultargs") ListRecorded;
		%feature("autodoc", "	* Returns the list of names of recorded norms, according to mode = 0 (D) : all the recorded names < 0 : for each distinct norm, its resource (short) name > 0 : for each distinct norm, its complete (long) name

	:param mode: default value is 0
	:type mode: int
	:rtype: Handle_TColStd_HSequenceOfHAsciiString
") ListRecorded;
		static Handle_TColStd_HSequenceOfHAsciiString ListRecorded (const Standard_Integer mode = 0);
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "	* Returns a name, as given when initializing : rsc = False (D) : True Name attached to the Norm (long name) rsc = True : Name of the ressource set (i.e. short name)

	:param rsc: default value is Standard_False
	:type rsc: bool
	:rtype: char *
") Name;
		const char * Name (const Standard_Boolean rsc = Standard_False);
		%feature("compactdefaultargs") Profile;
		%feature("autodoc", "	* Returns the Profile It starts with a first configuration Base (empty) and the following options : protocol for the Protocol sign-type for the SignType (Default Signature for Type) access for the WorkLibrary tr-read for ActorRead (import processor) tr-write for ActorWrite (export processor)

	:rtype: Handle_IFSelect_Profile
") Profile;
		Handle_IFSelect_Profile Profile ();
		%feature("compactdefaultargs") DefineProfile;
		%feature("autodoc", "	* Considers the current state of the Controller as defining a configuration, newly created or already existing

	:param confname:
	:type confname: char *
	:rtype: None
") DefineProfile;
		void DefineProfile (const char * confname);
		%feature("compactdefaultargs") SetProfile;
		%feature("autodoc", "	* Sets the Controller in a given Configuration of its Profile Calls SettingProfile (which can be redefined) //! Returns True if done, False if <confname> unknown

	:param confname:
	:type confname: char *
	:rtype: bool
") SetProfile;
		Standard_Boolean SetProfile (const char * confname);
		%feature("compactdefaultargs") SettingProfile;
		%feature("autodoc", "	* This method is called by SetProfile, it can be redefined for specific sub-class of Controller The default does nothing

	:param confname:
	:type confname: char *
	:rtype: bool
") SettingProfile;
		virtual Standard_Boolean SettingProfile (const char * confname);
		%feature("compactdefaultargs") ApplyProfile;
		%feature("autodoc", "	* Applies a Configuration of the Profile to the WorkSession I.E. calls SetProfile then fills WorkSession with definitions

	:param WS:
	:type WS: Handle_XSControl_WorkSession &
	:param confname:
	:type confname: char *
	:rtype: bool
") ApplyProfile;
		Standard_Boolean ApplyProfile (const Handle_XSControl_WorkSession & WS,const char * confname);
		%feature("compactdefaultargs") ApplyingProfile;
		%feature("autodoc", "	* Called by ApplyProfile, can be redefined for specific sub-class of Controller The default does nothing

	:param WS:
	:type WS: Handle_XSControl_WorkSession &
	:param confname:
	:type confname: char *
	:rtype: bool
") ApplyingProfile;
		virtual Standard_Boolean ApplyingProfile (const Handle_XSControl_WorkSession & WS,const char * confname);
		%feature("compactdefaultargs") Protocol;
		%feature("autodoc", "	* Returns the Protocol attached to the Norm (from field)

	:rtype: Handle_Interface_Protocol
") Protocol;
		Handle_Interface_Protocol Protocol ();
		%feature("compactdefaultargs") SignType;
		%feature("autodoc", "	* Returns the SignType attached to the norm (from field)

	:rtype: Handle_IFSelect_Signature
") SignType;
		Handle_IFSelect_Signature SignType ();
		%feature("compactdefaultargs") WorkLibrary;
		%feature("autodoc", "	* Returns the WorkLibrary attached to the Norm. Remark that it has to be in phase with the Protocol (read from field)

	:rtype: Handle_IFSelect_WorkLibrary
") WorkLibrary;
		Handle_IFSelect_WorkLibrary WorkLibrary ();
		%feature("compactdefaultargs") NewModel;
		%feature("autodoc", "	* Creates a new empty Model ready to receive data of the Norm Used to write data from Imagine to an interface file

	:rtype: Handle_Interface_InterfaceModel
") NewModel;
		virtual Handle_Interface_InterfaceModel NewModel ();
		%feature("compactdefaultargs") ActorRead;
		%feature("autodoc", "	* Returns the Actor for Read attached to the pair (norm,appli) It can be adapted for data of the input Model, as required Can be read from field then adapted with Model as required

	:param model:
	:type model: Handle_Interface_InterfaceModel &
	:rtype: Handle_Transfer_ActorOfTransientProcess
") ActorRead;
		virtual Handle_Transfer_ActorOfTransientProcess ActorRead (const Handle_Interface_InterfaceModel & model);
		%feature("compactdefaultargs") ActorWrite;
		%feature("autodoc", "	* Returns the Actor for Write attached to the pair (norm,appli) Read from field. Can be redefined

	:rtype: Handle_Transfer_ActorOfFinderProcess
") ActorWrite;
		virtual Handle_Transfer_ActorOfFinderProcess ActorWrite ();
		%feature("compactdefaultargs") UpdateStatics;
		%feature("autodoc", "	* Updates static values <mode> precises the kind of updating : (see Items from Static) -1 : a precise static item : criter = its name 0 : all items of a family : criter = the family name 1 : all items which match regexp name : criter = regexp name By default (criter empty) should consider all relevant statics If <name> is defined, can consider only this static item The provided default method does nothing, to be redefined

	:param mode:
	:type mode: int
	:param criter: default value is ""
	:type criter: char *
	:rtype: void
") UpdateStatics;
		virtual void UpdateStatics (const Standard_Integer mode,const char * criter = "");
		%feature("compactdefaultargs") SetModeWrite;
		%feature("autodoc", "	* Sets mininum and maximum values for modetrans (write) Erases formerly recorded bounds and values Actually only for shape Then, for each value a little help can be attached

	:param modemin:
	:type modemin: int
	:param modemax:
	:type modemax: int
	:param shape: default value is Standard_True
	:type shape: bool
	:rtype: None
") SetModeWrite;
		void SetModeWrite (const Standard_Integer modemin,const Standard_Integer modemax,const Standard_Boolean shape = Standard_True);
		%feature("compactdefaultargs") SetModeWriteHelp;
		%feature("autodoc", "	* Attaches a short line of help to a value of modetrans (write)

	:param modetrans:
	:type modetrans: int
	:param help:
	:type help: char *
	:param shape: default value is Standard_True
	:type shape: bool
	:rtype: None
") SetModeWriteHelp;
		void SetModeWriteHelp (const Standard_Integer modetrans,const char * help,const Standard_Boolean shape = Standard_True);
		%feature("compactdefaultargs") ModeWriteBounds;
		%feature("autodoc", "	* Returns recorded min and max values for modetrans (write) Actually only for shapes Returns True if bounds are set, False else (then, free value)

	:param modemin:
	:type modemin: int &
	:param modemax:
	:type modemax: int &
	:param shape: default value is Standard_True
	:type shape: bool
	:rtype: bool
") ModeWriteBounds;
		Standard_Boolean ModeWriteBounds (Standard_Integer &OutValue,Standard_Integer &OutValue,const Standard_Boolean shape = Standard_True);
		%feature("compactdefaultargs") IsModeWrite;
		%feature("autodoc", "	* Tells if a value of <modetrans> is a good value(within bounds) Actually only for shapes

	:param modetrans:
	:type modetrans: int
	:param shape: default value is Standard_True
	:type shape: bool
	:rtype: bool
") IsModeWrite;
		Standard_Boolean IsModeWrite (const Standard_Integer modetrans,const Standard_Boolean shape = Standard_True);
		%feature("compactdefaultargs") ModeWriteHelp;
		%feature("autodoc", "	* Returns the help line recorded for a value of modetrans empty if help not defined or not within bounds or if values are free

	:param modetrans:
	:type modetrans: int
	:param shape: default value is Standard_True
	:type shape: bool
	:rtype: char *
") ModeWriteHelp;
		const char * ModeWriteHelp (const Standard_Integer modetrans,const Standard_Boolean shape = Standard_True);
		%feature("compactdefaultargs") RecognizeWriteTransient;
		%feature("autodoc", "	* Tells if <obj> (an application object) is a valid candidate for a transfer to a Model. By default, asks the ActorWrite if known (through a TransientMapper). Can be redefined

	:param obj:
	:type obj: Handle_Standard_Transient &
	:param modetrans: default value is 0
	:type modetrans: int
	:rtype: bool
") RecognizeWriteTransient;
		virtual Standard_Boolean RecognizeWriteTransient (const Handle_Standard_Transient & obj,const Standard_Integer modetrans = 0);
		%feature("compactdefaultargs") TransferWriteTransient;
		%feature("autodoc", "	* Takes one Transient Object and transfers it to an InterfaceModel (already created, e.g. by NewModel) (result is recorded in the model by AddWithRefs) FP records produced results and checks //! Default uses ActorWrite; can be redefined as necessary Returned value is a status, as follows : 0 OK , 1 No Result , 2 Fail (e.g. exception raised) -1 bad conditions , -2 bad model or null model For type of object not recognized : should return 1

	:param obj:
	:type obj: Handle_Standard_Transient &
	:param FP:
	:type FP: Handle_Transfer_FinderProcess &
	:param model:
	:type model: Handle_Interface_InterfaceModel &
	:param modetrans: default value is 0
	:type modetrans: int
	:rtype: IFSelect_ReturnStatus
") TransferWriteTransient;
		virtual IFSelect_ReturnStatus TransferWriteTransient (const Handle_Standard_Transient & obj,const Handle_Transfer_FinderProcess & FP,const Handle_Interface_InterfaceModel & model,const Standard_Integer modetrans = 0);
		%feature("compactdefaultargs") RecognizeWriteShape;
		%feature("autodoc", "	* Tells if a shape is valid for a transfer to a model Asks the ActorWrite (through a ShapeMapper)

	:param shape:
	:type shape: TopoDS_Shape &
	:param modetrans: default value is 0
	:type modetrans: int
	:rtype: bool
") RecognizeWriteShape;
		virtual Standard_Boolean RecognizeWriteShape (const TopoDS_Shape & shape,const Standard_Integer modetrans = 0);
		%feature("compactdefaultargs") TransferWriteShape;
		%feature("autodoc", "	* Takes one Shape and transfers it to an InterfaceModel (already created, e.g. by NewModel) Default uses ActorWrite; can be redefined as necessary Returned value is a status, as follows : Done OK , Void : No Result , Fail : Fail (e.g. exception) Error : bad conditions , bad model or null model Resolution of file clusters According to each norm, there can (or not) be files of which definition is not complete but refers to other files : this defines a file cluster. It can then be resolved by two calls : - ClusterContext prepares the resolution, specific of each case - ResolveCluster performs the resolution, its result consists in having all data gathered in one final model

	:param shape:
	:type shape: TopoDS_Shape &
	:param FP:
	:type FP: Handle_Transfer_FinderProcess &
	:param model:
	:type model: Handle_Interface_InterfaceModel &
	:param modetrans: default value is 0
	:type modetrans: int
	:rtype: IFSelect_ReturnStatus
") TransferWriteShape;
		virtual IFSelect_ReturnStatus TransferWriteShape (const TopoDS_Shape & shape,const Handle_Transfer_FinderProcess & FP,const Handle_Interface_InterfaceModel & model,const Standard_Integer modetrans = 0);
		%feature("compactdefaultargs") ClusterContext;
		%feature("autodoc", "	* Prepares and returns a context to resolve a cluster All data to be used are detained by the WorkSession The definition of this context is free and proper to each case remark that it is aimed to be used in ResolveCluster //! The context must be prepared, but resolution must not have began //! If no cluster has to be resolved, should return a null handle This is the default case, which can be redefined

	:param WS:
	:type WS: Handle_XSControl_WorkSession &
	:rtype: Handle_Standard_Transient
") ClusterContext;
		virtual Handle_Standard_Transient ClusterContext (const Handle_XSControl_WorkSession & WS);
		%feature("compactdefaultargs") ResolveCluster;
		%feature("autodoc", "	* Performs the resolution itself, from the starting data and the cluster context //! Can fill a CheckList as necessary (especially when one or more references remain unresolved) //! Default does nothing and returns an empty CheckList

	:param WS:
	:type WS: Handle_XSControl_WorkSession &
	:param context:
	:type context: Handle_Standard_Transient &
	:rtype: Interface_CheckIterator
") ResolveCluster;
		virtual Interface_CheckIterator ResolveCluster (const Handle_XSControl_WorkSession & WS,const Handle_Standard_Transient & context);
		%feature("compactdefaultargs") AddControlItem;
		%feature("autodoc", "	* Adds an item in the control list A control item of a controller is accessed by its name which is specific of a kind of item (i.e. a kind of functionnality) Adds or replaces if <name> is already recorded

	:param item:
	:type item: Handle_Standard_Transient &
	:param name:
	:type name: char *
	:rtype: None
") AddControlItem;
		void AddControlItem (const Handle_Standard_Transient & item,const char * name);
		%feature("compactdefaultargs") ControlItem;
		%feature("autodoc", "	* Returns a control item from its name, Null if <name> unknown To be used then, it just remains to be down-casted

	:param name:
	:type name: char *
	:rtype: Handle_Standard_Transient
") ControlItem;
		Handle_Standard_Transient ControlItem (const char * name);
		%feature("compactdefaultargs") TraceStatic;
		%feature("autodoc", "	* Records the name of a Static to be traced for a given use

	:param name:
	:type name: char *
	:param use:
	:type use: int
	:rtype: None
") TraceStatic;
		void TraceStatic (const char * name,const Standard_Integer use);
		%feature("compactdefaultargs") AddSessionItem;
		%feature("autodoc", "	* Records a Session Item, to be added for customisation of the Work Session. It must have a specific name. <setapplied> is used if <item> is a GeneralModifier, to decide to which hook list it will be applied, if not empty (else, not applied to any hook list) ACTUAL : only one hook list is managed : 'send' Remark : this method is to be called at Create time, the recorded items will be used by Customise Warning : if <name> conflicts, the last recorded item is kept

	:param item:
	:type item: Handle_Standard_Transient &
	:param name:
	:type name: char *
	:param setapplied: default value is ""
	:type setapplied: char *
	:rtype: None
") AddSessionItem;
		void AddSessionItem (const Handle_Standard_Transient & item,const char * name,const char * setapplied = "");
		%feature("compactdefaultargs") SessionItem;
		%feature("autodoc", "	* Returns an item given its name to record in a Session If <name> is unknown, returns a Null Handle

	:param name:
	:type name: char *
	:rtype: Handle_Standard_Transient
") SessionItem;
		Handle_Standard_Transient SessionItem (const char * name);
		%feature("compactdefaultargs") IsApplied;
		%feature("autodoc", "	* Returns True if <item> is recorded as <setapplied = True>

	:param item:
	:type item: Handle_Standard_Transient &
	:rtype: bool
") IsApplied;
		Standard_Boolean IsApplied (const Handle_Standard_Transient & item);
		%feature("compactdefaultargs") Customise;
		%feature("autodoc", "	* Customises a WorkSession, by adding to it the recorded items (by AddSessionItem), then by calling a specific method Customising, set by default to do nothing

	:param WS:
	:type WS: Handle_XSControl_WorkSession &
	:rtype: void
") Customise;
		virtual void Customise (Handle_XSControl_WorkSession & WS);
		%feature("compactdefaultargs") Customising;
		%feature("autodoc", "	* Specific customisation method, which can be redefined Default does nothing

	:param WS:
	:type WS: Handle_XSControl_WorkSession &
	:rtype: None
") Customising;
		void Customising (Handle_XSControl_WorkSession & WS);
		%feature("compactdefaultargs") AdaptorSession;
		%feature("autodoc", "	:rtype: Handle_Dico_DictionaryOfTransient
") AdaptorSession;
		Handle_Dico_DictionaryOfTransient AdaptorSession ();
};


%extend XSControl_Controller {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_XSControl_Controller(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_XSControl_Controller::Handle_XSControl_Controller %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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
    XSControl_Controller* _get_reference() {
    return (XSControl_Controller*)$self->Access();
    }
};

%extend Handle_XSControl_Controller {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend XSControl_Controller {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class XSControl_FuncShape {
	public:
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Defines and loads all functions which work on shapes for XSControl (as ActFunc)

	:rtype: void
") Init;
		static void Init ();
		%feature("compactdefaultargs") MoreShapes;
		%feature("autodoc", "	* Analyses a name as designating Shapes from a Vars or from XSTEP transfer (last Transfer on Reading). <name> can be : '*' : all the root shapes produced by last Transfer (Read) i.e. considers roots of the TransientProcess a name : a name of a variable DRAW //! Returns the count of designated Shapes. Their list is put in <list>. If <list> is null, it is firstly created. Then it is completed (Append without Clear) by the Shapes found Returns 0 if no Shape could be found

	:param session:
	:type session: Handle_XSControl_WorkSession &
	:param list:
	:type list: Handle_TopTools_HSequenceOfShape &
	:param name:
	:type name: char *
	:rtype: int
") MoreShapes;
		static Standard_Integer MoreShapes (const Handle_XSControl_WorkSession & session,Handle_TopTools_HSequenceOfShape & list,const char * name);
		%feature("compactdefaultargs") FileAndVar;
		%feature("autodoc", "	* Analyses given file name and variable name, with a default name for variables. Returns resulting file name and variable name plus status 'file to read'(True) or 'already read'(False) In the latter case, empty resfile means no file available //! If <file> is null or empty or equates '.', considers Session and returned status is False Else, returns resfile = file and status is True If <var> is neither null nor empty, resvar = var Else, the root part of <resfile> is considered, if defined Else, <def> is taken

	:param session:
	:type session: Handle_XSControl_WorkSession &
	:param file:
	:type file: char *
	:param var:
	:type var: char *
	:param def:
	:type def: char *
	:param resfile:
	:type resfile: TCollection_AsciiString &
	:param resvar:
	:type resvar: TCollection_AsciiString &
	:rtype: bool
") FileAndVar;
		static Standard_Boolean FileAndVar (const Handle_XSControl_WorkSession & session,const char * file,const char * var,const char * def,TCollection_AsciiString & resfile,TCollection_AsciiString & resvar);
};


%extend XSControl_FuncShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class XSControl_Functions {
	public:
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Defines and loads all functions for XSControl (as ActFunc)

	:rtype: void
") Init;
		static void Init ();
};


%extend XSControl_Functions {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XSControl_Reader;
class XSControl_Reader {
	public:
		%feature("compactdefaultargs") XSControl_Reader;
		%feature("autodoc", "	* Creates a Reader from scratch (creates an empty WorkSession) A WorkSession or a Controller must be provided before running

	:rtype: None
") XSControl_Reader;
		 XSControl_Reader ();
		%feature("compactdefaultargs") XSControl_Reader;
		%feature("autodoc", "	* Creates a Reader from scratch, with a norm name which identifies a Controller

	:param norm:
	:type norm: char *
	:rtype: None
") XSControl_Reader;
		 XSControl_Reader (const char * norm);
		%feature("compactdefaultargs") XSControl_Reader;
		%feature("autodoc", "	* Creates a Reader from an already existing Session, with a Controller already set Virtual destructor

	:param WS:
	:type WS: Handle_XSControl_WorkSession &
	:param scratch: default value is Standard_True
	:type scratch: bool
	:rtype: None
") XSControl_Reader;
		 XSControl_Reader (const Handle_XSControl_WorkSession & WS,const Standard_Boolean scratch = Standard_True);
		%feature("compactdefaultargs") SetNorm;
		%feature("autodoc", "	* Sets a specific norm to <self> Returns True if done, False if <norm> is not available

	:param norm:
	:type norm: char *
	:rtype: bool
") SetNorm;
		Standard_Boolean SetNorm (const char * norm);
		%feature("compactdefaultargs") SetWS;
		%feature("autodoc", "	* Sets a specific session to <self>

	:param WS:
	:type WS: Handle_XSControl_WorkSession &
	:param scratch: default value is Standard_True
	:type scratch: bool
	:rtype: None
") SetWS;
		void SetWS (const Handle_XSControl_WorkSession & WS,const Standard_Boolean scratch = Standard_True);
		%feature("compactdefaultargs") WS;
		%feature("autodoc", "	* Returns the session used in <self>

	:rtype: Handle_XSControl_WorkSession
") WS;
		Handle_XSControl_WorkSession WS ();
		%feature("compactdefaultargs") ReadFile;
		%feature("autodoc", "	* Loads a file and returns the read status Zero for a Model which compies with the Controller

	:param filename:
	:type filename: char *
	:rtype: IFSelect_ReturnStatus
") ReadFile;
		IFSelect_ReturnStatus ReadFile (const char * filename);
		%feature("compactdefaultargs") Model;
		%feature("autodoc", "	* Returns the model. It can then be consulted (header, product)

	:rtype: Handle_Interface_InterfaceModel
") Model;
		Handle_Interface_InterfaceModel Model ();
		%feature("compactdefaultargs") GiveList;
		%feature("autodoc", "	* Returns a list of entities from the IGES or STEP file according to the following rules: - if first and second are empty strings, the whole file is selected. - if first is an entity number or label, the entity referred to is selected. - if first is a list of entity numbers/labels separated by commas, the entities referred to are selected, - if first is the name of a selection in the worksession and second is not defined, the list contains the standard output for that selection. - if first is the name of a selection and second is defined, the criterion defined by second is applied to the result of the first selection. A selection is an operator which computes a list of entities from a list given in input according to its type. If no list is specified, the selection computes its list of entities from the whole model. A selection can be: - A predefined selection (xst-transferrable-mode) - A filter based on a signature A Signature is an operator which returns a string from an entity according to its type. For example: - 'xst-type' (CDL) - 'iges-level' - 'step-type'. For example, if you wanted to select only the advanced_faces in a STEP file you would use the following code: Example Reader.GiveList('xst-transferrable-roots','step-type(ADVANCED_FACE)'); Warning If the value given to second is incorrect, it will simply be ignored.

	:param first: default value is ""
	:type first: char *
	:param second: default value is ""
	:type second: char *
	:rtype: Handle_TColStd_HSequenceOfTransient
") GiveList;
		Handle_TColStd_HSequenceOfTransient GiveList (const char * first = "",const char * second = "");
		%feature("compactdefaultargs") GiveList;
		%feature("autodoc", "	* Computes a List of entities from the model as follows <first> beeing a Selection, <ent> beeing an entity or a list of entities (as a HSequenceOfTransient) : the standard result of this selection applied to this list if <first> is erroneous, a null handle is returned

	:param first:
	:type first: char *
	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: Handle_TColStd_HSequenceOfTransient
") GiveList;
		Handle_TColStd_HSequenceOfTransient GiveList (const char * first,const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") NbRootsForTransfer;
		%feature("autodoc", "	* Determines the list of root entities which are candidate for a transfer to a Shape, and returns the number of entities in the list

	:rtype: int
") NbRootsForTransfer;
		virtual Standard_Integer NbRootsForTransfer ();
		%feature("compactdefaultargs") RootForTransfer;
		%feature("autodoc", "	* Returns an IGES or STEP root entity for translation. The entity is identified by its rank in a list.

	:param num: default value is 1
	:type num: int
	:rtype: Handle_Standard_Transient
") RootForTransfer;
		Handle_Standard_Transient RootForTransfer (const Standard_Integer num = 1);
		%feature("compactdefaultargs") TransferOneRoot;
		%feature("autodoc", "	* Translates a root identified by the rank num in the model. false is returned if no shape is produced.

	:param num: default value is 1
	:type num: int
	:rtype: bool
") TransferOneRoot;
		Standard_Boolean TransferOneRoot (const Standard_Integer num = 1);
		%feature("compactdefaultargs") TransferOne;
		%feature("autodoc", "	* Translates an IGES or STEP entity identified by the rank num in the model. false is returned if no shape is produced.

	:param num:
	:type num: int
	:rtype: bool
") TransferOne;
		Standard_Boolean TransferOne (const Standard_Integer num);
		%feature("compactdefaultargs") TransferEntity;
		%feature("autodoc", "	* Translates an IGES or STEP entity in the model. true is returned if a shape is produced; otherwise, false is returned.

	:param start:
	:type start: Handle_Standard_Transient &
	:rtype: bool
") TransferEntity;
		Standard_Boolean TransferEntity (const Handle_Standard_Transient & start);
		%feature("compactdefaultargs") TransferList;
		%feature("autodoc", "	* Translates a list of entities. Returns the number of IGES or STEP entities that were successfully translated. The list can be produced with GiveList. Warning - This function does not clear the existing output shapes.

	:param list:
	:type list: Handle_TColStd_HSequenceOfTransient &
	:rtype: int
") TransferList;
		Standard_Integer TransferList (const Handle_TColStd_HSequenceOfTransient & list);
		%feature("compactdefaultargs") TransferRoots;
		%feature("autodoc", "	* Translates all translatable roots and returns the number of successful translations. Warning - This function clears existing output shapes first.

	:rtype: int
") TransferRoots;
		Standard_Integer TransferRoots ();
		%feature("compactdefaultargs") ClearShapes;
		%feature("autodoc", "	* Clears the list of shapes that may have accumulated in calls to TransferOne or TransferRoot.C

	:rtype: None
") ClearShapes;
		void ClearShapes ();
		%feature("compactdefaultargs") NbShapes;
		%feature("autodoc", "	* Returns the number of shapes produced by translation.

	:rtype: int
") NbShapes;
		Standard_Integer NbShapes ();
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "	* Returns the shape resulting from a translation and identified by the rank num. num equals 1 by default. In other words, the first shape resulting from the translation is returned.

	:param num: default value is 1
	:type num: int
	:rtype: TopoDS_Shape
") Shape;
		TopoDS_Shape Shape (const Standard_Integer num = 1);
		%feature("compactdefaultargs") OneShape;
		%feature("autodoc", "	* Returns all of the results in a single shape which is: - a null shape if there are no results, - a shape if there is one result, - a compound containing the resulting shapes if there are more than one.

	:rtype: TopoDS_Shape
") OneShape;
		TopoDS_Shape OneShape ();
		%feature("compactdefaultargs") PrintCheckLoad;
		%feature("autodoc", "	* Prints the check list attached to loaded data, on the Standard Trace File (starts at cout) All messages or fails only, according to <failsonly> mode = 0 : per entity, prints messages mode = 1 : per message, just gives count of entities per check mode = 2 : also gives entity numbers

	:param failsonly:
	:type failsonly: bool
	:param mode:
	:type mode: IFSelect_PrintCount
	:rtype: None
") PrintCheckLoad;
		void PrintCheckLoad (const Standard_Boolean failsonly,const IFSelect_PrintCount mode);
		%feature("compactdefaultargs") PrintCheckTransfer;
		%feature("autodoc", "	* Displays check results for the last translation of IGES or STEP entities to Open CASCADE entities. Only fail messages are displayed if failsonly is true. All messages are displayed if failsonly is false. mode determines the contents and the order of the messages according to the terms of the IFSelect_PrintCount enumeration.

	:param failsonly:
	:type failsonly: bool
	:param mode:
	:type mode: IFSelect_PrintCount
	:rtype: None
") PrintCheckTransfer;
		void PrintCheckTransfer (const Standard_Boolean failsonly,const IFSelect_PrintCount mode);
		%feature("compactdefaultargs") PrintStatsTransfer;
		%feature("autodoc", "	* Displays the statistics for the last translation. what defines the kind of statistics that are displayed as follows: - 0 gives general statistics (number of translated roots, number of warnings, number of fail messages), - 1 gives root results, - 2 gives statistics for all checked entities, - 3 gives the list of translated entities, - 4 gives warning and fail messages, - 5 gives fail messages only. The use of mode depends on the value of what. If what is 0, mode is ignored. If what is 1, 2 or 3, mode defines the following: - 0 lists the numbers of IGES or STEP entities in the respective model - 1 gives the number, identifier, type and result type for each IGES or STEP entity and/or its status (fail, warning, etc.) - 2 gives maximum information for each IGES or STEP entity (i.e. checks) - 3 gives the number of entities per type of IGES or STEP entity - 4 gives the number of IGES or STEP entities per result type and/or status - 5 gives the number of pairs (IGES or STEP or result type and status) - 6 gives the number of pairs (IGES or STEP or result type and status) AND the list of entity numbers in the IGES or STEP model. If what is 4 or 5, mode defines the warning and fail messages as follows: - if mode is 0 all warnings and checks per entity are returned - if mode is 2 the list of entities per warning is returned. If mode is not set, only the list of all entities per warning is given.

	:param what:
	:type what: int
	:param mode: default value is 0
	:type mode: int
	:rtype: None
") PrintStatsTransfer;
		void PrintStatsTransfer (const Standard_Integer what,const Standard_Integer mode = 0);
		%feature("compactdefaultargs") GetStatsTransfer;
		%feature("autodoc", "	* Gives statistics about Transfer

	:param list:
	:type list: Handle_TColStd_HSequenceOfTransient &
	:param nbMapped:
	:type nbMapped: int &
	:param nbWithResult:
	:type nbWithResult: int &
	:param nbWithFail:
	:type nbWithFail: int &
	:rtype: None
") GetStatsTransfer;
		void GetStatsTransfer (const Handle_TColStd_HSequenceOfTransient & list,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue);
};


%extend XSControl_Reader {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XSControl_SelectForTransfer;
class XSControl_SelectForTransfer : public IFSelect_SelectExtract {
	public:
		%feature("compactdefaultargs") XSControl_SelectForTransfer;
		%feature("autodoc", "	* Creates a SelectForTransfer, non initialised it sorts nothing, unless an Actor has been defined

	:rtype: None
") XSControl_SelectForTransfer;
		 XSControl_SelectForTransfer ();
		%feature("compactdefaultargs") XSControl_SelectForTransfer;
		%feature("autodoc", "	* Creates a SelectForTransfer, which will work with the currently defined Actor brought by the TransferReader

	:param TR:
	:type TR: Handle_XSControl_TransferReader &
	:rtype: None
") XSControl_SelectForTransfer;
		 XSControl_SelectForTransfer (const Handle_XSControl_TransferReader & TR);
		%feature("compactdefaultargs") SetReader;
		%feature("autodoc", "	* Sets a TransferReader to sort entities : it brings the Actor, which may change, while the TransferReader does not

	:param TR:
	:type TR: Handle_XSControl_TransferReader &
	:rtype: None
") SetReader;
		void SetReader (const Handle_XSControl_TransferReader & TR);
		%feature("compactdefaultargs") SetActor;
		%feature("autodoc", "	* Sets a precise actor to sort entities This definition oversedes the creation with a TransferReader

	:param act:
	:type act: Handle_Transfer_ActorOfTransientProcess &
	:rtype: None
") SetActor;
		void SetActor (const Handle_Transfer_ActorOfTransientProcess & act);
		%feature("compactdefaultargs") Actor;
		%feature("autodoc", "	* Returns the Actor used as precised one. Returns a Null Handle for a creation from a TransferReader without any further setting

	:rtype: Handle_Transfer_ActorOfTransientProcess
") Actor;
		Handle_Transfer_ActorOfTransientProcess Actor ();
		%feature("compactdefaultargs") Reader;
		%feature("autodoc", "	* Returns the Reader (if created with a Reader) Returns a Null Handle if not created with a Reader

	:rtype: Handle_XSControl_TransferReader
") Reader;
		Handle_XSControl_TransferReader Reader ();
		%feature("compactdefaultargs") Sort;
		%feature("autodoc", "	* Returns True for an Entity which is recognized by the Actor, either the precised one, or the one defined by TransferReader

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
		%feature("autodoc", "	* Returns a text defining the criterium : 'Recognized for Transfer [(current actor)]'

	:rtype: TCollection_AsciiString
") ExtractLabel;
		TCollection_AsciiString ExtractLabel ();
};


%extend XSControl_SelectForTransfer {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_XSControl_SelectForTransfer(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_XSControl_SelectForTransfer::Handle_XSControl_SelectForTransfer %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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
    XSControl_SelectForTransfer* _get_reference() {
    return (XSControl_SelectForTransfer*)$self->Access();
    }
};

%extend Handle_XSControl_SelectForTransfer {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend XSControl_SelectForTransfer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XSControl_SignTransferStatus;
class XSControl_SignTransferStatus : public IFSelect_Signature {
	public:
		%feature("compactdefaultargs") XSControl_SignTransferStatus;
		%feature("autodoc", "	* Creates a SignTransferStatus, not initialised it gives nothing (empty string)

	:rtype: None
") XSControl_SignTransferStatus;
		 XSControl_SignTransferStatus ();
		%feature("compactdefaultargs") XSControl_SignTransferStatus;
		%feature("autodoc", "	* Creates a SignTransferStatus, which will work on the current TransientProcess brought by the TransferReader (its MapReader)

	:param TR:
	:type TR: Handle_XSControl_TransferReader &
	:rtype: None
") XSControl_SignTransferStatus;
		 XSControl_SignTransferStatus (const Handle_XSControl_TransferReader & TR);
		%feature("compactdefaultargs") SetReader;
		%feature("autodoc", "	* Sets a TransferReader to work

	:param TR:
	:type TR: Handle_XSControl_TransferReader &
	:rtype: None
") SetReader;
		void SetReader (const Handle_XSControl_TransferReader & TR);
		%feature("compactdefaultargs") SetMap;
		%feature("autodoc", "	* Sets a precise map to sign entities This definition oversedes the creation with a TransferReader

	:param TP:
	:type TP: Handle_Transfer_TransientProcess &
	:rtype: None
") SetMap;
		void SetMap (const Handle_Transfer_TransientProcess & TP);
		%feature("compactdefaultargs") Map;
		%feature("autodoc", "	* Returns the TransientProcess used as precised one Returns a Null Handle for a creation from a TransferReader without any further setting

	:rtype: Handle_Transfer_TransientProcess
") Map;
		Handle_Transfer_TransientProcess Map ();
		%feature("compactdefaultargs") Reader;
		%feature("autodoc", "	* Returns the Reader (if created with a Reader) Returns a Null Handle if not created with a Reader

	:rtype: Handle_XSControl_TransferReader
") Reader;
		Handle_XSControl_TransferReader Reader ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Returns the Signature for a Transient object, as its transfer status

	:param ent:
	:type ent: Handle_Standard_Transient &
	:param model:
	:type model: Handle_Interface_InterfaceModel &
	:rtype: char *
") Value;
		const char * Value (const Handle_Standard_Transient & ent,const Handle_Interface_InterfaceModel & model);
};


%extend XSControl_SignTransferStatus {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_XSControl_SignTransferStatus(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_XSControl_SignTransferStatus::Handle_XSControl_SignTransferStatus %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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
    XSControl_SignTransferStatus* _get_reference() {
    return (XSControl_SignTransferStatus*)$self->Access();
    }
};

%extend Handle_XSControl_SignTransferStatus {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend XSControl_SignTransferStatus {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XSControl_TransferReader;
class XSControl_TransferReader : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") XSControl_TransferReader;
		%feature("autodoc", "	* Creates a TransferReader, empty

	:rtype: None
") XSControl_TransferReader;
		 XSControl_TransferReader ();
		%feature("compactdefaultargs") SetController;
		%feature("autodoc", "	* Sets a Controller. It is required to generate the Actor. Elsewhere, the Actor must be provided directly

	:param control:
	:type control: Handle_XSControl_Controller &
	:rtype: None
") SetController;
		void SetController (const Handle_XSControl_Controller & control);
		%feature("compactdefaultargs") SetActor;
		%feature("autodoc", "	* Sets the Actor directly : this value will be used if the Controller is not set

	:param actor:
	:type actor: Handle_Transfer_ActorOfTransientProcess &
	:rtype: None
") SetActor;
		void SetActor (const Handle_Transfer_ActorOfTransientProcess & actor);
		%feature("compactdefaultargs") Actor;
		%feature("autodoc", "	* Returns the Actor, determined by the Controller, or if this one is unknown, directly set. Once it has been defined, it can then be edited.

	:rtype: Handle_Transfer_ActorOfTransientProcess
") Actor;
		Handle_Transfer_ActorOfTransientProcess Actor ();
		%feature("compactdefaultargs") SetModel;
		%feature("autodoc", "	* Sets an InterfaceModel. This causes former results, computed from another one, to be lost (see also Clear)

	:param model:
	:type model: Handle_Interface_InterfaceModel &
	:rtype: None
") SetModel;
		void SetModel (const Handle_Interface_InterfaceModel & model);
		%feature("compactdefaultargs") SetGraph;
		%feature("autodoc", "	* Sets a Graph and its InterfaceModel (calls SetModel)

	:param graph:
	:type graph: Handle_Interface_HGraph &
	:rtype: None
") SetGraph;
		void SetGraph (const Handle_Interface_HGraph & graph);
		%feature("compactdefaultargs") Model;
		%feature("autodoc", "	* Returns the currently set InterfaceModel

	:rtype: Handle_Interface_InterfaceModel
") Model;
		Handle_Interface_InterfaceModel Model ();
		%feature("compactdefaultargs") SetContext;
		%feature("autodoc", "	* Sets a Context : according to receiving appli, to be interpreted by the Actor

	:param name:
	:type name: char *
	:param ctx:
	:type ctx: Handle_Standard_Transient &
	:rtype: None
") SetContext;
		void SetContext (const char * name,const Handle_Standard_Transient & ctx);
		%feature("compactdefaultargs") GetContext;
		%feature("autodoc", "	* Returns the Context attached to a name, if set and if it is Kind of the type, else a Null Handle Returns True if OK, False if no Context

	:param name:
	:type name: char *
	:param type:
	:type type: Handle_Standard_Type &
	:param ctx:
	:type ctx: Handle_Standard_Transient &
	:rtype: bool
") GetContext;
		Standard_Boolean GetContext (const char * name,const Handle_Standard_Type & type,Handle_Standard_Transient & ctx);
		%feature("compactdefaultargs") Context;
		%feature("autodoc", "	* Returns (modifiable) the whole definition of Context Rather for internal use (ex.: preparing and setting in once)

	:rtype: Handle_Dico_DictionaryOfTransient
") Context;
		Handle_Dico_DictionaryOfTransient Context ();
		%feature("compactdefaultargs") SetFileName;
		%feature("autodoc", "	* Sets a new value for (loaded) file name

	:param name:
	:type name: char *
	:rtype: None
") SetFileName;
		void SetFileName (const char * name);
		%feature("compactdefaultargs") FileName;
		%feature("autodoc", "	* Returns actual value of file name

	:rtype: char *
") FileName;
		const char * FileName ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	* Clears data, according mode : -1 all 0 nothing done +1 final results +2 working data (model, context, transfer process)

	:param mode:
	:type mode: int
	:rtype: None
") Clear;
		void Clear (const Standard_Integer mode);
		%feature("compactdefaultargs") TransientProcess;
		%feature("autodoc", "	* Returns the currently used TransientProcess It is computed from the model by TransferReadRoots, or by BeginTransferRead

	:rtype: Handle_Transfer_TransientProcess
") TransientProcess;
		Handle_Transfer_TransientProcess TransientProcess ();
		%feature("compactdefaultargs") SetTransientProcess;
		%feature("autodoc", "	* Forces the TransientProcess Remark : it also changes the Model and the Actor, from those recorded in the new TransientProcess

	:param TP:
	:type TP: Handle_Transfer_TransientProcess &
	:rtype: None
") SetTransientProcess;
		void SetTransientProcess (const Handle_Transfer_TransientProcess & TP);
		%feature("compactdefaultargs") RecordResult;
		%feature("autodoc", "	* Records a final result of transferring an entity This result is recorded as a ResultFromModel, taken from the TransientProcess Returns True if a result is available, False else

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: bool
") RecordResult;
		Standard_Boolean RecordResult (const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") IsRecorded;
		%feature("autodoc", "	* Returns True if a final result is recorded for an entity Remark that it can bring no effective result if transfer has completely failed (FinalResult brings only fail messages ...)

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: bool
") IsRecorded;
		Standard_Boolean IsRecorded (const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") HasResult;
		%feature("autodoc", "	* Returns True if a final result is recorded AND BRINGS AN EFFECTIVE RESULT (else, it brings only fail messages)

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: bool
") HasResult;
		Standard_Boolean HasResult (const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") RecordedList;
		%feature("autodoc", "	* Returns the list of entities to which a final result is attached (i.e. processed by RecordResult)

	:rtype: Handle_TColStd_HSequenceOfTransient
") RecordedList;
		Handle_TColStd_HSequenceOfTransient RecordedList ();
		%feature("compactdefaultargs") Skip;
		%feature("autodoc", "	* Note that an entity has been required for transfer but no result at all is available (typically : case not implemented) It is not an error, but it gives a specific status : Skipped Returns True if done, False if <ent> is not in starting model

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: bool
") Skip;
		Standard_Boolean Skip (const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") IsSkipped;
		%feature("autodoc", "	* Returns True if an entity is noted as skipped

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: bool
") IsSkipped;
		Standard_Boolean IsSkipped (const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") IsMarked;
		%feature("autodoc", "	* Returns True if an entity has been asked for transfert, hence it is marked, as : Recorded (a computation has ran, with or without an effective result), or Skipped (case ignored)

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: bool
") IsMarked;
		Standard_Boolean IsMarked (const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") FinalResult;
		%feature("autodoc", "	* Returns the final result recorded for an entity, as such

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: Handle_Transfer_ResultFromModel
") FinalResult;
		Handle_Transfer_ResultFromModel FinalResult (const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") FinalEntityLabel;
		%feature("autodoc", "	* Returns the label attached to an entity recorded for final, or an empty string if not recorded

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: char *
") FinalEntityLabel;
		const char * FinalEntityLabel (const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") FinalEntityNumber;
		%feature("autodoc", "	* Returns the number attached to the entity recorded for final, or zero if not recorded (looks in the ResultFromModel)

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: int
") FinalEntityNumber;
		Standard_Integer FinalEntityNumber (const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") ResultFromNumber;
		%feature("autodoc", "	* Returns the final result recorded for a NUMBER of entity (internal use). Null if out of range

	:param num:
	:type num: int
	:rtype: Handle_Transfer_ResultFromModel
") ResultFromNumber;
		Handle_Transfer_ResultFromModel ResultFromNumber (const Standard_Integer num);
		%feature("compactdefaultargs") TransientResult;
		%feature("autodoc", "	* Returns the resulting object as a Transient Null Handle if no result or result not transient

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: Handle_Standard_Transient
") TransientResult;
		Handle_Standard_Transient TransientResult (const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") ShapeResult;
		%feature("autodoc", "	* Returns the resulting object as a Shape Null Shape if no result or result not a shape

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: TopoDS_Shape
") ShapeResult;
		TopoDS_Shape ShapeResult (const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") ClearResult;
		%feature("autodoc", "	* Clears recorded result for an entity, according mode <mode> = -1 : true, complete, clearing (erasing result) <mode> >= 0 : simple 'stripping', see ResultFromModel, in particular, 0 for simple internal strip, 10 for all but final result, 11 for all : just label, status and filename are kept Returns True when done, False if nothing was to clear

	:param ent:
	:type ent: Handle_Standard_Transient &
	:param mode:
	:type mode: int
	:rtype: bool
") ClearResult;
		Standard_Boolean ClearResult (const Handle_Standard_Transient & ent,const Standard_Integer mode);
		%feature("compactdefaultargs") EntityFromResult;
		%feature("autodoc", "	* Returns an entity from which a given result was produced. If <mode> = 0 (D), searches in last root transfers If <mode> = 1, searches in last (root & sub) transfers If <mode> = 2, searches in root recorded results If <mode> = 3, searches in all (root & sub) recordeds <res> can be, either a transient object (result itself) or a binder. For a binder of shape, calls EntityFromShapeResult Returns a Null Handle if <res> not recorded

	:param res:
	:type res: Handle_Standard_Transient &
	:param mode: default value is 0
	:type mode: int
	:rtype: Handle_Standard_Transient
") EntityFromResult;
		Handle_Standard_Transient EntityFromResult (const Handle_Standard_Transient & res,const Standard_Integer mode = 0);
		%feature("compactdefaultargs") EntityFromShapeResult;
		%feature("autodoc", "	* Returns an entity from which a given shape result was produced Returns a Null Handle if <res> not recorded or not a Shape

	:param res:
	:type res: TopoDS_Shape &
	:param mode: default value is 0
	:type mode: int
	:rtype: Handle_Standard_Transient
") EntityFromShapeResult;
		Handle_Standard_Transient EntityFromShapeResult (const TopoDS_Shape & res,const Standard_Integer mode = 0);
		%feature("compactdefaultargs") EntitiesFromShapeList;
		%feature("autodoc", "	* Returns the list of entities from which some shapes were produced : it corresponds to a loop on EntityFromShapeResult, but is optimised

	:param res:
	:type res: Handle_TopTools_HSequenceOfShape &
	:param mode: default value is 0
	:type mode: int
	:rtype: Handle_TColStd_HSequenceOfTransient
") EntitiesFromShapeList;
		Handle_TColStd_HSequenceOfTransient EntitiesFromShapeList (const Handle_TopTools_HSequenceOfShape & res,const Standard_Integer mode = 0);
		%feature("compactdefaultargs") CheckList;
		%feature("autodoc", "	* Returns the CheckList resulting from transferring <ent>, i.e. stored in its recorded form ResultFromModel (empty if transfer successful or not recorded ...) //! If <ent> is the Model, returns the complete cumulated check-list, <level> is ignored //! If <ent> is an entity of the Model, <level> applies as follows <level> : -1 for <ent> only, LAST transfer (TransientProcess) <level> : 0 for <ent> only (D) 1 for <ent> and its immediate subtransfers, if any 2 for <ent> and subtransferts at all levels

	:param ent:
	:type ent: Handle_Standard_Transient &
	:param level: default value is 0
	:type level: int
	:rtype: Interface_CheckIterator
") CheckList;
		Interface_CheckIterator CheckList (const Handle_Standard_Transient & ent,const Standard_Integer level = 0);
		%feature("compactdefaultargs") HasChecks;
		%feature("autodoc", "	* Returns True if an entity (with a final result) has checks : - failsonly = False : any kind of check message - failsonly = True : fails only Returns False if <ent> is not recorded

	:param ent:
	:type ent: Handle_Standard_Transient &
	:param failsonly:
	:type failsonly: bool
	:rtype: bool
") HasChecks;
		Standard_Boolean HasChecks (const Handle_Standard_Transient & ent,const Standard_Boolean failsonly);
		%feature("compactdefaultargs") CheckedList;
		%feature("autodoc", "	* Returns the list of starting entities to which a given check status is attached, IN FINAL RESULTS <ent> can be an entity, or the model to query all entities Below, 'entities' are, either <ent> plus its sub-transferred, or all the entities of the model //! <check> = -2 , all entities whatever the check (see result) <check> = -1 , entities with no fail (warning allowed) <check> = 0 , entities with no check at all <check> = 1 , entities with warning but no fail <check> = 2 , entities with fail <result> : if True, only entities with an attached result Remark : result True and check=0 will give an empty list

	:param ent:
	:type ent: Handle_Standard_Transient &
	:param withcheck: default value is Interface_CheckAny
	:type withcheck: Interface_CheckStatus
	:param result: default value is Standard_True
	:type result: bool
	:rtype: Handle_TColStd_HSequenceOfTransient
") CheckedList;
		Handle_TColStd_HSequenceOfTransient CheckedList (const Handle_Standard_Transient & ent,const Interface_CheckStatus withcheck = Interface_CheckAny,const Standard_Boolean result = Standard_True);
		%feature("compactdefaultargs") BeginTransfer;
		%feature("autodoc", "	* Defines a new TransferProcess for reading transfer Returns True if done, False if data are not properly defined (the Model, the Actor for Read)

	:rtype: bool
") BeginTransfer;
		Standard_Boolean BeginTransfer ();
		%feature("compactdefaultargs") Recognize;
		%feature("autodoc", "	* Tells if an entity is recognized as a valid candidate for Transfer. Calls method Recognize from the Actor (if known)

	:param ent:
	:type ent: Handle_Standard_Transient &
	:rtype: bool
") Recognize;
		Standard_Boolean Recognize (const Handle_Standard_Transient & ent);
		%feature("compactdefaultargs") TransferOne;
		%feature("autodoc", "	* Commands the transfer on reading for an entity to data for Imagine, using the selected Actor for Read Returns count of transferred entities, ok or with fails (0/1) If <rec> is True (D), the result is recorded by RecordResult

	:param ent:
	:type ent: Handle_Standard_Transient &
	:param rec: default value is Standard_True
	:type rec: bool
	:rtype: int
") TransferOne;
		Standard_Integer TransferOne (const Handle_Standard_Transient & ent,const Standard_Boolean rec = Standard_True);
		%feature("compactdefaultargs") TransferList;
		%feature("autodoc", "	* Commands the transfer on reading for a list of entities to data for Imagine, using the selected Actor for Read Returns count of transferred entities, ok or with fails (0/1) If <rec> is True (D), the results are recorded by RecordResult

	:param list:
	:type list: Handle_TColStd_HSequenceOfTransient &
	:param rec: default value is Standard_True
	:type rec: bool
	:rtype: int
") TransferList;
		Standard_Integer TransferList (const Handle_TColStd_HSequenceOfTransient & list,const Standard_Boolean rec = Standard_True);
		%feature("compactdefaultargs") TransferRoots;
		%feature("autodoc", "	* Transfers the content of the current Interface Model to data handled by Imagine, starting from its Roots (determined by the Graph <G>), using the selected Actor for Read Returns the count of performed root transfers (i.e. 0 if none) or -1 if no actor is defined

	:param G:
	:type G: Interface_Graph &
	:rtype: int
") TransferRoots;
		Standard_Integer TransferRoots (const Interface_Graph & G);
		%feature("compactdefaultargs") TransferClear;
		%feature("autodoc", "	* Clears the results attached to an entity if <ents> equates the starting model, clears all results

	:param ent:
	:type ent: Handle_Standard_Transient &
	:param level: default value is 0
	:type level: int
	:rtype: None
") TransferClear;
		void TransferClear (const Handle_Standard_Transient & ent,const Standard_Integer level = 0);
		%feature("compactdefaultargs") PrintStats;
		%feature("autodoc", "	* Prints statistics on current Trace File, according <what> and <mode>. See PrintStatsProcess for details

	:param what:
	:type what: int
	:param mode: default value is 0
	:type mode: int
	:rtype: None
") PrintStats;
		void PrintStats (const Standard_Integer what,const Standard_Integer mode = 0);
		%feature("compactdefaultargs") LastCheckList;
		%feature("autodoc", "	* Returns the CheckList resulting from last TransferRead i.e. from TransientProcess itself, recorded from last Clear

	:rtype: Interface_CheckIterator
") LastCheckList;
		Interface_CheckIterator LastCheckList ();
		%feature("compactdefaultargs") LastTransferList;
		%feature("autodoc", "	* Returns the list of entities recorded as lastly transferred i.e. from TransientProcess itself, recorded from last Clear If <roots> is True , considers only roots of transfer If <roots> is False, considers all entities bound with result

	:param roots:
	:type roots: bool
	:rtype: Handle_TColStd_HSequenceOfTransient
") LastTransferList;
		Handle_TColStd_HSequenceOfTransient LastTransferList (const Standard_Boolean roots);
		%feature("compactdefaultargs") ShapeResultList;
		%feature("autodoc", "	* Returns a list of result Shapes If <rec> is True , sees RecordedList If <rec> is False, sees LastTransferList (last ROOT transfers) For each one, if it is a Shape, it is cumulated to the list If no Shape is found, returns an empty Sequence

	:param rec:
	:type rec: bool
	:rtype: Handle_TopTools_HSequenceOfShape
") ShapeResultList;
		Handle_TopTools_HSequenceOfShape ShapeResultList (const Standard_Boolean rec);
		%feature("compactdefaultargs") PrintStatsProcess;
		%feature("autodoc", "	* This routines prints statistics about a TransientProcess It can be called, by a TransferReader, or isolately Prints are done on the default trace file <what> defines what kind of statistics are to be printed : 0 : basic figures 1 : root results 2 : all recorded (roots, intermediate, checked entities) 3 : abnormal records 4 : check messages (warnings and fails) 5 : fail messages //! <mode> is used according <what> : <what> = 0 : <mode> is ignored <what> = 1,2,3 : <mode> as follows : 0 (D) : just lists numbers of concerned entities in the model 1 : for each entity, gives number,label, type and result type and/or status (fail/warning...) 2 : for each entity, gives maximal information (i.e. checks) 3 : counts per type of starting entity (class type) 4 : counts per result type and/or status 5 : counts per couple (starting type / result type/status) 6 : idem plus gives for each item, the list of numbers of entities in the starting model //! <what> = 4,5 : modes relays on an enum PrintCount : 0 (D) : ItemsByEntity (sequential list by entity) 1 : CountByItem 2 : ShortByItem (count + 5 first numbers) 3 : ListByItem (count + entity numbers) 4 : EntitiesByItem (count + entity numbers and labels)

	:param TP:
	:type TP: Handle_Transfer_TransientProcess &
	:param what:
	:type what: int
	:param mode: default value is 0
	:type mode: int
	:rtype: void
") PrintStatsProcess;
		static void PrintStatsProcess (const Handle_Transfer_TransientProcess & TP,const Standard_Integer what,const Standard_Integer mode = 0);
		%feature("compactdefaultargs") PrintStatsOnList;
		%feature("autodoc", "	* Works as PrintStatsProcess, but displays data only on the entities which are in <list> (filter)

	:param TP:
	:type TP: Handle_Transfer_TransientProcess &
	:param list:
	:type list: Handle_TColStd_HSequenceOfTransient &
	:param what:
	:type what: int
	:param mode: default value is 0
	:type mode: int
	:rtype: void
") PrintStatsOnList;
		static void PrintStatsOnList (const Handle_Transfer_TransientProcess & TP,const Handle_TColStd_HSequenceOfTransient & list,const Standard_Integer what,const Standard_Integer mode = 0);
};


%extend XSControl_TransferReader {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_XSControl_TransferReader(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_XSControl_TransferReader::Handle_XSControl_TransferReader %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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
    XSControl_TransferReader* _get_reference() {
    return (XSControl_TransferReader*)$self->Access();
    }
};

%extend Handle_XSControl_TransferReader {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend XSControl_TransferReader {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XSControl_TransferWriter;
class XSControl_TransferWriter : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") XSControl_TransferWriter;
		%feature("autodoc", "	* Creates a TransferWriter, empty, ready to run with an empty FinderProcess (but no controller, etc)

	:rtype: None
") XSControl_TransferWriter;
		 XSControl_TransferWriter ();
		%feature("compactdefaultargs") FinderProcess;
		%feature("autodoc", "	* Returns the FinderProcess itself

	:rtype: Handle_Transfer_FinderProcess
") FinderProcess;
		Handle_Transfer_FinderProcess FinderProcess ();
		%feature("compactdefaultargs") SetFinderProcess;
		%feature("autodoc", "	* Sets a new FinderProcess and forgets the former one

	:param FP:
	:type FP: Handle_Transfer_FinderProcess &
	:rtype: None
") SetFinderProcess;
		void SetFinderProcess (const Handle_Transfer_FinderProcess & FP);
		%feature("compactdefaultargs") Controller;
		%feature("autodoc", "	* Returns the currently used Controller

	:rtype: Handle_XSControl_Controller
") Controller;
		Handle_XSControl_Controller Controller ();
		%feature("compactdefaultargs") SetController;
		%feature("autodoc", "	* Sets a new Controller, also sets a new FinderProcess

	:param ctl:
	:type ctl: Handle_XSControl_Controller &
	:rtype: None
") SetController;
		void SetController (const Handle_XSControl_Controller & ctl);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	* Clears recorded data according a mode 0 clears FinderProcess (results, checks) -1 create a new FinderProcess

	:param mode:
	:type mode: int
	:rtype: None
") Clear;
		void Clear (const Standard_Integer mode);
		%feature("compactdefaultargs") TransferMode;
		%feature("autodoc", "	* Returns the current Transfer Mode (an Integer) It will be interpreted by the Controller to run Transfers This call form could be later replaced by more specific ones (parameters suited for each norm / transfer case)

	:rtype: int
") TransferMode;
		Standard_Integer TransferMode ();
		%feature("compactdefaultargs") SetTransferMode;
		%feature("autodoc", "	* Changes the Transfer Mode

	:param mode:
	:type mode: int
	:rtype: None
") SetTransferMode;
		void SetTransferMode (const Standard_Integer mode);
		%feature("compactdefaultargs") PrintStats;
		%feature("autodoc", "	* Prints statistics on current Trace File, according what,mode See PrintStatsProcess for details

	:param what:
	:type what: int
	:param mode: default value is 0
	:type mode: int
	:rtype: None
") PrintStats;
		void PrintStats (const Standard_Integer what,const Standard_Integer mode = 0);
		%feature("compactdefaultargs") RecognizeTransient;
		%feature("autodoc", "	* Tells if a transient object (from an application) is a valid candidate for a transfer to a model Asks the Controller (RecognizeWriteTransient) If <obj> is a HShape, calls RecognizeShape

	:param obj:
	:type obj: Handle_Standard_Transient &
	:rtype: bool
") RecognizeTransient;
		Standard_Boolean RecognizeTransient (const Handle_Standard_Transient & obj);
		%feature("compactdefaultargs") TransferWriteTransient;
		%feature("autodoc", "	* Transfers a Transient object (from an application) to a model of current norm, according to the last call to SetTransferMode Works by calling the Controller Returns status : =0 if OK, >0 if error during transfer, <0 if transfer badly initialised

	:param model:
	:type model: Handle_Interface_InterfaceModel &
	:param obj:
	:type obj: Handle_Standard_Transient &
	:rtype: IFSelect_ReturnStatus
") TransferWriteTransient;
		IFSelect_ReturnStatus TransferWriteTransient (const Handle_Interface_InterfaceModel & model,const Handle_Standard_Transient & obj);
		%feature("compactdefaultargs") RecognizeShape;
		%feature("autodoc", "	* Tells if a Shape is valid for a transfer to a model Asks the Controller (RecognizeWriteShape)

	:param shape:
	:type shape: TopoDS_Shape &
	:rtype: bool
") RecognizeShape;
		Standard_Boolean RecognizeShape (const TopoDS_Shape & shape);
		%feature("compactdefaultargs") TransferWriteShape;
		%feature("autodoc", "	* Transfers a Shape from CasCade to a model of current norm, according to the last call to SetTransferMode Works by calling the Controller Returns status : =0 if OK, >0 if error during transfer, <0 if transfer badly initialised

	:param model:
	:type model: Handle_Interface_InterfaceModel &
	:param shape:
	:type shape: TopoDS_Shape &
	:rtype: IFSelect_ReturnStatus
") TransferWriteShape;
		IFSelect_ReturnStatus TransferWriteShape (const Handle_Interface_InterfaceModel & model,const TopoDS_Shape & shape);
		%feature("compactdefaultargs") CheckList;
		%feature("autodoc", "	* Returns the check-list of last transfer (write), i.e. the check-list currently recorded in the FinderProcess

	:rtype: Interface_CheckIterator
") CheckList;
		Interface_CheckIterator CheckList ();
		%feature("compactdefaultargs") ResultCheckList;
		%feature("autodoc", "	* Returns the check-list of last transfer (write), but tries to bind to each check, the resulting entity in the model instead of keeping the original Mapper, whenever known

	:param model:
	:type model: Handle_Interface_InterfaceModel &
	:rtype: Interface_CheckIterator
") ResultCheckList;
		Interface_CheckIterator ResultCheckList (const Handle_Interface_InterfaceModel & model);
		%feature("compactdefaultargs") PrintStatsProcess;
		%feature("autodoc", "	* Forecast to print statitics about a FinderProcess

	:param TP:
	:type TP: Handle_Transfer_FinderProcess &
	:param what:
	:type what: int
	:param mode: default value is 0
	:type mode: int
	:rtype: void
") PrintStatsProcess;
		static void PrintStatsProcess (const Handle_Transfer_FinderProcess & TP,const Standard_Integer what,const Standard_Integer mode = 0);
};


%extend XSControl_TransferWriter {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_XSControl_TransferWriter(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_XSControl_TransferWriter::Handle_XSControl_TransferWriter %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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
    XSControl_TransferWriter* _get_reference() {
    return (XSControl_TransferWriter*)$self->Access();
    }
};

%extend Handle_XSControl_TransferWriter {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend XSControl_TransferWriter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XSControl_Utils;
class XSControl_Utils {
	public:
		%feature("compactdefaultargs") XSControl_Utils;
		%feature("autodoc", "	* the only use of this, is to allow a frontal to get one distinct 'Utils' set per separate engine

	:rtype: None
") XSControl_Utils;
		 XSControl_Utils ();
		%feature("compactdefaultargs") TraceLine;
		%feature("autodoc", "	* Just prints a line into the current Trace File. This allows to better characterise the various trace outputs, as desired.

	:param line:
	:type line: char *
	:rtype: None
") TraceLine;
		void TraceLine (const char * line);
		%feature("compactdefaultargs") TraceLines;
		%feature("autodoc", "	* Just prints a line or a set of lines into the current Trace File. <lines> can be a HAscii/ExtendedString (produces a print without ending line) or a HSequence or HArray1 Of .. (one new line per item)

	:param lines:
	:type lines: Handle_Standard_Transient &
	:rtype: None
") TraceLines;
		void TraceLines (const Handle_Standard_Transient & lines);
		%feature("compactdefaultargs") IsKind;
		%feature("autodoc", "	:param item:
	:type item: Handle_Standard_Transient &
	:param what:
	:type what: Handle_Standard_Type &
	:rtype: bool
") IsKind;
		Standard_Boolean IsKind (const Handle_Standard_Transient & item,const Handle_Standard_Type & what);
		%feature("compactdefaultargs") TypeName;
		%feature("autodoc", "	* Returns the name of the dynamic type of an object, i.e. : If it is a Type, its Name If it is a object not a type, the Name of its DynamicType If it is Null, an empty string If <nopk> is False (D), gives complete name If <nopk> is True, returns class name without package

	:param item:
	:type item: Handle_Standard_Transient &
	:param nopk: default value is Standard_False
	:type nopk: bool
	:rtype: char *
") TypeName;
		const char * TypeName (const Handle_Standard_Transient & item,const Standard_Boolean nopk = Standard_False);
		%feature("compactdefaultargs") TraValue;
		%feature("autodoc", "	:param list:
	:type list: Handle_Standard_Transient &
	:param num:
	:type num: int
	:rtype: Handle_Standard_Transient
") TraValue;
		Handle_Standard_Transient TraValue (const Handle_Standard_Transient & list,const Standard_Integer num);
		%feature("compactdefaultargs") NewSeqTra;
		%feature("autodoc", "	:rtype: Handle_TColStd_HSequenceOfTransient
") NewSeqTra;
		Handle_TColStd_HSequenceOfTransient NewSeqTra ();
		%feature("compactdefaultargs") AppendTra;
		%feature("autodoc", "	:param seqval:
	:type seqval: Handle_TColStd_HSequenceOfTransient &
	:param traval:
	:type traval: Handle_Standard_Transient &
	:rtype: None
") AppendTra;
		void AppendTra (const Handle_TColStd_HSequenceOfTransient & seqval,const Handle_Standard_Transient & traval);
		%feature("compactdefaultargs") DateString;
		%feature("autodoc", "	:param yy:
	:type yy: int
	:param mm:
	:type mm: int
	:param dd:
	:type dd: int
	:param hh:
	:type hh: int
	:param mn:
	:type mn: int
	:param ss:
	:type ss: int
	:rtype: char *
") DateString;
		const char * DateString (const Standard_Integer yy,const Standard_Integer mm,const Standard_Integer dd,const Standard_Integer hh,const Standard_Integer mn,const Standard_Integer ss);
		%feature("compactdefaultargs") DateValues;
		%feature("autodoc", "	:param text:
	:type text: char *
	:param yy:
	:type yy: int &
	:param mm:
	:type mm: int &
	:param dd:
	:type dd: int &
	:param hh:
	:type hh: int &
	:param mn:
	:type mn: int &
	:param ss:
	:type ss: int &
	:rtype: None
") DateValues;
		void DateValues (const char * text,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("compactdefaultargs") ToCString;
		%feature("autodoc", "	:param strval:
	:type strval: Handle_TCollection_HAsciiString &
	:rtype: char *
") ToCString;
		const char * ToCString (const Handle_TCollection_HAsciiString & strval);
		%feature("compactdefaultargs") ToCString;
		%feature("autodoc", "	:param strval:
	:type strval: TCollection_AsciiString &
	:rtype: char *
") ToCString;
		const char * ToCString (const TCollection_AsciiString & strval);
		%feature("compactdefaultargs") ToHString;
		%feature("autodoc", "	:param strcon:
	:type strcon: char *
	:rtype: Handle_TCollection_HAsciiString
") ToHString;
		Handle_TCollection_HAsciiString ToHString (const char * strcon);
		%feature("compactdefaultargs") ToAString;
		%feature("autodoc", "	:param strcon:
	:type strcon: char *
	:rtype: TCollection_AsciiString
") ToAString;
		TCollection_AsciiString ToAString (const char * strcon);
		%feature("compactdefaultargs") ToEString;
		%feature("autodoc", "	:param strval:
	:type strval: Handle_TCollection_HExtendedString &
	:rtype: Standard_ExtString
") ToEString;
		Standard_ExtString ToEString (const Handle_TCollection_HExtendedString & strval);
		%feature("compactdefaultargs") ToEString;
		%feature("autodoc", "	:param strval:
	:type strval: TCollection_ExtendedString &
	:rtype: Standard_ExtString
") ToEString;
		Standard_ExtString ToEString (const TCollection_ExtendedString & strval);
		%feature("compactdefaultargs") ToHString;
		%feature("autodoc", "	:param strcon:
	:type strcon: Standard_ExtString
	:rtype: Handle_TCollection_HExtendedString
") ToHString;
		Handle_TCollection_HExtendedString ToHString (const Standard_ExtString strcon);
		%feature("compactdefaultargs") ToXString;
		%feature("autodoc", "	:param strcon:
	:type strcon: Standard_ExtString
	:rtype: TCollection_ExtendedString
") ToXString;
		TCollection_ExtendedString ToXString (const Standard_ExtString strcon);
		%feature("compactdefaultargs") AsciiToExtended;
		%feature("autodoc", "	:param str:
	:type str: char *
	:rtype: Standard_ExtString
") AsciiToExtended;
		Standard_ExtString AsciiToExtended (const char * str);
		%feature("compactdefaultargs") IsAscii;
		%feature("autodoc", "	:param str:
	:type str: Standard_ExtString
	:rtype: bool
") IsAscii;
		Standard_Boolean IsAscii (const Standard_ExtString str);
		%feature("compactdefaultargs") ExtendedToAscii;
		%feature("autodoc", "	:param str:
	:type str: Standard_ExtString
	:rtype: char *
") ExtendedToAscii;
		const char * ExtendedToAscii (const Standard_ExtString str);
		%feature("compactdefaultargs") CStrValue;
		%feature("autodoc", "	:param list:
	:type list: Handle_Standard_Transient &
	:param num:
	:type num: int
	:rtype: char *
") CStrValue;
		const char * CStrValue (const Handle_Standard_Transient & list,const Standard_Integer num);
		%feature("compactdefaultargs") EStrValue;
		%feature("autodoc", "	:param list:
	:type list: Handle_Standard_Transient &
	:param num:
	:type num: int
	:rtype: Standard_ExtString
") EStrValue;
		Standard_ExtString EStrValue (const Handle_Standard_Transient & list,const Standard_Integer num);
		%feature("compactdefaultargs") NewSeqCStr;
		%feature("autodoc", "	:rtype: Handle_TColStd_HSequenceOfHAsciiString
") NewSeqCStr;
		Handle_TColStd_HSequenceOfHAsciiString NewSeqCStr ();
		%feature("compactdefaultargs") AppendCStr;
		%feature("autodoc", "	:param seqval:
	:type seqval: Handle_TColStd_HSequenceOfHAsciiString &
	:param strval:
	:type strval: char *
	:rtype: None
") AppendCStr;
		void AppendCStr (const Handle_TColStd_HSequenceOfHAsciiString & seqval,const char * strval);
		%feature("compactdefaultargs") NewSeqEStr;
		%feature("autodoc", "	:rtype: Handle_TColStd_HSequenceOfHExtendedString
") NewSeqEStr;
		Handle_TColStd_HSequenceOfHExtendedString NewSeqEStr ();
		%feature("compactdefaultargs") AppendEStr;
		%feature("autodoc", "	:param seqval:
	:type seqval: Handle_TColStd_HSequenceOfHExtendedString &
	:param strval:
	:type strval: Standard_ExtString
	:rtype: None
") AppendEStr;
		void AppendEStr (const Handle_TColStd_HSequenceOfHExtendedString & seqval,const Standard_ExtString strval);
		%feature("compactdefaultargs") WriteShape;
		%feature("autodoc", "	* Writes a Shape under the internal BRepTools form (an internal help utility) Returns True if writing has succeeded, False else

	:param shape:
	:type shape: TopoDS_Shape &
	:param filename:
	:type filename: char *
	:rtype: bool
") WriteShape;
		Standard_Boolean WriteShape (const TopoDS_Shape & shape,const char * filename);
		%feature("compactdefaultargs") NewShape;
		%feature("autodoc", "	* Returns a new empty, undefined Shape, which can then be filled by ReadShape

	:rtype: TopoDS_Shape
") NewShape;
		TopoDS_Shape NewShape ();
		%feature("compactdefaultargs") ReadShape;
		%feature("autodoc", "	* Reads a Shape from the internal BRepTools form and returns it (an internal help utility) Returns True if reading has succeeded, False else

	:param shape:
	:type shape: TopoDS_Shape &
	:param filename:
	:type filename: char *
	:rtype: bool
") ReadShape;
		Standard_Boolean ReadShape (TopoDS_Shape & shape,const char * filename);
		%feature("compactdefaultargs") IsNullShape;
		%feature("autodoc", "	* Returns True if a Shape is Null

	:param shape:
	:type shape: TopoDS_Shape &
	:rtype: bool
") IsNullShape;
		Standard_Boolean IsNullShape (const TopoDS_Shape & shape);
		%feature("compactdefaultargs") CompoundFromSeq;
		%feature("autodoc", "	* Converts a list of Shapes to a Compound (a kind of Shape)

	:param seqval:
	:type seqval: Handle_TopTools_HSequenceOfShape &
	:rtype: TopoDS_Shape
") CompoundFromSeq;
		TopoDS_Shape CompoundFromSeq (const Handle_TopTools_HSequenceOfShape & seqval);
		%feature("compactdefaultargs") ShapeType;
		%feature("autodoc", "	* Returns the type of a Shape : true type if <compound> is False If <compound> is True and <shape> is a Compound, iterates on its items. If all are of the same type, returns this type. Else, returns COMPOUND. If it is empty, returns SHAPE For a Null Shape, returns SHAPE

	:param shape:
	:type shape: TopoDS_Shape &
	:param compound:
	:type compound: bool
	:rtype: TopAbs_ShapeEnum
") ShapeType;
		TopAbs_ShapeEnum ShapeType (const TopoDS_Shape & shape,const Standard_Boolean compound);
		%feature("compactdefaultargs") SortedCompound;
		%feature("autodoc", "	* From a Shape, builds a Compound as follows : explores it level by level If <explore> is False, only COMPOUND items. Else, all items Adds to the result, shapes which comply to <type> + if <type> is WIRE, considers free edges (and makes wires) + if <type> is SHELL, considers free faces (and makes shells) If <compound> is True, gathers items in compounds which correspond to starting COMPOUND,SOLID or SHELL containers, or items directly contained in a Compound

	:param shape:
	:type shape: TopoDS_Shape &
	:param type:
	:type type: TopAbs_ShapeEnum
	:param explore:
	:type explore: bool
	:param compound:
	:type compound: bool
	:rtype: TopoDS_Shape
") SortedCompound;
		TopoDS_Shape SortedCompound (const TopoDS_Shape & shape,const TopAbs_ShapeEnum type,const Standard_Boolean explore,const Standard_Boolean compound);
		%feature("compactdefaultargs") ShapeValue;
		%feature("autodoc", "	:param seqv:
	:type seqv: Handle_TopTools_HSequenceOfShape &
	:param num:
	:type num: int
	:rtype: TopoDS_Shape
") ShapeValue;
		TopoDS_Shape ShapeValue (const Handle_TopTools_HSequenceOfShape & seqv,const Standard_Integer num);
		%feature("compactdefaultargs") NewSeqShape;
		%feature("autodoc", "	:rtype: Handle_TopTools_HSequenceOfShape
") NewSeqShape;
		Handle_TopTools_HSequenceOfShape NewSeqShape ();
		%feature("compactdefaultargs") AppendShape;
		%feature("autodoc", "	:param seqv:
	:type seqv: Handle_TopTools_HSequenceOfShape &
	:param shape:
	:type shape: TopoDS_Shape &
	:rtype: None
") AppendShape;
		void AppendShape (const Handle_TopTools_HSequenceOfShape & seqv,const TopoDS_Shape & shape);
		%feature("compactdefaultargs") ShapeBinder;
		%feature("autodoc", "	* Creates a Transient Object from a Shape : it is either a Binder (used by functions which require a Transient but can process a Shape, such as viewing functions) or a HShape (according to hs) Default is a HShape

	:param shape:
	:type shape: TopoDS_Shape &
	:param hs: default value is Standard_True
	:type hs: bool
	:rtype: Handle_Standard_Transient
") ShapeBinder;
		Handle_Standard_Transient ShapeBinder (const TopoDS_Shape & shape,const Standard_Boolean hs = Standard_True);
		%feature("compactdefaultargs") BinderShape;
		%feature("autodoc", "	* From a Transient, returns a Shape. In fact, recognizes ShapeBinder ShapeMapper and HShape

	:param tr:
	:type tr: Handle_Standard_Transient &
	:rtype: TopoDS_Shape
") BinderShape;
		TopoDS_Shape BinderShape (const Handle_Standard_Transient & tr);
		%feature("compactdefaultargs") SeqLength;
		%feature("autodoc", "	:param list:
	:type list: Handle_Standard_Transient &
	:rtype: int
") SeqLength;
		Standard_Integer SeqLength (const Handle_Standard_Transient & list);
		%feature("compactdefaultargs") SeqToArr;
		%feature("autodoc", "	:param seq:
	:type seq: Handle_Standard_Transient &
	:param first: default value is 1
	:type first: int
	:rtype: Handle_Standard_Transient
") SeqToArr;
		Handle_Standard_Transient SeqToArr (const Handle_Standard_Transient & seq,const Standard_Integer first = 1);
		%feature("compactdefaultargs") ArrToSeq;
		%feature("autodoc", "	:param arr:
	:type arr: Handle_Standard_Transient &
	:rtype: Handle_Standard_Transient
") ArrToSeq;
		Handle_Standard_Transient ArrToSeq (const Handle_Standard_Transient & arr);
		%feature("compactdefaultargs") SeqIntValue;
		%feature("autodoc", "	:param list:
	:type list: Handle_TColStd_HSequenceOfInteger &
	:param num:
	:type num: int
	:rtype: int
") SeqIntValue;
		Standard_Integer SeqIntValue (const Handle_TColStd_HSequenceOfInteger & list,const Standard_Integer num);
};


%extend XSControl_Utils {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XSControl_WorkSession;
class XSControl_WorkSession : public IFSelect_WorkSession {
	public:
		%feature("compactdefaultargs") XSControl_WorkSession;
		%feature("autodoc", "	:rtype: None
") XSControl_WorkSession;
		 XSControl_WorkSession ();
		%feature("compactdefaultargs") ClearData;
		%feature("autodoc", "	* In addition to basic ClearData, clears Transfer and Management for interactive use, for mode = 0,1,2 and over 4 Plus : mode = 5 to clear Transfers (both ways) only mode = 6 to clear enforced results mode = 7 to clear transfers, results

	:param mode:
	:type mode: int
	:rtype: void
") ClearData;
		virtual void ClearData (const Standard_Integer mode);
		%feature("compactdefaultargs") SelectNorm;
		%feature("autodoc", "	* Selects a Norm defined by its name. A Norm is described and handled by a Controller Returns True if done, False if <normname> is unknown //! A Profile may be set too. If no Profile is provided, the current Profile for this Norm is taken If the asked Profile is not defined for this Norm, it remains in current Profile, returned value is True

	:param normname:
	:type normname: char *
	:param profile: default value is ""
	:type profile: char *
	:rtype: bool
") SelectNorm;
		Standard_Boolean SelectNorm (const char * normname,const char * profile = "");
		%feature("compactdefaultargs") SelectProfile;
		%feature("autodoc", "	* Sets a Profile as current for the current Norm Returns True if done, False if <profile> is unknown for this norm //! For more infos on Profile, query the Profile of the Controller

	:param profile:
	:type profile: char *
	:rtype: bool
") SelectProfile;
		Standard_Boolean SelectProfile (const char * profile);
		%feature("compactdefaultargs") SetController;
		%feature("autodoc", "	* Selects a Norm defined by its Controller itself

	:param ctl:
	:type ctl: Handle_XSControl_Controller &
	:rtype: None
") SetController;
		void SetController (const Handle_XSControl_Controller & ctl);
		%feature("compactdefaultargs") AdaptNorm;
		%feature("autodoc", "	* This method is called once a new norm has been successfully selected. It can be redefined, default does nothing

	:rtype: void
") AdaptNorm;
		virtual void AdaptNorm ();
		%feature("compactdefaultargs") SelectedNorm;
		%feature("autodoc", "	* Returns the name of the last Selected Norm. If none is defined, returns an empty string By default, returns the complete name of the norm If <rsc> is True, returns the short name used for resource

	:param rsc: default value is Standard_False
	:type rsc: bool
	:rtype: char *
") SelectedNorm;
		const char * SelectedNorm (const Standard_Boolean rsc = Standard_False);
		%feature("compactdefaultargs") NormAdaptor;
		%feature("autodoc", "	* Returns the norm controller itself

	:rtype: Handle_XSControl_Controller
") NormAdaptor;
		Handle_XSControl_Controller NormAdaptor ();
		%feature("compactdefaultargs") Context;
		%feature("autodoc", "	* Returns the current Context List, Null if not defined The Context is given to the TransientProcess for TransferRead

	:rtype: Handle_Dico_DictionaryOfTransient
") Context;
		Handle_Dico_DictionaryOfTransient Context ();
		%feature("compactdefaultargs") SetAllContext;
		%feature("autodoc", "	* Sets the current Context List, as a whole Sets it to the TransferReader

	:param context:
	:type context: Handle_Dico_DictionaryOfTransient &
	:rtype: None
") SetAllContext;
		void SetAllContext (const Handle_Dico_DictionaryOfTransient & context);
		%feature("compactdefaultargs") ClearContext;
		%feature("autodoc", "	* Clears the whole current Context (nullifies it)

	:rtype: None
") ClearContext;
		void ClearContext ();
		%feature("compactdefaultargs") PrintTransferStatus;
		%feature("autodoc", "	* Prints the transfer status of a transferred item, as beeing the Mapped n0 <num>, from MapWriter if <wri> is True, or from MapReader if <wri> is False Returns True when done, False else (i.e. num out of range)

	:param num:
	:type num: int
	:param wri:
	:type wri: bool
	:param S:
	:type S: Handle_Message_Messenger &
	:rtype: bool
") PrintTransferStatus;
		Standard_Boolean PrintTransferStatus (const Standard_Integer num,const Standard_Boolean wri,const Handle_Message_Messenger & S);
		%feature("compactdefaultargs") InitTransferReader;
		%feature("autodoc", "	* Sets a Transfer Reader, by internal ways, according mode : 0 recreates it clear, 1 clears it (does not recreate) 2 aligns Roots of TransientProcess from final Results 3 aligns final Results from Roots of TransientProcess 4 begins a new transfer (by BeginTransfer) 5 recreates TransferReader then begins a new transfer

	:param mode:
	:type mode: int
	:rtype: None
") InitTransferReader;
		void InitTransferReader (const Standard_Integer mode);
		%feature("compactdefaultargs") SetTransferReader;
		%feature("autodoc", "	* Sets a Transfer Reader, which manages transfers on reading

	:param TR:
	:type TR: Handle_XSControl_TransferReader &
	:rtype: None
") SetTransferReader;
		void SetTransferReader (const Handle_XSControl_TransferReader & TR);
		%feature("compactdefaultargs") TransferReader;
		%feature("autodoc", "	* Returns the Transfer Reader, Null if not set

	:rtype: Handle_XSControl_TransferReader
") TransferReader;
		Handle_XSControl_TransferReader TransferReader ();
		%feature("compactdefaultargs") MapReader;
		%feature("autodoc", "	* Returns the TransientProcess(internal data for TransferReader)

	:rtype: Handle_Transfer_TransientProcess
") MapReader;
		Handle_Transfer_TransientProcess MapReader ();
		%feature("compactdefaultargs") SetMapReader;
		%feature("autodoc", "	* Changes the Map Reader, i.e. considers that the new one defines the relevant read results (forgets the former ones) Returns True when done, False in case of bad definition, i.e. if Model from TP differs from that of Session

	:param TP:
	:type TP: Handle_Transfer_TransientProcess &
	:rtype: bool
") SetMapReader;
		Standard_Boolean SetMapReader (const Handle_Transfer_TransientProcess & TP);
		%feature("compactdefaultargs") Result;
		%feature("autodoc", "	* Returns the result attached to a starting entity If <mode> = 0, returns Final Result If <mode> = 1, considers Last Result If <mode> = 2, considers Final, else if absent, Last returns it as Transient, if result is not transient returns the Binder <mode> = 10,11,12 idem but returns the Binder itself (if it is not, e.g. Shape, returns the Binder) <mode> = 20, returns the ResultFromModel

	:param ent:
	:type ent: Handle_Standard_Transient &
	:param mode:
	:type mode: int
	:rtype: Handle_Standard_Transient
") Result;
		Handle_Standard_Transient Result (const Handle_Standard_Transient & ent,const Standard_Integer mode);
		%feature("compactdefaultargs") TransferReadOne;
		%feature("autodoc", "	* Commands the transfer of, either one entity, or a list I.E. calls the TransferReader after having analysed <ents> It is cumulated from the last BeginTransfer <ents> is processed by GiveList, hence : - <ents> a Selection : its SelectionResult - <ents> a HSequenceOfTransient : this list - <ents> the Model : in this specific case, all the roots, with no cumulation of former transfers (TransferReadRoots)

	:param ents:
	:type ents: Handle_Standard_Transient &
	:rtype: int
") TransferReadOne;
		Standard_Integer TransferReadOne (const Handle_Standard_Transient & ents);
		%feature("compactdefaultargs") TransferReadRoots;
		%feature("autodoc", "	* Commands the transfer of all the root entities of the model i.e. calls TransferRoot from the TransferReader with the Graph No cumulation with former calls to TransferReadOne

	:rtype: int
") TransferReadRoots;
		Standard_Integer TransferReadRoots ();
		%feature("compactdefaultargs") NewModel;
		%feature("autodoc", "	* produces and returns a new Model well conditionned It is produced by the Norm Controller It can be Null (if this function is not implemented)

	:rtype: Handle_Interface_InterfaceModel
") NewModel;
		Handle_Interface_InterfaceModel NewModel ();
		%feature("compactdefaultargs") TransferWriter;
		%feature("autodoc", "	* Returns the Transfer Reader, Null if not set

	:rtype: Handle_XSControl_TransferWriter
") TransferWriter;
		Handle_XSControl_TransferWriter TransferWriter ();
		%feature("compactdefaultargs") MapWriter;
		%feature("autodoc", "	* Returns the FinderProcess (internal data for TransferWriter)

	:rtype: Handle_Transfer_FinderProcess
") MapWriter;
		Handle_Transfer_FinderProcess MapWriter ();
		%feature("compactdefaultargs") SetMapWriter;
		%feature("autodoc", "	* Changes the Map Reader, i.e. considers that the new one defines the relevant read results (forgets the former ones) Returns True when done, False if <FP> is Null

	:param FP:
	:type FP: Handle_Transfer_FinderProcess &
	:rtype: bool
") SetMapWriter;
		Standard_Boolean SetMapWriter (const Handle_Transfer_FinderProcess & FP);
		%feature("compactdefaultargs") SetModeWriteShape;
		%feature("autodoc", "	* Sets a mode to transfer Shapes from CasCade to entities of the current norm, which interprets it (see various Controllers) This call form could be later replaced by a more general one

	:param mode:
	:type mode: int
	:rtype: None
") SetModeWriteShape;
		void SetModeWriteShape (const Standard_Integer mode);
		%feature("compactdefaultargs") ModeWriteShape;
		%feature("autodoc", "	* Records the current Mode to Write Shapes

	:rtype: int
") ModeWriteShape;
		Standard_Integer ModeWriteShape ();
		%feature("compactdefaultargs") TransferWriteShape;
		%feature("autodoc", "	* Transfers a Shape from CasCade to a model of current norm, according to the last call to SetModeWriteShape Returns status :Done if OK, Fail if error during transfer, Error if transfer badly initialised

	:param shape:
	:type shape: TopoDS_Shape &
	:param compgraph: default value is Standard_True
	:type compgraph: bool
	:rtype: IFSelect_ReturnStatus
") TransferWriteShape;
		IFSelect_ReturnStatus TransferWriteShape (const TopoDS_Shape & shape,const Standard_Boolean compgraph = Standard_True);
		%feature("compactdefaultargs") TransferWriteCheckList;
		%feature("autodoc", "	* Returns the check-list of last transfer (write) It is recorded in the FinderProcess, but it must be bound with resulting entities (in the resulting file model) rather than with original objects (in fact, their mappers)

	:rtype: Interface_CheckIterator
") TransferWriteCheckList;
		Interface_CheckIterator TransferWriteCheckList ();
		%feature("compactdefaultargs") Vars;
		%feature("autodoc", "	:rtype: Handle_XSControl_Vars
") Vars;
		Handle_XSControl_Vars Vars ();
		%feature("compactdefaultargs") SetVars;
		%feature("autodoc", "	:param newvars:
	:type newvars: Handle_XSControl_Vars &
	:rtype: None
") SetVars;
		void SetVars (const Handle_XSControl_Vars & newvars);
		%feature("compactdefaultargs") ClearBinders;
		%feature("autodoc", "	* Clears binders

	:rtype: None
") ClearBinders;
		void ClearBinders ();
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
};


%extend XSControl_WorkSession {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_XSControl_WorkSession(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_XSControl_WorkSession::Handle_XSControl_WorkSession %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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
    XSControl_WorkSession* _get_reference() {
    return (XSControl_WorkSession*)$self->Access();
    }
};

%extend Handle_XSControl_WorkSession {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend XSControl_WorkSession {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor XSControl_Writer;
class XSControl_Writer {
	public:
		%feature("compactdefaultargs") XSControl_Writer;
		%feature("autodoc", "	* Creates a Writer from scratch

	:rtype: None
") XSControl_Writer;
		 XSControl_Writer ();
		%feature("compactdefaultargs") XSControl_Writer;
		%feature("autodoc", "	* Creates a Writer from scratch, with a norm name which identifie a Controller

	:param norm:
	:type norm: char *
	:rtype: None
") XSControl_Writer;
		 XSControl_Writer (const char * norm);
		%feature("compactdefaultargs") XSControl_Writer;
		%feature("autodoc", "	* Creates a Writer from an already existing Session If <scratch> is True (D), clears already recorded data

	:param WS:
	:type WS: Handle_XSControl_WorkSession &
	:param scratch: default value is Standard_True
	:type scratch: bool
	:rtype: None
") XSControl_Writer;
		 XSControl_Writer (const Handle_XSControl_WorkSession & WS,const Standard_Boolean scratch = Standard_True);
		%feature("compactdefaultargs") SetNorm;
		%feature("autodoc", "	* Sets a specific norm to <self> Returns True if done, False if <norm> is not available

	:param norm:
	:type norm: char *
	:rtype: bool
") SetNorm;
		Standard_Boolean SetNorm (const char * norm);
		%feature("compactdefaultargs") SetWS;
		%feature("autodoc", "	* Sets a specific session to <self>

	:param WS:
	:type WS: Handle_XSControl_WorkSession &
	:param scratch: default value is Standard_True
	:type scratch: bool
	:rtype: None
") SetWS;
		void SetWS (const Handle_XSControl_WorkSession & WS,const Standard_Boolean scratch = Standard_True);
		%feature("compactdefaultargs") WS;
		%feature("autodoc", "	* Returns the session used in <self>

	:rtype: Handle_XSControl_WorkSession
") WS;
		Handle_XSControl_WorkSession WS ();
		%feature("compactdefaultargs") Model;
		%feature("autodoc", "	* Returns the produced model. Produces a new one if not yet done or if <newone> is True This method allows for instance to edit product or header data before writing

	:param newone: default value is Standard_False
	:type newone: bool
	:rtype: Handle_Interface_InterfaceModel
") Model;
		Handle_Interface_InterfaceModel Model (const Standard_Boolean newone = Standard_False);
		%feature("compactdefaultargs") TransferShape;
		%feature("autodoc", "	* Transfers a Shape according to the mode

	:param sh:
	:type sh: TopoDS_Shape &
	:param mode: default value is 0
	:type mode: int
	:rtype: IFSelect_ReturnStatus
") TransferShape;
		IFSelect_ReturnStatus TransferShape (const TopoDS_Shape & sh,const Standard_Integer mode = 0);
		%feature("compactdefaultargs") WriteFile;
		%feature("autodoc", "	* Writes the produced model

	:param filename:
	:type filename: char *
	:rtype: IFSelect_ReturnStatus
") WriteFile;
		IFSelect_ReturnStatus WriteFile (const char * filename);
		%feature("compactdefaultargs") PrintStatsTransfer;
		%feature("autodoc", "	* Prints Statistics about Transfer

	:param what:
	:type what: int
	:param mode: default value is 0
	:type mode: int
	:rtype: None
") PrintStatsTransfer;
		void PrintStatsTransfer (const Standard_Integer what,const Standard_Integer mode = 0);
};


%extend XSControl_Writer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
