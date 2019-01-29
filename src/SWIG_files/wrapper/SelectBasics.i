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
%define SELECTBASICSDOCSTRING
"No docstring provided."
%enddef
%module (package="OCC.Core", docstring=SELECTBASICSDOCSTRING) SelectBasics

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


%include SelectBasics_headers.i

/* templates */
/* end templates declaration */


/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%wrap_handle(SelectBasics_EntityOwner)
%wrap_handle(SelectBasics_SensitiveEntity)

%rename(selectbasics) SelectBasics;
class SelectBasics {
	public:
		%feature("compactdefaultargs") MaxOwnerPriority;
		%feature("autodoc", "	* Structure to provide all-in-one result of selection of sensitive for 'Matches' method of SelectBasics_SensitiveEntity.

	:rtype: int
") MaxOwnerPriority;
		static Standard_Integer MaxOwnerPriority ();
		%feature("compactdefaultargs") MinOwnerPriority;
		%feature("autodoc", "	:rtype: int
") MinOwnerPriority;
		static Standard_Integer MinOwnerPriority ();
};


%extend SelectBasics {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor SelectBasics_EntityOwner;
class SelectBasics_EntityOwner : public Standard_Transient {
	public:
		%feature("compactdefaultargs") HasLocation;
		%feature("autodoc", "	:rtype: bool
") HasLocation;
		virtual Standard_Boolean HasLocation ();
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "	:rtype: TopLoc_Location
") Location;
		virtual TopLoc_Location Location ();
		%feature("compactdefaultargs") Priority;
		%feature("autodoc", "	:rtype: int
") Priority;
		Standard_Integer Priority ();
		%feature("compactdefaultargs") ResetLocation;
		%feature("autodoc", "	:rtype: void
") ResetLocation;
		virtual void ResetLocation ();
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* sets the selectable priority of the owner

	:param thePriority:
	:type thePriority: int
	:rtype: None
") Set;
		void Set (const Standard_Integer thePriority);
		%feature("compactdefaultargs") SetLocation;
		%feature("autodoc", "	:param aLoc:
	:type aLoc: TopLoc_Location &
	:rtype: void
") SetLocation;
		virtual void SetLocation (const TopLoc_Location & aLoc);
		%feature("compactdefaultargs") SetPriority;
		%feature("autodoc", "	* sets the selectable priority of the owner

	:param thePriority:
	:type thePriority: int
	:rtype: None
") SetPriority;
		void SetPriority (const Standard_Integer thePriority);
};


%make_alias(SelectBasics_EntityOwner)

%extend SelectBasics_EntityOwner {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor SelectBasics_PickResult;
class SelectBasics_PickResult {
	public:
		%feature("compactdefaultargs") Depth;
		%feature("autodoc", "	:rtype: inline float
") Depth;
		inline Standard_Real Depth ();
		%feature("compactdefaultargs") DistToGeomCenter;
		%feature("autodoc", "	:rtype: inline float
") DistToGeomCenter;
		inline Standard_Real DistToGeomCenter ();
		%feature("compactdefaultargs") SelectBasics_PickResult;
		%feature("autodoc", "	:rtype: None
") SelectBasics_PickResult;
		 SelectBasics_PickResult ();
		%feature("compactdefaultargs") SelectBasics_PickResult;
		%feature("autodoc", "	:param theDepth:
	:type theDepth: float
	:param theDistToCenter:
	:type theDistToCenter: float
	:rtype: None
") SelectBasics_PickResult;
		 SelectBasics_PickResult (const Standard_Real theDepth,const Standard_Real theDistToCenter);
};


%extend SelectBasics_PickResult {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor SelectBasics_SelectingVolumeManager;
class SelectBasics_SelectingVolumeManager {
	public:
/* public enums */
enum SelectionType {
	Point = 0,
	Box = 1,
	Polyline = 2,
	Unknown = 3,
};

/* end public enums declaration */

		%feature("compactdefaultargs") DetectedPoint;
		%feature("autodoc", "	:param theDepth:
	:type theDepth: float
	:rtype: gp_Pnt
") DetectedPoint;
		gp_Pnt DetectedPoint (const Standard_Real theDepth);
		%feature("compactdefaultargs") DistToGeometryCenter;
		%feature("autodoc", "	* Calculates distance from 3d projection of user-defined selection point to the given point theCOG

	:param theCOG:
	:type theCOG: gp_Pnt
	:rtype: float
") DistToGeometryCenter;
		Standard_Real DistToGeometryCenter (const gp_Pnt & theCOG);
		%feature("compactdefaultargs") GetActiveSelectionType;
		%feature("autodoc", "	:rtype: int
") GetActiveSelectionType;
		Standard_Integer GetActiveSelectionType ();
		%feature("compactdefaultargs") GetFarPickedPnt;
		%feature("autodoc", "	* Valid only for point and rectangular selection. Returns projection of 2d mouse picked point or projection of center of 2d rectangle (for point and rectangular selection correspondingly) onto far view frustum plane

	:rtype: gp_Pnt
") GetFarPickedPnt;
		gp_Pnt GetFarPickedPnt ();
		%feature("compactdefaultargs") GetNearPickedPnt;
		%feature("autodoc", "	* Valid only for point and rectangular selection. Returns projection of 2d mouse picked point or projection of center of 2d rectangle (for point and rectangular selection correspondingly) onto near view frustum plane

	:rtype: gp_Pnt
") GetNearPickedPnt;
		gp_Pnt GetNearPickedPnt ();
		%feature("compactdefaultargs") GetPlanes;
		%feature("autodoc", "	* Stores plane equation coefficients (in the following form: Ax + By + Cz + D = 0) to the given vector

	:param thePlaneEquations:
	:type thePlaneEquations: NCollection_Vector<NCollection_Vec4<float> > &
	:rtype: None
") GetPlanes;
		void GetPlanes (NCollection_Vector<NCollection_Vec4<Standard_Real> > & thePlaneEquations);
		%feature("compactdefaultargs") IsOverlapAllowed;
		%feature("autodoc", "	:rtype: bool
") IsOverlapAllowed;
		Standard_Boolean IsOverlapAllowed ();
		%feature("compactdefaultargs") Overlaps;
		%feature("autodoc", "	* Returns true if selecting volume is overlapped by box theBox

	:param theBoxMin:
	:type theBoxMin: NCollection_Vec3<float> &
	:param theBoxMax:
	:type theBoxMax: NCollection_Vec3<float> &
	:param theDepth:
	:type theDepth: float &
	:rtype: bool
") Overlaps;
		Standard_Boolean Overlaps (const NCollection_Vec3<Standard_Real> & theBoxMin,const NCollection_Vec3<Standard_Real> & theBoxMax,Standard_Real &OutValue);
		%feature("compactdefaultargs") Overlaps;
		%feature("autodoc", "	* Returns true if selecting volume is overlapped by axis-aligned bounding box with minimum corner at point theMinPt and maximum at point theMaxPt

	:param theBoxMin:
	:type theBoxMin: NCollection_Vec3<float> &
	:param theBoxMax:
	:type theBoxMax: NCollection_Vec3<float> &
	:param theInside: default value is NULL
	:type theInside: bool *
	:rtype: bool
") Overlaps;
		Standard_Boolean Overlaps (const NCollection_Vec3<Standard_Real> & theBoxMin,const NCollection_Vec3<Standard_Real> & theBoxMax,Standard_Boolean * theInside = NULL);
		%feature("compactdefaultargs") Overlaps;
		%feature("autodoc", "	* Returns true if selecting volume is overlapped by point thePnt

	:param thePnt:
	:type thePnt: gp_Pnt
	:param theDepth:
	:type theDepth: float &
	:rtype: bool
") Overlaps;
		Standard_Boolean Overlaps (const gp_Pnt & thePnt,Standard_Real &OutValue);
		%feature("compactdefaultargs") Overlaps;
		%feature("autodoc", "	* Returns true if selecting volume is overlapped by point thePnt. Does not perform depth calculation, so this method is defined as helper function for inclusion test.

	:param thePnt:
	:type thePnt: gp_Pnt
	:rtype: bool
") Overlaps;
		Standard_Boolean Overlaps (const gp_Pnt & thePnt);
		%feature("compactdefaultargs") Overlaps;
		%feature("autodoc", "	* Returns true if selecting volume is overlapped by planar convex polygon, which points are stored in theArrayOfPts, taking into account sensitivity type theSensType

	:param theArrayOfPts:
	:type theArrayOfPts: Handle_TColgp_HArray1OfPnt
	:param theSensType:
	:type theSensType: int
	:param theDepth:
	:type theDepth: float &
	:rtype: bool
") Overlaps;
		Standard_Boolean Overlaps (const Handle_TColgp_HArray1OfPnt & theArrayOfPts,Standard_Integer theSensType,Standard_Real &OutValue);
		%feature("compactdefaultargs") Overlaps;
		%feature("autodoc", "	* Returns true if selecting volume is overlapped by planar convex polygon, which points are stored in theArrayOfPts, taking into account sensitivity type theSensType

	:param theArrayOfPts:
	:type theArrayOfPts: TColgp_Array1OfPnt
	:param theSensType:
	:type theSensType: int
	:param theDepth:
	:type theDepth: float &
	:rtype: bool
") Overlaps;
		Standard_Boolean Overlaps (const TColgp_Array1OfPnt & theArrayOfPts,Standard_Integer theSensType,Standard_Real &OutValue);
		%feature("compactdefaultargs") Overlaps;
		%feature("autodoc", "	* Returns true if selecting volume is overlapped by line segment with start point at thePt1 and end point at thePt2

	:param thePt1:
	:type thePt1: gp_Pnt
	:param thePt2:
	:type thePt2: gp_Pnt
	:param theDepth:
	:type theDepth: float &
	:rtype: bool
") Overlaps;
		Standard_Boolean Overlaps (const gp_Pnt & thePt1,const gp_Pnt & thePt2,Standard_Real &OutValue);
		%feature("compactdefaultargs") Overlaps;
		%feature("autodoc", "	* Returns true if selecting volume is overlapped by triangle with vertices thePt1, thePt2 and thePt3, taking into account sensitivity type theSensType

	:param thePt1:
	:type thePt1: gp_Pnt
	:param thePt2:
	:type thePt2: gp_Pnt
	:param thePt3:
	:type thePt3: gp_Pnt
	:param theSensType:
	:type theSensType: int
	:param theDepth:
	:type theDepth: float &
	:rtype: bool
") Overlaps;
		Standard_Boolean Overlaps (const gp_Pnt & thePt1,const gp_Pnt & thePt2,const gp_Pnt & thePt3,Standard_Integer theSensType,Standard_Real &OutValue);
};


%extend SelectBasics_SelectingVolumeManager {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor SelectBasics_SensitiveEntity;
class SelectBasics_SensitiveEntity : public Standard_Transient {
	public:
		%feature("compactdefaultargs") BVH;
		%feature("autodoc", "	* Builds BVH tree for sensitive if it is needed

	:rtype: None
") BVH;
		void BVH ();
		%feature("compactdefaultargs") BoundingBox;
		%feature("autodoc", "	* Returns bounding box of sensitive entity

	:rtype: Select3D_BndBox3d
") BoundingBox;
		Select3D_BndBox3d BoundingBox ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	* Clears up all the resources and memory allocated

	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") HasInitLocation;
		%feature("autodoc", "	* Returns true if the shape corresponding to the entity has init location

	:rtype: bool
") HasInitLocation;
		Standard_Boolean HasInitLocation ();
		%feature("compactdefaultargs") InvInitLocation;
		%feature("autodoc", "	* Returns inversed location transformation matrix if the shape corresponding to this entity has init location set. Otherwise, returns identity matrix.

	:rtype: gp_GTrsf
") InvInitLocation;
		gp_GTrsf InvInitLocation ();
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "	* Checks whether the sensitive entity is overlapped by current selecting volume

	:param theMgr:
	:type theMgr: SelectBasics_SelectingVolumeManager &
	:param thePickResult:
	:type thePickResult: SelectBasics_PickResult &
	:rtype: bool
") Matches;
		Standard_Boolean Matches (SelectBasics_SelectingVolumeManager & theMgr,SelectBasics_PickResult & thePickResult);
		%feature("compactdefaultargs") NbSubElements;
		%feature("autodoc", "	* Returns the number of sub-entities or elements in sensitive entity. Is used to determine if entity is complex and needs to pre-build BVH at the creation of sensitive entity step or is light-weighted so the tree can be build on demand with unnoticeable delay

	:rtype: int
") NbSubElements;
		Standard_Integer NbSubElements ();
		%feature("compactdefaultargs") OwnerId;
		%feature("autodoc", "	* Returns pointer to owner of the entity

	:rtype: Handle_SelectBasics_EntityOwner
") OwnerId;
		Handle_SelectBasics_EntityOwner OwnerId ();
		%feature("compactdefaultargs") SensitivityFactor;
		%feature("autodoc", "	* allows a better sensitivity for a specific entity in selection algorithms useful for small sized entities.

	:rtype: int
") SensitivityFactor;
		Standard_Integer SensitivityFactor ();
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Sets owner of the entity

	:param theOwnerId:
	:type theOwnerId: Handle_SelectBasics_EntityOwner &
	:rtype: void
") Set;
		virtual void Set (const Handle_SelectBasics_EntityOwner & theOwnerId);
		%feature("compactdefaultargs") SetSensitivityFactor;
		%feature("autodoc", "	* Allows to manage sensitivity of a particular sensitive entity

	:param theNewSens:
	:type theNewSens: int
	:rtype: None
") SetSensitivityFactor;
		void SetSensitivityFactor (const Standard_Integer theNewSens);
};


%make_alias(SelectBasics_SensitiveEntity)

%extend SelectBasics_SensitiveEntity {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
/* harray1 class */
/* harray2 class */
/* harray2 class */
