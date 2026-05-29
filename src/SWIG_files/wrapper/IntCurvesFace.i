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
%define INTCURVESFACEDOCSTRING
"IntCurvesFace module, see official documentation at
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_intcurvesface.html"
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
		/****** md5 signature: 3e33d35696e432695bafc4e76dec3bde ******/
		%feature("compactdefaultargs") IntCurvesFace_Intersector;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face
aTol: double
aRestr: bool (optional, default to true)
UseBToler: bool (optional, default to true)

Return
-------
None

Description
-----------
Load a Face. //! The Tolerance <Tol> is used to determine if the first point of the segment is near the face. In that case, the parameter of the intersection point on the line can be a negative value (greater than -Tol). If aRestr = true UV bounding box of face is used to restrict it's underlined surface, otherwise surface is not restricted. If UseBToler = false then the 2d-point of intersection is classified with null-tolerance (relative to face); otherwise it's using maximum between input tolerance(aTol) and tolerances of face bounds (edges).
") IntCurvesFace_Intersector;
		 IntCurvesFace_Intersector(const TopoDS_Face & F, const double aTol, const bool aRestr = true, const bool UseBToler = true);

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
		/****** md5 signature: 98a57deab3573186c550fab0d451648e ******/
		%feature("compactdefaultargs") GetUseBoundToler;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the boundary tolerance flag.
") GetUseBoundToler;
		bool GetUseBoundToler();

		/****** IntCurvesFace_Intersector::IsDone ******/
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
True is returned when the intersection have been computed.
") IsDone;
		bool IsDone();

		/****** IntCurvesFace_Intersector::IsParallel ******/
		/****** md5 signature: 25d4ac955341335e2fbcc4e3737ea518 ******/
		%feature("compactdefaultargs") IsParallel;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if curve is parallel or belongs face surface This case is recognized only for some pairs of analytical curves and surfaces (plane - line, ...).
") IsParallel;
		bool IsParallel();

		/****** IntCurvesFace_Intersector::NbPnt ******/
		/****** md5 signature: b0974aa225801ebe3ae9518f18a1fa98 ******/
		%feature("compactdefaultargs") NbPnt;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbPnt;
		int NbPnt();

		/****** IntCurvesFace_Intersector::Perform ******/
		/****** md5 signature: 055d4e5b0233e01eca387d4e74f97b1b ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
L: gp_Lin
PInf: double
PSup: double

Return
-------
None

Description
-----------
Perform the intersection between the segment L and the loaded face. //! PInf is the smallest parameter on the line PSup is the highest parameter on the line //! For an infinite line PInf and PSup can be +/- RealLast.
") Perform;
		void Perform(const gp_Lin & L, const double PInf, const double PSup);

		/****** IntCurvesFace_Intersector::Perform ******/
		/****** md5 signature: 00d549176eca8b66d828f9af6c2e185b ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
HCu: Adaptor3d_Curve
PInf: double
PSup: double

Return
-------
None

Description
-----------
same method for a HCurve from Adaptor3d. PInf an PSup can also be - and + INF.
") Perform;
		void Perform(const opencascade::handle<Adaptor3d_Curve> & HCu, const double PInf, const double PSup);

		/****** IntCurvesFace_Intersector::Pnt ******/
		/****** md5 signature: 61ea740602387f9bafd2f292886f951f ******/
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
		const gp_Pnt Pnt(const int I);

		/****** IntCurvesFace_Intersector::SetUseBoundToler ******/
		/****** md5 signature: 7900b8531c7d0ace6a760259f04422ae ******/
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
		void SetUseBoundToler(bool UseBToler);

		/****** IntCurvesFace_Intersector::State ******/
		/****** md5 signature: 43b6d9b6141d9d384a9c4c90b725fb89 ******/
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
		TopAbs_State State(const int I);

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
		/****** md5 signature: 86d6cbc850562449344972abda6495f5 ******/
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
		IntCurveSurface_TransitionOnCurve Transition(const int I);

		/****** IntCurvesFace_Intersector::UParameter ******/
		/****** md5 signature: 8c404ee0f187dbc3d735ab96d217d25a ******/
		%feature("compactdefaultargs") UParameter;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
double

Description
-----------
Returns the U parameter of the ith intersection point on the surface.
") UParameter;
		double UParameter(const int I);

		/****** IntCurvesFace_Intersector::VParameter ******/
		/****** md5 signature: 4a84d53dd72be706ddb2c908ae769b76 ******/
		%feature("compactdefaultargs") VParameter;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
double

