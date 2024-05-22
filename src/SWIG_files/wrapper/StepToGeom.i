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
%define STEPTOGEOMDOCSTRING
"StepToGeom module, see official documentation at
https://dev.opencascade.org/doc/occt-7.7.0/refman/html/package_steptogeom.html"
%enddef
%module (package="OCC.Core", docstring=STEPTOGEOMDOCSTRING) StepToGeom


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


%{
#include<StepToGeom_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<StepGeom_module.hxx>
#include<StepData_module.hxx>
#include<Geom_module.hxx>
#include<Geom2d_module.hxx>
#include<gp_module.hxx>
#include<StepKinematics_module.hxx>
#include<StepRepr_module.hxx>
#include<TColStd_module.hxx>
#include<Message_module.hxx>
#include<StepShape_module.hxx>
#include<StepBasic_module.hxx>
#include<StepGeom_module.hxx>
#include<StepRepr_module.hxx>
#include<StepElement_module.hxx>
#include<Interface_module.hxx>
#include<StepData_module.hxx>
#include<MoniTool_module.hxx>
#include<TopoDS_module.hxx>
#include<Resource_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import StepGeom.i
%import StepData.i
%import Geom.i
%import Geom2d.i
%import gp.i
%import StepKinematics.i
%import StepRepr.i
%import TColStd.i

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
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/*******************
* class StepToGeom *
*******************/
%rename(steptogeom) StepToGeom;
class StepToGeom {
	public:
		/****************** MakeAxis1Placement ******************/
		/**** md5 signature: 497af862e00ca406f13a0793cbc3e893 ****/
		%feature("compactdefaultargs") MakeAxis1Placement;
		%feature("autodoc", "
Parameters
----------
SA: StepGeom_Axis1Placement
theLocalFactors: StepData_Factors

Return
-------
opencascade::handle<Geom_Axis1Placement>

Description
-----------
No available documentation.
") MakeAxis1Placement;
		static opencascade::handle<Geom_Axis1Placement> MakeAxis1Placement(const opencascade::handle<StepGeom_Axis1Placement> & SA, const StepData_Factors & theLocalFactors);

		/****************** MakeAxis2Placement ******************/
		/**** md5 signature: 2e366052f7936befb7c794e733521080 ****/
		%feature("compactdefaultargs") MakeAxis2Placement;
		%feature("autodoc", "
Parameters
----------
SA: StepGeom_Axis2Placement3d
theLocalFactors: StepData_Factors

Return
-------
opencascade::handle<Geom_Axis2Placement>

Description
-----------
No available documentation.
") MakeAxis2Placement;
		static opencascade::handle<Geom_Axis2Placement> MakeAxis2Placement(const opencascade::handle<StepGeom_Axis2Placement3d> & SA, const StepData_Factors & theLocalFactors);

		/****************** MakeAxis2Placement ******************/
		/**** md5 signature: 9c31e6d955fc394caecd4f46d406587b ****/
		%feature("compactdefaultargs") MakeAxis2Placement;
		%feature("autodoc", "
Parameters
----------
SP: StepGeom_SuParameters

Return
-------
opencascade::handle<Geom_Axis2Placement>

Description
-----------
No available documentation.
") MakeAxis2Placement;
		static opencascade::handle<Geom_Axis2Placement> MakeAxis2Placement(const opencascade::handle<StepGeom_SuParameters> & SP);

		/****************** MakeAxisPlacement ******************/
		/**** md5 signature: 070972f5605d50fec92df3ee4b8f4995 ****/
		%feature("compactdefaultargs") MakeAxisPlacement;
		%feature("autodoc", "
Parameters
----------
SA: StepGeom_Axis2Placement2d
theLocalFactors: StepData_Factors

Return
-------
opencascade::handle<Geom2d_AxisPlacement>

Description
-----------
No available documentation.
") MakeAxisPlacement;
		static opencascade::handle<Geom2d_AxisPlacement> MakeAxisPlacement(const opencascade::handle<StepGeom_Axis2Placement2d> & SA, const StepData_Factors & theLocalFactors);

		/****************** MakeBSplineCurve ******************/
		/**** md5 signature: 105ed8764d2ea9950ffc4d9ef15d4695 ****/
		%feature("compactdefaultargs") MakeBSplineCurve;
		%feature("autodoc", "
Parameters
----------
SC: StepGeom_BSplineCurve
theLocalFactors: StepData_Factors

Return
-------
opencascade::handle<Geom_BSplineCurve>

Description
-----------
No available documentation.
") MakeBSplineCurve;
		static opencascade::handle<Geom_BSplineCurve> MakeBSplineCurve(const opencascade::handle<StepGeom_BSplineCurve> & SC, const StepData_Factors & theLocalFactors);

		/****************** MakeBSplineCurve2d ******************/
		/**** md5 signature: 47c8465f841fe50f3c8498f3973e934e ****/
		%feature("compactdefaultargs") MakeBSplineCurve2d;
		%feature("autodoc", "
Parameters
----------
SC: StepGeom_BSplineCurve
theLocalFactors: StepData_Factors

Return
-------
opencascade::handle<Geom2d_BSplineCurve>

Description
-----------
No available documentation.
") MakeBSplineCurve2d;
		static opencascade::handle<Geom2d_BSplineCurve> MakeBSplineCurve2d(const opencascade::handle<StepGeom_BSplineCurve> & SC, const StepData_Factors & theLocalFactors);

		/****************** MakeBSplineSurface ******************/
		/**** md5 signature: 7d86fb58fc31e3660266b59e6533b0d6 ****/
		%feature("compactdefaultargs") MakeBSplineSurface;
		%feature("autodoc", "
Parameters
----------
SS: StepGeom_BSplineSurface
theLocalFactors: StepData_Factors

Return
-------
opencascade::handle<Geom_BSplineSurface>

Description
-----------
No available documentation.
") MakeBSplineSurface;
		static opencascade::handle<Geom_BSplineSurface> MakeBSplineSurface(const opencascade::handle<StepGeom_BSplineSurface> & SS, const StepData_Factors & theLocalFactors);

		/****************** MakeBoundedCurve ******************/
		/**** md5 signature: c741eaa54ce3e5ad283641767993b742 ****/
		%feature("compactdefaultargs") MakeBoundedCurve;
		%feature("autodoc", "
Parameters
----------
SC: StepGeom_BoundedCurve
theLocalFactors: StepData_Factors

Return
-------
opencascade::handle<Geom_BoundedCurve>

Description
-----------
No available documentation.
") MakeBoundedCurve;
		static opencascade::handle<Geom_BoundedCurve> MakeBoundedCurve(const opencascade::handle<StepGeom_BoundedCurve> & SC, const StepData_Factors & theLocalFactors);

		/****************** MakeBoundedCurve2d ******************/
		/**** md5 signature: eefaf6fdcf95f733f4a271525c9d27ee ****/
		%feature("compactdefaultargs") MakeBoundedCurve2d;
		%feature("autodoc", "
Parameters
----------
SC: StepGeom_BoundedCurve
theLocalFactors: StepData_Factors

Return
-------
opencascade::handle<Geom2d_BoundedCurve>

Description
-----------
No available documentation.
") MakeBoundedCurve2d;
		static opencascade::handle<Geom2d_BoundedCurve> MakeBoundedCurve2d(const opencascade::handle<StepGeom_BoundedCurve> & SC, const StepData_Factors & theLocalFactors);

		/****************** MakeBoundedSurface ******************/
		/**** md5 signature: 3635f4a3dd706161233bd0cf1326e9f5 ****/
		%feature("compactdefaultargs") MakeBoundedSurface;
		%feature("autodoc", "
Parameters
----------
SS: StepGeom_BoundedSurface
theLocalFactors: StepData_Factors

Return
-------
opencascade::handle<Geom_BoundedSurface>

Description
-----------
No available documentation.
") MakeBoundedSurface;
		static opencascade::handle<Geom_BoundedSurface> MakeBoundedSurface(const opencascade::handle<StepGeom_BoundedSurface> & SS, const StepData_Factors & theLocalFactors);

		/****************** MakeCartesianPoint ******************/
		/**** md5 signature: 72fc54286cd1815dbb68c47bb44c38cd ****/
		%feature("compactdefaultargs") MakeCartesianPoint;
		%feature("autodoc", "
Parameters
----------
SP: StepGeom_CartesianPoint
theLocalFactors: StepData_Factors

Return
-------
opencascade::handle<Geom_CartesianPoint>

Description
-----------
No available documentation.
") MakeCartesianPoint;
		static opencascade::handle<Geom_CartesianPoint> MakeCartesianPoint(const opencascade::handle<StepGeom_CartesianPoint> & SP, const StepData_Factors & theLocalFactors);

		/****************** MakeCartesianPoint2d ******************/
		/**** md5 signature: d0479b556ff8dfd79b5d4d222d6717b2 ****/
		%feature("compactdefaultargs") MakeCartesianPoint2d;
		%feature("autodoc", "
Parameters
----------
SP: StepGeom_CartesianPoint
theLocalFactors: StepData_Factors

Return
-------
opencascade::handle<Geom2d_CartesianPoint>

Description
-----------
No available documentation.
") MakeCartesianPoint2d;
		static opencascade::handle<Geom2d_CartesianPoint> MakeCartesianPoint2d(const opencascade::handle<StepGeom_CartesianPoint> & SP, const StepData_Factors & theLocalFactors);

		/****************** MakeCircle ******************/
		/**** md5 signature: aecce9fd71272e4884412e2011ab1f50 ****/
		%feature("compactdefaultargs") MakeCircle;
		%feature("autodoc", "
Parameters
----------
SC: StepGeom_Circle
theLocalFactors: StepData_Factors

Return
-------
opencascade::handle<Geom_Circle>

Description
-----------
No available documentation.
") MakeCircle;
		static opencascade::handle<Geom_Circle> MakeCircle(const opencascade::handle<StepGeom_Circle> & SC, const StepData_Factors & theLocalFactors);

		/****************** MakeCircle2d ******************/
		/**** md5 signature: 5310ab54982eb53424a065ab2723facf ****/
		%feature("compactdefaultargs") MakeCircle2d;
		%feature("autodoc", "
Parameters
----------
SC: StepGeom_Circle
theLocalFactors: StepData_Factors

Return
-------
opencascade::handle<Geom2d_Circle>

Description
-----------
No available documentation.
") MakeCircle2d;
		static opencascade::handle<Geom2d_Circle> MakeCircle2d(const opencascade::handle<StepGeom_Circle> & SC, const StepData_Factors & theLocalFactors);

		/****************** MakeConic ******************/
		/**** md5 signature: 9f640f3238eb8b3eafca377d97e879f0 ****/
		%feature("compactdefaultargs") MakeConic;
		%feature("autodoc", "
Parameters
----------
SC: StepGeom_Conic
theLocalFactors: StepData_Factors

Return
-------
opencascade::handle<Geom_Conic>

Description
-----------
No available documentation.
") MakeConic;
		static opencascade::handle<Geom_Conic> MakeConic(const opencascade::handle<StepGeom_Conic> & SC, const StepData_Factors & theLocalFactors);

		/****************** MakeConic2d ******************/
		/**** md5 signature: 01d3e837e46416f2c8f44cb5714d7a7d ****/
		%feature("compactdefaultargs") MakeConic2d;
		%feature("autodoc", "
Parameters
----------
SC: StepGeom_Conic
theLocalFactors: StepData_Factors

Return
-------
opencascade::handle<Geom2d_Conic>

Description
-----------
No available documentation.
") MakeConic2d;
		static opencascade::handle<Geom2d_Conic> MakeConic2d(const opencascade::handle<StepGeom_Conic> & SC, const StepData_Factors & theLocalFactors);

		/****************** MakeConicalSurface ******************/
		/**** md5 signature: 8901f4d2c3f3caaa8d80ad0e5f1835df ****/
		%feature("compactdefaultargs") MakeConicalSurface;
		%feature("autodoc", "
Parameters
----------
SS: StepGeom_ConicalSurface
theLocalFactors: StepData_Factors

Return
-------
opencascade::handle<Geom_ConicalSurface>

Description
-----------
No available documentation.
") MakeConicalSurface;
		static opencascade::handle<Geom_ConicalSurface> MakeConicalSurface(const opencascade::handle<StepGeom_ConicalSurface> & SS, const StepData_Factors & theLocalFactors);

		/****************** MakeCurve ******************/
		/**** md5 signature: ed25c6c44492172fa9385e48e885752f ****/
		%feature("compactdefaultargs") MakeCurve;
		%feature("autodoc", "
Parameters
----------
SC: StepGeom_Curve
theLocalFactors: StepData_Factors

Return
-------
opencascade::handle<Geom_Curve>

Description
-----------
No available documentation.
") MakeCurve;
		static opencascade::handle<Geom_Curve> MakeCurve(const opencascade::handle<StepGeom_Curve> & SC, const StepData_Factors & theLocalFactors);

		/****************** MakeCurve2d ******************/
		/**** md5 signature: 88f05d026c74abcf3aadfab6ca702f78 ****/
		%feature("compactdefaultargs") MakeCurve2d;
		%feature("autodoc", "
Parameters
----------
SC: StepGeom_Curve
theLocalFactors: StepData_Factors

Return
-------
opencascade::handle<Geom2d_Curve>

Description
-----------
No available documentation.
") MakeCurve2d;
		static opencascade::handle<Geom2d_Curve> MakeCurve2d(const opencascade::handle<StepGeom_Curve> & SC, const StepData_Factors & theLocalFactors);

		/****************** MakeCylindricalSurface ******************/
		/**** md5 signature: 54e2991c1978fe91ccc9c193c6b495ff ****/
		%feature("compactdefaultargs") MakeCylindricalSurface;
		%feature("autodoc", "
Parameters
----------
SS: StepGeom_CylindricalSurface
theLocalFactors: StepData_Factors

Return
-------
opencascade::handle<Geom_CylindricalSurface>

Description
-----------
No available documentation.
") MakeCylindricalSurface;
		static opencascade::handle<Geom_CylindricalSurface> MakeCylindricalSurface(const opencascade::handle<StepGeom_CylindricalSurface> & SS, const StepData_Factors & theLocalFactors);

		/****************** MakeDirection ******************/
		/**** md5 signature: ab447b404195ec0d7870691bec92b043 ****/
		%feature("compactdefaultargs") MakeDirection;
		%feature("autodoc", "
Parameters
----------
SD: StepGeom_Direction

Return
-------
opencascade::handle<Geom_Direction>

Description
-----------
No available documentation.
") MakeDirection;
		static opencascade::handle<Geom_Direction> MakeDirection(const opencascade::handle<StepGeom_Direction> & SD);

		/****************** MakeDirection2d ******************/
		/**** md5 signature: 8bf8a7b40255be99f58f3af845adeaad ****/
		%feature("compactdefaultargs") MakeDirection2d;
		%feature("autodoc", "
Parameters
----------
SD: StepGeom_Direction

Return
-------
opencascade::handle<Geom2d_Direction>

Description
-----------
No available documentation.
") MakeDirection2d;
		static opencascade::handle<Geom2d_Direction> MakeDirection2d(const opencascade::handle<StepGeom_Direction> & SD);

		/****************** MakeElementarySurface ******************/
		/**** md5 signature: 252cfe02472d13c8834aa3f42a5e905f ****/
		%feature("compactdefaultargs") MakeElementarySurface;
		%feature("autodoc", "
Parameters
----------
SS: StepGeom_ElementarySurface
theLocalFactors: StepData_Factors

Return
-------
opencascade::handle<Geom_ElementarySurface>

Description
-----------
No available documentation.
") MakeElementarySurface;
		static opencascade::handle<Geom_ElementarySurface> MakeElementarySurface(const opencascade::handle<StepGeom_ElementarySurface> & SS, const StepData_Factors & theLocalFactors);

		/****************** MakeEllipse ******************/
		/**** md5 signature: 76abaa4660df053bdc81ceee387579a8 ****/
		%feature("compactdefaultargs") MakeEllipse;
		%feature("autodoc", "
Parameters
----------
SC: StepGeom_Ellipse
theLocalFactors: StepData_Factors

Return
-------
opencascade::handle<Geom_Ellipse>

Description
-----------
No available documentation.
") MakeEllipse;
		static opencascade::handle<Geom_Ellipse> MakeEllipse(const opencascade::handle<StepGeom_Ellipse> & SC, const StepData_Factors & theLocalFactors);

		/****************** MakeEllipse2d ******************/
		/**** md5 signature: 4f8a96a0bc41c49ad7aca2671fb7e09b ****/
		%feature("compactdefaultargs") MakeEllipse2d;
		%feature("autodoc", "
Parameters
----------
SC: StepGeom_Ellipse
theLocalFactors: StepData_Factors

Return
-------
opencascade::handle<Geom2d_Ellipse>

Description
-----------
No available documentation.
") MakeEllipse2d;
		static opencascade::handle<Geom2d_Ellipse> MakeEllipse2d(const opencascade::handle<StepGeom_Ellipse> & SC, const StepData_Factors & theLocalFactors);

		/****************** MakeHyperbola ******************/
		/**** md5 signature: 3fce62260a3d293ea0ce6374d8e22549 ****/
		%feature("compactdefaultargs") MakeHyperbola;
		%feature("autodoc", "
Parameters
----------
SC: StepGeom_Hyperbola
theLocalFactors: StepData_Factors

Return
-------
opencascade::handle<Geom_Hyperbola>

Description
-----------
No available documentation.
") MakeHyperbola;
		static opencascade::handle<Geom_Hyperbola> MakeHyperbola(const opencascade::handle<StepGeom_Hyperbola> & SC, const StepData_Factors & theLocalFactors);

		/****************** MakeHyperbola2d ******************/
		/**** md5 signature: e017665be17d1a986dc4ff76ad333a9f ****/
		%feature("compactdefaultargs") MakeHyperbola2d;
		%feature("autodoc", "
Parameters
----------
SC: StepGeom_Hyperbola
theLocalFactors: StepData_Factors

Return
-------
opencascade::handle<Geom2d_Hyperbola>

Description
-----------
No available documentation.
") MakeHyperbola2d;
		static opencascade::handle<Geom2d_Hyperbola> MakeHyperbola2d(const opencascade::handle<StepGeom_Hyperbola> & SC, const StepData_Factors & theLocalFactors);

		/****************** MakeLine ******************/
		/**** md5 signature: b3a5ee7f92ea5c9b308c7f2086799f71 ****/
		%feature("compactdefaultargs") MakeLine;
		%feature("autodoc", "
Parameters
----------
SC: StepGeom_Line
theLocalFactors: StepData_Factors

Return
-------
opencascade::handle<Geom_Line>

Description
-----------
No available documentation.
") MakeLine;
		static opencascade::handle<Geom_Line> MakeLine(const opencascade::handle<StepGeom_Line> & SC, const StepData_Factors & theLocalFactors);

		/****************** MakeLine2d ******************/
		/**** md5 signature: 62ddf93401b0b1e7ea7fe04f8bff1514 ****/
		%feature("compactdefaultargs") MakeLine2d;
		%feature("autodoc", "
Parameters
----------
SC: StepGeom_Line
theLocalFactors: StepData_Factors

Return
-------
opencascade::handle<Geom2d_Line>

Description
-----------
No available documentation.
") MakeLine2d;
		static opencascade::handle<Geom2d_Line> MakeLine2d(const opencascade::handle<StepGeom_Line> & SC, const StepData_Factors & theLocalFactors);

		/****************** MakeParabola ******************/
		/**** md5 signature: 4acfa225320bf6375fd528e6a1631919 ****/
		%feature("compactdefaultargs") MakeParabola;
		%feature("autodoc", "
Parameters
----------
SC: StepGeom_Parabola
theLocalFactors: StepData_Factors

Return
-------
opencascade::handle<Geom_Parabola>

Description
-----------
No available documentation.
") MakeParabola;
		static opencascade::handle<Geom_Parabola> MakeParabola(const opencascade::handle<StepGeom_Parabola> & SC, const StepData_Factors & theLocalFactors);

		/****************** MakeParabola2d ******************/
		/**** md5 signature: 0840b9e446bf9b1744fae8258d88f5e1 ****/
		%feature("compactdefaultargs") MakeParabola2d;
		%feature("autodoc", "
Parameters
----------
SC: StepGeom_Parabola
theLocalFactors: StepData_Factors

Return
-------
opencascade::handle<Geom2d_Parabola>

Description
-----------
No available documentation.
") MakeParabola2d;
		static opencascade::handle<Geom2d_Parabola> MakeParabola2d(const opencascade::handle<StepGeom_Parabola> & SC, const StepData_Factors & theLocalFactors);

		/****************** MakePlane ******************/
		/**** md5 signature: 97424bd4c75aa9596c2f9d4d407fe179 ****/
		%feature("compactdefaultargs") MakePlane;
		%feature("autodoc", "
Parameters
----------
SP: StepGeom_Plane
theLocalFactors: StepData_Factors

Return
-------
opencascade::handle<Geom_Plane>

Description
-----------
No available documentation.
") MakePlane;
		static opencascade::handle<Geom_Plane> MakePlane(const opencascade::handle<StepGeom_Plane> & SP, const StepData_Factors & theLocalFactors);

		/****************** MakePolyline ******************/
		/**** md5 signature: e2aa3e8d6ad3c4888fd7417dd0c4e42a ****/
		%feature("compactdefaultargs") MakePolyline;
		%feature("autodoc", "
Parameters
----------
SPL: StepGeom_Polyline
theLocalFactors: StepData_Factors

Return
-------
opencascade::handle<Geom_BSplineCurve>

Description
-----------
No available documentation.
") MakePolyline;
		static opencascade::handle<Geom_BSplineCurve> MakePolyline(const opencascade::handle<StepGeom_Polyline> & SPL, const StepData_Factors & theLocalFactors);

		/****************** MakePolyline2d ******************/
		/**** md5 signature: b129428f51b35713b2e1beac6eb14b8a ****/
		%feature("compactdefaultargs") MakePolyline2d;
		%feature("autodoc", "
Parameters
----------
SPL: StepGeom_Polyline
theLocalFactors: StepData_Factors

Return
-------
opencascade::handle<Geom2d_BSplineCurve>

Description
-----------
No available documentation.
") MakePolyline2d;
		static opencascade::handle<Geom2d_BSplineCurve> MakePolyline2d(const opencascade::handle<StepGeom_Polyline> & SPL, const StepData_Factors & theLocalFactors);

		/****************** MakeRectangularTrimmedSurface ******************/
		/**** md5 signature: e9110018bcf0562035a19536f8c90de1 ****/
		%feature("compactdefaultargs") MakeRectangularTrimmedSurface;
		%feature("autodoc", "
Parameters
----------
SS: StepGeom_RectangularTrimmedSurface
theLocalFactors: StepData_Factors

Return
-------
opencascade::handle<Geom_RectangularTrimmedSurface>

Description
-----------
No available documentation.
") MakeRectangularTrimmedSurface;
		static opencascade::handle<Geom_RectangularTrimmedSurface> MakeRectangularTrimmedSurface(const opencascade::handle<StepGeom_RectangularTrimmedSurface> & SS, const StepData_Factors & theLocalFactors);

		/****************** MakeSphericalSurface ******************/
		/**** md5 signature: 0c8a734c6b1030eb1db14c8aab540c50 ****/
		%feature("compactdefaultargs") MakeSphericalSurface;
		%feature("autodoc", "
Parameters
----------
SS: StepGeom_SphericalSurface
theLocalFactors: StepData_Factors

Return
-------
opencascade::handle<Geom_SphericalSurface>

Description
-----------
No available documentation.
") MakeSphericalSurface;
		static opencascade::handle<Geom_SphericalSurface> MakeSphericalSurface(const opencascade::handle<StepGeom_SphericalSurface> & SS, const StepData_Factors & theLocalFactors);

		/****************** MakeSurface ******************/
		/**** md5 signature: 4cecdd61ccd3bceea60727712227b557 ****/
		%feature("compactdefaultargs") MakeSurface;
		%feature("autodoc", "
Parameters
----------
SS: StepGeom_Surface
theLocalFactors: StepData_Factors

Return
-------
opencascade::handle<Geom_Surface>

Description
-----------
No available documentation.
") MakeSurface;
		static opencascade::handle<Geom_Surface> MakeSurface(const opencascade::handle<StepGeom_Surface> & SS, const StepData_Factors & theLocalFactors);

		/****************** MakeSurfaceOfLinearExtrusion ******************/
		/**** md5 signature: 63536e270a57c397b202585f46b3521a ****/
		%feature("compactdefaultargs") MakeSurfaceOfLinearExtrusion;
		%feature("autodoc", "
Parameters
----------
SS: StepGeom_SurfaceOfLinearExtrusion
theLocalFactors: StepData_Factors

Return
-------
opencascade::handle<Geom_SurfaceOfLinearExtrusion>

Description
-----------
No available documentation.
") MakeSurfaceOfLinearExtrusion;
		static opencascade::handle<Geom_SurfaceOfLinearExtrusion> MakeSurfaceOfLinearExtrusion(const opencascade::handle<StepGeom_SurfaceOfLinearExtrusion> & SS, const StepData_Factors & theLocalFactors);

		/****************** MakeSurfaceOfRevolution ******************/
		/**** md5 signature: 059b8cb954153e222d7dfaf46d75ed90 ****/
		%feature("compactdefaultargs") MakeSurfaceOfRevolution;
		%feature("autodoc", "
Parameters
----------
SS: StepGeom_SurfaceOfRevolution
theLocalFactors: StepData_Factors

Return
-------
opencascade::handle<Geom_SurfaceOfRevolution>

Description
-----------
No available documentation.
") MakeSurfaceOfRevolution;
		static opencascade::handle<Geom_SurfaceOfRevolution> MakeSurfaceOfRevolution(const opencascade::handle<StepGeom_SurfaceOfRevolution> & SS, const StepData_Factors & theLocalFactors);

		/****************** MakeSweptSurface ******************/
		/**** md5 signature: af7ee673f53633b8438570a253ca2462 ****/
		%feature("compactdefaultargs") MakeSweptSurface;
		%feature("autodoc", "
Parameters
----------
SS: StepGeom_SweptSurface
theLocalFactors: StepData_Factors

Return
-------
opencascade::handle<Geom_SweptSurface>

Description
-----------
No available documentation.
") MakeSweptSurface;
		static opencascade::handle<Geom_SweptSurface> MakeSweptSurface(const opencascade::handle<StepGeom_SweptSurface> & SS, const StepData_Factors & theLocalFactors);

		/****************** MakeToroidalSurface ******************/
		/**** md5 signature: 0b3e3d9cdaf591f9a406518b3aead681 ****/
		%feature("compactdefaultargs") MakeToroidalSurface;
		%feature("autodoc", "
Parameters
----------
SS: StepGeom_ToroidalSurface
theLocalFactors: StepData_Factors

Return
-------
opencascade::handle<Geom_ToroidalSurface>

Description
-----------
No available documentation.
") MakeToroidalSurface;
		static opencascade::handle<Geom_ToroidalSurface> MakeToroidalSurface(const opencascade::handle<StepGeom_ToroidalSurface> & SS, const StepData_Factors & theLocalFactors);

		/****************** MakeTransformation2d ******************/
		/**** md5 signature: 0c5bf1a1e90bacc10c80ef04260bf5a9 ****/
		%feature("compactdefaultargs") MakeTransformation2d;
		%feature("autodoc", "
Parameters
----------
SCTO: StepGeom_CartesianTransformationOperator2d
CT: gp_Trsf2d
theLocalFactors: StepData_Factors

Return
-------
bool

Description
-----------
No available documentation.
") MakeTransformation2d;
		static Standard_Boolean MakeTransformation2d(const opencascade::handle<StepGeom_CartesianTransformationOperator2d> & SCTO, gp_Trsf2d & CT, const StepData_Factors & theLocalFactors);

		/****************** MakeTransformation3d ******************/
		/**** md5 signature: 5ae1ad4f8a4ae552af06aafa0f7130c6 ****/
		%feature("compactdefaultargs") MakeTransformation3d;
		%feature("autodoc", "
Parameters
----------
SCTO: StepGeom_CartesianTransformationOperator3d
CT: gp_Trsf
theLocalFactors: StepData_Factors

Return
-------
bool

Description
-----------
No available documentation.
") MakeTransformation3d;
		static Standard_Boolean MakeTransformation3d(const opencascade::handle<StepGeom_CartesianTransformationOperator3d> & SCTO, gp_Trsf & CT, const StepData_Factors & theLocalFactors);

		/****************** MakeTrimmedCurve ******************/
		/**** md5 signature: d0ecd8b0b1f2442f14f46ec99b661233 ****/
		%feature("compactdefaultargs") MakeTrimmedCurve;
		%feature("autodoc", "
Parameters
----------
SC: StepGeom_TrimmedCurve
theLocalFactors: StepData_Factors

Return
-------
opencascade::handle<Geom_TrimmedCurve>

Description
-----------
No available documentation.
") MakeTrimmedCurve;
		static opencascade::handle<Geom_TrimmedCurve> MakeTrimmedCurve(const opencascade::handle<StepGeom_TrimmedCurve> & SC, const StepData_Factors & theLocalFactors);

		/****************** MakeTrimmedCurve2d ******************/
		/**** md5 signature: c3a2f660586af700b369d9a3b35ed5a1 ****/
		%feature("compactdefaultargs") MakeTrimmedCurve2d;
		%feature("autodoc", "
Parameters
----------
SC: StepGeom_TrimmedCurve
theLocalFactors: StepData_Factors

Return
-------
opencascade::handle<Geom2d_BSplineCurve>

Description
-----------
No available documentation.
") MakeTrimmedCurve2d;
		static opencascade::handle<Geom2d_BSplineCurve> MakeTrimmedCurve2d(const opencascade::handle<StepGeom_TrimmedCurve> & SC, const StepData_Factors & theLocalFactors);

		/****************** MakeVectorWithMagnitude ******************/
		/**** md5 signature: 5f77285d4d5e1367516aacd5d80bbf1a ****/
		%feature("compactdefaultargs") MakeVectorWithMagnitude;
		%feature("autodoc", "
Parameters
----------
SV: StepGeom_Vector
theLocalFactors: StepData_Factors

Return
-------
opencascade::handle<Geom_VectorWithMagnitude>

Description
-----------
No available documentation.
") MakeVectorWithMagnitude;
		static opencascade::handle<Geom_VectorWithMagnitude> MakeVectorWithMagnitude(const opencascade::handle<StepGeom_Vector> & SV, const StepData_Factors & theLocalFactors);

		/****************** MakeVectorWithMagnitude2d ******************/
		/**** md5 signature: 4fb91506f943c82636c09792ad2f9c30 ****/
		%feature("compactdefaultargs") MakeVectorWithMagnitude2d;
		%feature("autodoc", "
Parameters
----------
SV: StepGeom_Vector

Return
-------
opencascade::handle<Geom2d_VectorWithMagnitude>

Description
-----------
No available documentation.
") MakeVectorWithMagnitude2d;
		static opencascade::handle<Geom2d_VectorWithMagnitude> MakeVectorWithMagnitude2d(const opencascade::handle<StepGeom_Vector> & SV);

		/****************** MakeYprRotation ******************/
		/**** md5 signature: de9dc847a92c9949d29654e63b9eb686 ****/
		%feature("compactdefaultargs") MakeYprRotation;
		%feature("autodoc", "
Parameters
----------
SR: StepKinematics_SpatialRotation
theCntxt: StepRepr_GlobalUnitAssignedContext

Return
-------
opencascade::handle<TColStd_HArray1OfReal>

Description
-----------
No available documentation.
") MakeYprRotation;
		static opencascade::handle<TColStd_HArray1OfReal> MakeYprRotation(const StepKinematics_SpatialRotation & SR, const opencascade::handle<StepRepr_GlobalUnitAssignedContext> & theCntxt);

};


%extend StepToGeom {
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
/* deprecated methods */
%pythoncode {
@deprecated
def steptogeom_MakeAxis1Placement(*args):
	return steptogeom.MakeAxis1Placement(*args)

@deprecated
def steptogeom_MakeAxis2Placement(*args):
	return steptogeom.MakeAxis2Placement(*args)

@deprecated
def steptogeom_MakeAxis2Placement(*args):
	return steptogeom.MakeAxis2Placement(*args)

@deprecated
def steptogeom_MakeAxisPlacement(*args):
	return steptogeom.MakeAxisPlacement(*args)

@deprecated
def steptogeom_MakeBSplineCurve(*args):
	return steptogeom.MakeBSplineCurve(*args)

@deprecated
def steptogeom_MakeBSplineCurve2d(*args):
	return steptogeom.MakeBSplineCurve2d(*args)

@deprecated
def steptogeom_MakeBSplineSurface(*args):
	return steptogeom.MakeBSplineSurface(*args)

@deprecated
def steptogeom_MakeBoundedCurve(*args):
	return steptogeom.MakeBoundedCurve(*args)

@deprecated
def steptogeom_MakeBoundedCurve2d(*args):
	return steptogeom.MakeBoundedCurve2d(*args)

@deprecated
def steptogeom_MakeBoundedSurface(*args):
	return steptogeom.MakeBoundedSurface(*args)

@deprecated
def steptogeom_MakeCartesianPoint(*args):
	return steptogeom.MakeCartesianPoint(*args)

@deprecated
def steptogeom_MakeCartesianPoint2d(*args):
	return steptogeom.MakeCartesianPoint2d(*args)

@deprecated
def steptogeom_MakeCircle(*args):
	return steptogeom.MakeCircle(*args)

@deprecated
def steptogeom_MakeCircle2d(*args):
	return steptogeom.MakeCircle2d(*args)

@deprecated
def steptogeom_MakeConic(*args):
	return steptogeom.MakeConic(*args)

@deprecated
def steptogeom_MakeConic2d(*args):
	return steptogeom.MakeConic2d(*args)

@deprecated
def steptogeom_MakeConicalSurface(*args):
	return steptogeom.MakeConicalSurface(*args)

@deprecated
def steptogeom_MakeCurve(*args):
	return steptogeom.MakeCurve(*args)

@deprecated
def steptogeom_MakeCurve2d(*args):
	return steptogeom.MakeCurve2d(*args)

@deprecated
def steptogeom_MakeCylindricalSurface(*args):
	return steptogeom.MakeCylindricalSurface(*args)

@deprecated
def steptogeom_MakeDirection(*args):
	return steptogeom.MakeDirection(*args)

@deprecated
def steptogeom_MakeDirection2d(*args):
	return steptogeom.MakeDirection2d(*args)

@deprecated
def steptogeom_MakeElementarySurface(*args):
	return steptogeom.MakeElementarySurface(*args)

@deprecated
def steptogeom_MakeEllipse(*args):
	return steptogeom.MakeEllipse(*args)

@deprecated
def steptogeom_MakeEllipse2d(*args):
	return steptogeom.MakeEllipse2d(*args)

@deprecated
def steptogeom_MakeHyperbola(*args):
	return steptogeom.MakeHyperbola(*args)

@deprecated
def steptogeom_MakeHyperbola2d(*args):
	return steptogeom.MakeHyperbola2d(*args)

@deprecated
def steptogeom_MakeLine(*args):
	return steptogeom.MakeLine(*args)

@deprecated
def steptogeom_MakeLine2d(*args):
	return steptogeom.MakeLine2d(*args)

@deprecated
def steptogeom_MakeParabola(*args):
	return steptogeom.MakeParabola(*args)

@deprecated
def steptogeom_MakeParabola2d(*args):
	return steptogeom.MakeParabola2d(*args)

@deprecated
def steptogeom_MakePlane(*args):
	return steptogeom.MakePlane(*args)

@deprecated
def steptogeom_MakePolyline(*args):
	return steptogeom.MakePolyline(*args)

@deprecated
def steptogeom_MakePolyline2d(*args):
	return steptogeom.MakePolyline2d(*args)

@deprecated
def steptogeom_MakeRectangularTrimmedSurface(*args):
	return steptogeom.MakeRectangularTrimmedSurface(*args)

@deprecated
def steptogeom_MakeSphericalSurface(*args):
	return steptogeom.MakeSphericalSurface(*args)

@deprecated
def steptogeom_MakeSurface(*args):
	return steptogeom.MakeSurface(*args)

@deprecated
def steptogeom_MakeSurfaceOfLinearExtrusion(*args):
	return steptogeom.MakeSurfaceOfLinearExtrusion(*args)

@deprecated
def steptogeom_MakeSurfaceOfRevolution(*args):
	return steptogeom.MakeSurfaceOfRevolution(*args)

@deprecated
def steptogeom_MakeSweptSurface(*args):
	return steptogeom.MakeSweptSurface(*args)

@deprecated
def steptogeom_MakeToroidalSurface(*args):
	return steptogeom.MakeToroidalSurface(*args)

@deprecated
def steptogeom_MakeTransformation2d(*args):
	return steptogeom.MakeTransformation2d(*args)

@deprecated
def steptogeom_MakeTransformation3d(*args):
	return steptogeom.MakeTransformation3d(*args)

@deprecated
def steptogeom_MakeTrimmedCurve(*args):
	return steptogeom.MakeTrimmedCurve(*args)

@deprecated
def steptogeom_MakeTrimmedCurve2d(*args):
	return steptogeom.MakeTrimmedCurve2d(*args)

@deprecated
def steptogeom_MakeVectorWithMagnitude(*args):
	return steptogeom.MakeVectorWithMagnitude(*args)

@deprecated
def steptogeom_MakeVectorWithMagnitude2d(*args):
	return steptogeom.MakeVectorWithMagnitude2d(*args)

@deprecated
def steptogeom_MakeYprRotation(*args):
	return steptogeom.MakeYprRotation(*args)

}
