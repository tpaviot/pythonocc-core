/*
Copyright 2008-2024 Thomas Paviot (tpaviot@gmail.com)

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
%define INTCURVESFACEDOCSTRING
"IntCurvesFace module, see official documentation at
https://dev.opencascade.org/doc/occt-7.8.0/refman/html/package_intcurvesface.html"
%enddef
%module (package="OCC.Core", docstring=INTCURVESFACEDOCSTRING) IntCurvesFace


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
#include<IntCurvesFace_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TopoDS_module.hxx>
#include<Bnd_module.hxx>
#include<gp_module.hxx>
#include<TopAbs_module.hxx>
#include<Adaptor3d_module.hxx>
#include<GeomAbs_module.hxx>
#include<IntCurveSurface_module.hxx>
#include<TopLoc_module.hxx>
#include<IntSurf_module.hxx>
#include<Geom_module.hxx>
#include<Geom2d_module.hxx>
#include<Adaptor2d_module.hxx>
#include<Message_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import TopoDS.i
%import Bnd.i
%import gp.i
%import TopAbs.i
%import Adaptor3d.i
%import GeomAbs.i
%import IntCurveSurface.i

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
%wrap_handle(IntCurvesFace_Intersector)
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/**********************************
* class IntCurvesFace_Intersector *
**********************************/
class IntCurvesFace_Intersector : public Standard_Transient {
	public:
		/****** IntCurvesFace_Intersector::IntCurvesFace_Intersector ******/
		/****** md5 signature: a52cfef3564a89d4318791e0ef2ba78a ******/
		%feature("compactdefaultargs") IntCurvesFace_Intersector;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face
aTol: float
aRestr: bool (optional, default to Standard_True)
UseBToler: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Load a Face. //! The Tolerance <Tol> is used to determine if the first point of the segment is near the face. In that case, the parameter of the intersection point on the line can be a negative value (greater than -Tol). If aRestr = true UV bounding box of face is used to restrict it's underlined surface, otherwise surface is not restricted. If UseBToler = false then the 2d-point of intersection is classified with null-tolerance (relative to face); otherwise it's using maximum between input tolerance(aTol) and tolerances of face bounds (edges).
") IntCurvesFace_Intersector;
		 IntCurvesFace_Intersector(const TopoDS_Face & F, const Standard_Real aTol, const Standard_Boolean aRestr = Standard_True, const Standard_Boolean UseBToler = Standard_True);

