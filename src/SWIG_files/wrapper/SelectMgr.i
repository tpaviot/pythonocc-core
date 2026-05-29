/*
Copyright 2008-2026 Thomas Paviot (tpaviot@gmail.com)

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
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_selectmgr.html"
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
%wrap_handle(SelectMgr_SensitiveEntitySet)
%wrap_handle(SelectMgr_ViewerSelector)
%wrap_handle(SelectMgr_AxisIntersector)
%wrap_handle(SelectMgr_CompositionFilter)
%wrap_handle(SelectMgr_AndFilter)
%wrap_handle(SelectMgr_AndOrFilter)
%wrap_handle(SelectMgr_OrFilter)
/* end handles declaration */

/* templates */
%ignore NCollection_IndexedDataMap<opencascade::handle<SelectMgr_EntityOwner>,SelectMgr_SortCriterion>::Items;
%ignore NCollection_IndexedDataMap<opencascade::handle<SelectMgr_EntityOwner>,SelectMgr_SortCriterion>::KeyValues;
%ignore NCollection_IndexedDataMap<opencascade::handle<SelectMgr_EntityOwner>,SelectMgr_SortCriterion>::IndexedItems;
%ignore NCollection_IndexedDataMap<opencascade::handle<SelectMgr_EntityOwner>,SelectMgr_SortCriterion>::Contained;
%template(SelectMgr_IndexedDataMapOfOwnerCriterion) NCollection_IndexedDataMap<opencascade::handle<SelectMgr_EntityOwner>,SelectMgr_SortCriterion>;
%template(SelectMgr_ListIteratorOfListOfFilter) NCollection_TListIterator<opencascade::handle<SelectMgr_Filter>>;
%template(SelectMgr_ListOfFilter) NCollection_List<opencascade::handle<SelectMgr_Filter>>;

%extend NCollection_List<opencascade::handle<SelectMgr_Filter>> {
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
        it = SelectMgr_ListIteratorOfListOfFilter(self)
        while it.More():
            yield it.Value()
            it.Next()
    }
};
%template(SelectMgr_Mat4) NCollection_Mat4<double>;
%template(SelectMgr_SequenceOfSelection) NCollection_Sequence<opencascade::handle<SelectMgr_Selection>>;

