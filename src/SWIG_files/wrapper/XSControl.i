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
		/**** md5 signature: b618aa1daecc0ffbefb4a6b157593de3 ****/
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
		/**** md5 signature: b6c6b66da40e71edce5a2e245f86c44c ****/
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
		/**** md5 signature: 4d71b0d7cf649b23ced632bfe8b9ebc8 ****/
		%feature("compactdefaultargs") XSControl_ConnectedShapes;
		%feature("autodoc", "Creates a selection connectedshapes. it remains to be set a transferreader.

Returns
-------
None
") XSControl_ConnectedShapes;
		 XSControl_ConnectedShapes();

		/****************** XSControl_ConnectedShapes ******************/
		/**** md5 signature: 2478feb0ae07009d00ea3605025238cb ****/
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
		/**** md5 signature: 09409b3551d6d5001269c261ffdd3963 ****/
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
		/**** md5 signature: 50c4444632fd853033919d1a382f1178 ****/
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
		/**** md5 signature: 6716492c1a431b7aec766a1b00353622 ****/
		%feature("compactdefaultargs") ExploreLabel;
		%feature("autodoc", "Returns a text defining the criterium. 'connected entities through produced shapes'.

Returns
-------
TCollection_AsciiString
") ExploreLabel;
		TCollection_AsciiString ExploreLabel();

		/****************** SetReader ******************/
		/**** md5 signature: 97288373292d85c6f0a8b22d0b4f4266 ****/
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
		/**** md5 signature: f45783f6947780e88ba5a952e8f86149 ****/
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
		/**** md5 signature: 610c155c0945008019ea2d4aabe396f5 ****/
		%feature("compactdefaultargs") ActorWrite;
		%feature("autodoc", "Returns the actor for write attached to the pair (norm,appli) read from field. can be redefined.

Returns
-------
opencascade::handle<Transfer_ActorOfFinderProcess>
") ActorWrite;
		virtual opencascade::handle<Transfer_ActorOfFinderProcess> ActorWrite();

		/****************** AdaptorSession ******************/
		/**** md5 signature: 14068c1209fa349deea9cc714481bec9 ****/
		%feature("compactdefaultargs") AdaptorSession;
		%feature("autodoc", "No available documentation.

Returns
-------
NCollection_DataMap<TCollection_AsciiString, opencascade::handle<Standard_Transient>>
") AdaptorSession;
		const NCollection_DataMap<TCollection_AsciiString, opencascade::handle<Standard_Transient>> & AdaptorSession();

		/****************** AddSessionItem ******************/
		/**** md5 signature: 4cfaec218ac7b15e930ba58b9fdfd337 ****/
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
		/**** md5 signature: 1e12ceab21a1bbaa8139a52550ee2d9a ****/
		%feature("compactdefaultargs") AutoRecord;
		%feature("autodoc", "Records <self> is a general dictionary under short and long names (see method name).

Returns
-------
None
") AutoRecord;
		void AutoRecord();

		/****************** Customise ******************/
		/**** md5 signature: 4e5dd2965a730e5ed2bc1f16c3b65015 ****/
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
		/**** md5 signature: 1fc5903958df0acc16f9019b1f3dfcbb ****/
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
		/**** md5 signature: 0e59b8b854cfbc600b9e3c30645c6356 ****/
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
		/**** md5 signature: 9f2161a8defa638c39dee42674b2c3ca ****/
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
		/**** md5 signature: a614a2a031c0f6de75e5496e2bd2c8da ****/
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
		/**** md5 signature: 0b1be90749007fa9c3aadc3c17bc79c8 ****/
		%feature("compactdefaultargs") NewModel;
		%feature("autodoc", "Creates a new empty model ready to receive data of the norm used to write data from imagine to an interface file.

Returns
-------
opencascade::handle<Interface_InterfaceModel>
") NewModel;
		virtual opencascade::handle<Interface_InterfaceModel> NewModel();

		/****************** Protocol ******************/
		/**** md5 signature: 1c9ddeeacf191f917e4377fcdad955ea ****/
		%feature("compactdefaultargs") Protocol;
		%feature("autodoc", "Returns the protocol attached to the norm (from field).

Returns
-------
opencascade::handle<Interface_Protocol>
") Protocol;
		const opencascade::handle<Interface_Protocol> & Protocol();

		/****************** RecognizeWriteShape ******************/
		/**** md5 signature: bf9c781492161c75e6ecd990309067e7 ****/
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
		/**** md5 signature: ab61fb056de5fe39183b10722cfdf45f ****/
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
		/**** md5 signature: 82213ecee20989c7125a79ae5a889d65 ****/
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
		/**** md5 signature: e7b0928c69a84934a61865297a1477f2 ****/
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
		/**** md5 signature: 1008f7dfeac004b90b54003352227a07 ****/
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
		/**** md5 signature: 256e35b925b3df022507f10889c59c8f ****/
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
		/**** md5 signature: 7bfc54b589c5986d7309de43e74d86dd ****/
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
		/**** md5 signature: ade60fb8abd6821ca807fecdfd73838f ****/
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
		/**** md5 signature: f360bce7fe914b53a68013a5b919b6ae ****/
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
		/**** md5 signature: f21d954bd84c7081ee24142bda2e7619 ****/
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
		/**** md5 signature: 7c195930f9d0e8c986e2cba27b8d6ee4 ****/
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
		/**** md5 signature: f1b12c6210426021728b66b3f86d7a28 ****/
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
		/**** md5 signature: 342fdccc4643f67c269591c4b6447108 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Defines and loads all functions which work on shapes for xscontrol (as actfunc).

Returns
-------
None
") Init;
		static void Init();

		/****************** MoreShapes ******************/
		/**** md5 signature: 64cec2253a48ad178a7f54924ed07fad ****/
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
		/**** md5 signature: 342fdccc4643f67c269591c4b6447108 ****/
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
		/**** md5 signature: 45dd4ba3975813b63dc9f13fc41916a5 ****/
		%feature("compactdefaultargs") XSControl_Reader;
		%feature("autodoc", "Creates a reader from scratch (creates an empty worksession) a worksession or a controller must be provided before running.

Returns
-------
None
") XSControl_Reader;
		 XSControl_Reader();

		/****************** XSControl_Reader ******************/
		/**** md5 signature: 1b278c24bc5ba36553315d7f34ac8b43 ****/
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
		/**** md5 signature: dde5d0249121e014a940df9f07c34b20 ****/
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
		/**** md5 signature: 052780fae74c03e43f332caaaaf6b2cc ****/
		%feature("compactdefaultargs") ClearShapes;
		%feature("autodoc", "Clears the list of shapes that may have accumulated in calls to transferone or transferroot.c.

Returns
-------
None
") ClearShapes;
		void ClearShapes();

		/****************** GetStatsTransfer ******************/
		/**** md5 signature: e1d5ca4b1efe1739fc37e88022ce93fd ****/
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
		/**** md5 signature: 48cde5950be2c5c0783363940ad48d45 ****/
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
		/**** md5 signature: 05fdcf13ca9e417fad4d2b6ab10b4c43 ****/
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
		/**** md5 signature: aa6e85fbf0fa37084c702759534fae8b ****/
		%feature("compactdefaultargs") Model;
		%feature("autodoc", "Returns the model. it can then be consulted (header, product).

Returns
-------
opencascade::handle<Interface_InterfaceModel>
") Model;
		opencascade::handle<Interface_InterfaceModel> Model();

		/****************** NbRootsForTransfer ******************/
		/**** md5 signature: 50a9a876bd891ed944872afe5199e177 ****/
		%feature("compactdefaultargs") NbRootsForTransfer;
		%feature("autodoc", "Determines the list of root entities which are candidate for a transfer to a shape, and returns the number of entities in the list.

Returns
-------
int
") NbRootsForTransfer;
		virtual Standard_Integer NbRootsForTransfer();

		/****************** NbShapes ******************/
		/**** md5 signature: ea90d1514db96ad18becf0e04a33abf6 ****/
		%feature("compactdefaultargs") NbShapes;
		%feature("autodoc", "Returns the number of shapes produced by translation.

Returns
-------
int
") NbShapes;
		Standard_Integer NbShapes();

		/****************** OneShape ******************/
		/**** md5 signature: 1fc1610db08b4eec83d275771d406ea5 ****/
		%feature("compactdefaultargs") OneShape;
		%feature("autodoc", "Returns all of the results in a single shape which is: - a null shape if there are no results, - a shape if there is one result, - a compound containing the resulting shapes if there are more than one.

Returns
-------
TopoDS_Shape
") OneShape;
		TopoDS_Shape OneShape();

		/****************** PrintCheckLoad ******************/
		/**** md5 signature: 39be9ee8d1dc305fcff3dc9ccaca7ff5 ****/
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
		/**** md5 signature: 6750f68e6aed952f2529ea394507d25f ****/
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
		/**** md5 signature: 148fec90ff7b063449e9624a36399cda ****/
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
		/**** md5 signature: 0c5675761cd6df0c5f286882695ad872 ****/
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
		/**** md5 signature: c2a76b8d96e252b5e6c8127f08dd357b ****/
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
		/**** md5 signature: b11f28b0f865ad413b98701b134b89de ****/
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
		/**** md5 signature: 74ebce3f94d695bdeb4915fb004d07d2 ****/
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
		/**** md5 signature: b325565d748ea0ef38fee9bdb447c4a9 ****/
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
		/**** md5 signature: e9f0d85f2309b756e1138031ffab88d1 ****/
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
		/**** md5 signature: 009439ae1ae08c1c5405be54219f9bab ****/
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
		/**** md5 signature: 21dda38a1bee06e16c141392cd7344e7 ****/
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
		/**** md5 signature: 028bf2cebaff8b802fef19e42bd5c2ed ****/
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
		/**** md5 signature: 4999933d4aa982f0947849f7f858c1c8 ****/
		%feature("compactdefaultargs") TransferRoots;
		%feature("autodoc", "Translates all translatable roots and returns the number of successful translations. warning - this function clears existing output shapes first.

Returns
-------
int
") TransferRoots;
		Standard_Integer TransferRoots();

		/****************** WS ******************/
		/**** md5 signature: 4d866376b023ba3185e62899810cc121 ****/
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
		/**** md5 signature: 94bb02ca0d68fe3c12bdba8f7591a712 ****/
		%feature("compactdefaultargs") XSControl_SelectForTransfer;
		%feature("autodoc", "Creates a selectfortransfer, non initialised it sorts nothing, unless an actor has been defined.

Returns
-------
None
") XSControl_SelectForTransfer;
		 XSControl_SelectForTransfer();

		/****************** XSControl_SelectForTransfer ******************/
		/**** md5 signature: cd9bd21926a91eb04a25aa4cb2ded3e7 ****/
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
		/**** md5 signature: 8f4509007d618de2f7e91d2fcd2d8b63 ****/
		%feature("compactdefaultargs") Actor;
		%feature("autodoc", "Returns the actor used as precised one. returns a null handle for a creation from a transferreader without any further setting.

Returns
-------
opencascade::handle<Transfer_ActorOfTransientProcess>
") Actor;
		opencascade::handle<Transfer_ActorOfTransientProcess> Actor();

		/****************** ExtractLabel ******************/
		/**** md5 signature: 04da44ccc1aaa5db6b559360d74d3853 ****/
		%feature("compactdefaultargs") ExtractLabel;
		%feature("autodoc", "Returns a text defining the criterium : 'recognized for transfer [(current actor)]'.

Returns
-------
TCollection_AsciiString
") ExtractLabel;
		TCollection_AsciiString ExtractLabel();

		/****************** Reader ******************/
		/**** md5 signature: 4e894517ca5ef1dfbe9a5687ba29d3f0 ****/
		%feature("compactdefaultargs") Reader;
		%feature("autodoc", "Returns the reader (if created with a reader) returns a null handle if not created with a reader.

Returns
-------
opencascade::handle<XSControl_TransferReader>
") Reader;
		opencascade::handle<XSControl_TransferReader> Reader();

		/****************** SetActor ******************/
		/**** md5 signature: f10fc7a63233219bda39f0927a4aaf5c ****/
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
		/**** md5 signature: 97288373292d85c6f0a8b22d0b4f4266 ****/
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
		/**** md5 signature: 88b4690c932193f08237f487d1cf387b ****/
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
		/**** md5 signature: 08de7c992164eeaf29032b02e1c8603e ****/
		%feature("compactdefaultargs") XSControl_SignTransferStatus;
		%feature("autodoc", "Creates a signtransferstatus, not initialised it gives nothing (empty string).

Returns
-------
None
") XSControl_SignTransferStatus;
		 XSControl_SignTransferStatus();

		/****************** XSControl_SignTransferStatus ******************/
		/**** md5 signature: ea4543a01ba71faa278c43f4f5f27659 ****/
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
		/**** md5 signature: 25f31457d784fa027f6e290942badcce ****/
		%feature("compactdefaultargs") Map;
		%feature("autodoc", "Returns the transientprocess used as precised one returns a null handle for a creation from a transferreader without any further setting.

Returns
-------
opencascade::handle<Transfer_TransientProcess>
") Map;
		opencascade::handle<Transfer_TransientProcess> Map();

		/****************** Reader ******************/
		/**** md5 signature: 4e894517ca5ef1dfbe9a5687ba29d3f0 ****/
		%feature("compactdefaultargs") Reader;
		%feature("autodoc", "Returns the reader (if created with a reader) returns a null handle if not created with a reader.

Returns
-------
opencascade::handle<XSControl_TransferReader>
") Reader;
		opencascade::handle<XSControl_TransferReader> Reader();

		/****************** SetMap ******************/
		/**** md5 signature: ff2b0f264d62fa82925ef516aebb1b44 ****/
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
		/**** md5 signature: 97288373292d85c6f0a8b22d0b4f4266 ****/
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
		/**** md5 signature: 4e85ac861c77ba955d20c48cb38639f7 ****/
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
		/**** md5 signature: d196629f0cfdf876d23cc62e81a13197 ****/
		%feature("compactdefaultargs") XSControl_TransferReader;
		%feature("autodoc", "Creates a transferreader, empty.

Returns
-------
None
") XSControl_TransferReader;
		 XSControl_TransferReader();

		/****************** Actor ******************/
		/**** md5 signature: ee42cfbcd1be909d7e99c609d926a134 ****/
		%feature("compactdefaultargs") Actor;
		%feature("autodoc", "Returns the actor, determined by the controller, or if this one is unknown, directly set. once it has been defined, it can then be edited.

Returns
-------
opencascade::handle<Transfer_ActorOfTransientProcess>
") Actor;
		opencascade::handle<Transfer_ActorOfTransientProcess> Actor();

		/****************** BeginTransfer ******************/
		/**** md5 signature: 45b9be9b944a95886bf096a49eb0bf8e ****/
		%feature("compactdefaultargs") BeginTransfer;
		%feature("autodoc", "Defines a new transferprocess for reading transfer returns true if done, false if data are not properly defined (the model, the actor for read).

Returns
-------
bool
") BeginTransfer;
		Standard_Boolean BeginTransfer();

		/****************** CheckList ******************/
		/**** md5 signature: c2f87976868957726696fd3856e505ef ****/
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
		/**** md5 signature: 8cccffcb6267b484c298f8f27148f0ea ****/
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
		/**** md5 signature: 0fc5de3e361f7d75f07cbd42429ea39e ****/
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
		/**** md5 signature: 5bdf0f703cced31251a00d2b3bc9afa8 ****/
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
		/**** md5 signature: 2192f10621cbd30af6762c51d01c4896 ****/
		%feature("compactdefaultargs") Context;
		%feature("autodoc", "Returns (modifiable) the whole definition of context rather for internal use (ex.: preparing and setting in once).

Returns
-------
NCollection_DataMap<TCollection_AsciiString, opencascade::handle<Standard_Transient>>
") Context;
		NCollection_DataMap<TCollection_AsciiString, opencascade::handle<Standard_Transient>> & Context();

		/****************** EntitiesFromShapeList ******************/
		/**** md5 signature: 83388d3268ac9efa80b65d6114cc0656 ****/
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
		/**** md5 signature: 9966cc6cce3e3ddf217e30b42b64e541 ****/
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
		/**** md5 signature: f74655131aba069e790b407d9b4e5bd2 ****/
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
		/**** md5 signature: d874246a35353c4bd05788da23930d39 ****/
		%feature("compactdefaultargs") FileName;
		%feature("autodoc", "Returns actual value of file name.

Returns
-------
char *
") FileName;
		const char * FileName();

		/****************** FinalEntityLabel ******************/
		/**** md5 signature: b69bb15f15e6f82ae664a88db6ee06ce ****/
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
		/**** md5 signature: 3e2d0fafc06899f9afe7055b8cad793b ****/
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
		/**** md5 signature: 429e43bd87413e71202b551aefc70959 ****/
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
		/**** md5 signature: a928652c8c5ed3faff31178baa4553a3 ****/
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
		/**** md5 signature: 2b7042065eb7437ca9470c6f68798861 ****/
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
		/**** md5 signature: 5bc4f7165e8bf32577d609094faf715c ****/
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
		/**** md5 signature: d2c3793dc072a96ae5faba49254c6399 ****/
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
		/**** md5 signature: 7c44b4b03d05b9dce1047d6fe502f0e0 ****/
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
		/**** md5 signature: e7c03cee7d8670b6be35b9d94b861cec ****/
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
		/**** md5 signature: 98db2d023bd132f620c4e024a6c65c5a ****/
		%feature("compactdefaultargs") LastCheckList;
		%feature("autodoc", "Returns the checklist resulting from last transferread i.e. from transientprocess itself, recorded from last clear.

Returns
-------
Interface_CheckIterator
") LastCheckList;
		Interface_CheckIterator LastCheckList();

		/****************** LastTransferList ******************/
		/**** md5 signature: 255bd5a89b5da47c530b324fdd155480 ****/
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
		/**** md5 signature: e485d2c2a2cfa9af3cc655f00e076be4 ****/
		%feature("compactdefaultargs") Model;
		%feature("autodoc", "Returns the currently set interfacemodel.

Returns
-------
opencascade::handle<Interface_InterfaceModel>
") Model;
		const opencascade::handle<Interface_InterfaceModel> & Model();

		/****************** PrintStats ******************/
		/**** md5 signature: 8bd41dfecd854fc8ff870fc204b89f8f ****/
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
		/**** md5 signature: 163b44563c2a8ec32944ebf6b8b54c19 ****/
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
		/**** md5 signature: 98ccee84665b07d53fee857c3620f46c ****/
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
		/**** md5 signature: 7ac38a536d6a830144755800fed05505 ****/
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
		/**** md5 signature: 140a5463891e1077f92ad1fff05143af ****/
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
		/**** md5 signature: 69df4ce6aa6ddf3e857c86735c558f1d ****/
		%feature("compactdefaultargs") RecordedList;
		%feature("autodoc", "Returns the list of entities to which a final result is attached (i.e. processed by recordresult).

Returns
-------
opencascade::handle<TColStd_HSequenceOfTransient>
") RecordedList;
		opencascade::handle<TColStd_HSequenceOfTransient> RecordedList();

		/****************** ResultFromNumber ******************/
		/**** md5 signature: 485bb01fc509d5a2647c8297465ceea1 ****/
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
		/**** md5 signature: 7f2c954ef588b667224b188bc0e97ec3 ****/
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
		/**** md5 signature: 160b84a68713fc880aa1b5e0cdd0f277 ****/
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
		/**** md5 signature: 288d2810c031f13ea60c18de24c3c86c ****/
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
		/**** md5 signature: 3469ac92815ae32c739c6c0d2abc2842 ****/
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
		/**** md5 signature: 003fda4710fad22243642415793d506b ****/
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
		/**** md5 signature: 461c1771a4e752c1a120a7e3b022e295 ****/
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
		/**** md5 signature: 2cc0cdd00351c807259030ffb1a5b972 ****/
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
		/**** md5 signature: 559d03b1571f452e583e45d5c994435c ****/
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
		/**** md5 signature: 34a9b701885a19df4e47fd5e4d658dfc ****/
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
		/**** md5 signature: 46a7fdece4afcb0fa8c73e8c509ef729 ****/
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
		/**** md5 signature: 0ff526a57b66ac0a91f4eec27ac49bfa ****/
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
		/**** md5 signature: 299e101b7e278c53f5cfdff497f75ffc ****/
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
		/**** md5 signature: dbf85233730492dd05547394d1707d7c ****/
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
		/**** md5 signature: e3351ab566fcd2f275b7bc6ceae25f92 ****/
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
		/**** md5 signature: c581697d9fdd28675207e919d05ae7c9 ****/
		%feature("compactdefaultargs") TransientProcess;
		%feature("autodoc", "Returns the currently used transientprocess it is computed from the model by transferreadroots, or by begintransferread.

Returns
-------
opencascade::handle<Transfer_TransientProcess>
") TransientProcess;
		const opencascade::handle<Transfer_TransientProcess> & TransientProcess();

		/****************** TransientResult ******************/
		/**** md5 signature: a209c31a0e1d7e3ffc19db8b1e603c66 ****/
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
		/**** md5 signature: c238b8946022215507643a042bd9b965 ****/
		%feature("compactdefaultargs") XSControl_TransferWriter;
		%feature("autodoc", "Creates a transferwriter, empty, ready to run with an empty finderprocess (but no controller, etc).

Returns
-------
None
") XSControl_TransferWriter;
		 XSControl_TransferWriter();

		/****************** CheckList ******************/
		/**** md5 signature: 28097225c7dc1bd34c16a03b8c119653 ****/
		%feature("compactdefaultargs") CheckList;
		%feature("autodoc", "Returns the check-list of last transfer (write), i.e. the check-list currently recorded in the finderprocess.

Returns
-------
Interface_CheckIterator
") CheckList;
		Interface_CheckIterator CheckList();

		/****************** Clear ******************/
		/**** md5 signature: 0fc5de3e361f7d75f07cbd42429ea39e ****/
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
		/**** md5 signature: a2ab19669057f52b70e72fb487074ee6 ****/
		%feature("compactdefaultargs") Controller;
		%feature("autodoc", "Returns the currently used controller.

Returns
-------
opencascade::handle<XSControl_Controller>
") Controller;
		const opencascade::handle<XSControl_Controller> & Controller();

		/****************** FinderProcess ******************/
		/**** md5 signature: 937972e7a8be92f957b48ba97845a084 ****/
		%feature("compactdefaultargs") FinderProcess;
		%feature("autodoc", "Returns the finderprocess itself.

Returns
-------
opencascade::handle<Transfer_FinderProcess>
") FinderProcess;
		const opencascade::handle<Transfer_FinderProcess> & FinderProcess();

		/****************** PrintStats ******************/
		/**** md5 signature: 8bd41dfecd854fc8ff870fc204b89f8f ****/
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
		/**** md5 signature: 1f48fd8f9a4c11c732ae9a5618118f88 ****/
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
		/**** md5 signature: 2b8e7a67951e00a535c14ad88815161c ****/
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
		/**** md5 signature: 7cb46339c8706e2628e4fba9b5f6e250 ****/
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
		/**** md5 signature: cb8a3d51cb45dcc532809e0a42cb204b ****/
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
		/**** md5 signature: d90f3390c01143f53745abc1e10c44d7 ****/
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
		/**** md5 signature: f34971a6bf9f1f3b74f421bf761b7f00 ****/
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
		/**** md5 signature: 73602a039d76c3decd9df7593a3b80eb ****/
		%feature("compactdefaultargs") TransferMode;
		%feature("autodoc", "Returns the current transfer mode (an integer) it will be interpreted by the controller to run transfers this call form could be later replaced by more specific ones (parameters suited for each norm / transfer case).

Returns
-------
int
") TransferMode;
		Standard_Integer TransferMode();

		/****************** TransferWriteShape ******************/
		/**** md5 signature: 8410cf3b63ed1e40f86b046290a2b6bd ****/
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
		/**** md5 signature: 696df54866f49cdf81d424bb194944a5 ****/
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
		/**** md5 signature: 16bf416d2db60a7035afa83edfee835b ****/
		%feature("compactdefaultargs") XSControl_Utils;
		%feature("autodoc", "The only use of this, is to allow a frontal to get one distinct 'utils' set per separate engine.

Returns
-------
None
") XSControl_Utils;
		 XSControl_Utils();

		/****************** AppendCStr ******************/
		/**** md5 signature: 6e3a97d130fd0aaf4d4548e30eac9e24 ****/
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
		/**** md5 signature: 9934e3172203d6e27f9d10c78cd358ae ****/
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
		/**** md5 signature: 9148f939f8b2aff61c51b67d958b5e92 ****/
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
		/**** md5 signature: 59c160fce3b70fb5b83d7981544c45f4 ****/
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
		/**** md5 signature: 4a24694daf778caba1ea7d2fd0a2bc1c ****/
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
		/**** md5 signature: 57f262f4865f4fa2d3c3e229d384e566 ****/
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
		/**** md5 signature: 1b884ed953b9de71d14d439713905b02 ****/
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
		/**** md5 signature: 4b7c7ff1ecf356720a489f2f11b0f453 ****/
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
		/**** md5 signature: 9c42e270bfcdddbf1929a557984f4fda ****/
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
		/**** md5 signature: 06bb2d8331a757c1e706af724ee8467d ****/
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
		/**** md5 signature: 80cd43251686342d1c83d54472b57f24 ****/
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
		/**** md5 signature: 6160d687934a25fae20a4478d4a4ead9 ****/
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
		/**** md5 signature: 8a0981510ba0ba08c3daafd5e7ba0492 ****/
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
		/**** md5 signature: 4d8b39ffb883d51a71e0f32b2eaaa10d ****/
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
		/**** md5 signature: 7732e0a29b74329984aeae68962b4acc ****/
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
		/**** md5 signature: 02eeec01644c04a031825be6a6c4e7a4 ****/
		%feature("compactdefaultargs") NewSeqCStr;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TColStd_HSequenceOfHAsciiString>
") NewSeqCStr;
		opencascade::handle<TColStd_HSequenceOfHAsciiString> NewSeqCStr();

		/****************** NewSeqEStr ******************/
		/**** md5 signature: 98bc2beca96b37e1ca65c2018ea520d3 ****/
		%feature("compactdefaultargs") NewSeqEStr;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TColStd_HSequenceOfHExtendedString>
") NewSeqEStr;
		opencascade::handle<TColStd_HSequenceOfHExtendedString> NewSeqEStr();

		/****************** NewSeqShape ******************/
		/**** md5 signature: 23e26f5e9fae6802506681d5987d1405 ****/
		%feature("compactdefaultargs") NewSeqShape;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TopTools_HSequenceOfShape>
") NewSeqShape;
		opencascade::handle<TopTools_HSequenceOfShape> NewSeqShape();

		/****************** NewSeqTra ******************/
		/**** md5 signature: c1ef00c0466369cce178e244d57a80fd ****/
		%feature("compactdefaultargs") NewSeqTra;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TColStd_HSequenceOfTransient>
") NewSeqTra;
		opencascade::handle<TColStd_HSequenceOfTransient> NewSeqTra();

		/****************** SeqIntValue ******************/
		/**** md5 signature: 69ce7eb3032d08ef5cc3e1cc19fc0061 ****/
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
		/**** md5 signature: 44119ddec45d1e7d5f1cff385a4a4b32 ****/
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
		/**** md5 signature: 550bf714b9ad83cb9c918865de149817 ****/
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
		/**** md5 signature: b11cf575c90dcb1893515b0fe79b9f6b ****/
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
		/**** md5 signature: ab636bf5c0d2e486d53891e797ab3d6b ****/
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
		/**** md5 signature: 1cde49799a716d33a6a34f896e8e9d8f ****/
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
		/**** md5 signature: b55d0015285d0f23fb3c68ccb5f8f79e ****/
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
		/**** md5 signature: 579c485821dcbf2e2c963016af5bc087 ****/
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
		/**** md5 signature: 3b3d42a4d7befd95fc7da813c3e180a7 ****/
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
		/**** md5 signature: 88caf2c381405fda99aa9c53fe594a55 ****/
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
		/**** md5 signature: 92d646c74275aa73981716c4bb3d5966 ****/
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
		/**** md5 signature: 4d68201f594f44c72ac75f60a954292f ****/
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
		/**** md5 signature: 7b7d11344d2ddb25c7aca4ebcec91c98 ****/
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
		/**** md5 signature: 29cf32d289b49b94c85616a821a0be85 ****/
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
		/**** md5 signature: 7c3f09c2135ae7c014d28567534264cd ****/
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
		/**** md5 signature: 005405a0ace916f3ba6bf9e6220041c1 ****/
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
		/**** md5 signature: 09e41c0832ee8e26e3b51bae02803480 ****/
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
		/**** md5 signature: 20cb718590610f63086ac24e0f2045c2 ****/
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
		/**** md5 signature: 78ab1ca307bbb72decae7f9aa0377244 ****/
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
		/**** md5 signature: da409732d5a7c77ecf3867183bc1efaf ****/
		%feature("compactdefaultargs") XSControl_Vars;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") XSControl_Vars;
		 XSControl_Vars();

		/****************** Get ******************/
		/**** md5 signature: 44e0346a8ce96cf16458a6e2e74bac10 ****/
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
		/**** md5 signature: 599f63b9d3913ce0fc7886108c1a9673 ****/
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
		/**** md5 signature: e21c81bea4735f342ec556482c9688ec ****/
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
		/**** md5 signature: f21f0d65f6dfbbe40fbbd732496261d2 ****/
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
		/**** md5 signature: 8e4b51e11fdfe0bfb7441e816dabce20 ****/
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
		/**** md5 signature: a582c7a95b992cb2d66a37a54d5ab3ff ****/
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
		/**** md5 signature: 2957ff82e7c3b4fbc9b3efaa76a4308e ****/
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
		/**** md5 signature: 68a8636c4fa5cb0089082aa3efacf371 ****/
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
		/**** md5 signature: 16d0a361edf7b31d7551d629d7eda692 ****/
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
		/**** md5 signature: 4d0f75b4ab64236e257eaaecfb5de79c ****/
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
		/**** md5 signature: 49e75825f7ac5dd58f7d04184e5302af ****/
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
		/**** md5 signature: eb81a1893f16847e142322a4c28cc4f0 ****/
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
		/**** md5 signature: a162fca4741888ede15453e8ada8e89f ****/
		%feature("compactdefaultargs") XSControl_WorkSession;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") XSControl_WorkSession;
		 XSControl_WorkSession();

		/****************** ClearContext ******************/
		/**** md5 signature: 4bc018b6ca786bb92053bff7d2a2f3df ****/
		%feature("compactdefaultargs") ClearContext;
		%feature("autodoc", "Clears the whole current context (nullifies it).

Returns
-------
None
") ClearContext;
		void ClearContext();

		/****************** ClearData ******************/
		/**** md5 signature: 081b9c9c9a829dcc63d88d60b3dc10bb ****/
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
		/**** md5 signature: 7cd4d0e47bf5324a740ce16c99b439c1 ****/
		%feature("compactdefaultargs") Context;
		%feature("autodoc", "Returns the current context list, null if not defined the context is given to the transientprocess for transferread.

Returns
-------
NCollection_DataMap<TCollection_AsciiString, opencascade::handle<Standard_Transient>>
") Context;
		const NCollection_DataMap<TCollection_AsciiString, opencascade::handle<Standard_Transient>> & Context();

		/****************** InitTransferReader ******************/
		/**** md5 signature: ed10d9fce1a711a68af788321fdb54fc ****/
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
		/**** md5 signature: 56949b2c05cfb7746727a0c64e125442 ****/
		%feature("compactdefaultargs") MapReader;
		%feature("autodoc", "Returns the transientprocess(internal data for transferreader).

Returns
-------
opencascade::handle<Transfer_TransientProcess>
") MapReader;
		opencascade::handle<Transfer_TransientProcess> MapReader();

		/****************** NewModel ******************/
		/**** md5 signature: b195eaf62d9845e618b9fbba30be48e9 ****/
		%feature("compactdefaultargs") NewModel;
		%feature("autodoc", "Produces and returns a new model well conditionned it is produced by the norm controller it can be null (if this function is not implemented).

Returns
-------
opencascade::handle<Interface_InterfaceModel>
") NewModel;
		opencascade::handle<Interface_InterfaceModel> NewModel();

		/****************** NormAdaptor ******************/
		/**** md5 signature: 324f48b45566fb7aeabe2b2606cd4da4 ****/
		%feature("compactdefaultargs") NormAdaptor;
		%feature("autodoc", "Returns the norm controller itself.

Returns
-------
opencascade::handle<XSControl_Controller>
") NormAdaptor;
		const opencascade::handle<XSControl_Controller> & NormAdaptor();

		/****************** PrintTransferStatus ******************/
		/**** md5 signature: 13c36401ad4298a7bbce09d0c81e0bc4 ****/
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
		/**** md5 signature: 648bf58b2605b71bf5b4112cce9715c1 ****/
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
		/**** md5 signature: 78e48aa95ac967e7205f759747170c4c ****/
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
		/**** md5 signature: 69481250202915c86d557c39cca43930 ****/
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
		/**** md5 signature: c9d911ff4f5d4a8bfcada1763844bd0a ****/
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
		/**** md5 signature: d7eabfce93065329564b5f68591b841a ****/
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
		/**** md5 signature: 15305959af6213befc6e923c624b029e ****/
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
		/**** md5 signature: 969f072d71530560da24b6757937ada3 ****/
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
		/**** md5 signature: 0e6d6ed3732ee9556f87e0a22c8db684 ****/
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
		/**** md5 signature: 9e79436592319c12c279f8df6cdafaef ****/
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
		/**** md5 signature: 348bb895e52c2df7dcea3ec9bb89c366 ****/
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
		/**** md5 signature: 64a5b6ab0521df1c390c9820b4ae0847 ****/
		%feature("compactdefaultargs") TransferReadRoots;
		%feature("autodoc", "Commands the transfer of all the root entities of the model i.e. calls transferroot from the transferreader with the graph no cumulation with former calls to transferreadone.

Returns
-------
int
") TransferReadRoots;
		Standard_Integer TransferReadRoots();

		/****************** TransferReader ******************/
		/**** md5 signature: fb55bcdc028cfc40da9805fb3d48b6bb ****/
		%feature("compactdefaultargs") TransferReader;
		%feature("autodoc", "Returns the transfer reader, null if not set.

Returns
-------
opencascade::handle<XSControl_TransferReader>
") TransferReader;
		const opencascade::handle<XSControl_TransferReader> & TransferReader();

		/****************** TransferWriteCheckList ******************/
		/**** md5 signature: bf723f9190135f140bcf8505128bb64b ****/
		%feature("compactdefaultargs") TransferWriteCheckList;
		%feature("autodoc", "Returns the check-list of last transfer (write) it is recorded in the finderprocess, but it must be bound with resulting entities (in the resulting file model) rather than with original objects (in fact, their mappers).

Returns
-------
Interface_CheckIterator
") TransferWriteCheckList;
		Interface_CheckIterator TransferWriteCheckList();

		/****************** TransferWriteShape ******************/
		/**** md5 signature: a5e6345d1c0b1dd32985a1ae54b32478 ****/
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
		/**** md5 signature: eb51fa8d64a383d09db0f0e2c51bd32e ****/
		%feature("compactdefaultargs") TransferWriter;
		%feature("autodoc", "Returns the transfer reader, null if not set.

Returns
-------
opencascade::handle<XSControl_TransferWriter>
") TransferWriter;
		const opencascade::handle<XSControl_TransferWriter> & TransferWriter();

		/****************** Vars ******************/
		/**** md5 signature: c6e871616aa0015593a80d009d15209f ****/
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
		/**** md5 signature: 973d49b8371a7783d12244f900cab568 ****/
		%feature("compactdefaultargs") XSControl_Writer;
		%feature("autodoc", "Creates a writer from scratch.

Returns
-------
None
") XSControl_Writer;
		 XSControl_Writer();

		/****************** XSControl_Writer ******************/
		/**** md5 signature: 7512321fcaa103e58880fad1df266a83 ****/
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
		/**** md5 signature: fdc5250052abb6411e52ae5355a1787a ****/
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
		/**** md5 signature: ab692cf6d45d428f60a2ede26b226382 ****/
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
		/**** md5 signature: 148fec90ff7b063449e9624a36399cda ****/
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
		/**** md5 signature: b11f28b0f865ad413b98701b134b89de ****/
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
		/**** md5 signature: 74ebce3f94d695bdeb4915fb004d07d2 ****/
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
		/**** md5 signature: f737071f560e66a7d995080ffbdf819a ****/
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
		/**** md5 signature: 4d866376b023ba3185e62899810cc121 ****/
		%feature("compactdefaultargs") WS;
		%feature("autodoc", "Returns the session used in <self>.

Returns
-------
opencascade::handle<XSControl_WorkSession>
") WS;
		opencascade::handle<XSControl_WorkSession> WS();

		/****************** WriteFile ******************/
		/**** md5 signature: c443eb482eff3288f82d0142e04359c7 ****/
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
