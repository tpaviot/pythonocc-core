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
%define EXTREMADOCSTRING
"Extrema module, see official documentation at
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_extrema.html"
%enddef
%module (package="OCC.Core", docstring=EXTREMADOCSTRING) Extrema


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
#include<Extrema_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<Adaptor2d_module.hxx>
#include<Geom2d_module.hxx>
#include<gp_module.hxx>
#include<GeomAbs_module.hxx>
#include<TColStd_module.hxx>
#include<Adaptor3d_module.hxx>
#include<Geom_module.hxx>
#include<GeomAdaptor_module.hxx>
#include<math_module.hxx>
#include<Precision_module.hxx>
#include<Message_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import Adaptor2d.i
%import Geom2d.i
%import gp.i
%import GeomAbs.i
%import TColStd.i
%import Adaptor3d.i
%import Geom.i
%import GeomAdaptor.i
%import math.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
enum Extrema_ElementType {
	Extrema_Node = 0,
	Extrema_UIsoEdge = 1,
	Extrema_VIsoEdge = 2,
	Extrema_Face = 3,
};

enum Extrema_ExtAlgo {
	Extrema_ExtAlgo_Grad = 0,
	Extrema_ExtAlgo_Tree = 1,
};

enum Extrema_ExtFlag {
	Extrema_ExtFlag_MIN = 0,
	Extrema_ExtFlag_MAX = 1,
	Extrema_ExtFlag_MINMAX = 2,
};

/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {

class Extrema_ElementType(IntEnum):
	Extrema_Node = 0
	Extrema_UIsoEdge = 1
	Extrema_VIsoEdge = 2
	Extrema_Face = 3
Extrema_Node = Extrema_ElementType.Extrema_Node
Extrema_UIsoEdge = Extrema_ElementType.Extrema_UIsoEdge
Extrema_VIsoEdge = Extrema_ElementType.Extrema_VIsoEdge
Extrema_Face = Extrema_ElementType.Extrema_Face

class Extrema_ExtAlgo(IntEnum):
	Extrema_ExtAlgo_Grad = 0
	Extrema_ExtAlgo_Tree = 1
Extrema_ExtAlgo_Grad = Extrema_ExtAlgo.Extrema_ExtAlgo_Grad
Extrema_ExtAlgo_Tree = Extrema_ExtAlgo.Extrema_ExtAlgo_Tree

class Extrema_ExtFlag(IntEnum):
	Extrema_ExtFlag_MIN = 0
	Extrema_ExtFlag_MAX = 1
	Extrema_ExtFlag_MINMAX = 2
Extrema_ExtFlag_MIN = Extrema_ExtFlag.Extrema_ExtFlag_MIN
Extrema_ExtFlag_MAX = Extrema_ExtFlag.Extrema_ExtFlag_MAX
Extrema_ExtFlag_MINMAX = Extrema_ExtFlag.Extrema_ExtFlag_MINMAX
};
/* end python proxy for enums */

/* handles */
%wrap_handle(Extrema_ExtPExtS)
%wrap_handle(Extrema_ExtPRevS)
/* end handles declaration */

/* templates */
%template(Extrema_Array1OfPOnCurv) NCollection_Array1<Extrema_POnCurv>;
Array1ExtendIter(Extrema_POnCurv)

%template(Extrema_Array1OfPOnCurv2d) NCollection_Array1<Extrema_POnCurv2d>;
Array1ExtendIter(Extrema_POnCurv2d)

%template(Extrema_Array1OfPOnSurf) NCollection_Array1<Extrema_POnSurf>;
Array1ExtendIter(Extrema_POnSurf)

%template(Extrema_SequenceOfPOnCurv) NCollection_Sequence<Extrema_POnCurv>;

