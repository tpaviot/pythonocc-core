/*
Copyright 2008-2015 Thomas Paviot (tpaviot@gmail.com)


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
%module (package="OCC") PrsMgr

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


%include PrsMgr_headers.i


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
		%feature("compactdefaultargs") PrsMgr_ModedPresentation;
		%feature("autodoc", "	:rtype: None
") PrsMgr_ModedPresentation;
		 PrsMgr_ModedPresentation ();
		%feature("compactdefaultargs") PrsMgr_ModedPresentation;
		%feature("autodoc", "	:param aPresentation:
	:type aPresentation: Handle_PrsMgr_Presentation &
	:param aMode:
	:type aMode: int
	:rtype: None
") PrsMgr_ModedPresentation;
		 PrsMgr_ModedPresentation (const Handle_PrsMgr_Presentation & aPresentation,const Standard_Integer aMode);
		%feature("compactdefaultargs") Presentation;
		%feature("autodoc", "	:rtype: Handle_PrsMgr_Presentation
") Presentation;
		Handle_PrsMgr_Presentation Presentation ();
		%feature("compactdefaultargs") Mode;
		%feature("autodoc", "	:rtype: int
") Mode;
		Standard_Integer Mode ();
};


%nodefaultctor PrsMgr_PresentableObject;
class PrsMgr_PresentableObject : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") TypeOfPresentation3d;
		%feature("autodoc", "	* Returns information on whether the object accepts display in HLR mode or not.

	:rtype: PrsMgr_TypeOfPresentation3d
") TypeOfPresentation3d;
		PrsMgr_TypeOfPresentation3d TypeOfPresentation3d ();
		%feature("compactdefaultargs") SetTransformPersistence;
		%feature("autodoc", "	* Sets up Transform Persistence Mode for this object. This function used to lock in object position, rotation and / or zooming relative to camera position. Object will be drawn in the origin setted by APoint parameter (except Graphic3d_TMF_TriedronPers flag - see description later). aFlag should be: - Graphic3d_TMF_None - no persistence attributes (reset); - Graphic3d_TMF_PanPers - object doesn't move; - Graphic3d_TMF_ZoomPers - object doesn't resize; - Graphic3d_TMF_RotatePers - object doesn't rotate; - Graphic3d_TMF_FullPers - pan, zoom and rotate transform persistence; - Graphic3d_TMF_TriedronPers - object behaves like trihedron; - combination (Graphic3d_TMF_PanPers | Graphic3d_TMF_ZoomPers); - combination (Graphic3d_TMF_PanPers | Graphic3d_TMF_RotatePers); - combination (Graphic3d_TMF_ZoomPers | Graphic3d_TMF_RotatePers). If Graphic3d_TMF_TriedronPers persistence mode selected APoint coordinates X and Y means: - X = 0.0, Y = 0.0 - center of view window; - X > 0.0, Y > 0.0 - right upper corner of view window; - X > 0.0, Y < 0.0 - right lower corner of view window; - X < 0.0, Y > 0.0 - left upper corner of view window; - X < 0.0, Y < 0.0 - left lower corner of view window. And Z coordinate defines the gap from border of view window (except center position).

	:param aFlag:
	:type aFlag: Graphic3d_TransModeFlags &
	:param APoint:
	:type APoint: gp_Pnt
	:rtype: void
") SetTransformPersistence;
		virtual void SetTransformPersistence (const Graphic3d_TransModeFlags & aFlag,const gp_Pnt & APoint);
		%feature("compactdefaultargs") SetTransformPersistence;
		%feature("autodoc", "	* Calls previous method with point (0,0,0)

	:param aFlag:
	:type aFlag: Graphic3d_TransModeFlags &
	:rtype: None
") SetTransformPersistence;
		void SetTransformPersistence (const Graphic3d_TransModeFlags & aFlag);
		%feature("compactdefaultargs") GetTransformPersistenceMode;
		%feature("autodoc", "	* Gets Transform Persistence Mode for this object

	:rtype: Graphic3d_TransModeFlags
") GetTransformPersistenceMode;
		Graphic3d_TransModeFlags GetTransformPersistenceMode ();
		%feature("compactdefaultargs") GetTransformPersistencePoint;
		%feature("autodoc", "	* Gets point of transform persistence for this object

	:rtype: gp_Pnt
") GetTransformPersistencePoint;
		gp_Pnt GetTransformPersistencePoint ();
		%feature("compactdefaultargs") SetTypeOfPresentation;
		%feature("autodoc", "	:param aType:
	:type aType: PrsMgr_TypeOfPresentation3d
	:rtype: None
") SetTypeOfPresentation;
		void SetTypeOfPresentation (const PrsMgr_TypeOfPresentation3d aType);
		%feature("compactdefaultargs") SetToUpdate;
		%feature("autodoc", "	* flags the Prs of mode <AMode> to be Updated. the Update will be done when needed.

	:param aMode:
	:type aMode: int
	:rtype: None
") SetToUpdate;
		void SetToUpdate (const Standard_Integer aMode);
		%feature("compactdefaultargs") SetToUpdate;
		%feature("autodoc", "	* flags all the Presentations to be Updated.

	:rtype: None
") SetToUpdate;
		void SetToUpdate ();
		%feature("compactdefaultargs") ToBeUpdated;
		%feature("autodoc", "	* gives the list of modes which are flagged 'to be updated'.

	:param ListOfMode:
	:type ListOfMode: TColStd_ListOfInteger &
	:rtype: None
") ToBeUpdated;
		void ToBeUpdated (TColStd_ListOfInteger & ListOfMode);
		%feature("compactdefaultargs") SetLocation;
		%feature("autodoc", "	:param aLoc:
	:type aLoc: TopLoc_Location &
	:rtype: void
") SetLocation;
		virtual void SetLocation (const TopLoc_Location & aLoc);
		%feature("compactdefaultargs") HasLocation;
		%feature("autodoc", "	:rtype: bool
") HasLocation;
		Standard_Boolean HasLocation ();
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "	:rtype: TopLoc_Location
") Location;
		const TopLoc_Location & Location ();
		%feature("compactdefaultargs") ResetLocation;
		%feature("autodoc", "	:rtype: void
") ResetLocation;
		virtual void ResetLocation ();
		%feature("compactdefaultargs") UpdateLocation;
		%feature("autodoc", "	:rtype: void
") UpdateLocation;
		virtual void UpdateLocation ();
		%feature("compactdefaultargs") UpdateLocation;
		%feature("autodoc", "	:param P:
	:type P: Handle_Prs3d_Presentation &
	:rtype: void
") UpdateLocation;
		virtual void UpdateLocation (const Handle_Prs3d_Presentation & P);
		%feature("compactdefaultargs") SetZLayer;
		%feature("autodoc", "	* Set Z layer ID and update all presentations of the presentable object. The layer can be set only for displayed object. If all object presentations are removed, the layer ID will be set to default value when computing presentation. The layers mechanism allows drawing objects in higher layers in overlay of objects in lower layers.

	:param thePrsMgr:
	:type thePrsMgr: Handle_PrsMgr_PresentationManager &
	:param theLayerId:
	:type theLayerId: int
	:rtype: void
") SetZLayer;
		virtual void SetZLayer (const Handle_PrsMgr_PresentationManager & thePrsMgr,const Standard_Integer theLayerId);
		%feature("compactdefaultargs") GetZLayer;
		%feature("autodoc", "	* Get ID of Z layer. If no presentations of object is displayed, and layer ID is unavailable, the -1 value is returned.

	:param thePrsMgr:
	:type thePrsMgr: Handle_PrsMgr_PresentationManager &
	:rtype: int
") GetZLayer;
		Standard_Integer GetZLayer (const Handle_PrsMgr_PresentationManager & thePrsMgr);
		%feature("compactdefaultargs") AddClipPlane;
		%feature("autodoc", "	* Adds clip plane for graphical clipping for all display mode presentations. The composition of clip planes truncates the rendering space to convex volume. Please be aware that number of supported clip plane is limited. The planes which exceed the limit are ignored. Besides of this, some planes can be already set in view where the object is shown: the number of these planes should be substracted from limit to predict the maximum possible number of object clipping planes. @param thePlane [in] the clip plane to be appended to map of clip planes.

	:param thePlane:
	:type thePlane: Graphic3d_ClipPlane_Handle &
	:rtype: void
") AddClipPlane;
		virtual void AddClipPlane (const Graphic3d_ClipPlane_Handle & thePlane);
		%feature("compactdefaultargs") RemoveClipPlane;
		%feature("autodoc", "	* Removes previously added clip plane. @param thePlane [in] the clip plane to be removed from map of clip planes.

	:param thePlane:
	:type thePlane: Graphic3d_ClipPlane_Handle &
	:rtype: void
") RemoveClipPlane;
		virtual void RemoveClipPlane (const Graphic3d_ClipPlane_Handle & thePlane);
		%feature("compactdefaultargs") SetClipPlanes;
		%feature("autodoc", "	* Set clip planes for graphical clipping for all display mode presentations. The composition of clip planes truncates the rendering space to convex volume. Please be aware that number of supported clip plane is limited. The planes which exceed the limit are ignored. Besides of this, some planes can be already set in view where the object is shown: the number of these planes should be substracted from limit to predict the maximum possible number of object clipping planes.

	:param thePlanes:
	:type thePlanes: Graphic3d_SequenceOfHClipPlane &
	:rtype: void
") SetClipPlanes;
		virtual void SetClipPlanes (const Graphic3d_SequenceOfHClipPlane & thePlanes);
		%feature("compactdefaultargs") GetClipPlanes;
		%feature("autodoc", "	* Get clip planes. returns set of previously added clip planes for all display mode presentations.

	:rtype: Graphic3d_SequenceOfHClipPlane
") GetClipPlanes;
		const Graphic3d_SequenceOfHClipPlane & GetClipPlanes ();
};


%extend PrsMgr_PresentableObject {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_PrsMgr_PresentableObject(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_PrsMgr_PresentableObject::Handle_PrsMgr_PresentableObject %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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

%nodefaultctor PrsMgr_Presentation;
class PrsMgr_Presentation : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") KindOfPresentation;
		%feature("autodoc", "	* 2D or 3D

	:rtype: PrsMgr_KindOfPrs
") KindOfPresentation;
		virtual PrsMgr_KindOfPrs KindOfPresentation ();
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	* Destructor

	:rtype: void
") Destroy;
		virtual void Destroy ();
		%feature("compactdefaultargs") PresentationManager;
		%feature("autodoc", "	* returns the PresentationManager in which the presentation has been created.

	:rtype: Handle_PrsMgr_PresentationManager
") PresentationManager;
		Handle_PrsMgr_PresentationManager PresentationManager ();
		%feature("compactdefaultargs") SetUpdateStatus;
		%feature("autodoc", "	:param aStat:
	:type aStat: bool
	:rtype: None
") SetUpdateStatus;
		void SetUpdateStatus (const Standard_Boolean aStat);
		%feature("compactdefaultargs") MustBeUpdated;
		%feature("autodoc", "	:rtype: bool
") MustBeUpdated;
		Standard_Boolean MustBeUpdated ();
};


%extend PrsMgr_Presentation {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_PrsMgr_Presentation(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_PrsMgr_Presentation::Handle_PrsMgr_Presentation %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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

%nodefaultctor PrsMgr_PresentationManager;
class PrsMgr_PresentationManager : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") Is3D;
		%feature("autodoc", "	:rtype: bool
") Is3D;
		virtual Standard_Boolean Is3D ();
		%feature("compactdefaultargs") Display;
		%feature("autodoc", "	* Displays the presentation of the object in the given Presentation manager with the given mode. The mode should be enumerated by the object which inherits PresentableObject.

	:param aPresentableObject:
	:type aPresentableObject: Handle_PrsMgr_PresentableObject &
	:param aMode: default value is 0
	:type aMode: int
	:rtype: None
") Display;
		void Display (const Handle_PrsMgr_PresentableObject & aPresentableObject,const Standard_Integer aMode = 0);
		%feature("compactdefaultargs") Erase;
		%feature("autodoc", "	* erases the presentation of the object in the given Presentation manager with the given mode.

	:param aPresentableObject:
	:type aPresentableObject: Handle_PrsMgr_PresentableObject &
	:param aMode: default value is 0
	:type aMode: int
	:rtype: None
") Erase;
		void Erase (const Handle_PrsMgr_PresentableObject & aPresentableObject,const Standard_Integer aMode = 0);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	* Clears the presentation of the presentable object aPresentableObject in this framework with the display mode aMode.

	:param aPresentableObject:
	:type aPresentableObject: Handle_PrsMgr_PresentableObject &
	:param aMode: default value is 0
	:type aMode: int
	:rtype: void
") Clear;
		virtual void Clear (const Handle_PrsMgr_PresentableObject & aPresentableObject,const Standard_Integer aMode = 0);
		%feature("compactdefaultargs") SetVisibility;
		%feature("autodoc", "	* Sets the visibility of presentable object.

	:param thePresentableObject:
	:type thePresentableObject: Handle_PrsMgr_PresentableObject &
	:param theMode:
	:type theMode: int
	:param theValue:
	:type theValue: bool
	:rtype: None
") SetVisibility;
		void SetVisibility (const Handle_PrsMgr_PresentableObject & thePresentableObject,const Standard_Integer theMode,const Standard_Boolean theValue);
		%feature("compactdefaultargs") Highlight;
		%feature("autodoc", "	* Highlights the presentation of the presentable object aPresentableObject in this framework with the display mode aMode.

	:param aPresentableObject:
	:type aPresentableObject: Handle_PrsMgr_PresentableObject &
	:param aMode: default value is 0
	:type aMode: int
	:rtype: None
") Highlight;
		void Highlight (const Handle_PrsMgr_PresentableObject & aPresentableObject,const Standard_Integer aMode = 0);
		%feature("compactdefaultargs") Unhighlight;
		%feature("autodoc", "	* Removes highlighting from the presentation of the presentable object aPresentableObject in this framework with the display mode aMode.

	:param aPresentableObject:
	:type aPresentableObject: Handle_PrsMgr_PresentableObject &
	:param aMode: default value is 0
	:type aMode: int
	:rtype: None
") Unhighlight;
		void Unhighlight (const Handle_PrsMgr_PresentableObject & aPresentableObject,const Standard_Integer aMode = 0);
		%feature("compactdefaultargs") SetDisplayPriority;
		%feature("autodoc", "	* Sets the display priority aNewPrior of the presentable object aPresentableObject in this framework with the display mode aMode.

	:param aPresentableObject:
	:type aPresentableObject: Handle_PrsMgr_PresentableObject &
	:param amode:
	:type amode: int
	:param aNewPrior:
	:type aNewPrior: int
	:rtype: None
") SetDisplayPriority;
		void SetDisplayPriority (const Handle_PrsMgr_PresentableObject & aPresentableObject,const Standard_Integer amode,const Standard_Integer aNewPrior);
		%feature("compactdefaultargs") DisplayPriority;
		%feature("autodoc", "	* Returns the display priority of the presentable object aPresentableObject in this framework with the display mode aMode.

	:param aPresentableObject:
	:type aPresentableObject: Handle_PrsMgr_PresentableObject &
	:param amode:
	:type amode: int
	:rtype: int
") DisplayPriority;
		Standard_Integer DisplayPriority (const Handle_PrsMgr_PresentableObject & aPresentableObject,const Standard_Integer amode);
		%feature("compactdefaultargs") SetZLayer;
		%feature("autodoc", "	* Set Z layer ID for all presentations of the object.

	:param thePresentableObject:
	:type thePresentableObject: Handle_PrsMgr_PresentableObject &
	:param theLayerId:
	:type theLayerId: int
	:rtype: None
") SetZLayer;
		void SetZLayer (const Handle_PrsMgr_PresentableObject & thePresentableObject,const Standard_Integer theLayerId);
		%feature("compactdefaultargs") GetZLayer;
		%feature("autodoc", "	* Get Z layer ID assigned to all presentations of the object. Method returns -1 value if object has no presentations and is impossible to get layer index.

	:param thePresentableObject:
	:type thePresentableObject: Handle_PrsMgr_PresentableObject &
	:rtype: int
") GetZLayer;
		Standard_Integer GetZLayer (const Handle_PrsMgr_PresentableObject & thePresentableObject);
		%feature("compactdefaultargs") IsDisplayed;
		%feature("autodoc", "	* Returns true if the presentation of the presentable object aPresentableObject in this framework with the display mode aMode is displayed.

	:param aPresentableObject:
	:type aPresentableObject: Handle_PrsMgr_PresentableObject &
	:param aMode: default value is 0
	:type aMode: int
	:rtype: bool
") IsDisplayed;
		Standard_Boolean IsDisplayed (const Handle_PrsMgr_PresentableObject & aPresentableObject,const Standard_Integer aMode = 0);
		%feature("compactdefaultargs") IsHighlighted;
		%feature("autodoc", "	* Returns true if the presentation of the presentable object aPresentableObject in this framework with the display mode aMode is highlighted.

	:param aPresentableObject:
	:type aPresentableObject: Handle_PrsMgr_PresentableObject &
	:param aMode: default value is 0
	:type aMode: int
	:rtype: bool
") IsHighlighted;
		Standard_Boolean IsHighlighted (const Handle_PrsMgr_PresentableObject & aPresentableObject,const Standard_Integer aMode = 0);
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "	* Updates the presentation of the presentable object aPresentableObject in this framework with the display mode aMode.

	:param aPresentableObject:
	:type aPresentableObject: Handle_PrsMgr_PresentableObject &
	:param aMode: default value is 0
	:type aMode: int
	:rtype: None
") Update;
		void Update (const Handle_PrsMgr_PresentableObject & aPresentableObject,const Standard_Integer aMode = 0);
		%feature("compactdefaultargs") BeginDraw;
		%feature("autodoc", "	* initializes the list of Prs to be displayed in transient mode

	:rtype: void
") BeginDraw;
		virtual void BeginDraw ();
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* Performs an iteration of the transient objects to look for the presentable objects with the display mode aMode. Appends the presentation of the presentable object aPresentableObject with the mode aMode to the list of objects in immediate mode.

	:param aPresentableObject:
	:type aPresentableObject: Handle_PrsMgr_PresentableObject &
	:param aMode: default value is 0
	:type aMode: int
	:rtype: None
") Add;
		void Add (const Handle_PrsMgr_PresentableObject & aPresentableObject,const Standard_Integer aMode = 0);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	* Performs an iteration of the transient objects to look for the presentable objects with the display mode aMode. Removes the presentation of the presentable object aPresentableObject with the mode aMode from the list of objects in immediate mode.

	:param aPresentableObject:
	:type aPresentableObject: Handle_PrsMgr_PresentableObject &
	:param aMode: default value is 0
	:type aMode: int
	:rtype: None
") Remove;
		void Remove (const Handle_PrsMgr_PresentableObject & aPresentableObject,const Standard_Integer aMode = 0);
		%feature("compactdefaultargs") EndDraw;
		%feature("autodoc", "	* Allows rapid drawing of the view aView by avoiding an update of the whole background. If DoubleBuffer is true, the background is drawn.

	:param aView:
	:type aView: Handle_V3d_View &
	:param DoubleBuffer: default value is Standard_False
	:type DoubleBuffer: bool
	:rtype: void
") EndDraw;
		virtual void EndDraw (const Handle_V3d_View & aView,const Standard_Boolean DoubleBuffer = Standard_False);
		%feature("compactdefaultargs") IsImmediateModeOn;
		%feature("autodoc", "	* Returns true if immediate (transient) mode is on.

	:rtype: bool
") IsImmediateModeOn;
		Standard_Boolean IsImmediateModeOn ();
		%feature("compactdefaultargs") HasPresentation;
		%feature("autodoc", "	* Returns true if there is a presentation of the presentable object aPresentableObject in this framework, aPresentableObject having the display mode aMode.

	:param aPresentableObject:
	:type aPresentableObject: Handle_PrsMgr_PresentableObject &
	:param aMode: default value is 0
	:type aMode: int
	:rtype: bool
") HasPresentation;
		Standard_Boolean HasPresentation (const Handle_PrsMgr_PresentableObject & aPresentableObject,const Standard_Integer aMode = 0);
		%feature("compactdefaultargs") Presentation;
		%feature("autodoc", "	* Returns the presentation Presentation of the presentable object aPresentableObject in this framework. aPresentableObject has the display mode aMode.

	:param aPresentableObject:
	:type aPresentableObject: Handle_PrsMgr_PresentableObject &
	:param aMode: default value is 0
	:type aMode: int
	:rtype: Handle_PrsMgr_Presentation
") Presentation;
		Handle_PrsMgr_Presentation Presentation (const Handle_PrsMgr_PresentableObject & aPresentableObject,const Standard_Integer aMode = 0);
};


%extend PrsMgr_PresentationManager {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_PrsMgr_PresentationManager(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_PrsMgr_PresentationManager::Handle_PrsMgr_PresentationManager %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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

%nodefaultctor PrsMgr_Presentations;
class PrsMgr_Presentations : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") PrsMgr_Presentations;
		%feature("autodoc", "	:rtype: None
") PrsMgr_Presentations;
		 PrsMgr_Presentations ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: PrsMgr_Presentations &
	:rtype: PrsMgr_Presentations
") Assign;
		const PrsMgr_Presentations & Assign (const PrsMgr_Presentations & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: PrsMgr_Presentations &
	:rtype: PrsMgr_Presentations
") operator=;
		const PrsMgr_Presentations & operator = (const PrsMgr_Presentations & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: PrsMgr_ModedPresentation &
	:rtype: None
") Append;
		void Append (const PrsMgr_ModedPresentation & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: PrsMgr_Presentations &
	:rtype: None
") Append;
		void Append (PrsMgr_Presentations & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: PrsMgr_ModedPresentation &
	:rtype: None
") Prepend;
		void Prepend (const PrsMgr_ModedPresentation & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: PrsMgr_Presentations &
	:rtype: None
") Prepend;
		void Prepend (PrsMgr_Presentations & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: PrsMgr_ModedPresentation &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const PrsMgr_ModedPresentation & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: PrsMgr_Presentations &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,PrsMgr_Presentations & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: PrsMgr_ModedPresentation &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const PrsMgr_ModedPresentation & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: PrsMgr_Presentations &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,PrsMgr_Presentations & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: PrsMgr_ModedPresentation
") First;
		const PrsMgr_ModedPresentation & First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: PrsMgr_ModedPresentation
") Last;
		const PrsMgr_ModedPresentation & Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: PrsMgr_Presentations &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,PrsMgr_Presentations & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: PrsMgr_ModedPresentation
") Value;
		const PrsMgr_ModedPresentation & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: PrsMgr_ModedPresentation &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const PrsMgr_ModedPresentation & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: PrsMgr_ModedPresentation
") ChangeValue;
		PrsMgr_ModedPresentation & ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param FromIndex:
	:type FromIndex: int
	:param ToIndex:
	:type ToIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%nodefaultctor PrsMgr_Prs;
class PrsMgr_Prs : public Prs3d_Presentation {
	public:
		%feature("compactdefaultargs") PrsMgr_Prs;
		%feature("autodoc", "	:param aStructureManager:
	:type aStructureManager: Handle_Graphic3d_StructureManager &
	:param aPresentation:
	:type aPresentation: PrsMgr_Presentation3dPointer &
	:param aTypeOfPresentation3d:
	:type aTypeOfPresentation3d: PrsMgr_TypeOfPresentation3d
	:rtype: None
") PrsMgr_Prs;
		 PrsMgr_Prs (const Handle_Graphic3d_StructureManager & aStructureManager,const PrsMgr_Presentation3dPointer & aPresentation,const PrsMgr_TypeOfPresentation3d aTypeOfPresentation3d);
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "	:rtype: None
") Compute;
		void Compute ();
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "	:param aProjector:
	:type aProjector: Handle_Graphic3d_DataStructureManager &
	:rtype: Handle_Graphic3d_Structure
") Compute;
		Handle_Graphic3d_Structure Compute (const Handle_Graphic3d_DataStructureManager & aProjector);
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "	* the 'degenerated' Structure is displayed with a transformation defined by <AMatrix> which is not a Pure Translation. We have to take in account this Transformation in the computation of hidden line removal... returns a filled Graphic Structure.

	:param aProjector:
	:type aProjector: Handle_Graphic3d_DataStructureManager &
	:param AMatrix:
	:type AMatrix: TColStd_Array2OfReal &
	:rtype: Handle_Graphic3d_Structure
") Compute;
		Handle_Graphic3d_Structure Compute (const Handle_Graphic3d_DataStructureManager & aProjector,const TColStd_Array2OfReal & AMatrix);
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "	* No need to return a structure, just to fill <ComputedStruct> ....

	:param aProjector:
	:type aProjector: Handle_Graphic3d_DataStructureManager &
	:param ComputedStruct:
	:type ComputedStruct: Handle_Graphic3d_Structure &
	:rtype: None
") Compute;
		void Compute (const Handle_Graphic3d_DataStructureManager & aProjector,Handle_Graphic3d_Structure & ComputedStruct);
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "	* No Need to return a Structure, just to Fill <aStructure>. The Trsf has to be taken in account in the computation (Rotation Part....)

	:param aProjector:
	:type aProjector: Handle_Graphic3d_DataStructureManager &
	:param AMatrix:
	:type AMatrix: TColStd_Array2OfReal &
	:param aStructure:
	:type aStructure: Handle_Graphic3d_Structure &
	:rtype: None
") Compute;
		void Compute (const Handle_Graphic3d_DataStructureManager & aProjector,const TColStd_Array2OfReal & AMatrix,Handle_Graphic3d_Structure & aStructure);
};


%extend PrsMgr_Prs {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_PrsMgr_Prs(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_PrsMgr_Prs::Handle_PrsMgr_Prs %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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

%nodefaultctor PrsMgr_SequenceNodeOfPresentations;
class PrsMgr_SequenceNodeOfPresentations : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") PrsMgr_SequenceNodeOfPresentations;
		%feature("autodoc", "	:param I:
	:type I: PrsMgr_ModedPresentation &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") PrsMgr_SequenceNodeOfPresentations;
		 PrsMgr_SequenceNodeOfPresentations (const PrsMgr_ModedPresentation & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: PrsMgr_ModedPresentation
") Value;
		PrsMgr_ModedPresentation & Value ();
};


%extend PrsMgr_SequenceNodeOfPresentations {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_PrsMgr_SequenceNodeOfPresentations(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_PrsMgr_SequenceNodeOfPresentations::Handle_PrsMgr_SequenceNodeOfPresentations %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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

%nodefaultctor PrsMgr_Presentation3d;
class PrsMgr_Presentation3d : public PrsMgr_Presentation {
	public:
		%feature("compactdefaultargs") KindOfPresentation;
		%feature("autodoc", "	:rtype: PrsMgr_KindOfPrs
") KindOfPresentation;
		PrsMgr_KindOfPrs KindOfPresentation ();
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	* Destructor

	:rtype: void
") Destroy;
		virtual void Destroy ();
		%feature("compactdefaultargs") Presentation;
		%feature("autodoc", "	:rtype: Handle_Prs3d_Presentation
") Presentation;
		Handle_Prs3d_Presentation Presentation ();
};


%extend PrsMgr_Presentation3d {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_PrsMgr_Presentation3d(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_PrsMgr_Presentation3d::Handle_PrsMgr_Presentation3d %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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

%nodefaultctor PrsMgr_PresentationManager3d;
class PrsMgr_PresentationManager3d : public PrsMgr_PresentationManager {
	public:
		%feature("compactdefaultargs") PrsMgr_PresentationManager3d;
		%feature("autodoc", "	* Creates a framework to manage displays and graphic entities with the 3D view aStructureManager.

	:param aStructureManager:
	:type aStructureManager: Handle_Graphic3d_StructureManager &
	:rtype: None
") PrsMgr_PresentationManager3d;
		 PrsMgr_PresentationManager3d (const Handle_Graphic3d_StructureManager & aStructureManager);
		%feature("compactdefaultargs") Is3D;
		%feature("autodoc", "	:rtype: bool
") Is3D;
		virtual Standard_Boolean Is3D ();
		%feature("compactdefaultargs") Color;
		%feature("autodoc", "	* Highlights the graphic object aPresentableObject in the color aColor. aPresentableObject has the display mode aMode; this has the default value of 0, that is, the wireframe display mode.

	:param aPresentableObject:
	:type aPresentableObject: Handle_PrsMgr_PresentableObject &
	:param aColor: default value is Quantity_NOC_YELLOW
	:type aColor: Quantity_NameOfColor
	:param aMode: default value is 0
	:type aMode: int
	:rtype: None
") Color;
		void Color (const Handle_PrsMgr_PresentableObject & aPresentableObject,const Quantity_NameOfColor aColor = Quantity_NOC_YELLOW,const Standard_Integer aMode = 0);
		%feature("compactdefaultargs") BoundBox;
		%feature("autodoc", "	* highlights the boundbox of the presentation

	:param aPresentableObject:
	:type aPresentableObject: Handle_PrsMgr_PresentableObject &
	:param aMode: default value is 0
	:type aMode: int
	:rtype: None
") BoundBox;
		void BoundBox (const Handle_PrsMgr_PresentableObject & aPresentableObject,const Standard_Integer aMode = 0);
		%feature("compactdefaultargs") BeginDraw;
		%feature("autodoc", "	:rtype: None
") BeginDraw;
		void BeginDraw ();
		%feature("compactdefaultargs") AddToImmediateList;
		%feature("autodoc", "	* stores <aPrs> in a list of structure to be displayed in immediate mode. will be taken in account in EndDraw Method.

	:param aPrs:
	:type aPrs: Handle_Prs3d_Presentation &
	:rtype: None
") AddToImmediateList;
		void AddToImmediateList (const Handle_Prs3d_Presentation & aPrs);
		%feature("compactdefaultargs") EndDraw;
		%feature("autodoc", "	:param theView:
	:type theView: Handle_V3d_View &
	:param DoubleBuffer: default value is Standard_False
	:type DoubleBuffer: bool
	:rtype: None
") EndDraw;
		void EndDraw (const Handle_V3d_View & theView,const Standard_Boolean DoubleBuffer = Standard_False);
		%feature("compactdefaultargs") Connect;
		%feature("autodoc", "	:param aPresentableObject:
	:type aPresentableObject: Handle_PrsMgr_PresentableObject &
	:param anOtherObject:
	:type anOtherObject: Handle_PrsMgr_PresentableObject &
	:param aMode: default value is 0
	:type aMode: int
	:param anOtherMode: default value is 0
	:type anOtherMode: int
	:rtype: None
") Connect;
		void Connect (const Handle_PrsMgr_PresentableObject & aPresentableObject,const Handle_PrsMgr_PresentableObject & anOtherObject,const Standard_Integer aMode = 0,const Standard_Integer anOtherMode = 0);
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "	* Sets the transformation aTransformation for the presentable object aPresentableObject. aPresentableObject has the display mode aMode; this has the default value of 0, that is, the wireframe display mode.

	:param aPresentableObject:
	:type aPresentableObject: Handle_PrsMgr_PresentableObject &
	:param aTransformation:
	:type aTransformation: Handle_Geom_Transformation &
	:param aMode: default value is 0
	:type aMode: int
	:rtype: None
") Transform;
		void Transform (const Handle_PrsMgr_PresentableObject & aPresentableObject,const Handle_Geom_Transformation & aTransformation,const Standard_Integer aMode = 0);
		%feature("compactdefaultargs") Place;
		%feature("autodoc", "	* Sets a position to move the presentable object aPresentableObject to. This position is defined by the lengths along the x, y and z axes: X, Y and Z respectively. aPresentableObject has the display mode aMode; this has the default value of 0, that is, the wireframe display mode.

	:param aPresentableObject:
	:type aPresentableObject: Handle_PrsMgr_PresentableObject &
	:param X:
	:type X: Quantity_Length
	:param Y:
	:type Y: Quantity_Length
	:param Z:
	:type Z: Quantity_Length
	:param aMode: default value is 0
	:type aMode: int
	:rtype: None
") Place;
		void Place (const Handle_PrsMgr_PresentableObject & aPresentableObject,const Quantity_Length X,const Quantity_Length Y,const Quantity_Length Z,const Standard_Integer aMode = 0);
		%feature("compactdefaultargs") Multiply;
		%feature("autodoc", "	* Defines the transformation aTransformation for the presentable object aPresentableObject. aPresentableObject has the display mode aMode; this has the default value of 0, that is, the wireframe display mode.

	:param aPresentableObject:
	:type aPresentableObject: Handle_PrsMgr_PresentableObject &
	:param aTransformation:
	:type aTransformation: Handle_Geom_Transformation &
	:param aMode: default value is 0
	:type aMode: int
	:rtype: None
") Multiply;
		void Multiply (const Handle_PrsMgr_PresentableObject & aPresentableObject,const Handle_Geom_Transformation & aTransformation,const Standard_Integer aMode = 0);
		%feature("compactdefaultargs") Move;
		%feature("autodoc", "	* Sets a position to move the presentable object aPresentableObject to. This position is defined by the lengths along the x, y and z axes: X, Y and Z respectively. aPresentableObject has the display mode aMode; this has the default value of 0, that is, the wireframe display mode.

	:param aPresentableObject:
	:type aPresentableObject: Handle_PrsMgr_PresentableObject &
	:param X:
	:type X: Quantity_Length
	:param Y:
	:type Y: Quantity_Length
	:param Z:
	:type Z: Quantity_Length
	:param aMode: default value is 0
	:type aMode: int
	:rtype: None
") Move;
		void Move (const Handle_PrsMgr_PresentableObject & aPresentableObject,const Quantity_Length X,const Quantity_Length Y,const Quantity_Length Z,const Standard_Integer aMode = 0);
		%feature("compactdefaultargs") StructureManager;
		%feature("autodoc", "	* Returns the structure manager.

	:rtype: Handle_Graphic3d_StructureManager
") StructureManager;
		Handle_Graphic3d_StructureManager StructureManager ();
		%feature("compactdefaultargs") SetShadingAspect;
		%feature("autodoc", "	* this method will change the color and the aspect of the presentations containg shaded structures.

	:param aPresentableObject:
	:type aPresentableObject: Handle_PrsMgr_PresentableObject &
	:param aColor:
	:type aColor: Quantity_NameOfColor
	:param aMaterial:
	:type aMaterial: Graphic3d_NameOfMaterial
	:param aMode: default value is 0
	:type aMode: int
	:rtype: None
") SetShadingAspect;
		void SetShadingAspect (const Handle_PrsMgr_PresentableObject & aPresentableObject,const Quantity_NameOfColor aColor,const Graphic3d_NameOfMaterial aMaterial,const Standard_Integer aMode = 0);
		%feature("compactdefaultargs") SetShadingAspect;
		%feature("autodoc", "	* this method will change the color and the aspect of the presentations containg shaded structures.

	:param aPresentableObject:
	:type aPresentableObject: Handle_PrsMgr_PresentableObject &
	:param aShadingAspect:
	:type aShadingAspect: Handle_Prs3d_ShadingAspect &
	:param aMode: default value is 0
	:type aMode: int
	:rtype: None
") SetShadingAspect;
		void SetShadingAspect (const Handle_PrsMgr_PresentableObject & aPresentableObject,const Handle_Prs3d_ShadingAspect & aShadingAspect,const Standard_Integer aMode = 0);
		%feature("compactdefaultargs") CastPresentation;
		%feature("autodoc", "	:param aPresentableObject:
	:type aPresentableObject: Handle_PrsMgr_PresentableObject &
	:param aMode: default value is 0
	:type aMode: int
	:rtype: Handle_PrsMgr_Presentation3d
") CastPresentation;
		Handle_PrsMgr_Presentation3d CastPresentation (const Handle_PrsMgr_PresentableObject & aPresentableObject,const Standard_Integer aMode = 0);
};


%extend PrsMgr_PresentationManager3d {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_PrsMgr_PresentationManager3d(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_PrsMgr_PresentationManager3d::Handle_PrsMgr_PresentationManager3d %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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

