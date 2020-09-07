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
#include<TShort_module.hxx>
#include<Media_module.hxx>
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

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
enum PrsMgr_TypeOfPresentation3d {
	PrsMgr_TOP_AllView = 0,
	PrsMgr_TOP_ProjectorDependant = 1,
};

/* end public enums declaration */

/* python proy classes for enums */
%pythoncode {

class PrsMgr_TypeOfPresentation3d(IntEnum):
	PrsMgr_TOP_AllView = 0
	PrsMgr_TOP_ProjectorDependant = 1
PrsMgr_TOP_AllView = PrsMgr_TypeOfPresentation3d.PrsMgr_TOP_AllView
PrsMgr_TOP_ProjectorDependant = PrsMgr_TypeOfPresentation3d.PrsMgr_TOP_ProjectorDependant
};
/* end python proxy for enums */

/* handles */
%wrap_handle(PrsMgr_PresentableObject)
%wrap_handle(PrsMgr_Presentation)
%wrap_handle(PrsMgr_PresentationManager)
/* end handles declaration */

/* templates */
%template(PrsMgr_ListOfPresentableObjects) NCollection_List<opencascade::handle<PrsMgr_PresentableObject>>;

%extend NCollection_List<opencascade::handle<PrsMgr_PresentableObject>> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(PrsMgr_ListOfPresentableObjectsIter) NCollection_TListIterator<PrsMgr_ListOfPresentableObjects>;
%template(PrsMgr_ListOfPresentations) NCollection_List<opencascade::handle<Prs3d_Presentation>>;

%extend NCollection_List<opencascade::handle<Prs3d_Presentation>> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(PrsMgr_Presentations) NCollection_Sequence<opencascade::handle<PrsMgr_Presentation>>;

%extend NCollection_Sequence<opencascade::handle<PrsMgr_Presentation>> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
/* end templates declaration */

/* typedefs */
typedef Handle_PrsMgr_Presentation Handle_PrsMgr_Presentation3d;
typedef Handle_PrsMgr_PresentationManager Handle_PrsMgr_PresentationManager3d;
typedef Graphic3d_Structure Prs3d_Presentation;
typedef NCollection_List<opencascade::handle<PrsMgr_PresentableObject>> PrsMgr_ListOfPresentableObjects;
typedef NCollection_List<opencascade::handle<PrsMgr_PresentableObject>>::Iterator PrsMgr_ListOfPresentableObjectsIter;
typedef NCollection_List<opencascade::handle<Prs3d_Presentation>> PrsMgr_ListOfPresentations;
typedef PrsMgr_Presentation PrsMgr_Presentation3d;
typedef PrsMgr_PresentationManager PrsMgr_PresentationManager3d;
typedef NCollection_Sequence<opencascade::handle<PrsMgr_Presentation>> PrsMgr_Presentations;
/* end typedefs declaration */

