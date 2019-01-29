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
%define PRSMGRDOCSTRING
"No docstring provided."
%enddef
%module (package="OCC.Core", docstring=PRSMGRDOCSTRING) PrsMgr

#pragma SWIG nowarn=504,325,503,520,350,351,383,389,394,395, 404

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


%include PrsMgr_headers.i

/* templates */
%template(PrsMgr_ListOfPresentations) NCollection_List <Handle_Prs3d_Presentation>;
%template(PrsMgr_Presentations) NCollection_Sequence <PrsMgr_ModedPresentation>;
/* end templates declaration */


/* typedefs */
typedef PrsMgr_PresentableObject * PrsMgr_PresentableObjectPointer;
typedef PrsMgr_Presentation * PrsMgr_PresentationPointer;
typedef PrsMgr_Presentation PrsMgr_Presentation3d;
typedef Handle_PrsMgr_Presentation Handle_PrsMgr_Presentation3d;
typedef PrsMgr_PresentationManager PrsMgr_PresentationManager3d;
typedef Handle_PrsMgr_PresentationManager Handle_PrsMgr_PresentationManager3d;
typedef NCollection_List <Handle_Prs3d_Presentation> PrsMgr_ListOfPresentations;
typedef NCollection_Sequence <PrsMgr_ModedPresentation> PrsMgr_Presentations;
/* end typedefs declaration */

/* public enums */
enum PrsMgr_TypeOfPresentation3d {
	PrsMgr_TOP_AllView = 0,
	PrsMgr_TOP_ProjectorDependant = 1,
};

/* end public enums declaration */

%wrap_handle(PrsMgr_PresentableObject)
%wrap_handle(PrsMgr_Presentation)
%wrap_handle(PrsMgr_PresentationManager)
%wrap_handle(PrsMgr_Prs)

