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
%define STEPGEOMDOCSTRING
"StepGeom module, see official documentation at
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_stepgeom.html"
%enddef
%module (package="OCC.Core", docstring=STEPGEOMDOCSTRING) StepGeom


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
#include<StepGeom_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<StepData_module.hxx>
#include<StepRepr_module.hxx>
#include<TCollection_module.hxx>
#include<StepBasic_module.hxx>
#include<TColStd_module.hxx>
#include<MoniTool_module.hxx>
#include<TCollection_module.hxx>
#include<Interface_module.hxx>
#include<StepBasic_module.hxx>
#include<Message_module.hxx>
#include<StepShape_module.hxx>
#include<TopoDS_module.hxx>
#include<Resource_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import StepData.i
%import StepRepr.i
%import TCollection.i
%import StepBasic.i
%import TColStd.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
enum StepGeom_BSplineCurveForm {
	StepGeom_bscfPolylineForm = 0,
	StepGeom_bscfCircularArc = 1,
	StepGeom_bscfEllipticArc = 2,
	StepGeom_bscfParabolicArc = 3,
	StepGeom_bscfHyperbolicArc = 4,
	StepGeom_bscfUnspecified = 5,
};

enum StepGeom_BSplineSurfaceForm {
	StepGeom_bssfPlaneSurf = 0,
	StepGeom_bssfCylindricalSurf = 1,
	StepGeom_bssfConicalSurf = 2,
	StepGeom_bssfSphericalSurf = 3,
	StepGeom_bssfToroidalSurf = 4,
	StepGeom_bssfSurfOfRevolution = 5,
	StepGeom_bssfRuledSurf = 6,
	StepGeom_bssfGeneralisedCone = 7,
	StepGeom_bssfQuadricSurf = 8,
	StepGeom_bssfSurfOfLinearExtrusion = 9,
	StepGeom_bssfUnspecified = 10,
};

enum StepGeom_KnotType {
	StepGeom_ktUniformKnots = 0,
	StepGeom_ktUnspecified = 1,
	StepGeom_ktQuasiUniformKnots = 2,
	StepGeom_ktPiecewiseBezierKnots = 3,
};

enum StepGeom_PreferredSurfaceCurveRepresentation {
	StepGeom_pscrCurve3d = 0,
	StepGeom_pscrPcurveS1 = 1,
	StepGeom_pscrPcurveS2 = 2,
};

enum StepGeom_TransitionCode {
	StepGeom_tcDiscontinuous = 0,
	StepGeom_tcContinuous = 1,
	StepGeom_tcContSameGradient = 2,
	StepGeom_tcContSameGradientSameCurvature = 3,
};

enum StepGeom_TrimmingPreference {
	StepGeom_tpCartesian = 0,
	StepGeom_tpParameter = 1,
	StepGeom_tpUnspecified = 2,
};

/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {

class StepGeom_BSplineCurveForm(IntEnum):
	StepGeom_bscfPolylineForm = 0
	StepGeom_bscfCircularArc = 1
	StepGeom_bscfEllipticArc = 2
	StepGeom_bscfParabolicArc = 3
	StepGeom_bscfHyperbolicArc = 4
	StepGeom_bscfUnspecified = 5
StepGeom_bscfPolylineForm = StepGeom_BSplineCurveForm.StepGeom_bscfPolylineForm
StepGeom_bscfCircularArc = StepGeom_BSplineCurveForm.StepGeom_bscfCircularArc
StepGeom_bscfEllipticArc = StepGeom_BSplineCurveForm.StepGeom_bscfEllipticArc
StepGeom_bscfParabolicArc = StepGeom_BSplineCurveForm.StepGeom_bscfParabolicArc
StepGeom_bscfHyperbolicArc = StepGeom_BSplineCurveForm.StepGeom_bscfHyperbolicArc
StepGeom_bscfUnspecified = StepGeom_BSplineCurveForm.StepGeom_bscfUnspecified

class StepGeom_BSplineSurfaceForm(IntEnum):
	StepGeom_bssfPlaneSurf = 0
	StepGeom_bssfCylindricalSurf = 1
	StepGeom_bssfConicalSurf = 2
	StepGeom_bssfSphericalSurf = 3
	StepGeom_bssfToroidalSurf = 4
	StepGeom_bssfSurfOfRevolution = 5
	StepGeom_bssfRuledSurf = 6
	StepGeom_bssfGeneralisedCone = 7
	StepGeom_bssfQuadricSurf = 8
	StepGeom_bssfSurfOfLinearExtrusion = 9
	StepGeom_bssfUnspecified = 10
StepGeom_bssfPlaneSurf = StepGeom_BSplineSurfaceForm.StepGeom_bssfPlaneSurf
StepGeom_bssfCylindricalSurf = StepGeom_BSplineSurfaceForm.StepGeom_bssfCylindricalSurf
StepGeom_bssfConicalSurf = StepGeom_BSplineSurfaceForm.StepGeom_bssfConicalSurf
StepGeom_bssfSphericalSurf = StepGeom_BSplineSurfaceForm.StepGeom_bssfSphericalSurf
StepGeom_bssfToroidalSurf = StepGeom_BSplineSurfaceForm.StepGeom_bssfToroidalSurf
StepGeom_bssfSurfOfRevolution = StepGeom_BSplineSurfaceForm.StepGeom_bssfSurfOfRevolution
StepGeom_bssfRuledSurf = StepGeom_BSplineSurfaceForm.StepGeom_bssfRuledSurf
StepGeom_bssfGeneralisedCone = StepGeom_BSplineSurfaceForm.StepGeom_bssfGeneralisedCone
StepGeom_bssfQuadricSurf = StepGeom_BSplineSurfaceForm.StepGeom_bssfQuadricSurf
StepGeom_bssfSurfOfLinearExtrusion = StepGeom_BSplineSurfaceForm.StepGeom_bssfSurfOfLinearExtrusion
StepGeom_bssfUnspecified = StepGeom_BSplineSurfaceForm.StepGeom_bssfUnspecified

class StepGeom_KnotType(IntEnum):
	StepGeom_ktUniformKnots = 0
	StepGeom_ktUnspecified = 1
	StepGeom_ktQuasiUniformKnots = 2
	StepGeom_ktPiecewiseBezierKnots = 3
StepGeom_ktUniformKnots = StepGeom_KnotType.StepGeom_ktUniformKnots
StepGeom_ktUnspecified = StepGeom_KnotType.StepGeom_ktUnspecified
StepGeom_ktQuasiUniformKnots = StepGeom_KnotType.StepGeom_ktQuasiUniformKnots
StepGeom_ktPiecewiseBezierKnots = StepGeom_KnotType.StepGeom_ktPiecewiseBezierKnots

class StepGeom_PreferredSurfaceCurveRepresentation(IntEnum):
	StepGeom_pscrCurve3d = 0
	StepGeom_pscrPcurveS1 = 1
	StepGeom_pscrPcurveS2 = 2
StepGeom_pscrCurve3d = StepGeom_PreferredSurfaceCurveRepresentation.StepGeom_pscrCurve3d
StepGeom_pscrPcurveS1 = StepGeom_PreferredSurfaceCurveRepresentation.StepGeom_pscrPcurveS1
StepGeom_pscrPcurveS2 = StepGeom_PreferredSurfaceCurveRepresentation.StepGeom_pscrPcurveS2

class StepGeom_TransitionCode(IntEnum):
	StepGeom_tcDiscontinuous = 0
	StepGeom_tcContinuous = 1
	StepGeom_tcContSameGradient = 2
	StepGeom_tcContSameGradientSameCurvature = 3
StepGeom_tcDiscontinuous = StepGeom_TransitionCode.StepGeom_tcDiscontinuous
StepGeom_tcContinuous = StepGeom_TransitionCode.StepGeom_tcContinuous
StepGeom_tcContSameGradient = StepGeom_TransitionCode.StepGeom_tcContSameGradient
StepGeom_tcContSameGradientSameCurvature = StepGeom_TransitionCode.StepGeom_tcContSameGradientSameCurvature

class StepGeom_TrimmingPreference(IntEnum):
	StepGeom_tpCartesian = 0
	StepGeom_tpParameter = 1
	StepGeom_tpUnspecified = 2
StepGeom_tpCartesian = StepGeom_TrimmingPreference.StepGeom_tpCartesian
StepGeom_tpParameter = StepGeom_TrimmingPreference.StepGeom_tpParameter
StepGeom_tpUnspecified = StepGeom_TrimmingPreference.StepGeom_tpUnspecified
};
/* end python proxy for enums */

/* handles */
%wrap_handle(StepGeom_CompositeCurveSegment)
%wrap_handle(StepGeom_GeomRepContextAndGlobUnitAssCtxAndGlobUncertaintyAssCtx)
%wrap_handle(StepGeom_GeometricRepresentationContext)
%wrap_handle(StepGeom_GeometricRepresentationContextAndGlobalUnitAssignedContext)
%wrap_handle(StepGeom_GeometricRepresentationContextAndParametricRepresentationContext)
%wrap_handle(StepGeom_GeometricRepresentationItem)
%wrap_handle(StepGeom_SurfacePatch)
%wrap_handle(StepGeom_TrimmingMember)
%wrap_handle(StepGeom_CartesianTransformationOperator)
%wrap_handle(StepGeom_Curve)
%wrap_handle(StepGeom_Direction)
%wrap_handle(StepGeom_Placement)
%wrap_handle(StepGeom_Point)
%wrap_handle(StepGeom_ReparametrisedCompositeCurveSegment)
%wrap_handle(StepGeom_SuParameters)
%wrap_handle(StepGeom_Surface)
%wrap_handle(StepGeom_Vector)
%wrap_handle(StepGeom_Axis1Placement)
%wrap_handle(StepGeom_Axis2Placement2d)
%wrap_handle(StepGeom_Axis2Placement3d)
%wrap_handle(StepGeom_BoundedCurve)
%wrap_handle(StepGeom_BoundedSurface)
%wrap_handle(StepGeom_CartesianPoint)
%wrap_handle(StepGeom_CartesianTransformationOperator2d)
%wrap_handle(StepGeom_CartesianTransformationOperator3d)
%wrap_handle(StepGeom_Conic)
%wrap_handle(StepGeom_CurveReplica)
%wrap_handle(StepGeom_DegeneratePcurve)
%wrap_handle(StepGeom_ElementarySurface)
%wrap_handle(StepGeom_Line)
%wrap_handle(StepGeom_OffsetCurve3d)
%wrap_handle(StepGeom_OffsetSurface)
%wrap_handle(StepGeom_OrientedSurface)
%wrap_handle(StepGeom_Pcurve)
%wrap_handle(StepGeom_PointOnCurve)
%wrap_handle(StepGeom_PointOnSurface)
%wrap_handle(StepGeom_PointReplica)
%wrap_handle(StepGeom_SurfaceCurve)
%wrap_handle(StepGeom_SurfaceReplica)
%wrap_handle(StepGeom_SweptSurface)
%wrap_handle(StepGeom_BSplineCurve)
%wrap_handle(StepGeom_BSplineSurface)
%wrap_handle(StepGeom_Circle)
%wrap_handle(StepGeom_CompositeCurve)
%wrap_handle(StepGeom_ConicalSurface)
%wrap_handle(StepGeom_CurveBoundedSurface)
%wrap_handle(StepGeom_CylindricalSurface)
%wrap_handle(StepGeom_Ellipse)
%wrap_handle(StepGeom_EvaluatedDegeneratePcurve)
%wrap_handle(StepGeom_Hyperbola)
%wrap_handle(StepGeom_IntersectionCurve)
%wrap_handle(StepGeom_Parabola)
%wrap_handle(StepGeom_Plane)
%wrap_handle(StepGeom_Polyline)
%wrap_handle(StepGeom_RectangularCompositeSurface)
%wrap_handle(StepGeom_RectangularTrimmedSurface)
%wrap_handle(StepGeom_SeamCurve)
%wrap_handle(StepGeom_SphericalSurface)
%wrap_handle(StepGeom_SurfaceCurveAndBoundedCurve)
%wrap_handle(StepGeom_SurfaceOfLinearExtrusion)
%wrap_handle(StepGeom_SurfaceOfRevolution)
%wrap_handle(StepGeom_ToroidalSurface)
%wrap_handle(StepGeom_TrimmedCurve)
%wrap_handle(StepGeom_BSplineCurveWithKnots)
%wrap_handle(StepGeom_BSplineCurveWithKnotsAndRationalBSplineCurve)
%wrap_handle(StepGeom_BSplineSurfaceWithKnots)
%wrap_handle(StepGeom_BSplineSurfaceWithKnotsAndRationalBSplineSurface)
%wrap_handle(StepGeom_BezierCurve)
%wrap_handle(StepGeom_BezierCurveAndRationalBSplineCurve)
%wrap_handle(StepGeom_BezierSurface)
%wrap_handle(StepGeom_BezierSurfaceAndRationalBSplineSurface)
%wrap_handle(StepGeom_CompositeCurveOnSurface)
%wrap_handle(StepGeom_DegenerateToroidalSurface)
%wrap_handle(StepGeom_QuasiUniformCurve)
%wrap_handle(StepGeom_QuasiUniformCurveAndRationalBSplineCurve)
%wrap_handle(StepGeom_QuasiUniformSurface)
%wrap_handle(StepGeom_QuasiUniformSurfaceAndRationalBSplineSurface)
%wrap_handle(StepGeom_RationalBSplineCurve)
%wrap_handle(StepGeom_RationalBSplineSurface)
%wrap_handle(StepGeom_UniformCurve)
%wrap_handle(StepGeom_UniformCurveAndRationalBSplineCurve)
%wrap_handle(StepGeom_UniformSurface)
%wrap_handle(StepGeom_UniformSurfaceAndRationalBSplineSurface)
%wrap_handle(StepGeom_BoundaryCurve)
%wrap_handle(StepGeom_OuterBoundaryCurve)
/* end handles declaration */

/* templates */
%template(StepGeom_Array1OfBoundaryCurve) NCollection_Array1<opencascade::handle<StepGeom_BoundaryCurve>>;
Array1ExtendIter(opencascade::handle<StepGeom_BoundaryCurve>)

%template(StepGeom_Array1OfCartesianPoint) NCollection_Array1<opencascade::handle<StepGeom_CartesianPoint>>;
Array1ExtendIter(opencascade::handle<StepGeom_CartesianPoint>)

%template(StepGeom_Array1OfCompositeCurveSegment) NCollection_Array1<opencascade::handle<StepGeom_CompositeCurveSegment>>;
Array1ExtendIter(opencascade::handle<StepGeom_CompositeCurveSegment>)

%template(StepGeom_Array1OfCurve) NCollection_Array1<opencascade::handle<StepGeom_Curve>>;
Array1ExtendIter(opencascade::handle<StepGeom_Curve>)

%template(StepGeom_Array1OfPcurveOrSurface) NCollection_Array1<StepGeom_PcurveOrSurface>;
Array1ExtendIter(StepGeom_PcurveOrSurface)

%template(StepGeom_Array1OfSurfaceBoundary) NCollection_Array1<StepGeom_SurfaceBoundary>;
Array1ExtendIter(StepGeom_SurfaceBoundary)

%template(StepGeom_Array1OfTrimmingSelect) NCollection_Array1<StepGeom_TrimmingSelect>;
Array1ExtendIter(StepGeom_TrimmingSelect)

/* end templates declaration */

/* typedefs */
typedef NCollection_Array1<opencascade::handle<StepGeom_BoundaryCurve>> StepGeom_Array1OfBoundaryCurve;
typedef NCollection_Array1<opencascade::handle<StepGeom_CartesianPoint>> StepGeom_Array1OfCartesianPoint;
typedef NCollection_Array1<opencascade::handle<StepGeom_CompositeCurveSegment>> StepGeom_Array1OfCompositeCurveSegment;
typedef NCollection_Array1<opencascade::handle<StepGeom_Curve>> StepGeom_Array1OfCurve;
typedef NCollection_Array1<StepGeom_PcurveOrSurface> StepGeom_Array1OfPcurveOrSurface;
typedef NCollection_Array1<StepGeom_SurfaceBoundary> StepGeom_Array1OfSurfaceBoundary;
typedef NCollection_Array1<StepGeom_TrimmingSelect> StepGeom_Array1OfTrimmingSelect;
typedef NCollection_Array2<opencascade::handle<StepGeom_CartesianPoint>> StepGeom_Array2OfCartesianPoint;
typedef NCollection_Array2<opencascade::handle<StepGeom_SurfacePatch>> StepGeom_Array2OfSurfacePatch;
typedef NCollection_HArray1<opencascade::handle<StepGeom_BoundaryCurve>> StepGeom_HArray1OfBoundaryCurve;
typedef NCollection_HArray1<opencascade::handle<StepGeom_CartesianPoint>> StepGeom_HArray1OfCartesianPoint;
typedef NCollection_HArray1<opencascade::handle<StepGeom_CompositeCurveSegment>> StepGeom_HArray1OfCompositeCurveSegment;
typedef NCollection_HArray1<opencascade::handle<StepGeom_Curve>> StepGeom_HArray1OfCurve;
typedef NCollection_HArray1<StepGeom_PcurveOrSurface> StepGeom_HArray1OfPcurveOrSurface;
typedef NCollection_HArray1<StepGeom_SurfaceBoundary> StepGeom_HArray1OfSurfaceBoundary;
typedef NCollection_HArray1<StepGeom_TrimmingSelect> StepGeom_HArray1OfTrimmingSelect;
typedef NCollection_HArray2<opencascade::handle<StepGeom_CartesianPoint>> StepGeom_HArray2OfCartesianPoint;
typedef NCollection_HArray2<opencascade::handle<StepGeom_SurfacePatch>> StepGeom_HArray2OfSurfacePatch;
/* end typedefs declaration */

/********************************
* class StepGeom_Axis2Placement *
********************************/
class StepGeom_Axis2Placement : public StepData_SelectType {
	public:
		/****** StepGeom_Axis2Placement::StepGeom_Axis2Placement ******/
		/****** md5 signature: 872eba1255b28b4efb26fda855939b32 ******/
		%feature("compactdefaultargs") StepGeom_Axis2Placement;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a Axis2Placement SelectType.
") StepGeom_Axis2Placement;
		 StepGeom_Axis2Placement();

		/****** StepGeom_Axis2Placement::Axis2Placement2d ******/
		/****** md5 signature: 1e2117f9f44693cfba5d5bdae861e60f ******/
		%feature("compactdefaultargs") Axis2Placement2d;
		%feature("autodoc", "Return
-------
opencascade::handle<StepGeom_Axis2Placement2d>

Description
-----------
returns Value as a Axis2Placement2d (Null if another type).
") Axis2Placement2d;
		opencascade::handle<StepGeom_Axis2Placement2d> Axis2Placement2d();

		/****** StepGeom_Axis2Placement::Axis2Placement3d ******/
		/****** md5 signature: c9e96f5e4c0b7eb079fbe3bc135a46fe ******/
		%feature("compactdefaultargs") Axis2Placement3d;
		%feature("autodoc", "Return
-------
opencascade::handle<StepGeom_Axis2Placement3d>

Description
-----------
returns Value as a Axis2Placement3d (Null if another type).
") Axis2Placement3d;
		opencascade::handle<StepGeom_Axis2Placement3d> Axis2Placement3d();

		/****** StepGeom_Axis2Placement::CaseNum ******/
		/****** md5 signature: ef153e98615228b7740a3c1765b8d82b ******/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient

Return
-------
int

Description
-----------
Recognizes a Axis2Placement Kind Entity that is: 1 -> Axis2Placement2d 2 -> Axis2Placement3d 0 else.
") CaseNum;
		int CaseNum(const opencascade::handle<Standard_Transient> & ent);

};


%extend StepGeom_Axis2Placement {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************
* class StepGeom_CompositeCurveSegment *
***************************************/
class StepGeom_CompositeCurveSegment : public Standard_Transient {
	public:
		/****** StepGeom_CompositeCurveSegment::StepGeom_CompositeCurveSegment ******/
		/****** md5 signature: e842f4c7bd06b992b99e0d6204ca456e ******/
		%feature("compactdefaultargs") StepGeom_CompositeCurveSegment;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a CompositeCurveSegment.
") StepGeom_CompositeCurveSegment;
		 StepGeom_CompositeCurveSegment();

		/****** StepGeom_CompositeCurveSegment::Init ******/
		/****** md5 signature: 9212d454dae84ec98f01a1715012c11d ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aTransition: StepGeom_TransitionCode
aSameSense: bool
aParentCurve: StepGeom_Curve

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const StepGeom_TransitionCode aTransition, const bool aSameSense, const opencascade::handle<StepGeom_Curve> & aParentCurve);

		/****** StepGeom_CompositeCurveSegment::ParentCurve ******/
		/****** md5 signature: 97e621a56f129c95047d611625edb505 ******/
		%feature("compactdefaultargs") ParentCurve;
		%feature("autodoc", "Return
-------
opencascade::handle<StepGeom_Curve>

Description
-----------
No available documentation.
") ParentCurve;
		opencascade::handle<StepGeom_Curve> ParentCurve();

		/****** StepGeom_CompositeCurveSegment::SameSense ******/
		/****** md5 signature: a45add58374f4310c3a05d42dc01c1bb ******/
		%feature("compactdefaultargs") SameSense;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") SameSense;
		bool SameSense();

		/****** StepGeom_CompositeCurveSegment::SetParentCurve ******/
		/****** md5 signature: b904f7ff5ac3c9406128ef65e64ce749 ******/
		%feature("compactdefaultargs") SetParentCurve;
		%feature("autodoc", "
Parameters
----------
aParentCurve: StepGeom_Curve

Return
-------
None

Description
-----------
No available documentation.
") SetParentCurve;
		void SetParentCurve(const opencascade::handle<StepGeom_Curve> & aParentCurve);

		/****** StepGeom_CompositeCurveSegment::SetSameSense ******/
		/****** md5 signature: 1c96f0c7840764d5e81fa3c884e88bc9 ******/
		%feature("compactdefaultargs") SetSameSense;
		%feature("autodoc", "
Parameters
----------
aSameSense: bool

Return
-------
None

Description
-----------
No available documentation.
") SetSameSense;
		void SetSameSense(const bool aSameSense);

		/****** StepGeom_CompositeCurveSegment::SetTransition ******/
		/****** md5 signature: e531316a04afa685ba989d138235b465 ******/
		%feature("compactdefaultargs") SetTransition;
		%feature("autodoc", "
Parameters
----------
aTransition: StepGeom_TransitionCode

Return
-------
None

Description
-----------
No available documentation.
") SetTransition;
		void SetTransition(const StepGeom_TransitionCode aTransition);

		/****** StepGeom_CompositeCurveSegment::Transition ******/
		/****** md5 signature: 4d4955355f5ae5f2d325011ff79e70f2 ******/
		%feature("compactdefaultargs") Transition;
		%feature("autodoc", "Return
-------
StepGeom_TransitionCode

Description
-----------
No available documentation.
") Transition;
		StepGeom_TransitionCode Transition();

};


%make_alias(StepGeom_CompositeCurveSegment)

%extend StepGeom_CompositeCurveSegment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class StepGeom_CurveOnSurface *
********************************/
class StepGeom_CurveOnSurface : public StepData_SelectType {
	public:
		/****** StepGeom_CurveOnSurface::StepGeom_CurveOnSurface ******/
		/****** md5 signature: 15bfbfffa8612b6a179cc6ebef6b3fd0 ******/
		%feature("compactdefaultargs") StepGeom_CurveOnSurface;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a CurveOnSurface SelectType.
") StepGeom_CurveOnSurface;
		 StepGeom_CurveOnSurface();

		/****** StepGeom_CurveOnSurface::CaseNum ******/
		/****** md5 signature: ef153e98615228b7740a3c1765b8d82b ******/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient

Return
-------
int

Description
-----------
Recognizes a CurveOnSurface Kind Entity that is: 1 -> Pcurve 2 -> SurfaceCurve 3 -> CompositeCurveOnSurface 0 else.
") CaseNum;
		int CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****** StepGeom_CurveOnSurface::CompositeCurveOnSurface ******/
		/****** md5 signature: 3d75e9d8480b471e96307b226ca9e42c ******/
		%feature("compactdefaultargs") CompositeCurveOnSurface;
		%feature("autodoc", "Return
-------
opencascade::handle<StepGeom_CompositeCurveOnSurface>

Description
-----------
returns Value as a CompositeCurveOnSurface (Null if another type).
") CompositeCurveOnSurface;
		opencascade::handle<StepGeom_CompositeCurveOnSurface> CompositeCurveOnSurface();

		/****** StepGeom_CurveOnSurface::Pcurve ******/
		/****** md5 signature: 8d49697f35a3e68e7c4c25db189ca294 ******/
		%feature("compactdefaultargs") Pcurve;
		%feature("autodoc", "Return
-------
opencascade::handle<StepGeom_Pcurve>

Description
-----------
returns Value as a Pcurve (Null if another type).
") Pcurve;
		opencascade::handle<StepGeom_Pcurve> Pcurve();

		/****** StepGeom_CurveOnSurface::SurfaceCurve ******/
		/****** md5 signature: 912a183bfc42f9cf5308fd23c8e16134 ******/
		%feature("compactdefaultargs") SurfaceCurve;
		%feature("autodoc", "Return
-------
opencascade::handle<StepGeom_SurfaceCurve>

Description
-----------
returns Value as a SurfaceCurve (Null if another type).
") SurfaceCurve;
		opencascade::handle<StepGeom_SurfaceCurve> SurfaceCurve();

};


%extend StepGeom_CurveOnSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************************************************
* class StepGeom_GeomRepContextAndGlobUnitAssCtxAndGlobUncertaintyAssCtx *
*************************************************************************/
class StepGeom_GeomRepContextAndGlobUnitAssCtxAndGlobUncertaintyAssCtx : public StepRepr_RepresentationContext {
	public:
		/****** StepGeom_GeomRepContextAndGlobUnitAssCtxAndGlobUncertaintyAssCtx::StepGeom_GeomRepContextAndGlobUnitAssCtxAndGlobUncertaintyAssCtx ******/
		/****** md5 signature: 2316119de1e82580b646e263a06c34ad ******/
		%feature("compactdefaultargs") StepGeom_GeomRepContextAndGlobUnitAssCtxAndGlobUncertaintyAssCtx;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") StepGeom_GeomRepContextAndGlobUnitAssCtxAndGlobUncertaintyAssCtx;
		 StepGeom_GeomRepContextAndGlobUnitAssCtxAndGlobUncertaintyAssCtx();

		/****** StepGeom_GeomRepContextAndGlobUnitAssCtxAndGlobUncertaintyAssCtx::CoordinateSpaceDimension ******/
		/****** md5 signature: d0a814c9db18172ad6f5628323bcdb4a ******/
		%feature("compactdefaultargs") CoordinateSpaceDimension;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") CoordinateSpaceDimension;
		int CoordinateSpaceDimension();

		/****** StepGeom_GeomRepContextAndGlobUnitAssCtxAndGlobUncertaintyAssCtx::GeometricRepresentationContext ******/
		/****** md5 signature: 8f45e045f983d7fe963d17f1962c1f51 ******/
		%feature("compactdefaultargs") GeometricRepresentationContext;
		%feature("autodoc", "Return
-------
opencascade::handle<StepGeom_GeometricRepresentationContext>

Description
-----------
No available documentation.
") GeometricRepresentationContext;
		opencascade::handle<StepGeom_GeometricRepresentationContext> GeometricRepresentationContext();

		/****** StepGeom_GeomRepContextAndGlobUnitAssCtxAndGlobUncertaintyAssCtx::GlobalUncertaintyAssignedContext ******/
		/****** md5 signature: 73f2ff8d54aac92b968d603ebaa6af3c ******/
		%feature("compactdefaultargs") GlobalUncertaintyAssignedContext;
		%feature("autodoc", "Return
-------
opencascade::handle<StepRepr_GlobalUncertaintyAssignedContext>

Description
-----------
No available documentation.
") GlobalUncertaintyAssignedContext;
		opencascade::handle<StepRepr_GlobalUncertaintyAssignedContext> GlobalUncertaintyAssignedContext();

		/****** StepGeom_GeomRepContextAndGlobUnitAssCtxAndGlobUncertaintyAssCtx::GlobalUnitAssignedContext ******/
		/****** md5 signature: 22bcab26751a6c90dd2abf1d9af07a69 ******/
		%feature("compactdefaultargs") GlobalUnitAssignedContext;
		%feature("autodoc", "Return
-------
opencascade::handle<StepRepr_GlobalUnitAssignedContext>

Description
-----------
No available documentation.
") GlobalUnitAssignedContext;
		opencascade::handle<StepRepr_GlobalUnitAssignedContext> GlobalUnitAssignedContext();

		/****** StepGeom_GeomRepContextAndGlobUnitAssCtxAndGlobUncertaintyAssCtx::Init ******/
		/****** md5 signature: e788a4837e744bcf74c671839190b683 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aContextIdentifier: TCollection_HAsciiString
aContextType: TCollection_HAsciiString
aGeometricRepresentationCtx: StepGeom_GeometricRepresentationContext
aGlobalUnitAssignedCtx: StepRepr_GlobalUnitAssignedContext
aGlobalUncertaintyAssignedCtx: StepRepr_GlobalUncertaintyAssignedContext

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aContextIdentifier, const opencascade::handle<TCollection_HAsciiString> & aContextType, const opencascade::handle<StepGeom_GeometricRepresentationContext> & aGeometricRepresentationCtx, const opencascade::handle<StepRepr_GlobalUnitAssignedContext> & aGlobalUnitAssignedCtx, const opencascade::handle<StepRepr_GlobalUncertaintyAssignedContext> & aGlobalUncertaintyAssignedCtx);

		/****** StepGeom_GeomRepContextAndGlobUnitAssCtxAndGlobUncertaintyAssCtx::Init ******/
		/****** md5 signature: abe8d373b0d4463651ace85195129a79 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aContextIdentifier: TCollection_HAsciiString
aContextType: TCollection_HAsciiString
aCoordinateSpaceDimension: int
aUnits: NCollection_HArray1<
anUncertainty: NCollection_HArray1<

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aContextIdentifier, const opencascade::handle<TCollection_HAsciiString> & aContextType, const int aCoordinateSpaceDimension, const opencascade::handle<NCollection_HArray1<opencascade::handle<StepBasic_NamedUnit>> > & aUnits, const opencascade::handle<NCollection_HArray1<opencascade::handle<StepBasic_UncertaintyMeasureWithUnit>> > & anUncertainty);

		/****** StepGeom_GeomRepContextAndGlobUnitAssCtxAndGlobUncertaintyAssCtx::NbUncertainty ******/
		/****** md5 signature: 5a5209f9e06fb26886d8dfd427ce51aa ******/
		%feature("compactdefaultargs") NbUncertainty;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbUncertainty;
		int NbUncertainty();

		/****** StepGeom_GeomRepContextAndGlobUnitAssCtxAndGlobUncertaintyAssCtx::NbUnits ******/
		/****** md5 signature: 0869a1823c5478da0f6e93ff331d6fda ******/
		%feature("compactdefaultargs") NbUnits;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbUnits;
		int NbUnits();

		/****** StepGeom_GeomRepContextAndGlobUnitAssCtxAndGlobUncertaintyAssCtx::SetCoordinateSpaceDimension ******/
		/****** md5 signature: 39271da12ecdf0b49732e58f609c3609 ******/
		%feature("compactdefaultargs") SetCoordinateSpaceDimension;
		%feature("autodoc", "
Parameters
----------
aCoordinateSpaceDimension: int

Return
-------
None

Description
-----------
No available documentation.
") SetCoordinateSpaceDimension;
		void SetCoordinateSpaceDimension(const int aCoordinateSpaceDimension);

		/****** StepGeom_GeomRepContextAndGlobUnitAssCtxAndGlobUncertaintyAssCtx::SetGeometricRepresentationContext ******/
		/****** md5 signature: 8913b4b6bbec9dde7331e171e32f0626 ******/
		%feature("compactdefaultargs") SetGeometricRepresentationContext;
		%feature("autodoc", "
Parameters
----------
aGeometricRepresentationContext: StepGeom_GeometricRepresentationContext

Return
-------
None

Description
-----------
No available documentation.
") SetGeometricRepresentationContext;
		void SetGeometricRepresentationContext(const opencascade::handle<StepGeom_GeometricRepresentationContext> & aGeometricRepresentationContext);

		/****** StepGeom_GeomRepContextAndGlobUnitAssCtxAndGlobUncertaintyAssCtx::SetGlobalUncertaintyAssignedContext ******/
		/****** md5 signature: d2ddec02f390743bc99e8919607a6328 ******/
		%feature("compactdefaultargs") SetGlobalUncertaintyAssignedContext;
		%feature("autodoc", "
Parameters
----------
aGlobalUncertaintyAssignedCtx: StepRepr_GlobalUncertaintyAssignedContext

Return
-------
None

Description
-----------
No available documentation.
") SetGlobalUncertaintyAssignedContext;
		void SetGlobalUncertaintyAssignedContext(const opencascade::handle<StepRepr_GlobalUncertaintyAssignedContext> & aGlobalUncertaintyAssignedCtx);

		/****** StepGeom_GeomRepContextAndGlobUnitAssCtxAndGlobUncertaintyAssCtx::SetGlobalUnitAssignedContext ******/
		/****** md5 signature: aeb1410b60cfa4646cfd9b6425a1b25d ******/
		%feature("compactdefaultargs") SetGlobalUnitAssignedContext;
		%feature("autodoc", "
Parameters
----------
aGlobalUnitAssignedContext: StepRepr_GlobalUnitAssignedContext

Return
-------
None

Description
-----------
No available documentation.
") SetGlobalUnitAssignedContext;
		void SetGlobalUnitAssignedContext(const opencascade::handle<StepRepr_GlobalUnitAssignedContext> & aGlobalUnitAssignedContext);

		/****** StepGeom_GeomRepContextAndGlobUnitAssCtxAndGlobUncertaintyAssCtx::SetUncertainty ******/
		/****** md5 signature: 5f797c92e17afb834eb6941fdcb7a11c ******/
		%feature("compactdefaultargs") SetUncertainty;
		%feature("autodoc", "
Parameters
----------
aUncertainty: NCollection_HArray1<

Return
-------
None

Description
-----------
No available documentation.
") SetUncertainty;
		void SetUncertainty(const opencascade::handle<NCollection_HArray1<opencascade::handle<StepBasic_UncertaintyMeasureWithUnit>> > & aUncertainty);

		/****** StepGeom_GeomRepContextAndGlobUnitAssCtxAndGlobUncertaintyAssCtx::SetUnits ******/
		/****** md5 signature: 337581e69f7bdcfcb983fc6ea95bb132 ******/
		%feature("compactdefaultargs") SetUnits;
		%feature("autodoc", "
Parameters
----------
aUnits: NCollection_HArray1<

Return
-------
None

Description
-----------
No available documentation.
") SetUnits;
		void SetUnits(const opencascade::handle<NCollection_HArray1<opencascade::handle<StepBasic_NamedUnit>> > & aUnits);

		/****** StepGeom_GeomRepContextAndGlobUnitAssCtxAndGlobUncertaintyAssCtx::Uncertainty ******/
		/****** md5 signature: c45420811079a2cb4224a341ce15554e ******/
		%feature("compactdefaultargs") Uncertainty;
		%feature("autodoc", "Return
-------
opencascade::handle<NCollection_HArray1<opencascade::handle<StepBasic_UncertaintyMeasureWithUnit>>>

Description
-----------
No available documentation.
") Uncertainty;
		opencascade::handle<NCollection_HArray1<opencascade::handle<StepBasic_UncertaintyMeasureWithUnit>>> Uncertainty();

		/****** StepGeom_GeomRepContextAndGlobUnitAssCtxAndGlobUncertaintyAssCtx::UncertaintyValue ******/
		/****** md5 signature: acc281cc8717429bd70979b4a4c6b1b1 ******/
		%feature("compactdefaultargs") UncertaintyValue;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
opencascade::handle<StepBasic_UncertaintyMeasureWithUnit>

Description
-----------
No available documentation.
") UncertaintyValue;
		opencascade::handle<StepBasic_UncertaintyMeasureWithUnit> UncertaintyValue(const int num);

		/****** StepGeom_GeomRepContextAndGlobUnitAssCtxAndGlobUncertaintyAssCtx::Units ******/
		/****** md5 signature: 15510344bbc0dccc14d821a7401432b6 ******/
		%feature("compactdefaultargs") Units;
		%feature("autodoc", "Return
-------
opencascade::handle<NCollection_HArray1<opencascade::handle<StepBasic_NamedUnit>>>

Description
-----------
No available documentation.
") Units;
		opencascade::handle<NCollection_HArray1<opencascade::handle<StepBasic_NamedUnit>>> Units();

		/****** StepGeom_GeomRepContextAndGlobUnitAssCtxAndGlobUncertaintyAssCtx::UnitsValue ******/
		/****** md5 signature: d991d0c7076b378cb884117fd23b60d6 ******/
		%feature("compactdefaultargs") UnitsValue;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
opencascade::handle<StepBasic_NamedUnit>

Description
-----------
No available documentation.
") UnitsValue;
		opencascade::handle<StepBasic_NamedUnit> UnitsValue(const int num);

};


%make_alias(StepGeom_GeomRepContextAndGlobUnitAssCtxAndGlobUncertaintyAssCtx)

%extend StepGeom_GeomRepContextAndGlobUnitAssCtxAndGlobUncertaintyAssCtx {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************************
* class StepGeom_GeometricRepresentationContext *
************************************************/
class StepGeom_GeometricRepresentationContext : public StepRepr_RepresentationContext {
	public:
		/****** StepGeom_GeometricRepresentationContext::StepGeom_GeometricRepresentationContext ******/
		/****** md5 signature: 5a783708e18e12b5ba194dd39a587df1 ******/
		%feature("compactdefaultargs") StepGeom_GeometricRepresentationContext;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a GeometricRepresentationContext.
") StepGeom_GeometricRepresentationContext;
		 StepGeom_GeometricRepresentationContext();

		/****** StepGeom_GeometricRepresentationContext::CoordinateSpaceDimension ******/
		/****** md5 signature: d0a814c9db18172ad6f5628323bcdb4a ******/
		%feature("compactdefaultargs") CoordinateSpaceDimension;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") CoordinateSpaceDimension;
		int CoordinateSpaceDimension();

		/****** StepGeom_GeometricRepresentationContext::Init ******/
		/****** md5 signature: 54cd96c5cb9d33c67fb2b4a6a4edcc50 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aContextIdentifier: TCollection_HAsciiString
aContextType: TCollection_HAsciiString
aCoordinateSpaceDimension: int

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aContextIdentifier, const opencascade::handle<TCollection_HAsciiString> & aContextType, const int aCoordinateSpaceDimension);

		/****** StepGeom_GeometricRepresentationContext::SetCoordinateSpaceDimension ******/
		/****** md5 signature: 39271da12ecdf0b49732e58f609c3609 ******/
		%feature("compactdefaultargs") SetCoordinateSpaceDimension;
		%feature("autodoc", "
Parameters
----------
aCoordinateSpaceDimension: int

Return
-------
None

Description
-----------
No available documentation.
") SetCoordinateSpaceDimension;
		void SetCoordinateSpaceDimension(const int aCoordinateSpaceDimension);

};


%make_alias(StepGeom_GeometricRepresentationContext)

%extend StepGeom_GeometricRepresentationContext {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************************************************
* class StepGeom_GeometricRepresentationContextAndGlobalUnitAssignedContext *
****************************************************************************/
class StepGeom_GeometricRepresentationContextAndGlobalUnitAssignedContext : public StepRepr_RepresentationContext {
	public:
		/****** StepGeom_GeometricRepresentationContextAndGlobalUnitAssignedContext::StepGeom_GeometricRepresentationContextAndGlobalUnitAssignedContext ******/
		/****** md5 signature: 570ab92a1ca82d08371ec616e8a44a66 ******/
		%feature("compactdefaultargs") StepGeom_GeometricRepresentationContextAndGlobalUnitAssignedContext;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a GeometricRepresentationContextAndGlobalUnitAssignedContext.
") StepGeom_GeometricRepresentationContextAndGlobalUnitAssignedContext;
		 StepGeom_GeometricRepresentationContextAndGlobalUnitAssignedContext();

		/****** StepGeom_GeometricRepresentationContextAndGlobalUnitAssignedContext::CoordinateSpaceDimension ******/
		/****** md5 signature: d0a814c9db18172ad6f5628323bcdb4a ******/
		%feature("compactdefaultargs") CoordinateSpaceDimension;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") CoordinateSpaceDimension;
		int CoordinateSpaceDimension();

		/****** StepGeom_GeometricRepresentationContextAndGlobalUnitAssignedContext::GeometricRepresentationContext ******/
		/****** md5 signature: 8f45e045f983d7fe963d17f1962c1f51 ******/
		%feature("compactdefaultargs") GeometricRepresentationContext;
		%feature("autodoc", "Return
-------
opencascade::handle<StepGeom_GeometricRepresentationContext>

Description
-----------
No available documentation.
") GeometricRepresentationContext;
		opencascade::handle<StepGeom_GeometricRepresentationContext> GeometricRepresentationContext();

		/****** StepGeom_GeometricRepresentationContextAndGlobalUnitAssignedContext::GlobalUnitAssignedContext ******/
		/****** md5 signature: 22bcab26751a6c90dd2abf1d9af07a69 ******/
		%feature("compactdefaultargs") GlobalUnitAssignedContext;
		%feature("autodoc", "Return
-------
opencascade::handle<StepRepr_GlobalUnitAssignedContext>

Description
-----------
No available documentation.
") GlobalUnitAssignedContext;
		opencascade::handle<StepRepr_GlobalUnitAssignedContext> GlobalUnitAssignedContext();

		/****** StepGeom_GeometricRepresentationContextAndGlobalUnitAssignedContext::Init ******/
		/****** md5 signature: 11a5cae1c2e61eab652ea95df5655864 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aContextIdentifier: TCollection_HAsciiString
aContextType: TCollection_HAsciiString
aGeometricRepresentationContext: StepGeom_GeometricRepresentationContext
aGlobalUnitAssignedContext: StepRepr_GlobalUnitAssignedContext

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aContextIdentifier, const opencascade::handle<TCollection_HAsciiString> & aContextType, const opencascade::handle<StepGeom_GeometricRepresentationContext> & aGeometricRepresentationContext, const opencascade::handle<StepRepr_GlobalUnitAssignedContext> & aGlobalUnitAssignedContext);

		/****** StepGeom_GeometricRepresentationContextAndGlobalUnitAssignedContext::Init ******/
		/****** md5 signature: 868af901cde3b6fa914da5d62802e325 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aContextIdentifier: TCollection_HAsciiString
aContextType: TCollection_HAsciiString
aCoordinateSpaceDimension: int
aUnits: NCollection_HArray1<

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aContextIdentifier, const opencascade::handle<TCollection_HAsciiString> & aContextType, const int aCoordinateSpaceDimension, const opencascade::handle<NCollection_HArray1<opencascade::handle<StepBasic_NamedUnit>> > & aUnits);

		/****** StepGeom_GeometricRepresentationContextAndGlobalUnitAssignedContext::NbUnits ******/
		/****** md5 signature: 0869a1823c5478da0f6e93ff331d6fda ******/
		%feature("compactdefaultargs") NbUnits;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbUnits;
		int NbUnits();

		/****** StepGeom_GeometricRepresentationContextAndGlobalUnitAssignedContext::SetCoordinateSpaceDimension ******/
		/****** md5 signature: 39271da12ecdf0b49732e58f609c3609 ******/
		%feature("compactdefaultargs") SetCoordinateSpaceDimension;
		%feature("autodoc", "
Parameters
----------
aCoordinateSpaceDimension: int

Return
-------
None

Description
-----------
No available documentation.
") SetCoordinateSpaceDimension;
		void SetCoordinateSpaceDimension(const int aCoordinateSpaceDimension);

		/****** StepGeom_GeometricRepresentationContextAndGlobalUnitAssignedContext::SetGeometricRepresentationContext ******/
		/****** md5 signature: 8913b4b6bbec9dde7331e171e32f0626 ******/
		%feature("compactdefaultargs") SetGeometricRepresentationContext;
		%feature("autodoc", "
Parameters
----------
aGeometricRepresentationContext: StepGeom_GeometricRepresentationContext

Return
-------
None

Description
-----------
No available documentation.
") SetGeometricRepresentationContext;
		void SetGeometricRepresentationContext(const opencascade::handle<StepGeom_GeometricRepresentationContext> & aGeometricRepresentationContext);

		/****** StepGeom_GeometricRepresentationContextAndGlobalUnitAssignedContext::SetGlobalUnitAssignedContext ******/
		/****** md5 signature: aeb1410b60cfa4646cfd9b6425a1b25d ******/
		%feature("compactdefaultargs") SetGlobalUnitAssignedContext;
		%feature("autodoc", "
Parameters
----------
aGlobalUnitAssignedContext: StepRepr_GlobalUnitAssignedContext

Return
-------
None

Description
-----------
No available documentation.
") SetGlobalUnitAssignedContext;
		void SetGlobalUnitAssignedContext(const opencascade::handle<StepRepr_GlobalUnitAssignedContext> & aGlobalUnitAssignedContext);

		/****** StepGeom_GeometricRepresentationContextAndGlobalUnitAssignedContext::SetUnits ******/
		/****** md5 signature: 337581e69f7bdcfcb983fc6ea95bb132 ******/
		%feature("compactdefaultargs") SetUnits;
		%feature("autodoc", "
Parameters
----------
aUnits: NCollection_HArray1<

Return
-------
None

Description
-----------
No available documentation.
") SetUnits;
		void SetUnits(const opencascade::handle<NCollection_HArray1<opencascade::handle<StepBasic_NamedUnit>> > & aUnits);

		/****** StepGeom_GeometricRepresentationContextAndGlobalUnitAssignedContext::Units ******/
		/****** md5 signature: 15510344bbc0dccc14d821a7401432b6 ******/
		%feature("compactdefaultargs") Units;
		%feature("autodoc", "Return
-------
opencascade::handle<NCollection_HArray1<opencascade::handle<StepBasic_NamedUnit>>>

Description
-----------
No available documentation.
") Units;
		opencascade::handle<NCollection_HArray1<opencascade::handle<StepBasic_NamedUnit>>> Units();

		/****** StepGeom_GeometricRepresentationContextAndGlobalUnitAssignedContext::UnitsValue ******/
		/****** md5 signature: d991d0c7076b378cb884117fd23b60d6 ******/
		%feature("compactdefaultargs") UnitsValue;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
opencascade::handle<StepBasic_NamedUnit>

Description
-----------
No available documentation.
") UnitsValue;
		opencascade::handle<StepBasic_NamedUnit> UnitsValue(const int num);

};


%make_alias(StepGeom_GeometricRepresentationContextAndGlobalUnitAssignedContext)

%extend StepGeom_GeometricRepresentationContextAndGlobalUnitAssignedContext {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************************************************************
* class StepGeom_GeometricRepresentationContextAndParametricRepresentationContext *
**********************************************************************************/
class StepGeom_GeometricRepresentationContextAndParametricRepresentationContext : public StepRepr_RepresentationContext {
	public:
		/****** StepGeom_GeometricRepresentationContextAndParametricRepresentationContext::StepGeom_GeometricRepresentationContextAndParametricRepresentationContext ******/
		/****** md5 signature: 34bde20c34b7676b8cdff3a9c3e85c56 ******/
		%feature("compactdefaultargs") StepGeom_GeometricRepresentationContextAndParametricRepresentationContext;
		%feature("autodoc", "Return
-------
None

Description
-----------
empty constructor.
") StepGeom_GeometricRepresentationContextAndParametricRepresentationContext;
		 StepGeom_GeometricRepresentationContextAndParametricRepresentationContext();

		/****** StepGeom_GeometricRepresentationContextAndParametricRepresentationContext::CoordinateSpaceDimension ******/
		/****** md5 signature: d0a814c9db18172ad6f5628323bcdb4a ******/
		%feature("compactdefaultargs") CoordinateSpaceDimension;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") CoordinateSpaceDimension;
		int CoordinateSpaceDimension();

		/****** StepGeom_GeometricRepresentationContextAndParametricRepresentationContext::GeometricRepresentationContext ******/
		/****** md5 signature: 8f45e045f983d7fe963d17f1962c1f51 ******/
		%feature("compactdefaultargs") GeometricRepresentationContext;
		%feature("autodoc", "Return
-------
opencascade::handle<StepGeom_GeometricRepresentationContext>

Description
-----------
No available documentation.
") GeometricRepresentationContext;
		opencascade::handle<StepGeom_GeometricRepresentationContext> GeometricRepresentationContext();

		/****** StepGeom_GeometricRepresentationContextAndParametricRepresentationContext::Init ******/
		/****** md5 signature: 30dfa78175ea47e2dea552c0a5581fcc ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aContextIdentifier: TCollection_HAsciiString
aContextType: TCollection_HAsciiString
aGeometricRepresentationContext: StepGeom_GeometricRepresentationContext
aParametricRepresentationContext: StepRepr_ParametricRepresentationContext

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aContextIdentifier, const opencascade::handle<TCollection_HAsciiString> & aContextType, const opencascade::handle<StepGeom_GeometricRepresentationContext> & aGeometricRepresentationContext, const opencascade::handle<StepRepr_ParametricRepresentationContext> & aParametricRepresentationContext);

		/****** StepGeom_GeometricRepresentationContextAndParametricRepresentationContext::Init ******/
		/****** md5 signature: 54cd96c5cb9d33c67fb2b4a6a4edcc50 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aContextIdentifier: TCollection_HAsciiString
aContextType: TCollection_HAsciiString
aCoordinateSpaceDimension: int

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aContextIdentifier, const opencascade::handle<TCollection_HAsciiString> & aContextType, const int aCoordinateSpaceDimension);

		/****** StepGeom_GeometricRepresentationContextAndParametricRepresentationContext::ParametricRepresentationContext ******/
		/****** md5 signature: d5f1d4451d7030c6b1e2cb2f714d0038 ******/
		%feature("compactdefaultargs") ParametricRepresentationContext;
		%feature("autodoc", "Return
-------
opencascade::handle<StepRepr_ParametricRepresentationContext>

Description
-----------
No available documentation.
") ParametricRepresentationContext;
		opencascade::handle<StepRepr_ParametricRepresentationContext> ParametricRepresentationContext();

		/****** StepGeom_GeometricRepresentationContextAndParametricRepresentationContext::SetCoordinateSpaceDimension ******/
		/****** md5 signature: 39271da12ecdf0b49732e58f609c3609 ******/
		%feature("compactdefaultargs") SetCoordinateSpaceDimension;
		%feature("autodoc", "
Parameters
----------
aCoordinateSpaceDimension: int

Return
-------
None

Description
-----------
No available documentation.
") SetCoordinateSpaceDimension;
		void SetCoordinateSpaceDimension(const int aCoordinateSpaceDimension);

		/****** StepGeom_GeometricRepresentationContextAndParametricRepresentationContext::SetGeometricRepresentationContext ******/
		/****** md5 signature: 8913b4b6bbec9dde7331e171e32f0626 ******/
		%feature("compactdefaultargs") SetGeometricRepresentationContext;
		%feature("autodoc", "
Parameters
----------
aGeometricRepresentationContext: StepGeom_GeometricRepresentationContext

Return
-------
None

Description
-----------
No available documentation.
") SetGeometricRepresentationContext;
		void SetGeometricRepresentationContext(const opencascade::handle<StepGeom_GeometricRepresentationContext> & aGeometricRepresentationContext);

		/****** StepGeom_GeometricRepresentationContextAndParametricRepresentationContext::SetParametricRepresentationContext ******/
		/****** md5 signature: d56242b1624b5c3c72ad0b58e03d142e ******/
		%feature("compactdefaultargs") SetParametricRepresentationContext;
		%feature("autodoc", "
Parameters
----------
aParametricRepresentationContext: StepRepr_ParametricRepresentationContext

Return
-------
None

Description
-----------
No available documentation.
") SetParametricRepresentationContext;
		void SetParametricRepresentationContext(const opencascade::handle<StepRepr_ParametricRepresentationContext> & aParametricRepresentationContext);

};


%make_alias(StepGeom_GeometricRepresentationContextAndParametricRepresentationContext)

%extend StepGeom_GeometricRepresentationContextAndParametricRepresentationContext {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************************
* class StepGeom_GeometricRepresentationItem *
*********************************************/
class StepGeom_GeometricRepresentationItem : public StepRepr_RepresentationItem {
	public:
		/****** StepGeom_GeometricRepresentationItem::StepGeom_GeometricRepresentationItem ******/
		/****** md5 signature: 30c17483dc3ed0daf2563e8d43a9a23e ******/
		%feature("compactdefaultargs") StepGeom_GeometricRepresentationItem;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a GeometricRepresentationItem.
") StepGeom_GeometricRepresentationItem;
		 StepGeom_GeometricRepresentationItem();

};


%make_alias(StepGeom_GeometricRepresentationItem)

%extend StepGeom_GeometricRepresentationItem {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class StepGeom_PcurveOrSurface *
*********************************/
class StepGeom_PcurveOrSurface : public StepData_SelectType {
	public:
		/****** StepGeom_PcurveOrSurface::StepGeom_PcurveOrSurface ******/
		/****** md5 signature: fbbfd95880743ab7d44c39912f254023 ******/
		%feature("compactdefaultargs") StepGeom_PcurveOrSurface;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a PcurveOrSurface SelectType.
") StepGeom_PcurveOrSurface;
		 StepGeom_PcurveOrSurface();

		/****** StepGeom_PcurveOrSurface::CaseNum ******/
		/****** md5 signature: ef153e98615228b7740a3c1765b8d82b ******/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient

Return
-------
int

Description
-----------
Recognizes a PcurveOrSurface Kind Entity that is: 1 -> Pcurve 2 -> Surface 0 else.
") CaseNum;
		int CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****** StepGeom_PcurveOrSurface::Pcurve ******/
		/****** md5 signature: 8d49697f35a3e68e7c4c25db189ca294 ******/
		%feature("compactdefaultargs") Pcurve;
		%feature("autodoc", "Return
-------
opencascade::handle<StepGeom_Pcurve>

Description
-----------
returns Value as a Pcurve (Null if another type).
") Pcurve;
		opencascade::handle<StepGeom_Pcurve> Pcurve();

		/****** StepGeom_PcurveOrSurface::Surface ******/
		/****** md5 signature: c2398e6bbff81fe9609620c081466496 ******/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "Return
-------
opencascade::handle<StepGeom_Surface>

Description
-----------
returns Value as a Surface (Null if another type).
") Surface;
		opencascade::handle<StepGeom_Surface> Surface();

};


%extend StepGeom_PcurveOrSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class StepGeom_SurfaceBoundary *
*********************************/
class StepGeom_SurfaceBoundary : public StepData_SelectType {
	public:
		/****** StepGeom_SurfaceBoundary::StepGeom_SurfaceBoundary ******/
		/****** md5 signature: ea30763904967b0296fde6300f8914fc ******/
		%feature("compactdefaultargs") StepGeom_SurfaceBoundary;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepGeom_SurfaceBoundary;
		 StepGeom_SurfaceBoundary();

		/****** StepGeom_SurfaceBoundary::BoundaryCurve ******/
		/****** md5 signature: fa719026bf342c3a3584bff1f3d91dc4 ******/
		%feature("compactdefaultargs") BoundaryCurve;
		%feature("autodoc", "Return
-------
opencascade::handle<StepGeom_BoundaryCurve>

Description
-----------
Returns Value as BoundaryCurve (or Null if another type).
") BoundaryCurve;
		opencascade::handle<StepGeom_BoundaryCurve> BoundaryCurve();

		/****** StepGeom_SurfaceBoundary::CaseNum ******/
		/****** md5 signature: ef153e98615228b7740a3c1765b8d82b ******/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient

Return
-------
int

Description
-----------
Recognizes a kind of SurfaceBoundary select type 1 -> BoundaryCurve from StepGeom 2 -> DegeneratePcurve from StepGeom 0 else.
") CaseNum;
		int CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****** StepGeom_SurfaceBoundary::DegeneratePcurve ******/
		/****** md5 signature: de27d6a2678bf95cf7b687aa08705467 ******/
		%feature("compactdefaultargs") DegeneratePcurve;
		%feature("autodoc", "Return
-------
opencascade::handle<StepGeom_DegeneratePcurve>

Description
-----------
Returns Value as DegeneratePcurve (or Null if another type).
") DegeneratePcurve;
		opencascade::handle<StepGeom_DegeneratePcurve> DegeneratePcurve();

};


%extend StepGeom_SurfaceBoundary {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class StepGeom_SurfacePatch *
******************************/
class StepGeom_SurfacePatch : public Standard_Transient {
	public:
		/****** StepGeom_SurfacePatch::StepGeom_SurfacePatch ******/
		/****** md5 signature: e1128eb21d9d25e563cf0a74ebfb0c78 ******/
		%feature("compactdefaultargs") StepGeom_SurfacePatch;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a SurfacePatch.
") StepGeom_SurfacePatch;
		 StepGeom_SurfacePatch();

		/****** StepGeom_SurfacePatch::Init ******/
		/****** md5 signature: 4668e287505dcf7bfaf1d363a54d74a5 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aParentSurface: StepGeom_BoundedSurface
aUTransition: StepGeom_TransitionCode
aVTransition: StepGeom_TransitionCode
aUSense: bool
aVSense: bool

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<StepGeom_BoundedSurface> & aParentSurface, const StepGeom_TransitionCode aUTransition, const StepGeom_TransitionCode aVTransition, const bool aUSense, const bool aVSense);

		/****** StepGeom_SurfacePatch::ParentSurface ******/
		/****** md5 signature: 4b343a59445d2e3014e939a6745b87a0 ******/
		%feature("compactdefaultargs") ParentSurface;
		%feature("autodoc", "Return
-------
opencascade::handle<StepGeom_BoundedSurface>

Description
-----------
No available documentation.
") ParentSurface;
		opencascade::handle<StepGeom_BoundedSurface> ParentSurface();

		/****** StepGeom_SurfacePatch::SetParentSurface ******/
		/****** md5 signature: 11e589d981465ad69d922e9734663a3a ******/
		%feature("compactdefaultargs") SetParentSurface;
		%feature("autodoc", "
Parameters
----------
aParentSurface: StepGeom_BoundedSurface

Return
-------
None

Description
-----------
No available documentation.
") SetParentSurface;
		void SetParentSurface(const opencascade::handle<StepGeom_BoundedSurface> & aParentSurface);

		/****** StepGeom_SurfacePatch::SetUSense ******/
		/****** md5 signature: 603f814bcd02a3d361d5666969bc2ef8 ******/
		%feature("compactdefaultargs") SetUSense;
		%feature("autodoc", "
Parameters
----------
aUSense: bool

Return
-------
None

Description
-----------
No available documentation.
") SetUSense;
		void SetUSense(const bool aUSense);

		/****** StepGeom_SurfacePatch::SetUTransition ******/
		/****** md5 signature: 6f926464c8f69e042c86dd83df27aa7a ******/
		%feature("compactdefaultargs") SetUTransition;
		%feature("autodoc", "
Parameters
----------
aUTransition: StepGeom_TransitionCode

Return
-------
None

Description
-----------
No available documentation.
") SetUTransition;
		void SetUTransition(const StepGeom_TransitionCode aUTransition);

		/****** StepGeom_SurfacePatch::SetVSense ******/
		/****** md5 signature: 208ed363baaedd6e18db6e46ccbe6c38 ******/
		%feature("compactdefaultargs") SetVSense;
		%feature("autodoc", "
Parameters
----------
aVSense: bool

Return
-------
None

Description
-----------
No available documentation.
") SetVSense;
		void SetVSense(const bool aVSense);

		/****** StepGeom_SurfacePatch::SetVTransition ******/
		/****** md5 signature: 82e67ef17320f97e4bba1a3ef10216b3 ******/
		%feature("compactdefaultargs") SetVTransition;
		%feature("autodoc", "
Parameters
----------
aVTransition: StepGeom_TransitionCode

Return
-------
None

Description
-----------
No available documentation.
") SetVTransition;
		void SetVTransition(const StepGeom_TransitionCode aVTransition);

		/****** StepGeom_SurfacePatch::USense ******/
		/****** md5 signature: 9f3d62c9c83f7d2a3797187f8af7bff2 ******/
		%feature("compactdefaultargs") USense;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") USense;
		bool USense();

		/****** StepGeom_SurfacePatch::UTransition ******/
		/****** md5 signature: fb2b9da0bfbb6177f11f010f24a51c35 ******/
		%feature("compactdefaultargs") UTransition;
		%feature("autodoc", "Return
-------
StepGeom_TransitionCode

Description
-----------
No available documentation.
") UTransition;
		StepGeom_TransitionCode UTransition();

		/****** StepGeom_SurfacePatch::VSense ******/
		/****** md5 signature: f46086815d033f549ff8a7443b4820ce ******/
		%feature("compactdefaultargs") VSense;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") VSense;
		bool VSense();

		/****** StepGeom_SurfacePatch::VTransition ******/
		/****** md5 signature: db75e588d9f14c887d2d62ef09e4f8aa ******/
		%feature("compactdefaultargs") VTransition;
		%feature("autodoc", "Return
-------
StepGeom_TransitionCode

Description
-----------
No available documentation.
") VTransition;
		StepGeom_TransitionCode VTransition();

};


%make_alias(StepGeom_SurfacePatch)

%extend StepGeom_SurfacePatch {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class StepGeom_TrimmingMember *
********************************/
class StepGeom_TrimmingMember : public StepData_SelectReal {
	public:
		/****** StepGeom_TrimmingMember::StepGeom_TrimmingMember ******/
		/****** md5 signature: fd519a7b43e8d64ea8f8f850aa8daacc ******/
		%feature("compactdefaultargs") StepGeom_TrimmingMember;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") StepGeom_TrimmingMember;
		 StepGeom_TrimmingMember();

		/****** StepGeom_TrimmingMember::HasName ******/
		/****** md5 signature: 0fcc7580a7b0aa7df9ee626d148cd8f4 ******/
		%feature("compactdefaultargs") HasName;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") HasName;
		bool HasName();

		/****** StepGeom_TrimmingMember::Name ******/
		/****** md5 signature: f81f5718972ea56a52cc674874d73fa6 ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Return
-------
char *

Description
-----------
No available documentation.
") Name;
		const char * Name();

		/****** StepGeom_TrimmingMember::SetName ******/
		/****** md5 signature: 43a419e9da8ca16400e117289b098561 ******/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "
Parameters
----------
name: char *

Return
-------
bool

Description
-----------
No available documentation.
") SetName;
		bool SetName(const char * const name);

};


%make_alias(StepGeom_TrimmingMember)

%extend StepGeom_TrimmingMember {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class StepGeom_TrimmingSelect *
********************************/
class StepGeom_TrimmingSelect : public StepData_SelectType {
	public:
		/****** StepGeom_TrimmingSelect::StepGeom_TrimmingSelect ******/
		/****** md5 signature: 5e6dacc475c039b8d3c97a0f952343d5 ******/
		%feature("compactdefaultargs") StepGeom_TrimmingSelect;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a TrimmingSelect SelectType.
") StepGeom_TrimmingSelect;
		 StepGeom_TrimmingSelect();

		/****** StepGeom_TrimmingSelect::CartesianPoint ******/
		/****** md5 signature: 0e61ca9bfc68a52515fc03161ae4e778 ******/
		%feature("compactdefaultargs") CartesianPoint;
		%feature("autodoc", "Return
-------
opencascade::handle<StepGeom_CartesianPoint>

Description
-----------
returns Value as a CartesianPoint (Null if another type).
") CartesianPoint;
		opencascade::handle<StepGeom_CartesianPoint> CartesianPoint();

		/****** StepGeom_TrimmingSelect::CaseMem ******/
		/****** md5 signature: 3996721cbe1f7f39efa83f015b4146fa ******/
		%feature("compactdefaultargs") CaseMem;
		%feature("autodoc", "
Parameters
----------
ent: StepData_SelectMember

Return
-------
int

Description
-----------
Recognizes a SelectMember as Real, named as PARAMETER_VALUE 1 -> ParameterValue i.e. Real 0 else (i.e. Entity).
") CaseMem;
		int CaseMem(const opencascade::handle<StepData_SelectMember> & ent);

		/****** StepGeom_TrimmingSelect::CaseNum ******/
		/****** md5 signature: ef153e98615228b7740a3c1765b8d82b ******/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient

Return
-------
int

Description
-----------
Recognizes a TrimmingSelect Kind Entity that is: 1 -> CartesianPoint 0 else (i.e. Real).
") CaseNum;
		int CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****** StepGeom_TrimmingSelect::NewMember ******/
		/****** md5 signature: 4dce57062553ca704dad3d58f4286daa ******/
		%feature("compactdefaultargs") NewMember;
		%feature("autodoc", "Return
-------
opencascade::handle<StepData_SelectMember>

Description
-----------
Returns a TrimmingMember (for PARAMETER_VALUE) as preferred.
") NewMember;
		opencascade::handle<StepData_SelectMember> NewMember();

		/****** StepGeom_TrimmingSelect::ParameterValue ******/
		/****** md5 signature: 4e014a2e62e7a08932dd81ef45240e7f ******/
		%feature("compactdefaultargs") ParameterValue;
		%feature("autodoc", "Return
-------
double

Description
-----------
returns Value as a Real (0.0 if not a Real).
") ParameterValue;
		double ParameterValue();

		/****** StepGeom_TrimmingSelect::SetParameterValue ******/
		/****** md5 signature: 8d084a66b1d6bf46b8f80758ab07ce54 ******/
		%feature("compactdefaultargs") SetParameterValue;
		%feature("autodoc", "
Parameters
----------
aParameterValue: double

Return
-------
None

Description
-----------
sets the ParameterValue as Real.
") SetParameterValue;
		void SetParameterValue(const double aParameterValue);

};


%extend StepGeom_TrimmingSelect {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class StepGeom_VectorOrDirection *
***********************************/
class StepGeom_VectorOrDirection : public StepData_SelectType {
	public:
		/****** StepGeom_VectorOrDirection::StepGeom_VectorOrDirection ******/
		/****** md5 signature: 5d3eb8aa2b0bfdc075d8421e046af45e ******/
		%feature("compactdefaultargs") StepGeom_VectorOrDirection;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a VectorOrDirection SelectType.
") StepGeom_VectorOrDirection;
		 StepGeom_VectorOrDirection();

		/****** StepGeom_VectorOrDirection::CaseNum ******/
		/****** md5 signature: ef153e98615228b7740a3c1765b8d82b ******/
		%feature("compactdefaultargs") CaseNum;
		%feature("autodoc", "
Parameters
----------
ent: Standard_Transient

Return
-------
int

Description
-----------
Recognizes a VectorOrDirection Kind Entity that is: 1 -> Vector 2 -> Direction 0 else.
") CaseNum;
		int CaseNum(const opencascade::handle<Standard_Transient> & ent);

		/****** StepGeom_VectorOrDirection::Direction ******/
		/****** md5 signature: f7fac584409a4b82fe25091ddc0f1be8 ******/
		%feature("compactdefaultargs") Direction;
		%feature("autodoc", "Return
-------
opencascade::handle<StepGeom_Direction>

Description
-----------
returns Value as a Direction (Null if another type).
") Direction;
		opencascade::handle<StepGeom_Direction> Direction();

		/****** StepGeom_VectorOrDirection::Vector ******/
		/****** md5 signature: 34658442cbdc74a9b64066cac9e98fde ******/
		%feature("compactdefaultargs") Vector;
		%feature("autodoc", "Return
-------
opencascade::handle<StepGeom_Vector>

Description
-----------
returns Value as a Vector (Null if another type).
") Vector;
		opencascade::handle<StepGeom_Vector> Vector();

};


%extend StepGeom_VectorOrDirection {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************************
* class StepGeom_CartesianTransformationOperator *
*************************************************/
class StepGeom_CartesianTransformationOperator : public StepGeom_GeometricRepresentationItem {
	public:
		/****** StepGeom_CartesianTransformationOperator::StepGeom_CartesianTransformationOperator ******/
		/****** md5 signature: e04003343bba4cebc1c79b441c0b8b31 ******/
		%feature("compactdefaultargs") StepGeom_CartesianTransformationOperator;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a CartesianTransformationOperator.
") StepGeom_CartesianTransformationOperator;
		 StepGeom_CartesianTransformationOperator();

		/****** StepGeom_CartesianTransformationOperator::Axis1 ******/
		/****** md5 signature: f64c70ac0245d3adad88dd5cace2c271 ******/
		%feature("compactdefaultargs") Axis1;
		%feature("autodoc", "Return
-------
opencascade::handle<StepGeom_Direction>

Description
-----------
No available documentation.
") Axis1;
		opencascade::handle<StepGeom_Direction> Axis1();

		/****** StepGeom_CartesianTransformationOperator::Axis2 ******/
		/****** md5 signature: 2642f1021a064ce2b75241e5e31681ca ******/
		%feature("compactdefaultargs") Axis2;
		%feature("autodoc", "Return
-------
opencascade::handle<StepGeom_Direction>

Description
-----------
No available documentation.
") Axis2;
		opencascade::handle<StepGeom_Direction> Axis2();

		/****** StepGeom_CartesianTransformationOperator::HasAxis1 ******/
		/****** md5 signature: 4ef9bdf1b3481469241d8f10dc5052ab ******/
		%feature("compactdefaultargs") HasAxis1;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") HasAxis1;
		bool HasAxis1();

		/****** StepGeom_CartesianTransformationOperator::HasAxis2 ******/
		/****** md5 signature: 2500d9c7ef4c92b21b92f56a9a1cf858 ******/
		%feature("compactdefaultargs") HasAxis2;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") HasAxis2;
		bool HasAxis2();

		/****** StepGeom_CartesianTransformationOperator::HasScale ******/
		/****** md5 signature: 50cee6d84f537576918cccee0d4b3a27 ******/
		%feature("compactdefaultargs") HasScale;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") HasScale;
		bool HasScale();

		/****** StepGeom_CartesianTransformationOperator::Init ******/
		/****** md5 signature: b5554e95773bd2d8665e57438b308db8 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString
hasAaxis1: bool
aAxis1: StepGeom_Direction
hasAaxis2: bool
aAxis2: StepGeom_Direction
aLocalOrigin: StepGeom_CartesianPoint
hasAscale: bool
aScale: double

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const bool hasAaxis1, const opencascade::handle<StepGeom_Direction> & aAxis1, const bool hasAaxis2, const opencascade::handle<StepGeom_Direction> & aAxis2, const opencascade::handle<StepGeom_CartesianPoint> & aLocalOrigin, const bool hasAscale, const double aScale);

		/****** StepGeom_CartesianTransformationOperator::LocalOrigin ******/
		/****** md5 signature: fac6559749c0473f9505794e64c39da8 ******/
		%feature("compactdefaultargs") LocalOrigin;
		%feature("autodoc", "Return
-------
opencascade::handle<StepGeom_CartesianPoint>

Description
-----------
No available documentation.
") LocalOrigin;
		opencascade::handle<StepGeom_CartesianPoint> LocalOrigin();

		/****** StepGeom_CartesianTransformationOperator::Scale ******/
		/****** md5 signature: 61c9c74d8ec40780bdfa84588e6789a4 ******/
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") Scale;
		double Scale();

		/****** StepGeom_CartesianTransformationOperator::SetAxis1 ******/
		/****** md5 signature: 322bab6cfb77cc372aabf134a3af95e9 ******/
		%feature("compactdefaultargs") SetAxis1;
		%feature("autodoc", "
Parameters
----------
aAxis1: StepGeom_Direction

Return
-------
None

Description
-----------
No available documentation.
") SetAxis1;
		void SetAxis1(const opencascade::handle<StepGeom_Direction> & aAxis1);

		/****** StepGeom_CartesianTransformationOperator::SetAxis2 ******/
		/****** md5 signature: 8095a2d3e9b9ebc968c1918fd66ab4a4 ******/
		%feature("compactdefaultargs") SetAxis2;
		%feature("autodoc", "
Parameters
----------
aAxis2: StepGeom_Direction

Return
-------
None

Description
-----------
No available documentation.
") SetAxis2;
		void SetAxis2(const opencascade::handle<StepGeom_Direction> & aAxis2);

		/****** StepGeom_CartesianTransformationOperator::SetLocalOrigin ******/
		/****** md5 signature: df97279c33cdab0d08cc6802b6e8f998 ******/
		%feature("compactdefaultargs") SetLocalOrigin;
		%feature("autodoc", "
Parameters
----------
aLocalOrigin: StepGeom_CartesianPoint

Return
-------
None

Description
-----------
No available documentation.
") SetLocalOrigin;
		void SetLocalOrigin(const opencascade::handle<StepGeom_CartesianPoint> & aLocalOrigin);

		/****** StepGeom_CartesianTransformationOperator::SetScale ******/
		/****** md5 signature: 8badacf4b2e0312f059c811b307b85bd ******/
		%feature("compactdefaultargs") SetScale;
		%feature("autodoc", "
Parameters
----------
aScale: double

Return
-------
None

Description
-----------
No available documentation.
") SetScale;
		void SetScale(const double aScale);

		/****** StepGeom_CartesianTransformationOperator::UnSetAxis1 ******/
		/****** md5 signature: 1f333833ce1c98081f56e28254051546 ******/
		%feature("compactdefaultargs") UnSetAxis1;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") UnSetAxis1;
		void UnSetAxis1();

		/****** StepGeom_CartesianTransformationOperator::UnSetAxis2 ******/
		/****** md5 signature: ffb1f470547b8aa89313b2bca8792c7c ******/
		%feature("compactdefaultargs") UnSetAxis2;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") UnSetAxis2;
		void UnSetAxis2();

		/****** StepGeom_CartesianTransformationOperator::UnSetScale ******/
		/****** md5 signature: a02065e6c52dd82ecd9ed83a28c07075 ******/
		%feature("compactdefaultargs") UnSetScale;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") UnSetScale;
		void UnSetScale();

};


%make_alias(StepGeom_CartesianTransformationOperator)

%extend StepGeom_CartesianTransformationOperator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class StepGeom_Curve *
***********************/
class StepGeom_Curve : public StepGeom_GeometricRepresentationItem {
	public:
		/****** StepGeom_Curve::StepGeom_Curve ******/
		/****** md5 signature: fe66fbef8786129fa474e8bd9aab3ccf ******/
		%feature("compactdefaultargs") StepGeom_Curve;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a Curve.
") StepGeom_Curve;
		 StepGeom_Curve();

};


%make_alias(StepGeom_Curve)

%extend StepGeom_Curve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class StepGeom_Direction *
***************************/
class StepGeom_Direction : public StepGeom_GeometricRepresentationItem {
	public:
		/****** StepGeom_Direction::StepGeom_Direction ******/
		/****** md5 signature: c832d9097185635d434990446227b79e ******/
		%feature("compactdefaultargs") StepGeom_Direction;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a Direction.
") StepGeom_Direction;
		 StepGeom_Direction();

		/****** StepGeom_Direction::DirectionRatios ******/
		/****** md5 signature: b07fc59ef1d89da3985fb97621b9ba59 ******/
		%feature("compactdefaultargs") DirectionRatios;
		%feature("autodoc", "Return
-------
std::array<double, 3>

Description
-----------
No available documentation.
") DirectionRatios;
		const std::array<double, 3> & DirectionRatios();

		/****** StepGeom_Direction::DirectionRatiosValue ******/
		/****** md5 signature: b0bead15b8d639f9b126afbb4df6a83b ******/
		%feature("compactdefaultargs") DirectionRatiosValue;
		%feature("autodoc", "
Parameters
----------
theInd: int

Return
-------
double

Description
-----------
No available documentation.
") DirectionRatiosValue;
		double DirectionRatiosValue(const int theInd);

		/****** StepGeom_Direction::Init ******/
		/****** md5 signature: 4187a5b5a80ec151caaa664de469fee4 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theName: TCollection_HAsciiString
theDirectionRatios: TColStd_HArray1OfReal

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theName, const opencascade::handle<TColStd_HArray1OfReal> & theDirectionRatios);

		/****** StepGeom_Direction::Init2D ******/
		/****** md5 signature: 4f89885f6aeb095491c8f78f947e0ef5 ******/
		%feature("compactdefaultargs") Init2D;
		%feature("autodoc", "
Parameters
----------
theName: TCollection_HAsciiString
theDirectionRatios1: double
theDirectionRatios2: double

Return
-------
None

Description
-----------
No available documentation.
") Init2D;
		void Init2D(const opencascade::handle<TCollection_HAsciiString> & theName, const double theDirectionRatios1, const double theDirectionRatios2);

		/****** StepGeom_Direction::Init3D ******/
		/****** md5 signature: 64cc71984f37941160d19dc595d006cd ******/
		%feature("compactdefaultargs") Init3D;
		%feature("autodoc", "
Parameters
----------
theName: TCollection_HAsciiString
theDirectionRatios1: double
theDirectionRatios2: double
theDirectionRatios3: double

Return
-------
None

Description
-----------
No available documentation.
") Init3D;
		void Init3D(const opencascade::handle<TCollection_HAsciiString> & theName, const double theDirectionRatios1, const double theDirectionRatios2, const double theDirectionRatios3);

		/****** StepGeom_Direction::NbDirectionRatios ******/
		/****** md5 signature: 00eb1863820d781aa9f837067dcf7389 ******/
		%feature("compactdefaultargs") NbDirectionRatios;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbDirectionRatios;
		int NbDirectionRatios();

		/****** StepGeom_Direction::SetDirectionRatios ******/
		/****** md5 signature: d7d3e03e8d9ec13ea09e865d5a23413c ******/
		%feature("compactdefaultargs") SetDirectionRatios;
		%feature("autodoc", "
Parameters
----------
theDirectionRatios: TColStd_HArray1OfReal

Return
-------
None

Description
-----------
No available documentation.
") SetDirectionRatios;
		void SetDirectionRatios(const opencascade::handle<TColStd_HArray1OfReal> & theDirectionRatios);

		/****** StepGeom_Direction::SetDirectionRatios ******/
		/****** md5 signature: 7a5b9de9a1f6267e74493524fe32aaab ******/
		%feature("compactdefaultargs") SetDirectionRatios;
		%feature("autodoc", "
Parameters
----------
theDirectionRatios: std::array<double, 3>

Return
-------
None

Description
-----------
No available documentation.
") SetDirectionRatios;
		void SetDirectionRatios(const std::array<double, 3> & theDirectionRatios);

		/****** StepGeom_Direction::SetNbDirectionRatios ******/
		/****** md5 signature: 0b02c2e7cfa6f78a015d3e7a77dd5004 ******/
		%feature("compactdefaultargs") SetNbDirectionRatios;
		%feature("autodoc", "
Parameters
----------
theSize: int

Return
-------
None

Description
-----------
No available documentation.
") SetNbDirectionRatios;
		void SetNbDirectionRatios(const int theSize);

};


%make_alias(StepGeom_Direction)

%extend StepGeom_Direction {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class StepGeom_Placement *
***************************/
class StepGeom_Placement : public StepGeom_GeometricRepresentationItem {
	public:
		/****** StepGeom_Placement::StepGeom_Placement ******/
		/****** md5 signature: 59673391f2ccda4e92dd3aa9d802819a ******/
		%feature("compactdefaultargs") StepGeom_Placement;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a Placement.
") StepGeom_Placement;
		 StepGeom_Placement();

		/****** StepGeom_Placement::Init ******/
		/****** md5 signature: 2efbbedb659efd84fbed9e5509f3bf0c ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString
aLocation: StepGeom_CartesianPoint

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<StepGeom_CartesianPoint> & aLocation);

		/****** StepGeom_Placement::Location ******/
		/****** md5 signature: 6004a7b0bee22dd7dc9747bf5d00875b ******/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "Return
-------
opencascade::handle<StepGeom_CartesianPoint>

Description
-----------
No available documentation.
") Location;
		opencascade::handle<StepGeom_CartesianPoint> Location();

		/****** StepGeom_Placement::SetLocation ******/
		/****** md5 signature: 6a966f18402e676ff696121568dd62b9 ******/
		%feature("compactdefaultargs") SetLocation;
		%feature("autodoc", "
Parameters
----------
aLocation: StepGeom_CartesianPoint

Return
-------
None

Description
-----------
No available documentation.
") SetLocation;
		void SetLocation(const opencascade::handle<StepGeom_CartesianPoint> & aLocation);

};


%make_alias(StepGeom_Placement)

%extend StepGeom_Placement {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class StepGeom_Point *
***********************/
class StepGeom_Point : public StepGeom_GeometricRepresentationItem {
	public:
		/****** StepGeom_Point::StepGeom_Point ******/
		/****** md5 signature: 7d214be0b7a1c617c0b9760233f22ab0 ******/
		%feature("compactdefaultargs") StepGeom_Point;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a Point.
") StepGeom_Point;
		 StepGeom_Point();

};


%make_alias(StepGeom_Point)

%extend StepGeom_Point {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************************
* class StepGeom_ReparametrisedCompositeCurveSegment *
*****************************************************/
class StepGeom_ReparametrisedCompositeCurveSegment : public StepGeom_CompositeCurveSegment {
	public:
		/****** StepGeom_ReparametrisedCompositeCurveSegment::StepGeom_ReparametrisedCompositeCurveSegment ******/
		/****** md5 signature: 39c1baf8e78d94bcdf5336df5dedb70a ******/
		%feature("compactdefaultargs") StepGeom_ReparametrisedCompositeCurveSegment;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a ReparametrisedCompositeCurveSegment.
") StepGeom_ReparametrisedCompositeCurveSegment;
		 StepGeom_ReparametrisedCompositeCurveSegment();

		/****** StepGeom_ReparametrisedCompositeCurveSegment::Init ******/
		/****** md5 signature: b82b6735c9c91f32eaedfec0d1069adb ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aTransition: StepGeom_TransitionCode
aSameSense: bool
aParentCurve: StepGeom_Curve
aParamLength: double

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const StepGeom_TransitionCode aTransition, const bool aSameSense, const opencascade::handle<StepGeom_Curve> & aParentCurve, const double aParamLength);

		/****** StepGeom_ReparametrisedCompositeCurveSegment::ParamLength ******/
		/****** md5 signature: 1e6a32e29d422229fbc7efc933f8bcb0 ******/
		%feature("compactdefaultargs") ParamLength;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") ParamLength;
		double ParamLength();

		/****** StepGeom_ReparametrisedCompositeCurveSegment::SetParamLength ******/
		/****** md5 signature: fa50b1a0aba643dbd4759ace7687a769 ******/
		%feature("compactdefaultargs") SetParamLength;
		%feature("autodoc", "
Parameters
----------
aParamLength: double

Return
-------
None

Description
-----------
No available documentation.
") SetParamLength;
		void SetParamLength(const double aParamLength);

};


%make_alias(StepGeom_ReparametrisedCompositeCurveSegment)

%extend StepGeom_ReparametrisedCompositeCurveSegment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class StepGeom_SuParameters *
******************************/
class StepGeom_SuParameters : public StepGeom_GeometricRepresentationItem {
	public:
		/****** StepGeom_SuParameters::StepGeom_SuParameters ******/
		/****** md5 signature: 85a569687f8fad7c39c37d9d4f26571a ******/
		%feature("compactdefaultargs") StepGeom_SuParameters;
		%feature("autodoc", "Return
-------
None

Description
-----------
default constructor.
") StepGeom_SuParameters;
		 StepGeom_SuParameters();

		/****** StepGeom_SuParameters::A ******/
		/****** md5 signature: 4335effbf507c8b584e6cff76a8eb292 ******/
		%feature("compactdefaultargs") A;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns field A.
") A;
		double A();

		/****** StepGeom_SuParameters::Alpha ******/
		/****** md5 signature: 1249bfb26c689e960f720a1f10918fca ******/
		%feature("compactdefaultargs") Alpha;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns field Alpha.
") Alpha;
		double Alpha();

		/****** StepGeom_SuParameters::B ******/
		/****** md5 signature: 5d9313e1761a09e1233875a84cad130d ******/
		%feature("compactdefaultargs") B;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns field B.
") B;
		double B();

		/****** StepGeom_SuParameters::Beta ******/
		/****** md5 signature: 04374867707749c17aa0164d2055dd21 ******/
		%feature("compactdefaultargs") Beta;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns field Beta.
") Beta;
		double Beta();

		/****** StepGeom_SuParameters::C ******/
		/****** md5 signature: 1c6d2c824eb03e67edf6a43b409473d9 ******/
		%feature("compactdefaultargs") C;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns field C.
") C;
		double C();

		/****** StepGeom_SuParameters::Gamma ******/
		/****** md5 signature: 18f5c29194608e881cc2fc386dc0f175 ******/
		%feature("compactdefaultargs") Gamma;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns field Gamma.
") Gamma;
		double Gamma();

		/****** StepGeom_SuParameters::Init ******/
		/****** md5 signature: e6b7295fcb8f2b1a4f49eaa532f7593f ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theRepresentationItem_Name: TCollection_HAsciiString
theA: double
theAlpha: double
theB: double
theBeta: double
theC: double
theGamma: double

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theRepresentationItem_Name, const double theA, const double theAlpha, const double theB, const double theBeta, const double theC, const double theGamma);

		/****** StepGeom_SuParameters::SetA ******/
		/****** md5 signature: a9692d3dd59ef9416814e5435ec79fd5 ******/
		%feature("compactdefaultargs") SetA;
		%feature("autodoc", "
Parameters
----------
theA: double

Return
-------
None

Description
-----------
Sets field A.
") SetA;
		void SetA(const double theA);

		/****** StepGeom_SuParameters::SetAlpha ******/
		/****** md5 signature: 61098b270e07c601e14c705da5b6de45 ******/
		%feature("compactdefaultargs") SetAlpha;
		%feature("autodoc", "
Parameters
----------
theAlpha: double

Return
-------
None

Description
-----------
Sets field Alpha.
") SetAlpha;
		void SetAlpha(const double theAlpha);

		/****** StepGeom_SuParameters::SetB ******/
		/****** md5 signature: 14cb739f04b0f531904ad6d3c3b56409 ******/
		%feature("compactdefaultargs") SetB;
		%feature("autodoc", "
Parameters
----------
theB: double

Return
-------
None

Description
-----------
Sets field B.
") SetB;
		void SetB(const double theB);

		/****** StepGeom_SuParameters::SetBeta ******/
		/****** md5 signature: 036d9cda57a06534200c6d09ba6a8228 ******/
		%feature("compactdefaultargs") SetBeta;
		%feature("autodoc", "
Parameters
----------
theBeta: double

Return
-------
None

Description
-----------
Sets field Beta.
") SetBeta;
		void SetBeta(const double theBeta);

		/****** StepGeom_SuParameters::SetC ******/
		/****** md5 signature: 76fd4217be85a631351da4ca84e4b5eb ******/
		%feature("compactdefaultargs") SetC;
		%feature("autodoc", "
Parameters
----------
theC: double

Return
-------
None

Description
-----------
Sets field C.
") SetC;
		void SetC(const double theC);

		/****** StepGeom_SuParameters::SetGamma ******/
		/****** md5 signature: e925211cc68437a2bffd4b248200dfef ******/
		%feature("compactdefaultargs") SetGamma;
		%feature("autodoc", "
Parameters
----------
theGamma: double

Return
-------
None

Description
-----------
Sets field Gamma.
") SetGamma;
		void SetGamma(const double theGamma);

};


%make_alias(StepGeom_SuParameters)

%extend StepGeom_SuParameters {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class StepGeom_Surface *
*************************/
class StepGeom_Surface : public StepGeom_GeometricRepresentationItem {
	public:
		/****** StepGeom_Surface::StepGeom_Surface ******/
		/****** md5 signature: 71cc7a330f1935b52e9e47f7024e5d30 ******/
		%feature("compactdefaultargs") StepGeom_Surface;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a Surface.
") StepGeom_Surface;
		 StepGeom_Surface();

};


%make_alias(StepGeom_Surface)

%extend StepGeom_Surface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class StepGeom_Vector *
************************/
class StepGeom_Vector : public StepGeom_GeometricRepresentationItem {
	public:
		/****** StepGeom_Vector::StepGeom_Vector ******/
		/****** md5 signature: 3afc45f2e5e7c325b10bb5bb4bf06f65 ******/
		%feature("compactdefaultargs") StepGeom_Vector;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a Vector.
") StepGeom_Vector;
		 StepGeom_Vector();

		/****** StepGeom_Vector::Init ******/
		/****** md5 signature: 8c81bbc0aaea1bcb680e92e342f0e2a2 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString
aOrientation: StepGeom_Direction
aMagnitude: double

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<StepGeom_Direction> & aOrientation, const double aMagnitude);

		/****** StepGeom_Vector::Magnitude ******/
		/****** md5 signature: 026cdc475028fea886fee2bde31225cd ******/
		%feature("compactdefaultargs") Magnitude;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") Magnitude;
		double Magnitude();

		/****** StepGeom_Vector::Orientation ******/
		/****** md5 signature: c15d8334f768a61c925ef032b15fafce ******/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "Return
-------
opencascade::handle<StepGeom_Direction>

Description
-----------
No available documentation.
") Orientation;
		opencascade::handle<StepGeom_Direction> Orientation();

		/****** StepGeom_Vector::SetMagnitude ******/
		/****** md5 signature: ece0b007cc71391868aa62fe839e2b03 ******/
		%feature("compactdefaultargs") SetMagnitude;
		%feature("autodoc", "
Parameters
----------
aMagnitude: double

Return
-------
None

Description
-----------
No available documentation.
") SetMagnitude;
		void SetMagnitude(const double aMagnitude);

		/****** StepGeom_Vector::SetOrientation ******/
		/****** md5 signature: 1251f06eb699f1fa1f9c8e48498c1402 ******/
		%feature("compactdefaultargs") SetOrientation;
		%feature("autodoc", "
Parameters
----------
aOrientation: StepGeom_Direction

Return
-------
None

Description
-----------
No available documentation.
") SetOrientation;
		void SetOrientation(const opencascade::handle<StepGeom_Direction> & aOrientation);

};


%make_alias(StepGeom_Vector)

%extend StepGeom_Vector {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class StepGeom_Axis1Placement *
********************************/
class StepGeom_Axis1Placement : public StepGeom_Placement {
	public:
		/****** StepGeom_Axis1Placement::StepGeom_Axis1Placement ******/
		/****** md5 signature: e7a1179279d6452afcbb4b6bedca5623 ******/
		%feature("compactdefaultargs") StepGeom_Axis1Placement;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a Axis1Placement.
") StepGeom_Axis1Placement;
		 StepGeom_Axis1Placement();

		/****** StepGeom_Axis1Placement::Axis ******/
		/****** md5 signature: 5fe9473d0bf736090272dc4b9ced7d02 ******/
		%feature("compactdefaultargs") Axis;
		%feature("autodoc", "Return
-------
opencascade::handle<StepGeom_Direction>

Description
-----------
No available documentation.
") Axis;
		opencascade::handle<StepGeom_Direction> Axis();

		/****** StepGeom_Axis1Placement::HasAxis ******/
		/****** md5 signature: bab90de1015a163642364d21c8b01007 ******/
		%feature("compactdefaultargs") HasAxis;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") HasAxis;
		bool HasAxis();

		/****** StepGeom_Axis1Placement::Init ******/
		/****** md5 signature: 1114c2925ebae7c99a831e9ffd388f11 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString
aLocation: StepGeom_CartesianPoint
hasAaxis: bool
aAxis: StepGeom_Direction

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<StepGeom_CartesianPoint> & aLocation, const bool hasAaxis, const opencascade::handle<StepGeom_Direction> & aAxis);

		/****** StepGeom_Axis1Placement::SetAxis ******/
		/****** md5 signature: b203badf598a130517d33f618a74395b ******/
		%feature("compactdefaultargs") SetAxis;
		%feature("autodoc", "
Parameters
----------
aAxis: StepGeom_Direction

Return
-------
None

Description
-----------
No available documentation.
") SetAxis;
		void SetAxis(const opencascade::handle<StepGeom_Direction> & aAxis);

		/****** StepGeom_Axis1Placement::UnSetAxis ******/
		/****** md5 signature: 3e85231b1e4817402cba2d4edbde039b ******/
		%feature("compactdefaultargs") UnSetAxis;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") UnSetAxis;
		void UnSetAxis();

};


%make_alias(StepGeom_Axis1Placement)

%extend StepGeom_Axis1Placement {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class StepGeom_Axis2Placement2d *
**********************************/
class StepGeom_Axis2Placement2d : public StepGeom_Placement {
	public:
		/****** StepGeom_Axis2Placement2d::StepGeom_Axis2Placement2d ******/
		/****** md5 signature: ab271bb32321b923c4945e25abc83cb3 ******/
		%feature("compactdefaultargs") StepGeom_Axis2Placement2d;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a Axis2Placement2d.
") StepGeom_Axis2Placement2d;
		 StepGeom_Axis2Placement2d();

		/****** StepGeom_Axis2Placement2d::HasRefDirection ******/
		/****** md5 signature: 13ed841d4941659b539205b748282d65 ******/
		%feature("compactdefaultargs") HasRefDirection;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") HasRefDirection;
		bool HasRefDirection();

		/****** StepGeom_Axis2Placement2d::Init ******/
		/****** md5 signature: 0b7b61d6d1dfb0ccdfd0a822b4c08a88 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString
aLocation: StepGeom_CartesianPoint
hasArefDirection: bool
aRefDirection: StepGeom_Direction

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<StepGeom_CartesianPoint> & aLocation, const bool hasArefDirection, const opencascade::handle<StepGeom_Direction> & aRefDirection);

		/****** StepGeom_Axis2Placement2d::RefDirection ******/
		/****** md5 signature: cf3492d32b69d1497c22dff2b698fb1a ******/
		%feature("compactdefaultargs") RefDirection;
		%feature("autodoc", "Return
-------
opencascade::handle<StepGeom_Direction>

Description
-----------
No available documentation.
") RefDirection;
		opencascade::handle<StepGeom_Direction> RefDirection();

		/****** StepGeom_Axis2Placement2d::SetRefDirection ******/
		/****** md5 signature: 74cd03c91235077de4b1b3c16956f0ff ******/
		%feature("compactdefaultargs") SetRefDirection;
		%feature("autodoc", "
Parameters
----------
aRefDirection: StepGeom_Direction

Return
-------
None

Description
-----------
No available documentation.
") SetRefDirection;
		void SetRefDirection(const opencascade::handle<StepGeom_Direction> & aRefDirection);

		/****** StepGeom_Axis2Placement2d::UnSetRefDirection ******/
		/****** md5 signature: 386d78e52cf200cf8dab56dc8a8e5d45 ******/
		%feature("compactdefaultargs") UnSetRefDirection;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") UnSetRefDirection;
		void UnSetRefDirection();

};


%make_alias(StepGeom_Axis2Placement2d)

%extend StepGeom_Axis2Placement2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class StepGeom_Axis2Placement3d *
**********************************/
class StepGeom_Axis2Placement3d : public StepGeom_Placement {
	public:
		/****** StepGeom_Axis2Placement3d::StepGeom_Axis2Placement3d ******/
		/****** md5 signature: 72359058a32015b2b3676fd338aaac34 ******/
		%feature("compactdefaultargs") StepGeom_Axis2Placement3d;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a Axis2Placement3d.
") StepGeom_Axis2Placement3d;
		 StepGeom_Axis2Placement3d();

		/****** StepGeom_Axis2Placement3d::Axis ******/
		/****** md5 signature: 5fe9473d0bf736090272dc4b9ced7d02 ******/
		%feature("compactdefaultargs") Axis;
		%feature("autodoc", "Return
-------
opencascade::handle<StepGeom_Direction>

Description
-----------
No available documentation.
") Axis;
		opencascade::handle<StepGeom_Direction> Axis();

		/****** StepGeom_Axis2Placement3d::HasAxis ******/
		/****** md5 signature: bab90de1015a163642364d21c8b01007 ******/
		%feature("compactdefaultargs") HasAxis;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") HasAxis;
		bool HasAxis();

		/****** StepGeom_Axis2Placement3d::HasRefDirection ******/
		/****** md5 signature: 13ed841d4941659b539205b748282d65 ******/
		%feature("compactdefaultargs") HasRefDirection;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") HasRefDirection;
		bool HasRefDirection();

		/****** StepGeom_Axis2Placement3d::Init ******/
		/****** md5 signature: 6c7f507410a785c7cd433a8a5f7b0b08 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString
aLocation: StepGeom_CartesianPoint
hasAaxis: bool
aAxis: StepGeom_Direction
hasArefDirection: bool
aRefDirection: StepGeom_Direction

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<StepGeom_CartesianPoint> & aLocation, const bool hasAaxis, const opencascade::handle<StepGeom_Direction> & aAxis, const bool hasArefDirection, const opencascade::handle<StepGeom_Direction> & aRefDirection);

		/****** StepGeom_Axis2Placement3d::RefDirection ******/
		/****** md5 signature: cf3492d32b69d1497c22dff2b698fb1a ******/
		%feature("compactdefaultargs") RefDirection;
		%feature("autodoc", "Return
-------
opencascade::handle<StepGeom_Direction>

Description
-----------
No available documentation.
") RefDirection;
		opencascade::handle<StepGeom_Direction> RefDirection();

		/****** StepGeom_Axis2Placement3d::SetAxis ******/
		/****** md5 signature: b203badf598a130517d33f618a74395b ******/
		%feature("compactdefaultargs") SetAxis;
		%feature("autodoc", "
Parameters
----------
aAxis: StepGeom_Direction

Return
-------
None

Description
-----------
No available documentation.
") SetAxis;
		void SetAxis(const opencascade::handle<StepGeom_Direction> & aAxis);

		/****** StepGeom_Axis2Placement3d::SetRefDirection ******/
		/****** md5 signature: 74cd03c91235077de4b1b3c16956f0ff ******/
		%feature("compactdefaultargs") SetRefDirection;
		%feature("autodoc", "
Parameters
----------
aRefDirection: StepGeom_Direction

Return
-------
None

Description
-----------
No available documentation.
") SetRefDirection;
		void SetRefDirection(const opencascade::handle<StepGeom_Direction> & aRefDirection);

		/****** StepGeom_Axis2Placement3d::UnSetAxis ******/
		/****** md5 signature: 3e85231b1e4817402cba2d4edbde039b ******/
		%feature("compactdefaultargs") UnSetAxis;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") UnSetAxis;
		void UnSetAxis();

		/****** StepGeom_Axis2Placement3d::UnSetRefDirection ******/
		/****** md5 signature: 386d78e52cf200cf8dab56dc8a8e5d45 ******/
		%feature("compactdefaultargs") UnSetRefDirection;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") UnSetRefDirection;
		void UnSetRefDirection();

};


%make_alias(StepGeom_Axis2Placement3d)

%extend StepGeom_Axis2Placement3d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class StepGeom_BoundedCurve *
******************************/
class StepGeom_BoundedCurve : public StepGeom_Curve {
	public:
		/****** StepGeom_BoundedCurve::StepGeom_BoundedCurve ******/
		/****** md5 signature: 634cc5804d611437e8ba76f2b3ac2b54 ******/
		%feature("compactdefaultargs") StepGeom_BoundedCurve;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a BoundedCurve.
") StepGeom_BoundedCurve;
		 StepGeom_BoundedCurve();

};


%make_alias(StepGeom_BoundedCurve)

%extend StepGeom_BoundedCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class StepGeom_BoundedSurface *
********************************/
class StepGeom_BoundedSurface : public StepGeom_Surface {
	public:
		/****** StepGeom_BoundedSurface::StepGeom_BoundedSurface ******/
		/****** md5 signature: 44486220688d4320445df347d6a3312a ******/
		%feature("compactdefaultargs") StepGeom_BoundedSurface;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a BoundedSurface.
") StepGeom_BoundedSurface;
		 StepGeom_BoundedSurface();

};


%make_alias(StepGeom_BoundedSurface)

%extend StepGeom_BoundedSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class StepGeom_CartesianPoint *
********************************/
class StepGeom_CartesianPoint : public StepGeom_Point {
	public:
		/****** StepGeom_CartesianPoint::StepGeom_CartesianPoint ******/
		/****** md5 signature: 1d071599fd3352016036dc0ff1abed68 ******/
		%feature("compactdefaultargs") StepGeom_CartesianPoint;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a CartesianPoint.
") StepGeom_CartesianPoint;
		 StepGeom_CartesianPoint();

		/****** StepGeom_CartesianPoint::Coordinates ******/
		/****** md5 signature: 4b4e79ae0a20721f633a985c3fd6d45b ******/
		%feature("compactdefaultargs") Coordinates;
		%feature("autodoc", "Return
-------
std::array<double, 3>

Description
-----------
No available documentation.
") Coordinates;
		const std::array<double, 3> & Coordinates();

		/****** StepGeom_CartesianPoint::CoordinatesValue ******/
		/****** md5 signature: e0526090a71f248378c5e28709ca6afd ******/
		%feature("compactdefaultargs") CoordinatesValue;
		%feature("autodoc", "
Parameters
----------
theInd: int

Return
-------
double

Description
-----------
No available documentation.
") CoordinatesValue;
		double CoordinatesValue(const int theInd);

		/****** StepGeom_CartesianPoint::Init ******/
		/****** md5 signature: 09b2c02b789c816af69e9befccc81c83 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theName: TCollection_HAsciiString
theCoordinates: TColStd_HArray1OfReal

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & theName, const opencascade::handle<TColStd_HArray1OfReal> & theCoordinates);

		/****** StepGeom_CartesianPoint::Init2D ******/
		/****** md5 signature: 663b84b2b4abef169a6f3185e2c063ef ******/
		%feature("compactdefaultargs") Init2D;
		%feature("autodoc", "
Parameters
----------
theName: TCollection_HAsciiString
theX: double
theY: double

Return
-------
None

Description
-----------
No available documentation.
") Init2D;
		void Init2D(const opencascade::handle<TCollection_HAsciiString> & theName, const double theX, const double theY);

		/****** StepGeom_CartesianPoint::Init3D ******/
		/****** md5 signature: b127aff38654c3c1cc84d31e34048b9a ******/
		%feature("compactdefaultargs") Init3D;
		%feature("autodoc", "
Parameters
----------
theName: TCollection_HAsciiString
theX: double
theY: double
theZ: double

Return
-------
None

Description
-----------
No available documentation.
") Init3D;
		void Init3D(const opencascade::handle<TCollection_HAsciiString> & theName, const double theX, const double theY, const double theZ);

		/****** StepGeom_CartesianPoint::NbCoordinates ******/
		/****** md5 signature: 97ead0f0ed0fcfb912ea0cff1845866b ******/
		%feature("compactdefaultargs") NbCoordinates;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbCoordinates;
		int NbCoordinates();

		/****** StepGeom_CartesianPoint::SetCoordinates ******/
		/****** md5 signature: 232047114426aeba86649739e91b4283 ******/
		%feature("compactdefaultargs") SetCoordinates;
		%feature("autodoc", "
Parameters
----------
theCoordinates: TColStd_HArray1OfReal

Return
-------
None

Description
-----------
No available documentation.
") SetCoordinates;
		void SetCoordinates(const opencascade::handle<TColStd_HArray1OfReal> & theCoordinates);

		/****** StepGeom_CartesianPoint::SetCoordinates ******/
		/****** md5 signature: fb90c194cc56bddeade0d732d7928336 ******/
		%feature("compactdefaultargs") SetCoordinates;
		%feature("autodoc", "
Parameters
----------
theCoordinates: std::array<double, 3>

Return
-------
None

Description
-----------
No available documentation.
") SetCoordinates;
		void SetCoordinates(const std::array<double, 3> & theCoordinates);

		/****** StepGeom_CartesianPoint::SetNbCoordinates ******/
		/****** md5 signature: e48c8f717a4e67df81da9f2c156d7d86 ******/
		%feature("compactdefaultargs") SetNbCoordinates;
		%feature("autodoc", "
Parameters
----------
theSize: int

Return
-------
None

Description
-----------
No available documentation.
") SetNbCoordinates;
		void SetNbCoordinates(const int theSize);

};


%make_alias(StepGeom_CartesianPoint)

%extend StepGeom_CartesianPoint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************************
* class StepGeom_CartesianTransformationOperator2d *
***************************************************/
class StepGeom_CartesianTransformationOperator2d : public StepGeom_CartesianTransformationOperator {
	public:
		/****** StepGeom_CartesianTransformationOperator2d::StepGeom_CartesianTransformationOperator2d ******/
		/****** md5 signature: 8ae0156a8bf74ab408dc059a73c3c213 ******/
		%feature("compactdefaultargs") StepGeom_CartesianTransformationOperator2d;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") StepGeom_CartesianTransformationOperator2d;
		 StepGeom_CartesianTransformationOperator2d();

};


%make_alias(StepGeom_CartesianTransformationOperator2d)

%extend StepGeom_CartesianTransformationOperator2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************************
* class StepGeom_CartesianTransformationOperator3d *
***************************************************/
class StepGeom_CartesianTransformationOperator3d : public StepGeom_CartesianTransformationOperator {
	public:
		/****** StepGeom_CartesianTransformationOperator3d::StepGeom_CartesianTransformationOperator3d ******/
		/****** md5 signature: 840e46b0bf9534e0802bdd6ab1fc76fa ******/
		%feature("compactdefaultargs") StepGeom_CartesianTransformationOperator3d;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a CartesianTransformationOperator3d.
") StepGeom_CartesianTransformationOperator3d;
		 StepGeom_CartesianTransformationOperator3d();

		/****** StepGeom_CartesianTransformationOperator3d::Axis3 ******/
		/****** md5 signature: 7a911d84db042868d0066c5134d7fba1 ******/
		%feature("compactdefaultargs") Axis3;
		%feature("autodoc", "Return
-------
opencascade::handle<StepGeom_Direction>

Description
-----------
No available documentation.
") Axis3;
		opencascade::handle<StepGeom_Direction> Axis3();

		/****** StepGeom_CartesianTransformationOperator3d::HasAxis3 ******/
		/****** md5 signature: 72158480079678cfc84acaaf6f47d40d ******/
		%feature("compactdefaultargs") HasAxis3;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") HasAxis3;
		bool HasAxis3();

		/****** StepGeom_CartesianTransformationOperator3d::Init ******/
		/****** md5 signature: e0178d6b5bf3de422c638b55d69b6d9e ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString
hasAaxis1: bool
aAxis1: StepGeom_Direction
hasAaxis2: bool
aAxis2: StepGeom_Direction
aLocalOrigin: StepGeom_CartesianPoint
hasAscale: bool
aScale: double
hasAaxis3: bool
aAxis3: StepGeom_Direction

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const bool hasAaxis1, const opencascade::handle<StepGeom_Direction> & aAxis1, const bool hasAaxis2, const opencascade::handle<StepGeom_Direction> & aAxis2, const opencascade::handle<StepGeom_CartesianPoint> & aLocalOrigin, const bool hasAscale, const double aScale, const bool hasAaxis3, const opencascade::handle<StepGeom_Direction> & aAxis3);

		/****** StepGeom_CartesianTransformationOperator3d::SetAxis3 ******/
		/****** md5 signature: 7754c8e683bdeff2b46a8aaa3ba3058e ******/
		%feature("compactdefaultargs") SetAxis3;
		%feature("autodoc", "
Parameters
----------
aAxis3: StepGeom_Direction

Return
-------
None

Description
-----------
No available documentation.
") SetAxis3;
		void SetAxis3(const opencascade::handle<StepGeom_Direction> & aAxis3);

		/****** StepGeom_CartesianTransformationOperator3d::UnSetAxis3 ******/
		/****** md5 signature: 3f5e0e00d5427ca07534c900ee6cf2d9 ******/
		%feature("compactdefaultargs") UnSetAxis3;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") UnSetAxis3;
		void UnSetAxis3();

};


%make_alias(StepGeom_CartesianTransformationOperator3d)

%extend StepGeom_CartesianTransformationOperator3d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class StepGeom_Conic *
***********************/
class StepGeom_Conic : public StepGeom_Curve {
	public:
		/****** StepGeom_Conic::StepGeom_Conic ******/
		/****** md5 signature: 2c222d87af7bd6ccc3399fa58c63496a ******/
		%feature("compactdefaultargs") StepGeom_Conic;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a Conic.
") StepGeom_Conic;
		 StepGeom_Conic();

		/****** StepGeom_Conic::Init ******/
		/****** md5 signature: 3c46020798d5c4589978ffa5fb8e5d41 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString
aPosition: StepGeom_Axis2Placement

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const StepGeom_Axis2Placement & aPosition);

		/****** StepGeom_Conic::Position ******/
		/****** md5 signature: 43685ad5c084f12525dfed7d6af868e9 ******/
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "Return
-------
StepGeom_Axis2Placement

Description
-----------
No available documentation.
") Position;
		StepGeom_Axis2Placement Position();

		/****** StepGeom_Conic::SetPosition ******/
		/****** md5 signature: 81a872a42b8006c7cbc33ff3f7cc1658 ******/
		%feature("compactdefaultargs") SetPosition;
		%feature("autodoc", "
Parameters
----------
aPosition: StepGeom_Axis2Placement

Return
-------
None

Description
-----------
No available documentation.
") SetPosition;
		void SetPosition(const StepGeom_Axis2Placement & aPosition);

};


%make_alias(StepGeom_Conic)

%extend StepGeom_Conic {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class StepGeom_CurveReplica *
******************************/
class StepGeom_CurveReplica : public StepGeom_Curve {
	public:
		/****** StepGeom_CurveReplica::StepGeom_CurveReplica ******/
		/****** md5 signature: ff2253e37f9b80c675ac588b5e520890 ******/
		%feature("compactdefaultargs") StepGeom_CurveReplica;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a CurveReplica.
") StepGeom_CurveReplica;
		 StepGeom_CurveReplica();

		/****** StepGeom_CurveReplica::Init ******/
		/****** md5 signature: 39cb73b1f0285f3ec9a4b33109f9bc6c ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString
aParentCurve: StepGeom_Curve
aTransformation: StepGeom_CartesianTransformationOperator

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<StepGeom_Curve> & aParentCurve, const opencascade::handle<StepGeom_CartesianTransformationOperator> & aTransformation);

		/****** StepGeom_CurveReplica::ParentCurve ******/
		/****** md5 signature: 97e621a56f129c95047d611625edb505 ******/
		%feature("compactdefaultargs") ParentCurve;
		%feature("autodoc", "Return
-------
opencascade::handle<StepGeom_Curve>

Description
-----------
No available documentation.
") ParentCurve;
		opencascade::handle<StepGeom_Curve> ParentCurve();

		/****** StepGeom_CurveReplica::SetParentCurve ******/
		/****** md5 signature: b904f7ff5ac3c9406128ef65e64ce749 ******/
		%feature("compactdefaultargs") SetParentCurve;
		%feature("autodoc", "
Parameters
----------
aParentCurve: StepGeom_Curve

Return
-------
None

Description
-----------
No available documentation.
") SetParentCurve;
		void SetParentCurve(const opencascade::handle<StepGeom_Curve> & aParentCurve);

		/****** StepGeom_CurveReplica::SetTransformation ******/
		/****** md5 signature: 946c853cb4eb65356d6b9a7b4c103850 ******/
		%feature("compactdefaultargs") SetTransformation;
		%feature("autodoc", "
Parameters
----------
aTransformation: StepGeom_CartesianTransformationOperator

Return
-------
None

Description
-----------
No available documentation.
") SetTransformation;
		void SetTransformation(const opencascade::handle<StepGeom_CartesianTransformationOperator> & aTransformation);

		/****** StepGeom_CurveReplica::Transformation ******/
		/****** md5 signature: c6ce361373c7ceb825e97dfaa58e1ce8 ******/
		%feature("compactdefaultargs") Transformation;
		%feature("autodoc", "Return
-------
opencascade::handle<StepGeom_CartesianTransformationOperator>

Description
-----------
No available documentation.
") Transformation;
		opencascade::handle<StepGeom_CartesianTransformationOperator> Transformation();

};


%make_alias(StepGeom_CurveReplica)

%extend StepGeom_CurveReplica {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class StepGeom_DegeneratePcurve *
**********************************/
class StepGeom_DegeneratePcurve : public StepGeom_Point {
	public:
		/****** StepGeom_DegeneratePcurve::StepGeom_DegeneratePcurve ******/
		/****** md5 signature: bfc741ea18395e1db298506307ce7627 ******/
		%feature("compactdefaultargs") StepGeom_DegeneratePcurve;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a DegeneratePcurve.
") StepGeom_DegeneratePcurve;
		 StepGeom_DegeneratePcurve();

		/****** StepGeom_DegeneratePcurve::BasisSurface ******/
		/****** md5 signature: a392dc35d63547e75f8c22616a036c5d ******/
		%feature("compactdefaultargs") BasisSurface;
		%feature("autodoc", "Return
-------
opencascade::handle<StepGeom_Surface>

Description
-----------
No available documentation.
") BasisSurface;
		opencascade::handle<StepGeom_Surface> BasisSurface();

		/****** StepGeom_DegeneratePcurve::Init ******/
		/****** md5 signature: 0eb3186fe50c5201ad6c39e0b1b53d07 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString
aBasisSurface: StepGeom_Surface
aReferenceToCurve: StepRepr_DefinitionalRepresentation

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<StepGeom_Surface> & aBasisSurface, const opencascade::handle<StepRepr_DefinitionalRepresentation> & aReferenceToCurve);

		/****** StepGeom_DegeneratePcurve::ReferenceToCurve ******/
		/****** md5 signature: a13b194e9ab1903cb35fc15226833648 ******/
		%feature("compactdefaultargs") ReferenceToCurve;
		%feature("autodoc", "Return
-------
opencascade::handle<StepRepr_DefinitionalRepresentation>

Description
-----------
No available documentation.
") ReferenceToCurve;
		opencascade::handle<StepRepr_DefinitionalRepresentation> ReferenceToCurve();

		/****** StepGeom_DegeneratePcurve::SetBasisSurface ******/
		/****** md5 signature: ee1a95d90ec4e9798673d554f8d52949 ******/
		%feature("compactdefaultargs") SetBasisSurface;
		%feature("autodoc", "
Parameters
----------
aBasisSurface: StepGeom_Surface

Return
-------
None

Description
-----------
No available documentation.
") SetBasisSurface;
		void SetBasisSurface(const opencascade::handle<StepGeom_Surface> & aBasisSurface);

		/****** StepGeom_DegeneratePcurve::SetReferenceToCurve ******/
		/****** md5 signature: bd1906a86e8c5a30ab80bf0f4a8a1f13 ******/
		%feature("compactdefaultargs") SetReferenceToCurve;
		%feature("autodoc", "
Parameters
----------
aReferenceToCurve: StepRepr_DefinitionalRepresentation

Return
-------
None

Description
-----------
No available documentation.
") SetReferenceToCurve;
		void SetReferenceToCurve(const opencascade::handle<StepRepr_DefinitionalRepresentation> & aReferenceToCurve);

};


%make_alias(StepGeom_DegeneratePcurve)

%extend StepGeom_DegeneratePcurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class StepGeom_ElementarySurface *
***********************************/
class StepGeom_ElementarySurface : public StepGeom_Surface {
	public:
		/****** StepGeom_ElementarySurface::StepGeom_ElementarySurface ******/
		/****** md5 signature: d79b66a5c9a93e4809c7d93ab2d0c955 ******/
		%feature("compactdefaultargs") StepGeom_ElementarySurface;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a ElementarySurface.
") StepGeom_ElementarySurface;
		 StepGeom_ElementarySurface();

		/****** StepGeom_ElementarySurface::Init ******/
		/****** md5 signature: b693999618f862eb0b476bca863b0036 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString
aPosition: StepGeom_Axis2Placement3d

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<StepGeom_Axis2Placement3d> & aPosition);

		/****** StepGeom_ElementarySurface::Position ******/
		/****** md5 signature: 713393f125742d29dd4ad15bf921e26c ******/
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "Return
-------
opencascade::handle<StepGeom_Axis2Placement3d>

Description
-----------
No available documentation.
") Position;
		opencascade::handle<StepGeom_Axis2Placement3d> Position();

		/****** StepGeom_ElementarySurface::SetPosition ******/
		/****** md5 signature: cdf6c501d6290f351d285af3749a1167 ******/
		%feature("compactdefaultargs") SetPosition;
		%feature("autodoc", "
Parameters
----------
aPosition: StepGeom_Axis2Placement3d

Return
-------
None

Description
-----------
No available documentation.
") SetPosition;
		void SetPosition(const opencascade::handle<StepGeom_Axis2Placement3d> & aPosition);

};


%make_alias(StepGeom_ElementarySurface)

%extend StepGeom_ElementarySurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class StepGeom_Line *
**********************/
class StepGeom_Line : public StepGeom_Curve {
	public:
		/****** StepGeom_Line::StepGeom_Line ******/
		/****** md5 signature: d7e46a31ddd5c0d8456bacc84791901b ******/
		%feature("compactdefaultargs") StepGeom_Line;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a Line.
") StepGeom_Line;
		 StepGeom_Line();

		/****** StepGeom_Line::Dir ******/
		/****** md5 signature: 489f8fa75e5fa369df8e31ed8f64d8a7 ******/
		%feature("compactdefaultargs") Dir;
		%feature("autodoc", "Return
-------
opencascade::handle<StepGeom_Vector>

Description
-----------
No available documentation.
") Dir;
		opencascade::handle<StepGeom_Vector> Dir();

		/****** StepGeom_Line::Init ******/
		/****** md5 signature: badbe9c5791d6edb6a93ccb25eca9fcd ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString
aPnt: StepGeom_CartesianPoint
aDir: StepGeom_Vector

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<StepGeom_CartesianPoint> & aPnt, const opencascade::handle<StepGeom_Vector> & aDir);

		/****** StepGeom_Line::Pnt ******/
		/****** md5 signature: cc4767725abf3bbf4d4522f567b7fbc1 ******/
		%feature("compactdefaultargs") Pnt;
		%feature("autodoc", "Return
-------
opencascade::handle<StepGeom_CartesianPoint>

Description
-----------
No available documentation.
") Pnt;
		opencascade::handle<StepGeom_CartesianPoint> Pnt();

		/****** StepGeom_Line::SetDir ******/
		/****** md5 signature: 97d11eb4dc8a539d9357822ab1fd180e ******/
		%feature("compactdefaultargs") SetDir;
		%feature("autodoc", "
Parameters
----------
aDir: StepGeom_Vector

Return
-------
None

Description
-----------
No available documentation.
") SetDir;
		void SetDir(const opencascade::handle<StepGeom_Vector> & aDir);

		/****** StepGeom_Line::SetPnt ******/
		/****** md5 signature: 880c9b0a37d841ea28c8e4d2fb4b1137 ******/
		%feature("compactdefaultargs") SetPnt;
		%feature("autodoc", "
Parameters
----------
aPnt: StepGeom_CartesianPoint

Return
-------
None

Description
-----------
No available documentation.
") SetPnt;
		void SetPnt(const opencascade::handle<StepGeom_CartesianPoint> & aPnt);

};


%make_alias(StepGeom_Line)

%extend StepGeom_Line {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class StepGeom_OffsetCurve3d *
*******************************/
class StepGeom_OffsetCurve3d : public StepGeom_Curve {
	public:
		/****** StepGeom_OffsetCurve3d::StepGeom_OffsetCurve3d ******/
		/****** md5 signature: 068f0173db37f20b7bba2ddaf0aa396f ******/
		%feature("compactdefaultargs") StepGeom_OffsetCurve3d;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a OffsetCurve3d.
") StepGeom_OffsetCurve3d;
		 StepGeom_OffsetCurve3d();

		/****** StepGeom_OffsetCurve3d::BasisCurve ******/
		/****** md5 signature: 0be9af8ae440c49202c050d8d0c44b0a ******/
		%feature("compactdefaultargs") BasisCurve;
		%feature("autodoc", "Return
-------
opencascade::handle<StepGeom_Curve>

Description
-----------
No available documentation.
") BasisCurve;
		opencascade::handle<StepGeom_Curve> BasisCurve();

		/****** StepGeom_OffsetCurve3d::Distance ******/
		/****** md5 signature: 4132595ec8b1977b3cfc8920d72365c4 ******/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") Distance;
		double Distance();

		/****** StepGeom_OffsetCurve3d::Init ******/
		/****** md5 signature: abd5eabb2f513f5286a69c660fed9d0b ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString
aBasisCurve: StepGeom_Curve
aDistance: double
aSelfIntersect: StepData_Logical
aRefDirection: StepGeom_Direction

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<StepGeom_Curve> & aBasisCurve, const double aDistance, const StepData_Logical aSelfIntersect, const opencascade::handle<StepGeom_Direction> & aRefDirection);

		/****** StepGeom_OffsetCurve3d::RefDirection ******/
		/****** md5 signature: cf3492d32b69d1497c22dff2b698fb1a ******/
		%feature("compactdefaultargs") RefDirection;
		%feature("autodoc", "Return
-------
opencascade::handle<StepGeom_Direction>

Description
-----------
No available documentation.
") RefDirection;
		opencascade::handle<StepGeom_Direction> RefDirection();

		/****** StepGeom_OffsetCurve3d::SelfIntersect ******/
		/****** md5 signature: 3b962cc0483950ab6ae2ff15b08ec9fd ******/
		%feature("compactdefaultargs") SelfIntersect;
		%feature("autodoc", "Return
-------
StepData_Logical

Description
-----------
No available documentation.
") SelfIntersect;
		StepData_Logical SelfIntersect();

		/****** StepGeom_OffsetCurve3d::SetBasisCurve ******/
		/****** md5 signature: 28fd1fe3129f0ded7387f3b2f2a4686a ******/
		%feature("compactdefaultargs") SetBasisCurve;
		%feature("autodoc", "
Parameters
----------
aBasisCurve: StepGeom_Curve

Return
-------
None

Description
-----------
No available documentation.
") SetBasisCurve;
		void SetBasisCurve(const opencascade::handle<StepGeom_Curve> & aBasisCurve);

		/****** StepGeom_OffsetCurve3d::SetDistance ******/
		/****** md5 signature: d39e5a5186985977848140e869eb7cc4 ******/
		%feature("compactdefaultargs") SetDistance;
		%feature("autodoc", "
Parameters
----------
aDistance: double

Return
-------
None

Description
-----------
No available documentation.
") SetDistance;
		void SetDistance(const double aDistance);

		/****** StepGeom_OffsetCurve3d::SetRefDirection ******/
		/****** md5 signature: 74cd03c91235077de4b1b3c16956f0ff ******/
		%feature("compactdefaultargs") SetRefDirection;
		%feature("autodoc", "
Parameters
----------
aRefDirection: StepGeom_Direction

Return
-------
None

Description
-----------
No available documentation.
") SetRefDirection;
		void SetRefDirection(const opencascade::handle<StepGeom_Direction> & aRefDirection);

		/****** StepGeom_OffsetCurve3d::SetSelfIntersect ******/
		/****** md5 signature: 2d7a8417a0b46872a2716425b91b62e7 ******/
		%feature("compactdefaultargs") SetSelfIntersect;
		%feature("autodoc", "
Parameters
----------
aSelfIntersect: StepData_Logical

Return
-------
None

Description
-----------
No available documentation.
") SetSelfIntersect;
		void SetSelfIntersect(const StepData_Logical aSelfIntersect);

};


%make_alias(StepGeom_OffsetCurve3d)

%extend StepGeom_OffsetCurve3d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class StepGeom_OffsetSurface *
*******************************/
class StepGeom_OffsetSurface : public StepGeom_Surface {
	public:
		/****** StepGeom_OffsetSurface::StepGeom_OffsetSurface ******/
		/****** md5 signature: 51858129f84c0a79049b49ca83803230 ******/
		%feature("compactdefaultargs") StepGeom_OffsetSurface;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a OffsetSurface.
") StepGeom_OffsetSurface;
		 StepGeom_OffsetSurface();

		/****** StepGeom_OffsetSurface::BasisSurface ******/
		/****** md5 signature: a392dc35d63547e75f8c22616a036c5d ******/
		%feature("compactdefaultargs") BasisSurface;
		%feature("autodoc", "Return
-------
opencascade::handle<StepGeom_Surface>

Description
-----------
No available documentation.
") BasisSurface;
		opencascade::handle<StepGeom_Surface> BasisSurface();

		/****** StepGeom_OffsetSurface::Distance ******/
		/****** md5 signature: 4132595ec8b1977b3cfc8920d72365c4 ******/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") Distance;
		double Distance();

		/****** StepGeom_OffsetSurface::Init ******/
		/****** md5 signature: 357119783b6e59b1c4e9126d5d018bf5 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString
aBasisSurface: StepGeom_Surface
aDistance: double
aSelfIntersect: StepData_Logical

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<StepGeom_Surface> & aBasisSurface, const double aDistance, const StepData_Logical aSelfIntersect);

		/****** StepGeom_OffsetSurface::SelfIntersect ******/
		/****** md5 signature: 3b962cc0483950ab6ae2ff15b08ec9fd ******/
		%feature("compactdefaultargs") SelfIntersect;
		%feature("autodoc", "Return
-------
StepData_Logical

Description
-----------
No available documentation.
") SelfIntersect;
		StepData_Logical SelfIntersect();

		/****** StepGeom_OffsetSurface::SetBasisSurface ******/
		/****** md5 signature: ee1a95d90ec4e9798673d554f8d52949 ******/
		%feature("compactdefaultargs") SetBasisSurface;
		%feature("autodoc", "
Parameters
----------
aBasisSurface: StepGeom_Surface

Return
-------
None

Description
-----------
No available documentation.
") SetBasisSurface;
		void SetBasisSurface(const opencascade::handle<StepGeom_Surface> & aBasisSurface);

		/****** StepGeom_OffsetSurface::SetDistance ******/
		/****** md5 signature: d39e5a5186985977848140e869eb7cc4 ******/
		%feature("compactdefaultargs") SetDistance;
		%feature("autodoc", "
Parameters
----------
aDistance: double

Return
-------
None

Description
-----------
No available documentation.
") SetDistance;
		void SetDistance(const double aDistance);

		/****** StepGeom_OffsetSurface::SetSelfIntersect ******/
		/****** md5 signature: 2d7a8417a0b46872a2716425b91b62e7 ******/
		%feature("compactdefaultargs") SetSelfIntersect;
		%feature("autodoc", "
Parameters
----------
aSelfIntersect: StepData_Logical

Return
-------
None

Description
-----------
No available documentation.
") SetSelfIntersect;
		void SetSelfIntersect(const StepData_Logical aSelfIntersect);

};


%make_alias(StepGeom_OffsetSurface)

%extend StepGeom_OffsetSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class StepGeom_OrientedSurface *
*********************************/
class StepGeom_OrientedSurface : public StepGeom_Surface {
	public:
		/****** StepGeom_OrientedSurface::StepGeom_OrientedSurface ******/
		/****** md5 signature: f2c5027bfc00a0498f7336e9e62f248a ******/
		%feature("compactdefaultargs") StepGeom_OrientedSurface;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepGeom_OrientedSurface;
		 StepGeom_OrientedSurface();

		/****** StepGeom_OrientedSurface::Init ******/
		/****** md5 signature: 1fe682fbb16fcde758ef496a6aa985f6 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aRepresentationItem_Name: TCollection_HAsciiString
aOrientation: bool

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aRepresentationItem_Name, const bool aOrientation);

		/****** StepGeom_OrientedSurface::Orientation ******/
		/****** md5 signature: f7c8bc405e9c9ac9fe1f41805829040c ******/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns field Orientation.
") Orientation;
		bool Orientation();

		/****** StepGeom_OrientedSurface::SetOrientation ******/
		/****** md5 signature: 238a580265a5247ffe8ab11e50703f59 ******/
		%feature("compactdefaultargs") SetOrientation;
		%feature("autodoc", "
Parameters
----------
Orientation: bool

Return
-------
None

Description
-----------
Set field Orientation.
") SetOrientation;
		void SetOrientation(const bool Orientation);

};


%make_alias(StepGeom_OrientedSurface)

%extend StepGeom_OrientedSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class StepGeom_Pcurve *
************************/
class StepGeom_Pcurve : public StepGeom_Curve {
	public:
		/****** StepGeom_Pcurve::StepGeom_Pcurve ******/
		/****** md5 signature: 6367ade8df3088c2f934b07baf7b4817 ******/
		%feature("compactdefaultargs") StepGeom_Pcurve;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a Pcurve.
") StepGeom_Pcurve;
		 StepGeom_Pcurve();

		/****** StepGeom_Pcurve::BasisSurface ******/
		/****** md5 signature: a392dc35d63547e75f8c22616a036c5d ******/
		%feature("compactdefaultargs") BasisSurface;
		%feature("autodoc", "Return
-------
opencascade::handle<StepGeom_Surface>

Description
-----------
No available documentation.
") BasisSurface;
		opencascade::handle<StepGeom_Surface> BasisSurface();

		/****** StepGeom_Pcurve::Init ******/
		/****** md5 signature: 0eb3186fe50c5201ad6c39e0b1b53d07 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString
aBasisSurface: StepGeom_Surface
aReferenceToCurve: StepRepr_DefinitionalRepresentation

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<StepGeom_Surface> & aBasisSurface, const opencascade::handle<StepRepr_DefinitionalRepresentation> & aReferenceToCurve);

		/****** StepGeom_Pcurve::ReferenceToCurve ******/
		/****** md5 signature: a13b194e9ab1903cb35fc15226833648 ******/
		%feature("compactdefaultargs") ReferenceToCurve;
		%feature("autodoc", "Return
-------
opencascade::handle<StepRepr_DefinitionalRepresentation>

Description
-----------
No available documentation.
") ReferenceToCurve;
		opencascade::handle<StepRepr_DefinitionalRepresentation> ReferenceToCurve();

		/****** StepGeom_Pcurve::SetBasisSurface ******/
		/****** md5 signature: ee1a95d90ec4e9798673d554f8d52949 ******/
		%feature("compactdefaultargs") SetBasisSurface;
		%feature("autodoc", "
Parameters
----------
aBasisSurface: StepGeom_Surface

Return
-------
None

Description
-----------
No available documentation.
") SetBasisSurface;
		void SetBasisSurface(const opencascade::handle<StepGeom_Surface> & aBasisSurface);

		/****** StepGeom_Pcurve::SetReferenceToCurve ******/
		/****** md5 signature: bd1906a86e8c5a30ab80bf0f4a8a1f13 ******/
		%feature("compactdefaultargs") SetReferenceToCurve;
		%feature("autodoc", "
Parameters
----------
aReferenceToCurve: StepRepr_DefinitionalRepresentation

Return
-------
None

Description
-----------
No available documentation.
") SetReferenceToCurve;
		void SetReferenceToCurve(const opencascade::handle<StepRepr_DefinitionalRepresentation> & aReferenceToCurve);

};


%make_alias(StepGeom_Pcurve)

%extend StepGeom_Pcurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class StepGeom_PointOnCurve *
******************************/
class StepGeom_PointOnCurve : public StepGeom_Point {
	public:
		/****** StepGeom_PointOnCurve::StepGeom_PointOnCurve ******/
		/****** md5 signature: a00f07167d9e15abef6505c686b8a352 ******/
		%feature("compactdefaultargs") StepGeom_PointOnCurve;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a PointOnCurve.
") StepGeom_PointOnCurve;
		 StepGeom_PointOnCurve();

		/****** StepGeom_PointOnCurve::BasisCurve ******/
		/****** md5 signature: 0be9af8ae440c49202c050d8d0c44b0a ******/
		%feature("compactdefaultargs") BasisCurve;
		%feature("autodoc", "Return
-------
opencascade::handle<StepGeom_Curve>

Description
-----------
No available documentation.
") BasisCurve;
		opencascade::handle<StepGeom_Curve> BasisCurve();

		/****** StepGeom_PointOnCurve::Init ******/
		/****** md5 signature: 3072f5a4f3b9dc0eee88f04c2c4d9768 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString
aBasisCurve: StepGeom_Curve
aPointParameter: double

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<StepGeom_Curve> & aBasisCurve, const double aPointParameter);

		/****** StepGeom_PointOnCurve::PointParameter ******/
		/****** md5 signature: 067f80e7b2d5415f1b1faedd8dc95977 ******/
		%feature("compactdefaultargs") PointParameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") PointParameter;
		double PointParameter();

		/****** StepGeom_PointOnCurve::SetBasisCurve ******/
		/****** md5 signature: 28fd1fe3129f0ded7387f3b2f2a4686a ******/
		%feature("compactdefaultargs") SetBasisCurve;
		%feature("autodoc", "
Parameters
----------
aBasisCurve: StepGeom_Curve

Return
-------
None

Description
-----------
No available documentation.
") SetBasisCurve;
		void SetBasisCurve(const opencascade::handle<StepGeom_Curve> & aBasisCurve);

		/****** StepGeom_PointOnCurve::SetPointParameter ******/
		/****** md5 signature: ce2ee45c4a5685892e8b485eff7e1fd7 ******/
		%feature("compactdefaultargs") SetPointParameter;
		%feature("autodoc", "
Parameters
----------
aPointParameter: double

Return
-------
None

Description
-----------
No available documentation.
") SetPointParameter;
		void SetPointParameter(const double aPointParameter);

};


%make_alias(StepGeom_PointOnCurve)

%extend StepGeom_PointOnCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class StepGeom_PointOnSurface *
********************************/
class StepGeom_PointOnSurface : public StepGeom_Point {
	public:
		/****** StepGeom_PointOnSurface::StepGeom_PointOnSurface ******/
		/****** md5 signature: d52aed5d96c73f1d64372eb90dd6da10 ******/
		%feature("compactdefaultargs") StepGeom_PointOnSurface;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a PointOnSurface.
") StepGeom_PointOnSurface;
		 StepGeom_PointOnSurface();

		/****** StepGeom_PointOnSurface::BasisSurface ******/
		/****** md5 signature: a392dc35d63547e75f8c22616a036c5d ******/
		%feature("compactdefaultargs") BasisSurface;
		%feature("autodoc", "Return
-------
opencascade::handle<StepGeom_Surface>

Description
-----------
No available documentation.
") BasisSurface;
		opencascade::handle<StepGeom_Surface> BasisSurface();

		/****** StepGeom_PointOnSurface::Init ******/
		/****** md5 signature: 4cbcb6428acaec23693c5b1c6e1afb19 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString
aBasisSurface: StepGeom_Surface
aPointParameterU: double
aPointParameterV: double

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<StepGeom_Surface> & aBasisSurface, const double aPointParameterU, const double aPointParameterV);

		/****** StepGeom_PointOnSurface::PointParameterU ******/
		/****** md5 signature: 965b4684abf643fd7a0c1c3f85a12d19 ******/
		%feature("compactdefaultargs") PointParameterU;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") PointParameterU;
		double PointParameterU();

		/****** StepGeom_PointOnSurface::PointParameterV ******/
		/****** md5 signature: 408bb05d638b73031a47d6b28a5a0e3a ******/
		%feature("compactdefaultargs") PointParameterV;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") PointParameterV;
		double PointParameterV();

		/****** StepGeom_PointOnSurface::SetBasisSurface ******/
		/****** md5 signature: ee1a95d90ec4e9798673d554f8d52949 ******/
		%feature("compactdefaultargs") SetBasisSurface;
		%feature("autodoc", "
Parameters
----------
aBasisSurface: StepGeom_Surface

Return
-------
None

Description
-----------
No available documentation.
") SetBasisSurface;
		void SetBasisSurface(const opencascade::handle<StepGeom_Surface> & aBasisSurface);

		/****** StepGeom_PointOnSurface::SetPointParameterU ******/
		/****** md5 signature: 052ca1f57a28cb3443766fbd68728e32 ******/
		%feature("compactdefaultargs") SetPointParameterU;
		%feature("autodoc", "
Parameters
----------
aPointParameterU: double

Return
-------
None

Description
-----------
No available documentation.
") SetPointParameterU;
		void SetPointParameterU(const double aPointParameterU);

		/****** StepGeom_PointOnSurface::SetPointParameterV ******/
		/****** md5 signature: 5dc5f2e0684f2662a1f4c749be8ef59d ******/
		%feature("compactdefaultargs") SetPointParameterV;
		%feature("autodoc", "
Parameters
----------
aPointParameterV: double

Return
-------
None

Description
-----------
No available documentation.
") SetPointParameterV;
		void SetPointParameterV(const double aPointParameterV);

};


%make_alias(StepGeom_PointOnSurface)

%extend StepGeom_PointOnSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class StepGeom_PointReplica *
******************************/
class StepGeom_PointReplica : public StepGeom_Point {
	public:
		/****** StepGeom_PointReplica::StepGeom_PointReplica ******/
		/****** md5 signature: 8a5ff7732d6bc90bf74dd4a71fa23573 ******/
		%feature("compactdefaultargs") StepGeom_PointReplica;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a PointReplica.
") StepGeom_PointReplica;
		 StepGeom_PointReplica();

		/****** StepGeom_PointReplica::Init ******/
		/****** md5 signature: 98434371977b492a9002b3ad48760670 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString
aParentPt: StepGeom_Point
aTransformation: StepGeom_CartesianTransformationOperator

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<StepGeom_Point> & aParentPt, const opencascade::handle<StepGeom_CartesianTransformationOperator> & aTransformation);

		/****** StepGeom_PointReplica::ParentPt ******/
		/****** md5 signature: b9136a71de8b53fac8740cc2e6e300a1 ******/
		%feature("compactdefaultargs") ParentPt;
		%feature("autodoc", "Return
-------
opencascade::handle<StepGeom_Point>

Description
-----------
No available documentation.
") ParentPt;
		opencascade::handle<StepGeom_Point> ParentPt();

		/****** StepGeom_PointReplica::SetParentPt ******/
		/****** md5 signature: 2cc8fbbb356fab6bc0c14a6f58ce5abc ******/
		%feature("compactdefaultargs") SetParentPt;
		%feature("autodoc", "
Parameters
----------
aParentPt: StepGeom_Point

Return
-------
None

Description
-----------
No available documentation.
") SetParentPt;
		void SetParentPt(const opencascade::handle<StepGeom_Point> & aParentPt);

		/****** StepGeom_PointReplica::SetTransformation ******/
		/****** md5 signature: 946c853cb4eb65356d6b9a7b4c103850 ******/
		%feature("compactdefaultargs") SetTransformation;
		%feature("autodoc", "
Parameters
----------
aTransformation: StepGeom_CartesianTransformationOperator

Return
-------
None

Description
-----------
No available documentation.
") SetTransformation;
		void SetTransformation(const opencascade::handle<StepGeom_CartesianTransformationOperator> & aTransformation);

		/****** StepGeom_PointReplica::Transformation ******/
		/****** md5 signature: c6ce361373c7ceb825e97dfaa58e1ce8 ******/
		%feature("compactdefaultargs") Transformation;
		%feature("autodoc", "Return
-------
opencascade::handle<StepGeom_CartesianTransformationOperator>

Description
-----------
No available documentation.
") Transformation;
		opencascade::handle<StepGeom_CartesianTransformationOperator> Transformation();

};


%make_alias(StepGeom_PointReplica)

%extend StepGeom_PointReplica {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class StepGeom_SurfaceCurve *
******************************/
class StepGeom_SurfaceCurve : public StepGeom_Curve {
	public:
		/****** StepGeom_SurfaceCurve::StepGeom_SurfaceCurve ******/
		/****** md5 signature: faab81132ddf5512051dac42e6d62e70 ******/
		%feature("compactdefaultargs") StepGeom_SurfaceCurve;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a SurfaceCurve.
") StepGeom_SurfaceCurve;
		 StepGeom_SurfaceCurve();

		/****** StepGeom_SurfaceCurve::AssociatedGeometry ******/
		/****** md5 signature: 9fb1590033aedbc0f766622b2cc775ac ******/
		%feature("compactdefaultargs") AssociatedGeometry;
		%feature("autodoc", "Return
-------
opencascade::handle<NCollection_HArray1<StepGeom_PcurveOrSurface>>

Description
-----------
No available documentation.
") AssociatedGeometry;
		opencascade::handle<NCollection_HArray1<StepGeom_PcurveOrSurface>> AssociatedGeometry();

		/****** StepGeom_SurfaceCurve::AssociatedGeometryValue ******/
		/****** md5 signature: 8c75a1f687e05b368eed47062fb0b7e6 ******/
		%feature("compactdefaultargs") AssociatedGeometryValue;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
StepGeom_PcurveOrSurface

Description
-----------
No available documentation.
") AssociatedGeometryValue;
		StepGeom_PcurveOrSurface AssociatedGeometryValue(const int num);

		/****** StepGeom_SurfaceCurve::Curve3d ******/
		/****** md5 signature: b58fe32e49d99e4a03b958f45706fdfb ******/
		%feature("compactdefaultargs") Curve3d;
		%feature("autodoc", "Return
-------
opencascade::handle<StepGeom_Curve>

Description
-----------
No available documentation.
") Curve3d;
		opencascade::handle<StepGeom_Curve> Curve3d();

		/****** StepGeom_SurfaceCurve::Init ******/
		/****** md5 signature: eaee9db02ec3e58c9277437037428a38 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString
aCurve3d: StepGeom_Curve
aAssociatedGeometry: NCollection_HArray1<StepGeom_PcurveOrSurface
aMasterRepresentation: StepGeom_PreferredSurfaceCurveRepresentation

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<StepGeom_Curve> & aCurve3d, const opencascade::handle<NCollection_HArray1<StepGeom_PcurveOrSurface>> & aAssociatedGeometry, const StepGeom_PreferredSurfaceCurveRepresentation aMasterRepresentation);

		/****** StepGeom_SurfaceCurve::MasterRepresentation ******/
		/****** md5 signature: 5cf67b3c4f8ba5db5f6b1f5604cbff86 ******/
		%feature("compactdefaultargs") MasterRepresentation;
		%feature("autodoc", "Return
-------
StepGeom_PreferredSurfaceCurveRepresentation

Description
-----------
No available documentation.
") MasterRepresentation;
		StepGeom_PreferredSurfaceCurveRepresentation MasterRepresentation();

		/****** StepGeom_SurfaceCurve::NbAssociatedGeometry ******/
		/****** md5 signature: 3e4078920560dcd0b6a7a89a1b958bae ******/
		%feature("compactdefaultargs") NbAssociatedGeometry;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbAssociatedGeometry;
		int NbAssociatedGeometry();

		/****** StepGeom_SurfaceCurve::SetAssociatedGeometry ******/
		/****** md5 signature: e2da567b18933e9c14912fbb6f22a432 ******/
		%feature("compactdefaultargs") SetAssociatedGeometry;
		%feature("autodoc", "
Parameters
----------
aAssociatedGeometry: NCollection_HArray1<StepGeom_PcurveOrSurface

Return
-------
None

Description
-----------
No available documentation.
") SetAssociatedGeometry;
		void SetAssociatedGeometry(const opencascade::handle<NCollection_HArray1<StepGeom_PcurveOrSurface>> & aAssociatedGeometry);

		/****** StepGeom_SurfaceCurve::SetCurve3d ******/
		/****** md5 signature: 2cbfc24e206b09964d3b73796bd40770 ******/
		%feature("compactdefaultargs") SetCurve3d;
		%feature("autodoc", "
Parameters
----------
aCurve3d: StepGeom_Curve

Return
-------
None

Description
-----------
No available documentation.
") SetCurve3d;
		void SetCurve3d(const opencascade::handle<StepGeom_Curve> & aCurve3d);

		/****** StepGeom_SurfaceCurve::SetMasterRepresentation ******/
		/****** md5 signature: 30d1ac685536dbd7475f798b551c9b40 ******/
		%feature("compactdefaultargs") SetMasterRepresentation;
		%feature("autodoc", "
Parameters
----------
aMasterRepresentation: StepGeom_PreferredSurfaceCurveRepresentation

Return
-------
None

Description
-----------
No available documentation.
") SetMasterRepresentation;
		void SetMasterRepresentation(const StepGeom_PreferredSurfaceCurveRepresentation aMasterRepresentation);

};


%make_alias(StepGeom_SurfaceCurve)

%extend StepGeom_SurfaceCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class StepGeom_SurfaceReplica *
********************************/
class StepGeom_SurfaceReplica : public StepGeom_Surface {
	public:
		/****** StepGeom_SurfaceReplica::StepGeom_SurfaceReplica ******/
		/****** md5 signature: ee12ac2fbb25efc56e332ec6550ad2c2 ******/
		%feature("compactdefaultargs") StepGeom_SurfaceReplica;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a SurfaceReplica.
") StepGeom_SurfaceReplica;
		 StepGeom_SurfaceReplica();

		/****** StepGeom_SurfaceReplica::Init ******/
		/****** md5 signature: 194930c317ab1d105a115a0598906d37 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString
aParentSurface: StepGeom_Surface
aTransformation: StepGeom_CartesianTransformationOperator3d

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<StepGeom_Surface> & aParentSurface, const opencascade::handle<StepGeom_CartesianTransformationOperator3d> & aTransformation);

		/****** StepGeom_SurfaceReplica::ParentSurface ******/
		/****** md5 signature: 9b1df3ccf4dd7cd41bab7b894295e2db ******/
		%feature("compactdefaultargs") ParentSurface;
		%feature("autodoc", "Return
-------
opencascade::handle<StepGeom_Surface>

Description
-----------
No available documentation.
") ParentSurface;
		opencascade::handle<StepGeom_Surface> ParentSurface();

		/****** StepGeom_SurfaceReplica::SetParentSurface ******/
		/****** md5 signature: d2880808787caf9b9185a801f04e175d ******/
		%feature("compactdefaultargs") SetParentSurface;
		%feature("autodoc", "
Parameters
----------
aParentSurface: StepGeom_Surface

Return
-------
None

Description
-----------
No available documentation.
") SetParentSurface;
		void SetParentSurface(const opencascade::handle<StepGeom_Surface> & aParentSurface);

		/****** StepGeom_SurfaceReplica::SetTransformation ******/
		/****** md5 signature: 43b9583a6f9680b7ec648567817072eb ******/
		%feature("compactdefaultargs") SetTransformation;
		%feature("autodoc", "
Parameters
----------
aTransformation: StepGeom_CartesianTransformationOperator3d

Return
-------
None

Description
-----------
No available documentation.
") SetTransformation;
		void SetTransformation(const opencascade::handle<StepGeom_CartesianTransformationOperator3d> & aTransformation);

		/****** StepGeom_SurfaceReplica::Transformation ******/
		/****** md5 signature: 7299aa422e83c646b54dcb0065f3d3a3 ******/
		%feature("compactdefaultargs") Transformation;
		%feature("autodoc", "Return
-------
opencascade::handle<StepGeom_CartesianTransformationOperator3d>

Description
-----------
No available documentation.
") Transformation;
		opencascade::handle<StepGeom_CartesianTransformationOperator3d> Transformation();

};


%make_alias(StepGeom_SurfaceReplica)

%extend StepGeom_SurfaceReplica {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class StepGeom_SweptSurface *
******************************/
class StepGeom_SweptSurface : public StepGeom_Surface {
	public:
		/****** StepGeom_SweptSurface::StepGeom_SweptSurface ******/
		/****** md5 signature: 0b872d482a5b3fadb8720b6c40ec4b05 ******/
		%feature("compactdefaultargs") StepGeom_SweptSurface;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a SweptSurface.
") StepGeom_SweptSurface;
		 StepGeom_SweptSurface();

		/****** StepGeom_SweptSurface::Init ******/
		/****** md5 signature: cd693e1c19a6ca796145028b11576860 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString
aSweptCurve: StepGeom_Curve

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<StepGeom_Curve> & aSweptCurve);

		/****** StepGeom_SweptSurface::SetSweptCurve ******/
		/****** md5 signature: ed7d89d55df100e458b4458e5dd8d404 ******/
		%feature("compactdefaultargs") SetSweptCurve;
		%feature("autodoc", "
Parameters
----------
aSweptCurve: StepGeom_Curve

Return
-------
None

Description
-----------
No available documentation.
") SetSweptCurve;
		void SetSweptCurve(const opencascade::handle<StepGeom_Curve> & aSweptCurve);

		/****** StepGeom_SweptSurface::SweptCurve ******/
		/****** md5 signature: c9b807425006f74d322f19f2abc68419 ******/
		%feature("compactdefaultargs") SweptCurve;
		%feature("autodoc", "Return
-------
opencascade::handle<StepGeom_Curve>

Description
-----------
No available documentation.
") SweptCurve;
		opencascade::handle<StepGeom_Curve> SweptCurve();

};


%make_alias(StepGeom_SweptSurface)

%extend StepGeom_SweptSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class StepGeom_BSplineCurve *
******************************/
class StepGeom_BSplineCurve : public StepGeom_BoundedCurve {
	public:
		/****** StepGeom_BSplineCurve::StepGeom_BSplineCurve ******/
		/****** md5 signature: a1aec762aaf624d8c0237139c0783d65 ******/
		%feature("compactdefaultargs") StepGeom_BSplineCurve;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a BSplineCurve.
") StepGeom_BSplineCurve;
		 StepGeom_BSplineCurve();

		/****** StepGeom_BSplineCurve::ClosedCurve ******/
		/****** md5 signature: 286da34cc55dc20deb2b2a7609c727bd ******/
		%feature("compactdefaultargs") ClosedCurve;
		%feature("autodoc", "Return
-------
StepData_Logical

Description
-----------
No available documentation.
") ClosedCurve;
		StepData_Logical ClosedCurve();

		/****** StepGeom_BSplineCurve::ControlPointsList ******/
		/****** md5 signature: 26db42762a09467835bbfa521a4b9926 ******/
		%feature("compactdefaultargs") ControlPointsList;
		%feature("autodoc", "Return
-------
opencascade::handle<NCollection_HArray1<opencascade::handle<StepGeom_CartesianPoint>>>

Description
-----------
No available documentation.
") ControlPointsList;
		opencascade::handle<NCollection_HArray1<opencascade::handle<StepGeom_CartesianPoint>>> ControlPointsList();

		/****** StepGeom_BSplineCurve::ControlPointsListValue ******/
		/****** md5 signature: 89282c72da2427578bd3ab9369d65dba ******/
		%feature("compactdefaultargs") ControlPointsListValue;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
opencascade::handle<StepGeom_CartesianPoint>

Description
-----------
No available documentation.
") ControlPointsListValue;
		opencascade::handle<StepGeom_CartesianPoint> ControlPointsListValue(const int num);

		/****** StepGeom_BSplineCurve::CurveForm ******/
		/****** md5 signature: c247d23ced37b005c9e58d704a55dc96 ******/
		%feature("compactdefaultargs") CurveForm;
		%feature("autodoc", "Return
-------
StepGeom_BSplineCurveForm

Description
-----------
No available documentation.
") CurveForm;
		StepGeom_BSplineCurveForm CurveForm();

		/****** StepGeom_BSplineCurve::Degree ******/
		/****** md5 signature: 41ab768385e3189d3d3bc517c9606dbb ******/
		%feature("compactdefaultargs") Degree;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Degree;
		int Degree();

		/****** StepGeom_BSplineCurve::Init ******/
		/****** md5 signature: fd262d9028c3a57472fc7ac4c0afc410 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString
aDegree: int
aControlPointsList: NCollection_HArray1<
aCurveForm: StepGeom_BSplineCurveForm
aClosedCurve: StepData_Logical
aSelfIntersect: StepData_Logical

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const int aDegree, const opencascade::handle<NCollection_HArray1<opencascade::handle<StepGeom_CartesianPoint>> > & aControlPointsList, const StepGeom_BSplineCurveForm aCurveForm, const StepData_Logical aClosedCurve, const StepData_Logical aSelfIntersect);

		/****** StepGeom_BSplineCurve::NbControlPointsList ******/
		/****** md5 signature: 7f4d8685049360c65603f6681ff33b81 ******/
		%feature("compactdefaultargs") NbControlPointsList;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbControlPointsList;
		int NbControlPointsList();

		/****** StepGeom_BSplineCurve::SelfIntersect ******/
		/****** md5 signature: 3b962cc0483950ab6ae2ff15b08ec9fd ******/
		%feature("compactdefaultargs") SelfIntersect;
		%feature("autodoc", "Return
-------
StepData_Logical

Description
-----------
No available documentation.
") SelfIntersect;
		StepData_Logical SelfIntersect();

		/****** StepGeom_BSplineCurve::SetClosedCurve ******/
		/****** md5 signature: e6e81a8b2e27fd5f7e2424b13e742a67 ******/
		%feature("compactdefaultargs") SetClosedCurve;
		%feature("autodoc", "
Parameters
----------
aClosedCurve: StepData_Logical

Return
-------
None

Description
-----------
No available documentation.
") SetClosedCurve;
		void SetClosedCurve(const StepData_Logical aClosedCurve);

		/****** StepGeom_BSplineCurve::SetControlPointsList ******/
		/****** md5 signature: 85b395b11222a3585b9d601b037b5697 ******/
		%feature("compactdefaultargs") SetControlPointsList;
		%feature("autodoc", "
Parameters
----------
aControlPointsList: NCollection_HArray1<

Return
-------
None

Description
-----------
No available documentation.
") SetControlPointsList;
		void SetControlPointsList(const opencascade::handle<NCollection_HArray1<opencascade::handle<StepGeom_CartesianPoint>> > & aControlPointsList);

		/****** StepGeom_BSplineCurve::SetCurveForm ******/
		/****** md5 signature: 88dd47042daf39f14f698879e5f61b3d ******/
		%feature("compactdefaultargs") SetCurveForm;
		%feature("autodoc", "
Parameters
----------
aCurveForm: StepGeom_BSplineCurveForm

Return
-------
None

Description
-----------
No available documentation.
") SetCurveForm;
		void SetCurveForm(const StepGeom_BSplineCurveForm aCurveForm);

		/****** StepGeom_BSplineCurve::SetDegree ******/
		/****** md5 signature: cb4b7db100e3a6464a1f15406ef0b2fa ******/
		%feature("compactdefaultargs") SetDegree;
		%feature("autodoc", "
Parameters
----------
aDegree: int

Return
-------
None

Description
-----------
No available documentation.
") SetDegree;
		void SetDegree(const int aDegree);

		/****** StepGeom_BSplineCurve::SetSelfIntersect ******/
		/****** md5 signature: 2d7a8417a0b46872a2716425b91b62e7 ******/
		%feature("compactdefaultargs") SetSelfIntersect;
		%feature("autodoc", "
Parameters
----------
aSelfIntersect: StepData_Logical

Return
-------
None

Description
-----------
No available documentation.
") SetSelfIntersect;
		void SetSelfIntersect(const StepData_Logical aSelfIntersect);

};


%make_alias(StepGeom_BSplineCurve)

%extend StepGeom_BSplineCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class StepGeom_BSplineSurface *
********************************/
class StepGeom_BSplineSurface : public StepGeom_BoundedSurface {
	public:
		/****** StepGeom_BSplineSurface::StepGeom_BSplineSurface ******/
		/****** md5 signature: 1ab6c0ca4d803cfd6f9272147f6003ed ******/
		%feature("compactdefaultargs") StepGeom_BSplineSurface;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a BSplineSurface.
") StepGeom_BSplineSurface;
		 StepGeom_BSplineSurface();

		/****** StepGeom_BSplineSurface::ControlPointsList ******/
		/****** md5 signature: 33939e8406053462512b0cf3770e48ee ******/
		%feature("compactdefaultargs") ControlPointsList;
		%feature("autodoc", "Return
-------
opencascade::handle<NCollection_HArray2<opencascade::handle<StepGeom_CartesianPoint>>>

Description
-----------
No available documentation.
") ControlPointsList;
		opencascade::handle<NCollection_HArray2<opencascade::handle<StepGeom_CartesianPoint>>> ControlPointsList();

		/****** StepGeom_BSplineSurface::ControlPointsListValue ******/
		/****** md5 signature: 5ca6a5fdbbc56b93848c1028d354a363 ******/
		%feature("compactdefaultargs") ControlPointsListValue;
		%feature("autodoc", "
Parameters
----------
num1: int
num2: int

Return
-------
opencascade::handle<StepGeom_CartesianPoint>

Description
-----------
No available documentation.
") ControlPointsListValue;
		opencascade::handle<StepGeom_CartesianPoint> ControlPointsListValue(const int num1, const int num2);

		/****** StepGeom_BSplineSurface::Init ******/
		/****** md5 signature: 8f1abe1890ceb68e2a3e17f609580bf5 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString
aUDegree: int
aVDegree: int
aControlPointsList: NCollection_HArray2<
aSurfaceForm: StepGeom_BSplineSurfaceForm
aUClosed: StepData_Logical
aVClosed: StepData_Logical
aSelfIntersect: StepData_Logical

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const int aUDegree, const int aVDegree, const opencascade::handle<NCollection_HArray2<opencascade::handle<StepGeom_CartesianPoint>> > & aControlPointsList, const StepGeom_BSplineSurfaceForm aSurfaceForm, const StepData_Logical aUClosed, const StepData_Logical aVClosed, const StepData_Logical aSelfIntersect);

		/****** StepGeom_BSplineSurface::NbControlPointsListI ******/
		/****** md5 signature: 2c500ccbed08eddb5494eb11ac313592 ******/
		%feature("compactdefaultargs") NbControlPointsListI;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbControlPointsListI;
		int NbControlPointsListI();

		/****** StepGeom_BSplineSurface::NbControlPointsListJ ******/
		/****** md5 signature: 3147956513e99bf7b5e7e24c3ecc20dd ******/
		%feature("compactdefaultargs") NbControlPointsListJ;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbControlPointsListJ;
		int NbControlPointsListJ();

		/****** StepGeom_BSplineSurface::SelfIntersect ******/
		/****** md5 signature: 3b962cc0483950ab6ae2ff15b08ec9fd ******/
		%feature("compactdefaultargs") SelfIntersect;
		%feature("autodoc", "Return
-------
StepData_Logical

Description
-----------
No available documentation.
") SelfIntersect;
		StepData_Logical SelfIntersect();

		/****** StepGeom_BSplineSurface::SetControlPointsList ******/
		/****** md5 signature: 24d0aac5d96b0d8e3272c1761365305b ******/
		%feature("compactdefaultargs") SetControlPointsList;
		%feature("autodoc", "
Parameters
----------
aControlPointsList: NCollection_HArray2<

Return
-------
None

Description
-----------
No available documentation.
") SetControlPointsList;
		void SetControlPointsList(const opencascade::handle<NCollection_HArray2<opencascade::handle<StepGeom_CartesianPoint>> > & aControlPointsList);

		/****** StepGeom_BSplineSurface::SetSelfIntersect ******/
		/****** md5 signature: 2d7a8417a0b46872a2716425b91b62e7 ******/
		%feature("compactdefaultargs") SetSelfIntersect;
		%feature("autodoc", "
Parameters
----------
aSelfIntersect: StepData_Logical

Return
-------
None

Description
-----------
No available documentation.
") SetSelfIntersect;
		void SetSelfIntersect(const StepData_Logical aSelfIntersect);

		/****** StepGeom_BSplineSurface::SetSurfaceForm ******/
		/****** md5 signature: 97914b1acd4b07ffb9303f0833a363f9 ******/
		%feature("compactdefaultargs") SetSurfaceForm;
		%feature("autodoc", "
Parameters
----------
aSurfaceForm: StepGeom_BSplineSurfaceForm

Return
-------
None

Description
-----------
No available documentation.
") SetSurfaceForm;
		void SetSurfaceForm(const StepGeom_BSplineSurfaceForm aSurfaceForm);

		/****** StepGeom_BSplineSurface::SetUClosed ******/
		/****** md5 signature: 05ae810f4fa8d7e62f09e6530eb9f9c9 ******/
		%feature("compactdefaultargs") SetUClosed;
		%feature("autodoc", "
Parameters
----------
aUClosed: StepData_Logical

Return
-------
None

Description
-----------
No available documentation.
") SetUClosed;
		void SetUClosed(const StepData_Logical aUClosed);

		/****** StepGeom_BSplineSurface::SetUDegree ******/
		/****** md5 signature: 2d8c0d2ec5cf09ca8de44e27d948224e ******/
		%feature("compactdefaultargs") SetUDegree;
		%feature("autodoc", "
Parameters
----------
aUDegree: int

Return
-------
None

Description
-----------
No available documentation.
") SetUDegree;
		void SetUDegree(const int aUDegree);

		/****** StepGeom_BSplineSurface::SetVClosed ******/
		/****** md5 signature: 1e2d9038fcf40e96c2b625186d7a98c7 ******/
		%feature("compactdefaultargs") SetVClosed;
		%feature("autodoc", "
Parameters
----------
aVClosed: StepData_Logical

Return
-------
None

Description
-----------
No available documentation.
") SetVClosed;
		void SetVClosed(const StepData_Logical aVClosed);

		/****** StepGeom_BSplineSurface::SetVDegree ******/
		/****** md5 signature: a62ac5c29de22c55a60a89c8067f983e ******/
		%feature("compactdefaultargs") SetVDegree;
		%feature("autodoc", "
Parameters
----------
aVDegree: int

Return
-------
None

Description
-----------
No available documentation.
") SetVDegree;
		void SetVDegree(const int aVDegree);

		/****** StepGeom_BSplineSurface::SurfaceForm ******/
		/****** md5 signature: 7c0d434a0b523ef5b9f97a700c195e25 ******/
		%feature("compactdefaultargs") SurfaceForm;
		%feature("autodoc", "Return
-------
StepGeom_BSplineSurfaceForm

Description
-----------
No available documentation.
") SurfaceForm;
		StepGeom_BSplineSurfaceForm SurfaceForm();

		/****** StepGeom_BSplineSurface::UClosed ******/
		/****** md5 signature: b1b7a3a49665c008436df4e1ae6b3837 ******/
		%feature("compactdefaultargs") UClosed;
		%feature("autodoc", "Return
-------
StepData_Logical

Description
-----------
No available documentation.
") UClosed;
		StepData_Logical UClosed();

		/****** StepGeom_BSplineSurface::UDegree ******/
		/****** md5 signature: 82316803b09fa91a345f15577c8b3c82 ******/
		%feature("compactdefaultargs") UDegree;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") UDegree;
		int UDegree();

		/****** StepGeom_BSplineSurface::VClosed ******/
		/****** md5 signature: cc2a3d1395b1809743300f1cca9c8a36 ******/
		%feature("compactdefaultargs") VClosed;
		%feature("autodoc", "Return
-------
StepData_Logical

Description
-----------
No available documentation.
") VClosed;
		StepData_Logical VClosed();

		/****** StepGeom_BSplineSurface::VDegree ******/
		/****** md5 signature: 10a01c94db483e5b8afe43596e767a03 ******/
		%feature("compactdefaultargs") VDegree;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") VDegree;
		int VDegree();

};


%make_alias(StepGeom_BSplineSurface)

%extend StepGeom_BSplineSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class StepGeom_Circle *
************************/
class StepGeom_Circle : public StepGeom_Conic {
	public:
		/****** StepGeom_Circle::StepGeom_Circle ******/
		/****** md5 signature: 51fffa7e7862e63914427036a9e9b840 ******/
		%feature("compactdefaultargs") StepGeom_Circle;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a Circle.
") StepGeom_Circle;
		 StepGeom_Circle();

		/****** StepGeom_Circle::Init ******/
		/****** md5 signature: 90fecbf053fadf2405b6a25a346bd69f ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString
aPosition: StepGeom_Axis2Placement
aRadius: double

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const StepGeom_Axis2Placement & aPosition, const double aRadius);

		/****** StepGeom_Circle::Radius ******/
		/****** md5 signature: 3f212b2355d53c03baacfd2fb8e2678a ******/
		%feature("compactdefaultargs") Radius;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") Radius;
		double Radius();

		/****** StepGeom_Circle::SetRadius ******/
		/****** md5 signature: f0566f0da6f39e1b404c168108c44985 ******/
		%feature("compactdefaultargs") SetRadius;
		%feature("autodoc", "
Parameters
----------
aRadius: double

Return
-------
None

Description
-----------
No available documentation.
") SetRadius;
		void SetRadius(const double aRadius);

};


%make_alias(StepGeom_Circle)

%extend StepGeom_Circle {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class StepGeom_CompositeCurve *
********************************/
class StepGeom_CompositeCurve : public StepGeom_BoundedCurve {
	public:
		/****** StepGeom_CompositeCurve::StepGeom_CompositeCurve ******/
		/****** md5 signature: 79bfbb20d82ae92a9e3580a0e2ced368 ******/
		%feature("compactdefaultargs") StepGeom_CompositeCurve;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a CompositeCurve.
") StepGeom_CompositeCurve;
		 StepGeom_CompositeCurve();

		/****** StepGeom_CompositeCurve::Init ******/
		/****** md5 signature: c250be95b5b1b9d56544fafa52ccec97 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString
aSegments: NCollection_HArray1<
aSelfIntersect: StepData_Logical

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<NCollection_HArray1<opencascade::handle<StepGeom_CompositeCurveSegment>> > & aSegments, const StepData_Logical aSelfIntersect);

		/****** StepGeom_CompositeCurve::NbSegments ******/
		/****** md5 signature: 9aee6c2253f8ba296b560fdee30e17ad ******/
		%feature("compactdefaultargs") NbSegments;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbSegments;
		int NbSegments();

		/****** StepGeom_CompositeCurve::Segments ******/
		/****** md5 signature: 7057fa8a6cbc51d612455141831ea4b4 ******/
		%feature("compactdefaultargs") Segments;
		%feature("autodoc", "Return
-------
opencascade::handle<NCollection_HArray1<opencascade::handle<StepGeom_CompositeCurveSegment>>>

Description
-----------
No available documentation.
") Segments;
		opencascade::handle<NCollection_HArray1<opencascade::handle<StepGeom_CompositeCurveSegment>>> Segments();

		/****** StepGeom_CompositeCurve::SegmentsValue ******/
		/****** md5 signature: 255626248c3696ae13d790effdaf3a68 ******/
		%feature("compactdefaultargs") SegmentsValue;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
opencascade::handle<StepGeom_CompositeCurveSegment>

Description
-----------
No available documentation.
") SegmentsValue;
		opencascade::handle<StepGeom_CompositeCurveSegment> SegmentsValue(const int num);

		/****** StepGeom_CompositeCurve::SelfIntersect ******/
		/****** md5 signature: 3b962cc0483950ab6ae2ff15b08ec9fd ******/
		%feature("compactdefaultargs") SelfIntersect;
		%feature("autodoc", "Return
-------
StepData_Logical

Description
-----------
No available documentation.
") SelfIntersect;
		StepData_Logical SelfIntersect();

		/****** StepGeom_CompositeCurve::SetSegments ******/
		/****** md5 signature: 435e68f41f7a39ff2d9dffad6eef99c0 ******/
		%feature("compactdefaultargs") SetSegments;
		%feature("autodoc", "
Parameters
----------
aSegments: NCollection_HArray1<

Return
-------
None

Description
-----------
No available documentation.
") SetSegments;
		void SetSegments(const opencascade::handle<NCollection_HArray1<opencascade::handle<StepGeom_CompositeCurveSegment>> > & aSegments);

		/****** StepGeom_CompositeCurve::SetSelfIntersect ******/
		/****** md5 signature: 2d7a8417a0b46872a2716425b91b62e7 ******/
		%feature("compactdefaultargs") SetSelfIntersect;
		%feature("autodoc", "
Parameters
----------
aSelfIntersect: StepData_Logical

Return
-------
None

Description
-----------
No available documentation.
") SetSelfIntersect;
		void SetSelfIntersect(const StepData_Logical aSelfIntersect);

};


%make_alias(StepGeom_CompositeCurve)

%extend StepGeom_CompositeCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class StepGeom_ConicalSurface *
********************************/
class StepGeom_ConicalSurface : public StepGeom_ElementarySurface {
	public:
		/****** StepGeom_ConicalSurface::StepGeom_ConicalSurface ******/
		/****** md5 signature: ad06c556425a7d3727b7bf6037bd4440 ******/
		%feature("compactdefaultargs") StepGeom_ConicalSurface;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a ConicalSurface.
") StepGeom_ConicalSurface;
		 StepGeom_ConicalSurface();

		/****** StepGeom_ConicalSurface::Init ******/
		/****** md5 signature: 4e3f8d9e9016404aad43ce594906755a ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString
aPosition: StepGeom_Axis2Placement3d
aRadius: double
aSemiAngle: double

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<StepGeom_Axis2Placement3d> & aPosition, const double aRadius, const double aSemiAngle);

		/****** StepGeom_ConicalSurface::Radius ******/
		/****** md5 signature: 3f212b2355d53c03baacfd2fb8e2678a ******/
		%feature("compactdefaultargs") Radius;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") Radius;
		double Radius();

		/****** StepGeom_ConicalSurface::SemiAngle ******/
		/****** md5 signature: 9697a959b33bed3cf9aa51bfa3c242cf ******/
		%feature("compactdefaultargs") SemiAngle;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") SemiAngle;
		double SemiAngle();

		/****** StepGeom_ConicalSurface::SetRadius ******/
		/****** md5 signature: f0566f0da6f39e1b404c168108c44985 ******/
		%feature("compactdefaultargs") SetRadius;
		%feature("autodoc", "
Parameters
----------
aRadius: double

Return
-------
None

Description
-----------
No available documentation.
") SetRadius;
		void SetRadius(const double aRadius);

		/****** StepGeom_ConicalSurface::SetSemiAngle ******/
		/****** md5 signature: c568f98792bc36fc646bfa34dd62e9a1 ******/
		%feature("compactdefaultargs") SetSemiAngle;
		%feature("autodoc", "
Parameters
----------
aSemiAngle: double

Return
-------
None

Description
-----------
No available documentation.
") SetSemiAngle;
		void SetSemiAngle(const double aSemiAngle);

};


%make_alias(StepGeom_ConicalSurface)

%extend StepGeom_ConicalSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class StepGeom_CurveBoundedSurface *
*************************************/
class StepGeom_CurveBoundedSurface : public StepGeom_BoundedSurface {
	public:
		/****** StepGeom_CurveBoundedSurface::StepGeom_CurveBoundedSurface ******/
		/****** md5 signature: 5e11891a380f453e28b76be41c97c5b5 ******/
		%feature("compactdefaultargs") StepGeom_CurveBoundedSurface;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") StepGeom_CurveBoundedSurface;
		 StepGeom_CurveBoundedSurface();

		/****** StepGeom_CurveBoundedSurface::BasisSurface ******/
		/****** md5 signature: a392dc35d63547e75f8c22616a036c5d ******/
		%feature("compactdefaultargs") BasisSurface;
		%feature("autodoc", "Return
-------
opencascade::handle<StepGeom_Surface>

Description
-----------
Returns field BasisSurface.
") BasisSurface;
		opencascade::handle<StepGeom_Surface> BasisSurface();

		/****** StepGeom_CurveBoundedSurface::Boundaries ******/
		/****** md5 signature: faaea7045195dda950bfccd96b2806b9 ******/
		%feature("compactdefaultargs") Boundaries;
		%feature("autodoc", "Return
-------
opencascade::handle<NCollection_HArray1<StepGeom_SurfaceBoundary>>

Description
-----------
Returns field Boundaries.
") Boundaries;
		opencascade::handle<NCollection_HArray1<StepGeom_SurfaceBoundary>> Boundaries();

		/****** StepGeom_CurveBoundedSurface::ImplicitOuter ******/
		/****** md5 signature: 7119477cae92b4a192ca6cfd7bda678f ******/
		%feature("compactdefaultargs") ImplicitOuter;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns field ImplicitOuter.
") ImplicitOuter;
		bool ImplicitOuter();

		/****** StepGeom_CurveBoundedSurface::Init ******/
		/****** md5 signature: 82aa008ceb2b90c798f2829630257249 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aRepresentationItem_Name: TCollection_HAsciiString
aBasisSurface: StepGeom_Surface
aBoundaries: NCollection_HArray1<StepGeom_SurfaceBoundary
aImplicitOuter: bool

Return
-------
None

Description
-----------
Initialize all fields (own and inherited).
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aRepresentationItem_Name, const opencascade::handle<StepGeom_Surface> & aBasisSurface, const opencascade::handle<NCollection_HArray1<StepGeom_SurfaceBoundary>> & aBoundaries, const bool aImplicitOuter);

		/****** StepGeom_CurveBoundedSurface::SetBasisSurface ******/
		/****** md5 signature: 358648de36142756d5347fdc5c2c8d85 ******/
		%feature("compactdefaultargs") SetBasisSurface;
		%feature("autodoc", "
Parameters
----------
BasisSurface: StepGeom_Surface

Return
-------
None

Description
-----------
Set field BasisSurface.
") SetBasisSurface;
		void SetBasisSurface(const opencascade::handle<StepGeom_Surface> & BasisSurface);

		/****** StepGeom_CurveBoundedSurface::SetBoundaries ******/
		/****** md5 signature: 58d0109b500e757f696a2c31097deac1 ******/
		%feature("compactdefaultargs") SetBoundaries;
		%feature("autodoc", "
Parameters
----------
Boundaries: NCollection_HArray1<StepGeom_SurfaceBoundary

Return
-------
None

Description
-----------
Set field Boundaries.
") SetBoundaries;
		void SetBoundaries(const opencascade::handle<NCollection_HArray1<StepGeom_SurfaceBoundary>> & Boundaries);

		/****** StepGeom_CurveBoundedSurface::SetImplicitOuter ******/
		/****** md5 signature: 050b890aba9eafbdc1679fd3245e353e ******/
		%feature("compactdefaultargs") SetImplicitOuter;
		%feature("autodoc", "
Parameters
----------
ImplicitOuter: bool

Return
-------
None

Description
-----------
Set field ImplicitOuter.
") SetImplicitOuter;
		void SetImplicitOuter(const bool ImplicitOuter);

};


%make_alias(StepGeom_CurveBoundedSurface)

%extend StepGeom_CurveBoundedSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class StepGeom_CylindricalSurface *
************************************/
class StepGeom_CylindricalSurface : public StepGeom_ElementarySurface {
	public:
		/****** StepGeom_CylindricalSurface::StepGeom_CylindricalSurface ******/
		/****** md5 signature: 89a30508ff45f0854fd29540c90d4564 ******/
		%feature("compactdefaultargs") StepGeom_CylindricalSurface;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a CylindricalSurface.
") StepGeom_CylindricalSurface;
		 StepGeom_CylindricalSurface();

		/****** StepGeom_CylindricalSurface::Init ******/
		/****** md5 signature: b6bc9c76c79e885f626ef5d3f05404cc ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString
aPosition: StepGeom_Axis2Placement3d
aRadius: double

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<StepGeom_Axis2Placement3d> & aPosition, const double aRadius);

		/****** StepGeom_CylindricalSurface::Radius ******/
		/****** md5 signature: 3f212b2355d53c03baacfd2fb8e2678a ******/
		%feature("compactdefaultargs") Radius;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") Radius;
		double Radius();

		/****** StepGeom_CylindricalSurface::SetRadius ******/
		/****** md5 signature: f0566f0da6f39e1b404c168108c44985 ******/
		%feature("compactdefaultargs") SetRadius;
		%feature("autodoc", "
Parameters
----------
aRadius: double

Return
-------
None

Description
-----------
No available documentation.
") SetRadius;
		void SetRadius(const double aRadius);

};


%make_alias(StepGeom_CylindricalSurface)

%extend StepGeom_CylindricalSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class StepGeom_Ellipse *
*************************/
class StepGeom_Ellipse : public StepGeom_Conic {
	public:
		/****** StepGeom_Ellipse::StepGeom_Ellipse ******/
		/****** md5 signature: 129d6f2a292d63ae4c965549edd235e8 ******/
		%feature("compactdefaultargs") StepGeom_Ellipse;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a Ellipse.
") StepGeom_Ellipse;
		 StepGeom_Ellipse();

		/****** StepGeom_Ellipse::Init ******/
		/****** md5 signature: 1a7dbcb3b0f55eeb2639fa077b48290f ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString
aPosition: StepGeom_Axis2Placement
aSemiAxis1: double
aSemiAxis2: double

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const StepGeom_Axis2Placement & aPosition, const double aSemiAxis1, const double aSemiAxis2);

		/****** StepGeom_Ellipse::SemiAxis1 ******/
		/****** md5 signature: f5ada8d3c7f52cf5a7b74cc5185faae9 ******/
		%feature("compactdefaultargs") SemiAxis1;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") SemiAxis1;
		double SemiAxis1();

		/****** StepGeom_Ellipse::SemiAxis2 ******/
		/****** md5 signature: be5ad58ebc5238dc6aa4d3827ab731a4 ******/
		%feature("compactdefaultargs") SemiAxis2;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") SemiAxis2;
		double SemiAxis2();

		/****** StepGeom_Ellipse::SetSemiAxis1 ******/
		/****** md5 signature: ad90dc160cc5ae108433b60f46b70730 ******/
		%feature("compactdefaultargs") SetSemiAxis1;
		%feature("autodoc", "
Parameters
----------
aSemiAxis1: double

Return
-------
None

Description
-----------
No available documentation.
") SetSemiAxis1;
		void SetSemiAxis1(const double aSemiAxis1);

		/****** StepGeom_Ellipse::SetSemiAxis2 ******/
		/****** md5 signature: 495be67a30bdef36a09bfc880fb46990 ******/
		%feature("compactdefaultargs") SetSemiAxis2;
		%feature("autodoc", "
Parameters
----------
aSemiAxis2: double

Return
-------
None

Description
-----------
No available documentation.
") SetSemiAxis2;
		void SetSemiAxis2(const double aSemiAxis2);

};


%make_alias(StepGeom_Ellipse)

%extend StepGeom_Ellipse {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************************
* class StepGeom_EvaluatedDegeneratePcurve *
*******************************************/
class StepGeom_EvaluatedDegeneratePcurve : public StepGeom_DegeneratePcurve {
	public:
		/****** StepGeom_EvaluatedDegeneratePcurve::StepGeom_EvaluatedDegeneratePcurve ******/
		/****** md5 signature: 40d47bc0da840ee2ee7acddd3c2e666f ******/
		%feature("compactdefaultargs") StepGeom_EvaluatedDegeneratePcurve;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a EvaluatedDegeneratePcurve.
") StepGeom_EvaluatedDegeneratePcurve;
		 StepGeom_EvaluatedDegeneratePcurve();

		/****** StepGeom_EvaluatedDegeneratePcurve::EquivalentPoint ******/
		/****** md5 signature: 0bc5d16040aeae6527efa856bb5d73e4 ******/
		%feature("compactdefaultargs") EquivalentPoint;
		%feature("autodoc", "Return
-------
opencascade::handle<StepGeom_CartesianPoint>

Description
-----------
No available documentation.
") EquivalentPoint;
		opencascade::handle<StepGeom_CartesianPoint> EquivalentPoint();

		/****** StepGeom_EvaluatedDegeneratePcurve::Init ******/
		/****** md5 signature: 806da51bd18e75ca8d2170221467e68d ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString
aBasisSurface: StepGeom_Surface
aReferenceToCurve: StepRepr_DefinitionalRepresentation
aEquivalentPoint: StepGeom_CartesianPoint

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<StepGeom_Surface> & aBasisSurface, const opencascade::handle<StepRepr_DefinitionalRepresentation> & aReferenceToCurve, const opencascade::handle<StepGeom_CartesianPoint> & aEquivalentPoint);

		/****** StepGeom_EvaluatedDegeneratePcurve::SetEquivalentPoint ******/
		/****** md5 signature: 51735c4a6fd9feded40d4c1bc4536b96 ******/
		%feature("compactdefaultargs") SetEquivalentPoint;
		%feature("autodoc", "
Parameters
----------
aEquivalentPoint: StepGeom_CartesianPoint

Return
-------
None

Description
-----------
No available documentation.
") SetEquivalentPoint;
		void SetEquivalentPoint(const opencascade::handle<StepGeom_CartesianPoint> & aEquivalentPoint);

};


%make_alias(StepGeom_EvaluatedDegeneratePcurve)

%extend StepGeom_EvaluatedDegeneratePcurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class StepGeom_Hyperbola *
***************************/
class StepGeom_Hyperbola : public StepGeom_Conic {
	public:
		/****** StepGeom_Hyperbola::StepGeom_Hyperbola ******/
		/****** md5 signature: e5fa63bf5d0d2f020b4c0d548683ed0a ******/
		%feature("compactdefaultargs") StepGeom_Hyperbola;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a Hyperbola.
") StepGeom_Hyperbola;
		 StepGeom_Hyperbola();

		/****** StepGeom_Hyperbola::Init ******/
		/****** md5 signature: 7998ca8076b0d5db577797683ff4a2f1 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString
aPosition: StepGeom_Axis2Placement
aSemiAxis: double
aSemiImagAxis: double

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const StepGeom_Axis2Placement & aPosition, const double aSemiAxis, const double aSemiImagAxis);

		/****** StepGeom_Hyperbola::SemiAxis ******/
		/****** md5 signature: a0b432f0e5962af79883c1d44cfd541f ******/
		%feature("compactdefaultargs") SemiAxis;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") SemiAxis;
		double SemiAxis();

		/****** StepGeom_Hyperbola::SemiImagAxis ******/
		/****** md5 signature: afc10997b90e905d5836422d179c2360 ******/
		%feature("compactdefaultargs") SemiImagAxis;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") SemiImagAxis;
		double SemiImagAxis();

		/****** StepGeom_Hyperbola::SetSemiAxis ******/
		/****** md5 signature: 34172f23e2e44bc25f800f7cd991bd8b ******/
		%feature("compactdefaultargs") SetSemiAxis;
		%feature("autodoc", "
Parameters
----------
aSemiAxis: double

Return
-------
None

Description
-----------
No available documentation.
") SetSemiAxis;
		void SetSemiAxis(const double aSemiAxis);

		/****** StepGeom_Hyperbola::SetSemiImagAxis ******/
		/****** md5 signature: 15fa864b9022bddae5c8c8c69cfd815f ******/
		%feature("compactdefaultargs") SetSemiImagAxis;
		%feature("autodoc", "
Parameters
----------
aSemiImagAxis: double

Return
-------
None

Description
-----------
No available documentation.
") SetSemiImagAxis;
		void SetSemiImagAxis(const double aSemiImagAxis);

};


%make_alias(StepGeom_Hyperbola)

%extend StepGeom_Hyperbola {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class StepGeom_IntersectionCurve *
***********************************/
class StepGeom_IntersectionCurve : public StepGeom_SurfaceCurve {
	public:
		/****** StepGeom_IntersectionCurve::StepGeom_IntersectionCurve ******/
		/****** md5 signature: a15cad64cc1693bc27f1f48a0e006a01 ******/
		%feature("compactdefaultargs") StepGeom_IntersectionCurve;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a IntersectionCurve.
") StepGeom_IntersectionCurve;
		 StepGeom_IntersectionCurve();

};


%make_alias(StepGeom_IntersectionCurve)

%extend StepGeom_IntersectionCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class StepGeom_Parabola *
**************************/
class StepGeom_Parabola : public StepGeom_Conic {
	public:
		/****** StepGeom_Parabola::StepGeom_Parabola ******/
		/****** md5 signature: 2f3b4f99ce72eeddf1c747b7676d60e9 ******/
		%feature("compactdefaultargs") StepGeom_Parabola;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a Parabola.
") StepGeom_Parabola;
		 StepGeom_Parabola();

		/****** StepGeom_Parabola::FocalDist ******/
		/****** md5 signature: 254268d6d62fae2d9da2cb86ce539d0f ******/
		%feature("compactdefaultargs") FocalDist;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") FocalDist;
		double FocalDist();

		/****** StepGeom_Parabola::Init ******/
		/****** md5 signature: f0153e32936dc75c421c38243000ec09 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString
aPosition: StepGeom_Axis2Placement
aFocalDist: double

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const StepGeom_Axis2Placement & aPosition, const double aFocalDist);

		/****** StepGeom_Parabola::SetFocalDist ******/
		/****** md5 signature: acf463a28b521d364a9c009f406b92b0 ******/
		%feature("compactdefaultargs") SetFocalDist;
		%feature("autodoc", "
Parameters
----------
aFocalDist: double

Return
-------
None

Description
-----------
No available documentation.
") SetFocalDist;
		void SetFocalDist(const double aFocalDist);

};


%make_alias(StepGeom_Parabola)

%extend StepGeom_Parabola {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class StepGeom_Plane *
***********************/
class StepGeom_Plane : public StepGeom_ElementarySurface {
	public:
		/****** StepGeom_Plane::StepGeom_Plane ******/
		/****** md5 signature: 667aebda7ce84bd383ebd298435becfa ******/
		%feature("compactdefaultargs") StepGeom_Plane;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a Plane.
") StepGeom_Plane;
		 StepGeom_Plane();

};


%make_alias(StepGeom_Plane)

%extend StepGeom_Plane {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class StepGeom_Polyline *
**************************/
class StepGeom_Polyline : public StepGeom_BoundedCurve {
	public:
		/****** StepGeom_Polyline::StepGeom_Polyline ******/
		/****** md5 signature: 2f5f3c05808cc3851d2b7c7f3fe98bf0 ******/
		%feature("compactdefaultargs") StepGeom_Polyline;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a Polyline.
") StepGeom_Polyline;
		 StepGeom_Polyline();

		/****** StepGeom_Polyline::Init ******/
		/****** md5 signature: 26608fc45d519c06fe64c24ca47c090d ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString
aPoints: NCollection_HArray1<

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<NCollection_HArray1<opencascade::handle<StepGeom_CartesianPoint>> > & aPoints);

		/****** StepGeom_Polyline::NbPoints ******/
		/****** md5 signature: 0243a6484ef0942dcad871f7c247b5de ******/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbPoints;
		int NbPoints();

		/****** StepGeom_Polyline::Points ******/
		/****** md5 signature: dcf50e5e83f51499af59b29ffb7d715c ******/
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "Return
-------
opencascade::handle<NCollection_HArray1<opencascade::handle<StepGeom_CartesianPoint>>>

Description
-----------
No available documentation.
") Points;
		opencascade::handle<NCollection_HArray1<opencascade::handle<StepGeom_CartesianPoint>>> Points();

		/****** StepGeom_Polyline::PointsValue ******/
		/****** md5 signature: 054cc4b7cb01890458e36809629ef1b0 ******/
		%feature("compactdefaultargs") PointsValue;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
opencascade::handle<StepGeom_CartesianPoint>

Description
-----------
No available documentation.
") PointsValue;
		opencascade::handle<StepGeom_CartesianPoint> PointsValue(const int num);

		/****** StepGeom_Polyline::SetPoints ******/
		/****** md5 signature: 1a58e218cc13e67eabf5624d742a27d3 ******/
		%feature("compactdefaultargs") SetPoints;
		%feature("autodoc", "
Parameters
----------
aPoints: NCollection_HArray1<

Return
-------
None

Description
-----------
No available documentation.
") SetPoints;
		void SetPoints(const opencascade::handle<NCollection_HArray1<opencascade::handle<StepGeom_CartesianPoint>> > & aPoints);

};


%make_alias(StepGeom_Polyline)

%extend StepGeom_Polyline {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************************
* class StepGeom_RectangularCompositeSurface *
*********************************************/
class StepGeom_RectangularCompositeSurface : public StepGeom_BoundedSurface {
	public:
		/****** StepGeom_RectangularCompositeSurface::StepGeom_RectangularCompositeSurface ******/
		/****** md5 signature: 48aeb5c079d9dac31f26eeb526849e6d ******/
		%feature("compactdefaultargs") StepGeom_RectangularCompositeSurface;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a RectangularCompositeSurface.
") StepGeom_RectangularCompositeSurface;
		 StepGeom_RectangularCompositeSurface();

		/****** StepGeom_RectangularCompositeSurface::Init ******/
		/****** md5 signature: 3a5b7f9f5f77bd337ef6d374b65497e4 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString
aSegments: NCollection_HArray2<

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<NCollection_HArray2<opencascade::handle<StepGeom_SurfacePatch>> > & aSegments);

		/****** StepGeom_RectangularCompositeSurface::NbSegmentsI ******/
		/****** md5 signature: 02839ec02fa5277e0d76617b576f136e ******/
		%feature("compactdefaultargs") NbSegmentsI;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbSegmentsI;
		int NbSegmentsI();

		/****** StepGeom_RectangularCompositeSurface::NbSegmentsJ ******/
		/****** md5 signature: e3deef9d5c8674ffe766294be6fd39e9 ******/
		%feature("compactdefaultargs") NbSegmentsJ;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbSegmentsJ;
		int NbSegmentsJ();

		/****** StepGeom_RectangularCompositeSurface::Segments ******/
		/****** md5 signature: bd7a0b88b2c7e4f558b9688804abd1e5 ******/
		%feature("compactdefaultargs") Segments;
		%feature("autodoc", "Return
-------
opencascade::handle<NCollection_HArray2<opencascade::handle<StepGeom_SurfacePatch>>>

Description
-----------
No available documentation.
") Segments;
		opencascade::handle<NCollection_HArray2<opencascade::handle<StepGeom_SurfacePatch>>> Segments();

		/****** StepGeom_RectangularCompositeSurface::SegmentsValue ******/
		/****** md5 signature: b2d8cc419bbbe0b753835c6fbe2a7d9c ******/
		%feature("compactdefaultargs") SegmentsValue;
		%feature("autodoc", "
Parameters
----------
num1: int
num2: int

Return
-------
opencascade::handle<StepGeom_SurfacePatch>

Description
-----------
No available documentation.
") SegmentsValue;
		opencascade::handle<StepGeom_SurfacePatch> SegmentsValue(const int num1, const int num2);

		/****** StepGeom_RectangularCompositeSurface::SetSegments ******/
		/****** md5 signature: 79502e98dcac06cf559193504618ac81 ******/
		%feature("compactdefaultargs") SetSegments;
		%feature("autodoc", "
Parameters
----------
aSegments: NCollection_HArray2<

Return
-------
None

Description
-----------
No available documentation.
") SetSegments;
		void SetSegments(const opencascade::handle<NCollection_HArray2<opencascade::handle<StepGeom_SurfacePatch>> > & aSegments);

};


%make_alias(StepGeom_RectangularCompositeSurface)

%extend StepGeom_RectangularCompositeSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************************
* class StepGeom_RectangularTrimmedSurface *
*******************************************/
class StepGeom_RectangularTrimmedSurface : public StepGeom_BoundedSurface {
	public:
		/****** StepGeom_RectangularTrimmedSurface::StepGeom_RectangularTrimmedSurface ******/
		/****** md5 signature: fc7c6bf1faed9ee8334dcc9c52784b0c ******/
		%feature("compactdefaultargs") StepGeom_RectangularTrimmedSurface;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a RectangularTrimmedSurface.
") StepGeom_RectangularTrimmedSurface;
		 StepGeom_RectangularTrimmedSurface();

		/****** StepGeom_RectangularTrimmedSurface::BasisSurface ******/
		/****** md5 signature: a392dc35d63547e75f8c22616a036c5d ******/
		%feature("compactdefaultargs") BasisSurface;
		%feature("autodoc", "Return
-------
opencascade::handle<StepGeom_Surface>

Description
-----------
No available documentation.
") BasisSurface;
		opencascade::handle<StepGeom_Surface> BasisSurface();

		/****** StepGeom_RectangularTrimmedSurface::Init ******/
		/****** md5 signature: 78df2cbdb60795e4c05b819a84b7213c ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString
aBasisSurface: StepGeom_Surface
aU1: double
aU2: double
aV1: double
aV2: double
aUsense: bool
aVsense: bool

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<StepGeom_Surface> & aBasisSurface, const double aU1, const double aU2, const double aV1, const double aV2, const bool aUsense, const bool aVsense);

		/****** StepGeom_RectangularTrimmedSurface::SetBasisSurface ******/
		/****** md5 signature: ee1a95d90ec4e9798673d554f8d52949 ******/
		%feature("compactdefaultargs") SetBasisSurface;
		%feature("autodoc", "
Parameters
----------
aBasisSurface: StepGeom_Surface

Return
-------
None

Description
-----------
No available documentation.
") SetBasisSurface;
		void SetBasisSurface(const opencascade::handle<StepGeom_Surface> & aBasisSurface);

		/****** StepGeom_RectangularTrimmedSurface::SetU1 ******/
		/****** md5 signature: d0b2b1bfcf627de742ed5879fea0b08c ******/
		%feature("compactdefaultargs") SetU1;
		%feature("autodoc", "
Parameters
----------
aU1: double

Return
-------
None

Description
-----------
No available documentation.
") SetU1;
		void SetU1(const double aU1);

		/****** StepGeom_RectangularTrimmedSurface::SetU2 ******/
		/****** md5 signature: 57e1fa278f7c6016d03386eb42e76d63 ******/
		%feature("compactdefaultargs") SetU2;
		%feature("autodoc", "
Parameters
----------
aU2: double

Return
-------
None

Description
-----------
No available documentation.
") SetU2;
		void SetU2(const double aU2);

		/****** StepGeom_RectangularTrimmedSurface::SetUsense ******/
		/****** md5 signature: 603f814bcd02a3d361d5666969bc2ef8 ******/
		%feature("compactdefaultargs") SetUsense;
		%feature("autodoc", "
Parameters
----------
aUsense: bool

Return
-------
None

Description
-----------
No available documentation.
") SetUsense;
		void SetUsense(const bool aUsense);

		/****** StepGeom_RectangularTrimmedSurface::SetV1 ******/
		/****** md5 signature: 25c9ca1d0de7ef28aed8af0c709b57bc ******/
		%feature("compactdefaultargs") SetV1;
		%feature("autodoc", "
Parameters
----------
aV1: double

Return
-------
None

Description
-----------
No available documentation.
") SetV1;
		void SetV1(const double aV1);

		/****** StepGeom_RectangularTrimmedSurface::SetV2 ******/
		/****** md5 signature: 9d901794afbdebe82f06541c7c9d62ba ******/
		%feature("compactdefaultargs") SetV2;
		%feature("autodoc", "
Parameters
----------
aV2: double

Return
-------
None

Description
-----------
No available documentation.
") SetV2;
		void SetV2(const double aV2);

		/****** StepGeom_RectangularTrimmedSurface::SetVsense ******/
		/****** md5 signature: 208ed363baaedd6e18db6e46ccbe6c38 ******/
		%feature("compactdefaultargs") SetVsense;
		%feature("autodoc", "
Parameters
----------
aVsense: bool

Return
-------
None

Description
-----------
No available documentation.
") SetVsense;
		void SetVsense(const bool aVsense);

		/****** StepGeom_RectangularTrimmedSurface::U1 ******/
		/****** md5 signature: 070c473a14c10a26b7ab54c5fbc40e8d ******/
		%feature("compactdefaultargs") U1;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") U1;
		double U1();

		/****** StepGeom_RectangularTrimmedSurface::U2 ******/
		/****** md5 signature: 4e15fb6b4b406d3553d770418e89a883 ******/
		%feature("compactdefaultargs") U2;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") U2;
		double U2();

		/****** StepGeom_RectangularTrimmedSurface::Usense ******/
		/****** md5 signature: 9f3d62c9c83f7d2a3797187f8af7bff2 ******/
		%feature("compactdefaultargs") Usense;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") Usense;
		bool Usense();

		/****** StepGeom_RectangularTrimmedSurface::V1 ******/
		/****** md5 signature: c5f7a687b57e1de44b0be2372cc617fd ******/
		%feature("compactdefaultargs") V1;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") V1;
		double V1();

		/****** StepGeom_RectangularTrimmedSurface::V2 ******/
		/****** md5 signature: 9adf93c07e3be00363edd1a79cb47c70 ******/
		%feature("compactdefaultargs") V2;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") V2;
		double V2();

		/****** StepGeom_RectangularTrimmedSurface::Vsense ******/
		/****** md5 signature: f46086815d033f549ff8a7443b4820ce ******/
		%feature("compactdefaultargs") Vsense;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") Vsense;
		bool Vsense();

};


%make_alias(StepGeom_RectangularTrimmedSurface)

%extend StepGeom_RectangularTrimmedSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class StepGeom_SeamCurve *
***************************/
class StepGeom_SeamCurve : public StepGeom_SurfaceCurve {
	public:
		/****** StepGeom_SeamCurve::StepGeom_SeamCurve ******/
		/****** md5 signature: d9df9742ff56eea9294c84393ec922c9 ******/
		%feature("compactdefaultargs") StepGeom_SeamCurve;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a SeamCurve.
") StepGeom_SeamCurve;
		 StepGeom_SeamCurve();

};


%make_alias(StepGeom_SeamCurve)

%extend StepGeom_SeamCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class StepGeom_SphericalSurface *
**********************************/
class StepGeom_SphericalSurface : public StepGeom_ElementarySurface {
	public:
		/****** StepGeom_SphericalSurface::StepGeom_SphericalSurface ******/
		/****** md5 signature: 77ef512c30c21bae823c47e24e08ed62 ******/
		%feature("compactdefaultargs") StepGeom_SphericalSurface;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a SphericalSurface.
") StepGeom_SphericalSurface;
		 StepGeom_SphericalSurface();

		/****** StepGeom_SphericalSurface::Init ******/
		/****** md5 signature: b6bc9c76c79e885f626ef5d3f05404cc ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString
aPosition: StepGeom_Axis2Placement3d
aRadius: double

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<StepGeom_Axis2Placement3d> & aPosition, const double aRadius);

		/****** StepGeom_SphericalSurface::Radius ******/
		/****** md5 signature: 3f212b2355d53c03baacfd2fb8e2678a ******/
		%feature("compactdefaultargs") Radius;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") Radius;
		double Radius();

		/****** StepGeom_SphericalSurface::SetRadius ******/
		/****** md5 signature: f0566f0da6f39e1b404c168108c44985 ******/
		%feature("compactdefaultargs") SetRadius;
		%feature("autodoc", "
Parameters
----------
aRadius: double

Return
-------
None

Description
-----------
No available documentation.
") SetRadius;
		void SetRadius(const double aRadius);

};


%make_alias(StepGeom_SphericalSurface)

%extend StepGeom_SphericalSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************************
* class StepGeom_SurfaceCurveAndBoundedCurve *
*********************************************/
class StepGeom_SurfaceCurveAndBoundedCurve : public StepGeom_SurfaceCurve {
	public:
		/****** StepGeom_SurfaceCurveAndBoundedCurve::StepGeom_SurfaceCurveAndBoundedCurve ******/
		/****** md5 signature: 329218d1f5afa6fe56aa171348004286 ******/
		%feature("compactdefaultargs") StepGeom_SurfaceCurveAndBoundedCurve;
		%feature("autodoc", "Return
-------
None

Description
-----------
creates empty object.
") StepGeom_SurfaceCurveAndBoundedCurve;
		 StepGeom_SurfaceCurveAndBoundedCurve();

		/****** StepGeom_SurfaceCurveAndBoundedCurve::BoundedCurve ******/
		/****** md5 signature: 3cba715f66208bb905df234219795264 ******/
		%feature("compactdefaultargs") BoundedCurve;
		%feature("autodoc", "Return
-------
opencascade::handle<StepGeom_BoundedCurve>

Description
-----------
returns field BoundedCurve.
") BoundedCurve;
		opencascade::handle<StepGeom_BoundedCurve> & BoundedCurve();

};


%make_alias(StepGeom_SurfaceCurveAndBoundedCurve)

%extend StepGeom_SurfaceCurveAndBoundedCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************
* class StepGeom_SurfaceOfLinearExtrusion *
******************************************/
class StepGeom_SurfaceOfLinearExtrusion : public StepGeom_SweptSurface {
	public:
		/****** StepGeom_SurfaceOfLinearExtrusion::StepGeom_SurfaceOfLinearExtrusion ******/
		/****** md5 signature: d11b738129052067f1a7331d707991f0 ******/
		%feature("compactdefaultargs") StepGeom_SurfaceOfLinearExtrusion;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a SurfaceOfLinearExtrusion.
") StepGeom_SurfaceOfLinearExtrusion;
		 StepGeom_SurfaceOfLinearExtrusion();

		/****** StepGeom_SurfaceOfLinearExtrusion::ExtrusionAxis ******/
		/****** md5 signature: 3711493e919a154bb6334de537b711eb ******/
		%feature("compactdefaultargs") ExtrusionAxis;
		%feature("autodoc", "Return
-------
opencascade::handle<StepGeom_Vector>

Description
-----------
No available documentation.
") ExtrusionAxis;
		opencascade::handle<StepGeom_Vector> ExtrusionAxis();

		/****** StepGeom_SurfaceOfLinearExtrusion::Init ******/
		/****** md5 signature: eb1cd85523c92b63df3c8c98dd6d55bb ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString
aSweptCurve: StepGeom_Curve
aExtrusionAxis: StepGeom_Vector

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<StepGeom_Curve> & aSweptCurve, const opencascade::handle<StepGeom_Vector> & aExtrusionAxis);

		/****** StepGeom_SurfaceOfLinearExtrusion::SetExtrusionAxis ******/
		/****** md5 signature: ad594a7fd6091d16a61615a0c8a87f50 ******/
		%feature("compactdefaultargs") SetExtrusionAxis;
		%feature("autodoc", "
Parameters
----------
aExtrusionAxis: StepGeom_Vector

Return
-------
None

Description
-----------
No available documentation.
") SetExtrusionAxis;
		void SetExtrusionAxis(const opencascade::handle<StepGeom_Vector> & aExtrusionAxis);

};


%make_alias(StepGeom_SurfaceOfLinearExtrusion)

%extend StepGeom_SurfaceOfLinearExtrusion {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class StepGeom_SurfaceOfRevolution *
*************************************/
class StepGeom_SurfaceOfRevolution : public StepGeom_SweptSurface {
	public:
		/****** StepGeom_SurfaceOfRevolution::StepGeom_SurfaceOfRevolution ******/
		/****** md5 signature: 3ab4520f3bc296a8f659aec7b67932fa ******/
		%feature("compactdefaultargs") StepGeom_SurfaceOfRevolution;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a SurfaceOfRevolution.
") StepGeom_SurfaceOfRevolution;
		 StepGeom_SurfaceOfRevolution();

		/****** StepGeom_SurfaceOfRevolution::AxisPosition ******/
		/****** md5 signature: 496b2887998e0357e3984ff7b47646d7 ******/
		%feature("compactdefaultargs") AxisPosition;
		%feature("autodoc", "Return
-------
opencascade::handle<StepGeom_Axis1Placement>

Description
-----------
No available documentation.
") AxisPosition;
		opencascade::handle<StepGeom_Axis1Placement> AxisPosition();

		/****** StepGeom_SurfaceOfRevolution::Init ******/
		/****** md5 signature: 5000ca7edbf00b33e40f08513d0c88ef ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString
aSweptCurve: StepGeom_Curve
aAxisPosition: StepGeom_Axis1Placement

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<StepGeom_Curve> & aSweptCurve, const opencascade::handle<StepGeom_Axis1Placement> & aAxisPosition);

		/****** StepGeom_SurfaceOfRevolution::SetAxisPosition ******/
		/****** md5 signature: 3e8d7870783fe9ba2dbcbdf5fe200ae2 ******/
		%feature("compactdefaultargs") SetAxisPosition;
		%feature("autodoc", "
Parameters
----------
aAxisPosition: StepGeom_Axis1Placement

Return
-------
None

Description
-----------
No available documentation.
") SetAxisPosition;
		void SetAxisPosition(const opencascade::handle<StepGeom_Axis1Placement> & aAxisPosition);

};


%make_alias(StepGeom_SurfaceOfRevolution)

%extend StepGeom_SurfaceOfRevolution {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class StepGeom_ToroidalSurface *
*********************************/
class StepGeom_ToroidalSurface : public StepGeom_ElementarySurface {
	public:
		/****** StepGeom_ToroidalSurface::StepGeom_ToroidalSurface ******/
		/****** md5 signature: 43def1f2f2862b188a58a40ab7fce547 ******/
		%feature("compactdefaultargs") StepGeom_ToroidalSurface;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a ToroidalSurface.
") StepGeom_ToroidalSurface;
		 StepGeom_ToroidalSurface();

		/****** StepGeom_ToroidalSurface::Init ******/
		/****** md5 signature: ee2cc7952f525dbb787505e648bc5d45 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString
aPosition: StepGeom_Axis2Placement3d
aMajorRadius: double
aMinorRadius: double

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<StepGeom_Axis2Placement3d> & aPosition, const double aMajorRadius, const double aMinorRadius);

		/****** StepGeom_ToroidalSurface::MajorRadius ******/
		/****** md5 signature: 0a2ccb3f2f96e1276e50fba8091d72cb ******/
		%feature("compactdefaultargs") MajorRadius;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") MajorRadius;
		double MajorRadius();

		/****** StepGeom_ToroidalSurface::MinorRadius ******/
		/****** md5 signature: 9e6683b74c7166396bffd8c50cf9899c ******/
		%feature("compactdefaultargs") MinorRadius;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") MinorRadius;
		double MinorRadius();

		/****** StepGeom_ToroidalSurface::SetMajorRadius ******/
		/****** md5 signature: d26969446e174720e1eb4333ea43a746 ******/
		%feature("compactdefaultargs") SetMajorRadius;
		%feature("autodoc", "
Parameters
----------
aMajorRadius: double

Return
-------
None

Description
-----------
No available documentation.
") SetMajorRadius;
		void SetMajorRadius(const double aMajorRadius);

		/****** StepGeom_ToroidalSurface::SetMinorRadius ******/
		/****** md5 signature: 5097d6694f4c9d2256c2267f585665f9 ******/
		%feature("compactdefaultargs") SetMinorRadius;
		%feature("autodoc", "
Parameters
----------
aMinorRadius: double

Return
-------
None

Description
-----------
No available documentation.
") SetMinorRadius;
		void SetMinorRadius(const double aMinorRadius);

};


%make_alias(StepGeom_ToroidalSurface)

%extend StepGeom_ToroidalSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class StepGeom_TrimmedCurve *
******************************/
class StepGeom_TrimmedCurve : public StepGeom_BoundedCurve {
	public:
		/****** StepGeom_TrimmedCurve::StepGeom_TrimmedCurve ******/
		/****** md5 signature: c0e9be1dd32d6c15208f0fe8666b18f8 ******/
		%feature("compactdefaultargs") StepGeom_TrimmedCurve;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a TrimmedCurve.
") StepGeom_TrimmedCurve;
		 StepGeom_TrimmedCurve();

		/****** StepGeom_TrimmedCurve::BasisCurve ******/
		/****** md5 signature: 0be9af8ae440c49202c050d8d0c44b0a ******/
		%feature("compactdefaultargs") BasisCurve;
		%feature("autodoc", "Return
-------
opencascade::handle<StepGeom_Curve>

Description
-----------
No available documentation.
") BasisCurve;
		opencascade::handle<StepGeom_Curve> BasisCurve();

		/****** StepGeom_TrimmedCurve::Init ******/
		/****** md5 signature: 7f93e102ac95738d6cb4decda58c2e9a ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString
aBasisCurve: StepGeom_Curve
aTrim1: NCollection_HArray1<StepGeom_TrimmingSelect
aTrim2: NCollection_HArray1<StepGeom_TrimmingSelect
aSenseAgreement: bool
aMasterRepresentation: StepGeom_TrimmingPreference

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<StepGeom_Curve> & aBasisCurve, const opencascade::handle<NCollection_HArray1<StepGeom_TrimmingSelect>> & aTrim1, const opencascade::handle<NCollection_HArray1<StepGeom_TrimmingSelect>> & aTrim2, const bool aSenseAgreement, const StepGeom_TrimmingPreference aMasterRepresentation);

		/****** StepGeom_TrimmedCurve::MasterRepresentation ******/
		/****** md5 signature: 8b49366d1ad10b27765ce5eeb6cfad30 ******/
		%feature("compactdefaultargs") MasterRepresentation;
		%feature("autodoc", "Return
-------
StepGeom_TrimmingPreference

Description
-----------
No available documentation.
") MasterRepresentation;
		StepGeom_TrimmingPreference MasterRepresentation();

		/****** StepGeom_TrimmedCurve::NbTrim1 ******/
		/****** md5 signature: 96e27b0c7c28cdbef5fda9a5f5ad693f ******/
		%feature("compactdefaultargs") NbTrim1;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbTrim1;
		int NbTrim1();

		/****** StepGeom_TrimmedCurve::NbTrim2 ******/
		/****** md5 signature: 6df13e889779daacbf238f4eb7ac79cf ******/
		%feature("compactdefaultargs") NbTrim2;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbTrim2;
		int NbTrim2();

		/****** StepGeom_TrimmedCurve::SenseAgreement ******/
		/****** md5 signature: 4a27dff3b515b5df4d9bdbe785af3891 ******/
		%feature("compactdefaultargs") SenseAgreement;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") SenseAgreement;
		bool SenseAgreement();

		/****** StepGeom_TrimmedCurve::SetBasisCurve ******/
		/****** md5 signature: 28fd1fe3129f0ded7387f3b2f2a4686a ******/
		%feature("compactdefaultargs") SetBasisCurve;
		%feature("autodoc", "
Parameters
----------
aBasisCurve: StepGeom_Curve

Return
-------
None

Description
-----------
No available documentation.
") SetBasisCurve;
		void SetBasisCurve(const opencascade::handle<StepGeom_Curve> & aBasisCurve);

		/****** StepGeom_TrimmedCurve::SetMasterRepresentation ******/
		/****** md5 signature: de9e6f016688e4bcc1587a4092e90a32 ******/
		%feature("compactdefaultargs") SetMasterRepresentation;
		%feature("autodoc", "
Parameters
----------
aMasterRepresentation: StepGeom_TrimmingPreference

Return
-------
None

Description
-----------
No available documentation.
") SetMasterRepresentation;
		void SetMasterRepresentation(const StepGeom_TrimmingPreference aMasterRepresentation);

		/****** StepGeom_TrimmedCurve::SetSenseAgreement ******/
		/****** md5 signature: bea505c0595450ff60358c4cd0bc389e ******/
		%feature("compactdefaultargs") SetSenseAgreement;
		%feature("autodoc", "
Parameters
----------
aSenseAgreement: bool

Return
-------
None

Description
-----------
No available documentation.
") SetSenseAgreement;
		void SetSenseAgreement(const bool aSenseAgreement);

		/****** StepGeom_TrimmedCurve::SetTrim1 ******/
		/****** md5 signature: b9254119a32dd65366ef052d91c92ecb ******/
		%feature("compactdefaultargs") SetTrim1;
		%feature("autodoc", "
Parameters
----------
aTrim1: NCollection_HArray1<StepGeom_TrimmingSelect

Return
-------
None

Description
-----------
No available documentation.
") SetTrim1;
		void SetTrim1(const opencascade::handle<NCollection_HArray1<StepGeom_TrimmingSelect>> & aTrim1);

		/****** StepGeom_TrimmedCurve::SetTrim2 ******/
		/****** md5 signature: 81716a5ff6679c0e4b34dbee3eaf474f ******/
		%feature("compactdefaultargs") SetTrim2;
		%feature("autodoc", "
Parameters
----------
aTrim2: NCollection_HArray1<StepGeom_TrimmingSelect

Return
-------
None

Description
-----------
No available documentation.
") SetTrim2;
		void SetTrim2(const opencascade::handle<NCollection_HArray1<StepGeom_TrimmingSelect>> & aTrim2);

		/****** StepGeom_TrimmedCurve::Trim1 ******/
		/****** md5 signature: 086d19bf77602e1427a876bcafbf8617 ******/
		%feature("compactdefaultargs") Trim1;
		%feature("autodoc", "Return
-------
opencascade::handle<NCollection_HArray1<StepGeom_TrimmingSelect>>

Description
-----------
No available documentation.
") Trim1;
		opencascade::handle<NCollection_HArray1<StepGeom_TrimmingSelect>> Trim1();

		/****** StepGeom_TrimmedCurve::Trim1Value ******/
		/****** md5 signature: 2329483b7ac02d3b78f006134d515136 ******/
		%feature("compactdefaultargs") Trim1Value;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
StepGeom_TrimmingSelect

Description
-----------
No available documentation.
") Trim1Value;
		StepGeom_TrimmingSelect Trim1Value(const int num);

		/****** StepGeom_TrimmedCurve::Trim2 ******/
		/****** md5 signature: ea21a3f165a4ba57c83ececc5b7f12ee ******/
		%feature("compactdefaultargs") Trim2;
		%feature("autodoc", "Return
-------
opencascade::handle<NCollection_HArray1<StepGeom_TrimmingSelect>>

Description
-----------
No available documentation.
") Trim2;
		opencascade::handle<NCollection_HArray1<StepGeom_TrimmingSelect>> Trim2();

		/****** StepGeom_TrimmedCurve::Trim2Value ******/
		/****** md5 signature: 30f3831e622a50600384dd89d09a3b4a ******/
		%feature("compactdefaultargs") Trim2Value;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
StepGeom_TrimmingSelect

Description
-----------
No available documentation.
") Trim2Value;
		StepGeom_TrimmingSelect Trim2Value(const int num);

};


%make_alias(StepGeom_TrimmedCurve)

%extend StepGeom_TrimmedCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************
* class StepGeom_BSplineCurveWithKnots *
***************************************/
class StepGeom_BSplineCurveWithKnots : public StepGeom_BSplineCurve {
	public:
		/****** StepGeom_BSplineCurveWithKnots::StepGeom_BSplineCurveWithKnots ******/
		/****** md5 signature: 4f7540a35291462ca6fc84d8ed70a94c ******/
		%feature("compactdefaultargs") StepGeom_BSplineCurveWithKnots;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a BSplineCurveWithKnots.
") StepGeom_BSplineCurveWithKnots;
		 StepGeom_BSplineCurveWithKnots();

		/****** StepGeom_BSplineCurveWithKnots::Init ******/
		/****** md5 signature: d6a617a07e645c812efb51ad4f73c254 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString
aDegree: int
aControlPointsList: NCollection_HArray1<
aCurveForm: StepGeom_BSplineCurveForm
aClosedCurve: StepData_Logical
aSelfIntersect: StepData_Logical
aKnotMultiplicities: TColStd_HArray1OfInteger
aKnots: TColStd_HArray1OfReal
aKnotSpec: StepGeom_KnotType

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const int aDegree, const opencascade::handle<NCollection_HArray1<opencascade::handle<StepGeom_CartesianPoint>> > & aControlPointsList, const StepGeom_BSplineCurveForm aCurveForm, const StepData_Logical aClosedCurve, const StepData_Logical aSelfIntersect, const opencascade::handle<TColStd_HArray1OfInteger> & aKnotMultiplicities, const opencascade::handle<TColStd_HArray1OfReal> & aKnots, const StepGeom_KnotType aKnotSpec);

		/****** StepGeom_BSplineCurveWithKnots::KnotMultiplicities ******/
		/****** md5 signature: 2369fe75659b79ff2a784e4b2d161281 ******/
		%feature("compactdefaultargs") KnotMultiplicities;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HArray1OfInteger>

Description
-----------
No available documentation.
") KnotMultiplicities;
		opencascade::handle<TColStd_HArray1OfInteger> KnotMultiplicities();

		/****** StepGeom_BSplineCurveWithKnots::KnotMultiplicitiesValue ******/
		/****** md5 signature: 02de28121dfc5c11b770923e3393c17b ******/
		%feature("compactdefaultargs") KnotMultiplicitiesValue;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
int

Description
-----------
No available documentation.
") KnotMultiplicitiesValue;
		int KnotMultiplicitiesValue(const int num);

		/****** StepGeom_BSplineCurveWithKnots::KnotSpec ******/
		/****** md5 signature: 71bb53c109d69b64cffe7a898f8df609 ******/
		%feature("compactdefaultargs") KnotSpec;
		%feature("autodoc", "Return
-------
StepGeom_KnotType

Description
-----------
No available documentation.
") KnotSpec;
		StepGeom_KnotType KnotSpec();

		/****** StepGeom_BSplineCurveWithKnots::Knots ******/
		/****** md5 signature: b13c1fe2b119dff6f267e3e7c76fc339 ******/
		%feature("compactdefaultargs") Knots;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HArray1OfReal>

Description
-----------
No available documentation.
") Knots;
		opencascade::handle<TColStd_HArray1OfReal> Knots();

		/****** StepGeom_BSplineCurveWithKnots::KnotsValue ******/
		/****** md5 signature: 604273ed5195ddb14a8d9f670738407b ******/
		%feature("compactdefaultargs") KnotsValue;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
double

Description
-----------
No available documentation.
") KnotsValue;
		double KnotsValue(const int num);

		/****** StepGeom_BSplineCurveWithKnots::NbKnotMultiplicities ******/
		/****** md5 signature: 01dd8d61da280dde961672dd634b7401 ******/
		%feature("compactdefaultargs") NbKnotMultiplicities;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbKnotMultiplicities;
		int NbKnotMultiplicities();

		/****** StepGeom_BSplineCurveWithKnots::NbKnots ******/
		/****** md5 signature: 1d7f6bb61170b57fc8534832d22fab99 ******/
		%feature("compactdefaultargs") NbKnots;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbKnots;
		int NbKnots();

		/****** StepGeom_BSplineCurveWithKnots::SetKnotMultiplicities ******/
		/****** md5 signature: f65f08c5375fa79689b8bd6e3faeff1b ******/
		%feature("compactdefaultargs") SetKnotMultiplicities;
		%feature("autodoc", "
Parameters
----------
aKnotMultiplicities: TColStd_HArray1OfInteger

Return
-------
None

Description
-----------
No available documentation.
") SetKnotMultiplicities;
		void SetKnotMultiplicities(const opencascade::handle<TColStd_HArray1OfInteger> & aKnotMultiplicities);

		/****** StepGeom_BSplineCurveWithKnots::SetKnotSpec ******/
		/****** md5 signature: dac52a82fb3cbd778049ab7a7d0effe9 ******/
		%feature("compactdefaultargs") SetKnotSpec;
		%feature("autodoc", "
Parameters
----------
aKnotSpec: StepGeom_KnotType

Return
-------
None

Description
-----------
No available documentation.
") SetKnotSpec;
		void SetKnotSpec(const StepGeom_KnotType aKnotSpec);

		/****** StepGeom_BSplineCurveWithKnots::SetKnots ******/
		/****** md5 signature: 79be0f968d637c5b472ad4ea360fce12 ******/
		%feature("compactdefaultargs") SetKnots;
		%feature("autodoc", "
Parameters
----------
aKnots: TColStd_HArray1OfReal

Return
-------
None

Description
-----------
No available documentation.
") SetKnots;
		void SetKnots(const opencascade::handle<TColStd_HArray1OfReal> & aKnots);

};


%make_alias(StepGeom_BSplineCurveWithKnots)

%extend StepGeom_BSplineCurveWithKnots {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************************************
* class StepGeom_BSplineCurveWithKnotsAndRationalBSplineCurve *
**************************************************************/
class StepGeom_BSplineCurveWithKnotsAndRationalBSplineCurve : public StepGeom_BSplineCurve {
	public:
		/****** StepGeom_BSplineCurveWithKnotsAndRationalBSplineCurve::StepGeom_BSplineCurveWithKnotsAndRationalBSplineCurve ******/
		/****** md5 signature: 5ad54e7d95ae6effefe6913419701570 ******/
		%feature("compactdefaultargs") StepGeom_BSplineCurveWithKnotsAndRationalBSplineCurve;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a BSplineCurveWithKnotsAndRationalBSplineCurve.
") StepGeom_BSplineCurveWithKnotsAndRationalBSplineCurve;
		 StepGeom_BSplineCurveWithKnotsAndRationalBSplineCurve();

		/****** StepGeom_BSplineCurveWithKnotsAndRationalBSplineCurve::BSplineCurveWithKnots ******/
		/****** md5 signature: 87759d99392f628de83144de5e6e6fed ******/
		%feature("compactdefaultargs") BSplineCurveWithKnots;
		%feature("autodoc", "Return
-------
opencascade::handle<StepGeom_BSplineCurveWithKnots>

Description
-----------
No available documentation.
") BSplineCurveWithKnots;
		opencascade::handle<StepGeom_BSplineCurveWithKnots> BSplineCurveWithKnots();

		/****** StepGeom_BSplineCurveWithKnotsAndRationalBSplineCurve::Init ******/
		/****** md5 signature: 3c33012b2cfbde9d2499dda2a2742fbe ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString
aDegree: int
aControlPointsList: NCollection_HArray1<
aCurveForm: StepGeom_BSplineCurveForm
aClosedCurve: StepData_Logical
aSelfIntersect: StepData_Logical
aBSplineCurveWithKnots: StepGeom_BSplineCurveWithKnots
aRationalBSplineCurve: StepGeom_RationalBSplineCurve

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const int aDegree, const opencascade::handle<NCollection_HArray1<opencascade::handle<StepGeom_CartesianPoint>> > & aControlPointsList, const StepGeom_BSplineCurveForm aCurveForm, const StepData_Logical aClosedCurve, const StepData_Logical aSelfIntersect, const opencascade::handle<StepGeom_BSplineCurveWithKnots> & aBSplineCurveWithKnots, const opencascade::handle<StepGeom_RationalBSplineCurve> & aRationalBSplineCurve);

		/****** StepGeom_BSplineCurveWithKnotsAndRationalBSplineCurve::Init ******/
		/****** md5 signature: 4479bf44629ca4dedd21fe8574c9c677 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString
aDegree: int
aControlPointsList: NCollection_HArray1<
aCurveForm: StepGeom_BSplineCurveForm
aClosedCurve: StepData_Logical
aSelfIntersect: StepData_Logical
aKnotMultiplicities: TColStd_HArray1OfInteger
aKnots: TColStd_HArray1OfReal
aKnotSpec: StepGeom_KnotType
aWeightsData: TColStd_HArray1OfReal

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const int aDegree, const opencascade::handle<NCollection_HArray1<opencascade::handle<StepGeom_CartesianPoint>> > & aControlPointsList, const StepGeom_BSplineCurveForm aCurveForm, const StepData_Logical aClosedCurve, const StepData_Logical aSelfIntersect, const opencascade::handle<TColStd_HArray1OfInteger> & aKnotMultiplicities, const opencascade::handle<TColStd_HArray1OfReal> & aKnots, const StepGeom_KnotType aKnotSpec, const opencascade::handle<TColStd_HArray1OfReal> & aWeightsData);

		/****** StepGeom_BSplineCurveWithKnotsAndRationalBSplineCurve::KnotMultiplicities ******/
		/****** md5 signature: 2369fe75659b79ff2a784e4b2d161281 ******/
		%feature("compactdefaultargs") KnotMultiplicities;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HArray1OfInteger>

Description
-----------
No available documentation.
") KnotMultiplicities;
		opencascade::handle<TColStd_HArray1OfInteger> KnotMultiplicities();

		/****** StepGeom_BSplineCurveWithKnotsAndRationalBSplineCurve::KnotMultiplicitiesValue ******/
		/****** md5 signature: 02de28121dfc5c11b770923e3393c17b ******/
		%feature("compactdefaultargs") KnotMultiplicitiesValue;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
int

Description
-----------
No available documentation.
") KnotMultiplicitiesValue;
		int KnotMultiplicitiesValue(const int num);

		/****** StepGeom_BSplineCurveWithKnotsAndRationalBSplineCurve::KnotSpec ******/
		/****** md5 signature: 71bb53c109d69b64cffe7a898f8df609 ******/
		%feature("compactdefaultargs") KnotSpec;
		%feature("autodoc", "Return
-------
StepGeom_KnotType

Description
-----------
No available documentation.
") KnotSpec;
		StepGeom_KnotType KnotSpec();

		/****** StepGeom_BSplineCurveWithKnotsAndRationalBSplineCurve::Knots ******/
		/****** md5 signature: b13c1fe2b119dff6f267e3e7c76fc339 ******/
		%feature("compactdefaultargs") Knots;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HArray1OfReal>

Description
-----------
No available documentation.
") Knots;
		opencascade::handle<TColStd_HArray1OfReal> Knots();

		/****** StepGeom_BSplineCurveWithKnotsAndRationalBSplineCurve::KnotsValue ******/
		/****** md5 signature: 604273ed5195ddb14a8d9f670738407b ******/
		%feature("compactdefaultargs") KnotsValue;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
double

Description
-----------
No available documentation.
") KnotsValue;
		double KnotsValue(const int num);

		/****** StepGeom_BSplineCurveWithKnotsAndRationalBSplineCurve::NbKnotMultiplicities ******/
		/****** md5 signature: 01dd8d61da280dde961672dd634b7401 ******/
		%feature("compactdefaultargs") NbKnotMultiplicities;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbKnotMultiplicities;
		int NbKnotMultiplicities();

		/****** StepGeom_BSplineCurveWithKnotsAndRationalBSplineCurve::NbKnots ******/
		/****** md5 signature: 1d7f6bb61170b57fc8534832d22fab99 ******/
		%feature("compactdefaultargs") NbKnots;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbKnots;
		int NbKnots();

		/****** StepGeom_BSplineCurveWithKnotsAndRationalBSplineCurve::NbWeightsData ******/
		/****** md5 signature: 0d77b571bd3515a277e1b37ee78bbf01 ******/
		%feature("compactdefaultargs") NbWeightsData;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbWeightsData;
		int NbWeightsData();

		/****** StepGeom_BSplineCurveWithKnotsAndRationalBSplineCurve::RationalBSplineCurve ******/
		/****** md5 signature: f041a695724f356a7a0a2b32dcf75081 ******/
		%feature("compactdefaultargs") RationalBSplineCurve;
		%feature("autodoc", "Return
-------
opencascade::handle<StepGeom_RationalBSplineCurve>

Description
-----------
No available documentation.
") RationalBSplineCurve;
		opencascade::handle<StepGeom_RationalBSplineCurve> RationalBSplineCurve();

		/****** StepGeom_BSplineCurveWithKnotsAndRationalBSplineCurve::SetBSplineCurveWithKnots ******/
		/****** md5 signature: b0fe3663605944a2d15d360f5d7f233b ******/
		%feature("compactdefaultargs") SetBSplineCurveWithKnots;
		%feature("autodoc", "
Parameters
----------
aBSplineCurveWithKnots: StepGeom_BSplineCurveWithKnots

Return
-------
None

Description
-----------
No available documentation.
") SetBSplineCurveWithKnots;
		void SetBSplineCurveWithKnots(const opencascade::handle<StepGeom_BSplineCurveWithKnots> & aBSplineCurveWithKnots);

		/****** StepGeom_BSplineCurveWithKnotsAndRationalBSplineCurve::SetKnotMultiplicities ******/
		/****** md5 signature: f65f08c5375fa79689b8bd6e3faeff1b ******/
		%feature("compactdefaultargs") SetKnotMultiplicities;
		%feature("autodoc", "
Parameters
----------
aKnotMultiplicities: TColStd_HArray1OfInteger

Return
-------
None

Description
-----------
No available documentation.
") SetKnotMultiplicities;
		void SetKnotMultiplicities(const opencascade::handle<TColStd_HArray1OfInteger> & aKnotMultiplicities);

		/****** StepGeom_BSplineCurveWithKnotsAndRationalBSplineCurve::SetKnotSpec ******/
		/****** md5 signature: dac52a82fb3cbd778049ab7a7d0effe9 ******/
		%feature("compactdefaultargs") SetKnotSpec;
		%feature("autodoc", "
Parameters
----------
aKnotSpec: StepGeom_KnotType

Return
-------
None

Description
-----------
No available documentation.
") SetKnotSpec;
		void SetKnotSpec(const StepGeom_KnotType aKnotSpec);

		/****** StepGeom_BSplineCurveWithKnotsAndRationalBSplineCurve::SetKnots ******/
		/****** md5 signature: 79be0f968d637c5b472ad4ea360fce12 ******/
		%feature("compactdefaultargs") SetKnots;
		%feature("autodoc", "
Parameters
----------
aKnots: TColStd_HArray1OfReal

Return
-------
None

Description
-----------
No available documentation.
") SetKnots;
		void SetKnots(const opencascade::handle<TColStd_HArray1OfReal> & aKnots);

		/****** StepGeom_BSplineCurveWithKnotsAndRationalBSplineCurve::SetRationalBSplineCurve ******/
		/****** md5 signature: 7386d58f0cbe5865f642e210d2870602 ******/
		%feature("compactdefaultargs") SetRationalBSplineCurve;
		%feature("autodoc", "
Parameters
----------
aRationalBSplineCurve: StepGeom_RationalBSplineCurve

Return
-------
None

Description
-----------
No available documentation.
") SetRationalBSplineCurve;
		void SetRationalBSplineCurve(const opencascade::handle<StepGeom_RationalBSplineCurve> & aRationalBSplineCurve);

		/****** StepGeom_BSplineCurveWithKnotsAndRationalBSplineCurve::SetWeightsData ******/
		/****** md5 signature: 466bb4949da6a0cbfb1509fcd5d9282a ******/
		%feature("compactdefaultargs") SetWeightsData;
		%feature("autodoc", "
Parameters
----------
aWeightsData: TColStd_HArray1OfReal

Return
-------
None

Description
-----------
No available documentation.
") SetWeightsData;
		void SetWeightsData(const opencascade::handle<TColStd_HArray1OfReal> & aWeightsData);

		/****** StepGeom_BSplineCurveWithKnotsAndRationalBSplineCurve::WeightsData ******/
		/****** md5 signature: ac334770ddd52a2342d57e30892d70f0 ******/
		%feature("compactdefaultargs") WeightsData;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HArray1OfReal>

Description
-----------
No available documentation.
") WeightsData;
		opencascade::handle<TColStd_HArray1OfReal> WeightsData();

		/****** StepGeom_BSplineCurveWithKnotsAndRationalBSplineCurve::WeightsDataValue ******/
		/****** md5 signature: 018d7b77d1ee9020d347033b40e93860 ******/
		%feature("compactdefaultargs") WeightsDataValue;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
double

Description
-----------
No available documentation.
") WeightsDataValue;
		double WeightsDataValue(const int num);

};


%make_alias(StepGeom_BSplineCurveWithKnotsAndRationalBSplineCurve)

%extend StepGeom_BSplineCurveWithKnotsAndRationalBSplineCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************
* class StepGeom_BSplineSurfaceWithKnots *
*****************************************/
class StepGeom_BSplineSurfaceWithKnots : public StepGeom_BSplineSurface {
	public:
		/****** StepGeom_BSplineSurfaceWithKnots::StepGeom_BSplineSurfaceWithKnots ******/
		/****** md5 signature: af06d9d2be26dd72d76782acc7a7cba0 ******/
		%feature("compactdefaultargs") StepGeom_BSplineSurfaceWithKnots;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a BSplineSurfaceWithKnots.
") StepGeom_BSplineSurfaceWithKnots;
		 StepGeom_BSplineSurfaceWithKnots();

		/****** StepGeom_BSplineSurfaceWithKnots::Init ******/
		/****** md5 signature: 022dea4ffba7e4d6bb407aa2e38a64c9 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString
aUDegree: int
aVDegree: int
aControlPointsList: NCollection_HArray2<
aSurfaceForm: StepGeom_BSplineSurfaceForm
aUClosed: StepData_Logical
aVClosed: StepData_Logical
aSelfIntersect: StepData_Logical
aUMultiplicities: TColStd_HArray1OfInteger
aVMultiplicities: TColStd_HArray1OfInteger
aUKnots: TColStd_HArray1OfReal
aVKnots: TColStd_HArray1OfReal
aKnotSpec: StepGeom_KnotType

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const int aUDegree, const int aVDegree, const opencascade::handle<NCollection_HArray2<opencascade::handle<StepGeom_CartesianPoint>> > & aControlPointsList, const StepGeom_BSplineSurfaceForm aSurfaceForm, const StepData_Logical aUClosed, const StepData_Logical aVClosed, const StepData_Logical aSelfIntersect, const opencascade::handle<TColStd_HArray1OfInteger> & aUMultiplicities, const opencascade::handle<TColStd_HArray1OfInteger> & aVMultiplicities, const opencascade::handle<TColStd_HArray1OfReal> & aUKnots, const opencascade::handle<TColStd_HArray1OfReal> & aVKnots, const StepGeom_KnotType aKnotSpec);

		/****** StepGeom_BSplineSurfaceWithKnots::KnotSpec ******/
		/****** md5 signature: 71bb53c109d69b64cffe7a898f8df609 ******/
		%feature("compactdefaultargs") KnotSpec;
		%feature("autodoc", "Return
-------
StepGeom_KnotType

Description
-----------
No available documentation.
") KnotSpec;
		StepGeom_KnotType KnotSpec();

		/****** StepGeom_BSplineSurfaceWithKnots::NbUKnots ******/
		/****** md5 signature: 790406b6b06efba57c5111fd80daea5d ******/
		%feature("compactdefaultargs") NbUKnots;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbUKnots;
		int NbUKnots();

		/****** StepGeom_BSplineSurfaceWithKnots::NbUMultiplicities ******/
		/****** md5 signature: bb309f6d59ac9cae418370d6cc0d4878 ******/
		%feature("compactdefaultargs") NbUMultiplicities;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbUMultiplicities;
		int NbUMultiplicities();

		/****** StepGeom_BSplineSurfaceWithKnots::NbVKnots ******/
		/****** md5 signature: b077d9245cbc08be7809ba04ff1e0c69 ******/
		%feature("compactdefaultargs") NbVKnots;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbVKnots;
		int NbVKnots();

		/****** StepGeom_BSplineSurfaceWithKnots::NbVMultiplicities ******/
		/****** md5 signature: 235d73464b145b4cb292b37b1e8a67a0 ******/
		%feature("compactdefaultargs") NbVMultiplicities;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbVMultiplicities;
		int NbVMultiplicities();

		/****** StepGeom_BSplineSurfaceWithKnots::SetKnotSpec ******/
		/****** md5 signature: dac52a82fb3cbd778049ab7a7d0effe9 ******/
		%feature("compactdefaultargs") SetKnotSpec;
		%feature("autodoc", "
Parameters
----------
aKnotSpec: StepGeom_KnotType

Return
-------
None

Description
-----------
No available documentation.
") SetKnotSpec;
		void SetKnotSpec(const StepGeom_KnotType aKnotSpec);

		/****** StepGeom_BSplineSurfaceWithKnots::SetUKnots ******/
		/****** md5 signature: 218bf5a87b2516304534b0c5edc398bb ******/
		%feature("compactdefaultargs") SetUKnots;
		%feature("autodoc", "
Parameters
----------
aUKnots: TColStd_HArray1OfReal

Return
-------
None

Description
-----------
No available documentation.
") SetUKnots;
		void SetUKnots(const opencascade::handle<TColStd_HArray1OfReal> & aUKnots);

		/****** StepGeom_BSplineSurfaceWithKnots::SetUMultiplicities ******/
		/****** md5 signature: d21a98a14a2eabe1b0c50ff4504d796a ******/
		%feature("compactdefaultargs") SetUMultiplicities;
		%feature("autodoc", "
Parameters
----------
aUMultiplicities: TColStd_HArray1OfInteger

Return
-------
None

Description
-----------
No available documentation.
") SetUMultiplicities;
		void SetUMultiplicities(const opencascade::handle<TColStd_HArray1OfInteger> & aUMultiplicities);

		/****** StepGeom_BSplineSurfaceWithKnots::SetVKnots ******/
		/****** md5 signature: 524b5d377609c4caf9a8b888c420c50d ******/
		%feature("compactdefaultargs") SetVKnots;
		%feature("autodoc", "
Parameters
----------
aVKnots: TColStd_HArray1OfReal

Return
-------
None

Description
-----------
No available documentation.
") SetVKnots;
		void SetVKnots(const opencascade::handle<TColStd_HArray1OfReal> & aVKnots);

		/****** StepGeom_BSplineSurfaceWithKnots::SetVMultiplicities ******/
		/****** md5 signature: f8ecc6b04a00deeef1f429ca620efe6b ******/
		%feature("compactdefaultargs") SetVMultiplicities;
		%feature("autodoc", "
Parameters
----------
aVMultiplicities: TColStd_HArray1OfInteger

Return
-------
None

Description
-----------
No available documentation.
") SetVMultiplicities;
		void SetVMultiplicities(const opencascade::handle<TColStd_HArray1OfInteger> & aVMultiplicities);

		/****** StepGeom_BSplineSurfaceWithKnots::UKnots ******/
		/****** md5 signature: 8fab35914c760f36f98d20b5b5c7b193 ******/
		%feature("compactdefaultargs") UKnots;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HArray1OfReal>

Description
-----------
No available documentation.
") UKnots;
		opencascade::handle<TColStd_HArray1OfReal> UKnots();

		/****** StepGeom_BSplineSurfaceWithKnots::UKnotsValue ******/
		/****** md5 signature: 96376d748eb55cb349c4af03e961cfd3 ******/
		%feature("compactdefaultargs") UKnotsValue;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
double

Description
-----------
No available documentation.
") UKnotsValue;
		double UKnotsValue(const int num);

		/****** StepGeom_BSplineSurfaceWithKnots::UMultiplicities ******/
		/****** md5 signature: 7cd3014e381e740b3ee3a5d175cc3a5e ******/
		%feature("compactdefaultargs") UMultiplicities;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HArray1OfInteger>

Description
-----------
No available documentation.
") UMultiplicities;
		opencascade::handle<TColStd_HArray1OfInteger> UMultiplicities();

		/****** StepGeom_BSplineSurfaceWithKnots::UMultiplicitiesValue ******/
		/****** md5 signature: 335927dd2cc1f747b3585f941a826409 ******/
		%feature("compactdefaultargs") UMultiplicitiesValue;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
int

Description
-----------
No available documentation.
") UMultiplicitiesValue;
		int UMultiplicitiesValue(const int num);

		/****** StepGeom_BSplineSurfaceWithKnots::VKnots ******/
		/****** md5 signature: c9393b82bd74b6701133b2403cec2f3b ******/
		%feature("compactdefaultargs") VKnots;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HArray1OfReal>

Description
-----------
No available documentation.
") VKnots;
		opencascade::handle<TColStd_HArray1OfReal> VKnots();

		/****** StepGeom_BSplineSurfaceWithKnots::VKnotsValue ******/
		/****** md5 signature: e48b435b2763aaf35edab96ff84265ad ******/
		%feature("compactdefaultargs") VKnotsValue;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
double

Description
-----------
No available documentation.
") VKnotsValue;
		double VKnotsValue(const int num);

		/****** StepGeom_BSplineSurfaceWithKnots::VMultiplicities ******/
		/****** md5 signature: 6ef942166b8db43453e987ea3806764f ******/
		%feature("compactdefaultargs") VMultiplicities;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HArray1OfInteger>

Description
-----------
No available documentation.
") VMultiplicities;
		opencascade::handle<TColStd_HArray1OfInteger> VMultiplicities();

		/****** StepGeom_BSplineSurfaceWithKnots::VMultiplicitiesValue ******/
		/****** md5 signature: bba68017bf411f28f58d3d135d22b428 ******/
		%feature("compactdefaultargs") VMultiplicitiesValue;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
int

Description
-----------
No available documentation.
") VMultiplicitiesValue;
		int VMultiplicitiesValue(const int num);

};


%make_alias(StepGeom_BSplineSurfaceWithKnots)

%extend StepGeom_BSplineSurfaceWithKnots {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************************************
* class StepGeom_BSplineSurfaceWithKnotsAndRationalBSplineSurface *
******************************************************************/
class StepGeom_BSplineSurfaceWithKnotsAndRationalBSplineSurface : public StepGeom_BSplineSurface {
	public:
		/****** StepGeom_BSplineSurfaceWithKnotsAndRationalBSplineSurface::StepGeom_BSplineSurfaceWithKnotsAndRationalBSplineSurface ******/
		/****** md5 signature: 8160e4c0d281e5b2b806db0da5ca7ef9 ******/
		%feature("compactdefaultargs") StepGeom_BSplineSurfaceWithKnotsAndRationalBSplineSurface;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a BSplineSurfaceWithKnotsAndRationalBSplineSurface.
") StepGeom_BSplineSurfaceWithKnotsAndRationalBSplineSurface;
		 StepGeom_BSplineSurfaceWithKnotsAndRationalBSplineSurface();

		/****** StepGeom_BSplineSurfaceWithKnotsAndRationalBSplineSurface::BSplineSurfaceWithKnots ******/
		/****** md5 signature: d8b15f908d74f8ae55b7868f1997ba24 ******/
		%feature("compactdefaultargs") BSplineSurfaceWithKnots;
		%feature("autodoc", "Return
-------
opencascade::handle<StepGeom_BSplineSurfaceWithKnots>

Description
-----------
No available documentation.
") BSplineSurfaceWithKnots;
		opencascade::handle<StepGeom_BSplineSurfaceWithKnots> BSplineSurfaceWithKnots();

		/****** StepGeom_BSplineSurfaceWithKnotsAndRationalBSplineSurface::Init ******/
		/****** md5 signature: a2b55eb57db07923a30d87157aca06c7 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString
aUDegree: int
aVDegree: int
aControlPointsList: NCollection_HArray2<
aSurfaceForm: StepGeom_BSplineSurfaceForm
aUClosed: StepData_Logical
aVClosed: StepData_Logical
aSelfIntersect: StepData_Logical
aBSplineSurfaceWithKnots: StepGeom_BSplineSurfaceWithKnots
aRationalBSplineSurface: StepGeom_RationalBSplineSurface

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const int aUDegree, const int aVDegree, const opencascade::handle<NCollection_HArray2<opencascade::handle<StepGeom_CartesianPoint>> > & aControlPointsList, const StepGeom_BSplineSurfaceForm aSurfaceForm, const StepData_Logical aUClosed, const StepData_Logical aVClosed, const StepData_Logical aSelfIntersect, const opencascade::handle<StepGeom_BSplineSurfaceWithKnots> & aBSplineSurfaceWithKnots, const opencascade::handle<StepGeom_RationalBSplineSurface> & aRationalBSplineSurface);

		/****** StepGeom_BSplineSurfaceWithKnotsAndRationalBSplineSurface::Init ******/
		/****** md5 signature: 19d740559bfeae4d99b1b7cf56c421c5 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString
aUDegree: int
aVDegree: int
aControlPointsList: NCollection_HArray2<
aSurfaceForm: StepGeom_BSplineSurfaceForm
aUClosed: StepData_Logical
aVClosed: StepData_Logical
aSelfIntersect: StepData_Logical
aUMultiplicities: TColStd_HArray1OfInteger
aVMultiplicities: TColStd_HArray1OfInteger
aUKnots: TColStd_HArray1OfReal
aVKnots: TColStd_HArray1OfReal
aKnotSpec: StepGeom_KnotType
aWeightsData: TColStd_HArray2OfReal

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const int aUDegree, const int aVDegree, const opencascade::handle<NCollection_HArray2<opencascade::handle<StepGeom_CartesianPoint>> > & aControlPointsList, const StepGeom_BSplineSurfaceForm aSurfaceForm, const StepData_Logical aUClosed, const StepData_Logical aVClosed, const StepData_Logical aSelfIntersect, const opencascade::handle<TColStd_HArray1OfInteger> & aUMultiplicities, const opencascade::handle<TColStd_HArray1OfInteger> & aVMultiplicities, const opencascade::handle<TColStd_HArray1OfReal> & aUKnots, const opencascade::handle<TColStd_HArray1OfReal> & aVKnots, const StepGeom_KnotType aKnotSpec, const opencascade::handle<TColStd_HArray2OfReal> & aWeightsData);

		/****** StepGeom_BSplineSurfaceWithKnotsAndRationalBSplineSurface::KnotSpec ******/
		/****** md5 signature: 71bb53c109d69b64cffe7a898f8df609 ******/
		%feature("compactdefaultargs") KnotSpec;
		%feature("autodoc", "Return
-------
StepGeom_KnotType

Description
-----------
No available documentation.
") KnotSpec;
		StepGeom_KnotType KnotSpec();

		/****** StepGeom_BSplineSurfaceWithKnotsAndRationalBSplineSurface::NbUKnots ******/
		/****** md5 signature: 790406b6b06efba57c5111fd80daea5d ******/
		%feature("compactdefaultargs") NbUKnots;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbUKnots;
		int NbUKnots();

		/****** StepGeom_BSplineSurfaceWithKnotsAndRationalBSplineSurface::NbUMultiplicities ******/
		/****** md5 signature: bb309f6d59ac9cae418370d6cc0d4878 ******/
		%feature("compactdefaultargs") NbUMultiplicities;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbUMultiplicities;
		int NbUMultiplicities();

		/****** StepGeom_BSplineSurfaceWithKnotsAndRationalBSplineSurface::NbVKnots ******/
		/****** md5 signature: b077d9245cbc08be7809ba04ff1e0c69 ******/
		%feature("compactdefaultargs") NbVKnots;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbVKnots;
		int NbVKnots();

		/****** StepGeom_BSplineSurfaceWithKnotsAndRationalBSplineSurface::NbVMultiplicities ******/
		/****** md5 signature: 235d73464b145b4cb292b37b1e8a67a0 ******/
		%feature("compactdefaultargs") NbVMultiplicities;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbVMultiplicities;
		int NbVMultiplicities();

		/****** StepGeom_BSplineSurfaceWithKnotsAndRationalBSplineSurface::NbWeightsDataI ******/
		/****** md5 signature: ef14d461b59c30b9ee7417ed8f467ff4 ******/
		%feature("compactdefaultargs") NbWeightsDataI;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbWeightsDataI;
		int NbWeightsDataI();

		/****** StepGeom_BSplineSurfaceWithKnotsAndRationalBSplineSurface::NbWeightsDataJ ******/
		/****** md5 signature: 01f740df3f5de3ab0f67bc7d9d5b8a23 ******/
		%feature("compactdefaultargs") NbWeightsDataJ;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbWeightsDataJ;
		int NbWeightsDataJ();

		/****** StepGeom_BSplineSurfaceWithKnotsAndRationalBSplineSurface::RationalBSplineSurface ******/
		/****** md5 signature: 344649d2541c2455c061eda995cb3b63 ******/
		%feature("compactdefaultargs") RationalBSplineSurface;
		%feature("autodoc", "Return
-------
opencascade::handle<StepGeom_RationalBSplineSurface>

Description
-----------
No available documentation.
") RationalBSplineSurface;
		opencascade::handle<StepGeom_RationalBSplineSurface> RationalBSplineSurface();

		/****** StepGeom_BSplineSurfaceWithKnotsAndRationalBSplineSurface::SetBSplineSurfaceWithKnots ******/
		/****** md5 signature: 16e9b736f36cd5283618d1978d872d9b ******/
		%feature("compactdefaultargs") SetBSplineSurfaceWithKnots;
		%feature("autodoc", "
Parameters
----------
aBSplineSurfaceWithKnots: StepGeom_BSplineSurfaceWithKnots

Return
-------
None

Description
-----------
No available documentation.
") SetBSplineSurfaceWithKnots;
		void SetBSplineSurfaceWithKnots(const opencascade::handle<StepGeom_BSplineSurfaceWithKnots> & aBSplineSurfaceWithKnots);

		/****** StepGeom_BSplineSurfaceWithKnotsAndRationalBSplineSurface::SetKnotSpec ******/
		/****** md5 signature: dac52a82fb3cbd778049ab7a7d0effe9 ******/
		%feature("compactdefaultargs") SetKnotSpec;
		%feature("autodoc", "
Parameters
----------
aKnotSpec: StepGeom_KnotType

Return
-------
None

Description
-----------
No available documentation.
") SetKnotSpec;
		void SetKnotSpec(const StepGeom_KnotType aKnotSpec);

		/****** StepGeom_BSplineSurfaceWithKnotsAndRationalBSplineSurface::SetRationalBSplineSurface ******/
		/****** md5 signature: 14980d7e5c0ab36b876696928378bc68 ******/
		%feature("compactdefaultargs") SetRationalBSplineSurface;
		%feature("autodoc", "
Parameters
----------
aRationalBSplineSurface: StepGeom_RationalBSplineSurface

Return
-------
None

Description
-----------
No available documentation.
") SetRationalBSplineSurface;
		void SetRationalBSplineSurface(const opencascade::handle<StepGeom_RationalBSplineSurface> & aRationalBSplineSurface);

		/****** StepGeom_BSplineSurfaceWithKnotsAndRationalBSplineSurface::SetUKnots ******/
		/****** md5 signature: 218bf5a87b2516304534b0c5edc398bb ******/
		%feature("compactdefaultargs") SetUKnots;
		%feature("autodoc", "
Parameters
----------
aUKnots: TColStd_HArray1OfReal

Return
-------
None

Description
-----------
No available documentation.
") SetUKnots;
		void SetUKnots(const opencascade::handle<TColStd_HArray1OfReal> & aUKnots);

		/****** StepGeom_BSplineSurfaceWithKnotsAndRationalBSplineSurface::SetUMultiplicities ******/
		/****** md5 signature: d21a98a14a2eabe1b0c50ff4504d796a ******/
		%feature("compactdefaultargs") SetUMultiplicities;
		%feature("autodoc", "
Parameters
----------
aUMultiplicities: TColStd_HArray1OfInteger

Return
-------
None

Description
-----------
No available documentation.
") SetUMultiplicities;
		void SetUMultiplicities(const opencascade::handle<TColStd_HArray1OfInteger> & aUMultiplicities);

		/****** StepGeom_BSplineSurfaceWithKnotsAndRationalBSplineSurface::SetVKnots ******/
		/****** md5 signature: 524b5d377609c4caf9a8b888c420c50d ******/
		%feature("compactdefaultargs") SetVKnots;
		%feature("autodoc", "
Parameters
----------
aVKnots: TColStd_HArray1OfReal

Return
-------
None

Description
-----------
No available documentation.
") SetVKnots;
		void SetVKnots(const opencascade::handle<TColStd_HArray1OfReal> & aVKnots);

		/****** StepGeom_BSplineSurfaceWithKnotsAndRationalBSplineSurface::SetVMultiplicities ******/
		/****** md5 signature: f8ecc6b04a00deeef1f429ca620efe6b ******/
		%feature("compactdefaultargs") SetVMultiplicities;
		%feature("autodoc", "
Parameters
----------
aVMultiplicities: TColStd_HArray1OfInteger

Return
-------
None

Description
-----------
No available documentation.
") SetVMultiplicities;
		void SetVMultiplicities(const opencascade::handle<TColStd_HArray1OfInteger> & aVMultiplicities);

		/****** StepGeom_BSplineSurfaceWithKnotsAndRationalBSplineSurface::SetWeightsData ******/
		/****** md5 signature: 48a363f5587534b09a9b3a001845d330 ******/
		%feature("compactdefaultargs") SetWeightsData;
		%feature("autodoc", "
Parameters
----------
aWeightsData: TColStd_HArray2OfReal

Return
-------
None

Description
-----------
No available documentation.
") SetWeightsData;
		void SetWeightsData(const opencascade::handle<TColStd_HArray2OfReal> & aWeightsData);

		/****** StepGeom_BSplineSurfaceWithKnotsAndRationalBSplineSurface::UKnots ******/
		/****** md5 signature: 8fab35914c760f36f98d20b5b5c7b193 ******/
		%feature("compactdefaultargs") UKnots;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HArray1OfReal>

Description
-----------
No available documentation.
") UKnots;
		opencascade::handle<TColStd_HArray1OfReal> UKnots();

		/****** StepGeom_BSplineSurfaceWithKnotsAndRationalBSplineSurface::UKnotsValue ******/
		/****** md5 signature: 96376d748eb55cb349c4af03e961cfd3 ******/
		%feature("compactdefaultargs") UKnotsValue;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
double

Description
-----------
No available documentation.
") UKnotsValue;
		double UKnotsValue(const int num);

		/****** StepGeom_BSplineSurfaceWithKnotsAndRationalBSplineSurface::UMultiplicities ******/
		/****** md5 signature: 7cd3014e381e740b3ee3a5d175cc3a5e ******/
		%feature("compactdefaultargs") UMultiplicities;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HArray1OfInteger>

Description
-----------
No available documentation.
") UMultiplicities;
		opencascade::handle<TColStd_HArray1OfInteger> UMultiplicities();

		/****** StepGeom_BSplineSurfaceWithKnotsAndRationalBSplineSurface::UMultiplicitiesValue ******/
		/****** md5 signature: 335927dd2cc1f747b3585f941a826409 ******/
		%feature("compactdefaultargs") UMultiplicitiesValue;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
int

Description
-----------
No available documentation.
") UMultiplicitiesValue;
		int UMultiplicitiesValue(const int num);

		/****** StepGeom_BSplineSurfaceWithKnotsAndRationalBSplineSurface::VKnots ******/
		/****** md5 signature: c9393b82bd74b6701133b2403cec2f3b ******/
		%feature("compactdefaultargs") VKnots;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HArray1OfReal>

Description
-----------
No available documentation.
") VKnots;
		opencascade::handle<TColStd_HArray1OfReal> VKnots();

		/****** StepGeom_BSplineSurfaceWithKnotsAndRationalBSplineSurface::VKnotsValue ******/
		/****** md5 signature: e48b435b2763aaf35edab96ff84265ad ******/
		%feature("compactdefaultargs") VKnotsValue;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
double

Description
-----------
No available documentation.
") VKnotsValue;
		double VKnotsValue(const int num);

		/****** StepGeom_BSplineSurfaceWithKnotsAndRationalBSplineSurface::VMultiplicities ******/
		/****** md5 signature: 6ef942166b8db43453e987ea3806764f ******/
		%feature("compactdefaultargs") VMultiplicities;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HArray1OfInteger>

Description
-----------
No available documentation.
") VMultiplicities;
		opencascade::handle<TColStd_HArray1OfInteger> VMultiplicities();

		/****** StepGeom_BSplineSurfaceWithKnotsAndRationalBSplineSurface::VMultiplicitiesValue ******/
		/****** md5 signature: bba68017bf411f28f58d3d135d22b428 ******/
		%feature("compactdefaultargs") VMultiplicitiesValue;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
int

Description
-----------
No available documentation.
") VMultiplicitiesValue;
		int VMultiplicitiesValue(const int num);

		/****** StepGeom_BSplineSurfaceWithKnotsAndRationalBSplineSurface::WeightsData ******/
		/****** md5 signature: 2034ddfba31be998cf18a6d925f3c4a0 ******/
		%feature("compactdefaultargs") WeightsData;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HArray2OfReal>

Description
-----------
No available documentation.
") WeightsData;
		opencascade::handle<TColStd_HArray2OfReal> WeightsData();

		/****** StepGeom_BSplineSurfaceWithKnotsAndRationalBSplineSurface::WeightsDataValue ******/
		/****** md5 signature: b89813f34613a00a3c9c58a7c1cae732 ******/
		%feature("compactdefaultargs") WeightsDataValue;
		%feature("autodoc", "
Parameters
----------
num1: int
num2: int

Return
-------
double

Description
-----------
No available documentation.
") WeightsDataValue;
		double WeightsDataValue(const int num1, const int num2);

};


%make_alias(StepGeom_BSplineSurfaceWithKnotsAndRationalBSplineSurface)

%extend StepGeom_BSplineSurfaceWithKnotsAndRationalBSplineSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class StepGeom_BezierCurve *
*****************************/
class StepGeom_BezierCurve : public StepGeom_BSplineCurve {
	public:
		/****** StepGeom_BezierCurve::StepGeom_BezierCurve ******/
		/****** md5 signature: 69560cfc2d4d53eb6f77c6bcda8ebce8 ******/
		%feature("compactdefaultargs") StepGeom_BezierCurve;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a BezierCurve.
") StepGeom_BezierCurve;
		 StepGeom_BezierCurve();

};


%make_alias(StepGeom_BezierCurve)

%extend StepGeom_BezierCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************************
* class StepGeom_BezierCurveAndRationalBSplineCurve *
****************************************************/
class StepGeom_BezierCurveAndRationalBSplineCurve : public StepGeom_BSplineCurve {
	public:
		/****** StepGeom_BezierCurveAndRationalBSplineCurve::StepGeom_BezierCurveAndRationalBSplineCurve ******/
		/****** md5 signature: b8b9f894b4c1c4cf393c10e1ba37472f ******/
		%feature("compactdefaultargs") StepGeom_BezierCurveAndRationalBSplineCurve;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a BezierCurveAndRationalBSplineCurve.
") StepGeom_BezierCurveAndRationalBSplineCurve;
		 StepGeom_BezierCurveAndRationalBSplineCurve();

		/****** StepGeom_BezierCurveAndRationalBSplineCurve::BezierCurve ******/
		/****** md5 signature: 654e92dc3badce23022952c65ab57ecb ******/
		%feature("compactdefaultargs") BezierCurve;
		%feature("autodoc", "Return
-------
opencascade::handle<StepGeom_BezierCurve>

Description
-----------
No available documentation.
") BezierCurve;
		opencascade::handle<StepGeom_BezierCurve> BezierCurve();

		/****** StepGeom_BezierCurveAndRationalBSplineCurve::Init ******/
		/****** md5 signature: 0161bf2b5c5ee5338eb471f20d76b81f ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString
aDegree: int
aControlPointsList: NCollection_HArray1<
aCurveForm: StepGeom_BSplineCurveForm
aClosedCurve: StepData_Logical
aSelfIntersect: StepData_Logical
aBezierCurve: StepGeom_BezierCurve
aRationalBSplineCurve: StepGeom_RationalBSplineCurve

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const int aDegree, const opencascade::handle<NCollection_HArray1<opencascade::handle<StepGeom_CartesianPoint>> > & aControlPointsList, const StepGeom_BSplineCurveForm aCurveForm, const StepData_Logical aClosedCurve, const StepData_Logical aSelfIntersect, const opencascade::handle<StepGeom_BezierCurve> & aBezierCurve, const opencascade::handle<StepGeom_RationalBSplineCurve> & aRationalBSplineCurve);

		/****** StepGeom_BezierCurveAndRationalBSplineCurve::Init ******/
		/****** md5 signature: 9f2dcd51f1d7624f707eac9d005fe286 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString
aDegree: int
aControlPointsList: NCollection_HArray1<
aCurveForm: StepGeom_BSplineCurveForm
aClosedCurve: StepData_Logical
aSelfIntersect: StepData_Logical
aWeightsData: TColStd_HArray1OfReal

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const int aDegree, const opencascade::handle<NCollection_HArray1<opencascade::handle<StepGeom_CartesianPoint>> > & aControlPointsList, const StepGeom_BSplineCurveForm aCurveForm, const StepData_Logical aClosedCurve, const StepData_Logical aSelfIntersect, const opencascade::handle<TColStd_HArray1OfReal> & aWeightsData);

		/****** StepGeom_BezierCurveAndRationalBSplineCurve::NbWeightsData ******/
		/****** md5 signature: 0d77b571bd3515a277e1b37ee78bbf01 ******/
		%feature("compactdefaultargs") NbWeightsData;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbWeightsData;
		int NbWeightsData();

		/****** StepGeom_BezierCurveAndRationalBSplineCurve::RationalBSplineCurve ******/
		/****** md5 signature: f041a695724f356a7a0a2b32dcf75081 ******/
		%feature("compactdefaultargs") RationalBSplineCurve;
		%feature("autodoc", "Return
-------
opencascade::handle<StepGeom_RationalBSplineCurve>

Description
-----------
No available documentation.
") RationalBSplineCurve;
		opencascade::handle<StepGeom_RationalBSplineCurve> RationalBSplineCurve();

		/****** StepGeom_BezierCurveAndRationalBSplineCurve::SetBezierCurve ******/
		/****** md5 signature: 132a3f42f3a2be68abe573b9bdab30b7 ******/
		%feature("compactdefaultargs") SetBezierCurve;
		%feature("autodoc", "
Parameters
----------
aBezierCurve: StepGeom_BezierCurve

Return
-------
None

Description
-----------
No available documentation.
") SetBezierCurve;
		void SetBezierCurve(const opencascade::handle<StepGeom_BezierCurve> & aBezierCurve);

		/****** StepGeom_BezierCurveAndRationalBSplineCurve::SetRationalBSplineCurve ******/
		/****** md5 signature: 7386d58f0cbe5865f642e210d2870602 ******/
		%feature("compactdefaultargs") SetRationalBSplineCurve;
		%feature("autodoc", "
Parameters
----------
aRationalBSplineCurve: StepGeom_RationalBSplineCurve

Return
-------
None

Description
-----------
No available documentation.
") SetRationalBSplineCurve;
		void SetRationalBSplineCurve(const opencascade::handle<StepGeom_RationalBSplineCurve> & aRationalBSplineCurve);

		/****** StepGeom_BezierCurveAndRationalBSplineCurve::SetWeightsData ******/
		/****** md5 signature: 466bb4949da6a0cbfb1509fcd5d9282a ******/
		%feature("compactdefaultargs") SetWeightsData;
		%feature("autodoc", "
Parameters
----------
aWeightsData: TColStd_HArray1OfReal

Return
-------
None

Description
-----------
No available documentation.
") SetWeightsData;
		void SetWeightsData(const opencascade::handle<TColStd_HArray1OfReal> & aWeightsData);

		/****** StepGeom_BezierCurveAndRationalBSplineCurve::WeightsData ******/
		/****** md5 signature: ac334770ddd52a2342d57e30892d70f0 ******/
		%feature("compactdefaultargs") WeightsData;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HArray1OfReal>

Description
-----------
No available documentation.
") WeightsData;
		opencascade::handle<TColStd_HArray1OfReal> WeightsData();

		/****** StepGeom_BezierCurveAndRationalBSplineCurve::WeightsDataValue ******/
		/****** md5 signature: 018d7b77d1ee9020d347033b40e93860 ******/
		%feature("compactdefaultargs") WeightsDataValue;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
double

Description
-----------
No available documentation.
") WeightsDataValue;
		double WeightsDataValue(const int num);

};


%make_alias(StepGeom_BezierCurveAndRationalBSplineCurve)

%extend StepGeom_BezierCurveAndRationalBSplineCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class StepGeom_BezierSurface *
*******************************/
class StepGeom_BezierSurface : public StepGeom_BSplineSurface {
	public:
		/****** StepGeom_BezierSurface::StepGeom_BezierSurface ******/
		/****** md5 signature: 1fea3030ed0b7aae1e9df5be37bcf598 ******/
		%feature("compactdefaultargs") StepGeom_BezierSurface;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a BezierSurface.
") StepGeom_BezierSurface;
		 StepGeom_BezierSurface();

};


%make_alias(StepGeom_BezierSurface)

%extend StepGeom_BezierSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************************************
* class StepGeom_BezierSurfaceAndRationalBSplineSurface *
********************************************************/
class StepGeom_BezierSurfaceAndRationalBSplineSurface : public StepGeom_BSplineSurface {
	public:
		/****** StepGeom_BezierSurfaceAndRationalBSplineSurface::StepGeom_BezierSurfaceAndRationalBSplineSurface ******/
		/****** md5 signature: 4d6e73543ab0d6ebefcbac27a4e4010b ******/
		%feature("compactdefaultargs") StepGeom_BezierSurfaceAndRationalBSplineSurface;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a BezierSurfaceAndRationalBSplineSurface.
") StepGeom_BezierSurfaceAndRationalBSplineSurface;
		 StepGeom_BezierSurfaceAndRationalBSplineSurface();

		/****** StepGeom_BezierSurfaceAndRationalBSplineSurface::BezierSurface ******/
		/****** md5 signature: 626435a293e3ec9a8c5ead9ab6ea7f93 ******/
		%feature("compactdefaultargs") BezierSurface;
		%feature("autodoc", "Return
-------
opencascade::handle<StepGeom_BezierSurface>

Description
-----------
No available documentation.
") BezierSurface;
		opencascade::handle<StepGeom_BezierSurface> BezierSurface();

		/****** StepGeom_BezierSurfaceAndRationalBSplineSurface::Init ******/
		/****** md5 signature: 0c4e711c6fac04e231c9b9655d7aad2a ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString
aUDegree: int
aVDegree: int
aControlPointsList: NCollection_HArray2<
aSurfaceForm: StepGeom_BSplineSurfaceForm
aUClosed: StepData_Logical
aVClosed: StepData_Logical
aSelfIntersect: StepData_Logical
aBezierSurface: StepGeom_BezierSurface
aRationalBSplineSurface: StepGeom_RationalBSplineSurface

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const int aUDegree, const int aVDegree, const opencascade::handle<NCollection_HArray2<opencascade::handle<StepGeom_CartesianPoint>> > & aControlPointsList, const StepGeom_BSplineSurfaceForm aSurfaceForm, const StepData_Logical aUClosed, const StepData_Logical aVClosed, const StepData_Logical aSelfIntersect, const opencascade::handle<StepGeom_BezierSurface> & aBezierSurface, const opencascade::handle<StepGeom_RationalBSplineSurface> & aRationalBSplineSurface);

		/****** StepGeom_BezierSurfaceAndRationalBSplineSurface::Init ******/
		/****** md5 signature: 7ea858d4839ad65657f7604fc10886e4 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString
aUDegree: int
aVDegree: int
aControlPointsList: NCollection_HArray2<
aSurfaceForm: StepGeom_BSplineSurfaceForm
aUClosed: StepData_Logical
aVClosed: StepData_Logical
aSelfIntersect: StepData_Logical
aWeightsData: TColStd_HArray2OfReal

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const int aUDegree, const int aVDegree, const opencascade::handle<NCollection_HArray2<opencascade::handle<StepGeom_CartesianPoint>> > & aControlPointsList, const StepGeom_BSplineSurfaceForm aSurfaceForm, const StepData_Logical aUClosed, const StepData_Logical aVClosed, const StepData_Logical aSelfIntersect, const opencascade::handle<TColStd_HArray2OfReal> & aWeightsData);

		/****** StepGeom_BezierSurfaceAndRationalBSplineSurface::NbWeightsDataI ******/
		/****** md5 signature: ef14d461b59c30b9ee7417ed8f467ff4 ******/
		%feature("compactdefaultargs") NbWeightsDataI;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbWeightsDataI;
		int NbWeightsDataI();

		/****** StepGeom_BezierSurfaceAndRationalBSplineSurface::NbWeightsDataJ ******/
		/****** md5 signature: 01f740df3f5de3ab0f67bc7d9d5b8a23 ******/
		%feature("compactdefaultargs") NbWeightsDataJ;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbWeightsDataJ;
		int NbWeightsDataJ();

		/****** StepGeom_BezierSurfaceAndRationalBSplineSurface::RationalBSplineSurface ******/
		/****** md5 signature: 344649d2541c2455c061eda995cb3b63 ******/
		%feature("compactdefaultargs") RationalBSplineSurface;
		%feature("autodoc", "Return
-------
opencascade::handle<StepGeom_RationalBSplineSurface>

Description
-----------
No available documentation.
") RationalBSplineSurface;
		opencascade::handle<StepGeom_RationalBSplineSurface> RationalBSplineSurface();

		/****** StepGeom_BezierSurfaceAndRationalBSplineSurface::SetBezierSurface ******/
		/****** md5 signature: d8daab33bef866efe8b86007be6b70ee ******/
		%feature("compactdefaultargs") SetBezierSurface;
		%feature("autodoc", "
Parameters
----------
aBezierSurface: StepGeom_BezierSurface

Return
-------
None

Description
-----------
No available documentation.
") SetBezierSurface;
		void SetBezierSurface(const opencascade::handle<StepGeom_BezierSurface> & aBezierSurface);

		/****** StepGeom_BezierSurfaceAndRationalBSplineSurface::SetRationalBSplineSurface ******/
		/****** md5 signature: 14980d7e5c0ab36b876696928378bc68 ******/
		%feature("compactdefaultargs") SetRationalBSplineSurface;
		%feature("autodoc", "
Parameters
----------
aRationalBSplineSurface: StepGeom_RationalBSplineSurface

Return
-------
None

Description
-----------
No available documentation.
") SetRationalBSplineSurface;
		void SetRationalBSplineSurface(const opencascade::handle<StepGeom_RationalBSplineSurface> & aRationalBSplineSurface);

		/****** StepGeom_BezierSurfaceAndRationalBSplineSurface::SetWeightsData ******/
		/****** md5 signature: 48a363f5587534b09a9b3a001845d330 ******/
		%feature("compactdefaultargs") SetWeightsData;
		%feature("autodoc", "
Parameters
----------
aWeightsData: TColStd_HArray2OfReal

Return
-------
None

Description
-----------
No available documentation.
") SetWeightsData;
		void SetWeightsData(const opencascade::handle<TColStd_HArray2OfReal> & aWeightsData);

		/****** StepGeom_BezierSurfaceAndRationalBSplineSurface::WeightsData ******/
		/****** md5 signature: 2034ddfba31be998cf18a6d925f3c4a0 ******/
		%feature("compactdefaultargs") WeightsData;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HArray2OfReal>

Description
-----------
No available documentation.
") WeightsData;
		opencascade::handle<TColStd_HArray2OfReal> WeightsData();

		/****** StepGeom_BezierSurfaceAndRationalBSplineSurface::WeightsDataValue ******/
		/****** md5 signature: b89813f34613a00a3c9c58a7c1cae732 ******/
		%feature("compactdefaultargs") WeightsDataValue;
		%feature("autodoc", "
Parameters
----------
num1: int
num2: int

Return
-------
double

Description
-----------
No available documentation.
") WeightsDataValue;
		double WeightsDataValue(const int num1, const int num2);

};


%make_alias(StepGeom_BezierSurfaceAndRationalBSplineSurface)

%extend StepGeom_BezierSurfaceAndRationalBSplineSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************
* class StepGeom_CompositeCurveOnSurface *
*****************************************/
class StepGeom_CompositeCurveOnSurface : public StepGeom_CompositeCurve {
	public:
		/****** StepGeom_CompositeCurveOnSurface::StepGeom_CompositeCurveOnSurface ******/
		/****** md5 signature: fe6d3fc87b42589f6b356ef0b92f7c02 ******/
		%feature("compactdefaultargs") StepGeom_CompositeCurveOnSurface;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a CompositeCurveOnSurface.
") StepGeom_CompositeCurveOnSurface;
		 StepGeom_CompositeCurveOnSurface();

};


%make_alias(StepGeom_CompositeCurveOnSurface)

%extend StepGeom_CompositeCurveOnSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************************
* class StepGeom_DegenerateToroidalSurface *
*******************************************/
class StepGeom_DegenerateToroidalSurface : public StepGeom_ToroidalSurface {
	public:
		/****** StepGeom_DegenerateToroidalSurface::StepGeom_DegenerateToroidalSurface ******/
		/****** md5 signature: 1647c89acd5c72201cf3044adeb6e2fc ******/
		%feature("compactdefaultargs") StepGeom_DegenerateToroidalSurface;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a DegenerateToroidalSurface.
") StepGeom_DegenerateToroidalSurface;
		 StepGeom_DegenerateToroidalSurface();

		/****** StepGeom_DegenerateToroidalSurface::Init ******/
		/****** md5 signature: 9f77cbd35352535a80506b0ed87556b2 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString
aPosition: StepGeom_Axis2Placement3d
aMajorRadius: double
aMinorRadius: double
aSelectOuter: bool

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const opencascade::handle<StepGeom_Axis2Placement3d> & aPosition, const double aMajorRadius, const double aMinorRadius, const bool aSelectOuter);

		/****** StepGeom_DegenerateToroidalSurface::SelectOuter ******/
		/****** md5 signature: 68328b02ea9f1a7e23095894990c8863 ******/
		%feature("compactdefaultargs") SelectOuter;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") SelectOuter;
		bool SelectOuter();

		/****** StepGeom_DegenerateToroidalSurface::SetSelectOuter ******/
		/****** md5 signature: f87f1fdfaf8d5a03bb6e692f1bd6d1fb ******/
		%feature("compactdefaultargs") SetSelectOuter;
		%feature("autodoc", "
Parameters
----------
aSelectOuter: bool

Return
-------
None

Description
-----------
No available documentation.
") SetSelectOuter;
		void SetSelectOuter(const bool aSelectOuter);

};


%make_alias(StepGeom_DegenerateToroidalSurface)

%extend StepGeom_DegenerateToroidalSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class StepGeom_QuasiUniformCurve *
***********************************/
class StepGeom_QuasiUniformCurve : public StepGeom_BSplineCurve {
	public:
		/****** StepGeom_QuasiUniformCurve::StepGeom_QuasiUniformCurve ******/
		/****** md5 signature: 89f8b9962994b6ef5120afef9c0c3ac7 ******/
		%feature("compactdefaultargs") StepGeom_QuasiUniformCurve;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a QuasiUniformCurve.
") StepGeom_QuasiUniformCurve;
		 StepGeom_QuasiUniformCurve();

};


%make_alias(StepGeom_QuasiUniformCurve)

%extend StepGeom_QuasiUniformCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************************************
* class StepGeom_QuasiUniformCurveAndRationalBSplineCurve *
**********************************************************/
class StepGeom_QuasiUniformCurveAndRationalBSplineCurve : public StepGeom_BSplineCurve {
	public:
		/****** StepGeom_QuasiUniformCurveAndRationalBSplineCurve::StepGeom_QuasiUniformCurveAndRationalBSplineCurve ******/
		/****** md5 signature: 50eceab440f48c75cb20b984a4db8d9f ******/
		%feature("compactdefaultargs") StepGeom_QuasiUniformCurveAndRationalBSplineCurve;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a QuasiUniformCurveAndRationalBSplineCurve.
") StepGeom_QuasiUniformCurveAndRationalBSplineCurve;
		 StepGeom_QuasiUniformCurveAndRationalBSplineCurve();

		/****** StepGeom_QuasiUniformCurveAndRationalBSplineCurve::Init ******/
		/****** md5 signature: e213fe79e86ef3b1d2849cb5c81f850b ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString
aDegree: int
aControlPointsList: NCollection_HArray1<
aCurveForm: StepGeom_BSplineCurveForm
aClosedCurve: StepData_Logical
aSelfIntersect: StepData_Logical
aQuasiUniformCurve: StepGeom_QuasiUniformCurve
aRationalBSplineCurve: StepGeom_RationalBSplineCurve

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const int aDegree, const opencascade::handle<NCollection_HArray1<opencascade::handle<StepGeom_CartesianPoint>> > & aControlPointsList, const StepGeom_BSplineCurveForm aCurveForm, const StepData_Logical aClosedCurve, const StepData_Logical aSelfIntersect, const opencascade::handle<StepGeom_QuasiUniformCurve> & aQuasiUniformCurve, const opencascade::handle<StepGeom_RationalBSplineCurve> & aRationalBSplineCurve);

		/****** StepGeom_QuasiUniformCurveAndRationalBSplineCurve::Init ******/
		/****** md5 signature: 9f2dcd51f1d7624f707eac9d005fe286 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString
aDegree: int
aControlPointsList: NCollection_HArray1<
aCurveForm: StepGeom_BSplineCurveForm
aClosedCurve: StepData_Logical
aSelfIntersect: StepData_Logical
aWeightsData: TColStd_HArray1OfReal

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const int aDegree, const opencascade::handle<NCollection_HArray1<opencascade::handle<StepGeom_CartesianPoint>> > & aControlPointsList, const StepGeom_BSplineCurveForm aCurveForm, const StepData_Logical aClosedCurve, const StepData_Logical aSelfIntersect, const opencascade::handle<TColStd_HArray1OfReal> & aWeightsData);

		/****** StepGeom_QuasiUniformCurveAndRationalBSplineCurve::NbWeightsData ******/
		/****** md5 signature: 0d77b571bd3515a277e1b37ee78bbf01 ******/
		%feature("compactdefaultargs") NbWeightsData;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbWeightsData;
		int NbWeightsData();

		/****** StepGeom_QuasiUniformCurveAndRationalBSplineCurve::QuasiUniformCurve ******/
		/****** md5 signature: e3af0413096ad88fce93835249c0f2b4 ******/
		%feature("compactdefaultargs") QuasiUniformCurve;
		%feature("autodoc", "Return
-------
opencascade::handle<StepGeom_QuasiUniformCurve>

Description
-----------
No available documentation.
") QuasiUniformCurve;
		opencascade::handle<StepGeom_QuasiUniformCurve> QuasiUniformCurve();

		/****** StepGeom_QuasiUniformCurveAndRationalBSplineCurve::RationalBSplineCurve ******/
		/****** md5 signature: f041a695724f356a7a0a2b32dcf75081 ******/
		%feature("compactdefaultargs") RationalBSplineCurve;
		%feature("autodoc", "Return
-------
opencascade::handle<StepGeom_RationalBSplineCurve>

Description
-----------
No available documentation.
") RationalBSplineCurve;
		opencascade::handle<StepGeom_RationalBSplineCurve> RationalBSplineCurve();

		/****** StepGeom_QuasiUniformCurveAndRationalBSplineCurve::SetQuasiUniformCurve ******/
		/****** md5 signature: a1c9379745e8e950767efeb068ee4525 ******/
		%feature("compactdefaultargs") SetQuasiUniformCurve;
		%feature("autodoc", "
Parameters
----------
aQuasiUniformCurve: StepGeom_QuasiUniformCurve

Return
-------
None

Description
-----------
No available documentation.
") SetQuasiUniformCurve;
		void SetQuasiUniformCurve(const opencascade::handle<StepGeom_QuasiUniformCurve> & aQuasiUniformCurve);

		/****** StepGeom_QuasiUniformCurveAndRationalBSplineCurve::SetRationalBSplineCurve ******/
		/****** md5 signature: 7386d58f0cbe5865f642e210d2870602 ******/
		%feature("compactdefaultargs") SetRationalBSplineCurve;
		%feature("autodoc", "
Parameters
----------
aRationalBSplineCurve: StepGeom_RationalBSplineCurve

Return
-------
None

Description
-----------
No available documentation.
") SetRationalBSplineCurve;
		void SetRationalBSplineCurve(const opencascade::handle<StepGeom_RationalBSplineCurve> & aRationalBSplineCurve);

		/****** StepGeom_QuasiUniformCurveAndRationalBSplineCurve::SetWeightsData ******/
		/****** md5 signature: 466bb4949da6a0cbfb1509fcd5d9282a ******/
		%feature("compactdefaultargs") SetWeightsData;
		%feature("autodoc", "
Parameters
----------
aWeightsData: TColStd_HArray1OfReal

Return
-------
None

Description
-----------
No available documentation.
") SetWeightsData;
		void SetWeightsData(const opencascade::handle<TColStd_HArray1OfReal> & aWeightsData);

		/****** StepGeom_QuasiUniformCurveAndRationalBSplineCurve::WeightsData ******/
		/****** md5 signature: ac334770ddd52a2342d57e30892d70f0 ******/
		%feature("compactdefaultargs") WeightsData;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HArray1OfReal>

Description
-----------
No available documentation.
") WeightsData;
		opencascade::handle<TColStd_HArray1OfReal> WeightsData();

		/****** StepGeom_QuasiUniformCurveAndRationalBSplineCurve::WeightsDataValue ******/
		/****** md5 signature: 018d7b77d1ee9020d347033b40e93860 ******/
		%feature("compactdefaultargs") WeightsDataValue;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
double

Description
-----------
No available documentation.
") WeightsDataValue;
		double WeightsDataValue(const int num);

};


%make_alias(StepGeom_QuasiUniformCurveAndRationalBSplineCurve)

%extend StepGeom_QuasiUniformCurveAndRationalBSplineCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class StepGeom_QuasiUniformSurface *
*************************************/
class StepGeom_QuasiUniformSurface : public StepGeom_BSplineSurface {
	public:
		/****** StepGeom_QuasiUniformSurface::StepGeom_QuasiUniformSurface ******/
		/****** md5 signature: 59226917fd30efdc7a4cad574a2c0005 ******/
		%feature("compactdefaultargs") StepGeom_QuasiUniformSurface;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a QuasiUniformSurface.
") StepGeom_QuasiUniformSurface;
		 StepGeom_QuasiUniformSurface();

};


%make_alias(StepGeom_QuasiUniformSurface)

%extend StepGeom_QuasiUniformSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************************************
* class StepGeom_QuasiUniformSurfaceAndRationalBSplineSurface *
**************************************************************/
class StepGeom_QuasiUniformSurfaceAndRationalBSplineSurface : public StepGeom_BSplineSurface {
	public:
		/****** StepGeom_QuasiUniformSurfaceAndRationalBSplineSurface::StepGeom_QuasiUniformSurfaceAndRationalBSplineSurface ******/
		/****** md5 signature: b3470bab706aacb0b688105d66533e19 ******/
		%feature("compactdefaultargs") StepGeom_QuasiUniformSurfaceAndRationalBSplineSurface;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a QuasiUniformSurfaceAndRationalBSplineSurface.
") StepGeom_QuasiUniformSurfaceAndRationalBSplineSurface;
		 StepGeom_QuasiUniformSurfaceAndRationalBSplineSurface();

		/****** StepGeom_QuasiUniformSurfaceAndRationalBSplineSurface::Init ******/
		/****** md5 signature: 9a6af1b1b17c6337d044d8aafc4a1e13 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString
aUDegree: int
aVDegree: int
aControlPointsList: NCollection_HArray2<
aSurfaceForm: StepGeom_BSplineSurfaceForm
aUClosed: StepData_Logical
aVClosed: StepData_Logical
aSelfIntersect: StepData_Logical
aQuasiUniformSurface: StepGeom_QuasiUniformSurface
aRationalBSplineSurface: StepGeom_RationalBSplineSurface

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const int aUDegree, const int aVDegree, const opencascade::handle<NCollection_HArray2<opencascade::handle<StepGeom_CartesianPoint>> > & aControlPointsList, const StepGeom_BSplineSurfaceForm aSurfaceForm, const StepData_Logical aUClosed, const StepData_Logical aVClosed, const StepData_Logical aSelfIntersect, const opencascade::handle<StepGeom_QuasiUniformSurface> & aQuasiUniformSurface, const opencascade::handle<StepGeom_RationalBSplineSurface> & aRationalBSplineSurface);

		/****** StepGeom_QuasiUniformSurfaceAndRationalBSplineSurface::Init ******/
		/****** md5 signature: 7ea858d4839ad65657f7604fc10886e4 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString
aUDegree: int
aVDegree: int
aControlPointsList: NCollection_HArray2<
aSurfaceForm: StepGeom_BSplineSurfaceForm
aUClosed: StepData_Logical
aVClosed: StepData_Logical
aSelfIntersect: StepData_Logical
aWeightsData: TColStd_HArray2OfReal

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const int aUDegree, const int aVDegree, const opencascade::handle<NCollection_HArray2<opencascade::handle<StepGeom_CartesianPoint>> > & aControlPointsList, const StepGeom_BSplineSurfaceForm aSurfaceForm, const StepData_Logical aUClosed, const StepData_Logical aVClosed, const StepData_Logical aSelfIntersect, const opencascade::handle<TColStd_HArray2OfReal> & aWeightsData);

		/****** StepGeom_QuasiUniformSurfaceAndRationalBSplineSurface::NbWeightsDataI ******/
		/****** md5 signature: ef14d461b59c30b9ee7417ed8f467ff4 ******/
		%feature("compactdefaultargs") NbWeightsDataI;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbWeightsDataI;
		int NbWeightsDataI();

		/****** StepGeom_QuasiUniformSurfaceAndRationalBSplineSurface::NbWeightsDataJ ******/
		/****** md5 signature: 01f740df3f5de3ab0f67bc7d9d5b8a23 ******/
		%feature("compactdefaultargs") NbWeightsDataJ;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbWeightsDataJ;
		int NbWeightsDataJ();

		/****** StepGeom_QuasiUniformSurfaceAndRationalBSplineSurface::QuasiUniformSurface ******/
		/****** md5 signature: 8a29bd8630e6f293f768db1ec56eb6c6 ******/
		%feature("compactdefaultargs") QuasiUniformSurface;
		%feature("autodoc", "Return
-------
opencascade::handle<StepGeom_QuasiUniformSurface>

Description
-----------
No available documentation.
") QuasiUniformSurface;
		opencascade::handle<StepGeom_QuasiUniformSurface> QuasiUniformSurface();

		/****** StepGeom_QuasiUniformSurfaceAndRationalBSplineSurface::RationalBSplineSurface ******/
		/****** md5 signature: 344649d2541c2455c061eda995cb3b63 ******/
		%feature("compactdefaultargs") RationalBSplineSurface;
		%feature("autodoc", "Return
-------
opencascade::handle<StepGeom_RationalBSplineSurface>

Description
-----------
No available documentation.
") RationalBSplineSurface;
		opencascade::handle<StepGeom_RationalBSplineSurface> RationalBSplineSurface();

		/****** StepGeom_QuasiUniformSurfaceAndRationalBSplineSurface::SetQuasiUniformSurface ******/
		/****** md5 signature: a11ffc7c7ad06b53cb969fc7f24c908b ******/
		%feature("compactdefaultargs") SetQuasiUniformSurface;
		%feature("autodoc", "
Parameters
----------
aQuasiUniformSurface: StepGeom_QuasiUniformSurface

Return
-------
None

Description
-----------
No available documentation.
") SetQuasiUniformSurface;
		void SetQuasiUniformSurface(const opencascade::handle<StepGeom_QuasiUniformSurface> & aQuasiUniformSurface);

		/****** StepGeom_QuasiUniformSurfaceAndRationalBSplineSurface::SetRationalBSplineSurface ******/
		/****** md5 signature: 14980d7e5c0ab36b876696928378bc68 ******/
		%feature("compactdefaultargs") SetRationalBSplineSurface;
		%feature("autodoc", "
Parameters
----------
aRationalBSplineSurface: StepGeom_RationalBSplineSurface

Return
-------
None

Description
-----------
No available documentation.
") SetRationalBSplineSurface;
		void SetRationalBSplineSurface(const opencascade::handle<StepGeom_RationalBSplineSurface> & aRationalBSplineSurface);

		/****** StepGeom_QuasiUniformSurfaceAndRationalBSplineSurface::SetWeightsData ******/
		/****** md5 signature: 48a363f5587534b09a9b3a001845d330 ******/
		%feature("compactdefaultargs") SetWeightsData;
		%feature("autodoc", "
Parameters
----------
aWeightsData: TColStd_HArray2OfReal

Return
-------
None

Description
-----------
No available documentation.
") SetWeightsData;
		void SetWeightsData(const opencascade::handle<TColStd_HArray2OfReal> & aWeightsData);

		/****** StepGeom_QuasiUniformSurfaceAndRationalBSplineSurface::WeightsData ******/
		/****** md5 signature: 2034ddfba31be998cf18a6d925f3c4a0 ******/
		%feature("compactdefaultargs") WeightsData;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HArray2OfReal>

Description
-----------
No available documentation.
") WeightsData;
		opencascade::handle<TColStd_HArray2OfReal> WeightsData();

		/****** StepGeom_QuasiUniformSurfaceAndRationalBSplineSurface::WeightsDataValue ******/
		/****** md5 signature: b89813f34613a00a3c9c58a7c1cae732 ******/
		%feature("compactdefaultargs") WeightsDataValue;
		%feature("autodoc", "
Parameters
----------
num1: int
num2: int

Return
-------
double

Description
-----------
No available documentation.
") WeightsDataValue;
		double WeightsDataValue(const int num1, const int num2);

};


%make_alias(StepGeom_QuasiUniformSurfaceAndRationalBSplineSurface)

%extend StepGeom_QuasiUniformSurfaceAndRationalBSplineSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class StepGeom_RationalBSplineCurve *
**************************************/
class StepGeom_RationalBSplineCurve : public StepGeom_BSplineCurve {
	public:
		/****** StepGeom_RationalBSplineCurve::StepGeom_RationalBSplineCurve ******/
		/****** md5 signature: e95665fa42d712d2bd911e627ae80aac ******/
		%feature("compactdefaultargs") StepGeom_RationalBSplineCurve;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a RationalBSplineCurve.
") StepGeom_RationalBSplineCurve;
		 StepGeom_RationalBSplineCurve();

		/****** StepGeom_RationalBSplineCurve::Init ******/
		/****** md5 signature: 9f2dcd51f1d7624f707eac9d005fe286 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString
aDegree: int
aControlPointsList: NCollection_HArray1<
aCurveForm: StepGeom_BSplineCurveForm
aClosedCurve: StepData_Logical
aSelfIntersect: StepData_Logical
aWeightsData: TColStd_HArray1OfReal

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const int aDegree, const opencascade::handle<NCollection_HArray1<opencascade::handle<StepGeom_CartesianPoint>> > & aControlPointsList, const StepGeom_BSplineCurveForm aCurveForm, const StepData_Logical aClosedCurve, const StepData_Logical aSelfIntersect, const opencascade::handle<TColStd_HArray1OfReal> & aWeightsData);

		/****** StepGeom_RationalBSplineCurve::NbWeightsData ******/
		/****** md5 signature: 0d77b571bd3515a277e1b37ee78bbf01 ******/
		%feature("compactdefaultargs") NbWeightsData;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbWeightsData;
		int NbWeightsData();

		/****** StepGeom_RationalBSplineCurve::SetWeightsData ******/
		/****** md5 signature: 466bb4949da6a0cbfb1509fcd5d9282a ******/
		%feature("compactdefaultargs") SetWeightsData;
		%feature("autodoc", "
Parameters
----------
aWeightsData: TColStd_HArray1OfReal

Return
-------
None

Description
-----------
No available documentation.
") SetWeightsData;
		void SetWeightsData(const opencascade::handle<TColStd_HArray1OfReal> & aWeightsData);

		/****** StepGeom_RationalBSplineCurve::WeightsData ******/
		/****** md5 signature: ac334770ddd52a2342d57e30892d70f0 ******/
		%feature("compactdefaultargs") WeightsData;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HArray1OfReal>

Description
-----------
No available documentation.
") WeightsData;
		opencascade::handle<TColStd_HArray1OfReal> WeightsData();

		/****** StepGeom_RationalBSplineCurve::WeightsDataValue ******/
		/****** md5 signature: 018d7b77d1ee9020d347033b40e93860 ******/
		%feature("compactdefaultargs") WeightsDataValue;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
double

Description
-----------
No available documentation.
") WeightsDataValue;
		double WeightsDataValue(const int num);

};


%make_alias(StepGeom_RationalBSplineCurve)

%extend StepGeom_RationalBSplineCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class StepGeom_RationalBSplineSurface *
****************************************/
class StepGeom_RationalBSplineSurface : public StepGeom_BSplineSurface {
	public:
		/****** StepGeom_RationalBSplineSurface::StepGeom_RationalBSplineSurface ******/
		/****** md5 signature: ea6eb35afd9499829b6a0411cfa93760 ******/
		%feature("compactdefaultargs") StepGeom_RationalBSplineSurface;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a RationalBSplineSurface.
") StepGeom_RationalBSplineSurface;
		 StepGeom_RationalBSplineSurface();

		/****** StepGeom_RationalBSplineSurface::Init ******/
		/****** md5 signature: 7ea858d4839ad65657f7604fc10886e4 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString
aUDegree: int
aVDegree: int
aControlPointsList: NCollection_HArray2<
aSurfaceForm: StepGeom_BSplineSurfaceForm
aUClosed: StepData_Logical
aVClosed: StepData_Logical
aSelfIntersect: StepData_Logical
aWeightsData: TColStd_HArray2OfReal

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const int aUDegree, const int aVDegree, const opencascade::handle<NCollection_HArray2<opencascade::handle<StepGeom_CartesianPoint>> > & aControlPointsList, const StepGeom_BSplineSurfaceForm aSurfaceForm, const StepData_Logical aUClosed, const StepData_Logical aVClosed, const StepData_Logical aSelfIntersect, const opencascade::handle<TColStd_HArray2OfReal> & aWeightsData);

		/****** StepGeom_RationalBSplineSurface::NbWeightsDataI ******/
		/****** md5 signature: ef14d461b59c30b9ee7417ed8f467ff4 ******/
		%feature("compactdefaultargs") NbWeightsDataI;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbWeightsDataI;
		int NbWeightsDataI();

		/****** StepGeom_RationalBSplineSurface::NbWeightsDataJ ******/
		/****** md5 signature: 01f740df3f5de3ab0f67bc7d9d5b8a23 ******/
		%feature("compactdefaultargs") NbWeightsDataJ;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbWeightsDataJ;
		int NbWeightsDataJ();

		/****** StepGeom_RationalBSplineSurface::SetWeightsData ******/
		/****** md5 signature: 48a363f5587534b09a9b3a001845d330 ******/
		%feature("compactdefaultargs") SetWeightsData;
		%feature("autodoc", "
Parameters
----------
aWeightsData: TColStd_HArray2OfReal

Return
-------
None

Description
-----------
No available documentation.
") SetWeightsData;
		void SetWeightsData(const opencascade::handle<TColStd_HArray2OfReal> & aWeightsData);

		/****** StepGeom_RationalBSplineSurface::WeightsData ******/
		/****** md5 signature: 2034ddfba31be998cf18a6d925f3c4a0 ******/
		%feature("compactdefaultargs") WeightsData;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HArray2OfReal>

Description
-----------
No available documentation.
") WeightsData;
		opencascade::handle<TColStd_HArray2OfReal> WeightsData();

		/****** StepGeom_RationalBSplineSurface::WeightsDataValue ******/
		/****** md5 signature: b89813f34613a00a3c9c58a7c1cae732 ******/
		%feature("compactdefaultargs") WeightsDataValue;
		%feature("autodoc", "
Parameters
----------
num1: int
num2: int

Return
-------
double

Description
-----------
No available documentation.
") WeightsDataValue;
		double WeightsDataValue(const int num1, const int num2);

};


%make_alias(StepGeom_RationalBSplineSurface)

%extend StepGeom_RationalBSplineSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class StepGeom_UniformCurve *
******************************/
class StepGeom_UniformCurve : public StepGeom_BSplineCurve {
	public:
		/****** StepGeom_UniformCurve::StepGeom_UniformCurve ******/
		/****** md5 signature: c3903ee557e4c7a7a9b77be4d9b598c9 ******/
		%feature("compactdefaultargs") StepGeom_UniformCurve;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a UniformCurve.
") StepGeom_UniformCurve;
		 StepGeom_UniformCurve();

};


%make_alias(StepGeom_UniformCurve)

%extend StepGeom_UniformCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************************
* class StepGeom_UniformCurveAndRationalBSplineCurve *
*****************************************************/
class StepGeom_UniformCurveAndRationalBSplineCurve : public StepGeom_BSplineCurve {
	public:
		/****** StepGeom_UniformCurveAndRationalBSplineCurve::StepGeom_UniformCurveAndRationalBSplineCurve ******/
		/****** md5 signature: eb4a66d5fd702d32dc2e1c6b2f598720 ******/
		%feature("compactdefaultargs") StepGeom_UniformCurveAndRationalBSplineCurve;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a UniformCurveAndRationalBSplineCurve.
") StepGeom_UniformCurveAndRationalBSplineCurve;
		 StepGeom_UniformCurveAndRationalBSplineCurve();

		/****** StepGeom_UniformCurveAndRationalBSplineCurve::Init ******/
		/****** md5 signature: e5782514710a663764f424cf110eca4d ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString
aDegree: int
aControlPointsList: NCollection_HArray1<
aCurveForm: StepGeom_BSplineCurveForm
aClosedCurve: StepData_Logical
aSelfIntersect: StepData_Logical
aUniformCurve: StepGeom_UniformCurve
aRationalBSplineCurve: StepGeom_RationalBSplineCurve

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const int aDegree, const opencascade::handle<NCollection_HArray1<opencascade::handle<StepGeom_CartesianPoint>> > & aControlPointsList, const StepGeom_BSplineCurveForm aCurveForm, const StepData_Logical aClosedCurve, const StepData_Logical aSelfIntersect, const opencascade::handle<StepGeom_UniformCurve> & aUniformCurve, const opencascade::handle<StepGeom_RationalBSplineCurve> & aRationalBSplineCurve);

		/****** StepGeom_UniformCurveAndRationalBSplineCurve::Init ******/
		/****** md5 signature: 9f2dcd51f1d7624f707eac9d005fe286 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString
aDegree: int
aControlPointsList: NCollection_HArray1<
aCurveForm: StepGeom_BSplineCurveForm
aClosedCurve: StepData_Logical
aSelfIntersect: StepData_Logical
aWeightsData: TColStd_HArray1OfReal

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const int aDegree, const opencascade::handle<NCollection_HArray1<opencascade::handle<StepGeom_CartesianPoint>> > & aControlPointsList, const StepGeom_BSplineCurveForm aCurveForm, const StepData_Logical aClosedCurve, const StepData_Logical aSelfIntersect, const opencascade::handle<TColStd_HArray1OfReal> & aWeightsData);

		/****** StepGeom_UniformCurveAndRationalBSplineCurve::NbWeightsData ******/
		/****** md5 signature: 0d77b571bd3515a277e1b37ee78bbf01 ******/
		%feature("compactdefaultargs") NbWeightsData;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbWeightsData;
		int NbWeightsData();

		/****** StepGeom_UniformCurveAndRationalBSplineCurve::RationalBSplineCurve ******/
		/****** md5 signature: f041a695724f356a7a0a2b32dcf75081 ******/
		%feature("compactdefaultargs") RationalBSplineCurve;
		%feature("autodoc", "Return
-------
opencascade::handle<StepGeom_RationalBSplineCurve>

Description
-----------
No available documentation.
") RationalBSplineCurve;
		opencascade::handle<StepGeom_RationalBSplineCurve> RationalBSplineCurve();

		/****** StepGeom_UniformCurveAndRationalBSplineCurve::SetRationalBSplineCurve ******/
		/****** md5 signature: 7386d58f0cbe5865f642e210d2870602 ******/
		%feature("compactdefaultargs") SetRationalBSplineCurve;
		%feature("autodoc", "
Parameters
----------
aRationalBSplineCurve: StepGeom_RationalBSplineCurve

Return
-------
None

Description
-----------
No available documentation.
") SetRationalBSplineCurve;
		void SetRationalBSplineCurve(const opencascade::handle<StepGeom_RationalBSplineCurve> & aRationalBSplineCurve);

		/****** StepGeom_UniformCurveAndRationalBSplineCurve::SetUniformCurve ******/
		/****** md5 signature: af4779bfe2a8d240af314833cb6725ef ******/
		%feature("compactdefaultargs") SetUniformCurve;
		%feature("autodoc", "
Parameters
----------
aUniformCurve: StepGeom_UniformCurve

Return
-------
None

Description
-----------
No available documentation.
") SetUniformCurve;
		void SetUniformCurve(const opencascade::handle<StepGeom_UniformCurve> & aUniformCurve);

		/****** StepGeom_UniformCurveAndRationalBSplineCurve::SetWeightsData ******/
		/****** md5 signature: 466bb4949da6a0cbfb1509fcd5d9282a ******/
		%feature("compactdefaultargs") SetWeightsData;
		%feature("autodoc", "
Parameters
----------
aWeightsData: TColStd_HArray1OfReal

Return
-------
None

Description
-----------
No available documentation.
") SetWeightsData;
		void SetWeightsData(const opencascade::handle<TColStd_HArray1OfReal> & aWeightsData);

		/****** StepGeom_UniformCurveAndRationalBSplineCurve::UniformCurve ******/
		/****** md5 signature: 120a4690f6bfa64251ecd22f777964c5 ******/
		%feature("compactdefaultargs") UniformCurve;
		%feature("autodoc", "Return
-------
opencascade::handle<StepGeom_UniformCurve>

Description
-----------
No available documentation.
") UniformCurve;
		opencascade::handle<StepGeom_UniformCurve> UniformCurve();

		/****** StepGeom_UniformCurveAndRationalBSplineCurve::WeightsData ******/
		/****** md5 signature: ac334770ddd52a2342d57e30892d70f0 ******/
		%feature("compactdefaultargs") WeightsData;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HArray1OfReal>

Description
-----------
No available documentation.
") WeightsData;
		opencascade::handle<TColStd_HArray1OfReal> WeightsData();

		/****** StepGeom_UniformCurveAndRationalBSplineCurve::WeightsDataValue ******/
		/****** md5 signature: 018d7b77d1ee9020d347033b40e93860 ******/
		%feature("compactdefaultargs") WeightsDataValue;
		%feature("autodoc", "
Parameters
----------
num: int

Return
-------
double

Description
-----------
No available documentation.
") WeightsDataValue;
		double WeightsDataValue(const int num);

};


%make_alias(StepGeom_UniformCurveAndRationalBSplineCurve)

%extend StepGeom_UniformCurveAndRationalBSplineCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class StepGeom_UniformSurface *
********************************/
class StepGeom_UniformSurface : public StepGeom_BSplineSurface {
	public:
		/****** StepGeom_UniformSurface::StepGeom_UniformSurface ******/
		/****** md5 signature: 6df4e57e50d9e3f0f360928de2c30337 ******/
		%feature("compactdefaultargs") StepGeom_UniformSurface;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a UniformSurface.
") StepGeom_UniformSurface;
		 StepGeom_UniformSurface();

};


%make_alias(StepGeom_UniformSurface)

%extend StepGeom_UniformSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************************************
* class StepGeom_UniformSurfaceAndRationalBSplineSurface *
*********************************************************/
class StepGeom_UniformSurfaceAndRationalBSplineSurface : public StepGeom_BSplineSurface {
	public:
		/****** StepGeom_UniformSurfaceAndRationalBSplineSurface::StepGeom_UniformSurfaceAndRationalBSplineSurface ******/
		/****** md5 signature: dc81b5ccf64a27246f5d135fa4784f77 ******/
		%feature("compactdefaultargs") StepGeom_UniformSurfaceAndRationalBSplineSurface;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a UniformSurfaceAndRationalBSplineSurface.
") StepGeom_UniformSurfaceAndRationalBSplineSurface;
		 StepGeom_UniformSurfaceAndRationalBSplineSurface();

		/****** StepGeom_UniformSurfaceAndRationalBSplineSurface::Init ******/
		/****** md5 signature: 3db4dee41717379c95770eb06c284add ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString
aUDegree: int
aVDegree: int
aControlPointsList: NCollection_HArray2<
aSurfaceForm: StepGeom_BSplineSurfaceForm
aUClosed: StepData_Logical
aVClosed: StepData_Logical
aSelfIntersect: StepData_Logical
aUniformSurface: StepGeom_UniformSurface
aRationalBSplineSurface: StepGeom_RationalBSplineSurface

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const int aUDegree, const int aVDegree, const opencascade::handle<NCollection_HArray2<opencascade::handle<StepGeom_CartesianPoint>> > & aControlPointsList, const StepGeom_BSplineSurfaceForm aSurfaceForm, const StepData_Logical aUClosed, const StepData_Logical aVClosed, const StepData_Logical aSelfIntersect, const opencascade::handle<StepGeom_UniformSurface> & aUniformSurface, const opencascade::handle<StepGeom_RationalBSplineSurface> & aRationalBSplineSurface);

		/****** StepGeom_UniformSurfaceAndRationalBSplineSurface::Init ******/
		/****** md5 signature: 7ea858d4839ad65657f7604fc10886e4 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aName: TCollection_HAsciiString
aUDegree: int
aVDegree: int
aControlPointsList: NCollection_HArray2<
aSurfaceForm: StepGeom_BSplineSurfaceForm
aUClosed: StepData_Logical
aVClosed: StepData_Logical
aSelfIntersect: StepData_Logical
aWeightsData: TColStd_HArray2OfReal

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TCollection_HAsciiString> & aName, const int aUDegree, const int aVDegree, const opencascade::handle<NCollection_HArray2<opencascade::handle<StepGeom_CartesianPoint>> > & aControlPointsList, const StepGeom_BSplineSurfaceForm aSurfaceForm, const StepData_Logical aUClosed, const StepData_Logical aVClosed, const StepData_Logical aSelfIntersect, const opencascade::handle<TColStd_HArray2OfReal> & aWeightsData);

		/****** StepGeom_UniformSurfaceAndRationalBSplineSurface::NbWeightsDataI ******/
		/****** md5 signature: ef14d461b59c30b9ee7417ed8f467ff4 ******/
		%feature("compactdefaultargs") NbWeightsDataI;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbWeightsDataI;
		int NbWeightsDataI();

		/****** StepGeom_UniformSurfaceAndRationalBSplineSurface::NbWeightsDataJ ******/
		/****** md5 signature: 01f740df3f5de3ab0f67bc7d9d5b8a23 ******/
		%feature("compactdefaultargs") NbWeightsDataJ;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbWeightsDataJ;
		int NbWeightsDataJ();

		/****** StepGeom_UniformSurfaceAndRationalBSplineSurface::RationalBSplineSurface ******/
		/****** md5 signature: 344649d2541c2455c061eda995cb3b63 ******/
		%feature("compactdefaultargs") RationalBSplineSurface;
		%feature("autodoc", "Return
-------
opencascade::handle<StepGeom_RationalBSplineSurface>

Description
-----------
No available documentation.
") RationalBSplineSurface;
		opencascade::handle<StepGeom_RationalBSplineSurface> RationalBSplineSurface();

		/****** StepGeom_UniformSurfaceAndRationalBSplineSurface::SetRationalBSplineSurface ******/
		/****** md5 signature: 14980d7e5c0ab36b876696928378bc68 ******/
		%feature("compactdefaultargs") SetRationalBSplineSurface;
		%feature("autodoc", "
Parameters
----------
aRationalBSplineSurface: StepGeom_RationalBSplineSurface

Return
-------
None

Description
-----------
No available documentation.
") SetRationalBSplineSurface;
		void SetRationalBSplineSurface(const opencascade::handle<StepGeom_RationalBSplineSurface> & aRationalBSplineSurface);

		/****** StepGeom_UniformSurfaceAndRationalBSplineSurface::SetUniformSurface ******/
		/****** md5 signature: a5fbc133d133fc9a4c18150a1220981a ******/
		%feature("compactdefaultargs") SetUniformSurface;
		%feature("autodoc", "
Parameters
----------
aUniformSurface: StepGeom_UniformSurface

Return
-------
None

Description
-----------
No available documentation.
") SetUniformSurface;
		void SetUniformSurface(const opencascade::handle<StepGeom_UniformSurface> & aUniformSurface);

		/****** StepGeom_UniformSurfaceAndRationalBSplineSurface::SetWeightsData ******/
		/****** md5 signature: 48a363f5587534b09a9b3a001845d330 ******/
		%feature("compactdefaultargs") SetWeightsData;
		%feature("autodoc", "
Parameters
----------
aWeightsData: TColStd_HArray2OfReal

Return
-------
None

Description
-----------
No available documentation.
") SetWeightsData;
		void SetWeightsData(const opencascade::handle<TColStd_HArray2OfReal> & aWeightsData);

		/****** StepGeom_UniformSurfaceAndRationalBSplineSurface::UniformSurface ******/
		/****** md5 signature: 42ce278e5be0190060e4e0ad9f5057bb ******/
		%feature("compactdefaultargs") UniformSurface;
		%feature("autodoc", "Return
-------
opencascade::handle<StepGeom_UniformSurface>

Description
-----------
No available documentation.
") UniformSurface;
		opencascade::handle<StepGeom_UniformSurface> UniformSurface();

		/****** StepGeom_UniformSurfaceAndRationalBSplineSurface::WeightsData ******/
		/****** md5 signature: 2034ddfba31be998cf18a6d925f3c4a0 ******/
		%feature("compactdefaultargs") WeightsData;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HArray2OfReal>

Description
-----------
No available documentation.
") WeightsData;
		opencascade::handle<TColStd_HArray2OfReal> WeightsData();

		/****** StepGeom_UniformSurfaceAndRationalBSplineSurface::WeightsDataValue ******/
		/****** md5 signature: b89813f34613a00a3c9c58a7c1cae732 ******/
		%feature("compactdefaultargs") WeightsDataValue;
		%feature("autodoc", "
Parameters
----------
num1: int
num2: int

Return
-------
double

Description
-----------
No available documentation.
") WeightsDataValue;
		double WeightsDataValue(const int num1, const int num2);

};


%make_alias(StepGeom_UniformSurfaceAndRationalBSplineSurface)

%extend StepGeom_UniformSurfaceAndRationalBSplineSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class StepGeom_BoundaryCurve *
*******************************/
class StepGeom_BoundaryCurve : public StepGeom_CompositeCurveOnSurface {
	public:
		/****** StepGeom_BoundaryCurve::StepGeom_BoundaryCurve ******/
		/****** md5 signature: 92857d1607d4a8b36891df82432c6c48 ******/
		%feature("compactdefaultargs") StepGeom_BoundaryCurve;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a BoundaryCurve.
") StepGeom_BoundaryCurve;
		 StepGeom_BoundaryCurve();

};


%make_alias(StepGeom_BoundaryCurve)

%extend StepGeom_BoundaryCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class StepGeom_OuterBoundaryCurve *
************************************/
class StepGeom_OuterBoundaryCurve : public StepGeom_BoundaryCurve {
	public:
		/****** StepGeom_OuterBoundaryCurve::StepGeom_OuterBoundaryCurve ******/
		/****** md5 signature: 6816a9297295cb1e91a09a07ecd3a343 ******/
		%feature("compactdefaultargs") StepGeom_OuterBoundaryCurve;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns a OuterBoundaryCurve.
") StepGeom_OuterBoundaryCurve;
		 StepGeom_OuterBoundaryCurve();

};


%make_alias(StepGeom_OuterBoundaryCurve)

%extend StepGeom_OuterBoundaryCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */

class StepGeom_HArray1OfBoundaryCurve : public NCollection_Array1<opencascade::handle<StepGeom_BoundaryCurve>>, public Standard_Transient {
  public:
    StepGeom_HArray1OfBoundaryCurve(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepGeom_HArray1OfBoundaryCurve(const Standard_Integer theLower, const Standard_Integer theUpper, const NCollection_Array1<opencascade::handle<StepGeom_BoundaryCurve>>::value_type& theValue);
    StepGeom_HArray1OfBoundaryCurve(const NCollection_Array1<opencascade::handle<StepGeom_BoundaryCurve>>& theOther);
    const NCollection_Array1<opencascade::handle<StepGeom_BoundaryCurve>>& Array1();
    NCollection_Array1<opencascade::handle<StepGeom_BoundaryCurve>>& ChangeArray1();
};
%make_alias(StepGeom_HArray1OfBoundaryCurve)


class StepGeom_HArray1OfCartesianPoint : public NCollection_Array1<opencascade::handle<StepGeom_CartesianPoint>>, public Standard_Transient {
  public:
    StepGeom_HArray1OfCartesianPoint(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepGeom_HArray1OfCartesianPoint(const Standard_Integer theLower, const Standard_Integer theUpper, const NCollection_Array1<opencascade::handle<StepGeom_CartesianPoint>>::value_type& theValue);
    StepGeom_HArray1OfCartesianPoint(const NCollection_Array1<opencascade::handle<StepGeom_CartesianPoint>>& theOther);
    const NCollection_Array1<opencascade::handle<StepGeom_CartesianPoint>>& Array1();
    NCollection_Array1<opencascade::handle<StepGeom_CartesianPoint>>& ChangeArray1();
};
%make_alias(StepGeom_HArray1OfCartesianPoint)


class StepGeom_HArray1OfCompositeCurveSegment : public NCollection_Array1<opencascade::handle<StepGeom_CompositeCurveSegment>>, public Standard_Transient {
  public:
    StepGeom_HArray1OfCompositeCurveSegment(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepGeom_HArray1OfCompositeCurveSegment(const Standard_Integer theLower, const Standard_Integer theUpper, const NCollection_Array1<opencascade::handle<StepGeom_CompositeCurveSegment>>::value_type& theValue);
    StepGeom_HArray1OfCompositeCurveSegment(const NCollection_Array1<opencascade::handle<StepGeom_CompositeCurveSegment>>& theOther);
    const NCollection_Array1<opencascade::handle<StepGeom_CompositeCurveSegment>>& Array1();
    NCollection_Array1<opencascade::handle<StepGeom_CompositeCurveSegment>>& ChangeArray1();
};
%make_alias(StepGeom_HArray1OfCompositeCurveSegment)


class StepGeom_HArray1OfCurve : public NCollection_Array1<opencascade::handle<StepGeom_Curve>>, public Standard_Transient {
  public:
    StepGeom_HArray1OfCurve(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepGeom_HArray1OfCurve(const Standard_Integer theLower, const Standard_Integer theUpper, const NCollection_Array1<opencascade::handle<StepGeom_Curve>>::value_type& theValue);
    StepGeom_HArray1OfCurve(const NCollection_Array1<opencascade::handle<StepGeom_Curve>>& theOther);
    const NCollection_Array1<opencascade::handle<StepGeom_Curve>>& Array1();
    NCollection_Array1<opencascade::handle<StepGeom_Curve>>& ChangeArray1();
};
%make_alias(StepGeom_HArray1OfCurve)


class StepGeom_HArray1OfPcurveOrSurface : public NCollection_Array1<StepGeom_PcurveOrSurface>, public Standard_Transient {
  public:
    StepGeom_HArray1OfPcurveOrSurface(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepGeom_HArray1OfPcurveOrSurface(const Standard_Integer theLower, const Standard_Integer theUpper, const NCollection_Array1<StepGeom_PcurveOrSurface>::value_type& theValue);
    StepGeom_HArray1OfPcurveOrSurface(const NCollection_Array1<StepGeom_PcurveOrSurface>& theOther);
    const NCollection_Array1<StepGeom_PcurveOrSurface>& Array1();
    NCollection_Array1<StepGeom_PcurveOrSurface>& ChangeArray1();
};
%make_alias(StepGeom_HArray1OfPcurveOrSurface)


class StepGeom_HArray1OfSurfaceBoundary : public NCollection_Array1<StepGeom_SurfaceBoundary>, public Standard_Transient {
  public:
    StepGeom_HArray1OfSurfaceBoundary(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepGeom_HArray1OfSurfaceBoundary(const Standard_Integer theLower, const Standard_Integer theUpper, const NCollection_Array1<StepGeom_SurfaceBoundary>::value_type& theValue);
    StepGeom_HArray1OfSurfaceBoundary(const NCollection_Array1<StepGeom_SurfaceBoundary>& theOther);
    const NCollection_Array1<StepGeom_SurfaceBoundary>& Array1();
    NCollection_Array1<StepGeom_SurfaceBoundary>& ChangeArray1();
};
%make_alias(StepGeom_HArray1OfSurfaceBoundary)


class StepGeom_HArray1OfTrimmingSelect : public NCollection_Array1<StepGeom_TrimmingSelect>, public Standard_Transient {
  public:
    StepGeom_HArray1OfTrimmingSelect(const Standard_Integer theLower, const Standard_Integer theUpper);
    StepGeom_HArray1OfTrimmingSelect(const Standard_Integer theLower, const Standard_Integer theUpper, const NCollection_Array1<StepGeom_TrimmingSelect>::value_type& theValue);
    StepGeom_HArray1OfTrimmingSelect(const NCollection_Array1<StepGeom_TrimmingSelect>& theOther);
    const NCollection_Array1<StepGeom_TrimmingSelect>& Array1();
    NCollection_Array1<StepGeom_TrimmingSelect>& ChangeArray1();
};
%make_alias(StepGeom_HArray1OfTrimmingSelect)

/* harray2 classes */
class StepGeom_HArray2OfCartesianPoint : public NCollection_Array2<opencascade::handle<StepGeom_CartesianPoint>>, public Standard_Transient {
  public:
    StepGeom_HArray2OfCartesianPoint(const Standard_Integer theRowLow, const Standard_Integer theRowUpp, const Standard_Integer theColLow,
                const Standard_Integer theColUpp);
    StepGeom_HArray2OfCartesianPoint(const Standard_Integer theRowLow, const Standard_Integer theRowUpp, const Standard_Integer theColLow,
               const Standard_Integer theColUpp, const NCollection_Array2<opencascade::handle<StepGeom_CartesianPoint>>::value_type& theValue);
    StepGeom_HArray2OfCartesianPoint(const NCollection_Array2<opencascade::handle<StepGeom_CartesianPoint>>& theOther);
    const NCollection_Array2<opencascade::handle<StepGeom_CartesianPoint>>& Array2 ();
    NCollection_Array2<opencascade::handle<StepGeom_CartesianPoint>>& ChangeArray2 (); 
};
%make_alias(StepGeom_HArray2OfCartesianPoint)


class StepGeom_HArray2OfSurfacePatch : public NCollection_Array2<opencascade::handle<StepGeom_SurfacePatch>>, public Standard_Transient {
  public:
    StepGeom_HArray2OfSurfacePatch(const Standard_Integer theRowLow, const Standard_Integer theRowUpp, const Standard_Integer theColLow,
                const Standard_Integer theColUpp);
    StepGeom_HArray2OfSurfacePatch(const Standard_Integer theRowLow, const Standard_Integer theRowUpp, const Standard_Integer theColLow,
               const Standard_Integer theColUpp, const NCollection_Array2<opencascade::handle<StepGeom_SurfacePatch>>::value_type& theValue);
    StepGeom_HArray2OfSurfacePatch(const NCollection_Array2<opencascade::handle<StepGeom_SurfacePatch>>& theOther);
    const NCollection_Array2<opencascade::handle<StepGeom_SurfacePatch>>& Array2 ();
    NCollection_Array2<opencascade::handle<StepGeom_SurfacePatch>>& ChangeArray2 (); 
};
%make_alias(StepGeom_HArray2OfSurfacePatch)


/* hsequence classes */
/* class aliases */
%pythoncode {
}
