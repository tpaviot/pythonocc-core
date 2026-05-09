/*
Copyright 2008-2025 Thomas Paviot (tpaviot@gmail.com)

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
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_prsmgr.html"
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
%template(PrsMgr_ListOfPresentations) NCollection_List<opencascade::handle<Prs3d_Presentation>>;

%extend NCollection_List<opencascade::handle<Prs3d_Presentation>> {
    // occt-800: re-export Size/Length/IsEmpty per instantiation; the
    // NCollection_BaseList header is wrapped but its inherited methods
    // don't propagate cleanly to the typedef-aliased Python class.
    size_t Size() const noexcept { return $self->Size(); }
    int Length() const noexcept { return $self->Length(); }
    bool IsEmpty() const noexcept { return $self->IsEmpty(); }
    %pythoncode {
    def __len__(self):
        return self.Size()

    def __iter__(self):
        it = PrsMgr_ListIteratorOfListOfPresentations(self)
        while it.More():
            yield it.Value()
            it.Next()
    }
};
/* end templates declaration */

/* typedefs */
typedef Graphic3d_Structure Prs3d_Presentation;
typedef NCollection_List<opencascade::handle<Prs3d_Presentation>> PrsMgr_ListOfPresentations;
/* end typedefs declaration */

/*********************************
* class PrsMgr_PresentableObject *
*********************************/
%nodefaultctor PrsMgr_PresentableObject;
%ignore PrsMgr_PresentableObject::~PrsMgr_PresentableObject();
class PrsMgr_PresentableObject : public Standard_Transient {
	public:
		/****** PrsMgr_PresentableObject::AcceptDisplayMode ******/
		/****** md5 signature: 6780408d8e6c0eaa027335b4159d5fea ******/
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
Returns true if the class of objects accepts specified display mode index. The interactive context can have a default mode of representation for the set of Interactive Objects. This mode may not be accepted by a given class of objects. Consequently, this virtual method allowing us to get information about the class in question must be implemented. At least one display mode index should be accepted by this method. Although subclass can leave default implementation, it is highly desired defining exact list of supported modes instead, which is usually an enumeration for one object or objects class sharing similar list of display modes.
") AcceptDisplayMode;
		virtual bool AcceptDisplayMode(const int theMode);

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
Makes theObject child of current object in scene hierarchy.
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
Makes theObject child of current object in scene hierarchy with keeping the current global transformation So the object keeps the same position/orientation in the global CS.
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
Adds clip plane for graphical clipping for all display mode presentations. The composition of clip planes truncates the rendering space to convex volume. Please be aware that number of supported clip plane is limited. The planes which exceed the limit are ignored. Besides of this, some planes can be already set in view where the object is shown: the number of these planes should be subtracted from limit to predict the maximum possible number of object clipping planes. 
Input parameter: thePlane the clip plane to be appended to map of clip planes.
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
Returns bounding box of object correspondingly to its current display mode. This method requires presentation to be already computed, since it relies on bounding box of presentation structures, which are supposed to be same/close amongst different display modes of this object.
") BoundingBox;
		virtual void BoundingBox(Bnd_Box & theBndBox);

