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
%define ADAPTOR2DDOCSTRING
"Adaptor2d module, see official documentation at
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_adaptor2d.html"
%enddef
%module (package="OCC.Core", docstring=ADAPTOR2DDOCSTRING) Adaptor2d


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
#include<Adaptor2d_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<Geom2d_module.hxx>
#include<gp_module.hxx>
#include<GeomAbs_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import Geom2d.i
%import gp.i
%import GeomAbs.i

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
%wrap_handle(Adaptor2d_Curve2d)
%wrap_handle(Adaptor2d_Line2d)
%wrap_handle(Adaptor2d_OffsetCurve)
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/**************************
* class Adaptor2d_Curve2d *
**************************/
class Adaptor2d_Curve2d : public Standard_Transient {
	public:
		/****** Adaptor2d_Curve2d::BSpline ******/
		/****** md5 signature: b2a7a571ebf1b38738b883a277ef794f ******/
		%feature("compactdefaultargs") BSpline;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom2d_BSplineCurve>

Description
-----------
No available documentation.
") BSpline;
		virtual opencascade::handle<Geom2d_BSplineCurve> BSpline();

		/****** Adaptor2d_Curve2d::Bezier ******/
		/****** md5 signature: f8f04b3add4103e9f0350b8ed2285dc4 ******/
		%feature("compactdefaultargs") Bezier;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom2d_BezierCurve>

Description
-----------
No available documentation.
") Bezier;
		virtual opencascade::handle<Geom2d_BezierCurve> Bezier();

		/****** Adaptor2d_Curve2d::Circle ******/
		/****** md5 signature: 624ff1e0c75139ee893a5066be1b5a0c ******/
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", "Return
-------
gp_Circ2d

Description
-----------
No available documentation.
") Circle;
		virtual gp_Circ2d Circle();

		/****** Adaptor2d_Curve2d::Continuity ******/
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

		/****** Adaptor2d_Curve2d::D0 ******/
		/****** md5 signature: aba1722c2dc65666998554a86aba288b ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
U: double
P: gp_Pnt2d

Return
-------
None

Description
-----------
Computes the point of parameter U on the curve.
") D0;
		virtual void D0(const double U, gp_Pnt2d & P);

		/****** Adaptor2d_Curve2d::D1 ******/
		/****** md5 signature: 0c940dafefaeb3b359b9d2df1fea7a78 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
U: double
P: gp_Pnt2d
V: gp_Vec2d

Return
-------
None

Description
-----------
Computes the point of parameter U on the curve with its first derivative. Raised if the continuity of the current interval is not C1.
") D1;
		virtual void D1(const double U, gp_Pnt2d & P, gp_Vec2d & V);

		/****** Adaptor2d_Curve2d::D2 ******/
		/****** md5 signature: c48ad056d8b20534d6b6654842aec4a2 ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
U: double
P: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d

Return
-------
None

Description
-----------
Returns the point P of parameter U, the first and second derivatives V1 and V2. Raised if the continuity of the current interval is not C2.
") D2;
		virtual void D2(const double U, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2);

		/****** Adaptor2d_Curve2d::D3 ******/
		/****** md5 signature: e4eb1110bcaa4393e2c875d6a40cee37 ******/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "
Parameters
----------
U: double
P: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d
V3: gp_Vec2d

Return
-------
None

Description
-----------
Returns the point P of parameter U, the first, the second and the third derivative. Raised if the continuity of the current interval is not C3.
") D3;
		virtual void D3(const double U, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2, gp_Vec2d & V3);

		/****** Adaptor2d_Curve2d::DN ******/
		/****** md5 signature: b83f4e7f3a759b819af9f97864036d46 ******/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "
Parameters
----------
U: double
N: int

Return
-------
gp_Vec2d

Description
-----------
The returned vector gives the value of the derivative for the order of derivation N. Raised if the continuity of the current interval is not CN. Raised if N < 1.
") DN;
		virtual gp_Vec2d DN(const double U, const int N);

		/****** Adaptor2d_Curve2d::Degree ******/
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

