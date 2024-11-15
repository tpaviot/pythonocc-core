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
%define SELECTMGRDOCSTRING
"SelectMgr module, see official documentation at
https://dev.opencascade.org/doc/occt-7.8.0/refman/html/package_selectmgr.html"
%enddef
%module (package="OCC.Core", docstring=SELECTMGRDOCSTRING) SelectMgr


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
#include<SelectMgr_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<Graphic3d_module.hxx>
#include<gp_module.hxx>
#include<Select3D_module.hxx>
#include<SelectBasics_module.hxx>
#include<TColgp_module.hxx>
#include<PrsMgr_module.hxx>
#include<Aspect_module.hxx>
#include<Prs3d_module.hxx>
#include<TopLoc_module.hxx>
#include<V3d_module.hxx>
#include<TopAbs_module.hxx>
#include<Bnd_module.hxx>
#include<BVH_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<TopTools_module.hxx>
#include<Message_module.hxx>
#include<TShort_module.hxx>
#include<SelectBasics_module.hxx>
#include<gp_module.hxx>
#include<HLRAlgo_module.hxx>
#include<TColQuantity_module.hxx>
#include<Geom_module.hxx>
#include<Aspect_module.hxx>
#include<Poly_module.hxx>
#include<TopoDS_module.hxx>
#include<V3d_module.hxx>
#include<Select3D_module.hxx>
#include<Graphic3d_module.hxx>
#include<Quantity_module.hxx>
#include<BVH_module.hxx>
#include<Prs3d_module.hxx>
#include<Media_module.hxx>
#include<BRep_module.hxx>
#include<Geom2d_module.hxx>
#include<StdPrs_module.hxx>
#include<GeomAdaptor_module.hxx>
#include<Adaptor2d_module.hxx>
#include<BRepAdaptor_module.hxx>
#include<Adaptor3d_module.hxx>
#include<StdSelect_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import Graphic3d.i
%import gp.i
%import Select3D.i
%import SelectBasics.i
%import TColgp.i
%import PrsMgr.i
%import Aspect.i
%import Prs3d.i
%import TopLoc.i
%import V3d.i
%import TopAbs.i
%import Bnd.i
%import BVH.i
%import TColStd.i
%import TCollection.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
enum SelectMgr_FilterType {
	SelectMgr_FilterType_AND = 0,
	SelectMgr_FilterType_OR = 1,
};

enum SelectMgr_PickingStrategy {
	SelectMgr_PickingStrategy_FirstAcceptable = 0,
	SelectMgr_PickingStrategy_OnlyTopmost = 1,
};

enum SelectMgr_SelectionType {
	SelectMgr_SelectionType_Unknown = - 1,
	SelectMgr_SelectionType_Point = 1,
	SelectMgr_SelectionType_Box = 2,
	SelectMgr_SelectionType_Polyline = 3,
};

enum SelectMgr_StateOfSelection {
	SelectMgr_SOS_Any = - 2,
	SelectMgr_SOS_Unknown = - 1,
	SelectMgr_SOS_Deactivated = 0,
	SelectMgr_SOS_Activated = 1,
};

enum SelectMgr_TypeOfBVHUpdate {
	SelectMgr_TBU_Add = 0,
	SelectMgr_TBU_Remove = 1,
	SelectMgr_TBU_Renew = 2,
	SelectMgr_TBU_Invalidate = 3,
	SelectMgr_TBU_None = 4,
};

enum SelectMgr_TypeOfDepthTolerance {
	SelectMgr_TypeOfDepthTolerance_Uniform = 0,
	SelectMgr_TypeOfDepthTolerance_UniformPixels = 1,
	SelectMgr_TypeOfDepthTolerance_SensitivityFactor = 2,
};

enum SelectMgr_TypeOfUpdate {
	SelectMgr_TOU_Full = 0,
	SelectMgr_TOU_Partial = 1,
	SelectMgr_TOU_None = 2,
};

/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {

class SelectMgr_FilterType(IntEnum):
	SelectMgr_FilterType_AND = 0
	SelectMgr_FilterType_OR = 1
SelectMgr_FilterType_AND = SelectMgr_FilterType.SelectMgr_FilterType_AND
SelectMgr_FilterType_OR = SelectMgr_FilterType.SelectMgr_FilterType_OR

class SelectMgr_PickingStrategy(IntEnum):
	SelectMgr_PickingStrategy_FirstAcceptable = 0
	SelectMgr_PickingStrategy_OnlyTopmost = 1
SelectMgr_PickingStrategy_FirstAcceptable = SelectMgr_PickingStrategy.SelectMgr_PickingStrategy_FirstAcceptable
SelectMgr_PickingStrategy_OnlyTopmost = SelectMgr_PickingStrategy.SelectMgr_PickingStrategy_OnlyTopmost

class SelectMgr_SelectionType(IntEnum):
	SelectMgr_SelectionType_Unknown = - 1
	SelectMgr_SelectionType_Point = 1
	SelectMgr_SelectionType_Box = 2
	SelectMgr_SelectionType_Polyline = 3
SelectMgr_SelectionType_Unknown = SelectMgr_SelectionType.SelectMgr_SelectionType_Unknown
SelectMgr_SelectionType_Point = SelectMgr_SelectionType.SelectMgr_SelectionType_Point
SelectMgr_SelectionType_Box = SelectMgr_SelectionType.SelectMgr_SelectionType_Box
SelectMgr_SelectionType_Polyline = SelectMgr_SelectionType.SelectMgr_SelectionType_Polyline

class SelectMgr_StateOfSelection(IntEnum):
	SelectMgr_SOS_Any = - 2
	SelectMgr_SOS_Unknown = - 1
	SelectMgr_SOS_Deactivated = 0
	SelectMgr_SOS_Activated = 1
SelectMgr_SOS_Any = SelectMgr_StateOfSelection.SelectMgr_SOS_Any
SelectMgr_SOS_Unknown = SelectMgr_StateOfSelection.SelectMgr_SOS_Unknown
SelectMgr_SOS_Deactivated = SelectMgr_StateOfSelection.SelectMgr_SOS_Deactivated
SelectMgr_SOS_Activated = SelectMgr_StateOfSelection.SelectMgr_SOS_Activated

class SelectMgr_TypeOfBVHUpdate(IntEnum):
	SelectMgr_TBU_Add = 0
	SelectMgr_TBU_Remove = 1
	SelectMgr_TBU_Renew = 2
	SelectMgr_TBU_Invalidate = 3
	SelectMgr_TBU_None = 4
SelectMgr_TBU_Add = SelectMgr_TypeOfBVHUpdate.SelectMgr_TBU_Add
SelectMgr_TBU_Remove = SelectMgr_TypeOfBVHUpdate.SelectMgr_TBU_Remove
SelectMgr_TBU_Renew = SelectMgr_TypeOfBVHUpdate.SelectMgr_TBU_Renew
SelectMgr_TBU_Invalidate = SelectMgr_TypeOfBVHUpdate.SelectMgr_TBU_Invalidate
SelectMgr_TBU_None = SelectMgr_TypeOfBVHUpdate.SelectMgr_TBU_None

class SelectMgr_TypeOfDepthTolerance(IntEnum):
	SelectMgr_TypeOfDepthTolerance_Uniform = 0
	SelectMgr_TypeOfDepthTolerance_UniformPixels = 1
	SelectMgr_TypeOfDepthTolerance_SensitivityFactor = 2
SelectMgr_TypeOfDepthTolerance_Uniform = SelectMgr_TypeOfDepthTolerance.SelectMgr_TypeOfDepthTolerance_Uniform
SelectMgr_TypeOfDepthTolerance_UniformPixels = SelectMgr_TypeOfDepthTolerance.SelectMgr_TypeOfDepthTolerance_UniformPixels
SelectMgr_TypeOfDepthTolerance_SensitivityFactor = SelectMgr_TypeOfDepthTolerance.SelectMgr_TypeOfDepthTolerance_SensitivityFactor

class SelectMgr_TypeOfUpdate(IntEnum):
	SelectMgr_TOU_Full = 0
	SelectMgr_TOU_Partial = 1
	SelectMgr_TOU_None = 2
SelectMgr_TOU_Full = SelectMgr_TypeOfUpdate.SelectMgr_TOU_Full
SelectMgr_TOU_Partial = SelectMgr_TypeOfUpdate.SelectMgr_TOU_Partial
SelectMgr_TOU_None = SelectMgr_TypeOfUpdate.SelectMgr_TOU_None
};
/* end python proxy for enums */

/* handles */
%wrap_handle(SelectMgr_BVHThreadPool)
%wrap_handle(SelectMgr_BaseIntersector)
%wrap_handle(SelectMgr_EntityOwner)
%wrap_handle(SelectMgr_Filter)
%wrap_handle(SelectMgr_FrustumBuilder)
%wrap_handle(SelectMgr_SelectableObject)
%wrap_handle(SelectMgr_Selection)
%wrap_handle(SelectMgr_SelectionImageFiller)
%wrap_handle(SelectMgr_SelectionManager)
%wrap_handle(SelectMgr_SensitiveEntity)
%wrap_handle(SelectMgr_ViewerSelector)
%wrap_handle(SelectMgr_AxisIntersector)
%wrap_handle(SelectMgr_CompositionFilter)
%wrap_handle(SelectMgr_AndFilter)
%wrap_handle(SelectMgr_AndOrFilter)
%wrap_handle(SelectMgr_OrFilter)
/* end handles declaration */

/* templates */
%template(SelectMgr_FrustumCache) NCollection_DataMap<Standard_Integer,SelectMgr_SelectingVolumeManager>;

%extend NCollection_DataMap<Standard_Integer,SelectMgr_SelectingVolumeManager> {
    PyObject* Keys() {
        PyObject *l=PyList_New(0);
        for (SelectMgr_FrustumCache::Iterator anIt1(*self); anIt1.More(); anIt1.Next()) {
          PyObject *o = PyLong_FromLong(anIt1.Key());
          PyList_Append(l, o);
          Py_DECREF(o);
        }
    return l;
    }
};
%template(SelectMgr_IndexedDataMapOfOwnerCriterion) NCollection_IndexedDataMap<opencascade::handle<SelectMgr_EntityOwner>,SelectMgr_SortCriterion>;
%template(SelectMgr_IndexedMapOfHSensitive) NCollection_IndexedMap<opencascade::handle<SelectMgr_SensitiveEntity>>;
%template(SelectMgr_ListIteratorOfListOfFilter) NCollection_TListIterator<opencascade::handle<SelectMgr_Filter>>;
%template(SelectMgr_ListOfFilter) NCollection_List<opencascade::handle<SelectMgr_Filter>>;

%extend NCollection_List<opencascade::handle<SelectMgr_Filter>> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(SelectMgr_MapOfOwners) NCollection_DataMap<opencascade::handle<SelectMgr_EntityOwner>,Standard_Integer>;
%template(SelectMgr_Mat4) NCollection_Mat4<Standard_Real>;
%template(SelectMgr_SequenceOfOwner) NCollection_Sequence<opencascade::handle<SelectMgr_EntityOwner>>;

%extend NCollection_Sequence<opencascade::handle<SelectMgr_EntityOwner>> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(SelectMgr_SequenceOfSelection) NCollection_Sequence<opencascade::handle<SelectMgr_Selection>>;

%extend NCollection_Sequence<opencascade::handle<SelectMgr_Selection>> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(SelectMgr_Vec3) NCollection_Vec3<Standard_Real>;
%template(SelectMgr_Vec4) NCollection_Vec4<Standard_Real>;
/* end templates declaration */

/* typedefs */
typedef SelectMgr_EntityOwner SelectBasics_EntityOwner;
typedef NCollection_DataMap<Standard_Integer, SelectMgr_SelectingVolumeManager> SelectMgr_FrustumCache;
typedef NCollection_IndexedDataMap<opencascade::handle<SelectMgr_EntityOwner>, SelectMgr_SortCriterion> SelectMgr_IndexedDataMapOfOwnerCriterion;
typedef NCollection_IndexedMap<opencascade::handle<SelectMgr_SensitiveEntity>> SelectMgr_IndexedMapOfHSensitive;
typedef NCollection_Shared<NCollection_IndexedMap<opencascade::handle<SelectMgr_EntityOwner>>> SelectMgr_IndexedMapOfOwner;
typedef NCollection_List<opencascade::handle<SelectMgr_Filter>>::Iterator SelectMgr_ListIteratorOfListOfFilter;
typedef NCollection_List<opencascade::handle<SelectMgr_Filter>> SelectMgr_ListOfFilter;
typedef NCollection_DataMap<opencascade::handle<SelectMgr_SelectableObject>, opencascade::handle<SelectMgr_SensitiveEntitySet>>::Iterator SelectMgr_MapOfObjectSensitivesIterator;
typedef NCollection_DataMap<opencascade::handle<SelectMgr_EntityOwner>, Standard_Integer> SelectMgr_MapOfOwners;
typedef NCollection_Mat4<Standard_Real> SelectMgr_Mat4;
typedef NCollection_Sequence<opencascade::handle<SelectMgr_EntityOwner>> SelectMgr_SequenceOfOwner;
typedef NCollection_Sequence<opencascade::handle<SelectMgr_Selection>> SelectMgr_SequenceOfSelection;
typedef NCollection_Vec3<Standard_Real> SelectMgr_Vec3;
typedef NCollection_Vec4<Standard_Real> SelectMgr_Vec4;
/* end typedefs declaration */

