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
%module (package="OCC") IGESControl

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

%include IGESControl_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%nodefaultctor IGESControl_ActorWrite;
class IGESControl_ActorWrite : public Transfer_ActorOfFinderProcess {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") IGESControl_ActorWrite;
		 IGESControl_ActorWrite ();
		%feature("autodoc", "Args:
	start(Handle_Transfer_Finder)

Returns:
	virtual Standard_Boolean

Recognizes a ShapeMapper") Recognize;
		virtual Standard_Boolean Recognize (const Handle_Transfer_Finder & start);
		%feature("autodoc", "Args:
	start(Handle_Transfer_Finder)
	FP(Handle_Transfer_FinderProcess)

Returns:
	virtual Handle_Transfer_Binder

Transfers Shape to IGES Entities  
 
          ModeTrans may be : 0 -> groups of Faces  
          or 1 -> BRep") Transfer;
		virtual Handle_Transfer_Binder Transfer (const Handle_Transfer_Finder & start,const Handle_Transfer_FinderProcess & FP);
};


%feature("shadow") IGESControl_ActorWrite::~IGESControl_ActorWrite %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IGESControl_ActorWrite {
	void _kill_pointed() {
		delete $self;
	}
};
%extend IGESControl_ActorWrite {
	Handle_IGESControl_ActorWrite GetHandle() {
	return *(Handle_IGESControl_ActorWrite*) &$self;
	}
};

%nodefaultctor Handle_IGESControl_ActorWrite;
class Handle_IGESControl_ActorWrite : public Handle_Transfer_ActorOfFinderProcess {

    public:
        // constructors
        Handle_IGESControl_ActorWrite();
        Handle_IGESControl_ActorWrite(const Handle_IGESControl_ActorWrite &aHandle);
        Handle_IGESControl_ActorWrite(const IGESControl_ActorWrite *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_IGESControl_ActorWrite DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_IGESControl_ActorWrite {
    IGESControl_ActorWrite* GetObject() {
    return (IGESControl_ActorWrite*)$self->Access();
    }
};
%feature("shadow") Handle_IGESControl_ActorWrite::~Handle_IGESControl_ActorWrite %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_IGESControl_ActorWrite {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor IGESControl_AlgoContainer;
class IGESControl_AlgoContainer : public IGESToBRep_AlgoContainer {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Empty constructor") IGESControl_AlgoContainer;
		 IGESControl_AlgoContainer ();
};


%feature("shadow") IGESControl_AlgoContainer::~IGESControl_AlgoContainer %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IGESControl_AlgoContainer {
	void _kill_pointed() {
		delete $self;
	}
};
%extend IGESControl_AlgoContainer {
	Handle_IGESControl_AlgoContainer GetHandle() {
	return *(Handle_IGESControl_AlgoContainer*) &$self;
	}
};

%nodefaultctor Handle_IGESControl_AlgoContainer;
class Handle_IGESControl_AlgoContainer : public Handle_IGESToBRep_AlgoContainer {

    public:
        // constructors
        Handle_IGESControl_AlgoContainer();
        Handle_IGESControl_AlgoContainer(const Handle_IGESControl_AlgoContainer &aHandle);
        Handle_IGESControl_AlgoContainer(const IGESControl_AlgoContainer *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_IGESControl_AlgoContainer DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_IGESControl_AlgoContainer {
    IGESControl_AlgoContainer* GetObject() {
    return (IGESControl_AlgoContainer*)$self->Access();
    }
};
%feature("shadow") Handle_IGESControl_AlgoContainer::~Handle_IGESControl_AlgoContainer %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_IGESControl_AlgoContainer {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor IGESControl_Controller;
class IGESControl_Controller : public XSControl_Controller {
	public:
		%feature("autodoc", "Args:
	modefnes(Standard_Boolean)=Standard_False

Returns:
	None

Initializes the use of IGES Norm (the first time) and returns  
          a Controller for IGES-5.1  
          If <modefnes> is True, sets it to internal FNES format") IGESControl_Controller;
		 IGESControl_Controller (const Standard_Boolean modefnes = Standard_False);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Interface_InterfaceModel

Creates a new empty Model ready to receive data of the Norm.  
          It is taken from IGES Template Model") NewModel;
		Handle_Interface_InterfaceModel NewModel ();
		%feature("autodoc", "Args:
	model(Handle_Interface_InterfaceModel)

Returns:
	Handle_Transfer_ActorOfTransientProcess

Returns the Actor for Read attached to the pair (norm,appli)  
          It is an Actor from IGESToBRep, adapted from an IGESModel :  
          Unit, tolerances") ActorRead;
		Handle_Transfer_ActorOfTransientProcess ActorRead (const Handle_Interface_InterfaceModel & model);
		%feature("autodoc", "Args:
	shape(TopoDS_Shape)
	FP(Handle_Transfer_FinderProcess)
	model(Handle_Interface_InterfaceModel)
	modetrans(Standard_Integer)=0

Returns:
	virtual IFSelect_ReturnStatus

Takes one Shape and transfers it to the InterfaceModel  
          (already created by NewModel for instance)  
          <modetrans> is to be interpreted by each kind of XstepAdaptor  
          Returns a status : 0 OK  1 No result  2 Fail  -1 bad modeshape  
              -2 bad model (requires an IGESModel)  
          modeshape : 0  groupe of face (version < 5.1)  
                      1  BREP-version 5.1 of IGES") TransferWriteShape;
		virtual IFSelect_ReturnStatus TransferWriteShape (const TopoDS_Shape & shape,const Handle_Transfer_FinderProcess & FP,const Handle_Interface_InterfaceModel & model,const Standard_Integer modetrans = 0);
		%feature("autodoc", "Args:
	None
Returns:
	static Standard_Boolean

Standard Initialisation. It creates a Controller for IGES and  
          records it to various names, available to select it later  
          Returns True when done, False if could not be done  
          Also, it creates and records an Adaptor for FNES") Init;
		static Standard_Boolean Init ();
		%feature("autodoc", "Args:
	WS(Handle_XSControl_WorkSession)

Returns:
	virtual void

No detailed docstring for this function.") Customise;
		virtual void Customise (Handle_XSControl_WorkSession & WS);
};


%feature("shadow") IGESControl_Controller::~IGESControl_Controller %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IGESControl_Controller {
	void _kill_pointed() {
		delete $self;
	}
};
%extend IGESControl_Controller {
	Handle_IGESControl_Controller GetHandle() {
	return *(Handle_IGESControl_Controller*) &$self;
	}
};

%nodefaultctor Handle_IGESControl_Controller;
class Handle_IGESControl_Controller : public Handle_XSControl_Controller {

    public:
        // constructors
        Handle_IGESControl_Controller();
        Handle_IGESControl_Controller(const Handle_IGESControl_Controller &aHandle);
        Handle_IGESControl_Controller(const IGESControl_Controller *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_IGESControl_Controller DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_IGESControl_Controller {
    IGESControl_Controller* GetObject() {
    return (IGESControl_Controller*)$self->Access();
    }
};
%feature("shadow") Handle_IGESControl_Controller::~Handle_IGESControl_Controller %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_IGESControl_Controller {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor IGESControl_IGESBoundary;
class IGESControl_IGESBoundary : public IGESToBRep_IGESBoundary {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates an object and calls inherited constuctor.") IGESControl_IGESBoundary;
		 IGESControl_IGESBoundary ();
		%feature("autodoc", "Args:
	CS(IGESToBRep_CurveAndSurface)

Returns:
	None

Creates an object and calls inherited constuctor.") IGESControl_IGESBoundary;
		 IGESControl_IGESBoundary (const IGESToBRep_CurveAndSurface & CS);
		%feature("autodoc", "Args:
	result(Standard_Boolean)
	checkclosure(Standard_Boolean)
	okCurve3d(Standard_Boolean)
	okCurve2d(Standard_Boolean)

Returns:
	virtual void

Checks result of translation of IGES boundary entities  
         (types 141, 142 or 508).  
         Checks consistency of 2D and 3D representations and keeps  
         only one if they are inconsistent.  
         Checks the closure of resulting wire and if it is not closed,  
         checks 2D and 3D representation and updates the resulting  
         wire to contain only closed representation.") Check;
		virtual void Check (const Standard_Boolean result,const Standard_Boolean checkclosure,const Standard_Boolean okCurve3d,const Standard_Boolean okCurve2d);
};


%feature("shadow") IGESControl_IGESBoundary::~IGESControl_IGESBoundary %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IGESControl_IGESBoundary {
	void _kill_pointed() {
		delete $self;
	}
};
%extend IGESControl_IGESBoundary {
	Handle_IGESControl_IGESBoundary GetHandle() {
	return *(Handle_IGESControl_IGESBoundary*) &$self;
	}
};

%nodefaultctor Handle_IGESControl_IGESBoundary;
class Handle_IGESControl_IGESBoundary : public Handle_IGESToBRep_IGESBoundary {

    public:
        // constructors
        Handle_IGESControl_IGESBoundary();
        Handle_IGESControl_IGESBoundary(const Handle_IGESControl_IGESBoundary &aHandle);
        Handle_IGESControl_IGESBoundary(const IGESControl_IGESBoundary *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_IGESControl_IGESBoundary DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_IGESControl_IGESBoundary {
    IGESControl_IGESBoundary* GetObject() {
    return (IGESControl_IGESBoundary*)$self->Access();
    }
};
%feature("shadow") Handle_IGESControl_IGESBoundary::~Handle_IGESControl_IGESBoundary %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_IGESControl_IGESBoundary {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor IGESControl_Reader;
class IGESControl_Reader : public XSControl_Reader {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates a Reader from scratch") IGESControl_Reader;
		 IGESControl_Reader ();
		%feature("autodoc", "Args:
	WS(Handle_XSControl_WorkSession)
	scratch(Standard_Boolean)=Standard_True

Returns:
	None

Creates a Reader from an already existing Session") IGESControl_Reader;
		 IGESControl_Reader (const Handle_XSControl_WorkSession & WS,const Standard_Boolean scratch = Standard_True);
		%feature("autodoc", "Args:
	ReadRoot(Standard_Boolean)

Returns:
	None

Set the transion of ALL Roots (if theReadOnlyVisible is False)  
          or of Visible Roots (if theReadOnlyVisible is True)") SetReadVisible;
		void SetReadVisible (const Standard_Boolean ReadRoot);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") GetReadVisible;
		Standard_Boolean GetReadVisible ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_IGESData_IGESModel

Returns the model as a IGESModel.  
          It can then be consulted (header, product)") IGESModel;
		Handle_IGESData_IGESModel IGESModel ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Integer

Determines the list of root entities from Model which are candidate for  
          a transfer to a Shape (type of entities is PRODUCT)  
          <theReadOnlyVisible> is taken into account to define roots") NbRootsForTransfer;
		virtual Standard_Integer NbRootsForTransfer ();
		%feature("autodoc", "Args:
	failwarn(IFSelect_PrintFail)
	mode(IFSelect_PrintCount)

Returns:
	None

Prints Statistics and check list for Transfer") PrintTransferInfo;
		void PrintTransferInfo (const IFSelect_PrintFail failwarn,const IFSelect_PrintCount mode);
};


%feature("shadow") IGESControl_Reader::~IGESControl_Reader %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IGESControl_Reader {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor IGESControl_ToolContainer;
class IGESControl_ToolContainer : public IGESToBRep_ToolContainer {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Empty constructor") IGESControl_ToolContainer;
		 IGESControl_ToolContainer ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Handle_IGESToBRep_IGESBoundary

Returns IGESControl_IGESBoundary") IGESBoundary;
		virtual Handle_IGESToBRep_IGESBoundary IGESBoundary ();
};


%feature("shadow") IGESControl_ToolContainer::~IGESControl_ToolContainer %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IGESControl_ToolContainer {
	void _kill_pointed() {
		delete $self;
	}
};
%extend IGESControl_ToolContainer {
	Handle_IGESControl_ToolContainer GetHandle() {
	return *(Handle_IGESControl_ToolContainer*) &$self;
	}
};

%nodefaultctor Handle_IGESControl_ToolContainer;
class Handle_IGESControl_ToolContainer : public Handle_IGESToBRep_ToolContainer {

    public:
        // constructors
        Handle_IGESControl_ToolContainer();
        Handle_IGESControl_ToolContainer(const Handle_IGESControl_ToolContainer &aHandle);
        Handle_IGESControl_ToolContainer(const IGESControl_ToolContainer *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_IGESControl_ToolContainer DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_IGESControl_ToolContainer {
    IGESControl_ToolContainer* GetObject() {
    return (IGESControl_ToolContainer*)$self->Access();
    }
};
%feature("shadow") Handle_IGESControl_ToolContainer::~Handle_IGESControl_ToolContainer %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_IGESControl_ToolContainer {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor IGESControl_Writer;
class IGESControl_Writer {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates a writer object with the  
default unit (millimeters) and write mode (Face).  
IGESControl_Writer (const Standard_CString unit,  
const Standard_Integer modecr = 0);") IGESControl_Writer;
		 IGESControl_Writer ();
		%feature("autodoc", "Args:
	unit(char *)
	modecr(Standard_Integer)=0

Returns:
	None

Creates a writer with given  
values for units and for write mode.  
unit may be any unit that is accepted by the IGES standard.  
By default, it is the millimeter.  
modecr defines the write mode and may be:  
- 0: Faces (default)  
- 1: BRep.") IGESControl_Writer;
		 IGESControl_Writer (const char * unit,const Standard_Integer modecr = 0);
		%feature("autodoc", "Args:
	model(Handle_IGESData_IGESModel)
	modecr(Standard_Integer)=0

Returns:
	None

Creates a writer object with the  
prepared IGES model model in write mode.  
modecr defines the write mode and may be:  
- 0: Faces (default)  
- 1: BRep.") IGESControl_Writer;
		 IGESControl_Writer (const Handle_IGESData_IGESModel & model,const Standard_Integer modecr = 0);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_IGESData_IGESModel

Returns the IGES model to be written in output.") Model;
		Handle_IGESData_IGESModel Model ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Transfer_FinderProcess

No detailed docstring for this function.") TransferProcess;
		Handle_Transfer_FinderProcess TransferProcess ();
		%feature("autodoc", "Args:
	TP(Handle_Transfer_FinderProcess)

Returns:
	None

Returns/Sets the TransferProcess : it contains final results  
          and if some, check messages") SetTransferProcess;
		void SetTransferProcess (const Handle_Transfer_FinderProcess & TP);
		%feature("autodoc", "Args:
	sh(TopoDS_Shape)

Returns:
	Standard_Boolean

Translates a Shape to IGES Entities and adds them to the model  
          Returns True if done, False if Shape not suitable for IGES or null") AddShape;
		Standard_Boolean AddShape (const TopoDS_Shape & sh);
		%feature("autodoc", "Args:
	geom(Handle_Standard_Transient)

Returns:
	Standard_Boolean

Translates a Geometry (Surface or Curve) to IGES Entities and  
          adds them to the model  
          Returns True if done, False if geom is neither a Surface or  
          a Curve suitable for IGES or is null") AddGeom;
		Standard_Boolean AddGeom (const Handle_Standard_Transient & geom);
		%feature("autodoc", "Args:
	ent(Handle_IGESData_IGESEntity)

Returns:
	Standard_Boolean

Adds an IGES entity (and the ones it references) to the model") AddEntity;
		Standard_Boolean AddEntity (const Handle_IGESData_IGESEntity & ent);
		%feature("autodoc", "Args:
	None
Returns:
	None

Computes the entities found in  
the model, which is ready to be written.  
This contrasts with the default computation of headers only.") ComputeModel;
		void ComputeModel ();
		%feature("autodoc", "Args:
	S(Standard_OStream)
	fnes(Standard_Boolean)=Standard_False

Returns:
	Standard_Boolean

Computes then writes the model to an OStream  
          Returns True when done, false in case of error") Write;
		Standard_Boolean Write (Standard_OStream & S,const Standard_Boolean fnes = Standard_False);
		%feature("autodoc", "Args:
	file(char *)
	fnes(Standard_Boolean)=Standard_False

Returns:
	Standard_Boolean

Prepares and writes an IGES model  
either to an OStream, S or to a file name,CString.  
Returns True if the operation was performed correctly and  
False if an error occurred (for instance,  
if the processor could not create the file).") Write;
		Standard_Boolean Write (const char * file,const Standard_Boolean fnes = Standard_False);
		%feature("autodoc", "Args:
	what(Standard_Integer)
	mode(Standard_Integer)=0

Returns:
	None

Prints Statistics about Transfer") PrintStatsTransfer;
		void PrintStatsTransfer (const Standard_Integer what,const Standard_Integer mode = 0);
};


%feature("shadow") IGESControl_Writer::~IGESControl_Writer %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend IGESControl_Writer {
	void _kill_pointed() {
		delete $self;
	}
};
