/*
Copyright 2008-2017 Thomas Paviot (tpaviot@gmail.com)


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
%module (package="OCC") SelectBasics

#pragma SWIG nowarn=504,325,503

%{
#ifdef WNT
#pragma warning(disable : 4716)
#endif
%}

%include ../common/CommonIncludes.i
%include ../common/ExceptionCatcher.i
%include ../common/FunctionTransformers.i
%include ../common/Operators.i


%include SelectBasics_headers.i


%pythoncode {
def register_handle(handle, base_object):
    """
    Inserts the handle into the base object to
    prevent memory corruption in certain cases
    """
    try:
        if base_object.IsKind("Standard_Transient"):
            base_object.thisHandle = handle
            base_object.thisown = False
    except:
        pass
};

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

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
class SelectBasics_EntityOwner : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* sets the selectable priority of the owner

	:param aPriority:
	:type aPriority: int
	:rtype: None
") Set;
		void Set (const Standard_Integer aPriority);
		%feature("compactdefaultargs") Priority;
		%feature("autodoc", "	:rtype: int
") Priority;
		Standard_Integer Priority ();
		%feature("compactdefaultargs") HasLocation;
		%feature("autodoc", "	:rtype: bool
") HasLocation;
		virtual Standard_Boolean HasLocation ();
		%feature("compactdefaultargs") SetLocation;
		%feature("autodoc", "	:param aLoc:
	:type aLoc: TopLoc_Location &
	:rtype: void
") SetLocation;
		virtual void SetLocation (const TopLoc_Location & aLoc);
		%feature("compactdefaultargs") ResetLocation;
		%feature("autodoc", "	:rtype: void
") ResetLocation;
		virtual void ResetLocation ();
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "	:rtype: TopLoc_Location
") Location;
		virtual TopLoc_Location Location ();
};


%extend SelectBasics_EntityOwner {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_SelectBasics_EntityOwner(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_SelectBasics_EntityOwner::Handle_SelectBasics_EntityOwner %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_SelectBasics_EntityOwner;
class Handle_SelectBasics_EntityOwner : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_SelectBasics_EntityOwner();
        Handle_SelectBasics_EntityOwner(const Handle_SelectBasics_EntityOwner &aHandle);
        Handle_SelectBasics_EntityOwner(const SelectBasics_EntityOwner *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_SelectBasics_EntityOwner DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_SelectBasics_EntityOwner {
    SelectBasics_EntityOwner* _get_reference() {
    return (SelectBasics_EntityOwner*)$self->Access();
    }
};

%extend Handle_SelectBasics_EntityOwner {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend SelectBasics_EntityOwner {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor SelectBasics_PickResult;
class SelectBasics_PickResult {
	public:
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
		%feature("compactdefaultargs") Depth;
		%feature("autodoc", "	:rtype: inline float
") Depth;
		inline Standard_Real Depth ();
		%feature("compactdefaultargs") DistToGeomCenter;
		%feature("autodoc", "	:rtype: inline float
") DistToGeomCenter;
		inline Standard_Real DistToGeomCenter ();
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

		%feature("compactdefaultargs") GetActiveSelectionType;
		%feature("autodoc", "	:rtype: int
") GetActiveSelectionType;
		Standard_Integer GetActiveSelectionType ();
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
		%feature("compactdefaultargs") DistToGeometryCenter;
		%feature("autodoc", "	* Calculates distance from 3d projection of user-defined selection point to the given point theCOG

	:param theCOG:
	:type theCOG: gp_Pnt
	:rtype: float
") DistToGeometryCenter;
		Standard_Real DistToGeometryCenter (const gp_Pnt & theCOG);
		%feature("compactdefaultargs") DetectedPoint;
		%feature("autodoc", "	:param theDepth:
	:type theDepth: float
	:rtype: gp_Pnt
") DetectedPoint;
		gp_Pnt DetectedPoint (const Standard_Real theDepth);
		%feature("compactdefaultargs") IsOverlapAllowed;
		%feature("autodoc", "	:rtype: bool
") IsOverlapAllowed;
		Standard_Boolean IsOverlapAllowed ();
};


%extend SelectBasics_SelectingVolumeManager {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor SelectBasics_SensitiveEntity;
class SelectBasics_SensitiveEntity : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Sets owner of the entity

	:param theOwnerId:
	:type theOwnerId: Handle_SelectBasics_EntityOwner &
	:rtype: void
") Set;
		virtual void Set (const Handle_SelectBasics_EntityOwner & theOwnerId);
		%feature("compactdefaultargs") OwnerId;
		%feature("autodoc", "	* Returns pointer to owner of the entity

	:rtype: Handle_SelectBasics_EntityOwner
") OwnerId;
		Handle_SelectBasics_EntityOwner OwnerId ();
		%feature("compactdefaultargs") SetSensitivityFactor;
		%feature("autodoc", "	* Allows to manage the sensitivity of the entity

	:param theSensFactor:
	:type theSensFactor: int
	:rtype: None
") SetSensitivityFactor;
		void SetSensitivityFactor (const Standard_Integer theSensFactor);
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "	* Checks whether the sensitive entity is overlapped by current selecting volume

	:param theMgr:
	:type theMgr: SelectBasics_SelectingVolumeManager &
	:param thePickResult:
	:type thePickResult: SelectBasics_PickResult &
	:rtype: bool
") Matches;
		virtual Standard_Boolean Matches (SelectBasics_SelectingVolumeManager & theMgr,SelectBasics_PickResult & thePickResult);
		%feature("compactdefaultargs") SensitivityFactor;
		%feature("autodoc", "	* allows a better sensitivity for a specific entity in selection algorithms useful for small sized entities.

	:rtype: int
") SensitivityFactor;
		Standard_Integer SensitivityFactor ();
		%feature("compactdefaultargs") NbSubElements;
		%feature("autodoc", "	* Returns the number of sub-entities or elements in sensitive entity. Is used to determine if entity is complex and needs to pre-build BVH at the creation of sensitive entity step or is light-weighted so the tree can be build on demand with unnoticeable delay

	:rtype: int
") NbSubElements;
		virtual Standard_Integer NbSubElements ();
		%feature("compactdefaultargs") BoundingBox;
		%feature("autodoc", "	* Returns bounding box of sensitive entity

	:rtype: Select3D_BndBox3d
") BoundingBox;
		virtual Select3D_BndBox3d BoundingBox ();
		%feature("compactdefaultargs") BVH;
		%feature("autodoc", "	* Builds BVH tree for sensitive if it is needed

	:rtype: void
") BVH;
		virtual void BVH ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	* Clears up all the resources and memory allocated

	:rtype: void
") Clear;
		virtual void Clear ();
		%feature("compactdefaultargs") HasInitLocation;
		%feature("autodoc", "	* Returns true if the shape corresponding to the entity has init location.

	:rtype: bool
") HasInitLocation;
		virtual Standard_Boolean HasInitLocation ();
		%feature("compactdefaultargs") InvInitLocation;
		%feature("autodoc", "	* Returns inversed location transformation matrix if the shape corresponding to this entity has init location set. Otherwise, returns identity matrix.

	:rtype: gp_Trsf
") InvInitLocation;
		virtual gp_Trsf InvInitLocation ();
};


%extend SelectBasics_SensitiveEntity {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_SelectBasics_SensitiveEntity(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_SelectBasics_SensitiveEntity::Handle_SelectBasics_SensitiveEntity %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_SelectBasics_SensitiveEntity;
class Handle_SelectBasics_SensitiveEntity : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_SelectBasics_SensitiveEntity();
        Handle_SelectBasics_SensitiveEntity(const Handle_SelectBasics_SensitiveEntity &aHandle);
        Handle_SelectBasics_SensitiveEntity(const SelectBasics_SensitiveEntity *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_SelectBasics_SensitiveEntity DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_SelectBasics_SensitiveEntity {
    SelectBasics_SensitiveEntity* _get_reference() {
    return (SelectBasics_SensitiveEntity*)$self->Access();
    }
};

%extend Handle_SelectBasics_SensitiveEntity {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend SelectBasics_SensitiveEntity {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
