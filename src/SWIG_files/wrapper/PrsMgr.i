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
%module PrsMgr

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

%include PrsMgr_required_python_modules.i
%include PrsMgr_headers.i

/* typedefs */
typedef PrsMgr_Presentation3d * PrsMgr_Presentation3dPointer;
typedef PrsMgr_PresentableObject * PrsMgr_PresentableObjectPointer;
/* end typedefs declaration */

/* public enums */
enum PrsMgr_KindOfPrs {
	PrsMgr_KOP_2D = 0,
	PrsMgr_KOP_3D = 1,
};

enum PrsMgr_TypeOfPresentation3d {
	PrsMgr_TOP_AllView = 0,
	PrsMgr_TOP_ProjectorDependant = 1,
};

/* end public enums declaration */

%nodefaultctor PrsMgr_ModedPresentation;
class PrsMgr_ModedPresentation {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") PrsMgr_ModedPresentation;
		 PrsMgr_ModedPresentation ();
		%feature("autodoc", "Args:
	aPresentation(Handle_PrsMgr_Presentation)
	aMode(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") PrsMgr_ModedPresentation;
		 PrsMgr_ModedPresentation (const Handle_PrsMgr_Presentation & aPresentation,const Standard_Integer aMode);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_PrsMgr_Presentation

No detailed docstring for this function.") Presentation;
		Handle_PrsMgr_Presentation Presentation ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Mode;
		Standard_Integer Mode ();
};


%feature("shadow") PrsMgr_ModedPresentation::~PrsMgr_ModedPresentation %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend PrsMgr_ModedPresentation {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor PrsMgr_PresentableObject;
class PrsMgr_PresentableObject : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	PrsMgr_TypeOfPresentation3d

Returns information on whether the object accepts display in HLR mode or not.") TypeOfPresentation3d;
		PrsMgr_TypeOfPresentation3d TypeOfPresentation3d ();
		%feature("autodoc", "Args:
	aFlag(Graphic3d_TransModeFlags)
	APoint(gp_Pnt)

Returns:
	virtual void

Sets up Transform Persistence Mode for this object.  
This function used to lock in object position, rotation and / or zooming relative to camera position.  
Object will be drawn in the origin setted by APoint parameter (except Graphic3d_TMF_TriedronPers flag  
- see description later). aFlag should be:  
-   Graphic3d_TMF_None - no persistence attributes (reset);  
-   Graphic3d_TMF_PanPers - object doesn't move;  
-   Graphic3d_TMF_ZoomPers - object doesn't resize;  
-   Graphic3d_TMF_RotatePers - object doesn't rotate;  
-   Graphic3d_TMF_FullPers - pan, zoom and rotate transform persistence;  
-   Graphic3d_TMF_TriedronPers - object behaves like trihedron;  
-   combination (Graphic3d_TMF_PanPers | Graphic3d_TMF_ZoomPers);  
-   combination (Graphic3d_TMF_PanPers | Graphic3d_TMF_RotatePers);  
-   combination (Graphic3d_TMF_ZoomPers | Graphic3d_TMF_RotatePers).  
If Graphic3d_TMF_TriedronPers persistence mode selected APoint coordinates X and Y means:  
-   X = 0.0, Y = 0.0 - center of view window;  
-   X > 0.0, Y > 0.0 - right upper corner of view window;  
-   X > 0.0, Y < 0.0 - right lower corner of view window;  
-   X < 0.0, Y > 0.0 - left  upper corner of view window;  
-   X < 0.0, Y < 0.0 - left  lower corner of view window.  
And Z coordinate defines the gap from border of view window (except center position).") SetTransformPersistence;
		virtual void SetTransformPersistence (const Graphic3d_TransModeFlags & aFlag,const gp_Pnt & APoint);
		%feature("autodoc", "Args:
	aFlag(Graphic3d_TransModeFlags)

Returns:
	None

Calls previous method  with  point  (0,0,0)") SetTransformPersistence;
		void SetTransformPersistence (const Graphic3d_TransModeFlags & aFlag);
		%feature("autodoc", "Args:
	None
Returns:
	Graphic3d_TransModeFlags

Gets  Transform  Persistence Mode  for  this  object") GetTransformPersistenceMode;
		Graphic3d_TransModeFlags GetTransformPersistenceMode ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt

Gets  point  of  transform  persistence for  this  object") GetTransformPersistencePoint;
		gp_Pnt GetTransformPersistencePoint ();
		%feature("autodoc", "Args:
	aType(PrsMgr_TypeOfPresentation3d)

Returns:
	None

No detailed docstring for this function.") SetTypeOfPresentation;
		void SetTypeOfPresentation (const PrsMgr_TypeOfPresentation3d aType);
		%feature("autodoc", "Args:
	aMode(Standard_Integer)

Returns:
	None

flags the Prs of mode <AMode> to be Updated.  
         the Update will be done when needed.") SetToUpdate;
		void SetToUpdate (const Standard_Integer aMode);
		%feature("autodoc", "Args:
	None
Returns:
	None

flags all the Presentations to be Updated.") SetToUpdate;
		void SetToUpdate ();
		%feature("autodoc", "Args:
	ListOfMode(TColStd_ListOfInteger)

Returns:
	None

gives the list of modes which are flagged 'to be updated'.") ToBeUpdated;
		void ToBeUpdated (TColStd_ListOfInteger & ListOfMode);
		%feature("autodoc", "Args:
	aLoc(TopLoc_Location)

Returns:
	virtual void

No detailed docstring for this function.") SetLocation;
		virtual void SetLocation (const TopLoc_Location & aLoc);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") HasLocation;
		Standard_Boolean HasLocation ();
		%feature("autodoc", "Args:
	None
Returns:
	TopLoc_Location

No detailed docstring for this function.") Location;
		const TopLoc_Location & Location ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

No detailed docstring for this function.") ResetLocation;
		virtual void ResetLocation ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

No detailed docstring for this function.") UpdateLocation;
		virtual void UpdateLocation ();
		%feature("autodoc", "Args:
	P(Handle_Prs3d_Presentation)

Returns:
	virtual void

No detailed docstring for this function.") UpdateLocation;
		virtual void UpdateLocation (const Handle_Prs3d_Presentation & P);
		%feature("autodoc", "Args:
	thePrsMgr(Handle_PrsMgr_PresentationManager)
	theLayerId(Standard_Integer)

Returns:
	virtual void

Set Z layer ID and update all presentations of  
the presentable object. The layer can be set only for displayed object.  
If all object presentations are removed, the layer ID will be set to  
default value when computing presentation. The layers mechanism allows  
drawing objects in higher layers in overlay of objects in lower layers.") SetZLayer;
		virtual void SetZLayer (const Handle_PrsMgr_PresentationManager & thePrsMgr,const Standard_Integer theLayerId);
		%feature("autodoc", "Args:
	thePrsMgr(Handle_PrsMgr_PresentationManager)

Returns:
	Standard_Integer

Get ID of Z layer. If no presentations of object is displayed,  
and layer ID is unavailable, the -1 value is returned.") GetZLayer;
		Standard_Integer GetZLayer (const Handle_PrsMgr_PresentationManager & thePrsMgr);
		%feature("autodoc", "Args:
	thePlane(Graphic3d_ClipPlane_Handle)

Returns:
	virtual void

Adds clip plane for graphical clipping for all display mode  
presentations. The composition of clip planes truncates the rendering  
space to convex volume. Please be aware that number of supported  
clip plane is limited. The planes which exceed the limit are ignored.  
Besides of this, some planes can be already set in view where the object  
is shown: the number of these planes should be substracted from limit  
to predict the maximum possible number of object clipping planes.  
@param thePlane [in] the clip plane to be appended to map of clip planes.") AddClipPlane;
		virtual void AddClipPlane (const Graphic3d_ClipPlane_Handle & thePlane);
		%feature("autodoc", "Args:
	thePlane(Graphic3d_ClipPlane_Handle)

Returns:
	virtual void

Removes previously added clip plane.  
@param thePlane [in] the clip plane to be removed from map of clip planes.") RemoveClipPlane;
		virtual void RemoveClipPlane (const Graphic3d_ClipPlane_Handle & thePlane);
		%feature("autodoc", "Args:
	thePlanes(Graphic3d_SequenceOfHClipPlane)

Returns:
	virtual void

Set clip planes for graphical clipping for all display mode presentations.  
The composition of clip planes truncates the rendering space to convex  
volume. Please be aware that number of supported clip plane is limited.  
The planes which exceed the limit are ignored. Besides of this, some  
planes can be already set in view where the object is shown: the number  
of these planes should be substracted from limit to predict the maximum  
possible number of object clipping planes.") SetClipPlanes;
		virtual void SetClipPlanes (const Graphic3d_SequenceOfHClipPlane & thePlanes);
		%feature("autodoc", "Args:
	None
Returns:
	Graphic3d_SequenceOfHClipPlane

Get clip planes.  
@return set of previously added clip planes for all display mode presentations.") GetClipPlanes;
		const Graphic3d_SequenceOfHClipPlane & GetClipPlanes ();
};


%feature("shadow") PrsMgr_PresentableObject::~PrsMgr_PresentableObject %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend PrsMgr_PresentableObject {
	void _kill_pointed() {
		delete $self;
	}
};
%extend PrsMgr_PresentableObject {
	Handle_PrsMgr_PresentableObject GetHandle() {
	return *(Handle_PrsMgr_PresentableObject*) &$self;
	}
};

%nodefaultctor Handle_PrsMgr_PresentableObject;
class Handle_PrsMgr_PresentableObject : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_PrsMgr_PresentableObject();
        Handle_PrsMgr_PresentableObject(const Handle_PrsMgr_PresentableObject &aHandle);
        Handle_PrsMgr_PresentableObject(const PrsMgr_PresentableObject *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_PrsMgr_PresentableObject DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_PrsMgr_PresentableObject {
    PrsMgr_PresentableObject* GetObject() {
    return (PrsMgr_PresentableObject*)$self->Access();
    }
};
%feature("shadow") Handle_PrsMgr_PresentableObject::~Handle_PrsMgr_PresentableObject %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_PrsMgr_PresentableObject {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor PrsMgr_Presentation;
class PrsMgr_Presentation : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	virtual PrsMgr_KindOfPrs

2D or 3D") KindOfPresentation;
		virtual PrsMgr_KindOfPrs KindOfPresentation ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

Destructor") Destroy;
		virtual void Destroy ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_PrsMgr_PresentationManager

returns the PresentationManager in which the  
         presentation has been created.") PresentationManager;
		const Handle_PrsMgr_PresentationManager & PresentationManager ();
		%feature("autodoc", "Args:
	aStat(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") SetUpdateStatus;
		void SetUpdateStatus (const Standard_Boolean aStat);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") MustBeUpdated;
		Standard_Boolean MustBeUpdated ();
};


%feature("shadow") PrsMgr_Presentation::~PrsMgr_Presentation %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend PrsMgr_Presentation {
	void _kill_pointed() {
		delete $self;
	}
};
%extend PrsMgr_Presentation {
	Handle_PrsMgr_Presentation GetHandle() {
	return *(Handle_PrsMgr_Presentation*) &$self;
	}
};

%nodefaultctor Handle_PrsMgr_Presentation;
class Handle_PrsMgr_Presentation : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_PrsMgr_Presentation();
        Handle_PrsMgr_Presentation(const Handle_PrsMgr_Presentation &aHandle);
        Handle_PrsMgr_Presentation(const PrsMgr_Presentation *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_PrsMgr_Presentation DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_PrsMgr_Presentation {
    PrsMgr_Presentation* GetObject() {
    return (PrsMgr_Presentation*)$self->Access();
    }
};
%feature("shadow") Handle_PrsMgr_Presentation::~Handle_PrsMgr_Presentation %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_PrsMgr_Presentation {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor PrsMgr_PresentationManager;
class PrsMgr_PresentationManager : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

No detailed docstring for this function.") Is3D;
		virtual Standard_Boolean Is3D ();
		%feature("autodoc", "Args:
	aPresentableObject(Handle_PrsMgr_PresentableObject)
	aMode(Standard_Integer)=0

Returns:
	None

Displays the presentation of the object in the given  
         Presentation manager with the given mode.  
         The mode should be enumerated by the object which  
         inherits PresentableObject.") Display;
		void Display (const Handle_PrsMgr_PresentableObject & aPresentableObject,const Standard_Integer aMode = 0);
		%feature("autodoc", "Args:
	aPresentableObject(Handle_PrsMgr_PresentableObject)
	aMode(Standard_Integer)=0

Returns:
	None

erases the presentation of the object in the given  
         Presentation manager with the given mode.") Erase;
		void Erase (const Handle_PrsMgr_PresentableObject & aPresentableObject,const Standard_Integer aMode = 0);
		%feature("autodoc", "Args:
	aPresentableObject(Handle_PrsMgr_PresentableObject)
	aMode(Standard_Integer)=0

Returns:
	virtual void

Clears the presentation of the presentable object  
aPresentableObject in this framework with the  
display mode aMode.") Clear;
		virtual void Clear (const Handle_PrsMgr_PresentableObject & aPresentableObject,const Standard_Integer aMode = 0);
		%feature("autodoc", "Args:
	thePresentableObject(Handle_PrsMgr_PresentableObject)
	theMode(Standard_Integer)
	theValue(Standard_Boolean)

Returns:
	None

Sets the visibility of presentable object.") SetVisibility;
		void SetVisibility (const Handle_PrsMgr_PresentableObject & thePresentableObject,const Standard_Integer theMode,const Standard_Boolean theValue);
		%feature("autodoc", "Args:
	aPresentableObject(Handle_PrsMgr_PresentableObject)
	aMode(Standard_Integer)=0

Returns:
	None

Highlights the presentation of the presentable object  
aPresentableObject in this framework with the display mode aMode.") Highlight;
		void Highlight (const Handle_PrsMgr_PresentableObject & aPresentableObject,const Standard_Integer aMode = 0);
		%feature("autodoc", "Args:
	aPresentableObject(Handle_PrsMgr_PresentableObject)
	aMode(Standard_Integer)=0

Returns:
	None

Removes highlighting from the presentation of the  
presentable object aPresentableObject in this  
framework with the display mode aMode.") Unhighlight;
		void Unhighlight (const Handle_PrsMgr_PresentableObject & aPresentableObject,const Standard_Integer aMode = 0);
		%feature("autodoc", "Args:
	aPresentableObject(Handle_PrsMgr_PresentableObject)
	amode(Standard_Integer)
	aNewPrior(Standard_Integer)

Returns:
	None

Sets the display priority aNewPrior   of the  
presentable object aPresentableObject in this  
framework with the display mode aMode.") SetDisplayPriority;
		void SetDisplayPriority (const Handle_PrsMgr_PresentableObject & aPresentableObject,const Standard_Integer amode,const Standard_Integer aNewPrior);
		%feature("autodoc", "Args:
	aPresentableObject(Handle_PrsMgr_PresentableObject)
	amode(Standard_Integer)

Returns:
	Standard_Integer

Returns the display priority of the presentable object  
aPresentableObject in this framework with the  
display mode aMode.") DisplayPriority;
		Standard_Integer DisplayPriority (const Handle_PrsMgr_PresentableObject & aPresentableObject,const Standard_Integer amode);
		%feature("autodoc", "Args:
	thePresentableObject(Handle_PrsMgr_PresentableObject)
	theLayerId(Standard_Integer)

Returns:
	None

Set Z layer ID for all presentations of the object.") SetZLayer;
		void SetZLayer (const Handle_PrsMgr_PresentableObject & thePresentableObject,const Standard_Integer theLayerId);
		%feature("autodoc", "Args:
	thePresentableObject(Handle_PrsMgr_PresentableObject)

Returns:
	Standard_Integer

Get Z layer ID assigned to all presentations of the object.  
Method returns -1 value if object has no presentations and is  
impossible to get layer index.") GetZLayer;
		Standard_Integer GetZLayer (const Handle_PrsMgr_PresentableObject & thePresentableObject);
		%feature("autodoc", "Args:
	aPresentableObject(Handle_PrsMgr_PresentableObject)
	aMode(Standard_Integer)=0

Returns:
	Standard_Boolean

Returns true if the presentation of the presentable  
object aPresentableObject in this framework with the  
display mode aMode is displayed.") IsDisplayed;
		Standard_Boolean IsDisplayed (const Handle_PrsMgr_PresentableObject & aPresentableObject,const Standard_Integer aMode = 0);
		%feature("autodoc", "Args:
	aPresentableObject(Handle_PrsMgr_PresentableObject)
	aMode(Standard_Integer)=0

Returns:
	Standard_Boolean

Returns true if the presentation of the presentable  
object aPresentableObject in this framework with the  
display mode aMode is highlighted.") IsHighlighted;
		Standard_Boolean IsHighlighted (const Handle_PrsMgr_PresentableObject & aPresentableObject,const Standard_Integer aMode = 0);
		%feature("autodoc", "Args:
	aPresentableObject(Handle_PrsMgr_PresentableObject)
	aMode(Standard_Integer)=0

Returns:
	None

Updates the presentation of the presentable object  
aPresentableObject in this framework with the display mode aMode.") Update;
		void Update (const Handle_PrsMgr_PresentableObject & aPresentableObject,const Standard_Integer aMode = 0);
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

initializes the list of Prs to be displayed in transient mode") BeginDraw;
		virtual void BeginDraw ();
		%feature("autodoc", "Args:
	aPresentableObject(Handle_PrsMgr_PresentableObject)
	aMode(Standard_Integer)=0

Returns:
	None

Performs an iteration of the transient objects to look  
for the presentable objects with the display mode aMode.  
Appends the presentation of the presentable object  
aPresentableObject with the mode aMode to the list  
of objects in immediate mode.") Add;
		void Add (const Handle_PrsMgr_PresentableObject & aPresentableObject,const Standard_Integer aMode = 0);
		%feature("autodoc", "Args:
	aPresentableObject(Handle_PrsMgr_PresentableObject)
	aMode(Standard_Integer)=0

Returns:
	None

Performs an iteration of the transient objects to look  
for the presentable objects with the display mode aMode.  
Removes the presentation of the presentable object  
aPresentableObject with the mode aMode from the  
list of objects in immediate mode.") Remove;
		void Remove (const Handle_PrsMgr_PresentableObject & aPresentableObject,const Standard_Integer aMode = 0);
		%feature("autodoc", "Args:
	aView(Handle_V3d_View)
	DoubleBuffer(Standard_Boolean)=Standard_False

Returns:
	virtual void

Allows rapid drawing of the view aView by avoiding  
an update of the whole background. If DoubleBuffer  
is true, the background is drawn.") EndDraw;
		virtual void EndDraw (const Handle_V3d_View & aView,const Standard_Boolean DoubleBuffer = Standard_False);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns true if immediate (transient) mode is on.") IsImmediateModeOn;
		Standard_Boolean IsImmediateModeOn ();
		%feature("autodoc", "Args:
	aPresentableObject(Handle_PrsMgr_PresentableObject)
	aMode(Standard_Integer)=0

Returns:
	Standard_Boolean

Returns true if there is a presentation of the  
presentable object aPresentableObject in this  
framework, aPresentableObject having the display mode aMode.") HasPresentation;
		Standard_Boolean HasPresentation (const Handle_PrsMgr_PresentableObject & aPresentableObject,const Standard_Integer aMode = 0);
		%feature("autodoc", "Args:
	aPresentableObject(Handle_PrsMgr_PresentableObject)
	aMode(Standard_Integer)=0

Returns:
	Handle_PrsMgr_Presentation

Returns the presentation Presentation of the  
presentable object aPresentableObject in this  
framework. aPresentableObject has the display mode aMode.") Presentation;
		Handle_PrsMgr_Presentation Presentation (const Handle_PrsMgr_PresentableObject & aPresentableObject,const Standard_Integer aMode = 0);
};


%feature("shadow") PrsMgr_PresentationManager::~PrsMgr_PresentationManager %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend PrsMgr_PresentationManager {
	void _kill_pointed() {
		delete $self;
	}
};
%extend PrsMgr_PresentationManager {
	Handle_PrsMgr_PresentationManager GetHandle() {
	return *(Handle_PrsMgr_PresentationManager*) &$self;
	}
};

%nodefaultctor Handle_PrsMgr_PresentationManager;
class Handle_PrsMgr_PresentationManager : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_PrsMgr_PresentationManager();
        Handle_PrsMgr_PresentationManager(const Handle_PrsMgr_PresentationManager &aHandle);
        Handle_PrsMgr_PresentationManager(const PrsMgr_PresentationManager *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_PrsMgr_PresentationManager DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_PrsMgr_PresentationManager {
    PrsMgr_PresentationManager* GetObject() {
    return (PrsMgr_PresentationManager*)$self->Access();
    }
};
%feature("shadow") Handle_PrsMgr_PresentationManager::~Handle_PrsMgr_PresentationManager %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_PrsMgr_PresentationManager {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor PrsMgr_Presentations;
class PrsMgr_Presentations : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") PrsMgr_Presentations;
		 PrsMgr_Presentations ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	Other(PrsMgr_Presentations)

Returns:
	PrsMgr_Presentations

No detailed docstring for this function.") Assign;
		const PrsMgr_Presentations & Assign (const PrsMgr_Presentations & Other);
		%feature("autodoc", "Args:
	Other(PrsMgr_Presentations)

Returns:
	PrsMgr_Presentations

No detailed docstring for this function.") operator=;
		const PrsMgr_Presentations & operator = (const PrsMgr_Presentations & Other);
		%feature("autodoc", "Args:
	T(PrsMgr_ModedPresentation)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const PrsMgr_ModedPresentation & T);
		%feature("autodoc", "Args:
	S(PrsMgr_Presentations)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (PrsMgr_Presentations & S);
		%feature("autodoc", "Args:
	T(PrsMgr_ModedPresentation)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const PrsMgr_ModedPresentation & T);
		%feature("autodoc", "Args:
	S(PrsMgr_Presentations)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (PrsMgr_Presentations & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(PrsMgr_ModedPresentation)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const PrsMgr_ModedPresentation & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(PrsMgr_Presentations)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,PrsMgr_Presentations & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(PrsMgr_ModedPresentation)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const PrsMgr_ModedPresentation & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(PrsMgr_Presentations)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,PrsMgr_Presentations & S);
		%feature("autodoc", "Args:
	None
Returns:
	PrsMgr_ModedPresentation

No detailed docstring for this function.") First;
		const PrsMgr_ModedPresentation & First ();
		%feature("autodoc", "Args:
	None
Returns:
	PrsMgr_ModedPresentation

No detailed docstring for this function.") Last;
		const PrsMgr_ModedPresentation & Last ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Sub(PrsMgr_Presentations)

Returns:
	None

No detailed docstring for this function.") Split;
		void Split (const Standard_Integer Index,PrsMgr_Presentations & Sub);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	PrsMgr_ModedPresentation

No detailed docstring for this function.") Value;
		const PrsMgr_ModedPresentation & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	I(PrsMgr_ModedPresentation)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const PrsMgr_ModedPresentation & I);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	PrsMgr_ModedPresentation

No detailed docstring for this function.") ChangeValue;
		PrsMgr_ModedPresentation & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer Index);
		%feature("autodoc", "Args:
	FromIndex(Standard_Integer)
	ToIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%feature("shadow") PrsMgr_Presentations::~PrsMgr_Presentations %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend PrsMgr_Presentations {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor PrsMgr_Prs;
class PrsMgr_Prs : public Prs3d_Presentation {
	public:
		%feature("autodoc", "Args:
	aStructureManager(Handle_Graphic3d_StructureManager)
	aPresentation(PrsMgr_Presentation3dPointer)
	aTypeOfPresentation3d(PrsMgr_TypeOfPresentation3d)

Returns:
	None

No detailed docstring for this function.") PrsMgr_Prs;
		 PrsMgr_Prs (const Handle_Graphic3d_StructureManager & aStructureManager,const PrsMgr_Presentation3dPointer & aPresentation,const PrsMgr_TypeOfPresentation3d aTypeOfPresentation3d);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Compute;
		void Compute ();
		%feature("autodoc", "Args:
	aProjector(Handle_Graphic3d_DataStructureManager)

Returns:
	Handle_Graphic3d_Structure

No detailed docstring for this function.") Compute;
		Handle_Graphic3d_Structure Compute (const Handle_Graphic3d_DataStructureManager & aProjector);
		%feature("autodoc", "Args:
	aProjector(Handle_Graphic3d_DataStructureManager)
	AMatrix(TColStd_Array2OfReal)

Returns:
	Handle_Graphic3d_Structure

the 'degenerated' Structure is displayed with  
         a transformation defined by <AMatrix>  
         which is not a Pure Translation.  
         We have to take in account this Transformation  
         in the computation of hidden line removal...  
         returns a filled Graphic Structure.") Compute;
		Handle_Graphic3d_Structure Compute (const Handle_Graphic3d_DataStructureManager & aProjector,const TColStd_Array2OfReal & AMatrix);
		%feature("autodoc", "Args:
	aProjector(Handle_Graphic3d_DataStructureManager)
	ComputedStruct(Handle_Graphic3d_Structure)

Returns:
	None

No need to return a structure, just to fill  
         <ComputedStruct> ....") Compute;
		void Compute (const Handle_Graphic3d_DataStructureManager & aProjector,Handle_Graphic3d_Structure & ComputedStruct);
		%feature("autodoc", "Args:
	aProjector(Handle_Graphic3d_DataStructureManager)
	AMatrix(TColStd_Array2OfReal)
	aStructure(Handle_Graphic3d_Structure)

Returns:
	None

No Need to return a Structure, just to  
         Fill <aStructure>. The Trsf has to be taken in account  
         in the computation (Rotation Part....)") Compute;
		void Compute (const Handle_Graphic3d_DataStructureManager & aProjector,const TColStd_Array2OfReal & AMatrix,Handle_Graphic3d_Structure & aStructure);
};


%feature("shadow") PrsMgr_Prs::~PrsMgr_Prs %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend PrsMgr_Prs {
	void _kill_pointed() {
		delete $self;
	}
};
%extend PrsMgr_Prs {
	Handle_PrsMgr_Prs GetHandle() {
	return *(Handle_PrsMgr_Prs*) &$self;
	}
};

%nodefaultctor Handle_PrsMgr_Prs;
class Handle_PrsMgr_Prs : public Handle_Prs3d_Presentation {

    public:
        // constructors
        Handle_PrsMgr_Prs();
        Handle_PrsMgr_Prs(const Handle_PrsMgr_Prs &aHandle);
        Handle_PrsMgr_Prs(const PrsMgr_Prs *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_PrsMgr_Prs DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_PrsMgr_Prs {
    PrsMgr_Prs* GetObject() {
    return (PrsMgr_Prs*)$self->Access();
    }
};
%feature("shadow") Handle_PrsMgr_Prs::~Handle_PrsMgr_Prs %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_PrsMgr_Prs {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor PrsMgr_SequenceNodeOfPresentations;
class PrsMgr_SequenceNodeOfPresentations : public TCollection_SeqNode {
	public:
		%feature("autodoc", "Args:
	I(PrsMgr_ModedPresentation)
	n(TCollection_SeqNodePtr)
	p(TCollection_SeqNodePtr)

Returns:
	None

No detailed docstring for this function.") PrsMgr_SequenceNodeOfPresentations;
		 PrsMgr_SequenceNodeOfPresentations (const PrsMgr_ModedPresentation & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "Args:
	None
Returns:
	PrsMgr_ModedPresentation

No detailed docstring for this function.") Value;
		PrsMgr_ModedPresentation & Value ();
};


%feature("shadow") PrsMgr_SequenceNodeOfPresentations::~PrsMgr_SequenceNodeOfPresentations %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend PrsMgr_SequenceNodeOfPresentations {
	void _kill_pointed() {
		delete $self;
	}
};
%extend PrsMgr_SequenceNodeOfPresentations {
	Handle_PrsMgr_SequenceNodeOfPresentations GetHandle() {
	return *(Handle_PrsMgr_SequenceNodeOfPresentations*) &$self;
	}
};

%nodefaultctor Handle_PrsMgr_SequenceNodeOfPresentations;
class Handle_PrsMgr_SequenceNodeOfPresentations : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_PrsMgr_SequenceNodeOfPresentations();
        Handle_PrsMgr_SequenceNodeOfPresentations(const Handle_PrsMgr_SequenceNodeOfPresentations &aHandle);
        Handle_PrsMgr_SequenceNodeOfPresentations(const PrsMgr_SequenceNodeOfPresentations *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_PrsMgr_SequenceNodeOfPresentations DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_PrsMgr_SequenceNodeOfPresentations {
    PrsMgr_SequenceNodeOfPresentations* GetObject() {
    return (PrsMgr_SequenceNodeOfPresentations*)$self->Access();
    }
};
%feature("shadow") Handle_PrsMgr_SequenceNodeOfPresentations::~Handle_PrsMgr_SequenceNodeOfPresentations %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_PrsMgr_SequenceNodeOfPresentations {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor PrsMgr_Presentation3d;
class PrsMgr_Presentation3d : public PrsMgr_Presentation {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	PrsMgr_KindOfPrs

No detailed docstring for this function.") KindOfPresentation;
		PrsMgr_KindOfPrs KindOfPresentation ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

Destructor") Destroy;
		virtual void Destroy ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Prs3d_Presentation

No detailed docstring for this function.") Presentation;
		Handle_Prs3d_Presentation Presentation ();
};


%feature("shadow") PrsMgr_Presentation3d::~PrsMgr_Presentation3d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend PrsMgr_Presentation3d {
	void _kill_pointed() {
		delete $self;
	}
};
%extend PrsMgr_Presentation3d {
	Handle_PrsMgr_Presentation3d GetHandle() {
	return *(Handle_PrsMgr_Presentation3d*) &$self;
	}
};

%nodefaultctor Handle_PrsMgr_Presentation3d;
class Handle_PrsMgr_Presentation3d : public Handle_PrsMgr_Presentation {

    public:
        // constructors
        Handle_PrsMgr_Presentation3d();
        Handle_PrsMgr_Presentation3d(const Handle_PrsMgr_Presentation3d &aHandle);
        Handle_PrsMgr_Presentation3d(const PrsMgr_Presentation3d *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_PrsMgr_Presentation3d DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_PrsMgr_Presentation3d {
    PrsMgr_Presentation3d* GetObject() {
    return (PrsMgr_Presentation3d*)$self->Access();
    }
};
%feature("shadow") Handle_PrsMgr_Presentation3d::~Handle_PrsMgr_Presentation3d %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_PrsMgr_Presentation3d {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor PrsMgr_PresentationManager3d;
class PrsMgr_PresentationManager3d : public PrsMgr_PresentationManager {
	public:
		%feature("autodoc", "Args:
	aStructureManager(Handle_Graphic3d_StructureManager)

Returns:
	None

Creates a framework to manage displays and graphic  
entities with the 3D view aStructureManager.") PrsMgr_PresentationManager3d;
		 PrsMgr_PresentationManager3d (const Handle_Graphic3d_StructureManager & aStructureManager);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

No detailed docstring for this function.") Is3D;
		virtual Standard_Boolean Is3D ();
		%feature("autodoc", "Args:
	aPresentableObject(Handle_PrsMgr_PresentableObject)
	aColor(Quantity_NameOfColor)=Quantity_NOC_YELLOW
	aMode(Standard_Integer)=0

Returns:
	None

Highlights the graphic object aPresentableObject in  
the color aColor.  
aPresentableObject has the display mode aMode;  
this has the default value of 0, that is, the wireframe display mode.") Color;
		void Color (const Handle_PrsMgr_PresentableObject & aPresentableObject,const Quantity_NameOfColor aColor = Quantity_NOC_YELLOW,const Standard_Integer aMode = 0);
		%feature("autodoc", "Args:
	aPresentableObject(Handle_PrsMgr_PresentableObject)
	aMode(Standard_Integer)=0

Returns:
	None

highlights the boundbox of the presentation") BoundBox;
		void BoundBox (const Handle_PrsMgr_PresentableObject & aPresentableObject,const Standard_Integer aMode = 0);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") BeginDraw;
		void BeginDraw ();
		%feature("autodoc", "Args:
	aPrs(Handle_Prs3d_Presentation)

Returns:
	None

stores <aPrs> in a list of structure to be displayed  
         in immediate mode. will be taken in account in EndDraw Method.") AddToImmediateList;
		void AddToImmediateList (const Handle_Prs3d_Presentation & aPrs);
		%feature("autodoc", "Args:
	theView(Handle_V3d_View)
	DoubleBuffer(Standard_Boolean)=Standard_False

Returns:
	None

No detailed docstring for this function.") EndDraw;
		void EndDraw (const Handle_V3d_View & theView,const Standard_Boolean DoubleBuffer = Standard_False);
		%feature("autodoc", "Args:
	aPresentableObject(Handle_PrsMgr_PresentableObject)
	anOtherObject(Handle_PrsMgr_PresentableObject)
	aMode(Standard_Integer)=0
	anOtherMode(Standard_Integer)=0

Returns:
	None

No detailed docstring for this function.") Connect;
		void Connect (const Handle_PrsMgr_PresentableObject & aPresentableObject,const Handle_PrsMgr_PresentableObject & anOtherObject,const Standard_Integer aMode = 0,const Standard_Integer anOtherMode = 0);
		%feature("autodoc", "Args:
	aPresentableObject(Handle_PrsMgr_PresentableObject)
	aTransformation(Handle_Geom_Transformation)
	aMode(Standard_Integer)=0

Returns:
	None

Sets the transformation aTransformation for the  
presentable object aPresentableObject.  
aPresentableObject has the display mode aMode;  
this has the default value of 0, that is, the wireframe  
display mode.") Transform;
		void Transform (const Handle_PrsMgr_PresentableObject & aPresentableObject,const Handle_Geom_Transformation & aTransformation,const Standard_Integer aMode = 0);
		%feature("autodoc", "Args:
	aPresentableObject(Handle_PrsMgr_PresentableObject)
	X(Quantity_Length)
	Y(Quantity_Length)
	Z(Quantity_Length)
	aMode(Standard_Integer)=0

Returns:
	None

Sets a position to move the presentable object  
aPresentableObject to. This position is defined by the  
lengths along the x, y and z axes: X, Y and Z respectively.  
aPresentableObject has the display mode aMode;  
this has the default value of 0, that is, the wireframe display mode.") Place;
		void Place (const Handle_PrsMgr_PresentableObject & aPresentableObject,const Quantity_Length X,const Quantity_Length Y,const Quantity_Length Z,const Standard_Integer aMode = 0);
		%feature("autodoc", "Args:
	aPresentableObject(Handle_PrsMgr_PresentableObject)
	aTransformation(Handle_Geom_Transformation)
	aMode(Standard_Integer)=0

Returns:
	None

Defines the transformation aTransformation for the  
presentable object aPresentableObject.  
aPresentableObject has the display mode aMode;  
this has the default value of 0, that is, the wireframe  
display mode.") Multiply;
		void Multiply (const Handle_PrsMgr_PresentableObject & aPresentableObject,const Handle_Geom_Transformation & aTransformation,const Standard_Integer aMode = 0);
		%feature("autodoc", "Args:
	aPresentableObject(Handle_PrsMgr_PresentableObject)
	X(Quantity_Length)
	Y(Quantity_Length)
	Z(Quantity_Length)
	aMode(Standard_Integer)=0

Returns:
	None

Sets a position to move the presentable object  
aPresentableObject to. This position is defined by the  
lengths along the x, y and z axes: X, Y and Z respectively.  
aPresentableObject has the display mode aMode;  
this has the default value of 0, that is, the wireframe  
display mode.") Move;
		void Move (const Handle_PrsMgr_PresentableObject & aPresentableObject,const Quantity_Length X,const Quantity_Length Y,const Quantity_Length Z,const Standard_Integer aMode = 0);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Graphic3d_StructureManager

Returns the structure manager.") StructureManager;
		const Handle_Graphic3d_StructureManager & StructureManager ();
		%feature("autodoc", "Args:
	aPresentableObject(Handle_PrsMgr_PresentableObject)
	aColor(Quantity_NameOfColor)
	aMaterial(Graphic3d_NameOfMaterial)
	aMode(Standard_Integer)=0

Returns:
	None

this method will change the color and the aspect  
         of the presentations containg shaded structures.") SetShadingAspect;
		void SetShadingAspect (const Handle_PrsMgr_PresentableObject & aPresentableObject,const Quantity_NameOfColor aColor,const Graphic3d_NameOfMaterial aMaterial,const Standard_Integer aMode = 0);
		%feature("autodoc", "Args:
	aPresentableObject(Handle_PrsMgr_PresentableObject)
	aShadingAspect(Handle_Prs3d_ShadingAspect)
	aMode(Standard_Integer)=0

Returns:
	None

this method will change the color and the aspect  
         of the presentations containg shaded structures.") SetShadingAspect;
		void SetShadingAspect (const Handle_PrsMgr_PresentableObject & aPresentableObject,const Handle_Prs3d_ShadingAspect & aShadingAspect,const Standard_Integer aMode = 0);
		%feature("autodoc", "Args:
	aPresentableObject(Handle_PrsMgr_PresentableObject)
	aMode(Standard_Integer)=0

Returns:
	Handle_PrsMgr_Presentation3d

No detailed docstring for this function.") CastPresentation;
		Handle_PrsMgr_Presentation3d CastPresentation (const Handle_PrsMgr_PresentableObject & aPresentableObject,const Standard_Integer aMode = 0);
};


%feature("shadow") PrsMgr_PresentationManager3d::~PrsMgr_PresentationManager3d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend PrsMgr_PresentationManager3d {
	void _kill_pointed() {
		delete $self;
	}
};
%extend PrsMgr_PresentationManager3d {
	Handle_PrsMgr_PresentationManager3d GetHandle() {
	return *(Handle_PrsMgr_PresentationManager3d*) &$self;
	}
};

%nodefaultctor Handle_PrsMgr_PresentationManager3d;
class Handle_PrsMgr_PresentationManager3d : public Handle_PrsMgr_PresentationManager {

    public:
        // constructors
        Handle_PrsMgr_PresentationManager3d();
        Handle_PrsMgr_PresentationManager3d(const Handle_PrsMgr_PresentationManager3d &aHandle);
        Handle_PrsMgr_PresentationManager3d(const PrsMgr_PresentationManager3d *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_PrsMgr_PresentationManager3d DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_PrsMgr_PresentationManager3d {
    PrsMgr_PresentationManager3d* GetObject() {
    return (PrsMgr_PresentationManager3d*)$self->Access();
    }
};
%feature("shadow") Handle_PrsMgr_PresentationManager3d::~Handle_PrsMgr_PresentationManager3d %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_PrsMgr_PresentationManager3d {
    void _kill_pointed() {
        delete $self;
    }
};

