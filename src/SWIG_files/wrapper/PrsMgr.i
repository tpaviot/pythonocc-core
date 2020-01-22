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
"PrsMgr module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_prsmgr.html"
%enddef
%module (package="OCC.Core", docstring=PRSMGRDOCSTRING) PrsMgr


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
#include<PrsMgr_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<Prs3d_module.hxx>
#include<Graphic3d_module.hxx>
#include<Bnd_module.hxx>
#include<Quantity_module.hxx>
#include<Geom_module.hxx>
#include<Aspect_module.hxx>
#include<gp_module.hxx>
#include<TColStd_module.hxx>
#include<V3d_module.hxx>
#include<gp_module.hxx>
#include<HLRAlgo_module.hxx>
#include<TopoDS_module.hxx>
#include<Aspect_module.hxx>
#include<Visual3d_module.hxx>
#include<TShort_module.hxx>
#include<Message_module.hxx>
#include<Bnd_module.hxx>
#include<TopTools_module.hxx>
#include<TColQuantity_module.hxx>
#include<Poly_module.hxx>
#include<TopLoc_module.hxx>
#include<Quantity_module.hxx>
#include<BVH_module.hxx>
#include<SelectMgr_module.hxx>
#include<Select3D_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import Prs3d.i
%import Graphic3d.i
%import Bnd.i
%import Quantity.i
%import Geom.i
%import Aspect.i
%import gp.i
%import TColStd.i
%import V3d.i
/* public enums */
enum PrsMgr_TypeOfPresentation3d {
	PrsMgr_TOP_AllView = 0,
	PrsMgr_TOP_ProjectorDependant = 1,
};

/* end public enums declaration */

/* handles */
%wrap_handle(PrsMgr_PresentableObject)
%wrap_handle(PrsMgr_Presentation)
%wrap_handle(PrsMgr_PresentationManager)
/* end handles declaration */

/* templates */
%template(PrsMgr_ListOfPresentableObjects) NCollection_List <opencascade::handle <PrsMgr_PresentableObject>>;
%template(PrsMgr_ListOfPresentableObjectsIter) NCollection_TListIterator<PrsMgr_ListOfPresentableObjects>;
%template(PrsMgr_ListOfPresentations) NCollection_List <opencascade::handle <Prs3d_Presentation>>;
%template(PrsMgr_Presentations) NCollection_Sequence <opencascade::handle <PrsMgr_Presentation>>;
/* end templates declaration */

/* typedefs */
typedef NCollection_List <opencascade::handle <PrsMgr_PresentableObject>> PrsMgr_ListOfPresentableObjects;
typedef NCollection_List <opencascade::handle <PrsMgr_PresentableObject>>::Iterator PrsMgr_ListOfPresentableObjectsIter;
typedef PrsMgr_Presentation PrsMgr_Presentation3d;
typedef Handle_PrsMgr_Presentation Handle_PrsMgr_Presentation3d;
typedef PrsMgr_PresentationManager PrsMgr_PresentationManager3d;
typedef Handle_PrsMgr_PresentationManager Handle_PrsMgr_PresentationManager3d;
typedef NCollection_List <opencascade::handle <Prs3d_Presentation>> PrsMgr_ListOfPresentations;
typedef NCollection_Sequence <opencascade::handle <PrsMgr_Presentation>> PrsMgr_Presentations;
typedef Graphic3d_Structure Prs3d_Presentation;
/* end typedefs declaration */

