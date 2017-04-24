/*
Copyright 2008-2017 Thomas Paviot (tpaviot@gmail.com)


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
%module (package="OCC") GeomAbs

#pragma SWIG nowarn=504,325,503

%{
#ifdef WNT
#pragma warning(disable : 4716)
#endif
%}

%include ../common/CommonIncludes.i
%include ../common/ExceptionCatcher.i
%include ../common/FunctionTransformers.i
%include ../common/Operators.i


%include GeomAbs_headers.i


%pythoncode {
def register_handle(handle, base_object):
    """
    Inserts the handle into the base object to
    prevent memory corruption in certain cases
    """
    try:
        if base_object.IsKind("Standard_Transient"):
            base_object.thisHandle = handle
            base_object.thisown = False
    except:
        pass
};

/* typedefs */
/* end typedefs declaration */

/* public enums */
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

enum GeomAbs_CurveType {
	GeomAbs_Line = 0,
	GeomAbs_Circle = 1,
	GeomAbs_Ellipse = 2,
	GeomAbs_Hyperbola = 3,
	GeomAbs_Parabola = 4,
	GeomAbs_BezierCurve = 5,
	GeomAbs_BSplineCurve = 6,
	GeomAbs_OtherCurve = 7,
};

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

enum GeomAbs_Shape {
	GeomAbs_C0 = 0,
	GeomAbs_G1 = 1,
	GeomAbs_C1 = 2,
	GeomAbs_G2 = 3,
	GeomAbs_C2 = 4,
	GeomAbs_C3 = 5,
	GeomAbs_CN = 6,
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

enum GeomAbs_UVSense {
	GeomAbs_SameUV = 0,
	GeomAbs_SameU = 1,
	GeomAbs_SameV = 2,
	GeomAbs_OppositeUV = 3,
};

/* end public enums declaration */

