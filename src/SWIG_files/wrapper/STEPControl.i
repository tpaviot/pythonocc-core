/*
Copyright 2008-2014 Thomas Paviot (tpaviot@gmail.com)


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
%module STEPControl

#pragma SWIG nowarn=504,325,503

%{
#ifdef WNT
#pragma warning(disable : 4716)
#endif
%}

%include ../common/CommonIncludes.i
%include ../common/StandardDefines.i
%include ../common/ExceptionCatcher.i
%include ../common/FunctionTransformers.i
%include ../common/Operators.i

%include STEPControl_required_python_modules.i
%include STEPControl_headers.i

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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") STEPControl_ActorRead;
		 STEPControl_ActorRead ();
		%feature("autodoc", "Args:
	start(Handle_Standard_Transient)

Returns:
	virtual Standard_Boolean

No detailed docstring for this function.") Recognize;
		virtual Standard_Boolean Recognize (const Handle_Standard_Transient & start);
		%feature("autodoc", "Args:
	start(Handle_Standard_Transient)
	TP(Handle_Transfer_TransientProcess)

Returns:
	virtual Handle_Transfer_Binder

No detailed docstring for this function.") Transfer;
		virtual Handle_Transfer_Binder Transfer (const Handle_Standard_Transient & start,const Handle_Transfer_TransientProcess & TP);
		%feature("autodoc", "Args:
	start(Handle_Standard_Transient)
	TP(Handle_Transfer_TransientProcess)
	isManifold(Standard_Boolean)=Standard_True

Returns:
	Handle_Transfer_Binder

No detailed docstring for this function.") TransferShape;
		Handle_Transfer_Binder TransferShape (const Handle_Standard_Transient & start,const Handle_Transfer_TransientProcess & TP,const Standard_Boolean isManifold = Standard_True);
		%feature("autodoc", "Args:
	rep(Handle_StepRepr_Representation)
	TP(Handle_Transfer_TransientProcess)

Returns:
	None

set units and tolerances context by given ShapeRepresentation") PrepareUnits;
		void PrepareUnits (const Handle_StepRepr_Representation & rep,const Handle_Transfer_TransientProcess & TP);
		%feature("autodoc", "Args:
	None
Returns:
	None

reset units and tolerances context to default  
        (mm, radians, read.precision.val, etc.)") ResetUnits;
		void ResetUnits ();
		%feature("autodoc", "Args:
	Origin(Handle_StepGeom_Axis2Placement3d)
	Target(Handle_StepGeom_Axis2Placement3d)
	OrigContext(Handle_StepRepr_Representation)
	TargContext(Handle_StepRepr_Representation)
	TP(Handle_Transfer_TransientProcess)
	Trsf(gp_Trsf)

Returns:
	Standard_Boolean

Computes transformation defined by two axis placements (in MAPPED_ITEM  
         or ITEM_DEFINED_TRANSFORMATION) taking into account their  
         representation contexts (i.e. units, which may be different)  
         Returns True if transformation is computed and is not an identity.") ComputeTransformation;
		Standard_Boolean ComputeTransformation (const Handle_StepGeom_Axis2Placement3d & Origin,const Handle_StepGeom_Axis2Placement3d & Target,const Handle_StepRepr_Representation & OrigContext,const Handle_StepRepr_Representation & TargContext,const Handle_Transfer_TransientProcess & TP,gp_Trsf & Trsf);
		%feature("autodoc", "Args:
	SRR(Handle_StepRepr_RepresentationRelationship)
	TP(Handle_Transfer_TransientProcess)
	Trsf(gp_Trsf)

Returns:
	Standard_Boolean

Computes transformation defined by given  
         REPRESENTATION_RELATIONSHIP_WITH_TRANSFORMATION") ComputeSRRWT;
		Standard_Boolean ComputeSRRWT (const Handle_StepRepr_RepresentationRelationship & SRR,const Handle_Transfer_TransientProcess & TP,gp_Trsf & Trsf);
};


%feature("shadow") STEPControl_ActorRead::~STEPControl_ActorRead %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend STEPControl_ActorRead {
	void _kill_pointed() {
		delete $self;
	}
};
%extend STEPControl_ActorRead {
	Handle_STEPControl_ActorRead GetHandle() {
	return *(Handle_STEPControl_ActorRead*) &$self;
	}
};

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
    STEPControl_ActorRead* GetObject() {
    return (STEPControl_ActorRead*)$self->Access();
    }
};
%feature("shadow") Handle_STEPControl_ActorRead::~Handle_STEPControl_ActorRead %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_STEPControl_ActorRead {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor STEPControl_ActorWrite;
class STEPControl_ActorWrite : public Transfer_ActorOfFinderProcess {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") STEPControl_ActorWrite;
		 STEPControl_ActorWrite ();
		%feature("autodoc", "Args:
	start(Handle_Transfer_Finder)

Returns:
	virtual Standard_Boolean

No detailed docstring for this function.") Recognize;
		virtual Standard_Boolean Recognize (const Handle_Transfer_Finder & start);
		%feature("autodoc", "Args:
	start(Handle_Transfer_Finder)
	FP(Handle_Transfer_FinderProcess)

Returns:
	virtual Handle_Transfer_Binder

No detailed docstring for this function.") Transfer;
		virtual Handle_Transfer_Binder Transfer (const Handle_Transfer_Finder & start,const Handle_Transfer_FinderProcess & FP);
		%feature("autodoc", "Args:
	start(Handle_Transfer_Finder)
	SDR(Handle_StepShape_ShapeDefinitionRepresentation)
	AX1(Handle_StepGeom_Axis2Placement3d)
	FP(Handle_Transfer_FinderProcess)
	shapeGroup(Handle_TopTools_HSequenceOfShape)=NULL
	isManifold(Standard_Boolean)=Standard_True

Returns:
	Handle_Transfer_Binder

No detailed docstring for this function.") TransferSubShape;
		Handle_Transfer_Binder TransferSubShape (const Handle_Transfer_Finder & start,const Handle_StepShape_ShapeDefinitionRepresentation & SDR,Handle_StepGeom_Axis2Placement3d & AX1,const Handle_Transfer_FinderProcess & FP,const Handle_TopTools_HSequenceOfShape & shapeGroup = NULL,const Standard_Boolean isManifold = Standard_True);
		%feature("autodoc", "Args:
	start(Handle_Transfer_Finder)
	SDR(Handle_StepShape_ShapeDefinitionRepresentation)
	FP(Handle_Transfer_FinderProcess)
	shapeGroup(Handle_TopTools_HSequenceOfShape)=NULL
	isManifold(Standard_Boolean)=Standard_True

Returns:
	Handle_Transfer_Binder

No detailed docstring for this function.") TransferShape;
		Handle_Transfer_Binder TransferShape (const Handle_Transfer_Finder & start,const Handle_StepShape_ShapeDefinitionRepresentation & SDR,const Handle_Transfer_FinderProcess & FP,const Handle_TopTools_HSequenceOfShape & shapeGroup = NULL,const Standard_Boolean isManifold = Standard_True);
		%feature("autodoc", "Args:
	start(Handle_Transfer_Finder)
	SDR(Handle_StepShape_ShapeDefinitionRepresentation)
	FP(Handle_Transfer_FinderProcess)

Returns:
	Handle_Transfer_Binder

No detailed docstring for this function.") TransferCompound;
		Handle_Transfer_Binder TransferCompound (const Handle_Transfer_Finder & start,const Handle_StepShape_ShapeDefinitionRepresentation & SDR,const Handle_Transfer_FinderProcess & FP);
		%feature("autodoc", "Args:
	M(STEPControl_StepModelType)

Returns:
	None

No detailed docstring for this function.") SetMode;
		void SetMode (const STEPControl_StepModelType M);
		%feature("autodoc", "Args:
	None
Returns:
	STEPControl_StepModelType

No detailed docstring for this function.") Mode;
		STEPControl_StepModelType Mode ();
		%feature("autodoc", "Args:
	mode(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") SetGroupMode;
		void SetGroupMode (const Standard_Integer mode);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") GroupMode;
		Standard_Integer GroupMode ();
		%feature("autodoc", "Args:
	Tol(Standard_Real)

Returns:
	None

No detailed docstring for this function.") SetTolerance;
		void SetTolerance (const Standard_Real Tol);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	virtual Standard_Boolean

Customizable method to check whether shape S should  
         be written as assembly or not  
         Default implementation uses flag GroupMode and analyses  
         the shape itself  
         NOTE: this method can modify shape") IsAssembly;
		virtual Standard_Boolean IsAssembly (TopoDS_Shape & S);
};


%feature("shadow") STEPControl_ActorWrite::~STEPControl_ActorWrite %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend STEPControl_ActorWrite {
	void _kill_pointed() {
		delete $self;
	}
};
%extend STEPControl_ActorWrite {
	Handle_STEPControl_ActorWrite GetHandle() {
	return *(Handle_STEPControl_ActorWrite*) &$self;
	}
};

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
    STEPControl_ActorWrite* GetObject() {
    return (STEPControl_ActorWrite*)$self->Access();
    }
};
%feature("shadow") Handle_STEPControl_ActorWrite::~Handle_STEPControl_ActorWrite %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_STEPControl_ActorWrite {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor STEPControl_Controller;
class STEPControl_Controller : public XSControl_Controller {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Initializes the use of STEP Norm (the first time) and  
          returns a Controller") STEPControl_Controller;
		 STEPControl_Controller ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Interface_InterfaceModel

Creates a new empty Model ready to receive data of the Norm.  
          It is taken from STEP Template Model") NewModel;
		Handle_Interface_InterfaceModel NewModel ();
		%feature("autodoc", "Args:
	model(Handle_Interface_InterfaceModel)

Returns:
	Handle_Transfer_ActorOfTransientProcess

Returns a new Actor for Read attached to the pair (norm,appli)  
          It is a PmsToTopoDSAct_Actor") ActorRead;
		Handle_Transfer_ActorOfTransientProcess ActorRead (const Handle_Interface_InterfaceModel & model);
		%feature("autodoc", "Args:
	WS(Handle_XSControl_WorkSession)

Returns:
	virtual void

No detailed docstring for this function.") Customise;
		virtual void Customise (Handle_XSControl_WorkSession & WS);
		%feature("autodoc", "Args:
	shape(TopoDS_Shape)
	FP(Handle_Transfer_FinderProcess)
	model(Handle_Interface_InterfaceModel)
	modetrans(Standard_Integer)=0

Returns:
	virtual IFSelect_ReturnStatus

Takes one Shape and transfers it to the InterfaceModel  
          (already created by NewModel for instance)  
          <modeshape> is to be interpreted by each kind of XstepAdaptor  
          Returns a status : 0 OK  1 No result  2 Fail  -1 bad modeshape  
              -2 bad model (requires a StepModel)  
          modeshape : 1 Facetted BRep, 2 Shell, 3 Manifold Solid") TransferWriteShape;
		virtual IFSelect_ReturnStatus TransferWriteShape (const TopoDS_Shape & shape,const Handle_Transfer_FinderProcess & FP,const Handle_Interface_InterfaceModel & model,const Standard_Integer modetrans = 0);
		%feature("autodoc", "Args:
	None
Returns:
	static Standard_Boolean

Standard Initialisation. It creates a Controller for STEP  
          and records it to various names, available to select it later  
          Returns True when done, False if could not be done") Init;
		static Standard_Boolean Init ();
};


%feature("shadow") STEPControl_Controller::~STEPControl_Controller %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend STEPControl_Controller {
	void _kill_pointed() {
		delete $self;
	}
};
%extend STEPControl_Controller {
	Handle_STEPControl_Controller GetHandle() {
	return *(Handle_STEPControl_Controller*) &$self;
	}
};

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
    STEPControl_Controller* GetObject() {
    return (STEPControl_Controller*)$self->Access();
    }
};
%feature("shadow") Handle_STEPControl_Controller::~Handle_STEPControl_Controller %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_STEPControl_Controller {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor STEPControl_Reader;
class STEPControl_Reader : public XSControl_Reader {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates a reader object with an empty STEP model.") STEPControl_Reader;
		 STEPControl_Reader ();
		%feature("autodoc", "Args:
	WS(Handle_XSControl_WorkSession)
	scratch(Standard_Boolean)=Standard_True

Returns:
	None

Creates a Reader for STEP from an already existing Session  
          Clears the session if it was not yet set for STEP") STEPControl_Reader;
		 STEPControl_Reader (const Handle_XSControl_WorkSession & WS,const Standard_Boolean scratch = Standard_True);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_StepData_StepModel

Returns the model as a StepModel.  
          It can then be consulted (header, product)") StepModel;
		Handle_StepData_StepModel StepModel ();
		%feature("autodoc", "Args:
	num(Standard_Integer)=1

Returns:
	Standard_Boolean

Transfers a root given its rank in the list of candidate roots  
          Default is the first one  
          Returns True if a shape has resulted, false else  
          Same as inherited TransferOneRoot, kept for compatibility") TransferRoot;
		Standard_Boolean TransferRoot (const Standard_Integer num = 1);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Integer

Determines the list of root entities from Model which are candidate for  
          a transfer to a Shape (type of entities is PRODUCT)") NbRootsForTransfer;
		virtual Standard_Integer NbRootsForTransfer ();
		%feature("autodoc", "Args:
	theUnitLengthNames(TColStd_SequenceOfAsciiString)
	theUnitAngleNames(TColStd_SequenceOfAsciiString)
	theUnitSolidAngleNames(TColStd_SequenceOfAsciiString)

Returns:
	None

Returns sequence of all unit names for shape representations  
          found in file") FileUnits;
		void FileUnits (TColStd_SequenceOfAsciiString & theUnitLengthNames,TColStd_SequenceOfAsciiString & theUnitAngleNames,TColStd_SequenceOfAsciiString & theUnitSolidAngleNames);
};


%feature("shadow") STEPControl_Reader::~STEPControl_Reader %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend STEPControl_Reader {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor STEPControl_Writer;
class STEPControl_Writer {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates a Writer from scratch") STEPControl_Writer;
		 STEPControl_Writer ();
		%feature("autodoc", "Args:
	WS(Handle_XSControl_WorkSession)
	scratch(Standard_Boolean)=Standard_True

Returns:
	None

Creates a Writer from an already existing Session  
          If <scratch> is True (D), clears already recorded data") STEPControl_Writer;
		 STEPControl_Writer (const Handle_XSControl_WorkSession & WS,const Standard_Boolean scratch = Standard_True);
		%feature("autodoc", "Args:
	Tol(Standard_Real)

Returns:
	None

Sets a length-measure value that  
          will be written to uncertainty-measure-with-unit  
          when the next shape is translated.") SetTolerance;
		void SetTolerance (const Standard_Real Tol);
		%feature("autodoc", "Args:
	None
Returns:
	None

Unsets the tolerance formerly forced by SetTolerance") UnsetTolerance;
		void UnsetTolerance ();
		%feature("autodoc", "Args:
	WS(Handle_XSControl_WorkSession)
	scratch(Standard_Boolean)=Standard_True

Returns:
	None

Sets a specific session to <self>") SetWS;
		void SetWS (const Handle_XSControl_WorkSession & WS,const Standard_Boolean scratch = Standard_True);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_XSControl_WorkSession

Returns the session used in <self>") WS;
		Handle_XSControl_WorkSession WS ();
		%feature("autodoc", "Args:
	newone(Standard_Boolean)=Standard_False

Returns:
	Handle_StepData_StepModel

Returns the produced model. Produces a new one if not yet done  
          or if <newone> is True  
          This method allows for instance to edit product or header  
          data before writing.") Model;
		Handle_StepData_StepModel Model (const Standard_Boolean newone = Standard_False);
		%feature("autodoc", "Args:
	sh(TopoDS_Shape)
	mode(STEPControl_StepModelType)
	compgraph(Standard_Boolean)=Standard_True

Returns:
	IFSelect_ReturnStatus

Translates shape sh to a STEP  
entity. mode defines the STEP entity type to be output:  
- STEPControlStd_AsIs translates a shape to its highest possible  
  STEP representation.  
- STEPControlStd_ManifoldSolidBrep translates a shape to a STEP  
  manifold_solid_brep or brep_with_voids entity.  
- STEPControlStd_FacetedBrep translates a shape into a STEP  
  faceted_brep entity.  
- STEPControlStd_ShellBasedSurfaceModel translates a shape into a STEP  
  shell_based_surface_model entity.  
- STEPControlStd_GeometricCurveSet translates a shape into a STEP  
  geometric_curve_set entity.") Transfer;
		IFSelect_ReturnStatus Transfer (const TopoDS_Shape & sh,const STEPControl_StepModelType mode,const Standard_Boolean compgraph = Standard_True);
		%feature("autodoc", "Args:
	filename(char *)

Returns:
	IFSelect_ReturnStatus

Writes a STEP model in the file identified by filename.") Write;
		IFSelect_ReturnStatus Write (const char * filename);
		%feature("autodoc", "Args:
	what(Standard_Integer)
	mode(Standard_Integer)=0

Returns:
	None

Displays the statistics for the  
last translation. what defines the kind of statistics that are displayed:  
- 0 gives general statistics   (number of translated roots,  
  number of warnings, number of   fail messages),  
- 1 gives root results,  
- 2 gives statistics for all checked entities,  
- 3 gives the list of translated entities,  
- 4 gives warning and fail messages,  
- 5 gives fail messages only.  
  mode is used according to the use of what. If what is 0, mode is  
ignored. If what is 1, 2 or 3, mode defines the following:  
- 0 lists the numbers of STEP entities in a STEP model,  
- 1 gives the number, identifier, type and result type for each  
  STEP entity and/or its status (fail, warning, etc.),  
- 2 gives maximum information for each STEP entity (i.e. checks),  
- 3 gives the number of entities by the type of a STEP entity,  
- 4 gives the number of of STEP entities per result type and/or status,  
- 5 gives the number of pairs (STEP or result type and status),  
- 6 gives the number of pairs (STEP or result type and status)  
  AND the list of entity numbers in the STEP model.") PrintStatsTransfer;
		void PrintStatsTransfer (const Standard_Integer what,const Standard_Integer mode = 0);
};


%feature("shadow") STEPControl_Writer::~STEPControl_Writer %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend STEPControl_Writer {
	void _kill_pointed() {
		delete $self;
	}
};