		/****** Adaptor2d_Curve2d::Ellipse ******/
		/****** md5 signature: ad57dba8c1c2fed98a4ee4d518e5af58 ******/
		%feature("compactdefaultargs") Ellipse;
		%feature("autodoc", "Return
-------
gp_Elips2d

Description
-----------
No available documentation.
") Ellipse;
		virtual gp_Elips2d Ellipse();

		/****** Adaptor2d_Curve2d::EvalD0 ******/
		/****** md5 signature: 97486ef021ae7fb1b439ee45aa32736c ******/
		%feature("compactdefaultargs") EvalD0;
		%feature("autodoc", "
Parameters
----------
theU: double

Return
-------
gp_Pnt2d

Description
-----------
Computes the point of parameter U on the curve. Raises an exception on failure.
") EvalD0;
		virtual gp_Pnt2d EvalD0(const double theU);

		/****** Adaptor2d_Curve2d::EvalD1 ******/
		/****** md5 signature: a19f52264a2658c6f022231aa41d347d ******/
		%feature("compactdefaultargs") EvalD1;
		%feature("autodoc", "
Parameters
----------
theU: double

Return
-------
Geom2d_Curve::ResD1

Description
-----------
Computes the point and first derivative at parameter U. Raises an exception on failure.
") EvalD1;
		virtual Geom2d_Curve::ResD1 EvalD1(const double theU);

		/****** Adaptor2d_Curve2d::EvalD2 ******/
		/****** md5 signature: d49b8b7d01a1be785ee7ffe8aeb7f197 ******/
		%feature("compactdefaultargs") EvalD2;
		%feature("autodoc", "
Parameters
----------
theU: double

Return
-------
Geom2d_Curve::ResD2

Description
-----------
Computes the point and first two derivatives at parameter U. Raises an exception on failure.
") EvalD2;
		virtual Geom2d_Curve::ResD2 EvalD2(const double theU);

		/****** Adaptor2d_Curve2d::EvalD3 ******/
		/****** md5 signature: 1e713751465938ecec7864c019307d48 ******/
		%feature("compactdefaultargs") EvalD3;
		%feature("autodoc", "
Parameters
----------
theU: double

Return
-------
Geom2d_Curve::ResD3

Description
-----------
Computes the point and first three derivatives at parameter U. Raises an exception on failure.
") EvalD3;
		virtual Geom2d_Curve::ResD3 EvalD3(const double theU);

		/****** Adaptor2d_Curve2d::EvalDN ******/
		/****** md5 signature: e264a4b9ff55eea29fb56db202d3d7e4 ******/
		%feature("compactdefaultargs") EvalDN;
		%feature("autodoc", "
Parameters
----------
theU: double
theN: int

Return
-------
gp_Vec2d

Description
-----------
Computes the Nth derivative at parameter U. Raises an exception on failure.
") EvalDN;
		virtual gp_Vec2d EvalDN(const double theU, const int theN);

		/****** Adaptor2d_Curve2d::FirstParameter ******/
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

		/****** Adaptor2d_Curve2d::GetType ******/
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

		/****** Adaptor2d_Curve2d::Hyperbola ******/
		/****** md5 signature: ec5c753a319a89563396073e20a5375e ******/
		%feature("compactdefaultargs") Hyperbola;
		%feature("autodoc", "Return
-------
gp_Hypr2d

Description
-----------
No available documentation.
") Hyperbola;
		virtual gp_Hypr2d Hyperbola();

		/****** Adaptor2d_Curve2d::Intervals ******/
		/****** md5 signature: 5bb53c7be4eec2188f8b9f9aee984d74 ******/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "
Parameters
----------
T: NCollection_Array1<double>
S: GeomAbs_Shape

Return
-------
None

Description
-----------
Stores in <T> the parameters bounding the intervals of continuity <S>. //! The array must provide enough room to accommodate for the parameters. i.e. T.Length() > NbIntervals().
") Intervals;
		virtual void Intervals(NCollection_Array1<double> & T, const GeomAbs_Shape S);

		/****** Adaptor2d_Curve2d::IsClosed ******/
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

		/****** Adaptor2d_Curve2d::IsPeriodic ******/
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

		/****** Adaptor2d_Curve2d::IsRational ******/
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

		/****** Adaptor2d_Curve2d::LastParameter ******/
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

		/****** Adaptor2d_Curve2d::Line ******/
		/****** md5 signature: c030f66e64195409bcfc92be438de5d5 ******/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "Return
-------
gp_Lin2d

Description
-----------
No available documentation.
") Line;
		virtual gp_Lin2d Line();

		/****** Adaptor2d_Curve2d::NbIntervals ******/
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
If necessary, breaks the curve in intervals of continuity <S>. And returns the number of intervals.
") NbIntervals;
		virtual int NbIntervals(const GeomAbs_Shape S);

		/****** Adaptor2d_Curve2d::NbKnots ******/
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

		/****** Adaptor2d_Curve2d::NbPoles ******/
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

		/****** Adaptor2d_Curve2d::NbSamples ******/
		/****** md5 signature: 56650c01cf99dcd71492ec18a2a0e3dd ******/
		%feature("compactdefaultargs") NbSamples;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbSamples;
		virtual int NbSamples();

		/****** Adaptor2d_Curve2d::Parabola ******/
		/****** md5 signature: 2bbe5ac6a61b052fd2bae484e8f0313c ******/
		%feature("compactdefaultargs") Parabola;
		%feature("autodoc", "Return
-------
gp_Parab2d

Description
-----------
No available documentation.
") Parabola;
		virtual gp_Parab2d Parabola();

		/****** Adaptor2d_Curve2d::Period ******/
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

		/****** Adaptor2d_Curve2d::Resolution ******/
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

		/****** Adaptor2d_Curve2d::ShallowCopy ******/
		/****** md5 signature: b866918647453effb47966d082097526 ******/
		%feature("compactdefaultargs") ShallowCopy;
		%feature("autodoc", "Return
-------
opencascade::handle<Adaptor2d_Curve2d>

Description
-----------
Shallow copy of adaptor.
") ShallowCopy;
		virtual opencascade::handle<Adaptor2d_Curve2d> ShallowCopy();

		/****** Adaptor2d_Curve2d::Trim ******/
		/****** md5 signature: 178af913cb2f1938ee99e8cf0e4d3804 ******/
		%feature("compactdefaultargs") Trim;
		%feature("autodoc", "
Parameters
----------
First: double
Last: double
Tol: double

Return
-------
opencascade::handle<Adaptor2d_Curve2d>

Description
-----------
Returns a curve equivalent of <self> between parameters <First> and <Last>. <Tol> is used to test for 3d points confusion. If <First> >= <Last>.
") Trim;
		virtual opencascade::handle<Adaptor2d_Curve2d> Trim(const double First, const double Last, const double Tol);

		/****** Adaptor2d_Curve2d::Value ******/
		/****** md5 signature: fdaafe8ddaa273c3d9d82e2df52a1bc5 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
U: double

Return
-------
gp_Pnt2d

Description
-----------
Computes the point of parameter U on the curve.
") Value;
		virtual gp_Pnt2d Value(const double U);

};


%make_alias(Adaptor2d_Curve2d)

%extend Adaptor2d_Curve2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class Adaptor2d_Line2d *
*************************/
class Adaptor2d_Line2d : public Adaptor2d_Curve2d {
	public:
		/****** Adaptor2d_Line2d::Adaptor2d_Line2d ******/
		/****** md5 signature: a217d4c2f1a39c468576f503c72e4282 ******/
		%feature("compactdefaultargs") Adaptor2d_Line2d;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Adaptor2d_Line2d;
		 Adaptor2d_Line2d();

		/****** Adaptor2d_Line2d::Adaptor2d_Line2d ******/
		/****** md5 signature: 067367c1e0c86e28e53bae20adff2596 ******/
		%feature("compactdefaultargs") Adaptor2d_Line2d;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt2d
D: gp_Dir2d
UFirst: double
ULast: double

Return
-------
None

Description
-----------
No available documentation.
") Adaptor2d_Line2d;
		 Adaptor2d_Line2d(const gp_Pnt2d & P, const gp_Dir2d & D, const double UFirst, const double ULast);

		/****** Adaptor2d_Line2d::BSpline ******/
		/****** md5 signature: c66055916af14afb8911637fc5e277d6 ******/
		%feature("compactdefaultargs") BSpline;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom2d_BSplineCurve>

Description
-----------
No available documentation.
") BSpline;
		opencascade::handle<Geom2d_BSplineCurve> BSpline();

		/****** Adaptor2d_Line2d::Bezier ******/
		/****** md5 signature: 9e5f9691bdf3aa713aceb92eb8809a74 ******/
		%feature("compactdefaultargs") Bezier;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom2d_BezierCurve>

Description
-----------
No available documentation.
") Bezier;
		opencascade::handle<Geom2d_BezierCurve> Bezier();

		/****** Adaptor2d_Line2d::Circle ******/
		/****** md5 signature: c57212f487cf777aef6ef0b0153393bf ******/
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", "Return
-------
gp_Circ2d

Description
-----------
No available documentation.
") Circle;
		gp_Circ2d Circle();

		/****** Adaptor2d_Line2d::Continuity ******/
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

		/****** Adaptor2d_Line2d::D0 ******/
		/****** md5 signature: dd6443fd406d94a60f4fd0fb7cf26194 ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
X: double
P: gp_Pnt2d

Return
-------
None

Description
-----------
No available documentation.
") D0;
		void D0(const double X, gp_Pnt2d & P);

		/****** Adaptor2d_Line2d::D1 ******/
		/****** md5 signature: 0dc41286e41b2c2f070156294dc23182 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
X: double
P: gp_Pnt2d
V: gp_Vec2d

Return
-------
None

Description
-----------
No available documentation.
") D1;
		void D1(const double X, gp_Pnt2d & P, gp_Vec2d & V);

		/****** Adaptor2d_Line2d::D2 ******/
		/****** md5 signature: db20ebe250fc3e513237d7353a917b26 ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
X: double
P: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d

Return
-------
None

Description
-----------
No available documentation.
") D2;
		void D2(const double X, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2);

		/****** Adaptor2d_Line2d::D3 ******/
		/****** md5 signature: bd9e3596c163c8245c5037d98443b333 ******/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "
Parameters
----------
X: double
P: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d
V3: gp_Vec2d

Return
-------
None

Description
-----------
No available documentation.
") D3;
		void D3(const double X, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2, gp_Vec2d & V3);

		/****** Adaptor2d_Line2d::DN ******/
		/****** md5 signature: ab59dc692256c89ec17f3f5c66c3a731 ******/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "
Parameters
----------
U: double
N: int

Return
-------
gp_Vec2d

Description
-----------
No available documentation.
") DN;
		gp_Vec2d DN(const double U, const int N);

		/****** Adaptor2d_Line2d::Degree ******/
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

		/****** Adaptor2d_Line2d::Ellipse ******/
		/****** md5 signature: 578557aedadd7b6c95c4b18a4591b27d ******/
		%feature("compactdefaultargs") Ellipse;
		%feature("autodoc", "Return
-------
gp_Elips2d

Description
-----------
No available documentation.
") Ellipse;
		gp_Elips2d Ellipse();

		/****** Adaptor2d_Line2d::FirstParameter ******/
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

		/****** Adaptor2d_Line2d::GetType ******/
		/****** md5 signature: 5a645f79981f2ae05742e39e35676600 ******/
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "Return
-------
GeomAbs_CurveType

Description
-----------
No available documentation.
") GetType;
		GeomAbs_CurveType GetType();

		/****** Adaptor2d_Line2d::Hyperbola ******/
		/****** md5 signature: 76c8d95163d451200f916b4c08eee717 ******/
		%feature("compactdefaultargs") Hyperbola;
		%feature("autodoc", "Return
-------
gp_Hypr2d

Description
-----------
No available documentation.
") Hyperbola;
		gp_Hypr2d Hyperbola();

		/****** Adaptor2d_Line2d::Intervals ******/
		/****** md5 signature: c706a9ee65ae76457235d7e55942295b ******/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "
Parameters
----------
T: NCollection_Array1<double>
S: GeomAbs_Shape

Return
-------
None

Description
-----------
Stores in <T> the parameters bounding the intervals of continuity <S>. //! The array must provide enough room to accommodate for the parameters. i.e. T.Length() > NbIntervals().
") Intervals;
		void Intervals(NCollection_Array1<double> & T, const GeomAbs_Shape S);

		/****** Adaptor2d_Line2d::IsClosed ******/
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

		/****** Adaptor2d_Line2d::IsPeriodic ******/
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

		/****** Adaptor2d_Line2d::IsRational ******/
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

		/****** Adaptor2d_Line2d::LastParameter ******/
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

		/****** Adaptor2d_Line2d::Line ******/
		/****** md5 signature: e6ff57a9b7126056447e1c0678038f9b ******/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "Return
-------
gp_Lin2d

Description
-----------
No available documentation.
") Line;
		gp_Lin2d Line();

		/****** Adaptor2d_Line2d::Load ******/
		/****** md5 signature: 7620a23c09d16846209666736fe05b85 ******/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "
Parameters
----------
L: gp_Lin2d

Return
-------
None

Description
-----------
No available documentation.
") Load;
		void Load(const gp_Lin2d & L);

		/****** Adaptor2d_Line2d::Load ******/
		/****** md5 signature: 718565d407de4756d38395c26bc69d58 ******/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "
Parameters
----------
L: gp_Lin2d
UFirst: double
ULast: double

Return
-------
None

Description
-----------
No available documentation.
") Load;
		void Load(const gp_Lin2d & L, const double UFirst, const double ULast);

		/****** Adaptor2d_Line2d::NbIntervals ******/
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
If necessary, breaks the curve in intervals of continuity <S>. And returns the number of intervals.
") NbIntervals;
		int NbIntervals(const GeomAbs_Shape S);

		/****** Adaptor2d_Line2d::NbKnots ******/
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

		/****** Adaptor2d_Line2d::NbPoles ******/
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

		/****** Adaptor2d_Line2d::Parabola ******/
		/****** md5 signature: 22adbf7e85ee0cd0635ddfca26c2c71c ******/
		%feature("compactdefaultargs") Parabola;
		%feature("autodoc", "Return
-------
gp_Parab2d

Description
-----------
No available documentation.
") Parabola;
		gp_Parab2d Parabola();

		/****** Adaptor2d_Line2d::Period ******/
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

		/****** Adaptor2d_Line2d::Resolution ******/
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
No available documentation.
") Resolution;
		double Resolution(const double R3d);

		/****** Adaptor2d_Line2d::ShallowCopy ******/
		/****** md5 signature: 8a61349d8b017265b9f1e5017ac6a907 ******/
		%feature("compactdefaultargs") ShallowCopy;
		%feature("autodoc", "Return
-------
opencascade::handle<Adaptor2d_Curve2d>

Description
-----------
Shallow copy of adaptor.
") ShallowCopy;
		opencascade::handle<Adaptor2d_Curve2d> ShallowCopy();

		/****** Adaptor2d_Line2d::Trim ******/
		/****** md5 signature: 0abd427093454f28661226e589511811 ******/
		%feature("compactdefaultargs") Trim;
		%feature("autodoc", "
Parameters
----------
First: double
Last: double
Tol: double

Return
-------
opencascade::handle<Adaptor2d_Curve2d>

Description
-----------
Returns a curve equivalent of <self> between parameters <First> and <Last>. <Tol> is used to test for 3d points confusion. If <First> >= <Last>.
") Trim;
		opencascade::handle<Adaptor2d_Curve2d> Trim(const double First, const double Last, const double Tol);

		/****** Adaptor2d_Line2d::Value ******/
		/****** md5 signature: dd494a1731e0f7b30bcb4619b17d73c7 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
X: double

Return
-------
gp_Pnt2d

Description
-----------
No available documentation.
") Value;
		gp_Pnt2d Value(const double X);

};


%make_alias(Adaptor2d_Line2d)

%extend Adaptor2d_Line2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class Adaptor2d_OffsetCurve *
******************************/
class Adaptor2d_OffsetCurve : public Adaptor2d_Curve2d {
	public:
		/****** Adaptor2d_OffsetCurve::Adaptor2d_OffsetCurve ******/
		/****** md5 signature: 451c0a1cc0af1792697a4f563e2766d2 ******/
		%feature("compactdefaultargs") Adaptor2d_OffsetCurve;
		%feature("autodoc", "Return
-------
None

Description
-----------
The Offset is set to 0.
") Adaptor2d_OffsetCurve;
		 Adaptor2d_OffsetCurve();

		/****** Adaptor2d_OffsetCurve::Adaptor2d_OffsetCurve ******/
		/****** md5 signature: 5654e6bb9cb8b9bac1b0469cd906dc2c ******/
		%feature("compactdefaultargs") Adaptor2d_OffsetCurve;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d

Return
-------
None

Description
-----------
The curve is loaded. The Offset is set to 0.
") Adaptor2d_OffsetCurve;
		 Adaptor2d_OffsetCurve(const opencascade::handle<Adaptor2d_Curve2d> & C);

		/****** Adaptor2d_OffsetCurve::Adaptor2d_OffsetCurve ******/
		/****** md5 signature: 59d0cc80e75a7161bfb5d878b9114a91 ******/
		%feature("compactdefaultargs") Adaptor2d_OffsetCurve;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d
Offset: double

Return
-------
None

Description
-----------
Creates an OffsetCurve curve. The Offset is set to Offset.
") Adaptor2d_OffsetCurve;
		 Adaptor2d_OffsetCurve(const opencascade::handle<Adaptor2d_Curve2d> & C, const double Offset);

		/****** Adaptor2d_OffsetCurve::Adaptor2d_OffsetCurve ******/
		/****** md5 signature: cc2c5e8b6f5ce551a1816d48d1accb61 ******/
		%feature("compactdefaultargs") Adaptor2d_OffsetCurve;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d
Offset: double
WFirst: double
WLast: double

Return
-------
None

Description
-----------
Create an Offset curve. WFirst,WLast define the bounds of the Offset curve.
") Adaptor2d_OffsetCurve;
		 Adaptor2d_OffsetCurve(const opencascade::handle<Adaptor2d_Curve2d> & C, const double Offset, const double WFirst, const double WLast);

		/****** Adaptor2d_OffsetCurve::BSpline ******/
		/****** md5 signature: c66055916af14afb8911637fc5e277d6 ******/
		%feature("compactdefaultargs") BSpline;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom2d_BSplineCurve>

Description
-----------
No available documentation.
") BSpline;
		opencascade::handle<Geom2d_BSplineCurve> BSpline();

		/****** Adaptor2d_OffsetCurve::Bezier ******/
		/****** md5 signature: 9e5f9691bdf3aa713aceb92eb8809a74 ******/
		%feature("compactdefaultargs") Bezier;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom2d_BezierCurve>

Description
-----------
No available documentation.
") Bezier;
		opencascade::handle<Geom2d_BezierCurve> Bezier();

		/****** Adaptor2d_OffsetCurve::Circle ******/
		/****** md5 signature: c57212f487cf777aef6ef0b0153393bf ******/
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", "Return
-------
gp_Circ2d

Description
-----------
No available documentation.
") Circle;
		gp_Circ2d Circle();

		/****** Adaptor2d_OffsetCurve::Continuity ******/
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

		/****** Adaptor2d_OffsetCurve::Curve ******/
		/****** md5 signature: 49c261ed663fbe8204b6afa365e067a9 ******/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "Return
-------
opencascade::handle<Adaptor2d_Curve2d>

Description
-----------
No available documentation.
") Curve;
		const opencascade::handle<Adaptor2d_Curve2d> & Curve();

		/****** Adaptor2d_OffsetCurve::D0 ******/
		/****** md5 signature: 28006337a032f857e56ae70cba70f8c3 ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
U: double
P: gp_Pnt2d

Return
-------
None

Description
-----------
Computes the point of parameter U on the curve.
") D0;
		void D0(const double U, gp_Pnt2d & P);

		/****** Adaptor2d_OffsetCurve::D1 ******/
		/****** md5 signature: 5f53adf29b471206c7186b2aee007b00 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
U: double
P: gp_Pnt2d
V: gp_Vec2d

Return
-------
None

Description
-----------
Computes the point of parameter U on the curve with its first derivative. Raised if the continuity of the current interval is not C1.
") D1;
		void D1(const double U, gp_Pnt2d & P, gp_Vec2d & V);

		/****** Adaptor2d_OffsetCurve::D2 ******/
		/****** md5 signature: 159e151ac7b509d70da37104a08723f1 ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
U: double
P: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d

Return
-------
None

Description
-----------
Returns the point P of parameter U, the first and second derivatives V1 and V2. Raised if the continuity of the current interval is not C2.
") D2;
		void D2(const double U, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2);

		/****** Adaptor2d_OffsetCurve::D3 ******/
		/****** md5 signature: a39fa2e7cc382a5fc150aec6eef34ec5 ******/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "
Parameters
----------
U: double
P: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d
V3: gp_Vec2d

Return
-------
None

Description
-----------
Returns the point P of parameter U, the first, the second and the third derivative. Raised if the continuity of the current interval is not C3.
") D3;
		void D3(const double U, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2, gp_Vec2d & V3);

		/****** Adaptor2d_OffsetCurve::DN ******/
		/****** md5 signature: ab59dc692256c89ec17f3f5c66c3a731 ******/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "
Parameters
----------
U: double
N: int

Return
-------
gp_Vec2d

Description
-----------
The returned vector gives the value of the derivative for the order of derivation N. Raised if the continuity of the current interval is not CN. Raised if N < 1.
") DN;
		gp_Vec2d DN(const double U, const int N);

		/****** Adaptor2d_OffsetCurve::Degree ******/
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

		/****** Adaptor2d_OffsetCurve::Ellipse ******/
		/****** md5 signature: 578557aedadd7b6c95c4b18a4591b27d ******/
		%feature("compactdefaultargs") Ellipse;
		%feature("autodoc", "Return
-------
gp_Elips2d

Description
-----------
No available documentation.
") Ellipse;
		gp_Elips2d Ellipse();

		/****** Adaptor2d_OffsetCurve::FirstParameter ******/
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

		/****** Adaptor2d_OffsetCurve::GetType ******/
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

		/****** Adaptor2d_OffsetCurve::Hyperbola ******/
		/****** md5 signature: 76c8d95163d451200f916b4c08eee717 ******/
		%feature("compactdefaultargs") Hyperbola;
		%feature("autodoc", "Return
-------
gp_Hypr2d

Description
-----------
No available documentation.
") Hyperbola;
		gp_Hypr2d Hyperbola();

		/****** Adaptor2d_OffsetCurve::Intervals ******/
		/****** md5 signature: c706a9ee65ae76457235d7e55942295b ******/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "
Parameters
----------
T: NCollection_Array1<double>
S: GeomAbs_Shape

Return
-------
None

Description
-----------
Stores in <T> the parameters bounding the intervals of continuity <S>. //! The array must provide enough room to accommodate for the parameters. i.e. T.Length() > NbIntervals().
") Intervals;
		void Intervals(NCollection_Array1<double> & T, const GeomAbs_Shape S);

		/****** Adaptor2d_OffsetCurve::IsClosed ******/
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

		/****** Adaptor2d_OffsetCurve::IsPeriodic ******/
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

		/****** Adaptor2d_OffsetCurve::IsRational ******/
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

		/****** Adaptor2d_OffsetCurve::LastParameter ******/
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

		/****** Adaptor2d_OffsetCurve::Line ******/
		/****** md5 signature: e6ff57a9b7126056447e1c0678038f9b ******/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "Return
-------
gp_Lin2d

Description
-----------
No available documentation.
") Line;
		gp_Lin2d Line();

		/****** Adaptor2d_OffsetCurve::Load ******/
		/****** md5 signature: 9061983eb8107070a51888448966855a ******/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "
Parameters
----------
S: Adaptor2d_Curve2d

Return
-------
None

Description
-----------
Changes the curve. The Offset is reset to 0.
") Load;
		void Load(const opencascade::handle<Adaptor2d_Curve2d> & S);

		/****** Adaptor2d_OffsetCurve::Load ******/
		/****** md5 signature: b53901d4fbcd3acee9ceb7c0bedb3566 ******/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "
Parameters
----------
Offset: double

Return
-------
None

Description
-----------
Changes the Offset on the current Curve.
") Load;
		void Load(const double Offset);

		/****** Adaptor2d_OffsetCurve::Load ******/
		/****** md5 signature: aadb6c5706b61c71bf8bdd456213c7ca ******/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "
Parameters
----------
Offset: double
WFirst: double
WLast: double

Return
-------
None

Description
-----------
Changes the Offset Curve on the current Curve.
") Load;
		void Load(const double Offset, const double WFirst, const double WLast);

		/****** Adaptor2d_OffsetCurve::NbIntervals ******/
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
If necessary, breaks the curve in intervals of continuity <S>. And returns the number of intervals.
") NbIntervals;
		int NbIntervals(const GeomAbs_Shape S);

		/****** Adaptor2d_OffsetCurve::NbKnots ******/
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

		/****** Adaptor2d_OffsetCurve::NbPoles ******/
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

		/****** Adaptor2d_OffsetCurve::NbSamples ******/
		/****** md5 signature: dc632c7fd15de24b8e2e4237602286bc ******/
		%feature("compactdefaultargs") NbSamples;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbSamples;
		int NbSamples();

		/****** Adaptor2d_OffsetCurve::Offset ******/
		/****** md5 signature: e6054d6a9612344ebf32e748902e4577 ******/
		%feature("compactdefaultargs") Offset;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") Offset;
		double Offset();

		/****** Adaptor2d_OffsetCurve::Parabola ******/
		/****** md5 signature: 22adbf7e85ee0cd0635ddfca26c2c71c ******/
		%feature("compactdefaultargs") Parabola;
		%feature("autodoc", "Return
-------
gp_Parab2d

Description
-----------
No available documentation.
") Parabola;
		gp_Parab2d Parabola();

		/****** Adaptor2d_OffsetCurve::Period ******/
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

		/****** Adaptor2d_OffsetCurve::Resolution ******/
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

		/****** Adaptor2d_OffsetCurve::ShallowCopy ******/
		/****** md5 signature: 8a61349d8b017265b9f1e5017ac6a907 ******/
		%feature("compactdefaultargs") ShallowCopy;
		%feature("autodoc", "Return
-------
opencascade::handle<Adaptor2d_Curve2d>

Description
-----------
Shallow copy of adaptor.
") ShallowCopy;
		opencascade::handle<Adaptor2d_Curve2d> ShallowCopy();

		/****** Adaptor2d_OffsetCurve::Trim ******/
		/****** md5 signature: 0abd427093454f28661226e589511811 ******/
		%feature("compactdefaultargs") Trim;
		%feature("autodoc", "
Parameters
----------
First: double
Last: double
Tol: double

Return
-------
opencascade::handle<Adaptor2d_Curve2d>

Description
-----------
Returns a curve equivalent of <self> between parameters <First> and <Last>. <Tol> is used to test for 3d points confusion. If <First> >= <Last>.
") Trim;
		opencascade::handle<Adaptor2d_Curve2d> Trim(const double First, const double Last, const double Tol);

		/****** Adaptor2d_OffsetCurve::Value ******/
		/****** md5 signature: 287686c46f6da6400821b7738f682ad8 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
U: double

Return
-------
gp_Pnt2d

Description
-----------
Computes the point of parameter U on the curve.
") Value;
		gp_Pnt2d Value(const double U);

};


%make_alias(Adaptor2d_OffsetCurve)

%extend Adaptor2d_OffsetCurve {
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
