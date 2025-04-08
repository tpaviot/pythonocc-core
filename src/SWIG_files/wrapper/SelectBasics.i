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
%define SELECTBASICSDOCSTRING
"SelectBasics module, see official documentation at
https://dev.opencascade.org/doc/occt-7.8.0/refman/html/package_selectbasics.html"
%enddef
%module (package="OCC.Core", docstring=SELECTBASICSDOCSTRING) SelectBasics


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
#include<SelectBasics_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<gp_module.hxx>
#include<TColgp_module.hxx>
#include<Bnd_module.hxx>
#include<Geom_module.hxx>
#include<Select3D_module.hxx>
#include<Graphic3d_module.hxx>
#include<Aspect_module.hxx>
#include<Quantity_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import gp.i
%import TColgp.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {
};
/* end python proxy for enums */

/* handles */
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/*********************
* class SelectBasics *
*********************/
%rename(selectbasics) SelectBasics;
class SelectBasics {
	public:
		/****** SelectBasics::MaxOwnerPriority ******/
		/****** md5 signature: 87c4c8fbae09e9b90b74aa582df2924a ******/
		%feature("compactdefaultargs") MaxOwnerPriority;
		%feature("autodoc", "Return
-------
int

Description
-----------
Structure to provide all-in-one result of selection of sensitive for 'Matches' method of Select3D_SensitiveEntity.
") MaxOwnerPriority;
		static Standard_Integer MaxOwnerPriority();

		/****** SelectBasics::MinOwnerPriority ******/
		/****** md5 signature: d127234fdcddfbfba2493b87cb50a82b ******/
		%feature("compactdefaultargs") MinOwnerPriority;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") MinOwnerPriority;
		static Standard_Integer MinOwnerPriority();

};


%extend SelectBasics {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class SelectBasics_PickResult *
********************************/
class SelectBasics_PickResult {
	public:
		/****** SelectBasics_PickResult::SelectBasics_PickResult ******/
		/****** md5 signature: 70c24972c2e1acb414eec1dcb85de08a ******/
		%feature("compactdefaultargs") SelectBasics_PickResult;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor defining an invalid result.
") SelectBasics_PickResult;
		 SelectBasics_PickResult();

		/****** SelectBasics_PickResult::SelectBasics_PickResult ******/
		/****** md5 signature: efe0549d557fe14d14d3bce83544927e ******/
		%feature("compactdefaultargs") SelectBasics_PickResult;
		%feature("autodoc", "
Parameters
----------
theDepth: float
theDistToCenter: float
theObjPickedPnt: gp_Pnt

Return
-------
None

Description
-----------
Constructor with initialization.
") SelectBasics_PickResult;
		 SelectBasics_PickResult(Standard_Real theDepth, Standard_Real theDistToCenter, const gp_Pnt & theObjPickedPnt);

		/****** SelectBasics_PickResult::Depth ******/
		/****** md5 signature: 25ee6373f55a52708b56125539b46226 ******/
		%feature("compactdefaultargs") Depth;
		%feature("autodoc", "Return
-------
float

Description
-----------
Return depth along picking ray.
") Depth;
		Standard_Real Depth();

		/****** SelectBasics_PickResult::DistToGeomCenter ******/
		/****** md5 signature: 07d82d88f16b57d130cf7123362c8d01 ******/
		%feature("compactdefaultargs") DistToGeomCenter;
		%feature("autodoc", "Return
-------
float

Description
-----------
Return distance to geometry center (auxiliary value for comparing results).
") DistToGeomCenter;
		Standard_Real DistToGeomCenter();

		/****** SelectBasics_PickResult::HasPickedPoint ******/
		/****** md5 signature: 621f45af5c1eb7c5e15872d0374f6b99 ******/
		%feature("compactdefaultargs") HasPickedPoint;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return True if Picked Point lying on detected entity was set.
") HasPickedPoint;
		Standard_Boolean HasPickedPoint();

		/****** SelectBasics_PickResult::Invalidate ******/
		/****** md5 signature: 704a551b2c709fd4c2d751a8cf3ee8ff ******/
		%feature("compactdefaultargs") Invalidate;
		%feature("autodoc", "Return
-------
None

Description
-----------
Reset depth value.
") Invalidate;
		void Invalidate();

		/****** SelectBasics_PickResult::IsValid ******/
		/****** md5 signature: 7d115ff85bb657b98ab8790006673845 ******/
		%feature("compactdefaultargs") IsValid;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return True if result was been defined.
") IsValid;
		Standard_Boolean IsValid();

		/****** SelectBasics_PickResult::Min ******/
		/****** md5 signature: 6422e8d9851b1c76234f967288b153a4 ******/
		%feature("compactdefaultargs") Min;
		%feature("autodoc", "
Parameters
----------
thePickResult1: SelectBasics_PickResult
thePickResult2: SelectBasics_PickResult

Return
-------
SelectBasics_PickResult

Description
-----------
Return closest result between two Pick Results according to Depth value.
") Min;
		static const SelectBasics_PickResult & Min(const SelectBasics_PickResult & thePickResult1, const SelectBasics_PickResult & thePickResult2);

		/****** SelectBasics_PickResult::PickedPoint ******/
		/****** md5 signature: e5411db2d7bfcda96402fde38f143185 ******/
		%feature("compactdefaultargs") PickedPoint;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Return picked point lying on detected entity. WARNING! Point is defined in local coordinate system and should be translated into World System before usage!.
") PickedPoint;
		const gp_Pnt PickedPoint();

		/****** SelectBasics_PickResult::SetDepth ******/
		/****** md5 signature: 20b371790974ee9cc48c83264842232b ******/
		%feature("compactdefaultargs") SetDepth;
		%feature("autodoc", "
Parameters
----------
theDepth: float

Return
-------
None

Description
-----------
Set depth along picking ray.
") SetDepth;
		void SetDepth(Standard_Real theDepth);

		/****** SelectBasics_PickResult::SetDistToGeomCenter ******/
		/****** md5 signature: 83a88150dabab87b04c89a6695a6f142 ******/
		%feature("compactdefaultargs") SetDistToGeomCenter;
		%feature("autodoc", "
Parameters
----------
theDistToCenter: float

Return
-------
None

Description
-----------
Set distance to geometry center.
") SetDistToGeomCenter;
		void SetDistToGeomCenter(Standard_Real theDistToCenter);

		/****** SelectBasics_PickResult::SetPickedPoint ******/
		/****** md5 signature: a0d31924196d7102372ca1122f6e29a4 ******/
		%feature("compactdefaultargs") SetPickedPoint;
		%feature("autodoc", "
Parameters
----------
theObjPickedPnt: gp_Pnt

Return
-------
None

Description
-----------
Set picked point.
") SetPickedPoint;
		void SetPickedPoint(const gp_Pnt & theObjPickedPnt);

		/****** SelectBasics_PickResult::SetSurfaceNormal ******/
		/****** md5 signature: 43b093289dee163937e2e1c9a5f571fe ******/
		%feature("compactdefaultargs") SetSurfaceNormal;
		%feature("autodoc", "
Parameters
----------
theNormal: NCollection_Vec3<float>

Return
-------
None

Description
-----------
Set surface normal at picked point.
") SetSurfaceNormal;
		void SetSurfaceNormal(const NCollection_Vec3<float> & theNormal);

		/****** SelectBasics_PickResult::SetSurfaceNormal ******/
		/****** md5 signature: af0bec65600d14cfebb8a4739418cb17 ******/
		%feature("compactdefaultargs") SetSurfaceNormal;
		%feature("autodoc", "
Parameters
----------
theNormal: gp_Vec

Return
-------
None

Description
-----------
Set surface normal at picked point.
") SetSurfaceNormal;
		void SetSurfaceNormal(const gp_Vec & theNormal);

		/****** SelectBasics_PickResult::SurfaceNormal ******/
		/****** md5 signature: 2a41a55d2fef560c0c85bc0c696120ab ******/
		%feature("compactdefaultargs") SurfaceNormal;
		%feature("autodoc", "Return
-------
NCollection_Vec3<float>

Description
-----------
Return (unnormalized) surface normal at picked point or zero vector if undefined. WARNING! Normal is defined in local coordinate system and should be translated into World System before usage!.
") SurfaceNormal;
		const NCollection_Vec3<float> & SurfaceNormal();

};


%extend SelectBasics_PickResult {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************************
* class SelectBasics_SelectingVolumeManager *
********************************************/
%nodefaultctor SelectBasics_SelectingVolumeManager;
class SelectBasics_SelectingVolumeManager {
	public:
		/****** SelectBasics_SelectingVolumeManager::DetectedPoint ******/
		/****** md5 signature: 1cc054e8948b7dd95fff0b23ad64230e ******/
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
Return 3D point corresponding to specified depth within picking ray.
") DetectedPoint;
		virtual gp_Pnt DetectedPoint(const Standard_Real theDepth);

		/****** SelectBasics_SelectingVolumeManager::DistToGeometryCenter ******/
		/****** md5 signature: 3ed12881a75ce1f126dcb222173a8123 ******/
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
Calculates distance from 3d projection of user-defined selection point to the given point theCOG.
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
		/****** SelectBasics_SelectingVolumeManager::GetActiveSelectionType ******/
		/****** md5 signature: 56d78b21d70ce91662f965e54361b877 ******/
		%feature("compactdefaultargs") GetActiveSelectionType;
		%feature("autodoc", "Return
-------
int

Description
-----------
Return selection type.
") GetActiveSelectionType;
		virtual Standard_Integer GetActiveSelectionType();

		/****** SelectBasics_SelectingVolumeManager::GetFarPickedPnt ******/
		/****** md5 signature: 98748d26ff588dc3070493ca523b8947 ******/
		%feature("compactdefaultargs") GetFarPickedPnt;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Valid only for point and rectangular selection. Returns projection of 2d mouse picked point or projection of center of 2d rectangle (for point and rectangular selection correspondingly) onto far view frustum plane.
") GetFarPickedPnt;
		virtual gp_Pnt GetFarPickedPnt();

		/****** SelectBasics_SelectingVolumeManager::GetMousePosition ******/
		/****** md5 signature: dc663ddc1edfd7aac3a43a6122139863 ******/
		%feature("compactdefaultargs") GetMousePosition;
		%feature("autodoc", "Return
-------
gp_Pnt2d

Description
-----------
Returns mouse coordinates for Point selection mode. 
Return: infinite point in case of unsupport of mouse position for this active selection volume.
") GetMousePosition;
		virtual gp_Pnt2d GetMousePosition();

		/****** SelectBasics_SelectingVolumeManager::GetNearPickedPnt ******/
		/****** md5 signature: 40f25cf5811df8ab5573eff7cb14f3a1 ******/
		%feature("compactdefaultargs") GetNearPickedPnt;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Valid only for point and rectangular selection. Returns projection of 2d mouse picked point or projection of center of 2d rectangle (for point and rectangular selection correspondingly) onto near view frustum plane.
") GetNearPickedPnt;
		virtual gp_Pnt GetNearPickedPnt();

		/****** SelectBasics_SelectingVolumeManager::GetPlanes ******/
		/****** md5 signature: d44b074df2b940111bb3147c05251a88 ******/
		%feature("compactdefaultargs") GetPlanes;
		%feature("autodoc", "
Parameters
----------
thePlaneEquations: NCollection_Vector<NCollection_Vec4<float> >

Return
-------
None

Description
-----------
Stores plane equation coefficients (in the following form: Ax + By + Cz + D = 0) to the given vector.
") GetPlanes;
		virtual void GetPlanes(NCollection_Vector<NCollection_Vec4<Standard_Real> > & thePlaneEquations);

		/****** SelectBasics_SelectingVolumeManager::GetViewRayDirection ******/
		/****** md5 signature: 0c7768eea029564c9cfc1831463172ef ******/
		%feature("compactdefaultargs") GetViewRayDirection;
		%feature("autodoc", "Return
-------
gp_Dir

Description
-----------
Valid only for point and rectangular selection. Returns view ray direction.
") GetViewRayDirection;
		virtual gp_Dir GetViewRayDirection();

		/****** SelectBasics_SelectingVolumeManager::IsOverlapAllowed ******/
		/****** md5 signature: f2e1ce20431c82909b70df801eabd2d8 ******/
		%feature("compactdefaultargs") IsOverlapAllowed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns flag indicating if partial overlapping of entities is allowed or should be rejected.
") IsOverlapAllowed;
		virtual Standard_Boolean IsOverlapAllowed();

		/****** SelectBasics_SelectingVolumeManager::IsScalableActiveVolume ******/
		/****** md5 signature: c27f91fde12737acec5b9ec7447775f2 ******/
		%feature("compactdefaultargs") IsScalableActiveVolume;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Checks if it is possible to scale current active selecting volume.
") IsScalableActiveVolume;
		virtual Standard_Boolean IsScalableActiveVolume();

		/****** SelectBasics_SelectingVolumeManager::Overlaps ******/
		/****** md5 signature: d747c1f315399efa5510406d844e66b8 ******/
		%feature("compactdefaultargs") Overlaps;
		%feature("autodoc", "
Parameters
----------
theBoxMin: NCollection_Vec3<float>
theBoxMax: NCollection_Vec3<float>
thePickResult: SelectBasics_PickResult

Return
-------
bool

Description
-----------
No available documentation.
") Overlaps;
		Standard_Boolean Overlaps(const NCollection_Vec3<Standard_Real> & theBoxMin, const NCollection_Vec3<Standard_Real> & theBoxMax, SelectBasics_PickResult & thePickResult);

		/****** SelectBasics_SelectingVolumeManager::Overlaps ******/
		/****** md5 signature: ad02c57aff478dbb9ccd37f6b975d8db ******/
		%feature("compactdefaultargs") Overlaps;
		%feature("autodoc", "
Parameters
----------
theBoxMin: NCollection_Vec3<float>
theBoxMax: NCollection_Vec3<float>
theInside: bool * (optional, default to NULL)

Return
-------
bool

Description
-----------
No available documentation.
") Overlaps;
		Standard_Boolean Overlaps(const NCollection_Vec3<Standard_Real> & theBoxMin, const NCollection_Vec3<Standard_Real> & theBoxMax, Standard_Boolean * theInside = NULL);

		/****** SelectBasics_SelectingVolumeManager::Overlaps ******/
		/****** md5 signature: 3a4578f15989fa698334fa48608734d7 ******/
		%feature("compactdefaultargs") Overlaps;
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
No available documentation.
") Overlaps;
		Standard_Boolean Overlaps(const gp_Pnt & thePnt, SelectBasics_PickResult & thePickResult);

		/****** SelectBasics_SelectingVolumeManager::Overlaps ******/
		/****** md5 signature: 2c48ffca243441d5070db20896ed9bb7 ******/
		%feature("compactdefaultargs") Overlaps;
		%feature("autodoc", "
Parameters
----------
thePnt: gp_Pnt

Return
-------
bool

Description
-----------
No available documentation.
") Overlaps;
		Standard_Boolean Overlaps(const gp_Pnt & thePnt);

		/****** SelectBasics_SelectingVolumeManager::Overlaps ******/
		/****** md5 signature: 5d261ebac348da6356e9955565f46997 ******/
		%feature("compactdefaultargs") Overlaps;
		%feature("autodoc", "
Parameters
----------
theArrayOfPts: TColgp_HArray1OfPnt
theSensType: int
thePickResult: SelectBasics_PickResult

Return
-------
bool

Description
-----------
No available documentation.
") Overlaps;
		Standard_Boolean Overlaps(const opencascade::handle<TColgp_HArray1OfPnt> & theArrayOfPts, Standard_Integer theSensType, SelectBasics_PickResult & thePickResult);

		/****** SelectBasics_SelectingVolumeManager::Overlaps ******/
		/****** md5 signature: 11133a04341e3e346c79060e72efe3aa ******/
		%feature("compactdefaultargs") Overlaps;
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
No available documentation.
") Overlaps;
		Standard_Boolean Overlaps(const TColgp_Array1OfPnt & theArrayOfPts, Standard_Integer theSensType, SelectBasics_PickResult & thePickResult);

		/****** SelectBasics_SelectingVolumeManager::Overlaps ******/
		/****** md5 signature: 36eec5cecf417a156dfa620892dc5290 ******/
		%feature("compactdefaultargs") Overlaps;
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
No available documentation.
") Overlaps;
		Standard_Boolean Overlaps(const gp_Pnt & thePnt1, const gp_Pnt & thePnt2, SelectBasics_PickResult & thePickResult);

		/****** SelectBasics_SelectingVolumeManager::Overlaps ******/
		/****** md5 signature: 10a5476373eb96d6f98c2e052cb99c4f ******/
		%feature("compactdefaultargs") Overlaps;
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
No available documentation.
") Overlaps;
		Standard_Boolean Overlaps(const gp_Pnt & thePnt1, const gp_Pnt & thePnt2, const gp_Pnt & thePnt3, Standard_Integer theSensType, SelectBasics_PickResult & thePickResult);

		/****** SelectBasics_SelectingVolumeManager::OverlapsBox ******/
		/****** md5 signature: cf352690fe6e8f14e29256111299bf78 ******/
		%feature("compactdefaultargs") OverlapsBox;
		%feature("autodoc", "
Parameters
----------
theBoxMin: NCollection_Vec3<float>
theBoxMax: NCollection_Vec3<float>
thePickResult: SelectBasics_PickResult

Return
-------
bool

Description
-----------
Returns true if selecting volume is overlapped by box theBox.
") OverlapsBox;
		virtual Standard_Boolean OverlapsBox(const NCollection_Vec3<Standard_Real> & theBoxMin, const NCollection_Vec3<Standard_Real> & theBoxMax, SelectBasics_PickResult & thePickResult);

		/****** SelectBasics_SelectingVolumeManager::OverlapsBox ******/
		/****** md5 signature: 6a9476f5f0056d3a045e2d26d3a0d4c8 ******/
		%feature("compactdefaultargs") OverlapsBox;
		%feature("autodoc", "
Parameters
----------
theBoxMin: NCollection_Vec3<float>
theBoxMax: NCollection_Vec3<float>
theInside: bool * (optional, default to NULL)

Return
-------
bool

Description
-----------
Returns true if selecting volume is overlapped by axis-aligned bounding box with minimum corner at point theMinPt and maximum at point theMaxPt.
") OverlapsBox;
		virtual Standard_Boolean OverlapsBox(const NCollection_Vec3<Standard_Real> & theBoxMin, const NCollection_Vec3<Standard_Real> & theBoxMax, Standard_Boolean * theInside = NULL);

		/****** SelectBasics_SelectingVolumeManager::OverlapsCircle ******/
		/****** md5 signature: a8fa475b8c0320c2289cffbaffd6f1a5 ******/
		%feature("compactdefaultargs") OverlapsCircle;
		%feature("autodoc", "
Parameters
----------
theRadius: float
theTrsf: gp_Trsf
theIsFilled: bool
thePickResult: SelectBasics_PickResult

Return
-------
bool

Description
-----------
Returns true if selecting volume is overlapped by circle with radius theRadius, the boolean theIsFilled, and transformation to apply theTrsf. The position and orientation of the circle are specified via theTrsf transformation for gp::XOY() with center in gp::Origin().
") OverlapsCircle;
		virtual Standard_Boolean OverlapsCircle(const Standard_Real theRadius, const gp_Trsf & theTrsf, const Standard_Boolean theIsFilled, SelectBasics_PickResult & thePickResult);

		/****** SelectBasics_SelectingVolumeManager::OverlapsCircle ******/
		/****** md5 signature: c970c6818a43476df9f248bc6c7558b6 ******/
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
Returns true if selecting volume is overlapped by circle with radius theRadius, the boolean theIsFilled, and transformation to apply theTrsf. The position and orientation of the circle are specified via theTrsf transformation for gp::XOY() with center in gp::Origin().
") OverlapsCircle;
		virtual Standard_Boolean OverlapsCircle(const Standard_Real theRadius, const gp_Trsf & theTrsf, const Standard_Boolean theIsFilled, Standard_Boolean * theInside = NULL);

		/****** SelectBasics_SelectingVolumeManager::OverlapsCylinder ******/
		/****** md5 signature: b39aa1ecbb42ea81200fd25f27606124 ******/
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
Returns true if selecting volume is overlapped by cylinder (or cone) with radiuses theBottomRad and theTopRad, height theHeight, the boolean theIsHollow and transformation to apply theTrsf.
") OverlapsCylinder;
		virtual Standard_Boolean OverlapsCylinder(const Standard_Real theBottomRad, const Standard_Real theTopRad, const Standard_Real theHeight, const gp_Trsf & theTrsf, const Standard_Boolean theIsHollow, SelectBasics_PickResult & thePickResult);

		/****** SelectBasics_SelectingVolumeManager::OverlapsCylinder ******/
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
Returns true if selecting volume is overlapped by cylinder (or cone) with radiuses theBottomRad and theTopRad, height theHeight, the boolean theIsHollow and transformation to apply theTrsf.
") OverlapsCylinder;
		virtual Standard_Boolean OverlapsCylinder(const Standard_Real theBottomRad, const Standard_Real theTopRad, const Standard_Real theHeight, const gp_Trsf & theTrsf, const Standard_Boolean theIsHollow, Standard_Boolean * theInside = NULL);

		/****** SelectBasics_SelectingVolumeManager::OverlapsPoint ******/
		/****** md5 signature: 60fbb482729178a9e23a299d60c9d746 ******/
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
Returns true if selecting volume is overlapped by point thePnt.
") OverlapsPoint;
		virtual Standard_Boolean OverlapsPoint(const gp_Pnt & thePnt, SelectBasics_PickResult & thePickResult);

		/****** SelectBasics_SelectingVolumeManager::OverlapsPoint ******/
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
Returns true if selecting volume is overlapped by point thePnt. Does not perform depth calculation, so this method is defined as helper function for inclusion test.
") OverlapsPoint;
		virtual Standard_Boolean OverlapsPoint(const gp_Pnt & thePnt);

		/****** SelectBasics_SelectingVolumeManager::OverlapsPolygon ******/
		/****** md5 signature: 3a1e3541e3075520cd2fcde5b9115bf8 ******/
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
Returns true if selecting volume is overlapped by planar convex polygon, which points are stored in theArrayOfPts, taking into account sensitivity type theSensType.
") OverlapsPolygon;
		virtual Standard_Boolean OverlapsPolygon(const TColgp_Array1OfPnt & theArrayOfPts, Standard_Integer theSensType, SelectBasics_PickResult & thePickResult);

		/****** SelectBasics_SelectingVolumeManager::OverlapsSegment ******/
		/****** md5 signature: a823340c5214f1edddbd9ffe133acbee ******/
		%feature("compactdefaultargs") OverlapsSegment;
		%feature("autodoc", "
Parameters
----------
thePt1: gp_Pnt
thePt2: gp_Pnt
thePickResult: SelectBasics_PickResult

Return
-------
bool

Description
-----------
Returns true if selecting volume is overlapped by line segment with start point at thePt1 and end point at thePt2.
") OverlapsSegment;
		virtual Standard_Boolean OverlapsSegment(const gp_Pnt & thePt1, const gp_Pnt & thePt2, SelectBasics_PickResult & thePickResult);

		/****** SelectBasics_SelectingVolumeManager::OverlapsSphere ******/
		/****** md5 signature: 87e22026b65bcca16d984778fe81e17c ******/
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
Returns true if selecting volume is overlapped by sphere with center theCenter and radius theRadius.
") OverlapsSphere;
		virtual Standard_Boolean OverlapsSphere(const gp_Pnt & theCenter, const Standard_Real theRadius, SelectBasics_PickResult & thePickResult);

		/****** SelectBasics_SelectingVolumeManager::OverlapsSphere ******/
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
Returns true if selecting volume is overlapped by sphere with center theCenter and radius theRadius.
") OverlapsSphere;
		virtual Standard_Boolean OverlapsSphere(const gp_Pnt & theCenter, const Standard_Real theRadius, Standard_Boolean * theInside = NULL);

		/****** SelectBasics_SelectingVolumeManager::OverlapsTriangle ******/
		/****** md5 signature: 3271f8a7e98caa5cd64a9dcea6559740 ******/
		%feature("compactdefaultargs") OverlapsTriangle;
		%feature("autodoc", "
Parameters
----------
thePt1: gp_Pnt
thePt2: gp_Pnt
thePt3: gp_Pnt
theSensType: int
thePickResult: SelectBasics_PickResult

Return
-------
bool

Description
-----------
Returns true if selecting volume is overlapped by triangle with vertices thePt1, thePt2 and thePt3, taking into account sensitivity type theSensType.
") OverlapsTriangle;
		virtual Standard_Boolean OverlapsTriangle(const gp_Pnt & thePt1, const gp_Pnt & thePt2, const gp_Pnt & thePt3, Standard_Integer theSensType, SelectBasics_PickResult & thePickResult);

};


%extend SelectBasics_SelectingVolumeManager {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
/* class aliases */
%pythoncode {
}
/* deprecated methods */
%pythoncode {
@deprecated
def selectbasics_MaxOwnerPriority(*args):
	return selectbasics.MaxOwnerPriority(*args)

@deprecated
def selectbasics_MinOwnerPriority(*args):
	return selectbasics.MinOwnerPriority(*args)

@deprecated
def SelectBasics_PickResult_Min(*args):
	return SelectBasics_PickResult.Min(*args)

}
