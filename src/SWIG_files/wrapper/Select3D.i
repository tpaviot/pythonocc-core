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
%define SELECT3DDOCSTRING
"Select3D module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_select3d.html"
%enddef
%module (package="OCC.Core", docstring=SELECT3DDOCSTRING) Select3D


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
#include<Select3D_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<BVH_module.hxx>
#include<Graphic3d_module.hxx>
#include<gp_module.hxx>
#include<SelectMgr_module.hxx>
#include<Bnd_module.hxx>
#include<SelectBasics_module.hxx>
#include<TColgp_module.hxx>
#include<TopLoc_module.hxx>
#include<TColStd_module.hxx>
#include<Geom_module.hxx>
#include<TShort_module.hxx>
#include<TColQuantity_module.hxx>
#include<Aspect_module.hxx>
#include<Graphic3d_module.hxx>
#include<Quantity_module.hxx>
#include<Message_module.hxx>
#include<TopLoc_module.hxx>
#include<V3d_module.hxx>
#include<TopTools_module.hxx>
#include<Poly_module.hxx>
#include<HLRAlgo_module.hxx>
#include<Prs3d_module.hxx>
#include<TopoDS_module.hxx>
#include<Media_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import BVH.i
%import Graphic3d.i
%import gp.i
%import SelectMgr.i
%import Bnd.i
%import SelectBasics.i
%import TColgp.i
%import TopLoc.i
%import TColStd.i
%import Geom.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
enum Select3D_TypeOfSensitivity {
	Select3D_TOS_INTERIOR = 0,
	Select3D_TOS_BOUNDARY = 1,
};

/* end public enums declaration */

/* python proy classes for enums */
%pythoncode {

class Select3D_TypeOfSensitivity(IntEnum):
	Select3D_TOS_INTERIOR = 0
	Select3D_TOS_BOUNDARY = 1
Select3D_TOS_INTERIOR = Select3D_TypeOfSensitivity.Select3D_TOS_INTERIOR
Select3D_TOS_BOUNDARY = Select3D_TypeOfSensitivity.Select3D_TOS_BOUNDARY
};
/* end python proxy for enums */

/* handles */
%wrap_handle(Select3D_BVHIndexBuffer)
%wrap_handle(Select3D_SensitiveBox)
%wrap_handle(Select3D_SensitiveFace)
%wrap_handle(Select3D_SensitivePoint)
%wrap_handle(Select3D_SensitiveSegment)
%wrap_handle(Select3D_SensitiveTriangle)
%wrap_handle(Select3D_InteriorSensitivePointSet)
%wrap_handle(Select3D_SensitiveGroup)
%wrap_handle(Select3D_SensitivePoly)
%wrap_handle(Select3D_SensitivePrimitiveArray)
%wrap_handle(Select3D_SensitiveWire)
%wrap_handle(Select3D_SensitiveCircle)
%wrap_handle(Select3D_SensitiveCurve)
/* end handles declaration */

/* templates */
%template(Select3D_EntitySequence) NCollection_Sequence<opencascade::handle<Select3D_SensitiveEntity>>;
%template(Select3D_EntitySequenceIter) NCollection_TListIterator<Select3D_EntitySequence>;
%template(Select3D_IndexedMapOfEntity) NCollection_IndexedMap<opencascade::handle<Select3D_SensitiveEntity>>;
%template(Select3D_Vec3) NCollection_Vec3<Standard_Real>;
%template(Select3D_VectorOfHPoly) NCollection_Vector<opencascade::handle<Select3D_SensitivePoly>>;
/* end templates declaration */

/* typedefs */
typedef BVH_Builder<Standard_Real, 3> Select3D_BVHBuilder3d;
typedef NCollection_Sequence<opencascade::handle<Select3D_SensitiveEntity>> Select3D_EntitySequence;
typedef NCollection_Sequence<opencascade::handle<Select3D_SensitiveEntity>>::Iterator Select3D_EntitySequenceIter;
typedef NCollection_IndexedMap<opencascade::handle<Select3D_SensitiveEntity>> Select3D_IndexedMapOfEntity;
typedef NCollection_Vec3<Standard_Real> Select3D_Vec3;
typedef NCollection_Vector<opencascade::handle<Select3D_SensitivePoly>> Select3D_VectorOfHPoly;
typedef Select3D_SensitiveEntity SelectBasics_SensitiveEntity;
/* end typedefs declaration */

