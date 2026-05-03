/*
Copyright 2008-2025 Thomas Paviot (tpaviot@gmail.com)

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
%define STEPCONTROLDOCSTRING
"STEPControl module, see official documentation at
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_stepcontrol.html"
%enddef
%module (package="OCC.Core", docstring=STEPCONTROLDOCSTRING) STEPControl


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
#include<STEPControl_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<Transfer_module.hxx>
#include<Interface_module.hxx>
#include<StepRepr_module.hxx>
#include<gp_module.hxx>
#include<StepData_module.hxx>
#include<StepGeom_module.hxx>
#include<Message_module.hxx>
#include<TopoDS_module.hxx>
#include<StepShape_module.hxx>
#include<XSControl_module.hxx>
#include<IFSelect_module.hxx>
#include<DE_module.hxx>
#include<Message_module.hxx>
#include<TopLoc_module.hxx>
#include<StepBasic_module.hxx>
#include<Transfer_module.hxx>
#include<Geom2d_module.hxx>
#include<Geom_module.hxx>
#include<Interface_module.hxx>
#include<MoniTool_module.hxx>
#include<Resource_module.hxx>
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
%import Interface.i
%import StepRepr.i
%import gp.i
%import StepData.i
%import StepGeom.i
%import Message.i
%import TopoDS.i
%import StepShape.i
%import XSControl.i
%import IFSelect.i
%import DE.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
enum STEPControl_StepModelType {
	STEPControl_AsIs = 0,
	STEPControl_ManifoldSolidBrep = 1,
	STEPControl_BrepWithVoids = 2,
	STEPControl_FacetedBrep = 3,
	STEPControl_FacetedBrepAndBrepWithVoids = 4,
	STEPControl_ShellBasedSurfaceModel = 5,
	STEPControl_GeometricCurveSet = 6,
	STEPControl_Hybrid = 7,
};

/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {

class STEPControl_StepModelType(IntEnum):
	STEPControl_AsIs = 0
	STEPControl_ManifoldSolidBrep = 1
	STEPControl_BrepWithVoids = 2
	STEPControl_FacetedBrep = 3
	STEPControl_FacetedBrepAndBrepWithVoids = 4
	STEPControl_ShellBasedSurfaceModel = 5
	STEPControl_GeometricCurveSet = 6
	STEPControl_Hybrid = 7
STEPControl_AsIs = STEPControl_StepModelType.STEPControl_AsIs
STEPControl_ManifoldSolidBrep = STEPControl_StepModelType.STEPControl_ManifoldSolidBrep
STEPControl_BrepWithVoids = STEPControl_StepModelType.STEPControl_BrepWithVoids
STEPControl_FacetedBrep = STEPControl_StepModelType.STEPControl_FacetedBrep
STEPControl_FacetedBrepAndBrepWithVoids = STEPControl_StepModelType.STEPControl_FacetedBrepAndBrepWithVoids
STEPControl_ShellBasedSurfaceModel = STEPControl_StepModelType.STEPControl_ShellBasedSurfaceModel
STEPControl_GeometricCurveSet = STEPControl_StepModelType.STEPControl_GeometricCurveSet
STEPControl_Hybrid = STEPControl_StepModelType.STEPControl_Hybrid
};
/* end python proxy for enums */

