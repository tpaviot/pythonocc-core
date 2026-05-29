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
%define SELECTBASICSDOCSTRING
"SelectBasics module, see official documentation at
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_selectbasics.html"
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
		/****** md5 signature: cd762e8bf3649579b7c2999466e6bb50 ******/
		%feature("compactdefaultargs") MaxOwnerPriority;
		%feature("autodoc", "Return
-------
int

Description
-----------
Structure to provide all-in-one result of selection of sensitive for 'Matches' method of Select3D_SensitiveEntity.
") MaxOwnerPriority;
		static int MaxOwnerPriority();

		/****** SelectBasics::MinOwnerPriority ******/
		/****** md5 signature: f210eb00b18071c277ca5e5c85b3ab69 ******/
		%feature("compactdefaultargs") MinOwnerPriority;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") MinOwnerPriority;
		static int MinOwnerPriority();

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
		/****** md5 signature: 8d566306042475a6d82a6b8713024f21 ******/
		%feature("compactdefaultargs") SelectBasics_PickResult;
		%feature("autodoc", "
Parameters
----------
theDepth: double
theDistToCenter: double
theObjPickedPnt: gp_Pnt

Return
-------
None

Description
-----------
Constructor with initialization.
") SelectBasics_PickResult;
		 SelectBasics_PickResult(double theDepth, double theDistToCenter, const gp_Pnt & theObjPickedPnt);

		/****** SelectBasics_PickResult::Depth ******/
		/****** md5 signature: 330848a9277b1a1c476bb2c0cf225653 ******/
		%feature("compactdefaultargs") Depth;
		%feature("autodoc", "Return
-------
double

Description
-----------
Return depth along picking ray.
") Depth;
		double Depth();

		/****** SelectBasics_PickResult::DistToGeomCenter ******/
		/****** md5 signature: 8aae770af57916948c3277c194ff8e3d ******/
		%feature("compactdefaultargs") DistToGeomCenter;
		%feature("autodoc", "Return
-------
double

Description
-----------
Return distance to geometry center (auxiliary value for comparing results).
") DistToGeomCenter;
		double DistToGeomCenter();

		/****** SelectBasics_PickResult::HasPickedPoint ******/
		/****** md5 signature: 018fa6920d047d2a9d881974773cedd3 ******/
		%feature("compactdefaultargs") HasPickedPoint;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return True if Picked Point lying on detected entity was set.
") HasPickedPoint;
		bool HasPickedPoint();

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
		/****** md5 signature: 735088818cf24ebe0ebc7005a507da69 ******/
		%feature("compactdefaultargs") IsValid;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return True if result was been defined.
") IsValid;
		bool IsValid();

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
		/****** md5 signature: 93e0c2a45cf2da12ffb36d0fb0ef38de ******/
		%feature("compactdefaultargs") SetDepth;
		%feature("autodoc", "
Parameters
----------
theDepth: double

Return
-------
None

Description
-----------
Set depth along picking ray.
") SetDepth;
		void SetDepth(double theDepth);

		/****** SelectBasics_PickResult::SetDistToGeomCenter ******/
		/****** md5 signature: 71753c32659e94f997bc760a59a3879e ******/
		%feature("compactdefaultargs") SetDistToGeomCenter;
		%feature("autodoc", "
Parameters
----------
theDistToCenter: double

Return
-------
None

Description
-----------
Set distance to geometry center.
") SetDistToGeomCenter;
		void SetDistToGeomCenter(double theDistToCenter);

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
		/****** md5 signature: 45f56b5418aa70a987dc1df7ad341800 ******/
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
Return 3D point corresponding to specified depth within picking ray.
") DetectedPoint;
		virtual gp_Pnt DetectedPoint(const double theDepth);

		/****** SelectBasics_SelectingVolumeManager::DistToGeometryCenter ******/
		/****** md5 signature: e6b64f66b83c33af57c52c623d0c0448 ******/
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
Calculates distance from 3d projection of user-defined selection point to the given point theCOG.
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
		/****** SelectBasics_SelectingVolumeManager::GetActiveSelectionType ******/
		/****** md5 signature: a5c628bbd709e8950b3fe1e180f16654 ******/
		%feature("compactdefaultargs") GetActiveSelectionType;
		%feature("autodoc", "Return
-------
int

Description
-----------
Return selection type.
") GetActiveSelectionType;
		virtual int GetActiveSelectionType();

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
		/****** md5 signature: 6bb33508a082451c5c7f42cc8bf8657f ******/
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
		virtual void GetPlanes(NCollection_DynamicArray<NCollection_Vec4<double>> & thePlaneEquations);

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
		/****** md5 signature: c767ab765be5c922401d9ca8937e1619 ******/
		%feature("compactdefaultargs") IsOverlapAllowed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns flag indicating if partial overlapping of entities is allowed or should be rejected.
") IsOverlapAllowed;
		virtual bool IsOverlapAllowed();

		/****** SelectBasics_SelectingVolumeManager::IsScalableActiveVolume ******/
		/****** md5 signature: 944a9d16111e90c99da6bc38145dffed ******/
		%feature("compactdefaultargs") IsScalableActiveVolume;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Checks if it is possible to scale current active selecting volume.
") IsScalableActiveVolume;
		virtual bool IsScalableActiveVolume();

		/****** SelectBasics_SelectingVolumeManager::Overlaps ******/
		/****** md5 signature: b52f4918f07e24fbf98960c6e0090ea0 ******/
		%feature("compactdefaultargs") Overlaps;
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
No available documentation.
") Overlaps;
		bool Overlaps(const NCollection_Vec3<double> & theBoxMin, const NCollection_Vec3<double> & theBoxMax, SelectBasics_PickResult & thePickResult);

		/****** SelectBasics_SelectingVolumeManager::Overlaps ******/
		/****** md5 signature: fd47c508c1ed5f77b45dea34abe3a979 ******/
		%feature("compactdefaultargs") Overlaps;
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
No available documentation.
") Overlaps;
		bool Overlaps(const NCollection_Vec3<double> & theBoxMin, const NCollection_Vec3<double> & theBoxMax, bool * theInside = nullptr);

		/****** SelectBasics_SelectingVolumeManager::Overlaps ******/
		/****** md5 signature: d6b3e80fbf18e6e2fde97215620b42d6 ******/
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
		bool Overlaps(const gp_Pnt & thePnt, SelectBasics_PickResult & thePickResult);

		/****** SelectBasics_SelectingVolumeManager::Overlaps ******/
		/****** md5 signature: 919e0ae360cc9b032cd1538fe822f07f ******/
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
		bool Overlaps(const gp_Pnt & thePnt);

		/****** SelectBasics_SelectingVolumeManager::Overlaps ******/
		/****** md5 signature: fc47dfa59d51c941e8ff12d824594ad6 ******/
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
		bool Overlaps(const opencascade::handle<TColgp_HArray1OfPnt> & theArrayOfPts, int theSensType, SelectBasics_PickResult & thePickResult);

		/****** SelectBasics_SelectingVolumeManager::Overlaps ******/
		/****** md5 signature: 0f0e970c02857f94a5b1fcf42809fa7a ******/
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
		bool Overlaps(const TColgp_Array1OfPnt & theArrayOfPts, int theSensType, SelectBasics_PickResult & thePickResult);

		/****** SelectBasics_SelectingVolumeManager::Overlaps ******/
		/****** md5 signature: 58c6dcc75485902ba049e48e685ed3e2 ******/
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
		bool Overlaps(const gp_Pnt & thePnt1, const gp_Pnt & thePnt2, SelectBasics_PickResult & thePickResult);

		/****** SelectBasics_SelectingVolumeManager::Overlaps ******/
		/****** md5 signature: 66dd265ac39c1a2c6b06aebec1b259ce ******/
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
		bool Overlaps(const gp_Pnt & thePnt1, const gp_Pnt & thePnt2, const gp_Pnt & thePnt3, int theSensType, SelectBasics_PickResult & thePickResult);

		/****** SelectBasics_SelectingVolumeManager::OverlapsBox ******/
		/****** md5 signature: 67f70bedc0e992a6cde13768b9d0b2ed ******/
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
Returns true if selecting volume is overlapped by box theBox.
") OverlapsBox;
		virtual bool OverlapsBox(const NCollection_Vec3<double> & theBoxMin, const NCollection_Vec3<double> & theBoxMax, SelectBasics_PickResult & thePickResult);

		/****** SelectBasics_SelectingVolumeManager::OverlapsBox ******/
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

		/****** SelectBasics_SelectingVolumeManager::OverlapsCircle ******/
		/****** md5 signature: 25b49176671917e7d106e6fe62c45fad ******/
		%feature("compactdefaultargs") OverlapsCircle;
		%feature("autodoc", "
Parameters
----------
theRadius: double
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
		virtual bool OverlapsCircle(const double theRadius, const gp_Trsf & theTrsf, const bool theIsFilled, SelectBasics_PickResult & thePickResult);

		/****** SelectBasics_SelectingVolumeManager::OverlapsCircle ******/
		/****** md5 signature: 80bfde6879d27622b1789689e14dbe9f ******/
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
Returns true if selecting volume is overlapped by circle with radius theRadius, the boolean theIsFilled, and transformation to apply theTrsf. The position and orientation of the circle are specified via theTrsf transformation for gp::XOY() with center in gp::Origin().
") OverlapsCircle;
		virtual bool OverlapsCircle(const double theRadius, const gp_Trsf & theTrsf, const bool theIsFilled, bool * theInside = nullptr);

		/****** SelectBasics_SelectingVolumeManager::OverlapsCylinder ******/
		/****** md5 signature: 1ff5e27b7cb5eb17742ffd1732a908be ******/
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
Returns true if selecting volume is overlapped by cylinder (or cone) with radiuses theBottomRad and theTopRad, height theHeight, the boolean theIsHollow and transformation to apply theTrsf.
") OverlapsCylinder;
		virtual bool OverlapsCylinder(const double theBottomRad, const double theTopRad, const double theHeight, const gp_Trsf & theTrsf, const bool theIsHollow, SelectBasics_PickResult & thePickResult);

		/****** SelectBasics_SelectingVolumeManager::OverlapsCylinder ******/
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
Returns true if selecting volume is overlapped by cylinder (or cone) with radiuses theBottomRad and theTopRad, height theHeight, the boolean theIsHollow and transformation to apply theTrsf.
") OverlapsCylinder;
		virtual bool OverlapsCylinder(const double theBottomRad, const double theTopRad, const double theHeight, const gp_Trsf & theTrsf, const bool theIsHollow, bool * theInside = nullptr);

		/****** SelectBasics_SelectingVolumeManager::OverlapsPoint ******/
		/****** md5 signature: a9bbca566f41ecd16c69de28d62b8a36 ******/
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
		virtual bool OverlapsPoint(const gp_Pnt & thePnt, SelectBasics_PickResult & thePickResult);

		/****** SelectBasics_SelectingVolumeManager::OverlapsPoint ******/
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
Returns true if selecting volume is overlapped by point thePnt. Does not perform depth calculation, so this method is defined as helper function for inclusion test.
") OverlapsPoint;
		virtual bool OverlapsPoint(const gp_Pnt & thePnt);

		/****** SelectBasics_SelectingVolumeManager::OverlapsPolygon ******/
		/****** md5 signature: 857dd9498efa7521e550e6b4fdcd65cd ******/
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
		virtual bool OverlapsPolygon(const TColgp_Array1OfPnt & theArrayOfPts, int theSensType, SelectBasics_PickResult & thePickResult);

		/****** SelectBasics_SelectingVolumeManager::OverlapsSegment ******/
		/****** md5 signature: 20691bdd3c3b383b48db4b9ad392e8b7 ******/
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
		virtual bool OverlapsSegment(const gp_Pnt & thePt1, const gp_Pnt & thePt2, SelectBasics_PickResult & thePickResult);

		/****** SelectBasics_SelectingVolumeManager::OverlapsSphere ******/
		/****** md5 signature: e1b0088e0e321e0956683d9ffea3a1e6 ******/
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
Returns true if selecting volume is overlapped by sphere with center theCenter and radius theRadius.
") OverlapsSphere;
		virtual bool OverlapsSphere(const gp_Pnt & theCenter, const double theRadius, SelectBasics_PickResult & thePickResult);

		/****** SelectBasics_SelectingVolumeManager::OverlapsSphere ******/
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

		/****** SelectBasics_SelectingVolumeManager::OverlapsTriangle ******/
		/****** md5 signature: f7493ac8c3b73369ce3c6561ff20cf3f ******/
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
		virtual bool OverlapsTriangle(const gp_Pnt & thePt1, const gp_Pnt & thePt2, const gp_Pnt & thePt3, int theSensType, SelectBasics_PickResult & thePickResult);

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
