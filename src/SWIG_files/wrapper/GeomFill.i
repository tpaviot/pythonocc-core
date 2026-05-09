/*
Copyright 2008-2025 Thomas Paviot (tpaviot@gmail.com)

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
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_geomfill.html"
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
#include<TColGeom_module.hxx>
#include<Geom2d_module.hxx>
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
%import TColGeom.i
%import Geom2d.i

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
/* end handles declaration */

/* templates */
%template(GeomFill_Array1OfLocationLaw) NCollection_Array1<opencascade::handle<GeomFill_LocationLaw>>;
Array1ExtendIter(opencascade::handle<GeomFill_LocationLaw>)

%template(GeomFill_Array1OfSectionLaw) NCollection_Array1<opencascade::handle<GeomFill_SectionLaw>>;
Array1ExtendIter(opencascade::handle<GeomFill_SectionLaw>)

%template(GeomFill_SequenceOfAx2) NCollection_Sequence<gp_Ax2>;

%extend NCollection_Sequence<gp_Ax2> {
    // occt-800: NCollection_BaseSequence methods are not wrapped through
    // SWIG (its inner SeqNode has private new/delete). Re-export them per
    // instantiation so Python code can call .Size(), .Length(), .IsEmpty()
    // and use len() on every NCollection_Sequence<...>.
    size_t Size() const noexcept { return $self->Size(); }
    int Length() const noexcept { return $self->Length(); }
    bool IsEmpty() const noexcept { return $self->IsEmpty(); }
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(GeomFill_SequenceOfTrsf) NCollection_Sequence<gp_Trsf>;

%extend NCollection_Sequence<gp_Trsf> {
    // occt-800: NCollection_BaseSequence methods are not wrapped through
    // SWIG (its inner SeqNode has private new/delete). Re-export them per
    // instantiation so Python code can call .Size(), .Length(), .IsEmpty()
    // and use len() on every NCollection_Sequence<...>.
    size_t Size() const noexcept { return $self->Size(); }
    int Length() const noexcept { return $self->Length(); }
    bool IsEmpty() const noexcept { return $self->IsEmpty(); }
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
/* end templates declaration */

/* typedefs */
typedef NCollection_Array1<opencascade::handle<GeomFill_LocationLaw>> GeomFill_Array1OfLocationLaw;
typedef NCollection_Array1<opencascade::handle<GeomFill_SectionLaw>> GeomFill_Array1OfSectionLaw;
typedef NCollection_HArray1<opencascade::handle<GeomFill_LocationLaw>> GeomFill_HArray1OfLocationLaw;
typedef NCollection_HArray1<opencascade::handle<GeomFill_SectionLaw>> GeomFill_HArray1OfSectionLaw;
typedef NCollection_HSequence<gp_Ax2> GeomFill_HSequenceOfAx2;
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
		/****** md5 signature: 3b80a94efde69442494739986869368d ******/
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
Rayon: double
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
		static void GetCircle(const Convert_ParameterisationType TConv, const gp_Vec & ns1, const gp_Vec & ns2, const gp_Vec & nplan, const gp_Pnt & pt1, const gp_Pnt & pt2, const double Rayon, const gp_Pnt & Center, TColgp_Array1OfPnt & Poles, TColStd_Array1OfReal & Weigths);

		/****** GeomFill::GetCircle ******/
		/****** md5 signature: 0689b7e9635cad99f6d3faaae6a7687e ******/
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
Rayon: double
DRayon: double
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
		static bool GetCircle(const Convert_ParameterisationType TConv, const gp_Vec & ns1, const gp_Vec & ns2, const gp_Vec & dn1w, const gp_Vec & dn2w, const gp_Vec & nplan, const gp_Vec & dnplan, const gp_Pnt & pts1, const gp_Pnt & pts2, const gp_Vec & tang1, const gp_Vec & tang2, const double Rayon, const double DRayon, const gp_Pnt & Center, const gp_Vec & DCenter, TColgp_Array1OfPnt & Poles, TColgp_Array1OfVec & DPoles, TColStd_Array1OfReal & Weigths, TColStd_Array1OfReal & DWeigths);

		/****** GeomFill::GetCircle ******/
		/****** md5 signature: 0540b67d9930dbf59cfde9ca908be6af ******/
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
Rayon: double
DRayon: double
D2Rayon: double
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
		static bool GetCircle(const Convert_ParameterisationType TConv, const gp_Vec & ns1, const gp_Vec & ns2, const gp_Vec & dn1w, const gp_Vec & dn2w, const gp_Vec & d2n1w, const gp_Vec & d2n2w, const gp_Vec & nplan, const gp_Vec & dnplan, const gp_Vec & d2nplan, const gp_Pnt & pts1, const gp_Pnt & pts2, const gp_Vec & tang1, const gp_Vec & tang2, const gp_Vec & Dtang1, const gp_Vec & Dtang2, const double Rayon, const double DRayon, const double D2Rayon, const gp_Pnt & Center, const gp_Vec & DCenter, const gp_Vec & D2Center, TColgp_Array1OfPnt & Poles, TColgp_Array1OfVec & DPoles, TColgp_Array1OfVec & D2Poles, TColStd_Array1OfReal & Weigths, TColStd_Array1OfReal & DWeigths, TColStd_Array1OfReal & D2Weigths);

		/****** GeomFill::GetMinimalWeights ******/
		/****** md5 signature: ce6aaa709998c5a07424857158bae924 ******/
		%feature("compactdefaultargs") GetMinimalWeights;
		%feature("autodoc", "
Parameters
----------
TConv: Convert_ParameterisationType
AngleMin: double
AngleMax: double
Weigths: TColStd_Array1OfReal

Return
-------
None

Description
-----------
No available documentation.
") GetMinimalWeights;
		static void GetMinimalWeights(const Convert_ParameterisationType TConv, const double AngleMin, const double AngleMax, TColStd_Array1OfReal & Weigths);

		/****** GeomFill::GetShape ******/
		/****** md5 signature: e2edb88fed5134b59a26e36fca2c92e8 ******/
		%feature("compactdefaultargs") GetShape;
		%feature("autodoc", "
Parameters
----------
MaxAng: double

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
		static void GetShape(const double MaxAng, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Convert_ParameterisationType &OutValue);

		/****** GeomFill::GetTolerance ******/
		/****** md5 signature: 0ae6a3c48a8884ceda8d99e564c409d4 ******/
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "
Parameters
----------
TConv: Convert_ParameterisationType
AngleMin: double
Radius: double
AngularTol: double
SpatialTol: double

Return
-------
double

Description
-----------
Used by the generical classes to determine Tolerance for approximation.
") GetTolerance;
		static double GetTolerance(const Convert_ParameterisationType TConv, const double AngleMin, const double Radius, const double AngularTol, const double SpatialTol);

		/****** GeomFill::Knots ******/
		/****** md5 signature: 84ede561f57cc9256c8ceb25be90d8ac ******/
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
		/****** md5 signature: 6fd35aa56cca0a410c35e6db4109f5f2 ******/
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
		/****** md5 signature: d44a6c7933182f9d1f84f57aec7c60b1 ******/
		%feature("compactdefaultargs") GeomFill_AppSurf;
		%feature("autodoc", "
Parameters
----------
Degmin: int
Degmax: int
Tol3d: double
Tol2d: double
NbIt: int
KnownParameters: bool (optional, default to false)

Return
-------
None

Description
-----------
No available documentation.
") GeomFill_AppSurf;
		 GeomFill_AppSurf(const int Degmin, const int Degmax, const double Tol3d, const double Tol2d, const int NbIt, const bool KnownParameters = false);

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
		/****** md5 signature: 139386b2127d6614989017eba0879b6e ******/
		%feature("compactdefaultargs") CriteriumWeight;
		%feature("autodoc", "
Parameters
----------

Return
-------
W1: double
W2: double
W3: double

Description
-----------
returns the Weights (as percent) associed to the criterium used in the optimization.
") CriteriumWeight;
		void CriteriumWeight(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** GeomFill_AppSurf::Curve2d ******/
		/****** md5 signature: 7ccf7011ebfd430185be7d33b0430b55 ******/
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
		void Curve2d(const int Index, TColgp_Array1OfPnt2d & TPoles, TColStd_Array1OfReal & TKnots, TColStd_Array1OfInteger & TMults);

		/****** GeomFill_AppSurf::Curve2dPoles ******/
		/****** md5 signature: fc2138bbb0ece5a2ec367b33ec9b43ac ******/
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
		const TColgp_Array1OfPnt2d & Curve2dPoles(const int Index);

		/****** GeomFill_AppSurf::Curves2dDegree ******/
		/****** md5 signature: fb4d118788312f8319247632ed2e7a3d ******/
		%feature("compactdefaultargs") Curves2dDegree;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Curves2dDegree;
		int Curves2dDegree();

		/****** GeomFill_AppSurf::Curves2dKnots ******/
		/****** md5 signature: a44b03ca53ab6993c2a4d58ca6826417 ******/
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
		/****** md5 signature: d1414d8ce95849a2164808aafd909e37 ******/
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
		/****** md5 signature: c39c09b90dd3a7aec0bf05cddeea7de4 ******/
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
		/****** md5 signature: d97434c03680761ee0e90ab9ca60964f ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
Degmin: int
Degmax: int
Tol3d: double
Tol2d: double
NbIt: int
KnownParameters: bool (optional, default to false)

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const int Degmin, const int Degmax, const double Tol3d, const double Tol2d, const int NbIt, const bool KnownParameters = false);

		/****** GeomFill_AppSurf::IsDone ******/
		/****** md5 signature: 2be114a985aea21262ebd32099ccc3a6 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsDone;
		bool IsDone();

		/****** GeomFill_AppSurf::NbCurves2d ******/
		/****** md5 signature: 29e9ed673844fb3782000214519b7fa1 ******/
		%feature("compactdefaultargs") NbCurves2d;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbCurves2d;
		int NbCurves2d();

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
		/****** md5 signature: f83e771773222513a2a5564f99aca08e ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Lin: GeomFill_Line
SecGen: GeomFill_SectionGenerator
SpApprox: bool (optional, default to false)

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const opencascade::handle<GeomFill_Line> & Lin, GeomFill_SectionGenerator & SecGen, const bool SpApprox = false);

		/****** GeomFill_AppSurf::Perform ******/
		/****** md5 signature: cde15c39b660c569e1e659187d63059c ******/
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
		void Perform(const opencascade::handle<GeomFill_Line> & Lin, GeomFill_SectionGenerator & SecGen, const int NbMaxP);

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
		/****** md5 signature: 05101a83f2b5fa2243baf47e817e2437 ******/
		%feature("compactdefaultargs") SetCriteriumWeight;
		%feature("autodoc", "
Parameters
----------
W1: double
W2: double
W3: double

Return
-------
None

Description
-----------
define the Weights associed to the criterium used in the optimization. //! if Wi <= 0.
") SetCriteriumWeight;
		void SetCriteriumWeight(const double W1, const double W2, const double W3);

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
		/****** md5 signature: fa6137cc7cb8eb6c7f47a5bbea62ce4a ******/
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
		/****** md5 signature: 969593833778f731db9ba7fd1c5ab62d ******/
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
		/****** md5 signature: 1027553c6b1dff236a0b8cb4928edc43 ******/
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
		/****** md5 signature: 13e6afb95c6bae07d119ada538cec8a0 ******/
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
		/****** md5 signature: be8d511b070808100553277d9e3d961f ******/
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
		/****** md5 signature: febf015332f02c022aa8c2a8f833c985 ******/
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
		/****** md5 signature: 9ff1463ad6c8f0f062b0c068aeda1043 ******/
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
		/****** md5 signature: 671f369dee50862b8a0b7f6a973c380f ******/
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
		/****** md5 signature: d6477b4bc85f93165a4bf73b1614f603 ******/
		%feature("compactdefaultargs") TolCurveOnSurf;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
double

Description
-----------
No available documentation.
") TolCurveOnSurf;
		double TolCurveOnSurf(const int Index);

		/****** GeomFill_AppSurf::TolReached ******/
		/****** md5 signature: fb5b2f0ee59c5fea9bfe8dc881f609c1 ******/
		%feature("compactdefaultargs") TolReached;
		%feature("autodoc", "
Parameters
----------

Return
-------
Tol3d: double
Tol2d: double

Description
-----------
No available documentation.
") TolReached;
		void TolReached(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** GeomFill_AppSurf::UDegree ******/
		/****** md5 signature: fca90e3f2f4c1ba6e7bc9cbc04110d23 ******/
		%feature("compactdefaultargs") UDegree;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") UDegree;
		int UDegree();

		/****** GeomFill_AppSurf::VDegree ******/
		/****** md5 signature: c793f94fb8ca1e7cdd3fc97529f675d2 ******/
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
		/****** md5 signature: bc47599b35e288fc0420763d801e61b6 ******/
		%feature("compactdefaultargs") GeomFill_AppSweep;
		%feature("autodoc", "
Parameters
----------
Degmin: int
Degmax: int
Tol3d: double
Tol2d: double
NbIt: int
KnownParameters: bool (optional, default to false)

Return
-------
None

Description
-----------
No available documentation.
") GeomFill_AppSweep;
		 GeomFill_AppSweep(const int Degmin, const int Degmax, const double Tol3d, const double Tol2d, const int NbIt, const bool KnownParameters = false);

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
		/****** md5 signature: 139386b2127d6614989017eba0879b6e ******/
		%feature("compactdefaultargs") CriteriumWeight;
		%feature("autodoc", "
Parameters
----------

Return
-------
W1: double
W2: double
W3: double

Description
-----------
returns the Weights (as percent) associed to the criterium used in the optimization.
") CriteriumWeight;
		void CriteriumWeight(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** GeomFill_AppSweep::Curve2d ******/
		/****** md5 signature: 7ccf7011ebfd430185be7d33b0430b55 ******/
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
		void Curve2d(const int Index, TColgp_Array1OfPnt2d & TPoles, TColStd_Array1OfReal & TKnots, TColStd_Array1OfInteger & TMults);

		/****** GeomFill_AppSweep::Curve2dPoles ******/
		/****** md5 signature: fc2138bbb0ece5a2ec367b33ec9b43ac ******/
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
		const TColgp_Array1OfPnt2d & Curve2dPoles(const int Index);

		/****** GeomFill_AppSweep::Curves2dDegree ******/
		/****** md5 signature: fb4d118788312f8319247632ed2e7a3d ******/
		%feature("compactdefaultargs") Curves2dDegree;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Curves2dDegree;
		int Curves2dDegree();

		/****** GeomFill_AppSweep::Curves2dKnots ******/
		/****** md5 signature: a44b03ca53ab6993c2a4d58ca6826417 ******/
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
		/****** md5 signature: d1414d8ce95849a2164808aafd909e37 ******/
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
		/****** md5 signature: c39c09b90dd3a7aec0bf05cddeea7de4 ******/
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
		/****** md5 signature: d97434c03680761ee0e90ab9ca60964f ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
Degmin: int
Degmax: int
Tol3d: double
Tol2d: double
NbIt: int
KnownParameters: bool (optional, default to false)

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const int Degmin, const int Degmax, const double Tol3d, const double Tol2d, const int NbIt, const bool KnownParameters = false);

		/****** GeomFill_AppSweep::IsDone ******/
		/****** md5 signature: 2be114a985aea21262ebd32099ccc3a6 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsDone;
		bool IsDone();

		/****** GeomFill_AppSweep::NbCurves2d ******/
		/****** md5 signature: 29e9ed673844fb3782000214519b7fa1 ******/
		%feature("compactdefaultargs") NbCurves2d;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbCurves2d;
		int NbCurves2d();

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
		/****** md5 signature: f06eb761c7075e374402456ef30c198e ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Lin: GeomFill_Line
SecGen: GeomFill_SweepSectionGenerator
SpApprox: bool (optional, default to false)

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const opencascade::handle<GeomFill_Line> & Lin, GeomFill_SweepSectionGenerator & SecGen, const bool SpApprox = false);

		/****** GeomFill_AppSweep::Perform ******/
		/****** md5 signature: 20e5b68b8dafba70b97b61bd8bfad45d ******/
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
		void Perform(const opencascade::handle<GeomFill_Line> & Lin, GeomFill_SweepSectionGenerator & SecGen, const int NbMaxP);

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
		/****** md5 signature: 05101a83f2b5fa2243baf47e817e2437 ******/
		%feature("compactdefaultargs") SetCriteriumWeight;
		%feature("autodoc", "
Parameters
----------
W1: double
W2: double
W3: double

Return
-------
None

Description
-----------
define the Weights associed to the criterium used in the optimization. //! if Wi <= 0.
") SetCriteriumWeight;
		void SetCriteriumWeight(const double W1, const double W2, const double W3);

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
		/****** md5 signature: fa6137cc7cb8eb6c7f47a5bbea62ce4a ******/
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
		/****** md5 signature: 969593833778f731db9ba7fd1c5ab62d ******/
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
		/****** md5 signature: 1027553c6b1dff236a0b8cb4928edc43 ******/
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
		/****** md5 signature: 13e6afb95c6bae07d119ada538cec8a0 ******/
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
		/****** md5 signature: be8d511b070808100553277d9e3d961f ******/
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
		/****** md5 signature: febf015332f02c022aa8c2a8f833c985 ******/
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
		/****** md5 signature: 9ff1463ad6c8f0f062b0c068aeda1043 ******/
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
		/****** md5 signature: 671f369dee50862b8a0b7f6a973c380f ******/
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
		/****** md5 signature: d6477b4bc85f93165a4bf73b1614f603 ******/
		%feature("compactdefaultargs") TolCurveOnSurf;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
double

Description
-----------
No available documentation.
") TolCurveOnSurf;
		double TolCurveOnSurf(const int Index);

		/****** GeomFill_AppSweep::TolReached ******/
		/****** md5 signature: fb5b2f0ee59c5fea9bfe8dc881f609c1 ******/
		%feature("compactdefaultargs") TolReached;
		%feature("autodoc", "
Parameters
----------

Return
-------
Tol3d: double
Tol2d: double

Description
-----------
No available documentation.
") TolReached;
		void TolReached(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** GeomFill_AppSweep::UDegree ******/
		/****** md5 signature: fca90e3f2f4c1ba6e7bc9cbc04110d23 ******/
		%feature("compactdefaultargs") UDegree;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") UDegree;
		int UDegree();

		/****** GeomFill_AppSweep::VDegree ******/
		/****** md5 signature: c793f94fb8ca1e7cdd3fc97529f675d2 ******/
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
		/****** md5 signature: 251449882dcfa76eb660da5cec555a53 ******/
		%feature("compactdefaultargs") Bounds;
		%feature("autodoc", "
Parameters
----------

Return
-------
First: double
Last: double

Description
-----------
No available documentation.
") Bounds;
		virtual void Bounds(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** GeomFill_Boundary::D1 ******/
		/****** md5 signature: 45bf5cb36c4743c05e09796fe18c4f84 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
U: double
P: gp_Pnt
V: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") D1;
		virtual void D1(const double U, gp_Pnt & P, gp_Vec & V);

		/****** GeomFill_Boundary::D1Norm ******/
		/****** md5 signature: c2fe4dfc5c183e00a693d49220eeb485 ******/
		%feature("compactdefaultargs") D1Norm;
		%feature("autodoc", "
Parameters
----------
U: double
N: gp_Vec
DN: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") D1Norm;
		virtual void D1Norm(const double U, gp_Vec & N, gp_Vec & DN);

		/****** GeomFill_Boundary::HasNormals ******/
		/****** md5 signature: ce69273845489ab794a804666586d4ed ******/
		%feature("compactdefaultargs") HasNormals;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") HasNormals;
		virtual bool HasNormals();

		/****** GeomFill_Boundary::IsDegenerated ******/
		/****** md5 signature: 586830d6fe447367f57923c78bb8db0d ******/
		%feature("compactdefaultargs") IsDegenerated;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsDegenerated;
		virtual bool IsDegenerated();

		/****** GeomFill_Boundary::Norm ******/
		/****** md5 signature: 8e61de099e42763b05421c09e00f1969 ******/
		%feature("compactdefaultargs") Norm;
		%feature("autodoc", "
Parameters
----------
U: double

Return
-------
gp_Vec

Description
-----------
No available documentation.
") Norm;
		virtual gp_Vec Norm(const double U);

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
		/****** md5 signature: 3e71b3a7957af7e9abe3ba02fd3f9fc5 ******/
		%feature("compactdefaultargs") Reparametrize;
		%feature("autodoc", "
Parameters
----------
First: double
Last: double
HasDF: bool
HasDL: bool
DF: double
DL: double
Rev: bool

Return
-------
None

Description
-----------
No available documentation.
") Reparametrize;
		virtual void Reparametrize(const double First, const double Last, const bool HasDF, const bool HasDL, const double DF, const double DL, const bool Rev);

		/****** GeomFill_Boundary::Tol3d ******/
		/****** md5 signature: cf50da21efbed6fecf997c2344f8a213 ******/
		%feature("compactdefaultargs") Tol3d;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") Tol3d;
		double Tol3d();

		/****** GeomFill_Boundary::Tol3d ******/
		/****** md5 signature: d3a112ba5cf6996cbdce9607251792df ******/
		%feature("compactdefaultargs") Tol3d;
		%feature("autodoc", "
Parameters
----------
Tol: double

Return
-------
None

Description
-----------
No available documentation.
") Tol3d;
		void Tol3d(const double Tol);

		/****** GeomFill_Boundary::Tolang ******/
		/****** md5 signature: 4db004978c09c78a8b2e7d559feffb89 ******/
		%feature("compactdefaultargs") Tolang;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") Tolang;
		double Tolang();

		/****** GeomFill_Boundary::Tolang ******/
		/****** md5 signature: efef13577b3a597a3b65383e811d25a9 ******/
		%feature("compactdefaultargs") Tolang;
		%feature("autodoc", "
Parameters
----------
Tol: double

Return
-------
None

Description
-----------
No available documentation.
") Tolang;
		void Tolang(const double Tol);

		/****** GeomFill_Boundary::Value ******/
		/****** md5 signature: 3e2eb1bbe235ae23f941f4756c998e88 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
U: double

Return
-------
gp_Pnt

Description
-----------
No available documentation.
") Value;
		virtual gp_Pnt Value(const double U);

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
		/****** md5 signature: dba7b6245cf994e6d4a8d0e47f39a5e1 ******/
		%feature("compactdefaultargs") GeomFill_CircularBlendFunc;
		%feature("autodoc", "
Parameters
----------
Path: Adaptor3d_Curve
Curve1: Adaptor3d_Curve
Curve2: Adaptor3d_Curve
Radius: double
Polynomial: bool (optional, default to false)

Return
-------
None

Description
-----------
Create a Blend with a constant radius with 2 guide-line. <FShape> sets the type of fillet surface. The default value is Convert_TgtThetaOver2 (classical nurbs representation of circles). ChFi3d_QuasiAngular corresponds to a nurbs representation of circles which parameterisation matches the circle one. ChFi3d_Polynomial corresponds to a polynomial representation of circles.
") GeomFill_CircularBlendFunc;
		 GeomFill_CircularBlendFunc(const opencascade::handle<Adaptor3d_Curve> & Path, const opencascade::handle<Adaptor3d_Curve> & Curve1, const opencascade::handle<Adaptor3d_Curve> & Curve2, const double Radius, const bool Polynomial = false);

		/****** GeomFill_CircularBlendFunc::BarycentreOfSurf ******/
		/****** md5 signature: 1f25b0eb1d890895eb1250cc0c28882b ******/
		%feature("compactdefaultargs") BarycentreOfSurf;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Get the barycentre of Surface. A very poor estimation is sufficient. This information is useful to perform well conditioned rational approximation.
") BarycentreOfSurf;
		gp_Pnt BarycentreOfSurf();

		/****** GeomFill_CircularBlendFunc::D0 ******/
		/****** md5 signature: d64f5fa0ee4cfd988fe34ce17e01e38b ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
Param: double
First: double
Last: double
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
		bool D0(const double Param, const double First, const double Last, TColgp_Array1OfPnt & Poles, TColgp_Array1OfPnt2d & Poles2d, TColStd_Array1OfReal & Weigths);

		/****** GeomFill_CircularBlendFunc::D1 ******/
		/****** md5 signature: f122a00989a158b63aadd60916d6c393 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
Param: double
First: double
Last: double
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
		bool D1(const double Param, const double First, const double Last, TColgp_Array1OfPnt & Poles, TColgp_Array1OfVec & DPoles, TColgp_Array1OfPnt2d & Poles2d, TColgp_Array1OfVec2d & DPoles2d, TColStd_Array1OfReal & Weigths, TColStd_Array1OfReal & DWeigths);

		/****** GeomFill_CircularBlendFunc::D2 ******/
		/****** md5 signature: 7a1a70dd7a73b71015b51dcc133cc9d9 ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
Param: double
First: double
Last: double
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
		bool D2(const double Param, const double First, const double Last, TColgp_Array1OfPnt & Poles, TColgp_Array1OfVec & DPoles, TColgp_Array1OfVec & D2Poles, TColgp_Array1OfPnt2d & Poles2d, TColgp_Array1OfVec2d & DPoles2d, TColgp_Array1OfVec2d & D2Poles2d, TColStd_Array1OfReal & Weigths, TColStd_Array1OfReal & DWeigths, TColStd_Array1OfReal & D2Weigths);

		/****** GeomFill_CircularBlendFunc::GetMinimalWeight ******/
		/****** md5 signature: 6484606f629c915e24cdd616ac007d67 ******/
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
		void GetMinimalWeight(TColStd_Array1OfReal & Weigths);

		/****** GeomFill_CircularBlendFunc::GetTolerance ******/
		/****** md5 signature: 217050fdab79b8e071e91271c92a3488 ******/
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "
Parameters
----------
BoundTol: double
SurfTol: double
AngleTol: double
Tol3d: TColStd_Array1OfReal

Return
-------
None

Description
-----------
Returns the tolerance to reach in approximation to respect BoundTol error at the Boundary AngleTol tangent error at the Boundary (in radian) SurfTol error inside the surface.
") GetTolerance;
		void GetTolerance(const double BoundTol, const double SurfTol, const double AngleTol, TColStd_Array1OfReal & Tol3d);

		/****** GeomFill_CircularBlendFunc::Intervals ******/
		/****** md5 signature: c706a9ee65ae76457235d7e55942295b ******/
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

		/****** GeomFill_CircularBlendFunc::IsRational ******/
		/****** md5 signature: 43e7b94be36c1d44222e606d2d075195 ******/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns if the section is rational or not.
") IsRational;
		bool IsRational();

		/****** GeomFill_CircularBlendFunc::Knots ******/
		/****** md5 signature: 359ac10e91186ab2f75e6163036a99fe ******/
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
		void Knots(TColStd_Array1OfReal & TKnots);

		/****** GeomFill_CircularBlendFunc::MaximalSection ******/
		/****** md5 signature: 1811db5e3dd550ab78611f3959bb8ecf ******/
		%feature("compactdefaultargs") MaximalSection;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the length of the maximum section. This information is useful to perform well conditioned rational approximation.
") MaximalSection;
		double MaximalSection();

		/****** GeomFill_CircularBlendFunc::Mults ******/
		/****** md5 signature: 2c8f8c7780e1bd71859fc4a6b9500baf ******/
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
		void Mults(TColStd_Array1OfInteger & TMults);

		/****** GeomFill_CircularBlendFunc::Nb2dCurves ******/
		/****** md5 signature: 4e7cc537ccba8267281b74444e5ffb1a ******/
		%feature("compactdefaultargs") Nb2dCurves;
		%feature("autodoc", "Return
-------
int

Description
-----------
get the number of 2d curves to approximate.
") Nb2dCurves;
		int Nb2dCurves();

		/****** GeomFill_CircularBlendFunc::NbIntervals ******/
		/****** md5 signature: b2aaad8a5aa5a35490639df04a76a09e ******/
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
		int NbIntervals(const GeomAbs_Shape S);

		/****** GeomFill_CircularBlendFunc::SectionShape ******/
		/****** md5 signature: a753d69cb00f0b8439b79ce3401bb770 ******/
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
		void SectionShape(Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****** GeomFill_CircularBlendFunc::SetInterval ******/
		/****** md5 signature: 56dbce7f545295f90d642a293e48bb2a ******/
		%feature("compactdefaultargs") SetInterval;
		%feature("autodoc", "
Parameters
----------
First: double
Last: double

Return
-------
None

Description
-----------
Sets the bounds of the parametric interval on the fonction This determines the derivatives in these values if the function is not Cn.
") SetInterval;
		void SetInterval(const double First, const double Last);

		/****** GeomFill_CircularBlendFunc::SetTolerance ******/
		/****** md5 signature: 29c79f73c127702faa370cb75cf828a6 ******/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "
Parameters
----------
Tol3d: double
Tol2d: double

Return
-------
None

Description
-----------
Is useful, if (me) has to be run numerical algorithm to perform D0, D1 or D2.
") SetTolerance;
		void SetTolerance(const double Tol3d, const double Tol2d);

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
		/****** md5 signature: ed11ce50a4bd6d67318960f94a61acc1 ******/
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
		 GeomFill_ConstrainedFilling(const int MaxDeg, const int MaxSeg);

		/****** GeomFill_ConstrainedFilling::Boundary ******/
		/****** md5 signature: 9dd23777ee3aafac63d352356f1682bf ******/
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
		opencascade::handle<GeomFill_Boundary> Boundary(const int I);

		/****** GeomFill_ConstrainedFilling::CheckApprox ******/
		/****** md5 signature: 4b2bb7ba8012644bd9541528588dbfd1 ******/
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
		void CheckApprox(const int I);

		/****** GeomFill_ConstrainedFilling::CheckCoonsAlgPatch ******/
		/****** md5 signature: a8bccc9866bad80be6e59962d2fbe67e ******/
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
		void CheckCoonsAlgPatch(const int I);

		/****** GeomFill_ConstrainedFilling::CheckResult ******/
		/****** md5 signature: 486c766cb459c2113c9ed7d696bf76fc ******/
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
		void CheckResult(const int I);

		/****** GeomFill_ConstrainedFilling::CheckTgteField ******/
		/****** md5 signature: 116982bac016feb8f055ad194f94c548 ******/
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
		void CheckTgteField(const int I);

		/****** GeomFill_ConstrainedFilling::Eval ******/
		/****** md5 signature: 3c562b335832d489ba51b7f6d4135cdc ******/
		%feature("compactdefaultargs") Eval;
		%feature("autodoc", "
Parameters
----------
W: double
Ord: int

Return
-------
Result: double

Description
-----------
Internal use for Advmath approximation call.
") Eval;
		int Eval(const double W, const int Ord, Standard_Real &OutValue);

		/****** GeomFill_ConstrainedFilling::Init ******/
		/****** md5 signature: 51a012a3469122e85d96b5c5ec85c7aa ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
B1: GeomFill_Boundary
B2: GeomFill_Boundary
B3: GeomFill_Boundary
NoCheck: bool (optional, default to false)

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<GeomFill_Boundary> & B1, const opencascade::handle<GeomFill_Boundary> & B2, const opencascade::handle<GeomFill_Boundary> & B3, const bool NoCheck = false);

		/****** GeomFill_ConstrainedFilling::Init ******/
		/****** md5 signature: 1e32734cee243d977f268dceacd527ab ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
B1: GeomFill_Boundary
B2: GeomFill_Boundary
B3: GeomFill_Boundary
B4: GeomFill_Boundary
NoCheck: bool (optional, default to false)

Return
-------
None

Description
-----------
Constructs a BSpline surface filled from the series of boundaries B1, B2, B3 and, if need be, B4, which serve: - as path constraints - and optionally, as tangency constraints if they are GeomFill_BoundWithSurf curves. The boundaries may be given in any order: they are classified and if necessary, reversed and reparameterized. The surface will also respect the following constraints: - its degree will not be greater than the maximum degree defined at the time of construction of this framework, and - the maximum number of segments MaxSeg which BSpline surfaces can have.
") Init;
		void Init(const opencascade::handle<GeomFill_Boundary> & B1, const opencascade::handle<GeomFill_Boundary> & B2, const opencascade::handle<GeomFill_Boundary> & B3, const opencascade::handle<GeomFill_Boundary> & B4, const bool NoCheck = false);

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
		/****** md5 signature: 3e69a3710e19c606c2f7fa84f988b2bb ******/
		%feature("compactdefaultargs") SetDomain;
		%feature("autodoc", "
Parameters
----------
l: double
B: GeomFill_BoundWithSurf

Return
-------
None

Description
-----------
Allows to modify domain on which the blending function associated to the constrained boundary B will propag the influence of the field of tangency. Can be useful to reduce influence of boundaries on which the Coons compatibility conditions are not respected. l is a relative value of the parametric range of B. Default value for l is 1 (used in Init). Warning: Must be called after Init with a constrained boundary used in the call to Init.
") SetDomain;
		void SetDomain(const double l, const opencascade::handle<GeomFill_BoundWithSurf> & B);

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
		/****** md5 signature: 69a4140a1e5c316308dea6acdda3c3f3 ******/
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
		const opencascade::handle<GeomFill_Boundary> & Bound(const int I);

		/****** GeomFill_CoonsAlgPatch::Corner ******/
		/****** md5 signature: efcbb8ca9355e4c725068198bc53c91f ******/
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
		const gp_Pnt Corner(const int I);

		/****** GeomFill_CoonsAlgPatch::D1U ******/
		/****** md5 signature: 8cfdcd0184c8eb13d73d9807de065c9e ******/
		%feature("compactdefaultargs") D1U;
		%feature("autodoc", "
Parameters
----------
U: double
V: double

Return
-------
gp_Vec

Description
-----------
Computes the d/dU partial derivative on the algorithmic patch at parameters U and V.
") D1U;
		gp_Vec D1U(const double U, const double V);

		/****** GeomFill_CoonsAlgPatch::D1V ******/
		/****** md5 signature: 1988d830cc063df4ec7b47d7d3f59cc0 ******/
		%feature("compactdefaultargs") D1V;
		%feature("autodoc", "
Parameters
----------
U: double
V: double

Return
-------
gp_Vec

Description
-----------
Computes the d/dV partial derivative on the algorithmic patch at parameters U and V.
") D1V;
		gp_Vec D1V(const double U, const double V);

		/****** GeomFill_CoonsAlgPatch::DUV ******/
		/****** md5 signature: 9c94e2f4fa9dc71f0701aeeb9abe247f ******/
		%feature("compactdefaultargs") DUV;
		%feature("autodoc", "
Parameters
----------
U: double
V: double

Return
-------
gp_Vec

Description
-----------
Computes the d2/dUdV partial derivative on the algorithmic patch made with linear blending functions at parameter U and V.
") DUV;
		gp_Vec DUV(const double U, const double V);

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
		/****** md5 signature: a59d21938e970117b8205b153d7faa07 ******/
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
		const opencascade::handle<Law_Function> & Func(const int I);

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
		/****** md5 signature: 4d5f48397f1a8859855c2556759a8367 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
U: double
V: double

Return
-------
gp_Pnt

Description
-----------
Computes the value on the algorithmic patch at parameters U and V.
") Value;
		gp_Pnt Value(const double U, const double V);

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
		/****** md5 signature: 2836a9db62f46dabd467b2c3adab5e63 ******/
		%feature("compactdefaultargs") DoKill;
		%feature("autodoc", "
Parameters
----------
Scal: double

Return
-------
None

Description
-----------
No available documentation.
") DoKill;
		void DoKill(const double Scal);

		/****** GeomFill_CornerState::Gap ******/
		/****** md5 signature: 440448988cf9c1f10c0497f08aa39855 ******/
		%feature("compactdefaultargs") Gap;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") Gap;
		double Gap();

		/****** GeomFill_CornerState::Gap ******/
		/****** md5 signature: 6d3dcb37eec647deb9e589c7af1ecccf ******/
		%feature("compactdefaultargs") Gap;
		%feature("autodoc", "
Parameters
----------
G: double

Return
-------
None

Description
-----------
No available documentation.
") Gap;
		void Gap(const double G);

		/****** GeomFill_CornerState::HasConstraint ******/
		/****** md5 signature: 6afeb16f50e3932ce6133187f7e26736 ******/
		%feature("compactdefaultargs") HasConstraint;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") HasConstraint;
		bool HasConstraint();

		/****** GeomFill_CornerState::IsToKill ******/
		/****** md5 signature: 3c0971c3ed9cedf54a7cf13a77236b86 ******/
		%feature("compactdefaultargs") IsToKill;
		%feature("autodoc", "
Parameters
----------

Return
-------
Scal: double

Description
-----------
No available documentation.
") IsToKill;
		bool IsToKill(Standard_Real &OutValue);

		/****** GeomFill_CornerState::NorAng ******/
		/****** md5 signature: aad00d0480a533b30c7380bf3fd3846b ******/
		%feature("compactdefaultargs") NorAng;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") NorAng;
		double NorAng();

		/****** GeomFill_CornerState::NorAng ******/
		/****** md5 signature: 51a846c1d4649c5993b59ef8a91acee3 ******/
		%feature("compactdefaultargs") NorAng;
		%feature("autodoc", "
Parameters
----------
Ang: double

Return
-------
None

Description
-----------
No available documentation.
") NorAng;
		void NorAng(const double Ang);

		/****** GeomFill_CornerState::TgtAng ******/
		/****** md5 signature: eda476b0d4b0e5ac01e48e2c65b576b5 ******/
		%feature("compactdefaultargs") TgtAng;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") TgtAng;
		double TgtAng();

		/****** GeomFill_CornerState::TgtAng ******/
		/****** md5 signature: cd730f17ed056aec69b15bc706bced9d ******/
		%feature("compactdefaultargs") TgtAng;
		%feature("autodoc", "
Parameters
----------
Ang: double

Return
-------
None

Description
-----------
No available documentation.
") TgtAng;
		void TgtAng(const double Ang);

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
		/****** md5 signature: ecab3cbbaf18559e002fccdfa81aa0d5 ******/
		%feature("compactdefaultargs") NbUPoles;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbUPoles;
		int NbUPoles();

		/****** GeomFill_Filling::NbVPoles ******/
		/****** md5 signature: fd4ae03f2a37db0cb241bb2f458a15bb ******/
		%feature("compactdefaultargs") NbVPoles;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbVPoles;
		int NbVPoles();

		/****** GeomFill_Filling::Poles ******/
		/****** md5 signature: 7895e311f9e04f5274b30f5403029128 ******/
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
		/****** md5 signature: 27ec23369f3bccd78c536c33ade5b424 ******/
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
		/****** md5 signature: 2d134f58b1ac19806ba32cb72ce44772 ******/
		%feature("compactdefaultargs") isRational;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") isRational;
		bool isRational();

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
		/****** md5 signature: 0ed6658dda4788e833f539db00108be4 ******/
		%feature("compactdefaultargs") Deriv2T;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve
Param: double
W: double
d2N: gp_Vec
teta: double
F: math_Vector

Return
-------
bool

Description
-----------
returns the values <F> of the T2 derivatives for the parameter Param.
") Deriv2T;
		bool Deriv2T(const opencascade::handle<Adaptor3d_Curve> & C, const double Param, const double W, const gp_Vec & d2N, const double teta, math_Vector & F);

		/****** GeomFill_FunctionDraft::Deriv2X ******/
		/****** md5 signature: 492e65d40c96c5fa8bab3aeb62eeae03 ******/
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
returns the values <T> of the X2 derivatives for the parameter Param.
") Deriv2X;
		bool Deriv2X(const math_Vector & X, GeomFill_Tensor & T);

		/****** GeomFill_FunctionDraft::DerivT ******/
		/****** md5 signature: b319dd0d4f0ab4ebba1a388ebcb95870 ******/
		%feature("compactdefaultargs") DerivT;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve
Param: double
W: double
dN: gp_Vec
teta: double
F: math_Vector

Return
-------
bool

Description
-----------
returns the values <F> of the T derivatives for the parameter Param.
") DerivT;
		bool DerivT(const opencascade::handle<Adaptor3d_Curve> & C, const double Param, const double W, const gp_Vec & dN, const double teta, math_Vector & F);

		/****** GeomFill_FunctionDraft::DerivTX ******/
		/****** md5 signature: e3779dd703fc5b6bf81078d88515cfe3 ******/
		%feature("compactdefaultargs") DerivTX;
		%feature("autodoc", "
Parameters
----------
dN: gp_Vec
teta: double
D: math_Matrix

Return
-------
bool

Description
-----------
returns the values <D> of the TX derivatives for the parameter Param.
") DerivTX;
		bool DerivTX(const gp_Vec & dN, const double teta, math_Matrix & D);

		/****** GeomFill_FunctionDraft::Derivatives ******/
		/****** md5 signature: 00f7bf70701f1cd8a54c33dd76de6f69 ******/
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
		bool Derivatives(const math_Vector & X, math_Matrix & D);

		/****** GeomFill_FunctionDraft::NbEquations ******/
		/****** md5 signature: d96db90f938251af5669711b5ae9a95b ******/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the number of equations of the function.
") NbEquations;
		int NbEquations();

		/****** GeomFill_FunctionDraft::NbVariables ******/
		/****** md5 signature: ac9e90c594b52fb2529a5f6212b74800 ******/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the number of variables of the function.
") NbVariables;
		int NbVariables();

		/****** GeomFill_FunctionDraft::Value ******/
		/****** md5 signature: 0c7370340ec5630e535d5a2268027fba ******/
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
		bool Value(const math_Vector & X, math_Vector & F);

		/****** GeomFill_FunctionDraft::Values ******/
		/****** md5 signature: 4b9240a0e5cabe81bc6533f7aaa2df5f ******/
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
		bool Values(const math_Vector & X, math_Vector & F, math_Matrix & D);

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
		/****** md5 signature: 22e34d4f76ca0e96cb1de1388596575b ******/
		%feature("compactdefaultargs") GeomFill_FunctionGuide;
		%feature("autodoc", "
Parameters
----------
S: GeomFill_SectionLaw
Guide: Adaptor3d_Curve
ParamOnLaw: double (optional, default to 0.0)

Return
-------
None

Description
-----------
No available documentation.
") GeomFill_FunctionGuide;
		 GeomFill_FunctionGuide(const opencascade::handle<GeomFill_SectionLaw> & S, const opencascade::handle<Adaptor3d_Curve> & Guide, const double ParamOnLaw = 0.0);

		/****** GeomFill_FunctionGuide::DerivT ******/
		/****** md5 signature: 0066a753159ac1696c16b919928555a3 ******/
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
		bool DerivT(const math_Vector & X, const gp_XYZ & DCentre, const gp_XYZ & DDir, math_Vector & DFDT);

		/****** GeomFill_FunctionGuide::Derivatives ******/
		/****** md5 signature: 00f7bf70701f1cd8a54c33dd76de6f69 ******/
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
		bool Derivatives(const math_Vector & X, math_Matrix & D);

		/****** GeomFill_FunctionGuide::NbEquations ******/
		/****** md5 signature: d96db90f938251af5669711b5ae9a95b ******/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the number of equations of the function.
") NbEquations;
		int NbEquations();

		/****** GeomFill_FunctionGuide::NbVariables ******/
		/****** md5 signature: ac9e90c594b52fb2529a5f6212b74800 ******/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the number of variables of the function.
") NbVariables;
		int NbVariables();

		/****** GeomFill_FunctionGuide::SetParam ******/
		/****** md5 signature: f4c18762c38d5f0a31ba56f4bd4558ef ******/
		%feature("compactdefaultargs") SetParam;
		%feature("autodoc", "
Parameters
----------
Param: double
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
		void SetParam(const double Param, const gp_Pnt & Centre, const gp_XYZ & Dir, const gp_XYZ & XDir);

		/****** GeomFill_FunctionGuide::Value ******/
		/****** md5 signature: 0c7370340ec5630e535d5a2268027fba ******/
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
		bool Value(const math_Vector & X, math_Vector & F);

		/****** GeomFill_FunctionGuide::Values ******/
		/****** md5 signature: 4b9240a0e5cabe81bc6533f7aaa2df5f ******/
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
		bool Values(const math_Vector & X, math_Vector & F, math_Matrix & D);

};


%extend GeomFill_FunctionGuide {
	%pythoncode {
	__repr__ = _dumps_object

	@methodnotwrapped
	def Deriv2T(self):
		pass
	}
};

/************************
* class GeomFill_Gordon *
************************/
class GeomFill_Gordon {
	public:
		/****** GeomFill_Gordon::GeomFill_Gordon ******/
		/****** md5 signature: e2e7daa5f86fd43ddcc8ccf7f150c135 ******/
		%feature("compactdefaultargs") GeomFill_Gordon;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates an empty Gordon surface algorithm.
") GeomFill_Gordon;
		 GeomFill_Gordon();

		/****** GeomFill_Gordon::Init ******/
		/****** md5 signature: 2d7fc0c728426802234b299b3562e9e3 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theProfiles: TColGeom_Array1OfCurve
theGuides: TColGeom_Array1OfCurve
theTolerance: double

Return
-------
None

Description
-----------
Initializes the algorithm with profile and guide curves. 
Input parameter: theProfiles array of profile curves (V-direction sections, must be >= 2) 
Input parameter: theGuides array of guide curves (U-direction sections, must be >= 2) 
Input parameter: theTolerance geometric tolerance for intersection detection.
") Init;
		void Init(const TColGeom_Array1OfCurve & theProfiles, const TColGeom_Array1OfCurve & theGuides, double theTolerance);

		/****** GeomFill_Gordon::IsDone ******/
		/****** md5 signature: 05e29e49040d98b489fbc7af11aabb8e ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the surface was successfully constructed.
") IsDone;
		bool IsDone();

		/****** GeomFill_Gordon::IsParallelMode ******/
		/****** md5 signature: 8f26eb5f23a1592f8117f2bf9193e47d ******/
		%feature("compactdefaultargs") IsParallelMode;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if internal parallel processing is enabled.
") IsParallelMode;
		bool IsParallelMode();

		/****** GeomFill_Gordon::Perform ******/
		/****** md5 signature: c04b01412cba7220c024b5eb4532697f ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Return
-------
None

Description
-----------
Performs the Gordon surface construction.
") Perform;
		void Perform();

		/****** GeomFill_Gordon::SetParallelMode ******/
		/****** md5 signature: dfd8184bddd5dc09e9a96572f87e3ce5 ******/
		%feature("compactdefaultargs") SetParallelMode;
		%feature("autodoc", "
Parameters
----------
theToUseParallel: bool

Return
-------
None

Description
-----------
Enables/disables parallel processing in internal stages. By default, single-thread mode is used.
") SetParallelMode;
		void SetParallelMode(bool theToUseParallel);

		/****** GeomFill_Gordon::Surface ******/
		/****** md5 signature: 671a5de971e9a6baf08b4e111daa768f ******/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_BSplineSurface>

Description
-----------
Returns the resulting Gordon B-spline surface.
") Surface;
		const opencascade::handle<Geom_BSplineSurface> & Surface();

};


%extend GeomFill_Gordon {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class GeomFill_GordonBuilder *
*******************************/
class GeomFill_GordonBuilder {
	public:
		/****** GeomFill_GordonBuilder::GeomFill_GordonBuilder ******/
		/****** md5 signature: 8cfff7419d8602124f7a3bb0671c8e11 ******/
		%feature("compactdefaultargs") GeomFill_GordonBuilder;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates an empty Gordon builder.
") GeomFill_GordonBuilder;
		 GeomFill_GordonBuilder();

		/****** GeomFill_GordonBuilder::GuideSurface ******/
		/****** md5 signature: f7188aa3d7330d2975199a54b7a0e3ff ******/
		%feature("compactdefaultargs") GuideSurface;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_BSplineSurface>

Description
-----------
Returns the intermediate surface skinned through guides.
") GuideSurface;
		const opencascade::handle<Geom_BSplineSurface> & GuideSurface();

		/****** GeomFill_GordonBuilder::Init ******/
		/****** md5 signature: cf6c78e4bb888a09ebec543dbd8e0ccb ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
theProfiles: TColGeom_Array1OfBSplineCurve
theGuides: TColGeom_Array1OfBSplineCurve
theProfileParams: TColStd_Array1OfReal
theGuideParams: TColStd_Array1OfReal
theTolerance: double
theIsUClosed: bool (optional, default to false)
theIsVClosed: bool (optional, default to false)

Return
-------
None

Description
-----------
Initializes the builder with compatible BSpline curves and intersection parameters. 
Input parameter: theProfiles array of profile curves (V-direction sections), must share  the same degree and knot vector 
Input parameter: theGuides array of guide curves (U-direction sections), must share  the same degree and knot vector 
Input parameter: theProfileParams parameter values at which profiles are positioned  (in V-direction), size must equal theProfiles.Length() 
Input parameter: theGuideParams parameter values at which guides are positioned  (in U-direction), size must equal theGuides.Length() 
Input parameter: theTolerance geometric tolerance for validation 
Input parameter: theIsUClosed if true, the U-direction (guides) forms a closed loop 
Input parameter: theIsVClosed if true, the V-direction (profiles) forms a closed loop.
") Init;
		void Init(const TColGeom_Array1OfBSplineCurve & theProfiles, const TColGeom_Array1OfBSplineCurve & theGuides, const TColStd_Array1OfReal & theProfileParams, const TColStd_Array1OfReal & theGuideParams, double theTolerance, bool theIsUClosed = false, bool theIsVClosed = false);

		/****** GeomFill_GordonBuilder::IsDone ******/
		/****** md5 signature: 05e29e49040d98b489fbc7af11aabb8e ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the surface was successfully constructed.
") IsDone;
		bool IsDone();

		/****** GeomFill_GordonBuilder::IsParallelMode ******/
		/****** md5 signature: 8f26eb5f23a1592f8117f2bf9193e47d ******/
		%feature("compactdefaultargs") IsParallelMode;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if internal parallel processing is enabled.
") IsParallelMode;
		bool IsParallelMode();

		/****** GeomFill_GordonBuilder::Perform ******/
		/****** md5 signature: c04b01412cba7220c024b5eb4532697f ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Return
-------
None

Description
-----------
Performs the Gordon surface construction.
") Perform;
		void Perform();

		/****** GeomFill_GordonBuilder::ProfileSurface ******/
		/****** md5 signature: 7fd4d3d18e51b899c482734ee0a7b127 ******/
		%feature("compactdefaultargs") ProfileSurface;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_BSplineSurface>

Description
-----------
Returns the intermediate surface skinned through profiles.
") ProfileSurface;
		const opencascade::handle<Geom_BSplineSurface> & ProfileSurface();

		/****** GeomFill_GordonBuilder::SetParallelMode ******/
		/****** md5 signature: dfd8184bddd5dc09e9a96572f87e3ce5 ******/
		%feature("compactdefaultargs") SetParallelMode;
		%feature("autodoc", "
Parameters
----------
theToUseParallel: bool

Return
-------
None

Description
-----------
Enables/disables parallel processing in internal stages. By default, single-thread mode is used.
") SetParallelMode;
		void SetParallelMode(bool theToUseParallel);

		/****** GeomFill_GordonBuilder::Surface ******/
		/****** md5 signature: 671a5de971e9a6baf08b4e111daa768f ******/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_BSplineSurface>

Description
-----------
Returns the resulting Gordon surface. 
Return: handle to the constructed B-spline surface.
") Surface;
		const opencascade::handle<Geom_BSplineSurface> & Surface();

		/****** GeomFill_GordonBuilder::TensorSurface ******/
		/****** md5 signature: eb73bf4ca862fd8c7260a69831a03769 ******/
		%feature("compactdefaultargs") TensorSurface;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_BSplineSurface>

Description
-----------
Returns the intermediate tensor product surface.
") TensorSurface;
		const opencascade::handle<Geom_BSplineSurface> & TensorSurface();

};


%extend GeomFill_GordonBuilder {
	%pythoncode {
	__repr__ = _dumps_object
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
		/****** md5 signature: 515044d30d7dfcde00ebfbc716ebfcfa ******/
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
		 GeomFill_Line(const int NbPoints);

		/****** GeomFill_Line::NbPoints ******/
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

		/****** GeomFill_Line::Point ******/
		/****** md5 signature: b6fd94d300bc0a301b16c586ca5a5b2c ******/
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
		int Point(const int Index);

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
		/****** md5 signature: f50c3653bc0f2dd096810a55ef137bc2 ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
Param: double
First: double
Last: double

Return
-------
bool

Description
-----------
compute the section for v = param.
") D0;
		bool D0(const double Param, const double First, const double Last);

		/****** GeomFill_LocFunction::D1 ******/
		/****** md5 signature: 25995f0ab4ffb317821d20050c45d8ed ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
Param: double
First: double
Last: double

Return
-------
bool

Description
-----------
compute the first derivative in v direction of the section for v = param.
") D1;
		bool D1(const double Param, const double First, const double Last);

		/****** GeomFill_LocFunction::D2 ******/
		/****** md5 signature: fb8f9d3d87a9c8204ed344b8519a797d ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
Param: double
First: double
Last: double

Return
-------
bool

Description
-----------
compute the second derivative in v direction of the section for v = param.
") D2;
		bool D2(const double Param, const double First, const double Last);

		/****** GeomFill_LocFunction::DN ******/
		/****** md5 signature: 1efdbcd0ed5179289da098c88cae0b0b ******/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "
Parameters
----------
Param: double
First: double
Last: double
Order: int

Return
-------
Result: double
Ier: int

Description
-----------
No available documentation.
") DN;
		void DN(const double Param, const double First, const double Last, const int Order, Standard_Real &OutValue, Standard_Integer &OutValue);

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
		/****** md5 signature: 35279dacab86b4ca5c7676df687d5f31 ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
Param: double
M: gp_Mat
V: gp_Vec

Return
-------
bool

Description
-----------
compute Location.
") D0;
		virtual bool D0(const double Param, gp_Mat & M, gp_Vec & V);

		/****** GeomFill_LocationLaw::D0 ******/
		/****** md5 signature: 0c77eafde4c93a032360b782e7300803 ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
Param: double
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
		virtual bool D0(const double Param, gp_Mat & M, gp_Vec & V, TColgp_Array1OfPnt2d & Poles2d);

		/****** GeomFill_LocationLaw::D1 ******/
		/****** md5 signature: 768503e1aeb836e12ad95d0933949784 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
Param: double
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
		virtual bool D1(const double Param, gp_Mat & M, gp_Vec & V, gp_Mat & DM, gp_Vec & DV, TColgp_Array1OfPnt2d & Poles2d, TColgp_Array1OfVec2d & DPoles2d);

		/****** GeomFill_LocationLaw::D2 ******/
		/****** md5 signature: b341d649458bb8ba70232090d5113327 ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
Param: double
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
compute location 2d points and associated first and second derivatives. Warning: It used only for C2 approximation.
") D2;
		virtual bool D2(const double Param, gp_Mat & M, gp_Vec & V, gp_Mat & DM, gp_Vec & DV, gp_Mat & D2M, gp_Vec & D2V, TColgp_Array1OfPnt2d & Poles2d, TColgp_Array1OfVec2d & DPoles2d, TColgp_Array1OfVec2d & D2Poles2d);

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
Get average value of M(t) and V(t) it is useful to make fast approximation of rational surfaces.
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
		/****** md5 signature: b591590d3bc2b0e7570065100d4075f9 ******/
		%feature("compactdefaultargs") GetDomain;
		%feature("autodoc", "
Parameters
----------

Return
-------
First: double
Last: double

Description
-----------
Gets the bounds of the function parametric domain. Warning: This domain it is not modified by the SetValue method.
") GetDomain;
		virtual void GetDomain(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** GeomFill_LocationLaw::GetInterval ******/
		/****** md5 signature: 3e654d77c65f4a1842af3a4549e9615b ******/
		%feature("compactdefaultargs") GetInterval;
		%feature("autodoc", "
Parameters
----------

Return
-------
First: double
Last: double

Description
-----------
Gets the bounds of the parametric interval on the function.
") GetInterval;
		virtual void GetInterval(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** GeomFill_LocationLaw::GetMaximalNorm ******/
		/****** md5 signature: 6a2da337f505f8283b9a78ea19137fd6 ******/
		%feature("compactdefaultargs") GetMaximalNorm;
		%feature("autodoc", "Return
-------
double

Description
-----------
Get the maximum Norm of the matrix-location part. It is usful to find a good Tolerance to approx M(t).
") GetMaximalNorm;
		virtual double GetMaximalNorm();

		/****** GeomFill_LocationLaw::HasFirstRestriction ******/
		/****** md5 signature: b3c3bc21ff51899ac84c19536638dcbd ******/
		%feature("compactdefaultargs") HasFirstRestriction;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Say if the first restriction is defined in this class. If it is true the first element of poles array in D0,D1,D2... Correspond to this restriction. Returns false (default implementation).
") HasFirstRestriction;
		virtual bool HasFirstRestriction();

		/****** GeomFill_LocationLaw::HasLastRestriction ******/
		/****** md5 signature: 75d1c6c76d3aa649b7050e00b48ebe2f ******/
		%feature("compactdefaultargs") HasLastRestriction;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Say if the last restriction is defined in this class. If it is true the last element of poles array in D0,D1,D2... Correspond to this restriction. Returns false (default implementation).
") HasLastRestriction;
		virtual bool HasLastRestriction();

		/****** GeomFill_LocationLaw::Intervals ******/
		/****** md5 signature: 3d6a840a7f0f4eea65b38aa9a495c6b6 ******/
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
		/****** md5 signature: 39e56cacf013c8b586c1ecee85d9aa9d ******/
		%feature("compactdefaultargs") IsRotation;
		%feature("autodoc", "
Parameters
----------

Return
-------
Error: double

Description
-----------
Say if the Location Law, is a rotation of Location The default implementation is ' returns False '.
") IsRotation;
		virtual bool IsRotation(Standard_Real &OutValue);

		/****** GeomFill_LocationLaw::IsTranslation ******/
		/****** md5 signature: 18386d1d62bd11f41e326bee744d6448 ******/
		%feature("compactdefaultargs") IsTranslation;
		%feature("autodoc", "
Parameters
----------

Return
-------
Error: double

Description
-----------
Say if the Location Law, is an translation of Location The default implementation is ' returns False '.
") IsTranslation;
		virtual bool IsTranslation(Standard_Real &OutValue);

		/****** GeomFill_LocationLaw::Nb2dCurves ******/
		/****** md5 signature: 0237117f334abd118e4ca3f29a6e8943 ******/
		%feature("compactdefaultargs") Nb2dCurves;
		%feature("autodoc", "Return
-------
int

Description
-----------
get the number of 2d curves (Restrictions + Traces) to approximate.
") Nb2dCurves;
		int Nb2dCurves();

		/****** GeomFill_LocationLaw::NbIntervals ******/
		/****** md5 signature: 9ac7bc3c23f26b850f256bf654af74c8 ******/
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
		virtual int NbIntervals(const GeomAbs_Shape S);

		/****** GeomFill_LocationLaw::Resolution ******/
		/****** md5 signature: c6fc35c8e86b98fabd3f783889c59162 ******/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "
Parameters
----------
Index: int
Tol: double

Return
-------
TolU: double
TolV: double

Description
-----------
Returns the resolutions in the sub-space 2d <Index> This information is useful to find a good tolerance in 2d approximation.
") Resolution;
		virtual void Resolution(const int Index, const double Tol, Standard_Real &OutValue, Standard_Real &OutValue);

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
		/****** md5 signature: e186371ac8d12da9ab79f78842205007 ******/
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
		virtual bool SetCurve(const opencascade::handle<Adaptor3d_Curve> & C);

		/****** GeomFill_LocationLaw::SetInterval ******/
		/****** md5 signature: e0781594541ee7a04601bba1b7835e6a ******/
		%feature("compactdefaultargs") SetInterval;
		%feature("autodoc", "
Parameters
----------
First: double
Last: double

Return
-------
None

Description
-----------
Sets the bounds of the parametric interval on the function This determines the derivatives in these values if the function is not Cn.
") SetInterval;
		virtual void SetInterval(const double First, const double Last);

		/****** GeomFill_LocationLaw::SetTolerance ******/
		/****** md5 signature: f7fa3f74e80cda7d265b48d62dba50ea ******/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "
Parameters
----------
Tol3d: double
Tol2d: double

Return
-------
None

Description
-----------
Is useful, if (me) have to run numerical algorithm to perform D0, D1 or D2 The default implementation make nothing.
") SetTolerance;
		virtual void SetTolerance(const double Tol3d, const double Tol2d);

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
		/****** md5 signature: 395fe2147b7c1826c8556b91a87df8e7 ******/
		%feature("compactdefaultargs") TraceNumber;
		%feature("autodoc", "Return
-------
int

Description
-----------
Give the number of trace (Curves 2d which are not restriction) Returns 0 (default implementation).
") TraceNumber;
		virtual int TraceNumber();

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
		/****** md5 signature: dce5f2520a928ba1a000bac46228e5b7 ******/
		%feature("compactdefaultargs") GeomFill_Pipe;
		%feature("autodoc", "
Parameters
----------
Path: Geom_Curve
Radius: double

Return
-------
None

Description
-----------
No available documentation.
") GeomFill_Pipe;
		 GeomFill_Pipe(const opencascade::handle<Geom_Curve> & Path, const double Radius);

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
		/****** md5 signature: 558c14cdc71d6de08b8119d778b543dd ******/
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
		/****** md5 signature: f4b41b0a44c316b3116a286c2ba9bc47 ******/
		%feature("compactdefaultargs") GeomFill_Pipe;
		%feature("autodoc", "
Parameters
----------
Path: Geom_Curve
Curve1: Geom_Curve
Curve2: Geom_Curve
Radius: double

Return
-------
None

Description
-----------
Create a pipe with a constant radius with 2 guide-line.
") GeomFill_Pipe;
		 GeomFill_Pipe(const opencascade::handle<Geom_Curve> & Path, const opencascade::handle<Geom_Curve> & Curve1, const opencascade::handle<Geom_Curve> & Curve2, const double Radius);

		/****** GeomFill_Pipe::GeomFill_Pipe ******/
		/****** md5 signature: 52e8a256e69efe74b75c388b167805a6 ******/
		%feature("compactdefaultargs") GeomFill_Pipe;
		%feature("autodoc", "
Parameters
----------
Path: Adaptor3d_Curve
Curve1: Adaptor3d_Curve
Curve2: Adaptor3d_Curve
Radius: double

Return
-------
None

Description
-----------
Create a pipe with a constant radius with 2 guide-line.
") GeomFill_Pipe;
		 GeomFill_Pipe(const opencascade::handle<Adaptor3d_Curve> & Path, const opencascade::handle<Adaptor3d_Curve> & Curve1, const opencascade::handle<Adaptor3d_Curve> & Curve2, const double Radius);

		/****** GeomFill_Pipe::GeomFill_Pipe ******/
		/****** md5 signature: 2d3a21acd3e56b752bd3fe08bfe746cb ******/
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
		 GeomFill_Pipe(const opencascade::handle<Geom_Curve> & Path, const opencascade::handle<Adaptor3d_Curve> & Guide, const opencascade::handle<Geom_Curve> & FirstSect, const bool ByACR, const bool rotat);

		/****** GeomFill_Pipe::ErrorOnSurf ******/
		/****** md5 signature: a88dfe5db8adfb1ce164c83c71ee0a78 ******/
		%feature("compactdefaultargs") ErrorOnSurf;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the approximation's error. if the Surface is plane, cylinder ... this error can be 0.
") ErrorOnSurf;
		double ErrorOnSurf();

		/****** GeomFill_Pipe::ExchangeUV ******/
		/****** md5 signature: f6e4c67c9080310dd6d7bc435a24701f ******/
		%feature("compactdefaultargs") ExchangeUV;
		%feature("autodoc", "Return
-------
bool

Description
-----------
The u parametric direction of the surface constructed by this algorithm usually corresponds to the evolution along the path and the v parametric direction corresponds to the evolution along the section(s). However, this rule is not respected when constructing certain specific Geom surfaces (typically cylindrical surfaces, surfaces of revolution, etc.) for which the parameterization is inversed. The ExchangeUV function checks for this, and returns true in all these specific cases. Warning: Do not use this function before the surface is built.
") ExchangeUV;
		bool ExchangeUV();

		/****** GeomFill_Pipe::GenerateParticularCase ******/
		/****** md5 signature: ac2191ced97cf53f983a96bd0f9fa7a5 ******/
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
Sets a flag to try to create as many planes, cylinder,... as possible. Default value is <false>.
") GenerateParticularCase;
		void GenerateParticularCase(const bool B);

		/****** GeomFill_Pipe::GenerateParticularCase ******/
		/****** md5 signature: e95cddaa5b90bb6eaba728c2058d768f ******/
		%feature("compactdefaultargs") GenerateParticularCase;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the flag.
") GenerateParticularCase;
		bool GenerateParticularCase();

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
		/****** md5 signature: 4b147820b3c2e683495cc908c161b80b ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
Path: Geom_Curve
Radius: double

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<Geom_Curve> & Path, const double Radius);

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
		/****** md5 signature: d6eab586590121b24af9f007aa7dccc8 ******/
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
		/****** md5 signature: e18a5d6ca4462e16c5aeafc2fcce0086 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
Path: Adaptor3d_Curve
Curve1: Adaptor3d_Curve
Curve2: Adaptor3d_Curve
Radius: double

Return
-------
None

Description
-----------
Create a pipe with a constant radius with 2 guide-line.
") Init;
		void Init(const opencascade::handle<Adaptor3d_Curve> & Path, const opencascade::handle<Adaptor3d_Curve> & Curve1, const opencascade::handle<Adaptor3d_Curve> & Curve2, const double Radius);

		/****** GeomFill_Pipe::Init ******/
		/****** md5 signature: 4803b54acf0fed3bc49a51ffc28cd1c8 ******/
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
		void Init(const opencascade::handle<Geom_Curve> & Path, const opencascade::handle<Adaptor3d_Curve> & Guide, const opencascade::handle<Geom_Curve> & FirstSect, const bool ByACR, const bool rotat);

		/****** GeomFill_Pipe::IsDone ******/
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns whether approximation was done.
") IsDone;
		bool IsDone();

		/****** GeomFill_Pipe::Perform ******/
		/****** md5 signature: e126df3bd6ec55a9f5d8ff89ede9325b ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
WithParameters: bool (optional, default to false)
myPolynomial: bool (optional, default to false)

Return
-------
None

Description
-----------
Builds the pipe defined at the time of initialization of this algorithm. A description of the resulting surface is given under Constructors. If WithParameters (defaulted to false) is set to true, the approximation algorithm (used only in the general case of construction of a BSpline surface) builds the surface with a u parameter corresponding to the one of the path. Exceptions Standard_ConstructionError if a surface cannot be constructed from the data. Warning: It is the old Perform method, the next methode is recommended.
") Perform;
		void Perform(const bool WithParameters = false, const bool myPolynomial = false);

		/****** GeomFill_Pipe::Perform ******/
		/****** md5 signature: c3a106cb3728e232605e01303b119376 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Tol: double
Polynomial: bool
Conti: GeomAbs_Shape (optional, default to GeomAbs_C1)
MaxDegree: int (optional, default to 11)
NbMaxSegment: int (optional, default to 30)

Return
-------
None

Description
-----------
Detects the particular cases, and computes the surface. if none particular case is detected we make an approximation with respect of the Tolerance <Tol>, the continuty <Conti>, the maximum degree <MaxDegree>, the maximum number of span <NbMaxSegment> and the spine parametrization. If we can't create a surface with the data.
") Perform;
		void Perform(const double Tol, const bool Polynomial, const GeomAbs_Shape Conti = GeomAbs_C1, const int MaxDegree = 11, const int NbMaxSegment = 30);

		/****** GeomFill_Pipe::Surface ******/
		/****** md5 signature: a469e18cbceeb351572a461f96ff0f4d ******/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Surface>

Description
-----------
Returns the surface built by this algorithm. Warning: Do not use this function before the surface is built (in this case the function will return a null handle).
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
		/****** md5 signature: 34be6157e27235d22478080a37f0fe72 ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
X: double

Return
-------
F: double
D1: double
D2: double

Description
-----------
No available documentation.
") D2;
		void D2(const double X, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** GeomFill_PlanFunc::D2E ******/
		/****** md5 signature: df3319081a2be5280d4f334096d1b657 ******/
		%feature("compactdefaultargs") D2E;
		%feature("autodoc", "
Parameters
----------
X: double
DP: gp_Vec
D2P: gp_Vec
DV: gp_Vec
D2V: gp_Vec

Return
-------
DFDT: double
D2FDT2: double
D2FDTDX: double

Description
-----------
No available documentation.
") D2E;
		void D2E(const double X, const gp_Vec & DP, const gp_Vec & D2P, const gp_Vec & DV, const gp_Vec & D2V, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** GeomFill_PlanFunc::DEDT ******/
		/****** md5 signature: 2bacf12ae233e354d18a0075a6c4b756 ******/
		%feature("compactdefaultargs") DEDT;
		%feature("autodoc", "
Parameters
----------
X: double
DP: gp_Vec
DV: gp_Vec

Return
-------
DF: double

Description
-----------
No available documentation.
") DEDT;
		void DEDT(const double X, const gp_Vec & DP, const gp_Vec & DV, Standard_Real &OutValue);

		/****** GeomFill_PlanFunc::Derivative ******/
		/****** md5 signature: 5b661e723f14c67a734d7bc68bb6cabf ******/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "
Parameters
----------
X: double

Return
-------
D: double

Description
-----------
computes the derivative <D> of the function for the variable <X>. Returns True if the calculation were successfully done, False otherwise.
") Derivative;
		bool Derivative(const double X, Standard_Real &OutValue);

		/****** GeomFill_PlanFunc::Value ******/
		/****** md5 signature: 2fdd0f48acb4882f76bbbe432a18ac3a ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
X: double

Return
-------
F: double

Description
-----------
computes the value <F>of the function for the variable <X>. Returns True if the calculation were successfully done, False otherwise.
") Value;
		bool Value(const double X, Standard_Real &OutValue);

		/****** GeomFill_PlanFunc::Values ******/
		/****** md5 signature: 44ea1ebbd1c996779e93f28435817e28 ******/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "
Parameters
----------
X: double

Return
-------
F: double
D: double

Description
-----------
computes the value <F> and the derivative <D> of the function for the variable <X>. Returns True if the calculation were successfully done, False otherwise.
") Values;
		bool Values(const double X, Standard_Real &OutValue, Standard_Real &OutValue);

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
		/****** md5 signature: 8eb027bd53c927a5338f6669eda5838e ******/
		%feature("compactdefaultargs") Initialized;
		%feature("autodoc", "Return
-------
bool

Description
-----------
say if <self> is Initialized.
") Initialized;
		bool Initialized();

		/****** GeomFill_PolynomialConvertor::Section ******/
		/****** md5 signature: 1be96bb31bd3cde50a0ef94f7e3099fb ******/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "
Parameters
----------
FirstPnt: gp_Pnt
Center: gp_Pnt
Dir: gp_Vec
Angle: double
Poles: TColgp_Array1OfPnt

Return
-------
None

Description
-----------
No available documentation.
") Section;
		void Section(const gp_Pnt & FirstPnt, const gp_Pnt & Center, const gp_Vec & Dir, const double Angle, TColgp_Array1OfPnt & Poles);

		/****** GeomFill_PolynomialConvertor::Section ******/
		/****** md5 signature: fed091a03a3e61a939c9b31fd91f9738 ******/
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
Angle: double
DAngle: double
Poles: TColgp_Array1OfPnt
DPoles: TColgp_Array1OfVec

Return
-------
None

Description
-----------
No available documentation.
") Section;
		void Section(const gp_Pnt & FirstPnt, const gp_Vec & DFirstPnt, const gp_Pnt & Center, const gp_Vec & DCenter, const gp_Vec & Dir, const gp_Vec & DDir, const double Angle, const double DAngle, TColgp_Array1OfPnt & Poles, TColgp_Array1OfVec & DPoles);

		/****** GeomFill_PolynomialConvertor::Section ******/
		/****** md5 signature: df44660c0a2c95c3271bf2cc160f6efd ******/
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
Angle: double
DAngle: double
D2Angle: double
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
		void Section(const gp_Pnt & FirstPnt, const gp_Vec & DFirstPnt, const gp_Vec & D2FirstPnt, const gp_Pnt & Center, const gp_Vec & DCenter, const gp_Vec & D2Center, const gp_Vec & Dir, const gp_Vec & DDir, const gp_Vec & D2Dir, const double Angle, const double DAngle, const double D2Angle, TColgp_Array1OfPnt & Poles, TColgp_Array1OfVec & DPoles, TColgp_Array1OfVec & D2Poles);

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
		/****** md5 signature: 6d83563eeb4bf79cae5cbefd5efe5875 ******/
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
		const opencascade::handle<Geom_Curve> & Curve(const int Index);

		/****** GeomFill_Profiler::Degree ******/
		/****** md5 signature: 41ab768385e3189d3d3bc517c9606dbb ******/
		%feature("compactdefaultargs") Degree;
		%feature("autodoc", "Return
-------
int

Description
-----------
Raises if not yet perform.
") Degree;
		int Degree();

		/****** GeomFill_Profiler::IsPeriodic ******/
		/****** md5 signature: d36764d6f9b1283d23b2bfdabe28da79 ******/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsPeriodic;
		bool IsPeriodic();

		/****** GeomFill_Profiler::KnotsAndMults ******/
		/****** md5 signature: 607f176df3bcad02a6fca6598f06b942 ******/
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
		/****** md5 signature: 1d7f6bb61170b57fc8534832d22fab99 ******/
		%feature("compactdefaultargs") NbKnots;
		%feature("autodoc", "Return
-------
int

Description
-----------
Raises if not yet perform.
") NbKnots;
		int NbKnots();

		/****** GeomFill_Profiler::NbPoles ******/
		/****** md5 signature: ec44b31f908a8be9d45ab84543b6e8d5 ******/
		%feature("compactdefaultargs") NbPoles;
		%feature("autodoc", "Return
-------
int

Description
-----------
Raises if not yet perform.
") NbPoles;
		int NbPoles();

		/****** GeomFill_Profiler::Perform ******/
		/****** md5 signature: 153b2c254f8966bca1d7cb2a7450985a ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
PTol: double

Return
-------
None

Description
-----------
Converts all curves to BSplineCurves. Set them to the common profile. <PTol> is used to compare 2 knots.
") Perform;
		virtual void Perform(const double PTol);

		/****** GeomFill_Profiler::Poles ******/
		/****** md5 signature: f06598cc5f9f4cfcb1682da8d6816e59 ******/
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
		void Poles(const int Index, TColgp_Array1OfPnt & Poles);

		/****** GeomFill_Profiler::Weights ******/
		/****** md5 signature: 54d36bd3370076761924d4b2eee33867 ******/
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
		void Weights(const int Index, TColStd_Array1OfReal & Weights);

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
		/****** md5 signature: 8eb027bd53c927a5338f6669eda5838e ******/
		%feature("compactdefaultargs") Initialized;
		%feature("autodoc", "Return
-------
bool

Description
-----------
say if <self> is Initialized.
") Initialized;
		bool Initialized();

		/****** GeomFill_QuasiAngularConvertor::Section ******/
		/****** md5 signature: 55c0304c52e29bbd0c55f7eb5780f55a ******/
		%feature("compactdefaultargs") Section;
		%feature("autodoc", "
Parameters
----------
FirstPnt: gp_Pnt
Center: gp_Pnt
Dir: gp_Vec
Angle: double
Poles: TColgp_Array1OfPnt
Weights: TColStd_Array1OfReal

Return
-------
None

Description
-----------
No available documentation.
") Section;
		void Section(const gp_Pnt & FirstPnt, const gp_Pnt & Center, const gp_Vec & Dir, const double Angle, TColgp_Array1OfPnt & Poles, TColStd_Array1OfReal & Weights);

		/****** GeomFill_QuasiAngularConvertor::Section ******/
		/****** md5 signature: d05c785e2e3d8a5bc0affa6ef98c65bc ******/
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
Angle: double
DAngle: double
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
		void Section(const gp_Pnt & FirstPnt, const gp_Vec & DFirstPnt, const gp_Pnt & Center, const gp_Vec & DCenter, const gp_Vec & Dir, const gp_Vec & DDir, const double Angle, const double DAngle, TColgp_Array1OfPnt & Poles, TColgp_Array1OfVec & DPoles, TColStd_Array1OfReal & Weights, TColStd_Array1OfReal & DWeights);

		/****** GeomFill_QuasiAngularConvertor::Section ******/
		/****** md5 signature: 27e9c58daa4857d1aabac3833904703a ******/
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
Angle: double
DAngle: double
D2Angle: double
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
		void Section(const gp_Pnt & FirstPnt, const gp_Vec & DFirstPnt, const gp_Vec & D2FirstPnt, const gp_Pnt & Center, const gp_Vec & DCenter, const gp_Vec & D2Center, const gp_Vec & Dir, const gp_Vec & DDir, const gp_Vec & D2Dir, const double Angle, const double DAngle, const double D2Angle, TColgp_Array1OfPnt & Poles, TColgp_Array1OfVec & DPoles, TColgp_Array1OfVec & D2Poles, TColStd_Array1OfReal & Weights, TColStd_Array1OfReal & DWeights, TColStd_Array1OfReal & D2Weights);

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
give if possible an bspline Surface, like iso-v are the section. If it is not possible this method have to get an Null Surface. It is the default implementation.
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
Get the barycentre of Surface. A very poor estimation is sufficient. This information is useful to perform well conditioned rational approximation. Warning: Used only if <self> IsRational.
") BarycentreOfSurf;
		virtual gp_Pnt BarycentreOfSurf();

		/****** GeomFill_SectionLaw::CirclSection ******/
		/****** md5 signature: b4ca9dc839f45b20ef1b6cdc7676d6d9 ******/
		%feature("compactdefaultargs") CirclSection;
		%feature("autodoc", "
Parameters
----------
Param: double

Return
-------
opencascade::handle<Geom_Curve>

Description
-----------
Return the circle section at parameter <Param>, if <self> a IsConicalLaw.
") CirclSection;
		virtual opencascade::handle<Geom_Curve> CirclSection(const double Param);

		/****** GeomFill_SectionLaw::ConstantSection ******/
		/****** md5 signature: 295eba02ad0b95a48fd7857d1d41877a ******/
		%feature("compactdefaultargs") ConstantSection;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Curve>

Description
-----------
Return a copy of the constant Section, if <self> IsConstant.
") ConstantSection;
		virtual opencascade::handle<Geom_Curve> ConstantSection();

		/****** GeomFill_SectionLaw::D0 ******/
		/****** md5 signature: f6ae013f5cf07fb5c9cfd8629df37bab ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
Param: double
Poles: TColgp_Array1OfPnt
Weigths: TColStd_Array1OfReal

Return
-------
bool

Description
-----------
compute the section for v = param.
") D0;
		virtual bool D0(const double Param, TColgp_Array1OfPnt & Poles, TColStd_Array1OfReal & Weigths);

		/****** GeomFill_SectionLaw::D1 ******/
		/****** md5 signature: fc4af643338984221d243afa74838c0a ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
Param: double
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
		virtual bool D1(const double Param, TColgp_Array1OfPnt & Poles, TColgp_Array1OfVec & DPoles, TColStd_Array1OfReal & Weigths, TColStd_Array1OfReal & DWeigths);

		/****** GeomFill_SectionLaw::D2 ******/
		/****** md5 signature: 843cfb40d8b4253c3f94c61cebbebf16 ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
Param: double
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
		virtual bool D2(const double Param, TColgp_Array1OfPnt & Poles, TColgp_Array1OfVec & DPoles, TColgp_Array1OfVec & D2Poles, TColStd_Array1OfReal & Weigths, TColStd_Array1OfReal & DWeigths, TColStd_Array1OfReal & D2Weigths);

		/****** GeomFill_SectionLaw::GetDomain ******/
		/****** md5 signature: b591590d3bc2b0e7570065100d4075f9 ******/
		%feature("compactdefaultargs") GetDomain;
		%feature("autodoc", "
Parameters
----------

Return
-------
First: double
Last: double

Description
-----------
Gets the bounds of the function parametric domain. Warning: This domain it is not modified by the SetValue method.
") GetDomain;
		virtual void GetDomain(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** GeomFill_SectionLaw::GetInterval ******/
		/****** md5 signature: 3e654d77c65f4a1842af3a4549e9615b ******/
		%feature("compactdefaultargs") GetInterval;
		%feature("autodoc", "
Parameters
----------

Return
-------
First: double
Last: double

Description
-----------
Gets the bounds of the parametric interval on the function.
") GetInterval;
		virtual void GetInterval(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** GeomFill_SectionLaw::GetMinimalWeight ******/
		/****** md5 signature: 5fafe98ac27c4733d46e0d69feb7782c ******/
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
		/****** md5 signature: 445238f8780bb5bcf2c4e87841c8b27e ******/
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "
Parameters
----------
BoundTol: double
SurfTol: double
AngleTol: double
Tol3d: TColStd_Array1OfReal

Return
-------
None

Description
-----------
Returns the tolerances associated at each poles to reach in approximation, to satisfy: BoundTol error at the Boundary AngleTol tangent error at the Boundary (in radian) SurfTol error inside the surface.
") GetTolerance;
		virtual void GetTolerance(const double BoundTol, const double SurfTol, const double AngleTol, TColStd_Array1OfReal & Tol3d);

		/****** GeomFill_SectionLaw::Intervals ******/
		/****** md5 signature: 3d6a840a7f0f4eea65b38aa9a495c6b6 ******/
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
		/****** md5 signature: 60010f14fa397f62c83071350544b67d ******/
		%feature("compactdefaultargs") IsConicalLaw;
		%feature("autodoc", "
Parameters
----------

Return
-------
Error: double

Description
-----------
Returns True if all section are circle, with same plane,same center and linear radius evolution Return False by Default.
") IsConicalLaw;
		virtual bool IsConicalLaw(Standard_Real &OutValue);

		/****** GeomFill_SectionLaw::IsConstant ******/
		/****** md5 signature: 9b90441bbd5027d8675a458b04f036d1 ******/
		%feature("compactdefaultargs") IsConstant;
		%feature("autodoc", "
Parameters
----------

Return
-------
Error: double

Description
-----------
Say if all sections are equals.
") IsConstant;
		virtual bool IsConstant(Standard_Real &OutValue);

		/****** GeomFill_SectionLaw::IsRational ******/
		/****** md5 signature: de83bb68c1e76368c633eba18c70426f ******/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns if the sections are rational or not.
") IsRational;
		virtual bool IsRational();

		/****** GeomFill_SectionLaw::IsUPeriodic ******/
		/****** md5 signature: 8f478e78b79e79aa422f926fb9ede7dc ******/
		%feature("compactdefaultargs") IsUPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns if the sections are periodic or not.
") IsUPeriodic;
		virtual bool IsUPeriodic();

		/****** GeomFill_SectionLaw::IsVPeriodic ******/
		/****** md5 signature: 381c929257ac1c9e590592b4c34af90f ******/
		%feature("compactdefaultargs") IsVPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns if law is periodic or not.
") IsVPeriodic;
		virtual bool IsVPeriodic();

		/****** GeomFill_SectionLaw::Knots ******/
		/****** md5 signature: cfde313360c61a2796f89f68da12c4bf ******/
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
		/****** md5 signature: 622251938ac59f2f80ec141e01dd43c7 ******/
		%feature("compactdefaultargs") MaximalSection;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the length of the greater section. This information is useful to G1's control. Warning: With an little value, approximation can be slower.
") MaximalSection;
		virtual double MaximalSection();

		/****** GeomFill_SectionLaw::Mults ******/
		/****** md5 signature: 1a3ca416f34aaec2bdd0fc29e01dbcf7 ******/
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
		/****** md5 signature: 9ac7bc3c23f26b850f256bf654af74c8 ******/
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
		virtual int NbIntervals(const GeomAbs_Shape S);

		/****** GeomFill_SectionLaw::SectionShape ******/
		/****** md5 signature: 29608ae8e60b3ee57b1d164e74a17e92 ******/
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
		/****** md5 signature: e0781594541ee7a04601bba1b7835e6a ******/
		%feature("compactdefaultargs") SetInterval;
		%feature("autodoc", "
Parameters
----------
First: double
Last: double

Return
-------
None

Description
-----------
Sets the bounds of the parametric interval on the function This determines the derivatives in these values if the function is not Cn.
") SetInterval;
		virtual void SetInterval(const double First, const double Last);

		/****** GeomFill_SectionLaw::SetTolerance ******/
		/****** md5 signature: f7fa3f74e80cda7d265b48d62dba50ea ******/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "
Parameters
----------
Tol3d: double
Tol2d: double

Return
-------
None

Description
-----------
Is useful, if <self> has to run numerical algorithm to perform D0, D1 or D2 The default implementation make nothing.
") SetTolerance;
		virtual void SetTolerance(const double Tol3d, const double Tol2d);

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
		/****** md5 signature: 2b9c11d59a1231fe171f8d4c440fc397 ******/
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") Angle;
		double Angle();

		/****** GeomFill_SectionPlacement::Distance ******/
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

		/****** GeomFill_SectionPlacement::IsDone ******/
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsDone;
		bool IsDone();

		/****** GeomFill_SectionPlacement::ModifiedSection ******/
		/****** md5 signature: 69844efa31461dfa33cccae64833bf40 ******/
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
		opencascade::handle<Geom_Curve> ModifiedSection(const bool WithTranslation);

		/****** GeomFill_SectionPlacement::ParameterOnPath ******/
		/****** md5 signature: 50c600a676492cbbca93e237c189656e ******/
		%feature("compactdefaultargs") ParameterOnPath;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") ParameterOnPath;
		double ParameterOnPath();

		/****** GeomFill_SectionPlacement::ParameterOnSection ******/
		/****** md5 signature: 285453d9e86a8b7c3d3e8db1170966f1 ******/
		%feature("compactdefaultargs") ParameterOnSection;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") ParameterOnSection;
		double ParameterOnSection();

		/****** GeomFill_SectionPlacement::Perform ******/
		/****** md5 signature: 82072ef8b10cca17743be2e433b2f8f5 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Tol: double

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const double Tol);

		/****** GeomFill_SectionPlacement::Perform ******/
		/****** md5 signature: c20b073117a8a58beca6aae3e7926eee ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Path: Adaptor3d_Curve
Tol: double

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const opencascade::handle<Adaptor3d_Curve> & Path, const double Tol);

		/****** GeomFill_SectionPlacement::Perform ******/
		/****** md5 signature: eb88fe312043d4edbfe9a0a058474680 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
ParamOnPath: double
Tol: double

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const double ParamOnPath, const double Tol);

		/****** GeomFill_SectionPlacement::Section ******/
		/****** md5 signature: 8c2f49b0faa7dfbd5ec70bb0838b6aaa ******/
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
		opencascade::handle<Geom_Curve> Section(const bool WithTranslation);

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
		/****** md5 signature: 8269f3d98602174aeeb92ade6e53a4d4 ******/
		%feature("compactdefaultargs") Transformation;
		%feature("autodoc", "
Parameters
----------
WithTranslation: bool
WithCorrection: bool (optional, default to false)

Return
-------
gp_Trsf

Description
-----------
No available documentation.
") Transformation;
		gp_Trsf Transformation(const bool WithTranslation, const bool WithCorrection = false);

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

		/****** GeomFill_SnglrFunc::EvalD0 ******/
		/****** md5 signature: 534d5bf2fd8e92a6dcc7c1d53e829bc3 ******/
		%feature("compactdefaultargs") EvalD0;
		%feature("autodoc", "
Parameters
----------
theU: double

Return
-------
gp_Pnt

Description
-----------
Computes the point of parameter theU on the curve.
") EvalD0;
		gp_Pnt EvalD0(const double theU);

		/****** GeomFill_SnglrFunc::EvalD1 ******/
		/****** md5 signature: 7afa7a9bd3f5047a6ef303b4732e48db ******/
		%feature("compactdefaultargs") EvalD1;
		%feature("autodoc", "
Parameters
----------
theU: double

Return
-------
Geom_Curve::ResD1

Description
-----------
Computes the point of parameter theU on the curve with its first derivative. Raised if the continuity of the current interval is not C1.
") EvalD1;
		Geom_Curve::ResD1 EvalD1(const double theU);

		/****** GeomFill_SnglrFunc::EvalD2 ******/
		/****** md5 signature: bdf34f9b5fb078dabb16e072337b36b5 ******/
		%feature("compactdefaultargs") EvalD2;
		%feature("autodoc", "
Parameters
----------
theU: double

Return
-------
Geom_Curve::ResD2

Description
-----------
Returns the point and the first and second derivatives at parameter theU. Raised if the continuity of the current interval is not C2.
") EvalD2;
		Geom_Curve::ResD2 EvalD2(const double theU);

		/****** GeomFill_SnglrFunc::EvalD3 ******/
		/****** md5 signature: a6e2ea19f102d61c7a916bef9a895bcb ******/
		%feature("compactdefaultargs") EvalD3;
		%feature("autodoc", "
Parameters
----------
theU: double

Return
-------
Geom_Curve::ResD3

Description
-----------
Returns the point and the first, second and third derivatives at parameter theU. Raised if the continuity of the current interval is not C3.
") EvalD3;
		Geom_Curve::ResD3 EvalD3(const double theU);

		/****** GeomFill_SnglrFunc::EvalDN ******/
		/****** md5 signature: 77005f048bbfcdbbddaf4af5a7b6cef4 ******/
		%feature("compactdefaultargs") EvalDN;
		%feature("autodoc", "
Parameters
----------
theU: double
theN: int

Return
-------
gp_Vec

Description
-----------
Returns the derivative of order theN at parameter theU. Raised if theN < 1.
") EvalDN;
		gp_Vec EvalDN(const double theU, const int theN);

		/****** GeomFill_SnglrFunc::FirstParameter ******/
		/****** md5 signature: a030fd3ced91f50691075634ae7b49fb ******/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") FirstParameter;
		double FirstParameter();

		/****** GeomFill_SnglrFunc::GetType ******/
		/****** md5 signature: 5a645f79981f2ae05742e39e35676600 ******/
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
		/****** md5 signature: c706a9ee65ae76457235d7e55942295b ******/
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
		/****** md5 signature: c33341d130b25859848a016acbcaf4dd ******/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsPeriodic;
		bool IsPeriodic();

		/****** GeomFill_SnglrFunc::LastParameter ******/
		/****** md5 signature: dd6d522a80d5537086a8d1fbe2265300 ******/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") LastParameter;
		double LastParameter();

		/****** GeomFill_SnglrFunc::NbIntervals ******/
		/****** md5 signature: b2aaad8a5aa5a35490639df04a76a09e ******/
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
		int NbIntervals(const GeomAbs_Shape S);

		/****** GeomFill_SnglrFunc::Period ******/
		/****** md5 signature: 1f089b3595450d6c97092473e379f329 ******/
		%feature("compactdefaultargs") Period;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") Period;
		double Period();

		/****** GeomFill_SnglrFunc::Resolution ******/
		/****** md5 signature: 7cb383c1a004c01dc3f51b7088c4d899 ******/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "
Parameters
----------
R3d: double

Return
-------
double

Description
-----------
Returns the parametric resolution corresponding to the real space resolution <R3d>.
") Resolution;
		double Resolution(const double R3d);

		/****** GeomFill_SnglrFunc::SetRatio ******/
		/****** md5 signature: ba3285104c1357c7a9122c777c7bc560 ******/
		%feature("compactdefaultargs") SetRatio;
		%feature("autodoc", "
Parameters
----------
Ratio: double

Return
-------
None

Description
-----------
No available documentation.
") SetRatio;
		void SetRatio(const double Ratio);

		/****** GeomFill_SnglrFunc::ShallowCopy ******/
		/****** md5 signature: 20e70b6ba2d95db55811b68454eb9003 ******/
		%feature("compactdefaultargs") ShallowCopy;
		%feature("autodoc", "Return
-------
opencascade::handle<Adaptor3d_Curve>

Description
-----------
Shallow copy of adaptor.
") ShallowCopy;
		opencascade::handle<Adaptor3d_Curve> ShallowCopy();

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
		/****** md5 signature: 7da77de3d708bf88154ec81b58363de0 ******/
		%feature("compactdefaultargs") GeomFill_Sweep;
		%feature("autodoc", "
Parameters
----------
Location: GeomFill_LocationLaw
WithKpart: bool (optional, default to true)

Return
-------
None

Description
-----------
No available documentation.
") GeomFill_Sweep;
		 GeomFill_Sweep(const opencascade::handle<GeomFill_LocationLaw> & Location, const bool WithKpart = true);

		/****** GeomFill_Sweep::Build ******/
		/****** md5 signature: 2e6ed9133323a0dfad52e42430391ed0 ******/
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
		void Build(const opencascade::handle<GeomFill_SectionLaw> & Section, const GeomFill_ApproxStyle Methode = GeomFill_Location, const GeomAbs_Shape Continuity = GeomAbs_C2, const int Degmax = 10, const int Segmax = 30);

		/****** GeomFill_Sweep::ErrorOnRestriction ******/
		/****** md5 signature: 650af1671fbbb561de1e42361358eb22 ******/
		%feature("compactdefaultargs") ErrorOnRestriction;
		%feature("autodoc", "
Parameters
----------
IsFirst: bool

Return
-------
UError: double
VError: double

Description
-----------
Gets the Approximation error.
") ErrorOnRestriction;
		void ErrorOnRestriction(const bool IsFirst, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** GeomFill_Sweep::ErrorOnSurface ******/
		/****** md5 signature: 0ab673c2dfbd4ce8e0d165ef9c450b15 ******/
		%feature("compactdefaultargs") ErrorOnSurface;
		%feature("autodoc", "Return
-------
double

Description
-----------
Gets the Approximation error.
") ErrorOnSurface;
		double ErrorOnSurface();

		/****** GeomFill_Sweep::ErrorOnTrace ******/
		/****** md5 signature: 3ee8d341c63b3c5621c0891c3e4c7fec ******/
		%feature("compactdefaultargs") ErrorOnTrace;
		%feature("autodoc", "
Parameters
----------
IndexOfTrace: int

Return
-------
UError: double
VError: double

Description
-----------
Gets the Approximation error.
") ErrorOnTrace;
		void ErrorOnTrace(const int IndexOfTrace, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** GeomFill_Sweep::ExchangeUV ******/
		/****** md5 signature: f6e4c67c9080310dd6d7bc435a24701f ******/
		%feature("compactdefaultargs") ExchangeUV;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns true if sections are U-Iso This can be produce in some cases when <WithKpart> is True.
") ExchangeUV;
		bool ExchangeUV();

		/****** GeomFill_Sweep::IsDone ******/
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Tells if the Surface is Built.
") IsDone;
		bool IsDone();

		/****** GeomFill_Sweep::NumberOfTrace ******/
		/****** md5 signature: 822d67d187c3beb5d6158a440a88c01c ******/
		%feature("compactdefaultargs") NumberOfTrace;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NumberOfTrace;
		int NumberOfTrace();

		/****** GeomFill_Sweep::Restriction ******/
		/****** md5 signature: d18776357daf597e0ee6a8c62aea8774 ******/
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
		opencascade::handle<Geom2d_Curve> Restriction(const bool IsFirst);

		/****** GeomFill_Sweep::SetDomain ******/
		/****** md5 signature: 496021dfc3c5ab5590118b4692f7d8e5 ******/
		%feature("compactdefaultargs") SetDomain;
		%feature("autodoc", "
Parameters
----------
First: double
Last: double
SectionFirst: double
SectionLast: double

Return
-------
None

Description
-----------
Set parametric information [<First>, <Last>] Sets the parametric bound of the sweeping surface to build. <SectionFirst>, <SectionLast> gives corresponding bounds parameter on the section law of <First> and <Last> //! V-Iso on Sweeping Surface S(u,v) is defined by Location(v) and Section(w) where w = SectionFirst + (v - First) / (Last-First) * (SectionLast - SectionFirst) //! By default w = v, and First and Last are given by First and Last parameter stored in LocationLaw.
") SetDomain;
		void SetDomain(const double First, const double Last, const double SectionFirst, const double SectionLast);

		/****** GeomFill_Sweep::SetForceApproxC1 ******/
		/****** md5 signature: bb5360547d7f38f9dcab06086e0e5e80 ******/
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
		void SetForceApproxC1(const bool ForceApproxC1);

		/****** GeomFill_Sweep::SetTolerance ******/
		/****** md5 signature: c6c9db717a41e425b1f02d55939a22ec ******/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "
Parameters
----------
Tol3d: double
BoundTol: double (optional, default to 1.0)
Tol2d: double (optional, default to 1.0e-5)
TolAngular: double (optional, default to 1.0)

Return
-------
None

Description
-----------
Set Approximation Tolerance Tol3d: Tolerance to surface approximation Tol2d: Tolerance used to perform curve approximation Normally the 2d curve are approximated with a tolerance given by the resolution method define in <LocationLaw> but if this tolerance is too large Tol2d is used. TolAngular: Tolerance (in radian) to control the angle between tangents on the section law and tangent of iso-v on approximated surface.
") SetTolerance;
		void SetTolerance(const double Tol3d, const double BoundTol = 1.0, const double Tol2d = 1.0e-5, const double TolAngular = 1.0);

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
		/****** md5 signature: f547eb3fc9ee583f7c6bdeb733bd8e19 ******/
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
		opencascade::handle<Geom2d_Curve> Trace(const int IndexOfTrace);

		/****** GeomFill_Sweep::UReversed ******/
		/****** md5 signature: 7e28ea9b6572b43bb87389f19f4ba9db ******/
		%feature("compactdefaultargs") UReversed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns true if Parametrisation sens in U is inverse of parametrisation sens of section (or of path if ExchangeUV).
") UReversed;
		bool UReversed();

		/****** GeomFill_Sweep::VReversed ******/
		/****** md5 signature: 320d54d7501ed2eed25dd699299af25e ******/
		%feature("compactdefaultargs") VReversed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns true if Parametrisation sens in V is inverse of parametrisation sens of path (or of section if ExchangeUV).
") VReversed;
		bool VReversed();

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
		/****** md5 signature: 1c37d9ed11f79839955dedf294b7de2f ******/
		%feature("compactdefaultargs") GeomFill_SweepFunction;
		%feature("autodoc", "
Parameters
----------
Section: GeomFill_SectionLaw
Location: GeomFill_LocationLaw
FirstParameter: double
FirstParameterOnS: double
RatioParameterOnS: double

Return
-------
None

Description
-----------
No available documentation.
") GeomFill_SweepFunction;
		 GeomFill_SweepFunction(const opencascade::handle<GeomFill_SectionLaw> & Section, const opencascade::handle<GeomFill_LocationLaw> & Location, const double FirstParameter, const double FirstParameterOnS, const double RatioParameterOnS);

		/****** GeomFill_SweepFunction::BarycentreOfSurf ******/
		/****** md5 signature: 1f25b0eb1d890895eb1250cc0c28882b ******/
		%feature("compactdefaultargs") BarycentreOfSurf;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Get the barycentre of Surface. An very poor estimation is sufficient. This information is useful to perform well conditioned rational approximation. Warning: Used only if <self> IsRational.
") BarycentreOfSurf;
		gp_Pnt BarycentreOfSurf();

		/****** GeomFill_SweepFunction::D0 ******/
		/****** md5 signature: d64f5fa0ee4cfd988fe34ce17e01e38b ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
Param: double
First: double
Last: double
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
		bool D0(const double Param, const double First, const double Last, TColgp_Array1OfPnt & Poles, TColgp_Array1OfPnt2d & Poles2d, TColStd_Array1OfReal & Weigths);

		/****** GeomFill_SweepFunction::D1 ******/
		/****** md5 signature: f122a00989a158b63aadd60916d6c393 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
Param: double
First: double
Last: double
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
		bool D1(const double Param, const double First, const double Last, TColgp_Array1OfPnt & Poles, TColgp_Array1OfVec & DPoles, TColgp_Array1OfPnt2d & Poles2d, TColgp_Array1OfVec2d & DPoles2d, TColStd_Array1OfReal & Weigths, TColStd_Array1OfReal & DWeigths);

		/****** GeomFill_SweepFunction::D2 ******/
		/****** md5 signature: 7a1a70dd7a73b71015b51dcc133cc9d9 ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
Param: double
First: double
Last: double
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
		bool D2(const double Param, const double First, const double Last, TColgp_Array1OfPnt & Poles, TColgp_Array1OfVec & DPoles, TColgp_Array1OfVec & D2Poles, TColgp_Array1OfPnt2d & Poles2d, TColgp_Array1OfVec2d & DPoles2d, TColgp_Array1OfVec2d & D2Poles2d, TColStd_Array1OfReal & Weigths, TColStd_Array1OfReal & DWeigths, TColStd_Array1OfReal & D2Weigths);

		/****** GeomFill_SweepFunction::GetMinimalWeight ******/
		/****** md5 signature: 6484606f629c915e24cdd616ac007d67 ******/
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
		void GetMinimalWeight(TColStd_Array1OfReal & Weigths);

		/****** GeomFill_SweepFunction::GetTolerance ******/
		/****** md5 signature: 217050fdab79b8e071e91271c92a3488 ******/
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "
Parameters
----------
BoundTol: double
SurfTol: double
AngleTol: double
Tol3d: TColStd_Array1OfReal

Return
-------
None

Description
-----------
Returns the tolerance to reach in approximation to respect BoundTol error at the Boundary AngleTol tangent error at the Boundary (in radian) SurfTol error inside the surface.
") GetTolerance;
		void GetTolerance(const double BoundTol, const double SurfTol, const double AngleTol, TColStd_Array1OfReal & Tol3d);

		/****** GeomFill_SweepFunction::Intervals ******/
		/****** md5 signature: c706a9ee65ae76457235d7e55942295b ******/
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

		/****** GeomFill_SweepFunction::IsRational ******/
		/****** md5 signature: 43e7b94be36c1d44222e606d2d075195 ******/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns if the section is rational or not.
") IsRational;
		bool IsRational();

		/****** GeomFill_SweepFunction::Knots ******/
		/****** md5 signature: 359ac10e91186ab2f75e6163036a99fe ******/
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
		void Knots(TColStd_Array1OfReal & TKnots);

		/****** GeomFill_SweepFunction::MaximalSection ******/
		/****** md5 signature: 1811db5e3dd550ab78611f3959bb8ecf ******/
		%feature("compactdefaultargs") MaximalSection;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the length of the maximum section. This information is useful to perform well conditioned rational approximation.
") MaximalSection;
		double MaximalSection();

		/****** GeomFill_SweepFunction::Mults ******/
		/****** md5 signature: 2c8f8c7780e1bd71859fc4a6b9500baf ******/
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
		void Mults(TColStd_Array1OfInteger & TMults);

		/****** GeomFill_SweepFunction::Nb2dCurves ******/
		/****** md5 signature: 4e7cc537ccba8267281b74444e5ffb1a ******/
		%feature("compactdefaultargs") Nb2dCurves;
		%feature("autodoc", "Return
-------
int

Description
-----------
get the number of 2d curves to approximate.
") Nb2dCurves;
		int Nb2dCurves();

		/****** GeomFill_SweepFunction::NbIntervals ******/
		/****** md5 signature: b2aaad8a5aa5a35490639df04a76a09e ******/
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
		int NbIntervals(const GeomAbs_Shape S);

		/****** GeomFill_SweepFunction::Resolution ******/
		/****** md5 signature: 985d57b7b05696a0ab1baaf83d307882 ******/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "
Parameters
----------
Index: int
Tol: double

Return
-------
TolU: double
TolV: double

Description
-----------
Returns the resolutions in the sub-space 2d <Index> This information is useful to find a good tolerance in 2d approximation. Warning: Used only if Nb2dCurve > 0.
") Resolution;
		void Resolution(const int Index, const double Tol, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** GeomFill_SweepFunction::SectionShape ******/
		/****** md5 signature: a753d69cb00f0b8439b79ce3401bb770 ******/
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
		void SectionShape(Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****** GeomFill_SweepFunction::SetInterval ******/
		/****** md5 signature: 56dbce7f545295f90d642a293e48bb2a ******/
		%feature("compactdefaultargs") SetInterval;
		%feature("autodoc", "
Parameters
----------
First: double
Last: double

Return
-------
None

Description
-----------
Sets the bounds of the parametric interval on the function This determines the derivatives in these values if the function is not Cn.
") SetInterval;
		void SetInterval(const double First, const double Last);

		/****** GeomFill_SweepFunction::SetTolerance ******/
		/****** md5 signature: 29c79f73c127702faa370cb75cf828a6 ******/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "
Parameters
----------
Tol3d: double
Tol2d: double

Return
-------
None

Description
-----------
Is useful, if <self> has to be run numerical algorithme to perform D0, D1 or D2.
") SetTolerance;
		void SetTolerance(const double Tol3d, const double Tol2d);

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
		/****** md5 signature: 199700b58563769c3610a7c125df4004 ******/
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
		 GeomFill_Tensor(const int NbRow, const int NbCol, const int NbMat);

		/****** GeomFill_Tensor::ChangeValue ******/
		/****** md5 signature: a892e08ed648d7d98a4c18d4814b8986 ******/
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "
Parameters
----------
Row: int
Col: int
Mat: int

Return
-------
double

Description
-----------
accesses (in read or write mode) the value of index <Row>, <Col> and <Mat> of a Tensor. An exception is raised if <Row>, <Col> or <Mat> are not in the correct range.
") ChangeValue;
		double & ChangeValue(const int Row, const int Col, const int Mat);

		/****** GeomFill_Tensor::Init ******/
		/****** md5 signature: 988f2473f383681993e100174f1983b4 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
InitialValue: double

Return
-------
None

Description
-----------
Initialize all the elements of a Tensor to InitialValue.
") Init;
		void Init(const double InitialValue);

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
		/****** md5 signature: 9e81a4f5a1626fcc9ad2ac4ea10fad19 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
Row: int
Col: int
Mat: int

Return
-------
double

Description
-----------
accesses (in read or write mode) the value of index <Row>, <Col> and <Mat> of a Tensor. An exception is raised if <Row>, <Col> or <Mat> are not in the correct range.
") Value;
		const double & Value(const int Row, const int Col, const int Mat);

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
		/****** md5 signature: 5e8b60a697ef168db8603101844e2cab ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
W: double

Return
-------
gp_Vec

Description
-----------
Computes the derivative of the field of tangency at parameter W.
") D1;
		virtual gp_Vec D1(const double W);

		/****** GeomFill_TgtField::D1 ******/
		/****** md5 signature: 54a34bae47f4e8fd4db319dd1dc7fea7 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
W: double
V: gp_Vec
DV: gp_Vec

Return
-------
None

Description
-----------
Computes the value and the derivative of the field of tangency at parameter W.
") D1;
		virtual void D1(const double W, gp_Vec & V, gp_Vec & DV);

		/****** GeomFill_TgtField::IsScalable ******/
		/****** md5 signature: c3561850756562241994b4d314fe3e02 ******/
		%feature("compactdefaultargs") IsScalable;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsScalable;
		virtual bool IsScalable();

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
		/****** md5 signature: f8dd47a691adac29a3ba61408497f96e ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
W: double

Return
-------
gp_Vec

Description
-----------
Computes the value of the field of tangency at parameter W.
") Value;
		virtual gp_Vec Value(const double W);

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
		/****** md5 signature: 18e411c95fdc8b4756897b9729b02273 ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
Param: double
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
		virtual bool D0(const double Param, gp_Vec & Tangent, gp_Vec & Normal, gp_Vec & BiNormal);

		/****** GeomFill_TrihedronLaw::D1 ******/
		/****** md5 signature: 888b300536ab6cbba1921cb9087ed4a7 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
Param: double
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
		virtual bool D1(const double Param, gp_Vec & Tangent, gp_Vec & DTangent, gp_Vec & Normal, gp_Vec & DNormal, gp_Vec & BiNormal, gp_Vec & DBiNormal);

		/****** GeomFill_TrihedronLaw::D2 ******/
		/****** md5 signature: 46af9e5b88030f4c1bd5ab5de0543baa ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
Param: double
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
compute Trihedron on curve first and second derivatives. Warning: It used only for C2 approximation.
") D2;
		virtual bool D2(const double Param, gp_Vec & Tangent, gp_Vec & DTangent, gp_Vec & D2Tangent, gp_Vec & Normal, gp_Vec & DNormal, gp_Vec & D2Normal, gp_Vec & BiNormal, gp_Vec & DBiNormal, gp_Vec & D2BiNormal);

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
Get average value of M(t) and V(t) it is useful to make fast approximation of rational surfaces.
") GetAverageLaw;
		virtual void GetAverageLaw(gp_Vec & ATangent, gp_Vec & ANormal, gp_Vec & ABiNormal);

		/****** GeomFill_TrihedronLaw::GetInterval ******/
		/****** md5 signature: 0a9ca52bf39db592c5e20c2ffc4a34bc ******/
		%feature("compactdefaultargs") GetInterval;
		%feature("autodoc", "
Parameters
----------

Return
-------
First: double
Last: double

Description
-----------
Gets the bounds of the parametric interval on the function.
") GetInterval;
		void GetInterval(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** GeomFill_TrihedronLaw::Intervals ******/
		/****** md5 signature: 3d6a840a7f0f4eea65b38aa9a495c6b6 ******/
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
		/****** md5 signature: 92e5844c876cfab9c0354aa736133763 ******/
		%feature("compactdefaultargs") IsConstant;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Say if the law is Constant.
") IsConstant;
		virtual bool IsConstant();

		/****** GeomFill_TrihedronLaw::IsOnlyBy3dCurve ******/
		/****** md5 signature: 30ce027b5db94467f261878180151ba1 ******/
		%feature("compactdefaultargs") IsOnlyBy3dCurve;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Say if the law is defined, only by the 3d Geometry of the set Curve Return False by Default.
") IsOnlyBy3dCurve;
		virtual bool IsOnlyBy3dCurve();

		/****** GeomFill_TrihedronLaw::NbIntervals ******/
		/****** md5 signature: 9ac7bc3c23f26b850f256bf654af74c8 ******/
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
		virtual int NbIntervals(const GeomAbs_Shape S);

		/****** GeomFill_TrihedronLaw::SetCurve ******/
		/****** md5 signature: 4e9aceb1346696cfa85b19c321977cd4 ******/
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
Return: true.
") SetCurve;
		virtual bool SetCurve(const opencascade::handle<Adaptor3d_Curve> & C);

		/****** GeomFill_TrihedronLaw::SetInterval ******/
		/****** md5 signature: 1609cf8efbd7c79a3ebe577aedebde65 ******/
		%feature("compactdefaultargs") SetInterval;
		%feature("autodoc", "
Parameters
----------
First: double
Last: double

Return
-------
None

Description
-----------
Sets the bounds of the parametric interval on the function This determines the derivatives in these values if the function is not Cn.
") SetInterval;
		virtual void SetInterval(const double First, const double Last);

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
		/****** md5 signature: fdfbf5a9e39b1b191b062d8143a5c4b2 ******/
		%feature("compactdefaultargs") GeomFill_BoundWithSurf;
		%feature("autodoc", "
Parameters
----------
CurveOnSurf: Adaptor3d_CurveOnSurface
Tol3d: double
Tolang: double

Return
-------
None

Description
-----------
Constructs a boundary object defined by the 3d curve CurveOnSurf. The surface to be filled along this boundary will be in the tolerance range defined by Tol3d. What's more, at each point of CurveOnSurf, the angle between the normal to the surface to be filled along this boundary, and the normal to the surface on which CurveOnSurf lies, must not be greater than TolAng. This object is to be used as a boundary for a GeomFill_ConstrainedFilling framework. Warning CurveOnSurf is an adapted curve, that is, an object which is an interface between: - the services provided by a curve lying on a surface from the package Geom - and those required of the curve by the computation algorithm which uses it. The adapted curve is created in the following way: opencascade::handle<Geom_Surface> mySurface = ... ; opencascade::handle<Geom2d_Curve> myParamCurve = ... ; // where myParamCurve is a 2D curve in the parametric space of the surface mySurface opencascade::handle<GeomAdaptor_Surface> Surface = new GeomAdaptor_Surface(mySurface); opencascade::handle<Geom2dAdaptor_Curve> ParamCurve = new Geom2dAdaptor_Curve(myParamCurve); CurveOnSurf = Adaptor3d_CurveOnSurface(ParamCurve,Surface); The boundary is then constructed with the CurveOnSurf object: double Tol = ... ; double TolAng = ... ; myBoundary = GeomFill_BoundWithSurf ( CurveOnSurf, Tol, TolAng );.
") GeomFill_BoundWithSurf;
		 GeomFill_BoundWithSurf(const Adaptor3d_CurveOnSurface & CurveOnSurf, const double Tol3d, const double Tolang);

		/****** GeomFill_BoundWithSurf::Bounds ******/
		/****** md5 signature: c66f21e8fd3471d5d9f2d6d787519094 ******/
		%feature("compactdefaultargs") Bounds;
		%feature("autodoc", "
Parameters
----------

Return
-------
First: double
Last: double

Description
-----------
No available documentation.
") Bounds;
		void Bounds(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** GeomFill_BoundWithSurf::D1 ******/
		/****** md5 signature: 5cdfb5e36b431127fc299906b28f9747 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
U: double
P: gp_Pnt
V: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") D1;
		void D1(const double U, gp_Pnt & P, gp_Vec & V);

		/****** GeomFill_BoundWithSurf::D1Norm ******/
		/****** md5 signature: 5aaf142403c6c2cadf6d48f74b54e0e6 ******/
		%feature("compactdefaultargs") D1Norm;
		%feature("autodoc", "
Parameters
----------
U: double
N: gp_Vec
DN: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") D1Norm;
		void D1Norm(const double U, gp_Vec & N, gp_Vec & DN);

		/****** GeomFill_BoundWithSurf::HasNormals ******/
		/****** md5 signature: 5566c40d87269cb9a9cd008e3f4c3cf4 ******/
		%feature("compactdefaultargs") HasNormals;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") HasNormals;
		bool HasNormals();

		/****** GeomFill_BoundWithSurf::IsDegenerated ******/
		/****** md5 signature: 880db9d1e734f87b6562fbc82eb08f69 ******/
		%feature("compactdefaultargs") IsDegenerated;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsDegenerated;
		bool IsDegenerated();

		/****** GeomFill_BoundWithSurf::Norm ******/
		/****** md5 signature: eb12b4c6dee7c10e135eadd8ffca7540 ******/
		%feature("compactdefaultargs") Norm;
		%feature("autodoc", "
Parameters
----------
U: double

Return
-------
gp_Vec

Description
-----------
No available documentation.
") Norm;
		gp_Vec Norm(const double U);

		/****** GeomFill_BoundWithSurf::Reparametrize ******/
		/****** md5 signature: 845652cf954c1dcddd95050e5f3e838e ******/
		%feature("compactdefaultargs") Reparametrize;
		%feature("autodoc", "
Parameters
----------
First: double
Last: double
HasDF: bool
HasDL: bool
DF: double
DL: double
Rev: bool

Return
-------
None

Description
-----------
No available documentation.
") Reparametrize;
		void Reparametrize(const double First, const double Last, const bool HasDF, const bool HasDL, const double DF, const double DL, const bool Rev);

		/****** GeomFill_BoundWithSurf::Value ******/
		/****** md5 signature: a4e8c285909e15ba4e4166c6ecbebc1a ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
U: double

Return
-------
gp_Pnt

Description
-----------
No available documentation.
") Value;
		gp_Pnt Value(const double U);

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
		/****** md5 signature: e996bfd727b3dadff5915f33bbe45aa4 ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<GeomFill_TrihedronLaw>

Description
-----------
No available documentation.
") Copy;
		opencascade::handle<GeomFill_TrihedronLaw> Copy();

		/****** GeomFill_ConstantBiNormal::D0 ******/
		/****** md5 signature: 1cb65c58de63b6db4989c7ec3f963ca2 ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
Param: double
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
		bool D0(const double Param, gp_Vec & Tangent, gp_Vec & Normal, gp_Vec & BiNormal);

		/****** GeomFill_ConstantBiNormal::D1 ******/
		/****** md5 signature: 47c1538d0ec677ac915df0010cf7ff27 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
Param: double
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
		bool D1(const double Param, gp_Vec & Tangent, gp_Vec & DTangent, gp_Vec & Normal, gp_Vec & DNormal, gp_Vec & BiNormal, gp_Vec & DBiNormal);

		/****** GeomFill_ConstantBiNormal::D2 ******/
		/****** md5 signature: 272044e0af3c48f99fd5128147f64ec6 ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
Param: double
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
compute Trihedron on curve first and second derivatives. Warning: It used only for C2 approximation.
") D2;
		bool D2(const double Param, gp_Vec & Tangent, gp_Vec & DTangent, gp_Vec & D2Tangent, gp_Vec & Normal, gp_Vec & DNormal, gp_Vec & D2Normal, gp_Vec & BiNormal, gp_Vec & DBiNormal, gp_Vec & D2BiNormal);

		/****** GeomFill_ConstantBiNormal::GetAverageLaw ******/
		/****** md5 signature: c4ee07f959c21a608d68f8a824be1ce4 ******/
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
Gets average value of Tangent(t) and Normal(t) it is useful to make fast approximation of rational surfaces.
") GetAverageLaw;
		void GetAverageLaw(gp_Vec & ATangent, gp_Vec & ANormal, gp_Vec & ABiNormal);

		/****** GeomFill_ConstantBiNormal::Intervals ******/
		/****** md5 signature: c706a9ee65ae76457235d7e55942295b ******/
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

		/****** GeomFill_ConstantBiNormal::IsConstant ******/
		/****** md5 signature: f5b53cd348be55874964083dd4dc65d3 ******/
		%feature("compactdefaultargs") IsConstant;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Says if the law is Constant.
") IsConstant;
		bool IsConstant();

		/****** GeomFill_ConstantBiNormal::IsOnlyBy3dCurve ******/
		/****** md5 signature: 9988eca8a8cb4fcfb146e32d43fec1e6 ******/
		%feature("compactdefaultargs") IsOnlyBy3dCurve;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return True.
") IsOnlyBy3dCurve;
		bool IsOnlyBy3dCurve();

		/****** GeomFill_ConstantBiNormal::NbIntervals ******/
		/****** md5 signature: b2aaad8a5aa5a35490639df04a76a09e ******/
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
		int NbIntervals(const GeomAbs_Shape S);

		/****** GeomFill_ConstantBiNormal::SetCurve ******/
		/****** md5 signature: 37bee98df2af32a57ea264837e484480 ******/
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
Return: true in case if execution end correctly.
") SetCurve;
		bool SetCurve(const opencascade::handle<Adaptor3d_Curve> & C);

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
		/****** md5 signature: d25272adb3fa9e55b25b934507f2ed3d ******/
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
		/****** md5 signature: 5181936bd64980201e9a5fe1d1199c47 ******/
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
		/****** md5 signature: bad17724c105204630777579ecc2c0cc ******/
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
		/****** md5 signature: 79203b6c8adc2ad0350759ee3d194c9e ******/
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
		/****** md5 signature: 21fef7cbccb85c8ba711528bca443d5c ******/
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
		 GeomFill_CorrectedFrenet(const bool ForEvaluation);

		/****** GeomFill_CorrectedFrenet::Copy ******/
		/****** md5 signature: e996bfd727b3dadff5915f33bbe45aa4 ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<GeomFill_TrihedronLaw>

Description
-----------
No available documentation.
") Copy;
		opencascade::handle<GeomFill_TrihedronLaw> Copy();

		/****** GeomFill_CorrectedFrenet::D0 ******/
		/****** md5 signature: 1cb65c58de63b6db4989c7ec3f963ca2 ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
Param: double
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
		bool D0(const double Param, gp_Vec & Tangent, gp_Vec & Normal, gp_Vec & BiNormal);

		/****** GeomFill_CorrectedFrenet::D1 ******/
		/****** md5 signature: 47c1538d0ec677ac915df0010cf7ff27 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
Param: double
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
		bool D1(const double Param, gp_Vec & Tangent, gp_Vec & DTangent, gp_Vec & Normal, gp_Vec & DNormal, gp_Vec & BiNormal, gp_Vec & DBiNormal);

		/****** GeomFill_CorrectedFrenet::D2 ******/
		/****** md5 signature: 272044e0af3c48f99fd5128147f64ec6 ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
Param: double
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
compute Trihedron on curve first and second derivatives. Warning: It used only for C2 approximation.
") D2;
		bool D2(const double Param, gp_Vec & Tangent, gp_Vec & DTangent, gp_Vec & D2Tangent, gp_Vec & Normal, gp_Vec & DNormal, gp_Vec & D2Normal, gp_Vec & BiNormal, gp_Vec & DBiNormal, gp_Vec & D2BiNormal);

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
		/****** md5 signature: c4ee07f959c21a608d68f8a824be1ce4 ******/
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
		void GetAverageLaw(gp_Vec & ATangent, gp_Vec & ANormal, gp_Vec & ABiNormal);

		/****** GeomFill_CorrectedFrenet::Intervals ******/
		/****** md5 signature: c706a9ee65ae76457235d7e55942295b ******/
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

		/****** GeomFill_CorrectedFrenet::IsConstant ******/
		/****** md5 signature: f5b53cd348be55874964083dd4dc65d3 ******/
		%feature("compactdefaultargs") IsConstant;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Say if the law is Constant.
") IsConstant;
		bool IsConstant();

		/****** GeomFill_CorrectedFrenet::IsOnlyBy3dCurve ******/
		/****** md5 signature: 9988eca8a8cb4fcfb146e32d43fec1e6 ******/
		%feature("compactdefaultargs") IsOnlyBy3dCurve;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return True.
") IsOnlyBy3dCurve;
		bool IsOnlyBy3dCurve();

		/****** GeomFill_CorrectedFrenet::NbIntervals ******/
		/****** md5 signature: b2aaad8a5aa5a35490639df04a76a09e ******/
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
		int NbIntervals(const GeomAbs_Shape S);

		/****** GeomFill_CorrectedFrenet::SetCurve ******/
		/****** md5 signature: 37bee98df2af32a57ea264837e484480 ******/
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
Return: true in case if execution end correctly.
") SetCurve;
		bool SetCurve(const opencascade::handle<Adaptor3d_Curve> & C);

		/****** GeomFill_CorrectedFrenet::SetInterval ******/
		/****** md5 signature: 56dbce7f545295f90d642a293e48bb2a ******/
		%feature("compactdefaultargs") SetInterval;
		%feature("autodoc", "
Parameters
----------
First: double
Last: double

Return
-------
None

Description
-----------
No available documentation.
") SetInterval;
		void SetInterval(const double First, const double Last);

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
		/****** md5 signature: 9afcda456c2238a16277f4973c632120 ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<GeomFill_LocationLaw>

Description
-----------
No available documentation.
") Copy;
		opencascade::handle<GeomFill_LocationLaw> Copy();

		/****** GeomFill_CurveAndTrihedron::D0 ******/
		/****** md5 signature: b6e365714d272bc8806abcc1d94c4a67 ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
Param: double
M: gp_Mat
V: gp_Vec

Return
-------
bool

Description
-----------
compute Location and 2d points.
") D0;
		bool D0(const double Param, gp_Mat & M, gp_Vec & V);

		/****** GeomFill_CurveAndTrihedron::D0 ******/
		/****** md5 signature: 39e3aeea09812ec23338efd3e742c4f7 ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
Param: double
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
		bool D0(const double Param, gp_Mat & M, gp_Vec & V, TColgp_Array1OfPnt2d & Poles2d);

		/****** GeomFill_CurveAndTrihedron::D1 ******/
		/****** md5 signature: 6290e69091174c1c479d3585b2e66f57 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
Param: double
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
		bool D1(const double Param, gp_Mat & M, gp_Vec & V, gp_Mat & DM, gp_Vec & DV, TColgp_Array1OfPnt2d & Poles2d, TColgp_Array1OfVec2d & DPoles2d);

		/****** GeomFill_CurveAndTrihedron::D2 ******/
		/****** md5 signature: 5eef2b2ca9a6e2fa099666450057d256 ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
Param: double
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
compute location 2d points and associated first and second derivatives. Warning: It used only for C2 approximation.
") D2;
		bool D2(const double Param, gp_Mat & M, gp_Vec & V, gp_Mat & DM, gp_Vec & DV, gp_Mat & D2M, gp_Vec & D2V, TColgp_Array1OfPnt2d & Poles2d, TColgp_Array1OfVec2d & DPoles2d, TColgp_Array1OfVec2d & D2Poles2d);

		/****** GeomFill_CurveAndTrihedron::GetAverageLaw ******/
		/****** md5 signature: 74cd3db64f284d74faf8e6f650fc7739 ******/
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
Get average value of M(t) and V(t) it is useful to make fast approximation of rational surfaces.
") GetAverageLaw;
		void GetAverageLaw(gp_Mat & AM, gp_Vec & AV);

		/****** GeomFill_CurveAndTrihedron::GetCurve ******/
		/****** md5 signature: 7574de48de8db57acc314a8e469d5b50 ******/
		%feature("compactdefaultargs") GetCurve;
		%feature("autodoc", "Return
-------
opencascade::handle<Adaptor3d_Curve>

Description
-----------
No available documentation.
") GetCurve;
		const opencascade::handle<Adaptor3d_Curve> & GetCurve();

		/****** GeomFill_CurveAndTrihedron::GetDomain ******/
		/****** md5 signature: bfa86e0764434924d787bb3e27f141fc ******/
		%feature("compactdefaultargs") GetDomain;
		%feature("autodoc", "
Parameters
----------

Return
-------
First: double
Last: double

Description
-----------
Gets the bounds of the function parametric domain. Warning: This domain it is not modified by the SetValue method.
") GetDomain;
		void GetDomain(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** GeomFill_CurveAndTrihedron::GetInterval ******/
		/****** md5 signature: e2b81769ee3831280356f9e3620377f9 ******/
		%feature("compactdefaultargs") GetInterval;
		%feature("autodoc", "
Parameters
----------

Return
-------
First: double
Last: double

Description
-----------
Gets the bounds of the parametric interval on the function.
") GetInterval;
		void GetInterval(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** GeomFill_CurveAndTrihedron::GetMaximalNorm ******/
		/****** md5 signature: 12228749eac2dbe6a52271c6b163d8fb ******/
		%feature("compactdefaultargs") GetMaximalNorm;
		%feature("autodoc", "Return
-------
double

Description
-----------
Get the maximum Norm of the matrix-location part. It is usful to find a good Tolerance to approx M(t).
") GetMaximalNorm;
		double GetMaximalNorm();

		/****** GeomFill_CurveAndTrihedron::Intervals ******/
		/****** md5 signature: c706a9ee65ae76457235d7e55942295b ******/
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

		/****** GeomFill_CurveAndTrihedron::IsRotation ******/
		/****** md5 signature: 0e95be8276d034f3444e4856c5d5b978 ******/
		%feature("compactdefaultargs") IsRotation;
		%feature("autodoc", "
Parameters
----------

Return
-------
Error: double

Description
-----------
Say if the Location Law, is a rotation of Location The default implementation is ' returns False '.
") IsRotation;
		bool IsRotation(Standard_Real &OutValue);

		/****** GeomFill_CurveAndTrihedron::IsTranslation ******/
		/****** md5 signature: 8d308dfdca297b9d2043b133aa5480a5 ******/
		%feature("compactdefaultargs") IsTranslation;
		%feature("autodoc", "
Parameters
----------

Return
-------
Error: double

Description
-----------
Say if the Location Law, is an translation of Location The default implementation is ' returns False '.
") IsTranslation;
		bool IsTranslation(Standard_Real &OutValue);

		/****** GeomFill_CurveAndTrihedron::NbIntervals ******/
		/****** md5 signature: b2aaad8a5aa5a35490639df04a76a09e ******/
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
		int NbIntervals(const GeomAbs_Shape S);

		/****** GeomFill_CurveAndTrihedron::Rotation ******/
		/****** md5 signature: 065274d94845a992efbb74b03f65fae8 ******/
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
		void Rotation(gp_Pnt & Center);

		/****** GeomFill_CurveAndTrihedron::SetCurve ******/
		/****** md5 signature: 37bee98df2af32a57ea264837e484480 ******/
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
Return: true in case if execution end correctly.
") SetCurve;
		bool SetCurve(const opencascade::handle<Adaptor3d_Curve> & C);

		/****** GeomFill_CurveAndTrihedron::SetInterval ******/
		/****** md5 signature: 56dbce7f545295f90d642a293e48bb2a ******/
		%feature("compactdefaultargs") SetInterval;
		%feature("autodoc", "
Parameters
----------
First: double
Last: double

Return
-------
None

Description
-----------
Sets the bounds of the parametric interval on the function This determines the derivatives in these values if the function is not Cn.
") SetInterval;
		void SetInterval(const double First, const double Last);

		/****** GeomFill_CurveAndTrihedron::SetTrsf ******/
		/****** md5 signature: c81ceb20409df44332cc88e221ba8f7f ******/
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
		void SetTrsf(const gp_Mat & Transfo);

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
		/****** md5 signature: 8aeb92cffdd66c716fb34a12ea8bd054 ******/
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
		/****** md5 signature: 3355630240eb5b1d073f4034d3df00df ******/
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
		/****** md5 signature: 044ba35fc24e480b31a0c7157ce2fb65 ******/
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
		/****** md5 signature: 27a1727d6f9e7426fd694e311d1036c9 ******/
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
		/****** md5 signature: bad17724c105204630777579ecc2c0cc ******/
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
		/****** md5 signature: 79203b6c8adc2ad0350759ee3d194c9e ******/
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
		/****** md5 signature: 129dee43b71b81feb95726c8f9b9bf1f ******/
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
		/****** md5 signature: 139c0ddfd4c3b6a9eb4e30c5e2eb5047 ******/
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
		/****** md5 signature: e996bfd727b3dadff5915f33bbe45aa4 ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<GeomFill_TrihedronLaw>

Description
-----------
No available documentation.
") Copy;
		opencascade::handle<GeomFill_TrihedronLaw> Copy();

		/****** GeomFill_Darboux::D0 ******/
		/****** md5 signature: 1cb65c58de63b6db4989c7ec3f963ca2 ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
Param: double
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
		bool D0(const double Param, gp_Vec & Tangent, gp_Vec & Normal, gp_Vec & BiNormal);

		/****** GeomFill_Darboux::D1 ******/
		/****** md5 signature: 47c1538d0ec677ac915df0010cf7ff27 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
Param: double
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
		bool D1(const double Param, gp_Vec & Tangent, gp_Vec & DTangent, gp_Vec & Normal, gp_Vec & DNormal, gp_Vec & BiNormal, gp_Vec & DBiNormal);

		/****** GeomFill_Darboux::D2 ******/
		/****** md5 signature: 272044e0af3c48f99fd5128147f64ec6 ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
Param: double
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
compute Trihedron on curve first and second derivatives. Warning: It used only for C2 approximation.
") D2;
		bool D2(const double Param, gp_Vec & Tangent, gp_Vec & DTangent, gp_Vec & D2Tangent, gp_Vec & Normal, gp_Vec & DNormal, gp_Vec & D2Normal, gp_Vec & BiNormal, gp_Vec & DBiNormal, gp_Vec & D2BiNormal);

		/****** GeomFill_Darboux::GetAverageLaw ******/
		/****** md5 signature: c4ee07f959c21a608d68f8a824be1ce4 ******/
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
		void GetAverageLaw(gp_Vec & ATangent, gp_Vec & ANormal, gp_Vec & ABiNormal);

		/****** GeomFill_Darboux::Intervals ******/
		/****** md5 signature: c706a9ee65ae76457235d7e55942295b ******/
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

		/****** GeomFill_Darboux::IsConstant ******/
		/****** md5 signature: f5b53cd348be55874964083dd4dc65d3 ******/
		%feature("compactdefaultargs") IsConstant;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Say if the law is Constant.
") IsConstant;
		bool IsConstant();

		/****** GeomFill_Darboux::IsOnlyBy3dCurve ******/
		/****** md5 signature: 9988eca8a8cb4fcfb146e32d43fec1e6 ******/
		%feature("compactdefaultargs") IsOnlyBy3dCurve;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return False.
") IsOnlyBy3dCurve;
		bool IsOnlyBy3dCurve();

		/****** GeomFill_Darboux::NbIntervals ******/
		/****** md5 signature: b2aaad8a5aa5a35490639df04a76a09e ******/
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
		int NbIntervals(const GeomAbs_Shape S);

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
		/****** md5 signature: 573e6fbcfa87b650547c052a044b4da6 ******/
		%feature("compactdefaultargs") GeomFill_DegeneratedBound;
		%feature("autodoc", "
Parameters
----------
Point: gp_Pnt
First: double
Last: double
Tol3d: double
Tolang: double

Return
-------
None

Description
-----------
No available documentation.
") GeomFill_DegeneratedBound;
		 GeomFill_DegeneratedBound(const gp_Pnt & Point, const double First, const double Last, const double Tol3d, const double Tolang);

		/****** GeomFill_DegeneratedBound::Bounds ******/
		/****** md5 signature: c66f21e8fd3471d5d9f2d6d787519094 ******/
		%feature("compactdefaultargs") Bounds;
		%feature("autodoc", "
Parameters
----------

Return
-------
First: double
Last: double

Description
-----------
No available documentation.
") Bounds;
		void Bounds(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** GeomFill_DegeneratedBound::D1 ******/
		/****** md5 signature: 5cdfb5e36b431127fc299906b28f9747 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
U: double
P: gp_Pnt
V: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") D1;
		void D1(const double U, gp_Pnt & P, gp_Vec & V);

		/****** GeomFill_DegeneratedBound::IsDegenerated ******/
		/****** md5 signature: 880db9d1e734f87b6562fbc82eb08f69 ******/
		%feature("compactdefaultargs") IsDegenerated;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsDegenerated;
		bool IsDegenerated();

		/****** GeomFill_DegeneratedBound::Reparametrize ******/
		/****** md5 signature: 845652cf954c1dcddd95050e5f3e838e ******/
		%feature("compactdefaultargs") Reparametrize;
		%feature("autodoc", "
Parameters
----------
First: double
Last: double
HasDF: bool
HasDL: bool
DF: double
DL: double
Rev: bool

Return
-------
None

Description
-----------
No available documentation.
") Reparametrize;
		void Reparametrize(const double First, const double Last, const bool HasDF, const bool HasDL, const double DF, const double DL, const bool Rev);

		/****** GeomFill_DegeneratedBound::Value ******/
		/****** md5 signature: a4e8c285909e15ba4e4166c6ecbebc1a ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
U: double

Return
-------
gp_Pnt

Description
-----------
No available documentation.
") Value;
		gp_Pnt Value(const double U);

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
		/****** md5 signature: e996bfd727b3dadff5915f33bbe45aa4 ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<GeomFill_TrihedronLaw>

Description
-----------
No available documentation.
") Copy;
		opencascade::handle<GeomFill_TrihedronLaw> Copy();

		/****** GeomFill_DiscreteTrihedron::D0 ******/
		/****** md5 signature: 1cb65c58de63b6db4989c7ec3f963ca2 ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
Param: double
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
		bool D0(const double Param, gp_Vec & Tangent, gp_Vec & Normal, gp_Vec & BiNormal);

		/****** GeomFill_DiscreteTrihedron::D1 ******/
		/****** md5 signature: 47c1538d0ec677ac915df0010cf7ff27 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
Param: double
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
		bool D1(const double Param, gp_Vec & Tangent, gp_Vec & DTangent, gp_Vec & Normal, gp_Vec & DNormal, gp_Vec & BiNormal, gp_Vec & DBiNormal);

		/****** GeomFill_DiscreteTrihedron::D2 ******/
		/****** md5 signature: 272044e0af3c48f99fd5128147f64ec6 ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
Param: double
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
compute Trihedron on curve first and second derivatives. Warning: It used only for C2 approximation For the moment it returns null values for DTangent, DNormal DBiNormal, D2Tangent, D2Normal, D2BiNormal.
") D2;
		bool D2(const double Param, gp_Vec & Tangent, gp_Vec & DTangent, gp_Vec & D2Tangent, gp_Vec & Normal, gp_Vec & DNormal, gp_Vec & D2Normal, gp_Vec & BiNormal, gp_Vec & DBiNormal, gp_Vec & D2BiNormal);

		/****** GeomFill_DiscreteTrihedron::GetAverageLaw ******/
		/****** md5 signature: c4ee07f959c21a608d68f8a824be1ce4 ******/
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
		void GetAverageLaw(gp_Vec & ATangent, gp_Vec & ANormal, gp_Vec & ABiNormal);

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
		/****** md5 signature: c706a9ee65ae76457235d7e55942295b ******/
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

		/****** GeomFill_DiscreteTrihedron::IsConstant ******/
		/****** md5 signature: f5b53cd348be55874964083dd4dc65d3 ******/
		%feature("compactdefaultargs") IsConstant;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Say if the law is Constant.
") IsConstant;
		bool IsConstant();

		/****** GeomFill_DiscreteTrihedron::IsOnlyBy3dCurve ******/
		/****** md5 signature: 9988eca8a8cb4fcfb146e32d43fec1e6 ******/
		%feature("compactdefaultargs") IsOnlyBy3dCurve;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return True.
") IsOnlyBy3dCurve;
		bool IsOnlyBy3dCurve();

		/****** GeomFill_DiscreteTrihedron::NbIntervals ******/
		/****** md5 signature: b2aaad8a5aa5a35490639df04a76a09e ******/
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
		int NbIntervals(const GeomAbs_Shape S);

		/****** GeomFill_DiscreteTrihedron::SetCurve ******/
		/****** md5 signature: 37bee98df2af32a57ea264837e484480 ******/
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
Return: true in case if execution end correctly.
") SetCurve;
		bool SetCurve(const opencascade::handle<Adaptor3d_Curve> & C);

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
		/****** md5 signature: 834d1d902fc8263a1eb1ecce088ce7f8 ******/
		%feature("compactdefaultargs") GeomFill_DraftTrihedron;
		%feature("autodoc", "
Parameters
----------
BiNormal: gp_Vec
Angle: double

Return
-------
None

Description
-----------
No available documentation.
") GeomFill_DraftTrihedron;
		 GeomFill_DraftTrihedron(const gp_Vec & BiNormal, const double Angle);

		/****** GeomFill_DraftTrihedron::Copy ******/
		/****** md5 signature: e996bfd727b3dadff5915f33bbe45aa4 ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<GeomFill_TrihedronLaw>

Description
-----------
No available documentation.
") Copy;
		opencascade::handle<GeomFill_TrihedronLaw> Copy();

		/****** GeomFill_DraftTrihedron::D0 ******/
		/****** md5 signature: 1cb65c58de63b6db4989c7ec3f963ca2 ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
Param: double
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
		bool D0(const double Param, gp_Vec & Tangent, gp_Vec & Normal, gp_Vec & BiNormal);

		/****** GeomFill_DraftTrihedron::D1 ******/
		/****** md5 signature: 47c1538d0ec677ac915df0010cf7ff27 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
Param: double
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
compute Trihedron on curve first and second derivatives. Warning: It used only for C2 approximation.
") D1;
		bool D1(const double Param, gp_Vec & Tangent, gp_Vec & DTangent, gp_Vec & Normal, gp_Vec & DNormal, gp_Vec & BiNormal, gp_Vec & DBiNormal);

		/****** GeomFill_DraftTrihedron::D2 ******/
		/****** md5 signature: 272044e0af3c48f99fd5128147f64ec6 ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
Param: double
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
		bool D2(const double Param, gp_Vec & Tangent, gp_Vec & DTangent, gp_Vec & D2Tangent, gp_Vec & Normal, gp_Vec & DNormal, gp_Vec & D2Normal, gp_Vec & BiNormal, gp_Vec & DBiNormal, gp_Vec & D2BiNormal);

		/****** GeomFill_DraftTrihedron::GetAverageLaw ******/
		/****** md5 signature: c4ee07f959c21a608d68f8a824be1ce4 ******/
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
		void GetAverageLaw(gp_Vec & ATangent, gp_Vec & ANormal, gp_Vec & ABiNormal);

		/****** GeomFill_DraftTrihedron::Intervals ******/
		/****** md5 signature: c706a9ee65ae76457235d7e55942295b ******/
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

		/****** GeomFill_DraftTrihedron::IsConstant ******/
		/****** md5 signature: f5b53cd348be55874964083dd4dc65d3 ******/
		%feature("compactdefaultargs") IsConstant;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Say if the law is Constant.
") IsConstant;
		bool IsConstant();

		/****** GeomFill_DraftTrihedron::IsOnlyBy3dCurve ******/
		/****** md5 signature: 9988eca8a8cb4fcfb146e32d43fec1e6 ******/
		%feature("compactdefaultargs") IsOnlyBy3dCurve;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return True.
") IsOnlyBy3dCurve;
		bool IsOnlyBy3dCurve();

		/****** GeomFill_DraftTrihedron::NbIntervals ******/
		/****** md5 signature: b2aaad8a5aa5a35490639df04a76a09e ******/
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
		int NbIntervals(const GeomAbs_Shape S);

		/****** GeomFill_DraftTrihedron::SetAngle ******/
		/****** md5 signature: ba2b03bf28ec10048167948ef997085a ******/
		%feature("compactdefaultargs") SetAngle;
		%feature("autodoc", "
Parameters
----------
Angle: double

Return
-------
None

Description
-----------
No available documentation.
") SetAngle;
		void SetAngle(const double Angle);

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
		/****** md5 signature: 85e540db90b0592d3353f7488876979d ******/
		%feature("compactdefaultargs") BSplineSurface;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_BSplineSurface>

Description
-----------
give if possible an bspline Surface, like iso-v are the section. If it is not possible this methode have to get an Null Surface. Is it the default implementation.
") BSplineSurface;
		opencascade::handle<Geom_BSplineSurface> BSplineSurface();

		/****** GeomFill_EvolvedSection::BarycentreOfSurf ******/
		/****** md5 signature: 1f25b0eb1d890895eb1250cc0c28882b ******/
		%feature("compactdefaultargs") BarycentreOfSurf;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Get the barycentre of Surface. An very poor estimation is sufficient. This information is useful to perform well conditioned rational approximation. Warning: Used only if <self> IsRational.
") BarycentreOfSurf;
		gp_Pnt BarycentreOfSurf();

		/****** GeomFill_EvolvedSection::ConstantSection ******/
		/****** md5 signature: a5ec605c1a1c6c96ce233c046fae7878 ******/
		%feature("compactdefaultargs") ConstantSection;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Curve>

Description
-----------
Return the constant Section if <self> IsConstant.
") ConstantSection;
		opencascade::handle<Geom_Curve> ConstantSection();

		/****** GeomFill_EvolvedSection::D0 ******/
		/****** md5 signature: b4f4bc7aa9799f6d8cf914bb0136734c ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
Param: double
Poles: TColgp_Array1OfPnt
Weigths: TColStd_Array1OfReal

Return
-------
bool

Description
-----------
compute the section for v = param.
") D0;
		bool D0(const double Param, TColgp_Array1OfPnt & Poles, TColStd_Array1OfReal & Weigths);

		/****** GeomFill_EvolvedSection::D1 ******/
		/****** md5 signature: 8b4c1258777be50399d42a2a43e78f30 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
Param: double
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
		bool D1(const double Param, TColgp_Array1OfPnt & Poles, TColgp_Array1OfVec & DPoles, TColStd_Array1OfReal & Weigths, TColStd_Array1OfReal & DWeigths);

		/****** GeomFill_EvolvedSection::D2 ******/
		/****** md5 signature: 60c74a1a2be1793f26f242c7eab4c72b ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
Param: double
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
		bool D2(const double Param, TColgp_Array1OfPnt & Poles, TColgp_Array1OfVec & DPoles, TColgp_Array1OfVec & D2Poles, TColStd_Array1OfReal & Weigths, TColStd_Array1OfReal & DWeigths, TColStd_Array1OfReal & D2Weigths);

		/****** GeomFill_EvolvedSection::GetDomain ******/
		/****** md5 signature: bfa86e0764434924d787bb3e27f141fc ******/
		%feature("compactdefaultargs") GetDomain;
		%feature("autodoc", "
Parameters
----------

Return
-------
First: double
Last: double

Description
-----------
Gets the bounds of the function parametric domain. Warning: This domain it is not modified by the SetValue method.
") GetDomain;
		void GetDomain(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** GeomFill_EvolvedSection::GetInterval ******/
		/****** md5 signature: e2b81769ee3831280356f9e3620377f9 ******/
		%feature("compactdefaultargs") GetInterval;
		%feature("autodoc", "
Parameters
----------

Return
-------
First: double
Last: double

Description
-----------
Gets the bounds of the parametric interval on the function.
") GetInterval;
		void GetInterval(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** GeomFill_EvolvedSection::GetMinimalWeight ******/
		/****** md5 signature: 6484606f629c915e24cdd616ac007d67 ******/
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
		void GetMinimalWeight(TColStd_Array1OfReal & Weigths);

		/****** GeomFill_EvolvedSection::GetTolerance ******/
		/****** md5 signature: 217050fdab79b8e071e91271c92a3488 ******/
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "
Parameters
----------
BoundTol: double
SurfTol: double
AngleTol: double
Tol3d: TColStd_Array1OfReal

Return
-------
None

Description
-----------
Returns the tolerances associated at each poles to reach in approximation, to satisfy: BoundTol error at the Boundary AngleTol tangent error at the Boundary (in radian) SurfTol error inside the surface.
") GetTolerance;
		void GetTolerance(const double BoundTol, const double SurfTol, const double AngleTol, TColStd_Array1OfReal & Tol3d);

		/****** GeomFill_EvolvedSection::Intervals ******/
		/****** md5 signature: c706a9ee65ae76457235d7e55942295b ******/
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

		/****** GeomFill_EvolvedSection::IsConstant ******/
		/****** md5 signature: c82837d7304e800e44d99ab714692b7e ******/
		%feature("compactdefaultargs") IsConstant;
		%feature("autodoc", "
Parameters
----------

Return
-------
Error: double

Description
-----------
return True If the Law isConstant.
") IsConstant;
		bool IsConstant(Standard_Real &OutValue);

		/****** GeomFill_EvolvedSection::IsRational ******/
		/****** md5 signature: 43e7b94be36c1d44222e606d2d075195 ******/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns if the sections are rational or not.
") IsRational;
		bool IsRational();

		/****** GeomFill_EvolvedSection::IsUPeriodic ******/
		/****** md5 signature: 7236661160e2b4989ea98f769e60fafb ******/
		%feature("compactdefaultargs") IsUPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns if the sections are periodic or not.
") IsUPeriodic;
		bool IsUPeriodic();

		/****** GeomFill_EvolvedSection::IsVPeriodic ******/
		/****** md5 signature: 0654a6d88753f46bfbed67995e913efa ******/
		%feature("compactdefaultargs") IsVPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns if the law isperiodic or not.
") IsVPeriodic;
		bool IsVPeriodic();

		/****** GeomFill_EvolvedSection::Knots ******/
		/****** md5 signature: 359ac10e91186ab2f75e6163036a99fe ******/
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
		void Knots(TColStd_Array1OfReal & TKnots);

		/****** GeomFill_EvolvedSection::MaximalSection ******/
		/****** md5 signature: 1811db5e3dd550ab78611f3959bb8ecf ******/
		%feature("compactdefaultargs") MaximalSection;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the length of the greater section. This information is useful to G1's control. Warning: With an little value, approximation can be slower.
") MaximalSection;
		double MaximalSection();

		/****** GeomFill_EvolvedSection::Mults ******/
		/****** md5 signature: 2c8f8c7780e1bd71859fc4a6b9500baf ******/
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
		void Mults(TColStd_Array1OfInteger & TMults);

		/****** GeomFill_EvolvedSection::NbIntervals ******/
		/****** md5 signature: b2aaad8a5aa5a35490639df04a76a09e ******/
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
		int NbIntervals(const GeomAbs_Shape S);

		/****** GeomFill_EvolvedSection::SectionShape ******/
		/****** md5 signature: a753d69cb00f0b8439b79ce3401bb770 ******/
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
		void SectionShape(Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****** GeomFill_EvolvedSection::SetInterval ******/
		/****** md5 signature: 56dbce7f545295f90d642a293e48bb2a ******/
		%feature("compactdefaultargs") SetInterval;
		%feature("autodoc", "
Parameters
----------
First: double
Last: double

Return
-------
None

Description
-----------
Sets the bounds of the parametric interval on the function This determines the derivatives in these values if the function is not Cn.
") SetInterval;
		void SetInterval(const double First, const double Last);

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
		/****** md5 signature: e996bfd727b3dadff5915f33bbe45aa4 ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<GeomFill_TrihedronLaw>

Description
-----------
No available documentation.
") Copy;
		opencascade::handle<GeomFill_TrihedronLaw> Copy();

		/****** GeomFill_Fixed::D0 ******/
		/****** md5 signature: 1cb65c58de63b6db4989c7ec3f963ca2 ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
Param: double
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
		bool D0(const double Param, gp_Vec & Tangent, gp_Vec & Normal, gp_Vec & BiNormal);

		/****** GeomFill_Fixed::D1 ******/
		/****** md5 signature: 47c1538d0ec677ac915df0010cf7ff27 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
Param: double
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
		bool D1(const double Param, gp_Vec & Tangent, gp_Vec & DTangent, gp_Vec & Normal, gp_Vec & DNormal, gp_Vec & BiNormal, gp_Vec & DBiNormal);

		/****** GeomFill_Fixed::D2 ******/
		/****** md5 signature: 272044e0af3c48f99fd5128147f64ec6 ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
Param: double
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
compute Trihedron on curve first and second derivatives. Warning: It used only for C2 approximation.
") D2;
		bool D2(const double Param, gp_Vec & Tangent, gp_Vec & DTangent, gp_Vec & D2Tangent, gp_Vec & Normal, gp_Vec & DNormal, gp_Vec & D2Normal, gp_Vec & BiNormal, gp_Vec & DBiNormal, gp_Vec & D2BiNormal);

		/****** GeomFill_Fixed::GetAverageLaw ******/
		/****** md5 signature: c4ee07f959c21a608d68f8a824be1ce4 ******/
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
		void GetAverageLaw(gp_Vec & ATangent, gp_Vec & ANormal, gp_Vec & ABiNormal);

		/****** GeomFill_Fixed::Intervals ******/
		/****** md5 signature: c706a9ee65ae76457235d7e55942295b ******/
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

		/****** GeomFill_Fixed::IsConstant ******/
		/****** md5 signature: f5b53cd348be55874964083dd4dc65d3 ******/
		%feature("compactdefaultargs") IsConstant;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return True.
") IsConstant;
		bool IsConstant();

		/****** GeomFill_Fixed::NbIntervals ******/
		/****** md5 signature: b2aaad8a5aa5a35490639df04a76a09e ******/
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
		int NbIntervals(const GeomAbs_Shape S);

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
		/****** md5 signature: e996bfd727b3dadff5915f33bbe45aa4 ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<GeomFill_TrihedronLaw>

Description
-----------
No available documentation.
") Copy;
		opencascade::handle<GeomFill_TrihedronLaw> Copy();

		/****** GeomFill_Frenet::D0 ******/
		/****** md5 signature: 1cb65c58de63b6db4989c7ec3f963ca2 ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
Param: double
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
		bool D0(const double Param, gp_Vec & Tangent, gp_Vec & Normal, gp_Vec & BiNormal);

		/****** GeomFill_Frenet::D1 ******/
		/****** md5 signature: 47c1538d0ec677ac915df0010cf7ff27 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
Param: double
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
		bool D1(const double Param, gp_Vec & Tangent, gp_Vec & DTangent, gp_Vec & Normal, gp_Vec & DNormal, gp_Vec & BiNormal, gp_Vec & DBiNormal);

		/****** GeomFill_Frenet::D2 ******/
		/****** md5 signature: 272044e0af3c48f99fd5128147f64ec6 ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
Param: double
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
compute Trihedron on curve first and second derivatives. Warning: It used only for C2 approximation.
") D2;
		bool D2(const double Param, gp_Vec & Tangent, gp_Vec & DTangent, gp_Vec & D2Tangent, gp_Vec & Normal, gp_Vec & DNormal, gp_Vec & D2Normal, gp_Vec & BiNormal, gp_Vec & DBiNormal, gp_Vec & D2BiNormal);

		/****** GeomFill_Frenet::GetAverageLaw ******/
		/****** md5 signature: c4ee07f959c21a608d68f8a824be1ce4 ******/
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
		void GetAverageLaw(gp_Vec & ATangent, gp_Vec & ANormal, gp_Vec & ABiNormal);

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
		/****** md5 signature: c706a9ee65ae76457235d7e55942295b ******/
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

		/****** GeomFill_Frenet::IsConstant ******/
		/****** md5 signature: f5b53cd348be55874964083dd4dc65d3 ******/
		%feature("compactdefaultargs") IsConstant;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Say if the law is Constant.
") IsConstant;
		bool IsConstant();

		/****** GeomFill_Frenet::IsOnlyBy3dCurve ******/
		/****** md5 signature: 9988eca8a8cb4fcfb146e32d43fec1e6 ******/
		%feature("compactdefaultargs") IsOnlyBy3dCurve;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return True.
") IsOnlyBy3dCurve;
		bool IsOnlyBy3dCurve();

		/****** GeomFill_Frenet::NbIntervals ******/
		/****** md5 signature: b2aaad8a5aa5a35490639df04a76a09e ******/
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
		int NbIntervals(const GeomAbs_Shape S);

		/****** GeomFill_Frenet::SetCurve ******/
		/****** md5 signature: 37bee98df2af32a57ea264837e484480 ******/
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
Return: true.
") SetCurve;
		bool SetCurve(const opencascade::handle<Adaptor3d_Curve> & C);

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
		/****** md5 signature: 5d3add4d75488e3c8b3809237fc7dec2 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
PTol: double

Return
-------
None

Description
-----------
Converts all curves to BSplineCurves. Set them to the common profile. Compute the surface (degv = 1). <PTol> is used to compare 2 knots.
") Perform;
		void Perform(const double PTol);

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
		/****** md5 signature: 9c12861c23e471e3c966806fde2621d9 ******/
		%feature("compactdefaultargs") GeomFill_LocationDraft;
		%feature("autodoc", "
Parameters
----------
Direction: gp_Dir
Angle: double

Return
-------
None

Description
-----------
No available documentation.
") GeomFill_LocationDraft;
		 GeomFill_LocationDraft(const gp_Dir & Direction, const double Angle);

		/****** GeomFill_LocationDraft::Copy ******/
		/****** md5 signature: 9afcda456c2238a16277f4973c632120 ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<GeomFill_LocationLaw>

Description
-----------
No available documentation.
") Copy;
		opencascade::handle<GeomFill_LocationLaw> Copy();

		/****** GeomFill_LocationDraft::D0 ******/
		/****** md5 signature: b6e365714d272bc8806abcc1d94c4a67 ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
Param: double
M: gp_Mat
V: gp_Vec

Return
-------
bool

Description
-----------
compute Location.
") D0;
		bool D0(const double Param, gp_Mat & M, gp_Vec & V);

		/****** GeomFill_LocationDraft::D0 ******/
		/****** md5 signature: 39e3aeea09812ec23338efd3e742c4f7 ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
Param: double
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
		bool D0(const double Param, gp_Mat & M, gp_Vec & V, TColgp_Array1OfPnt2d & Poles2d);

		/****** GeomFill_LocationDraft::D1 ******/
		/****** md5 signature: 6290e69091174c1c479d3585b2e66f57 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
Param: double
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
		bool D1(const double Param, gp_Mat & M, gp_Vec & V, gp_Mat & DM, gp_Vec & DV, TColgp_Array1OfPnt2d & Poles2d, TColgp_Array1OfVec2d & DPoles2d);

		/****** GeomFill_LocationDraft::D2 ******/
		/****** md5 signature: 5eef2b2ca9a6e2fa099666450057d256 ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
Param: double
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
compute location 2d points and associated first and second derivatives. Warning: It used only for C2 approximation.
") D2;
		bool D2(const double Param, gp_Mat & M, gp_Vec & V, gp_Mat & DM, gp_Vec & DV, gp_Mat & D2M, gp_Vec & D2V, TColgp_Array1OfPnt2d & Poles2d, TColgp_Array1OfVec2d & DPoles2d, TColgp_Array1OfVec2d & D2Poles2d);

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
		/****** md5 signature: 74cd3db64f284d74faf8e6f650fc7739 ******/
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
Get average value of M(t) and V(t) it is useful to make fast approximation of rational surfaces.
") GetAverageLaw;
		void GetAverageLaw(gp_Mat & AM, gp_Vec & AV);

		/****** GeomFill_LocationDraft::GetCurve ******/
		/****** md5 signature: 7574de48de8db57acc314a8e469d5b50 ******/
		%feature("compactdefaultargs") GetCurve;
		%feature("autodoc", "Return
-------
opencascade::handle<Adaptor3d_Curve>

Description
-----------
No available documentation.
") GetCurve;
		const opencascade::handle<Adaptor3d_Curve> & GetCurve();

		/****** GeomFill_LocationDraft::GetDomain ******/
		/****** md5 signature: bfa86e0764434924d787bb3e27f141fc ******/
		%feature("compactdefaultargs") GetDomain;
		%feature("autodoc", "
Parameters
----------

Return
-------
First: double
Last: double

Description
-----------
Gets the bounds of the function parametric domain. Warning: This domain it is not modified by the SetValue method.
") GetDomain;
		void GetDomain(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** GeomFill_LocationDraft::GetInterval ******/
		/****** md5 signature: e2b81769ee3831280356f9e3620377f9 ******/
		%feature("compactdefaultargs") GetInterval;
		%feature("autodoc", "
Parameters
----------

Return
-------
First: double
Last: double

Description
-----------
Gets the bounds of the parametric interval on the function.
") GetInterval;
		void GetInterval(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** GeomFill_LocationDraft::GetMaximalNorm ******/
		/****** md5 signature: 12228749eac2dbe6a52271c6b163d8fb ******/
		%feature("compactdefaultargs") GetMaximalNorm;
		%feature("autodoc", "Return
-------
double

Description
-----------
Get the maximum Norm of the matrix-location part. It is usful to find a good Tolerance to approx M(t).
") GetMaximalNorm;
		double GetMaximalNorm();

		/****** GeomFill_LocationDraft::HasFirstRestriction ******/
		/****** md5 signature: d5bcef2830e472841b09120adebb0888 ******/
		%feature("compactdefaultargs") HasFirstRestriction;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Say if the first restriction is defined in this class. If it is true the first element of poles array in D0,D1,D2... Correspond to this restriction. Returns false (default implementation).
") HasFirstRestriction;
		bool HasFirstRestriction();

		/****** GeomFill_LocationDraft::HasLastRestriction ******/
		/****** md5 signature: 7a5be36519a885180c098830111cb67a ******/
		%feature("compactdefaultargs") HasLastRestriction;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Say if the last restriction is defined in this class. If it is true the last element of poles array in D0,D1,D2... Correspond to this restriction. Returns false (default implementation).
") HasLastRestriction;
		bool HasLastRestriction();

		/****** GeomFill_LocationDraft::Intervals ******/
		/****** md5 signature: c706a9ee65ae76457235d7e55942295b ******/
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

		/****** GeomFill_LocationDraft::IsIntersec ******/
		/****** md5 signature: e5fc4733ac4db10d86ac695c113b27a8 ******/
		%feature("compactdefaultargs") IsIntersec;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Say if the generatrice interset the surface.
") IsIntersec;
		bool IsIntersec();

		/****** GeomFill_LocationDraft::IsRotation ******/
		/****** md5 signature: 0e95be8276d034f3444e4856c5d5b978 ******/
		%feature("compactdefaultargs") IsRotation;
		%feature("autodoc", "
Parameters
----------

Return
-------
Error: double

Description
-----------
Say if the Location Law, is a rotation of Location The default implementation is ' returns False '.
") IsRotation;
		bool IsRotation(Standard_Real &OutValue);

		/****** GeomFill_LocationDraft::IsTranslation ******/
		/****** md5 signature: 8d308dfdca297b9d2043b133aa5480a5 ******/
		%feature("compactdefaultargs") IsTranslation;
		%feature("autodoc", "
Parameters
----------

Return
-------
Error: double

Description
-----------
Say if the Location Law, is an translation of Location The default implementation is ' returns False '.
") IsTranslation;
		bool IsTranslation(Standard_Real &OutValue);

		/****** GeomFill_LocationDraft::NbIntervals ******/
		/****** md5 signature: b2aaad8a5aa5a35490639df04a76a09e ******/
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
Returnsthe number of intervals for continuity <S>. May be one if Continuity(me) >= <S>.
") NbIntervals;
		int NbIntervals(const GeomAbs_Shape S);

		/****** GeomFill_LocationDraft::Resolution ******/
		/****** md5 signature: 985d57b7b05696a0ab1baaf83d307882 ******/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "
Parameters
----------
Index: int
Tol: double

Return
-------
TolU: double
TolV: double

Description
-----------
Returns the resolutions in the sub-space 2d <Index> This information is useful to find a good tolerance in 2d approximation. Warning: Used only if Nb2dCurve > 0.
") Resolution;
		void Resolution(const int Index, const double Tol, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** GeomFill_LocationDraft::Rotation ******/
		/****** md5 signature: 065274d94845a992efbb74b03f65fae8 ******/
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
		void Rotation(gp_Pnt & Center);

		/****** GeomFill_LocationDraft::SetAngle ******/
		/****** md5 signature: ba2b03bf28ec10048167948ef997085a ******/
		%feature("compactdefaultargs") SetAngle;
		%feature("autodoc", "
Parameters
----------
Angle: double

Return
-------
None

Description
-----------
No available documentation.
") SetAngle;
		void SetAngle(const double Angle);

		/****** GeomFill_LocationDraft::SetCurve ******/
		/****** md5 signature: 37bee98df2af32a57ea264837e484480 ******/
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
Return: true in case if execution end correctly.
") SetCurve;
		bool SetCurve(const opencascade::handle<Adaptor3d_Curve> & C);

		/****** GeomFill_LocationDraft::SetInterval ******/
		/****** md5 signature: 56dbce7f545295f90d642a293e48bb2a ******/
		%feature("compactdefaultargs") SetInterval;
		%feature("autodoc", "
Parameters
----------
First: double
Last: double

Return
-------
None

Description
-----------
Sets the bounds of the parametric interval on the function This determines the derivatives in these values if the function is not Cn.
") SetInterval;
		void SetInterval(const double First, const double Last);

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
		/****** md5 signature: c81ceb20409df44332cc88e221ba8f7f ******/
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
		void SetTrsf(const gp_Mat & Transfo);

		/****** GeomFill_LocationDraft::TraceNumber ******/
		/****** md5 signature: 8574c85537c9363a71bccd952850f898 ******/
		%feature("compactdefaultargs") TraceNumber;
		%feature("autodoc", "Return
-------
int

Description
-----------
Give the number of trace (Curves 2d which are not restriction) Returns 1 (default implementation).
") TraceNumber;
		int TraceNumber();

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
		/****** md5 signature: 00b261121e90dcc19b161cd8625de54d ******/
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
		/****** md5 signature: 9afcda456c2238a16277f4973c632120 ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<GeomFill_LocationLaw>

Description
-----------
No available documentation.
") Copy;
		opencascade::handle<GeomFill_LocationLaw> Copy();

		/****** GeomFill_LocationGuide::D0 ******/
		/****** md5 signature: b6e365714d272bc8806abcc1d94c4a67 ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
Param: double
M: gp_Mat
V: gp_Vec

Return
-------
bool

Description
-----------
compute Location.
") D0;
		bool D0(const double Param, gp_Mat & M, gp_Vec & V);

		/****** GeomFill_LocationGuide::D0 ******/
		/****** md5 signature: 39e3aeea09812ec23338efd3e742c4f7 ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
Param: double
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
		bool D0(const double Param, gp_Mat & M, gp_Vec & V, TColgp_Array1OfPnt2d & Poles2d);

		/****** GeomFill_LocationGuide::D1 ******/
		/****** md5 signature: 6290e69091174c1c479d3585b2e66f57 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
Param: double
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
		bool D1(const double Param, gp_Mat & M, gp_Vec & V, gp_Mat & DM, gp_Vec & DV, TColgp_Array1OfPnt2d & Poles2d, TColgp_Array1OfVec2d & DPoles2d);

		/****** GeomFill_LocationGuide::D2 ******/
		/****** md5 signature: 5eef2b2ca9a6e2fa099666450057d256 ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
Param: double
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
compute location 2d points and associated first and second derivatives. Warning: It used only for C2 approximation.
") D2;
		bool D2(const double Param, gp_Mat & M, gp_Vec & V, gp_Mat & DM, gp_Vec & DV, gp_Mat & D2M, gp_Vec & D2V, TColgp_Array1OfPnt2d & Poles2d, TColgp_Array1OfVec2d & DPoles2d, TColgp_Array1OfVec2d & D2Poles2d);

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
		/****** md5 signature: 10706106a7ae4a0863f8842e860f21a7 ******/
		%feature("compactdefaultargs") ErrorStatus;
		%feature("autodoc", "Return
-------
GeomFill_PipeError

Description
-----------
Give a status to the Law Returns PipeOk (default implementation).
") ErrorStatus;
		GeomFill_PipeError ErrorStatus();

		/****** GeomFill_LocationGuide::GetAverageLaw ******/
		/****** md5 signature: 74cd3db64f284d74faf8e6f650fc7739 ******/
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
Get average value of M(t) and V(t) it is useful to make fast approximation of rational surfaces.
") GetAverageLaw;
		void GetAverageLaw(gp_Mat & AM, gp_Vec & AV);

		/****** GeomFill_LocationGuide::GetCurve ******/
		/****** md5 signature: 7574de48de8db57acc314a8e469d5b50 ******/
		%feature("compactdefaultargs") GetCurve;
		%feature("autodoc", "Return
-------
opencascade::handle<Adaptor3d_Curve>

Description
-----------
No available documentation.
") GetCurve;
		const opencascade::handle<Adaptor3d_Curve> & GetCurve();

		/****** GeomFill_LocationGuide::GetDomain ******/
		/****** md5 signature: bfa86e0764434924d787bb3e27f141fc ******/
		%feature("compactdefaultargs") GetDomain;
		%feature("autodoc", "
Parameters
----------

Return
-------
First: double
Last: double

Description
-----------
Gets the bounds of the function parametric domain. Warning: This domain it is not modified by the SetValue method.
") GetDomain;
		void GetDomain(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** GeomFill_LocationGuide::GetInterval ******/
		/****** md5 signature: e2b81769ee3831280356f9e3620377f9 ******/
		%feature("compactdefaultargs") GetInterval;
		%feature("autodoc", "
Parameters
----------

Return
-------
First: double
Last: double

Description
-----------
Gets the bounds of the parametric interval on the function.
") GetInterval;
		void GetInterval(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** GeomFill_LocationGuide::GetMaximalNorm ******/
		/****** md5 signature: 12228749eac2dbe6a52271c6b163d8fb ******/
		%feature("compactdefaultargs") GetMaximalNorm;
		%feature("autodoc", "Return
-------
double

Description
-----------
Get the maximum Norm of the matrix-location part. It is usful to find a good Tolerance to approx M(t).
") GetMaximalNorm;
		double GetMaximalNorm();

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
		/****** md5 signature: d5bcef2830e472841b09120adebb0888 ******/
		%feature("compactdefaultargs") HasFirstRestriction;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Say if the first restriction is defined in this class. If it is true the first element of poles array in D0,D1,D2... Correspond to this restriction. Returns false (default implementation).
") HasFirstRestriction;
		bool HasFirstRestriction();

		/****** GeomFill_LocationGuide::HasLastRestriction ******/
		/****** md5 signature: 7a5be36519a885180c098830111cb67a ******/
		%feature("compactdefaultargs") HasLastRestriction;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Say if the last restriction is defined in this class. If it is true the last element of poles array in D0,D1,D2... Correspond to this restriction. Returns false (default implementation).
") HasLastRestriction;
		bool HasLastRestriction();

		/****** GeomFill_LocationGuide::Intervals ******/
		/****** md5 signature: c706a9ee65ae76457235d7e55942295b ******/
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

		/****** GeomFill_LocationGuide::IsRotation ******/
		/****** md5 signature: 0e95be8276d034f3444e4856c5d5b978 ******/
		%feature("compactdefaultargs") IsRotation;
		%feature("autodoc", "
Parameters
----------

Return
-------
Error: double

Description
-----------
Say if the Location Law, is a rotation of Location The default implementation is ' returns False '.
") IsRotation;
		bool IsRotation(Standard_Real &OutValue);

		/****** GeomFill_LocationGuide::IsTranslation ******/
		/****** md5 signature: 8d308dfdca297b9d2043b133aa5480a5 ******/
		%feature("compactdefaultargs") IsTranslation;
		%feature("autodoc", "
Parameters
----------

Return
-------
Error: double

Description
-----------
Say if the Location Law, is an translation of Location The default implementation is ' returns False '.
") IsTranslation;
		bool IsTranslation(Standard_Real &OutValue);

		/****** GeomFill_LocationGuide::NbIntervals ******/
		/****** md5 signature: b2aaad8a5aa5a35490639df04a76a09e ******/
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
		int NbIntervals(const GeomAbs_Shape S);

		/****** GeomFill_LocationGuide::Resolution ******/
		/****** md5 signature: 985d57b7b05696a0ab1baaf83d307882 ******/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "
Parameters
----------
Index: int
Tol: double

Return
-------
TolU: double
TolV: double

Description
-----------
Returns the resolutions in the sub-space 2d <Index> This information is useful to find a good tolerance in 2d approximation. Warning: Used only if Nb2dCurve > 0.
") Resolution;
		void Resolution(const int Index, const double Tol, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** GeomFill_LocationGuide::Rotation ******/
		/****** md5 signature: 065274d94845a992efbb74b03f65fae8 ******/
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
		void Rotation(gp_Pnt & Center);

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
		/****** md5 signature: d11c08fc7a37bbc22d5db28ad360e995 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
Section: GeomFill_SectionLaw
rotat: bool
SFirst: double
SLast: double
PrecAngle: double

Return
-------
LastAngle: double

Description
-----------
No available documentation.
") Set;
		void Set(const opencascade::handle<GeomFill_SectionLaw> & Section, const bool rotat, const double SFirst, const double SLast, const double PrecAngle, Standard_Real &OutValue);

		/****** GeomFill_LocationGuide::SetCurve ******/
		/****** md5 signature: 37bee98df2af32a57ea264837e484480 ******/
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
Return: true.
") SetCurve;
		bool SetCurve(const opencascade::handle<Adaptor3d_Curve> & C);

		/****** GeomFill_LocationGuide::SetInterval ******/
		/****** md5 signature: 56dbce7f545295f90d642a293e48bb2a ******/
		%feature("compactdefaultargs") SetInterval;
		%feature("autodoc", "
Parameters
----------
First: double
Last: double

Return
-------
None

Description
-----------
Sets the bounds of the parametric interval on the function This determines the derivatives in these values if the function is not Cn.
") SetInterval;
		void SetInterval(const double First, const double Last);

		/****** GeomFill_LocationGuide::SetOrigine ******/
		/****** md5 signature: e50d68e37f4192eee5314620f9724ec8 ******/
		%feature("compactdefaultargs") SetOrigine;
		%feature("autodoc", "
Parameters
----------
Param1: double
Param2: double

Return
-------
None

Description
-----------
No available documentation.
") SetOrigine;
		void SetOrigine(const double Param1, const double Param2);

		/****** GeomFill_LocationGuide::SetTolerance ******/
		/****** md5 signature: 29c79f73c127702faa370cb75cf828a6 ******/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "
Parameters
----------
Tol3d: double
Tol2d: double

Return
-------
None

Description
-----------
Is useful, if (me) have to run numerical algorithm to perform D0, D1 or D2 The default implementation make nothing.
") SetTolerance;
		void SetTolerance(const double Tol3d, const double Tol2d);

		/****** GeomFill_LocationGuide::SetTrsf ******/
		/****** md5 signature: c81ceb20409df44332cc88e221ba8f7f ******/
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
		void SetTrsf(const gp_Mat & Transfo);

		/****** GeomFill_LocationGuide::TraceNumber ******/
		/****** md5 signature: 8574c85537c9363a71bccd952850f898 ******/
		%feature("compactdefaultargs") TraceNumber;
		%feature("autodoc", "Return
-------
int

Description
-----------
Give the number of trace (Curves 2d which are not restriction) Returns 1 (default implementation).
") TraceNumber;
		int TraceNumber();

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
		/****** md5 signature: 722cc51fcce37557a6d9d59f0e362d19 ******/
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
		/****** md5 signature: 0e48b5d6f3d32414194bed5b82b81a89 ******/
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
		/****** md5 signature: 154865ec84a95ffa39ef7c7c92b543c2 ******/
		%feature("compactdefaultargs") GeomFill_NSections;
		%feature("autodoc", "
Parameters
----------
NC: TColGeom_SequenceOfCurve
NP: TColStd_SequenceOfReal
UF: double
UL: double

Return
-------
None

Description
-----------
Make a SectionLaw with N Curves and N associated parameters. UF and UL are the parametric bounds of the NSections.
") GeomFill_NSections;
		 GeomFill_NSections(const TColGeom_SequenceOfCurve & NC, const TColStd_SequenceOfReal & NP, const double UF, const double UL);

		/****** GeomFill_NSections::GeomFill_NSections ******/
		/****** md5 signature: 82bd347d1c0ba0df485822a4248afdc5 ******/
		%feature("compactdefaultargs") GeomFill_NSections;
		%feature("autodoc", "
Parameters
----------
NC: TColGeom_SequenceOfCurve
NP: TColStd_SequenceOfReal
UF: double
UL: double
VF: double
VL: double

Return
-------
None

Description
-----------
Make a SectionLaw with N Curves and N associated parameters. UF and UL are the parametric bounds of the NSections VF and VL are the parametric bounds of the path.
") GeomFill_NSections;
		 GeomFill_NSections(const TColGeom_SequenceOfCurve & NC, const TColStd_SequenceOfReal & NP, const double UF, const double UL, const double VF, const double VL);

		/****** GeomFill_NSections::GeomFill_NSections ******/
		/****** md5 signature: 4e8d8aa0a73d40dedc1ccede45163705 ******/
		%feature("compactdefaultargs") GeomFill_NSections;
		%feature("autodoc", "
Parameters
----------
NC: TColGeom_SequenceOfCurve
Trsfs: NCollection_Sequence<gp_Trsf>
NP: TColStd_SequenceOfReal
UF: double
UL: double
VF: double
VL: double
Surf: Geom_BSplineSurface

Return
-------
None

Description
-----------
Make a SectionLaw with N Curves and N associated parameters. UF and UL are the parametric bounds of the NSections VF and VL are the parametric bounds of the path UF and UL are the parametric bounds of the NSections Surf is a reference surface used by BRepFill_NSections.
") GeomFill_NSections;
		 GeomFill_NSections(const TColGeom_SequenceOfCurve & NC, const NCollection_Sequence<gp_Trsf> & Trsfs, const TColStd_SequenceOfReal & NP, const double UF, const double UL, const double VF, const double VL, const opencascade::handle<Geom_BSplineSurface> & Surf);

		/****** GeomFill_NSections::BSplineSurface ******/
		/****** md5 signature: 85e540db90b0592d3353f7488876979d ******/
		%feature("compactdefaultargs") BSplineSurface;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_BSplineSurface>

Description
-----------
give if possible an bspline Surface, like iso-v are the section. If it is not possible this methode have to get an Null Surface. Is it the default implementation.
") BSplineSurface;
		opencascade::handle<Geom_BSplineSurface> BSplineSurface();

		/****** GeomFill_NSections::BarycentreOfSurf ******/
		/****** md5 signature: 1f25b0eb1d890895eb1250cc0c28882b ******/
		%feature("compactdefaultargs") BarycentreOfSurf;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Get the barycentre of Surface. An very poor estimation is sufficient. This information is useful to perform well conditioned rational approximation. Warning: Used only if <self> IsRational.
") BarycentreOfSurf;
		gp_Pnt BarycentreOfSurf();

		/****** GeomFill_NSections::CirclSection ******/
		/****** md5 signature: 4d7f50f79bdc25c92cc71ac2b15121eb ******/
		%feature("compactdefaultargs") CirclSection;
		%feature("autodoc", "
Parameters
----------
Param: double

Return
-------
opencascade::handle<Geom_Curve>

Description
-----------
Return the circle section at parameter <Param>, if <self> a IsConicalLaw.
") CirclSection;
		opencascade::handle<Geom_Curve> CirclSection(const double Param);

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
		/****** md5 signature: a5ec605c1a1c6c96ce233c046fae7878 ******/
		%feature("compactdefaultargs") ConstantSection;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Curve>

Description
-----------
Return the constant Section if <self> IsConstant.
") ConstantSection;
		opencascade::handle<Geom_Curve> ConstantSection();

		/****** GeomFill_NSections::D0 ******/
		/****** md5 signature: b4f4bc7aa9799f6d8cf914bb0136734c ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
Param: double
Poles: TColgp_Array1OfPnt
Weigths: TColStd_Array1OfReal

Return
-------
bool

Description
-----------
compute the section for v = param.
") D0;
		bool D0(const double Param, TColgp_Array1OfPnt & Poles, TColStd_Array1OfReal & Weigths);

		/****** GeomFill_NSections::D1 ******/
		/****** md5 signature: 8b4c1258777be50399d42a2a43e78f30 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
Param: double
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
		bool D1(const double Param, TColgp_Array1OfPnt & Poles, TColgp_Array1OfVec & DPoles, TColStd_Array1OfReal & Weigths, TColStd_Array1OfReal & DWeigths);

		/****** GeomFill_NSections::D2 ******/
		/****** md5 signature: 60c74a1a2be1793f26f242c7eab4c72b ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
Param: double
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
		bool D2(const double Param, TColgp_Array1OfPnt & Poles, TColgp_Array1OfVec & DPoles, TColgp_Array1OfVec & D2Poles, TColStd_Array1OfReal & Weigths, TColStd_Array1OfReal & DWeigths, TColStd_Array1OfReal & D2Weigths);

		/****** GeomFill_NSections::GetDomain ******/
		/****** md5 signature: bfa86e0764434924d787bb3e27f141fc ******/
		%feature("compactdefaultargs") GetDomain;
		%feature("autodoc", "
Parameters
----------

Return
-------
First: double
Last: double

Description
-----------
Gets the bounds of the function parametric domain. Warning: This domain it is not modified by the SetValue method.
") GetDomain;
		void GetDomain(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** GeomFill_NSections::GetInterval ******/
		/****** md5 signature: e2b81769ee3831280356f9e3620377f9 ******/
		%feature("compactdefaultargs") GetInterval;
		%feature("autodoc", "
Parameters
----------

Return
-------
First: double
Last: double

Description
-----------
Gets the bounds of the parametric interval on the function.
") GetInterval;
		void GetInterval(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** GeomFill_NSections::GetMinimalWeight ******/
		/****** md5 signature: 6484606f629c915e24cdd616ac007d67 ******/
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
		void GetMinimalWeight(TColStd_Array1OfReal & Weigths);

		/****** GeomFill_NSections::GetTolerance ******/
		/****** md5 signature: 217050fdab79b8e071e91271c92a3488 ******/
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "
Parameters
----------
BoundTol: double
SurfTol: double
AngleTol: double
Tol3d: TColStd_Array1OfReal

Return
-------
None

Description
-----------
Returns the tolerances associated at each poles to reach in approximation, to satisfy: BoundTol error at the Boundary AngleTol tangent error at the Boundary (in radian) SurfTol error inside the surface.
") GetTolerance;
		void GetTolerance(const double BoundTol, const double SurfTol, const double AngleTol, TColStd_Array1OfReal & Tol3d);

		/****** GeomFill_NSections::Intervals ******/
		/****** md5 signature: c706a9ee65ae76457235d7e55942295b ******/
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

		/****** GeomFill_NSections::IsConicalLaw ******/
		/****** md5 signature: 7c6ffcfff6fc31053b18731c93fb9fd6 ******/
		%feature("compactdefaultargs") IsConicalLaw;
		%feature("autodoc", "
Parameters
----------

Return
-------
Error: double

Description
-----------
Returns True if all section are circle, with same plane,same center and linear radius evolution Return False by Default.
") IsConicalLaw;
		bool IsConicalLaw(Standard_Real &OutValue);

		/****** GeomFill_NSections::IsConstant ******/
		/****** md5 signature: c82837d7304e800e44d99ab714692b7e ******/
		%feature("compactdefaultargs") IsConstant;
		%feature("autodoc", "
Parameters
----------

Return
-------
Error: double

Description
-----------
return True If the Law isConstant.
") IsConstant;
		bool IsConstant(Standard_Real &OutValue);

		/****** GeomFill_NSections::IsRational ******/
		/****** md5 signature: 43e7b94be36c1d44222e606d2d075195 ******/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns if the sections are rational or not.
") IsRational;
		bool IsRational();

		/****** GeomFill_NSections::IsUPeriodic ******/
		/****** md5 signature: 7236661160e2b4989ea98f769e60fafb ******/
		%feature("compactdefaultargs") IsUPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns if the sections are periodic or not.
") IsUPeriodic;
		bool IsUPeriodic();

		/****** GeomFill_NSections::IsVPeriodic ******/
		/****** md5 signature: 0654a6d88753f46bfbed67995e913efa ******/
		%feature("compactdefaultargs") IsVPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns if the law isperiodic or not.
") IsVPeriodic;
		bool IsVPeriodic();

		/****** GeomFill_NSections::Knots ******/
		/****** md5 signature: 359ac10e91186ab2f75e6163036a99fe ******/
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
		void Knots(TColStd_Array1OfReal & TKnots);

		/****** GeomFill_NSections::MaximalSection ******/
		/****** md5 signature: 1811db5e3dd550ab78611f3959bb8ecf ******/
		%feature("compactdefaultargs") MaximalSection;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the length of the greater section. This information is useful to G1's control. Warning: With an little value, approximation can be slower.
") MaximalSection;
		double MaximalSection();

		/****** GeomFill_NSections::Mults ******/
		/****** md5 signature: 2c8f8c7780e1bd71859fc4a6b9500baf ******/
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
		void Mults(TColStd_Array1OfInteger & TMults);

		/****** GeomFill_NSections::NbIntervals ******/
		/****** md5 signature: b2aaad8a5aa5a35490639df04a76a09e ******/
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
		int NbIntervals(const GeomAbs_Shape S);

		/****** GeomFill_NSections::SectionShape ******/
		/****** md5 signature: a753d69cb00f0b8439b79ce3401bb770 ******/
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
		void SectionShape(Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****** GeomFill_NSections::SetInterval ******/
		/****** md5 signature: 56dbce7f545295f90d642a293e48bb2a ******/
		%feature("compactdefaultargs") SetInterval;
		%feature("autodoc", "
Parameters
----------
First: double
Last: double

Return
-------
None

Description
-----------
Sets the bounds of the parametric interval on the function This determines the derivatives in these values if the function is not Cn.
") SetInterval;
		void SetInterval(const double First, const double Last);

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
		/****** md5 signature: 69087e6b52c14b4324e2feee990d6fad ******/
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
		/****** md5 signature: 0c997620b63f032cdc3c9768bd4c0468 ******/
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
		/****** md5 signature: 1409aa7d3c6d4a60d7296e5e33b0a897 ******/
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
		/****** md5 signature: c97ecd3448979bfdcc4ae03690c0dd00 ******/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "
Parameters
----------
P: int

Return
-------
double

Description
-----------
Returns the parameter of Section<P>, to impose it for the approximation.
") Parameter;
		double Parameter(const int P);

		/****** GeomFill_SectionGenerator::Section ******/
		/****** md5 signature: 49bf9c0e2e821203e5bc4d2458f9b0a0 ******/
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
Used for the first and last section The method returns true if the derivatives are computed, otherwise it returns false.
") Section;
		bool Section(const int P, TColgp_Array1OfPnt & Poles, TColgp_Array1OfVec & DPoles, TColgp_Array1OfPnt2d & Poles2d, TColgp_Array1OfVec2d & DPoles2d, TColStd_Array1OfReal & Weigths, TColStd_Array1OfReal & DWeigths);

		/****** GeomFill_SectionGenerator::Section ******/
		/****** md5 signature: c05986f07c8e6cc7729eaed10bcb3f5b ******/
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
		void Section(const int P, TColgp_Array1OfPnt & Poles, TColgp_Array1OfPnt2d & Poles2d, TColStd_Array1OfReal & Weigths);

		/****** GeomFill_SectionGenerator::SetParam ******/
		/****** md5 signature: 4818a41f5b89c515200259b69e9d4d39 ******/
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
		/****** md5 signature: bc93b7a98ae0d90fefc5019166cb0221 ******/
		%feature("compactdefaultargs") GeomFill_SimpleBound;
		%feature("autodoc", "
Parameters
----------
Curve: Adaptor3d_Curve
Tol3d: double
Tolang: double

Return
-------
None

Description
-----------
Constructs the boundary object defined by the 3d curve. The surface to be built along this boundary will be in the tolerance range defined by Tol3d. This object is to be used as a boundary for a GeomFill_ConstrainedFilling framework. Dummy is initialized but has no function in this class. Warning Curve is an adapted curve, that is, an object which is an interface between: - the services provided by a 3D curve from the package Geom - and those required of the curve by the computation algorithm which uses it. The adapted curve is created in one of the following ways: - First sequence: opencascade::handle<Geom_Curve> myCurve = ... ; opencascade::handle<GeomAdaptor_Curve> Curve = new GeomAdaptor_Curve(myCurve); - Second sequence: // Step 1 opencascade::handle<Geom_Curve> myCurve = ... ; GeomAdaptor_Curve Crv (myCurve); // Step 2 opencascade::handle<GeomAdaptor_Curve> Curve = new GeomAdaptor_Curve(Crv); You use the second part of this sequence if you already have the adapted curve Crv. The boundary is then constructed with the Curve object: double Tol = ... ; double dummy = 0. ; myBoundary = GeomFill_SimpleBound (Curve,Tol,dummy);.
") GeomFill_SimpleBound;
		 GeomFill_SimpleBound(const opencascade::handle<Adaptor3d_Curve> & Curve, const double Tol3d, const double Tolang);

		/****** GeomFill_SimpleBound::Bounds ******/
		/****** md5 signature: c66f21e8fd3471d5d9f2d6d787519094 ******/
		%feature("compactdefaultargs") Bounds;
		%feature("autodoc", "
Parameters
----------

Return
-------
First: double
Last: double

Description
-----------
No available documentation.
") Bounds;
		void Bounds(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** GeomFill_SimpleBound::D1 ******/
		/****** md5 signature: 5cdfb5e36b431127fc299906b28f9747 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
U: double
P: gp_Pnt
V: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") D1;
		void D1(const double U, gp_Pnt & P, gp_Vec & V);

		/****** GeomFill_SimpleBound::IsDegenerated ******/
		/****** md5 signature: 880db9d1e734f87b6562fbc82eb08f69 ******/
		%feature("compactdefaultargs") IsDegenerated;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsDegenerated;
		bool IsDegenerated();

		/****** GeomFill_SimpleBound::Reparametrize ******/
		/****** md5 signature: 845652cf954c1dcddd95050e5f3e838e ******/
		%feature("compactdefaultargs") Reparametrize;
		%feature("autodoc", "
Parameters
----------
First: double
Last: double
HasDF: bool
HasDL: bool
DF: double
DL: double
Rev: bool

Return
-------
None

Description
-----------
No available documentation.
") Reparametrize;
		void Reparametrize(const double First, const double Last, const bool HasDF, const bool HasDL, const double DF, const double DL, const bool Rev);

		/****** GeomFill_SimpleBound::Value ******/
		/****** md5 signature: a4e8c285909e15ba4e4166c6ecbebc1a ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
U: double

Return
-------
gp_Pnt

Description
-----------
No available documentation.
") Value;
		gp_Pnt Value(const double U);

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
		/****** md5 signature: e8bbc349f13a627788cb0e5dabc40d65 ******/
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
		/****** md5 signature: 2383b7cf64838c2903175dbe20d33736 ******/
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
		/****** md5 signature: bad17724c105204630777579ecc2c0cc ******/
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
		/****** md5 signature: 79203b6c8adc2ad0350759ee3d194c9e ******/
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
		/****** md5 signature: 9d8e736b19b1b2ea78d402e717f613b0 ******/
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
		 GeomFill_TgtOnCoons(const opencascade::handle<GeomFill_CoonsAlgPatch> & K, const int I);

		/****** GeomFill_TgtOnCoons::D1 ******/
		/****** md5 signature: 31eec1555701b36c29c0ab77760b7180 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
W: double

Return
-------
gp_Vec

Description
-----------
Computes the derivative of the field of tangency at parameter W.
") D1;
		gp_Vec D1(const double W);

		/****** GeomFill_TgtOnCoons::D1 ******/
		/****** md5 signature: 79de118f91ae9aea3cf39ee571d4fc11 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
W: double
T: gp_Vec
DT: gp_Vec

Return
-------
None

Description
-----------
Computes the value and the derivative of the field of tangency at parameter W.
") D1;
		void D1(const double W, gp_Vec & T, gp_Vec & DT);

		/****** GeomFill_TgtOnCoons::Value ******/
		/****** md5 signature: b893662159928a662b0573f7c1ce0de5 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
W: double

Return
-------
gp_Vec

Description
-----------
Computes the value of the field of tangency at parameter W.
") Value;
		gp_Vec Value(const double W);

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
		/****** md5 signature: 21f5af1a87cbadcd98ea71aa6642b60b ******/
		%feature("compactdefaultargs") Origine;
		%feature("autodoc", "
Parameters
----------
Param1: double
Param2: double

Return
-------
None

Description
-----------
No available documentation.
") Origine;
		virtual void Origine(const double Param1, const double Param2);

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
		/****** md5 signature: 077c70a47b7a91f1e1b4564ceaee012e ******/
		%feature("compactdefaultargs") GeomFill_UniformSection;
		%feature("autodoc", "
Parameters
----------
C: Geom_Curve
FirstParameter: double (optional, default to 0.0)
LastParameter: double (optional, default to 1.0)

Return
-------
None

Description
-----------
Make an constant Law with C. [First, Last] define law definition domain.
") GeomFill_UniformSection;
		 GeomFill_UniformSection(const opencascade::handle<Geom_Curve> & C, const double FirstParameter = 0.0, const double LastParameter = 1.0);

		/****** GeomFill_UniformSection::BSplineSurface ******/
		/****** md5 signature: 85e540db90b0592d3353f7488876979d ******/
		%feature("compactdefaultargs") BSplineSurface;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_BSplineSurface>

Description
-----------
give if possible an bspline Surface, like iso-v are the section. If it is not possible this method have to get an Null Surface. Is it the default implementation.
") BSplineSurface;
		opencascade::handle<Geom_BSplineSurface> BSplineSurface();

		/****** GeomFill_UniformSection::BarycentreOfSurf ******/
		/****** md5 signature: 1f25b0eb1d890895eb1250cc0c28882b ******/
		%feature("compactdefaultargs") BarycentreOfSurf;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Get the barycentre of Surface. An very poor estimation is sufficient. This information is useful to perform well conditioned rational approximation. Warning: Used only if <self> IsRational.
") BarycentreOfSurf;
		gp_Pnt BarycentreOfSurf();

		/****** GeomFill_UniformSection::ConstantSection ******/
		/****** md5 signature: a5ec605c1a1c6c96ce233c046fae7878 ******/
		%feature("compactdefaultargs") ConstantSection;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Curve>

Description
-----------
Return the constant Section if <self> IsConstant.
") ConstantSection;
		opencascade::handle<Geom_Curve> ConstantSection();

		/****** GeomFill_UniformSection::D0 ******/
		/****** md5 signature: b4f4bc7aa9799f6d8cf914bb0136734c ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
Param: double
Poles: TColgp_Array1OfPnt
Weigths: TColStd_Array1OfReal

Return
-------
bool

Description
-----------
compute the section for v = param.
") D0;
		bool D0(const double Param, TColgp_Array1OfPnt & Poles, TColStd_Array1OfReal & Weigths);

		/****** GeomFill_UniformSection::D1 ******/
		/****** md5 signature: 8b4c1258777be50399d42a2a43e78f30 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
Param: double
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
		bool D1(const double Param, TColgp_Array1OfPnt & Poles, TColgp_Array1OfVec & DPoles, TColStd_Array1OfReal & Weigths, TColStd_Array1OfReal & DWeigths);

		/****** GeomFill_UniformSection::D2 ******/
		/****** md5 signature: 60c74a1a2be1793f26f242c7eab4c72b ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
Param: double
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
		bool D2(const double Param, TColgp_Array1OfPnt & Poles, TColgp_Array1OfVec & DPoles, TColgp_Array1OfVec & D2Poles, TColStd_Array1OfReal & Weigths, TColStd_Array1OfReal & DWeigths, TColStd_Array1OfReal & D2Weigths);

		/****** GeomFill_UniformSection::GetDomain ******/
		/****** md5 signature: bfa86e0764434924d787bb3e27f141fc ******/
		%feature("compactdefaultargs") GetDomain;
		%feature("autodoc", "
Parameters
----------

Return
-------
First: double
Last: double

Description
-----------
Gets the bounds of the function parametric domain. Warning: This domain it is not modified by the SetValue method.
") GetDomain;
		void GetDomain(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** GeomFill_UniformSection::GetInterval ******/
		/****** md5 signature: e2b81769ee3831280356f9e3620377f9 ******/
		%feature("compactdefaultargs") GetInterval;
		%feature("autodoc", "
Parameters
----------

Return
-------
First: double
Last: double

Description
-----------
Gets the bounds of the parametric interval on the function.
") GetInterval;
		void GetInterval(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** GeomFill_UniformSection::GetMinimalWeight ******/
		/****** md5 signature: 6484606f629c915e24cdd616ac007d67 ******/
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
		void GetMinimalWeight(TColStd_Array1OfReal & Weigths);

		/****** GeomFill_UniformSection::GetTolerance ******/
		/****** md5 signature: 217050fdab79b8e071e91271c92a3488 ******/
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "
Parameters
----------
BoundTol: double
SurfTol: double
AngleTol: double
Tol3d: TColStd_Array1OfReal

Return
-------
None

Description
-----------
Returns the tolerances associated at each poles to reach in approximation, to satisfy: BoundTol error at the Boundary AngleTol tangent error at the Boundary (in radian) SurfTol error inside the surface.
") GetTolerance;
		void GetTolerance(const double BoundTol, const double SurfTol, const double AngleTol, TColStd_Array1OfReal & Tol3d);

		/****** GeomFill_UniformSection::Intervals ******/
		/****** md5 signature: c706a9ee65ae76457235d7e55942295b ******/
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

		/****** GeomFill_UniformSection::IsConstant ******/
		/****** md5 signature: c82837d7304e800e44d99ab714692b7e ******/
		%feature("compactdefaultargs") IsConstant;
		%feature("autodoc", "
Parameters
----------

Return
-------
Error: double

Description
-----------
return True.
") IsConstant;
		bool IsConstant(Standard_Real &OutValue);

		/****** GeomFill_UniformSection::IsRational ******/
		/****** md5 signature: 43e7b94be36c1d44222e606d2d075195 ******/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns if the sections are rational or not.
") IsRational;
		bool IsRational();

		/****** GeomFill_UniformSection::IsUPeriodic ******/
		/****** md5 signature: 7236661160e2b4989ea98f769e60fafb ******/
		%feature("compactdefaultargs") IsUPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns if the sections are periodic or not.
") IsUPeriodic;
		bool IsUPeriodic();

		/****** GeomFill_UniformSection::IsVPeriodic ******/
		/****** md5 signature: 0654a6d88753f46bfbed67995e913efa ******/
		%feature("compactdefaultargs") IsVPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns if the law isperiodic or not.
") IsVPeriodic;
		bool IsVPeriodic();

		/****** GeomFill_UniformSection::Knots ******/
		/****** md5 signature: 359ac10e91186ab2f75e6163036a99fe ******/
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
		void Knots(TColStd_Array1OfReal & TKnots);

		/****** GeomFill_UniformSection::MaximalSection ******/
		/****** md5 signature: 1811db5e3dd550ab78611f3959bb8ecf ******/
		%feature("compactdefaultargs") MaximalSection;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the length of the greater section. This information is useful to G1's control. Warning: With an little value, approximation can be slower.
") MaximalSection;
		double MaximalSection();

		/****** GeomFill_UniformSection::Mults ******/
		/****** md5 signature: 2c8f8c7780e1bd71859fc4a6b9500baf ******/
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
		void Mults(TColStd_Array1OfInteger & TMults);

		/****** GeomFill_UniformSection::NbIntervals ******/
		/****** md5 signature: b2aaad8a5aa5a35490639df04a76a09e ******/
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
		int NbIntervals(const GeomAbs_Shape S);

		/****** GeomFill_UniformSection::SectionShape ******/
		/****** md5 signature: a753d69cb00f0b8439b79ce3401bb770 ******/
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
		void SectionShape(Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****** GeomFill_UniformSection::SetInterval ******/
		/****** md5 signature: 56dbce7f545295f90d642a293e48bb2a ******/
		%feature("compactdefaultargs") SetInterval;
		%feature("autodoc", "
Parameters
----------
First: double
Last: double

Return
-------
None

Description
-----------
Sets the bounds of the parametric interval on the function This determines the derivatives in these values if the function is not Cn.
") SetInterval;
		void SetInterval(const double First, const double Last);

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
		/****** md5 signature: e996bfd727b3dadff5915f33bbe45aa4 ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<GeomFill_TrihedronLaw>

Description
-----------
No available documentation.
") Copy;
		opencascade::handle<GeomFill_TrihedronLaw> Copy();

		/****** GeomFill_GuideTrihedronAC::D0 ******/
		/****** md5 signature: 1cb65c58de63b6db4989c7ec3f963ca2 ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
Param: double
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
		bool D0(const double Param, gp_Vec & Tangent, gp_Vec & Normal, gp_Vec & BiNormal);

		/****** GeomFill_GuideTrihedronAC::D1 ******/
		/****** md5 signature: 47c1538d0ec677ac915df0010cf7ff27 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
Param: double
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
		bool D1(const double Param, gp_Vec & Tangent, gp_Vec & DTangent, gp_Vec & Normal, gp_Vec & DNormal, gp_Vec & BiNormal, gp_Vec & DBiNormal);

		/****** GeomFill_GuideTrihedronAC::D2 ******/
		/****** md5 signature: 272044e0af3c48f99fd5128147f64ec6 ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
Param: double
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
		bool D2(const double Param, gp_Vec & Tangent, gp_Vec & DTangent, gp_Vec & D2Tangent, gp_Vec & Normal, gp_Vec & DNormal, gp_Vec & D2Normal, gp_Vec & BiNormal, gp_Vec & DBiNormal, gp_Vec & D2BiNormal);

		/****** GeomFill_GuideTrihedronAC::GetAverageLaw ******/
		/****** md5 signature: c4ee07f959c21a608d68f8a824be1ce4 ******/
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
Get average value of M(t) and V(t) it is useful to make fast approximation of rational surfaces.
") GetAverageLaw;
		void GetAverageLaw(gp_Vec & ATangent, gp_Vec & ANormal, gp_Vec & ABiNormal);

		/****** GeomFill_GuideTrihedronAC::Guide ******/
		/****** md5 signature: 6dcd899d246a681548f2f28e4ee66a31 ******/
		%feature("compactdefaultargs") Guide;
		%feature("autodoc", "Return
-------
opencascade::handle<Adaptor3d_Curve>

Description
-----------
No available documentation.
") Guide;
		opencascade::handle<Adaptor3d_Curve> Guide();

		/****** GeomFill_GuideTrihedronAC::Intervals ******/
		/****** md5 signature: c706a9ee65ae76457235d7e55942295b ******/
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

		/****** GeomFill_GuideTrihedronAC::IsConstant ******/
		/****** md5 signature: f5b53cd348be55874964083dd4dc65d3 ******/
		%feature("compactdefaultargs") IsConstant;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Say if the law is Constant.
") IsConstant;
		bool IsConstant();

		/****** GeomFill_GuideTrihedronAC::IsOnlyBy3dCurve ******/
		/****** md5 signature: 9988eca8a8cb4fcfb146e32d43fec1e6 ******/
		%feature("compactdefaultargs") IsOnlyBy3dCurve;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Say if the law is defined, only by the 3d Geometry of the set Curve Return False by Default.
") IsOnlyBy3dCurve;
		bool IsOnlyBy3dCurve();

		/****** GeomFill_GuideTrihedronAC::NbIntervals ******/
		/****** md5 signature: b2aaad8a5aa5a35490639df04a76a09e ******/
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
		int NbIntervals(const GeomAbs_Shape S);

		/****** GeomFill_GuideTrihedronAC::Origine ******/
		/****** md5 signature: c21507f639bcb407875ae18045b8ecc0 ******/
		%feature("compactdefaultargs") Origine;
		%feature("autodoc", "
Parameters
----------
OrACR1: double
OrACR2: double

Return
-------
None

Description
-----------
No available documentation.
") Origine;
		void Origine(const double OrACR1, const double OrACR2);

		/****** GeomFill_GuideTrihedronAC::SetCurve ******/
		/****** md5 signature: 37bee98df2af32a57ea264837e484480 ******/
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
Return: true.
") SetCurve;
		bool SetCurve(const opencascade::handle<Adaptor3d_Curve> & C);

		/****** GeomFill_GuideTrihedronAC::SetInterval ******/
		/****** md5 signature: 56dbce7f545295f90d642a293e48bb2a ******/
		%feature("compactdefaultargs") SetInterval;
		%feature("autodoc", "
Parameters
----------
First: double
Last: double

Return
-------
None

Description
-----------
Sets the bounds of the parametric interval on the function This determines the derivatives in these values if the function is not Cn.
") SetInterval;
		void SetInterval(const double First, const double Last);

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
		/****** md5 signature: e996bfd727b3dadff5915f33bbe45aa4 ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<GeomFill_TrihedronLaw>

Description
-----------
No available documentation.
") Copy;
		opencascade::handle<GeomFill_TrihedronLaw> Copy();

		/****** GeomFill_GuideTrihedronPlan::D0 ******/
		/****** md5 signature: 1cb65c58de63b6db4989c7ec3f963ca2 ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
Param: double
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
		bool D0(const double Param, gp_Vec & Tangent, gp_Vec & Normal, gp_Vec & BiNormal);

		/****** GeomFill_GuideTrihedronPlan::D1 ******/
		/****** md5 signature: 47c1538d0ec677ac915df0010cf7ff27 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
Param: double
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
		bool D1(const double Param, gp_Vec & Tangent, gp_Vec & DTangent, gp_Vec & Normal, gp_Vec & DNormal, gp_Vec & BiNormal, gp_Vec & DBiNormal);

		/****** GeomFill_GuideTrihedronPlan::D2 ******/
		/****** md5 signature: 272044e0af3c48f99fd5128147f64ec6 ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
Param: double
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
		bool D2(const double Param, gp_Vec & Tangent, gp_Vec & DTangent, gp_Vec & D2Tangent, gp_Vec & Normal, gp_Vec & DNormal, gp_Vec & D2Normal, gp_Vec & BiNormal, gp_Vec & DBiNormal, gp_Vec & D2BiNormal);

		/****** GeomFill_GuideTrihedronPlan::ErrorStatus ******/
		/****** md5 signature: 10706106a7ae4a0863f8842e860f21a7 ******/
		%feature("compactdefaultargs") ErrorStatus;
		%feature("autodoc", "Return
-------
GeomFill_PipeError

Description
-----------
Give a status to the Law Returns PipeOk (default implementation).
") ErrorStatus;
		GeomFill_PipeError ErrorStatus();

		/****** GeomFill_GuideTrihedronPlan::GetAverageLaw ******/
		/****** md5 signature: c4ee07f959c21a608d68f8a824be1ce4 ******/
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
Get average value of M(t) and V(t) it is useful to make fast approximation of rational surfaces.
") GetAverageLaw;
		void GetAverageLaw(gp_Vec & ATangent, gp_Vec & ANormal, gp_Vec & ABiNormal);

		/****** GeomFill_GuideTrihedronPlan::Guide ******/
		/****** md5 signature: 6dcd899d246a681548f2f28e4ee66a31 ******/
		%feature("compactdefaultargs") Guide;
		%feature("autodoc", "Return
-------
opencascade::handle<Adaptor3d_Curve>

Description
-----------
No available documentation.
") Guide;
		opencascade::handle<Adaptor3d_Curve> Guide();

		/****** GeomFill_GuideTrihedronPlan::Intervals ******/
		/****** md5 signature: c706a9ee65ae76457235d7e55942295b ******/
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

		/****** GeomFill_GuideTrihedronPlan::IsConstant ******/
		/****** md5 signature: f5b53cd348be55874964083dd4dc65d3 ******/
		%feature("compactdefaultargs") IsConstant;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Say if the law is Constant.
") IsConstant;
		bool IsConstant();

		/****** GeomFill_GuideTrihedronPlan::IsOnlyBy3dCurve ******/
		/****** md5 signature: 9988eca8a8cb4fcfb146e32d43fec1e6 ******/
		%feature("compactdefaultargs") IsOnlyBy3dCurve;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Say if the law is defined, only by the 3d Geometry of the set Curve Return False by Default.
") IsOnlyBy3dCurve;
		bool IsOnlyBy3dCurve();

		/****** GeomFill_GuideTrihedronPlan::NbIntervals ******/
		/****** md5 signature: b2aaad8a5aa5a35490639df04a76a09e ******/
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
		int NbIntervals(const GeomAbs_Shape S);

		/****** GeomFill_GuideTrihedronPlan::Origine ******/
		/****** md5 signature: c21507f639bcb407875ae18045b8ecc0 ******/
		%feature("compactdefaultargs") Origine;
		%feature("autodoc", "
Parameters
----------
OrACR1: double
OrACR2: double

Return
-------
None

Description
-----------
No available documentation.
") Origine;
		void Origine(const double OrACR1, const double OrACR2);

		/****** GeomFill_GuideTrihedronPlan::SetCurve ******/
		/****** md5 signature: 2286f6d56edd13fbf2c82bf247360c9a ******/
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
Return: true in case if execution end correctly.
") SetCurve;
		bool SetCurve(const opencascade::handle<Adaptor3d_Curve> & thePath);

		/****** GeomFill_GuideTrihedronPlan::SetInterval ******/
		/****** md5 signature: 56dbce7f545295f90d642a293e48bb2a ******/
		%feature("compactdefaultargs") SetInterval;
		%feature("autodoc", "
Parameters
----------
First: double
Last: double

Return
-------
None

Description
-----------
Sets the bounds of the parametric interval on the function This determines the derivatives in these values if the function is not Cn.
") SetInterval;
		void SetInterval(const double First, const double Last);

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

class GeomFill_HArray1OfLocationLaw : public NCollection_Array1<opencascade::handle<GeomFill_LocationLaw>>, public Standard_Transient {
  public:
    GeomFill_HArray1OfLocationLaw(const Standard_Integer theLower, const Standard_Integer theUpper);
    GeomFill_HArray1OfLocationLaw(const Standard_Integer theLower, const Standard_Integer theUpper, const NCollection_Array1<opencascade::handle<GeomFill_LocationLaw>>::value_type& theValue);
    GeomFill_HArray1OfLocationLaw(const NCollection_Array1<opencascade::handle<GeomFill_LocationLaw>>& theOther);
    const NCollection_Array1<opencascade::handle<GeomFill_LocationLaw>>& Array1();
    NCollection_Array1<opencascade::handle<GeomFill_LocationLaw>>& ChangeArray1();
};
%make_alias(GeomFill_HArray1OfLocationLaw)


class GeomFill_HArray1OfSectionLaw : public NCollection_Array1<opencascade::handle<GeomFill_SectionLaw>>, public Standard_Transient {
  public:
    GeomFill_HArray1OfSectionLaw(const Standard_Integer theLower, const Standard_Integer theUpper);
    GeomFill_HArray1OfSectionLaw(const Standard_Integer theLower, const Standard_Integer theUpper, const NCollection_Array1<opencascade::handle<GeomFill_SectionLaw>>::value_type& theValue);
    GeomFill_HArray1OfSectionLaw(const NCollection_Array1<opencascade::handle<GeomFill_SectionLaw>>& theOther);
    const NCollection_Array1<opencascade::handle<GeomFill_SectionLaw>>& Array1();
    NCollection_Array1<opencascade::handle<GeomFill_SectionLaw>>& ChangeArray1();
};
%make_alias(GeomFill_HArray1OfSectionLaw)

/* harray2 classes */
/* hsequence classes */
class GeomFill_HSequenceOfAx2 : public NCollection_Sequence<gp_Ax2>, public Standard_Transient {
  public:
    GeomFill_HSequenceOfAx2();
    GeomFill_HSequenceOfAx2(const NCollection_Sequence<gp_Ax2>& theOther);
    const NCollection_Sequence<gp_Ax2>& Sequence();
    void Append (const NCollection_Sequence<gp_Ax2>::value_type& theItem);
    void Append (NCollection_Sequence<gp_Ax2>& theSequence);
    NCollection_Sequence<gp_Ax2>& ChangeSequence();
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
