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
%define GEOMABSDOCSTRING
"GeomAbs module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_geomabs.html"
%enddef
%module (package="OCC.Core", docstring=GEOMABSDOCSTRING) GeomAbs


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
#include<GeomAbs_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
enum GeomAbs_IsoType {
	GeomAbs_IsoU = 0,
	GeomAbs_IsoV = 1,
	GeomAbs_NoneIso = 2,
};

enum GeomAbs_JoinType {
	GeomAbs_Arc = 0,
	GeomAbs_Tangent = 1,
	GeomAbs_Intersection = 2,
};

enum GeomAbs_SurfaceType {
	GeomAbs_Plane = 0,
	GeomAbs_Cylinder = 1,
	GeomAbs_Cone = 2,
	GeomAbs_Sphere = 3,
	GeomAbs_Torus = 4,
	GeomAbs_BezierSurface = 5,
	GeomAbs_BSplineSurface = 6,
	GeomAbs_SurfaceOfRevolution = 7,
	GeomAbs_SurfaceOfExtrusion = 8,
	GeomAbs_OffsetSurface = 9,
	GeomAbs_OtherSurface = 10,
};

enum GeomAbs_CurveType {
	GeomAbs_Line = 0,
	GeomAbs_Circle = 1,
	GeomAbs_Ellipse = 2,
	GeomAbs_Hyperbola = 3,
	GeomAbs_Parabola = 4,
	GeomAbs_BezierCurve = 5,
	GeomAbs_BSplineCurve = 6,
	GeomAbs_OffsetCurve = 7,
	GeomAbs_OtherCurve = 8,
};

enum GeomAbs_SurfaceForm {
	GeomAbs_PlanarForm = 0,
	GeomAbs_ConicalForm = 1,
	GeomAbs_CylindricalForm = 2,
	GeomAbs_ToroidalForm = 3,
	GeomAbs_SphericalForm = 4,
	GeomAbs_RevolutionForm = 5,
	GeomAbs_RuledForm = 6,
	GeomAbs_QuadricForm = 7,
	GeomAbs_OtherSurfaceForm = 8,
};

enum GeomAbs_Shape {
	GeomAbs_C0 = 0,
	GeomAbs_G1 = 1,
	GeomAbs_C1 = 2,
	GeomAbs_G2 = 3,
	GeomAbs_C2 = 4,
	GeomAbs_C3 = 5,
	GeomAbs_CN = 6,
};

enum GeomAbs_BSplKnotDistribution {
	GeomAbs_NonUniform = 0,
	GeomAbs_Uniform = 1,
	GeomAbs_QuasiUniform = 2,
	GeomAbs_PiecewiseBezier = 3,
};

enum GeomAbs_CurveForm {
	GeomAbs_PolylineForm = 0,
	GeomAbs_CircularForm = 1,
	GeomAbs_EllipticForm = 2,
	GeomAbs_HyperbolicForm = 3,
	GeomAbs_ParabolicForm = 4,
	GeomAbs_OtherCurveForm = 5,
};

enum GeomAbs_UVSense {
	GeomAbs_SameUV = 0,
	GeomAbs_SameU = 1,
	GeomAbs_SameV = 2,
	GeomAbs_OppositeUV = 3,
};

/* end public enums declaration */