/* handles */
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/******************************
* class STEPControl_ActorRead *
******************************/
class STEPControl_ActorRead : public Transfer_ActorOfTransientProcess {
	public:
		/****** STEPControl_ActorRead::STEPControl_ActorRead ******/
		/****** md5 signature: 3db9995490b830cc7f74e7be7a6678ca ******/
		%feature("compactdefaultargs") STEPControl_ActorRead;
		%feature("autodoc", "
Parameters
----------
theModel: Interface_InterfaceModel

Return
-------
None

Description
-----------
No available documentation.
") STEPControl_ActorRead;
		 STEPControl_ActorRead(const opencascade::handle<Interface_InterfaceModel> & theModel);

		/****** STEPControl_ActorRead::ComputeSRRWT ******/
		/****** md5 signature: 2720cb50ca2341d65eeb9214beca2e13 ******/
		%feature("compactdefaultargs") ComputeSRRWT;
		%feature("autodoc", "
Parameters
----------
SRR: StepRepr_RepresentationRelationship
TP: Transfer_TransientProcess
Trsf: gp_Trsf
theLocalFactors: StepData_Factors (optional, default to StepData_Factors())

Return
-------
bool

Description
-----------
Computes transformation defined by given REPRESENTATION_RELATIONSHIP_WITH_TRANSFORMATION.
") ComputeSRRWT;
		bool ComputeSRRWT(const opencascade::handle<StepRepr_RepresentationRelationship> & SRR, const opencascade::handle<Transfer_TransientProcess> & TP, gp_Trsf & Trsf, const StepData_Factors & theLocalFactors = StepData_Factors());

		/****** STEPControl_ActorRead::ComputeTransformation ******/
		/****** md5 signature: b4eb82cc79599d7c7eee64eb09ba01bb ******/
		%feature("compactdefaultargs") ComputeTransformation;
		%feature("autodoc", "
Parameters
----------
Origin: StepGeom_Axis2Placement3d
Target: StepGeom_Axis2Placement3d
OrigContext: StepRepr_Representation
TargContext: StepRepr_Representation
TP: Transfer_TransientProcess
Trsf: gp_Trsf
theLocalFactors: StepData_Factors (optional, default to StepData_Factors())

Return
-------
bool

Description
-----------
Computes transformation defined by two axis placements (in MAPPED_ITEM or ITEM_DEFINED_TRANSFORMATION) taking into account their representation contexts (i.e. units, which may be different) Returns True if transformation is computed and is not an identity.
") ComputeTransformation;
		bool ComputeTransformation(const opencascade::handle<StepGeom_Axis2Placement3d> & Origin, const opencascade::handle<StepGeom_Axis2Placement3d> & Target, const opencascade::handle<StepRepr_Representation> & OrigContext, const opencascade::handle<StepRepr_Representation> & TargContext, const opencascade::handle<Transfer_TransientProcess> & TP, gp_Trsf & Trsf, const StepData_Factors & theLocalFactors = StepData_Factors());

		/****** STEPControl_ActorRead::PrepareUnits ******/
		/****** md5 signature: 63ce94b1126b9c64ca3da9ab4aa6183a ******/
		%feature("compactdefaultargs") PrepareUnits;
		%feature("autodoc", "
Parameters
----------
rep: StepRepr_Representation
TP: Transfer_TransientProcess
theLocalFactors: StepData_Factors

Return
-------
None

Description
-----------
set units and tolerances context by given ShapeRepresentation.
") PrepareUnits;
		void PrepareUnits(const opencascade::handle<StepRepr_Representation> & rep, const opencascade::handle<Transfer_TransientProcess> & TP, StepData_Factors & theLocalFactors);

		/****** STEPControl_ActorRead::Recognize ******/
		/****** md5 signature: bcae82f639847fbe8e373aacd64b0811 ******/
		%feature("compactdefaultargs") Recognize;
		%feature("autodoc", "
Parameters
----------
start: Standard_Transient

Return
-------
bool

Description
-----------
No available documentation.
") Recognize;
		bool Recognize(const opencascade::handle<Standard_Transient> & start);

		/****** STEPControl_ActorRead::ResetUnits ******/
		/****** md5 signature: a0b09e1ed6a2f0865c1e73f3530108c8 ******/
		%feature("compactdefaultargs") ResetUnits;
		%feature("autodoc", "
Parameters
----------
theModel: StepData_StepModel
theLocalFactors: StepData_Factors

Return
-------
None

Description
-----------
reset units and tolerances context to default (mm, radians, read.precision.val, etc.).
") ResetUnits;
		void ResetUnits(const opencascade::handle<StepData_StepModel> & theModel, StepData_Factors & theLocalFactors);

		/****** STEPControl_ActorRead::SetModel ******/
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
Set model.
") SetModel;
		void SetModel(const opencascade::handle<Interface_InterfaceModel> & theModel);

		/****** STEPControl_ActorRead::Transfer ******/
		/****** md5 signature: 16f43cec6d8271b86ded98edf3beebd6 ******/
		%feature("compactdefaultargs") Transfer;
		%feature("autodoc", "
Parameters
----------
start: Standard_Transient
TP: Transfer_TransientProcess
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
opencascade::handle<Transfer_Binder>

Description
-----------
No available documentation.
") Transfer;
		opencascade::handle<Transfer_Binder> Transfer(const opencascade::handle<Standard_Transient> & start, const opencascade::handle<Transfer_TransientProcess> & TP, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** STEPControl_ActorRead::TransferShape ******/
		/****** md5 signature: efbf5ad535d27056ac5c1ffe41e7700d ******/
		%feature("compactdefaultargs") TransferShape;
		%feature("autodoc", "
Parameters
----------
start: Standard_Transient
TP: Transfer_TransientProcess
theLocalFactors: StepData_Factors (optional, default to StepData_Factors())
isManifold: bool (optional, default to true)
theUseTrsf: bool (optional, default to false)
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
opencascade::handle<Transfer_Binder>

Description
-----------
theUseTrsf - special flag for using Axis2Placement from ShapeRepresentation for transform root shape.
") TransferShape;
		opencascade::handle<Transfer_Binder> TransferShape(const opencascade::handle<Standard_Transient> & start, const opencascade::handle<Transfer_TransientProcess> & TP, const StepData_Factors & theLocalFactors = StepData_Factors(), const bool isManifold = true, const bool theUseTrsf = false, const Message_ProgressRange & theProgress = Message_ProgressRange());

};


%extend STEPControl_ActorRead {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class STEPControl_ActorWrite *
*******************************/
class STEPControl_ActorWrite : public Transfer_ActorOfFinderProcess {
	public:
		/****** STEPControl_ActorWrite::STEPControl_ActorWrite ******/
		/****** md5 signature: e461b526cacb1525395052610f05dbcc ******/
		%feature("compactdefaultargs") STEPControl_ActorWrite;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") STEPControl_ActorWrite;
		 STEPControl_ActorWrite();

		/****** STEPControl_ActorWrite::GroupMode ******/
		/****** md5 signature: e9273a39857756ea9539069daa47c652 ******/
		%feature("compactdefaultargs") GroupMode;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") GroupMode;
		int GroupMode();

		/****** STEPControl_ActorWrite::IsAssembly ******/
		/****** md5 signature: 8ce889f71f550a8a46ba9a04cb2df521 ******/
		%feature("compactdefaultargs") IsAssembly;
		%feature("autodoc", "
Parameters
----------
theModel: StepData_StepModel
S: TopoDS_Shape

Return
-------
bool

Description
-----------
Customizable method to check whether shape S should be written as assembly or not Default implementation uses flag GroupMode and analyses the shape itself NOTE: this method can modify shape.
") IsAssembly;
		virtual bool IsAssembly(const opencascade::handle<StepData_StepModel> & theModel, TopoDS_Shape & S);

		/****** STEPControl_ActorWrite::Mode ******/
		/****** md5 signature: 017da31d79f3a481eb542e4aaf03f760 ******/
		%feature("compactdefaultargs") Mode;
		%feature("autodoc", "Return
-------
STEPControl_StepModelType

Description
-----------
No available documentation.
") Mode;
		STEPControl_StepModelType Mode();

		/****** STEPControl_ActorWrite::Recognize ******/
		/****** md5 signature: c75c372401b17ce93c08832f5db0f899 ******/
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
No available documentation.
") Recognize;
		bool Recognize(const opencascade::handle<Transfer_Finder> & start);

		/****** STEPControl_ActorWrite::SetGroupMode ******/
		/****** md5 signature: 4af8b78e95ec3c7703778a312a4176ff ******/
		%feature("compactdefaultargs") SetGroupMode;
		%feature("autodoc", "
Parameters
----------
mode: int

Return
-------
None

Description
-----------
No available documentation.
") SetGroupMode;
		void SetGroupMode(const int mode);

		/****** STEPControl_ActorWrite::SetMode ******/
		/****** md5 signature: 4f6cbafbf6ebf4fcc86d459a7cc8d831 ******/
		%feature("compactdefaultargs") SetMode;
		%feature("autodoc", "
Parameters
----------
M: STEPControl_StepModelType

Return
-------
None

Description
-----------
No available documentation.
") SetMode;
		void SetMode(const STEPControl_StepModelType M);

		/****** STEPControl_ActorWrite::SetTolerance ******/
		/****** md5 signature: c426e858e7414d8f8908514d195da2fa ******/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "
Parameters
----------
Tol: double

Return
-------
None

Description
-----------
No available documentation.
") SetTolerance;
		void SetTolerance(const double Tol);

		/****** STEPControl_ActorWrite::Transfer ******/
		/****** md5 signature: 2df2c014c6ebad520b7a1141818c6bec ******/
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
No available documentation.
") Transfer;
		opencascade::handle<Transfer_Binder> Transfer(const opencascade::handle<Transfer_Finder> & start, const opencascade::handle<Transfer_FinderProcess> & FP, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** STEPControl_ActorWrite::TransferCompound ******/
		/****** md5 signature: 855c0573afda61b7fe3f01adb9ab28ca ******/
		%feature("compactdefaultargs") TransferCompound;
		%feature("autodoc", "
Parameters
----------
start: Transfer_Finder
SDR: StepShape_ShapeDefinitionRepresentation
FP: Transfer_FinderProcess
theLocalFactors: StepData_Factors (optional, default to StepData_Factors())
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
opencascade::handle<Transfer_Binder>

Description
-----------
No available documentation.
") TransferCompound;
		opencascade::handle<Transfer_Binder> TransferCompound(const opencascade::handle<Transfer_Finder> & start, const opencascade::handle<StepShape_ShapeDefinitionRepresentation> & SDR, const opencascade::handle<Transfer_FinderProcess> & FP, const StepData_Factors & theLocalFactors = StepData_Factors(), const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** STEPControl_ActorWrite::TransferShape ******/
		/****** md5 signature: 3ada8f65dac02b311cef7183f21e50f8 ******/
		%feature("compactdefaultargs") TransferShape;
		%feature("autodoc", "
Parameters
----------
start: Transfer_Finder
SDR: StepShape_ShapeDefinitionRepresentation
FP: Transfer_FinderProcess
theLocalFactors: StepData_Factors (optional, default to StepData_Factors())
shapeGroup: NCollection_HSequence<TopoDS_Shape (optional, default to nullptr)
isManifold: bool (optional, default to true)
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
opencascade::handle<Transfer_Binder>

Description
-----------
No available documentation.
") TransferShape;
		opencascade::handle<Transfer_Binder> TransferShape(const opencascade::handle<Transfer_Finder> & start, const opencascade::handle<StepShape_ShapeDefinitionRepresentation> & SDR, const opencascade::handle<Transfer_FinderProcess> & FP, const StepData_Factors & theLocalFactors = StepData_Factors(), const opencascade::handle<NCollection_HSequence<TopoDS_Shape> > & shapeGroup = nullptr, const bool isManifold = true, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** STEPControl_ActorWrite::TransferSubShape ******/
		/****** md5 signature: 7dd39fca15b69bb6057e02e69a1b1155 ******/
		%feature("compactdefaultargs") TransferSubShape;
		%feature("autodoc", "
Parameters
----------
start: Transfer_Finder
SDR: StepShape_ShapeDefinitionRepresentation
AX1: StepGeom_GeometricRepresentationItem
FP: Transfer_FinderProcess
theLocalFactors: StepData_Factors (optional, default to StepData_Factors())
shapeGroup: NCollection_HSequence<TopoDS_Shape (optional, default to nullptr)
isManifold: bool (optional, default to true)
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
opencascade::handle<Transfer_Binder>

Description
-----------
No available documentation.
") TransferSubShape;
		opencascade::handle<Transfer_Binder> TransferSubShape(const opencascade::handle<Transfer_Finder> & start, const opencascade::handle<StepShape_ShapeDefinitionRepresentation> & SDR, opencascade::handle<StepGeom_GeometricRepresentationItem> & AX1, const opencascade::handle<Transfer_FinderProcess> & FP, const StepData_Factors & theLocalFactors = StepData_Factors(), const opencascade::handle<NCollection_HSequence<TopoDS_Shape> > & shapeGroup = nullptr, const bool isManifold = true, const Message_ProgressRange & theProgress = Message_ProgressRange());

};


%extend STEPControl_ActorWrite {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class STEPControl_Controller *
*******************************/
class STEPControl_Controller : public XSControl_Controller {
	public:
		/****** STEPControl_Controller::STEPControl_Controller ******/
		/****** md5 signature: ddfea8b4c1fe8de254a503b0b32e5346 ******/
		%feature("compactdefaultargs") STEPControl_Controller;
		%feature("autodoc", "Return
-------
None

Description
-----------
Initializes the use of STEP Norm (the first time) and returns a Controller.
") STEPControl_Controller;
		 STEPControl_Controller();

		/****** STEPControl_Controller::ActorRead ******/
		/****** md5 signature: 88afaca6dcec1bcecb75406407361671 ******/
		%feature("compactdefaultargs") ActorRead;
		%feature("autodoc", "
Parameters
----------
theModel: Interface_InterfaceModel

Return
-------
opencascade::handle<Transfer_ActorOfTransientProcess>

Description
-----------
Returns the Actor for Read attached to the pair (norm,appli).
") ActorRead;
		opencascade::handle<Transfer_ActorOfTransientProcess> ActorRead(const opencascade::handle<Interface_InterfaceModel> & theModel);

		/****** STEPControl_Controller::Customise ******/
		/****** md5 signature: 52b7401df97c95be3e29bd95c1a1f721 ******/
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
		void Customise(opencascade::handle<XSControl_WorkSession> & WS);

		/****** STEPControl_Controller::Init ******/
		/****** md5 signature: 90ec9d1ba4c3761913d797387bfd673d ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Standard Initialisation. It creates a Controller for STEP and records it to various names, available to select it later Returns True when done, False if could not be done.
") Init;
		static bool Init();

		/****** STEPControl_Controller::NewModel ******/
		/****** md5 signature: 4e176eab7c6da9b73e274debab7af3fb ******/
		%feature("compactdefaultargs") NewModel;
		%feature("autodoc", "Return
-------
opencascade::handle<Interface_InterfaceModel>

Description
-----------
Creates a new empty Model ready to receive data of the Norm. It is taken from STEP Template Model.
") NewModel;
		opencascade::handle<Interface_InterfaceModel> NewModel();

		/****** STEPControl_Controller::TransferWriteShape ******/
		/****** md5 signature: e6089c3b261fdd75c217a2b2c38e5bad ******/
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
Takes one Shape and transfers it to the InterfaceModel (already created by NewModel for instance) <modeshape> is to be interpreted by each kind of XstepAdaptor Returns a status: 0 OK 1 No result 2 Fail -1 bad modeshape -2 bad model (requires a StepModel) modeshape: 1 Facetted BRep, 2 Shell, 3 Manifold Solid.
") TransferWriteShape;
		IFSelect_ReturnStatus TransferWriteShape(const TopoDS_Shape & shape, const opencascade::handle<Transfer_FinderProcess> & FP, const opencascade::handle<Interface_InterfaceModel> & model, const int modetrans = 0, const Message_ProgressRange & theProgress = Message_ProgressRange());

};


%extend STEPControl_Controller {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class STEPControl_Reader *
***************************/
class STEPControl_Reader : public XSControl_Reader {
	public:
		/****** STEPControl_Reader::STEPControl_Reader ******/
		/****** md5 signature: ec8685d6b23db12d8dcd11649af265ac ******/
		%feature("compactdefaultargs") STEPControl_Reader;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates a reader object with an empty STEP model.
") STEPControl_Reader;
		 STEPControl_Reader();

		/****** STEPControl_Reader::STEPControl_Reader ******/
		/****** md5 signature: c05998f513dd06768c3901cd9cfa1fc2 ******/
		%feature("compactdefaultargs") STEPControl_Reader;
		%feature("autodoc", "
Parameters
----------
WS: XSControl_WorkSession
scratch: bool (optional, default to true)

Return
-------
None

Description
-----------
Creates a Reader for STEP from an already existing Session Clears the session if it was not yet set for STEP.
") STEPControl_Reader;
		 STEPControl_Reader(const opencascade::handle<XSControl_WorkSession> & WS, const bool scratch = true);

		/****** STEPControl_Reader::FileUnits ******/
		/****** md5 signature: 748553d197bd13ec08f45f8ab8cf03e8 ******/
		%feature("compactdefaultargs") FileUnits;
		%feature("autodoc", "
Parameters
----------
theUnitLengthNames: NCollection_Sequence<TCollection_AsciiString>
theUnitAngleNames: NCollection_Sequence<TCollection_AsciiString>
theUnitSolidAngleNames: NCollection_Sequence<TCollection_AsciiString>

Return
-------
None

Description
-----------
Returns sequence of all unit names for shape representations found in file.
") FileUnits;
		void FileUnits(NCollection_Sequence<TCollection_AsciiString> & theUnitLengthNames, NCollection_Sequence<TCollection_AsciiString> & theUnitAngleNames, NCollection_Sequence<TCollection_AsciiString> & theUnitSolidAngleNames);

		/****** STEPControl_Reader::NbRootsForTransfer ******/
		/****** md5 signature: 1360662bdc49432e02d6b08717502cde ******/
		%feature("compactdefaultargs") NbRootsForTransfer;
		%feature("autodoc", "Return
-------
int

Description
-----------
Determines the list of root entities from Model which are candidate for a transfer to a Shape (type of entities is PRODUCT).
") NbRootsForTransfer;
		int NbRootsForTransfer();

		/****** STEPControl_Reader::ReadFile ******/
		/****** md5 signature: fd36e448994e1a5aa7324362cf3d5930 ******/
		%feature("compactdefaultargs") ReadFile;
		%feature("autodoc", "
Parameters
----------
filename: char *

Return
-------
IFSelect_ReturnStatus

Description
-----------
Loads a file and returns the read status Zero for a Model which compies with the Controller.
") ReadFile;
		IFSelect_ReturnStatus ReadFile(const char * const filename);

		/****** STEPControl_Reader::ReadFile ******/
		/****** md5 signature: a1a5d2c91fc9e14750d6e10687fb9fee ******/
		%feature("compactdefaultargs") ReadFile;
		%feature("autodoc", "
Parameters
----------
filename: char *
theParams: DESTEP_Parameters

Return
-------
IFSelect_ReturnStatus

Description
-----------
Loads a file and returns the read status Zero for a Model which compies with the Controller.
") ReadFile;
		IFSelect_ReturnStatus ReadFile(const char * const filename, const DESTEP_Parameters & theParams);

		/****** STEPControl_Reader::ReadStream ******/
		/****** md5 signature: 94c25d81acdfb8f9795bada98bc7f4dc ******/
		%feature("compactdefaultargs") ReadStream;
		%feature("autodoc", "
Parameters
----------
theName: char *
theIStream: str

Return
-------
IFSelect_ReturnStatus

Description
-----------
Loads a file from stream and returns the read status.
") ReadStream;
		IFSelect_ReturnStatus ReadStream(const char * const theName, std::istream & theIStream);

		/****** STEPControl_Reader::ReadStream ******/
		/****** md5 signature: 375c18315782813f2bf585453ffed5c3 ******/
		%feature("compactdefaultargs") ReadStream;
		%feature("autodoc", "
Parameters
----------
theName: char *
theParams: DESTEP_Parameters
theIStream: str

Return
-------
IFSelect_ReturnStatus

Description
-----------
Loads a file from stream and returns the read status.
") ReadStream;
		IFSelect_ReturnStatus ReadStream(const char * const theName, const DESTEP_Parameters & theParams, std::istream & theIStream);

		/****** STEPControl_Reader::SetSystemLengthUnit ******/
		/****** md5 signature: caf008f02d0f725fe4f0c731e76a6e62 ******/
		%feature("compactdefaultargs") SetSystemLengthUnit;
		%feature("autodoc", "
Parameters
----------
theLengthUnit: double

Return
-------
None

Description
-----------
Sets system length unit used by transfer process. Performs only if a model is not NULL.
") SetSystemLengthUnit;
		void SetSystemLengthUnit(const double theLengthUnit);

		/****** STEPControl_Reader::StepModel ******/
		/****** md5 signature: a19eb8c75fefa8a51a41068202c028ed ******/
		%feature("compactdefaultargs") StepModel;
		%feature("autodoc", "Return
-------
opencascade::handle<StepData_StepModel>

Description
-----------
Returns the model as a StepModel. It can then be consulted (header, product).
") StepModel;
		opencascade::handle<StepData_StepModel> StepModel();

		/****** STEPControl_Reader::SystemLengthUnit ******/
		/****** md5 signature: e31c92b24d9da593c4ee0ff6ef5b78eb ******/
		%feature("compactdefaultargs") SystemLengthUnit;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns system length unit used by transfer process. Performs only if a model is not NULL.
") SystemLengthUnit;
		double SystemLengthUnit();

		/****** STEPControl_Reader::TransferRoot ******/
		/****** md5 signature: 833ca3b02420c2bea50774301ad759fb ******/
		%feature("compactdefaultargs") TransferRoot;
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
Transfers a root given its rank in the list of candidate roots Default is the first one Returns True if a shape has resulted, false else Same as inherited TransferOneRoot, kept for compatibility.
") TransferRoot;
		bool TransferRoot(const int num = 1, const Message_ProgressRange & theProgress = Message_ProgressRange());

};


%extend STEPControl_Reader {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class STEPControl_Writer *
***************************/
class STEPControl_Writer {
	public:
		/****** STEPControl_Writer::STEPControl_Writer ******/
		/****** md5 signature: 6f4a8c36769e033687d99d18003d22b7 ******/
		%feature("compactdefaultargs") STEPControl_Writer;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates a Writer from scratch.
") STEPControl_Writer;
		 STEPControl_Writer();

		/****** STEPControl_Writer::STEPControl_Writer ******/
		/****** md5 signature: 9ec34e47c6b34e4df9ec2766981867cc ******/
		%feature("compactdefaultargs") STEPControl_Writer;
		%feature("autodoc", "
Parameters
----------
WS: XSControl_WorkSession
scratch: bool (optional, default to true)

Return
-------
None

Description
-----------
Creates a Writer from an already existing Session If <scratch> is True (D), clears already recorded data.
") STEPControl_Writer;
		 STEPControl_Writer(const opencascade::handle<XSControl_WorkSession> & WS, const bool scratch = true);

		/****** STEPControl_Writer::CleanDuplicateEntities ******/
		/****** md5 signature: 20695f7344c9ce071d048012ef3d4011 ******/
		%feature("compactdefaultargs") CleanDuplicateEntities;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") CleanDuplicateEntities;
		void CleanDuplicateEntities();

		/****** STEPControl_Writer::GetShapeFixParameters ******/
		/****** md5 signature: a8fc513b1f4da60e937ee021147ff2cb ******/
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

		/****** STEPControl_Writer::GetShapeProcessFlags ******/
		/****** md5 signature: 33b1b591e99340c577e8d056ceb180c5 ******/
		%feature("compactdefaultargs") GetShapeProcessFlags;
		%feature("autodoc", "Return
-------
XSAlgo_ShapeProcessor::ProcessingFlags

Description
-----------
Returns flags defining operations to be performed on shapes. 
Return: Pair of values defining operations to be performed on shapes and a boolean value that indicates whether the flags were set.
") GetShapeProcessFlags;
		const XSAlgo_ShapeProcessor::ProcessingFlags & GetShapeProcessFlags();

		/****** STEPControl_Writer::Model ******/
		/****** md5 signature: 4bbb1ab3563bd66330076c22490d069a ******/
		%feature("compactdefaultargs") Model;
		%feature("autodoc", "
Parameters
----------
newone: bool (optional, default to false)

Return
-------
opencascade::handle<StepData_StepModel>

Description
-----------
Returns the produced model. Produces a new one if not yet done or if <newone> is True This method allows for instance to edit product or header data before writing.
") Model;
		opencascade::handle<StepData_StepModel> Model(const bool newone = false);

		/****** STEPControl_Writer::PrintStatsTransfer ******/
		/****** md5 signature: 65fd51353cdc73aaf5985224f25b6c9a ******/
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
Displays the statistics for the last translation. what defines the kind of statistics that are displayed: - 0 gives general statistics (number of translated roots, number of warnings, number of fail messages), - 1 gives root results, - 2 gives statistics for all checked entities, - 3 gives the list of translated entities, - 4 gives warning and fail messages, - 5 gives fail messages only. mode is used according to the use of what. If what is 0, mode is ignored. If what is 1, 2 or 3, mode defines the following: - 0 lists the numbers of STEP entities in a STEP model, - 1 gives the number, identifier, type and result type for each STEP entity and/or its status (fail, warning, etc.), - 2 gives maximum information for each STEP entity (i.e. checks), - 3 gives the number of entities by the type of a STEP entity, - 4 gives the number of of STEP entities per result type and/or status, - 5 gives the number of pairs (STEP or result type and status), - 6 gives the number of pairs (STEP or result type and status) AND the list of entity numbers in the STEP model.
") PrintStatsTransfer;
		void PrintStatsTransfer(const int what, const int mode = 0);

		/****** STEPControl_Writer::SetShapeFixParameters ******/
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

		/****** STEPControl_Writer::SetShapeFixParameters ******/
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

		/****** STEPControl_Writer::SetShapeFixParameters ******/
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

		/****** STEPControl_Writer::SetShapeProcessFlags ******/
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

		/****** STEPControl_Writer::SetTolerance ******/
		/****** md5 signature: c426e858e7414d8f8908514d195da2fa ******/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "
Parameters
----------
Tol: double

Return
-------
None

Description
-----------
Sets a length-measure value that will be written to uncertainty-measure-with-unit when the next shape is translated.
") SetTolerance;
		void SetTolerance(const double Tol);

		/****** STEPControl_Writer::SetWS ******/
		/****** md5 signature: e675abfcc47a61d413e625967e5d49a5 ******/
		%feature("compactdefaultargs") SetWS;
		%feature("autodoc", "
Parameters
----------
WS: XSControl_WorkSession
scratch: bool (optional, default to true)

Return
-------
None

Description
-----------
Sets a specific session to <self>.
") SetWS;
		void SetWS(const opencascade::handle<XSControl_WorkSession> & WS, const bool scratch = true);

		/****** STEPControl_Writer::Transfer ******/
		/****** md5 signature: f8391484ce59f2846571e6f7db311ae2 ******/
		%feature("compactdefaultargs") Transfer;
		%feature("autodoc", "
Parameters
----------
sh: TopoDS_Shape
mode: STEPControl_StepModelType
compgraph: bool (optional, default to true)
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
IFSelect_ReturnStatus

Description
-----------
Translates shape sh to a STEP entity. mode defines the STEP entity type to be output: - STEPControlStd_AsIs translates a shape to its highest possible STEP representation. - STEPControlStd_ManifoldSolidBrep translates a shape to a STEP manifold_solid_brep or brep_with_voids entity. - STEPControlStd_FacetedBrep translates a shape into a STEP faceted_brep entity. - STEPControlStd_ShellBasedSurfaceModel translates a shape into a STEP shell_based_surface_model entity. - STEPControlStd_GeometricCurveSet translates a shape into a STEP geometric_curve_set entity.
") Transfer;
		IFSelect_ReturnStatus Transfer(const TopoDS_Shape & sh, const STEPControl_StepModelType mode, const bool compgraph = true, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** STEPControl_Writer::Transfer ******/
		/****** md5 signature: 3eceac314d7fe08f7c51ed84988e5a1e ******/
		%feature("compactdefaultargs") Transfer;
		%feature("autodoc", "
Parameters
----------
sh: TopoDS_Shape
mode: STEPControl_StepModelType
theParams: DESTEP_Parameters
compgraph: bool (optional, default to true)
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
IFSelect_ReturnStatus

Description
-----------
Translates shape sh to a STEP entity.
") Transfer;
		IFSelect_ReturnStatus Transfer(const TopoDS_Shape & sh, const STEPControl_StepModelType mode, const DESTEP_Parameters & theParams, const bool compgraph = true, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** STEPControl_Writer::UnsetTolerance ******/
		/****** md5 signature: 2d51d628282b502d22281b67c393ff77 ******/
		%feature("compactdefaultargs") UnsetTolerance;
		%feature("autodoc", "Return
-------
None

Description
-----------
Unsets the tolerance formerly forced by SetTolerance.
") UnsetTolerance;
		void UnsetTolerance();

		/****** STEPControl_Writer::WS ******/
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

		/****** STEPControl_Writer::Write ******/
		/****** md5 signature: 599b126410ec48980a682c091be91941 ******/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "
Parameters
----------
theFileName: char *

Return
-------
IFSelect_ReturnStatus

Description
-----------
Writes a STEP model in the file identified by filename.
") Write;
		IFSelect_ReturnStatus Write(const char * const theFileName);

		/****** STEPControl_Writer::WriteStream ******/
		/****** md5 signature: ce65ef735ad27a9e0fa213e50b058382 ******/
		%feature("compactdefaultargs") WriteStream;
		%feature("autodoc", "
Parameters
----------

Return
-------
theOStream: std::ostream

Description
-----------
Writes a STEP model in the std::ostream.
") WriteStream;
		IFSelect_ReturnStatus WriteStream(std::ostream &OutValue);

};


%extend STEPControl_Writer {
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
def STEPControl_Controller_Init(*args):
	return STEPControl_Controller.Init(*args)

}
