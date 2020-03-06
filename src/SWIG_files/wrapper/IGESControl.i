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
%define IGESCONTROLDOCSTRING
"IGESControl module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_igescontrol.html"
%enddef
%module (package="OCC.Core", docstring=IGESCONTROLDOCSTRING) IGESControl


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
#include<IGESControl_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<Transfer_module.hxx>
#include<IGESToBRep_module.hxx>
#include<XSControl_module.hxx>
#include<Interface_module.hxx>
#include<TopoDS_module.hxx>
#include<IFSelect_module.hxx>
#include<IGESData_module.hxx>
#include<Message_module.hxx>
#include<TopLoc_module.hxx>
#include<TopTools_module.hxx>
#include<IGESData_module.hxx>
#include<Geom_module.hxx>
#include<Geom2d_module.hxx>
#include<Interface_module.hxx>
#include<MoniTool_module.hxx>
#include<TColGeom_module.hxx>
#include<ShapeExtend_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import Transfer.i
%import IGESToBRep.i
%import XSControl.i
%import Interface.i
%import TopoDS.i
%import IFSelect.i
%import IGESData.i

%pythoncode {
from OCC.Core.Exception import *
};

/* public enums */
/* end public enums declaration */

/* python proy classes for enums */
%pythoncode {
};
/* end python proxy for enums */

/* handles */
%wrap_handle(IGESControl_ActorWrite)
%wrap_handle(IGESControl_AlgoContainer)
%wrap_handle(IGESControl_Controller)
%wrap_handle(IGESControl_IGESBoundary)
%wrap_handle(IGESControl_ToolContainer)
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/*******************************
* class IGESControl_ActorWrite *
*******************************/
class IGESControl_ActorWrite : public Transfer_ActorOfFinderProcess {
	public:
		/****************** IGESControl_ActorWrite ******************/
		%feature("compactdefaultargs") IGESControl_ActorWrite;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") IGESControl_ActorWrite;
		 IGESControl_ActorWrite();

