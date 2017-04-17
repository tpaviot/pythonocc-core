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
%module (package="OCC") STEPControl

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


%include STEPControl_headers.i


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

%nodefaultctor STEPControl_ActorRead;
class STEPControl_ActorRead : public Transfer_ActorOfTransientProcess {
	public:
		%feature("compactdefaultargs") STEPControl_ActorRead;
		%feature("autodoc", "	:rtype: None
") STEPControl_ActorRead;
		 STEPControl_ActorRead ();
		%feature("compactdefaultargs") Recognize;
		%feature("autodoc", "	:param start:
	:type start: Handle_Standard_Transient &
	:rtype: bool
") Recognize;
		virtual Standard_Boolean Recognize (const Handle_Standard_Transient & start);
		%feature("compactdefaultargs") Transfer;
		%feature("autodoc", "	:param start:
	:type start: Handle_Standard_Transient &
	:param TP:
	:type TP: Handle_Transfer_TransientProcess &
	:rtype: Handle_Transfer_Binder
") Transfer;
		virtual Handle_Transfer_Binder Transfer (const Handle_Standard_Transient & start,const Handle_Transfer_TransientProcess & TP);
		%feature("compactdefaultargs") TransferShape;
		%feature("autodoc", "	:param start:
	:type start: Handle_Standard_Transient &
	:param TP:
	:type TP: Handle_Transfer_TransientProcess &
	:param isManifold: default value is Standard_True
	:type isManifold: bool
	:rtype: Handle_Transfer_Binder
") TransferShape;
		Handle_Transfer_Binder TransferShape (const Handle_Standard_Transient & start,const Handle_Transfer_TransientProcess & TP,const Standard_Boolean isManifold = Standard_True);
		%feature("compactdefaultargs") PrepareUnits;
		%feature("autodoc", "	* set units and tolerances context by given ShapeRepresentation

	:param rep:
	:type rep: Handle_StepRepr_Representation &
	:param TP:
	:type TP: Handle_Transfer_TransientProcess &
	:rtype: None
") PrepareUnits;
		void PrepareUnits (const Handle_StepRepr_Representation & rep,const Handle_Transfer_TransientProcess & TP);
		%feature("compactdefaultargs") ResetUnits;
		%feature("autodoc", "	* reset units and tolerances context to default (mm, radians, read.precision.val, etc.)

	:rtype: None
") ResetUnits;
		void ResetUnits ();
		%feature("compactdefaultargs") ComputeTransformation;
		%feature("autodoc", "	* Computes transformation defined by two axis placements (in MAPPED_ITEM or ITEM_DEFINED_TRANSFORMATION) taking into account their representation contexts (i.e. units, which may be different) Returns True if transformation is computed and is not an identity.

	:param Origin:
	:type Origin: Handle_StepGeom_Axis2Placement3d &
	:param Target:
	:type Target: Handle_StepGeom_Axis2Placement3d &
	:param OrigContext:
	:type OrigContext: Handle_StepRepr_Representation &
	:param TargContext:
	:type TargContext: Handle_StepRepr_Representation &
	:param TP:
	:type TP: Handle_Transfer_TransientProcess &
	:param Trsf:
	:type Trsf: gp_Trsf
	:rtype: bool
") ComputeTransformation;
		Standard_Boolean ComputeTransformation (const Handle_StepGeom_Axis2Placement3d & Origin,const Handle_StepGeom_Axis2Placement3d & Target,const Handle_StepRepr_Representation & OrigContext,const Handle_StepRepr_Representation & TargContext,const Handle_Transfer_TransientProcess & TP,gp_Trsf & Trsf);
		%feature("compactdefaultargs") ComputeSRRWT;
		%feature("autodoc", "	* Computes transformation defined by given REPRESENTATION_RELATIONSHIP_WITH_TRANSFORMATION

	:param SRR:
	:type SRR: Handle_StepRepr_RepresentationRelationship &
	:param TP:
	:type TP: Handle_Transfer_TransientProcess &
	:param Trsf:
	:type Trsf: gp_Trsf
	:rtype: bool
") ComputeSRRWT;
		Standard_Boolean ComputeSRRWT (const Handle_StepRepr_RepresentationRelationship & SRR,const Handle_Transfer_TransientProcess & TP,gp_Trsf & Trsf);
};


%extend STEPControl_ActorRead {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_STEPControl_ActorRead(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_STEPControl_ActorRead::Handle_STEPControl_ActorRead %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_STEPControl_ActorRead;
class Handle_STEPControl_ActorRead : public Handle_Transfer_ActorOfTransientProcess {

    public:
        // constructors
        Handle_STEPControl_ActorRead();
        Handle_STEPControl_ActorRead(const Handle_STEPControl_ActorRead &aHandle);
        Handle_STEPControl_ActorRead(const STEPControl_ActorRead *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_STEPControl_ActorRead DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_STEPControl_ActorRead {
    STEPControl_ActorRead* _get_reference() {
    return (STEPControl_ActorRead*)$self->Access();
    }
};

%extend Handle_STEPControl_ActorRead {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend STEPControl_ActorRead {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor STEPControl_ActorWrite;
class STEPControl_ActorWrite : public Transfer_ActorOfFinderProcess {
	public:
		%feature("compactdefaultargs") STEPControl_ActorWrite;
		%feature("autodoc", "	:rtype: None
") STEPControl_ActorWrite;
		 STEPControl_ActorWrite ();
		%feature("compactdefaultargs") Recognize;
		%feature("autodoc", "	:param start:
	:type start: Handle_Transfer_Finder &
	:rtype: bool
") Recognize;
		virtual Standard_Boolean Recognize (const Handle_Transfer_Finder & start);
		%feature("compactdefaultargs") Transfer;
		%feature("autodoc", "	:param start:
	:type start: Handle_Transfer_Finder &
	:param FP:
	:type FP: Handle_Transfer_FinderProcess &
	:rtype: Handle_Transfer_Binder
") Transfer;
		virtual Handle_Transfer_Binder Transfer (const Handle_Transfer_Finder & start,const Handle_Transfer_FinderProcess & FP);
		%feature("compactdefaultargs") TransferSubShape;
		%feature("autodoc", "	:param start:
	:type start: Handle_Transfer_Finder &
	:param SDR:
	:type SDR: Handle_StepShape_ShapeDefinitionRepresentation &
	:param AX1:
	:type AX1: Handle_StepGeom_Axis2Placement3d &
	:param FP:
	:type FP: Handle_Transfer_FinderProcess &
	:param shapeGroup: default value is NULL
	:type shapeGroup: Handle_TopTools_HSequenceOfShape &
	:param isManifold: default value is Standard_True
	:type isManifold: bool
	:rtype: Handle_Transfer_Binder
") TransferSubShape;
		Handle_Transfer_Binder TransferSubShape (const Handle_Transfer_Finder & start,const Handle_StepShape_ShapeDefinitionRepresentation & SDR,Handle_StepGeom_Axis2Placement3d & AX1,const Handle_Transfer_FinderProcess & FP,const Handle_TopTools_HSequenceOfShape & shapeGroup = NULL,const Standard_Boolean isManifold = Standard_True);
		%feature("compactdefaultargs") TransferShape;
		%feature("autodoc", "	:param start:
	:type start: Handle_Transfer_Finder &
	:param SDR:
	:type SDR: Handle_StepShape_ShapeDefinitionRepresentation &
	:param FP:
	:type FP: Handle_Transfer_FinderProcess &
	:param shapeGroup: default value is NULL
	:type shapeGroup: Handle_TopTools_HSequenceOfShape &
	:param isManifold: default value is Standard_True
	:type isManifold: bool
	:rtype: Handle_Transfer_Binder
") TransferShape;
		Handle_Transfer_Binder TransferShape (const Handle_Transfer_Finder & start,const Handle_StepShape_ShapeDefinitionRepresentation & SDR,const Handle_Transfer_FinderProcess & FP,const Handle_TopTools_HSequenceOfShape & shapeGroup = NULL,const Standard_Boolean isManifold = Standard_True);
		%feature("compactdefaultargs") TransferCompound;
		%feature("autodoc", "	:param start:
	:type start: Handle_Transfer_Finder &
	:param SDR:
	:type SDR: Handle_StepShape_ShapeDefinitionRepresentation &
	:param FP:
	:type FP: Handle_Transfer_FinderProcess &
	:rtype: Handle_Transfer_Binder
") TransferCompound;
		Handle_Transfer_Binder TransferCompound (const Handle_Transfer_Finder & start,const Handle_StepShape_ShapeDefinitionRepresentation & SDR,const Handle_Transfer_FinderProcess & FP);
		%feature("compactdefaultargs") SetMode;
		%feature("autodoc", "	:param M:
	:type M: STEPControl_StepModelType
	:rtype: None
") SetMode;
		void SetMode (const STEPControl_StepModelType M);
		%feature("compactdefaultargs") Mode;
		%feature("autodoc", "	:rtype: STEPControl_StepModelType
") Mode;
		STEPControl_StepModelType Mode ();
		%feature("compactdefaultargs") SetGroupMode;
		%feature("autodoc", "	:param mode:
	:type mode: int
	:rtype: None
") SetGroupMode;
		void SetGroupMode (const Standard_Integer mode);
		%feature("compactdefaultargs") GroupMode;
		%feature("autodoc", "	:rtype: int
") GroupMode;
		Standard_Integer GroupMode ();
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "	:param Tol:
	:type Tol: float
	:rtype: None
") SetTolerance;
		void SetTolerance (const Standard_Real Tol);
		%feature("compactdefaultargs") IsAssembly;
		%feature("autodoc", "	* Customizable method to check whether shape S should be written as assembly or not Default implementation uses flag GroupMode and analyses the shape itself NOTE: this method can modify shape

	:param S:
	:type S: TopoDS_Shape &
	:rtype: bool
") IsAssembly;
		virtual Standard_Boolean IsAssembly (TopoDS_Shape & S);
};


%extend STEPControl_ActorWrite {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_STEPControl_ActorWrite(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_STEPControl_ActorWrite::Handle_STEPControl_ActorWrite %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_STEPControl_ActorWrite;
class Handle_STEPControl_ActorWrite : public Handle_Transfer_ActorOfFinderProcess {

    public:
        // constructors
        Handle_STEPControl_ActorWrite();
        Handle_STEPControl_ActorWrite(const Handle_STEPControl_ActorWrite &aHandle);
        Handle_STEPControl_ActorWrite(const STEPControl_ActorWrite *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_STEPControl_ActorWrite DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_STEPControl_ActorWrite {
    STEPControl_ActorWrite* _get_reference() {
    return (STEPControl_ActorWrite*)$self->Access();
    }
};

%extend Handle_STEPControl_ActorWrite {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend STEPControl_ActorWrite {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor STEPControl_Controller;
class STEPControl_Controller : public XSControl_Controller {
	public:
		%feature("compactdefaultargs") STEPControl_Controller;
		%feature("autodoc", "	* Initializes the use of STEP Norm (the first time) and returns a Controller

	:rtype: None
") STEPControl_Controller;
		 STEPControl_Controller ();
		%feature("compactdefaultargs") NewModel;
		%feature("autodoc", "	* Creates a new empty Model ready to receive data of the Norm. It is taken from STEP Template Model

	:rtype: Handle_Interface_InterfaceModel
") NewModel;
		Handle_Interface_InterfaceModel NewModel ();
		%feature("compactdefaultargs") ActorRead;
		%feature("autodoc", "	* Returns a new Actor for Read attached to the pair (norm,appli) It is a PmsToTopoDSAct_Actor

	:param model:
	:type model: Handle_Interface_InterfaceModel &
	:rtype: Handle_Transfer_ActorOfTransientProcess
") ActorRead;
		Handle_Transfer_ActorOfTransientProcess ActorRead (const Handle_Interface_InterfaceModel & model);
		%feature("compactdefaultargs") Customise;
		%feature("autodoc", "	:param WS:
	:type WS: Handle_XSControl_WorkSession &
	:rtype: void
") Customise;
		virtual void Customise (Handle_XSControl_WorkSession & WS);
		%feature("compactdefaultargs") TransferWriteShape;
		%feature("autodoc", "	* Takes one Shape and transfers it to the InterfaceModel (already created by NewModel for instance) <modeshape> is to be interpreted by each kind of XstepAdaptor Returns a status : 0 OK 1 No result 2 Fail -1 bad modeshape -2 bad model (requires a StepModel) modeshape : 1 Facetted BRep, 2 Shell, 3 Manifold Solid

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
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Standard Initialisation. It creates a Controller for STEP and records it to various names, available to select it later Returns True when done, False if could not be done

	:rtype: bool
") Init;
		static Standard_Boolean Init ();
};


%extend STEPControl_Controller {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_STEPControl_Controller(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_STEPControl_Controller::Handle_STEPControl_Controller %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_STEPControl_Controller;
class Handle_STEPControl_Controller : public Handle_XSControl_Controller {

    public:
        // constructors
        Handle_STEPControl_Controller();
        Handle_STEPControl_Controller(const Handle_STEPControl_Controller &aHandle);
        Handle_STEPControl_Controller(const STEPControl_Controller *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_STEPControl_Controller DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_STEPControl_Controller {
    STEPControl_Controller* _get_reference() {
    return (STEPControl_Controller*)$self->Access();
    }
};

%extend Handle_STEPControl_Controller {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend STEPControl_Controller {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor STEPControl_Reader;
class STEPControl_Reader : public XSControl_Reader {
	public:
		%feature("compactdefaultargs") STEPControl_Reader;
		%feature("autodoc", "	* Creates a reader object with an empty STEP model.

	:rtype: None
") STEPControl_Reader;
		 STEPControl_Reader ();
		%feature("compactdefaultargs") STEPControl_Reader;
		%feature("autodoc", "	* Creates a Reader for STEP from an already existing Session Clears the session if it was not yet set for STEP

	:param WS:
	:type WS: Handle_XSControl_WorkSession &
	:param scratch: default value is Standard_True
	:type scratch: bool
	:rtype: None
") STEPControl_Reader;
		 STEPControl_Reader (const Handle_XSControl_WorkSession & WS,const Standard_Boolean scratch = Standard_True);
		%feature("compactdefaultargs") StepModel;
		%feature("autodoc", "	* Returns the model as a StepModel. It can then be consulted (header, product)

	:rtype: Handle_StepData_StepModel
") StepModel;
		Handle_StepData_StepModel StepModel ();
		%feature("compactdefaultargs") TransferRoot;
		%feature("autodoc", "	* Transfers a root given its rank in the list of candidate roots Default is the first one Returns True if a shape has resulted, false else Same as inherited TransferOneRoot, kept for compatibility

	:param num: default value is 1
	:type num: int
	:rtype: bool
") TransferRoot;
		Standard_Boolean TransferRoot (const Standard_Integer num = 1);
		%feature("compactdefaultargs") NbRootsForTransfer;
		%feature("autodoc", "	* Determines the list of root entities from Model which are candidate for a transfer to a Shape (type of entities is PRODUCT)

	:rtype: int
") NbRootsForTransfer;
		virtual Standard_Integer NbRootsForTransfer ();
		%feature("compactdefaultargs") FileUnits;
		%feature("autodoc", "	* Returns sequence of all unit names for shape representations found in file

	:param theUnitLengthNames:
	:type theUnitLengthNames: TColStd_SequenceOfAsciiString &
	:param theUnitAngleNames:
	:type theUnitAngleNames: TColStd_SequenceOfAsciiString &
	:param theUnitSolidAngleNames:
	:type theUnitSolidAngleNames: TColStd_SequenceOfAsciiString &
	:rtype: None
") FileUnits;
		void FileUnits (TColStd_SequenceOfAsciiString & theUnitLengthNames,TColStd_SequenceOfAsciiString & theUnitAngleNames,TColStd_SequenceOfAsciiString & theUnitSolidAngleNames);
};


%extend STEPControl_Reader {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor STEPControl_Writer;
class STEPControl_Writer {
	public:
		%feature("compactdefaultargs") STEPControl_Writer;
		%feature("autodoc", "	* Creates a Writer from scratch

	:rtype: None
") STEPControl_Writer;
		 STEPControl_Writer ();
		%feature("compactdefaultargs") STEPControl_Writer;
		%feature("autodoc", "	* Creates a Writer from an already existing Session If <scratch> is True (D), clears already recorded data

	:param WS:
	:type WS: Handle_XSControl_WorkSession &
	:param scratch: default value is Standard_True
	:type scratch: bool
	:rtype: None
") STEPControl_Writer;
		 STEPControl_Writer (const Handle_XSControl_WorkSession & WS,const Standard_Boolean scratch = Standard_True);
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "	* Sets a length-measure value that will be written to uncertainty-measure-with-unit when the next shape is translated.

	:param Tol:
	:type Tol: float
	:rtype: None
") SetTolerance;
		void SetTolerance (const Standard_Real Tol);
		%feature("compactdefaultargs") UnsetTolerance;
		%feature("autodoc", "	* Unsets the tolerance formerly forced by SetTolerance

	:rtype: None
") UnsetTolerance;
		void UnsetTolerance ();
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
		%feature("autodoc", "	* Returns the produced model. Produces a new one if not yet done or if <newone> is True This method allows for instance to edit product or header data before writing.

	:param newone: default value is Standard_False
	:type newone: bool
	:rtype: Handle_StepData_StepModel
") Model;
		Handle_StepData_StepModel Model (const Standard_Boolean newone = Standard_False);
		%feature("compactdefaultargs") Transfer;
		%feature("autodoc", "	* Translates shape sh to a STEP entity. mode defines the STEP entity type to be output: - STEPControlStd_AsIs translates a shape to its highest possible STEP representation. - STEPControlStd_ManifoldSolidBrep translates a shape to a STEP manifold_solid_brep or brep_with_voids entity. - STEPControlStd_FacetedBrep translates a shape into a STEP faceted_brep entity. - STEPControlStd_ShellBasedSurfaceModel translates a shape into a STEP shell_based_surface_model entity. - STEPControlStd_GeometricCurveSet translates a shape into a STEP geometric_curve_set entity.

	:param sh:
	:type sh: TopoDS_Shape &
	:param mode:
	:type mode: STEPControl_StepModelType
	:param compgraph: default value is Standard_True
	:type compgraph: bool
	:rtype: IFSelect_ReturnStatus
") Transfer;
		IFSelect_ReturnStatus Transfer (const TopoDS_Shape & sh,const STEPControl_StepModelType mode,const Standard_Boolean compgraph = Standard_True);
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "	* Writes a STEP model in the file identified by filename.

	:param filename:
	:type filename: char *
	:rtype: IFSelect_ReturnStatus
") Write;
		IFSelect_ReturnStatus Write (const char * filename);
		%feature("compactdefaultargs") PrintStatsTransfer;
		%feature("autodoc", "	* Displays the statistics for the last translation. what defines the kind of statistics that are displayed: - 0 gives general statistics (number of translated roots, number of warnings, number of fail messages), - 1 gives root results, - 2 gives statistics for all checked entities, - 3 gives the list of translated entities, - 4 gives warning and fail messages, - 5 gives fail messages only. mode is used according to the use of what. If what is 0, mode is ignored. If what is 1, 2 or 3, mode defines the following: - 0 lists the numbers of STEP entities in a STEP model, - 1 gives the number, identifier, type and result type for each STEP entity and/or its status (fail, warning, etc.), - 2 gives maximum information for each STEP entity (i.e. checks), - 3 gives the number of entities by the type of a STEP entity, - 4 gives the number of of STEP entities per result type and/or status, - 5 gives the number of pairs (STEP or result type and status), - 6 gives the number of pairs (STEP or result type and status) AND the list of entity numbers in the STEP model.

	:param what:
	:type what: int
	:param mode: default value is 0
	:type mode: int
	:rtype: None
") PrintStatsTransfer;
		void PrintStatsTransfer (const Standard_Integer what,const Standard_Integer mode = 0);
};


%extend STEPControl_Writer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