/*********************************
* class PrsMgr_PresentableObject *
*********************************/
%nodefaultctor PrsMgr_PresentableObject;
%ignore PrsMgr_PresentableObject::~PrsMgr_PresentableObject();
class PrsMgr_PresentableObject : public Standard_Transient {
	public:
		/****************** AcceptDisplayMode ******************/
		/**** md5 signature: bae56e2dc4711c229fb1bab9ec65258f ****/
		%feature("compactdefaultargs") AcceptDisplayMode;
		%feature("autodoc", "Returns true if the class of objects accepts specified display mode index. the interactive context can have a default mode of representation for the set of interactive objects. this mode may not be accepted by a given class of objects. consequently, this virtual method allowing us to get information about the class in question must be implemented. at least one display mode index should be accepted by this method. although subclass can leave default implementation, it is highly desired defining exact list of supported modes instead, which is usually an enumeration for one object or objects class sharing similar list of display modes.

Parameters
----------
theMode: int

Returns
-------
bool
") AcceptDisplayMode;
		virtual Standard_Boolean AcceptDisplayMode(const Standard_Integer theMode);

		/****************** AddChild ******************/
		/**** md5 signature: 4cb35725e5658154615dcc48d8d5941f ****/
		%feature("compactdefaultargs") AddChild;
		%feature("autodoc", "Makes theobject child of current object in scene hierarchy.

Parameters
----------
theObject: PrsMgr_PresentableObject

Returns
-------
None
") AddChild;
		virtual void AddChild(const opencascade::handle<PrsMgr_PresentableObject> & theObject);

		/****************** AddChildWithCurrentTransformation ******************/
		/**** md5 signature: cb9904f6ff36138b2d71932f0ce71caa ****/
		%feature("compactdefaultargs") AddChildWithCurrentTransformation;
		%feature("autodoc", "Makes theobject child of current object in scene hierarchy with keeping the current global transformation so the object keeps the same position/orientation in the global cs.

Parameters
----------
theObject: PrsMgr_PresentableObject

Returns
-------
None
") AddChildWithCurrentTransformation;
		void AddChildWithCurrentTransformation(const opencascade::handle<PrsMgr_PresentableObject> & theObject);

		/****************** AddClipPlane ******************/
		/**** md5 signature: 9f3c54e7cba60e479ad5b0eee5e5228c ****/
		%feature("compactdefaultargs") AddClipPlane;
		%feature("autodoc", "Adds clip plane for graphical clipping for all display mode presentations. the composition of clip planes truncates the rendering space to convex volume. please be aware that number of supported clip plane is limited. the planes which exceed the limit are ignored. besides of this, some planes can be already set in view where the object is shown: the number of these planes should be subtracted from limit to predict the maximum possible number of object clipping planes. @param theplane [in] the clip plane to be appended to map of clip planes.

Parameters
----------
thePlane: Graphic3d_ClipPlane

Returns
-------
None
") AddClipPlane;
		virtual void AddClipPlane(const opencascade::handle<Graphic3d_ClipPlane> & thePlane);

		/****************** Attributes ******************/
		/**** md5 signature: 7c024beac873893f3a088f538b4ad41a ****/
		%feature("compactdefaultargs") Attributes;
		%feature("autodoc", "Returns the attributes settings.

Returns
-------
opencascade::handle<Prs3d_Drawer>
") Attributes;
		const opencascade::handle<Prs3d_Drawer> & Attributes();

		/****************** BoundingBox ******************/
		/**** md5 signature: f7a866b86bc0fe3fc689336999e511a6 ****/
		%feature("compactdefaultargs") BoundingBox;
		%feature("autodoc", "Returns bounding box of object correspondingly to its current display mode. this method requires presentation to be already computed, since it relies on bounding box of presentation structures, which are supposed to be same/close amongst different display modes of this object.

Parameters
----------
theBndBox: Bnd_Box

Returns
-------
None
") BoundingBox;
		virtual void BoundingBox(Bnd_Box & theBndBox);

		/****************** Children ******************/
		/**** md5 signature: 8473f800c00ae7231d0d682a7669ae77 ****/
		%feature("compactdefaultargs") Children;
		%feature("autodoc", "Returns children of the current object.

Returns
-------
PrsMgr_ListOfPresentableObjects
") Children;
		const PrsMgr_ListOfPresentableObjects & Children();

		/****************** ClipPlanes ******************/
		/**** md5 signature: 26ab80085e76b6f03b64af6598080486 ****/
		%feature("compactdefaultargs") ClipPlanes;
		%feature("autodoc", "Get clip planes. returns set of previously added clip planes for all display mode presentations.

Returns
-------
opencascade::handle<Graphic3d_SequenceOfHClipPlane>
") ClipPlanes;
		const opencascade::handle<Graphic3d_SequenceOfHClipPlane> & ClipPlanes();

		/****************** Color ******************/
		/**** md5 signature: 3ec4d5526906be02304bac49a777209c ****/
		%feature("compactdefaultargs") Color;
		%feature("autodoc", "Returns the color setting of the interactive object.

Parameters
----------
theColor: Quantity_Color

Returns
-------
None
") Color;
		virtual void Color(Quantity_Color & theColor);

		/****************** CombinedParentTransformation ******************/
		/**** md5 signature: 823dcaa3271ee1294574692001416d03 ****/
		%feature("compactdefaultargs") CombinedParentTransformation;
		%feature("autodoc", "Return combined parent transformation.

Returns
-------
opencascade::handle<Geom_Transformation>
") CombinedParentTransformation;
		const opencascade::handle<Geom_Transformation> & CombinedParentTransformation();

		/****************** CurrentFacingModel ******************/
		/**** md5 signature: e7b4247f51b5a9a82f059bec0d9c66fa ****/
		%feature("compactdefaultargs") CurrentFacingModel;
		%feature("autodoc", "Returns the current facing model which is in effect.

Returns
-------
Aspect_TypeOfFacingModel
") CurrentFacingModel;
		Aspect_TypeOfFacingModel CurrentFacingModel();

		/****************** DefaultDisplayMode ******************/
		/**** md5 signature: fda620e5a7d8c732cdacefa5f4f17373 ****/
		%feature("compactdefaultargs") DefaultDisplayMode;
		%feature("autodoc", "Returns the default display mode.

Returns
-------
int
") DefaultDisplayMode;
		virtual Standard_Integer DefaultDisplayMode();

		/****************** DisplayMode ******************/
		/**** md5 signature: 87ab8eae5ccb1d4f4dfd02dc34d6febc ****/
		%feature("compactdefaultargs") DisplayMode;
		%feature("autodoc", "Returns the display mode setting of the interactive object. the range of supported display mode indexes should be specified within object definition and filtered by accepdisplaymode(). @sa acceptdisplaymode().

Returns
-------
int
") DisplayMode;
		Standard_Integer DisplayMode();


            %feature("autodoc", "1");
            %extend{
                std::string DumpJsonToString(int depth=-1) {
                std::stringstream s;
                self->DumpJson(s, depth);
                return s.str();}
            };
		/****************** DynamicHilightAttributes ******************/
		/**** md5 signature: 9c44b3555020951e689ea9d2e141bc3d ****/
		%feature("compactdefaultargs") DynamicHilightAttributes;
		%feature("autodoc", "Returns the hilight attributes settings. when not null, overrides both prs3d_typeofhighlight_localdynamic and prs3d_typeofhighlight_dynamic defined within ais_interactivecontext.

Returns
-------
opencascade::handle<Prs3d_Drawer>
") DynamicHilightAttributes;
		const opencascade::handle<Prs3d_Drawer> & DynamicHilightAttributes();

		/****************** GetTransformPersistenceMode ******************/
		/**** md5 signature: 962072ac918366817a8f5012a823a38e ****/
		%feature("compactdefaultargs") GetTransformPersistenceMode;
		%feature("autodoc", "Gets transform persistence mode for this object.

Returns
-------
Graphic3d_TransModeFlags
") GetTransformPersistenceMode;
		Graphic3d_TransModeFlags GetTransformPersistenceMode();

		/****************** GetTransformPersistencePoint ******************/
		/**** md5 signature: 3adb552378412254ff4b806352304578 ****/
		%feature("compactdefaultargs") GetTransformPersistencePoint;
		%feature("autodoc", "Gets point of transform persistence for this object.

Returns
-------
gp_Pnt
") GetTransformPersistencePoint;
		gp_Pnt GetTransformPersistencePoint();

		/****************** HasColor ******************/
		/**** md5 signature: f14084fe0c7674324d105b06cc1ff5b4 ****/
		%feature("compactdefaultargs") HasColor;
		%feature("autodoc", "Returns true if the interactive object has color.

Returns
-------
bool
") HasColor;
		Standard_Boolean HasColor();

		/****************** HasDisplayMode ******************/
		/**** md5 signature: dd0b9b505cadfeaf92483f8d0b8ffd59 ****/
		%feature("compactdefaultargs") HasDisplayMode;
		%feature("autodoc", "Returns true if the interactive object has display mode setting overriding global setting (within interactive context).

Returns
-------
bool
") HasDisplayMode;
		Standard_Boolean HasDisplayMode();

		/****************** HasHilightMode ******************/
		/**** md5 signature: 35c4cc36b9d1287cbb8be9209c167aef ****/
		%feature("compactdefaultargs") HasHilightMode;
		%feature("autodoc", "Returns true if the interactive object is in highlight mode.

Returns
-------
bool
") HasHilightMode;
		Standard_Boolean HasHilightMode();

		/****************** HasMaterial ******************/
		/**** md5 signature: 8bde772f946375b9fcc789f278ec2796 ****/
		%feature("compactdefaultargs") HasMaterial;
		%feature("autodoc", "Returns true if the interactive object has a setting for material.

Returns
-------
bool
") HasMaterial;
		Standard_Boolean HasMaterial();

		/****************** HasOwnPresentations ******************/
		/**** md5 signature: 153f02083dc2acb34db1dabac2b5fd90 ****/
		%feature("compactdefaultargs") HasOwnPresentations;
		%feature("autodoc", "Returns true if object should have own presentations.

Returns
-------
bool
") HasOwnPresentations;
		Standard_Boolean HasOwnPresentations();

		/****************** HasPolygonOffsets ******************/
		/**** md5 signature: 046170f7f77257e0750c28d56cd76064 ****/
		%feature("compactdefaultargs") HasPolygonOffsets;
		%feature("autodoc", "Returns standard_true if <mydrawer> has non-null shading aspect.

Returns
-------
bool
") HasPolygonOffsets;
		virtual Standard_Boolean HasPolygonOffsets();

		/****************** HasTransformation ******************/
		/**** md5 signature: 652edcbacf21dcccd9a135f2682c5344 ****/
		%feature("compactdefaultargs") HasTransformation;
		%feature("autodoc", "Returns true if object has a transformation that is different from the identity.

Returns
-------
bool
") HasTransformation;
		Standard_Boolean HasTransformation();

		/****************** HasWidth ******************/
		/**** md5 signature: 93af72110529b1e94c6797d09cd35e15 ****/
		%feature("compactdefaultargs") HasWidth;
		%feature("autodoc", "Returns true if the interactive object has width.

Returns
-------
bool
") HasWidth;
		Standard_Boolean HasWidth();

		/****************** HilightAttributes ******************/
		/**** md5 signature: 028c3cfd528f1150f36206e2e1fd24ab ****/
		%feature("compactdefaultargs") HilightAttributes;
		%feature("autodoc", "Returns the hilight attributes settings. when not null, overrides both prs3d_typeofhighlight_localselected and prs3d_typeofhighlight_selected defined within ais_interactivecontext.

Returns
-------
opencascade::handle<Prs3d_Drawer>
") HilightAttributes;
		const opencascade::handle<Prs3d_Drawer> & HilightAttributes();

		/****************** HilightMode ******************/
		/**** md5 signature: 65e4b0407fae3cd6d737aa6b7e74bfa0 ****/
		%feature("compactdefaultargs") HilightMode;
		%feature("autodoc", "Returns highlight display mode. this is obsolete method for backward compatibility - use ::hilightattributes() and ::dynamichilightattributes() instead.

Returns
-------
int
") HilightMode;
		Standard_Integer HilightMode();

		/****************** InversedTransformation ******************/
		/**** md5 signature: aefc1fc4bc8fc1a359fecf8390084420 ****/
		%feature("compactdefaultargs") InversedTransformation;
		%feature("autodoc", "Return inversed transformation.

Returns
-------
gp_GTrsf
") InversedTransformation;
		const gp_GTrsf InversedTransformation();

		/****************** IsInfinite ******************/
		/**** md5 signature: 7633661c322c89b950f649430bd827bf ****/
		%feature("compactdefaultargs") IsInfinite;
		%feature("autodoc", "Returns true if the interactive object is infinite; false by default. this flag affects various operations operating on bounding box of graphic presentations of this object. for instance, infinite objects are not taken in account for view fitall. this does not necessarily means that object is actually infinite, auxiliary objects might be also marked with this flag to achieve desired behavior.

Returns
-------
bool
") IsInfinite;
		Standard_Boolean IsInfinite();

		/****************** IsMutable ******************/
		/**** md5 signature: 3ee3916ef3d39d63be5557b524ac1b86 ****/
		%feature("compactdefaultargs") IsMutable;
		%feature("autodoc", "Returns true if object has mutable nature (content or location are be changed regularly). mutable object will be managed in different way than static onces (another optimizations).

Returns
-------
bool
") IsMutable;
		Standard_Boolean IsMutable();

		/****************** IsTransparent ******************/
		/**** md5 signature: c84deafd18700322a7b65678305c4b28 ****/
		%feature("compactdefaultargs") IsTransparent;
		%feature("autodoc", "Returns true if there is a transparency setting.

Returns
-------
bool
") IsTransparent;
		Standard_Boolean IsTransparent();

		/****************** LocalTransformation ******************/
		/**** md5 signature: d727e7863f78900c68e430ca7d96d70c ****/
		%feature("compactdefaultargs") LocalTransformation;
		%feature("autodoc", "Return the local transformation. note that the local transformation of the object having transformation persistence is applied within local coordinate system defined by this persistence.

Returns
-------
gp_Trsf
") LocalTransformation;
		const gp_Trsf LocalTransformation();

		/****************** LocalTransformationGeom ******************/
		/**** md5 signature: 49f2f633f15a5f08334fd18a611dca73 ****/
		%feature("compactdefaultargs") LocalTransformationGeom;
		%feature("autodoc", "Return the local transformation. note that the local transformation of the object having transformation persistence is applied within local coordinate system defined by this persistence.

Returns
-------
opencascade::handle<Geom_Transformation>
") LocalTransformationGeom;
		const opencascade::handle<Geom_Transformation> & LocalTransformationGeom();

		/****************** Material ******************/
		/**** md5 signature: 016c712e17370767713256cdb90adb24 ****/
		%feature("compactdefaultargs") Material;
		%feature("autodoc", "Returns the current material setting as enumeration value.

Returns
-------
Graphic3d_NameOfMaterial
") Material;
		virtual Graphic3d_NameOfMaterial Material();

		/****************** Parent ******************/
		/**** md5 signature: b281c508616907c678ce34cfa2fc8478 ****/
		%feature("compactdefaultargs") Parent;
		%feature("autodoc", "Returns parent of current object in scene hierarchy.

Returns
-------
PrsMgr_PresentableObject *
") Parent;
		PrsMgr_PresentableObject * Parent();

		/****************** PolygonOffsets ******************/
		/**** md5 signature: 7abd14e2a1f6ce136288eb910f29a042 ****/
		%feature("compactdefaultargs") PolygonOffsets;
		%feature("autodoc", "Retrieves current polygon offsets settings from <mydrawer>.

Parameters
----------
aFactor: Standard_ShortReal
aUnits: Standard_ShortReal

Returns
-------
aMode: int
") PolygonOffsets;
		virtual void PolygonOffsets(Standard_Integer &OutValue, Standard_ShortReal & aFactor, Standard_ShortReal & aUnits);

		/****************** Presentations ******************/
		/**** md5 signature: 20fe67fbbae7e29f768f3449d76ed496 ****/
		%feature("compactdefaultargs") Presentations;
		%feature("autodoc", "Return presentations.

Returns
-------
PrsMgr_Presentations
") Presentations;
		PrsMgr_Presentations & Presentations();

		/****************** RemoveChild ******************/
		/**** md5 signature: e02c6f54c604ff7afdb06fab9281f205 ****/
		%feature("compactdefaultargs") RemoveChild;
		%feature("autodoc", "Removes theobject from children of current object in scene hierarchy.

Parameters
----------
theObject: PrsMgr_PresentableObject

Returns
-------
None
") RemoveChild;
		virtual void RemoveChild(const opencascade::handle<PrsMgr_PresentableObject> & theObject);

		/****************** RemoveChildWithRestoreTransformation ******************/
		/**** md5 signature: 4e196c472e579f89becf833b09af5927 ****/
		%feature("compactdefaultargs") RemoveChildWithRestoreTransformation;
		%feature("autodoc", "Removes theobject from children of current object in scene hierarchy with keeping the current global transformation. so the object keeps the same position/orientation in the global cs.

Parameters
----------
theObject: PrsMgr_PresentableObject

Returns
-------
None
") RemoveChildWithRestoreTransformation;
		void RemoveChildWithRestoreTransformation(const opencascade::handle<PrsMgr_PresentableObject> & theObject);

		/****************** RemoveClipPlane ******************/
		/**** md5 signature: e644cc8dadfbe38b4691bed6b83a05f2 ****/
		%feature("compactdefaultargs") RemoveClipPlane;
		%feature("autodoc", "Removes previously added clip plane. @param theplane [in] the clip plane to be removed from map of clip planes.

Parameters
----------
thePlane: Graphic3d_ClipPlane

Returns
-------
None
") RemoveClipPlane;
		virtual void RemoveClipPlane(const opencascade::handle<Graphic3d_ClipPlane> & thePlane);

		/****************** ResetTransformation ******************/
		/**** md5 signature: 282062bec499f4def850136648ca2e3b ****/
		%feature("compactdefaultargs") ResetTransformation;
		%feature("autodoc", "Resets local transformation to identity.

Returns
-------
None
") ResetTransformation;
		virtual void ResetTransformation();

		/****************** SetAttributes ******************/
		/**** md5 signature: 83e0618a8a813c8b2d6cb1cd465e638c ****/
		%feature("compactdefaultargs") SetAttributes;
		%feature("autodoc", "Initializes the drawing tool thedrawer.

Parameters
----------
theDrawer: Prs3d_Drawer

Returns
-------
None
") SetAttributes;
		virtual void SetAttributes(const opencascade::handle<Prs3d_Drawer> & theDrawer);

		/****************** SetClipPlanes ******************/
		/**** md5 signature: bcb099bc809502c68eb709ec47187e6c ****/
		%feature("compactdefaultargs") SetClipPlanes;
		%feature("autodoc", "Set clip planes for graphical clipping for all display mode presentations. the composition of clip planes truncates the rendering space to convex volume. please be aware that number of supported clip plane is limited. the planes which exceed the limit are ignored. besides of this, some planes can be already set in view where the object is shown: the number of these planes should be subtracted from limit to predict the maximum possible number of object clipping planes.

Parameters
----------
thePlanes: Graphic3d_SequenceOfHClipPlane

Returns
-------
None
") SetClipPlanes;
		virtual void SetClipPlanes(const opencascade::handle<Graphic3d_SequenceOfHClipPlane> & thePlanes);

		/****************** SetClipPlanes ******************/
		/**** md5 signature: 07b77eb94c54463d3580213e6e88f118 ****/
		%feature("compactdefaultargs") SetClipPlanes;
		%feature("autodoc", "No available documentation.

Parameters
----------
thePlanes: Graphic3d_SequenceOfHClipPlane

Returns
-------
None
") SetClipPlanes;
		void SetClipPlanes(const Graphic3d_SequenceOfHClipPlane & thePlanes);

		/****************** SetColor ******************/
		/**** md5 signature: 00f0a4e343c1e144a6992078bccbe32c ****/
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "Only the interactive object knowns which drawer attribute is affected by the color, if any (ex: for a wire,it's the wireaspect field of the drawer, but for a vertex, only the point aspect field is affected by the color). warning : do not forget to set the corresponding fields here (hasowncolor and mydrawer->setcolor()).

Parameters
----------
theColor: Quantity_Color

Returns
-------
None
") SetColor;
		virtual void SetColor(const Quantity_Color & theColor);

		/****************** SetCurrentFacingModel ******************/
		/**** md5 signature: 342c87e4f6a273a2df4924281da37e91 ****/
		%feature("compactdefaultargs") SetCurrentFacingModel;
		%feature("autodoc", "Change the current facing model apply on polygons for setcolor(), settransparency(), setmaterial() methods default facing model is aspect_tofm_two_side. this mean that attributes is applying both on the front and back face.

Parameters
----------
theModel: Aspect_TypeOfFacingModel,optional
	default value is Aspect_TOFM_BOTH_SIDE

Returns
-------
None
") SetCurrentFacingModel;
		void SetCurrentFacingModel(const Aspect_TypeOfFacingModel theModel = Aspect_TOFM_BOTH_SIDE);

		/****************** SetDisplayMode ******************/
		/**** md5 signature: 2a99a6840fca4af1fbc5cc91ac2d554d ****/
		%feature("compactdefaultargs") SetDisplayMode;
		%feature("autodoc", "Sets the display mode for the interactive object. an object can have its own temporary display mode, which is different from that proposed by the interactive context. @sa acceptdisplaymode().

Parameters
----------
theMode: int

Returns
-------
None
") SetDisplayMode;
		void SetDisplayMode(const Standard_Integer theMode);

		/****************** SetDynamicHilightAttributes ******************/
		/**** md5 signature: ca58806abff4ac2f5e9c97a9fcb85be9 ****/
		%feature("compactdefaultargs") SetDynamicHilightAttributes;
		%feature("autodoc", "Initializes the dynamic hilight drawing tool.

Parameters
----------
theDrawer: Prs3d_Drawer

Returns
-------
None
") SetDynamicHilightAttributes;
		virtual void SetDynamicHilightAttributes(const opencascade::handle<Prs3d_Drawer> & theDrawer);

		/****************** SetHilightAttributes ******************/
		/**** md5 signature: 582bdaffacaeebcf9a6901419be3e359 ****/
		%feature("compactdefaultargs") SetHilightAttributes;
		%feature("autodoc", "Initializes the hilight drawing tool thedrawer.

Parameters
----------
theDrawer: Prs3d_Drawer

Returns
-------
None
") SetHilightAttributes;
		virtual void SetHilightAttributes(const opencascade::handle<Prs3d_Drawer> & theDrawer);

		/****************** SetHilightMode ******************/
		/**** md5 signature: 0fd85a8f52dd5fb591746b6a5ceb9590 ****/
		%feature("compactdefaultargs") SetHilightMode;
		%feature("autodoc", "Sets highlight display mode. this is obsolete method for backward compatibility - use ::hilightattributes() and ::dynamichilightattributes() instead.

Parameters
----------
theMode: int

Returns
-------
None
") SetHilightMode;
		void SetHilightMode(const Standard_Integer theMode);

		/****************** SetInfiniteState ******************/
		/**** md5 signature: be53a3ebba916ae90a429c5093c38737 ****/
		%feature("compactdefaultargs") SetInfiniteState;
		%feature("autodoc", "Sets if object should be considered as infinite.

Parameters
----------
theFlag: bool,optional
	default value is Standard_True

Returns
-------
None
") SetInfiniteState;
		void SetInfiniteState(const Standard_Boolean theFlag = Standard_True);

		/****************** SetIsoOnTriangulation ******************/
		/**** md5 signature: ce0a77a4be58bef84b86bf0f2501ffef ****/
		%feature("compactdefaultargs") SetIsoOnTriangulation;
		%feature("autodoc", "Enables or disables on-triangulation build of isolines according to the flag given.

Parameters
----------
theIsEnabled: bool

Returns
-------
None
") SetIsoOnTriangulation;
		void SetIsoOnTriangulation(const Standard_Boolean theIsEnabled);

		/****************** SetLocalTransformation ******************/
		/**** md5 signature: df3591aee60d963520e1b86ed93fcb47 ****/
		%feature("compactdefaultargs") SetLocalTransformation;
		%feature("autodoc", "Sets local transformation to thetransformation. note that the local transformation of the object having transformation persistence is applied within local coordinate system defined by this persistence.

Parameters
----------
theTrsf: gp_Trsf

Returns
-------
None
") SetLocalTransformation;
		void SetLocalTransformation(const gp_Trsf & theTrsf);

		/****************** SetLocalTransformation ******************/
		/**** md5 signature: 3a5d423eca534fb275fc2d61b2ba4344 ****/
		%feature("compactdefaultargs") SetLocalTransformation;
		%feature("autodoc", "Sets local transformation to thetransformation. note that the local transformation of the object having transformation persistence is applied within local coordinate system defined by this persistence.

Parameters
----------
theTrsf: Geom_Transformation

Returns
-------
None
") SetLocalTransformation;
		void SetLocalTransformation(const opencascade::handle<Geom_Transformation> & theTrsf);

		/****************** SetMaterial ******************/
		/**** md5 signature: 92a522cdb58df60ff50ddd69027d631f ****/
		%feature("compactdefaultargs") SetMaterial;
		%feature("autodoc", "Sets the material amat defining this display attribute for the interactive object. material aspect determines shading aspect, color and transparency of visible entities.

Parameters
----------
aName: Graphic3d_MaterialAspect

Returns
-------
None
") SetMaterial;
		virtual void SetMaterial(const Graphic3d_MaterialAspect & aName);

		/****************** SetMutable ******************/
		/**** md5 signature: 5fa59925e1868e4db8b5115d09b9eea4 ****/
		%feature("compactdefaultargs") SetMutable;
		%feature("autodoc", "Sets if the object has mutable nature (content or location will be changed regularly). this method should be called before object displaying to take effect.

Parameters
----------
theIsMutable: bool

Returns
-------
None
") SetMutable;
		virtual void SetMutable(const Standard_Boolean theIsMutable);

		/****************** SetPolygonOffsets ******************/
		/**** md5 signature: bcb2cc6b36e7f5da584a89ed6e331ba7 ****/
		%feature("compactdefaultargs") SetPolygonOffsets;
		%feature("autodoc", "Sets up polygon offsets for this object. @sa graphic3d_aspects::setpolygonoffsets().

Parameters
----------
aMode: int
aFactor: Standard_ShortReal,optional
	default value is 1.0
aUnits: Standard_ShortReal,optional
	default value is 0.0

Returns
-------
None
") SetPolygonOffsets;
		virtual void SetPolygonOffsets(const Standard_Integer aMode, const Standard_ShortReal aFactor = 1.0, const Standard_ShortReal aUnits = 0.0);

		/****************** SetPropagateVisualState ******************/
		/**** md5 signature: d71a048de66c3e35f2dc099b481bcded ****/
		%feature("compactdefaultargs") SetPropagateVisualState;
		%feature("autodoc", "Change the value of the flag 'propagate visual state'.

Parameters
----------
theFlag: bool

Returns
-------
None
") SetPropagateVisualState;
		void SetPropagateVisualState(const Standard_Boolean theFlag);

		/****************** SetToUpdate ******************/
		/**** md5 signature: 4e115245e20e62a5fea5d45758049758 ****/
		%feature("compactdefaultargs") SetToUpdate;
		%feature("autodoc", "Flags presentation to be updated; updatepresentations() will recompute these presentations. @param themode presentation (display mode) to invalidate, or -1 to invalidate them all.

Parameters
----------
theMode: int

Returns
-------
None
") SetToUpdate;
		void SetToUpdate(Standard_Integer theMode);

		/****************** SetToUpdate ******************/
		/**** md5 signature: 4a65af550d5ec39b45b7761dfdbbd7c3 ****/
		%feature("compactdefaultargs") SetToUpdate;
		%feature("autodoc", "Flags all the presentations to be updated.

Returns
-------
None
") SetToUpdate;
		void SetToUpdate();

		/****************** SetTransformPersistence ******************/
		/**** md5 signature: 9823ebeffde5eb16b0c205a862e3b2c2 ****/
		%feature("compactdefaultargs") SetTransformPersistence;
		%feature("autodoc", "Sets up transform persistence defining a special local coordinate system where this object should be located. note that management of transform persistence object is more expensive than of the normal one, because it requires its position being recomputed basing on camera position within each draw call / traverse. @sa graphic3d_transformpers class description.

Parameters
----------
theTrsfPers: Graphic3d_TransformPers

Returns
-------
None
") SetTransformPersistence;
		virtual void SetTransformPersistence(const opencascade::handle<Graphic3d_TransformPers> & theTrsfPers);

		/****************** SetTransformPersistence ******************/
		/**** md5 signature: 40850175dee1c75cf5c4de5f4378d711 ****/
		%feature("compactdefaultargs") SetTransformPersistence;
		%feature("autodoc", "Sets up transform persistence mode for this object. this function used to lock in object position, rotation and / or zooming relative to camera position. object will be drawn in the origin setted by thepoint parameter (except graphic3d_tmf_triedronpers flag - see description later). themode should be: - graphic3d_tmf_none - no persistence attributes (reset); - graphic3d_tmf_zoompers - object doesn't resize; - graphic3d_tmf_rotatepers - object doesn't rotate; - graphic3d_tmf_zoomrotatepers - object doesn't resize and rotate; - graphic3d_tmf_rotatepers - object doesn't rotate; - graphic3d_tmf_triedronpers - object behaves like trihedron. if graphic3d_tmf_triedronpers or graphic3d_tmf_2d persistence mode selected thepoint coordinates x and y means: - x = 0.0, y = 0.0 - center of view window; - x > 0.0, y > 0.0 - right upper corner of view window; - x > 0.0, y < 0.0 - right lower corner of view window; - x < 0.0, y > 0.0 - left upper corner of view window; - x < 0.0, y < 0.0 - left lower corner of view window. and z coordinate defines the gap from border of view window (except center position).

Parameters
----------
theMode: Graphic3d_TransModeFlags
thePoint: gp_Pnt,optional
	default value is gp_Pnt(0.0,0.0,0.0)

Returns
-------
None
") SetTransformPersistence;
		void SetTransformPersistence(const Graphic3d_TransModeFlags theMode, const gp_Pnt & thePoint = gp_Pnt(0.0,0.0,0.0));

		/****************** SetTransparency ******************/
		/**** md5 signature: 6904036a7c429832a3fcf1769aa51bbc ****/
		%feature("compactdefaultargs") SetTransparency;
		%feature("autodoc", "Attributes a setting avalue for transparency. the transparency value should be between 0.0 and 1.0. at 0.0 an object will be totally opaque, and at 1.0, fully transparent. warning at a value of 1.0, there may be nothing visible.

Parameters
----------
aValue: float,optional
	default value is 0.6

Returns
-------
None
") SetTransparency;
		virtual void SetTransparency(const Standard_Real aValue = 0.6);

		/****************** SetTypeOfPresentation ******************/
		/**** md5 signature: 8d261802c28692e13d983f3822259436 ****/
		%feature("compactdefaultargs") SetTypeOfPresentation;
		%feature("autodoc", "Set type of presentation.

Parameters
----------
theType: PrsMgr_TypeOfPresentation3d

Returns
-------
None
") SetTypeOfPresentation;
		void SetTypeOfPresentation(const PrsMgr_TypeOfPresentation3d theType);

		/****************** SetWidth ******************/
		/**** md5 signature: 11debc629042f252811dd0b5a3de5b4a ****/
		%feature("compactdefaultargs") SetWidth;
		%feature("autodoc", "Allows you to provide the setting avalue for width. only the interactive object knows which drawer attribute is affected by the width setting.

Parameters
----------
theWidth: float

Returns
-------
None
") SetWidth;
		virtual void SetWidth(const Standard_Real theWidth);

		/****************** SetZLayer ******************/
		/**** md5 signature: 7f7b7652c4d748d54d9fe58f5f98330a ****/
		%feature("compactdefaultargs") SetZLayer;
		%feature("autodoc", "Set z layer id and update all presentations of the presentable object. the layers mechanism allows drawing objects in higher layers in overlay of objects in lower layers.

Parameters
----------
theLayerId: int

Returns
-------
None
") SetZLayer;
		virtual void SetZLayer(int theLayerId);

		/****************** SynchronizeAspects ******************/
		/**** md5 signature: 69ddcd4778627d05f3cdbe0b7273911f ****/
		%feature("compactdefaultargs") SynchronizeAspects;
		%feature("autodoc", "Synchronize presentation aspects after their modification. //! this method should be called after modifying primitive aspect properties (material, texture, shader) so that modifications will take effect on already computed presentation groups (thus avoiding re-displaying the object).

Returns
-------
None
") SynchronizeAspects;
		void SynchronizeAspects();

		/****************** ToBeUpdated ******************/
		/**** md5 signature: f2e41689909e2a27ddd3f475e35f02c5 ****/
		%feature("compactdefaultargs") ToBeUpdated;
		%feature("autodoc", "Returns true if any active presentation has invalidation flag. @param thetoincludehidden when true, also checks hidden presentations.

Parameters
----------
theToIncludeHidden: bool,optional
	default value is Standard_False

Returns
-------
bool
") ToBeUpdated;
		Standard_Boolean ToBeUpdated(Standard_Boolean theToIncludeHidden = Standard_False);

		/****************** ToBeUpdated ******************/
		/**** md5 signature: 905b5fc6f277735ff6cfd6892f9be7f4 ****/
		%feature("compactdefaultargs") ToBeUpdated;
		%feature("autodoc", "Gives the list of modes which are flagged 'to be updated'.

Parameters
----------
ListOfMode: TColStd_ListOfInteger

Returns
-------
None
") ToBeUpdated;
		void ToBeUpdated(TColStd_ListOfInteger & ListOfMode);

		/****************** ToPropagateVisualState ******************/
		/**** md5 signature: e1a8691bdd1c5fe7694d8d102a8ff3a9 ****/
		%feature("compactdefaultargs") ToPropagateVisualState;
		%feature("autodoc", "Get value of the flag 'propagate visual state' it means that the display/erase/color visual state is propagated automatically to all children; by default, the flag is true .

Returns
-------
bool
") ToPropagateVisualState;
		Standard_Boolean ToPropagateVisualState();

		/****************** TransformPersistence ******************/
		/**** md5 signature: f93fa6b8590ec0070c74ed0573b98382 ****/
		%feature("compactdefaultargs") TransformPersistence;
		%feature("autodoc", "Returns transformation persistence defining a special local coordinate system where this presentable object is located or null handle if not defined. position of the object having transformation persistence is mutable and depends on camera position. the same applies to a bounding box of the object. @sa graphic3d_transformpers class description.

Returns
-------
opencascade::handle<Graphic3d_TransformPers>
") TransformPersistence;
		const opencascade::handle<Graphic3d_TransformPers> & TransformPersistence();

		/****************** Transformation ******************/
		/**** md5 signature: 4340f0c35d6856faf6f9daeca03f9595 ****/
		%feature("compactdefaultargs") Transformation;
		%feature("autodoc", "Return the transformation taking into account transformation of parent object(s). note that the local transformation of the object having transformation persistence is applied within local coordinate system defined by this persistence.

Returns
-------
gp_Trsf
") Transformation;
		const gp_Trsf Transformation();

		/****************** TransformationGeom ******************/
		/**** md5 signature: b466680ae50895769bb7cf7c7ed439a5 ****/
		%feature("compactdefaultargs") TransformationGeom;
		%feature("autodoc", "Return the transformation taking into account transformation of parent object(s). note that the local transformation of the object having transformation persistence is applied within local coordinate system defined by this persistence.

Returns
-------
opencascade::handle<Geom_Transformation>
") TransformationGeom;
		const opencascade::handle<Geom_Transformation> & TransformationGeom();

		/****************** Transparency ******************/
		/**** md5 signature: 85ff2aaf1e1e55093c79984940af1fec ****/
		%feature("compactdefaultargs") Transparency;
		%feature("autodoc", "Returns the transparency setting. this will be between 0.0 and 1.0. at 0.0 an object will be totally opaque, and at 1.0, fully transparent.

Returns
-------
float
") Transparency;
		virtual Standard_Real Transparency();

		/****************** TypeOfPresentation3d ******************/
		/**** md5 signature: 67a5ba69df5366d9667f1399309351b0 ****/
		%feature("compactdefaultargs") TypeOfPresentation3d;
		%feature("autodoc", "Returns information on whether the object accepts display in hlr mode or not.

Returns
-------
PrsMgr_TypeOfPresentation3d
") TypeOfPresentation3d;
		PrsMgr_TypeOfPresentation3d TypeOfPresentation3d();

		/****************** UnsetAttributes ******************/
		/**** md5 signature: 84cf9eff16090809fb3245e968e98248 ****/
		%feature("compactdefaultargs") UnsetAttributes;
		%feature("autodoc", "Clears settings provided by the drawing tool adrawer.

Returns
-------
None
") UnsetAttributes;
		virtual void UnsetAttributes();

		/****************** UnsetColor ******************/
		/**** md5 signature: 0ea15413ea707848f5ffd4a7e5a0186c ****/
		%feature("compactdefaultargs") UnsetColor;
		%feature("autodoc", "Removes color settings. only the interactive object knows which drawer attribute is affected by the color setting. for a wire, for example, wire aspect is the attribute affected. for a vertex, however, only point aspect is affected by the color setting.

Returns
-------
None
") UnsetColor;
		virtual void UnsetColor();

		/****************** UnsetDisplayMode ******************/
		/**** md5 signature: 1c441f0b3a62704e64d079e0a0e8cfc1 ****/
		%feature("compactdefaultargs") UnsetDisplayMode;
		%feature("autodoc", "Removes display mode settings from the interactive object.

Returns
-------
None
") UnsetDisplayMode;
		void UnsetDisplayMode();

		/****************** UnsetHilightAttributes ******************/
		/**** md5 signature: 997079826c7aaf973a9319b91cfbbf03 ****/
		%feature("compactdefaultargs") UnsetHilightAttributes;
		%feature("autodoc", "Clears settings provided by the hilight drawing tool thedrawer.

Returns
-------
None
") UnsetHilightAttributes;
		virtual void UnsetHilightAttributes();

		/****************** UnsetHilightMode ******************/
		/**** md5 signature: cc3796da2fbce682bdfefcce93091c39 ****/
		%feature("compactdefaultargs") UnsetHilightMode;
		%feature("autodoc", "Unsets highlight display mode.

Returns
-------
None
") UnsetHilightMode;
		void UnsetHilightMode();

		/****************** UnsetMaterial ******************/
		/**** md5 signature: ed12e05d62dadb3433224682430b3af6 ****/
		%feature("compactdefaultargs") UnsetMaterial;
		%feature("autodoc", "Removes the setting for material.

Returns
-------
None
") UnsetMaterial;
		virtual void UnsetMaterial();

		/****************** UnsetTransparency ******************/
		/**** md5 signature: c77a13cddf6ac485ca6e72bd4cc9a3f6 ****/
		%feature("compactdefaultargs") UnsetTransparency;
		%feature("autodoc", "Removes the transparency setting. the object is opaque by default.

Returns
-------
None
") UnsetTransparency;
		virtual void UnsetTransparency();

		/****************** UnsetWidth ******************/
		/**** md5 signature: e32f0d0e7a327ab58b75cb6e6deb0b31 ****/
		%feature("compactdefaultargs") UnsetWidth;
		%feature("autodoc", "Reset width to default value.

Returns
-------
None
") UnsetWidth;
		virtual void UnsetWidth();

		/****************** UpdateTransformation ******************/
		/**** md5 signature: a121acc901f43b5b10ae520e7898fe7e ****/
		%feature("compactdefaultargs") UpdateTransformation;
		%feature("autodoc", "Updates final transformation (parent + local) of presentable object and its presentations.

Returns
-------
None
") UpdateTransformation;
		virtual void UpdateTransformation();

		/****************** Width ******************/
		/**** md5 signature: fabf8349fc4fa48cbd44877ecd356f67 ****/
		%feature("compactdefaultargs") Width;
		%feature("autodoc", "Returns the width setting of the interactive object.

Returns
-------
float
") Width;
		Standard_Real Width();

		/****************** ZLayer ******************/
		/**** md5 signature: 7420fa5788bb824c02345ee38be45933 ****/
		%feature("compactdefaultargs") ZLayer;
		%feature("autodoc", "Get id of z layer for main presentation.

Returns
-------
Graphic3d_ZLayerId
") ZLayer;
		Graphic3d_ZLayerId ZLayer();

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
		/**** md5 signature: 23b81bfe6f31892aaf512d3439e16127 ****/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Removes the whole content of the presentation. does not remove the other connected presentations.

Parameters
----------
theWithDestruction: bool,optional
	default value is Standard_True

Returns
-------
None
") Clear;
		virtual void Clear(const Standard_Boolean theWithDestruction = Standard_True);

		/****************** Compute ******************/
		/**** md5 signature: e00c7761ecdbff16b5eaa284ed126d0e ****/
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "Compute structure using presentation manager.

Returns
-------
None
") Compute;
		virtual void Compute();

		/****************** Display ******************/
		/**** md5 signature: 869c346ea6117dea2e22059b972a14d6 ****/
		%feature("compactdefaultargs") Display;
		%feature("autodoc", "Display structure.

Returns
-------
None
") Display;
		virtual void Display();

		/****************** Erase ******************/
		/**** md5 signature: 1226ba71f21d492e9a9175cd12d59e28 ****/
		%feature("compactdefaultargs") Erase;
		%feature("autodoc", "Remove structure.

Returns
-------
None
") Erase;
		virtual void Erase();

		/****************** Highlight ******************/
		/**** md5 signature: 2af121cc6b89a43225bf54a5f726264f ****/
		%feature("compactdefaultargs") Highlight;
		%feature("autodoc", "Highlight structure.

Parameters
----------
theStyle: Prs3d_Drawer

Returns
-------
None
") Highlight;
		void Highlight(const opencascade::handle<Prs3d_Drawer> & theStyle);

		/****************** IsDisplayed ******************/
		/**** md5 signature: fac1864b342038e36d4e4790c73e2b9e ****/
		%feature("compactdefaultargs") IsDisplayed;
		%feature("autodoc", "Return true if structure has been displayed and in no hidden state.

Returns
-------
bool
") IsDisplayed;
		virtual Standard_Boolean IsDisplayed();

		/****************** Mode ******************/
		/**** md5 signature: b35445cddc9deccdf8a4cb5a0f8a439b ****/
		%feature("compactdefaultargs") Mode;
		%feature("autodoc", "Return display mode index.

Returns
-------
int
") Mode;
		Standard_Integer Mode();

		/****************** MustBeUpdated ******************/
		/**** md5 signature: 417e329cf76d7a136d3982c4ef6dde3f ****/
		%feature("compactdefaultargs") MustBeUpdated;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") MustBeUpdated;
		Standard_Boolean MustBeUpdated();

		/****************** Presentation ******************/
		/**** md5 signature: b7e1666dbf5d4a095a7ae27febdcee77 ****/
		%feature("compactdefaultargs") Presentation;
		%feature("autodoc", "No available documentation.

Returns
-------
Prs3d_Presentation *
") Presentation;
		Prs3d_Presentation * Presentation();

		/****************** PresentationManager ******************/
		/**** md5 signature: 2cbfcde90764ccb87f59f20d322e49c2 ****/
		%feature("compactdefaultargs") PresentationManager;
		%feature("autodoc", "Returns the presentationmanager in which the presentation has been created.

Returns
-------
opencascade::handle<PrsMgr_PresentationManager>
") PresentationManager;
		const opencascade::handle<PrsMgr_PresentationManager> & PresentationManager();

		/****************** SetUpdateStatus ******************/
		/**** md5 signature: 8f54b569772ca23ead0aece319538eca ****/
		%feature("compactdefaultargs") SetUpdateStatus;
		%feature("autodoc", "No available documentation.

Parameters
----------
theUpdateStatus: bool

Returns
-------
None
") SetUpdateStatus;
		void SetUpdateStatus(const Standard_Boolean theUpdateStatus);

		/****************** Unhighlight ******************/
		/**** md5 signature: 39ce43ce3b46f356efde8e354316b376 ****/
		%feature("compactdefaultargs") Unhighlight;
		%feature("autodoc", "Unhighlight structure.

Returns
-------
None
") Unhighlight;
		void Unhighlight();

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
		/****************** PrsMgr_PresentationManager ******************/
		/**** md5 signature: 912531ce0eace5bff06138fecd7e1bfb ****/
		%feature("compactdefaultargs") PrsMgr_PresentationManager;
		%feature("autodoc", "Creates a framework to manage displays and graphic entities with the 3d view thestructuremanager.

Parameters
----------
theStructureManager: Graphic3d_StructureManager

Returns
-------
None
") PrsMgr_PresentationManager;
		 PrsMgr_PresentationManager(const opencascade::handle<Graphic3d_StructureManager> & theStructureManager);

		/****************** AddToImmediateList ******************/
		/**** md5 signature: ca9914b9c7fe88b10912f7bc809fcb1b ****/
		%feature("compactdefaultargs") AddToImmediateList;
		%feature("autodoc", "Stores theprs in the transient list of presentations to be displayed in immediate mode. will be taken in account in endimmediatedraw method.

Parameters
----------
thePrs: Prs3d_Presentation

Returns
-------
None
") AddToImmediateList;
		void AddToImmediateList(const opencascade::handle<Prs3d_Presentation> & thePrs);

		/****************** BeginImmediateDraw ******************/
		/**** md5 signature: 5e4c9214cafb77f34e29a75aeb7b96e3 ****/
		%feature("compactdefaultargs") BeginImmediateDraw;
		%feature("autodoc", "Resets the transient list of presentations previously displayed in immediate mode and begins accumulation of new list by following addtoimmediatelist()/color()/highlight() calls.

Returns
-------
None
") BeginImmediateDraw;
		void BeginImmediateDraw();

		/****************** Clear ******************/
		/**** md5 signature: 2a61577b895e4850e9c9f89caef0b9b7 ****/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Clears the presentation of the presentable object theprsobject in this framework with the display mode themode.

Parameters
----------
thePrsObject: PrsMgr_PresentableObject
theMode: int,optional
	default value is 0

Returns
-------
None
") Clear;
		virtual void Clear(const opencascade::handle<PrsMgr_PresentableObject> & thePrsObject, const Standard_Integer theMode = 0);

		/****************** ClearImmediateDraw ******************/
		/**** md5 signature: a61ed789427e61ac8a321653e129d97d ****/
		%feature("compactdefaultargs") ClearImmediateDraw;
		%feature("autodoc", "Resets the transient list of presentations previously displayed in immediate mode.

Returns
-------
None
") ClearImmediateDraw;
		void ClearImmediateDraw();

		/****************** Color ******************/
		/**** md5 signature: b85d3054a96bd70de66cf45192cfb1ea ****/
		%feature("compactdefaultargs") Color;
		%feature("autodoc", "Highlights the graphic object theprsobject in the color thecolor. theprsobject has the display mode themode; this has the default value of 0, that is, the wireframe display mode.

Parameters
----------
thePrsObject: PrsMgr_PresentableObject
theStyle: Prs3d_Drawer
theMode: int,optional
	default value is 0
theSelObj: PrsMgr_PresentableObject,optional
	default value is NULL
theImmediateStructLayerId: int,optional
	default value is Graphic3d_ZLayerId_Topmost

Returns
-------
None
") Color;
		void Color(const opencascade::handle<PrsMgr_PresentableObject> & thePrsObject, const opencascade::handle<Prs3d_Drawer> & theStyle, const Standard_Integer theMode = 0, const opencascade::handle<PrsMgr_PresentableObject> & theSelObj = NULL, int theImmediateStructLayerId = Graphic3d_ZLayerId_Topmost);

		/****************** Connect ******************/
		/**** md5 signature: 1e9fcc77126fa4ddf9593126ebbc3c72 ****/
		%feature("compactdefaultargs") Connect;
		%feature("autodoc", "No available documentation.

Parameters
----------
thePrsObject: PrsMgr_PresentableObject
theOtherObject: PrsMgr_PresentableObject
theMode: int,optional
	default value is 0
theOtherMode: int,optional
	default value is 0

Returns
-------
None
") Connect;
		void Connect(const opencascade::handle<PrsMgr_PresentableObject> & thePrsObject, const opencascade::handle<PrsMgr_PresentableObject> & theOtherObject, const Standard_Integer theMode = 0, const Standard_Integer theOtherMode = 0);

		/****************** Display ******************/
		/**** md5 signature: a374b8bbbbf6d606f9b6880a8d6d23fd ****/
		%feature("compactdefaultargs") Display;
		%feature("autodoc", "Displays the presentation of the object in the given presentation manager with the given mode. the mode should be enumerated by the object which inherits presentableobject.

Parameters
----------
thePrsObject: PrsMgr_PresentableObject
theMode: int,optional
	default value is 0

Returns
-------
None
") Display;
		void Display(const opencascade::handle<PrsMgr_PresentableObject> & thePrsObject, const Standard_Integer theMode = 0);

		/****************** DisplayPriority ******************/
		/**** md5 signature: 4cd85affe30131b51370a5de99d0bffe ****/
		%feature("compactdefaultargs") DisplayPriority;
		%feature("autodoc", "Returns the display priority of the presentable object theprsobject in this framework with the display mode themode.

Parameters
----------
thePrsObject: PrsMgr_PresentableObject
theMode: int

Returns
-------
int
") DisplayPriority;
		Standard_Integer DisplayPriority(const opencascade::handle<PrsMgr_PresentableObject> & thePrsObject, const Standard_Integer theMode);

		/****************** EndImmediateDraw ******************/
		/**** md5 signature: 6979ec7acf16ddaac04142f401974aa8 ****/
		%feature("compactdefaultargs") EndImmediateDraw;
		%feature("autodoc", "Allows rapid drawing of the each view in theviewer by avoiding an update of the whole background.

Parameters
----------
theViewer: V3d_Viewer

Returns
-------
None
") EndImmediateDraw;
		void EndImmediateDraw(const opencascade::handle<V3d_Viewer> & theViewer);

		/****************** Erase ******************/
		/**** md5 signature: 72ad4db7aaa1598173431c5b591b6fe6 ****/
		%feature("compactdefaultargs") Erase;
		%feature("autodoc", "Erases the presentation of the object in the given presentation manager with the given mode. if @themode is -1, then erases all presentations of the object.

Parameters
----------
thePrsObject: PrsMgr_PresentableObject
theMode: int,optional
	default value is 0

Returns
-------
None
") Erase;
		void Erase(const opencascade::handle<PrsMgr_PresentableObject> & thePrsObject, const Standard_Integer theMode = 0);

		/****************** GetZLayer ******************/
		/**** md5 signature: 234266cff6819c09adb5ceab0db4f798 ****/
		%feature("compactdefaultargs") GetZLayer;
		%feature("autodoc", "Get z layer id assigned to all presentations of the object. method returns -1 value if object has no presentations and is impossible to get layer index.

Parameters
----------
thePrsObject: PrsMgr_PresentableObject

Returns
-------
Graphic3d_ZLayerId
") GetZLayer;
		Graphic3d_ZLayerId GetZLayer(const opencascade::handle<PrsMgr_PresentableObject> & thePrsObject);

		/****************** HasPresentation ******************/
		/**** md5 signature: 7269040ca8b3ecda300996321360976b ****/
		%feature("compactdefaultargs") HasPresentation;
		%feature("autodoc", "Returns true if there is a presentation of the presentable object theprsobject in this framework, theprsobject having the display mode themode.

Parameters
----------
thePrsObject: PrsMgr_PresentableObject
theMode: int,optional
	default value is 0

Returns
-------
bool
") HasPresentation;
		Standard_Boolean HasPresentation(const opencascade::handle<PrsMgr_PresentableObject> & thePrsObject, const Standard_Integer theMode = 0);

		/****************** IsDisplayed ******************/
		/**** md5 signature: b3ab321c30d7fe0d9de316b2973869e2 ****/
		%feature("compactdefaultargs") IsDisplayed;
		%feature("autodoc", "No available documentation.

Parameters
----------
thePrsObject: PrsMgr_PresentableObject
theMode: int,optional
	default value is 0

Returns
-------
bool
") IsDisplayed;
		Standard_Boolean IsDisplayed(const opencascade::handle<PrsMgr_PresentableObject> & thePrsObject, const Standard_Integer theMode = 0);

		/****************** IsHighlighted ******************/
		/**** md5 signature: 732c995cfe1cc42df4ef0311005daf6f ****/
		%feature("compactdefaultargs") IsHighlighted;
		%feature("autodoc", "Returns true if the presentation of the presentable object theprsobject in this framework with the display mode themode is highlighted.

Parameters
----------
thePrsObject: PrsMgr_PresentableObject
theMode: int,optional
	default value is 0

Returns
-------
bool
") IsHighlighted;
		Standard_Boolean IsHighlighted(const opencascade::handle<PrsMgr_PresentableObject> & thePrsObject, const Standard_Integer theMode = 0);

		/****************** IsImmediateModeOn ******************/
		/**** md5 signature: 4be60babd0bc73da77be0206a101ba4c ****/
		%feature("compactdefaultargs") IsImmediateModeOn;
		%feature("autodoc", "Returns true if presentation manager is accumulating transient list of presentations to be displayed in immediate mode.

Returns
-------
bool
") IsImmediateModeOn;
		Standard_Boolean IsImmediateModeOn();

		/****************** Presentation ******************/
		/**** md5 signature: 805551606ed14b1efc696c872a480231 ****/
		%feature("compactdefaultargs") Presentation;
		%feature("autodoc", "Returns the presentation presentation of the presentable object theprsobject in this framework. when thetocreate is true - automatically creates presentation for specified mode when not exist. optional argument theselobj specifies parent decomposed object to inherit its view affinity.

Parameters
----------
thePrsObject: PrsMgr_PresentableObject
theMode: int,optional
	default value is 0
theToCreate: bool,optional
	default value is Standard_False
theSelObj: PrsMgr_PresentableObject,optional
	default value is NULL

Returns
-------
opencascade::handle<PrsMgr_Presentation>
") Presentation;
		opencascade::handle<PrsMgr_Presentation> Presentation(const opencascade::handle<PrsMgr_PresentableObject> & thePrsObject, const Standard_Integer theMode = 0, const Standard_Boolean theToCreate = Standard_False, const opencascade::handle<PrsMgr_PresentableObject> & theSelObj = NULL);

		/****************** RedrawImmediate ******************/
		/**** md5 signature: e79e25af7466be6448448d7a6d5349eb ****/
		%feature("compactdefaultargs") RedrawImmediate;
		%feature("autodoc", "Clears and redisplays immediate structures of the viewer taking into account its affinity.

Parameters
----------
theViewer: V3d_Viewer

Returns
-------
None
") RedrawImmediate;
		void RedrawImmediate(const opencascade::handle<V3d_Viewer> & theViewer);

		/****************** SetDisplayPriority ******************/
		/**** md5 signature: fd1b8158e0bd7c369bc599803445088d ****/
		%feature("compactdefaultargs") SetDisplayPriority;
		%feature("autodoc", "Sets the display priority thenewprior of the presentable object theprsobject in this framework with the display mode themode.

Parameters
----------
thePrsObject: PrsMgr_PresentableObject
theMode: int
theNewPrior: int

Returns
-------
None
") SetDisplayPriority;
		void SetDisplayPriority(const opencascade::handle<PrsMgr_PresentableObject> & thePrsObject, const Standard_Integer theMode, const Standard_Integer theNewPrior);

		/****************** SetVisibility ******************/
		/**** md5 signature: d7287cc5906b7a3a48ea7b6451457b6e ****/
		%feature("compactdefaultargs") SetVisibility;
		%feature("autodoc", "Sets the visibility of presentable object.

Parameters
----------
thePrsObject: PrsMgr_PresentableObject
theMode: int
theValue: bool

Returns
-------
None
") SetVisibility;
		void SetVisibility(const opencascade::handle<PrsMgr_PresentableObject> & thePrsObject, const Standard_Integer theMode, const Standard_Boolean theValue);

		/****************** SetZLayer ******************/
		/**** md5 signature: 66d77fb3608e275461264dc059a62d6f ****/
		%feature("compactdefaultargs") SetZLayer;
		%feature("autodoc", "Set z layer id for all presentations of the object.

Parameters
----------
thePrsObject: PrsMgr_PresentableObject
theLayerId: int

Returns
-------
None
") SetZLayer;
		void SetZLayer(const opencascade::handle<PrsMgr_PresentableObject> & thePrsObject, int theLayerId);

		/****************** StructureManager ******************/
		/**** md5 signature: 5843678469524fb10153c08d2adb183d ****/
		%feature("compactdefaultargs") StructureManager;
		%feature("autodoc", "Returns the structure manager.

Returns
-------
opencascade::handle<Graphic3d_StructureManager>
") StructureManager;
		const opencascade::handle<Graphic3d_StructureManager> & StructureManager();

		/****************** Transform ******************/
		/**** md5 signature: 3a7237b7f354860ed7b45ff24bc96d24 ****/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "Sets the transformation thetransformation for the presentable object theprsobject. theprsobject has the display mode themode; this has the default value of 0, that is, the wireframe display mode.

Parameters
----------
thePrsObject: PrsMgr_PresentableObject
theTransformation: Geom_Transformation
theMode: int,optional
	default value is 0

Returns
-------
None
") Transform;
		void Transform(const opencascade::handle<PrsMgr_PresentableObject> & thePrsObject, const opencascade::handle<Geom_Transformation> & theTransformation, const Standard_Integer theMode = 0);

		/****************** Unhighlight ******************/
		/**** md5 signature: 1db3626dfa4fdeb3c345157ebf7f6ad8 ****/
		%feature("compactdefaultargs") Unhighlight;
		%feature("autodoc", "Removes highlighting from the presentation of the presentable object.

Parameters
----------
thePrsObject: PrsMgr_PresentableObject

Returns
-------
None
") Unhighlight;
		void Unhighlight(const opencascade::handle<PrsMgr_PresentableObject> & thePrsObject);

		/****************** Unhighlight ******************/
		/**** md5 signature: 1a2e1121e9c12589e75a718f291cd4b8 ****/
		%feature("compactdefaultargs") Unhighlight;
		%feature("autodoc", "No available documentation.

Parameters
----------
thePrsObject: PrsMgr_PresentableObject
theMode: int

Returns
-------
None
") Unhighlight;
		void Unhighlight(const opencascade::handle<PrsMgr_PresentableObject> & thePrsObject, const Standard_Integer theMode);

		/****************** Update ******************/
		/**** md5 signature: 6f121173a28205c89b330155df4d893b ****/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "Updates the presentation of the presentable object theprsobject in this framework with the display mode themode.

Parameters
----------
thePrsObject: PrsMgr_PresentableObject
theMode: int,optional
	default value is 0

Returns
-------
None
") Update;
		void Update(const opencascade::handle<PrsMgr_PresentableObject> & thePrsObject, const Standard_Integer theMode = 0);

		/****************** UpdateHighlightTrsf ******************/
		/**** md5 signature: 09522853572cb982dd4592da49b4d268 ****/
		%feature("compactdefaultargs") UpdateHighlightTrsf;
		%feature("autodoc", "Allows to apply location transformation to shadow highlight presentation immediately. @param theobj defines the base object, it local transformation will be applied to corresponding highlight structure @param themode defines display mode of the base object @param theselobj defines the object produced after decomposition of the base object for local selection.

Parameters
----------
theViewer: V3d_Viewer
theObj: PrsMgr_PresentableObject
theMode: int,optional
	default value is 0
theSelObj: PrsMgr_PresentableObject,optional
	default value is NULL

Returns
-------
None
") UpdateHighlightTrsf;
		void UpdateHighlightTrsf(const opencascade::handle<V3d_Viewer> & theViewer, const opencascade::handle<PrsMgr_PresentableObject> & theObj, const Standard_Integer theMode = 0, const opencascade::handle<PrsMgr_PresentableObject> & theSelObj = NULL);

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