		/****************** Recognize ******************/
		%feature("compactdefaultargs") Recognize;
		%feature("autodoc", "Recognizes a shapemapper.

Parameters
----------
start: Transfer_Finder

Returns
-------
bool
") Recognize;
		virtual Standard_Boolean Recognize(const opencascade::handle<Transfer_Finder> & start);

		/****************** Transfer ******************/
		%feature("compactdefaultargs") Transfer;
		%feature("autodoc", "Transfers shape to iges entities //! modetrans may be : 0 -> groups of faces or 1 -> brep.

Parameters
----------
start: Transfer_Finder
FP: Transfer_FinderProcess

Returns
-------
opencascade::handle<Transfer_Binder>
") Transfer;
		virtual opencascade::handle<Transfer_Binder> Transfer(const opencascade::handle<Transfer_Finder> & start, const opencascade::handle<Transfer_FinderProcess> & FP);

};


%make_alias(IGESControl_ActorWrite)

%extend IGESControl_ActorWrite {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class IGESControl_AlgoContainer *
**********************************/
class IGESControl_AlgoContainer : public IGESToBRep_AlgoContainer {
	public:
		/****************** IGESControl_AlgoContainer ******************/
		%feature("compactdefaultargs") IGESControl_AlgoContainer;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") IGESControl_AlgoContainer;
		 IGESControl_AlgoContainer();

};


%make_alias(IGESControl_AlgoContainer)

%extend IGESControl_AlgoContainer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class IGESControl_Controller *
*******************************/
class IGESControl_Controller : public XSControl_Controller {
	public:
		/****************** IGESControl_Controller ******************/
		%feature("compactdefaultargs") IGESControl_Controller;
		%feature("autodoc", "Initializes the use of iges norm (the first time) and returns a controller for iges-5.1 if <modefnes> is true, sets it to internal fnes format.

Parameters
----------
modefnes: bool,optional
	default value is Standard_False

Returns
-------
None
") IGESControl_Controller;
		 IGESControl_Controller(const Standard_Boolean modefnes = Standard_False);

		/****************** ActorRead ******************/
		%feature("compactdefaultargs") ActorRead;
		%feature("autodoc", "Returns the actor for read attached to the pair (norm,appli) it is an actor from igestobrep, adapted from an igesmodel : unit, tolerances.

Parameters
----------
model: Interface_InterfaceModel

Returns
-------
opencascade::handle<Transfer_ActorOfTransientProcess>
") ActorRead;
		opencascade::handle<Transfer_ActorOfTransientProcess> ActorRead(const opencascade::handle<Interface_InterfaceModel> & model);

		/****************** Customise ******************/
		%feature("compactdefaultargs") Customise;
		%feature("autodoc", "No available documentation.

Parameters
----------
WS: XSControl_WorkSession

Returns
-------
None
") Customise;
		virtual void Customise(opencascade::handle<XSControl_WorkSession> & WS);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Standard initialisation. it creates a controller for iges and records it to various names, available to select it later returns true when done, false if could not be done also, it creates and records an adaptor for fnes.

Returns
-------
bool
") Init;
		static Standard_Boolean Init();

		/****************** NewModel ******************/
		%feature("compactdefaultargs") NewModel;
		%feature("autodoc", "Creates a new empty model ready to receive data of the norm. it is taken from iges template model.

Returns
-------
opencascade::handle<Interface_InterfaceModel>
") NewModel;
		opencascade::handle<Interface_InterfaceModel> NewModel();

		/****************** TransferWriteShape ******************/
		%feature("compactdefaultargs") TransferWriteShape;
		%feature("autodoc", "Takes one shape and transfers it to the interfacemodel (already created by newmodel for instance) <modetrans> is to be interpreted by each kind of xstepadaptor returns a status : 0 ok 1 no result 2 fail -1 bad modeshape -2 bad model (requires an igesmodel) modeshape : 0 groupe of face (version < 5.1) 1 brep-version 5.1 of iges.

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

};


%make_alias(IGESControl_Controller)

%extend IGESControl_Controller {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class IGESControl_IGESBoundary *
*********************************/
class IGESControl_IGESBoundary : public IGESToBRep_IGESBoundary {
	public:
		/****************** IGESControl_IGESBoundary ******************/
		%feature("compactdefaultargs") IGESControl_IGESBoundary;
		%feature("autodoc", "Creates an object and calls inherited constuctor.

Returns
-------
None
") IGESControl_IGESBoundary;
		 IGESControl_IGESBoundary();

		/****************** IGESControl_IGESBoundary ******************/
		%feature("compactdefaultargs") IGESControl_IGESBoundary;
		%feature("autodoc", "Creates an object and calls inherited constuctor.

Parameters
----------
CS: IGESToBRep_CurveAndSurface

Returns
-------
None
") IGESControl_IGESBoundary;
		 IGESControl_IGESBoundary(const IGESToBRep_CurveAndSurface & CS);

		/****************** Check ******************/
		%feature("compactdefaultargs") Check;
		%feature("autodoc", "Checks result of translation of iges boundary entities (types 141, 142 or 508). checks consistency of 2d and 3d representations and keeps only one if they are inconsistent. checks the closure of resulting wire and if it is not closed, checks 2d and 3d representation and updates the resulting wire to contain only closed representation.

Parameters
----------
result: bool
checkclosure: bool
okCurve3d: bool
okCurve2d: bool

Returns
-------
None
") Check;
		virtual void Check(const Standard_Boolean result, const Standard_Boolean checkclosure, const Standard_Boolean okCurve3d, const Standard_Boolean okCurve2d);

};


%make_alias(IGESControl_IGESBoundary)

%extend IGESControl_IGESBoundary {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class IGESControl_Reader *
***************************/
class IGESControl_Reader : public XSControl_Reader {
	public:
		/****************** IGESControl_Reader ******************/
		%feature("compactdefaultargs") IGESControl_Reader;
		%feature("autodoc", "Creates a reader from scratch.

Returns
-------
None
") IGESControl_Reader;
		 IGESControl_Reader();

		/****************** IGESControl_Reader ******************/
		%feature("compactdefaultargs") IGESControl_Reader;
		%feature("autodoc", "Creates a reader from an already existing session.

Parameters
----------
WS: XSControl_WorkSession
scratch: bool,optional
	default value is Standard_True

Returns
-------
None
") IGESControl_Reader;
		 IGESControl_Reader(const opencascade::handle<XSControl_WorkSession> & WS, const Standard_Boolean scratch = Standard_True);

		/****************** GetReadVisible ******************/
		%feature("compactdefaultargs") GetReadVisible;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") GetReadVisible;
		Standard_Boolean GetReadVisible();

		/****************** IGESModel ******************/
		%feature("compactdefaultargs") IGESModel;
		%feature("autodoc", "Returns the model as a igesmodel. it can then be consulted (header, product).

Returns
-------
opencascade::handle<IGESData_IGESModel>
") IGESModel;
		opencascade::handle<IGESData_IGESModel> IGESModel();

		/****************** NbRootsForTransfer ******************/
		%feature("compactdefaultargs") NbRootsForTransfer;
		%feature("autodoc", "Determines the list of root entities from model which are candidate for a transfer to a shape (type of entities is product) <thereadonlyvisible> is taken into account to define roots.

Returns
-------
int
") NbRootsForTransfer;
		virtual Standard_Integer NbRootsForTransfer();

		/****************** PrintTransferInfo ******************/
		%feature("compactdefaultargs") PrintTransferInfo;
		%feature("autodoc", "Prints statistics and check list for transfer.

Parameters
----------
failwarn: IFSelect_PrintFail
mode: IFSelect_PrintCount

Returns
-------
None
") PrintTransferInfo;
		void PrintTransferInfo(const IFSelect_PrintFail failwarn, const IFSelect_PrintCount mode);

		/****************** SetReadVisible ******************/
		%feature("compactdefaultargs") SetReadVisible;
		%feature("autodoc", "Set the transion of all roots (if thereadonlyvisible is false) or of visible roots (if thereadonlyvisible is true).

Parameters
----------
ReadRoot: bool

Returns
-------
None
") SetReadVisible;
		void SetReadVisible(const Standard_Boolean ReadRoot);

};


%extend IGESControl_Reader {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class IGESControl_ToolContainer *
**********************************/
class IGESControl_ToolContainer : public IGESToBRep_ToolContainer {
	public:
		/****************** IGESControl_ToolContainer ******************/
		%feature("compactdefaultargs") IGESControl_ToolContainer;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") IGESControl_ToolContainer;
		 IGESControl_ToolContainer();

		/****************** IGESBoundary ******************/
		%feature("compactdefaultargs") IGESBoundary;
		%feature("autodoc", "Returns igescontrol_igesboundary.

Returns
-------
opencascade::handle<IGESToBRep_IGESBoundary>
") IGESBoundary;
		virtual opencascade::handle<IGESToBRep_IGESBoundary> IGESBoundary();

};


%make_alias(IGESControl_ToolContainer)

%extend IGESControl_ToolContainer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class IGESControl_Writer *
***************************/
class IGESControl_Writer {
	public:
		/****************** IGESControl_Writer ******************/
		%feature("compactdefaultargs") IGESControl_Writer;
		%feature("autodoc", "Creates a writer object with the default unit (millimeters) and write mode (face). igescontrol_writer (const standard_cstring unit, const standard_integer modecr = 0);.

Returns
-------
None
") IGESControl_Writer;
		 IGESControl_Writer();

		/****************** IGESControl_Writer ******************/
		%feature("compactdefaultargs") IGESControl_Writer;
		%feature("autodoc", "Creates a writer with given values for units and for write mode. unit may be any unit that is accepted by the iges standard. by default, it is the millimeter. modecr defines the write mode and may be: - 0: faces (default) - 1: brep.

Parameters
----------
unit: char *
modecr: int,optional
	default value is 0

Returns
-------
None
") IGESControl_Writer;
		 IGESControl_Writer(const char * unit, const Standard_Integer modecr = 0);

		/****************** IGESControl_Writer ******************/
		%feature("compactdefaultargs") IGESControl_Writer;
		%feature("autodoc", "Creates a writer object with the prepared iges model model in write mode. modecr defines the write mode and may be: - 0: faces (default) - 1: brep.

Parameters
----------
model: IGESData_IGESModel
modecr: int,optional
	default value is 0

Returns
-------
None
") IGESControl_Writer;
		 IGESControl_Writer(const opencascade::handle<IGESData_IGESModel> & model, const Standard_Integer modecr = 0);

		/****************** AddEntity ******************/
		%feature("compactdefaultargs") AddEntity;
		%feature("autodoc", "Adds an iges entity (and the ones it references) to the model.

Parameters
----------
ent: IGESData_IGESEntity

Returns
-------
bool
") AddEntity;
		Standard_Boolean AddEntity(const opencascade::handle<IGESData_IGESEntity> & ent);

		/****************** AddGeom ******************/
		%feature("compactdefaultargs") AddGeom;
		%feature("autodoc", "Translates a geometry (surface or curve) to iges entities and adds them to the model returns true if done, false if geom is neither a surface or a curve suitable for iges or is null.

Parameters
----------
geom: Standard_Transient

Returns
-------
bool
") AddGeom;
		Standard_Boolean AddGeom(const opencascade::handle<Standard_Transient> & geom);

		/****************** AddShape ******************/
		%feature("compactdefaultargs") AddShape;
		%feature("autodoc", "Translates a shape to iges entities and adds them to the model returns true if done, false if shape not suitable for iges or null.

Parameters
----------
sh: TopoDS_Shape

Returns
-------
bool
") AddShape;
		Standard_Boolean AddShape(const TopoDS_Shape & sh);

		/****************** ComputeModel ******************/
		%feature("compactdefaultargs") ComputeModel;
		%feature("autodoc", "Computes the entities found in the model, which is ready to be written. this contrasts with the default computation of headers only.

Returns
-------
None
") ComputeModel;
		void ComputeModel();

		/****************** Model ******************/
		%feature("compactdefaultargs") Model;
		%feature("autodoc", "Returns the iges model to be written in output.

Returns
-------
opencascade::handle<IGESData_IGESModel>
") Model;
		const opencascade::handle<IGESData_IGESModel> & Model();

		/****************** SetTransferProcess ******************/
		%feature("compactdefaultargs") SetTransferProcess;
		%feature("autodoc", "Returns/sets the transferprocess : it contains final results and if some, check messages.

Parameters
----------
TP: Transfer_FinderProcess

Returns
-------
None
") SetTransferProcess;
		void SetTransferProcess(const opencascade::handle<Transfer_FinderProcess> & TP);

		/****************** TransferProcess ******************/
		%feature("compactdefaultargs") TransferProcess;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Transfer_FinderProcess>
") TransferProcess;
		const opencascade::handle<Transfer_FinderProcess> & TransferProcess();

		/****************** Write ******************/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "Prepares and writes an iges model either to an ostream, s or to a file name,cstring. returns true if the operation was performed correctly and false if an error occurred (for instance, if the processor could not create the file).

Parameters
----------
file: char *
fnes: bool,optional
	default value is Standard_False

Returns
-------
bool
") Write;
		Standard_Boolean Write(const char * file, const Standard_Boolean fnes = Standard_False);

};


%extend IGESControl_Writer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
