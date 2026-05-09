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
%define ADAPTOR3DDOCSTRING
"Adaptor3d module, see official documentation at
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_adaptor3d.html"
%enddef
%module (package="OCC.Core", docstring=ADAPTOR3DDOCSTRING) Adaptor3d


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
#include<Adaptor3d_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<Geom_module.hxx>
#include<gp_module.hxx>
#include<GeomAbs_module.hxx>
#include<TColStd_module.hxx>
#include<TopAbs_module.hxx>
#include<Adaptor2d_module.hxx>
#include<math_module.hxx>
#include<Geom2d_module.hxx>
#include<Message_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import Geom.i
%import gp.i
%import GeomAbs.i
%import TColStd.i
%import TopAbs.i
%import Adaptor2d.i
%import math.i

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
%wrap_handle(Adaptor3d_Curve)
%wrap_handle(Adaptor3d_HVertex)
%wrap_handle(Adaptor3d_Surface)
%wrap_handle(Adaptor3d_TopolTool)
%wrap_handle(Adaptor3d_CurveOnSurface)
%wrap_handle(Adaptor3d_IsoCurve)
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/************************
* class Adaptor3d_Curve *
************************/
class Adaptor3d_Curve : public Standard_Transient {
	public:
		/****** Adaptor3d_Curve::BSpline ******/
		/****** md5 signature: 534c7ad12bf6a739dd70c41ffd91fbc3 ******/
		%feature("compactdefaultargs") BSpline;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_BSplineCurve>

Description
-----------
No available documentation.
") BSpline;
		virtual opencascade::handle<Geom_BSplineCurve> BSpline();

		/****** Adaptor3d_Curve::Bezier ******/
		/****** md5 signature: d039f5111d5d399e0d141d31d71bb173 ******/
		%feature("compactdefaultargs") Bezier;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_BezierCurve>

Description
-----------
No available documentation.
") Bezier;
		virtual opencascade::handle<Geom_BezierCurve> Bezier();

		/****** Adaptor3d_Curve::Circle ******/
		/****** md5 signature: 2ffde840d9a6755dd8dac11847721aeb ******/
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", "Return
-------
gp_Circ

Description
-----------
No available documentation.
") Circle;
		virtual gp_Circ Circle();

		/****** Adaptor3d_Curve::Continuity ******/
		/****** md5 signature: 8564d2514f3a14a163da9fa2b30a9284 ******/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "Return
-------
GeomAbs_Shape

Description
-----------
No available documentation.
") Continuity;
		virtual GeomAbs_Shape Continuity();

		/****** Adaptor3d_Curve::D0 ******/
		/****** md5 signature: 18bc962f0ab46fd90c0b9c2762f34965 ******/
		%feature("compactdefaultargs") D0;
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
Computes the point of parameter U on the curve.
") D0;
		void D0(const double theU, gp_Pnt & theP);

		/****** Adaptor3d_Curve::D1 ******/
		/****** md5 signature: e0975b57518001aca2fb24c7ef146d82 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
theU: double
theP: gp_Pnt
theV: gp_Vec

Return
-------
None

Description
-----------
Computes the point of parameter U on the curve with its first derivative. Raised if the continuity of the current interval is not C1.
") D1;
		void D1(const double theU, gp_Pnt & theP, gp_Vec & theV);

		/****** Adaptor3d_Curve::D2 ******/
		/****** md5 signature: 9e3f5ca4fcecaabda81bbd1965e0bf69 ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
theU: double
theP: gp_Pnt
theV1: gp_Vec
theV2: gp_Vec

Return
-------
None

Description
-----------
Returns the point P of parameter U, the first and second derivatives V1 and V2. Raised if the continuity of the current interval is not C2.
") D2;
		void D2(const double theU, gp_Pnt & theP, gp_Vec & theV1, gp_Vec & theV2);

		/****** Adaptor3d_Curve::D3 ******/
		/****** md5 signature: 1384619b6eab6a0b63af19af82165c94 ******/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "
Parameters
----------
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
Returns the point P of parameter U, the first, the second and the third derivative. Raised if the continuity of the current interval is not C3.
") D3;
		void D3(const double theU, gp_Pnt & theP, gp_Vec & theV1, gp_Vec & theV2, gp_Vec & theV3);

		/****** Adaptor3d_Curve::DN ******/
		/****** md5 signature: aea79806955537215bb5b9bb8a88ce01 ******/
		%feature("compactdefaultargs") DN;
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
The returned vector gives the value of the derivative for the order of derivation N. Raised if the continuity of the current interval is not CN. Raised if N < 1.
") DN;
		gp_Vec DN(const double theU, const int theN);

		/****** Adaptor3d_Curve::Degree ******/
		/****** md5 signature: 788d639566905aeb8417180053be0d13 ******/
		%feature("compactdefaultargs") Degree;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Degree;
		virtual int Degree();