		/****** IntCurvesFace_Intersector::Bounding ******/
		/****** md5 signature: bb711be79be8d737064764272723cdc5 ******/
		%feature("compactdefaultargs") Bounding;
		%feature("autodoc", "Return
-------
Bnd_Box

Description
-----------
No available documentation.
") Bounding;
		Bnd_Box Bounding();

		/****** IntCurvesFace_Intersector::ClassifyUVPoint ******/
		/****** md5 signature: 6119eba3f802167f8feeb53cf4c276dd ******/
		%feature("compactdefaultargs") ClassifyUVPoint;
		%feature("autodoc", "
Parameters
----------
Puv: gp_Pnt2d

Return
-------
TopAbs_State

Description
-----------
No available documentation.
") ClassifyUVPoint;
		TopAbs_State ClassifyUVPoint(const gp_Pnt2d & Puv);

		/****** IntCurvesFace_Intersector::Face ******/
		/****** md5 signature: 91e216ebeb76e55c73eb9e179241a6ff ******/
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "Return
-------
TopoDS_Face

Description
-----------
Returns the significant face used to determine the intersection.
") Face;
		const TopoDS_Face Face();

		/****** IntCurvesFace_Intersector::GetUseBoundToler ******/
		/****** md5 signature: a5f9a43c7d4370e89e000b44feefda7a ******/
		%feature("compactdefaultargs") GetUseBoundToler;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the boundary tolerance flag.
") GetUseBoundToler;
		Standard_Boolean GetUseBoundToler();

		/****** IntCurvesFace_Intersector::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
True is returned when the intersection have been computed.
") IsDone;
		Standard_Boolean IsDone();

		/****** IntCurvesFace_Intersector::IsParallel ******/
		/****** md5 signature: 47a312fd58e74bf5bb8a9bb6f0484dfb ******/
		%feature("compactdefaultargs") IsParallel;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if curve is parallel or belongs face surface This case is recognized only for some pairs of analytical curves and surfaces (plane - line, ...).
") IsParallel;
		Standard_Boolean IsParallel();

		/****** IntCurvesFace_Intersector::NbPnt ******/
		/****** md5 signature: 7493472b43e2ee7c4bd85784ca2a7eb4 ******/
		%feature("compactdefaultargs") NbPnt;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbPnt;
		Standard_Integer NbPnt();

		/****** IntCurvesFace_Intersector::Perform ******/
		/****** md5 signature: e18419430124de4e84da27951ae80914 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
L: gp_Lin
PInf: float
PSup: float

Return
-------
None

Description
-----------
Perform the intersection between the segment L and the loaded face. //! PInf is the smallest parameter on the line PSup is the highest parameter on the line //! For an infinite line PInf and PSup can be +/- RealLast.
") Perform;
		void Perform(const gp_Lin & L, const Standard_Real PInf, const Standard_Real PSup);

		/****** IntCurvesFace_Intersector::Perform ******/
		/****** md5 signature: c8caf88fde1edb2033386b7b626b143d ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
HCu: Adaptor3d_Curve
PInf: float
PSup: float

Return
-------
None

Description
-----------
same method for a HCurve from Adaptor3d. PInf an PSup can also be - and + INF.
") Perform;
		void Perform(const opencascade::handle<Adaptor3d_Curve> & HCu, const Standard_Real PInf, const Standard_Real PSup);

		/****** IntCurvesFace_Intersector::Pnt ******/
		/****** md5 signature: d0440fe82ac13d790faf173438707e9c ******/
		%feature("compactdefaultargs") Pnt;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
gp_Pnt

Description
-----------
Returns the geometric point of the ith intersection between the line and the surface.
") Pnt;
		const gp_Pnt Pnt(const Standard_Integer I);

		/****** IntCurvesFace_Intersector::SetUseBoundToler ******/
		/****** md5 signature: ee0ae617632796bddf249b0f86914544 ******/
		%feature("compactdefaultargs") SetUseBoundToler;
		%feature("autodoc", "
Parameters
----------
UseBToler: bool

Return
-------
None

Description
-----------
Sets the boundary tolerance flag.
") SetUseBoundToler;
		void SetUseBoundToler(Standard_Boolean UseBToler);

		/****** IntCurvesFace_Intersector::State ******/
		/****** md5 signature: 3ef584a4c8697b5b43cfa0be6c8072f7 ******/
		%feature("compactdefaultargs") State;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
TopAbs_State

Description
-----------
Returns the ith state of the point on the face. The values can be either TopAbs_IN ( the point is in the face) or TopAbs_ON ( the point is on a boundary of the face).
") State;
		TopAbs_State State(const Standard_Integer I);

		/****** IntCurvesFace_Intersector::SurfaceType ******/
		/****** md5 signature: 89d52b53be0e28e341c5b5e94282cf10 ******/
		%feature("compactdefaultargs") SurfaceType;
		%feature("autodoc", "Return
-------
GeomAbs_SurfaceType

Description
-----------
Return the surface type.
") SurfaceType;
		GeomAbs_SurfaceType SurfaceType();

		/****** IntCurvesFace_Intersector::Transition ******/
		/****** md5 signature: 33876f9f7fa6077fbaede5c70296e547 ******/
		%feature("compactdefaultargs") Transition;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
IntCurveSurface_TransitionOnCurve

Description
-----------
Returns the ith transition of the line on the surface.
") Transition;
		IntCurveSurface_TransitionOnCurve Transition(const Standard_Integer I);

		/****** IntCurvesFace_Intersector::UParameter ******/
		/****** md5 signature: 4e2ab34c664fe365f73ab40bf6b7907c ******/
		%feature("compactdefaultargs") UParameter;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
float

Description
-----------
Returns the U parameter of the ith intersection point on the surface.
") UParameter;
		Standard_Real UParameter(const Standard_Integer I);

		/****** IntCurvesFace_Intersector::VParameter ******/
		/****** md5 signature: 9b61d482fd013334ec36688975ff9502 ******/
		%feature("compactdefaultargs") VParameter;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
float

Description
-----------
Returns the V parameter of the ith intersection point on the surface.
") VParameter;
		Standard_Real VParameter(const Standard_Integer I);

		/****** IntCurvesFace_Intersector::WParameter ******/
		/****** md5 signature: dc0b89e88ad9e0b7c00279c03b1e7687 ******/
		%feature("compactdefaultargs") WParameter;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
float

Description
-----------
Returns the parameter of the ith intersection point on the line.
") WParameter;
		Standard_Real WParameter(const Standard_Integer I);

};


%make_alias(IntCurvesFace_Intersector)

%extend IntCurvesFace_Intersector {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************
* class IntCurvesFace_ShapeIntersector *
***************************************/
class IntCurvesFace_ShapeIntersector {
	public:
		/****** IntCurvesFace_ShapeIntersector::IntCurvesFace_ShapeIntersector ******/
		/****** md5 signature: 3688732279ca6ca15731544cfc75529e ******/
		%feature("compactdefaultargs") IntCurvesFace_ShapeIntersector;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") IntCurvesFace_ShapeIntersector;
		 IntCurvesFace_ShapeIntersector();

		/****** IntCurvesFace_ShapeIntersector::Face ******/
		/****** md5 signature: cfd60355079000e5d794463ee51aa209 ******/
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
TopoDS_Face

Description
-----------
Returns the significant face used to determine the intersection.
") Face;
		const TopoDS_Face Face(const Standard_Integer I);

		/****** IntCurvesFace_ShapeIntersector::IsDone ******/
		/****** md5 signature: e385477ab1bec806154173d4a550fd68 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
True when the intersection has been computed.
") IsDone;
		Standard_Boolean IsDone();

		/****** IntCurvesFace_ShapeIntersector::Load ******/
		/****** md5 signature: c9653eef18e54c8d7dd81abee6a86d25 ******/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "
Parameters
----------
Sh: TopoDS_Shape
Tol: float

Return
-------
None

Description
-----------
No available documentation.
") Load;
		void Load(const TopoDS_Shape & Sh, const Standard_Real Tol);

		/****** IntCurvesFace_ShapeIntersector::NbPnt ******/
		/****** md5 signature: be148f70782dfd3642552d1c87925ad8 ******/
		%feature("compactdefaultargs") NbPnt;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of the intersection points.
") NbPnt;
		Standard_Integer NbPnt();

		/****** IntCurvesFace_ShapeIntersector::Perform ******/
		/****** md5 signature: e18419430124de4e84da27951ae80914 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
L: gp_Lin
PInf: float
PSup: float

Return
-------
None

Description
-----------
Perform the intersection between the segment L and the loaded shape. //! PInf is the smallest parameter on the line PSup is the highest parameter on the line //! For an infinite line PInf and PSup can be +/- RealLast.
") Perform;
		void Perform(const gp_Lin & L, const Standard_Real PInf, const Standard_Real PSup);

		/****** IntCurvesFace_ShapeIntersector::Perform ******/
		/****** md5 signature: c8caf88fde1edb2033386b7b626b143d ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
HCu: Adaptor3d_Curve
PInf: float
PSup: float

Return
-------
None

Description
-----------
same method for a HCurve from Adaptor3d. PInf an PSup can also be -INF and +INF.
") Perform;
		void Perform(const opencascade::handle<Adaptor3d_Curve> & HCu, const Standard_Real PInf, const Standard_Real PSup);

		/****** IntCurvesFace_ShapeIntersector::PerformNearest ******/
		/****** md5 signature: ed809ea9e3a548c6cd15a623c13b9c18 ******/
		%feature("compactdefaultargs") PerformNearest;
		%feature("autodoc", "
Parameters
----------
L: gp_Lin
PInf: float
PSup: float

Return
-------
None

Description
-----------
Perform the intersection between the segment L and the loaded shape. //! PInf is the smallest parameter on the line PSup is the highest parameter on the line //! For an infinite line PInf and PSup can be +/- RealLast.
") PerformNearest;
		void PerformNearest(const gp_Lin & L, const Standard_Real PInf, const Standard_Real PSup);

		/****** IntCurvesFace_ShapeIntersector::Pnt ******/
		/****** md5 signature: 867836d5adb3737ee8fa8a25df767b5f ******/
		%feature("compactdefaultargs") Pnt;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
gp_Pnt

Description
-----------
Returns the geometric point of the ith intersection between the line and the surface.
") Pnt;
		const gp_Pnt Pnt(const Standard_Integer I);

		/****** IntCurvesFace_ShapeIntersector::SortResult ******/
		/****** md5 signature: 710973a5fe7c429ac44b8335f6329d05 ******/
		%feature("compactdefaultargs") SortResult;
		%feature("autodoc", "Return
-------
None

Description
-----------
Internal method. Sort the result on the Curve parameter.
") SortResult;
		void SortResult();

		/****** IntCurvesFace_ShapeIntersector::State ******/
		/****** md5 signature: 0b607cc57075af0e92d50aac1d2dabea ******/
		%feature("compactdefaultargs") State;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
TopAbs_State

Description
-----------
Returns the ith state of the point on the face. The values can be either TopAbs_IN ( the point is in the face) or TopAbs_ON ( the point is on a boundary of the face).
") State;
		TopAbs_State State(const Standard_Integer I);

		/****** IntCurvesFace_ShapeIntersector::Transition ******/
		/****** md5 signature: 776c076743ef9a0accb92662a1d0386a ******/
		%feature("compactdefaultargs") Transition;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
IntCurveSurface_TransitionOnCurve

Description
-----------
Returns the ith transition of the line on the surface.
") Transition;
		IntCurveSurface_TransitionOnCurve Transition(const Standard_Integer I);

		/****** IntCurvesFace_ShapeIntersector::UParameter ******/
		/****** md5 signature: 2cb2ac0f526160df3256c7f8e41fd6b3 ******/
		%feature("compactdefaultargs") UParameter;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
float

Description
-----------
Returns the U parameter of the ith intersection point on the surface.
") UParameter;
		Standard_Real UParameter(const Standard_Integer I);

		/****** IntCurvesFace_ShapeIntersector::VParameter ******/
		/****** md5 signature: 1a707d9bf40883790bcc4de33d8963ae ******/
		%feature("compactdefaultargs") VParameter;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
float

Description
-----------
Returns the V parameter of the ith intersection point on the surface.
") VParameter;
		Standard_Real VParameter(const Standard_Integer I);

		/****** IntCurvesFace_ShapeIntersector::WParameter ******/
		/****** md5 signature: 16651482049d64839981feb7105e98dc ******/
		%feature("compactdefaultargs") WParameter;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
float

Description
-----------
Returns the parameter of the ith intersection point on the line.
") WParameter;
		Standard_Real WParameter(const Standard_Integer I);

};


%extend IntCurvesFace_ShapeIntersector {
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
