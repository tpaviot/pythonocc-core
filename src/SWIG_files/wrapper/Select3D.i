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
#include<SelectBasics_module.hxx>
#include<SelectMgr_module.hxx>
#include<Bnd_module.hxx>
#include<TColgp_module.hxx>
#include<TopLoc_module.hxx>
#include<TColStd_module.hxx>
#include<Geom_module.hxx>
#include<TShort_module.hxx>
#include<TColQuantity_module.hxx>
#include<Aspect_module.hxx>
#include<Visual3d_module.hxx>
#include<Graphic3d_module.hxx>
#include<Quantity_module.hxx>
#include<Message_module.hxx>
#include<TopLoc_module.hxx>
#include<V3d_module.hxx>
#include<TopTools_module.hxx>
#include<Poly_module.hxx>
#include<HLRAlgo_module.hxx>
#include<Prs3d_module.hxx>
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
%import SelectBasics.i
%import SelectMgr.i
%import Bnd.i
%import TColgp.i
%import TopLoc.i
%import TColStd.i
%import Geom.i
/* public enums */
enum Select3D_TypeOfSensitivity {
	Select3D_TOS_INTERIOR = 0,
	Select3D_TOS_BOUNDARY = 1,
};

/* end public enums declaration */

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
%template(Select3D_EntitySequence) NCollection_Sequence <opencascade::handle <Select3D_SensitiveEntity>>;
%template(Select3D_EntitySequenceIter) NCollection_TListIterator<Select3D_EntitySequence>;
%template(Select3D_VectorOfHPoly) NCollection_Vector <opencascade::handle <Select3D_SensitivePoly>>;
%template(Select3D_Vec3) NCollection_Vec3 <Standard_Real>;
%template(Select3D_IndexedMapOfEntity) NCollection_IndexedMap <opencascade::handle <Select3D_SensitiveEntity>>;
/* end templates declaration */

/* typedefs */
typedef NCollection_Sequence <opencascade::handle <Select3D_SensitiveEntity>> Select3D_EntitySequence;
typedef NCollection_Sequence <opencascade::handle <Select3D_SensitiveEntity>>::Iterator Select3D_EntitySequenceIter;
typedef NCollection_Vector <opencascade::handle <Select3D_SensitivePoly>> Select3D_VectorOfHPoly;
typedef BVH_Builder <Standard_Real , 3> Select3D_BVHBuilder3d;
typedef NCollection_Vec3 <Standard_Real> Select3D_Vec3;
typedef NCollection_IndexedMap <opencascade::handle <Select3D_SensitiveEntity>> Select3D_IndexedMapOfEntity;
typedef Select3D_SensitiveEntity SelectBasics_SensitiveEntity;
/* end typedefs declaration */

/********************************
* class Select3D_BVHIndexBuffer *
********************************/
class Select3D_BVHIndexBuffer : public Graphic3d_Buffer {
	public:
		/****************** HasPatches ******************/
		%feature("compactdefaultargs") HasPatches;
		%feature("autodoc", ":rtype: bool") HasPatches;
		bool HasPatches ();

		/****************** Index ******************/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "* Access index at specified position
	:param theIndex:
	:type theIndex: int
	:rtype: int") Index;
		Standard_Integer Index (const Standard_Integer theIndex);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Allocates new empty index array
	:param theNbElems:
	:type theNbElems: int
	:param theHasPatches:
	:type theHasPatches: bool
	:rtype: bool") Init;
		bool Init (const Standard_Integer theNbElems,const bool theHasPatches);

