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
%define STEPTOGEOMDOCSTRING
"StepToGeom module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_steptogeom.html"
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
%include ../common/Operators.i
%include ../common/OccHandle.i


%{
#include<StepToGeom_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<StepGeom_module.hxx>
#include<Geom_module.hxx>
#include<Geom2d_module.hxx>
#include<gp_module.hxx>
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
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import StepGeom.i
%import Geom.i
%import Geom2d.i
%import gp.i

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

/*******************
* class StepToGeom *
*******************/
%rename(steptogeom) StepToGeom;
class StepToGeom {
	public:
		/****************** MakeAxis1Placement ******************/
		/**** md5 signature: a96aa4bc70227c9ea1cddd173f31935d ****/
		%feature("compactdefaultargs") MakeAxis1Placement;
		%feature("autodoc", "No available documentation.

Parameters
----------
SA: StepGeom_Axis1Placement

Returns
-------
opencascade::handle<Geom_Axis1Placement>
") MakeAxis1Placement;
		static opencascade::handle<Geom_Axis1Placement> MakeAxis1Placement(const opencascade::handle<StepGeom_Axis1Placement> & SA);

		/****************** MakeAxis2Placement ******************/
		/**** md5 signature: 8f166a7e0f928b6f30487bcc8e33c612 ****/
		%feature("compactdefaultargs") MakeAxis2Placement;
		%feature("autodoc", "No available documentation.

Parameters
----------
SA: StepGeom_Axis2Placement3d

Returns
-------
opencascade::handle<Geom_Axis2Placement>
") MakeAxis2Placement;
		static opencascade::handle<Geom_Axis2Placement> MakeAxis2Placement(const opencascade::handle<StepGeom_Axis2Placement3d> & SA);

		/****************** MakeAxisPlacement ******************/
		/**** md5 signature: afd550d9a29a4881d24f34abb414ecdb ****/
		%feature("compactdefaultargs") MakeAxisPlacement;
		%feature("autodoc", "No available documentation.

Parameters
----------
SA: StepGeom_Axis2Placement2d

Returns
-------
opencascade::handle<Geom2d_AxisPlacement>
") MakeAxisPlacement;
		static opencascade::handle<Geom2d_AxisPlacement> MakeAxisPlacement(const opencascade::handle<StepGeom_Axis2Placement2d> & SA);

		/****************** MakeBSplineCurve ******************/
		/**** md5 signature: 9a9b11b7d99fbf6e3063833922cb7141 ****/
		%feature("compactdefaultargs") MakeBSplineCurve;
		%feature("autodoc", "No available documentation.

Parameters
----------
SC: StepGeom_BSplineCurve

Returns
-------
opencascade::handle<Geom_BSplineCurve>
") MakeBSplineCurve;
		static opencascade::handle<Geom_BSplineCurve> MakeBSplineCurve(const opencascade::handle<StepGeom_BSplineCurve> & SC);

		/****************** MakeBSplineCurve2d ******************/
		/**** md5 signature: 814eb299f6585206f867dc6d83717227 ****/
		%feature("compactdefaultargs") MakeBSplineCurve2d;
		%feature("autodoc", "No available documentation.

Parameters
----------
SC: StepGeom_BSplineCurve

Returns
-------
opencascade::handle<Geom2d_BSplineCurve>
") MakeBSplineCurve2d;
		static opencascade::handle<Geom2d_BSplineCurve> MakeBSplineCurve2d(const opencascade::handle<StepGeom_BSplineCurve> & SC);

		/****************** MakeBSplineSurface ******************/
		/**** md5 signature: dc86bf0966692b7b0ffc5b981ea6d4bd ****/
		%feature("compactdefaultargs") MakeBSplineSurface;
		%feature("autodoc", "No available documentation.

Parameters
----------
SS: StepGeom_BSplineSurface

Returns
-------
opencascade::handle<Geom_BSplineSurface>
") MakeBSplineSurface;
		static opencascade::handle<Geom_BSplineSurface> MakeBSplineSurface(const opencascade::handle<StepGeom_BSplineSurface> & SS);

		/****************** MakeBoundedCurve ******************/
		/**** md5 signature: efae8f5f62b6510a0b4d09ee4f54a4e7 ****/
		%feature("compactdefaultargs") MakeBoundedCurve;
		%feature("autodoc", "No available documentation.

Parameters
----------
SC: StepGeom_BoundedCurve

Returns
-------
opencascade::handle<Geom_BoundedCurve>
") MakeBoundedCurve;
		static opencascade::handle<Geom_BoundedCurve> MakeBoundedCurve(const opencascade::handle<StepGeom_BoundedCurve> & SC);

		/****************** MakeBoundedCurve2d ******************/
		/**** md5 signature: 7032ff5091576eb1776981c40165d89a ****/
		%feature("compactdefaultargs") MakeBoundedCurve2d;
		%feature("autodoc", "No available documentation.

Parameters
----------
SC: StepGeom_BoundedCurve

Returns
-------
opencascade::handle<Geom2d_BoundedCurve>
") MakeBoundedCurve2d;
		static opencascade::handle<Geom2d_BoundedCurve> MakeBoundedCurve2d(const opencascade::handle<StepGeom_BoundedCurve> & SC);

		/****************** MakeBoundedSurface ******************/
		/**** md5 signature: cfe1ae188901288c5dce944765df2b68 ****/
		%feature("compactdefaultargs") MakeBoundedSurface;
		%feature("autodoc", "No available documentation.

Parameters
----------
SS: StepGeom_BoundedSurface

Returns
-------
opencascade::handle<Geom_BoundedSurface>
") MakeBoundedSurface;
		static opencascade::handle<Geom_BoundedSurface> MakeBoundedSurface(const opencascade::handle<StepGeom_BoundedSurface> & SS);

		/****************** MakeCartesianPoint ******************/
		/**** md5 signature: f24884777489f54489007c7a935bdd5c ****/
		%feature("compactdefaultargs") MakeCartesianPoint;
		%feature("autodoc", "No available documentation.

Parameters
----------
SP: StepGeom_CartesianPoint

Returns
-------
opencascade::handle<Geom_CartesianPoint>
") MakeCartesianPoint;
		static opencascade::handle<Geom_CartesianPoint> MakeCartesianPoint(const opencascade::handle<StepGeom_CartesianPoint> & SP);

		/****************** MakeCartesianPoint2d ******************/
		/**** md5 signature: 7683fea1c2dccd2b7e8c49fee8bb9093 ****/
		%feature("compactdefaultargs") MakeCartesianPoint2d;
		%feature("autodoc", "No available documentation.

Parameters
----------
SP: StepGeom_CartesianPoint

Returns
-------
opencascade::handle<Geom2d_CartesianPoint>
") MakeCartesianPoint2d;
		static opencascade::handle<Geom2d_CartesianPoint> MakeCartesianPoint2d(const opencascade::handle<StepGeom_CartesianPoint> & SP);

		/****************** MakeCircle ******************/
		/**** md5 signature: 9205da16eaf6a485e3c23b38f0ff9b4d ****/
		%feature("compactdefaultargs") MakeCircle;
		%feature("autodoc", "No available documentation.

Parameters
----------
SC: StepGeom_Circle

Returns
-------
opencascade::handle<Geom_Circle>
") MakeCircle;
		static opencascade::handle<Geom_Circle> MakeCircle(const opencascade::handle<StepGeom_Circle> & SC);

		/****************** MakeCircle2d ******************/
		/**** md5 signature: 43f70cfec90d8dd9887caf547554d612 ****/
		%feature("compactdefaultargs") MakeCircle2d;
		%feature("autodoc", "No available documentation.

Parameters
----------
SC: StepGeom_Circle

Returns
-------
opencascade::handle<Geom2d_Circle>
") MakeCircle2d;
		static opencascade::handle<Geom2d_Circle> MakeCircle2d(const opencascade::handle<StepGeom_Circle> & SC);

		/****************** MakeConic ******************/
		/**** md5 signature: c1f678a4b00bd5525e8c2afd9eb7797e ****/
		%feature("compactdefaultargs") MakeConic;
		%feature("autodoc", "No available documentation.

Parameters
----------
SC: StepGeom_Conic

Returns
-------
opencascade::handle<Geom_Conic>
") MakeConic;
		static opencascade::handle<Geom_Conic> MakeConic(const opencascade::handle<StepGeom_Conic> & SC);

		/****************** MakeConic2d ******************/
		/**** md5 signature: f210fc4a4478acd037560da08a72f15a ****/
		%feature("compactdefaultargs") MakeConic2d;
		%feature("autodoc", "No available documentation.

Parameters
----------
SC: StepGeom_Conic

Returns
-------
opencascade::handle<Geom2d_Conic>
") MakeConic2d;
		static opencascade::handle<Geom2d_Conic> MakeConic2d(const opencascade::handle<StepGeom_Conic> & SC);

		/****************** MakeConicalSurface ******************/
		/**** md5 signature: 62c83d77db2ac7a7fa8bc5d9d97d28e9 ****/
		%feature("compactdefaultargs") MakeConicalSurface;
		%feature("autodoc", "No available documentation.

Parameters
----------
SS: StepGeom_ConicalSurface

Returns
-------
opencascade::handle<Geom_ConicalSurface>
") MakeConicalSurface;
		static opencascade::handle<Geom_ConicalSurface> MakeConicalSurface(const opencascade::handle<StepGeom_ConicalSurface> & SS);

		/****************** MakeCurve ******************/
		/**** md5 signature: 747968dd43ff41a2a01648875ee5816d ****/
		%feature("compactdefaultargs") MakeCurve;
		%feature("autodoc", "No available documentation.

Parameters
----------
SC: StepGeom_Curve

Returns
-------
opencascade::handle<Geom_Curve>
") MakeCurve;
		static opencascade::handle<Geom_Curve> MakeCurve(const opencascade::handle<StepGeom_Curve> & SC);

		/****************** MakeCurve2d ******************/
		/**** md5 signature: def8765aa7d9e4b22e8f4e04ac8ede33 ****/
		%feature("compactdefaultargs") MakeCurve2d;
		%feature("autodoc", "No available documentation.

Parameters
----------
SC: StepGeom_Curve

Returns
-------
opencascade::handle<Geom2d_Curve>
") MakeCurve2d;
		static opencascade::handle<Geom2d_Curve> MakeCurve2d(const opencascade::handle<StepGeom_Curve> & SC);

		/****************** MakeCylindricalSurface ******************/
		/**** md5 signature: a5af7c7b4f2202a4e536bbdacace19e3 ****/
		%feature("compactdefaultargs") MakeCylindricalSurface;
		%feature("autodoc", "No available documentation.

Parameters
----------
SS: StepGeom_CylindricalSurface

Returns
-------
opencascade::handle<Geom_CylindricalSurface>
") MakeCylindricalSurface;
		static opencascade::handle<Geom_CylindricalSurface> MakeCylindricalSurface(const opencascade::handle<StepGeom_CylindricalSurface> & SS);

		/****************** MakeDirection ******************/
		/**** md5 signature: ab447b404195ec0d7870691bec92b043 ****/
		%feature("compactdefaultargs") MakeDirection;
		%feature("autodoc", "No available documentation.

Parameters
----------
SD: StepGeom_Direction

Returns
-------
opencascade::handle<Geom_Direction>
") MakeDirection;
		static opencascade::handle<Geom_Direction> MakeDirection(const opencascade::handle<StepGeom_Direction> & SD);

		/****************** MakeDirection2d ******************/
		/**** md5 signature: 8bf8a7b40255be99f58f3af845adeaad ****/
		%feature("compactdefaultargs") MakeDirection2d;
		%feature("autodoc", "No available documentation.

Parameters
----------
SD: StepGeom_Direction

Returns
-------
opencascade::handle<Geom2d_Direction>
") MakeDirection2d;
		static opencascade::handle<Geom2d_Direction> MakeDirection2d(const opencascade::handle<StepGeom_Direction> & SD);

		/****************** MakeElementarySurface ******************/
		/**** md5 signature: 91b4251d02d9bef4498c1cfc36e20f4e ****/
		%feature("compactdefaultargs") MakeElementarySurface;
		%feature("autodoc", "No available documentation.

Parameters
----------
SS: StepGeom_ElementarySurface

Returns
-------
opencascade::handle<Geom_ElementarySurface>
") MakeElementarySurface;
		static opencascade::handle<Geom_ElementarySurface> MakeElementarySurface(const opencascade::handle<StepGeom_ElementarySurface> & SS);

		/****************** MakeEllipse ******************/
		/**** md5 signature: c81f700bd3ee7056c644408e44479697 ****/
		%feature("compactdefaultargs") MakeEllipse;
		%feature("autodoc", "No available documentation.

Parameters
----------
SC: StepGeom_Ellipse

Returns
-------
opencascade::handle<Geom_Ellipse>
") MakeEllipse;
		static opencascade::handle<Geom_Ellipse> MakeEllipse(const opencascade::handle<StepGeom_Ellipse> & SC);

		/****************** MakeEllipse2d ******************/
		/**** md5 signature: 0257d76c958fe487f030fe591467aa77 ****/
		%feature("compactdefaultargs") MakeEllipse2d;
		%feature("autodoc", "No available documentation.

Parameters
----------
SC: StepGeom_Ellipse

Returns
-------
opencascade::handle<Geom2d_Ellipse>
") MakeEllipse2d;
		static opencascade::handle<Geom2d_Ellipse> MakeEllipse2d(const opencascade::handle<StepGeom_Ellipse> & SC);

		/****************** MakeHyperbola ******************/
		/**** md5 signature: 3951f2230b12620c1de0113856c15ba1 ****/
		%feature("compactdefaultargs") MakeHyperbola;
		%feature("autodoc", "No available documentation.

Parameters
----------
SC: StepGeom_Hyperbola

Returns
-------
opencascade::handle<Geom_Hyperbola>
") MakeHyperbola;
		static opencascade::handle<Geom_Hyperbola> MakeHyperbola(const opencascade::handle<StepGeom_Hyperbola> & SC);

		/****************** MakeHyperbola2d ******************/
		/**** md5 signature: 776475b05a3f1eb5fdf5c45c9ea4cf56 ****/
		%feature("compactdefaultargs") MakeHyperbola2d;
		%feature("autodoc", "No available documentation.

Parameters
----------
SC: StepGeom_Hyperbola

Returns
-------
opencascade::handle<Geom2d_Hyperbola>
") MakeHyperbola2d;
		static opencascade::handle<Geom2d_Hyperbola> MakeHyperbola2d(const opencascade::handle<StepGeom_Hyperbola> & SC);

		/****************** MakeLine ******************/
		/**** md5 signature: 18cc33b618e99a527d4df7f6499682eb ****/
		%feature("compactdefaultargs") MakeLine;
		%feature("autodoc", "No available documentation.

Parameters
----------
SC: StepGeom_Line

Returns
-------
opencascade::handle<Geom_Line>
") MakeLine;
		static opencascade::handle<Geom_Line> MakeLine(const opencascade::handle<StepGeom_Line> & SC);

		/****************** MakeLine2d ******************/
		/**** md5 signature: ad06eed62d72ffb25402af8ae7f4fa34 ****/
		%feature("compactdefaultargs") MakeLine2d;
		%feature("autodoc", "No available documentation.

Parameters
----------
SC: StepGeom_Line

Returns
-------
opencascade::handle<Geom2d_Line>
") MakeLine2d;
		static opencascade::handle<Geom2d_Line> MakeLine2d(const opencascade::handle<StepGeom_Line> & SC);

		/****************** MakeParabola ******************/
		/**** md5 signature: 9210ecba4b33f1da203b53f75e44e25e ****/
		%feature("compactdefaultargs") MakeParabola;
		%feature("autodoc", "No available documentation.

Parameters
----------
SC: StepGeom_Parabola

Returns
-------
opencascade::handle<Geom_Parabola>
") MakeParabola;
		static opencascade::handle<Geom_Parabola> MakeParabola(const opencascade::handle<StepGeom_Parabola> & SC);

		/****************** MakeParabola2d ******************/
		/**** md5 signature: 8044641d5463e5dcccee0f00bcaec5ea ****/
		%feature("compactdefaultargs") MakeParabola2d;
		%feature("autodoc", "No available documentation.

Parameters
----------
SC: StepGeom_Parabola

Returns
-------
opencascade::handle<Geom2d_Parabola>
") MakeParabola2d;
		static opencascade::handle<Geom2d_Parabola> MakeParabola2d(const opencascade::handle<StepGeom_Parabola> & SC);

		/****************** MakePlane ******************/
		/**** md5 signature: 41a0d9bba65f3829789fd84df06a6ee3 ****/
		%feature("compactdefaultargs") MakePlane;
		%feature("autodoc", "No available documentation.

Parameters
----------
SP: StepGeom_Plane

Returns
-------
opencascade::handle<Geom_Plane>
") MakePlane;
		static opencascade::handle<Geom_Plane> MakePlane(const opencascade::handle<StepGeom_Plane> & SP);

		/****************** MakePolyline ******************/
		/**** md5 signature: 3d1a362d8925d329d062ccdd7849a602 ****/
		%feature("compactdefaultargs") MakePolyline;
		%feature("autodoc", "No available documentation.

Parameters
----------
SPL: StepGeom_Polyline

Returns
-------
opencascade::handle<Geom_BSplineCurve>
") MakePolyline;
		static opencascade::handle<Geom_BSplineCurve> MakePolyline(const opencascade::handle<StepGeom_Polyline> & SPL);

		/****************** MakePolyline2d ******************/
		/**** md5 signature: 1e0f08bf16d118098589a9cdf7ee196c ****/
		%feature("compactdefaultargs") MakePolyline2d;
		%feature("autodoc", "No available documentation.

Parameters
----------
SPL: StepGeom_Polyline

Returns
-------
opencascade::handle<Geom2d_BSplineCurve>
") MakePolyline2d;
		static opencascade::handle<Geom2d_BSplineCurve> MakePolyline2d(const opencascade::handle<StepGeom_Polyline> & SPL);

		/****************** MakeRectangularTrimmedSurface ******************/
		/**** md5 signature: 3c3269c495ac63566760781ca4f28cf9 ****/
		%feature("compactdefaultargs") MakeRectangularTrimmedSurface;
		%feature("autodoc", "No available documentation.

Parameters
----------
SS: StepGeom_RectangularTrimmedSurface

Returns
-------
opencascade::handle<Geom_RectangularTrimmedSurface>
") MakeRectangularTrimmedSurface;
		static opencascade::handle<Geom_RectangularTrimmedSurface> MakeRectangularTrimmedSurface(const opencascade::handle<StepGeom_RectangularTrimmedSurface> & SS);

		/****************** MakeSphericalSurface ******************/
		/**** md5 signature: 92dc1934765d6b32c4297d8f71cc6ba6 ****/
		%feature("compactdefaultargs") MakeSphericalSurface;
		%feature("autodoc", "No available documentation.

Parameters
----------
SS: StepGeom_SphericalSurface

Returns
-------
opencascade::handle<Geom_SphericalSurface>
") MakeSphericalSurface;
		static opencascade::handle<Geom_SphericalSurface> MakeSphericalSurface(const opencascade::handle<StepGeom_SphericalSurface> & SS);

		/****************** MakeSurface ******************/
		/**** md5 signature: 6216ae7ae092e3ceed6a50efdac18158 ****/
		%feature("compactdefaultargs") MakeSurface;
		%feature("autodoc", "No available documentation.

Parameters
----------
SS: StepGeom_Surface

Returns
-------
opencascade::handle<Geom_Surface>
") MakeSurface;
		static opencascade::handle<Geom_Surface> MakeSurface(const opencascade::handle<StepGeom_Surface> & SS);

		/****************** MakeSurfaceOfLinearExtrusion ******************/
		/**** md5 signature: 321b0239e71e9980e539e3379d5c7c50 ****/
		%feature("compactdefaultargs") MakeSurfaceOfLinearExtrusion;
		%feature("autodoc", "No available documentation.

Parameters
----------
SS: StepGeom_SurfaceOfLinearExtrusion

Returns
-------
opencascade::handle<Geom_SurfaceOfLinearExtrusion>
") MakeSurfaceOfLinearExtrusion;
		static opencascade::handle<Geom_SurfaceOfLinearExtrusion> MakeSurfaceOfLinearExtrusion(const opencascade::handle<StepGeom_SurfaceOfLinearExtrusion> & SS);

		/****************** MakeSurfaceOfRevolution ******************/
		/**** md5 signature: b9bdba3a57e4c47e0638164fe512ef3c ****/
		%feature("compactdefaultargs") MakeSurfaceOfRevolution;
		%feature("autodoc", "No available documentation.

Parameters
----------
SS: StepGeom_SurfaceOfRevolution

Returns
-------
opencascade::handle<Geom_SurfaceOfRevolution>
") MakeSurfaceOfRevolution;
		static opencascade::handle<Geom_SurfaceOfRevolution> MakeSurfaceOfRevolution(const opencascade::handle<StepGeom_SurfaceOfRevolution> & SS);

		/****************** MakeSweptSurface ******************/
		/**** md5 signature: 5936907695bbea4fd48bf171d57f6392 ****/
		%feature("compactdefaultargs") MakeSweptSurface;
		%feature("autodoc", "No available documentation.

Parameters
----------
SS: StepGeom_SweptSurface

Returns
-------
opencascade::handle<Geom_SweptSurface>
") MakeSweptSurface;
		static opencascade::handle<Geom_SweptSurface> MakeSweptSurface(const opencascade::handle<StepGeom_SweptSurface> & SS);

		/****************** MakeToroidalSurface ******************/
		/**** md5 signature: 5e93604409fda5eb72845c4aa41e56ba ****/
		%feature("compactdefaultargs") MakeToroidalSurface;
		%feature("autodoc", "No available documentation.

Parameters
----------
SS: StepGeom_ToroidalSurface

Returns
-------
opencascade::handle<Geom_ToroidalSurface>
") MakeToroidalSurface;
		static opencascade::handle<Geom_ToroidalSurface> MakeToroidalSurface(const opencascade::handle<StepGeom_ToroidalSurface> & SS);

		/****************** MakeTransformation2d ******************/
		/**** md5 signature: 0b1f5579fe9243d5840ebd173a76f743 ****/
		%feature("compactdefaultargs") MakeTransformation2d;
		%feature("autodoc", "No available documentation.

Parameters
----------
SCTO: StepGeom_CartesianTransformationOperator2d
CT: gp_Trsf2d

Returns
-------
bool
") MakeTransformation2d;
		static Standard_Boolean MakeTransformation2d(const opencascade::handle<StepGeom_CartesianTransformationOperator2d> & SCTO, gp_Trsf2d & CT);

		/****************** MakeTransformation3d ******************/
		/**** md5 signature: 433bf5b3609f5ec9056e2d2ff0f48650 ****/
		%feature("compactdefaultargs") MakeTransformation3d;
		%feature("autodoc", "No available documentation.

Parameters
----------
SCTO: StepGeom_CartesianTransformationOperator3d
CT: gp_Trsf

Returns
-------
bool
") MakeTransformation3d;
		static Standard_Boolean MakeTransformation3d(const opencascade::handle<StepGeom_CartesianTransformationOperator3d> & SCTO, gp_Trsf & CT);

		/****************** MakeTrimmedCurve ******************/
		/**** md5 signature: a32aeca8097519f688fde62e9d052c41 ****/
		%feature("compactdefaultargs") MakeTrimmedCurve;
		%feature("autodoc", "No available documentation.

Parameters
----------
SC: StepGeom_TrimmedCurve

Returns
-------
opencascade::handle<Geom_TrimmedCurve>
") MakeTrimmedCurve;
		static opencascade::handle<Geom_TrimmedCurve> MakeTrimmedCurve(const opencascade::handle<StepGeom_TrimmedCurve> & SC);

		/****************** MakeTrimmedCurve2d ******************/
		/**** md5 signature: ea4eadae596ce1c588c22e4aa18e8e4a ****/
		%feature("compactdefaultargs") MakeTrimmedCurve2d;
		%feature("autodoc", "No available documentation.

Parameters
----------
SC: StepGeom_TrimmedCurve

Returns
-------
opencascade::handle<Geom2d_BSplineCurve>
") MakeTrimmedCurve2d;
		static opencascade::handle<Geom2d_BSplineCurve> MakeTrimmedCurve2d(const opencascade::handle<StepGeom_TrimmedCurve> & SC);

		/****************** MakeVectorWithMagnitude ******************/
		/**** md5 signature: 8f238b3a9c8bf16f1a3e2e0ce9710f28 ****/
		%feature("compactdefaultargs") MakeVectorWithMagnitude;
		%feature("autodoc", "No available documentation.

Parameters
----------
SV: StepGeom_Vector

Returns
-------
opencascade::handle<Geom_VectorWithMagnitude>
") MakeVectorWithMagnitude;
		static opencascade::handle<Geom_VectorWithMagnitude> MakeVectorWithMagnitude(const opencascade::handle<StepGeom_Vector> & SV);

		/****************** MakeVectorWithMagnitude2d ******************/
		/**** md5 signature: 4fb91506f943c82636c09792ad2f9c30 ****/
		%feature("compactdefaultargs") MakeVectorWithMagnitude2d;
		%feature("autodoc", "No available documentation.

Parameters
----------
SV: StepGeom_Vector

Returns
-------
opencascade::handle<Geom2d_VectorWithMagnitude>
") MakeVectorWithMagnitude2d;
		static opencascade::handle<Geom2d_VectorWithMagnitude> MakeVectorWithMagnitude2d(const opencascade::handle<StepGeom_Vector> & SV);

};


%extend StepToGeom {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