%extend NCollection_Sequence<opencascade::handle<SelectMgr_Selection>> {
    // occt-800: NCollection_BaseSequence methods are not wrapped through
    // SWIG (its inner SeqNode has private new/delete). Re-export them per
    // instantiation so Python code can call .Size(), .Length(), .IsEmpty()
    // and use len() on every NCollection_Sequence<...>.
    size_t Size() const noexcept { return $self->Size(); }
    int Length() const noexcept { return $self->Length(); }
    bool IsEmpty() const noexcept { return $self->IsEmpty(); }
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(SelectMgr_Vec3) NCollection_Vec3<double>;
%template(SelectMgr_Vec4) NCollection_Vec4<double>;
/* end templates declaration */

/* typedefs */
typedef NCollection_IndexedDataMap<opencascade::handle<SelectMgr_EntityOwner>, SelectMgr_SortCriterion> SelectMgr_IndexedDataMapOfOwnerCriterion;
typedef NCollection_List<opencascade::handle<SelectMgr_Filter>>::Iterator SelectMgr_ListIteratorOfListOfFilter;
typedef NCollection_List<opencascade::handle<SelectMgr_Filter>> SelectMgr_ListOfFilter;
typedef NCollection_Mat4<double> SelectMgr_Mat4;
typedef NCollection_Sequence<opencascade::handle<SelectMgr_Selection>> SelectMgr_SequenceOfSelection;
typedef NCollection_Vec3<double> SelectMgr_Vec3;
typedef NCollection_Vec4<double> SelectMgr_Vec4;
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
		/****** md5 signature: afc76bf2adf77aefcbedd86cdc13198e ******/
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
		 SelectMgr_BVHThreadPool(int theNbThreads);

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
Queue a sensitive entity to build its BVH.
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

		/****** SelectMgr_BaseIntersector::CopyWithBuilder ******/
		/****** md5 signature: 4203d7a6d37f33ee5e58c6994fdc2e7a ******/
		%feature("compactdefaultargs") CopyWithBuilder;
		%feature("autodoc", "
Parameters
----------
theBuilder: SelectMgr_FrustumBuilder

Return
-------
opencascade::handle<SelectMgr_BaseIntersector>

Description
-----------
Input parameter: theBuilder argument that represents corresponding settings for re-constructing transformed frustum from scratch; should NOT be NULL. 
Return: a copy of the frustum with the input builder assigned.
") CopyWithBuilder;
		virtual opencascade::handle<SelectMgr_BaseIntersector> CopyWithBuilder(const opencascade::handle<SelectMgr_FrustumBuilder> & theBuilder);

		/****** SelectMgr_BaseIntersector::DetectedPoint ******/
		/****** md5 signature: 875635303d6194ba425add5963bb5e86 ******/
		%feature("compactdefaultargs") DetectedPoint;
		%feature("autodoc", "
Parameters
----------
theDepth: double

Return
-------
gp_Pnt

Description
-----------
Calculates the point on a view ray that was detected during the run of selection algo by given depth. It makes sense only for intersectors built on a single point. This method returns infinite point for the base class.
") DetectedPoint;
		virtual gp_Pnt DetectedPoint(const double theDepth);

		/****** SelectMgr_BaseIntersector::DistToGeometryCenter ******/
		/****** md5 signature: cc9904cead15dbd465fee1700d359570 ******/
		%feature("compactdefaultargs") DistToGeometryCenter;
		%feature("autodoc", "
Parameters
----------
theCOG: gp_Pnt

Return
-------
double

Description
-----------
Measures distance between 3d projection of user-picked screen point and given point theCOG. It makes sense only for intersectors built on a single point. This method returns infinite value for the base class.
") DistToGeometryCenter;
		virtual double DistToGeometryCenter(const gp_Pnt & theCOG);


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
Returns far point of intersector. This method returns zero point for the base class.
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
Returns current mouse coordinates. This method returns infinite point for the base class.
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
Returns near point of intersector. This method returns zero point for the base class.
") GetNearPnt;
		virtual const gp_Pnt GetNearPnt();

		/****** SelectMgr_BaseIntersector::GetPlanes ******/
		/****** md5 signature: e0756643357b2a138b0fb8c1752db254 ******/
		%feature("compactdefaultargs") GetPlanes;
		%feature("autodoc", "
Parameters
----------
thePlaneEquations: NCollection_DynamicArray<NCollection_Vec4<double>>

Return
-------
None

Description
-----------
Stores plane equation coefficients (in the following form: Ax + By + Cz + D = 0) to the given vector. This method only clears input vector for the base class.
") GetPlanes;
		virtual void GetPlanes(NCollection_DynamicArray<NCollection_Vec4<double>> & thePlaneEquations);

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
Returns direction ray of intersector. This method returns zero direction for the base class.
") GetViewRayDirection;
		virtual const gp_Dir GetViewRayDirection();

		/****** SelectMgr_BaseIntersector::IsScalable ******/
		/****** md5 signature: 10d9fd6f098b08a8d73c0558c0dc75db ******/
		%feature("compactdefaultargs") IsScalable;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Checks if it is possible to scale this intersector.
") IsScalable;
		virtual bool IsScalable();

		/****** SelectMgr_BaseIntersector::OverlapsBox ******/
		/****** md5 signature: 5995584c0ce0aa44f84986dcda0cab4d ******/
		%feature("compactdefaultargs") OverlapsBox;
		%feature("autodoc", "
Parameters
----------
theBoxMin: NCollection_Vec3<double>
theBoxMax: NCollection_Vec3<double>
theClipRange: SelectMgr_ViewClipRange
thePickResult: SelectBasics_PickResult

Return
-------
bool

Description
-----------
SAT intersection test between defined volume and given axis-aligned box.
") OverlapsBox;
		virtual bool OverlapsBox(const NCollection_Vec3<double> & theBoxMin, const NCollection_Vec3<double> & theBoxMax, const SelectMgr_ViewClipRange & theClipRange, SelectBasics_PickResult & thePickResult);

		/****** SelectMgr_BaseIntersector::OverlapsBox ******/
		/****** md5 signature: b423e9704130b7a5e6b668a7ee3b1d58 ******/
		%feature("compactdefaultargs") OverlapsBox;
		%feature("autodoc", "
Parameters
----------
theBoxMin: NCollection_Vec3<double>
theBoxMax: NCollection_Vec3<double>
theInside: bool * (optional, default to nullptr)

Return
-------
bool

Description
-----------
Returns true if selecting volume is overlapped by axis-aligned bounding box with minimum corner at point theMinPt and maximum at point theMaxPt.
") OverlapsBox;
		virtual bool OverlapsBox(const NCollection_Vec3<double> & theBoxMin, const NCollection_Vec3<double> & theBoxMax, bool * theInside = nullptr);

		/****** SelectMgr_BaseIntersector::OverlapsCircle ******/
		/****** md5 signature: e23e47d2389e7b7a4486bafa3c44e0bc ******/
		%feature("compactdefaultargs") OverlapsCircle;
		%feature("autodoc", "
Parameters
----------
theBottomRad: double
theTrsf: gp_Trsf
theIsFilled: bool
theClipRange: SelectMgr_ViewClipRange
thePickResult: SelectBasics_PickResult

Return
-------
bool

Description
-----------
Returns true if selecting volume is overlapped by circle with radius theRadius, boolean theIsFilled and transformation to apply theTrsf. The position and orientation of the circle are specified via theTrsf transformation for gp::XOY() with center in gp::Origin().
") OverlapsCircle;
		virtual bool OverlapsCircle(const double theBottomRad, const gp_Trsf & theTrsf, const bool theIsFilled, const SelectMgr_ViewClipRange & theClipRange, SelectBasics_PickResult & thePickResult);

		/****** SelectMgr_BaseIntersector::OverlapsCircle ******/
		/****** md5 signature: 758a90ad48da9a73136aa329166f8c7b ******/
		%feature("compactdefaultargs") OverlapsCircle;
		%feature("autodoc", "
Parameters
----------
theBottomRad: double
theTrsf: gp_Trsf
theIsFilled: bool
theInside: bool * (optional, default to nullptr)

Return
-------
bool

Description
-----------
Returns true if selecting volume is overlapped by circle with radius theRadius, boolean theIsFilled and transformation to apply theTrsf. The position and orientation of the circle are specified via theTrsf transformation for gp::XOY() with center in gp::Origin().
") OverlapsCircle;
		virtual bool OverlapsCircle(const double theBottomRad, const gp_Trsf & theTrsf, const bool theIsFilled, bool * theInside = nullptr);

		/****** SelectMgr_BaseIntersector::OverlapsCylinder ******/
		/****** md5 signature: 793ee928eebde25142a6bc5519e0e659 ******/
		%feature("compactdefaultargs") OverlapsCylinder;
		%feature("autodoc", "
Parameters
----------
theBottomRad: double
theTopRad: double
theHeight: double
theTrsf: gp_Trsf
theIsHollow: bool
theClipRange: SelectMgr_ViewClipRange
thePickResult: SelectBasics_PickResult

Return
-------
bool

Description
-----------
Returns true if selecting volume is overlapped by cylinder (or cone) with radiuses theBottomRad and theTopRad, height theHeight and transformation to apply theTrsf.
") OverlapsCylinder;
		virtual bool OverlapsCylinder(const double theBottomRad, const double theTopRad, const double theHeight, const gp_Trsf & theTrsf, const bool theIsHollow, const SelectMgr_ViewClipRange & theClipRange, SelectBasics_PickResult & thePickResult);

		/****** SelectMgr_BaseIntersector::OverlapsCylinder ******/
		/****** md5 signature: 3e5c9ccc11e6c2a342b0f1b1e585586d ******/
		%feature("compactdefaultargs") OverlapsCylinder;
		%feature("autodoc", "
Parameters
----------
theBottomRad: double
theTopRad: double
theHeight: double
theTrsf: gp_Trsf
theIsHollow: bool
theInside: bool * (optional, default to nullptr)

Return
-------
bool

Description
-----------
Returns true if selecting volume is overlapped by cylinder (or cone) with radiuses theBottomRad and theTopRad, height theHeight and transformation to apply theTrsf.
") OverlapsCylinder;
		virtual bool OverlapsCylinder(const double theBottomRad, const double theTopRad, const double theHeight, const gp_Trsf & theTrsf, const bool theIsHollow, bool * theInside = nullptr);

		/****** SelectMgr_BaseIntersector::OverlapsPoint ******/
		/****** md5 signature: 2302992fa14bab9ed8e92f74bf84e2c9 ******/
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
		virtual bool OverlapsPoint(const gp_Pnt & thePnt, const SelectMgr_ViewClipRange & theClipRange, SelectBasics_PickResult & thePickResult);

		/****** SelectMgr_BaseIntersector::OverlapsPoint ******/
		/****** md5 signature: 1ff40d008959bb5bc93ef8c1296923d5 ******/
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
Intersection test between defined volume and given point Does not perform depth calculation, so this method is defined as helper function for inclusion test. Therefore, its implementation makes sense only for rectangular frustum with box selection mode activated.
") OverlapsPoint;
		virtual bool OverlapsPoint(const gp_Pnt & thePnt);

		/****** SelectMgr_BaseIntersector::OverlapsPolygon ******/
		/****** md5 signature: 9b51cf8adf07206f21940eb7722568b5 ******/
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
SAT intersection test between defined volume and given ordered set of points, representing line segments. The test may be considered of interior part or boundary line defined by segments depending on given sensitivity type.
") OverlapsPolygon;
		virtual bool OverlapsPolygon(const TColgp_Array1OfPnt & theArrayOfPnts, Select3D_TypeOfSensitivity theSensType, const SelectMgr_ViewClipRange & theClipRange, SelectBasics_PickResult & thePickResult);

		/****** SelectMgr_BaseIntersector::OverlapsSegment ******/
		/****** md5 signature: 633be89ae83b1f9cb2c666022fc26a58 ******/
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
		virtual bool OverlapsSegment(const gp_Pnt & thePnt1, const gp_Pnt & thePnt2, const SelectMgr_ViewClipRange & theClipRange, SelectBasics_PickResult & thePickResult);

		/****** SelectMgr_BaseIntersector::OverlapsSphere ******/
		/****** md5 signature: 7f55133be800617ca4cba7509ac1f6c5 ******/
		%feature("compactdefaultargs") OverlapsSphere;
		%feature("autodoc", "
Parameters
----------
theCenter: gp_Pnt
theRadius: double
theInside: bool * (optional, default to nullptr)

Return
-------
bool

Description
-----------
Returns true if selecting volume is overlapped by sphere with center theCenter and radius theRadius.
") OverlapsSphere;
		virtual bool OverlapsSphere(const gp_Pnt & theCenter, const double theRadius, bool * theInside = nullptr);

		/****** SelectMgr_BaseIntersector::OverlapsSphere ******/
		/****** md5 signature: 235e6b8229dea1e1e43bdda0fc53f873 ******/
		%feature("compactdefaultargs") OverlapsSphere;
		%feature("autodoc", "
Parameters
----------
theCenter: gp_Pnt
theRadius: double
theClipRange: SelectMgr_ViewClipRange
thePickResult: SelectBasics_PickResult

Return
-------
bool

Description
-----------
Returns true if selecting volume is overlapped by sphere with center theCenter and radius theRadius.
") OverlapsSphere;
		virtual bool OverlapsSphere(const gp_Pnt & theCenter, const double theRadius, const SelectMgr_ViewClipRange & theClipRange, SelectBasics_PickResult & thePickResult);

		/****** SelectMgr_BaseIntersector::OverlapsTriangle ******/
		/****** md5 signature: 1f8e889f62d55e05846e14c08fdc9980 ******/
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
SAT intersection test between defined volume and given triangle. The test may be considered of interior part or boundary line defined by triangle vertices depending on given sensitivity type.
") OverlapsTriangle;
		virtual bool OverlapsTriangle(const gp_Pnt & thePnt1, const gp_Pnt & thePnt2, const gp_Pnt & thePnt3, Select3D_TypeOfSensitivity theSensType, const SelectMgr_ViewClipRange & theClipRange, SelectBasics_PickResult & thePickResult);

		/****** SelectMgr_BaseIntersector::RayCircleIntersection ******/
		/****** md5 signature: 3c3813b99e827a3789f005e18b09bae2 ******/
		%feature("compactdefaultargs") RayCircleIntersection;
		%feature("autodoc", "
Parameters
----------
theRadius: double
theLoc: gp_Pnt
theRayDir: gp_Dir
theIsFilled: bool

Return
-------
theTime: double

Description
-----------
Checks whether the ray that starts at the point theLoc and directs with the direction theRayDir intersects with the circle 
Input parameter: theRadius the circle radius 
Input parameter: theLoc the location of the ray 
Input parameter: theRayDir the ray direction 
Input parameter: theIsFilled true if it's a circle, false if it's a circle outline @param[out] theTime the intersection.
") RayCircleIntersection;
		virtual bool RayCircleIntersection(const double theRadius, const gp_Pnt & theLoc, const gp_Dir & theRayDir, const bool theIsFilled, Standard_Real &OutValue);

		/****** SelectMgr_BaseIntersector::RayCylinderIntersection ******/
		/****** md5 signature: 2b9b2b33d6e754b28b18dad8bef5e44f ******/
		%feature("compactdefaultargs") RayCylinderIntersection;
		%feature("autodoc", "
Parameters
----------
theBottomRadius: double
theTopRadius: double
theHeight: double
theLoc: gp_Pnt
theRayDir: gp_Dir
theIsHollow: bool

Return
-------
theTimeEnter: double
theTimeLeave: double

Description
-----------
Checks whether the ray that starts at the point theLoc and directs with the direction theRayDir intersects with the hollow cylinder (or cone) 
Input parameter: theBottomRadius the bottom cylinder radius 
Input parameter: theTopRadius the top cylinder radius 
Input parameter: theHeight the cylinder height 
Input parameter: theLoc the location of the ray 
Input parameter: theRayDir the ray direction 
Input parameter: theIsHollow true if the cylinder is hollow @param[out] theTimeEnter the entering the intersection @param[out] theTimeLeave the leaving the intersection.
") RayCylinderIntersection;
		virtual bool RayCylinderIntersection(const double theBottomRadius, const double theTopRadius, const double theHeight, const gp_Pnt & theLoc, const gp_Dir & theRayDir, const bool theIsHollow, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** SelectMgr_BaseIntersector::RaySphereIntersection ******/
		/****** md5 signature: fee0d61af7b3ed05d562e1b067816446 ******/
		%feature("compactdefaultargs") RaySphereIntersection;
		%feature("autodoc", "
Parameters
----------
theCenter: gp_Pnt
theRadius: double
theLoc: gp_Pnt
theRayDir: gp_Dir

Return
-------
theTimeEnter: double
theTimeLeave: double

Description
-----------
Checks whether the ray that starts at the point theLoc and directs with the direction theRayDir intersects with the sphere with center at theCenter and radius TheRadius.
") RaySphereIntersection;
		virtual bool RaySphereIntersection(const gp_Pnt & theCenter, const double theRadius, const gp_Pnt & theLoc, const gp_Dir & theRayDir, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** SelectMgr_BaseIntersector::ScaleAndTransform ******/
		/****** md5 signature: 7ee3edb891fdb1cd752220d7d37cc0fb ******/
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
Note that this method does not perform any checks on type of the frustum. 
Input parameter: theScaleFactor scale factor for new intersector or negative value if undefined;  IMPORTANT: scaling makes sense only for scalable ::IsScalable()  intersectors (built on a single point)! 
Input parameter: theTrsf transformation for new intersector or gp_Identity if undefined 
Input parameter: theBuilder an optional argument that represents corresponding settings for re-constructing transformed frustum from scratch; could be NULL if reconstruction is not expected furthermore 
Return: a copy of the frustum resized according to the scale factor given and transforms it using the matrix given.
") ScaleAndTransform;
		virtual opencascade::handle<SelectMgr_BaseIntersector> ScaleAndTransform(const int theScaleFactor, const gp_GTrsf & theTrsf, const opencascade::handle<SelectMgr_FrustumBuilder> & theBuilder);

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
		/****** md5 signature: a5165cef7d870fa68dfd648d08ea0907 ******/
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
Sets pixel tolerance. It makes sense only for scalable intersectors (built on a single point). This method does nothing for the base class.
") SetPixelTolerance;
		virtual void SetPixelTolerance(const int theTol);

		/****** SelectMgr_BaseIntersector::SetViewport ******/
		/****** md5 signature: 1d6d3428b08188c7ddea683acd4bf79f ******/
		%feature("compactdefaultargs") SetViewport;
		%feature("autodoc", "
Parameters
----------
theX: double
theY: double
theWidth: double
theHeight: double

Return
-------
None

Description
-----------
Sets viewport parameters. This method does nothing for the base class.
") SetViewport;
		virtual void SetViewport(const double theX, const double theY, const double theWidth, const double theHeight);

		/****** SelectMgr_BaseIntersector::SetWindowSize ******/
		/****** md5 signature: fdc8fda163668851af44b3aea9432cd1 ******/
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
Sets current window size. This method does nothing for the base class.
") SetWindowSize;
		virtual void SetWindowSize(const int theWidth, const int theHeight);

		/****** SelectMgr_BaseIntersector::WindowSize ******/
		/****** md5 signature: 69b00f34d0a77ffe9af65de392cf385b ******/
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
Returns current window size. This method doesn't set any output values for the base class.
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
		/****** md5 signature: 3a56814918653adce27ae55128b44b1b ******/
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
Initializes the selection priority aPriority.
") SelectMgr_EntityOwner;
		 SelectMgr_EntityOwner(const int aPriority = 0);

		/****** SelectMgr_EntityOwner::SelectMgr_EntityOwner ******/
		/****** md5 signature: a6439102949c1b6611c3e43040e17eb8 ******/
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
Constructs a framework with the selectable object anSO being attributed the selection priority aPriority.
") SelectMgr_EntityOwner;
		 SelectMgr_EntityOwner(const opencascade::handle<SelectMgr_SelectableObject> & aSO, const int aPriority = 0);

		/****** SelectMgr_EntityOwner::SelectMgr_EntityOwner ******/
		/****** md5 signature: 8d6f103711ab1f4d8f79b12547f6d864 ******/
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
Constructs a framework from existing one anSO being attributed the selection priority aPriority.
") SelectMgr_EntityOwner;
		 SelectMgr_EntityOwner(const opencascade::handle<SelectMgr_EntityOwner> & theOwner, const int aPriority = 0);

		/****** SelectMgr_EntityOwner::Clear ******/
		/****** md5 signature: 301979fade7c16ac0201f3c0c8a0aeef ******/
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
Clears the owners matching the value of the selection mode aMode from the presentation manager object aPM.
") Clear;
		virtual void Clear(const opencascade::handle<PrsMgr_PresentationManager> & thePrsMgr, const int theMode = 0);

		/****** SelectMgr_EntityOwner::ComesFromDecomposition ******/
		/****** md5 signature: fc36ec3cae485bcb40d8f2cf8df42e2b ******/
		%feature("compactdefaultargs") ComesFromDecomposition;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if this owner points to a part of object and False for entire object.
") ComesFromDecomposition;
		bool ComesFromDecomposition();


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
		/****** md5 signature: c02c1c39d73ba289fb7ce69248ae0bd5 ******/
		%feature("compactdefaultargs") HandleMouseClick;
		%feature("autodoc", "
Parameters
----------
thePoint: NCollection_Vec2<int>
theButton: Aspect_VKeyMouse
theModifiers: Aspect_VKeyFlags
theIsDoubleClick: bool

Return
-------
bool

Description
-----------
Handle mouse button click event. Does nothing by default and returns False. 
Parameter thePoint mouse cursor position 
Parameter theButton clicked button 
Parameter theModifiers key modifiers 
Parameter theIsDoubleClick flag indicating double mouse click 
Return: True if object handled click For all selection schemes, allowing to select an object, it's available.
") HandleMouseClick;
		virtual bool HandleMouseClick(const NCollection_Vec2<int> & thePoint, Aspect_VKeyMouse theButton, Aspect_VKeyFlags theModifiers, bool theIsDoubleClick);

		/****** SelectMgr_EntityOwner::HasLocation ******/
		/****** md5 signature: 45899d72379b0dfb2df8d4f90be93909 ******/
		%feature("compactdefaultargs") HasLocation;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if selectable has transformation.
") HasLocation;
		virtual bool HasLocation();

		/****** SelectMgr_EntityOwner::HasSelectable ******/
		/****** md5 signature: e7765fe6cdd6a52683747ab4a1aa28b9 ******/
		%feature("compactdefaultargs") HasSelectable;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if there is a selectable object to serve as an owner.
") HasSelectable;
		bool HasSelectable();

		/****** SelectMgr_EntityOwner::HilightWithColor ******/
		/****** md5 signature: 3bd267b4834f55ce8337aab7393145e2 ******/
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
Highlights selectable object's presentation with display mode in presentation manager with given highlight style. Also a check for auto-highlight is performed - if selectable object manages highlighting on its own, execution will be passed to SelectMgr_SelectableObject::HilightOwnerWithColor method.
") HilightWithColor;
		virtual void HilightWithColor(const opencascade::handle<PrsMgr_PresentationManager> & thePrsMgr, const opencascade::handle<Prs3d_Drawer> & theStyle, const int theMode = 0);

		/****** SelectMgr_EntityOwner::IsAutoHilight ******/
		/****** md5 signature: 0b4c5bacd9f4abc895dcd1d8d96b2cf0 ******/
		%feature("compactdefaultargs") IsAutoHilight;
		%feature("autodoc", "Return
-------
bool

Description
-----------
if owner is not auto hilighted, for group contains many such owners will be called one method HilightSelected of SelectableObject.
") IsAutoHilight;
		virtual bool IsAutoHilight();

		/****** SelectMgr_EntityOwner::IsForcedHilight ******/
		/****** md5 signature: 9daca6ead2db4a5b7a27e6f8cbca6f0c ******/
		%feature("compactdefaultargs") IsForcedHilight;
		%feature("autodoc", "Return
-------
bool

Description
-----------
if this method returns True the owner will always call method Hilight for SelectableObject when the owner is detected. By default it always return False.
") IsForcedHilight;
		virtual bool IsForcedHilight();

		/****** SelectMgr_EntityOwner::IsHilighted ******/
		/****** md5 signature: e5e0b37a21a271e58679409aadbd42e6 ******/
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
		virtual bool IsHilighted(const opencascade::handle<PrsMgr_PresentationManager> & thePrsMgr, const int theMode = 0);

		/****** SelectMgr_EntityOwner::IsSameSelectable ******/
		/****** md5 signature: 9832c28836747fbe170ee87ed29ca32b ******/
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
		bool IsSameSelectable(const opencascade::handle<SelectMgr_SelectableObject> & theOther);

		/****** SelectMgr_EntityOwner::IsSelected ******/
		/****** md5 signature: 8c2788305f5fbf48466fd8fd905291cd ******/
		%feature("compactdefaultargs") IsSelected;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return: true if the owner is selected.
") IsSelected;
		bool IsSelected();

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
		/****** md5 signature: daa723407e734ef224c4badf0a45ec78 ******/
		%feature("compactdefaultargs") Priority;
		%feature("autodoc", "Return
-------
int

Description
-----------
Return selection priority (within range [0-9]) for results with the same depth; 0 by default. Example - selection of shapes: the owners are selectable objects (presentations) a user can give vertex priority [3], edges [2] faces [1] shape [0], so that if during selection one vertex one edge and one face are simultaneously detected, the vertex will only be hilighted.
") Priority;
		int Priority();

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
No available documentation.
") Set;
		void Set(const opencascade::handle<SelectMgr_SelectableObject> & theSelObj);

		/****** SelectMgr_EntityOwner::Set ******/
		/****** md5 signature: c64562bab47fdb967b904d14caefb403 ******/
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
No available documentation.
") Set;
		void Set(const int thePriority);

		/****** SelectMgr_EntityOwner::SetComesFromDecomposition ******/
		/****** md5 signature: 20910a23e3efa30e4114bd6cbc83508d ******/
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
Sets flag indicating this owner points to a part of object (True) or to entire object (False).
") SetComesFromDecomposition;
		void SetComesFromDecomposition(const bool theIsFromDecomposition);

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
		/****** md5 signature: 9d934f2976d17f33c72a10b5352b1924 ******/
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
		void SetPriority(int thePriority);

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
		/****** md5 signature: 3dca24e59c0774525df0ede03091662a ******/
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
Set the state of the owner. 
Input parameter: theIsSelected shows if owner is selected.
") SetSelected;
		void SetSelected(const bool theIsSelected);

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
Set Z layer ID and update all presentations.
") SetZLayer;
		virtual void SetZLayer(int theLayerId);

		/****** SelectMgr_EntityOwner::State ******/
		/****** md5 signature: cbf328205d1b1baa81d40d89d002012f ******/
		%feature("compactdefaultargs") State;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") State;
		int State();

		/****** SelectMgr_EntityOwner::State ******/
		/****** md5 signature: d8ceb42f502c96cb12d490a02b08b2ee ******/
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
Set the state of the owner. The method is deprecated. Use SetSelected() instead.
") State;
		void State(const int theStatus);

		/****** SelectMgr_EntityOwner::Unhilight ******/
		/****** md5 signature: e24ee9bf6793bb900f96f810dcd3e053 ******/
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
Removes highlighting from the owner of a detected selectable object in the presentation manager. This object could be the owner of a sensitive primitive. 
Parameter thePrsMgr presentation manager 
Parameter theMode obsolete argument for compatibility, should be ignored by implementations.
") Unhilight;
		virtual void Unhilight(const opencascade::handle<PrsMgr_PresentationManager> & thePrsMgr, const int theMode = 0);

		/****** SelectMgr_EntityOwner::UpdateHighlightTrsf ******/
		/****** md5 signature: bd6f5579a8609eef36c294e65f200b4d ******/
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
		virtual void UpdateHighlightTrsf(const opencascade::handle<V3d_Viewer> & theViewer, const opencascade::handle<PrsMgr_PresentationManager> & theManager, const int theDispMode);

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
		/****** md5 signature: fcba32741341d7b72fe810b45f91ec9f ******/
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
Returns true in an AIS local context, if this filter operates on a type of subshape defined in a filter class inheriting this framework. This function completes IsOk in an AIS local context.
") ActsOn;
		virtual bool ActsOn(const TopAbs_ShapeEnum aStandardMode);

		/****** SelectMgr_Filter::IsOk ******/
		/****** md5 signature: f394062005db726c5c8a7a017fedac3e ******/
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
Indicates that the selected Interactive Object passes the filter. The owner, anObj, can be either direct or user. A direct owner is the corresponding construction element, whereas a user is the compound shape of which the entity forms a part. When an object is detected by the mouse - in AIS, this is done through a context selector - its owner is passed to the filter as an argument. If the object returns true, it is kept; if not, it is rejected. If you are creating a filter class inheriting this framework, and the daughter class is to be used in an AIS local context, you will need to implement the virtual function ActsOn.
") IsOk;
		virtual bool IsOk(const opencascade::handle<SelectMgr_EntityOwner> & anObj);

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
		/****** md5 signature: 1e7ef54bd1569a2ebb173b2c53a72e32 ******/
		%feature("compactdefaultargs") ProjectPntOnViewPlane;
		%feature("autodoc", "
Parameters
----------
theX: double
theY: double
theZ: double

Return
-------
gp_Pnt

Description
-----------
Projects 2d screen point onto view frustum plane: theZ = 0 - near plane, theZ = 1 - far plane.
") ProjectPntOnViewPlane;
		gp_Pnt ProjectPntOnViewPlane(const double & theX, const double & theY, const double & theZ);

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
		/****** md5 signature: 6434315586423ecd16144dba46f5869b ******/
		%feature("compactdefaultargs") SetViewport;
		%feature("autodoc", "
Parameters
----------
theX: double
theY: double
theWidth: double
theHeight: double

Return
-------
None

Description
-----------
Stores current viewport coordinates.
") SetViewport;
		void SetViewport(const double theX, const double theY, const double theWidth, const double theHeight);

		/****** SelectMgr_FrustumBuilder::SetWindowSize ******/
		/****** md5 signature: 893fec2368bfa674a6aeb725241927cf ******/
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
		void SetWindowSize(const int theWidth, const int theHeight);

		/****** SelectMgr_FrustumBuilder::SignedPlanePntDist ******/
		/****** md5 signature: 9c21126ddf614cdcd8e839ae3bbe0ca5 ******/
		%feature("compactdefaultargs") SignedPlanePntDist;
		%feature("autodoc", "
Parameters
----------
theEq: NCollection_Vec3<double>
thePnt: NCollection_Vec3<double>

Return
-------
double

Description
-----------
Calculates signed distance between plane with equation theEq and point thePnt.
") SignedPlanePntDist;
		double SignedPlanePntDist(const NCollection_Vec3<double> & theEq, const NCollection_Vec3<double> & thePnt);

		/****** SelectMgr_FrustumBuilder::WindowSize ******/
		/****** md5 signature: 99f8426008f1e97982312e7c169dd5b6 ******/
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
		/****** md5 signature: 8f48600362678b5c3f110d3ffa30c66b ******/
		%feature("compactdefaultargs") AcceptShapeDecomposition;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Informs the graphic context that the interactive Object may be decomposed into sub-shapes for dynamic selection. The most used Interactive Object is AIS_Shape.
") AcceptShapeDecomposition;
		virtual bool AcceptShapeDecomposition();

		/****** SelectMgr_SelectableObject::AddSelection ******/
		/****** md5 signature: fb07545444d5e44dc16dc45ab94cc6bd ******/
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
Adds the selection aSelection with the selection mode index aMode to this framework.
") AddSelection;
		void AddSelection(const opencascade::handle<SelectMgr_Selection> & aSelection, const int aMode);

		/****** SelectMgr_SelectableObject::BndBoxOfSelected ******/
		/****** md5 signature: d0e07ad11101d0b614026b805c6c7976 ******/
		%feature("compactdefaultargs") BndBoxOfSelected;
		%feature("autodoc", "
Parameters
----------
theOwners: NCollection_Shared<NCollection_IndexedMap<

Return
-------
Bnd_Box

Description
-----------
Returns a bounding box of sensitive entities with the owners given if they are a part of activated selection.
") BndBoxOfSelected;
		Bnd_Box BndBoxOfSelected(const opencascade::handle<NCollection_Shared<NCollection_IndexedMap<opencascade::handle<SelectMgr_EntityOwner>> >> & theOwners);

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
Method that needs to be implemented when the object manages selection and dynamic highlighting on its own. Clears or invalidates dynamic highlight presentation. By default it clears immediate draw of given presentation manager.
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
		/****** md5 signature: b5fbe9a5af2a8fe9d300c757cc0ff937 ******/
		%feature("compactdefaultargs") ClearSelections;
		%feature("autodoc", "
Parameters
----------
update: bool (optional, default to false)

Return
-------
None

Description
-----------
Empties all the selections in the SelectableObject <update> parameter defines whether all object's selections should be flagged for further update or not. This improved method can be used to recompute an object's selection (without redisplaying the object completely) when some selection mode is activated not for the first time.
") ClearSelections;
		void ClearSelections(const bool update = false);

		/****** SelectMgr_SelectableObject::ComputeSelection ******/
		/****** md5 signature: 724035803a92fba187c142041dc19836 ******/
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
Computes sensitive primitives for the given selection mode - key interface method of Selectable Object. 
Parameter theSelection selection to fill 
Parameter theMode selection mode to create sensitive primitives.
") ComputeSelection;
		virtual void ComputeSelection(const opencascade::handle<SelectMgr_Selection> & theSelection, const int theMode);


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
		/****** md5 signature: 47207c882d9145552331be073a7ce9d3 ******/
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
Removes presentations returned by GetHilightPresentation() and GetSelectPresentation().
") ErasePresentations;
		virtual void ErasePresentations(bool theToRemove);

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
Creates or returns existing presentation for highlighting detected object. 
Parameter thePrsMgr presentation manager to create new presentation 
Return: existing or newly created presentation (when thePrsMgr is not NULL).
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
Creates or returns existing presentation for highlighting selected object. 
Parameter thePrsMgr presentation manager to create new presentation 
Return: existing or newly created presentation (when thePrsMgr is not NULL).
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
		/****** md5 signature: 5b75cad9bb2d4ff0ce4f09f02eef1f93 ******/
		%feature("compactdefaultargs") GlobalSelectionMode;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the mode for selection of object as a whole; 0 by default.
") GlobalSelectionMode;
		int GlobalSelectionMode();

		/****** SelectMgr_SelectableObject::HasSelection ******/
		/****** md5 signature: fe44dcb5a31abaca838ec638f2a45b37 ******/
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
Returns true if a selection corresponding to the selection mode theMode was computed for this object.
") HasSelection;
		bool HasSelection(const int theMode);

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
Method which hilight an owner belonging to this selectable object (for fast presentation draw).
") HilightOwnerWithColor;
		virtual void HilightOwnerWithColor(const opencascade::handle<PrsMgr_PresentationManager> & thePM, const opencascade::handle<Prs3d_Drawer> & theStyle, const opencascade::handle<SelectMgr_EntityOwner> & theOwner);

		/****** SelectMgr_SelectableObject::HilightSelected ******/
		/****** md5 signature: b869fffba71ee9c4719475fa2437b6f3 ******/
		%feature("compactdefaultargs") HilightSelected;
		%feature("autodoc", "
Parameters
----------
thePrsMgr: PrsMgr_PresentationManager
theSeq: SelectMgr_EntityOwner

Return
-------
None

Description
-----------
Method which draws selected owners ( for fast presentation draw ).
") HilightSelected;
		virtual void HilightSelected(const opencascade::handle<PrsMgr_PresentationManager> & thePrsMgr, const NCollection_Sequence<opencascade::handle<SelectMgr_EntityOwner>> & theSeq);

		/****** SelectMgr_SelectableObject::IsAutoHilight ******/
		/****** md5 signature: 0b4c5bacd9f4abc895dcd1d8d96b2cf0 ******/
		%feature("compactdefaultargs") IsAutoHilight;
		%feature("autodoc", "Return
-------
bool

Description
-----------
If returns True, the old mechanism for highlighting selected objects is used (HilightSelected Method may be empty). If returns False, the HilightSelected method will be fully responsible for highlighting selected entity owners belonging to this selectable object.
") IsAutoHilight;
		virtual bool IsAutoHilight();

		/****** SelectMgr_SelectableObject::RecomputePrimitives ******/
		/****** md5 signature: 7bd2e52f5f2cfac7f6ff872dd5ea905f ******/
		%feature("compactdefaultargs") RecomputePrimitives;
		%feature("autodoc", "Return
-------
None

Description
-----------
Re-computes the sensitive primitives for all modes. IMPORTANT: Do not use this method to update selection primitives except implementing custom selection manager! This method does not take into account necessary BVH updates, but may invalidate the pointers it refers to. TO UPDATE SELECTION properly from outside classes, use method UpdateSelection.
") RecomputePrimitives;
		void RecomputePrimitives();

		/****** SelectMgr_SelectableObject::RecomputePrimitives ******/
		/****** md5 signature: cbd46ba90a22bec108c90a2da059b654 ******/
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
Re-computes the sensitive primitives which correspond to the <theMode>th selection mode. IMPORTANT: Do not use this method to update selection primitives except implementing custom selection manager! selection manager! This method does not take into account necessary BVH updates, but may invalidate the pointers it refers to. TO UPDATE SELECTION properly from outside classes, use method UpdateSelection.
") RecomputePrimitives;
		void RecomputePrimitives(const int theMode);

		/****** SelectMgr_SelectableObject::ResetTransformation ******/
		/****** md5 signature: d26877d3cd615239457490b332a63bcb ******/
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
		/****** md5 signature: fe1ffc5a827426e7bbd18fd7d3528782 ******/
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
Returns the selection having specified selection mode or NULL.
") Selection;
		const opencascade::handle<SelectMgr_Selection> & Selection(const int theMode);

		/****** SelectMgr_SelectableObject::Selections ******/
		/****** md5 signature: 857f6fda3d774e3442cc2fe4ac5c1663 ******/
		%feature("compactdefaultargs") Selections;
		%feature("autodoc", "Return
-------
NCollection_Sequence<opencascade::handle<SelectMgr_Selection>>

Description
-----------
Return the sequence of selections.
") Selections;
		const NCollection_Sequence<opencascade::handle<SelectMgr_Selection>> & Selections();

		/****** SelectMgr_SelectableObject::SetAssemblyOwner ******/
		/****** md5 signature: f6a159bb40bb3b9d2853b8c4212a0ef0 ******/
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
		void SetAssemblyOwner(const opencascade::handle<SelectMgr_EntityOwner> & theOwner, const int theMode = -1);

		/****** SelectMgr_SelectableObject::SetAutoHilight ******/
		/****** md5 signature: 50366ca76aa12a866d05d22e2bbc8485 ******/
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
Set AutoHilight property to true or false.
") SetAutoHilight;
		virtual void SetAutoHilight(const bool theAutoHilight);

		/****** SelectMgr_SelectableObject::SetZLayer ******/
		/****** md5 signature: 7d86852b704e871035c21b004fee430e ******/
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
Set Z layer ID and update all presentations of the selectable object. The layers mechanism allows drawing objects in higher layers in overlay of objects in lower layers.
") SetZLayer;
		void SetZLayer(int theLayerId);

		/****** SelectMgr_SelectableObject::UpdateSelection ******/
		/****** md5 signature: 936fa5a58868abe84e1b550652e94dca ******/
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
Sets update status FULL to selections of the object. Must be used as the only method of UpdateSelection from outer classes to prevent BVH structures from being outdated.
") UpdateSelection;
		void UpdateSelection(const int theMode = -1);

		/****** SelectMgr_SelectableObject::UpdateTransformation ******/
		/****** md5 signature: 9a2e534d4c630ee99e8569e461eb0023 ******/
		%feature("compactdefaultargs") UpdateTransformation;
		%feature("autodoc", "Return
-------
None

Description
-----------
Recomputes the location of the selection aSelection.
") UpdateTransformation;
		void UpdateTransformation();

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
Updates locations in all sensitive entities from <aSelection> and in corresponding entity owners.
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
	BVHSubset_ortho3dPersistent = 3,
	BVHSubset_ortho2dPersistent = 4,
	BVHSubsetNb = 5,
};

/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {

class BVHSubset(IntEnum):
	BVHSubset_3d = 0
	BVHSubset_3dPersistent = 1
	BVHSubset_2dPersistent = 2
	BVHSubset_ortho3dPersistent = 3
	BVHSubset_ortho2dPersistent = 4
	BVHSubsetNb = 5
BVHSubset_3d = BVHSubset.BVHSubset_3d
BVHSubset_3dPersistent = BVHSubset.BVHSubset_3dPersistent
BVHSubset_2dPersistent = BVHSubset.BVHSubset_2dPersistent
BVHSubset_ortho3dPersistent = BVHSubset.BVHSubset_ortho3dPersistent
BVHSubset_ortho2dPersistent = BVHSubset.BVHSubset_ortho2dPersistent
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
Creates new empty objects set and initializes BVH tree builders for each subset.
") SelectMgr_SelectableObjectSet;
		 SelectMgr_SelectableObjectSet();

		/****** SelectMgr_SelectableObjectSet::Append ******/
		/****** md5 signature: 55b8e09e34a1a94adde1dbbfb4009c9e ******/
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
Adds the new selectable object to the set. The selectable object is placed into one of the predefined subsets depending on its persistence type. After adding an object, this method marks the corresponding BVH tree for rebuild. 
Return: true if selectable object is added, otherwise returns false (selectable object is already in the set).
") Append;
		bool Append(const opencascade::handle<SelectMgr_SelectableObject> & theObject);

		/****** SelectMgr_SelectableObjectSet::BVH ******/
		/****** md5 signature: a032d841d25efa4fa602a7ae138ed928 ******/
		%feature("compactdefaultargs") BVH;
		%feature("autodoc", "
Parameters
----------
theSubset: BVHSubset

Return
-------
opencascade::handle<BVH_Tree<double, 3>>

Description
-----------
Returns computed BVH for the theSubset given.
") BVH;
		const opencascade::handle<BVH_Tree<double, 3>> & BVH(BVHSubset theSubset);

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
Performs necessary updates when object's persistence types changes. This method should be called right after changing transformation persistence flags of the objects and before updating BVH tree - to provide up-to-date state of the object set.
") ChangeSubset;
		void ChangeSubset(const opencascade::handle<SelectMgr_SelectableObject> & theObject);

		/****** SelectMgr_SelectableObjectSet::Contains ******/
		/****** md5 signature: f1f0ec327e5a23fb14f1d530e8d21efd ******/
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
Returns true if this objects set contains theObject given.
") Contains;
		bool Contains(const opencascade::handle<SelectMgr_SelectableObject> & theObject);


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
		/****** md5 signature: f6f61c5efb2817161c62bb439e5d33bf ******/
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
Returns object from subset theSubset by theIndex given. The method allows to get selectable object referred by the index of an element of the subset's BVH tree.
") GetObjectById;
		const opencascade::handle<SelectMgr_SelectableObject> & GetObjectById(BVHSubset theSubset, const int theIndex);

		/****** SelectMgr_SelectableObjectSet::IsEmpty ******/
		/****** md5 signature: 70a41d5fe65955a28167088305fc6991 ******/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the object set does not contain any selectable objects.
") IsEmpty;
		bool IsEmpty();

		/****** SelectMgr_SelectableObjectSet::IsEmpty ******/
		/****** md5 signature: aa3304fcedd640c1d7e7f188f3aaf620 ******/
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
		bool IsEmpty(BVHSubset theSubset);

		/****** SelectMgr_SelectableObjectSet::MarkDirty ******/
		/****** md5 signature: 37381481e073d0bb85d53a543d2b10a1 ******/
		%feature("compactdefaultargs") MarkDirty;
		%feature("autodoc", "Return
-------
None

Description
-----------
Marks every BVH subset for update.
") MarkDirty;
		void MarkDirty();

		/****** SelectMgr_SelectableObjectSet::Remove ******/
		/****** md5 signature: 17d31b3aa329e5f75faad58fb1791656 ******/
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
Removes the selectable object from the set. The selectable object is removed from the subset it has been placed into. After removing an object, this method marks the corresponding BVH tree for rebuild. 
Return: true if selectable object is removed, otherwise returns false (selectable object is not in the set).
") Remove;
		bool Remove(const opencascade::handle<SelectMgr_SelectableObject> & theObject);

		/****** SelectMgr_SelectableObjectSet::UpdateBVH ******/
		/****** md5 signature: 44525ff74dab71226011f052d6ac08e5 ******/
		%feature("compactdefaultargs") UpdateBVH;
		%feature("autodoc", "
Parameters
----------
theCam: Graphic3d_Camera
theWinSize: NCollection_Vec2<int>

Return
-------
None

Description
-----------
Updates outdated BVH trees and remembers the last state of the camera view-projection matrices and viewport (window) dimensions.
") UpdateBVH;
		void UpdateBVH(const opencascade::handle<Graphic3d_Camera> & theCam, const NCollection_Vec2<int> & theWinSize);

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
Returns active selecting volume that was built during last run of OCCT selection mechanism.
") ActiveVolume;
		const opencascade::handle<SelectMgr_BaseIntersector> & ActiveVolume();

		/****** SelectMgr_SelectingVolumeManager::AllowOverlapDetection ******/
		/****** md5 signature: 19545399d9a9832a305273e52c4ed2fb ******/
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
If theIsToAllow is false, only fully included sensitives will be detected, otherwise the algorithm will mark both included and overlapped entities as matched.
") AllowOverlapDetection;
		virtual void AllowOverlapDetection(const bool theIsToAllow);

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
		/****** md5 signature: a4a7cd4bacc8cdf6b65aad7669ef89fa ******/
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

		/****** SelectMgr_SelectingVolumeManager::CopyWithBuilder ******/
		/****** md5 signature: 2914cc86267e3fe7e35ac82856379325 ******/
		%feature("compactdefaultargs") CopyWithBuilder;
		%feature("autodoc", "
Parameters
----------
theBuilder: SelectMgr_FrustumBuilder

Return
-------
SelectMgr_SelectingVolumeManager

Description
-----------
Returns a copy of the selecting volume manager and its active frustum re-constructed using the passed builder. Builder is an argument that represents corresponding settings for re-constructing transformed frustum from scratch.
") CopyWithBuilder;
		virtual SelectMgr_SelectingVolumeManager CopyWithBuilder(const opencascade::handle<SelectMgr_FrustumBuilder> & theBuilder);

		/****** SelectMgr_SelectingVolumeManager::DetectedPoint ******/
		/****** md5 signature: fbd4a38baa50c48a3265b6e2806e3d68 ******/
		%feature("compactdefaultargs") DetectedPoint;
		%feature("autodoc", "
Parameters
----------
theDepth: double

Return
-------
gp_Pnt

Description
-----------
Calculates the point on a view ray that was detected during the run of selection algo by given depth. Throws exception if active selection type is not Point.
") DetectedPoint;
		gp_Pnt DetectedPoint(const double theDepth);

		/****** SelectMgr_SelectingVolumeManager::DistToGeometryCenter ******/
		/****** md5 signature: 221e331c0c6bbab729e487478612b76f ******/
		%feature("compactdefaultargs") DistToGeometryCenter;
		%feature("autodoc", "
Parameters
----------
theCOG: gp_Pnt

Return
-------
double

Description
-----------
Measures distance between 3d projection of user-picked screen point and given point theCOG.
") DistToGeometryCenter;
		double DistToGeometryCenter(const gp_Pnt & theCOG);


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
		/****** md5 signature: f465d9600a61bbc89705b899396de136 ******/
		%feature("compactdefaultargs") GetActiveSelectionType;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") GetActiveSelectionType;
		int GetActiveSelectionType();

		/****** SelectMgr_SelectingVolumeManager::GetFarPickedPnt ******/
		/****** md5 signature: 62507f3ed6ac4288023936d85d4f4dda ******/
		%feature("compactdefaultargs") GetFarPickedPnt;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Valid only for point and rectangular selection. Returns projection of 2d mouse picked point or projection of center of 2d rectangle (for point and rectangular selection correspondingly) onto far view frustum plane.
") GetFarPickedPnt;
		gp_Pnt GetFarPickedPnt();

		/****** SelectMgr_SelectingVolumeManager::GetMousePosition ******/
		/****** md5 signature: 30ca0c392dd17660bd5c2f3d39b8af3c ******/
		%feature("compactdefaultargs") GetMousePosition;
		%feature("autodoc", "Return
-------
gp_Pnt2d

Description
-----------
Returns mouse coordinates for Point selection mode. 
Return: infinite point in case of unsupport of mouse position for this active selection volume.
") GetMousePosition;
		gp_Pnt2d GetMousePosition();

		/****** SelectMgr_SelectingVolumeManager::GetNearPickedPnt ******/
		/****** md5 signature: 738c63da4b41512ad7337e1bdd59320d ******/
		%feature("compactdefaultargs") GetNearPickedPnt;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Valid only for point and rectangular selection. Returns projection of 2d mouse picked point or projection of center of 2d rectangle (for point and rectangular selection correspondingly) onto near view frustum plane.
") GetNearPickedPnt;
		gp_Pnt GetNearPickedPnt();

		/****** SelectMgr_SelectingVolumeManager::GetPlanes ******/
		/****** md5 signature: 5bfb83f99a2fa8a01ac50593ddf77697 ******/
		%feature("compactdefaultargs") GetPlanes;
		%feature("autodoc", "
Parameters
----------
thePlaneEquations: NCollection_DynamicArray<NCollection_Vec4<double>>

Return
-------
None

Description
-----------
Stores plane equation coefficients (in the following form: Ax + By + Cz + D = 0) to the given vector.
") GetPlanes;
		void GetPlanes(NCollection_DynamicArray<NCollection_Vec4<double>> & thePlaneEquations);

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
		/****** md5 signature: 232ece5329e68d4c353aa3a0cd3ddcb2 ******/
		%feature("compactdefaultargs") GetViewRayDirection;
		%feature("autodoc", "Return
-------
gp_Dir

Description
-----------
Valid only for point and rectangular selection. Returns view ray direction.
") GetViewRayDirection;
		gp_Dir GetViewRayDirection();

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
		/****** md5 signature: f755d32597af5e9cb4cd2648c6f52ec9 ******/
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
		/****** md5 signature: 22f1259ec610422bdbd16f5aa9ce686f ******/
		%feature("compactdefaultargs") IsOverlapAllowed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsOverlapAllowed;
		bool IsOverlapAllowed();

		/****** SelectMgr_SelectingVolumeManager::IsScalableActiveVolume ******/
		/****** md5 signature: 314a0b2c32c5d66db71369789edce046 ******/
		%feature("compactdefaultargs") IsScalableActiveVolume;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Checks if it is possible to scale current active selecting volume.
") IsScalableActiveVolume;
		bool IsScalableActiveVolume();

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
		/****** md5 signature: 9d0525c52d355591a9b568c55a77648a ******/
		%feature("compactdefaultargs") OverlapsBox;
		%feature("autodoc", "
Parameters
----------
theBoxMin: NCollection_Vec3<double>
theBoxMax: NCollection_Vec3<double>
thePickResult: SelectBasics_PickResult

Return
-------
bool

Description
-----------
SAT intersection test between defined volume and given axis-aligned box.
") OverlapsBox;
		bool OverlapsBox(const NCollection_Vec3<double> & theBoxMin, const NCollection_Vec3<double> & theBoxMax, SelectBasics_PickResult & thePickResult);

		/****** SelectMgr_SelectingVolumeManager::OverlapsBox ******/
		/****** md5 signature: 5b67b30efeac51e03f3450448b09caad ******/
		%feature("compactdefaultargs") OverlapsBox;
		%feature("autodoc", "
Parameters
----------
theBoxMin: NCollection_Vec3<double>
theBoxMax: NCollection_Vec3<double>
theInside: bool * (optional, default to nullptr)

Return
-------
bool

Description
-----------
Returns true if selecting volume is overlapped by axis-aligned bounding box with minimum corner at point theMinPt and maximum at point theMaxPt.
") OverlapsBox;
		bool OverlapsBox(const NCollection_Vec3<double> & theBoxMin, const NCollection_Vec3<double> & theBoxMax, bool * theInside = nullptr);

		/****** SelectMgr_SelectingVolumeManager::OverlapsCircle ******/
		/****** md5 signature: 9cc6440d0d0285c8ccfad002b9114ae3 ******/
		%feature("compactdefaultargs") OverlapsCircle;
		%feature("autodoc", "
Parameters
----------
theBottomRad: double
theTrsf: gp_Trsf
theIsFilled: bool
thePickResult: SelectBasics_PickResult

Return
-------
bool

Description
-----------
Returns true if selecting volume is overlapped by circle with radius theRadius, boolean theIsFilled and transformation to apply theTrsf. The position and orientation of the circle are specified via theTrsf transformation for gp::XOY() with center in gp::Origin().
") OverlapsCircle;
		bool OverlapsCircle(const double theBottomRad, const gp_Trsf & theTrsf, const bool theIsFilled, SelectBasics_PickResult & thePickResult);

		/****** SelectMgr_SelectingVolumeManager::OverlapsCircle ******/
		/****** md5 signature: c4987de440fcb843109b225348241749 ******/
		%feature("compactdefaultargs") OverlapsCircle;
		%feature("autodoc", "
Parameters
----------
theBottomRad: double
theTrsf: gp_Trsf
theIsFilled: bool
theInside: bool * (optional, default to nullptr)

Return
-------
bool

Description
-----------
Returns true if selecting volume is overlapped by circle with radius theRadius, boolean theIsFilled and transformation to apply theTrsf. The position and orientation of the circle are specified via theTrsf transformation for gp::XOY() with center in gp::Origin().
") OverlapsCircle;
		bool OverlapsCircle(const double theBottomRad, const gp_Trsf & theTrsf, const bool theIsFilled, bool * theInside = nullptr);

		/****** SelectMgr_SelectingVolumeManager::OverlapsCylinder ******/
		/****** md5 signature: ab68d47ebc5161815e697b376b950153 ******/
		%feature("compactdefaultargs") OverlapsCylinder;
		%feature("autodoc", "
Parameters
----------
theBottomRad: double
theTopRad: double
theHeight: double
theTrsf: gp_Trsf
theIsHollow: bool
thePickResult: SelectBasics_PickResult

Return
-------
bool

Description
-----------
Returns true if selecting volume is overlapped by cylinder (or cone) with radiuses theBottomRad and theTopRad, height theHeight and transformation to apply theTrsf.
") OverlapsCylinder;
		bool OverlapsCylinder(const double theBottomRad, const double theTopRad, const double theHeight, const gp_Trsf & theTrsf, const bool theIsHollow, SelectBasics_PickResult & thePickResult);

		/****** SelectMgr_SelectingVolumeManager::OverlapsCylinder ******/
		/****** md5 signature: 3a0cf391a62309adf4fd039dfd8c44cc ******/
		%feature("compactdefaultargs") OverlapsCylinder;
		%feature("autodoc", "
Parameters
----------
theBottomRad: double
theTopRad: double
theHeight: double
theTrsf: gp_Trsf
theIsHollow: bool
theInside: bool * (optional, default to nullptr)

Return
-------
bool

Description
-----------
Returns true if selecting volume is overlapped by cylinder (or cone) with radiuses theBottomRad and theTopRad, height theHeight and transformation to apply theTrsf.
") OverlapsCylinder;
		bool OverlapsCylinder(const double theBottomRad, const double theTopRad, const double theHeight, const gp_Trsf & theTrsf, const bool theIsHollow, bool * theInside = nullptr);

		/****** SelectMgr_SelectingVolumeManager::OverlapsPoint ******/
		/****** md5 signature: 1b8056b07dab16dfca240c2ec47f02c4 ******/
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
		bool OverlapsPoint(const gp_Pnt & thePnt, SelectBasics_PickResult & thePickResult);

		/****** SelectMgr_SelectingVolumeManager::OverlapsPoint ******/
		/****** md5 signature: 30729f6e4505f9092d160d85812a66f4 ******/
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
		bool OverlapsPoint(const gp_Pnt & thePnt);

		/****** SelectMgr_SelectingVolumeManager::OverlapsPolygon ******/
		/****** md5 signature: 8861d5d40cdd2306d8b8c4f0aedc85bc ******/
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
SAT intersection test between defined volume and given ordered set of points, representing line segments. The test may be considered of interior part or boundary line defined by segments depending on given sensitivity type.
") OverlapsPolygon;
		bool OverlapsPolygon(const TColgp_Array1OfPnt & theArrayOfPts, int theSensType, SelectBasics_PickResult & thePickResult);

		/****** SelectMgr_SelectingVolumeManager::OverlapsSegment ******/
		/****** md5 signature: b88508ccd7f14a7b4d1fd53099018d3f ******/
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
		bool OverlapsSegment(const gp_Pnt & thePnt1, const gp_Pnt & thePnt2, SelectBasics_PickResult & thePickResult);

		/****** SelectMgr_SelectingVolumeManager::OverlapsSphere ******/
		/****** md5 signature: 6cdac13d812815de1547308c86a24337 ******/
		%feature("compactdefaultargs") OverlapsSphere;
		%feature("autodoc", "
Parameters
----------
theCenter: gp_Pnt
theRadius: double
thePickResult: SelectBasics_PickResult

Return
-------
bool

Description
-----------
Intersection test between defined volume and given sphere.
") OverlapsSphere;
		bool OverlapsSphere(const gp_Pnt & theCenter, const double theRadius, SelectBasics_PickResult & thePickResult);

		/****** SelectMgr_SelectingVolumeManager::OverlapsSphere ******/
		/****** md5 signature: 7ade39630120d4203a19ff852f9eb4a1 ******/
		%feature("compactdefaultargs") OverlapsSphere;
		%feature("autodoc", "
Parameters
----------
theCenter: gp_Pnt
theRadius: double
theInside: bool * (optional, default to nullptr)

Return
-------
bool

Description
-----------
Intersection test between defined volume and given sphere.
") OverlapsSphere;
		bool OverlapsSphere(const gp_Pnt & theCenter, const double theRadius, bool * theInside = nullptr);

		/****** SelectMgr_SelectingVolumeManager::OverlapsTriangle ******/
		/****** md5 signature: 7eee83ecf03f6f7125002e4340c40d50 ******/
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
SAT intersection test between defined volume and given triangle. The test may be considered of interior part or boundary line defined by triangle vertices depending on given sensitivity type.
") OverlapsTriangle;
		bool OverlapsTriangle(const gp_Pnt & thePnt1, const gp_Pnt & thePnt2, const gp_Pnt & thePnt3, int theSensType, SelectBasics_PickResult & thePickResult);

		/****** SelectMgr_SelectingVolumeManager::ScaleAndTransform ******/
		/****** md5 signature: 9e795074aed64800b0cfa0e285928933 ******/
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
IMPORTANT: Scaling makes sense only for frustum built on a single point! Note that this method does not perform any checks on type of the frustum. //! Returns a copy of the frustum resized according to the scale factor given and transforms it using the matrix given. There are no default parameters, but in case if: - transformation only is needed: @theScaleFactor must be initialized as any negative value; - scale only is needed: @theTrsf must be set to gp_Identity. Builder is an optional argument that represents corresponding settings for re-constructing transformed frustum from scratch. Can be null if reconstruction is not expected furthermore.
") ScaleAndTransform;
		virtual SelectMgr_SelectingVolumeManager ScaleAndTransform(const int theScaleFactor, const gp_GTrsf & theTrsf, const opencascade::handle<SelectMgr_FrustumBuilder> & theBuilder);

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
Updates camera projection and orientation matrices in all selecting volumes Note: this method should be called after selection volume building else exception will be thrown.
") SetCamera;
		void SetCamera(const opencascade::handle<Graphic3d_Camera> & theCamera);

		/****** SelectMgr_SelectingVolumeManager::SetPixelTolerance ******/
		/****** md5 signature: 24210d7a6ede443c7b9b7e1465a29b37 ******/
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
Updates pixel tolerance in all selecting volumes Note: this method should be called after selection volume building else exception will be thrown.
") SetPixelTolerance;
		void SetPixelTolerance(const int theTolerance);

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
Valid for point selection only! Computes depth range for clipping planes. 
Input parameter: theViewPlanes global view planes 
Input parameter: theObjPlanes object planes 
Input parameter: theWorldSelMgr selection volume in world space for computing clipping plane ranges.
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
		/****** md5 signature: 6434315586423ecd16144dba46f5869b ******/
		%feature("compactdefaultargs") SetViewport;
		%feature("autodoc", "
Parameters
----------
theX: double
theY: double
theWidth: double
theHeight: double

Return
-------
None

Description
-----------
Updates viewport in all selecting volumes Note: this method should be called after selection volume building else exception will be thrown.
") SetViewport;
		void SetViewport(const double theX, const double theY, const double theWidth, const double theHeight);

		/****** SelectMgr_SelectingVolumeManager::SetWindowSize ******/
		/****** md5 signature: 893fec2368bfa674a6aeb725241927cf ******/
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
Updates window size in all selecting volumes Note: this method should be called after selection volume building else exception will be thrown.
") SetWindowSize;
		void SetWindowSize(const int theWidth, const int theHeight);

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
		/****** md5 signature: 99f8426008f1e97982312e7c169dd5b6 ******/
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
		/****** md5 signature: e799c84d0b3efec1ab5681a6c14f3dea ******/
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
Constructs a selection object defined by the selection mode IdMode. The default setting 0 is the selection mode for a shape in its entirety.
") SelectMgr_Selection;
		 SelectMgr_Selection(const int theModeIdx = 0);

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
Adds the sensitive primitive to the list of stored entities in this object. Raises NullObject if the primitive is a null handle.
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
		/****** md5 signature: 3efdb0b04ad44e3cd93b876ba03906f5 ******/
		%feature("compactdefaultargs") ChangeEntities;
		%feature("autodoc", "Return
-------
NCollection_DynamicArray<opencascade::handle<SelectMgr_SensitiveEntity>>

Description
-----------
Return entities.
") ChangeEntities;
		NCollection_DynamicArray<opencascade::handle<SelectMgr_SensitiveEntity>> & ChangeEntities();

		/****** SelectMgr_Selection::Clear ******/
		/****** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
empties the selection from all the stored entities.
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
		/****** md5 signature: 7449fce2abe99b6f771a1a875aa42c3c ******/
		%feature("compactdefaultargs") Entities;
		%feature("autodoc", "Return
-------
NCollection_DynamicArray<opencascade::handle<SelectMgr_SensitiveEntity>>

Description
-----------
Return entities.
") Entities;
		const NCollection_DynamicArray<opencascade::handle<SelectMgr_SensitiveEntity>> & Entities();

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
		/****** md5 signature: 70a41d5fe65955a28167088305fc6991 ******/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns true if no sensitive entity is stored.
") IsEmpty;
		bool IsEmpty();

		/****** SelectMgr_Selection::Mode ******/
		/****** md5 signature: 09d98ebbe6bcf8e23b5b0e49c47a4193 ******/
		%feature("compactdefaultargs") Mode;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the selection mode represented by this selection.
") Mode;
		int Mode();

		/****** SelectMgr_Selection::Sensitivity ******/
		/****** md5 signature: f9511b97108fb128eb71305a872019ba ******/
		%feature("compactdefaultargs") Sensitivity;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns sensitivity of the selection.
") Sensitivity;
		int Sensitivity();

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
		/****** md5 signature: edccbc0aaf78b83de286347758251d54 ******/
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
Changes sensitivity of the selection and all its entities to the given value. IMPORTANT: This method does not update any outer selection structures, so for proper updates use SelectMgr_SelectionManager::SetSelectionSensitivity method.
") SetSensitivity;
		void SetSensitivity(const int theNewSens);

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
Returns the flag UpdateFlag. This flag gives the update status of this framework in a ViewerSelector object: - full - partial, or - none.
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
		/****** md5 signature: 5faa5d2abf90aee3c83da10f44369e4e ******/
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
		virtual void Fill(const int theCol, const int theRow, const int thePicked);

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
		/****** md5 signature: 1498448a38dc406b6b56e3259a22ef49 ******/
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
Activates the selection mode theMode in the selector theSelector for the selectable object anObject. By default, theMode is equal to 0. If theSelector is set to default (NULL), the selection with the mode theMode will be activated in all the viewers available.
") Activate;
		void Activate(const opencascade::handle<SelectMgr_SelectableObject> & theObject, const int theMode = 0);

		/****** SelectMgr_SelectionManager::ClearSelectionStructures ******/
		/****** md5 signature: 38f10661498b9ca75057d780d9c3c08b ******/
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
Removes sensitive entities from all viewer selectors after method Clear() was called to the selection they belonged to or it was recomputed somehow.
") ClearSelectionStructures;
		void ClearSelectionStructures(const opencascade::handle<SelectMgr_SelectableObject> & theObj, const int theMode = -1);

		/****** SelectMgr_SelectionManager::Contains ******/
		/****** md5 signature: f74bb921121a90d333b23922af840f66 ******/
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
Returns true if the manager contains the selectable object theObject.
") Contains;
		bool Contains(const opencascade::handle<SelectMgr_SelectableObject> & theObject);

		/****** SelectMgr_SelectionManager::Deactivate ******/
		/****** md5 signature: 0f9ac49f33ce45e48caa790b400bb04f ******/
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
Deactivates mode theMode of theObject in theSelector. If theMode value is set to default (-1), all active selection modes will be deactivated. Likewise, if theSelector value is set to default (NULL), theMode will be deactivated in all viewer selectors.
") Deactivate;
		void Deactivate(const opencascade::handle<SelectMgr_SelectableObject> & theObject, const int theMode = -1);

		/****** SelectMgr_SelectionManager::IsActivated ******/
		/****** md5 signature: 8e4f2b571a4304b9517213bcfa77eb3f ******/
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
Returns true if the selection with theMode is active for the selectable object theObject and selector theSelector. If all parameters are set to default values, it returns it there is any active selection in any known viewer selector for object theObject.
") IsActivated;
		bool IsActivated(const opencascade::handle<SelectMgr_SelectableObject> & theObject, const int theMode = -1);

		/****** SelectMgr_SelectionManager::Load ******/
		/****** md5 signature: dea13f29369f17f96e9e5c106fa51356 ******/
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
Loads and computes selection mode theMode (if it is not equal to -1) in global context and adds selectable object to BVH tree. If the object theObject has an already calculated selection with mode theMode and it was removed, the selection will be recalculated.
") Load;
		void Load(const opencascade::handle<SelectMgr_SelectableObject> & theObject, const int theMode = -1);

		/****** SelectMgr_SelectionManager::RecomputeSelection ******/
		/****** md5 signature: 5addc7aa1a1a5701f6e8a6099896997f ******/
		%feature("compactdefaultargs") RecomputeSelection;
		%feature("autodoc", "
Parameters
----------
theObject: SelectMgr_SelectableObject
theIsForce: bool (optional, default to false)
theMode: int (optional, default to -1)

Return
-------
None

Description
-----------
Recomputes activated selections of theObject for all known viewer selectors according to theMode specified. If theMode is set to default (-1), then all activated selections will be recomputed. If theIsForce is set to true, then selection mode theMode for object theObject will be recomputed regardless of its activation status.
") RecomputeSelection;
		void RecomputeSelection(const opencascade::handle<SelectMgr_SelectableObject> & theObject, const bool theIsForce = false, const int theMode = -1);

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
Removes selectable object theObject from all viewer selectors it was added to previously, removes it from all contexts and clears all computed selections of theObject.
") Remove;
		void Remove(const opencascade::handle<SelectMgr_SelectableObject> & theObject);

		/****** SelectMgr_SelectionManager::RestoreSelectionStructures ******/
		/****** md5 signature: b5cdb29c174500c8ec43746990d6e60a ******/
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
Re-adds newly calculated sensitive entities of recomputed selection defined by mode theMode to all viewer selectors contained that selection.
") RestoreSelectionStructures;
		void RestoreSelectionStructures(const opencascade::handle<SelectMgr_SelectableObject> & theObj, const int theMode = -1);

		/****** SelectMgr_SelectionManager::Selector ******/
		/****** md5 signature: e8522c885bf82402a0d8d84a7ddb20d4 ******/
		%feature("compactdefaultargs") Selector;
		%feature("autodoc", "Return
-------
opencascade::handle<SelectMgr_ViewerSelector>

Description
-----------
Return the Selector.
") Selector;
		const opencascade::handle<SelectMgr_ViewerSelector> & Selector();

		/****** SelectMgr_SelectionManager::SetSelectionSensitivity ******/
		/****** md5 signature: 5e721c18aa5a88446bc7df3e7c1ad0fc ******/
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
Allows to manage sensitivity of a particular selection of interactive object theObject and changes previous sensitivity value of all sensitive entities in selection with theMode to the given theNewSensitivity.
") SetSelectionSensitivity;
		void SetSelectionSensitivity(const opencascade::handle<SelectMgr_SelectableObject> & theObject, const int theMode, const int theNewSens);

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
Sets type of update of all selections of theObject to the given theType.
") SetUpdateMode;
		void SetUpdateMode(const opencascade::handle<SelectMgr_SelectableObject> & theObject, const SelectMgr_TypeOfUpdate theType);

		/****** SelectMgr_SelectionManager::SetUpdateMode ******/
		/****** md5 signature: d4a6283fe4b6c17e07245b8b85e85070 ******/
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
Sets type of update of selection with theMode of theObject to the given theType.
") SetUpdateMode;
		void SetUpdateMode(const opencascade::handle<SelectMgr_SelectableObject> & theObject, const int theMode, const SelectMgr_TypeOfUpdate theType);

		/****** SelectMgr_SelectionManager::Update ******/
		/****** md5 signature: add7598b222e204a986030b9def934dd ******/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "
Parameters
----------
theObject: SelectMgr_SelectableObject
theIsForce: bool (optional, default to true)

Return
-------
None

Description
-----------
Updates all selections of theObject in all viewer selectors according to its current update status. If theIsForce is set to true, the call is equal to recomputation.
") Update;
		void Update(const opencascade::handle<SelectMgr_SelectableObject> & theObject, const bool theIsForce = true);

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
Re-adds selectable object in BVHs in all viewer selectors.
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
Creates new inactive for selection object with base entity theEntity.
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
Returns related instance of SelectBasics class.
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
		/****** md5 signature: 946d67adfa57b9f56fc2792cb7c40fa0 ******/
		%feature("compactdefaultargs") IsActiveForSelection;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if this entity belongs to the active selection mode of parent object.
") IsActiveForSelection;
		bool IsActiveForSelection();

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
Adds new entity to the set and marks BVH tree for rebuild.
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
Adds every entity of selection theSelection to the set and marks BVH tree for rebuild.
") Append;
		void Append(const opencascade::handle<SelectMgr_Selection> & theSelection);

		/****** SelectMgr_SensitiveEntitySet::Box ******/
		/****** md5 signature: de1109f1341fdbd23b9b340b83f4c66b ******/
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
Returns bounding box of entity with index theIdx.
") Box;
		Select3D_BndBox3d Box(const int theIndex);

		/****** SelectMgr_SensitiveEntitySet::Center ******/
		/****** md5 signature: e1de2d1f4b9b0e292d065694299e03dd ******/
		%feature("compactdefaultargs") Center;
		%feature("autodoc", "
Parameters
----------
theIndex: int
theAxis: int

Return
-------
double

Description
-----------
Returns geometry center of sensitive entity index theIdx along the given axis theAxis.
") Center;
		double Center(const int theIndex, const int theAxis);

		/****** SelectMgr_SensitiveEntitySet::GetSensitiveById ******/
		/****** md5 signature: d397d5250b4efd241e19fb5f6ec13bbe ******/
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
Returns the entity with index theIndex in the set.
") GetSensitiveById;
		const opencascade::handle<SelectMgr_SensitiveEntity> & GetSensitiveById(const int theIndex);

		/****** SelectMgr_SensitiveEntitySet::HasEntityWithFlipping ******/
		/****** md5 signature: c9962472cb2dcc714e664d49150f971e ******/
		%feature("compactdefaultargs") HasEntityWithFlipping;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if this set contains sensitive entities with flipping options.
") HasEntityWithFlipping;
		bool HasEntityWithFlipping();

		/****** SelectMgr_SensitiveEntitySet::HasEntityWithPersistence ******/
		/****** md5 signature: a6f2b916a10376f78a1771159a598d29 ******/
		%feature("compactdefaultargs") HasEntityWithPersistence;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns map of entities.
") HasEntityWithPersistence;
		bool HasEntityWithPersistence();

		/****** SelectMgr_SensitiveEntitySet::Owners ******/
		/****** md5 signature: a3cf4fc8a1eba2fad744cc7f4de2dcdd ******/
		%feature("compactdefaultargs") Owners;
		%feature("autodoc", "Return
-------
NCollection_DataMap<opencascade::handle<SelectMgr_EntityOwner>, int>

Description
-----------
Returns map of owners.
") Owners;
		const NCollection_DataMap<opencascade::handle<SelectMgr_EntityOwner>, int> & Owners();

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
Removes every entity of selection theSelection from the set and marks BVH tree for rebuild.
") Remove;
		void Remove(const opencascade::handle<SelectMgr_Selection> & theSelection);

		/****** SelectMgr_SensitiveEntitySet::Sensitives ******/
		/****** md5 signature: fd0385fed6214863cadcb96ed616c61e ******/
		%feature("compactdefaultargs") Sensitives;
		%feature("autodoc", "Return
-------
NCollection_IndexedMap<opencascade::handle<SelectMgr_SensitiveEntity>>

Description
-----------
Returns map of entities.
") Sensitives;
		const NCollection_IndexedMap<opencascade::handle<SelectMgr_SensitiveEntity>> & Sensitives();

		/****** SelectMgr_SensitiveEntitySet::Size ******/
		/****** md5 signature: 1813690848b6a5332bd4875ba3d8d381 ******/
		%feature("compactdefaultargs") Size;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the amount of entities.
") Size;
		int Size();

		/****** SelectMgr_SensitiveEntitySet::Swap ******/
		/****** md5 signature: 457a7645599fd5a96086a4098d4e94c5 ******/
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
Swaps items with indexes theIdx1 and theIdx2.
") Swap;
		void Swap(const int theIndex1, const int theIndex2);

};


%make_alias(SelectMgr_SensitiveEntitySet)

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
Compare with another item by depth, priority and minDist.
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
Compare with another item using old logic (OCCT version <= 6.3.1) with priority considered preceding depth.
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
		/****** md5 signature: 20cd389a61c38630374ed3933fda63da ******/
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
Adds the value given to map, checks if the current tolerance value should be replaced by theTolerance.
") Add;
		void Add(const int & theTolerance);

		/****** SelectMgr_ToleranceMap::CustomTolerance ******/
		/****** md5 signature: b2000e99e4d5ef758a60528991047f6e ******/
		%feature("compactdefaultargs") CustomTolerance;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the value of custom tolerance regardless of it validity.
") CustomTolerance;
		int CustomTolerance();

		/****** SelectMgr_ToleranceMap::Decrement ******/
		/****** md5 signature: b20bfffe499859d3334b2fdb1878f898 ******/
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
		void Decrement(const int & theTolerance);

		/****** SelectMgr_ToleranceMap::IsCustomTolSet ******/
		/****** md5 signature: 74ec33d2c9ff53ebc06b6865624347b0 ******/
		%feature("compactdefaultargs") IsCustomTolSet;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if custom tolerance value is greater than zero.
") IsCustomTolSet;
		bool IsCustomTolSet();

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
		/****** md5 signature: 87ee1ebe282f6b947d654adae397f209 ******/
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
		void SetCustomTolerance(const int theTolerance);

		/****** SelectMgr_ToleranceMap::Tolerance ******/
		/****** md5 signature: f20225d22ca03acb691b894ae2f82648 ******/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns a current tolerance that must be applied.
") Tolerance;
		int Tolerance();

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
Add clipping planes. Planes and picking ray should be defined in the same coordinate system.
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
		/****** md5 signature: fb04c4183d0e598a5d27532fff137b19 ******/
		%feature("compactdefaultargs") GetNearestDepth;
		%feature("autodoc", "
Parameters
----------
theRange: Bnd_Range

Return
-------
theDepth: double

Description
-----------
Calculates the min not clipped value from the range. Returns False if the whole range is clipped.
") GetNearestDepth;
		bool GetNearestDepth(const Bnd_Range & theRange, Standard_Real &OutValue);

		/****** SelectMgr_ViewClipRange::IsClipped ******/
		/****** md5 signature: 6416a97cb2aeae3a54b81ab227b8e059 ******/
		%feature("compactdefaultargs") IsClipped;
		%feature("autodoc", "
Parameters
----------
theDepth: double

Return
-------
bool

Description
-----------
Check if the given depth is not within clipping range(s), e.g. True means depth is clipped.
") IsClipped;
		bool IsClipped(const double theDepth);

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
		void ActiveOwners(NCollection_List<opencascade::handle<SelectMgr_EntityOwner>> & theOwners);

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
Adds new selection to the object and builds its BVH tree.
") AddSelectionToObject;
		void AddSelectionToObject(const opencascade::handle<SelectMgr_SelectableObject> & theObject, const opencascade::handle<SelectMgr_Selection> & theSelection);

		/****** SelectMgr_ViewerSelector::AllowOverlapDetection ******/
		/****** md5 signature: 85377d1abe1645083155c2709ee853d1 ******/
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
Is used for rectangular selection only If theIsToAllow is false, only fully included sensitives will be detected, otherwise the algorithm will mark both included and overlapped entities as matched.
") AllowOverlapDetection;
		void AllowOverlapDetection(const bool theIsToAllow);

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
		/****** md5 signature: f74bb921121a90d333b23922af840f66 ******/
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
		bool Contains(const opencascade::handle<SelectMgr_SelectableObject> & theObject);

		/****** SelectMgr_ViewerSelector::CustomPixelTolerance ******/
		/****** md5 signature: 5d37b3a4dbe4f3b71d2de455fd6ccbb0 ******/
		%feature("compactdefaultargs") CustomPixelTolerance;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns custom pixel tolerance value.
") CustomPixelTolerance;
		int CustomPixelTolerance();

		/****** SelectMgr_ViewerSelector::DepthTolerance ******/
		/****** md5 signature: 92b7fb6d8771d9cdcb07eb64670a936a ******/
		%feature("compactdefaultargs") DepthTolerance;
		%feature("autodoc", "Return
-------
double

Description
-----------
Return the tolerance for considering two entities having a similar depth (distance from eye to entity).
") DepthTolerance;
		double DepthTolerance();

		/****** SelectMgr_ViewerSelector::DepthToleranceType ******/
		/****** md5 signature: c380649fe7713e3a87bde2b284f953ae ******/
		%feature("compactdefaultargs") DepthToleranceType;
		%feature("autodoc", "Return
-------
SelectMgr_TypeOfDepthTolerance

Description
-----------
Return the type of tolerance for considering two entities having a similar depth (distance from eye to entity); SelectMgr_TypeOfDepthTolerance_SensitivityFactor by default.
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
Displays sensitives in view <theView>.
") DisplaySensitive;
		void DisplaySensitive(const opencascade::handle<V3d_View> & theView);

		/****** SelectMgr_ViewerSelector::DisplaySensitive ******/
		/****** md5 signature: 9124cbe972c0d7797baf567b296bae96 ******/
		%feature("compactdefaultargs") DisplaySensitive;
		%feature("autodoc", "
Parameters
----------
theSel: SelectMgr_Selection
theTrsf: gp_Trsf
theView: V3d_View
theToClearOthers: bool (optional, default to true)

Return
-------
None

Description
-----------
No available documentation.
") DisplaySensitive;
		void DisplaySensitive(const opencascade::handle<SelectMgr_Selection> & theSel, const gp_Trsf & theTrsf, const opencascade::handle<V3d_View> & theView, const bool theToClearOthers = true);


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
Returns the default builder used to construct BVH of entity set.
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
		/****** md5 signature: 8294816c51c59dc7e89ad1ac8db3413d ******/
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
Returns true if the selectable object aSelectableObject having the selection mode aMode is active in this selector.
") IsActive;
		bool IsActive(const opencascade::handle<SelectMgr_SelectableObject> & theSelectableObject, const int theMode);

		/****** SelectMgr_ViewerSelector::IsInside ******/
		/****** md5 signature: c5f3bce64bf698d000ce58d395257f6e ******/
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
Returns true if the selectable object aSelectableObject having the selection mode aMode is in this selector.
") IsInside;
		bool IsInside(const opencascade::handle<SelectMgr_SelectableObject> & theSelectableObject, const int theMode);

		/****** SelectMgr_ViewerSelector::Modes ******/
		/****** md5 signature: bdefa16da5561a4268c4cf2c2f210941 ******/
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
Returns the list of selection modes ModeList found in this selector for the selectable object aSelectableObject. Returns true if aSelectableObject is referenced inside this selector; returns false if the object is not present in this selector.
") Modes;
		bool Modes(const opencascade::handle<SelectMgr_SelectableObject> & theSelectableObject, TColStd_ListOfInteger & theModeList, const SelectMgr_StateOfSelection theWantedState = SelectMgr_SOS_Any);

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
		/****** md5 signature: baabf19ece3e5bc10d9f01718167005a ******/
		%feature("compactdefaultargs") NbPicked;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of detected owners.
") NbPicked;
		int NbPicked();

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
		/****** md5 signature: badb146bfc15baed4e5c42ace53fab9c ******/
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
Picks the sensitive entity at the pixel coordinates of the mouse <theXPix> and <theYPix>. The selector looks for touched areas and owners.
") Pick;
		void Pick(const int theXPix, const int theYPix, const opencascade::handle<V3d_View> & theView);

		/****** SelectMgr_ViewerSelector::Pick ******/
		/****** md5 signature: d52f109450c5659d71a535543214a4b0 ******/
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
Picks the sensitive entity according to the minimum and maximum pixel values <theXPMin>, <theYPMin>, <theXPMax> and <theYPMax> defining a 2D area for selection in the 3D view aView.
") Pick;
		void Pick(const int theXPMin, const int theYPMin, const int theXPMax, const int theYPMax, const opencascade::handle<V3d_View> & theView);

		/****** SelectMgr_ViewerSelector::Pick ******/
		/****** md5 signature: 94ab51e70a79b8d246889633452cbf97 ******/
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
pick action - input pixel values for polyline selection for selection.
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
Picks the sensitive entity according to the input axis. This is geometric intersection 3D objects by axis (camera parameters are ignored and objects with transform persistence are skipped).
") Pick;
		void Pick(const gp_Ax1 & theAxis, const opencascade::handle<V3d_View> & theView);

		/****** SelectMgr_ViewerSelector::Picked ******/
		/****** md5 signature: 40a802857475259c604c495ce1f898d3 ******/
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
Returns the entity Owner for the object picked at specified position. 
Parameter theRank rank of detected object within range 1...NbPicked().
") Picked;
		opencascade::handle<SelectMgr_EntityOwner> Picked(const int theRank);

		/****** SelectMgr_ViewerSelector::PickedData ******/
		/****** md5 signature: 845a92e27d664a89ed080258efae96d7 ******/
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
Returns the Entity for the object picked at specified position. 
Parameter theRank rank of detected object within range 1...NbPicked().
") PickedData;
		const SelectMgr_SortCriterion & PickedData(const int theRank);

		/****** SelectMgr_ViewerSelector::PickedEntity ******/
		/****** md5 signature: d34cc16de65372080fcafb73b1287453 ******/
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
Returns the Entity for the object picked at specified position. 
Parameter theRank rank of detected object within range 1...NbPicked().
") PickedEntity;
		const opencascade::handle<Select3D_SensitiveEntity> & PickedEntity(const int theRank);

		/****** SelectMgr_ViewerSelector::PickedPoint ******/
		/****** md5 signature: cf141401daa30babf112664217818d35 ******/
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
Returns the 3D point (intersection of picking axis with the object nearest to eye) for the object picked at specified position. 
Parameter theRank rank of detected object within range 1...NbPicked().
") PickedPoint;
		gp_Pnt PickedPoint(const int theRank);

		/****** SelectMgr_ViewerSelector::PixelTolerance ******/
		/****** md5 signature: fefa8c8184b5b45efc1afb9c81df2978 ******/
		%feature("compactdefaultargs") PixelTolerance;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the largest pixel tolerance.
") PixelTolerance;
		int PixelTolerance();

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
Queues a sensitive entity to build its BVH.
") QueueBVHBuild;
		void QueueBVHBuild(const opencascade::handle<Select3D_SensitiveEntity> & theEntity);

		/****** SelectMgr_ViewerSelector::RebuildObjectsTree ******/
		/****** md5 signature: ffd4cae938da44b9a9e5ca0dfc2fcf07 ******/
		%feature("compactdefaultargs") RebuildObjectsTree;
		%feature("autodoc", "
Parameters
----------
theIsForce: bool (optional, default to false)

Return
-------
None

Description
-----------
Marks BVH of selectable objects for rebuild. Parameter theIsForce set as true guarantees that 1st level BVH for the viewer selector will be rebuilt during this call.
") RebuildObjectsTree;
		void RebuildObjectsTree(const bool theIsForce = false);

		/****** SelectMgr_ViewerSelector::RebuildSensitivesTree ******/
		/****** md5 signature: 83dd4d2f0e30adb6daa53b5e940b792e ******/
		%feature("compactdefaultargs") RebuildSensitivesTree;
		%feature("autodoc", "
Parameters
----------
theObject: SelectMgr_SelectableObject
theIsForce: bool (optional, default to false)

Return
-------
None

Description
-----------
Marks BVH of sensitive entities of particular selectable object for rebuild. Parameter theIsForce set as true guarantees that 2nd level BVH for the object given will be rebuilt during this call.
") RebuildSensitivesTree;
		void RebuildSensitivesTree(const opencascade::handle<SelectMgr_SelectableObject> & theObject, const bool theIsForce = false);

		/****** SelectMgr_ViewerSelector::RemovePicked ******/
		/****** md5 signature: bb088b74c60ded34a6397255771a5760 ******/
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
		bool RemovePicked(const opencascade::handle<SelectMgr_SelectableObject> & theObject);

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
Removes selection of the object and marks its BVH tree for rebuild.
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
		/****** md5 signature: a9285da13fdc695443bc389daba3e44e ******/
		%feature("compactdefaultargs") Sensitivity;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the largest sensitivity of picking.
") Sensitivity;
		double Sensitivity();

		/****** SelectMgr_ViewerSelector::SetDepthTolerance ******/
		/****** md5 signature: e51696006960bb456ee964fc701bf28a ******/
		%feature("compactdefaultargs") SetDepthTolerance;
		%feature("autodoc", "
Parameters
----------
theType: SelectMgr_TypeOfDepthTolerance
theTolerance: double

Return
-------
None

Description
-----------
Set the tolerance for considering two entities having a similar depth (distance from eye to entity). 
Input parameter: theType type of tolerance value 
Input parameter: theTolerance tolerance value in 3D scale (SelectMgr_TypeOfDepthTolerance_Uniform)  or in pixels (SelectMgr_TypeOfDepthTolerance_UniformPixels);  value is ignored in case of  SelectMgr_TypeOfDepthTolerance_SensitivityFactor.
") SetDepthTolerance;
		void SetDepthTolerance(SelectMgr_TypeOfDepthTolerance theType, double theTolerance);

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
Sets the default builder used to construct BVH of entity set. The new builder will be also assigned for already defined objects, but computed BVH trees will not be invalidated.
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
		/****** md5 signature: 24210d7a6ede443c7b9b7e1465a29b37 ******/
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
Sets the pixel tolerance <theTolerance>.
") SetPixelTolerance;
		void SetPixelTolerance(const int theTolerance);

		/****** SelectMgr_ViewerSelector::SetToPrebuildBVH ******/
		/****** md5 signature: 3e1929f41d7f02ba197a79f5d0f5d4bb ******/
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
Enables/disables building BVH for sensitives in separate threads.
") SetToPrebuildBVH;
		void SetToPrebuildBVH(bool theToPrebuild, int theThreadsNum = -1);

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
Returns the selection status Status of the selection aSelection.
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
Return the flag determining precedence of picked depth (distance from eye to entity) over entity priority in sorted results; True by default. When flag is True, priority will be considered only if entities have the same depth within the tolerance. When flag is False, entities with higher priority will be in front regardless of their depth (like x-ray).
") ToPickClosest;
		bool ToPickClosest();

		/****** SelectMgr_ViewerSelector::ToPrebuildBVH ******/
		/****** md5 signature: fe0fea495342e737fd124df253660dc8 ******/
		%feature("compactdefaultargs") ToPrebuildBVH;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if building BVH for sensitives in separate threads is enabled.
") ToPrebuildBVH;
		bool ToPrebuildBVH();

		/****** SelectMgr_ViewerSelector::WaitForBVHBuild ******/
		/****** md5 signature: 7e92f221a918ae1b9444d5e68a00db6b ******/
		%feature("compactdefaultargs") WaitForBVHBuild;
		%feature("autodoc", "Return
-------
None

Description
-----------
Waits BVH threads finished building.
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
		/****** md5 signature: fcf4aae95b6abc01f406b4629b3faaf7 ******/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "Return
-------
None

Description
-----------
Builds axis according to internal parameters. NOTE: it should be called after Init() method.
") Build;
		void Build();

		/****** SelectMgr_AxisIntersector::CopyWithBuilder ******/
		/****** md5 signature: c7f565ebf750f1730685375930ed4421 ******/
		%feature("compactdefaultargs") CopyWithBuilder;
		%feature("autodoc", "
Parameters
----------
theBuilder: SelectMgr_FrustumBuilder

Return
-------
opencascade::handle<SelectMgr_BaseIntersector>

Description
-----------
Returns a copy of the intersector transformed using the builder configuration given. Builder is an argument that represents corresponding settings for re-constructing transformed frustum from scratch. In this class, builder is not used and theBuilder parameter is ignored.
") CopyWithBuilder;
		opencascade::handle<SelectMgr_BaseIntersector> CopyWithBuilder(const opencascade::handle<SelectMgr_FrustumBuilder> & theBuilder);

		/****** SelectMgr_AxisIntersector::DetectedPoint ******/
		/****** md5 signature: fbd4a38baa50c48a3265b6e2806e3d68 ******/
		%feature("compactdefaultargs") DetectedPoint;
		%feature("autodoc", "
Parameters
----------
theDepth: double

Return
-------
gp_Pnt

Description
-----------
Calculates the point on a axis ray that was detected during the run of selection algo by given depth.
") DetectedPoint;
		gp_Pnt DetectedPoint(const double theDepth);

		/****** SelectMgr_AxisIntersector::DistToGeometryCenter ******/
		/****** md5 signature: 221e331c0c6bbab729e487478612b76f ******/
		%feature("compactdefaultargs") DistToGeometryCenter;
		%feature("autodoc", "
Parameters
----------
theCOG: gp_Pnt

Return
-------
double

Description
-----------
Measures distance between start axis point and given point theCOG.
") DistToGeometryCenter;
		double DistToGeometryCenter(const gp_Pnt & theCOG);


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
		/****** md5 signature: 3bf936b6a169d9fb9cb721536935b9a3 ******/
		%feature("compactdefaultargs") GetFarPnt;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Returns far point along axis (infinite).
") GetFarPnt;
		const gp_Pnt GetFarPnt();

		/****** SelectMgr_AxisIntersector::GetNearPnt ******/
		/****** md5 signature: 37634fe2d24c1472359d4da96fe554ab ******/
		%feature("compactdefaultargs") GetNearPnt;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Returns near point along axis.
") GetNearPnt;
		const gp_Pnt GetNearPnt();

		/****** SelectMgr_AxisIntersector::GetViewRayDirection ******/
		/****** md5 signature: 0c32d9592b75756a646d1f330933f006 ******/
		%feature("compactdefaultargs") GetViewRayDirection;
		%feature("autodoc", "Return
-------
gp_Dir

Description
-----------
Returns axis direction.
") GetViewRayDirection;
		const gp_Dir GetViewRayDirection();

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
		/****** md5 signature: a7ba7a5505e27f4fe0c57ded1ee180b4 ******/
		%feature("compactdefaultargs") IsScalable;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns False (not applicable to this volume).
") IsScalable;
		bool IsScalable();

		/****** SelectMgr_AxisIntersector::OverlapsBox ******/
		/****** md5 signature: 984b1887f96cb6370dc03b0dc1344afd ******/
		%feature("compactdefaultargs") OverlapsBox;
		%feature("autodoc", "
Parameters
----------
theBoxMin: NCollection_Vec3<double>
theBoxMax: NCollection_Vec3<double>
theClipRange: SelectMgr_ViewClipRange
thePickResult: SelectBasics_PickResult

Return
-------
bool

Description
-----------
Intersection test between defined axis and given axis-aligned box.
") OverlapsBox;
		bool OverlapsBox(const NCollection_Vec3<double> & theBoxMin, const NCollection_Vec3<double> & theBoxMax, const SelectMgr_ViewClipRange & theClipRange, SelectBasics_PickResult & thePickResult);

		/****** SelectMgr_AxisIntersector::OverlapsBox ******/
		/****** md5 signature: 2fe62ad9b0db456d60e0ff4220384634 ******/
		%feature("compactdefaultargs") OverlapsBox;
		%feature("autodoc", "
Parameters
----------
theBoxMin: NCollection_Vec3<double>
theBoxMax: NCollection_Vec3<double>
theInside: bool *

Return
-------
bool

Description
-----------
Returns true if selecting axis intersects axis-aligned bounding box with minimum corner at point theMinPt and maximum at point theMaxPt.
") OverlapsBox;
		bool OverlapsBox(const NCollection_Vec3<double> & theBoxMin, const NCollection_Vec3<double> & theBoxMax, bool * theInside);

		/****** SelectMgr_AxisIntersector::OverlapsCircle ******/
		/****** md5 signature: eb68811d4d6812350fe1d68a4171f0dd ******/
		%feature("compactdefaultargs") OverlapsCircle;
		%feature("autodoc", "
Parameters
----------
theRadius: double
theTrsf: gp_Trsf
theIsFilled: bool
theClipRange: SelectMgr_ViewClipRange
thePickResult: SelectBasics_PickResult

Return
-------
bool

Description
-----------
Returns true if selecting volume is overlapped by circle with radius theRadius, boolean theIsFilled and transformation to apply theTrsf. The position and orientation of the circle are specified via theTrsf transformation for gp::XOY() with center in gp::Origin().
") OverlapsCircle;
		bool OverlapsCircle(const double theRadius, const gp_Trsf & theTrsf, const bool theIsFilled, const SelectMgr_ViewClipRange & theClipRange, SelectBasics_PickResult & thePickResult);

		/****** SelectMgr_AxisIntersector::OverlapsCircle ******/
		/****** md5 signature: ea6ef3204061fab4e01a11653a700594 ******/
		%feature("compactdefaultargs") OverlapsCircle;
		%feature("autodoc", "
Parameters
----------
theRadius: double
theTrsf: gp_Trsf
theIsFilled: bool
theInside: bool * (optional, default to nullptr)

Return
-------
bool

Description
-----------
Returns true if selecting volume is overlapped by circle with radius theRadius, boolean theIsFilled and transformation to apply theTrsf. The position and orientation of the circle are specified via theTrsf transformation for gp::XOY() with center in gp::Origin().
") OverlapsCircle;
		bool OverlapsCircle(const double theRadius, const gp_Trsf & theTrsf, const bool theIsFilled, bool * theInside = nullptr);

		/****** SelectMgr_AxisIntersector::OverlapsCylinder ******/
		/****** md5 signature: dd5aa6149020b3feab759e87b85b81a1 ******/
		%feature("compactdefaultargs") OverlapsCylinder;
		%feature("autodoc", "
Parameters
----------
theBottomRad: double
theTopRad: double
theHeight: double
theTrsf: gp_Trsf
theIsHollow: bool
theClipRange: SelectMgr_ViewClipRange
thePickResult: SelectBasics_PickResult

Return
-------
bool

Description
-----------
Returns true if selecting volume is overlapped by cylinder (or cone) with radiuses theBottomRad and theTopRad, height theHeight and transformation to apply theTrsf.
") OverlapsCylinder;
		bool OverlapsCylinder(const double theBottomRad, const double theTopRad, const double theHeight, const gp_Trsf & theTrsf, const bool theIsHollow, const SelectMgr_ViewClipRange & theClipRange, SelectBasics_PickResult & thePickResult);

		/****** SelectMgr_AxisIntersector::OverlapsCylinder ******/
		/****** md5 signature: 3a0cf391a62309adf4fd039dfd8c44cc ******/
		%feature("compactdefaultargs") OverlapsCylinder;
		%feature("autodoc", "
Parameters
----------
theBottomRad: double
theTopRad: double
theHeight: double
theTrsf: gp_Trsf
theIsHollow: bool
theInside: bool * (optional, default to nullptr)

Return
-------
bool

Description
-----------
Returns true if selecting volume is overlapped by cylinder (or cone) with radiuses theBottomRad and theTopRad, height theHeight and transformation to apply theTrsf.
") OverlapsCylinder;
		bool OverlapsCylinder(const double theBottomRad, const double theTopRad, const double theHeight, const gp_Trsf & theTrsf, const bool theIsHollow, bool * theInside = nullptr);

		/****** SelectMgr_AxisIntersector::OverlapsPoint ******/
		/****** md5 signature: 5b1dd09ae52dc32981f375d5d8b852f9 ******/
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
		bool OverlapsPoint(const gp_Pnt & thePnt, const SelectMgr_ViewClipRange & theClipRange, SelectBasics_PickResult & thePickResult);

		/****** SelectMgr_AxisIntersector::OverlapsPoint ******/
		/****** md5 signature: 30729f6e4505f9092d160d85812a66f4 ******/
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
		bool OverlapsPoint(const gp_Pnt & thePnt);

		/****** SelectMgr_AxisIntersector::OverlapsPolygon ******/
		/****** md5 signature: 1b84944994793f8ce2f616ccbbd40bac ******/
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
Intersection test between defined axis and given ordered set of points, representing line segments. The test may be considered of interior part or boundary line defined by segments depending on given sensitivity type.
") OverlapsPolygon;
		bool OverlapsPolygon(const TColgp_Array1OfPnt & theArrayOfPnts, Select3D_TypeOfSensitivity theSensType, const SelectMgr_ViewClipRange & theClipRange, SelectBasics_PickResult & thePickResult);

		/****** SelectMgr_AxisIntersector::OverlapsSegment ******/
		/****** md5 signature: ad35693cd8297629b1a178a0f167ba75 ******/
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
		bool OverlapsSegment(const gp_Pnt & thePnt1, const gp_Pnt & thePnt2, const SelectMgr_ViewClipRange & theClipRange, SelectBasics_PickResult & thePickResult);

		/****** SelectMgr_AxisIntersector::OverlapsSphere ******/
		/****** md5 signature: 7ade39630120d4203a19ff852f9eb4a1 ******/
		%feature("compactdefaultargs") OverlapsSphere;
		%feature("autodoc", "
Parameters
----------
theCenter: gp_Pnt
theRadius: double
theInside: bool * (optional, default to nullptr)

Return
-------
bool

Description
-----------
Intersection test between defined axis and given sphere with center theCenter and radius theRadius.
") OverlapsSphere;
		bool OverlapsSphere(const gp_Pnt & theCenter, const double theRadius, bool * theInside = nullptr);

		/****** SelectMgr_AxisIntersector::OverlapsSphere ******/
		/****** md5 signature: f0ccab89c48d2e4f362eaf355526f421 ******/
		%feature("compactdefaultargs") OverlapsSphere;
		%feature("autodoc", "
Parameters
----------
theCenter: gp_Pnt
theRadius: double
theClipRange: SelectMgr_ViewClipRange
thePickResult: SelectBasics_PickResult

Return
-------
bool

Description
-----------
Intersection test between defined axis and given sphere with center theCenter and radius theRadius.
") OverlapsSphere;
		bool OverlapsSphere(const gp_Pnt & theCenter, const double theRadius, const SelectMgr_ViewClipRange & theClipRange, SelectBasics_PickResult & thePickResult);

		/****** SelectMgr_AxisIntersector::OverlapsTriangle ******/
		/****** md5 signature: 07e304ccfce5db66fdcf5735a079dde0 ******/
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
Intersection test between defined axis and given triangle. The test may be considered of interior part or boundary line defined by triangle vertices depending on given sensitivity type.
") OverlapsTriangle;
		bool OverlapsTriangle(const gp_Pnt & thePnt1, const gp_Pnt & thePnt2, const gp_Pnt & thePnt3, Select3D_TypeOfSensitivity theSensType, const SelectMgr_ViewClipRange & theClipRange, SelectBasics_PickResult & thePickResult);

		/****** SelectMgr_AxisIntersector::ScaleAndTransform ******/
		/****** md5 signature: d350c21d3cf2947a0dd9fc00cbf2f6d4 ******/
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
IMPORTANT: Scaling doesn't make sense for this intersector. Returns a copy of the intersector transformed using the matrix given. Builder is an optional argument that represents corresponding settings for re-constructing transformed frustum from scratch. Can be null if reconstruction is not expected furthermore.
") ScaleAndTransform;
		opencascade::handle<SelectMgr_BaseIntersector> ScaleAndTransform(const int theScaleFactor, const gp_GTrsf & theTrsf, const opencascade::handle<SelectMgr_FrustumBuilder> & theBuilder);

		/****** SelectMgr_AxisIntersector::SetCamera ******/
		/****** md5 signature: 01a793d116415141b3a74d9a661eb903 ******/
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
Saves camera definition. Do nothing for axis intersector (not applicable to this volume).
") SetCamera;
		void SetCamera(const opencascade::handle<Graphic3d_Camera> & theCamera);

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
		/****** md5 signature: ea42840da214bed2757ebf1ec413bad9 ******/
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
		bool ActsOn(const TopAbs_ShapeEnum aStandardMode);

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
		/****** md5 signature: 03c43b1186186edcd7d757f16ac1f505 ******/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if this framework is empty.
") IsEmpty;
		bool IsEmpty();

		/****** SelectMgr_CompositionFilter::IsIn ******/
		/****** md5 signature: c6dbe0db75b67507ba3ba95fdec58ecb ******/
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
Returns true if the filter aFilter is in this framework.
") IsIn;
		bool IsIn(const opencascade::handle<SelectMgr_Filter> & aFilter);

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
Removes the filter aFilter from this framework.
") Remove;
		void Remove(const opencascade::handle<SelectMgr_Filter> & aFilter);

		/****** SelectMgr_CompositionFilter::StoredFilters ******/
		/****** md5 signature: 5332af65b6ffd8b0c56e27c85fa447e0 ******/
		%feature("compactdefaultargs") StoredFilters;
		%feature("autodoc", "Return
-------
NCollection_List<opencascade::handle<SelectMgr_Filter>>

Description
-----------
Returns the list of stored filters from this framework.
") StoredFilters;
		const NCollection_List<opencascade::handle<SelectMgr_Filter>> & StoredFilters();

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
		/****** md5 signature: eeea6f6b4b7492f5eeac7be277a67559 ******/
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
		bool IsOk(const opencascade::handle<SelectMgr_EntityOwner> & anobj);

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
Return: a selection filter type (
See also: SelectMgr_FilterType).
") FilterType;
		SelectMgr_FilterType FilterType();

		/****** SelectMgr_AndOrFilter::IsOk ******/
		/****** md5 signature: a9cb7f28765d6e66cb0c11aebd2a168e ******/
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
Indicates that the selected Interactive Object passes the filter.
") IsOk;
		bool IsOk(const opencascade::handle<SelectMgr_EntityOwner> & theObj);

		/****** SelectMgr_AndOrFilter::SetDisabledObjects ******/
		/****** md5 signature: c910bebcb325cd015ac310b439cf37a9 ******/
		%feature("compactdefaultargs") SetDisabledObjects;
		%feature("autodoc", "
Parameters
----------
theObjects: NCollection_Shared<NCollection_Map< Standard_Transient *

Return
-------
None

Description
-----------
Disable selection of specified objects.
") SetDisabledObjects;
		void SetDisabledObjects(const opencascade::handle<NCollection_Shared<NCollection_Map<const Standard_Transient *>> > & theObjects);

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
Sets a selection filter type. SelectMgr_FilterType_OR selection filter is used be default. 
Parameter theFilterType the filter type.
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
		/****** md5 signature: eeea6f6b4b7492f5eeac7be277a67559 ******/
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
		bool IsOk(const opencascade::handle<SelectMgr_EntityOwner> & anobj);

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
}
/* deprecated methods */
%pythoncode {
@deprecated
def selectmgr_ComputeSensitivePrs(*args):
	return selectmgr.ComputeSensitivePrs(*args)

}