Description
-----------
Returns the V parameter of the ith intersection point on the surface.
") VParameter;
		double VParameter(const int I);

		/****** IntCurvesFace_Intersector::WParameter ******/
		/****** md5 signature: e2692c4e0980d8a91a82237179b1e71d ******/
		%feature("compactdefaultargs") WParameter;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
double

Description
-----------
Returns the parameter of the ith intersection point on the line.
") WParameter;
		double WParameter(const int I);

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
		/****** md5 signature: ea22536eb99f8507e52092b4b7d267fc ******/
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
		const TopoDS_Face Face(const int I);

		/****** IntCurvesFace_ShapeIntersector::IsDone ******/
		/****** md5 signature: 05e29e49040d98b489fbc7af11aabb8e ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
True when the intersection has been computed.
") IsDone;
		bool IsDone();

		/****** IntCurvesFace_ShapeIntersector::Load ******/
		/****** md5 signature: 90afdb73abae1062d5e58d3621a6939f ******/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "
Parameters
----------
Sh: TopoDS_Shape
Tol: double

Return
-------
None

Description
-----------
No available documentation.
") Load;
		void Load(const TopoDS_Shape & Sh, const double Tol);

		/****** IntCurvesFace_ShapeIntersector::NbPnt ******/
		/****** md5 signature: 0af44f8fe6be8a1c58a13f318e1fe29a ******/
		%feature("compactdefaultargs") NbPnt;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of the intersection points.
") NbPnt;
		int NbPnt();

		/****** IntCurvesFace_ShapeIntersector::Perform ******/
		/****** md5 signature: 055d4e5b0233e01eca387d4e74f97b1b ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
L: gp_Lin
PInf: double
PSup: double

Return
-------
None

Description
-----------
Perform the intersection between the segment L and the loaded shape. //! PInf is the smallest parameter on the line PSup is the highest parameter on the line //! For an infinite line PInf and PSup can be +/- RealLast.
") Perform;
		void Perform(const gp_Lin & L, const double PInf, const double PSup);

		/****** IntCurvesFace_ShapeIntersector::Perform ******/
		/****** md5 signature: 00d549176eca8b66d828f9af6c2e185b ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
HCu: Adaptor3d_Curve
PInf: double
PSup: double

Return
-------
None

Description
-----------
same method for a HCurve from Adaptor3d. PInf an PSup can also be -INF and +INF.
") Perform;
		void Perform(const opencascade::handle<Adaptor3d_Curve> & HCu, const double PInf, const double PSup);

		/****** IntCurvesFace_ShapeIntersector::PerformNearest ******/
		/****** md5 signature: 558cc1f26b1a11c6e4dccbd92794c1db ******/
		%feature("compactdefaultargs") PerformNearest;
		%feature("autodoc", "
Parameters
----------
L: gp_Lin
PInf: double
PSup: double

Return
-------
None

Description
-----------
Perform the intersection between the segment L and the loaded shape. //! PInf is the smallest parameter on the line PSup is the highest parameter on the line //! For an infinite line PInf and PSup can be +/- RealLast.
") PerformNearest;
		void PerformNearest(const gp_Lin & L, const double PInf, const double PSup);

		/****** IntCurvesFace_ShapeIntersector::Pnt ******/
		/****** md5 signature: c19402f347e3ccccaecc59b68d3554ec ******/
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
		const gp_Pnt Pnt(const int I);

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
		/****** md5 signature: 159014de965e4002341d01cdd1e6c89e ******/
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
		TopAbs_State State(const int I);

		/****** IntCurvesFace_ShapeIntersector::Transition ******/
		/****** md5 signature: e8abe6223d939360cf3cf19dc5377060 ******/
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
		IntCurveSurface_TransitionOnCurve Transition(const int I);

		/****** IntCurvesFace_ShapeIntersector::UParameter ******/
		/****** md5 signature: 00bdd8aab36d49b11aa86c0f6399ccfc ******/
		%feature("compactdefaultargs") UParameter;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
double

Description
-----------
Returns the U parameter of the ith intersection point on the surface.
") UParameter;
		double UParameter(const int I);

		/****** IntCurvesFace_ShapeIntersector::VParameter ******/
		/****** md5 signature: b87417cd04978e42d923b5591abd6f9e ******/
		%feature("compactdefaultargs") VParameter;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
double

Description
-----------
Returns the V parameter of the ith intersection point on the surface.
") VParameter;
		double VParameter(const int I);

		/****** IntCurvesFace_ShapeIntersector::WParameter ******/
		/****** md5 signature: 6d10eb8fdf7c9e0d25cd740f55291296 ******/
		%feature("compactdefaultargs") WParameter;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
double

Description
-----------
Returns the parameter of the ith intersection point on the line.
") WParameter;
		double WParameter(const int I);

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