%nodefaultctor PrsMgr_ModedPresentation;
class PrsMgr_ModedPresentation {
	public:
		%feature("compactdefaultargs") Mode;
		%feature("autodoc", "	:rtype: int
") Mode;
		Standard_Integer Mode ();
		%feature("compactdefaultargs") Presentation;
		%feature("autodoc", "	:rtype: Handle_PrsMgr_Presentation
") Presentation;
		Handle_PrsMgr_Presentation Presentation ();
		%feature("compactdefaultargs") PrsMgr_ModedPresentation;
		%feature("autodoc", "	:rtype: None
") PrsMgr_ModedPresentation;
		 PrsMgr_ModedPresentation ();
		%feature("compactdefaultargs") PrsMgr_ModedPresentation;
		%feature("autodoc", "	:param thePrs:
	:type thePrs: Handle_PrsMgr_Presentation &
	:param theMode:
	:type theMode: int
	:rtype: None
") PrsMgr_ModedPresentation;
		 PrsMgr_ModedPresentation (const Handle_PrsMgr_Presentation & thePrs,const Standard_Integer theMode);
};


%extend PrsMgr_ModedPresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor PrsMgr_PresentableObject;
%ignore PrsMgr_PresentableObject::~PrsMgr_PresentableObject();
class PrsMgr_PresentableObject : public Standard_Transient {
	public:
		%feature("compactdefaultargs") AddChild;
		%feature("autodoc", "	* Makes theObject child of current object in scene hierarchy.

	:param theObject:
	:type theObject: Handle_PrsMgr_PresentableObject &
	:rtype: void
") AddChild;
		virtual void AddChild (const Handle_PrsMgr_PresentableObject & theObject);
		%feature("compactdefaultargs") AddClipPlane;
		%feature("autodoc", "	* Adds clip plane for graphical clipping for all display mode presentations. The composition of clip planes truncates the rendering space to convex volume. Please be aware that number of supported clip plane is limited. The planes which exceed the limit are ignored. Besides of this, some planes can be already set in view where the object is shown: the number of these planes should be substracted from limit to predict the maximum possible number of object clipping planes. @param thePlane [in] the clip plane to be appended to map of clip planes.

	:param thePlane:
	:type thePlane: Handle_Graphic3d_ClipPlane &
	:rtype: void
") AddClipPlane;
		virtual void AddClipPlane (const Handle_Graphic3d_ClipPlane & thePlane);
		%feature("compactdefaultargs") Attributes;
		%feature("autodoc", "	* Returns the attributes settings.

	:rtype: Handle_Prs3d_Drawer
") Attributes;
		Handle_Prs3d_Drawer Attributes ();
		%feature("compactdefaultargs") Children;
		%feature("autodoc", "	* Returns children of the current object.

	:rtype: PrsMgr_ListOfPresentableObjects
") Children;
		const PrsMgr_ListOfPresentableObjects & Children ();
		%feature("compactdefaultargs") ClipPlanes;
		%feature("autodoc", "	* Get clip planes. returns set of previously added clip planes for all display mode presentations.

	:rtype: Handle_Graphic3d_SequenceOfHClipPlane
") ClipPlanes;
		Handle_Graphic3d_SequenceOfHClipPlane ClipPlanes ();
		%feature("compactdefaultargs") DynamicHilightAttributes;
		%feature("autodoc", "	* Returns the hilight attributes settings. When not NULL, overrides both Prs3d_TypeOfHighlight_LocalDynamic and Prs3d_TypeOfHighlight_Dynamic defined within AIS_InteractiveContext.

	:rtype: Handle_Prs3d_Drawer
") DynamicHilightAttributes;
		Handle_Prs3d_Drawer DynamicHilightAttributes ();
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
		%feature("compactdefaultargs") HasOwnPresentations;
		%feature("autodoc", "	* Returns true if object should have own presentations.

	:rtype: bool
") HasOwnPresentations;
		Standard_Boolean HasOwnPresentations ();
		%feature("compactdefaultargs") HasTransformation;
		%feature("autodoc", "	* Returns true if object has a transformation that is different from the identity.

	:rtype: bool
") HasTransformation;
		Standard_Boolean HasTransformation ();
		%feature("compactdefaultargs") HilightAttributes;
		%feature("autodoc", "	* Returns the hilight attributes settings. When not NULL, overrides both Prs3d_TypeOfHighlight_LocalSelected and Prs3d_TypeOfHighlight_Selected defined within AIS_InteractiveContext.

	:rtype: Handle_Prs3d_Drawer
") HilightAttributes;
		Handle_Prs3d_Drawer HilightAttributes ();
		%feature("compactdefaultargs") InversedTransformation;
		%feature("autodoc", "	:rtype: gp_GTrsf
") InversedTransformation;
		const gp_GTrsf  InversedTransformation ();
		%feature("compactdefaultargs") IsMutable;
		%feature("autodoc", "	* Returns true if object has mutable nature (content or location are be changed regularly). Mutable object will be managed in different way than static onces (another optimizations).

	:rtype: bool
") IsMutable;
		Standard_Boolean IsMutable ();
		%feature("compactdefaultargs") LocalTransformation;
		%feature("autodoc", "	* Return the local transformation.

	:rtype: gp_Trsf
") LocalTransformation;
		const gp_Trsf  LocalTransformation ();
		%feature("compactdefaultargs") LocalTransformationGeom;
		%feature("autodoc", "	* Return the local transformation.

	:rtype: Handle_Geom_Transformation
") LocalTransformationGeom;
		Handle_Geom_Transformation LocalTransformationGeom ();
		%feature("compactdefaultargs") Parent;
		%feature("autodoc", "	* Returns parent of current object in scene hierarchy.

	:rtype: PrsMgr_PresentableObjectPointer
") Parent;
		PrsMgr_PresentableObjectPointer Parent ();
		%feature("compactdefaultargs") Presentations;
		%feature("autodoc", "	:rtype: PrsMgr_Presentations
") Presentations;
		PrsMgr_Presentations & Presentations ();
		%feature("compactdefaultargs") RemoveChild;
		%feature("autodoc", "	* Removes theObject from children of current object in scene hierarchy.

	:param theObject:
	:type theObject: Handle_PrsMgr_PresentableObject &
	:rtype: void
") RemoveChild;
		virtual void RemoveChild (const Handle_PrsMgr_PresentableObject & theObject);
		%feature("compactdefaultargs") RemoveClipPlane;
		%feature("autodoc", "	* Removes previously added clip plane. @param thePlane [in] the clip plane to be removed from map of clip planes.

	:param thePlane:
	:type thePlane: Handle_Graphic3d_ClipPlane &
	:rtype: void
") RemoveClipPlane;
		virtual void RemoveClipPlane (const Handle_Graphic3d_ClipPlane & thePlane);
		%feature("compactdefaultargs") ResetTransformation;
		%feature("autodoc", "	* resets local transformation to identity.

	:rtype: void
") ResetTransformation;
		virtual void ResetTransformation ();
		%feature("compactdefaultargs") SetAttributes;
		%feature("autodoc", "	* Initializes the drawing tool theDrawer.

	:param theDrawer:
	:type theDrawer: Handle_Prs3d_Drawer &
	:rtype: void
") SetAttributes;
		virtual void SetAttributes (const Handle_Prs3d_Drawer & theDrawer);
		%feature("compactdefaultargs") SetClipPlanes;
		%feature("autodoc", "	* Set clip planes for graphical clipping for all display mode presentations. The composition of clip planes truncates the rendering space to convex volume. Please be aware that number of supported clip plane is limited. The planes which exceed the limit are ignored. Besides of this, some planes can be already set in view where the object is shown: the number of these planes should be subtracted from limit to predict the maximum possible number of object clipping planes.

	:param thePlanes:
	:type thePlanes: Handle_Graphic3d_SequenceOfHClipPlane &
	:rtype: void
") SetClipPlanes;
		virtual void SetClipPlanes (const Handle_Graphic3d_SequenceOfHClipPlane & thePlanes);
		%feature("compactdefaultargs") SetClipPlanes;
		%feature("autodoc", "	:param thePlanes:
	:type thePlanes: Graphic3d_SequenceOfHClipPlane &
	:rtype: None
") SetClipPlanes;
		void SetClipPlanes (const Graphic3d_SequenceOfHClipPlane & thePlanes);
		%feature("compactdefaultargs") SetDynamicHilightAttributes;
		%feature("autodoc", "	* Initializes the dynamic hilight drawing tool.

	:param theDrawer:
	:type theDrawer: Handle_Prs3d_Drawer &
	:rtype: None
") SetDynamicHilightAttributes;
		void SetDynamicHilightAttributes (const Handle_Prs3d_Drawer & theDrawer);
		%feature("compactdefaultargs") SetHilightAttributes;
		%feature("autodoc", "	* Initializes the hilight drawing tool theDrawer.

	:param theDrawer:
	:type theDrawer: Handle_Prs3d_Drawer &
	:rtype: None
") SetHilightAttributes;
		void SetHilightAttributes (const Handle_Prs3d_Drawer & theDrawer);
		%feature("compactdefaultargs") SetLocalTransformation;
		%feature("autodoc", "	* Sets local transformation to theTransformation.

	:param theTrsf:
	:type theTrsf: gp_Trsf
	:rtype: None
") SetLocalTransformation;
		void SetLocalTransformation (const gp_Trsf & theTrsf);
		%feature("compactdefaultargs") SetLocalTransformation;
		%feature("autodoc", "	* Sets local transformation to theTransformation.

	:param theTrsf:
	:type theTrsf: Handle_Geom_Transformation &
	:rtype: None
") SetLocalTransformation;
		void SetLocalTransformation (const Handle_Geom_Transformation & theTrsf);
		%feature("compactdefaultargs") SetMutable;
		%feature("autodoc", "	* Sets if the object has mutable nature (content or location will be changed regularly). This method should be called before object displaying to take effect.

	:param theIsMutable:
	:type theIsMutable: bool
	:rtype: void
") SetMutable;
		virtual void SetMutable (const Standard_Boolean theIsMutable);
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
		%feature("compactdefaultargs") SetTransformPersistence;
		%feature("autodoc", "	* Sets up Transform Persistence for this object.

	:param theTrsfPers:
	:type theTrsfPers: Handle_Graphic3d_TransformPers &
	:rtype: void
") SetTransformPersistence;
		virtual void SetTransformPersistence (const Handle_Graphic3d_TransformPers & theTrsfPers);
		%feature("compactdefaultargs") SetTransformPersistence;
		%feature("autodoc", "	* Sets up Transform Persistence Mode for this object. This function used to lock in object position, rotation and / or zooming relative to camera position. Object will be drawn in the origin setted by thePoint parameter (except Graphic3d_TMF_TriedronPers flag - see description later). theMode should be: - Graphic3d_TMF_None - no persistence attributes (reset); - Graphic3d_TMF_ZoomPers - object doesn't resize; - Graphic3d_TMF_RotatePers - object doesn't rotate; - Graphic3d_TMF_ZoomRotatePers - object doesn't resize and rotate; - Graphic3d_TMF_RotatePers - object doesn't rotate; - Graphic3d_TMF_TriedronPers - object behaves like trihedron. If Graphic3d_TMF_TriedronPers or Graphic3d_TMF_2d persistence mode selected thePoint coordinates X and Y means: - X = 0.0, Y = 0.0 - center of view window; - X > 0.0, Y > 0.0 - right upper corner of view window; - X > 0.0, Y < 0.0 - right lower corner of view window; - X < 0.0, Y > 0.0 - left upper corner of view window; - X < 0.0, Y < 0.0 - left lower corner of view window. And Z coordinate defines the gap from border of view window (except center position).

	:param theMode:
	:type theMode: Graphic3d_TransModeFlags
	:param thePoint: default value is gp_Pnt(0.0,0.0,0.0)
	:type thePoint: gp_Pnt
	:rtype: None
") SetTransformPersistence;
		void SetTransformPersistence (const Graphic3d_TransModeFlags theMode,const gp_Pnt & thePoint = gp_Pnt(0.0,0.0,0.0));
		%feature("compactdefaultargs") SetTypeOfPresentation;
		%feature("autodoc", "	:param aType:
	:type aType: PrsMgr_TypeOfPresentation3d
	:rtype: None
") SetTypeOfPresentation;
		void SetTypeOfPresentation (const PrsMgr_TypeOfPresentation3d aType);
		%feature("compactdefaultargs") SetZLayer;
		%feature("autodoc", "	* Set Z layer ID and update all presentations of the presentable object. The layers mechanism allows drawing objects in higher layers in overlay of objects in lower layers.

	:param theLayerId:
	:type theLayerId: Graphic3d_ZLayerId
	:rtype: void
") SetZLayer;
		virtual void SetZLayer (const Graphic3d_ZLayerId theLayerId);
		%feature("compactdefaultargs") ToBeUpdated;
		%feature("autodoc", "	* gives the list of modes which are flagged 'to be updated'.

	:param ListOfMode:
	:type ListOfMode: TColStd_ListOfInteger &
	:rtype: None
") ToBeUpdated;
		void ToBeUpdated (TColStd_ListOfInteger & ListOfMode);
		%feature("compactdefaultargs") TransformPersistence;
		%feature("autodoc", "	* returns transform persistence of the presentable object.

	:rtype: Handle_Graphic3d_TransformPers
") TransformPersistence;
		Handle_Graphic3d_TransformPers TransformPersistence ();
		%feature("compactdefaultargs") Transformation;
		%feature("autodoc", "	* Return the transformation taking into account transformation of parent object(s).

	:rtype: gp_Trsf
") Transformation;
		const gp_Trsf  Transformation ();
		%feature("compactdefaultargs") TransformationGeom;
		%feature("autodoc", "	* Return the transformation taking into account transformation of parent object(s).

	:rtype: Handle_Geom_Transformation
") TransformationGeom;
		Handle_Geom_Transformation TransformationGeom ();
		%feature("compactdefaultargs") TypeOfPresentation3d;
		%feature("autodoc", "	* Returns information on whether the object accepts display in HLR mode or not.

	:rtype: PrsMgr_TypeOfPresentation3d
") TypeOfPresentation3d;
		PrsMgr_TypeOfPresentation3d TypeOfPresentation3d ();
		%feature("compactdefaultargs") UnsetAttributes;
		%feature("autodoc", "	* Clears settings provided by the drawing tool theDrawer.

	:rtype: void
") UnsetAttributes;
		virtual void UnsetAttributes ();
		%feature("compactdefaultargs") UnsetHilightAttributes;
		%feature("autodoc", "	* Clears settings provided by the hilight drawing tool theDrawer.

	:rtype: None
") UnsetHilightAttributes;
		void UnsetHilightAttributes ();
		%feature("compactdefaultargs") UpdateTransformation;
		%feature("autodoc", "	:rtype: void
") UpdateTransformation;
		virtual void UpdateTransformation ();
		%feature("compactdefaultargs") UpdateTransformation;
		%feature("autodoc", "	:param P:
	:type P: Handle_Prs3d_Presentation &
	:rtype: void
") UpdateTransformation;
		virtual void UpdateTransformation (const Handle_Prs3d_Presentation & P);
		%feature("compactdefaultargs") ZLayer;
		%feature("autodoc", "	* Get ID of Z layer.

	:rtype: Graphic3d_ZLayerId
") ZLayer;
		Graphic3d_ZLayerId ZLayer ();
};


%make_alias(PrsMgr_PresentableObject)

%extend PrsMgr_PresentableObject {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor PrsMgr_Presentation;
class PrsMgr_Presentation : public Standard_Transient {
	public:
		%feature("compactdefaultargs") MustBeUpdated;
		%feature("autodoc", "	:rtype: bool
") MustBeUpdated;
		Standard_Boolean MustBeUpdated ();
		%feature("compactdefaultargs") Presentation;
		%feature("autodoc", "	:rtype: Handle_Prs3d_Presentation
") Presentation;
		Handle_Prs3d_Presentation Presentation ();
		%feature("compactdefaultargs") PresentationManager;
		%feature("autodoc", "	* returns the PresentationManager in which the presentation has been created.

	:rtype: Handle_PrsMgr_PresentationManager
") PresentationManager;
		Handle_PrsMgr_PresentationManager PresentationManager ();
		%feature("compactdefaultargs") SetUpdateStatus;
		%feature("autodoc", "	:param theUpdateStatus:
	:type theUpdateStatus: bool
	:rtype: None
") SetUpdateStatus;
		void SetUpdateStatus (const Standard_Boolean theUpdateStatus);
};


%make_alias(PrsMgr_Presentation)

%extend PrsMgr_Presentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor PrsMgr_PresentationManager;
class PrsMgr_PresentationManager : public Standard_Transient {
	public:
		%feature("compactdefaultargs") AddToImmediateList;
		%feature("autodoc", "	* Stores thePrs in the transient list of presentations to be displayed in immediate mode. Will be taken in account in EndImmediateDraw method.

	:param thePrs:
	:type thePrs: Handle_Prs3d_Presentation &
	:rtype: None
") AddToImmediateList;
		void AddToImmediateList (const Handle_Prs3d_Presentation & thePrs);
		%feature("compactdefaultargs") BeginImmediateDraw;
		%feature("autodoc", "	* Resets the transient list of presentations previously displayed in immediate mode and begins accumulation of new list by following AddToImmediateList()/Color()/Highlight() calls.

	:rtype: None
") BeginImmediateDraw;
		void BeginImmediateDraw ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	* Clears the presentation of the presentable object thePrsObject in this framework with the display mode theMode.

	:param thePrsObject:
	:type thePrsObject: Handle_PrsMgr_PresentableObject &
	:param theMode: default value is 0
	:type theMode: int
	:rtype: void
") Clear;
		virtual void Clear (const Handle_PrsMgr_PresentableObject & thePrsObject,const Standard_Integer theMode = 0);
		%feature("compactdefaultargs") ClearImmediateDraw;
		%feature("autodoc", "	* Resets the transient list of presentations previously displayed in immediate mode.

	:rtype: None
") ClearImmediateDraw;
		void ClearImmediateDraw ();
		%feature("compactdefaultargs") Color;
		%feature("autodoc", "	* Highlights the graphic object thePrsObject in the color theColor. thePrsObject has the display mode theMode; this has the default value of 0, that is, the wireframe display mode.

	:param thePrsObject:
	:type thePrsObject: Handle_PrsMgr_PresentableObject &
	:param theStyle:
	:type theStyle: Handle_Prs3d_Drawer &
	:param theMode: default value is 0
	:type theMode: int
	:param theSelObj: default value is NULL
	:type theSelObj: Handle_PrsMgr_PresentableObject &
	:param theImmediateStructLayerId: default value is Graphic3d_ZLayerId_Topmost
	:type theImmediateStructLayerId: Graphic3d_ZLayerId
	:rtype: None
") Color;
		void Color (const Handle_PrsMgr_PresentableObject & thePrsObject,const Handle_Prs3d_Drawer & theStyle,const Standard_Integer theMode = 0,const Handle_PrsMgr_PresentableObject & theSelObj = NULL,const Graphic3d_ZLayerId theImmediateStructLayerId = Graphic3d_ZLayerId_Topmost);
		%feature("compactdefaultargs") Connect;
		%feature("autodoc", "	:param thePrsObject:
	:type thePrsObject: Handle_PrsMgr_PresentableObject &
	:param theOtherObject:
	:type theOtherObject: Handle_PrsMgr_PresentableObject &
	:param theMode: default value is 0
	:type theMode: int
	:param theOtherMode: default value is 0
	:type theOtherMode: int
	:rtype: None
") Connect;
		void Connect (const Handle_PrsMgr_PresentableObject & thePrsObject,const Handle_PrsMgr_PresentableObject & theOtherObject,const Standard_Integer theMode = 0,const Standard_Integer theOtherMode = 0);
		%feature("compactdefaultargs") Display;
		%feature("autodoc", "	* Displays the presentation of the object in the given Presentation manager with the given mode. The mode should be enumerated by the object which inherits PresentableObject.

	:param thePrsObject:
	:type thePrsObject: Handle_PrsMgr_PresentableObject &
	:param theMode: default value is 0
	:type theMode: int
	:rtype: None
") Display;
		void Display (const Handle_PrsMgr_PresentableObject & thePrsObject,const Standard_Integer theMode = 0);
		%feature("compactdefaultargs") DisplayPriority;
		%feature("autodoc", "	* Returns the display priority of the presentable object thePrsObject in this framework with the display mode theMode.

	:param thePrsObject:
	:type thePrsObject: Handle_PrsMgr_PresentableObject &
	:param theMode:
	:type theMode: int
	:rtype: int
") DisplayPriority;
		Standard_Integer DisplayPriority (const Handle_PrsMgr_PresentableObject & thePrsObject,const Standard_Integer theMode);
		%feature("compactdefaultargs") EndImmediateDraw;
		%feature("autodoc", "	* Allows rapid drawing of the each view in theViewer by avoiding an update of the whole background.

	:param theViewer:
	:type theViewer: Handle_V3d_Viewer &
	:rtype: None
") EndImmediateDraw;
		void EndImmediateDraw (const Handle_V3d_Viewer & theViewer);
		%feature("compactdefaultargs") Erase;
		%feature("autodoc", "	* erases the presentation of the object in the given Presentation manager with the given mode. If @theMode is -1, then erases all presentations of the object.

	:param thePrsObject:
	:type thePrsObject: Handle_PrsMgr_PresentableObject &
	:param theMode: default value is 0
	:type theMode: int
	:rtype: None
") Erase;
		void Erase (const Handle_PrsMgr_PresentableObject & thePrsObject,const Standard_Integer theMode = 0);
		%feature("compactdefaultargs") GetZLayer;
		%feature("autodoc", "	* Get Z layer ID assigned to all presentations of the object. Method returns -1 value if object has no presentations and is impossible to get layer index.

	:param thePrsObject:
	:type thePrsObject: Handle_PrsMgr_PresentableObject &
	:rtype: int
") GetZLayer;
		Standard_Integer GetZLayer (const Handle_PrsMgr_PresentableObject & thePrsObject);
		%feature("compactdefaultargs") HasPresentation;
		%feature("autodoc", "	* Returns true if there is a presentation of the presentable object thePrsObject in this framework, thePrsObject having the display mode theMode.

	:param thePrsObject:
	:type thePrsObject: Handle_PrsMgr_PresentableObject &
	:param theMode: default value is 0
	:type theMode: int
	:rtype: bool
") HasPresentation;
		Standard_Boolean HasPresentation (const Handle_PrsMgr_PresentableObject & thePrsObject,const Standard_Integer theMode = 0);
		%feature("compactdefaultargs") IsDisplayed;
		%feature("autodoc", "	:param thePrsObject:
	:type thePrsObject: Handle_PrsMgr_PresentableObject &
	:param theMode: default value is 0
	:type theMode: int
	:rtype: bool
") IsDisplayed;
		Standard_Boolean IsDisplayed (const Handle_PrsMgr_PresentableObject & thePrsObject,const Standard_Integer theMode = 0);
		%feature("compactdefaultargs") IsHighlighted;
		%feature("autodoc", "	* Returns true if the presentation of the presentable object thePrsObject in this framework with the display mode theMode is highlighted.

	:param thePrsObject:
	:type thePrsObject: Handle_PrsMgr_PresentableObject &
	:param theMode: default value is 0
	:type theMode: int
	:rtype: bool
") IsHighlighted;
		Standard_Boolean IsHighlighted (const Handle_PrsMgr_PresentableObject & thePrsObject,const Standard_Integer theMode = 0);
		%feature("compactdefaultargs") IsImmediateModeOn;
		%feature("autodoc", "	* Returns true if Presentation Manager is accumulating transient list of presentations to be displayed in immediate mode.

	:rtype: bool
") IsImmediateModeOn;
		Standard_Boolean IsImmediateModeOn ();
		%feature("compactdefaultargs") Presentation;
		%feature("autodoc", "	* Returns the presentation Presentation of the presentable object thePrsObject in this framework. When theToCreate is true - automatically creates presentation for specified mode when not exist. Optional argument theSelObj specifies parent decomposed object to inherit its view affinity.

	:param thePrsObject:
	:type thePrsObject: Handle_PrsMgr_PresentableObject &
	:param theMode: default value is 0
	:type theMode: int
	:param theToCreate: default value is Standard_False
	:type theToCreate: bool
	:param theSelObj: default value is NULL
	:type theSelObj: Handle_PrsMgr_PresentableObject &
	:rtype: Handle_PrsMgr_Presentation
") Presentation;
		Handle_PrsMgr_Presentation Presentation (const Handle_PrsMgr_PresentableObject & thePrsObject,const Standard_Integer theMode = 0,const Standard_Boolean theToCreate = Standard_False,const Handle_PrsMgr_PresentableObject & theSelObj = NULL);
		%feature("compactdefaultargs") PrsMgr_PresentationManager;
		%feature("autodoc", "	* Creates a framework to manage displays and graphic entities with the 3D view theStructureManager.

	:param theStructureManager:
	:type theStructureManager: Handle_Graphic3d_StructureManager &
	:rtype: None
") PrsMgr_PresentationManager;
		 PrsMgr_PresentationManager (const Handle_Graphic3d_StructureManager & theStructureManager);
		%feature("compactdefaultargs") RedrawImmediate;
		%feature("autodoc", "	* Clears and redisplays immediate structures of the viewer taking into account its affinity.

	:param theViewer:
	:type theViewer: Handle_V3d_Viewer &
	:rtype: None
") RedrawImmediate;
		void RedrawImmediate (const Handle_V3d_Viewer & theViewer);
		%feature("compactdefaultargs") SetDisplayPriority;
		%feature("autodoc", "	* Sets the display priority theNewPrior of the presentable object thePrsObject in this framework with the display mode theMode.

	:param thePrsObject:
	:type thePrsObject: Handle_PrsMgr_PresentableObject &
	:param theMode:
	:type theMode: int
	:param theNewPrior:
	:type theNewPrior: int
	:rtype: None
") SetDisplayPriority;
		void SetDisplayPriority (const Handle_PrsMgr_PresentableObject & thePrsObject,const Standard_Integer theMode,const Standard_Integer theNewPrior);
		%feature("compactdefaultargs") SetVisibility;
		%feature("autodoc", "	* Sets the visibility of presentable object.

	:param thePrsObject:
	:type thePrsObject: Handle_PrsMgr_PresentableObject &
	:param theMode:
	:type theMode: int
	:param theValue:
	:type theValue: bool
	:rtype: None
") SetVisibility;
		void SetVisibility (const Handle_PrsMgr_PresentableObject & thePrsObject,const Standard_Integer theMode,const Standard_Boolean theValue);
		%feature("compactdefaultargs") SetZLayer;
		%feature("autodoc", "	* Set Z layer ID for all presentations of the object.

	:param thePrsObject:
	:type thePrsObject: Handle_PrsMgr_PresentableObject &
	:param theLayerId:
	:type theLayerId: int
	:rtype: None
") SetZLayer;
		void SetZLayer (const Handle_PrsMgr_PresentableObject & thePrsObject,const Standard_Integer theLayerId);
		%feature("compactdefaultargs") StructureManager;
		%feature("autodoc", "	* Returns the structure manager.

	:rtype: Handle_Graphic3d_StructureManager
") StructureManager;
		Handle_Graphic3d_StructureManager StructureManager ();
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "	* Sets the transformation theTransformation for the presentable object thePrsObject. thePrsObject has the display mode theMode; this has the default value of 0, that is, the wireframe display mode.

	:param thePrsObject:
	:type thePrsObject: Handle_PrsMgr_PresentableObject &
	:param theTransformation:
	:type theTransformation: Handle_Geom_Transformation &
	:param theMode: default value is 0
	:type theMode: int
	:rtype: None
") Transform;
		void Transform (const Handle_PrsMgr_PresentableObject & thePrsObject,const Handle_Geom_Transformation & theTransformation,const Standard_Integer theMode = 0);
		%feature("compactdefaultargs") Unhighlight;
		%feature("autodoc", "	* Removes highlighting from the presentation of the presentable object.

	:param thePrsObject:
	:type thePrsObject: Handle_PrsMgr_PresentableObject &
	:rtype: None
") Unhighlight;
		void Unhighlight (const Handle_PrsMgr_PresentableObject & thePrsObject);
		%feature("compactdefaultargs") Unhighlight;
		%feature("autodoc", "	:param thePrsObject:
	:type thePrsObject: Handle_PrsMgr_PresentableObject &
	:param theMode:
	:type theMode: int
	:rtype: None
") Unhighlight;
		void Unhighlight (const Handle_PrsMgr_PresentableObject & thePrsObject,const Standard_Integer theMode);
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "	* Updates the presentation of the presentable object thePrsObject in this framework with the display mode theMode.

	:param thePrsObject:
	:type thePrsObject: Handle_PrsMgr_PresentableObject &
	:param theMode: default value is 0
	:type theMode: int
	:rtype: None
") Update;
		void Update (const Handle_PrsMgr_PresentableObject & thePrsObject,const Standard_Integer theMode = 0);
		%feature("compactdefaultargs") UpdateHighlightTrsf;
		%feature("autodoc", "	* Allows to apply location transformation to shadow highlight presentation immediately. @param theObj defines the base object, it local transformation will be applied to corresponding highlight structure @param theMode defines display mode of the base object @param theSelObj defines the object produced after decomposition of the base object for local selection

	:param theViewer:
	:type theViewer: Handle_V3d_Viewer &
	:param theObj:
	:type theObj: Handle_PrsMgr_PresentableObject &
	:param theMode: default value is 0
	:type theMode: int
	:param theSelObj: default value is NULL
	:type theSelObj: Handle_PrsMgr_PresentableObject &
	:rtype: None
") UpdateHighlightTrsf;
		void UpdateHighlightTrsf (const Handle_V3d_Viewer & theViewer,const Handle_PrsMgr_PresentableObject & theObj,const Standard_Integer theMode = 0,const Handle_PrsMgr_PresentableObject & theSelObj = NULL);
};


%make_alias(PrsMgr_PresentationManager)

%extend PrsMgr_PresentationManager {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor PrsMgr_Prs;
class PrsMgr_Prs : public Prs3d_Presentation {
	public:
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

	:param theProjector:
	:type theProjector: Handle_Graphic3d_DataStructureManager &
	:param theTrsf:
	:type theTrsf: Handle_Geom_Transformation &
	:rtype: Handle_Graphic3d_Structure
") Compute;
		Handle_Graphic3d_Structure Compute (const Handle_Graphic3d_DataStructureManager & theProjector,const Handle_Geom_Transformation & theTrsf);
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

	:param theProjector:
	:type theProjector: Handle_Graphic3d_DataStructureManager &
	:param theTrsf:
	:type theTrsf: Handle_Geom_Transformation &
	:param theStructure:
	:type theStructure: Handle_Graphic3d_Structure &
	:rtype: None
") Compute;
		void Compute (const Handle_Graphic3d_DataStructureManager & theProjector,const Handle_Geom_Transformation & theTrsf,Handle_Graphic3d_Structure & theStructure);
		%feature("compactdefaultargs") PrsMgr_Prs;
		%feature("autodoc", "	:param theStructManager:
	:type theStructManager: Handle_Graphic3d_StructureManager &
	:param thePresentation:
	:type thePresentation: PrsMgr_PresentationPointer &
	:param theTypeOfPresentation3d:
	:type theTypeOfPresentation3d: PrsMgr_TypeOfPresentation3d
	:rtype: None
") PrsMgr_Prs;
		 PrsMgr_Prs (const Handle_Graphic3d_StructureManager & theStructManager,const PrsMgr_PresentationPointer & thePresentation,const PrsMgr_TypeOfPresentation3d theTypeOfPresentation3d);
};


%make_alias(PrsMgr_Prs)

%extend PrsMgr_Prs {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
/* harray1 class */
/* harray2 class */
/* harray2 class */
