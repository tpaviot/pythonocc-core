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
		%feature("compactdefaultargs") MaxOwnerPriority;
		%feature("autodoc", "Structure to provide all-in-one result of selection of sensitive for 'matches' method of select3d_sensitiveentity.

Returns
-------
int
") MaxOwnerPriority;
		static Standard_Integer MaxOwnerPriority();

		/****************** MinOwnerPriority ******************/
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
		%feature("compactdefaultargs") SelectBasics_PickResult;
		%feature("autodoc", "Empty constructor defining an invalid result.

Returns
-------
None
") SelectBasics_PickResult;
		 SelectBasics_PickResult();

		/****************** SelectBasics_PickResult ******************/
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
		%feature("compactdefaultargs") Depth;
		%feature("autodoc", "Return depth along picking ray.

Returns
-------
float
") Depth;
		Standard_Real Depth();

		/****************** DistToGeomCenter ******************/
		%feature("compactdefaultargs") DistToGeomCenter;
		%feature("autodoc", "Return distance to geometry center (auxiliary value for comparing results).

Returns
-------
float
") DistToGeomCenter;
		Standard_Real DistToGeomCenter();

		/****************** HasPickedPoint ******************/
		%feature("compactdefaultargs") HasPickedPoint;
		%feature("autodoc", "Return true if picked point lying on detected entity was set.

Returns
-------
bool
") HasPickedPoint;
		Standard_Boolean HasPickedPoint();

		/****************** Invalidate ******************/
		%feature("compactdefaultargs") Invalidate;
		%feature("autodoc", "Reset depth value.

Returns
-------
None
") Invalidate;
		void Invalidate();

		/****************** IsValid ******************/
		%feature("compactdefaultargs") IsValid;
		%feature("autodoc", "Return true if result was been defined.

Returns
-------
bool
") IsValid;
		Standard_Boolean IsValid();

		/****************** Min ******************/
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
		%feature("compactdefaultargs") PickedPoint;
		%feature("autodoc", "Return picked point lying on detected entity. warning! point is defined in local coordinate system and should be translated into world system before usage!.

Returns
-------
gp_Pnt
") PickedPoint;
		const gp_Pnt PickedPoint();

		/****************** SetDepth ******************/
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

class SelectionType:
	Point = 0
	Box = 1
	Polyline = 2
	Unknown = 3
};
/* end python proxy for enums */

		/****************** DetectedPoint ******************/
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
		%feature("compactdefaultargs") GetActiveSelectionType;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") GetActiveSelectionType;
		virtual Standard_Integer GetActiveSelectionType();

		/****************** GetFarPickedPnt ******************/
		%feature("compactdefaultargs") GetFarPickedPnt;
		%feature("autodoc", "Valid only for point and rectangular selection. returns projection of 2d mouse picked point or projection of center of 2d rectangle (for point and rectangular selection correspondingly) onto far view frustum plane.

Returns
-------
gp_Pnt
") GetFarPickedPnt;
		virtual gp_Pnt GetFarPickedPnt();

		/****************** GetMousePosition ******************/
		%feature("compactdefaultargs") GetMousePosition;
		%feature("autodoc", "Return mouse coordinates for point selection mode.

Returns
-------
gp_Pnt2d
") GetMousePosition;
		virtual gp_Pnt2d GetMousePosition();

		/****************** GetNearPickedPnt ******************/
		%feature("compactdefaultargs") GetNearPickedPnt;
		%feature("autodoc", "Valid only for point and rectangular selection. returns projection of 2d mouse picked point or projection of center of 2d rectangle (for point and rectangular selection correspondingly) onto near view frustum plane.

Returns
-------
gp_Pnt
") GetNearPickedPnt;
		virtual gp_Pnt GetNearPickedPnt();

		/****************** GetPlanes ******************/
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
		%feature("compactdefaultargs") IsOverlapAllowed;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsOverlapAllowed;
		virtual Standard_Boolean IsOverlapAllowed();

		/****************** Overlaps ******************/
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