/******************
* class SelectMgr *
******************/
%rename(selectmgr) SelectMgr;
class SelectMgr {
	public:
		/****** SelectMgr::ComputeSensitivePrs ******/
		/****** md5 signature: 83aa1db16781f8f9580185126db70a0c ******/
		%feature("compactdefaultargs") ComputeSensitivePrs;
		%feature("autodoc", "
Parameters
----------
theStructure: Graphic3d_Structure
theSel: SelectMgr_Selection
theLoc: gp_Trsf
theTrsfPers: Graphic3d_TransformPers

Return
-------
None

Description
-----------
Compute debug presentation for sensitive objects.
") ComputeSensitivePrs;
		static void ComputeSensitivePrs(const opencascade::handle<Graphic3d_Structure> & theStructure, const opencascade::handle<SelectMgr_Selection> & theSel, const gp_Trsf & theLoc, const opencascade::handle<Graphic3d_TransformPers> & theTrsfPers);

};


%extend SelectMgr {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class SelectMgr_BVHThreadPool *
********************************/
class SelectMgr_BVHThreadPool : public Standard_Transient {
	public:
		class BVHThread {};
		class Sentry {};
		/****** SelectMgr_BVHThreadPool::SelectMgr_BVHThreadPool ******/
		/****** md5 signature: 889952e84af73e98ba9a37fe92adadac ******/
		%feature("compactdefaultargs") SelectMgr_BVHThreadPool;
		%feature("autodoc", "
Parameters
----------
theNbThreads: int

Return
-------
None

Description
-----------
Main constructor.
") SelectMgr_BVHThreadPool;
		 SelectMgr_BVHThreadPool(Standard_Integer theNbThreads);

		/****** SelectMgr_BVHThreadPool::AddEntity ******/
		/****** md5 signature: 9d91f86811aba2ad0d46968725fccc5d ******/
		%feature("compactdefaultargs") AddEntity;
		%feature("autodoc", "
Parameters
----------
theEntity: Select3D_SensitiveEntity

Return
-------
None

Description
-----------
Queue a sensitive entity to build its bvh.
") AddEntity;
		void AddEntity(const opencascade::handle<Select3D_SensitiveEntity> & theEntity);

		/****** SelectMgr_BVHThreadPool::StopThreads ******/
		/****** md5 signature: b9c1b1dc0d0256795b25abd649056b2c ******/
		%feature("compactdefaultargs") StopThreads;
		%feature("autodoc", "Return
-------
None

Description
-----------
Stops threads.
") StopThreads;
		void StopThreads();

		/****** SelectMgr_BVHThreadPool::Threads ******/
		/****** md5 signature: 94f882b6bc1c488f6ee23d7bf072e378 ******/
		%feature("compactdefaultargs") Threads;
		%feature("autodoc", "Return
-------
NCollection_Array1<BVHThread>

Description
-----------
Returns array of threads.
") Threads;
		NCollection_Array1<BVHThread> & Threads();

		/****** SelectMgr_BVHThreadPool::WaitThreads ******/
		/****** md5 signature: d1876c753ae5775efae9bbfb9449dc60 ******/
		%feature("compactdefaultargs") WaitThreads;
		%feature("autodoc", "Return
-------
None

Description
-----------
Waits for all threads finish their jobs.
") WaitThreads;
		void WaitThreads();

};


%make_alias(SelectMgr_BVHThreadPool)

%extend SelectMgr_BVHThreadPool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class SelectMgr_BaseIntersector *
**********************************/
%nodefaultctor SelectMgr_BaseIntersector;
class SelectMgr_BaseIntersector : public Standard_Transient {
	public:
		/****** SelectMgr_BaseIntersector::Build ******/
		/****** md5 signature: a41bf8256f32ce9506d69a52d250386f ******/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "Return
-------
None

Description
-----------
Builds intersector according to internal parameters.
") Build;
		virtual void Build();

		/****** SelectMgr_BaseIntersector::Camera ******/
		/****** md5 signature: 9722357b74290d4bf6f13f9113469012 ******/
		%feature("compactdefaultargs") Camera;
		%feature("autodoc", "Return
-------
opencascade::handle<Graphic3d_Camera>

Description
-----------
Return camera definition.
") Camera;
		const opencascade::handle<Graphic3d_Camera> & Camera();

		/****** SelectMgr_BaseIntersector::DetectedPoint ******/
		/****** md5 signature: 6c6688b42e6b7c576329ada82a48bca7 ******/
		%feature("compactdefaultargs") DetectedPoint;
		%feature("autodoc", "
Parameters
----------
theDepth: float

Return
-------
gp_Pnt

Description
-----------
Calculates the point on a view ray that was detected during the run of selection algo by given depth. it makes sense only for intersectors built on a single point. this method returns infinite point for the base class.
") DetectedPoint;
		virtual gp_Pnt DetectedPoint(const Standard_Real theDepth);

		/****** SelectMgr_BaseIntersector::DistToGeometryCenter ******/
		/****** md5 signature: d05c069bc0dac1d0061914d9064f5c6b ******/
		%feature("compactdefaultargs") DistToGeometryCenter;
		%feature("autodoc", "
Parameters
----------
theCOG: gp_Pnt

Return
-------
float

Description
-----------
Measures distance between 3d projection of user-picked screen point and given point thecog. it makes sense only for intersectors built on a single point. this method returns infinite value for the base class.
") DistToGeometryCenter;
		virtual Standard_Real DistToGeometryCenter(const gp_Pnt & theCOG);


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
		/****** SelectMgr_BaseIntersector::GetFarPnt ******/
		/****** md5 signature: 3e36f446d09a687c0f4c947199de3fba ******/
		%feature("compactdefaultargs") GetFarPnt;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Returns far point of intersector. this method returns zero point for the base class.
") GetFarPnt;
		virtual const gp_Pnt GetFarPnt();

		/****** SelectMgr_BaseIntersector::GetMousePosition ******/
		/****** md5 signature: f0999a81a45c2c3d9eb21b1ee061e7e0 ******/
		%feature("compactdefaultargs") GetMousePosition;
		%feature("autodoc", "Return
-------
gp_Pnt2d

Description
-----------
Returns current mouse coordinates. this method returns infinite point for the base class.
") GetMousePosition;
		virtual const gp_Pnt2d GetMousePosition();

		/****** SelectMgr_BaseIntersector::GetNearPnt ******/
		/****** md5 signature: 17d67816021feab183a1521372f11473 ******/
		%feature("compactdefaultargs") GetNearPnt;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Returns near point of intersector. this method returns zero point for the base class.
") GetNearPnt;
		virtual const gp_Pnt GetNearPnt();

		/****** SelectMgr_BaseIntersector::GetPlanes ******/
		/****** md5 signature: b90140b2ac0c4c0502829a7ff8252d2c ******/
		%feature("compactdefaultargs") GetPlanes;
		%feature("autodoc", "
Parameters
----------
thePlaneEquations: NCollection_Vector<SelectMgr_Vec4>

Return
-------
None

Description
-----------
Stores plane equation coefficients (in the following form: ax + by + cz + d = 0) to the given vector. this method only clears input vector for the base class.
") GetPlanes;
		virtual void GetPlanes(NCollection_Vector<SelectMgr_Vec4> & thePlaneEquations);

		/****** SelectMgr_BaseIntersector::GetSelectionType ******/
		/****** md5 signature: 8a2f723381b539ff3ca96048a6b87ecc ******/
		%feature("compactdefaultargs") GetSelectionType;
		%feature("autodoc", "Return
-------
SelectMgr_SelectionType

Description
-----------
Returns selection type of this intersector.
") GetSelectionType;
		SelectMgr_SelectionType GetSelectionType();

		/****** SelectMgr_BaseIntersector::GetViewRayDirection ******/
		/****** md5 signature: c751cf5028d4253b9ccc63b4a7d68a0c ******/
		%feature("compactdefaultargs") GetViewRayDirection;
		%feature("autodoc", "Return
-------
gp_Dir

Description
-----------
Returns direction ray of intersector. this method returns zero direction for the base class.
") GetViewRayDirection;
		virtual const gp_Dir GetViewRayDirection();

		/****** SelectMgr_BaseIntersector::IsScalable ******/
		/****** md5 signature: 9733a9bb15d124569350ae667909d84c ******/
		%feature("compactdefaultargs") IsScalable;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Checks if it is possible to scale this intersector.
") IsScalable;
		virtual Standard_Boolean IsScalable();

		/****** SelectMgr_BaseIntersector::OverlapsBox ******/
		/****** md5 signature: b3d8e238997ac67fa00f862c71d8fb5e ******/
		%feature("compactdefaultargs") OverlapsBox;
		%feature("autodoc", "
Parameters
----------
theBoxMin: SelectMgr_Vec3
theBoxMax: SelectMgr_Vec3
theClipRange: SelectMgr_ViewClipRange
thePickResult: SelectBasics_PickResult

Return
-------
bool

Description
-----------
Sat intersection test between defined volume and given axis-aligned box.
") OverlapsBox;
		virtual Standard_Boolean OverlapsBox(const SelectMgr_Vec3 & theBoxMin, const SelectMgr_Vec3 & theBoxMax, const SelectMgr_ViewClipRange & theClipRange, SelectBasics_PickResult & thePickResult);

		/****** SelectMgr_BaseIntersector::OverlapsBox ******/
		/****** md5 signature: 3333b0eb5ae7761f543fe228c538ee5b ******/
		%feature("compactdefaultargs") OverlapsBox;
		%feature("autodoc", "
Parameters
----------
theBoxMin: SelectMgr_Vec3
theBoxMax: SelectMgr_Vec3
theInside: bool * (optional, default to NULL)

Return
-------
bool

Description
-----------
Returns true if selecting volume is overlapped by axis-aligned bounding box with minimum corner at point theminpt and maximum at point themaxpt.
") OverlapsBox;
		virtual Standard_Boolean OverlapsBox(const SelectMgr_Vec3 & theBoxMin, const SelectMgr_Vec3 & theBoxMax, Standard_Boolean * theInside = NULL);

		/****** SelectMgr_BaseIntersector::OverlapsCircle ******/
		/****** md5 signature: 206bfdc4b7e301aeecd492ca5f0185bc ******/
		%feature("compactdefaultargs") OverlapsCircle;
		%feature("autodoc", "
Parameters
----------
theBottomRad: float
theTrsf: gp_Trsf
theIsFilled: bool
theClipRange: SelectMgr_ViewClipRange
thePickResult: SelectBasics_PickResult

Return
-------
bool

Description
-----------
Returns true if selecting volume is overlapped by circle with radius theradius, boolean theisfilled and transformation to apply thetrsf. the position and orientation of the circle are specified via thetrsf transformation for gp::xoy() with center in gp::origin().
") OverlapsCircle;
		virtual Standard_Boolean OverlapsCircle(const Standard_Real theBottomRad, const gp_Trsf & theTrsf, const Standard_Boolean theIsFilled, const SelectMgr_ViewClipRange & theClipRange, SelectBasics_PickResult & thePickResult);

		/****** SelectMgr_BaseIntersector::OverlapsCircle ******/
		/****** md5 signature: 1abe9cc1d4846ca0fa394e455d2b1adf ******/
		%feature("compactdefaultargs") OverlapsCircle;
		%feature("autodoc", "
Parameters
----------
theBottomRad: float
theTrsf: gp_Trsf
theIsFilled: bool
theInside: bool * (optional, default to NULL)

Return
-------
bool

Description
-----------
Returns true if selecting volume is overlapped by circle with radius theradius, boolean theisfilled and transformation to apply thetrsf. the position and orientation of the circle are specified via thetrsf transformation for gp::xoy() with center in gp::origin().
") OverlapsCircle;
		virtual Standard_Boolean OverlapsCircle(const Standard_Real theBottomRad, const gp_Trsf & theTrsf, const Standard_Boolean theIsFilled, Standard_Boolean * theInside = NULL);

		/****** SelectMgr_BaseIntersector::OverlapsCylinder ******/
		/****** md5 signature: 83169e4ace649687d3a32dae3d236230 ******/
		%feature("compactdefaultargs") OverlapsCylinder;
		%feature("autodoc", "
Parameters
----------
theBottomRad: float
theTopRad: float
theHeight: float
theTrsf: gp_Trsf
theIsHollow: bool
theClipRange: SelectMgr_ViewClipRange
thePickResult: SelectBasics_PickResult

Return
-------
bool

Description
-----------
Returns true if selecting volume is overlapped by cylinder (or cone) with radiuses thebottomrad and thetoprad, height theheight and transformation to apply thetrsf.
") OverlapsCylinder;
		virtual Standard_Boolean OverlapsCylinder(const Standard_Real theBottomRad, const Standard_Real theTopRad, const Standard_Real theHeight, const gp_Trsf & theTrsf, const Standard_Boolean theIsHollow, const SelectMgr_ViewClipRange & theClipRange, SelectBasics_PickResult & thePickResult);

		/****** SelectMgr_BaseIntersector::OverlapsCylinder ******/
		/****** md5 signature: 4ee34537f7f0591987b1ee29ed104939 ******/
		%feature("compactdefaultargs") OverlapsCylinder;
		%feature("autodoc", "
Parameters
----------
theBottomRad: float
theTopRad: float
theHeight: float
theTrsf: gp_Trsf
theIsHollow: bool
theInside: bool * (optional, default to NULL)

Return
-------
bool

Description
-----------
Returns true if selecting volume is overlapped by cylinder (or cone) with radiuses thebottomrad and thetoprad, height theheight and transformation to apply thetrsf.
") OverlapsCylinder;
		virtual Standard_Boolean OverlapsCylinder(const Standard_Real theBottomRad, const Standard_Real theTopRad, const Standard_Real theHeight, const gp_Trsf & theTrsf, const Standard_Boolean theIsHollow, Standard_Boolean * theInside = NULL);

		/****** SelectMgr_BaseIntersector::OverlapsPoint ******/
		/****** md5 signature: ca285b43cc259fcb46ff477678762dba ******/
		%feature("compactdefaultargs") OverlapsPoint;
		%feature("autodoc", "
Parameters
----------
thePnt: gp_Pnt
theClipRange: SelectMgr_ViewClipRange
thePickResult: SelectBasics_PickResult

Return
-------
bool

Description
-----------
Intersection test between defined volume and given point.
") OverlapsPoint;
		virtual Standard_Boolean OverlapsPoint(const gp_Pnt & thePnt, const SelectMgr_ViewClipRange & theClipRange, SelectBasics_PickResult & thePickResult);

		/****** SelectMgr_BaseIntersector::OverlapsPoint ******/
		/****** md5 signature: 7d294e46b6d94e1ca91f519f8b1d482d ******/
		%feature("compactdefaultargs") OverlapsPoint;
		%feature("autodoc", "
Parameters
----------
thePnt: gp_Pnt

Return
-------
bool

Description
-----------
Intersection test between defined volume and given point does not perform depth calculation, so this method is defined as helper function for inclusion test. therefore, its implementation makes sense only for rectangular frustum with box selection mode activated.
") OverlapsPoint;
		virtual Standard_Boolean OverlapsPoint(const gp_Pnt & thePnt);

		/****** SelectMgr_BaseIntersector::OverlapsPolygon ******/
		/****** md5 signature: ea879fc06a4c6f6d0a789b21bf9e01f2 ******/
		%feature("compactdefaultargs") OverlapsPolygon;
		%feature("autodoc", "
Parameters
----------
theArrayOfPnts: TColgp_Array1OfPnt
theSensType: Select3D_TypeOfSensitivity
theClipRange: SelectMgr_ViewClipRange
thePickResult: SelectBasics_PickResult

Return
-------
bool

Description
-----------
Sat intersection test between defined volume and given ordered set of points, representing line segments. the test may be considered of interior part or boundary line defined by segments depending on given sensitivity type.
") OverlapsPolygon;
		virtual Standard_Boolean OverlapsPolygon(const TColgp_Array1OfPnt & theArrayOfPnts, Select3D_TypeOfSensitivity theSensType, const SelectMgr_ViewClipRange & theClipRange, SelectBasics_PickResult & thePickResult);

		/****** SelectMgr_BaseIntersector::OverlapsSegment ******/
		/****** md5 signature: d402778adf591662c5989dc838ac2ca6 ******/
		%feature("compactdefaultargs") OverlapsSegment;
		%feature("autodoc", "
Parameters
----------
thePnt1: gp_Pnt
thePnt2: gp_Pnt
theClipRange: SelectMgr_ViewClipRange
thePickResult: SelectBasics_PickResult

Return
-------
bool

Description
-----------
Checks if line segment overlaps selecting frustum.
") OverlapsSegment;
		virtual Standard_Boolean OverlapsSegment(const gp_Pnt & thePnt1, const gp_Pnt & thePnt2, const SelectMgr_ViewClipRange & theClipRange, SelectBasics_PickResult & thePickResult);

		/****** SelectMgr_BaseIntersector::OverlapsSphere ******/
		/****** md5 signature: 32b443cedf236c938f70d5163436b508 ******/
		%feature("compactdefaultargs") OverlapsSphere;
		%feature("autodoc", "
Parameters
----------
theCenter: gp_Pnt
theRadius: float
theInside: bool * (optional, default to NULL)

Return
-------
bool

Description
-----------
Returns true if selecting volume is overlapped by sphere with center thecenter and radius theradius.
") OverlapsSphere;
		virtual Standard_Boolean OverlapsSphere(const gp_Pnt & theCenter, const Standard_Real theRadius, Standard_Boolean * theInside = NULL);

		/****** SelectMgr_BaseIntersector::OverlapsSphere ******/
		/****** md5 signature: 37997e5cd3caaa032de4ff44a63381ed ******/
		%feature("compactdefaultargs") OverlapsSphere;
		%feature("autodoc", "
Parameters
----------
theCenter: gp_Pnt
theRadius: float
theClipRange: SelectMgr_ViewClipRange
thePickResult: SelectBasics_PickResult

Return
-------
bool

Description
-----------
Returns true if selecting volume is overlapped by sphere with center thecenter and radius theradius.
") OverlapsSphere;
		virtual Standard_Boolean OverlapsSphere(const gp_Pnt & theCenter, const Standard_Real theRadius, const SelectMgr_ViewClipRange & theClipRange, SelectBasics_PickResult & thePickResult);

		/****** SelectMgr_BaseIntersector::OverlapsTriangle ******/
		/****** md5 signature: fc92c4fa04dc601ad98f7ee32291b96f ******/
		%feature("compactdefaultargs") OverlapsTriangle;
		%feature("autodoc", "
Parameters
----------
thePnt1: gp_Pnt
thePnt2: gp_Pnt
thePnt3: gp_Pnt
theSensType: Select3D_TypeOfSensitivity
theClipRange: SelectMgr_ViewClipRange
thePickResult: SelectBasics_PickResult

Return
-------
bool

Description
-----------
Sat intersection test between defined volume and given triangle. the test may be considered of interior part or boundary line defined by triangle vertices depending on given sensitivity type.
") OverlapsTriangle;
		virtual Standard_Boolean OverlapsTriangle(const gp_Pnt & thePnt1, const gp_Pnt & thePnt2, const gp_Pnt & thePnt3, Select3D_TypeOfSensitivity theSensType, const SelectMgr_ViewClipRange & theClipRange, SelectBasics_PickResult & thePickResult);

		/****** SelectMgr_BaseIntersector::RayCircleIntersection ******/
		/****** md5 signature: f7b27a6fdbfbae7f8fe47003f5b5b2d0 ******/
		%feature("compactdefaultargs") RayCircleIntersection;
		%feature("autodoc", "
Parameters
----------
theRadius: float
theLoc: gp_Pnt
theRayDir: gp_Dir
theIsFilled: bool

Return
-------
theTime: float

Description
-----------
Checks whether the ray that starts at the point theloc and directs with the direction theraydir intersects with the circle @param[in] theradius the circle radius @param[in] theloc the location of the ray @param[in] theraydir the ray direction @param[in] theisfilled true if it's a circle, false if it's a circle outline @param[out] thetime the intersection.
") RayCircleIntersection;
		virtual Standard_Boolean RayCircleIntersection(const Standard_Real theRadius, const gp_Pnt & theLoc, const gp_Dir & theRayDir, const Standard_Boolean theIsFilled, Standard_Real &OutValue);

		/****** SelectMgr_BaseIntersector::RayCylinderIntersection ******/
		/****** md5 signature: a23256a28d344ff902f092dac0bec76a ******/
		%feature("compactdefaultargs") RayCylinderIntersection;
		%feature("autodoc", "
Parameters
----------
theBottomRadius: float
theTopRadius: float
theHeight: float
theLoc: gp_Pnt
theRayDir: gp_Dir
theIsHollow: bool

Return
-------
theTimeEnter: float
theTimeLeave: float

Description
-----------
Checks whether the ray that starts at the point theloc and directs with the direction theraydir intersects with the hollow cylinder (or cone) @param[in] thebottomradius the bottom cylinder radius @param[in] thetopradius the top cylinder radius @param[in] theheight the cylinder height @param[in] theloc the location of the ray @param[in] theraydir the ray direction @param[in] theishollow true if the cylinder is hollow @param[out] thetimeenter the entering the intersection @param[out] thetimeleave the leaving the intersection.
") RayCylinderIntersection;
		virtual Standard_Boolean RayCylinderIntersection(const Standard_Real theBottomRadius, const Standard_Real theTopRadius, const Standard_Real theHeight, const gp_Pnt & theLoc, const gp_Dir & theRayDir, const Standard_Boolean theIsHollow, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** SelectMgr_BaseIntersector::RaySphereIntersection ******/
		/****** md5 signature: a447f92c1a753c60f95dacf06134d88f ******/
		%feature("compactdefaultargs") RaySphereIntersection;
		%feature("autodoc", "
Parameters
----------
theCenter: gp_Pnt
theRadius: float
theLoc: gp_Pnt
theRayDir: gp_Dir

Return
-------
theTimeEnter: float
theTimeLeave: float

Description
-----------
Checks whether the ray that starts at the point theloc and directs with the direction theraydir intersects with the sphere with center at thecenter and radius theradius.
") RaySphereIntersection;
		virtual Standard_Boolean RaySphereIntersection(const gp_Pnt & theCenter, const Standard_Real theRadius, const gp_Pnt & theLoc, const gp_Dir & theRayDir, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** SelectMgr_BaseIntersector::ScaleAndTransform ******/
		/****** md5 signature: 03f05921987bcd766b276d57220bf861 ******/
		%feature("compactdefaultargs") ScaleAndTransform;
		%feature("autodoc", "
Parameters
----------
theScaleFactor: int
theTrsf: gp_GTrsf
theBuilder: SelectMgr_FrustumBuilder

Return
-------
opencascade::handle<SelectMgr_BaseIntersector>

Description
-----------
Note that this method does not perform any checks on type of the frustum. @param thescalefactor [in] scale factor for new intersector or negative value if undefined;  important: scaling makes sense only for scalable ::isscalable() intersectors (built on a single point)! @param thetrsf [in] transformation for new intersector or gp_identity if undefined @param thebuilder [in] an optional argument that represents corresponding settings for re-constructing transformed frustum from scratch; could be null if reconstruction is not expected furthermore return a copy of the frustum resized according to the scale factor given and transforms it using the matrix given.
") ScaleAndTransform;
		virtual opencascade::handle<SelectMgr_BaseIntersector> ScaleAndTransform(const Standard_Integer theScaleFactor, const gp_GTrsf & theTrsf, const opencascade::handle<SelectMgr_FrustumBuilder> & theBuilder);

		/****** SelectMgr_BaseIntersector::SetCamera ******/
		/****** md5 signature: f2614c926a92a0a375328573f4288898 ******/
		%feature("compactdefaultargs") SetCamera;
		%feature("autodoc", "
Parameters
----------
theCamera: Graphic3d_Camera

Return
-------
None

Description
-----------
Saves camera definition.
") SetCamera;
		virtual void SetCamera(const opencascade::handle<Graphic3d_Camera> & theCamera);

		/****** SelectMgr_BaseIntersector::SetPixelTolerance ******/
		/****** md5 signature: ca5a8a26205f52e8a3a279a36ba509e4 ******/
		%feature("compactdefaultargs") SetPixelTolerance;
		%feature("autodoc", "
Parameters
----------
theTol: int

Return
-------
None

Description
-----------
Sets pixel tolerance. it makes sense only for scalable intersectors (built on a single point). this method does nothing for the base class.
") SetPixelTolerance;
		virtual void SetPixelTolerance(const Standard_Integer theTol);

		/****** SelectMgr_BaseIntersector::SetViewport ******/
		/****** md5 signature: 35321000dbfc7f82f14ef5defb456d2f ******/
		%feature("compactdefaultargs") SetViewport;
		%feature("autodoc", "
Parameters
----------
theX: float
theY: float
theWidth: float
theHeight: float

Return
-------
None

Description
-----------
Sets viewport parameters. this method does nothing for the base class.
") SetViewport;
		virtual void SetViewport(const Standard_Real theX, const Standard_Real theY, const Standard_Real theWidth, const Standard_Real theHeight);

		/****** SelectMgr_BaseIntersector::SetWindowSize ******/
		/****** md5 signature: d28d2507e21d13e97ddcec9b2c59cbb2 ******/
		%feature("compactdefaultargs") SetWindowSize;
		%feature("autodoc", "
Parameters
----------
theWidth: int
theHeight: int

Return
-------
None

Description
-----------
Sets current window size. this method does nothing for the base class.
") SetWindowSize;
		virtual void SetWindowSize(const Standard_Integer theWidth, const Standard_Integer theHeight);

		/****** SelectMgr_BaseIntersector::WindowSize ******/
		/****** md5 signature: 6027bd72564d44492379be31be79c1f6 ******/
		%feature("compactdefaultargs") WindowSize;
		%feature("autodoc", "
Parameters
----------

Return
-------
theWidth: int
theHeight: int

Description
-----------
Returns current window size. this method doesn't set any output values for the base class.
") WindowSize;
		virtual void WindowSize(Standard_Integer &OutValue, Standard_Integer &OutValue);

};


%make_alias(SelectMgr_BaseIntersector)

%extend SelectMgr_BaseIntersector {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class SelectMgr_EntityOwner *
******************************/
class SelectMgr_EntityOwner : public Standard_Transient {
	public:
		/****** SelectMgr_EntityOwner::SelectMgr_EntityOwner ******/
		/****** md5 signature: 35168c30f579c463b76f662a6c83bb98 ******/
		%feature("compactdefaultargs") SelectMgr_EntityOwner;
		%feature("autodoc", "
Parameters
----------
aPriority: int (optional, default to 0)

Return
-------
None

Description
-----------
Initializes the selection priority apriority.
") SelectMgr_EntityOwner;
		 SelectMgr_EntityOwner(const Standard_Integer aPriority = 0);

		/****** SelectMgr_EntityOwner::SelectMgr_EntityOwner ******/
		/****** md5 signature: 49230bdc1e89f7028e9f12f710ed7815 ******/
		%feature("compactdefaultargs") SelectMgr_EntityOwner;
		%feature("autodoc", "
Parameters
----------
aSO: SelectMgr_SelectableObject
aPriority: int (optional, default to 0)

Return
-------
None

Description
-----------
Constructs a framework with the selectable object anso being attributed the selection priority apriority.
") SelectMgr_EntityOwner;
		 SelectMgr_EntityOwner(const opencascade::handle<SelectMgr_SelectableObject> & aSO, const Standard_Integer aPriority = 0);

		/****** SelectMgr_EntityOwner::SelectMgr_EntityOwner ******/
		/****** md5 signature: 963caefd0a499900c1583ec550ee8e1f ******/
		%feature("compactdefaultargs") SelectMgr_EntityOwner;
		%feature("autodoc", "
Parameters
----------
theOwner: SelectMgr_EntityOwner
aPriority: int (optional, default to 0)

Return
-------
None

Description
-----------
Constructs a framework from existing one anso being attributed the selection priority apriority.
") SelectMgr_EntityOwner;
		 SelectMgr_EntityOwner(const opencascade::handle<SelectMgr_EntityOwner> & theOwner, const Standard_Integer aPriority = 0);

		/****** SelectMgr_EntityOwner::Clear ******/
		/****** md5 signature: d5969540eab52130ef3a242724a4b637 ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "
Parameters
----------
thePrsMgr: PrsMgr_PresentationManager
theMode: int (optional, default to 0)

Return
-------
None

Description
-----------
Clears the owners matching the value of the selection mode amode from the presentation manager object apm.
") Clear;
		virtual void Clear(const opencascade::handle<PrsMgr_PresentationManager> & thePrsMgr, const Standard_Integer theMode = 0);

		/****** SelectMgr_EntityOwner::ComesFromDecomposition ******/
		/****** md5 signature: 6889a701c50209599d441be5b1dd1509 ******/
		%feature("compactdefaultargs") ComesFromDecomposition;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if this owner points to a part of object and false for entire object.
") ComesFromDecomposition;
		Standard_Boolean ComesFromDecomposition();


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
		/****** SelectMgr_EntityOwner::HandleMouseClick ******/
		/****** md5 signature: add80052ddbdb459ce100ea351ce9701 ******/
		%feature("compactdefaultargs") HandleMouseClick;
		%feature("autodoc", "
Parameters
----------
thePoint: Graphic3d_Vec2i
theButton: Aspect_VKeyMouse
theModifiers: Aspect_VKeyFlags
theIsDoubleClick: bool

Return
-------
bool

Description
-----------
Handle mouse button click event. does nothing by default and returns false. @param thepoint mouse cursor position @param thebutton clicked button @param themodifiers key modifiers @param theisdoubleclick flag indicating double mouse click return true if object handled click.
") HandleMouseClick;
		virtual Standard_Boolean HandleMouseClick(const Graphic3d_Vec2i & thePoint, Aspect_VKeyMouse theButton, Aspect_VKeyFlags theModifiers, bool theIsDoubleClick);

		/****** SelectMgr_EntityOwner::HasLocation ******/
		/****** md5 signature: 570d972f6c1bbb3a38c176a3dd7778ef ******/
		%feature("compactdefaultargs") HasLocation;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if selectable has transformation.
") HasLocation;
		virtual Standard_Boolean HasLocation();

		/****** SelectMgr_EntityOwner::HasSelectable ******/
		/****** md5 signature: f14bd3f82c22c452db3e0247d683264e ******/
		%feature("compactdefaultargs") HasSelectable;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if there is a selectable object to serve as an owner.
") HasSelectable;
		Standard_Boolean HasSelectable();

		/****** SelectMgr_EntityOwner::HilightWithColor ******/
		/****** md5 signature: 87de798bf932a923cf132ba96810aaa6 ******/
		%feature("compactdefaultargs") HilightWithColor;
		%feature("autodoc", "
Parameters
----------
thePrsMgr: PrsMgr_PresentationManager
theStyle: Prs3d_Drawer
theMode: int (optional, default to 0)

Return
-------
None

Description
-----------
Highlights selectable object's presentation with display mode in presentation manager with given highlight style. also a check for auto-highlight is performed - if selectable object manages highlighting on its own, execution will be passed to selectmgr_selectableobject::hilightownerwithcolor method.
") HilightWithColor;
		virtual void HilightWithColor(const opencascade::handle<PrsMgr_PresentationManager> & thePrsMgr, const opencascade::handle<Prs3d_Drawer> & theStyle, const Standard_Integer theMode = 0);

		/****** SelectMgr_EntityOwner::IsAutoHilight ******/
		/****** md5 signature: 57ad8a813588ecd393319c64b612a682 ******/
		%feature("compactdefaultargs") IsAutoHilight;
		%feature("autodoc", "Return
-------
bool

Description
-----------
If owner is not auto hilighted, for group contains many such owners will be called one method hilightselected of selectableobject.
") IsAutoHilight;
		virtual Standard_Boolean IsAutoHilight();

		/****** SelectMgr_EntityOwner::IsForcedHilight ******/
		/****** md5 signature: e492510bd7de6d5d862a5155125b20af ******/
		%feature("compactdefaultargs") IsForcedHilight;
		%feature("autodoc", "Return
-------
bool

Description
-----------
If this method returns true the owner will always call method hilight for selectableobject when the owner is detected. by default it always return false.
") IsForcedHilight;
		virtual Standard_Boolean IsForcedHilight();

		/****** SelectMgr_EntityOwner::IsHilighted ******/
		/****** md5 signature: c2a9996f63892a7491634f477b938b73 ******/
		%feature("compactdefaultargs") IsHilighted;
		%feature("autodoc", "
Parameters
----------
thePrsMgr: PrsMgr_PresentationManager
theMode: int (optional, default to 0)

Return
-------
bool

Description
-----------
Returns true if the presentation manager highlights selections corresponding to the selection mode.
") IsHilighted;
		virtual Standard_Boolean IsHilighted(const opencascade::handle<PrsMgr_PresentationManager> & thePrsMgr, const Standard_Integer theMode = 0);

		/****** SelectMgr_EntityOwner::IsSameSelectable ******/
		/****** md5 signature: 1bb45ad41a756386595dad93200478e4 ******/
		%feature("compactdefaultargs") IsSameSelectable;
		%feature("autodoc", "
Parameters
----------
theOther: SelectMgr_SelectableObject

Return
-------
bool

Description
-----------
Returns true if pointer to selectable object of this owner is equal to the given one.
") IsSameSelectable;
		Standard_Boolean IsSameSelectable(const opencascade::handle<SelectMgr_SelectableObject> & theOther);

		/****** SelectMgr_EntityOwner::IsSelected ******/
		/****** md5 signature: 949447744d8f6a94eaf4d4702b6e976e ******/
		%feature("compactdefaultargs") IsSelected;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return standard_true if the owner is selected.
") IsSelected;
		Standard_Boolean IsSelected();

		/****** SelectMgr_EntityOwner::Location ******/
		/****** md5 signature: e9a3bfb3f4a14a9bfddfb515790cf3eb ******/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "Return
-------
TopLoc_Location

Description
-----------
Returns transformation of selectable.
") Location;
		virtual TopLoc_Location Location();

		/****** SelectMgr_EntityOwner::Priority ******/
		/****** md5 signature: 29598227ed02533258ae1cec0309a089 ******/
		%feature("compactdefaultargs") Priority;
		%feature("autodoc", "Return
-------
int

Description
-----------
Return selection priority (within range [0-9]) for results with the same depth; 0 by default. example - selection of shapes: the owners are selectable objects (presentations) a user can give vertex priority [3], edges [2] faces [1] shape [0], so that if during selection one vertex one edge and one face are simultaneously detected, the vertex will only be hilighted.
") Priority;
		Standard_Integer Priority();

		/****** SelectMgr_EntityOwner::Selectable ******/
		/****** md5 signature: 1129a474cddb2058eec6858748c2e93e ******/
		%feature("compactdefaultargs") Selectable;
		%feature("autodoc", "Return
-------
opencascade::handle<SelectMgr_SelectableObject>

Description
-----------
Returns a selectable object detected in the working context.
") Selectable;
		virtual opencascade::handle<SelectMgr_SelectableObject> Selectable();

		/****** SelectMgr_EntityOwner::Set ******/
		/****** md5 signature: cc7bacf3830beb70c8bc9e3ab1dc0545 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
theSelObj: SelectMgr_SelectableObject

Return
-------
None

Description
-----------
Sets the selectable object.
") Set;
		void Set(const opencascade::handle<SelectMgr_SelectableObject> & theSelObj);

		/****** SelectMgr_EntityOwner::Set ******/
		/****** md5 signature: 564f8abfa67cc280ba647fed234e9d47 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
thePriority: int

Return
-------
None

Description
-----------
Sets the selectable priority of the owner.
") Set;
		void Set(const Standard_Integer thePriority);

		/****** SelectMgr_EntityOwner::SetComesFromDecomposition ******/
		/****** md5 signature: 1f91b108a62300af0000a6a7d35e4ae4 ******/
		%feature("compactdefaultargs") SetComesFromDecomposition;
		%feature("autodoc", "
Parameters
----------
theIsFromDecomposition: bool

Return
-------
None

Description
-----------
Sets flag indicating this owner points to a part of object (true) or to entire object (false).
") SetComesFromDecomposition;
		void SetComesFromDecomposition(const Standard_Boolean theIsFromDecomposition);

		/****** SelectMgr_EntityOwner::SetLocation ******/
		/****** md5 signature: dd06d202f1158d966018e729323ed547 ******/
		%feature("compactdefaultargs") SetLocation;
		%feature("autodoc", "
Parameters
----------
theLocation: TopLoc_Location

Return
-------
None

Description
-----------
Change owner location (callback for handling change of location of selectable object).
") SetLocation;
		virtual void SetLocation(const TopLoc_Location & theLocation);

		/****** SelectMgr_EntityOwner::SetPriority ******/
		/****** md5 signature: 5a3925a66ebc3ef4e73998b083d530f0 ******/
		%feature("compactdefaultargs") SetPriority;
		%feature("autodoc", "
Parameters
----------
thePriority: int

Return
-------
None

Description
-----------
Sets the selectable priority of the owner within range [0-9].
") SetPriority;
		void SetPriority(Standard_Integer thePriority);

		/****** SelectMgr_EntityOwner::SetSelectable ******/
		/****** md5 signature: e52841913b79e2faa76a838b7d71be1e ******/
		%feature("compactdefaultargs") SetSelectable;
		%feature("autodoc", "
Parameters
----------
theSelObj: SelectMgr_SelectableObject

Return
-------
None

Description
-----------
Sets the selectable object.
") SetSelectable;
		virtual void SetSelectable(const opencascade::handle<SelectMgr_SelectableObject> & theSelObj);

		/****** SelectMgr_EntityOwner::SetSelected ******/
		/****** md5 signature: 72905a85c59ef2eff422043539e45a2f ******/
		%feature("compactdefaultargs") SetSelected;
		%feature("autodoc", "
Parameters
----------
theIsSelected: bool

Return
-------
None

Description
-----------
Set the state of the owner. @param theisselected [in] shows if owner is selected.
") SetSelected;
		void SetSelected(const Standard_Boolean theIsSelected);

		/****** SelectMgr_EntityOwner::SetZLayer ******/
		/****** md5 signature: 097fb5f9f23c2585b930c488f4f747a6 ******/
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
Set z layer id and update all presentations.
") SetZLayer;
		virtual void SetZLayer(int theLayerId);

		/****** SelectMgr_EntityOwner::State ******/
		/****** md5 signature: cbcf7744d9e5fcb1ad5d29c138e1a232 ******/
		%feature("compactdefaultargs") State;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns selection state.
") State;
		Standard_Integer State();

		/****** SelectMgr_EntityOwner::State ******/
		/****** md5 signature: 51fdbf7fc9500926f62a89a3197e7573 ******/
		%feature("compactdefaultargs") State;
		%feature("autodoc", "
Parameters
----------
theStatus: int

Return
-------
None

Description
-----------
Set the state of the owner. the method is deprecated. use setselected() instead.
") State;
		void State(const Standard_Integer theStatus);

		/****** SelectMgr_EntityOwner::Unhilight ******/
		/****** md5 signature: 9c4c49a0201108c6e27232bac86bc1b7 ******/
		%feature("compactdefaultargs") Unhilight;
		%feature("autodoc", "
Parameters
----------
thePrsMgr: PrsMgr_PresentationManager
theMode: int (optional, default to 0)

Return
-------
None

Description
-----------
Removes highlighting from the owner of a detected selectable object in the presentation manager. this object could be the owner of a sensitive primitive. @param theprsmgr presentation manager @param themode obsolete argument for compatibility, should be ignored by implementations.
") Unhilight;
		virtual void Unhilight(const opencascade::handle<PrsMgr_PresentationManager> & thePrsMgr, const Standard_Integer theMode = 0);

		/****** SelectMgr_EntityOwner::UpdateHighlightTrsf ******/
		/****** md5 signature: 07c213110f2fd76110957bf075cb3ba6 ******/
		%feature("compactdefaultargs") UpdateHighlightTrsf;
		%feature("autodoc", "
Parameters
----------
theViewer: V3d_Viewer
theManager: PrsMgr_PresentationManager
theDispMode: int

Return
-------
None

Description
-----------
Implements immediate application of location transformation of parent object to dynamic highlight structure.
") UpdateHighlightTrsf;
		virtual void UpdateHighlightTrsf(const opencascade::handle<V3d_Viewer> & theViewer, const opencascade::handle<PrsMgr_PresentationManager> & theManager, const Standard_Integer theDispMode);

};


%make_alias(SelectMgr_EntityOwner)

%extend SelectMgr_EntityOwner {
	%pythoncode {
	__repr__ = _dumps_object

	@methodnotwrapped
	def Select(self):
		pass
	}
};

/*************************
* class SelectMgr_Filter *
*************************/
%nodefaultctor SelectMgr_Filter;
class SelectMgr_Filter : public Standard_Transient {
	public:
		/****** SelectMgr_Filter::ActsOn ******/
		/****** md5 signature: 407a8b9f2b0dbde254a1972ae65281ce ******/
		%feature("compactdefaultargs") ActsOn;
		%feature("autodoc", "
Parameters
----------
aStandardMode: TopAbs_ShapeEnum

Return
-------
bool

Description
-----------
Returns true in an ais local context, if this filter operates on a type of subshape defined in a filter class inheriting this framework. this function completes isok in an ais local context.
") ActsOn;
		virtual Standard_Boolean ActsOn(const TopAbs_ShapeEnum aStandardMode);

		/****** SelectMgr_Filter::IsOk ******/
		/****** md5 signature: 51f35075b94a4376cf4141b785d2a894 ******/
		%feature("compactdefaultargs") IsOk;
		%feature("autodoc", "
Parameters
----------
anObj: SelectMgr_EntityOwner

Return
-------
bool

Description
-----------
Indicates that the selected interactive object passes the filter. the owner, anobj, can be either direct or user. a direct owner is the corresponding construction element, whereas a user is the compound shape of which the entity forms a part. when an object is detected by the mouse - in ais, this is done through a context selector - its owner is passed to the filter as an argument. if the object returns standard_true, it is kept; if not, it is rejected. if you are creating a filter class inheriting this framework, and the daughter class is to be used in an ais local context, you will need to implement the virtual function actson.
") IsOk;
		virtual Standard_Boolean IsOk(const opencascade::handle<SelectMgr_EntityOwner> & anObj);

};


%make_alias(SelectMgr_Filter)

%extend SelectMgr_Filter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class SelectMgr_FrustumBuilder *
*********************************/
class SelectMgr_FrustumBuilder : public Standard_Transient {
	public:
		/****** SelectMgr_FrustumBuilder::SelectMgr_FrustumBuilder ******/
		/****** md5 signature: 5c09c1ed5df49feec0cc53d573508e5d ******/
		%feature("compactdefaultargs") SelectMgr_FrustumBuilder;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates new frustum builder with empty matrices.
") SelectMgr_FrustumBuilder;
		 SelectMgr_FrustumBuilder();

		/****** SelectMgr_FrustumBuilder::Camera ******/
		/****** md5 signature: 9722357b74290d4bf6f13f9113469012 ******/
		%feature("compactdefaultargs") Camera;
		%feature("autodoc", "Return
-------
opencascade::handle<Graphic3d_Camera>

Description
-----------
Returns current camera.
") Camera;
		const opencascade::handle<Graphic3d_Camera> & Camera();

		/****** SelectMgr_FrustumBuilder::InvalidateViewport ******/
		/****** md5 signature: 42a7d3cb51a659b4fba1ecab2bb02ae7 ******/
		%feature("compactdefaultargs") InvalidateViewport;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") InvalidateViewport;
		void InvalidateViewport();

		/****** SelectMgr_FrustumBuilder::ProjectPntOnViewPlane ******/
		/****** md5 signature: b57ec803227d022418a9752b363651c8 ******/
		%feature("compactdefaultargs") ProjectPntOnViewPlane;
		%feature("autodoc", "
Parameters
----------
theX: float
theY: float
theZ: float

Return
-------
gp_Pnt

Description
-----------
Projects 2d screen point onto view frustum plane: thez = 0 - near plane, thez = 1 - far plane.
") ProjectPntOnViewPlane;
		gp_Pnt ProjectPntOnViewPlane(const Standard_Real & theX, const Standard_Real & theY, const Standard_Real & theZ);

		/****** SelectMgr_FrustumBuilder::SetCamera ******/
		/****** md5 signature: feb4846a043de91d4d1b29714dfe3b70 ******/
		%feature("compactdefaultargs") SetCamera;
		%feature("autodoc", "
Parameters
----------
theCamera: Graphic3d_Camera

Return
-------
None

Description
-----------
Stores current camera.
") SetCamera;
		void SetCamera(const opencascade::handle<Graphic3d_Camera> & theCamera);

		/****** SelectMgr_FrustumBuilder::SetViewport ******/
		/****** md5 signature: 8a132d12573d3301f6dc1103aa3c5d06 ******/
		%feature("compactdefaultargs") SetViewport;
		%feature("autodoc", "
Parameters
----------
theX: float
theY: float
theWidth: float
theHeight: float

Return
-------
None

Description
-----------
Stores current viewport coordinates.
") SetViewport;
		void SetViewport(const Standard_Real theX, const Standard_Real theY, const Standard_Real theWidth, const Standard_Real theHeight);

		/****** SelectMgr_FrustumBuilder::SetWindowSize ******/
		/****** md5 signature: 8f5369c74a4835dacda32c89cfdc6f2a ******/
		%feature("compactdefaultargs") SetWindowSize;
		%feature("autodoc", "
Parameters
----------
theWidth: int
theHeight: int

Return
-------
None

Description
-----------
Stores current window width and height.
") SetWindowSize;
		void SetWindowSize(const Standard_Integer theWidth, const Standard_Integer theHeight);

		/****** SelectMgr_FrustumBuilder::SignedPlanePntDist ******/
		/****** md5 signature: 197b23e7016adf49f5250381a86e2bc7 ******/
		%feature("compactdefaultargs") SignedPlanePntDist;
		%feature("autodoc", "
Parameters
----------
theEq: SelectMgr_Vec3
thePnt: SelectMgr_Vec3

Return
-------
float

Description
-----------
Calculates signed distance between plane with equation theeq and point thepnt.
") SignedPlanePntDist;
		Standard_Real SignedPlanePntDist(const SelectMgr_Vec3 & theEq, const SelectMgr_Vec3 & thePnt);

		/****** SelectMgr_FrustumBuilder::WindowSize ******/
		/****** md5 signature: b6b9e026658a5426a88d46691f9f9543 ******/
		%feature("compactdefaultargs") WindowSize;
		%feature("autodoc", "
Parameters
----------

Return
-------
theWidth: int
theHeight: int

Description
-----------
No available documentation.
") WindowSize;
		void WindowSize(Standard_Integer &OutValue, Standard_Integer &OutValue);

};


%make_alias(SelectMgr_FrustumBuilder)

%extend SelectMgr_FrustumBuilder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class SelectMgr_SelectableObject *
***********************************/
%nodefaultctor SelectMgr_SelectableObject;
class SelectMgr_SelectableObject : public PrsMgr_PresentableObject {
	public:
		/****** SelectMgr_SelectableObject::AcceptShapeDecomposition ******/
		/****** md5 signature: e91796345b7fc54f8d0048f595a2ed30 ******/
		%feature("compactdefaultargs") AcceptShapeDecomposition;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Informs the graphic context that the interactive object may be decomposed into sub-shapes for dynamic selection. the most used interactive object is ais_shape.
") AcceptShapeDecomposition;
		virtual Standard_Boolean AcceptShapeDecomposition();

		/****** SelectMgr_SelectableObject::AddSelection ******/
		/****** md5 signature: cac436c748f6c092baaa6c3df83291a7 ******/
		%feature("compactdefaultargs") AddSelection;
		%feature("autodoc", "
Parameters
----------
aSelection: SelectMgr_Selection
aMode: int

Return
-------
None

Description
-----------
Adds the selection aselection with the selection mode index amode to this framework.
") AddSelection;
		void AddSelection(const opencascade::handle<SelectMgr_Selection> & aSelection, const Standard_Integer aMode);

		/****** SelectMgr_SelectableObject::BndBoxOfSelected ******/
		/****** md5 signature: 443f93b07a9907ef337840cc8b4ae9ed ******/
		%feature("compactdefaultargs") BndBoxOfSelected;
		%feature("autodoc", "
Parameters
----------
theOwners: SelectMgr_IndexedMapOfOwner

Return
-------
Bnd_Box

Description
-----------
Returns a bounding box of sensitive entities with the owners given if they are a part of activated selection.
") BndBoxOfSelected;
		Bnd_Box BndBoxOfSelected(const opencascade::handle<SelectMgr_IndexedMapOfOwner> & theOwners);

		/****** SelectMgr_SelectableObject::ClearDynamicHighlight ******/
		/****** md5 signature: d0352ce4e2dd5f23d593337c0a535955 ******/
		%feature("compactdefaultargs") ClearDynamicHighlight;
		%feature("autodoc", "
Parameters
----------
theMgr: PrsMgr_PresentationManager

Return
-------
None

Description
-----------
Method that needs to be implemented when the object manages selection and dynamic highlighting on its own. clears or invalidates dynamic highlight presentation. by default it clears immediate draw of given presentation manager.
") ClearDynamicHighlight;
		virtual void ClearDynamicHighlight(const opencascade::handle<PrsMgr_PresentationManager> & theMgr);

		/****** SelectMgr_SelectableObject::ClearSelected ******/
		/****** md5 signature: 2b22db8388f6c0f9639f0af72b3eb147 ******/
		%feature("compactdefaultargs") ClearSelected;
		%feature("autodoc", "Return
-------
None

Description
-----------
Method which clear all selected owners belonging to this selectable object ( for fast presentation draw ).
") ClearSelected;
		virtual void ClearSelected();

		/****** SelectMgr_SelectableObject::ClearSelections ******/
		/****** md5 signature: 44c3292e3b886615f6924e9b2367fc77 ******/
		%feature("compactdefaultargs") ClearSelections;
		%feature("autodoc", "
Parameters
----------
update: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Empties all the selections in the selectableobject <update> parameter defines whether all object's selections should be flagged for further update or not. this improved method can be used to recompute an object's selection (without redisplaying the object completely) when some selection mode is activated not for the first time.
") ClearSelections;
		void ClearSelections(const Standard_Boolean update = Standard_False);

		/****** SelectMgr_SelectableObject::ComputeSelection ******/
		/****** md5 signature: 8d0bfeee3da226e839feb2c670764fef ******/
		%feature("compactdefaultargs") ComputeSelection;
		%feature("autodoc", "
Parameters
----------
theSelection: SelectMgr_Selection
theMode: int

Return
-------
None

Description
-----------
Computes sensitive primitives for the given selection mode - key interface method of selectable object. @param theselection selection to fill @param themode selection mode to create sensitive primitives.
") ComputeSelection;
		virtual void ComputeSelection(const opencascade::handle<SelectMgr_Selection> & theSelection, const Standard_Integer theMode);


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
		/****** SelectMgr_SelectableObject::ErasePresentations ******/
		/****** md5 signature: 1ca7dc31012600af9ffc1ee563cb7a3d ******/
		%feature("compactdefaultargs") ErasePresentations;
		%feature("autodoc", "
Parameters
----------
theToRemove: bool

Return
-------
None

Description
-----------
Removes presentations returned by gethilightpresentation() and getselectpresentation().
") ErasePresentations;
		virtual void ErasePresentations(Standard_Boolean theToRemove);

		/****** SelectMgr_SelectableObject::GetAssemblyOwner ******/
		/****** md5 signature: 900d00bb218b878c5876856e4f4dd9c9 ******/
		%feature("compactdefaultargs") GetAssemblyOwner;
		%feature("autodoc", "Return
-------
opencascade::handle<SelectMgr_EntityOwner>

Description
-----------
Returns common entity owner if the object is an assembly.
") GetAssemblyOwner;
		virtual const opencascade::handle<SelectMgr_EntityOwner> & GetAssemblyOwner();

		/****** SelectMgr_SelectableObject::GetHilightPresentation ******/
		/****** md5 signature: 860dc61249cfe54918e23e3a89f05dba ******/
		%feature("compactdefaultargs") GetHilightPresentation;
		%feature("autodoc", "
Parameters
----------
thePrsMgr: PrsMgr_PresentationManager

Return
-------
opencascade::handle<Prs3d_Presentation>

Description
-----------
Creates or returns existing presentation for highlighting detected object. @param theprsmgr presentation manager to create new presentation return existing or newly created presentation (when theprsmgr is not null).
") GetHilightPresentation;
		opencascade::handle<Prs3d_Presentation> GetHilightPresentation(const opencascade::handle<PrsMgr_PresentationManager> & thePrsMgr);

		/****** SelectMgr_SelectableObject::GetSelectPresentation ******/
		/****** md5 signature: 102f80315a16547a5c736148a3ed8c5e ******/
		%feature("compactdefaultargs") GetSelectPresentation;
		%feature("autodoc", "
Parameters
----------
thePrsMgr: PrsMgr_PresentationManager

Return
-------
opencascade::handle<Prs3d_Presentation>

Description
-----------
Creates or returns existing presentation for highlighting selected object. @param theprsmgr presentation manager to create new presentation return existing or newly created presentation (when theprsmgr is not null).
") GetSelectPresentation;
		opencascade::handle<Prs3d_Presentation> GetSelectPresentation(const opencascade::handle<PrsMgr_PresentationManager> & thePrsMgr);

		/****** SelectMgr_SelectableObject::GlobalSelOwner ******/
		/****** md5 signature: 52d515777b1b4640e22e2f23da2e24cb ******/
		%feature("compactdefaultargs") GlobalSelOwner;
		%feature("autodoc", "Return
-------
opencascade::handle<SelectMgr_EntityOwner>

Description
-----------
Returns the owner of mode for selection of object as a whole.
") GlobalSelOwner;
		virtual opencascade::handle<SelectMgr_EntityOwner> GlobalSelOwner();

		/****** SelectMgr_SelectableObject::GlobalSelectionMode ******/
		/****** md5 signature: b62d625b048f2bad09afcaf87f73c7b5 ******/
		%feature("compactdefaultargs") GlobalSelectionMode;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the mode for selection of object as a whole; 0 by default.
") GlobalSelectionMode;
		Standard_Integer GlobalSelectionMode();

		/****** SelectMgr_SelectableObject::HasSelection ******/
		/****** md5 signature: 7e69da611555aafed675e49f59e44aae ******/
		%feature("compactdefaultargs") HasSelection;
		%feature("autodoc", "
Parameters
----------
theMode: int

Return
-------
bool

Description
-----------
Returns true if a selection corresponding to the selection mode themode was computed for this object.
") HasSelection;
		Standard_Boolean HasSelection(const Standard_Integer theMode);

		/****** SelectMgr_SelectableObject::HilightOwnerWithColor ******/
		/****** md5 signature: 32e4307dcba2e0851cedfe1c57a6fe79 ******/
		%feature("compactdefaultargs") HilightOwnerWithColor;
		%feature("autodoc", "
Parameters
----------
thePM: PrsMgr_PresentationManager
theStyle: Prs3d_Drawer
theOwner: SelectMgr_EntityOwner

Return
-------
None

Description
-----------
Method which hilight an owner belonging to this selectable object ( for fast presentation draw ).
") HilightOwnerWithColor;
		virtual void HilightOwnerWithColor(const opencascade::handle<PrsMgr_PresentationManager> & thePM, const opencascade::handle<Prs3d_Drawer> & theStyle, const opencascade::handle<SelectMgr_EntityOwner> & theOwner);

		/****** SelectMgr_SelectableObject::HilightSelected ******/
		/****** md5 signature: f94c01d8d1821db083be9af276986e33 ******/
		%feature("compactdefaultargs") HilightSelected;
		%feature("autodoc", "
Parameters
----------
thePrsMgr: PrsMgr_PresentationManager
theSeq: SelectMgr_SequenceOfOwner

Return
-------
None

Description
-----------
Method which draws selected owners ( for fast presentation draw ).
") HilightSelected;
		virtual void HilightSelected(const opencascade::handle<PrsMgr_PresentationManager> & thePrsMgr, const SelectMgr_SequenceOfOwner & theSeq);

		/****** SelectMgr_SelectableObject::IsAutoHilight ******/
		/****** md5 signature: 57ad8a813588ecd393319c64b612a682 ******/
		%feature("compactdefaultargs") IsAutoHilight;
		%feature("autodoc", "Return
-------
bool

Description
-----------
If returns true, the old mechanism for highlighting selected objects is used (hilightselected method may be empty). if returns false, the hilightselected method will be fully responsible for highlighting selected entity owners belonging to this selectable object.
") IsAutoHilight;
		virtual Standard_Boolean IsAutoHilight();

		/****** SelectMgr_SelectableObject::RecomputePrimitives ******/
		/****** md5 signature: 7bd2e52f5f2cfac7f6ff872dd5ea905f ******/
		%feature("compactdefaultargs") RecomputePrimitives;
		%feature("autodoc", "Return
-------
None

Description
-----------
Re-computes the sensitive primitives for all modes. important: do not use this method to update selection primitives except implementing custom selection manager! this method does not take into account necessary bvh updates, but may invalidate the pointers it refers to. to update selection properly from outside classes, use method updateselection.
") RecomputePrimitives;
		void RecomputePrimitives();

		/****** SelectMgr_SelectableObject::RecomputePrimitives ******/
		/****** md5 signature: 993e0181ff78c9354c78b4324e89d177 ******/
		%feature("compactdefaultargs") RecomputePrimitives;
		%feature("autodoc", "
Parameters
----------
theMode: int

Return
-------
None

Description
-----------
Re-computes the sensitive primitives which correspond to the <themode>th selection mode. important: do not use this method to update selection primitives except implementing custom selection manager! selection manager! this method does not take into account necessary bvh updates, but may invalidate the pointers it refers to. to update selection properly from outside classes, use method updateselection.
") RecomputePrimitives;
		void RecomputePrimitives(const Standard_Integer theMode);

		/****** SelectMgr_SelectableObject::ResetTransformation ******/
		/****** md5 signature: d978328fb77e88b2f8f47675588dbd84 ******/
		%feature("compactdefaultargs") ResetTransformation;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") ResetTransformation;
		void ResetTransformation();

		/****** SelectMgr_SelectableObject::Selection ******/
		/****** md5 signature: a2a4e40226667fb0b77f24a46a478797 ******/
		%feature("compactdefaultargs") Selection;
		%feature("autodoc", "
Parameters
----------
theMode: int

Return
-------
opencascade::handle<SelectMgr_Selection>

Description
-----------
Returns the selection having specified selection mode or null.
") Selection;
		const opencascade::handle<SelectMgr_Selection> & Selection(const Standard_Integer theMode);

		/****** SelectMgr_SelectableObject::Selections ******/
		/****** md5 signature: 413e1776ab243e15ff928a23847812cf ******/
		%feature("compactdefaultargs") Selections;
		%feature("autodoc", "Return
-------
SelectMgr_SequenceOfSelection

Description
-----------
Return the sequence of selections.
") Selections;
		const SelectMgr_SequenceOfSelection & Selections();

		/****** SelectMgr_SelectableObject::SetAssemblyOwner ******/
		/****** md5 signature: 663f1306acce95f2b2821e2f2d0c0996 ******/
		%feature("compactdefaultargs") SetAssemblyOwner;
		%feature("autodoc", "
Parameters
----------
theOwner: SelectMgr_EntityOwner
theMode: int (optional, default to -1)

Return
-------
None

Description
-----------
Sets common entity owner for assembly sensitive object entities.
") SetAssemblyOwner;
		void SetAssemblyOwner(const opencascade::handle<SelectMgr_EntityOwner> & theOwner, const Standard_Integer theMode = -1);

		/****** SelectMgr_SelectableObject::SetAutoHilight ******/
		/****** md5 signature: 4e6ead318d652bf286a0ac61daa1670d ******/
		%feature("compactdefaultargs") SetAutoHilight;
		%feature("autodoc", "
Parameters
----------
theAutoHilight: bool

Return
-------
None

Description
-----------
Set autohilight property to true or false.
") SetAutoHilight;
		virtual void SetAutoHilight(const Standard_Boolean theAutoHilight);

		/****** SelectMgr_SelectableObject::SetZLayer ******/
		/****** md5 signature: d310515d289158ffbf4d4de5b7ae68aa ******/
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
Set z layer id and update all presentations of the selectable object. the layers mechanism allows drawing objects in higher layers in overlay of objects in lower layers.
") SetZLayer;
		virtual void SetZLayer(int theLayerId);

		/****** SelectMgr_SelectableObject::UpdateSelection ******/
		/****** md5 signature: 14cfc18078e541b47973a9e8aa6256f9 ******/
		%feature("compactdefaultargs") UpdateSelection;
		%feature("autodoc", "
Parameters
----------
theMode: int (optional, default to -1)

Return
-------
None

Description
-----------
Sets update status full to selections of the object. must be used as the only method of updateselection from outer classes to prevent bvh structures from being outdated.
") UpdateSelection;
		void UpdateSelection(const Standard_Integer theMode = -1);

		/****** SelectMgr_SelectableObject::UpdateTransformation ******/
		/****** md5 signature: 9663287750e621d117128f238516c453 ******/
		%feature("compactdefaultargs") UpdateTransformation;
		%feature("autodoc", "Return
-------
None

Description
-----------
Recomputes the location of the selection aselection.
") UpdateTransformation;
		virtual void UpdateTransformation();

		/****** SelectMgr_SelectableObject::UpdateTransformations ******/
		/****** md5 signature: d665fe0a491bfbd565adb55b2ded1bc9 ******/
		%feature("compactdefaultargs") UpdateTransformations;
		%feature("autodoc", "
Parameters
----------
aSelection: SelectMgr_Selection

Return
-------
None

Description
-----------
Updates locations in all sensitive entities from <aselection> and in corresponding entity owners.
") UpdateTransformations;
		virtual void UpdateTransformations(const opencascade::handle<SelectMgr_Selection> & aSelection);

};


%make_alias(SelectMgr_SelectableObject)

%extend SelectMgr_SelectableObject {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class SelectMgr_SelectableObjectSet *
**************************************/
class SelectMgr_SelectableObjectSet {
	public:
		class Iterator {};
/* public enums */
enum BVHSubset {
	BVHSubset_3d = 0,
	BVHSubset_3dPersistent = 1,
	BVHSubset_2dPersistent = 2,
	BVHSubsetNb = 3,
};

/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {

class BVHSubset(IntEnum):
	BVHSubset_3d = 0
	BVHSubset_3dPersistent = 1
	BVHSubset_2dPersistent = 2
	BVHSubsetNb = 3
BVHSubset_3d = BVHSubset.BVHSubset_3d
BVHSubset_3dPersistent = BVHSubset.BVHSubset_3dPersistent
BVHSubset_2dPersistent = BVHSubset.BVHSubset_2dPersistent
BVHSubsetNb = BVHSubset.BVHSubsetNb
};
/* end python proxy for enums */

		/****** SelectMgr_SelectableObjectSet::SelectMgr_SelectableObjectSet ******/
		/****** md5 signature: 827041285772c96eab6193d719a82b9c ******/
		%feature("compactdefaultargs") SelectMgr_SelectableObjectSet;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates new empty objects set and initializes bvh tree builders for each subset.
") SelectMgr_SelectableObjectSet;
		 SelectMgr_SelectableObjectSet();

		/****** SelectMgr_SelectableObjectSet::Append ******/
		/****** md5 signature: d4ae1cd7ff5ae331cbc8478e22f2b054 ******/
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "
Parameters
----------
theObject: SelectMgr_SelectableObject

Return
-------
bool

Description
-----------
Adds the new selectable object to the set. the selectable object is placed into one of the predefined subsets depending on its persistence type. after adding an object, this method marks the corresponding bvh tree for rebuild. return true if selectable object is added, otherwise returns false (selectable object is already in the set).
") Append;
		Standard_Boolean Append(const opencascade::handle<SelectMgr_SelectableObject> & theObject);

		/****** SelectMgr_SelectableObjectSet::BVH ******/
		/****** md5 signature: c3375b42ee73cb25b0751e5122f7ae72 ******/
		%feature("compactdefaultargs") BVH;
		%feature("autodoc", "
Parameters
----------
theSubset: BVHSubset

Return
-------
opencascade::handle<BVH_Tree<float, 3>>

Description
-----------
Returns computed bvh for the thesubset given.
") BVH;
		const opencascade::handle<BVH_Tree<Standard_Real, 3>> & BVH(BVHSubset theSubset);

		/****** SelectMgr_SelectableObjectSet::ChangeSubset ******/
		/****** md5 signature: cbec19f3893244976644826379ec6795 ******/
		%feature("compactdefaultargs") ChangeSubset;
		%feature("autodoc", "
Parameters
----------
theObject: SelectMgr_SelectableObject

Return
-------
None

Description
-----------
Performs necessary updates when object's persistence types changes. this method should be called right after changing transformation persistence flags of the objects and before updating bvh tree - to provide up-to-date state of the object set.
") ChangeSubset;
		void ChangeSubset(const opencascade::handle<SelectMgr_SelectableObject> & theObject);

		/****** SelectMgr_SelectableObjectSet::Contains ******/
		/****** md5 signature: c1f9a600c1e0fefbd7b5415244e3f42a ******/
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "
Parameters
----------
theObject: SelectMgr_SelectableObject

Return
-------
bool

Description
-----------
Returns true if this objects set contains theobject given.
") Contains;
		Standard_Boolean Contains(const opencascade::handle<SelectMgr_SelectableObject> & theObject);


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
		/****** SelectMgr_SelectableObjectSet::GetObjectById ******/
		/****** md5 signature: 319a1ac965d889d963a38ef514f73d63 ******/
		%feature("compactdefaultargs") GetObjectById;
		%feature("autodoc", "
Parameters
----------
theSubset: BVHSubset
theIndex: int

Return
-------
opencascade::handle<SelectMgr_SelectableObject>

Description
-----------
Returns object from subset thesubset by theindex given. the method allows to get selectable object referred by the index of an element of the subset's bvh tree.
") GetObjectById;
		const opencascade::handle<SelectMgr_SelectableObject> & GetObjectById(BVHSubset theSubset, const Standard_Integer theIndex);

		/****** SelectMgr_SelectableObjectSet::IsEmpty ******/
		/****** md5 signature: d529c07ce9e12eea3222188c82b0e80b ******/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the object set does not contain any selectable objects.
") IsEmpty;
		Standard_Boolean IsEmpty();

		/****** SelectMgr_SelectableObjectSet::IsEmpty ******/
		/****** md5 signature: 2d7141d3da6354df6cf3d6cf009cdabd ******/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "
Parameters
----------
theSubset: BVHSubset

Return
-------
bool

Description
-----------
Returns true if the specified object subset is empty.
") IsEmpty;
		Standard_Boolean IsEmpty(BVHSubset theSubset);

		/****** SelectMgr_SelectableObjectSet::MarkDirty ******/
		/****** md5 signature: 37381481e073d0bb85d53a543d2b10a1 ******/
		%feature("compactdefaultargs") MarkDirty;
		%feature("autodoc", "Return
-------
None

Description
-----------
Marks every bvh subset for update.
") MarkDirty;
		void MarkDirty();

		/****** SelectMgr_SelectableObjectSet::Remove ******/
		/****** md5 signature: 38409779e63904bdbcb8289aacd622e4 ******/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "
Parameters
----------
theObject: SelectMgr_SelectableObject

Return
-------
bool

Description
-----------
Removes the selectable object from the set. the selectable object is removed from the subset it has been placed into. after removing an object, this method marks the corresponding bvh tree for rebuild. return true if selectable object is removed, otherwise returns false (selectable object is not in the set).
") Remove;
		Standard_Boolean Remove(const opencascade::handle<SelectMgr_SelectableObject> & theObject);

		/****** SelectMgr_SelectableObjectSet::UpdateBVH ******/
		/****** md5 signature: 8a4c543113d4a23f5fbc275c1d261940 ******/
		%feature("compactdefaultargs") UpdateBVH;
		%feature("autodoc", "
Parameters
----------
theCam: Graphic3d_Camera
theWinSize: Graphic3d_Vec2i

Return
-------
None

Description
-----------
Updates outdated bvh trees and remembers the last state of the camera view-projection matrices and viewport (window) dimensions.
") UpdateBVH;
		void UpdateBVH(const opencascade::handle<Graphic3d_Camera> & theCam, const Graphic3d_Vec2i & theWinSize);

};


%extend SelectMgr_SelectableObjectSet {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************
* class SelectMgr_SelectingVolumeManager *
*****************************************/
class SelectMgr_SelectingVolumeManager : public SelectBasics_SelectingVolumeManager {
	public:
		/****** SelectMgr_SelectingVolumeManager::SelectMgr_SelectingVolumeManager ******/
		/****** md5 signature: 766e9640f35bf18828817e28109e724c ******/
		%feature("compactdefaultargs") SelectMgr_SelectingVolumeManager;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates instances of all available selecting volume types.
") SelectMgr_SelectingVolumeManager;
		 SelectMgr_SelectingVolumeManager();

		/****** SelectMgr_SelectingVolumeManager::ActiveVolume ******/
		/****** md5 signature: 8fea4d782109be39039e6429b87f144f ******/
		%feature("compactdefaultargs") ActiveVolume;
		%feature("autodoc", "Return
-------
opencascade::handle<SelectMgr_BaseIntersector>

Description
-----------
Returns active selecting volume that was built during last run of occt selection mechanism.
") ActiveVolume;
		const opencascade::handle<SelectMgr_BaseIntersector> & ActiveVolume();

		/****** SelectMgr_SelectingVolumeManager::AllowOverlapDetection ******/
		/****** md5 signature: 835f65572d504a5580a4fc1007d46f5c ******/
		%feature("compactdefaultargs") AllowOverlapDetection;
		%feature("autodoc", "
Parameters
----------
theIsToAllow: bool

Return
-------
None

Description
-----------
If theistoallow is false, only fully included sensitives will be detected, otherwise the algorithm will mark both included and overlapped entities as matched.
") AllowOverlapDetection;
		virtual void AllowOverlapDetection(const Standard_Boolean theIsToAllow);

		/****** SelectMgr_SelectingVolumeManager::BuildSelectingVolume ******/
		/****** md5 signature: 8d111d8f578ec131aa6dd52ce1a06500 ******/
		%feature("compactdefaultargs") BuildSelectingVolume;
		%feature("autodoc", "Return
-------
None

Description
-----------
Builds previously initialized selecting volume.
") BuildSelectingVolume;
		void BuildSelectingVolume();

		/****** SelectMgr_SelectingVolumeManager::BuildSelectingVolume ******/
		/****** md5 signature: d3870be043d44dc3c4c9021e9328557f ******/
		%feature("compactdefaultargs") BuildSelectingVolume;
		%feature("autodoc", "
Parameters
----------
thePoint: gp_Pnt2d

Return
-------
None

Description
-----------
No available documentation.
") BuildSelectingVolume;
		void BuildSelectingVolume(const gp_Pnt2d & thePoint);

		/****** SelectMgr_SelectingVolumeManager::BuildSelectingVolume ******/
		/****** md5 signature: 6d5dfec62c478092fcbc8add0168a788 ******/
		%feature("compactdefaultargs") BuildSelectingVolume;
		%feature("autodoc", "
Parameters
----------
theMinPt: gp_Pnt2d
theMaxPt: gp_Pnt2d

Return
-------
None

Description
-----------
No available documentation.
") BuildSelectingVolume;
		void BuildSelectingVolume(const gp_Pnt2d & theMinPt, const gp_Pnt2d & theMaxPt);

		/****** SelectMgr_SelectingVolumeManager::BuildSelectingVolume ******/
		/****** md5 signature: 0b768a2e513c26decf9d0f6a27302911 ******/
		%feature("compactdefaultargs") BuildSelectingVolume;
		%feature("autodoc", "
Parameters
----------
thePoints: TColgp_Array1OfPnt2d

Return
-------
None

Description
-----------
No available documentation.
") BuildSelectingVolume;
		void BuildSelectingVolume(const TColgp_Array1OfPnt2d & thePoints);

		/****** SelectMgr_SelectingVolumeManager::Camera ******/
		/****** md5 signature: e0e8d00ee700afb9ca88da977e8b5747 ******/
		%feature("compactdefaultargs") Camera;
		%feature("autodoc", "Return
-------
opencascade::handle<Graphic3d_Camera>

Description
-----------
Returns current camera definition.
") Camera;
		const opencascade::handle<Graphic3d_Camera> & Camera();

		/****** SelectMgr_SelectingVolumeManager::DetectedPoint ******/
		/****** md5 signature: f5119614d059d473f2e98823f778528f ******/
		%feature("compactdefaultargs") DetectedPoint;
		%feature("autodoc", "
Parameters
----------
theDepth: float

Return
-------
gp_Pnt

Description
-----------
Calculates the point on a view ray that was detected during the run of selection algo by given depth. throws exception if active selection type is not point.
") DetectedPoint;
		virtual gp_Pnt DetectedPoint(const Standard_Real theDepth);

		/****** SelectMgr_SelectingVolumeManager::DistToGeometryCenter ******/
		/****** md5 signature: ef4883136b3d59dc96190e78632a000d ******/
		%feature("compactdefaultargs") DistToGeometryCenter;
		%feature("autodoc", "
Parameters
----------
theCOG: gp_Pnt

Return
-------
float

Description
-----------
Measures distance between 3d projection of user-picked screen point and given point thecog.
") DistToGeometryCenter;
		virtual Standard_Real DistToGeometryCenter(const gp_Pnt & theCOG);


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
		/****** SelectMgr_SelectingVolumeManager::GetActiveSelectionType ******/
		/****** md5 signature: 6be7281ca743652d206dad6a0c6f5952 ******/
		%feature("compactdefaultargs") GetActiveSelectionType;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") GetActiveSelectionType;
		virtual Standard_Integer GetActiveSelectionType();

		/****** SelectMgr_SelectingVolumeManager::GetFarPickedPnt ******/
		/****** md5 signature: 2ffbc3246baa8ae88d6d155b2475b10c ******/
		%feature("compactdefaultargs") GetFarPickedPnt;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Valid only for point and rectangular selection. returns projection of 2d mouse picked point or projection of center of 2d rectangle (for point and rectangular selection correspondingly) onto far view frustum plane.
") GetFarPickedPnt;
		virtual gp_Pnt GetFarPickedPnt();

		/****** SelectMgr_SelectingVolumeManager::GetMousePosition ******/
		/****** md5 signature: dcc0cc032f698db0f9d95560a7ad20f9 ******/
		%feature("compactdefaultargs") GetMousePosition;
		%feature("autodoc", "Return
-------
gp_Pnt2d

Description
-----------
Returns mouse coordinates for point selection mode. return infinite point in case of unsupport of mouse position for this active selection volume.
") GetMousePosition;
		virtual gp_Pnt2d GetMousePosition();

		/****** SelectMgr_SelectingVolumeManager::GetNearPickedPnt ******/
		/****** md5 signature: d103f12e1b34a4596056c78f0c8a540b ******/
		%feature("compactdefaultargs") GetNearPickedPnt;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Valid only for point and rectangular selection. returns projection of 2d mouse picked point or projection of center of 2d rectangle (for point and rectangular selection correspondingly) onto near view frustum plane.
") GetNearPickedPnt;
		virtual gp_Pnt GetNearPickedPnt();

		/****** SelectMgr_SelectingVolumeManager::GetPlanes ******/
		/****** md5 signature: 6ca80f788783698f67ff4f449d84c80c ******/
		%feature("compactdefaultargs") GetPlanes;
		%feature("autodoc", "
Parameters
----------
thePlaneEquations: NCollection_Vector<SelectMgr_Vec4>

Return
-------
None

Description
-----------
Stores plane equation coefficients (in the following form: ax + by + cz + d = 0) to the given vector.
") GetPlanes;
		virtual void GetPlanes(NCollection_Vector<SelectMgr_Vec4> & thePlaneEquations);

		/****** SelectMgr_SelectingVolumeManager::GetVertices ******/
		/****** md5 signature: 97f9768e715df9214ec06c43990766fc ******/
		%feature("compactdefaultargs") GetVertices;
		%feature("autodoc", "Return
-------
gp_Pnt *

Description
-----------
A set of helper functions that return rectangular selecting frustum data.
") GetVertices;
		const gp_Pnt * GetVertices();

		/****** SelectMgr_SelectingVolumeManager::GetViewRayDirection ******/
		/****** md5 signature: 21f31209db824731d7acac6bf2abae83 ******/
		%feature("compactdefaultargs") GetViewRayDirection;
		%feature("autodoc", "Return
-------
gp_Dir

Description
-----------
Valid only for point and rectangular selection. returns view ray direction.
") GetViewRayDirection;
		virtual gp_Dir GetViewRayDirection();

		/****** SelectMgr_SelectingVolumeManager::InitAxisSelectingVolume ******/
		/****** md5 signature: 26109159d24d5be10c951c3c439d4af1 ******/
		%feature("compactdefaultargs") InitAxisSelectingVolume;
		%feature("autodoc", "
Parameters
----------
theAxis: gp_Ax1

Return
-------
None

Description
-----------
Creates and activates axis selector for point selection.
") InitAxisSelectingVolume;
		void InitAxisSelectingVolume(const gp_Ax1 & theAxis);

		/****** SelectMgr_SelectingVolumeManager::InitBoxSelectingVolume ******/
		/****** md5 signature: 85ba60b668422521b374712ef9dc305b ******/
		%feature("compactdefaultargs") InitBoxSelectingVolume;
		%feature("autodoc", "
Parameters
----------
theMinPt: gp_Pnt2d
theMaxPt: gp_Pnt2d

Return
-------
None

Description
-----------
Creates, initializes and activates rectangular selecting frustum for box selection.
") InitBoxSelectingVolume;
		void InitBoxSelectingVolume(const gp_Pnt2d & theMinPt, const gp_Pnt2d & theMaxPt);

		/****** SelectMgr_SelectingVolumeManager::InitPointSelectingVolume ******/
		/****** md5 signature: 6fd958c8f193c830449b334386063d1e ******/
		%feature("compactdefaultargs") InitPointSelectingVolume;
		%feature("autodoc", "
Parameters
----------
thePoint: gp_Pnt2d

Return
-------
None

Description
-----------
Creates, initializes and activates rectangular selecting frustum for point selection.
") InitPointSelectingVolume;
		void InitPointSelectingVolume(const gp_Pnt2d & thePoint);

		/****** SelectMgr_SelectingVolumeManager::InitPolylineSelectingVolume ******/
		/****** md5 signature: 91b0266302c5afb5d62b7b293bb285dc ******/
		%feature("compactdefaultargs") InitPolylineSelectingVolume;
		%feature("autodoc", "
Parameters
----------
thePoints: TColgp_Array1OfPnt2d

Return
-------
None

Description
-----------
Creates, initializes and activates set of triangular selecting frustums for polyline selection.
") InitPolylineSelectingVolume;
		void InitPolylineSelectingVolume(const TColgp_Array1OfPnt2d & thePoints);

		/****** SelectMgr_SelectingVolumeManager::InitSelectingVolume ******/
		/****** md5 signature: a70f6f4650e5b257e6e7420cd2ae830d ******/
		%feature("compactdefaultargs") InitSelectingVolume;
		%feature("autodoc", "
Parameters
----------
theVolume: SelectMgr_BaseIntersector

Return
-------
None

Description
-----------
Sets as active the custom selecting volume.
") InitSelectingVolume;
		void InitSelectingVolume(const opencascade::handle<SelectMgr_BaseIntersector> & theVolume);

		/****** SelectMgr_SelectingVolumeManager::IsOverlapAllowed ******/
		/****** md5 signature: 7d8f9be9184a75e442465114e308659f ******/
		%feature("compactdefaultargs") IsOverlapAllowed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsOverlapAllowed;
		virtual Standard_Boolean IsOverlapAllowed();

		/****** SelectMgr_SelectingVolumeManager::IsScalableActiveVolume ******/
		/****** md5 signature: cec63286df013390f8db8e217254c9db ******/
		%feature("compactdefaultargs") IsScalableActiveVolume;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Checks if it is possible to scale current active selecting volume.
") IsScalableActiveVolume;
		virtual Standard_Boolean IsScalableActiveVolume();

		/****** SelectMgr_SelectingVolumeManager::ObjectClipping ******/
		/****** md5 signature: f6c35522166321d4f812458a964f18cf ******/
		%feature("compactdefaultargs") ObjectClipping;
		%feature("autodoc", "Return
-------
opencascade::handle<Graphic3d_SequenceOfHClipPlane>

Description
-----------
Return object clipping planes.
") ObjectClipping;
		const opencascade::handle<Graphic3d_SequenceOfHClipPlane> & ObjectClipping();

		/****** SelectMgr_SelectingVolumeManager::OverlapsBox ******/
		/****** md5 signature: 4b7c5cc7fac549e880a63ba09353ab83 ******/
		%feature("compactdefaultargs") OverlapsBox;
		%feature("autodoc", "
Parameters
----------
theBoxMin: SelectMgr_Vec3
theBoxMax: SelectMgr_Vec3
thePickResult: SelectBasics_PickResult

Return
-------
bool

Description
-----------
Sat intersection test between defined volume and given axis-aligned box.
") OverlapsBox;
		virtual Standard_Boolean OverlapsBox(const SelectMgr_Vec3 & theBoxMin, const SelectMgr_Vec3 & theBoxMax, SelectBasics_PickResult & thePickResult);

		/****** SelectMgr_SelectingVolumeManager::OverlapsBox ******/
		/****** md5 signature: 4811ebe00d4b1a89d64ffa793d81cfd8 ******/
		%feature("compactdefaultargs") OverlapsBox;
		%feature("autodoc", "
Parameters
----------
theBoxMin: SelectMgr_Vec3
theBoxMax: SelectMgr_Vec3
theInside: bool * (optional, default to NULL)

Return
-------
bool

Description
-----------
Returns true if selecting volume is overlapped by axis-aligned bounding box with minimum corner at point theminpt and maximum at point themaxpt.
") OverlapsBox;
		virtual Standard_Boolean OverlapsBox(const SelectMgr_Vec3 & theBoxMin, const SelectMgr_Vec3 & theBoxMax, Standard_Boolean * theInside = NULL);

		/****** SelectMgr_SelectingVolumeManager::OverlapsCircle ******/
		/****** md5 signature: a5e8b2ad3dd509a0ad4372aec7d3aede ******/
		%feature("compactdefaultargs") OverlapsCircle;
		%feature("autodoc", "
Parameters
----------
theBottomRad: float
theTrsf: gp_Trsf
theIsFilled: bool
thePickResult: SelectBasics_PickResult

Return
-------
bool

Description
-----------
Returns true if selecting volume is overlapped by circle with radius theradius, boolean theisfilled and transformation to apply thetrsf. the position and orientation of the circle are specified via thetrsf transformation for gp::xoy() with center in gp::origin().
") OverlapsCircle;
		virtual Standard_Boolean OverlapsCircle(const Standard_Real theBottomRad, const gp_Trsf & theTrsf, const Standard_Boolean theIsFilled, SelectBasics_PickResult & thePickResult);

		/****** SelectMgr_SelectingVolumeManager::OverlapsCircle ******/
		/****** md5 signature: cb1ebbe468321c3e49cdbee05abcc353 ******/
		%feature("compactdefaultargs") OverlapsCircle;
		%feature("autodoc", "
Parameters
----------
theBottomRad: float
theTrsf: gp_Trsf
theIsFilled: bool
theInside: bool * (optional, default to NULL)

Return
-------
bool

Description
-----------
Returns true if selecting volume is overlapped by circle with radius theradius, boolean theisfilled and transformation to apply thetrsf. the position and orientation of the circle are specified via thetrsf transformation for gp::xoy() with center in gp::origin().
") OverlapsCircle;
		virtual Standard_Boolean OverlapsCircle(const Standard_Real theBottomRad, const gp_Trsf & theTrsf, const Standard_Boolean theIsFilled, Standard_Boolean * theInside = NULL);

		/****** SelectMgr_SelectingVolumeManager::OverlapsCylinder ******/
		/****** md5 signature: d903d498b12867fd555a989bc565b71a ******/
		%feature("compactdefaultargs") OverlapsCylinder;
		%feature("autodoc", "
Parameters
----------
theBottomRad: float
theTopRad: float
theHeight: float
theTrsf: gp_Trsf
theIsHollow: bool
thePickResult: SelectBasics_PickResult

Return
-------
bool

Description
-----------
Returns true if selecting volume is overlapped by cylinder (or cone) with radiuses thebottomrad and thetoprad, height theheight and transformation to apply thetrsf.
") OverlapsCylinder;
		virtual Standard_Boolean OverlapsCylinder(const Standard_Real theBottomRad, const Standard_Real theTopRad, const Standard_Real theHeight, const gp_Trsf & theTrsf, const Standard_Boolean theIsHollow, SelectBasics_PickResult & thePickResult);

		/****** SelectMgr_SelectingVolumeManager::OverlapsCylinder ******/
		/****** md5 signature: bbb4061ebe4835347b55e7c89fef0fcc ******/
		%feature("compactdefaultargs") OverlapsCylinder;
		%feature("autodoc", "
Parameters
----------
theBottomRad: float
theTopRad: float
theHeight: float
theTrsf: gp_Trsf
theIsHollow: bool
theInside: bool * (optional, default to NULL)

Return
-------
bool

Description
-----------
Returns true if selecting volume is overlapped by cylinder (or cone) with radiuses thebottomrad and thetoprad, height theheight and transformation to apply thetrsf.
") OverlapsCylinder;
		virtual Standard_Boolean OverlapsCylinder(const Standard_Real theBottomRad, const Standard_Real theTopRad, const Standard_Real theHeight, const gp_Trsf & theTrsf, const Standard_Boolean theIsHollow, Standard_Boolean * theInside = NULL);

		/****** SelectMgr_SelectingVolumeManager::OverlapsPoint ******/
		/****** md5 signature: dc4b85981b0c33d2a566ec628898624d ******/
		%feature("compactdefaultargs") OverlapsPoint;
		%feature("autodoc", "
Parameters
----------
thePnt: gp_Pnt
thePickResult: SelectBasics_PickResult

Return
-------
bool

Description
-----------
Intersection test between defined volume and given point.
") OverlapsPoint;
		virtual Standard_Boolean OverlapsPoint(const gp_Pnt & thePnt, SelectBasics_PickResult & thePickResult);

		/****** SelectMgr_SelectingVolumeManager::OverlapsPoint ******/
		/****** md5 signature: d7b37b52b3a018e10f4074a808688275 ******/
		%feature("compactdefaultargs") OverlapsPoint;
		%feature("autodoc", "
Parameters
----------
thePnt: gp_Pnt

Return
-------
bool

Description
-----------
Intersection test between defined volume and given point.
") OverlapsPoint;
		virtual Standard_Boolean OverlapsPoint(const gp_Pnt & thePnt);

		/****** SelectMgr_SelectingVolumeManager::OverlapsPolygon ******/
		/****** md5 signature: 191ac64a95f79df4fa49ccb283f0714b ******/
		%feature("compactdefaultargs") OverlapsPolygon;
		%feature("autodoc", "
Parameters
----------
theArrayOfPts: TColgp_Array1OfPnt
theSensType: int
thePickResult: SelectBasics_PickResult

Return
-------
bool

Description
-----------
Sat intersection test between defined volume and given ordered set of points, representing line segments. the test may be considered of interior part or boundary line defined by segments depending on given sensitivity type.
") OverlapsPolygon;
		virtual Standard_Boolean OverlapsPolygon(const TColgp_Array1OfPnt & theArrayOfPts, Standard_Integer theSensType, SelectBasics_PickResult & thePickResult);

		/****** SelectMgr_SelectingVolumeManager::OverlapsSegment ******/
		/****** md5 signature: 9facfbdce7f5efd87b89a4104b49953f ******/
		%feature("compactdefaultargs") OverlapsSegment;
		%feature("autodoc", "
Parameters
----------
thePnt1: gp_Pnt
thePnt2: gp_Pnt
thePickResult: SelectBasics_PickResult

Return
-------
bool

Description
-----------
Checks if line segment overlaps selecting frustum.
") OverlapsSegment;
		virtual Standard_Boolean OverlapsSegment(const gp_Pnt & thePnt1, const gp_Pnt & thePnt2, SelectBasics_PickResult & thePickResult);

		/****** SelectMgr_SelectingVolumeManager::OverlapsSphere ******/
		/****** md5 signature: e847078d05a6a0ce1e7e3f093c489ddb ******/
		%feature("compactdefaultargs") OverlapsSphere;
		%feature("autodoc", "
Parameters
----------
theCenter: gp_Pnt
theRadius: float
thePickResult: SelectBasics_PickResult

Return
-------
bool

Description
-----------
Intersection test between defined volume and given sphere.
") OverlapsSphere;
		virtual Standard_Boolean OverlapsSphere(const gp_Pnt & theCenter, const Standard_Real theRadius, SelectBasics_PickResult & thePickResult);

		/****** SelectMgr_SelectingVolumeManager::OverlapsSphere ******/
		/****** md5 signature: 2b7a70713e1032389098753ec8495331 ******/
		%feature("compactdefaultargs") OverlapsSphere;
		%feature("autodoc", "
Parameters
----------
theCenter: gp_Pnt
theRadius: float
theInside: bool * (optional, default to NULL)

Return
-------
bool

Description
-----------
Intersection test between defined volume and given sphere.
") OverlapsSphere;
		virtual Standard_Boolean OverlapsSphere(const gp_Pnt & theCenter, const Standard_Real theRadius, Standard_Boolean * theInside = NULL);

		/****** SelectMgr_SelectingVolumeManager::OverlapsTriangle ******/
		/****** md5 signature: 638ac865012392274d476eb994ef2dfc ******/
		%feature("compactdefaultargs") OverlapsTriangle;
		%feature("autodoc", "
Parameters
----------
thePnt1: gp_Pnt
thePnt2: gp_Pnt
thePnt3: gp_Pnt
theSensType: int
thePickResult: SelectBasics_PickResult

Return
-------
bool

Description
-----------
Sat intersection test between defined volume and given triangle. the test may be considered of interior part or boundary line defined by triangle vertices depending on given sensitivity type.
") OverlapsTriangle;
		virtual Standard_Boolean OverlapsTriangle(const gp_Pnt & thePnt1, const gp_Pnt & thePnt2, const gp_Pnt & thePnt3, Standard_Integer theSensType, SelectBasics_PickResult & thePickResult);

		/****** SelectMgr_SelectingVolumeManager::ScaleAndTransform ******/
		/****** md5 signature: 52c642a3c1880fb8abb130dbb36a0aff ******/
		%feature("compactdefaultargs") ScaleAndTransform;
		%feature("autodoc", "
Parameters
----------
theScaleFactor: int
theTrsf: gp_GTrsf
theBuilder: SelectMgr_FrustumBuilder

Return
-------
SelectMgr_SelectingVolumeManager

Description
-----------
Important: scaling makes sense only for frustum built on a single point! note that this method does not perform any checks on type of the frustum. //! returns a copy of the frustum resized according to the scale factor given and transforms it using the matrix given. there are no default parameters, but in case if: - transformation only is needed: @thescalefactor must be initialized as any negative value; - scale only is needed: @thetrsf must be set to gp_identity. builder is an optional argument that represents corresponding settings for re-constructing transformed frustum from scratch. can be null if reconstruction is not expected furthermore.
") ScaleAndTransform;
		virtual SelectMgr_SelectingVolumeManager ScaleAndTransform(const Standard_Integer theScaleFactor, const gp_GTrsf & theTrsf, const opencascade::handle<SelectMgr_FrustumBuilder> & theBuilder);

		/****** SelectMgr_SelectingVolumeManager::SetCamera ******/
		/****** md5 signature: feb4846a043de91d4d1b29714dfe3b70 ******/
		%feature("compactdefaultargs") SetCamera;
		%feature("autodoc", "
Parameters
----------
theCamera: Graphic3d_Camera

Return
-------
None

Description
-----------
Updates camera projection and orientation matrices in all selecting volumes note: this method should be called after selection volume building else exception will be thrown.
") SetCamera;
		void SetCamera(const opencascade::handle<Graphic3d_Camera> & theCamera);

		/****** SelectMgr_SelectingVolumeManager::SetPixelTolerance ******/
		/****** md5 signature: fda084bdc0d0a8e945d1f4e82a500297 ******/
		%feature("compactdefaultargs") SetPixelTolerance;
		%feature("autodoc", "
Parameters
----------
theTolerance: int

Return
-------
None

Description
-----------
Updates pixel tolerance in all selecting volumes note: this method should be called after selection volume building else exception will be thrown.
") SetPixelTolerance;
		void SetPixelTolerance(const Standard_Integer theTolerance);

		/****** SelectMgr_SelectingVolumeManager::SetViewClipRanges ******/
		/****** md5 signature: 93d9d36012f3af07e2014408dc48db5e ******/
		%feature("compactdefaultargs") SetViewClipRanges;
		%feature("autodoc", "
Parameters
----------
theRange: SelectMgr_ViewClipRange

Return
-------
None

Description
-----------
Set clipping range.
") SetViewClipRanges;
		void SetViewClipRanges(const SelectMgr_ViewClipRange & theRange);

		/****** SelectMgr_SelectingVolumeManager::SetViewClipping ******/
		/****** md5 signature: 2c9fd571f2260a9e201451b7c935a508 ******/
		%feature("compactdefaultargs") SetViewClipping;
		%feature("autodoc", "
Parameters
----------
theViewPlanes: Graphic3d_SequenceOfHClipPlane
theObjPlanes: Graphic3d_SequenceOfHClipPlane
theWorldSelMgr: SelectMgr_SelectingVolumeManager *

Return
-------
None

Description
-----------
Valid for point selection only! computes depth range for clipping planes. @param theviewplanes [in] global view planes @param theobjplanes [in] object planes @param theworldselmgr [in] selection volume in world space for computing clipping plane ranges.
") SetViewClipping;
		void SetViewClipping(const opencascade::handle<Graphic3d_SequenceOfHClipPlane> & theViewPlanes, const opencascade::handle<Graphic3d_SequenceOfHClipPlane> & theObjPlanes, const SelectMgr_SelectingVolumeManager * theWorldSelMgr);

		/****** SelectMgr_SelectingVolumeManager::SetViewClipping ******/
		/****** md5 signature: 4bbee3b7345b92c8790bf91a52eda8f9 ******/
		%feature("compactdefaultargs") SetViewClipping;
		%feature("autodoc", "
Parameters
----------
theOther: SelectMgr_SelectingVolumeManager

Return
-------
None

Description
-----------
Copy clipping planes from another volume manager.
") SetViewClipping;
		void SetViewClipping(const SelectMgr_SelectingVolumeManager & theOther);

		/****** SelectMgr_SelectingVolumeManager::SetViewport ******/
		/****** md5 signature: 8a132d12573d3301f6dc1103aa3c5d06 ******/
		%feature("compactdefaultargs") SetViewport;
		%feature("autodoc", "
Parameters
----------
theX: float
theY: float
theWidth: float
theHeight: float

Return
-------
None

Description
-----------
Updates viewport in all selecting volumes note: this method should be called after selection volume building else exception will be thrown.
") SetViewport;
		void SetViewport(const Standard_Real theX, const Standard_Real theY, const Standard_Real theWidth, const Standard_Real theHeight);

		/****** SelectMgr_SelectingVolumeManager::SetWindowSize ******/
		/****** md5 signature: 8f5369c74a4835dacda32c89cfdc6f2a ******/
		%feature("compactdefaultargs") SetWindowSize;
		%feature("autodoc", "
Parameters
----------
theWidth: int
theHeight: int

Return
-------
None

Description
-----------
Updates window size in all selecting volumes note: this method should be called after selection volume building else exception will be thrown.
") SetWindowSize;
		void SetWindowSize(const Standard_Integer theWidth, const Standard_Integer theHeight);

		/****** SelectMgr_SelectingVolumeManager::ViewClipRanges ******/
		/****** md5 signature: 4220e845cb705bc0e9750141f885c41f ******/
		%feature("compactdefaultargs") ViewClipRanges;
		%feature("autodoc", "Return
-------
SelectMgr_ViewClipRange

Description
-----------
Return clipping range.
") ViewClipRanges;
		const SelectMgr_ViewClipRange & ViewClipRanges();

		/****** SelectMgr_SelectingVolumeManager::ViewClipping ******/
		/****** md5 signature: 7e2b1776e743c0bba9fdb2ed8c5b003c ******/
		%feature("compactdefaultargs") ViewClipping;
		%feature("autodoc", "Return
-------
opencascade::handle<Graphic3d_SequenceOfHClipPlane>

Description
-----------
Return view clipping planes.
") ViewClipping;
		const opencascade::handle<Graphic3d_SequenceOfHClipPlane> & ViewClipping();

		/****** SelectMgr_SelectingVolumeManager::WindowSize ******/
		/****** md5 signature: b6b9e026658a5426a88d46691f9f9543 ******/
		%feature("compactdefaultargs") WindowSize;
		%feature("autodoc", "
Parameters
----------

Return
-------
theWidth: int
theHeight: int

Description
-----------
Returns window size.
") WindowSize;
		void WindowSize(Standard_Integer &OutValue, Standard_Integer &OutValue);

};


%extend SelectMgr_SelectingVolumeManager {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class SelectMgr_Selection *
****************************/
class SelectMgr_Selection : public Standard_Transient {
	public:
		/****** SelectMgr_Selection::SelectMgr_Selection ******/
		/****** md5 signature: 9ac3ca045be3031d968cd042caaac23f ******/
		%feature("compactdefaultargs") SelectMgr_Selection;
		%feature("autodoc", "
Parameters
----------
theModeIdx: int (optional, default to 0)

Return
-------
None

Description
-----------
Constructs a selection object defined by the selection mode idmode. the default setting 0 is the selection mode for a shape in its entirety.
") SelectMgr_Selection;
		 SelectMgr_Selection(const Standard_Integer theModeIdx = 0);

		/****** SelectMgr_Selection::Add ******/
		/****** md5 signature: 71a26d66d0f562b3cb53c9a86dd02409 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
theSensitive: Select3D_SensitiveEntity

Return
-------
None

Description
-----------
Adds the sensitive primitive to the list of stored entities in this object. raises nullobject if the primitive is a null handle.
") Add;
		void Add(const opencascade::handle<Select3D_SensitiveEntity> & theSensitive);

		/****** SelectMgr_Selection::BVHUpdateStatus ******/
		/****** md5 signature: 1110c41ad7c435b224c56e67bbd4e6f9 ******/
		%feature("compactdefaultargs") BVHUpdateStatus;
		%feature("autodoc", "Return
-------
SelectMgr_TypeOfBVHUpdate

Description
-----------
No available documentation.
") BVHUpdateStatus;
		SelectMgr_TypeOfBVHUpdate BVHUpdateStatus();

		/****** SelectMgr_Selection::ChangeEntities ******/
		/****** md5 signature: adcd43d4b51e901d1edf4ce65316d338 ******/
		%feature("compactdefaultargs") ChangeEntities;
		%feature("autodoc", "Return
-------
NCollection_Vector<opencascade::handle<SelectMgr_SensitiveEntity>>

Description
-----------
Return entities.
") ChangeEntities;
		NCollection_Vector<opencascade::handle<SelectMgr_SensitiveEntity>> & ChangeEntities();

		/****** SelectMgr_Selection::Clear ******/
		/****** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empties the selection from all the stored entities.
") Clear;
		void Clear();

		/****** SelectMgr_Selection::Destroy ******/
		/****** md5 signature: 73111f72f4ab0474eb2cfbd7e4af4e1a ******/
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Destroy;
		void Destroy();


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
		/****** SelectMgr_Selection::Entities ******/
		/****** md5 signature: 09e4230714e880893271b506a744f5d3 ******/
		%feature("compactdefaultargs") Entities;
		%feature("autodoc", "Return
-------
NCollection_Vector<opencascade::handle<SelectMgr_SensitiveEntity>>

Description
-----------
Return entities.
") Entities;
		const NCollection_Vector<opencascade::handle<SelectMgr_SensitiveEntity>> & Entities();

		/****** SelectMgr_Selection::GetSelectionState ******/
		/****** md5 signature: a623ca145bbd40bbc568a61186b88449 ******/
		%feature("compactdefaultargs") GetSelectionState;
		%feature("autodoc", "Return
-------
SelectMgr_StateOfSelection

Description
-----------
Returns status of selection.
") GetSelectionState;
		SelectMgr_StateOfSelection GetSelectionState();

		/****** SelectMgr_Selection::IsEmpty ******/
		/****** md5 signature: d529c07ce9e12eea3222188c82b0e80b ******/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if no sensitive entity is stored.
") IsEmpty;
		Standard_Boolean IsEmpty();

		/****** SelectMgr_Selection::Mode ******/
		/****** md5 signature: b35445cddc9deccdf8a4cb5a0f8a439b ******/
		%feature("compactdefaultargs") Mode;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the selection mode represented by this selection.
") Mode;
		Standard_Integer Mode();

		/****** SelectMgr_Selection::Sensitivity ******/
		/****** md5 signature: 894e656cca525e78bf786c9f7c8e748c ******/
		%feature("compactdefaultargs") Sensitivity;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns sensitivity of the selection.
") Sensitivity;
		Standard_Integer Sensitivity();

		/****** SelectMgr_Selection::SetSelectionState ******/
		/****** md5 signature: 52315cee0ff9f6ef54aa507592384dcb ******/
		%feature("compactdefaultargs") SetSelectionState;
		%feature("autodoc", "
Parameters
----------
theState: SelectMgr_StateOfSelection

Return
-------
None

Description
-----------
Sets status of selection.
") SetSelectionState;
		void SetSelectionState(const SelectMgr_StateOfSelection theState);

		/****** SelectMgr_Selection::SetSensitivity ******/
		/****** md5 signature: f2ec8e66d8f4652f3773fe91d3990c07 ******/
		%feature("compactdefaultargs") SetSensitivity;
		%feature("autodoc", "
Parameters
----------
theNewSens: int

Return
-------
None

Description
-----------
Changes sensitivity of the selection and all its entities to the given value. important: this method does not update any outer selection structures, so for proper updates use selectmgr_selectionmanager::setselectionsensitivity method.
") SetSensitivity;
		void SetSensitivity(const Standard_Integer theNewSens);

		/****** SelectMgr_Selection::UpdateBVHStatus ******/
		/****** md5 signature: 625f0bf1e7f890f4f4f356ca8beab0d9 ******/
		%feature("compactdefaultargs") UpdateBVHStatus;
		%feature("autodoc", "
Parameters
----------
theStatus: SelectMgr_TypeOfBVHUpdate

Return
-------
None

Description
-----------
No available documentation.
") UpdateBVHStatus;
		void UpdateBVHStatus(const SelectMgr_TypeOfBVHUpdate theStatus);

		/****** SelectMgr_Selection::UpdateStatus ******/
		/****** md5 signature: c898c727f89f53f62f8406c0076e8e77 ******/
		%feature("compactdefaultargs") UpdateStatus;
		%feature("autodoc", "Return
-------
SelectMgr_TypeOfUpdate

Description
-----------
Returns the flag updateflag. this flage gives the update status of this framework in a viewerselector object: - full - partial, or - none.
") UpdateStatus;
		SelectMgr_TypeOfUpdate UpdateStatus();

		/****** SelectMgr_Selection::UpdateStatus ******/
		/****** md5 signature: defd205153f48235659901d7ab5173ed ******/
		%feature("compactdefaultargs") UpdateStatus;
		%feature("autodoc", "
Parameters
----------
theStatus: SelectMgr_TypeOfUpdate

Return
-------
None

Description
-----------
No available documentation.
") UpdateStatus;
		void UpdateStatus(const SelectMgr_TypeOfUpdate theStatus);

};


%make_alias(SelectMgr_Selection)

%extend SelectMgr_Selection {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************
* class SelectMgr_SelectionImageFiller *
***************************************/
%nodefaultctor SelectMgr_SelectionImageFiller;
class SelectMgr_SelectionImageFiller : public Standard_Transient {
	public:
		/****** SelectMgr_SelectionImageFiller::Fill ******/
		/****** md5 signature: ac33eb3f0186edc584f4a3ec924c4232 ******/
		%feature("compactdefaultargs") Fill;
		%feature("autodoc", "
Parameters
----------
theCol: int
theRow: int
thePicked: int

Return
-------
None

Description
-----------
Fill pixel at specified position.
") Fill;
		virtual void Fill(const Standard_Integer theCol, const Standard_Integer theRow, const Standard_Integer thePicked);

		/****** SelectMgr_SelectionImageFiller::Flush ******/
		/****** md5 signature: 0b647fbdc1be587b83fd253c3c168f73 ******/
		%feature("compactdefaultargs") Flush;
		%feature("autodoc", "Return
-------
None

Description
-----------
Flush results into final image.
") Flush;
		virtual void Flush();

};


%make_alias(SelectMgr_SelectionImageFiller)

%extend SelectMgr_SelectionImageFiller {
	%pythoncode {
	__repr__ = _dumps_object

	@methodnotwrapped
	def CreateFiller(self):
		pass
	}
};

/***********************************
* class SelectMgr_SelectionManager *
***********************************/
class SelectMgr_SelectionManager : public Standard_Transient {
	public:
		/****** SelectMgr_SelectionManager::SelectMgr_SelectionManager ******/
		/****** md5 signature: a33a6ce5e04db4fec58e33077a28c9e2 ******/
		%feature("compactdefaultargs") SelectMgr_SelectionManager;
		%feature("autodoc", "
Parameters
----------
theSelector: SelectMgr_ViewerSelector

Return
-------
None

Description
-----------
Constructs an empty selection manager object.
") SelectMgr_SelectionManager;
		 SelectMgr_SelectionManager(const opencascade::handle<SelectMgr_ViewerSelector> & theSelector);

		/****** SelectMgr_SelectionManager::Activate ******/
		/****** md5 signature: 37a9576e90f83c38812f4f39f0f7470d ******/
		%feature("compactdefaultargs") Activate;
		%feature("autodoc", "
Parameters
----------
theObject: SelectMgr_SelectableObject
theMode: int (optional, default to 0)

Return
-------
None

Description
-----------
Activates the selection mode themode in the selector theselector for the selectable object anobject. by default, themode is equal to 0. if theselector is set to default (null), the selection with the mode themode will be activated in all the viewers available.
") Activate;
		void Activate(const opencascade::handle<SelectMgr_SelectableObject> & theObject, const Standard_Integer theMode = 0);

		/****** SelectMgr_SelectionManager::ClearSelectionStructures ******/
		/****** md5 signature: ebfea862f43b96343951ec99b7fdaf01 ******/
		%feature("compactdefaultargs") ClearSelectionStructures;
		%feature("autodoc", "
Parameters
----------
theObj: SelectMgr_SelectableObject
theMode: int (optional, default to -1)

Return
-------
None

Description
-----------
Removes sensitive entities from all viewer selectors after method clear() was called to the selection they belonged to or it was recomputed somehow.
") ClearSelectionStructures;
		void ClearSelectionStructures(const opencascade::handle<SelectMgr_SelectableObject> & theObj, const Standard_Integer theMode = -1);

		/****** SelectMgr_SelectionManager::Contains ******/
		/****** md5 signature: 78a3e6bbff753619951717c11cf591d9 ******/
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "
Parameters
----------
theObject: SelectMgr_SelectableObject

Return
-------
bool

Description
-----------
Returns true if the manager contains the selectable object theobject.
") Contains;
		Standard_Boolean Contains(const opencascade::handle<SelectMgr_SelectableObject> & theObject);

		/****** SelectMgr_SelectionManager::Deactivate ******/
		/****** md5 signature: d5b2c3b0bad1d008ddd47b0f6bf05482 ******/
		%feature("compactdefaultargs") Deactivate;
		%feature("autodoc", "
Parameters
----------
theObject: SelectMgr_SelectableObject
theMode: int (optional, default to -1)

Return
-------
None

Description
-----------
Deactivates mode themode of theobject in theselector. if themode value is set to default (-1), all active selection modes will be deactivated. likewise, if theselector value is set to default (null), themode will be deactivated in all viewer selectors.
") Deactivate;
		void Deactivate(const opencascade::handle<SelectMgr_SelectableObject> & theObject, const Standard_Integer theMode = -1);

		/****** SelectMgr_SelectionManager::IsActivated ******/
		/****** md5 signature: 7740a684256eb944801d8f6eb45d6b6e ******/
		%feature("compactdefaultargs") IsActivated;
		%feature("autodoc", "
Parameters
----------
theObject: SelectMgr_SelectableObject
theMode: int (optional, default to -1)

Return
-------
bool

Description
-----------
Returns true if the selection with themode is active for the selectable object theobject and selector theselector. if all parameters are set to default values, it returns it there is any active selection in any known viewer selector for object theobject.
") IsActivated;
		Standard_Boolean IsActivated(const opencascade::handle<SelectMgr_SelectableObject> & theObject, const Standard_Integer theMode = -1);

		/****** SelectMgr_SelectionManager::Load ******/
		/****** md5 signature: e6b1abe0ec87c3850182d093010bd2a9 ******/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "
Parameters
----------
theObject: SelectMgr_SelectableObject
theMode: int (optional, default to -1)

Return
-------
None

Description
-----------
Loads and computes selection mode themode (if it is not equal to -1) in global context and adds selectable object to bvh tree. if the object theobject has an already calculated selection with mode themode and it was removed, the selection will be recalculated.
") Load;
		void Load(const opencascade::handle<SelectMgr_SelectableObject> & theObject, const Standard_Integer theMode = -1);

		/****** SelectMgr_SelectionManager::RecomputeSelection ******/
		/****** md5 signature: e300f8385906c722b92102da39866740 ******/
		%feature("compactdefaultargs") RecomputeSelection;
		%feature("autodoc", "
Parameters
----------
theObject: SelectMgr_SelectableObject
theIsForce: bool (optional, default to Standard_False)
theMode: int (optional, default to -1)

Return
-------
None

Description
-----------
Recomputes activated selections of theobject for all known viewer selectors according to themode specified. if themode is set to default (-1), then all activated selections will be recomputed. if theisforce is set to true, then selection mode themode for object theobject will be recomputed regardless of its activation status.
") RecomputeSelection;
		void RecomputeSelection(const opencascade::handle<SelectMgr_SelectableObject> & theObject, const Standard_Boolean theIsForce = Standard_False, const Standard_Integer theMode = -1);

		/****** SelectMgr_SelectionManager::Remove ******/
		/****** md5 signature: 5c3ed8204b6dc5eb677f6f9a648ae5af ******/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "
Parameters
----------
theObject: SelectMgr_SelectableObject

Return
-------
None

Description
-----------
Removes selectable object theobject from all viewer selectors it was added to previously, removes it from all contexts and clears all computed selections of theobject.
") Remove;
		void Remove(const opencascade::handle<SelectMgr_SelectableObject> & theObject);

		/****** SelectMgr_SelectionManager::RestoreSelectionStructures ******/
		/****** md5 signature: 36d61c341ed8fda882c98e9c56dffe4b ******/
		%feature("compactdefaultargs") RestoreSelectionStructures;
		%feature("autodoc", "
Parameters
----------
theObj: SelectMgr_SelectableObject
theMode: int (optional, default to -1)

Return
-------
None

Description
-----------
Re-adds newly calculated sensitive entities of recomputed selection defined by mode themode to all viewer selectors contained that selection.
") RestoreSelectionStructures;
		void RestoreSelectionStructures(const opencascade::handle<SelectMgr_SelectableObject> & theObj, const Standard_Integer theMode = -1);

		/****** SelectMgr_SelectionManager::Selector ******/
		/****** md5 signature: e8522c885bf82402a0d8d84a7ddb20d4 ******/
		%feature("compactdefaultargs") Selector;
		%feature("autodoc", "Return
-------
opencascade::handle<SelectMgr_ViewerSelector>

Description
-----------
Return the selector.
") Selector;
		const opencascade::handle<SelectMgr_ViewerSelector> & Selector();

		/****** SelectMgr_SelectionManager::SetSelectionSensitivity ******/
		/****** md5 signature: 96fed071fae2e728644acb87b701b105 ******/
		%feature("compactdefaultargs") SetSelectionSensitivity;
		%feature("autodoc", "
Parameters
----------
theObject: SelectMgr_SelectableObject
theMode: int
theNewSens: int

Return
-------
None

Description
-----------
Allows to manage sensitivity of a particular selection of interactive object theobject and changes previous sensitivity value of all sensitive entities in selection with themode to the given thenewsensitivity.
") SetSelectionSensitivity;
		void SetSelectionSensitivity(const opencascade::handle<SelectMgr_SelectableObject> & theObject, const Standard_Integer theMode, const Standard_Integer theNewSens);

		/****** SelectMgr_SelectionManager::SetUpdateMode ******/
		/****** md5 signature: 217adbac30d2e6e8e02226954bf1cf79 ******/
		%feature("compactdefaultargs") SetUpdateMode;
		%feature("autodoc", "
Parameters
----------
theObject: SelectMgr_SelectableObject
theType: SelectMgr_TypeOfUpdate

Return
-------
None

Description
-----------
Sets type of update of all selections of theobject to the given thetype.
") SetUpdateMode;
		void SetUpdateMode(const opencascade::handle<SelectMgr_SelectableObject> & theObject, const SelectMgr_TypeOfUpdate theType);

		/****** SelectMgr_SelectionManager::SetUpdateMode ******/
		/****** md5 signature: 03c8b733d6c03b59708a515b2907828a ******/
		%feature("compactdefaultargs") SetUpdateMode;
		%feature("autodoc", "
Parameters
----------
theObject: SelectMgr_SelectableObject
theMode: int
theType: SelectMgr_TypeOfUpdate

Return
-------
None

Description
-----------
Sets type of update of selection with themode of theobject to the given thetype.
") SetUpdateMode;
		void SetUpdateMode(const opencascade::handle<SelectMgr_SelectableObject> & theObject, const Standard_Integer theMode, const SelectMgr_TypeOfUpdate theType);

		/****** SelectMgr_SelectionManager::Update ******/
		/****** md5 signature: 343dab128743b4328530093d30198fd7 ******/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "
Parameters
----------
theObject: SelectMgr_SelectableObject
theIsForce: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Updates all selections of theobject in all viewer selectors according to its current update status. if theisforce is set to true, the call is equal to recomputation.
") Update;
		void Update(const opencascade::handle<SelectMgr_SelectableObject> & theObject, const Standard_Boolean theIsForce = Standard_True);

		/****** SelectMgr_SelectionManager::UpdateSelection ******/
		/****** md5 signature: 90140c94519afc73ed5d79551b57949f ******/
		%feature("compactdefaultargs") UpdateSelection;
		%feature("autodoc", "
Parameters
----------
theObj: SelectMgr_SelectableObject

Return
-------
None

Description
-----------
Re-adds selectable object in bvhs in all viewer selectors.
") UpdateSelection;
		void UpdateSelection(const opencascade::handle<SelectMgr_SelectableObject> & theObj);

};


%make_alias(SelectMgr_SelectionManager)

%extend SelectMgr_SelectionManager {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class SelectMgr_SensitiveEntity *
**********************************/
class SelectMgr_SensitiveEntity : public Standard_Transient {
	public:
		/****** SelectMgr_SensitiveEntity::SelectMgr_SensitiveEntity ******/
		/****** md5 signature: 296820d294b82944d37fce98c6b9e5d5 ******/
		%feature("compactdefaultargs") SelectMgr_SensitiveEntity;
		%feature("autodoc", "
Parameters
----------
theEntity: Select3D_SensitiveEntity

Return
-------
None

Description
-----------
Creates new inactive for selection object with base entity theentity.
") SelectMgr_SensitiveEntity;
		 SelectMgr_SensitiveEntity(const opencascade::handle<Select3D_SensitiveEntity> & theEntity);

		/****** SelectMgr_SensitiveEntity::BaseSensitive ******/
		/****** md5 signature: 16a2410d165ca7cb125aa41b7e51de25 ******/
		%feature("compactdefaultargs") BaseSensitive;
		%feature("autodoc", "Return
-------
opencascade::handle<Select3D_SensitiveEntity>

Description
-----------
Returns related instance of selectbasics class.
") BaseSensitive;
		const opencascade::handle<Select3D_SensitiveEntity> & BaseSensitive();

		/****** SelectMgr_SensitiveEntity::Clear ******/
		/****** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clears up all resources and memory.
") Clear;
		void Clear();


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
		/****** SelectMgr_SensitiveEntity::IsActiveForSelection ******/
		/****** md5 signature: 3187ce5cffb320503d698db8ebb12ce6 ******/
		%feature("compactdefaultargs") IsActiveForSelection;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if this entity belongs to the active selection mode of parent object.
") IsActiveForSelection;
		Standard_Boolean IsActiveForSelection();

		/****** SelectMgr_SensitiveEntity::ResetSelectionActiveStatus ******/
		/****** md5 signature: 402136f369578fcfbf1be5ee51c22a53 ******/
		%feature("compactdefaultargs") ResetSelectionActiveStatus;
		%feature("autodoc", "Return
-------
None

Description
-----------
Marks entity as inactive for selection.
") ResetSelectionActiveStatus;
		void ResetSelectionActiveStatus();

		/****** SelectMgr_SensitiveEntity::SetActiveForSelection ******/
		/****** md5 signature: 6d7c1b09ac81855201e92a9953e1b83e ******/
		%feature("compactdefaultargs") SetActiveForSelection;
		%feature("autodoc", "Return
-------
None

Description
-----------
Marks entity as active for selection.
") SetActiveForSelection;
		void SetActiveForSelection();

};


%make_alias(SelectMgr_SensitiveEntity)

%extend SelectMgr_SensitiveEntity {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class SelectMgr_SensitiveEntitySet *
*************************************/
class SelectMgr_SensitiveEntitySet : public BVH_PrimitiveSet3d {
	public:
		/****** SelectMgr_SensitiveEntitySet::SelectMgr_SensitiveEntitySet ******/
		/****** md5 signature: 4816c11ef4f210373f40e888a47a7c51 ******/
		%feature("compactdefaultargs") SelectMgr_SensitiveEntitySet;
		%feature("autodoc", "
Parameters
----------
theBuilder: Select3D_BVHBuilder3d

Return
-------
None

Description
-----------
Empty constructor.
") SelectMgr_SensitiveEntitySet;
		 SelectMgr_SensitiveEntitySet(const opencascade::handle<Select3D_BVHBuilder3d> & theBuilder);

		/****** SelectMgr_SensitiveEntitySet::Append ******/
		/****** md5 signature: f1f2d6cb2f3466312e4080ad7518780c ******/
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "
Parameters
----------
theEntity: SelectMgr_SensitiveEntity

Return
-------
None

Description
-----------
Adds new entity to the set and marks bvh tree for rebuild.
") Append;
		void Append(const opencascade::handle<SelectMgr_SensitiveEntity> & theEntity);

		/****** SelectMgr_SensitiveEntitySet::Append ******/
		/****** md5 signature: e6591546193c1ce19d53703585f4f17a ******/
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "
Parameters
----------
theSelection: SelectMgr_Selection

Return
-------
None

Description
-----------
Adds every entity of selection theselection to the set and marks bvh tree for rebuild.
") Append;
		void Append(const opencascade::handle<SelectMgr_Selection> & theSelection);

		/****** SelectMgr_SensitiveEntitySet::Box ******/
		/****** md5 signature: 22c3eb5645e6347dd0035e626594efa9 ******/
		%feature("compactdefaultargs") Box;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
Select3D_BndBox3d

Description
-----------
Returns bounding box of entity with index theidx.
") Box;
		virtual Select3D_BndBox3d Box(const Standard_Integer theIndex);

		/****** SelectMgr_SensitiveEntitySet::Center ******/
		/****** md5 signature: 48de7c6a76513e5acf63fc9dd37f0c0a ******/
		%feature("compactdefaultargs") Center;
		%feature("autodoc", "
Parameters
----------
theIndex: int
theAxis: int

Return
-------
float

Description
-----------
Returns geometry center of sensitive entity index theidx along the given axis theaxis.
") Center;
		virtual Standard_Real Center(const Standard_Integer theIndex, const Standard_Integer theAxis);

		/****** SelectMgr_SensitiveEntitySet::GetSensitiveById ******/
		/****** md5 signature: 0ecedd38df9fbb4e470a13be1d749c50 ******/
		%feature("compactdefaultargs") GetSensitiveById;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
opencascade::handle<SelectMgr_SensitiveEntity>

Description
-----------
Returns the entity with index theindex in the set.
") GetSensitiveById;
		const opencascade::handle<SelectMgr_SensitiveEntity> & GetSensitiveById(const Standard_Integer theIndex);

		/****** SelectMgr_SensitiveEntitySet::HasEntityWithPersistence ******/
		/****** md5 signature: 881be9af2b4b9997aeaef6aa199c6613 ******/
		%feature("compactdefaultargs") HasEntityWithPersistence;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns map of entities.
") HasEntityWithPersistence;
		Standard_Boolean HasEntityWithPersistence();

		/****** SelectMgr_SensitiveEntitySet::Owners ******/
		/****** md5 signature: 70c8cbbe5355e413322d0ca24aff8221 ******/
		%feature("compactdefaultargs") Owners;
		%feature("autodoc", "Return
-------
SelectMgr_MapOfOwners

Description
-----------
Returns map of owners.
") Owners;
		const SelectMgr_MapOfOwners & Owners();

		/****** SelectMgr_SensitiveEntitySet::Remove ******/
		/****** md5 signature: a10f175ccd1487b6c7e3d1ea673a92cf ******/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "
Parameters
----------
theSelection: SelectMgr_Selection

Return
-------
None

Description
-----------
Removes every entity of selection theselection from the set and marks bvh tree for rebuild.
") Remove;
		void Remove(const opencascade::handle<SelectMgr_Selection> & theSelection);

		/****** SelectMgr_SensitiveEntitySet::Sensitives ******/
		/****** md5 signature: 67c2bd61a84de23112cd1ec72645954f ******/
		%feature("compactdefaultargs") Sensitives;
		%feature("autodoc", "Return
-------
SelectMgr_IndexedMapOfHSensitive

Description
-----------
Returns map of entities.
") Sensitives;
		const SelectMgr_IndexedMapOfHSensitive & Sensitives();

		/****** SelectMgr_SensitiveEntitySet::Size ******/
		/****** md5 signature: 8b9290cdf9c653fc150b9b31776f3f21 ******/
		%feature("compactdefaultargs") Size;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the amount of entities.
") Size;
		virtual Standard_Integer Size();

		/****** SelectMgr_SensitiveEntitySet::Swap ******/
		/****** md5 signature: 4f3a1d9a66c5faf13938607dcfe6badf ******/
		%feature("compactdefaultargs") Swap;
		%feature("autodoc", "
Parameters
----------
theIndex1: int
theIndex2: int

Return
-------
None

Description
-----------
Swaps items with indexes theidx1 and theidx2.
") Swap;
		virtual void Swap(const Standard_Integer theIndex1, const Standard_Integer theIndex2);

};


%extend SelectMgr_SensitiveEntitySet {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class SelectMgr_SortCriterion *
********************************/
class SelectMgr_SortCriterion {
	public:
		opencascade::handle<Select3D_SensitiveEntity > Entity;
		gp_Pnt Point;
		Graphic3d_Vec3 Normal;
		float Depth;
		float MinDist;
		float Tolerance;
		int Priority;
		int ZLayerPosition;
		int NbOwnerMatches;
		/****** SelectMgr_SortCriterion::SelectMgr_SortCriterion ******/
		/****** md5 signature: 7c43477619c7a9df7500d7db5ac6145a ******/
		%feature("compactdefaultargs") SelectMgr_SortCriterion;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") SelectMgr_SortCriterion;
		 SelectMgr_SortCriterion();

		/****** SelectMgr_SortCriterion::IsCloserDepth ******/
		/****** md5 signature: f54c02ecbb70ec9f3fd99f77b918a45b ******/
		%feature("compactdefaultargs") IsCloserDepth;
		%feature("autodoc", "
Parameters
----------
theOther: SelectMgr_SortCriterion

Return
-------
bool

Description
-----------
Compare with another item by depth, priority and mindist.
") IsCloserDepth;
		bool IsCloserDepth(const SelectMgr_SortCriterion & theOther);

		/****** SelectMgr_SortCriterion::IsHigherPriority ******/
		/****** md5 signature: 7ef827a8f908cd593cb19194e4c3327d ******/
		%feature("compactdefaultargs") IsHigherPriority;
		%feature("autodoc", "
Parameters
----------
theOther: SelectMgr_SortCriterion

Return
-------
bool

Description
-----------
Compare with another item using old logic (occt version <= 6.3.1) with priority considered preceding depth.
") IsHigherPriority;
		bool IsHigherPriority(const SelectMgr_SortCriterion & theOther);

};


%extend SelectMgr_SortCriterion {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class SelectMgr_ToleranceMap *
*******************************/
class SelectMgr_ToleranceMap {
	public:
		/****** SelectMgr_ToleranceMap::SelectMgr_ToleranceMap ******/
		/****** md5 signature: 46903483ae2b6a3dcfe4495acae47180 ******/
		%feature("compactdefaultargs") SelectMgr_ToleranceMap;
		%feature("autodoc", "Return
-------
None

Description
-----------
Sets tolerance values to -1.0.
") SelectMgr_ToleranceMap;
		 SelectMgr_ToleranceMap();

		/****** SelectMgr_ToleranceMap::Add ******/
		/****** md5 signature: 13e4d46ecc5d04d15ecf3e33fa0d0fb9 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
theTolerance: int

Return
-------
None

Description
-----------
Adds the value given to map, checks if the current tolerance value should be replaced by thetolerance.
") Add;
		void Add(const Standard_Integer & theTolerance);

		/****** SelectMgr_ToleranceMap::CustomTolerance ******/
		/****** md5 signature: 80443541a6d32449a668e7ed1d7175c7 ******/
		%feature("compactdefaultargs") CustomTolerance;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the value of custom tolerance regardless of it validity.
") CustomTolerance;
		Standard_Integer CustomTolerance();

		/****** SelectMgr_ToleranceMap::Decrement ******/
		/****** md5 signature: 5c1f63b3f8f16be162652bae13c57bea ******/
		%feature("compactdefaultargs") Decrement;
		%feature("autodoc", "
Parameters
----------
theTolerance: int

Return
-------
None

Description
-----------
Decrements a counter of the tolerance given, checks if the current tolerance value should be recalculated.
") Decrement;
		void Decrement(const Standard_Integer & theTolerance);

		/****** SelectMgr_ToleranceMap::IsCustomTolSet ******/
		/****** md5 signature: 6e50033a4f64950f8de6c305bf9ea757 ******/
		%feature("compactdefaultargs") IsCustomTolSet;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if custom tolerance value is greater than zero.
") IsCustomTolSet;
		Standard_Boolean IsCustomTolSet();

		/****** SelectMgr_ToleranceMap::ResetDefaults ******/
		/****** md5 signature: b0dbee72b4ad8d6a406672850505804e ******/
		%feature("compactdefaultargs") ResetDefaults;
		%feature("autodoc", "Return
-------
None

Description
-----------
Unsets a custom tolerance and enables adaptive checks.
") ResetDefaults;
		void ResetDefaults();

		/****** SelectMgr_ToleranceMap::SetCustomTolerance ******/
		/****** md5 signature: aee5cafe32c5f72bbbfba864b14d2d3b ******/
		%feature("compactdefaultargs") SetCustomTolerance;
		%feature("autodoc", "
Parameters
----------
theTolerance: int

Return
-------
None

Description
-----------
Sets tolerance to the given one and disables adaptive checks.
") SetCustomTolerance;
		void SetCustomTolerance(const Standard_Integer theTolerance);

		/****** SelectMgr_ToleranceMap::Tolerance ******/
		/****** md5 signature: 855cf5f31b30ac5d20a8b2c49d29d1b9 ******/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns a current tolerance that must be applied.
") Tolerance;
		Standard_Integer Tolerance();

};


%extend SelectMgr_ToleranceMap {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class SelectMgr_ViewClipRange *
********************************/
class SelectMgr_ViewClipRange {
	public:
		/****** SelectMgr_ViewClipRange::SelectMgr_ViewClipRange ******/
		/****** md5 signature: 26502fffc9d3cfab4e9764855bb46286 ******/
		%feature("compactdefaultargs") SelectMgr_ViewClipRange;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates an empty clip range.
") SelectMgr_ViewClipRange;
		 SelectMgr_ViewClipRange();

		/****** SelectMgr_ViewClipRange::AddClipSubRange ******/
		/****** md5 signature: 629945498bfae195a79192ef4690f13f ******/
		%feature("compactdefaultargs") AddClipSubRange;
		%feature("autodoc", "
Parameters
----------
theRange: Bnd_Range

Return
-------
None

Description
-----------
Adds a clipping sub-range (for clipping chains).
") AddClipSubRange;
		void AddClipSubRange(const Bnd_Range & theRange);

		/****** SelectMgr_ViewClipRange::AddClippingPlanes ******/
		/****** md5 signature: 530c5e2e47a475c0ff904682df4ec3ab ******/
		%feature("compactdefaultargs") AddClippingPlanes;
		%feature("autodoc", "
Parameters
----------
thePlanes: Graphic3d_SequenceOfHClipPlane
thePickRay: gp_Ax1

Return
-------
None

Description
-----------
Add clipping planes. planes and picking ray should be defined in the same coordinate system.
") AddClippingPlanes;
		void AddClippingPlanes(const Graphic3d_SequenceOfHClipPlane & thePlanes, const gp_Ax1 & thePickRay);

		/****** SelectMgr_ViewClipRange::ChangeUnclipRange ******/
		/****** md5 signature: 58b75e3eeaf4dd4dbdda4bc0bfa4ec3e ******/
		%feature("compactdefaultargs") ChangeUnclipRange;
		%feature("autodoc", "Return
-------
Bnd_Range

Description
-----------
Returns the main unclipped range; [-inf, inf] by default.
") ChangeUnclipRange;
		Bnd_Range & ChangeUnclipRange();


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
		/****** SelectMgr_ViewClipRange::GetNearestDepth ******/
		/****** md5 signature: a7d31c5d6b83b64f1f6f7f0def838d0f ******/
		%feature("compactdefaultargs") GetNearestDepth;
		%feature("autodoc", "
Parameters
----------
theRange: Bnd_Range

Return
-------
theDepth: float

Description
-----------
Calculates the min not clipped value from the range. returns false if the whole range is clipped.
") GetNearestDepth;
		Standard_Boolean GetNearestDepth(const Bnd_Range & theRange, Standard_Real &OutValue);

		/****** SelectMgr_ViewClipRange::IsClipped ******/
		/****** md5 signature: 28a5904272062fde8c7fd50816e6a223 ******/
		%feature("compactdefaultargs") IsClipped;
		%feature("autodoc", "
Parameters
----------
theDepth: float

Return
-------
bool

Description
-----------
Check if the given depth is not within clipping range(s), e.g. true means depth is clipped.
") IsClipped;
		Standard_Boolean IsClipped(const Standard_Real theDepth);

		/****** SelectMgr_ViewClipRange::SetVoid ******/
		/****** md5 signature: 4e44fd52f6a76368c77b381fe1482a21 ******/
		%feature("compactdefaultargs") SetVoid;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clears clipping range.
") SetVoid;
		void SetVoid();

};


%extend SelectMgr_ViewClipRange {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class SelectMgr_ViewerSelector *
*********************************/
class SelectMgr_ViewerSelector : public Standard_Transient {
	public:
		/****** SelectMgr_ViewerSelector::SelectMgr_ViewerSelector ******/
		/****** md5 signature: 7b62f34747cb971942db0314921f3d1b ******/
		%feature("compactdefaultargs") SelectMgr_ViewerSelector;
		%feature("autodoc", "Return
-------
None

Description
-----------
Constructs an empty selector object.
") SelectMgr_ViewerSelector;
		 SelectMgr_ViewerSelector();

		/****** SelectMgr_ViewerSelector::ActiveOwners ******/
		/****** md5 signature: e83e54ed1a2d7643638b27424fa672fc ******/
		%feature("compactdefaultargs") ActiveOwners;
		%feature("autodoc", "
Parameters
----------
theOwners: SelectMgr_EntityOwner

Return
-------
None

Description
-----------
Returns the list of active entity owners.
") ActiveOwners;
		void ActiveOwners(NCollection_List<opencascade::handle<SelectMgr_EntityOwner> > & theOwners);

		/****** SelectMgr_ViewerSelector::AddSelectableObject ******/
		/****** md5 signature: f218951d73442065913cd4c14a6fa242 ******/
		%feature("compactdefaultargs") AddSelectableObject;
		%feature("autodoc", "
Parameters
----------
theObject: SelectMgr_SelectableObject

Return
-------
None

Description
-----------
Adds new object to the map of selectable objects.
") AddSelectableObject;
		void AddSelectableObject(const opencascade::handle<SelectMgr_SelectableObject> & theObject);

		/****** SelectMgr_ViewerSelector::AddSelectionToObject ******/
		/****** md5 signature: 2141463a745216f29058bc1f4607d6d5 ******/
		%feature("compactdefaultargs") AddSelectionToObject;
		%feature("autodoc", "
Parameters
----------
theObject: SelectMgr_SelectableObject
theSelection: SelectMgr_Selection

Return
-------
None

Description
-----------
Adds new selection to the object and builds its bvh tree.
") AddSelectionToObject;
		void AddSelectionToObject(const opencascade::handle<SelectMgr_SelectableObject> & theObject, const opencascade::handle<SelectMgr_Selection> & theSelection);

		/****** SelectMgr_ViewerSelector::AllowOverlapDetection ******/
		/****** md5 signature: 8ba9bf76b94978880f7a1365cdd5ce26 ******/
		%feature("compactdefaultargs") AllowOverlapDetection;
		%feature("autodoc", "
Parameters
----------
theIsToAllow: bool

Return
-------
None

Description
-----------
Is used for rectangular selection only if theistoallow is false, only fully included sensitives will be detected, otherwise the algorithm will mark both included and overlapped entities as matched.
") AllowOverlapDetection;
		void AllowOverlapDetection(const Standard_Boolean theIsToAllow);

		/****** SelectMgr_ViewerSelector::Clear ******/
		/****** md5 signature: 75abd67f132413fc11c19201aabf1126 ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empties all the tables, removes all selections...
") Clear;
		void Clear();

		/****** SelectMgr_ViewerSelector::ClearPicked ******/
		/****** md5 signature: b496614da1f164c06376bcf4c0aa4d2f ******/
		%feature("compactdefaultargs") ClearPicked;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clears picking results.
") ClearPicked;
		void ClearPicked();

		/****** SelectMgr_ViewerSelector::ClearSensitive ******/
		/****** md5 signature: bbfbdb95251072aaccc54e26ea15ada9 ******/
		%feature("compactdefaultargs") ClearSensitive;
		%feature("autodoc", "
Parameters
----------
theView: V3d_View

Return
-------
None

Description
-----------
No available documentation.
") ClearSensitive;
		void ClearSensitive(const opencascade::handle<V3d_View> & theView);

		/****** SelectMgr_ViewerSelector::Contains ******/
		/****** md5 signature: 78a3e6bbff753619951717c11cf591d9 ******/
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "
Parameters
----------
theObject: SelectMgr_SelectableObject

Return
-------
bool

Description
-----------
No available documentation.
") Contains;
		Standard_Boolean Contains(const opencascade::handle<SelectMgr_SelectableObject> & theObject);

		/****** SelectMgr_ViewerSelector::CustomPixelTolerance ******/
		/****** md5 signature: 9497c077b16b917b6f52ae9b3e06304e ******/
		%feature("compactdefaultargs") CustomPixelTolerance;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns custom pixel tolerance value.
") CustomPixelTolerance;
		Standard_Integer CustomPixelTolerance();

		/****** SelectMgr_ViewerSelector::DepthTolerance ******/
		/****** md5 signature: 5eb30ecbeec79f777ddfc94a151880bd ******/
		%feature("compactdefaultargs") DepthTolerance;
		%feature("autodoc", "Return
-------
float

Description
-----------
Return the tolerance for considering two entities having a similar depth (distance from eye to entity).
") DepthTolerance;
		Standard_Real DepthTolerance();

		/****** SelectMgr_ViewerSelector::DepthToleranceType ******/
		/****** md5 signature: c380649fe7713e3a87bde2b284f953ae ******/
		%feature("compactdefaultargs") DepthToleranceType;
		%feature("autodoc", "Return
-------
SelectMgr_TypeOfDepthTolerance

Description
-----------
Return the type of tolerance for considering two entities having a similar depth (distance from eye to entity); selectmgr_typeofdepthtolerance_sensitivityfactor by default.
") DepthToleranceType;
		SelectMgr_TypeOfDepthTolerance DepthToleranceType();

		/****** SelectMgr_ViewerSelector::DisplaySensitive ******/
		/****** md5 signature: 8dded899c4a255afc18ddc44c8d7a6f7 ******/
		%feature("compactdefaultargs") DisplaySensitive;
		%feature("autodoc", "
Parameters
----------
theView: V3d_View

Return
-------
None

Description
-----------
Displays sensitives in view <theview>.
") DisplaySensitive;
		void DisplaySensitive(const opencascade::handle<V3d_View> & theView);

		/****** SelectMgr_ViewerSelector::DisplaySensitive ******/
		/****** md5 signature: b1201290956c96d7a296cb8583c59abe ******/
		%feature("compactdefaultargs") DisplaySensitive;
		%feature("autodoc", "
Parameters
----------
theSel: SelectMgr_Selection
theTrsf: gp_Trsf
theView: V3d_View
theToClearOthers: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
No available documentation.
") DisplaySensitive;
		void DisplaySensitive(const opencascade::handle<SelectMgr_Selection> & theSel, const gp_Trsf & theTrsf, const opencascade::handle<V3d_View> & theView, const Standard_Boolean theToClearOthers = Standard_True);


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
		/****** SelectMgr_ViewerSelector::EntitySetBuilder ******/
		/****** md5 signature: 52914ec571d0b78bdc7cb60acd7ef05a ******/
		%feature("compactdefaultargs") EntitySetBuilder;
		%feature("autodoc", "Return
-------
opencascade::handle<Select3D_BVHBuilder3d>

Description
-----------
Returns the default builder used to construct bvh of entity set.
") EntitySetBuilder;
		const opencascade::handle<Select3D_BVHBuilder3d> EntitySetBuilder();

		/****** SelectMgr_ViewerSelector::GetManager ******/
		/****** md5 signature: 1e3e7e7901c4a711a6a7b92a70014822 ******/
		%feature("compactdefaultargs") GetManager;
		%feature("autodoc", "Return
-------
SelectMgr_SelectingVolumeManager

Description
-----------
Returns instance of selecting volume manager of the viewer selector.
") GetManager;
		SelectMgr_SelectingVolumeManager & GetManager();

		/****** SelectMgr_ViewerSelector::IsActive ******/
		/****** md5 signature: d5470c10bdda5f0f4ab236e757f7b861 ******/
		%feature("compactdefaultargs") IsActive;
		%feature("autodoc", "
Parameters
----------
theSelectableObject: SelectMgr_SelectableObject
theMode: int

Return
-------
bool

Description
-----------
Returns true if the selectable object aselectableobject having the selection mode amode is active in this selector.
") IsActive;
		Standard_Boolean IsActive(const opencascade::handle<SelectMgr_SelectableObject> & theSelectableObject, const Standard_Integer theMode);

		/****** SelectMgr_ViewerSelector::IsInside ******/
		/****** md5 signature: 55a6f977e8d6d1e15f934601ea16a501 ******/
		%feature("compactdefaultargs") IsInside;
		%feature("autodoc", "
Parameters
----------
theSelectableObject: SelectMgr_SelectableObject
theMode: int

Return
-------
bool

Description
-----------
Returns true if the selectable object aselectableobject having the selection mode amode is in this selector.
") IsInside;
		Standard_Boolean IsInside(const opencascade::handle<SelectMgr_SelectableObject> & theSelectableObject, const Standard_Integer theMode);

		/****** SelectMgr_ViewerSelector::Modes ******/
		/****** md5 signature: ffb5cb9b5ef052e25bbb4dbef0237f18 ******/
		%feature("compactdefaultargs") Modes;
		%feature("autodoc", "
Parameters
----------
theSelectableObject: SelectMgr_SelectableObject
theModeList: TColStd_ListOfInteger
theWantedState: SelectMgr_StateOfSelection (optional, default to SelectMgr_SOS_Any)

Return
-------
bool

Description
-----------
Returns the list of selection modes modelist found in this selector for the selectable object aselectableobject. returns true if aselectableobject is referenced inside this selector; returns false if the object is not present in this selector.
") Modes;
		Standard_Boolean Modes(const opencascade::handle<SelectMgr_SelectableObject> & theSelectableObject, TColStd_ListOfInteger & theModeList, const SelectMgr_StateOfSelection theWantedState = SelectMgr_SOS_Any);

		/****** SelectMgr_ViewerSelector::MoveSelectableObject ******/
		/****** md5 signature: 5bdd1df0fce978279ec116396cbc6a68 ******/
		%feature("compactdefaultargs") MoveSelectableObject;
		%feature("autodoc", "
Parameters
----------
theObject: SelectMgr_SelectableObject

Return
-------
None

Description
-----------
Moves existing object from set of not transform persistence objects to set of transform persistence objects (or vice versa).
") MoveSelectableObject;
		void MoveSelectableObject(const opencascade::handle<SelectMgr_SelectableObject> & theObject);

		/****** SelectMgr_ViewerSelector::NbPicked ******/
		/****** md5 signature: 1e5922f7d7f8bb6d486a25fa1352cce7 ******/
		%feature("compactdefaultargs") NbPicked;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of detected owners.
") NbPicked;
		Standard_Integer NbPicked();

		/****** SelectMgr_ViewerSelector::OnePicked ******/
		/****** md5 signature: 06695973eb15f33aa731025f3b6253dc ******/
		%feature("compactdefaultargs") OnePicked;
		%feature("autodoc", "Return
-------
opencascade::handle<SelectMgr_EntityOwner>

Description
-----------
Returns the picked element with the highest priority, and which is the closest to the last successful mouse position.
") OnePicked;
		opencascade::handle<SelectMgr_EntityOwner> OnePicked();

		/****** SelectMgr_ViewerSelector::Pick ******/
		/****** md5 signature: 2bffaec90f889b1c8a589371f27c765d ******/
		%feature("compactdefaultargs") Pick;
		%feature("autodoc", "
Parameters
----------
theXPix: int
theYPix: int
theView: V3d_View

Return
-------
None

Description
-----------
Picks the sensitive entity at the pixel coordinates of the mouse <thexpix> and <theypix>. the selector looks for touched areas and owners.
") Pick;
		void Pick(const Standard_Integer theXPix, const Standard_Integer theYPix, const opencascade::handle<V3d_View> & theView);

		/****** SelectMgr_ViewerSelector::Pick ******/
		/****** md5 signature: ac91d378236f4cd1507ea2ad52a93f76 ******/
		%feature("compactdefaultargs") Pick;
		%feature("autodoc", "
Parameters
----------
theXPMin: int
theYPMin: int
theXPMax: int
theYPMax: int
theView: V3d_View

Return
-------
None

Description
-----------
Picks the sensitive entity according to the minimum and maximum pixel values <thexpmin>, <theypmin>, <thexpmax> and <theypmax> defining a 2d area for selection in the 3d view aview.
") Pick;
		void Pick(const Standard_Integer theXPMin, const Standard_Integer theYPMin, const Standard_Integer theXPMax, const Standard_Integer theYPMax, const opencascade::handle<V3d_View> & theView);

		/****** SelectMgr_ViewerSelector::Pick ******/
		/****** md5 signature: d9dd319057f3def6d1d43685fa1cdf94 ******/
		%feature("compactdefaultargs") Pick;
		%feature("autodoc", "
Parameters
----------
thePolyline: TColgp_Array1OfPnt2d
theView: V3d_View

Return
-------
None

Description
-----------
Pick action - input pixel values for polyline selection for selection.
") Pick;
		void Pick(const TColgp_Array1OfPnt2d & thePolyline, const opencascade::handle<V3d_View> & theView);

		/****** SelectMgr_ViewerSelector::Pick ******/
		/****** md5 signature: 534c41acdf40cdc7534b926e77873ace ******/
		%feature("compactdefaultargs") Pick;
		%feature("autodoc", "
Parameters
----------
theAxis: gp_Ax1
theView: V3d_View

Return
-------
None

Description
-----------
Picks the sensitive entity according to the input axis. this is geometric intersection 3d objects by axis (camera parameters are ignored and objects with transform persistance are skipped).
") Pick;
		void Pick(const gp_Ax1 & theAxis, const opencascade::handle<V3d_View> & theView);

		/****** SelectMgr_ViewerSelector::Picked ******/
		/****** md5 signature: 6760e33474c400a8d0afcacda0d075de ******/
		%feature("compactdefaultargs") Picked;
		%feature("autodoc", "
Parameters
----------
theRank: int

Return
-------
opencascade::handle<SelectMgr_EntityOwner>

Description
-----------
Returns the entity owner for the object picked at specified position. @param therank rank of detected object within range 1...nbpicked().
") Picked;
		opencascade::handle<SelectMgr_EntityOwner> Picked(const Standard_Integer theRank);

		/****** SelectMgr_ViewerSelector::PickedData ******/
		/****** md5 signature: e84187de944a8ab2106eac0d67700a40 ******/
		%feature("compactdefaultargs") PickedData;
		%feature("autodoc", "
Parameters
----------
theRank: int

Return
-------
SelectMgr_SortCriterion

Description
-----------
Returns the entity for the object picked at specified position. @param therank rank of detected object within range 1...nbpicked().
") PickedData;
		const SelectMgr_SortCriterion & PickedData(const Standard_Integer theRank);

		/****** SelectMgr_ViewerSelector::PickedEntity ******/
		/****** md5 signature: 1597acbfac8be91b18a0ddb95e10b3b7 ******/
		%feature("compactdefaultargs") PickedEntity;
		%feature("autodoc", "
Parameters
----------
theRank: int

Return
-------
opencascade::handle<Select3D_SensitiveEntity>

Description
-----------
Returns the entity for the object picked at specified position. @param therank rank of detected object within range 1...nbpicked().
") PickedEntity;
		const opencascade::handle<Select3D_SensitiveEntity> & PickedEntity(const Standard_Integer theRank);

		/****** SelectMgr_ViewerSelector::PickedPoint ******/
		/****** md5 signature: df6911ebee5f921057309eeaccd7991e ******/
		%feature("compactdefaultargs") PickedPoint;
		%feature("autodoc", "
Parameters
----------
theRank: int

Return
-------
gp_Pnt

Description
-----------
Returns the 3d point (intersection of picking axis with the object nearest to eye) for the object picked at specified position. @param therank rank of detected object within range 1...nbpicked().
") PickedPoint;
		gp_Pnt PickedPoint(const Standard_Integer theRank);

		/****** SelectMgr_ViewerSelector::PixelTolerance ******/
		/****** md5 signature: 5b865b201c1641a73b871f7bcdb1eeb9 ******/
		%feature("compactdefaultargs") PixelTolerance;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the largest pixel tolerance.
") PixelTolerance;
		Standard_Integer PixelTolerance();

		/****** SelectMgr_ViewerSelector::QueueBVHBuild ******/
		/****** md5 signature: 896a0efab352ae61ee3ef99e1dfa8c9f ******/
		%feature("compactdefaultargs") QueueBVHBuild;
		%feature("autodoc", "
Parameters
----------
theEntity: Select3D_SensitiveEntity

Return
-------
None

Description
-----------
Queues a sensitive entity to build its bvh.
") QueueBVHBuild;
		void QueueBVHBuild(const opencascade::handle<Select3D_SensitiveEntity> & theEntity);

		/****** SelectMgr_ViewerSelector::RebuildObjectsTree ******/
		/****** md5 signature: 628a59a88256b2ec574763a4a2d8322a ******/
		%feature("compactdefaultargs") RebuildObjectsTree;
		%feature("autodoc", "
Parameters
----------
theIsForce: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Marks bvh of selectable objects for rebuild. parameter theisforce set as true guarantees that 1st level bvh for the viewer selector will be rebuilt during this call.
") RebuildObjectsTree;
		void RebuildObjectsTree(const Standard_Boolean theIsForce = Standard_False);

		/****** SelectMgr_ViewerSelector::RebuildSensitivesTree ******/
		/****** md5 signature: 819af8d1979424b3e6df844d4e61f2b2 ******/
		%feature("compactdefaultargs") RebuildSensitivesTree;
		%feature("autodoc", "
Parameters
----------
theObject: SelectMgr_SelectableObject
theIsForce: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Marks bvh of sensitive entities of particular selectable object for rebuild. parameter theisforce set as true guarantees that 2nd level bvh for the object given will be rebuilt during this call.
") RebuildSensitivesTree;
		void RebuildSensitivesTree(const opencascade::handle<SelectMgr_SelectableObject> & theObject, const Standard_Boolean theIsForce = Standard_False);

		/****** SelectMgr_ViewerSelector::RemovePicked ******/
		/****** md5 signature: 80184406bbb99da0f278fd26e116df67 ******/
		%feature("compactdefaultargs") RemovePicked;
		%feature("autodoc", "
Parameters
----------
theObject: SelectMgr_SelectableObject

Return
-------
bool

Description
-----------
Remove picked entities associated with specified object.
") RemovePicked;
		Standard_Boolean RemovePicked(const opencascade::handle<SelectMgr_SelectableObject> & theObject);

		/****** SelectMgr_ViewerSelector::RemoveSelectableObject ******/
		/****** md5 signature: 1e8f196e9c9d6bf9be8ac2a00dec3498 ******/
		%feature("compactdefaultargs") RemoveSelectableObject;
		%feature("autodoc", "
Parameters
----------
theObject: SelectMgr_SelectableObject

Return
-------
None

Description
-----------
Removes selectable object from map of selectable ones.
") RemoveSelectableObject;
		void RemoveSelectableObject(const opencascade::handle<SelectMgr_SelectableObject> & theObject);

		/****** SelectMgr_ViewerSelector::RemoveSelectionOfObject ******/
		/****** md5 signature: 69adfc0cf7246377c43727c2b93bf6f2 ******/
		%feature("compactdefaultargs") RemoveSelectionOfObject;
		%feature("autodoc", "
Parameters
----------
theObject: SelectMgr_SelectableObject
theSelection: SelectMgr_Selection

Return
-------
None

Description
-----------
Removes selection of the object and marks its bvh tree for rebuild.
") RemoveSelectionOfObject;
		void RemoveSelectionOfObject(const opencascade::handle<SelectMgr_SelectableObject> & theObject, const opencascade::handle<SelectMgr_Selection> & theSelection);

		/****** SelectMgr_ViewerSelector::ResetSelectionActivationStatus ******/
		/****** md5 signature: bf2a203e68c060aeca555d5082fa1fa7 ******/
		%feature("compactdefaultargs") ResetSelectionActivationStatus;
		%feature("autodoc", "Return
-------
None

Description
-----------
Marks all added sensitive entities of all objects as non-selectable.
") ResetSelectionActivationStatus;
		void ResetSelectionActivationStatus();

		/****** SelectMgr_ViewerSelector::SelectableObjects ******/
		/****** md5 signature: 3e067502f3452297d930a8e90567e3d9 ******/
		%feature("compactdefaultargs") SelectableObjects;
		%feature("autodoc", "Return
-------
SelectMgr_SelectableObjectSet

Description
-----------
Return map of selectable objects.
") SelectableObjects;
		const SelectMgr_SelectableObjectSet & SelectableObjects();

		/****** SelectMgr_ViewerSelector::Sensitivity ******/
		/****** md5 signature: 6758039a5591c08f2d1e8b5cc5b25161 ******/
		%feature("compactdefaultargs") Sensitivity;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the largest sensitivity of picking.
") Sensitivity;
		Standard_Real Sensitivity();

		/****** SelectMgr_ViewerSelector::SetDepthTolerance ******/
		/****** md5 signature: 7e4087788ba7c5cb05aecd7cf2807046 ******/
		%feature("compactdefaultargs") SetDepthTolerance;
		%feature("autodoc", "
Parameters
----------
theType: SelectMgr_TypeOfDepthTolerance
theTolerance: float

Return
-------
None

Description
-----------
Set the tolerance for considering two entities having a similar depth (distance from eye to entity). @param thetype [in] type of tolerance value @param thetolerance [in] tolerance value in 3d scale (selectmgr_typeofdepthtolerance_uniform)  or in pixels (selectmgr_typeofdepthtolerance_uniformpixels);  value is ignored in case of selectmgr_typeofdepthtolerance_sensitivityfactor.
") SetDepthTolerance;
		void SetDepthTolerance(SelectMgr_TypeOfDepthTolerance theType, Standard_Real theTolerance);

		/****** SelectMgr_ViewerSelector::SetEntitySetBuilder ******/
		/****** md5 signature: 09ee8498ee64bb589a0261fd9a7e5188 ******/
		%feature("compactdefaultargs") SetEntitySetBuilder;
		%feature("autodoc", "
Parameters
----------
theBuilder: Select3D_BVHBuilder3d

Return
-------
None

Description
-----------
Sets the default builder used to construct bvh of entity set. the new builder will be also assigned for already defined objects, but computed bvh trees will not be invalidated.
") SetEntitySetBuilder;
		void SetEntitySetBuilder(const opencascade::handle<Select3D_BVHBuilder3d> & theBuilder);

		/****** SelectMgr_ViewerSelector::SetPickClosest ******/
		/****** md5 signature: 7e98eb34a16b50c51a37c341a8616401 ******/
		%feature("compactdefaultargs") SetPickClosest;
		%feature("autodoc", "
Parameters
----------
theToPreferClosest: bool

Return
-------
None

Description
-----------
Set flag determining precedence of picked depth over entity priority in sorted results.
") SetPickClosest;
		void SetPickClosest(bool theToPreferClosest);

		/****** SelectMgr_ViewerSelector::SetPixelTolerance ******/
		/****** md5 signature: fda084bdc0d0a8e945d1f4e82a500297 ******/
		%feature("compactdefaultargs") SetPixelTolerance;
		%feature("autodoc", "
Parameters
----------
theTolerance: int

Return
-------
None

Description
-----------
Sets the pixel tolerance <thetolerance>.
") SetPixelTolerance;
		void SetPixelTolerance(const Standard_Integer theTolerance);

		/****** SelectMgr_ViewerSelector::SetToPrebuildBVH ******/
		/****** md5 signature: a1a0e8f03c7f4b82aa7284578f0fb968 ******/
		%feature("compactdefaultargs") SetToPrebuildBVH;
		%feature("autodoc", "
Parameters
----------
theToPrebuild: bool
theThreadsNum: int (optional, default to -1)

Return
-------
None

Description
-----------
Enables/disables building bvh for sensitives in separate threads.
") SetToPrebuildBVH;
		void SetToPrebuildBVH(Standard_Boolean theToPrebuild, Standard_Integer theThreadsNum = -1);

		/****** SelectMgr_ViewerSelector::SortResult ******/
		/****** md5 signature: 0272cdf84299752febeb97ffe8d3c3e3 ******/
		%feature("compactdefaultargs") SortResult;
		%feature("autodoc", "Return
-------
None

Description
-----------
Sorts the detected entities by priority and distance.
") SortResult;
		virtual void SortResult();

		/****** SelectMgr_ViewerSelector::Status ******/
		/****** md5 signature: 71a08ab697d7bef66c0335534974a223 ******/
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "
Parameters
----------
theSelection: SelectMgr_Selection

Return
-------
SelectMgr_StateOfSelection

Description
-----------
Returns the selection status status of the selection aselection.
") Status;
		SelectMgr_StateOfSelection Status(const opencascade::handle<SelectMgr_Selection> & theSelection);

		/****** SelectMgr_ViewerSelector::Status ******/
		/****** md5 signature: c85ec742b457f156e341dab17a4171ac ******/
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "
Parameters
----------
theSelectableObject: SelectMgr_SelectableObject

Return
-------
TCollection_AsciiString

Description
-----------
No available documentation.
") Status;
		TCollection_AsciiString Status(const opencascade::handle<SelectMgr_SelectableObject> & theSelectableObject);

		/****** SelectMgr_ViewerSelector::ToPickClosest ******/
		/****** md5 signature: 408e2d13bb22c289ef23455e357ab945 ******/
		%feature("compactdefaultargs") ToPickClosest;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return the flag determining precedence of picked depth (distance from eye to entity) over entity priority in sorted results; true by default. when flag is true, priority will be considered only if entities have the same depth within the tolerance. when flag is false, entities with higher priority will be in front regardless of their depth (like x-ray).
") ToPickClosest;
		bool ToPickClosest();

		/****** SelectMgr_ViewerSelector::ToPrebuildBVH ******/
		/****** md5 signature: a5a6258c7c6a323d99d16797640eef14 ******/
		%feature("compactdefaultargs") ToPrebuildBVH;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if building bvh for sensitives in separate threads is enabled.
") ToPrebuildBVH;
		Standard_Boolean ToPrebuildBVH();

		/****** SelectMgr_ViewerSelector::WaitForBVHBuild ******/
		/****** md5 signature: 7e92f221a918ae1b9444d5e68a00db6b ******/
		%feature("compactdefaultargs") WaitForBVHBuild;
		%feature("autodoc", "Return
-------
None

Description
-----------
Waits bvh threads finished building.
") WaitForBVHBuild;
		void WaitForBVHBuild();

};


%make_alias(SelectMgr_ViewerSelector)

%extend SelectMgr_ViewerSelector {
	%pythoncode {
	__repr__ = _dumps_object

	@methodnotwrapped
	def ToPixMap(self):
		pass
	}
};

/**********************************
* class SelectMgr_AxisIntersector *
**********************************/
class SelectMgr_AxisIntersector : public SelectMgr_BaseIntersector {
	public:
		/****** SelectMgr_AxisIntersector::SelectMgr_AxisIntersector ******/
		/****** md5 signature: 3732b66199e86d09fe930b2bf8417fa2 ******/
		%feature("compactdefaultargs") SelectMgr_AxisIntersector;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") SelectMgr_AxisIntersector;
		 SelectMgr_AxisIntersector();

		/****** SelectMgr_AxisIntersector::Build ******/
		/****** md5 signature: 5ad4569f96377eec0c61c7f10d7c7aa9 ******/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "Return
-------
None

Description
-----------
Builds axis according to internal parameters. note: it should be called after init() method.
") Build;
		virtual void Build();

		/****** SelectMgr_AxisIntersector::DetectedPoint ******/
		/****** md5 signature: f5119614d059d473f2e98823f778528f ******/
		%feature("compactdefaultargs") DetectedPoint;
		%feature("autodoc", "
Parameters
----------
theDepth: float

Return
-------
gp_Pnt

Description
-----------
Calculates the point on a axis ray that was detected during the run of selection algo by given depth.
") DetectedPoint;
		virtual gp_Pnt DetectedPoint(const Standard_Real theDepth);

		/****** SelectMgr_AxisIntersector::DistToGeometryCenter ******/
		/****** md5 signature: ef4883136b3d59dc96190e78632a000d ******/
		%feature("compactdefaultargs") DistToGeometryCenter;
		%feature("autodoc", "
Parameters
----------
theCOG: gp_Pnt

Return
-------
float

Description
-----------
Measures distance between start axis point and given point thecog.
") DistToGeometryCenter;
		virtual Standard_Real DistToGeometryCenter(const gp_Pnt & theCOG);


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
		/****** SelectMgr_AxisIntersector::GetFarPnt ******/
		/****** md5 signature: 81facda4320b4fbe9ad4747e990428a7 ******/
		%feature("compactdefaultargs") GetFarPnt;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Returns far point along axis (infinite).
") GetFarPnt;
		virtual const gp_Pnt GetFarPnt();

		/****** SelectMgr_AxisIntersector::GetNearPnt ******/
		/****** md5 signature: 6547ed3e9b4a5b5d0053afdb73046a99 ******/
		%feature("compactdefaultargs") GetNearPnt;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Returns near point along axis.
") GetNearPnt;
		virtual const gp_Pnt GetNearPnt();

		/****** SelectMgr_AxisIntersector::GetViewRayDirection ******/
		/****** md5 signature: 0d6910870801415274f5dddb9b21e975 ******/
		%feature("compactdefaultargs") GetViewRayDirection;
		%feature("autodoc", "Return
-------
gp_Dir

Description
-----------
Returns axis direction.
") GetViewRayDirection;
		virtual const gp_Dir GetViewRayDirection();

		/****** SelectMgr_AxisIntersector::Init ******/
		/****** md5 signature: b07bb18041c7d7fd236c285838ee6fee ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theAxis: gp_Ax1

Return
-------
None

Description
-----------
Initializes selecting axis according to the input one.
") Init;
		void Init(const gp_Ax1 & theAxis);

		/****** SelectMgr_AxisIntersector::IsScalable ******/
		/****** md5 signature: bafeca45d952fd05dab481f471cd565b ******/
		%feature("compactdefaultargs") IsScalable;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns false (not applicable to this volume).
") IsScalable;
		virtual Standard_Boolean IsScalable();

		/****** SelectMgr_AxisIntersector::OverlapsBox ******/
		/****** md5 signature: eb9dad6b797a0a0ff89c1d09f8cc2446 ******/
		%feature("compactdefaultargs") OverlapsBox;
		%feature("autodoc", "
Parameters
----------
theBoxMin: SelectMgr_Vec3
theBoxMax: SelectMgr_Vec3
theClipRange: SelectMgr_ViewClipRange
thePickResult: SelectBasics_PickResult

Return
-------
bool

Description
-----------
Intersection test between defined axis and given axis-aligned box.
") OverlapsBox;
		virtual Standard_Boolean OverlapsBox(const SelectMgr_Vec3 & theBoxMin, const SelectMgr_Vec3 & theBoxMax, const SelectMgr_ViewClipRange & theClipRange, SelectBasics_PickResult & thePickResult);

		/****** SelectMgr_AxisIntersector::OverlapsBox ******/
		/****** md5 signature: b59e9bf72467fe4ca0dfb9992d5bd028 ******/
		%feature("compactdefaultargs") OverlapsBox;
		%feature("autodoc", "
Parameters
----------
theBoxMin: SelectMgr_Vec3
theBoxMax: SelectMgr_Vec3
theInside: bool *

Return
-------
bool

Description
-----------
Returns true if selecting axis intersects axis-aligned bounding box with minimum corner at point theminpt and maximum at point themaxpt.
") OverlapsBox;
		virtual Standard_Boolean OverlapsBox(const SelectMgr_Vec3 & theBoxMin, const SelectMgr_Vec3 & theBoxMax, Standard_Boolean * theInside);

		/****** SelectMgr_AxisIntersector::OverlapsCircle ******/
		/****** md5 signature: 814051637e44a639641a820ff3119ad2 ******/
		%feature("compactdefaultargs") OverlapsCircle;
		%feature("autodoc", "
Parameters
----------
theRadius: float
theTrsf: gp_Trsf
theIsFilled: bool
theClipRange: SelectMgr_ViewClipRange
thePickResult: SelectBasics_PickResult

Return
-------
bool

Description
-----------
Returns true if selecting volume is overlapped by circle with radius theradius, boolean theisfilled and transformation to apply thetrsf. the position and orientation of the circle are specified via thetrsf transformation for gp::xoy() with center in gp::origin().
") OverlapsCircle;
		virtual Standard_Boolean OverlapsCircle(const Standard_Real theRadius, const gp_Trsf & theTrsf, const Standard_Boolean theIsFilled, const SelectMgr_ViewClipRange & theClipRange, SelectBasics_PickResult & thePickResult);

		/****** SelectMgr_AxisIntersector::OverlapsCircle ******/
		/****** md5 signature: d08119aae480f7e2fcf7a2313f25068d ******/
		%feature("compactdefaultargs") OverlapsCircle;
		%feature("autodoc", "
Parameters
----------
theRadius: float
theTrsf: gp_Trsf
theIsFilled: bool
theInside: bool * (optional, default to NULL)

Return
-------
bool

Description
-----------
Returns true if selecting volume is overlapped by circle with radius theradius, boolean theisfilled and transformation to apply thetrsf. the position and orientation of the circle are specified via thetrsf transformation for gp::xoy() with center in gp::origin().
") OverlapsCircle;
		virtual Standard_Boolean OverlapsCircle(const Standard_Real theRadius, const gp_Trsf & theTrsf, const Standard_Boolean theIsFilled, Standard_Boolean * theInside = NULL);

		/****** SelectMgr_AxisIntersector::OverlapsCylinder ******/
		/****** md5 signature: 76cfe5622cdf762f89f7a0fb711d6940 ******/
		%feature("compactdefaultargs") OverlapsCylinder;
		%feature("autodoc", "
Parameters
----------
theBottomRad: float
theTopRad: float
theHeight: float
theTrsf: gp_Trsf
theIsHollow: bool
theClipRange: SelectMgr_ViewClipRange
thePickResult: SelectBasics_PickResult

Return
-------
bool

Description
-----------
Returns true if selecting volume is overlapped by cylinder (or cone) with radiuses thebottomrad and thetoprad, height theheight and transformation to apply thetrsf.
") OverlapsCylinder;
		virtual Standard_Boolean OverlapsCylinder(const Standard_Real theBottomRad, const Standard_Real theTopRad, const Standard_Real theHeight, const gp_Trsf & theTrsf, const Standard_Boolean theIsHollow, const SelectMgr_ViewClipRange & theClipRange, SelectBasics_PickResult & thePickResult);

		/****** SelectMgr_AxisIntersector::OverlapsCylinder ******/
		/****** md5 signature: bbb4061ebe4835347b55e7c89fef0fcc ******/
		%feature("compactdefaultargs") OverlapsCylinder;
		%feature("autodoc", "
Parameters
----------
theBottomRad: float
theTopRad: float
theHeight: float
theTrsf: gp_Trsf
theIsHollow: bool
theInside: bool * (optional, default to NULL)

Return
-------
bool

Description
-----------
Returns true if selecting volume is overlapped by cylinder (or cone) with radiuses thebottomrad and thetoprad, height theheight and transformation to apply thetrsf.
") OverlapsCylinder;
		virtual Standard_Boolean OverlapsCylinder(const Standard_Real theBottomRad, const Standard_Real theTopRad, const Standard_Real theHeight, const gp_Trsf & theTrsf, const Standard_Boolean theIsHollow, Standard_Boolean * theInside = NULL);

		/****** SelectMgr_AxisIntersector::OverlapsPoint ******/
		/****** md5 signature: f5ec1da88416f5d768fc10e142d3a825 ******/
		%feature("compactdefaultargs") OverlapsPoint;
		%feature("autodoc", "
Parameters
----------
thePnt: gp_Pnt
theClipRange: SelectMgr_ViewClipRange
thePickResult: SelectBasics_PickResult

Return
-------
bool

Description
-----------
Intersection test between defined axis and given point.
") OverlapsPoint;
		virtual Standard_Boolean OverlapsPoint(const gp_Pnt & thePnt, const SelectMgr_ViewClipRange & theClipRange, SelectBasics_PickResult & thePickResult);

		/****** SelectMgr_AxisIntersector::OverlapsPoint ******/
		/****** md5 signature: d7b37b52b3a018e10f4074a808688275 ******/
		%feature("compactdefaultargs") OverlapsPoint;
		%feature("autodoc", "
Parameters
----------
thePnt: gp_Pnt

Return
-------
bool

Description
-----------
Intersection test between defined axis and given point.
") OverlapsPoint;
		virtual Standard_Boolean OverlapsPoint(const gp_Pnt & thePnt);

		/****** SelectMgr_AxisIntersector::OverlapsPolygon ******/
		/****** md5 signature: db9e490051fa1222da72a0503292bd60 ******/
		%feature("compactdefaultargs") OverlapsPolygon;
		%feature("autodoc", "
Parameters
----------
theArrayOfPnts: TColgp_Array1OfPnt
theSensType: Select3D_TypeOfSensitivity
theClipRange: SelectMgr_ViewClipRange
thePickResult: SelectBasics_PickResult

Return
-------
bool

Description
-----------
Intersection test between defined axis and given ordered set of points, representing line segments. the test may be considered of interior part or boundary line defined by segments depending on given sensitivity type.
") OverlapsPolygon;
		virtual Standard_Boolean OverlapsPolygon(const TColgp_Array1OfPnt & theArrayOfPnts, Select3D_TypeOfSensitivity theSensType, const SelectMgr_ViewClipRange & theClipRange, SelectBasics_PickResult & thePickResult);

		/****** SelectMgr_AxisIntersector::OverlapsSegment ******/
		/****** md5 signature: 8ca34a19e289d4f56d25f404f14353a2 ******/
		%feature("compactdefaultargs") OverlapsSegment;
		%feature("autodoc", "
Parameters
----------
thePnt1: gp_Pnt
thePnt2: gp_Pnt
theClipRange: SelectMgr_ViewClipRange
thePickResult: SelectBasics_PickResult

Return
-------
bool

Description
-----------
Checks if selecting axis intersects line segment.
") OverlapsSegment;
		virtual Standard_Boolean OverlapsSegment(const gp_Pnt & thePnt1, const gp_Pnt & thePnt2, const SelectMgr_ViewClipRange & theClipRange, SelectBasics_PickResult & thePickResult);

		/****** SelectMgr_AxisIntersector::OverlapsSphere ******/
		/****** md5 signature: 2b7a70713e1032389098753ec8495331 ******/
		%feature("compactdefaultargs") OverlapsSphere;
		%feature("autodoc", "
Parameters
----------
theCenter: gp_Pnt
theRadius: float
theInside: bool * (optional, default to NULL)

Return
-------
bool

Description
-----------
Intersection test between defined axis and given sphere with center thecenter and radius theradius.
") OverlapsSphere;
		virtual Standard_Boolean OverlapsSphere(const gp_Pnt & theCenter, const Standard_Real theRadius, Standard_Boolean * theInside = NULL);

		/****** SelectMgr_AxisIntersector::OverlapsSphere ******/
		/****** md5 signature: f08575f5df6e1b77c989dc6c099c2b39 ******/
		%feature("compactdefaultargs") OverlapsSphere;
		%feature("autodoc", "
Parameters
----------
theCenter: gp_Pnt
theRadius: float
theClipRange: SelectMgr_ViewClipRange
thePickResult: SelectBasics_PickResult

Return
-------
bool

Description
-----------
Intersection test between defined axis and given sphere with center thecenter and radius theradius.
") OverlapsSphere;
		virtual Standard_Boolean OverlapsSphere(const gp_Pnt & theCenter, const Standard_Real theRadius, const SelectMgr_ViewClipRange & theClipRange, SelectBasics_PickResult & thePickResult);

		/****** SelectMgr_AxisIntersector::OverlapsTriangle ******/
		/****** md5 signature: 98197f256a47bdbe43f4622e23bf7cd4 ******/
		%feature("compactdefaultargs") OverlapsTriangle;
		%feature("autodoc", "
Parameters
----------
thePnt1: gp_Pnt
thePnt2: gp_Pnt
thePnt3: gp_Pnt
theSensType: Select3D_TypeOfSensitivity
theClipRange: SelectMgr_ViewClipRange
thePickResult: SelectBasics_PickResult

Return
-------
bool

Description
-----------
Intersection test between defined axis and given triangle. the test may be considered of interior part or boundary line defined by triangle vertices depending on given sensitivity type.
") OverlapsTriangle;
		virtual Standard_Boolean OverlapsTriangle(const gp_Pnt & thePnt1, const gp_Pnt & thePnt2, const gp_Pnt & thePnt3, Select3D_TypeOfSensitivity theSensType, const SelectMgr_ViewClipRange & theClipRange, SelectBasics_PickResult & thePickResult);

		/****** SelectMgr_AxisIntersector::ScaleAndTransform ******/
		/****** md5 signature: a203fbfb62144f3225129b6829253952 ******/
		%feature("compactdefaultargs") ScaleAndTransform;
		%feature("autodoc", "
Parameters
----------
theScaleFactor: int
theTrsf: gp_GTrsf
theBuilder: SelectMgr_FrustumBuilder

Return
-------
opencascade::handle<SelectMgr_BaseIntersector>

Description
-----------
Important: scaling doesn't make sense for this intersector. returns a copy of the intersector transformed using the matrix given. builder is an optional argument that represents corresponding settings for re-constructing transformed frustum from scratch. can be null if reconstruction is not expected furthermore.
") ScaleAndTransform;
		virtual opencascade::handle<SelectMgr_BaseIntersector> ScaleAndTransform(const Standard_Integer theScaleFactor, const gp_GTrsf & theTrsf, const opencascade::handle<SelectMgr_FrustumBuilder> & theBuilder);

		/****** SelectMgr_AxisIntersector::SetCamera ******/
		/****** md5 signature: fb69f58b8ac85ce845a8857ed97739d9 ******/
		%feature("compactdefaultargs") SetCamera;
		%feature("autodoc", "
Parameters
----------
theCamera: Graphic3d_Camera

Return
-------
None

Description
-----------
Saves camera definition. do nothing for axis intersector (not applicable to this volume).
") SetCamera;
		virtual void SetCamera(const opencascade::handle<Graphic3d_Camera> & theCamera);

};


%make_alias(SelectMgr_AxisIntersector)

%extend SelectMgr_AxisIntersector {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class SelectMgr_BaseFrustum *
******************************/
/************************************
* class SelectMgr_CompositionFilter *
************************************/
%nodefaultctor SelectMgr_CompositionFilter;
class SelectMgr_CompositionFilter : public SelectMgr_Filter {
	public:
		/****** SelectMgr_CompositionFilter::ActsOn ******/
		/****** md5 signature: 82ed0e718f9bead84301083a624d455d ******/
		%feature("compactdefaultargs") ActsOn;
		%feature("autodoc", "
Parameters
----------
aStandardMode: TopAbs_ShapeEnum

Return
-------
bool

Description
-----------
No available documentation.
") ActsOn;
		virtual Standard_Boolean ActsOn(const TopAbs_ShapeEnum aStandardMode);

		/****** SelectMgr_CompositionFilter::Add ******/
		/****** md5 signature: 3b329e3d0b8dfe710a9ec4b55242b939 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
afilter: SelectMgr_Filter

Return
-------
None

Description
-----------
Adds the filter afilter to a filter object created by a filter class inheriting this framework.
") Add;
		void Add(const opencascade::handle<SelectMgr_Filter> & afilter);

		/****** SelectMgr_CompositionFilter::Clear ******/
		/****** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clears the filters used in this framework.
") Clear;
		void Clear();

		/****** SelectMgr_CompositionFilter::IsEmpty ******/
		/****** md5 signature: 6ab5e1ad63f93168856ab126dd374b81 ******/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if this framework is empty.
") IsEmpty;
		Standard_Boolean IsEmpty();

		/****** SelectMgr_CompositionFilter::IsIn ******/
		/****** md5 signature: bcb650ce8ef2a28332648c8155fc9140 ******/
		%feature("compactdefaultargs") IsIn;
		%feature("autodoc", "
Parameters
----------
aFilter: SelectMgr_Filter

Return
-------
bool

Description
-----------
Returns true if the filter afilter is in this framework.
") IsIn;
		Standard_Boolean IsIn(const opencascade::handle<SelectMgr_Filter> & aFilter);

		/****** SelectMgr_CompositionFilter::Remove ******/
		/****** md5 signature: 997660465968b9e15e5a0b93f7971147 ******/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "
Parameters
----------
aFilter: SelectMgr_Filter

Return
-------
None

Description
-----------
Removes the filter afilter from this framework.
") Remove;
		void Remove(const opencascade::handle<SelectMgr_Filter> & aFilter);

		/****** SelectMgr_CompositionFilter::StoredFilters ******/
		/****** md5 signature: 0ff7be41979ba25dcaba3d785745d646 ******/
		%feature("compactdefaultargs") StoredFilters;
		%feature("autodoc", "Return
-------
SelectMgr_ListOfFilter

Description
-----------
Returns the list of stored filters from this framework.
") StoredFilters;
		const SelectMgr_ListOfFilter & StoredFilters();

};


%make_alias(SelectMgr_CompositionFilter)

%extend SelectMgr_CompositionFilter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class SelectMgr_RectangularFrustum *
*************************************/
/************************************
* class SelectMgr_TriangularFrustum *
************************************/
/****************************
* class SelectMgr_AndFilter *
****************************/
class SelectMgr_AndFilter : public SelectMgr_CompositionFilter {
	public:
		/****** SelectMgr_AndFilter::SelectMgr_AndFilter ******/
		/****** md5 signature: 040688957c50b7c42a3f153f0a8f5f71 ******/
		%feature("compactdefaultargs") SelectMgr_AndFilter;
		%feature("autodoc", "Return
-------
None

Description
-----------
Constructs an empty selection filter object for two or more types of entity.
") SelectMgr_AndFilter;
		 SelectMgr_AndFilter();

		/****** SelectMgr_AndFilter::IsOk ******/
		/****** md5 signature: 22a33e4e2022519dc44ef8862044fea0 ******/
		%feature("compactdefaultargs") IsOk;
		%feature("autodoc", "
Parameters
----------
anobj: SelectMgr_EntityOwner

Return
-------
bool

Description
-----------
No available documentation.
") IsOk;
		Standard_Boolean IsOk(const opencascade::handle<SelectMgr_EntityOwner> & anobj);

};


%make_alias(SelectMgr_AndFilter)

%extend SelectMgr_AndFilter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class SelectMgr_AndOrFilter *
******************************/
class SelectMgr_AndOrFilter : public SelectMgr_CompositionFilter {
	public:
		/****** SelectMgr_AndOrFilter::SelectMgr_AndOrFilter ******/
		/****** md5 signature: 3acfa036201b797ff61ac64dc7fb378b ******/
		%feature("compactdefaultargs") SelectMgr_AndOrFilter;
		%feature("autodoc", "
Parameters
----------
theFilterType: SelectMgr_FilterType

Return
-------
None

Description
-----------
Constructs an empty selection filter.
") SelectMgr_AndOrFilter;
		 SelectMgr_AndOrFilter(const SelectMgr_FilterType theFilterType);

		/****** SelectMgr_AndOrFilter::FilterType ******/
		/****** md5 signature: e37fce598a0b5e9b676a367504573e6c ******/
		%feature("compactdefaultargs") FilterType;
		%feature("autodoc", "Return
-------
SelectMgr_FilterType

Description
-----------
Return a selection filter type (@sa selectmgr_filtertype).
") FilterType;
		SelectMgr_FilterType FilterType();

		/****** SelectMgr_AndOrFilter::IsOk ******/
		/****** md5 signature: 463a95f434e18db7234e3535445a2c33 ******/
		%feature("compactdefaultargs") IsOk;
		%feature("autodoc", "
Parameters
----------
theObj: SelectMgr_EntityOwner

Return
-------
bool

Description
-----------
Indicates that the selected interactive object passes the filter.
") IsOk;
		virtual Standard_Boolean IsOk(const opencascade::handle<SelectMgr_EntityOwner> & theObj);

		/****** SelectMgr_AndOrFilter::SetDisabledObjects ******/
		/****** md5 signature: cc2c53c8fee7b059ac3f6d19a9d335dc ******/
		%feature("compactdefaultargs") SetDisabledObjects;
		%feature("autodoc", "
Parameters
----------
theObjects: Graphic3d_NMapOfTransient

Return
-------
None

Description
-----------
Disable selection of specified objects.
") SetDisabledObjects;
		void SetDisabledObjects(const opencascade::handle<Graphic3d_NMapOfTransient> & theObjects);

		/****** SelectMgr_AndOrFilter::SetFilterType ******/
		/****** md5 signature: c4f32b4815b398cc3dcfa30b4c00ebdc ******/
		%feature("compactdefaultargs") SetFilterType;
		%feature("autodoc", "
Parameters
----------
theFilterType: SelectMgr_FilterType

Return
-------
None

Description
-----------
Sets a selection filter type. selectmgr_filtertype_or selection filter is used be default. @param thefiltertype the filter type.
") SetFilterType;
		void SetFilterType(const SelectMgr_FilterType theFilterType);

};


%make_alias(SelectMgr_AndOrFilter)

%extend SelectMgr_AndOrFilter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class SelectMgr_Frustum *
**************************/
/***************************
* class SelectMgr_OrFilter *
***************************/
class SelectMgr_OrFilter : public SelectMgr_CompositionFilter {
	public:
		/****** SelectMgr_OrFilter::SelectMgr_OrFilter ******/
		/****** md5 signature: ad84449df83b0d757e01c20b3606f4da ******/
		%feature("compactdefaultargs") SelectMgr_OrFilter;
		%feature("autodoc", "Return
-------
None

Description
-----------
Constructs an empty or selection filter.
") SelectMgr_OrFilter;
		 SelectMgr_OrFilter();

		/****** SelectMgr_OrFilter::IsOk ******/
		/****** md5 signature: 22a33e4e2022519dc44ef8862044fea0 ******/
		%feature("compactdefaultargs") IsOk;
		%feature("autodoc", "
Parameters
----------
anobj: SelectMgr_EntityOwner

Return
-------
bool

Description
-----------
No available documentation.
") IsOk;
		Standard_Boolean IsOk(const opencascade::handle<SelectMgr_EntityOwner> & anobj);

};


%make_alias(SelectMgr_OrFilter)

%extend SelectMgr_OrFilter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************
* class SelectMgr_TriangularFrustumSet *
***************************************/
/* python proxy for excluded classes */
%pythoncode {
@classnotwrapped
class SelectMgr_Frustum:
	pass

@classnotwrapped
class SelectMgr_BaseFrustum:
	pass

@classnotwrapped
class SelectMgr_TriangularFrustum:
	pass

@classnotwrapped
class SelectMgr_RectangularFrustum:
	pass

@classnotwrapped
class SelectMgr_TriangularFrustumSet:
	pass

}
/* end python proxy for excluded classes */
/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
/* class aliases */
%pythoncode {
SelectBasics_EntityOwner=SelectMgr_EntityOwner
}
/* deprecated methods */
%pythoncode {
@deprecated
def selectmgr_ComputeSensitivePrs(*args):
	return selectmgr.ComputeSensitivePrs(*args)

}
