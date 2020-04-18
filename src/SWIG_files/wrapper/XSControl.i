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
%define XSCONTROLDOCSTRING
"XSControl module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_xscontrol.html"
%enddef
%module (package="OCC.Core", docstring=XSCONTROLDOCSTRING) XSControl


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
#include<XSControl_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<IFSelect_module.hxx>
#include<TopoDS_module.hxx>
#include<Transfer_module.hxx>
#include<TopAbs_module.hxx>
#include<TColStd_module.hxx>
#include<Interface_module.hxx>
#include<TCollection_module.hxx>
#include<TopTools_module.hxx>
#include<Geom_module.hxx>
#include<Geom2d_module.hxx>
#include<gp_module.hxx>
#include<Message_module.hxx>
#include<Message_module.hxx>
#include<TopLoc_module.hxx>
#include<Transfer_module.hxx>
#include<MoniTool_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import IFSelect.i
%import TopoDS.i
%import Transfer.i
%import TopAbs.i
%import TColStd.i
%import Interface.i
%import TCollection.i
%import TopTools.i
%import Geom.i
%import Geom2d.i
%import gp.i
%import Message.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
/* end public enums declaration */

/* python proy classes for enums */
%pythoncode {
};
/* end python proxy for enums */

/* handles */
%wrap_handle(XSControl_ConnectedShapes)
%wrap_handle(XSControl_Controller)
%wrap_handle(XSControl_SelectForTransfer)
%wrap_handle(XSControl_SignTransferStatus)
%wrap_handle(XSControl_TransferReader)
%wrap_handle(XSControl_TransferWriter)
%wrap_handle(XSControl_Vars)
%wrap_handle(XSControl_WorkSession)
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/******************
* class XSControl *
******************/
%rename(xscontrol) XSControl;
class XSControl {
	public:
		/****************** Session ******************/
		%feature("compactdefaultargs") Session;
		%feature("autodoc", "Returns the worksession of a sessionpilot, but casts it as from xscontrol : it then gives access to control & transfers.

Parameters
----------
pilot: IFSelect_SessionPilot

Returns
-------
opencascade::handle<XSControl_WorkSession>
") Session;
		static opencascade::handle<XSControl_WorkSession> Session(const opencascade::handle<IFSelect_SessionPilot> & pilot);

		/****************** Vars ******************/
		%feature("compactdefaultargs") Vars;
		%feature("autodoc", "Returns the vars of a sessionpilot, it is brought by session it provides access to external variables.

Parameters
----------
pilot: IFSelect_SessionPilot

Returns
-------
opencascade::handle<XSControl_Vars>
") Vars;
		static opencascade::handle<XSControl_Vars> Vars(const opencascade::handle<IFSelect_SessionPilot> & pilot);

};


%extend XSControl {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class XSControl_ConnectedShapes *
**********************************/
class XSControl_ConnectedShapes : public IFSelect_SelectExplore {
	public:
		/****************** XSControl_ConnectedShapes ******************/
		%feature("compactdefaultargs") XSControl_ConnectedShapes;
		%feature("autodoc", "Creates a selection connectedshapes. it remains to be set a transferreader.

Returns
-------
None
") XSControl_ConnectedShapes;
		 XSControl_ConnectedShapes();

		/****************** XSControl_ConnectedShapes ******************/
		%feature("compactdefaultargs") XSControl_ConnectedShapes;
		%feature("autodoc", "Creates a selection connectedshapes, which will work with the current transferprocess brought by the transferreader.

Parameters
----------
TR: XSControl_TransferReader

Returns
-------
None
") XSControl_ConnectedShapes;
		 XSControl_ConnectedShapes(const opencascade::handle<XSControl_TransferReader> & TR);

		/****************** AdjacentEntities ******************/
		%feature("compactdefaultargs") AdjacentEntities;
		%feature("autodoc", "This functions considers a shape from a transfer and performs the search function explained above.

Parameters
----------
ashape: TopoDS_Shape
TP: Transfer_TransientProcess
type: TopAbs_ShapeEnum

Returns
-------
opencascade::handle<TColStd_HSequenceOfTransient>
") AdjacentEntities;
		static opencascade::handle<TColStd_HSequenceOfTransient> AdjacentEntities(const TopoDS_Shape & ashape, const opencascade::handle<Transfer_TransientProcess> & TP, const TopAbs_ShapeEnum type);

		/****************** Explore ******************/
		%feature("compactdefaultargs") Explore;
		%feature("autodoc", "Explores an entity : entities from which are connected to that produced by this entity, including itself.

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
		%feature("autodoc", "Returns a text defining the criterium. 'connected entities through produced shapes'.

Returns
-------
TCollection_AsciiString
") ExploreLabel;
		TCollection_AsciiString ExploreLabel();

		/****************** SetReader ******************/
		%feature("compactdefaultargs") SetReader;
		%feature("autodoc", "Sets a transferreader to sort entities : it brings the transferprocess which may change, while the transferreader does not.

Parameters
----------
TR: XSControl_TransferReader

Returns
-------
None
") SetReader;
		void SetReader(const opencascade::handle<XSControl_TransferReader> & TR);

};


%make_alias(XSControl_ConnectedShapes)

%extend XSControl_ConnectedShapes {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class XSControl_Controller *
*****************************/
%nodefaultctor XSControl_Controller;
class XSControl_Controller : public Standard_Transient {
	public:
		/****************** ActorRead ******************/
		%feature("compactdefaultargs") ActorRead;
		%feature("autodoc", "Returns the actor for read attached to the pair (norm,appli) it can be adapted for data of the input model, as required can be read from field then adapted with model as required.

Parameters
----------
model: Interface_InterfaceModel

Returns
-------
opencascade::handle<Transfer_ActorOfTransientProcess>
") ActorRead;
		virtual opencascade::handle<Transfer_ActorOfTransientProcess> ActorRead(const opencascade::handle<Interface_InterfaceModel> & model);

		/****************** ActorWrite ******************/
		%feature("compactdefaultargs") ActorWrite;
		%feature("autodoc", "Returns the actor for write attached to the pair (norm,appli) read from field. can be redefined.

Returns
-------
opencascade::handle<Transfer_ActorOfFinderProcess>
") ActorWrite;
		virtual opencascade::handle<Transfer_ActorOfFinderProcess> ActorWrite();

		/****************** AdaptorSession ******************/
		%feature("compactdefaultargs") AdaptorSession;
		%feature("autodoc", "No available documentation.

Returns
-------
NCollection_DataMap<TCollection_AsciiString, opencascade::handle<Standard_Transient>>
") AdaptorSession;
		const NCollection_DataMap<TCollection_AsciiString, opencascade::handle<Standard_Transient>> & AdaptorSession();

		/****************** AddSessionItem ******************/
		%feature("compactdefaultargs") AddSessionItem;
		%feature("autodoc", "Records a session item, to be added for customisation of the work session. it must have a specific name. <setapplied> is used if <item> is a generalmodifier, to decide if set to true, <item> will be applied to the hook list 'send'. else, it is not applied to any hook list. remark : this method is to be called at create time, the recorded items will be used by customise warning : if <name> conflicts, the last recorded item is kept.

Parameters
----------
theItem: Standard_Transient
theName: char *
toApply: bool,optional
	default value is Standard_False

Returns
-------
None
") AddSessionItem;
		void AddSessionItem(const opencascade::handle<Standard_Transient> & theItem, const char * theName, const Standard_Boolean toApply = Standard_False);

		/****************** AutoRecord ******************/
		%feature("compactdefaultargs") AutoRecord;
		%feature("autodoc", "Records <self> is a general dictionary under short and long names (see method name).

Returns
-------
None
") AutoRecord;
		void AutoRecord();

		/****************** Customise ******************/
		%feature("compactdefaultargs") Customise;
		%feature("autodoc", "Customises a worksession, by adding to it the recorded items (by addsessionitem).

Parameters
----------
WS: XSControl_WorkSession

Returns
-------
None
") Customise;
		virtual void Customise(opencascade::handle<XSControl_WorkSession> & WS);

		/****************** IsModeWrite ******************/
		%feature("compactdefaultargs") IsModeWrite;
		%feature("autodoc", "Tells if a value of <modetrans> is a good value(within bounds) actually only for shapes.

Parameters
----------
modetrans: int
shape: bool,optional
	default value is Standard_True

Returns
-------
bool
") IsModeWrite;
		Standard_Boolean IsModeWrite(const Standard_Integer modetrans, const Standard_Boolean shape = Standard_True);

		/****************** ModeWriteBounds ******************/
		%feature("compactdefaultargs") ModeWriteBounds;
		%feature("autodoc", "Returns recorded min and max values for modetrans (write) actually only for shapes returns true if bounds are set, false else (then, free value).

Parameters
----------
shape: bool,optional
	default value is Standard_True

Returns
-------
modemin: int
modemax: int
") ModeWriteBounds;
		Standard_Boolean ModeWriteBounds(Standard_Integer &OutValue, Standard_Integer &OutValue, const Standard_Boolean shape = Standard_True);

		/****************** ModeWriteHelp ******************/
		%feature("compactdefaultargs") ModeWriteHelp;
		%feature("autodoc", "Returns the help line recorded for a value of modetrans empty if help not defined or not within bounds or if values are free.

Parameters
----------
modetrans: int
shape: bool,optional
	default value is Standard_True

Returns
-------
char *
") ModeWriteHelp;
		const char * ModeWriteHelp(const Standard_Integer modetrans, const Standard_Boolean shape = Standard_True);

		/****************** Name ******************/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Returns a name, as given when initializing : rsc = false (d) : true name attached to the norm (long name) rsc = true : name of the ressource set (i.e. short name).

Parameters
----------
rsc: bool,optional
	default value is Standard_False

Returns
-------
char *
") Name;
		const char * Name(const Standard_Boolean rsc = Standard_False);

		/****************** NewModel ******************/
		%feature("compactdefaultargs") NewModel;
		%feature("autodoc", "Creates a new empty model ready to receive data of the norm used to write data from imagine to an interface file.

Returns
-------
opencascade::handle<Interface_InterfaceModel>
") NewModel;
		virtual opencascade::handle<Interface_InterfaceModel> NewModel();

		/****************** Protocol ******************/
		%feature("compactdefaultargs") Protocol;
		%feature("autodoc", "Returns the protocol attached to the norm (from field).

Returns
-------
opencascade::handle<Interface_Protocol>
") Protocol;
		const opencascade::handle<Interface_Protocol> & Protocol();

		/****************** RecognizeWriteShape ******************/
		%feature("compactdefaultargs") RecognizeWriteShape;
		%feature("autodoc", "Tells if a shape is valid for a transfer to a model asks the actorwrite (through a shapemapper).

Parameters
----------
shape: TopoDS_Shape
modetrans: int,optional
	default value is 0

Returns
-------
bool
") RecognizeWriteShape;
		virtual Standard_Boolean RecognizeWriteShape(const TopoDS_Shape & shape, const Standard_Integer modetrans = 0);

		/****************** RecognizeWriteTransient ******************/
		%feature("compactdefaultargs") RecognizeWriteTransient;
		%feature("autodoc", "Tells if <obj> (an application object) is a valid candidate for a transfer to a model. by default, asks the actorwrite if known (through a transientmapper). can be redefined.

Parameters
----------
obj: Standard_Transient
modetrans: int,optional
	default value is 0

Returns
-------
bool
") RecognizeWriteTransient;
		virtual Standard_Boolean RecognizeWriteTransient(const opencascade::handle<Standard_Transient> & obj, const Standard_Integer modetrans = 0);

		/****************** Record ******************/
		%feature("compactdefaultargs") Record;
		%feature("autodoc", "Records <self> in a general dictionary under a name error if <name> already used for another one.

Parameters
----------
name: char *

Returns
-------
None
") Record;
		void Record(const char * name);

		/****************** Recorded ******************/
		%feature("compactdefaultargs") Recorded;
		%feature("autodoc", "Returns the controller attached to a given name returns a null handle if <name> is unknown.

Parameters
----------
name: char *

Returns
-------
opencascade::handle<XSControl_Controller>
") Recorded;
		static opencascade::handle<XSControl_Controller> Recorded(const char * name);

		/****************** SessionItem ******************/
		%feature("compactdefaultargs") SessionItem;
		%feature("autodoc", "Returns an item given its name to record in a session if <name> is unknown, returns a null handle.

Parameters
----------
theName: char *

Returns
-------
opencascade::handle<Standard_Transient>
") SessionItem;
		opencascade::handle<Standard_Transient> SessionItem(const char * theName);

		/****************** SetModeWrite ******************/
		%feature("compactdefaultargs") SetModeWrite;
		%feature("autodoc", "Sets mininum and maximum values for modetrans (write) erases formerly recorded bounds and values actually only for shape then, for each value a little help can be attached.

Parameters
----------
modemin: int
modemax: int
shape: bool,optional
	default value is Standard_True

Returns
-------
None
") SetModeWrite;
		void SetModeWrite(const Standard_Integer modemin, const Standard_Integer modemax, const Standard_Boolean shape = Standard_True);

		/****************** SetModeWriteHelp ******************/
		%feature("compactdefaultargs") SetModeWriteHelp;
		%feature("autodoc", "Attaches a short line of help to a value of modetrans (write).

Parameters
----------
modetrans: int
help: char *
shape: bool,optional
	default value is Standard_True

Returns
-------
None
") SetModeWriteHelp;
		void SetModeWriteHelp(const Standard_Integer modetrans, const char * help, const Standard_Boolean shape = Standard_True);

		/****************** SetNames ******************/
		%feature("compactdefaultargs") SetNames;
		%feature("autodoc", "Changes names if a name is empty, the formerly set one remains remark : does not call record or autorecord.

Parameters
----------
theLongName: char *
theShortName: char *

Returns
-------
None
") SetNames;
		void SetNames(const char * theLongName, const char * theShortName);

		/****************** TransferWriteShape ******************/
		%feature("compactdefaultargs") TransferWriteShape;
		%feature("autodoc", "Takes one shape and transfers it to an interfacemodel (already created, e.g. by newmodel) default uses actorwrite; can be redefined as necessary returned value is a status, as follows : done ok , void : no result , fail : fail (e.g. exception) error : bad conditions , bad model or null model.

Parameters
----------
shape: TopoDS_Shape
FP: Transfer_FinderProcess
model: Interface_InterfaceModel
modetrans: int,optional
	default value is 0

Returns
-------
IFSelect_ReturnStatus
") TransferWriteShape;
		virtual IFSelect_ReturnStatus TransferWriteShape(const TopoDS_Shape & shape, const opencascade::handle<Transfer_FinderProcess> & FP, const opencascade::handle<Interface_InterfaceModel> & model, const Standard_Integer modetrans = 0);

		/****************** TransferWriteTransient ******************/
		%feature("compactdefaultargs") TransferWriteTransient;
		%feature("autodoc", "Takes one transient object and transfers it to an interfacemodel (already created, e.g. by newmodel) (result is recorded in the model by addwithrefs) fp records produced results and checks //! default uses actorwrite; can be redefined as necessary returned value is a status, as follows : 0 ok , 1 no result , 2 fail (e.g. exception raised) -1 bad conditions , -2 bad model or null model for type of object not recognized : should return 1.

Parameters
----------
obj: Standard_Transient
FP: Transfer_FinderProcess
model: Interface_InterfaceModel
modetrans: int,optional
	default value is 0

Returns
-------
IFSelect_ReturnStatus
") TransferWriteTransient;
		virtual IFSelect_ReturnStatus TransferWriteTransient(const opencascade::handle<Standard_Transient> & obj, const opencascade::handle<Transfer_FinderProcess> & FP, const opencascade::handle<Interface_InterfaceModel> & model, const Standard_Integer modetrans = 0);

		/****************** WorkLibrary ******************/
		%feature("compactdefaultargs") WorkLibrary;
		%feature("autodoc", "Returns the worklibrary attached to the norm. remark that it has to be in phase with the protocol (read from field).

Returns
-------
opencascade::handle<IFSelect_WorkLibrary>
") WorkLibrary;
		const opencascade::handle<IFSelect_WorkLibrary> & WorkLibrary();

};


%make_alias(XSControl_Controller)

%extend XSControl_Controller {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class XSControl_FuncShape *
****************************/
class XSControl_FuncShape {
	public:
		/****************** FileAndVar ******************/
		%feature("compactdefaultargs") FileAndVar;
		%feature("autodoc", "Analyses given file name and variable name, with a default name for variables. returns resulting file name and variable name plus status 'file to read'(true) or 'already read'(false) in the latter case, empty resfile means no file available //! if <file> is null or empty or equates '.', considers session and returned status is false else, returns resfile = file and status is true if <var> is neither null nor empty, resvar = var else, the root part of <resfile> is considered, if defined else, <def> is taken.

Parameters
----------
session: XSControl_WorkSession
file: char *
var: char *
def: char *
resfile: TCollection_AsciiString
resvar: TCollection_AsciiString

Returns
-------
bool
") FileAndVar;
		static Standard_Boolean FileAndVar(const opencascade::handle<XSControl_WorkSession> & session, const char * file, const char * var, const char * def, TCollection_AsciiString & resfile, TCollection_AsciiString & resvar);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Defines and loads all functions which work on shapes for xscontrol (as actfunc).

Returns
-------
None
") Init;
		static void Init();

		/****************** MoreShapes ******************/
		%feature("compactdefaultargs") MoreShapes;
		%feature("autodoc", "Analyses a name as designating shapes from a vars or from xstep transfer (last transfer on reading). <name> can be : '*' : all the root shapes produced by last transfer (read) i.e. considers roots of the transientprocess a name : a name of a variable draw //! returns the count of designated shapes. their list is put in <list>. if <list> is null, it is firstly created. then it is completed (append without clear) by the shapes found returns 0 if no shape could be found.

Parameters
----------
session: XSControl_WorkSession
list: TopTools_HSequenceOfShape
name: char *

Returns
-------
int
") MoreShapes;
		static Standard_Integer MoreShapes(const opencascade::handle<XSControl_WorkSession> & session, opencascade::handle<TopTools_HSequenceOfShape> & list, const char * name);

};


%extend XSControl_FuncShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class XSControl_Functions *
****************************/
class XSControl_Functions {
	public:
		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Defines and loads all functions for xscontrol (as actfunc).

Returns
-------
None
") Init;
		static void Init();

};


%extend XSControl_Functions {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class XSControl_Reader *
*************************/
class XSControl_Reader {
	public:
		/****************** XSControl_Reader ******************/
		%feature("compactdefaultargs") XSControl_Reader;
		%feature("autodoc", "Creates a reader from scratch (creates an empty worksession) a worksession or a controller must be provided before running.

Returns
-------
None
") XSControl_Reader;
		 XSControl_Reader();

		/****************** XSControl_Reader ******************/
		%feature("compactdefaultargs") XSControl_Reader;
		%feature("autodoc", "Creates a reader from scratch, with a norm name which identifies a controller.

Parameters
----------
norm: char *

Returns
-------
None
") XSControl_Reader;
		 XSControl_Reader(const char * norm);

		/****************** XSControl_Reader ******************/
		%feature("compactdefaultargs") XSControl_Reader;
		%feature("autodoc", "Creates a reader from an already existing session, with a controller already set virtual destructor.

Parameters
----------
WS: XSControl_WorkSession
scratch: bool,optional
	default value is Standard_True

Returns
-------
None
") XSControl_Reader;
		 XSControl_Reader(const opencascade::handle<XSControl_WorkSession> & WS, const Standard_Boolean scratch = Standard_True);

		/****************** ClearShapes ******************/
		%feature("compactdefaultargs") ClearShapes;
		%feature("autodoc", "Clears the list of shapes that may have accumulated in calls to transferone or transferroot.c.

Returns
-------
None
") ClearShapes;
		void ClearShapes();

		/****************** GetStatsTransfer ******************/
		%feature("compactdefaultargs") GetStatsTransfer;
		%feature("autodoc", "Gives statistics about transfer.

Parameters
----------
list: TColStd_HSequenceOfTransient

Returns
-------
nbMapped: int
nbWithResult: int
nbWithFail: int
") GetStatsTransfer;
		void GetStatsTransfer(const opencascade::handle<TColStd_HSequenceOfTransient> & list, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** GiveList ******************/
		%feature("compactdefaultargs") GiveList;
		%feature("autodoc", "Returns a list of entities from the iges or step file according to the following rules: - if first and second are empty strings, the whole file is selected. - if first is an entity number or label, the entity referred to is selected. - if first is a list of entity numbers/labels separated by commas, the entities referred to are selected, - if first is the name of a selection in the worksession and second is not defined, the list contains the standard output for that selection. - if first is the name of a selection and second is defined, the criterion defined by second is applied to the result of the first selection. a selection is an operator which computes a list of entities from a list given in input according to its type. if no list is specified, the selection computes its list of entities from the whole model. a selection can be: - a predefined selection (xst-transferrable-mode) - a filter based on a signature a signature is an operator which returns a string from an entity according to its type. for example: - 'xst-type' (cdl) - 'iges-level' - 'step-type'. for example, if you wanted to select only the advanced_faces in a step file you would use the following code: example reader.givelist('xst-transferrable-roots','step-type(advanced_face)'); warning if the value given to second is incorrect, it will simply be ignored.

Parameters
----------
first: char *,optional
	default value is ""
second: char *,optional
	default value is ""

Returns
-------
opencascade::handle<TColStd_HSequenceOfTransient>
") GiveList;
		opencascade::handle<TColStd_HSequenceOfTransient> GiveList(const char * first = "", const char * second = "");

		/****************** GiveList ******************/
		%feature("compactdefaultargs") GiveList;
		%feature("autodoc", "Computes a list of entities from the model as follows <first> beeing a selection, <ent> beeing an entity or a list of entities (as a hsequenceoftransient) : the standard result of this selection applied to this list if <first> is erroneous, a null handle is returned.

Parameters
----------
first: char *
ent: Standard_Transient

Returns
-------
opencascade::handle<TColStd_HSequenceOfTransient>
") GiveList;
		opencascade::handle<TColStd_HSequenceOfTransient> GiveList(const char * first, const opencascade::handle<Standard_Transient> & ent);

		/****************** Model ******************/
		%feature("compactdefaultargs") Model;
		%feature("autodoc", "Returns the model. it can then be consulted (header, product).

Returns
-------
opencascade::handle<Interface_InterfaceModel>
") Model;
		opencascade::handle<Interface_InterfaceModel> Model();

		/****************** NbRootsForTransfer ******************/
		%feature("compactdefaultargs") NbRootsForTransfer;
		%feature("autodoc", "Determines the list of root entities which are candidate for a transfer to a shape, and returns the number of entities in the list.

Returns
-------
int
") NbRootsForTransfer;
		virtual Standard_Integer NbRootsForTransfer();

		/****************** NbShapes ******************/
		%feature("compactdefaultargs") NbShapes;
		%feature("autodoc", "Returns the number of shapes produced by translation.

Returns
-------
int
") NbShapes;
		Standard_Integer NbShapes();

		/****************** OneShape ******************/
		%feature("compactdefaultargs") OneShape;
		%feature("autodoc", "Returns all of the results in a single shape which is: - a null shape if there are no results, - a shape if there is one result, - a compound containing the resulting shapes if there are more than one.

Returns
-------
TopoDS_Shape
") OneShape;
		TopoDS_Shape OneShape();

		/****************** PrintCheckLoad ******************/
		%feature("compactdefaultargs") PrintCheckLoad;
		%feature("autodoc", "Prints the check list attached to loaded data, on the standard trace file (starts at std::cout) all messages or fails only, according to <failsonly> mode = 0 : per entity, prints messages mode = 1 : per message, just gives count of entities per check mode = 2 : also gives entity numbers.

Parameters
----------
failsonly: bool
mode: IFSelect_PrintCount

Returns
-------
None
") PrintCheckLoad;
		void PrintCheckLoad(const Standard_Boolean failsonly, const IFSelect_PrintCount mode);

		/****************** PrintCheckTransfer ******************/
		%feature("compactdefaultargs") PrintCheckTransfer;
		%feature("autodoc", "Displays check results for the last translation of iges or step entities to open cascade entities. only fail messages are displayed if failsonly is true. all messages are displayed if failsonly is false. mode determines the contents and the order of the messages according to the terms of the ifselect_printcount enumeration.

Parameters
----------
failsonly: bool
mode: IFSelect_PrintCount

Returns
-------
None
") PrintCheckTransfer;
		void PrintCheckTransfer(const Standard_Boolean failsonly, const IFSelect_PrintCount mode);

		/****************** PrintStatsTransfer ******************/
		%feature("compactdefaultargs") PrintStatsTransfer;
		%feature("autodoc", "Displays the statistics for the last translation. what defines the kind of statistics that are displayed as follows: - 0 gives general statistics (number of translated roots, number of warnings, number of fail messages), - 1 gives root results, - 2 gives statistics for all checked entities, - 3 gives the list of translated entities, - 4 gives warning and fail messages, - 5 gives fail messages only. the use of mode depends on the value of what. if what is 0, mode is ignored. if what is 1, 2 or 3, mode defines the following: - 0 lists the numbers of iges or step entities in the respective model - 1 gives the number, identifier, type and result type for each iges or step entity and/or its status (fail, warning, etc.) - 2 gives maximum information for each iges or step entity (i.e. checks) - 3 gives the number of entities per type of iges or step entity - 4 gives the number of iges or step entities per result type and/or status - 5 gives the number of pairs (iges or step or result type and status) - 6 gives the number of pairs (iges or step or result type and status) and the list of entity numbers in the iges or step model. if what is 4 or 5, mode defines the warning and fail messages as follows: - if mode is 0 all warnings and checks per entity are returned - if mode is 2 the list of entities per warning is returned. if mode is not set, only the list of all entities per warning is given.

Parameters
----------
what: int
mode: int,optional
	default value is 0

Returns
-------
None
") PrintStatsTransfer;
		void PrintStatsTransfer(const Standard_Integer what, const Standard_Integer mode = 0);

		/****************** ReadFile ******************/
		%feature("compactdefaultargs") ReadFile;
		%feature("autodoc", "Loads a file and returns the read status zero for a model which compies with the controller.

Parameters
----------
filename: char *

Returns
-------
IFSelect_ReturnStatus
") ReadFile;
		IFSelect_ReturnStatus ReadFile(const char * filename);

		/****************** RootForTransfer ******************/
		%feature("compactdefaultargs") RootForTransfer;
		%feature("autodoc", "Returns an iges or step root entity for translation. the entity is identified by its rank in a list.

Parameters
----------
num: int,optional
	default value is 1

Returns
-------
opencascade::handle<Standard_Transient>
") RootForTransfer;
		opencascade::handle<Standard_Transient> RootForTransfer(const Standard_Integer num = 1);

		/****************** SetNorm ******************/
		%feature("compactdefaultargs") SetNorm;
		%feature("autodoc", "Sets a specific norm to <self> returns true if done, false if <norm> is not available.

Parameters
----------
norm: char *

Returns
-------
bool
") SetNorm;
		Standard_Boolean SetNorm(const char * norm);

		/****************** SetWS ******************/
		%feature("compactdefaultargs") SetWS;
		%feature("autodoc", "Sets a specific session to <self>.

Parameters
----------
WS: XSControl_WorkSession
scratch: bool,optional
	default value is Standard_True

Returns
-------
None
") SetWS;
		void SetWS(const opencascade::handle<XSControl_WorkSession> & WS, const Standard_Boolean scratch = Standard_True);

		/****************** Shape ******************/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "Returns the shape resulting from a translation and identified by the rank num. num equals 1 by default. in other words, the first shape resulting from the translation is returned.

Parameters
----------
num: int,optional
	default value is 1

Returns
-------
TopoDS_Shape
") Shape;
		TopoDS_Shape Shape(const Standard_Integer num = 1);

		/****************** TransferEntity ******************/
		%feature("compactdefaultargs") TransferEntity;
		%feature("autodoc", "Translates an iges or step entity in the model. true is returned if a shape is produced; otherwise, false is returned.

Parameters
----------
start: Standard_Transient

Returns
-------
bool
") TransferEntity;
		Standard_Boolean TransferEntity(const opencascade::handle<Standard_Transient> & start);

		/****************** TransferList ******************/
		%feature("compactdefaultargs") TransferList;
		%feature("autodoc", "Translates a list of entities. returns the number of iges or step entities that were successfully translated. the list can be produced with givelist. warning - this function does not clear the existing output shapes.

Parameters
----------
list: TColStd_HSequenceOfTransient

Returns
-------
int
") TransferList;
		Standard_Integer TransferList(const opencascade::handle<TColStd_HSequenceOfTransient> & list);

		/****************** TransferOne ******************/
		%feature("compactdefaultargs") TransferOne;
		%feature("autodoc", "Translates an iges or step entity identified by the rank num in the model. false is returned if no shape is produced.

Parameters
----------
num: int

Returns
-------
bool
") TransferOne;
		Standard_Boolean TransferOne(const Standard_Integer num);

		/****************** TransferOneRoot ******************/
		%feature("compactdefaultargs") TransferOneRoot;
		%feature("autodoc", "Translates a root identified by the rank num in the model. false is returned if no shape is produced.

Parameters
----------
num: int,optional
	default value is 1

Returns
-------
bool
") TransferOneRoot;
		Standard_Boolean TransferOneRoot(const Standard_Integer num = 1);

		/****************** TransferRoots ******************/
		%feature("compactdefaultargs") TransferRoots;
		%feature("autodoc", "Translates all translatable roots and returns the number of successful translations. warning - this function clears existing output shapes first.

Returns
-------
int
") TransferRoots;
		Standard_Integer TransferRoots();

		/****************** WS ******************/
		%feature("compactdefaultargs") WS;
		%feature("autodoc", "Returns the session used in <self>.

Returns
-------
opencascade::handle<XSControl_WorkSession>
") WS;
		opencascade::handle<XSControl_WorkSession> WS();

};


%extend XSControl_Reader {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class XSControl_SelectForTransfer *
************************************/
class XSControl_SelectForTransfer : public IFSelect_SelectExtract {
	public:
		/****************** XSControl_SelectForTransfer ******************/
		%feature("compactdefaultargs") XSControl_SelectForTransfer;
		%feature("autodoc", "Creates a selectfortransfer, non initialised it sorts nothing, unless an actor has been defined.

Returns
-------
None
") XSControl_SelectForTransfer;
		 XSControl_SelectForTransfer();

		/****************** XSControl_SelectForTransfer ******************/
		%feature("compactdefaultargs") XSControl_SelectForTransfer;
		%feature("autodoc", "Creates a selectfortransfer, which will work with the currently defined actor brought by the transferreader.

Parameters
----------
TR: XSControl_TransferReader

Returns
-------
None
") XSControl_SelectForTransfer;
		 XSControl_SelectForTransfer(const opencascade::handle<XSControl_TransferReader> & TR);

		/****************** Actor ******************/
		%feature("compactdefaultargs") Actor;
		%feature("autodoc", "Returns the actor used as precised one. returns a null handle for a creation from a transferreader without any further setting.

Returns
-------
opencascade::handle<Transfer_ActorOfTransientProcess>
") Actor;
		opencascade::handle<Transfer_ActorOfTransientProcess> Actor();

		/****************** ExtractLabel ******************/
		%feature("compactdefaultargs") ExtractLabel;
		%feature("autodoc", "Returns a text defining the criterium : 'recognized for transfer [(current actor)]'.

Returns
-------
TCollection_AsciiString
") ExtractLabel;
		TCollection_AsciiString ExtractLabel();

		/****************** Reader ******************/
		%feature("compactdefaultargs") Reader;
		%feature("autodoc", "Returns the reader (if created with a reader) returns a null handle if not created with a reader.

Returns
-------
opencascade::handle<XSControl_TransferReader>
") Reader;
		opencascade::handle<XSControl_TransferReader> Reader();

		/****************** SetActor ******************/
		%feature("compactdefaultargs") SetActor;
		%feature("autodoc", "Sets a precise actor to sort entities this definition oversedes the creation with a transferreader.

Parameters
----------
act: Transfer_ActorOfTransientProcess

Returns
-------
None
") SetActor;
		void SetActor(const opencascade::handle<Transfer_ActorOfTransientProcess> & act);

		/****************** SetReader ******************/
		%feature("compactdefaultargs") SetReader;
		%feature("autodoc", "Sets a transferreader to sort entities : it brings the actor, which may change, while the transferreader does not.

Parameters
----------
TR: XSControl_TransferReader

Returns
-------
None
") SetReader;
		void SetReader(const opencascade::handle<XSControl_TransferReader> & TR);

		/****************** Sort ******************/
		%feature("compactdefaultargs") Sort;
		%feature("autodoc", "Returns true for an entity which is recognized by the actor, either the precised one, or the one defined by transferreader.

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


%make_alias(XSControl_SelectForTransfer)

%extend XSControl_SelectForTransfer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class XSControl_SignTransferStatus *
*************************************/
class XSControl_SignTransferStatus : public IFSelect_Signature {
	public:
		/****************** XSControl_SignTransferStatus ******************/
		%feature("compactdefaultargs") XSControl_SignTransferStatus;
		%feature("autodoc", "Creates a signtransferstatus, not initialised it gives nothing (empty string).

Returns
-------
None
") XSControl_SignTransferStatus;
		 XSControl_SignTransferStatus();

		/****************** XSControl_SignTransferStatus ******************/
		%feature("compactdefaultargs") XSControl_SignTransferStatus;
		%feature("autodoc", "Creates a signtransferstatus, which will work on the current transientprocess brought by the transferreader (its mapreader).

Parameters
----------
TR: XSControl_TransferReader

Returns
-------
None
") XSControl_SignTransferStatus;
		 XSControl_SignTransferStatus(const opencascade::handle<XSControl_TransferReader> & TR);

		/****************** Map ******************/
		%feature("compactdefaultargs") Map;
		%feature("autodoc", "Returns the transientprocess used as precised one returns a null handle for a creation from a transferreader without any further setting.

Returns
-------
opencascade::handle<Transfer_TransientProcess>
") Map;
		opencascade::handle<Transfer_TransientProcess> Map();

		/****************** Reader ******************/
		%feature("compactdefaultargs") Reader;
		%feature("autodoc", "Returns the reader (if created with a reader) returns a null handle if not created with a reader.

Returns
-------
opencascade::handle<XSControl_TransferReader>
") Reader;
		opencascade::handle<XSControl_TransferReader> Reader();

		/****************** SetMap ******************/
		%feature("compactdefaultargs") SetMap;
		%feature("autodoc", "Sets a precise map to sign entities this definition oversedes the creation with a transferreader.

Parameters
----------
TP: Transfer_TransientProcess

Returns
-------
None
") SetMap;
		void SetMap(const opencascade::handle<Transfer_TransientProcess> & TP);

		/****************** SetReader ******************/
		%feature("compactdefaultargs") SetReader;
		%feature("autodoc", "Sets a transferreader to work.

Parameters
----------
TR: XSControl_TransferReader

Returns
-------
None
") SetReader;
		void SetReader(const opencascade::handle<XSControl_TransferReader> & TR);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the signature for a transient object, as its transfer status.

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


%make_alias(XSControl_SignTransferStatus)

%extend XSControl_SignTransferStatus {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class XSControl_TransferReader *
*********************************/
class XSControl_TransferReader : public Standard_Transient {
	public:
		/****************** XSControl_TransferReader ******************/
		%feature("compactdefaultargs") XSControl_TransferReader;
		%feature("autodoc", "Creates a transferreader, empty.

Returns
-------
None
") XSControl_TransferReader;
		 XSControl_TransferReader();

		/****************** Actor ******************/
		%feature("compactdefaultargs") Actor;
		%feature("autodoc", "Returns the actor, determined by the controller, or if this one is unknown, directly set. once it has been defined, it can then be edited.

Returns
-------
opencascade::handle<Transfer_ActorOfTransientProcess>
") Actor;
		opencascade::handle<Transfer_ActorOfTransientProcess> Actor();

		/****************** BeginTransfer ******************/
		%feature("compactdefaultargs") BeginTransfer;
		%feature("autodoc", "Defines a new transferprocess for reading transfer returns true if done, false if data are not properly defined (the model, the actor for read).

Returns
-------
bool
") BeginTransfer;
		Standard_Boolean BeginTransfer();

		/****************** CheckList ******************/
		%feature("compactdefaultargs") CheckList;
		%feature("autodoc", "Returns the checklist resulting from transferring <ent>, i.e. stored in its recorded form resultfrommodel (empty if transfer successful or not recorded ...) //! if <ent> is the model, returns the complete cumulated check-list, <level> is ignored //! if <ent> is an entity of the model, <level> applies as follows <level> : -1 for <ent> only, last transfer (transientprocess) <level> : 0 for <ent> only (d) 1 for <ent> and its immediate subtransfers, if any 2 for <ent> and subtransferts at all levels.

Parameters
----------
theEnt: Standard_Transient
theLevel: int,optional
	default value is 0

Returns
-------
Interface_CheckIterator
") CheckList;
		Interface_CheckIterator CheckList(const opencascade::handle<Standard_Transient> & theEnt, const Standard_Integer theLevel = 0);

		/****************** CheckedList ******************/
		%feature("compactdefaultargs") CheckedList;
		%feature("autodoc", "Returns the list of starting entities to which a given check status is attached, in final results <ent> can be an entity, or the model to query all entities below, 'entities' are, either <ent> plus its sub-transferred, or all the entities of the model //! <check> = -2 , all entities whatever the check (see result) <check> = -1 , entities with no fail (warning allowed) <check> = 0 , entities with no check at all <check> = 1 , entities with warning but no fail <check> = 2 , entities with fail <result> : if true, only entities with an attached result remark : result true and check=0 will give an empty list.

Parameters
----------
theEnt: Standard_Transient
WithCheck: Interface_CheckStatus,optional
	default value is Interface_CheckAny
theResult: bool,optional
	default value is Standard_True

Returns
-------
opencascade::handle<TColStd_HSequenceOfTransient>
") CheckedList;
		opencascade::handle<TColStd_HSequenceOfTransient> CheckedList(const opencascade::handle<Standard_Transient> & theEnt, const Interface_CheckStatus WithCheck = Interface_CheckAny, const Standard_Boolean theResult = Standard_True);

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Clears data, according mode : -1 all 0 nothing done +1 final results +2 working data (model, context, transfer process).

Parameters
----------
theMode: int

Returns
-------
None
") Clear;
		void Clear(const Standard_Integer theMode);

		/****************** ClearResult ******************/
		%feature("compactdefaultargs") ClearResult;
		%feature("autodoc", "Clears recorded result for an entity, according mode <mode> = -1 : true, complete, clearing (erasing result) <mode> >= 0 : simple 'stripping', see resultfrommodel, in particular, 0 for simple internal strip, 10 for all but final result, 11 for all : just label, status and filename are kept returns true when done, false if nothing was to clear.

Parameters
----------
theEnt: Standard_Transient
theMode: int

Returns
-------
bool
") ClearResult;
		Standard_Boolean ClearResult(const opencascade::handle<Standard_Transient> & theEnt, const Standard_Integer theMode);

		/****************** Context ******************/
		%feature("compactdefaultargs") Context;
		%feature("autodoc", "Returns (modifiable) the whole definition of context rather for internal use (ex.: preparing and setting in once).

Returns
-------
NCollection_DataMap<TCollection_AsciiString, opencascade::handle<Standard_Transient>>
") Context;
		NCollection_DataMap<TCollection_AsciiString, opencascade::handle<Standard_Transient>> & Context();

		/****************** EntitiesFromShapeList ******************/
		%feature("compactdefaultargs") EntitiesFromShapeList;
		%feature("autodoc", "Returns the list of entities from which some shapes were produced : it corresponds to a loop on entityfromshaperesult, but is optimised.

Parameters
----------
theRes: TopTools_HSequenceOfShape
theMode: int,optional
	default value is 0

Returns
-------
opencascade::handle<TColStd_HSequenceOfTransient>
") EntitiesFromShapeList;
		opencascade::handle<TColStd_HSequenceOfTransient> EntitiesFromShapeList(const opencascade::handle<TopTools_HSequenceOfShape> & theRes, const Standard_Integer theMode = 0);

		/****************** EntityFromResult ******************/
		%feature("compactdefaultargs") EntityFromResult;
		%feature("autodoc", "Returns an entity from which a given result was produced. if <mode> = 0 (d), searches in last root transfers if <mode> = 1, searches in last (root & sub) transfers if <mode> = 2, searches in root recorded results if <mode> = 3, searches in all (root & sub) recordeds <res> can be, either a transient object (result itself) or a binder. for a binder of shape, calls entityfromshaperesult returns a null handle if <res> not recorded.

Parameters
----------
theRes: Standard_Transient
theMode: int,optional
	default value is 0

Returns
-------
opencascade::handle<Standard_Transient>
") EntityFromResult;
		opencascade::handle<Standard_Transient> EntityFromResult(const opencascade::handle<Standard_Transient> & theRes, const Standard_Integer theMode = 0);

		/****************** EntityFromShapeResult ******************/
		%feature("compactdefaultargs") EntityFromShapeResult;
		%feature("autodoc", "Returns an entity from which a given shape result was produced returns a null handle if <res> not recorded or not a shape.

Parameters
----------
theRes: TopoDS_Shape
theMode: int,optional
	default value is 0

Returns
-------
opencascade::handle<Standard_Transient>
") EntityFromShapeResult;
		opencascade::handle<Standard_Transient> EntityFromShapeResult(const TopoDS_Shape & theRes, const Standard_Integer theMode = 0);

		/****************** FileName ******************/
		%feature("compactdefaultargs") FileName;
		%feature("autodoc", "Returns actual value of file name.

Returns
-------
char *
") FileName;
		const char * FileName();

		/****************** FinalEntityLabel ******************/
		%feature("compactdefaultargs") FinalEntityLabel;
		%feature("autodoc", "Returns the label attached to an entity recorded for final, or an empty string if not recorded.

Parameters
----------
theEnt: Standard_Transient

Returns
-------
char *
") FinalEntityLabel;
		const char * FinalEntityLabel(const opencascade::handle<Standard_Transient> & theEnt);

		/****************** FinalEntityNumber ******************/
		%feature("compactdefaultargs") FinalEntityNumber;
		%feature("autodoc", "Returns the number attached to the entity recorded for final, or zero if not recorded (looks in the resultfrommodel).

Parameters
----------
theEnt: Standard_Transient

Returns
-------
int
") FinalEntityNumber;
		Standard_Integer FinalEntityNumber(const opencascade::handle<Standard_Transient> & theEnt);

		/****************** FinalResult ******************/
		%feature("compactdefaultargs") FinalResult;
		%feature("autodoc", "Returns the final result recorded for an entity, as such.

Parameters
----------
theEnt: Standard_Transient

Returns
-------
opencascade::handle<Transfer_ResultFromModel>
") FinalResult;
		opencascade::handle<Transfer_ResultFromModel> FinalResult(const opencascade::handle<Standard_Transient> & theEnt);

		/****************** GetContext ******************/
		%feature("compactdefaultargs") GetContext;
		%feature("autodoc", "Returns the context attached to a name, if set and if it is kind of the type, else a null handle returns true if ok, false if no context.

Parameters
----------
theName: char *
theType: Standard_Type
theCtx: Standard_Transient

Returns
-------
bool
") GetContext;
		Standard_Boolean GetContext(const char * theName, const opencascade::handle<Standard_Type> & theType, opencascade::handle<Standard_Transient> & theCtx);

		/****************** HasChecks ******************/
		%feature("compactdefaultargs") HasChecks;
		%feature("autodoc", "Returns true if an entity (with a final result) has checks : - failsonly = false : any kind of check message - failsonly = true : fails only returns false if <ent> is not recorded.

Parameters
----------
theEnt: Standard_Transient
FailsOnly: bool

Returns
-------
bool
") HasChecks;
		Standard_Boolean HasChecks(const opencascade::handle<Standard_Transient> & theEnt, const Standard_Boolean FailsOnly);

		/****************** HasResult ******************/
		%feature("compactdefaultargs") HasResult;
		%feature("autodoc", "Returns true if a final result is recorded and brings an effective result (else, it brings only fail messages).

Parameters
----------
theEnt: Standard_Transient

Returns
-------
bool
") HasResult;
		Standard_Boolean HasResult(const opencascade::handle<Standard_Transient> & theEnt);

		/****************** IsMarked ******************/
		%feature("compactdefaultargs") IsMarked;
		%feature("autodoc", "Returns true if an entity has been asked for transfert, hence it is marked, as : recorded (a computation has ran, with or without an effective result), or skipped (case ignored).

Parameters
----------
theEnt: Standard_Transient

Returns
-------
bool
") IsMarked;
		Standard_Boolean IsMarked(const opencascade::handle<Standard_Transient> & theEnt);

		/****************** IsRecorded ******************/
		%feature("compactdefaultargs") IsRecorded;
		%feature("autodoc", "Returns true if a final result is recorded for an entity remark that it can bring no effective result if transfer has completely failed (finalresult brings only fail messages ...).

Parameters
----------
theEnt: Standard_Transient

Returns
-------
bool
") IsRecorded;
		Standard_Boolean IsRecorded(const opencascade::handle<Standard_Transient> & theEnt);

		/****************** IsSkipped ******************/
		%feature("compactdefaultargs") IsSkipped;
		%feature("autodoc", "Returns true if an entity is noted as skipped.

Parameters
----------
theEnt: Standard_Transient

Returns
-------
bool
") IsSkipped;
		Standard_Boolean IsSkipped(const opencascade::handle<Standard_Transient> & theEnt);

		/****************** LastCheckList ******************/
		%feature("compactdefaultargs") LastCheckList;
		%feature("autodoc", "Returns the checklist resulting from last transferread i.e. from transientprocess itself, recorded from last clear.

Returns
-------
Interface_CheckIterator
") LastCheckList;
		Interface_CheckIterator LastCheckList();

		/****************** LastTransferList ******************/
		%feature("compactdefaultargs") LastTransferList;
		%feature("autodoc", "Returns the list of entities recorded as lastly transferred i.e. from transientprocess itself, recorded from last clear if <roots> is true , considers only roots of transfer if <roots> is false, considers all entities bound with result.

Parameters
----------
theRoots: bool

Returns
-------
opencascade::handle<TColStd_HSequenceOfTransient>
") LastTransferList;
		opencascade::handle<TColStd_HSequenceOfTransient> LastTransferList(const Standard_Boolean theRoots);

		/****************** Model ******************/
		%feature("compactdefaultargs") Model;
		%feature("autodoc", "Returns the currently set interfacemodel.

Returns
-------
opencascade::handle<Interface_InterfaceModel>
") Model;
		const opencascade::handle<Interface_InterfaceModel> & Model();

		/****************** PrintStats ******************/
		%feature("compactdefaultargs") PrintStats;
		%feature("autodoc", "Prints statistics on current trace file, according <what> and <mode>. see printstatsprocess for details.

Parameters
----------
theWhat: int
theMode: int,optional
	default value is 0

Returns
-------
None
") PrintStats;
		void PrintStats(const Standard_Integer theWhat, const Standard_Integer theMode = 0);

		/****************** PrintStatsOnList ******************/
		%feature("compactdefaultargs") PrintStatsOnList;
		%feature("autodoc", "Works as printstatsprocess, but displays data only on the entities which are in <list> (filter).

Parameters
----------
theTP: Transfer_TransientProcess
theList: TColStd_HSequenceOfTransient
theWhat: int
theMode: int,optional
	default value is 0

Returns
-------
None
") PrintStatsOnList;
		static void PrintStatsOnList(const opencascade::handle<Transfer_TransientProcess> & theTP, const opencascade::handle<TColStd_HSequenceOfTransient> & theList, const Standard_Integer theWhat, const Standard_Integer theMode = 0);

		/****************** PrintStatsProcess ******************/
		%feature("compactdefaultargs") PrintStatsProcess;
		%feature("autodoc", "This routines prints statistics about a transientprocess it can be called, by a transferreader, or isolately prints are done on the default trace file <what> defines what kind of statistics are to be printed : 0 : basic figures 1 : root results 2 : all recorded (roots, intermediate, checked entities) 3 : abnormal records 4 : check messages (warnings and fails) 5 : fail messages //! <mode> is used according <what> : <what> = 0 : <mode> is ignored <what> = 1,2,3 : <mode> as follows : 0 (d) : just lists numbers of concerned entities in the model 1 : for each entity, gives number,label, type and result type and/or status (fail/warning...) 2 : for each entity, gives maximal information (i.e. checks) 3 : counts per type of starting entity (class type) 4 : counts per result type and/or status 5 : counts per couple (starting type / result type/status) 6 : idem plus gives for each item, the list of numbers of entities in the starting model //! <what> = 4,5 : modes relays on an enum printcount : 0 (d) : itemsbyentity (sequential list by entity) 1 : countbyitem 2 : shortbyitem (count + 5 first numbers) 3 : listbyitem (count + entity numbers) 4 : entitiesbyitem (count + entity numbers and labels).

Parameters
----------
theTP: Transfer_TransientProcess
theWhat: int
theMode: int,optional
	default value is 0

Returns
-------
None
") PrintStatsProcess;
		static void PrintStatsProcess(const opencascade::handle<Transfer_TransientProcess> & theTP, const Standard_Integer theWhat, const Standard_Integer theMode = 0);

		/****************** Recognize ******************/
		%feature("compactdefaultargs") Recognize;
		%feature("autodoc", "Tells if an entity is recognized as a valid candidate for transfer. calls method recognize from the actor (if known).

Parameters
----------
theEnt: Standard_Transient

Returns
-------
bool
") Recognize;
		Standard_Boolean Recognize(const opencascade::handle<Standard_Transient> & theEnt);

		/****************** RecordResult ******************/
		%feature("compactdefaultargs") RecordResult;
		%feature("autodoc", "Records a final result of transferring an entity this result is recorded as a resultfrommodel, taken from the transientprocess returns true if a result is available, false else.

Parameters
----------
theEnt: Standard_Transient

Returns
-------
bool
") RecordResult;
		Standard_Boolean RecordResult(const opencascade::handle<Standard_Transient> & theEnt);

		/****************** RecordedList ******************/
		%feature("compactdefaultargs") RecordedList;
		%feature("autodoc", "Returns the list of entities to which a final result is attached (i.e. processed by recordresult).

Returns
-------
opencascade::handle<TColStd_HSequenceOfTransient>
") RecordedList;
		opencascade::handle<TColStd_HSequenceOfTransient> RecordedList();

		/****************** ResultFromNumber ******************/
		%feature("compactdefaultargs") ResultFromNumber;
		%feature("autodoc", "Returns the final result recorded for a number of entity (internal use). null if out of range.

Parameters
----------
theNum: int

Returns
-------
opencascade::handle<Transfer_ResultFromModel>
") ResultFromNumber;
		opencascade::handle<Transfer_ResultFromModel> ResultFromNumber(const Standard_Integer theNum);

		/****************** SetActor ******************/
		%feature("compactdefaultargs") SetActor;
		%feature("autodoc", "Sets the actor directly : this value will be used if the controller is not set.

Parameters
----------
theActor: Transfer_ActorOfTransientProcess

Returns
-------
None
") SetActor;
		void SetActor(const opencascade::handle<Transfer_ActorOfTransientProcess> & theActor);

		/****************** SetContext ******************/
		%feature("compactdefaultargs") SetContext;
		%feature("autodoc", "Sets a context : according to receiving appli, to be interpreted by the actor.

Parameters
----------
theName: char *
theCtx: Standard_Transient

Returns
-------
None
") SetContext;
		void SetContext(const char * theName, const opencascade::handle<Standard_Transient> & theCtx);

		/****************** SetController ******************/
		%feature("compactdefaultargs") SetController;
		%feature("autodoc", "Sets a controller. it is required to generate the actor. elsewhere, the actor must be provided directly.

Parameters
----------
theControl: XSControl_Controller

Returns
-------
None
") SetController;
		void SetController(const opencascade::handle<XSControl_Controller> & theControl);

		/****************** SetFileName ******************/
		%feature("compactdefaultargs") SetFileName;
		%feature("autodoc", "Sets a new value for (loaded) file name.

Parameters
----------
theName: char *

Returns
-------
None
") SetFileName;
		void SetFileName(const char * theName);

		/****************** SetGraph ******************/
		%feature("compactdefaultargs") SetGraph;
		%feature("autodoc", "Sets a graph and its interfacemodel (calls setmodel).

Parameters
----------
theGraph: Interface_HGraph

Returns
-------
None
") SetGraph;
		void SetGraph(const opencascade::handle<Interface_HGraph> & theGraph);

		/****************** SetModel ******************/
		%feature("compactdefaultargs") SetModel;
		%feature("autodoc", "Sets an interfacemodel. this causes former results, computed from another one, to be lost (see also clear).

Parameters
----------
theModel: Interface_InterfaceModel

Returns
-------
None
") SetModel;
		void SetModel(const opencascade::handle<Interface_InterfaceModel> & theModel);

		/****************** SetTransientProcess ******************/
		%feature("compactdefaultargs") SetTransientProcess;
		%feature("autodoc", "Forces the transientprocess remark : it also changes the model and the actor, from those recorded in the new transientprocess.

Parameters
----------
theTP: Transfer_TransientProcess

Returns
-------
None
") SetTransientProcess;
		void SetTransientProcess(const opencascade::handle<Transfer_TransientProcess> & theTP);

		/****************** ShapeResult ******************/
		%feature("compactdefaultargs") ShapeResult;
		%feature("autodoc", "Returns the resulting object as a shape null shape if no result or result not a shape.

Parameters
----------
theEnt: Standard_Transient

Returns
-------
TopoDS_Shape
") ShapeResult;
		TopoDS_Shape ShapeResult(const opencascade::handle<Standard_Transient> & theEnt);

		/****************** ShapeResultList ******************/
		%feature("compactdefaultargs") ShapeResultList;
		%feature("autodoc", "Returns a list of result shapes if <rec> is true , sees recordedlist if <rec> is false, sees lasttransferlist (last root transfers) for each one, if it is a shape, it is cumulated to the list if no shape is found, returns an empty sequence.

Parameters
----------
theRec: bool

Returns
-------
opencascade::handle<TopTools_HSequenceOfShape>
") ShapeResultList;
		const opencascade::handle<TopTools_HSequenceOfShape> & ShapeResultList(const Standard_Boolean theRec);

		/****************** Skip ******************/
		%feature("compactdefaultargs") Skip;
		%feature("autodoc", "Note that an entity has been required for transfer but no result at all is available (typically : case not implemented) it is not an error, but it gives a specific status : skipped returns true if done, false if <ent> is not in starting model.

Parameters
----------
theEnt: Standard_Transient

Returns
-------
bool
") Skip;
		Standard_Boolean Skip(const opencascade::handle<Standard_Transient> & theEnt);

		/****************** TransferClear ******************/
		%feature("compactdefaultargs") TransferClear;
		%feature("autodoc", "Clears the results attached to an entity if <ents> equates the starting model, clears all results.

Parameters
----------
theEnt: Standard_Transient
theLevel: int,optional
	default value is 0

Returns
-------
None
") TransferClear;
		void TransferClear(const opencascade::handle<Standard_Transient> & theEnt, const Standard_Integer theLevel = 0);

		/****************** TransferList ******************/
		%feature("compactdefaultargs") TransferList;
		%feature("autodoc", "Commands the transfer on reading for a list of entities to data for imagine, using the selected actor for read returns count of transferred entities, ok or with fails (0/1) if <rec> is true (d), the results are recorded by recordresult.

Parameters
----------
theList: TColStd_HSequenceOfTransient
theRec: bool,optional
	default value is Standard_True

Returns
-------
int
") TransferList;
		Standard_Integer TransferList(const opencascade::handle<TColStd_HSequenceOfTransient> & theList, const Standard_Boolean theRec = Standard_True);

		/****************** TransferOne ******************/
		%feature("compactdefaultargs") TransferOne;
		%feature("autodoc", "Commands the transfer on reading for an entity to data for imagine, using the selected actor for read returns count of transferred entities, ok or with fails (0/1) if <rec> is true (d), the result is recorded by recordresult.

Parameters
----------
theEnt: Standard_Transient
theRec: bool,optional
	default value is Standard_True

Returns
-------
int
") TransferOne;
		Standard_Integer TransferOne(const opencascade::handle<Standard_Transient> & theEnt, const Standard_Boolean theRec = Standard_True);

		/****************** TransferRoots ******************/
		%feature("compactdefaultargs") TransferRoots;
		%feature("autodoc", "Transfers the content of the current interface model to data handled by imagine, starting from its roots (determined by the graph <g>), using the selected actor for read returns the count of performed root transfers (i.e. 0 if none) or -1 if no actor is defined.

Parameters
----------
theGraph: Interface_Graph

Returns
-------
int
") TransferRoots;
		Standard_Integer TransferRoots(const Interface_Graph & theGraph);

		/****************** TransientProcess ******************/
		%feature("compactdefaultargs") TransientProcess;
		%feature("autodoc", "Returns the currently used transientprocess it is computed from the model by transferreadroots, or by begintransferread.

Returns
-------
opencascade::handle<Transfer_TransientProcess>
") TransientProcess;
		const opencascade::handle<Transfer_TransientProcess> & TransientProcess();

		/****************** TransientResult ******************/
		%feature("compactdefaultargs") TransientResult;
		%feature("autodoc", "Returns the resulting object as a transient null handle if no result or result not transient.

Parameters
----------
theEnt: Standard_Transient

Returns
-------
opencascade::handle<Standard_Transient>
") TransientResult;
		opencascade::handle<Standard_Transient> TransientResult(const opencascade::handle<Standard_Transient> & theEnt);

};


%make_alias(XSControl_TransferReader)

%extend XSControl_TransferReader {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class XSControl_TransferWriter *
*********************************/
class XSControl_TransferWriter : public Standard_Transient {
	public:
		/****************** XSControl_TransferWriter ******************/
		%feature("compactdefaultargs") XSControl_TransferWriter;
		%feature("autodoc", "Creates a transferwriter, empty, ready to run with an empty finderprocess (but no controller, etc).

Returns
-------
None
") XSControl_TransferWriter;
		 XSControl_TransferWriter();

		/****************** CheckList ******************/
		%feature("compactdefaultargs") CheckList;
		%feature("autodoc", "Returns the check-list of last transfer (write), i.e. the check-list currently recorded in the finderprocess.

Returns
-------
Interface_CheckIterator
") CheckList;
		Interface_CheckIterator CheckList();

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Clears recorded data according a mode 0 clears finderprocess (results, checks) -1 create a new finderprocess.

Parameters
----------
theMode: int

Returns
-------
None
") Clear;
		void Clear(const Standard_Integer theMode);

		/****************** Controller ******************/
		%feature("compactdefaultargs") Controller;
		%feature("autodoc", "Returns the currently used controller.

Returns
-------
opencascade::handle<XSControl_Controller>
") Controller;
		const opencascade::handle<XSControl_Controller> & Controller();

		/****************** FinderProcess ******************/
		%feature("compactdefaultargs") FinderProcess;
		%feature("autodoc", "Returns the finderprocess itself.

Returns
-------
opencascade::handle<Transfer_FinderProcess>
") FinderProcess;
		const opencascade::handle<Transfer_FinderProcess> & FinderProcess();

		/****************** PrintStats ******************/
		%feature("compactdefaultargs") PrintStats;
		%feature("autodoc", "Prints statistics on current trace file, according what,mode see printstatsprocess for details.

Parameters
----------
theWhat: int
theMode: int,optional
	default value is 0

Returns
-------
None
") PrintStats;
		void PrintStats(const Standard_Integer theWhat, const Standard_Integer theMode = 0);

		/****************** RecognizeShape ******************/
		%feature("compactdefaultargs") RecognizeShape;
		%feature("autodoc", "Tells if a shape is valid for a transfer to a model asks the controller (recognizewriteshape).

Parameters
----------
theShape: TopoDS_Shape

Returns
-------
bool
") RecognizeShape;
		Standard_Boolean RecognizeShape(const TopoDS_Shape & theShape);

		/****************** RecognizeTransient ******************/
		%feature("compactdefaultargs") RecognizeTransient;
		%feature("autodoc", "Tells if a transient object (from an application) is a valid candidate for a transfer to a model asks the controller (recognizewritetransient) if <obj> is a hshape, calls recognizeshape.

Parameters
----------
theObj: Standard_Transient

Returns
-------
bool
") RecognizeTransient;
		Standard_Boolean RecognizeTransient(const opencascade::handle<Standard_Transient> & theObj);

		/****************** ResultCheckList ******************/
		%feature("compactdefaultargs") ResultCheckList;
		%feature("autodoc", "Returns the check-list of last transfer (write), but tries to bind to each check, the resulting entity in the model instead of keeping the original mapper, whenever known.

Parameters
----------
theModel: Interface_InterfaceModel

Returns
-------
Interface_CheckIterator
") ResultCheckList;
		Interface_CheckIterator ResultCheckList(const opencascade::handle<Interface_InterfaceModel> & theModel);

		/****************** SetController ******************/
		%feature("compactdefaultargs") SetController;
		%feature("autodoc", "Sets a new controller, also sets a new finderprocess.

Parameters
----------
theCtl: XSControl_Controller

Returns
-------
None
") SetController;
		void SetController(const opencascade::handle<XSControl_Controller> & theCtl);

		/****************** SetFinderProcess ******************/
		%feature("compactdefaultargs") SetFinderProcess;
		%feature("autodoc", "Sets a new finderprocess and forgets the former one.

Parameters
----------
theFP: Transfer_FinderProcess

Returns
-------
None
") SetFinderProcess;
		void SetFinderProcess(const opencascade::handle<Transfer_FinderProcess> & theFP);

		/****************** SetTransferMode ******************/
		%feature("compactdefaultargs") SetTransferMode;
		%feature("autodoc", "Changes the transfer mode.

Parameters
----------
theMode: int

Returns
-------
None
") SetTransferMode;
		void SetTransferMode(const Standard_Integer theMode);

		/****************** TransferMode ******************/
		%feature("compactdefaultargs") TransferMode;
		%feature("autodoc", "Returns the current transfer mode (an integer) it will be interpreted by the controller to run transfers this call form could be later replaced by more specific ones (parameters suited for each norm / transfer case).

Returns
-------
int
") TransferMode;
		Standard_Integer TransferMode();

		/****************** TransferWriteShape ******************/
		%feature("compactdefaultargs") TransferWriteShape;
		%feature("autodoc", "Transfers a shape from cascade to a model of current norm, according to the last call to settransfermode works by calling the controller returns status : =0 if ok, >0 if error during transfer, <0 if transfer badly initialised.

Parameters
----------
theModel: Interface_InterfaceModel
theShape: TopoDS_Shape

Returns
-------
IFSelect_ReturnStatus
") TransferWriteShape;
		IFSelect_ReturnStatus TransferWriteShape(const opencascade::handle<Interface_InterfaceModel> & theModel, const TopoDS_Shape & theShape);

		/****************** TransferWriteTransient ******************/
		%feature("compactdefaultargs") TransferWriteTransient;
		%feature("autodoc", "Transfers a transient object (from an application) to a model of current norm, according to the last call to settransfermode works by calling the controller returns status : =0 if ok, >0 if error during transfer, <0 if transfer badly initialised.

Parameters
----------
theModel: Interface_InterfaceModel
theObj: Standard_Transient

Returns
-------
IFSelect_ReturnStatus
") TransferWriteTransient;
		IFSelect_ReturnStatus TransferWriteTransient(const opencascade::handle<Interface_InterfaceModel> & theModel, const opencascade::handle<Standard_Transient> & theObj);

};


%make_alias(XSControl_TransferWriter)

%extend XSControl_TransferWriter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class XSControl_Utils *
************************/
class XSControl_Utils {
	public:
		/****************** XSControl_Utils ******************/
		%feature("compactdefaultargs") XSControl_Utils;
		%feature("autodoc", "The only use of this, is to allow a frontal to get one distinct 'utils' set per separate engine.

Returns
-------
None
") XSControl_Utils;
		 XSControl_Utils();

		/****************** AppendCStr ******************/
		%feature("compactdefaultargs") AppendCStr;
		%feature("autodoc", "No available documentation.

Parameters
----------
seqval: TColStd_HSequenceOfHAsciiString
strval: char *

Returns
-------
None
") AppendCStr;
		void AppendCStr(const opencascade::handle<TColStd_HSequenceOfHAsciiString> & seqval, const char * strval);

		/****************** AppendEStr ******************/
		%feature("compactdefaultargs") AppendEStr;
		%feature("autodoc", "No available documentation.

Parameters
----------
seqval: TColStd_HSequenceOfHExtendedString
strval: Standard_ExtString

Returns
-------
None
") AppendEStr;
		void AppendEStr(const opencascade::handle<TColStd_HSequenceOfHExtendedString> & seqval, const Standard_ExtString strval);

		/****************** AppendShape ******************/
		%feature("compactdefaultargs") AppendShape;
		%feature("autodoc", "No available documentation.

Parameters
----------
seqv: TopTools_HSequenceOfShape
shape: TopoDS_Shape

Returns
-------
None
") AppendShape;
		void AppendShape(const opencascade::handle<TopTools_HSequenceOfShape> & seqv, const TopoDS_Shape & shape);

		/****************** AppendTra ******************/
		%feature("compactdefaultargs") AppendTra;
		%feature("autodoc", "No available documentation.

Parameters
----------
seqval: TColStd_HSequenceOfTransient
traval: Standard_Transient

Returns
-------
None
") AppendTra;
		void AppendTra(const opencascade::handle<TColStd_HSequenceOfTransient> & seqval, const opencascade::handle<Standard_Transient> & traval);

		/****************** ArrToSeq ******************/
		%feature("compactdefaultargs") ArrToSeq;
		%feature("autodoc", "No available documentation.

Parameters
----------
arr: Standard_Transient

Returns
-------
opencascade::handle<Standard_Transient>
") ArrToSeq;
		opencascade::handle<Standard_Transient> ArrToSeq(const opencascade::handle<Standard_Transient> & arr);

		/****************** AsciiToExtended ******************/
		%feature("compactdefaultargs") AsciiToExtended;
		%feature("autodoc", "No available documentation.

Parameters
----------
str: char *

Returns
-------
Standard_ExtString
") AsciiToExtended;
		Standard_ExtString AsciiToExtended(const char * str);

		/****************** BinderShape ******************/
		%feature("compactdefaultargs") BinderShape;
		%feature("autodoc", "From a transient, returns a shape. in fact, recognizes shapebinder shapemapper and hshape.

Parameters
----------
tr: Standard_Transient

Returns
-------
TopoDS_Shape
") BinderShape;
		TopoDS_Shape BinderShape(const opencascade::handle<Standard_Transient> & tr);

		/****************** CStrValue ******************/
		%feature("compactdefaultargs") CStrValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
list: Standard_Transient
num: int

Returns
-------
char *
") CStrValue;
		const char * CStrValue(const opencascade::handle<Standard_Transient> & list, const Standard_Integer num);

		/****************** CompoundFromSeq ******************/
		%feature("compactdefaultargs") CompoundFromSeq;
		%feature("autodoc", "Converts a list of shapes to a compound (a kind of shape).

Parameters
----------
seqval: TopTools_HSequenceOfShape

Returns
-------
TopoDS_Shape
") CompoundFromSeq;
		TopoDS_Shape CompoundFromSeq(const opencascade::handle<TopTools_HSequenceOfShape> & seqval);

		/****************** DateString ******************/
		%feature("compactdefaultargs") DateString;
		%feature("autodoc", "No available documentation.

Parameters
----------
yy: int
mm: int
dd: int
hh: int
mn: int
ss: int

Returns
-------
char *
") DateString;
		const char * DateString(const Standard_Integer yy, const Standard_Integer mm, const Standard_Integer dd, const Standard_Integer hh, const Standard_Integer mn, const Standard_Integer ss);

		/****************** DateValues ******************/
		%feature("compactdefaultargs") DateValues;
		%feature("autodoc", "No available documentation.

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
") DateValues;
		void DateValues(const char * text, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** EStrValue ******************/
		%feature("compactdefaultargs") EStrValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
list: Standard_Transient
num: int

Returns
-------
Standard_ExtString
") EStrValue;
		Standard_ExtString EStrValue(const opencascade::handle<Standard_Transient> & list, const Standard_Integer num);

		/****************** ExtendedToAscii ******************/
		%feature("compactdefaultargs") ExtendedToAscii;
		%feature("autodoc", "No available documentation.

Parameters
----------
str: Standard_ExtString

Returns
-------
char *
") ExtendedToAscii;
		const char * ExtendedToAscii(const Standard_ExtString str);

		/****************** IsAscii ******************/
		%feature("compactdefaultargs") IsAscii;
		%feature("autodoc", "No available documentation.

Parameters
----------
str: Standard_ExtString

Returns
-------
bool
") IsAscii;
		Standard_Boolean IsAscii(const Standard_ExtString str);

		/****************** IsKind ******************/
		%feature("compactdefaultargs") IsKind;
		%feature("autodoc", "No available documentation.

Parameters
----------
item: Standard_Transient
what: Standard_Type

Returns
-------
bool
") IsKind;
		Standard_Boolean IsKind(const opencascade::handle<Standard_Transient> & item, const opencascade::handle<Standard_Type> & what);

		/****************** NewSeqCStr ******************/
		%feature("compactdefaultargs") NewSeqCStr;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TColStd_HSequenceOfHAsciiString>
") NewSeqCStr;
		opencascade::handle<TColStd_HSequenceOfHAsciiString> NewSeqCStr();

		/****************** NewSeqEStr ******************/
		%feature("compactdefaultargs") NewSeqEStr;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TColStd_HSequenceOfHExtendedString>
") NewSeqEStr;
		opencascade::handle<TColStd_HSequenceOfHExtendedString> NewSeqEStr();

		/****************** NewSeqShape ******************/
		%feature("compactdefaultargs") NewSeqShape;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TopTools_HSequenceOfShape>
") NewSeqShape;
		opencascade::handle<TopTools_HSequenceOfShape> NewSeqShape();

		/****************** NewSeqTra ******************/
		%feature("compactdefaultargs") NewSeqTra;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TColStd_HSequenceOfTransient>
") NewSeqTra;
		opencascade::handle<TColStd_HSequenceOfTransient> NewSeqTra();

		/****************** SeqIntValue ******************/
		%feature("compactdefaultargs") SeqIntValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
list: TColStd_HSequenceOfInteger
num: int

Returns
-------
int
") SeqIntValue;
		Standard_Integer SeqIntValue(const opencascade::handle<TColStd_HSequenceOfInteger> & list, const Standard_Integer num);

		/****************** SeqLength ******************/
		%feature("compactdefaultargs") SeqLength;
		%feature("autodoc", "No available documentation.

Parameters
----------
list: Standard_Transient

Returns
-------
int
") SeqLength;
		Standard_Integer SeqLength(const opencascade::handle<Standard_Transient> & list);

		/****************** SeqToArr ******************/
		%feature("compactdefaultargs") SeqToArr;
		%feature("autodoc", "No available documentation.

Parameters
----------
seq: Standard_Transient
first: int,optional
	default value is 1

Returns
-------
opencascade::handle<Standard_Transient>
") SeqToArr;
		opencascade::handle<Standard_Transient> SeqToArr(const opencascade::handle<Standard_Transient> & seq, const Standard_Integer first = 1);

		/****************** ShapeBinder ******************/
		%feature("compactdefaultargs") ShapeBinder;
		%feature("autodoc", "Creates a transient object from a shape : it is either a binder (used by functions which require a transient but can process a shape, such as viewing functions) or a hshape (according to hs) default is a hshape.

Parameters
----------
shape: TopoDS_Shape
hs: bool,optional
	default value is Standard_True

Returns
-------
opencascade::handle<Standard_Transient>
") ShapeBinder;
		opencascade::handle<Standard_Transient> ShapeBinder(const TopoDS_Shape & shape, const Standard_Boolean hs = Standard_True);

		/****************** ShapeType ******************/
		%feature("compactdefaultargs") ShapeType;
		%feature("autodoc", "Returns the type of a shape : true type if <compound> is false if <compound> is true and <shape> is a compound, iterates on its items. if all are of the same type, returns this type. else, returns compound. if it is empty, returns shape for a null shape, returns shape.

Parameters
----------
shape: TopoDS_Shape
compound: bool

Returns
-------
TopAbs_ShapeEnum
") ShapeType;
		TopAbs_ShapeEnum ShapeType(const TopoDS_Shape & shape, const Standard_Boolean compound);

		/****************** ShapeValue ******************/
		%feature("compactdefaultargs") ShapeValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
seqv: TopTools_HSequenceOfShape
num: int

Returns
-------
TopoDS_Shape
") ShapeValue;
		TopoDS_Shape ShapeValue(const opencascade::handle<TopTools_HSequenceOfShape> & seqv, const Standard_Integer num);

		/****************** SortedCompound ******************/
		%feature("compactdefaultargs") SortedCompound;
		%feature("autodoc", "From a shape, builds a compound as follows : explores it level by level if <explore> is false, only compound items. else, all items adds to the result, shapes which comply to <type> + if <type> is wire, considers free edges (and makes wires) + if <type> is shell, considers free faces (and makes shells) if <compound> is true, gathers items in compounds which correspond to starting compound,solid or shell containers, or items directly contained in a compound.

Parameters
----------
shape: TopoDS_Shape
type: TopAbs_ShapeEnum
explore: bool
compound: bool

Returns
-------
TopoDS_Shape
") SortedCompound;
		TopoDS_Shape SortedCompound(const TopoDS_Shape & shape, const TopAbs_ShapeEnum type, const Standard_Boolean explore, const Standard_Boolean compound);

		/****************** ToAString ******************/
		%feature("compactdefaultargs") ToAString;
		%feature("autodoc", "No available documentation.

Parameters
----------
strcon: char *

Returns
-------
TCollection_AsciiString
") ToAString;
		TCollection_AsciiString ToAString(const char * strcon);

		/****************** ToCString ******************/
		%feature("compactdefaultargs") ToCString;
		%feature("autodoc", "No available documentation.

Parameters
----------
strval: TCollection_HAsciiString

Returns
-------
char *
") ToCString;
		const char * ToCString(const opencascade::handle<TCollection_HAsciiString> & strval);

		/****************** ToCString ******************/
		%feature("compactdefaultargs") ToCString;
		%feature("autodoc", "No available documentation.

Parameters
----------
strval: TCollection_AsciiString

Returns
-------
char *
") ToCString;
		const char * ToCString(const TCollection_AsciiString & strval);

		/****************** ToEString ******************/
		%feature("compactdefaultargs") ToEString;
		%feature("autodoc", "No available documentation.

Parameters
----------
strval: TCollection_HExtendedString

Returns
-------
Standard_ExtString
") ToEString;
		Standard_ExtString ToEString(const opencascade::handle<TCollection_HExtendedString> & strval);

		/****************** ToEString ******************/
		%feature("compactdefaultargs") ToEString;
		%feature("autodoc", "No available documentation.

Parameters
----------
strval: TCollection_ExtendedString

Returns
-------
Standard_ExtString
") ToEString;
		Standard_ExtString ToEString(const TCollection_ExtendedString & strval);

		/****************** ToHString ******************/
		%feature("compactdefaultargs") ToHString;
		%feature("autodoc", "No available documentation.

Parameters
----------
strcon: char *

Returns
-------
opencascade::handle<TCollection_HAsciiString>
") ToHString;
		opencascade::handle<TCollection_HAsciiString> ToHString(const char * strcon);

		/****************** ToHString ******************/
		%feature("compactdefaultargs") ToHString;
		%feature("autodoc", "No available documentation.

Parameters
----------
strcon: Standard_ExtString

Returns
-------
opencascade::handle<TCollection_HExtendedString>
") ToHString;
		opencascade::handle<TCollection_HExtendedString> ToHString(const Standard_ExtString strcon);

		/****************** ToXString ******************/
		%feature("compactdefaultargs") ToXString;
		%feature("autodoc", "No available documentation.

Parameters
----------
strcon: Standard_ExtString

Returns
-------
TCollection_ExtendedString
") ToXString;
		TCollection_ExtendedString ToXString(const Standard_ExtString strcon);

		/****************** TraValue ******************/
		%feature("compactdefaultargs") TraValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
list: Standard_Transient
num: int

Returns
-------
opencascade::handle<Standard_Transient>
") TraValue;
		opencascade::handle<Standard_Transient> TraValue(const opencascade::handle<Standard_Transient> & list, const Standard_Integer num);

		/****************** TraceLine ******************/
		%feature("compactdefaultargs") TraceLine;
		%feature("autodoc", "Just prints a line into the current trace file. this allows to better characterise the various trace outputs, as desired.

Parameters
----------
line: char *

Returns
-------
None
") TraceLine;
		void TraceLine(const char * line);

		/****************** TraceLines ******************/
		%feature("compactdefaultargs") TraceLines;
		%feature("autodoc", "Just prints a line or a set of lines into the current trace file. <lines> can be a hascii/extendedstring (produces a print without ending line) or a hsequence or harray1 of .. (one new line per item).

Parameters
----------
lines: Standard_Transient

Returns
-------
None
") TraceLines;
		void TraceLines(const opencascade::handle<Standard_Transient> & lines);

		/****************** TypeName ******************/
		%feature("compactdefaultargs") TypeName;
		%feature("autodoc", "Returns the name of the dynamic type of an object, i.e. : if it is a type, its name if it is a object not a type, the name of its dynamictype if it is null, an empty string if <nopk> is false (d), gives complete name if <nopk> is true, returns class name without package.

Parameters
----------
item: Standard_Transient
nopk: bool,optional
	default value is Standard_False

Returns
-------
char *
") TypeName;
		const char * TypeName(const opencascade::handle<Standard_Transient> & item, const Standard_Boolean nopk = Standard_False);

};


%extend XSControl_Utils {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class XSControl_Vars *
***********************/
class XSControl_Vars : public Standard_Transient {
	public:
		/****************** XSControl_Vars ******************/
		%feature("compactdefaultargs") XSControl_Vars;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") XSControl_Vars;
		 XSControl_Vars();

		/****************** Get ******************/
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "No available documentation.

Parameters
----------
name: char *

Returns
-------
opencascade::handle<Standard_Transient>
") Get;
		virtual opencascade::handle<Standard_Transient> Get(const char * & name);

		/****************** GetCurve ******************/
		%feature("compactdefaultargs") GetCurve;
		%feature("autodoc", "No available documentation.

Parameters
----------
name: char *

Returns
-------
opencascade::handle<Geom_Curve>
") GetCurve;
		virtual opencascade::handle<Geom_Curve> GetCurve(const char * & name);

		/****************** GetCurve2d ******************/
		%feature("compactdefaultargs") GetCurve2d;
		%feature("autodoc", "No available documentation.

Parameters
----------
name: char *

Returns
-------
opencascade::handle<Geom2d_Curve>
") GetCurve2d;
		virtual opencascade::handle<Geom2d_Curve> GetCurve2d(const char * & name);

		/****************** GetGeom ******************/
		%feature("compactdefaultargs") GetGeom;
		%feature("autodoc", "No available documentation.

Parameters
----------
name: char *

Returns
-------
opencascade::handle<Geom_Geometry>
") GetGeom;
		virtual opencascade::handle<Geom_Geometry> GetGeom(const char * & name);

		/****************** GetPoint ******************/
		%feature("compactdefaultargs") GetPoint;
		%feature("autodoc", "No available documentation.

Parameters
----------
name: char *
pnt: gp_Pnt

Returns
-------
bool
") GetPoint;
		virtual Standard_Boolean GetPoint(const char * & name, gp_Pnt & pnt);

		/****************** GetPoint2d ******************/
		%feature("compactdefaultargs") GetPoint2d;
		%feature("autodoc", "No available documentation.

Parameters
----------
name: char *
pnt: gp_Pnt2d

Returns
-------
bool
") GetPoint2d;
		virtual Standard_Boolean GetPoint2d(const char * & name, gp_Pnt2d & pnt);

		/****************** GetShape ******************/
		%feature("compactdefaultargs") GetShape;
		%feature("autodoc", "No available documentation.

Parameters
----------
name: char *

Returns
-------
TopoDS_Shape
") GetShape;
		virtual TopoDS_Shape GetShape(const char * & name);

		/****************** GetSurface ******************/
		%feature("compactdefaultargs") GetSurface;
		%feature("autodoc", "No available documentation.

Parameters
----------
name: char *

Returns
-------
opencascade::handle<Geom_Surface>
") GetSurface;
		virtual opencascade::handle<Geom_Surface> GetSurface(const char * & name);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "No available documentation.

Parameters
----------
name: char *
val: Standard_Transient

Returns
-------
None
") Set;
		virtual void Set(const char * name, const opencascade::handle<Standard_Transient> & val);

		/****************** SetPoint ******************/
		%feature("compactdefaultargs") SetPoint;
		%feature("autodoc", "No available documentation.

Parameters
----------
name: char *
val: gp_Pnt

Returns
-------
None
") SetPoint;
		virtual void SetPoint(const char * name, const gp_Pnt & val);

		/****************** SetPoint2d ******************/
		%feature("compactdefaultargs") SetPoint2d;
		%feature("autodoc", "No available documentation.

Parameters
----------
name: char *
val: gp_Pnt2d

Returns
-------
None
") SetPoint2d;
		virtual void SetPoint2d(const char * name, const gp_Pnt2d & val);

		/****************** SetShape ******************/
		%feature("compactdefaultargs") SetShape;
		%feature("autodoc", "No available documentation.

Parameters
----------
name: char *
val: TopoDS_Shape

Returns
-------
None
") SetShape;
		virtual void SetShape(const char * name, const TopoDS_Shape & val);

};


%make_alias(XSControl_Vars)

%extend XSControl_Vars {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class XSControl_WorkSession *
******************************/
class XSControl_WorkSession : public IFSelect_WorkSession {
	public:
		/****************** XSControl_WorkSession ******************/
		%feature("compactdefaultargs") XSControl_WorkSession;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") XSControl_WorkSession;
		 XSControl_WorkSession();

		/****************** ClearContext ******************/
		%feature("compactdefaultargs") ClearContext;
		%feature("autodoc", "Clears the whole current context (nullifies it).

Returns
-------
None
") ClearContext;
		void ClearContext();

		/****************** ClearData ******************/
		%feature("compactdefaultargs") ClearData;
		%feature("autodoc", "In addition to basic cleardata, clears transfer and management for interactive use, for mode = 0,1,2 and over 4 plus : mode = 5 to clear transfers (both ways) only mode = 6 to clear enforced results mode = 7 to clear transfers, results.

Parameters
----------
theMode: int

Returns
-------
None
") ClearData;
		virtual void ClearData(const Standard_Integer theMode);

		/****************** Context ******************/
		%feature("compactdefaultargs") Context;
		%feature("autodoc", "Returns the current context list, null if not defined the context is given to the transientprocess for transferread.

Returns
-------
NCollection_DataMap<TCollection_AsciiString, opencascade::handle<Standard_Transient>>
") Context;
		const NCollection_DataMap<TCollection_AsciiString, opencascade::handle<Standard_Transient>> & Context();

		/****************** InitTransferReader ******************/
		%feature("compactdefaultargs") InitTransferReader;
		%feature("autodoc", "Sets a transfer reader, by internal ways, according mode : 0 recreates it clear, 1 clears it (does not recreate) 2 aligns roots of transientprocess from final results 3 aligns final results from roots of transientprocess 4 begins a new transfer (by begintransfer) 5 recreates transferreader then begins a new transfer.

Parameters
----------
theMode: int

Returns
-------
None
") InitTransferReader;
		void InitTransferReader(const Standard_Integer theMode);

		/****************** MapReader ******************/
		%feature("compactdefaultargs") MapReader;
		%feature("autodoc", "Returns the transientprocess(internal data for transferreader).

Returns
-------
opencascade::handle<Transfer_TransientProcess>
") MapReader;
		opencascade::handle<Transfer_TransientProcess> MapReader();

		/****************** NewModel ******************/
		%feature("compactdefaultargs") NewModel;
		%feature("autodoc", "Produces and returns a new model well conditionned it is produced by the norm controller it can be null (if this function is not implemented).

Returns
-------
opencascade::handle<Interface_InterfaceModel>
") NewModel;
		opencascade::handle<Interface_InterfaceModel> NewModel();

		/****************** NormAdaptor ******************/
		%feature("compactdefaultargs") NormAdaptor;
		%feature("autodoc", "Returns the norm controller itself.

Returns
-------
opencascade::handle<XSControl_Controller>
") NormAdaptor;
		const opencascade::handle<XSControl_Controller> & NormAdaptor();

		/****************** PrintTransferStatus ******************/
		%feature("compactdefaultargs") PrintTransferStatus;
		%feature("autodoc", "Prints the transfer status of a transferred item, as beeing the mapped n0 <num>, from mapwriter if <wri> is true, or from mapreader if <wri> is false returns true when done, false else (i.e. num out of range).

Parameters
----------
theNum: int
theWri: bool
theS: Message_Messenger

Returns
-------
bool
") PrintTransferStatus;
		Standard_Boolean PrintTransferStatus(const Standard_Integer theNum, const Standard_Boolean theWri, const opencascade::handle<Message_Messenger> & theS);

		/****************** Result ******************/
		%feature("compactdefaultargs") Result;
		%feature("autodoc", "Returns the result attached to a starting entity if <mode> = 0, returns final result if <mode> = 1, considers last result if <mode> = 2, considers final, else if absent, last returns it as transient, if result is not transient returns the binder <mode> = 10,11,12 idem but returns the binder itself (if it is not, e.g. shape, returns the binder) <mode> = 20, returns the resultfrommodel.

Parameters
----------
theEnt: Standard_Transient
theMode: int

Returns
-------
opencascade::handle<Standard_Transient>
") Result;
		opencascade::handle<Standard_Transient> Result(const opencascade::handle<Standard_Transient> & theEnt, const Standard_Integer theMode);

		/****************** SelectNorm ******************/
		%feature("compactdefaultargs") SelectNorm;
		%feature("autodoc", "Selects a norm defined by its name. a norm is described and handled by a controller returns true if done, false if <normname> is unknown //! the current profile for this norm is taken.

Parameters
----------
theNormName: char *

Returns
-------
bool
") SelectNorm;
		Standard_Boolean SelectNorm(const char * theNormName);

		/****************** SelectedNorm ******************/
		%feature("compactdefaultargs") SelectedNorm;
		%feature("autodoc", "Returns the name of the last selected norm. if none is defined, returns an empty string by default, returns the complete name of the norm if <rsc> is true, returns the short name used for resource.

Parameters
----------
theRsc: bool,optional
	default value is Standard_False

Returns
-------
char *
") SelectedNorm;
		const char * SelectedNorm(const Standard_Boolean theRsc = Standard_False);

		/****************** SetAllContext ******************/
		%feature("compactdefaultargs") SetAllContext;
		%feature("autodoc", "Sets the current context list, as a whole sets it to the transferreader.

Parameters
----------
theContext: Standard_Transient

Returns
-------
None
") SetAllContext;
		void SetAllContext(const NCollection_DataMap<TCollection_AsciiString, opencascade::handle<Standard_Transient> > & theContext);

		/****************** SetController ******************/
		%feature("compactdefaultargs") SetController;
		%feature("autodoc", "Selects a norm defined by its controller itself.

Parameters
----------
theCtl: XSControl_Controller

Returns
-------
None
") SetController;
		void SetController(const opencascade::handle<XSControl_Controller> & theCtl);

		/****************** SetMapReader ******************/
		%feature("compactdefaultargs") SetMapReader;
		%feature("autodoc", "Changes the map reader, i.e. considers that the new one defines the relevant read results (forgets the former ones) returns true when done, false in case of bad definition, i.e. if model from tp differs from that of session.

Parameters
----------
theTP: Transfer_TransientProcess

Returns
-------
bool
") SetMapReader;
		Standard_Boolean SetMapReader(const opencascade::handle<Transfer_TransientProcess> & theTP);

		/****************** SetMapWriter ******************/
		%feature("compactdefaultargs") SetMapWriter;
		%feature("autodoc", "Changes the map reader, i.e. considers that the new one defines the relevant read results (forgets the former ones) returns true when done, false if <fp> is null.

Parameters
----------
theFP: Transfer_FinderProcess

Returns
-------
bool
") SetMapWriter;
		Standard_Boolean SetMapWriter(const opencascade::handle<Transfer_FinderProcess> & theFP);

		/****************** SetTransferReader ******************/
		%feature("compactdefaultargs") SetTransferReader;
		%feature("autodoc", "Sets a transfer reader, which manages transfers on reading.

Parameters
----------
theTR: XSControl_TransferReader

Returns
-------
None
") SetTransferReader;
		void SetTransferReader(const opencascade::handle<XSControl_TransferReader> & theTR);

		/****************** SetVars ******************/
		%feature("compactdefaultargs") SetVars;
		%feature("autodoc", "No available documentation.

Parameters
----------
theVars: XSControl_Vars

Returns
-------
None
") SetVars;
		void SetVars(const opencascade::handle<XSControl_Vars> & theVars);

		/****************** TransferReadOne ******************/
		%feature("compactdefaultargs") TransferReadOne;
		%feature("autodoc", "Commands the transfer of, either one entity, or a list i.e. calls the transferreader after having analysed <ents> it is cumulated from the last begintransfer <ents> is processed by givelist, hence : - <ents> a selection : its selectionresult - <ents> a hsequenceoftransient : this list - <ents> the model : in this specific case, all the roots, with no cumulation of former transfers (transferreadroots).

Parameters
----------
theEnts: Standard_Transient

Returns
-------
int
") TransferReadOne;
		Standard_Integer TransferReadOne(const opencascade::handle<Standard_Transient> & theEnts);

		/****************** TransferReadRoots ******************/
		%feature("compactdefaultargs") TransferReadRoots;
		%feature("autodoc", "Commands the transfer of all the root entities of the model i.e. calls transferroot from the transferreader with the graph no cumulation with former calls to transferreadone.

Returns
-------
int
") TransferReadRoots;
		Standard_Integer TransferReadRoots();

		/****************** TransferReader ******************/
		%feature("compactdefaultargs") TransferReader;
		%feature("autodoc", "Returns the transfer reader, null if not set.

Returns
-------
opencascade::handle<XSControl_TransferReader>
") TransferReader;
		const opencascade::handle<XSControl_TransferReader> & TransferReader();

		/****************** TransferWriteCheckList ******************/
		%feature("compactdefaultargs") TransferWriteCheckList;
		%feature("autodoc", "Returns the check-list of last transfer (write) it is recorded in the finderprocess, but it must be bound with resulting entities (in the resulting file model) rather than with original objects (in fact, their mappers).

Returns
-------
Interface_CheckIterator
") TransferWriteCheckList;
		Interface_CheckIterator TransferWriteCheckList();

		/****************** TransferWriteShape ******************/
		%feature("compactdefaultargs") TransferWriteShape;
		%feature("autodoc", "Transfers a shape from cascade to a model of current norm, according to the last call to setmodewriteshape returns status :done if ok, fail if error during transfer, error if transfer badly initialised.

Parameters
----------
theShape: TopoDS_Shape
theCompGraph: bool,optional
	default value is Standard_True

Returns
-------
IFSelect_ReturnStatus
") TransferWriteShape;
		IFSelect_ReturnStatus TransferWriteShape(const TopoDS_Shape & theShape, const Standard_Boolean theCompGraph = Standard_True);

		/****************** TransferWriter ******************/
		%feature("compactdefaultargs") TransferWriter;
		%feature("autodoc", "Returns the transfer reader, null if not set.

Returns
-------
opencascade::handle<XSControl_TransferWriter>
") TransferWriter;
		const opencascade::handle<XSControl_TransferWriter> & TransferWriter();

		/****************** Vars ******************/
		%feature("compactdefaultargs") Vars;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<XSControl_Vars>
") Vars;
		const opencascade::handle<XSControl_Vars> & Vars();

};


%make_alias(XSControl_WorkSession)

%extend XSControl_WorkSession {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class XSControl_Writer *
*************************/
class XSControl_Writer {
	public:
		/****************** XSControl_Writer ******************/
		%feature("compactdefaultargs") XSControl_Writer;
		%feature("autodoc", "Creates a writer from scratch.

Returns
-------
None
") XSControl_Writer;
		 XSControl_Writer();

		/****************** XSControl_Writer ******************/
		%feature("compactdefaultargs") XSControl_Writer;
		%feature("autodoc", "Creates a writer from scratch, with a norm name which identifie a controller.

Parameters
----------
norm: char *

Returns
-------
None
") XSControl_Writer;
		 XSControl_Writer(const char * norm);

		/****************** XSControl_Writer ******************/
		%feature("compactdefaultargs") XSControl_Writer;
		%feature("autodoc", "Creates a writer from an already existing session if <scratch> is true (d), clears already recorded data.

Parameters
----------
WS: XSControl_WorkSession
scratch: bool,optional
	default value is Standard_True

Returns
-------
None
") XSControl_Writer;
		 XSControl_Writer(const opencascade::handle<XSControl_WorkSession> & WS, const Standard_Boolean scratch = Standard_True);

		/****************** Model ******************/
		%feature("compactdefaultargs") Model;
		%feature("autodoc", "Returns the produced model. produces a new one if not yet done or if <newone> is true this method allows for instance to edit product or header data before writing.

Parameters
----------
newone: bool,optional
	default value is Standard_False

Returns
-------
opencascade::handle<Interface_InterfaceModel>
") Model;
		opencascade::handle<Interface_InterfaceModel> Model(const Standard_Boolean newone = Standard_False);

		/****************** PrintStatsTransfer ******************/
		%feature("compactdefaultargs") PrintStatsTransfer;
		%feature("autodoc", "Prints statistics about transfer.

Parameters
----------
what: int
mode: int,optional
	default value is 0

Returns
-------
None
") PrintStatsTransfer;
		void PrintStatsTransfer(const Standard_Integer what, const Standard_Integer mode = 0);

		/****************** SetNorm ******************/
		%feature("compactdefaultargs") SetNorm;
		%feature("autodoc", "Sets a specific norm to <self> returns true if done, false if <norm> is not available.

Parameters
----------
norm: char *

Returns
-------
bool
") SetNorm;
		Standard_Boolean SetNorm(const char * norm);

		/****************** SetWS ******************/
		%feature("compactdefaultargs") SetWS;
		%feature("autodoc", "Sets a specific session to <self>.

Parameters
----------
WS: XSControl_WorkSession
scratch: bool,optional
	default value is Standard_True

Returns
-------
None
") SetWS;
		void SetWS(const opencascade::handle<XSControl_WorkSession> & WS, const Standard_Boolean scratch = Standard_True);

		/****************** TransferShape ******************/
		%feature("compactdefaultargs") TransferShape;
		%feature("autodoc", "Transfers a shape according to the mode.

Parameters
----------
sh: TopoDS_Shape
mode: int,optional
	default value is 0

Returns
-------
IFSelect_ReturnStatus
") TransferShape;
		IFSelect_ReturnStatus TransferShape(const TopoDS_Shape & sh, const Standard_Integer mode = 0);

		/****************** WS ******************/
		%feature("compactdefaultargs") WS;
		%feature("autodoc", "Returns the session used in <self>.

Returns
-------
opencascade::handle<XSControl_WorkSession>
") WS;
		opencascade::handle<XSControl_WorkSession> WS();

		/****************** WriteFile ******************/
		%feature("compactdefaultargs") WriteFile;
		%feature("autodoc", "Writes the produced model.

Parameters
----------
filename: char *

Returns
-------
IFSelect_ReturnStatus
") WriteFile;
		IFSelect_ReturnStatus WriteFile(const char * filename);

};


%extend XSControl_Writer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