		/****** PrsMgr_PresentableObject::Children ******/
		/****** md5 signature: d66182f2538dc4b34e838e891cb2be5a ******/
		%feature("compactdefaultargs") Children;
		%feature("autodoc", "Return
-------
NCollection_List<opencascade::handle<PrsMgr_PresentableObject>>

Description
-----------
Returns children of the current object.
") Children;
		const NCollection_List<opencascade::handle<PrsMgr_PresentableObject>> & Children();

		/****** PrsMgr_PresentableObject::ClipPlanes ******/
		/****** md5 signature: 26ab80085e76b6f03b64af6598080486 ******/
		%feature("compactdefaultargs") ClipPlanes;
		%feature("autodoc", "Return
-------
opencascade::handle<Graphic3d_SequenceOfHClipPlane>

Description
-----------
Get clip planes. 
Return: set of previously added clip planes for all display mode presentations.
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
Returns the color setting of the Interactive Object.
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
		/****** md5 signature: f9ca47b31e04894fff2dbcc67d76e0f3 ******/
		%feature("compactdefaultargs") DefaultDisplayMode;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the default display mode.
") DefaultDisplayMode;
		virtual int DefaultDisplayMode();

		/****** PrsMgr_PresentableObject::DisplayMode ******/
		/****** md5 signature: ac5a0607c42d4a5cb024f9e1f4d5fff9 ******/
		%feature("compactdefaultargs") DisplayMode;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the display mode setting of the Interactive Object. The range of supported display mode indexes should be specified within object definition and filtered by AccepDisplayMode(). 
See also: AcceptDisplayMode().
") DisplayMode;
		int DisplayMode();

		/****** PrsMgr_PresentableObject::DisplayStatus ******/
		/****** md5 signature: ee3d5b78bf379a82087b86d8b5b0b3e3 ******/
		%feature("compactdefaultargs") DisplayStatus;
		%feature("autodoc", "Return
-------
PrsMgr_DisplayStatus

Description
-----------
Return presentation display status; PrsMgr_DisplayStatus_None by default.
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
Returns the hilight attributes settings. When not NULL, overrides both Prs3d_TypeOfHighlight_LocalDynamic and Prs3d_TypeOfHighlight_Dynamic defined within AIS_InteractiveContext::HighlightStyle(). 
See also: AIS_InteractiveContext::HighlightStyle().
") DynamicHilightAttributes;
		const opencascade::handle<Prs3d_Drawer> & DynamicHilightAttributes();

		/****** PrsMgr_PresentableObject::HasColor ******/
		/****** md5 signature: 9d4e6cc50a499be7adbd7b5390ea23e4 ******/
		%feature("compactdefaultargs") HasColor;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the Interactive Object has color.
") HasColor;
		bool HasColor();

		/****** PrsMgr_PresentableObject::HasDisplayMode ******/
		/****** md5 signature: be7d9ef6129f0f32e7e22620ebf88820 ******/
		%feature("compactdefaultargs") HasDisplayMode;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the Interactive Object has display mode setting overriding global setting (within Interactive Context).
") HasDisplayMode;
		bool HasDisplayMode();

		/****** PrsMgr_PresentableObject::HasHilightMode ******/
		/****** md5 signature: d617b11ce31687e2f0f05424ddf6da8b ******/
		%feature("compactdefaultargs") HasHilightMode;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the Interactive Object is in highlight mode. 
See also: HilightAttributes().
") HasHilightMode;
		bool HasHilightMode();

		/****** PrsMgr_PresentableObject::HasMaterial ******/
		/****** md5 signature: d2a933323bb510a0e71bff3cd6513eb0 ******/
		%feature("compactdefaultargs") HasMaterial;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the Interactive Object has a setting for material.
") HasMaterial;
		bool HasMaterial();

		/****** PrsMgr_PresentableObject::HasOwnPresentations ******/
		/****** md5 signature: b1bc6eb173a9caf9b0970395801a23e0 ******/
		%feature("compactdefaultargs") HasOwnPresentations;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if object should have own presentations.
") HasOwnPresentations;
		bool HasOwnPresentations();

		/****** PrsMgr_PresentableObject::HasPolygonOffsets ******/
		/****** md5 signature: bc192e6cd628f833d51037c44dca4bf7 ******/
		%feature("compactdefaultargs") HasPolygonOffsets;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if <myDrawer> has non-null shading aspect.
") HasPolygonOffsets;
		virtual bool HasPolygonOffsets();

		/****** PrsMgr_PresentableObject::HasTransformation ******/
		/****** md5 signature: b8328431b78409c944beaf886dc9a10e ******/
		%feature("compactdefaultargs") HasTransformation;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if object has a transformation that is different from the identity.
") HasTransformation;
		bool HasTransformation();

		/****** PrsMgr_PresentableObject::HasWidth ******/
		/****** md5 signature: 4a398cea04ef93366218cbb8b231f7d1 ******/
		%feature("compactdefaultargs") HasWidth;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the Interactive Object has width.
") HasWidth;
		bool HasWidth();

		/****** PrsMgr_PresentableObject::HilightAttributes ******/
		/****** md5 signature: 028c3cfd528f1150f36206e2e1fd24ab ******/
		%feature("compactdefaultargs") HilightAttributes;
		%feature("autodoc", "Return
-------
opencascade::handle<Prs3d_Drawer>

Description
-----------
Returns the hilight attributes settings. When not NULL, overrides both Prs3d_TypeOfHighlight_LocalSelected and Prs3d_TypeOfHighlight_Selected defined within AIS_InteractiveContext::HighlightStyle(). 
See also: AIS_InteractiveContext::HighlightStyle().
") HilightAttributes;
		const opencascade::handle<Prs3d_Drawer> & HilightAttributes();

		/****** PrsMgr_PresentableObject::HilightMode ******/
		/****** md5 signature: 9555c6df31e9c0ef5f6100d4793a3cd3 ******/
		%feature("compactdefaultargs") HilightMode;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns highlight display mode. This is obsolete method for backward compatibility - use ::HilightAttributes() and ::DynamicHilightAttributes() instead. 
See also: HilightAttributes().
") HilightMode;
		int HilightMode();

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
		/****** md5 signature: 7f15d815c957eba08a82497226542810 ******/
		%feature("compactdefaultargs") IsInfinite;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the interactive object is infinite; False by default. This flag affects various operations operating on bounding box of graphic presentations of this object. For instance, infinite objects are not taken in account for View FitAll. This does not necessarily means that object is actually infinite, auxiliary objects might be also marked with this flag to achieve desired behavior.
") IsInfinite;
		bool IsInfinite();

		/****** PrsMgr_PresentableObject::IsMutable ******/
		/****** md5 signature: 6b5855c59f93c0e10dec04d410edb1b7 ******/
		%feature("compactdefaultargs") IsMutable;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if object has mutable nature (content or location are be changed regularly). Mutable object will be managed in different way than static onces (another optimizations).
") IsMutable;
		bool IsMutable();

		/****** PrsMgr_PresentableObject::IsTransparent ******/
		/****** md5 signature: a17806d349512a0ec9958f9a7b6c5a53 ******/
		%feature("compactdefaultargs") IsTransparent;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if there is a transparency setting.
") IsTransparent;
		bool IsTransparent();

		/****** PrsMgr_PresentableObject::LocalTransformation ******/
		/****** md5 signature: d727e7863f78900c68e430ca7d96d70c ******/
		%feature("compactdefaultargs") LocalTransformation;
		%feature("autodoc", "Return
-------
gp_Trsf

Description
-----------
Return the local transformation. Note that the local transformation of the object having Transformation Persistence is applied within Local Coordinate system defined by this Persistence.
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
Return the local transformation. Note that the local transformation of the object having Transformation Persistence is applied within Local Coordinate system defined by this Persistence.
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
		/****** md5 signature: 9c9b528ae288d100810b812cc0e9914a ******/
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
Retrieves current polygon offsets settings from <myDrawer>.
") PolygonOffsets;
		virtual void PolygonOffsets(Standard_Integer &OutValue, Standard_ShortReal &OutValue, Standard_ShortReal &OutValue);

		/****** PrsMgr_PresentableObject::Presentations ******/
		/****** md5 signature: 63d2d7cbc1af52c85561918c0cfe1293 ******/
		%feature("compactdefaultargs") Presentations;
		%feature("autodoc", "Return
-------
NCollection_Sequence<opencascade::handle<PrsMgr_Presentation>>

Description
-----------
Return presentations.
") Presentations;
		NCollection_Sequence<opencascade::handle<PrsMgr_Presentation>> & Presentations();

		/****** PrsMgr_PresentableObject::RecomputeTransformation ******/
		/****** md5 signature: 82ed18839859745368af73d0950cafa4 ******/
		%feature("compactdefaultargs") RecomputeTransformation;
		%feature("autodoc", "
Parameters
----------
theProjector: Graphic3d_Camera

Return
-------
None

Description
-----------
Calculates object presentation for specific camera position. Each of the views in the viewer and every modification such as rotation, for example, entails recalculation. 
Parameter theProjector [in] view orientation.
") RecomputeTransformation;
		virtual void RecomputeTransformation(const opencascade::handle<Graphic3d_Camera> & theProjector);

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
Removes theObject from children of current object in scene hierarchy.
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
Removes theObject from children of current object in scene hierarchy with keeping the current global transformation. So the object keeps the same position/orientation in the global CS.
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
Removes previously added clip plane. 
Input parameter: thePlane the clip plane to be removed from map of clip planes.
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
resets local transformation to identity.
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
Initializes the drawing tool theDrawer.
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
Set clip planes for graphical clipping for all display mode presentations. The composition of clip planes truncates the rendering space to convex volume. Please be aware that number of supported clip plane is limited. The planes which exceed the limit are ignored. Besides of this, some planes can be already set in view where the object is shown: the number of these planes should be subtracted from limit to predict the maximum possible number of object clipping planes.
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
Only the interactive object knowns which Drawer attribute is affected by the color, if any (ex: for a wire,it's the wireaspect field of the drawer, but for a vertex, only the point aspect field is affected by the color). WARNING: Do not forget to set the corresponding fields here (hasOwnColor and myDrawer->SetColor()).
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
change the current facing model apply on polygons for SetColor(), SetTransparency(), SetMaterial() methods default facing model is Aspect_TOFM_TWO_SIDE. This mean that attributes is applying both on the front and back face.
") SetCurrentFacingModel;
		void SetCurrentFacingModel(const Aspect_TypeOfFacingModel theModel = Aspect_TOFM_BOTH_SIDE);

		/****** PrsMgr_PresentableObject::SetDisplayMode ******/
		/****** md5 signature: e8e6901d77a66a90acf6b94e4ae659ff ******/
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
Sets the display mode for the interactive object. An object can have its own temporary display mode, which is different from that proposed by the interactive context. 
See also: AcceptDisplayMode().
") SetDisplayMode;
		void SetDisplayMode(const int theMode);

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
Initializes the hilight drawing tool theDrawer.
") SetHilightAttributes;
		virtual void SetHilightAttributes(const opencascade::handle<Prs3d_Drawer> & theDrawer);

		/****** PrsMgr_PresentableObject::SetHilightMode ******/
		/****** md5 signature: f9b4b9d1aa0dd8593f7f8a32b4430118 ******/
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
Sets highlight display mode. This is obsolete method for backward compatibility - use ::HilightAttributes() and ::DynamicHilightAttributes() instead. 
See also: HilightAttributes().
") SetHilightMode;
		void SetHilightMode(const int theMode);

		/****** PrsMgr_PresentableObject::SetInfiniteState ******/
		/****** md5 signature: 6eea75ff3fdcd397406027dcc4827f23 ******/
		%feature("compactdefaultargs") SetInfiniteState;
		%feature("autodoc", "
Parameters
----------
theFlag: bool (optional, default to true)

Return
-------
None

Description
-----------
Sets if object should be considered as infinite.
") SetInfiniteState;
		void SetInfiniteState(const bool theFlag = true);

		/****** PrsMgr_PresentableObject::SetIsoOnTriangulation ******/
		/****** md5 signature: 8039100d1c4bb4729871d2f94db0cdc4 ******/
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
		void SetIsoOnTriangulation(const bool theIsEnabled);

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
Sets local transformation to theTransformation. Note that the local transformation of the object having Transformation Persistence is applied within Local Coordinate system defined by this Persistence.
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
Sets local transformation to theTransformation. Note that the local transformation of the object having Transformation Persistence is applied within Local Coordinate system defined by this Persistence.
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
Sets the material aMat defining this display attribute for the interactive object. Material aspect determines shading aspect, color and transparency of visible entities.
") SetMaterial;
		virtual void SetMaterial(const Graphic3d_MaterialAspect & aName);

		/****** PrsMgr_PresentableObject::SetMutable ******/
		/****** md5 signature: ecd07efb18caf105269e935a2980866b ******/
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
Sets if the object has mutable nature (content or location will be changed regularly). This method should be called before object displaying to take effect.
") SetMutable;
		virtual void SetMutable(const bool theIsMutable);

		/****** PrsMgr_PresentableObject::SetPolygonOffsets ******/
		/****** md5 signature: ce59300419d64d682a61fab696b8d0bd ******/
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
Sets up polygon offsets for this object. 
See also: Graphic3d_Aspects::SetPolygonOffsets().
") SetPolygonOffsets;
		virtual void SetPolygonOffsets(const int aMode, const float aFactor = 1.0, const float aUnits = 0.0);

		/****** PrsMgr_PresentableObject::SetPropagateVisualState ******/
		/****** md5 signature: df9557b62da26c54c4072a9017e7a39d ******/
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
		void SetPropagateVisualState(const bool theFlag);

		/****** PrsMgr_PresentableObject::SetToUpdate ******/
		/****** md5 signature: 08e67cdde3a0a4f6b51e507337bb10c6 ******/
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
Flags presentation to be updated; UpdatePresentations() will recompute these presentations. 
Parameter theMode presentation (display mode) to invalidate, or -1 to invalidate them all.
") SetToUpdate;
		void SetToUpdate(int theMode);

		/****** PrsMgr_PresentableObject::SetToUpdate ******/
		/****** md5 signature: 4a65af550d5ec39b45b7761dfdbbd7c3 ******/
		%feature("compactdefaultargs") SetToUpdate;
		%feature("autodoc", "Return
-------
None

Description
-----------
flags all the Presentations to be Updated.
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
Sets up Transform Persistence defining a special Local Coordinate system where this object should be located. Note that management of Transform Persistence object is more expensive than of the normal one, because it requires its position being recomputed basing on camera position within each draw call / traverse. 
See also: Graphic3d_TransformPers class description.
") SetTransformPersistence;
		virtual void SetTransformPersistence(const opencascade::handle<Graphic3d_TransformPers> & theTrsfPers);

		/****** PrsMgr_PresentableObject::SetTransparency ******/
		/****** md5 signature: efef8205c7248d16288b7a2163741fa8 ******/
		%feature("compactdefaultargs") SetTransparency;
		%feature("autodoc", "
Parameters
----------
aValue: double (optional, default to 0.6)

Return
-------
None

Description
-----------
Attributes a setting aValue for transparency. The transparency value should be between 0.0 and 1.0. At 0.0 an object will be totally opaque, and at 1.0, fully transparent. Warning At a value of 1.0, there may be nothing visible.
") SetTransparency;
		virtual void SetTransparency(const double aValue = 0.6);

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
		/****** md5 signature: ab4c2bc4c2ab68437441be2575ab8c2f ******/
		%feature("compactdefaultargs") SetWidth;
		%feature("autodoc", "
Parameters
----------
theWidth: double

Return
-------
None

Description
-----------
Allows you to provide the setting aValue for width. Only the Interactive Object knows which Drawer attribute is affected by the width setting.
") SetWidth;
		virtual void SetWidth(const double theWidth);

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
Set Z layer ID and update all presentations of the presentable object. The layers mechanism allows drawing objects in higher layers in overlay of objects in lower layers.
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
Synchronize presentation aspects after their modification. //! This method should be called after modifying primitive aspect properties (material, texture, shader) so that modifications will take effect on already computed presentation groups (thus avoiding re-displaying the object).
") SynchronizeAspects;
		void SynchronizeAspects();

		/****** PrsMgr_PresentableObject::ToBeUpdated ******/
		/****** md5 signature: 7ea8906e76a53e4080749385db3fbbf5 ******/
		%feature("compactdefaultargs") ToBeUpdated;
		%feature("autodoc", "
Parameters
----------
theToIncludeHidden: bool (optional, default to false)

Return
-------
bool

Description
-----------
Returns True if any active presentation has invalidation flag. 
Parameter theToIncludeHidden when True, also checks hidden presentations.
") ToBeUpdated;
		bool ToBeUpdated(bool theToIncludeHidden = false);

		/****** PrsMgr_PresentableObject::ToBeUpdated ******/
		/****** md5 signature: bcae31d8b1e9f580092ec0ec29239541 ******/
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
gives the list of modes which are flagged 'to be updated'.
") ToBeUpdated;
		void ToBeUpdated(TColStd_ListOfInteger & ListOfMode);

		/****** PrsMgr_PresentableObject::ToPropagateVisualState ******/
		/****** md5 signature: c93d9d8e0962efe39bca6640addb1dbb ******/
		%feature("compactdefaultargs") ToPropagateVisualState;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Get value of the flag 'propagate visual state' It means that the display/erase/color visual state is propagated automatically to all children; by default, the flag is true.
") ToPropagateVisualState;
		bool ToPropagateVisualState();

		/****** PrsMgr_PresentableObject::TransformPersistence ******/
		/****** md5 signature: f93fa6b8590ec0070c74ed0573b98382 ******/
		%feature("compactdefaultargs") TransformPersistence;
		%feature("autodoc", "Return
-------
opencascade::handle<Graphic3d_TransformPers>

Description
-----------
Returns Transformation Persistence defining a special Local Coordinate system where this presentable object is located or NULL handle if not defined. Position of the object having Transformation Persistence is mutable and depends on camera position. The same applies to a bounding box of the object. 
See also: Graphic3d_TransformPers class description.
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
Return the transformation taking into account transformation of parent object(s). Note that the local transformation of the object having Transformation Persistence is applied within Local Coordinate system defined by this Persistence.
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
Return the transformation taking into account transformation of parent object(s). Note that the local transformation of the object having Transformation Persistence is applied within Local Coordinate system defined by this Persistence.
") TransformationGeom;
		const opencascade::handle<TopLoc_Datum3D> & TransformationGeom();

		/****** PrsMgr_PresentableObject::Transparency ******/
		/****** md5 signature: b2e48aa8d0e36ed803832c6cc31b3a8b ******/
		%feature("compactdefaultargs") Transparency;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the transparency setting. This will be between 0.0 and 1.0. At 0.0 an object will be totally opaque, and at 1.0, fully transparent.
") Transparency;
		virtual double Transparency();

		/****** PrsMgr_PresentableObject::TypeOfPresentation3d ******/
		/****** md5 signature: 67a5ba69df5366d9667f1399309351b0 ******/
		%feature("compactdefaultargs") TypeOfPresentation3d;
		%feature("autodoc", "Return
-------
PrsMgr_TypeOfPresentation3d

Description
-----------
Returns information on whether the object accepts display in HLR mode or not.
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
Clears settings provided by the drawing tool aDrawer.
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
Removes color settings. Only the Interactive Object knows which Drawer attribute is affected by the color setting. For a wire, for example, wire aspect is the attribute affected. For a vertex, however, only point aspect is affected by the color setting.
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
Clears settings provided by the hilight drawing tool theDrawer.
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
Unsets highlight display mode. 
See also: HilightAttributes().
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
Removes the transparency setting. The object is opaque by default.
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
		/****** md5 signature: 3b1d43a3d00f5829c4cf473685b2e636 ******/
		%feature("compactdefaultargs") Width;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the width setting of the Interactive Object.
") Width;
		double Width();

		/****** PrsMgr_PresentableObject::ZLayer ******/
		/****** md5 signature: 7420fa5788bb824c02345ee38be45933 ******/
		%feature("compactdefaultargs") ZLayer;
		%feature("autodoc", "Return
-------
Graphic3d_ZLayerId

Description
-----------
Get ID of Z layer for main presentation.
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
		/****** md5 signature: 07d3ad9c3120c4c4cfdd4c2ef00f4c53 ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "
Parameters
----------
theWithDestruction: bool (optional, default to true)

Return
-------
None

Description
-----------
removes the whole content of the presentation. Does not remove the other connected presentations.
") Clear;
		void Clear(const bool theWithDestruction = true);

		/****** PrsMgr_Presentation::Compute ******/
		/****** md5 signature: 99c9e5bb8deeeb0450679c724c8f0175 ******/
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "Return
-------
None

Description
-----------
Compute structure using presentation manager.
") Compute;
		void Compute();

		/****** PrsMgr_Presentation::Display ******/
		/****** md5 signature: 903842dd9d893c15b89378195682475b ******/
		%feature("compactdefaultargs") Display;
		%feature("autodoc", "Return
-------
None

Description
-----------
Display structure.
") Display;
		void Display();


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
		/****** md5 signature: 95546e544a80eb5699868e737e72e695 ******/
		%feature("compactdefaultargs") Erase;
		%feature("autodoc", "Return
-------
None

Description
-----------
Remove structure.
") Erase;
		void Erase();

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
		/****** md5 signature: 5341f0de80e92e0a414a67993afca9ef ******/
		%feature("compactdefaultargs") IsDisplayed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return True if structure has been displayed and in no hidden state.
") IsDisplayed;
		bool IsDisplayed();

		/****** PrsMgr_Presentation::Mode ******/
		/****** md5 signature: 09d98ebbe6bcf8e23b5b0e49c47a4193 ******/
		%feature("compactdefaultargs") Mode;
		%feature("autodoc", "Return
-------
int

Description
-----------
Return display mode index.
") Mode;
		int Mode();

		/****** PrsMgr_Presentation::MustBeUpdated ******/
		/****** md5 signature: 98efe928d800c2b49d00b9ac1b727cdf ******/
		%feature("compactdefaultargs") MustBeUpdated;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") MustBeUpdated;
		bool MustBeUpdated();

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
returns the PresentationManager in which the presentation has been created.
") PresentationManager;
		const opencascade::handle<PrsMgr_PresentationManager> & PresentationManager();

		/****** PrsMgr_Presentation::SetUpdateStatus ******/
		/****** md5 signature: 380184053efd836a4b9f905a66bcc2f2 ******/
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
		void SetUpdateStatus(const bool theUpdateStatus);

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
Creates a framework to manage displays and graphic entities with the 3D view theStructureManager.
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
Stores thePrs in the transient list of presentations to be displayed in immediate mode. Will be taken in account in EndImmediateDraw method.
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
Resets the transient list of presentations previously displayed in immediate mode and begins accumulation of new list by following AddToImmediateList()/Color()/Highlight() calls.
") BeginImmediateDraw;
		void BeginImmediateDraw();

		/****** PrsMgr_PresentationManager::Clear ******/
		/****** md5 signature: 6cdf2d5351563f36f6f5c1ab79f7f724 ******/
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
Clears the presentation of the presentable object thePrsObject in this framework with the display mode theMode.
") Clear;
		virtual void Clear(const opencascade::handle<PrsMgr_PresentableObject> & thePrsObject, const int theMode = 0);

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
		/****** md5 signature: 460f83d8a0e073d7dedbb25ed37ce549 ******/
		%feature("compactdefaultargs") Color;
		%feature("autodoc", "
Parameters
----------
thePrsObject: PrsMgr_PresentableObject
theStyle: Prs3d_Drawer
theMode: int (optional, default to 0)
theSelObj: PrsMgr_PresentableObject (optional, default to nullptr)
theImmediateStructLayerId: int (optional, default to Graphic3d_ZLayerId_Topmost)

Return
-------
None

Description
-----------
Highlights the graphic object thePrsObject in the color theColor. thePrsObject has the display mode theMode; this has the default value of 0, that is, the wireframe display mode.
") Color;
		void Color(const opencascade::handle<PrsMgr_PresentableObject> & thePrsObject, const opencascade::handle<Prs3d_Drawer> & theStyle, const int theMode = 0, const opencascade::handle<PrsMgr_PresentableObject> & theSelObj = nullptr, int theImmediateStructLayerId = Graphic3d_ZLayerId_Topmost);

		/****** PrsMgr_PresentationManager::Connect ******/
		/****** md5 signature: 740319274ccc6f84ca48a956ff259870 ******/
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
		void Connect(const opencascade::handle<PrsMgr_PresentableObject> & thePrsObject, const opencascade::handle<PrsMgr_PresentableObject> & theOtherObject, const int theMode = 0, const int theOtherMode = 0);

		/****** PrsMgr_PresentationManager::Display ******/
		/****** md5 signature: 50f51ea7c584bf78b6d384fddc08b35e ******/
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
Displays the presentation of the object in the given Presentation manager with the given mode. The mode should be enumerated by the object which inherits PresentableObject.
") Display;
		void Display(const opencascade::handle<PrsMgr_PresentableObject> & thePrsObject, const int theMode = 0);

		/****** PrsMgr_PresentationManager::DisplayPriority ******/
		/****** md5 signature: c77ff653811a24ba29108bdf9cb40095 ******/
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
Returns the display priority of the presentable object thePrsObject in this framework with the display mode theMode.
") DisplayPriority;
		Graphic3d_DisplayPriority DisplayPriority(const opencascade::handle<PrsMgr_PresentableObject> & thePrsObject, const int theMode);

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
Allows rapid drawing of the each view in theViewer by avoiding an update of the whole background.
") EndImmediateDraw;
		void EndImmediateDraw(const opencascade::handle<V3d_Viewer> & theViewer);

		/****** PrsMgr_PresentationManager::Erase ******/
		/****** md5 signature: 79838abfd45a99771787aadfba0b646d ******/
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
erases the presentation of the object in the given Presentation manager with the given mode. If @theMode is -1, then erases all presentations of the object.
") Erase;
		void Erase(const opencascade::handle<PrsMgr_PresentableObject> & thePrsObject, const int theMode = 0);

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
Get Z layer ID assigned to all presentations of the object. Method returns -1 value if object has no presentations and is impossible to get layer index.
") GetZLayer;
		Graphic3d_ZLayerId GetZLayer(const opencascade::handle<PrsMgr_PresentableObject> & thePrsObject);

		/****** PrsMgr_PresentationManager::HasPresentation ******/
		/****** md5 signature: e4ceae78ce20802d059994ca602115ef ******/
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
Returns true if there is a presentation of the presentable object thePrsObject in this framework, thePrsObject having the display mode theMode.
") HasPresentation;
		bool HasPresentation(const opencascade::handle<PrsMgr_PresentableObject> & thePrsObject, const int theMode = 0);

		/****** PrsMgr_PresentationManager::IsDisplayed ******/
		/****** md5 signature: c7648ec097c59f25079120e4077e89f8 ******/
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
		bool IsDisplayed(const opencascade::handle<PrsMgr_PresentableObject> & thePrsObject, const int theMode = 0);

		/****** PrsMgr_PresentationManager::IsHighlighted ******/
		/****** md5 signature: d809329816bbbc3fd1d15479bc40e927 ******/
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
Returns true if the presentation of the presentable object thePrsObject in this framework with the display mode theMode is highlighted.
") IsHighlighted;
		bool IsHighlighted(const opencascade::handle<PrsMgr_PresentableObject> & thePrsObject, const int theMode = 0);

		/****** PrsMgr_PresentationManager::IsImmediateModeOn ******/
		/****** md5 signature: fd4935f8b4223a6c066f9e5dda12e65a ******/
		%feature("compactdefaultargs") IsImmediateModeOn;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if Presentation Manager is accumulating transient list of presentations to be displayed in immediate mode.
") IsImmediateModeOn;
		bool IsImmediateModeOn();

		/****** PrsMgr_PresentationManager::Presentation ******/
		/****** md5 signature: 391af3a9820d998377e82b93c8b969e7 ******/
		%feature("compactdefaultargs") Presentation;
		%feature("autodoc", "
Parameters
----------
thePrsObject: PrsMgr_PresentableObject
theMode: int (optional, default to 0)
theToCreate: bool (optional, default to false)
theSelObj: PrsMgr_PresentableObject (optional, default to nullptr)

Return
-------
opencascade::handle<PrsMgr_Presentation>

Description
-----------
Returns the presentation Presentation of the presentable object thePrsObject in this framework. When theToCreate is true - automatically creates presentation for specified mode when not exist. Optional argument theSelObj specifies parent decomposed object to inherit its view affinity.
") Presentation;
		opencascade::handle<PrsMgr_Presentation> Presentation(const opencascade::handle<PrsMgr_PresentableObject> & thePrsObject, const int theMode = 0, const bool theToCreate = false, const opencascade::handle<PrsMgr_PresentableObject> & theSelObj = nullptr);

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
		/****** md5 signature: b1e67b4a191e25cd5f98bf828902f6e8 ******/
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
Sets the display priority theNewPrior of the presentable object thePrsObject in this framework with the display mode theMode.
") SetDisplayPriority;
		void SetDisplayPriority(const opencascade::handle<PrsMgr_PresentableObject> & thePrsObject, const int theMode, const Graphic3d_DisplayPriority theNewPrior);

		/****** PrsMgr_PresentationManager::SetVisibility ******/
		/****** md5 signature: 89a3a17ef69bb280b4264b9504d1320d ******/
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
		void SetVisibility(const opencascade::handle<PrsMgr_PresentableObject> & thePrsObject, const int theMode, const bool theValue);

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
Set Z layer ID for all presentations of the object.
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
		/****** md5 signature: 506ed89073277fbca34c9649610d7dd4 ******/
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
Sets the transformation theTransformation for the presentable object thePrsObject. thePrsObject has the display mode theMode; this has the default value of 0, that is, the wireframe display mode.
") Transform;
		void Transform(const opencascade::handle<PrsMgr_PresentableObject> & thePrsObject, const opencascade::handle<TopLoc_Datum3D> & theTransformation, const int theMode = 0);

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
		/****** md5 signature: 8a6ab2b22e6bbf8f0f21a7f055321d1e ******/
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
Updates the presentation of the presentable object thePrsObject in this framework with the display mode theMode.
") Update;
		void Update(const opencascade::handle<PrsMgr_PresentableObject> & thePrsObject, const int theMode = 0);

		/****** PrsMgr_PresentationManager::UpdateHighlightTrsf ******/
		/****** md5 signature: d1aacf30bbce749bacc7569bcd8063d2 ******/
		%feature("compactdefaultargs") UpdateHighlightTrsf;
		%feature("autodoc", "
Parameters
----------
theViewer: V3d_Viewer
theObj: PrsMgr_PresentableObject
theMode: int (optional, default to 0)
theSelObj: PrsMgr_PresentableObject (optional, default to nullptr)

Return
-------
None

Description
-----------
Allows to apply location transformation to shadow highlight presentation immediately. 
Parameter theObj defines the base object, it local transformation will be applied to corresponding highlight structure 
Parameter theMode defines display mode of the base object 
Parameter theSelObj defines the object produced after decomposition of the base object for local selection.
") UpdateHighlightTrsf;
		void UpdateHighlightTrsf(const opencascade::handle<V3d_Viewer> & theViewer, const opencascade::handle<PrsMgr_PresentableObject> & theObj, const int theMode = 0, const opencascade::handle<PrsMgr_PresentableObject> & theSelObj = nullptr);

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
}