		/****************** PatchSize ******************/
		%feature("compactdefaultargs") PatchSize;
		%feature("autodoc", "* Access index at specified position
	:param theIndex:
	:type theIndex: int
	:rtype: int") PatchSize;
		Standard_Integer PatchSize (const Standard_Integer theIndex);

		/****************** Select3D_BVHIndexBuffer ******************/
		%feature("compactdefaultargs") Select3D_BVHIndexBuffer;
		%feature("autodoc", "* Empty constructor.
	:param theAlloc:
	:type theAlloc: NCollection_BaseAllocator
	:rtype: None") Select3D_BVHIndexBuffer;
		 Select3D_BVHIndexBuffer (const opencascade::handle<NCollection_BaseAllocator> & theAlloc);

		/****************** SetIndex ******************/
		%feature("compactdefaultargs") SetIndex;
		%feature("autodoc", "* Change index at specified position
	:param theIndex:
	:type theIndex: int
	:param theValue:
	:type theValue: int
	:rtype: None") SetIndex;
		void SetIndex (const Standard_Integer theIndex,const Standard_Integer theValue);

		/****************** SetIndex ******************/
		%feature("compactdefaultargs") SetIndex;
		%feature("autodoc", "* Change index at specified position
	:param theIndex:
	:type theIndex: int
	:param theValue:
	:type theValue: int
	:param thePatchSize:
	:type thePatchSize: int
	:rtype: None") SetIndex;
		void SetIndex (const Standard_Integer theIndex,const Standard_Integer theValue,const Standard_Integer thePatchSize);

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
		/****************** operator = ******************/
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", ":param thePnt:
	:type thePnt: gp_Pnt
	:rtype: gp_Pnt") operator =;
		gp_Pnt operator = (const gp_Pnt & thePnt);

		/****************** operator gp_Pnt ******************/
		%feature("compactdefaultargs") operator gp_Pnt;
		%feature("autodoc", ":rtype: None") operator gp_Pnt;
		 operator gp_Pnt ();

		/****************** operator gp_XYZ ******************/
		%feature("compactdefaultargs") operator gp_XYZ;
		%feature("autodoc", ":rtype: None") operator gp_XYZ;
		 operator gp_XYZ ();

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
		/****************** Pnt ******************/
		%feature("compactdefaultargs") Pnt;
		%feature("autodoc", ":param theIndex:
	:type theIndex: int
	:rtype: Select3D_Pnt") Pnt;
		const Select3D_Pnt & Pnt (const Standard_Integer theIndex);

		/****************** Pnt3d ******************/
		%feature("compactdefaultargs") Pnt3d;
		%feature("autodoc", ":param theIndex:
	:type theIndex: int
	:rtype: gp_Pnt") Pnt3d;
		gp_Pnt Pnt3d (const Standard_Integer theIndex);

		/****************** Select3D_PointData ******************/
		%feature("compactdefaultargs") Select3D_PointData;
		%feature("autodoc", ":param theNbPoints:
	:type theNbPoints: int
	:rtype: None") Select3D_PointData;
		 Select3D_PointData (const Standard_Integer theNbPoints);

		/****************** SetPnt ******************/
		%feature("compactdefaultargs") SetPnt;
		%feature("autodoc", ":param theIndex:
	:type theIndex: int
	:param theValue:
	:type theValue: Select3D_Pnt
	:rtype: None") SetPnt;
		void SetPnt (const Standard_Integer theIndex,const Select3D_Pnt & theValue);

		/****************** SetPnt ******************/
		%feature("compactdefaultargs") SetPnt;
		%feature("autodoc", ":param theIndex:
	:type theIndex: int
	:param theValue:
	:type theValue: gp_Pnt
	:rtype: None") SetPnt;
		void SetPnt (const Standard_Integer theIndex,const gp_Pnt & theValue);

		/****************** Size ******************/
		%feature("compactdefaultargs") Size;
		%feature("autodoc", ":rtype: int") Size;
		Standard_Integer Size ();

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
		/****************** BoundingBox ******************/
		%feature("compactdefaultargs") BoundingBox;
		%feature("autodoc", "* Returns coordinates of the box. If location transformation is set, it will be applied
	:rtype: Select3D_BndBox3d") BoundingBox;
		virtual Select3D_BndBox3d BoundingBox ();

		/****************** CenterOfGeometry ******************/
		%feature("compactdefaultargs") CenterOfGeometry;
		%feature("autodoc", "* Returns center of the box. If location transformation is set, it will be applied
	:rtype: gp_Pnt") CenterOfGeometry;
		virtual gp_Pnt CenterOfGeometry ();

		/****************** GetConnected ******************/
		%feature("compactdefaultargs") GetConnected;
		%feature("autodoc", ":rtype: opencascade::handle<Select3D_SensitiveEntity>") GetConnected;
		virtual opencascade::handle<Select3D_SensitiveEntity> GetConnected ();

		/****************** Matches ******************/
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "* Checks whether the box overlaps current selecting volume
	:param theMgr:
	:type theMgr: SelectBasics_SelectingVolumeManager
	:param thePickResult:
	:type thePickResult: SelectBasics_PickResult
	:rtype: bool") Matches;
		virtual Standard_Boolean Matches (SelectBasics_SelectingVolumeManager & theMgr,SelectBasics_PickResult & thePickResult);

		/****************** NbSubElements ******************/
		%feature("compactdefaultargs") NbSubElements;
		%feature("autodoc", "* Returns the amount of sub-entities in sensitive
	:rtype: int") NbSubElements;
		virtual Standard_Integer NbSubElements ();

		/****************** Select3D_SensitiveBox ******************/
		%feature("compactdefaultargs") Select3D_SensitiveBox;
		%feature("autodoc", "* Constructs a sensitive box object defined by the owner theOwnerId, and the box theBox.
	:param theOwnerId:
	:type theOwnerId: SelectMgr_EntityOwner
	:param theBox:
	:type theBox: Bnd_Box
	:rtype: None") Select3D_SensitiveBox;
		 Select3D_SensitiveBox (const opencascade::handle<SelectMgr_EntityOwner> & theOwnerId,const Bnd_Box & theBox);

		/****************** Select3D_SensitiveBox ******************/
		%feature("compactdefaultargs") Select3D_SensitiveBox;
		%feature("autodoc", "* Constructs a sensitive box object defined by the owner theOwnerId, and the coordinates theXmin, theYMin, theZMin, theXMax, theYMax, theZMax. theXmin, theYMin and theZMin define the minimum point in the front lower left hand corner of the box, and theXMax, theYMax and theZMax define the maximum point in the back upper right hand corner of the box.
	:param theOwnerId:
	:type theOwnerId: SelectMgr_EntityOwner
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
	:rtype: None") Select3D_SensitiveBox;
		 Select3D_SensitiveBox (const opencascade::handle<SelectMgr_EntityOwner> & theOwnerId,const Standard_Real theXMin,const Standard_Real theYMin,const Standard_Real theZMin,const Standard_Real theXMax,const Standard_Real theYMax,const Standard_Real theZMax);

};


%make_alias(Select3D_SensitiveBox)

%extend Select3D_SensitiveBox {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class Select3D_SensitiveFace *
*******************************/
class Select3D_SensitiveFace : public Select3D_SensitiveEntity {
	public:
		/****************** BVH ******************/
		%feature("compactdefaultargs") BVH;
		%feature("autodoc", "* Builds BVH tree for the face
	:rtype: void") BVH;
		virtual void BVH ();

		/****************** BoundingBox ******************/
		%feature("compactdefaultargs") BoundingBox;
		%feature("autodoc", "* Returns bounding box of the face. If location transformation is set, it will be applied
	:rtype: Select3D_BndBox3d") BoundingBox;
		virtual Select3D_BndBox3d BoundingBox ();

		/****************** CenterOfGeometry ******************/
		%feature("compactdefaultargs") CenterOfGeometry;
		%feature("autodoc", "* Returns center of the face. If location transformation is set, it will be applied
	:rtype: gp_Pnt") CenterOfGeometry;
		virtual gp_Pnt CenterOfGeometry ();

		/****************** GetConnected ******************/
		%feature("compactdefaultargs") GetConnected;
		%feature("autodoc", ":rtype: opencascade::handle<Select3D_SensitiveEntity>") GetConnected;
		virtual opencascade::handle<Select3D_SensitiveEntity> GetConnected ();

		/****************** GetPoints ******************/
		%feature("compactdefaultargs") GetPoints;
		%feature("autodoc", "* Initializes the given array theHArrayOfPnt by 3d coordinates of vertices of the face
	:param theHArrayOfPnt:
	:type theHArrayOfPnt: TColgp_HArray1OfPnt
	:rtype: None") GetPoints;
		void GetPoints (opencascade::handle<TColgp_HArray1OfPnt> & theHArrayOfPnt);

		/****************** Matches ******************/
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "* Checks whether the face overlaps current selecting volume
	:param theMgr:
	:type theMgr: SelectBasics_SelectingVolumeManager
	:param thePickResult:
	:type thePickResult: SelectBasics_PickResult
	:rtype: bool") Matches;
		virtual Standard_Boolean Matches (SelectBasics_SelectingVolumeManager & theMgr,SelectBasics_PickResult & thePickResult);

		/****************** NbSubElements ******************/
		%feature("compactdefaultargs") NbSubElements;
		%feature("autodoc", "* Returns the amount of sub-entities (points or planar convex polygons)
	:rtype: int") NbSubElements;
		virtual Standard_Integer NbSubElements ();

		/****************** Select3D_SensitiveFace ******************/
		%feature("compactdefaultargs") Select3D_SensitiveFace;
		%feature("autodoc", "* Constructs a sensitive face object defined by the owner theOwnerId, the array of points thePoints, and the sensitivity type theType. The array of points is the outer polygon of the geometric face.
	:param theOwnerId:
	:type theOwnerId: SelectMgr_EntityOwner
	:param thePoints:
	:type thePoints: TColgp_Array1OfPnt
	:param theType:
	:type theType: Select3D_TypeOfSensitivity
	:rtype: None") Select3D_SensitiveFace;
		 Select3D_SensitiveFace (const opencascade::handle<SelectMgr_EntityOwner> & theOwnerId,const TColgp_Array1OfPnt & thePoints,const Select3D_TypeOfSensitivity theType);

		/****************** Select3D_SensitiveFace ******************/
		%feature("compactdefaultargs") Select3D_SensitiveFace;
		%feature("autodoc", "* Constructs a sensitive face object defined by the owner theOwnerId, the array of points thePoints, and the sensitivity type theType. The array of points is the outer polygon of the geometric face.
	:param theOwnerId:
	:type theOwnerId: SelectMgr_EntityOwner
	:param thePoints:
	:type thePoints: TColgp_HArray1OfPnt
	:param theType:
	:type theType: Select3D_TypeOfSensitivity
	:rtype: None") Select3D_SensitiveFace;
		 Select3D_SensitiveFace (const opencascade::handle<SelectMgr_EntityOwner> & theOwnerId,const opencascade::handle<TColgp_HArray1OfPnt> & thePoints,const Select3D_TypeOfSensitivity theType);

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
		/****************** BoundingBox ******************/
		%feature("compactdefaultargs") BoundingBox;
		%feature("autodoc", "* Returns bounding box of the point. If location transformation is set, it will be applied
	:rtype: Select3D_BndBox3d") BoundingBox;
		virtual Select3D_BndBox3d BoundingBox ();

		/****************** CenterOfGeometry ******************/
		%feature("compactdefaultargs") CenterOfGeometry;
		%feature("autodoc", "* Returns center of point. If location transformation is set, it will be applied
	:rtype: gp_Pnt") CenterOfGeometry;
		virtual gp_Pnt CenterOfGeometry ();

		/****************** GetConnected ******************/
		%feature("compactdefaultargs") GetConnected;
		%feature("autodoc", ":rtype: opencascade::handle<Select3D_SensitiveEntity>") GetConnected;
		virtual opencascade::handle<Select3D_SensitiveEntity> GetConnected ();

		/****************** Matches ******************/
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "* Checks whether the point overlaps current selecting volume
	:param theMgr:
	:type theMgr: SelectBasics_SelectingVolumeManager
	:param thePickResult:
	:type thePickResult: SelectBasics_PickResult
	:rtype: bool") Matches;
		virtual Standard_Boolean Matches (SelectBasics_SelectingVolumeManager & theMgr,SelectBasics_PickResult & thePickResult);

		/****************** NbSubElements ******************/
		%feature("compactdefaultargs") NbSubElements;
		%feature("autodoc", "* Returns the amount of sub-entities in sensitive
	:rtype: int") NbSubElements;
		virtual Standard_Integer NbSubElements ();

		/****************** Point ******************/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "* Returns the point used at the time of construction.
	:rtype: gp_Pnt") Point;
		const gp_Pnt  Point ();

		/****************** Select3D_SensitivePoint ******************/
		%feature("compactdefaultargs") Select3D_SensitivePoint;
		%feature("autodoc", "* Constructs a sensitive point object defined by the owner OwnerId and the point Point.
	:param theOwnerId:
	:type theOwnerId: SelectMgr_EntityOwner
	:param thePoint:
	:type thePoint: gp_Pnt
	:rtype: None") Select3D_SensitivePoint;
		 Select3D_SensitivePoint (const opencascade::handle<SelectMgr_EntityOwner> & theOwnerId,const gp_Pnt & thePoint);

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
		/****************** BoundingBox ******************/
		%feature("compactdefaultargs") BoundingBox;
		%feature("autodoc", "* Returns bounding box of the segment. If location transformation is set, it will be applied
	:rtype: Select3D_BndBox3d") BoundingBox;
		virtual Select3D_BndBox3d BoundingBox ();

		/****************** CenterOfGeometry ******************/
		%feature("compactdefaultargs") CenterOfGeometry;
		%feature("autodoc", "* Returns center of the segment. If location transformation is set, it will be applied
	:rtype: gp_Pnt") CenterOfGeometry;
		virtual gp_Pnt CenterOfGeometry ();

		/****************** EndPoint ******************/
		%feature("compactdefaultargs") EndPoint;
		%feature("autodoc", "* gives the 3D End Point of the Segment
	:rtype: gp_Pnt") EndPoint;
		const gp_Pnt  EndPoint ();

		/****************** EndPoint ******************/
		%feature("compactdefaultargs") EndPoint;
		%feature("autodoc", "* changes the end point of the segment
	:param thePnt:
	:type thePnt: gp_Pnt
	:rtype: None") EndPoint;
		void EndPoint (const gp_Pnt & thePnt);

		/****************** GetConnected ******************/
		%feature("compactdefaultargs") GetConnected;
		%feature("autodoc", ":rtype: opencascade::handle<Select3D_SensitiveEntity>") GetConnected;
		virtual opencascade::handle<Select3D_SensitiveEntity> GetConnected ();

		/****************** Matches ******************/
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "* Checks whether the segment overlaps current selecting volume
	:param theMgr:
	:type theMgr: SelectBasics_SelectingVolumeManager
	:param thePickResult:
	:type thePickResult: SelectBasics_PickResult
	:rtype: bool") Matches;
		virtual Standard_Boolean Matches (SelectBasics_SelectingVolumeManager & theMgr,SelectBasics_PickResult & thePickResult);

		/****************** NbSubElements ******************/
		%feature("compactdefaultargs") NbSubElements;
		%feature("autodoc", "* Returns the amount of points
	:rtype: int") NbSubElements;
		virtual Standard_Integer NbSubElements ();

		/****************** Select3D_SensitiveSegment ******************/
		%feature("compactdefaultargs") Select3D_SensitiveSegment;
		%feature("autodoc", "* Constructs the sensitive segment object defined by the owner theOwnerId, the points theFirstPnt, theLastPnt
	:param theOwnerId:
	:type theOwnerId: SelectMgr_EntityOwner
	:param theFirstPnt:
	:type theFirstPnt: gp_Pnt
	:param theLastPnt:
	:type theLastPnt: gp_Pnt
	:rtype: None") Select3D_SensitiveSegment;
		 Select3D_SensitiveSegment (const opencascade::handle<SelectMgr_EntityOwner> & theOwnerId,const gp_Pnt & theFirstPnt,const gp_Pnt & theLastPnt);

		/****************** SetEndPoint ******************/
		%feature("compactdefaultargs") SetEndPoint;
		%feature("autodoc", "* changes the end point of the segment
	:param thePnt:
	:type thePnt: gp_Pnt
	:rtype: None") SetEndPoint;
		void SetEndPoint (const gp_Pnt & thePnt);

		/****************** SetStartPoint ******************/
		%feature("compactdefaultargs") SetStartPoint;
		%feature("autodoc", "* changes the start Point of the Segment;
	:param thePnt:
	:type thePnt: gp_Pnt
	:rtype: None") SetStartPoint;
		void SetStartPoint (const gp_Pnt & thePnt);

		/****************** StartPoint ******************/
		%feature("compactdefaultargs") StartPoint;
		%feature("autodoc", "* gives the 3D start Point of the Segment
	:rtype: gp_Pnt") StartPoint;
		const gp_Pnt  StartPoint ();

		/****************** StartPoint ******************/
		%feature("compactdefaultargs") StartPoint;
		%feature("autodoc", "* changes the start Point of the Segment;
	:param thePnt:
	:type thePnt: gp_Pnt
	:rtype: None") StartPoint;
		void StartPoint (const gp_Pnt & thePnt);

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
		/****************** BoundingBox ******************/
		%feature("compactdefaultargs") BoundingBox;
		%feature("autodoc", "* Returns bounding box of the triangle. If location transformation is set, it will be applied
	:rtype: Select3D_BndBox3d") BoundingBox;
		virtual Select3D_BndBox3d BoundingBox ();

		/****************** Center3D ******************/
		%feature("compactdefaultargs") Center3D;
		%feature("autodoc", "* Returns the center point of the sensitive triangle created at construction time.
	:rtype: gp_Pnt") Center3D;
		gp_Pnt Center3D ();

		/****************** CenterOfGeometry ******************/
		%feature("compactdefaultargs") CenterOfGeometry;
		%feature("autodoc", ":rtype: gp_Pnt") CenterOfGeometry;
		gp_Pnt CenterOfGeometry ();

		/****************** GetConnected ******************/
		%feature("compactdefaultargs") GetConnected;
		%feature("autodoc", "* Returns the copy of this
	:rtype: opencascade::handle<Select3D_SensitiveEntity>") GetConnected;
		virtual opencascade::handle<Select3D_SensitiveEntity> GetConnected ();

		/****************** Matches ******************/
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "* Checks whether the triangle overlaps current selecting volume
	:param theMgr:
	:type theMgr: SelectBasics_SelectingVolumeManager
	:param thePickResult:
	:type thePickResult: SelectBasics_PickResult
	:rtype: bool") Matches;
		virtual Standard_Boolean Matches (SelectBasics_SelectingVolumeManager & theMgr,SelectBasics_PickResult & thePickResult);

		/****************** NbSubElements ******************/
		%feature("compactdefaultargs") NbSubElements;
		%feature("autodoc", "* Returns the amount of points
	:rtype: int") NbSubElements;
		Standard_Integer NbSubElements ();

		/****************** Points3D ******************/
		%feature("compactdefaultargs") Points3D;
		%feature("autodoc", "* Returns the 3D points P1, P2, P3 used at the time of construction.
	:param thePnt0:
	:type thePnt0: gp_Pnt
	:param thePnt1:
	:type thePnt1: gp_Pnt
	:param thePnt2:
	:type thePnt2: gp_Pnt
	:rtype: None") Points3D;
		void Points3D (gp_Pnt & thePnt0,gp_Pnt & thePnt1,gp_Pnt & thePnt2);

		/****************** Select3D_SensitiveTriangle ******************/
		%feature("compactdefaultargs") Select3D_SensitiveTriangle;
		%feature("autodoc", "* Constructs a sensitive triangle object defined by the owner theOwnerId, the points P1, P2, P3, and the type of sensitivity Sensitivity.
	:param theOwnerId:
	:type theOwnerId: SelectMgr_EntityOwner
	:param thePnt0:
	:type thePnt0: gp_Pnt
	:param thePnt1:
	:type thePnt1: gp_Pnt
	:param thePnt2:
	:type thePnt2: gp_Pnt
	:param theType: default value is Select3D_TOS_INTERIOR
	:type theType: Select3D_TypeOfSensitivity
	:rtype: None") Select3D_SensitiveTriangle;
		 Select3D_SensitiveTriangle (const opencascade::handle<SelectMgr_EntityOwner> & theOwnerId,const gp_Pnt & thePnt0,const gp_Pnt & thePnt1,const gp_Pnt & thePnt2,const Select3D_TypeOfSensitivity theType = Select3D_TOS_INTERIOR);

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
		/****************** BoundingBox ******************/
		%feature("compactdefaultargs") BoundingBox;
		%feature("autodoc", "* Returns bounding box of the point set. If location transformation is set, it will be applied
	:rtype: Select3D_BndBox3d") BoundingBox;
		virtual Select3D_BndBox3d BoundingBox ();

		/****************** Box ******************/
		%feature("compactdefaultargs") Box;
		%feature("autodoc", "* Returns bounding box of planar convex polygon with index theIdx
	:param theIdx:
	:type theIdx: int
	:rtype: Select3D_BndBox3d") Box;
		virtual Select3D_BndBox3d Box (const Standard_Integer theIdx);

		/****************** Center ******************/
		%feature("compactdefaultargs") Center;
		%feature("autodoc", "* Returns geometry center of planar convex polygon with index theIdx in the vector along the given axis theAxis
	:param theIdx:
	:type theIdx: int
	:param theAxis:
	:type theAxis: int
	:rtype: float") Center;
		virtual Standard_Real Center (const Standard_Integer theIdx,const Standard_Integer theAxis);

		/****************** CenterOfGeometry ******************/
		%feature("compactdefaultargs") CenterOfGeometry;
		%feature("autodoc", "* Returns center of the point set. If location transformation is set, it will be applied
	:rtype: gp_Pnt") CenterOfGeometry;
		virtual gp_Pnt CenterOfGeometry ();

		/****************** GetPoints ******************/
		%feature("compactdefaultargs") GetPoints;
		%feature("autodoc", "* Initializes the given array theHArrayOfPnt by 3d coordinates of vertices of the whole point set
	:param theHArrayOfPnt:
	:type theHArrayOfPnt: TColgp_HArray1OfPnt
	:rtype: void") GetPoints;
		virtual void GetPoints (opencascade::handle<TColgp_HArray1OfPnt> & theHArrayOfPnt);

		/****************** NbSubElements ******************/
		%feature("compactdefaultargs") NbSubElements;
		%feature("autodoc", "* Returns the amount of points in set
	:rtype: int") NbSubElements;
		virtual Standard_Integer NbSubElements ();

		/****************** Select3D_InteriorSensitivePointSet ******************/
		%feature("compactdefaultargs") Select3D_InteriorSensitivePointSet;
		%feature("autodoc", "* Splits the given point set thePoints onto planar convex polygons
	:param theOwnerId:
	:type theOwnerId: SelectMgr_EntityOwner
	:param thePoints:
	:type thePoints: TColgp_Array1OfPnt
	:rtype: None") Select3D_InteriorSensitivePointSet;
		 Select3D_InteriorSensitivePointSet (const opencascade::handle<SelectMgr_EntityOwner> & theOwnerId,const TColgp_Array1OfPnt & thePoints);

		/****************** Size ******************/
		%feature("compactdefaultargs") Size;
		%feature("autodoc", "* Returns the length of vector of planar convex polygons
	:rtype: int") Size;
		virtual Standard_Integer Size ();

		/****************** Swap ******************/
		%feature("compactdefaultargs") Swap;
		%feature("autodoc", "* Swaps items with indexes theIdx1 and theIdx2 in the vector
	:param theIdx1:
	:type theIdx1: int
	:param theIdx2:
	:type theIdx2: int
	:rtype: void") Swap;
		virtual void Swap (const Standard_Integer theIdx1,const Standard_Integer theIdx2);

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
		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "* Adds the list of sensitive entities LL to the empty sensitive group object created at construction time.
	:param theEntities:
	:type theEntities: Select3D_EntitySequence
	:rtype: None") Add;
		void Add (Select3D_EntitySequence & theEntities);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "* Adds the sensitive entity aSensitive to the non-empty sensitive group object created at construction time.
	:param theSensitive:
	:type theSensitive: Select3D_SensitiveEntity
	:rtype: None") Add;
		void Add (const opencascade::handle<Select3D_SensitiveEntity> & theSensitive);

		/****************** BoundingBox ******************/
		%feature("compactdefaultargs") BoundingBox;
		%feature("autodoc", "* Returns bounding box of the group. If location transformation is set, it will be applied
	:rtype: Select3D_BndBox3d") BoundingBox;
		virtual Select3D_BndBox3d BoundingBox ();

		/****************** Box ******************/
		%feature("compactdefaultargs") Box;
		%feature("autodoc", "* Returns bounding box of sensitive entity with index theIdx
	:param theIdx:
	:type theIdx: int
	:rtype: Select3D_BndBox3d") Box;
		virtual Select3D_BndBox3d Box (const Standard_Integer theIdx);

		/****************** Center ******************/
		%feature("compactdefaultargs") Center;
		%feature("autodoc", "* Returns geometry center of sensitive entity index theIdx in the vector along the given axis theAxis
	:param theIdx:
	:type theIdx: int
	:param theAxis:
	:type theAxis: int
	:rtype: float") Center;
		virtual Standard_Real Center (const Standard_Integer theIdx,const Standard_Integer theAxis);

		/****************** CenterOfGeometry ******************/
		%feature("compactdefaultargs") CenterOfGeometry;
		%feature("autodoc", "* Returns center of entity set. If location transformation is set, it will be applied
	:rtype: gp_Pnt") CenterOfGeometry;
		virtual gp_Pnt CenterOfGeometry ();

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "* Removes all sensitive entities from the list used at the time of construction, or added using the function Add.
	:rtype: None") Clear;
		void Clear ();

		/****************** Entities ******************/
		%feature("compactdefaultargs") Entities;
		%feature("autodoc", "* Gets group content
	:rtype: Select3D_IndexedMapOfEntity") Entities;
		const Select3D_IndexedMapOfEntity & Entities ();

		/****************** GetConnected ******************/
		%feature("compactdefaultargs") GetConnected;
		%feature("autodoc", ":rtype: opencascade::handle<Select3D_SensitiveEntity>") GetConnected;
		virtual opencascade::handle<Select3D_SensitiveEntity> GetConnected ();

		/****************** IsIn ******************/
		%feature("compactdefaultargs") IsIn;
		%feature("autodoc", "* Returns true if the sensitive entity aSensitive is in the list used at the time of construction, or added using the function Add.
	:param theSensitive:
	:type theSensitive: Select3D_SensitiveEntity
	:rtype: bool") IsIn;
		Standard_Boolean IsIn (const opencascade::handle<Select3D_SensitiveEntity> & theSensitive);

		/****************** LastDetectedEntity ******************/
		%feature("compactdefaultargs") LastDetectedEntity;
		%feature("autodoc", "* Return last detected entity.
	:rtype: opencascade::handle<Select3D_SensitiveEntity>") LastDetectedEntity;
		opencascade::handle<Select3D_SensitiveEntity> LastDetectedEntity ();

		/****************** LastDetectedEntityIndex ******************/
		%feature("compactdefaultargs") LastDetectedEntityIndex;
		%feature("autodoc", "* Return index of last detected entity.
	:rtype: int") LastDetectedEntityIndex;
		Standard_Integer LastDetectedEntityIndex ();

		/****************** Matches ******************/
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "* Checks whether the group overlaps current selecting volume
	:param theMgr:
	:type theMgr: SelectBasics_SelectingVolumeManager
	:param thePickResult:
	:type thePickResult: SelectBasics_PickResult
	:rtype: bool") Matches;
		virtual Standard_Boolean Matches (SelectBasics_SelectingVolumeManager & theMgr,SelectBasics_PickResult & thePickResult);

		/****************** MustMatchAll ******************/
		%feature("compactdefaultargs") MustMatchAll;
		%feature("autodoc", "* Returns true if all sensitive entities in the list used at the time of construction, or added using the function Add must be matched.
	:rtype: bool") MustMatchAll;
		Standard_Boolean MustMatchAll ();

		/****************** NbSubElements ******************/
		%feature("compactdefaultargs") NbSubElements;
		%feature("autodoc", "* Returns the amount of sub-entities
	:rtype: int") NbSubElements;
		virtual Standard_Integer NbSubElements ();

		/****************** Remove ******************/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", ":param theSensitive:
	:type theSensitive: Select3D_SensitiveEntity
	:rtype: None") Remove;
		void Remove (const opencascade::handle<Select3D_SensitiveEntity> & theSensitive);

		/****************** Select3D_SensitiveGroup ******************/
		%feature("compactdefaultargs") Select3D_SensitiveGroup;
		%feature("autodoc", "* Constructs an empty sensitive group object. This is a set of sensitive 3D entities. The sensitive entities will be defined using the function Add to fill the entity owner OwnerId. If MatchAll is false, nothing can be added.
	:param theOwnerId:
	:type theOwnerId: SelectMgr_EntityOwner
	:param theIsMustMatchAll: default value is Standard_True
	:type theIsMustMatchAll: bool
	:rtype: None") Select3D_SensitiveGroup;
		 Select3D_SensitiveGroup (const opencascade::handle<SelectMgr_EntityOwner> & theOwnerId,const Standard_Boolean theIsMustMatchAll = Standard_True);

		/****************** Select3D_SensitiveGroup ******************/
		%feature("compactdefaultargs") Select3D_SensitiveGroup;
		%feature("autodoc", "* Constructs a sensitive group object defined by the list TheList and the entity owner OwnerId. If MatchAll is false, nothing is done.
	:param theOwnerId:
	:type theOwnerId: SelectMgr_EntityOwner
	:param theEntities:
	:type theEntities: Select3D_EntitySequence
	:param theIsMustMatchAll: default value is Standard_True
	:type theIsMustMatchAll: bool
	:rtype: None") Select3D_SensitiveGroup;
		 Select3D_SensitiveGroup (const opencascade::handle<SelectMgr_EntityOwner> & theOwnerId,Select3D_EntitySequence & theEntities,const Standard_Boolean theIsMustMatchAll = Standard_True);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "* Sets the owner for all entities in group
	:param theOwnerId:
	:type theOwnerId: SelectMgr_EntityOwner
	:rtype: None") Set;
		void Set (const opencascade::handle<SelectMgr_EntityOwner> & theOwnerId);

		/****************** SetCheckOverlapAll ******************/
		%feature("compactdefaultargs") SetCheckOverlapAll;
		%feature("autodoc", "* Returns True if all sensitive entities should be checked within rectangular/polygonal selection, False by default. Can be useful for sensitive entities holding detection results as class property.
	:param theToCheckAll:
	:type theToCheckAll: bool
	:rtype: None") SetCheckOverlapAll;
		void SetCheckOverlapAll (Standard_Boolean theToCheckAll);

		/****************** SetMatchType ******************/
		%feature("compactdefaultargs") SetMatchType;
		%feature("autodoc", "* Sets the requirement that all sensitive entities in the list used at the time of construction, or added using the function Add must be matched.
	:param theIsMustMatchAll:
	:type theIsMustMatchAll: bool
	:rtype: None") SetMatchType;
		void SetMatchType (const Standard_Boolean theIsMustMatchAll);

		/****************** Size ******************/
		%feature("compactdefaultargs") Size;
		%feature("autodoc", "* Returns the length of vector of sensitive entities
	:rtype: int") Size;
		virtual Standard_Integer Size ();

		/****************** SubEntity ******************/
		%feature("compactdefaultargs") SubEntity;
		%feature("autodoc", "* Access entity by index [1, NbSubElements()].
	:param theIndex:
	:type theIndex: int
	:rtype: opencascade::handle<Select3D_SensitiveEntity>") SubEntity;
		const opencascade::handle<Select3D_SensitiveEntity> & SubEntity (const Standard_Integer theIndex);

		/****************** Swap ******************/
		%feature("compactdefaultargs") Swap;
		%feature("autodoc", "* Swaps items with indexes theIdx1 and theIdx2 in the vector
	:param theIdx1:
	:type theIdx1: int
	:param theIdx2:
	:type theIdx2: int
	:rtype: void") Swap;
		virtual void Swap (const Standard_Integer theIdx1,const Standard_Integer theIdx2);

		/****************** ToCheckOverlapAll ******************/
		%feature("compactdefaultargs") ToCheckOverlapAll;
		%feature("autodoc", "* Returns True if all sensitive entities should be checked within rectangular/polygonal selection, False by default. Can be useful for sensitive entities holding detection results as class property.
	:rtype: bool") ToCheckOverlapAll;
		Standard_Boolean ToCheckOverlapAll ();

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
		/****************** BoundingBox ******************/
		%feature("compactdefaultargs") BoundingBox;
		%feature("autodoc", "* Returns bounding box of a polygon. If location transformation is set, it will be applied
	:rtype: Select3D_BndBox3d") BoundingBox;
		virtual Select3D_BndBox3d BoundingBox ();

		/****************** Box ******************/
		%feature("compactdefaultargs") Box;
		%feature("autodoc", "* Returns bounding box of segment with index theIdx
	:param theIdx:
	:type theIdx: int
	:rtype: Select3D_BndBox3d") Box;
		virtual Select3D_BndBox3d Box (const Standard_Integer theIdx);

		/****************** Center ******************/
		%feature("compactdefaultargs") Center;
		%feature("autodoc", "* Returns geometry center of sensitive entity index theIdx in the vector along the given axis theAxis
	:param theIdx:
	:type theIdx: int
	:param theAxis:
	:type theAxis: int
	:rtype: float") Center;
		virtual Standard_Real Center (const Standard_Integer theIdx,const Standard_Integer theAxis);

		/****************** CenterOfGeometry ******************/
		%feature("compactdefaultargs") CenterOfGeometry;
		%feature("autodoc", "* Returns center of the point set. If location transformation is set, it will be applied
	:rtype: gp_Pnt") CenterOfGeometry;
		virtual gp_Pnt CenterOfGeometry ();

		/****************** NbSubElements ******************/
		%feature("compactdefaultargs") NbSubElements;
		%feature("autodoc", "* Returns the amount of segments in poly
	:rtype: int") NbSubElements;
		virtual Standard_Integer NbSubElements ();

		/****************** Points3D ******************/
		%feature("compactdefaultargs") Points3D;
		%feature("autodoc", "* Returns the 3D points of the array used at construction time.
	:param theHArrayOfPnt:
	:type theHArrayOfPnt: TColgp_HArray1OfPnt
	:rtype: None") Points3D;
		void Points3D (opencascade::handle<TColgp_HArray1OfPnt> & theHArrayOfPnt);

		/****************** Select3D_SensitivePoly ******************/
		%feature("compactdefaultargs") Select3D_SensitivePoly;
		%feature("autodoc", "* Constructs a sensitive face object defined by the owner OwnerId, the array of points ThePoints, and the sensitivity type Sensitivity. The array of points is the outer polygon of the geometric face.
	:param theOwnerId:
	:type theOwnerId: SelectMgr_EntityOwner
	:param thePoints:
	:type thePoints: TColgp_Array1OfPnt
	:param theIsBVHEnabled:
	:type theIsBVHEnabled: bool
	:rtype: None") Select3D_SensitivePoly;
		 Select3D_SensitivePoly (const opencascade::handle<SelectMgr_EntityOwner> & theOwnerId,const TColgp_Array1OfPnt & thePoints,const Standard_Boolean theIsBVHEnabled);

		/****************** Select3D_SensitivePoly ******************/
		%feature("compactdefaultargs") Select3D_SensitivePoly;
		%feature("autodoc", "* Constructs a sensitive face object defined by the owner OwnerId, the array of points ThePoints, and the sensitivity type Sensitivity. The array of points is the outer polygon of the geometric face.
	:param theOwnerId:
	:type theOwnerId: SelectMgr_EntityOwner
	:param thePoints:
	:type thePoints: TColgp_HArray1OfPnt
	:param theIsBVHEnabled:
	:type theIsBVHEnabled: bool
	:rtype: None") Select3D_SensitivePoly;
		 Select3D_SensitivePoly (const opencascade::handle<SelectMgr_EntityOwner> & theOwnerId,const opencascade::handle<TColgp_HArray1OfPnt> & thePoints,const Standard_Boolean theIsBVHEnabled);

		/****************** Select3D_SensitivePoly ******************/
		%feature("compactdefaultargs") Select3D_SensitivePoly;
		%feature("autodoc", "* Constructs the sensitive circle object defined by the owner OwnerId, the circle Circle, the Boolean FilledCircle and the number of points NbOfPoints.
	:param theOwnerId:
	:type theOwnerId: SelectMgr_EntityOwner
	:param theIsBVHEnabled:
	:type theIsBVHEnabled: bool
	:param theNbPnts: default value is 6
	:type theNbPnts: int
	:rtype: None") Select3D_SensitivePoly;
		 Select3D_SensitivePoly (const opencascade::handle<SelectMgr_EntityOwner> & theOwnerId,const Standard_Boolean theIsBVHEnabled,const Standard_Integer theNbPnts = 6);

		/****************** Size ******************/
		%feature("compactdefaultargs") Size;
		%feature("autodoc", "* Returns the amount of segments of the poly
	:rtype: int") Size;
		virtual Standard_Integer Size ();

		/****************** Swap ******************/
		%feature("compactdefaultargs") Swap;
		%feature("autodoc", "* Swaps items with indexes theIdx1 and theIdx2 in the vector
	:param theIdx1:
	:type theIdx1: int
	:param theIdx2:
	:type theIdx2: int
	:rtype: void") Swap;
		virtual void Swap (const Standard_Integer theIdx1,const Standard_Integer theIdx2);

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
		/****************** BVH ******************/
		%feature("compactdefaultargs") BVH;
		%feature("autodoc", "* Builds BVH tree for sensitive set.
	:rtype: void") BVH;
		virtual void BVH ();

		/****************** BoundingBox ******************/
		%feature("compactdefaultargs") BoundingBox;
		%feature("autodoc", "* Returns bounding box of the triangulation. If location transformation is set, it will be applied
	:rtype: Select3D_BndBox3d") BoundingBox;
		virtual Select3D_BndBox3d BoundingBox ();

		/****************** Box ******************/
		%feature("compactdefaultargs") Box;
		%feature("autodoc", "* Returns bounding box of triangle/edge with index theIdx
	:param theIdx:
	:type theIdx: int
	:rtype: Select3D_BndBox3d") Box;
		virtual Select3D_BndBox3d Box (const Standard_Integer theIdx);

		/****************** Center ******************/
		%feature("compactdefaultargs") Center;
		%feature("autodoc", "* Returns geometry center of triangle/edge with index theIdx in array along the given axis theAxis
	:param theIdx:
	:type theIdx: int
	:param theAxis:
	:type theAxis: int
	:rtype: float") Center;
		virtual Standard_Real Center (const Standard_Integer theIdx,const Standard_Integer theAxis);

		/****************** CenterOfGeometry ******************/
		%feature("compactdefaultargs") CenterOfGeometry;
		%feature("autodoc", "* Returns center of triangulation. If location transformation is set, it will be applied
	:rtype: gp_Pnt") CenterOfGeometry;
		gp_Pnt CenterOfGeometry ();

		/****************** GetConnected ******************/
		%feature("compactdefaultargs") GetConnected;
		%feature("autodoc", ":rtype: opencascade::handle<Select3D_SensitiveEntity>") GetConnected;
		virtual opencascade::handle<Select3D_SensitiveEntity> GetConnected ();

		/****************** HasInitLocation ******************/
		%feature("compactdefaultargs") HasInitLocation;
		%feature("autodoc", "* Returns true if the shape corresponding to the entity has init location
	:rtype: bool") HasInitLocation;
		Standard_Boolean HasInitLocation ();

		/****************** InitPoints ******************/
		%feature("compactdefaultargs") InitPoints;
		%feature("autodoc", "* Initialize the sensitive object from point set. The sub-set of points can be specified by arguments theIndexLower and theIndexUpper (these are for iterating theIndices, not to restrict the actual index values!). @param theVerts attributes array containing Graphic3d_TOA_POS with type Graphic3d_TOD_VEC3 or Graphic3d_TOD_VEC2 @param theIndices index array defining points @param theInitLoc location @param theIndexLower the theIndices range - first value (inclusive), starting from 0 @param theIndexUpper the theIndices range - last value (inclusive), upto theIndices->NbElements-1 @param theToEvalMinMax compute bounding box within initialization @param theNbGroups number of groups to split the vertex array into several parts
	:param theVerts:
	:type theVerts: Graphic3d_Buffer
	:param theIndices:
	:type theIndices: Graphic3d_IndexBuffer
	:param theInitLoc:
	:type theInitLoc: TopLoc_Location
	:param theIndexLower:
	:type theIndexLower: int
	:param theIndexUpper:
	:type theIndexUpper: int
	:param theToEvalMinMax: default value is true
	:type theToEvalMinMax: bool
	:param theNbGroups: default value is 1
	:type theNbGroups: int
	:rtype: bool") InitPoints;
		bool InitPoints (const opencascade::handle<Graphic3d_Buffer> & theVerts,const opencascade::handle<Graphic3d_IndexBuffer> & theIndices,const TopLoc_Location & theInitLoc,const Standard_Integer theIndexLower,const Standard_Integer theIndexUpper,const bool theToEvalMinMax = true,const Standard_Integer theNbGroups = 1);

		/****************** InitPoints ******************/
		%feature("compactdefaultargs") InitPoints;
		%feature("autodoc", "* Initialize the sensitive object from point set. @param theVerts attributes array containing Graphic3d_TOA_POS with type Graphic3d_TOD_VEC3 or Graphic3d_TOD_VEC2 @param theIndices index array to define subset of points @param theInitLoc location @param theToEvalMinMax compute bounding box within initialization @param theNbGroups number of groups to split the vertex array into several parts
	:param theVerts:
	:type theVerts: Graphic3d_Buffer
	:param theIndices:
	:type theIndices: Graphic3d_IndexBuffer
	:param theInitLoc:
	:type theInitLoc: TopLoc_Location
	:param theToEvalMinMax: default value is true
	:type theToEvalMinMax: bool
	:param theNbGroups: default value is 1
	:type theNbGroups: int
	:rtype: bool") InitPoints;
		bool InitPoints (const opencascade::handle<Graphic3d_Buffer> & theVerts,const opencascade::handle<Graphic3d_IndexBuffer> & theIndices,const TopLoc_Location & theInitLoc,const bool theToEvalMinMax = true,const Standard_Integer theNbGroups = 1);

		/****************** InitPoints ******************/
		%feature("compactdefaultargs") InitPoints;
		%feature("autodoc", "* Initialize the sensitive object from point set. @param theVerts attributes array containing Graphic3d_TOA_POS with type Graphic3d_TOD_VEC3 or Graphic3d_TOD_VEC2 @param theInitLoc location @param theToEvalMinMax compute bounding box within initialization @param theNbGroups number of groups to split the vertex array into several parts
	:param theVerts:
	:type theVerts: Graphic3d_Buffer
	:param theInitLoc:
	:type theInitLoc: TopLoc_Location
	:param theToEvalMinMax: default value is true
	:type theToEvalMinMax: bool
	:param theNbGroups: default value is 1
	:type theNbGroups: int
	:rtype: bool") InitPoints;
		bool InitPoints (const opencascade::handle<Graphic3d_Buffer> & theVerts,const TopLoc_Location & theInitLoc,const bool theToEvalMinMax = true,const Standard_Integer theNbGroups = 1);

		/****************** InitTriangulation ******************/
		%feature("compactdefaultargs") InitTriangulation;
		%feature("autodoc", "* Initialize the sensitive object from triangualtion. The sub-triangulation can be specified by arguments theIndexLower and theIndexUpper (these are for iterating theIndices, not to restrict the actual index values!). @param theVerts attributes array containing Graphic3d_TOA_POS with type Graphic3d_TOD_VEC3 or Graphic3d_TOD_VEC2 @param theIndices index array defining triangulation @param theInitLoc location @param theIndexLower the theIndices range - first value (inclusive), starting from 0 and multiple by 3 @param theIndexUpper the theIndices range - last value (inclusive), upto theIndices->NbElements-1 and multiple by 3 @param theToEvalMinMax compute bounding box within initialization @param theNbGroups number of groups to split the vertex array into several parts
	:param theVerts:
	:type theVerts: Graphic3d_Buffer
	:param theIndices:
	:type theIndices: Graphic3d_IndexBuffer
	:param theInitLoc:
	:type theInitLoc: TopLoc_Location
	:param theIndexLower:
	:type theIndexLower: int
	:param theIndexUpper:
	:type theIndexUpper: int
	:param theToEvalMinMax: default value is true
	:type theToEvalMinMax: bool
	:param theNbGroups: default value is 1
	:type theNbGroups: int
	:rtype: bool") InitTriangulation;
		bool InitTriangulation (const opencascade::handle<Graphic3d_Buffer> & theVerts,const opencascade::handle<Graphic3d_IndexBuffer> & theIndices,const TopLoc_Location & theInitLoc,const Standard_Integer theIndexLower,const Standard_Integer theIndexUpper,const bool theToEvalMinMax = true,const Standard_Integer theNbGroups = 1);

		/****************** InitTriangulation ******************/
		%feature("compactdefaultargs") InitTriangulation;
		%feature("autodoc", "* Initialize the sensitive object from triangualtion. @param theVerts attributes array containing Graphic3d_TOA_POS with type Graphic3d_TOD_VEC3 or Graphic3d_TOD_VEC2 @param theIndices index array defining triangulation @param theInitLoc location @param theToEvalMinMax compute bounding box within initialization @param theNbGroups number of groups to split the vertex array into several parts
	:param theVerts:
	:type theVerts: Graphic3d_Buffer
	:param theIndices:
	:type theIndices: Graphic3d_IndexBuffer
	:param theInitLoc:
	:type theInitLoc: TopLoc_Location
	:param theToEvalMinMax: default value is true
	:type theToEvalMinMax: bool
	:param theNbGroups: default value is 1
	:type theNbGroups: int
	:rtype: bool") InitTriangulation;
		bool InitTriangulation (const opencascade::handle<Graphic3d_Buffer> & theVerts,const opencascade::handle<Graphic3d_IndexBuffer> & theIndices,const TopLoc_Location & theInitLoc,const bool theToEvalMinMax = true,const Standard_Integer theNbGroups = 1);

		/****************** InvInitLocation ******************/
		%feature("compactdefaultargs") InvInitLocation;
		%feature("autodoc", "* Returns inversed location transformation matrix if the shape corresponding to this entity has init location set. Otherwise, returns identity matrix.
	:rtype: gp_GTrsf") InvInitLocation;
		gp_GTrsf InvInitLocation ();

		/****************** LastDetectedEdgeNode1 ******************/
		%feature("compactdefaultargs") LastDetectedEdgeNode1;
		%feature("autodoc", "* Return the first node of last topmost detected edge or -1 if undefined (axis picking).
	:rtype: int") LastDetectedEdgeNode1;
		Standard_Integer LastDetectedEdgeNode1 ();

		/****************** LastDetectedEdgeNode2 ******************/
		%feature("compactdefaultargs") LastDetectedEdgeNode2;
		%feature("autodoc", "* Return the second node of last topmost detected edge or -1 if undefined (axis picking).
	:rtype: int") LastDetectedEdgeNode2;
		Standard_Integer LastDetectedEdgeNode2 ();

		/****************** LastDetectedElement ******************/
		%feature("compactdefaultargs") LastDetectedElement;
		%feature("autodoc", "* Return last topmost detected element or -1 if undefined (axis picking).
	:rtype: int") LastDetectedElement;
		Standard_Integer LastDetectedElement ();

		/****************** LastDetectedElementMap ******************/
		%feature("compactdefaultargs") LastDetectedElementMap;
		%feature("autodoc", "* Return the index map of last detected elements (rectangle selection).
	:rtype: opencascade::handle<TColStd_HPackedMapOfInteger>") LastDetectedElementMap;
		const opencascade::handle<TColStd_HPackedMapOfInteger> & LastDetectedElementMap ();

		/****************** LastDetectedNode ******************/
		%feature("compactdefaultargs") LastDetectedNode;
		%feature("autodoc", "* Return last topmost detected node or -1 if undefined (axis picking).
	:rtype: int") LastDetectedNode;
		Standard_Integer LastDetectedNode ();

		/****************** LastDetectedNodeMap ******************/
		%feature("compactdefaultargs") LastDetectedNodeMap;
		%feature("autodoc", "* Return the index map of last detected nodes (rectangle selection).
	:rtype: opencascade::handle<TColStd_HPackedMapOfInteger>") LastDetectedNodeMap;
		const opencascade::handle<TColStd_HPackedMapOfInteger> & LastDetectedNodeMap ();

		/****************** Matches ******************/
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "* Checks whether the sensitive entity is overlapped by current selecting volume.
	:param theMgr:
	:type theMgr: SelectBasics_SelectingVolumeManager
	:param thePickResult:
	:type thePickResult: SelectBasics_PickResult
	:rtype: bool") Matches;
		virtual Standard_Boolean Matches (SelectBasics_SelectingVolumeManager & theMgr,SelectBasics_PickResult & thePickResult);

		/****************** NbSubElements ******************/
		%feature("compactdefaultargs") NbSubElements;
		%feature("autodoc", "* Returns the amount of nodes in triangulation
	:rtype: int") NbSubElements;
		Standard_Integer NbSubElements ();

		/****************** PatchDistance ******************/
		%feature("compactdefaultargs") PatchDistance;
		%feature("autodoc", "* Maximum allowed distance between consequential elements in patch (ShortRealLast() by default). Has no effect on indexed triangulation.
	:rtype: float") PatchDistance;
		float PatchDistance ();

		/****************** PatchSizeMax ******************/
		%feature("compactdefaultargs") PatchSizeMax;
		%feature("autodoc", "* Return patch size limit (1 by default).
	:rtype: int") PatchSizeMax;
		Standard_Integer PatchSizeMax ();

		/****************** Select3D_SensitivePrimitiveArray ******************/
		%feature("compactdefaultargs") Select3D_SensitivePrimitiveArray;
		%feature("autodoc", "* Constructs an empty sensitive object.
	:param theOwnerId:
	:type theOwnerId: SelectMgr_EntityOwner
	:rtype: None") Select3D_SensitivePrimitiveArray;
		 Select3D_SensitivePrimitiveArray (const opencascade::handle<SelectMgr_EntityOwner> & theOwnerId);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "* Sets the owner for all entities in group
	:param theOwnerId:
	:type theOwnerId: SelectMgr_EntityOwner
	:rtype: void") Set;
		virtual void Set (const opencascade::handle<SelectMgr_EntityOwner> & theOwnerId);

		/****************** SetDetectEdges ******************/
		%feature("compactdefaultargs") SetDetectEdges;
		%feature("autodoc", "* Setup keeping of the index of last topmost detected edge (axis picking).
	:param theToDetect:
	:type theToDetect: bool
	:rtype: None") SetDetectEdges;
		void SetDetectEdges (bool theToDetect);

		/****************** SetDetectElementMap ******************/
		%feature("compactdefaultargs") SetDetectElementMap;
		%feature("autodoc", "* Setup keeping of the index map of last detected elements (rectangle selection).
	:param theToDetect:
	:type theToDetect: bool
	:rtype: None") SetDetectElementMap;
		void SetDetectElementMap (bool theToDetect);

		/****************** SetDetectElements ******************/
		%feature("compactdefaultargs") SetDetectElements;
		%feature("autodoc", "* Setup keeping of the index of last topmost detected element (axis picking).
	:param theToDetect:
	:type theToDetect: bool
	:rtype: None") SetDetectElements;
		void SetDetectElements (bool theToDetect);

		/****************** SetDetectNodeMap ******************/
		%feature("compactdefaultargs") SetDetectNodeMap;
		%feature("autodoc", "* Setup keeping of the index map of last detected nodes (rectangle selection).
	:param theToDetect:
	:type theToDetect: bool
	:rtype: None") SetDetectNodeMap;
		void SetDetectNodeMap (bool theToDetect);

		/****************** SetDetectNodes ******************/
		%feature("compactdefaultargs") SetDetectNodes;
		%feature("autodoc", "* Setup keeping of the index of last topmost detected node (for axis picking).
	:param theToDetect:
	:type theToDetect: bool
	:rtype: None") SetDetectNodes;
		void SetDetectNodes (bool theToDetect);

		/****************** SetMinMax ******************/
		%feature("compactdefaultargs") SetMinMax;
		%feature("autodoc", "* Assign new not transformed bounding box.
	:param theMinX:
	:type theMinX: double
	:param theMinY:
	:type theMinY: double
	:param theMinZ:
	:type theMinZ: double
	:param theMaxX:
	:type theMaxX: double
	:param theMaxY:
	:type theMaxY: double
	:param theMaxZ:
	:type theMaxZ: double
	:rtype: None") SetMinMax;
		void SetMinMax (double theMinX,double theMinY,double theMinZ,double theMaxX,double theMaxY,double theMaxZ);

		/****************** SetPatchDistance ******************/
		%feature("compactdefaultargs") SetPatchDistance;
		%feature("autodoc", "* Assign patch distance limit. Should be set before initialization.
	:param thePatchDistMax:
	:type thePatchDistMax: float
	:rtype: None") SetPatchDistance;
		void SetPatchDistance (const float thePatchDistMax);

		/****************** SetPatchSizeMax ******************/
		%feature("compactdefaultargs") SetPatchSizeMax;
		%feature("autodoc", "* Assign patch size limit. Should be set before initialization.
	:param thePatchSizeMax:
	:type thePatchSizeMax: int
	:rtype: None") SetPatchSizeMax;
		void SetPatchSizeMax (const Standard_Integer thePatchSizeMax);

		/****************** Size ******************/
		%feature("compactdefaultargs") Size;
		%feature("autodoc", "* Returns the length of array of triangles or edges
	:rtype: int") Size;
		virtual Standard_Integer Size ();

		/****************** Swap ******************/
		%feature("compactdefaultargs") Swap;
		%feature("autodoc", "* Swaps items with indexes theIdx1 and theIdx2 in array
	:param theIdx1:
	:type theIdx1: int
	:param theIdx2:
	:type theIdx2: int
	:rtype: void") Swap;
		virtual void Swap (const Standard_Integer theIdx1,const Standard_Integer theIdx2);

		/****************** ToDetectEdges ******************/
		%feature("compactdefaultargs") ToDetectEdges;
		%feature("autodoc", "* Return flag to keep index of last topmost detected edge, False by default.
	:rtype: bool") ToDetectEdges;
		bool ToDetectEdges ();

		/****************** ToDetectElementMap ******************/
		%feature("compactdefaultargs") ToDetectElementMap;
		%feature("autodoc", "* Return flag to keep index map of last detected elements, False by default (rectangle selection).
	:rtype: bool") ToDetectElementMap;
		bool ToDetectElementMap ();

		/****************** ToDetectElements ******************/
		%feature("compactdefaultargs") ToDetectElements;
		%feature("autodoc", "* Return flag to keep index of last topmost detected element, True by default.
	:rtype: bool") ToDetectElements;
		bool ToDetectElements ();

		/****************** ToDetectNodeMap ******************/
		%feature("compactdefaultargs") ToDetectNodeMap;
		%feature("autodoc", "* Return flag to keep index map of last detected nodes, False by default (rectangle selection).
	:rtype: bool") ToDetectNodeMap;
		bool ToDetectNodeMap ();

		/****************** ToDetectNodes ******************/
		%feature("compactdefaultargs") ToDetectNodes;
		%feature("autodoc", "* Return flag to keep index of last topmost detected node, False by default.
	:rtype: bool") ToDetectNodes;
		bool ToDetectNodes ();

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
		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "* Adds the sensitive entity theSensitive to this framework.
	:param theSensitive:
	:type theSensitive: Select3D_SensitiveEntity
	:rtype: None") Add;
		void Add (const opencascade::handle<Select3D_SensitiveEntity> & theSensitive);

		/****************** BoundingBox ******************/
		%feature("compactdefaultargs") BoundingBox;
		%feature("autodoc", "* Returns bounding box of the wire. If location transformation is set, it will be applied
	:rtype: Select3D_BndBox3d") BoundingBox;
		virtual Select3D_BndBox3d BoundingBox ();

		/****************** Box ******************/
		%feature("compactdefaultargs") Box;
		%feature("autodoc", "* Returns bounding box of sensitive entity with index theIdx
	:param theIdx:
	:type theIdx: int
	:rtype: Select3D_BndBox3d") Box;
		virtual Select3D_BndBox3d Box (const Standard_Integer theIdx);

		/****************** Center ******************/
		%feature("compactdefaultargs") Center;
		%feature("autodoc", "* Returns geometry center of sensitive entity index theIdx in the vector along the given axis theAxis
	:param theIdx:
	:type theIdx: int
	:param theAxis:
	:type theAxis: int
	:rtype: float") Center;
		virtual Standard_Real Center (const Standard_Integer theIdx,const Standard_Integer theAxis);

		/****************** CenterOfGeometry ******************/
		%feature("compactdefaultargs") CenterOfGeometry;
		%feature("autodoc", "* Returns center of the wire. If location transformation is set, it will be applied
	:rtype: gp_Pnt") CenterOfGeometry;
		virtual gp_Pnt CenterOfGeometry ();

		/****************** GetConnected ******************/
		%feature("compactdefaultargs") GetConnected;
		%feature("autodoc", ":rtype: opencascade::handle<Select3D_SensitiveEntity>") GetConnected;
		virtual opencascade::handle<Select3D_SensitiveEntity> GetConnected ();

		/****************** GetEdges ******************/
		%feature("compactdefaultargs") GetEdges;
		%feature("autodoc", "* returns the sensitive edges stored in this wire
	:rtype: NCollection_Vector<opencascade::handle<Select3D_SensitiveEntity> >") GetEdges;
		const NCollection_Vector<opencascade::handle<Select3D_SensitiveEntity> > & GetEdges ();

		/****************** GetLastDetected ******************/
		%feature("compactdefaultargs") GetLastDetected;
		%feature("autodoc", ":rtype: opencascade::handle<Select3D_SensitiveEntity>") GetLastDetected;
		opencascade::handle<Select3D_SensitiveEntity> GetLastDetected ();

		/****************** NbSubElements ******************/
		%feature("compactdefaultargs") NbSubElements;
		%feature("autodoc", "* Returns the amount of sub-entities
	:rtype: int") NbSubElements;
		virtual Standard_Integer NbSubElements ();

		/****************** Select3D_SensitiveWire ******************/
		%feature("compactdefaultargs") Select3D_SensitiveWire;
		%feature("autodoc", "* Constructs a sensitive wire object defined by the owner theOwnerId
	:param theOwnerId:
	:type theOwnerId: SelectMgr_EntityOwner
	:rtype: None") Select3D_SensitiveWire;
		 Select3D_SensitiveWire (const opencascade::handle<SelectMgr_EntityOwner> & theOwnerId);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "* Sets the owner for all entities in wire
	:param theOwnerId:
	:type theOwnerId: SelectMgr_EntityOwner
	:rtype: void") Set;
		virtual void Set (const opencascade::handle<SelectMgr_EntityOwner> & theOwnerId);

		/****************** Size ******************/
		%feature("compactdefaultargs") Size;
		%feature("autodoc", "* Returns the length of vector of sensitive entities
	:rtype: int") Size;
		virtual Standard_Integer Size ();

		/****************** Swap ******************/
		%feature("compactdefaultargs") Swap;
		%feature("autodoc", "* Swaps items with indexes theIdx1 and theIdx2 in the vector
	:param theIdx1:
	:type theIdx1: int
	:param theIdx2:
	:type theIdx2: int
	:rtype: void") Swap;
		virtual void Swap (const Standard_Integer theIdx1,const Standard_Integer theIdx2);

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
		/****************** ArrayBounds ******************/
		%feature("compactdefaultargs") ArrayBounds;
		%feature("autodoc", ":param theLow:
	:type theLow: int
	:param theUp:
	:type theUp: int
	:rtype: None") ArrayBounds;
		void ArrayBounds (Standard_Integer &OutValue,Standard_Integer &OutValue);

		/****************** BVH ******************/
		%feature("compactdefaultargs") BVH;
		%feature("autodoc", "* Builds BVH tree for a circle's edge segments if needed
	:rtype: void") BVH;
		virtual void BVH ();

		/****************** CenterOfGeometry ******************/
		%feature("compactdefaultargs") CenterOfGeometry;
		%feature("autodoc", "* Returns center of the circle. If location transformation is set, it will be applied
	:rtype: gp_Pnt") CenterOfGeometry;
		virtual gp_Pnt CenterOfGeometry ();

		/****************** GetConnected ******************/
		%feature("compactdefaultargs") GetConnected;
		%feature("autodoc", ":rtype: opencascade::handle<Select3D_SensitiveEntity>") GetConnected;
		virtual opencascade::handle<Select3D_SensitiveEntity> GetConnected ();

		/****************** GetPoint3d ******************/
		%feature("compactdefaultargs") GetPoint3d;
		%feature("autodoc", ":param thePntIdx:
	:type thePntIdx: int
	:rtype: gp_Pnt") GetPoint3d;
		gp_Pnt GetPoint3d (const Standard_Integer thePntIdx);

		/****************** Matches ******************/
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "* Checks whether the circle overlaps current selecting volume
	:param theMgr:
	:type theMgr: SelectBasics_SelectingVolumeManager
	:param thePickResult:
	:type thePickResult: SelectBasics_PickResult
	:rtype: bool") Matches;
		virtual Standard_Boolean Matches (SelectBasics_SelectingVolumeManager & theMgr,SelectBasics_PickResult & thePickResult);

		/****************** Select3D_SensitiveCircle ******************/
		%feature("compactdefaultargs") Select3D_SensitiveCircle;
		%feature("autodoc", "* Constructs the sensitive circle object defined by the owner theOwnerId, the circle theCircle, the boolean theIsFilled and the number of points theNbPnts.
	:param theOwnerId:
	:type theOwnerId: SelectMgr_EntityOwner
	:param theCircle:
	:type theCircle: Geom_Circle
	:param theIsFilled: default value is Standard_False
	:type theIsFilled: bool
	:param theNbPnts: default value is 12
	:type theNbPnts: int
	:rtype: None") Select3D_SensitiveCircle;
		 Select3D_SensitiveCircle (const opencascade::handle<SelectMgr_EntityOwner> & theOwnerId,const opencascade::handle<Geom_Circle> & theCircle,const Standard_Boolean theIsFilled = Standard_False,const Standard_Integer theNbPnts = 12);

		/****************** Select3D_SensitiveCircle ******************/
		%feature("compactdefaultargs") Select3D_SensitiveCircle;
		%feature("autodoc", "* Constructs the sensitive arc object defined by the owner theOwnerId, the circle theCircle, the parameters theU1 and theU2, the boolean theIsFilled and the number of points theNbPnts. theU1 and theU2 define the first and last points of the arc on theCircle.
	:param theOwnerId:
	:type theOwnerId: SelectMgr_EntityOwner
	:param theCircle:
	:type theCircle: Geom_Circle
	:param theU1:
	:type theU1: float
	:param theU2:
	:type theU2: float
	:param theIsFilled: default value is Standard_False
	:type theIsFilled: bool
	:param theNbPnts: default value is 12
	:type theNbPnts: int
	:rtype: None") Select3D_SensitiveCircle;
		 Select3D_SensitiveCircle (const opencascade::handle<SelectMgr_EntityOwner> & theOwnerId,const opencascade::handle<Geom_Circle> & theCircle,const Standard_Real theU1,const Standard_Real theU2,const Standard_Boolean theIsFilled = Standard_False,const Standard_Integer theNbPnts = 12);

		/****************** Select3D_SensitiveCircle ******************/
		%feature("compactdefaultargs") Select3D_SensitiveCircle;
		%feature("autodoc", "* Constructs the sensitive circle object defined by the owner theOwnerId, the array of triangles thePnts3d, and the boolean theIsFilled. thePnts3d is an array of consecutive triangles on the circle. The triangle i+1 lies on the intersection of the tangents to the circle of i and i+2. Note, that the first point of thePnts3d must be equal to the last point of thePnts3d.
	:param theOwnerId:
	:type theOwnerId: SelectMgr_EntityOwner
	:param thePnts3d:
	:type thePnts3d: TColgp_HArray1OfPnt
	:param theIsFilled: default value is Standard_False
	:type theIsFilled: bool
	:rtype: None") Select3D_SensitiveCircle;
		 Select3D_SensitiveCircle (const opencascade::handle<SelectMgr_EntityOwner> & theOwnerId,const opencascade::handle<TColgp_HArray1OfPnt> & thePnts3d,const Standard_Boolean theIsFilled = Standard_False);

		/****************** Select3D_SensitiveCircle ******************/
		%feature("compactdefaultargs") Select3D_SensitiveCircle;
		%feature("autodoc", "* Constructs the sensitive circle object defined by the owner theOwnerId, the array of points thePnts3d, and the boolean theIsFilled. If the length of thePnts3d is more then 1, the first point of thePnts3d must be equal to the last point of thePnts3d.
	:param theOwnerId:
	:type theOwnerId: SelectMgr_EntityOwner
	:param thePnts3d:
	:type thePnts3d: TColgp_Array1OfPnt
	:param theIsFilled: default value is Standard_False
	:type theIsFilled: bool
	:rtype: None") Select3D_SensitiveCircle;
		 Select3D_SensitiveCircle (const opencascade::handle<SelectMgr_EntityOwner> & theOwnerId,const TColgp_Array1OfPnt & thePnts3d,const Standard_Boolean theIsFilled = Standard_False);

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
		/****************** GetConnected ******************/
		%feature("compactdefaultargs") GetConnected;
		%feature("autodoc", "* Returns the copy of this
	:rtype: opencascade::handle<Select3D_SensitiveEntity>") GetConnected;
		virtual opencascade::handle<Select3D_SensitiveEntity> GetConnected ();

		/****************** Select3D_SensitiveCurve ******************/
		%feature("compactdefaultargs") Select3D_SensitiveCurve;
		%feature("autodoc", "* Constructs a sensitive curve object defined by the owner theOwnerId, the curve theCurve, and the maximum number of points on the curve: theNbPnts.
	:param theOwnerId:
	:type theOwnerId: SelectMgr_EntityOwner
	:param theCurve:
	:type theCurve: Geom_Curve
	:param theNbPnts: default value is 17
	:type theNbPnts: int
	:rtype: None") Select3D_SensitiveCurve;
		 Select3D_SensitiveCurve (const opencascade::handle<SelectMgr_EntityOwner> & theOwnerId,const opencascade::handle<Geom_Curve> & theCurve,const Standard_Integer theNbPnts = 17);

		/****************** Select3D_SensitiveCurve ******************/
		%feature("compactdefaultargs") Select3D_SensitiveCurve;
		%feature("autodoc", "* Constructs a sensitive curve object defined by the owner theOwnerId and the set of points ThePoints.
	:param theOwnerId:
	:type theOwnerId: SelectMgr_EntityOwner
	:param thePoints:
	:type thePoints: TColgp_HArray1OfPnt
	:rtype: None") Select3D_SensitiveCurve;
		 Select3D_SensitiveCurve (const opencascade::handle<SelectMgr_EntityOwner> & theOwnerId,const opencascade::handle<TColgp_HArray1OfPnt> & thePoints);

		/****************** Select3D_SensitiveCurve ******************/
		%feature("compactdefaultargs") Select3D_SensitiveCurve;
		%feature("autodoc", "* Creation of Sensitive Curve from Points. Warning : This Method should disappear in the next version...
	:param theOwnerId:
	:type theOwnerId: SelectMgr_EntityOwner
	:param thePoints:
	:type thePoints: TColgp_Array1OfPnt
	:rtype: None") Select3D_SensitiveCurve;
		 Select3D_SensitiveCurve (const opencascade::handle<SelectMgr_EntityOwner> & theOwnerId,const TColgp_Array1OfPnt & thePoints);

};


%make_alias(Select3D_SensitiveCurve)

%extend Select3D_SensitiveCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