		/****** Adaptor3d_Curve::Ellipse ******/
		/****** md5 signature: d9f1f2aa507ae2b9ee66e792a6ec6d18 ******/
		%feature("compactdefaultargs") Ellipse;
		%feature("autodoc", "Return
-------
gp_Elips

Description
-----------
No available documentation.
") Ellipse;
		virtual gp_Elips Ellipse();

		/****** Adaptor3d_Curve::EvalD0 ******/
		/****** md5 signature: bec965f6203f2bd3cb267e7ea0b98500 ******/
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
Computes the point of parameter U on the curve. Raises an exception on failure.
") EvalD0;
		virtual gp_Pnt EvalD0(const double theU);

		/****** Adaptor3d_Curve::EvalD1 ******/
		/****** md5 signature: 10dd781fd1e8a8f4a9ac2e86c0f143e3 ******/
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
Computes the point and first derivative at parameter U. Raises an exception on failure.
") EvalD1;
		virtual Geom_Curve::ResD1 EvalD1(const double theU);

		/****** Adaptor3d_Curve::EvalD2 ******/
		/****** md5 signature: e08ebe32e74f989a261008b50f1148de ******/
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
Computes the point and first two derivatives at parameter U. Raises an exception on failure.
") EvalD2;
		virtual Geom_Curve::ResD2 EvalD2(const double theU);

		/****** Adaptor3d_Curve::EvalD3 ******/
		/****** md5 signature: 8a2032404733ec4bc52c0222e6cf1f97 ******/
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
Computes the point and first three derivatives at parameter U. Raises an exception on failure.
") EvalD3;
		virtual Geom_Curve::ResD3 EvalD3(const double theU);

		/****** Adaptor3d_Curve::EvalDN ******/
		/****** md5 signature: 0039827652a145ead7b1e6660a1f482a ******/
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
Computes the Nth derivative at parameter U. Raises an exception on failure.
") EvalDN;
		virtual gp_Vec EvalDN(const double theU, const int theN);

		/****** Adaptor3d_Curve::FirstParameter ******/
		/****** md5 signature: 7978a2990234eeb5a0f14eabeba3ec61 ******/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") FirstParameter;
		virtual double FirstParameter();

		/****** Adaptor3d_Curve::GetType ******/
		/****** md5 signature: 657f9e3cbd23a069ca4adcba08a9b196 ******/
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "Return
-------
GeomAbs_CurveType

Description
-----------
Returns the type of the curve in the current interval: Line, Circle, Ellipse, Hyperbola, Parabola, BezierCurve, BSplineCurve, OtherCurve.
") GetType;
		virtual GeomAbs_CurveType GetType();

		/****** Adaptor3d_Curve::Hyperbola ******/
		/****** md5 signature: 087275fe9d7175cc6c5a1b3aff60a964 ******/
		%feature("compactdefaultargs") Hyperbola;
		%feature("autodoc", "Return
-------
gp_Hypr

Description
-----------
No available documentation.
") Hyperbola;
		virtual gp_Hypr Hyperbola();

		/****** Adaptor3d_Curve::Intervals ******/
		/****** md5 signature: 5bb53c7be4eec2188f8b9f9aee984d74 ******/
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

		/****** Adaptor3d_Curve::IsClosed ******/
		/****** md5 signature: 49d9d49cc3fa9662ba5676889922566f ******/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsClosed;
		virtual bool IsClosed();

		/****** Adaptor3d_Curve::IsPeriodic ******/
		/****** md5 signature: daaf449c42d5bb429050710fdc4f02e8 ******/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsPeriodic;
		virtual bool IsPeriodic();

		/****** Adaptor3d_Curve::IsRational ******/
		/****** md5 signature: ae23ebcbf6cc9299758a0f23be96cc0f ******/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsRational;
		virtual bool IsRational();

		/****** Adaptor3d_Curve::LastParameter ******/
		/****** md5 signature: fa3b62031f1b975a2d7e7ebfdd882040 ******/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") LastParameter;
		virtual double LastParameter();

		/****** Adaptor3d_Curve::Line ******/
		/****** md5 signature: 82d4979efdeac0c1d5c97a520a424fe8 ******/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "Return
-------
gp_Lin

Description
-----------
No available documentation.
") Line;
		virtual gp_Lin Line();

		/****** Adaptor3d_Curve::NbIntervals ******/
		/****** md5 signature: e5b7f4ad30a0880e81cced064d6ed4f2 ******/
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

		/****** Adaptor3d_Curve::NbKnots ******/
		/****** md5 signature: cbca6624a247032b6b1950ab6065e8ae ******/
		%feature("compactdefaultargs") NbKnots;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbKnots;
		virtual int NbKnots();

		/****** Adaptor3d_Curve::NbPoles ******/
		/****** md5 signature: bfe8e3100f3c4e3ffe8aae529d870eee ******/
		%feature("compactdefaultargs") NbPoles;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbPoles;
		virtual int NbPoles();

		/****** Adaptor3d_Curve::OffsetCurve ******/
		/****** md5 signature: 655d22f4633348168546c74998986f8b ******/
		%feature("compactdefaultargs") OffsetCurve;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_OffsetCurve>

Description
-----------
No available documentation.
") OffsetCurve;
		virtual opencascade::handle<Geom_OffsetCurve> OffsetCurve();

		/****** Adaptor3d_Curve::Parabola ******/
		/****** md5 signature: 049a76e288b128edd6e69945fe3570cf ******/
		%feature("compactdefaultargs") Parabola;
		%feature("autodoc", "Return
-------
gp_Parab

Description
-----------
No available documentation.
") Parabola;
		virtual gp_Parab Parabola();

		/****** Adaptor3d_Curve::Period ******/
		/****** md5 signature: 7838680e9098dc30bd28a13c225a8304 ******/
		%feature("compactdefaultargs") Period;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") Period;
		virtual double Period();

		/****** Adaptor3d_Curve::Resolution ******/
		/****** md5 signature: 2aced3ff79091a39dec8fd0afd7e22c0 ******/
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
		virtual double Resolution(const double R3d);

		/****** Adaptor3d_Curve::ShallowCopy ******/
		/****** md5 signature: 60c6e7da29991094d97100dbb8a8d321 ******/
		%feature("compactdefaultargs") ShallowCopy;
		%feature("autodoc", "Return
-------
opencascade::handle<Adaptor3d_Curve>

Description
-----------
Shallow copy of adaptor.
") ShallowCopy;
		virtual opencascade::handle<Adaptor3d_Curve> ShallowCopy();

		/****** Adaptor3d_Curve::Trim ******/
		/****** md5 signature: 174861c7d78190d8d92a8048c12f585d ******/
		%feature("compactdefaultargs") Trim;
		%feature("autodoc", "
Parameters
----------
First: double
Last: double
Tol: double

Return
-------
opencascade::handle<Adaptor3d_Curve>

Description
-----------
Returns a curve equivalent of <self> between parameters <First> and <Last>. <Tol> is used to test for 3d points confusion. If <First> >= <Last>.
") Trim;
		virtual opencascade::handle<Adaptor3d_Curve> Trim(const double First, const double Last, const double Tol);

		/****** Adaptor3d_Curve::Value ******/
		/****** md5 signature: fad4da29110a54c71087cb74f60bbdc9 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
theU: double

Return
-------
gp_Pnt

Description
-----------
Computes the point of parameter U on the curve.
") Value;
		gp_Pnt Value(const double theU);

};


%make_alias(Adaptor3d_Curve)

%extend Adaptor3d_Curve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class Adaptor3d_HSurfaceTool *
*******************************/
class Adaptor3d_HSurfaceTool {
	public:
		/****** Adaptor3d_HSurfaceTool::AxeOfRevolution ******/
		/****** md5 signature: 4e3c848c28744e01b507e4ba35d58b75 ******/
		%feature("compactdefaultargs") AxeOfRevolution;
		%feature("autodoc", "
Parameters
----------
theSurf: Adaptor3d_Surface

Return
-------
gp_Ax1

Description
-----------
No available documentation.
") AxeOfRevolution;
		static gp_Ax1 AxeOfRevolution(const opencascade::handle<Adaptor3d_Surface> & theSurf);

		/****** Adaptor3d_HSurfaceTool::BSpline ******/
		/****** md5 signature: b20eee8852543ecba534da56f02ccdf2 ******/
		%feature("compactdefaultargs") BSpline;
		%feature("autodoc", "
Parameters
----------
theSurf: Adaptor3d_Surface

Return
-------
opencascade::handle<Geom_BSplineSurface>

Description
-----------
No available documentation.
") BSpline;
		static opencascade::handle<Geom_BSplineSurface> BSpline(const opencascade::handle<Adaptor3d_Surface> & theSurf);

		/****** Adaptor3d_HSurfaceTool::BasisCurve ******/
		/****** md5 signature: a71b9a72441e0c7b51624acf5d096f74 ******/
		%feature("compactdefaultargs") BasisCurve;
		%feature("autodoc", "
Parameters
----------
theSurf: Adaptor3d_Surface

Return
-------
opencascade::handle<Adaptor3d_Curve>

Description
-----------
No available documentation.
") BasisCurve;
		static opencascade::handle<Adaptor3d_Curve> BasisCurve(const opencascade::handle<Adaptor3d_Surface> & theSurf);

		/****** Adaptor3d_HSurfaceTool::BasisSurface ******/
		/****** md5 signature: 6934a2ceed70d84abf626da742f2ca76 ******/
		%feature("compactdefaultargs") BasisSurface;
		%feature("autodoc", "
Parameters
----------
theSurf: Adaptor3d_Surface

Return
-------
opencascade::handle<Adaptor3d_Surface>

Description
-----------
No available documentation.
") BasisSurface;
		static opencascade::handle<Adaptor3d_Surface> BasisSurface(const opencascade::handle<Adaptor3d_Surface> & theSurf);

		/****** Adaptor3d_HSurfaceTool::Bezier ******/
		/****** md5 signature: ef3b727f4373bb00634a7bd688d5763b ******/
		%feature("compactdefaultargs") Bezier;
		%feature("autodoc", "
Parameters
----------
theSurf: Adaptor3d_Surface

Return
-------
opencascade::handle<Geom_BezierSurface>

Description
-----------
No available documentation.
") Bezier;
		static opencascade::handle<Geom_BezierSurface> Bezier(const opencascade::handle<Adaptor3d_Surface> & theSurf);

		/****** Adaptor3d_HSurfaceTool::Cone ******/
		/****** md5 signature: a89b691d80e2017209b45690348a907f ******/
		%feature("compactdefaultargs") Cone;
		%feature("autodoc", "
Parameters
----------
theSurf: Adaptor3d_Surface

Return
-------
gp_Cone

Description
-----------
No available documentation.
") Cone;
		static gp_Cone Cone(const opencascade::handle<Adaptor3d_Surface> & theSurf);

		/****** Adaptor3d_HSurfaceTool::Cylinder ******/
		/****** md5 signature: 4f2f78ef4d73dcfbb95115cb8f3fa005 ******/
		%feature("compactdefaultargs") Cylinder;
		%feature("autodoc", "
Parameters
----------
theSurf: Adaptor3d_Surface

Return
-------
gp_Cylinder

Description
-----------
No available documentation.
") Cylinder;
		static gp_Cylinder Cylinder(const opencascade::handle<Adaptor3d_Surface> & theSurf);

		/****** Adaptor3d_HSurfaceTool::D0 ******/
		/****** md5 signature: 39181a26370b7e22bbb222eeaa80d7a9 ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
theSurf: Adaptor3d_Surface
theU: double
theV: double
thePnt: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") D0;
		static void D0(const opencascade::handle<Adaptor3d_Surface> & theSurf, const double theU, const double theV, gp_Pnt & thePnt);

		/****** Adaptor3d_HSurfaceTool::D1 ******/
		/****** md5 signature: f3d9d0d48c55b4f828555efb1a20f1aa ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
theSurf: Adaptor3d_Surface
theU: double
theV: double
thePnt: gp_Pnt
theD1U: gp_Vec
theD1V: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") D1;
		static void D1(const opencascade::handle<Adaptor3d_Surface> & theSurf, const double theU, const double theV, gp_Pnt & thePnt, gp_Vec & theD1U, gp_Vec & theD1V);

		/****** Adaptor3d_HSurfaceTool::D2 ******/
		/****** md5 signature: bc28e1eafc37b8316ad797b4c02766a8 ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
theSurf: Adaptor3d_Surface
theU: double
theV: double
thePnt: gp_Pnt
theD1U: gp_Vec
theD1V: gp_Vec
theD2U: gp_Vec
theD2V: gp_Vec
theD2UV: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") D2;
		static void D2(const opencascade::handle<Adaptor3d_Surface> & theSurf, const double theU, const double theV, gp_Pnt & thePnt, gp_Vec & theD1U, gp_Vec & theD1V, gp_Vec & theD2U, gp_Vec & theD2V, gp_Vec & theD2UV);

		/****** Adaptor3d_HSurfaceTool::D3 ******/
		/****** md5 signature: 63c2d5782c738c572fc038b0daa6da3b ******/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "
Parameters
----------
theSurf: Adaptor3d_Surface
theU: double
theV: double
thePnt: gp_Pnt
theD1U: gp_Vec
theD1V: gp_Vec
theD2U: gp_Vec
theD2V: gp_Vec
theD2UV: gp_Vec
theD3U: gp_Vec
theD3V: gp_Vec
theD3UUV: gp_Vec
theD3UVV: gp_Vec

Return
-------
None

Description
-----------
No available documentation.
") D3;
		static void D3(const opencascade::handle<Adaptor3d_Surface> & theSurf, const double theU, const double theV, gp_Pnt & thePnt, gp_Vec & theD1U, gp_Vec & theD1V, gp_Vec & theD2U, gp_Vec & theD2V, gp_Vec & theD2UV, gp_Vec & theD3U, gp_Vec & theD3V, gp_Vec & theD3UUV, gp_Vec & theD3UVV);

		/****** Adaptor3d_HSurfaceTool::DN ******/
		/****** md5 signature: f30ae93569550e4882fb00917b2ad89d ******/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "
Parameters
----------
theSurf: Adaptor3d_Surface
theU: double
theV: double
theNU: int
theNV: int

Return
-------
gp_Vec

Description
-----------
No available documentation.
") DN;
		static gp_Vec DN(const opencascade::handle<Adaptor3d_Surface> & theSurf, const double theU, const double theV, const int theNU, const int theNV);

		/****** Adaptor3d_HSurfaceTool::Direction ******/
		/****** md5 signature: 390f6a317984f3d7d015dcaaccd7ed67 ******/
		%feature("compactdefaultargs") Direction;
		%feature("autodoc", "
Parameters
----------
theSurf: Adaptor3d_Surface

Return
-------
gp_Dir

Description
-----------
No available documentation.
") Direction;
		static gp_Dir Direction(const opencascade::handle<Adaptor3d_Surface> & theSurf);

		/****** Adaptor3d_HSurfaceTool::FirstUParameter ******/
		/****** md5 signature: 89cca62b14ca7939d694c928a72aad0e ******/
		%feature("compactdefaultargs") FirstUParameter;
		%feature("autodoc", "
Parameters
----------
theSurf: Adaptor3d_Surface

Return
-------
double

Description
-----------
No available documentation.
") FirstUParameter;
		static double FirstUParameter(const opencascade::handle<Adaptor3d_Surface> & theSurf);

		/****** Adaptor3d_HSurfaceTool::FirstVParameter ******/
		/****** md5 signature: 6803b005a4ae6c85984057b426b2da58 ******/
		%feature("compactdefaultargs") FirstVParameter;
		%feature("autodoc", "
Parameters
----------
theSurf: Adaptor3d_Surface

Return
-------
double

Description
-----------
No available documentation.
") FirstVParameter;
		static double FirstVParameter(const opencascade::handle<Adaptor3d_Surface> & theSurf);

		/****** Adaptor3d_HSurfaceTool::GetType ******/
		/****** md5 signature: 53f66bf2c621ee9ef4e55ebd8ffafedc ******/
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "
Parameters
----------
theSurf: Adaptor3d_Surface

Return
-------
GeomAbs_SurfaceType

Description
-----------
No available documentation.
") GetType;
		static GeomAbs_SurfaceType GetType(const opencascade::handle<Adaptor3d_Surface> & theSurf);

		/****** Adaptor3d_HSurfaceTool::IsSurfG1 ******/
		/****** md5 signature: 030f0b8bae5eedaa7641fde49f4280c7 ******/
		%feature("compactdefaultargs") IsSurfG1;
		%feature("autodoc", "
Parameters
----------
theSurf: Adaptor3d_Surface
theAlongU: bool
theAngTol: double (optional, default to Precision::Angular())

Return
-------
bool

Description
-----------
No available documentation.
") IsSurfG1;
		static bool IsSurfG1(const opencascade::handle<Adaptor3d_Surface> & theSurf, const bool theAlongU, const double theAngTol = Precision::Angular());

		/****** Adaptor3d_HSurfaceTool::IsUClosed ******/
		/****** md5 signature: f5e79880948e7d27af2027148438d97f ******/
		%feature("compactdefaultargs") IsUClosed;
		%feature("autodoc", "
Parameters
----------
theSurf: Adaptor3d_Surface

Return
-------
bool

Description
-----------
No available documentation.
") IsUClosed;
		static bool IsUClosed(const opencascade::handle<Adaptor3d_Surface> & theSurf);

		/****** Adaptor3d_HSurfaceTool::IsUPeriodic ******/
		/****** md5 signature: 527fad082b192d7ad9502d33aa7098a9 ******/
		%feature("compactdefaultargs") IsUPeriodic;
		%feature("autodoc", "
Parameters
----------
theSurf: Adaptor3d_Surface

Return
-------
bool

Description
-----------
No available documentation.
") IsUPeriodic;
		static bool IsUPeriodic(const opencascade::handle<Adaptor3d_Surface> & theSurf);

		/****** Adaptor3d_HSurfaceTool::IsVClosed ******/
		/****** md5 signature: 91b8548f6a19445b3e0cd7be25c35bb2 ******/
		%feature("compactdefaultargs") IsVClosed;
		%feature("autodoc", "
Parameters
----------
theSurf: Adaptor3d_Surface

Return
-------
bool

Description
-----------
No available documentation.
") IsVClosed;
		static bool IsVClosed(const opencascade::handle<Adaptor3d_Surface> & theSurf);

		/****** Adaptor3d_HSurfaceTool::IsVPeriodic ******/
		/****** md5 signature: ec092a10dd078db8e297d2446a281e43 ******/
		%feature("compactdefaultargs") IsVPeriodic;
		%feature("autodoc", "
Parameters
----------
theSurf: Adaptor3d_Surface

Return
-------
bool

Description
-----------
No available documentation.
") IsVPeriodic;
		static bool IsVPeriodic(const opencascade::handle<Adaptor3d_Surface> & theSurf);

		/****** Adaptor3d_HSurfaceTool::LastUParameter ******/
		/****** md5 signature: fabe251621b4919eb9baaf3178498762 ******/
		%feature("compactdefaultargs") LastUParameter;
		%feature("autodoc", "
Parameters
----------
theSurf: Adaptor3d_Surface

Return
-------
double

Description
-----------
No available documentation.
") LastUParameter;
		static double LastUParameter(const opencascade::handle<Adaptor3d_Surface> & theSurf);

		/****** Adaptor3d_HSurfaceTool::LastVParameter ******/
		/****** md5 signature: 4e807877c6cba6ebf2aafa94077210fb ******/
		%feature("compactdefaultargs") LastVParameter;
		%feature("autodoc", "
Parameters
----------
theSurf: Adaptor3d_Surface

Return
-------
double

Description
-----------
No available documentation.
") LastVParameter;
		static double LastVParameter(const opencascade::handle<Adaptor3d_Surface> & theSurf);

		/****** Adaptor3d_HSurfaceTool::NbSamplesU ******/
		/****** md5 signature: 1ae7b8c18cd74289c60ea9be1659e11a ******/
		%feature("compactdefaultargs") NbSamplesU;
		%feature("autodoc", "
Parameters
----------
S: Adaptor3d_Surface

Return
-------
int

Description
-----------
No available documentation.
") NbSamplesU;
		static int NbSamplesU(const opencascade::handle<Adaptor3d_Surface> & S);

		/****** Adaptor3d_HSurfaceTool::NbSamplesU ******/
		/****** md5 signature: 113907439d309bff36ab3cf1a00b7ae6 ******/
		%feature("compactdefaultargs") NbSamplesU;
		%feature("autodoc", "
Parameters
----------
S: Adaptor3d_Surface
u1: double
u2: double

Return
-------
int

Description
-----------
No available documentation.
") NbSamplesU;
		static int NbSamplesU(const opencascade::handle<Adaptor3d_Surface> & S, const double u1, const double u2);

		/****** Adaptor3d_HSurfaceTool::NbSamplesV ******/
		/****** md5 signature: cc0bde5e974a8eb51f554d4496f64a18 ******/
		%feature("compactdefaultargs") NbSamplesV;
		%feature("autodoc", "
Parameters
----------
S: Adaptor3d_Surface

Return
-------
int

Description
-----------
No available documentation.
") NbSamplesV;
		static int NbSamplesV(const opencascade::handle<Adaptor3d_Surface> & S);

		/****** Adaptor3d_HSurfaceTool::NbSamplesV ******/
		/****** md5 signature: efb03cbd392a18995a0940b8033ed419 ******/
		%feature("compactdefaultargs") NbSamplesV;
		%feature("autodoc", "
Parameters
----------
&: Adaptor3d_Surface
v1: double
v2: double

Return
-------
int

Description
-----------
No available documentation.
") NbSamplesV;
		static int NbSamplesV(const opencascade::handle<Adaptor3d_Surface > &, const double v1, const double v2);

		/****** Adaptor3d_HSurfaceTool::NbUIntervals ******/
		/****** md5 signature: b1bb765895d54b74a58f8092ba96dd8c ******/
		%feature("compactdefaultargs") NbUIntervals;
		%feature("autodoc", "
Parameters
----------
theSurf: Adaptor3d_Surface
theSh: GeomAbs_Shape

Return
-------
int

Description
-----------
No available documentation.
") NbUIntervals;
		static int NbUIntervals(const opencascade::handle<Adaptor3d_Surface> & theSurf, const GeomAbs_Shape theSh);

		/****** Adaptor3d_HSurfaceTool::NbVIntervals ******/
		/****** md5 signature: 596457c5864cdeb7849996b45b131334 ******/
		%feature("compactdefaultargs") NbVIntervals;
		%feature("autodoc", "
Parameters
----------
theSurf: Adaptor3d_Surface
theSh: GeomAbs_Shape

Return
-------
int

Description
-----------
No available documentation.
") NbVIntervals;
		static int NbVIntervals(const opencascade::handle<Adaptor3d_Surface> & theSurf, const GeomAbs_Shape theSh);

		/****** Adaptor3d_HSurfaceTool::OffsetValue ******/
		/****** md5 signature: b1a3ff02828116edca4cb91d98edf6a8 ******/
		%feature("compactdefaultargs") OffsetValue;
		%feature("autodoc", "
Parameters
----------
theSurf: Adaptor3d_Surface

Return
-------
double

Description
-----------
No available documentation.
") OffsetValue;
		static double OffsetValue(const opencascade::handle<Adaptor3d_Surface> & theSurf);

		/****** Adaptor3d_HSurfaceTool::Plane ******/
		/****** md5 signature: 130558349c1c282f4139d902e5e9368f ******/
		%feature("compactdefaultargs") Plane;
		%feature("autodoc", "
Parameters
----------
theSurf: Adaptor3d_Surface

Return
-------
gp_Pln

Description
-----------
No available documentation.
") Plane;
		static gp_Pln Plane(const opencascade::handle<Adaptor3d_Surface> & theSurf);

		/****** Adaptor3d_HSurfaceTool::Sphere ******/
		/****** md5 signature: 65542b788a7978c4d53b85508f7b7b04 ******/
		%feature("compactdefaultargs") Sphere;
		%feature("autodoc", "
Parameters
----------
theSurf: Adaptor3d_Surface

Return
-------
gp_Sphere

Description
-----------
No available documentation.
") Sphere;
		static gp_Sphere Sphere(const opencascade::handle<Adaptor3d_Surface> & theSurf);

		/****** Adaptor3d_HSurfaceTool::Torus ******/
		/****** md5 signature: 501d3c96d8b60d053b3044bf8c2ccc47 ******/
		%feature("compactdefaultargs") Torus;
		%feature("autodoc", "
Parameters
----------
theSurf: Adaptor3d_Surface

Return
-------
gp_Torus

Description
-----------
No available documentation.
") Torus;
		static gp_Torus Torus(const opencascade::handle<Adaptor3d_Surface> & theSurf);

		/****** Adaptor3d_HSurfaceTool::UIntervals ******/
		/****** md5 signature: 3e6e5926729437d93208358f54b5ec30 ******/
		%feature("compactdefaultargs") UIntervals;
		%feature("autodoc", "
Parameters
----------
theSurf: Adaptor3d_Surface
theTab: TColStd_Array1OfReal
theSh: GeomAbs_Shape

Return
-------
None

Description
-----------
No available documentation.
") UIntervals;
		static void UIntervals(const opencascade::handle<Adaptor3d_Surface> & theSurf, TColStd_Array1OfReal & theTab, const GeomAbs_Shape theSh);

		/****** Adaptor3d_HSurfaceTool::UPeriod ******/
		/****** md5 signature: 7127066bac41d91734a287f595385519 ******/
		%feature("compactdefaultargs") UPeriod;
		%feature("autodoc", "
Parameters
----------
theSurf: Adaptor3d_Surface

Return
-------
double

Description
-----------
No available documentation.
") UPeriod;
		static double UPeriod(const opencascade::handle<Adaptor3d_Surface> & theSurf);

		/****** Adaptor3d_HSurfaceTool::UResolution ******/
		/****** md5 signature: ed46410caeb0007ef2302574d5773c59 ******/
		%feature("compactdefaultargs") UResolution;
		%feature("autodoc", "
Parameters
----------
theSurf: Adaptor3d_Surface
theR3d: double

Return
-------
double

Description
-----------
No available documentation.
") UResolution;
		static double UResolution(const opencascade::handle<Adaptor3d_Surface> & theSurf, const double theR3d);

		/****** Adaptor3d_HSurfaceTool::UTrim ******/
		/****** md5 signature: c33fcc1c2073b43cd55819cc80f52e69 ******/
		%feature("compactdefaultargs") UTrim;
		%feature("autodoc", "
Parameters
----------
theSurf: Adaptor3d_Surface
theFirst: double
theLast: double
theTol: double

Return
-------
opencascade::handle<Adaptor3d_Surface>

Description
-----------
If <First> >= <Last>.
") UTrim;
		static opencascade::handle<Adaptor3d_Surface> UTrim(const opencascade::handle<Adaptor3d_Surface> & theSurf, const double theFirst, const double theLast, const double theTol);

		/****** Adaptor3d_HSurfaceTool::VIntervals ******/
		/****** md5 signature: 017ce079512bdee1767dd969197126fa ******/
		%feature("compactdefaultargs") VIntervals;
		%feature("autodoc", "
Parameters
----------
theSurf: Adaptor3d_Surface
theTab: TColStd_Array1OfReal
theSh: GeomAbs_Shape

Return
-------
None

Description
-----------
No available documentation.
") VIntervals;
		static void VIntervals(const opencascade::handle<Adaptor3d_Surface> & theSurf, TColStd_Array1OfReal & theTab, const GeomAbs_Shape theSh);

		/****** Adaptor3d_HSurfaceTool::VPeriod ******/
		/****** md5 signature: c04cb2c1afb48c14ad608dafd7a0515c ******/
		%feature("compactdefaultargs") VPeriod;
		%feature("autodoc", "
Parameters
----------
theSurf: Adaptor3d_Surface

Return
-------
double

Description
-----------
No available documentation.
") VPeriod;
		static double VPeriod(const opencascade::handle<Adaptor3d_Surface> & theSurf);

		/****** Adaptor3d_HSurfaceTool::VResolution ******/
		/****** md5 signature: e2ad87c4a604df3ea5cc1184d2893219 ******/
		%feature("compactdefaultargs") VResolution;
		%feature("autodoc", "
Parameters
----------
theSurf: Adaptor3d_Surface
theR3d: double

Return
-------
double

Description
-----------
No available documentation.
") VResolution;
		static double VResolution(const opencascade::handle<Adaptor3d_Surface> & theSurf, const double theR3d);

		/****** Adaptor3d_HSurfaceTool::VTrim ******/
		/****** md5 signature: f407453964457bc575ba00b3a58d76aa ******/
		%feature("compactdefaultargs") VTrim;
		%feature("autodoc", "
Parameters
----------
theSurf: Adaptor3d_Surface
theFirst: double
theLast: double
theTol: double

Return
-------
opencascade::handle<Adaptor3d_Surface>

Description
-----------
If <First> >= <Last>.
") VTrim;
		static opencascade::handle<Adaptor3d_Surface> VTrim(const opencascade::handle<Adaptor3d_Surface> & theSurf, const double theFirst, const double theLast, const double theTol);

		/****** Adaptor3d_HSurfaceTool::Value ******/
		/****** md5 signature: 5d38ff99049d935ba67ce3cf536175ef ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
theSurf: Adaptor3d_Surface
theU: double
theV: double

Return
-------
gp_Pnt

Description
-----------
No available documentation.
") Value;
		static gp_Pnt Value(const opencascade::handle<Adaptor3d_Surface> & theSurf, const double theU, const double theV);

};


%extend Adaptor3d_HSurfaceTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class Adaptor3d_HVertex *
**************************/
class Adaptor3d_HVertex : public Standard_Transient {
	public:
		/****** Adaptor3d_HVertex::Adaptor3d_HVertex ******/
		/****** md5 signature: eac58a1b58e0ece2155add6b7d6c9250 ******/
		%feature("compactdefaultargs") Adaptor3d_HVertex;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Adaptor3d_HVertex;
		 Adaptor3d_HVertex();

		/****** Adaptor3d_HVertex::Adaptor3d_HVertex ******/
		/****** md5 signature: 3b25f95bcb483fa378b13bd7ae7e7e89 ******/
		%feature("compactdefaultargs") Adaptor3d_HVertex;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt2d
Ori: TopAbs_Orientation
Resolution: double

Return
-------
None

Description
-----------
No available documentation.
") Adaptor3d_HVertex;
		 Adaptor3d_HVertex(const gp_Pnt2d & P, const TopAbs_Orientation Ori, const double Resolution);

		/****** Adaptor3d_HVertex::IsSame ******/
		/****** md5 signature: 3e6883ded84326cb1a90b8750be2350c ******/
		%feature("compactdefaultargs") IsSame;
		%feature("autodoc", "
Parameters
----------
Other: Adaptor3d_HVertex

Return
-------
bool

Description
-----------
No available documentation.
") IsSame;
		virtual bool IsSame(const opencascade::handle<Adaptor3d_HVertex> & Other);

		/****** Adaptor3d_HVertex::Orientation ******/
		/****** md5 signature: c985680b482f7598ebf61ff3db6ab594 ******/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "Return
-------
TopAbs_Orientation

Description
-----------
No available documentation.
") Orientation;
		virtual TopAbs_Orientation Orientation();

		/****** Adaptor3d_HVertex::Parameter ******/
		/****** md5 signature: 9fd9fdb3eda16f9ec5bcc2e2b545c744 ******/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d

Return
-------
double

Description
-----------
No available documentation.
") Parameter;
		virtual double Parameter(const opencascade::handle<Adaptor2d_Curve2d> & C);

		/****** Adaptor3d_HVertex::Resolution ******/
		/****** md5 signature: b80171e06894eb3cd5fbc71b96da0a44 ******/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d

Return
-------
double

Description
-----------
Parametric resolution (2d).
") Resolution;
		virtual double Resolution(const opencascade::handle<Adaptor2d_Curve2d> & C);

		/****** Adaptor3d_HVertex::Value ******/
		/****** md5 signature: b163ee7405059c08236e9641cb63201d ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
gp_Pnt2d

Description
-----------
No available documentation.
") Value;
		virtual gp_Pnt2d Value();

};


%make_alias(Adaptor3d_HVertex)

%extend Adaptor3d_HVertex {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class Adaptor3d_InterFunc *
****************************/
class Adaptor3d_InterFunc : public math_FunctionWithDerivative {
	public:
		/****** Adaptor3d_InterFunc::Adaptor3d_InterFunc ******/
		/****** md5 signature: cf13ca5f0e9e6cd3e443a5f8f524cf5c ******/
		%feature("compactdefaultargs") Adaptor3d_InterFunc;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d
FixVal: double
Fix: int

Return
-------
None

Description
-----------
build the function U(t)=FixVal if Fix =1 or V(t)=FixVal if Fix=2.
") Adaptor3d_InterFunc;
		 Adaptor3d_InterFunc(const opencascade::handle<Adaptor2d_Curve2d> & C, const double FixVal, const int Fix);

		/****** Adaptor3d_InterFunc::Derivative ******/
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

		/****** Adaptor3d_InterFunc::Value ******/
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

		/****** Adaptor3d_InterFunc::Values ******/
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


%extend Adaptor3d_InterFunc {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class Adaptor3d_Surface *
**************************/
class Adaptor3d_Surface : public Standard_Transient {
	public:
		/****** Adaptor3d_Surface::AxeOfRevolution ******/
		/****** md5 signature: 3debc8f77289017ebe3fc26c5b0a7fde ******/
		%feature("compactdefaultargs") AxeOfRevolution;
		%feature("autodoc", "Return
-------
gp_Ax1

Description
-----------
No available documentation.
") AxeOfRevolution;
		virtual gp_Ax1 AxeOfRevolution();

		/****** Adaptor3d_Surface::BSpline ******/
		/****** md5 signature: 8782849eb7b84189e1fb34c968aef438 ******/
		%feature("compactdefaultargs") BSpline;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_BSplineSurface>

Description
-----------
No available documentation.
") BSpline;
		virtual opencascade::handle<Geom_BSplineSurface> BSpline();

		/****** Adaptor3d_Surface::BasisCurve ******/
		/****** md5 signature: 99c15a8a36ba096c01e3a30ab92fff44 ******/
		%feature("compactdefaultargs") BasisCurve;
		%feature("autodoc", "Return
-------
opencascade::handle<Adaptor3d_Curve>

Description
-----------
No available documentation.
") BasisCurve;
		virtual opencascade::handle<Adaptor3d_Curve> BasisCurve();

		/****** Adaptor3d_Surface::BasisSurface ******/
		/****** md5 signature: 530983a0f32601b5771bf2a2dc2ae5d1 ******/
		%feature("compactdefaultargs") BasisSurface;
		%feature("autodoc", "Return
-------
opencascade::handle<Adaptor3d_Surface>

Description
-----------
No available documentation.
") BasisSurface;
		virtual opencascade::handle<Adaptor3d_Surface> BasisSurface();

		/****** Adaptor3d_Surface::Bezier ******/
		/****** md5 signature: 46959653edaff049efd779790fb904a6 ******/
		%feature("compactdefaultargs") Bezier;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_BezierSurface>

Description
-----------
No available documentation.
") Bezier;
		virtual opencascade::handle<Geom_BezierSurface> Bezier();

		/****** Adaptor3d_Surface::Cone ******/
		/****** md5 signature: b31d0ac73f9470a65ea707968772eae6 ******/
		%feature("compactdefaultargs") Cone;
		%feature("autodoc", "Return
-------
gp_Cone

Description
-----------
No available documentation.
") Cone;
		virtual gp_Cone Cone();

		/****** Adaptor3d_Surface::Cylinder ******/
		/****** md5 signature: a4f845f2a6611b82f64b6852242a95c6 ******/
		%feature("compactdefaultargs") Cylinder;
		%feature("autodoc", "Return
-------
gp_Cylinder

Description
-----------
No available documentation.
") Cylinder;
		virtual gp_Cylinder Cylinder();

		/****** Adaptor3d_Surface::D0 ******/
		/****** md5 signature: 9016df837eb6bfdd1935679a87e2c49d ******/
		%feature("compactdefaultargs") D0;
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
Computes the point of parameters U,V on the surface.
") D0;
		void D0(const double theU, const double theV, gp_Pnt & theP);

		/****** Adaptor3d_Surface::D1 ******/
		/****** md5 signature: a0a06d84188e852df7219bd30627e2e5 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
theU: double
theV: double
theP: gp_Pnt
theD1U: gp_Vec
theD1V: gp_Vec

Return
-------
None

Description
-----------
Computes the point and the first derivatives on the surface. Raised if the continuity of the current intervals is not C1. //! Tip: use GeomLib::NormEstim() to calculate surface normal at specified (U, V) point.
") D1;
		void D1(const double theU, const double theV, gp_Pnt & theP, gp_Vec & theD1U, gp_Vec & theD1V);

		/****** Adaptor3d_Surface::D2 ******/
		/****** md5 signature: 76e8d1743bf45a8bd799b1720c6e0a4f ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
theU: double
theV: double
theP: gp_Pnt
theD1U: gp_Vec
theD1V: gp_Vec
theD2U: gp_Vec
theD2V: gp_Vec
theD2UV: gp_Vec

Return
-------
None

Description
-----------
Computes the point, the first and second derivatives on the surface. Raised if the continuity of the current intervals is not C2.
") D2;
		void D2(const double theU, const double theV, gp_Pnt & theP, gp_Vec & theD1U, gp_Vec & theD1V, gp_Vec & theD2U, gp_Vec & theD2V, gp_Vec & theD2UV);

		/****** Adaptor3d_Surface::D3 ******/
		/****** md5 signature: 5315e02fec0ca74d5deca8b9d8ce50e3 ******/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "
Parameters
----------
theU: double
theV: double
theP: gp_Pnt
theD1U: gp_Vec
theD1V: gp_Vec
theD2U: gp_Vec
theD2V: gp_Vec
theD2UV: gp_Vec
theD3U: gp_Vec
theD3V: gp_Vec
theD3UUV: gp_Vec
theD3UVV: gp_Vec

Return
-------
None

Description
-----------
Computes the point, the first, second and third derivatives on the surface. Raised if the continuity of the current intervals is not C3.
") D3;
		void D3(const double theU, const double theV, gp_Pnt & theP, gp_Vec & theD1U, gp_Vec & theD1V, gp_Vec & theD2U, gp_Vec & theD2V, gp_Vec & theD2UV, gp_Vec & theD3U, gp_Vec & theD3V, gp_Vec & theD3UUV, gp_Vec & theD3UVV);

		/****** Adaptor3d_Surface::DN ******/
		/****** md5 signature: 3f149ee32df79dc2701e24bf0a9869e5 ******/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "
Parameters
----------
theU: double
theV: double
theNu: int
theNv: int

Return
-------
gp_Vec

Description
-----------
Computes the derivative of order Nu in the direction U and Nv in the direction V at the point P(U, V). Raised if the current U interval is not not CNu and the current V interval is not CNv. Raised if Nu + Nv < 1 or Nu < 0 or Nv < 0.
") DN;
		gp_Vec DN(const double theU, const double theV, const int theNu, const int theNv);

		/****** Adaptor3d_Surface::Direction ******/
		/****** md5 signature: 50eb80ad6a4d551e2cfbf73fe32bbfa8 ******/
		%feature("compactdefaultargs") Direction;
		%feature("autodoc", "Return
-------
gp_Dir

Description
-----------
No available documentation.
") Direction;
		virtual gp_Dir Direction();

		/****** Adaptor3d_Surface::EvalD0 ******/
		/****** md5 signature: 3ca37d1f8ccc83ecb2a746b0783aee8b ******/
		%feature("compactdefaultargs") EvalD0;
		%feature("autodoc", "
Parameters
----------
theU: double
theV: double

Return
-------
gp_Pnt

Description
-----------
Computes the point of parameters (U, V) on the surface. Raises an exception on failure.
") EvalD0;
		virtual gp_Pnt EvalD0(const double theU, const double theV);

		/****** Adaptor3d_Surface::EvalD1 ******/
		/****** md5 signature: 85ab5b293f96ca2f425cdcbdcefddb1f ******/
		%feature("compactdefaultargs") EvalD1;
		%feature("autodoc", "
Parameters
----------
theU: double
theV: double

Return
-------
Geom_Surface::ResD1

Description
-----------
Computes the point and first partial derivatives at (U, V). Raises an exception on failure.
") EvalD1;
		virtual Geom_Surface::ResD1 EvalD1(const double theU, const double theV);

		/****** Adaptor3d_Surface::EvalD2 ******/
		/****** md5 signature: 226c394cf3fc3c55ef4a22445a653787 ******/
		%feature("compactdefaultargs") EvalD2;
		%feature("autodoc", "
Parameters
----------
theU: double
theV: double

Return
-------
Geom_Surface::ResD2

Description
-----------
Computes the point and partial derivatives up to 2nd order at (U, V). Raises an exception on failure.
") EvalD2;
		virtual Geom_Surface::ResD2 EvalD2(const double theU, const double theV);

		/****** Adaptor3d_Surface::EvalD3 ******/
		/****** md5 signature: 9c8730e098f1bbe4b9c71be229e872b6 ******/
		%feature("compactdefaultargs") EvalD3;
		%feature("autodoc", "
Parameters
----------
theU: double
theV: double

Return
-------
Geom_Surface::ResD3

Description
-----------
Computes the point and partial derivatives up to 3rd order at (U, V). Raises an exception on failure.
") EvalD3;
		virtual Geom_Surface::ResD3 EvalD3(const double theU, const double theV);

		/****** Adaptor3d_Surface::EvalDN ******/
		/****** md5 signature: 7af0a7e90c71663540785483b99303a7 ******/
		%feature("compactdefaultargs") EvalDN;
		%feature("autodoc", "
Parameters
----------
theU: double
theV: double
theNu: int
theNv: int

Return
-------
gp_Vec

Description
-----------
Computes the derivative of order Nu in U and Nv in V at (U, V). Raises an exception on failure.
") EvalDN;
		virtual gp_Vec EvalDN(const double theU, const double theV, const int theNu, const int theNv);

		/****** Adaptor3d_Surface::FirstUParameter ******/
		/****** md5 signature: da182ccb2dd28f008dc1bac47b8868e8 ******/
		%feature("compactdefaultargs") FirstUParameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") FirstUParameter;
		virtual double FirstUParameter();

		/****** Adaptor3d_Surface::FirstVParameter ******/
		/****** md5 signature: 1cf4940cba7359dc8d4d6c24069a24ae ******/
		%feature("compactdefaultargs") FirstVParameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") FirstVParameter;
		virtual double FirstVParameter();

		/****** Adaptor3d_Surface::GetType ******/
		/****** md5 signature: 488899158a40114032119920bcbe6d69 ******/
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "Return
-------
GeomAbs_SurfaceType

Description
-----------
Returns the type of the surface: Plane, Cylinder, Cone, Sphere, Torus, BezierSurface, BSplineSurface, SurfaceOfRevolution, SurfaceOfExtrusion, OtherSurface.
") GetType;
		virtual GeomAbs_SurfaceType GetType();

		/****** Adaptor3d_Surface::IsUClosed ******/
		/****** md5 signature: 4eb6045d6362176a343f20aabd39c703 ******/
		%feature("compactdefaultargs") IsUClosed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsUClosed;
		virtual bool IsUClosed();

		/****** Adaptor3d_Surface::IsUPeriodic ******/
		/****** md5 signature: 829359e87bda18f602e915ab5a0228d9 ******/
		%feature("compactdefaultargs") IsUPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsUPeriodic;
		virtual bool IsUPeriodic();

		/****** Adaptor3d_Surface::IsURational ******/
		/****** md5 signature: e831f2949990a6c76e46104762ecb264 ******/
		%feature("compactdefaultargs") IsURational;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsURational;
		virtual bool IsURational();

		/****** Adaptor3d_Surface::IsVClosed ******/
		/****** md5 signature: 418046ad5087d7926a96030755bbc092 ******/
		%feature("compactdefaultargs") IsVClosed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsVClosed;
		virtual bool IsVClosed();

		/****** Adaptor3d_Surface::IsVPeriodic ******/
		/****** md5 signature: ee75c4e0c0cae5f017aa3513efdc994f ******/
		%feature("compactdefaultargs") IsVPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsVPeriodic;
		virtual bool IsVPeriodic();

		/****** Adaptor3d_Surface::IsVRational ******/
		/****** md5 signature: 034c2baea0ccab39ccbc8824ac4d3703 ******/
		%feature("compactdefaultargs") IsVRational;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsVRational;
		virtual bool IsVRational();

		/****** Adaptor3d_Surface::LastUParameter ******/
		/****** md5 signature: 02c47ef09effa31026d9ccd10ef0b586 ******/
		%feature("compactdefaultargs") LastUParameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") LastUParameter;
		virtual double LastUParameter();

		/****** Adaptor3d_Surface::LastVParameter ******/
		/****** md5 signature: b875c8f9dd2888f4f828f82510d9b113 ******/
		%feature("compactdefaultargs") LastVParameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") LastVParameter;
		virtual double LastVParameter();

		/****** Adaptor3d_Surface::NbUIntervals ******/
		/****** md5 signature: cda7f180282a20c6d145b7e87268248a ******/
		%feature("compactdefaultargs") NbUIntervals;
		%feature("autodoc", "
Parameters
----------
S: GeomAbs_Shape

Return
-------
int

Description
-----------
Returns the number of U intervals for continuity <S>. May be one if UContinuity(me) >= <S>.
") NbUIntervals;
		virtual int NbUIntervals(const GeomAbs_Shape S);

		/****** Adaptor3d_Surface::NbUKnots ******/
		/****** md5 signature: 808f8c456aaa8fdb434927c7f2974636 ******/
		%feature("compactdefaultargs") NbUKnots;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbUKnots;
		virtual int NbUKnots();

		/****** Adaptor3d_Surface::NbUPoles ******/
		/****** md5 signature: 399f9d8112bacb42780fd34854c4734f ******/
		%feature("compactdefaultargs") NbUPoles;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbUPoles;
		virtual int NbUPoles();

		/****** Adaptor3d_Surface::NbVIntervals ******/
		/****** md5 signature: e99c1a370576157e9dea9a89f5723959 ******/
		%feature("compactdefaultargs") NbVIntervals;
		%feature("autodoc", "
Parameters
----------
S: GeomAbs_Shape

Return
-------
int

Description
-----------
Returns the number of V intervals for continuity <S>. May be one if VContinuity(me) >= <S>.
") NbVIntervals;
		virtual int NbVIntervals(const GeomAbs_Shape S);

		/****** Adaptor3d_Surface::NbVKnots ******/
		/****** md5 signature: 470d1c89a20ac4d9d0570283b249445b ******/
		%feature("compactdefaultargs") NbVKnots;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbVKnots;
		virtual int NbVKnots();

		/****** Adaptor3d_Surface::NbVPoles ******/
		/****** md5 signature: 22771c7321cb09bc85c4767f32c2f6e6 ******/
		%feature("compactdefaultargs") NbVPoles;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbVPoles;
		virtual int NbVPoles();

		/****** Adaptor3d_Surface::OffsetValue ******/
		/****** md5 signature: f1e5de2d27936b266603223448fcaec0 ******/
		%feature("compactdefaultargs") OffsetValue;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") OffsetValue;
		virtual double OffsetValue();

		/****** Adaptor3d_Surface::Plane ******/
		/****** md5 signature: ae2ef8a7cc00a3678c001f660e5e87af ******/
		%feature("compactdefaultargs") Plane;
		%feature("autodoc", "Return
-------
gp_Pln

Description
-----------
No available documentation.
") Plane;
		virtual gp_Pln Plane();

		/****** Adaptor3d_Surface::ShallowCopy ******/
		/****** md5 signature: 2c40a5f136e5a824520c885db1d4fa77 ******/
		%feature("compactdefaultargs") ShallowCopy;
		%feature("autodoc", "Return
-------
opencascade::handle<Adaptor3d_Surface>

Description
-----------
Shallow copy of adaptor.
") ShallowCopy;
		virtual opencascade::handle<Adaptor3d_Surface> ShallowCopy();

		/****** Adaptor3d_Surface::Sphere ******/
		/****** md5 signature: cc119d9c2d6769252e8f267250b5802d ******/
		%feature("compactdefaultargs") Sphere;
		%feature("autodoc", "Return
-------
gp_Sphere

Description
-----------
No available documentation.
") Sphere;
		virtual gp_Sphere Sphere();

		/****** Adaptor3d_Surface::Torus ******/
		/****** md5 signature: d9bc77c59c8537a8319376aa7df09ccd ******/
		%feature("compactdefaultargs") Torus;
		%feature("autodoc", "Return
-------
gp_Torus

Description
-----------
No available documentation.
") Torus;
		virtual gp_Torus Torus();

		/****** Adaptor3d_Surface::UContinuity ******/
		/****** md5 signature: 77ad7bb6fa9eb6fee5117117dc1ac55d ******/
		%feature("compactdefaultargs") UContinuity;
		%feature("autodoc", "Return
-------
GeomAbs_Shape

Description
-----------
No available documentation.
") UContinuity;
		virtual GeomAbs_Shape UContinuity();

		/****** Adaptor3d_Surface::UDegree ******/
		/****** md5 signature: 8eb4f38f4fd1e68fb9ccf89d71aa1bf3 ******/
		%feature("compactdefaultargs") UDegree;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") UDegree;
		virtual int UDegree();

		/****** Adaptor3d_Surface::UIntervals ******/
		/****** md5 signature: f31c310cff6e18b57a42c1cafb8ebcf1 ******/
		%feature("compactdefaultargs") UIntervals;
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
Returns the intervals with the requested continuity in the U direction.
") UIntervals;
		virtual void UIntervals(TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****** Adaptor3d_Surface::UPeriod ******/
		/****** md5 signature: da114fd3a2d26886e0b27128e1d80a77 ******/
		%feature("compactdefaultargs") UPeriod;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") UPeriod;
		virtual double UPeriod();

		/****** Adaptor3d_Surface::UResolution ******/
		/****** md5 signature: 2ef9cbce43eb796ebed6ac0bb3560fca ******/
		%feature("compactdefaultargs") UResolution;
		%feature("autodoc", "
Parameters
----------
R3d: double

Return
-------
double

Description
-----------
Returns the parametric U resolution corresponding to the real space resolution <R3d>.
") UResolution;
		virtual double UResolution(const double R3d);

		/****** Adaptor3d_Surface::UTrim ******/
		/****** md5 signature: 6693b340cdd84d34a9b55237eb327b21 ******/
		%feature("compactdefaultargs") UTrim;
		%feature("autodoc", "
Parameters
----------
First: double
Last: double
Tol: double

Return
-------
opencascade::handle<Adaptor3d_Surface>

Description
-----------
Returns a surface trimmed in the U direction equivalent of <self> between parameters <First> and <Last>. <Tol> is used to test for 3d points confusion. If <First> >= <Last>.
") UTrim;
		virtual opencascade::handle<Adaptor3d_Surface> UTrim(const double First, const double Last, const double Tol);

		/****** Adaptor3d_Surface::VContinuity ******/
		/****** md5 signature: d072bc9a7996d58b53b4d1e10a7f1999 ******/
		%feature("compactdefaultargs") VContinuity;
		%feature("autodoc", "Return
-------
GeomAbs_Shape

Description
-----------
No available documentation.
") VContinuity;
		virtual GeomAbs_Shape VContinuity();

		/****** Adaptor3d_Surface::VDegree ******/
		/****** md5 signature: 035403fd9b2ccd2bb977e3be0622a714 ******/
		%feature("compactdefaultargs") VDegree;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") VDegree;
		virtual int VDegree();

		/****** Adaptor3d_Surface::VIntervals ******/
		/****** md5 signature: 2d2738ec2952cc80c4d4039ac6f7047e ******/
		%feature("compactdefaultargs") VIntervals;
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
Returns the intervals with the requested continuity in the V direction.
") VIntervals;
		virtual void VIntervals(TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****** Adaptor3d_Surface::VPeriod ******/
		/****** md5 signature: e86089463b2a89664feb779cfe8eac35 ******/
		%feature("compactdefaultargs") VPeriod;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") VPeriod;
		virtual double VPeriod();

		/****** Adaptor3d_Surface::VResolution ******/
		/****** md5 signature: 869488b87ffe670839eface406fb8ceb ******/
		%feature("compactdefaultargs") VResolution;
		%feature("autodoc", "
Parameters
----------
R3d: double

Return
-------
double

Description
-----------
Returns the parametric V resolution corresponding to the real space resolution <R3d>.
") VResolution;
		virtual double VResolution(const double R3d);

		/****** Adaptor3d_Surface::VTrim ******/
		/****** md5 signature: 3cf7c2e715f5d7f0c5c19e8f7e0fabe7 ******/
		%feature("compactdefaultargs") VTrim;
		%feature("autodoc", "
Parameters
----------
First: double
Last: double
Tol: double

Return
-------
opencascade::handle<Adaptor3d_Surface>

Description
-----------
Returns a surface trimmed in the V direction between parameters <First> and <Last>. <Tol> is used to test for 3d points confusion. If <First> >= <Last>.
") VTrim;
		virtual opencascade::handle<Adaptor3d_Surface> VTrim(const double First, const double Last, const double Tol);

		/****** Adaptor3d_Surface::Value ******/
		/****** md5 signature: 88a3852ba2d591aad12986a6b5f8b26e ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
theU: double
theV: double

Return
-------
gp_Pnt

Description
-----------
Computes the point of parameters U,V on the surface. Tip: use GeomLib::NormEstim() to calculate surface normal at specified (U, V) point.
") Value;
		gp_Pnt Value(const double theU, const double theV);

};


%make_alias(Adaptor3d_Surface)

%extend Adaptor3d_Surface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class Adaptor3d_TopolTool *
****************************/
class Adaptor3d_TopolTool : public Standard_Transient {
	public:
		/****** Adaptor3d_TopolTool::Adaptor3d_TopolTool ******/
		/****** md5 signature: aa825ed0136d2875577bee7eaf4b157c ******/
		%feature("compactdefaultargs") Adaptor3d_TopolTool;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Adaptor3d_TopolTool;
		 Adaptor3d_TopolTool();

		/****** Adaptor3d_TopolTool::Adaptor3d_TopolTool ******/
		/****** md5 signature: ab0a135902966159ae926769ffdb7052 ******/
		%feature("compactdefaultargs") Adaptor3d_TopolTool;
		%feature("autodoc", "
Parameters
----------
Surface: Adaptor3d_Surface

Return
-------
None

Description
-----------
No available documentation.
") Adaptor3d_TopolTool;
		 Adaptor3d_TopolTool(const opencascade::handle<Adaptor3d_Surface> & Surface);

		/****** Adaptor3d_TopolTool::BSplSamplePnts ******/
		/****** md5 signature: 39c1c283b1f2a975fc09df4ecaa00a55 ******/
		%feature("compactdefaultargs") BSplSamplePnts;
		%feature("autodoc", "
Parameters
----------
theDefl: double
theNUmin: int
theNVmin: int

Return
-------
None

Description
-----------
Compute the sample-points for the intersections algorithms by adaptive algorithm for BSpline surfaces - is used in SamplePnts 
Input parameter: theDefl required deflection 
Input parameter: theNUmin minimal nb points for U 
Input parameter: theNVmin minimal nb points for V.
") BSplSamplePnts;
		virtual void BSplSamplePnts(const double theDefl, const int theNUmin, const int theNVmin);

		/****** Adaptor3d_TopolTool::Classify ******/
		/****** md5 signature: df1f1ddc6801f5a84106cb971806352f ******/
		%feature("compactdefaultargs") Classify;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt2d
Tol: double
ReacdreOnPeriodic: bool (optional, default to true)

Return
-------
TopAbs_State

Description
-----------
No available documentation.
") Classify;
		virtual TopAbs_State Classify(const gp_Pnt2d & P, const double Tol, const bool ReacdreOnPeriodic = true);

		/****** Adaptor3d_TopolTool::ComputeSamplePoints ******/
		/****** md5 signature: 23fc57af64fa6b59fefe18fa9084fa69 ******/
		%feature("compactdefaultargs") ComputeSamplePoints;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") ComputeSamplePoints;
		virtual void ComputeSamplePoints();

		/****** Adaptor3d_TopolTool::DomainIsInfinite ******/
		/****** md5 signature: 288af4c625fbfbca424d011fcf2618a3 ******/
		%feature("compactdefaultargs") DomainIsInfinite;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") DomainIsInfinite;
		virtual bool DomainIsInfinite();

		/****** Adaptor3d_TopolTool::Edge ******/
		/****** md5 signature: d0134fbb8433575ae46f37dd47df601c ******/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "Return
-------
void *

Description
-----------
No available documentation.
") Edge;
		virtual void * Edge();

		/****** Adaptor3d_TopolTool::GetConeApexParam ******/
		/****** md5 signature: 1c7e4cbee67d4312f9995d62e953d13a ******/
		%feature("compactdefaultargs") GetConeApexParam;
		%feature("autodoc", "
Parameters
----------
theC: gp_Cone

Return
-------
theU: double
theV: double

Description
-----------
Computes the cone's apex parameters. 
Input parameter: theC conical surface 
Input parameter: theU U parameter of cone's apex 
Input parameter: theV V parameter of cone's apex.
") GetConeApexParam;
		static void GetConeApexParam(const gp_Cone & theC, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** Adaptor3d_TopolTool::Has3d ******/
		/****** md5 signature: c17f33a5db05d6b61035a034298e7bf6 ******/
		%feature("compactdefaultargs") Has3d;
		%feature("autodoc", "Return
-------
bool

Description
-----------
answers if arcs and vertices may have 3d representations, so that we could use Tol3d and Pnt methods.
") Has3d;
		virtual bool Has3d();

		/****** Adaptor3d_TopolTool::Identical ******/
		/****** md5 signature: 284d5812bb53de07e239efcee16563ed ******/
		%feature("compactdefaultargs") Identical;
		%feature("autodoc", "
Parameters
----------
V1: Adaptor3d_HVertex
V2: Adaptor3d_HVertex

Return
-------
bool

Description
-----------
Returns True if the vertices V1 and V2 are identical. This method does not take the orientation of the vertices in account.
") Identical;
		virtual bool Identical(const opencascade::handle<Adaptor3d_HVertex> & V1, const opencascade::handle<Adaptor3d_HVertex> & V2);

		/****** Adaptor3d_TopolTool::Init ******/
		/****** md5 signature: 2f96d79a31287a19717a3642c1e9b28c ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Init;
		virtual void Init();

		/****** Adaptor3d_TopolTool::InitVertexIterator ******/
		/****** md5 signature: 30be0f0057566eace0f6ff06b5235ec5 ******/
		%feature("compactdefaultargs") InitVertexIterator;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") InitVertexIterator;
		virtual void InitVertexIterator();

		/****** Adaptor3d_TopolTool::Initialize ******/
		/****** md5 signature: 6a5837327bc1f6a299aa49b49efb0b51 ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Initialize;
		virtual void Initialize();

		/****** Adaptor3d_TopolTool::Initialize ******/
		/****** md5 signature: faffacbbf54c7a186e23fb682d81e648 ******/
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
No available documentation.
") Initialize;
		virtual void Initialize(const opencascade::handle<Adaptor3d_Surface> & S);

		/****** Adaptor3d_TopolTool::Initialize ******/
		/****** md5 signature: 20b22aee7c221a24f9ddddb5f04f3ad2 ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
Curve: Adaptor2d_Curve2d

Return
-------
None

Description
-----------
No available documentation.
") Initialize;
		virtual void Initialize(const opencascade::handle<Adaptor2d_Curve2d> & Curve);

		/****** Adaptor3d_TopolTool::IsThePointOn ******/
		/****** md5 signature: 72ca97359436cd32933a7ef867e70356 ******/
		%feature("compactdefaultargs") IsThePointOn;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt2d
Tol: double
ReacdreOnPeriodic: bool (optional, default to true)

Return
-------
bool

Description
-----------
No available documentation.
") IsThePointOn;
		virtual bool IsThePointOn(const gp_Pnt2d & P, const double Tol, const bool ReacdreOnPeriodic = true);

		/****** Adaptor3d_TopolTool::IsUniformSampling ******/
		/****** md5 signature: 131f5867ad521b95d4baecee4859d3fa ******/
		%feature("compactdefaultargs") IsUniformSampling;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if provide uniform sampling of points.
") IsUniformSampling;
		virtual bool IsUniformSampling();

		/****** Adaptor3d_TopolTool::More ******/
		/****** md5 signature: ff2fad120b638dfdb2459ba5adb1d9c4 ******/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") More;
		virtual bool More();

		/****** Adaptor3d_TopolTool::MoreVertex ******/
		/****** md5 signature: b53808cee905091847d8368168640b6c ******/
		%feature("compactdefaultargs") MoreVertex;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") MoreVertex;
		virtual bool MoreVertex();

		/****** Adaptor3d_TopolTool::NbSamples ******/
		/****** md5 signature: 60494d7c2a383e405b3a1f7b515f286a ******/
		%feature("compactdefaultargs") NbSamples;
		%feature("autodoc", "Return
-------
int

Description
-----------
compute the sample-points for the intersections algorithms.
") NbSamples;
		virtual int NbSamples();

		/****** Adaptor3d_TopolTool::NbSamplesU ******/
		/****** md5 signature: 0b17e4700daafacf1ba7055d0593bcd2 ******/
		%feature("compactdefaultargs") NbSamplesU;
		%feature("autodoc", "Return
-------
int

Description
-----------
compute the sample-points for the intersections algorithms.
") NbSamplesU;
		virtual int NbSamplesU();

		/****** Adaptor3d_TopolTool::NbSamplesV ******/
		/****** md5 signature: bbd3c236cab8669846ff6a7d6577a27d ******/
		%feature("compactdefaultargs") NbSamplesV;
		%feature("autodoc", "Return
-------
int

Description
-----------
compute the sample-points for the intersections algorithms.
") NbSamplesV;
		virtual int NbSamplesV();

		/****** Adaptor3d_TopolTool::Next ******/
		/****** md5 signature: 73141d627b33e5b89ace1d498cedfc52 ******/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Next;
		virtual void Next();

		/****** Adaptor3d_TopolTool::NextVertex ******/
		/****** md5 signature: 965ea8fa3abffe2964338c5b0ad5701c ******/
		%feature("compactdefaultargs") NextVertex;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") NextVertex;
		virtual void NextVertex();

		/****** Adaptor3d_TopolTool::Orientation ******/
		/****** md5 signature: 2ec1f29b131dd0ba8f7295bc408c863d ******/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d

Return
-------
TopAbs_Orientation

Description
-----------
If the function returns the orientation of the arc. If the orientation is FORWARD or REVERSED, the arc is a 'real' limit of the surface. If the orientation is INTERNAL or EXTERNAL, the arc is considered as an arc on the surface.
") Orientation;
		virtual TopAbs_Orientation Orientation(const opencascade::handle<Adaptor2d_Curve2d> & C);

		/****** Adaptor3d_TopolTool::Orientation ******/
		/****** md5 signature: b97399854b9802139edc16aa1fd0c067 ******/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "
Parameters
----------
V: Adaptor3d_HVertex

Return
-------
TopAbs_Orientation

Description
-----------
Returns the orientation of the vertex V. The vertex has been found with an exploration on a given arc. The orientation is the orientation of the vertex on this arc.
") Orientation;
		virtual TopAbs_Orientation Orientation(const opencascade::handle<Adaptor3d_HVertex> & V);

		/****** Adaptor3d_TopolTool::Pnt ******/
		/****** md5 signature: f39649c498746c92e9e0e5c9f69ca51e ******/
		%feature("compactdefaultargs") Pnt;
		%feature("autodoc", "
Parameters
----------
V: Adaptor3d_HVertex

Return
-------
gp_Pnt

Description
-----------
returns 3d point of the vertex V.
") Pnt;
		virtual gp_Pnt Pnt(const opencascade::handle<Adaptor3d_HVertex> & V);

		/****** Adaptor3d_TopolTool::SamplePnts ******/
		/****** md5 signature: 1c0afe626fcec6060eb4d57ba07c3ae7 ******/
		%feature("compactdefaultargs") SamplePnts;
		%feature("autodoc", "
Parameters
----------
theDefl: double
theNUmin: int
theNVmin: int

Return
-------
None

Description
-----------
Compute the sample-points for the intersections algorithms by adaptive algorithm for BSpline surfaces. For other surfaces algorithm is the same as in method ComputeSamplePoints(), but only fill arrays of U and V sample parameters; 
Input parameter: theDefl a required deflection 
Input parameter: theNUmin minimal nb points for U 
Input parameter: theNVmin minimal nb points for V.
") SamplePnts;
		virtual void SamplePnts(const double theDefl, const int theNUmin, const int theNVmin);

		/****** Adaptor3d_TopolTool::SamplePoint ******/
		/****** md5 signature: 56a3614ed7bbdabb35a11bc9ec365879 ******/
		%feature("compactdefaultargs") SamplePoint;
		%feature("autodoc", "
Parameters
----------
Index: int
P2d: gp_Pnt2d
P3d: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") SamplePoint;
		virtual void SamplePoint(const int Index, gp_Pnt2d & P2d, gp_Pnt & P3d);

		/****** Adaptor3d_TopolTool::Tol3d ******/
		/****** md5 signature: 36b395006bec263d4b0b8eddca516be6 ******/
		%feature("compactdefaultargs") Tol3d;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d

Return
-------
double

Description
-----------
returns 3d tolerance of the arc C.
") Tol3d;
		virtual double Tol3d(const opencascade::handle<Adaptor2d_Curve2d> & C);

		/****** Adaptor3d_TopolTool::Tol3d ******/
		/****** md5 signature: d44975e4315fabd5f4c0f60d28fa6d96 ******/
		%feature("compactdefaultargs") Tol3d;
		%feature("autodoc", "
Parameters
----------
V: Adaptor3d_HVertex

Return
-------
double

Description
-----------
returns 3d tolerance of the vertex V.
") Tol3d;
		virtual double Tol3d(const opencascade::handle<Adaptor3d_HVertex> & V);

		/****** Adaptor3d_TopolTool::UParameters ******/
		/****** md5 signature: 7adba3c0b403679a6af592f857842dc3 ******/
		%feature("compactdefaultargs") UParameters;
		%feature("autodoc", "
Parameters
----------
theArray: TColStd_Array1OfReal

Return
-------
None

Description
-----------
return the set of U parameters on the surface obtained by the method SamplePnts.
") UParameters;
		void UParameters(TColStd_Array1OfReal & theArray);

		/****** Adaptor3d_TopolTool::VParameters ******/
		/****** md5 signature: ba2cab239565f9c8bfe9e02fce39a79c ******/
		%feature("compactdefaultargs") VParameters;
		%feature("autodoc", "
Parameters
----------
theArray: TColStd_Array1OfReal

Return
-------
None

Description
-----------
return the set of V parameters on the surface obtained by the method SamplePnts.
") VParameters;
		void VParameters(TColStd_Array1OfReal & theArray);

		/****** Adaptor3d_TopolTool::Value ******/
		/****** md5 signature: 69341486cc398dcbf57c11fda47f97ca ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
opencascade::handle<Adaptor2d_Curve2d>

Description
-----------
No available documentation.
") Value;
		virtual opencascade::handle<Adaptor2d_Curve2d> Value();

		/****** Adaptor3d_TopolTool::Vertex ******/
		/****** md5 signature: 5fa61bdbc5145c1abf55279009e1141b ******/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "Return
-------
opencascade::handle<Adaptor3d_HVertex>

Description
-----------
No available documentation.
") Vertex;
		virtual opencascade::handle<Adaptor3d_HVertex> Vertex();

};


%make_alias(Adaptor3d_TopolTool)

%extend Adaptor3d_TopolTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class Adaptor3d_CurveOnSurface *
*********************************/
class Adaptor3d_CurveOnSurface : public Adaptor3d_Curve {
	public:
		/****** Adaptor3d_CurveOnSurface::Adaptor3d_CurveOnSurface ******/
		/****** md5 signature: 6b7eb8b8fde65fd79c0e562453b0df89 ******/
		%feature("compactdefaultargs") Adaptor3d_CurveOnSurface;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Adaptor3d_CurveOnSurface;
		 Adaptor3d_CurveOnSurface();

		/****** Adaptor3d_CurveOnSurface::Adaptor3d_CurveOnSurface ******/
		/****** md5 signature: 43855c057bcf63a011b7ed029a6545e6 ******/
		%feature("compactdefaultargs") Adaptor3d_CurveOnSurface;
		%feature("autodoc", "
Parameters
----------
S: Adaptor3d_Surface

Return
-------
None

Description
-----------
No available documentation.
") Adaptor3d_CurveOnSurface;
		 Adaptor3d_CurveOnSurface(const opencascade::handle<Adaptor3d_Surface> & S);

		/****** Adaptor3d_CurveOnSurface::Adaptor3d_CurveOnSurface ******/
		/****** md5 signature: b05d3f0d46c0fd08ffcffadc70a4838b ******/
		%feature("compactdefaultargs") Adaptor3d_CurveOnSurface;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d
S: Adaptor3d_Surface

Return
-------
None

Description
-----------
Creates a CurveOnSurface from the 2d curve <C> and the surface <S>.
") Adaptor3d_CurveOnSurface;
		 Adaptor3d_CurveOnSurface(const opencascade::handle<Adaptor2d_Curve2d> & C, const opencascade::handle<Adaptor3d_Surface> & S);

		/****** Adaptor3d_CurveOnSurface::BSpline ******/
		/****** md5 signature: 7bed4aa4788773a8c748371dea2999b6 ******/
		%feature("compactdefaultargs") BSpline;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_BSplineCurve>

Description
-----------
No available documentation.
") BSpline;
		opencascade::handle<Geom_BSplineCurve> BSpline();

		/****** Adaptor3d_CurveOnSurface::Bezier ******/
		/****** md5 signature: 18c746ed347d210e28744f5b1c7eb527 ******/
		%feature("compactdefaultargs") Bezier;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_BezierCurve>

Description
-----------
No available documentation.
") Bezier;
		opencascade::handle<Geom_BezierCurve> Bezier();

		/****** Adaptor3d_CurveOnSurface::ChangeCurve ******/
		/****** md5 signature: 0751d1f9e5791d4ab52f473cba6aa712 ******/
		%feature("compactdefaultargs") ChangeCurve;
		%feature("autodoc", "Return
-------
opencascade::handle<Adaptor2d_Curve2d>

Description
-----------
No available documentation.
") ChangeCurve;
		opencascade::handle<Adaptor2d_Curve2d> & ChangeCurve();

		/****** Adaptor3d_CurveOnSurface::ChangeSurface ******/
		/****** md5 signature: b8c30fe30999884649c5e492e4d3ae1b ******/
		%feature("compactdefaultargs") ChangeSurface;
		%feature("autodoc", "Return
-------
opencascade::handle<Adaptor3d_Surface>

Description
-----------
No available documentation.
") ChangeSurface;
		opencascade::handle<Adaptor3d_Surface> & ChangeSurface();

		/****** Adaptor3d_CurveOnSurface::Circle ******/
		/****** md5 signature: 7475f3d2915ecc09ceb3114f02b43080 ******/
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", "Return
-------
gp_Circ

Description
-----------
No available documentation.
") Circle;
		gp_Circ Circle();

		/****** Adaptor3d_CurveOnSurface::Continuity ******/
		/****** md5 signature: 8a904df22c5de40ac55e533d992dce2a ******/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "Return
-------
GeomAbs_Shape

Description
-----------
No available documentation.
") Continuity;
		GeomAbs_Shape Continuity();

		/****** Adaptor3d_CurveOnSurface::Degree ******/
		/****** md5 signature: 6a99b61f429058b67ffcdab561815cfb ******/
		%feature("compactdefaultargs") Degree;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Degree;
		int Degree();

		/****** Adaptor3d_CurveOnSurface::Ellipse ******/
		/****** md5 signature: b7cf7020e3992d6d2378fd2118e8d198 ******/
		%feature("compactdefaultargs") Ellipse;
		%feature("autodoc", "Return
-------
gp_Elips

Description
-----------
No available documentation.
") Ellipse;
		gp_Elips Ellipse();

		/****** Adaptor3d_CurveOnSurface::EvalD0 ******/
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
Point evaluation. Raises an exception on failure.
") EvalD0;
		gp_Pnt EvalD0(const double theU);

		/****** Adaptor3d_CurveOnSurface::EvalD1 ******/
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
D1 evaluation. Raises an exception on failure.
") EvalD1;
		Geom_Curve::ResD1 EvalD1(const double theU);

		/****** Adaptor3d_CurveOnSurface::EvalD2 ******/
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
D2 evaluation. Raises an exception on failure.
") EvalD2;
		Geom_Curve::ResD2 EvalD2(const double theU);

		/****** Adaptor3d_CurveOnSurface::EvalD3 ******/
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
D3 evaluation. Raises an exception on failure.
") EvalD3;
		Geom_Curve::ResD3 EvalD3(const double theU);

		/****** Adaptor3d_CurveOnSurface::EvalDN ******/
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
DN evaluation. Raises an exception on failure.
") EvalDN;
		gp_Vec EvalDN(const double theU, const int theN);

		/****** Adaptor3d_CurveOnSurface::FirstParameter ******/
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

		/****** Adaptor3d_CurveOnSurface::GetCurve ******/
		/****** md5 signature: 59faf580a052d0534228f92dbc8fa8ec ******/
		%feature("compactdefaultargs") GetCurve;
		%feature("autodoc", "Return
-------
opencascade::handle<Adaptor2d_Curve2d>

Description
-----------
No available documentation.
") GetCurve;
		const opencascade::handle<Adaptor2d_Curve2d> & GetCurve();

		/****** Adaptor3d_CurveOnSurface::GetSurface ******/
		/****** md5 signature: 56dff0248d5d8fc9e2bd341c8dad1556 ******/
		%feature("compactdefaultargs") GetSurface;
		%feature("autodoc", "Return
-------
opencascade::handle<Adaptor3d_Surface>

Description
-----------
No available documentation.
") GetSurface;
		const opencascade::handle<Adaptor3d_Surface> & GetSurface();

		/****** Adaptor3d_CurveOnSurface::GetType ******/
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

		/****** Adaptor3d_CurveOnSurface::Hyperbola ******/
		/****** md5 signature: 308d3b34f3aaba706261ba7e6cb1678e ******/
		%feature("compactdefaultargs") Hyperbola;
		%feature("autodoc", "Return
-------
gp_Hypr

Description
-----------
No available documentation.
") Hyperbola;
		gp_Hypr Hyperbola();

		/****** Adaptor3d_CurveOnSurface::Intervals ******/
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

		/****** Adaptor3d_CurveOnSurface::IsClosed ******/
		/****** md5 signature: e10ee7204b25ff2ff849146f37c83359 ******/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsClosed;
		bool IsClosed();

		/****** Adaptor3d_CurveOnSurface::IsPeriodic ******/
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

		/****** Adaptor3d_CurveOnSurface::IsRational ******/
		/****** md5 signature: 43e7b94be36c1d44222e606d2d075195 ******/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsRational;
		bool IsRational();

		/****** Adaptor3d_CurveOnSurface::LastParameter ******/
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

		/****** Adaptor3d_CurveOnSurface::Line ******/
		/****** md5 signature: acdc8f5fc99e967530fe196307d05538 ******/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "Return
-------
gp_Lin

Description
-----------
No available documentation.
") Line;
		gp_Lin Line();

		/****** Adaptor3d_CurveOnSurface::Load ******/
		/****** md5 signature: 5fdedc45f7f3e3286603c8152dd5d5ba ******/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "
Parameters
----------
S: Adaptor3d_Surface

Return
-------
None

Description
-----------
Changes the surface.
") Load;
		void Load(const opencascade::handle<Adaptor3d_Surface> & S);

		/****** Adaptor3d_CurveOnSurface::Load ******/
		/****** md5 signature: ddca440597e53b1ed736274984f99921 ******/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d

Return
-------
None

Description
-----------
Changes the 2d curve.
") Load;
		void Load(const opencascade::handle<Adaptor2d_Curve2d> & C);

		/****** Adaptor3d_CurveOnSurface::Load ******/
		/****** md5 signature: 30aac2c787964491ce82a24360e0e4be ******/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d
S: Adaptor3d_Surface

Return
-------
None

Description
-----------
Load both curve and surface.
") Load;
		void Load(const opencascade::handle<Adaptor2d_Curve2d> & C, const opencascade::handle<Adaptor3d_Surface> & S);

		/****** Adaptor3d_CurveOnSurface::NbIntervals ******/
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

		/****** Adaptor3d_CurveOnSurface::NbKnots ******/
		/****** md5 signature: d6bff4f2a244b781cf7c609ff1cddaf1 ******/
		%feature("compactdefaultargs") NbKnots;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbKnots;
		int NbKnots();

		/****** Adaptor3d_CurveOnSurface::NbPoles ******/
		/****** md5 signature: bdb1092e5fcaeae9c85a332311d7f069 ******/
		%feature("compactdefaultargs") NbPoles;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbPoles;
		int NbPoles();

		/****** Adaptor3d_CurveOnSurface::Parabola ******/
		/****** md5 signature: de70ebd3fa2d227512b9d0058ee94ca5 ******/
		%feature("compactdefaultargs") Parabola;
		%feature("autodoc", "Return
-------
gp_Parab

Description
-----------
No available documentation.
") Parabola;
		gp_Parab Parabola();

		/****** Adaptor3d_CurveOnSurface::Period ******/
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

		/****** Adaptor3d_CurveOnSurface::Resolution ******/
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

		/****** Adaptor3d_CurveOnSurface::ShallowCopy ******/
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

		/****** Adaptor3d_CurveOnSurface::Trim ******/
		/****** md5 signature: 91538b497dfbccd564dbd54083e8e395 ******/
		%feature("compactdefaultargs") Trim;
		%feature("autodoc", "
Parameters
----------
First: double
Last: double
Tol: double

Return
-------
opencascade::handle<Adaptor3d_Curve>

Description
-----------
Returns a curve equivalent of <self> between parameters <First> and <Last>. <Tol> is used to test for 3d points confusion. If <First> >= <Last>.
") Trim;
		opencascade::handle<Adaptor3d_Curve> Trim(const double First, const double Last, const double Tol);

};


%make_alias(Adaptor3d_CurveOnSurface)

%extend Adaptor3d_CurveOnSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class Adaptor3d_IsoCurve *
***************************/
class Adaptor3d_IsoCurve : public Adaptor3d_Curve {
	public:
		/****** Adaptor3d_IsoCurve::Adaptor3d_IsoCurve ******/
		/****** md5 signature: cb862f00a186757c14cd5025f695a90c ******/
		%feature("compactdefaultargs") Adaptor3d_IsoCurve;
		%feature("autodoc", "Return
-------
None

Description
-----------
The iso is set to NoneIso.
") Adaptor3d_IsoCurve;
		 Adaptor3d_IsoCurve();

		/****** Adaptor3d_IsoCurve::Adaptor3d_IsoCurve ******/
		/****** md5 signature: 607c0557eaedda13d060731388d0c004 ******/
		%feature("compactdefaultargs") Adaptor3d_IsoCurve;
		%feature("autodoc", "
Parameters
----------
S: Adaptor3d_Surface

Return
-------
None

Description
-----------
The surface is loaded. The iso is set to NoneIso.
") Adaptor3d_IsoCurve;
		 Adaptor3d_IsoCurve(const opencascade::handle<Adaptor3d_Surface> & S);

		/****** Adaptor3d_IsoCurve::Adaptor3d_IsoCurve ******/
		/****** md5 signature: 07dfa79741a5a0c2fdaae91b4de3d16a ******/
		%feature("compactdefaultargs") Adaptor3d_IsoCurve;
		%feature("autodoc", "
Parameters
----------
S: Adaptor3d_Surface
Iso: GeomAbs_IsoType
Param: double

Return
-------
None

Description
-----------
Creates an IsoCurve curve. Iso defines the type (isoU or isoU) Param defines the value of the iso. The bounds of the iso are the bounds of the surface.
") Adaptor3d_IsoCurve;
		 Adaptor3d_IsoCurve(const opencascade::handle<Adaptor3d_Surface> & S, const GeomAbs_IsoType Iso, const double Param);

		/****** Adaptor3d_IsoCurve::Adaptor3d_IsoCurve ******/
		/****** md5 signature: e331993d209440ade63daa4510c53bdd ******/
		%feature("compactdefaultargs") Adaptor3d_IsoCurve;
		%feature("autodoc", "
Parameters
----------
S: Adaptor3d_Surface
Iso: GeomAbs_IsoType
Param: double
WFirst: double
WLast: double

Return
-------
None

Description
-----------
Create an IsoCurve curve. Iso defines the type (isoU or isov). Param defines the value of the iso. WFirst,WLast define the bounds of the iso.
") Adaptor3d_IsoCurve;
		 Adaptor3d_IsoCurve(const opencascade::handle<Adaptor3d_Surface> & S, const GeomAbs_IsoType Iso, const double Param, const double WFirst, const double WLast);

		/****** Adaptor3d_IsoCurve::BSpline ******/
		/****** md5 signature: 7bed4aa4788773a8c748371dea2999b6 ******/
		%feature("compactdefaultargs") BSpline;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_BSplineCurve>

Description
-----------
No available documentation.
") BSpline;
		opencascade::handle<Geom_BSplineCurve> BSpline();

		/****** Adaptor3d_IsoCurve::Bezier ******/
		/****** md5 signature: 18c746ed347d210e28744f5b1c7eb527 ******/
		%feature("compactdefaultargs") Bezier;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_BezierCurve>

Description
-----------
No available documentation.
") Bezier;
		opencascade::handle<Geom_BezierCurve> Bezier();

		/****** Adaptor3d_IsoCurve::Circle ******/
		/****** md5 signature: 7475f3d2915ecc09ceb3114f02b43080 ******/
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", "Return
-------
gp_Circ

Description
-----------
No available documentation.
") Circle;
		gp_Circ Circle();

		/****** Adaptor3d_IsoCurve::Continuity ******/
		/****** md5 signature: 8a904df22c5de40ac55e533d992dce2a ******/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "Return
-------
GeomAbs_Shape

Description
-----------
No available documentation.
") Continuity;
		GeomAbs_Shape Continuity();

		/****** Adaptor3d_IsoCurve::Degree ******/
		/****** md5 signature: 6a99b61f429058b67ffcdab561815cfb ******/
		%feature("compactdefaultargs") Degree;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Degree;
		int Degree();

		/****** Adaptor3d_IsoCurve::Ellipse ******/
		/****** md5 signature: b7cf7020e3992d6d2378fd2118e8d198 ******/
		%feature("compactdefaultargs") Ellipse;
		%feature("autodoc", "Return
-------
gp_Elips

Description
-----------
No available documentation.
") Ellipse;
		gp_Elips Ellipse();

		/****** Adaptor3d_IsoCurve::EvalD0 ******/
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

		/****** Adaptor3d_IsoCurve::EvalD1 ******/
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

		/****** Adaptor3d_IsoCurve::EvalD2 ******/
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

		/****** Adaptor3d_IsoCurve::EvalD3 ******/
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

		/****** Adaptor3d_IsoCurve::EvalDN ******/
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
Returns the derivative of order theN at parameter theU. Raised if the continuity of the current interval is not CN. Raised if theN < 1.
") EvalDN;
		gp_Vec EvalDN(const double theU, const int theN);

		/****** Adaptor3d_IsoCurve::FirstParameter ******/
		/****** md5 signature: dc78d2d12bb932c87a4c14a5c9c0d19a ******/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") FirstParameter;
		double FirstParameter();

		/****** Adaptor3d_IsoCurve::GetType ******/
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

		/****** Adaptor3d_IsoCurve::Hyperbola ******/
		/****** md5 signature: 308d3b34f3aaba706261ba7e6cb1678e ******/
		%feature("compactdefaultargs") Hyperbola;
		%feature("autodoc", "Return
-------
gp_Hypr

Description
-----------
No available documentation.
") Hyperbola;
		gp_Hypr Hyperbola();

		/****** Adaptor3d_IsoCurve::Intervals ******/
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

		/****** Adaptor3d_IsoCurve::IsClosed ******/
		/****** md5 signature: e10ee7204b25ff2ff849146f37c83359 ******/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsClosed;
		bool IsClosed();

		/****** Adaptor3d_IsoCurve::IsPeriodic ******/
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

		/****** Adaptor3d_IsoCurve::IsRational ******/
		/****** md5 signature: 43e7b94be36c1d44222e606d2d075195 ******/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsRational;
		bool IsRational();

		/****** Adaptor3d_IsoCurve::Iso ******/
		/****** md5 signature: ab18592b64592fda4c22a1eda51e637d ******/
		%feature("compactdefaultargs") Iso;
		%feature("autodoc", "Return
-------
GeomAbs_IsoType

Description
-----------
No available documentation.
") Iso;
		GeomAbs_IsoType Iso();

		/****** Adaptor3d_IsoCurve::LastParameter ******/
		/****** md5 signature: 9b49916bc4bf24d69a406e677dabf205 ******/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") LastParameter;
		double LastParameter();

		/****** Adaptor3d_IsoCurve::Line ******/
		/****** md5 signature: acdc8f5fc99e967530fe196307d05538 ******/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "Return
-------
gp_Lin

Description
-----------
No available documentation.
") Line;
		gp_Lin Line();

		/****** Adaptor3d_IsoCurve::Load ******/
		/****** md5 signature: 5fdedc45f7f3e3286603c8152dd5d5ba ******/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "
Parameters
----------
S: Adaptor3d_Surface

Return
-------
None

Description
-----------
Changes the surface. The iso is reset to NoneIso.
") Load;
		void Load(const opencascade::handle<Adaptor3d_Surface> & S);

		/****** Adaptor3d_IsoCurve::Load ******/
		/****** md5 signature: 7a264b7ad715b4a196559150cabdeec4 ******/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "
Parameters
----------
Iso: GeomAbs_IsoType
Param: double

Return
-------
None

Description
-----------
Changes the iso on the current surface.
") Load;
		void Load(const GeomAbs_IsoType Iso, const double Param);

		/****** Adaptor3d_IsoCurve::Load ******/
		/****** md5 signature: 55f8cf765bf801e9fe9f4804c1a34c3d ******/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "
Parameters
----------
Iso: GeomAbs_IsoType
Param: double
WFirst: double
WLast: double

Return
-------
None

Description
-----------
Changes the iso on the current surface.
") Load;
		void Load(const GeomAbs_IsoType Iso, const double Param, const double WFirst, const double WLast);

		/****** Adaptor3d_IsoCurve::NbIntervals ******/
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

		/****** Adaptor3d_IsoCurve::NbKnots ******/
		/****** md5 signature: d6bff4f2a244b781cf7c609ff1cddaf1 ******/
		%feature("compactdefaultargs") NbKnots;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbKnots;
		int NbKnots();

		/****** Adaptor3d_IsoCurve::NbPoles ******/
		/****** md5 signature: bdb1092e5fcaeae9c85a332311d7f069 ******/
		%feature("compactdefaultargs") NbPoles;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbPoles;
		int NbPoles();

		/****** Adaptor3d_IsoCurve::Parabola ******/
		/****** md5 signature: de70ebd3fa2d227512b9d0058ee94ca5 ******/
		%feature("compactdefaultargs") Parabola;
		%feature("autodoc", "Return
-------
gp_Parab

Description
-----------
No available documentation.
") Parabola;
		gp_Parab Parabola();

		/****** Adaptor3d_IsoCurve::Parameter ******/
		/****** md5 signature: f2f0d3a4c48532483b401ae3d2d5c5fb ******/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") Parameter;
		double Parameter();

		/****** Adaptor3d_IsoCurve::Period ******/
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

		/****** Adaptor3d_IsoCurve::Resolution ******/
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

		/****** Adaptor3d_IsoCurve::ShallowCopy ******/
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

		/****** Adaptor3d_IsoCurve::Surface ******/
		/****** md5 signature: 36b438ec6a4fa276d7bb47e4d8b0376a ******/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "Return
-------
opencascade::handle<Adaptor3d_Surface>

Description
-----------
No available documentation.
") Surface;
		const opencascade::handle<Adaptor3d_Surface> & Surface();

		/****** Adaptor3d_IsoCurve::Trim ******/
		/****** md5 signature: 91538b497dfbccd564dbd54083e8e395 ******/
		%feature("compactdefaultargs") Trim;
		%feature("autodoc", "
Parameters
----------
First: double
Last: double
Tol: double

Return
-------
opencascade::handle<Adaptor3d_Curve>

Description
-----------
Returns a curve equivalent of <self> between parameters <First> and <Last>. <Tol> is used to test for 3d points confusion. If <First> >= <Last>.
") Trim;
		opencascade::handle<Adaptor3d_Curve> Trim(const double First, const double Last, const double Tol);

};


%make_alias(Adaptor3d_IsoCurve)

%extend Adaptor3d_IsoCurve {
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
def Adaptor3d_HSurfaceTool_AxeOfRevolution(*args):
	return Adaptor3d_HSurfaceTool.AxeOfRevolution(*args)

@deprecated
def Adaptor3d_HSurfaceTool_BSpline(*args):
	return Adaptor3d_HSurfaceTool.BSpline(*args)

@deprecated
def Adaptor3d_HSurfaceTool_BasisCurve(*args):
	return Adaptor3d_HSurfaceTool.BasisCurve(*args)

@deprecated
def Adaptor3d_HSurfaceTool_BasisSurface(*args):
	return Adaptor3d_HSurfaceTool.BasisSurface(*args)

@deprecated
def Adaptor3d_HSurfaceTool_Bezier(*args):
	return Adaptor3d_HSurfaceTool.Bezier(*args)

@deprecated
def Adaptor3d_HSurfaceTool_Cone(*args):
	return Adaptor3d_HSurfaceTool.Cone(*args)

@deprecated
def Adaptor3d_HSurfaceTool_Cylinder(*args):
	return Adaptor3d_HSurfaceTool.Cylinder(*args)

@deprecated
def Adaptor3d_HSurfaceTool_D0(*args):
	return Adaptor3d_HSurfaceTool.D0(*args)

@deprecated
def Adaptor3d_HSurfaceTool_D1(*args):
	return Adaptor3d_HSurfaceTool.D1(*args)

@deprecated
def Adaptor3d_HSurfaceTool_D2(*args):
	return Adaptor3d_HSurfaceTool.D2(*args)

@deprecated
def Adaptor3d_HSurfaceTool_D3(*args):
	return Adaptor3d_HSurfaceTool.D3(*args)

@deprecated
def Adaptor3d_HSurfaceTool_DN(*args):
	return Adaptor3d_HSurfaceTool.DN(*args)

@deprecated
def Adaptor3d_HSurfaceTool_Direction(*args):
	return Adaptor3d_HSurfaceTool.Direction(*args)

@deprecated
def Adaptor3d_HSurfaceTool_FirstUParameter(*args):
	return Adaptor3d_HSurfaceTool.FirstUParameter(*args)

@deprecated
def Adaptor3d_HSurfaceTool_FirstVParameter(*args):
	return Adaptor3d_HSurfaceTool.FirstVParameter(*args)

@deprecated
def Adaptor3d_HSurfaceTool_GetType(*args):
	return Adaptor3d_HSurfaceTool.GetType(*args)

@deprecated
def Adaptor3d_HSurfaceTool_IsSurfG1(*args):
	return Adaptor3d_HSurfaceTool.IsSurfG1(*args)

@deprecated
def Adaptor3d_HSurfaceTool_IsUClosed(*args):
	return Adaptor3d_HSurfaceTool.IsUClosed(*args)

@deprecated
def Adaptor3d_HSurfaceTool_IsUPeriodic(*args):
	return Adaptor3d_HSurfaceTool.IsUPeriodic(*args)

@deprecated
def Adaptor3d_HSurfaceTool_IsVClosed(*args):
	return Adaptor3d_HSurfaceTool.IsVClosed(*args)

@deprecated
def Adaptor3d_HSurfaceTool_IsVPeriodic(*args):
	return Adaptor3d_HSurfaceTool.IsVPeriodic(*args)

@deprecated
def Adaptor3d_HSurfaceTool_LastUParameter(*args):
	return Adaptor3d_HSurfaceTool.LastUParameter(*args)

@deprecated
def Adaptor3d_HSurfaceTool_LastVParameter(*args):
	return Adaptor3d_HSurfaceTool.LastVParameter(*args)

@deprecated
def Adaptor3d_HSurfaceTool_NbSamplesU(*args):
	return Adaptor3d_HSurfaceTool.NbSamplesU(*args)

@deprecated
def Adaptor3d_HSurfaceTool_NbSamplesU(*args):
	return Adaptor3d_HSurfaceTool.NbSamplesU(*args)

@deprecated
def Adaptor3d_HSurfaceTool_NbSamplesV(*args):
	return Adaptor3d_HSurfaceTool.NbSamplesV(*args)

@deprecated
def Adaptor3d_HSurfaceTool_NbSamplesV(*args):
	return Adaptor3d_HSurfaceTool.NbSamplesV(*args)

@deprecated
def Adaptor3d_HSurfaceTool_NbUIntervals(*args):
	return Adaptor3d_HSurfaceTool.NbUIntervals(*args)

@deprecated
def Adaptor3d_HSurfaceTool_NbVIntervals(*args):
	return Adaptor3d_HSurfaceTool.NbVIntervals(*args)

@deprecated
def Adaptor3d_HSurfaceTool_OffsetValue(*args):
	return Adaptor3d_HSurfaceTool.OffsetValue(*args)

@deprecated
def Adaptor3d_HSurfaceTool_Plane(*args):
	return Adaptor3d_HSurfaceTool.Plane(*args)

@deprecated
def Adaptor3d_HSurfaceTool_Sphere(*args):
	return Adaptor3d_HSurfaceTool.Sphere(*args)

@deprecated
def Adaptor3d_HSurfaceTool_Torus(*args):
	return Adaptor3d_HSurfaceTool.Torus(*args)

@deprecated
def Adaptor3d_HSurfaceTool_UIntervals(*args):
	return Adaptor3d_HSurfaceTool.UIntervals(*args)

@deprecated
def Adaptor3d_HSurfaceTool_UPeriod(*args):
	return Adaptor3d_HSurfaceTool.UPeriod(*args)

@deprecated
def Adaptor3d_HSurfaceTool_UResolution(*args):
	return Adaptor3d_HSurfaceTool.UResolution(*args)

@deprecated
def Adaptor3d_HSurfaceTool_UTrim(*args):
	return Adaptor3d_HSurfaceTool.UTrim(*args)

@deprecated
def Adaptor3d_HSurfaceTool_VIntervals(*args):
	return Adaptor3d_HSurfaceTool.VIntervals(*args)

@deprecated
def Adaptor3d_HSurfaceTool_VPeriod(*args):
	return Adaptor3d_HSurfaceTool.VPeriod(*args)

@deprecated
def Adaptor3d_HSurfaceTool_VResolution(*args):
	return Adaptor3d_HSurfaceTool.VResolution(*args)

@deprecated
def Adaptor3d_HSurfaceTool_VTrim(*args):
	return Adaptor3d_HSurfaceTool.VTrim(*args)

@deprecated
def Adaptor3d_HSurfaceTool_Value(*args):
	return Adaptor3d_HSurfaceTool.Value(*args)

@deprecated
def Adaptor3d_TopolTool_GetConeApexParam(*args):
	return Adaptor3d_TopolTool.GetConeApexParam(*args)

}