/********************************
* class Select3D_BVHIndexBuffer *
********************************/
class Select3D_BVHIndexBuffer : public Graphic3d_Buffer {
	public:
		/****************** Select3D_BVHIndexBuffer ******************/
		%feature("compactdefaultargs") Select3D_BVHIndexBuffer;
		%feature("autodoc", "Empty constructor.

Parameters
----------
theAlloc: NCollection_BaseAllocator

Returns
-------
None
") Select3D_BVHIndexBuffer;
		 Select3D_BVHIndexBuffer(const opencascade::handle<NCollection_BaseAllocator> & theAlloc);

		/****************** HasPatches ******************/
		%feature("compactdefaultargs") HasPatches;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") HasPatches;
		bool HasPatches();

		/****************** Index ******************/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "Access index at specified position.

Parameters
----------
theIndex: int

Returns
-------
int
") Index;
		Standard_Integer Index(const Standard_Integer theIndex);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Allocates new empty index array.

Parameters
----------
theNbElems: int
theHasPatches: bool

Returns
-------
bool
") Init;
		bool Init(const Standard_Integer theNbElems, const bool theHasPatches);

		/****************** PatchSize ******************/
		%feature("compactdefaultargs") PatchSize;
		%feature("autodoc", "Access index at specified position.

Parameters
----------
theIndex: int

Returns
-------
int
") PatchSize;
		Standard_Integer PatchSize(const Standard_Integer theIndex);

		/****************** SetIndex ******************/
		%feature("compactdefaultargs") SetIndex;
		%feature("autodoc", "Change index at specified position.

Parameters
----------
theIndex: int
theValue: int

Returns
-------
None
") SetIndex;
		void SetIndex(const Standard_Integer theIndex, const Standard_Integer theValue);

		/****************** SetIndex ******************/
		%feature("compactdefaultargs") SetIndex;
		%feature("autodoc", "Change index at specified position.

Parameters
----------
theIndex: int
theValue: int
thePatchSize: int

Returns
-------
None
") SetIndex;
		void SetIndex(const Standard_Integer theIndex, const Standard_Integer theValue, const Standard_Integer thePatchSize);

};


%make_alias(Select3D_BVHIndexBuffer)

%extend Select3D_BVHIndexBuffer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************
* class Select3D_Pnt *
*********************/
class Select3D_Pnt {
	public:
		Standard_ShortReal x;
		Standard_ShortReal y;
		Standard_ShortReal z;
};


%extend Select3D_Pnt {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class Select3D_PointData *
***************************/
class Select3D_PointData {
	public:
		/****************** Select3D_PointData ******************/
		%feature("compactdefaultargs") Select3D_PointData;
		%feature("autodoc", "No available documentation.

Parameters
----------
theNbPoints: int

Returns
-------
None
") Select3D_PointData;
		 Select3D_PointData(const Standard_Integer theNbPoints);

		/****************** Pnt ******************/
		%feature("compactdefaultargs") Pnt;
		%feature("autodoc", "No available documentation.

Parameters
----------
theIndex: int

Returns
-------
Select3D_Pnt
") Pnt;
		const Select3D_Pnt & Pnt(const Standard_Integer theIndex);

		/****************** Pnt3d ******************/
		%feature("compactdefaultargs") Pnt3d;
		%feature("autodoc", "No available documentation.

Parameters
----------
theIndex: int

Returns
-------
gp_Pnt
") Pnt3d;
		gp_Pnt Pnt3d(const Standard_Integer theIndex);

		/****************** SetPnt ******************/
		%feature("compactdefaultargs") SetPnt;
		%feature("autodoc", "No available documentation.

Parameters
----------
theIndex: int
theValue: Select3D_Pnt

Returns
-------
None
") SetPnt;
		void SetPnt(const Standard_Integer theIndex, const Select3D_Pnt & theValue);

		/****************** SetPnt ******************/
		%feature("compactdefaultargs") SetPnt;
		%feature("autodoc", "No available documentation.

Parameters
----------
theIndex: int
theValue: gp_Pnt

Returns
-------
None
") SetPnt;
		void SetPnt(const Standard_Integer theIndex, const gp_Pnt & theValue);

		/****************** Size ******************/
		%feature("compactdefaultargs") Size;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") Size;
		Standard_Integer Size();

};


%extend Select3D_PointData {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class Select3D_SensitiveEntity *
*********************************/
/******************************
* class Select3D_SensitiveBox *
******************************/
class Select3D_SensitiveBox : public Select3D_SensitiveEntity {
	public:
		/****************** Select3D_SensitiveBox ******************/
		%feature("compactdefaultargs") Select3D_SensitiveBox;
		%feature("autodoc", "Constructs a sensitive box object defined by the owner theownerid, and the box thebox.

Parameters
----------
theOwnerId: SelectMgr_EntityOwner
theBox: Bnd_Box

Returns
-------
None
") Select3D_SensitiveBox;
		 Select3D_SensitiveBox(const opencascade::handle<SelectMgr_EntityOwner> & theOwnerId, const Bnd_Box & theBox);

		/****************** Select3D_SensitiveBox ******************/
		%feature("compactdefaultargs") Select3D_SensitiveBox;
		%feature("autodoc", "Constructs a sensitive box object defined by the owner theownerid, and the coordinates thexmin, theymin, thezmin, thexmax, theymax, thezmax. thexmin, theymin and thezmin define the minimum point in the front lower left hand corner of the box, and thexmax, theymax and thezmax define the maximum point in the back upper right hand corner of the box.

Parameters
----------
theOwnerId: SelectMgr_EntityOwner
theXMin: float
theYMin: float
theZMin: float
theXMax: float
theYMax: float
theZMax: float

Returns
-------
None
") Select3D_SensitiveBox;
		 Select3D_SensitiveBox(const opencascade::handle<SelectMgr_EntityOwner> & theOwnerId, const Standard_Real theXMin, const Standard_Real theYMin, const Standard_Real theZMin, const Standard_Real theXMax, const Standard_Real theYMax, const Standard_Real theZMax);

		/****************** BoundingBox ******************/
		%feature("compactdefaultargs") BoundingBox;
		%feature("autodoc", "Returns coordinates of the box. if location transformation is set, it will be applied.

Returns
-------
Select3D_BndBox3d
") BoundingBox;
		virtual Select3D_BndBox3d BoundingBox();

		/****************** CenterOfGeometry ******************/
		%feature("compactdefaultargs") CenterOfGeometry;
		%feature("autodoc", "Returns center of the box. if location transformation is set, it will be applied.

Returns
-------
gp_Pnt
") CenterOfGeometry;
		virtual gp_Pnt CenterOfGeometry();

		/****************** GetConnected ******************/
		%feature("compactdefaultargs") GetConnected;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Select3D_SensitiveEntity>
") GetConnected;
		virtual opencascade::handle<Select3D_SensitiveEntity> GetConnected();

		/****************** Matches ******************/
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "Checks whether the box overlaps current selecting volume.

Parameters
----------
theMgr: SelectBasics_SelectingVolumeManager
thePickResult: SelectBasics_PickResult

Returns
-------
bool
") Matches;
		virtual Standard_Boolean Matches(SelectBasics_SelectingVolumeManager & theMgr, SelectBasics_PickResult & thePickResult);

		/****************** NbSubElements ******************/
		%feature("compactdefaultargs") NbSubElements;
		%feature("autodoc", "Returns the amount of sub-entities in sensitive.

Returns
-------
int
") NbSubElements;
		virtual Standard_Integer NbSubElements();

};


%make_alias(Select3D_SensitiveBox)

%extend Select3D_SensitiveBox {
	%pythoncode {
	__repr__ = _dumps_object

	@methodnotwrapped
	def Box(self):
		pass
	}
};

/*******************************
* class Select3D_SensitiveFace *
*******************************/
class Select3D_SensitiveFace : public Select3D_SensitiveEntity {
	public:
		/****************** Select3D_SensitiveFace ******************/
		%feature("compactdefaultargs") Select3D_SensitiveFace;
		%feature("autodoc", "Constructs a sensitive face object defined by the owner theownerid, the array of points thepoints, and the sensitivity type thetype. the array of points is the outer polygon of the geometric face.

Parameters
----------
theOwnerId: SelectMgr_EntityOwner
thePoints: TColgp_Array1OfPnt
theType: Select3D_TypeOfSensitivity

Returns
-------
None
") Select3D_SensitiveFace;
		 Select3D_SensitiveFace(const opencascade::handle<SelectMgr_EntityOwner> & theOwnerId, const TColgp_Array1OfPnt & thePoints, const Select3D_TypeOfSensitivity theType);

		/****************** Select3D_SensitiveFace ******************/
		%feature("compactdefaultargs") Select3D_SensitiveFace;
		%feature("autodoc", "Constructs a sensitive face object defined by the owner theownerid, the array of points thepoints, and the sensitivity type thetype. the array of points is the outer polygon of the geometric face.

Parameters
----------
theOwnerId: SelectMgr_EntityOwner
thePoints: TColgp_HArray1OfPnt
theType: Select3D_TypeOfSensitivity

Returns
-------
None
") Select3D_SensitiveFace;
		 Select3D_SensitiveFace(const opencascade::handle<SelectMgr_EntityOwner> & theOwnerId, const opencascade::handle<TColgp_HArray1OfPnt> & thePoints, const Select3D_TypeOfSensitivity theType);

		/****************** BVH ******************/
		%feature("compactdefaultargs") BVH;
		%feature("autodoc", "Builds bvh tree for the face.

Returns
-------
None
") BVH;
		virtual void BVH();

		/****************** BoundingBox ******************/
		%feature("compactdefaultargs") BoundingBox;
		%feature("autodoc", "Returns bounding box of the face. if location transformation is set, it will be applied.

Returns
-------
Select3D_BndBox3d
") BoundingBox;
		virtual Select3D_BndBox3d BoundingBox();

		/****************** CenterOfGeometry ******************/
		%feature("compactdefaultargs") CenterOfGeometry;
		%feature("autodoc", "Returns center of the face. if location transformation is set, it will be applied.

Returns
-------
gp_Pnt
") CenterOfGeometry;
		virtual gp_Pnt CenterOfGeometry();

		/****************** GetConnected ******************/
		%feature("compactdefaultargs") GetConnected;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Select3D_SensitiveEntity>
") GetConnected;
		virtual opencascade::handle<Select3D_SensitiveEntity> GetConnected();

		/****************** GetPoints ******************/
		%feature("compactdefaultargs") GetPoints;
		%feature("autodoc", "Initializes the given array theharrayofpnt by 3d coordinates of vertices of the face.

Parameters
----------
theHArrayOfPnt: TColgp_HArray1OfPnt

Returns
-------
None
") GetPoints;
		void GetPoints(opencascade::handle<TColgp_HArray1OfPnt> & theHArrayOfPnt);

		/****************** Matches ******************/
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "Checks whether the face overlaps current selecting volume.

Parameters
----------
theMgr: SelectBasics_SelectingVolumeManager
thePickResult: SelectBasics_PickResult

Returns
-------
bool
") Matches;
		virtual Standard_Boolean Matches(SelectBasics_SelectingVolumeManager & theMgr, SelectBasics_PickResult & thePickResult);

		/****************** NbSubElements ******************/
		%feature("compactdefaultargs") NbSubElements;
		%feature("autodoc", "Returns the amount of sub-entities (points or planar convex polygons).

Returns
-------
int
") NbSubElements;
		virtual Standard_Integer NbSubElements();

};


%make_alias(Select3D_SensitiveFace)

%extend Select3D_SensitiveFace {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class Select3D_SensitivePoint *
********************************/
class Select3D_SensitivePoint : public Select3D_SensitiveEntity {
	public:
		/****************** Select3D_SensitivePoint ******************/
		%feature("compactdefaultargs") Select3D_SensitivePoint;
		%feature("autodoc", "Constructs a sensitive point object defined by the owner ownerid and the point point.

Parameters
----------
theOwnerId: SelectMgr_EntityOwner
thePoint: gp_Pnt

Returns
-------
None
") Select3D_SensitivePoint;
		 Select3D_SensitivePoint(const opencascade::handle<SelectMgr_EntityOwner> & theOwnerId, const gp_Pnt & thePoint);

		/****************** BoundingBox ******************/
		%feature("compactdefaultargs") BoundingBox;
		%feature("autodoc", "Returns bounding box of the point. if location transformation is set, it will be applied.

Returns
-------
Select3D_BndBox3d
") BoundingBox;
		virtual Select3D_BndBox3d BoundingBox();

		/****************** CenterOfGeometry ******************/
		%feature("compactdefaultargs") CenterOfGeometry;
		%feature("autodoc", "Returns center of point. if location transformation is set, it will be applied.

Returns
-------
gp_Pnt
") CenterOfGeometry;
		virtual gp_Pnt CenterOfGeometry();

		/****************** GetConnected ******************/
		%feature("compactdefaultargs") GetConnected;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Select3D_SensitiveEntity>
") GetConnected;
		virtual opencascade::handle<Select3D_SensitiveEntity> GetConnected();

		/****************** Matches ******************/
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "Checks whether the point overlaps current selecting volume.

Parameters
----------
theMgr: SelectBasics_SelectingVolumeManager
thePickResult: SelectBasics_PickResult

Returns
-------
bool
") Matches;
		virtual Standard_Boolean Matches(SelectBasics_SelectingVolumeManager & theMgr, SelectBasics_PickResult & thePickResult);

		/****************** NbSubElements ******************/
		%feature("compactdefaultargs") NbSubElements;
		%feature("autodoc", "Returns the amount of sub-entities in sensitive.

Returns
-------
int
") NbSubElements;
		virtual Standard_Integer NbSubElements();

		/****************** Point ******************/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Returns the point used at the time of construction.

Returns
-------
gp_Pnt
") Point;
		const gp_Pnt Point();

};


%make_alias(Select3D_SensitivePoint)

%extend Select3D_SensitivePoint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class Select3D_SensitiveSegment *
**********************************/
class Select3D_SensitiveSegment : public Select3D_SensitiveEntity {
	public:
		/****************** Select3D_SensitiveSegment ******************/
		%feature("compactdefaultargs") Select3D_SensitiveSegment;
		%feature("autodoc", "Constructs the sensitive segment object defined by the owner theownerid, the points thefirstpnt, thelastpnt.

Parameters
----------
theOwnerId: SelectMgr_EntityOwner
theFirstPnt: gp_Pnt
theLastPnt: gp_Pnt

Returns
-------
None
") Select3D_SensitiveSegment;
		 Select3D_SensitiveSegment(const opencascade::handle<SelectMgr_EntityOwner> & theOwnerId, const gp_Pnt & theFirstPnt, const gp_Pnt & theLastPnt);

		/****************** BoundingBox ******************/
		%feature("compactdefaultargs") BoundingBox;
		%feature("autodoc", "Returns bounding box of the segment. if location transformation is set, it will be applied.

Returns
-------
Select3D_BndBox3d
") BoundingBox;
		virtual Select3D_BndBox3d BoundingBox();

		/****************** CenterOfGeometry ******************/
		%feature("compactdefaultargs") CenterOfGeometry;
		%feature("autodoc", "Returns center of the segment. if location transformation is set, it will be applied.

Returns
-------
gp_Pnt
") CenterOfGeometry;
		virtual gp_Pnt CenterOfGeometry();

		/****************** EndPoint ******************/
		%feature("compactdefaultargs") EndPoint;
		%feature("autodoc", "Gives the 3d end point of the segment.

Returns
-------
gp_Pnt
") EndPoint;
		const gp_Pnt EndPoint();

		/****************** EndPoint ******************/
		%feature("compactdefaultargs") EndPoint;
		%feature("autodoc", "Changes the end point of the segment.

Parameters
----------
thePnt: gp_Pnt

Returns
-------
None
") EndPoint;
		void EndPoint(const gp_Pnt & thePnt);

		/****************** GetConnected ******************/
		%feature("compactdefaultargs") GetConnected;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Select3D_SensitiveEntity>
") GetConnected;
		virtual opencascade::handle<Select3D_SensitiveEntity> GetConnected();

		/****************** Matches ******************/
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "Checks whether the segment overlaps current selecting volume.

Parameters
----------
theMgr: SelectBasics_SelectingVolumeManager
thePickResult: SelectBasics_PickResult

Returns
-------
bool
") Matches;
		virtual Standard_Boolean Matches(SelectBasics_SelectingVolumeManager & theMgr, SelectBasics_PickResult & thePickResult);

		/****************** NbSubElements ******************/
		%feature("compactdefaultargs") NbSubElements;
		%feature("autodoc", "Returns the amount of points.

Returns
-------
int
") NbSubElements;
		virtual Standard_Integer NbSubElements();

		/****************** SetEndPoint ******************/
		%feature("compactdefaultargs") SetEndPoint;
		%feature("autodoc", "Changes the end point of the segment.

Parameters
----------
thePnt: gp_Pnt

Returns
-------
None
") SetEndPoint;
		void SetEndPoint(const gp_Pnt & thePnt);

		/****************** SetStartPoint ******************/
		%feature("compactdefaultargs") SetStartPoint;
		%feature("autodoc", "Changes the start point of the segment;.

Parameters
----------
thePnt: gp_Pnt

Returns
-------
None
") SetStartPoint;
		void SetStartPoint(const gp_Pnt & thePnt);

		/****************** StartPoint ******************/
		%feature("compactdefaultargs") StartPoint;
		%feature("autodoc", "Gives the 3d start point of the segment.

Returns
-------
gp_Pnt
") StartPoint;
		const gp_Pnt StartPoint();

		/****************** StartPoint ******************/
		%feature("compactdefaultargs") StartPoint;
		%feature("autodoc", "Changes the start point of the segment;.

Parameters
----------
thePnt: gp_Pnt

Returns
-------
None
") StartPoint;
		void StartPoint(const gp_Pnt & thePnt);

};


%make_alias(Select3D_SensitiveSegment)

%extend Select3D_SensitiveSegment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class Select3D_SensitiveSet *
******************************/
/***********************************
* class Select3D_SensitiveTriangle *
***********************************/
class Select3D_SensitiveTriangle : public Select3D_SensitiveEntity {
	public:
		/****************** Select3D_SensitiveTriangle ******************/
		%feature("compactdefaultargs") Select3D_SensitiveTriangle;
		%feature("autodoc", "Constructs a sensitive triangle object defined by the owner theownerid, the points p1, p2, p3, and the type of sensitivity sensitivity.

Parameters
----------
theOwnerId: SelectMgr_EntityOwner
thePnt0: gp_Pnt
thePnt1: gp_Pnt
thePnt2: gp_Pnt
theType: Select3D_TypeOfSensitivity,optional
	default value is Select3D_TOS_INTERIOR

Returns
-------
None
") Select3D_SensitiveTriangle;
		 Select3D_SensitiveTriangle(const opencascade::handle<SelectMgr_EntityOwner> & theOwnerId, const gp_Pnt & thePnt0, const gp_Pnt & thePnt1, const gp_Pnt & thePnt2, const Select3D_TypeOfSensitivity theType = Select3D_TOS_INTERIOR);

		/****************** BoundingBox ******************/
		%feature("compactdefaultargs") BoundingBox;
		%feature("autodoc", "Returns bounding box of the triangle. if location transformation is set, it will be applied.

Returns
-------
Select3D_BndBox3d
") BoundingBox;
		virtual Select3D_BndBox3d BoundingBox();

		/****************** Center3D ******************/
		%feature("compactdefaultargs") Center3D;
		%feature("autodoc", "Returns the center point of the sensitive triangle created at construction time.

Returns
-------
gp_Pnt
") Center3D;
		gp_Pnt Center3D();

		/****************** CenterOfGeometry ******************/
		%feature("compactdefaultargs") CenterOfGeometry;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Pnt
") CenterOfGeometry;
		virtual gp_Pnt CenterOfGeometry();

		/****************** GetConnected ******************/
		%feature("compactdefaultargs") GetConnected;
		%feature("autodoc", "Returns the copy of this.

Returns
-------
opencascade::handle<Select3D_SensitiveEntity>
") GetConnected;
		virtual opencascade::handle<Select3D_SensitiveEntity> GetConnected();

		/****************** Matches ******************/
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "Checks whether the triangle overlaps current selecting volume.

Parameters
----------
theMgr: SelectBasics_SelectingVolumeManager
thePickResult: SelectBasics_PickResult

Returns
-------
bool
") Matches;
		virtual Standard_Boolean Matches(SelectBasics_SelectingVolumeManager & theMgr, SelectBasics_PickResult & thePickResult);

		/****************** NbSubElements ******************/
		%feature("compactdefaultargs") NbSubElements;
		%feature("autodoc", "Returns the amount of points.

Returns
-------
int
") NbSubElements;
		virtual Standard_Integer NbSubElements();

		/****************** Points3D ******************/
		%feature("compactdefaultargs") Points3D;
		%feature("autodoc", "Returns the 3d points p1, p2, p3 used at the time of construction.

Parameters
----------
thePnt0: gp_Pnt
thePnt1: gp_Pnt
thePnt2: gp_Pnt

Returns
-------
None
") Points3D;
		void Points3D(gp_Pnt & thePnt0, gp_Pnt & thePnt1, gp_Pnt & thePnt2);

};


%make_alias(Select3D_SensitiveTriangle)

%extend Select3D_SensitiveTriangle {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************************
* class Select3D_InteriorSensitivePointSet *
*******************************************/
class Select3D_InteriorSensitivePointSet : public Select3D_SensitiveSet {
	public:
		/****************** Select3D_InteriorSensitivePointSet ******************/
		%feature("compactdefaultargs") Select3D_InteriorSensitivePointSet;
		%feature("autodoc", "Splits the given point set thepoints onto planar convex polygons.

Parameters
----------
theOwnerId: SelectMgr_EntityOwner
thePoints: TColgp_Array1OfPnt

Returns
-------
None
") Select3D_InteriorSensitivePointSet;
		 Select3D_InteriorSensitivePointSet(const opencascade::handle<SelectMgr_EntityOwner> & theOwnerId, const TColgp_Array1OfPnt & thePoints);

		/****************** BoundingBox ******************/
		%feature("compactdefaultargs") BoundingBox;
		%feature("autodoc", "Returns bounding box of the point set. if location transformation is set, it will be applied.

Returns
-------
Select3D_BndBox3d
") BoundingBox;
		virtual Select3D_BndBox3d BoundingBox();

		/****************** Box ******************/
		%feature("compactdefaultargs") Box;
		%feature("autodoc", "Returns bounding box of planar convex polygon with index theidx.

Parameters
----------
theIdx: int

Returns
-------
Select3D_BndBox3d
") Box;
		virtual Select3D_BndBox3d Box(const Standard_Integer theIdx);

		/****************** Center ******************/
		%feature("compactdefaultargs") Center;
		%feature("autodoc", "Returns geometry center of planar convex polygon with index theidx in the vector along the given axis theaxis.

Parameters
----------
theIdx: int
theAxis: int

Returns
-------
float
") Center;
		virtual Standard_Real Center(const Standard_Integer theIdx, const Standard_Integer theAxis);

		/****************** CenterOfGeometry ******************/
		%feature("compactdefaultargs") CenterOfGeometry;
		%feature("autodoc", "Returns center of the point set. if location transformation is set, it will be applied.

Returns
-------
gp_Pnt
") CenterOfGeometry;
		virtual gp_Pnt CenterOfGeometry();

		/****************** GetPoints ******************/
		%feature("compactdefaultargs") GetPoints;
		%feature("autodoc", "Initializes the given array theharrayofpnt by 3d coordinates of vertices of the whole point set.

Parameters
----------
theHArrayOfPnt: TColgp_HArray1OfPnt

Returns
-------
None
") GetPoints;
		virtual void GetPoints(opencascade::handle<TColgp_HArray1OfPnt> & theHArrayOfPnt);

		/****************** NbSubElements ******************/
		%feature("compactdefaultargs") NbSubElements;
		%feature("autodoc", "Returns the amount of points in set.

Returns
-------
int
") NbSubElements;
		virtual Standard_Integer NbSubElements();

		/****************** Size ******************/
		%feature("compactdefaultargs") Size;
		%feature("autodoc", "Returns the length of vector of planar convex polygons.

Returns
-------
int
") Size;
		virtual Standard_Integer Size();

		/****************** Swap ******************/
		%feature("compactdefaultargs") Swap;
		%feature("autodoc", "Swaps items with indexes theidx1 and theidx2 in the vector.

Parameters
----------
theIdx1: int
theIdx2: int

Returns
-------
None
") Swap;
		virtual void Swap(const Standard_Integer theIdx1, const Standard_Integer theIdx2);

};


%make_alias(Select3D_InteriorSensitivePointSet)

%extend Select3D_InteriorSensitivePointSet {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class Select3D_SensitiveGroup *
********************************/
class Select3D_SensitiveGroup : public Select3D_SensitiveSet {
	public:
		/****************** Select3D_SensitiveGroup ******************/
		%feature("compactdefaultargs") Select3D_SensitiveGroup;
		%feature("autodoc", "Constructs an empty sensitive group object. this is a set of sensitive 3d entities. the sensitive entities will be defined using the function add to fill the entity owner ownerid. if matchall is false, nothing can be added.

Parameters
----------
theOwnerId: SelectMgr_EntityOwner
theIsMustMatchAll: bool,optional
	default value is Standard_True

Returns
-------
None
") Select3D_SensitiveGroup;
		 Select3D_SensitiveGroup(const opencascade::handle<SelectMgr_EntityOwner> & theOwnerId, const Standard_Boolean theIsMustMatchAll = Standard_True);

		/****************** Select3D_SensitiveGroup ******************/
		%feature("compactdefaultargs") Select3D_SensitiveGroup;
		%feature("autodoc", "Constructs a sensitive group object defined by the list thelist and the entity owner ownerid. if matchall is false, nothing is done.

Parameters
----------
theOwnerId: SelectMgr_EntityOwner
theEntities: Select3D_EntitySequence
theIsMustMatchAll: bool,optional
	default value is Standard_True

Returns
-------
None
") Select3D_SensitiveGroup;
		 Select3D_SensitiveGroup(const opencascade::handle<SelectMgr_EntityOwner> & theOwnerId, Select3D_EntitySequence & theEntities, const Standard_Boolean theIsMustMatchAll = Standard_True);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Adds the list of sensitive entities ll to the empty sensitive group object created at construction time.

Parameters
----------
theEntities: Select3D_EntitySequence

Returns
-------
None
") Add;
		void Add(Select3D_EntitySequence & theEntities);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Adds the sensitive entity asensitive to the non-empty sensitive group object created at construction time.

Parameters
----------
theSensitive: Select3D_SensitiveEntity

Returns
-------
None
") Add;
		void Add(const opencascade::handle<Select3D_SensitiveEntity> & theSensitive);

		/****************** BoundingBox ******************/
		%feature("compactdefaultargs") BoundingBox;
		%feature("autodoc", "Returns bounding box of the group. if location transformation is set, it will be applied.

Returns
-------
Select3D_BndBox3d
") BoundingBox;
		virtual Select3D_BndBox3d BoundingBox();

		/****************** Box ******************/
		%feature("compactdefaultargs") Box;
		%feature("autodoc", "Returns bounding box of sensitive entity with index theidx.

Parameters
----------
theIdx: int

Returns
-------
Select3D_BndBox3d
") Box;
		virtual Select3D_BndBox3d Box(const Standard_Integer theIdx);

		/****************** Center ******************/
		%feature("compactdefaultargs") Center;
		%feature("autodoc", "Returns geometry center of sensitive entity index theidx in the vector along the given axis theaxis.

Parameters
----------
theIdx: int
theAxis: int

Returns
-------
float
") Center;
		virtual Standard_Real Center(const Standard_Integer theIdx, const Standard_Integer theAxis);

		/****************** CenterOfGeometry ******************/
		%feature("compactdefaultargs") CenterOfGeometry;
		%feature("autodoc", "Returns center of entity set. if location transformation is set, it will be applied.

Returns
-------
gp_Pnt
") CenterOfGeometry;
		virtual gp_Pnt CenterOfGeometry();

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Removes all sensitive entities from the list used at the time of construction, or added using the function add.

Returns
-------
None
") Clear;
		void Clear();

		/****************** Entities ******************/
		%feature("compactdefaultargs") Entities;
		%feature("autodoc", "Gets group content.

Returns
-------
Select3D_IndexedMapOfEntity
") Entities;
		const Select3D_IndexedMapOfEntity & Entities();

		/****************** GetConnected ******************/
		%feature("compactdefaultargs") GetConnected;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Select3D_SensitiveEntity>
") GetConnected;
		virtual opencascade::handle<Select3D_SensitiveEntity> GetConnected();

		/****************** IsIn ******************/
		%feature("compactdefaultargs") IsIn;
		%feature("autodoc", "Returns true if the sensitive entity asensitive is in the list used at the time of construction, or added using the function add.

Parameters
----------
theSensitive: Select3D_SensitiveEntity

Returns
-------
bool
") IsIn;
		Standard_Boolean IsIn(const opencascade::handle<Select3D_SensitiveEntity> & theSensitive);

		/****************** LastDetectedEntity ******************/
		%feature("compactdefaultargs") LastDetectedEntity;
		%feature("autodoc", "Return last detected entity.

Returns
-------
opencascade::handle<Select3D_SensitiveEntity>
") LastDetectedEntity;
		opencascade::handle<Select3D_SensitiveEntity> LastDetectedEntity();

		/****************** LastDetectedEntityIndex ******************/
		%feature("compactdefaultargs") LastDetectedEntityIndex;
		%feature("autodoc", "Return index of last detected entity.

Returns
-------
int
") LastDetectedEntityIndex;
		Standard_Integer LastDetectedEntityIndex();

		/****************** Matches ******************/
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "Checks whether the group overlaps current selecting volume.

Parameters
----------
theMgr: SelectBasics_SelectingVolumeManager
thePickResult: SelectBasics_PickResult

Returns
-------
bool
") Matches;
		virtual Standard_Boolean Matches(SelectBasics_SelectingVolumeManager & theMgr, SelectBasics_PickResult & thePickResult);

		/****************** MustMatchAll ******************/
		%feature("compactdefaultargs") MustMatchAll;
		%feature("autodoc", "Returns true if all sensitive entities in the list used at the time of construction, or added using the function add must be matched.

Returns
-------
bool
") MustMatchAll;
		Standard_Boolean MustMatchAll();

		/****************** NbSubElements ******************/
		%feature("compactdefaultargs") NbSubElements;
		%feature("autodoc", "Returns the amount of sub-entities.

Returns
-------
int
") NbSubElements;
		virtual Standard_Integer NbSubElements();

		/****************** Remove ******************/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSensitive: Select3D_SensitiveEntity

Returns
-------
None
") Remove;
		void Remove(const opencascade::handle<Select3D_SensitiveEntity> & theSensitive);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Sets the owner for all entities in group.

Parameters
----------
theOwnerId: SelectMgr_EntityOwner

Returns
-------
None
") Set;
		void Set(const opencascade::handle<SelectMgr_EntityOwner> & theOwnerId);

		/****************** SetCheckOverlapAll ******************/
		%feature("compactdefaultargs") SetCheckOverlapAll;
		%feature("autodoc", "Returns true if all sensitive entities should be checked within rectangular/polygonal selection, false by default. can be useful for sensitive entities holding detection results as class property.

Parameters
----------
theToCheckAll: bool

Returns
-------
None
") SetCheckOverlapAll;
		void SetCheckOverlapAll(Standard_Boolean theToCheckAll);

		/****************** SetMatchType ******************/
		%feature("compactdefaultargs") SetMatchType;
		%feature("autodoc", "Sets the requirement that all sensitive entities in the list used at the time of construction, or added using the function add must be matched.

Parameters
----------
theIsMustMatchAll: bool

Returns
-------
None
") SetMatchType;
		void SetMatchType(const Standard_Boolean theIsMustMatchAll);

		/****************** Size ******************/
		%feature("compactdefaultargs") Size;
		%feature("autodoc", "Returns the length of vector of sensitive entities.

Returns
-------
int
") Size;
		virtual Standard_Integer Size();

		/****************** SubEntity ******************/
		%feature("compactdefaultargs") SubEntity;
		%feature("autodoc", "Access entity by index [1, nbsubelements()].

Parameters
----------
theIndex: int

Returns
-------
opencascade::handle<Select3D_SensitiveEntity>
") SubEntity;
		const opencascade::handle<Select3D_SensitiveEntity> & SubEntity(const Standard_Integer theIndex);

		/****************** Swap ******************/
		%feature("compactdefaultargs") Swap;
		%feature("autodoc", "Swaps items with indexes theidx1 and theidx2 in the vector.

Parameters
----------
theIdx1: int
theIdx2: int

Returns
-------
None
") Swap;
		virtual void Swap(const Standard_Integer theIdx1, const Standard_Integer theIdx2);

		/****************** ToCheckOverlapAll ******************/
		%feature("compactdefaultargs") ToCheckOverlapAll;
		%feature("autodoc", "Returns true if all sensitive entities should be checked within rectangular/polygonal selection, false by default. can be useful for sensitive entities holding detection results as class property.

Returns
-------
bool
") ToCheckOverlapAll;
		Standard_Boolean ToCheckOverlapAll();

};


%make_alias(Select3D_SensitiveGroup)

%extend Select3D_SensitiveGroup {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class Select3D_SensitivePoly *
*******************************/
class Select3D_SensitivePoly : public Select3D_SensitiveSet {
	public:
		/****************** Select3D_SensitivePoly ******************/
		%feature("compactdefaultargs") Select3D_SensitivePoly;
		%feature("autodoc", "Constructs a sensitive face object defined by the owner ownerid, the array of points thepoints, and the sensitivity type sensitivity. the array of points is the outer polygon of the geometric face.

Parameters
----------
theOwnerId: SelectMgr_EntityOwner
thePoints: TColgp_Array1OfPnt
theIsBVHEnabled: bool

Returns
-------
None
") Select3D_SensitivePoly;
		 Select3D_SensitivePoly(const opencascade::handle<SelectMgr_EntityOwner> & theOwnerId, const TColgp_Array1OfPnt & thePoints, const Standard_Boolean theIsBVHEnabled);

		/****************** Select3D_SensitivePoly ******************/
		%feature("compactdefaultargs") Select3D_SensitivePoly;
		%feature("autodoc", "Constructs a sensitive face object defined by the owner ownerid, the array of points thepoints, and the sensitivity type sensitivity. the array of points is the outer polygon of the geometric face.

Parameters
----------
theOwnerId: SelectMgr_EntityOwner
thePoints: TColgp_HArray1OfPnt
theIsBVHEnabled: bool

Returns
-------
None
") Select3D_SensitivePoly;
		 Select3D_SensitivePoly(const opencascade::handle<SelectMgr_EntityOwner> & theOwnerId, const opencascade::handle<TColgp_HArray1OfPnt> & thePoints, const Standard_Boolean theIsBVHEnabled);

		/****************** Select3D_SensitivePoly ******************/
		%feature("compactdefaultargs") Select3D_SensitivePoly;
		%feature("autodoc", "Constructs the sensitive circle object defined by the owner ownerid, the circle circle, the boolean filledcircle and the number of points nbofpoints.

Parameters
----------
theOwnerId: SelectMgr_EntityOwner
theIsBVHEnabled: bool
theNbPnts: int,optional
	default value is 6

Returns
-------
None
") Select3D_SensitivePoly;
		 Select3D_SensitivePoly(const opencascade::handle<SelectMgr_EntityOwner> & theOwnerId, const Standard_Boolean theIsBVHEnabled, const Standard_Integer theNbPnts = 6);

		/****************** BoundingBox ******************/
		%feature("compactdefaultargs") BoundingBox;
		%feature("autodoc", "Returns bounding box of a polygon. if location transformation is set, it will be applied.

Returns
-------
Select3D_BndBox3d
") BoundingBox;
		virtual Select3D_BndBox3d BoundingBox();

		/****************** Box ******************/
		%feature("compactdefaultargs") Box;
		%feature("autodoc", "Returns bounding box of segment with index theidx.

Parameters
----------
theIdx: int

Returns
-------
Select3D_BndBox3d
") Box;
		virtual Select3D_BndBox3d Box(const Standard_Integer theIdx);

		/****************** Center ******************/
		%feature("compactdefaultargs") Center;
		%feature("autodoc", "Returns geometry center of sensitive entity index theidx in the vector along the given axis theaxis.

Parameters
----------
theIdx: int
theAxis: int

Returns
-------
float
") Center;
		virtual Standard_Real Center(const Standard_Integer theIdx, const Standard_Integer theAxis);

		/****************** CenterOfGeometry ******************/
		%feature("compactdefaultargs") CenterOfGeometry;
		%feature("autodoc", "Returns center of the point set. if location transformation is set, it will be applied.

Returns
-------
gp_Pnt
") CenterOfGeometry;
		virtual gp_Pnt CenterOfGeometry();

		/****************** NbSubElements ******************/
		%feature("compactdefaultargs") NbSubElements;
		%feature("autodoc", "Returns the amount of segments in poly.

Returns
-------
int
") NbSubElements;
		virtual Standard_Integer NbSubElements();

		/****************** Points3D ******************/
		%feature("compactdefaultargs") Points3D;
		%feature("autodoc", "Returns the 3d points of the array used at construction time.

Parameters
----------
theHArrayOfPnt: TColgp_HArray1OfPnt

Returns
-------
None
") Points3D;
		void Points3D(opencascade::handle<TColgp_HArray1OfPnt> & theHArrayOfPnt);

		/****************** Size ******************/
		%feature("compactdefaultargs") Size;
		%feature("autodoc", "Returns the amount of segments of the poly.

Returns
-------
int
") Size;
		virtual Standard_Integer Size();

		/****************** Swap ******************/
		%feature("compactdefaultargs") Swap;
		%feature("autodoc", "Swaps items with indexes theidx1 and theidx2 in the vector.

Parameters
----------
theIdx1: int
theIdx2: int

Returns
-------
None
") Swap;
		virtual void Swap(const Standard_Integer theIdx1, const Standard_Integer theIdx2);

};


%make_alias(Select3D_SensitivePoly)

%extend Select3D_SensitivePoly {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************
* class Select3D_SensitivePrimitiveArray *
*****************************************/
class Select3D_SensitivePrimitiveArray : public Select3D_SensitiveSet {
	public:
		/****************** Select3D_SensitivePrimitiveArray ******************/
		%feature("compactdefaultargs") Select3D_SensitivePrimitiveArray;
		%feature("autodoc", "Constructs an empty sensitive object.

Parameters
----------
theOwnerId: SelectMgr_EntityOwner

Returns
-------
None
") Select3D_SensitivePrimitiveArray;
		 Select3D_SensitivePrimitiveArray(const opencascade::handle<SelectMgr_EntityOwner> & theOwnerId);

		/****************** BVH ******************/
		%feature("compactdefaultargs") BVH;
		%feature("autodoc", "Builds bvh tree for sensitive set.

Returns
-------
None
") BVH;
		virtual void BVH();

		/****************** BoundingBox ******************/
		%feature("compactdefaultargs") BoundingBox;
		%feature("autodoc", "Returns bounding box of the triangulation. if location transformation is set, it will be applied.

Returns
-------
Select3D_BndBox3d
") BoundingBox;
		virtual Select3D_BndBox3d BoundingBox();

		/****************** Box ******************/
		%feature("compactdefaultargs") Box;
		%feature("autodoc", "Returns bounding box of triangle/edge with index theidx.

Parameters
----------
theIdx: int

Returns
-------
Select3D_BndBox3d
") Box;
		virtual Select3D_BndBox3d Box(const Standard_Integer theIdx);

		/****************** Center ******************/
		%feature("compactdefaultargs") Center;
		%feature("autodoc", "Returns geometry center of triangle/edge with index theidx in array along the given axis theaxis.

Parameters
----------
theIdx: int
theAxis: int

Returns
-------
float
") Center;
		virtual Standard_Real Center(const Standard_Integer theIdx, const Standard_Integer theAxis);

		/****************** CenterOfGeometry ******************/
		%feature("compactdefaultargs") CenterOfGeometry;
		%feature("autodoc", "Returns center of triangulation. if location transformation is set, it will be applied.

Returns
-------
gp_Pnt
") CenterOfGeometry;
		virtual gp_Pnt CenterOfGeometry();

		/****************** GetConnected ******************/
		%feature("compactdefaultargs") GetConnected;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Select3D_SensitiveEntity>
") GetConnected;
		virtual opencascade::handle<Select3D_SensitiveEntity> GetConnected();

		/****************** HasInitLocation ******************/
		%feature("compactdefaultargs") HasInitLocation;
		%feature("autodoc", "Returns true if the shape corresponding to the entity has init location.

Returns
-------
bool
") HasInitLocation;
		virtual Standard_Boolean HasInitLocation();

		/****************** InitPoints ******************/
		%feature("compactdefaultargs") InitPoints;
		%feature("autodoc", "Initialize the sensitive object from point set. the sub-set of points can be specified by arguments theindexlower and theindexupper (these are for iterating theindices, not to restrict the actual index values!). @param theverts attributes array containing graphic3d_toa_pos with type graphic3d_tod_vec3 or graphic3d_tod_vec2 @param theindices index array defining points @param theinitloc location @param theindexlower the theindices range - first value (inclusive), starting from 0 @param theindexupper the theindices range - last value (inclusive), upto theindices->nbelements-1 @param thetoevalminmax compute bounding box within initialization @param thenbgroups number of groups to split the vertex array into several parts.

Parameters
----------
theVerts: Graphic3d_Buffer
theIndices: Graphic3d_IndexBuffer
theInitLoc: TopLoc_Location
theIndexLower: int
theIndexUpper: int
theToEvalMinMax: bool,optional
	default value is true
theNbGroups: int,optional
	default value is 1

Returns
-------
bool
") InitPoints;
		bool InitPoints(const opencascade::handle<Graphic3d_Buffer> & theVerts, const opencascade::handle<Graphic3d_IndexBuffer> & theIndices, const TopLoc_Location & theInitLoc, const Standard_Integer theIndexLower, const Standard_Integer theIndexUpper, const bool theToEvalMinMax = true, const Standard_Integer theNbGroups = 1);

		/****************** InitPoints ******************/
		%feature("compactdefaultargs") InitPoints;
		%feature("autodoc", "Initialize the sensitive object from point set. @param theverts attributes array containing graphic3d_toa_pos with type graphic3d_tod_vec3 or graphic3d_tod_vec2 @param theindices index array to define subset of points @param theinitloc location @param thetoevalminmax compute bounding box within initialization @param thenbgroups number of groups to split the vertex array into several parts.

Parameters
----------
theVerts: Graphic3d_Buffer
theIndices: Graphic3d_IndexBuffer
theInitLoc: TopLoc_Location
theToEvalMinMax: bool,optional
	default value is true
theNbGroups: int,optional
	default value is 1

Returns
-------
bool
") InitPoints;
		bool InitPoints(const opencascade::handle<Graphic3d_Buffer> & theVerts, const opencascade::handle<Graphic3d_IndexBuffer> & theIndices, const TopLoc_Location & theInitLoc, const bool theToEvalMinMax = true, const Standard_Integer theNbGroups = 1);

		/****************** InitPoints ******************/
		%feature("compactdefaultargs") InitPoints;
		%feature("autodoc", "Initialize the sensitive object from point set. @param theverts attributes array containing graphic3d_toa_pos with type graphic3d_tod_vec3 or graphic3d_tod_vec2 @param theinitloc location @param thetoevalminmax compute bounding box within initialization @param thenbgroups number of groups to split the vertex array into several parts.

Parameters
----------
theVerts: Graphic3d_Buffer
theInitLoc: TopLoc_Location
theToEvalMinMax: bool,optional
	default value is true
theNbGroups: int,optional
	default value is 1

Returns
-------
bool
") InitPoints;
		bool InitPoints(const opencascade::handle<Graphic3d_Buffer> & theVerts, const TopLoc_Location & theInitLoc, const bool theToEvalMinMax = true, const Standard_Integer theNbGroups = 1);

		/****************** InitTriangulation ******************/
		%feature("compactdefaultargs") InitTriangulation;
		%feature("autodoc", "Initialize the sensitive object from triangualtion. the sub-triangulation can be specified by arguments theindexlower and theindexupper (these are for iterating theindices, not to restrict the actual index values!). @param theverts attributes array containing graphic3d_toa_pos with type graphic3d_tod_vec3 or graphic3d_tod_vec2 @param theindices index array defining triangulation @param theinitloc location @param theindexlower the theindices range - first value (inclusive), starting from 0 and multiple by 3 @param theindexupper the theindices range - last value (inclusive), upto theindices->nbelements-1 and multiple by 3 @param thetoevalminmax compute bounding box within initialization @param thenbgroups number of groups to split the vertex array into several parts.

Parameters
----------
theVerts: Graphic3d_Buffer
theIndices: Graphic3d_IndexBuffer
theInitLoc: TopLoc_Location
theIndexLower: int
theIndexUpper: int
theToEvalMinMax: bool,optional
	default value is true
theNbGroups: int,optional
	default value is 1

Returns
-------
bool
") InitTriangulation;
		bool InitTriangulation(const opencascade::handle<Graphic3d_Buffer> & theVerts, const opencascade::handle<Graphic3d_IndexBuffer> & theIndices, const TopLoc_Location & theInitLoc, const Standard_Integer theIndexLower, const Standard_Integer theIndexUpper, const bool theToEvalMinMax = true, const Standard_Integer theNbGroups = 1);

		/****************** InitTriangulation ******************/
		%feature("compactdefaultargs") InitTriangulation;
		%feature("autodoc", "Initialize the sensitive object from triangualtion. @param theverts attributes array containing graphic3d_toa_pos with type graphic3d_tod_vec3 or graphic3d_tod_vec2 @param theindices index array defining triangulation @param theinitloc location @param thetoevalminmax compute bounding box within initialization @param thenbgroups number of groups to split the vertex array into several parts.

Parameters
----------
theVerts: Graphic3d_Buffer
theIndices: Graphic3d_IndexBuffer
theInitLoc: TopLoc_Location
theToEvalMinMax: bool,optional
	default value is true
theNbGroups: int,optional
	default value is 1

Returns
-------
bool
") InitTriangulation;
		bool InitTriangulation(const opencascade::handle<Graphic3d_Buffer> & theVerts, const opencascade::handle<Graphic3d_IndexBuffer> & theIndices, const TopLoc_Location & theInitLoc, const bool theToEvalMinMax = true, const Standard_Integer theNbGroups = 1);

		/****************** InvInitLocation ******************/
		%feature("compactdefaultargs") InvInitLocation;
		%feature("autodoc", "Returns inversed location transformation matrix if the shape corresponding to this entity has init location set. otherwise, returns identity matrix.

Returns
-------
gp_GTrsf
") InvInitLocation;
		virtual gp_GTrsf InvInitLocation();

		/****************** LastDetectedEdgeNode1 ******************/
		%feature("compactdefaultargs") LastDetectedEdgeNode1;
		%feature("autodoc", "Return the first node of last topmost detected edge or -1 if undefined (axis picking).

Returns
-------
int
") LastDetectedEdgeNode1;
		Standard_Integer LastDetectedEdgeNode1();

		/****************** LastDetectedEdgeNode2 ******************/
		%feature("compactdefaultargs") LastDetectedEdgeNode2;
		%feature("autodoc", "Return the second node of last topmost detected edge or -1 if undefined (axis picking).

Returns
-------
int
") LastDetectedEdgeNode2;
		Standard_Integer LastDetectedEdgeNode2();

		/****************** LastDetectedElement ******************/
		%feature("compactdefaultargs") LastDetectedElement;
		%feature("autodoc", "Return last topmost detected element or -1 if undefined (axis picking).

Returns
-------
int
") LastDetectedElement;
		Standard_Integer LastDetectedElement();

		/****************** LastDetectedElementMap ******************/
		%feature("compactdefaultargs") LastDetectedElementMap;
		%feature("autodoc", "Return the index map of last detected elements (rectangle selection).

Returns
-------
opencascade::handle<TColStd_HPackedMapOfInteger>
") LastDetectedElementMap;
		const opencascade::handle<TColStd_HPackedMapOfInteger> & LastDetectedElementMap();

		/****************** LastDetectedNode ******************/
		%feature("compactdefaultargs") LastDetectedNode;
		%feature("autodoc", "Return last topmost detected node or -1 if undefined (axis picking).

Returns
-------
int
") LastDetectedNode;
		Standard_Integer LastDetectedNode();

		/****************** LastDetectedNodeMap ******************/
		%feature("compactdefaultargs") LastDetectedNodeMap;
		%feature("autodoc", "Return the index map of last detected nodes (rectangle selection).

Returns
-------
opencascade::handle<TColStd_HPackedMapOfInteger>
") LastDetectedNodeMap;
		const opencascade::handle<TColStd_HPackedMapOfInteger> & LastDetectedNodeMap();

		/****************** Matches ******************/
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "Checks whether the sensitive entity is overlapped by current selecting volume.

Parameters
----------
theMgr: SelectBasics_SelectingVolumeManager
thePickResult: SelectBasics_PickResult

Returns
-------
bool
") Matches;
		virtual Standard_Boolean Matches(SelectBasics_SelectingVolumeManager & theMgr, SelectBasics_PickResult & thePickResult);

		/****************** NbSubElements ******************/
		%feature("compactdefaultargs") NbSubElements;
		%feature("autodoc", "Returns the amount of nodes in triangulation.

Returns
-------
int
") NbSubElements;
		virtual Standard_Integer NbSubElements();

		/****************** PatchDistance ******************/
		%feature("compactdefaultargs") PatchDistance;
		%feature("autodoc", "Maximum allowed distance between consequential elements in patch (shortreallast() by default). has no effect on indexed triangulation.

Returns
-------
float
") PatchDistance;
		float PatchDistance();

		/****************** PatchSizeMax ******************/
		%feature("compactdefaultargs") PatchSizeMax;
		%feature("autodoc", "Return patch size limit (1 by default).

Returns
-------
int
") PatchSizeMax;
		Standard_Integer PatchSizeMax();

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Sets the owner for all entities in group.

Parameters
----------
theOwnerId: SelectMgr_EntityOwner

Returns
-------
None
") Set;
		virtual void Set(const opencascade::handle<SelectMgr_EntityOwner> & theOwnerId);

		/****************** SetDetectEdges ******************/
		%feature("compactdefaultargs") SetDetectEdges;
		%feature("autodoc", "Setup keeping of the index of last topmost detected edge (axis picking).

Parameters
----------
theToDetect: bool

Returns
-------
None
") SetDetectEdges;
		void SetDetectEdges(bool theToDetect);

		/****************** SetDetectElementMap ******************/
		%feature("compactdefaultargs") SetDetectElementMap;
		%feature("autodoc", "Setup keeping of the index map of last detected elements (rectangle selection).

Parameters
----------
theToDetect: bool

Returns
-------
None
") SetDetectElementMap;
		void SetDetectElementMap(bool theToDetect);

		/****************** SetDetectElements ******************/
		%feature("compactdefaultargs") SetDetectElements;
		%feature("autodoc", "Setup keeping of the index of last topmost detected element (axis picking).

Parameters
----------
theToDetect: bool

Returns
-------
None
") SetDetectElements;
		void SetDetectElements(bool theToDetect);

		/****************** SetDetectNodeMap ******************/
		%feature("compactdefaultargs") SetDetectNodeMap;
		%feature("autodoc", "Setup keeping of the index map of last detected nodes (rectangle selection).

Parameters
----------
theToDetect: bool

Returns
-------
None
") SetDetectNodeMap;
		void SetDetectNodeMap(bool theToDetect);

		/****************** SetDetectNodes ******************/
		%feature("compactdefaultargs") SetDetectNodes;
		%feature("autodoc", "Setup keeping of the index of last topmost detected node (for axis picking).

Parameters
----------
theToDetect: bool

Returns
-------
None
") SetDetectNodes;
		void SetDetectNodes(bool theToDetect);

		/****************** SetMinMax ******************/
		%feature("compactdefaultargs") SetMinMax;
		%feature("autodoc", "Assign new not transformed bounding box.

Parameters
----------
theMinX: double
theMinY: double
theMinZ: double
theMaxX: double
theMaxY: double
theMaxZ: double

Returns
-------
None
") SetMinMax;
		void SetMinMax(double theMinX, double theMinY, double theMinZ, double theMaxX, double theMaxY, double theMaxZ);

		/****************** SetPatchDistance ******************/
		%feature("compactdefaultargs") SetPatchDistance;
		%feature("autodoc", "Assign patch distance limit. should be set before initialization.

Parameters
----------
thePatchDistMax: float

Returns
-------
None
") SetPatchDistance;
		void SetPatchDistance(const float thePatchDistMax);

		/****************** SetPatchSizeMax ******************/
		%feature("compactdefaultargs") SetPatchSizeMax;
		%feature("autodoc", "Assign patch size limit. should be set before initialization.

Parameters
----------
thePatchSizeMax: int

Returns
-------
None
") SetPatchSizeMax;
		void SetPatchSizeMax(const Standard_Integer thePatchSizeMax);

		/****************** Size ******************/
		%feature("compactdefaultargs") Size;
		%feature("autodoc", "Returns the length of array of triangles or edges.

Returns
-------
int
") Size;
		virtual Standard_Integer Size();

		/****************** Swap ******************/
		%feature("compactdefaultargs") Swap;
		%feature("autodoc", "Swaps items with indexes theidx1 and theidx2 in array.

Parameters
----------
theIdx1: int
theIdx2: int

Returns
-------
None
") Swap;
		virtual void Swap(const Standard_Integer theIdx1, const Standard_Integer theIdx2);

		/****************** ToDetectEdges ******************/
		%feature("compactdefaultargs") ToDetectEdges;
		%feature("autodoc", "Return flag to keep index of last topmost detected edge, false by default.

Returns
-------
bool
") ToDetectEdges;
		bool ToDetectEdges();

		/****************** ToDetectElementMap ******************/
		%feature("compactdefaultargs") ToDetectElementMap;
		%feature("autodoc", "Return flag to keep index map of last detected elements, false by default (rectangle selection).

Returns
-------
bool
") ToDetectElementMap;
		bool ToDetectElementMap();

		/****************** ToDetectElements ******************/
		%feature("compactdefaultargs") ToDetectElements;
		%feature("autodoc", "Return flag to keep index of last topmost detected element, true by default.

Returns
-------
bool
") ToDetectElements;
		bool ToDetectElements();

		/****************** ToDetectNodeMap ******************/
		%feature("compactdefaultargs") ToDetectNodeMap;
		%feature("autodoc", "Return flag to keep index map of last detected nodes, false by default (rectangle selection).

Returns
-------
bool
") ToDetectNodeMap;
		bool ToDetectNodeMap();

		/****************** ToDetectNodes ******************/
		%feature("compactdefaultargs") ToDetectNodes;
		%feature("autodoc", "Return flag to keep index of last topmost detected node, false by default.

Returns
-------
bool
") ToDetectNodes;
		bool ToDetectNodes();

};


%make_alias(Select3D_SensitivePrimitiveArray)

%extend Select3D_SensitivePrimitiveArray {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class Select3D_SensitiveTriangulation *
****************************************/
/*******************************
* class Select3D_SensitiveWire *
*******************************/
class Select3D_SensitiveWire : public Select3D_SensitiveSet {
	public:
		/****************** Select3D_SensitiveWire ******************/
		%feature("compactdefaultargs") Select3D_SensitiveWire;
		%feature("autodoc", "Constructs a sensitive wire object defined by the owner theownerid.

Parameters
----------
theOwnerId: SelectMgr_EntityOwner

Returns
-------
None
") Select3D_SensitiveWire;
		 Select3D_SensitiveWire(const opencascade::handle<SelectMgr_EntityOwner> & theOwnerId);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Adds the sensitive entity thesensitive to this framework.

Parameters
----------
theSensitive: Select3D_SensitiveEntity

Returns
-------
None
") Add;
		void Add(const opencascade::handle<Select3D_SensitiveEntity> & theSensitive);

		/****************** BoundingBox ******************/
		%feature("compactdefaultargs") BoundingBox;
		%feature("autodoc", "Returns bounding box of the wire. if location transformation is set, it will be applied.

Returns
-------
Select3D_BndBox3d
") BoundingBox;
		virtual Select3D_BndBox3d BoundingBox();

		/****************** Box ******************/
		%feature("compactdefaultargs") Box;
		%feature("autodoc", "Returns bounding box of sensitive entity with index theidx.

Parameters
----------
theIdx: int

Returns
-------
Select3D_BndBox3d
") Box;
		virtual Select3D_BndBox3d Box(const Standard_Integer theIdx);

		/****************** Center ******************/
		%feature("compactdefaultargs") Center;
		%feature("autodoc", "Returns geometry center of sensitive entity index theidx in the vector along the given axis theaxis.

Parameters
----------
theIdx: int
theAxis: int

Returns
-------
float
") Center;
		virtual Standard_Real Center(const Standard_Integer theIdx, const Standard_Integer theAxis);

		/****************** CenterOfGeometry ******************/
		%feature("compactdefaultargs") CenterOfGeometry;
		%feature("autodoc", "Returns center of the wire. if location transformation is set, it will be applied.

Returns
-------
gp_Pnt
") CenterOfGeometry;
		virtual gp_Pnt CenterOfGeometry();

		/****************** GetConnected ******************/
		%feature("compactdefaultargs") GetConnected;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Select3D_SensitiveEntity>
") GetConnected;
		virtual opencascade::handle<Select3D_SensitiveEntity> GetConnected();

		/****************** GetEdges ******************/
		%feature("compactdefaultargs") GetEdges;
		%feature("autodoc", "Returns the sensitive edges stored in this wire.

Returns
-------
NCollection_Vector<opencascade::handle<Select3D_SensitiveEntity>>
") GetEdges;
		const NCollection_Vector<opencascade::handle<Select3D_SensitiveEntity>> & GetEdges();

		/****************** GetLastDetected ******************/
		%feature("compactdefaultargs") GetLastDetected;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Select3D_SensitiveEntity>
") GetLastDetected;
		opencascade::handle<Select3D_SensitiveEntity> GetLastDetected();

		/****************** NbSubElements ******************/
		%feature("compactdefaultargs") NbSubElements;
		%feature("autodoc", "Returns the amount of sub-entities.

Returns
-------
int
") NbSubElements;
		virtual Standard_Integer NbSubElements();

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Sets the owner for all entities in wire.

Parameters
----------
theOwnerId: SelectMgr_EntityOwner

Returns
-------
None
") Set;
		virtual void Set(const opencascade::handle<SelectMgr_EntityOwner> & theOwnerId);

		/****************** Size ******************/
		%feature("compactdefaultargs") Size;
		%feature("autodoc", "Returns the length of vector of sensitive entities.

Returns
-------
int
") Size;
		virtual Standard_Integer Size();

		/****************** Swap ******************/
		%feature("compactdefaultargs") Swap;
		%feature("autodoc", "Swaps items with indexes theidx1 and theidx2 in the vector.

Parameters
----------
theIdx1: int
theIdx2: int

Returns
-------
None
") Swap;
		virtual void Swap(const Standard_Integer theIdx1, const Standard_Integer theIdx2);

};


%make_alias(Select3D_SensitiveWire)

%extend Select3D_SensitiveWire {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class Select3D_SensitiveCircle *
*********************************/
class Select3D_SensitiveCircle : public Select3D_SensitivePoly {
	public:
		/****************** Select3D_SensitiveCircle ******************/
		%feature("compactdefaultargs") Select3D_SensitiveCircle;
		%feature("autodoc", "Constructs the sensitive circle object defined by the owner theownerid, the circle thecircle, the boolean theisfilled and the number of points thenbpnts.

Parameters
----------
theOwnerId: SelectMgr_EntityOwner
theCircle: Geom_Circle
theIsFilled: bool,optional
	default value is Standard_False
theNbPnts: int,optional
	default value is 12

Returns
-------
None
") Select3D_SensitiveCircle;
		 Select3D_SensitiveCircle(const opencascade::handle<SelectMgr_EntityOwner> & theOwnerId, const opencascade::handle<Geom_Circle> & theCircle, const Standard_Boolean theIsFilled = Standard_False, const Standard_Integer theNbPnts = 12);

		/****************** Select3D_SensitiveCircle ******************/
		%feature("compactdefaultargs") Select3D_SensitiveCircle;
		%feature("autodoc", "Constructs the sensitive arc object defined by the owner theownerid, the circle thecircle, the parameters theu1 and theu2, the boolean theisfilled and the number of points thenbpnts. theu1 and theu2 define the first and last points of the arc on thecircle.

Parameters
----------
theOwnerId: SelectMgr_EntityOwner
theCircle: Geom_Circle
theU1: float
theU2: float
theIsFilled: bool,optional
	default value is Standard_False
theNbPnts: int,optional
	default value is 12

Returns
-------
None
") Select3D_SensitiveCircle;
		 Select3D_SensitiveCircle(const opencascade::handle<SelectMgr_EntityOwner> & theOwnerId, const opencascade::handle<Geom_Circle> & theCircle, const Standard_Real theU1, const Standard_Real theU2, const Standard_Boolean theIsFilled = Standard_False, const Standard_Integer theNbPnts = 12);

		/****************** Select3D_SensitiveCircle ******************/
		%feature("compactdefaultargs") Select3D_SensitiveCircle;
		%feature("autodoc", "Constructs the sensitive circle object defined by the owner theownerid, the array of triangles thepnts3d, and the boolean theisfilled. thepnts3d is an array of consecutive triangles on the circle. the triangle i+1 lies on the intersection of the tangents to the circle of i and i+2. note, that the first point of thepnts3d must be equal to the last point of thepnts3d.

Parameters
----------
theOwnerId: SelectMgr_EntityOwner
thePnts3d: TColgp_HArray1OfPnt
theIsFilled: bool,optional
	default value is Standard_False

Returns
-------
None
") Select3D_SensitiveCircle;
		 Select3D_SensitiveCircle(const opencascade::handle<SelectMgr_EntityOwner> & theOwnerId, const opencascade::handle<TColgp_HArray1OfPnt> & thePnts3d, const Standard_Boolean theIsFilled = Standard_False);

		/****************** Select3D_SensitiveCircle ******************/
		%feature("compactdefaultargs") Select3D_SensitiveCircle;
		%feature("autodoc", "Constructs the sensitive circle object defined by the owner theownerid, the array of points thepnts3d, and the boolean theisfilled. if the length of thepnts3d is more then 1, the first point of thepnts3d must be equal to the last point of thepnts3d.

Parameters
----------
theOwnerId: SelectMgr_EntityOwner
thePnts3d: TColgp_Array1OfPnt
theIsFilled: bool,optional
	default value is Standard_False

Returns
-------
None
") Select3D_SensitiveCircle;
		 Select3D_SensitiveCircle(const opencascade::handle<SelectMgr_EntityOwner> & theOwnerId, const TColgp_Array1OfPnt & thePnts3d, const Standard_Boolean theIsFilled = Standard_False);

		/****************** ArrayBounds ******************/
		%feature("compactdefaultargs") ArrayBounds;
		%feature("autodoc", "No available documentation.

Parameters
----------

Returns
-------
theLow: int
theUp: int
") ArrayBounds;
		void ArrayBounds(Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** BVH ******************/
		%feature("compactdefaultargs") BVH;
		%feature("autodoc", "Builds bvh tree for a circle's edge segments if needed.

Returns
-------
None
") BVH;
		virtual void BVH();

		/****************** CenterOfGeometry ******************/
		%feature("compactdefaultargs") CenterOfGeometry;
		%feature("autodoc", "Returns center of the circle. if location transformation is set, it will be applied.

Returns
-------
gp_Pnt
") CenterOfGeometry;
		virtual gp_Pnt CenterOfGeometry();

		/****************** GetConnected ******************/
		%feature("compactdefaultargs") GetConnected;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Select3D_SensitiveEntity>
") GetConnected;
		virtual opencascade::handle<Select3D_SensitiveEntity> GetConnected();

		/****************** GetPoint3d ******************/
		%feature("compactdefaultargs") GetPoint3d;
		%feature("autodoc", "No available documentation.

Parameters
----------
thePntIdx: int

Returns
-------
gp_Pnt
") GetPoint3d;
		gp_Pnt GetPoint3d(const Standard_Integer thePntIdx);

		/****************** Matches ******************/
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "Checks whether the circle overlaps current selecting volume.

Parameters
----------
theMgr: SelectBasics_SelectingVolumeManager
thePickResult: SelectBasics_PickResult

Returns
-------
bool
") Matches;
		virtual Standard_Boolean Matches(SelectBasics_SelectingVolumeManager & theMgr, SelectBasics_PickResult & thePickResult);

};


%make_alias(Select3D_SensitiveCircle)

%extend Select3D_SensitiveCircle {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class Select3D_SensitiveCurve *
********************************/
class Select3D_SensitiveCurve : public Select3D_SensitivePoly {
	public:
		/****************** Select3D_SensitiveCurve ******************/
		%feature("compactdefaultargs") Select3D_SensitiveCurve;
		%feature("autodoc", "Constructs a sensitive curve object defined by the owner theownerid, the curve thecurve, and the maximum number of points on the curve: thenbpnts.

Parameters
----------
theOwnerId: SelectMgr_EntityOwner
theCurve: Geom_Curve
theNbPnts: int,optional
	default value is 17

Returns
-------
None
") Select3D_SensitiveCurve;
		 Select3D_SensitiveCurve(const opencascade::handle<SelectMgr_EntityOwner> & theOwnerId, const opencascade::handle<Geom_Curve> & theCurve, const Standard_Integer theNbPnts = 17);

		/****************** Select3D_SensitiveCurve ******************/
		%feature("compactdefaultargs") Select3D_SensitiveCurve;
		%feature("autodoc", "Constructs a sensitive curve object defined by the owner theownerid and the set of points thepoints.

Parameters
----------
theOwnerId: SelectMgr_EntityOwner
thePoints: TColgp_HArray1OfPnt

Returns
-------
None
") Select3D_SensitiveCurve;
		 Select3D_SensitiveCurve(const opencascade::handle<SelectMgr_EntityOwner> & theOwnerId, const opencascade::handle<TColgp_HArray1OfPnt> & thePoints);

		/****************** Select3D_SensitiveCurve ******************/
		%feature("compactdefaultargs") Select3D_SensitiveCurve;
		%feature("autodoc", "Creation of sensitive curve from points. warning : this method should disappear in the next version...

Parameters
----------
theOwnerId: SelectMgr_EntityOwner
thePoints: TColgp_Array1OfPnt

Returns
-------
None
") Select3D_SensitiveCurve;
		 Select3D_SensitiveCurve(const opencascade::handle<SelectMgr_EntityOwner> & theOwnerId, const TColgp_Array1OfPnt & thePoints);

		/****************** GetConnected ******************/
		%feature("compactdefaultargs") GetConnected;
		%feature("autodoc", "Returns the copy of this.

Returns
-------
opencascade::handle<Select3D_SensitiveEntity>
") GetConnected;
		virtual opencascade::handle<Select3D_SensitiveEntity> GetConnected();

};


%make_alias(Select3D_SensitiveCurve)

%extend Select3D_SensitiveCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* python proxy for excluded classes */
%pythoncode {
@classnotwrapped
class Select3D_SensitiveTriangulation:
	pass

@classnotwrapped
class Select3D_SensitiveEntity:
	pass

@classnotwrapped
class Handle_Select3D_SensitiveEntity:
	pass

@classnotwrapped
class Select3D_SensitiveSet:
	pass

}
/* end python proxy for excluded classes */
/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