/* python proy classes for enums */
%pythoncode {

class GeomAbs_IsoType(IntEnum):
	GeomAbs_IsoU = 0
	GeomAbs_IsoV = 1
	GeomAbs_NoneIso = 2
GeomAbs_IsoU = GeomAbs_IsoType.GeomAbs_IsoU
GeomAbs_IsoV = GeomAbs_IsoType.GeomAbs_IsoV
GeomAbs_NoneIso = GeomAbs_IsoType.GeomAbs_NoneIso

class GeomAbs_JoinType(IntEnum):
	GeomAbs_Arc = 0
	GeomAbs_Tangent = 1
	GeomAbs_Intersection = 2
GeomAbs_Arc = GeomAbs_JoinType.GeomAbs_Arc
GeomAbs_Tangent = GeomAbs_JoinType.GeomAbs_Tangent
GeomAbs_Intersection = GeomAbs_JoinType.GeomAbs_Intersection

class GeomAbs_SurfaceType(IntEnum):
	GeomAbs_Plane = 0
	GeomAbs_Cylinder = 1
	GeomAbs_Cone = 2
	GeomAbs_Sphere = 3
	GeomAbs_Torus = 4
	GeomAbs_BezierSurface = 5
	GeomAbs_BSplineSurface = 6
	GeomAbs_SurfaceOfRevolution = 7
	GeomAbs_SurfaceOfExtrusion = 8
	GeomAbs_OffsetSurface = 9
	GeomAbs_OtherSurface = 10
GeomAbs_Plane = GeomAbs_SurfaceType.GeomAbs_Plane
GeomAbs_Cylinder = GeomAbs_SurfaceType.GeomAbs_Cylinder
GeomAbs_Cone = GeomAbs_SurfaceType.GeomAbs_Cone
GeomAbs_Sphere = GeomAbs_SurfaceType.GeomAbs_Sphere
GeomAbs_Torus = GeomAbs_SurfaceType.GeomAbs_Torus
GeomAbs_BezierSurface = GeomAbs_SurfaceType.GeomAbs_BezierSurface
GeomAbs_BSplineSurface = GeomAbs_SurfaceType.GeomAbs_BSplineSurface
GeomAbs_SurfaceOfRevolution = GeomAbs_SurfaceType.GeomAbs_SurfaceOfRevolution
GeomAbs_SurfaceOfExtrusion = GeomAbs_SurfaceType.GeomAbs_SurfaceOfExtrusion
GeomAbs_OffsetSurface = GeomAbs_SurfaceType.GeomAbs_OffsetSurface
GeomAbs_OtherSurface = GeomAbs_SurfaceType.GeomAbs_OtherSurface

class GeomAbs_CurveType(IntEnum):
	GeomAbs_Line = 0
	GeomAbs_Circle = 1
	GeomAbs_Ellipse = 2
	GeomAbs_Hyperbola = 3
	GeomAbs_Parabola = 4
	GeomAbs_BezierCurve = 5
	GeomAbs_BSplineCurve = 6
	GeomAbs_OffsetCurve = 7
	GeomAbs_OtherCurve = 8
GeomAbs_Line = GeomAbs_CurveType.GeomAbs_Line
GeomAbs_Circle = GeomAbs_CurveType.GeomAbs_Circle
GeomAbs_Ellipse = GeomAbs_CurveType.GeomAbs_Ellipse
GeomAbs_Hyperbola = GeomAbs_CurveType.GeomAbs_Hyperbola
GeomAbs_Parabola = GeomAbs_CurveType.GeomAbs_Parabola
GeomAbs_BezierCurve = GeomAbs_CurveType.GeomAbs_BezierCurve
GeomAbs_BSplineCurve = GeomAbs_CurveType.GeomAbs_BSplineCurve
GeomAbs_OffsetCurve = GeomAbs_CurveType.GeomAbs_OffsetCurve
GeomAbs_OtherCurve = GeomAbs_CurveType.GeomAbs_OtherCurve

class GeomAbs_SurfaceForm(IntEnum):
	GeomAbs_PlanarForm = 0
	GeomAbs_ConicalForm = 1
	GeomAbs_CylindricalForm = 2
	GeomAbs_ToroidalForm = 3
	GeomAbs_SphericalForm = 4
	GeomAbs_RevolutionForm = 5
	GeomAbs_RuledForm = 6
	GeomAbs_QuadricForm = 7
	GeomAbs_OtherSurfaceForm = 8
GeomAbs_PlanarForm = GeomAbs_SurfaceForm.GeomAbs_PlanarForm
GeomAbs_ConicalForm = GeomAbs_SurfaceForm.GeomAbs_ConicalForm
GeomAbs_CylindricalForm = GeomAbs_SurfaceForm.GeomAbs_CylindricalForm
GeomAbs_ToroidalForm = GeomAbs_SurfaceForm.GeomAbs_ToroidalForm
GeomAbs_SphericalForm = GeomAbs_SurfaceForm.GeomAbs_SphericalForm
GeomAbs_RevolutionForm = GeomAbs_SurfaceForm.GeomAbs_RevolutionForm
GeomAbs_RuledForm = GeomAbs_SurfaceForm.GeomAbs_RuledForm
GeomAbs_QuadricForm = GeomAbs_SurfaceForm.GeomAbs_QuadricForm
GeomAbs_OtherSurfaceForm = GeomAbs_SurfaceForm.GeomAbs_OtherSurfaceForm

class GeomAbs_Shape(IntEnum):
	GeomAbs_C0 = 0
	GeomAbs_G1 = 1
	GeomAbs_C1 = 2
	GeomAbs_G2 = 3
	GeomAbs_C2 = 4
	GeomAbs_C3 = 5
	GeomAbs_CN = 6
GeomAbs_C0 = GeomAbs_Shape.GeomAbs_C0
GeomAbs_G1 = GeomAbs_Shape.GeomAbs_G1
GeomAbs_C1 = GeomAbs_Shape.GeomAbs_C1
GeomAbs_G2 = GeomAbs_Shape.GeomAbs_G2
GeomAbs_C2 = GeomAbs_Shape.GeomAbs_C2
GeomAbs_C3 = GeomAbs_Shape.GeomAbs_C3
GeomAbs_CN = GeomAbs_Shape.GeomAbs_CN

class GeomAbs_BSplKnotDistribution(IntEnum):
	GeomAbs_NonUniform = 0
	GeomAbs_Uniform = 1
	GeomAbs_QuasiUniform = 2
	GeomAbs_PiecewiseBezier = 3
GeomAbs_NonUniform = GeomAbs_BSplKnotDistribution.GeomAbs_NonUniform
GeomAbs_Uniform = GeomAbs_BSplKnotDistribution.GeomAbs_Uniform
GeomAbs_QuasiUniform = GeomAbs_BSplKnotDistribution.GeomAbs_QuasiUniform
GeomAbs_PiecewiseBezier = GeomAbs_BSplKnotDistribution.GeomAbs_PiecewiseBezier

class GeomAbs_CurveForm(IntEnum):
	GeomAbs_PolylineForm = 0
	GeomAbs_CircularForm = 1
	GeomAbs_EllipticForm = 2
	GeomAbs_HyperbolicForm = 3
	GeomAbs_ParabolicForm = 4
	GeomAbs_OtherCurveForm = 5
GeomAbs_PolylineForm = GeomAbs_CurveForm.GeomAbs_PolylineForm
GeomAbs_CircularForm = GeomAbs_CurveForm.GeomAbs_CircularForm
GeomAbs_EllipticForm = GeomAbs_CurveForm.GeomAbs_EllipticForm
GeomAbs_HyperbolicForm = GeomAbs_CurveForm.GeomAbs_HyperbolicForm
GeomAbs_ParabolicForm = GeomAbs_CurveForm.GeomAbs_ParabolicForm
GeomAbs_OtherCurveForm = GeomAbs_CurveForm.GeomAbs_OtherCurveForm

class GeomAbs_UVSense(IntEnum):
	GeomAbs_SameUV = 0
	GeomAbs_SameU = 1
	GeomAbs_SameV = 2
	GeomAbs_OppositeUV = 3
GeomAbs_SameUV = GeomAbs_UVSense.GeomAbs_SameUV
GeomAbs_SameU = GeomAbs_UVSense.GeomAbs_SameU
GeomAbs_SameV = GeomAbs_UVSense.GeomAbs_SameV
GeomAbs_OppositeUV = GeomAbs_UVSense.GeomAbs_OppositeUV
};
/* end python proxy for enums */

/* handles */
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
