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
%define IGESCONTROLDOCSTRING
"IGESControl module, see official documentation at
https://dev.opencascade.org/doc/occt-7.8.0/refman/html/package_igescontrol.html"
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
%include ../common/EnumTemplates.i
%include ../common/Operators.i
%include ../common/OccHandle.i
%include ../common/IOStream.i
%include ../common/ArrayMacros.i


%{
#include<IGESControl_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<Transfer_module.hxx>
#include<Message_module.hxx>
#include<IGESToBRep_module.hxx>
#include<XSControl_module.hxx>
#include<Interface_module.hxx>
#include<TopoDS_module.hxx>
#include<IFSelect_module.hxx>
#include<IGESData_module.hxx>
#include<DE_module.hxx>
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
#include<BRepTools_module.hxx>
#include<BRep_module.hxx>
#include<Bnd_module.hxx>
#include<TShort_module.hxx>
#include<BRepTools_module.hxx>
#include<Poly_module.hxx>
#include<TDF_module.hxx>
#include<TDocStd_module.hxx>
#include<PCDM_module.hxx>
#include<CDF_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import Transfer.i
%import Message.i
%import IGESToBRep.i
%import XSControl.i
%import Interface.i
%import TopoDS.i
%import IFSelect.i
%import IGESData.i
%import DE.i

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
		/****** IGESControl_ActorWrite::IGESControl_ActorWrite ******/
		/****** md5 signature: 0cf731ec0f97366f33459d5e21c8a07e ******/
		%feature("compactdefaultargs") IGESControl_ActorWrite;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") IGESControl_ActorWrite;
		 IGESControl_ActorWrite();

		/****** IGESControl_ActorWrite::Recognize ******/
		/****** md5 signature: c8970d8be01e43b4712b350a7b483668 ******/
		%feature("compactdefaultargs") Recognize;
		%feature("autodoc", "
Parameters
----------
start: Transfer_Finder

Return
-------
bool

Description
-----------
Recognizes a ShapeMapper.
") Recognize;
		virtual Standard_Boolean Recognize(const opencascade::handle<Transfer_Finder> & start);

		/****** IGESControl_ActorWrite::Transfer ******/
		/****** md5 signature: de55557a60f11851f77e2ae7fac24dbd ******/
		%feature("compactdefaultargs") Transfer;
		%feature("autodoc", "
Parameters
----------
start: Transfer_Finder
FP: Transfer_FinderProcess
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
opencascade::handle<Transfer_Binder>

Description
-----------
Transfers Shape to IGES Entities //! ModeTrans may be: 0 -> groups of Faces or 1 -> BRep.
") Transfer;
		virtual opencascade::handle<Transfer_Binder> Transfer(const opencascade::handle<Transfer_Finder> & start, const opencascade::handle<Transfer_FinderProcess> & FP, const Message_ProgressRange & theProgress = Message_ProgressRange());

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
		/****** IGESControl_AlgoContainer::IGESControl_AlgoContainer ******/
		/****** md5 signature: a19594f586b5eefe727ad4421b16b871 ******/
		%feature("compactdefaultargs") IGESControl_AlgoContainer;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
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
		/****** IGESControl_Controller::IGESControl_Controller ******/
		/****** md5 signature: 4a2d7445c85f2ad3ec03a228df892823 ******/
		%feature("compactdefaultargs") IGESControl_Controller;
		%feature("autodoc", "
Parameters
----------
modefnes: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Initializes the use of IGES Norm (the first time) and returns a Controller for IGES-5.1 If <modefnes> is True, sets it to internal FNES format.
") IGESControl_Controller;
		 IGESControl_Controller(const Standard_Boolean modefnes = Standard_False);

		/****** IGESControl_Controller::ActorRead ******/
		/****** md5 signature: abfcbea3d65b6d0c8061255c5c664b82 ******/
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
Returns the Actor for Read attached to the pair (norm,appli) It is an Actor from IGESToBRep, adapted from an IGESModel: Unit, tolerances.
") ActorRead;
		opencascade::handle<Transfer_ActorOfTransientProcess> ActorRead(const opencascade::handle<Interface_InterfaceModel> & model);

		/****** IGESControl_Controller::Customise ******/
		/****** md5 signature: 0ba1e38a71954b942c677f3a42125b9f ******/
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
No available documentation.
") Customise;
		virtual void Customise(opencascade::handle<XSControl_WorkSession> & WS);

		/****** IGESControl_Controller::Init ******/
		/****** md5 signature: 7a4f426a7cdbf379be5e43123bb3383c ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Standard Initialisation. It creates a Controller for IGES and records it to various names, available to select it later Returns True when done, False if could not be done Also, it creates and records an Adaptor for FNES.
") Init;
		static Standard_Boolean Init();

		/****** IGESControl_Controller::NewModel ******/
		/****** md5 signature: 91513f9ebe9e7d52eca2b6b58f6b9b0a ******/
		%feature("compactdefaultargs") NewModel;
		%feature("autodoc", "Return
-------
opencascade::handle<Interface_InterfaceModel>

Description
-----------
Creates a new empty Model ready to receive data of the Norm. It is taken from IGES Template Model.
") NewModel;
		opencascade::handle<Interface_InterfaceModel> NewModel();

		/****** IGESControl_Controller::TransferWriteShape ******/
		/****** md5 signature: 51f54ac90a57b06cb5da980be6c88b27 ******/
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
Takes one Shape and transfers it to the InterfaceModel (already created by NewModel for instance) <modetrans> is to be interpreted by each kind of XstepAdaptor Returns a status: 0 OK 1 No result 2 Fail -1 bad modeshape -2 bad model (requires an IGESModel) modeshape: 0 group of face (version < 5.1) 1 BREP-version 5.1 of IGES.
") TransferWriteShape;
		virtual IFSelect_ReturnStatus TransferWriteShape(const TopoDS_Shape & shape, const opencascade::handle<Transfer_FinderProcess> & FP, const opencascade::handle<Interface_InterfaceModel> & model, const Standard_Integer modetrans = 0, const Message_ProgressRange & theProgress = Message_ProgressRange());

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
		/****** IGESControl_IGESBoundary::IGESControl_IGESBoundary ******/
		/****** md5 signature: 6a8249df5e09395b3cfefb271474b8a2 ******/
		%feature("compactdefaultargs") IGESControl_IGESBoundary;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates an object and calls inherited constructor.
") IGESControl_IGESBoundary;
		 IGESControl_IGESBoundary();

		/****** IGESControl_IGESBoundary::IGESControl_IGESBoundary ******/
		/****** md5 signature: 855ac0be51cd07090af44a3efc88b8fa ******/
		%feature("compactdefaultargs") IGESControl_IGESBoundary;
		%feature("autodoc", "
Parameters
----------
CS: IGESToBRep_CurveAndSurface

Return
-------
None

Description
-----------
Creates an object and calls inherited constructor.
") IGESControl_IGESBoundary;
		 IGESControl_IGESBoundary(const IGESToBRep_CurveAndSurface & CS);

		/****** IGESControl_IGESBoundary::Check ******/
		/****** md5 signature: 63a886f794f138106bbc9f56c90a2734 ******/
		%feature("compactdefaultargs") Check;
		%feature("autodoc", "
Parameters
----------
result: bool
checkclosure: bool
okCurve3d: bool
okCurve2d: bool

Return
-------
None

Description
-----------
Checks result of translation of IGES boundary entities (types 141, 142 or 508). Checks consistency of 2D and 3D representations and keeps only one if they are inconsistent. Checks the closure of resulting wire and if it is not closed, checks 2D and 3D representation and updates the resulting wire to contain only closed representation.
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
		/****** IGESControl_Reader::IGESControl_Reader ******/
		/****** md5 signature: 1cdc344049166cb1943ced758e97ea88 ******/
		%feature("compactdefaultargs") IGESControl_Reader;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates a Reader from scratch.
") IGESControl_Reader;
		 IGESControl_Reader();

		/****** IGESControl_Reader::IGESControl_Reader ******/
		/****** md5 signature: 3d03711556fe1f87e36966544be93cec ******/
		%feature("compactdefaultargs") IGESControl_Reader;
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
Creates a Reader from an already existing Session.
") IGESControl_Reader;
		 IGESControl_Reader(const opencascade::handle<XSControl_WorkSession> & WS, const Standard_Boolean scratch = Standard_True);

		/****** IGESControl_Reader::GetReadVisible ******/
		/****** md5 signature: b0d62c02cb2830074d12f477e2ee93dc ******/
		%feature("compactdefaultargs") GetReadVisible;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") GetReadVisible;
		Standard_Boolean GetReadVisible();

		/****** IGESControl_Reader::IGESModel ******/
		/****** md5 signature: e167708dd2dd1824578c9ddd453217ac ******/
		%feature("compactdefaultargs") IGESModel;
		%feature("autodoc", "Return
-------
opencascade::handle<IGESData_IGESModel>

Description
-----------
Returns the model as a IGESModel. It can then be consulted (header, product).
") IGESModel;
		opencascade::handle<IGESData_IGESModel> IGESModel();

		/****** IGESControl_Reader::NbRootsForTransfer ******/
		/****** md5 signature: f207d70f9daf416ec0cdd237b676b8bd ******/
		%feature("compactdefaultargs") NbRootsForTransfer;
		%feature("autodoc", "Return
-------
int

Description
-----------
Determines the list of root entities from Model which are candidate for a transfer to a Shape (type of entities is PRODUCT) <theReadOnlyVisible> is taken into account to define roots.
") NbRootsForTransfer;
		virtual Standard_Integer NbRootsForTransfer();

		/****** IGESControl_Reader::PrintTransferInfo ******/
		/****** md5 signature: 91f0c0b4b2f5f3a830e0906bea79f1e1 ******/
		%feature("compactdefaultargs") PrintTransferInfo;
		%feature("autodoc", "
Parameters
----------
failwarn: IFSelect_PrintFail
mode: IFSelect_PrintCount

Return
-------
None

Description
-----------
Prints Statistics and check list for Transfer.
") PrintTransferInfo;
		void PrintTransferInfo(const IFSelect_PrintFail failwarn, const IFSelect_PrintCount mode);

		/****** IGESControl_Reader::SetReadVisible ******/
		/****** md5 signature: 6e2c353582827b19c2fc725abf3f500d ******/
		%feature("compactdefaultargs") SetReadVisible;
		%feature("autodoc", "
Parameters
----------
ReadRoot: bool

Return
-------
None

Description
-----------
Set the transion of ALL Roots (if theReadOnlyVisible is False) or of Visible Roots (if theReadOnlyVisible is True).
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
		/****** IGESControl_ToolContainer::IGESControl_ToolContainer ******/
		/****** md5 signature: 4fb598f4d26b8bd0dec642f171afc646 ******/
		%feature("compactdefaultargs") IGESControl_ToolContainer;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") IGESControl_ToolContainer;
		 IGESControl_ToolContainer();

		/****** IGESControl_ToolContainer::IGESBoundary ******/
		/****** md5 signature: 9caa84936e4dc6d27a8bbc4e7788560e ******/
		%feature("compactdefaultargs") IGESBoundary;
		%feature("autodoc", "Return
-------
opencascade::handle<IGESToBRep_IGESBoundary>

Description
-----------
Returns IGESControl_IGESBoundary.
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
		/****** IGESControl_Writer::IGESControl_Writer ******/
		/****** md5 signature: a2845cfdf1c5ecc1cb681cab1d387a0d ******/
		%feature("compactdefaultargs") IGESControl_Writer;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates a writer object with the default unit (millimeters) and write mode (Face). IGESControl_Writer (const Standard_CString unit, const Standard_Integer modecr = 0);.
") IGESControl_Writer;
		 IGESControl_Writer();

		/****** IGESControl_Writer::IGESControl_Writer ******/
		/****** md5 signature: d04ff9d2cacf0210b7eca7a5483ee20d ******/
		%feature("compactdefaultargs") IGESControl_Writer;
		%feature("autodoc", "
Parameters
----------
theUnit: str
theModecr: int (optional, default to 0)

Return
-------
None

Description
-----------
Creates a writer with given values for units and for write mode. theUnit may be any unit that is accepted by the IGES standard. By default, it is the millimeter. theModecr defines the write mode and may be: - 0: Faces (default) - 1: BRep.
") IGESControl_Writer;
		 IGESControl_Writer(Standard_CString theUnit, const Standard_Integer theModecr = 0);

		/****** IGESControl_Writer::IGESControl_Writer ******/
		/****** md5 signature: d5968f6cd27f43679865e819b4ab1adc ******/
		%feature("compactdefaultargs") IGESControl_Writer;
		%feature("autodoc", "
Parameters
----------
theModel: IGESData_IGESModel
theModecr: int (optional, default to 0)

Return
-------
None

Description
-----------
Creates a writer object with the prepared IGES model theModel in write mode. theModecr defines the write mode and may be: - 0: Faces (default) - 1: BRep.
") IGESControl_Writer;
		 IGESControl_Writer(const opencascade::handle<IGESData_IGESModel> & theModel, const Standard_Integer theModecr = 0);

		/****** IGESControl_Writer::AddEntity ******/
		/****** md5 signature: 96b302aaab45677671929668ae473ebb ******/
		%feature("compactdefaultargs") AddEntity;
		%feature("autodoc", "
Parameters
----------
ent: IGESData_IGESEntity

Return
-------
bool

Description
-----------
Adds an IGES entity (and the ones it references) to the model.
") AddEntity;
		Standard_Boolean AddEntity(const opencascade::handle<IGESData_IGESEntity> & ent);

		/****** IGESControl_Writer::AddGeom ******/
		/****** md5 signature: d60779c1b769b5baa3aea9da9b401686 ******/
		%feature("compactdefaultargs") AddGeom;
		%feature("autodoc", "
Parameters
----------
geom: Standard_Transient

Return
-------
bool

Description
-----------
Translates a Geometry (Surface or Curve) to IGES Entities and adds them to the model Returns True if done, False if geom is neither a Surface or a Curve suitable for IGES or is null.
") AddGeom;
		Standard_Boolean AddGeom(const opencascade::handle<Standard_Transient> & geom);

		/****** IGESControl_Writer::AddShape ******/
		/****** md5 signature: f585f65132ef5381fe2eec5704c1d251 ******/
		%feature("compactdefaultargs") AddShape;
		%feature("autodoc", "
Parameters
----------
sh: TopoDS_Shape
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
bool

Description
-----------
Translates a Shape to IGES Entities and adds them to the model Returns True if done, False if Shape not suitable for IGES or null.
") AddShape;
		Standard_Boolean AddShape(const TopoDS_Shape & sh, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** IGESControl_Writer::ComputeModel ******/
		/****** md5 signature: f42632b9add7bbc91ef59b252ab06a6f ******/
		%feature("compactdefaultargs") ComputeModel;
		%feature("autodoc", "Return
-------
None

Description
-----------
Computes the entities found in the model, which is ready to be written. This contrasts with the default computation of headers only.
") ComputeModel;
		void ComputeModel();

		/****** IGESControl_Writer::GetShapeFixParameters ******/
		/****** md5 signature: a0fc3d423114840977f6d586006cd67d ******/
		%feature("compactdefaultargs") GetShapeFixParameters;
		%feature("autodoc", "Return
-------
XSAlgo_ShapeProcessor::ParameterMap

Description
-----------
Returns parameters for shape processing that was set by SetParameters() method. 
Return: the parameters for shape processing. Empty map if no parameters were set.
") GetShapeFixParameters;
		const XSAlgo_ShapeProcessor::ParameterMap & GetShapeFixParameters();

		/****** IGESControl_Writer::GetShapeProcessFlags ******/
		/****** md5 signature: 154ac0ed4a5b957edb90a1bb81c83699 ******/
		%feature("compactdefaultargs") GetShapeProcessFlags;
		%feature("autodoc", "Return
-------
ShapeProcess::OperationsFlags

Description
-----------
Returns flags defining operations to be performed on shapes. 
Return: The flags defining operations to be performed on shapes.
") GetShapeProcessFlags;
		const ShapeProcess::OperationsFlags & GetShapeProcessFlags();

		/****** IGESControl_Writer::Model ******/
		/****** md5 signature: 54e64da25794d18e634c0083272d2677 ******/
		%feature("compactdefaultargs") Model;
		%feature("autodoc", "Return
-------
opencascade::handle<IGESData_IGESModel>

Description
-----------
Returns the IGES model to be written in output.
") Model;
		const opencascade::handle<IGESData_IGESModel> & Model();

		/****** IGESControl_Writer::SetShapeFixParameters ******/
		/****** md5 signature: c121f0c1a1bbbaa2d7732f28ec6b14f9 ******/
		%feature("compactdefaultargs") SetShapeFixParameters;
		%feature("autodoc", "
Parameters
----------
theParameters: XSAlgo_ShapeProcessor::ParameterMap

Return
-------
None

Description
-----------
Sets parameters for shape processing. 
Parameter theParameters the parameters for shape processing.
") SetShapeFixParameters;
		void SetShapeFixParameters(const XSAlgo_ShapeProcessor::ParameterMap & theParameters);

		/****** IGESControl_Writer::SetShapeFixParameters ******/
		/****** md5 signature: 1db31276bf8a0d249a8011e0955a53e7 ******/
		%feature("compactdefaultargs") SetShapeFixParameters;
		%feature("autodoc", "
Parameters
----------
theParameters: XSAlgo_ShapeProcessor::ParameterMap

Return
-------
None

Description
-----------
Sets parameters for shape processing. Parameters are moved from the input map. 
Parameter theParameters the parameters for shape processing.
") SetShapeFixParameters;
		void SetShapeFixParameters(XSAlgo_ShapeProcessor::ParameterMap & theParameters);

		/****** IGESControl_Writer::SetShapeFixParameters ******/
		/****** md5 signature: e895be254466ec0dab7446ab439d8103 ******/
		%feature("compactdefaultargs") SetShapeFixParameters;
		%feature("autodoc", "
Parameters
----------
theParameters: DE_ShapeFixParameters
theAdditionalParameters: XSAlgo_ShapeProcessor::ParameterMap (optional, default to {})

Return
-------
None

Description
-----------
Sets parameters for shape processing. Parameters from @p theParameters are copied to the internal map. Parameters from @p theAdditionalParameters are copied to the internal map if they are not present in @p theParameters. 
Parameter theParameters the parameters for shape processing. 
Parameter theAdditionalParameters the additional parameters for shape processing.
") SetShapeFixParameters;
		void SetShapeFixParameters(const DE_ShapeFixParameters & theParameters, const XSAlgo_ShapeProcessor::ParameterMap & theAdditionalParameters = {});

		/****** IGESControl_Writer::SetShapeProcessFlags ******/
		/****** md5 signature: 8994bc61257c564f18dec11d989eee9a ******/
		%feature("compactdefaultargs") SetShapeProcessFlags;
		%feature("autodoc", "
Parameters
----------
theFlags: ShapeProcess::OperationsFlags

Return
-------
None

Description
-----------
Sets flags defining operations to be performed on shapes. 
Parameter theFlags The flags defining operations to be performed on shapes.
") SetShapeProcessFlags;
		void SetShapeProcessFlags(const ShapeProcess::OperationsFlags & theFlags);

		/****** IGESControl_Writer::SetTransferProcess ******/
		/****** md5 signature: 394e6897916330e96d19d5eee777e7a1 ******/
		%feature("compactdefaultargs") SetTransferProcess;
		%feature("autodoc", "
Parameters
----------
TP: Transfer_FinderProcess

Return
-------
None

Description
-----------
Returns/Sets the TransferProcess: it contains final results and if some, check messages.
") SetTransferProcess;
		void SetTransferProcess(const opencascade::handle<Transfer_FinderProcess> & TP);

		/****** IGESControl_Writer::TransferProcess ******/
		/****** md5 signature: 933b99b287d77d9fd268e59ac93d2a13 ******/
		%feature("compactdefaultargs") TransferProcess;
		%feature("autodoc", "Return
-------
opencascade::handle<Transfer_FinderProcess>

Description
-----------
No available documentation.
") TransferProcess;
		const opencascade::handle<Transfer_FinderProcess> & TransferProcess();

		/****** IGESControl_Writer::Write ******/
		/****** md5 signature: 641c31af3cf254e70aab3e12c5732d18 ******/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "
Parameters
----------
fnes: bool (optional, default to Standard_False)

Return
-------
S: Standard_OStream

Description
-----------
Computes then writes the model to an OStream Returns True when done, false in case of error.
") Write;
		Standard_Boolean Write(std::ostream &OutValue, const Standard_Boolean fnes = Standard_False);

		/****** IGESControl_Writer::Write ******/
		/****** md5 signature: 336d0511a9ae227341af6444cb65363f ******/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "
Parameters
----------
file: str
fnes: bool (optional, default to Standard_False)

Return
-------
bool

Description
-----------
Prepares and writes an IGES model either to an OStream, S or to a file name,CString. Returns True if the operation was performed correctly and False if an error occurred (for instance, if the processor could not create the file).
") Write;
		Standard_Boolean Write(Standard_CString file, const Standard_Boolean fnes = Standard_False);

};


%extend IGESControl_Writer {
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
def IGESControl_Controller_Init(*args):
	return IGESControl_Controller.Init(*args)

}
