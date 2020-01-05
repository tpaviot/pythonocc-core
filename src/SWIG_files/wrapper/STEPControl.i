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
		/****************** ComputeSRRWT ******************/
		%feature("compactdefaultargs") ComputeSRRWT;
		%feature("autodoc", "* Computes transformation defined by given REPRESENTATION_RELATIONSHIP_WITH_TRANSFORMATION
	:param SRR:
	:type SRR: StepRepr_RepresentationRelationship
	:param TP:
	:type TP: Transfer_TransientProcess
	:param Trsf:
	:type Trsf: gp_Trsf
	:rtype: bool") ComputeSRRWT;
		Standard_Boolean ComputeSRRWT (const opencascade::handle<StepRepr_RepresentationRelationship> & SRR,const opencascade::handle<Transfer_TransientProcess> & TP,gp_Trsf & Trsf);

		/****************** ComputeTransformation ******************/
		%feature("compactdefaultargs") ComputeTransformation;
		%feature("autodoc", "* Computes transformation defined by two axis placements (in MAPPED_ITEM or ITEM_DEFINED_TRANSFORMATION) taking into account their representation contexts (i.e. units, which may be different) Returns True if transformation is computed and is not an identity.
	:param Origin:
	:type Origin: StepGeom_Axis2Placement3d
	:param Target:
	:type Target: StepGeom_Axis2Placement3d
	:param OrigContext:
	:type OrigContext: StepRepr_Representation
	:param TargContext:
	:type TargContext: StepRepr_Representation
	:param TP:
	:type TP: Transfer_TransientProcess
	:param Trsf:
	:type Trsf: gp_Trsf
	:rtype: bool") ComputeTransformation;
		Standard_Boolean ComputeTransformation (const opencascade::handle<StepGeom_Axis2Placement3d> & Origin,const opencascade::handle<StepGeom_Axis2Placement3d> & Target,const opencascade::handle<StepRepr_Representation> & OrigContext,const opencascade::handle<StepRepr_Representation> & TargContext,const opencascade::handle<Transfer_TransientProcess> & TP,gp_Trsf & Trsf);

		/****************** PrepareUnits ******************/
		%feature("compactdefaultargs") PrepareUnits;
		%feature("autodoc", "* set units and tolerances context by given ShapeRepresentation
	:param rep:
	:type rep: StepRepr_Representation
	:param TP:
	:type TP: Transfer_TransientProcess
	:rtype: None") PrepareUnits;
		void PrepareUnits (const opencascade::handle<StepRepr_Representation> & rep,const opencascade::handle<Transfer_TransientProcess> & TP);

		/****************** Recognize ******************/
		%feature("compactdefaultargs") Recognize;
		%feature("autodoc", ":param start:
	:type start: Standard_Transient
	:rtype: bool") Recognize;
		virtual Standard_Boolean Recognize (const opencascade::handle<Standard_Transient> & start);

		/****************** ResetUnits ******************/
		%feature("compactdefaultargs") ResetUnits;
		%feature("autodoc", "* reset units and tolerances context to default (mm, radians, read.precision.val, etc.)
	:rtype: None") ResetUnits;
		void ResetUnits ();

		/****************** STEPControl_ActorRead ******************/
		%feature("compactdefaultargs") STEPControl_ActorRead;
		%feature("autodoc", ":rtype: None") STEPControl_ActorRead;
		 STEPControl_ActorRead ();

		/****************** Transfer ******************/
		%feature("compactdefaultargs") Transfer;
		%feature("autodoc", ":param start:
	:type start: Standard_Transient
	:param TP:
	:type TP: Transfer_TransientProcess
	:rtype: opencascade::handle<Transfer_Binder>") Transfer;
		virtual opencascade::handle<Transfer_Binder> Transfer (const opencascade::handle<Standard_Transient> & start,const opencascade::handle<Transfer_TransientProcess> & TP);

		/****************** TransferShape ******************/
		%feature("compactdefaultargs") TransferShape;
		%feature("autodoc", ":param start:
	:type start: Standard_Transient
	:param TP:
	:type TP: Transfer_TransientProcess
	:param isManifold: default value is Standard_True
	:type isManifold: bool
	:rtype: opencascade::handle<Transfer_Binder>") TransferShape;
		opencascade::handle<Transfer_Binder> TransferShape (const opencascade::handle<Standard_Transient> & start,const opencascade::handle<Transfer_TransientProcess> & TP,const Standard_Boolean isManifold = Standard_True);

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
		/****************** GroupMode ******************/
		%feature("compactdefaultargs") GroupMode;
		%feature("autodoc", ":rtype: int") GroupMode;
		Standard_Integer GroupMode ();

		/****************** IsAssembly ******************/
		%feature("compactdefaultargs") IsAssembly;
		%feature("autodoc", "* Customizable method to check whether shape S should be written as assembly or not Default implementation uses flag GroupMode and analyses the shape itself NOTE: this method can modify shape
	:param S:
	:type S: TopoDS_Shape
	:rtype: bool") IsAssembly;
		virtual Standard_Boolean IsAssembly (TopoDS_Shape & S);

		/****************** Mode ******************/
		%feature("compactdefaultargs") Mode;
		%feature("autodoc", ":rtype: STEPControl_StepModelType") Mode;
		STEPControl_StepModelType Mode ();

		/****************** Recognize ******************/
		%feature("compactdefaultargs") Recognize;
		%feature("autodoc", ":param start:
	:type start: Transfer_Finder
	:rtype: bool") Recognize;
		virtual Standard_Boolean Recognize (const opencascade::handle<Transfer_Finder> & start);

		/****************** STEPControl_ActorWrite ******************/
		%feature("compactdefaultargs") STEPControl_ActorWrite;
		%feature("autodoc", ":rtype: None") STEPControl_ActorWrite;
		 STEPControl_ActorWrite ();

		/****************** SetGroupMode ******************/
		%feature("compactdefaultargs") SetGroupMode;
		%feature("autodoc", ":param mode:
	:type mode: int
	:rtype: None") SetGroupMode;
		void SetGroupMode (const Standard_Integer mode);

		/****************** SetMode ******************/
		%feature("compactdefaultargs") SetMode;
		%feature("autodoc", ":param M:
	:type M: STEPControl_StepModelType
	:rtype: None") SetMode;
		void SetMode (const STEPControl_StepModelType M);

		/****************** SetTolerance ******************/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", ":param Tol:
	:type Tol: float
	:rtype: None") SetTolerance;
		void SetTolerance (const Standard_Real Tol);

		/****************** Transfer ******************/
		%feature("compactdefaultargs") Transfer;
		%feature("autodoc", ":param start:
	:type start: Transfer_Finder
	:param FP:
	:type FP: Transfer_FinderProcess
	:rtype: opencascade::handle<Transfer_Binder>") Transfer;
		virtual opencascade::handle<Transfer_Binder> Transfer (const opencascade::handle<Transfer_Finder> & start,const opencascade::handle<Transfer_FinderProcess> & FP);

		/****************** TransferCompound ******************/
		%feature("compactdefaultargs") TransferCompound;
		%feature("autodoc", ":param start:
	:type start: Transfer_Finder
	:param SDR:
	:type SDR: StepShape_ShapeDefinitionRepresentation
	:param FP:
	:type FP: Transfer_FinderProcess
	:rtype: opencascade::handle<Transfer_Binder>") TransferCompound;
		opencascade::handle<Transfer_Binder> TransferCompound (const opencascade::handle<Transfer_Finder> & start,const opencascade::handle<StepShape_ShapeDefinitionRepresentation> & SDR,const opencascade::handle<Transfer_FinderProcess> & FP);

		/****************** TransferShape ******************/
		%feature("compactdefaultargs") TransferShape;
		%feature("autodoc", ":param start:
	:type start: Transfer_Finder
	:param SDR:
	:type SDR: StepShape_ShapeDefinitionRepresentation
	:param FP:
	:type FP: Transfer_FinderProcess
	:param shapeGroup: default value is NULL
	:type shapeGroup: TopTools_HSequenceOfShape
	:param isManifold: default value is Standard_True
	:type isManifold: bool
	:rtype: opencascade::handle<Transfer_Binder>") TransferShape;
		opencascade::handle<Transfer_Binder> TransferShape (const opencascade::handle<Transfer_Finder> & start,const opencascade::handle<StepShape_ShapeDefinitionRepresentation> & SDR,const opencascade::handle<Transfer_FinderProcess> & FP,const opencascade::handle<TopTools_HSequenceOfShape> & shapeGroup = NULL,const Standard_Boolean isManifold = Standard_True);

		/****************** TransferSubShape ******************/
		%feature("compactdefaultargs") TransferSubShape;
		%feature("autodoc", ":param start:
	:type start: Transfer_Finder
	:param SDR:
	:type SDR: StepShape_ShapeDefinitionRepresentation
	:param AX1:
	:type AX1: StepGeom_Axis2Placement3d
	:param FP:
	:type FP: Transfer_FinderProcess
	:param shapeGroup: default value is NULL
	:type shapeGroup: TopTools_HSequenceOfShape
	:param isManifold: default value is Standard_True
	:type isManifold: bool
	:rtype: opencascade::handle<Transfer_Binder>") TransferSubShape;
		opencascade::handle<Transfer_Binder> TransferSubShape (const opencascade::handle<Transfer_Finder> & start,const opencascade::handle<StepShape_ShapeDefinitionRepresentation> & SDR,opencascade::handle<StepGeom_Axis2Placement3d> & AX1,const opencascade::handle<Transfer_FinderProcess> & FP,const opencascade::handle<TopTools_HSequenceOfShape> & shapeGroup = NULL,const Standard_Boolean isManifold = Standard_True);

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
		/****************** Customise ******************/
		%feature("compactdefaultargs") Customise;
		%feature("autodoc", ":param WS:
	:type WS: XSControl_WorkSession
	:rtype: void") Customise;
		virtual void Customise (opencascade::handle<XSControl_WorkSession> & WS);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Standard Initialisation. It creates a Controller for STEP and records it to various names, available to select it later Returns True when done, False if could not be done
	:rtype: bool") Init;
		static Standard_Boolean Init ();

		/****************** NewModel ******************/
		%feature("compactdefaultargs") NewModel;
		%feature("autodoc", "* Creates a new empty Model ready to receive data of the Norm. It is taken from STEP Template Model
	:rtype: opencascade::handle<Interface_InterfaceModel>") NewModel;
		opencascade::handle<Interface_InterfaceModel> NewModel ();

		/****************** STEPControl_Controller ******************/
		%feature("compactdefaultargs") STEPControl_Controller;
		%feature("autodoc", "* Initializes the use of STEP Norm (the first time) and returns a Controller
	:rtype: None") STEPControl_Controller;
		 STEPControl_Controller ();

		/****************** TransferWriteShape ******************/
		%feature("compactdefaultargs") TransferWriteShape;
		%feature("autodoc", "* Takes one Shape and transfers it to the InterfaceModel (already created by NewModel for instance) <modeshape> is to be interpreted by each kind of XstepAdaptor Returns a status : 0 OK 1 No result 2 Fail -1 bad modeshape -2 bad model (requires a StepModel) modeshape : 1 Facetted BRep, 2 Shell, 3 Manifold Solid
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
		/****************** FileUnits ******************/
		%feature("compactdefaultargs") FileUnits;
		%feature("autodoc", "* Returns sequence of all unit names for shape representations found in file
	:param theUnitLengthNames:
	:type theUnitLengthNames: TColStd_SequenceOfAsciiString
	:param theUnitAngleNames:
	:type theUnitAngleNames: TColStd_SequenceOfAsciiString
	:param theUnitSolidAngleNames:
	:type theUnitSolidAngleNames: TColStd_SequenceOfAsciiString
	:rtype: None") FileUnits;
		void FileUnits (TColStd_SequenceOfAsciiString & theUnitLengthNames,TColStd_SequenceOfAsciiString & theUnitAngleNames,TColStd_SequenceOfAsciiString & theUnitSolidAngleNames);

		/****************** NbRootsForTransfer ******************/
		%feature("compactdefaultargs") NbRootsForTransfer;
		%feature("autodoc", "* Determines the list of root entities from Model which are candidate for a transfer to a Shape (type of entities is PRODUCT)
	:rtype: int") NbRootsForTransfer;
		virtual Standard_Integer NbRootsForTransfer ();

		/****************** STEPControl_Reader ******************/
		%feature("compactdefaultargs") STEPControl_Reader;
		%feature("autodoc", "* Creates a reader object with an empty STEP model.
	:rtype: None") STEPControl_Reader;
		 STEPControl_Reader ();

		/****************** STEPControl_Reader ******************/
		%feature("compactdefaultargs") STEPControl_Reader;
		%feature("autodoc", "* Creates a Reader for STEP from an already existing Session Clears the session if it was not yet set for STEP
	:param WS:
	:type WS: XSControl_WorkSession
	:param scratch: default value is Standard_True
	:type scratch: bool
	:rtype: None") STEPControl_Reader;
		 STEPControl_Reader (const opencascade::handle<XSControl_WorkSession> & WS,const Standard_Boolean scratch = Standard_True);

		/****************** StepModel ******************/
		%feature("compactdefaultargs") StepModel;
		%feature("autodoc", "* Returns the model as a StepModel. It can then be consulted (header, product)
	:rtype: opencascade::handle<StepData_StepModel>") StepModel;
		opencascade::handle<StepData_StepModel> StepModel ();

		/****************** TransferRoot ******************/
		%feature("compactdefaultargs") TransferRoot;
		%feature("autodoc", "* Transfers a root given its rank in the list of candidate roots Default is the first one Returns True if a shape has resulted, false else Same as inherited TransferOneRoot, kept for compatibility
	:param num: default value is 1
	:type num: int
	:rtype: bool") TransferRoot;
		Standard_Boolean TransferRoot (const Standard_Integer num = 1);

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
		/****************** Model ******************/
		%feature("compactdefaultargs") Model;
		%feature("autodoc", "* Returns the produced model. Produces a new one if not yet done or if <newone> is True This method allows for instance to edit product or header data before writing.
	:param newone: default value is Standard_False
	:type newone: bool
	:rtype: opencascade::handle<StepData_StepModel>") Model;
		opencascade::handle<StepData_StepModel> Model (const Standard_Boolean newone = Standard_False);

		/****************** PrintStatsTransfer ******************/
		%feature("compactdefaultargs") PrintStatsTransfer;
		%feature("autodoc", "* Displays the statistics for the last translation. what defines the kind of statistics that are displayed: - 0 gives general statistics (number of translated roots, number of warnings, number of fail messages), - 1 gives root results, - 2 gives statistics for all checked entities, - 3 gives the list of translated entities, - 4 gives warning and fail messages, - 5 gives fail messages only. mode is used according to the use of what. If what is 0, mode is ignored. If what is 1, 2 or 3, mode defines the following: - 0 lists the numbers of STEP entities in a STEP model, - 1 gives the number, identifier, type and result type for each STEP entity and/or its status (fail, warning, etc.), - 2 gives maximum information for each STEP entity (i.e. checks), - 3 gives the number of entities by the type of a STEP entity, - 4 gives the number of of STEP entities per result type and/or status, - 5 gives the number of pairs (STEP or result type and status), - 6 gives the number of pairs (STEP or result type and status) AND the list of entity numbers in the STEP model.
	:param what:
	:type what: int
	:param mode: default value is 0
	:type mode: int
	:rtype: None") PrintStatsTransfer;
		void PrintStatsTransfer (const Standard_Integer what,const Standard_Integer mode = 0);

		/****************** STEPControl_Writer ******************/
		%feature("compactdefaultargs") STEPControl_Writer;
		%feature("autodoc", "* Creates a Writer from scratch
	:rtype: None") STEPControl_Writer;
		 STEPControl_Writer ();

		/****************** STEPControl_Writer ******************/
		%feature("compactdefaultargs") STEPControl_Writer;
		%feature("autodoc", "* Creates a Writer from an already existing Session If <scratch> is True (D), clears already recorded data
	:param WS:
	:type WS: XSControl_WorkSession
	:param scratch: default value is Standard_True
	:type scratch: bool
	:rtype: None") STEPControl_Writer;
		 STEPControl_Writer (const opencascade::handle<XSControl_WorkSession> & WS,const Standard_Boolean scratch = Standard_True);

		/****************** SetTolerance ******************/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "* Sets a length-measure value that will be written to uncertainty-measure-with-unit when the next shape is translated.
	:param Tol:
	:type Tol: float
	:rtype: None") SetTolerance;
		void SetTolerance (const Standard_Real Tol);

		/****************** SetWS ******************/
		%feature("compactdefaultargs") SetWS;
		%feature("autodoc", "* Sets a specific session to <self>
	:param WS:
	:type WS: XSControl_WorkSession
	:param scratch: default value is Standard_True
	:type scratch: bool
	:rtype: None") SetWS;
		void SetWS (const opencascade::handle<XSControl_WorkSession> & WS,const Standard_Boolean scratch = Standard_True);

		/****************** Transfer ******************/
		%feature("compactdefaultargs") Transfer;
		%feature("autodoc", "* Translates shape sh to a STEP entity. mode defines the STEP entity type to be output: - STEPControlStd_AsIs translates a shape to its highest possible STEP representation. - STEPControlStd_ManifoldSolidBrep translates a shape to a STEP manifold_solid_brep or brep_with_voids entity. - STEPControlStd_FacetedBrep translates a shape into a STEP faceted_brep entity. - STEPControlStd_ShellBasedSurfaceModel translates a shape into a STEP shell_based_surface_model entity. - STEPControlStd_GeometricCurveSet translates a shape into a STEP geometric_curve_set entity.
	:param sh:
	:type sh: TopoDS_Shape
	:param mode:
	:type mode: STEPControl_StepModelType
	:param compgraph: default value is Standard_True
	:type compgraph: bool
	:rtype: IFSelect_ReturnStatus") Transfer;
		IFSelect_ReturnStatus Transfer (const TopoDS_Shape & sh,const STEPControl_StepModelType mode,const Standard_Boolean compgraph = Standard_True);

		/****************** UnsetTolerance ******************/
		%feature("compactdefaultargs") UnsetTolerance;
		%feature("autodoc", "* Unsets the tolerance formerly forced by SetTolerance
	:rtype: None") UnsetTolerance;
		void UnsetTolerance ();

		/****************** WS ******************/
		%feature("compactdefaultargs") WS;
		%feature("autodoc", "* Returns the session used in <self>
	:rtype: opencascade::handle<XSControl_WorkSession>") WS;
		opencascade::handle<XSControl_WorkSession> WS ();

		/****************** Write ******************/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "* Writes a STEP model in the file identified by filename.
	:param filename:
	:type filename: char *
	:rtype: IFSelect_ReturnStatus") Write;
		IFSelect_ReturnStatus Write (const char * filename);

};


%extend STEPControl_Writer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
