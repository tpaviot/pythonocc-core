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
/* public enums */
/* end public enums declaration */

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
		%feature("autodoc", ":rtype: None") IGESControl_ActorWrite;
		 IGESControl_ActorWrite ();

		/****************** Recognize ******************/
		%feature("compactdefaultargs") Recognize;
		%feature("autodoc", "* Recognizes a ShapeMapper
	:param start:
	:type start: Transfer_Finder
	:rtype: bool") Recognize;
		virtual Standard_Boolean Recognize (const opencascade::handle<Transfer_Finder> & start);

		/****************** Transfer ******************/
		%feature("compactdefaultargs") Transfer;
		%feature("autodoc", "* Transfers Shape to IGES Entities //! ModeTrans may be : 0 -> groups of Faces or 1 -> BRep
	:param start:
	:type start: Transfer_Finder
	:param FP:
	:type FP: Transfer_FinderProcess
	:rtype: opencascade::handle<Transfer_Binder>") Transfer;
		virtual opencascade::handle<Transfer_Binder> Transfer (const opencascade::handle<Transfer_Finder> & start,const opencascade::handle<Transfer_FinderProcess> & FP);

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
		%feature("autodoc", "* Empty constructor
	:rtype: None") IGESControl_AlgoContainer;
		 IGESControl_AlgoContainer ();

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
		/****************** ActorRead ******************/
		%feature("compactdefaultargs") ActorRead;
		%feature("autodoc", "* Returns the Actor for Read attached to the pair (norm,appli) It is an Actor from IGESToBRep, adapted from an IGESModel : Unit, tolerances
	:param model:
	:type model: Interface_InterfaceModel
	:rtype: opencascade::handle<Transfer_ActorOfTransientProcess>") ActorRead;
		opencascade::handle<Transfer_ActorOfTransientProcess> ActorRead (const opencascade::handle<Interface_InterfaceModel> & model);

		/****************** Customise ******************/
		%feature("compactdefaultargs") Customise;
		%feature("autodoc", ":param WS:
	:type WS: XSControl_WorkSession
	:rtype: void") Customise;
		virtual void Customise (opencascade::handle<XSControl_WorkSession> & WS);

		/****************** IGESControl_Controller ******************/
		%feature("compactdefaultargs") IGESControl_Controller;
		%feature("autodoc", "* Initializes the use of IGES Norm (the first time) and returns a Controller for IGES-5.1 If <modefnes> is True, sets it to internal FNES format
	:param modefnes: default value is Standard_False
	:type modefnes: bool
	:rtype: None") IGESControl_Controller;
		 IGESControl_Controller (const Standard_Boolean modefnes = Standard_False);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Standard Initialisation. It creates a Controller for IGES and records it to various names, available to select it later Returns True when done, False if could not be done Also, it creates and records an Adaptor for FNES
	:rtype: bool") Init;
		static Standard_Boolean Init ();

		/****************** NewModel ******************/
		%feature("compactdefaultargs") NewModel;
		%feature("autodoc", "* Creates a new empty Model ready to receive data of the Norm. It is taken from IGES Template Model
	:rtype: opencascade::handle<Interface_InterfaceModel>") NewModel;
		opencascade::handle<Interface_InterfaceModel> NewModel ();

		/****************** TransferWriteShape ******************/
		%feature("compactdefaultargs") TransferWriteShape;
		%feature("autodoc", "* Takes one Shape and transfers it to the InterfaceModel (already created by NewModel for instance) <modetrans> is to be interpreted by each kind of XstepAdaptor Returns a status : 0 OK 1 No result 2 Fail -1 bad modeshape -2 bad model (requires an IGESModel) modeshape : 0 groupe of face (version < 5.1) 1 BREP-version 5.1 of IGES
	:param shape:
	:type shape: TopoDS_Shape
	:param FP:
	:type FP: Transfer_FinderProcess
	:param model:
	:type model: Interface_InterfaceModel
	:param modetrans: default value is 0
	:type modetrans: int
	:rtype: IFSelect_ReturnStatus") TransferWriteShape;
		virtual IFSelect_ReturnStatus TransferWriteShape (const TopoDS_Shape & shape,const opencascade::handle<Transfer_FinderProcess> & FP,const opencascade::handle<Interface_InterfaceModel> & model,const Standard_Integer modetrans = 0);

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
		/****************** Check ******************/
		%feature("compactdefaultargs") Check;
		%feature("autodoc", "* Checks result of translation of IGES boundary entities (types 141, 142 or 508). Checks consistency of 2D and 3D representations and keeps only one if they are inconsistent. Checks the closure of resulting wire and if it is not closed, checks 2D and 3D representation and updates the resulting wire to contain only closed representation.
	:param result:
	:type result: bool
	:param checkclosure:
	:type checkclosure: bool
	:param okCurve3d:
	:type okCurve3d: bool
	:param okCurve2d:
	:type okCurve2d: bool
	:rtype: void") Check;
		virtual void Check (const Standard_Boolean result,const Standard_Boolean checkclosure,const Standard_Boolean okCurve3d,const Standard_Boolean okCurve2d);

		/****************** IGESControl_IGESBoundary ******************/
		%feature("compactdefaultargs") IGESControl_IGESBoundary;
		%feature("autodoc", "* Creates an object and calls inherited constuctor.
	:rtype: None") IGESControl_IGESBoundary;
		 IGESControl_IGESBoundary ();

		/****************** IGESControl_IGESBoundary ******************/
		%feature("compactdefaultargs") IGESControl_IGESBoundary;
		%feature("autodoc", "* Creates an object and calls inherited constuctor.
	:param CS:
	:type CS: IGESToBRep_CurveAndSurface
	:rtype: None") IGESControl_IGESBoundary;
		 IGESControl_IGESBoundary (const IGESToBRep_CurveAndSurface & CS);

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
		/****************** GetReadVisible ******************/
		%feature("compactdefaultargs") GetReadVisible;
		%feature("autodoc", ":rtype: bool") GetReadVisible;
		Standard_Boolean GetReadVisible ();

		/****************** IGESControl_Reader ******************/
		%feature("compactdefaultargs") IGESControl_Reader;
		%feature("autodoc", "* Creates a Reader from scratch
	:rtype: None") IGESControl_Reader;
		 IGESControl_Reader ();

		/****************** IGESControl_Reader ******************/
		%feature("compactdefaultargs") IGESControl_Reader;
		%feature("autodoc", "* Creates a Reader from an already existing Session
	:param WS:
	:type WS: XSControl_WorkSession
	:param scratch: default value is Standard_True
	:type scratch: bool
	:rtype: None") IGESControl_Reader;
		 IGESControl_Reader (const opencascade::handle<XSControl_WorkSession> & WS,const Standard_Boolean scratch = Standard_True);

		/****************** IGESModel ******************/
		%feature("compactdefaultargs") IGESModel;
		%feature("autodoc", "* Returns the model as a IGESModel. It can then be consulted (header, product)
	:rtype: opencascade::handle<IGESData_IGESModel>") IGESModel;
		opencascade::handle<IGESData_IGESModel> IGESModel ();

		/****************** NbRootsForTransfer ******************/
		%feature("compactdefaultargs") NbRootsForTransfer;
		%feature("autodoc", "* Determines the list of root entities from Model which are candidate for a transfer to a Shape (type of entities is PRODUCT) <theReadOnlyVisible> is taken into account to define roots
	:rtype: int") NbRootsForTransfer;
		virtual Standard_Integer NbRootsForTransfer ();

		/****************** PrintTransferInfo ******************/
		%feature("compactdefaultargs") PrintTransferInfo;
		%feature("autodoc", "* Prints Statistics and check list for Transfer
	:param failwarn:
	:type failwarn: IFSelect_PrintFail
	:param mode:
	:type mode: IFSelect_PrintCount
	:rtype: None") PrintTransferInfo;
		void PrintTransferInfo (const IFSelect_PrintFail failwarn,const IFSelect_PrintCount mode);

		/****************** SetReadVisible ******************/
		%feature("compactdefaultargs") SetReadVisible;
		%feature("autodoc", "* Set the transion of ALL Roots (if theReadOnlyVisible is False) or of Visible Roots (if theReadOnlyVisible is True)
	:param ReadRoot:
	:type ReadRoot: bool
	:rtype: None") SetReadVisible;
		void SetReadVisible (const Standard_Boolean ReadRoot);

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
		/****************** IGESBoundary ******************/
		%feature("compactdefaultargs") IGESBoundary;
		%feature("autodoc", "* Returns IGESControl_IGESBoundary
	:rtype: opencascade::handle<IGESToBRep_IGESBoundary>") IGESBoundary;
		virtual opencascade::handle<IGESToBRep_IGESBoundary> IGESBoundary ();

		/****************** IGESControl_ToolContainer ******************/
		%feature("compactdefaultargs") IGESControl_ToolContainer;
		%feature("autodoc", "* Empty constructor
	:rtype: None") IGESControl_ToolContainer;
		 IGESControl_ToolContainer ();

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
		/****************** AddEntity ******************/
		%feature("compactdefaultargs") AddEntity;
		%feature("autodoc", "* Adds an IGES entity (and the ones it references) to the model
	:param ent:
	:type ent: IGESData_IGESEntity
	:rtype: bool") AddEntity;
		Standard_Boolean AddEntity (const opencascade::handle<IGESData_IGESEntity> & ent);

		/****************** AddGeom ******************/
		%feature("compactdefaultargs") AddGeom;
		%feature("autodoc", "* Translates a Geometry (Surface or Curve) to IGES Entities and adds them to the model Returns True if done, False if geom is neither a Surface or a Curve suitable for IGES or is null
	:param geom:
	:type geom: Standard_Transient
	:rtype: bool") AddGeom;
		Standard_Boolean AddGeom (const opencascade::handle<Standard_Transient> & geom);

		/****************** AddShape ******************/
		%feature("compactdefaultargs") AddShape;
		%feature("autodoc", "* Translates a Shape to IGES Entities and adds them to the model Returns True if done, False if Shape not suitable for IGES or null
	:param sh:
	:type sh: TopoDS_Shape
	:rtype: bool") AddShape;
		Standard_Boolean AddShape (const TopoDS_Shape & sh);

		/****************** ComputeModel ******************/
		%feature("compactdefaultargs") ComputeModel;
		%feature("autodoc", "* Computes the entities found in the model, which is ready to be written. This contrasts with the default computation of headers only.
	:rtype: None") ComputeModel;
		void ComputeModel ();

		/****************** IGESControl_Writer ******************/
		%feature("compactdefaultargs") IGESControl_Writer;
		%feature("autodoc", "* Creates a writer object with the default unit (millimeters) and write mode (Face). IGESControl_Writer (const Standard_CString unit, const Standard_Integer modecr = 0);
	:rtype: None") IGESControl_Writer;
		 IGESControl_Writer ();

		/****************** IGESControl_Writer ******************/
		%feature("compactdefaultargs") IGESControl_Writer;
		%feature("autodoc", "* Creates a writer with given values for units and for write mode. unit may be any unit that is accepted by the IGES standard. By default, it is the millimeter. modecr defines the write mode and may be: - 0: Faces (default) - 1: BRep.
	:param unit:
	:type unit: char *
	:param modecr: default value is 0
	:type modecr: int
	:rtype: None") IGESControl_Writer;
		 IGESControl_Writer (const char * unit,const Standard_Integer modecr = 0);

		/****************** IGESControl_Writer ******************/
		%feature("compactdefaultargs") IGESControl_Writer;
		%feature("autodoc", "* Creates a writer object with the prepared IGES model model in write mode. modecr defines the write mode and may be: - 0: Faces (default) - 1: BRep.
	:param model:
	:type model: IGESData_IGESModel
	:param modecr: default value is 0
	:type modecr: int
	:rtype: None") IGESControl_Writer;
		 IGESControl_Writer (const opencascade::handle<IGESData_IGESModel> & model,const Standard_Integer modecr = 0);

		/****************** Model ******************/
		%feature("compactdefaultargs") Model;
		%feature("autodoc", "* Returns the IGES model to be written in output.
	:rtype: opencascade::handle<IGESData_IGESModel>") Model;
		const opencascade::handle<IGESData_IGESModel> & Model ();

		/****************** SetTransferProcess ******************/
		%feature("compactdefaultargs") SetTransferProcess;
		%feature("autodoc", "* Returns/Sets the TransferProcess : it contains final results and if some, check messages
	:param TP:
	:type TP: Transfer_FinderProcess
	:rtype: None") SetTransferProcess;
		void SetTransferProcess (const opencascade::handle<Transfer_FinderProcess> & TP);

		/****************** TransferProcess ******************/
		%feature("compactdefaultargs") TransferProcess;
		%feature("autodoc", ":rtype: opencascade::handle<Transfer_FinderProcess>") TransferProcess;
		const opencascade::handle<Transfer_FinderProcess> & TransferProcess ();

		/****************** Write ******************/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "* Computes then writes the model to an OStream Returns True when done, false in case of error
	:param S:
	:type S: Standard_OStream
	:param fnes: default value is Standard_False
	:type fnes: bool
	:rtype: bool") Write;
		Standard_Boolean Write (Standard_OStream & S,const Standard_Boolean fnes = Standard_False);

		/****************** Write ******************/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "* Prepares and writes an IGES model either to an OStream, S or to a file name,CString. Returns True if the operation was performed correctly and False if an error occurred (for instance, if the processor could not create the file).
	:param file:
	:type file: char *
	:param fnes: default value is Standard_False
	:type fnes: bool
	:rtype: bool") Write;
		Standard_Boolean Write (const char * file,const Standard_Boolean fnes = Standard_False);

};


%extend IGESControl_Writer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
