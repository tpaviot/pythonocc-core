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
%define STEPCONTROLDOCSTRING
"STEPControl module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_stepcontrol.html"
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
%include ../common/Operators.i
%include ../common/OccHandle.i


%{
#include<STEPControl_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<Transfer_module.hxx>
#include<StepRepr_module.hxx>
#include<gp_module.hxx>
#include<StepGeom_module.hxx>
#include<TopoDS_module.hxx>
#include<StepShape_module.hxx>
#include<TopTools_module.hxx>
#include<XSControl_module.hxx>
#include<Interface_module.hxx>
#include<IFSelect_module.hxx>
#include<TColStd_module.hxx>
#include<StepData_module.hxx>
#include<Message_module.hxx>
#include<TopLoc_module.hxx>
#include<StepBasic_module.hxx>
#include<Transfer_module.hxx>
#include<Geom2d_module.hxx>
#include<Geom_module.hxx>
#include<Interface_module.hxx>
#include<MoniTool_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import Transfer.i
%import StepRepr.i
%import gp.i
%import StepGeom.i
%import TopoDS.i
%import StepShape.i
%import TopTools.i
%import XSControl.i
%import Interface.i
%import IFSelect.i
%import TColStd.i
%import StepData.i

%pythoncode {
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

/* python proy classes for enums */
%pythoncode {

class STEPControl_StepModelType:
	STEPControl_AsIs = 0
	STEPControl_ManifoldSolidBrep = 1
	STEPControl_BrepWithVoids = 2
	STEPControl_FacetedBrep = 3
	STEPControl_FacetedBrepAndBrepWithVoids = 4
	STEPControl_ShellBasedSurfaceModel = 5
	STEPControl_GeometricCurveSet = 6
	STEPControl_Hybrid = 7
};
/* end python proxy for enums */

/* handles */
%wrap_handle(STEPControl_ActorRead)
%wrap_handle(STEPControl_ActorWrite)
%wrap_handle(STEPControl_Controller)
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
		/****************** STEPControl_ActorRead ******************/
		%feature("compactdefaultargs") STEPControl_ActorRead;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") STEPControl_ActorRead;
		 STEPControl_ActorRead();

		/****************** ComputeSRRWT ******************/
		%feature("compactdefaultargs") ComputeSRRWT;
		%feature("autodoc", "Computes transformation defined by given representation_relationship_with_transformation.

Parameters
----------
SRR: StepRepr_RepresentationRelationship
TP: Transfer_TransientProcess
Trsf: gp_Trsf

Returns
-------
bool
") ComputeSRRWT;
		Standard_Boolean ComputeSRRWT(const opencascade::handle<StepRepr_RepresentationRelationship> & SRR, const opencascade::handle<Transfer_TransientProcess> & TP, gp_Trsf & Trsf);

		/****************** ComputeTransformation ******************/
		%feature("compactdefaultargs") ComputeTransformation;
		%feature("autodoc", "Computes transformation defined by two axis placements (in mapped_item or item_defined_transformation) taking into account their representation contexts (i.e. units, which may be different) returns true if transformation is computed and is not an identity.

Parameters
----------
Origin: StepGeom_Axis2Placement3d
Target: StepGeom_Axis2Placement3d
OrigContext: StepRepr_Representation
TargContext: StepRepr_Representation
TP: Transfer_TransientProcess
Trsf: gp_Trsf

Returns
-------
bool
") ComputeTransformation;
		Standard_Boolean ComputeTransformation(const opencascade::handle<StepGeom_Axis2Placement3d> & Origin, const opencascade::handle<StepGeom_Axis2Placement3d> & Target, const opencascade::handle<StepRepr_Representation> & OrigContext, const opencascade::handle<StepRepr_Representation> & TargContext, const opencascade::handle<Transfer_TransientProcess> & TP, gp_Trsf & Trsf);

		/****************** PrepareUnits ******************/
		%feature("compactdefaultargs") PrepareUnits;
		%feature("autodoc", "Set units and tolerances context by given shaperepresentation.

Parameters
----------
rep: StepRepr_Representation
TP: Transfer_TransientProcess

Returns
-------
None
") PrepareUnits;
		void PrepareUnits(const opencascade::handle<StepRepr_Representation> & rep, const opencascade::handle<Transfer_TransientProcess> & TP);

		/****************** Recognize ******************/
		%feature("compactdefaultargs") Recognize;
		%feature("autodoc", "No available documentation.

Parameters
----------
start: Standard_Transient

Returns
-------
bool
") Recognize;
		virtual Standard_Boolean Recognize(const opencascade::handle<Standard_Transient> & start);

		/****************** ResetUnits ******************/
		%feature("compactdefaultargs") ResetUnits;
		%feature("autodoc", "Reset units and tolerances context to default (mm, radians, read.precision.val, etc.).

Returns
-------
None
") ResetUnits;
		void ResetUnits();

		/****************** Transfer ******************/
		%feature("compactdefaultargs") Transfer;
		%feature("autodoc", "No available documentation.

Parameters
----------
start: Standard_Transient
TP: Transfer_TransientProcess

Returns
-------
opencascade::handle<Transfer_Binder>
") Transfer;
		virtual opencascade::handle<Transfer_Binder> Transfer(const opencascade::handle<Standard_Transient> & start, const opencascade::handle<Transfer_TransientProcess> & TP);

		/****************** TransferShape ******************/
		%feature("compactdefaultargs") TransferShape;
		%feature("autodoc", "No available documentation.

Parameters
----------
start: Standard_Transient
TP: Transfer_TransientProcess
isManifold: bool,optional
	default value is Standard_True

Returns
-------
opencascade::handle<Transfer_Binder>
") TransferShape;
		opencascade::handle<Transfer_Binder> TransferShape(const opencascade::handle<Standard_Transient> & start, const opencascade::handle<Transfer_TransientProcess> & TP, const Standard_Boolean isManifold = Standard_True);

};


%make_alias(STEPControl_ActorRead)

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
		/****************** STEPControl_ActorWrite ******************/
		%feature("compactdefaultargs") STEPControl_ActorWrite;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") STEPControl_ActorWrite;
		 STEPControl_ActorWrite();

		/****************** GroupMode ******************/
		%feature("compactdefaultargs") GroupMode;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") GroupMode;
		Standard_Integer GroupMode();

		/****************** IsAssembly ******************/
		%feature("compactdefaultargs") IsAssembly;
		%feature("autodoc", "Customizable method to check whether shape s should be written as assembly or not default implementation uses flag groupmode and analyses the shape itself note: this method can modify shape.

Parameters
----------
S: TopoDS_Shape

Returns
-------
bool
") IsAssembly;
		virtual Standard_Boolean IsAssembly(TopoDS_Shape & S);

		/****************** Mode ******************/
		%feature("compactdefaultargs") Mode;
		%feature("autodoc", "No available documentation.

Returns
-------
STEPControl_StepModelType
") Mode;
		STEPControl_StepModelType Mode();

		/****************** Recognize ******************/
		%feature("compactdefaultargs") Recognize;
		%feature("autodoc", "No available documentation.

Parameters
----------
start: Transfer_Finder

Returns
-------
bool
") Recognize;
		virtual Standard_Boolean Recognize(const opencascade::handle<Transfer_Finder> & start);

		/****************** SetGroupMode ******************/
		%feature("compactdefaultargs") SetGroupMode;
		%feature("autodoc", "No available documentation.

Parameters
----------
mode: int

Returns
-------
None
") SetGroupMode;
		void SetGroupMode(const Standard_Integer mode);

		/****************** SetMode ******************/
		%feature("compactdefaultargs") SetMode;
		%feature("autodoc", "No available documentation.

Parameters
----------
M: STEPControl_StepModelType

Returns
-------
None
") SetMode;
		void SetMode(const STEPControl_StepModelType M);

		/****************** SetTolerance ******************/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "No available documentation.

Parameters
----------
Tol: float

Returns
-------
None
") SetTolerance;
		void SetTolerance(const Standard_Real Tol);

		/****************** Transfer ******************/
		%feature("compactdefaultargs") Transfer;
		%feature("autodoc", "No available documentation.

Parameters
----------
start: Transfer_Finder
FP: Transfer_FinderProcess

Returns
-------
opencascade::handle<Transfer_Binder>
") Transfer;
		virtual opencascade::handle<Transfer_Binder> Transfer(const opencascade::handle<Transfer_Finder> & start, const opencascade::handle<Transfer_FinderProcess> & FP);

		/****************** TransferCompound ******************/
		%feature("compactdefaultargs") TransferCompound;
		%feature("autodoc", "No available documentation.

Parameters
----------
start: Transfer_Finder
SDR: StepShape_ShapeDefinitionRepresentation
FP: Transfer_FinderProcess

Returns
-------
opencascade::handle<Transfer_Binder>
") TransferCompound;
		opencascade::handle<Transfer_Binder> TransferCompound(const opencascade::handle<Transfer_Finder> & start, const opencascade::handle<StepShape_ShapeDefinitionRepresentation> & SDR, const opencascade::handle<Transfer_FinderProcess> & FP);

		/****************** TransferShape ******************/
		%feature("compactdefaultargs") TransferShape;
		%feature("autodoc", "No available documentation.

Parameters
----------
start: Transfer_Finder
SDR: StepShape_ShapeDefinitionRepresentation
FP: Transfer_FinderProcess
shapeGroup: TopTools_HSequenceOfShape,optional
	default value is NULL
isManifold: bool,optional
	default value is Standard_True

Returns
-------
opencascade::handle<Transfer_Binder>
") TransferShape;
		opencascade::handle<Transfer_Binder> TransferShape(const opencascade::handle<Transfer_Finder> & start, const opencascade::handle<StepShape_ShapeDefinitionRepresentation> & SDR, const opencascade::handle<Transfer_FinderProcess> & FP, const opencascade::handle<TopTools_HSequenceOfShape> & shapeGroup = NULL, const Standard_Boolean isManifold = Standard_True);

		/****************** TransferSubShape ******************/
		%feature("compactdefaultargs") TransferSubShape;
		%feature("autodoc", "No available documentation.

Parameters
----------
start: Transfer_Finder
SDR: StepShape_ShapeDefinitionRepresentation
AX1: StepGeom_Axis2Placement3d
FP: Transfer_FinderProcess
shapeGroup: TopTools_HSequenceOfShape,optional
	default value is NULL
isManifold: bool,optional
	default value is Standard_True

Returns
-------
opencascade::handle<Transfer_Binder>
") TransferSubShape;
		opencascade::handle<Transfer_Binder> TransferSubShape(const opencascade::handle<Transfer_Finder> & start, const opencascade::handle<StepShape_ShapeDefinitionRepresentation> & SDR, opencascade::handle<StepGeom_Axis2Placement3d> & AX1, const opencascade::handle<Transfer_FinderProcess> & FP, const opencascade::handle<TopTools_HSequenceOfShape> & shapeGroup = NULL, const Standard_Boolean isManifold = Standard_True);

};


%make_alias(STEPControl_ActorWrite)

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
		/****************** STEPControl_Controller ******************/
		%feature("compactdefaultargs") STEPControl_Controller;
		%feature("autodoc", "Initializes the use of step norm (the first time) and returns a controller.

Returns
-------
None
") STEPControl_Controller;
		 STEPControl_Controller();

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
		%feature("autodoc", "Standard initialisation. it creates a controller for step and records it to various names, available to select it later returns true when done, false if could not be done.

Returns
-------
bool
") Init;
		static Standard_Boolean Init();

		/****************** NewModel ******************/
		%feature("compactdefaultargs") NewModel;
		%feature("autodoc", "Creates a new empty model ready to receive data of the norm. it is taken from step template model.

Returns
-------
opencascade::handle<Interface_InterfaceModel>
") NewModel;
		opencascade::handle<Interface_InterfaceModel> NewModel();

		/****************** TransferWriteShape ******************/
		%feature("compactdefaultargs") TransferWriteShape;
		%feature("autodoc", "Takes one shape and transfers it to the interfacemodel (already created by newmodel for instance) <modeshape> is to be interpreted by each kind of xstepadaptor returns a status : 0 ok 1 no result 2 fail -1 bad modeshape -2 bad model (requires a stepmodel) modeshape : 1 facetted brep, 2 shell, 3 manifold solid.

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


%make_alias(STEPControl_Controller)

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
		/****************** STEPControl_Reader ******************/
		%feature("compactdefaultargs") STEPControl_Reader;
		%feature("autodoc", "Creates a reader object with an empty step model.

Returns
-------
None
") STEPControl_Reader;
		 STEPControl_Reader();

		/****************** STEPControl_Reader ******************/
		%feature("compactdefaultargs") STEPControl_Reader;
		%feature("autodoc", "Creates a reader for step from an already existing session clears the session if it was not yet set for step.

Parameters
----------
WS: XSControl_WorkSession
scratch: bool,optional
	default value is Standard_True

Returns
-------
None
") STEPControl_Reader;
		 STEPControl_Reader(const opencascade::handle<XSControl_WorkSession> & WS, const Standard_Boolean scratch = Standard_True);

		/****************** FileUnits ******************/
		%feature("compactdefaultargs") FileUnits;
		%feature("autodoc", "Returns sequence of all unit names for shape representations found in file.

Parameters
----------
theUnitLengthNames: TColStd_SequenceOfAsciiString
theUnitAngleNames: TColStd_SequenceOfAsciiString
theUnitSolidAngleNames: TColStd_SequenceOfAsciiString

Returns
-------
None
") FileUnits;
		void FileUnits(TColStd_SequenceOfAsciiString & theUnitLengthNames, TColStd_SequenceOfAsciiString & theUnitAngleNames, TColStd_SequenceOfAsciiString & theUnitSolidAngleNames);

		/****************** NbRootsForTransfer ******************/
		%feature("compactdefaultargs") NbRootsForTransfer;
		%feature("autodoc", "Determines the list of root entities from model which are candidate for a transfer to a shape (type of entities is product).

Returns
-------
int
") NbRootsForTransfer;
		virtual Standard_Integer NbRootsForTransfer();

		/****************** StepModel ******************/
		%feature("compactdefaultargs") StepModel;
		%feature("autodoc", "Returns the model as a stepmodel. it can then be consulted (header, product).

Returns
-------
opencascade::handle<StepData_StepModel>
") StepModel;
		opencascade::handle<StepData_StepModel> StepModel();

		/****************** TransferRoot ******************/
		%feature("compactdefaultargs") TransferRoot;
		%feature("autodoc", "Transfers a root given its rank in the list of candidate roots default is the first one returns true if a shape has resulted, false else same as inherited transferoneroot, kept for compatibility.

Parameters
----------
num: int,optional
	default value is 1

Returns
-------
bool
") TransferRoot;
		Standard_Boolean TransferRoot(const Standard_Integer num = 1);

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
		/****************** STEPControl_Writer ******************/
		%feature("compactdefaultargs") STEPControl_Writer;
		%feature("autodoc", "Creates a writer from scratch.

Returns
-------
None
") STEPControl_Writer;
		 STEPControl_Writer();

		/****************** STEPControl_Writer ******************/
		%feature("compactdefaultargs") STEPControl_Writer;
		%feature("autodoc", "Creates a writer from an already existing session if <scratch> is true (d), clears already recorded data.

Parameters
----------
WS: XSControl_WorkSession
scratch: bool,optional
	default value is Standard_True

Returns
-------
None
") STEPControl_Writer;
		 STEPControl_Writer(const opencascade::handle<XSControl_WorkSession> & WS, const Standard_Boolean scratch = Standard_True);

		/****************** Model ******************/
		%feature("compactdefaultargs") Model;
		%feature("autodoc", "Returns the produced model. produces a new one if not yet done or if <newone> is true this method allows for instance to edit product or header data before writing.

Parameters
----------
newone: bool,optional
	default value is Standard_False

Returns
-------
opencascade::handle<StepData_StepModel>
") Model;
		opencascade::handle<StepData_StepModel> Model(const Standard_Boolean newone = Standard_False);

		/****************** PrintStatsTransfer ******************/
		%feature("compactdefaultargs") PrintStatsTransfer;
		%feature("autodoc", "Displays the statistics for the last translation. what defines the kind of statistics that are displayed: - 0 gives general statistics (number of translated roots, number of warnings, number of fail messages), - 1 gives root results, - 2 gives statistics for all checked entities, - 3 gives the list of translated entities, - 4 gives warning and fail messages, - 5 gives fail messages only. mode is used according to the use of what. if what is 0, mode is ignored. if what is 1, 2 or 3, mode defines the following: - 0 lists the numbers of step entities in a step model, - 1 gives the number, identifier, type and result type for each step entity and/or its status (fail, warning, etc.), - 2 gives maximum information for each step entity (i.e. checks), - 3 gives the number of entities by the type of a step entity, - 4 gives the number of of step entities per result type and/or status, - 5 gives the number of pairs (step or result type and status), - 6 gives the number of pairs (step or result type and status) and the list of entity numbers in the step model.

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

		/****************** SetTolerance ******************/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "Sets a length-measure value that will be written to uncertainty-measure-with-unit when the next shape is translated.

Parameters
----------
Tol: float

Returns
-------
None
") SetTolerance;
		void SetTolerance(const Standard_Real Tol);

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

		/****************** Transfer ******************/
		%feature("compactdefaultargs") Transfer;
		%feature("autodoc", "Translates shape sh to a step entity. mode defines the step entity type to be output: - stepcontrolstd_asis translates a shape to its highest possible step representation. - stepcontrolstd_manifoldsolidbrep translates a shape to a step manifold_solid_brep or brep_with_voids entity. - stepcontrolstd_facetedbrep translates a shape into a step faceted_brep entity. - stepcontrolstd_shellbasedsurfacemodel translates a shape into a step shell_based_surface_model entity. - stepcontrolstd_geometriccurveset translates a shape into a step geometric_curve_set entity.

Parameters
----------
sh: TopoDS_Shape
mode: STEPControl_StepModelType
compgraph: bool,optional
	default value is Standard_True

Returns
-------
IFSelect_ReturnStatus
") Transfer;
		IFSelect_ReturnStatus Transfer(const TopoDS_Shape & sh, const STEPControl_StepModelType mode, const Standard_Boolean compgraph = Standard_True);

		/****************** UnsetTolerance ******************/
		%feature("compactdefaultargs") UnsetTolerance;
		%feature("autodoc", "Unsets the tolerance formerly forced by settolerance.

Returns
-------
None
") UnsetTolerance;
		void UnsetTolerance();

		/****************** WS ******************/
		%feature("compactdefaultargs") WS;
		%feature("autodoc", "Returns the session used in <self>.

Returns
-------
opencascade::handle<XSControl_WorkSession>
") WS;
		opencascade::handle<XSControl_WorkSession> WS();

		/****************** Write ******************/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "Writes a step model in the file identified by filename.

Parameters
----------
filename: char *

Returns
-------
IFSelect_ReturnStatus
") Write;
		IFSelect_ReturnStatus Write(const char * filename);

};


%extend STEPControl_Writer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
