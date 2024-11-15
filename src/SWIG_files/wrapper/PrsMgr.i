/*
Copyright 2008-2024 Thomas Paviot (tpaviot@gmail.com)

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
https://dev.opencascade.org/doc/occt-7.8.0/refman/html/package_prsmgr.html"
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
%include ../common/EnumTemplates.i
%include ../common/Operators.i
%include ../common/OccHandle.i
%include ../common/IOStream.i
%include ../common/ArrayMacros.i


%{
#include<PrsMgr_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<Prs3d_module.hxx>
#include<Graphic3d_module.hxx>
#include<Bnd_module.hxx>
#include<Quantity_module.hxx>
#include<TopLoc_module.hxx>
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
#include<BRep_module.hxx>
#include<Geom2d_module.hxx>
#include<StdPrs_module.hxx>
#include<GeomAdaptor_module.hxx>
#include<Adaptor2d_module.hxx>
#include<BRepAdaptor_module.hxx>
#include<Adaptor3d_module.hxx>
#include<StdSelect_module.hxx>
#include<Geom_module.hxx>
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
%import TopLoc.i
%import Aspect.i
%import gp.i
%import TColStd.i
%import V3d.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
enum PrsMgr_DisplayStatus {
	PrsMgr_DisplayStatus_Displayed = 0,
	PrsMgr_DisplayStatus_Erased = 1,
	PrsMgr_DisplayStatus_None = 2,
	AIS_DS_Displayed = PrsMgr_DisplayStatus_Displayed,
	AIS_DS_Erased = PrsMgr_DisplayStatus_Erased,
	AIS_DS_None = PrsMgr_DisplayStatus_None,
};

enum PrsMgr_TypeOfPresentation3d {
	PrsMgr_TOP_AllView = 0,
	PrsMgr_TOP_ProjectorDependent = 1,
};

/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {

class PrsMgr_DisplayStatus(IntEnum):
	PrsMgr_DisplayStatus_Displayed = 0
	PrsMgr_DisplayStatus_Erased = 1
	PrsMgr_DisplayStatus_None = 2
	AIS_DS_Displayed = PrsMgr_DisplayStatus_Displayed
	AIS_DS_Erased = PrsMgr_DisplayStatus_Erased
	AIS_DS_None = PrsMgr_DisplayStatus_None
PrsMgr_DisplayStatus_Displayed = PrsMgr_DisplayStatus.PrsMgr_DisplayStatus_Displayed
PrsMgr_DisplayStatus_Erased = PrsMgr_DisplayStatus.PrsMgr_DisplayStatus_Erased
PrsMgr_DisplayStatus_None = PrsMgr_DisplayStatus.PrsMgr_DisplayStatus_None
AIS_DS_Displayed = PrsMgr_DisplayStatus.AIS_DS_Displayed
AIS_DS_Erased = PrsMgr_DisplayStatus.AIS_DS_Erased
AIS_DS_None = PrsMgr_DisplayStatus.AIS_DS_None

class PrsMgr_TypeOfPresentation3d(IntEnum):
	PrsMgr_TOP_AllView = 0
	PrsMgr_TOP_ProjectorDependent = 1
PrsMgr_TOP_AllView = PrsMgr_TypeOfPresentation3d.PrsMgr_TOP_AllView
PrsMgr_TOP_ProjectorDependent = PrsMgr_TypeOfPresentation3d.PrsMgr_TOP_ProjectorDependent
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
		/****** PrsMgr_PresentableObject::AcceptDisplayMode ******/
		/****** md5 signature: bae56e2dc4711c229fb1bab9ec65258f ******/
		%feature("compactdefaultargs") AcceptDisplayMode;
		%feature("autodoc", "
Parameters
----------
theMode: int

Return
-------
bool

Description
-----------
Returns true if the class of objects accepts specified display mode index. the interactive context can have a default mode of representation for the set of interactive objects. this mode may not be accepted by a given class of objects. consequently, this virtual method allowing us to get information about the class in question must be implemented. at least one display mode index should be accepted by this method. although subclass can leave default implementation, it is highly desired defining exact list of supported modes instead, which is usually an enumeration for one object or objects class sharing similar list of display modes.
") AcceptDisplayMode;
		virtual Standard_Boolean AcceptDisplayMode(const Standard_Integer theMode);

		/****** PrsMgr_PresentableObject::AddChild ******/
		/****** md5 signature: 4cb35725e5658154615dcc48d8d5941f ******/
		%feature("compactdefaultargs") AddChild;
		%feature("autodoc", "
Parameters
----------
theObject: PrsMgr_PresentableObject

Return
-------
None

Description
-----------
Makes theobject child of current object in scene hierarchy.
") AddChild;
		virtual void AddChild(const opencascade::handle<PrsMgr_PresentableObject> & theObject);

		/****** PrsMgr_PresentableObject::AddChildWithCurrentTransformation ******/
		/****** md5 signature: cb9904f6ff36138b2d71932f0ce71caa ******/
		%feature("compactdefaultargs") AddChildWithCurrentTransformation;
		%feature("autodoc", "
Parameters
----------
theObject: PrsMgr_PresentableObject

Return
-------
None

Description
-----------
Makes theobject child of current object in scene hierarchy with keeping the current global transformation so the object keeps the same position/orientation in the global cs.
") AddChildWithCurrentTransformation;
		void AddChildWithCurrentTransformation(const opencascade::handle<PrsMgr_PresentableObject> & theObject);

		/****** PrsMgr_PresentableObject::AddClipPlane ******/
		/****** md5 signature: 9f3c54e7cba60e479ad5b0eee5e5228c ******/
		%feature("compactdefaultargs") AddClipPlane;
		%feature("autodoc", "
Parameters
----------
thePlane: Graphic3d_ClipPlane

Return
-------
None

Description
-----------
Adds clip plane for graphical clipping for all display mode presentations. the composition of clip planes truncates the rendering space to convex volume. please be aware that number of supported clip plane is limited. the planes which exceed the limit are ignored. besides of this, some planes can be already set in view where the object is shown: the number of these planes should be subtracted from limit to predict the maximum possible number of object clipping planes. @param theplane [in] the clip plane to be appended to map of clip planes.
") AddClipPlane;
		virtual void AddClipPlane(const opencascade::handle<Graphic3d_ClipPlane> & thePlane);

		/****** PrsMgr_PresentableObject::Attributes ******/
		/****** md5 signature: 7c024beac873893f3a088f538b4ad41a ******/
		%feature("compactdefaultargs") Attributes;
		%feature("autodoc", "Return
-------
opencascade::handle<Prs3d_Drawer>

Description
-----------
Returns the attributes settings.
") Attributes;
		const opencascade::handle<Prs3d_Drawer> & Attributes();

		/****** PrsMgr_PresentableObject::BoundingBox ******/
		/****** md5 signature: f7a866b86bc0fe3fc689336999e511a6 ******/
		%feature("compactdefaultargs") BoundingBox;
		%feature("autodoc", "
Parameters
----------
theBndBox: Bnd_Box

Return
-------
None

Description
-----------
Returns bounding box of object correspondingly to its current display mode. this method requires presentation to be already computed, since it relies on bounding box of presentation structures, which are supposed to be same/close amongst different display modes of this object.
") BoundingBox;
		virtual void BoundingBox(Bnd_Box & theBndBox);

		/****** PrsMgr_PresentableObject::Children ******/
		/****** md5 signature: 8473f800c00ae7231d0d682a7669ae77 ******/
		%feature("compactdefaultargs") Children;
		%feature("autodoc", "Return
-------
PrsMgr_ListOfPresentableObjects

Description
-----------
Returns children of the current object.
") Children;
		const PrsMgr_ListOfPresentableObjects & Children();

		/****** PrsMgr_PresentableObject::ClipPlanes ******/
		/****** md5 signature: 26ab80085e76b6f03b64af6598080486 ******/
		%feature("compactdefaultargs") ClipPlanes;
		%feature("autodoc", "Return
-------
opencascade::handle<Graphic3d_SequenceOfHClipPlane>

Description
-----------
Get clip planes. return set of previously added clip planes for all display mode presentations.
") ClipPlanes;
		const opencascade::handle<Graphic3d_SequenceOfHClipPlane> & ClipPlanes();

		/****** PrsMgr_PresentableObject::Color ******/
		/****** md5 signature: 3ec4d5526906be02304bac49a777209c ******/
		%feature("compactdefaultargs") Color;
		%feature("autodoc", "
Parameters
----------
theColor: Quantity_Color

Return
-------
None

Description
-----------
Returns the color setting of the interactive object.
") Color;
		virtual void Color(Quantity_Color & theColor);

		/****** PrsMgr_PresentableObject::CombinedParentTransformation ******/
		/****** md5 signature: 428511825096b7aaf0fc92a9e55ba4b0 ******/
		%feature("compactdefaultargs") CombinedParentTransformation;
		%feature("autodoc", "Return
-------
opencascade::handle<TopLoc_Datum3D>

Description
-----------
Return combined parent transformation.
") CombinedParentTransformation;
		const opencascade::handle<TopLoc_Datum3D> & CombinedParentTransformation();

		/****** PrsMgr_PresentableObject::CurrentFacingModel ******/
		/****** md5 signature: e7b4247f51b5a9a82f059bec0d9c66fa ******/
		%feature("compactdefaultargs") CurrentFacingModel;
		%feature("autodoc", "Return
-------
Aspect_TypeOfFacingModel

Description
-----------
Returns the current facing model which is in effect.
") CurrentFacingModel;
		Aspect_TypeOfFacingModel CurrentFacingModel();

		/****** PrsMgr_PresentableObject::DefaultDisplayMode ******/
		/****** md5 signature: fda620e5a7d8c732cdacefa5f4f17373 ******/
		%feature("compactdefaultargs") DefaultDisplayMode;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the default display mode.
") DefaultDisplayMode;
		virtual Standard_Integer DefaultDisplayMode();

		/****** PrsMgr_PresentableObject::DisplayMode ******/
		/****** md5 signature: 87ab8eae5ccb1d4f4dfd02dc34d6febc ******/
		%feature("compactdefaultargs") DisplayMode;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the display mode setting of the interactive object. the range of supported display mode indexes should be specified within object definition and filtered by accepdisplaymode(). @sa acceptdisplaymode().
") DisplayMode;
		Standard_Integer DisplayMode();

		/****** PrsMgr_PresentableObject::DisplayStatus ******/
		/****** md5 signature: ee3d5b78bf379a82087b86d8b5b0b3e3 ******/
		%feature("compactdefaultargs") DisplayStatus;
		%feature("autodoc", "Return
-------
PrsMgr_DisplayStatus

Description
-----------
Return presentation display status; prsmgr_displaystatus_none by default.
") DisplayStatus;
		PrsMgr_DisplayStatus DisplayStatus();


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** PrsMgr_PresentableObject::DynamicHilightAttributes ******/
		/****** md5 signature: 9c44b3555020951e689ea9d2e141bc3d ******/
		%feature("compactdefaultargs") DynamicHilightAttributes;
		%feature("autodoc", "Return
-------
opencascade::handle<Prs3d_Drawer>

Description
-----------
Returns the hilight attributes settings. when not null, overrides both prs3d_typeofhighlight_localdynamic and prs3d_typeofhighlight_dynamic defined within ais_interactivecontext::highlightstyle(). @sa ais_interactivecontext::highlightstyle().
") DynamicHilightAttributes;
		const opencascade::handle<Prs3d_Drawer> & DynamicHilightAttributes();

		/****** PrsMgr_PresentableObject::HasColor ******/
		/****** md5 signature: f14084fe0c7674324d105b06cc1ff5b4 ******/
		%feature("compactdefaultargs") HasColor;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the interactive object has color.
") HasColor;
		Standard_Boolean HasColor();

		/****** PrsMgr_PresentableObject::HasDisplayMode ******/
		/****** md5 signature: dd0b9b505cadfeaf92483f8d0b8ffd59 ******/
		%feature("compactdefaultargs") HasDisplayMode;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the interactive object has display mode setting overriding global setting (within interactive context).
") HasDisplayMode;
		Standard_Boolean HasDisplayMode();

		/****** PrsMgr_PresentableObject::HasHilightMode ******/
		/****** md5 signature: 35c4cc36b9d1287cbb8be9209c167aef ******/
		%feature("compactdefaultargs") HasHilightMode;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the interactive object is in highlight mode. @sa hilightattributes().
") HasHilightMode;
		Standard_Boolean HasHilightMode();

		/****** PrsMgr_PresentableObject::HasMaterial ******/
		/****** md5 signature: 8bde772f946375b9fcc789f278ec2796 ******/
		%feature("compactdefaultargs") HasMaterial;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the interactive object has a setting for material.
") HasMaterial;
		Standard_Boolean HasMaterial();

		/****** PrsMgr_PresentableObject::HasOwnPresentations ******/
		/****** md5 signature: 153f02083dc2acb34db1dabac2b5fd90 ******/
		%feature("compactdefaultargs") HasOwnPresentations;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if object should have own presentations.
") HasOwnPresentations;
		Standard_Boolean HasOwnPresentations();

		/****** PrsMgr_PresentableObject::HasPolygonOffsets ******/
		/****** md5 signature: 046170f7f77257e0750c28d56cd76064 ******/
		%feature("compactdefaultargs") HasPolygonOffsets;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns standard_true if <mydrawer> has non-null shading aspect.
") HasPolygonOffsets;
		virtual Standard_Boolean HasPolygonOffsets();

		/****** PrsMgr_PresentableObject::HasTransformation ******/
		/****** md5 signature: 652edcbacf21dcccd9a135f2682c5344 ******/
		%feature("compactdefaultargs") HasTransformation;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if object has a transformation that is different from the identity.
") HasTransformation;
		Standard_Boolean HasTransformation();

		/****** PrsMgr_PresentableObject::HasWidth ******/
		/****** md5 signature: 93af72110529b1e94c6797d09cd35e15 ******/
		%feature("compactdefaultargs") HasWidth;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the interactive object has width.
") HasWidth;
		Standard_Boolean HasWidth();

		/****** PrsMgr_PresentableObject::HilightAttributes ******/
		/****** md5 signature: 028c3cfd528f1150f36206e2e1fd24ab ******/
		%feature("compactdefaultargs") HilightAttributes;
		%feature("autodoc", "Return
-------
opencascade::handle<Prs3d_Drawer>

Description
-----------
Returns the hilight attributes settings. when not null, overrides both prs3d_typeofhighlight_localselected and prs3d_typeofhighlight_selected defined within ais_interactivecontext::highlightstyle(). @sa ais_interactivecontext::highlightstyle().
") HilightAttributes;
		const opencascade::handle<Prs3d_Drawer> & HilightAttributes();

		/****** PrsMgr_PresentableObject::HilightMode ******/
		/****** md5 signature: 65e4b0407fae3cd6d737aa6b7e74bfa0 ******/
		%feature("compactdefaultargs") HilightMode;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns highlight display mode. this is obsolete method for backward compatibility - use ::hilightattributes() and ::dynamichilightattributes() instead. @sa hilightattributes().
") HilightMode;
		Standard_Integer HilightMode();

		/****** PrsMgr_PresentableObject::InversedTransformation ******/
		/****** md5 signature: aefc1fc4bc8fc1a359fecf8390084420 ******/
		%feature("compactdefaultargs") InversedTransformation;
		%feature("autodoc", "Return
-------
gp_GTrsf

Description
-----------
Return inversed transformation.
") InversedTransformation;
		const gp_GTrsf InversedTransformation();

		/****** PrsMgr_PresentableObject::IsInfinite ******/
		/****** md5 signature: 7633661c322c89b950f649430bd827bf ******/
		%feature("compactdefaultargs") IsInfinite;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the interactive object is infinite; false by default. this flag affects various operations operating on bounding box of graphic presentations of this object. for instance, infinite objects are not taken in account for view fitall. this does not necessarily means that object is actually infinite, auxiliary objects might be also marked with this flag to achieve desired behavior.
") IsInfinite;
		Standard_Boolean IsInfinite();

		/****** PrsMgr_PresentableObject::IsMutable ******/
		/****** md5 signature: 3ee3916ef3d39d63be5557b524ac1b86 ******/
		%feature("compactdefaultargs") IsMutable;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if object has mutable nature (content or location are be changed regularly). mutable object will be managed in different way than static onces (another optimizations).
") IsMutable;
		Standard_Boolean IsMutable();

		/****** PrsMgr_PresentableObject::IsTransparent ******/
		/****** md5 signature: c84deafd18700322a7b65678305c4b28 ******/
		%feature("compactdefaultargs") IsTransparent;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if there is a transparency setting.
") IsTransparent;
		Standard_Boolean IsTransparent();

		/****** PrsMgr_PresentableObject::LocalTransformation ******/
		/****** md5 signature: d727e7863f78900c68e430ca7d96d70c ******/
		%feature("compactdefaultargs") LocalTransformation;
		%feature("autodoc", "Return
-------
gp_Trsf

Description
-----------
Return the local transformation. note that the local transformation of the object having transformation persistence is applied within local coordinate system defined by this persistence.
") LocalTransformation;
		const gp_Trsf LocalTransformation();

		/****** PrsMgr_PresentableObject::LocalTransformationGeom ******/
		/****** md5 signature: f5b190921945e48b58f986d6ce8cec5c ******/
		%feature("compactdefaultargs") LocalTransformationGeom;
		%feature("autodoc", "Return
-------
opencascade::handle<TopLoc_Datum3D>

Description
-----------
Return the local transformation. note that the local transformation of the object having transformation persistence is applied within local coordinate system defined by this persistence.
") LocalTransformationGeom;
		const opencascade::handle<TopLoc_Datum3D> & LocalTransformationGeom();

		/****** PrsMgr_PresentableObject::Material ******/
		/****** md5 signature: 016c712e17370767713256cdb90adb24 ******/
		%feature("compactdefaultargs") Material;
		%feature("autodoc", "Return
-------
Graphic3d_NameOfMaterial

Description
-----------
Returns the current material setting as enumeration value.
") Material;
		virtual Graphic3d_NameOfMaterial Material();

		/****** PrsMgr_PresentableObject::Parent ******/
		/****** md5 signature: b281c508616907c678ce34cfa2fc8478 ******/
		%feature("compactdefaultargs") Parent;
		%feature("autodoc", "Return
-------
PrsMgr_PresentableObject *

Description
-----------
Returns parent of current object in scene hierarchy.
") Parent;
		PrsMgr_PresentableObject * Parent();

		/****** PrsMgr_PresentableObject::PolygonOffsets ******/
		/****** md5 signature: 7abd14e2a1f6ce136288eb910f29a042 ******/
		%feature("compactdefaultargs") PolygonOffsets;
		%feature("autodoc", "
Parameters
----------

Return
-------
aMode: int
aFactor: float
aUnits: float

Description
-----------
Retrieves current polygon offsets settings from <mydrawer>.
") PolygonOffsets;
		virtual void PolygonOffsets(Standard_Integer &OutValue, Standard_ShortReal &OutValue, Standard_ShortReal &OutValue);

		/****** PrsMgr_PresentableObject::Presentations ******/
		/****** md5 signature: 20fe67fbbae7e29f768f3449d76ed496 ******/
		%feature("compactdefaultargs") Presentations;
		%feature("autodoc", "Return
-------
PrsMgr_Presentations

Description
-----------
Return presentations.
") Presentations;
		PrsMgr_Presentations & Presentations();

		/****** PrsMgr_PresentableObject::RemoveChild ******/
		/****** md5 signature: e02c6f54c604ff7afdb06fab9281f205 ******/
		%feature("compactdefaultargs") RemoveChild;
		%feature("autodoc", "
Parameters
----------
theObject: PrsMgr_PresentableObject

Return
-------
None

Description
-----------
Removes theobject from children of current object in scene hierarchy.
") RemoveChild;
		virtual void RemoveChild(const opencascade::handle<PrsMgr_PresentableObject> & theObject);

		/****** PrsMgr_PresentableObject::RemoveChildWithRestoreTransformation ******/
		/****** md5 signature: 4e196c472e579f89becf833b09af5927 ******/
		%feature("compactdefaultargs") RemoveChildWithRestoreTransformation;
		%feature("autodoc", "
Parameters
----------
theObject: PrsMgr_PresentableObject

Return
-------
None

Description
-----------
Removes theobject from children of current object in scene hierarchy with keeping the current global transformation. so the object keeps the same position/orientation in the global cs.
") RemoveChildWithRestoreTransformation;
		void RemoveChildWithRestoreTransformation(const opencascade::handle<PrsMgr_PresentableObject> & theObject);

		/****** PrsMgr_PresentableObject::RemoveClipPlane ******/
		/****** md5 signature: e644cc8dadfbe38b4691bed6b83a05f2 ******/
		%feature("compactdefaultargs") RemoveClipPlane;
		%feature("autodoc", "
Parameters
----------
thePlane: Graphic3d_ClipPlane

Return
-------
None

Description
-----------
Removes previously added clip plane. @param theplane [in] the clip plane to be removed from map of clip planes.
") RemoveClipPlane;
		virtual void RemoveClipPlane(const opencascade::handle<Graphic3d_ClipPlane> & thePlane);

		/****** PrsMgr_PresentableObject::ResetTransformation ******/
		/****** md5 signature: 282062bec499f4def850136648ca2e3b ******/
		%feature("compactdefaultargs") ResetTransformation;
		%feature("autodoc", "Return
-------
None

Description
-----------
Resets local transformation to identity.
") ResetTransformation;
		virtual void ResetTransformation();

		/****** PrsMgr_PresentableObject::SetAttributes ******/
		/****** md5 signature: 83e0618a8a813c8b2d6cb1cd465e638c ******/
		%feature("compactdefaultargs") SetAttributes;
		%feature("autodoc", "
Parameters
----------
theDrawer: Prs3d_Drawer

Return
-------
None

Description
-----------
Initializes the drawing tool thedrawer.
") SetAttributes;
		virtual void SetAttributes(const opencascade::handle<Prs3d_Drawer> & theDrawer);

		/****** PrsMgr_PresentableObject::SetClipPlanes ******/
		/****** md5 signature: bcb099bc809502c68eb709ec47187e6c ******/
		%feature("compactdefaultargs") SetClipPlanes;
		%feature("autodoc", "
Parameters
----------
thePlanes: Graphic3d_SequenceOfHClipPlane

Return
-------
None

Description
-----------
Set clip planes for graphical clipping for all display mode presentations. the composition of clip planes truncates the rendering space to convex volume. please be aware that number of supported clip plane is limited. the planes which exceed the limit are ignored. besides of this, some planes can be already set in view where the object is shown: the number of these planes should be subtracted from limit to predict the maximum possible number of object clipping planes.
") SetClipPlanes;
		virtual void SetClipPlanes(const opencascade::handle<Graphic3d_SequenceOfHClipPlane> & thePlanes);

		/****** PrsMgr_PresentableObject::SetColor ******/
		/****** md5 signature: 00f0a4e343c1e144a6992078bccbe32c ******/
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "
Parameters
----------
theColor: Quantity_Color

Return
-------
None

Description
-----------
Only the interactive object knowns which drawer attribute is affected by the color, if any (ex: for a wire,it's the wireaspect field of the drawer, but for a vertex, only the point aspect field is affected by the color). warning: do not forget to set the corresponding fields here (hasowncolor and mydrawer->setcolor()).
") SetColor;
		virtual void SetColor(const Quantity_Color & theColor);

		/****** PrsMgr_PresentableObject::SetCurrentFacingModel ******/
		/****** md5 signature: 342c87e4f6a273a2df4924281da37e91 ******/
		%feature("compactdefaultargs") SetCurrentFacingModel;
		%feature("autodoc", "
Parameters
----------
theModel: Aspect_TypeOfFacingModel (optional, default to Aspect_TOFM_BOTH_SIDE)

Return
-------
None

Description
-----------
Change the current facing model apply on polygons for setcolor(), settransparency(), setmaterial() methods default facing model is aspect_tofm_two_side. this mean that attributes is applying both on the front and back face.
") SetCurrentFacingModel;
		void SetCurrentFacingModel(const Aspect_TypeOfFacingModel theModel = Aspect_TOFM_BOTH_SIDE);

		/****** PrsMgr_PresentableObject::SetDisplayMode ******/
		/****** md5 signature: 2a99a6840fca4af1fbc5cc91ac2d554d ******/
		%feature("compactdefaultargs") SetDisplayMode;
		%feature("autodoc", "
Parameters
----------
theMode: int

Return
-------
None

Description
-----------
Sets the display mode for the interactive object. an object can have its own temporary display mode, which is different from that proposed by the interactive context. @sa acceptdisplaymode().
") SetDisplayMode;
		void SetDisplayMode(const Standard_Integer theMode);

		/****** PrsMgr_PresentableObject::SetDynamicHilightAttributes ******/
		/****** md5 signature: ca58806abff4ac2f5e9c97a9fcb85be9 ******/
		%feature("compactdefaultargs") SetDynamicHilightAttributes;
		%feature("autodoc", "
Parameters
----------
theDrawer: Prs3d_Drawer

Return
-------
None

Description
-----------
Initializes the dynamic hilight drawing tool.
") SetDynamicHilightAttributes;
		virtual void SetDynamicHilightAttributes(const opencascade::handle<Prs3d_Drawer> & theDrawer);

		/****** PrsMgr_PresentableObject::SetHilightAttributes ******/
		/****** md5 signature: 582bdaffacaeebcf9a6901419be3e359 ******/
		%feature("compactdefaultargs") SetHilightAttributes;
		%feature("autodoc", "
Parameters
----------
theDrawer: Prs3d_Drawer

Return
-------
None

Description
-----------
Initializes the hilight drawing tool thedrawer.
") SetHilightAttributes;
		virtual void SetHilightAttributes(const opencascade::handle<Prs3d_Drawer> & theDrawer);

		/****** PrsMgr_PresentableObject::SetHilightMode ******/
		/****** md5 signature: 0fd85a8f52dd5fb591746b6a5ceb9590 ******/
		%feature("compactdefaultargs") SetHilightMode;
		%feature("autodoc", "
Parameters
----------
theMode: int

Return
-------
None

Description
-----------
Sets highlight display mode. this is obsolete method for backward compatibility - use ::hilightattributes() and ::dynamichilightattributes() instead. @sa hilightattributes().
") SetHilightMode;
		void SetHilightMode(const Standard_Integer theMode);

		/****** PrsMgr_PresentableObject::SetInfiniteState ******/
		/****** md5 signature: be53a3ebba916ae90a429c5093c38737 ******/
		%feature("compactdefaultargs") SetInfiniteState;
		%feature("autodoc", "
Parameters
----------
theFlag: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Sets if object should be considered as infinite.
") SetInfiniteState;
		void SetInfiniteState(const Standard_Boolean theFlag = Standard_True);

		/****** PrsMgr_PresentableObject::SetIsoOnTriangulation ******/
		/****** md5 signature: ce0a77a4be58bef84b86bf0f2501ffef ******/
		%feature("compactdefaultargs") SetIsoOnTriangulation;
		%feature("autodoc", "
Parameters
----------
theIsEnabled: bool

Return
-------
None

Description
-----------
Enables or disables on-triangulation build of isolines according to the flag given.
") SetIsoOnTriangulation;
		void SetIsoOnTriangulation(const Standard_Boolean theIsEnabled);

		/****** PrsMgr_PresentableObject::SetLocalTransformation ******/
		/****** md5 signature: df3591aee60d963520e1b86ed93fcb47 ******/
		%feature("compactdefaultargs") SetLocalTransformation;
		%feature("autodoc", "
Parameters
----------
theTrsf: gp_Trsf

Return
-------
None

Description
-----------
Sets local transformation to thetransformation. note that the local transformation of the object having transformation persistence is applied within local coordinate system defined by this persistence.
") SetLocalTransformation;
		void SetLocalTransformation(const gp_Trsf & theTrsf);

		/****** PrsMgr_PresentableObject::SetLocalTransformation ******/
		/****** md5 signature: 2a3805a018e02e598cdf198a3ac716e8 ******/
		%feature("compactdefaultargs") SetLocalTransformation;
		%feature("autodoc", "
Parameters
----------
theTrsf: TopLoc_Datum3D

Return
-------
None

Description
-----------
Sets local transformation to thetransformation. note that the local transformation of the object having transformation persistence is applied within local coordinate system defined by this persistence.
") SetLocalTransformation;
		void SetLocalTransformation(const opencascade::handle<TopLoc_Datum3D> & theTrsf);

		/****** PrsMgr_PresentableObject::SetMaterial ******/
		/****** md5 signature: 92a522cdb58df60ff50ddd69027d631f ******/
		%feature("compactdefaultargs") SetMaterial;
		%feature("autodoc", "
Parameters
----------
aName: Graphic3d_MaterialAspect

Return
-------
None

Description
-----------
Sets the material amat defining this display attribute for the interactive object. material aspect determines shading aspect, color and transparency of visible entities.
") SetMaterial;
		virtual void SetMaterial(const Graphic3d_MaterialAspect & aName);

		/****** PrsMgr_PresentableObject::SetMutable ******/
		/****** md5 signature: 5fa59925e1868e4db8b5115d09b9eea4 ******/
		%feature("compactdefaultargs") SetMutable;
		%feature("autodoc", "
Parameters
----------
theIsMutable: bool

Return
-------
None

Description
-----------
Sets if the object has mutable nature (content or location will be changed regularly). this method should be called before object displaying to take effect.
") SetMutable;
		virtual void SetMutable(const Standard_Boolean theIsMutable);

		/****** PrsMgr_PresentableObject::SetPolygonOffsets ******/
		/****** md5 signature: bcb2cc6b36e7f5da584a89ed6e331ba7 ******/
		%feature("compactdefaultargs") SetPolygonOffsets;
		%feature("autodoc", "
Parameters
----------
aMode: int
aFactor: float (optional, default to 1.0)
aUnits: float (optional, default to 0.0)

Return
-------
None

Description
-----------
Sets up polygon offsets for this object. @sa graphic3d_aspects::setpolygonoffsets().
") SetPolygonOffsets;
		virtual void SetPolygonOffsets(const Standard_Integer aMode, const Standard_ShortReal aFactor = 1.0, const Standard_ShortReal aUnits = 0.0);

		/****** PrsMgr_PresentableObject::SetPropagateVisualState ******/
		/****** md5 signature: d71a048de66c3e35f2dc099b481bcded ******/
		%feature("compactdefaultargs") SetPropagateVisualState;
		%feature("autodoc", "
Parameters
----------
theFlag: bool

Return
-------
None

Description
-----------
Change the value of the flag 'propagate visual state'.
") SetPropagateVisualState;
		void SetPropagateVisualState(const Standard_Boolean theFlag);

		/****** PrsMgr_PresentableObject::SetToUpdate ******/
		/****** md5 signature: 4e115245e20e62a5fea5d45758049758 ******/
		%feature("compactdefaultargs") SetToUpdate;
		%feature("autodoc", "
Parameters
----------
theMode: int

Return
-------
None

Description
-----------
Flags presentation to be updated; updatepresentations() will recompute these presentations. @param themode presentation (display mode) to invalidate, or -1 to invalidate them all.
") SetToUpdate;
		void SetToUpdate(Standard_Integer theMode);

		/****** PrsMgr_PresentableObject::SetToUpdate ******/
		/****** md5 signature: 4a65af550d5ec39b45b7761dfdbbd7c3 ******/
		%feature("compactdefaultargs") SetToUpdate;
		%feature("autodoc", "Return
-------
None

Description
-----------
Flags all the presentations to be updated.
") SetToUpdate;
		void SetToUpdate();

		/****** PrsMgr_PresentableObject::SetTransformPersistence ******/
		/****** md5 signature: 9823ebeffde5eb16b0c205a862e3b2c2 ******/
		%feature("compactdefaultargs") SetTransformPersistence;
		%feature("autodoc", "
Parameters
----------
theTrsfPers: Graphic3d_TransformPers

Return
-------
None

Description
-----------
Sets up transform persistence defining a special local coordinate system where this object should be located. note that management of transform persistence object is more expensive than of the normal one, because it requires its position being recomputed basing on camera position within each draw call / traverse. @sa graphic3d_transformpers class description.
") SetTransformPersistence;
		virtual void SetTransformPersistence(const opencascade::handle<Graphic3d_TransformPers> & theTrsfPers);

		/****** PrsMgr_PresentableObject::SetTransparency ******/
		/****** md5 signature: 6904036a7c429832a3fcf1769aa51bbc ******/
		%feature("compactdefaultargs") SetTransparency;
		%feature("autodoc", "
Parameters
----------
aValue: float (optional, default to 0.6)

Return
-------
None

Description
-----------
Attributes a setting avalue for transparency. the transparency value should be between 0.0 and 1.0. at 0.0 an object will be totally opaque, and at 1.0, fully transparent. warning at a value of 1.0, there may be nothing visible.
") SetTransparency;
		virtual void SetTransparency(const Standard_Real aValue = 0.6);

		/****** PrsMgr_PresentableObject::SetTypeOfPresentation ******/
		/****** md5 signature: 8d261802c28692e13d983f3822259436 ******/
		%feature("compactdefaultargs") SetTypeOfPresentation;
		%feature("autodoc", "
Parameters
----------
theType: PrsMgr_TypeOfPresentation3d

Return
-------
None

Description
-----------
Set type of presentation.
") SetTypeOfPresentation;
		void SetTypeOfPresentation(const PrsMgr_TypeOfPresentation3d theType);

		/****** PrsMgr_PresentableObject::SetWidth ******/
		/****** md5 signature: 11debc629042f252811dd0b5a3de5b4a ******/
		%feature("compactdefaultargs") SetWidth;
		%feature("autodoc", "
Parameters
----------
theWidth: float

Return
-------
None

Description
-----------
Allows you to provide the setting avalue for width. only the interactive object knows which drawer attribute is affected by the width setting.
") SetWidth;
		virtual void SetWidth(const Standard_Real theWidth);

		/****** PrsMgr_PresentableObject::SetZLayer ******/
		/****** md5 signature: 7f7b7652c4d748d54d9fe58f5f98330a ******/
		%feature("compactdefaultargs") SetZLayer;
		%feature("autodoc", "
Parameters
----------
theLayerId: int

Return
-------
None

Description
-----------
Set z layer id and update all presentations of the presentable object. the layers mechanism allows drawing objects in higher layers in overlay of objects in lower layers.
") SetZLayer;
		virtual void SetZLayer(int theLayerId);

		/****** PrsMgr_PresentableObject::SynchronizeAspects ******/
		/****** md5 signature: 69ddcd4778627d05f3cdbe0b7273911f ******/
		%feature("compactdefaultargs") SynchronizeAspects;
		%feature("autodoc", "Return
-------
None

Description
-----------
Synchronize presentation aspects after their modification. //! this method should be called after modifying primitive aspect properties (material, texture, shader) so that modifications will take effect on already computed presentation groups (thus avoiding re-displaying the object).
") SynchronizeAspects;
		void SynchronizeAspects();

		/****** PrsMgr_PresentableObject::ToBeUpdated ******/
		/****** md5 signature: f2e41689909e2a27ddd3f475e35f02c5 ******/
		%feature("compactdefaultargs") ToBeUpdated;
		%feature("autodoc", "
Parameters
----------
theToIncludeHidden: bool (optional, default to Standard_False)

Return
-------
bool

Description
-----------
Returns true if any active presentation has invalidation flag. @param thetoincludehidden when true, also checks hidden presentations.
") ToBeUpdated;
		Standard_Boolean ToBeUpdated(Standard_Boolean theToIncludeHidden = Standard_False);

		/****** PrsMgr_PresentableObject::ToBeUpdated ******/
		/****** md5 signature: 905b5fc6f277735ff6cfd6892f9be7f4 ******/
		%feature("compactdefaultargs") ToBeUpdated;
		%feature("autodoc", "
Parameters
----------
ListOfMode: TColStd_ListOfInteger

Return
-------
None

Description
-----------
Gives the list of modes which are flagged 'to be updated'.
") ToBeUpdated;
		void ToBeUpdated(TColStd_ListOfInteger & ListOfMode);

		/****** PrsMgr_PresentableObject::ToPropagateVisualState ******/
		/****** md5 signature: e1a8691bdd1c5fe7694d8d102a8ff3a9 ******/
		%feature("compactdefaultargs") ToPropagateVisualState;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Get value of the flag 'propagate visual state' it means that the display/erase/color visual state is propagated automatically to all children; by default, the flag is true .
") ToPropagateVisualState;
		Standard_Boolean ToPropagateVisualState();

		/****** PrsMgr_PresentableObject::TransformPersistence ******/
		/****** md5 signature: f93fa6b8590ec0070c74ed0573b98382 ******/
		%feature("compactdefaultargs") TransformPersistence;
		%feature("autodoc", "Return
-------
opencascade::handle<Graphic3d_TransformPers>

Description
-----------
Returns transformation persistence defining a special local coordinate system where this presentable object is located or null handle if not defined. position of the object having transformation persistence is mutable and depends on camera position. the same applies to a bounding box of the object. @sa graphic3d_transformpers class description.
") TransformPersistence;
		const opencascade::handle<Graphic3d_TransformPers> & TransformPersistence();

		/****** PrsMgr_PresentableObject::Transformation ******/
		/****** md5 signature: 4340f0c35d6856faf6f9daeca03f9595 ******/
		%feature("compactdefaultargs") Transformation;
		%feature("autodoc", "Return
-------
gp_Trsf

Description
-----------
Return the transformation taking into account transformation of parent object(s). note that the local transformation of the object having transformation persistence is applied within local coordinate system defined by this persistence.
") Transformation;
		const gp_Trsf Transformation();

		/****** PrsMgr_PresentableObject::TransformationGeom ******/
		/****** md5 signature: cf18147ab261a78305fcabf7ec18893d ******/
		%feature("compactdefaultargs") TransformationGeom;
		%feature("autodoc", "Return
-------
opencascade::handle<TopLoc_Datum3D>

Description
-----------
Return the transformation taking into account transformation of parent object(s). note that the local transformation of the object having transformation persistence is applied within local coordinate system defined by this persistence.
") TransformationGeom;
		const opencascade::handle<TopLoc_Datum3D> & TransformationGeom();

		/****** PrsMgr_PresentableObject::Transparency ******/
		/****** md5 signature: 85ff2aaf1e1e55093c79984940af1fec ******/
		%feature("compactdefaultargs") Transparency;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the transparency setting. this will be between 0.0 and 1.0. at 0.0 an object will be totally opaque, and at 1.0, fully transparent.
") Transparency;
		virtual Standard_Real Transparency();

		/****** PrsMgr_PresentableObject::TypeOfPresentation3d ******/
		/****** md5 signature: 67a5ba69df5366d9667f1399309351b0 ******/
		%feature("compactdefaultargs") TypeOfPresentation3d;
		%feature("autodoc", "Return
-------
PrsMgr_TypeOfPresentation3d

Description
-----------
Returns information on whether the object accepts display in hlr mode or not.
") TypeOfPresentation3d;
		PrsMgr_TypeOfPresentation3d TypeOfPresentation3d();

		/****** PrsMgr_PresentableObject::UnsetAttributes ******/
		/****** md5 signature: 84cf9eff16090809fb3245e968e98248 ******/
		%feature("compactdefaultargs") UnsetAttributes;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clears settings provided by the drawing tool adrawer.
") UnsetAttributes;
		virtual void UnsetAttributes();

		/****** PrsMgr_PresentableObject::UnsetColor ******/
		/****** md5 signature: 0ea15413ea707848f5ffd4a7e5a0186c ******/
		%feature("compactdefaultargs") UnsetColor;
		%feature("autodoc", "Return
-------
None

Description
-----------
Removes color settings. only the interactive object knows which drawer attribute is affected by the color setting. for a wire, for example, wire aspect is the attribute affected. for a vertex, however, only point aspect is affected by the color setting.
") UnsetColor;
		virtual void UnsetColor();

		/****** PrsMgr_PresentableObject::UnsetDisplayMode ******/
		/****** md5 signature: 1c441f0b3a62704e64d079e0a0e8cfc1 ******/
		%feature("compactdefaultargs") UnsetDisplayMode;
		%feature("autodoc", "Return
-------
None

Description
-----------
Removes display mode settings from the interactive object.
") UnsetDisplayMode;
		void UnsetDisplayMode();

		/****** PrsMgr_PresentableObject::UnsetHilightAttributes ******/
		/****** md5 signature: 997079826c7aaf973a9319b91cfbbf03 ******/
		%feature("compactdefaultargs") UnsetHilightAttributes;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clears settings provided by the hilight drawing tool thedrawer.
") UnsetHilightAttributes;
		virtual void UnsetHilightAttributes();

		/****** PrsMgr_PresentableObject::UnsetHilightMode ******/
		/****** md5 signature: cc3796da2fbce682bdfefcce93091c39 ******/
		%feature("compactdefaultargs") UnsetHilightMode;
		%feature("autodoc", "Return
-------
None

Description
-----------
Unsets highlight display mode. @sa hilightattributes().
") UnsetHilightMode;
		void UnsetHilightMode();

		/****** PrsMgr_PresentableObject::UnsetMaterial ******/
		/****** md5 signature: ed12e05d62dadb3433224682430b3af6 ******/
		%feature("compactdefaultargs") UnsetMaterial;
		%feature("autodoc", "Return
-------
None

Description
-----------
Removes the setting for material.
") UnsetMaterial;
		virtual void UnsetMaterial();

		/****** PrsMgr_PresentableObject::UnsetTransparency ******/
		/****** md5 signature: c77a13cddf6ac485ca6e72bd4cc9a3f6 ******/
		%feature("compactdefaultargs") UnsetTransparency;
		%feature("autodoc", "Return
-------
None

Description
-----------
Removes the transparency setting. the object is opaque by default.
") UnsetTransparency;
		virtual void UnsetTransparency();

		/****** PrsMgr_PresentableObject::UnsetWidth ******/
		/****** md5 signature: e32f0d0e7a327ab58b75cb6e6deb0b31 ******/
		%feature("compactdefaultargs") UnsetWidth;
		%feature("autodoc", "Return
-------
None

Description
-----------
Reset width to default value.
") UnsetWidth;
		virtual void UnsetWidth();

		/****** PrsMgr_PresentableObject::UpdateTransformation ******/
		/****** md5 signature: a121acc901f43b5b10ae520e7898fe7e ******/
		%feature("compactdefaultargs") UpdateTransformation;
		%feature("autodoc", "Return
-------
None

Description
-----------
Updates final transformation (parent + local) of presentable object and its presentations.
") UpdateTransformation;
		virtual void UpdateTransformation();

		/****** PrsMgr_PresentableObject::ViewAffinity ******/
		/****** md5 signature: c35163d8d141e7b5addc4d77c76dd71f ******/
		%feature("compactdefaultargs") ViewAffinity;
		%feature("autodoc", "Return
-------
opencascade::handle<Graphic3d_ViewAffinity>

Description
-----------
Return view affinity mask.
") ViewAffinity;
		const opencascade::handle<Graphic3d_ViewAffinity> & ViewAffinity();

		/****** PrsMgr_PresentableObject::Width ******/
		/****** md5 signature: fabf8349fc4fa48cbd44877ecd356f67 ******/
		%feature("compactdefaultargs") Width;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the width setting of the interactive object.
") Width;
		Standard_Real Width();

		/****** PrsMgr_PresentableObject::ZLayer ******/
		/****** md5 signature: 7420fa5788bb824c02345ee38be45933 ******/
		%feature("compactdefaultargs") ZLayer;
		%feature("autodoc", "Return
-------
Graphic3d_ZLayerId

Description
-----------
Get id of z layer for main presentation.
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
		/****** PrsMgr_Presentation::Clear ******/
		/****** md5 signature: 23b81bfe6f31892aaf512d3439e16127 ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "
Parameters
----------
theWithDestruction: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Removes the whole content of the presentation. does not remove the other connected presentations.
") Clear;
		virtual void Clear(const Standard_Boolean theWithDestruction = Standard_True);

		/****** PrsMgr_Presentation::Compute ******/
		/****** md5 signature: e00c7761ecdbff16b5eaa284ed126d0e ******/
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "Return
-------
None

Description
-----------
Compute structure using presentation manager.
") Compute;
		virtual void Compute();

		/****** PrsMgr_Presentation::Display ******/
		/****** md5 signature: 869c346ea6117dea2e22059b972a14d6 ******/
		%feature("compactdefaultargs") Display;
		%feature("autodoc", "Return
-------
None

Description
-----------
Display structure.
") Display;
		virtual void Display();


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** PrsMgr_Presentation::Erase ******/
		/****** md5 signature: 1226ba71f21d492e9a9175cd12d59e28 ******/
		%feature("compactdefaultargs") Erase;
		%feature("autodoc", "Return
-------
None

Description
-----------
Remove structure.
") Erase;
		virtual void Erase();

		/****** PrsMgr_Presentation::Highlight ******/
		/****** md5 signature: 2af121cc6b89a43225bf54a5f726264f ******/
		%feature("compactdefaultargs") Highlight;
		%feature("autodoc", "
Parameters
----------
theStyle: Prs3d_Drawer

Return
-------
None

Description
-----------
Highlight structure.
") Highlight;
		void Highlight(const opencascade::handle<Prs3d_Drawer> & theStyle);

		/****** PrsMgr_Presentation::IsDisplayed ******/
		/****** md5 signature: fac1864b342038e36d4e4790c73e2b9e ******/
		%feature("compactdefaultargs") IsDisplayed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return true if structure has been displayed and in no hidden state.
") IsDisplayed;
		virtual Standard_Boolean IsDisplayed();

		/****** PrsMgr_Presentation::Mode ******/
		/****** md5 signature: b35445cddc9deccdf8a4cb5a0f8a439b ******/
		%feature("compactdefaultargs") Mode;
		%feature("autodoc", "Return
-------
int

Description
-----------
Return display mode index.
") Mode;
		Standard_Integer Mode();

		/****** PrsMgr_Presentation::MustBeUpdated ******/
		/****** md5 signature: 417e329cf76d7a136d3982c4ef6dde3f ******/
		%feature("compactdefaultargs") MustBeUpdated;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") MustBeUpdated;
		Standard_Boolean MustBeUpdated();

		/****** PrsMgr_Presentation::Presentation ******/
		/****** md5 signature: b7e1666dbf5d4a095a7ae27febdcee77 ******/
		%feature("compactdefaultargs") Presentation;
		%feature("autodoc", "Return
-------
Prs3d_Presentation *

Description
-----------
No available documentation.
") Presentation;
		Prs3d_Presentation * Presentation();

		/****** PrsMgr_Presentation::PresentationManager ******/
		/****** md5 signature: 2cbfcde90764ccb87f59f20d322e49c2 ******/
		%feature("compactdefaultargs") PresentationManager;
		%feature("autodoc", "Return
-------
opencascade::handle<PrsMgr_PresentationManager>

Description
-----------
Returns the presentationmanager in which the presentation has been created.
") PresentationManager;
		const opencascade::handle<PrsMgr_PresentationManager> & PresentationManager();

		/****** PrsMgr_Presentation::SetUpdateStatus ******/
		/****** md5 signature: 8f54b569772ca23ead0aece319538eca ******/
		%feature("compactdefaultargs") SetUpdateStatus;
		%feature("autodoc", "
Parameters
----------
theUpdateStatus: bool

Return
-------
None

Description
-----------
No available documentation.
") SetUpdateStatus;
		void SetUpdateStatus(const Standard_Boolean theUpdateStatus);

		/****** PrsMgr_Presentation::Unhighlight ******/
		/****** md5 signature: 39ce43ce3b46f356efde8e354316b376 ******/
		%feature("compactdefaultargs") Unhighlight;
		%feature("autodoc", "Return
-------
None

Description
-----------
Unhighlight structure.
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
		/****** PrsMgr_PresentationManager::PrsMgr_PresentationManager ******/
		/****** md5 signature: 912531ce0eace5bff06138fecd7e1bfb ******/
		%feature("compactdefaultargs") PrsMgr_PresentationManager;
		%feature("autodoc", "
Parameters
----------
theStructureManager: Graphic3d_StructureManager

Return
-------
None

Description
-----------
Creates a framework to manage displays and graphic entities with the 3d view thestructuremanager.
") PrsMgr_PresentationManager;
		 PrsMgr_PresentationManager(const opencascade::handle<Graphic3d_StructureManager> & theStructureManager);

		/****** PrsMgr_PresentationManager::AddToImmediateList ******/
		/****** md5 signature: ca9914b9c7fe88b10912f7bc809fcb1b ******/
		%feature("compactdefaultargs") AddToImmediateList;
		%feature("autodoc", "
Parameters
----------
thePrs: Prs3d_Presentation

Return
-------
None

Description
-----------
Stores theprs in the transient list of presentations to be displayed in immediate mode. will be taken in account in endimmediatedraw method.
") AddToImmediateList;
		void AddToImmediateList(const opencascade::handle<Prs3d_Presentation> & thePrs);

		/****** PrsMgr_PresentationManager::BeginImmediateDraw ******/
		/****** md5 signature: 5e4c9214cafb77f34e29a75aeb7b96e3 ******/
		%feature("compactdefaultargs") BeginImmediateDraw;
		%feature("autodoc", "Return
-------
None

Description
-----------
Resets the transient list of presentations previously displayed in immediate mode and begins accumulation of new list by following addtoimmediatelist()/color()/highlight() calls.
") BeginImmediateDraw;
		void BeginImmediateDraw();

		/****** PrsMgr_PresentationManager::Clear ******/
		/****** md5 signature: 2a61577b895e4850e9c9f89caef0b9b7 ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "
Parameters
----------
thePrsObject: PrsMgr_PresentableObject
theMode: int (optional, default to 0)

Return
-------
None

Description
-----------
Clears the presentation of the presentable object theprsobject in this framework with the display mode themode.
") Clear;
		virtual void Clear(const opencascade::handle<PrsMgr_PresentableObject> & thePrsObject, const Standard_Integer theMode = 0);

		/****** PrsMgr_PresentationManager::ClearImmediateDraw ******/
		/****** md5 signature: a61ed789427e61ac8a321653e129d97d ******/
		%feature("compactdefaultargs") ClearImmediateDraw;
		%feature("autodoc", "Return
-------
None

Description
-----------
Resets the transient list of presentations previously displayed in immediate mode.
") ClearImmediateDraw;
		void ClearImmediateDraw();

		/****** PrsMgr_PresentationManager::Color ******/
		/****** md5 signature: b85d3054a96bd70de66cf45192cfb1ea ******/
		%feature("compactdefaultargs") Color;
		%feature("autodoc", "
Parameters
----------
thePrsObject: PrsMgr_PresentableObject
theStyle: Prs3d_Drawer
theMode: int (optional, default to 0)
theSelObj: PrsMgr_PresentableObject (optional, default to NULL)
theImmediateStructLayerId: int (optional, default to Graphic3d_ZLayerId_Topmost)

Return
-------
None

Description
-----------
Highlights the graphic object theprsobject in the color thecolor. theprsobject has the display mode themode; this has the default value of 0, that is, the wireframe display mode.
") Color;
		void Color(const opencascade::handle<PrsMgr_PresentableObject> & thePrsObject, const opencascade::handle<Prs3d_Drawer> & theStyle, const Standard_Integer theMode = 0, const opencascade::handle<PrsMgr_PresentableObject> & theSelObj = NULL, int theImmediateStructLayerId = Graphic3d_ZLayerId_Topmost);

		/****** PrsMgr_PresentationManager::Connect ******/
		/****** md5 signature: 1e9fcc77126fa4ddf9593126ebbc3c72 ******/
		%feature("compactdefaultargs") Connect;
		%feature("autodoc", "
Parameters
----------
thePrsObject: PrsMgr_PresentableObject
theOtherObject: PrsMgr_PresentableObject
theMode: int (optional, default to 0)
theOtherMode: int (optional, default to 0)

Return
-------
None

Description
-----------
No available documentation.
") Connect;
		void Connect(const opencascade::handle<PrsMgr_PresentableObject> & thePrsObject, const opencascade::handle<PrsMgr_PresentableObject> & theOtherObject, const Standard_Integer theMode = 0, const Standard_Integer theOtherMode = 0);

		/****** PrsMgr_PresentationManager::Display ******/
		/****** md5 signature: a374b8bbbbf6d606f9b6880a8d6d23fd ******/
		%feature("compactdefaultargs") Display;
		%feature("autodoc", "
Parameters
----------
thePrsObject: PrsMgr_PresentableObject
theMode: int (optional, default to 0)

Return
-------
None

Description
-----------
Displays the presentation of the object in the given presentation manager with the given mode. the mode should be enumerated by the object which inherits presentableobject.
") Display;
		void Display(const opencascade::handle<PrsMgr_PresentableObject> & thePrsObject, const Standard_Integer theMode = 0);

		/****** PrsMgr_PresentationManager::DisplayPriority ******/
		/****** md5 signature: 90f66350e590479c3e4675265df1e605 ******/
		%feature("compactdefaultargs") DisplayPriority;
		%feature("autodoc", "
Parameters
----------
thePrsObject: PrsMgr_PresentableObject
theMode: int

Return
-------
Graphic3d_DisplayPriority

Description
-----------
Returns the display priority of the presentable object theprsobject in this framework with the display mode themode.
") DisplayPriority;
		Graphic3d_DisplayPriority DisplayPriority(const opencascade::handle<PrsMgr_PresentableObject> & thePrsObject, const Standard_Integer theMode);

		/****** PrsMgr_PresentationManager::EndImmediateDraw ******/
		/****** md5 signature: 6979ec7acf16ddaac04142f401974aa8 ******/
		%feature("compactdefaultargs") EndImmediateDraw;
		%feature("autodoc", "
Parameters
----------
theViewer: V3d_Viewer

Return
-------
None

Description
-----------
Allows rapid drawing of the each view in theviewer by avoiding an update of the whole background.
") EndImmediateDraw;
		void EndImmediateDraw(const opencascade::handle<V3d_Viewer> & theViewer);

		/****** PrsMgr_PresentationManager::Erase ******/
		/****** md5 signature: 72ad4db7aaa1598173431c5b591b6fe6 ******/
		%feature("compactdefaultargs") Erase;
		%feature("autodoc", "
Parameters
----------
thePrsObject: PrsMgr_PresentableObject
theMode: int (optional, default to 0)

Return
-------
None

Description
-----------
Erases the presentation of the object in the given presentation manager with the given mode. if @themode is -1, then erases all presentations of the object.
") Erase;
		void Erase(const opencascade::handle<PrsMgr_PresentableObject> & thePrsObject, const Standard_Integer theMode = 0);

		/****** PrsMgr_PresentationManager::GetZLayer ******/
		/****** md5 signature: 234266cff6819c09adb5ceab0db4f798 ******/
		%feature("compactdefaultargs") GetZLayer;
		%feature("autodoc", "
Parameters
----------
thePrsObject: PrsMgr_PresentableObject

Return
-------
Graphic3d_ZLayerId

Description
-----------
Get z layer id assigned to all presentations of the object. method returns -1 value if object has no presentations and is impossible to get layer index.
") GetZLayer;
		Graphic3d_ZLayerId GetZLayer(const opencascade::handle<PrsMgr_PresentableObject> & thePrsObject);

		/****** PrsMgr_PresentationManager::HasPresentation ******/
		/****** md5 signature: 7269040ca8b3ecda300996321360976b ******/
		%feature("compactdefaultargs") HasPresentation;
		%feature("autodoc", "
Parameters
----------
thePrsObject: PrsMgr_PresentableObject
theMode: int (optional, default to 0)

Return
-------
bool

Description
-----------
Returns true if there is a presentation of the presentable object theprsobject in this framework, theprsobject having the display mode themode.
") HasPresentation;
		Standard_Boolean HasPresentation(const opencascade::handle<PrsMgr_PresentableObject> & thePrsObject, const Standard_Integer theMode = 0);

		/****** PrsMgr_PresentationManager::IsDisplayed ******/
		/****** md5 signature: b3ab321c30d7fe0d9de316b2973869e2 ******/
		%feature("compactdefaultargs") IsDisplayed;
		%feature("autodoc", "
Parameters
----------
thePrsObject: PrsMgr_PresentableObject
theMode: int (optional, default to 0)

Return
-------
bool

Description
-----------
No available documentation.
") IsDisplayed;
		Standard_Boolean IsDisplayed(const opencascade::handle<PrsMgr_PresentableObject> & thePrsObject, const Standard_Integer theMode = 0);

		/****** PrsMgr_PresentationManager::IsHighlighted ******/
		/****** md5 signature: 732c995cfe1cc42df4ef0311005daf6f ******/
		%feature("compactdefaultargs") IsHighlighted;
		%feature("autodoc", "
Parameters
----------
thePrsObject: PrsMgr_PresentableObject
theMode: int (optional, default to 0)

Return
-------
bool

Description
-----------
Returns true if the presentation of the presentable object theprsobject in this framework with the display mode themode is highlighted.
") IsHighlighted;
		Standard_Boolean IsHighlighted(const opencascade::handle<PrsMgr_PresentableObject> & thePrsObject, const Standard_Integer theMode = 0);

		/****** PrsMgr_PresentationManager::IsImmediateModeOn ******/
		/****** md5 signature: 4be60babd0bc73da77be0206a101ba4c ******/
		%feature("compactdefaultargs") IsImmediateModeOn;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if presentation manager is accumulating transient list of presentations to be displayed in immediate mode.
") IsImmediateModeOn;
		Standard_Boolean IsImmediateModeOn();

		/****** PrsMgr_PresentationManager::Presentation ******/
		/****** md5 signature: 805551606ed14b1efc696c872a480231 ******/
		%feature("compactdefaultargs") Presentation;
		%feature("autodoc", "
Parameters
----------
thePrsObject: PrsMgr_PresentableObject
theMode: int (optional, default to 0)
theToCreate: bool (optional, default to Standard_False)
theSelObj: PrsMgr_PresentableObject (optional, default to NULL)

Return
-------
opencascade::handle<PrsMgr_Presentation>

Description
-----------
Returns the presentation presentation of the presentable object theprsobject in this framework. when thetocreate is true - automatically creates presentation for specified mode when not exist. optional argument theselobj specifies parent decomposed object to inherit its view affinity.
") Presentation;
		opencascade::handle<PrsMgr_Presentation> Presentation(const opencascade::handle<PrsMgr_PresentableObject> & thePrsObject, const Standard_Integer theMode = 0, const Standard_Boolean theToCreate = Standard_False, const opencascade::handle<PrsMgr_PresentableObject> & theSelObj = NULL);

		/****** PrsMgr_PresentationManager::RedrawImmediate ******/
		/****** md5 signature: e79e25af7466be6448448d7a6d5349eb ******/
		%feature("compactdefaultargs") RedrawImmediate;
		%feature("autodoc", "
Parameters
----------
theViewer: V3d_Viewer

Return
-------
None

Description
-----------
Clears and redisplays immediate structures of the viewer taking into account its affinity.
") RedrawImmediate;
		void RedrawImmediate(const opencascade::handle<V3d_Viewer> & theViewer);

		/****** PrsMgr_PresentationManager::SetDisplayPriority ******/
		/****** md5 signature: 9a549ca30dd3170bb74ca40344856587 ******/
		%feature("compactdefaultargs") SetDisplayPriority;
		%feature("autodoc", "
Parameters
----------
thePrsObject: PrsMgr_PresentableObject
theMode: int
theNewPrior: Graphic3d_DisplayPriority

Return
-------
None

Description
-----------
Sets the display priority thenewprior of the presentable object theprsobject in this framework with the display mode themode.
") SetDisplayPriority;
		void SetDisplayPriority(const opencascade::handle<PrsMgr_PresentableObject> & thePrsObject, const Standard_Integer theMode, const Graphic3d_DisplayPriority theNewPrior);

		/****** PrsMgr_PresentationManager::SetVisibility ******/
		/****** md5 signature: d7287cc5906b7a3a48ea7b6451457b6e ******/
		%feature("compactdefaultargs") SetVisibility;
		%feature("autodoc", "
Parameters
----------
thePrsObject: PrsMgr_PresentableObject
theMode: int
theValue: bool

Return
-------
None

Description
-----------
Sets the visibility of presentable object.
") SetVisibility;
		void SetVisibility(const opencascade::handle<PrsMgr_PresentableObject> & thePrsObject, const Standard_Integer theMode, const Standard_Boolean theValue);

		/****** PrsMgr_PresentationManager::SetZLayer ******/
		/****** md5 signature: 66d77fb3608e275461264dc059a62d6f ******/
		%feature("compactdefaultargs") SetZLayer;
		%feature("autodoc", "
Parameters
----------
thePrsObject: PrsMgr_PresentableObject
theLayerId: int

Return
-------
None

Description
-----------
Set z layer id for all presentations of the object.
") SetZLayer;
		void SetZLayer(const opencascade::handle<PrsMgr_PresentableObject> & thePrsObject, int theLayerId);

		/****** PrsMgr_PresentationManager::StructureManager ******/
		/****** md5 signature: 5843678469524fb10153c08d2adb183d ******/
		%feature("compactdefaultargs") StructureManager;
		%feature("autodoc", "Return
-------
opencascade::handle<Graphic3d_StructureManager>

Description
-----------
Returns the structure manager.
") StructureManager;
		const opencascade::handle<Graphic3d_StructureManager> & StructureManager();

		/****** PrsMgr_PresentationManager::Transform ******/
		/****** md5 signature: 344885007b9ccb1456edbdc153381925 ******/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "
Parameters
----------
thePrsObject: PrsMgr_PresentableObject
theTransformation: TopLoc_Datum3D
theMode: int (optional, default to 0)

Return
-------
None

Description
-----------
Sets the transformation thetransformation for the presentable object theprsobject. theprsobject has the display mode themode; this has the default value of 0, that is, the wireframe display mode.
") Transform;
		void Transform(const opencascade::handle<PrsMgr_PresentableObject> & thePrsObject, const opencascade::handle<TopLoc_Datum3D> & theTransformation, const Standard_Integer theMode = 0);

		/****** PrsMgr_PresentationManager::Unhighlight ******/
		/****** md5 signature: 1db3626dfa4fdeb3c345157ebf7f6ad8 ******/
		%feature("compactdefaultargs") Unhighlight;
		%feature("autodoc", "
Parameters
----------
thePrsObject: PrsMgr_PresentableObject

Return
-------
None

Description
-----------
Removes highlighting from the presentation of the presentable object.
") Unhighlight;
		void Unhighlight(const opencascade::handle<PrsMgr_PresentableObject> & thePrsObject);

		/****** PrsMgr_PresentationManager::Update ******/
		/****** md5 signature: 6f121173a28205c89b330155df4d893b ******/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "
Parameters
----------
thePrsObject: PrsMgr_PresentableObject
theMode: int (optional, default to 0)

Return
-------
None

Description
-----------
Updates the presentation of the presentable object theprsobject in this framework with the display mode themode.
") Update;
		void Update(const opencascade::handle<PrsMgr_PresentableObject> & thePrsObject, const Standard_Integer theMode = 0);

		/****** PrsMgr_PresentationManager::UpdateHighlightTrsf ******/
		/****** md5 signature: 09522853572cb982dd4592da49b4d268 ******/
		%feature("compactdefaultargs") UpdateHighlightTrsf;
		%feature("autodoc", "
Parameters
----------
theViewer: V3d_Viewer
theObj: PrsMgr_PresentableObject
theMode: int (optional, default to 0)
theSelObj: PrsMgr_PresentableObject (optional, default to NULL)

Return
-------
None

Description
-----------
Allows to apply location transformation to shadow highlight presentation immediately. @param theobj defines the base object, it local transformation will be applied to corresponding highlight structure @param themode defines display mode of the base object @param theselobj defines the object produced after decomposition of the base object for local selection.
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
/* class aliases */
%pythoncode {
Prs3d_Presentation=OCC.Core.Graphic3d.Graphic3d_Structure
PrsMgr_Presentation3d=PrsMgr_Presentation
PrsMgr_PresentationManager3d=PrsMgr_PresentationManager
}
