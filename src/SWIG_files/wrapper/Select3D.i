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
%define SELECT3DDOCSTRING
"Select3D module, see official documentation at
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_select3d.html"
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
%include ../common/EnumTemplates.i
%include ../common/Operators.i
%include ../common/OccHandle.i
%include ../common/IOStream.i
%include ../common/ArrayMacros.i


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
#include<BRep_module.hxx>
#include<Geom2d_module.hxx>
#include<StdPrs_module.hxx>
#include<GeomAdaptor_module.hxx>
#include<Adaptor2d_module.hxx>
#include<BRepAdaptor_module.hxx>
#include<Adaptor3d_module.hxx>
#include<StdSelect_module.hxx>
#include<AIS_module.hxx>
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

/* python proxy classes for enums */
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
%wrap_handle(Select3D_SensitiveCylinder)
%wrap_handle(Select3D_SensitiveFace)
%wrap_handle(Select3D_SensitivePoint)
%wrap_handle(Select3D_SensitiveSegment)
%wrap_handle(Select3D_SensitiveSphere)
%wrap_handle(Select3D_SensitiveTriangle)
%wrap_handle(Select3D_InteriorSensitivePointSet)
%wrap_handle(Select3D_SensitiveGroup)
%wrap_handle(Select3D_SensitivePoly)
%wrap_handle(Select3D_SensitivePrimitiveArray)
%wrap_handle(Select3D_SensitiveWire)
%wrap_handle(Select3D_SensitiveCurve)
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
typedef BVH_Builder<double, 3> Select3D_BVHBuilder3d;
typedef BVH_Box<double, 3> Select3D_BndBox3d;
/* end typedefs declaration */

