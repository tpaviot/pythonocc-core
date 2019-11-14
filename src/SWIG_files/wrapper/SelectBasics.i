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

/*
This file was automatically generated using the pythonocc_generator, see
https://github.com/tpaviot/pythonocc-generator.

This file is platform independant, but was generated under the following
conditions:

- operating system : debian Linux 4.15.0-66-generic
- occt version targeted : 7.4.0
*/

%define SELECTBASICSDOCSTRING
"SelectBasics module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_SelectBasics.html"
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
/* public enums */
/* end public enums declaration */

/* handles */
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

%rename(selectbasics) SelectBasics;
%nodefaultctor SelectBasics;
class SelectBasics {
	public:
		%feature("compactdefaultargs") MaxOwnerPriority;
		%feature("autodoc", "	* Structure to provide all-in-one result of selection of sensitive for 'Matches' method of Select3D_SensitiveEntity.

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
%nodefaultctor SelectBasics_PickResult;
class SelectBasics_PickResult {
	public:
		%feature("compactdefaultargs") Depth;
		%feature("autodoc", "	* Return depth along picking ray.

	:rtype: float
") Depth;
		Standard_Real Depth ();
		%feature("compactdefaultargs") DistToGeomCenter;
		%feature("autodoc", "	* Return distance to geometry center (auxiliary value for comparing results).

	:rtype: float
") DistToGeomCenter;
		Standard_Real DistToGeomCenter ();
		%feature("compactdefaultargs") HasPickedPoint;
		%feature("autodoc", "	* Return True if Picked Point lying on detected entity was set.

	:rtype: bool
") HasPickedPoint;
		Standard_Boolean HasPickedPoint ();
		%feature("compactdefaultargs") Invalidate;
		%feature("autodoc", "	* Reset depth value.

	:rtype: None
") Invalidate;
		void Invalidate ();
		%feature("compactdefaultargs") IsValid;
		%feature("autodoc", "	* Return True if result was been defined.

	:rtype: bool
") IsValid;
		Standard_Boolean IsValid ();
		%feature("compactdefaultargs") Min;
		%feature("autodoc", "	* Return closest result between two Pick Results according to Depth value.

	:param thePickResult1:
	:type thePickResult1: SelectBasics_PickResult &
	:param thePickResult2:
	:type thePickResult2: SelectBasics_PickResult &
	:rtype: SelectBasics_PickResult
") Min;
		static const SelectBasics_PickResult & Min (const SelectBasics_PickResult & thePickResult1,const SelectBasics_PickResult & thePickResult2);
		%feature("compactdefaultargs") PickedPoint;
		%feature("autodoc", "	* Return picked point lying on detected entity. WARNING! Point is defined in local coordinate system and should be translated into World System before usage!

	:rtype: gp_Pnt
") PickedPoint;
		const gp_Pnt  PickedPoint ();
		%feature("compactdefaultargs") SelectBasics_PickResult;
		%feature("autodoc", "	* Empty constructor defining an invalid result.

	:rtype: None
") SelectBasics_PickResult;
		 SelectBasics_PickResult ();
		%feature("compactdefaultargs") SelectBasics_PickResult;
		%feature("autodoc", "	* Constructor with initialization.

	:param theDepth:
	:type theDepth: float
	:param theDistToCenter:
	:type theDistToCenter: float
	:param theObjPickedPnt:
	:type theObjPickedPnt: gp_Pnt
	:rtype: None
") SelectBasics_PickResult;
		 SelectBasics_PickResult (Standard_Real theDepth,Standard_Real theDistToCenter,const gp_Pnt & theObjPickedPnt);
		%feature("compactdefaultargs") SetDepth;
		%feature("autodoc", "	* Set depth along picking ray.

	:param theDepth:
	:type theDepth: float
	:rtype: None
") SetDepth;
		void SetDepth (Standard_Real theDepth);
		%feature("compactdefaultargs") SetDistToGeomCenter;
		%feature("autodoc", "	* Set distance to geometry center.

	:param theDistToCenter:
	:type theDistToCenter: float
	:rtype: None
") SetDistToGeomCenter;
		void SetDistToGeomCenter (Standard_Real theDistToCenter);
		%feature("compactdefaultargs") SetPickedPoint;
		%feature("autodoc", "	* Set picked point.

	:param theObjPickedPnt:
	:type theObjPickedPnt: gp_Pnt
	:rtype: None
") SetPickedPoint;
		void SetPickedPoint (const gp_Pnt & theObjPickedPnt);
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
		%feature("compactdefaultargs") GetMousePosition;
		%feature("autodoc", "	* Return mouse coordinates for Point selection mode.

	:rtype: gp_Pnt2d
") GetMousePosition;
		gp_Pnt2d GetMousePosition ();
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
	:param thePickResult:
	:type thePickResult: SelectBasics_PickResult &
	:rtype: bool
") Overlaps;
		Standard_Boolean Overlaps (const NCollection_Vec3<Standard_Real> & theBoxMin,const NCollection_Vec3<Standard_Real> & theBoxMax,SelectBasics_PickResult & thePickResult);
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
	:param thePickResult:
	:type thePickResult: SelectBasics_PickResult &
	:rtype: bool
") Overlaps;
		Standard_Boolean Overlaps (const gp_Pnt & thePnt,SelectBasics_PickResult & thePickResult);
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
	:type theArrayOfPts: opencascade::handle<TColgp_HArray1OfPnt>
	:param theSensType:
	:type theSensType: int
	:param thePickResult:
	:type thePickResult: SelectBasics_PickResult &
	:rtype: bool
") Overlaps;
		Standard_Boolean Overlaps (const opencascade::handle<TColgp_HArray1OfPnt> & theArrayOfPts,Standard_Integer theSensType,SelectBasics_PickResult & thePickResult);
		%feature("compactdefaultargs") Overlaps;
		%feature("autodoc", "	* Returns true if selecting volume is overlapped by planar convex polygon, which points are stored in theArrayOfPts, taking into account sensitivity type theSensType

	:param theArrayOfPts:
	:type theArrayOfPts: TColgp_Array1OfPnt
	:param theSensType:
	:type theSensType: int
	:param thePickResult:
	:type thePickResult: SelectBasics_PickResult &
	:rtype: bool
") Overlaps;
		Standard_Boolean Overlaps (const TColgp_Array1OfPnt & theArrayOfPts,Standard_Integer theSensType,SelectBasics_PickResult & thePickResult);
		%feature("compactdefaultargs") Overlaps;
		%feature("autodoc", "	* Returns true if selecting volume is overlapped by line segment with start point at thePt1 and end point at thePt2

	:param thePt1:
	:type thePt1: gp_Pnt
	:param thePt2:
	:type thePt2: gp_Pnt
	:param thePickResult:
	:type thePickResult: SelectBasics_PickResult &
	:rtype: bool
") Overlaps;
		Standard_Boolean Overlaps (const gp_Pnt & thePt1,const gp_Pnt & thePt2,SelectBasics_PickResult & thePickResult);
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
	:param thePickResult:
	:type thePickResult: SelectBasics_PickResult &
	:rtype: bool
") Overlaps;
		Standard_Boolean Overlaps (const gp_Pnt & thePt1,const gp_Pnt & thePt2,const gp_Pnt & thePt3,Standard_Integer theSensType,SelectBasics_PickResult & thePickResult);
};


%extend SelectBasics_SelectingVolumeManager {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
/* harray1 class */
/* harray2 class */
/* harray2 class */
