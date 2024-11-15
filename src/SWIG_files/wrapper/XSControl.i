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
%define XSCONTROLDOCSTRING
"XSControl module, see official documentation at
https://dev.opencascade.org/doc/occt-7.8.0/refman/html/package_xscontrol.html"
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
%include ../common/EnumTemplates.i
%include ../common/Operators.i
%include ../common/OccHandle.i
%include ../common/IOStream.i
%include ../common/ArrayMacros.i


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
#include<Message_module.hxx>
#include<TopTools_module.hxx>
#include<Geom_module.hxx>
#include<Geom2d_module.hxx>
#include<gp_module.hxx>
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
%import Message.i
%import TopTools.i
%import Geom.i
%import Geom2d.i
%import gp.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
/* end public enums declaration */

/* python proxy classes for enums */
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
		/****** XSControl::Session ******/
		/****** md5 signature: b618aa1daecc0ffbefb4a6b157593de3 ******/
		%feature("compactdefaultargs") Session;
		%feature("autodoc", "
Parameters
----------
pilot: IFSelect_SessionPilot

Return
-------
opencascade::handle<XSControl_WorkSession>

Description
-----------
Returns the worksession of a sessionpilot, but casts it as from xscontrol: it then gives access to control & transfers.
") Session;
		static opencascade::handle<XSControl_WorkSession> Session(const opencascade::handle<IFSelect_SessionPilot> & pilot);

		/****** XSControl::Vars ******/
		/****** md5 signature: b6c6b66da40e71edce5a2e245f86c44c ******/
		%feature("compactdefaultargs") Vars;
		%feature("autodoc", "
Parameters
----------
pilot: IFSelect_SessionPilot

Return
-------
opencascade::handle<XSControl_Vars>

Description
-----------
Returns the vars of a sessionpilot, it is brought by session it provides access to external variables.
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
		/****** XSControl_ConnectedShapes::XSControl_ConnectedShapes ******/
		/****** md5 signature: 4d71b0d7cf649b23ced632bfe8b9ebc8 ******/
		%feature("compactdefaultargs") XSControl_ConnectedShapes;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates a selection connectedshapes. it remains to be set a transferreader.
") XSControl_ConnectedShapes;
		 XSControl_ConnectedShapes();

		/****** XSControl_ConnectedShapes::XSControl_ConnectedShapes ******/
		/****** md5 signature: 2478feb0ae07009d00ea3605025238cb ******/
		%feature("compactdefaultargs") XSControl_ConnectedShapes;
		%feature("autodoc", "
Parameters
----------
TR: XSControl_TransferReader

Return
-------
None

Description
-----------
Creates a selection connectedshapes, which will work with the current transferprocess brought by the transferreader.
") XSControl_ConnectedShapes;
		 XSControl_ConnectedShapes(const opencascade::handle<XSControl_TransferReader> & TR);

		/****** XSControl_ConnectedShapes::AdjacentEntities ******/
		/****** md5 signature: 09409b3551d6d5001269c261ffdd3963 ******/
		%feature("compactdefaultargs") AdjacentEntities;
		%feature("autodoc", "
Parameters
----------
ashape: TopoDS_Shape
TP: Transfer_TransientProcess
type: TopAbs_ShapeEnum

Return
-------
opencascade::handle<TColStd_HSequenceOfTransient>

Description
-----------
This functions considers a shape from a transfer and performs the search function explained above.
") AdjacentEntities;
		static opencascade::handle<TColStd_HSequenceOfTransient> AdjacentEntities(const TopoDS_Shape & ashape, const opencascade::handle<Transfer_TransientProcess> & TP, const TopAbs_ShapeEnum type);

		/****** XSControl_ConnectedShapes::Explore ******/
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
Explores an entity: entities from which are connected to that produced by this entity, including itself.
") Explore;
		Standard_Boolean Explore(const Standard_Integer level, const opencascade::handle<Standard_Transient> & ent, const Interface_Graph & G, Interface_EntityIterator & explored);

		/****** XSControl_ConnectedShapes::ExploreLabel ******/
		/****** md5 signature: 6716492c1a431b7aec766a1b00353622 ******/
		%feature("compactdefaultargs") ExploreLabel;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Returns a text defining the criterium. 'connected entities through produced shapes'.
") ExploreLabel;
		TCollection_AsciiString ExploreLabel();

		/****** XSControl_ConnectedShapes::SetReader ******/
		/****** md5 signature: 97288373292d85c6f0a8b22d0b4f4266 ******/
		%feature("compactdefaultargs") SetReader;
		%feature("autodoc", "
Parameters
----------
TR: XSControl_TransferReader

Return
-------
None

Description
-----------
Sets a transferreader to sort entities: it brings the transferprocess which may change, while the transferreader does not.
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
		/****** XSControl_Controller::ActorRead ******/
		/****** md5 signature: f45783f6947780e88ba5a952e8f86149 ******/
		%feature("compactdefaultargs") ActorRead;
		%feature("autodoc", "
Parameters
----------
model: Interface_InterfaceModel

Return
-------
opencascade::handle<Transfer_ActorOfTransientProcess>

Description
-----------
Returns the actor for read attached to the pair (norm,appli) it can be adapted for data of the input model, as required can be read from field then adapted with model as required.
") ActorRead;
		virtual opencascade::handle<Transfer_ActorOfTransientProcess> ActorRead(const opencascade::handle<Interface_InterfaceModel> & model);

		/****** XSControl_Controller::ActorWrite ******/
		/****** md5 signature: 610c155c0945008019ea2d4aabe396f5 ******/
		%feature("compactdefaultargs") ActorWrite;
		%feature("autodoc", "Return
-------
opencascade::handle<Transfer_ActorOfFinderProcess>

Description
-----------
Returns the actor for write attached to the pair (norm,appli) read from field. can be redefined.
") ActorWrite;
		virtual opencascade::handle<Transfer_ActorOfFinderProcess> ActorWrite();

		/****** XSControl_Controller::AdaptorSession ******/
		/****** md5 signature: 14068c1209fa349deea9cc714481bec9 ******/
		%feature("compactdefaultargs") AdaptorSession;
		%feature("autodoc", "Return
-------
NCollection_DataMap<TCollection_AsciiString, opencascade::handle<Standard_Transient>>

Description
-----------
No available documentation.
") AdaptorSession;
		const NCollection_DataMap<TCollection_AsciiString, opencascade::handle<Standard_Transient>> & AdaptorSession();

		/****** XSControl_Controller::AddSessionItem ******/
		/****** md5 signature: 4cfaec218ac7b15e930ba58b9fdfd337 ******/
		%feature("compactdefaultargs") AddSessionItem;
		%feature("autodoc", "
Parameters
----------
theItem: Standard_Transient
theName: str
toApply: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Records a session item, to be added for customisation of the work session. it must have a specific name. <setapplied> is used if <item> is a generalmodifier, to decide if set to true, <item> will be applied to the hook list 'send'. else, it is not applied to any hook list. remark: this method is to be called at create time, the recorded items will be used by customise warning: if <name> conflicts, the last recorded item is kept.
") AddSessionItem;
		void AddSessionItem(const opencascade::handle<Standard_Transient> & theItem, Standard_CString theName, const Standard_Boolean toApply = Standard_False);

		/****** XSControl_Controller::AutoRecord ******/
		/****** md5 signature: 1e12ceab21a1bbaa8139a52550ee2d9a ******/
		%feature("compactdefaultargs") AutoRecord;
		%feature("autodoc", "Return
-------
None

Description
-----------
Records <self> is a general dictionary under short and long names (see method name).
") AutoRecord;
		void AutoRecord();

		/****** XSControl_Controller::Customise ******/
		/****** md5 signature: 4e5dd2965a730e5ed2bc1f16c3b65015 ******/
		%feature("compactdefaultargs") Customise;
		%feature("autodoc", "
Parameters
----------
WS: XSControl_WorkSession

Return
-------
None

Description
-----------
Customises a worksession, by adding to it the recorded items (by addsessionitem).
") Customise;
		virtual void Customise(opencascade::handle<XSControl_WorkSession> & WS);

		/****** XSControl_Controller::IsModeWrite ******/
		/****** md5 signature: 1fc5903958df0acc16f9019b1f3dfcbb ******/
		%feature("compactdefaultargs") IsModeWrite;
		%feature("autodoc", "
Parameters
----------
modetrans: int
shape: bool (optional, default to Standard_True)

Return
-------
bool

Description
-----------
Tells if a value of <modetrans> is a good value(within bounds) actually only for shapes.
") IsModeWrite;
		Standard_Boolean IsModeWrite(const Standard_Integer modetrans, const Standard_Boolean shape = Standard_True);

		/****** XSControl_Controller::ModeWriteBounds ******/
		/****** md5 signature: 0e59b8b854cfbc600b9e3c30645c6356 ******/
		%feature("compactdefaultargs") ModeWriteBounds;
		%feature("autodoc", "
Parameters
----------
shape: bool (optional, default to Standard_True)

Return
-------
modemin: int
modemax: int

Description
-----------
Returns recorded min and max values for modetrans (write) actually only for shapes returns true if bounds are set, false else (then, free value).
") ModeWriteBounds;
		Standard_Boolean ModeWriteBounds(Standard_Integer &OutValue, Standard_Integer &OutValue, const Standard_Boolean shape = Standard_True);

		/****** XSControl_Controller::ModeWriteHelp ******/
		/****** md5 signature: 9f2161a8defa638c39dee42674b2c3ca ******/
		%feature("compactdefaultargs") ModeWriteHelp;
		%feature("autodoc", "
Parameters
----------
modetrans: int
shape: bool (optional, default to Standard_True)

Return
-------
str

Description
-----------
Returns the help line recorded for a value of modetrans empty if help not defined or not within bounds or if values are free.
") ModeWriteHelp;
		Standard_CString ModeWriteHelp(const Standard_Integer modetrans, const Standard_Boolean shape = Standard_True);

		/****** XSControl_Controller::Name ******/
		/****** md5 signature: a614a2a031c0f6de75e5496e2bd2c8da ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "
Parameters
----------
rsc: bool (optional, default to Standard_False)

Return
-------
str

Description
-----------
Returns a name, as given when initializing: rsc = false (d): true name attached to the norm (long name) rsc = true: name of the resource set (i.e. short name).
") Name;
		Standard_CString Name(const Standard_Boolean rsc = Standard_False);

		/****** XSControl_Controller::NewModel ******/
		/****** md5 signature: 0b1be90749007fa9c3aadc3c17bc79c8 ******/
		%feature("compactdefaultargs") NewModel;
		%feature("autodoc", "Return
-------
opencascade::handle<Interface_InterfaceModel>

Description
-----------
Creates a new empty model ready to receive data of the norm used to write data from imagine to an interface file.
") NewModel;
		virtual opencascade::handle<Interface_InterfaceModel> NewModel();

		/****** XSControl_Controller::Protocol ******/
		/****** md5 signature: 1c9ddeeacf191f917e4377fcdad955ea ******/
		%feature("compactdefaultargs") Protocol;
		%feature("autodoc", "Return
-------
opencascade::handle<Interface_Protocol>

Description
-----------
Returns the protocol attached to the norm (from field).
") Protocol;
		const opencascade::handle<Interface_Protocol> & Protocol();

		/****** XSControl_Controller::RecognizeWriteShape ******/
		/****** md5 signature: bf9c781492161c75e6ecd990309067e7 ******/
		%feature("compactdefaultargs") RecognizeWriteShape;
		%feature("autodoc", "
Parameters
----------
shape: TopoDS_Shape
modetrans: int (optional, default to 0)

Return
-------
bool

Description
-----------
Tells if a shape is valid for a transfer to a model asks the actorwrite (through a shapemapper).
") RecognizeWriteShape;
		virtual Standard_Boolean RecognizeWriteShape(const TopoDS_Shape & shape, const Standard_Integer modetrans = 0);

		/****** XSControl_Controller::RecognizeWriteTransient ******/
		/****** md5 signature: ab61fb056de5fe39183b10722cfdf45f ******/
		%feature("compactdefaultargs") RecognizeWriteTransient;
		%feature("autodoc", "
Parameters
----------
obj: Standard_Transient
modetrans: int (optional, default to 0)

Return
-------
bool

Description
-----------
Tells if <obj> (an application object) is a valid candidate for a transfer to a model. by default, asks the actorwrite if known (through a transientmapper). can be redefined.
") RecognizeWriteTransient;
		virtual Standard_Boolean RecognizeWriteTransient(const opencascade::handle<Standard_Transient> & obj, const Standard_Integer modetrans = 0);

		/****** XSControl_Controller::Record ******/
		/****** md5 signature: 82213ecee20989c7125a79ae5a889d65 ******/
		%feature("compactdefaultargs") Record;
		%feature("autodoc", "
Parameters
----------
name: str

Return
-------
None

Description
-----------
Records <self> in a general dictionary under a name error if <name> already used for another one.
") Record;
		void Record(Standard_CString name);

		/****** XSControl_Controller::Recorded ******/
		/****** md5 signature: e7b0928c69a84934a61865297a1477f2 ******/
		%feature("compactdefaultargs") Recorded;
		%feature("autodoc", "
Parameters
----------
name: str

Return
-------
opencascade::handle<XSControl_Controller>

Description
-----------
Returns the controller attached to a given name returns a null handle if <name> is unknown.
") Recorded;
		static opencascade::handle<XSControl_Controller> Recorded(Standard_CString name);

		/****** XSControl_Controller::SessionItem ******/
		/****** md5 signature: 1008f7dfeac004b90b54003352227a07 ******/
		%feature("compactdefaultargs") SessionItem;
		%feature("autodoc", "
Parameters
----------
theName: str

Return
-------
opencascade::handle<Standard_Transient>

Description
-----------
Returns an item given its name to record in a session if <name> is unknown, returns a null handle.
") SessionItem;
		opencascade::handle<Standard_Transient> SessionItem(Standard_CString theName);

		/****** XSControl_Controller::SetModeWrite ******/
		/****** md5 signature: 256e35b925b3df022507f10889c59c8f ******/
		%feature("compactdefaultargs") SetModeWrite;
		%feature("autodoc", "
Parameters
----------
modemin: int
modemax: int
shape: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Sets mininum and maximum values for modetrans (write) erases formerly recorded bounds and values actually only for shape then, for each value a little help can be attached.
") SetModeWrite;
		void SetModeWrite(const Standard_Integer modemin, const Standard_Integer modemax, const Standard_Boolean shape = Standard_True);

		/****** XSControl_Controller::SetModeWriteHelp ******/
		/****** md5 signature: 7bfc54b589c5986d7309de43e74d86dd ******/
		%feature("compactdefaultargs") SetModeWriteHelp;
		%feature("autodoc", "
Parameters
----------
modetrans: int
help: str
shape: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Attaches a short line of help to a value of modetrans (write).
") SetModeWriteHelp;
		void SetModeWriteHelp(const Standard_Integer modetrans, Standard_CString help, const Standard_Boolean shape = Standard_True);

		/****** XSControl_Controller::SetNames ******/
		/****** md5 signature: ade60fb8abd6821ca807fecdfd73838f ******/
		%feature("compactdefaultargs") SetNames;
		%feature("autodoc", "
Parameters
----------
theLongName: str
theShortName: str

Return
-------
None

Description
-----------
Changes names if a name is empty, the formerly set one remains remark: does not call record or autorecord.
") SetNames;
		void SetNames(Standard_CString theLongName, Standard_CString theShortName);

		/****** XSControl_Controller::TransferWriteShape ******/
		/****** md5 signature: a1087710e2fdfd6eb93794359a254234 ******/
		%feature("compactdefaultargs") TransferWriteShape;
		%feature("autodoc", "
Parameters
----------
shape: TopoDS_Shape
FP: Transfer_FinderProcess
model: Interface_InterfaceModel
modetrans: int (optional, default to 0)
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
IFSelect_ReturnStatus

Description
-----------
Takes one shape and transfers it to an interfacemodel (already created, e.g. by newmodel) default uses actorwrite; can be redefined as necessary returned value is a status, as follows: done ok , void: no result , fail: fail (e.g. exception) error: bad conditions , bad model or null model.
") TransferWriteShape;
		virtual IFSelect_ReturnStatus TransferWriteShape(const TopoDS_Shape & shape, const opencascade::handle<Transfer_FinderProcess> & FP, const opencascade::handle<Interface_InterfaceModel> & model, const Standard_Integer modetrans = 0, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** XSControl_Controller::TransferWriteTransient ******/
		/****** md5 signature: efb5bc18dd2c257eaaab9cbc66271108 ******/
		%feature("compactdefaultargs") TransferWriteTransient;
		%feature("autodoc", "
Parameters
----------
obj: Standard_Transient
FP: Transfer_FinderProcess
model: Interface_InterfaceModel
modetrans: int (optional, default to 0)
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
IFSelect_ReturnStatus

Description
-----------
Takes one transient object and transfers it to an interfacemodel (already created, e.g. by newmodel) (result is recorded in the model by addwithrefs) fp records produced results and checks //! default uses actorwrite; can be redefined as necessary returned value is a status, as follows: 0 ok , 1 no result , 2 fail (e.g. exception raised) -1 bad conditions , -2 bad model or null model for type of object not recognized: should return 1.
") TransferWriteTransient;
		virtual IFSelect_ReturnStatus TransferWriteTransient(const opencascade::handle<Standard_Transient> & obj, const opencascade::handle<Transfer_FinderProcess> & FP, const opencascade::handle<Interface_InterfaceModel> & model, const Standard_Integer modetrans = 0, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** XSControl_Controller::WorkLibrary ******/
		/****** md5 signature: 7c195930f9d0e8c986e2cba27b8d6ee4 ******/
		%feature("compactdefaultargs") WorkLibrary;
		%feature("autodoc", "Return
-------
opencascade::handle<IFSelect_WorkLibrary>

Description
-----------
Returns the worklibrary attached to the norm. remark that it has to be in phase with the protocol (read from field).
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
		/****** XSControl_FuncShape::FileAndVar ******/
		/****** md5 signature: f1b12c6210426021728b66b3f86d7a28 ******/
		%feature("compactdefaultargs") FileAndVar;
		%feature("autodoc", "
Parameters
----------
session: XSControl_WorkSession
file: str
var: str
def: str
resfile: str
resvar: str

Return
-------
bool

Description
-----------
Analyses given file name and variable name, with a default name for variables. returns resulting file name and variable name plus status 'file to read'(true) or 'already read'(false) in the latter case, empty resfile means no file available //! if <file> is null or empty or equates '.', considers session and returned status is false else, returns resfile = file and status is true if <var> is neither null nor empty, resvar = var else, the root part of <resfile> is considered, if defined else, <def> is taken.
") FileAndVar;
		static Standard_Boolean FileAndVar(const opencascade::handle<XSControl_WorkSession> & session, Standard_CString file, Standard_CString var, Standard_CString def, TCollection_AsciiString & resfile, TCollection_AsciiString & resvar);

		/****** XSControl_FuncShape::Init ******/
		/****** md5 signature: 342fdccc4643f67c269591c4b6447108 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Return
-------
None

Description
-----------
Defines and loads all functions which work on shapes for xscontrol (as actfunc).
") Init;
		static void Init();

		/****** XSControl_FuncShape::MoreShapes ******/
		/****** md5 signature: 64cec2253a48ad178a7f54924ed07fad ******/
		%feature("compactdefaultargs") MoreShapes;
		%feature("autodoc", "
Parameters
----------
session: XSControl_WorkSession
list: TopTools_HSequenceOfShape
name: str

Return
-------
int

Description
-----------
Analyses a name as designating shapes from a vars or from xstep transfer (last transfer on reading). <name> can be: '*': all the root shapes produced by last transfer (read) i.e. considers roots of the transientprocess a name: a name of a variable draw //! returns the count of designated shapes. their list is put in <list>. if <list> is null, it is firstly created. then it is completed (append without clear) by the shapes found returns 0 if no shape could be found.
") MoreShapes;
		static Standard_Integer MoreShapes(const opencascade::handle<XSControl_WorkSession> & session, opencascade::handle<TopTools_HSequenceOfShape> & list, Standard_CString name);

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
		/****** XSControl_Functions::Init ******/
		/****** md5 signature: 342fdccc4643f67c269591c4b6447108 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Return
-------
None

Description
-----------
Defines and loads all functions for xscontrol (as actfunc).
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
		/****** XSControl_Reader::XSControl_Reader ******/
		/****** md5 signature: 45dd4ba3975813b63dc9f13fc41916a5 ******/
		%feature("compactdefaultargs") XSControl_Reader;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates a reader from scratch (creates an empty worksession) a worksession or a controller must be provided before running.
") XSControl_Reader;
		 XSControl_Reader();

		/****** XSControl_Reader::XSControl_Reader ******/
		/****** md5 signature: 1b278c24bc5ba36553315d7f34ac8b43 ******/
		%feature("compactdefaultargs") XSControl_Reader;
		%feature("autodoc", "
Parameters
----------
norm: str

Return
-------
None

Description
-----------
Creates a reader from scratch, with a norm name which identifies a controller.
") XSControl_Reader;
		 XSControl_Reader(Standard_CString norm);

		/****** XSControl_Reader::XSControl_Reader ******/
		/****** md5 signature: dde5d0249121e014a940df9f07c34b20 ******/
		%feature("compactdefaultargs") XSControl_Reader;
		%feature("autodoc", "
Parameters
----------
WS: XSControl_WorkSession
scratch: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Creates a reader from an already existing session, with a controller already set virtual destructor.
") XSControl_Reader;
		 XSControl_Reader(const opencascade::handle<XSControl_WorkSession> & WS, const Standard_Boolean scratch = Standard_True);

		/****** XSControl_Reader::ClearShapes ******/
		/****** md5 signature: 052780fae74c03e43f332caaaaf6b2cc ******/
		%feature("compactdefaultargs") ClearShapes;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clears the list of shapes that may have accumulated in calls to transferone or transferroot.c.
") ClearShapes;
		void ClearShapes();

		/****** XSControl_Reader::GetStatsTransfer ******/
		/****** md5 signature: e1d5ca4b1efe1739fc37e88022ce93fd ******/
		%feature("compactdefaultargs") GetStatsTransfer;
		%feature("autodoc", "
Parameters
----------
list: TColStd_HSequenceOfTransient

Return
-------
nbMapped: int
nbWithResult: int
nbWithFail: int

Description
-----------
Gives statistics about transfer.
") GetStatsTransfer;
		void GetStatsTransfer(const opencascade::handle<TColStd_HSequenceOfTransient> & list, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****** XSControl_Reader::GiveList ******/
		/****** md5 signature: 48cde5950be2c5c0783363940ad48d45 ******/
		%feature("compactdefaultargs") GiveList;
		%feature("autodoc", "
Parameters
----------
first: str (optional, default to "")
second: str (optional, default to "")

Return
-------
opencascade::handle<TColStd_HSequenceOfTransient>

Description
-----------
Returns a list of entities from the iges or step file according to the following rules: - if first and second are empty strings, the whole file is selected. - if first is an entity number or label, the entity referred to is selected. - if first is a list of entity numbers/labels separated by commas, the entities referred to are selected, - if first is the name of a selection in the worksession and second is not defined, the list contains the standard output for that selection. - if first is the name of a selection and second is defined, the criterion defined by second is applied to the result of the first selection. a selection is an operator which computes a list of entities from a list given in input according to its type. if no list is specified, the selection computes its list of entities from the whole model. a selection can be: - a predefined selection (xst-transferrable-mode) - a filter based on a signature a signature is an operator which returns a string from an entity according to its type. for example: - 'xst-type' (cdl) - 'iges-level' - 'step-type'. for example, if you wanted to select only the advanced_faces in a step file you would use the following code: example reader.givelist('xst-transferrable-roots','step-type(advanced_face)'); warning if the value given to second is incorrect, it will simply be ignored.
") GiveList;
		opencascade::handle<TColStd_HSequenceOfTransient> GiveList(Standard_CString first = "", Standard_CString second = "");

		/****** XSControl_Reader::GiveList ******/
		/****** md5 signature: 05fdcf13ca9e417fad4d2b6ab10b4c43 ******/
		%feature("compactdefaultargs") GiveList;
		%feature("autodoc", "
Parameters
----------
first: str
ent: Standard_Transient

Return
-------
opencascade::handle<TColStd_HSequenceOfTransient>

Description
-----------
Computes a list of entities from the model as follows <first> being a selection, <ent> being an entity or a list of entities (as a hsequenceoftransient): the standard result of this selection applied to this list if <first> is erroneous, a null handle is returned.
") GiveList;
		opencascade::handle<TColStd_HSequenceOfTransient> GiveList(Standard_CString first, const opencascade::handle<Standard_Transient> & ent);

		/****** XSControl_Reader::Model ******/
		/****** md5 signature: aa6e85fbf0fa37084c702759534fae8b ******/
		%feature("compactdefaultargs") Model;
		%feature("autodoc", "Return
-------
opencascade::handle<Interface_InterfaceModel>

Description
-----------
Returns the model. it can then be consulted (header, product).
") Model;
		opencascade::handle<Interface_InterfaceModel> Model();

		/****** XSControl_Reader::NbRootsForTransfer ******/
		/****** md5 signature: 50a9a876bd891ed944872afe5199e177 ******/
		%feature("compactdefaultargs") NbRootsForTransfer;
		%feature("autodoc", "Return
-------
int

Description
-----------
Determines the list of root entities which are candidate for a transfer to a shape, and returns the number of entities in the list.
") NbRootsForTransfer;
		virtual Standard_Integer NbRootsForTransfer();

		/****** XSControl_Reader::NbShapes ******/
		/****** md5 signature: ea90d1514db96ad18becf0e04a33abf6 ******/
		%feature("compactdefaultargs") NbShapes;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of shapes produced by translation.
") NbShapes;
		Standard_Integer NbShapes();

		/****** XSControl_Reader::OneShape ******/
		/****** md5 signature: 1fc1610db08b4eec83d275771d406ea5 ******/
		%feature("compactdefaultargs") OneShape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Returns all of the results in a single shape which is: - a null shape if there are no results, - a shape if there is one result, - a compound containing the resulting shapes if there are more than one.
") OneShape;
		TopoDS_Shape OneShape();

		/****** XSControl_Reader::PrintCheckLoad ******/
		/****** md5 signature: 39be9ee8d1dc305fcff3dc9ccaca7ff5 ******/
		%feature("compactdefaultargs") PrintCheckLoad;
		%feature("autodoc", "
Parameters
----------
failsonly: bool
mode: IFSelect_PrintCount

Return
-------
None

Description
-----------
Prints the check list attached to loaded data, on the standard trace file (starts at std::cout) all messages or fails only, according to <failsonly> mode = 0: per entity, prints messages mode = 1: per message, just gives count of entities per check mode = 2: also gives entity numbers.
") PrintCheckLoad;
		void PrintCheckLoad(const Standard_Boolean failsonly, const IFSelect_PrintCount mode);

		/****** XSControl_Reader::PrintCheckLoad ******/
		/****** md5 signature: ca487156a90b4b3b2c6320bc467c731d ******/
		%feature("compactdefaultargs") PrintCheckLoad;
		%feature("autodoc", "
Parameters
----------
failsonly: bool
mode: IFSelect_PrintCount

Return
-------
theStream: Standard_OStream

Description
-----------
Prints the check list attached to loaded data.
") PrintCheckLoad;
		void PrintCheckLoad(std::ostream &OutValue, const Standard_Boolean failsonly, const IFSelect_PrintCount mode);

		/****** XSControl_Reader::PrintCheckTransfer ******/
		/****** md5 signature: 6750f68e6aed952f2529ea394507d25f ******/
		%feature("compactdefaultargs") PrintCheckTransfer;
		%feature("autodoc", "
Parameters
----------
failsonly: bool
mode: IFSelect_PrintCount

Return
-------
None

Description
-----------
Displays check results for the last translation of iges or step entities to open cascade entities. only fail messages are displayed if failsonly is true. all messages are displayed if failsonly is false. mode determines the contents and the order of the messages according to the terms of the ifselect_printcount enumeration.
") PrintCheckTransfer;
		void PrintCheckTransfer(const Standard_Boolean failsonly, const IFSelect_PrintCount mode);

		/****** XSControl_Reader::PrintCheckTransfer ******/
		/****** md5 signature: 09d1abfff46e1d492cfc6662fd49988d ******/
		%feature("compactdefaultargs") PrintCheckTransfer;
		%feature("autodoc", "
Parameters
----------
failsonly: bool
mode: IFSelect_PrintCount

Return
-------
theStream: Standard_OStream

Description
-----------
Displays check results for the last translation of iges or step entities to open cascade entities.
") PrintCheckTransfer;
		void PrintCheckTransfer(std::ostream &OutValue, const Standard_Boolean failsonly, const IFSelect_PrintCount mode);

		/****** XSControl_Reader::PrintStatsTransfer ******/
		/****** md5 signature: 148fec90ff7b063449e9624a36399cda ******/
		%feature("compactdefaultargs") PrintStatsTransfer;
		%feature("autodoc", "
Parameters
----------
what: int
mode: int (optional, default to 0)

Return
-------
None

Description
-----------
Displays the statistics for the last translation. what defines the kind of statistics that are displayed as follows: - 0 gives general statistics (number of translated roots, number of warnings, number of fail messages), - 1 gives root results, - 2 gives statistics for all checked entities, - 3 gives the list of translated entities, - 4 gives warning and fail messages, - 5 gives fail messages only. the use of mode depends on the value of what. if what is 0, mode is ignored. if what is 1, 2 or 3, mode defines the following: - 0 lists the numbers of iges or step entities in the respective model - 1 gives the number, identifier, type and result type for each iges or step entity and/or its status (fail, warning, etc.) - 2 gives maximum information for each iges or step entity (i.e. checks) - 3 gives the number of entities per type of iges or step entity - 4 gives the number of iges or step entities per result type and/or status - 5 gives the number of pairs (iges or step or result type and status) - 6 gives the number of pairs (iges or step or result type and status) and the list of entity numbers in the iges or step model. if what is 4 or 5, mode defines the warning and fail messages as follows: - if mode is 0 all warnings and checks per entity are returned - if mode is 2 the list of entities per warning is returned. if mode is not set, only the list of all entities per warning is given.
") PrintStatsTransfer;
		void PrintStatsTransfer(const Standard_Integer what, const Standard_Integer mode = 0);

		/****** XSControl_Reader::PrintStatsTransfer ******/
		/****** md5 signature: fc32c8e9efabbaf8d728d672c3d2b5bb ******/
		%feature("compactdefaultargs") PrintStatsTransfer;
		%feature("autodoc", "
Parameters
----------
what: int
mode: int (optional, default to 0)

Return
-------
theStream: Standard_OStream

Description
-----------
Displays the statistics for the last translation.
") PrintStatsTransfer;
		void PrintStatsTransfer(std::ostream &OutValue, const Standard_Integer what, const Standard_Integer mode = 0);

		/****** XSControl_Reader::ReadFile ******/
		/****** md5 signature: 9bcb992176922214d5a97bb552525a68 ******/
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
Loads a file and returns the read status zero for a model which compies with the controller.
") ReadFile;
		virtual IFSelect_ReturnStatus ReadFile(Standard_CString filename);

		/****** XSControl_Reader::ReadStream ******/
		/****** md5 signature: aed7209903d9aa23c26d3f25b7956d06 ******/
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
Loads a file from stream and returns the read status.
") ReadStream;
		virtual IFSelect_ReturnStatus ReadStream(Standard_CString theName, std::istream & theIStream);

		/****** XSControl_Reader::RootForTransfer ******/
		/****** md5 signature: c2a76b8d96e252b5e6c8127f08dd357b ******/
		%feature("compactdefaultargs") RootForTransfer;
		%feature("autodoc", "
Parameters
----------
num: int (optional, default to 1)

Return
-------
opencascade::handle<Standard_Transient>

Description
-----------
Returns an iges or step root entity for translation. the entity is identified by its rank in a list.
") RootForTransfer;
		opencascade::handle<Standard_Transient> RootForTransfer(const Standard_Integer num = 1);

		/****** XSControl_Reader::SetNorm ******/
		/****** md5 signature: b11f28b0f865ad413b98701b134b89de ******/
		%feature("compactdefaultargs") SetNorm;
		%feature("autodoc", "
Parameters
----------
norm: str

Return
-------
bool

Description
-----------
Sets a specific norm to <self> returns true if done, false if <norm> is not available.
") SetNorm;
		Standard_Boolean SetNorm(Standard_CString norm);

		/****** XSControl_Reader::SetWS ******/
		/****** md5 signature: 74ebce3f94d695bdeb4915fb004d07d2 ******/
		%feature("compactdefaultargs") SetWS;
		%feature("autodoc", "
Parameters
----------
WS: XSControl_WorkSession
scratch: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Sets a specific session to <self>.
") SetWS;
		void SetWS(const opencascade::handle<XSControl_WorkSession> & WS, const Standard_Boolean scratch = Standard_True);

		/****** XSControl_Reader::Shape ******/
		/****** md5 signature: b325565d748ea0ef38fee9bdb447c4a9 ******/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "
Parameters
----------
num: int (optional, default to 1)

Return
-------
TopoDS_Shape

Description
-----------
Returns the shape resulting from a translation and identified by the rank num. num equals 1 by default. in other words, the first shape resulting from the translation is returned.
") Shape;
		TopoDS_Shape Shape(const Standard_Integer num = 1);

		/****** XSControl_Reader::TransferEntity ******/
		/****** md5 signature: a61761ec2b4371c1cd95b155e879a9f5 ******/
		%feature("compactdefaultargs") TransferEntity;
		%feature("autodoc", "
Parameters
----------
start: Standard_Transient
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
bool

Description
-----------
Translates an iges or step entity in the model. true is returned if a shape is produced; otherwise, false is returned.
") TransferEntity;
		Standard_Boolean TransferEntity(const opencascade::handle<Standard_Transient> & start, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** XSControl_Reader::TransferList ******/
		/****** md5 signature: 2fe30c43488fd370e3a2ea9d29eb8e19 ******/
		%feature("compactdefaultargs") TransferList;
		%feature("autodoc", "
Parameters
----------
list: TColStd_HSequenceOfTransient
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
int

Description
-----------
Translates a list of entities. returns the number of iges or step entities that were successfully translated. the list can be produced with givelist. warning - this function does not clear the existing output shapes.
") TransferList;
		Standard_Integer TransferList(const opencascade::handle<TColStd_HSequenceOfTransient> & list, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** XSControl_Reader::TransferOne ******/
		/****** md5 signature: 5ca21e727f2cec59153b212824d1b2a4 ******/
		%feature("compactdefaultargs") TransferOne;
		%feature("autodoc", "
Parameters
----------
num: int
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
bool

Description
-----------
Translates an iges or step entity identified by the rank num in the model. false is returned if no shape is produced.
") TransferOne;
		Standard_Boolean TransferOne(const Standard_Integer num, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** XSControl_Reader::TransferOneRoot ******/
		/****** md5 signature: 0762ab3715286d6c83ea56f2614a4210 ******/
		%feature("compactdefaultargs") TransferOneRoot;
		%feature("autodoc", "
Parameters
----------
num: int (optional, default to 1)
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
bool

Description
-----------
Translates a root identified by the rank num in the model. false is returned if no shape is produced.
") TransferOneRoot;
		Standard_Boolean TransferOneRoot(const Standard_Integer num = 1, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** XSControl_Reader::TransferRoots ******/
		/****** md5 signature: 83eb98e38114ddbe608d9e72e46ea3a0 ******/
		%feature("compactdefaultargs") TransferRoots;
		%feature("autodoc", "
Parameters
----------
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
int

Description
-----------
Translates all translatable roots and returns the number of successful translations. warning - this function clears existing output shapes first.
") TransferRoots;
		Standard_Integer TransferRoots(const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** XSControl_Reader::WS ******/
		/****** md5 signature: 4d866376b023ba3185e62899810cc121 ******/
		%feature("compactdefaultargs") WS;
		%feature("autodoc", "Return
-------
opencascade::handle<XSControl_WorkSession>

Description
-----------
Returns the session used in <self>.
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
		/****** XSControl_SelectForTransfer::XSControl_SelectForTransfer ******/
		/****** md5 signature: 94bb02ca0d68fe3c12bdba8f7591a712 ******/
		%feature("compactdefaultargs") XSControl_SelectForTransfer;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates a selectfortransfer, non initialised it sorts nothing, unless an actor has been defined.
") XSControl_SelectForTransfer;
		 XSControl_SelectForTransfer();

		/****** XSControl_SelectForTransfer::XSControl_SelectForTransfer ******/
		/****** md5 signature: cd9bd21926a91eb04a25aa4cb2ded3e7 ******/
		%feature("compactdefaultargs") XSControl_SelectForTransfer;
		%feature("autodoc", "
Parameters
----------
TR: XSControl_TransferReader

Return
-------
None

Description
-----------
Creates a selectfortransfer, which will work with the currently defined actor brought by the transferreader.
") XSControl_SelectForTransfer;
		 XSControl_SelectForTransfer(const opencascade::handle<XSControl_TransferReader> & TR);

		/****** XSControl_SelectForTransfer::Actor ******/
		/****** md5 signature: 8f4509007d618de2f7e91d2fcd2d8b63 ******/
		%feature("compactdefaultargs") Actor;
		%feature("autodoc", "Return
-------
opencascade::handle<Transfer_ActorOfTransientProcess>

Description
-----------
Returns the actor used as precised one. returns a null handle for a creation from a transferreader without any further setting.
") Actor;
		opencascade::handle<Transfer_ActorOfTransientProcess> Actor();

		/****** XSControl_SelectForTransfer::ExtractLabel ******/
		/****** md5 signature: 04da44ccc1aaa5db6b559360d74d3853 ******/
		%feature("compactdefaultargs") ExtractLabel;
		%feature("autodoc", "Return
-------
TCollection_AsciiString

Description
-----------
Returns a text defining the criterium: 'recognized for transfer [(current actor)]'.
") ExtractLabel;
		TCollection_AsciiString ExtractLabel();

		/****** XSControl_SelectForTransfer::Reader ******/
		/****** md5 signature: 4e894517ca5ef1dfbe9a5687ba29d3f0 ******/
		%feature("compactdefaultargs") Reader;
		%feature("autodoc", "Return
-------
opencascade::handle<XSControl_TransferReader>

Description
-----------
Returns the reader (if created with a reader) returns a null handle if not created with a reader.
") Reader;
		opencascade::handle<XSControl_TransferReader> Reader();

		/****** XSControl_SelectForTransfer::SetActor ******/
		/****** md5 signature: f10fc7a63233219bda39f0927a4aaf5c ******/
		%feature("compactdefaultargs") SetActor;
		%feature("autodoc", "
Parameters
----------
act: Transfer_ActorOfTransientProcess

Return
-------
None

Description
-----------
Sets a precise actor to sort entities this definition oversedes the creation with a transferreader.
") SetActor;
		void SetActor(const opencascade::handle<Transfer_ActorOfTransientProcess> & act);

		/****** XSControl_SelectForTransfer::SetReader ******/
		/****** md5 signature: 97288373292d85c6f0a8b22d0b4f4266 ******/
		%feature("compactdefaultargs") SetReader;
		%feature("autodoc", "
Parameters
----------
TR: XSControl_TransferReader

Return
-------
None

Description
-----------
Sets a transferreader to sort entities: it brings the actor, which may change, while the transferreader does not.
") SetReader;
		void SetReader(const opencascade::handle<XSControl_TransferReader> & TR);

		/****** XSControl_SelectForTransfer::Sort ******/
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
Returns true for an entity which is recognized by the actor, either the precised one, or the one defined by transferreader.
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
		/****** XSControl_SignTransferStatus::XSControl_SignTransferStatus ******/
		/****** md5 signature: 08de7c992164eeaf29032b02e1c8603e ******/
		%feature("compactdefaultargs") XSControl_SignTransferStatus;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates a signtransferstatus, not initialised it gives nothing (empty string).
") XSControl_SignTransferStatus;
		 XSControl_SignTransferStatus();

		/****** XSControl_SignTransferStatus::XSControl_SignTransferStatus ******/
		/****** md5 signature: ea4543a01ba71faa278c43f4f5f27659 ******/
		%feature("compactdefaultargs") XSControl_SignTransferStatus;
		%feature("autodoc", "
Parameters
----------
TR: XSControl_TransferReader

Return
-------
None

Description
-----------
Creates a signtransferstatus, which will work on the current transientprocess brought by the transferreader (its mapreader).
") XSControl_SignTransferStatus;
		 XSControl_SignTransferStatus(const opencascade::handle<XSControl_TransferReader> & TR);

		/****** XSControl_SignTransferStatus::Map ******/
		/****** md5 signature: 25f31457d784fa027f6e290942badcce ******/
		%feature("compactdefaultargs") Map;
		%feature("autodoc", "Return
-------
opencascade::handle<Transfer_TransientProcess>

Description
-----------
Returns the transientprocess used as precised one returns a null handle for a creation from a transferreader without any further setting.
") Map;
		opencascade::handle<Transfer_TransientProcess> Map();

		/****** XSControl_SignTransferStatus::Reader ******/
		/****** md5 signature: 4e894517ca5ef1dfbe9a5687ba29d3f0 ******/
		%feature("compactdefaultargs") Reader;
		%feature("autodoc", "Return
-------
opencascade::handle<XSControl_TransferReader>

Description
-----------
Returns the reader (if created with a reader) returns a null handle if not created with a reader.
") Reader;
		opencascade::handle<XSControl_TransferReader> Reader();

		/****** XSControl_SignTransferStatus::SetMap ******/
		/****** md5 signature: ff2b0f264d62fa82925ef516aebb1b44 ******/
		%feature("compactdefaultargs") SetMap;
		%feature("autodoc", "
Parameters
----------
TP: Transfer_TransientProcess

Return
-------
None

Description
-----------
Sets a precise map to sign entities this definition oversedes the creation with a transferreader.
") SetMap;
		void SetMap(const opencascade::handle<Transfer_TransientProcess> & TP);

		/****** XSControl_SignTransferStatus::SetReader ******/
		/****** md5 signature: 97288373292d85c6f0a8b22d0b4f4266 ******/
		%feature("compactdefaultargs") SetReader;
		%feature("autodoc", "
Parameters
----------
TR: XSControl_TransferReader

Return
-------
None

Description
-----------
Sets a transferreader to work.
") SetReader;
		void SetReader(const opencascade::handle<XSControl_TransferReader> & TR);

		/****** XSControl_SignTransferStatus::Value ******/
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
Returns the signature for a transient object, as its transfer status.
") Value;
		Standard_CString Value(const opencascade::handle<Standard_Transient> & ent, const opencascade::handle<Interface_InterfaceModel> & model);

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
		/****** XSControl_TransferReader::XSControl_TransferReader ******/
		/****** md5 signature: d196629f0cfdf876d23cc62e81a13197 ******/
		%feature("compactdefaultargs") XSControl_TransferReader;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates a transferreader, empty.
") XSControl_TransferReader;
		 XSControl_TransferReader();

		/****** XSControl_TransferReader::Actor ******/
		/****** md5 signature: ee42cfbcd1be909d7e99c609d926a134 ******/
		%feature("compactdefaultargs") Actor;
		%feature("autodoc", "Return
-------
opencascade::handle<Transfer_ActorOfTransientProcess>

Description
-----------
Returns the actor, determined by the controller, or if this one is unknown, directly set. once it has been defined, it can then be edited.
") Actor;
		opencascade::handle<Transfer_ActorOfTransientProcess> Actor();

		/****** XSControl_TransferReader::BeginTransfer ******/
		/****** md5 signature: 45b9be9b944a95886bf096a49eb0bf8e ******/
		%feature("compactdefaultargs") BeginTransfer;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Defines a new transferprocess for reading transfer returns true if done, false if data are not properly defined (the model, the actor for read).
") BeginTransfer;
		Standard_Boolean BeginTransfer();

		/****** XSControl_TransferReader::CheckList ******/
		/****** md5 signature: c2f87976868957726696fd3856e505ef ******/
		%feature("compactdefaultargs") CheckList;
		%feature("autodoc", "
Parameters
----------
theEnt: Standard_Transient
theLevel: int (optional, default to 0)

Return
-------
Interface_CheckIterator

Description
-----------
Returns the checklist resulting from transferring <ent>, i.e. stored in its recorded form resultfrommodel (empty if transfer successful or not recorded ...) //! if <ent> is the model, returns the complete cumulated check-list, <level> is ignored //! if <ent> is an entity of the model, <level> applies as follows <level>: -1 for <ent> only, last transfer (transientprocess) <level>: 0 for <ent> only (d) 1 for <ent> and its immediate subtransfers, if any 2 for <ent> and subtransferts at all levels.
") CheckList;
		Interface_CheckIterator CheckList(const opencascade::handle<Standard_Transient> & theEnt, const Standard_Integer theLevel = 0);

		/****** XSControl_TransferReader::CheckedList ******/
		/****** md5 signature: 8cccffcb6267b484c298f8f27148f0ea ******/
		%feature("compactdefaultargs") CheckedList;
		%feature("autodoc", "
Parameters
----------
theEnt: Standard_Transient
WithCheck: Interface_CheckStatus (optional, default to Interface_CheckAny)
theResult: bool (optional, default to Standard_True)

Return
-------
opencascade::handle<TColStd_HSequenceOfTransient>

Description
-----------
Returns the list of starting entities to which a given check status is attached, in final results <ent> can be an entity, or the model to query all entities below, 'entities' are, either <ent> plus its sub-transferred, or all the entities of the model //! <check> = -2 , all entities whatever the check (see result) <check> = -1 , entities with no fail (warning allowed) <check> = 0 , entities with no check at all <check> = 1 , entities with warning but no fail <check> = 2 , entities with fail <result>: if true, only entities with an attached result remark: result true and check=0 will give an empty list.
") CheckedList;
		opencascade::handle<TColStd_HSequenceOfTransient> CheckedList(const opencascade::handle<Standard_Transient> & theEnt, const Interface_CheckStatus WithCheck = Interface_CheckAny, const Standard_Boolean theResult = Standard_True);

		/****** XSControl_TransferReader::Clear ******/
		/****** md5 signature: 0fc5de3e361f7d75f07cbd42429ea39e ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "
Parameters
----------
theMode: int

Return
-------
None

Description
-----------
Clears data, according mode: -1 all 0 nothing done +1 final results +2 working data (model, context, transfer process).
") Clear;
		void Clear(const Standard_Integer theMode);

		/****** XSControl_TransferReader::ClearResult ******/
		/****** md5 signature: 5bdf0f703cced31251a00d2b3bc9afa8 ******/
		%feature("compactdefaultargs") ClearResult;
		%feature("autodoc", "
Parameters
----------
theEnt: Standard_Transient
theMode: int

Return
-------
bool

Description
-----------
Clears recorded result for an entity, according mode <mode> = -1: true, complete, clearing (erasing result) <mode> >= 0: simple 'stripping', see resultfrommodel, in particular, 0 for simple internal strip, 10 for all but final result, 11 for all: just label, status and filename are kept returns true when done, false if nothing was to clear.
") ClearResult;
		Standard_Boolean ClearResult(const opencascade::handle<Standard_Transient> & theEnt, const Standard_Integer theMode);

		/****** XSControl_TransferReader::Context ******/
		/****** md5 signature: 2192f10621cbd30af6762c51d01c4896 ******/
		%feature("compactdefaultargs") Context;
		%feature("autodoc", "Return
-------
NCollection_DataMap<TCollection_AsciiString, opencascade::handle<Standard_Transient>>

Description
-----------
Returns (modifiable) the whole definition of context rather for internal use (ex.: preparing and setting in once).
") Context;
		NCollection_DataMap<TCollection_AsciiString, opencascade::handle<Standard_Transient>> & Context();

		/****** XSControl_TransferReader::EntitiesFromShapeList ******/
		/****** md5 signature: 83388d3268ac9efa80b65d6114cc0656 ******/
		%feature("compactdefaultargs") EntitiesFromShapeList;
		%feature("autodoc", "
Parameters
----------
theRes: TopTools_HSequenceOfShape
theMode: int (optional, default to 0)

Return
-------
opencascade::handle<TColStd_HSequenceOfTransient>

Description
-----------
Returns the list of entities from which some shapes were produced: it corresponds to a loop on entityfromshaperesult, but is optimised.
") EntitiesFromShapeList;
		opencascade::handle<TColStd_HSequenceOfTransient> EntitiesFromShapeList(const opencascade::handle<TopTools_HSequenceOfShape> & theRes, const Standard_Integer theMode = 0);

		/****** XSControl_TransferReader::EntityFromResult ******/
		/****** md5 signature: 9966cc6cce3e3ddf217e30b42b64e541 ******/
		%feature("compactdefaultargs") EntityFromResult;
		%feature("autodoc", "
Parameters
----------
theRes: Standard_Transient
theMode: int (optional, default to 0)

Return
-------
opencascade::handle<Standard_Transient>

Description
-----------
Returns an entity from which a given result was produced. if <mode> = 0 (d), searches in last root transfers if <mode> = 1, searches in last (root & sub) transfers if <mode> = 2, searches in root recorded results if <mode> = 3, searches in all (root & sub) recordeds <res> can be, either a transient object (result itself) or a binder. for a binder of shape, calls entityfromshaperesult returns a null handle if <res> not recorded.
") EntityFromResult;
		opencascade::handle<Standard_Transient> EntityFromResult(const opencascade::handle<Standard_Transient> & theRes, const Standard_Integer theMode = 0);

		/****** XSControl_TransferReader::EntityFromShapeResult ******/
		/****** md5 signature: f74655131aba069e790b407d9b4e5bd2 ******/
		%feature("compactdefaultargs") EntityFromShapeResult;
		%feature("autodoc", "
Parameters
----------
theRes: TopoDS_Shape
theMode: int (optional, default to 0)

Return
-------
opencascade::handle<Standard_Transient>

Description
-----------
Returns an entity from which a given shape result was produced returns a null handle if <res> not recorded or not a shape.
") EntityFromShapeResult;
		opencascade::handle<Standard_Transient> EntityFromShapeResult(const TopoDS_Shape & theRes, const Standard_Integer theMode = 0);

		/****** XSControl_TransferReader::FileName ******/
		/****** md5 signature: d874246a35353c4bd05788da23930d39 ******/
		%feature("compactdefaultargs") FileName;
		%feature("autodoc", "Return
-------
str

Description
-----------
Returns actual value of file name.
") FileName;
		Standard_CString FileName();

		/****** XSControl_TransferReader::FinalEntityLabel ******/
		/****** md5 signature: b69bb15f15e6f82ae664a88db6ee06ce ******/
		%feature("compactdefaultargs") FinalEntityLabel;
		%feature("autodoc", "
Parameters
----------
theEnt: Standard_Transient

Return
-------
str

Description
-----------
Returns the label attached to an entity recorded for final, or an empty string if not recorded.
") FinalEntityLabel;
		Standard_CString FinalEntityLabel(const opencascade::handle<Standard_Transient> & theEnt);

		/****** XSControl_TransferReader::FinalEntityNumber ******/
		/****** md5 signature: 3e2d0fafc06899f9afe7055b8cad793b ******/
		%feature("compactdefaultargs") FinalEntityNumber;
		%feature("autodoc", "
Parameters
----------
theEnt: Standard_Transient

Return
-------
int

Description
-----------
Returns the number attached to the entity recorded for final, or zero if not recorded (looks in the resultfrommodel).
") FinalEntityNumber;
		Standard_Integer FinalEntityNumber(const opencascade::handle<Standard_Transient> & theEnt);

		/****** XSControl_TransferReader::FinalResult ******/
		/****** md5 signature: 429e43bd87413e71202b551aefc70959 ******/
		%feature("compactdefaultargs") FinalResult;
		%feature("autodoc", "
Parameters
----------
theEnt: Standard_Transient

Return
-------
opencascade::handle<Transfer_ResultFromModel>

Description
-----------
Returns the final result recorded for an entity, as such.
") FinalResult;
		opencascade::handle<Transfer_ResultFromModel> FinalResult(const opencascade::handle<Standard_Transient> & theEnt);

		/****** XSControl_TransferReader::GetContext ******/
		/****** md5 signature: a928652c8c5ed3faff31178baa4553a3 ******/
		%feature("compactdefaultargs") GetContext;
		%feature("autodoc", "
Parameters
----------
theName: str
theType: Standard_Type
theCtx: Standard_Transient

Return
-------
bool

Description
-----------
Returns the context attached to a name, if set and if it is kind of the type, else a null handle returns true if ok, false if no context.
") GetContext;
		Standard_Boolean GetContext(Standard_CString theName, const opencascade::handle<Standard_Type> & theType, opencascade::handle<Standard_Transient> & theCtx);

		/****** XSControl_TransferReader::HasChecks ******/
		/****** md5 signature: 2b7042065eb7437ca9470c6f68798861 ******/
		%feature("compactdefaultargs") HasChecks;
		%feature("autodoc", "
Parameters
----------
theEnt: Standard_Transient
FailsOnly: bool

Return
-------
bool

Description
-----------
Returns true if an entity (with a final result) has checks: - failsonly = false: any kind of check message - failsonly = true: fails only returns false if <ent> is not recorded.
") HasChecks;
		Standard_Boolean HasChecks(const opencascade::handle<Standard_Transient> & theEnt, const Standard_Boolean FailsOnly);

		/****** XSControl_TransferReader::HasResult ******/
		/****** md5 signature: 5bc4f7165e8bf32577d609094faf715c ******/
		%feature("compactdefaultargs") HasResult;
		%feature("autodoc", "
Parameters
----------
theEnt: Standard_Transient

Return
-------
bool

Description
-----------
Returns true if a final result is recorded and brings an effective result (else, it brings only fail messages).
") HasResult;
		Standard_Boolean HasResult(const opencascade::handle<Standard_Transient> & theEnt);

		/****** XSControl_TransferReader::IsMarked ******/
		/****** md5 signature: d2c3793dc072a96ae5faba49254c6399 ******/
		%feature("compactdefaultargs") IsMarked;
		%feature("autodoc", "
Parameters
----------
theEnt: Standard_Transient

Return
-------
bool

Description
-----------
Returns true if an entity has been asked for transfert, hence it is marked, as: recorded (a computation has ran, with or without an effective result), or skipped (case ignored).
") IsMarked;
		Standard_Boolean IsMarked(const opencascade::handle<Standard_Transient> & theEnt);

		/****** XSControl_TransferReader::IsRecorded ******/
		/****** md5 signature: 7c44b4b03d05b9dce1047d6fe502f0e0 ******/
		%feature("compactdefaultargs") IsRecorded;
		%feature("autodoc", "
Parameters
----------
theEnt: Standard_Transient

Return
-------
bool

Description
-----------
Returns true if a final result is recorded for an entity remark that it can bring no effective result if transfer has completely failed (finalresult brings only fail messages ...).
") IsRecorded;
		Standard_Boolean IsRecorded(const opencascade::handle<Standard_Transient> & theEnt);

		/****** XSControl_TransferReader::IsSkipped ******/
		/****** md5 signature: e7c03cee7d8670b6be35b9d94b861cec ******/
		%feature("compactdefaultargs") IsSkipped;
		%feature("autodoc", "
Parameters
----------
theEnt: Standard_Transient

Return
-------
bool

Description
-----------
Returns true if an entity is noted as skipped.
") IsSkipped;
		Standard_Boolean IsSkipped(const opencascade::handle<Standard_Transient> & theEnt);

		/****** XSControl_TransferReader::LastCheckList ******/
		/****** md5 signature: 98db2d023bd132f620c4e024a6c65c5a ******/
		%feature("compactdefaultargs") LastCheckList;
		%feature("autodoc", "Return
-------
Interface_CheckIterator

Description
-----------
Returns the checklist resulting from last transferread i.e. from transientprocess itself, recorded from last clear.
") LastCheckList;
		Interface_CheckIterator LastCheckList();

		/****** XSControl_TransferReader::LastTransferList ******/
		/****** md5 signature: 255bd5a89b5da47c530b324fdd155480 ******/
		%feature("compactdefaultargs") LastTransferList;
		%feature("autodoc", "
Parameters
----------
theRoots: bool

Return
-------
opencascade::handle<TColStd_HSequenceOfTransient>

Description
-----------
Returns the list of entities recorded as lastly transferred i.e. from transientprocess itself, recorded from last clear if <roots> is true , considers only roots of transfer if <roots> is false, considers all entities bound with result.
") LastTransferList;
		opencascade::handle<TColStd_HSequenceOfTransient> LastTransferList(const Standard_Boolean theRoots);

		/****** XSControl_TransferReader::Model ******/
		/****** md5 signature: e485d2c2a2cfa9af3cc655f00e076be4 ******/
		%feature("compactdefaultargs") Model;
		%feature("autodoc", "Return
-------
opencascade::handle<Interface_InterfaceModel>

Description
-----------
Returns the currently set interfacemodel.
") Model;
		const opencascade::handle<Interface_InterfaceModel> & Model();

		/****** XSControl_TransferReader::PrintStats ******/
		/****** md5 signature: 1c7ce9a7eeef2971ad247597c52d38d8 ******/
		%feature("compactdefaultargs") PrintStats;
		%feature("autodoc", "
Parameters
----------
theWhat: int
theMode: int (optional, default to 0)

Return
-------
theStream: Standard_OStream

Description
-----------
Prints statistics on current trace file, according <what> and <mode>. see printstatsprocess for details.
") PrintStats;
		void PrintStats(std::ostream &OutValue, const Standard_Integer theWhat, const Standard_Integer theMode = 0);

		/****** XSControl_TransferReader::PrintStatsOnList ******/
		/****** md5 signature: 163b44563c2a8ec32944ebf6b8b54c19 ******/
		%feature("compactdefaultargs") PrintStatsOnList;
		%feature("autodoc", "
Parameters
----------
theTP: Transfer_TransientProcess
theList: TColStd_HSequenceOfTransient
theWhat: int
theMode: int (optional, default to 0)

Return
-------
None

Description
-----------
Works as printstatsprocess, but displays data only on the entities which are in <list> (filter).
") PrintStatsOnList;
		static void PrintStatsOnList(const opencascade::handle<Transfer_TransientProcess> & theTP, const opencascade::handle<TColStd_HSequenceOfTransient> & theList, const Standard_Integer theWhat, const Standard_Integer theMode = 0);

		/****** XSControl_TransferReader::PrintStatsProcess ******/
		/****** md5 signature: 98ccee84665b07d53fee857c3620f46c ******/
		%feature("compactdefaultargs") PrintStatsProcess;
		%feature("autodoc", "
Parameters
----------
theTP: Transfer_TransientProcess
theWhat: int
theMode: int (optional, default to 0)

Return
-------
None

Description
-----------
This routines prints statistics about a transientprocess it can be called, by a transferreader, or isolately prints are done on the default trace file <what> defines what kind of statistics are to be printed: 0: basic figures 1: root results 2: all recorded (roots, intermediate, checked entities) 3: abnormal records 4: check messages (warnings and fails) 5: fail messages //! <mode> is used according <what>: <what> = 0: <mode> is ignored <what> = 1,2,3: <mode> as follows: 0 (d): just lists numbers of concerned entities in the model 1: for each entity, gives number,label, type and result type and/or status (fail/warning...) 2: for each entity, gives maximal information (i.e. checks) 3: counts per type of starting entity (class type) 4: counts per result type and/or status 5: counts per couple (starting type / result type/status) 6: idem plus gives for each item, the list of numbers of entities in the starting model //! <what> = 4,5: modes relays on an enum printcount: 0 (d): itemsbyentity (sequential list by entity) 1: countbyitem 2: shortbyitem (count + 5 first numbers) 3: listbyitem (count + entity numbers) 4: entitiesbyitem (count + entity numbers and labels).
") PrintStatsProcess;
		static void PrintStatsProcess(const opencascade::handle<Transfer_TransientProcess> & theTP, const Standard_Integer theWhat, const Standard_Integer theMode = 0);

		/****** XSControl_TransferReader::Recognize ******/
		/****** md5 signature: 7ac38a536d6a830144755800fed05505 ******/
		%feature("compactdefaultargs") Recognize;
		%feature("autodoc", "
Parameters
----------
theEnt: Standard_Transient

Return
-------
bool

Description
-----------
Tells if an entity is recognized as a valid candidate for transfer. calls method recognize from the actor (if known).
") Recognize;
		Standard_Boolean Recognize(const opencascade::handle<Standard_Transient> & theEnt);

		/****** XSControl_TransferReader::RecordResult ******/
		/****** md5 signature: 140a5463891e1077f92ad1fff05143af ******/
		%feature("compactdefaultargs") RecordResult;
		%feature("autodoc", "
Parameters
----------
theEnt: Standard_Transient

Return
-------
bool

Description
-----------
Records a final result of transferring an entity this result is recorded as a resultfrommodel, taken from the transientprocess returns true if a result is available, false else.
") RecordResult;
		Standard_Boolean RecordResult(const opencascade::handle<Standard_Transient> & theEnt);

		/****** XSControl_TransferReader::RecordedList ******/
		/****** md5 signature: 69df4ce6aa6ddf3e857c86735c558f1d ******/
		%feature("compactdefaultargs") RecordedList;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HSequenceOfTransient>

Description
-----------
Returns the list of entities to which a final result is attached (i.e. processed by recordresult).
") RecordedList;
		opencascade::handle<TColStd_HSequenceOfTransient> RecordedList();

		/****** XSControl_TransferReader::ResultFromNumber ******/
		/****** md5 signature: 485bb01fc509d5a2647c8297465ceea1 ******/
		%feature("compactdefaultargs") ResultFromNumber;
		%feature("autodoc", "
Parameters
----------
theNum: int

Return
-------
opencascade::handle<Transfer_ResultFromModel>

Description
-----------
Returns the final result recorded for a number of entity (internal use). null if out of range.
") ResultFromNumber;
		opencascade::handle<Transfer_ResultFromModel> ResultFromNumber(const Standard_Integer theNum);

		/****** XSControl_TransferReader::SetActor ******/
		/****** md5 signature: 7f2c954ef588b667224b188bc0e97ec3 ******/
		%feature("compactdefaultargs") SetActor;
		%feature("autodoc", "
Parameters
----------
theActor: Transfer_ActorOfTransientProcess

Return
-------
None

Description
-----------
Sets the actor directly: this value will be used if the controller is not set.
") SetActor;
		void SetActor(const opencascade::handle<Transfer_ActorOfTransientProcess> & theActor);

		/****** XSControl_TransferReader::SetContext ******/
		/****** md5 signature: 160b84a68713fc880aa1b5e0cdd0f277 ******/
		%feature("compactdefaultargs") SetContext;
		%feature("autodoc", "
Parameters
----------
theName: str
theCtx: Standard_Transient

Return
-------
None

Description
-----------
Sets a context: according to receiving appli, to be interpreted by the actor.
") SetContext;
		void SetContext(Standard_CString theName, const opencascade::handle<Standard_Transient> & theCtx);

		/****** XSControl_TransferReader::SetController ******/
		/****** md5 signature: 288d2810c031f13ea60c18de24c3c86c ******/
		%feature("compactdefaultargs") SetController;
		%feature("autodoc", "
Parameters
----------
theControl: XSControl_Controller

Return
-------
None

Description
-----------
Sets a controller. it is required to generate the actor. elsewhere, the actor must be provided directly.
") SetController;
		void SetController(const opencascade::handle<XSControl_Controller> & theControl);

		/****** XSControl_TransferReader::SetFileName ******/
		/****** md5 signature: 3469ac92815ae32c739c6c0d2abc2842 ******/
		%feature("compactdefaultargs") SetFileName;
		%feature("autodoc", "
Parameters
----------
theName: str

Return
-------
None

Description
-----------
Sets a new value for (loaded) file name.
") SetFileName;
		void SetFileName(Standard_CString theName);

		/****** XSControl_TransferReader::SetGraph ******/
		/****** md5 signature: 003fda4710fad22243642415793d506b ******/
		%feature("compactdefaultargs") SetGraph;
		%feature("autodoc", "
Parameters
----------
theGraph: Interface_HGraph

Return
-------
None

Description
-----------
Sets a graph and its interfacemodel (calls setmodel).
") SetGraph;
		void SetGraph(const opencascade::handle<Interface_HGraph> & theGraph);

		/****** XSControl_TransferReader::SetModel ******/
		/****** md5 signature: 461c1771a4e752c1a120a7e3b022e295 ******/
		%feature("compactdefaultargs") SetModel;
		%feature("autodoc", "
Parameters
----------
theModel: Interface_InterfaceModel

Return
-------
None

Description
-----------
Sets an interfacemodel. this causes former results, computed from another one, to be lost (see also clear).
") SetModel;
		void SetModel(const opencascade::handle<Interface_InterfaceModel> & theModel);

		/****** XSControl_TransferReader::SetTransientProcess ******/
		/****** md5 signature: 2cc0cdd00351c807259030ffb1a5b972 ******/
		%feature("compactdefaultargs") SetTransientProcess;
		%feature("autodoc", "
Parameters
----------
theTP: Transfer_TransientProcess

Return
-------
None

Description
-----------
Forces the transientprocess remark: it also changes the model and the actor, from those recorded in the new transientprocess.
") SetTransientProcess;
		void SetTransientProcess(const opencascade::handle<Transfer_TransientProcess> & theTP);

		/****** XSControl_TransferReader::ShapeResult ******/
		/****** md5 signature: 559d03b1571f452e583e45d5c994435c ******/
		%feature("compactdefaultargs") ShapeResult;
		%feature("autodoc", "
Parameters
----------
theEnt: Standard_Transient

Return
-------
TopoDS_Shape

Description
-----------
Returns the resulting object as a shape null shape if no result or result not a shape.
") ShapeResult;
		TopoDS_Shape ShapeResult(const opencascade::handle<Standard_Transient> & theEnt);

		/****** XSControl_TransferReader::ShapeResultList ******/
		/****** md5 signature: 34a9b701885a19df4e47fd5e4d658dfc ******/
		%feature("compactdefaultargs") ShapeResultList;
		%feature("autodoc", "
Parameters
----------
theRec: bool

Return
-------
opencascade::handle<TopTools_HSequenceOfShape>

Description
-----------
Returns a list of result shapes if <rec> is true , sees recordedlist if <rec> is false, sees lasttransferlist (last root transfers) for each one, if it is a shape, it is cumulated to the list if no shape is found, returns an empty sequence.
") ShapeResultList;
		const opencascade::handle<TopTools_HSequenceOfShape> & ShapeResultList(const Standard_Boolean theRec);

		/****** XSControl_TransferReader::Skip ******/
		/****** md5 signature: 46a7fdece4afcb0fa8c73e8c509ef729 ******/
		%feature("compactdefaultargs") Skip;
		%feature("autodoc", "
Parameters
----------
theEnt: Standard_Transient

Return
-------
bool

Description
-----------
Note that an entity has been required for transfer but no result at all is available (typically: case not implemented) it is not an error, but it gives a specific status: skipped returns true if done, false if <ent> is not in starting model.
") Skip;
		Standard_Boolean Skip(const opencascade::handle<Standard_Transient> & theEnt);

		/****** XSControl_TransferReader::TransferClear ******/
		/****** md5 signature: 0ff526a57b66ac0a91f4eec27ac49bfa ******/
		%feature("compactdefaultargs") TransferClear;
		%feature("autodoc", "
Parameters
----------
theEnt: Standard_Transient
theLevel: int (optional, default to 0)

Return
-------
None

Description
-----------
Clears the results attached to an entity if <ents> equates the starting model, clears all results.
") TransferClear;
		void TransferClear(const opencascade::handle<Standard_Transient> & theEnt, const Standard_Integer theLevel = 0);

		/****** XSControl_TransferReader::TransferList ******/
		/****** md5 signature: 39770c9d3099552c2587ae06811ed0fb ******/
		%feature("compactdefaultargs") TransferList;
		%feature("autodoc", "
Parameters
----------
theList: TColStd_HSequenceOfTransient
theRec: bool (optional, default to Standard_True)
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
int

Description
-----------
Commands the transfer on reading for a list of entities to data for imagine, using the selected actor for read returns count of transferred entities, ok or with fails (0/1) if <rec> is true (d), the results are recorded by recordresult.
") TransferList;
		Standard_Integer TransferList(const opencascade::handle<TColStd_HSequenceOfTransient> & theList, const Standard_Boolean theRec = Standard_True, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** XSControl_TransferReader::TransferOne ******/
		/****** md5 signature: c584819dd9b126bcab438697e731b566 ******/
		%feature("compactdefaultargs") TransferOne;
		%feature("autodoc", "
Parameters
----------
theEnt: Standard_Transient
theRec: bool (optional, default to Standard_True)
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
int

Description
-----------
Commands the transfer on reading for an entity to data for imagine, using the selected actor for read returns count of transferred entities, ok or with fails (0/1) if <rec> is true (d), the result is recorded by recordresult.
") TransferOne;
		Standard_Integer TransferOne(const opencascade::handle<Standard_Transient> & theEnt, const Standard_Boolean theRec = Standard_True, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** XSControl_TransferReader::TransferRoots ******/
		/****** md5 signature: d3c3a844862d45f4410d4148c8434742 ******/
		%feature("compactdefaultargs") TransferRoots;
		%feature("autodoc", "
Parameters
----------
theGraph: Interface_Graph
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
int

Description
-----------
Transfers the content of the current interface model to data handled by imagine, starting from its roots (determined by the graph <g>), using the selected actor for read returns the count of performed root transfers (i.e. 0 if none) or -1 if no actor is defined.
") TransferRoots;
		Standard_Integer TransferRoots(const Interface_Graph & theGraph, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** XSControl_TransferReader::TransientProcess ******/
		/****** md5 signature: c581697d9fdd28675207e919d05ae7c9 ******/
		%feature("compactdefaultargs") TransientProcess;
		%feature("autodoc", "Return
-------
opencascade::handle<Transfer_TransientProcess>

Description
-----------
Returns the currently used transientprocess it is computed from the model by transferreadroots, or by begintransferread.
") TransientProcess;
		const opencascade::handle<Transfer_TransientProcess> & TransientProcess();

		/****** XSControl_TransferReader::TransientResult ******/
		/****** md5 signature: a209c31a0e1d7e3ffc19db8b1e603c66 ******/
		%feature("compactdefaultargs") TransientResult;
		%feature("autodoc", "
Parameters
----------
theEnt: Standard_Transient

Return
-------
opencascade::handle<Standard_Transient>

Description
-----------
Returns the resulting object as a transient null handle if no result or result not transient.
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
		/****** XSControl_TransferWriter::XSControl_TransferWriter ******/
		/****** md5 signature: c238b8946022215507643a042bd9b965 ******/
		%feature("compactdefaultargs") XSControl_TransferWriter;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates a transferwriter, empty, ready to run with an empty finderprocess (but no controller, etc).
") XSControl_TransferWriter;
		 XSControl_TransferWriter();

		/****** XSControl_TransferWriter::CheckList ******/
		/****** md5 signature: 28097225c7dc1bd34c16a03b8c119653 ******/
		%feature("compactdefaultargs") CheckList;
		%feature("autodoc", "Return
-------
Interface_CheckIterator

Description
-----------
Returns the check-list of last transfer (write), i.e. the check-list currently recorded in the finderprocess.
") CheckList;
		Interface_CheckIterator CheckList();

		/****** XSControl_TransferWriter::Clear ******/
		/****** md5 signature: 0fc5de3e361f7d75f07cbd42429ea39e ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "
Parameters
----------
theMode: int

Return
-------
None

Description
-----------
Clears recorded data according a mode 0 clears finderprocess (results, checks) -1 create a new finderprocess.
") Clear;
		void Clear(const Standard_Integer theMode);

		/****** XSControl_TransferWriter::Controller ******/
		/****** md5 signature: a2ab19669057f52b70e72fb487074ee6 ******/
		%feature("compactdefaultargs") Controller;
		%feature("autodoc", "Return
-------
opencascade::handle<XSControl_Controller>

Description
-----------
Returns the currently used controller.
") Controller;
		const opencascade::handle<XSControl_Controller> & Controller();

		/****** XSControl_TransferWriter::FinderProcess ******/
		/****** md5 signature: 937972e7a8be92f957b48ba97845a084 ******/
		%feature("compactdefaultargs") FinderProcess;
		%feature("autodoc", "Return
-------
opencascade::handle<Transfer_FinderProcess>

Description
-----------
Returns the finderprocess itself.
") FinderProcess;
		const opencascade::handle<Transfer_FinderProcess> & FinderProcess();

		/****** XSControl_TransferWriter::PrintStats ******/
		/****** md5 signature: 8bd41dfecd854fc8ff870fc204b89f8f ******/
		%feature("compactdefaultargs") PrintStats;
		%feature("autodoc", "
Parameters
----------
theWhat: int
theMode: int (optional, default to 0)

Return
-------
None

Description
-----------
Prints statistics on current trace file, according what,mode see printstatsprocess for details.
") PrintStats;
		void PrintStats(const Standard_Integer theWhat, const Standard_Integer theMode = 0);

		/****** XSControl_TransferWriter::RecognizeShape ******/
		/****** md5 signature: 1f48fd8f9a4c11c732ae9a5618118f88 ******/
		%feature("compactdefaultargs") RecognizeShape;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape

Return
-------
bool

Description
-----------
Tells if a shape is valid for a transfer to a model asks the controller (recognizewriteshape).
") RecognizeShape;
		Standard_Boolean RecognizeShape(const TopoDS_Shape & theShape);

		/****** XSControl_TransferWriter::RecognizeTransient ******/
		/****** md5 signature: 2b8e7a67951e00a535c14ad88815161c ******/
		%feature("compactdefaultargs") RecognizeTransient;
		%feature("autodoc", "
Parameters
----------
theObj: Standard_Transient

Return
-------
bool

Description
-----------
Tells if a transient object (from an application) is a valid candidate for a transfer to a model asks the controller (recognizewritetransient) if <obj> is a hshape, calls recognizeshape.
") RecognizeTransient;
		Standard_Boolean RecognizeTransient(const opencascade::handle<Standard_Transient> & theObj);

		/****** XSControl_TransferWriter::ResultCheckList ******/
		/****** md5 signature: 7cb46339c8706e2628e4fba9b5f6e250 ******/
		%feature("compactdefaultargs") ResultCheckList;
		%feature("autodoc", "
Parameters
----------
theModel: Interface_InterfaceModel

Return
-------
Interface_CheckIterator

Description
-----------
Returns the check-list of last transfer (write), but tries to bind to each check, the resulting entity in the model instead of keeping the original mapper, whenever known.
") ResultCheckList;
		Interface_CheckIterator ResultCheckList(const opencascade::handle<Interface_InterfaceModel> & theModel);

		/****** XSControl_TransferWriter::SetController ******/
		/****** md5 signature: cb8a3d51cb45dcc532809e0a42cb204b ******/
		%feature("compactdefaultargs") SetController;
		%feature("autodoc", "
Parameters
----------
theCtl: XSControl_Controller

Return
-------
None

Description
-----------
Sets a new controller, also sets a new finderprocess.
") SetController;
		void SetController(const opencascade::handle<XSControl_Controller> & theCtl);

		/****** XSControl_TransferWriter::SetFinderProcess ******/
		/****** md5 signature: d90f3390c01143f53745abc1e10c44d7 ******/
		%feature("compactdefaultargs") SetFinderProcess;
		%feature("autodoc", "
Parameters
----------
theFP: Transfer_FinderProcess

Return
-------
None

Description
-----------
Sets a new finderprocess and forgets the former one.
") SetFinderProcess;
		void SetFinderProcess(const opencascade::handle<Transfer_FinderProcess> & theFP);

		/****** XSControl_TransferWriter::SetTransferMode ******/
		/****** md5 signature: f34971a6bf9f1f3b74f421bf761b7f00 ******/
		%feature("compactdefaultargs") SetTransferMode;
		%feature("autodoc", "
Parameters
----------
theMode: int

Return
-------
None

Description
-----------
Changes the transfer mode.
") SetTransferMode;
		void SetTransferMode(const Standard_Integer theMode);

		/****** XSControl_TransferWriter::TransferMode ******/
		/****** md5 signature: 73602a039d76c3decd9df7593a3b80eb ******/
		%feature("compactdefaultargs") TransferMode;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the current transfer mode (an integer) it will be interpreted by the controller to run transfers this call form could be later replaced by more specific ones (parameters suited for each norm / transfer case).
") TransferMode;
		Standard_Integer TransferMode();

		/****** XSControl_TransferWriter::TransferWriteShape ******/
		/****** md5 signature: f8d35c8811b8b7877bd856613dfb9e8e ******/
		%feature("compactdefaultargs") TransferWriteShape;
		%feature("autodoc", "
Parameters
----------
theModel: Interface_InterfaceModel
theShape: TopoDS_Shape
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
IFSelect_ReturnStatus

Description
-----------
Transfers a shape from cascade to a model of current norm, according to the last call to settransfermode works by calling the controller returns status: =0 if ok, >0 if error during transfer, <0 if transfer badly initialised.
") TransferWriteShape;
		IFSelect_ReturnStatus TransferWriteShape(const opencascade::handle<Interface_InterfaceModel> & theModel, const TopoDS_Shape & theShape, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** XSControl_TransferWriter::TransferWriteTransient ******/
		/****** md5 signature: ee3ed87832d3e297468d74f969770e97 ******/
		%feature("compactdefaultargs") TransferWriteTransient;
		%feature("autodoc", "
Parameters
----------
theModel: Interface_InterfaceModel
theObj: Standard_Transient
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
IFSelect_ReturnStatus

Description
-----------
Transfers a transient object (from an application) to a model of current norm, according to the last call to settransfermode works by calling the controller returns status: =0 if ok, >0 if error during transfer, <0 if transfer badly initialised.
") TransferWriteTransient;
		IFSelect_ReturnStatus TransferWriteTransient(const opencascade::handle<Interface_InterfaceModel> & theModel, const opencascade::handle<Standard_Transient> & theObj, const Message_ProgressRange & theProgress = Message_ProgressRange());

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
		/****** XSControl_Utils::XSControl_Utils ******/
		/****** md5 signature: 16bf416d2db60a7035afa83edfee835b ******/
		%feature("compactdefaultargs") XSControl_Utils;
		%feature("autodoc", "Return
-------
None

Description
-----------
The only use of this, is to allow a frontal to get one distinct 'utils' set per separate engine.
") XSControl_Utils;
		 XSControl_Utils();

		/****** XSControl_Utils::AppendCStr ******/
		/****** md5 signature: 6e3a97d130fd0aaf4d4548e30eac9e24 ******/
		%feature("compactdefaultargs") AppendCStr;
		%feature("autodoc", "
Parameters
----------
seqval: TColStd_HSequenceOfHAsciiString
strval: str

Return
-------
None

Description
-----------
No available documentation.
") AppendCStr;
		void AppendCStr(const opencascade::handle<TColStd_HSequenceOfHAsciiString> & seqval, Standard_CString strval);

		/****** XSControl_Utils::AppendEStr ******/
		/****** md5 signature: 9934e3172203d6e27f9d10c78cd358ae ******/
		%feature("compactdefaultargs") AppendEStr;
		%feature("autodoc", "
Parameters
----------
seqval: TColStd_HSequenceOfHExtendedString
strval: Standard_ExtString

Return
-------
None

Description
-----------
No available documentation.
") AppendEStr;
		void AppendEStr(const opencascade::handle<TColStd_HSequenceOfHExtendedString> & seqval, const Standard_ExtString strval);

		/****** XSControl_Utils::AppendShape ******/
		/****** md5 signature: 9148f939f8b2aff61c51b67d958b5e92 ******/
		%feature("compactdefaultargs") AppendShape;
		%feature("autodoc", "
Parameters
----------
seqv: TopTools_HSequenceOfShape
shape: TopoDS_Shape

Return
-------
None

Description
-----------
No available documentation.
") AppendShape;
		void AppendShape(const opencascade::handle<TopTools_HSequenceOfShape> & seqv, const TopoDS_Shape & shape);

		/****** XSControl_Utils::AppendTra ******/
		/****** md5 signature: 59c160fce3b70fb5b83d7981544c45f4 ******/
		%feature("compactdefaultargs") AppendTra;
		%feature("autodoc", "
Parameters
----------
seqval: TColStd_HSequenceOfTransient
traval: Standard_Transient

Return
-------
None

Description
-----------
No available documentation.
") AppendTra;
		void AppendTra(const opencascade::handle<TColStd_HSequenceOfTransient> & seqval, const opencascade::handle<Standard_Transient> & traval);

		/****** XSControl_Utils::ArrToSeq ******/
		/****** md5 signature: 4a24694daf778caba1ea7d2fd0a2bc1c ******/
		%feature("compactdefaultargs") ArrToSeq;
		%feature("autodoc", "
Parameters
----------
arr: Standard_Transient

Return
-------
opencascade::handle<Standard_Transient>

Description
-----------
No available documentation.
") ArrToSeq;
		opencascade::handle<Standard_Transient> ArrToSeq(const opencascade::handle<Standard_Transient> & arr);

		/****** XSControl_Utils::AsciiToExtended ******/
		/****** md5 signature: 57f262f4865f4fa2d3c3e229d384e566 ******/
		%feature("compactdefaultargs") AsciiToExtended;
		%feature("autodoc", "
Parameters
----------
str: str

Return
-------
Standard_ExtString

Description
-----------
No available documentation.
") AsciiToExtended;
		Standard_ExtString AsciiToExtended(Standard_CString str);

		/****** XSControl_Utils::BinderShape ******/
		/****** md5 signature: 1b884ed953b9de71d14d439713905b02 ******/
		%feature("compactdefaultargs") BinderShape;
		%feature("autodoc", "
Parameters
----------
tr: Standard_Transient

Return
-------
TopoDS_Shape

Description
-----------
From a transient, returns a shape. in fact, recognizes shapebinder shapemapper and hshape.
") BinderShape;
		TopoDS_Shape BinderShape(const opencascade::handle<Standard_Transient> & tr);

		/****** XSControl_Utils::CStrValue ******/
		/****** md5 signature: 4b7c7ff1ecf356720a489f2f11b0f453 ******/
		%feature("compactdefaultargs") CStrValue;
		%feature("autodoc", "
Parameters
----------
list: Standard_Transient
num: int

Return
-------
str

Description
-----------
No available documentation.
") CStrValue;
		Standard_CString CStrValue(const opencascade::handle<Standard_Transient> & list, const Standard_Integer num);

		/****** XSControl_Utils::CompoundFromSeq ******/
		/****** md5 signature: 9c42e270bfcdddbf1929a557984f4fda ******/
		%feature("compactdefaultargs") CompoundFromSeq;
		%feature("autodoc", "
Parameters
----------
seqval: TopTools_HSequenceOfShape

Return
-------
TopoDS_Shape

Description
-----------
Converts a list of shapes to a compound (a kind of shape).
") CompoundFromSeq;
		TopoDS_Shape CompoundFromSeq(const opencascade::handle<TopTools_HSequenceOfShape> & seqval);

		/****** XSControl_Utils::DateString ******/
		/****** md5 signature: 06bb2d8331a757c1e706af724ee8467d ******/
		%feature("compactdefaultargs") DateString;
		%feature("autodoc", "
Parameters
----------
yy: int
mm: int
dd: int
hh: int
mn: int
ss: int

Return
-------
str

Description
-----------
No available documentation.
") DateString;
		Standard_CString DateString(const Standard_Integer yy, const Standard_Integer mm, const Standard_Integer dd, const Standard_Integer hh, const Standard_Integer mn, const Standard_Integer ss);

		/****** XSControl_Utils::DateValues ******/
		/****** md5 signature: 80cd43251686342d1c83d54472b57f24 ******/
		%feature("compactdefaultargs") DateValues;
		%feature("autodoc", "
Parameters
----------
text: str

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
No available documentation.
") DateValues;
		void DateValues(Standard_CString text, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****** XSControl_Utils::EStrValue ******/
		/****** md5 signature: 6160d687934a25fae20a4478d4a4ead9 ******/
		%feature("compactdefaultargs") EStrValue;
		%feature("autodoc", "
Parameters
----------
list: Standard_Transient
num: int

Return
-------
Standard_ExtString

Description
-----------
No available documentation.
") EStrValue;
		Standard_ExtString EStrValue(const opencascade::handle<Standard_Transient> & list, const Standard_Integer num);

		/****** XSControl_Utils::ExtendedToAscii ******/
		/****** md5 signature: 8a0981510ba0ba08c3daafd5e7ba0492 ******/
		%feature("compactdefaultargs") ExtendedToAscii;
		%feature("autodoc", "
Parameters
----------
str: Standard_ExtString

Return
-------
str

Description
-----------
No available documentation.
") ExtendedToAscii;
		Standard_CString ExtendedToAscii(const Standard_ExtString str);

		/****** XSControl_Utils::IsAscii ******/
		/****** md5 signature: 4d8b39ffb883d51a71e0f32b2eaaa10d ******/
		%feature("compactdefaultargs") IsAscii;
		%feature("autodoc", "
Parameters
----------
str: Standard_ExtString

Return
-------
bool

Description
-----------
No available documentation.
") IsAscii;
		Standard_Boolean IsAscii(const Standard_ExtString str);

		/****** XSControl_Utils::IsKind ******/
		/****** md5 signature: 7732e0a29b74329984aeae68962b4acc ******/
		%feature("compactdefaultargs") IsKind;
		%feature("autodoc", "
Parameters
----------
item: Standard_Transient
what: Standard_Type

Return
-------
bool

Description
-----------
No available documentation.
") IsKind;
		Standard_Boolean IsKind(const opencascade::handle<Standard_Transient> & item, const opencascade::handle<Standard_Type> & what);

		/****** XSControl_Utils::NewSeqCStr ******/
		/****** md5 signature: 02eeec01644c04a031825be6a6c4e7a4 ******/
		%feature("compactdefaultargs") NewSeqCStr;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HSequenceOfHAsciiString>

Description
-----------
No available documentation.
") NewSeqCStr;
		opencascade::handle<TColStd_HSequenceOfHAsciiString> NewSeqCStr();

		/****** XSControl_Utils::NewSeqEStr ******/
		/****** md5 signature: 98bc2beca96b37e1ca65c2018ea520d3 ******/
		%feature("compactdefaultargs") NewSeqEStr;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HSequenceOfHExtendedString>

Description
-----------
No available documentation.
") NewSeqEStr;
		opencascade::handle<TColStd_HSequenceOfHExtendedString> NewSeqEStr();

		/****** XSControl_Utils::NewSeqShape ******/
		/****** md5 signature: 23e26f5e9fae6802506681d5987d1405 ******/
		%feature("compactdefaultargs") NewSeqShape;
		%feature("autodoc", "Return
-------
opencascade::handle<TopTools_HSequenceOfShape>

Description
-----------
No available documentation.
") NewSeqShape;
		opencascade::handle<TopTools_HSequenceOfShape> NewSeqShape();

		/****** XSControl_Utils::NewSeqTra ******/
		/****** md5 signature: c1ef00c0466369cce178e244d57a80fd ******/
		%feature("compactdefaultargs") NewSeqTra;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HSequenceOfTransient>

Description
-----------
No available documentation.
") NewSeqTra;
		opencascade::handle<TColStd_HSequenceOfTransient> NewSeqTra();

		/****** XSControl_Utils::SeqIntValue ******/
		/****** md5 signature: 69ce7eb3032d08ef5cc3e1cc19fc0061 ******/
		%feature("compactdefaultargs") SeqIntValue;
		%feature("autodoc", "
Parameters
----------
list: TColStd_HSequenceOfInteger
num: int

Return
-------
int

Description
-----------
No available documentation.
") SeqIntValue;
		Standard_Integer SeqIntValue(const opencascade::handle<TColStd_HSequenceOfInteger> & list, const Standard_Integer num);

		/****** XSControl_Utils::SeqLength ******/
		/****** md5 signature: 44119ddec45d1e7d5f1cff385a4a4b32 ******/
		%feature("compactdefaultargs") SeqLength;
		%feature("autodoc", "
Parameters
----------
list: Standard_Transient

Return
-------
int

Description
-----------
No available documentation.
") SeqLength;
		Standard_Integer SeqLength(const opencascade::handle<Standard_Transient> & list);

		/****** XSControl_Utils::SeqToArr ******/
		/****** md5 signature: 550bf714b9ad83cb9c918865de149817 ******/
		%feature("compactdefaultargs") SeqToArr;
		%feature("autodoc", "
Parameters
----------
seq: Standard_Transient
first: int (optional, default to 1)

Return
-------
opencascade::handle<Standard_Transient>

Description
-----------
No available documentation.
") SeqToArr;
		opencascade::handle<Standard_Transient> SeqToArr(const opencascade::handle<Standard_Transient> & seq, const Standard_Integer first = 1);

		/****** XSControl_Utils::ShapeBinder ******/
		/****** md5 signature: b11cf575c90dcb1893515b0fe79b9f6b ******/
		%feature("compactdefaultargs") ShapeBinder;
		%feature("autodoc", "
Parameters
----------
shape: TopoDS_Shape
hs: bool (optional, default to Standard_True)

Return
-------
opencascade::handle<Standard_Transient>

Description
-----------
Creates a transient object from a shape: it is either a binder (used by functions which require a transient but can process a shape, such as viewing functions) or a hshape (according to hs) default is a hshape.
") ShapeBinder;
		opencascade::handle<Standard_Transient> ShapeBinder(const TopoDS_Shape & shape, const Standard_Boolean hs = Standard_True);

		/****** XSControl_Utils::ShapeType ******/
		/****** md5 signature: ab636bf5c0d2e486d53891e797ab3d6b ******/
		%feature("compactdefaultargs") ShapeType;
		%feature("autodoc", "
Parameters
----------
shape: TopoDS_Shape
compound: bool

Return
-------
TopAbs_ShapeEnum

Description
-----------
Returns the type of a shape: true type if <compound> is false if <compound> is true and <shape> is a compound, iterates on its items. if all are of the same type, returns this type. else, returns compound. if it is empty, returns shape for a null shape, returns shape.
") ShapeType;
		TopAbs_ShapeEnum ShapeType(const TopoDS_Shape & shape, const Standard_Boolean compound);

		/****** XSControl_Utils::ShapeValue ******/
		/****** md5 signature: 1cde49799a716d33a6a34f896e8e9d8f ******/
		%feature("compactdefaultargs") ShapeValue;
		%feature("autodoc", "
Parameters
----------
seqv: TopTools_HSequenceOfShape
num: int

Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") ShapeValue;
		TopoDS_Shape ShapeValue(const opencascade::handle<TopTools_HSequenceOfShape> & seqv, const Standard_Integer num);

		/****** XSControl_Utils::SortedCompound ******/
		/****** md5 signature: b55d0015285d0f23fb3c68ccb5f8f79e ******/
		%feature("compactdefaultargs") SortedCompound;
		%feature("autodoc", "
Parameters
----------
shape: TopoDS_Shape
type: TopAbs_ShapeEnum
explore: bool
compound: bool

Return
-------
TopoDS_Shape

Description
-----------
From a shape, builds a compound as follows: explores it level by level if <explore> is false, only compound items. else, all items adds to the result, shapes which comply to <type> + if <type> is wire, considers free edges (and makes wires) + if <type> is shell, considers free faces (and makes shells) if <compound> is true, gathers items in compounds which correspond to starting compound,solid or shell containers, or items directly contained in a compound.
") SortedCompound;
		TopoDS_Shape SortedCompound(const TopoDS_Shape & shape, const TopAbs_ShapeEnum type, const Standard_Boolean explore, const Standard_Boolean compound);

		/****** XSControl_Utils::ToAString ******/
		/****** md5 signature: 579c485821dcbf2e2c963016af5bc087 ******/
		%feature("compactdefaultargs") ToAString;
		%feature("autodoc", "
Parameters
----------
strcon: str

Return
-------
TCollection_AsciiString

Description
-----------
No available documentation.
") ToAString;
		TCollection_AsciiString ToAString(Standard_CString strcon);

		/****** XSControl_Utils::ToCString ******/
		/****** md5 signature: 3b3d42a4d7befd95fc7da813c3e180a7 ******/
		%feature("compactdefaultargs") ToCString;
		%feature("autodoc", "
Parameters
----------
strval: TCollection_HAsciiString

Return
-------
str

Description
-----------
No available documentation.
") ToCString;
		Standard_CString ToCString(const opencascade::handle<TCollection_HAsciiString> & strval);

		/****** XSControl_Utils::ToCString ******/
		/****** md5 signature: 88caf2c381405fda99aa9c53fe594a55 ******/
		%feature("compactdefaultargs") ToCString;
		%feature("autodoc", "
Parameters
----------
strval: str

Return
-------
str

Description
-----------
No available documentation.
") ToCString;
		Standard_CString ToCString(TCollection_AsciiString strval);

		/****** XSControl_Utils::ToEString ******/
		/****** md5 signature: 92d646c74275aa73981716c4bb3d5966 ******/
		%feature("compactdefaultargs") ToEString;
		%feature("autodoc", "
Parameters
----------
strval: TCollection_HExtendedString

Return
-------
Standard_ExtString

Description
-----------
No available documentation.
") ToEString;
		Standard_ExtString ToEString(const opencascade::handle<TCollection_HExtendedString> & strval);

		/****** XSControl_Utils::ToEString ******/
		/****** md5 signature: 4d68201f594f44c72ac75f60a954292f ******/
		%feature("compactdefaultargs") ToEString;
		%feature("autodoc", "
Parameters
----------
strval: str

Return
-------
Standard_ExtString

Description
-----------
No available documentation.
") ToEString;
		Standard_ExtString ToEString(TCollection_ExtendedString strval);

		/****** XSControl_Utils::ToHString ******/
		/****** md5 signature: 7b7d11344d2ddb25c7aca4ebcec91c98 ******/
		%feature("compactdefaultargs") ToHString;
		%feature("autodoc", "
Parameters
----------
strcon: str

Return
-------
opencascade::handle<TCollection_HAsciiString>

Description
-----------
No available documentation.
") ToHString;
		opencascade::handle<TCollection_HAsciiString> ToHString(Standard_CString strcon);

		/****** XSControl_Utils::ToHString ******/
		/****** md5 signature: 29cf32d289b49b94c85616a821a0be85 ******/
		%feature("compactdefaultargs") ToHString;
		%feature("autodoc", "
Parameters
----------
strcon: Standard_ExtString

Return
-------
opencascade::handle<TCollection_HExtendedString>

Description
-----------
No available documentation.
") ToHString;
		opencascade::handle<TCollection_HExtendedString> ToHString(const Standard_ExtString strcon);

		/****** XSControl_Utils::ToXString ******/
		/****** md5 signature: 7c3f09c2135ae7c014d28567534264cd ******/
		%feature("compactdefaultargs") ToXString;
		%feature("autodoc", "
Parameters
----------
strcon: Standard_ExtString

Return
-------
TCollection_ExtendedString

Description
-----------
No available documentation.
") ToXString;
		TCollection_ExtendedString ToXString(const Standard_ExtString strcon);

		/****** XSControl_Utils::TraValue ******/
		/****** md5 signature: 005405a0ace916f3ba6bf9e6220041c1 ******/
		%feature("compactdefaultargs") TraValue;
		%feature("autodoc", "
Parameters
----------
list: Standard_Transient
num: int

Return
-------
opencascade::handle<Standard_Transient>

Description
-----------
No available documentation.
") TraValue;
		opencascade::handle<Standard_Transient> TraValue(const opencascade::handle<Standard_Transient> & list, const Standard_Integer num);

		/****** XSControl_Utils::TraceLine ******/
		/****** md5 signature: 09e41c0832ee8e26e3b51bae02803480 ******/
		%feature("compactdefaultargs") TraceLine;
		%feature("autodoc", "
Parameters
----------
line: str

Return
-------
None

Description
-----------
Just prints a line into the current trace file. this allows to better characterise the various trace outputs, as desired.
") TraceLine;
		void TraceLine(Standard_CString line);

		/****** XSControl_Utils::TraceLines ******/
		/****** md5 signature: 20cb718590610f63086ac24e0f2045c2 ******/
		%feature("compactdefaultargs") TraceLines;
		%feature("autodoc", "
Parameters
----------
lines: Standard_Transient

Return
-------
None

Description
-----------
Just prints a line or a set of lines into the current trace file. <lines> can be a hascii/extendedstring (produces a print without ending line) or a hsequence or harray1 of .. (one new line per item).
") TraceLines;
		void TraceLines(const opencascade::handle<Standard_Transient> & lines);

		/****** XSControl_Utils::TypeName ******/
		/****** md5 signature: 78ab1ca307bbb72decae7f9aa0377244 ******/
		%feature("compactdefaultargs") TypeName;
		%feature("autodoc", "
Parameters
----------
item: Standard_Transient
nopk: bool (optional, default to Standard_False)

Return
-------
str

Description
-----------
Returns the name of the dynamic type of an object, i.e.: if it is a type, its name if it is a object not a type, the name of its dynamictype if it is null, an empty string if <nopk> is false (d), gives complete name if <nopk> is true, returns class name without package.
") TypeName;
		Standard_CString TypeName(const opencascade::handle<Standard_Transient> & item, const Standard_Boolean nopk = Standard_False);

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
		/****** XSControl_Vars::XSControl_Vars ******/
		/****** md5 signature: da409732d5a7c77ecf3867183bc1efaf ******/
		%feature("compactdefaultargs") XSControl_Vars;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") XSControl_Vars;
		 XSControl_Vars();

		/****** XSControl_Vars::Get ******/
		/****** md5 signature: 44e0346a8ce96cf16458a6e2e74bac10 ******/
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "
Parameters
----------
name: str

Return
-------
opencascade::handle<Standard_Transient>

Description
-----------
No available documentation.
") Get;
		virtual opencascade::handle<Standard_Transient> Get(Standard_CString name);

		/****** XSControl_Vars::GetCurve ******/
		/****** md5 signature: 599f63b9d3913ce0fc7886108c1a9673 ******/
		%feature("compactdefaultargs") GetCurve;
		%feature("autodoc", "
Parameters
----------
name: str

Return
-------
opencascade::handle<Geom_Curve>

Description
-----------
No available documentation.
") GetCurve;
		virtual opencascade::handle<Geom_Curve> GetCurve(Standard_CString name);

		/****** XSControl_Vars::GetCurve2d ******/
		/****** md5 signature: e21c81bea4735f342ec556482c9688ec ******/
		%feature("compactdefaultargs") GetCurve2d;
		%feature("autodoc", "
Parameters
----------
name: str

Return
-------
opencascade::handle<Geom2d_Curve>

Description
-----------
No available documentation.
") GetCurve2d;
		virtual opencascade::handle<Geom2d_Curve> GetCurve2d(Standard_CString name);

		/****** XSControl_Vars::GetGeom ******/
		/****** md5 signature: f21f0d65f6dfbbe40fbbd732496261d2 ******/
		%feature("compactdefaultargs") GetGeom;
		%feature("autodoc", "
Parameters
----------
name: str

Return
-------
opencascade::handle<Geom_Geometry>

Description
-----------
No available documentation.
") GetGeom;
		virtual opencascade::handle<Geom_Geometry> GetGeom(Standard_CString name);

		/****** XSControl_Vars::GetPoint ******/
		/****** md5 signature: 8e4b51e11fdfe0bfb7441e816dabce20 ******/
		%feature("compactdefaultargs") GetPoint;
		%feature("autodoc", "
Parameters
----------
name: str
pnt: gp_Pnt

Return
-------
bool

Description
-----------
No available documentation.
") GetPoint;
		virtual Standard_Boolean GetPoint(Standard_CString name, gp_Pnt & pnt);

		/****** XSControl_Vars::GetPoint2d ******/
		/****** md5 signature: a582c7a95b992cb2d66a37a54d5ab3ff ******/
		%feature("compactdefaultargs") GetPoint2d;
		%feature("autodoc", "
Parameters
----------
name: str
pnt: gp_Pnt2d

Return
-------
bool

Description
-----------
No available documentation.
") GetPoint2d;
		virtual Standard_Boolean GetPoint2d(Standard_CString name, gp_Pnt2d & pnt);

		/****** XSControl_Vars::GetShape ******/
		/****** md5 signature: 2957ff82e7c3b4fbc9b3efaa76a4308e ******/
		%feature("compactdefaultargs") GetShape;
		%feature("autodoc", "
Parameters
----------
name: str

Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") GetShape;
		virtual TopoDS_Shape GetShape(Standard_CString name);

		/****** XSControl_Vars::GetSurface ******/
		/****** md5 signature: 68a8636c4fa5cb0089082aa3efacf371 ******/
		%feature("compactdefaultargs") GetSurface;
		%feature("autodoc", "
Parameters
----------
name: str

Return
-------
opencascade::handle<Geom_Surface>

Description
-----------
No available documentation.
") GetSurface;
		virtual opencascade::handle<Geom_Surface> GetSurface(Standard_CString name);

		/****** XSControl_Vars::Set ******/
		/****** md5 signature: 16d0a361edf7b31d7551d629d7eda692 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
name: str
val: Standard_Transient

Return
-------
None

Description
-----------
No available documentation.
") Set;
		virtual void Set(Standard_CString name, const opencascade::handle<Standard_Transient> & val);

		/****** XSControl_Vars::SetPoint ******/
		/****** md5 signature: 4d0f75b4ab64236e257eaaecfb5de79c ******/
		%feature("compactdefaultargs") SetPoint;
		%feature("autodoc", "
Parameters
----------
name: str
val: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") SetPoint;
		virtual void SetPoint(Standard_CString name, const gp_Pnt & val);

		/****** XSControl_Vars::SetPoint2d ******/
		/****** md5 signature: 49e75825f7ac5dd58f7d04184e5302af ******/
		%feature("compactdefaultargs") SetPoint2d;
		%feature("autodoc", "
Parameters
----------
name: str
val: gp_Pnt2d

Return
-------
None

Description
-----------
No available documentation.
") SetPoint2d;
		virtual void SetPoint2d(Standard_CString name, const gp_Pnt2d & val);

		/****** XSControl_Vars::SetShape ******/
		/****** md5 signature: eb81a1893f16847e142322a4c28cc4f0 ******/
		%feature("compactdefaultargs") SetShape;
		%feature("autodoc", "
Parameters
----------
name: str
val: TopoDS_Shape

Return
-------
None

Description
-----------
No available documentation.
") SetShape;
		virtual void SetShape(Standard_CString name, const TopoDS_Shape & val);

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
		/****** XSControl_WorkSession::XSControl_WorkSession ******/
		/****** md5 signature: a162fca4741888ede15453e8ada8e89f ******/
		%feature("compactdefaultargs") XSControl_WorkSession;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") XSControl_WorkSession;
		 XSControl_WorkSession();

		/****** XSControl_WorkSession::ClearContext ******/
		/****** md5 signature: 4bc018b6ca786bb92053bff7d2a2f3df ******/
		%feature("compactdefaultargs") ClearContext;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clears the whole current context (nullifies it).
") ClearContext;
		void ClearContext();

		/****** XSControl_WorkSession::ClearData ******/
		/****** md5 signature: 081b9c9c9a829dcc63d88d60b3dc10bb ******/
		%feature("compactdefaultargs") ClearData;
		%feature("autodoc", "
Parameters
----------
theMode: int

Return
-------
None

Description
-----------
In addition to basic cleardata, clears transfer and management for interactive use, for mode = 0,1,2 and over 4 plus: mode = 5 to clear transfers (both ways) only mode = 6 to clear enforced results mode = 7 to clear transfers, results.
") ClearData;
		virtual void ClearData(const Standard_Integer theMode);

		/****** XSControl_WorkSession::Context ******/
		/****** md5 signature: d5688196fd398cc8343bbd06a6d3a0ad ******/
		%feature("compactdefaultargs") Context;
		%feature("autodoc", "Return
-------
NCollection_DataMap<TCollection_AsciiString, opencascade::handle<Standard_Transient>>

Description
-----------
Returns the current context list, null if not defined the context is given to the transientprocess for transferread.
") Context;
		NCollection_DataMap<TCollection_AsciiString, opencascade::handle<Standard_Transient>> Context();

		/****** XSControl_WorkSession::InitTransferReader ******/
		/****** md5 signature: ed10d9fce1a711a68af788321fdb54fc ******/
		%feature("compactdefaultargs") InitTransferReader;
		%feature("autodoc", "
Parameters
----------
theMode: int

Return
-------
None

Description
-----------
Sets a transfer reader, by internal ways, according mode: 0 recreates it clear, 1 clears it (does not recreate) 2 aligns roots of transientprocess from final results 3 aligns final results from roots of transientprocess 4 begins a new transfer (by begintransfer) 5 recreates transferreader then begins a new transfer.
") InitTransferReader;
		void InitTransferReader(const Standard_Integer theMode);

		/****** XSControl_WorkSession::MapReader ******/
		/****** md5 signature: 56949b2c05cfb7746727a0c64e125442 ******/
		%feature("compactdefaultargs") MapReader;
		%feature("autodoc", "Return
-------
opencascade::handle<Transfer_TransientProcess>

Description
-----------
Returns the transientprocess(internal data for transferreader).
") MapReader;
		opencascade::handle<Transfer_TransientProcess> MapReader();

		/****** XSControl_WorkSession::NewModel ******/
		/****** md5 signature: b195eaf62d9845e618b9fbba30be48e9 ******/
		%feature("compactdefaultargs") NewModel;
		%feature("autodoc", "Return
-------
opencascade::handle<Interface_InterfaceModel>

Description
-----------
Produces and returns a new model well conditioned it is produced by the norm controller it can be null (if this function is not implemented).
") NewModel;
		opencascade::handle<Interface_InterfaceModel> NewModel();

		/****** XSControl_WorkSession::NormAdaptor ******/
		/****** md5 signature: 324f48b45566fb7aeabe2b2606cd4da4 ******/
		%feature("compactdefaultargs") NormAdaptor;
		%feature("autodoc", "Return
-------
opencascade::handle<XSControl_Controller>

Description
-----------
Returns the norm controller itself.
") NormAdaptor;
		const opencascade::handle<XSControl_Controller> & NormAdaptor();

		/****** XSControl_WorkSession::PrintTransferStatus ******/
		/****** md5 signature: 00bdb09211e1e6bb5ba474ef2dd4ac70 ******/
		%feature("compactdefaultargs") PrintTransferStatus;
		%feature("autodoc", "
Parameters
----------
theNum: int
theWri: bool

Return
-------
theS: Standard_OStream

Description
-----------
Prints the transfer status of a transferred item, as being the mapped n0 <num>, from mapwriter if <wri> is true, or from mapreader if <wri> is false returns true when done, false else (i.e. num out of range).
") PrintTransferStatus;
		Standard_Boolean PrintTransferStatus(const Standard_Integer theNum, const Standard_Boolean theWri, std::ostream &OutValue);

		/****** XSControl_WorkSession::Result ******/
		/****** md5 signature: 648bf58b2605b71bf5b4112cce9715c1 ******/
		%feature("compactdefaultargs") Result;
		%feature("autodoc", "
Parameters
----------
theEnt: Standard_Transient
theMode: int

Return
-------
opencascade::handle<Standard_Transient>

Description
-----------
Returns the result attached to a starting entity if <mode> = 0, returns final result if <mode> = 1, considers last result if <mode> = 2, considers final, else if absent, last returns it as transient, if result is not transient returns the binder <mode> = 10,11,12 idem but returns the binder itself (if it is not, e.g. shape, returns the binder) <mode> = 20, returns the resultfrommodel.
") Result;
		opencascade::handle<Standard_Transient> Result(const opencascade::handle<Standard_Transient> & theEnt, const Standard_Integer theMode);

		/****** XSControl_WorkSession::SelectNorm ******/
		/****** md5 signature: 78e48aa95ac967e7205f759747170c4c ******/
		%feature("compactdefaultargs") SelectNorm;
		%feature("autodoc", "
Parameters
----------
theNormName: str

Return
-------
bool

Description
-----------
Selects a norm defined by its name. a norm is described and handled by a controller returns true if done, false if <normname> is unknown //! the current profile for this norm is taken.
") SelectNorm;
		Standard_Boolean SelectNorm(Standard_CString theNormName);

		/****** XSControl_WorkSession::SelectedNorm ******/
		/****** md5 signature: 69481250202915c86d557c39cca43930 ******/
		%feature("compactdefaultargs") SelectedNorm;
		%feature("autodoc", "
Parameters
----------
theRsc: bool (optional, default to Standard_False)

Return
-------
str

Description
-----------
Returns the name of the last selected norm. if none is defined, returns an empty string by default, returns the complete name of the norm if <rsc> is true, returns the short name used for resource.
") SelectedNorm;
		Standard_CString SelectedNorm(const Standard_Boolean theRsc = Standard_False);

		/****** XSControl_WorkSession::SetAllContext ******/
		/****** md5 signature: 062ca6fabb8fcb6dfa4021d82f6bfafa ******/
		%feature("compactdefaultargs") SetAllContext;
		%feature("autodoc", "
Parameters
----------
theContext: Standard_Transient

Return
-------
None

Description
-----------
Sets the current context list, as a whole sets it to the transferreader.
") SetAllContext;
		void SetAllContext(NCollection_DataMap<TCollection_AsciiString, opencascade::handle<Standard_Transient> > theContext);

		/****** XSControl_WorkSession::SetController ******/
		/****** md5 signature: d7eabfce93065329564b5f68591b841a ******/
		%feature("compactdefaultargs") SetController;
		%feature("autodoc", "
Parameters
----------
theCtl: XSControl_Controller

Return
-------
None

Description
-----------
Selects a norm defined by its controller itself.
") SetController;
		void SetController(const opencascade::handle<XSControl_Controller> & theCtl);

		/****** XSControl_WorkSession::SetMapReader ******/
		/****** md5 signature: 15305959af6213befc6e923c624b029e ******/
		%feature("compactdefaultargs") SetMapReader;
		%feature("autodoc", "
Parameters
----------
theTP: Transfer_TransientProcess

Return
-------
bool

Description
-----------
Changes the map reader, i.e. considers that the new one defines the relevant read results (forgets the former ones) returns true when done, false in case of bad definition, i.e. if model from tp differs from that of session.
") SetMapReader;
		Standard_Boolean SetMapReader(const opencascade::handle<Transfer_TransientProcess> & theTP);

		/****** XSControl_WorkSession::SetMapWriter ******/
		/****** md5 signature: 969f072d71530560da24b6757937ada3 ******/
		%feature("compactdefaultargs") SetMapWriter;
		%feature("autodoc", "
Parameters
----------
theFP: Transfer_FinderProcess

Return
-------
bool

Description
-----------
Changes the map reader, i.e. considers that the new one defines the relevant read results (forgets the former ones) returns true when done, false if <fp> is null.
") SetMapWriter;
		Standard_Boolean SetMapWriter(const opencascade::handle<Transfer_FinderProcess> & theFP);

		/****** XSControl_WorkSession::SetTransferReader ******/
		/****** md5 signature: 0e6d6ed3732ee9556f87e0a22c8db684 ******/
		%feature("compactdefaultargs") SetTransferReader;
		%feature("autodoc", "
Parameters
----------
theTR: XSControl_TransferReader

Return
-------
None

Description
-----------
Sets a transfer reader, which manages transfers on reading.
") SetTransferReader;
		void SetTransferReader(const opencascade::handle<XSControl_TransferReader> & theTR);

		/****** XSControl_WorkSession::SetVars ******/
		/****** md5 signature: 9e79436592319c12c279f8df6cdafaef ******/
		%feature("compactdefaultargs") SetVars;
		%feature("autodoc", "
Parameters
----------
theVars: XSControl_Vars

Return
-------
None

Description
-----------
No available documentation.
") SetVars;
		void SetVars(const opencascade::handle<XSControl_Vars> & theVars);

		/****** XSControl_WorkSession::TransferReadOne ******/
		/****** md5 signature: 07136716cbdeb7ed7fabe4e3da6766d6 ******/
		%feature("compactdefaultargs") TransferReadOne;
		%feature("autodoc", "
Parameters
----------
theEnts: Standard_Transient
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
int

Description
-----------
Commands the transfer of, either one entity, or a list i.e. calls the transferreader after having analysed <ents> it is cumulated from the last begintransfer <ents> is processed by givelist, hence: - <ents> a selection: its selectionresult - <ents> a hsequenceoftransient: this list - <ents> the model: in this specific case, all the roots, with no cumulation of former transfers (transferreadroots).
") TransferReadOne;
		Standard_Integer TransferReadOne(const opencascade::handle<Standard_Transient> & theEnts, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** XSControl_WorkSession::TransferReadRoots ******/
		/****** md5 signature: ace5b8c734fc21b5202f49b6ce1faff6 ******/
		%feature("compactdefaultargs") TransferReadRoots;
		%feature("autodoc", "
Parameters
----------
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
int

Description
-----------
Commands the transfer of all the root entities of the model i.e. calls transferroot from the transferreader with the graph no cumulation with former calls to transferreadone.
") TransferReadRoots;
		Standard_Integer TransferReadRoots(const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** XSControl_WorkSession::TransferReader ******/
		/****** md5 signature: fb55bcdc028cfc40da9805fb3d48b6bb ******/
		%feature("compactdefaultargs") TransferReader;
		%feature("autodoc", "Return
-------
opencascade::handle<XSControl_TransferReader>

Description
-----------
Returns the transfer reader, null if not set.
") TransferReader;
		const opencascade::handle<XSControl_TransferReader> & TransferReader();

		/****** XSControl_WorkSession::TransferWriteCheckList ******/
		/****** md5 signature: bf723f9190135f140bcf8505128bb64b ******/
		%feature("compactdefaultargs") TransferWriteCheckList;
		%feature("autodoc", "Return
-------
Interface_CheckIterator

Description
-----------
Returns the check-list of last transfer (write) it is recorded in the finderprocess, but it must be bound with resulting entities (in the resulting file model) rather than with original objects (in fact, their mappers).
") TransferWriteCheckList;
		Interface_CheckIterator TransferWriteCheckList();

		/****** XSControl_WorkSession::TransferWriteShape ******/
		/****** md5 signature: dea408423004f7d98d47bcc8073284e9 ******/
		%feature("compactdefaultargs") TransferWriteShape;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape
theCompGraph: bool (optional, default to Standard_True)
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
IFSelect_ReturnStatus

Description
-----------
Transfers a shape from cascade to a model of current norm, according to the last call to setmodewriteshape returns status :done if ok, fail if error during transfer, error if transfer badly initialised.
") TransferWriteShape;
		IFSelect_ReturnStatus TransferWriteShape(const TopoDS_Shape & theShape, const Standard_Boolean theCompGraph = Standard_True, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** XSControl_WorkSession::TransferWriter ******/
		/****** md5 signature: eb51fa8d64a383d09db0f0e2c51bd32e ******/
		%feature("compactdefaultargs") TransferWriter;
		%feature("autodoc", "Return
-------
opencascade::handle<XSControl_TransferWriter>

Description
-----------
Returns the transfer reader, null if not set.
") TransferWriter;
		const opencascade::handle<XSControl_TransferWriter> & TransferWriter();

		/****** XSControl_WorkSession::Vars ******/
		/****** md5 signature: c6e871616aa0015593a80d009d15209f ******/
		%feature("compactdefaultargs") Vars;
		%feature("autodoc", "Return
-------
opencascade::handle<XSControl_Vars>

Description
-----------
No available documentation.
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
		/****** XSControl_Writer::XSControl_Writer ******/
		/****** md5 signature: 973d49b8371a7783d12244f900cab568 ******/
		%feature("compactdefaultargs") XSControl_Writer;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates a writer from scratch.
") XSControl_Writer;
		 XSControl_Writer();

		/****** XSControl_Writer::XSControl_Writer ******/
		/****** md5 signature: 7512321fcaa103e58880fad1df266a83 ******/
		%feature("compactdefaultargs") XSControl_Writer;
		%feature("autodoc", "
Parameters
----------
norm: str

Return
-------
None

Description
-----------
Creates a writer from scratch, with a norm name which identifie a controller.
") XSControl_Writer;
		 XSControl_Writer(Standard_CString norm);

		/****** XSControl_Writer::XSControl_Writer ******/
		/****** md5 signature: fdc5250052abb6411e52ae5355a1787a ******/
		%feature("compactdefaultargs") XSControl_Writer;
		%feature("autodoc", "
Parameters
----------
WS: XSControl_WorkSession
scratch: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Creates a writer from an already existing session if <scratch> is true (d), clears already recorded data.
") XSControl_Writer;
		 XSControl_Writer(const opencascade::handle<XSControl_WorkSession> & WS, const Standard_Boolean scratch = Standard_True);

		/****** XSControl_Writer::Model ******/
		/****** md5 signature: ab692cf6d45d428f60a2ede26b226382 ******/
		%feature("compactdefaultargs") Model;
		%feature("autodoc", "
Parameters
----------
newone: bool (optional, default to Standard_False)

Return
-------
opencascade::handle<Interface_InterfaceModel>

Description
-----------
Returns the produced model. produces a new one if not yet done or if <newone> is true this method allows for instance to edit product or header data before writing.
") Model;
		opencascade::handle<Interface_InterfaceModel> Model(const Standard_Boolean newone = Standard_False);

		/****** XSControl_Writer::PrintStatsTransfer ******/
		/****** md5 signature: 148fec90ff7b063449e9624a36399cda ******/
		%feature("compactdefaultargs") PrintStatsTransfer;
		%feature("autodoc", "
Parameters
----------
what: int
mode: int (optional, default to 0)

Return
-------
None

Description
-----------
Prints statistics about transfer.
") PrintStatsTransfer;
		void PrintStatsTransfer(const Standard_Integer what, const Standard_Integer mode = 0);

		/****** XSControl_Writer::SetNorm ******/
		/****** md5 signature: b11f28b0f865ad413b98701b134b89de ******/
		%feature("compactdefaultargs") SetNorm;
		%feature("autodoc", "
Parameters
----------
norm: str

Return
-------
bool

Description
-----------
Sets a specific norm to <self> returns true if done, false if <norm> is not available.
") SetNorm;
		Standard_Boolean SetNorm(Standard_CString norm);

		/****** XSControl_Writer::SetWS ******/
		/****** md5 signature: 74ebce3f94d695bdeb4915fb004d07d2 ******/
		%feature("compactdefaultargs") SetWS;
		%feature("autodoc", "
Parameters
----------
WS: XSControl_WorkSession
scratch: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Sets a specific session to <self>.
") SetWS;
		void SetWS(const opencascade::handle<XSControl_WorkSession> & WS, const Standard_Boolean scratch = Standard_True);

		/****** XSControl_Writer::TransferShape ******/
		/****** md5 signature: 2fb0e8c5750985b5d30080e0c87152e4 ******/
		%feature("compactdefaultargs") TransferShape;
		%feature("autodoc", "
Parameters
----------
sh: TopoDS_Shape
mode: int (optional, default to 0)
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
IFSelect_ReturnStatus

Description
-----------
Transfers a shape according to the mode.
") TransferShape;
		IFSelect_ReturnStatus TransferShape(const TopoDS_Shape & sh, const Standard_Integer mode = 0, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** XSControl_Writer::WS ******/
		/****** md5 signature: 4d866376b023ba3185e62899810cc121 ******/
		%feature("compactdefaultargs") WS;
		%feature("autodoc", "Return
-------
opencascade::handle<XSControl_WorkSession>

Description
-----------
Returns the session used in <self>.
") WS;
		opencascade::handle<XSControl_WorkSession> WS();

		/****** XSControl_Writer::WriteFile ******/
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
Writes the produced model.
") WriteFile;
		IFSelect_ReturnStatus WriteFile(Standard_CString filename);

};


%extend XSControl_Writer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
/* class aliases */
%pythoncode {
}
/* deprecated methods */
%pythoncode {
@deprecated
def xscontrol_Session(*args):
	return xscontrol.Session(*args)

@deprecated
def xscontrol_Vars(*args):
	return xscontrol.Vars(*args)

@deprecated
def XSControl_ConnectedShapes_AdjacentEntities(*args):
	return XSControl_ConnectedShapes.AdjacentEntities(*args)

@deprecated
def XSControl_Controller_Recorded(*args):
	return XSControl_Controller.Recorded(*args)

@deprecated
def XSControl_FuncShape_FileAndVar(*args):
	return XSControl_FuncShape.FileAndVar(*args)

@deprecated
def XSControl_FuncShape_Init(*args):
	return XSControl_FuncShape.Init(*args)

@deprecated
def XSControl_FuncShape_MoreShapes(*args):
	return XSControl_FuncShape.MoreShapes(*args)

@deprecated
def XSControl_Functions_Init(*args):
	return XSControl_Functions.Init(*args)

@deprecated
def XSControl_TransferReader_PrintStatsOnList(*args):
	return XSControl_TransferReader.PrintStatsOnList(*args)

@deprecated
def XSControl_TransferReader_PrintStatsProcess(*args):
	return XSControl_TransferReader.PrintStatsProcess(*args)

}