/********************************
* class Select3D_BVHIndexBuffer *
********************************/
class Select3D_BVHIndexBuffer : public Graphic3d_Buffer {
	public:
		/****** Select3D_BVHIndexBuffer::Select3D_BVHIndexBuffer ******/
		/****** md5 signature: 9c6a695201e9d6a1c47446f6ab981c91 ******/
		%feature("compactdefaultargs") Select3D_BVHIndexBuffer;
		%feature("autodoc", "
Parameters
----------
theAlloc: NCollection_BaseAllocator

Return
-------
None

Description
-----------
Empty constructor.
") Select3D_BVHIndexBuffer;
		 Select3D_BVHIndexBuffer(const opencascade::handle<NCollection_BaseAllocator> & theAlloc);

		/****** Select3D_BVHIndexBuffer::HasPatches ******/
		/****** md5 signature: 53cf8fd429fed66d08db8181c096f9bd ******/
		%feature("compactdefaultargs") HasPatches;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") HasPatches;
		bool HasPatches();

		/****** Select3D_BVHIndexBuffer::Index ******/
		/****** md5 signature: 59dccfe975812e2b75dd9302c466a473 ******/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
int

Description
-----------
Access index at specified position.
") Index;
		int Index(const int theIndex);

		/****** Select3D_BVHIndexBuffer::Init ******/
		/****** md5 signature: 652eb34784997e16180bb3d6d1a40d87 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theNbElems: int
theHasPatches: bool

Return
-------
bool

Description
-----------
Allocates new empty index array.
") Init;
		bool Init(const int theNbElems, const bool theHasPatches);

		/****** Select3D_BVHIndexBuffer::PatchSize ******/
		/****** md5 signature: f72868564834d5ce8b9a5de826222119 ******/
		%feature("compactdefaultargs") PatchSize;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
int

Description
-----------
Access index at specified position.
") PatchSize;
		int PatchSize(const int theIndex);

		/****** Select3D_BVHIndexBuffer::SetIndex ******/
		/****** md5 signature: 651023d9b5ba11fe5518749f6b529446 ******/
		%feature("compactdefaultargs") SetIndex;
		%feature("autodoc", "
Parameters
----------
theIndex: int
theValue: int

Return
-------
None

Description
-----------
Change index at specified position.
") SetIndex;
		void SetIndex(const int theIndex, const int theValue);

		/****** Select3D_BVHIndexBuffer::SetIndex ******/
		/****** md5 signature: 5da790b58b3da0f1c7b32149c1b1d77c ******/
		%feature("compactdefaultargs") SetIndex;
		%feature("autodoc", "
Parameters
----------
theIndex: int
theValue: int
thePatchSize: int

Return
-------
None

Description
-----------
Change index at specified position.
") SetIndex;
		void SetIndex(const int theIndex, const int theValue, const int thePatchSize);

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
		/****** Select3D_PointData::Select3D_PointData ******/
		/****** md5 signature: b3cf00da2352f36409e54accaf1e36e6 ******/
		%feature("compactdefaultargs") Select3D_PointData;
		%feature("autodoc", "
Parameters
----------
theNbPoints: int

Return
-------
None

Description
-----------
No available documentation.
") Select3D_PointData;
		 Select3D_PointData(const int theNbPoints);

		/****** Select3D_PointData::Pnt ******/
		/****** md5 signature: 1bd012a932f5d28fa3cf9a7092bea194 ******/
		%feature("compactdefaultargs") Pnt;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
Select3D_Pnt

Description
-----------
No available documentation.
") Pnt;
		const Select3D_Pnt & Pnt(const int theIndex);

		/****** Select3D_PointData::Pnt3d ******/
		/****** md5 signature: de20803783886ac1d16c6f0b30bb0a2c ******/
		%feature("compactdefaultargs") Pnt3d;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
gp_Pnt

Description
-----------
No available documentation.
") Pnt3d;
		gp_Pnt Pnt3d(const int theIndex);

		/****** Select3D_PointData::SetPnt ******/
		/****** md5 signature: df83165232ad65a92c0e36b8c007b412 ******/
		%feature("compactdefaultargs") SetPnt;
		%feature("autodoc", "
Parameters
----------
theIndex: int
theValue: Select3D_Pnt

Return
-------
None

Description
-----------
No available documentation.
") SetPnt;
		void SetPnt(const int theIndex, const Select3D_Pnt & theValue);

		/****** Select3D_PointData::SetPnt ******/
		/****** md5 signature: 279a14c6e5c430902b1b1027581d872a ******/
		%feature("compactdefaultargs") SetPnt;
		%feature("autodoc", "
Parameters
----------
theIndex: int
theValue: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") SetPnt;
		void SetPnt(const int theIndex, const gp_Pnt & theValue);

		/****** Select3D_PointData::Size ******/
		/****** md5 signature: 95fd550d1712c017c7cad2fbb2186e09 ******/
		%feature("compactdefaultargs") Size;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Size;
		int Size();

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
		/****** Select3D_SensitiveBox::Select3D_SensitiveBox ******/
		/****** md5 signature: 43837d953f8e8ba92f51581379e8aa94 ******/
		%feature("compactdefaultargs") Select3D_SensitiveBox;
		%feature("autodoc", "
Parameters
----------
theOwnerId: SelectMgr_EntityOwner
theBox: Bnd_Box

Return
-------
None

Description
-----------
Constructs a sensitive box object defined by the owner theOwnerId, and the box theBox.
") Select3D_SensitiveBox;
		 Select3D_SensitiveBox(const opencascade::handle<SelectMgr_EntityOwner> & theOwnerId, const Bnd_Box & theBox);

		/****** Select3D_SensitiveBox::Select3D_SensitiveBox ******/
		/****** md5 signature: 6fceffb3168bc6a70f63b7d1e51bd114 ******/
		%feature("compactdefaultargs") Select3D_SensitiveBox;
		%feature("autodoc", "
Parameters
----------
theOwnerId: SelectMgr_EntityOwner
theXMin: double
theYMin: double
theZMin: double
theXMax: double
theYMax: double
theZMax: double

Return
-------
None

Description
-----------
Constructs a sensitive box object defined by the owner theOwnerId, and the coordinates theXmin, theYMin, theZMin, theXMax, theYMax, theZMax. theXmin, theYMin and theZMin define the minimum point in the front lower left hand corner of the box, and theXMax, theYMax and theZMax define the maximum point in the back upper right hand corner of the box.
") Select3D_SensitiveBox;
		 Select3D_SensitiveBox(const opencascade::handle<SelectMgr_EntityOwner> & theOwnerId, const double theXMin, const double theYMin, const double theZMin, const double theXMax, const double theYMax, const double theZMax);

		/****** Select3D_SensitiveBox::BoundingBox ******/
		/****** md5 signature: 633863f7086aa730ff696b4814fc0aea ******/
		%feature("compactdefaultargs") BoundingBox;
		%feature("autodoc", "Return
-------
Select3D_BndBox3d

Description
-----------
Returns coordinates of the box. If location transformation is set, it will be applied.
") BoundingBox;
		Select3D_BndBox3d BoundingBox();

		/****** Select3D_SensitiveBox::CenterOfGeometry ******/
		/****** md5 signature: 405abf8a0e67491197d4d1f3675f4381 ******/
		%feature("compactdefaultargs") CenterOfGeometry;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Returns center of the box. If location transformation is set, it will be applied.
") CenterOfGeometry;
		gp_Pnt CenterOfGeometry();


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
		/****** Select3D_SensitiveBox::GetConnected ******/
		/****** md5 signature: a3c8e77274f838c789102a492a808dca ******/
		%feature("compactdefaultargs") GetConnected;
		%feature("autodoc", "Return
-------
opencascade::handle<Select3D_SensitiveEntity>

Description
-----------
No available documentation.
") GetConnected;
		opencascade::handle<Select3D_SensitiveEntity> GetConnected();

		/****** Select3D_SensitiveBox::Matches ******/
		/****** md5 signature: 9eee725668f2c37b2df03ecf1889ee0f ******/
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "
Parameters
----------
theMgr: SelectBasics_SelectingVolumeManager
thePickResult: SelectBasics_PickResult

Return
-------
bool

Description
-----------
Checks whether the box overlaps current selecting volume.
") Matches;
		bool Matches(SelectBasics_SelectingVolumeManager & theMgr, SelectBasics_PickResult & thePickResult);

		/****** Select3D_SensitiveBox::NbSubElements ******/
		/****** md5 signature: 0cbf60f70214c5391f27cbd18a04e594 ******/
		%feature("compactdefaultargs") NbSubElements;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the amount of sub-entities in sensitive.
") NbSubElements;
		int NbSubElements();

		/****** Select3D_SensitiveBox::ToBuildBVH ******/
		/****** md5 signature: e88d69d61fbb75e5a2a6fe0e8b515be3 ******/
		%feature("compactdefaultargs") ToBuildBVH;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if BVH tree is in invalidated state.
") ToBuildBVH;
		bool ToBuildBVH();

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

/*********************************
* class Select3D_SensitiveCircle *
*********************************/
/***********************************
* class Select3D_SensitiveCylinder *
***********************************/
class Select3D_SensitiveCylinder : public Select3D_SensitiveEntity {
	public:
		/****** Select3D_SensitiveCylinder::Select3D_SensitiveCylinder ******/
		/****** md5 signature: 47b8a5823ba79442ffea77bab0b7559e ******/
		%feature("compactdefaultargs") Select3D_SensitiveCylinder;
		%feature("autodoc", "
Parameters
----------
theOwnerId: SelectMgr_EntityOwner
theBottomRad: double
theTopRad: double
theHeight: double
theTrsf: gp_Trsf
theIsHollow: bool (optional, default to false)

Return
-------
None

Description
-----------
Constructs a sensitive cylinder object defined by the owner theOwnerId, 
Input parameter: theBottomRad cylinder bottom radius 
Input parameter: theTopRad cylinder top radius 
Input parameter: theHeight cylinder height.
") Select3D_SensitiveCylinder;
		 Select3D_SensitiveCylinder(const opencascade::handle<SelectMgr_EntityOwner> & theOwnerId, const double theBottomRad, const double theTopRad, const double theHeight, const gp_Trsf & theTrsf, const bool theIsHollow = false);

		/****** Select3D_SensitiveCylinder::BottomRadius ******/
		/****** md5 signature: c4bbd9b132ccf1402ca0ad509b786f5f ******/
		%feature("compactdefaultargs") BottomRadius;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns cylinder bottom radius.
") BottomRadius;
		double BottomRadius();

		/****** Select3D_SensitiveCylinder::BoundingBox ******/
		/****** md5 signature: 633863f7086aa730ff696b4814fc0aea ******/
		%feature("compactdefaultargs") BoundingBox;
		%feature("autodoc", "Return
-------
Select3D_BndBox3d

Description
-----------
Returns bounding box of the cylinder. If location transformation is set, it will be applied.
") BoundingBox;
		Select3D_BndBox3d BoundingBox();

		/****** Select3D_SensitiveCylinder::CenterOfGeometry ******/
		/****** md5 signature: 405abf8a0e67491197d4d1f3675f4381 ******/
		%feature("compactdefaultargs") CenterOfGeometry;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Returns center of the cylinder with transformation applied.
") CenterOfGeometry;
		gp_Pnt CenterOfGeometry();

		/****** Select3D_SensitiveCylinder::GetConnected ******/
		/****** md5 signature: a3c8e77274f838c789102a492a808dca ******/
		%feature("compactdefaultargs") GetConnected;
		%feature("autodoc", "Return
-------
opencascade::handle<Select3D_SensitiveEntity>

Description
-----------
Returns the copy of this.
") GetConnected;
		opencascade::handle<Select3D_SensitiveEntity> GetConnected();

		/****** Select3D_SensitiveCylinder::Height ******/
		/****** md5 signature: 9c46d00747f4ed1daa12e35fc861dfad ******/
		%feature("compactdefaultargs") Height;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns cylinder height.
") Height;
		double Height();

		/****** Select3D_SensitiveCylinder::IsHollow ******/
		/****** md5 signature: 9ad605d96544c009ddee8f5856312fab ******/
		%feature("compactdefaultargs") IsHollow;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the cylinder is empty inside.
") IsHollow;
		bool IsHollow();

		/****** Select3D_SensitiveCylinder::Matches ******/
		/****** md5 signature: 9eee725668f2c37b2df03ecf1889ee0f ******/
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "
Parameters
----------
theMgr: SelectBasics_SelectingVolumeManager
thePickResult: SelectBasics_PickResult

Return
-------
bool

Description
-----------
Checks whether the cylinder overlaps current selecting volume.
") Matches;
		bool Matches(SelectBasics_SelectingVolumeManager & theMgr, SelectBasics_PickResult & thePickResult);

		/****** Select3D_SensitiveCylinder::NbSubElements ******/
		/****** md5 signature: 4a8c4d129f7e6a31251dd926827a1299 ******/
		%feature("compactdefaultargs") NbSubElements;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the amount of points.
") NbSubElements;
		int NbSubElements();

		/****** Select3D_SensitiveCylinder::ToBuildBVH ******/
		/****** md5 signature: e88d69d61fbb75e5a2a6fe0e8b515be3 ******/
		%feature("compactdefaultargs") ToBuildBVH;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Always returns false.
") ToBuildBVH;
		bool ToBuildBVH();

		/****** Select3D_SensitiveCylinder::TopRadius ******/
		/****** md5 signature: be993275312c82d88798644fc3d95560 ******/
		%feature("compactdefaultargs") TopRadius;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns cylinder top radius.
") TopRadius;
		double TopRadius();

		/****** Select3D_SensitiveCylinder::Transformation ******/
		/****** md5 signature: 4340f0c35d6856faf6f9daeca03f9595 ******/
		%feature("compactdefaultargs") Transformation;
		%feature("autodoc", "Return
-------
gp_Trsf

Description
-----------
Returns cylinder transformation.
") Transformation;
		const gp_Trsf Transformation();

};


%make_alias(Select3D_SensitiveCylinder)

%extend Select3D_SensitiveCylinder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class Select3D_SensitiveFace *
*******************************/
class Select3D_SensitiveFace : public Select3D_SensitiveEntity {
	public:
		/****** Select3D_SensitiveFace::Select3D_SensitiveFace ******/
		/****** md5 signature: e502f300aaf61dd65bc4ee2f8fc1ac5a ******/
		%feature("compactdefaultargs") Select3D_SensitiveFace;
		%feature("autodoc", "
Parameters
----------
theOwnerId: SelectMgr_EntityOwner
thePoints: TColgp_Array1OfPnt
theType: Select3D_TypeOfSensitivity

Return
-------
None

Description
-----------
Constructs a sensitive face object defined by the owner theOwnerId, the array of points thePoints, and the sensitivity type theType. The array of points is the outer polygon of the geometric face.
") Select3D_SensitiveFace;
		 Select3D_SensitiveFace(const opencascade::handle<SelectMgr_EntityOwner> & theOwnerId, const TColgp_Array1OfPnt & thePoints, const Select3D_TypeOfSensitivity theType);

		/****** Select3D_SensitiveFace::Select3D_SensitiveFace ******/
		/****** md5 signature: 2cfaa0d74b99dbe9d8d3ac1882bb5037 ******/
		%feature("compactdefaultargs") Select3D_SensitiveFace;
		%feature("autodoc", "
Parameters
----------
theOwnerId: SelectMgr_EntityOwner
thePoints: TColgp_HArray1OfPnt
theType: Select3D_TypeOfSensitivity

Return
-------
None

Description
-----------
Constructs a sensitive face object defined by the owner theOwnerId, the array of points thePoints, and the sensitivity type theType. The array of points is the outer polygon of the geometric face.
") Select3D_SensitiveFace;
		 Select3D_SensitiveFace(const opencascade::handle<SelectMgr_EntityOwner> & theOwnerId, const opencascade::handle<TColgp_HArray1OfPnt> & thePoints, const Select3D_TypeOfSensitivity theType);

		/****** Select3D_SensitiveFace::BVH ******/
		/****** md5 signature: ea19f810848cc4896f3127faf0cdc872 ******/
		%feature("compactdefaultargs") BVH;
		%feature("autodoc", "Return
-------
None

Description
-----------
Builds BVH tree for the face.
") BVH;
		void BVH();

		/****** Select3D_SensitiveFace::BoundingBox ******/
		/****** md5 signature: 633863f7086aa730ff696b4814fc0aea ******/
		%feature("compactdefaultargs") BoundingBox;
		%feature("autodoc", "Return
-------
Select3D_BndBox3d

Description
-----------
Returns bounding box of the face. If location transformation is set, it will be applied.
") BoundingBox;
		Select3D_BndBox3d BoundingBox();

		/****** Select3D_SensitiveFace::CenterOfGeometry ******/
		/****** md5 signature: 405abf8a0e67491197d4d1f3675f4381 ******/
		%feature("compactdefaultargs") CenterOfGeometry;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Returns center of the face. If location transformation is set, it will be applied.
") CenterOfGeometry;
		gp_Pnt CenterOfGeometry();


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
		/****** Select3D_SensitiveFace::GetConnected ******/
		/****** md5 signature: a3c8e77274f838c789102a492a808dca ******/
		%feature("compactdefaultargs") GetConnected;
		%feature("autodoc", "Return
-------
opencascade::handle<Select3D_SensitiveEntity>

Description
-----------
No available documentation.
") GetConnected;
		opencascade::handle<Select3D_SensitiveEntity> GetConnected();

		/****** Select3D_SensitiveFace::GetPoints ******/
		/****** md5 signature: 244db23784c3ba41dd0c416aefc1d5e0 ******/
		%feature("compactdefaultargs") GetPoints;
		%feature("autodoc", "Return
-------
opencascade::handle<TColgp_HArray1OfPnt>

Description
-----------
Returns 3d coordinates of vertices of the face. 
Return: handle to array of 3D vertex coordinates.
") GetPoints;
		opencascade::handle<TColgp_HArray1OfPnt> GetPoints();

		/****** Select3D_SensitiveFace::GetPoints ******/
		/****** md5 signature: 590fd96946410cecec040265ea225877 ******/
		%feature("compactdefaultargs") GetPoints;
		%feature("autodoc", "
Parameters
----------
theHArrayOfPnt: TColgp_HArray1OfPnt

Return
-------
None

Description
-----------
No available documentation.
") GetPoints;
		void GetPoints(opencascade::handle<TColgp_HArray1OfPnt> & theHArrayOfPnt);

		/****** Select3D_SensitiveFace::Matches ******/
		/****** md5 signature: 9eee725668f2c37b2df03ecf1889ee0f ******/
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "
Parameters
----------
theMgr: SelectBasics_SelectingVolumeManager
thePickResult: SelectBasics_PickResult

Return
-------
bool

Description
-----------
Checks whether the face overlaps current selecting volume.
") Matches;
		bool Matches(SelectBasics_SelectingVolumeManager & theMgr, SelectBasics_PickResult & thePickResult);

		/****** Select3D_SensitiveFace::NbSubElements ******/
		/****** md5 signature: 0cbf60f70214c5391f27cbd18a04e594 ******/
		%feature("compactdefaultargs") NbSubElements;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the amount of sub-entities (points or planar convex polygons).
") NbSubElements;
		int NbSubElements();

		/****** Select3D_SensitiveFace::ToBuildBVH ******/
		/****** md5 signature: e88d69d61fbb75e5a2a6fe0e8b515be3 ******/
		%feature("compactdefaultargs") ToBuildBVH;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if BVH tree is in invalidated state.
") ToBuildBVH;
		bool ToBuildBVH();

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
		/****** Select3D_SensitivePoint::Select3D_SensitivePoint ******/
		/****** md5 signature: b377653179f828011c220b36c7e0c91a ******/
		%feature("compactdefaultargs") Select3D_SensitivePoint;
		%feature("autodoc", "
Parameters
----------
theOwnerId: SelectMgr_EntityOwner
thePoint: gp_Pnt

Return
-------
None

Description
-----------
Constructs a sensitive point object defined by the owner OwnerId and the point Point.
") Select3D_SensitivePoint;
		 Select3D_SensitivePoint(const opencascade::handle<SelectMgr_EntityOwner> & theOwnerId, const gp_Pnt & thePoint);

		/****** Select3D_SensitivePoint::BoundingBox ******/
		/****** md5 signature: 633863f7086aa730ff696b4814fc0aea ******/
		%feature("compactdefaultargs") BoundingBox;
		%feature("autodoc", "Return
-------
Select3D_BndBox3d

Description
-----------
Returns bounding box of the point. If location transformation is set, it will be applied.
") BoundingBox;
		Select3D_BndBox3d BoundingBox();

		/****** Select3D_SensitivePoint::CenterOfGeometry ******/
		/****** md5 signature: 405abf8a0e67491197d4d1f3675f4381 ******/
		%feature("compactdefaultargs") CenterOfGeometry;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Returns center of point. If location transformation is set, it will be applied.
") CenterOfGeometry;
		gp_Pnt CenterOfGeometry();


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
		/****** Select3D_SensitivePoint::GetConnected ******/
		/****** md5 signature: a3c8e77274f838c789102a492a808dca ******/
		%feature("compactdefaultargs") GetConnected;
		%feature("autodoc", "Return
-------
opencascade::handle<Select3D_SensitiveEntity>

Description
-----------
No available documentation.
") GetConnected;
		opencascade::handle<Select3D_SensitiveEntity> GetConnected();

		/****** Select3D_SensitivePoint::Matches ******/
		/****** md5 signature: 9eee725668f2c37b2df03ecf1889ee0f ******/
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "
Parameters
----------
theMgr: SelectBasics_SelectingVolumeManager
thePickResult: SelectBasics_PickResult

Return
-------
bool

Description
-----------
Checks whether the point overlaps current selecting volume.
") Matches;
		bool Matches(SelectBasics_SelectingVolumeManager & theMgr, SelectBasics_PickResult & thePickResult);

		/****** Select3D_SensitivePoint::NbSubElements ******/
		/****** md5 signature: 0cbf60f70214c5391f27cbd18a04e594 ******/
		%feature("compactdefaultargs") NbSubElements;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the amount of sub-entities in sensitive.
") NbSubElements;
		int NbSubElements();

		/****** Select3D_SensitivePoint::Point ******/
		/****** md5 signature: 4e742d9ca138939180edee86d3b37a8f ******/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Returns the point used at the time of construction.
") Point;
		const gp_Pnt Point();

		/****** Select3D_SensitivePoint::ToBuildBVH ******/
		/****** md5 signature: e88d69d61fbb75e5a2a6fe0e8b515be3 ******/
		%feature("compactdefaultargs") ToBuildBVH;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if BVH tree is in invalidated state.
") ToBuildBVH;
		bool ToBuildBVH();

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
		/****** Select3D_SensitiveSegment::Select3D_SensitiveSegment ******/
		/****** md5 signature: c141ce483d131fd3396b3073763c27b3 ******/
		%feature("compactdefaultargs") Select3D_SensitiveSegment;
		%feature("autodoc", "
Parameters
----------
theOwnerId: SelectMgr_EntityOwner
theFirstPnt: gp_Pnt
theLastPnt: gp_Pnt

Return
-------
None

Description
-----------
Constructs the sensitive segment object defined by the owner theOwnerId, the points theFirstPnt, theLastPnt.
") Select3D_SensitiveSegment;
		 Select3D_SensitiveSegment(const opencascade::handle<SelectMgr_EntityOwner> & theOwnerId, const gp_Pnt & theFirstPnt, const gp_Pnt & theLastPnt);

		/****** Select3D_SensitiveSegment::BoundingBox ******/
		/****** md5 signature: 633863f7086aa730ff696b4814fc0aea ******/
		%feature("compactdefaultargs") BoundingBox;
		%feature("autodoc", "Return
-------
Select3D_BndBox3d

Description
-----------
Returns bounding box of the segment. If location transformation is set, it will be applied.
") BoundingBox;
		Select3D_BndBox3d BoundingBox();

		/****** Select3D_SensitiveSegment::CenterOfGeometry ******/
		/****** md5 signature: 405abf8a0e67491197d4d1f3675f4381 ******/
		%feature("compactdefaultargs") CenterOfGeometry;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Returns center of the segment. If location transformation is set, it will be applied.
") CenterOfGeometry;
		gp_Pnt CenterOfGeometry();


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
		/****** Select3D_SensitiveSegment::EndPoint ******/
		/****** md5 signature: 215af104676c67d500840bc0352e57ff ******/
		%feature("compactdefaultargs") EndPoint;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
gives the 3D End Point of the Segment.
") EndPoint;
		const gp_Pnt EndPoint();

		/****** Select3D_SensitiveSegment::EndPoint ******/
		/****** md5 signature: 5a1d0dd53d485d40e815a64c0b7e0098 ******/
		%feature("compactdefaultargs") EndPoint;
		%feature("autodoc", "
Parameters
----------
thePnt: gp_Pnt

Return
-------
None

Description
-----------
changes the end point of the segment.
") EndPoint;
		void EndPoint(const gp_Pnt & thePnt);

		/****** Select3D_SensitiveSegment::GetConnected ******/
		/****** md5 signature: a3c8e77274f838c789102a492a808dca ******/
		%feature("compactdefaultargs") GetConnected;
		%feature("autodoc", "Return
-------
opencascade::handle<Select3D_SensitiveEntity>

Description
-----------
No available documentation.
") GetConnected;
		opencascade::handle<Select3D_SensitiveEntity> GetConnected();

		/****** Select3D_SensitiveSegment::Matches ******/
		/****** md5 signature: 9eee725668f2c37b2df03ecf1889ee0f ******/
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "
Parameters
----------
theMgr: SelectBasics_SelectingVolumeManager
thePickResult: SelectBasics_PickResult

Return
-------
bool

Description
-----------
Checks whether the segment overlaps current selecting volume.
") Matches;
		bool Matches(SelectBasics_SelectingVolumeManager & theMgr, SelectBasics_PickResult & thePickResult);

		/****** Select3D_SensitiveSegment::NbSubElements ******/
		/****** md5 signature: 0cbf60f70214c5391f27cbd18a04e594 ******/
		%feature("compactdefaultargs") NbSubElements;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the amount of points.
") NbSubElements;
		int NbSubElements();

		/****** Select3D_SensitiveSegment::SetEndPoint ******/
		/****** md5 signature: 55015a3f04b6aa4f76e293195e6af803 ******/
		%feature("compactdefaultargs") SetEndPoint;
		%feature("autodoc", "
Parameters
----------
thePnt: gp_Pnt

Return
-------
None

Description
-----------
changes the end point of the segment.
") SetEndPoint;
		void SetEndPoint(const gp_Pnt & thePnt);

		/****** Select3D_SensitiveSegment::SetStartPoint ******/
		/****** md5 signature: 174c4484c3a3dbce9b4ca018cb428284 ******/
		%feature("compactdefaultargs") SetStartPoint;
		%feature("autodoc", "
Parameters
----------
thePnt: gp_Pnt

Return
-------
None

Description
-----------
changes the start Point of the Segment;.
") SetStartPoint;
		void SetStartPoint(const gp_Pnt & thePnt);

		/****** Select3D_SensitiveSegment::StartPoint ******/
		/****** md5 signature: 2612c145bdd0fcec4fb2333727d26824 ******/
		%feature("compactdefaultargs") StartPoint;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
gives the 3D start Point of the Segment.
") StartPoint;
		const gp_Pnt StartPoint();

		/****** Select3D_SensitiveSegment::StartPoint ******/
		/****** md5 signature: 12d46965d72c0ef983e6c5d12da8a947 ******/
		%feature("compactdefaultargs") StartPoint;
		%feature("autodoc", "
Parameters
----------
thePnt: gp_Pnt

Return
-------
None

Description
-----------
changes the start Point of the Segment;.
") StartPoint;
		void StartPoint(const gp_Pnt & thePnt);

		/****** Select3D_SensitiveSegment::ToBuildBVH ******/
		/****** md5 signature: e88d69d61fbb75e5a2a6fe0e8b515be3 ******/
		%feature("compactdefaultargs") ToBuildBVH;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if BVH tree is in invalidated state.
") ToBuildBVH;
		bool ToBuildBVH();

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
/*********************************
* class Select3D_SensitiveSphere *
*********************************/
class Select3D_SensitiveSphere : public Select3D_SensitiveEntity {
	public:
		/****** Select3D_SensitiveSphere::Select3D_SensitiveSphere ******/
		/****** md5 signature: c455a1a734d09a2f44fd8088678a6760 ******/
		%feature("compactdefaultargs") Select3D_SensitiveSphere;
		%feature("autodoc", "
Parameters
----------
theOwnerId: SelectMgr_EntityOwner
theCenter: gp_Pnt
theRadius: double

Return
-------
None

Description
-----------
Constructs a sensitive sphere object defined by the owner theOwnerId, the center of the sphere and it's radius.
") Select3D_SensitiveSphere;
		 Select3D_SensitiveSphere(const opencascade::handle<SelectMgr_EntityOwner> & theOwnerId, const gp_Pnt & theCenter, const double theRadius);

		/****** Select3D_SensitiveSphere::BoundingBox ******/
		/****** md5 signature: 633863f7086aa730ff696b4814fc0aea ******/
		%feature("compactdefaultargs") BoundingBox;
		%feature("autodoc", "Return
-------
Select3D_BndBox3d

Description
-----------
Returns bounding box of the sphere. If location transformation is set, it will be applied.
") BoundingBox;
		Select3D_BndBox3d BoundingBox();

		/****** Select3D_SensitiveSphere::CenterOfGeometry ******/
		/****** md5 signature: 62b5799fcc1932d1822fcdd55d64a53f ******/
		%feature("compactdefaultargs") CenterOfGeometry;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Returns center of the sphere with transformation applied.
") CenterOfGeometry;
		gp_Pnt CenterOfGeometry();

		/****** Select3D_SensitiveSphere::GetConnected ******/
		/****** md5 signature: a3c8e77274f838c789102a492a808dca ******/
		%feature("compactdefaultargs") GetConnected;
		%feature("autodoc", "Return
-------
opencascade::handle<Select3D_SensitiveEntity>

Description
-----------
Returns the copy of this.
") GetConnected;
		opencascade::handle<Select3D_SensitiveEntity> GetConnected();

		/****** Select3D_SensitiveSphere::LastDetectedPoint ******/
		/****** md5 signature: e21e43f41a76a4e73c8bd23b296057d3 ******/
		%feature("compactdefaultargs") LastDetectedPoint;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Returns the position of detected point on the sphere.
") LastDetectedPoint;
		const gp_Pnt LastDetectedPoint();

		/****** Select3D_SensitiveSphere::Matches ******/
		/****** md5 signature: 9eee725668f2c37b2df03ecf1889ee0f ******/
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "
Parameters
----------
theMgr: SelectBasics_SelectingVolumeManager
thePickResult: SelectBasics_PickResult

Return
-------
bool

Description
-----------
Checks whether the sphere overlaps current selecting volume.
") Matches;
		bool Matches(SelectBasics_SelectingVolumeManager & theMgr, SelectBasics_PickResult & thePickResult);

		/****** Select3D_SensitiveSphere::NbSubElements ******/
		/****** md5 signature: 4a8c4d129f7e6a31251dd926827a1299 ******/
		%feature("compactdefaultargs") NbSubElements;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the amount of points.
") NbSubElements;
		int NbSubElements();

		/****** Select3D_SensitiveSphere::Radius ******/
		/****** md5 signature: 1f0279eb23f422b6f225b95988440743 ******/
		%feature("compactdefaultargs") Radius;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the radius of the sphere.
") Radius;
		double Radius();

		/****** Select3D_SensitiveSphere::ResetLastDetectedPoint ******/
		/****** md5 signature: 1cbeaf92700ac7b137749cc664093495 ******/
		%feature("compactdefaultargs") ResetLastDetectedPoint;
		%feature("autodoc", "Return
-------
None

Description
-----------
Invalidate the position of detected point on the sphere.
") ResetLastDetectedPoint;
		void ResetLastDetectedPoint();

		/****** Select3D_SensitiveSphere::ToBuildBVH ******/
		/****** md5 signature: e88d69d61fbb75e5a2a6fe0e8b515be3 ******/
		%feature("compactdefaultargs") ToBuildBVH;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Always returns false.
") ToBuildBVH;
		bool ToBuildBVH();

};


%make_alias(Select3D_SensitiveSphere)

%extend Select3D_SensitiveSphere {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class Select3D_SensitiveTriangle *
***********************************/
class Select3D_SensitiveTriangle : public Select3D_SensitiveEntity {
	public:
		/****** Select3D_SensitiveTriangle::Select3D_SensitiveTriangle ******/
		/****** md5 signature: 45fd0e1195c3cfc8f8c7681ecf71dc8a ******/
		%feature("compactdefaultargs") Select3D_SensitiveTriangle;
		%feature("autodoc", "
Parameters
----------
theOwnerId: SelectMgr_EntityOwner
thePnt0: gp_Pnt
thePnt1: gp_Pnt
thePnt2: gp_Pnt
theType: Select3D_TypeOfSensitivity (optional, default to Select3D_TOS_INTERIOR)

Return
-------
None

Description
-----------
Constructs a sensitive triangle object defined by the owner theOwnerId, the points P1, P2, P3, and the type of sensitivity Sensitivity.
") Select3D_SensitiveTriangle;
		 Select3D_SensitiveTriangle(const opencascade::handle<SelectMgr_EntityOwner> & theOwnerId, const gp_Pnt & thePnt0, const gp_Pnt & thePnt1, const gp_Pnt & thePnt2, const Select3D_TypeOfSensitivity theType = Select3D_TOS_INTERIOR);

		/****** Select3D_SensitiveTriangle::BoundingBox ******/
		/****** md5 signature: 633863f7086aa730ff696b4814fc0aea ******/
		%feature("compactdefaultargs") BoundingBox;
		%feature("autodoc", "Return
-------
Select3D_BndBox3d

Description
-----------
Returns bounding box of the triangle. If location transformation is set, it will be applied.
") BoundingBox;
		Select3D_BndBox3d BoundingBox();

		/****** Select3D_SensitiveTriangle::Center3D ******/
		/****** md5 signature: 1abffa9f7c08b130939075b3b4320455 ******/
		%feature("compactdefaultargs") Center3D;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Returns the center point of the sensitive triangle created at construction time.
") Center3D;
		gp_Pnt Center3D();

		/****** Select3D_SensitiveTriangle::CenterOfGeometry ******/
		/****** md5 signature: 62b5799fcc1932d1822fcdd55d64a53f ******/
		%feature("compactdefaultargs") CenterOfGeometry;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
No available documentation.
") CenterOfGeometry;
		gp_Pnt CenterOfGeometry();


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
		/****** Select3D_SensitiveTriangle::GetConnected ******/
		/****** md5 signature: a3c8e77274f838c789102a492a808dca ******/
		%feature("compactdefaultargs") GetConnected;
		%feature("autodoc", "Return
-------
opencascade::handle<Select3D_SensitiveEntity>

Description
-----------
Returns the copy of this.
") GetConnected;
		opencascade::handle<Select3D_SensitiveEntity> GetConnected();

		/****** Select3D_SensitiveTriangle::Matches ******/
		/****** md5 signature: 9eee725668f2c37b2df03ecf1889ee0f ******/
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "
Parameters
----------
theMgr: SelectBasics_SelectingVolumeManager
thePickResult: SelectBasics_PickResult

Return
-------
bool

Description
-----------
Checks whether the triangle overlaps current selecting volume.
") Matches;
		bool Matches(SelectBasics_SelectingVolumeManager & theMgr, SelectBasics_PickResult & thePickResult);

		/****** Select3D_SensitiveTriangle::NbSubElements ******/
		/****** md5 signature: 4a8c4d129f7e6a31251dd926827a1299 ******/
		%feature("compactdefaultargs") NbSubElements;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the amount of points.
") NbSubElements;
		int NbSubElements();

		/****** Select3D_SensitiveTriangle::Points3D ******/
		/****** md5 signature: c926675a908ce3d4a3055fe72df15440 ******/
		%feature("compactdefaultargs") Points3D;
		%feature("autodoc", "
Parameters
----------
thePnt0: gp_Pnt
thePnt1: gp_Pnt
thePnt2: gp_Pnt

Return
-------
None

Description
-----------
Returns the 3D points P1, P2, P3 used at the time of construction.
") Points3D;
		void Points3D(gp_Pnt & thePnt0, gp_Pnt & thePnt1, gp_Pnt & thePnt2);

		/****** Select3D_SensitiveTriangle::ToBuildBVH ******/
		/****** md5 signature: e88d69d61fbb75e5a2a6fe0e8b515be3 ******/
		%feature("compactdefaultargs") ToBuildBVH;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if BVH tree is in invalidated state.
") ToBuildBVH;
		bool ToBuildBVH();

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
		/****** Select3D_InteriorSensitivePointSet::Select3D_InteriorSensitivePointSet ******/
		/****** md5 signature: f8ef69c7a7b611bf64e21720de04ebde ******/
		%feature("compactdefaultargs") Select3D_InteriorSensitivePointSet;
		%feature("autodoc", "
Parameters
----------
theOwnerId: SelectMgr_EntityOwner
thePoints: TColgp_Array1OfPnt

Return
-------
None

Description
-----------
Splits the given point set thePoints onto planar convex polygons.
") Select3D_InteriorSensitivePointSet;
		 Select3D_InteriorSensitivePointSet(const opencascade::handle<SelectMgr_EntityOwner> & theOwnerId, const TColgp_Array1OfPnt & thePoints);

		/****** Select3D_InteriorSensitivePointSet::BoundingBox ******/
		/****** md5 signature: 633863f7086aa730ff696b4814fc0aea ******/
		%feature("compactdefaultargs") BoundingBox;
		%feature("autodoc", "Return
-------
Select3D_BndBox3d

Description
-----------
Returns bounding box of the point set. If location transformation is set, it will be applied.
") BoundingBox;
		Select3D_BndBox3d BoundingBox();

		/****** Select3D_InteriorSensitivePointSet::Box ******/
		/****** md5 signature: a2ce38217e8c3c3e41f58a85973ff262 ******/
		%feature("compactdefaultargs") Box;
		%feature("autodoc", "
Parameters
----------
theIdx: int

Return
-------
Select3D_BndBox3d

Description
-----------
Returns bounding box of planar convex polygon with index theIdx.
") Box;
		Select3D_BndBox3d Box(const int theIdx);

		/****** Select3D_InteriorSensitivePointSet::Center ******/
		/****** md5 signature: d631215324043d52c3ee2e21e8a95af0 ******/
		%feature("compactdefaultargs") Center;
		%feature("autodoc", "
Parameters
----------
theIdx: int
theAxis: int

Return
-------
double

Description
-----------
Returns geometry center of planar convex polygon with index theIdx in the vector along the given axis theAxis.
") Center;
		double Center(const int theIdx, const int theAxis);

		/****** Select3D_InteriorSensitivePointSet::CenterOfGeometry ******/
		/****** md5 signature: 405abf8a0e67491197d4d1f3675f4381 ******/
		%feature("compactdefaultargs") CenterOfGeometry;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Returns center of the point set. If location transformation is set, it will be applied.
") CenterOfGeometry;
		gp_Pnt CenterOfGeometry();


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
		/****** Select3D_InteriorSensitivePointSet::GetPoints ******/
		/****** md5 signature: 244db23784c3ba41dd0c416aefc1d5e0 ******/
		%feature("compactdefaultargs") GetPoints;
		%feature("autodoc", "Return
-------
opencascade::handle<TColgp_HArray1OfPnt>

Description
-----------
Returns 3d coordinates of vertices of the whole point set. 
Return: handle to array of 3D vertex coordinates.
") GetPoints;
		opencascade::handle<TColgp_HArray1OfPnt> GetPoints();

		/****** Select3D_InteriorSensitivePointSet::GetPoints ******/
		/****** md5 signature: 5402286b57fc4298a04f1897b19f972f ******/
		%feature("compactdefaultargs") GetPoints;
		%feature("autodoc", "
Parameters
----------
theHArrayOfPnt: TColgp_HArray1OfPnt

Return
-------
None

Description
-----------
No available documentation.
") GetPoints;
		virtual void GetPoints(opencascade::handle<TColgp_HArray1OfPnt> & theHArrayOfPnt);

		/****** Select3D_InteriorSensitivePointSet::NbSubElements ******/
		/****** md5 signature: 0cbf60f70214c5391f27cbd18a04e594 ******/
		%feature("compactdefaultargs") NbSubElements;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the amount of points in set.
") NbSubElements;
		int NbSubElements();

		/****** Select3D_InteriorSensitivePointSet::Size ******/
		/****** md5 signature: 1813690848b6a5332bd4875ba3d8d381 ******/
		%feature("compactdefaultargs") Size;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the length of vector of planar convex polygons.
") Size;
		int Size();

		/****** Select3D_InteriorSensitivePointSet::Swap ******/
		/****** md5 signature: 1f92b6fb813e2e35c2fd9d0259aaee1e ******/
		%feature("compactdefaultargs") Swap;
		%feature("autodoc", "
Parameters
----------
theIdx1: int
theIdx2: int

Return
-------
None

Description
-----------
Swaps items with indexes theIdx1 and theIdx2 in the vector.
") Swap;
		void Swap(const int theIdx1, const int theIdx2);

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
		/****** Select3D_SensitiveGroup::Select3D_SensitiveGroup ******/
		/****** md5 signature: 099eb7cb31759af1a3c4e26287068636 ******/
		%feature("compactdefaultargs") Select3D_SensitiveGroup;
		%feature("autodoc", "
Parameters
----------
theOwnerId: SelectMgr_EntityOwner
theIsMustMatchAll: bool (optional, default to true)

Return
-------
None

Description
-----------
Constructs an empty sensitive group object. This is a set of sensitive 3D entities. The sensitive entities will be defined using the function Add to fill the entity owner OwnerId. If MatchAll is false, nothing can be added.
") Select3D_SensitiveGroup;
		 Select3D_SensitiveGroup(const opencascade::handle<SelectMgr_EntityOwner> & theOwnerId, const bool theIsMustMatchAll = true);

		/****** Select3D_SensitiveGroup::Select3D_SensitiveGroup ******/
		/****** md5 signature: f46d3320c87222688b1401df311e5203 ******/
		%feature("compactdefaultargs") Select3D_SensitiveGroup;
		%feature("autodoc", "
Parameters
----------
theOwnerId: SelectMgr_EntityOwner
theEntities: Select3D_SensitiveEntity
theIsMustMatchAll: bool (optional, default to true)

Return
-------
None

Description
-----------
Constructs a sensitive group object defined by the list TheList and the entity owner OwnerId. If MatchAll is false, nothing is done.
") Select3D_SensitiveGroup;
		 Select3D_SensitiveGroup(const opencascade::handle<SelectMgr_EntityOwner> & theOwnerId, NCollection_Sequence<opencascade::handle<Select3D_SensitiveEntity>> & theEntities, const bool theIsMustMatchAll = true);

		/****** Select3D_SensitiveGroup::Add ******/
		/****** md5 signature: eb2e482c3a19585889e486c22645fcee ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
theEntities: Select3D_SensitiveEntity

Return
-------
None

Description
-----------
Adds the list of sensitive entities LL to the empty sensitive group object created at construction time.
") Add;
		void Add(NCollection_Sequence<opencascade::handle<Select3D_SensitiveEntity>> & theEntities);

		/****** Select3D_SensitiveGroup::Add ******/
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
Adds the sensitive entity aSensitive to the non-empty sensitive group object created at construction time.
") Add;
		void Add(const opencascade::handle<Select3D_SensitiveEntity> & theSensitive);

		/****** Select3D_SensitiveGroup::BoundingBox ******/
		/****** md5 signature: 633863f7086aa730ff696b4814fc0aea ******/
		%feature("compactdefaultargs") BoundingBox;
		%feature("autodoc", "Return
-------
Select3D_BndBox3d

Description
-----------
Returns bounding box of the group. If location transformation is set, it will be applied.
") BoundingBox;
		Select3D_BndBox3d BoundingBox();

		/****** Select3D_SensitiveGroup::Box ******/
		/****** md5 signature: a2ce38217e8c3c3e41f58a85973ff262 ******/
		%feature("compactdefaultargs") Box;
		%feature("autodoc", "
Parameters
----------
theIdx: int

Return
-------
Select3D_BndBox3d

Description
-----------
Returns bounding box of sensitive entity with index theIdx.
") Box;
		Select3D_BndBox3d Box(const int theIdx);

		/****** Select3D_SensitiveGroup::Center ******/
		/****** md5 signature: d631215324043d52c3ee2e21e8a95af0 ******/
		%feature("compactdefaultargs") Center;
		%feature("autodoc", "
Parameters
----------
theIdx: int
theAxis: int

Return
-------
double

Description
-----------
Returns geometry center of sensitive entity index theIdx in the vector along the given axis theAxis.
") Center;
		double Center(const int theIdx, const int theAxis);

		/****** Select3D_SensitiveGroup::CenterOfGeometry ******/
		/****** md5 signature: 405abf8a0e67491197d4d1f3675f4381 ******/
		%feature("compactdefaultargs") CenterOfGeometry;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Returns center of entity set. If location transformation is set, it will be applied.
") CenterOfGeometry;
		gp_Pnt CenterOfGeometry();

		/****** Select3D_SensitiveGroup::Clear ******/
		/****** md5 signature: 1c0d2ab59d0f6282725648dcdf130adb ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
Removes all sensitive entities from the list used at the time of construction, or added using the function Add.
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
		/****** Select3D_SensitiveGroup::Entities ******/
		/****** md5 signature: 7574b8d9635f72b26d3debcfbf9dc622 ******/
		%feature("compactdefaultargs") Entities;
		%feature("autodoc", "Return
-------
NCollection_IndexedMap<opencascade::handle<Select3D_SensitiveEntity>>

Description
-----------
Gets group content.
") Entities;
		const NCollection_IndexedMap<opencascade::handle<Select3D_SensitiveEntity>> & Entities();

		/****** Select3D_SensitiveGroup::GetConnected ******/
		/****** md5 signature: a3c8e77274f838c789102a492a808dca ******/
		%feature("compactdefaultargs") GetConnected;
		%feature("autodoc", "Return
-------
opencascade::handle<Select3D_SensitiveEntity>

Description
-----------
No available documentation.
") GetConnected;
		opencascade::handle<Select3D_SensitiveEntity> GetConnected();

		/****** Select3D_SensitiveGroup::IsIn ******/
		/****** md5 signature: e97768fee632606024d8a808ca0392d9 ******/
		%feature("compactdefaultargs") IsIn;
		%feature("autodoc", "
Parameters
----------
theSensitive: Select3D_SensitiveEntity

Return
-------
bool

Description
-----------
Returns true if the sensitive entity aSensitive is in the list used at the time of construction, or added using the function Add.
") IsIn;
		bool IsIn(const opencascade::handle<Select3D_SensitiveEntity> & theSensitive);

		/****** Select3D_SensitiveGroup::LastDetectedEntity ******/
		/****** md5 signature: 4ab2c72ef86d1b14ed739f60f17a6d43 ******/
		%feature("compactdefaultargs") LastDetectedEntity;
		%feature("autodoc", "Return
-------
opencascade::handle<Select3D_SensitiveEntity>

Description
-----------
Return last detected entity.
") LastDetectedEntity;
		opencascade::handle<Select3D_SensitiveEntity> LastDetectedEntity();

		/****** Select3D_SensitiveGroup::LastDetectedEntityIndex ******/
		/****** md5 signature: ce8dd9f7537e5dcf816e8adfc01c615f ******/
		%feature("compactdefaultargs") LastDetectedEntityIndex;
		%feature("autodoc", "Return
-------
int

Description
-----------
Return index of last detected entity.
") LastDetectedEntityIndex;
		int LastDetectedEntityIndex();

		/****** Select3D_SensitiveGroup::Matches ******/
		/****** md5 signature: 9eee725668f2c37b2df03ecf1889ee0f ******/
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "
Parameters
----------
theMgr: SelectBasics_SelectingVolumeManager
thePickResult: SelectBasics_PickResult

Return
-------
bool

Description
-----------
Checks whether the group overlaps current selecting volume.
") Matches;
		bool Matches(SelectBasics_SelectingVolumeManager & theMgr, SelectBasics_PickResult & thePickResult);

		/****** Select3D_SensitiveGroup::MustMatchAll ******/
		/****** md5 signature: 3d7fd9119aa47ab71a53c02dd5916e8f ******/
		%feature("compactdefaultargs") MustMatchAll;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if all sensitive entities in the list used at the time of construction, or added using the function Add must be matched.
") MustMatchAll;
		bool MustMatchAll();

		/****** Select3D_SensitiveGroup::NbSubElements ******/
		/****** md5 signature: 0cbf60f70214c5391f27cbd18a04e594 ******/
		%feature("compactdefaultargs") NbSubElements;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the amount of sub-entities.
") NbSubElements;
		int NbSubElements();

		/****** Select3D_SensitiveGroup::Remove ******/
		/****** md5 signature: cae24c639aaf899e147db1bbdc14c1ad ******/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "
Parameters
----------
theSensitive: Select3D_SensitiveEntity

Return
-------
None

Description
-----------
No available documentation.
") Remove;
		void Remove(const opencascade::handle<Select3D_SensitiveEntity> & theSensitive);

		/****** Select3D_SensitiveGroup::Set ******/
		/****** md5 signature: 36dcda63f35347b2d54b0b84ff3da57d ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
theOwnerId: SelectMgr_EntityOwner

Return
-------
None

Description
-----------
Sets the owner for all entities in group.
") Set;
		void Set(const opencascade::handle<SelectMgr_EntityOwner> & theOwnerId);

		/****** Select3D_SensitiveGroup::SetCheckOverlapAll ******/
		/****** md5 signature: db700ea4e101f409a1eef35f8e841f13 ******/
		%feature("compactdefaultargs") SetCheckOverlapAll;
		%feature("autodoc", "
Parameters
----------
theToCheckAll: bool

Return
-------
None

Description
-----------
Returns True if all sensitive entities should be checked within rectangular/polygonal selection, False by default. Can be useful for sensitive entities holding detection results as class property.
") SetCheckOverlapAll;
		void SetCheckOverlapAll(bool theToCheckAll);

		/****** Select3D_SensitiveGroup::SetMatchType ******/
		/****** md5 signature: 220e42fcb47c1796a1de52fe4bb24e2d ******/
		%feature("compactdefaultargs") SetMatchType;
		%feature("autodoc", "
Parameters
----------
theIsMustMatchAll: bool

Return
-------
None

Description
-----------
Sets the requirement that all sensitive entities in the list used at the time of construction, or added using the function Add must be matched.
") SetMatchType;
		void SetMatchType(const bool theIsMustMatchAll);

		/****** Select3D_SensitiveGroup::Size ******/
		/****** md5 signature: 1813690848b6a5332bd4875ba3d8d381 ******/
		%feature("compactdefaultargs") Size;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the length of vector of sensitive entities.
") Size;
		int Size();

		/****** Select3D_SensitiveGroup::SubEntity ******/
		/****** md5 signature: 06a5f6bc822d961bbc01dc97352ba573 ******/
		%feature("compactdefaultargs") SubEntity;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
opencascade::handle<Select3D_SensitiveEntity>

Description
-----------
Access entity by index [1, NbSubElements()].
") SubEntity;
		const opencascade::handle<Select3D_SensitiveEntity> & SubEntity(const int theIndex);

		/****** Select3D_SensitiveGroup::Swap ******/
		/****** md5 signature: 1f92b6fb813e2e35c2fd9d0259aaee1e ******/
		%feature("compactdefaultargs") Swap;
		%feature("autodoc", "
Parameters
----------
theIdx1: int
theIdx2: int

Return
-------
None

Description
-----------
Swaps items with indexes theIdx1 and theIdx2 in the vector.
") Swap;
		void Swap(const int theIdx1, const int theIdx2);

		/****** Select3D_SensitiveGroup::ToCheckOverlapAll ******/
		/****** md5 signature: 60cd5288874b8483b8dab1f5525ecfc8 ******/
		%feature("compactdefaultargs") ToCheckOverlapAll;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if all sensitive entities should be checked within rectangular/polygonal selection, False by default. Can be useful for sensitive entities holding detection results as class property.
") ToCheckOverlapAll;
		bool ToCheckOverlapAll();

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
		/****** Select3D_SensitivePoly::Select3D_SensitivePoly ******/
		/****** md5 signature: 1e59ffe9c6a2a9612c967dbd160f1f65 ******/
		%feature("compactdefaultargs") Select3D_SensitivePoly;
		%feature("autodoc", "
Parameters
----------
theOwnerId: SelectMgr_EntityOwner
thePoints: TColgp_Array1OfPnt
theIsBVHEnabled: bool

Return
-------
None

Description
-----------
Constructs a sensitive face object defined by the owner OwnerId, the array of points ThePoints, and the sensitivity type Sensitivity. The array of points is the outer polygon of the geometric face.
") Select3D_SensitivePoly;
		 Select3D_SensitivePoly(const opencascade::handle<SelectMgr_EntityOwner> & theOwnerId, const TColgp_Array1OfPnt & thePoints, const bool theIsBVHEnabled);

		/****** Select3D_SensitivePoly::Select3D_SensitivePoly ******/
		/****** md5 signature: 9833ef951be090cac48a15202fd178c9 ******/
		%feature("compactdefaultargs") Select3D_SensitivePoly;
		%feature("autodoc", "
Parameters
----------
theOwnerId: SelectMgr_EntityOwner
thePoints: TColgp_HArray1OfPnt
theIsBVHEnabled: bool

Return
-------
None

Description
-----------
Constructs a sensitive face object defined by the owner OwnerId, the array of points ThePoints, and the sensitivity type Sensitivity. The array of points is the outer polygon of the geometric face.
") Select3D_SensitivePoly;
		 Select3D_SensitivePoly(const opencascade::handle<SelectMgr_EntityOwner> & theOwnerId, const opencascade::handle<TColgp_HArray1OfPnt> & thePoints, const bool theIsBVHEnabled);

		/****** Select3D_SensitivePoly::Select3D_SensitivePoly ******/
		/****** md5 signature: bfd288502412fc4ee217e281530b751a ******/
		%feature("compactdefaultargs") Select3D_SensitivePoly;
		%feature("autodoc", "
Parameters
----------
theOwnerId: SelectMgr_EntityOwner
theCircle: gp_Circ
theU1: double
theU2: double
theIsFilled: bool (optional, default to false)
theNbPnts: int (optional, default to 12)

Return
-------
None

Description
-----------
Constructs the sensitive arc object defined by the owner theOwnerId, the circle theCircle, the parameters theU1 and theU2, the boolean theIsFilled and the number of points theNbPnts. theU1 and theU2 define the first and last points of the arc on theCircle.
") Select3D_SensitivePoly;
		 Select3D_SensitivePoly(const opencascade::handle<SelectMgr_EntityOwner> & theOwnerId, const gp_Circ & theCircle, const double theU1, const double theU2, const bool theIsFilled = false, const int theNbPnts = 12);

		/****** Select3D_SensitivePoly::Select3D_SensitivePoly ******/
		/****** md5 signature: ad9095c495980803e48d86755526c49f ******/
		%feature("compactdefaultargs") Select3D_SensitivePoly;
		%feature("autodoc", "
Parameters
----------
theOwnerId: SelectMgr_EntityOwner
theIsBVHEnabled: bool
theNbPnts: int (optional, default to 6)

Return
-------
None

Description
-----------
Constructs a sensitive curve or arc object defined by the owner theOwnerId, the theIsBVHEnabled flag, and the maximum number of points on the curve: theNbPnts.
") Select3D_SensitivePoly;
		 Select3D_SensitivePoly(const opencascade::handle<SelectMgr_EntityOwner> & theOwnerId, const bool theIsBVHEnabled, const int theNbPnts = 6);

		/****** Select3D_SensitivePoly::ArrayBounds ******/
		/****** md5 signature: cc0f5afd7a20f9ddc8c0beb01d1ad290 ******/
		%feature("compactdefaultargs") ArrayBounds;
		%feature("autodoc", "
Parameters
----------

Return
-------
theLow: int
theUp: int

Description
-----------
Return array bounds.
") ArrayBounds;
		void ArrayBounds(Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****** Select3D_SensitivePoly::BoundingBox ******/
		/****** md5 signature: 633863f7086aa730ff696b4814fc0aea ******/
		%feature("compactdefaultargs") BoundingBox;
		%feature("autodoc", "Return
-------
Select3D_BndBox3d

Description
-----------
Returns bounding box of a polygon. If location transformation is set, it will be applied.
") BoundingBox;
		Select3D_BndBox3d BoundingBox();

		/****** Select3D_SensitivePoly::Box ******/
		/****** md5 signature: a2ce38217e8c3c3e41f58a85973ff262 ******/
		%feature("compactdefaultargs") Box;
		%feature("autodoc", "
Parameters
----------
theIdx: int

Return
-------
Select3D_BndBox3d

Description
-----------
Returns bounding box of segment with index theIdx.
") Box;
		Select3D_BndBox3d Box(const int theIdx);

		/****** Select3D_SensitivePoly::Center ******/
		/****** md5 signature: d631215324043d52c3ee2e21e8a95af0 ******/
		%feature("compactdefaultargs") Center;
		%feature("autodoc", "
Parameters
----------
theIdx: int
theAxis: int

Return
-------
double

Description
-----------
Returns geometry center of sensitive entity index theIdx in the vector along the given axis theAxis.
") Center;
		double Center(const int theIdx, const int theAxis);

		/****** Select3D_SensitivePoly::CenterOfGeometry ******/
		/****** md5 signature: 405abf8a0e67491197d4d1f3675f4381 ******/
		%feature("compactdefaultargs") CenterOfGeometry;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Returns center of the point set. If location transformation is set, it will be applied.
") CenterOfGeometry;
		gp_Pnt CenterOfGeometry();


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
		/****** Select3D_SensitivePoly::GetPoint3d ******/
		/****** md5 signature: bc8a61cff6ce66f9eb2b32833daa4f54 ******/
		%feature("compactdefaultargs") GetPoint3d;
		%feature("autodoc", "
Parameters
----------
thePntIdx: int

Return
-------
gp_Pnt

Description
-----------
Return point.
") GetPoint3d;
		gp_Pnt GetPoint3d(const int thePntIdx);

		/****** Select3D_SensitivePoly::Matches ******/
		/****** md5 signature: 9eee725668f2c37b2df03ecf1889ee0f ******/
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "
Parameters
----------
theMgr: SelectBasics_SelectingVolumeManager
thePickResult: SelectBasics_PickResult

Return
-------
bool

Description
-----------
Checks whether the poly overlaps current selecting volume.
") Matches;
		bool Matches(SelectBasics_SelectingVolumeManager & theMgr, SelectBasics_PickResult & thePickResult);

		/****** Select3D_SensitivePoly::NbSubElements ******/
		/****** md5 signature: 0cbf60f70214c5391f27cbd18a04e594 ******/
		%feature("compactdefaultargs") NbSubElements;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the amount of segments in poly.
") NbSubElements;
		int NbSubElements();

		/****** Select3D_SensitivePoly::Points3D ******/
		/****** md5 signature: 70af43263a329b29af24d5410311d278 ******/
		%feature("compactdefaultargs") Points3D;
		%feature("autodoc", "Return
-------
opencascade::handle<TColgp_HArray1OfPnt>

Description
-----------
Returns the 3D points of the array used at construction time. 
Return: handle to array of 3D points.
") Points3D;
		opencascade::handle<TColgp_HArray1OfPnt> Points3D();

		/****** Select3D_SensitivePoly::Points3D ******/
		/****** md5 signature: 2105347048e83e4af7178d1b8af2a5e6 ******/
		%feature("compactdefaultargs") Points3D;
		%feature("autodoc", "
Parameters
----------
aHArrayOfPnt: TColgp_HArray1OfPnt

Return
-------
None

Description
-----------
No available documentation.
") Points3D;
		void Points3D(opencascade::handle<TColgp_HArray1OfPnt> & aHArrayOfPnt);

		/****** Select3D_SensitivePoly::Size ******/
		/****** md5 signature: 1813690848b6a5332bd4875ba3d8d381 ******/
		%feature("compactdefaultargs") Size;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the amount of segments of the poly.
") Size;
		int Size();

		/****** Select3D_SensitivePoly::Swap ******/
		/****** md5 signature: 1f92b6fb813e2e35c2fd9d0259aaee1e ******/
		%feature("compactdefaultargs") Swap;
		%feature("autodoc", "
Parameters
----------
theIdx1: int
theIdx2: int

Return
-------
None

Description
-----------
Swaps items with indexes theIdx1 and theIdx2 in the vector.
") Swap;
		void Swap(const int theIdx1, const int theIdx2);

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
		/****** Select3D_SensitivePrimitiveArray::Select3D_SensitivePrimitiveArray ******/
		/****** md5 signature: e979fc7a01383bbb2653515fc22158e2 ******/
		%feature("compactdefaultargs") Select3D_SensitivePrimitiveArray;
		%feature("autodoc", "
Parameters
----------
theOwnerId: SelectMgr_EntityOwner

Return
-------
None

Description
-----------
Constructs an empty sensitive object.
") Select3D_SensitivePrimitiveArray;
		 Select3D_SensitivePrimitiveArray(const opencascade::handle<SelectMgr_EntityOwner> & theOwnerId);

		/****** Select3D_SensitivePrimitiveArray::BVH ******/
		/****** md5 signature: ea19f810848cc4896f3127faf0cdc872 ******/
		%feature("compactdefaultargs") BVH;
		%feature("autodoc", "Return
-------
None

Description
-----------
Builds BVH tree for sensitive set.
") BVH;
		void BVH();

		/****** Select3D_SensitivePrimitiveArray::BoundingBox ******/
		/****** md5 signature: 633863f7086aa730ff696b4814fc0aea ******/
		%feature("compactdefaultargs") BoundingBox;
		%feature("autodoc", "Return
-------
Select3D_BndBox3d

Description
-----------
Returns bounding box of the triangulation. If location transformation is set, it will be applied.
") BoundingBox;
		Select3D_BndBox3d BoundingBox();

		/****** Select3D_SensitivePrimitiveArray::Box ******/
		/****** md5 signature: a2ce38217e8c3c3e41f58a85973ff262 ******/
		%feature("compactdefaultargs") Box;
		%feature("autodoc", "
Parameters
----------
theIdx: int

Return
-------
Select3D_BndBox3d

Description
-----------
Returns bounding box of triangle/edge with index theIdx.
") Box;
		Select3D_BndBox3d Box(const int theIdx);

		/****** Select3D_SensitivePrimitiveArray::Center ******/
		/****** md5 signature: d631215324043d52c3ee2e21e8a95af0 ******/
		%feature("compactdefaultargs") Center;
		%feature("autodoc", "
Parameters
----------
theIdx: int
theAxis: int

Return
-------
double

Description
-----------
Returns geometry center of triangle/edge with index theIdx in array along the given axis theAxis.
") Center;
		double Center(const int theIdx, const int theAxis);

		/****** Select3D_SensitivePrimitiveArray::CenterOfGeometry ******/
		/****** md5 signature: 62b5799fcc1932d1822fcdd55d64a53f ******/
		%feature("compactdefaultargs") CenterOfGeometry;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Returns center of triangulation. If location transformation is set, it will be applied.
") CenterOfGeometry;
		gp_Pnt CenterOfGeometry();


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
		/****** Select3D_SensitivePrimitiveArray::GetConnected ******/
		/****** md5 signature: a3c8e77274f838c789102a492a808dca ******/
		%feature("compactdefaultargs") GetConnected;
		%feature("autodoc", "Return
-------
opencascade::handle<Select3D_SensitiveEntity>

Description
-----------
No available documentation.
") GetConnected;
		opencascade::handle<Select3D_SensitiveEntity> GetConnected();

		/****** Select3D_SensitivePrimitiveArray::GetVertex ******/
		/****** md5 signature: 2b1f2496f07da301368eac2d7a7a2c16 ******/
		%feature("compactdefaultargs") GetVertex;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
std::array<NCollection_Vec3<float>, 3 >

Description
-----------
Return the three vertex positions of the triangle at the given triangulation index. Only meaningful for triangulation-based primitive arrays. 
Input parameter: theIndex zero-based triangle index within [0, triangle count).
") GetVertex;
		std::array<NCollection_Vec3<float>, 3 > GetVertex(const int theIndex);

		/****** Select3D_SensitivePrimitiveArray::HasInitLocation ******/
		/****** md5 signature: d710c20a306bd32531879ce6f032aa35 ******/
		%feature("compactdefaultargs") HasInitLocation;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the shape corresponding to the entity has init location.
") HasInitLocation;
		bool HasInitLocation();

		/****** Select3D_SensitivePrimitiveArray::InitPoints ******/
		/****** md5 signature: 5c3562689e447b603b95bb24e256c3a5 ******/
		%feature("compactdefaultargs") InitPoints;
		%feature("autodoc", "
Parameters
----------
theVerts: Graphic3d_Buffer
theIndices: Graphic3d_IndexBuffer
theInitLoc: TopLoc_Location
theIndexLower: int
theIndexUpper: int
theToEvalMinMax: bool (optional, default to true)
theNbGroups: int (optional, default to 1)

Return
-------
bool

Description
-----------
Initialize the sensitive object from point set. The sub-set of points can be specified by arguments theIndexLower and theIndexUpper (these are for iterating theIndices, not to restrict the actual index values!). 
Parameter theVerts attributes array containing Graphic3d_TOA_POS with type Graphic3d_TOD_VEC3 or Graphic3d_TOD_VEC2 
Parameter theIndices index array defining points 
Parameter theInitLoc location 
Parameter theIndexLower the theIndices range - first value (inclusive), starting from 0 
Parameter theIndexUpper the theIndices range - last value (inclusive), upto theIndices->NbElements-1 
Parameter theToEvalMinMax compute bounding box within initialization 
Parameter theNbGroups number of groups to split the vertex array into several parts.
") InitPoints;
		bool InitPoints(const opencascade::handle<Graphic3d_Buffer> & theVerts, const opencascade::handle<Graphic3d_IndexBuffer> & theIndices, const TopLoc_Location & theInitLoc, const int theIndexLower, const int theIndexUpper, const bool theToEvalMinMax = true, const int theNbGroups = 1);

		/****** Select3D_SensitivePrimitiveArray::InitPoints ******/
		/****** md5 signature: b986b384f638f2ae3ba7e05e57501174 ******/
		%feature("compactdefaultargs") InitPoints;
		%feature("autodoc", "
Parameters
----------
theVerts: Graphic3d_Buffer
theIndices: Graphic3d_IndexBuffer
theInitLoc: TopLoc_Location
theToEvalMinMax: bool (optional, default to true)
theNbGroups: int (optional, default to 1)

Return
-------
bool

Description
-----------
Initialize the sensitive object from point set. 
Parameter theVerts attributes array containing Graphic3d_TOA_POS with type Graphic3d_TOD_VEC3 or Graphic3d_TOD_VEC2 
Parameter theIndices index array to define subset of points 
Parameter theInitLoc location 
Parameter theToEvalMinMax compute bounding box within initialization 
Parameter theNbGroups number of groups to split the vertex array into several parts.
") InitPoints;
		bool InitPoints(const opencascade::handle<Graphic3d_Buffer> & theVerts, const opencascade::handle<Graphic3d_IndexBuffer> & theIndices, const TopLoc_Location & theInitLoc, const bool theToEvalMinMax = true, const int theNbGroups = 1);

		/****** Select3D_SensitivePrimitiveArray::InitPoints ******/
		/****** md5 signature: 9310da9f828d5bc81ea7e7bef9018069 ******/
		%feature("compactdefaultargs") InitPoints;
		%feature("autodoc", "
Parameters
----------
theVerts: Graphic3d_Buffer
theInitLoc: TopLoc_Location
theToEvalMinMax: bool (optional, default to true)
theNbGroups: int (optional, default to 1)

Return
-------
bool

Description
-----------
Initialize the sensitive object from point set. 
Parameter theVerts attributes array containing Graphic3d_TOA_POS with type Graphic3d_TOD_VEC3 or Graphic3d_TOD_VEC2 
Parameter theInitLoc location 
Parameter theToEvalMinMax compute bounding box within initialization 
Parameter theNbGroups number of groups to split the vertex array into several parts.
") InitPoints;
		bool InitPoints(const opencascade::handle<Graphic3d_Buffer> & theVerts, const TopLoc_Location & theInitLoc, const bool theToEvalMinMax = true, const int theNbGroups = 1);

		/****** Select3D_SensitivePrimitiveArray::InitTriangulation ******/
		/****** md5 signature: bdecc3726ecc1bb97ae30ccac1c575bf ******/
		%feature("compactdefaultargs") InitTriangulation;
		%feature("autodoc", "
Parameters
----------
theVerts: Graphic3d_Buffer
theIndices: Graphic3d_IndexBuffer
theInitLoc: TopLoc_Location
theIndexLower: int
theIndexUpper: int
theToEvalMinMax: bool (optional, default to true)
theNbGroups: int (optional, default to 1)

Return
-------
bool

Description
-----------
Initialize the sensitive object from triangualtion. The sub-triangulation can be specified by arguments theIndexLower and theIndexUpper (these are for iterating theIndices, not to restrict the actual index values!). 
Parameter theVerts attributes array containing Graphic3d_TOA_POS with type Graphic3d_TOD_VEC3 or Graphic3d_TOD_VEC2 
Parameter theIndices index array defining triangulation 
Parameter theInitLoc location 
Parameter theIndexLower the theIndices range - first value (inclusive), starting from 0 and multiple by 3 
Parameter theIndexUpper the theIndices range - last value (inclusive), upto theIndices->NbElements-1 and multiple by 3 
Parameter theToEvalMinMax compute bounding box within initialization 
Parameter theNbGroups number of groups to split the vertex array into several parts.
") InitTriangulation;
		bool InitTriangulation(const opencascade::handle<Graphic3d_Buffer> & theVerts, const opencascade::handle<Graphic3d_IndexBuffer> & theIndices, const TopLoc_Location & theInitLoc, const int theIndexLower, const int theIndexUpper, const bool theToEvalMinMax = true, const int theNbGroups = 1);

		/****** Select3D_SensitivePrimitiveArray::InitTriangulation ******/
		/****** md5 signature: c07896df44d657174f096dfc364ce2be ******/
		%feature("compactdefaultargs") InitTriangulation;
		%feature("autodoc", "
Parameters
----------
theVerts: Graphic3d_Buffer
theIndices: Graphic3d_IndexBuffer
theInitLoc: TopLoc_Location
theToEvalMinMax: bool (optional, default to true)
theNbGroups: int (optional, default to 1)

Return
-------
bool

Description
-----------
Initialize the sensitive object from triangualtion. 
Parameter theVerts attributes array containing Graphic3d_TOA_POS with type Graphic3d_TOD_VEC3 or Graphic3d_TOD_VEC2 
Parameter theIndices index array defining triangulation 
Parameter theInitLoc location 
Parameter theToEvalMinMax compute bounding box within initialization 
Parameter theNbGroups number of groups to split the vertex array into several parts.
") InitTriangulation;
		bool InitTriangulation(const opencascade::handle<Graphic3d_Buffer> & theVerts, const opencascade::handle<Graphic3d_IndexBuffer> & theIndices, const TopLoc_Location & theInitLoc, const bool theToEvalMinMax = true, const int theNbGroups = 1);

		/****** Select3D_SensitivePrimitiveArray::InvInitLocation ******/
		/****** md5 signature: e0a64c74f5b3da571683b41abc9addc4 ******/
		%feature("compactdefaultargs") InvInitLocation;
		%feature("autodoc", "Return
-------
gp_GTrsf

Description
-----------
Returns inversed location transformation matrix if the shape corresponding to this entity has init location set. Otherwise, returns identity matrix.
") InvInitLocation;
		gp_GTrsf InvInitLocation();

		/****** Select3D_SensitivePrimitiveArray::LastDetectedEdgeNode1 ******/
		/****** md5 signature: 9b7641a1a83713a9f986d193f0a1d8b1 ******/
		%feature("compactdefaultargs") LastDetectedEdgeNode1;
		%feature("autodoc", "Return
-------
int

Description
-----------
Return the first node of last topmost detected edge or -1 if undefined (axis picking).
") LastDetectedEdgeNode1;
		int LastDetectedEdgeNode1();

		/****** Select3D_SensitivePrimitiveArray::LastDetectedEdgeNode2 ******/
		/****** md5 signature: bdd39264c7f6f1c2cc80c793441511d7 ******/
		%feature("compactdefaultargs") LastDetectedEdgeNode2;
		%feature("autodoc", "Return
-------
int

Description
-----------
Return the second node of last topmost detected edge or -1 if undefined (axis picking).
") LastDetectedEdgeNode2;
		int LastDetectedEdgeNode2();

		/****** Select3D_SensitivePrimitiveArray::LastDetectedElement ******/
		/****** md5 signature: 1a7c7cf6333e33cd7d4d71d7e72668a6 ******/
		%feature("compactdefaultargs") LastDetectedElement;
		%feature("autodoc", "Return
-------
int

Description
-----------
Return last topmost detected element or -1 if undefined (axis picking).
") LastDetectedElement;
		int LastDetectedElement();

		/****** Select3D_SensitivePrimitiveArray::LastDetectedElementMap ******/
		/****** md5 signature: 8edbbf73f5ab93d34cf8200876c9eec5 ******/
		%feature("compactdefaultargs") LastDetectedElementMap;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HPackedMapOfInteger>

Description
-----------
Return the index map of last detected elements (rectangle selection).
") LastDetectedElementMap;
		const opencascade::handle<TColStd_HPackedMapOfInteger> & LastDetectedElementMap();

		/****** Select3D_SensitivePrimitiveArray::LastDetectedNode ******/
		/****** md5 signature: 75e162d6affa43987f584e980eaf78c5 ******/
		%feature("compactdefaultargs") LastDetectedNode;
		%feature("autodoc", "Return
-------
int

Description
-----------
Return last topmost detected node or -1 if undefined (axis picking).
") LastDetectedNode;
		int LastDetectedNode();

		/****** Select3D_SensitivePrimitiveArray::LastDetectedNodeMap ******/
		/****** md5 signature: ee310ecefcf2b0f3d524fbea07a8233d ******/
		%feature("compactdefaultargs") LastDetectedNodeMap;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HPackedMapOfInteger>

Description
-----------
Return the index map of last detected nodes (rectangle selection).
") LastDetectedNodeMap;
		const opencascade::handle<TColStd_HPackedMapOfInteger> & LastDetectedNodeMap();

		/****** Select3D_SensitivePrimitiveArray::Matches ******/
		/****** md5 signature: 9eee725668f2c37b2df03ecf1889ee0f ******/
		%feature("compactdefaultargs") Matches;
		%feature("autodoc", "
Parameters
----------
theMgr: SelectBasics_SelectingVolumeManager
thePickResult: SelectBasics_PickResult

Return
-------
bool

Description
-----------
Checks whether the sensitive entity is overlapped by current selecting volume.
") Matches;
		bool Matches(SelectBasics_SelectingVolumeManager & theMgr, SelectBasics_PickResult & thePickResult);

		/****** Select3D_SensitivePrimitiveArray::NbSubElements ******/
		/****** md5 signature: 4a8c4d129f7e6a31251dd926827a1299 ******/
		%feature("compactdefaultargs") NbSubElements;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the amount of nodes in triangulation.
") NbSubElements;
		int NbSubElements();

		/****** Select3D_SensitivePrimitiveArray::PatchDistance ******/
		/****** md5 signature: 72b34e618288176764f8858ad0077052 ******/
		%feature("compactdefaultargs") PatchDistance;
		%feature("autodoc", "Return
-------
float

Description
-----------
Maximum allowed distance between consequential elements in patch (ShortRealLast() by default). Has no effect on indexed triangulation.
") PatchDistance;
		float PatchDistance();

		/****** Select3D_SensitivePrimitiveArray::PatchSizeMax ******/
		/****** md5 signature: 2998eb8abd753b93f83a3c5f1ea9dd60 ******/
		%feature("compactdefaultargs") PatchSizeMax;
		%feature("autodoc", "Return
-------
int

Description
-----------
Return patch size limit (1 by default).
") PatchSizeMax;
		int PatchSizeMax();

		/****** Select3D_SensitivePrimitiveArray::Set ******/
		/****** md5 signature: 36dcda63f35347b2d54b0b84ff3da57d ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
theOwnerId: SelectMgr_EntityOwner

Return
-------
None

Description
-----------
Sets the owner for all entities in group.
") Set;
		void Set(const opencascade::handle<SelectMgr_EntityOwner> & theOwnerId);

		/****** Select3D_SensitivePrimitiveArray::SetDetectEdges ******/
		/****** md5 signature: a26d1686459c68391358356b73437f76 ******/
		%feature("compactdefaultargs") SetDetectEdges;
		%feature("autodoc", "
Parameters
----------
theToDetect: bool

Return
-------
None

Description
-----------
Setup keeping of the index of last topmost detected edge (axis picking).
") SetDetectEdges;
		void SetDetectEdges(bool theToDetect);

		/****** Select3D_SensitivePrimitiveArray::SetDetectElementMap ******/
		/****** md5 signature: 5ba3c37f3226811d72fffddba246e4f2 ******/
		%feature("compactdefaultargs") SetDetectElementMap;
		%feature("autodoc", "
Parameters
----------
theToDetect: bool

Return
-------
None

Description
-----------
Setup keeping of the index map of last detected elements (rectangle selection).
") SetDetectElementMap;
		void SetDetectElementMap(bool theToDetect);

		/****** Select3D_SensitivePrimitiveArray::SetDetectElements ******/
		/****** md5 signature: 816ecbcd16acb4a0889732e898b9d170 ******/
		%feature("compactdefaultargs") SetDetectElements;
		%feature("autodoc", "
Parameters
----------
theToDetect: bool

Return
-------
None

Description
-----------
Setup keeping of the index of last topmost detected element (axis picking).
") SetDetectElements;
		void SetDetectElements(bool theToDetect);

		/****** Select3D_SensitivePrimitiveArray::SetDetectNodeMap ******/
		/****** md5 signature: b91bfbc9b1e325f51ad3a3f26627bc71 ******/
		%feature("compactdefaultargs") SetDetectNodeMap;
		%feature("autodoc", "
Parameters
----------
theToDetect: bool

Return
-------
None

Description
-----------
Setup keeping of the index map of last detected nodes (rectangle selection).
") SetDetectNodeMap;
		void SetDetectNodeMap(bool theToDetect);

		/****** Select3D_SensitivePrimitiveArray::SetDetectNodes ******/
		/****** md5 signature: 96604965c040f113f7d5b762fe160ae6 ******/
		%feature("compactdefaultargs") SetDetectNodes;
		%feature("autodoc", "
Parameters
----------
theToDetect: bool

Return
-------
None

Description
-----------
Setup keeping of the index of last topmost detected node (for axis picking).
") SetDetectNodes;
		void SetDetectNodes(bool theToDetect);

		/****** Select3D_SensitivePrimitiveArray::SetMinMax ******/
		/****** md5 signature: c614019cf375507cd0ceffcf3651ccf5 ******/
		%feature("compactdefaultargs") SetMinMax;
		%feature("autodoc", "
Parameters
----------
theMinX: double
theMinY: double
theMinZ: double
theMaxX: double
theMaxY: double
theMaxZ: double

Return
-------
None

Description
-----------
Assign new not transformed bounding box.
") SetMinMax;
		void SetMinMax(double theMinX, double theMinY, double theMinZ, double theMaxX, double theMaxY, double theMaxZ);

		/****** Select3D_SensitivePrimitiveArray::SetPatchDistance ******/
		/****** md5 signature: ec5df1d4b9185094136fca34ba233269 ******/
		%feature("compactdefaultargs") SetPatchDistance;
		%feature("autodoc", "
Parameters
----------
thePatchDistMax: float

Return
-------
None

Description
-----------
Assign patch distance limit. Should be set before initialization.
") SetPatchDistance;
		void SetPatchDistance(const float thePatchDistMax);

		/****** Select3D_SensitivePrimitiveArray::SetPatchSizeMax ******/
		/****** md5 signature: 855454d0a81b967acba220925d279cc1 ******/
		%feature("compactdefaultargs") SetPatchSizeMax;
		%feature("autodoc", "
Parameters
----------
thePatchSizeMax: int

Return
-------
None

Description
-----------
Assign patch size limit. Should be set before initialization.
") SetPatchSizeMax;
		void SetPatchSizeMax(const int thePatchSizeMax);

		/****** Select3D_SensitivePrimitiveArray::Size ******/
		/****** md5 signature: 1813690848b6a5332bd4875ba3d8d381 ******/
		%feature("compactdefaultargs") Size;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the length of array of triangles or edges.
") Size;
		int Size();

		/****** Select3D_SensitivePrimitiveArray::Swap ******/
		/****** md5 signature: 1f92b6fb813e2e35c2fd9d0259aaee1e ******/
		%feature("compactdefaultargs") Swap;
		%feature("autodoc", "
Parameters
----------
theIdx1: int
theIdx2: int

Return
-------
None

Description
-----------
Swaps items with indexes theIdx1 and theIdx2 in array.
") Swap;
		void Swap(const int theIdx1, const int theIdx2);

		/****** Select3D_SensitivePrimitiveArray::ToDetectEdges ******/
		/****** md5 signature: 15119fc733d2345d8ed332615da403e1 ******/
		%feature("compactdefaultargs") ToDetectEdges;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return flag to keep index of last topmost detected edge, False by default.
") ToDetectEdges;
		bool ToDetectEdges();

		/****** Select3D_SensitivePrimitiveArray::ToDetectElementMap ******/
		/****** md5 signature: 690a85a7a9272c55e3f0805d524ab445 ******/
		%feature("compactdefaultargs") ToDetectElementMap;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return flag to keep index map of last detected elements, False by default (rectangle selection).
") ToDetectElementMap;
		bool ToDetectElementMap();

		/****** Select3D_SensitivePrimitiveArray::ToDetectElements ******/
		/****** md5 signature: c76df8d2715825d3545e5af6cad85b8d ******/
		%feature("compactdefaultargs") ToDetectElements;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return flag to keep index of last topmost detected element, True by default.
") ToDetectElements;
		bool ToDetectElements();

		/****** Select3D_SensitivePrimitiveArray::ToDetectNodeMap ******/
		/****** md5 signature: 26cd700cf476a82f4fd0104546847e4c ******/
		%feature("compactdefaultargs") ToDetectNodeMap;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return flag to keep index map of last detected nodes, False by default (rectangle selection).
") ToDetectNodeMap;
		bool ToDetectNodeMap();

		/****** Select3D_SensitivePrimitiveArray::ToDetectNodes ******/
		/****** md5 signature: 5ca867c129f9642ea5cae5a7ba6ad432 ******/
		%feature("compactdefaultargs") ToDetectNodes;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return flag to keep index of last topmost detected node, False by default.
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
		/****** Select3D_SensitiveWire::Select3D_SensitiveWire ******/
		/****** md5 signature: 1af2bd91a63a516dda0a07be9c92cb47 ******/
		%feature("compactdefaultargs") Select3D_SensitiveWire;
		%feature("autodoc", "
Parameters
----------
theOwnerId: SelectMgr_EntityOwner

Return
-------
None

Description
-----------
Constructs a sensitive wire object defined by the owner theOwnerId.
") Select3D_SensitiveWire;
		 Select3D_SensitiveWire(const opencascade::handle<SelectMgr_EntityOwner> & theOwnerId);

		/****** Select3D_SensitiveWire::Add ******/
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
Adds the sensitive entity theSensitive to this framework.
") Add;
		void Add(const opencascade::handle<Select3D_SensitiveEntity> & theSensitive);

		/****** Select3D_SensitiveWire::BoundingBox ******/
		/****** md5 signature: 633863f7086aa730ff696b4814fc0aea ******/
		%feature("compactdefaultargs") BoundingBox;
		%feature("autodoc", "Return
-------
Select3D_BndBox3d

Description
-----------
Returns bounding box of the wire. If location transformation is set, it will be applied.
") BoundingBox;
		Select3D_BndBox3d BoundingBox();

		/****** Select3D_SensitiveWire::Box ******/
		/****** md5 signature: a2ce38217e8c3c3e41f58a85973ff262 ******/
		%feature("compactdefaultargs") Box;
		%feature("autodoc", "
Parameters
----------
theIdx: int

Return
-------
Select3D_BndBox3d

Description
-----------
Returns bounding box of sensitive entity with index theIdx.
") Box;
		Select3D_BndBox3d Box(const int theIdx);

		/****** Select3D_SensitiveWire::Center ******/
		/****** md5 signature: d631215324043d52c3ee2e21e8a95af0 ******/
		%feature("compactdefaultargs") Center;
		%feature("autodoc", "
Parameters
----------
theIdx: int
theAxis: int

Return
-------
double

Description
-----------
Returns geometry center of sensitive entity index theIdx in the vector along the given axis theAxis.
") Center;
		double Center(const int theIdx, const int theAxis);

		/****** Select3D_SensitiveWire::CenterOfGeometry ******/
		/****** md5 signature: 405abf8a0e67491197d4d1f3675f4381 ******/
		%feature("compactdefaultargs") CenterOfGeometry;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Returns center of the wire. If location transformation is set, it will be applied.
") CenterOfGeometry;
		gp_Pnt CenterOfGeometry();


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
		/****** Select3D_SensitiveWire::GetConnected ******/
		/****** md5 signature: a3c8e77274f838c789102a492a808dca ******/
		%feature("compactdefaultargs") GetConnected;
		%feature("autodoc", "Return
-------
opencascade::handle<Select3D_SensitiveEntity>

Description
-----------
No available documentation.
") GetConnected;
		opencascade::handle<Select3D_SensitiveEntity> GetConnected();

		/****** Select3D_SensitiveWire::GetEdges ******/
		/****** md5 signature: 2ca7f36f885fcca948e7c0b7f4fcbdb0 ******/
		%feature("compactdefaultargs") GetEdges;
		%feature("autodoc", "Return
-------
NCollection_DynamicArray<opencascade::handle<Select3D_SensitiveEntity>>

Description
-----------
returns the sensitive edges stored in this wire.
") GetEdges;
		const NCollection_DynamicArray<opencascade::handle<Select3D_SensitiveEntity>> & GetEdges();

		/****** Select3D_SensitiveWire::GetLastDetected ******/
		/****** md5 signature: 618560e22f06fc3b5edfe11a01332b7b ******/
		%feature("compactdefaultargs") GetLastDetected;
		%feature("autodoc", "Return
-------
opencascade::handle<Select3D_SensitiveEntity>

Description
-----------
No available documentation.
") GetLastDetected;
		opencascade::handle<Select3D_SensitiveEntity> GetLastDetected();

		/****** Select3D_SensitiveWire::NbSubElements ******/
		/****** md5 signature: 0cbf60f70214c5391f27cbd18a04e594 ******/
		%feature("compactdefaultargs") NbSubElements;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the amount of sub-entities.
") NbSubElements;
		int NbSubElements();

		/****** Select3D_SensitiveWire::Set ******/
		/****** md5 signature: 36dcda63f35347b2d54b0b84ff3da57d ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
theOwnerId: SelectMgr_EntityOwner

Return
-------
None

Description
-----------
Sets the owner for all entities in wire.
") Set;
		void Set(const opencascade::handle<SelectMgr_EntityOwner> & theOwnerId);

		/****** Select3D_SensitiveWire::Size ******/
		/****** md5 signature: 1813690848b6a5332bd4875ba3d8d381 ******/
		%feature("compactdefaultargs") Size;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the length of vector of sensitive entities.
") Size;
		int Size();

		/****** Select3D_SensitiveWire::Swap ******/
		/****** md5 signature: 1f92b6fb813e2e35c2fd9d0259aaee1e ******/
		%feature("compactdefaultargs") Swap;
		%feature("autodoc", "
Parameters
----------
theIdx1: int
theIdx2: int

Return
-------
None

Description
-----------
Swaps items with indexes theIdx1 and theIdx2 in the vector.
") Swap;
		void Swap(const int theIdx1, const int theIdx2);

};


%make_alias(Select3D_SensitiveWire)

%extend Select3D_SensitiveWire {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class Select3D_SensitiveCurve *
********************************/
class Select3D_SensitiveCurve : public Select3D_SensitivePoly {
	public:
		/****** Select3D_SensitiveCurve::Select3D_SensitiveCurve ******/
		/****** md5 signature: 2c00b21b9a8c356353cafea4da41ddc2 ******/
		%feature("compactdefaultargs") Select3D_SensitiveCurve;
		%feature("autodoc", "
Parameters
----------
theOwnerId: SelectMgr_EntityOwner
theCurve: Geom_Curve
theNbPnts: int (optional, default to 17)

Return
-------
None

Description
-----------
Constructs a sensitive curve object defined by the owner theOwnerId, the curve theCurve, and the maximum number of points on the curve: theNbPnts.
") Select3D_SensitiveCurve;
		 Select3D_SensitiveCurve(const opencascade::handle<SelectMgr_EntityOwner> & theOwnerId, const opencascade::handle<Geom_Curve> & theCurve, const int theNbPnts = 17);

		/****** Select3D_SensitiveCurve::Select3D_SensitiveCurve ******/
		/****** md5 signature: 48e88afc43920c64f4fdc4d29713bfc1 ******/
		%feature("compactdefaultargs") Select3D_SensitiveCurve;
		%feature("autodoc", "
Parameters
----------
theOwnerId: SelectMgr_EntityOwner
thePoints: TColgp_HArray1OfPnt

Return
-------
None

Description
-----------
Constructs a sensitive curve object defined by the owner theOwnerId and the set of points ThePoints.
") Select3D_SensitiveCurve;
		 Select3D_SensitiveCurve(const opencascade::handle<SelectMgr_EntityOwner> & theOwnerId, const opencascade::handle<TColgp_HArray1OfPnt> & thePoints);

		/****** Select3D_SensitiveCurve::Select3D_SensitiveCurve ******/
		/****** md5 signature: aee4cfc070ae65c2e529f9fa44789dee ******/
		%feature("compactdefaultargs") Select3D_SensitiveCurve;
		%feature("autodoc", "
Parameters
----------
theOwnerId: SelectMgr_EntityOwner
thePoints: TColgp_Array1OfPnt

Return
-------
None

Description
-----------
Creation of Sensitive Curve from Points. Warning: This Method should disappear in the next version...
") Select3D_SensitiveCurve;
		 Select3D_SensitiveCurve(const opencascade::handle<SelectMgr_EntityOwner> & theOwnerId, const TColgp_Array1OfPnt & thePoints);

		/****** Select3D_SensitiveCurve::GetConnected ******/
		/****** md5 signature: a3c8e77274f838c789102a492a808dca ******/
		%feature("compactdefaultargs") GetConnected;
		%feature("autodoc", "Return
-------
opencascade::handle<Select3D_SensitiveEntity>

Description
-----------
Returns the copy of this.
") GetConnected;
		opencascade::handle<Select3D_SensitiveEntity> GetConnected();

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

@classnotwrapped
class Select3D_SensitiveCircle:
	pass

}
/* end python proxy for excluded classes */
/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
/* class aliases */
%pythoncode {
}
