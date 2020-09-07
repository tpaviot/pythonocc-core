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
%define SELECTBASICSDOCSTRING
"SelectBasics module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_selectbasics.html"
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
%include ../common/Operators.i
%include ../common/OccHandle.i


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

/* python proy classes for enums */
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
		/****************** MaxOwnerPriority ******************/
		/**** md5 signature: 87c4c8fbae09e9b90b74aa582df2924a ****/
		%feature("compactdefaultargs") MaxOwnerPriority;
		%feature("autodoc", "Structure to provide all-in-one result of selection of sensitive for 'matches' method of select3d_sensitiveentity.

Returns
-------
int
") MaxOwnerPriority;
		static Standard_Integer MaxOwnerPriority();

		/****************** MinOwnerPriority ******************/
		/**** md5 signature: d127234fdcddfbfba2493b87cb50a82b ****/
		%feature("compactdefaultargs") MinOwnerPriority;
		%feature("autodoc", "No available documentation.

Returns
-------
int
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
		/****************** SelectBasics_PickResult ******************/
		/**** md5 signature: 70c24972c2e1acb414eec1dcb85de08a ****/
		%feature("compactdefaultargs") SelectBasics_PickResult;
		%feature("autodoc", "Empty constructor defining an invalid result.

Returns
-------
None
") SelectBasics_PickResult;
		 SelectBasics_PickResult();

		/****************** SelectBasics_PickResult ******************/
		/**** md5 signature: efe0549d557fe14d14d3bce83544927e ****/
		%feature("compactdefaultargs") SelectBasics_PickResult;
		%feature("autodoc", "Constructor with initialization.

Parameters
----------
theDepth: float
theDistToCenter: float
theObjPickedPnt: gp_Pnt

Returns
-------
None
") SelectBasics_PickResult;
		 SelectBasics_PickResult(Standard_Real theDepth, Standard_Real theDistToCenter, const gp_Pnt & theObjPickedPnt);

		/****************** Depth ******************/
		/**** md5 signature: 25ee6373f55a52708b56125539b46226 ****/
		%feature("compactdefaultargs") Depth;
		%feature("autodoc", "Return depth along picking ray.

Returns
-------
float
") Depth;
		Standard_Real Depth();

		/****************** DistToGeomCenter ******************/
		/**** md5 signature: 07d82d88f16b57d130cf7123362c8d01 ****/
		%feature("compactdefaultargs") DistToGeomCenter;
		%feature("autodoc", "Return distance to geometry center (auxiliary value for comparing results).

Returns
-------
float
") DistToGeomCenter;
		Standard_Real DistToGeomCenter();

		/****************** HasPickedPoint ******************/
		/**** md5 signature: 621f45af5c1eb7c5e15872d0374f6b99 ****/
		%feature("compactdefaultargs") HasPickedPoint;
		%feature("autodoc", "Return true if picked point lying on detected entity was set.

Returns
-------
bool
") HasPickedPoint;
		Standard_Boolean HasPickedPoint();

		/****************** Invalidate ******************/
		/**** md5 signature: 704a551b2c709fd4c2d751a8cf3ee8ff ****/
		%feature("compactdefaultargs") Invalidate;
		%feature("autodoc", "Reset depth value.

Returns
-------
None
") Invalidate;
		void Invalidate();

		/****************** IsValid ******************/
		/**** md5 signature: 7d115ff85bb657b98ab8790006673845 ****/
		%feature("compactdefaultargs") IsValid;
		%feature("autodoc", "Return true if result was been defined.

Returns
-------
bool
") IsValid;
		Standard_Boolean IsValid();

		/****************** Min ******************/
		/**** md5 signature: 6422e8d9851b1c76234f967288b153a4 ****/
		%feature("compactdefaultargs") Min;
		%feature("autodoc", "Return closest result between two pick results according to depth value.

Parameters
----------
thePickResult1: SelectBasics_PickResult
thePickResult2: SelectBasics_PickResult

Returns
-------
SelectBasics_PickResult
") Min;
		static const SelectBasics_PickResult & Min(const SelectBasics_PickResult & thePickResult1, const SelectBasics_PickResult & thePickResult2);

		/****************** PickedPoint ******************/
		/**** md5 signature: e5411db2d7bfcda96402fde38f143185 ****/
		%feature("compactdefaultargs") PickedPoint;
		%feature("autodoc", "Return picked point lying on detected entity. warning! point is defined in local coordinate system and should be translated into world system before usage!.

Returns
-------
gp_Pnt
") PickedPoint;
		const gp_Pnt PickedPoint();

		/****************** SetDepth ******************/
		/**** md5 signature: 20b371790974ee9cc48c83264842232b ****/
		%feature("compactdefaultargs") SetDepth;
		%feature("autodoc", "Set depth along picking ray.

Parameters
----------
theDepth: float

Returns
-------
None
") SetDepth;
		void SetDepth(Standard_Real theDepth);

		/****************** SetDistToGeomCenter ******************/
		/**** md5 signature: 83a88150dabab87b04c89a6695a6f142 ****/
		%feature("compactdefaultargs") SetDistToGeomCenter;
		%feature("autodoc", "Set distance to geometry center.

Parameters
----------
theDistToCenter: float

Returns
-------
None
") SetDistToGeomCenter;
		void SetDistToGeomCenter(Standard_Real theDistToCenter);

		/****************** SetPickedPoint ******************/
		/**** md5 signature: a0d31924196d7102372ca1122f6e29a4 ****/
		%feature("compactdefaultargs") SetPickedPoint;
		%feature("autodoc", "Set picked point.

Parameters
----------
theObjPickedPnt: gp_Pnt

Returns
-------
None
") SetPickedPoint;
		void SetPickedPoint(const gp_Pnt & theObjPickedPnt);

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
/* public enums */
enum SelectionType {
	Point = 0,
	Box = 1,
	Polyline = 2,
	Unknown = 3,
};

/* end public enums declaration */

/* python proy classes for enums */
%pythoncode {

class SelectionType(IntEnum):
	Point = 0
	Box = 1
	Polyline = 2
	Unknown = 3
Point = SelectionType.Point
Box = SelectionType.Box
Polyline = SelectionType.Polyline
Unknown = SelectionType.Unknown
};
/* end python proxy for enums */

		/****************** DetectedPoint ******************/
		/**** md5 signature: 1cc054e8948b7dd95fff0b23ad64230e ****/
		%feature("compactdefaultargs") DetectedPoint;
		%feature("autodoc", "No available documentation.

Parameters
----------
theDepth: float

Returns
-------
gp_Pnt
") DetectedPoint;
		virtual gp_Pnt DetectedPoint(const Standard_Real theDepth);

		/****************** DistToGeometryCenter ******************/
		/**** md5 signature: 3ed12881a75ce1f126dcb222173a8123 ****/
		%feature("compactdefaultargs") DistToGeometryCenter;
		%feature("autodoc", "Calculates distance from 3d projection of user-defined selection point to the given point thecog.

Parameters
----------
theCOG: gp_Pnt

Returns
-------
float
") DistToGeometryCenter;
		virtual Standard_Real DistToGeometryCenter(const gp_Pnt & theCOG);

		/****************** GetActiveSelectionType ******************/
		/**** md5 signature: 56d78b21d70ce91662f965e54361b877 ****/
		%feature("compactdefaultargs") GetActiveSelectionType;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") GetActiveSelectionType;
		virtual Standard_Integer GetActiveSelectionType();

		/****************** GetFarPickedPnt ******************/
		/**** md5 signature: 98748d26ff588dc3070493ca523b8947 ****/
		%feature("compactdefaultargs") GetFarPickedPnt;
		%feature("autodoc", "Valid only for point and rectangular selection. returns projection of 2d mouse picked point or projection of center of 2d rectangle (for point and rectangular selection correspondingly) onto far view frustum plane.

Returns
-------
gp_Pnt
") GetFarPickedPnt;
		virtual gp_Pnt GetFarPickedPnt();

		/****************** GetMousePosition ******************/
		/**** md5 signature: dc663ddc1edfd7aac3a43a6122139863 ****/
		%feature("compactdefaultargs") GetMousePosition;
		%feature("autodoc", "Return mouse coordinates for point selection mode.

Returns
-------
gp_Pnt2d
") GetMousePosition;
		virtual gp_Pnt2d GetMousePosition();

		/****************** GetNearPickedPnt ******************/
		/**** md5 signature: 40f25cf5811df8ab5573eff7cb14f3a1 ****/
		%feature("compactdefaultargs") GetNearPickedPnt;
		%feature("autodoc", "Valid only for point and rectangular selection. returns projection of 2d mouse picked point or projection of center of 2d rectangle (for point and rectangular selection correspondingly) onto near view frustum plane.

Returns
-------
gp_Pnt
") GetNearPickedPnt;
		virtual gp_Pnt GetNearPickedPnt();

		/****************** GetPlanes ******************/
		/**** md5 signature: d44b074df2b940111bb3147c05251a88 ****/
		%feature("compactdefaultargs") GetPlanes;
		%feature("autodoc", "Stores plane equation coefficients (in the following form: ax + by + cz + d = 0) to the given vector.

Parameters
----------
thePlaneEquations: NCollection_Vector<NCollection_Vec4<float> >

Returns
-------
None
") GetPlanes;
		virtual void GetPlanes(NCollection_Vector<NCollection_Vec4<Standard_Real> > & thePlaneEquations);

		/****************** IsOverlapAllowed ******************/
		/**** md5 signature: f2e1ce20431c82909b70df801eabd2d8 ****/
		%feature("compactdefaultargs") IsOverlapAllowed;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsOverlapAllowed;
		virtual Standard_Boolean IsOverlapAllowed();

		/****************** Overlaps ******************/
		/**** md5 signature: 72b3b9147f4c25df38e77cb007eab045 ****/
		%feature("compactdefaultargs") Overlaps;
		%feature("autodoc", "Returns true if selecting volume is overlapped by box thebox.

Parameters
----------
theBoxMin: NCollection_Vec3<float>
theBoxMax: NCollection_Vec3<float>
thePickResult: SelectBasics_PickResult

Returns
-------
bool
") Overlaps;
		virtual Standard_Boolean Overlaps(const NCollection_Vec3<Standard_Real> & theBoxMin, const NCollection_Vec3<Standard_Real> & theBoxMax, SelectBasics_PickResult & thePickResult);

		/****************** Overlaps ******************/
		/**** md5 signature: c4d2989a14a3b6b7b945864761359688 ****/
		%feature("compactdefaultargs") Overlaps;
		%feature("autodoc", "Returns true if selecting volume is overlapped by axis-aligned bounding box with minimum corner at point theminpt and maximum at point themaxpt.

Parameters
----------
theBoxMin: NCollection_Vec3<float>
theBoxMax: NCollection_Vec3<float>
theInside: bool *,optional
	default value is NULL

Returns
-------
bool
") Overlaps;
		virtual Standard_Boolean Overlaps(const NCollection_Vec3<Standard_Real> & theBoxMin, const NCollection_Vec3<Standard_Real> & theBoxMax, Standard_Boolean * theInside = NULL);

		/****************** Overlaps ******************/
		/**** md5 signature: 3947ed629721749a6624af1b76a64e6b ****/
		%feature("compactdefaultargs") Overlaps;
		%feature("autodoc", "Returns true if selecting volume is overlapped by point thepnt.

Parameters
----------
thePnt: gp_Pnt
thePickResult: SelectBasics_PickResult

Returns
-------
bool
") Overlaps;
		virtual Standard_Boolean Overlaps(const gp_Pnt & thePnt, SelectBasics_PickResult & thePickResult);

		/****************** Overlaps ******************/
		/**** md5 signature: 19dbdf40957c9f9c60452134ba0cc798 ****/
		%feature("compactdefaultargs") Overlaps;
		%feature("autodoc", "Returns true if selecting volume is overlapped by point thepnt. does not perform depth calculation, so this method is defined as helper function for inclusion test.

Parameters
----------
thePnt: gp_Pnt

Returns
-------
bool
") Overlaps;
		virtual Standard_Boolean Overlaps(const gp_Pnt & thePnt);

		/****************** Overlaps ******************/
		/**** md5 signature: 7b7a6a3461966a96a25e6b01b456944f ****/
		%feature("compactdefaultargs") Overlaps;
		%feature("autodoc", "Returns true if selecting volume is overlapped by planar convex polygon, which points are stored in thearrayofpts, taking into account sensitivity type thesenstype.

Parameters
----------
theArrayOfPts: TColgp_HArray1OfPnt
theSensType: int
thePickResult: SelectBasics_PickResult

Returns
-------
bool
") Overlaps;
		virtual Standard_Boolean Overlaps(const opencascade::handle<TColgp_HArray1OfPnt> & theArrayOfPts, Standard_Integer theSensType, SelectBasics_PickResult & thePickResult);

		/****************** Overlaps ******************/
		/**** md5 signature: 7942e5ce29609ec05b0fae7fdf359421 ****/
		%feature("compactdefaultargs") Overlaps;
		%feature("autodoc", "Returns true if selecting volume is overlapped by planar convex polygon, which points are stored in thearrayofpts, taking into account sensitivity type thesenstype.

Parameters
----------
theArrayOfPts: TColgp_Array1OfPnt
theSensType: int
thePickResult: SelectBasics_PickResult

Returns
-------
bool
") Overlaps;
		virtual Standard_Boolean Overlaps(const TColgp_Array1OfPnt & theArrayOfPts, Standard_Integer theSensType, SelectBasics_PickResult & thePickResult);

		/****************** Overlaps ******************/
		/**** md5 signature: 468be8c1f2bde407985bdc5b908467e6 ****/
		%feature("compactdefaultargs") Overlaps;
		%feature("autodoc", "Returns true if selecting volume is overlapped by line segment with start point at thept1 and end point at thept2.

Parameters
----------
thePt1: gp_Pnt
thePt2: gp_Pnt
thePickResult: SelectBasics_PickResult

Returns
-------
bool
") Overlaps;
		virtual Standard_Boolean Overlaps(const gp_Pnt & thePt1, const gp_Pnt & thePt2, SelectBasics_PickResult & thePickResult);

		/****************** Overlaps ******************/
		/**** md5 signature: 6c2231a8cdc0689ab90add91a851ffb8 ****/
		%feature("compactdefaultargs") Overlaps;
		%feature("autodoc", "Returns true if selecting volume is overlapped by triangle with vertices thept1, thept2 and thept3, taking into account sensitivity type thesenstype.

Parameters
----------
thePt1: gp_Pnt
thePt2: gp_Pnt
thePt3: gp_Pnt
theSensType: int
thePickResult: SelectBasics_PickResult

Returns
-------
bool
") Overlaps;
		virtual Standard_Boolean Overlaps(const gp_Pnt & thePt1, const gp_Pnt & thePt2, const gp_Pnt & thePt3, Standard_Integer theSensType, SelectBasics_PickResult & thePickResult);

};


%extend SelectBasics_SelectingVolumeManager {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