%extend NCollection_Sequence<Extrema_POnCurv> {
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
%template(Extrema_SequenceOfPOnCurv2d) NCollection_Sequence<Extrema_POnCurv2d>;

%extend NCollection_Sequence<Extrema_POnCurv2d> {
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
%template(Extrema_SequenceOfPOnSurf) NCollection_Sequence<Extrema_POnSurf>;

%extend NCollection_Sequence<Extrema_POnSurf> {
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
%template(Extrema_UBTreeFillerOfSphere) NCollection_UBTreeFiller<int,Bnd_Sphere>;
%template(Extrema_UBTreeOfSphere) NCollection_UBTree<int,Bnd_Sphere>;
/* end templates declaration */

/* typedefs */
typedef NCollection_Array1<Extrema_POnCurv> Extrema_Array1OfPOnCurv;
typedef NCollection_Array1<Extrema_POnCurv2d> Extrema_Array1OfPOnCurv2d;
typedef NCollection_Array1<Extrema_POnSurf> Extrema_Array1OfPOnSurf;
typedef NCollection_Array2<Extrema_POnCurv> Extrema_Array2OfPOnCurv;
typedef NCollection_Array2<Extrema_POnCurv2d> Extrema_Array2OfPOnCurv2d;
typedef NCollection_Array2<Extrema_POnSurf> Extrema_Array2OfPOnSurf;
typedef NCollection_Array2<Extrema_POnSurfParams> Extrema_Array2OfPOnSurfParams;
typedef NCollection_HArray1<Extrema_POnCurv> Extrema_HArray1OfPOnCurv;
typedef NCollection_HArray1<Extrema_POnCurv2d> Extrema_HArray1OfPOnCurv2d;
typedef NCollection_HArray1<Extrema_POnSurf> Extrema_HArray1OfPOnSurf;
typedef NCollection_HArray2<Extrema_POnCurv> Extrema_HArray2OfPOnCurv;
typedef NCollection_HArray2<Extrema_POnCurv2d> Extrema_HArray2OfPOnCurv2d;
typedef NCollection_HArray2<Extrema_POnSurf> Extrema_HArray2OfPOnSurf;
typedef NCollection_Handle<Extrema_UBTreeOfSphere> Extrema_HUBTreeOfSphere;
typedef NCollection_Sequence<Extrema_POnCurv> Extrema_SequenceOfPOnCurv;
typedef NCollection_Sequence<Extrema_POnCurv2d> Extrema_SequenceOfPOnCurv2d;
typedef NCollection_Sequence<Extrema_POnSurf> Extrema_SequenceOfPOnSurf;
typedef NCollection_UBTreeFiller<int, Bnd_Sphere> Extrema_UBTreeFillerOfSphere;
typedef NCollection_UBTree<int, Bnd_Sphere> Extrema_UBTreeOfSphere;
/* end typedefs declaration */

/****************************
* class Extrema_Curve2dTool *
****************************/
class Extrema_Curve2dTool {
	public:
		/****** Extrema_Curve2dTool::BSpline ******/
		/****** md5 signature: 5431742a44149d16630330c7ad9cbacb ******/
		%feature("compactdefaultargs") BSpline;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor2d_Curve2d

Return
-------
opencascade::handle<Geom2d_BSplineCurve>

Description
-----------
No available documentation.
") BSpline;
		static opencascade::handle<Geom2d_BSplineCurve> BSpline(const Adaptor2d_Curve2d & theC);

		/****** Extrema_Curve2dTool::Bezier ******/
		/****** md5 signature: 58c850cb969efb15a0dc7e84af7e1e2e ******/
		%feature("compactdefaultargs") Bezier;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor2d_Curve2d

Return
-------
opencascade::handle<Geom2d_BezierCurve>

Description
-----------
No available documentation.
") Bezier;
		static opencascade::handle<Geom2d_BezierCurve> Bezier(const Adaptor2d_Curve2d & theC);

		/****** Extrema_Curve2dTool::Circle ******/
		/****** md5 signature: 3ac2ed9edf1831f969a1b5c57c3fb7d3 ******/
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor2d_Curve2d

Return
-------
gp_Circ2d

Description
-----------
No available documentation.
") Circle;
		static gp_Circ2d Circle(const Adaptor2d_Curve2d & theC);

		/****** Extrema_Curve2dTool::Continuity ******/
		/****** md5 signature: 44c1e79b0b4052535c51dab74ad90396 ******/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor2d_Curve2d

Return
-------
GeomAbs_Shape

Description
-----------
No available documentation.
") Continuity;
		static GeomAbs_Shape Continuity(const Adaptor2d_Curve2d & theC);

		/****** Extrema_Curve2dTool::D0 ******/
		/****** md5 signature: 41e8a625454aa00a6235cdb4479d572d ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor2d_Curve2d
theU: double
theP: gp_Pnt2d

Return
-------
None

Description
-----------
Computes the point of parameter U on the curve.
") D0;
		static void D0(const Adaptor2d_Curve2d & theC, const double theU, gp_Pnt2d & theP);

		/****** Extrema_Curve2dTool::D1 ******/
		/****** md5 signature: d20665042aaa6dacd669acda80a1141b ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor2d_Curve2d
theU: double
theP: gp_Pnt2d
theV: gp_Vec2d

Return
-------
None

Description
-----------
Computes the point of parameter U on the curve with its first derivative.
") D1;
		static void D1(const Adaptor2d_Curve2d & theC, const double theU, gp_Pnt2d & theP, gp_Vec2d & theV);

		/****** Extrema_Curve2dTool::D2 ******/
		/****** md5 signature: f213753d2645c3aca9e8323bfe74ce0f ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor2d_Curve2d
theU: double
theP: gp_Pnt2d
theV1: gp_Vec2d
theV2: gp_Vec2d

Return
-------
None

Description
-----------
Returns the point P of parameter U, the first and second derivatives V1 and V2.
") D2;
		static void D2(const Adaptor2d_Curve2d & theC, const double theU, gp_Pnt2d & theP, gp_Vec2d & theV1, gp_Vec2d & theV2);

		/****** Extrema_Curve2dTool::D3 ******/
		/****** md5 signature: 19d402983862ac2c4238e44a74f30a50 ******/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor2d_Curve2d
theU: double
theP: gp_Pnt2d
theV1: gp_Vec2d
theV2: gp_Vec2d
theV3: gp_Vec2d

Return
-------
None

Description
-----------
Returns the point P of parameter U, the first, the second and the third derivative.
") D3;
		static void D3(const Adaptor2d_Curve2d & theC, const double theU, gp_Pnt2d & theP, gp_Vec2d & theV1, gp_Vec2d & theV2, gp_Vec2d & theV3);

		/****** Extrema_Curve2dTool::DN ******/
		/****** md5 signature: 3193bb75845c0fa2be33ca78a1f9380f ******/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor2d_Curve2d
theU: double
theN: int

Return
-------
gp_Vec2d

Description
-----------
The returned vector gives the value of the derivative for the order of derivation N.
") DN;
		static gp_Vec2d DN(const Adaptor2d_Curve2d & theC, const double theU, const int theN);

		/****** Extrema_Curve2dTool::DeflCurvIntervals ******/
		/****** md5 signature: e493247d58ac6c756334f350a1d1ed83 ******/
		%feature("compactdefaultargs") DeflCurvIntervals;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor2d_Curve2d

Return
-------
opencascade::handle<TColStd_HArray1OfReal>

Description
-----------
Returns the parameters bounding the intervals of subdivision of curve according to Curvature deflection. Value of deflection is defined in method.
") DeflCurvIntervals;
		static opencascade::handle<TColStd_HArray1OfReal> DeflCurvIntervals(const Adaptor2d_Curve2d & theC);

		/****** Extrema_Curve2dTool::Degree ******/
		/****** md5 signature: c8b1e8778c828e2bc2a32f188d86d508 ******/
		%feature("compactdefaultargs") Degree;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor2d_Curve2d

Return
-------
int

Description
-----------
No available documentation.
") Degree;
		static int Degree(const Adaptor2d_Curve2d & theC);

		/****** Extrema_Curve2dTool::Ellipse ******/
		/****** md5 signature: 80dbc78d870d3eebcbc39dd6773bb145 ******/
		%feature("compactdefaultargs") Ellipse;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor2d_Curve2d

Return
-------
gp_Elips2d

Description
-----------
No available documentation.
") Ellipse;
		static gp_Elips2d Ellipse(const Adaptor2d_Curve2d & theC);

		/****** Extrema_Curve2dTool::FirstParameter ******/
		/****** md5 signature: 22a4ed2b262724359b1602b98c9782bb ******/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor2d_Curve2d

Return
-------
double

Description
-----------
No available documentation.
") FirstParameter;
		static double FirstParameter(const Adaptor2d_Curve2d & theC);

		/****** Extrema_Curve2dTool::GetType ******/
		/****** md5 signature: ab27c225e183294939ca9a6856824c03 ******/
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor2d_Curve2d

Return
-------
GeomAbs_CurveType

Description
-----------
Returns the type of the curve in the current interval: Line, Circle, Ellipse, Hyperbola, Parabola, BezierCurve, BSplineCurve, OtherCurve.
") GetType;
		static GeomAbs_CurveType GetType(const Adaptor2d_Curve2d & theC);

		/****** Extrema_Curve2dTool::Hyperbola ******/
		/****** md5 signature: 31e361ce2e80d81ab6766618b3268c27 ******/
		%feature("compactdefaultargs") Hyperbola;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor2d_Curve2d

Return
-------
gp_Hypr2d

Description
-----------
No available documentation.
") Hyperbola;
		static gp_Hypr2d Hyperbola(const Adaptor2d_Curve2d & theC);

		/****** Extrema_Curve2dTool::Intervals ******/
		/****** md5 signature: 98d7346280e1523f66d344b312761765 ******/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor2d_Curve2d
theT: TColStd_Array1OfReal
theS: GeomAbs_Shape

Return
-------
None

Description
-----------
Stores in <T> the parameters bounding the intervals of continuity <S>.
") Intervals;
		static void Intervals(const Adaptor2d_Curve2d & theC, TColStd_Array1OfReal & theT, const GeomAbs_Shape theS);

		/****** Extrema_Curve2dTool::IsClosed ******/
		/****** md5 signature: f76f3d49135f8033305ba32127671472 ******/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor2d_Curve2d

Return
-------
bool

Description
-----------
No available documentation.
") IsClosed;
		static bool IsClosed(const Adaptor2d_Curve2d & theC);

		/****** Extrema_Curve2dTool::IsPeriodic ******/
		/****** md5 signature: 9edc31ea2ede83a392332e8d431a353e ******/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor2d_Curve2d

Return
-------
bool

Description
-----------
No available documentation.
") IsPeriodic;
		static bool IsPeriodic(const Adaptor2d_Curve2d & theC);

		/****** Extrema_Curve2dTool::IsRational ******/
		/****** md5 signature: f98583bc04d0263e0cfaaf4693ffb715 ******/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor2d_Curve2d

Return
-------
bool

Description
-----------
No available documentation.
") IsRational;
		static bool IsRational(const Adaptor2d_Curve2d & theC);

		/****** Extrema_Curve2dTool::LastParameter ******/
		/****** md5 signature: da098caf6a04c3f0a4f946e1a3267d2c ******/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor2d_Curve2d

Return
-------
double

Description
-----------
No available documentation.
") LastParameter;
		static double LastParameter(const Adaptor2d_Curve2d & theC);

		/****** Extrema_Curve2dTool::Line ******/
		/****** md5 signature: a48056ca015c062264d881f755f4a207 ******/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor2d_Curve2d

Return
-------
gp_Lin2d

Description
-----------
No available documentation.
") Line;
		static gp_Lin2d Line(const Adaptor2d_Curve2d & theC);

		/****** Extrema_Curve2dTool::NbIntervals ******/
		/****** md5 signature: 0ead40caa0b98f4d0d185c841ef6c350 ******/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor2d_Curve2d
theS: GeomAbs_Shape

Return
-------
int

Description
-----------
If necessary, breaks the curve in intervals of continuity <S>. And returns the number of intervals.
") NbIntervals;
		static int NbIntervals(const Adaptor2d_Curve2d & theC, const GeomAbs_Shape theS);

		/****** Extrema_Curve2dTool::NbKnots ******/
		/****** md5 signature: de7a3218ed98f47754e4a39d298e5445 ******/
		%feature("compactdefaultargs") NbKnots;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor2d_Curve2d

Return
-------
int

Description
-----------
No available documentation.
") NbKnots;
		static int NbKnots(const Adaptor2d_Curve2d & theC);

		/****** Extrema_Curve2dTool::NbPoles ******/
		/****** md5 signature: 27b6bac0822fbfa141717369515d0032 ******/
		%feature("compactdefaultargs") NbPoles;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor2d_Curve2d

Return
-------
int

Description
-----------
No available documentation.
") NbPoles;
		static int NbPoles(const Adaptor2d_Curve2d & theC);

		/****** Extrema_Curve2dTool::Parabola ******/
		/****** md5 signature: d95490d9d08d9414ce3067939bfb8b2a ******/
		%feature("compactdefaultargs") Parabola;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor2d_Curve2d

Return
-------
gp_Parab2d

Description
-----------
No available documentation.
") Parabola;
		static gp_Parab2d Parabola(const Adaptor2d_Curve2d & theC);

		/****** Extrema_Curve2dTool::Period ******/
		/****** md5 signature: 901671952759f9147432eb0959c9c38f ******/
		%feature("compactdefaultargs") Period;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor2d_Curve2d

Return
-------
double

Description
-----------
No available documentation.
") Period;
		static double Period(const Adaptor2d_Curve2d & theC);

		/****** Extrema_Curve2dTool::Resolution ******/
		/****** md5 signature: 920c3adea9d8c2c4e156f40ba9acca4f ******/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor2d_Curve2d
theR3d: double

Return
-------
double

Description
-----------
Returns the parametric resolution corresponding to the real space resolution <R3d>.
") Resolution;
		static double Resolution(const Adaptor2d_Curve2d & theC, const double theR3d);

		/****** Extrema_Curve2dTool::Value ******/
		/****** md5 signature: 8117a1a51314c8bd58884f2cd5f6a3ce ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor2d_Curve2d
theU: double

Return
-------
gp_Pnt2d

Description
-----------
Computes the point of parameter U on the curve.
") Value;
		static gp_Pnt2d Value(const Adaptor2d_Curve2d & theC, const double theU);

};


%extend Extrema_Curve2dTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class Extrema_CurveTool *
**************************/
class Extrema_CurveTool {
	public:
		/****** Extrema_CurveTool::BSpline ******/
		/****** md5 signature: 1cc921c59ae8fc423d25220cf1887233 ******/
		%feature("compactdefaultargs") BSpline;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor3d_Curve

Return
-------
opencascade::handle<Geom_BSplineCurve>

Description
-----------
No available documentation.
") BSpline;
		static opencascade::handle<Geom_BSplineCurve> BSpline(const Adaptor3d_Curve & theC);

		/****** Extrema_CurveTool::Bezier ******/
		/****** md5 signature: d45dea8ac4703b8c7ae996b1191de5ee ******/
		%feature("compactdefaultargs") Bezier;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor3d_Curve

Return
-------
opencascade::handle<Geom_BezierCurve>

Description
-----------
No available documentation.
") Bezier;
		static opencascade::handle<Geom_BezierCurve> Bezier(const Adaptor3d_Curve & theC);

		/****** Extrema_CurveTool::Circle ******/
		/****** md5 signature: a97b96aa6175159c2022490d397b2a78 ******/
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor3d_Curve

Return
-------
gp_Circ

Description
-----------
No available documentation.
") Circle;
		static gp_Circ Circle(const Adaptor3d_Curve & theC);

		/****** Extrema_CurveTool::Continuity ******/
		/****** md5 signature: 34bc722375aff9ac9d2fdd67a4a72cb1 ******/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor3d_Curve

Return
-------
GeomAbs_Shape

Description
-----------
No available documentation.
") Continuity;
		static GeomAbs_Shape Continuity(const Adaptor3d_Curve & theC);

		/****** Extrema_CurveTool::D0 ******/
		/****** md5 signature: b406360f565c3e2795cfcfe6c9c54e7a ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor3d_Curve
theU: double
theP: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") D0;
		static void D0(const Adaptor3d_Curve & theC, const double theU, gp_Pnt & theP);

		/****** Extrema_CurveTool::D1 ******/
		/****** md5 signature: cbcc939c65994275c0b03f836c05b2d6 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor3d_Curve
theU: double
theP: gp_Pnt
theV: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") D1;
		static void D1(const Adaptor3d_Curve & theC, const double theU, gp_Pnt & theP, gp_Vec & theV);

		/****** Extrema_CurveTool::D2 ******/
		/****** md5 signature: 276299957e8742f97e7a127b8ff44f66 ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor3d_Curve
theU: double
theP: gp_Pnt
theV1: gp_Vec
theV2: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") D2;
		static void D2(const Adaptor3d_Curve & theC, const double theU, gp_Pnt & theP, gp_Vec & theV1, gp_Vec & theV2);

		/****** Extrema_CurveTool::D3 ******/
		/****** md5 signature: 5039642884561412771c28e566a5e997 ******/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor3d_Curve
theU: double
theP: gp_Pnt
theV1: gp_Vec
theV2: gp_Vec
theV3: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") D3;
		static void D3(const Adaptor3d_Curve & theC, const double theU, gp_Pnt & theP, gp_Vec & theV1, gp_Vec & theV2, gp_Vec & theV3);

		/****** Extrema_CurveTool::DN ******/
		/****** md5 signature: 85e9d0b50dbb59b3f346153c0b1a03f5 ******/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor3d_Curve
theU: double
theN: int

Return
-------
gp_Vec

Description
-----------
No available documentation.
") DN;
		static gp_Vec DN(const Adaptor3d_Curve & theC, const double theU, const int theN);

		/****** Extrema_CurveTool::DeflCurvIntervals ******/
		/****** md5 signature: 8a4b37018d398507f335d3de89d2cb9d ******/
		%feature("compactdefaultargs") DeflCurvIntervals;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor3d_Curve

Return
-------
opencascade::handle<TColStd_HArray1OfReal>

Description
-----------
Returns the parameters bounding the intervals of subdivision of curve according to Curvature deflection. Value of deflection is defined in method.
") DeflCurvIntervals;
		static opencascade::handle<TColStd_HArray1OfReal> DeflCurvIntervals(const Adaptor3d_Curve & theC);

		/****** Extrema_CurveTool::Degree ******/
		/****** md5 signature: 88ef3028bafc455a0aea5e9c8bd42c5c ******/
		%feature("compactdefaultargs") Degree;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor3d_Curve

Return
-------
int

Description
-----------
No available documentation.
") Degree;
		static int Degree(const Adaptor3d_Curve & theC);

		/****** Extrema_CurveTool::Ellipse ******/
		/****** md5 signature: 11acf11cfd5dbc25631704b9c55632f2 ******/
		%feature("compactdefaultargs") Ellipse;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor3d_Curve

Return
-------
gp_Elips

Description
-----------
No available documentation.
") Ellipse;
		static gp_Elips Ellipse(const Adaptor3d_Curve & theC);

		/****** Extrema_CurveTool::FirstParameter ******/
		/****** md5 signature: 6314f47c9311744dac6172187268a377 ******/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor3d_Curve

Return
-------
double

Description
-----------
No available documentation.
") FirstParameter;
		static double FirstParameter(const Adaptor3d_Curve & theC);

		/****** Extrema_CurveTool::GetType ******/
		/****** md5 signature: 268d13505633352c538e05932cf9aa80 ******/
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor3d_Curve

Return
-------
GeomAbs_CurveType

Description
-----------
No available documentation.
") GetType;
		static GeomAbs_CurveType GetType(const Adaptor3d_Curve & theC);

		/****** Extrema_CurveTool::Hyperbola ******/
		/****** md5 signature: ab890d364485cf501caf9279b4e0cca7 ******/
		%feature("compactdefaultargs") Hyperbola;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor3d_Curve

Return
-------
gp_Hypr

Description
-----------
No available documentation.
") Hyperbola;
		static gp_Hypr Hyperbola(const Adaptor3d_Curve & theC);

		/****** Extrema_CurveTool::Intervals ******/
		/****** md5 signature: 6245ce7616b3ac7e1a56dcd394c05101 ******/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor3d_Curve
theT: TColStd_Array1OfReal
theS: GeomAbs_Shape

Return
-------
None

Description
-----------
Stores in <T> the parameters bounding the intervals of continuity <S>. The array must provide enough room to accommodate for the parameters. i.e. T.Length() > NbIntervals().
") Intervals;
		static void Intervals(Adaptor3d_Curve & theC, TColStd_Array1OfReal & theT, const GeomAbs_Shape theS);

		/****** Extrema_CurveTool::IsPeriodic ******/
		/****** md5 signature: fbfcd3dbd08e5fcb750662c78f6ee821 ******/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor3d_Curve

Return
-------
bool

Description
-----------
No available documentation.
") IsPeriodic;
		static bool IsPeriodic(const Adaptor3d_Curve & theC);

		/****** Extrema_CurveTool::IsRational ******/
		/****** md5 signature: ab1980018c94f91c9a6e2debca23ee96 ******/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor3d_Curve

Return
-------
bool

Description
-----------
No available documentation.
") IsRational;
		static bool IsRational(const Adaptor3d_Curve & theC);

		/****** Extrema_CurveTool::LastParameter ******/
		/****** md5 signature: de26ff9ca0e854f1c33752b3e3038a07 ******/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor3d_Curve

Return
-------
double

Description
-----------
No available documentation.
") LastParameter;
		static double LastParameter(const Adaptor3d_Curve & theC);

		/****** Extrema_CurveTool::Line ******/
		/****** md5 signature: 5c8c0a5416ac71bbdcbd3787b02ce95e ******/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor3d_Curve

Return
-------
gp_Lin

Description
-----------
No available documentation.
") Line;
		static gp_Lin Line(const Adaptor3d_Curve & theC);

		/****** Extrema_CurveTool::NbIntervals ******/
		/****** md5 signature: 3ae6bd8fef100ae6500505f6abcc2d62 ******/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor3d_Curve
theS: GeomAbs_Shape

Return
-------
int

Description
-----------
Returns the number of intervals for continuity <S>. May be one if Continuity(me) >= <S>.
") NbIntervals;
		static int NbIntervals(Adaptor3d_Curve & theC, const GeomAbs_Shape theS);

		/****** Extrema_CurveTool::NbKnots ******/
		/****** md5 signature: efbee7fb141c1be62913e733e49682db ******/
		%feature("compactdefaultargs") NbKnots;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor3d_Curve

Return
-------
int

Description
-----------
No available documentation.
") NbKnots;
		static int NbKnots(const Adaptor3d_Curve & theC);

		/****** Extrema_CurveTool::NbPoles ******/
		/****** md5 signature: b35a351faeae2715cd2ce29a3d4b68dd ******/
		%feature("compactdefaultargs") NbPoles;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor3d_Curve

Return
-------
int

Description
-----------
No available documentation.
") NbPoles;
		static int NbPoles(const Adaptor3d_Curve & theC);

		/****** Extrema_CurveTool::Parabola ******/
		/****** md5 signature: 7c60a5496e264ef1a401eda73de32639 ******/
		%feature("compactdefaultargs") Parabola;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor3d_Curve

Return
-------
gp_Parab

Description
-----------
No available documentation.
") Parabola;
		static gp_Parab Parabola(const Adaptor3d_Curve & theC);

		/****** Extrema_CurveTool::Period ******/
		/****** md5 signature: 3485959e85b5940f60f62609244208f4 ******/
		%feature("compactdefaultargs") Period;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor3d_Curve

Return
-------
double

Description
-----------
No available documentation.
") Period;
		static double Period(const Adaptor3d_Curve & theC);

		/****** Extrema_CurveTool::Resolution ******/
		/****** md5 signature: f4464ae4ddaf5c3f1eb4b842c6500781 ******/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor3d_Curve
theR3d: double

Return
-------
double

Description
-----------
No available documentation.
") Resolution;
		static double Resolution(const Adaptor3d_Curve & theC, const double theR3d);

		/****** Extrema_CurveTool::Value ******/
		/****** md5 signature: 028e95a3e226c2656bbe2406bb2e155c ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
theC: Adaptor3d_Curve
theU: double

Return
-------
gp_Pnt

Description
-----------
No available documentation.
") Value;
		static gp_Pnt Value(const Adaptor3d_Curve & theC, const double theU);

};


%extend Extrema_CurveTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class Extrema_ExtCC *
**********************/
class Extrema_ExtCC {
	public:
		/****** Extrema_ExtCC::Extrema_ExtCC ******/
		/****** md5 signature: 69ed626021f36093ab315d26a0156f7f ******/
		%feature("compactdefaultargs") Extrema_ExtCC;
		%feature("autodoc", "
Parameters
----------
TolC1: double (optional, default to 1.0e-10)
TolC2: double (optional, default to 1.0e-10)

Return
-------
None

Description
-----------
No available documentation.
") Extrema_ExtCC;
		 Extrema_ExtCC(const double TolC1 = 1.0e-10, const double TolC2 = 1.0e-10);

		/****** Extrema_ExtCC::Extrema_ExtCC ******/
		/****** md5 signature: 5a21112901daeb96b6cc058c4913dd6b ******/
		%feature("compactdefaultargs") Extrema_ExtCC;
		%feature("autodoc", "
Parameters
----------
C1: Adaptor3d_Curve
C2: Adaptor3d_Curve
TolC1: double (optional, default to 1.0e-10)
TolC2: double (optional, default to 1.0e-10)

Return
-------
None

Description
-----------
It calculates all the distances.
") Extrema_ExtCC;
		 Extrema_ExtCC(const Adaptor3d_Curve & C1, const Adaptor3d_Curve & C2, const double TolC1 = 1.0e-10, const double TolC2 = 1.0e-10);

		/****** Extrema_ExtCC::Extrema_ExtCC ******/
		/****** md5 signature: 0608e2190a876ae56146a50c58b22f6f ******/
		%feature("compactdefaultargs") Extrema_ExtCC;
		%feature("autodoc", "
Parameters
----------
C1: Adaptor3d_Curve
C2: Adaptor3d_Curve
U1: double
U2: double
V1: double
V2: double
TolC1: double (optional, default to 1.0e-10)
TolC2: double (optional, default to 1.0e-10)

Return
-------
None

Description
-----------
It calculates all the distances.
") Extrema_ExtCC;
		 Extrema_ExtCC(const Adaptor3d_Curve & C1, const Adaptor3d_Curve & C2, const double U1, const double U2, const double V1, const double V2, const double TolC1 = 1.0e-10, const double TolC2 = 1.0e-10);

		/****** Extrema_ExtCC::GetSingleSolutionFlag ******/
		/****** md5 signature: 5d1c77c7a523a241b74128b38ef81a1c ******/
		%feature("compactdefaultargs") GetSingleSolutionFlag;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Get flag for single extrema computation. Works on parametric solver only.
") GetSingleSolutionFlag;
		bool GetSingleSolutionFlag();

		/****** Extrema_ExtCC::Initialize ******/
		/****** md5 signature: 2a4a53dbfd3cf12cb8313e1cfe36e114 ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
C1: Adaptor3d_Curve
C2: Adaptor3d_Curve
TolC1: double (optional, default to 1.0e-10)
TolC2: double (optional, default to 1.0e-10)

Return
-------
None

Description
-----------
Initializes but does not perform algorithm.
") Initialize;
		void Initialize(const Adaptor3d_Curve & C1, const Adaptor3d_Curve & C2, const double TolC1 = 1.0e-10, const double TolC2 = 1.0e-10);

		/****** Extrema_ExtCC::Initialize ******/
		/****** md5 signature: 74d8313d8f71744e4b7254936e60df41 ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
C1: Adaptor3d_Curve
C2: Adaptor3d_Curve
U1: double
U2: double
V1: double
V2: double
TolC1: double (optional, default to 1.0e-10)
TolC2: double (optional, default to 1.0e-10)

Return
-------
None

Description
-----------
Initializes but does not perform algorithm.
") Initialize;
		void Initialize(const Adaptor3d_Curve & C1, const Adaptor3d_Curve & C2, const double U1, const double U2, const double V1, const double V2, const double TolC1 = 1.0e-10, const double TolC2 = 1.0e-10);

		/****** Extrema_ExtCC::IsDone ******/
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the distances are found.
") IsDone;
		bool IsDone();

		/****** Extrema_ExtCC::IsParallel ******/
		/****** md5 signature: 25d4ac955341335e2fbcc4e3737ea518 ******/
		%feature("compactdefaultargs") IsParallel;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the two curves are parallel.
") IsParallel;
		bool IsParallel();

		/****** Extrema_ExtCC::NbExt ******/
		/****** md5 signature: a89b8075893780b59ee0d9f6ba576df8 ******/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of extremum distances.
") NbExt;
		int NbExt();

		/****** Extrema_ExtCC::Perform ******/
		/****** md5 signature: c04b01412cba7220c024b5eb4532697f ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform();

		/****** Extrema_ExtCC::Points ******/
		/****** md5 signature: bfa511058ea609926c07e72d6f996c85 ******/
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "
Parameters
----------
N: int
P1: Extrema_POnCurv
P2: Extrema_POnCurv

Return
-------
None

Description
-----------
Returns the points of the Nth extremum distance. P1 is on the first curve, P2 on the second one.
") Points;
		void Points(const int N, Extrema_POnCurv & P1, Extrema_POnCurv & P2);

		/****** Extrema_ExtCC::SetCurve ******/
		/****** md5 signature: 9bb78b33ba2601f941c004a243fa1c6c ******/
		%feature("compactdefaultargs") SetCurve;
		%feature("autodoc", "
Parameters
----------
theRank: int
C: Adaptor3d_Curve

Return
-------
None

Description
-----------
No available documentation.
") SetCurve;
		void SetCurve(const int theRank, const Adaptor3d_Curve & C);

		/****** Extrema_ExtCC::SetCurve ******/
		/****** md5 signature: b2d31afb6e1c07b2079342ceb9a55f96 ******/
		%feature("compactdefaultargs") SetCurve;
		%feature("autodoc", "
Parameters
----------
theRank: int
C: Adaptor3d_Curve
Uinf: double
Usup: double

Return
-------
None

Description
-----------
No available documentation.
") SetCurve;
		void SetCurve(const int theRank, const Adaptor3d_Curve & C, const double Uinf, const double Usup);

		/****** Extrema_ExtCC::SetRange ******/
		/****** md5 signature: e0854173ae9b747a019e973c60d6c03f ******/
		%feature("compactdefaultargs") SetRange;
		%feature("autodoc", "
Parameters
----------
theRank: int
Uinf: double
Usup: double

Return
-------
None

Description
-----------
No available documentation.
") SetRange;
		void SetRange(const int theRank, const double Uinf, const double Usup);

		/****** Extrema_ExtCC::SetSingleSolutionFlag ******/
		/****** md5 signature: 103181d923f205c8a0ea7d9450218c43 ******/
		%feature("compactdefaultargs") SetSingleSolutionFlag;
		%feature("autodoc", "
Parameters
----------
theSingleSolutionFlag: bool

Return
-------
None

Description
-----------
Set flag for single extrema computation. Works on parametric solver only.
") SetSingleSolutionFlag;
		void SetSingleSolutionFlag(const bool theSingleSolutionFlag);

		/****** Extrema_ExtCC::SetTolerance ******/
		/****** md5 signature: b1d82fafb6757a08880cdde678665b4b ******/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "
Parameters
----------
theRank: int
Tol: double

Return
-------
None

Description
-----------
No available documentation.
") SetTolerance;
		void SetTolerance(const int theRank, const double Tol);

		/****** Extrema_ExtCC::SquareDistance ******/
		/****** md5 signature: 9aebb5df3f18bb9f6020d21a4e91b999 ******/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "
Parameters
----------
N: int (optional, default to 1)

Return
-------
double

Description
-----------
Returns the value of the Nth extremum square distance.
") SquareDistance;
		double SquareDistance(const int N = 1);

		/****** Extrema_ExtCC::TrimmedSquareDistances ******/
		/****** md5 signature: a0b2e07311146f31be6f8f46c6371a1a ******/
		%feature("compactdefaultargs") TrimmedSquareDistances;
		%feature("autodoc", "
Parameters
----------
P11: gp_Pnt
P12: gp_Pnt
P21: gp_Pnt
P22: gp_Pnt

Return
-------
dist11: double
distP12: double
distP21: double
distP22: double

Description
-----------
if the curve is a trimmed curve, dist11 is a square distance between the point on C1 of parameter FirstParameter and the point of parameter FirstParameter on C2.
") TrimmedSquareDistances;
		void TrimmedSquareDistances(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, gp_Pnt & P11, gp_Pnt & P12, gp_Pnt & P21, gp_Pnt & P22);

};


%extend Extrema_ExtCC {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class Extrema_ExtCC2d *
************************/
class Extrema_ExtCC2d {
	public:
		/****** Extrema_ExtCC2d::Extrema_ExtCC2d ******/
		/****** md5 signature: d77841926d1a7c270feae47e00813b8e ******/
		%feature("compactdefaultargs") Extrema_ExtCC2d;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Extrema_ExtCC2d;
		 Extrema_ExtCC2d();

		/****** Extrema_ExtCC2d::Extrema_ExtCC2d ******/
		/****** md5 signature: 325de96534c2b26eebb2d6b59439e78f ******/
		%feature("compactdefaultargs") Extrema_ExtCC2d;
		%feature("autodoc", "
Parameters
----------
C1: Adaptor2d_Curve2d
C2: Adaptor2d_Curve2d
TolC1: double (optional, default to 1.0e-10)
TolC2: double (optional, default to 1.0e-10)

Return
-------
None

Description
-----------
It calculates all the distances.
") Extrema_ExtCC2d;
		 Extrema_ExtCC2d(const Adaptor2d_Curve2d & C1, const Adaptor2d_Curve2d & C2, const double TolC1 = 1.0e-10, const double TolC2 = 1.0e-10);

		/****** Extrema_ExtCC2d::Extrema_ExtCC2d ******/
		/****** md5 signature: ce9e804ec777ed885e017060f4ebcf60 ******/
		%feature("compactdefaultargs") Extrema_ExtCC2d;
		%feature("autodoc", "
Parameters
----------
C1: Adaptor2d_Curve2d
C2: Adaptor2d_Curve2d
U1: double
U2: double
V1: double
V2: double
TolC1: double (optional, default to 1.0e-10)
TolC2: double (optional, default to 1.0e-10)

Return
-------
None

Description
-----------
It calculates all the distances.
") Extrema_ExtCC2d;
		 Extrema_ExtCC2d(const Adaptor2d_Curve2d & C1, const Adaptor2d_Curve2d & C2, const double U1, const double U2, const double V1, const double V2, const double TolC1 = 1.0e-10, const double TolC2 = 1.0e-10);

		/****** Extrema_ExtCC2d::GetSingleSolutionFlag ******/
		/****** md5 signature: 5d1c77c7a523a241b74128b38ef81a1c ******/
		%feature("compactdefaultargs") GetSingleSolutionFlag;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Get flag for single extrema computation. Works on parametric solver only.
") GetSingleSolutionFlag;
		bool GetSingleSolutionFlag();

		/****** Extrema_ExtCC2d::Initialize ******/
		/****** md5 signature: 688613db3134a599a1cc7a7549332e71 ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
C2: Adaptor2d_Curve2d
V1: double
V2: double
TolC1: double (optional, default to 1.0e-10)
TolC2: double (optional, default to 1.0e-10)

Return
-------
None

Description
-----------
initializes the fields.
") Initialize;
		void Initialize(const Adaptor2d_Curve2d & C2, const double V1, const double V2, const double TolC1 = 1.0e-10, const double TolC2 = 1.0e-10);

		/****** Extrema_ExtCC2d::IsDone ******/
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the distances are found.
") IsDone;
		bool IsDone();

		/****** Extrema_ExtCC2d::IsParallel ******/
		/****** md5 signature: 25d4ac955341335e2fbcc4e3737ea518 ******/
		%feature("compactdefaultargs") IsParallel;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the two curves are parallel.
") IsParallel;
		bool IsParallel();

		/****** Extrema_ExtCC2d::NbExt ******/
		/****** md5 signature: a89b8075893780b59ee0d9f6ba576df8 ******/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of extremum distances.
") NbExt;
		int NbExt();

		/****** Extrema_ExtCC2d::Perform ******/
		/****** md5 signature: 1592c2c067dd95ad94b0435373190d5e ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
C1: Adaptor2d_Curve2d
U1: double
U2: double

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const Adaptor2d_Curve2d & C1, const double U1, const double U2);

		/****** Extrema_ExtCC2d::Points ******/
		/****** md5 signature: 0858a7ee8976b90e8852b9a897083022 ******/
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "
Parameters
----------
N: int
P1: Extrema_POnCurv2d
P2: Extrema_POnCurv2d

Return
-------
None

Description
-----------
Returns the points of the Nth extremum distance. P1 is on the first curve, P2 on the second one.
") Points;
		void Points(const int N, Extrema_POnCurv2d & P1, Extrema_POnCurv2d & P2);

		/****** Extrema_ExtCC2d::SetSingleSolutionFlag ******/
		/****** md5 signature: 103181d923f205c8a0ea7d9450218c43 ******/
		%feature("compactdefaultargs") SetSingleSolutionFlag;
		%feature("autodoc", "
Parameters
----------
theSingleSolutionFlag: bool

Return
-------
None

Description
-----------
Set flag for single extrema computation. Works on parametric solver only.
") SetSingleSolutionFlag;
		void SetSingleSolutionFlag(const bool theSingleSolutionFlag);

		/****** Extrema_ExtCC2d::SquareDistance ******/
		/****** md5 signature: 9aebb5df3f18bb9f6020d21a4e91b999 ******/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "
Parameters
----------
N: int (optional, default to 1)

Return
-------
double

Description
-----------
Returns the value of the Nth extremum square distance.
") SquareDistance;
		double SquareDistance(const int N = 1);

		/****** Extrema_ExtCC2d::TrimmedSquareDistances ******/
		/****** md5 signature: 84a98d5913f45fcdca2fa5ef46056830 ******/
		%feature("compactdefaultargs") TrimmedSquareDistances;
		%feature("autodoc", "
Parameters
----------
P11: gp_Pnt2d
P12: gp_Pnt2d
P21: gp_Pnt2d
P22: gp_Pnt2d

Return
-------
dist11: double
distP12: double
distP21: double
distP22: double

Description
-----------
if the curve is a trimmed curve, dist11 is a square distance between the point on C1 of parameter FirstParameter and the point of parameter FirstParameter on C2.
") TrimmedSquareDistances;
		void TrimmedSquareDistances(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, gp_Pnt2d & P11, gp_Pnt2d & P12, gp_Pnt2d & P21, gp_Pnt2d & P22);

};


%extend Extrema_ExtCC2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class Extrema_ExtCS *
**********************/
class Extrema_ExtCS {
	public:
		/****** Extrema_ExtCS::Extrema_ExtCS ******/
		/****** md5 signature: 4e582899e4155536b1138ca532444328 ******/
		%feature("compactdefaultargs") Extrema_ExtCS;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Extrema_ExtCS;
		 Extrema_ExtCS();

		/****** Extrema_ExtCS::Extrema_ExtCS ******/
		/****** md5 signature: 5b1dd6904287e18efa970bf5e0e21953 ******/
		%feature("compactdefaultargs") Extrema_ExtCS;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve
S: Adaptor3d_Surface
TolC: double
TolS: double

Return
-------
None

Description
-----------
It calculates all the distances between C and S.
") Extrema_ExtCS;
		 Extrema_ExtCS(const Adaptor3d_Curve & C, const Adaptor3d_Surface & S, const double TolC, const double TolS);

		/****** Extrema_ExtCS::Extrema_ExtCS ******/
		/****** md5 signature: c5a399f3e2ac1824a606894454631a9e ******/
		%feature("compactdefaultargs") Extrema_ExtCS;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve
S: Adaptor3d_Surface
UCinf: double
UCsup: double
Uinf: double
Usup: double
Vinf: double
Vsup: double
TolC: double
TolS: double

Return
-------
None

Description
-----------
It calculates all the distances between C and S. UCinf and UCmax are the start and end parameters of the curve.
") Extrema_ExtCS;
		 Extrema_ExtCS(const Adaptor3d_Curve & C, const Adaptor3d_Surface & S, const double UCinf, const double UCsup, const double Uinf, const double Usup, const double Vinf, const double Vsup, const double TolC, const double TolS);

		/****** Extrema_ExtCS::Initialize ******/
		/****** md5 signature: 96e268b66756c4177b9b2b61b9afe06f ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
S: Adaptor3d_Surface
TolC: double
TolS: double

Return
-------
None

Description
-----------
Initializes the fields of the algorithm.
") Initialize;
		void Initialize(const Adaptor3d_Surface & S, const double TolC, const double TolS);

		/****** Extrema_ExtCS::Initialize ******/
		/****** md5 signature: b4d9d95e3658fde206d648c6b115a011 ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
S: Adaptor3d_Surface
Uinf: double
Usup: double
Vinf: double
Vsup: double
TolC: double
TolS: double

Return
-------
None

Description
-----------
Initializes the fields of the algorithm.
") Initialize;
		void Initialize(const Adaptor3d_Surface & S, const double Uinf, const double Usup, const double Vinf, const double Vsup, const double TolC, const double TolS);

		/****** Extrema_ExtCS::IsDone ******/
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the distances are found.
") IsDone;
		bool IsDone();

		/****** Extrema_ExtCS::IsParallel ******/
		/****** md5 signature: 25d4ac955341335e2fbcc4e3737ea518 ******/
		%feature("compactdefaultargs") IsParallel;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the curve is on a parallel surface.
") IsParallel;
		bool IsParallel();

		/****** Extrema_ExtCS::NbExt ******/
		/****** md5 signature: a89b8075893780b59ee0d9f6ba576df8 ******/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of extremum distances.
") NbExt;
		int NbExt();

		/****** Extrema_ExtCS::Perform ******/
		/****** md5 signature: 3c813e63e216ff3717ed2a54b19d254b ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve
Uinf: double
Usup: double

Return
-------
None

Description
-----------
Computes the distances. An exception is raised if the fields have not been initialized.
") Perform;
		void Perform(const Adaptor3d_Curve & C, const double Uinf, const double Usup);

		/****** Extrema_ExtCS::Points ******/
		/****** md5 signature: 0a578e5eaa40acc31f072bdb957049c9 ******/
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "
Parameters
----------
N: int
P1: Extrema_POnCurv
P2: Extrema_POnSurf

Return
-------
None

Description
-----------
Returns the point of the Nth resulting distance.
") Points;
		void Points(const int N, Extrema_POnCurv & P1, Extrema_POnSurf & P2);

		/****** Extrema_ExtCS::SquareDistance ******/
		/****** md5 signature: 45671dd8b89548cc9d5c988eae45f1a5 ******/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
double

Description
-----------
Returns the value of the Nth resulting square distance.
") SquareDistance;
		double SquareDistance(const int N);

};


%extend Extrema_ExtCS {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class Extrema_ExtElC *
***********************/
class Extrema_ExtElC {
	public:
		/****** Extrema_ExtElC::Extrema_ExtElC ******/
		/****** md5 signature: 004e98e48c87086a0cef5207641c4089 ******/
		%feature("compactdefaultargs") Extrema_ExtElC;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Extrema_ExtElC;
		 Extrema_ExtElC();

		/****** Extrema_ExtElC::Extrema_ExtElC ******/
		/****** md5 signature: 4263497a19bb6f9fdfaba8982b7a571b ******/
		%feature("compactdefaultargs") Extrema_ExtElC;
		%feature("autodoc", "
Parameters
----------
C1: gp_Lin
C2: gp_Lin
AngTol: double

Return
-------
None

Description
-----------
Calculates the distance between two lines. AngTol is used to test if the lines are parallel: Angle(C1,C2) < AngTol.
") Extrema_ExtElC;
		 Extrema_ExtElC(const gp_Lin & C1, const gp_Lin & C2, const double AngTol);

		/****** Extrema_ExtElC::Extrema_ExtElC ******/
		/****** md5 signature: a5aa100076696f47f717749b44efa7e9 ******/
		%feature("compactdefaultargs") Extrema_ExtElC;
		%feature("autodoc", "
Parameters
----------
C1: gp_Lin
C2: gp_Circ
Tol: double

Return
-------
None

Description
-----------
Calculates the distance between a line and a circle.
") Extrema_ExtElC;
		 Extrema_ExtElC(const gp_Lin & C1, const gp_Circ & C2, const double Tol);

		/****** Extrema_ExtElC::Extrema_ExtElC ******/
		/****** md5 signature: 9fc2edc96231aa3d1ee6d30a8e95ad20 ******/
		%feature("compactdefaultargs") Extrema_ExtElC;
		%feature("autodoc", "
Parameters
----------
C1: gp_Lin
C2: gp_Elips

Return
-------
None

Description
-----------
Calculates the distance between a line and an ellipse.
") Extrema_ExtElC;
		 Extrema_ExtElC(const gp_Lin & C1, const gp_Elips & C2);

		/****** Extrema_ExtElC::Extrema_ExtElC ******/
		/****** md5 signature: ad69aa1eba04b7eed28f66eb8e14cf0f ******/
		%feature("compactdefaultargs") Extrema_ExtElC;
		%feature("autodoc", "
Parameters
----------
C1: gp_Lin
C2: gp_Hypr

Return
-------
None

Description
-----------
Calculates the distance between a line and a hyperbola.
") Extrema_ExtElC;
		 Extrema_ExtElC(const gp_Lin & C1, const gp_Hypr & C2);

		/****** Extrema_ExtElC::Extrema_ExtElC ******/
		/****** md5 signature: 433c188160d67b67d75fa4e3b92c0dee ******/
		%feature("compactdefaultargs") Extrema_ExtElC;
		%feature("autodoc", "
Parameters
----------
C1: gp_Lin
C2: gp_Parab

Return
-------
None

Description
-----------
Calculates the distance between a line and a parabola.
") Extrema_ExtElC;
		 Extrema_ExtElC(const gp_Lin & C1, const gp_Parab & C2);

		/****** Extrema_ExtElC::Extrema_ExtElC ******/
		/****** md5 signature: efeb94b9af53fc947c0accf8cc40dcce ******/
		%feature("compactdefaultargs") Extrema_ExtElC;
		%feature("autodoc", "
Parameters
----------
C1: gp_Circ
C2: gp_Circ

Return
-------
None

Description
-----------
Calculates the distance between two circles. The circles can be parallel or identical.
") Extrema_ExtElC;
		 Extrema_ExtElC(const gp_Circ & C1, const gp_Circ & C2);

		/****** Extrema_ExtElC::IsDone ******/
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the distances are found.
") IsDone;
		bool IsDone();

		/****** Extrema_ExtElC::IsParallel ******/
		/****** md5 signature: 25d4ac955341335e2fbcc4e3737ea518 ******/
		%feature("compactdefaultargs") IsParallel;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the two curves are parallel.
") IsParallel;
		bool IsParallel();

		/****** Extrema_ExtElC::NbExt ******/
		/****** md5 signature: a89b8075893780b59ee0d9f6ba576df8 ******/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of extremum distances.
") NbExt;
		int NbExt();

		/****** Extrema_ExtElC::Points ******/
		/****** md5 signature: bfa511058ea609926c07e72d6f996c85 ******/
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "
Parameters
----------
N: int
P1: Extrema_POnCurv
P2: Extrema_POnCurv

Return
-------
None

Description
-----------
Returns the points of the Nth extremum distance. P1 is on the first curve, P2 on the second one.
") Points;
		void Points(const int N, Extrema_POnCurv & P1, Extrema_POnCurv & P2);

		/****** Extrema_ExtElC::SquareDistance ******/
		/****** md5 signature: 9aebb5df3f18bb9f6020d21a4e91b999 ******/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "
Parameters
----------
N: int (optional, default to 1)

Return
-------
double

Description
-----------
Returns the value of the Nth extremum square distance.
") SquareDistance;
		double SquareDistance(const int N = 1);

};


%extend Extrema_ExtElC {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class Extrema_ExtElC2d *
*************************/
class Extrema_ExtElC2d {
	public:
		/****** Extrema_ExtElC2d::Extrema_ExtElC2d ******/
		/****** md5 signature: 3859a3a4c2fb128440cbad11da1747b4 ******/
		%feature("compactdefaultargs") Extrema_ExtElC2d;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Extrema_ExtElC2d;
		 Extrema_ExtElC2d();

		/****** Extrema_ExtElC2d::Extrema_ExtElC2d ******/
		/****** md5 signature: ef89c8c02e025fd7020357898530d683 ******/
		%feature("compactdefaultargs") Extrema_ExtElC2d;
		%feature("autodoc", "
Parameters
----------
C1: gp_Lin2d
C2: gp_Lin2d
AngTol: double

Return
-------
None

Description
-----------
Calculates the distance between two lines. AngTol is used to test if the lines are parallel: Angle(C1,C2) < AngTol.
") Extrema_ExtElC2d;
		 Extrema_ExtElC2d(const gp_Lin2d & C1, const gp_Lin2d & C2, const double AngTol);

		/****** Extrema_ExtElC2d::Extrema_ExtElC2d ******/
		/****** md5 signature: 5d04935d1a40ccd560b89c20b432dd2f ******/
		%feature("compactdefaultargs") Extrema_ExtElC2d;
		%feature("autodoc", "
Parameters
----------
C1: gp_Lin2d
C2: gp_Circ2d
Tol: double

Return
-------
None

Description
-----------
Calculates the distance between a line and a circle.
") Extrema_ExtElC2d;
		 Extrema_ExtElC2d(const gp_Lin2d & C1, const gp_Circ2d & C2, const double Tol);

		/****** Extrema_ExtElC2d::Extrema_ExtElC2d ******/
		/****** md5 signature: c5e7e832342f09b3e3f5af22bdc53d53 ******/
		%feature("compactdefaultargs") Extrema_ExtElC2d;
		%feature("autodoc", "
Parameters
----------
C1: gp_Lin2d
C2: gp_Elips2d

Return
-------
None

Description
-----------
Calculates the distance between a line and an ellipse.
") Extrema_ExtElC2d;
		 Extrema_ExtElC2d(const gp_Lin2d & C1, const gp_Elips2d & C2);

		/****** Extrema_ExtElC2d::Extrema_ExtElC2d ******/
		/****** md5 signature: 734dd6d1ec09452b28b71c4ba1fe48ef ******/
		%feature("compactdefaultargs") Extrema_ExtElC2d;
		%feature("autodoc", "
Parameters
----------
C1: gp_Lin2d
C2: gp_Hypr2d

Return
-------
None

Description
-----------
Calculates the distance between a line and a hyperbola.
") Extrema_ExtElC2d;
		 Extrema_ExtElC2d(const gp_Lin2d & C1, const gp_Hypr2d & C2);

		/****** Extrema_ExtElC2d::Extrema_ExtElC2d ******/
		/****** md5 signature: 5d76994c6ec8a2dbc6f33680f5976c43 ******/
		%feature("compactdefaultargs") Extrema_ExtElC2d;
		%feature("autodoc", "
Parameters
----------
C1: gp_Lin2d
C2: gp_Parab2d

Return
-------
None

Description
-----------
Calculates the distance between a line and a parabola.
") Extrema_ExtElC2d;
		 Extrema_ExtElC2d(const gp_Lin2d & C1, const gp_Parab2d & C2);

		/****** Extrema_ExtElC2d::Extrema_ExtElC2d ******/
		/****** md5 signature: dc63d7b4da8be491292987ddc30c1e8d ******/
		%feature("compactdefaultargs") Extrema_ExtElC2d;
		%feature("autodoc", "
Parameters
----------
C1: gp_Circ2d
C2: gp_Circ2d

Return
-------
None

Description
-----------
Calculates the distance between two circles. The circles can be parallel or identical.
") Extrema_ExtElC2d;
		 Extrema_ExtElC2d(const gp_Circ2d & C1, const gp_Circ2d & C2);

		/****** Extrema_ExtElC2d::Extrema_ExtElC2d ******/
		/****** md5 signature: 9dfec4428f361b16a6bad7c8b994c894 ******/
		%feature("compactdefaultargs") Extrema_ExtElC2d;
		%feature("autodoc", "
Parameters
----------
C1: gp_Circ2d
C2: gp_Elips2d

Return
-------
None

Description
-----------
Calculates the distance between a circle and an ellipse.
") Extrema_ExtElC2d;
		 Extrema_ExtElC2d(const gp_Circ2d & C1, const gp_Elips2d & C2);

		/****** Extrema_ExtElC2d::Extrema_ExtElC2d ******/
		/****** md5 signature: 5edbe9f00fc3b3dc62425701202dcab7 ******/
		%feature("compactdefaultargs") Extrema_ExtElC2d;
		%feature("autodoc", "
Parameters
----------
C1: gp_Circ2d
C2: gp_Hypr2d

Return
-------
None

Description
-----------
Calculates the distance between a circle and a hyperbola.
") Extrema_ExtElC2d;
		 Extrema_ExtElC2d(const gp_Circ2d & C1, const gp_Hypr2d & C2);

		/****** Extrema_ExtElC2d::Extrema_ExtElC2d ******/
		/****** md5 signature: 9da5fa8b4354a798c26fde12bca15f59 ******/
		%feature("compactdefaultargs") Extrema_ExtElC2d;
		%feature("autodoc", "
Parameters
----------
C1: gp_Circ2d
C2: gp_Parab2d

Return
-------
None

Description
-----------
Calculates the distance between a circle and a parabola.
") Extrema_ExtElC2d;
		 Extrema_ExtElC2d(const gp_Circ2d & C1, const gp_Parab2d & C2);

		/****** Extrema_ExtElC2d::IsDone ******/
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the distances are found.
") IsDone;
		bool IsDone();

		/****** Extrema_ExtElC2d::IsParallel ******/
		/****** md5 signature: 25d4ac955341335e2fbcc4e3737ea518 ******/
		%feature("compactdefaultargs") IsParallel;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the two curves are parallel.
") IsParallel;
		bool IsParallel();

		/****** Extrema_ExtElC2d::NbExt ******/
		/****** md5 signature: a89b8075893780b59ee0d9f6ba576df8 ******/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of extremum distances.
") NbExt;
		int NbExt();

		/****** Extrema_ExtElC2d::Points ******/
		/****** md5 signature: 0858a7ee8976b90e8852b9a897083022 ******/
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "
Parameters
----------
N: int
P1: Extrema_POnCurv2d
P2: Extrema_POnCurv2d

Return
-------
None

Description
-----------
Returns the points of the Nth extremum distance. P1 is on the first curve, P2 on the second one.
") Points;
		void Points(const int N, Extrema_POnCurv2d & P1, Extrema_POnCurv2d & P2);

		/****** Extrema_ExtElC2d::SquareDistance ******/
		/****** md5 signature: 9aebb5df3f18bb9f6020d21a4e91b999 ******/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "
Parameters
----------
N: int (optional, default to 1)

Return
-------
double

Description
-----------
Returns the value of the Nth extremum square distance.
") SquareDistance;
		double SquareDistance(const int N = 1);

};


%extend Extrema_ExtElC2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class Extrema_ExtElCS *
************************/
class Extrema_ExtElCS {
	public:
		/****** Extrema_ExtElCS::Extrema_ExtElCS ******/
		/****** md5 signature: f972ab4716d5de863647c4d782d4f719 ******/
		%feature("compactdefaultargs") Extrema_ExtElCS;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Extrema_ExtElCS;
		 Extrema_ExtElCS();

		/****** Extrema_ExtElCS::Extrema_ExtElCS ******/
		/****** md5 signature: db7d0474d65f1c3ea06c597c9b1064b2 ******/
		%feature("compactdefaultargs") Extrema_ExtElCS;
		%feature("autodoc", "
Parameters
----------
C: gp_Lin
S: gp_Pln

Return
-------
None

Description
-----------
Calculates the distances between a line and a plane. The line can be on the plane or on a parallel plane.
") Extrema_ExtElCS;
		 Extrema_ExtElCS(const gp_Lin & C, const gp_Pln & S);

		/****** Extrema_ExtElCS::Extrema_ExtElCS ******/
		/****** md5 signature: c0d2bcdb0f53cdd2d27d7b05d87048fc ******/
		%feature("compactdefaultargs") Extrema_ExtElCS;
		%feature("autodoc", "
Parameters
----------
C: gp_Lin
S: gp_Cylinder

Return
-------
None

Description
-----------
Calculates the distances between a line and a cylinder.
") Extrema_ExtElCS;
		 Extrema_ExtElCS(const gp_Lin & C, const gp_Cylinder & S);

		/****** Extrema_ExtElCS::Extrema_ExtElCS ******/
		/****** md5 signature: 4a6eb2f64f823821ccb456c18b3730b5 ******/
		%feature("compactdefaultargs") Extrema_ExtElCS;
		%feature("autodoc", "
Parameters
----------
C: gp_Lin
S: gp_Cone

Return
-------
None

Description
-----------
Calculates the distances between a line and a cone.
") Extrema_ExtElCS;
		 Extrema_ExtElCS(const gp_Lin & C, const gp_Cone & S);

		/****** Extrema_ExtElCS::Extrema_ExtElCS ******/
		/****** md5 signature: 0bbd80f7ce8fd4b777392404e4748607 ******/
		%feature("compactdefaultargs") Extrema_ExtElCS;
		%feature("autodoc", "
Parameters
----------
C: gp_Lin
S: gp_Sphere

Return
-------
None

Description
-----------
Calculates the distances between a line and a sphere.
") Extrema_ExtElCS;
		 Extrema_ExtElCS(const gp_Lin & C, const gp_Sphere & S);

		/****** Extrema_ExtElCS::Extrema_ExtElCS ******/
		/****** md5 signature: 3d525b570639c11fefd86b2e7c84552e ******/
		%feature("compactdefaultargs") Extrema_ExtElCS;
		%feature("autodoc", "
Parameters
----------
C: gp_Lin
S: gp_Torus

Return
-------
None

Description
-----------
Calculates the distances between a line and a torus.
") Extrema_ExtElCS;
		 Extrema_ExtElCS(const gp_Lin & C, const gp_Torus & S);

		/****** Extrema_ExtElCS::Extrema_ExtElCS ******/
		/****** md5 signature: a0af8e62e1b3c35b9d74c2fe0aa8ec30 ******/
		%feature("compactdefaultargs") Extrema_ExtElCS;
		%feature("autodoc", "
Parameters
----------
C: gp_Circ
S: gp_Pln

Return
-------
None

Description
-----------
Calculates the distances between a circle and a plane.
") Extrema_ExtElCS;
		 Extrema_ExtElCS(const gp_Circ & C, const gp_Pln & S);

		/****** Extrema_ExtElCS::Extrema_ExtElCS ******/
		/****** md5 signature: d51444d34658575972b8c800686ab9b6 ******/
		%feature("compactdefaultargs") Extrema_ExtElCS;
		%feature("autodoc", "
Parameters
----------
C: gp_Circ
S: gp_Cylinder

Return
-------
None

Description
-----------
Calculates the distances between a circle and a cylinder.
") Extrema_ExtElCS;
		 Extrema_ExtElCS(const gp_Circ & C, const gp_Cylinder & S);

		/****** Extrema_ExtElCS::Extrema_ExtElCS ******/
		/****** md5 signature: 2f5894f6aa2bb5c5c44c71cdfb702b1f ******/
		%feature("compactdefaultargs") Extrema_ExtElCS;
		%feature("autodoc", "
Parameters
----------
C: gp_Circ
S: gp_Cone

Return
-------
None

Description
-----------
Calculates the distances between a circle and a cone.
") Extrema_ExtElCS;
		 Extrema_ExtElCS(const gp_Circ & C, const gp_Cone & S);

		/****** Extrema_ExtElCS::Extrema_ExtElCS ******/
		/****** md5 signature: 67d7cc9a8eb544114fb772f2cd6645a1 ******/
		%feature("compactdefaultargs") Extrema_ExtElCS;
		%feature("autodoc", "
Parameters
----------
C: gp_Circ
S: gp_Sphere

Return
-------
None

Description
-----------
Calculates the distances between a circle and a sphere.
") Extrema_ExtElCS;
		 Extrema_ExtElCS(const gp_Circ & C, const gp_Sphere & S);

		/****** Extrema_ExtElCS::Extrema_ExtElCS ******/
		/****** md5 signature: 65c35a71b119fb9a5fe14416416247de ******/
		%feature("compactdefaultargs") Extrema_ExtElCS;
		%feature("autodoc", "
Parameters
----------
C: gp_Circ
S: gp_Torus

Return
-------
None

Description
-----------
Calculates the distances between a circle and a torus.
") Extrema_ExtElCS;
		 Extrema_ExtElCS(const gp_Circ & C, const gp_Torus & S);

		/****** Extrema_ExtElCS::Extrema_ExtElCS ******/
		/****** md5 signature: ea55755f1f248cc3e575d19fc850a68c ******/
		%feature("compactdefaultargs") Extrema_ExtElCS;
		%feature("autodoc", "
Parameters
----------
C: gp_Hypr
S: gp_Pln

Return
-------
None

Description
-----------
Calculates the distances between a hyperbola and a plane.
") Extrema_ExtElCS;
		 Extrema_ExtElCS(const gp_Hypr & C, const gp_Pln & S);

		/****** Extrema_ExtElCS::IsDone ******/
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the distances are found.
") IsDone;
		bool IsDone();

		/****** Extrema_ExtElCS::IsParallel ******/
		/****** md5 signature: 25d4ac955341335e2fbcc4e3737ea518 ******/
		%feature("compactdefaultargs") IsParallel;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the curve is on a parallel surface.
") IsParallel;
		bool IsParallel();

		/****** Extrema_ExtElCS::NbExt ******/
		/****** md5 signature: a89b8075893780b59ee0d9f6ba576df8 ******/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of extremum distances.
") NbExt;
		int NbExt();

		/****** Extrema_ExtElCS::Perform ******/
		/****** md5 signature: 53338ec9217fe501d1c94d408fbb526a ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
C: gp_Lin
S: gp_Pln

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const gp_Lin & C, const gp_Pln & S);

		/****** Extrema_ExtElCS::Perform ******/
		/****** md5 signature: 3c9464740ac1157499031017e0cfbb64 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
C: gp_Lin
S: gp_Cylinder

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const gp_Lin & C, const gp_Cylinder & S);

		/****** Extrema_ExtElCS::Perform ******/
		/****** md5 signature: 521a4ef5d866669e33b3ca356fd51e79 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
C: gp_Lin
S: gp_Cone

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const gp_Lin & C, const gp_Cone & S);

		/****** Extrema_ExtElCS::Perform ******/
		/****** md5 signature: 69cd757c0bc859fb33a39049adc05fc0 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
C: gp_Lin
S: gp_Sphere

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const gp_Lin & C, const gp_Sphere & S);

		/****** Extrema_ExtElCS::Perform ******/
		/****** md5 signature: d5c283eb996063c758bc4ea115ab544a ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
C: gp_Lin
S: gp_Torus

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const gp_Lin & C, const gp_Torus & S);

		/****** Extrema_ExtElCS::Perform ******/
		/****** md5 signature: 66884cd7b5b0d6e6d66f8b6d99e4d8db ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
C: gp_Circ
S: gp_Pln

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const gp_Circ & C, const gp_Pln & S);

		/****** Extrema_ExtElCS::Perform ******/
		/****** md5 signature: 27ad618f21410a465523c3454a53b19a ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
C: gp_Circ
S: gp_Cylinder

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const gp_Circ & C, const gp_Cylinder & S);

		/****** Extrema_ExtElCS::Perform ******/
		/****** md5 signature: 5d0f7254160c3c0cb46a9b6f6abd5939 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
C: gp_Circ
S: gp_Cone

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const gp_Circ & C, const gp_Cone & S);

		/****** Extrema_ExtElCS::Perform ******/
		/****** md5 signature: b5bf6a02a309dc0ef23ec19efe9db94f ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
C: gp_Circ
S: gp_Sphere

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const gp_Circ & C, const gp_Sphere & S);

		/****** Extrema_ExtElCS::Perform ******/
		/****** md5 signature: c261ca51addce2475acf5b4ca1e7a468 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
C: gp_Circ
S: gp_Torus

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const gp_Circ & C, const gp_Torus & S);

		/****** Extrema_ExtElCS::Perform ******/
		/****** md5 signature: 3c188f0396340861834945ca664cf796 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
C: gp_Hypr
S: gp_Pln

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const gp_Hypr & C, const gp_Pln & S);

		/****** Extrema_ExtElCS::Points ******/
		/****** md5 signature: 0a578e5eaa40acc31f072bdb957049c9 ******/
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "
Parameters
----------
N: int
P1: Extrema_POnCurv
P2: Extrema_POnSurf

Return
-------
None

Description
-----------
Returns the points of the Nth extremum distance. P1 is on the curve, P2 on the surface.
") Points;
		void Points(const int N, Extrema_POnCurv & P1, Extrema_POnSurf & P2);

		/****** Extrema_ExtElCS::SquareDistance ******/
		/****** md5 signature: 9aebb5df3f18bb9f6020d21a4e91b999 ******/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "
Parameters
----------
N: int (optional, default to 1)

Return
-------
double

Description
-----------
Returns the value of the Nth extremum square distance.
") SquareDistance;
		double SquareDistance(const int N = 1);

};


%extend Extrema_ExtElCS {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class Extrema_ExtElSS *
************************/
class Extrema_ExtElSS {
	public:
		/****** Extrema_ExtElSS::Extrema_ExtElSS ******/
		/****** md5 signature: 8e0497b9837638576257bc0d167c4464 ******/
		%feature("compactdefaultargs") Extrema_ExtElSS;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Extrema_ExtElSS;
		 Extrema_ExtElSS();

		/****** Extrema_ExtElSS::Extrema_ExtElSS ******/
		/****** md5 signature: b925c2a494c3713b8f7e0a979e88dfaa ******/
		%feature("compactdefaultargs") Extrema_ExtElSS;
		%feature("autodoc", "
Parameters
----------
S1: gp_Pln
S2: gp_Pln

Return
-------
None

Description
-----------
Calculates the distances between 2 planes. These planes can be parallel.
") Extrema_ExtElSS;
		 Extrema_ExtElSS(const gp_Pln & S1, const gp_Pln & S2);

		/****** Extrema_ExtElSS::Extrema_ExtElSS ******/
		/****** md5 signature: d683aa7715cf5ab1b592487723c2c527 ******/
		%feature("compactdefaultargs") Extrema_ExtElSS;
		%feature("autodoc", "
Parameters
----------
S1: gp_Pln
S2: gp_Sphere

Return
-------
None

Description
-----------
Calculates the distances between a plane and a sphere.
") Extrema_ExtElSS;
		 Extrema_ExtElSS(const gp_Pln & S1, const gp_Sphere & S2);

		/****** Extrema_ExtElSS::Extrema_ExtElSS ******/
		/****** md5 signature: e4073adaaba080c0db7787020eb2e790 ******/
		%feature("compactdefaultargs") Extrema_ExtElSS;
		%feature("autodoc", "
Parameters
----------
S1: gp_Sphere
S2: gp_Sphere

Return
-------
None

Description
-----------
Calculates the distances between 2 spheres. These spheres can be parallel.
") Extrema_ExtElSS;
		 Extrema_ExtElSS(const gp_Sphere & S1, const gp_Sphere & S2);

		/****** Extrema_ExtElSS::Extrema_ExtElSS ******/
		/****** md5 signature: b2af663e183526c2799b073df395497f ******/
		%feature("compactdefaultargs") Extrema_ExtElSS;
		%feature("autodoc", "
Parameters
----------
S1: gp_Sphere
S2: gp_Cylinder

Return
-------
None

Description
-----------
Calculates the distances between a sphere and a cylinder.
") Extrema_ExtElSS;
		 Extrema_ExtElSS(const gp_Sphere & S1, const gp_Cylinder & S2);

		/****** Extrema_ExtElSS::Extrema_ExtElSS ******/
		/****** md5 signature: 47f34cd25801d4da4c0b2b113413a994 ******/
		%feature("compactdefaultargs") Extrema_ExtElSS;
		%feature("autodoc", "
Parameters
----------
S1: gp_Sphere
S2: gp_Cone

Return
-------
None

Description
-----------
Calculates the distances between a sphere and a cone.
") Extrema_ExtElSS;
		 Extrema_ExtElSS(const gp_Sphere & S1, const gp_Cone & S2);

		/****** Extrema_ExtElSS::Extrema_ExtElSS ******/
		/****** md5 signature: 297d959d30c1c20de7718eb3081a702f ******/
		%feature("compactdefaultargs") Extrema_ExtElSS;
		%feature("autodoc", "
Parameters
----------
S1: gp_Sphere
S2: gp_Torus

Return
-------
None

Description
-----------
Calculates the distances between a sphere and a torus.
") Extrema_ExtElSS;
		 Extrema_ExtElSS(const gp_Sphere & S1, const gp_Torus & S2);

		/****** Extrema_ExtElSS::IsDone ******/
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the distances are found.
") IsDone;
		bool IsDone();

		/****** Extrema_ExtElSS::IsParallel ******/
		/****** md5 signature: 25d4ac955341335e2fbcc4e3737ea518 ******/
		%feature("compactdefaultargs") IsParallel;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the two surfaces are parallel.
") IsParallel;
		bool IsParallel();

		/****** Extrema_ExtElSS::NbExt ******/
		/****** md5 signature: a89b8075893780b59ee0d9f6ba576df8 ******/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of extremum distances.
") NbExt;
		int NbExt();

		/****** Extrema_ExtElSS::Perform ******/
		/****** md5 signature: ce57f9a43effeb78e12cb61797bc6543 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
S1: gp_Pln
S2: gp_Pln

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const gp_Pln & S1, const gp_Pln & S2);

		/****** Extrema_ExtElSS::Perform ******/
		/****** md5 signature: 76cf61b7e9ca82144308666f7f41665c ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
S1: gp_Pln
S2: gp_Sphere

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const gp_Pln & S1, const gp_Sphere & S2);

		/****** Extrema_ExtElSS::Perform ******/
		/****** md5 signature: 1c6acec214ff9b00343214969dc126aa ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
S1: gp_Sphere
S2: gp_Sphere

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const gp_Sphere & S1, const gp_Sphere & S2);

		/****** Extrema_ExtElSS::Perform ******/
		/****** md5 signature: 8f8ce841d48bba33b76369ea3172be0a ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
S1: gp_Sphere
S2: gp_Cylinder

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const gp_Sphere & S1, const gp_Cylinder & S2);

		/****** Extrema_ExtElSS::Perform ******/
		/****** md5 signature: 5ed2cdeb590464eda15e6c060f138d87 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
S1: gp_Sphere
S2: gp_Cone

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const gp_Sphere & S1, const gp_Cone & S2);

		/****** Extrema_ExtElSS::Perform ******/
		/****** md5 signature: 18f99d4382bb3381950649a5e72e1bd3 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
S1: gp_Sphere
S2: gp_Torus

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const gp_Sphere & S1, const gp_Torus & S2);

		/****** Extrema_ExtElSS::Points ******/
		/****** md5 signature: 9262cd0fd0c25e9045f929bf930dd606 ******/
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "
Parameters
----------
N: int
P1: Extrema_POnSurf
P2: Extrema_POnSurf

Return
-------
None

Description
-----------
Returns the points for the Nth resulting distance. P1 is on the first surface, P2 on the second one.
") Points;
		void Points(const int N, Extrema_POnSurf & P1, Extrema_POnSurf & P2);

		/****** Extrema_ExtElSS::SquareDistance ******/
		/****** md5 signature: 9aebb5df3f18bb9f6020d21a4e91b999 ******/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "
Parameters
----------
N: int (optional, default to 1)

Return
-------
double

Description
-----------
Returns the value of the Nth extremum square distance.
") SquareDistance;
		double SquareDistance(const int N = 1);

};


%extend Extrema_ExtElSS {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class Extrema_ExtPElC *
************************/
class Extrema_ExtPElC {
	public:
		/****** Extrema_ExtPElC::Extrema_ExtPElC ******/
		/****** md5 signature: aa316f8b6ce8c27e119c835cba4d43bb ******/
		%feature("compactdefaultargs") Extrema_ExtPElC;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Extrema_ExtPElC;
		 Extrema_ExtPElC();

		/****** Extrema_ExtPElC::Extrema_ExtPElC ******/
		/****** md5 signature: 1156ecd87c9d6306ae3c3ccb3b237cc6 ******/
		%feature("compactdefaultargs") Extrema_ExtPElC;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
C: gp_Lin
Tol: double
Uinf: double
Usup: double

Return
-------
None

Description
-----------
Calculates the extremum distance between the point P and the segment [Uinf,Usup] of the line C.
") Extrema_ExtPElC;
		 Extrema_ExtPElC(const gp_Pnt & P, const gp_Lin & C, const double Tol, const double Uinf, const double Usup);

		/****** Extrema_ExtPElC::Extrema_ExtPElC ******/
		/****** md5 signature: df288458512125c2560c3f6aeff2d6e1 ******/
		%feature("compactdefaultargs") Extrema_ExtPElC;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
C: gp_Circ
Tol: double
Uinf: double
Usup: double

Return
-------
None

Description
-----------
Calculates the 2 extremum distances between the point P and the segment [Uinf,Usup] of the circle C. Tol is used to determine if P is on the axis of the circle or if an extremum is on an endpoint of the segment. If P is on the axis of the circle, there are infinite solution then IsDone(me)=False. The conditions on the Uinf and Usup are: 0. <= Uinf <= 2.*PI and Usup > Uinf. If Usup > Uinf + 2.*PI, then only the solutions in the range [Uinf,Uinf+2.*PI[ are computed.
") Extrema_ExtPElC;
		 Extrema_ExtPElC(const gp_Pnt & P, const gp_Circ & C, const double Tol, const double Uinf, const double Usup);

		/****** Extrema_ExtPElC::Extrema_ExtPElC ******/
		/****** md5 signature: 28456734baac6c8a97b24053aeeb93fe ******/
		%feature("compactdefaultargs") Extrema_ExtPElC;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
C: gp_Elips
Tol: double
Uinf: double
Usup: double

Return
-------
None

Description
-----------
Calculates the 4 extremum distances between the point P and the segment [Uinf,Usup] of the ellipse C. Tol is used to determine if the point is on the axis of the ellipse and if the major radius is equal to the minor radius or if an extremum is on an endpoint of the segment. If P is on the axis of the ellipse, there are infinite solution then IsDone(me)=False. The conditions on the Uinf and Usup are: 0. <= Uinf <= 2.*PI and Usup > Uinf. If Usup > Uinf + 2.*PI, then only the solutions in the range [Uinf,Uinf+2.*PI[ are computed.
") Extrema_ExtPElC;
		 Extrema_ExtPElC(const gp_Pnt & P, const gp_Elips & C, const double Tol, const double Uinf, const double Usup);

		/****** Extrema_ExtPElC::Extrema_ExtPElC ******/
		/****** md5 signature: 7d02e76b179522d231860f858e3d37b7 ******/
		%feature("compactdefaultargs") Extrema_ExtPElC;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
C: gp_Hypr
Tol: double
Uinf: double
Usup: double

Return
-------
None

Description
-----------
Calculates the extremum distances between the point P and the segment [Uinf,Usup] of the hyperbola C. Tol is used to determine if two solutions u and v are identical; the condition is: dist(C(u),C(v)) < Tol.
") Extrema_ExtPElC;
		 Extrema_ExtPElC(const gp_Pnt & P, const gp_Hypr & C, const double Tol, const double Uinf, const double Usup);

		/****** Extrema_ExtPElC::Extrema_ExtPElC ******/
		/****** md5 signature: 85ac52c6a9a3fb64b5afc8d09544e26f ******/
		%feature("compactdefaultargs") Extrema_ExtPElC;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
C: gp_Parab
Tol: double
Uinf: double
Usup: double

Return
-------
None

Description
-----------
Calculates the 4 extremum distances between the point P and the segment [Uinf,Usup] of the parabola C. Tol is used to determine if two solutions u and v are identical; the condition is: dist(C(u),C(v)) < Tol.
") Extrema_ExtPElC;
		 Extrema_ExtPElC(const gp_Pnt & P, const gp_Parab & C, const double Tol, const double Uinf, const double Usup);

		/****** Extrema_ExtPElC::IsDone ******/
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
True if the distances are found.
") IsDone;
		bool IsDone();

		/****** Extrema_ExtPElC::IsMin ******/
		/****** md5 signature: 89550d4f3d6c9d0eb3eaa07222d96853 ******/
		%feature("compactdefaultargs") IsMin;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
bool

Description
-----------
Returns True if the Nth extremum distance is a minimum.
") IsMin;
		bool IsMin(const int N);

		/****** Extrema_ExtPElC::NbExt ******/
		/****** md5 signature: a89b8075893780b59ee0d9f6ba576df8 ******/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of extremum distances.
") NbExt;
		int NbExt();

		/****** Extrema_ExtPElC::Perform ******/
		/****** md5 signature: 86e59413eed5ac4ff20d6accf0a37f4d ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
C: gp_Lin
Tol: double
Uinf: double
Usup: double

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const gp_Pnt & P, const gp_Lin & C, const double Tol, const double Uinf, const double Usup);

		/****** Extrema_ExtPElC::Perform ******/
		/****** md5 signature: 090c47965c8e52f51429728fcd404f97 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
C: gp_Circ
Tol: double
Uinf: double
Usup: double

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const gp_Pnt & P, const gp_Circ & C, const double Tol, const double Uinf, const double Usup);

		/****** Extrema_ExtPElC::Perform ******/
		/****** md5 signature: 1a2eb201fe9b5687c6d82e25f546818b ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
C: gp_Elips
Tol: double
Uinf: double
Usup: double

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const gp_Pnt & P, const gp_Elips & C, const double Tol, const double Uinf, const double Usup);

		/****** Extrema_ExtPElC::Perform ******/
		/****** md5 signature: 37ea38701249f1c4fda8d847bead4744 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
C: gp_Hypr
Tol: double
Uinf: double
Usup: double

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const gp_Pnt & P, const gp_Hypr & C, const double Tol, const double Uinf, const double Usup);

		/****** Extrema_ExtPElC::Perform ******/
		/****** md5 signature: f7abee264f34a0b63b9586fbd57d62eb ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
C: gp_Parab
Tol: double
Uinf: double
Usup: double

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const gp_Pnt & P, const gp_Parab & C, const double Tol, const double Uinf, const double Usup);

		/****** Extrema_ExtPElC::Point ******/
		/****** md5 signature: 958d48738e82612b04072d79f68ca66f ******/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
Extrema_POnCurv

Description
-----------
Returns the point of the Nth extremum distance.
") Point;
		const Extrema_POnCurv & Point(const int N);

		/****** Extrema_ExtPElC::SquareDistance ******/
		/****** md5 signature: 45671dd8b89548cc9d5c988eae45f1a5 ******/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
double

Description
-----------
Returns the value of the Nth extremum square distance.
") SquareDistance;
		double SquareDistance(const int N);

};


%extend Extrema_ExtPElC {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class Extrema_ExtPElC2d *
**************************/
class Extrema_ExtPElC2d {
	public:
		/****** Extrema_ExtPElC2d::Extrema_ExtPElC2d ******/
		/****** md5 signature: 917f2d7035567fb4d5e2a70c1b9e20ce ******/
		%feature("compactdefaultargs") Extrema_ExtPElC2d;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Extrema_ExtPElC2d;
		 Extrema_ExtPElC2d();

		/****** Extrema_ExtPElC2d::Extrema_ExtPElC2d ******/
		/****** md5 signature: 7c5653b4cb822d4190c2bc2ee8163850 ******/
		%feature("compactdefaultargs") Extrema_ExtPElC2d;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt2d
C: gp_Lin2d
Tol: double
Uinf: double
Usup: double

Return
-------
None

Description
-----------
Calculates the extremum distance between the point P and the segment [Uinf,Usup] of the line L.
") Extrema_ExtPElC2d;
		 Extrema_ExtPElC2d(const gp_Pnt2d & P, const gp_Lin2d & C, const double Tol, const double Uinf, const double Usup);

		/****** Extrema_ExtPElC2d::Extrema_ExtPElC2d ******/
		/****** md5 signature: f0b1fa675ac7cbdc78b01a5a218ee751 ******/
		%feature("compactdefaultargs") Extrema_ExtPElC2d;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt2d
C: gp_Circ2d
Tol: double
Uinf: double
Usup: double

Return
-------
None

Description
-----------
Calculates the 2 extremum distances between the point P and the segment [Uinf,Usup] of the circle C. Tol is used to determine if P is on the axis of the circle or if an extremum is on an endpoint of the segment. If P is on the axis of the circle, there are infinite solution then IsDone(me)=False. The conditions on the Uinf and Usup are: 0. <= Uinf <= 2.*PI and Usup > Uinf. If Usup > Uinf + 2.*PI, then only the solutions in the range [Uinf,Uinf+2.*PI[ are computed.
") Extrema_ExtPElC2d;
		 Extrema_ExtPElC2d(const gp_Pnt2d & P, const gp_Circ2d & C, const double Tol, const double Uinf, const double Usup);

		/****** Extrema_ExtPElC2d::Extrema_ExtPElC2d ******/
		/****** md5 signature: 9274d2b7dd717dc936e5489da56e545e ******/
		%feature("compactdefaultargs") Extrema_ExtPElC2d;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt2d
C: gp_Elips2d
Tol: double
Uinf: double
Usup: double

Return
-------
None

Description
-----------
Calculates the 4 extremum distances between the point P and the segment [Uinf,Usup] of the ellipse C. Tol is used to determine if the point is on the axis of the ellipse and if the major radius is equal to the minor radius or if an extremum is on an endpoint of the segment. If P is on the axis of the ellipse, there are infinite solution then IsDone(me)=False. The conditions on the Uinf and Usup are: 0. <= Uinf <= 2.*PI and Usup > Uinf. If Usup > Uinf + 2.*PI, then only the solutions in the range [Uinf,Uinf+2.*PI[ are computed.
") Extrema_ExtPElC2d;
		 Extrema_ExtPElC2d(const gp_Pnt2d & P, const gp_Elips2d & C, const double Tol, const double Uinf, const double Usup);

		/****** Extrema_ExtPElC2d::Extrema_ExtPElC2d ******/
		/****** md5 signature: f98cf514f92842353a0aa971ff04e712 ******/
		%feature("compactdefaultargs") Extrema_ExtPElC2d;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt2d
C: gp_Hypr2d
Tol: double
Uinf: double
Usup: double

Return
-------
None

Description
-----------
Calculates the extremum distances between the point P and the segment [Uinf,Usup] of the hyperbola C. Tol is used to determine if two solutions u and v are identical; the condition is: dist(C(u),C(v)) < Tol.
") Extrema_ExtPElC2d;
		 Extrema_ExtPElC2d(const gp_Pnt2d & P, const gp_Hypr2d & C, const double Tol, const double Uinf, const double Usup);

		/****** Extrema_ExtPElC2d::Extrema_ExtPElC2d ******/
		/****** md5 signature: 73cf3904f5a9cc657d9c0137bd3a5490 ******/
		%feature("compactdefaultargs") Extrema_ExtPElC2d;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt2d
C: gp_Parab2d
Tol: double
Uinf: double
Usup: double

Return
-------
None

Description
-----------
Calculates the 4 extremum distances between the point P and the segment [Uinf,Usup] of the parabola C. Tol is used to determine if two solutions u and v are identical; the condition is: dist(C(u),C(v)) < Tol.
") Extrema_ExtPElC2d;
		 Extrema_ExtPElC2d(const gp_Pnt2d & P, const gp_Parab2d & C, const double Tol, const double Uinf, const double Usup);

		/****** Extrema_ExtPElC2d::IsDone ******/
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
True if the distances are found.
") IsDone;
		bool IsDone();

		/****** Extrema_ExtPElC2d::IsMin ******/
		/****** md5 signature: 89550d4f3d6c9d0eb3eaa07222d96853 ******/
		%feature("compactdefaultargs") IsMin;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
bool

Description
-----------
Returns True if the Nth extremum distance is a minimum.
") IsMin;
		bool IsMin(const int N);

		/****** Extrema_ExtPElC2d::NbExt ******/
		/****** md5 signature: a89b8075893780b59ee0d9f6ba576df8 ******/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of extremum distances.
") NbExt;
		int NbExt();

		/****** Extrema_ExtPElC2d::Perform ******/
		/****** md5 signature: a8f9c80e12b0dba790a660ce3b06ab26 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt2d
L: gp_Lin2d
Tol: double
Uinf: double
Usup: double

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const gp_Pnt2d & P, const gp_Lin2d & L, const double Tol, const double Uinf, const double Usup);

		/****** Extrema_ExtPElC2d::Perform ******/
		/****** md5 signature: 4ad8b14e618d648f0b9fc2dea285b90b ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt2d
C: gp_Circ2d
Tol: double
Uinf: double
Usup: double

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const gp_Pnt2d & P, const gp_Circ2d & C, const double Tol, const double Uinf, const double Usup);

		/****** Extrema_ExtPElC2d::Perform ******/
		/****** md5 signature: e73768d2e5aa91f63e2328a28457e27d ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt2d
C: gp_Elips2d
Tol: double
Uinf: double
Usup: double

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const gp_Pnt2d & P, const gp_Elips2d & C, const double Tol, const double Uinf, const double Usup);

		/****** Extrema_ExtPElC2d::Perform ******/
		/****** md5 signature: affe9121e0b4db9349fe6fa43fe1af2d ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt2d
C: gp_Hypr2d
Tol: double
Uinf: double
Usup: double

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const gp_Pnt2d & P, const gp_Hypr2d & C, const double Tol, const double Uinf, const double Usup);

		/****** Extrema_ExtPElC2d::Perform ******/
		/****** md5 signature: 3085bb55d39e582cec071fbb092857f0 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt2d
C: gp_Parab2d
Tol: double
Uinf: double
Usup: double

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const gp_Pnt2d & P, const gp_Parab2d & C, const double Tol, const double Uinf, const double Usup);

		/****** Extrema_ExtPElC2d::Point ******/
		/****** md5 signature: e5ed9824585db5a84b974c877f2f3707 ******/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
Extrema_POnCurv2d

Description
-----------
Returns the point of the Nth extremum distance.
") Point;
		const Extrema_POnCurv2d & Point(const int N);

		/****** Extrema_ExtPElC2d::SquareDistance ******/
		/****** md5 signature: 45671dd8b89548cc9d5c988eae45f1a5 ******/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
double

Description
-----------
Returns the value of the Nth extremum square distance.
") SquareDistance;
		double SquareDistance(const int N);

};


%extend Extrema_ExtPElC2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class Extrema_ExtPElS *
************************/
class Extrema_ExtPElS {
	public:
		/****** Extrema_ExtPElS::Extrema_ExtPElS ******/
		/****** md5 signature: 26281c034aa20ce7723ae98262f1a76b ******/
		%feature("compactdefaultargs") Extrema_ExtPElS;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Extrema_ExtPElS;
		 Extrema_ExtPElS();

		/****** Extrema_ExtPElS::Extrema_ExtPElS ******/
		/****** md5 signature: 8b33a8cbd3616dbdf084aa771e5e0da9 ******/
		%feature("compactdefaultargs") Extrema_ExtPElS;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
S: gp_Cylinder
Tol: double

Return
-------
None

Description
-----------
It calculates all the distances between a point and a cylinder from gp. Tol is used to test if the point is on the axis.
") Extrema_ExtPElS;
		 Extrema_ExtPElS(const gp_Pnt & P, const gp_Cylinder & S, const double Tol);

		/****** Extrema_ExtPElS::Extrema_ExtPElS ******/
		/****** md5 signature: 47960ce6b79f84223a7ccf2fac8612cb ******/
		%feature("compactdefaultargs") Extrema_ExtPElS;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
S: gp_Pln
Tol: double

Return
-------
None

Description
-----------
It calculates all the distances between a point and a plane from gp. Tol is used to test if the point is on the plane.
") Extrema_ExtPElS;
		 Extrema_ExtPElS(const gp_Pnt & P, const gp_Pln & S, const double Tol);

		/****** Extrema_ExtPElS::Extrema_ExtPElS ******/
		/****** md5 signature: 037df7eaf13ab7998e6df887d322ee7e ******/
		%feature("compactdefaultargs") Extrema_ExtPElS;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
S: gp_Cone
Tol: double

Return
-------
None

Description
-----------
It calculates all the distances between a point and a cone from gp. Tol is used to test if the point is at the apex or on the axis.
") Extrema_ExtPElS;
		 Extrema_ExtPElS(const gp_Pnt & P, const gp_Cone & S, const double Tol);

		/****** Extrema_ExtPElS::Extrema_ExtPElS ******/
		/****** md5 signature: 6b9de1e9c32d61566c54d1ef9a6748ea ******/
		%feature("compactdefaultargs") Extrema_ExtPElS;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
S: gp_Torus
Tol: double

Return
-------
None

Description
-----------
It calculates all the distances between a point and a torus from gp. Tol is used to test if the point is on the axis.
") Extrema_ExtPElS;
		 Extrema_ExtPElS(const gp_Pnt & P, const gp_Torus & S, const double Tol);

		/****** Extrema_ExtPElS::Extrema_ExtPElS ******/
		/****** md5 signature: 0d9bb34d85dbd223a8da81cfbd16f939 ******/
		%feature("compactdefaultargs") Extrema_ExtPElS;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
S: gp_Sphere
Tol: double

Return
-------
None

Description
-----------
It calculates all the distances between a point and a sphere from gp. Tol is used to test if the point is at the center.
") Extrema_ExtPElS;
		 Extrema_ExtPElS(const gp_Pnt & P, const gp_Sphere & S, const double Tol);

		/****** Extrema_ExtPElS::IsDone ******/
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the distances are found.
") IsDone;
		bool IsDone();

		/****** Extrema_ExtPElS::NbExt ******/
		/****** md5 signature: a89b8075893780b59ee0d9f6ba576df8 ******/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of extremum distances.
") NbExt;
		int NbExt();

		/****** Extrema_ExtPElS::Perform ******/
		/****** md5 signature: d78466955fdc948676672f1d63e1926a ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
S: gp_Cylinder
Tol: double

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const gp_Pnt & P, const gp_Cylinder & S, const double Tol);

		/****** Extrema_ExtPElS::Perform ******/
		/****** md5 signature: d5ad9abd6a6e2b56427d320251f01327 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
S: gp_Pln
Tol: double

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const gp_Pnt & P, const gp_Pln & S, const double Tol);

		/****** Extrema_ExtPElS::Perform ******/
		/****** md5 signature: 7b4eeb8f9b06276a2fc5b8fc1275a405 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
S: gp_Cone
Tol: double

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const gp_Pnt & P, const gp_Cone & S, const double Tol);

		/****** Extrema_ExtPElS::Perform ******/
		/****** md5 signature: 738fbcc7a52df79bfeda266839fa0f91 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
S: gp_Torus
Tol: double

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const gp_Pnt & P, const gp_Torus & S, const double Tol);

		/****** Extrema_ExtPElS::Perform ******/
		/****** md5 signature: 468c0f4d078a8834b2ee794600184c44 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
S: gp_Sphere
Tol: double

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const gp_Pnt & P, const gp_Sphere & S, const double Tol);

		/****** Extrema_ExtPElS::Point ******/
		/****** md5 signature: f90c70e4810d2139f235cbb9454c37ac ******/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
Extrema_POnSurf

Description
-----------
Returns the point of the Nth resulting distance.
") Point;
		const Extrema_POnSurf & Point(const int N);

		/****** Extrema_ExtPElS::SquareDistance ******/
		/****** md5 signature: 45671dd8b89548cc9d5c988eae45f1a5 ******/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
double

Description
-----------
Returns the value of the Nth resulting square distance.
") SquareDistance;
		double SquareDistance(const int N);

};


%extend Extrema_ExtPElS {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class Extrema_ExtPExtS *
*************************/
class Extrema_ExtPExtS : public Standard_Transient {
	public:
		/****** Extrema_ExtPExtS::Extrema_ExtPExtS ******/
		/****** md5 signature: dcd91b6b512b4adb355634d4d1fcbd04 ******/
		%feature("compactdefaultargs") Extrema_ExtPExtS;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Extrema_ExtPExtS;
		 Extrema_ExtPExtS();

		/****** Extrema_ExtPExtS::Extrema_ExtPExtS ******/
		/****** md5 signature: 72726db263f38e9583cfccf539ce2d83 ******/
		%feature("compactdefaultargs") Extrema_ExtPExtS;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
S: GeomAdaptor_SurfaceOfLinearExtrusion
Umin: double
Usup: double
Vmin: double
Vsup: double
TolU: double
TolV: double

Return
-------
None

Description
-----------
It calculates all the distances between a point from gp and a Surface.
") Extrema_ExtPExtS;
		 Extrema_ExtPExtS(const gp_Pnt & P, const opencascade::handle<GeomAdaptor_SurfaceOfLinearExtrusion> & S, const double Umin, const double Usup, const double Vmin, const double Vsup, const double TolU, const double TolV);

		/****** Extrema_ExtPExtS::Extrema_ExtPExtS ******/
		/****** md5 signature: 00c58aee9db255758b71182853f34c61 ******/
		%feature("compactdefaultargs") Extrema_ExtPExtS;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
S: GeomAdaptor_SurfaceOfLinearExtrusion
TolU: double
TolV: double

Return
-------
None

Description
-----------
It calculates all the distances between a point from gp and a Surface.
") Extrema_ExtPExtS;
		 Extrema_ExtPExtS(const gp_Pnt & P, const opencascade::handle<GeomAdaptor_SurfaceOfLinearExtrusion> & S, const double TolU, const double TolV);

		/****** Extrema_ExtPExtS::Initialize ******/
		/****** md5 signature: d13003070c12d6e4288279f2e74f953d ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
S: GeomAdaptor_SurfaceOfLinearExtrusion
Uinf: double
Usup: double
Vinf: double
Vsup: double
TolU: double
TolV: double

Return
-------
None

Description
-----------
Initializes the fields of the algorithm.
") Initialize;
		void Initialize(const opencascade::handle<GeomAdaptor_SurfaceOfLinearExtrusion> & S, const double Uinf, const double Usup, const double Vinf, const double Vsup, const double TolU, const double TolV);

		/****** Extrema_ExtPExtS::IsDone ******/
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the distances are found.
") IsDone;
		bool IsDone();

		/****** Extrema_ExtPExtS::NbExt ******/
		/****** md5 signature: a89b8075893780b59ee0d9f6ba576df8 ******/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of extremum distances.
") NbExt;
		int NbExt();

		/****** Extrema_ExtPExtS::Perform ******/
		/****** md5 signature: 5f5e57fd55ba2b5f8e2b2be09861a3f9 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const gp_Pnt & P);

		/****** Extrema_ExtPExtS::Point ******/
		/****** md5 signature: f90c70e4810d2139f235cbb9454c37ac ******/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
Extrema_POnSurf

Description
-----------
Returns the point of the Nth resulting distance.
") Point;
		const Extrema_POnSurf & Point(const int N);

		/****** Extrema_ExtPExtS::SquareDistance ******/
		/****** md5 signature: 45671dd8b89548cc9d5c988eae45f1a5 ******/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
double

Description
-----------
Returns the value of the Nth resulting square distance.
") SquareDistance;
		double SquareDistance(const int N);

};


%make_alias(Extrema_ExtPExtS)

%extend Extrema_ExtPExtS {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class Extrema_ExtPRevS *
*************************/
class Extrema_ExtPRevS : public Standard_Transient {
	public:
		/****** Extrema_ExtPRevS::Extrema_ExtPRevS ******/
		/****** md5 signature: 679dbd4abfc01dec4eefe2229391cfbd ******/
		%feature("compactdefaultargs") Extrema_ExtPRevS;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Extrema_ExtPRevS;
		 Extrema_ExtPRevS();

		/****** Extrema_ExtPRevS::Extrema_ExtPRevS ******/
		/****** md5 signature: 51de5a254257450a30e8736006458a64 ******/
		%feature("compactdefaultargs") Extrema_ExtPRevS;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
S: GeomAdaptor_SurfaceOfRevolution
Umin: double
Usup: double
Vmin: double
Vsup: double
TolU: double
TolV: double

Return
-------
None

Description
-----------
It calculates all the distances between a point from gp and a SurfacePtr from Adaptor3d.
") Extrema_ExtPRevS;
		 Extrema_ExtPRevS(const gp_Pnt & P, const opencascade::handle<GeomAdaptor_SurfaceOfRevolution> & S, const double Umin, const double Usup, const double Vmin, const double Vsup, const double TolU, const double TolV);

		/****** Extrema_ExtPRevS::Extrema_ExtPRevS ******/
		/****** md5 signature: c0590e1e73e731e2336fda7b146d13cc ******/
		%feature("compactdefaultargs") Extrema_ExtPRevS;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
S: GeomAdaptor_SurfaceOfRevolution
TolU: double
TolV: double

Return
-------
None

Description
-----------
It calculates all the distances between a point from gp and a SurfacePtr from Adaptor3d.
") Extrema_ExtPRevS;
		 Extrema_ExtPRevS(const gp_Pnt & P, const opencascade::handle<GeomAdaptor_SurfaceOfRevolution> & S, const double TolU, const double TolV);

		/****** Extrema_ExtPRevS::Initialize ******/
		/****** md5 signature: c40ccaa344992e3bd9d9b2cead7ac4d9 ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
S: GeomAdaptor_SurfaceOfRevolution
Umin: double
Usup: double
Vmin: double
Vsup: double
TolU: double
TolV: double

Return
-------
None

Description
-----------
No available documentation.
") Initialize;
		void Initialize(const opencascade::handle<GeomAdaptor_SurfaceOfRevolution> & S, const double Umin, const double Usup, const double Vmin, const double Vsup, const double TolU, const double TolV);

		/****** Extrema_ExtPRevS::IsDone ******/
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the distances are found.
") IsDone;
		bool IsDone();

		/****** Extrema_ExtPRevS::NbExt ******/
		/****** md5 signature: a89b8075893780b59ee0d9f6ba576df8 ******/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of extremum distances.
") NbExt;
		int NbExt();

		/****** Extrema_ExtPRevS::Perform ******/
		/****** md5 signature: 5f5e57fd55ba2b5f8e2b2be09861a3f9 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const gp_Pnt & P);

		/****** Extrema_ExtPRevS::Point ******/
		/****** md5 signature: f90c70e4810d2139f235cbb9454c37ac ******/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
Extrema_POnSurf

Description
-----------
Returns the point of the Nth resulting distance.
") Point;
		const Extrema_POnSurf & Point(const int N);

		/****** Extrema_ExtPRevS::SquareDistance ******/
		/****** md5 signature: 45671dd8b89548cc9d5c988eae45f1a5 ******/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
double

Description
-----------
Returns the value of the Nth resulting square distance.
") SquareDistance;
		double SquareDistance(const int N);

};


%make_alias(Extrema_ExtPRevS)

%extend Extrema_ExtPRevS {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class Extrema_ExtPS *
**********************/
class Extrema_ExtPS {
	public:
		/****** Extrema_ExtPS::Extrema_ExtPS ******/
		/****** md5 signature: 793a5e92349ac079113a0a89d2169ffe ******/
		%feature("compactdefaultargs") Extrema_ExtPS;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Extrema_ExtPS;
		 Extrema_ExtPS();

		/****** Extrema_ExtPS::Extrema_ExtPS ******/
		/****** md5 signature: 39de2f2f1a19322f19c1e6e50b955835 ******/
		%feature("compactdefaultargs") Extrema_ExtPS;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
S: Adaptor3d_Surface
TolU: double
TolV: double
F: Extrema_ExtFlag (optional, default to Extrema_ExtFlag_MINMAX)
A: Extrema_ExtAlgo (optional, default to Extrema_ExtAlgo_Grad)

Return
-------
None

Description
-----------
It calculates all the distances. NbU and NbV are used to locate the close points to find the zeros. They must be great enough such that if there is N extrema, there will be N extrema between P and the grid. TolU et TolV are used to determine the conditions to stop the iterations; at the iteration number n: (Un - Un-1) < TolU and (Vn - Vn-1) < TolV .
") Extrema_ExtPS;
		 Extrema_ExtPS(const gp_Pnt & P, const Adaptor3d_Surface & S, const double TolU, const double TolV, const Extrema_ExtFlag F = Extrema_ExtFlag_MINMAX, const Extrema_ExtAlgo A = Extrema_ExtAlgo_Grad);

		/****** Extrema_ExtPS::Extrema_ExtPS ******/
		/****** md5 signature: 4864ea8fc72f7f76e4ff727bdfee2d74 ******/
		%feature("compactdefaultargs") Extrema_ExtPS;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
S: Adaptor3d_Surface
Uinf: double
Usup: double
Vinf: double
Vsup: double
TolU: double
TolV: double
F: Extrema_ExtFlag (optional, default to Extrema_ExtFlag_MINMAX)
A: Extrema_ExtAlgo (optional, default to Extrema_ExtAlgo_Grad)

Return
-------
None

Description
-----------
It calculates all the distances. NbU and NbV are used to locate the close points to find the zeros. They must be great enough such that if there is N extrema, there will be N extrema between P and the grid. TolU et TolV are used to determine the conditions to stop the iterations; at the iteration number n: (Un - Un-1) < TolU and (Vn - Vn-1) < TolV .
") Extrema_ExtPS;
		 Extrema_ExtPS(const gp_Pnt & P, const Adaptor3d_Surface & S, const double Uinf, const double Usup, const double Vinf, const double Vsup, const double TolU, const double TolV, const Extrema_ExtFlag F = Extrema_ExtFlag_MINMAX, const Extrema_ExtAlgo A = Extrema_ExtAlgo_Grad);

		/****** Extrema_ExtPS::Initialize ******/
		/****** md5 signature: e08f2cee10f3ac8457bfdf1243295f94 ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
S: Adaptor3d_Surface
Uinf: double
Usup: double
Vinf: double
Vsup: double
TolU: double
TolV: double

Return
-------
None

Description
-----------
Initializes the fields of the algorithm.
") Initialize;
		void Initialize(const Adaptor3d_Surface & S, const double Uinf, const double Usup, const double Vinf, const double Vsup, const double TolU, const double TolV);

		/****** Extrema_ExtPS::IsDone ******/
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the distances are found.
") IsDone;
		bool IsDone();

		/****** Extrema_ExtPS::NbExt ******/
		/****** md5 signature: a89b8075893780b59ee0d9f6ba576df8 ******/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of extremum distances.
") NbExt;
		int NbExt();

		/****** Extrema_ExtPS::Perform ******/
		/****** md5 signature: 5f5e57fd55ba2b5f8e2b2be09861a3f9 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt

Return
-------
None

Description
-----------
Computes the distances. An exception is raised if the fields have not been initialized.
") Perform;
		void Perform(const gp_Pnt & P);

		/****** Extrema_ExtPS::Point ******/
		/****** md5 signature: f90c70e4810d2139f235cbb9454c37ac ******/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
Extrema_POnSurf

Description
-----------
Returns the point of the Nth resulting distance.
") Point;
		const Extrema_POnSurf & Point(const int N);

		/****** Extrema_ExtPS::SetAlgo ******/
		/****** md5 signature: dcf7639630bf367993e8e7093ad161ed ******/
		%feature("compactdefaultargs") SetAlgo;
		%feature("autodoc", "
Parameters
----------
A: Extrema_ExtAlgo

Return
-------
None

Description
-----------
No available documentation.
") SetAlgo;
		void SetAlgo(const Extrema_ExtAlgo A);

		/****** Extrema_ExtPS::SetFlag ******/
		/****** md5 signature: d1a9d4d7a9231db47b60f98b2475fcf4 ******/
		%feature("compactdefaultargs") SetFlag;
		%feature("autodoc", "
Parameters
----------
F: Extrema_ExtFlag

Return
-------
None

Description
-----------
No available documentation.
") SetFlag;
		void SetFlag(const Extrema_ExtFlag F);

		/****** Extrema_ExtPS::SquareDistance ******/
		/****** md5 signature: 45671dd8b89548cc9d5c988eae45f1a5 ******/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
double

Description
-----------
Returns the value of the Nth resulting square distance.
") SquareDistance;
		double SquareDistance(const int N);

		/****** Extrema_ExtPS::TrimmedSquareDistances ******/
		/****** md5 signature: 268187269f339b3db1f9f8e93ea96020 ******/
		%feature("compactdefaultargs") TrimmedSquareDistances;
		%feature("autodoc", "
Parameters
----------
PUfVf: gp_Pnt
PUfVl: gp_Pnt
PUlVf: gp_Pnt
PUlVl: gp_Pnt

Return
-------
dUfVf: double
dUfVl: double
dUlVf: double
dUlVl: double

Description
-----------
if the surface is a trimmed surface, dUfVf is a square distance between <P> and the point of parameter FirstUParameter and FirstVParameter <PUfVf>. dUfVl is a square distance between <P> and the point of parameter FirstUParameter and LastVParameter <PUfVl>. dUlVf is a square distance between <P> and the point of parameter LastUParameter and FirstVParameter <PUlVf>. dUlVl is a square distance between <P> and the point of parameter LastUParameter and LastVParameter <PUlVl>.
") TrimmedSquareDistances;
		void TrimmedSquareDistances(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, gp_Pnt & PUfVf, gp_Pnt & PUfVl, gp_Pnt & PUlVf, gp_Pnt & PUlVl);

};


%extend Extrema_ExtPS {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class Extrema_ExtSS *
**********************/
class Extrema_ExtSS {
	public:
		/****** Extrema_ExtSS::Extrema_ExtSS ******/
		/****** md5 signature: d54c660a7f43125fd28ce5400500e34f ******/
		%feature("compactdefaultargs") Extrema_ExtSS;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Extrema_ExtSS;
		 Extrema_ExtSS();

		/****** Extrema_ExtSS::Extrema_ExtSS ******/
		/****** md5 signature: 7436da8b5057d9f38974456a8fe96604 ******/
		%feature("compactdefaultargs") Extrema_ExtSS;
		%feature("autodoc", "
Parameters
----------
S1: Adaptor3d_Surface
S2: Adaptor3d_Surface
TolS1: double
TolS2: double

Return
-------
None

Description
-----------
It calculates all the distances between S1 and S2.
") Extrema_ExtSS;
		 Extrema_ExtSS(const Adaptor3d_Surface & S1, const Adaptor3d_Surface & S2, const double TolS1, const double TolS2);

		/****** Extrema_ExtSS::Extrema_ExtSS ******/
		/****** md5 signature: 65b76dba87425096b415948ff546c189 ******/
		%feature("compactdefaultargs") Extrema_ExtSS;
		%feature("autodoc", "
Parameters
----------
S1: Adaptor3d_Surface
S2: Adaptor3d_Surface
Uinf1: double
Usup1: double
Vinf1: double
Vsup1: double
Uinf2: double
Usup2: double
Vinf2: double
Vsup2: double
TolS1: double
TolS2: double

Return
-------
None

Description
-----------
It calculates all the distances between S1 and S2.
") Extrema_ExtSS;
		 Extrema_ExtSS(const Adaptor3d_Surface & S1, const Adaptor3d_Surface & S2, const double Uinf1, const double Usup1, const double Vinf1, const double Vsup1, const double Uinf2, const double Usup2, const double Vinf2, const double Vsup2, const double TolS1, const double TolS2);

		/****** Extrema_ExtSS::Initialize ******/
		/****** md5 signature: 70807120736ba636e5900298c7ad0141 ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
S2: Adaptor3d_Surface
Uinf2: double
Usup2: double
Vinf2: double
Vsup2: double
TolS1: double

Return
-------
None

Description
-----------
Initializes the fields of the algorithm.
") Initialize;
		void Initialize(const Adaptor3d_Surface & S2, const double Uinf2, const double Usup2, const double Vinf2, const double Vsup2, const double TolS1);

		/****** Extrema_ExtSS::IsDone ******/
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the distances are found.
") IsDone;
		bool IsDone();

		/****** Extrema_ExtSS::IsParallel ******/
		/****** md5 signature: 25d4ac955341335e2fbcc4e3737ea518 ******/
		%feature("compactdefaultargs") IsParallel;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the surfaces are parallel.
") IsParallel;
		bool IsParallel();

		/****** Extrema_ExtSS::NbExt ******/
		/****** md5 signature: a89b8075893780b59ee0d9f6ba576df8 ******/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of extremum distances.
") NbExt;
		int NbExt();

		/****** Extrema_ExtSS::Perform ******/
		/****** md5 signature: f0fc2d8f5f2f72b4ff38069ae117c6b7 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
S1: Adaptor3d_Surface
Uinf1: double
Usup1: double
Vinf1: double
Vsup1: double
TolS1: double

Return
-------
None

Description
-----------
Computes the distances. An exception is raised if the fields have not been initialized.
") Perform;
		void Perform(const Adaptor3d_Surface & S1, const double Uinf1, const double Usup1, const double Vinf1, const double Vsup1, const double TolS1);

		/****** Extrema_ExtSS::Points ******/
		/****** md5 signature: 9262cd0fd0c25e9045f929bf930dd606 ******/
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "
Parameters
----------
N: int
P1: Extrema_POnSurf
P2: Extrema_POnSurf

Return
-------
None

Description
-----------
Returns the point of the Nth resulting distance.
") Points;
		void Points(const int N, Extrema_POnSurf & P1, Extrema_POnSurf & P2);

		/****** Extrema_ExtSS::SquareDistance ******/
		/****** md5 signature: 45671dd8b89548cc9d5c988eae45f1a5 ******/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
double

Description
-----------
Returns the value of the Nth resulting square distance.
") SquareDistance;
		double SquareDistance(const int N);

};


%extend Extrema_ExtSS {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class Extrema_FuncExtCS *
**************************/
class Extrema_FuncExtCS : public math_FunctionSetWithDerivatives {
	public:
		/****** Extrema_FuncExtCS::Extrema_FuncExtCS ******/
		/****** md5 signature: 6c23b588602334a4bc8250bca08449d6 ******/
		%feature("compactdefaultargs") Extrema_FuncExtCS;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Extrema_FuncExtCS;
		 Extrema_FuncExtCS();

		/****** Extrema_FuncExtCS::Extrema_FuncExtCS ******/
		/****** md5 signature: 946df633917621e0dc617833ec3d0066 ******/
		%feature("compactdefaultargs") Extrema_FuncExtCS;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve
S: Adaptor3d_Surface

Return
-------
None

Description
-----------
No available documentation.
") Extrema_FuncExtCS;
		 Extrema_FuncExtCS(const Adaptor3d_Curve & C, const Adaptor3d_Surface & S);

		/****** Extrema_FuncExtCS::Derivatives ******/
		/****** md5 signature: 2e85258267452dbe86e462db0a3a5832 ******/
		%feature("compactdefaultargs") Derivatives;
		%feature("autodoc", "
Parameters
----------
UV: math_Vector
DF: math_Matrix

Return
-------
bool

Description
-----------
Calculation of Fi'(U,V).
") Derivatives;
		bool Derivatives(const math_Vector & UV, math_Matrix & DF);

		/****** Extrema_FuncExtCS::GetStateNumber ******/
		/****** md5 signature: 476bd80c2b35cb038599a2aed9b23901 ******/
		%feature("compactdefaultargs") GetStateNumber;
		%feature("autodoc", "Return
-------
int

Description
-----------
Save the found extremum.
") GetStateNumber;
		int GetStateNumber();

		/****** Extrema_FuncExtCS::Initialize ******/
		/****** md5 signature: 2a333662de5748b61979b7e3164f3edb ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve
S: Adaptor3d_Surface

Return
-------
None

Description
-----------
sets the field mysurf of the function.
") Initialize;
		void Initialize(const Adaptor3d_Curve & C, const Adaptor3d_Surface & S);

		/****** Extrema_FuncExtCS::NbEquations ******/
		/****** md5 signature: d96db90f938251af5669711b5ae9a95b ******/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbEquations;
		int NbEquations();

		/****** Extrema_FuncExtCS::NbExt ******/
		/****** md5 signature: a89b8075893780b59ee0d9f6ba576df8 ******/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Return
-------
int

Description
-----------
Return the number of found extrema.
") NbExt;
		int NbExt();

		/****** Extrema_FuncExtCS::NbVariables ******/
		/****** md5 signature: ac9e90c594b52fb2529a5f6212b74800 ******/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbVariables;
		int NbVariables();

		/****** Extrema_FuncExtCS::PointOnCurve ******/
		/****** md5 signature: 369ffccbfa48b2ce26cd888f6dcbc746 ******/
		%feature("compactdefaultargs") PointOnCurve;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
Extrema_POnCurv

Description
-----------
Returns the Nth extremum on C.
") PointOnCurve;
		const Extrema_POnCurv & PointOnCurve(const int N);

		/****** Extrema_FuncExtCS::PointOnSurface ******/
		/****** md5 signature: 93d630f93efa87211a309b812e634d11 ******/
		%feature("compactdefaultargs") PointOnSurface;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
Extrema_POnSurf

Description
-----------
Return the Nth extremum on S.
") PointOnSurface;
		const Extrema_POnSurf & PointOnSurface(const int N);

		/****** Extrema_FuncExtCS::PointsOnCurve ******/
		/****** md5 signature: 6d2b7a55792d917a01eed7309e2845ea ******/
		%feature("compactdefaultargs") PointsOnCurve;
		%feature("autodoc", "Return
-------
NCollection_Sequence<Extrema_POnCurv>

Description
-----------
Change Sequence of PointOnCurv.
") PointsOnCurve;
		NCollection_Sequence<Extrema_POnCurv> & PointsOnCurve();

		/****** Extrema_FuncExtCS::PointsOnSurf ******/
		/****** md5 signature: 731da2aad90a662fb460aa51031f0e89 ******/
		%feature("compactdefaultargs") PointsOnSurf;
		%feature("autodoc", "Return
-------
NCollection_Sequence<Extrema_POnSurf>

Description
-----------
Change Sequence of PointOnSurf.
") PointsOnSurf;
		NCollection_Sequence<Extrema_POnSurf> & PointsOnSurf();

		/****** Extrema_FuncExtCS::SquareDistance ******/
		/****** md5 signature: 45671dd8b89548cc9d5c988eae45f1a5 ******/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
double

Description
-----------
Return the value of the Nth distance.
") SquareDistance;
		double SquareDistance(const int N);

		/****** Extrema_FuncExtCS::SquareDistances ******/
		/****** md5 signature: d1db598d8ee069246c782256e9baaf0b ******/
		%feature("compactdefaultargs") SquareDistances;
		%feature("autodoc", "Return
-------
TColStd_SequenceOfReal

Description
-----------
Change Sequence of SquareDistance.
") SquareDistances;
		TColStd_SequenceOfReal & SquareDistances();

		/****** Extrema_FuncExtCS::Value ******/
		/****** md5 signature: aae97e1be41ad26d9b2b682964a26bb0 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
UV: math_Vector
F: math_Vector

Return
-------
bool

Description
-----------
Calculation of Fi(U,V).
") Value;
		bool Value(const math_Vector & UV, math_Vector & F);

		/****** Extrema_FuncExtCS::Values ******/
		/****** md5 signature: 0b388c40c6a304edf8e5511360fe16c9 ******/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "
Parameters
----------
UV: math_Vector
F: math_Vector
DF: math_Matrix

Return
-------
bool

Description
-----------
Calculation of Fi(U,V) and Fi'(U,V).
") Values;
		bool Values(const math_Vector & UV, math_Vector & F, math_Matrix & DF);

};


%extend Extrema_FuncExtCS {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class Extrema_FuncExtSS *
**************************/
class Extrema_FuncExtSS : public math_FunctionSetWithDerivatives {
	public:
		/****** Extrema_FuncExtSS::Extrema_FuncExtSS ******/
		/****** md5 signature: b1c358bff58d260f7c43f0bf32dc9edb ******/
		%feature("compactdefaultargs") Extrema_FuncExtSS;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Extrema_FuncExtSS;
		 Extrema_FuncExtSS();

		/****** Extrema_FuncExtSS::Extrema_FuncExtSS ******/
		/****** md5 signature: 8395213c0a954425d4aa66501d53286b ******/
		%feature("compactdefaultargs") Extrema_FuncExtSS;
		%feature("autodoc", "
Parameters
----------
S1: Adaptor3d_Surface
S2: Adaptor3d_Surface

Return
-------
None

Description
-----------
No available documentation.
") Extrema_FuncExtSS;
		 Extrema_FuncExtSS(const Adaptor3d_Surface & S1, const Adaptor3d_Surface & S2);

		/****** Extrema_FuncExtSS::Derivatives ******/
		/****** md5 signature: 2e85258267452dbe86e462db0a3a5832 ******/
		%feature("compactdefaultargs") Derivatives;
		%feature("autodoc", "
Parameters
----------
UV: math_Vector
DF: math_Matrix

Return
-------
bool

Description
-----------
Calculate Fi'(U,V).
") Derivatives;
		bool Derivatives(const math_Vector & UV, math_Matrix & DF);

		/****** Extrema_FuncExtSS::GetStateNumber ******/
		/****** md5 signature: 476bd80c2b35cb038599a2aed9b23901 ******/
		%feature("compactdefaultargs") GetStateNumber;
		%feature("autodoc", "Return
-------
int

Description
-----------
Save the found extremum.
") GetStateNumber;
		int GetStateNumber();

		/****** Extrema_FuncExtSS::Initialize ******/
		/****** md5 signature: bbf2a645e1835e618089044c53c8e997 ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
S1: Adaptor3d_Surface
S2: Adaptor3d_Surface

Return
-------
None

Description
-----------
sets the field mysurf of the function.
") Initialize;
		void Initialize(const Adaptor3d_Surface & S1, const Adaptor3d_Surface & S2);

		/****** Extrema_FuncExtSS::NbEquations ******/
		/****** md5 signature: d96db90f938251af5669711b5ae9a95b ******/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbEquations;
		int NbEquations();

		/****** Extrema_FuncExtSS::NbExt ******/
		/****** md5 signature: a89b8075893780b59ee0d9f6ba576df8 ******/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Return
-------
int

Description
-----------
Return the number of found extrema.
") NbExt;
		int NbExt();

		/****** Extrema_FuncExtSS::NbVariables ******/
		/****** md5 signature: ac9e90c594b52fb2529a5f6212b74800 ******/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbVariables;
		int NbVariables();

		/****** Extrema_FuncExtSS::PointOnS1 ******/
		/****** md5 signature: e15f4e253a9976810994c9aced22480d ******/
		%feature("compactdefaultargs") PointOnS1;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
Extrema_POnSurf

Description
-----------
Return the Nth extremum on S1.
") PointOnS1;
		const Extrema_POnSurf & PointOnS1(const int N);

		/****** Extrema_FuncExtSS::PointOnS2 ******/
		/****** md5 signature: ecac6963ff2ed6aa5a624f032a59f066 ******/
		%feature("compactdefaultargs") PointOnS2;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
Extrema_POnSurf

Description
-----------
Renvoie le Nieme extremum sur S2.
") PointOnS2;
		const Extrema_POnSurf & PointOnS2(const int N);

		/****** Extrema_FuncExtSS::SquareDistance ******/
		/****** md5 signature: 45671dd8b89548cc9d5c988eae45f1a5 ******/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
double

Description
-----------
Return the value of the Nth distance.
") SquareDistance;
		double SquareDistance(const int N);

		/****** Extrema_FuncExtSS::Value ******/
		/****** md5 signature: aae97e1be41ad26d9b2b682964a26bb0 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
UV: math_Vector
F: math_Vector

Return
-------
bool

Description
-----------
Calculate Fi(U,V).
") Value;
		bool Value(const math_Vector & UV, math_Vector & F);

		/****** Extrema_FuncExtSS::Values ******/
		/****** md5 signature: 0b388c40c6a304edf8e5511360fe16c9 ******/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "
Parameters
----------
UV: math_Vector
F: math_Vector
DF: math_Matrix

Return
-------
bool

Description
-----------
Calculate Fi(U,V) and Fi'(U,V).
") Values;
		bool Values(const math_Vector & UV, math_Vector & F, math_Matrix & DF);

};


%extend Extrema_FuncExtSS {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class Extrema_FuncPSDist *
***************************/
class Extrema_FuncPSDist : public math_MultipleVarFunctionWithGradient {
	public:
		/****** Extrema_FuncPSDist::Extrema_FuncPSDist ******/
		/****** md5 signature: d4bd3e85716206a906af143288563b41 ******/
		%feature("compactdefaultargs") Extrema_FuncPSDist;
		%feature("autodoc", "
Parameters
----------
theS: Adaptor3d_Surface
theP: gp_Pnt

Return
-------
None

Description
-----------
Constructor.
") Extrema_FuncPSDist;
		 Extrema_FuncPSDist(const Adaptor3d_Surface & theS, const gp_Pnt & theP);

		/****** Extrema_FuncPSDist::NbVariables ******/
		/****** md5 signature: ac9e90c594b52fb2529a5f6212b74800 ******/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Return
-------
int

Description
-----------
Number of variables.
") NbVariables;
		int NbVariables();

		/****** Extrema_FuncPSDist::Value ******/
		/****** md5 signature: 8471cfc7cef312ad7d98cf2875f96773 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
X: math_VectorBase<double >

Return
-------
F: double

Description
-----------
Value.
") Value;
		bool Value(math_VectorBase<double > X, Standard_Real &OutValue);

};


%extend Extrema_FuncPSDist {
	%pythoncode {
	__repr__ = _dumps_object

	@methodnotwrapped
	def Gradient(self):
		pass

	@methodnotwrapped
	def Values(self):
		pass
	}
};

/***************************
* class Extrema_FuncPSNorm *
***************************/
class Extrema_FuncPSNorm : public math_FunctionSetWithDerivatives {
	public:
		/****** Extrema_FuncPSNorm::Extrema_FuncPSNorm ******/
		/****** md5 signature: f61a68020ce6f14065b62d66676226a0 ******/
		%feature("compactdefaultargs") Extrema_FuncPSNorm;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Extrema_FuncPSNorm;
		 Extrema_FuncPSNorm();

		/****** Extrema_FuncPSNorm::Extrema_FuncPSNorm ******/
		/****** md5 signature: fba66cad2011c86f68853470e71f3a4a ******/
		%feature("compactdefaultargs") Extrema_FuncPSNorm;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
S: Adaptor3d_Surface

Return
-------
None

Description
-----------
No available documentation.
") Extrema_FuncPSNorm;
		 Extrema_FuncPSNorm(const gp_Pnt & P, const Adaptor3d_Surface & S);

		/****** Extrema_FuncPSNorm::Derivatives ******/
		/****** md5 signature: 2e85258267452dbe86e462db0a3a5832 ******/
		%feature("compactdefaultargs") Derivatives;
		%feature("autodoc", "
Parameters
----------
UV: math_Vector
DF: math_Matrix

Return
-------
bool

Description
-----------
Calculate Fi'(U,V).
") Derivatives;
		bool Derivatives(const math_Vector & UV, math_Matrix & DF);

		/****** Extrema_FuncPSNorm::GetStateNumber ******/
		/****** md5 signature: 476bd80c2b35cb038599a2aed9b23901 ******/
		%feature("compactdefaultargs") GetStateNumber;
		%feature("autodoc", "Return
-------
int

Description
-----------
Save the found extremum.
") GetStateNumber;
		int GetStateNumber();

		/****** Extrema_FuncPSNorm::Initialize ******/
		/****** md5 signature: 17b5f42375df076d09bf3e8b29e98099 ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
S: Adaptor3d_Surface

Return
-------
None

Description
-----------
sets the field mysurf of the function.
") Initialize;
		void Initialize(const Adaptor3d_Surface & S);

		/****** Extrema_FuncPSNorm::NbEquations ******/
		/****** md5 signature: d96db90f938251af5669711b5ae9a95b ******/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbEquations;
		int NbEquations();

		/****** Extrema_FuncPSNorm::NbExt ******/
		/****** md5 signature: a89b8075893780b59ee0d9f6ba576df8 ******/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Return
-------
int

Description
-----------
Return the number of found extrema.
") NbExt;
		int NbExt();

		/****** Extrema_FuncPSNorm::NbVariables ******/
		/****** md5 signature: ac9e90c594b52fb2529a5f6212b74800 ******/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbVariables;
		int NbVariables();

		/****** Extrema_FuncPSNorm::Point ******/
		/****** md5 signature: f90c70e4810d2139f235cbb9454c37ac ******/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
Extrema_POnSurf

Description
-----------
Returns the Nth extremum.
") Point;
		const Extrema_POnSurf & Point(const int N);

		/****** Extrema_FuncPSNorm::SetPoint ******/
		/****** md5 signature: ad83fe26e12bb630222b6d2773210931 ******/
		%feature("compactdefaultargs") SetPoint;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt

Return
-------
None

Description
-----------
sets the field mysurf of the function.
") SetPoint;
		void SetPoint(const gp_Pnt & P);

		/****** Extrema_FuncPSNorm::SquareDistance ******/
		/****** md5 signature: 45671dd8b89548cc9d5c988eae45f1a5 ******/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
double

Description
-----------
Return the value of the Nth distance.
") SquareDistance;
		double SquareDistance(const int N);

		/****** Extrema_FuncPSNorm::Value ******/
		/****** md5 signature: aae97e1be41ad26d9b2b682964a26bb0 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
UV: math_Vector
F: math_Vector

Return
-------
bool

Description
-----------
Calculate Fi(U,V).
") Value;
		bool Value(const math_Vector & UV, math_Vector & F);

		/****** Extrema_FuncPSNorm::Values ******/
		/****** md5 signature: 0b388c40c6a304edf8e5511360fe16c9 ******/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "
Parameters
----------
UV: math_Vector
F: math_Vector
DF: math_Matrix

Return
-------
bool

Description
-----------
Calculate Fi(U,V) and Fi'(U,V).
") Values;
		bool Values(const math_Vector & UV, math_Vector & F, math_Matrix & DF);

};


%extend Extrema_FuncPSNorm {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class Extrema_GCurveLocator *
******************************/
/***************************
* class Extrema_GFuncExtCC *
***************************/
/***************************
* class Extrema_GFuncExtPC *
***************************/
/************************
* class Extrema_GGExtPC *
************************/
/**************************
* class Extrema_GGenExtCC *
**************************/
/******************************************
* class Extrema_GGenExtCC_PointsInspector *
******************************************/
class Extrema_GGenExtCC_PointsInspector {
	public:
typedef gp_XY Point;
typedef gp_XY Target;
		/****** Extrema_GGenExtCC_PointsInspector::Extrema_GGenExtCC_PointsInspector ******/
		/****** md5 signature: 6158e7dd441b824332334934bc22303e ******/
		%feature("compactdefaultargs") Extrema_GGenExtCC_PointsInspector;
		%feature("autodoc", "
Parameters
----------
theTol: double

Return
-------
None

Description
-----------
No available documentation.
") Extrema_GGenExtCC_PointsInspector;
		 Extrema_GGenExtCC_PointsInspector(const double theTol);

		/****** Extrema_GGenExtCC_PointsInspector::ClearFind ******/
		/****** md5 signature: d3233e926bfa5f572fc774e5ca32a916 ******/
		%feature("compactdefaultargs") ClearFind;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") ClearFind;
		void ClearFind();

		/****** Extrema_GGenExtCC_PointsInspector::Coord ******/
		/****** md5 signature: 5eba5f8729bea7ab978c1279517b0fd3 ******/
		%feature("compactdefaultargs") Coord;
		%feature("autodoc", "
Parameters
----------
i: int
thePnt: Point

Return
-------
double

Description
-----------
No available documentation.
") Coord;
		static double Coord(int i, const Point & thePnt);

		/****** Extrema_GGenExtCC_PointsInspector::Inspect ******/
		/****** md5 signature: 074584af19a0dea3e02f68b2ceeea349 ******/
		%feature("compactdefaultargs") Inspect;
		%feature("autodoc", "
Parameters
----------
theObject: Target

Return
-------
NCollection_CellFilter_Action

Description
-----------
No available documentation.
") Inspect;
		NCollection_CellFilter_Action Inspect(const Target & theObject);

		/****** Extrema_GGenExtCC_PointsInspector::SetCurrent ******/
		/****** md5 signature: 6407d5e869d5cf5fdebbc67e7aac392f ******/
		%feature("compactdefaultargs") SetCurrent;
		%feature("autodoc", "
Parameters
----------
theCurPnt: gp_XY

Return
-------
None

Description
-----------
No available documentation.
") SetCurrent;
		void SetCurrent(const gp_XY & theCurPnt);

		/****** Extrema_GGenExtCC_PointsInspector::Shift ******/
		/****** md5 signature: a5c275ed1417a8e4b122622e7231a266 ******/
		%feature("compactdefaultargs") Shift;
		%feature("autodoc", "
Parameters
----------
thePnt: Point
theTol: double

Return
-------
Point

Description
-----------
No available documentation.
") Shift;
		static Point Shift(const Point & thePnt, double theTol);

		/****** Extrema_GGenExtCC_PointsInspector::isFind ******/
		/****** md5 signature: 91b3274458c5b8dec5a89dd2e915b128 ******/
		%feature("compactdefaultargs") isFind;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") isFind;
		bool isFind();

};


%extend Extrema_GGenExtCC_PointsInspector {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class Extrema_GGenExtPC *
**************************/
/*****************************
* class Extrema_GLocateExtPC *
*****************************/
/*************************
* class Extrema_GenExtCS *
*************************/
class Extrema_GenExtCS {
	public:
		/****** Extrema_GenExtCS::Extrema_GenExtCS ******/
		/****** md5 signature: f167ca7a9c7e606895908255498d3a2f ******/
		%feature("compactdefaultargs") Extrema_GenExtCS;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") Extrema_GenExtCS;
		 Extrema_GenExtCS();

		/****** Extrema_GenExtCS::Extrema_GenExtCS ******/
		/****** md5 signature: c7a7b9444843a102ee97b9b7eea755ac ******/
		%feature("compactdefaultargs") Extrema_GenExtCS;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve
S: Adaptor3d_Surface
NbT: int
NbU: int
NbV: int
Tol1: double
Tol2: double

Return
-------
None

Description
-----------
It calculates all the distances. The function F(u,v)=distance(S1(u1,v1),S2(u2,v2)) has an extremum when gradient(F)=0. The algorithm searches all the zeros inside the definition ranges of the surfaces. NbU and NbV are used to locate the close points on the surface and NbT on the curve to find the zeros.
") Extrema_GenExtCS;
		 Extrema_GenExtCS(const Adaptor3d_Curve & C, const Adaptor3d_Surface & S, const int NbT, const int NbU, const int NbV, const double Tol1, const double Tol2);

		/****** Extrema_GenExtCS::Extrema_GenExtCS ******/
		/****** md5 signature: 5c4cca2b684b97923e8e1538b65b61cf ******/
		%feature("compactdefaultargs") Extrema_GenExtCS;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve
S: Adaptor3d_Surface
NbT: int
NbU: int
NbV: int
tmin: double
tsup: double
Umin: double
Usup: double
Vmin: double
Vsup: double
Tol1: double
Tol2: double

Return
-------
None

Description
-----------
It calculates all the distances. The function F(u,v)=distance(P,S(u,v)) has an extremum when gradient(F)=0. The algorithm searches all the zeros inside the definition ranges of the surface. NbT,NbU and NbV are used to locate the close points to find the zeros.
") Extrema_GenExtCS;
		 Extrema_GenExtCS(const Adaptor3d_Curve & C, const Adaptor3d_Surface & S, const int NbT, const int NbU, const int NbV, const double tmin, const double tsup, const double Umin, const double Usup, const double Vmin, const double Vsup, const double Tol1, const double Tol2);

		/****** Extrema_GenExtCS::Initialize ******/
		/****** md5 signature: 4a17ba49ccef8a78e0bc047f2de17401 ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
S: Adaptor3d_Surface
NbU: int
NbV: int
Tol2: double

Return
-------
None

Description
-----------
No available documentation.
") Initialize;
		void Initialize(const Adaptor3d_Surface & S, const int NbU, const int NbV, const double Tol2);

		/****** Extrema_GenExtCS::Initialize ******/
		/****** md5 signature: 3c08a5d52bfc124663fc9c7d224103d1 ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
S: Adaptor3d_Surface
NbU: int
NbV: int
Umin: double
Usup: double
Vmin: double
Vsup: double
Tol2: double

Return
-------
None

Description
-----------
No available documentation.
") Initialize;
		void Initialize(const Adaptor3d_Surface & S, const int NbU, const int NbV, const double Umin, const double Usup, const double Vmin, const double Vsup, const double Tol2);

		/****** Extrema_GenExtCS::IsDone ******/
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the distances are found.
") IsDone;
		bool IsDone();

		/****** Extrema_GenExtCS::NbExt ******/
		/****** md5 signature: a89b8075893780b59ee0d9f6ba576df8 ******/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of extremum distances.
") NbExt;
		int NbExt();

		/****** Extrema_GenExtCS::Perform ******/
		/****** md5 signature: 71e9af28a1f8cc08ba9bae56621160d5 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve
NbT: int
Tol1: double

Return
-------
None

Description
-----------
the algorithm is done with S An exception is raised if the fields have not been initialized.
") Perform;
		void Perform(const Adaptor3d_Curve & C, const int NbT, const double Tol1);

		/****** Extrema_GenExtCS::Perform ******/
		/****** md5 signature: e8d28526cb22e4dbf53ed16b58f5b67b ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve
NbT: int
tmin: double
tsup: double
Tol1: double

Return
-------
None

Description
-----------
the algorithm is done with C An exception is raised if the fields have not been initialized.
") Perform;
		void Perform(const Adaptor3d_Curve & C, const int NbT, const double tmin, const double tsup, const double Tol1);

		/****** Extrema_GenExtCS::PointOnCurve ******/
		/****** md5 signature: 369ffccbfa48b2ce26cd888f6dcbc746 ******/
		%feature("compactdefaultargs") PointOnCurve;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
Extrema_POnCurv

Description
-----------
Returns the point of the Nth resulting distance.
") PointOnCurve;
		const Extrema_POnCurv & PointOnCurve(const int N);

		/****** Extrema_GenExtCS::PointOnSurface ******/
		/****** md5 signature: 93d630f93efa87211a309b812e634d11 ******/
		%feature("compactdefaultargs") PointOnSurface;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
Extrema_POnSurf

Description
-----------
Returns the point of the Nth resulting distance.
") PointOnSurface;
		const Extrema_POnSurf & PointOnSurface(const int N);

		/****** Extrema_GenExtCS::SquareDistance ******/
		/****** md5 signature: 45671dd8b89548cc9d5c988eae45f1a5 ******/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
double

Description
-----------
Returns the value of the Nth resulting square distance.
") SquareDistance;
		double SquareDistance(const int N);

};


%extend Extrema_GenExtCS {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class Extrema_GenExtPS *
*************************/
class Extrema_GenExtPS {
	public:
		/****** Extrema_GenExtPS::Extrema_GenExtPS ******/
		/****** md5 signature: a5064b4d9e02a8b5f95bf2e555839ea7 ******/
		%feature("compactdefaultargs") Extrema_GenExtPS;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") Extrema_GenExtPS;
		 Extrema_GenExtPS();

		/****** Extrema_GenExtPS::Extrema_GenExtPS ******/
		/****** md5 signature: 00202973acde387ec92d223ffb45e0cd ******/
		%feature("compactdefaultargs") Extrema_GenExtPS;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
S: Adaptor3d_Surface
NbU: int
NbV: int
TolU: double
TolV: double
F: Extrema_ExtFlag (optional, default to Extrema_ExtFlag_MINMAX)
A: Extrema_ExtAlgo (optional, default to Extrema_ExtAlgo_Grad)

Return
-------
None

Description
-----------
It calculates all the distances. The function F(u,v)=distance(P,S(u,v)) has an extremum when gradient(F)=0. The algorithm searches all the zeros inside the definition ranges of the surface. NbU and NbV are used to locate the close points to find the zeros. They must be great enough such that if there is N extrema, there will be N extrema between P and the grid. TolU et TolV are used to determine the conditions to stop the iterations; at the iteration number n: (Un - Un-1) < TolU and (Vn - Vn-1) < TolV .
") Extrema_GenExtPS;
		 Extrema_GenExtPS(const gp_Pnt & P, const Adaptor3d_Surface & S, const int NbU, const int NbV, const double TolU, const double TolV, const Extrema_ExtFlag F = Extrema_ExtFlag_MINMAX, const Extrema_ExtAlgo A = Extrema_ExtAlgo_Grad);

		/****** Extrema_GenExtPS::Extrema_GenExtPS ******/
		/****** md5 signature: 1a918760ede68229b253610c98cdf743 ******/
		%feature("compactdefaultargs") Extrema_GenExtPS;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
S: Adaptor3d_Surface
NbU: int
NbV: int
Umin: double
Usup: double
Vmin: double
Vsup: double
TolU: double
TolV: double
F: Extrema_ExtFlag (optional, default to Extrema_ExtFlag_MINMAX)
A: Extrema_ExtAlgo (optional, default to Extrema_ExtAlgo_Grad)

Return
-------
None

Description
-----------
It calculates all the distances. The function F(u,v)=distance(P,S(u,v)) has an extremum when gradient(F)=0. The algorithm searches all the zeros inside the definition ranges of the surface. NbU and NbV are used to locate the close points to find the zeros. They must be great enough such that if there is N extrema, there will be N extrema between P and the grid. TolU et TolV are used to determine the conditions to stop the iterations; at the iteration number n: (Un - Un-1) < TolU and (Vn - Vn-1) < TolV .
") Extrema_GenExtPS;
		 Extrema_GenExtPS(const gp_Pnt & P, const Adaptor3d_Surface & S, const int NbU, const int NbV, const double Umin, const double Usup, const double Vmin, const double Vsup, const double TolU, const double TolV, const Extrema_ExtFlag F = Extrema_ExtFlag_MINMAX, const Extrema_ExtAlgo A = Extrema_ExtAlgo_Grad);

		/****** Extrema_GenExtPS::Initialize ******/
		/****** md5 signature: e9211eb50022dd5fa409cf949a5755fc ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
S: Adaptor3d_Surface
NbU: int
NbV: int
TolU: double
TolV: double

Return
-------
None

Description
-----------
No available documentation.
") Initialize;
		void Initialize(const Adaptor3d_Surface & S, const int NbU, const int NbV, const double TolU, const double TolV);

		/****** Extrema_GenExtPS::Initialize ******/
		/****** md5 signature: 5e189790f589a6318930e11d94b71ea7 ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
S: Adaptor3d_Surface
NbU: int
NbV: int
Umin: double
Usup: double
Vmin: double
Vsup: double
TolU: double
TolV: double

Return
-------
None

Description
-----------
No available documentation.
") Initialize;
		void Initialize(const Adaptor3d_Surface & S, const int NbU, const int NbV, const double Umin, const double Usup, const double Vmin, const double Vsup, const double TolU, const double TolV);

		/****** Extrema_GenExtPS::IsDone ******/
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the distances are found.
") IsDone;
		bool IsDone();

		/****** Extrema_GenExtPS::NbExt ******/
		/****** md5 signature: a89b8075893780b59ee0d9f6ba576df8 ******/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of extremum distances.
") NbExt;
		int NbExt();

		/****** Extrema_GenExtPS::Perform ******/
		/****** md5 signature: 5f5e57fd55ba2b5f8e2b2be09861a3f9 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt

Return
-------
None

Description
-----------
the algorithm is done with the point P. An exception is raised if the fields have not been initialized.
") Perform;
		void Perform(const gp_Pnt & P);

		/****** Extrema_GenExtPS::Point ******/
		/****** md5 signature: f90c70e4810d2139f235cbb9454c37ac ******/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
Extrema_POnSurf

Description
-----------
Returns the point of the Nth resulting distance.
") Point;
		const Extrema_POnSurf & Point(const int N);

		/****** Extrema_GenExtPS::SetAlgo ******/
		/****** md5 signature: dcf7639630bf367993e8e7093ad161ed ******/
		%feature("compactdefaultargs") SetAlgo;
		%feature("autodoc", "
Parameters
----------
A: Extrema_ExtAlgo

Return
-------
None

Description
-----------
No available documentation.
") SetAlgo;
		void SetAlgo(const Extrema_ExtAlgo A);

		/****** Extrema_GenExtPS::SetFlag ******/
		/****** md5 signature: d1a9d4d7a9231db47b60f98b2475fcf4 ******/
		%feature("compactdefaultargs") SetFlag;
		%feature("autodoc", "
Parameters
----------
F: Extrema_ExtFlag

Return
-------
None

Description
-----------
No available documentation.
") SetFlag;
		void SetFlag(const Extrema_ExtFlag F);

		/****** Extrema_GenExtPS::SquareDistance ******/
		/****** md5 signature: 45671dd8b89548cc9d5c988eae45f1a5 ******/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
double

Description
-----------
Returns the value of the Nth resulting square distance.
") SquareDistance;
		double SquareDistance(const int N);

};


%extend Extrema_GenExtPS {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class Extrema_GenExtSS *
*************************/
class Extrema_GenExtSS {
	public:
		/****** Extrema_GenExtSS::Extrema_GenExtSS ******/
		/****** md5 signature: bdbaa032cdecd5329d7e7eff59343f37 ******/
		%feature("compactdefaultargs") Extrema_GenExtSS;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") Extrema_GenExtSS;
		 Extrema_GenExtSS();

		/****** Extrema_GenExtSS::Extrema_GenExtSS ******/
		/****** md5 signature: 0526805ad3b734946386115b40d8beab ******/
		%feature("compactdefaultargs") Extrema_GenExtSS;
		%feature("autodoc", "
Parameters
----------
S1: Adaptor3d_Surface
S2: Adaptor3d_Surface
NbU: int
NbV: int
Tol1: double
Tol2: double

Return
-------
None

Description
-----------
It calculates all the distances. The function F(u,v)=distance(S1(u1,v1),S2(u2,v2)) has an extremum when gradient(F)=0. The algorithm searches all the zeros inside the definition ranges of the surfaces. NbU and NbV are used to locate the close points to find the zeros.
") Extrema_GenExtSS;
		 Extrema_GenExtSS(const Adaptor3d_Surface & S1, const Adaptor3d_Surface & S2, const int NbU, const int NbV, const double Tol1, const double Tol2);

		/****** Extrema_GenExtSS::Extrema_GenExtSS ******/
		/****** md5 signature: bb0da0223da3eb0a98263f97bee346e3 ******/
		%feature("compactdefaultargs") Extrema_GenExtSS;
		%feature("autodoc", "
Parameters
----------
S1: Adaptor3d_Surface
S2: Adaptor3d_Surface
NbU: int
NbV: int
U1min: double
U1sup: double
V1min: double
V1sup: double
U2min: double
U2sup: double
V2min: double
V2sup: double
Tol1: double
Tol2: double

Return
-------
None

Description
-----------
It calculates all the distances. The function F(u,v)=distance(P,S(u,v)) has an extremum when gradient(F)=0. The algorithm searches all the zeros inside the definition ranges of the surface. NbU and NbV are used to locate the close points to find the zeros.
") Extrema_GenExtSS;
		 Extrema_GenExtSS(const Adaptor3d_Surface & S1, const Adaptor3d_Surface & S2, const int NbU, const int NbV, const double U1min, const double U1sup, const double V1min, const double V1sup, const double U2min, const double U2sup, const double V2min, const double V2sup, const double Tol1, const double Tol2);

		/****** Extrema_GenExtSS::Initialize ******/
		/****** md5 signature: 907a53c96380f79aa3c79e44091886b5 ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
S2: Adaptor3d_Surface
NbU: int
NbV: int
Tol2: double

Return
-------
None

Description
-----------
No available documentation.
") Initialize;
		void Initialize(const Adaptor3d_Surface & S2, const int NbU, const int NbV, const double Tol2);

		/****** Extrema_GenExtSS::Initialize ******/
		/****** md5 signature: 0b76a78780e4a1175182a366f397fbaa ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
S2: Adaptor3d_Surface
NbU: int
NbV: int
U2min: double
U2sup: double
V2min: double
V2sup: double
Tol2: double

Return
-------
None

Description
-----------
No available documentation.
") Initialize;
		void Initialize(const Adaptor3d_Surface & S2, const int NbU, const int NbV, const double U2min, const double U2sup, const double V2min, const double V2sup, const double Tol2);

		/****** Extrema_GenExtSS::IsDone ******/
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the distances are found.
") IsDone;
		bool IsDone();

		/****** Extrema_GenExtSS::NbExt ******/
		/****** md5 signature: a89b8075893780b59ee0d9f6ba576df8 ******/
		%feature("compactdefaultargs") NbExt;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of extremum distances.
") NbExt;
		int NbExt();

		/****** Extrema_GenExtSS::Perform ******/
		/****** md5 signature: 9d961afeb49eaeba74986475de44b261 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
S1: Adaptor3d_Surface
Tol1: double

Return
-------
None

Description
-----------
the algorithm is done with S1 An exception is raised if the fields have not been initialized.
") Perform;
		void Perform(const Adaptor3d_Surface & S1, const double Tol1);

		/****** Extrema_GenExtSS::Perform ******/
		/****** md5 signature: 582e4c998a0d2b4f722bcb27a2db14ff ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
S1: Adaptor3d_Surface
U1min: double
U1sup: double
V1min: double
V1sup: double
Tol1: double

Return
-------
None

Description
-----------
the algorithm is done withS1 An exception is raised if the fields have not been initialized.
") Perform;
		void Perform(const Adaptor3d_Surface & S1, const double U1min, const double U1sup, const double V1min, const double V1sup, const double Tol1);

		/****** Extrema_GenExtSS::PointOnS1 ******/
		/****** md5 signature: e15f4e253a9976810994c9aced22480d ******/
		%feature("compactdefaultargs") PointOnS1;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
Extrema_POnSurf

Description
-----------
Returns the point of the Nth resulting distance.
") PointOnS1;
		const Extrema_POnSurf & PointOnS1(const int N);

		/****** Extrema_GenExtSS::PointOnS2 ******/
		/****** md5 signature: ecac6963ff2ed6aa5a624f032a59f066 ******/
		%feature("compactdefaultargs") PointOnS2;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
Extrema_POnSurf

Description
-----------
Returns the point of the Nth resulting distance.
") PointOnS2;
		const Extrema_POnSurf & PointOnS2(const int N);

		/****** Extrema_GenExtSS::SquareDistance ******/
		/****** md5 signature: 45671dd8b89548cc9d5c988eae45f1a5 ******/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
double

Description
-----------
Returns the value of the Nth resulting square distance.
") SquareDistance;
		double SquareDistance(const int N);

};


%extend Extrema_GenExtSS {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class Extrema_GenLocateExtCC *
*******************************/
/*******************************
* class Extrema_GenLocateExtCS *
*******************************/
class Extrema_GenLocateExtCS {
	public:
		/****** Extrema_GenLocateExtCS::Extrema_GenLocateExtCS ******/
		/****** md5 signature: f03a3323d64c5ae914d60d9d786ba827 ******/
		%feature("compactdefaultargs") Extrema_GenLocateExtCS;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Extrema_GenLocateExtCS;
		 Extrema_GenLocateExtCS();

		/****** Extrema_GenLocateExtCS::Extrema_GenLocateExtCS ******/
		/****** md5 signature: 35b967e50825dbd54140da3e435ee3b1 ******/
		%feature("compactdefaultargs") Extrema_GenLocateExtCS;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve
S: Adaptor3d_Surface
T: double
U: double
V: double
Tol1: double
Tol2: double

Return
-------
None

Description
-----------
Calculates the distance with two close points. The close points are defined by the parameter values T for C and (U,V) for S. The function F(t,u,v)=distance(C(t),S(u,v)) has an extremun when gradient(F)=0. The algorithm searches a zero near the close points.
") Extrema_GenLocateExtCS;
		 Extrema_GenLocateExtCS(const Adaptor3d_Curve & C, const Adaptor3d_Surface & S, const double T, const double U, const double V, const double Tol1, const double Tol2);

		/****** Extrema_GenLocateExtCS::IsDone ******/
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the distance is found.
") IsDone;
		bool IsDone();

		/****** Extrema_GenLocateExtCS::Perform ******/
		/****** md5 signature: c4c060f7d49ff2185598af47df4fadd4 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve
S: Adaptor3d_Surface
T: double
U: double
V: double
Tol1: double
Tol2: double

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const Adaptor3d_Curve & C, const Adaptor3d_Surface & S, const double T, const double U, const double V, const double Tol1, const double Tol2);

		/****** Extrema_GenLocateExtCS::PointOnCurve ******/
		/****** md5 signature: 12e75a03d4a94b00a001654daac03f2b ******/
		%feature("compactdefaultargs") PointOnCurve;
		%feature("autodoc", "Return
-------
Extrema_POnCurv

Description
-----------
Returns the point of the extremum distance on C.
") PointOnCurve;
		const Extrema_POnCurv & PointOnCurve();

		/****** Extrema_GenLocateExtCS::PointOnSurface ******/
		/****** md5 signature: 93e63de442d026d56322abfcd73004ce ******/
		%feature("compactdefaultargs") PointOnSurface;
		%feature("autodoc", "Return
-------
Extrema_POnSurf

Description
-----------
Returns the point of the extremum distance on S.
") PointOnSurface;
		const Extrema_POnSurf & PointOnSurface();

		/****** Extrema_GenLocateExtCS::SquareDistance ******/
		/****** md5 signature: 87eaf82a8e24cbc0c18c1f6edf383e79 ******/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the value of the extremum square distance.
") SquareDistance;
		double SquareDistance();

};


%extend Extrema_GenLocateExtCS {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class Extrema_GenLocateExtPC *
*******************************/
/*******************************
* class Extrema_GenLocateExtPS *
*******************************/
class Extrema_GenLocateExtPS {
	public:
		/****** Extrema_GenLocateExtPS::Extrema_GenLocateExtPS ******/
		/****** md5 signature: 1208884e5f399efc4e9f31d320b3104b ******/
		%feature("compactdefaultargs") Extrema_GenLocateExtPS;
		%feature("autodoc", "
Parameters
----------
theS: Adaptor3d_Surface
theTolU: double (optional, default to Precision::PConfusion())
theTolV: double (optional, default to Precision::PConfusion())

Return
-------
None

Description
-----------
Constructor.
") Extrema_GenLocateExtPS;
		 Extrema_GenLocateExtPS(const Adaptor3d_Surface & theS, const double theTolU = Precision::PConfusion(), const double theTolV = Precision::PConfusion());

		/****** Extrema_GenLocateExtPS::IsDone ******/
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the distance is found.
") IsDone;
		bool IsDone();

		/****** Extrema_GenLocateExtPS::IsMinDist ******/
		/****** md5 signature: 9362182d56ffd4d0371976da6e0ea6cb ******/
		%feature("compactdefaultargs") IsMinDist;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt
theS: Adaptor3d_Surface
theU0: double
theV0: double

Return
-------
bool

Description
-----------
Returns True if UV point theU0, theV0 is point of local minimum of square distance between point theP and points theS(U, V), U, V are in small area around theU0, theV0.
") IsMinDist;
		static bool IsMinDist(const gp_Pnt & theP, const Adaptor3d_Surface & theS, const double theU0, const double theV0);

		/****** Extrema_GenLocateExtPS::Perform ******/
		/****** md5 signature: 4e382ef647c2f46b4c23d5512ffae46d ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt
theU0: double
theV0: double
isDistanceCriteria: bool (optional, default to false)

Return
-------
None

Description
-----------
Calculates the extrema between the point and the surface using a close point. The close point is defined by the parameter values theU0 and theV0. Type of the algorithm depends on the isDistanceCriteria flag. If flag value is false - normal projection criteria will be used. If flag value is true - distance criteria will be used.
") Perform;
		void Perform(const gp_Pnt & theP, const double theU0, const double theV0, const bool isDistanceCriteria = false);

		/****** Extrema_GenLocateExtPS::Point ******/
		/****** md5 signature: 495077ccedcb1863c9951b01a84a4bd1 ******/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Return
-------
Extrema_POnSurf

Description
-----------
Returns the point of the extremum distance.
") Point;
		const Extrema_POnSurf & Point();

		/****** Extrema_GenLocateExtPS::SquareDistance ******/
		/****** md5 signature: 87eaf82a8e24cbc0c18c1f6edf383e79 ******/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the value of the extremum square distance.
") SquareDistance;
		double SquareDistance();

};


%extend Extrema_GenLocateExtPS {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class Extrema_GenLocateExtSS *
*******************************/
class Extrema_GenLocateExtSS {
	public:
		/****** Extrema_GenLocateExtSS::Extrema_GenLocateExtSS ******/
		/****** md5 signature: 04ab116b2b054b428cded25821b973b5 ******/
		%feature("compactdefaultargs") Extrema_GenLocateExtSS;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Extrema_GenLocateExtSS;
		 Extrema_GenLocateExtSS();

		/****** Extrema_GenLocateExtSS::Extrema_GenLocateExtSS ******/
		/****** md5 signature: 73756d301260f22eb34652af819e29f3 ******/
		%feature("compactdefaultargs") Extrema_GenLocateExtSS;
		%feature("autodoc", "
Parameters
----------
S1: Adaptor3d_Surface
S2: Adaptor3d_Surface
U1: double
V1: double
U2: double
V2: double
Tol1: double
Tol2: double

Return
-------
None

Description
-----------
Calculates the distance with two close points. The close points are defined by the parameter values (U1,V1) for S1 and (U2,V2) for S2. The function F(u1,v1,u2,v2)=distance(S1(u1,v1),S2(u2,v2)) has an extremun when gradient(F)=0. The algorithm searches a zero near the close points.
") Extrema_GenLocateExtSS;
		 Extrema_GenLocateExtSS(const Adaptor3d_Surface & S1, const Adaptor3d_Surface & S2, const double U1, const double V1, const double U2, const double V2, const double Tol1, const double Tol2);

		/****** Extrema_GenLocateExtSS::IsDone ******/
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the distance is found.
") IsDone;
		bool IsDone();

		/****** Extrema_GenLocateExtSS::Perform ******/
		/****** md5 signature: 68c45a6680a5f25537378dd738191b70 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
S1: Adaptor3d_Surface
S2: Adaptor3d_Surface
U1: double
V1: double
U2: double
V2: double
Tol1: double
Tol2: double

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const Adaptor3d_Surface & S1, const Adaptor3d_Surface & S2, const double U1, const double V1, const double U2, const double V2, const double Tol1, const double Tol2);

		/****** Extrema_GenLocateExtSS::PointOnS1 ******/
		/****** md5 signature: a968c7bd12e452b2a800b3175543fbbd ******/
		%feature("compactdefaultargs") PointOnS1;
		%feature("autodoc", "Return
-------
Extrema_POnSurf

Description
-----------
Returns the point of the extremum distance on S1.
") PointOnS1;
		const Extrema_POnSurf & PointOnS1();

		/****** Extrema_GenLocateExtSS::PointOnS2 ******/
		/****** md5 signature: 158037b8ed7d0d3eff38e68c16d54d08 ******/
		%feature("compactdefaultargs") PointOnS2;
		%feature("autodoc", "Return
-------
Extrema_POnSurf

Description
-----------
Returns the point of the extremum distance on S2.
") PointOnS2;
		const Extrema_POnSurf & PointOnS2();

		/****** Extrema_GenLocateExtSS::SquareDistance ******/
		/****** md5 signature: 87eaf82a8e24cbc0c18c1f6edf383e79 ******/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the value of the extremum square distance.
") SquareDistance;
		double SquareDistance();

};


%extend Extrema_GenLocateExtSS {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class Extrema_GlobOptFuncCCC0 *
********************************/
class Extrema_GlobOptFuncCCC0 : public math_MultipleVarFunction {
	public:
		/****** Extrema_GlobOptFuncCCC0::Extrema_GlobOptFuncCCC0 ******/
		/****** md5 signature: 4c8e75f4abe82a228a576c9c9ebce67c ******/
		%feature("compactdefaultargs") Extrema_GlobOptFuncCCC0;
		%feature("autodoc", "
Parameters
----------
C1: Adaptor3d_Curve
C2: Adaptor3d_Curve

Return
-------
None

Description
-----------
No available documentation.
") Extrema_GlobOptFuncCCC0;
		 Extrema_GlobOptFuncCCC0(const Adaptor3d_Curve & C1, const Adaptor3d_Curve & C2);

		/****** Extrema_GlobOptFuncCCC0::Extrema_GlobOptFuncCCC0 ******/
		/****** md5 signature: e18f677b2f1ba0bff87cb13675251910 ******/
		%feature("compactdefaultargs") Extrema_GlobOptFuncCCC0;
		%feature("autodoc", "
Parameters
----------
C1: Adaptor2d_Curve2d
C2: Adaptor2d_Curve2d

Return
-------
None

Description
-----------
No available documentation.
") Extrema_GlobOptFuncCCC0;
		 Extrema_GlobOptFuncCCC0(const Adaptor2d_Curve2d & C1, const Adaptor2d_Curve2d & C2);

		/****** Extrema_GlobOptFuncCCC0::NbVariables ******/
		/****** md5 signature: ac9e90c594b52fb2529a5f6212b74800 ******/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbVariables;
		int NbVariables();

		/****** Extrema_GlobOptFuncCCC0::Value ******/
		/****** md5 signature: 8471cfc7cef312ad7d98cf2875f96773 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
X: math_Vector

Return
-------
F: double

Description
-----------
No available documentation.
") Value;
		bool Value(const math_Vector & X, Standard_Real &OutValue);

};


%extend Extrema_GlobOptFuncCCC0 {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class Extrema_GlobOptFuncCCC1 *
********************************/
class Extrema_GlobOptFuncCCC1 : public math_MultipleVarFunctionWithGradient {
	public:
		/****** Extrema_GlobOptFuncCCC1::Extrema_GlobOptFuncCCC1 ******/
		/****** md5 signature: 98857765fc04180c91ffe4cacb51c277 ******/
		%feature("compactdefaultargs") Extrema_GlobOptFuncCCC1;
		%feature("autodoc", "
Parameters
----------
C1: Adaptor3d_Curve
C2: Adaptor3d_Curve

Return
-------
None

Description
-----------
No available documentation.
") Extrema_GlobOptFuncCCC1;
		 Extrema_GlobOptFuncCCC1(const Adaptor3d_Curve & C1, const Adaptor3d_Curve & C2);

		/****** Extrema_GlobOptFuncCCC1::Extrema_GlobOptFuncCCC1 ******/
		/****** md5 signature: 59777f669e43d9a0e0c772dea464c1d3 ******/
		%feature("compactdefaultargs") Extrema_GlobOptFuncCCC1;
		%feature("autodoc", "
Parameters
----------
C1: Adaptor2d_Curve2d
C2: Adaptor2d_Curve2d

Return
-------
None

Description
-----------
No available documentation.
") Extrema_GlobOptFuncCCC1;
		 Extrema_GlobOptFuncCCC1(const Adaptor2d_Curve2d & C1, const Adaptor2d_Curve2d & C2);

		/****** Extrema_GlobOptFuncCCC1::Gradient ******/
		/****** md5 signature: 5a8a1d40b699db9ffadb1f48516992a9 ******/
		%feature("compactdefaultargs") Gradient;
		%feature("autodoc", "
Parameters
----------
X: math_Vector
G: math_Vector

Return
-------
bool

Description
-----------
No available documentation.
") Gradient;
		bool Gradient(const math_Vector & X, math_Vector & G);

		/****** Extrema_GlobOptFuncCCC1::NbVariables ******/
		/****** md5 signature: ac9e90c594b52fb2529a5f6212b74800 ******/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbVariables;
		int NbVariables();

		/****** Extrema_GlobOptFuncCCC1::Value ******/
		/****** md5 signature: 8471cfc7cef312ad7d98cf2875f96773 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
X: math_Vector

Return
-------
F: double

Description
-----------
No available documentation.
") Value;
		bool Value(const math_Vector & X, Standard_Real &OutValue);

		/****** Extrema_GlobOptFuncCCC1::Values ******/
		/****** md5 signature: 1d2f2dc1f7e41d65377516e5baf52f6e ******/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "
Parameters
----------
X: math_Vector
G: math_Vector

Return
-------
F: double

Description
-----------
No available documentation.
") Values;
		bool Values(const math_Vector & X, Standard_Real &OutValue, math_Vector & G);

};


%extend Extrema_GlobOptFuncCCC1 {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class Extrema_GlobOptFuncCCC2 *
********************************/
class Extrema_GlobOptFuncCCC2 : public math_MultipleVarFunctionWithHessian {
	public:
		/****** Extrema_GlobOptFuncCCC2::Extrema_GlobOptFuncCCC2 ******/
		/****** md5 signature: 352f6f3921ee64f4e551f09f65ab03d9 ******/
		%feature("compactdefaultargs") Extrema_GlobOptFuncCCC2;
		%feature("autodoc", "
Parameters
----------
C1: Adaptor3d_Curve
C2: Adaptor3d_Curve

Return
-------
None

Description
-----------
No available documentation.
") Extrema_GlobOptFuncCCC2;
		 Extrema_GlobOptFuncCCC2(const Adaptor3d_Curve & C1, const Adaptor3d_Curve & C2);

		/****** Extrema_GlobOptFuncCCC2::Extrema_GlobOptFuncCCC2 ******/
		/****** md5 signature: 9fa14c64a37952aec04b224f8f6000e9 ******/
		%feature("compactdefaultargs") Extrema_GlobOptFuncCCC2;
		%feature("autodoc", "
Parameters
----------
C1: Adaptor2d_Curve2d
C2: Adaptor2d_Curve2d

Return
-------
None

Description
-----------
No available documentation.
") Extrema_GlobOptFuncCCC2;
		 Extrema_GlobOptFuncCCC2(const Adaptor2d_Curve2d & C1, const Adaptor2d_Curve2d & C2);

		/****** Extrema_GlobOptFuncCCC2::Gradient ******/
		/****** md5 signature: 5a8a1d40b699db9ffadb1f48516992a9 ******/
		%feature("compactdefaultargs") Gradient;
		%feature("autodoc", "
Parameters
----------
X: math_Vector
G: math_Vector

Return
-------
bool

Description
-----------
No available documentation.
") Gradient;
		bool Gradient(const math_Vector & X, math_Vector & G);

		/****** Extrema_GlobOptFuncCCC2::NbVariables ******/
		/****** md5 signature: ac9e90c594b52fb2529a5f6212b74800 ******/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbVariables;
		int NbVariables();

		/****** Extrema_GlobOptFuncCCC2::Value ******/
		/****** md5 signature: 8471cfc7cef312ad7d98cf2875f96773 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
X: math_Vector

Return
-------
F: double

Description
-----------
No available documentation.
") Value;
		bool Value(const math_Vector & X, Standard_Real &OutValue);

		/****** Extrema_GlobOptFuncCCC2::Values ******/
		/****** md5 signature: 1d2f2dc1f7e41d65377516e5baf52f6e ******/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "
Parameters
----------
X: math_Vector
G: math_Vector

Return
-------
F: double

Description
-----------
No available documentation.
") Values;
		bool Values(const math_Vector & X, Standard_Real &OutValue, math_Vector & G);

		/****** Extrema_GlobOptFuncCCC2::Values ******/
		/****** md5 signature: fdc9788aec6b67a119c9ff92adc65815 ******/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "
Parameters
----------
X: math_Vector
G: math_Vector
H: math_Matrix

Return
-------
F: double

Description
-----------
No available documentation.
") Values;
		bool Values(const math_Vector & X, Standard_Real &OutValue, math_Vector & G, math_Matrix & H);

};


%extend Extrema_GlobOptFuncCCC2 {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class Extrema_GlobOptFuncCQuadric *
************************************/
class Extrema_GlobOptFuncCQuadric : public math_MultipleVarFunction {
	public:
		/****** Extrema_GlobOptFuncCQuadric::Extrema_GlobOptFuncCQuadric ******/
		/****** md5 signature: 99114e215beb985216f6c00dc13224d3 ******/
		%feature("compactdefaultargs") Extrema_GlobOptFuncCQuadric;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve *

Return
-------
None

Description
-----------
Curve and surface should exist during all the lifetime of Extrema_GlobOptFuncCQuadric.
") Extrema_GlobOptFuncCQuadric;
		 Extrema_GlobOptFuncCQuadric(const Adaptor3d_Curve * C);

		/****** Extrema_GlobOptFuncCQuadric::Extrema_GlobOptFuncCQuadric ******/
		/****** md5 signature: 3eb668c68593b34beef76faa64ec5dda ******/
		%feature("compactdefaultargs") Extrema_GlobOptFuncCQuadric;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve *
theTf: double
theTl: double

Return
-------
None

Description
-----------
No available documentation.
") Extrema_GlobOptFuncCQuadric;
		 Extrema_GlobOptFuncCQuadric(const Adaptor3d_Curve * C, const double theTf, const double theTl);

		/****** Extrema_GlobOptFuncCQuadric::Extrema_GlobOptFuncCQuadric ******/
		/****** md5 signature: fb48d40e095a7a0601592ff43956384b ******/
		%feature("compactdefaultargs") Extrema_GlobOptFuncCQuadric;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve *
S: Adaptor3d_Surface *

Return
-------
None

Description
-----------
No available documentation.
") Extrema_GlobOptFuncCQuadric;
		 Extrema_GlobOptFuncCQuadric(const Adaptor3d_Curve * C, const Adaptor3d_Surface * S);

		/****** Extrema_GlobOptFuncCQuadric::LoadQuad ******/
		/****** md5 signature: 0b87f67a07513ca35030f3bbc0fc2d5d ******/
		%feature("compactdefaultargs") LoadQuad;
		%feature("autodoc", "
Parameters
----------
S: Adaptor3d_Surface *
theUf: double
theUl: double
theVf: double
theVl: double

Return
-------
None

Description
-----------
No available documentation.
") LoadQuad;
		void LoadQuad(const Adaptor3d_Surface * S, const double theUf, const double theUl, const double theVf, const double theVl);

		/****** Extrema_GlobOptFuncCQuadric::NbVariables ******/
		/****** md5 signature: ac9e90c594b52fb2529a5f6212b74800 ******/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbVariables;
		int NbVariables();

		/****** Extrema_GlobOptFuncCQuadric::QuadricParameters ******/
		/****** md5 signature: 0d6d1773b562190c9fe7c329ab0e0c67 ******/
		%feature("compactdefaultargs") QuadricParameters;
		%feature("autodoc", "
Parameters
----------
theCT: math_Vector
theUV: math_Vector

Return
-------
None

Description
-----------
Parameters of quadric for point on curve defined by theCT.
") QuadricParameters;
		void QuadricParameters(const math_Vector & theCT, math_Vector & theUV);

		/****** Extrema_GlobOptFuncCQuadric::Value ******/
		/****** md5 signature: 12bae1c59e852185b05b873789029b36 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
theX: math_Vector

Return
-------
theF: double

Description
-----------
No available documentation.
") Value;
		bool Value(const math_Vector & theX, Standard_Real &OutValue);

};


%extend Extrema_GlobOptFuncCQuadric {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class Extrema_GlobOptFuncCS *
******************************/
class Extrema_GlobOptFuncCS : public math_MultipleVarFunctionWithHessian {
	public:
		/****** Extrema_GlobOptFuncCS::Extrema_GlobOptFuncCS ******/
		/****** md5 signature: 64fbaf8331a8fc8e7744730ac6295a01 ******/
		%feature("compactdefaultargs") Extrema_GlobOptFuncCS;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve *
S: Adaptor3d_Surface *

Return
-------
None

Description
-----------
Curve and surface should exist during all the lifetime of Extrema_GlobOptFuncCS.
") Extrema_GlobOptFuncCS;
		 Extrema_GlobOptFuncCS(const Adaptor3d_Curve * C, const Adaptor3d_Surface * S);

		/****** Extrema_GlobOptFuncCS::Gradient ******/
		/****** md5 signature: 61a0abc763ab66682da321427121e4fa ******/
		%feature("compactdefaultargs") Gradient;
		%feature("autodoc", "
Parameters
----------
theX: math_Vector
theG: math_Vector

Return
-------
bool

Description
-----------
No available documentation.
") Gradient;
		bool Gradient(const math_Vector & theX, math_Vector & theG);

		/****** Extrema_GlobOptFuncCS::NbVariables ******/
		/****** md5 signature: ac9e90c594b52fb2529a5f6212b74800 ******/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbVariables;
		int NbVariables();

		/****** Extrema_GlobOptFuncCS::Value ******/
		/****** md5 signature: 12bae1c59e852185b05b873789029b36 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
theX: math_Vector

Return
-------
theF: double

Description
-----------
No available documentation.
") Value;
		bool Value(const math_Vector & theX, Standard_Real &OutValue);

		/****** Extrema_GlobOptFuncCS::Values ******/
		/****** md5 signature: 0dab7ce2699bd07352ce2e4659d3eb68 ******/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "
Parameters
----------
theX: math_Vector
theG: math_Vector

Return
-------
theF: double

Description
-----------
No available documentation.
") Values;
		bool Values(const math_Vector & theX, Standard_Real &OutValue, math_Vector & theG);

		/****** Extrema_GlobOptFuncCS::Values ******/
		/****** md5 signature: 4fd58d9f887225f1125e7b1ff71a6668 ******/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "
Parameters
----------
theX: math_Vector
theG: math_Vector
theH: math_Matrix

Return
-------
theF: double

Description
-----------
No available documentation.
") Values;
		bool Values(const math_Vector & theX, Standard_Real &OutValue, math_Vector & theG, math_Matrix & theH);

};


%extend Extrema_GlobOptFuncCS {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class Extrema_GlobOptFuncConicS *
**********************************/
class Extrema_GlobOptFuncConicS : public math_MultipleVarFunction {
	public:
		/****** Extrema_GlobOptFuncConicS::Extrema_GlobOptFuncConicS ******/
		/****** md5 signature: de0973757811ece0501040b69ceb698c ******/
		%feature("compactdefaultargs") Extrema_GlobOptFuncConicS;
		%feature("autodoc", "
Parameters
----------
C: Adaptor3d_Curve *
S: Adaptor3d_Surface *

Return
-------
None

Description
-----------
Curve and surface should exist during all the lifetime of Extrema_GlobOptFuncConicS.
") Extrema_GlobOptFuncConicS;
		 Extrema_GlobOptFuncConicS(const Adaptor3d_Curve * C, const Adaptor3d_Surface * S);

		/****** Extrema_GlobOptFuncConicS::Extrema_GlobOptFuncConicS ******/
		/****** md5 signature: 85e49315da7906cf8c9fd935a3e1fbec ******/
		%feature("compactdefaultargs") Extrema_GlobOptFuncConicS;
		%feature("autodoc", "
Parameters
----------
S: Adaptor3d_Surface *

Return
-------
None

Description
-----------
No available documentation.
") Extrema_GlobOptFuncConicS;
		 Extrema_GlobOptFuncConicS(const Adaptor3d_Surface * S);

		/****** Extrema_GlobOptFuncConicS::Extrema_GlobOptFuncConicS ******/
		/****** md5 signature: 5831ce33cfc82c020ccd09ceb0a8bddb ******/
		%feature("compactdefaultargs") Extrema_GlobOptFuncConicS;
		%feature("autodoc", "
Parameters
----------
S: Adaptor3d_Surface *
theUf: double
theUl: double
theVf: double
theVl: double

Return
-------
None

Description
-----------
No available documentation.
") Extrema_GlobOptFuncConicS;
		 Extrema_GlobOptFuncConicS(const Adaptor3d_Surface * S, const double theUf, const double theUl, const double theVf, const double theVl);

		/****** Extrema_GlobOptFuncConicS::ConicParameter ******/
		/****** md5 signature: 989543e4fabe1d0d046995861f884dc6 ******/
		%feature("compactdefaultargs") ConicParameter;
		%feature("autodoc", "
Parameters
----------
theUV: math_Vector

Return
-------
double

Description
-----------
Parameter of conic for point on surface defined by theUV.
") ConicParameter;
		double ConicParameter(const math_Vector & theUV);

		/****** Extrema_GlobOptFuncConicS::LoadConic ******/
		/****** md5 signature: 6e2b37e9314110a434940f73c2cb85c7 ******/
		%feature("compactdefaultargs") LoadConic;
		%feature("autodoc", "
Parameters
----------
S: Adaptor3d_Curve *
theTf: double
theTl: double

Return
-------
None

Description
-----------
No available documentation.
") LoadConic;
		void LoadConic(const Adaptor3d_Curve * S, const double theTf, const double theTl);

		/****** Extrema_GlobOptFuncConicS::NbVariables ******/
		/****** md5 signature: ac9e90c594b52fb2529a5f6212b74800 ******/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbVariables;
		int NbVariables();

		/****** Extrema_GlobOptFuncConicS::Value ******/
		/****** md5 signature: 12bae1c59e852185b05b873789029b36 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
theX: math_Vector

Return
-------
theF: double

Description
-----------
No available documentation.
") Value;
		bool Value(const math_Vector & theX, Standard_Real &OutValue);

};


%extend Extrema_GlobOptFuncConicS {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class Extrema_LocateExtCC *
****************************/
class Extrema_LocateExtCC {
	public:
		/****** Extrema_LocateExtCC::Extrema_LocateExtCC ******/
		/****** md5 signature: 114ea6417661af52ba40c88f08fc2b10 ******/
		%feature("compactdefaultargs") Extrema_LocateExtCC;
		%feature("autodoc", "
Parameters
----------
C1: Adaptor3d_Curve
C2: Adaptor3d_Curve
U0: double
V0: double

Return
-------
None

Description
-----------
Calculates the distance with a close point. The close point is defined by a parameter value on each curve. The function F(u,v)=distance(C1(u),C2(v)) has an extremun when gradient(f)=0. The algorithm searches the zero near the close point.
") Extrema_LocateExtCC;
		 Extrema_LocateExtCC(const Adaptor3d_Curve & C1, const Adaptor3d_Curve & C2, const double U0, const double V0);

		/****** Extrema_LocateExtCC::IsDone ******/
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the distance is found.
") IsDone;
		bool IsDone();

		/****** Extrema_LocateExtCC::Point ******/
		/****** md5 signature: 7be28bf48146b84b5c9a78b62f7a11e6 ******/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "
Parameters
----------
P1: Extrema_POnCurv
P2: Extrema_POnCurv

Return
-------
None

Description
-----------
Returns the points of the extremum distance. P1 is on the first curve, P2 on the second one.
") Point;
		void Point(Extrema_POnCurv & P1, Extrema_POnCurv & P2);

		/****** Extrema_LocateExtCC::SquareDistance ******/
		/****** md5 signature: 87eaf82a8e24cbc0c18c1f6edf383e79 ******/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the value of the extremum square distance.
") SquareDistance;
		double SquareDistance();

};


%extend Extrema_LocateExtCC {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class Extrema_LocateExtCC2d *
******************************/
class Extrema_LocateExtCC2d {
	public:
		/****** Extrema_LocateExtCC2d::Extrema_LocateExtCC2d ******/
		/****** md5 signature: 213ede6699af192c6f8dc867acda3bda ******/
		%feature("compactdefaultargs") Extrema_LocateExtCC2d;
		%feature("autodoc", "
Parameters
----------
C1: Adaptor2d_Curve2d
C2: Adaptor2d_Curve2d
U0: double
V0: double

Return
-------
None

Description
-----------
Calculates the distance with a close point. The close point is defined by a parameter value on each curve. The function F(u,v)=distance(C1(u),C2(v)) has an extremun when gradient(f)=0. The algorithm searches the zero near the close point.
") Extrema_LocateExtCC2d;
		 Extrema_LocateExtCC2d(const Adaptor2d_Curve2d & C1, const Adaptor2d_Curve2d & C2, const double U0, const double V0);

		/****** Extrema_LocateExtCC2d::IsDone ******/
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the distance is found.
") IsDone;
		bool IsDone();

		/****** Extrema_LocateExtCC2d::Point ******/
		/****** md5 signature: 22f957435cf6e3814ad63d5f9079e8df ******/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "
Parameters
----------
P1: Extrema_POnCurv2d
P2: Extrema_POnCurv2d

Return
-------
None

Description
-----------
Returns the points of the extremum distance. P1 is on the first curve, P2 on the second one.
") Point;
		void Point(Extrema_POnCurv2d & P1, Extrema_POnCurv2d & P2);

		/****** Extrema_LocateExtCC2d::SquareDistance ******/
		/****** md5 signature: 87eaf82a8e24cbc0c18c1f6edf383e79 ******/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the value of the extremum square distance.
") SquareDistance;
		double SquareDistance();

};


%extend Extrema_LocateExtCC2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class Extrema_POnCurv *
************************/
class Extrema_POnCurv {
	public:
		/****** Extrema_POnCurv::Extrema_POnCurv ******/
		/****** md5 signature: 06f69e01b7ac3dab13e3fc05f946e31e ******/
		%feature("compactdefaultargs") Extrema_POnCurv;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creation of an indefinite point on curve.
") Extrema_POnCurv;
		 Extrema_POnCurv();

		/****** Extrema_POnCurv::Extrema_POnCurv ******/
		/****** md5 signature: 0d9fe1c6b59b1b7dc18a49e9ab40ff2a ******/
		%feature("compactdefaultargs") Extrema_POnCurv;
		%feature("autodoc", "
Parameters
----------
theU: double
theP: gp_Pnt

Return
-------
None

Description
-----------
Creation of a point on curve with a parameter value on the curve and a Pnt from gp.
") Extrema_POnCurv;
		 Extrema_POnCurv(const double theU, const gp_Pnt & theP);

		/****** Extrema_POnCurv::Parameter ******/
		/****** md5 signature: f2f0d3a4c48532483b401ae3d2d5c5fb ******/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the parameter on the curve.
") Parameter;
		double Parameter();

		/****** Extrema_POnCurv::SetValues ******/
		/****** md5 signature: a090ad8451a2ac5768bb028734a1246f ******/
		%feature("compactdefaultargs") SetValues;
		%feature("autodoc", "
Parameters
----------
theU: double
theP: gp_Pnt

Return
-------
None

Description
-----------
Sets the point and parameter values.
") SetValues;
		void SetValues(const double theU, const gp_Pnt & theP);

		/****** Extrema_POnCurv::Value ******/
		/****** md5 signature: af4473e892277db4b6b647e7c05342c6 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Returns the point.
") Value;
		const gp_Pnt Value();

};


%extend Extrema_POnCurv {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class Extrema_POnCurv2d *
**************************/
class Extrema_POnCurv2d {
	public:
		/****** Extrema_POnCurv2d::Extrema_POnCurv2d ******/
		/****** md5 signature: 4c5f6f5dce5791fa2cdce03ebbebd933 ******/
		%feature("compactdefaultargs") Extrema_POnCurv2d;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creation of an indefinite point on curve.
") Extrema_POnCurv2d;
		 Extrema_POnCurv2d();

		/****** Extrema_POnCurv2d::Extrema_POnCurv2d ******/
		/****** md5 signature: c32b15f0b51aed103ed639053efe9ab4 ******/
		%feature("compactdefaultargs") Extrema_POnCurv2d;
		%feature("autodoc", "
Parameters
----------
theU: double
theP: gp_Pnt2d

Return
-------
None

Description
-----------
Creation of a point on curve with a parameter value on the curve and a Pnt from gp.
") Extrema_POnCurv2d;
		 Extrema_POnCurv2d(const double theU, const gp_Pnt2d & theP);

		/****** Extrema_POnCurv2d::Parameter ******/
		/****** md5 signature: f2f0d3a4c48532483b401ae3d2d5c5fb ******/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the parameter on the curve.
") Parameter;
		double Parameter();

		/****** Extrema_POnCurv2d::SetValues ******/
		/****** md5 signature: e3a53bbd3459f51fa89592354c1605ba ******/
		%feature("compactdefaultargs") SetValues;
		%feature("autodoc", "
Parameters
----------
theU: double
theP: gp_Pnt2d

Return
-------
None

Description
-----------
Sets the point and parameter values.
") SetValues;
		void SetValues(const double theU, const gp_Pnt2d & theP);

		/****** Extrema_POnCurv2d::Value ******/
		/****** md5 signature: 8834940406744488752f588b0a4b9d14 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
gp_Pnt2d

Description
-----------
Returns the point.
") Value;
		const gp_Pnt2d Value();

};


%extend Extrema_POnCurv2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class Extrema_POnSurf *
************************/
class Extrema_POnSurf {
	public:
		/****** Extrema_POnSurf::Extrema_POnSurf ******/
		/****** md5 signature: a14ababd0e49753065f54bf5fae4cb09 ******/
		%feature("compactdefaultargs") Extrema_POnSurf;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creation of an indefinite point on surface.
") Extrema_POnSurf;
		 Extrema_POnSurf();

		/****** Extrema_POnSurf::Extrema_POnSurf ******/
		/****** md5 signature: 12241b0c499b0331c0d19a66726b40a0 ******/
		%feature("compactdefaultargs") Extrema_POnSurf;
		%feature("autodoc", "
Parameters
----------
theU: double
theV: double
theP: gp_Pnt

Return
-------
None

Description
-----------
Creation of a point on surface with parameter values on the surface and a Pnt from gp.
") Extrema_POnSurf;
		 Extrema_POnSurf(const double theU, const double theV, const gp_Pnt & theP);

		/****** Extrema_POnSurf::Parameter ******/
		/****** md5 signature: de39ab610894e1ecb40f5f07c8971d62 ******/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "
Parameters
----------

Return
-------
theU: double
theV: double

Description
-----------
Returns the parameter values on the surface.
") Parameter;
		void Parameter(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** Extrema_POnSurf::SetParameters ******/
		/****** md5 signature: 5e2a4fad408356ed8f101b4c81390724 ******/
		%feature("compactdefaultargs") SetParameters;
		%feature("autodoc", "
Parameters
----------
theU: double
theV: double
thePnt: gp_Pnt

Return
-------
None

Description
-----------
Sets the params of current POnSurf instance. (e.g. to the point to be projected).
") SetParameters;
		void SetParameters(const double theU, const double theV, const gp_Pnt & thePnt);

		/****** Extrema_POnSurf::Value ******/
		/****** md5 signature: af4473e892277db4b6b647e7c05342c6 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Returns the 3d point.
") Value;
		const gp_Pnt Value();

};


%extend Extrema_POnSurf {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class Extrema_POnSurfParams *
******************************/
class Extrema_POnSurfParams : public Extrema_POnSurf {
	public:
		/****** Extrema_POnSurfParams::Extrema_POnSurfParams ******/
		/****** md5 signature: dff8771b7cb0d2448878447996998f98 ******/
		%feature("compactdefaultargs") Extrema_POnSurfParams;
		%feature("autodoc", "Return
-------
None

Description
-----------
empty constructor.
") Extrema_POnSurfParams;
		 Extrema_POnSurfParams();

		/****** Extrema_POnSurfParams::Extrema_POnSurfParams ******/
		/****** md5 signature: 78a218a6e01de6bb568f073e9b0926b5 ******/
		%feature("compactdefaultargs") Extrema_POnSurfParams;
		%feature("autodoc", "
Parameters
----------
theU: double
theV: double
thePnt: gp_Pnt

Return
-------
None

Description
-----------
Creation of a point on surface with parameter values on the surface and a Pnt from gp.
") Extrema_POnSurfParams;
		 Extrema_POnSurfParams(const double theU, const double theV, const gp_Pnt & thePnt);

		/****** Extrema_POnSurfParams::GetElementType ******/
		/****** md5 signature: 12fbd34755086e46bb8feea38f8d3205 ******/
		%feature("compactdefaultargs") GetElementType;
		%feature("autodoc", "Return
-------
Extrema_ElementType

Description
-----------
Query the element type on which this point is situated.
") GetElementType;
		Extrema_ElementType GetElementType();

		/****** Extrema_POnSurfParams::GetIndices ******/
		/****** md5 signature: 83b26ddf246d7ab0213d0351e8356ec9 ******/
		%feature("compactdefaultargs") GetIndices;
		%feature("autodoc", "
Parameters
----------

Return
-------
theIndexU: int
theIndexV: int

Description
-----------
Query the U and V indices of an element that contains this point.
") GetIndices;
		void GetIndices(Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****** Extrema_POnSurfParams::GetSqrDistance ******/
		/****** md5 signature: 474049ccd6b6e21af7181eee09e47c0d ******/
		%feature("compactdefaultargs") GetSqrDistance;
		%feature("autodoc", "Return
-------
double

Description
-----------
Query the square distance from this point to another one.
") GetSqrDistance;
		double GetSqrDistance();

		/****** Extrema_POnSurfParams::SetElementType ******/
		/****** md5 signature: 0fb7b51ca9f2327e60a62794cd8bf49d ******/
		%feature("compactdefaultargs") SetElementType;
		%feature("autodoc", "
Parameters
----------
theElementType: Extrema_ElementType

Return
-------
None

Description
-----------
Sets the element type on which this point is situated.
") SetElementType;
		void SetElementType(const Extrema_ElementType theElementType);

		/****** Extrema_POnSurfParams::SetIndices ******/
		/****** md5 signature: 1fc72f87a9e9c2a7e926442bdc90f2b8 ******/
		%feature("compactdefaultargs") SetIndices;
		%feature("autodoc", "
Parameters
----------
theIndexU: int
theIndexV: int

Return
-------
None

Description
-----------
Sets the U and V indices of an element that contains this point.
") SetIndices;
		void SetIndices(const int theIndexU, const int theIndexV);

		/****** Extrema_POnSurfParams::SetSqrDistance ******/
		/****** md5 signature: 9be5a1f4503493bf66e6a60e96adc700 ******/
		%feature("compactdefaultargs") SetSqrDistance;
		%feature("autodoc", "
Parameters
----------
theSqrDistance: double

Return
-------
None

Description
-----------
Sets the square distance from this point to another one (e.g. to the point to be projected).
") SetSqrDistance;
		void SetSqrDistance(const double theSqrDistance);

};


%extend Extrema_POnSurfParams {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */

class Extrema_HArray1OfPOnCurv : public NCollection_Array1<Extrema_POnCurv>, public Standard_Transient {
  public:
    Extrema_HArray1OfPOnCurv(const Standard_Integer theLower, const Standard_Integer theUpper);
    Extrema_HArray1OfPOnCurv(const Standard_Integer theLower, const Standard_Integer theUpper, const NCollection_Array1<Extrema_POnCurv>::value_type& theValue);
    Extrema_HArray1OfPOnCurv(const NCollection_Array1<Extrema_POnCurv>& theOther);
    const NCollection_Array1<Extrema_POnCurv>& Array1();
    NCollection_Array1<Extrema_POnCurv>& ChangeArray1();
};
%make_alias(Extrema_HArray1OfPOnCurv)


class Extrema_HArray1OfPOnCurv2d : public NCollection_Array1<Extrema_POnCurv2d>, public Standard_Transient {
  public:
    Extrema_HArray1OfPOnCurv2d(const Standard_Integer theLower, const Standard_Integer theUpper);
    Extrema_HArray1OfPOnCurv2d(const Standard_Integer theLower, const Standard_Integer theUpper, const NCollection_Array1<Extrema_POnCurv2d>::value_type& theValue);
    Extrema_HArray1OfPOnCurv2d(const NCollection_Array1<Extrema_POnCurv2d>& theOther);
    const NCollection_Array1<Extrema_POnCurv2d>& Array1();
    NCollection_Array1<Extrema_POnCurv2d>& ChangeArray1();
};
%make_alias(Extrema_HArray1OfPOnCurv2d)


class Extrema_HArray1OfPOnSurf : public NCollection_Array1<Extrema_POnSurf>, public Standard_Transient {
  public:
    Extrema_HArray1OfPOnSurf(const Standard_Integer theLower, const Standard_Integer theUpper);
    Extrema_HArray1OfPOnSurf(const Standard_Integer theLower, const Standard_Integer theUpper, const NCollection_Array1<Extrema_POnSurf>::value_type& theValue);
    Extrema_HArray1OfPOnSurf(const NCollection_Array1<Extrema_POnSurf>& theOther);
    const NCollection_Array1<Extrema_POnSurf>& Array1();
    NCollection_Array1<Extrema_POnSurf>& ChangeArray1();
};
%make_alias(Extrema_HArray1OfPOnSurf)

/* harray2 classes */
class Extrema_HArray2OfPOnCurv : public NCollection_Array2<Extrema_POnCurv>, public Standard_Transient {
  public:
    Extrema_HArray2OfPOnCurv(const Standard_Integer theRowLow, const Standard_Integer theRowUpp, const Standard_Integer theColLow,
                const Standard_Integer theColUpp);
    Extrema_HArray2OfPOnCurv(const Standard_Integer theRowLow, const Standard_Integer theRowUpp, const Standard_Integer theColLow,
               const Standard_Integer theColUpp, const NCollection_Array2<Extrema_POnCurv>::value_type& theValue);
    Extrema_HArray2OfPOnCurv(const NCollection_Array2<Extrema_POnCurv>& theOther);
    const NCollection_Array2<Extrema_POnCurv>& Array2 ();
    NCollection_Array2<Extrema_POnCurv>& ChangeArray2 (); 
};
%make_alias(Extrema_HArray2OfPOnCurv)


class Extrema_HArray2OfPOnCurv2d : public NCollection_Array2<Extrema_POnCurv2d>, public Standard_Transient {
  public:
    Extrema_HArray2OfPOnCurv2d(const Standard_Integer theRowLow, const Standard_Integer theRowUpp, const Standard_Integer theColLow,
                const Standard_Integer theColUpp);
    Extrema_HArray2OfPOnCurv2d(const Standard_Integer theRowLow, const Standard_Integer theRowUpp, const Standard_Integer theColLow,
               const Standard_Integer theColUpp, const NCollection_Array2<Extrema_POnCurv2d>::value_type& theValue);
    Extrema_HArray2OfPOnCurv2d(const NCollection_Array2<Extrema_POnCurv2d>& theOther);
    const NCollection_Array2<Extrema_POnCurv2d>& Array2 ();
    NCollection_Array2<Extrema_POnCurv2d>& ChangeArray2 (); 
};
%make_alias(Extrema_HArray2OfPOnCurv2d)


class Extrema_HArray2OfPOnSurf : public NCollection_Array2<Extrema_POnSurf>, public Standard_Transient {
  public:
    Extrema_HArray2OfPOnSurf(const Standard_Integer theRowLow, const Standard_Integer theRowUpp, const Standard_Integer theColLow,
                const Standard_Integer theColUpp);
    Extrema_HArray2OfPOnSurf(const Standard_Integer theRowLow, const Standard_Integer theRowUpp, const Standard_Integer theColLow,
               const Standard_Integer theColUpp, const NCollection_Array2<Extrema_POnSurf>::value_type& theValue);
    Extrema_HArray2OfPOnSurf(const NCollection_Array2<Extrema_POnSurf>& theOther);
    const NCollection_Array2<Extrema_POnSurf>& Array2 ();
    NCollection_Array2<Extrema_POnSurf>& ChangeArray2 (); 
};
%make_alias(Extrema_HArray2OfPOnSurf)


/* hsequence classes */
/* class aliases */
%pythoncode {
}
/* deprecated methods */
%pythoncode {
@deprecated
def Extrema_Curve2dTool_BSpline(*args):
	return Extrema_Curve2dTool.BSpline(*args)

@deprecated
def Extrema_Curve2dTool_Bezier(*args):
	return Extrema_Curve2dTool.Bezier(*args)

@deprecated
def Extrema_Curve2dTool_Circle(*args):
	return Extrema_Curve2dTool.Circle(*args)

@deprecated
def Extrema_Curve2dTool_Continuity(*args):
	return Extrema_Curve2dTool.Continuity(*args)

@deprecated
def Extrema_Curve2dTool_D0(*args):
	return Extrema_Curve2dTool.D0(*args)

@deprecated
def Extrema_Curve2dTool_D1(*args):
	return Extrema_Curve2dTool.D1(*args)

@deprecated
def Extrema_Curve2dTool_D2(*args):
	return Extrema_Curve2dTool.D2(*args)

@deprecated
def Extrema_Curve2dTool_D3(*args):
	return Extrema_Curve2dTool.D3(*args)

@deprecated
def Extrema_Curve2dTool_DN(*args):
	return Extrema_Curve2dTool.DN(*args)

@deprecated
def Extrema_Curve2dTool_DeflCurvIntervals(*args):
	return Extrema_Curve2dTool.DeflCurvIntervals(*args)

@deprecated
def Extrema_Curve2dTool_Degree(*args):
	return Extrema_Curve2dTool.Degree(*args)

@deprecated
def Extrema_Curve2dTool_Ellipse(*args):
	return Extrema_Curve2dTool.Ellipse(*args)

@deprecated
def Extrema_Curve2dTool_FirstParameter(*args):
	return Extrema_Curve2dTool.FirstParameter(*args)

@deprecated
def Extrema_Curve2dTool_GetType(*args):
	return Extrema_Curve2dTool.GetType(*args)

@deprecated
def Extrema_Curve2dTool_Hyperbola(*args):
	return Extrema_Curve2dTool.Hyperbola(*args)

@deprecated
def Extrema_Curve2dTool_Intervals(*args):
	return Extrema_Curve2dTool.Intervals(*args)

@deprecated
def Extrema_Curve2dTool_IsClosed(*args):
	return Extrema_Curve2dTool.IsClosed(*args)

@deprecated
def Extrema_Curve2dTool_IsPeriodic(*args):
	return Extrema_Curve2dTool.IsPeriodic(*args)

@deprecated
def Extrema_Curve2dTool_IsRational(*args):
	return Extrema_Curve2dTool.IsRational(*args)

@deprecated
def Extrema_Curve2dTool_LastParameter(*args):
	return Extrema_Curve2dTool.LastParameter(*args)

@deprecated
def Extrema_Curve2dTool_Line(*args):
	return Extrema_Curve2dTool.Line(*args)

@deprecated
def Extrema_Curve2dTool_NbIntervals(*args):
	return Extrema_Curve2dTool.NbIntervals(*args)

@deprecated
def Extrema_Curve2dTool_NbKnots(*args):
	return Extrema_Curve2dTool.NbKnots(*args)

@deprecated
def Extrema_Curve2dTool_NbPoles(*args):
	return Extrema_Curve2dTool.NbPoles(*args)

@deprecated
def Extrema_Curve2dTool_Parabola(*args):
	return Extrema_Curve2dTool.Parabola(*args)

@deprecated
def Extrema_Curve2dTool_Period(*args):
	return Extrema_Curve2dTool.Period(*args)

@deprecated
def Extrema_Curve2dTool_Resolution(*args):
	return Extrema_Curve2dTool.Resolution(*args)

@deprecated
def Extrema_Curve2dTool_Value(*args):
	return Extrema_Curve2dTool.Value(*args)

@deprecated
def Extrema_CurveTool_BSpline(*args):
	return Extrema_CurveTool.BSpline(*args)

@deprecated
def Extrema_CurveTool_Bezier(*args):
	return Extrema_CurveTool.Bezier(*args)

@deprecated
def Extrema_CurveTool_Circle(*args):
	return Extrema_CurveTool.Circle(*args)

@deprecated
def Extrema_CurveTool_Continuity(*args):
	return Extrema_CurveTool.Continuity(*args)

@deprecated
def Extrema_CurveTool_D0(*args):
	return Extrema_CurveTool.D0(*args)

@deprecated
def Extrema_CurveTool_D1(*args):
	return Extrema_CurveTool.D1(*args)

@deprecated
def Extrema_CurveTool_D2(*args):
	return Extrema_CurveTool.D2(*args)

@deprecated
def Extrema_CurveTool_D3(*args):
	return Extrema_CurveTool.D3(*args)

@deprecated
def Extrema_CurveTool_DN(*args):
	return Extrema_CurveTool.DN(*args)

@deprecated
def Extrema_CurveTool_DeflCurvIntervals(*args):
	return Extrema_CurveTool.DeflCurvIntervals(*args)

@deprecated
def Extrema_CurveTool_Degree(*args):
	return Extrema_CurveTool.Degree(*args)

@deprecated
def Extrema_CurveTool_Ellipse(*args):
	return Extrema_CurveTool.Ellipse(*args)

@deprecated
def Extrema_CurveTool_FirstParameter(*args):
	return Extrema_CurveTool.FirstParameter(*args)

@deprecated
def Extrema_CurveTool_GetType(*args):
	return Extrema_CurveTool.GetType(*args)

@deprecated
def Extrema_CurveTool_Hyperbola(*args):
	return Extrema_CurveTool.Hyperbola(*args)

@deprecated
def Extrema_CurveTool_Intervals(*args):
	return Extrema_CurveTool.Intervals(*args)

@deprecated
def Extrema_CurveTool_IsPeriodic(*args):
	return Extrema_CurveTool.IsPeriodic(*args)

@deprecated
def Extrema_CurveTool_IsRational(*args):
	return Extrema_CurveTool.IsRational(*args)

@deprecated
def Extrema_CurveTool_LastParameter(*args):
	return Extrema_CurveTool.LastParameter(*args)

@deprecated
def Extrema_CurveTool_Line(*args):
	return Extrema_CurveTool.Line(*args)

@deprecated
def Extrema_CurveTool_NbIntervals(*args):
	return Extrema_CurveTool.NbIntervals(*args)

@deprecated
def Extrema_CurveTool_NbKnots(*args):
	return Extrema_CurveTool.NbKnots(*args)

@deprecated
def Extrema_CurveTool_NbPoles(*args):
	return Extrema_CurveTool.NbPoles(*args)

@deprecated
def Extrema_CurveTool_Parabola(*args):
	return Extrema_CurveTool.Parabola(*args)

@deprecated
def Extrema_CurveTool_Period(*args):
	return Extrema_CurveTool.Period(*args)

@deprecated
def Extrema_CurveTool_Resolution(*args):
	return Extrema_CurveTool.Resolution(*args)

@deprecated
def Extrema_CurveTool_Value(*args):
	return Extrema_CurveTool.Value(*args)

@deprecated
def Extrema_GGenExtCC_PointsInspector_Coord(*args):
	return Extrema_GGenExtCC_PointsInspector.Coord(*args)

@deprecated
def Extrema_GGenExtCC_PointsInspector_Shift(*args):
	return Extrema_GGenExtCC_PointsInspector.Shift(*args)

@deprecated
def Extrema_GenLocateExtPS_IsMinDist(*args):
	return Extrema_GenLocateExtPS.IsMinDist(*args)

}
