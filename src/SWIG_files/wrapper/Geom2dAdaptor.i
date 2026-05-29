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
%define GEOM2DADAPTORDOCSTRING
"Geom2dAdaptor module, see official documentation at
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_geom2dadaptor.html"
%enddef
%module (package="OCC.Core", docstring=GEOM2DADAPTORDOCSTRING) Geom2dAdaptor


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
#include<Geom2dAdaptor_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<Adaptor2d_module.hxx>
#include<Geom2d_module.hxx>
#include<gp_module.hxx>
#include<GeomAbs_module.hxx>
#include<TColStd_module.hxx>
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
%wrap_handle(Geom2dAdaptor_Curve)
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/**********************
* class Geom2dAdaptor *
**********************/
%rename(geom2dadaptor) Geom2dAdaptor;
class Geom2dAdaptor {
	public:
		/****** Geom2dAdaptor::MakeCurve ******/
		/****** md5 signature: c72e8d90e9cff395d1b9d0b5bc484109 ******/
		%feature("compactdefaultargs") MakeCurve;
		%feature("autodoc", "
Parameters
----------
HC: Adaptor2d_Curve2d

Return
-------
opencascade::handle<Geom2d_Curve>

Description
-----------
Inherited from GHCurve. Provides a curve handled by reference. Creates a 2d curve from a HCurve2d. This cannot process the OtherCurves.
") MakeCurve;
		static opencascade::handle<Geom2d_Curve> MakeCurve(const Adaptor2d_Curve2d & HC);

};


%extend Geom2dAdaptor {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class Geom2dAdaptor_Curve *
****************************/
class Geom2dAdaptor_Curve : public Adaptor2d_Curve2d {
	public:
		class OffsetData {};
		class BezierData {};
		class BSplineData {};
		/****** Geom2dAdaptor_Curve::Geom2dAdaptor_Curve ******/
		/****** md5 signature: 2791dbc26639b96186559159a2815b29 ******/
		%feature("compactdefaultargs") Geom2dAdaptor_Curve;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Geom2dAdaptor_Curve;
		 Geom2dAdaptor_Curve();

		/****** Geom2dAdaptor_Curve::Geom2dAdaptor_Curve ******/
		/****** md5 signature: e0e393202c576f2801d7e2429a622a66 ******/
		%feature("compactdefaultargs") Geom2dAdaptor_Curve;
		%feature("autodoc", "
Parameters
----------
C: Geom2d_Curve

Return
-------
None

Description
-----------
No available documentation.
") Geom2dAdaptor_Curve;
		 Geom2dAdaptor_Curve(const opencascade::handle<Geom2d_Curve> & C);

		/****** Geom2dAdaptor_Curve::Geom2dAdaptor_Curve ******/
		/****** md5 signature: 883231d9704d3927e0f4eac81ff44436 ******/
		%feature("compactdefaultargs") Geom2dAdaptor_Curve;
		%feature("autodoc", "
Parameters
----------
C: Geom2d_Curve
UFirst: double
ULast: double

Return
-------
None

Description
-----------
Standard_ConstructionError is raised if Ufirst>Ulast.
") Geom2dAdaptor_Curve;
		 Geom2dAdaptor_Curve(const opencascade::handle<Geom2d_Curve> & C, const double UFirst, const double ULast);

		/****** Geom2dAdaptor_Curve::BSpline ******/
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

		/****** Geom2dAdaptor_Curve::Bezier ******/
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

		/****** Geom2dAdaptor_Curve::Circle ******/
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

		/****** Geom2dAdaptor_Curve::Continuity ******/
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

		/****** Geom2dAdaptor_Curve::Curve ******/
		/****** md5 signature: e09aeee135451614c1573555e3da507c ******/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom2d_Curve>

Description
-----------
No available documentation.
") Curve;
		const opencascade::handle<Geom2d_Curve> & Curve();

		/****** Geom2dAdaptor_Curve::D0 ******/
		/****** md5 signature: 6f45a8b08ade8dd52e09584562dc5332 ******/
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
Computes the point of parameter U.
") D0;
		void D0(const double U, gp_Pnt2d & P);

		/****** Geom2dAdaptor_Curve::D1 ******/
		/****** md5 signature: 87c5240df7639bbbdab4d1bd70b5898e ******/
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

		/****** Geom2dAdaptor_Curve::D2 ******/
		/****** md5 signature: bf9a53dbe16bbf85f544b32f5cf16e36 ******/
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

		/****** Geom2dAdaptor_Curve::D3 ******/
		/****** md5 signature: f4a61cf187a413c2a82957e6e28e1f3f ******/
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

		/****** Geom2dAdaptor_Curve::DN ******/
		/****** md5 signature: ec367a5db47c5f3a0a290b7042a1d328 ******/
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

		/****** Geom2dAdaptor_Curve::Degree ******/
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

		/****** Geom2dAdaptor_Curve::Ellipse ******/
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

		/****** Geom2dAdaptor_Curve::EvalD0 ******/
		/****** md5 signature: b07cd748eddf6e0df7e4fd6caa7c8201 ******/
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
Point evaluation. Raises an exception on failure.
") EvalD0;
		gp_Pnt2d EvalD0(const double theU);

		/****** Geom2dAdaptor_Curve::EvalD1 ******/
		/****** md5 signature: 9104e355947ea115c0231a3a87d11221 ******/
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
D1 evaluation. Raises an exception on failure.
") EvalD1;
		Geom2d_Curve::ResD1 EvalD1(const double theU);

		/****** Geom2dAdaptor_Curve::EvalD2 ******/
		/****** md5 signature: b382affd6326cd0871f40798216c9c9c ******/
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
D2 evaluation. Raises an exception on failure.
") EvalD2;
		Geom2d_Curve::ResD2 EvalD2(const double theU);

		/****** Geom2dAdaptor_Curve::EvalD3 ******/
		/****** md5 signature: 177b3318e54886217155d3083ed2a4cd ******/
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
D3 evaluation. Raises an exception on failure.
") EvalD3;
		Geom2d_Curve::ResD3 EvalD3(const double theU);

		/****** Geom2dAdaptor_Curve::EvalDN ******/
		/****** md5 signature: c6c1ab6b04d6fb982032f5f9874faa7e ******/
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
DN evaluation. Raises an exception on failure.
") EvalDN;
		gp_Vec2d EvalDN(const double theU, const int theN);

		/****** Geom2dAdaptor_Curve::FirstParameter ******/
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

		/****** Geom2dAdaptor_Curve::GetType ******/
		/****** md5 signature: e8702ba2a9b67d9bf1a9f4972b71ea7a ******/
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "Return
-------
GeomAbs_CurveType

Description
-----------
No available documentation.
") GetType;
		GeomAbs_CurveType GetType();

		/****** Geom2dAdaptor_Curve::Hyperbola ******/
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

		/****** Geom2dAdaptor_Curve::Intervals ******/
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

		/****** Geom2dAdaptor_Curve::IsClosed ******/
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

		/****** Geom2dAdaptor_Curve::IsInitialized ******/
		/****** md5 signature: 01666b35dc0d7af2bf9583d3f531f49b ******/
		%feature("compactdefaultargs") IsInitialized;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the adaptor has been loaded with a curve.
") IsInitialized;
		bool IsInitialized();

		/****** Geom2dAdaptor_Curve::IsPeriodic ******/
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

		/****** Geom2dAdaptor_Curve::IsRational ******/
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

		/****** Geom2dAdaptor_Curve::LastParameter ******/
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

		/****** Geom2dAdaptor_Curve::Line ******/
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

		/****** Geom2dAdaptor_Curve::Load ******/
		/****** md5 signature: 2541208b3ec77b0ab58dcd00b56be7d9 ******/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "
Parameters
----------
theCurve: Geom2d_Curve

Return
-------
None

Description
-----------
No available documentation.
") Load;
		void Load(const opencascade::handle<Geom2d_Curve> & theCurve);

		/****** Geom2dAdaptor_Curve::Load ******/
		/****** md5 signature: cb8b86809f33e85a387f32071daa1a4e ******/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "
Parameters
----------
theCurve: Geom2d_Curve
theUFirst: double
theULast: double

Return
-------
None

Description
-----------
Standard_ConstructionError is raised if theUFirst > theULast + Precision::PConfusion().
") Load;
		void Load(const opencascade::handle<Geom2d_Curve> & theCurve, const double theUFirst, const double theULast);

		/****** Geom2dAdaptor_Curve::NbIntervals ******/
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

		/****** Geom2dAdaptor_Curve::NbKnots ******/
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

		/****** Geom2dAdaptor_Curve::NbPoles ******/
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

		/****** Geom2dAdaptor_Curve::NbSamples ******/
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

		/****** Geom2dAdaptor_Curve::Parabola ******/
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

		/****** Geom2dAdaptor_Curve::Period ******/
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

		/****** Geom2dAdaptor_Curve::Reset ******/
		/****** md5 signature: 7beb446fe26b948f797f8de87e46c23d ******/
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", "Return
-------
None

Description
-----------
Reset currently loaded curve (undone Load()).
") Reset;
		void Reset();

		/****** Geom2dAdaptor_Curve::Resolution ******/
		/****** md5 signature: fb64d8a8b458d9297a7de9ad4f19a689 ******/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "
Parameters
----------
Ruv: double

Return
-------
double

Description
-----------
returns the parametric resolution.
") Resolution;
		double Resolution(const double Ruv);

		/****** Geom2dAdaptor_Curve::ShallowCopy ******/
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

		/****** Geom2dAdaptor_Curve::Trim ******/
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

		/****** Geom2dAdaptor_Curve::Value ******/
		/****** md5 signature: 049c400b0a6ebb06019643af51cd7670 ******/
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


%make_alias(Geom2dAdaptor_Curve)

%extend Geom2dAdaptor_Curve {
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
def geom2dadaptor_MakeCurve(*args):
	return geom2dadaptor.MakeCurve(*args)

}