/*********************************
* class PrsMgr_PresentableObject *
*********************************/
%nodefaultctor PrsMgr_PresentableObject;
%ignore PrsMgr_PresentableObject::~PrsMgr_PresentableObject();
class PrsMgr_PresentableObject : public Standard_Transient {
	public:
		/****************** AcceptDisplayMode ******************/
		%feature("compactdefaultargs") AcceptDisplayMode;
		%feature("autodoc", "* Returns true if the class of objects accepts specified display mode index. The interactive context can have a default mode of representation for the set of Interactive Objects. This mode may not be accepted by a given class of objects. Consequently, this virtual method allowing us to get information about the class in question must be implemented. At least one display mode index should be accepted by this method. Although subclass can leave default implementation, it is highly desired defining exact list of supported modes instead, which is usually an enumeration for one object or objects class sharing similar list of display modes.
	:param theMode:
	:type theMode: int
	:rtype: bool") AcceptDisplayMode;
		Standard_Boolean AcceptDisplayMode (const Standard_Integer theMode);

		/****************** AddChild ******************/
		%feature("compactdefaultargs") AddChild;
		%feature("autodoc", "* Makes theObject child of current object in scene hierarchy.
	:param theObject:
	:type theObject: PrsMgr_PresentableObject
	:rtype: void") AddChild;
		virtual void AddChild (const opencascade::handle<PrsMgr_PresentableObject> & theObject);

		/****************** AddChildWithCurrentTransformation ******************/
		%feature("compactdefaultargs") AddChildWithCurrentTransformation;
		%feature("autodoc", "* Makes theObject child of current object in scene hierarchy with keeping the current global transformation So the object keeps the same position/orientation in the global CS.
	:param theObject:
	:type theObject: PrsMgr_PresentableObject
	:rtype: None") AddChildWithCurrentTransformation;
		void AddChildWithCurrentTransformation (const opencascade::handle<PrsMgr_PresentableObject> & theObject);

		/****************** AddClipPlane ******************/
		%feature("compactdefaultargs") AddClipPlane;
		%feature("autodoc", "* Adds clip plane for graphical clipping for all display mode presentations. The composition of clip planes truncates the rendering space to convex volume. Please be aware that number of supported clip plane is limited. The planes which exceed the limit are ignored. Besides of this, some planes can be already set in view where the object is shown: the number of these planes should be subtracted from limit to predict the maximum possible number of object clipping planes. @param thePlane [in] the clip plane to be appended to map of clip planes.
	:param thePlane:
	:type thePlane: Graphic3d_ClipPlane
	:rtype: void") AddClipPlane;
		virtual void AddClipPlane (const opencascade::handle<Graphic3d_ClipPlane> & thePlane);

		/****************** Attributes ******************/
		%feature("compactdefaultargs") Attributes;
		%feature("autodoc", "* @name presentation attributes Returns the attributes settings.
	:rtype: opencascade::handle<Prs3d_Drawer>") Attributes;
		const opencascade::handle<Prs3d_Drawer> & Attributes ();

		/****************** BoundingBox ******************/
		%feature("compactdefaultargs") BoundingBox;
		%feature("autodoc", "* Returns bounding box of object correspondingly to its current display mode. This method requires presentation to be already computed, since it relies on bounding box of presentation structures, which are supposed to be same/close amongst different display modes of this object.
	:param theBndBox:
	:type theBndBox: Bnd_Box
	:rtype: void") BoundingBox;
		virtual void BoundingBox (Bnd_Box & theBndBox);

		/****************** Children ******************/
		%feature("compactdefaultargs") Children;
		%feature("autodoc", "* Returns children of the current object.
	:rtype: PrsMgr_ListOfPresentableObjects") Children;
		const PrsMgr_ListOfPresentableObjects & Children ();

		/****************** ClipPlanes ******************/
		%feature("compactdefaultargs") ClipPlanes;
		%feature("autodoc", "* @name clipping planes Get clip planes. returns set of previously added clip planes for all display mode presentations.
	:rtype: opencascade::handle<Graphic3d_SequenceOfHClipPlane>") ClipPlanes;
		const opencascade::handle<Graphic3d_SequenceOfHClipPlane> & ClipPlanes ();

		/****************** Color ******************/
		%feature("compactdefaultargs") Color;
		%feature("autodoc", "* Returns the color setting of the Interactive Object.
	:param theColor:
	:type theColor: Quantity_Color
	:rtype: None") Color;
		void Color (Quantity_Color & theColor);

		/****************** CombinedParentTransformation ******************/
		%feature("compactdefaultargs") CombinedParentTransformation;
		%feature("autodoc", "* Return combined parent transformation.
	:rtype: opencascade::handle<Geom_Transformation>") CombinedParentTransformation;
		const opencascade::handle<Geom_Transformation> & CombinedParentTransformation ();

		/****************** CurrentFacingModel ******************/
		%feature("compactdefaultargs") CurrentFacingModel;
		%feature("autodoc", "* Returns the current facing model which is in effect.
	:rtype: Aspect_TypeOfFacingModel") CurrentFacingModel;
		Aspect_TypeOfFacingModel CurrentFacingModel ();

		/****************** DefaultDisplayMode ******************/
		%feature("compactdefaultargs") DefaultDisplayMode;
		%feature("autodoc", "* Returns the default display mode.
	:rtype: int") DefaultDisplayMode;
		Standard_Integer DefaultDisplayMode ();

		/****************** DisplayMode ******************/
		%feature("compactdefaultargs") DisplayMode;
		%feature("autodoc", "* Returns the display mode setting of the Interactive Object. The range of supported display mode indexes should be specified within object definition and filtered by AccepDisplayMode(). @sa AcceptDisplayMode()
	:rtype: int") DisplayMode;
		Standard_Integer DisplayMode ();


        %feature("autodoc", "1");
        %extend{
            std::string DumpJsonToString(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return s.str();}
        };
        		/****************** DynamicHilightAttributes ******************/
		%feature("compactdefaultargs") DynamicHilightAttributes;
		%feature("autodoc", "* Returns the hilight attributes settings. When not NULL, overrides both Prs3d_TypeOfHighlight_LocalDynamic and Prs3d_TypeOfHighlight_Dynamic defined within AIS_InteractiveContext.
	:rtype: opencascade::handle<Prs3d_Drawer>") DynamicHilightAttributes;
		const opencascade::handle<Prs3d_Drawer> & DynamicHilightAttributes ();

		/****************** GetTransformPersistenceMode ******************/
		%feature("compactdefaultargs") GetTransformPersistenceMode;
		%feature("autodoc", "* Gets Transform Persistence Mode for this object
	:rtype: Graphic3d_TransModeFlags") GetTransformPersistenceMode;
		Graphic3d_TransModeFlags GetTransformPersistenceMode ();

		/****************** GetTransformPersistencePoint ******************/
		%feature("compactdefaultargs") GetTransformPersistencePoint;
		%feature("autodoc", "* Gets point of transform persistence for this object
	:rtype: gp_Pnt") GetTransformPersistencePoint;
		gp_Pnt GetTransformPersistencePoint ();

		/****************** HasColor ******************/
		%feature("compactdefaultargs") HasColor;
		%feature("autodoc", "* Returns true if the Interactive Object has color.
	:rtype: bool") HasColor;
		Standard_Boolean HasColor ();

		/****************** HasDisplayMode ******************/
		%feature("compactdefaultargs") HasDisplayMode;
		%feature("autodoc", "* Returns true if the Interactive Object has display mode setting overriding global setting (within Interactive Context).
	:rtype: bool") HasDisplayMode;
		Standard_Boolean HasDisplayMode ();

		/****************** HasHilightMode ******************/
		%feature("compactdefaultargs") HasHilightMode;
		%feature("autodoc", "* Returns true if the Interactive Object is in highlight mode.
	:rtype: bool") HasHilightMode;
		Standard_Boolean HasHilightMode ();

		/****************** HasMaterial ******************/
		%feature("compactdefaultargs") HasMaterial;
		%feature("autodoc", "* Returns true if the Interactive Object has a setting for material.
	:rtype: bool") HasMaterial;
		Standard_Boolean HasMaterial ();

		/****************** HasOwnPresentations ******************/
		%feature("compactdefaultargs") HasOwnPresentations;
		%feature("autodoc", "* Returns true if object should have own presentations.
	:rtype: bool") HasOwnPresentations;
		Standard_Boolean HasOwnPresentations ();

		/****************** HasPolygonOffsets ******************/
		%feature("compactdefaultargs") HasPolygonOffsets;
		%feature("autodoc", "* Returns Standard_True if <myDrawer> has non-null shading aspect
	:rtype: bool") HasPolygonOffsets;
		virtual Standard_Boolean HasPolygonOffsets ();

		/****************** HasTransformation ******************/
		%feature("compactdefaultargs") HasTransformation;
		%feature("autodoc", "* Returns true if object has a transformation that is different from the identity.
	:rtype: bool") HasTransformation;
		Standard_Boolean HasTransformation ();

		/****************** HasWidth ******************/
		%feature("compactdefaultargs") HasWidth;
		%feature("autodoc", "* Returns true if the Interactive Object has width.
	:rtype: bool") HasWidth;
		Standard_Boolean HasWidth ();

		/****************** HilightAttributes ******************/
		%feature("compactdefaultargs") HilightAttributes;
		%feature("autodoc", "* Returns the hilight attributes settings. When not NULL, overrides both Prs3d_TypeOfHighlight_LocalSelected and Prs3d_TypeOfHighlight_Selected defined within AIS_InteractiveContext.
	:rtype: opencascade::handle<Prs3d_Drawer>") HilightAttributes;
		const opencascade::handle<Prs3d_Drawer> & HilightAttributes ();

		/****************** HilightMode ******************/
		%feature("compactdefaultargs") HilightMode;
		%feature("autodoc", "* Returns highlight display mode. This is obsolete method for backward compatibility - use ::HilightAttributes() and ::DynamicHilightAttributes() instead.
	:rtype: int") HilightMode;
		Standard_Integer HilightMode ();

		/****************** InversedTransformation ******************/
		%feature("compactdefaultargs") InversedTransformation;
		%feature("autodoc", "* Return inversed transformation.
	:rtype: gp_GTrsf") InversedTransformation;
		const gp_GTrsf  InversedTransformation ();

		/****************** IsInfinite ******************/
		%feature("compactdefaultargs") IsInfinite;
		%feature("autodoc", "* Returns true if the interactive object is infinite; False by default. This flag affects various operations operating on bounding box of graphic presentations of this object. For instance, infinite objects are not taken in account for View FitAll. This does not necessarily means that object is actually infinite, auxiliary objects might be also marked with this flag to achieve desired behavior.
	:rtype: bool") IsInfinite;
		Standard_Boolean IsInfinite ();

		/****************** IsMutable ******************/
		%feature("compactdefaultargs") IsMutable;
		%feature("autodoc", "* Returns true if object has mutable nature (content or location are be changed regularly). Mutable object will be managed in different way than static onces (another optimizations).
	:rtype: bool") IsMutable;
		Standard_Boolean IsMutable ();

		/****************** IsTransparent ******************/
		%feature("compactdefaultargs") IsTransparent;
		%feature("autodoc", "* Returns true if there is a transparency setting.
	:rtype: bool") IsTransparent;
		Standard_Boolean IsTransparent ();

		/****************** LocalTransformation ******************/
		%feature("compactdefaultargs") LocalTransformation;
		%feature("autodoc", "* Return the local transformation. Note that the local transformation of the object having Transformation Persistence is applied within Local Coordinate system defined by this Persistence.
	:rtype: gp_Trsf") LocalTransformation;
		const gp_Trsf  LocalTransformation ();

		/****************** LocalTransformationGeom ******************/
		%feature("compactdefaultargs") LocalTransformationGeom;
		%feature("autodoc", "* Return the local transformation. Note that the local transformation of the object having Transformation Persistence is applied within Local Coordinate system defined by this Persistence.
	:rtype: opencascade::handle<Geom_Transformation>") LocalTransformationGeom;
		const opencascade::handle<Geom_Transformation> & LocalTransformationGeom ();

		/****************** Material ******************/
		%feature("compactdefaultargs") Material;
		%feature("autodoc", "* Returns the current material setting as enumeration value.
	:rtype: Graphic3d_NameOfMaterial") Material;
		virtual Graphic3d_NameOfMaterial Material ();

		/****************** Parent ******************/
		%feature("compactdefaultargs") Parent;
		%feature("autodoc", "* @name parent/children properties Returns parent of current object in scene hierarchy.
	:rtype: PrsMgr_PresentableObject *") Parent;
		PrsMgr_PresentableObject * Parent ();

		/****************** PolygonOffsets ******************/
		%feature("compactdefaultargs") PolygonOffsets;
		%feature("autodoc", "* Retrieves current polygon offsets settings from <myDrawer>.
	:param aMode:
	:type aMode: int
	:param aFactor:
	:type aFactor: Standard_ShortReal
	:param aUnits:
	:type aUnits: Standard_ShortReal
	:rtype: void") PolygonOffsets;
		virtual void PolygonOffsets (Standard_Integer &OutValue,Standard_ShortReal & aFactor,Standard_ShortReal & aUnits);

		/****************** Presentations ******************/
		%feature("compactdefaultargs") Presentations;
		%feature("autodoc", "* Return presentations.
	:rtype: PrsMgr_Presentations") Presentations;
		PrsMgr_Presentations & Presentations ();

		/****************** RemoveChild ******************/
		%feature("compactdefaultargs") RemoveChild;
		%feature("autodoc", "* Removes theObject from children of current object in scene hierarchy.
	:param theObject:
	:type theObject: PrsMgr_PresentableObject
	:rtype: void") RemoveChild;
		virtual void RemoveChild (const opencascade::handle<PrsMgr_PresentableObject> & theObject);

		/****************** RemoveChildWithRestoreTransformation ******************/
		%feature("compactdefaultargs") RemoveChildWithRestoreTransformation;
		%feature("autodoc", "* Removes theObject from children of current object in scene hierarchy with keeping the current global transformation. So the object keeps the same position/orientation in the global CS.
	:param theObject:
	:type theObject: PrsMgr_PresentableObject
	:rtype: None") RemoveChildWithRestoreTransformation;
		void RemoveChildWithRestoreTransformation (const opencascade::handle<PrsMgr_PresentableObject> & theObject);

		/****************** RemoveClipPlane ******************/
		%feature("compactdefaultargs") RemoveClipPlane;
		%feature("autodoc", "* Removes previously added clip plane. @param thePlane [in] the clip plane to be removed from map of clip planes.
	:param thePlane:
	:type thePlane: Graphic3d_ClipPlane
	:rtype: void") RemoveClipPlane;
		virtual void RemoveClipPlane (const opencascade::handle<Graphic3d_ClipPlane> & thePlane);

		/****************** ResetTransformation ******************/
		%feature("compactdefaultargs") ResetTransformation;
		%feature("autodoc", "* resets local transformation to identity.
	:rtype: void") ResetTransformation;
		virtual void ResetTransformation ();

		/****************** SetAttributes ******************/
		%feature("compactdefaultargs") SetAttributes;
		%feature("autodoc", "* Initializes the drawing tool theDrawer.
	:param theDrawer:
	:type theDrawer: Prs3d_Drawer
	:rtype: None") SetAttributes;
		void SetAttributes (const opencascade::handle<Prs3d_Drawer> & theDrawer);

		/****************** SetClipPlanes ******************/
		%feature("compactdefaultargs") SetClipPlanes;
		%feature("autodoc", "* Set clip planes for graphical clipping for all display mode presentations. The composition of clip planes truncates the rendering space to convex volume. Please be aware that number of supported clip plane is limited. The planes which exceed the limit are ignored. Besides of this, some planes can be already set in view where the object is shown: the number of these planes should be subtracted from limit to predict the maximum possible number of object clipping planes.
	:param thePlanes:
	:type thePlanes: Graphic3d_SequenceOfHClipPlane
	:rtype: void") SetClipPlanes;
		virtual void SetClipPlanes (const opencascade::handle<Graphic3d_SequenceOfHClipPlane> & thePlanes);

		/****************** SetClipPlanes ******************/
		%feature("compactdefaultargs") SetClipPlanes;
		%feature("autodoc", ":param thePlanes:
	:type thePlanes: Graphic3d_SequenceOfHClipPlane
	:rtype: None") SetClipPlanes;
		void SetClipPlanes (const Graphic3d_SequenceOfHClipPlane & thePlanes);

		/****************** SetColor ******************/
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "* Only the interactive object knowns which Drawer attribute is affected by the color, if any (ex: for a wire,it's the wireaspect field of the drawer, but for a vertex, only the point aspect field is affected by the color). WARNING : Do not forget to set the corresponding fields here (hasOwnColor and myDrawer->SetColor())
	:param theColor:
	:type theColor: Quantity_Color
	:rtype: None") SetColor;
		void SetColor (const Quantity_Color & theColor);

		/****************** SetCurrentFacingModel ******************/
		%feature("compactdefaultargs") SetCurrentFacingModel;
		%feature("autodoc", "* change the current facing model apply on polygons for SetColor(), SetTransparency(), SetMaterial() methods default facing model is Aspect_TOFM_TWO_SIDE. This mean that attributes is applying both on the front and back face.
	:param theModel: default value is Aspect_TOFM_BOTH_SIDE
	:type theModel: Aspect_TypeOfFacingModel
	:rtype: None") SetCurrentFacingModel;
		void SetCurrentFacingModel (const Aspect_TypeOfFacingModel theModel = Aspect_TOFM_BOTH_SIDE);

		/****************** SetDisplayMode ******************/
		%feature("compactdefaultargs") SetDisplayMode;
		%feature("autodoc", "* Sets the display mode for the interactive object. An object can have its own temporary display mode, which is different from that proposed by the interactive context. @sa AcceptDisplayMode()
	:param theMode:
	:type theMode: int
	:rtype: None") SetDisplayMode;
		void SetDisplayMode (const Standard_Integer theMode);

		/****************** SetDynamicHilightAttributes ******************/
		%feature("compactdefaultargs") SetDynamicHilightAttributes;
		%feature("autodoc", "* Initializes the dynamic hilight drawing tool.
	:param theDrawer:
	:type theDrawer: Prs3d_Drawer
	:rtype: None") SetDynamicHilightAttributes;
		void SetDynamicHilightAttributes (const opencascade::handle<Prs3d_Drawer> & theDrawer);

		/****************** SetHilightAttributes ******************/
		%feature("compactdefaultargs") SetHilightAttributes;
		%feature("autodoc", "* Initializes the hilight drawing tool theDrawer.
	:param theDrawer:
	:type theDrawer: Prs3d_Drawer
	:rtype: None") SetHilightAttributes;
		void SetHilightAttributes (const opencascade::handle<Prs3d_Drawer> & theDrawer);

		/****************** SetHilightMode ******************/
		%feature("compactdefaultargs") SetHilightMode;
		%feature("autodoc", "* Sets highlight display mode. This is obsolete method for backward compatibility - use ::HilightAttributes() and ::DynamicHilightAttributes() instead.
	:param theMode:
	:type theMode: int
	:rtype: None") SetHilightMode;
		void SetHilightMode (const Standard_Integer theMode);

		/****************** SetInfiniteState ******************/
		%feature("compactdefaultargs") SetInfiniteState;
		%feature("autodoc", "* Sets if object should be considered as infinite.
	:param theFlag: default value is Standard_True
	:type theFlag: bool
	:rtype: None") SetInfiniteState;
		void SetInfiniteState (const Standard_Boolean theFlag = Standard_True);

		/****************** SetIsoOnTriangulation ******************/
		%feature("compactdefaultargs") SetIsoOnTriangulation;
		%feature("autodoc", "* @name simplified presentation properties API Enables or disables on-triangulation build of isolines according to the flag given.
	:param theIsEnabled:
	:type theIsEnabled: bool
	:rtype: None") SetIsoOnTriangulation;
		void SetIsoOnTriangulation (const Standard_Boolean theIsEnabled);

		/****************** SetLocalTransformation ******************/
		%feature("compactdefaultargs") SetLocalTransformation;
		%feature("autodoc", "* Sets local transformation to theTransformation. Note that the local transformation of the object having Transformation Persistence is applied within Local Coordinate system defined by this Persistence.
	:param theTrsf:
	:type theTrsf: gp_Trsf
	:rtype: None") SetLocalTransformation;
		void SetLocalTransformation (const gp_Trsf & theTrsf);

		/****************** SetLocalTransformation ******************/
		%feature("compactdefaultargs") SetLocalTransformation;
		%feature("autodoc", "* Sets local transformation to theTransformation. Note that the local transformation of the object having Transformation Persistence is applied within Local Coordinate system defined by this Persistence.
	:param theTrsf:
	:type theTrsf: Geom_Transformation
	:rtype: None") SetLocalTransformation;
		void SetLocalTransformation (const opencascade::handle<Geom_Transformation> & theTrsf);

		/****************** SetMaterial ******************/
		%feature("compactdefaultargs") SetMaterial;
		%feature("autodoc", "* Sets the material aMat defining this display attribute for the interactive object. Material aspect determines shading aspect, color and transparency of visible entities.
	:param aName:
	:type aName: Graphic3d_MaterialAspect
	:rtype: void") SetMaterial;
		virtual void SetMaterial (const Graphic3d_MaterialAspect & aName);

		/****************** SetMutable ******************/
		%feature("compactdefaultargs") SetMutable;
		%feature("autodoc", "* Sets if the object has mutable nature (content or location will be changed regularly). This method should be called before object displaying to take effect.
	:param theIsMutable:
	:type theIsMutable: bool
	:rtype: void") SetMutable;
		virtual void SetMutable (const Standard_Boolean theIsMutable);

		/****************** SetPolygonOffsets ******************/
		%feature("compactdefaultargs") SetPolygonOffsets;
		%feature("autodoc", "* Sets up polygon offsets for this object. @sa Graphic3d_Aspects::SetPolygonOffsets()
	:param aMode:
	:type aMode: int
	:param aFactor: default value is 1.0
	:type aFactor: Standard_ShortReal
	:param aUnits: default value is 0.0
	:type aUnits: Standard_ShortReal
	:rtype: void") SetPolygonOffsets;
		virtual void SetPolygonOffsets (const Standard_Integer aMode,const Standard_ShortReal aFactor = 1.0,const Standard_ShortReal aUnits = 0.0);

		/****************** SetPropagateVisualState ******************/
		%feature("compactdefaultargs") SetPropagateVisualState;
		%feature("autodoc", "* Change the value of the flag 'propagate visual state'
	:param theFlag:
	:type theFlag: bool
	:rtype: None") SetPropagateVisualState;
		void SetPropagateVisualState (const Standard_Boolean theFlag);

		/****************** SetToUpdate ******************/
		%feature("compactdefaultargs") SetToUpdate;
		%feature("autodoc", "* Flags presentation to be updated; UpdatePresentations() will recompute these presentations. @param theMode presentation (display mode) to invalidate, or -1 to invalidate them all
	:param theMode:
	:type theMode: int
	:rtype: None") SetToUpdate;
		void SetToUpdate (Standard_Integer theMode);

		/****************** SetToUpdate ******************/
		%feature("compactdefaultargs") SetToUpdate;
		%feature("autodoc", "* flags all the Presentations to be Updated.
	:rtype: None") SetToUpdate;
		void SetToUpdate ();

		/****************** SetTransformPersistence ******************/
		%feature("compactdefaultargs") SetTransformPersistence;
		%feature("autodoc", "* Sets up Transform Persistence defining a special Local Coordinate system where this object should be located. Note that management of Transform Persistence object is more expensive than of the normal one, because it requires its position being recomputed basing on camera position within each draw call / traverse. @sa Graphic3d_TransformPers class description
	:param theTrsfPers:
	:type theTrsfPers: Graphic3d_TransformPers
	:rtype: void") SetTransformPersistence;
		virtual void SetTransformPersistence (const opencascade::handle<Graphic3d_TransformPers> & theTrsfPers);

		/****************** SetTransformPersistence ******************/
		%feature("compactdefaultargs") SetTransformPersistence;
		%feature("autodoc", "* Sets up Transform Persistence Mode for this object. This function used to lock in object position, rotation and / or zooming relative to camera position. Object will be drawn in the origin setted by thePoint parameter (except Graphic3d_TMF_TriedronPers flag - see description later). theMode should be: - Graphic3d_TMF_None - no persistence attributes (reset); - Graphic3d_TMF_ZoomPers - object doesn't resize; - Graphic3d_TMF_RotatePers - object doesn't rotate; - Graphic3d_TMF_ZoomRotatePers - object doesn't resize and rotate; - Graphic3d_TMF_RotatePers - object doesn't rotate; - Graphic3d_TMF_TriedronPers - object behaves like trihedron. If Graphic3d_TMF_TriedronPers or Graphic3d_TMF_2d persistence mode selected thePoint coordinates X and Y means: - X = 0.0, Y = 0.0 - center of view window; - X > 0.0, Y > 0.0 - right upper corner of view window; - X > 0.0, Y < 0.0 - right lower corner of view window; - X < 0.0, Y > 0.0 - left upper corner of view window; - X < 0.0, Y < 0.0 - left lower corner of view window. And Z coordinate defines the gap from border of view window (except center position).
	:param theMode:
	:type theMode: Graphic3d_TransModeFlags
	:param thePoint: default value is gp_Pnt(0.0,0.0,0.0)
	:type thePoint: gp_Pnt
	:rtype: None") SetTransformPersistence;
		void SetTransformPersistence (const Graphic3d_TransModeFlags theMode,const gp_Pnt & thePoint = gp_Pnt(0.0,0.0,0.0));

		/****************** SetTransparency ******************/
		%feature("compactdefaultargs") SetTransparency;
		%feature("autodoc", "* Attributes a setting aValue for transparency. The transparency value should be between 0.0 and 1.0. At 0.0 an object will be totally opaque, and at 1.0, fully transparent. Warning At a value of 1.0, there may be nothing visible.
	:param aValue: default value is 0.6
	:type aValue: float
	:rtype: void") SetTransparency;
		virtual void SetTransparency (const Standard_Real aValue = 0.6);

		/****************** SetTypeOfPresentation ******************/
		%feature("compactdefaultargs") SetTypeOfPresentation;
		%feature("autodoc", "* Set type of presentation.
	:param theType:
	:type theType: PrsMgr_TypeOfPresentation3d
	:rtype: None") SetTypeOfPresentation;
		void SetTypeOfPresentation (const PrsMgr_TypeOfPresentation3d theType);

		/****************** SetWidth ******************/
		%feature("compactdefaultargs") SetWidth;
		%feature("autodoc", "* Allows you to provide the setting aValue for width. Only the Interactive Object knows which Drawer attribute is affected by the width setting.
	:param theWidth:
	:type theWidth: float
	:rtype: None") SetWidth;
		void SetWidth (const Standard_Real theWidth);

		/****************** SetZLayer ******************/
		%feature("compactdefaultargs") SetZLayer;
		%feature("autodoc", "* Set Z layer ID and update all presentations of the presentable object. The layers mechanism allows drawing objects in higher layers in overlay of objects in lower layers.
	:param theLayerId:
	:type theLayerId: int
	:rtype: void") SetZLayer;
		virtual void SetZLayer (int theLayerId);

		/****************** SynchronizeAspects ******************/
		%feature("compactdefaultargs") SynchronizeAspects;
		%feature("autodoc", "* Synchronize presentation aspects after their modification. //! This method should be called after modifying primitive aspect properties (material, texture, shader) so that modifications will take effect on already computed presentation groups (thus avoiding re-displaying the object).
	:rtype: None") SynchronizeAspects;
		void SynchronizeAspects ();

		/****************** ToBeUpdated ******************/
		%feature("compactdefaultargs") ToBeUpdated;
		%feature("autodoc", "* Returns True if any active presentation has invalidation flag. @param theToIncludeHidden when True, also checks hidden presentations
	:param theToIncludeHidden: default value is Standard_False
	:type theToIncludeHidden: bool
	:rtype: bool") ToBeUpdated;
		Standard_Boolean ToBeUpdated (Standard_Boolean theToIncludeHidden = Standard_False);

		/****************** ToBeUpdated ******************/
		%feature("compactdefaultargs") ToBeUpdated;
		%feature("autodoc", "* @name deprecated methods gives the list of modes which are flagged 'to be updated'.
	:param ListOfMode:
	:type ListOfMode: TColStd_ListOfInteger
	:rtype: None") ToBeUpdated;
		void ToBeUpdated (TColStd_ListOfInteger & ListOfMode);

		/****************** ToPropagateVisualState ******************/
		%feature("compactdefaultargs") ToPropagateVisualState;
		%feature("autodoc", "* Get value of the flag 'propagate visual state' It means that the display/erase/color visual state is propagated automatically to all children; by default, the flag is true
	:rtype: bool") ToPropagateVisualState;
		Standard_Boolean ToPropagateVisualState ();

		/****************** TransformPersistence ******************/
		%feature("compactdefaultargs") TransformPersistence;
		%feature("autodoc", "* @name object transformation Returns Transformation Persistence defining a special Local Coordinate system where this presentable object is located or NULL handle if not defined. Position of the object having Transformation Persistence is mutable and depends on camera position. The same applies to a bounding box of the object. @sa Graphic3d_TransformPers class description
	:rtype: opencascade::handle<Graphic3d_TransformPers>") TransformPersistence;
		const opencascade::handle<Graphic3d_TransformPers> & TransformPersistence ();

		/****************** Transformation ******************/
		%feature("compactdefaultargs") Transformation;
		%feature("autodoc", "* Return the transformation taking into account transformation of parent object(s). Note that the local transformation of the object having Transformation Persistence is applied within Local Coordinate system defined by this Persistence.
	:rtype: gp_Trsf") Transformation;
		const gp_Trsf  Transformation ();

		/****************** TransformationGeom ******************/
		%feature("compactdefaultargs") TransformationGeom;
		%feature("autodoc", "* Return the transformation taking into account transformation of parent object(s). Note that the local transformation of the object having Transformation Persistence is applied within Local Coordinate system defined by this Persistence.
	:rtype: opencascade::handle<Geom_Transformation>") TransformationGeom;
		const opencascade::handle<Geom_Transformation> & TransformationGeom ();

		/****************** Transparency ******************/
		%feature("compactdefaultargs") Transparency;
		%feature("autodoc", "* Returns the transparency setting. This will be between 0.0 and 1.0. At 0.0 an object will be totally opaque, and at 1.0, fully transparent.
	:rtype: float") Transparency;
		Standard_Real Transparency ();

		/****************** TypeOfPresentation3d ******************/
		%feature("compactdefaultargs") TypeOfPresentation3d;
		%feature("autodoc", "* Returns information on whether the object accepts display in HLR mode or not.
	:rtype: PrsMgr_TypeOfPresentation3d") TypeOfPresentation3d;
		PrsMgr_TypeOfPresentation3d TypeOfPresentation3d ();

		/****************** UnsetAttributes ******************/
		%feature("compactdefaultargs") UnsetAttributes;
		%feature("autodoc", "* Clears settings provided by the drawing tool aDrawer.
	:rtype: void") UnsetAttributes;
		virtual void UnsetAttributes ();

		/****************** UnsetColor ******************/
		%feature("compactdefaultargs") UnsetColor;
		%feature("autodoc", "* Removes color settings. Only the Interactive Object knows which Drawer attribute is affected by the color setting. For a wire, for example, wire aspect is the attribute affected. For a vertex, however, only point aspect is affected by the color setting.
	:rtype: None") UnsetColor;
		void UnsetColor ();

		/****************** UnsetDisplayMode ******************/
		%feature("compactdefaultargs") UnsetDisplayMode;
		%feature("autodoc", "* Removes display mode settings from the interactive object.
	:rtype: None") UnsetDisplayMode;
		void UnsetDisplayMode ();

		/****************** UnsetHilightAttributes ******************/
		%feature("compactdefaultargs") UnsetHilightAttributes;
		%feature("autodoc", "* Clears settings provided by the hilight drawing tool theDrawer.
	:rtype: None") UnsetHilightAttributes;
		void UnsetHilightAttributes ();

		/****************** UnsetHilightMode ******************/
		%feature("compactdefaultargs") UnsetHilightMode;
		%feature("autodoc", "* Unsets highlight display mode.
	:rtype: None") UnsetHilightMode;
		void UnsetHilightMode ();

		/****************** UnsetMaterial ******************/
		%feature("compactdefaultargs") UnsetMaterial;
		%feature("autodoc", "* Removes the setting for material.
	:rtype: void") UnsetMaterial;
		virtual void UnsetMaterial ();

		/****************** UnsetTransparency ******************/
		%feature("compactdefaultargs") UnsetTransparency;
		%feature("autodoc", "* Removes the transparency setting. The object is opaque by default.
	:rtype: void") UnsetTransparency;
		virtual void UnsetTransparency ();

		/****************** UnsetWidth ******************/
		%feature("compactdefaultargs") UnsetWidth;
		%feature("autodoc", "* Reset width to default value.
	:rtype: None") UnsetWidth;
		void UnsetWidth ();

		/****************** UpdateTransformation ******************/
		%feature("compactdefaultargs") UpdateTransformation;
		%feature("autodoc", "* Updates final transformation (parent + local) of presentable object and its presentations.
	:rtype: void") UpdateTransformation;
		virtual void UpdateTransformation ();

		/****************** Width ******************/
		%feature("compactdefaultargs") Width;
		%feature("autodoc", "* Returns the width setting of the Interactive Object.
	:rtype: float") Width;
		Standard_Real Width ();

		/****************** ZLayer ******************/
		%feature("compactdefaultargs") ZLayer;
		%feature("autodoc", "* Get ID of Z layer for main presentation.
	:rtype: Graphic3d_ZLayerId") ZLayer;
		Graphic3d_ZLayerId ZLayer ();

};


%make_alias(PrsMgr_PresentableObject)

%extend PrsMgr_PresentableObject {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class PrsMgr_Presentation *
****************************/
%nodefaultctor PrsMgr_Presentation;
class PrsMgr_Presentation : public Graphic3d_Structure {
	public:
		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "* removes the whole content of the presentation. Does not remove the other connected presentations.
	:param theWithDestruction: default value is Standard_True
	:type theWithDestruction: bool
	:rtype: void") Clear;
		virtual void Clear (const Standard_Boolean theWithDestruction = Standard_True);

		/****************** Compute ******************/
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "* Compute structure using presentation manager.
	:rtype: void") Compute;
		virtual void Compute ();

		/****************** Display ******************/
		%feature("compactdefaultargs") Display;
		%feature("autodoc", "* Display structure.
	:rtype: void") Display;
		virtual void Display ();

		/****************** Erase ******************/
		%feature("compactdefaultargs") Erase;
		%feature("autodoc", "* Remove structure.
	:rtype: void") Erase;
		virtual void Erase ();

		/****************** Highlight ******************/
		%feature("compactdefaultargs") Highlight;
		%feature("autodoc", "* Highlight structure.
	:param theStyle:
	:type theStyle: Prs3d_Drawer
	:rtype: None") Highlight;
		void Highlight (const opencascade::handle<Prs3d_Drawer> & theStyle);

		/****************** IsDisplayed ******************/
		%feature("compactdefaultargs") IsDisplayed;
		%feature("autodoc", "* Return True if structure has been displayed and in no hidden state.
	:rtype: bool") IsDisplayed;
		Standard_Boolean IsDisplayed ();

		/****************** Mode ******************/
		%feature("compactdefaultargs") Mode;
		%feature("autodoc", "* Return display mode index.
	:rtype: int") Mode;
		Standard_Integer Mode ();

		/****************** MustBeUpdated ******************/
		%feature("compactdefaultargs") MustBeUpdated;
		%feature("autodoc", ":rtype: bool") MustBeUpdated;
		Standard_Boolean MustBeUpdated ();

		/****************** Presentation ******************/
		%feature("compactdefaultargs") Presentation;
		%feature("autodoc", ":rtype: Prs3d_Presentation *") Presentation;
		Prs3d_Presentation * Presentation ();

		/****************** PresentationManager ******************/
		%feature("compactdefaultargs") PresentationManager;
		%feature("autodoc", "* returns the PresentationManager in which the presentation has been created.
	:rtype: opencascade::handle<PrsMgr_PresentationManager>") PresentationManager;
		const opencascade::handle<PrsMgr_PresentationManager> & PresentationManager ();

		/****************** SetUpdateStatus ******************/
		%feature("compactdefaultargs") SetUpdateStatus;
		%feature("autodoc", ":param theUpdateStatus:
	:type theUpdateStatus: bool
	:rtype: None") SetUpdateStatus;
		void SetUpdateStatus (const Standard_Boolean theUpdateStatus);

		/****************** Unhighlight ******************/
		%feature("compactdefaultargs") Unhighlight;
		%feature("autodoc", "* Unhighlight structure.
	:rtype: None") Unhighlight;
		void Unhighlight ();

};


%make_alias(PrsMgr_Presentation)

%extend PrsMgr_Presentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class PrsMgr_PresentationManager *
***********************************/
class PrsMgr_PresentationManager : public Standard_Transient {
	public:
		/****************** AddToImmediateList ******************/
		%feature("compactdefaultargs") AddToImmediateList;
		%feature("autodoc", "* Stores thePrs in the transient list of presentations to be displayed in immediate mode. Will be taken in account in EndImmediateDraw method.
	:param thePrs:
	:type thePrs: Prs3d_Presentation
	:rtype: None") AddToImmediateList;
		void AddToImmediateList (const opencascade::handle<Prs3d_Presentation> & thePrs);

		/****************** BeginImmediateDraw ******************/
		%feature("compactdefaultargs") BeginImmediateDraw;
		%feature("autodoc", "* Resets the transient list of presentations previously displayed in immediate mode and begins accumulation of new list by following AddToImmediateList()/Color()/Highlight() calls.
	:rtype: None") BeginImmediateDraw;
		void BeginImmediateDraw ();

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "* Clears the presentation of the presentable object thePrsObject in this framework with the display mode theMode.
	:param thePrsObject:
	:type thePrsObject: PrsMgr_PresentableObject
	:param theMode: default value is 0
	:type theMode: int
	:rtype: void") Clear;
		virtual void Clear (const opencascade::handle<PrsMgr_PresentableObject> & thePrsObject,const Standard_Integer theMode = 0);

		/****************** ClearImmediateDraw ******************/
		%feature("compactdefaultargs") ClearImmediateDraw;
		%feature("autodoc", "* Resets the transient list of presentations previously displayed in immediate mode.
	:rtype: None") ClearImmediateDraw;
		void ClearImmediateDraw ();

		/****************** Color ******************/
		%feature("compactdefaultargs") Color;
		%feature("autodoc", "* Highlights the graphic object thePrsObject in the color theColor. thePrsObject has the display mode theMode; this has the default value of 0, that is, the wireframe display mode.
	:param thePrsObject:
	:type thePrsObject: PrsMgr_PresentableObject
	:param theStyle:
	:type theStyle: Prs3d_Drawer
	:param theMode: default value is 0
	:type theMode: int
	:param theSelObj: default value is NULL
	:type theSelObj: PrsMgr_PresentableObject
	:param theImmediateStructLayerId: default value is Graphic3d_ZLayerId_Topmost
	:type theImmediateStructLayerId: int
	:rtype: None") Color;
		void Color (const opencascade::handle<PrsMgr_PresentableObject> & thePrsObject,const opencascade::handle<Prs3d_Drawer> & theStyle,const Standard_Integer theMode = 0,const opencascade::handle<PrsMgr_PresentableObject> & theSelObj = NULL,int theImmediateStructLayerId = Graphic3d_ZLayerId_Topmost);

		/****************** Connect ******************/
		%feature("compactdefaultargs") Connect;
		%feature("autodoc", ":param thePrsObject:
	:type thePrsObject: PrsMgr_PresentableObject
	:param theOtherObject:
	:type theOtherObject: PrsMgr_PresentableObject
	:param theMode: default value is 0
	:type theMode: int
	:param theOtherMode: default value is 0
	:type theOtherMode: int
	:rtype: None") Connect;
		void Connect (const opencascade::handle<PrsMgr_PresentableObject> & thePrsObject,const opencascade::handle<PrsMgr_PresentableObject> & theOtherObject,const Standard_Integer theMode = 0,const Standard_Integer theOtherMode = 0);

		/****************** Display ******************/
		%feature("compactdefaultargs") Display;
		%feature("autodoc", "* Displays the presentation of the object in the given Presentation manager with the given mode. The mode should be enumerated by the object which inherits PresentableObject.
	:param thePrsObject:
	:type thePrsObject: PrsMgr_PresentableObject
	:param theMode: default value is 0
	:type theMode: int
	:rtype: None") Display;
		void Display (const opencascade::handle<PrsMgr_PresentableObject> & thePrsObject,const Standard_Integer theMode = 0);

		/****************** DisplayPriority ******************/
		%feature("compactdefaultargs") DisplayPriority;
		%feature("autodoc", "* Returns the display priority of the presentable object thePrsObject in this framework with the display mode theMode.
	:param thePrsObject:
	:type thePrsObject: PrsMgr_PresentableObject
	:param theMode:
	:type theMode: int
	:rtype: int") DisplayPriority;
		Standard_Integer DisplayPriority (const opencascade::handle<PrsMgr_PresentableObject> & thePrsObject,const Standard_Integer theMode);

		/****************** EndImmediateDraw ******************/
		%feature("compactdefaultargs") EndImmediateDraw;
		%feature("autodoc", "* Allows rapid drawing of the each view in theViewer by avoiding an update of the whole background.
	:param theViewer:
	:type theViewer: V3d_Viewer
	:rtype: None") EndImmediateDraw;
		void EndImmediateDraw (const opencascade::handle<V3d_Viewer> & theViewer);

		/****************** Erase ******************/
		%feature("compactdefaultargs") Erase;
		%feature("autodoc", "* erases the presentation of the object in the given Presentation manager with the given mode. If @theMode is -1, then erases all presentations of the object.
	:param thePrsObject:
	:type thePrsObject: PrsMgr_PresentableObject
	:param theMode: default value is 0
	:type theMode: int
	:rtype: None") Erase;
		void Erase (const opencascade::handle<PrsMgr_PresentableObject> & thePrsObject,const Standard_Integer theMode = 0);

		/****************** GetZLayer ******************/
		%feature("compactdefaultargs") GetZLayer;
		%feature("autodoc", "* Get Z layer ID assigned to all presentations of the object. Method returns -1 value if object has no presentations and is impossible to get layer index.
	:param thePrsObject:
	:type thePrsObject: PrsMgr_PresentableObject
	:rtype: Graphic3d_ZLayerId") GetZLayer;
		Graphic3d_ZLayerId GetZLayer (const opencascade::handle<PrsMgr_PresentableObject> & thePrsObject);

		/****************** HasPresentation ******************/
		%feature("compactdefaultargs") HasPresentation;
		%feature("autodoc", "* Returns true if there is a presentation of the presentable object thePrsObject in this framework, thePrsObject having the display mode theMode.
	:param thePrsObject:
	:type thePrsObject: PrsMgr_PresentableObject
	:param theMode: default value is 0
	:type theMode: int
	:rtype: bool") HasPresentation;
		Standard_Boolean HasPresentation (const opencascade::handle<PrsMgr_PresentableObject> & thePrsObject,const Standard_Integer theMode = 0);

		/****************** IsDisplayed ******************/
		%feature("compactdefaultargs") IsDisplayed;
		%feature("autodoc", ":param thePrsObject:
	:type thePrsObject: PrsMgr_PresentableObject
	:param theMode: default value is 0
	:type theMode: int
	:rtype: bool") IsDisplayed;
		Standard_Boolean IsDisplayed (const opencascade::handle<PrsMgr_PresentableObject> & thePrsObject,const Standard_Integer theMode = 0);

		/****************** IsHighlighted ******************/
		%feature("compactdefaultargs") IsHighlighted;
		%feature("autodoc", "* Returns true if the presentation of the presentable object thePrsObject in this framework with the display mode theMode is highlighted.
	:param thePrsObject:
	:type thePrsObject: PrsMgr_PresentableObject
	:param theMode: default value is 0
	:type theMode: int
	:rtype: bool") IsHighlighted;
		Standard_Boolean IsHighlighted (const opencascade::handle<PrsMgr_PresentableObject> & thePrsObject,const Standard_Integer theMode = 0);

		/****************** IsImmediateModeOn ******************/
		%feature("compactdefaultargs") IsImmediateModeOn;
		%feature("autodoc", "* Returns true if Presentation Manager is accumulating transient list of presentations to be displayed in immediate mode.
	:rtype: bool") IsImmediateModeOn;
		Standard_Boolean IsImmediateModeOn ();

		/****************** Presentation ******************/
		%feature("compactdefaultargs") Presentation;
		%feature("autodoc", "* Returns the presentation Presentation of the presentable object thePrsObject in this framework. When theToCreate is true - automatically creates presentation for specified mode when not exist. Optional argument theSelObj specifies parent decomposed object to inherit its view affinity.
	:param thePrsObject:
	:type thePrsObject: PrsMgr_PresentableObject
	:param theMode: default value is 0
	:type theMode: int
	:param theToCreate: default value is Standard_False
	:type theToCreate: bool
	:param theSelObj: default value is NULL
	:type theSelObj: PrsMgr_PresentableObject
	:rtype: opencascade::handle<PrsMgr_Presentation>") Presentation;
		opencascade::handle<PrsMgr_Presentation> Presentation (const opencascade::handle<PrsMgr_PresentableObject> & thePrsObject,const Standard_Integer theMode = 0,const Standard_Boolean theToCreate = Standard_False,const opencascade::handle<PrsMgr_PresentableObject> & theSelObj = NULL);

		/****************** PrsMgr_PresentationManager ******************/
		%feature("compactdefaultargs") PrsMgr_PresentationManager;
		%feature("autodoc", "* Creates a framework to manage displays and graphic entities with the 3D view theStructureManager.
	:param theStructureManager:
	:type theStructureManager: Graphic3d_StructureManager
	:rtype: None") PrsMgr_PresentationManager;
		 PrsMgr_PresentationManager (const opencascade::handle<Graphic3d_StructureManager> & theStructureManager);

		/****************** RedrawImmediate ******************/
		%feature("compactdefaultargs") RedrawImmediate;
		%feature("autodoc", "* Clears and redisplays immediate structures of the viewer taking into account its affinity.
	:param theViewer:
	:type theViewer: V3d_Viewer
	:rtype: None") RedrawImmediate;
		void RedrawImmediate (const opencascade::handle<V3d_Viewer> & theViewer);

		/****************** SetDisplayPriority ******************/
		%feature("compactdefaultargs") SetDisplayPriority;
		%feature("autodoc", "* Sets the display priority theNewPrior of the presentable object thePrsObject in this framework with the display mode theMode.
	:param thePrsObject:
	:type thePrsObject: PrsMgr_PresentableObject
	:param theMode:
	:type theMode: int
	:param theNewPrior:
	:type theNewPrior: int
	:rtype: None") SetDisplayPriority;
		void SetDisplayPriority (const opencascade::handle<PrsMgr_PresentableObject> & thePrsObject,const Standard_Integer theMode,const Standard_Integer theNewPrior);

		/****************** SetVisibility ******************/
		%feature("compactdefaultargs") SetVisibility;
		%feature("autodoc", "* Sets the visibility of presentable object.
	:param thePrsObject:
	:type thePrsObject: PrsMgr_PresentableObject
	:param theMode:
	:type theMode: int
	:param theValue:
	:type theValue: bool
	:rtype: None") SetVisibility;
		void SetVisibility (const opencascade::handle<PrsMgr_PresentableObject> & thePrsObject,const Standard_Integer theMode,const Standard_Boolean theValue);

		/****************** SetZLayer ******************/
		%feature("compactdefaultargs") SetZLayer;
		%feature("autodoc", "* Set Z layer ID for all presentations of the object.
	:param thePrsObject:
	:type thePrsObject: PrsMgr_PresentableObject
	:param theLayerId:
	:type theLayerId: int
	:rtype: None") SetZLayer;
		void SetZLayer (const opencascade::handle<PrsMgr_PresentableObject> & thePrsObject,int theLayerId);

		/****************** StructureManager ******************/
		%feature("compactdefaultargs") StructureManager;
		%feature("autodoc", "* Returns the structure manager.
	:rtype: opencascade::handle<Graphic3d_StructureManager>") StructureManager;
		const opencascade::handle<Graphic3d_StructureManager> & StructureManager ();

		/****************** Transform ******************/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "* Sets the transformation theTransformation for the presentable object thePrsObject. thePrsObject has the display mode theMode; this has the default value of 0, that is, the wireframe display mode.
	:param thePrsObject:
	:type thePrsObject: PrsMgr_PresentableObject
	:param theTransformation:
	:type theTransformation: Geom_Transformation
	:param theMode: default value is 0
	:type theMode: int
	:rtype: None") Transform;
		void Transform (const opencascade::handle<PrsMgr_PresentableObject> & thePrsObject,const opencascade::handle<Geom_Transformation> & theTransformation,const Standard_Integer theMode = 0);

		/****************** Unhighlight ******************/
		%feature("compactdefaultargs") Unhighlight;
		%feature("autodoc", "* Removes highlighting from the presentation of the presentable object.
	:param thePrsObject:
	:type thePrsObject: PrsMgr_PresentableObject
	:rtype: None") Unhighlight;
		void Unhighlight (const opencascade::handle<PrsMgr_PresentableObject> & thePrsObject);

		/****************** Unhighlight ******************/
		%feature("compactdefaultargs") Unhighlight;
		%feature("autodoc", ":param thePrsObject:
	:type thePrsObject: PrsMgr_PresentableObject
	:param theMode:
	:type theMode: int
	:rtype: None") Unhighlight;
		void Unhighlight (const opencascade::handle<PrsMgr_PresentableObject> & thePrsObject,const Standard_Integer theMode);

		/****************** Update ******************/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "* Updates the presentation of the presentable object thePrsObject in this framework with the display mode theMode.
	:param thePrsObject:
	:type thePrsObject: PrsMgr_PresentableObject
	:param theMode: default value is 0
	:type theMode: int
	:rtype: None") Update;
		void Update (const opencascade::handle<PrsMgr_PresentableObject> & thePrsObject,const Standard_Integer theMode = 0);

		/****************** UpdateHighlightTrsf ******************/
		%feature("compactdefaultargs") UpdateHighlightTrsf;
		%feature("autodoc", "* Allows to apply location transformation to shadow highlight presentation immediately. @param theObj defines the base object, it local transformation will be applied to corresponding highlight structure @param theMode defines display mode of the base object @param theSelObj defines the object produced after decomposition of the base object for local selection
	:param theViewer:
	:type theViewer: V3d_Viewer
	:param theObj:
	:type theObj: PrsMgr_PresentableObject
	:param theMode: default value is 0
	:type theMode: int
	:param theSelObj: default value is NULL
	:type theSelObj: PrsMgr_PresentableObject
	:rtype: None") UpdateHighlightTrsf;
		void UpdateHighlightTrsf (const opencascade::handle<V3d_Viewer> & theViewer,const opencascade::handle<PrsMgr_PresentableObject> & theObj,const Standard_Integer theMode = 0,const opencascade::handle<PrsMgr_PresentableObject> & theSelObj = NULL);

};


%make_alias(PrsMgr_PresentationManager)

%extend PrsMgr_PresentationManager {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
