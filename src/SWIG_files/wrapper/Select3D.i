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
%module (package="OCC") Select3D

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


%include Select3D_headers.i


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
typedef NCollection_Sequence <Handle_Select3D_SensitiveEntity> Select3D_EntitySequence;
typedef NCollection_Sequence <Handle_Select3D_SensitiveEntity>::Iterator Select3D_EntitySequenceIter;
typedef NCollection_Vec3 <Standard_Real> Select3D_Vec3;
typedef NCollection_Vector <Handle_Select3D_SensitivePoly> Select3D_VectorOfHPoly;
typedef BVH_Box <Standard_Real , 3> Select3D_BndBox3d;
/* end typedefs declaration */

/* public enums */
enum Select3D_TypeOfSensitivity {
	Select3D_TOS_INTERIOR = 0,
	Select3D_TOS_BOUNDARY = 1,
};

/* end public enums declaration */

%nodefaultctor Select3D_Pnt;
class Select3D_Pnt {
	public:
		Standard_ShortReal x;
		Standard_ShortReal y;
		Standard_ShortReal z;
		%feature("compactdefaultargs") operator gp_Pnt;
		%feature("autodoc", "	:rtype: inline
") operator gp_Pnt;
		inline operator gp_Pnt ();
		%feature("compactdefaultargs") operator gp_XYZ;
		%feature("autodoc", "	:rtype: inline
") operator gp_XYZ;
		inline operator gp_XYZ ();
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param thePnt:
	:type thePnt: gp_Pnt
	:rtype: inline gp_Pnt
") operator =;
		inline gp_Pnt operator = (const gp_Pnt & thePnt);
};


%extend Select3D_Pnt {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Select3D_PointData;
class Select3D_PointData {
	public:
		%feature("compactdefaultargs") Select3D_PointData;
		%feature("autodoc", "	:param theNbPoints:
	:type theNbPoints: int
	:rtype: None
") Select3D_PointData;
		 Select3D_PointData (const Standard_Integer theNbPoints);
		%feature("compactdefaultargs") SetPnt;
		%feature("autodoc", "	:param theIndex:
	:type theIndex: int
	:param theValue:
	:type theValue: Select3D_Pnt &
	:rtype: None
") SetPnt;
		void SetPnt (const Standard_Integer theIndex,const Select3D_Pnt & theValue);
		%feature("compactdefaultargs") SetPnt;
		%feature("autodoc", "	:param theIndex:
	:type theIndex: int
	:param theValue:
	:type theValue: gp_Pnt
	:rtype: None
") SetPnt;
		void SetPnt (const Standard_Integer theIndex,const gp_Pnt & theValue);
		%feature("compactdefaultargs") Pnt;
		%feature("autodoc", "	:param theIndex:
	:type theIndex: int
	:rtype: Select3D_Pnt
") Pnt;
		Select3D_Pnt Pnt (const Standard_Integer theIndex);
		%feature("compactdefaultargs") Pnt3d;
		%feature("autodoc", "	:param theIndex:
	:type theIndex: int
	:rtype: gp_Pnt
") Pnt3d;
		gp_Pnt Pnt3d (const Standard_Integer theIndex);
		%feature("compactdefaultargs") Size;
		%feature("autodoc", "	:rtype: int
") Size;
		Standard_Integer Size ();
};


%extend Select3D_PointData {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Select3D_SensitiveBox;
class Select3D_SensitiveBox : public Select3D_SensitiveEntity {
	public:
		%feature("compactdefaultargs") Select3D_SensitiveBox;
		%feature("autodoc", "	* Constructs a sensitive box object defined by the owner theOwnerId, and the box theBox.

	:param theOwnerId:
	:type theOwnerId: Handle_SelectBasics_EntityOwner &
	:param theBox:
	:type theBox: Bnd_Box &
	:rtype: None
") Select3D_SensitiveBox;
		 Select3D_SensitiveBox (const Handle_SelectBasics_EntityOwner & theOwnerId,const Bnd_Box & theBox);
		%feature("compactdefaultargs") Select3D_SensitiveBox;
		%feature("autodoc", "	* Constructs a sensitive box object defined by the owner theOwnerId, and the coordinates theXmin, theYMin, theZMin, theXMax, theYMax, theZMax. theXmin, theYMin and theZMin define the minimum point in the front lower left hand corner of the box, and theXMax, theYMax and theZMax define the maximum point in the back upper right hand corner of the box.

	:param theOwnerId:
	:type theOwnerId: Handle_SelectBasics_EntityOwner &
	:param theXMin:
	:type theXMin: float
	:param theYMin:
	:type theYMin: float
	:param theZMin:
	:type theZMin: float
	:param theXMax:
	:type theXMax: float
	:param theYMax:
	:type theYMax: float
	:param theZMax:
	:type theZMax: float
	:rtype: None
") Select3D_SensitiveBox;
		 Select3D_SensitiveBox (const Handle_SelectBasics_EntityOwner & theOwnerId,const Standard_Real theXMin,const Standard_Real theYMin,const Standard_Real theZMin,const Standard_Real theXMax,const Standard_Real theYMax,const Standard_Real theZMax);
		%feature("compactdefaultargs") NbSubElements;
		%feature("autodoc", "	* Returns the amount of sub-entities in sensitive

	:rtype: int
") NbSubElements;
		virtual Standard_Integer NbSubElements ();
		%feature("compactdefaultargs") GetConnected;
		%feature("autodoc", "	:rtype: Handle_Select3D_SensitiveEntity
") GetConnected;
		virtual Handle_Select3D_SensitiveEntity GetConnected ();
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "	* Checks whether the box overlaps current selecting volume

	:param theMgr:
	:type theMgr: SelectBasics_SelectingVolumeManager &
	:param thePickResult:
	:type thePickResult: SelectBasics_PickResult &
	:rtype: bool
") Matches;
		virtual Standard_Boolean Matches (SelectBasics_SelectingVolumeManager & theMgr,SelectBasics_PickResult & thePickResult);
		%feature("compactdefaultargs") CenterOfGeometry;
		%feature("autodoc", "	* Returns center of the box. If location transformation is set, it will be applied

	:rtype: gp_Pnt
") CenterOfGeometry;
		virtual gp_Pnt CenterOfGeometry ();
		%feature("compactdefaultargs") BoundingBox;
		%feature("autodoc", "	* Returns coordinates of the box. If location transformation is set, it will be applied

	:rtype: Select3D_BndBox3d
") BoundingBox;
		virtual Select3D_BndBox3d BoundingBox ();
};


%extend Select3D_SensitiveBox {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Select3D_SensitiveBox(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Select3D_SensitiveBox::Handle_Select3D_SensitiveBox %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Select3D_SensitiveBox;
class Handle_Select3D_SensitiveBox : public Handle_Select3D_SensitiveEntity {

    public:
        // constructors
        Handle_Select3D_SensitiveBox();
        Handle_Select3D_SensitiveBox(const Handle_Select3D_SensitiveBox &aHandle);
        Handle_Select3D_SensitiveBox(const Select3D_SensitiveBox *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Select3D_SensitiveBox DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Select3D_SensitiveBox {
    Select3D_SensitiveBox* _get_reference() {
    return (Select3D_SensitiveBox*)$self->Access();
    }
};

%extend Handle_Select3D_SensitiveBox {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Select3D_SensitiveBox {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Select3D_SensitiveFace;
class Select3D_SensitiveFace : public Select3D_SensitiveEntity {
	public:
		%feature("compactdefaultargs") Select3D_SensitiveFace;
		%feature("autodoc", "	* Constructs a sensitive face object defined by the owner theOwnerId, the array of points thePoints, and the sensitivity type theType. The array of points is the outer polygon of the geometric face.

	:param theOwnerId:
	:type theOwnerId: Handle_SelectBasics_EntityOwner &
	:param thePoints:
	:type thePoints: TColgp_Array1OfPnt
	:param theType:
	:type theType: Select3D_TypeOfSensitivity
	:rtype: None
") Select3D_SensitiveFace;
		 Select3D_SensitiveFace (const Handle_SelectBasics_EntityOwner & theOwnerId,const TColgp_Array1OfPnt & thePoints,const Select3D_TypeOfSensitivity theType);
		%feature("compactdefaultargs") Select3D_SensitiveFace;
		%feature("autodoc", "	* Constructs a sensitive face object defined by the owner theOwnerId, the array of points thePoints, and the sensitivity type theType. The array of points is the outer polygon of the geometric face.

	:param theOwnerId:
	:type theOwnerId: Handle_SelectBasics_EntityOwner &
	:param thePoints:
	:type thePoints: Handle_TColgp_HArray1OfPnt
	:param theType:
	:type theType: Select3D_TypeOfSensitivity
	:rtype: None
") Select3D_SensitiveFace;
		 Select3D_SensitiveFace (const Handle_SelectBasics_EntityOwner & theOwnerId,const Handle_TColgp_HArray1OfPnt & thePoints,const Select3D_TypeOfSensitivity theType);
		%feature("compactdefaultargs") GetPoints;
		%feature("autodoc", "	* Initializes the given array theHArrayOfPnt by 3d coordinates of vertices of the face

	:param theHArrayOfPnt:
	:type theHArrayOfPnt: Handle_TColgp_HArray1OfPnt
	:rtype: None
") GetPoints;
		void GetPoints (Handle_TColgp_HArray1OfPnt & theHArrayOfPnt);
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "	* Checks whether the face overlaps current selecting volume

	:param theMgr:
	:type theMgr: SelectBasics_SelectingVolumeManager &
	:param thePickResult:
	:type thePickResult: SelectBasics_PickResult &
	:rtype: bool
") Matches;
		virtual Standard_Boolean Matches (SelectBasics_SelectingVolumeManager & theMgr,SelectBasics_PickResult & thePickResult);
		%feature("compactdefaultargs") GetConnected;
		%feature("autodoc", "	:rtype: Handle_Select3D_SensitiveEntity
") GetConnected;
		virtual Handle_Select3D_SensitiveEntity GetConnected ();
		%feature("compactdefaultargs") BoundingBox;
		%feature("autodoc", "	* Returns bounding box of the face. If location transformation is set, it will be applied

	:rtype: Select3D_BndBox3d
") BoundingBox;
		virtual Select3D_BndBox3d BoundingBox ();
		%feature("compactdefaultargs") CenterOfGeometry;
		%feature("autodoc", "	* Returns center of the face. If location transformation is set, it will be applied

	:rtype: gp_Pnt
") CenterOfGeometry;
		virtual gp_Pnt CenterOfGeometry ();
		%feature("compactdefaultargs") BVH;
		%feature("autodoc", "	* Builds BVH tree for the face

	:rtype: void
") BVH;
		virtual void BVH ();
		%feature("compactdefaultargs") NbSubElements;
		%feature("autodoc", "	* Returns the amount of sub-entities (points or planar convex polygons)

	:rtype: int
") NbSubElements;
		virtual Standard_Integer NbSubElements ();
};


%extend Select3D_SensitiveFace {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Select3D_SensitiveFace(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Select3D_SensitiveFace::Handle_Select3D_SensitiveFace %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Select3D_SensitiveFace;
class Handle_Select3D_SensitiveFace : public Handle_Select3D_SensitiveEntity {

    public:
        // constructors
        Handle_Select3D_SensitiveFace();
        Handle_Select3D_SensitiveFace(const Handle_Select3D_SensitiveFace &aHandle);
        Handle_Select3D_SensitiveFace(const Select3D_SensitiveFace *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Select3D_SensitiveFace DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Select3D_SensitiveFace {
    Select3D_SensitiveFace* _get_reference() {
    return (Select3D_SensitiveFace*)$self->Access();
    }
};

%extend Handle_Select3D_SensitiveFace {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Select3D_SensitiveFace {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Select3D_SensitivePoint;
class Select3D_SensitivePoint : public Select3D_SensitiveEntity {
	public:
		%feature("compactdefaultargs") Select3D_SensitivePoint;
		%feature("autodoc", "	* Constructs a sensitive point object defined by the owner OwnerId and the point Point.

	:param theOwnerId:
	:type theOwnerId: Handle_SelectBasics_EntityOwner &
	:param thePoint:
	:type thePoint: gp_Pnt
	:rtype: None
") Select3D_SensitivePoint;
		 Select3D_SensitivePoint (const Handle_SelectBasics_EntityOwner & theOwnerId,const gp_Pnt & thePoint);
		%feature("compactdefaultargs") NbSubElements;
		%feature("autodoc", "	* Returns the amount of sub-entities in sensitive

	:rtype: int
") NbSubElements;
		virtual Standard_Integer NbSubElements ();
		%feature("compactdefaultargs") GetConnected;
		%feature("autodoc", "	:rtype: Handle_Select3D_SensitiveEntity
") GetConnected;
		virtual Handle_Select3D_SensitiveEntity GetConnected ();
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "	* Checks whether the point overlaps current selecting volume

	:param theMgr:
	:type theMgr: SelectBasics_SelectingVolumeManager &
	:param thePickResult:
	:type thePickResult: SelectBasics_PickResult &
	:rtype: bool
") Matches;
		virtual Standard_Boolean Matches (SelectBasics_SelectingVolumeManager & theMgr,SelectBasics_PickResult & thePickResult);
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "	* Returns the point used at the time of construction.

	:rtype: gp_Pnt
") Point;
		gp_Pnt Point ();
		%feature("compactdefaultargs") CenterOfGeometry;
		%feature("autodoc", "	* Returns center of point. If location transformation is set, it will be applied

	:rtype: gp_Pnt
") CenterOfGeometry;
		virtual gp_Pnt CenterOfGeometry ();
		%feature("compactdefaultargs") BoundingBox;
		%feature("autodoc", "	* Returns bounding box of the point. If location transformation is set, it will be applied

	:rtype: Select3D_BndBox3d
") BoundingBox;
		virtual Select3D_BndBox3d BoundingBox ();
};


%extend Select3D_SensitivePoint {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Select3D_SensitivePoint(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Select3D_SensitivePoint::Handle_Select3D_SensitivePoint %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Select3D_SensitivePoint;
class Handle_Select3D_SensitivePoint : public Handle_Select3D_SensitiveEntity {

    public:
        // constructors
        Handle_Select3D_SensitivePoint();
        Handle_Select3D_SensitivePoint(const Handle_Select3D_SensitivePoint &aHandle);
        Handle_Select3D_SensitivePoint(const Select3D_SensitivePoint *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Select3D_SensitivePoint DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Select3D_SensitivePoint {
    Select3D_SensitivePoint* _get_reference() {
    return (Select3D_SensitivePoint*)$self->Access();
    }
};

%extend Handle_Select3D_SensitivePoint {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Select3D_SensitivePoint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Select3D_SensitiveSegment;
class Select3D_SensitiveSegment : public Select3D_SensitiveEntity {
	public:
		%feature("compactdefaultargs") Select3D_SensitiveSegment;
		%feature("autodoc", "	* Constructs the sensitive segment object defined by the owner theOwnerId, the points theFirstPnt, theLastPnt

	:param theOwnerId:
	:type theOwnerId: Handle_SelectBasics_EntityOwner &
	:param theFirstPnt:
	:type theFirstPnt: gp_Pnt
	:param theLastPnt:
	:type theLastPnt: gp_Pnt
	:rtype: None
") Select3D_SensitiveSegment;
		 Select3D_SensitiveSegment (const Handle_SelectBasics_EntityOwner & theOwnerId,const gp_Pnt & theFirstPnt,const gp_Pnt & theLastPnt);
		%feature("compactdefaultargs") StartPoint;
		%feature("autodoc", "	* changes the start Point of the Segment;

	:param thePnt:
	:type thePnt: gp_Pnt
	:rtype: None
") StartPoint;
		void StartPoint (const gp_Pnt & thePnt);
		%feature("compactdefaultargs") EndPoint;
		%feature("autodoc", "	* changes the end point of the segment

	:param thePnt:
	:type thePnt: gp_Pnt
	:rtype: None
") EndPoint;
		void EndPoint (const gp_Pnt & thePnt);
		%feature("compactdefaultargs") StartPoint;
		%feature("autodoc", "	* gives the 3D start Point of the Segment

	:rtype: gp_Pnt
") StartPoint;
		gp_Pnt StartPoint ();
		%feature("compactdefaultargs") EndPoint;
		%feature("autodoc", "	* gives the 3D End Point of the Segment

	:rtype: gp_Pnt
") EndPoint;
		gp_Pnt EndPoint ();
		%feature("compactdefaultargs") NbSubElements;
		%feature("autodoc", "	* Returns the amount of points

	:rtype: int
") NbSubElements;
		virtual Standard_Integer NbSubElements ();
		%feature("compactdefaultargs") GetConnected;
		%feature("autodoc", "	:rtype: Handle_Select3D_SensitiveEntity
") GetConnected;
		virtual Handle_Select3D_SensitiveEntity GetConnected ();
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "	* Checks whether the segment overlaps current selecting volume

	:param theMgr:
	:type theMgr: SelectBasics_SelectingVolumeManager &
	:param thePickResult:
	:type thePickResult: SelectBasics_PickResult &
	:rtype: bool
") Matches;
		virtual Standard_Boolean Matches (SelectBasics_SelectingVolumeManager & theMgr,SelectBasics_PickResult & thePickResult);
		%feature("compactdefaultargs") CenterOfGeometry;
		%feature("autodoc", "	* Returns center of the segment. If location transformation is set, it will be applied

	:rtype: gp_Pnt
") CenterOfGeometry;
		virtual gp_Pnt CenterOfGeometry ();
		%feature("compactdefaultargs") BoundingBox;
		%feature("autodoc", "	* Returns bounding box of the segment. If location transformation is set, it will be applied

	:rtype: Select3D_BndBox3d
") BoundingBox;
		virtual Select3D_BndBox3d BoundingBox ();
};


%extend Select3D_SensitiveSegment {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Select3D_SensitiveSegment(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Select3D_SensitiveSegment::Handle_Select3D_SensitiveSegment %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Select3D_SensitiveSegment;
class Handle_Select3D_SensitiveSegment : public Handle_Select3D_SensitiveEntity {

    public:
        // constructors
        Handle_Select3D_SensitiveSegment();
        Handle_Select3D_SensitiveSegment(const Handle_Select3D_SensitiveSegment &aHandle);
        Handle_Select3D_SensitiveSegment(const Select3D_SensitiveSegment *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Select3D_SensitiveSegment DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Select3D_SensitiveSegment {
    Select3D_SensitiveSegment* _get_reference() {
    return (Select3D_SensitiveSegment*)$self->Access();
    }
};

%extend Handle_Select3D_SensitiveSegment {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Select3D_SensitiveSegment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Select3D_SensitiveSet;
class Select3D_SensitiveSet : public Select3D_SensitiveEntity {
	public:
		%feature("compactdefaultargs") Size;
		%feature("autodoc", "	* Returns the amount of sub-entities of the complex entity

	:rtype: int
") Size;
		Standard_Integer Size ();
		%feature("compactdefaultargs") Box;
		%feature("autodoc", "	* Returns bounding box of sub-entity with index theIdx in sub-entity list

	:param theIdx:
	:type theIdx: int
	:rtype: Select3D_BndBox3d
") Box;
		Select3D_BndBox3d Box (const Standard_Integer theIdx);
		%feature("compactdefaultargs") Center;
		%feature("autodoc", "	* Returns geometry center of sensitive entity index theIdx along the given axis theAxis

	:param theIdx:
	:type theIdx: int
	:param theAxis:
	:type theAxis: int
	:rtype: float
") Center;
		Standard_Real Center (const Standard_Integer theIdx,const Standard_Integer theAxis);
		%feature("compactdefaultargs") Swap;
		%feature("autodoc", "	* Swaps items with indexes theIdx1 and theIdx2

	:param theIdx1:
	:type theIdx1: int
	:param theIdx2:
	:type theIdx2: int
	:rtype: None
") Swap;
		void Swap (const Standard_Integer theIdx1,const Standard_Integer theIdx2);
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "	* Checks whether one or more entities of the set overlap current selecting volume. Implements the traverse of BVH tree built for the set

	:param theMgr:
	:type theMgr: SelectBasics_SelectingVolumeManager &
	:param thePickResult:
	:type thePickResult: SelectBasics_PickResult &
	:rtype: bool
") Matches;
		virtual Standard_Boolean Matches (SelectBasics_SelectingVolumeManager & theMgr,SelectBasics_PickResult & thePickResult);
		%feature("compactdefaultargs") BVH;
		%feature("autodoc", "	* Builds BVH tree for sensitive set. Must be called manually to build BVH tree for any sensitive set in case if its content was initialized not in a constructor, but element by element

	:rtype: None
") BVH;
		void BVH ();
		%feature("compactdefaultargs") MarkDirty;
		%feature("autodoc", "	* Marks BVH tree of the set as outdated. It will be rebuild at the next call of BVH()

	:rtype: None
") MarkDirty;
		void MarkDirty ();
		%feature("compactdefaultargs") BoundingBox;
		%feature("autodoc", "	* Returns bounding box of the whole set. This method should be redefined in Select3D_SensitiveSet descendants

	:rtype: Select3D_BndBox3d
") BoundingBox;
		virtual Select3D_BndBox3d BoundingBox ();
		%feature("compactdefaultargs") CenterOfGeometry;
		%feature("autodoc", "	* Returns center of the whole set. This method should be redefined in Select3D_SensitiveSet descendants

	:rtype: gp_Pnt
") CenterOfGeometry;
		virtual gp_Pnt CenterOfGeometry ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	* Destroys cross-reference to avoid memory leak

	:rtype: void
") Clear;
		virtual void Clear ();
		%feature("compactdefaultargs") GetLeafNodeSize;
		%feature("autodoc", "	* Returns a number of nodes in 1 BVH leaf

	:rtype: int
") GetLeafNodeSize;
		Standard_Integer GetLeafNodeSize ();
};


%extend Select3D_SensitiveSet {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Select3D_SensitiveSet(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Select3D_SensitiveSet::Handle_Select3D_SensitiveSet %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Select3D_SensitiveSet;
class Handle_Select3D_SensitiveSet : public Handle_Select3D_SensitiveEntity {

    public:
        // constructors
        Handle_Select3D_SensitiveSet();
        Handle_Select3D_SensitiveSet(const Handle_Select3D_SensitiveSet &aHandle);
        Handle_Select3D_SensitiveSet(const Select3D_SensitiveSet *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Select3D_SensitiveSet DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Select3D_SensitiveSet {
    Select3D_SensitiveSet* _get_reference() {
    return (Select3D_SensitiveSet*)$self->Access();
    }
};

%extend Handle_Select3D_SensitiveSet {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Select3D_SensitiveSet {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Select3D_SensitiveTriangle;
class Select3D_SensitiveTriangle : public Select3D_SensitiveEntity {
	public:
		%feature("compactdefaultargs") Select3D_SensitiveTriangle;
		%feature("autodoc", "	* Constructs a sensitive triangle object defined by the owner theOwnerId, the points P1, P2, P3, and the type of sensitivity Sensitivity.

	:param theOwnerId:
	:type theOwnerId: Handle_SelectBasics_EntityOwner &
	:param thePnt0:
	:type thePnt0: gp_Pnt
	:param thePnt1:
	:type thePnt1: gp_Pnt
	:param thePnt2:
	:type thePnt2: gp_Pnt
	:param theType: default value is Select3D_TOS_INTERIOR
	:type theType: Select3D_TypeOfSensitivity
	:rtype: None
") Select3D_SensitiveTriangle;
		 Select3D_SensitiveTriangle (const Handle_SelectBasics_EntityOwner & theOwnerId,const gp_Pnt & thePnt0,const gp_Pnt & thePnt1,const gp_Pnt & thePnt2,const Select3D_TypeOfSensitivity theType = Select3D_TOS_INTERIOR);
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "	* Checks whether the triangle overlaps current selecting volume

	:param theMgr:
	:type theMgr: SelectBasics_SelectingVolumeManager &
	:param thePickResult:
	:type thePickResult: SelectBasics_PickResult &
	:rtype: bool
") Matches;
		virtual Standard_Boolean Matches (SelectBasics_SelectingVolumeManager & theMgr,SelectBasics_PickResult & thePickResult);
		%feature("compactdefaultargs") Points3D;
		%feature("autodoc", "	* Returns the 3D points P1, P2, P3 used at the time of construction.

	:param thePnt0:
	:type thePnt0: gp_Pnt
	:param thePnt1:
	:type thePnt1: gp_Pnt
	:param thePnt2:
	:type thePnt2: gp_Pnt
	:rtype: None
") Points3D;
		void Points3D (gp_Pnt & thePnt0,gp_Pnt & thePnt1,gp_Pnt & thePnt2);
		%feature("compactdefaultargs") Center3D;
		%feature("autodoc", "	* Returns the center point of the sensitive triangle created at construction time.

	:rtype: gp_Pnt
") Center3D;
		gp_Pnt Center3D ();
		%feature("compactdefaultargs") GetConnected;
		%feature("autodoc", "	* Returns the copy of this

	:rtype: Handle_Select3D_SensitiveEntity
") GetConnected;
		virtual Handle_Select3D_SensitiveEntity GetConnected ();
		%feature("compactdefaultargs") BoundingBox;
		%feature("autodoc", "	* Returns bounding box of the triangle. If location transformation is set, it will be applied

	:rtype: Select3D_BndBox3d
") BoundingBox;
		virtual Select3D_BndBox3d BoundingBox ();
		%feature("compactdefaultargs") NbSubElements;
		%feature("autodoc", "	* Returns the amount of points

	:rtype: int
") NbSubElements;
		Standard_Integer NbSubElements ();
		%feature("compactdefaultargs") CenterOfGeometry;
		%feature("autodoc", "	:rtype: gp_Pnt
") CenterOfGeometry;
		gp_Pnt CenterOfGeometry ();
};


%extend Select3D_SensitiveTriangle {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Select3D_SensitiveTriangle(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Select3D_SensitiveTriangle::Handle_Select3D_SensitiveTriangle %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Select3D_SensitiveTriangle;
class Handle_Select3D_SensitiveTriangle : public Handle_Select3D_SensitiveEntity {

    public:
        // constructors
        Handle_Select3D_SensitiveTriangle();
        Handle_Select3D_SensitiveTriangle(const Handle_Select3D_SensitiveTriangle &aHandle);
        Handle_Select3D_SensitiveTriangle(const Select3D_SensitiveTriangle *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Select3D_SensitiveTriangle DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Select3D_SensitiveTriangle {
    Select3D_SensitiveTriangle* _get_reference() {
    return (Select3D_SensitiveTriangle*)$self->Access();
    }
};

%extend Handle_Select3D_SensitiveTriangle {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Select3D_SensitiveTriangle {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Select3D_InteriorSensitivePointSet;
class Select3D_InteriorSensitivePointSet : public Select3D_SensitiveSet {
	public:
		%feature("compactdefaultargs") Select3D_InteriorSensitivePointSet;
		%feature("autodoc", "	* Splits the given point set thePoints onto planar convex polygons

	:param theOwnerId:
	:type theOwnerId: Handle_SelectBasics_EntityOwner &
	:param thePoints:
	:type thePoints: TColgp_Array1OfPnt
	:rtype: None
") Select3D_InteriorSensitivePointSet;
		 Select3D_InteriorSensitivePointSet (const Handle_SelectBasics_EntityOwner & theOwnerId,const TColgp_Array1OfPnt & thePoints);
		%feature("compactdefaultargs") GetPoints;
		%feature("autodoc", "	* Initializes the given array theHArrayOfPnt by 3d coordinates of vertices of the whole point set

	:param theHArrayOfPnt:
	:type theHArrayOfPnt: Handle_TColgp_HArray1OfPnt
	:rtype: void
") GetPoints;
		virtual void GetPoints (Handle_TColgp_HArray1OfPnt & theHArrayOfPnt);
		%feature("compactdefaultargs") Size;
		%feature("autodoc", "	* Returns the length of vector of planar convex polygons

	:rtype: int
") Size;
		virtual Standard_Integer Size ();
		%feature("compactdefaultargs") Box;
		%feature("autodoc", "	* Returns bounding box of planar convex polygon with index theIdx

	:param theIdx:
	:type theIdx: int
	:rtype: Select3D_BndBox3d
") Box;
		virtual Select3D_BndBox3d Box (const Standard_Integer theIdx);
		%feature("compactdefaultargs") Center;
		%feature("autodoc", "	* Returns geometry center of planar convex polygon with index theIdx in the vector along the given axis theAxis

	:param theIdx:
	:type theIdx: int
	:param theAxis:
	:type theAxis: int
	:rtype: float
") Center;
		virtual Standard_Real Center (const Standard_Integer theIdx,const Standard_Integer theAxis);
		%feature("compactdefaultargs") Swap;
		%feature("autodoc", "	* Swaps items with indexes theIdx1 and theIdx2 in the vector

	:param theIdx1:
	:type theIdx1: int
	:param theIdx2:
	:type theIdx2: int
	:rtype: void
") Swap;
		virtual void Swap (const Standard_Integer theIdx1,const Standard_Integer theIdx2);
		%feature("compactdefaultargs") BoundingBox;
		%feature("autodoc", "	* Returns bounding box of the point set. If location transformation is set, it will be applied

	:rtype: Select3D_BndBox3d
") BoundingBox;
		virtual Select3D_BndBox3d BoundingBox ();
		%feature("compactdefaultargs") CenterOfGeometry;
		%feature("autodoc", "	* Returns center of the point set. If location transformation is set, it will be applied

	:rtype: gp_Pnt
") CenterOfGeometry;
		virtual gp_Pnt CenterOfGeometry ();
		%feature("compactdefaultargs") NbSubElements;
		%feature("autodoc", "	* Returns the amount of points in set

	:rtype: int
") NbSubElements;
		virtual Standard_Integer NbSubElements ();
};


%extend Select3D_InteriorSensitivePointSet {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Select3D_InteriorSensitivePointSet(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Select3D_InteriorSensitivePointSet::Handle_Select3D_InteriorSensitivePointSet %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Select3D_InteriorSensitivePointSet;
class Handle_Select3D_InteriorSensitivePointSet : public Handle_Select3D_SensitiveSet {

    public:
        // constructors
        Handle_Select3D_InteriorSensitivePointSet();
        Handle_Select3D_InteriorSensitivePointSet(const Handle_Select3D_InteriorSensitivePointSet &aHandle);
        Handle_Select3D_InteriorSensitivePointSet(const Select3D_InteriorSensitivePointSet *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Select3D_InteriorSensitivePointSet DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Select3D_InteriorSensitivePointSet {
    Select3D_InteriorSensitivePointSet* _get_reference() {
    return (Select3D_InteriorSensitivePointSet*)$self->Access();
    }
};

%extend Handle_Select3D_InteriorSensitivePointSet {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Select3D_InteriorSensitivePointSet {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Select3D_SensitiveGroup;
class Select3D_SensitiveGroup : public Select3D_SensitiveSet {
	public:
		%feature("compactdefaultargs") Select3D_SensitiveGroup;
		%feature("autodoc", "	* Constructs an empty sensitive group object. This is a set of sensitive 3D entities. The sensitive entities will be defined using the function Add to fill the entity owner OwnerId. If MatchAll is false, nothing can be added.

	:param theOwnerId:
	:type theOwnerId: Handle_SelectBasics_EntityOwner &
	:param theIsMustMatchAll: default value is Standard_True
	:type theIsMustMatchAll: bool
	:rtype: None
") Select3D_SensitiveGroup;
		 Select3D_SensitiveGroup (const Handle_SelectBasics_EntityOwner & theOwnerId,const Standard_Boolean theIsMustMatchAll = Standard_True);
		%feature("compactdefaultargs") Select3D_SensitiveGroup;
		%feature("autodoc", "	* Constructs a sensitive group object defined by the list TheList and the entity owner OwnerId. If MatchAll is false, nothing is done.

	:param theOwnerId:
	:type theOwnerId: Handle_SelectBasics_EntityOwner &
	:param theEntities:
	:type theEntities: Select3D_EntitySequence &
	:param theIsMustMatchAll: default value is Standard_True
	:type theIsMustMatchAll: bool
	:rtype: None
") Select3D_SensitiveGroup;
		 Select3D_SensitiveGroup (const Handle_SelectBasics_EntityOwner & theOwnerId,Select3D_EntitySequence & theEntities,const Standard_Boolean theIsMustMatchAll = Standard_True);
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* Adds the list of sensitive entities LL to the empty sensitive group object created at construction time.

	:param theEntities:
	:type theEntities: Select3D_EntitySequence &
	:rtype: None
") Add;
		void Add (Select3D_EntitySequence & theEntities);
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* Adds the sensitive entity aSensitive to the non-empty sensitive group object created at construction time.

	:param theSensitive:
	:type theSensitive: Handle_Select3D_SensitiveEntity &
	:rtype: None
") Add;
		void Add (const Handle_Select3D_SensitiveEntity & theSensitive);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param theSensitive:
	:type theSensitive: Handle_Select3D_SensitiveEntity &
	:rtype: None
") Remove;
		void Remove (const Handle_Select3D_SensitiveEntity & theSensitive);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	* Removes all sensitive entities from the list used at the time of construction, or added using the function Add.

	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") IsIn;
		%feature("autodoc", "	* Returns true if the sensitive entity aSensitive is in the list used at the time of construction, or added using the function Add.

	:param theSensitive:
	:type theSensitive: Handle_Select3D_SensitiveEntity &
	:rtype: bool
") IsIn;
		Standard_Boolean IsIn (const Handle_Select3D_SensitiveEntity & theSensitive);
		%feature("compactdefaultargs") SetMatchType;
		%feature("autodoc", "	* Sets the requirement that all sensitive entities in the list used at the time of construction, or added using the function Add must be matched.

	:param theIsMustMatchAll:
	:type theIsMustMatchAll: bool
	:rtype: None
") SetMatchType;
		void SetMatchType (const Standard_Boolean theIsMustMatchAll);
		%feature("compactdefaultargs") MustMatchAll;
		%feature("autodoc", "	* Returns true if all sensitive entities in the list used at the time of construction, or added using the function Add must be matched.

	:rtype: bool
") MustMatchAll;
		Standard_Boolean MustMatchAll ();
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "	* Checks whether the group overlaps current selecting volume

	:param theMgr:
	:type theMgr: SelectBasics_SelectingVolumeManager &
	:param thePickResult:
	:type thePickResult: SelectBasics_PickResult &
	:rtype: bool
") Matches;
		virtual Standard_Boolean Matches (SelectBasics_SelectingVolumeManager & theMgr,SelectBasics_PickResult & thePickResult);
		%feature("compactdefaultargs") NbSubElements;
		%feature("autodoc", "	* Returns the amount of sub-entities

	:rtype: int
") NbSubElements;
		virtual Standard_Integer NbSubElements ();
		%feature("compactdefaultargs") GetConnected;
		%feature("autodoc", "	:rtype: Handle_Select3D_SensitiveEntity
") GetConnected;
		virtual Handle_Select3D_SensitiveEntity GetConnected ();
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Sets the owner for all entities in group

	:param theOwnerId:
	:type theOwnerId: Handle_SelectBasics_EntityOwner &
	:rtype: None
") Set;
		void Set (const Handle_SelectBasics_EntityOwner & theOwnerId);
		%feature("compactdefaultargs") GetEntities;
		%feature("autodoc", "	* Gets group content

	:rtype: Select3D_EntitySequence
") GetEntities;
		const Select3D_EntitySequence & GetEntities ();
		%feature("compactdefaultargs") BoundingBox;
		%feature("autodoc", "	* Returns bounding box of the group. If location transformation is set, it will be applied

	:rtype: Select3D_BndBox3d
") BoundingBox;
		virtual Select3D_BndBox3d BoundingBox ();
		%feature("compactdefaultargs") CenterOfGeometry;
		%feature("autodoc", "	* Returns center of entity set. If location transformation is set, it will be applied

	:rtype: gp_Pnt
") CenterOfGeometry;
		virtual gp_Pnt CenterOfGeometry ();
		%feature("compactdefaultargs") Box;
		%feature("autodoc", "	* Returns bounding box of sensitive entity with index theIdx

	:param theIdx:
	:type theIdx: int
	:rtype: Select3D_BndBox3d
") Box;
		virtual Select3D_BndBox3d Box (const Standard_Integer theIdx);
		%feature("compactdefaultargs") Center;
		%feature("autodoc", "	* Returns geometry center of sensitive entity index theIdx in the vector along the given axis theAxis

	:param theIdx:
	:type theIdx: int
	:param theAxis:
	:type theAxis: int
	:rtype: float
") Center;
		virtual Standard_Real Center (const Standard_Integer theIdx,const Standard_Integer theAxis);
		%feature("compactdefaultargs") Swap;
		%feature("autodoc", "	* Swaps items with indexes theIdx1 and theIdx2 in the vector

	:param theIdx1:
	:type theIdx1: int
	:param theIdx2:
	:type theIdx2: int
	:rtype: void
") Swap;
		virtual void Swap (const Standard_Integer theIdx1,const Standard_Integer theIdx2);
		%feature("compactdefaultargs") Size;
		%feature("autodoc", "	* Returns the length of vector of sensitive entities

	:rtype: int
") Size;
		virtual Standard_Integer Size ();
};


%extend Select3D_SensitiveGroup {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Select3D_SensitiveGroup(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Select3D_SensitiveGroup::Handle_Select3D_SensitiveGroup %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Select3D_SensitiveGroup;
class Handle_Select3D_SensitiveGroup : public Handle_Select3D_SensitiveSet {

    public:
        // constructors
        Handle_Select3D_SensitiveGroup();
        Handle_Select3D_SensitiveGroup(const Handle_Select3D_SensitiveGroup &aHandle);
        Handle_Select3D_SensitiveGroup(const Select3D_SensitiveGroup *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Select3D_SensitiveGroup DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Select3D_SensitiveGroup {
    Select3D_SensitiveGroup* _get_reference() {
    return (Select3D_SensitiveGroup*)$self->Access();
    }
};

%extend Handle_Select3D_SensitiveGroup {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Select3D_SensitiveGroup {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Select3D_SensitivePoly;
class Select3D_SensitivePoly : public Select3D_SensitiveSet {
	public:
		%feature("compactdefaultargs") Select3D_SensitivePoly;
		%feature("autodoc", "	* Constructs a sensitive face object defined by the owner OwnerId, the array of points ThePoints, and the sensitivity type Sensitivity. The array of points is the outer polygon of the geometric face.

	:param theOwnerId:
	:type theOwnerId: Handle_SelectBasics_EntityOwner &
	:param thePoints:
	:type thePoints: TColgp_Array1OfPnt
	:param theIsBVHEnabled:
	:type theIsBVHEnabled: bool
	:rtype: None
") Select3D_SensitivePoly;
		 Select3D_SensitivePoly (const Handle_SelectBasics_EntityOwner & theOwnerId,const TColgp_Array1OfPnt & thePoints,const Standard_Boolean theIsBVHEnabled);
		%feature("compactdefaultargs") Select3D_SensitivePoly;
		%feature("autodoc", "	* Constructs a sensitive face object defined by the owner OwnerId, the array of points ThePoints, and the sensitivity type Sensitivity. The array of points is the outer polygon of the geometric face.

	:param theOwnerId:
	:type theOwnerId: Handle_SelectBasics_EntityOwner &
	:param thePoints:
	:type thePoints: Handle_TColgp_HArray1OfPnt
	:param theIsBVHEnabled:
	:type theIsBVHEnabled: bool
	:rtype: None
") Select3D_SensitivePoly;
		 Select3D_SensitivePoly (const Handle_SelectBasics_EntityOwner & theOwnerId,const Handle_TColgp_HArray1OfPnt & thePoints,const Standard_Boolean theIsBVHEnabled);
		%feature("compactdefaultargs") Select3D_SensitivePoly;
		%feature("autodoc", "	* Constructs the sensitive circle object defined by the owner OwnerId, the circle Circle, the Boolean FilledCircle and the number of points NbOfPoints.

	:param theOwnerId:
	:type theOwnerId: Handle_SelectBasics_EntityOwner &
	:param theIsBVHEnabled:
	:type theIsBVHEnabled: bool
	:param theNbPnts: default value is 6
	:type theNbPnts: int
	:rtype: None
") Select3D_SensitivePoly;
		 Select3D_SensitivePoly (const Handle_SelectBasics_EntityOwner & theOwnerId,const Standard_Boolean theIsBVHEnabled,const Standard_Integer theNbPnts = 6);
		%feature("compactdefaultargs") NbSubElements;
		%feature("autodoc", "	* Returns the amount of segments in poly

	:rtype: int
") NbSubElements;
		virtual Standard_Integer NbSubElements ();
		%feature("compactdefaultargs") Points3D;
		%feature("autodoc", "	* Returns the 3D points of the array used at construction time.

	:param theHArrayOfPnt:
	:type theHArrayOfPnt: Handle_TColgp_HArray1OfPnt
	:rtype: None
") Points3D;
		void Points3D (Handle_TColgp_HArray1OfPnt & theHArrayOfPnt);
		%feature("compactdefaultargs") BoundingBox;
		%feature("autodoc", "	* Returns bounding box of a polygon. If location transformation is set, it will be applied

	:rtype: Select3D_BndBox3d
") BoundingBox;
		virtual Select3D_BndBox3d BoundingBox ();
		%feature("compactdefaultargs") CenterOfGeometry;
		%feature("autodoc", "	* Returns center of the point set. If location transformation is set, it will be applied

	:rtype: gp_Pnt
") CenterOfGeometry;
		virtual gp_Pnt CenterOfGeometry ();
		%feature("compactdefaultargs") Size;
		%feature("autodoc", "	* Returns the amount of segments of the poly

	:rtype: int
") Size;
		virtual Standard_Integer Size ();
		%feature("compactdefaultargs") Box;
		%feature("autodoc", "	* Returns bounding box of segment with index theIdx

	:param theIdx:
	:type theIdx: int
	:rtype: Select3D_BndBox3d
") Box;
		virtual Select3D_BndBox3d Box (const Standard_Integer theIdx);
		%feature("compactdefaultargs") Center;
		%feature("autodoc", "	* Returns geometry center of sensitive entity index theIdx in the vector along the given axis theAxis

	:param theIdx:
	:type theIdx: int
	:param theAxis:
	:type theAxis: int
	:rtype: float
") Center;
		virtual Standard_Real Center (const Standard_Integer theIdx,const Standard_Integer theAxis);
		%feature("compactdefaultargs") Swap;
		%feature("autodoc", "	* Swaps items with indexes theIdx1 and theIdx2 in the vector

	:param theIdx1:
	:type theIdx1: int
	:param theIdx2:
	:type theIdx2: int
	:rtype: void
") Swap;
		virtual void Swap (const Standard_Integer theIdx1,const Standard_Integer theIdx2);
};


%extend Select3D_SensitivePoly {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Select3D_SensitivePoly(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Select3D_SensitivePoly::Handle_Select3D_SensitivePoly %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Select3D_SensitivePoly;
class Handle_Select3D_SensitivePoly : public Handle_Select3D_SensitiveSet {

    public:
        // constructors
        Handle_Select3D_SensitivePoly();
        Handle_Select3D_SensitivePoly(const Handle_Select3D_SensitivePoly &aHandle);
        Handle_Select3D_SensitivePoly(const Select3D_SensitivePoly *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Select3D_SensitivePoly DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Select3D_SensitivePoly {
    Select3D_SensitivePoly* _get_reference() {
    return (Select3D_SensitivePoly*)$self->Access();
    }
};

%extend Handle_Select3D_SensitivePoly {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Select3D_SensitivePoly {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Select3D_SensitiveWire;
class Select3D_SensitiveWire : public Select3D_SensitiveSet {
	public:
		%feature("compactdefaultargs") Select3D_SensitiveWire;
		%feature("autodoc", "	* Constructs a sensitive wire object defined by the owner theOwnerId

	:param theOwnerId:
	:type theOwnerId: Handle_SelectBasics_EntityOwner &
	:rtype: None
") Select3D_SensitiveWire;
		 Select3D_SensitiveWire (const Handle_SelectBasics_EntityOwner & theOwnerId);
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* Adds the sensitive entity theSensitive to this framework.

	:param theSensitive:
	:type theSensitive: Handle_Select3D_SensitiveEntity &
	:rtype: None
") Add;
		void Add (const Handle_Select3D_SensitiveEntity & theSensitive);
		%feature("compactdefaultargs") NbSubElements;
		%feature("autodoc", "	* Returns the amount of sub-entities

	:rtype: int
") NbSubElements;
		virtual Standard_Integer NbSubElements ();
		%feature("compactdefaultargs") GetConnected;
		%feature("autodoc", "	:rtype: Handle_Select3D_SensitiveEntity
") GetConnected;
		virtual Handle_Select3D_SensitiveEntity GetConnected ();
		%feature("compactdefaultargs") GetEdges;
		%feature("autodoc", "	* returns the sensitive edges stored in this wire

	:rtype: NCollection_Vector<Handle_Select3D_SensitiveEntity>
") GetEdges;
		const NCollection_Vector<Handle_Select3D_SensitiveEntity> & GetEdges ();
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Sets the owner for all entities in wire

	:param theOwnerId:
	:type theOwnerId: Handle_SelectBasics_EntityOwner &
	:rtype: None
") Set;
		void Set (const Handle_SelectBasics_EntityOwner & theOwnerId);
		%feature("compactdefaultargs") GetLastDetected;
		%feature("autodoc", "	:rtype: Handle_Select3D_SensitiveEntity
") GetLastDetected;
		Handle_Select3D_SensitiveEntity GetLastDetected ();
		%feature("compactdefaultargs") BoundingBox;
		%feature("autodoc", "	* Returns bounding box of the wire. If location transformation is set, it will be applied

	:rtype: Select3D_BndBox3d
") BoundingBox;
		virtual Select3D_BndBox3d BoundingBox ();
		%feature("compactdefaultargs") CenterOfGeometry;
		%feature("autodoc", "	* Returns center of the wire. If location transformation is set, it will be applied

	:rtype: gp_Pnt
") CenterOfGeometry;
		virtual gp_Pnt CenterOfGeometry ();
		%feature("compactdefaultargs") Size;
		%feature("autodoc", "	* Returns the length of vector of sensitive entities

	:rtype: int
") Size;
		virtual Standard_Integer Size ();
		%feature("compactdefaultargs") Box;
		%feature("autodoc", "	* Returns bounding box of sensitive entity with index theIdx

	:param theIdx:
	:type theIdx: int
	:rtype: Select3D_BndBox3d
") Box;
		virtual Select3D_BndBox3d Box (const Standard_Integer theIdx);
		%feature("compactdefaultargs") Center;
		%feature("autodoc", "	* Returns geometry center of sensitive entity index theIdx in the vector along the given axis theAxis

	:param theIdx:
	:type theIdx: int
	:param theAxis:
	:type theAxis: int
	:rtype: float
") Center;
		virtual Standard_Real Center (const Standard_Integer theIdx,const Standard_Integer theAxis);
		%feature("compactdefaultargs") Swap;
		%feature("autodoc", "	* Swaps items with indexes theIdx1 and theIdx2 in the vector

	:param theIdx1:
	:type theIdx1: int
	:param theIdx2:
	:type theIdx2: int
	:rtype: void
") Swap;
		virtual void Swap (const Standard_Integer theIdx1,const Standard_Integer theIdx2);
};


%extend Select3D_SensitiveWire {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Select3D_SensitiveWire(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Select3D_SensitiveWire::Handle_Select3D_SensitiveWire %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Select3D_SensitiveWire;
class Handle_Select3D_SensitiveWire : public Handle_Select3D_SensitiveSet {

    public:
        // constructors
        Handle_Select3D_SensitiveWire();
        Handle_Select3D_SensitiveWire(const Handle_Select3D_SensitiveWire &aHandle);
        Handle_Select3D_SensitiveWire(const Select3D_SensitiveWire *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Select3D_SensitiveWire DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Select3D_SensitiveWire {
    Select3D_SensitiveWire* _get_reference() {
    return (Select3D_SensitiveWire*)$self->Access();
    }
};

%extend Handle_Select3D_SensitiveWire {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Select3D_SensitiveWire {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Select3D_SensitiveCircle;
class Select3D_SensitiveCircle : public Select3D_SensitivePoly {
	public:
		%feature("compactdefaultargs") Select3D_SensitiveCircle;
		%feature("autodoc", "	* Constructs the sensitive circle object defined by the owner theOwnerId, the circle theCircle, the boolean theIsFilled and the number of points theNbPnts.

	:param theOwnerId:
	:type theOwnerId: Handle_SelectBasics_EntityOwner &
	:param theCircle:
	:type theCircle: Handle_Geom_Circle &
	:param theIsFilled: default value is Standard_False
	:type theIsFilled: bool
	:param theNbPnts: default value is 12
	:type theNbPnts: int
	:rtype: None
") Select3D_SensitiveCircle;
		 Select3D_SensitiveCircle (const Handle_SelectBasics_EntityOwner & theOwnerId,const Handle_Geom_Circle & theCircle,const Standard_Boolean theIsFilled = Standard_False,const Standard_Integer theNbPnts = 12);
		%feature("compactdefaultargs") Select3D_SensitiveCircle;
		%feature("autodoc", "	* Constructs the sensitive arc object defined by the owner theOwnerId, the circle theCircle, the parameters theU1 and theU2, the boolean theIsFilled and the number of points theNbPnts. theU1 and theU2 define the first and last points of the arc on theCircle.

	:param theOwnerId:
	:type theOwnerId: Handle_SelectBasics_EntityOwner &
	:param theCircle:
	:type theCircle: Handle_Geom_Circle &
	:param theU1:
	:type theU1: float
	:param theU2:
	:type theU2: float
	:param theIsFilled: default value is Standard_False
	:type theIsFilled: bool
	:param theNbPnts: default value is 12
	:type theNbPnts: int
	:rtype: None
") Select3D_SensitiveCircle;
		 Select3D_SensitiveCircle (const Handle_SelectBasics_EntityOwner & theOwnerId,const Handle_Geom_Circle & theCircle,const Standard_Real theU1,const Standard_Real theU2,const Standard_Boolean theIsFilled = Standard_False,const Standard_Integer theNbPnts = 12);
		%feature("compactdefaultargs") Select3D_SensitiveCircle;
		%feature("autodoc", "	* Constructs the sensitive circle object defined by the owner theOwnerId, the array of triangles thePnts3d, and the boolean theIsFilled. thePnts3d is an array of consecutive triangles on the circle. The triangle i+1 lies on the intersection of the tangents to the circle of i and i+2. Note, that the first point of thePnts3d must be equal to the last point of thePnts3d.

	:param theOwnerId:
	:type theOwnerId: Handle_SelectBasics_EntityOwner &
	:param thePnts3d:
	:type thePnts3d: Handle_TColgp_HArray1OfPnt
	:param theIsFilled: default value is Standard_False
	:type theIsFilled: bool
	:rtype: None
") Select3D_SensitiveCircle;
		 Select3D_SensitiveCircle (const Handle_SelectBasics_EntityOwner & theOwnerId,const Handle_TColgp_HArray1OfPnt & thePnts3d,const Standard_Boolean theIsFilled = Standard_False);
		%feature("compactdefaultargs") Select3D_SensitiveCircle;
		%feature("autodoc", "	* Constructs the sensitive circle object defined by the owner theOwnerId, the array of points thePnts3d, and the boolean theIsFilled. If the length of thePnts3d is more then 1, the first point of thePnts3d must be equal to the last point of thePnts3d.

	:param theOwnerId:
	:type theOwnerId: Handle_SelectBasics_EntityOwner &
	:param thePnts3d:
	:type thePnts3d: TColgp_Array1OfPnt
	:param theIsFilled: default value is Standard_False
	:type theIsFilled: bool
	:rtype: None
") Select3D_SensitiveCircle;
		 Select3D_SensitiveCircle (const Handle_SelectBasics_EntityOwner & theOwnerId,const TColgp_Array1OfPnt & thePnts3d,const Standard_Boolean theIsFilled = Standard_False);
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "	* Checks whether the circle overlaps current selecting volume

	:param theMgr:
	:type theMgr: SelectBasics_SelectingVolumeManager &
	:param thePickResult:
	:type thePickResult: SelectBasics_PickResult &
	:rtype: bool
") Matches;
		virtual Standard_Boolean Matches (SelectBasics_SelectingVolumeManager & theMgr,SelectBasics_PickResult & thePickResult);
		%feature("compactdefaultargs") ArrayBounds;
		%feature("autodoc", "	:param theLow:
	:type theLow: int &
	:param theUp:
	:type theUp: int &
	:rtype: None
") ArrayBounds;
		void ArrayBounds (Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("compactdefaultargs") GetPoint3d;
		%feature("autodoc", "	:param thePntIdx:
	:type thePntIdx: int
	:rtype: gp_Pnt
") GetPoint3d;
		gp_Pnt GetPoint3d (const Standard_Integer thePntIdx);
		%feature("compactdefaultargs") GetConnected;
		%feature("autodoc", "	:rtype: Handle_Select3D_SensitiveEntity
") GetConnected;
		virtual Handle_Select3D_SensitiveEntity GetConnected ();
		%feature("compactdefaultargs") CenterOfGeometry;
		%feature("autodoc", "	* Returns center of the circle. If location transformation is set, it will be applied

	:rtype: gp_Pnt
") CenterOfGeometry;
		virtual gp_Pnt CenterOfGeometry ();
		%feature("compactdefaultargs") BVH;
		%feature("autodoc", "	* Builds BVH tree for a circle's edge segments if needed

	:rtype: void
") BVH;
		virtual void BVH ();
};


%extend Select3D_SensitiveCircle {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Select3D_SensitiveCircle(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Select3D_SensitiveCircle::Handle_Select3D_SensitiveCircle %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Select3D_SensitiveCircle;
class Handle_Select3D_SensitiveCircle : public Handle_Select3D_SensitivePoly {

    public:
        // constructors
        Handle_Select3D_SensitiveCircle();
        Handle_Select3D_SensitiveCircle(const Handle_Select3D_SensitiveCircle &aHandle);
        Handle_Select3D_SensitiveCircle(const Select3D_SensitiveCircle *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Select3D_SensitiveCircle DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Select3D_SensitiveCircle {
    Select3D_SensitiveCircle* _get_reference() {
    return (Select3D_SensitiveCircle*)$self->Access();
    }
};

%extend Handle_Select3D_SensitiveCircle {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Select3D_SensitiveCircle {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Select3D_SensitiveCurve;
class Select3D_SensitiveCurve : public Select3D_SensitivePoly {
	public:
		%feature("compactdefaultargs") Select3D_SensitiveCurve;
		%feature("autodoc", "	* Constructs a sensitive curve object defined by the owner theOwnerId, the curve theCurve, and the maximum number of points on the curve: theNbPnts.

	:param theOwnerId:
	:type theOwnerId: Handle_SelectBasics_EntityOwner &
	:param theCurve:
	:type theCurve: Handle_Geom_Curve &
	:param theNbPnts: default value is 17
	:type theNbPnts: int
	:rtype: None
") Select3D_SensitiveCurve;
		 Select3D_SensitiveCurve (const Handle_SelectBasics_EntityOwner & theOwnerId,const Handle_Geom_Curve & theCurve,const Standard_Integer theNbPnts = 17);
		%feature("compactdefaultargs") Select3D_SensitiveCurve;
		%feature("autodoc", "	* Constructs a sensitive curve object defined by the owner theOwnerId and the set of points ThePoints.

	:param theOwnerId:
	:type theOwnerId: Handle_SelectBasics_EntityOwner &
	:param thePoints:
	:type thePoints: Handle_TColgp_HArray1OfPnt
	:rtype: None
") Select3D_SensitiveCurve;
		 Select3D_SensitiveCurve (const Handle_SelectBasics_EntityOwner & theOwnerId,const Handle_TColgp_HArray1OfPnt & thePoints);
		%feature("compactdefaultargs") Select3D_SensitiveCurve;
		%feature("autodoc", "	* Creation of Sensitive Curve from Points. Warning : This Method should disappear in the next version...

	:param theOwnerId:
	:type theOwnerId: Handle_SelectBasics_EntityOwner &
	:param thePoints:
	:type thePoints: TColgp_Array1OfPnt
	:rtype: None
") Select3D_SensitiveCurve;
		 Select3D_SensitiveCurve (const Handle_SelectBasics_EntityOwner & theOwnerId,const TColgp_Array1OfPnt & thePoints);
		%feature("compactdefaultargs") GetConnected;
		%feature("autodoc", "	* Returns the copy of this

	:rtype: Handle_Select3D_SensitiveEntity
") GetConnected;
		virtual Handle_Select3D_SensitiveEntity GetConnected ();
};


%extend Select3D_SensitiveCurve {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Select3D_SensitiveCurve(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Select3D_SensitiveCurve::Handle_Select3D_SensitiveCurve %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Select3D_SensitiveCurve;
class Handle_Select3D_SensitiveCurve : public Handle_Select3D_SensitivePoly {

    public:
        // constructors
        Handle_Select3D_SensitiveCurve();
        Handle_Select3D_SensitiveCurve(const Handle_Select3D_SensitiveCurve &aHandle);
        Handle_Select3D_SensitiveCurve(const Select3D_SensitiveCurve *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Select3D_SensitiveCurve DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Select3D_SensitiveCurve {
    Select3D_SensitiveCurve* _get_reference() {
    return (Select3D_SensitiveCurve*)$self->Access();
    }
};

%extend Handle_Select3D_SensitiveCurve {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Select3D_SensitiveCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
