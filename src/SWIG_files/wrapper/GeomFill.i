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
%define GEOMFILLDOCSTRING
"GeomFill module, see official documentation at
https://dev.opencascade.org/doc/occt-7.8.0/refman/html/package_geomfill.html"
%enddef
%module (package="OCC.Core", docstring=GEOMFILLDOCSTRING) GeomFill


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
#include<GeomFill_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<Convert_module.hxx>
#include<gp_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<Geom_module.hxx>
#include<AppBlend_module.hxx>
#include<GeomAbs_module.hxx>
#include<Approx_module.hxx>
#include<Adaptor3d_module.hxx>
#include<Law_module.hxx>
#include<math_module.hxx>
#include<Geom2d_module.hxx>
#include<TColGeom_module.hxx>
#include<Adaptor2d_module.hxx>
#include<FEmTool_module.hxx>
#include<AppParCurves_module.hxx>
#include<PLib_module.hxx>
#include<Message_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import Convert.i
%import gp.i
%import TColgp.i
%import TColStd.i
%import Geom.i
%import AppBlend.i
%import GeomAbs.i
%import Approx.i
%import Adaptor3d.i
%import Law.i
%import math.i
%import Geom2d.i
%import TColGeom.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
enum GeomFill_ApproxStyle {
	GeomFill_Section = 0,
	GeomFill_Location = 1,
};

enum GeomFill_FillingStyle {
	GeomFill_StretchStyle = 0,
	GeomFill_CoonsStyle = 1,
	GeomFill_CurvedStyle = 2,
};

enum GeomFill_PipeError {
	GeomFill_PipeOk = 0,
	GeomFill_PipeNotOk = 1,
	GeomFill_PlaneNotIntersectGuide = 2,
	GeomFill_ImpossibleContact = 3,
};

enum GeomFill_Trihedron {
	GeomFill_IsCorrectedFrenet = 0,
	GeomFill_IsFixed = 1,
	GeomFill_IsFrenet = 2,
	GeomFill_IsConstantNormal = 3,
	GeomFill_IsDarboux = 4,
	GeomFill_IsGuideAC = 5,
	GeomFill_IsGuidePlan = 6,
	GeomFill_IsGuideACWithContact = 7,
	GeomFill_IsGuidePlanWithContact = 8,
	GeomFill_IsDiscreteTrihedron = 9,
};

/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {

class GeomFill_ApproxStyle(IntEnum):
	GeomFill_Section = 0
	GeomFill_Location = 1
GeomFill_Section = GeomFill_ApproxStyle.GeomFill_Section
GeomFill_Location = GeomFill_ApproxStyle.GeomFill_Location

class GeomFill_FillingStyle(IntEnum):
	GeomFill_StretchStyle = 0
	GeomFill_CoonsStyle = 1
	GeomFill_CurvedStyle = 2
GeomFill_StretchStyle = GeomFill_FillingStyle.GeomFill_StretchStyle
GeomFill_CoonsStyle = GeomFill_FillingStyle.GeomFill_CoonsStyle
GeomFill_CurvedStyle = GeomFill_FillingStyle.GeomFill_CurvedStyle

class GeomFill_PipeError(IntEnum):
	GeomFill_PipeOk = 0
	GeomFill_PipeNotOk = 1
	GeomFill_PlaneNotIntersectGuide = 2
	GeomFill_ImpossibleContact = 3
GeomFill_PipeOk = GeomFill_PipeError.GeomFill_PipeOk
GeomFill_PipeNotOk = GeomFill_PipeError.GeomFill_PipeNotOk
GeomFill_PlaneNotIntersectGuide = GeomFill_PipeError.GeomFill_PlaneNotIntersectGuide
GeomFill_ImpossibleContact = GeomFill_PipeError.GeomFill_ImpossibleContact

class GeomFill_Trihedron(IntEnum):
	GeomFill_IsCorrectedFrenet = 0
	GeomFill_IsFixed = 1
	GeomFill_IsFrenet = 2
	GeomFill_IsConstantNormal = 3
	GeomFill_IsDarboux = 4
	GeomFill_IsGuideAC = 5
	GeomFill_IsGuidePlan = 6
	GeomFill_IsGuideACWithContact = 7
	GeomFill_IsGuidePlanWithContact = 8
	GeomFill_IsDiscreteTrihedron = 9
GeomFill_IsCorrectedFrenet = GeomFill_Trihedron.GeomFill_IsCorrectedFrenet
GeomFill_IsFixed = GeomFill_Trihedron.GeomFill_IsFixed
GeomFill_IsFrenet = GeomFill_Trihedron.GeomFill_IsFrenet
GeomFill_IsConstantNormal = GeomFill_Trihedron.GeomFill_IsConstantNormal
GeomFill_IsDarboux = GeomFill_Trihedron.GeomFill_IsDarboux
GeomFill_IsGuideAC = GeomFill_Trihedron.GeomFill_IsGuideAC
GeomFill_IsGuidePlan = GeomFill_Trihedron.GeomFill_IsGuidePlan
GeomFill_IsGuideACWithContact = GeomFill_Trihedron.GeomFill_IsGuideACWithContact
GeomFill_IsGuidePlanWithContact = GeomFill_Trihedron.GeomFill_IsGuidePlanWithContact
GeomFill_IsDiscreteTrihedron = GeomFill_Trihedron.GeomFill_IsDiscreteTrihedron
};
/* end python proxy for enums */

/* handles */
%wrap_handle(GeomFill_Boundary)
%wrap_handle(GeomFill_CircularBlendFunc)
%wrap_handle(GeomFill_CoonsAlgPatch)
%wrap_handle(GeomFill_Line)
%wrap_handle(GeomFill_LocationLaw)
%wrap_handle(GeomFill_SectionLaw)
%wrap_handle(GeomFill_SnglrFunc)
%wrap_handle(GeomFill_SweepFunction)
%wrap_handle(GeomFill_TgtField)
%wrap_handle(GeomFill_TrihedronLaw)
%wrap_handle(GeomFill_BoundWithSurf)
%wrap_handle(GeomFill_ConstantBiNormal)
%wrap_handle(GeomFill_CorrectedFrenet)
%wrap_handle(GeomFill_CurveAndTrihedron)
%wrap_handle(GeomFill_Darboux)
%wrap_handle(GeomFill_DegeneratedBound)
%wrap_handle(GeomFill_DiscreteTrihedron)
%wrap_handle(GeomFill_DraftTrihedron)
%wrap_handle(GeomFill_EvolvedSection)
%wrap_handle(GeomFill_Fixed)
%wrap_handle(GeomFill_Frenet)
%wrap_handle(GeomFill_LocationDraft)
%wrap_handle(GeomFill_LocationGuide)
%wrap_handle(GeomFill_NSections)
%wrap_handle(GeomFill_SimpleBound)
%wrap_handle(GeomFill_TgtOnCoons)
%wrap_handle(GeomFill_TrihedronWithGuide)
%wrap_handle(GeomFill_UniformSection)
%wrap_handle(GeomFill_GuideTrihedronAC)
%wrap_handle(GeomFill_GuideTrihedronPlan)
%wrap_handle(GeomFill_HArray1OfLocationLaw)
%wrap_handle(GeomFill_HArray1OfSectionLaw)
%wrap_handle(GeomFill_HSequenceOfAx2)
/* end handles declaration */

/* templates */
%template(GeomFill_Array1OfLocationLaw) NCollection_Array1<opencascade::handle<GeomFill_LocationLaw>>;
Array1ExtendIter(opencascade::handle<GeomFill_LocationLaw>)

%template(GeomFill_Array1OfSectionLaw) NCollection_Array1<opencascade::handle<GeomFill_SectionLaw>>;
Array1ExtendIter(opencascade::handle<GeomFill_SectionLaw>)

%template(GeomFill_SequenceOfAx2) NCollection_Sequence<gp_Ax2>;

%extend NCollection_Sequence<gp_Ax2> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(GeomFill_SequenceOfTrsf) NCollection_Sequence<gp_Trsf>;

%extend NCollection_Sequence<gp_Trsf> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
/* end templates declaration */

/* typedefs */
typedef NCollection_Array1<opencascade::handle<GeomFill_LocationLaw>> GeomFill_Array1OfLocationLaw;
typedef NCollection_Array1<opencascade::handle<GeomFill_SectionLaw>> GeomFill_Array1OfSectionLaw;
typedef NCollection_Sequence<gp_Ax2> GeomFill_SequenceOfAx2;
typedef NCollection_Sequence<gp_Trsf> GeomFill_SequenceOfTrsf;
/* end typedefs declaration */

/*****************
* class GeomFill *
*****************/
%rename(geomfill) GeomFill;
class GeomFill {
	public:
		/****** GeomFill::GetCircle ******/
		/****** md5 signature: 7670935987fa38c6bda2cd1f57feb0ed ******/
		%feature("compactdefaultargs") GetCircle;
		%feature("autodoc", "
Parameters
----------
TConv: Convert_ParameterisationType
ns1: gp_Vec
ns2: gp_Vec
nplan: gp_Vec
pt1: gp_Pnt
pt2: gp_Pnt
Rayon: float
Center: gp_Pnt
Poles: TColgp_Array1OfPnt
Weigths: TColStd_Array1OfReal

Return
-------
None

Description
-----------
No available documentation.
") GetCircle;
		static void GetCircle(const Convert_ParameterisationType TConv, const gp_Vec & ns1, const gp_Vec & ns2, const gp_Vec & nplan, const gp_Pnt & pt1, const gp_Pnt & pt2, const Standard_Real Rayon, const gp_Pnt & Center, TColgp_Array1OfPnt & Poles, TColStd_Array1OfReal & Weigths);

		/****** GeomFill::GetCircle ******/
		/****** md5 signature: 32287dfdf4d02cc6e907c948a85c8d68 ******/
		%feature("compactdefaultargs") GetCircle;
		%feature("autodoc", "
Parameters
----------
TConv: Convert_ParameterisationType
ns1: gp_Vec
ns2: gp_Vec
dn1w: gp_Vec
dn2w: gp_Vec
nplan: gp_Vec
dnplan: gp_Vec
pts1: gp_Pnt
pts2: gp_Pnt
tang1: gp_Vec
tang2: gp_Vec
Rayon: float
DRayon: float
Center: gp_Pnt
DCenter: gp_Vec
Poles: TColgp_Array1OfPnt
DPoles: TColgp_Array1OfVec
Weigths: TColStd_Array1OfReal
DWeigths: TColStd_Array1OfReal

Return
-------
bool

Description
-----------
No available documentation.
") GetCircle;
		static Standard_Boolean GetCircle(const Convert_ParameterisationType TConv, const gp_Vec & ns1, const gp_Vec & ns2, const gp_Vec & dn1w, const gp_Vec & dn2w, const gp_Vec & nplan, const gp_Vec & dnplan, const gp_Pnt & pts1, const gp_Pnt & pts2, const gp_Vec & tang1, const gp_Vec & tang2, const Standard_Real Rayon, const Standard_Real DRayon, const gp_Pnt & Center, const gp_Vec & DCenter, TColgp_Array1OfPnt & Poles, TColgp_Array1OfVec & DPoles, TColStd_Array1OfReal & Weigths, TColStd_Array1OfReal & DWeigths);

		/****** GeomFill::GetCircle ******/
		/****** md5 signature: a00c25f874484c064860aa81fa70acb6 ******/
		%feature("compactdefaultargs") GetCircle;
		%feature("autodoc", "
Parameters
----------
TConv: Convert_ParameterisationType
ns1: gp_Vec
ns2: gp_Vec
dn1w: gp_Vec
dn2w: gp_Vec
d2n1w: gp_Vec
d2n2w: gp_Vec
nplan: gp_Vec
dnplan: gp_Vec
d2nplan: gp_Vec
pts1: gp_Pnt
pts2: gp_Pnt
tang1: gp_Vec
tang2: gp_Vec
Dtang1: gp_Vec
Dtang2: gp_Vec
Rayon: float
DRayon: float
D2Rayon: float
Center: gp_Pnt
DCenter: gp_Vec
D2Center: gp_Vec
Poles: TColgp_Array1OfPnt
DPoles: TColgp_Array1OfVec
D2Poles: TColgp_Array1OfVec
Weigths: TColStd_Array1OfReal
DWeigths: TColStd_Array1OfReal
D2Weigths: TColStd_Array1OfReal

Return
-------
bool

Description
-----------
No available documentation.
") GetCircle;
		static Standard_Boolean GetCircle(const Convert_ParameterisationType TConv, const gp_Vec & ns1, const gp_Vec & ns2, const gp_Vec & dn1w, const gp_Vec & dn2w, const gp_Vec & d2n1w, const gp_Vec & d2n2w, const gp_Vec & nplan, const gp_Vec & dnplan, const gp_Vec & d2nplan, const gp_Pnt & pts1, const gp_Pnt & pts2, const gp_Vec & tang1, const gp_Vec & tang2, const gp_Vec & Dtang1, const gp_Vec & Dtang2, const Standard_Real Rayon, const Standard_Real DRayon, const Standard_Real D2Rayon, const gp_Pnt & Center, const gp_Vec & DCenter, const gp_Vec & D2Center, TColgp_Array1OfPnt & Poles, TColgp_Array1OfVec & DPoles, TColgp_Array1OfVec & D2Poles, TColStd_Array1OfReal & Weigths, TColStd_Array1OfReal & DWeigths, TColStd_Array1OfReal & D2Weigths);

		/****** GeomFill::GetMinimalWeights ******/
		/****** md5 signature: f85c68b214a52df79ab84c0fed389ed6 ******/
		%feature("compactdefaultargs") GetMinimalWeights;
		%feature("autodoc", "
Parameters
----------
TConv: Convert_ParameterisationType
AngleMin: float
AngleMax: float
Weigths: TColStd_Array1OfReal

Return
-------
None

Description
-----------
No available documentation.
") GetMinimalWeights;
		static void GetMinimalWeights(const Convert_ParameterisationType TConv, const Standard_Real AngleMin, const Standard_Real AngleMax, TColStd_Array1OfReal & Weigths);

		/****** GeomFill::GetShape ******/
		/****** md5 signature: 003ee9f808c91303411dd1103ac1580f ******/
		%feature("compactdefaultargs") GetShape;
		%feature("autodoc", "
Parameters
----------
MaxAng: float

Return
-------
NbPoles: int
NbKnots: int
Degree: int
TypeConv: Convert_ParameterisationType

Description
-----------
No available documentation.
") GetShape;
		static void GetShape(const Standard_Real MaxAng, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Convert_ParameterisationType &OutValue);

		/****** GeomFill::GetTolerance ******/
		/****** md5 signature: 41a668da380cd0191814e6697f67950d ******/
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "
Parameters
----------
TConv: Convert_ParameterisationType
AngleMin: float
Radius: float
AngularTol: float
SpatialTol: float

Return
-------
float

Description
-----------
Used by the generical classes to determine Tolerance for approximation.
") GetTolerance;
		static Standard_Real GetTolerance(const Convert_ParameterisationType TConv, const Standard_Real AngleMin, const Standard_Real Radius, const Standard_Real AngularTol, const Standard_Real SpatialTol);

		/****** GeomFill::Knots ******/
		/****** md5 signature: 8c24952ff029ceb3b99a201b830b6212 ******/
		%feature("compactdefaultargs") Knots;
		%feature("autodoc", "
Parameters
----------
TypeConv: Convert_ParameterisationType
TKnots: TColStd_Array1OfReal

Return
-------
None

Description
-----------
No available documentation.
") Knots;
		static void Knots(const Convert_ParameterisationType TypeConv, TColStd_Array1OfReal & TKnots);

		/****** GeomFill::Mults ******/
		/****** md5 signature: 264559ae34cbb529bcff7630a6f546c3 ******/
		%feature("compactdefaultargs") Mults;
		%feature("autodoc", "
Parameters
----------
TypeConv: Convert_ParameterisationType
TMults: TColStd_Array1OfInteger

Return
-------
None

Description
-----------
No available documentation.
") Mults;
		static void Mults(const Convert_ParameterisationType TypeConv, TColStd_Array1OfInteger & TMults);

		/****** GeomFill::Surface ******/
		/****** md5 signature: 9ce66d74545adeac22c48a48241309ed ******/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "
Parameters
----------
Curve1: Geom_Curve
Curve2: Geom_Curve

Return
-------
opencascade::handle<Geom_Surface>

Description
-----------
Builds a ruled surface between the two curves, Curve1 and Curve2.
") Surface;
		static opencascade::handle<Geom_Surface> Surface(const opencascade::handle<Geom_Curve> & Curve1, const opencascade::handle<Geom_Curve> & Curve2);

};


%extend GeomFill {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class GeomFill_AppSurf *
*************************/
class GeomFill_AppSurf : public AppBlend_Approx {
	public:
		/****** GeomFill_AppSurf::GeomFill_AppSurf ******/
		/****** md5 signature: 1c7dbddb83a07cfe5e8bef48ba5dabe0 ******/
		%feature("compactdefaultargs") GeomFill_AppSurf;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") GeomFill_AppSurf;
		 GeomFill_AppSurf();

		/****** GeomFill_AppSurf::GeomFill_AppSurf ******/
		/****** md5 signature: 3bd483f9e3eb4e01e4564c16be2b3791 ******/
		%feature("compactdefaultargs") GeomFill_AppSurf;
		%feature("autodoc", "
Parameters
----------
Degmin: int
Degmax: int
Tol3d: float
Tol2d: float
NbIt: int
KnownParameters: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
No available documentation.
") GeomFill_AppSurf;
		 GeomFill_AppSurf(const Standard_Integer Degmin, const Standard_Integer Degmax, const Standard_Real Tol3d, const Standard_Real Tol2d, const Standard_Integer NbIt, const Standard_Boolean KnownParameters = Standard_False);

		/****** GeomFill_AppSurf::Continuity ******/
		/****** md5 signature: 4cc571878c66d538aeaf8b0affec3574 ******/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "Return
-------
GeomAbs_Shape

Description
-----------
returns the Continuity used in the approximation.
") Continuity;
		GeomAbs_Shape Continuity();

		/****** GeomFill_AppSurf::CriteriumWeight ******/
		/****** md5 signature: 4b68323f3c03d233f69e27404a58a42c ******/
		%feature("compactdefaultargs") CriteriumWeight;
		%feature("autodoc", "
Parameters
----------

Return
-------
W1: float
W2: float
W3: float

Description
-----------
returns the Weights (as percent) associed to the criterium used in the optimization.
") CriteriumWeight;
		void CriteriumWeight(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** GeomFill_AppSurf::Curve2d ******/
		/****** md5 signature: 45f5fb41b7daba7a20d1fb56ead05f0f ******/
		%feature("compactdefaultargs") Curve2d;
		%feature("autodoc", "
Parameters
----------
Index: int
TPoles: TColgp_Array1OfPnt2d
TKnots: TColStd_Array1OfReal
TMults: TColStd_Array1OfInteger

Return
-------
None

Description
-----------
No available documentation.
") Curve2d;
		void Curve2d(const Standard_Integer Index, TColgp_Array1OfPnt2d & TPoles, TColStd_Array1OfReal & TKnots, TColStd_Array1OfInteger & TMults);

		/****** GeomFill_AppSurf::Curve2dPoles ******/
		/****** md5 signature: 8df321abd16a4651f96229eab1c5f048 ******/
		%feature("compactdefaultargs") Curve2dPoles;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
TColgp_Array1OfPnt2d

Description
-----------
No available documentation.
") Curve2dPoles;
		const TColgp_Array1OfPnt2d & Curve2dPoles(const Standard_Integer Index);

		/****** GeomFill_AppSurf::Curves2dDegree ******/
		/****** md5 signature: 85ba31033da623d05ad75c9b051842b3 ******/
		%feature("compactdefaultargs") Curves2dDegree;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Curves2dDegree;
		Standard_Integer Curves2dDegree();

		/****** GeomFill_AppSurf::Curves2dKnots ******/
		/****** md5 signature: cd12725d88c425f3fe1ebccf9467256f ******/
		%feature("compactdefaultargs") Curves2dKnots;
		%feature("autodoc", "Return
-------
TColStd_Array1OfReal

Description
-----------
No available documentation.
") Curves2dKnots;
		const TColStd_Array1OfReal & Curves2dKnots();

		/****** GeomFill_AppSurf::Curves2dMults ******/
		/****** md5 signature: d4f1ca5a39a589bb289460010c5bbf39 ******/
		%feature("compactdefaultargs") Curves2dMults;
		%feature("autodoc", "Return
-------
TColStd_Array1OfInteger

Description
-----------
No available documentation.
") Curves2dMults;
		const TColStd_Array1OfInteger & Curves2dMults();

		/****** GeomFill_AppSurf::Curves2dShape ******/
		/****** md5 signature: 28bf2faa4b8e811f12223cb99d1721ea ******/
		%feature("compactdefaultargs") Curves2dShape;
		%feature("autodoc", "
Parameters
----------

Return
-------
Degree: int
NbPoles: int
NbKnots: int

Description
-----------
No available documentation.
") Curves2dShape;
		void Curves2dShape(Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****** GeomFill_AppSurf::Init ******/
		/****** md5 signature: 44a81349dbd1c40eccbaf3f763903054 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
Degmin: int
Degmax: int
Tol3d: float
Tol2d: float
NbIt: int
KnownParameters: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const Standard_Integer Degmin, const Standard_Integer Degmax, const Standard_Real Tol3d, const Standard_Real Tol2d, const Standard_Integer NbIt, const Standard_Boolean KnownParameters = Standard_False);

		/****** GeomFill_AppSurf::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsDone;
		Standard_Boolean IsDone();

		/****** GeomFill_AppSurf::NbCurves2d ******/
		/****** md5 signature: 91ae967daa54efe7d38afad4a5698e5b ******/
		%feature("compactdefaultargs") NbCurves2d;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbCurves2d;
		Standard_Integer NbCurves2d();

		/****** GeomFill_AppSurf::ParType ******/
		/****** md5 signature: 97fa11d31bc8075ba4a84bf8b926a855 ******/
		%feature("compactdefaultargs") ParType;
		%feature("autodoc", "Return
-------
Approx_ParametrizationType

Description
-----------
returns the type of parametrization used in the approximation.
") ParType;
		Approx_ParametrizationType ParType();

		/****** GeomFill_AppSurf::Perform ******/
		/****** md5 signature: e8e4da371dbd87da036a62de5595f08b ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Lin: GeomFill_Line
SecGen: GeomFill_SectionGenerator
SpApprox: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const opencascade::handle<GeomFill_Line> & Lin, GeomFill_SectionGenerator & SecGen, const Standard_Boolean SpApprox = Standard_False);

		/****** GeomFill_AppSurf::Perform ******/
		/****** md5 signature: 2eb325a3136863679e94e12dd2910a46 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Lin: GeomFill_Line
SecGen: GeomFill_SectionGenerator
NbMaxP: int

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const opencascade::handle<GeomFill_Line> & Lin, GeomFill_SectionGenerator & SecGen, const Standard_Integer NbMaxP);

		/****** GeomFill_AppSurf::PerformSmoothing ******/
		/****** md5 signature: e46fca96d8fba2154acfef98f49f263e ******/
		%feature("compactdefaultargs") PerformSmoothing;
		%feature("autodoc", "
Parameters
----------
Lin: GeomFill_Line
SecGen: GeomFill_SectionGenerator

Return
-------
None

Description
-----------
No available documentation.
") PerformSmoothing;
		void PerformSmoothing(const opencascade::handle<GeomFill_Line> & Lin, GeomFill_SectionGenerator & SecGen);

		/****** GeomFill_AppSurf::SetContinuity ******/
		/****** md5 signature: 41a91b0ea6e9b248a1b48c05882f4281 ******/
		%feature("compactdefaultargs") SetContinuity;
		%feature("autodoc", "
Parameters
----------
C: GeomAbs_Shape

Return
-------
None

Description
-----------
Define the Continuity used in the approximation.
") SetContinuity;
		void SetContinuity(const GeomAbs_Shape C);

		/****** GeomFill_AppSurf::SetCriteriumWeight ******/
		/****** md5 signature: f8c7045bd0e7f781a0984d023e8b1268 ******/
		%feature("compactdefaultargs") SetCriteriumWeight;
		%feature("autodoc", "
Parameters
----------
W1: float
W2: float
W3: float

Return
-------
None

Description
-----------
define the Weights associed to the criterium used in the optimization. //! if Wi <= 0.
") SetCriteriumWeight;
		void SetCriteriumWeight(const Standard_Real W1, const Standard_Real W2, const Standard_Real W3);

		/****** GeomFill_AppSurf::SetParType ******/
		/****** md5 signature: ff343d7833ad3cc796439eb5cefa88ba ******/
		%feature("compactdefaultargs") SetParType;
		%feature("autodoc", "
Parameters
----------
ParType: Approx_ParametrizationType

Return
-------
None

Description
-----------
Define the type of parametrization used in the approximation.
") SetParType;
		void SetParType(const Approx_ParametrizationType ParType);

		/****** GeomFill_AppSurf::SurfPoles ******/
		/****** md5 signature: 33be5d08621b237fcd73b5b9accd2338 ******/
		%feature("compactdefaultargs") SurfPoles;
		%feature("autodoc", "Return
-------
TColgp_Array2OfPnt

Description
-----------
No available documentation.
") SurfPoles;
		const TColgp_Array2OfPnt & SurfPoles();

		/****** GeomFill_AppSurf::SurfShape ******/
		/****** md5 signature: 6dbc9c018a92aabb9f9d1988ac20cb43 ******/
		%feature("compactdefaultargs") SurfShape;
		%feature("autodoc", "
Parameters
----------

Return
-------
UDegree: int
VDegree: int
NbUPoles: int
NbVPoles: int
NbUKnots: int
NbVKnots: int

Description
-----------
No available documentation.
") SurfShape;
		void SurfShape(Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****** GeomFill_AppSurf::SurfUKnots ******/
		/****** md5 signature: 30cf4dd9deaf04a1c77052e14ae7392b ******/
		%feature("compactdefaultargs") SurfUKnots;
		%feature("autodoc", "Return
-------
TColStd_Array1OfReal

Description
-----------
No available documentation.
") SurfUKnots;
		const TColStd_Array1OfReal & SurfUKnots();

		/****** GeomFill_AppSurf::SurfUMults ******/
		/****** md5 signature: ef046447df8e4b2931da90e1475e731f ******/
		%feature("compactdefaultargs") SurfUMults;
		%feature("autodoc", "Return
-------
TColStd_Array1OfInteger

Description
-----------
No available documentation.
") SurfUMults;
		const TColStd_Array1OfInteger & SurfUMults();

		/****** GeomFill_AppSurf::SurfVKnots ******/
		/****** md5 signature: 52c9dafc43c5e3713c77d7aa4381da5c ******/
		%feature("compactdefaultargs") SurfVKnots;
		%feature("autodoc", "Return
-------
TColStd_Array1OfReal

Description
-----------
No available documentation.
") SurfVKnots;
		const TColStd_Array1OfReal & SurfVKnots();

		/****** GeomFill_AppSurf::SurfVMults ******/
		/****** md5 signature: 589e6536c77c512e7a37f99faf0fa21c ******/
		%feature("compactdefaultargs") SurfVMults;
		%feature("autodoc", "Return
-------
TColStd_Array1OfInteger

Description
-----------
No available documentation.
") SurfVMults;
		const TColStd_Array1OfInteger & SurfVMults();

		/****** GeomFill_AppSurf::SurfWeights ******/
		/****** md5 signature: 894d2a3f2c33f7d641aef9c7f9e3fa57 ******/
		%feature("compactdefaultargs") SurfWeights;
		%feature("autodoc", "Return
-------
TColStd_Array2OfReal

Description
-----------
No available documentation.
") SurfWeights;
		const TColStd_Array2OfReal & SurfWeights();

		/****** GeomFill_AppSurf::Surface ******/
		/****** md5 signature: 49bb9dd6da49966f0010e14dd0ffef04 ******/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "
Parameters
----------
TPoles: TColgp_Array2OfPnt
TWeights: TColStd_Array2OfReal
TUKnots: TColStd_Array1OfReal
TVKnots: TColStd_Array1OfReal
TUMults: TColStd_Array1OfInteger
TVMults: TColStd_Array1OfInteger

Return
-------
None

Description
-----------
No available documentation.
") Surface;
		void Surface(TColgp_Array2OfPnt & TPoles, TColStd_Array2OfReal & TWeights, TColStd_Array1OfReal & TUKnots, TColStd_Array1OfReal & TVKnots, TColStd_Array1OfInteger & TUMults, TColStd_Array1OfInteger & TVMults);

		/****** GeomFill_AppSurf::TolCurveOnSurf ******/
		/****** md5 signature: f21f0f877b35cf67581fa59260f72857 ******/
		%feature("compactdefaultargs") TolCurveOnSurf;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
float

Description
-----------
No available documentation.
") TolCurveOnSurf;
		Standard_Real TolCurveOnSurf(const Standard_Integer Index);

		/****** GeomFill_AppSurf::TolReached ******/
		/****** md5 signature: c8d3e7f26c4ee8a50f4eca5274d79e63 ******/
		%feature("compactdefaultargs") TolReached;
		%feature("autodoc", "
Parameters
----------

Return
-------
Tol3d: float
Tol2d: float

Description
-----------
No available documentation.
") TolReached;
		void TolReached(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** GeomFill_AppSurf::UDegree ******/
		/****** md5 signature: f204e5fbf1c49e3d9e4889dfead5a190 ******/
		%feature("compactdefaultargs") UDegree;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") UDegree;
		Standard_Integer UDegree();

		/****** GeomFill_AppSurf::VDegree ******/
		/****** md5 signature: 4901bdb3b29a5c2410ca93d6a7816f06 ******/
		%feature("compactdefaultargs") VDegree;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") VDegree;
		Standard_Integer VDegree();

};


%extend GeomFill_AppSurf {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class GeomFill_AppSweep *
**************************/
class GeomFill_AppSweep : public AppBlend_Approx {
	public:
		/****** GeomFill_AppSweep::GeomFill_AppSweep ******/
		/****** md5 signature: 9e735b03a8b92d1b4b7f9849156ea8dc ******/
		%feature("compactdefaultargs") GeomFill_AppSweep;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") GeomFill_AppSweep;
		 GeomFill_AppSweep();

		/****** GeomFill_AppSweep::GeomFill_AppSweep ******/
		/****** md5 signature: 1077fe95aa476880e0b3f86c33c517cd ******/
		%feature("compactdefaultargs") GeomFill_AppSweep;
		%feature("autodoc", "
Parameters
----------
Degmin: int
Degmax: int
Tol3d: float
Tol2d: float
NbIt: int
KnownParameters: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
No available documentation.
") GeomFill_AppSweep;
		 GeomFill_AppSweep(const Standard_Integer Degmin, const Standard_Integer Degmax, const Standard_Real Tol3d, const Standard_Real Tol2d, const Standard_Integer NbIt, const Standard_Boolean KnownParameters = Standard_False);

		/****** GeomFill_AppSweep::Continuity ******/
		/****** md5 signature: 4cc571878c66d538aeaf8b0affec3574 ******/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "Return
-------
GeomAbs_Shape

Description
-----------
returns the Continuity used in the approximation.
") Continuity;
		GeomAbs_Shape Continuity();

		/****** GeomFill_AppSweep::CriteriumWeight ******/
		/****** md5 signature: 4b68323f3c03d233f69e27404a58a42c ******/
		%feature("compactdefaultargs") CriteriumWeight;
		%feature("autodoc", "
Parameters
----------

Return
-------
W1: float
W2: float
W3: float

Description
-----------
returns the Weights (as percent) associed to the criterium used in the optimization.
") CriteriumWeight;
		void CriteriumWeight(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** GeomFill_AppSweep::Curve2d ******/
		/****** md5 signature: 45f5fb41b7daba7a20d1fb56ead05f0f ******/
		%feature("compactdefaultargs") Curve2d;
		%feature("autodoc", "
Parameters
----------
Index: int
TPoles: TColgp_Array1OfPnt2d
TKnots: TColStd_Array1OfReal
TMults: TColStd_Array1OfInteger

Return
-------
None

Description
-----------
No available documentation.
") Curve2d;
		void Curve2d(const Standard_Integer Index, TColgp_Array1OfPnt2d & TPoles, TColStd_Array1OfReal & TKnots, TColStd_Array1OfInteger & TMults);

		/****** GeomFill_AppSweep::Curve2dPoles ******/
		/****** md5 signature: 8df321abd16a4651f96229eab1c5f048 ******/
		%feature("compactdefaultargs") Curve2dPoles;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
TColgp_Array1OfPnt2d

Description
-----------
No available documentation.
") Curve2dPoles;
		const TColgp_Array1OfPnt2d & Curve2dPoles(const Standard_Integer Index);

		/****** GeomFill_AppSweep::Curves2dDegree ******/
		/****** md5 signature: 85ba31033da623d05ad75c9b051842b3 ******/
		%feature("compactdefaultargs") Curves2dDegree;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Curves2dDegree;
		Standard_Integer Curves2dDegree();

		/****** GeomFill_AppSweep::Curves2dKnots ******/
		/****** md5 signature: cd12725d88c425f3fe1ebccf9467256f ******/
		%feature("compactdefaultargs") Curves2dKnots;
		%feature("autodoc", "Return
-------
TColStd_Array1OfReal

Description
-----------
No available documentation.
") Curves2dKnots;
		const TColStd_Array1OfReal & Curves2dKnots();

		/****** GeomFill_AppSweep::Curves2dMults ******/
		/****** md5 signature: d4f1ca5a39a589bb289460010c5bbf39 ******/
		%feature("compactdefaultargs") Curves2dMults;
		%feature("autodoc", "Return
-------
TColStd_Array1OfInteger

Description
-----------
No available documentation.
") Curves2dMults;
		const TColStd_Array1OfInteger & Curves2dMults();

		/****** GeomFill_AppSweep::Curves2dShape ******/
		/****** md5 signature: 28bf2faa4b8e811f12223cb99d1721ea ******/
		%feature("compactdefaultargs") Curves2dShape;
		%feature("autodoc", "
Parameters
----------

Return
-------
Degree: int
NbPoles: int
NbKnots: int

Description
-----------
No available documentation.
") Curves2dShape;
		void Curves2dShape(Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****** GeomFill_AppSweep::Init ******/
		/****** md5 signature: 44a81349dbd1c40eccbaf3f763903054 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
Degmin: int
Degmax: int
Tol3d: float
Tol2d: float
NbIt: int
KnownParameters: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const Standard_Integer Degmin, const Standard_Integer Degmax, const Standard_Real Tol3d, const Standard_Real Tol2d, const Standard_Integer NbIt, const Standard_Boolean KnownParameters = Standard_False);

		/****** GeomFill_AppSweep::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsDone;
		Standard_Boolean IsDone();

		/****** GeomFill_AppSweep::NbCurves2d ******/
		/****** md5 signature: 91ae967daa54efe7d38afad4a5698e5b ******/
		%feature("compactdefaultargs") NbCurves2d;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbCurves2d;
		Standard_Integer NbCurves2d();

		/****** GeomFill_AppSweep::ParType ******/
		/****** md5 signature: 97fa11d31bc8075ba4a84bf8b926a855 ******/
		%feature("compactdefaultargs") ParType;
		%feature("autodoc", "Return
-------
Approx_ParametrizationType

Description
-----------
returns the type of parametrization used in the approximation.
") ParType;
		Approx_ParametrizationType ParType();

		/****** GeomFill_AppSweep::Perform ******/
		/****** md5 signature: 5729175890fe0309e2865ec4bb63bd8f ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Lin: GeomFill_Line
SecGen: GeomFill_SweepSectionGenerator
SpApprox: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const opencascade::handle<GeomFill_Line> & Lin, GeomFill_SweepSectionGenerator & SecGen, const Standard_Boolean SpApprox = Standard_False);

		/****** GeomFill_AppSweep::Perform ******/
		/****** md5 signature: 57bd689c19c25917c19e2b9cd362cce3 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Lin: GeomFill_Line
SecGen: GeomFill_SweepSectionGenerator
NbMaxP: int

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const opencascade::handle<GeomFill_Line> & Lin, GeomFill_SweepSectionGenerator & SecGen, const Standard_Integer NbMaxP);

		/****** GeomFill_AppSweep::PerformSmoothing ******/
		/****** md5 signature: 405eff04997dd8c0d95c5553e2f99624 ******/
		%feature("compactdefaultargs") PerformSmoothing;
		%feature("autodoc", "
Parameters
----------
Lin: GeomFill_Line
SecGen: GeomFill_SweepSectionGenerator

Return
-------
None

Description
-----------
No available documentation.
") PerformSmoothing;
		void PerformSmoothing(const opencascade::handle<GeomFill_Line> & Lin, GeomFill_SweepSectionGenerator & SecGen);

		/****** GeomFill_AppSweep::SetContinuity ******/
		/****** md5 signature: 41a91b0ea6e9b248a1b48c05882f4281 ******/
		%feature("compactdefaultargs") SetContinuity;
		%feature("autodoc", "
Parameters
----------
C: GeomAbs_Shape

Return
-------
None

Description
-----------
Define the Continuity used in the approximation.
") SetContinuity;
		void SetContinuity(const GeomAbs_Shape C);

		/****** GeomFill_AppSweep::SetCriteriumWeight ******/
		/****** md5 signature: f8c7045bd0e7f781a0984d023e8b1268 ******/
		%feature("compactdefaultargs") SetCriteriumWeight;
		%feature("autodoc", "
Parameters
----------
W1: float
W2: float
W3: float

Return
-------
None

Description
-----------
define the Weights associed to the criterium used in the optimization. //! if Wi <= 0.
") SetCriteriumWeight;
		void SetCriteriumWeight(const Standard_Real W1, const Standard_Real W2, const Standard_Real W3);

		/****** GeomFill_AppSweep::SetParType ******/
		/****** md5 signature: ff343d7833ad3cc796439eb5cefa88ba ******/
		%feature("compactdefaultargs") SetParType;
		%feature("autodoc", "
Parameters
----------
ParType: Approx_ParametrizationType

Return
-------
None

Description
-----------
Define the type of parametrization used in the approximation.
") SetParType;
		void SetParType(const Approx_ParametrizationType ParType);

		/****** GeomFill_AppSweep::SurfPoles ******/
		/****** md5 signature: 33be5d08621b237fcd73b5b9accd2338 ******/
		%feature("compactdefaultargs") SurfPoles;
		%feature("autodoc", "Return
-------
TColgp_Array2OfPnt

Description
-----------
No available documentation.
") SurfPoles;
		const TColgp_Array2OfPnt & SurfPoles();

		/****** GeomFill_AppSweep::SurfShape ******/
		/****** md5 signature: 6dbc9c018a92aabb9f9d1988ac20cb43 ******/
		%feature("compactdefaultargs") SurfShape;
		%feature("autodoc", "
Parameters
----------

Return
-------
UDegree: int
VDegree: int
NbUPoles: int
NbVPoles: int
NbUKnots: int
NbVKnots: int

Description
-----------
No available documentation.
") SurfShape;
		void SurfShape(Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****** GeomFill_AppSweep::SurfUKnots ******/
		/****** md5 signature: 30cf4dd9deaf04a1c77052e14ae7392b ******/
		%feature("compactdefaultargs") SurfUKnots;
		%feature("autodoc", "Return
-------
TColStd_Array1OfReal

Description
-----------
No available documentation.
") SurfUKnots;
		const TColStd_Array1OfReal & SurfUKnots();

		/****** GeomFill_AppSweep::SurfUMults ******/
		/****** md5 signature: ef046447df8e4b2931da90e1475e731f ******/
		%feature("compactdefaultargs") SurfUMults;
		%feature("autodoc", "Return
-------
TColStd_Array1OfInteger

Description
-----------
No available documentation.
") SurfUMults;
		const TColStd_Array1OfInteger & SurfUMults();

		/****** GeomFill_AppSweep::SurfVKnots ******/
		/****** md5 signature: 52c9dafc43c5e3713c77d7aa4381da5c ******/
		%feature("compactdefaultargs") SurfVKnots;
		%feature("autodoc", "Return
-------
TColStd_Array1OfReal

Description
-----------
No available documentation.
") SurfVKnots;
		const TColStd_Array1OfReal & SurfVKnots();

		/****** GeomFill_AppSweep::SurfVMults ******/
		/****** md5 signature: 589e6536c77c512e7a37f99faf0fa21c ******/
		%feature("compactdefaultargs") SurfVMults;
		%feature("autodoc", "Return
-------
TColStd_Array1OfInteger

Description
-----------
No available documentation.
") SurfVMults;
		const TColStd_Array1OfInteger & SurfVMults();

		/****** GeomFill_AppSweep::SurfWeights ******/
		/****** md5 signature: 894d2a3f2c33f7d641aef9c7f9e3fa57 ******/
		%feature("compactdefaultargs") SurfWeights;
		%feature("autodoc", "Return
-------
TColStd_Array2OfReal

Description
-----------
No available documentation.
") SurfWeights;
		const TColStd_Array2OfReal & SurfWeights();

		/****** GeomFill_AppSweep::Surface ******/
		/****** md5 signature: 49bb9dd6da49966f0010e14dd0ffef04 ******/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "
Parameters
----------
TPoles: TColgp_Array2OfPnt
TWeights: TColStd_Array2OfReal
TUKnots: TColStd_Array1OfReal
TVKnots: TColStd_Array1OfReal
TUMults: TColStd_Array1OfInteger
TVMults: TColStd_Array1OfInteger

Return
-------
None

Description
-----------
No available documentation.
") Surface;
		void Surface(TColgp_Array2OfPnt & TPoles, TColStd_Array2OfReal & TWeights, TColStd_Array1OfReal & TUKnots, TColStd_Array1OfReal & TVKnots, TColStd_Array1OfInteger & TUMults, TColStd_Array1OfInteger & TVMults);

		/****** GeomFill_AppSweep::TolCurveOnSurf ******/
		/****** md5 signature: f21f0f877b35cf67581fa59260f72857 ******/
		%feature("compactdefaultargs") TolCurveOnSurf;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
float

Description
-----------
No available documentation.
") TolCurveOnSurf;
		Standard_Real TolCurveOnSurf(const Standard_Integer Index);

		/****** GeomFill_AppSweep::TolReached ******/
		/****** md5 signature: c8d3e7f26c4ee8a50f4eca5274d79e63 ******/
		%feature("compactdefaultargs") TolReached;
		%feature("autodoc", "
Parameters
----------

Return
-------
Tol3d: float
Tol2d: float

Description
-----------
No available documentation.
") TolReached;
		void TolReached(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** GeomFill_AppSweep::UDegree ******/
		/****** md5 signature: f204e5fbf1c49e3d9e4889dfead5a190 ******/
		%feature("compactdefaultargs") UDegree;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") UDegree;
		Standard_Integer UDegree();

		/****** GeomFill_AppSweep::VDegree ******/
		/****** md5 signature: 4901bdb3b29a5c2410ca93d6a7816f06 ******/
		%feature("compactdefaultargs") VDegree;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") VDegree;
		Standard_Integer VDegree();

};


%extend GeomFill_AppSweep {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class GeomFill_BSplineCurves *
*******************************/
class GeomFill_BSplineCurves {
	public:
		/****** GeomFill_BSplineCurves::GeomFill_BSplineCurves ******/
		/****** md5 signature: 87e0aef52475a1573c465fec5d82d48d ******/
		%feature("compactdefaultargs") GeomFill_BSplineCurves;
		%feature("autodoc", "Return
-------
None

Description
-----------
Constructs a default BSpline surface framework.
") GeomFill_BSplineCurves;
		 GeomFill_BSplineCurves();

		/****** GeomFill_BSplineCurves::GeomFill_BSplineCurves ******/
		/****** md5 signature: e2d7231f750710ead9d50ecb66ca1979 ******/
		%feature("compactdefaultargs") GeomFill_BSplineCurves;
		%feature("autodoc", "
Parameters
----------
C1: Geom_BSplineCurve
C2: Geom_BSplineCurve
C3: Geom_BSplineCurve
C4: Geom_BSplineCurve
Type: GeomFill_FillingStyle

Return
-------
None

Description
-----------
No available documentation.
") GeomFill_BSplineCurves;
		 GeomFill_BSplineCurves(const opencascade::handle<Geom_BSplineCurve> & C1, const opencascade::handle<Geom_BSplineCurve> & C2, const opencascade::handle<Geom_BSplineCurve> & C3, const opencascade::handle<Geom_BSplineCurve> & C4, const GeomFill_FillingStyle Type);

		/****** GeomFill_BSplineCurves::GeomFill_BSplineCurves ******/
		/****** md5 signature: acb50b52f59852f0aa0519551cc6a635 ******/
		%feature("compactdefaultargs") GeomFill_BSplineCurves;
		%feature("autodoc", "
Parameters
----------
C1: Geom_BSplineCurve
C2: Geom_BSplineCurve
C3: Geom_BSplineCurve
Type: GeomFill_FillingStyle

Return
-------
None

Description
-----------
No available documentation.
") GeomFill_BSplineCurves;
		 GeomFill_BSplineCurves(const opencascade::handle<Geom_BSplineCurve> & C1, const opencascade::handle<Geom_BSplineCurve> & C2, const opencascade::handle<Geom_BSplineCurve> & C3, const GeomFill_FillingStyle Type);

		/****** GeomFill_BSplineCurves::GeomFill_BSplineCurves ******/
		/****** md5 signature: 128f91ad74ed4756ca15ba7ce405c9c7 ******/
		%feature("compactdefaultargs") GeomFill_BSplineCurves;
		%feature("autodoc", "
Parameters
----------
C1: Geom_BSplineCurve
C2: Geom_BSplineCurve
Type: GeomFill_FillingStyle

Return
-------
None

Description
-----------
Constructs a framework for building a BSpline surface from either - the four contiguous BSpline curves, C1, C2, C3 and C4, or - the three contiguous BSpline curves, C1, C2 and C3, or - the two contiguous BSpline curves, C1 and C2. The type of filling style Type to be used is one of: - GeomFill_Stretch - the style with the flattest patch - GeomFill_Coons - a rounded style of patch with less depth than that of Curved - GeomFill_Curved - the style with the most rounded patch.Constructs a framework for building a BSpline surface common to the two BSpline curves, C1 and C2. Exceptions Standard_ConstructionError if the curves are not contiguous.
") GeomFill_BSplineCurves;
		 GeomFill_BSplineCurves(const opencascade::handle<Geom_BSplineCurve> & C1, const opencascade::handle<Geom_BSplineCurve> & C2, const GeomFill_FillingStyle Type);

		/****** GeomFill_BSplineCurves::Init ******/
		/****** md5 signature: 39be09b652d63f92221b6a9f668da556 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
C1: Geom_BSplineCurve
C2: Geom_BSplineCurve
C3: Geom_BSplineCurve
C4: Geom_BSplineCurve
Type: GeomFill_FillingStyle

Return
-------
None

Description
-----------
if the curves cannot be joined.
") Init;
		void Init(const opencascade::handle<Geom_BSplineCurve> & C1, const opencascade::handle<Geom_BSplineCurve> & C2, const opencascade::handle<Geom_BSplineCurve> & C3, const opencascade::handle<Geom_BSplineCurve> & C4, const GeomFill_FillingStyle Type);

		/****** GeomFill_BSplineCurves::Init ******/
		/****** md5 signature: 8c1e4ea27db140918013a210804afd7a ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
C1: Geom_BSplineCurve
C2: Geom_BSplineCurve
C3: Geom_BSplineCurve
Type: GeomFill_FillingStyle

Return
-------
None

Description
-----------
if the curves cannot be joined.
") Init;
		void Init(const opencascade::handle<Geom_BSplineCurve> & C1, const opencascade::handle<Geom_BSplineCurve> & C2, const opencascade::handle<Geom_BSplineCurve> & C3, const GeomFill_FillingStyle Type);

		/****** GeomFill_BSplineCurves::Init ******/
		/****** md5 signature: a60013b896a33bdae0dfab458ab2dd4c ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
C1: Geom_BSplineCurve
C2: Geom_BSplineCurve
Type: GeomFill_FillingStyle

Return
-------
None

Description
-----------
Initializes or reinitializes this algorithm with two, three, or four curves - C1, C2, C3, and C4 - and Type, one of the following filling styles: - GeomFill_Stretch - the style with the flattest patch - GeomFill_Coons - a rounded style of patch with less depth than that of Curved - GeomFill_Curved - the style with the most rounded patch. Exceptions Standard_ConstructionError if the curves are not contiguous.
") Init;
		void Init(const opencascade::handle<Geom_BSplineCurve> & C1, const opencascade::handle<Geom_BSplineCurve> & C2, const GeomFill_FillingStyle Type);

		/****** GeomFill_BSplineCurves::Surface ******/
		/****** md5 signature: 671a5de971e9a6baf08b4e111daa768f ******/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_BSplineSurface>

Description
-----------
Returns the BSpline surface Surface resulting from the computation performed by this algorithm.
") Surface;
		const opencascade::handle<Geom_BSplineSurface> & Surface();

};


%extend GeomFill_BSplineCurves {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class GeomFill_BezierCurves *
******************************/
class GeomFill_BezierCurves {
	public:
		/****** GeomFill_BezierCurves::GeomFill_BezierCurves ******/
		/****** md5 signature: bfa320d41e7cefe14ec555f53005095c ******/
		%feature("compactdefaultargs") GeomFill_BezierCurves;
		%feature("autodoc", "Return
-------
None

Description
-----------
Constructs an empty framework for building a Bezier surface from contiguous Bezier curves. You use the Init function to define the boundaries of the surface.
") GeomFill_BezierCurves;
		 GeomFill_BezierCurves();

		/****** GeomFill_BezierCurves::GeomFill_BezierCurves ******/
		/****** md5 signature: 66f314aaa192119199c8fed852c1b6d5 ******/
		%feature("compactdefaultargs") GeomFill_BezierCurves;
		%feature("autodoc", "
Parameters
----------
C1: Geom_BezierCurve
C2: Geom_BezierCurve
C3: Geom_BezierCurve
C4: Geom_BezierCurve
Type: GeomFill_FillingStyle

Return
-------
None

Description
-----------
Constructs a framework for building a Bezier surface from the four contiguous Bezier curves, C1, C2, C3 and C4 Raises Standard_ConstructionError if the curves are not contiguous.
") GeomFill_BezierCurves;
		 GeomFill_BezierCurves(const opencascade::handle<Geom_BezierCurve> & C1, const opencascade::handle<Geom_BezierCurve> & C2, const opencascade::handle<Geom_BezierCurve> & C3, const opencascade::handle<Geom_BezierCurve> & C4, const GeomFill_FillingStyle Type);

		/****** GeomFill_BezierCurves::GeomFill_BezierCurves ******/
		/****** md5 signature: 097f529258a45247cc5acab7298ebfa1 ******/
		%feature("compactdefaultargs") GeomFill_BezierCurves;
		%feature("autodoc", "
Parameters
----------
C1: Geom_BezierCurve
C2: Geom_BezierCurve
C3: Geom_BezierCurve
Type: GeomFill_FillingStyle

Return
-------
None

Description
-----------
Constructs a framework for building a Bezier surface from the three contiguous Bezier curves, C1, C2 and C3 Raises Standard_ConstructionError if the curves are not contiguous.
") GeomFill_BezierCurves;
		 GeomFill_BezierCurves(const opencascade::handle<Geom_BezierCurve> & C1, const opencascade::handle<Geom_BezierCurve> & C2, const opencascade::handle<Geom_BezierCurve> & C3, const GeomFill_FillingStyle Type);

		/****** GeomFill_BezierCurves::GeomFill_BezierCurves ******/
		/****** md5 signature: 510d7795e7257dc3b826a3c0344d89f7 ******/
		%feature("compactdefaultargs") GeomFill_BezierCurves;
		%feature("autodoc", "
Parameters
----------
C1: Geom_BezierCurve
C2: Geom_BezierCurve
Type: GeomFill_FillingStyle

Return
-------
None

Description
-----------
Constructs a framework for building a Bezier surface from the two contiguous Bezier curves, C1 and C2 Raises Standard_ConstructionError if the curves are not contiguous.
") GeomFill_BezierCurves;
		 GeomFill_BezierCurves(const opencascade::handle<Geom_BezierCurve> & C1, const opencascade::handle<Geom_BezierCurve> & C2, const GeomFill_FillingStyle Type);

		/****** GeomFill_BezierCurves::Init ******/
		/****** md5 signature: 6f1126ff718aaa99f991335b7e5e5379 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
C1: Geom_BezierCurve
C2: Geom_BezierCurve
C3: Geom_BezierCurve
C4: Geom_BezierCurve
Type: GeomFill_FillingStyle

Return
-------
None

Description
-----------
if the curves cannot be joined.
") Init;
		void Init(const opencascade::handle<Geom_BezierCurve> & C1, const opencascade::handle<Geom_BezierCurve> & C2, const opencascade::handle<Geom_BezierCurve> & C3, const opencascade::handle<Geom_BezierCurve> & C4, const GeomFill_FillingStyle Type);

		/****** GeomFill_BezierCurves::Init ******/
		/****** md5 signature: 7df84fc2f0be865f8a23e1f7b445f402 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
C1: Geom_BezierCurve
C2: Geom_BezierCurve
C3: Geom_BezierCurve
Type: GeomFill_FillingStyle

Return
-------
None

Description
-----------
if the curves cannot be joined.
") Init;
		void Init(const opencascade::handle<Geom_BezierCurve> & C1, const opencascade::handle<Geom_BezierCurve> & C2, const opencascade::handle<Geom_BezierCurve> & C3, const GeomFill_FillingStyle Type);

		/****** GeomFill_BezierCurves::Init ******/
		/****** md5 signature: bcf8670cf0bcde11da542b274e3f7ff9 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
C1: Geom_BezierCurve
C2: Geom_BezierCurve
Type: GeomFill_FillingStyle

Return
-------
None

Description
-----------
Initializes or reinitializes this algorithm with two, three, or four curves - C1, C2, C3, and C4 - and Type, one of the following filling styles: - GeomFill_Stretch - the style with the flattest patch - GeomFill_Coons - a rounded style of patch with less depth than that of Curved - GeomFill_Curved - the style with the most rounded patch. Exceptions Standard_ConstructionError if the curves are not contiguous.
") Init;
		void Init(const opencascade::handle<Geom_BezierCurve> & C1, const opencascade::handle<Geom_BezierCurve> & C2, const GeomFill_FillingStyle Type);

		/****** GeomFill_BezierCurves::Surface ******/
		/****** md5 signature: ec0ec9a2ddd5540d0c39fd4a1f632437 ******/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_BezierSurface>

Description
-----------
Returns the Bezier surface resulting from the computation performed by this algorithm.
") Surface;
		const opencascade::handle<Geom_BezierSurface> & Surface();

};


%extend GeomFill_BezierCurves {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class GeomFill_Boundary *
**************************/
%nodefaultctor GeomFill_Boundary;
class GeomFill_Boundary : public Standard_Transient {
	public:
		/****** GeomFill_Boundary::Bounds ******/
		/****** md5 signature: 4e8179e13e1bc1406a047903884f8b0f ******/
		%feature("compactdefaultargs") Bounds;
		%feature("autodoc", "
Parameters
----------

Return
-------
First: float
Last: float

Description
-----------
No available documentation.
") Bounds;
		virtual void Bounds(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** GeomFill_Boundary::D1 ******/
		/****** md5 signature: ae5a83b60da9cbff06b3607a7e3ff572 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
U: float
P: gp_Pnt
V: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") D1;
		virtual void D1(const Standard_Real U, gp_Pnt & P, gp_Vec & V);

		/****** GeomFill_Boundary::D1Norm ******/
		/****** md5 signature: f893ebdce4a5fbbff73f4358ac8b5978 ******/
		%feature("compactdefaultargs") D1Norm;
		%feature("autodoc", "
Parameters
----------
U: float
N: gp_Vec
DN: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") D1Norm;
		virtual void D1Norm(const Standard_Real U, gp_Vec & N, gp_Vec & DN);

		/****** GeomFill_Boundary::HasNormals ******/
		/****** md5 signature: 5f6a8ed75c40f46eb7071afbd4bf6f85 ******/
		%feature("compactdefaultargs") HasNormals;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") HasNormals;
		virtual Standard_Boolean HasNormals();

		/****** GeomFill_Boundary::IsDegenerated ******/
		/****** md5 signature: 394a948c8760e522f4d807c029014116 ******/
		%feature("compactdefaultargs") IsDegenerated;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsDegenerated;
		virtual Standard_Boolean IsDegenerated();

		/****** GeomFill_Boundary::Norm ******/
		/****** md5 signature: 987eaa9aa4439bd8474e291368d19c1e ******/
		%feature("compactdefaultargs") Norm;
		%feature("autodoc", "
Parameters
----------
U: float

Return
-------
gp_Vec

Description
-----------
No available documentation.
") Norm;
		virtual gp_Vec Norm(const Standard_Real U);

		/****** GeomFill_Boundary::Points ******/
		/****** md5 signature: 63f81329674af973a02f91ae5822973a ******/
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "
Parameters
----------
PFirst: gp_Pnt
PLast: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") Points;
		void Points(gp_Pnt & PFirst, gp_Pnt & PLast);

		/****** GeomFill_Boundary::Reparametrize ******/
		/****** md5 signature: 89d15d5b042afa6cfa640283df9a718e ******/
		%feature("compactdefaultargs") Reparametrize;
		%feature("autodoc", "
Parameters
----------
First: float
Last: float
HasDF: bool
HasDL: bool
DF: float
DL: float
Rev: bool

Return
-------
None

Description
-----------
No available documentation.
") Reparametrize;
		virtual void Reparametrize(const Standard_Real First, const Standard_Real Last, const Standard_Boolean HasDF, const Standard_Boolean HasDL, const Standard_Real DF, const Standard_Real DL, const Standard_Boolean Rev);

		/****** GeomFill_Boundary::Tol3d ******/
		/****** md5 signature: 0c721fa385f74a0241e7db7704f9176b ******/
		%feature("compactdefaultargs") Tol3d;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") Tol3d;
		Standard_Real Tol3d();

		/****** GeomFill_Boundary::Tol3d ******/
		/****** md5 signature: e2856f01229403a6922bd0bdb96cc6a4 ******/
		%feature("compactdefaultargs") Tol3d;
		%feature("autodoc", "
Parameters
----------
Tol: float

Return
-------
None

Description
-----------
No available documentation.
") Tol3d;
		void Tol3d(const Standard_Real Tol);

		/****** GeomFill_Boundary::Tolang ******/
		/****** md5 signature: 4dd5ea66cb1bdd5fbeec6eac3cb6a07c ******/
		%feature("compactdefaultargs") Tolang;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") Tolang;
		Standard_Real Tolang();

		/****** GeomFill_Boundary::Tolang ******/
		/****** md5 signature: be6abd09513454fc3f8616ab23ce4464 ******/
		%feature("compactdefaultargs") Tolang;
		%feature("autodoc", "
Parameters
----------
Tol: float

Return
-------
None

Description
-----------
No available documentation.
") Tolang;
		void Tolang(const Standard_Real Tol);

		/****** GeomFill_Boundary::Value ******/
		/****** md5 signature: 1036ed4d9f5021803fbe93aafa457209 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
U: float

Return
-------
gp_Pnt

Description
-----------
No available documentation.
") Value;
		virtual gp_Pnt Value(const Standard_Real U);

};


%make_alias(GeomFill_Boundary)

%extend GeomFill_Boundary {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class GeomFill_CircularBlendFunc *
***********************************/
class GeomFill_CircularBlendFunc : public Approx_SweepFunction {
	public:
		/****** GeomFill_CircularBlendFunc::GeomFill_CircularBlendFunc ******/
		/****** md5 signature: 83f6c8e8a78d3d9b9d1c32c9733c80f7 ******/
		%feature("compactdefaultargs") GeomFill_CircularBlendFunc;
		%feature("autodoc", "
Parameters
----------
Path: Adaptor3d_Curve
Curve1: Adaptor3d_Curve
Curve2: Adaptor3d_Curve
Radius: float
Polynomial: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Create a Blend with a constant radius with 2 guide-line. <FShape> sets the type of fillet surface. The -- default value is Convert_TgtThetaOver2 (classical -- nurbs -- representation of circles). ChFi3d_QuasiAngular -- corresponds to a nurbs representation of circles -- which parameterisation matches the circle one. -- ChFi3d_Polynomial corresponds to a polynomial -- representation of circles.
") GeomFill_CircularBlendFunc;
		 GeomFill_CircularBlendFunc(const opencascade::handle<Adaptor3d_Curve> & Path, const opencascade::handle<Adaptor3d_Curve> & Curve1, const opencascade::handle<Adaptor3d_Curve> & Curve2, const Standard_Real Radius, const Standard_Boolean Polynomial = Standard_False);

		/****** GeomFill_CircularBlendFunc::BarycentreOfSurf ******/
		/****** md5 signature: a691940df52b45c198f3414d0790e091 ******/
		%feature("compactdefaultargs") BarycentreOfSurf;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Get the barycentre of Surface. An very poor estimation is sufficient. This information is useful to perform well conditioned rational approximation.
") BarycentreOfSurf;
		virtual gp_Pnt BarycentreOfSurf();

		/****** GeomFill_CircularBlendFunc::D0 ******/
		/****** md5 signature: 6e91f38f7b850db44626fcacae37aa41 ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
Param: float
First: float
Last: float
Poles: TColgp_Array1OfPnt
Poles2d: TColgp_Array1OfPnt2d
Weigths: TColStd_Array1OfReal

Return
-------
bool

Description
-----------
compute the section for v = param.
") D0;
		virtual Standard_Boolean D0(const Standard_Real Param, const Standard_Real First, const Standard_Real Last, TColgp_Array1OfPnt & Poles, TColgp_Array1OfPnt2d & Poles2d, TColStd_Array1OfReal & Weigths);

		/****** GeomFill_CircularBlendFunc::D1 ******/
		/****** md5 signature: 2393309f0bc419006f62cbad28865129 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
Param: float
First: float
Last: float
Poles: TColgp_Array1OfPnt
DPoles: TColgp_Array1OfVec
Poles2d: TColgp_Array1OfPnt2d
DPoles2d: TColgp_Array1OfVec2d
Weigths: TColStd_Array1OfReal
DWeigths: TColStd_Array1OfReal

Return
-------
bool

Description
-----------
compute the first derivative in v direction of the section for v = param.
") D1;
		virtual Standard_Boolean D1(const Standard_Real Param, const Standard_Real First, const Standard_Real Last, TColgp_Array1OfPnt & Poles, TColgp_Array1OfVec & DPoles, TColgp_Array1OfPnt2d & Poles2d, TColgp_Array1OfVec2d & DPoles2d, TColStd_Array1OfReal & Weigths, TColStd_Array1OfReal & DWeigths);

		/****** GeomFill_CircularBlendFunc::D2 ******/
		/****** md5 signature: 4cdf4be928174877f3da59b3bf48c192 ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
Param: float
First: float
Last: float
Poles: TColgp_Array1OfPnt
DPoles: TColgp_Array1OfVec
D2Poles: TColgp_Array1OfVec
Poles2d: TColgp_Array1OfPnt2d
DPoles2d: TColgp_Array1OfVec2d
D2Poles2d: TColgp_Array1OfVec2d
Weigths: TColStd_Array1OfReal
DWeigths: TColStd_Array1OfReal
D2Weigths: TColStd_Array1OfReal

Return
-------
bool

Description
-----------
compute the second derivative in v direction of the section for v = param.
") D2;
		virtual Standard_Boolean D2(const Standard_Real Param, const Standard_Real First, const Standard_Real Last, TColgp_Array1OfPnt & Poles, TColgp_Array1OfVec & DPoles, TColgp_Array1OfVec & D2Poles, TColgp_Array1OfPnt2d & Poles2d, TColgp_Array1OfVec2d & DPoles2d, TColgp_Array1OfVec2d & D2Poles2d, TColStd_Array1OfReal & Weigths, TColStd_Array1OfReal & DWeigths, TColStd_Array1OfReal & D2Weigths);

		/****** GeomFill_CircularBlendFunc::GetMinimalWeight ******/
		/****** md5 signature: 36fb20110448cba55b750bc7db93d222 ******/
		%feature("compactdefaultargs") GetMinimalWeight;
		%feature("autodoc", "
Parameters
----------
Weigths: TColStd_Array1OfReal

Return
-------
None

Description
-----------
Compute the minimal value of weight for each poles of all sections. This information is useful to perform well conditioned rational approximation.
") GetMinimalWeight;
		virtual void GetMinimalWeight(TColStd_Array1OfReal & Weigths);

		/****** GeomFill_CircularBlendFunc::GetTolerance ******/
		/****** md5 signature: 3f6ec4398981d416a51435f14d7cee22 ******/
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "
Parameters
----------
BoundTol: float
SurfTol: float
AngleTol: float
Tol3d: TColStd_Array1OfReal

Return
-------
None

Description
-----------
Returns the tolerance to reach in approximation to respect BoundTol error at the Boundary AngleTol tangent error at the Boundary (in radian) SurfTol error inside the surface.
") GetTolerance;
		virtual void GetTolerance(const Standard_Real BoundTol, const Standard_Real SurfTol, const Standard_Real AngleTol, TColStd_Array1OfReal & Tol3d);

		/****** GeomFill_CircularBlendFunc::Intervals ******/
		/****** md5 signature: 89fb47d5d3721d82826a17cc788156e4 ******/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "
Parameters
----------
T: TColStd_Array1OfReal
S: GeomAbs_Shape

Return
-------
None

Description
-----------
Stores in <T> the parameters bounding the intervals of continuity <S>. //! The array must provide enough room to accommodate for the parameters. i.e. T.Length() > NbIntervals().
") Intervals;
		virtual void Intervals(TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****** GeomFill_CircularBlendFunc::IsRational ******/
		/****** md5 signature: 2a6f0ec7e4a129780b654d163e7e3b1c ******/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns if the section is rational or not.
") IsRational;
		virtual Standard_Boolean IsRational();

		/****** GeomFill_CircularBlendFunc::Knots ******/
		/****** md5 signature: 25dbe24e24c953c2c68b0d008e63e5d6 ******/
		%feature("compactdefaultargs") Knots;
		%feature("autodoc", "
Parameters
----------
TKnots: TColStd_Array1OfReal

Return
-------
None

Description
-----------
get the Knots of the section.
") Knots;
		virtual void Knots(TColStd_Array1OfReal & TKnots);

		/****** GeomFill_CircularBlendFunc::MaximalSection ******/
		/****** md5 signature: b8f0d759fcd21b95d400b3aae3c12cfc ******/
		%feature("compactdefaultargs") MaximalSection;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the length of the maximum section. This information is useful to perform well conditioned rational approximation.
") MaximalSection;
		virtual Standard_Real MaximalSection();

		/****** GeomFill_CircularBlendFunc::Mults ******/
		/****** md5 signature: 033dc1fab9e10e705c796ffc1e03a44d ******/
		%feature("compactdefaultargs") Mults;
		%feature("autodoc", "
Parameters
----------
TMults: TColStd_Array1OfInteger

Return
-------
None

Description
-----------
get the Multplicities of the section.
") Mults;
		virtual void Mults(TColStd_Array1OfInteger & TMults);

		/****** GeomFill_CircularBlendFunc::Nb2dCurves ******/
		/****** md5 signature: a7d69b59dcf4f7a28533481bfba32ffb ******/
		%feature("compactdefaultargs") Nb2dCurves;
		%feature("autodoc", "Return
-------
int

Description
-----------
get the number of 2d curves to approximate.
") Nb2dCurves;
		virtual Standard_Integer Nb2dCurves();

		/****** GeomFill_CircularBlendFunc::NbIntervals ******/
		/****** md5 signature: f69f597bd42e14bdc81d20aa650b3d54 ******/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "
Parameters
----------
S: GeomAbs_Shape

Return
-------
int

Description
-----------
Returns the number of intervals for continuity <S>. May be one if Continuity(me) >= <S>.
") NbIntervals;
		virtual Standard_Integer NbIntervals(const GeomAbs_Shape S);

		/****** GeomFill_CircularBlendFunc::SectionShape ******/
		/****** md5 signature: 4b057291e9e338f8d299ce252e7fb36b ******/
		%feature("compactdefaultargs") SectionShape;
		%feature("autodoc", "
Parameters
----------

Return
-------
NbPoles: int
NbKnots: int
Degree: int

Description
-----------
get the format of an section.
") SectionShape;
		virtual void SectionShape(Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****** GeomFill_CircularBlendFunc::SetInterval ******/
		/****** md5 signature: 09d00fda8057705f50d4a0bf656696ed ******/
		%feature("compactdefaultargs") SetInterval;
		%feature("autodoc", "
Parameters
----------
First: float
Last: float

Return
-------
None

Description
-----------
Sets the bounds of the parametric interval on the fonction This determines the derivatives in these values if the function is not Cn.
") SetInterval;
		virtual void SetInterval(const Standard_Real First, const Standard_Real Last);

		/****** GeomFill_CircularBlendFunc::SetTolerance ******/
		/****** md5 signature: bf0b5b1b4d35ebad7b1b81b0b9b8ba2c ******/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "
Parameters
----------
Tol3d: float
Tol2d: float

Return
-------
None

Description
-----------
Is usfull, if (me) have to be run numerical algorithme to perform D0, D1 or D2.
") SetTolerance;
		virtual void SetTolerance(const Standard_Real Tol3d, const Standard_Real Tol2d);

};


%make_alias(GeomFill_CircularBlendFunc)

%extend GeomFill_CircularBlendFunc {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class GeomFill_ConstrainedFilling *
************************************/
class GeomFill_ConstrainedFilling {
	public:
		/****** GeomFill_ConstrainedFilling::GeomFill_ConstrainedFilling ******/
		/****** md5 signature: 05a10ea67ce9ff5c6eb06e7785b8f511 ******/
		%feature("compactdefaultargs") GeomFill_ConstrainedFilling;
		%feature("autodoc", "
Parameters
----------
MaxDeg: int
MaxSeg: int

Return
-------
None

Description
-----------
Constructs an empty framework for filling a surface from boundaries. The boundaries of the surface will be defined, and the surface will be built by using the function Init. The surface will respect the following constraints: - its degree will not be greater than MaxDeg - the maximum number of segments MaxSeg which BSpline surfaces can have.
") GeomFill_ConstrainedFilling;
		 GeomFill_ConstrainedFilling(const Standard_Integer MaxDeg, const Standard_Integer MaxSeg);

		/****** GeomFill_ConstrainedFilling::Boundary ******/
		/****** md5 signature: d66093f22e02305950c68ac9d1e5738f ******/
		%feature("compactdefaultargs") Boundary;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
opencascade::handle<GeomFill_Boundary>

Description
-----------
Returns the bound of index i after sort.
") Boundary;
		opencascade::handle<GeomFill_Boundary> Boundary(const Standard_Integer I);

		/****** GeomFill_ConstrainedFilling::CheckApprox ******/
		/****** md5 signature: 71f119ceb88cef03284bfde58080f00a ******/
		%feature("compactdefaultargs") CheckApprox;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
None

Description
-----------
Computes values and normals along the bound I and compare them to the approx result curves (bound and tgte field) , draw the normals and tangents.
") CheckApprox;
		void CheckApprox(const Standard_Integer I);

		/****** GeomFill_ConstrainedFilling::CheckCoonsAlgPatch ******/
		/****** md5 signature: 5bb522a338dcaa3b28b36318e1e600dd ******/
		%feature("compactdefaultargs") CheckCoonsAlgPatch;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
None

Description
-----------
Computes the fields of tangents on 30 points along the bound I, these are not the constraint tangents but gives an idea of the coonsAlgPatch regularity.
") CheckCoonsAlgPatch;
		void CheckCoonsAlgPatch(const Standard_Integer I);

		/****** GeomFill_ConstrainedFilling::CheckResult ******/
		/****** md5 signature: c9aa2edfff728ef4e67f742b02df583e ******/
		%feature("compactdefaultargs") CheckResult;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
None

Description
-----------
Computes values and normals along the bound I on both constraint surface and result surface, draw the normals, and computes the max distance between values and the max angle between normals.
") CheckResult;
		void CheckResult(const Standard_Integer I);

		/****** GeomFill_ConstrainedFilling::CheckTgteField ******/
		/****** md5 signature: 92ccf822cba93322d7258e90bf6a9ed8 ******/
		%feature("compactdefaultargs") CheckTgteField;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
None

Description
-----------
Computes the fields of tangents and normals on 30 points along the bound I, draw them, and computes the max dot product that must be near than 0.
") CheckTgteField;
		void CheckTgteField(const Standard_Integer I);

		/****** GeomFill_ConstrainedFilling::Eval ******/
		/****** md5 signature: f6ee8af82d58715b28cbfb3fc55e1b3d ******/
		%feature("compactdefaultargs") Eval;
		%feature("autodoc", "
Parameters
----------
W: float
Ord: int

Return
-------
Result: float

Description
-----------
Internal use for Advmath approximation call.
") Eval;
		Standard_Integer Eval(const Standard_Real W, const Standard_Integer Ord, Standard_Real &OutValue);

		/****** GeomFill_ConstrainedFilling::Init ******/
		/****** md5 signature: bb90dabc55e8eef56ed3f74ed6e0c72e ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
B1: GeomFill_Boundary
B2: GeomFill_Boundary
B3: GeomFill_Boundary
NoCheck: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<GeomFill_Boundary> & B1, const opencascade::handle<GeomFill_Boundary> & B2, const opencascade::handle<GeomFill_Boundary> & B3, const Standard_Boolean NoCheck = Standard_False);

		/****** GeomFill_ConstrainedFilling::Init ******/
		/****** md5 signature: 6c95d04c6903e9495319ba3b7855e782 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
B1: GeomFill_Boundary
B2: GeomFill_Boundary
B3: GeomFill_Boundary
B4: GeomFill_Boundary
NoCheck: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Constructs a BSpline surface filled from the series of boundaries B1, B2, B3 and, if need be, B4, which serve: - as path constraints - and optionally, as tangency constraints if they are GeomFill_BoundWithSurf curves. The boundaries may be given in any order: they are classified and if necessary, reversed and reparameterized. The surface will also respect the following constraints: - its degree will not be greater than the maximum degree defined at the time of construction of this framework, and - the maximum number of segments MaxSeg which BSpline surfaces can have.
") Init;
		void Init(const opencascade::handle<GeomFill_Boundary> & B1, const opencascade::handle<GeomFill_Boundary> & B2, const opencascade::handle<GeomFill_Boundary> & B3, const opencascade::handle<GeomFill_Boundary> & B4, const Standard_Boolean NoCheck = Standard_False);

		/****** GeomFill_ConstrainedFilling::ReBuild ******/
		/****** md5 signature: 446512b2f33090f1848a5ff7131926bf ******/
		%feature("compactdefaultargs") ReBuild;
		%feature("autodoc", "Return
-------
None

Description
-----------
Computes the new poles of the surface using the new blending functions set by several calls to SetDomain.
") ReBuild;
		void ReBuild();

		/****** GeomFill_ConstrainedFilling::SetDomain ******/
		/****** md5 signature: f15e2b06830a710fdf8f11f792509cfd ******/
		%feature("compactdefaultargs") SetDomain;
		%feature("autodoc", "
Parameters
----------
l: float
B: GeomFill_BoundWithSurf

Return
-------
None

Description
-----------
Allows to modify domain on witch the blending function associated to the constrained boundary B will propag the influence of the field of tangency. Can be useful to reduce influence of boundaries on which the Coons compatibility conditions are not respected. l is a relative value of the parametric range of B. Default value for l is 1 (used in Init). Warning: Must be called after Init with a constrained boundary used in the call to Init.
") SetDomain;
		void SetDomain(const Standard_Real l, const opencascade::handle<GeomFill_BoundWithSurf> & B);

		/****** GeomFill_ConstrainedFilling::Surface ******/
		/****** md5 signature: 2f50ef783efd4092d3a11c39580e031f ******/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_BSplineSurface>

Description
-----------
Returns the BSpline surface after computation of the fill by this framework.
") Surface;
		opencascade::handle<Geom_BSplineSurface> Surface();

};


%extend GeomFill_ConstrainedFilling {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class GeomFill_CoonsAlgPatch *
*******************************/
class GeomFill_CoonsAlgPatch : public Standard_Transient {
	public:
		/****** GeomFill_CoonsAlgPatch::GeomFill_CoonsAlgPatch ******/
		/****** md5 signature: 8313801afe15d97502730d205ba6aedd ******/
		%feature("compactdefaultargs") GeomFill_CoonsAlgPatch;
		%feature("autodoc", "
Parameters
----------
B1: GeomFill_Boundary
B2: GeomFill_Boundary
B3: GeomFill_Boundary
B4: GeomFill_Boundary

Return
-------
None

Description
-----------
Constructs the algorithmic patch. By Default the constructed blending functions are linear. Warning: No control is done on the bounds. B1/B3 and B2/B4 must be same range and well oriented.
") GeomFill_CoonsAlgPatch;
		 GeomFill_CoonsAlgPatch(const opencascade::handle<GeomFill_Boundary> & B1, const opencascade::handle<GeomFill_Boundary> & B2, const opencascade::handle<GeomFill_Boundary> & B3, const opencascade::handle<GeomFill_Boundary> & B4);

		/****** GeomFill_CoonsAlgPatch::Bound ******/
		/****** md5 signature: c7a6b953b6e3152dbf24245ec3855852 ******/
		%feature("compactdefaultargs") Bound;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
opencascade::handle<GeomFill_Boundary>

Description
-----------
No available documentation.
") Bound;
		const opencascade::handle<GeomFill_Boundary> & Bound(const Standard_Integer I);

		/****** GeomFill_CoonsAlgPatch::Corner ******/
		/****** md5 signature: 52d3f66618593ed082e79ce47ae5b2e9 ******/
		%feature("compactdefaultargs") Corner;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
gp_Pnt

Description
-----------
No available documentation.
") Corner;
		const gp_Pnt Corner(const Standard_Integer I);

		/****** GeomFill_CoonsAlgPatch::D1U ******/
		/****** md5 signature: e0ed54fcb23b418df4c3f658cc6a93a7 ******/
		%feature("compactdefaultargs") D1U;
		%feature("autodoc", "
Parameters
----------
U: float
V: float

Return
-------
gp_Vec

Description
-----------
Computes the d/dU partial derivative on the algorithmic patch at parameters U and V.
") D1U;
		gp_Vec D1U(const Standard_Real U, const Standard_Real V);

		/****** GeomFill_CoonsAlgPatch::D1V ******/
		/****** md5 signature: 3e884a933d6ef4b91df297a08be6eaed ******/
		%feature("compactdefaultargs") D1V;
		%feature("autodoc", "
Parameters
----------
U: float
V: float

Return
-------
gp_Vec

Description
-----------
Computes the d/dV partial derivative on the algorithmic patch at parameters U and V.
") D1V;
		gp_Vec D1V(const Standard_Real U, const Standard_Real V);

		/****** GeomFill_CoonsAlgPatch::DUV ******/
		/****** md5 signature: 551cda651252e0218c32235dbe891afa ******/
		%feature("compactdefaultargs") DUV;
		%feature("autodoc", "
Parameters
----------
U: float
V: float

Return
-------
gp_Vec

Description
-----------
Computes the d2/dUdV partial derivative on the algorithmic patch made with linear blending functions at parameter U and V.
") DUV;
		gp_Vec DUV(const Standard_Real U, const Standard_Real V);

		/****** GeomFill_CoonsAlgPatch::Func ******/
		/****** md5 signature: e7f1d4ad2f7ad640080d862cd1acd5ac ******/
		%feature("compactdefaultargs") Func;
		%feature("autodoc", "
Parameters
----------
f1: Law_Function
f2: Law_Function

Return
-------
None

Description
-----------
Give the blending functions.
") Func;
		void Func(opencascade::handle<Law_Function> & f1, opencascade::handle<Law_Function> & f2);

		/****** GeomFill_CoonsAlgPatch::Func ******/
		/****** md5 signature: 8d1466c000c855ccc37326b09627c4b3 ******/
		%feature("compactdefaultargs") Func;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
opencascade::handle<Law_Function>

Description
-----------
No available documentation.
") Func;
		const opencascade::handle<Law_Function> & Func(const Standard_Integer I);

		/****** GeomFill_CoonsAlgPatch::SetFunc ******/
		/****** md5 signature: d7c144cb61c98bd760c2897ab648584c ******/
		%feature("compactdefaultargs") SetFunc;
		%feature("autodoc", "
Parameters
----------
f1: Law_Function
f2: Law_Function

Return
-------
None

Description
-----------
Set the blending functions.
") SetFunc;
		void SetFunc(const opencascade::handle<Law_Function> & f1, const opencascade::handle<Law_Function> & f2);

		/****** GeomFill_CoonsAlgPatch::Value ******/
		/****** md5 signature: 42959897db65d301eb66b5528ed15f16 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
U: float
V: float

Return
-------
gp_Pnt

Description
-----------
Computes the value on the algorithmic patch at parameters U and V.
") Value;
		gp_Pnt Value(const Standard_Real U, const Standard_Real V);

};


%make_alias(GeomFill_CoonsAlgPatch)

%extend GeomFill_CoonsAlgPatch {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class GeomFill_CornerState *
*****************************/
class GeomFill_CornerState {
	public:
		/****** GeomFill_CornerState::GeomFill_CornerState ******/
		/****** md5 signature: 6f8ba49168e735184f5cbf02f218d961 ******/
		%feature("compactdefaultargs") GeomFill_CornerState;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") GeomFill_CornerState;
		 GeomFill_CornerState();

		/****** GeomFill_CornerState::Constraint ******/
		/****** md5 signature: c65689f41db5ca0fb92caabb5e354a5d ******/
		%feature("compactdefaultargs") Constraint;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Constraint;
		void Constraint();

		/****** GeomFill_CornerState::DoKill ******/
		/****** md5 signature: f59d3324e2d958952750dbe3caa2d8ca ******/
		%feature("compactdefaultargs") DoKill;
		%feature("autodoc", "
Parameters
----------
Scal: float

Return
-------
None

Description
-----------
No available documentation.
") DoKill;
		void DoKill(const Standard_Real Scal);

		/****** GeomFill_CornerState::Gap ******/
		/****** md5 signature: 57884ecbe8d7b5b092e706848a3678db ******/
		%feature("compactdefaultargs") Gap;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") Gap;
		Standard_Real Gap();

		/****** GeomFill_CornerState::Gap ******/
		/****** md5 signature: f1f69db79c82510ff6d3e007517400a7 ******/
		%feature("compactdefaultargs") Gap;
		%feature("autodoc", "
Parameters
----------
G: float

Return
-------
None

Description
-----------
No available documentation.
") Gap;
		void Gap(const Standard_Real G);

		/****** GeomFill_CornerState::HasConstraint ******/
		/****** md5 signature: b284feaf1d053df9b6efe4b2a8443c50 ******/
		%feature("compactdefaultargs") HasConstraint;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") HasConstraint;
		Standard_Boolean HasConstraint();

		/****** GeomFill_CornerState::IsToKill ******/
		/****** md5 signature: 6df117c61ed49f132cf24a2849741b58 ******/
		%feature("compactdefaultargs") IsToKill;
		%feature("autodoc", "
Parameters
----------

Return
-------
Scal: float

Description
-----------
No available documentation.
") IsToKill;
		Standard_Boolean IsToKill(Standard_Real &OutValue);

		/****** GeomFill_CornerState::NorAng ******/
		/****** md5 signature: af8052ba83d247ad3d6bb5c4ca00983f ******/
		%feature("compactdefaultargs") NorAng;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") NorAng;
		Standard_Real NorAng();

		/****** GeomFill_CornerState::NorAng ******/
		/****** md5 signature: 978de348befc356078bda3f1ab4a84d4 ******/
		%feature("compactdefaultargs") NorAng;
		%feature("autodoc", "
Parameters
----------
Ang: float

Return
-------
None

Description
-----------
No available documentation.
") NorAng;
		void NorAng(const Standard_Real Ang);

		/****** GeomFill_CornerState::TgtAng ******/
		/****** md5 signature: 0c0974dcf961b00f0f5e5459288df2aa ******/
		%feature("compactdefaultargs") TgtAng;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") TgtAng;
		Standard_Real TgtAng();

		/****** GeomFill_CornerState::TgtAng ******/
		/****** md5 signature: 25b12c2b442b6535ed79421583afc990 ******/
		%feature("compactdefaultargs") TgtAng;
		%feature("autodoc", "
Parameters
----------
Ang: float

Return
-------
None

Description
-----------
No available documentation.
") TgtAng;
		void TgtAng(const Standard_Real Ang);

};


%extend GeomFill_CornerState {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class GeomFill_Filling *
*************************/
class GeomFill_Filling {
	public:
		/****** GeomFill_Filling::GeomFill_Filling ******/
		/****** md5 signature: 3b1110ca9e87c0eec14c23c2b775f31f ******/
		%feature("compactdefaultargs") GeomFill_Filling;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") GeomFill_Filling;
		 GeomFill_Filling();

		/****** GeomFill_Filling::NbUPoles ******/
		/****** md5 signature: fb7c625af5aeee8be8cffdd28f1b08d5 ******/
		%feature("compactdefaultargs") NbUPoles;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbUPoles;
		Standard_Integer NbUPoles();

		/****** GeomFill_Filling::NbVPoles ******/
		/****** md5 signature: 098754ae7893287e442d0a3c48b39cf0 ******/
		%feature("compactdefaultargs") NbVPoles;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbVPoles;
		Standard_Integer NbVPoles();

		/****** GeomFill_Filling::Poles ******/
		/****** md5 signature: d37f7b27fa9ff1e224fe0dc4f7081466 ******/
		%feature("compactdefaultargs") Poles;
		%feature("autodoc", "
Parameters
----------
Poles: TColgp_Array2OfPnt

Return
-------
None

Description
-----------
No available documentation.
") Poles;
		void Poles(TColgp_Array2OfPnt & Poles);

		/****** GeomFill_Filling::Weights ******/
		/****** md5 signature: db937f94d83b7a0ec9af807fb8a53a4c ******/
		%feature("compactdefaultargs") Weights;
		%feature("autodoc", "
Parameters
----------
Weights: TColStd_Array2OfReal

Return
-------
None

Description
-----------
No available documentation.
") Weights;
		void Weights(TColStd_Array2OfReal & Weights);

		/****** GeomFill_Filling::isRational ******/
		/****** md5 signature: fd4212ffa7bc30cde420e74a2c539434 ******/
		%feature("compactdefaultargs") isRational;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") isRational;
		Standard_Boolean isRational();

};


%extend GeomFill_Filling {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class GeomFill_FunctionDraft *
*******************************/
class GeomFill_FunctionDraft : public math_FunctionSetWithDerivatives {
	public:
		/****** GeomFill_FunctionDraft::GeomFill_FunctionDraft ******/
		/****** md5 signature: e0b75f20f9ca33331d77d2796abf9e26 ******/
		%feature("compactdefaultargs") GeomFill_FunctionDraft;
		%feature("autodoc", "
Parameters
----------
S: Adaptor3d_Surface
C: Adaptor3d_Curve

Return
-------
None

Description
-----------
No available documentation.
") GeomFill_FunctionDraft;
		 GeomFill_FunctionDraft(const opencascade::handle<Adaptor3d_Surface> & S, const opencascade::handle<Adaptor3d_Curve> & C);

		/****** GeomFill_FunctionDraft::Deriv2T ******/
		/****** md5 signature: ed865b0d80ade12a428d221ca18ba8bf ******/
		%feature("compactdefaultargs") Deriv2T;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve
Param: float
W: float
d2N: gp_Vec
teta: float
F: math_Vector

Return
-------
bool

Description
-----------
returns the values <F> of the T2 derivatives for the parameter Param .
") Deriv2T;
		Standard_Boolean Deriv2T(const opencascade::handle<Adaptor3d_Curve> & C, const Standard_Real Param, const Standard_Real W, const gp_Vec & d2N, const Standard_Real teta, math_Vector & F);

		/****** GeomFill_FunctionDraft::Deriv2X ******/
		/****** md5 signature: 3717235c7a0694bb0026f224747d3335 ******/
		%feature("compactdefaultargs") Deriv2X;
		%feature("autodoc", "
Parameters
----------
X: math_Vector
T: GeomFill_Tensor

Return
-------
bool

Description
-----------
returns the values <T> of the X2 derivatives for the parameter Param .
") Deriv2X;
		Standard_Boolean Deriv2X(const math_Vector & X, GeomFill_Tensor & T);

		/****** GeomFill_FunctionDraft::DerivT ******/
		/****** md5 signature: 009f827b0251fad55638995d4292a3f9 ******/
		%feature("compactdefaultargs") DerivT;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve
Param: float
W: float
dN: gp_Vec
teta: float
F: math_Vector

Return
-------
bool

Description
-----------
returns the values <F> of the T derivatives for the parameter Param .
") DerivT;
		Standard_Boolean DerivT(const opencascade::handle<Adaptor3d_Curve> & C, const Standard_Real Param, const Standard_Real W, const gp_Vec & dN, const Standard_Real teta, math_Vector & F);

		/****** GeomFill_FunctionDraft::DerivTX ******/
		/****** md5 signature: 364759ce3f6d1a901ce6394ecbbe5652 ******/
		%feature("compactdefaultargs") DerivTX;
		%feature("autodoc", "
Parameters
----------
dN: gp_Vec
teta: float
D: math_Matrix

Return
-------
bool

Description
-----------
returns the values <D> of the TX derivatives for the parameter Param .
") DerivTX;
		Standard_Boolean DerivTX(const gp_Vec & dN, const Standard_Real teta, math_Matrix & D);

		/****** GeomFill_FunctionDraft::Derivatives ******/
		/****** md5 signature: 95432d04d2efca37d62c37543709dc0f ******/
		%feature("compactdefaultargs") Derivatives;
		%feature("autodoc", "
Parameters
----------
X: math_Vector
D: math_Matrix

Return
-------
bool

Description
-----------
returns the values <D> of the derivatives for the variable <X>. Returns True if the computation was done successfully, False otherwise.
") Derivatives;
		virtual Standard_Boolean Derivatives(const math_Vector & X, math_Matrix & D);

		/****** GeomFill_FunctionDraft::NbEquations ******/
		/****** md5 signature: 186743efcc98b222ef8f5159fb11b9d2 ******/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the number of equations of the function.
") NbEquations;
		virtual Standard_Integer NbEquations();

		/****** GeomFill_FunctionDraft::NbVariables ******/
		/****** md5 signature: 28ab91d0183585502101892aac2c5b98 ******/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the number of variables of the function.
") NbVariables;
		virtual Standard_Integer NbVariables();

		/****** GeomFill_FunctionDraft::Value ******/
		/****** md5 signature: 0f8ab7140704c6b797e41dd63743f62b ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
X: math_Vector
F: math_Vector

Return
-------
bool

Description
-----------
computes the values <F> of the Functions for the variable <X>. Returns True if the computation was done successfully, False otherwise.
") Value;
		virtual Standard_Boolean Value(const math_Vector & X, math_Vector & F);

		/****** GeomFill_FunctionDraft::Values ******/
		/****** md5 signature: e89fa39b5a97388571b1cb93b3e7b2fc ******/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "
Parameters
----------
X: math_Vector
F: math_Vector
D: math_Matrix

Return
-------
bool

Description
-----------
returns the values <F> of the functions and the derivatives <D> for the variable <X>. Returns True if the computation was done successfully, False otherwise.
") Values;
		virtual Standard_Boolean Values(const math_Vector & X, math_Vector & F, math_Matrix & D);

};


%extend GeomFill_FunctionDraft {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class GeomFill_FunctionGuide *
*******************************/
class GeomFill_FunctionGuide : public math_FunctionSetWithDerivatives {
	public:
		/****** GeomFill_FunctionGuide::GeomFill_FunctionGuide ******/
		/****** md5 signature: 126009e7c37512c316697b8b2d32329a ******/
		%feature("compactdefaultargs") GeomFill_FunctionGuide;
		%feature("autodoc", "
Parameters
----------
S: GeomFill_SectionLaw
Guide: Adaptor3d_Curve
ParamOnLaw: float (optional, default to 0.0)

Return
-------
None

Description
-----------
No available documentation.
") GeomFill_FunctionGuide;
		 GeomFill_FunctionGuide(const opencascade::handle<GeomFill_SectionLaw> & S, const opencascade::handle<Adaptor3d_Curve> & Guide, const Standard_Real ParamOnLaw = 0.0);

		/****** GeomFill_FunctionGuide::DerivT ******/
		/****** md5 signature: 8497a0e1c79d28b9784f7f110d8384d9 ******/
		%feature("compactdefaultargs") DerivT;
		%feature("autodoc", "
Parameters
----------
X: math_Vector
DCentre: gp_XYZ
DDir: gp_XYZ
DFDT: math_Vector

Return
-------
bool

Description
-----------
returns the values <F> of the T derivatives for the parameter Param .
") DerivT;
		Standard_Boolean DerivT(const math_Vector & X, const gp_XYZ & DCentre, const gp_XYZ & DDir, math_Vector & DFDT);

		/****** GeomFill_FunctionGuide::Derivatives ******/
		/****** md5 signature: 95432d04d2efca37d62c37543709dc0f ******/
		%feature("compactdefaultargs") Derivatives;
		%feature("autodoc", "
Parameters
----------
X: math_Vector
D: math_Matrix

Return
-------
bool

Description
-----------
returns the values <D> of the derivatives for the variable <X>. Returns True if the computation was done successfully, False otherwise.
") Derivatives;
		virtual Standard_Boolean Derivatives(const math_Vector & X, math_Matrix & D);

		/****** GeomFill_FunctionGuide::NbEquations ******/
		/****** md5 signature: 186743efcc98b222ef8f5159fb11b9d2 ******/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the number of equations of the function.
") NbEquations;
		virtual Standard_Integer NbEquations();

		/****** GeomFill_FunctionGuide::NbVariables ******/
		/****** md5 signature: 28ab91d0183585502101892aac2c5b98 ******/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the number of variables of the function.
") NbVariables;
		virtual Standard_Integer NbVariables();

		/****** GeomFill_FunctionGuide::SetParam ******/
		/****** md5 signature: 3321ed78a982705949ad4814c7465405 ******/
		%feature("compactdefaultargs") SetParam;
		%feature("autodoc", "
Parameters
----------
Param: float
Centre: gp_Pnt
Dir: gp_XYZ
XDir: gp_XYZ

Return
-------
None

Description
-----------
No available documentation.
") SetParam;
		void SetParam(const Standard_Real Param, const gp_Pnt & Centre, const gp_XYZ & Dir, const gp_XYZ & XDir);

		/****** GeomFill_FunctionGuide::Value ******/
		/****** md5 signature: 0f8ab7140704c6b797e41dd63743f62b ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
X: math_Vector
F: math_Vector

Return
-------
bool

Description
-----------
computes the values <F> of the Functions for the variable <X>. Returns True if the computation was done successfully, False otherwise.
") Value;
		virtual Standard_Boolean Value(const math_Vector & X, math_Vector & F);

		/****** GeomFill_FunctionGuide::Values ******/
		/****** md5 signature: e89fa39b5a97388571b1cb93b3e7b2fc ******/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "
Parameters
----------
X: math_Vector
F: math_Vector
D: math_Matrix

Return
-------
bool

Description
-----------
returns the values <F> of the functions and the derivatives <D> for the variable <X>. Returns True if the computation was done successfully, False otherwise.
") Values;
		virtual Standard_Boolean Values(const math_Vector & X, math_Vector & F, math_Matrix & D);

};


%extend GeomFill_FunctionGuide {
	%pythoncode {
	__repr__ = _dumps_object

	@methodnotwrapped
	def Deriv2T(self):
		pass
	}
};

/**********************
* class GeomFill_Line *
**********************/
class GeomFill_Line : public Standard_Transient {
	public:
		/****** GeomFill_Line::GeomFill_Line ******/
		/****** md5 signature: d3df0f91b73168b7305fa019e59eba18 ******/
		%feature("compactdefaultargs") GeomFill_Line;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") GeomFill_Line;
		 GeomFill_Line();

		/****** GeomFill_Line::GeomFill_Line ******/
		/****** md5 signature: 00a03a4156c22378791f2c1ca351787c ******/
		%feature("compactdefaultargs") GeomFill_Line;
		%feature("autodoc", "
Parameters
----------
NbPoints: int

Return
-------
None

Description
-----------
No available documentation.
") GeomFill_Line;
		 GeomFill_Line(const Standard_Integer NbPoints);

		/****** GeomFill_Line::NbPoints ******/
		/****** md5 signature: 1d4bbbd7c4dda4f1e56c00ae994bedbe ******/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbPoints;
		Standard_Integer NbPoints();

		/****** GeomFill_Line::Point ******/
		/****** md5 signature: c110b5c5190958c17fd0e50ed19311a4 ******/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
int

Description
-----------
No available documentation.
") Point;
		Standard_Integer Point(const Standard_Integer Index);

};


%make_alias(GeomFill_Line)

%extend GeomFill_Line {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class GeomFill_LocFunction *
*****************************/
class GeomFill_LocFunction {
	public:
		/****** GeomFill_LocFunction::GeomFill_LocFunction ******/
		/****** md5 signature: cf11221f5fc7ad9a3cce4de4d90f2173 ******/
		%feature("compactdefaultargs") GeomFill_LocFunction;
		%feature("autodoc", "
Parameters
----------
Law: GeomFill_LocationLaw

Return
-------
None

Description
-----------
No available documentation.
") GeomFill_LocFunction;
		 GeomFill_LocFunction(const opencascade::handle<GeomFill_LocationLaw> & Law);

		/****** GeomFill_LocFunction::D0 ******/
		/****** md5 signature: 006a1880f4e40acd2935e3b8032245a4 ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
Param: float
First: float
Last: float

Return
-------
bool

Description
-----------
compute the section for v = param.
") D0;
		Standard_Boolean D0(const Standard_Real Param, const Standard_Real First, const Standard_Real Last);

		/****** GeomFill_LocFunction::D1 ******/
		/****** md5 signature: d5c0cc2ce05f94677e40a80295be4ff8 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
Param: float
First: float
Last: float

Return
-------
bool

Description
-----------
compute the first derivative in v direction of the section for v = param.
") D1;
		Standard_Boolean D1(const Standard_Real Param, const Standard_Real First, const Standard_Real Last);

		/****** GeomFill_LocFunction::D2 ******/
		/****** md5 signature: f79a4f85e4411bd9394e523c7df07571 ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
Param: float
First: float
Last: float

Return
-------
bool

Description
-----------
compute the second derivative in v direction of the section for v = param.
") D2;
		Standard_Boolean D2(const Standard_Real Param, const Standard_Real First, const Standard_Real Last);

		/****** GeomFill_LocFunction::DN ******/
		/****** md5 signature: 1ae44f0e971d9abebc1a35a83c1801f8 ******/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "
Parameters
----------
Param: float
First: float
Last: float
Order: int

Return
-------
Result: float
Ier: int

Description
-----------
No available documentation.
") DN;
		void DN(const Standard_Real Param, const Standard_Real First, const Standard_Real Last, const Standard_Integer Order, Standard_Real &OutValue, Standard_Integer &OutValue);

};


%extend GeomFill_LocFunction {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class GeomFill_LocationLaw *
*****************************/
%nodefaultctor GeomFill_LocationLaw;
class GeomFill_LocationLaw : public Standard_Transient {
	public:
		/****** GeomFill_LocationLaw::Copy ******/
		/****** md5 signature: 29fa43f07f04799bcbcf97729b2d4ad0 ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<GeomFill_LocationLaw>

Description
-----------
No available documentation.
") Copy;
		virtual opencascade::handle<GeomFill_LocationLaw> Copy();

		/****** GeomFill_LocationLaw::D0 ******/
		/****** md5 signature: fc43bb497d611730db6e5b24c13bb862 ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
Param: float
M: gp_Mat
V: gp_Vec

Return
-------
bool

Description
-----------
compute Location.
") D0;
		virtual Standard_Boolean D0(const Standard_Real Param, gp_Mat & M, gp_Vec & V);

		/****** GeomFill_LocationLaw::D0 ******/
		/****** md5 signature: 593572b2f048fe9a55932c2f8460631d ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
Param: float
M: gp_Mat
V: gp_Vec
Poles2d: TColgp_Array1OfPnt2d

Return
-------
bool

Description
-----------
compute Location and 2d points.
") D0;
		virtual Standard_Boolean D0(const Standard_Real Param, gp_Mat & M, gp_Vec & V, TColgp_Array1OfPnt2d & Poles2d);

		/****** GeomFill_LocationLaw::D1 ******/
		/****** md5 signature: 86f0d1b0166d91c445bbc4baeef97928 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
Param: float
M: gp_Mat
V: gp_Vec
DM: gp_Mat
DV: gp_Vec
Poles2d: TColgp_Array1OfPnt2d
DPoles2d: TColgp_Array1OfVec2d

Return
-------
bool

Description
-----------
compute location 2d points and associated first derivatives. Warning: It used only for C1 or C2 approximation.
") D1;
		virtual Standard_Boolean D1(const Standard_Real Param, gp_Mat & M, gp_Vec & V, gp_Mat & DM, gp_Vec & DV, TColgp_Array1OfPnt2d & Poles2d, TColgp_Array1OfVec2d & DPoles2d);

		/****** GeomFill_LocationLaw::D2 ******/
		/****** md5 signature: b8394f0997756eb2e29dda1a7f0fba5e ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
Param: float
M: gp_Mat
V: gp_Vec
DM: gp_Mat
DV: gp_Vec
D2M: gp_Mat
D2V: gp_Vec
Poles2d: TColgp_Array1OfPnt2d
DPoles2d: TColgp_Array1OfVec2d
D2Poles2d: TColgp_Array1OfVec2d

Return
-------
bool

Description
-----------
compute location 2d points and associated first and seconde derivatives. Warning: It used only for C2 approximation.
") D2;
		virtual Standard_Boolean D2(const Standard_Real Param, gp_Mat & M, gp_Vec & V, gp_Mat & DM, gp_Vec & DV, gp_Mat & D2M, gp_Vec & D2V, TColgp_Array1OfPnt2d & Poles2d, TColgp_Array1OfVec2d & DPoles2d, TColgp_Array1OfVec2d & D2Poles2d);

		/****** GeomFill_LocationLaw::ErrorStatus ******/
		/****** md5 signature: 6ba28977b4572c57396a526bbdd7889b ******/
		%feature("compactdefaultargs") ErrorStatus;
		%feature("autodoc", "Return
-------
GeomFill_PipeError

Description
-----------
Give a status to the Law Returns PipeOk (default implementation).
") ErrorStatus;
		virtual GeomFill_PipeError ErrorStatus();

		/****** GeomFill_LocationLaw::GetAverageLaw ******/
		/****** md5 signature: 61f510937966f8431506453d1a544474 ******/
		%feature("compactdefaultargs") GetAverageLaw;
		%feature("autodoc", "
Parameters
----------
AM: gp_Mat
AV: gp_Vec

Return
-------
None

Description
-----------
Get average value of M(t) and V(t) it is usfull to make fast approximation of rational surfaces.
") GetAverageLaw;
		virtual void GetAverageLaw(gp_Mat & AM, gp_Vec & AV);

		/****** GeomFill_LocationLaw::GetCurve ******/
		/****** md5 signature: 1afa1565b694007fff9dce84f020382d ******/
		%feature("compactdefaultargs") GetCurve;
		%feature("autodoc", "Return
-------
opencascade::handle<Adaptor3d_Curve>

Description
-----------
No available documentation.
") GetCurve;
		virtual const opencascade::handle<Adaptor3d_Curve> & GetCurve();

		/****** GeomFill_LocationLaw::GetDomain ******/
		/****** md5 signature: cf4b59a00ac748986e419ee48c8333d6 ******/
		%feature("compactdefaultargs") GetDomain;
		%feature("autodoc", "
Parameters
----------

Return
-------
First: float
Last: float

Description
-----------
Gets the bounds of the function parametric domain. Warning: This domain it is not modified by the SetValue method.
") GetDomain;
		virtual void GetDomain(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** GeomFill_LocationLaw::GetInterval ******/
		/****** md5 signature: a17748ec1150378c402b1599113effd4 ******/
		%feature("compactdefaultargs") GetInterval;
		%feature("autodoc", "
Parameters
----------

Return
-------
First: float
Last: float

Description
-----------
Gets the bounds of the parametric interval on the function.
") GetInterval;
		virtual void GetInterval(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** GeomFill_LocationLaw::GetMaximalNorm ******/
		/****** md5 signature: 1b12372928d2ac3fbdb0f3124e438215 ******/
		%feature("compactdefaultargs") GetMaximalNorm;
		%feature("autodoc", "Return
-------
float

Description
-----------
Get the maximum Norm of the matrix-location part. It is usful to find an good Tolerance to approx M(t).
") GetMaximalNorm;
		virtual Standard_Real GetMaximalNorm();

		/****** GeomFill_LocationLaw::HasFirstRestriction ******/
		/****** md5 signature: ad052bc083e2d3e77328b919df490b7a ******/
		%feature("compactdefaultargs") HasFirstRestriction;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Say if the first restriction is defined in this class. If it is true the first element of poles array in D0,D1,D2... Correspond to this restriction. Returns Standard_False (default implementation).
") HasFirstRestriction;
		virtual Standard_Boolean HasFirstRestriction();

		/****** GeomFill_LocationLaw::HasLastRestriction ******/
		/****** md5 signature: e04ed5bec90f35e567347a3b96d763c3 ******/
		%feature("compactdefaultargs") HasLastRestriction;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Say if the last restriction is defined in this class. If it is true the last element of poles array in D0,D1,D2... Correspond to this restriction. Returns Standard_False (default implementation).
") HasLastRestriction;
		virtual Standard_Boolean HasLastRestriction();

		/****** GeomFill_LocationLaw::Intervals ******/
		/****** md5 signature: 7d2bf038a9213acf1609cc1244a3ee03 ******/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "
Parameters
----------
T: TColStd_Array1OfReal
S: GeomAbs_Shape

Return
-------
None

Description
-----------
Stores in <T> the parameters bounding the intervals of continuity <S>. //! The array must provide enough room to accommodate for the parameters. i.e. T.Length() > NbIntervals().
") Intervals;
		virtual void Intervals(TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****** GeomFill_LocationLaw::IsRotation ******/
		/****** md5 signature: 973edf98b0a7a11b959acaead8b42c67 ******/
		%feature("compactdefaultargs") IsRotation;
		%feature("autodoc", "
Parameters
----------

Return
-------
Error: float

Description
-----------
Say if the Location Law, is a rotation of Location The default implementation is ' returns False '.
") IsRotation;
		virtual Standard_Boolean IsRotation(Standard_Real &OutValue);

		/****** GeomFill_LocationLaw::IsTranslation ******/
		/****** md5 signature: ab2a53c062db49c3cabaf4b675826102 ******/
		%feature("compactdefaultargs") IsTranslation;
		%feature("autodoc", "
Parameters
----------

Return
-------
Error: float

Description
-----------
Say if the Location Law, is an translation of Location The default implementation is ' returns False '.
") IsTranslation;
		virtual Standard_Boolean IsTranslation(Standard_Real &OutValue);

		/****** GeomFill_LocationLaw::Nb2dCurves ******/
		/****** md5 signature: 6db4babc7c8801d581426366f92a32f0 ******/
		%feature("compactdefaultargs") Nb2dCurves;
		%feature("autodoc", "Return
-------
int

Description
-----------
get the number of 2d curves (Restrictions + Traces) to approximate.
") Nb2dCurves;
		Standard_Integer Nb2dCurves();

		/****** GeomFill_LocationLaw::NbIntervals ******/
		/****** md5 signature: cb7f68d4b2c30f29cd5ba6f81443d314 ******/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "
Parameters
----------
S: GeomAbs_Shape

Return
-------
int

Description
-----------
Returns the number of intervals for continuity <S>. May be one if Continuity(me) >= <S>.
") NbIntervals;
		virtual Standard_Integer NbIntervals(const GeomAbs_Shape S);

		/****** GeomFill_LocationLaw::Resolution ******/
		/****** md5 signature: 70b0f0265ef5802a650e7ab2f0220a7e ******/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "
Parameters
----------
Index: int
Tol: float

Return
-------
TolU: float
TolV: float

Description
-----------
Returns the resolutions in the sub-space 2d <Index> This information is usfull to find an good tolerance in 2d approximation.
") Resolution;
		virtual void Resolution(const Standard_Integer Index, const Standard_Real Tol, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** GeomFill_LocationLaw::Rotation ******/
		/****** md5 signature: af16e6da9546d03e40f34ed4bd8cc695 ******/
		%feature("compactdefaultargs") Rotation;
		%feature("autodoc", "
Parameters
----------
Center: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") Rotation;
		virtual void Rotation(gp_Pnt & Center);

		/****** GeomFill_LocationLaw::SetCurve ******/
		/****** md5 signature: 4f61bd5930a6293e48d18d548fb6b67a ******/
		%feature("compactdefaultargs") SetCurve;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve

Return
-------
bool

Description
-----------
initialize curve of location law.
") SetCurve;
		virtual Standard_Boolean SetCurve(const opencascade::handle<Adaptor3d_Curve> & C);

		/****** GeomFill_LocationLaw::SetInterval ******/
		/****** md5 signature: 0547f3a9c04c5f6c0363c26295b2e795 ******/
		%feature("compactdefaultargs") SetInterval;
		%feature("autodoc", "
Parameters
----------
First: float
Last: float

Return
-------
None

Description
-----------
Sets the bounds of the parametric interval on the function This determines the derivatives in these values if the function is not Cn.
") SetInterval;
		virtual void SetInterval(const Standard_Real First, const Standard_Real Last);

		/****** GeomFill_LocationLaw::SetTolerance ******/
		/****** md5 signature: 1565024762efa75936883ee9558fa99d ******/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "
Parameters
----------
Tol3d: float
Tol2d: float

Return
-------
None

Description
-----------
Is useful, if (me) have to run numerical algorithm to perform D0, D1 or D2 The default implementation make nothing.
") SetTolerance;
		virtual void SetTolerance(const Standard_Real Tol3d, const Standard_Real Tol2d);

		/****** GeomFill_LocationLaw::SetTrsf ******/
		/****** md5 signature: d24d0b12a29328de00f56e6c06319c83 ******/
		%feature("compactdefaultargs") SetTrsf;
		%feature("autodoc", "
Parameters
----------
Transfo: gp_Mat

Return
-------
None

Description
-----------
Set a transformation Matrix like the law M(t) become Mat * M(t).
") SetTrsf;
		virtual void SetTrsf(const gp_Mat & Transfo);

		/****** GeomFill_LocationLaw::TraceNumber ******/
		/****** md5 signature: d8da584be0a6e10afb5206d653daab74 ******/
		%feature("compactdefaultargs") TraceNumber;
		%feature("autodoc", "Return
-------
int

Description
-----------
Give the number of trace (Curves 2d which are not restriction) Returns 0 (default implementation).
") TraceNumber;
		virtual Standard_Integer TraceNumber();

};


%make_alias(GeomFill_LocationLaw)

%extend GeomFill_LocationLaw {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class GeomFill_Pipe *
**********************/
class GeomFill_Pipe {
	public:
		/****** GeomFill_Pipe::GeomFill_Pipe ******/
		/****** md5 signature: 26475aa1bbdb26dae7e70e591201bff5 ******/
		%feature("compactdefaultargs") GeomFill_Pipe;
		%feature("autodoc", "Return
-------
None

Description
-----------
Constructs an empty algorithm for building pipes. Use the function Init to initialize it.
") GeomFill_Pipe;
		 GeomFill_Pipe();

		/****** GeomFill_Pipe::GeomFill_Pipe ******/
		/****** md5 signature: ee732a0cea4d5696417bc56d24241c83 ******/
		%feature("compactdefaultargs") GeomFill_Pipe;
		%feature("autodoc", "
Parameters
----------
Path: Geom_Curve
Radius: float

Return
-------
None

Description
-----------
No available documentation.
") GeomFill_Pipe;
		 GeomFill_Pipe(const opencascade::handle<Geom_Curve> & Path, const Standard_Real Radius);

		/****** GeomFill_Pipe::GeomFill_Pipe ******/
		/****** md5 signature: 00b93a896a2ca0b4ecb608e85a9693e4 ******/
		%feature("compactdefaultargs") GeomFill_Pipe;
		%feature("autodoc", "
Parameters
----------
Path: Geom_Curve
FirstSect: Geom_Curve
Option: GeomFill_Trihedron (optional, default to GeomFill_IsCorrectedFrenet)

Return
-------
None

Description
-----------
Create a pipe with a constant section (<FirstSection>) and a path (<Path>) Option can be - GeomFill_IsCorrectedFrenet - GeomFill_IsFrenet - GeomFill_IsConstant.
") GeomFill_Pipe;
		 GeomFill_Pipe(const opencascade::handle<Geom_Curve> & Path, const opencascade::handle<Geom_Curve> & FirstSect, const GeomFill_Trihedron Option = GeomFill_IsCorrectedFrenet);

		/****** GeomFill_Pipe::GeomFill_Pipe ******/
		/****** md5 signature: 0a728fc1802aac6865c935cb6ea957ea ******/
		%feature("compactdefaultargs") GeomFill_Pipe;
		%feature("autodoc", "
Parameters
----------
Path: Geom2d_Curve
Support: Geom_Surface
FirstSect: Geom_Curve

Return
-------
None

Description
-----------
Create a pipe with a constant section (<FirstSection>) and a path defined by <Path> and <Support>.
") GeomFill_Pipe;
		 GeomFill_Pipe(const opencascade::handle<Geom2d_Curve> & Path, const opencascade::handle<Geom_Surface> & Support, const opencascade::handle<Geom_Curve> & FirstSect);

		/****** GeomFill_Pipe::GeomFill_Pipe ******/
		/****** md5 signature: 0c249401b0246b0792f11f061c787f6b ******/
		%feature("compactdefaultargs") GeomFill_Pipe;
		%feature("autodoc", "
Parameters
----------
Path: Geom_Curve
FirstSect: Geom_Curve
Dir: gp_Dir

Return
-------
None

Description
-----------
Create a pipe with a constant section (<FirstSection>) and a path <Path> and a fixed binormal direction <Dir>.
") GeomFill_Pipe;
		 GeomFill_Pipe(const opencascade::handle<Geom_Curve> & Path, const opencascade::handle<Geom_Curve> & FirstSect, const gp_Dir & Dir);

		/****** GeomFill_Pipe::GeomFill_Pipe ******/
		/****** md5 signature: 21e998388a5fd330c89065860278090b ******/
		%feature("compactdefaultargs") GeomFill_Pipe;
		%feature("autodoc", "
Parameters
----------
Path: Geom_Curve
FirstSect: Geom_Curve
LastSect: Geom_Curve

Return
-------
None

Description
-----------
Create a pipe with an evolving section The section evaluate from First to Last Section.
") GeomFill_Pipe;
		 GeomFill_Pipe(const opencascade::handle<Geom_Curve> & Path, const opencascade::handle<Geom_Curve> & FirstSect, const opencascade::handle<Geom_Curve> & LastSect);

		/****** GeomFill_Pipe::GeomFill_Pipe ******/
		/****** md5 signature: d33e1011fa11db81b148eb3e78127152 ******/
		%feature("compactdefaultargs") GeomFill_Pipe;
		%feature("autodoc", "
Parameters
----------
Path: Geom_Curve
NSections: TColGeom_SequenceOfCurve

Return
-------
None

Description
-----------
Create a pipe with N sections The section evaluate from First to Last Section.
") GeomFill_Pipe;
		 GeomFill_Pipe(const opencascade::handle<Geom_Curve> & Path, const TColGeom_SequenceOfCurve & NSections);

		/****** GeomFill_Pipe::GeomFill_Pipe ******/
		/****** md5 signature: bee87cb22c4bccd102806cb27434f59a ******/
		%feature("compactdefaultargs") GeomFill_Pipe;
		%feature("autodoc", "
Parameters
----------
Path: Geom_Curve
Curve1: Geom_Curve
Curve2: Geom_Curve
Radius: float

Return
-------
None

Description
-----------
Create a pipe with a constant radius with 2 guide-line.
") GeomFill_Pipe;
		 GeomFill_Pipe(const opencascade::handle<Geom_Curve> & Path, const opencascade::handle<Geom_Curve> & Curve1, const opencascade::handle<Geom_Curve> & Curve2, const Standard_Real Radius);

		/****** GeomFill_Pipe::GeomFill_Pipe ******/
		/****** md5 signature: 4530f1063599f6222f5a997daa03b7d8 ******/
		%feature("compactdefaultargs") GeomFill_Pipe;
		%feature("autodoc", "
Parameters
----------
Path: Adaptor3d_Curve
Curve1: Adaptor3d_Curve
Curve2: Adaptor3d_Curve
Radius: float

Return
-------
None

Description
-----------
Create a pipe with a constant radius with 2 guide-line.
") GeomFill_Pipe;
		 GeomFill_Pipe(const opencascade::handle<Adaptor3d_Curve> & Path, const opencascade::handle<Adaptor3d_Curve> & Curve1, const opencascade::handle<Adaptor3d_Curve> & Curve2, const Standard_Real Radius);

		/****** GeomFill_Pipe::GeomFill_Pipe ******/
		/****** md5 signature: 62a6afc55ea058c5a6fba97090c13c8d ******/
		%feature("compactdefaultargs") GeomFill_Pipe;
		%feature("autodoc", "
Parameters
----------
Path: Geom_Curve
Guide: Adaptor3d_Curve
FirstSect: Geom_Curve
ByACR: bool
rotat: bool

Return
-------
None

Description
-----------
Create a pipe with a constant section and with 1 guide-line. Use the function Perform to build the surface. All standard specific cases are detected in order to construct, according to the respective geometric nature of Path and the sections, a planar, cylindrical, conical, spherical or toroidal surface, a surface of linear extrusion or a surface of revolution. In the general case, the result is a BSpline surface (NURBS) built by approximation of a series of sections where: - the number of sections N is chosen automatically by the algorithm according to the respective geometries of Path and the sections. N is greater than or equal to 2; - N points Pi (with i in the range [ 1,N ]) are defined at regular intervals along the curve Path from its first point to its end point. At each point Pi, a coordinate system Ti is computed with Pi as origin, and with the tangential and normal vectors to Path defining two of its coordinate axes. In the case of a pipe with a constant circular section, the first section is a circle of radius Radius centered on the origin of Path and whose 'Z Axis' is aligned along the vector tangential to the origin of Path. In the case of a pipe with a constant section, the first section is the curve FirstSect. In these two cases, the ith section (for values of i greater than 1) is obtained by applying to a copy of this first section the geometric transformation which transforms coordinate system T1 into coordinate system Ti. In the case of an evolving section, N-2 intermediate curves Si are first computed (if N is greater than 2, and with i in the range [ 2,N-1 ]) whose geometry evolves regularly from the curve S1=FirstSect to the curve SN=LastSect. The first section is FirstSect, and the ith section (for values of i greater than 1) is obtained by applying to the curve Si the geometric transformation which transforms coordinate system T1 into coordinate system Ti.
") GeomFill_Pipe;
		 GeomFill_Pipe(const opencascade::handle<Geom_Curve> & Path, const opencascade::handle<Adaptor3d_Curve> & Guide, const opencascade::handle<Geom_Curve> & FirstSect, const Standard_Boolean ByACR, const Standard_Boolean rotat);

		/****** GeomFill_Pipe::ErrorOnSurf ******/
		/****** md5 signature: 8f3f314d7b67e1d3eba24c5bbbfc1bbe ******/
		%feature("compactdefaultargs") ErrorOnSurf;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the approximation's error. if the Surface is plane, cylinder ... this error can be 0.
") ErrorOnSurf;
		Standard_Real ErrorOnSurf();

		/****** GeomFill_Pipe::ExchangeUV ******/
		/****** md5 signature: b9b6c7f5992ff1ca7ae0d75a331ba2e9 ******/
		%feature("compactdefaultargs") ExchangeUV;
		%feature("autodoc", "Return
-------
bool

Description
-----------
The u parametric direction of the surface constructed by this algorithm usually corresponds to the evolution along the path and the v parametric direction corresponds to the evolution along the section(s). However, this rule is not respected when constructing certain specific Geom surfaces (typically cylindrical surfaces, surfaces of revolution, etc.) for which the parameterization is inversed. The ExchangeUV function checks for this, and returns true in all these specific cases. Warning Do not use this function before the surface is built.
") ExchangeUV;
		Standard_Boolean ExchangeUV();

		/****** GeomFill_Pipe::GenerateParticularCase ******/
		/****** md5 signature: aa8149250d2924b1d4e59f5e32c9e9c4 ******/
		%feature("compactdefaultargs") GenerateParticularCase;
		%feature("autodoc", "
Parameters
----------
B: bool

Return
-------
None

Description
-----------
Sets a flag to try to create as many planes, cylinder,... as possible. Default value is <Standard_False>.
") GenerateParticularCase;
		void GenerateParticularCase(const Standard_Boolean B);

		/****** GeomFill_Pipe::GenerateParticularCase ******/
		/****** md5 signature: 25ab3daf2d52dd071efed1af2e8f07fe ******/
		%feature("compactdefaultargs") GenerateParticularCase;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the flag.
") GenerateParticularCase;
		Standard_Boolean GenerateParticularCase();

		/****** GeomFill_Pipe::GetStatus ******/
		/****** md5 signature: c62c84d505dd238d67f4c6383f3266b4 ******/
		%feature("compactdefaultargs") GetStatus;
		%feature("autodoc", "Return
-------
GeomFill_PipeError

Description
-----------
Returns execution status.
") GetStatus;
		GeomFill_PipeError GetStatus();

		/****** GeomFill_Pipe::Init ******/
		/****** md5 signature: d03408a50bd75e5b4692d40387d5a32a ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
Path: Geom_Curve
Radius: float

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<Geom_Curve> & Path, const Standard_Real Radius);

		/****** GeomFill_Pipe::Init ******/
		/****** md5 signature: b88dff012b9c1655d8e30b8428e98490 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
Path: Geom_Curve
FirstSect: Geom_Curve
Option: GeomFill_Trihedron (optional, default to GeomFill_IsCorrectedFrenet)

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<Geom_Curve> & Path, const opencascade::handle<Geom_Curve> & FirstSect, const GeomFill_Trihedron Option = GeomFill_IsCorrectedFrenet);

		/****** GeomFill_Pipe::Init ******/
		/****** md5 signature: dd3854a6bba8e1f858ac6a42fe88b1f3 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
Path: Geom2d_Curve
Support: Geom_Surface
FirstSect: Geom_Curve

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<Geom2d_Curve> & Path, const opencascade::handle<Geom_Surface> & Support, const opencascade::handle<Geom_Curve> & FirstSect);

		/****** GeomFill_Pipe::Init ******/
		/****** md5 signature: 9706fb74713beb9a8067845e9f3a59ee ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
Path: Geom_Curve
FirstSect: Geom_Curve
Dir: gp_Dir

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<Geom_Curve> & Path, const opencascade::handle<Geom_Curve> & FirstSect, const gp_Dir & Dir);

		/****** GeomFill_Pipe::Init ******/
		/****** md5 signature: 95c764e9435c3ae61bdb25df43fb5a17 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
Path: Geom_Curve
FirstSect: Geom_Curve
LastSect: Geom_Curve

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<Geom_Curve> & Path, const opencascade::handle<Geom_Curve> & FirstSect, const opencascade::handle<Geom_Curve> & LastSect);

		/****** GeomFill_Pipe::Init ******/
		/****** md5 signature: 1a1e6dec3cfed294ef6c0e487fa8fa7b ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
Path: Geom_Curve
NSections: TColGeom_SequenceOfCurve

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<Geom_Curve> & Path, const TColGeom_SequenceOfCurve & NSections);

		/****** GeomFill_Pipe::Init ******/
		/****** md5 signature: 12794c57e4e9e1d3f57a21a8225d0fc9 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
Path: Adaptor3d_Curve
Curve1: Adaptor3d_Curve
Curve2: Adaptor3d_Curve
Radius: float

Return
-------
None

Description
-----------
Create a pipe with a constant radius with 2 guide-line.
") Init;
		void Init(const opencascade::handle<Adaptor3d_Curve> & Path, const opencascade::handle<Adaptor3d_Curve> & Curve1, const opencascade::handle<Adaptor3d_Curve> & Curve2, const Standard_Real Radius);

		/****** GeomFill_Pipe::Init ******/
		/****** md5 signature: d595c424249c2e943c3d6b16e9369ce8 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
Path: Geom_Curve
Guide: Adaptor3d_Curve
FirstSect: Geom_Curve
ByACR: bool
rotat: bool

Return
-------
None

Description
-----------
Initializes this pipe algorithm to build the following surface: - a pipe with a constant circular section of radius Radius along the path Path, or - a pipe with constant section FirstSect along the path Path, or - a pipe where the section evolves from FirstSect to LastSect along the path Path. Use the function Perform to build the surface. Note: a description of the resulting surface is given under Constructors.
") Init;
		void Init(const opencascade::handle<Geom_Curve> & Path, const opencascade::handle<Adaptor3d_Curve> & Guide, const opencascade::handle<Geom_Curve> & FirstSect, const Standard_Boolean ByACR, const Standard_Boolean rotat);

		/****** GeomFill_Pipe::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns whether approximation was done.
") IsDone;
		Standard_Boolean IsDone();

		/****** GeomFill_Pipe::Perform ******/
		/****** md5 signature: 6d0a57d6eb2e1596ca375a617ef63411 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
WithParameters: bool (optional, default to Standard_False)
myPolynomial: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Builds the pipe defined at the time of initialization of this algorithm. A description of the resulting surface is given under Constructors. If WithParameters (defaulted to false) is set to true, the approximation algorithm (used only in the general case of construction of a BSpline surface) builds the surface with a u parameter corresponding to the one of the path. Exceptions Standard_ConstructionError if a surface cannot be constructed from the data. Warning: It is the old Perform method, the next methode is recommended.
") Perform;
		void Perform(const Standard_Boolean WithParameters = Standard_False, const Standard_Boolean myPolynomial = Standard_False);

		/****** GeomFill_Pipe::Perform ******/
		/****** md5 signature: aca0081a2ee5f30c242a64dc111e92c1 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Tol: float
Polynomial: bool
Conti: GeomAbs_Shape (optional, default to GeomAbs_C1)
MaxDegree: int (optional, default to 11)
NbMaxSegment: int (optional, default to 30)

Return
-------
None

Description
-----------
detects the particular cases. And compute the surface. if none particular case is detected we make an approximation with respect of the Tolerance <Tol>, the continuty <Conti>, the maximum degree <MaxDegree>, the maximum number of span <NbMaxSegment> and the spine parametrization. If we can't create a surface with the data.
") Perform;
		void Perform(const Standard_Real Tol, const Standard_Boolean Polynomial, const GeomAbs_Shape Conti = GeomAbs_C1, const Standard_Integer MaxDegree = 11, const Standard_Integer NbMaxSegment = 30);

		/****** GeomFill_Pipe::Surface ******/
		/****** md5 signature: a469e18cbceeb351572a461f96ff0f4d ******/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Surface>

Description
-----------
Returns the surface built by this algorithm. Warning Do not use this function before the surface is built (in this case the function will return a null handle).
") Surface;
		const opencascade::handle<Geom_Surface> & Surface();

};


%extend GeomFill_Pipe {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class GeomFill_PlanFunc *
**************************/
class GeomFill_PlanFunc : public math_FunctionWithDerivative {
	public:
		/****** GeomFill_PlanFunc::GeomFill_PlanFunc ******/
		/****** md5 signature: d2111f7e04703bf5d8e4b88603c7da47 ******/
		%feature("compactdefaultargs") GeomFill_PlanFunc;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
V: gp_Vec
C: Adaptor3d_Curve

Return
-------
None

Description
-----------
No available documentation.
") GeomFill_PlanFunc;
		 GeomFill_PlanFunc(const gp_Pnt & P, const gp_Vec & V, const opencascade::handle<Adaptor3d_Curve> & C);

		/****** GeomFill_PlanFunc::D2 ******/
		/****** md5 signature: 3593cd3677dd66060bb00c05ef08ee1e ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
X: float

Return
-------
F: float
D1: float
D2: float

Description
-----------
No available documentation.
") D2;
		void D2(const Standard_Real X, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** GeomFill_PlanFunc::D2E ******/
		/****** md5 signature: 0d2ec6b4f7dc96e9de72b64afa69ab3d ******/
		%feature("compactdefaultargs") D2E;
		%feature("autodoc", "
Parameters
----------
X: float
DP: gp_Vec
D2P: gp_Vec
DV: gp_Vec
D2V: gp_Vec

Return
-------
DFDT: float
D2FDT2: float
D2FDTDX: float

Description
-----------
No available documentation.
") D2E;
		void D2E(const Standard_Real X, const gp_Vec & DP, const gp_Vec & D2P, const gp_Vec & DV, const gp_Vec & D2V, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** GeomFill_PlanFunc::DEDT ******/
		/****** md5 signature: f8ffb48842950ca5a73c35193856f25e ******/
		%feature("compactdefaultargs") DEDT;
		%feature("autodoc", "
Parameters
----------
X: float
DP: gp_Vec
DV: gp_Vec

Return
-------
DF: float

Description
-----------
No available documentation.
") DEDT;
		void DEDT(const Standard_Real X, const gp_Vec & DP, const gp_Vec & DV, Standard_Real &OutValue);

		/****** GeomFill_PlanFunc::Derivative ******/
		/****** md5 signature: db0dcd567f64073c6f81e974e7fd2624 ******/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "
Parameters
----------
X: float

Return
-------
D: float

Description
-----------
computes the derivative <D> of the function for the variable <X>. Returns True if the calculation were successfully done, False otherwise.
") Derivative;
		virtual Standard_Boolean Derivative(const Standard_Real X, Standard_Real &OutValue);

		/****** GeomFill_PlanFunc::Value ******/
		/****** md5 signature: 15617dca721c4472bfb7ee7933f04bce ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
X: float

Return
-------
F: float

Description
-----------
computes the value <F>of the function for the variable <X>. Returns True if the calculation were successfully done, False otherwise.
") Value;
		virtual Standard_Boolean Value(const Standard_Real X, Standard_Real &OutValue);

		/****** GeomFill_PlanFunc::Values ******/
		/****** md5 signature: 6f2163d9b7f09d24e575a61101ce4492 ******/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "
Parameters
----------
X: float

Return
-------
F: float
D: float

Description
-----------
computes the value <F> and the derivative <D> of the function for the variable <X>. Returns True if the calculation were successfully done, False otherwise.
") Values;
		virtual Standard_Boolean Values(const Standard_Real X, Standard_Real &OutValue, Standard_Real &OutValue);

};


%extend GeomFill_PlanFunc {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class GeomFill_PolynomialConvertor *
*************************************/
class GeomFill_PolynomialConvertor {
	public:
		/****** GeomFill_PolynomialConvertor::GeomFill_PolynomialConvertor ******/
		/****** md5 signature: ee753b2a7ff11205a515831d90f0a487 ******/
		%feature("compactdefaultargs") GeomFill_PolynomialConvertor;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") GeomFill_PolynomialConvertor;
		 GeomFill_PolynomialConvertor();

		/****** GeomFill_PolynomialConvertor::Init ******/
		/****** md5 signature: 0de93ef32c53d091768788dca0e281fd ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init();

		/****** GeomFill_PolynomialConvertor::Initialized ******/
		/****** md5 signature: 54566042fad9d35dc02b275e9a7893f4 ******/
		%feature("compactdefaultargs") Initialized;
		%feature("autodoc", "Return
-------
bool

Description
-----------
say if <self> is Initialized.
") Initialized;
		Standard_Boolean Initialized();

		/****** GeomFill_PolynomialConvertor::Section ******/
		/****** md5 signature: 1595f7a23eaa9457c3afbcaa7893b4ed ******/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "
Parameters
----------
FirstPnt: gp_Pnt
Center: gp_Pnt
Dir: gp_Vec
Angle: float
Poles: TColgp_Array1OfPnt

Return
-------
None

Description
-----------
No available documentation.
") Section;
		void Section(const gp_Pnt & FirstPnt, const gp_Pnt & Center, const gp_Vec & Dir, const Standard_Real Angle, TColgp_Array1OfPnt & Poles);

		/****** GeomFill_PolynomialConvertor::Section ******/
		/****** md5 signature: ec8a210042d92172d84213435013a438 ******/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "
Parameters
----------
FirstPnt: gp_Pnt
DFirstPnt: gp_Vec
Center: gp_Pnt
DCenter: gp_Vec
Dir: gp_Vec
DDir: gp_Vec
Angle: float
DAngle: float
Poles: TColgp_Array1OfPnt
DPoles: TColgp_Array1OfVec

Return
-------
None

Description
-----------
No available documentation.
") Section;
		void Section(const gp_Pnt & FirstPnt, const gp_Vec & DFirstPnt, const gp_Pnt & Center, const gp_Vec & DCenter, const gp_Vec & Dir, const gp_Vec & DDir, const Standard_Real Angle, const Standard_Real DAngle, TColgp_Array1OfPnt & Poles, TColgp_Array1OfVec & DPoles);

		/****** GeomFill_PolynomialConvertor::Section ******/
		/****** md5 signature: 3b65c9fc21cb71775c8b8c832946e6f3 ******/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "
Parameters
----------
FirstPnt: gp_Pnt
DFirstPnt: gp_Vec
D2FirstPnt: gp_Vec
Center: gp_Pnt
DCenter: gp_Vec
D2Center: gp_Vec
Dir: gp_Vec
DDir: gp_Vec
D2Dir: gp_Vec
Angle: float
DAngle: float
D2Angle: float
Poles: TColgp_Array1OfPnt
DPoles: TColgp_Array1OfVec
D2Poles: TColgp_Array1OfVec

Return
-------
None

Description
-----------
No available documentation.
") Section;
		void Section(const gp_Pnt & FirstPnt, const gp_Vec & DFirstPnt, const gp_Vec & D2FirstPnt, const gp_Pnt & Center, const gp_Vec & DCenter, const gp_Vec & D2Center, const gp_Vec & Dir, const gp_Vec & DDir, const gp_Vec & D2Dir, const Standard_Real Angle, const Standard_Real DAngle, const Standard_Real D2Angle, TColgp_Array1OfPnt & Poles, TColgp_Array1OfVec & DPoles, TColgp_Array1OfVec & D2Poles);

};


%extend GeomFill_PolynomialConvertor {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class GeomFill_Profiler *
**************************/
class GeomFill_Profiler {
	public:
		/****** GeomFill_Profiler::GeomFill_Profiler ******/
		/****** md5 signature: f2c7a9b80da515f2c466a31f1c6d230f ******/
		%feature("compactdefaultargs") GeomFill_Profiler;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") GeomFill_Profiler;
		 GeomFill_Profiler();

		/****** GeomFill_Profiler::AddCurve ******/
		/****** md5 signature: 11c20dbcd749bd2a76890d8d6a6be7ae ******/
		%feature("compactdefaultargs") AddCurve;
		%feature("autodoc", "
Parameters
----------
Curve: Geom_Curve

Return
-------
None

Description
-----------
No available documentation.
") AddCurve;
		void AddCurve(const opencascade::handle<Geom_Curve> & Curve);

		/****** GeomFill_Profiler::Curve ******/
		/****** md5 signature: 684e9a3c11b3f249343e6a914ac640ee ******/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
opencascade::handle<Geom_Curve>

Description
-----------
No available documentation.
") Curve;
		const opencascade::handle<Geom_Curve> & Curve(const Standard_Integer Index);

		/****** GeomFill_Profiler::Degree ******/
		/****** md5 signature: e3276df1ce733e2c8e940db548a26d03 ******/
		%feature("compactdefaultargs") Degree;
		%feature("autodoc", "Return
-------
int

Description
-----------
Raises if not yet perform.
") Degree;
		Standard_Integer Degree();

		/****** GeomFill_Profiler::IsPeriodic ******/
		/****** md5 signature: 62d7f554b0b7785e1f3919569dfbc68f ******/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsPeriodic;
		Standard_Boolean IsPeriodic();

		/****** GeomFill_Profiler::KnotsAndMults ******/
		/****** md5 signature: 19787aa39b0400d3a08b5785b90459e8 ******/
		%feature("compactdefaultargs") KnotsAndMults;
		%feature("autodoc", "
Parameters
----------
Knots: TColStd_Array1OfReal
Mults: TColStd_Array1OfInteger

Return
-------
None

Description
-----------
Raises if not yet perform Raises if the lengths of <Knots> and <Mults> are not equal to NbKnots().
") KnotsAndMults;
		void KnotsAndMults(TColStd_Array1OfReal & Knots, TColStd_Array1OfInteger & Mults);

		/****** GeomFill_Profiler::NbKnots ******/
		/****** md5 signature: ccda669299f8eba1ba0d3387af4c950e ******/
		%feature("compactdefaultargs") NbKnots;
		%feature("autodoc", "Return
-------
int

Description
-----------
Raises if not yet perform.
") NbKnots;
		Standard_Integer NbKnots();

		/****** GeomFill_Profiler::NbPoles ******/
		/****** md5 signature: 9a7d6d5f8a21c5833786e951bce99604 ******/
		%feature("compactdefaultargs") NbPoles;
		%feature("autodoc", "Return
-------
int

Description
-----------
Raises if not yet perform.
") NbPoles;
		Standard_Integer NbPoles();

		/****** GeomFill_Profiler::Perform ******/
		/****** md5 signature: 190ae4aa2767ac61fd4fd06132b62d02 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
PTol: float

Return
-------
None

Description
-----------
Converts all curves to BSplineCurves. Set them to the common profile. <PTol> is used to compare 2 knots.
") Perform;
		virtual void Perform(const Standard_Real PTol);

		/****** GeomFill_Profiler::Poles ******/
		/****** md5 signature: 66d6e30649c8a0a21c5831aa2eb82d30 ******/
		%feature("compactdefaultargs") Poles;
		%feature("autodoc", "
Parameters
----------
Index: int
Poles: TColgp_Array1OfPnt

Return
-------
None

Description
-----------
returns in <Poles> the poles of the BSplineCurve from index <Index> adjusting to the current profile. Raises if not yet perform Raises if <Index> not in the range [1,NbCurves] if the length of <Poles> is not equal to NbPoles().
") Poles;
		void Poles(const Standard_Integer Index, TColgp_Array1OfPnt & Poles);

		/****** GeomFill_Profiler::Weights ******/
		/****** md5 signature: ccaae2145009995024e15db4b294fc35 ******/
		%feature("compactdefaultargs") Weights;
		%feature("autodoc", "
Parameters
----------
Index: int
Weights: TColStd_Array1OfReal

Return
-------
None

Description
-----------
returns in <Weights> the weights of the BSplineCurve from index <Index> adjusting to the current profile. Raises if not yet perform Raises if <Index> not in the range [1,NbCurves] or if the length of <Weights> is not equal to NbPoles().
") Weights;
		void Weights(const Standard_Integer Index, TColStd_Array1OfReal & Weights);

};


%extend GeomFill_Profiler {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************
* class GeomFill_QuasiAngularConvertor *
***************************************/
class GeomFill_QuasiAngularConvertor {
	public:
		/****** GeomFill_QuasiAngularConvertor::GeomFill_QuasiAngularConvertor ******/
		/****** md5 signature: 1cc1111b9d2a6695b2f123ffc4cf75f3 ******/
		%feature("compactdefaultargs") GeomFill_QuasiAngularConvertor;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") GeomFill_QuasiAngularConvertor;
		 GeomFill_QuasiAngularConvertor();

		/****** GeomFill_QuasiAngularConvertor::Init ******/
		/****** md5 signature: 0de93ef32c53d091768788dca0e281fd ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init();

		/****** GeomFill_QuasiAngularConvertor::Initialized ******/
		/****** md5 signature: 54566042fad9d35dc02b275e9a7893f4 ******/
		%feature("compactdefaultargs") Initialized;
		%feature("autodoc", "Return
-------
bool

Description
-----------
say if <self> is Initialized.
") Initialized;
		Standard_Boolean Initialized();

		/****** GeomFill_QuasiAngularConvertor::Section ******/
		/****** md5 signature: 90bd2cc2c9a5b6ae2fba3dd58381e760 ******/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "
Parameters
----------
FirstPnt: gp_Pnt
Center: gp_Pnt
Dir: gp_Vec
Angle: float
Poles: TColgp_Array1OfPnt
Weights: TColStd_Array1OfReal

Return
-------
None

Description
-----------
No available documentation.
") Section;
		void Section(const gp_Pnt & FirstPnt, const gp_Pnt & Center, const gp_Vec & Dir, const Standard_Real Angle, TColgp_Array1OfPnt & Poles, TColStd_Array1OfReal & Weights);

		/****** GeomFill_QuasiAngularConvertor::Section ******/
		/****** md5 signature: bf838dcc8ca8bb48e4e3083dbbf9d136 ******/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "
Parameters
----------
FirstPnt: gp_Pnt
DFirstPnt: gp_Vec
Center: gp_Pnt
DCenter: gp_Vec
Dir: gp_Vec
DDir: gp_Vec
Angle: float
DAngle: float
Poles: TColgp_Array1OfPnt
DPoles: TColgp_Array1OfVec
Weights: TColStd_Array1OfReal
DWeights: TColStd_Array1OfReal

Return
-------
None

Description
-----------
No available documentation.
") Section;
		void Section(const gp_Pnt & FirstPnt, const gp_Vec & DFirstPnt, const gp_Pnt & Center, const gp_Vec & DCenter, const gp_Vec & Dir, const gp_Vec & DDir, const Standard_Real Angle, const Standard_Real DAngle, TColgp_Array1OfPnt & Poles, TColgp_Array1OfVec & DPoles, TColStd_Array1OfReal & Weights, TColStd_Array1OfReal & DWeights);

		/****** GeomFill_QuasiAngularConvertor::Section ******/
		/****** md5 signature: fe6e5b059717f9ab3a642382d42feeea ******/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "
Parameters
----------
FirstPnt: gp_Pnt
DFirstPnt: gp_Vec
D2FirstPnt: gp_Vec
Center: gp_Pnt
DCenter: gp_Vec
D2Center: gp_Vec
Dir: gp_Vec
DDir: gp_Vec
D2Dir: gp_Vec
Angle: float
DAngle: float
D2Angle: float
Poles: TColgp_Array1OfPnt
DPoles: TColgp_Array1OfVec
D2Poles: TColgp_Array1OfVec
Weights: TColStd_Array1OfReal
DWeights: TColStd_Array1OfReal
D2Weights: TColStd_Array1OfReal

Return
-------
None

Description
-----------
No available documentation.
") Section;
		void Section(const gp_Pnt & FirstPnt, const gp_Vec & DFirstPnt, const gp_Vec & D2FirstPnt, const gp_Pnt & Center, const gp_Vec & DCenter, const gp_Vec & D2Center, const gp_Vec & Dir, const gp_Vec & DDir, const gp_Vec & D2Dir, const Standard_Real Angle, const Standard_Real DAngle, const Standard_Real D2Angle, TColgp_Array1OfPnt & Poles, TColgp_Array1OfVec & DPoles, TColgp_Array1OfVec & D2Poles, TColStd_Array1OfReal & Weights, TColStd_Array1OfReal & DWeights, TColStd_Array1OfReal & D2Weights);

};


%extend GeomFill_QuasiAngularConvertor {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class GeomFill_SectionLaw *
****************************/
%nodefaultctor GeomFill_SectionLaw;
class GeomFill_SectionLaw : public Standard_Transient {
	public:
		/****** GeomFill_SectionLaw::BSplineSurface ******/
		/****** md5 signature: b51703ac160c5002a0ad431d9cf0e55c ******/
		%feature("compactdefaultargs") BSplineSurface;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_BSplineSurface>

Description
-----------
give if possible an bspline Surface, like iso-v are the section. If it is not possible this methode have to get an Null Surface. It is the default implementation.
") BSplineSurface;
		virtual opencascade::handle<Geom_BSplineSurface> BSplineSurface();

		/****** GeomFill_SectionLaw::BarycentreOfSurf ******/
		/****** md5 signature: cbc6eaf5619edbfc0f2839466f8de856 ******/
		%feature("compactdefaultargs") BarycentreOfSurf;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Get the barycentre of Surface. An very poor estimation is sufficient. This information is useful to perform well conditioned rational approximation. Warning: Used only if <self> IsRational.
") BarycentreOfSurf;
		virtual gp_Pnt BarycentreOfSurf();

		/****** GeomFill_SectionLaw::CirclSection ******/
		/****** md5 signature: ac51174d3b9979dabe76e219f49bf427 ******/
		%feature("compactdefaultargs") CirclSection;
		%feature("autodoc", "
Parameters
----------
Param: float

Return
-------
opencascade::handle<Geom_Curve>

Description
-----------
Return the circle section at parameter <Param>, if <self> a IsConicalLaw.
") CirclSection;
		virtual opencascade::handle<Geom_Curve> CirclSection(const Standard_Real Param);

		/****** GeomFill_SectionLaw::ConstantSection ******/
		/****** md5 signature: 295eba02ad0b95a48fd7857d1d41877a ******/
		%feature("compactdefaultargs") ConstantSection;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Curve>

Description
-----------
Return a copy of the constant Section, if me IsConstant.
") ConstantSection;
		virtual opencascade::handle<Geom_Curve> ConstantSection();

		/****** GeomFill_SectionLaw::D0 ******/
		/****** md5 signature: eaa73c1de6c91beab5d6772f732020d6 ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
Param: float
Poles: TColgp_Array1OfPnt
Weigths: TColStd_Array1OfReal

Return
-------
bool

Description
-----------
compute the section for v = param.
") D0;
		virtual Standard_Boolean D0(const Standard_Real Param, TColgp_Array1OfPnt & Poles, TColStd_Array1OfReal & Weigths);

		/****** GeomFill_SectionLaw::D1 ******/
		/****** md5 signature: e3c6434afb03815d368e10617d5a7f5b ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
Param: float
Poles: TColgp_Array1OfPnt
DPoles: TColgp_Array1OfVec
Weigths: TColStd_Array1OfReal
DWeigths: TColStd_Array1OfReal

Return
-------
bool

Description
-----------
compute the first derivative in v direction of the section for v = param Warning: It used only for C1 or C2 approximation.
") D1;
		virtual Standard_Boolean D1(const Standard_Real Param, TColgp_Array1OfPnt & Poles, TColgp_Array1OfVec & DPoles, TColStd_Array1OfReal & Weigths, TColStd_Array1OfReal & DWeigths);

		/****** GeomFill_SectionLaw::D2 ******/
		/****** md5 signature: 8e60d2fe6644e0ec8d5c8468e973d40c ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
Param: float
Poles: TColgp_Array1OfPnt
DPoles: TColgp_Array1OfVec
D2Poles: TColgp_Array1OfVec
Weigths: TColStd_Array1OfReal
DWeigths: TColStd_Array1OfReal
D2Weigths: TColStd_Array1OfReal

Return
-------
bool

Description
-----------
compute the second derivative in v direction of the section for v = param Warning: It used only for C2 approximation.
") D2;
		virtual Standard_Boolean D2(const Standard_Real Param, TColgp_Array1OfPnt & Poles, TColgp_Array1OfVec & DPoles, TColgp_Array1OfVec & D2Poles, TColStd_Array1OfReal & Weigths, TColStd_Array1OfReal & DWeigths, TColStd_Array1OfReal & D2Weigths);

		/****** GeomFill_SectionLaw::GetDomain ******/
		/****** md5 signature: cf4b59a00ac748986e419ee48c8333d6 ******/
		%feature("compactdefaultargs") GetDomain;
		%feature("autodoc", "
Parameters
----------

Return
-------
First: float
Last: float

Description
-----------
Gets the bounds of the function parametric domain. Warning: This domain it is not modified by the SetValue method.
") GetDomain;
		virtual void GetDomain(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** GeomFill_SectionLaw::GetInterval ******/
		/****** md5 signature: a17748ec1150378c402b1599113effd4 ******/
		%feature("compactdefaultargs") GetInterval;
		%feature("autodoc", "
Parameters
----------

Return
-------
First: float
Last: float

Description
-----------
Gets the bounds of the parametric interval on the function.
") GetInterval;
		virtual void GetInterval(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** GeomFill_SectionLaw::GetMinimalWeight ******/
		/****** md5 signature: 6fdd12d5da1669c5217b9449c91c0d9e ******/
		%feature("compactdefaultargs") GetMinimalWeight;
		%feature("autodoc", "
Parameters
----------
Weigths: TColStd_Array1OfReal

Return
-------
None

Description
-----------
Compute the minimal value of weight for each poles in all sections. This information is useful to control error in rational approximation. Warning: Used only if <self> IsRational.
") GetMinimalWeight;
		virtual void GetMinimalWeight(TColStd_Array1OfReal & Weigths);

		/****** GeomFill_SectionLaw::GetTolerance ******/
		/****** md5 signature: 1096196f89d9fc10f33e62e0d43284fe ******/
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "
Parameters
----------
BoundTol: float
SurfTol: float
AngleTol: float
Tol3d: TColStd_Array1OfReal

Return
-------
None

Description
-----------
Returns the tolerances associated at each poles to reach in approximation, to satisfy: BoundTol error at the Boundary AngleTol tangent error at the Boundary (in radian) SurfTol error inside the surface.
") GetTolerance;
		virtual void GetTolerance(const Standard_Real BoundTol, const Standard_Real SurfTol, const Standard_Real AngleTol, TColStd_Array1OfReal & Tol3d);

		/****** GeomFill_SectionLaw::Intervals ******/
		/****** md5 signature: 7d2bf038a9213acf1609cc1244a3ee03 ******/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "
Parameters
----------
T: TColStd_Array1OfReal
S: GeomAbs_Shape

Return
-------
None

Description
-----------
Stores in <T> the parameters bounding the intervals of continuity <S>. //! The array must provide enough room to accommodate for the parameters. i.e. T.Length() > NbIntervals().
") Intervals;
		virtual void Intervals(TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****** GeomFill_SectionLaw::IsConicalLaw ******/
		/****** md5 signature: 1abaa4ece9c4b4d441420168b7911bfc ******/
		%feature("compactdefaultargs") IsConicalLaw;
		%feature("autodoc", "
Parameters
----------

Return
-------
Error: float

Description
-----------
Returns True if all section are circle, with same plane,same center and linear radius evolution Return False by Default.
") IsConicalLaw;
		virtual Standard_Boolean IsConicalLaw(Standard_Real &OutValue);

		/****** GeomFill_SectionLaw::IsConstant ******/
		/****** md5 signature: 2bee4baf834a2f08caa73a2fd5e7286c ******/
		%feature("compactdefaultargs") IsConstant;
		%feature("autodoc", "
Parameters
----------

Return
-------
Error: float

Description
-----------
Say if all sections are equals.
") IsConstant;
		virtual Standard_Boolean IsConstant(Standard_Real &OutValue);

		/****** GeomFill_SectionLaw::IsRational ******/
		/****** md5 signature: e2d546fe827c13e22032dacc2ce90819 ******/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns if the sections are rational or not.
") IsRational;
		virtual Standard_Boolean IsRational();

		/****** GeomFill_SectionLaw::IsUPeriodic ******/
		/****** md5 signature: 7581170790b0f02294b3a98c2ef39654 ******/
		%feature("compactdefaultargs") IsUPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns if the sections are periodic or not.
") IsUPeriodic;
		virtual Standard_Boolean IsUPeriodic();

		/****** GeomFill_SectionLaw::IsVPeriodic ******/
		/****** md5 signature: 157f80ff35b8cd25014f915c1fea4793 ******/
		%feature("compactdefaultargs") IsVPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns if law is periodic or not.
") IsVPeriodic;
		virtual Standard_Boolean IsVPeriodic();

		/****** GeomFill_SectionLaw::Knots ******/
		/****** md5 signature: 7e71a376fdfa4fc27638b1b7f6f203bb ******/
		%feature("compactdefaultargs") Knots;
		%feature("autodoc", "
Parameters
----------
TKnots: TColStd_Array1OfReal

Return
-------
None

Description
-----------
get the Knots of the section.
") Knots;
		virtual void Knots(TColStd_Array1OfReal & TKnots);

		/****** GeomFill_SectionLaw::MaximalSection ******/
		/****** md5 signature: 138e071f49741ba955ed2185c4c8ab9f ******/
		%feature("compactdefaultargs") MaximalSection;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the length of the greater section. This information is useful to G1's control. Warning: With an little value, approximation can be slower.
") MaximalSection;
		virtual Standard_Real MaximalSection();

		/****** GeomFill_SectionLaw::Mults ******/
		/****** md5 signature: d5fb3b1381d15914585fd7e6e0eafecb ******/
		%feature("compactdefaultargs") Mults;
		%feature("autodoc", "
Parameters
----------
TMults: TColStd_Array1OfInteger

Return
-------
None

Description
-----------
get the Multplicities of the section.
") Mults;
		virtual void Mults(TColStd_Array1OfInteger & TMults);

		/****** GeomFill_SectionLaw::NbIntervals ******/
		/****** md5 signature: cb7f68d4b2c30f29cd5ba6f81443d314 ******/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "
Parameters
----------
S: GeomAbs_Shape

Return
-------
int

Description
-----------
Returns the number of intervals for continuity <S>. May be one if Continuity(me) >= <S>.
") NbIntervals;
		virtual Standard_Integer NbIntervals(const GeomAbs_Shape S);

		/****** GeomFill_SectionLaw::SectionShape ******/
		/****** md5 signature: 2709d0545e048eec44ae3de66392188f ******/
		%feature("compactdefaultargs") SectionShape;
		%feature("autodoc", "
Parameters
----------

Return
-------
NbPoles: int
NbKnots: int
Degree: int

Description
-----------
get the format of an section.
") SectionShape;
		virtual void SectionShape(Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****** GeomFill_SectionLaw::SetInterval ******/
		/****** md5 signature: 0547f3a9c04c5f6c0363c26295b2e795 ******/
		%feature("compactdefaultargs") SetInterval;
		%feature("autodoc", "
Parameters
----------
First: float
Last: float

Return
-------
None

Description
-----------
Sets the bounds of the parametric interval on the function This determines the derivatives in these values if the function is not Cn.
") SetInterval;
		virtual void SetInterval(const Standard_Real First, const Standard_Real Last);

		/****** GeomFill_SectionLaw::SetTolerance ******/
		/****** md5 signature: 1565024762efa75936883ee9558fa99d ******/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "
Parameters
----------
Tol3d: float
Tol2d: float

Return
-------
None

Description
-----------
Is useful, if (me) have to run numerical algorithm to perform D0, D1 or D2 The default implementation make nothing.
") SetTolerance;
		virtual void SetTolerance(const Standard_Real Tol3d, const Standard_Real Tol2d);

};


%make_alias(GeomFill_SectionLaw)

%extend GeomFill_SectionLaw {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class GeomFill_SectionPlacement *
**********************************/
class GeomFill_SectionPlacement {
	public:
		/****** GeomFill_SectionPlacement::GeomFill_SectionPlacement ******/
		/****** md5 signature: ced25f171c3a20926362a90337aa6c13 ******/
		%feature("compactdefaultargs") GeomFill_SectionPlacement;
		%feature("autodoc", "
Parameters
----------
L: GeomFill_LocationLaw
Section: Geom_Geometry

Return
-------
None

Description
-----------
No available documentation.
") GeomFill_SectionPlacement;
		 GeomFill_SectionPlacement(const opencascade::handle<GeomFill_LocationLaw> & L, const opencascade::handle<Geom_Geometry> & Section);

		/****** GeomFill_SectionPlacement::Angle ******/
		/****** md5 signature: dce50192c350c43b54f2e88e94e5372a ******/
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") Angle;
		Standard_Real Angle();

		/****** GeomFill_SectionPlacement::Distance ******/
		/****** md5 signature: c054352e1b604c83d759bc4ccf6c526d ******/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") Distance;
		Standard_Real Distance();

		/****** GeomFill_SectionPlacement::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsDone;
		Standard_Boolean IsDone();

		/****** GeomFill_SectionPlacement::ModifiedSection ******/
		/****** md5 signature: d50774cace5784c6bcc30e9f082ed831 ******/
		%feature("compactdefaultargs") ModifiedSection;
		%feature("autodoc", "
Parameters
----------
WithTranslation: bool

Return
-------
opencascade::handle<Geom_Curve>

Description
-----------
Compute the Section, in the coordinate system given by the Location Law. To have the Normal to section equal to the Location Law Normal. If <WithTranslation> contact between <Section> and <Path> is forced.
") ModifiedSection;
		opencascade::handle<Geom_Curve> ModifiedSection(const Standard_Boolean WithTranslation);

		/****** GeomFill_SectionPlacement::ParameterOnPath ******/
		/****** md5 signature: a4a06b5cfcc62ace4862e77e5e07ee7d ******/
		%feature("compactdefaultargs") ParameterOnPath;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") ParameterOnPath;
		Standard_Real ParameterOnPath();

		/****** GeomFill_SectionPlacement::ParameterOnSection ******/
		/****** md5 signature: d63193b90bace979eb3a78d341ba60bb ******/
		%feature("compactdefaultargs") ParameterOnSection;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") ParameterOnSection;
		Standard_Real ParameterOnSection();

		/****** GeomFill_SectionPlacement::Perform ******/
		/****** md5 signature: ef21d92cc56ea9fb08a6295512a1f679 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Tol: float

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const Standard_Real Tol);

		/****** GeomFill_SectionPlacement::Perform ******/
		/****** md5 signature: 323bd7995787fb3c31cb6a2a0269c1cc ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Path: Adaptor3d_Curve
Tol: float

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const opencascade::handle<Adaptor3d_Curve> & Path, const Standard_Real Tol);

		/****** GeomFill_SectionPlacement::Perform ******/
		/****** md5 signature: 1247c2342803e8af98196331e0da37ff ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
ParamOnPath: float
Tol: float

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const Standard_Real ParamOnPath, const Standard_Real Tol);

		/****** GeomFill_SectionPlacement::Section ******/
		/****** md5 signature: 06d8ebfd837653e5db544efc38571dc8 ******/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "
Parameters
----------
WithTranslation: bool

Return
-------
opencascade::handle<Geom_Curve>

Description
-----------
Compute the Section, in the coordinate system given by the Location Law. If <WithTranslation> contact between <Section> and <Path> is forced.
") Section;
		opencascade::handle<Geom_Curve> Section(const Standard_Boolean WithTranslation);

		/****** GeomFill_SectionPlacement::SetLocation ******/
		/****** md5 signature: bb75da6b01c89ab382627f3ab60412e1 ******/
		%feature("compactdefaultargs") SetLocation;
		%feature("autodoc", "
Parameters
----------
L: GeomFill_LocationLaw

Return
-------
None

Description
-----------
To change the section Law.
") SetLocation;
		void SetLocation(const opencascade::handle<GeomFill_LocationLaw> & L);

		/****** GeomFill_SectionPlacement::Transformation ******/
		/****** md5 signature: 868f10efc437c37220d49de0dc80a297 ******/
		%feature("compactdefaultargs") Transformation;
		%feature("autodoc", "
Parameters
----------
WithTranslation: bool
WithCorrection: bool (optional, default to Standard_False)

Return
-------
gp_Trsf

Description
-----------
No available documentation.
") Transformation;
		gp_Trsf Transformation(const Standard_Boolean WithTranslation, const Standard_Boolean WithCorrection = Standard_False);

};


%extend GeomFill_SectionPlacement {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class GeomFill_SnglrFunc *
***************************/
class GeomFill_SnglrFunc : public Adaptor3d_Curve {
	public:
		/****** GeomFill_SnglrFunc::GeomFill_SnglrFunc ******/
		/****** md5 signature: 11e312347af8bf4b41690fc0fcf50e44 ******/
		%feature("compactdefaultargs") GeomFill_SnglrFunc;
		%feature("autodoc", "
Parameters
----------
HC: Adaptor3d_Curve

Return
-------
None

Description
-----------
No available documentation.
") GeomFill_SnglrFunc;
		 GeomFill_SnglrFunc(const opencascade::handle<Adaptor3d_Curve> & HC);

		/****** GeomFill_SnglrFunc::D0 ******/
		/****** md5 signature: 5f7d08d8d17afc516aac9ef64bf9711f ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
U: float
P: gp_Pnt

Return
-------
None

Description
-----------
Computes the point of parameter U on the curve.
") D0;
		void D0(const Standard_Real U, gp_Pnt & P);

		/****** GeomFill_SnglrFunc::D1 ******/
		/****** md5 signature: 1dc830ec49a945a61cde5e5c027b78d7 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
U: float
P: gp_Pnt
V: gp_Vec

Return
-------
None

Description
-----------
Computes the point of parameter U on the curve with its first derivative. Raised if the continuity of the current interval is not C1.
") D1;
		void D1(const Standard_Real U, gp_Pnt & P, gp_Vec & V);

		/****** GeomFill_SnglrFunc::D2 ******/
		/****** md5 signature: a694b4ba68c0fd83fbac79f945cb5d8c ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
U: float
P: gp_Pnt
V1: gp_Vec
V2: gp_Vec

Return
-------
None

Description
-----------
Returns the point P of parameter U, the first and second derivatives V1 and V2. Raised if the continuity of the current interval is not C2.
") D2;
		void D2(const Standard_Real U, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2);

		/****** GeomFill_SnglrFunc::D3 ******/
		/****** md5 signature: cf1c3b5fe7af9d5c183c1b16b21c43f1 ******/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "
Parameters
----------
U: float
P: gp_Pnt
V1: gp_Vec
V2: gp_Vec
V3: gp_Vec

Return
-------
None

Description
-----------
Returns the point P of parameter U, the first, the second and the third derivative. Raised if the continuity of the current interval is not C1.
") D3;
		void D3(const Standard_Real U, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2, gp_Vec & V3);

		/****** GeomFill_SnglrFunc::DN ******/
		/****** md5 signature: 0d4a3e2fc2b4b03d2a49e0796a487efb ******/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "
Parameters
----------
U: float
N: int

Return
-------
gp_Vec

Description
-----------
The returned vector gives the value of the derivative for the order of derivation N. Raised if N < 1.
") DN;
		gp_Vec DN(const Standard_Real U, const Standard_Integer N);

		/****** GeomFill_SnglrFunc::FirstParameter ******/
		/****** md5 signature: eb9ebe94572bd67588fe8811eac261fb ******/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") FirstParameter;
		Standard_Real FirstParameter();

		/****** GeomFill_SnglrFunc::GetType ******/
		/****** md5 signature: 0ad61dcbb5497908c1b536e766f0fcb9 ******/
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "Return
-------
GeomAbs_CurveType

Description
-----------
Returns the type of the curve in the current interval: Line, Circle, Ellipse, Hyperbola, Parabola, BezierCurve, BSplineCurve, OtherCurve.
") GetType;
		GeomAbs_CurveType GetType();

		/****** GeomFill_SnglrFunc::Intervals ******/
		/****** md5 signature: fc573cb56cf1a9c05ee189fd913ff6f5 ******/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "
Parameters
----------
T: TColStd_Array1OfReal
S: GeomAbs_Shape

Return
-------
None

Description
-----------
Stores in <T> the parameters bounding the intervals of continuity <S>. //! The array must provide enough room to accommodate for the parameters. i.e. T.Length() > NbIntervals().
") Intervals;
		void Intervals(TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****** GeomFill_SnglrFunc::IsPeriodic ******/
		/****** md5 signature: 15e3ccfd3ad4ae42959489f7f64aa8ca ******/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsPeriodic;
		Standard_Boolean IsPeriodic();

		/****** GeomFill_SnglrFunc::LastParameter ******/
		/****** md5 signature: cb4925a2d4a451ceec8f6ad486530f9c ******/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") LastParameter;
		Standard_Real LastParameter();

		/****** GeomFill_SnglrFunc::NbIntervals ******/
		/****** md5 signature: 8ce4f61bff96d1ce0784028b47edd8dc ******/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "
Parameters
----------
S: GeomAbs_Shape

Return
-------
int

Description
-----------
Returns the number of intervals for continuity <S>. May be one if Continuity(me) >= <S>.
") NbIntervals;
		Standard_Integer NbIntervals(const GeomAbs_Shape S);

		/****** GeomFill_SnglrFunc::Period ******/
		/****** md5 signature: 88909a321398632744c0d6841580c626 ******/
		%feature("compactdefaultargs") Period;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") Period;
		Standard_Real Period();

		/****** GeomFill_SnglrFunc::Resolution ******/
		/****** md5 signature: cc4a4d9111fadd20ad48e62bc4df1579 ******/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "
Parameters
----------
R3d: float

Return
-------
float

Description
-----------
Returns the parametric resolution corresponding to the real space resolution <R3d>.
") Resolution;
		Standard_Real Resolution(const Standard_Real R3d);

		/****** GeomFill_SnglrFunc::SetRatio ******/
		/****** md5 signature: cc4a35be4cdecff3ce638489af66189a ******/
		%feature("compactdefaultargs") SetRatio;
		%feature("autodoc", "
Parameters
----------
Ratio: float

Return
-------
None

Description
-----------
No available documentation.
") SetRatio;
		void SetRatio(const Standard_Real Ratio);

		/****** GeomFill_SnglrFunc::ShallowCopy ******/
		/****** md5 signature: 1b6b0927543eab9d05e2c875c0c3efb6 ******/
		%feature("compactdefaultargs") ShallowCopy;
		%feature("autodoc", "Return
-------
opencascade::handle<Adaptor3d_Curve>

Description
-----------
Shallow copy of adaptor.
") ShallowCopy;
		virtual opencascade::handle<Adaptor3d_Curve> ShallowCopy();

		/****** GeomFill_SnglrFunc::Value ******/
		/****** md5 signature: d7f310c73762cbaa285ace0a141bc7bf ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
U: float

Return
-------
gp_Pnt

Description
-----------
Computes the point of parameter U on the curve.
") Value;
		gp_Pnt Value(const Standard_Real U);

};


%make_alias(GeomFill_SnglrFunc)

%extend GeomFill_SnglrFunc {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class GeomFill_Sweep *
***********************/
class GeomFill_Sweep {
	public:
		/****** GeomFill_Sweep::GeomFill_Sweep ******/
		/****** md5 signature: ce50089dbc77201f26c276d7fa420f1d ******/
		%feature("compactdefaultargs") GeomFill_Sweep;
		%feature("autodoc", "
Parameters
----------
Location: GeomFill_LocationLaw
WithKpart: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
No available documentation.
") GeomFill_Sweep;
		 GeomFill_Sweep(const opencascade::handle<GeomFill_LocationLaw> & Location, const Standard_Boolean WithKpart = Standard_True);

		/****** GeomFill_Sweep::Build ******/
		/****** md5 signature: 81671eb89e696302d692cbf60bef48d7 ******/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "
Parameters
----------
Section: GeomFill_SectionLaw
Methode: GeomFill_ApproxStyle (optional, default to GeomFill_Location)
Continuity: GeomAbs_Shape (optional, default to GeomAbs_C2)
Degmax: int (optional, default to 10)
Segmax: int (optional, default to 30)

Return
-------
None

Description
-----------
Build the Sweeep Surface ApproxStyle defines Approximation Strategy - GeomFill_Section: The composed Function: Location X Section is directly approximated. - GeomFill_Location: The location law is approximated, and the SweepSurface is build algebric composition of approximated location law and section law This option is Ok, if Section.Surface() methode is effective. Continuity: The continuity in v waiting on the surface Degmax: The maximum degree in v required on the surface Segmax: The maximum number of span in v required on the surface //! raise If Domain are infinite or Profile not set.
") Build;
		void Build(const opencascade::handle<GeomFill_SectionLaw> & Section, const GeomFill_ApproxStyle Methode = GeomFill_Location, const GeomAbs_Shape Continuity = GeomAbs_C2, const Standard_Integer Degmax = 10, const Standard_Integer Segmax = 30);

		/****** GeomFill_Sweep::ErrorOnRestriction ******/
		/****** md5 signature: 13a5e151e0b4b5ded2aaf892b3908f57 ******/
		%feature("compactdefaultargs") ErrorOnRestriction;
		%feature("autodoc", "
Parameters
----------
IsFirst: bool

Return
-------
UError: float
VError: float

Description
-----------
Gets the Approximation error.
") ErrorOnRestriction;
		void ErrorOnRestriction(const Standard_Boolean IsFirst, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** GeomFill_Sweep::ErrorOnSurface ******/
		/****** md5 signature: b6b87ca0efc7814953c22829fefc7f65 ******/
		%feature("compactdefaultargs") ErrorOnSurface;
		%feature("autodoc", "Return
-------
float

Description
-----------
Gets the Approximation error.
") ErrorOnSurface;
		Standard_Real ErrorOnSurface();

		/****** GeomFill_Sweep::ErrorOnTrace ******/
		/****** md5 signature: e1d1b11dd51d8fa33d430dff16f939ce ******/
		%feature("compactdefaultargs") ErrorOnTrace;
		%feature("autodoc", "
Parameters
----------
IndexOfTrace: int

Return
-------
UError: float
VError: float

Description
-----------
Gets the Approximation error.
") ErrorOnTrace;
		void ErrorOnTrace(const Standard_Integer IndexOfTrace, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** GeomFill_Sweep::ExchangeUV ******/
		/****** md5 signature: b9b6c7f5992ff1ca7ae0d75a331ba2e9 ******/
		%feature("compactdefaultargs") ExchangeUV;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns true if sections are U-Iso This can be produce in some cases when <WithKpart> is True.
") ExchangeUV;
		Standard_Boolean ExchangeUV();

		/****** GeomFill_Sweep::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Tells if the Surface is Buildt.
") IsDone;
		Standard_Boolean IsDone();

		/****** GeomFill_Sweep::NumberOfTrace ******/
		/****** md5 signature: b894645ce5dbfa6b6645bffcaaefc219 ******/
		%feature("compactdefaultargs") NumberOfTrace;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NumberOfTrace;
		Standard_Integer NumberOfTrace();

		/****** GeomFill_Sweep::Restriction ******/
		/****** md5 signature: 1e847729e33880d2f3dfee7d55da1756 ******/
		%feature("compactdefaultargs") Restriction;
		%feature("autodoc", "
Parameters
----------
IsFirst: bool

Return
-------
opencascade::handle<Geom2d_Curve>

Description
-----------
No available documentation.
") Restriction;
		opencascade::handle<Geom2d_Curve> Restriction(const Standard_Boolean IsFirst);

		/****** GeomFill_Sweep::SetDomain ******/
		/****** md5 signature: cd38e538169c6afd28f46a7bef651d8c ******/
		%feature("compactdefaultargs") SetDomain;
		%feature("autodoc", "
Parameters
----------
First: float
Last: float
SectionFirst: float
SectionLast: float

Return
-------
None

Description
-----------
Set parametric information [<First>, <Last>] Sets the parametric bound of the sweeping surface to build. <SectionFirst>, <SectionLast> gives corresponding bounds parameter on the section law of <First> and <Last> //! V-Iso on Sweeping Surface S(u,v) is defined by Location(v) and Section(w) where w = SectionFirst + (v - First) / (Last-First) * (SectionLast - SectionFirst) //! By default w = v, and First and Last are given by First and Last parameter stored in LocationLaw.
") SetDomain;
		void SetDomain(const Standard_Real First, const Standard_Real Last, const Standard_Real SectionFirst, const Standard_Real SectionLast);

		/****** GeomFill_Sweep::SetForceApproxC1 ******/
		/****** md5 signature: ef99bf0713e14fbe9531aef549b5c75b ******/
		%feature("compactdefaultargs") SetForceApproxC1;
		%feature("autodoc", "
Parameters
----------
ForceApproxC1: bool

Return
-------
None

Description
-----------
Set the flag that indicates attempt to approximate a C1-continuous surface if a swept surface proved to be C0.
") SetForceApproxC1;
		void SetForceApproxC1(const Standard_Boolean ForceApproxC1);

		/****** GeomFill_Sweep::SetTolerance ******/
		/****** md5 signature: 9b397c9283d7e37feb630a46515777f2 ******/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "
Parameters
----------
Tol3d: float
BoundTol: float (optional, default to 1.0)
Tol2d: float (optional, default to 1.0e-5)
TolAngular: float (optional, default to 1.0)

Return
-------
None

Description
-----------
Set Approximation Tolerance Tol3d: Tolerance to surface approximation Tol2d: Tolerance used to perform curve approximation Normally the 2d curve are approximated with a tolerance given by the resolution method define in <LocationLaw> but if this tolerance is too large Tol2d is used. TolAngular: Tolerance (in radian) to control the angle between tangents on the section law and tangent of iso-v on approximated surface.
") SetTolerance;
		void SetTolerance(const Standard_Real Tol3d, const Standard_Real BoundTol = 1.0, const Standard_Real Tol2d = 1.0e-5, const Standard_Real TolAngular = 1.0);

		/****** GeomFill_Sweep::Surface ******/
		/****** md5 signature: 352bd890213763e77e08756c09e1fdcc ******/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Surface>

Description
-----------
No available documentation.
") Surface;
		opencascade::handle<Geom_Surface> Surface();

		/****** GeomFill_Sweep::Trace ******/
		/****** md5 signature: e6371fd3991ead038eaf12d26411dece ******/
		%feature("compactdefaultargs") Trace;
		%feature("autodoc", "
Parameters
----------
IndexOfTrace: int

Return
-------
opencascade::handle<Geom2d_Curve>

Description
-----------
No available documentation.
") Trace;
		opencascade::handle<Geom2d_Curve> Trace(const Standard_Integer IndexOfTrace);

		/****** GeomFill_Sweep::UReversed ******/
		/****** md5 signature: 34ae19eef56aaa441350ad13af311fe2 ******/
		%feature("compactdefaultargs") UReversed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns true if Parametrisation sens in U is inverse of parametrisation sens of section (or of path if ExchangeUV).
") UReversed;
		Standard_Boolean UReversed();

		/****** GeomFill_Sweep::VReversed ******/
		/****** md5 signature: 3da7b47a32a00f3b216aa304d3009cba ******/
		%feature("compactdefaultargs") VReversed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns true if Parametrisation sens in V is inverse of parametrisation sens of path (or of section if ExchangeUV).
") VReversed;
		Standard_Boolean VReversed();

};


%extend GeomFill_Sweep {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class GeomFill_SweepFunction *
*******************************/
class GeomFill_SweepFunction : public Approx_SweepFunction {
	public:
		/****** GeomFill_SweepFunction::GeomFill_SweepFunction ******/
		/****** md5 signature: 352eb55fcdf0347a67f21144e2b992d0 ******/
		%feature("compactdefaultargs") GeomFill_SweepFunction;
		%feature("autodoc", "
Parameters
----------
Section: GeomFill_SectionLaw
Location: GeomFill_LocationLaw
FirstParameter: float
FirstParameterOnS: float
RatioParameterOnS: float

Return
-------
None

Description
-----------
No available documentation.
") GeomFill_SweepFunction;
		 GeomFill_SweepFunction(const opencascade::handle<GeomFill_SectionLaw> & Section, const opencascade::handle<GeomFill_LocationLaw> & Location, const Standard_Real FirstParameter, const Standard_Real FirstParameterOnS, const Standard_Real RatioParameterOnS);

		/****** GeomFill_SweepFunction::BarycentreOfSurf ******/
		/****** md5 signature: a691940df52b45c198f3414d0790e091 ******/
		%feature("compactdefaultargs") BarycentreOfSurf;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Get the barycentre of Surface. An very poor estimation is sufficient. This information is useful to perform well conditioned rational approximation. Warning: Used only if <self> IsRational.
") BarycentreOfSurf;
		virtual gp_Pnt BarycentreOfSurf();

		/****** GeomFill_SweepFunction::D0 ******/
		/****** md5 signature: 6e91f38f7b850db44626fcacae37aa41 ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
Param: float
First: float
Last: float
Poles: TColgp_Array1OfPnt
Poles2d: TColgp_Array1OfPnt2d
Weigths: TColStd_Array1OfReal

Return
-------
bool

Description
-----------
compute the section for v = param.
") D0;
		virtual Standard_Boolean D0(const Standard_Real Param, const Standard_Real First, const Standard_Real Last, TColgp_Array1OfPnt & Poles, TColgp_Array1OfPnt2d & Poles2d, TColStd_Array1OfReal & Weigths);

		/****** GeomFill_SweepFunction::D1 ******/
		/****** md5 signature: 2393309f0bc419006f62cbad28865129 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
Param: float
First: float
Last: float
Poles: TColgp_Array1OfPnt
DPoles: TColgp_Array1OfVec
Poles2d: TColgp_Array1OfPnt2d
DPoles2d: TColgp_Array1OfVec2d
Weigths: TColStd_Array1OfReal
DWeigths: TColStd_Array1OfReal

Return
-------
bool

Description
-----------
compute the first derivative in v direction of the section for v = param.
") D1;
		virtual Standard_Boolean D1(const Standard_Real Param, const Standard_Real First, const Standard_Real Last, TColgp_Array1OfPnt & Poles, TColgp_Array1OfVec & DPoles, TColgp_Array1OfPnt2d & Poles2d, TColgp_Array1OfVec2d & DPoles2d, TColStd_Array1OfReal & Weigths, TColStd_Array1OfReal & DWeigths);

		/****** GeomFill_SweepFunction::D2 ******/
		/****** md5 signature: 4cdf4be928174877f3da59b3bf48c192 ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
Param: float
First: float
Last: float
Poles: TColgp_Array1OfPnt
DPoles: TColgp_Array1OfVec
D2Poles: TColgp_Array1OfVec
Poles2d: TColgp_Array1OfPnt2d
DPoles2d: TColgp_Array1OfVec2d
D2Poles2d: TColgp_Array1OfVec2d
Weigths: TColStd_Array1OfReal
DWeigths: TColStd_Array1OfReal
D2Weigths: TColStd_Array1OfReal

Return
-------
bool

Description
-----------
compute the second derivative in v direction of the section for v = param.
") D2;
		virtual Standard_Boolean D2(const Standard_Real Param, const Standard_Real First, const Standard_Real Last, TColgp_Array1OfPnt & Poles, TColgp_Array1OfVec & DPoles, TColgp_Array1OfVec & D2Poles, TColgp_Array1OfPnt2d & Poles2d, TColgp_Array1OfVec2d & DPoles2d, TColgp_Array1OfVec2d & D2Poles2d, TColStd_Array1OfReal & Weigths, TColStd_Array1OfReal & DWeigths, TColStd_Array1OfReal & D2Weigths);

		/****** GeomFill_SweepFunction::GetMinimalWeight ******/
		/****** md5 signature: 36fb20110448cba55b750bc7db93d222 ******/
		%feature("compactdefaultargs") GetMinimalWeight;
		%feature("autodoc", "
Parameters
----------
Weigths: TColStd_Array1OfReal

Return
-------
None

Description
-----------
Compute the minimal value of weight for each poles of all sections. This information is useful to perform well conditioned rational approximation. Warning: Used only if <self> IsRational.
") GetMinimalWeight;
		virtual void GetMinimalWeight(TColStd_Array1OfReal & Weigths);

		/****** GeomFill_SweepFunction::GetTolerance ******/
		/****** md5 signature: 3f6ec4398981d416a51435f14d7cee22 ******/
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "
Parameters
----------
BoundTol: float
SurfTol: float
AngleTol: float
Tol3d: TColStd_Array1OfReal

Return
-------
None

Description
-----------
Returns the tolerance to reach in approximation to respect BoundTol error at the Boundary AngleTol tangent error at the Boundary (in radian) SurfTol error inside the surface.
") GetTolerance;
		virtual void GetTolerance(const Standard_Real BoundTol, const Standard_Real SurfTol, const Standard_Real AngleTol, TColStd_Array1OfReal & Tol3d);

		/****** GeomFill_SweepFunction::Intervals ******/
		/****** md5 signature: 89fb47d5d3721d82826a17cc788156e4 ******/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "
Parameters
----------
T: TColStd_Array1OfReal
S: GeomAbs_Shape

Return
-------
None

Description
-----------
Stores in <T> the parameters bounding the intervals of continuity <S>. //! The array must provide enough room to accommodate for the parameters. i.e. T.Length() > NbIntervals().
") Intervals;
		virtual void Intervals(TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****** GeomFill_SweepFunction::IsRational ******/
		/****** md5 signature: 2a6f0ec7e4a129780b654d163e7e3b1c ******/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns if the section is rational or not.
") IsRational;
		virtual Standard_Boolean IsRational();

		/****** GeomFill_SweepFunction::Knots ******/
		/****** md5 signature: 25dbe24e24c953c2c68b0d008e63e5d6 ******/
		%feature("compactdefaultargs") Knots;
		%feature("autodoc", "
Parameters
----------
TKnots: TColStd_Array1OfReal

Return
-------
None

Description
-----------
get the Knots of the section.
") Knots;
		virtual void Knots(TColStd_Array1OfReal & TKnots);

		/****** GeomFill_SweepFunction::MaximalSection ******/
		/****** md5 signature: b8f0d759fcd21b95d400b3aae3c12cfc ******/
		%feature("compactdefaultargs") MaximalSection;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the length of the maximum section. This information is useful to perform well conditioned rational approximation.
") MaximalSection;
		virtual Standard_Real MaximalSection();

		/****** GeomFill_SweepFunction::Mults ******/
		/****** md5 signature: 033dc1fab9e10e705c796ffc1e03a44d ******/
		%feature("compactdefaultargs") Mults;
		%feature("autodoc", "
Parameters
----------
TMults: TColStd_Array1OfInteger

Return
-------
None

Description
-----------
get the Multplicities of the section.
") Mults;
		virtual void Mults(TColStd_Array1OfInteger & TMults);

		/****** GeomFill_SweepFunction::Nb2dCurves ******/
		/****** md5 signature: a7d69b59dcf4f7a28533481bfba32ffb ******/
		%feature("compactdefaultargs") Nb2dCurves;
		%feature("autodoc", "Return
-------
int

Description
-----------
get the number of 2d curves to approximate.
") Nb2dCurves;
		virtual Standard_Integer Nb2dCurves();

		/****** GeomFill_SweepFunction::NbIntervals ******/
		/****** md5 signature: f69f597bd42e14bdc81d20aa650b3d54 ******/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "
Parameters
----------
S: GeomAbs_Shape

Return
-------
int

Description
-----------
Returns the number of intervals for continuity <S>. May be one if Continuity(me) >= <S>.
") NbIntervals;
		virtual Standard_Integer NbIntervals(const GeomAbs_Shape S);

		/****** GeomFill_SweepFunction::Resolution ******/
		/****** md5 signature: ed5d1e3e2211bf035576b0c56d934522 ******/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "
Parameters
----------
Index: int
Tol: float

Return
-------
TolU: float
TolV: float

Description
-----------
Returns the resolutions in the sub-space 2d <Index> This information is usfull to find an good tolerance in 2d approximation. Warning: Used only if Nb2dCurve > 0.
") Resolution;
		virtual void Resolution(const Standard_Integer Index, const Standard_Real Tol, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** GeomFill_SweepFunction::SectionShape ******/
		/****** md5 signature: 4b057291e9e338f8d299ce252e7fb36b ******/
		%feature("compactdefaultargs") SectionShape;
		%feature("autodoc", "
Parameters
----------

Return
-------
NbPoles: int
NbKnots: int
Degree: int

Description
-----------
get the format of a section.
") SectionShape;
		virtual void SectionShape(Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****** GeomFill_SweepFunction::SetInterval ******/
		/****** md5 signature: 09d00fda8057705f50d4a0bf656696ed ******/
		%feature("compactdefaultargs") SetInterval;
		%feature("autodoc", "
Parameters
----------
First: float
Last: float

Return
-------
None

Description
-----------
Sets the bounds of the parametric interval on the function This determines the derivatives in these values if the function is not Cn.
") SetInterval;
		virtual void SetInterval(const Standard_Real First, const Standard_Real Last);

		/****** GeomFill_SweepFunction::SetTolerance ******/
		/****** md5 signature: bf0b5b1b4d35ebad7b1b81b0b9b8ba2c ******/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "
Parameters
----------
Tol3d: float
Tol2d: float

Return
-------
None

Description
-----------
Is usfull, if (me) have to be run numerical algorithme to perform D0, D1 or D2.
") SetTolerance;
		virtual void SetTolerance(const Standard_Real Tol3d, const Standard_Real Tol2d);

};


%make_alias(GeomFill_SweepFunction)

%extend GeomFill_SweepFunction {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************
* class GeomFill_SweepSectionGenerator *
***************************************/
/************************
* class GeomFill_Tensor *
************************/
class GeomFill_Tensor {
	public:
		/****** GeomFill_Tensor::GeomFill_Tensor ******/
		/****** md5 signature: 000a58d4d29e492e0aabe3e1452a182e ******/
		%feature("compactdefaultargs") GeomFill_Tensor;
		%feature("autodoc", "
Parameters
----------
NbRow: int
NbCol: int
NbMat: int

Return
-------
None

Description
-----------
No available documentation.
") GeomFill_Tensor;
		 GeomFill_Tensor(const Standard_Integer NbRow, const Standard_Integer NbCol, const Standard_Integer NbMat);


        %feature("autodoc","1");
        %extend {
            Standard_Real GetChangeValue(const Standard_Integer Row,const Standard_Integer Col,const Standard_Integer Mat) {
            return (Standard_Real) $self->ChangeValue(Row,Col,Mat);
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetChangeValue(const Standard_Integer Row,const Standard_Integer Col,const Standard_Integer Mat,Standard_Real value) {
            $self->ChangeValue(Row,Col,Mat)=value;
            }
        };
		/****** GeomFill_Tensor::Init ******/
		/****** md5 signature: 6aef026ef1fcb18a844e723ac935cd4b ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
InitialValue: float

Return
-------
None

Description
-----------
Initialize all the elements of a Tensor to InitialValue.
") Init;
		void Init(const Standard_Real InitialValue);

		/****** GeomFill_Tensor::Multiply ******/
		/****** md5 signature: 1744e84f6795d21ff935088da038d2e5 ******/
		%feature("compactdefaultargs") Multiply;
		%feature("autodoc", "
Parameters
----------
Right: math_Vector
Product: math_Matrix

Return
-------
None

Description
-----------
No available documentation.
") Multiply;
		void Multiply(const math_Vector & Right, math_Matrix & Product);

		/****** GeomFill_Tensor::Value ******/
		/****** md5 signature: fd791f445ff1b5b7d6ca99e04d3b9805 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
Row: int
Col: int
Mat: int

Return
-------
float

Description
-----------
accesses (in read or write mode) the value of index <Row>, <Col> and <Mat> of a Tensor. An exception is raised if <Row>, <Col> or <Mat> are not in the correct range.
") Value;
		const Standard_Real & Value(const Standard_Integer Row, const Standard_Integer Col, const Standard_Integer Mat);

};


%extend GeomFill_Tensor {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class GeomFill_TgtField *
**************************/
%nodefaultctor GeomFill_TgtField;
class GeomFill_TgtField : public Standard_Transient {
	public:
		/****** GeomFill_TgtField::D1 ******/
		/****** md5 signature: 7fbff4c14c2799d1ff4bfb28332c2b6c ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
W: float

Return
-------
gp_Vec

Description
-----------
Computes the derivative of the field of tangency at parameter W.
") D1;
		virtual gp_Vec D1(const Standard_Real W);

		/****** GeomFill_TgtField::D1 ******/
		/****** md5 signature: d71dce235736f311096e4f932871958f ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
W: float
V: gp_Vec
DV: gp_Vec

Return
-------
None

Description
-----------
Computes the value and the derivative of the field of tangency at parameter W.
") D1;
		virtual void D1(const Standard_Real W, gp_Vec & V, gp_Vec & DV);

		/****** GeomFill_TgtField::IsScalable ******/
		/****** md5 signature: d0bcc01a9a4d8ef8a1917bcff520e752 ******/
		%feature("compactdefaultargs") IsScalable;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsScalable;
		virtual Standard_Boolean IsScalable();

		/****** GeomFill_TgtField::Scale ******/
		/****** md5 signature: f0c1f3ce29463e8b8cb8c0b2fa88c037 ******/
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", "
Parameters
----------
Func: Law_BSpline

Return
-------
None

Description
-----------
No available documentation.
") Scale;
		virtual void Scale(const opencascade::handle<Law_BSpline> & Func);

		/****** GeomFill_TgtField::Value ******/
		/****** md5 signature: 9bacab87e385edc8be267028cb7f46b8 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
W: float

Return
-------
gp_Vec

Description
-----------
Computes the value of the field of tangency at parameter W.
") Value;
		virtual gp_Vec Value(const Standard_Real W);

};


%make_alias(GeomFill_TgtField)

%extend GeomFill_TgtField {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class GeomFill_TrihedronLaw *
******************************/
%nodefaultctor GeomFill_TrihedronLaw;
class GeomFill_TrihedronLaw : public Standard_Transient {
	public:
		/****** GeomFill_TrihedronLaw::Copy ******/
		/****** md5 signature: 601808d007c14e98b2b54a537528d3e3 ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<GeomFill_TrihedronLaw>

Description
-----------
No available documentation.
") Copy;
		virtual opencascade::handle<GeomFill_TrihedronLaw> Copy();

		/****** GeomFill_TrihedronLaw::D0 ******/
		/****** md5 signature: 13340e73a6729e1ab799d984c9be5508 ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
Param: float
Tangent: gp_Vec
Normal: gp_Vec
BiNormal: gp_Vec

Return
-------
bool

Description
-----------
compute Triedrhon on curve at parameter <Param>.
") D0;
		virtual Standard_Boolean D0(const Standard_Real Param, gp_Vec & Tangent, gp_Vec & Normal, gp_Vec & BiNormal);

		/****** GeomFill_TrihedronLaw::D1 ******/
		/****** md5 signature: b5761cd22f011e952e89db7159aa7a9f ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
Param: float
Tangent: gp_Vec
DTangent: gp_Vec
Normal: gp_Vec
DNormal: gp_Vec
BiNormal: gp_Vec
DBiNormal: gp_Vec

Return
-------
bool

Description
-----------
compute Triedrhon and derivative Trihedron on curve at parameter <Param> Warning: It used only for C1 or C2 approximation.
") D1;
		virtual Standard_Boolean D1(const Standard_Real Param, gp_Vec & Tangent, gp_Vec & DTangent, gp_Vec & Normal, gp_Vec & DNormal, gp_Vec & BiNormal, gp_Vec & DBiNormal);

		/****** GeomFill_TrihedronLaw::D2 ******/
		/****** md5 signature: 6a10a5c6f84e96e0f1ac82eef85cbf5f ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
Param: float
Tangent: gp_Vec
DTangent: gp_Vec
D2Tangent: gp_Vec
Normal: gp_Vec
DNormal: gp_Vec
D2Normal: gp_Vec
BiNormal: gp_Vec
DBiNormal: gp_Vec
D2BiNormal: gp_Vec

Return
-------
bool

Description
-----------
compute Trihedron on curve first and seconde derivatives. Warning: It used only for C2 approximation.
") D2;
		virtual Standard_Boolean D2(const Standard_Real Param, gp_Vec & Tangent, gp_Vec & DTangent, gp_Vec & D2Tangent, gp_Vec & Normal, gp_Vec & DNormal, gp_Vec & D2Normal, gp_Vec & BiNormal, gp_Vec & DBiNormal, gp_Vec & D2BiNormal);

		/****** GeomFill_TrihedronLaw::ErrorStatus ******/
		/****** md5 signature: 6ba28977b4572c57396a526bbdd7889b ******/
		%feature("compactdefaultargs") ErrorStatus;
		%feature("autodoc", "Return
-------
GeomFill_PipeError

Description
-----------
Give a status to the Law Returns PipeOk (default implementation).
") ErrorStatus;
		virtual GeomFill_PipeError ErrorStatus();

		/****** GeomFill_TrihedronLaw::GetAverageLaw ******/
		/****** md5 signature: fef62e0a533c49957f58085cc44431be ******/
		%feature("compactdefaultargs") GetAverageLaw;
		%feature("autodoc", "
Parameters
----------
ATangent: gp_Vec
ANormal: gp_Vec
ABiNormal: gp_Vec

Return
-------
None

Description
-----------
Get average value of M(t) and V(t) it is usfull to make fast approximation of rational surfaces.
") GetAverageLaw;
		virtual void GetAverageLaw(gp_Vec & ATangent, gp_Vec & ANormal, gp_Vec & ABiNormal);

		/****** GeomFill_TrihedronLaw::GetInterval ******/
		/****** md5 signature: bcc50715ebf5d151a1f9ef097844cbdc ******/
		%feature("compactdefaultargs") GetInterval;
		%feature("autodoc", "
Parameters
----------

Return
-------
First: float
Last: float

Description
-----------
Gets the bounds of the parametric interval on the function.
") GetInterval;
		void GetInterval(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** GeomFill_TrihedronLaw::Intervals ******/
		/****** md5 signature: 7d2bf038a9213acf1609cc1244a3ee03 ******/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "
Parameters
----------
T: TColStd_Array1OfReal
S: GeomAbs_Shape

Return
-------
None

Description
-----------
Stores in <T> the parameters bounding the intervals of continuity <S>. //! The array must provide enough room to accommodate for the parameters. i.e. T.Length() > NbIntervals().
") Intervals;
		virtual void Intervals(TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****** GeomFill_TrihedronLaw::IsConstant ******/
		/****** md5 signature: 9069188cb3620131a57a89d1f535a3b9 ******/
		%feature("compactdefaultargs") IsConstant;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Say if the law is Constant.
") IsConstant;
		virtual Standard_Boolean IsConstant();

		/****** GeomFill_TrihedronLaw::IsOnlyBy3dCurve ******/
		/****** md5 signature: f8d791bc049901655a5239dfa1822db7 ******/
		%feature("compactdefaultargs") IsOnlyBy3dCurve;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Say if the law is defined, only by the 3d Geometry of the set Curve Return False by Default.
") IsOnlyBy3dCurve;
		virtual Standard_Boolean IsOnlyBy3dCurve();

		/****** GeomFill_TrihedronLaw::NbIntervals ******/
		/****** md5 signature: cb7f68d4b2c30f29cd5ba6f81443d314 ******/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "
Parameters
----------
S: GeomAbs_Shape

Return
-------
int

Description
-----------
Returns the number of intervals for continuity <S>. May be one if Continuity(me) >= <S>.
") NbIntervals;
		virtual Standard_Integer NbIntervals(const GeomAbs_Shape S);

		/****** GeomFill_TrihedronLaw::SetCurve ******/
		/****** md5 signature: a1d4a28acef1d51b0f5fb229ea384020 ******/
		%feature("compactdefaultargs") SetCurve;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve

Return
-------
bool

Description
-----------
initialize curve of trihedron law 
Return: Standard_True.
") SetCurve;
		virtual Standard_Boolean SetCurve(const opencascade::handle<Adaptor3d_Curve> & C);

		/****** GeomFill_TrihedronLaw::SetInterval ******/
		/****** md5 signature: 128fbeb43b59baa5a891a2c4ea58f02a ******/
		%feature("compactdefaultargs") SetInterval;
		%feature("autodoc", "
Parameters
----------
First: float
Last: float

Return
-------
None

Description
-----------
Sets the bounds of the parametric interval on the function This determines the derivatives in these values if the function is not Cn.
") SetInterval;
		virtual void SetInterval(const Standard_Real First, const Standard_Real Last);

};


%make_alias(GeomFill_TrihedronLaw)

%extend GeomFill_TrihedronLaw {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class GeomFill_BoundWithSurf *
*******************************/
class GeomFill_BoundWithSurf : public GeomFill_Boundary {
	public:
		/****** GeomFill_BoundWithSurf::GeomFill_BoundWithSurf ******/
		/****** md5 signature: d054c1079b9edcd7cb9b4e65d2b74232 ******/
		%feature("compactdefaultargs") GeomFill_BoundWithSurf;
		%feature("autodoc", "
Parameters
----------
CurveOnSurf: Adaptor3d_CurveOnSurface
Tol3d: float
Tolang: float

Return
-------
None

Description
-----------
Constructs a boundary object defined by the 3d curve CurveOnSurf. The surface to be filled along this boundary will be in the tolerance range defined by Tol3d. What's more, at each point of CurveOnSurf, the angle between the normal to the surface to be filled along this boundary, and the normal to the surface on which CurveOnSurf lies, must not be greater than TolAng. This object is to be used as a boundary for a GeomFill_ConstrainedFilling framework. Warning CurveOnSurf is an adapted curve, that is, an object which is an interface between: - the services provided by a curve lying on a surface from the package Geom - and those required of the curve by the computation algorithm which uses it. The adapted curve is created in the following way: opencascade::handle<Geom_Surface> mySurface = ... ; opencascade::handle<Geom2d_Curve> myParamCurve = ... ; // where myParamCurve is a 2D curve in the parametric space of the surface mySurface opencascade::handle<GeomAdaptor_Surface> Surface = new GeomAdaptor_Surface(mySurface); opencascade::handle<Geom2dAdaptor_Curve> ParamCurve = new Geom2dAdaptor_Curve(myParamCurve); CurveOnSurf = Adaptor3d_CurveOnSurface(ParamCurve,Surface); The boundary is then constructed with the CurveOnSurf object: Standard_Real Tol = ... ; Standard_Real TolAng = ... ; myBoundary = GeomFill_BoundWithSurf ( CurveOnSurf, Tol, TolAng );.
") GeomFill_BoundWithSurf;
		 GeomFill_BoundWithSurf(const Adaptor3d_CurveOnSurface & CurveOnSurf, const Standard_Real Tol3d, const Standard_Real Tolang);

		/****** GeomFill_BoundWithSurf::Bounds ******/
		/****** md5 signature: 618f7ac8e8773975015964105699f46f ******/
		%feature("compactdefaultargs") Bounds;
		%feature("autodoc", "
Parameters
----------

Return
-------
First: float
Last: float

Description
-----------
No available documentation.
") Bounds;
		void Bounds(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** GeomFill_BoundWithSurf::D1 ******/
		/****** md5 signature: 1dc830ec49a945a61cde5e5c027b78d7 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
U: float
P: gp_Pnt
V: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") D1;
		void D1(const Standard_Real U, gp_Pnt & P, gp_Vec & V);

		/****** GeomFill_BoundWithSurf::D1Norm ******/
		/****** md5 signature: eae6b219d51a14ef99ea0d96ffa245af ******/
		%feature("compactdefaultargs") D1Norm;
		%feature("autodoc", "
Parameters
----------
U: float
N: gp_Vec
DN: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") D1Norm;
		virtual void D1Norm(const Standard_Real U, gp_Vec & N, gp_Vec & DN);

		/****** GeomFill_BoundWithSurf::HasNormals ******/
		/****** md5 signature: 6931d1f66362c6d45d4df1056914318c ******/
		%feature("compactdefaultargs") HasNormals;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") HasNormals;
		virtual Standard_Boolean HasNormals();

		/****** GeomFill_BoundWithSurf::IsDegenerated ******/
		/****** md5 signature: 79ce66385cf4dd5e407488fd7c6a2ef0 ******/
		%feature("compactdefaultargs") IsDegenerated;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsDegenerated;
		Standard_Boolean IsDegenerated();

		/****** GeomFill_BoundWithSurf::Norm ******/
		/****** md5 signature: 8ec9451193b200cdc07951b55f2348bd ******/
		%feature("compactdefaultargs") Norm;
		%feature("autodoc", "
Parameters
----------
U: float

Return
-------
gp_Vec

Description
-----------
No available documentation.
") Norm;
		virtual gp_Vec Norm(const Standard_Real U);

		/****** GeomFill_BoundWithSurf::Reparametrize ******/
		/****** md5 signature: bd7b671d45505164bc59f6ce8496d6d0 ******/
		%feature("compactdefaultargs") Reparametrize;
		%feature("autodoc", "
Parameters
----------
First: float
Last: float
HasDF: bool
HasDL: bool
DF: float
DL: float
Rev: bool

Return
-------
None

Description
-----------
No available documentation.
") Reparametrize;
		void Reparametrize(const Standard_Real First, const Standard_Real Last, const Standard_Boolean HasDF, const Standard_Boolean HasDL, const Standard_Real DF, const Standard_Real DL, const Standard_Boolean Rev);

		/****** GeomFill_BoundWithSurf::Value ******/
		/****** md5 signature: d7f310c73762cbaa285ace0a141bc7bf ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
U: float

Return
-------
gp_Pnt

Description
-----------
No available documentation.
") Value;
		gp_Pnt Value(const Standard_Real U);

};


%make_alias(GeomFill_BoundWithSurf)

%extend GeomFill_BoundWithSurf {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class GeomFill_ConstantBiNormal *
**********************************/
class GeomFill_ConstantBiNormal : public GeomFill_TrihedronLaw {
	public:
		/****** GeomFill_ConstantBiNormal::GeomFill_ConstantBiNormal ******/
		/****** md5 signature: 8343818ff749757501766023742e5008 ******/
		%feature("compactdefaultargs") GeomFill_ConstantBiNormal;
		%feature("autodoc", "
Parameters
----------
BiNormal: gp_Dir

Return
-------
None

Description
-----------
No available documentation.
") GeomFill_ConstantBiNormal;
		 GeomFill_ConstantBiNormal(const gp_Dir & BiNormal);

		/****** GeomFill_ConstantBiNormal::Copy ******/
		/****** md5 signature: 9645e7734f6f9fcd3bd1e528a8c82987 ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<GeomFill_TrihedronLaw>

Description
-----------
No available documentation.
") Copy;
		virtual opencascade::handle<GeomFill_TrihedronLaw> Copy();

		/****** GeomFill_ConstantBiNormal::D0 ******/
		/****** md5 signature: 8127a750255133d6fe0cc96880f4f1ab ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
Param: float
Tangent: gp_Vec
Normal: gp_Vec
BiNormal: gp_Vec

Return
-------
bool

Description
-----------
Computes Triedrhon on curve at parameter <Param>.
") D0;
		virtual Standard_Boolean D0(const Standard_Real Param, gp_Vec & Tangent, gp_Vec & Normal, gp_Vec & BiNormal);

		/****** GeomFill_ConstantBiNormal::D1 ******/
		/****** md5 signature: 7b1b7607df3259d1ef02c15ca0ffdd69 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
Param: float
Tangent: gp_Vec
DTangent: gp_Vec
Normal: gp_Vec
DNormal: gp_Vec
BiNormal: gp_Vec
DBiNormal: gp_Vec

Return
-------
bool

Description
-----------
Computes Triedrhon and derivative Trihedron on curve at parameter <Param> Warning: It used only for C1 or C2 approximation.
") D1;
		virtual Standard_Boolean D1(const Standard_Real Param, gp_Vec & Tangent, gp_Vec & DTangent, gp_Vec & Normal, gp_Vec & DNormal, gp_Vec & BiNormal, gp_Vec & DBiNormal);

		/****** GeomFill_ConstantBiNormal::D2 ******/
		/****** md5 signature: e308ebcce924017ac2cd5d4701d10219 ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
Param: float
Tangent: gp_Vec
DTangent: gp_Vec
D2Tangent: gp_Vec
Normal: gp_Vec
DNormal: gp_Vec
D2Normal: gp_Vec
BiNormal: gp_Vec
DBiNormal: gp_Vec
D2BiNormal: gp_Vec

Return
-------
bool

Description
-----------
compute Trihedron on curve first and seconde derivatives. Warning: It used only for C2 approximation.
") D2;
		virtual Standard_Boolean D2(const Standard_Real Param, gp_Vec & Tangent, gp_Vec & DTangent, gp_Vec & D2Tangent, gp_Vec & Normal, gp_Vec & DNormal, gp_Vec & D2Normal, gp_Vec & BiNormal, gp_Vec & DBiNormal, gp_Vec & D2BiNormal);

		/****** GeomFill_ConstantBiNormal::GetAverageLaw ******/
		/****** md5 signature: e4ba5f43e35cc3444d51c5ee4d7b6fff ******/
		%feature("compactdefaultargs") GetAverageLaw;
		%feature("autodoc", "
Parameters
----------
ATangent: gp_Vec
ANormal: gp_Vec
ABiNormal: gp_Vec

Return
-------
None

Description
-----------
Gets average value of Tangent(t) and Normal(t) it is usfull to make fast approximation of rational surfaces.
") GetAverageLaw;
		virtual void GetAverageLaw(gp_Vec & ATangent, gp_Vec & ANormal, gp_Vec & ABiNormal);

		/****** GeomFill_ConstantBiNormal::Intervals ******/
		/****** md5 signature: 89fb47d5d3721d82826a17cc788156e4 ******/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "
Parameters
----------
T: TColStd_Array1OfReal
S: GeomAbs_Shape

Return
-------
None

Description
-----------
Stores in <T> the parameters bounding the intervals of continuity <S>. //! The array must provide enough room to accommodate for the parameters. i.e. T.Length() > NbIntervals().
") Intervals;
		virtual void Intervals(TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****** GeomFill_ConstantBiNormal::IsConstant ******/
		/****** md5 signature: 117737bfe11f2fa5e6c2b702110a9201 ******/
		%feature("compactdefaultargs") IsConstant;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Says if the law is Constant.
") IsConstant;
		virtual Standard_Boolean IsConstant();

		/****** GeomFill_ConstantBiNormal::IsOnlyBy3dCurve ******/
		/****** md5 signature: dce50a0e4caf3b6774af0413898e9c4b ******/
		%feature("compactdefaultargs") IsOnlyBy3dCurve;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return True.
") IsOnlyBy3dCurve;
		virtual Standard_Boolean IsOnlyBy3dCurve();

		/****** GeomFill_ConstantBiNormal::NbIntervals ******/
		/****** md5 signature: f69f597bd42e14bdc81d20aa650b3d54 ******/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "
Parameters
----------
S: GeomAbs_Shape

Return
-------
int

Description
-----------
Returns the number of intervals for continuity <S>. May be one if Continuity(me) >= <S>.
") NbIntervals;
		virtual Standard_Integer NbIntervals(const GeomAbs_Shape S);

		/****** GeomFill_ConstantBiNormal::SetCurve ******/
		/****** md5 signature: b0541b7921a5c5b75a45dc913166e3d3 ******/
		%feature("compactdefaultargs") SetCurve;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve

Return
-------
bool

Description
-----------
initialize curve of trihedron law 
Return: Standard_True in case if execution end correctly.
") SetCurve;
		virtual Standard_Boolean SetCurve(const opencascade::handle<Adaptor3d_Curve> & C);

};


%make_alias(GeomFill_ConstantBiNormal)

%extend GeomFill_ConstantBiNormal {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class GeomFill_Coons *
***********************/
class GeomFill_Coons : public GeomFill_Filling {
	public:
		/****** GeomFill_Coons::GeomFill_Coons ******/
		/****** md5 signature: 3e7ce345fdc4339d51a4f1830d2d4a10 ******/
		%feature("compactdefaultargs") GeomFill_Coons;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") GeomFill_Coons;
		 GeomFill_Coons();

		/****** GeomFill_Coons::GeomFill_Coons ******/
		/****** md5 signature: d3ed2c1d3406214cebf52159644ee665 ******/
		%feature("compactdefaultargs") GeomFill_Coons;
		%feature("autodoc", "
Parameters
----------
P1: TColgp_Array1OfPnt
P2: TColgp_Array1OfPnt
P3: TColgp_Array1OfPnt
P4: TColgp_Array1OfPnt

Return
-------
None

Description
-----------
No available documentation.
") GeomFill_Coons;
		 GeomFill_Coons(const TColgp_Array1OfPnt & P1, const TColgp_Array1OfPnt & P2, const TColgp_Array1OfPnt & P3, const TColgp_Array1OfPnt & P4);

		/****** GeomFill_Coons::GeomFill_Coons ******/
		/****** md5 signature: cbef7bb663e9994379c9aab840ba0fd0 ******/
		%feature("compactdefaultargs") GeomFill_Coons;
		%feature("autodoc", "
Parameters
----------
P1: TColgp_Array1OfPnt
P2: TColgp_Array1OfPnt
P3: TColgp_Array1OfPnt
P4: TColgp_Array1OfPnt
W1: TColStd_Array1OfReal
W2: TColStd_Array1OfReal
W3: TColStd_Array1OfReal
W4: TColStd_Array1OfReal

Return
-------
None

Description
-----------
No available documentation.
") GeomFill_Coons;
		 GeomFill_Coons(const TColgp_Array1OfPnt & P1, const TColgp_Array1OfPnt & P2, const TColgp_Array1OfPnt & P3, const TColgp_Array1OfPnt & P4, const TColStd_Array1OfReal & W1, const TColStd_Array1OfReal & W2, const TColStd_Array1OfReal & W3, const TColStd_Array1OfReal & W4);

		/****** GeomFill_Coons::Init ******/
		/****** md5 signature: d3ffe113a485ff934a537831bed2560b ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
P1: TColgp_Array1OfPnt
P2: TColgp_Array1OfPnt
P3: TColgp_Array1OfPnt
P4: TColgp_Array1OfPnt

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const TColgp_Array1OfPnt & P1, const TColgp_Array1OfPnt & P2, const TColgp_Array1OfPnt & P3, const TColgp_Array1OfPnt & P4);

		/****** GeomFill_Coons::Init ******/
		/****** md5 signature: 094f730897c039878a8e655c32e65678 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
P1: TColgp_Array1OfPnt
P2: TColgp_Array1OfPnt
P3: TColgp_Array1OfPnt
P4: TColgp_Array1OfPnt
W1: TColStd_Array1OfReal
W2: TColStd_Array1OfReal
W3: TColStd_Array1OfReal
W4: TColStd_Array1OfReal

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const TColgp_Array1OfPnt & P1, const TColgp_Array1OfPnt & P2, const TColgp_Array1OfPnt & P3, const TColgp_Array1OfPnt & P4, const TColStd_Array1OfReal & W1, const TColStd_Array1OfReal & W2, const TColStd_Array1OfReal & W3, const TColStd_Array1OfReal & W4);

};


%extend GeomFill_Coons {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class GeomFill_CorrectedFrenet *
*********************************/
class GeomFill_CorrectedFrenet : public GeomFill_TrihedronLaw {
	public:
		/****** GeomFill_CorrectedFrenet::GeomFill_CorrectedFrenet ******/
		/****** md5 signature: d76c98f61ce89e9ec82b5b957281f8d0 ******/
		%feature("compactdefaultargs") GeomFill_CorrectedFrenet;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") GeomFill_CorrectedFrenet;
		 GeomFill_CorrectedFrenet();

		/****** GeomFill_CorrectedFrenet::GeomFill_CorrectedFrenet ******/
		/****** md5 signature: ca99dabed4feeef737a90b4a039cdf77 ******/
		%feature("compactdefaultargs") GeomFill_CorrectedFrenet;
		%feature("autodoc", "
Parameters
----------
ForEvaluation: bool

Return
-------
None

Description
-----------
No available documentation.
") GeomFill_CorrectedFrenet;
		 GeomFill_CorrectedFrenet(const Standard_Boolean ForEvaluation);

		/****** GeomFill_CorrectedFrenet::Copy ******/
		/****** md5 signature: 9645e7734f6f9fcd3bd1e528a8c82987 ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<GeomFill_TrihedronLaw>

Description
-----------
No available documentation.
") Copy;
		virtual opencascade::handle<GeomFill_TrihedronLaw> Copy();

		/****** GeomFill_CorrectedFrenet::D0 ******/
		/****** md5 signature: 8127a750255133d6fe0cc96880f4f1ab ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
Param: float
Tangent: gp_Vec
Normal: gp_Vec
BiNormal: gp_Vec

Return
-------
bool

Description
-----------
compute Triedrhon on curve at parameter <Param>.
") D0;
		virtual Standard_Boolean D0(const Standard_Real Param, gp_Vec & Tangent, gp_Vec & Normal, gp_Vec & BiNormal);

		/****** GeomFill_CorrectedFrenet::D1 ******/
		/****** md5 signature: 7b1b7607df3259d1ef02c15ca0ffdd69 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
Param: float
Tangent: gp_Vec
DTangent: gp_Vec
Normal: gp_Vec
DNormal: gp_Vec
BiNormal: gp_Vec
DBiNormal: gp_Vec

Return
-------
bool

Description
-----------
compute Triedrhon and derivative Trihedron on curve at parameter <Param> Warning: It used only for C1 or C2 approximation.
") D1;
		virtual Standard_Boolean D1(const Standard_Real Param, gp_Vec & Tangent, gp_Vec & DTangent, gp_Vec & Normal, gp_Vec & DNormal, gp_Vec & BiNormal, gp_Vec & DBiNormal);

		/****** GeomFill_CorrectedFrenet::D2 ******/
		/****** md5 signature: e308ebcce924017ac2cd5d4701d10219 ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
Param: float
Tangent: gp_Vec
DTangent: gp_Vec
D2Tangent: gp_Vec
Normal: gp_Vec
DNormal: gp_Vec
D2Normal: gp_Vec
BiNormal: gp_Vec
DBiNormal: gp_Vec
D2BiNormal: gp_Vec

Return
-------
bool

Description
-----------
compute Trihedron on curve first and seconde derivatives. Warning: It used only for C2 approximation.
") D2;
		virtual Standard_Boolean D2(const Standard_Real Param, gp_Vec & Tangent, gp_Vec & DTangent, gp_Vec & D2Tangent, gp_Vec & Normal, gp_Vec & DNormal, gp_Vec & D2Normal, gp_Vec & BiNormal, gp_Vec & DBiNormal, gp_Vec & D2BiNormal);

		/****** GeomFill_CorrectedFrenet::EvaluateBestMode ******/
		/****** md5 signature: d239be0fafe7316fa059e4a41d53d45f ******/
		%feature("compactdefaultargs") EvaluateBestMode;
		%feature("autodoc", "Return
-------
GeomFill_Trihedron

Description
-----------
Tries to define the best trihedron mode for the curve. It can be: - Frenet - CorrectedFrenet - DiscreteTrihedron Warning: the CorrectedFrenet must be constructed with option ForEvaluation = True, the curve must be set by method SetCurve.
") EvaluateBestMode;
		GeomFill_Trihedron EvaluateBestMode();

		/****** GeomFill_CorrectedFrenet::GetAverageLaw ******/
		/****** md5 signature: e4ba5f43e35cc3444d51c5ee4d7b6fff ******/
		%feature("compactdefaultargs") GetAverageLaw;
		%feature("autodoc", "
Parameters
----------
ATangent: gp_Vec
ANormal: gp_Vec
ABiNormal: gp_Vec

Return
-------
None

Description
-----------
Get average value of Tangent(t) and Normal(t) it is usfull to make fast approximation of rational surfaces.
") GetAverageLaw;
		virtual void GetAverageLaw(gp_Vec & ATangent, gp_Vec & ANormal, gp_Vec & ABiNormal);

		/****** GeomFill_CorrectedFrenet::Intervals ******/
		/****** md5 signature: 89fb47d5d3721d82826a17cc788156e4 ******/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "
Parameters
----------
T: TColStd_Array1OfReal
S: GeomAbs_Shape

Return
-------
None

Description
-----------
Stores in <T> the parameters bounding the intervals of continuity <S>. //! The array must provide enough room to accommodate for the parameters. i.e. T.Length() > NbIntervals().
") Intervals;
		virtual void Intervals(TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****** GeomFill_CorrectedFrenet::IsConstant ******/
		/****** md5 signature: 117737bfe11f2fa5e6c2b702110a9201 ******/
		%feature("compactdefaultargs") IsConstant;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Say if the law is Constant.
") IsConstant;
		virtual Standard_Boolean IsConstant();

		/****** GeomFill_CorrectedFrenet::IsOnlyBy3dCurve ******/
		/****** md5 signature: dce50a0e4caf3b6774af0413898e9c4b ******/
		%feature("compactdefaultargs") IsOnlyBy3dCurve;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return True.
") IsOnlyBy3dCurve;
		virtual Standard_Boolean IsOnlyBy3dCurve();

		/****** GeomFill_CorrectedFrenet::NbIntervals ******/
		/****** md5 signature: f69f597bd42e14bdc81d20aa650b3d54 ******/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "
Parameters
----------
S: GeomAbs_Shape

Return
-------
int

Description
-----------
Returns the number of intervals for continuity <S>. May be one if Continuity(me) >= <S>.
") NbIntervals;
		virtual Standard_Integer NbIntervals(const GeomAbs_Shape S);

		/****** GeomFill_CorrectedFrenet::SetCurve ******/
		/****** md5 signature: b0541b7921a5c5b75a45dc913166e3d3 ******/
		%feature("compactdefaultargs") SetCurve;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve

Return
-------
bool

Description
-----------
initialize curve of frenet law 
Return: Standard_True in case if execution end correctly.
") SetCurve;
		virtual Standard_Boolean SetCurve(const opencascade::handle<Adaptor3d_Curve> & C);

		/****** GeomFill_CorrectedFrenet::SetInterval ******/
		/****** md5 signature: 09d00fda8057705f50d4a0bf656696ed ******/
		%feature("compactdefaultargs") SetInterval;
		%feature("autodoc", "
Parameters
----------
First: float
Last: float

Return
-------
None

Description
-----------
No available documentation.
") SetInterval;
		virtual void SetInterval(const Standard_Real First, const Standard_Real Last);

};


%make_alias(GeomFill_CorrectedFrenet)

%extend GeomFill_CorrectedFrenet {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class GeomFill_CurveAndTrihedron *
***********************************/
class GeomFill_CurveAndTrihedron : public GeomFill_LocationLaw {
	public:
		/****** GeomFill_CurveAndTrihedron::GeomFill_CurveAndTrihedron ******/
		/****** md5 signature: bd832d5dba5dd09f0cd75b38254e98a1 ******/
		%feature("compactdefaultargs") GeomFill_CurveAndTrihedron;
		%feature("autodoc", "
Parameters
----------
Trihedron: GeomFill_TrihedronLaw

Return
-------
None

Description
-----------
No available documentation.
") GeomFill_CurveAndTrihedron;
		 GeomFill_CurveAndTrihedron(const opencascade::handle<GeomFill_TrihedronLaw> & Trihedron);

		/****** GeomFill_CurveAndTrihedron::Copy ******/
		/****** md5 signature: 6211f5514688258100f0ea82262b2f4b ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<GeomFill_LocationLaw>

Description
-----------
No available documentation.
") Copy;
		virtual opencascade::handle<GeomFill_LocationLaw> Copy();

		/****** GeomFill_CurveAndTrihedron::D0 ******/
		/****** md5 signature: 316ea693fc5dcb4b89eef4bd219d0f5e ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
Param: float
M: gp_Mat
V: gp_Vec

Return
-------
bool

Description
-----------
compute Location and 2d points.
") D0;
		virtual Standard_Boolean D0(const Standard_Real Param, gp_Mat & M, gp_Vec & V);

		/****** GeomFill_CurveAndTrihedron::D0 ******/
		/****** md5 signature: 924a51426e408dff0c68c8625c80f165 ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
Param: float
M: gp_Mat
V: gp_Vec
Poles2d: TColgp_Array1OfPnt2d

Return
-------
bool

Description
-----------
compute Location and 2d points.
") D0;
		virtual Standard_Boolean D0(const Standard_Real Param, gp_Mat & M, gp_Vec & V, TColgp_Array1OfPnt2d & Poles2d);

		/****** GeomFill_CurveAndTrihedron::D1 ******/
		/****** md5 signature: 288bb22d14e06a66281554b33f433d63 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
Param: float
M: gp_Mat
V: gp_Vec
DM: gp_Mat
DV: gp_Vec
Poles2d: TColgp_Array1OfPnt2d
DPoles2d: TColgp_Array1OfVec2d

Return
-------
bool

Description
-----------
compute location 2d points and associated first derivatives. Warning: It used only for C1 or C2 approximation.
") D1;
		virtual Standard_Boolean D1(const Standard_Real Param, gp_Mat & M, gp_Vec & V, gp_Mat & DM, gp_Vec & DV, TColgp_Array1OfPnt2d & Poles2d, TColgp_Array1OfVec2d & DPoles2d);

		/****** GeomFill_CurveAndTrihedron::D2 ******/
		/****** md5 signature: 940621cc935757a0b177b16f7cd72d05 ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
Param: float
M: gp_Mat
V: gp_Vec
DM: gp_Mat
DV: gp_Vec
D2M: gp_Mat
D2V: gp_Vec
Poles2d: TColgp_Array1OfPnt2d
DPoles2d: TColgp_Array1OfVec2d
D2Poles2d: TColgp_Array1OfVec2d

Return
-------
bool

Description
-----------
compute location 2d points and associated first and seconde derivatives. Warning: It used only for C2 approximation.
") D2;
		virtual Standard_Boolean D2(const Standard_Real Param, gp_Mat & M, gp_Vec & V, gp_Mat & DM, gp_Vec & DV, gp_Mat & D2M, gp_Vec & D2V, TColgp_Array1OfPnt2d & Poles2d, TColgp_Array1OfVec2d & DPoles2d, TColgp_Array1OfVec2d & D2Poles2d);

		/****** GeomFill_CurveAndTrihedron::GetAverageLaw ******/
		/****** md5 signature: c8399d110fc93e54f7a94c0255e22682 ******/
		%feature("compactdefaultargs") GetAverageLaw;
		%feature("autodoc", "
Parameters
----------
AM: gp_Mat
AV: gp_Vec

Return
-------
None

Description
-----------
Get average value of M(t) and V(t) it is usfull to make fast approximation of rational surfaces.
") GetAverageLaw;
		virtual void GetAverageLaw(gp_Mat & AM, gp_Vec & AV);

		/****** GeomFill_CurveAndTrihedron::GetCurve ******/
		/****** md5 signature: b5470ee2464d4db2182ec23b2a5e7e7f ******/
		%feature("compactdefaultargs") GetCurve;
		%feature("autodoc", "Return
-------
opencascade::handle<Adaptor3d_Curve>

Description
-----------
No available documentation.
") GetCurve;
		virtual const opencascade::handle<Adaptor3d_Curve> & GetCurve();

		/****** GeomFill_CurveAndTrihedron::GetDomain ******/
		/****** md5 signature: 5949ecf80ee7cf5a86623a8a457dd2b9 ******/
		%feature("compactdefaultargs") GetDomain;
		%feature("autodoc", "
Parameters
----------

Return
-------
First: float
Last: float

Description
-----------
Gets the bounds of the function parametric domain. Warning: This domain it is not modified by the SetValue method.
") GetDomain;
		virtual void GetDomain(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** GeomFill_CurveAndTrihedron::GetInterval ******/
		/****** md5 signature: 5025922809e891f5aa8a2358198f31e4 ******/
		%feature("compactdefaultargs") GetInterval;
		%feature("autodoc", "
Parameters
----------

Return
-------
First: float
Last: float

Description
-----------
Gets the bounds of the parametric interval on the function.
") GetInterval;
		virtual void GetInterval(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** GeomFill_CurveAndTrihedron::GetMaximalNorm ******/
		/****** md5 signature: d33bcb5496370d9914e70fb48ea83d28 ******/
		%feature("compactdefaultargs") GetMaximalNorm;
		%feature("autodoc", "Return
-------
float

Description
-----------
Get the maximum Norm of the matrix-location part. It is usful to find an good Tolerance to approx M(t).
") GetMaximalNorm;
		virtual Standard_Real GetMaximalNorm();

		/****** GeomFill_CurveAndTrihedron::Intervals ******/
		/****** md5 signature: 89fb47d5d3721d82826a17cc788156e4 ******/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "
Parameters
----------
T: TColStd_Array1OfReal
S: GeomAbs_Shape

Return
-------
None

Description
-----------
Stores in <T> the parameters bounding the intervals of continuity <S>. //! The array must provide enough room to accommodate for the parameters. i.e. T.Length() > NbIntervals().
") Intervals;
		virtual void Intervals(TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****** GeomFill_CurveAndTrihedron::IsRotation ******/
		/****** md5 signature: 69c76c5168e987b8419ad259813fc9af ******/
		%feature("compactdefaultargs") IsRotation;
		%feature("autodoc", "
Parameters
----------

Return
-------
Error: float

Description
-----------
Say if the Location Law, is a rotation of Location The default implementation is ' returns False '.
") IsRotation;
		virtual Standard_Boolean IsRotation(Standard_Real &OutValue);

		/****** GeomFill_CurveAndTrihedron::IsTranslation ******/
		/****** md5 signature: 4064d79964f3a03428b0eb9740c21e0f ******/
		%feature("compactdefaultargs") IsTranslation;
		%feature("autodoc", "
Parameters
----------

Return
-------
Error: float

Description
-----------
Say if the Location Law, is an translation of Location The default implementation is ' returns False '.
") IsTranslation;
		virtual Standard_Boolean IsTranslation(Standard_Real &OutValue);

		/****** GeomFill_CurveAndTrihedron::NbIntervals ******/
		/****** md5 signature: f69f597bd42e14bdc81d20aa650b3d54 ******/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "
Parameters
----------
S: GeomAbs_Shape

Return
-------
int

Description
-----------
Returns the number of intervals for continuity <S>. May be one if Continuity(me) >= <S>.
") NbIntervals;
		virtual Standard_Integer NbIntervals(const GeomAbs_Shape S);

		/****** GeomFill_CurveAndTrihedron::Rotation ******/
		/****** md5 signature: b76821e717ce4d2049156bbde7eb7114 ******/
		%feature("compactdefaultargs") Rotation;
		%feature("autodoc", "
Parameters
----------
Center: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") Rotation;
		virtual void Rotation(gp_Pnt & Center);

		/****** GeomFill_CurveAndTrihedron::SetCurve ******/
		/****** md5 signature: b0541b7921a5c5b75a45dc913166e3d3 ******/
		%feature("compactdefaultargs") SetCurve;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve

Return
-------
bool

Description
-----------
initialize curve of trihedron law 
Return: Standard_True in case if execution end correctly.
") SetCurve;
		virtual Standard_Boolean SetCurve(const opencascade::handle<Adaptor3d_Curve> & C);

		/****** GeomFill_CurveAndTrihedron::SetInterval ******/
		/****** md5 signature: 09d00fda8057705f50d4a0bf656696ed ******/
		%feature("compactdefaultargs") SetInterval;
		%feature("autodoc", "
Parameters
----------
First: float
Last: float

Return
-------
None

Description
-----------
Sets the bounds of the parametric interval on the function This determines the derivatives in these values if the function is not Cn.
") SetInterval;
		virtual void SetInterval(const Standard_Real First, const Standard_Real Last);

		/****** GeomFill_CurveAndTrihedron::SetTrsf ******/
		/****** md5 signature: 52b4e29e16b9b86f3d7835907847b3d0 ******/
		%feature("compactdefaultargs") SetTrsf;
		%feature("autodoc", "
Parameters
----------
Transfo: gp_Mat

Return
-------
None

Description
-----------
Set a transformation Matrix like the law M(t) become Mat * M(t).
") SetTrsf;
		virtual void SetTrsf(const gp_Mat & Transfo);

};


%make_alias(GeomFill_CurveAndTrihedron)

%extend GeomFill_CurveAndTrihedron {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class GeomFill_Curved *
************************/
class GeomFill_Curved : public GeomFill_Filling {
	public:
		/****** GeomFill_Curved::GeomFill_Curved ******/
		/****** md5 signature: 6c0f36b4961d5e44a2bcde6567edd42e ******/
		%feature("compactdefaultargs") GeomFill_Curved;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") GeomFill_Curved;
		 GeomFill_Curved();

		/****** GeomFill_Curved::GeomFill_Curved ******/
		/****** md5 signature: eddcfa7b1fc9058a685f65fa4e4f0c91 ******/
		%feature("compactdefaultargs") GeomFill_Curved;
		%feature("autodoc", "
Parameters
----------
P1: TColgp_Array1OfPnt
P2: TColgp_Array1OfPnt
P3: TColgp_Array1OfPnt
P4: TColgp_Array1OfPnt

Return
-------
None

Description
-----------
No available documentation.
") GeomFill_Curved;
		 GeomFill_Curved(const TColgp_Array1OfPnt & P1, const TColgp_Array1OfPnt & P2, const TColgp_Array1OfPnt & P3, const TColgp_Array1OfPnt & P4);

		/****** GeomFill_Curved::GeomFill_Curved ******/
		/****** md5 signature: f2ed21eacfd772c7afd8f10da79331b7 ******/
		%feature("compactdefaultargs") GeomFill_Curved;
		%feature("autodoc", "
Parameters
----------
P1: TColgp_Array1OfPnt
P2: TColgp_Array1OfPnt
P3: TColgp_Array1OfPnt
P4: TColgp_Array1OfPnt
W1: TColStd_Array1OfReal
W2: TColStd_Array1OfReal
W3: TColStd_Array1OfReal
W4: TColStd_Array1OfReal

Return
-------
None

Description
-----------
No available documentation.
") GeomFill_Curved;
		 GeomFill_Curved(const TColgp_Array1OfPnt & P1, const TColgp_Array1OfPnt & P2, const TColgp_Array1OfPnt & P3, const TColgp_Array1OfPnt & P4, const TColStd_Array1OfReal & W1, const TColStd_Array1OfReal & W2, const TColStd_Array1OfReal & W3, const TColStd_Array1OfReal & W4);

		/****** GeomFill_Curved::GeomFill_Curved ******/
		/****** md5 signature: b8dc04ce3e1f65428d7efb97fba9cc9b ******/
		%feature("compactdefaultargs") GeomFill_Curved;
		%feature("autodoc", "
Parameters
----------
P1: TColgp_Array1OfPnt
P2: TColgp_Array1OfPnt

Return
-------
None

Description
-----------
No available documentation.
") GeomFill_Curved;
		 GeomFill_Curved(const TColgp_Array1OfPnt & P1, const TColgp_Array1OfPnt & P2);

		/****** GeomFill_Curved::GeomFill_Curved ******/
		/****** md5 signature: 006a3e85ffd95781c1e9baa1fbb76176 ******/
		%feature("compactdefaultargs") GeomFill_Curved;
		%feature("autodoc", "
Parameters
----------
P1: TColgp_Array1OfPnt
P2: TColgp_Array1OfPnt
W1: TColStd_Array1OfReal
W2: TColStd_Array1OfReal

Return
-------
None

Description
-----------
No available documentation.
") GeomFill_Curved;
		 GeomFill_Curved(const TColgp_Array1OfPnt & P1, const TColgp_Array1OfPnt & P2, const TColStd_Array1OfReal & W1, const TColStd_Array1OfReal & W2);

		/****** GeomFill_Curved::Init ******/
		/****** md5 signature: d3ffe113a485ff934a537831bed2560b ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
P1: TColgp_Array1OfPnt
P2: TColgp_Array1OfPnt
P3: TColgp_Array1OfPnt
P4: TColgp_Array1OfPnt

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const TColgp_Array1OfPnt & P1, const TColgp_Array1OfPnt & P2, const TColgp_Array1OfPnt & P3, const TColgp_Array1OfPnt & P4);

		/****** GeomFill_Curved::Init ******/
		/****** md5 signature: 094f730897c039878a8e655c32e65678 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
P1: TColgp_Array1OfPnt
P2: TColgp_Array1OfPnt
P3: TColgp_Array1OfPnt
P4: TColgp_Array1OfPnt
W1: TColStd_Array1OfReal
W2: TColStd_Array1OfReal
W3: TColStd_Array1OfReal
W4: TColStd_Array1OfReal

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const TColgp_Array1OfPnt & P1, const TColgp_Array1OfPnt & P2, const TColgp_Array1OfPnt & P3, const TColgp_Array1OfPnt & P4, const TColStd_Array1OfReal & W1, const TColStd_Array1OfReal & W2, const TColStd_Array1OfReal & W3, const TColStd_Array1OfReal & W4);

		/****** GeomFill_Curved::Init ******/
		/****** md5 signature: f6ef827de0cf3ac234bbfb173cd78cfe ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
P1: TColgp_Array1OfPnt
P2: TColgp_Array1OfPnt

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const TColgp_Array1OfPnt & P1, const TColgp_Array1OfPnt & P2);

		/****** GeomFill_Curved::Init ******/
		/****** md5 signature: 0bfe4b6915157b1607faa578cfa286ef ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
P1: TColgp_Array1OfPnt
P2: TColgp_Array1OfPnt
W1: TColStd_Array1OfReal
W2: TColStd_Array1OfReal

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const TColgp_Array1OfPnt & P1, const TColgp_Array1OfPnt & P2, const TColStd_Array1OfReal & W1, const TColStd_Array1OfReal & W2);

};


%extend GeomFill_Curved {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class GeomFill_Darboux *
*************************/
class GeomFill_Darboux : public GeomFill_TrihedronLaw {
	public:
		/****** GeomFill_Darboux::GeomFill_Darboux ******/
		/****** md5 signature: 5873413a2d8edcecd0fc7983a15a6a0d ******/
		%feature("compactdefaultargs") GeomFill_Darboux;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") GeomFill_Darboux;
		 GeomFill_Darboux();

		/****** GeomFill_Darboux::Copy ******/
		/****** md5 signature: 9645e7734f6f9fcd3bd1e528a8c82987 ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<GeomFill_TrihedronLaw>

Description
-----------
No available documentation.
") Copy;
		virtual opencascade::handle<GeomFill_TrihedronLaw> Copy();

		/****** GeomFill_Darboux::D0 ******/
		/****** md5 signature: 8127a750255133d6fe0cc96880f4f1ab ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
Param: float
Tangent: gp_Vec
Normal: gp_Vec
BiNormal: gp_Vec

Return
-------
bool

Description
-----------
compute Triedrhon on curve at parameter <Param>.
") D0;
		virtual Standard_Boolean D0(const Standard_Real Param, gp_Vec & Tangent, gp_Vec & Normal, gp_Vec & BiNormal);

		/****** GeomFill_Darboux::D1 ******/
		/****** md5 signature: 7b1b7607df3259d1ef02c15ca0ffdd69 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
Param: float
Tangent: gp_Vec
DTangent: gp_Vec
Normal: gp_Vec
DNormal: gp_Vec
BiNormal: gp_Vec
DBiNormal: gp_Vec

Return
-------
bool

Description
-----------
compute Triedrhon and derivative Trihedron on curve at parameter <Param> Warning: It used only for C1 or C2 approximation.
") D1;
		virtual Standard_Boolean D1(const Standard_Real Param, gp_Vec & Tangent, gp_Vec & DTangent, gp_Vec & Normal, gp_Vec & DNormal, gp_Vec & BiNormal, gp_Vec & DBiNormal);

		/****** GeomFill_Darboux::D2 ******/
		/****** md5 signature: e308ebcce924017ac2cd5d4701d10219 ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
Param: float
Tangent: gp_Vec
DTangent: gp_Vec
D2Tangent: gp_Vec
Normal: gp_Vec
DNormal: gp_Vec
D2Normal: gp_Vec
BiNormal: gp_Vec
DBiNormal: gp_Vec
D2BiNormal: gp_Vec

Return
-------
bool

Description
-----------
compute Trihedron on curve first and seconde derivatives. Warning: It used only for C2 approximation.
") D2;
		virtual Standard_Boolean D2(const Standard_Real Param, gp_Vec & Tangent, gp_Vec & DTangent, gp_Vec & D2Tangent, gp_Vec & Normal, gp_Vec & DNormal, gp_Vec & D2Normal, gp_Vec & BiNormal, gp_Vec & DBiNormal, gp_Vec & D2BiNormal);

		/****** GeomFill_Darboux::GetAverageLaw ******/
		/****** md5 signature: e4ba5f43e35cc3444d51c5ee4d7b6fff ******/
		%feature("compactdefaultargs") GetAverageLaw;
		%feature("autodoc", "
Parameters
----------
ATangent: gp_Vec
ANormal: gp_Vec
ABiNormal: gp_Vec

Return
-------
None

Description
-----------
Get average value of Tangent(t) and Normal(t) it is usfull to make fast approximation of rational surfaces.
") GetAverageLaw;
		virtual void GetAverageLaw(gp_Vec & ATangent, gp_Vec & ANormal, gp_Vec & ABiNormal);

		/****** GeomFill_Darboux::Intervals ******/
		/****** md5 signature: 89fb47d5d3721d82826a17cc788156e4 ******/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "
Parameters
----------
T: TColStd_Array1OfReal
S: GeomAbs_Shape

Return
-------
None

Description
-----------
Stores in <T> the parameters bounding the intervals of continuity <S>. //! The array must provide enough room to accommodate for the parameters. i.e. T.Length() > NbIntervals().
") Intervals;
		virtual void Intervals(TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****** GeomFill_Darboux::IsConstant ******/
		/****** md5 signature: 117737bfe11f2fa5e6c2b702110a9201 ******/
		%feature("compactdefaultargs") IsConstant;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Say if the law is Constant.
") IsConstant;
		virtual Standard_Boolean IsConstant();

		/****** GeomFill_Darboux::IsOnlyBy3dCurve ******/
		/****** md5 signature: dce50a0e4caf3b6774af0413898e9c4b ******/
		%feature("compactdefaultargs") IsOnlyBy3dCurve;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return False.
") IsOnlyBy3dCurve;
		virtual Standard_Boolean IsOnlyBy3dCurve();

		/****** GeomFill_Darboux::NbIntervals ******/
		/****** md5 signature: f69f597bd42e14bdc81d20aa650b3d54 ******/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "
Parameters
----------
S: GeomAbs_Shape

Return
-------
int

Description
-----------
Returns the number of intervals for continuity <S>. May be one if Continuity(me) >= <S>.
") NbIntervals;
		virtual Standard_Integer NbIntervals(const GeomAbs_Shape S);

};


%make_alias(GeomFill_Darboux)

%extend GeomFill_Darboux {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class GeomFill_DegeneratedBound *
**********************************/
class GeomFill_DegeneratedBound : public GeomFill_Boundary {
	public:
		/****** GeomFill_DegeneratedBound::GeomFill_DegeneratedBound ******/
		/****** md5 signature: f676839e48e6a57f125f5a1250ca4763 ******/
		%feature("compactdefaultargs") GeomFill_DegeneratedBound;
		%feature("autodoc", "
Parameters
----------
Point: gp_Pnt
First: float
Last: float
Tol3d: float
Tolang: float

Return
-------
None

Description
-----------
No available documentation.
") GeomFill_DegeneratedBound;
		 GeomFill_DegeneratedBound(const gp_Pnt & Point, const Standard_Real First, const Standard_Real Last, const Standard_Real Tol3d, const Standard_Real Tolang);

		/****** GeomFill_DegeneratedBound::Bounds ******/
		/****** md5 signature: 618f7ac8e8773975015964105699f46f ******/
		%feature("compactdefaultargs") Bounds;
		%feature("autodoc", "
Parameters
----------

Return
-------
First: float
Last: float

Description
-----------
No available documentation.
") Bounds;
		void Bounds(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** GeomFill_DegeneratedBound::D1 ******/
		/****** md5 signature: 1dc830ec49a945a61cde5e5c027b78d7 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
U: float
P: gp_Pnt
V: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") D1;
		void D1(const Standard_Real U, gp_Pnt & P, gp_Vec & V);

		/****** GeomFill_DegeneratedBound::IsDegenerated ******/
		/****** md5 signature: 79ce66385cf4dd5e407488fd7c6a2ef0 ******/
		%feature("compactdefaultargs") IsDegenerated;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsDegenerated;
		Standard_Boolean IsDegenerated();

		/****** GeomFill_DegeneratedBound::Reparametrize ******/
		/****** md5 signature: bd7b671d45505164bc59f6ce8496d6d0 ******/
		%feature("compactdefaultargs") Reparametrize;
		%feature("autodoc", "
Parameters
----------
First: float
Last: float
HasDF: bool
HasDL: bool
DF: float
DL: float
Rev: bool

Return
-------
None

Description
-----------
No available documentation.
") Reparametrize;
		void Reparametrize(const Standard_Real First, const Standard_Real Last, const Standard_Boolean HasDF, const Standard_Boolean HasDL, const Standard_Real DF, const Standard_Real DL, const Standard_Boolean Rev);

		/****** GeomFill_DegeneratedBound::Value ******/
		/****** md5 signature: d7f310c73762cbaa285ace0a141bc7bf ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
U: float

Return
-------
gp_Pnt

Description
-----------
No available documentation.
") Value;
		gp_Pnt Value(const Standard_Real U);

};


%make_alias(GeomFill_DegeneratedBound)

%extend GeomFill_DegeneratedBound {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class GeomFill_DiscreteTrihedron *
***********************************/
class GeomFill_DiscreteTrihedron : public GeomFill_TrihedronLaw {
	public:
		/****** GeomFill_DiscreteTrihedron::GeomFill_DiscreteTrihedron ******/
		/****** md5 signature: 76fb1e45ad1e1d3ab57dc791e8e6458c ******/
		%feature("compactdefaultargs") GeomFill_DiscreteTrihedron;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") GeomFill_DiscreteTrihedron;
		 GeomFill_DiscreteTrihedron();

		/****** GeomFill_DiscreteTrihedron::Copy ******/
		/****** md5 signature: 9645e7734f6f9fcd3bd1e528a8c82987 ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<GeomFill_TrihedronLaw>

Description
-----------
No available documentation.
") Copy;
		virtual opencascade::handle<GeomFill_TrihedronLaw> Copy();

		/****** GeomFill_DiscreteTrihedron::D0 ******/
		/****** md5 signature: 8127a750255133d6fe0cc96880f4f1ab ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
Param: float
Tangent: gp_Vec
Normal: gp_Vec
BiNormal: gp_Vec

Return
-------
bool

Description
-----------
compute Trihedron on curve at parameter <Param>.
") D0;
		virtual Standard_Boolean D0(const Standard_Real Param, gp_Vec & Tangent, gp_Vec & Normal, gp_Vec & BiNormal);

		/****** GeomFill_DiscreteTrihedron::D1 ******/
		/****** md5 signature: 7b1b7607df3259d1ef02c15ca0ffdd69 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
Param: float
Tangent: gp_Vec
DTangent: gp_Vec
Normal: gp_Vec
DNormal: gp_Vec
BiNormal: gp_Vec
DBiNormal: gp_Vec

Return
-------
bool

Description
-----------
compute Trihedron and derivative Trihedron on curve at parameter <Param> Warning: It used only for C1 or C2 approximation For the moment it returns null values for DTangent, DNormal and DBiNormal.
") D1;
		virtual Standard_Boolean D1(const Standard_Real Param, gp_Vec & Tangent, gp_Vec & DTangent, gp_Vec & Normal, gp_Vec & DNormal, gp_Vec & BiNormal, gp_Vec & DBiNormal);

		/****** GeomFill_DiscreteTrihedron::D2 ******/
		/****** md5 signature: e308ebcce924017ac2cd5d4701d10219 ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
Param: float
Tangent: gp_Vec
DTangent: gp_Vec
D2Tangent: gp_Vec
Normal: gp_Vec
DNormal: gp_Vec
D2Normal: gp_Vec
BiNormal: gp_Vec
DBiNormal: gp_Vec
D2BiNormal: gp_Vec

Return
-------
bool

Description
-----------
compute Trihedron on curve first and seconde derivatives. Warning: It used only for C2 approximation For the moment it returns null values for DTangent, DNormal DBiNormal, D2Tangent, D2Normal, D2BiNormal.
") D2;
		virtual Standard_Boolean D2(const Standard_Real Param, gp_Vec & Tangent, gp_Vec & DTangent, gp_Vec & D2Tangent, gp_Vec & Normal, gp_Vec & DNormal, gp_Vec & D2Normal, gp_Vec & BiNormal, gp_Vec & DBiNormal, gp_Vec & D2BiNormal);

		/****** GeomFill_DiscreteTrihedron::GetAverageLaw ******/
		/****** md5 signature: e4ba5f43e35cc3444d51c5ee4d7b6fff ******/
		%feature("compactdefaultargs") GetAverageLaw;
		%feature("autodoc", "
Parameters
----------
ATangent: gp_Vec
ANormal: gp_Vec
ABiNormal: gp_Vec

Return
-------
None

Description
-----------
Get average value of Tangent(t) and Normal(t) it is usful to make fast approximation of rational surfaces.
") GetAverageLaw;
		virtual void GetAverageLaw(gp_Vec & ATangent, gp_Vec & ANormal, gp_Vec & ABiNormal);

		/****** GeomFill_DiscreteTrihedron::Init ******/
		/****** md5 signature: 0de93ef32c53d091768788dca0e281fd ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init();

		/****** GeomFill_DiscreteTrihedron::Intervals ******/
		/****** md5 signature: 89fb47d5d3721d82826a17cc788156e4 ******/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "
Parameters
----------
T: TColStd_Array1OfReal
S: GeomAbs_Shape

Return
-------
None

Description
-----------
Stores in <T> the parameters bounding the intervals of continuity <S>. //! The array must provide enough room to accommodate for the parameters. i.e. T.Length() > NbIntervals().
") Intervals;
		virtual void Intervals(TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****** GeomFill_DiscreteTrihedron::IsConstant ******/
		/****** md5 signature: 117737bfe11f2fa5e6c2b702110a9201 ******/
		%feature("compactdefaultargs") IsConstant;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Say if the law is Constant.
") IsConstant;
		virtual Standard_Boolean IsConstant();

		/****** GeomFill_DiscreteTrihedron::IsOnlyBy3dCurve ******/
		/****** md5 signature: dce50a0e4caf3b6774af0413898e9c4b ******/
		%feature("compactdefaultargs") IsOnlyBy3dCurve;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return True.
") IsOnlyBy3dCurve;
		virtual Standard_Boolean IsOnlyBy3dCurve();

		/****** GeomFill_DiscreteTrihedron::NbIntervals ******/
		/****** md5 signature: f69f597bd42e14bdc81d20aa650b3d54 ******/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "
Parameters
----------
S: GeomAbs_Shape

Return
-------
int

Description
-----------
Returns the number of intervals for continuity <S>. May be one if Continuity(me) >= <S>.
") NbIntervals;
		virtual Standard_Integer NbIntervals(const GeomAbs_Shape S);

		/****** GeomFill_DiscreteTrihedron::SetCurve ******/
		/****** md5 signature: b0541b7921a5c5b75a45dc913166e3d3 ******/
		%feature("compactdefaultargs") SetCurve;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve

Return
-------
bool

Description
-----------
initialize curve of trihedron law 
Return: Standard_True in case if execution end correctly.
") SetCurve;
		virtual Standard_Boolean SetCurve(const opencascade::handle<Adaptor3d_Curve> & C);

};


%make_alias(GeomFill_DiscreteTrihedron)

%extend GeomFill_DiscreteTrihedron {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class GeomFill_DraftTrihedron *
********************************/
class GeomFill_DraftTrihedron : public GeomFill_TrihedronLaw {
	public:
		/****** GeomFill_DraftTrihedron::GeomFill_DraftTrihedron ******/
		/****** md5 signature: 729e35bd4c91cccae626d88982c0923e ******/
		%feature("compactdefaultargs") GeomFill_DraftTrihedron;
		%feature("autodoc", "
Parameters
----------
BiNormal: gp_Vec
Angle: float

Return
-------
None

Description
-----------
No available documentation.
") GeomFill_DraftTrihedron;
		 GeomFill_DraftTrihedron(const gp_Vec & BiNormal, const Standard_Real Angle);

		/****** GeomFill_DraftTrihedron::Copy ******/
		/****** md5 signature: 9645e7734f6f9fcd3bd1e528a8c82987 ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<GeomFill_TrihedronLaw>

Description
-----------
No available documentation.
") Copy;
		virtual opencascade::handle<GeomFill_TrihedronLaw> Copy();

		/****** GeomFill_DraftTrihedron::D0 ******/
		/****** md5 signature: 8127a750255133d6fe0cc96880f4f1ab ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
Param: float
Tangent: gp_Vec
Normal: gp_Vec
BiNormal: gp_Vec

Return
-------
bool

Description
-----------
compute Triedrhon and derivative Trihedron on curve at parameter <Param> Warning: It used only for C1 or C2 approximation.
") D0;
		virtual Standard_Boolean D0(const Standard_Real Param, gp_Vec & Tangent, gp_Vec & Normal, gp_Vec & BiNormal);

		/****** GeomFill_DraftTrihedron::D1 ******/
		/****** md5 signature: 7b1b7607df3259d1ef02c15ca0ffdd69 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
Param: float
Tangent: gp_Vec
DTangent: gp_Vec
Normal: gp_Vec
DNormal: gp_Vec
BiNormal: gp_Vec
DBiNormal: gp_Vec

Return
-------
bool

Description
-----------
compute Trihedron on curve first and seconde derivatives. Warning: It used only for C2 approximation.
") D1;
		virtual Standard_Boolean D1(const Standard_Real Param, gp_Vec & Tangent, gp_Vec & DTangent, gp_Vec & Normal, gp_Vec & DNormal, gp_Vec & BiNormal, gp_Vec & DBiNormal);

		/****** GeomFill_DraftTrihedron::D2 ******/
		/****** md5 signature: e308ebcce924017ac2cd5d4701d10219 ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
Param: float
Tangent: gp_Vec
DTangent: gp_Vec
D2Tangent: gp_Vec
Normal: gp_Vec
DNormal: gp_Vec
D2Normal: gp_Vec
BiNormal: gp_Vec
DBiNormal: gp_Vec
D2BiNormal: gp_Vec

Return
-------
bool

Description
-----------
No available documentation.
") D2;
		virtual Standard_Boolean D2(const Standard_Real Param, gp_Vec & Tangent, gp_Vec & DTangent, gp_Vec & D2Tangent, gp_Vec & Normal, gp_Vec & DNormal, gp_Vec & D2Normal, gp_Vec & BiNormal, gp_Vec & DBiNormal, gp_Vec & D2BiNormal);

		/****** GeomFill_DraftTrihedron::GetAverageLaw ******/
		/****** md5 signature: e4ba5f43e35cc3444d51c5ee4d7b6fff ******/
		%feature("compactdefaultargs") GetAverageLaw;
		%feature("autodoc", "
Parameters
----------
ATangent: gp_Vec
ANormal: gp_Vec
ABiNormal: gp_Vec

Return
-------
None

Description
-----------
Get average value of Tangent(t) and Normal(t) it is useful to make fast approximation of rational surfaces.
") GetAverageLaw;
		virtual void GetAverageLaw(gp_Vec & ATangent, gp_Vec & ANormal, gp_Vec & ABiNormal);

		/****** GeomFill_DraftTrihedron::Intervals ******/
		/****** md5 signature: 89fb47d5d3721d82826a17cc788156e4 ******/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "
Parameters
----------
T: TColStd_Array1OfReal
S: GeomAbs_Shape

Return
-------
None

Description
-----------
Stores in <T> the parameters bounding the intervals of continuity <S>. //! The array must provide enough room to accommodate for the parameters. i.e. T.Length() > NbIntervals().
") Intervals;
		virtual void Intervals(TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****** GeomFill_DraftTrihedron::IsConstant ******/
		/****** md5 signature: 117737bfe11f2fa5e6c2b702110a9201 ******/
		%feature("compactdefaultargs") IsConstant;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Say if the law is Constant.
") IsConstant;
		virtual Standard_Boolean IsConstant();

		/****** GeomFill_DraftTrihedron::IsOnlyBy3dCurve ******/
		/****** md5 signature: dce50a0e4caf3b6774af0413898e9c4b ******/
		%feature("compactdefaultargs") IsOnlyBy3dCurve;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return True.
") IsOnlyBy3dCurve;
		virtual Standard_Boolean IsOnlyBy3dCurve();

		/****** GeomFill_DraftTrihedron::NbIntervals ******/
		/****** md5 signature: f69f597bd42e14bdc81d20aa650b3d54 ******/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "
Parameters
----------
S: GeomAbs_Shape

Return
-------
int

Description
-----------
Returns the number of intervals for continuity <S>. May be one if Continuity(me) >= <S>.
") NbIntervals;
		virtual Standard_Integer NbIntervals(const GeomAbs_Shape S);

		/****** GeomFill_DraftTrihedron::SetAngle ******/
		/****** md5 signature: a0d60e2a1ea25c193dafa15194b0ab24 ******/
		%feature("compactdefaultargs") SetAngle;
		%feature("autodoc", "
Parameters
----------
Angle: float

Return
-------
None

Description
-----------
No available documentation.
") SetAngle;
		void SetAngle(const Standard_Real Angle);

};


%make_alias(GeomFill_DraftTrihedron)

%extend GeomFill_DraftTrihedron {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class GeomFill_EvolvedSection *
********************************/
class GeomFill_EvolvedSection : public GeomFill_SectionLaw {
	public:
		/****** GeomFill_EvolvedSection::GeomFill_EvolvedSection ******/
		/****** md5 signature: 5316bbaca3d5924b7b79d5ad0d098294 ******/
		%feature("compactdefaultargs") GeomFill_EvolvedSection;
		%feature("autodoc", "
Parameters
----------
C: Geom_Curve
L: Law_Function

Return
-------
None

Description
-----------
Make an SectionLaw with a Curve and a real Law.
") GeomFill_EvolvedSection;
		 GeomFill_EvolvedSection(const opencascade::handle<Geom_Curve> & C, const opencascade::handle<Law_Function> & L);

		/****** GeomFill_EvolvedSection::BSplineSurface ******/
		/****** md5 signature: 723eb488e2a06d913977b581dcccba8f ******/
		%feature("compactdefaultargs") BSplineSurface;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_BSplineSurface>

Description
-----------
give if possible an bspline Surface, like iso-v are the section. If it is not possible this methode have to get an Null Surface. Is it the default implementation.
") BSplineSurface;
		virtual opencascade::handle<Geom_BSplineSurface> BSplineSurface();

		/****** GeomFill_EvolvedSection::BarycentreOfSurf ******/
		/****** md5 signature: a691940df52b45c198f3414d0790e091 ******/
		%feature("compactdefaultargs") BarycentreOfSurf;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Get the barycentre of Surface. An very poor estimation is sufficient. This information is useful to perform well conditioned rational approximation. Warning: Used only if <self> IsRational.
") BarycentreOfSurf;
		virtual gp_Pnt BarycentreOfSurf();

		/****** GeomFill_EvolvedSection::ConstantSection ******/
		/****** md5 signature: 86519bb197ca223d0ba2720b381f4036 ******/
		%feature("compactdefaultargs") ConstantSection;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Curve>

Description
-----------
Return the constant Section if <self> IsConstant.
") ConstantSection;
		virtual opencascade::handle<Geom_Curve> ConstantSection();

		/****** GeomFill_EvolvedSection::D0 ******/
		/****** md5 signature: d889e1bd3dadd721c935f604be609d57 ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
Param: float
Poles: TColgp_Array1OfPnt
Weigths: TColStd_Array1OfReal

Return
-------
bool

Description
-----------
compute the section for v = param.
") D0;
		virtual Standard_Boolean D0(const Standard_Real Param, TColgp_Array1OfPnt & Poles, TColStd_Array1OfReal & Weigths);

		/****** GeomFill_EvolvedSection::D1 ******/
		/****** md5 signature: 127f80b4c43e681b4262dad7d1db79d7 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
Param: float
Poles: TColgp_Array1OfPnt
DPoles: TColgp_Array1OfVec
Weigths: TColStd_Array1OfReal
DWeigths: TColStd_Array1OfReal

Return
-------
bool

Description
-----------
compute the first derivative in v direction of the section for v = param Warning: It used only for C1 or C2 approximation.
") D1;
		virtual Standard_Boolean D1(const Standard_Real Param, TColgp_Array1OfPnt & Poles, TColgp_Array1OfVec & DPoles, TColStd_Array1OfReal & Weigths, TColStd_Array1OfReal & DWeigths);

		/****** GeomFill_EvolvedSection::D2 ******/
		/****** md5 signature: e7553cf232323cae7964c205cd5a06a9 ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
Param: float
Poles: TColgp_Array1OfPnt
DPoles: TColgp_Array1OfVec
D2Poles: TColgp_Array1OfVec
Weigths: TColStd_Array1OfReal
DWeigths: TColStd_Array1OfReal
D2Weigths: TColStd_Array1OfReal

Return
-------
bool

Description
-----------
compute the second derivative in v direction of the section for v = param Warning: It used only for C2 approximation.
") D2;
		virtual Standard_Boolean D2(const Standard_Real Param, TColgp_Array1OfPnt & Poles, TColgp_Array1OfVec & DPoles, TColgp_Array1OfVec & D2Poles, TColStd_Array1OfReal & Weigths, TColStd_Array1OfReal & DWeigths, TColStd_Array1OfReal & D2Weigths);

		/****** GeomFill_EvolvedSection::GetDomain ******/
		/****** md5 signature: 5949ecf80ee7cf5a86623a8a457dd2b9 ******/
		%feature("compactdefaultargs") GetDomain;
		%feature("autodoc", "
Parameters
----------

Return
-------
First: float
Last: float

Description
-----------
Gets the bounds of the function parametric domain. Warning: This domain it is not modified by the SetValue method.
") GetDomain;
		virtual void GetDomain(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** GeomFill_EvolvedSection::GetInterval ******/
		/****** md5 signature: 5025922809e891f5aa8a2358198f31e4 ******/
		%feature("compactdefaultargs") GetInterval;
		%feature("autodoc", "
Parameters
----------

Return
-------
First: float
Last: float

Description
-----------
Gets the bounds of the parametric interval on the function.
") GetInterval;
		virtual void GetInterval(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** GeomFill_EvolvedSection::GetMinimalWeight ******/
		/****** md5 signature: 36fb20110448cba55b750bc7db93d222 ******/
		%feature("compactdefaultargs") GetMinimalWeight;
		%feature("autodoc", "
Parameters
----------
Weigths: TColStd_Array1OfReal

Return
-------
None

Description
-----------
Compute the minimal value of weight for each poles in all sections. This information is useful to control error in rational approximation. Warning: Used only if <self> IsRational.
") GetMinimalWeight;
		virtual void GetMinimalWeight(TColStd_Array1OfReal & Weigths);

		/****** GeomFill_EvolvedSection::GetTolerance ******/
		/****** md5 signature: 3f6ec4398981d416a51435f14d7cee22 ******/
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "
Parameters
----------
BoundTol: float
SurfTol: float
AngleTol: float
Tol3d: TColStd_Array1OfReal

Return
-------
None

Description
-----------
Returns the tolerances associated at each poles to reach in approximation, to satisfy: BoundTol error at the Boundary AngleTol tangent error at the Boundary (in radian) SurfTol error inside the surface.
") GetTolerance;
		virtual void GetTolerance(const Standard_Real BoundTol, const Standard_Real SurfTol, const Standard_Real AngleTol, TColStd_Array1OfReal & Tol3d);

		/****** GeomFill_EvolvedSection::Intervals ******/
		/****** md5 signature: 89fb47d5d3721d82826a17cc788156e4 ******/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "
Parameters
----------
T: TColStd_Array1OfReal
S: GeomAbs_Shape

Return
-------
None

Description
-----------
Stores in <T> the parameters bounding the intervals of continuity <S>. //! The array must provide enough room to accommodate for the parameters. i.e. T.Length() > NbIntervals().
") Intervals;
		virtual void Intervals(TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****** GeomFill_EvolvedSection::IsConstant ******/
		/****** md5 signature: b8fcd911afc2577f90f33f0c8d046c8a ******/
		%feature("compactdefaultargs") IsConstant;
		%feature("autodoc", "
Parameters
----------

Return
-------
Error: float

Description
-----------
return True If the Law isConstant.
") IsConstant;
		virtual Standard_Boolean IsConstant(Standard_Real &OutValue);

		/****** GeomFill_EvolvedSection::IsRational ******/
		/****** md5 signature: 2a6f0ec7e4a129780b654d163e7e3b1c ******/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns if the sections are rational or not.
") IsRational;
		virtual Standard_Boolean IsRational();

		/****** GeomFill_EvolvedSection::IsUPeriodic ******/
		/****** md5 signature: ee1d04d096d58c0c69971438c1aa71fc ******/
		%feature("compactdefaultargs") IsUPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns if the sections are periodic or not.
") IsUPeriodic;
		virtual Standard_Boolean IsUPeriodic();

		/****** GeomFill_EvolvedSection::IsVPeriodic ******/
		/****** md5 signature: c62bf083eb7bc6b915c3cdeea2fc8406 ******/
		%feature("compactdefaultargs") IsVPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns if the law isperiodic or not.
") IsVPeriodic;
		virtual Standard_Boolean IsVPeriodic();

		/****** GeomFill_EvolvedSection::Knots ******/
		/****** md5 signature: 25dbe24e24c953c2c68b0d008e63e5d6 ******/
		%feature("compactdefaultargs") Knots;
		%feature("autodoc", "
Parameters
----------
TKnots: TColStd_Array1OfReal

Return
-------
None

Description
-----------
get the Knots of the section.
") Knots;
		virtual void Knots(TColStd_Array1OfReal & TKnots);

		/****** GeomFill_EvolvedSection::MaximalSection ******/
		/****** md5 signature: b8f0d759fcd21b95d400b3aae3c12cfc ******/
		%feature("compactdefaultargs") MaximalSection;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the length of the greater section. This information is useful to G1's control. Warning: With an little value, approximation can be slower.
") MaximalSection;
		virtual Standard_Real MaximalSection();

		/****** GeomFill_EvolvedSection::Mults ******/
		/****** md5 signature: 033dc1fab9e10e705c796ffc1e03a44d ******/
		%feature("compactdefaultargs") Mults;
		%feature("autodoc", "
Parameters
----------
TMults: TColStd_Array1OfInteger

Return
-------
None

Description
-----------
get the Multplicities of the section.
") Mults;
		virtual void Mults(TColStd_Array1OfInteger & TMults);

		/****** GeomFill_EvolvedSection::NbIntervals ******/
		/****** md5 signature: f69f597bd42e14bdc81d20aa650b3d54 ******/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "
Parameters
----------
S: GeomAbs_Shape

Return
-------
int

Description
-----------
Returns the number of intervals for continuity <S>. May be one if Continuity(me) >= <S>.
") NbIntervals;
		virtual Standard_Integer NbIntervals(const GeomAbs_Shape S);

		/****** GeomFill_EvolvedSection::SectionShape ******/
		/****** md5 signature: 4b057291e9e338f8d299ce252e7fb36b ******/
		%feature("compactdefaultargs") SectionShape;
		%feature("autodoc", "
Parameters
----------

Return
-------
NbPoles: int
NbKnots: int
Degree: int

Description
-----------
get the format of an section.
") SectionShape;
		virtual void SectionShape(Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****** GeomFill_EvolvedSection::SetInterval ******/
		/****** md5 signature: 09d00fda8057705f50d4a0bf656696ed ******/
		%feature("compactdefaultargs") SetInterval;
		%feature("autodoc", "
Parameters
----------
First: float
Last: float

Return
-------
None

Description
-----------
Sets the bounds of the parametric interval on the function This determines the derivatives in these values if the function is not Cn.
") SetInterval;
		virtual void SetInterval(const Standard_Real First, const Standard_Real Last);

};


%make_alias(GeomFill_EvolvedSection)

%extend GeomFill_EvolvedSection {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class GeomFill_Fixed *
***********************/
class GeomFill_Fixed : public GeomFill_TrihedronLaw {
	public:
		/****** GeomFill_Fixed::GeomFill_Fixed ******/
		/****** md5 signature: 5e2066acb7e356d3da3376939b0798ba ******/
		%feature("compactdefaultargs") GeomFill_Fixed;
		%feature("autodoc", "
Parameters
----------
Tangent: gp_Vec
Normal: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") GeomFill_Fixed;
		 GeomFill_Fixed(const gp_Vec & Tangent, const gp_Vec & Normal);

		/****** GeomFill_Fixed::Copy ******/
		/****** md5 signature: 9645e7734f6f9fcd3bd1e528a8c82987 ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<GeomFill_TrihedronLaw>

Description
-----------
No available documentation.
") Copy;
		virtual opencascade::handle<GeomFill_TrihedronLaw> Copy();

		/****** GeomFill_Fixed::D0 ******/
		/****** md5 signature: 8127a750255133d6fe0cc96880f4f1ab ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
Param: float
Tangent: gp_Vec
Normal: gp_Vec
BiNormal: gp_Vec

Return
-------
bool

Description
-----------
compute Triedrhon on curve at parameter <Param>.
") D0;
		virtual Standard_Boolean D0(const Standard_Real Param, gp_Vec & Tangent, gp_Vec & Normal, gp_Vec & BiNormal);

		/****** GeomFill_Fixed::D1 ******/
		/****** md5 signature: 7b1b7607df3259d1ef02c15ca0ffdd69 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
Param: float
Tangent: gp_Vec
DTangent: gp_Vec
Normal: gp_Vec
DNormal: gp_Vec
BiNormal: gp_Vec
DBiNormal: gp_Vec

Return
-------
bool

Description
-----------
compute Triedrhon and derivative Trihedron on curve at parameter <Param> Warning: It used only for C1 or C2 approximation.
") D1;
		virtual Standard_Boolean D1(const Standard_Real Param, gp_Vec & Tangent, gp_Vec & DTangent, gp_Vec & Normal, gp_Vec & DNormal, gp_Vec & BiNormal, gp_Vec & DBiNormal);

		/****** GeomFill_Fixed::D2 ******/
		/****** md5 signature: e308ebcce924017ac2cd5d4701d10219 ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
Param: float
Tangent: gp_Vec
DTangent: gp_Vec
D2Tangent: gp_Vec
Normal: gp_Vec
DNormal: gp_Vec
D2Normal: gp_Vec
BiNormal: gp_Vec
DBiNormal: gp_Vec
D2BiNormal: gp_Vec

Return
-------
bool

Description
-----------
compute Trihedron on curve first and seconde derivatives. Warning: It used only for C2 approximation.
") D2;
		virtual Standard_Boolean D2(const Standard_Real Param, gp_Vec & Tangent, gp_Vec & DTangent, gp_Vec & D2Tangent, gp_Vec & Normal, gp_Vec & DNormal, gp_Vec & D2Normal, gp_Vec & BiNormal, gp_Vec & DBiNormal, gp_Vec & D2BiNormal);

		/****** GeomFill_Fixed::GetAverageLaw ******/
		/****** md5 signature: e4ba5f43e35cc3444d51c5ee4d7b6fff ******/
		%feature("compactdefaultargs") GetAverageLaw;
		%feature("autodoc", "
Parameters
----------
ATangent: gp_Vec
ANormal: gp_Vec
ABiNormal: gp_Vec

Return
-------
None

Description
-----------
Get average value of Tangent(t) and Normal(t) it is usfull to make fast approximation of rational surfaces.
") GetAverageLaw;
		virtual void GetAverageLaw(gp_Vec & ATangent, gp_Vec & ANormal, gp_Vec & ABiNormal);

		/****** GeomFill_Fixed::Intervals ******/
		/****** md5 signature: 89fb47d5d3721d82826a17cc788156e4 ******/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "
Parameters
----------
T: TColStd_Array1OfReal
S: GeomAbs_Shape

Return
-------
None

Description
-----------
Stores in <T> the parameters bounding the intervals of continuity <S>. //! The array must provide enough room to accommodate for the parameters. i.e. T.Length() > NbIntervals().
") Intervals;
		virtual void Intervals(TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****** GeomFill_Fixed::IsConstant ******/
		/****** md5 signature: 117737bfe11f2fa5e6c2b702110a9201 ******/
		%feature("compactdefaultargs") IsConstant;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return True.
") IsConstant;
		virtual Standard_Boolean IsConstant();

		/****** GeomFill_Fixed::NbIntervals ******/
		/****** md5 signature: f69f597bd42e14bdc81d20aa650b3d54 ******/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "
Parameters
----------
S: GeomAbs_Shape

Return
-------
int

Description
-----------
Returns the number of intervals for continuity <S>. May be one if Continuity(me) >= <S>.
") NbIntervals;
		virtual Standard_Integer NbIntervals(const GeomAbs_Shape S);

};


%make_alias(GeomFill_Fixed)

%extend GeomFill_Fixed {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class GeomFill_Frenet *
************************/
class GeomFill_Frenet : public GeomFill_TrihedronLaw {
	public:
		/****** GeomFill_Frenet::GeomFill_Frenet ******/
		/****** md5 signature: 288a206669314641ffb5fa1c0c70d683 ******/
		%feature("compactdefaultargs") GeomFill_Frenet;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") GeomFill_Frenet;
		 GeomFill_Frenet();

		/****** GeomFill_Frenet::Copy ******/
		/****** md5 signature: 9645e7734f6f9fcd3bd1e528a8c82987 ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<GeomFill_TrihedronLaw>

Description
-----------
No available documentation.
") Copy;
		virtual opencascade::handle<GeomFill_TrihedronLaw> Copy();

		/****** GeomFill_Frenet::D0 ******/
		/****** md5 signature: 8127a750255133d6fe0cc96880f4f1ab ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
Param: float
Tangent: gp_Vec
Normal: gp_Vec
BiNormal: gp_Vec

Return
-------
bool

Description
-----------
compute Triedrhon on curve at parameter <Param>.
") D0;
		virtual Standard_Boolean D0(const Standard_Real Param, gp_Vec & Tangent, gp_Vec & Normal, gp_Vec & BiNormal);

		/****** GeomFill_Frenet::D1 ******/
		/****** md5 signature: 7b1b7607df3259d1ef02c15ca0ffdd69 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
Param: float
Tangent: gp_Vec
DTangent: gp_Vec
Normal: gp_Vec
DNormal: gp_Vec
BiNormal: gp_Vec
DBiNormal: gp_Vec

Return
-------
bool

Description
-----------
compute Triedrhon and derivative Trihedron on curve at parameter <Param> Warning: It used only for C1 or C2 approximation.
") D1;
		virtual Standard_Boolean D1(const Standard_Real Param, gp_Vec & Tangent, gp_Vec & DTangent, gp_Vec & Normal, gp_Vec & DNormal, gp_Vec & BiNormal, gp_Vec & DBiNormal);

		/****** GeomFill_Frenet::D2 ******/
		/****** md5 signature: e308ebcce924017ac2cd5d4701d10219 ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
Param: float
Tangent: gp_Vec
DTangent: gp_Vec
D2Tangent: gp_Vec
Normal: gp_Vec
DNormal: gp_Vec
D2Normal: gp_Vec
BiNormal: gp_Vec
DBiNormal: gp_Vec
D2BiNormal: gp_Vec

Return
-------
bool

Description
-----------
compute Trihedron on curve first and seconde derivatives. Warning: It used only for C2 approximation.
") D2;
		virtual Standard_Boolean D2(const Standard_Real Param, gp_Vec & Tangent, gp_Vec & DTangent, gp_Vec & D2Tangent, gp_Vec & Normal, gp_Vec & DNormal, gp_Vec & D2Normal, gp_Vec & BiNormal, gp_Vec & DBiNormal, gp_Vec & D2BiNormal);

		/****** GeomFill_Frenet::GetAverageLaw ******/
		/****** md5 signature: e4ba5f43e35cc3444d51c5ee4d7b6fff ******/
		%feature("compactdefaultargs") GetAverageLaw;
		%feature("autodoc", "
Parameters
----------
ATangent: gp_Vec
ANormal: gp_Vec
ABiNormal: gp_Vec

Return
-------
None

Description
-----------
Get average value of Tangent(t) and Normal(t) it is usfull to make fast approximation of rational surfaces.
") GetAverageLaw;
		virtual void GetAverageLaw(gp_Vec & ATangent, gp_Vec & ANormal, gp_Vec & ABiNormal);

		/****** GeomFill_Frenet::Init ******/
		/****** md5 signature: 0de93ef32c53d091768788dca0e281fd ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init();

		/****** GeomFill_Frenet::Intervals ******/
		/****** md5 signature: 89fb47d5d3721d82826a17cc788156e4 ******/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "
Parameters
----------
T: TColStd_Array1OfReal
S: GeomAbs_Shape

Return
-------
None

Description
-----------
Stores in <T> the parameters bounding the intervals of continuity <S>. //! The array must provide enough room to accommodate for the parameters. i.e. T.Length() > NbIntervals().
") Intervals;
		virtual void Intervals(TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****** GeomFill_Frenet::IsConstant ******/
		/****** md5 signature: 117737bfe11f2fa5e6c2b702110a9201 ******/
		%feature("compactdefaultargs") IsConstant;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Say if the law is Constant.
") IsConstant;
		virtual Standard_Boolean IsConstant();

		/****** GeomFill_Frenet::IsOnlyBy3dCurve ******/
		/****** md5 signature: dce50a0e4caf3b6774af0413898e9c4b ******/
		%feature("compactdefaultargs") IsOnlyBy3dCurve;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return True.
") IsOnlyBy3dCurve;
		virtual Standard_Boolean IsOnlyBy3dCurve();

		/****** GeomFill_Frenet::NbIntervals ******/
		/****** md5 signature: f69f597bd42e14bdc81d20aa650b3d54 ******/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "
Parameters
----------
S: GeomAbs_Shape

Return
-------
int

Description
-----------
Returns the number of intervals for continuity <S>. May be one if Continuity(me) >= <S>.
") NbIntervals;
		virtual Standard_Integer NbIntervals(const GeomAbs_Shape S);

		/****** GeomFill_Frenet::SetCurve ******/
		/****** md5 signature: b0541b7921a5c5b75a45dc913166e3d3 ******/
		%feature("compactdefaultargs") SetCurve;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve

Return
-------
bool

Description
-----------
initialize curve of frenet law 
Return: Standard_True.
") SetCurve;
		virtual Standard_Boolean SetCurve(const opencascade::handle<Adaptor3d_Curve> & C);

};


%make_alias(GeomFill_Frenet)

%extend GeomFill_Frenet {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class GeomFill_Generator *
***************************/
class GeomFill_Generator : public GeomFill_Profiler {
	public:
		/****** GeomFill_Generator::GeomFill_Generator ******/
		/****** md5 signature: 7ab26cd3e7d707fc8575a1a0a3937407 ******/
		%feature("compactdefaultargs") GeomFill_Generator;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") GeomFill_Generator;
		 GeomFill_Generator();

		/****** GeomFill_Generator::Perform ******/
		/****** md5 signature: 3733dc09fb22e11eab38814671c39e85 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
PTol: float

Return
-------
None

Description
-----------
Converts all curves to BSplineCurves. Set them to the common profile. Compute the surface (degv = 1). <PTol> is used to compare 2 knots.
") Perform;
		virtual void Perform(const Standard_Real PTol);

		/****** GeomFill_Generator::Surface ******/
		/****** md5 signature: a469e18cbceeb351572a461f96ff0f4d ******/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Surface>

Description
-----------
No available documentation.
") Surface;
		const opencascade::handle<Geom_Surface> & Surface();

};


%extend GeomFill_Generator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class GeomFill_LocationDraft *
*******************************/
class GeomFill_LocationDraft : public GeomFill_LocationLaw {
	public:
		/****** GeomFill_LocationDraft::GeomFill_LocationDraft ******/
		/****** md5 signature: d7713d06b5da3938a026ac9f7be9143a ******/
		%feature("compactdefaultargs") GeomFill_LocationDraft;
		%feature("autodoc", "
Parameters
----------
Direction: gp_Dir
Angle: float

Return
-------
None

Description
-----------
No available documentation.
") GeomFill_LocationDraft;
		 GeomFill_LocationDraft(const gp_Dir & Direction, const Standard_Real Angle);

		/****** GeomFill_LocationDraft::Copy ******/
		/****** md5 signature: 6211f5514688258100f0ea82262b2f4b ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<GeomFill_LocationLaw>

Description
-----------
No available documentation.
") Copy;
		virtual opencascade::handle<GeomFill_LocationLaw> Copy();

		/****** GeomFill_LocationDraft::D0 ******/
		/****** md5 signature: 316ea693fc5dcb4b89eef4bd219d0f5e ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
Param: float
M: gp_Mat
V: gp_Vec

Return
-------
bool

Description
-----------
compute Location.
") D0;
		virtual Standard_Boolean D0(const Standard_Real Param, gp_Mat & M, gp_Vec & V);

		/****** GeomFill_LocationDraft::D0 ******/
		/****** md5 signature: 924a51426e408dff0c68c8625c80f165 ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
Param: float
M: gp_Mat
V: gp_Vec
Poles2d: TColgp_Array1OfPnt2d

Return
-------
bool

Description
-----------
compute Location and 2d points.
") D0;
		virtual Standard_Boolean D0(const Standard_Real Param, gp_Mat & M, gp_Vec & V, TColgp_Array1OfPnt2d & Poles2d);

		/****** GeomFill_LocationDraft::D1 ******/
		/****** md5 signature: 288bb22d14e06a66281554b33f433d63 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
Param: float
M: gp_Mat
V: gp_Vec
DM: gp_Mat
DV: gp_Vec
Poles2d: TColgp_Array1OfPnt2d
DPoles2d: TColgp_Array1OfVec2d

Return
-------
bool

Description
-----------
compute location 2d points and associated first derivatives. Warning: It used only for C1 or C2 approximation.
") D1;
		virtual Standard_Boolean D1(const Standard_Real Param, gp_Mat & M, gp_Vec & V, gp_Mat & DM, gp_Vec & DV, TColgp_Array1OfPnt2d & Poles2d, TColgp_Array1OfVec2d & DPoles2d);

		/****** GeomFill_LocationDraft::D2 ******/
		/****** md5 signature: 940621cc935757a0b177b16f7cd72d05 ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
Param: float
M: gp_Mat
V: gp_Vec
DM: gp_Mat
DV: gp_Vec
D2M: gp_Mat
D2V: gp_Vec
Poles2d: TColgp_Array1OfPnt2d
DPoles2d: TColgp_Array1OfVec2d
D2Poles2d: TColgp_Array1OfVec2d

Return
-------
bool

Description
-----------
compute location 2d points and associated first and seconde derivatives. Warning: It used only for C2 approximation.
") D2;
		virtual Standard_Boolean D2(const Standard_Real Param, gp_Mat & M, gp_Vec & V, gp_Mat & DM, gp_Vec & DV, gp_Mat & D2M, gp_Vec & D2V, TColgp_Array1OfPnt2d & Poles2d, TColgp_Array1OfVec2d & DPoles2d, TColgp_Array1OfVec2d & D2Poles2d);

		/****** GeomFill_LocationDraft::Direction ******/
		/****** md5 signature: 7db1622a0b370b4453af0886bb5f840c ******/
		%feature("compactdefaultargs") Direction;
		%feature("autodoc", "Return
-------
gp_Dir

Description
-----------
No available documentation.
") Direction;
		gp_Dir Direction();

		/****** GeomFill_LocationDraft::GetAverageLaw ******/
		/****** md5 signature: c8399d110fc93e54f7a94c0255e22682 ******/
		%feature("compactdefaultargs") GetAverageLaw;
		%feature("autodoc", "
Parameters
----------
AM: gp_Mat
AV: gp_Vec

Return
-------
None

Description
-----------
Get average value of M(t) and V(t) it is usfull to make fast approximation of rational surfaces.
") GetAverageLaw;
		virtual void GetAverageLaw(gp_Mat & AM, gp_Vec & AV);

		/****** GeomFill_LocationDraft::GetCurve ******/
		/****** md5 signature: b5470ee2464d4db2182ec23b2a5e7e7f ******/
		%feature("compactdefaultargs") GetCurve;
		%feature("autodoc", "Return
-------
opencascade::handle<Adaptor3d_Curve>

Description
-----------
No available documentation.
") GetCurve;
		virtual const opencascade::handle<Adaptor3d_Curve> & GetCurve();

		/****** GeomFill_LocationDraft::GetDomain ******/
		/****** md5 signature: 5949ecf80ee7cf5a86623a8a457dd2b9 ******/
		%feature("compactdefaultargs") GetDomain;
		%feature("autodoc", "
Parameters
----------

Return
-------
First: float
Last: float

Description
-----------
Gets the bounds of the function parametric domain. Warning: This domain it is not modified by the SetValue method.
") GetDomain;
		virtual void GetDomain(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** GeomFill_LocationDraft::GetInterval ******/
		/****** md5 signature: 5025922809e891f5aa8a2358198f31e4 ******/
		%feature("compactdefaultargs") GetInterval;
		%feature("autodoc", "
Parameters
----------

Return
-------
First: float
Last: float

Description
-----------
Gets the bounds of the parametric interval on the function.
") GetInterval;
		virtual void GetInterval(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** GeomFill_LocationDraft::GetMaximalNorm ******/
		/****** md5 signature: d33bcb5496370d9914e70fb48ea83d28 ******/
		%feature("compactdefaultargs") GetMaximalNorm;
		%feature("autodoc", "Return
-------
float

Description
-----------
Get the maximum Norm of the matrix-location part. It is usful to find an good Tolerance to approx M(t).
") GetMaximalNorm;
		virtual Standard_Real GetMaximalNorm();

		/****** GeomFill_LocationDraft::HasFirstRestriction ******/
		/****** md5 signature: ccbee780c99b1c07b285852506752491 ******/
		%feature("compactdefaultargs") HasFirstRestriction;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Say if the first restriction is defined in this class. If it is true the first element of poles array in D0,D1,D2... Correspond to this restriction. Returns Standard_False (default implementation).
") HasFirstRestriction;
		virtual Standard_Boolean HasFirstRestriction();

		/****** GeomFill_LocationDraft::HasLastRestriction ******/
		/****** md5 signature: 74a37dbf296a415f833e8fc9033f1e92 ******/
		%feature("compactdefaultargs") HasLastRestriction;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Say if the last restriction is defined in this class. If it is true the last element of poles array in D0,D1,D2... Correspond to this restriction. Returns Standard_False (default implementation).
") HasLastRestriction;
		virtual Standard_Boolean HasLastRestriction();

		/****** GeomFill_LocationDraft::Intervals ******/
		/****** md5 signature: 89fb47d5d3721d82826a17cc788156e4 ******/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "
Parameters
----------
T: TColStd_Array1OfReal
S: GeomAbs_Shape

Return
-------
None

Description
-----------
Stores in <T> the parameters bounding the intervals of continuity <S>. //! The array must provide enough room to accommodate for the parameters. i.e. T.Length() > NbIntervals().
") Intervals;
		virtual void Intervals(TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****** GeomFill_LocationDraft::IsIntersec ******/
		/****** md5 signature: 2edf1ff5440c6e25ebd8f0348eb8f041 ******/
		%feature("compactdefaultargs") IsIntersec;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Say if the generatrice interset the surface.
") IsIntersec;
		Standard_Boolean IsIntersec();

		/****** GeomFill_LocationDraft::IsRotation ******/
		/****** md5 signature: 69c76c5168e987b8419ad259813fc9af ******/
		%feature("compactdefaultargs") IsRotation;
		%feature("autodoc", "
Parameters
----------

Return
-------
Error: float

Description
-----------
Say if the Location Law, is a rotation of Location The default implementation is ' returns False '.
") IsRotation;
		virtual Standard_Boolean IsRotation(Standard_Real &OutValue);

		/****** GeomFill_LocationDraft::IsTranslation ******/
		/****** md5 signature: 4064d79964f3a03428b0eb9740c21e0f ******/
		%feature("compactdefaultargs") IsTranslation;
		%feature("autodoc", "
Parameters
----------

Return
-------
Error: float

Description
-----------
Say if the Location Law, is an translation of Location The default implementation is ' returns False '.
") IsTranslation;
		virtual Standard_Boolean IsTranslation(Standard_Real &OutValue);

		/****** GeomFill_LocationDraft::NbIntervals ******/
		/****** md5 signature: f69f597bd42e14bdc81d20aa650b3d54 ******/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "
Parameters
----------
S: GeomAbs_Shape

Return
-------
int

Description
-----------
Returns the number of intervals for continuity <S>. May be one if Continuity(me) >= <S>.
") NbIntervals;
		virtual Standard_Integer NbIntervals(const GeomAbs_Shape S);

		/****** GeomFill_LocationDraft::Resolution ******/
		/****** md5 signature: ed5d1e3e2211bf035576b0c56d934522 ******/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "
Parameters
----------
Index: int
Tol: float

Return
-------
TolU: float
TolV: float

Description
-----------
Returns the resolutions in the sub-space 2d <Index> This information is usfull to find an good tolerance in 2d approximation. Warning: Used only if Nb2dCurve > 0.
") Resolution;
		virtual void Resolution(const Standard_Integer Index, const Standard_Real Tol, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** GeomFill_LocationDraft::Rotation ******/
		/****** md5 signature: b76821e717ce4d2049156bbde7eb7114 ******/
		%feature("compactdefaultargs") Rotation;
		%feature("autodoc", "
Parameters
----------
Center: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") Rotation;
		virtual void Rotation(gp_Pnt & Center);

		/****** GeomFill_LocationDraft::SetAngle ******/
		/****** md5 signature: a0d60e2a1ea25c193dafa15194b0ab24 ******/
		%feature("compactdefaultargs") SetAngle;
		%feature("autodoc", "
Parameters
----------
Angle: float

Return
-------
None

Description
-----------
No available documentation.
") SetAngle;
		void SetAngle(const Standard_Real Angle);

		/****** GeomFill_LocationDraft::SetCurve ******/
		/****** md5 signature: b0541b7921a5c5b75a45dc913166e3d3 ******/
		%feature("compactdefaultargs") SetCurve;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve

Return
-------
bool

Description
-----------
calculation of poles on locking surfaces (the intersection between the generatrixand the surface at the cross - section points myNbPts) 
Return: Standard_True in case if execution end correctly.
") SetCurve;
		virtual Standard_Boolean SetCurve(const opencascade::handle<Adaptor3d_Curve> & C);

		/****** GeomFill_LocationDraft::SetInterval ******/
		/****** md5 signature: 09d00fda8057705f50d4a0bf656696ed ******/
		%feature("compactdefaultargs") SetInterval;
		%feature("autodoc", "
Parameters
----------
First: float
Last: float

Return
-------
None

Description
-----------
Sets the bounds of the parametric interval on the function This determines the derivatives in these values if the function is not Cn.
") SetInterval;
		virtual void SetInterval(const Standard_Real First, const Standard_Real Last);

		/****** GeomFill_LocationDraft::SetStopSurf ******/
		/****** md5 signature: 27ac1cb5a5e32dd01b46f24b3bd0230c ******/
		%feature("compactdefaultargs") SetStopSurf;
		%feature("autodoc", "
Parameters
----------
Surf: Adaptor3d_Surface

Return
-------
None

Description
-----------
No available documentation.
") SetStopSurf;
		void SetStopSurf(const opencascade::handle<Adaptor3d_Surface> & Surf);

		/****** GeomFill_LocationDraft::SetTrsf ******/
		/****** md5 signature: 52b4e29e16b9b86f3d7835907847b3d0 ******/
		%feature("compactdefaultargs") SetTrsf;
		%feature("autodoc", "
Parameters
----------
Transfo: gp_Mat

Return
-------
None

Description
-----------
No available documentation.
") SetTrsf;
		virtual void SetTrsf(const gp_Mat & Transfo);

		/****** GeomFill_LocationDraft::TraceNumber ******/
		/****** md5 signature: 603a2d12181693878dfcc406bb4cd8ac ******/
		%feature("compactdefaultargs") TraceNumber;
		%feature("autodoc", "Return
-------
int

Description
-----------
Give the number of trace (Curves 2d which are not restriction) Returns 1 (default implementation).
") TraceNumber;
		virtual Standard_Integer TraceNumber();

};


%make_alias(GeomFill_LocationDraft)

%extend GeomFill_LocationDraft {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class GeomFill_LocationGuide *
*******************************/
class GeomFill_LocationGuide : public GeomFill_LocationLaw {
	public:
		/****** GeomFill_LocationGuide::GeomFill_LocationGuide ******/
		/****** md5 signature: 136dfedf65ea6a2c7c98ae444031587f ******/
		%feature("compactdefaultargs") GeomFill_LocationGuide;
		%feature("autodoc", "
Parameters
----------
Triedre: GeomFill_TrihedronWithGuide

Return
-------
None

Description
-----------
No available documentation.
") GeomFill_LocationGuide;
		 GeomFill_LocationGuide(const opencascade::handle<GeomFill_TrihedronWithGuide> & Triedre);

		/****** GeomFill_LocationGuide::ComputeAutomaticLaw ******/
		/****** md5 signature: cbfc9f5ba26398ec5c16dc921f27bd12 ******/
		%feature("compactdefaultargs") ComputeAutomaticLaw;
		%feature("autodoc", "
Parameters
----------
ParAndRad: TColgp_HArray1OfPnt2d

Return
-------
GeomFill_PipeError

Description
-----------
No available documentation.
") ComputeAutomaticLaw;
		GeomFill_PipeError ComputeAutomaticLaw(opencascade::handle<TColgp_HArray1OfPnt2d> & ParAndRad);

		/****** GeomFill_LocationGuide::Copy ******/
		/****** md5 signature: 6211f5514688258100f0ea82262b2f4b ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<GeomFill_LocationLaw>

Description
-----------
No available documentation.
") Copy;
		virtual opencascade::handle<GeomFill_LocationLaw> Copy();

		/****** GeomFill_LocationGuide::D0 ******/
		/****** md5 signature: 316ea693fc5dcb4b89eef4bd219d0f5e ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
Param: float
M: gp_Mat
V: gp_Vec

Return
-------
bool

Description
-----------
compute Location.
") D0;
		virtual Standard_Boolean D0(const Standard_Real Param, gp_Mat & M, gp_Vec & V);

		/****** GeomFill_LocationGuide::D0 ******/
		/****** md5 signature: 924a51426e408dff0c68c8625c80f165 ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
Param: float
M: gp_Mat
V: gp_Vec
Poles2d: TColgp_Array1OfPnt2d

Return
-------
bool

Description
-----------
compute Location and 2d points.
") D0;
		virtual Standard_Boolean D0(const Standard_Real Param, gp_Mat & M, gp_Vec & V, TColgp_Array1OfPnt2d & Poles2d);

		/****** GeomFill_LocationGuide::D1 ******/
		/****** md5 signature: 288bb22d14e06a66281554b33f433d63 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
Param: float
M: gp_Mat
V: gp_Vec
DM: gp_Mat
DV: gp_Vec
Poles2d: TColgp_Array1OfPnt2d
DPoles2d: TColgp_Array1OfVec2d

Return
-------
bool

Description
-----------
compute location 2d points and associated first derivatives. Warning: It used only for C1 or C2 approximation.
") D1;
		virtual Standard_Boolean D1(const Standard_Real Param, gp_Mat & M, gp_Vec & V, gp_Mat & DM, gp_Vec & DV, TColgp_Array1OfPnt2d & Poles2d, TColgp_Array1OfVec2d & DPoles2d);

		/****** GeomFill_LocationGuide::D2 ******/
		/****** md5 signature: 940621cc935757a0b177b16f7cd72d05 ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
Param: float
M: gp_Mat
V: gp_Vec
DM: gp_Mat
DV: gp_Vec
D2M: gp_Mat
D2V: gp_Vec
Poles2d: TColgp_Array1OfPnt2d
DPoles2d: TColgp_Array1OfVec2d
D2Poles2d: TColgp_Array1OfVec2d

Return
-------
bool

Description
-----------
compute location 2d points and associated first and seconde derivatives. Warning: It used only for C2 approximation.
") D2;
		virtual Standard_Boolean D2(const Standard_Real Param, gp_Mat & M, gp_Vec & V, gp_Mat & DM, gp_Vec & DV, gp_Mat & D2M, gp_Vec & D2V, TColgp_Array1OfPnt2d & Poles2d, TColgp_Array1OfVec2d & DPoles2d, TColgp_Array1OfVec2d & D2Poles2d);

		/****** GeomFill_LocationGuide::EraseRotation ******/
		/****** md5 signature: 2a36e5d874195d280379b1872ee5893a ******/
		%feature("compactdefaultargs") EraseRotation;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") EraseRotation;
		void EraseRotation();

		/****** GeomFill_LocationGuide::ErrorStatus ******/
		/****** md5 signature: 0524df84e8d9c275d5bcd5d3fe7977dc ******/
		%feature("compactdefaultargs") ErrorStatus;
		%feature("autodoc", "Return
-------
GeomFill_PipeError

Description
-----------
Give a status to the Law Returns PipeOk (default implementation).
") ErrorStatus;
		virtual GeomFill_PipeError ErrorStatus();

		/****** GeomFill_LocationGuide::GetAverageLaw ******/
		/****** md5 signature: c8399d110fc93e54f7a94c0255e22682 ******/
		%feature("compactdefaultargs") GetAverageLaw;
		%feature("autodoc", "
Parameters
----------
AM: gp_Mat
AV: gp_Vec

Return
-------
None

Description
-----------
Get average value of M(t) and V(t) it is usfull to make fast approximation of rational surfaces.
") GetAverageLaw;
		virtual void GetAverageLaw(gp_Mat & AM, gp_Vec & AV);

		/****** GeomFill_LocationGuide::GetCurve ******/
		/****** md5 signature: b5470ee2464d4db2182ec23b2a5e7e7f ******/
		%feature("compactdefaultargs") GetCurve;
		%feature("autodoc", "Return
-------
opencascade::handle<Adaptor3d_Curve>

Description
-----------
No available documentation.
") GetCurve;
		virtual const opencascade::handle<Adaptor3d_Curve> & GetCurve();

		/****** GeomFill_LocationGuide::GetDomain ******/
		/****** md5 signature: 5949ecf80ee7cf5a86623a8a457dd2b9 ******/
		%feature("compactdefaultargs") GetDomain;
		%feature("autodoc", "
Parameters
----------

Return
-------
First: float
Last: float

Description
-----------
Gets the bounds of the function parametric domain. Warning: This domain it is not modified by the SetValue method.
") GetDomain;
		virtual void GetDomain(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** GeomFill_LocationGuide::GetInterval ******/
		/****** md5 signature: 5025922809e891f5aa8a2358198f31e4 ******/
		%feature("compactdefaultargs") GetInterval;
		%feature("autodoc", "
Parameters
----------

Return
-------
First: float
Last: float

Description
-----------
Gets the bounds of the parametric interval on the function.
") GetInterval;
		virtual void GetInterval(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** GeomFill_LocationGuide::GetMaximalNorm ******/
		/****** md5 signature: d33bcb5496370d9914e70fb48ea83d28 ******/
		%feature("compactdefaultargs") GetMaximalNorm;
		%feature("autodoc", "Return
-------
float

Description
-----------
Get the maximum Norm of the matrix-location part. It is usful to find an good Tolerance to approx M(t).
") GetMaximalNorm;
		virtual Standard_Real GetMaximalNorm();

		/****** GeomFill_LocationGuide::Guide ******/
		/****** md5 signature: c51ccc2583f44ed177afcd058430a88a ******/
		%feature("compactdefaultargs") Guide;
		%feature("autodoc", "Return
-------
opencascade::handle<Adaptor3d_Curve>

Description
-----------
No available documentation.
") Guide;
		opencascade::handle<Adaptor3d_Curve> Guide();

		/****** GeomFill_LocationGuide::HasFirstRestriction ******/
		/****** md5 signature: ccbee780c99b1c07b285852506752491 ******/
		%feature("compactdefaultargs") HasFirstRestriction;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Say if the first restriction is defined in this class. If it is true the first element of poles array in D0,D1,D2... Correspond to this restriction. Returns Standard_False (default implementation).
") HasFirstRestriction;
		virtual Standard_Boolean HasFirstRestriction();

		/****** GeomFill_LocationGuide::HasLastRestriction ******/
		/****** md5 signature: 74a37dbf296a415f833e8fc9033f1e92 ******/
		%feature("compactdefaultargs") HasLastRestriction;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Say if the last restriction is defined in this class. If it is true the last element of poles array in D0,D1,D2... Correspond to this restriction. Returns Standard_False (default implementation).
") HasLastRestriction;
		virtual Standard_Boolean HasLastRestriction();

		/****** GeomFill_LocationGuide::Intervals ******/
		/****** md5 signature: 89fb47d5d3721d82826a17cc788156e4 ******/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "
Parameters
----------
T: TColStd_Array1OfReal
S: GeomAbs_Shape

Return
-------
None

Description
-----------
Stores in <T> the parameters bounding the intervals of continuity <S>. //! The array must provide enough room to accommodate for the parameters. i.e. T.Length() > NbIntervals().
") Intervals;
		virtual void Intervals(TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****** GeomFill_LocationGuide::IsRotation ******/
		/****** md5 signature: 69c76c5168e987b8419ad259813fc9af ******/
		%feature("compactdefaultargs") IsRotation;
		%feature("autodoc", "
Parameters
----------

Return
-------
Error: float

Description
-----------
Say if the Location Law, is a rotation of Location The default implementation is ' returns False '.
") IsRotation;
		virtual Standard_Boolean IsRotation(Standard_Real &OutValue);

		/****** GeomFill_LocationGuide::IsTranslation ******/
		/****** md5 signature: 4064d79964f3a03428b0eb9740c21e0f ******/
		%feature("compactdefaultargs") IsTranslation;
		%feature("autodoc", "
Parameters
----------

Return
-------
Error: float

Description
-----------
Say if the Location Law, is an translation of Location The default implementation is ' returns False '.
") IsTranslation;
		virtual Standard_Boolean IsTranslation(Standard_Real &OutValue);

		/****** GeomFill_LocationGuide::NbIntervals ******/
		/****** md5 signature: f69f597bd42e14bdc81d20aa650b3d54 ******/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "
Parameters
----------
S: GeomAbs_Shape

Return
-------
int

Description
-----------
Returns the number of intervals for continuity <S>. May be one if Continuity(me) >= <S>.
") NbIntervals;
		virtual Standard_Integer NbIntervals(const GeomAbs_Shape S);

		/****** GeomFill_LocationGuide::Resolution ******/
		/****** md5 signature: ed5d1e3e2211bf035576b0c56d934522 ******/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "
Parameters
----------
Index: int
Tol: float

Return
-------
TolU: float
TolV: float

Description
-----------
Returns the resolutions in the sub-space 2d <Index> This information is usfull to find an good tolerance in 2d approximation. Warning: Used only if Nb2dCurve > 0.
") Resolution;
		virtual void Resolution(const Standard_Integer Index, const Standard_Real Tol, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** GeomFill_LocationGuide::Rotation ******/
		/****** md5 signature: b76821e717ce4d2049156bbde7eb7114 ******/
		%feature("compactdefaultargs") Rotation;
		%feature("autodoc", "
Parameters
----------
Center: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") Rotation;
		virtual void Rotation(gp_Pnt & Center);

		/****** GeomFill_LocationGuide::Section ******/
		/****** md5 signature: f9bca12fa783e47192673ca3f07be5a5 ******/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Curve>

Description
-----------
No available documentation.
") Section;
		opencascade::handle<Geom_Curve> Section();

		/****** GeomFill_LocationGuide::Set ******/
		/****** md5 signature: 4de0dc1362ddd21a958ddc8382ea6c1d ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
Section: GeomFill_SectionLaw
rotat: bool
SFirst: float
SLast: float
PrecAngle: float

Return
-------
LastAngle: float

Description
-----------
No available documentation.
") Set;
		void Set(const opencascade::handle<GeomFill_SectionLaw> & Section, const Standard_Boolean rotat, const Standard_Real SFirst, const Standard_Real SLast, const Standard_Real PrecAngle, Standard_Real &OutValue);

		/****** GeomFill_LocationGuide::SetCurve ******/
		/****** md5 signature: b0541b7921a5c5b75a45dc913166e3d3 ******/
		%feature("compactdefaultargs") SetCurve;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve

Return
-------
bool

Description
-----------
calculating poles on a surface (courbe guide / the surface of rotation in points myNbPts) 
Return: Standard_True.
") SetCurve;
		virtual Standard_Boolean SetCurve(const opencascade::handle<Adaptor3d_Curve> & C);

		/****** GeomFill_LocationGuide::SetInterval ******/
		/****** md5 signature: 09d00fda8057705f50d4a0bf656696ed ******/
		%feature("compactdefaultargs") SetInterval;
		%feature("autodoc", "
Parameters
----------
First: float
Last: float

Return
-------
None

Description
-----------
Sets the bounds of the parametric interval on the function This determines the derivatives in these values if the function is not Cn.
") SetInterval;
		virtual void SetInterval(const Standard_Real First, const Standard_Real Last);

		/****** GeomFill_LocationGuide::SetOrigine ******/
		/****** md5 signature: fe581f3dcaec0cd160e673a6c833f73a ******/
		%feature("compactdefaultargs") SetOrigine;
		%feature("autodoc", "
Parameters
----------
Param1: float
Param2: float

Return
-------
None

Description
-----------
No available documentation.
") SetOrigine;
		void SetOrigine(const Standard_Real Param1, const Standard_Real Param2);

		/****** GeomFill_LocationGuide::SetTolerance ******/
		/****** md5 signature: bf0b5b1b4d35ebad7b1b81b0b9b8ba2c ******/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "
Parameters
----------
Tol3d: float
Tol2d: float

Return
-------
None

Description
-----------
Is useful, if (me) have to run numerical algorithm to perform D0, D1 or D2 The default implementation make nothing.
") SetTolerance;
		virtual void SetTolerance(const Standard_Real Tol3d, const Standard_Real Tol2d);

		/****** GeomFill_LocationGuide::SetTrsf ******/
		/****** md5 signature: 52b4e29e16b9b86f3d7835907847b3d0 ******/
		%feature("compactdefaultargs") SetTrsf;
		%feature("autodoc", "
Parameters
----------
Transfo: gp_Mat

Return
-------
None

Description
-----------
No available documentation.
") SetTrsf;
		virtual void SetTrsf(const gp_Mat & Transfo);

		/****** GeomFill_LocationGuide::TraceNumber ******/
		/****** md5 signature: 603a2d12181693878dfcc406bb4cd8ac ******/
		%feature("compactdefaultargs") TraceNumber;
		%feature("autodoc", "Return
-------
int

Description
-----------
Give the number of trace (Curves 2d which are not restriction) Returns 1 (default implementation).
") TraceNumber;
		virtual Standard_Integer TraceNumber();

};


%make_alias(GeomFill_LocationGuide)

%extend GeomFill_LocationGuide {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class GeomFill_NSections *
***************************/
class GeomFill_NSections : public GeomFill_SectionLaw {
	public:
		/****** GeomFill_NSections::GeomFill_NSections ******/
		/****** md5 signature: 0d9de61d62ecb7757dcd4d340c2a039b ******/
		%feature("compactdefaultargs") GeomFill_NSections;
		%feature("autodoc", "
Parameters
----------
NC: TColGeom_SequenceOfCurve

Return
-------
None

Description
-----------
Make a SectionLaw with N Curves.
") GeomFill_NSections;
		 GeomFill_NSections(const TColGeom_SequenceOfCurve & NC);

		/****** GeomFill_NSections::GeomFill_NSections ******/
		/****** md5 signature: b6026d7641aed88e8faa4632aecda31b ******/
		%feature("compactdefaultargs") GeomFill_NSections;
		%feature("autodoc", "
Parameters
----------
NC: TColGeom_SequenceOfCurve
NP: TColStd_SequenceOfReal

Return
-------
None

Description
-----------
Make a SectionLaw with N Curves and N associated parameters.
") GeomFill_NSections;
		 GeomFill_NSections(const TColGeom_SequenceOfCurve & NC, const TColStd_SequenceOfReal & NP);

		/****** GeomFill_NSections::GeomFill_NSections ******/
		/****** md5 signature: 979fe2339b2fd239655f9ddec9dcb075 ******/
		%feature("compactdefaultargs") GeomFill_NSections;
		%feature("autodoc", "
Parameters
----------
NC: TColGeom_SequenceOfCurve
NP: TColStd_SequenceOfReal
UF: float
UL: float
VF: float
VL: float

Return
-------
None

Description
-----------
Make a SectionLaw with N Curves and N associated parameters. UF and UL are the parametric bounds of the NSections VF and VL are the parametric bounds of the path.
") GeomFill_NSections;
		 GeomFill_NSections(const TColGeom_SequenceOfCurve & NC, const TColStd_SequenceOfReal & NP, const Standard_Real UF, const Standard_Real UL, const Standard_Real VF, const Standard_Real VL);

		/****** GeomFill_NSections::GeomFill_NSections ******/
		/****** md5 signature: beb7f1c7e304223c771db4b9243db92d ******/
		%feature("compactdefaultargs") GeomFill_NSections;
		%feature("autodoc", "
Parameters
----------
NC: TColGeom_SequenceOfCurve
Trsfs: GeomFill_SequenceOfTrsf
NP: TColStd_SequenceOfReal
UF: float
UL: float
VF: float
VL: float
Surf: Geom_BSplineSurface

Return
-------
None

Description
-----------
Make a SectionLaw with N Curves and N associated parameters. UF and UL are the parametric bounds of the NSections VF and VL are the parametric bounds of the path UF and UL are the parametric bounds of the NSections Surf is a reference surface used by BRepFill_NSections.
") GeomFill_NSections;
		 GeomFill_NSections(const TColGeom_SequenceOfCurve & NC, const GeomFill_SequenceOfTrsf & Trsfs, const TColStd_SequenceOfReal & NP, const Standard_Real UF, const Standard_Real UL, const Standard_Real VF, const Standard_Real VL, const opencascade::handle<Geom_BSplineSurface> & Surf);

		/****** GeomFill_NSections::BSplineSurface ******/
		/****** md5 signature: 723eb488e2a06d913977b581dcccba8f ******/
		%feature("compactdefaultargs") BSplineSurface;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_BSplineSurface>

Description
-----------
give if possible an bspline Surface, like iso-v are the section. If it is not possible this methode have to get an Null Surface. Is it the default implementation.
") BSplineSurface;
		virtual opencascade::handle<Geom_BSplineSurface> BSplineSurface();

		/****** GeomFill_NSections::BarycentreOfSurf ******/
		/****** md5 signature: a691940df52b45c198f3414d0790e091 ******/
		%feature("compactdefaultargs") BarycentreOfSurf;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Get the barycentre of Surface. An very poor estimation is sufficient. This information is useful to perform well conditioned rational approximation. Warning: Used only if <self> IsRational.
") BarycentreOfSurf;
		virtual gp_Pnt BarycentreOfSurf();

		/****** GeomFill_NSections::CirclSection ******/
		/****** md5 signature: f8ab2465d0ffa1d0b9c5f4f02cd11e1d ******/
		%feature("compactdefaultargs") CirclSection;
		%feature("autodoc", "
Parameters
----------
Param: float

Return
-------
opencascade::handle<Geom_Curve>

Description
-----------
Return the circle section at parameter <Param>, if <self> a IsConicalLaw.
") CirclSection;
		virtual opencascade::handle<Geom_Curve> CirclSection(const Standard_Real Param);

		/****** GeomFill_NSections::ComputeSurface ******/
		/****** md5 signature: 476c520f64187195041f7fc66a49e45d ******/
		%feature("compactdefaultargs") ComputeSurface;
		%feature("autodoc", "Return
-------
None

Description
-----------
Computes the surface.
") ComputeSurface;
		void ComputeSurface();

		/****** GeomFill_NSections::ConstantSection ******/
		/****** md5 signature: 86519bb197ca223d0ba2720b381f4036 ******/
		%feature("compactdefaultargs") ConstantSection;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Curve>

Description
-----------
Return the constant Section if <self> IsConstant.
") ConstantSection;
		virtual opencascade::handle<Geom_Curve> ConstantSection();

		/****** GeomFill_NSections::D0 ******/
		/****** md5 signature: d889e1bd3dadd721c935f604be609d57 ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
Param: float
Poles: TColgp_Array1OfPnt
Weigths: TColStd_Array1OfReal

Return
-------
bool

Description
-----------
compute the section for v = param.
") D0;
		virtual Standard_Boolean D0(const Standard_Real Param, TColgp_Array1OfPnt & Poles, TColStd_Array1OfReal & Weigths);

		/****** GeomFill_NSections::D1 ******/
		/****** md5 signature: 127f80b4c43e681b4262dad7d1db79d7 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
Param: float
Poles: TColgp_Array1OfPnt
DPoles: TColgp_Array1OfVec
Weigths: TColStd_Array1OfReal
DWeigths: TColStd_Array1OfReal

Return
-------
bool

Description
-----------
compute the first derivative in v direction of the section for v = param Warning: It used only for C1 or C2 approximation.
") D1;
		virtual Standard_Boolean D1(const Standard_Real Param, TColgp_Array1OfPnt & Poles, TColgp_Array1OfVec & DPoles, TColStd_Array1OfReal & Weigths, TColStd_Array1OfReal & DWeigths);

		/****** GeomFill_NSections::D2 ******/
		/****** md5 signature: e7553cf232323cae7964c205cd5a06a9 ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
Param: float
Poles: TColgp_Array1OfPnt
DPoles: TColgp_Array1OfVec
D2Poles: TColgp_Array1OfVec
Weigths: TColStd_Array1OfReal
DWeigths: TColStd_Array1OfReal
D2Weigths: TColStd_Array1OfReal

Return
-------
bool

Description
-----------
compute the second derivative in v direction of the section for v = param Warning: It used only for C2 approximation.
") D2;
		virtual Standard_Boolean D2(const Standard_Real Param, TColgp_Array1OfPnt & Poles, TColgp_Array1OfVec & DPoles, TColgp_Array1OfVec & D2Poles, TColStd_Array1OfReal & Weigths, TColStd_Array1OfReal & DWeigths, TColStd_Array1OfReal & D2Weigths);

		/****** GeomFill_NSections::GetDomain ******/
		/****** md5 signature: 5949ecf80ee7cf5a86623a8a457dd2b9 ******/
		%feature("compactdefaultargs") GetDomain;
		%feature("autodoc", "
Parameters
----------

Return
-------
First: float
Last: float

Description
-----------
Gets the bounds of the function parametric domain. Warning: This domain it is not modified by the SetValue method.
") GetDomain;
		virtual void GetDomain(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** GeomFill_NSections::GetInterval ******/
		/****** md5 signature: 5025922809e891f5aa8a2358198f31e4 ******/
		%feature("compactdefaultargs") GetInterval;
		%feature("autodoc", "
Parameters
----------

Return
-------
First: float
Last: float

Description
-----------
Gets the bounds of the parametric interval on the function.
") GetInterval;
		virtual void GetInterval(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** GeomFill_NSections::GetMinimalWeight ******/
		/****** md5 signature: 36fb20110448cba55b750bc7db93d222 ******/
		%feature("compactdefaultargs") GetMinimalWeight;
		%feature("autodoc", "
Parameters
----------
Weigths: TColStd_Array1OfReal

Return
-------
None

Description
-----------
Compute the minimal value of weight for each poles in all sections. This information is useful to control error in rational approximation. Warning: Used only if <self> IsRational.
") GetMinimalWeight;
		virtual void GetMinimalWeight(TColStd_Array1OfReal & Weigths);

		/****** GeomFill_NSections::GetTolerance ******/
		/****** md5 signature: 3f6ec4398981d416a51435f14d7cee22 ******/
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "
Parameters
----------
BoundTol: float
SurfTol: float
AngleTol: float
Tol3d: TColStd_Array1OfReal

Return
-------
None

Description
-----------
Returns the tolerances associated at each poles to reach in approximation, to satisfy: BoundTol error at the Boundary AngleTol tangent error at the Boundary (in radian) SurfTol error inside the surface.
") GetTolerance;
		virtual void GetTolerance(const Standard_Real BoundTol, const Standard_Real SurfTol, const Standard_Real AngleTol, TColStd_Array1OfReal & Tol3d);

		/****** GeomFill_NSections::Intervals ******/
		/****** md5 signature: 89fb47d5d3721d82826a17cc788156e4 ******/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "
Parameters
----------
T: TColStd_Array1OfReal
S: GeomAbs_Shape

Return
-------
None

Description
-----------
Stores in <T> the parameters bounding the intervals of continuity <S>. //! The array must provide enough room to accommodate for the parameters. i.e. T.Length() > NbIntervals().
") Intervals;
		virtual void Intervals(TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****** GeomFill_NSections::IsConicalLaw ******/
		/****** md5 signature: 650c3ea527a26e948c9d1fcec0b7a9f1 ******/
		%feature("compactdefaultargs") IsConicalLaw;
		%feature("autodoc", "
Parameters
----------

Return
-------
Error: float

Description
-----------
Returns True if all section are circle, with same plane,same center and linear radius evolution Return False by Default.
") IsConicalLaw;
		virtual Standard_Boolean IsConicalLaw(Standard_Real &OutValue);

		/****** GeomFill_NSections::IsConstant ******/
		/****** md5 signature: b8fcd911afc2577f90f33f0c8d046c8a ******/
		%feature("compactdefaultargs") IsConstant;
		%feature("autodoc", "
Parameters
----------

Return
-------
Error: float

Description
-----------
return True If the Law isConstant.
") IsConstant;
		virtual Standard_Boolean IsConstant(Standard_Real &OutValue);

		/****** GeomFill_NSections::IsRational ******/
		/****** md5 signature: 2a6f0ec7e4a129780b654d163e7e3b1c ******/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns if the sections are rational or not.
") IsRational;
		virtual Standard_Boolean IsRational();

		/****** GeomFill_NSections::IsUPeriodic ******/
		/****** md5 signature: ee1d04d096d58c0c69971438c1aa71fc ******/
		%feature("compactdefaultargs") IsUPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns if the sections are periodic or not.
") IsUPeriodic;
		virtual Standard_Boolean IsUPeriodic();

		/****** GeomFill_NSections::IsVPeriodic ******/
		/****** md5 signature: c62bf083eb7bc6b915c3cdeea2fc8406 ******/
		%feature("compactdefaultargs") IsVPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns if the law isperiodic or not.
") IsVPeriodic;
		virtual Standard_Boolean IsVPeriodic();

		/****** GeomFill_NSections::Knots ******/
		/****** md5 signature: 25dbe24e24c953c2c68b0d008e63e5d6 ******/
		%feature("compactdefaultargs") Knots;
		%feature("autodoc", "
Parameters
----------
TKnots: TColStd_Array1OfReal

Return
-------
None

Description
-----------
get the Knots of the section.
") Knots;
		virtual void Knots(TColStd_Array1OfReal & TKnots);

		/****** GeomFill_NSections::MaximalSection ******/
		/****** md5 signature: b8f0d759fcd21b95d400b3aae3c12cfc ******/
		%feature("compactdefaultargs") MaximalSection;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the length of the greater section. This information is useful to G1's control. Warning: With an little value, approximation can be slower.
") MaximalSection;
		virtual Standard_Real MaximalSection();

		/****** GeomFill_NSections::Mults ******/
		/****** md5 signature: 033dc1fab9e10e705c796ffc1e03a44d ******/
		%feature("compactdefaultargs") Mults;
		%feature("autodoc", "
Parameters
----------
TMults: TColStd_Array1OfInteger

Return
-------
None

Description
-----------
get the Multplicities of the section.
") Mults;
		virtual void Mults(TColStd_Array1OfInteger & TMults);

		/****** GeomFill_NSections::NbIntervals ******/
		/****** md5 signature: f69f597bd42e14bdc81d20aa650b3d54 ******/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "
Parameters
----------
S: GeomAbs_Shape

Return
-------
int

Description
-----------
Returns the number of intervals for continuity <S>. May be one if Continuity(me) >= <S>.
") NbIntervals;
		virtual Standard_Integer NbIntervals(const GeomAbs_Shape S);

		/****** GeomFill_NSections::SectionShape ******/
		/****** md5 signature: 4b057291e9e338f8d299ce252e7fb36b ******/
		%feature("compactdefaultargs") SectionShape;
		%feature("autodoc", "
Parameters
----------

Return
-------
NbPoles: int
NbKnots: int
Degree: int

Description
-----------
get the format of an section.
") SectionShape;
		virtual void SectionShape(Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****** GeomFill_NSections::SetInterval ******/
		/****** md5 signature: 09d00fda8057705f50d4a0bf656696ed ******/
		%feature("compactdefaultargs") SetInterval;
		%feature("autodoc", "
Parameters
----------
First: float
Last: float

Return
-------
None

Description
-----------
Sets the bounds of the parametric interval on the function This determines the derivatives in these values if the function is not Cn.
") SetInterval;
		virtual void SetInterval(const Standard_Real First, const Standard_Real Last);

		/****** GeomFill_NSections::SetSurface ******/
		/****** md5 signature: f01d27fcfb76b333f1ccc32457928336 ******/
		%feature("compactdefaultargs") SetSurface;
		%feature("autodoc", "
Parameters
----------
RefSurf: Geom_BSplineSurface

Return
-------
None

Description
-----------
Sets the reference surface.
") SetSurface;
		void SetSurface(const opencascade::handle<Geom_BSplineSurface> & RefSurf);

};


%make_alias(GeomFill_NSections)

%extend GeomFill_NSections {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class GeomFill_SectionGenerator *
**********************************/
class GeomFill_SectionGenerator : public GeomFill_Profiler {
	public:
		/****** GeomFill_SectionGenerator::GeomFill_SectionGenerator ******/
		/****** md5 signature: dca68bc2332bb276f5d183db1f4a4460 ******/
		%feature("compactdefaultargs") GeomFill_SectionGenerator;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") GeomFill_SectionGenerator;
		 GeomFill_SectionGenerator();

		/****** GeomFill_SectionGenerator::GetShape ******/
		/****** md5 signature: 6fa2df877c22a0270d6d56c00ebd130a ******/
		%feature("compactdefaultargs") GetShape;
		%feature("autodoc", "
Parameters
----------

Return
-------
NbPoles: int
NbKnots: int
Degree: int
NbPoles2d: int

Description
-----------
No available documentation.
") GetShape;
		void GetShape(Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****** GeomFill_SectionGenerator::Knots ******/
		/****** md5 signature: 4ce44c7a3fc1e54d65161ad10947be07 ******/
		%feature("compactdefaultargs") Knots;
		%feature("autodoc", "
Parameters
----------
TKnots: TColStd_Array1OfReal

Return
-------
None

Description
-----------
No available documentation.
") Knots;
		void Knots(TColStd_Array1OfReal & TKnots);

		/****** GeomFill_SectionGenerator::Mults ******/
		/****** md5 signature: 010f762aa4509ca765334728b1b5f9d3 ******/
		%feature("compactdefaultargs") Mults;
		%feature("autodoc", "
Parameters
----------
TMults: TColStd_Array1OfInteger

Return
-------
None

Description
-----------
No available documentation.
") Mults;
		void Mults(TColStd_Array1OfInteger & TMults);

		/****** GeomFill_SectionGenerator::Parameter ******/
		/****** md5 signature: 8b634e347a83843e998af17b94636e6a ******/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "
Parameters
----------
P: int

Return
-------
float

Description
-----------
Returns the parameter of Section<P>, to impose it for the approximation.
") Parameter;
		Standard_Real Parameter(const Standard_Integer P);

		/****** GeomFill_SectionGenerator::Section ******/
		/****** md5 signature: 941468dc4168033158bf84bf49fd2ff4 ******/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "
Parameters
----------
P: int
Poles: TColgp_Array1OfPnt
DPoles: TColgp_Array1OfVec
Poles2d: TColgp_Array1OfPnt2d
DPoles2d: TColgp_Array1OfVec2d
Weigths: TColStd_Array1OfReal
DWeigths: TColStd_Array1OfReal

Return
-------
bool

Description
-----------
Used for the first and last section The method returns Standard_True if the derivatives are computed, otherwise it returns Standard_False.
") Section;
		Standard_Boolean Section(const Standard_Integer P, TColgp_Array1OfPnt & Poles, TColgp_Array1OfVec & DPoles, TColgp_Array1OfPnt2d & Poles2d, TColgp_Array1OfVec2d & DPoles2d, TColStd_Array1OfReal & Weigths, TColStd_Array1OfReal & DWeigths);

		/****** GeomFill_SectionGenerator::Section ******/
		/****** md5 signature: 29433ba5af12c8cc98ba4cf28193643f ******/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "
Parameters
----------
P: int
Poles: TColgp_Array1OfPnt
Poles2d: TColgp_Array1OfPnt2d
Weigths: TColStd_Array1OfReal

Return
-------
None

Description
-----------
No available documentation.
") Section;
		void Section(const Standard_Integer P, TColgp_Array1OfPnt & Poles, TColgp_Array1OfPnt2d & Poles2d, TColStd_Array1OfReal & Weigths);

		/****** GeomFill_SectionGenerator::SetParam ******/
		/****** md5 signature: b95716ca77d413493ee4b317df6cb485 ******/
		%feature("compactdefaultargs") SetParam;
		%feature("autodoc", "
Parameters
----------
Params: TColStd_HArray1OfReal

Return
-------
None

Description
-----------
No available documentation.
") SetParam;
		void SetParam(const opencascade::handle<TColStd_HArray1OfReal> & Params);

};


%extend GeomFill_SectionGenerator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class GeomFill_SimpleBound *
*****************************/
class GeomFill_SimpleBound : public GeomFill_Boundary {
	public:
		/****** GeomFill_SimpleBound::GeomFill_SimpleBound ******/
		/****** md5 signature: dc4d80fb194fc40e8b356e68221b1993 ******/
		%feature("compactdefaultargs") GeomFill_SimpleBound;
		%feature("autodoc", "
Parameters
----------
Curve: Adaptor3d_Curve
Tol3d: float
Tolang: float

Return
-------
None

Description
-----------
Constructs the boundary object defined by the 3d curve. The surface to be built along this boundary will be in the tolerance range defined by Tol3d. This object is to be used as a boundary for a GeomFill_ConstrainedFilling framework. Dummy is initialized but has no function in this class. Warning Curve is an adapted curve, that is, an object which is an interface between: - the services provided by a 3D curve from the package Geom - and those required of the curve by the computation algorithm which uses it. The adapted curve is created in one of the following ways: - First sequence: opencascade::handle<Geom_Curve> myCurve = ... ; opencascade::handle<GeomAdaptor_Curve> Curve = new GeomAdaptor_Curve(myCurve); - Second sequence: // Step 1 opencascade::handle<Geom_Curve> myCurve = ... ; GeomAdaptor_Curve Crv (myCurve); // Step 2 opencascade::handle<GeomAdaptor_Curve> Curve = new GeomAdaptor_Curve(Crv); You use the second part of this sequence if you already have the adapted curve Crv. The boundary is then constructed with the Curve object: Standard_Real Tol = ... ; Standard_Real dummy = 0. ; myBoundary = GeomFill_SimpleBound (Curve,Tol,dummy);.
") GeomFill_SimpleBound;
		 GeomFill_SimpleBound(const opencascade::handle<Adaptor3d_Curve> & Curve, const Standard_Real Tol3d, const Standard_Real Tolang);

		/****** GeomFill_SimpleBound::Bounds ******/
		/****** md5 signature: 618f7ac8e8773975015964105699f46f ******/
		%feature("compactdefaultargs") Bounds;
		%feature("autodoc", "
Parameters
----------

Return
-------
First: float
Last: float

Description
-----------
No available documentation.
") Bounds;
		void Bounds(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** GeomFill_SimpleBound::D1 ******/
		/****** md5 signature: 1dc830ec49a945a61cde5e5c027b78d7 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
U: float
P: gp_Pnt
V: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") D1;
		void D1(const Standard_Real U, gp_Pnt & P, gp_Vec & V);

		/****** GeomFill_SimpleBound::IsDegenerated ******/
		/****** md5 signature: 79ce66385cf4dd5e407488fd7c6a2ef0 ******/
		%feature("compactdefaultargs") IsDegenerated;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsDegenerated;
		Standard_Boolean IsDegenerated();

		/****** GeomFill_SimpleBound::Reparametrize ******/
		/****** md5 signature: bd7b671d45505164bc59f6ce8496d6d0 ******/
		%feature("compactdefaultargs") Reparametrize;
		%feature("autodoc", "
Parameters
----------
First: float
Last: float
HasDF: bool
HasDL: bool
DF: float
DL: float
Rev: bool

Return
-------
None

Description
-----------
No available documentation.
") Reparametrize;
		void Reparametrize(const Standard_Real First, const Standard_Real Last, const Standard_Boolean HasDF, const Standard_Boolean HasDL, const Standard_Real DF, const Standard_Real DL, const Standard_Boolean Rev);

		/****** GeomFill_SimpleBound::Value ******/
		/****** md5 signature: d7f310c73762cbaa285ace0a141bc7bf ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
U: float

Return
-------
gp_Pnt

Description
-----------
No available documentation.
") Value;
		gp_Pnt Value(const Standard_Real U);

};


%make_alias(GeomFill_SimpleBound)

%extend GeomFill_SimpleBound {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class GeomFill_Stretch *
*************************/
class GeomFill_Stretch : public GeomFill_Filling {
	public:
		/****** GeomFill_Stretch::GeomFill_Stretch ******/
		/****** md5 signature: 41f33067fd48a3590d98e7ade538a4c7 ******/
		%feature("compactdefaultargs") GeomFill_Stretch;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") GeomFill_Stretch;
		 GeomFill_Stretch();

		/****** GeomFill_Stretch::GeomFill_Stretch ******/
		/****** md5 signature: bd6d1b8bdd9019d915c725313de24d3f ******/
		%feature("compactdefaultargs") GeomFill_Stretch;
		%feature("autodoc", "
Parameters
----------
P1: TColgp_Array1OfPnt
P2: TColgp_Array1OfPnt
P3: TColgp_Array1OfPnt
P4: TColgp_Array1OfPnt

Return
-------
None

Description
-----------
No available documentation.
") GeomFill_Stretch;
		 GeomFill_Stretch(const TColgp_Array1OfPnt & P1, const TColgp_Array1OfPnt & P2, const TColgp_Array1OfPnt & P3, const TColgp_Array1OfPnt & P4);

		/****** GeomFill_Stretch::GeomFill_Stretch ******/
		/****** md5 signature: e01a073231883a55d9edf57f955bbdb7 ******/
		%feature("compactdefaultargs") GeomFill_Stretch;
		%feature("autodoc", "
Parameters
----------
P1: TColgp_Array1OfPnt
P2: TColgp_Array1OfPnt
P3: TColgp_Array1OfPnt
P4: TColgp_Array1OfPnt
W1: TColStd_Array1OfReal
W2: TColStd_Array1OfReal
W3: TColStd_Array1OfReal
W4: TColStd_Array1OfReal

Return
-------
None

Description
-----------
No available documentation.
") GeomFill_Stretch;
		 GeomFill_Stretch(const TColgp_Array1OfPnt & P1, const TColgp_Array1OfPnt & P2, const TColgp_Array1OfPnt & P3, const TColgp_Array1OfPnt & P4, const TColStd_Array1OfReal & W1, const TColStd_Array1OfReal & W2, const TColStd_Array1OfReal & W3, const TColStd_Array1OfReal & W4);

		/****** GeomFill_Stretch::Init ******/
		/****** md5 signature: d3ffe113a485ff934a537831bed2560b ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
P1: TColgp_Array1OfPnt
P2: TColgp_Array1OfPnt
P3: TColgp_Array1OfPnt
P4: TColgp_Array1OfPnt

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const TColgp_Array1OfPnt & P1, const TColgp_Array1OfPnt & P2, const TColgp_Array1OfPnt & P3, const TColgp_Array1OfPnt & P4);

		/****** GeomFill_Stretch::Init ******/
		/****** md5 signature: 094f730897c039878a8e655c32e65678 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
P1: TColgp_Array1OfPnt
P2: TColgp_Array1OfPnt
P3: TColgp_Array1OfPnt
P4: TColgp_Array1OfPnt
W1: TColStd_Array1OfReal
W2: TColStd_Array1OfReal
W3: TColStd_Array1OfReal
W4: TColStd_Array1OfReal

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const TColgp_Array1OfPnt & P1, const TColgp_Array1OfPnt & P2, const TColgp_Array1OfPnt & P3, const TColgp_Array1OfPnt & P4, const TColStd_Array1OfReal & W1, const TColStd_Array1OfReal & W2, const TColStd_Array1OfReal & W3, const TColStd_Array1OfReal & W4);

};


%extend GeomFill_Stretch {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class GeomFill_TgtOnCoons *
****************************/
class GeomFill_TgtOnCoons : public GeomFill_TgtField {
	public:
		/****** GeomFill_TgtOnCoons::GeomFill_TgtOnCoons ******/
		/****** md5 signature: f9db6752cf19f01ffe8c0de3e7fd61d6 ******/
		%feature("compactdefaultargs") GeomFill_TgtOnCoons;
		%feature("autodoc", "
Parameters
----------
K: GeomFill_CoonsAlgPatch
I: int

Return
-------
None

Description
-----------
No available documentation.
") GeomFill_TgtOnCoons;
		 GeomFill_TgtOnCoons(const opencascade::handle<GeomFill_CoonsAlgPatch> & K, const Standard_Integer I);

		/****** GeomFill_TgtOnCoons::D1 ******/
		/****** md5 signature: 42d862b11603d6c162c9eabde6707d9b ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
W: float

Return
-------
gp_Vec

Description
-----------
Computes the derivative of the field of tangency at parameter W.
") D1;
		gp_Vec D1(const Standard_Real W);

		/****** GeomFill_TgtOnCoons::D1 ******/
		/****** md5 signature: e2197b03e817998bb9edb386a43462ba ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
W: float
T: gp_Vec
DT: gp_Vec

Return
-------
None

Description
-----------
Computes the value and the derivative of the field of tangency at parameter W.
") D1;
		void D1(const Standard_Real W, gp_Vec & T, gp_Vec & DT);

		/****** GeomFill_TgtOnCoons::Value ******/
		/****** md5 signature: 7ecedcaa349ee68ef1012600c127d0d1 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
W: float

Return
-------
gp_Vec

Description
-----------
Computes the value of the field of tangency at parameter W.
") Value;
		gp_Vec Value(const Standard_Real W);

};


%make_alias(GeomFill_TgtOnCoons)

%extend GeomFill_TgtOnCoons {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class GeomFill_TrihedronWithGuide *
************************************/
%nodefaultctor GeomFill_TrihedronWithGuide;
class GeomFill_TrihedronWithGuide : public GeomFill_TrihedronLaw {
	public:
		/****** GeomFill_TrihedronWithGuide::CurrentPointOnGuide ******/
		/****** md5 signature: 3f10164efb4173e700e58c5603874672 ******/
		%feature("compactdefaultargs") CurrentPointOnGuide;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Returns the current point on guide found by D0, D1 or D2.
") CurrentPointOnGuide;
		gp_Pnt CurrentPointOnGuide();

		/****** GeomFill_TrihedronWithGuide::Guide ******/
		/****** md5 signature: 09e47fc31e0ff29ebb6d8706ed5b2098 ******/
		%feature("compactdefaultargs") Guide;
		%feature("autodoc", "Return
-------
opencascade::handle<Adaptor3d_Curve>

Description
-----------
No available documentation.
") Guide;
		virtual opencascade::handle<Adaptor3d_Curve> Guide();

		/****** GeomFill_TrihedronWithGuide::Origine ******/
		/****** md5 signature: 16919287683a2d5ba18e225cee37cd92 ******/
		%feature("compactdefaultargs") Origine;
		%feature("autodoc", "
Parameters
----------
Param1: float
Param2: float

Return
-------
None

Description
-----------
No available documentation.
") Origine;
		virtual void Origine(const Standard_Real Param1, const Standard_Real Param2);

};


%make_alias(GeomFill_TrihedronWithGuide)

%extend GeomFill_TrihedronWithGuide {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class GeomFill_UniformSection *
********************************/
class GeomFill_UniformSection : public GeomFill_SectionLaw {
	public:
		/****** GeomFill_UniformSection::GeomFill_UniformSection ******/
		/****** md5 signature: 41b6e34dce2780689a7d85e0f3b351f6 ******/
		%feature("compactdefaultargs") GeomFill_UniformSection;
		%feature("autodoc", "
Parameters
----------
C: Geom_Curve
FirstParameter: float (optional, default to 0.0)
LastParameter: float (optional, default to 1.0)

Return
-------
None

Description
-----------
Make an constant Law with C. [First, Last] define law definition domain.
") GeomFill_UniformSection;
		 GeomFill_UniformSection(const opencascade::handle<Geom_Curve> & C, const Standard_Real FirstParameter = 0.0, const Standard_Real LastParameter = 1.0);

		/****** GeomFill_UniformSection::BSplineSurface ******/
		/****** md5 signature: 723eb488e2a06d913977b581dcccba8f ******/
		%feature("compactdefaultargs") BSplineSurface;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_BSplineSurface>

Description
-----------
give if possible an bspline Surface, like iso-v are the section. If it is not possible this methode have to get an Null Surface. Is it the default implementation.
") BSplineSurface;
		virtual opencascade::handle<Geom_BSplineSurface> BSplineSurface();

		/****** GeomFill_UniformSection::BarycentreOfSurf ******/
		/****** md5 signature: a691940df52b45c198f3414d0790e091 ******/
		%feature("compactdefaultargs") BarycentreOfSurf;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Get the barycentre of Surface. An very poor estimation is sufficient. This information is useful to perform well conditioned rational approximation. Warning: Used only if <self> IsRational.
") BarycentreOfSurf;
		virtual gp_Pnt BarycentreOfSurf();

		/****** GeomFill_UniformSection::ConstantSection ******/
		/****** md5 signature: 86519bb197ca223d0ba2720b381f4036 ******/
		%feature("compactdefaultargs") ConstantSection;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Curve>

Description
-----------
Return the constant Section if <self> IsConstant.
") ConstantSection;
		virtual opencascade::handle<Geom_Curve> ConstantSection();

		/****** GeomFill_UniformSection::D0 ******/
		/****** md5 signature: d889e1bd3dadd721c935f604be609d57 ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
Param: float
Poles: TColgp_Array1OfPnt
Weigths: TColStd_Array1OfReal

Return
-------
bool

Description
-----------
compute the section for v = param.
") D0;
		virtual Standard_Boolean D0(const Standard_Real Param, TColgp_Array1OfPnt & Poles, TColStd_Array1OfReal & Weigths);

		/****** GeomFill_UniformSection::D1 ******/
		/****** md5 signature: 127f80b4c43e681b4262dad7d1db79d7 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
Param: float
Poles: TColgp_Array1OfPnt
DPoles: TColgp_Array1OfVec
Weigths: TColStd_Array1OfReal
DWeigths: TColStd_Array1OfReal

Return
-------
bool

Description
-----------
compute the first derivative in v direction of the section for v = param Warning: It used only for C1 or C2 approximation.
") D1;
		virtual Standard_Boolean D1(const Standard_Real Param, TColgp_Array1OfPnt & Poles, TColgp_Array1OfVec & DPoles, TColStd_Array1OfReal & Weigths, TColStd_Array1OfReal & DWeigths);

		/****** GeomFill_UniformSection::D2 ******/
		/****** md5 signature: e7553cf232323cae7964c205cd5a06a9 ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
Param: float
Poles: TColgp_Array1OfPnt
DPoles: TColgp_Array1OfVec
D2Poles: TColgp_Array1OfVec
Weigths: TColStd_Array1OfReal
DWeigths: TColStd_Array1OfReal
D2Weigths: TColStd_Array1OfReal

Return
-------
bool

Description
-----------
compute the second derivative in v direction of the section for v = param Warning: It used only for C2 approximation.
") D2;
		virtual Standard_Boolean D2(const Standard_Real Param, TColgp_Array1OfPnt & Poles, TColgp_Array1OfVec & DPoles, TColgp_Array1OfVec & D2Poles, TColStd_Array1OfReal & Weigths, TColStd_Array1OfReal & DWeigths, TColStd_Array1OfReal & D2Weigths);

		/****** GeomFill_UniformSection::GetDomain ******/
		/****** md5 signature: 5949ecf80ee7cf5a86623a8a457dd2b9 ******/
		%feature("compactdefaultargs") GetDomain;
		%feature("autodoc", "
Parameters
----------

Return
-------
First: float
Last: float

Description
-----------
Gets the bounds of the function parametric domain. Warning: This domain it is not modified by the SetValue method.
") GetDomain;
		virtual void GetDomain(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** GeomFill_UniformSection::GetInterval ******/
		/****** md5 signature: 5025922809e891f5aa8a2358198f31e4 ******/
		%feature("compactdefaultargs") GetInterval;
		%feature("autodoc", "
Parameters
----------

Return
-------
First: float
Last: float

Description
-----------
Gets the bounds of the parametric interval on the function.
") GetInterval;
		virtual void GetInterval(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** GeomFill_UniformSection::GetMinimalWeight ******/
		/****** md5 signature: 36fb20110448cba55b750bc7db93d222 ******/
		%feature("compactdefaultargs") GetMinimalWeight;
		%feature("autodoc", "
Parameters
----------
Weigths: TColStd_Array1OfReal

Return
-------
None

Description
-----------
Compute the minimal value of weight for each poles in all sections. This information is useful to control error in rational approximation. Warning: Used only if <self> IsRational.
") GetMinimalWeight;
		virtual void GetMinimalWeight(TColStd_Array1OfReal & Weigths);

		/****** GeomFill_UniformSection::GetTolerance ******/
		/****** md5 signature: 3f6ec4398981d416a51435f14d7cee22 ******/
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "
Parameters
----------
BoundTol: float
SurfTol: float
AngleTol: float
Tol3d: TColStd_Array1OfReal

Return
-------
None

Description
-----------
Returns the tolerances associated at each poles to reach in approximation, to satisfy: BoundTol error at the Boundary AngleTol tangent error at the Boundary (in radian) SurfTol error inside the surface.
") GetTolerance;
		virtual void GetTolerance(const Standard_Real BoundTol, const Standard_Real SurfTol, const Standard_Real AngleTol, TColStd_Array1OfReal & Tol3d);

		/****** GeomFill_UniformSection::Intervals ******/
		/****** md5 signature: 89fb47d5d3721d82826a17cc788156e4 ******/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "
Parameters
----------
T: TColStd_Array1OfReal
S: GeomAbs_Shape

Return
-------
None

Description
-----------
Stores in <T> the parameters bounding the intervals of continuity <S>. //! The array must provide enough room to accommodate for the parameters. i.e. T.Length() > NbIntervals().
") Intervals;
		virtual void Intervals(TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****** GeomFill_UniformSection::IsConstant ******/
		/****** md5 signature: b8fcd911afc2577f90f33f0c8d046c8a ******/
		%feature("compactdefaultargs") IsConstant;
		%feature("autodoc", "
Parameters
----------

Return
-------
Error: float

Description
-----------
return True.
") IsConstant;
		virtual Standard_Boolean IsConstant(Standard_Real &OutValue);

		/****** GeomFill_UniformSection::IsRational ******/
		/****** md5 signature: 2a6f0ec7e4a129780b654d163e7e3b1c ******/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns if the sections are rational or not.
") IsRational;
		virtual Standard_Boolean IsRational();

		/****** GeomFill_UniformSection::IsUPeriodic ******/
		/****** md5 signature: ee1d04d096d58c0c69971438c1aa71fc ******/
		%feature("compactdefaultargs") IsUPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns if the sections are periodic or not.
") IsUPeriodic;
		virtual Standard_Boolean IsUPeriodic();

		/****** GeomFill_UniformSection::IsVPeriodic ******/
		/****** md5 signature: c62bf083eb7bc6b915c3cdeea2fc8406 ******/
		%feature("compactdefaultargs") IsVPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns if the law isperiodic or not.
") IsVPeriodic;
		virtual Standard_Boolean IsVPeriodic();

		/****** GeomFill_UniformSection::Knots ******/
		/****** md5 signature: 25dbe24e24c953c2c68b0d008e63e5d6 ******/
		%feature("compactdefaultargs") Knots;
		%feature("autodoc", "
Parameters
----------
TKnots: TColStd_Array1OfReal

Return
-------
None

Description
-----------
get the Knots of the section.
") Knots;
		virtual void Knots(TColStd_Array1OfReal & TKnots);

		/****** GeomFill_UniformSection::MaximalSection ******/
		/****** md5 signature: b8f0d759fcd21b95d400b3aae3c12cfc ******/
		%feature("compactdefaultargs") MaximalSection;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the length of the greater section. This information is useful to G1's control. Warning: With an little value, approximation can be slower.
") MaximalSection;
		virtual Standard_Real MaximalSection();

		/****** GeomFill_UniformSection::Mults ******/
		/****** md5 signature: 033dc1fab9e10e705c796ffc1e03a44d ******/
		%feature("compactdefaultargs") Mults;
		%feature("autodoc", "
Parameters
----------
TMults: TColStd_Array1OfInteger

Return
-------
None

Description
-----------
get the Multplicities of the section.
") Mults;
		virtual void Mults(TColStd_Array1OfInteger & TMults);

		/****** GeomFill_UniformSection::NbIntervals ******/
		/****** md5 signature: f69f597bd42e14bdc81d20aa650b3d54 ******/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "
Parameters
----------
S: GeomAbs_Shape

Return
-------
int

Description
-----------
Returns the number of intervals for continuity <S>. May be one if Continuity(me) >= <S>.
") NbIntervals;
		virtual Standard_Integer NbIntervals(const GeomAbs_Shape S);

		/****** GeomFill_UniformSection::SectionShape ******/
		/****** md5 signature: 4b057291e9e338f8d299ce252e7fb36b ******/
		%feature("compactdefaultargs") SectionShape;
		%feature("autodoc", "
Parameters
----------

Return
-------
NbPoles: int
NbKnots: int
Degree: int

Description
-----------
get the format of an section.
") SectionShape;
		virtual void SectionShape(Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****** GeomFill_UniformSection::SetInterval ******/
		/****** md5 signature: 09d00fda8057705f50d4a0bf656696ed ******/
		%feature("compactdefaultargs") SetInterval;
		%feature("autodoc", "
Parameters
----------
First: float
Last: float

Return
-------
None

Description
-----------
Sets the bounds of the parametric interval on the function This determines the derivatives in these values if the function is not Cn.
") SetInterval;
		virtual void SetInterval(const Standard_Real First, const Standard_Real Last);

};


%make_alias(GeomFill_UniformSection)

%extend GeomFill_UniformSection {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class GeomFill_GuideTrihedronAC *
**********************************/
class GeomFill_GuideTrihedronAC : public GeomFill_TrihedronWithGuide {
	public:
		/****** GeomFill_GuideTrihedronAC::GeomFill_GuideTrihedronAC ******/
		/****** md5 signature: b3b260cc8039974b28f456867aa004c0 ******/
		%feature("compactdefaultargs") GeomFill_GuideTrihedronAC;
		%feature("autodoc", "
Parameters
----------
guide: Adaptor3d_Curve

Return
-------
None

Description
-----------
No available documentation.
") GeomFill_GuideTrihedronAC;
		 GeomFill_GuideTrihedronAC(const opencascade::handle<Adaptor3d_Curve> & guide);

		/****** GeomFill_GuideTrihedronAC::Copy ******/
		/****** md5 signature: 9645e7734f6f9fcd3bd1e528a8c82987 ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<GeomFill_TrihedronLaw>

Description
-----------
No available documentation.
") Copy;
		virtual opencascade::handle<GeomFill_TrihedronLaw> Copy();

		/****** GeomFill_GuideTrihedronAC::D0 ******/
		/****** md5 signature: 8127a750255133d6fe0cc96880f4f1ab ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
Param: float
Tangent: gp_Vec
Normal: gp_Vec
BiNormal: gp_Vec

Return
-------
bool

Description
-----------
No available documentation.
") D0;
		virtual Standard_Boolean D0(const Standard_Real Param, gp_Vec & Tangent, gp_Vec & Normal, gp_Vec & BiNormal);

		/****** GeomFill_GuideTrihedronAC::D1 ******/
		/****** md5 signature: 7b1b7607df3259d1ef02c15ca0ffdd69 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
Param: float
Tangent: gp_Vec
DTangent: gp_Vec
Normal: gp_Vec
DNormal: gp_Vec
BiNormal: gp_Vec
DBiNormal: gp_Vec

Return
-------
bool

Description
-----------
No available documentation.
") D1;
		virtual Standard_Boolean D1(const Standard_Real Param, gp_Vec & Tangent, gp_Vec & DTangent, gp_Vec & Normal, gp_Vec & DNormal, gp_Vec & BiNormal, gp_Vec & DBiNormal);

		/****** GeomFill_GuideTrihedronAC::D2 ******/
		/****** md5 signature: e308ebcce924017ac2cd5d4701d10219 ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
Param: float
Tangent: gp_Vec
DTangent: gp_Vec
D2Tangent: gp_Vec
Normal: gp_Vec
DNormal: gp_Vec
D2Normal: gp_Vec
BiNormal: gp_Vec
DBiNormal: gp_Vec
D2BiNormal: gp_Vec

Return
-------
bool

Description
-----------
No available documentation.
") D2;
		virtual Standard_Boolean D2(const Standard_Real Param, gp_Vec & Tangent, gp_Vec & DTangent, gp_Vec & D2Tangent, gp_Vec & Normal, gp_Vec & DNormal, gp_Vec & D2Normal, gp_Vec & BiNormal, gp_Vec & DBiNormal, gp_Vec & D2BiNormal);

		/****** GeomFill_GuideTrihedronAC::GetAverageLaw ******/
		/****** md5 signature: e4ba5f43e35cc3444d51c5ee4d7b6fff ******/
		%feature("compactdefaultargs") GetAverageLaw;
		%feature("autodoc", "
Parameters
----------
ATangent: gp_Vec
ANormal: gp_Vec
ABiNormal: gp_Vec

Return
-------
None

Description
-----------
Get average value of M(t) and V(t) it is usfull to make fast approximation of rational surfaces.
") GetAverageLaw;
		virtual void GetAverageLaw(gp_Vec & ATangent, gp_Vec & ANormal, gp_Vec & ABiNormal);

		/****** GeomFill_GuideTrihedronAC::Guide ******/
		/****** md5 signature: 17558c6f9257708f1da49899c586c13c ******/
		%feature("compactdefaultargs") Guide;
		%feature("autodoc", "Return
-------
opencascade::handle<Adaptor3d_Curve>

Description
-----------
No available documentation.
") Guide;
		virtual opencascade::handle<Adaptor3d_Curve> Guide();

		/****** GeomFill_GuideTrihedronAC::Intervals ******/
		/****** md5 signature: 89fb47d5d3721d82826a17cc788156e4 ******/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "
Parameters
----------
T: TColStd_Array1OfReal
S: GeomAbs_Shape

Return
-------
None

Description
-----------
Stores in <T> the parameters bounding the intervals of continuity <S>. //! The array must provide enough room to accommodate for the parameters. i.e. T.Length() > NbIntervals().
") Intervals;
		virtual void Intervals(TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****** GeomFill_GuideTrihedronAC::IsConstant ******/
		/****** md5 signature: 117737bfe11f2fa5e6c2b702110a9201 ******/
		%feature("compactdefaultargs") IsConstant;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Say if the law is Constant.
") IsConstant;
		virtual Standard_Boolean IsConstant();

		/****** GeomFill_GuideTrihedronAC::IsOnlyBy3dCurve ******/
		/****** md5 signature: dce50a0e4caf3b6774af0413898e9c4b ******/
		%feature("compactdefaultargs") IsOnlyBy3dCurve;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Say if the law is defined, only by the 3d Geometry of the set Curve Return False by Default.
") IsOnlyBy3dCurve;
		virtual Standard_Boolean IsOnlyBy3dCurve();

		/****** GeomFill_GuideTrihedronAC::NbIntervals ******/
		/****** md5 signature: f69f597bd42e14bdc81d20aa650b3d54 ******/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "
Parameters
----------
S: GeomAbs_Shape

Return
-------
int

Description
-----------
Returns the number of intervals for continuity <S>. May be one if Continuity(me) >= <S>.
") NbIntervals;
		virtual Standard_Integer NbIntervals(const GeomAbs_Shape S);

		/****** GeomFill_GuideTrihedronAC::Origine ******/
		/****** md5 signature: 7e4cf323c0179191614321290ceee376 ******/
		%feature("compactdefaultargs") Origine;
		%feature("autodoc", "
Parameters
----------
OrACR1: float
OrACR2: float

Return
-------
None

Description
-----------
No available documentation.
") Origine;
		virtual void Origine(const Standard_Real OrACR1, const Standard_Real OrACR2);

		/****** GeomFill_GuideTrihedronAC::SetCurve ******/
		/****** md5 signature: b0541b7921a5c5b75a45dc913166e3d3 ******/
		%feature("compactdefaultargs") SetCurve;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve

Return
-------
bool

Description
-----------
initialize curve of trihedron law 
Return: Standard_True.
") SetCurve;
		virtual Standard_Boolean SetCurve(const opencascade::handle<Adaptor3d_Curve> & C);

		/****** GeomFill_GuideTrihedronAC::SetInterval ******/
		/****** md5 signature: 09d00fda8057705f50d4a0bf656696ed ******/
		%feature("compactdefaultargs") SetInterval;
		%feature("autodoc", "
Parameters
----------
First: float
Last: float

Return
-------
None

Description
-----------
Sets the bounds of the parametric interval on the function This determines the derivatives in these values if the function is not Cn.
") SetInterval;
		virtual void SetInterval(const Standard_Real First, const Standard_Real Last);

};


%make_alias(GeomFill_GuideTrihedronAC)

%extend GeomFill_GuideTrihedronAC {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class GeomFill_GuideTrihedronPlan *
************************************/
class GeomFill_GuideTrihedronPlan : public GeomFill_TrihedronWithGuide {
	public:
		/****** GeomFill_GuideTrihedronPlan::GeomFill_GuideTrihedronPlan ******/
		/****** md5 signature: 0e4f012fb4a92ecb65e9205ba6b0adce ******/
		%feature("compactdefaultargs") GeomFill_GuideTrihedronPlan;
		%feature("autodoc", "
Parameters
----------
theGuide: Adaptor3d_Curve

Return
-------
None

Description
-----------
No available documentation.
") GeomFill_GuideTrihedronPlan;
		 GeomFill_GuideTrihedronPlan(const opencascade::handle<Adaptor3d_Curve> & theGuide);

		/****** GeomFill_GuideTrihedronPlan::Copy ******/
		/****** md5 signature: 9645e7734f6f9fcd3bd1e528a8c82987 ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<GeomFill_TrihedronLaw>

Description
-----------
No available documentation.
") Copy;
		virtual opencascade::handle<GeomFill_TrihedronLaw> Copy();

		/****** GeomFill_GuideTrihedronPlan::D0 ******/
		/****** md5 signature: 8127a750255133d6fe0cc96880f4f1ab ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
Param: float
Tangent: gp_Vec
Normal: gp_Vec
BiNormal: gp_Vec

Return
-------
bool

Description
-----------
No available documentation.
") D0;
		virtual Standard_Boolean D0(const Standard_Real Param, gp_Vec & Tangent, gp_Vec & Normal, gp_Vec & BiNormal);

		/****** GeomFill_GuideTrihedronPlan::D1 ******/
		/****** md5 signature: 7b1b7607df3259d1ef02c15ca0ffdd69 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
Param: float
Tangent: gp_Vec
DTangent: gp_Vec
Normal: gp_Vec
DNormal: gp_Vec
BiNormal: gp_Vec
DBiNormal: gp_Vec

Return
-------
bool

Description
-----------
No available documentation.
") D1;
		virtual Standard_Boolean D1(const Standard_Real Param, gp_Vec & Tangent, gp_Vec & DTangent, gp_Vec & Normal, gp_Vec & DNormal, gp_Vec & BiNormal, gp_Vec & DBiNormal);

		/****** GeomFill_GuideTrihedronPlan::D2 ******/
		/****** md5 signature: e308ebcce924017ac2cd5d4701d10219 ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
Param: float
Tangent: gp_Vec
DTangent: gp_Vec
D2Tangent: gp_Vec
Normal: gp_Vec
DNormal: gp_Vec
D2Normal: gp_Vec
BiNormal: gp_Vec
DBiNormal: gp_Vec
D2BiNormal: gp_Vec

Return
-------
bool

Description
-----------
No available documentation.
") D2;
		virtual Standard_Boolean D2(const Standard_Real Param, gp_Vec & Tangent, gp_Vec & DTangent, gp_Vec & D2Tangent, gp_Vec & Normal, gp_Vec & DNormal, gp_Vec & D2Normal, gp_Vec & BiNormal, gp_Vec & DBiNormal, gp_Vec & D2BiNormal);

		/****** GeomFill_GuideTrihedronPlan::ErrorStatus ******/
		/****** md5 signature: 0524df84e8d9c275d5bcd5d3fe7977dc ******/
		%feature("compactdefaultargs") ErrorStatus;
		%feature("autodoc", "Return
-------
GeomFill_PipeError

Description
-----------
Give a status to the Law Returns PipeOk (default implementation).
") ErrorStatus;
		virtual GeomFill_PipeError ErrorStatus();

		/****** GeomFill_GuideTrihedronPlan::GetAverageLaw ******/
		/****** md5 signature: e4ba5f43e35cc3444d51c5ee4d7b6fff ******/
		%feature("compactdefaultargs") GetAverageLaw;
		%feature("autodoc", "
Parameters
----------
ATangent: gp_Vec
ANormal: gp_Vec
ABiNormal: gp_Vec

Return
-------
None

Description
-----------
Get average value of M(t) and V(t) it is usfull to make fast approximation of rational surfaces.
") GetAverageLaw;
		virtual void GetAverageLaw(gp_Vec & ATangent, gp_Vec & ANormal, gp_Vec & ABiNormal);

		/****** GeomFill_GuideTrihedronPlan::Guide ******/
		/****** md5 signature: 17558c6f9257708f1da49899c586c13c ******/
		%feature("compactdefaultargs") Guide;
		%feature("autodoc", "Return
-------
opencascade::handle<Adaptor3d_Curve>

Description
-----------
No available documentation.
") Guide;
		virtual opencascade::handle<Adaptor3d_Curve> Guide();

		/****** GeomFill_GuideTrihedronPlan::Intervals ******/
		/****** md5 signature: 89fb47d5d3721d82826a17cc788156e4 ******/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "
Parameters
----------
T: TColStd_Array1OfReal
S: GeomAbs_Shape

Return
-------
None

Description
-----------
Stores in <T> the parameters bounding the intervals of continuity <S>. //! The array must provide enough room to accommodate for the parameters. i.e. T.Length() > NbIntervals().
") Intervals;
		virtual void Intervals(TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****** GeomFill_GuideTrihedronPlan::IsConstant ******/
		/****** md5 signature: 117737bfe11f2fa5e6c2b702110a9201 ******/
		%feature("compactdefaultargs") IsConstant;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Say if the law is Constant.
") IsConstant;
		virtual Standard_Boolean IsConstant();

		/****** GeomFill_GuideTrihedronPlan::IsOnlyBy3dCurve ******/
		/****** md5 signature: dce50a0e4caf3b6774af0413898e9c4b ******/
		%feature("compactdefaultargs") IsOnlyBy3dCurve;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Say if the law is defined, only by the 3d Geometry of the set Curve Return False by Default.
") IsOnlyBy3dCurve;
		virtual Standard_Boolean IsOnlyBy3dCurve();

		/****** GeomFill_GuideTrihedronPlan::NbIntervals ******/
		/****** md5 signature: f69f597bd42e14bdc81d20aa650b3d54 ******/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "
Parameters
----------
S: GeomAbs_Shape

Return
-------
int

Description
-----------
Returns the number of intervals for continuity <S>. May be one if Continuity(me) >= <S>.
") NbIntervals;
		virtual Standard_Integer NbIntervals(const GeomAbs_Shape S);

		/****** GeomFill_GuideTrihedronPlan::Origine ******/
		/****** md5 signature: 7e4cf323c0179191614321290ceee376 ******/
		%feature("compactdefaultargs") Origine;
		%feature("autodoc", "
Parameters
----------
OrACR1: float
OrACR2: float

Return
-------
None

Description
-----------
No available documentation.
") Origine;
		virtual void Origine(const Standard_Real OrACR1, const Standard_Real OrACR2);

		/****** GeomFill_GuideTrihedronPlan::SetCurve ******/
		/****** md5 signature: 855db3d4cb52339d3bce0cd3d9c66477 ******/
		%feature("compactdefaultargs") SetCurve;
		%feature("autodoc", "
Parameters
----------
thePath: Adaptor3d_Curve

Return
-------
bool

Description
-----------
initialize curve of trihedron law 
Return: Standard_True in case if execution end correctly.
") SetCurve;
		virtual Standard_Boolean SetCurve(const opencascade::handle<Adaptor3d_Curve> & thePath);

		/****** GeomFill_GuideTrihedronPlan::SetInterval ******/
		/****** md5 signature: 09d00fda8057705f50d4a0bf656696ed ******/
		%feature("compactdefaultargs") SetInterval;
		%feature("autodoc", "
Parameters
----------
First: float
Last: float

Return
-------
None

Description
-----------
Sets the bounds of the parametric interval on the function This determines the derivatives in these values if the function is not Cn.
") SetInterval;
		virtual void SetInterval(const Standard_Real First, const Standard_Real Last);

};


%make_alias(GeomFill_GuideTrihedronPlan)

%extend GeomFill_GuideTrihedronPlan {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* python proxy for excluded classes */
%pythoncode {
@classnotwrapped
class GeomFill_SweepSectionGenerator:
	pass

}
/* end python proxy for excluded classes */
/* harray1 classes */

class GeomFill_HArray1OfLocationLaw : public GeomFill_Array1OfLocationLaw, public Standard_Transient {
  public:
    GeomFill_HArray1OfLocationLaw(const Standard_Integer theLower, const Standard_Integer theUpper);
    GeomFill_HArray1OfLocationLaw(const Standard_Integer theLower, const Standard_Integer theUpper, const GeomFill_Array1OfLocationLaw::value_type& theValue);
    GeomFill_HArray1OfLocationLaw(const GeomFill_Array1OfLocationLaw& theOther);
    const GeomFill_Array1OfLocationLaw& Array1();
    GeomFill_Array1OfLocationLaw& ChangeArray1();
};
%make_alias(GeomFill_HArray1OfLocationLaw)


class GeomFill_HArray1OfSectionLaw : public GeomFill_Array1OfSectionLaw, public Standard_Transient {
  public:
    GeomFill_HArray1OfSectionLaw(const Standard_Integer theLower, const Standard_Integer theUpper);
    GeomFill_HArray1OfSectionLaw(const Standard_Integer theLower, const Standard_Integer theUpper, const GeomFill_Array1OfSectionLaw::value_type& theValue);
    GeomFill_HArray1OfSectionLaw(const GeomFill_Array1OfSectionLaw& theOther);
    const GeomFill_Array1OfSectionLaw& Array1();
    GeomFill_Array1OfSectionLaw& ChangeArray1();
};
%make_alias(GeomFill_HArray1OfSectionLaw)

/* harray2 classes */
/* hsequence classes */
class GeomFill_HSequenceOfAx2 : public GeomFill_SequenceOfAx2, public Standard_Transient {
  public:
    GeomFill_HSequenceOfAx2();
    GeomFill_HSequenceOfAx2(const GeomFill_SequenceOfAx2& theOther);
    const GeomFill_SequenceOfAx2& Sequence();
    void Append (const GeomFill_SequenceOfAx2::value_type& theItem);
    void Append (GeomFill_SequenceOfAx2& theSequence);
    GeomFill_SequenceOfAx2& ChangeSequence();
};
%make_alias(GeomFill_HSequenceOfAx2)


/* class aliases */
%pythoncode {
}
/* deprecated methods */
%pythoncode {
@deprecated
def geomfill_GetCircle(*args):
	return geomfill.GetCircle(*args)

@deprecated
def geomfill_GetCircle(*args):
	return geomfill.GetCircle(*args)

@deprecated
def geomfill_GetCircle(*args):
	return geomfill.GetCircle(*args)

@deprecated
def geomfill_GetMinimalWeights(*args):
	return geomfill.GetMinimalWeights(*args)

@deprecated
def geomfill_GetShape(*args):
	return geomfill.GetShape(*args)

@deprecated
def geomfill_GetTolerance(*args):
	return geomfill.GetTolerance(*args)

@deprecated
def geomfill_Knots(*args):
	return geomfill.Knots(*args)

@deprecated
def geomfill_Mults(*args):
	return geomfill.Mults(*args)

@deprecated
def geomfill_Surface(*args):
	return geomfill.Surface(*args)

}
