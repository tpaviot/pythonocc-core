/*
Copyright 2008-2022 Thomas Paviot (tpaviot@gmail.com)

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
https://www.opencascade.com/doc/occt-7.6.0/refman/html/package_adaptor3d.html"
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
		/****************** BSpline ******************/
		/**** md5 signature: 534c7ad12bf6a739dd70c41ffd91fbc3 ****/
		%feature("compactdefaultargs") BSpline;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom_BSplineCurve>
") BSpline;
		virtual opencascade::handle<Geom_BSplineCurve> BSpline();

		/****************** Bezier ******************/
		/**** md5 signature: d039f5111d5d399e0d141d31d71bb173 ****/
		%feature("compactdefaultargs") Bezier;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom_BezierCurve>
") Bezier;
		virtual opencascade::handle<Geom_BezierCurve> Bezier();

		/****************** Circle ******************/
		/**** md5 signature: 2ffde840d9a6755dd8dac11847721aeb ****/
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Circ
") Circle;
		virtual gp_Circ Circle();

		/****************** Continuity ******************/
		/**** md5 signature: 8564d2514f3a14a163da9fa2b30a9284 ****/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "No available documentation.

Returns
-------
GeomAbs_Shape
") Continuity;
		virtual GeomAbs_Shape Continuity();

		/****************** D0 ******************/
		/**** md5 signature: ff252230a6b53579b22b53cd2be20378 ****/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "Computes the point of parameter u on the curve.

Parameters
----------
U: float
P: gp_Pnt

Returns
-------
None
") D0;
		virtual void D0(const Standard_Real U, gp_Pnt & P);

		/****************** D1 ******************/
		/**** md5 signature: 46c2267eec5c778b3f712b1f654b247b ****/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "Computes the point of parameter u on the curve with its first derivative. raised if the continuity of the current interval is not c1.

Parameters
----------
U: float
P: gp_Pnt
V: gp_Vec

Returns
-------
None
") D1;
		virtual void D1(const Standard_Real U, gp_Pnt & P, gp_Vec & V);

		/****************** D2 ******************/
		/**** md5 signature: bd2a31f266173337a625aa6cc256dc38 ****/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "Returns the point p of parameter u, the first and second derivatives v1 and v2. raised if the continuity of the current interval is not c2.

Parameters
----------
U: float
P: gp_Pnt
V1: gp_Vec
V2: gp_Vec

Returns
-------
None
") D2;
		virtual void D2(const Standard_Real U, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2);

		/****************** D3 ******************/
		/**** md5 signature: 4c8a92894fd5c8702f8e4fc644b169e8 ****/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "Returns the point p of parameter u, the first, the second and the third derivative. raised if the continuity of the current interval is not c3.

Parameters
----------
U: float
P: gp_Pnt
V1: gp_Vec
V2: gp_Vec
V3: gp_Vec

Returns
-------
None
") D3;
		virtual void D3(const Standard_Real U, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2, gp_Vec & V3);

		/****************** DN ******************/
		/**** md5 signature: e7a556aebd910c39086a16864c70a895 ****/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "The returned vector gives the value of the derivative for the order of derivation n. raised if the continuity of the current interval is not cn. raised if n < 1.

Parameters
----------
U: float
N: int

Returns
-------
gp_Vec
") DN;
		virtual gp_Vec DN(const Standard_Real U, const Standard_Integer N);

		/****************** Degree ******************/
		/**** md5 signature: d442d1b77ae7b1ce10d9531914b14be7 ****/
		%feature("compactdefaultargs") Degree;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") Degree;
		virtual Standard_Integer Degree();

		/****************** Ellipse ******************/
		/**** md5 signature: d9f1f2aa507ae2b9ee66e792a6ec6d18 ****/
		%feature("compactdefaultargs") Ellipse;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Elips
") Ellipse;
		virtual gp_Elips Ellipse();

		/****************** FirstParameter ******************/
		/**** md5 signature: adaac52a0f2d3263c19caadcbea394a2 ****/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") FirstParameter;
		virtual Standard_Real FirstParameter();

		/****************** GetType ******************/
		/**** md5 signature: 657f9e3cbd23a069ca4adcba08a9b196 ****/
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "Returns the type of the curve in the current interval : line, circle, ellipse, hyperbola, parabola, beziercurve, bsplinecurve, othercurve.

Returns
-------
GeomAbs_CurveType
") GetType;
		virtual GeomAbs_CurveType GetType();

		/****************** Hyperbola ******************/
		/**** md5 signature: 087275fe9d7175cc6c5a1b3aff60a964 ****/
		%feature("compactdefaultargs") Hyperbola;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Hypr
") Hyperbola;
		virtual gp_Hypr Hyperbola();

		/****************** Intervals ******************/
		/**** md5 signature: 1b47d9fadea42b0a52e1ad5844faff05 ****/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "Stores in <t> the parameters bounding the intervals of continuity <s>. //! the array must provide enough room to accommodate for the parameters. i.e. t.length() > nbintervals().

Parameters
----------
T: TColStd_Array1OfReal
S: GeomAbs_Shape

Returns
-------
None
") Intervals;
		virtual void Intervals(TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****************** IsClosed ******************/
		/**** md5 signature: d57ef0715a5abf96ea6273eee63d5417 ****/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsClosed;
		virtual Standard_Boolean IsClosed();

		/****************** IsPeriodic ******************/
		/**** md5 signature: aac83d336e26e94b4cd1076ac72ce2c9 ****/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsPeriodic;
		virtual Standard_Boolean IsPeriodic();

		/****************** IsRational ******************/
		/**** md5 signature: 5389f1211fc99cfdcbd6575b8eec7b5c ****/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsRational;
		virtual Standard_Boolean IsRational();

		/****************** LastParameter ******************/
		/**** md5 signature: 38a37eecbdff8d3a1b5ffdd6b12bf4d9 ****/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") LastParameter;
		virtual Standard_Real LastParameter();

		/****************** Line ******************/
		/**** md5 signature: 82d4979efdeac0c1d5c97a520a424fe8 ****/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Lin
") Line;
		virtual gp_Lin Line();

		/****************** NbIntervals ******************/
		/**** md5 signature: 0b37dc42182e542f53017d0e52c8cd03 ****/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "Returns the number of intervals for continuity <s>. may be one if continuity(me) >= <s>.

Parameters
----------
S: GeomAbs_Shape

Returns
-------
int
") NbIntervals;
		virtual Standard_Integer NbIntervals(const GeomAbs_Shape S);

		/****************** NbKnots ******************/
		/**** md5 signature: 22b54658d4850824758b23cad1529c2f ****/
		%feature("compactdefaultargs") NbKnots;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbKnots;
		virtual Standard_Integer NbKnots();

		/****************** NbPoles ******************/
		/**** md5 signature: 1b49ced11f88c6092f4e3b2473fe0460 ****/
		%feature("compactdefaultargs") NbPoles;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbPoles;
		virtual Standard_Integer NbPoles();

		/****************** OffsetCurve ******************/
		/**** md5 signature: 655d22f4633348168546c74998986f8b ****/
		%feature("compactdefaultargs") OffsetCurve;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom_OffsetCurve>
") OffsetCurve;
		virtual opencascade::handle<Geom_OffsetCurve> OffsetCurve();

		/****************** Parabola ******************/
		/**** md5 signature: 049a76e288b128edd6e69945fe3570cf ****/
		%feature("compactdefaultargs") Parabola;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Parab
") Parabola;
		virtual gp_Parab Parabola();

		/****************** Period ******************/
		/**** md5 signature: e4913c399f3a0a7037e498c5a9da8e1f ****/
		%feature("compactdefaultargs") Period;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Period;
		virtual Standard_Real Period();

		/****************** Resolution ******************/
		/**** md5 signature: 66fa92ada4ec8706453c0525abd4ecd6 ****/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "Returns the parametric resolution corresponding to the real space resolution <r3d>.

Parameters
----------
R3d: float

Returns
-------
float
") Resolution;
		virtual Standard_Real Resolution(const Standard_Real R3d);

		/****************** Trim ******************/
		/**** md5 signature: 28307ca5011d5510d72469097ddcd806 ****/
		%feature("compactdefaultargs") Trim;
		%feature("autodoc", "Returns a curve equivalent of <self> between parameters <first> and <last>. <tol> is used to test for 3d points confusion. if <first> >= <last>.

Parameters
----------
First: float
Last: float
Tol: float

Returns
-------
opencascade::handle<Adaptor3d_Curve>
") Trim;
		virtual opencascade::handle<Adaptor3d_Curve> Trim(const Standard_Real First, const Standard_Real Last, const Standard_Real Tol);

		/****************** Value ******************/
		/**** md5 signature: 29b1ab46081b3ec6882d2390e14cd6b7 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Computes the point of parameter u on the curve.

Parameters
----------
U: float

Returns
-------
gp_Pnt
") Value;
		virtual gp_Pnt Value(const Standard_Real U);

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
		/****************** AxeOfRevolution ******************/
		/**** md5 signature: 4e3c848c28744e01b507e4ba35d58b75 ****/
		%feature("compactdefaultargs") AxeOfRevolution;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSurf: Adaptor3d_Surface

Returns
-------
gp_Ax1
") AxeOfRevolution;
		static gp_Ax1 AxeOfRevolution(const opencascade::handle<Adaptor3d_Surface> & theSurf);

		/****************** BSpline ******************/
		/**** md5 signature: b20eee8852543ecba534da56f02ccdf2 ****/
		%feature("compactdefaultargs") BSpline;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSurf: Adaptor3d_Surface

Returns
-------
opencascade::handle<Geom_BSplineSurface>
") BSpline;
		static opencascade::handle<Geom_BSplineSurface> BSpline(const opencascade::handle<Adaptor3d_Surface> & theSurf);

		/****************** BasisCurve ******************/
		/**** md5 signature: a71b9a72441e0c7b51624acf5d096f74 ****/
		%feature("compactdefaultargs") BasisCurve;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSurf: Adaptor3d_Surface

Returns
-------
opencascade::handle<Adaptor3d_Curve>
") BasisCurve;
		static opencascade::handle<Adaptor3d_Curve> BasisCurve(const opencascade::handle<Adaptor3d_Surface> & theSurf);

		/****************** BasisSurface ******************/
		/**** md5 signature: 6934a2ceed70d84abf626da742f2ca76 ****/
		%feature("compactdefaultargs") BasisSurface;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSurf: Adaptor3d_Surface

Returns
-------
opencascade::handle<Adaptor3d_Surface>
") BasisSurface;
		static opencascade::handle<Adaptor3d_Surface> BasisSurface(const opencascade::handle<Adaptor3d_Surface> & theSurf);

		/****************** Bezier ******************/
		/**** md5 signature: ef3b727f4373bb00634a7bd688d5763b ****/
		%feature("compactdefaultargs") Bezier;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSurf: Adaptor3d_Surface

Returns
-------
opencascade::handle<Geom_BezierSurface>
") Bezier;
		static opencascade::handle<Geom_BezierSurface> Bezier(const opencascade::handle<Adaptor3d_Surface> & theSurf);

		/****************** Cone ******************/
		/**** md5 signature: a89b691d80e2017209b45690348a907f ****/
		%feature("compactdefaultargs") Cone;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSurf: Adaptor3d_Surface

Returns
-------
gp_Cone
") Cone;
		static gp_Cone Cone(const opencascade::handle<Adaptor3d_Surface> & theSurf);

		/****************** Cylinder ******************/
		/**** md5 signature: 4f2f78ef4d73dcfbb95115cb8f3fa005 ****/
		%feature("compactdefaultargs") Cylinder;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSurf: Adaptor3d_Surface

Returns
-------
gp_Cylinder
") Cylinder;
		static gp_Cylinder Cylinder(const opencascade::handle<Adaptor3d_Surface> & theSurf);

		/****************** D0 ******************/
		/**** md5 signature: ef0f2f9a8ca6c0c9f75569aea26f4923 ****/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSurf: Adaptor3d_Surface
theU: float
theV: float
thePnt: gp_Pnt

Returns
-------
None
") D0;
		static void D0(const opencascade::handle<Adaptor3d_Surface> & theSurf, const Standard_Real theU, const Standard_Real theV, gp_Pnt & thePnt);

		/****************** D1 ******************/
		/**** md5 signature: a7a9c17ffe5446525786782c4d8ec23c ****/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSurf: Adaptor3d_Surface
theU: float
theV: float
thePnt: gp_Pnt
theD1U: gp_Vec
theD1V: gp_Vec

Returns
-------
None
") D1;
		static void D1(const opencascade::handle<Adaptor3d_Surface> & theSurf, const Standard_Real theU, const Standard_Real theV, gp_Pnt & thePnt, gp_Vec & theD1U, gp_Vec & theD1V);

		/****************** D2 ******************/
		/**** md5 signature: d37322a7acd2c884c1193c7c40124ccd ****/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSurf: Adaptor3d_Surface
theU: float
theV: float
thePnt: gp_Pnt
theD1U: gp_Vec
theD1V: gp_Vec
theD2U: gp_Vec
theD2V: gp_Vec
theD2UV: gp_Vec

Returns
-------
None
") D2;
		static void D2(const opencascade::handle<Adaptor3d_Surface> & theSurf, const Standard_Real theU, const Standard_Real theV, gp_Pnt & thePnt, gp_Vec & theD1U, gp_Vec & theD1V, gp_Vec & theD2U, gp_Vec & theD2V, gp_Vec & theD2UV);

		/****************** D3 ******************/
		/**** md5 signature: 548950301f5d431905372eddf5619eb0 ****/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSurf: Adaptor3d_Surface
theU: float
theV: float
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

Returns
-------
None
") D3;
		static void D3(const opencascade::handle<Adaptor3d_Surface> & theSurf, const Standard_Real theU, const Standard_Real theV, gp_Pnt & thePnt, gp_Vec & theD1U, gp_Vec & theD1V, gp_Vec & theD2U, gp_Vec & theD2V, gp_Vec & theD2UV, gp_Vec & theD3U, gp_Vec & theD3V, gp_Vec & theD3UUV, gp_Vec & theD3UVV);

		/****************** DN ******************/
		/**** md5 signature: 53aedfdee41fb6987ac126268a92d99b ****/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSurf: Adaptor3d_Surface
theU: float
theV: float
theNU: int
theNV: int

Returns
-------
gp_Vec
") DN;
		static gp_Vec DN(const opencascade::handle<Adaptor3d_Surface> & theSurf, const Standard_Real theU, const Standard_Real theV, const Standard_Integer theNU, const Standard_Integer theNV);

		/****************** Direction ******************/
		/**** md5 signature: 390f6a317984f3d7d015dcaaccd7ed67 ****/
		%feature("compactdefaultargs") Direction;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSurf: Adaptor3d_Surface

Returns
-------
gp_Dir
") Direction;
		static gp_Dir Direction(const opencascade::handle<Adaptor3d_Surface> & theSurf);

		/****************** FirstUParameter ******************/
		/**** md5 signature: 09a568c2a86c9579d6d807f3e72bc98f ****/
		%feature("compactdefaultargs") FirstUParameter;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSurf: Adaptor3d_Surface

Returns
-------
float
") FirstUParameter;
		static Standard_Real FirstUParameter(const opencascade::handle<Adaptor3d_Surface> & theSurf);

		/****************** FirstVParameter ******************/
		/**** md5 signature: 9a27fa1be5f466c88aad4c2e37fb7f0f ****/
		%feature("compactdefaultargs") FirstVParameter;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSurf: Adaptor3d_Surface

Returns
-------
float
") FirstVParameter;
		static Standard_Real FirstVParameter(const opencascade::handle<Adaptor3d_Surface> & theSurf);

		/****************** GetType ******************/
		/**** md5 signature: 53f66bf2c621ee9ef4e55ebd8ffafedc ****/
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSurf: Adaptor3d_Surface

Returns
-------
GeomAbs_SurfaceType
") GetType;
		static GeomAbs_SurfaceType GetType(const opencascade::handle<Adaptor3d_Surface> & theSurf);

		/****************** IsSurfG1 ******************/
		/**** md5 signature: d95107568ad3b12d40cce978273a764d ****/
		%feature("compactdefaultargs") IsSurfG1;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSurf: Adaptor3d_Surface
theAlongU: bool
theAngTol: float,optional
	default value is Precision::Angular()

Returns
-------
bool
") IsSurfG1;
		static Standard_Boolean IsSurfG1(const opencascade::handle<Adaptor3d_Surface> & theSurf, const Standard_Boolean theAlongU, const Standard_Real theAngTol = Precision::Angular());

		/****************** IsUClosed ******************/
		/**** md5 signature: 72572d307cc1b0c468f6fd5b46afb6a4 ****/
		%feature("compactdefaultargs") IsUClosed;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSurf: Adaptor3d_Surface

Returns
-------
bool
") IsUClosed;
		static Standard_Boolean IsUClosed(const opencascade::handle<Adaptor3d_Surface> & theSurf);

		/****************** IsUPeriodic ******************/
		/**** md5 signature: b78a8d5ae8699626e5a192f250e8d734 ****/
		%feature("compactdefaultargs") IsUPeriodic;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSurf: Adaptor3d_Surface

Returns
-------
bool
") IsUPeriodic;
		static Standard_Boolean IsUPeriodic(const opencascade::handle<Adaptor3d_Surface> & theSurf);

		/****************** IsVClosed ******************/
		/**** md5 signature: c45c621ec386b255606174f186649fab ****/
		%feature("compactdefaultargs") IsVClosed;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSurf: Adaptor3d_Surface

Returns
-------
bool
") IsVClosed;
		static Standard_Boolean IsVClosed(const opencascade::handle<Adaptor3d_Surface> & theSurf);

		/****************** IsVPeriodic ******************/
		/**** md5 signature: f4305ccce01d0fbbd27855b1043d4ce5 ****/
		%feature("compactdefaultargs") IsVPeriodic;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSurf: Adaptor3d_Surface

Returns
-------
bool
") IsVPeriodic;
		static Standard_Boolean IsVPeriodic(const opencascade::handle<Adaptor3d_Surface> & theSurf);

		/****************** LastUParameter ******************/
		/**** md5 signature: 30477e987d8f575f84b54a57ce9f7444 ****/
		%feature("compactdefaultargs") LastUParameter;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSurf: Adaptor3d_Surface

Returns
-------
float
") LastUParameter;
		static Standard_Real LastUParameter(const opencascade::handle<Adaptor3d_Surface> & theSurf);

		/****************** LastVParameter ******************/
		/**** md5 signature: d5915a1291074a4423aec5d175b66bbc ****/
		%feature("compactdefaultargs") LastVParameter;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSurf: Adaptor3d_Surface

Returns
-------
float
") LastVParameter;
		static Standard_Real LastVParameter(const opencascade::handle<Adaptor3d_Surface> & theSurf);

		/****************** NbSamplesU ******************/
		/**** md5 signature: 50ddbf72eceb31a63e22869e67292178 ****/
		%feature("compactdefaultargs") NbSamplesU;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: Adaptor3d_Surface

Returns
-------
int
") NbSamplesU;
		static Standard_Integer NbSamplesU(const opencascade::handle<Adaptor3d_Surface> & S);

		/****************** NbSamplesU ******************/
		/**** md5 signature: 7ffe816252db97bdbf2950cea2ca2037 ****/
		%feature("compactdefaultargs") NbSamplesU;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: Adaptor3d_Surface
u1: float
u2: float

Returns
-------
int
") NbSamplesU;
		static Standard_Integer NbSamplesU(const opencascade::handle<Adaptor3d_Surface> & S, const Standard_Real u1, const Standard_Real u2);

		/****************** NbSamplesV ******************/
		/**** md5 signature: 3604df32e5eb1f507b1b53de19c12208 ****/
		%feature("compactdefaultargs") NbSamplesV;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: Adaptor3d_Surface

Returns
-------
int
") NbSamplesV;
		static Standard_Integer NbSamplesV(const opencascade::handle<Adaptor3d_Surface> & S);

		/****************** NbSamplesV ******************/
		/**** md5 signature: c65f614c9f36a107ebd0cfa1e6386566 ****/
		%feature("compactdefaultargs") NbSamplesV;
		%feature("autodoc", "No available documentation.

Parameters
----------
&: Adaptor3d_Surface
v1: float
v2: float

Returns
-------
int
") NbSamplesV;
		static Standard_Integer NbSamplesV(const opencascade::handle<Adaptor3d_Surface > &, const Standard_Real v1, const Standard_Real v2);

		/****************** NbUIntervals ******************/
		/**** md5 signature: fef1dad379e290c3cf16fef6ea8c820e ****/
		%feature("compactdefaultargs") NbUIntervals;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSurf: Adaptor3d_Surface
theSh: GeomAbs_Shape

Returns
-------
int
") NbUIntervals;
		static Standard_Integer NbUIntervals(const opencascade::handle<Adaptor3d_Surface> & theSurf, const GeomAbs_Shape theSh);

		/****************** NbVIntervals ******************/
		/**** md5 signature: 54fd606ca3f499eebfa8059b5b5d9f74 ****/
		%feature("compactdefaultargs") NbVIntervals;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSurf: Adaptor3d_Surface
theSh: GeomAbs_Shape

Returns
-------
int
") NbVIntervals;
		static Standard_Integer NbVIntervals(const opencascade::handle<Adaptor3d_Surface> & theSurf, const GeomAbs_Shape theSh);

		/****************** OffsetValue ******************/
		/**** md5 signature: 85e20729392a6c80ca1b75cc991aedbe ****/
		%feature("compactdefaultargs") OffsetValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSurf: Adaptor3d_Surface

Returns
-------
float
") OffsetValue;
		static Standard_Real OffsetValue(const opencascade::handle<Adaptor3d_Surface> & theSurf);

		/****************** Plane ******************/
		/**** md5 signature: 130558349c1c282f4139d902e5e9368f ****/
		%feature("compactdefaultargs") Plane;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSurf: Adaptor3d_Surface

Returns
-------
gp_Pln
") Plane;
		static gp_Pln Plane(const opencascade::handle<Adaptor3d_Surface> & theSurf);

		/****************** Sphere ******************/
		/**** md5 signature: 65542b788a7978c4d53b85508f7b7b04 ****/
		%feature("compactdefaultargs") Sphere;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSurf: Adaptor3d_Surface

Returns
-------
gp_Sphere
") Sphere;
		static gp_Sphere Sphere(const opencascade::handle<Adaptor3d_Surface> & theSurf);

		/****************** Torus ******************/
		/**** md5 signature: 501d3c96d8b60d053b3044bf8c2ccc47 ****/
		%feature("compactdefaultargs") Torus;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSurf: Adaptor3d_Surface

Returns
-------
gp_Torus
") Torus;
		static gp_Torus Torus(const opencascade::handle<Adaptor3d_Surface> & theSurf);

		/****************** UIntervals ******************/
		/**** md5 signature: f279ed888174d088294a26485fe4f7d2 ****/
		%feature("compactdefaultargs") UIntervals;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSurf: Adaptor3d_Surface
theTab: TColStd_Array1OfReal
theSh: GeomAbs_Shape

Returns
-------
None
") UIntervals;
		static void UIntervals(const opencascade::handle<Adaptor3d_Surface> & theSurf, TColStd_Array1OfReal & theTab, const GeomAbs_Shape theSh);

		/****************** UPeriod ******************/
		/**** md5 signature: 4aeb87257dacd4656faf037c69140a18 ****/
		%feature("compactdefaultargs") UPeriod;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSurf: Adaptor3d_Surface

Returns
-------
float
") UPeriod;
		static Standard_Real UPeriod(const opencascade::handle<Adaptor3d_Surface> & theSurf);

		/****************** UResolution ******************/
		/**** md5 signature: c6db1a9c95ce8de22a88509a6b426b1c ****/
		%feature("compactdefaultargs") UResolution;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSurf: Adaptor3d_Surface
theR3d: float

Returns
-------
float
") UResolution;
		static Standard_Real UResolution(const opencascade::handle<Adaptor3d_Surface> & theSurf, const Standard_Real theR3d);

		/****************** UTrim ******************/
		/**** md5 signature: 89490d90b4ba34479d131997cc0a14c7 ****/
		%feature("compactdefaultargs") UTrim;
		%feature("autodoc", "If <first> >= <last>.

Parameters
----------
theSurf: Adaptor3d_Surface
theFirst: float
theLast: float
theTol: float

Returns
-------
opencascade::handle<Adaptor3d_Surface>
") UTrim;
		static opencascade::handle<Adaptor3d_Surface> UTrim(const opencascade::handle<Adaptor3d_Surface> & theSurf, const Standard_Real theFirst, const Standard_Real theLast, const Standard_Real theTol);

		/****************** VIntervals ******************/
		/**** md5 signature: 57ded06c80e1ec6f84e74507a3d38d67 ****/
		%feature("compactdefaultargs") VIntervals;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSurf: Adaptor3d_Surface
theTab: TColStd_Array1OfReal
theSh: GeomAbs_Shape

Returns
-------
None
") VIntervals;
		static void VIntervals(const opencascade::handle<Adaptor3d_Surface> & theSurf, TColStd_Array1OfReal & theTab, const GeomAbs_Shape theSh);

		/****************** VPeriod ******************/
		/**** md5 signature: f67c9c307abb1d8d90b6594b6b0fbd1d ****/
		%feature("compactdefaultargs") VPeriod;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSurf: Adaptor3d_Surface

Returns
-------
float
") VPeriod;
		static Standard_Real VPeriod(const opencascade::handle<Adaptor3d_Surface> & theSurf);

		/****************** VResolution ******************/
		/**** md5 signature: f1bc46b0efcda3053b6da41b831f082f ****/
		%feature("compactdefaultargs") VResolution;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSurf: Adaptor3d_Surface
theR3d: float

Returns
-------
float
") VResolution;
		static Standard_Real VResolution(const opencascade::handle<Adaptor3d_Surface> & theSurf, const Standard_Real theR3d);

		/****************** VTrim ******************/
		/**** md5 signature: 3459ab4e01913199af1a74ede3ba1856 ****/
		%feature("compactdefaultargs") VTrim;
		%feature("autodoc", "If <first> >= <last>.

Parameters
----------
theSurf: Adaptor3d_Surface
theFirst: float
theLast: float
theTol: float

Returns
-------
opencascade::handle<Adaptor3d_Surface>
") VTrim;
		static opencascade::handle<Adaptor3d_Surface> VTrim(const opencascade::handle<Adaptor3d_Surface> & theSurf, const Standard_Real theFirst, const Standard_Real theLast, const Standard_Real theTol);

		/****************** Value ******************/
		/**** md5 signature: 84d566772d6b3b2e19370cd2b0f8b89c ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Parameters
----------
theSurf: Adaptor3d_Surface
theU: float
theV: float

Returns
-------
gp_Pnt
") Value;
		static gp_Pnt Value(const opencascade::handle<Adaptor3d_Surface> & theSurf, const Standard_Real theU, const Standard_Real theV);

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
		/****************** Adaptor3d_HVertex ******************/
		/**** md5 signature: eac58a1b58e0ece2155add6b7d6c9250 ****/
		%feature("compactdefaultargs") Adaptor3d_HVertex;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Adaptor3d_HVertex;
		 Adaptor3d_HVertex();

		/****************** Adaptor3d_HVertex ******************/
		/**** md5 signature: b8097197d4737b7cb21d79f7d8bd45d4 ****/
		%feature("compactdefaultargs") Adaptor3d_HVertex;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: gp_Pnt2d
Ori: TopAbs_Orientation
Resolution: float

Returns
-------
None
") Adaptor3d_HVertex;
		 Adaptor3d_HVertex(const gp_Pnt2d & P, const TopAbs_Orientation Ori, const Standard_Real Resolution);

		/****************** IsSame ******************/
		/**** md5 signature: f23854098e5a2c0e58714ff498a18027 ****/
		%feature("compactdefaultargs") IsSame;
		%feature("autodoc", "No available documentation.

Parameters
----------
Other: Adaptor3d_HVertex

Returns
-------
bool
") IsSame;
		virtual Standard_Boolean IsSame(const opencascade::handle<Adaptor3d_HVertex> & Other);

		/****************** Orientation ******************/
		/**** md5 signature: c985680b482f7598ebf61ff3db6ab594 ****/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "No available documentation.

Returns
-------
TopAbs_Orientation
") Orientation;
		virtual TopAbs_Orientation Orientation();

		/****************** Parameter ******************/
		/**** md5 signature: 20685a87d4a2fb9ff73f5a56e84880d4 ****/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Adaptor2d_Curve2d

Returns
-------
float
") Parameter;
		virtual Standard_Real Parameter(const opencascade::handle<Adaptor2d_Curve2d> & C);

		/****************** Resolution ******************/
		/**** md5 signature: ec6f3df4575cf3700b58ff4c13f33f75 ****/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "Parametric resolution (2d).

Parameters
----------
C: Adaptor2d_Curve2d

Returns
-------
float
") Resolution;
		virtual Standard_Real Resolution(const opencascade::handle<Adaptor2d_Curve2d> & C);

		/****************** Value ******************/
		/**** md5 signature: b163ee7405059c08236e9641cb63201d ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Pnt2d
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
		/****************** Adaptor3d_InterFunc ******************/
		/**** md5 signature: d6afc00bbf8d3cd088610834f216ab59 ****/
		%feature("compactdefaultargs") Adaptor3d_InterFunc;
		%feature("autodoc", "Build the function u(t)=fixval if fix =1 or v(t)=fixval if fix=2.

Parameters
----------
C: Adaptor2d_Curve2d
FixVal: float
Fix: int

Returns
-------
None
") Adaptor3d_InterFunc;
		 Adaptor3d_InterFunc(const opencascade::handle<Adaptor2d_Curve2d> & C, const Standard_Real FixVal, const Standard_Integer Fix);

		/****************** Derivative ******************/
		/**** md5 signature: 95e91729f1fb548d9a62f690b302c323 ****/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "Computes the derivative <d> of the function for the variable <x>. returns true if the calculation were successfully done, false otherwise.

Parameters
----------
X: float

Returns
-------
D: float
") Derivative;
		Standard_Boolean Derivative(const Standard_Real X, Standard_Real &OutValue);

		/****************** Value ******************/
		/**** md5 signature: 860bcc3da162e9f9f232f07518550196 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Computes the value <f>of the function for the variable <x>. returns true if the calculation were successfully done, false otherwise.

Parameters
----------
X: float

Returns
-------
F: float
") Value;
		Standard_Boolean Value(const Standard_Real X, Standard_Real &OutValue);

		/****************** Values ******************/
		/**** md5 signature: fd71eb9a1a2bd16185bbb032c3d29afc ****/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "Computes the value <f> and the derivative <d> of the function for the variable <x>. returns true if the calculation were successfully done, false otherwise.

Parameters
----------
X: float

Returns
-------
F: float
D: float
") Values;
		Standard_Boolean Values(const Standard_Real X, Standard_Real &OutValue, Standard_Real &OutValue);

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
		/****************** AxeOfRevolution ******************/
		/**** md5 signature: 3debc8f77289017ebe3fc26c5b0a7fde ****/
		%feature("compactdefaultargs") AxeOfRevolution;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Ax1
") AxeOfRevolution;
		virtual gp_Ax1 AxeOfRevolution();

		/****************** BSpline ******************/
		/**** md5 signature: 8782849eb7b84189e1fb34c968aef438 ****/
		%feature("compactdefaultargs") BSpline;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom_BSplineSurface>
") BSpline;
		virtual opencascade::handle<Geom_BSplineSurface> BSpline();

		/****************** BasisCurve ******************/
		/**** md5 signature: 99c15a8a36ba096c01e3a30ab92fff44 ****/
		%feature("compactdefaultargs") BasisCurve;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Adaptor3d_Curve>
") BasisCurve;
		virtual opencascade::handle<Adaptor3d_Curve> BasisCurve();

		/****************** BasisSurface ******************/
		/**** md5 signature: 530983a0f32601b5771bf2a2dc2ae5d1 ****/
		%feature("compactdefaultargs") BasisSurface;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Adaptor3d_Surface>
") BasisSurface;
		virtual opencascade::handle<Adaptor3d_Surface> BasisSurface();

		/****************** Bezier ******************/
		/**** md5 signature: 46959653edaff049efd779790fb904a6 ****/
		%feature("compactdefaultargs") Bezier;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom_BezierSurface>
") Bezier;
		virtual opencascade::handle<Geom_BezierSurface> Bezier();

		/****************** Cone ******************/
		/**** md5 signature: b31d0ac73f9470a65ea707968772eae6 ****/
		%feature("compactdefaultargs") Cone;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Cone
") Cone;
		virtual gp_Cone Cone();

		/****************** Cylinder ******************/
		/**** md5 signature: a4f845f2a6611b82f64b6852242a95c6 ****/
		%feature("compactdefaultargs") Cylinder;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Cylinder
") Cylinder;
		virtual gp_Cylinder Cylinder();

		/****************** D0 ******************/
		/**** md5 signature: 8f923a57ca8ceff3aab5a02bea8d5f12 ****/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "Computes the point of parameters u,v on the surface.

Parameters
----------
U: float
V: float
P: gp_Pnt

Returns
-------
None
") D0;
		virtual void D0(const Standard_Real U, const Standard_Real V, gp_Pnt & P);

		/****************** D1 ******************/
		/**** md5 signature: 35469e629742699989c5c1b8606a25fd ****/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "Computes the point and the first derivatives on the surface. raised if the continuity of the current intervals is not c1. //! tip: use geomlib::normestim() to calculate surface normal at specified (u, v) point.

Parameters
----------
U: float
V: float
P: gp_Pnt
D1U: gp_Vec
D1V: gp_Vec

Returns
-------
None
") D1;
		virtual void D1(const Standard_Real U, const Standard_Real V, gp_Pnt & P, gp_Vec & D1U, gp_Vec & D1V);

		/****************** D2 ******************/
		/**** md5 signature: 74bb864108093f2d81c871ea0acee116 ****/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "Computes the point, the first and second derivatives on the surface. raised if the continuity of the current intervals is not c2.

Parameters
----------
U: float
V: float
P: gp_Pnt
D1U: gp_Vec
D1V: gp_Vec
D2U: gp_Vec
D2V: gp_Vec
D2UV: gp_Vec

Returns
-------
None
") D2;
		virtual void D2(const Standard_Real U, const Standard_Real V, gp_Pnt & P, gp_Vec & D1U, gp_Vec & D1V, gp_Vec & D2U, gp_Vec & D2V, gp_Vec & D2UV);

		/****************** D3 ******************/
		/**** md5 signature: 508c3f845e4a876a074039e7919851f4 ****/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "Computes the point, the first, second and third derivatives on the surface. raised if the continuity of the current intervals is not c3.

Parameters
----------
U: float
V: float
P: gp_Pnt
D1U: gp_Vec
D1V: gp_Vec
D2U: gp_Vec
D2V: gp_Vec
D2UV: gp_Vec
D3U: gp_Vec
D3V: gp_Vec
D3UUV: gp_Vec
D3UVV: gp_Vec

Returns
-------
None
") D3;
		virtual void D3(const Standard_Real U, const Standard_Real V, gp_Pnt & P, gp_Vec & D1U, gp_Vec & D1V, gp_Vec & D2U, gp_Vec & D2V, gp_Vec & D2UV, gp_Vec & D3U, gp_Vec & D3V, gp_Vec & D3UUV, gp_Vec & D3UVV);

		/****************** DN ******************/
		/**** md5 signature: 90d6ef938b4ef7a56483bf904c51a1a8 ****/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "Computes the derivative of order nu in the direction u and nv in the direction v at the point p(u, v). raised if the current u interval is not not cnu and the current v interval is not cnv. raised if nu + nv < 1 or nu < 0 or nv < 0.

Parameters
----------
U: float
V: float
Nu: int
Nv: int

Returns
-------
gp_Vec
") DN;
		virtual gp_Vec DN(const Standard_Real U, const Standard_Real V, const Standard_Integer Nu, const Standard_Integer Nv);

		/****************** Direction ******************/
		/**** md5 signature: 50eb80ad6a4d551e2cfbf73fe32bbfa8 ****/
		%feature("compactdefaultargs") Direction;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Dir
") Direction;
		virtual gp_Dir Direction();

		/****************** FirstUParameter ******************/
		/**** md5 signature: 9f096cb45fc2a40a442b3b2353b81fbb ****/
		%feature("compactdefaultargs") FirstUParameter;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") FirstUParameter;
		virtual Standard_Real FirstUParameter();

		/****************** FirstVParameter ******************/
		/**** md5 signature: 8340035b2368d72a37ea6eae3b1a363d ****/
		%feature("compactdefaultargs") FirstVParameter;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") FirstVParameter;
		virtual Standard_Real FirstVParameter();

		/****************** GetType ******************/
		/**** md5 signature: 488899158a40114032119920bcbe6d69 ****/
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "Returns the type of the surface : plane, cylinder, cone, sphere, torus, beziersurface, bsplinesurface, surfaceofrevolution, surfaceofextrusion, othersurface.

Returns
-------
GeomAbs_SurfaceType
") GetType;
		virtual GeomAbs_SurfaceType GetType();

		/****************** IsUClosed ******************/
		/**** md5 signature: e8a70695ac5408e96548fcba7d28a395 ****/
		%feature("compactdefaultargs") IsUClosed;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsUClosed;
		virtual Standard_Boolean IsUClosed();

		/****************** IsUPeriodic ******************/
		/**** md5 signature: 9d4b893bb8b451d02be4c61ddc985b6f ****/
		%feature("compactdefaultargs") IsUPeriodic;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsUPeriodic;
		virtual Standard_Boolean IsUPeriodic();

		/****************** IsURational ******************/
		/**** md5 signature: 98b0228d6ecbcd4b9af2be5d094f411b ****/
		%feature("compactdefaultargs") IsURational;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsURational;
		virtual Standard_Boolean IsURational();

		/****************** IsVClosed ******************/
		/**** md5 signature: da82351c635dac1ca8aa7073075606ab ****/
		%feature("compactdefaultargs") IsVClosed;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsVClosed;
		virtual Standard_Boolean IsVClosed();

		/****************** IsVPeriodic ******************/
		/**** md5 signature: 4fc2bb80a34d1bca3a757ab95e92ad20 ****/
		%feature("compactdefaultargs") IsVPeriodic;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsVPeriodic;
		virtual Standard_Boolean IsVPeriodic();

		/****************** IsVRational ******************/
		/**** md5 signature: b78ede066dfcf5f30f85b3fdc92ebee2 ****/
		%feature("compactdefaultargs") IsVRational;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsVRational;
		virtual Standard_Boolean IsVRational();

		/****************** LastUParameter ******************/
		/**** md5 signature: 292da90d07338ad25c177c2fa028d14b ****/
		%feature("compactdefaultargs") LastUParameter;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") LastUParameter;
		virtual Standard_Real LastUParameter();

		/****************** LastVParameter ******************/
		/**** md5 signature: fe2a75a2531511d2ada9a247cd4ccf4b ****/
		%feature("compactdefaultargs") LastVParameter;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") LastVParameter;
		virtual Standard_Real LastVParameter();

		/****************** NbUIntervals ******************/
		/**** md5 signature: 3f9b4bb4318cf4eb75b5fc6022bec51c ****/
		%feature("compactdefaultargs") NbUIntervals;
		%feature("autodoc", "Returns the number of u intervals for continuity <s>. may be one if ucontinuity(me) >= <s>.

Parameters
----------
S: GeomAbs_Shape

Returns
-------
int
") NbUIntervals;
		virtual Standard_Integer NbUIntervals(const GeomAbs_Shape S);

		/****************** NbUKnots ******************/
		/**** md5 signature: 7a1c0895759d5e9cddda277e4036d7a2 ****/
		%feature("compactdefaultargs") NbUKnots;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbUKnots;
		virtual Standard_Integer NbUKnots();

		/****************** NbUPoles ******************/
		/**** md5 signature: 49425c131d5bbf51ecbf25f256eb3893 ****/
		%feature("compactdefaultargs") NbUPoles;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbUPoles;
		virtual Standard_Integer NbUPoles();

		/****************** NbVIntervals ******************/
		/**** md5 signature: c612588f13518c121daaa98c7187c5dd ****/
		%feature("compactdefaultargs") NbVIntervals;
		%feature("autodoc", "Returns the number of v intervals for continuity <s>. may be one if vcontinuity(me) >= <s>.

Parameters
----------
S: GeomAbs_Shape

Returns
-------
int
") NbVIntervals;
		virtual Standard_Integer NbVIntervals(const GeomAbs_Shape S);

		/****************** NbVKnots ******************/
		/**** md5 signature: 056eba7e2948215fc1920f79773a07b7 ****/
		%feature("compactdefaultargs") NbVKnots;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbVKnots;
		virtual Standard_Integer NbVKnots();

		/****************** NbVPoles ******************/
		/**** md5 signature: 27419519071863c30fa7e303bf9714b1 ****/
		%feature("compactdefaultargs") NbVPoles;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbVPoles;
		virtual Standard_Integer NbVPoles();

		/****************** OffsetValue ******************/
		/**** md5 signature: 668f7151c7b3b100446406f1c2b0b2e9 ****/
		%feature("compactdefaultargs") OffsetValue;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") OffsetValue;
		virtual Standard_Real OffsetValue();

		/****************** Plane ******************/
		/**** md5 signature: ae2ef8a7cc00a3678c001f660e5e87af ****/
		%feature("compactdefaultargs") Plane;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Pln
") Plane;
		virtual gp_Pln Plane();

		/****************** Sphere ******************/
		/**** md5 signature: cc119d9c2d6769252e8f267250b5802d ****/
		%feature("compactdefaultargs") Sphere;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Sphere
") Sphere;
		virtual gp_Sphere Sphere();

		/****************** Torus ******************/
		/**** md5 signature: d9bc77c59c8537a8319376aa7df09ccd ****/
		%feature("compactdefaultargs") Torus;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Torus
") Torus;
		virtual gp_Torus Torus();

		/****************** UContinuity ******************/
		/**** md5 signature: 77ad7bb6fa9eb6fee5117117dc1ac55d ****/
		%feature("compactdefaultargs") UContinuity;
		%feature("autodoc", "No available documentation.

Returns
-------
GeomAbs_Shape
") UContinuity;
		virtual GeomAbs_Shape UContinuity();

		/****************** UDegree ******************/
		/**** md5 signature: 5deb29548a36c721198fed8800d06830 ****/
		%feature("compactdefaultargs") UDegree;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") UDegree;
		virtual Standard_Integer UDegree();

		/****************** UIntervals ******************/
		/**** md5 signature: b593cc9a16bcef9f9aa90ee2aec21589 ****/
		%feature("compactdefaultargs") UIntervals;
		%feature("autodoc", "Returns the intervals with the requested continuity in the u direction.

Parameters
----------
T: TColStd_Array1OfReal
S: GeomAbs_Shape

Returns
-------
None
") UIntervals;
		virtual void UIntervals(TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****************** UPeriod ******************/
		/**** md5 signature: b5a8af3fdd028670ffc618d509b562aa ****/
		%feature("compactdefaultargs") UPeriod;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") UPeriod;
		virtual Standard_Real UPeriod();

		/****************** UResolution ******************/
		/**** md5 signature: 47eb7fe0f86b388ef7c61b75143d68fd ****/
		%feature("compactdefaultargs") UResolution;
		%feature("autodoc", "Returns the parametric u resolution corresponding to the real space resolution <r3d>.

Parameters
----------
R3d: float

Returns
-------
float
") UResolution;
		virtual Standard_Real UResolution(const Standard_Real R3d);

		/****************** UTrim ******************/
		/**** md5 signature: c37e4851cad3cfe0fd1be5953bcbb1dc ****/
		%feature("compactdefaultargs") UTrim;
		%feature("autodoc", "Returns a surface trimmed in the u direction equivalent of <self> between parameters <first> and <last>. <tol> is used to test for 3d points confusion. if <first> >= <last>.

Parameters
----------
First: float
Last: float
Tol: float

Returns
-------
opencascade::handle<Adaptor3d_Surface>
") UTrim;
		virtual opencascade::handle<Adaptor3d_Surface> UTrim(const Standard_Real First, const Standard_Real Last, const Standard_Real Tol);

		/****************** VContinuity ******************/
		/**** md5 signature: d072bc9a7996d58b53b4d1e10a7f1999 ****/
		%feature("compactdefaultargs") VContinuity;
		%feature("autodoc", "No available documentation.

Returns
-------
GeomAbs_Shape
") VContinuity;
		virtual GeomAbs_Shape VContinuity();

		/****************** VDegree ******************/
		/**** md5 signature: 1fa8f8863980920be56d3f9b30ac2667 ****/
		%feature("compactdefaultargs") VDegree;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") VDegree;
		virtual Standard_Integer VDegree();

		/****************** VIntervals ******************/
		/**** md5 signature: 391c756d3f528314e59ebde11c556497 ****/
		%feature("compactdefaultargs") VIntervals;
		%feature("autodoc", "Returns the intervals with the requested continuity in the v direction.

Parameters
----------
T: TColStd_Array1OfReal
S: GeomAbs_Shape

Returns
-------
None
") VIntervals;
		virtual void VIntervals(TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****************** VPeriod ******************/
		/**** md5 signature: aaa8f393a9608b88a2a3f8c8043833cb ****/
		%feature("compactdefaultargs") VPeriod;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") VPeriod;
		virtual Standard_Real VPeriod();

		/****************** VResolution ******************/
		/**** md5 signature: 24d123fbb93e57d711b320c4e0431f2a ****/
		%feature("compactdefaultargs") VResolution;
		%feature("autodoc", "Returns the parametric v resolution corresponding to the real space resolution <r3d>.

Parameters
----------
R3d: float

Returns
-------
float
") VResolution;
		virtual Standard_Real VResolution(const Standard_Real R3d);

		/****************** VTrim ******************/
		/**** md5 signature: feea2421d912ddae74778d2b21c61475 ****/
		%feature("compactdefaultargs") VTrim;
		%feature("autodoc", "Returns a surface trimmed in the v direction between parameters <first> and <last>. <tol> is used to test for 3d points confusion. if <first> >= <last>.

Parameters
----------
First: float
Last: float
Tol: float

Returns
-------
opencascade::handle<Adaptor3d_Surface>
") VTrim;
		virtual opencascade::handle<Adaptor3d_Surface> VTrim(const Standard_Real First, const Standard_Real Last, const Standard_Real Tol);

		/****************** Value ******************/
		/**** md5 signature: 86112fa27918493b04ce20ef2fcddd47 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Computes the point of parameters u,v on the surface. tip: use geomlib::normestim() to calculate surface normal at specified (u, v) point.

Parameters
----------
U: float
V: float

Returns
-------
gp_Pnt
") Value;
		virtual gp_Pnt Value(const Standard_Real U, const Standard_Real V);

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
		/****************** Adaptor3d_TopolTool ******************/
		/**** md5 signature: aa825ed0136d2875577bee7eaf4b157c ****/
		%feature("compactdefaultargs") Adaptor3d_TopolTool;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Adaptor3d_TopolTool;
		 Adaptor3d_TopolTool();

		/****************** Adaptor3d_TopolTool ******************/
		/**** md5 signature: ab0a135902966159ae926769ffdb7052 ****/
		%feature("compactdefaultargs") Adaptor3d_TopolTool;
		%feature("autodoc", "No available documentation.

Parameters
----------
Surface: Adaptor3d_Surface

Returns
-------
None
") Adaptor3d_TopolTool;
		 Adaptor3d_TopolTool(const opencascade::handle<Adaptor3d_Surface> & Surface);

		/****************** BSplSamplePnts ******************/
		/**** md5 signature: 6903f238d66cf388d6121d16fc28d803 ****/
		%feature("compactdefaultargs") BSplSamplePnts;
		%feature("autodoc", "Compute the sample-points for the intersections algorithms by adaptive algorithm for bspline surfaces - is used in samplepnts @param thedefl [in] required deflection @param thenumin [in] minimal nb points for u @param thenvmin [in] minimal nb points for v.

Parameters
----------
theDefl: float
theNUmin: int
theNVmin: int

Returns
-------
None
") BSplSamplePnts;
		virtual void BSplSamplePnts(const Standard_Real theDefl, const Standard_Integer theNUmin, const Standard_Integer theNVmin);

		/****************** Classify ******************/
		/**** md5 signature: c8c5dc96886d407d270064b81c56f4cf ****/
		%feature("compactdefaultargs") Classify;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: gp_Pnt2d
Tol: float
ReacdreOnPeriodic: bool,optional
	default value is Standard_True

Returns
-------
TopAbs_State
") Classify;
		virtual TopAbs_State Classify(const gp_Pnt2d & P, const Standard_Real Tol, const Standard_Boolean ReacdreOnPeriodic = Standard_True);

		/****************** ComputeSamplePoints ******************/
		/**** md5 signature: 23fc57af64fa6b59fefe18fa9084fa69 ****/
		%feature("compactdefaultargs") ComputeSamplePoints;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") ComputeSamplePoints;
		virtual void ComputeSamplePoints();

		/****************** DomainIsInfinite ******************/
		/**** md5 signature: 6d41c776a0aa728b4d318a59f43aa974 ****/
		%feature("compactdefaultargs") DomainIsInfinite;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") DomainIsInfinite;
		virtual Standard_Boolean DomainIsInfinite();

		/****************** Edge ******************/
		/**** md5 signature: 714bd83d54f0cbd20920648bb51520ec ****/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "No available documentation.

Returns
-------
Standard_Address
") Edge;
		virtual Standard_Address Edge();

		/****************** GetConeApexParam ******************/
		/**** md5 signature: 8be4fd6f665527c4e6b570e1d3c513af ****/
		%feature("compactdefaultargs") GetConeApexParam;
		%feature("autodoc", "Computes the cone's apex parameters. @param[in] thec conical surface @param[in] theu u parameter of cone's apex @param[in] thev v parameter of cone's apex.

Parameters
----------
theC: gp_Cone

Returns
-------
theU: float
theV: float
") GetConeApexParam;
		static void GetConeApexParam(const gp_Cone & theC, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Has3d ******************/
		/**** md5 signature: e26db380d8c3401e2b00bbdf4f01fa61 ****/
		%feature("compactdefaultargs") Has3d;
		%feature("autodoc", "Answers if arcs and vertices may have 3d representations, so that we could use tol3d and pnt methods.

Returns
-------
bool
") Has3d;
		virtual Standard_Boolean Has3d();

		/****************** Identical ******************/
		/**** md5 signature: cfa27a5dfaa8508af97ba96a7ec6e21b ****/
		%feature("compactdefaultargs") Identical;
		%feature("autodoc", "Returns true if the vertices v1 and v2 are identical. this method does not take the orientation of the vertices in account.

Parameters
----------
V1: Adaptor3d_HVertex
V2: Adaptor3d_HVertex

Returns
-------
bool
") Identical;
		virtual Standard_Boolean Identical(const opencascade::handle<Adaptor3d_HVertex> & V1, const opencascade::handle<Adaptor3d_HVertex> & V2);

		/****************** Init ******************/
		/**** md5 signature: 2f96d79a31287a19717a3642c1e9b28c ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Init;
		virtual void Init();

		/****************** InitVertexIterator ******************/
		/**** md5 signature: 30be0f0057566eace0f6ff06b5235ec5 ****/
		%feature("compactdefaultargs") InitVertexIterator;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") InitVertexIterator;
		virtual void InitVertexIterator();

		/****************** Initialize ******************/
		/**** md5 signature: 6a5837327bc1f6a299aa49b49efb0b51 ****/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Initialize;
		virtual void Initialize();

		/****************** Initialize ******************/
		/**** md5 signature: faffacbbf54c7a186e23fb682d81e648 ****/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: Adaptor3d_Surface

Returns
-------
None
") Initialize;
		virtual void Initialize(const opencascade::handle<Adaptor3d_Surface> & S);

		/****************** Initialize ******************/
		/**** md5 signature: 20b22aee7c221a24f9ddddb5f04f3ad2 ****/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "No available documentation.

Parameters
----------
Curve: Adaptor2d_Curve2d

Returns
-------
None
") Initialize;
		virtual void Initialize(const opencascade::handle<Adaptor2d_Curve2d> & Curve);

		/****************** IsThePointOn ******************/
		/**** md5 signature: 28addf6263169f07c643732d758cdb38 ****/
		%feature("compactdefaultargs") IsThePointOn;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: gp_Pnt2d
Tol: float
ReacdreOnPeriodic: bool,optional
	default value is Standard_True

Returns
-------
bool
") IsThePointOn;
		virtual Standard_Boolean IsThePointOn(const gp_Pnt2d & P, const Standard_Real Tol, const Standard_Boolean ReacdreOnPeriodic = Standard_True);

		/****************** IsUniformSampling ******************/
		/**** md5 signature: 65a63313e56102fef767c73e6c7f9956 ****/
		%feature("compactdefaultargs") IsUniformSampling;
		%feature("autodoc", "Returns true if provide uniform sampling of points.

Returns
-------
bool
") IsUniformSampling;
		virtual Standard_Boolean IsUniformSampling();

		/****************** More ******************/
		/**** md5 signature: e821632af8361f06a178b6ca19f5020e ****/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") More;
		virtual Standard_Boolean More();

		/****************** MoreVertex ******************/
		/**** md5 signature: a8b43dc9585a890721f120d7a26ec923 ****/
		%feature("compactdefaultargs") MoreVertex;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") MoreVertex;
		virtual Standard_Boolean MoreVertex();

		/****************** NbSamples ******************/
		/**** md5 signature: 67b66476ff5b3d26402ec88a76db99c8 ****/
		%feature("compactdefaultargs") NbSamples;
		%feature("autodoc", "Compute the sample-points for the intersections algorithms.

Returns
-------
int
") NbSamples;
		virtual Standard_Integer NbSamples();

		/****************** NbSamplesU ******************/
		/**** md5 signature: a8a639849a6476b7e06a072e6ce378ca ****/
		%feature("compactdefaultargs") NbSamplesU;
		%feature("autodoc", "Compute the sample-points for the intersections algorithms.

Returns
-------
int
") NbSamplesU;
		virtual Standard_Integer NbSamplesU();

		/****************** NbSamplesV ******************/
		/**** md5 signature: fe0cfaa8ce33377585fa9145b0af8a01 ****/
		%feature("compactdefaultargs") NbSamplesV;
		%feature("autodoc", "Compute the sample-points for the intersections algorithms.

Returns
-------
int
") NbSamplesV;
		virtual Standard_Integer NbSamplesV();

		/****************** Next ******************/
		/**** md5 signature: 73141d627b33e5b89ace1d498cedfc52 ****/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Next;
		virtual void Next();

		/****************** NextVertex ******************/
		/**** md5 signature: 965ea8fa3abffe2964338c5b0ad5701c ****/
		%feature("compactdefaultargs") NextVertex;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") NextVertex;
		virtual void NextVertex();

		/****************** Orientation ******************/
		/**** md5 signature: 2ec1f29b131dd0ba8f7295bc408c863d ****/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "If the function returns the orientation of the arc. if the orientation is forward or reversed, the arc is a 'real' limit of the surface. if the orientation is internal or external, the arc is considered as an arc on the surface.

Parameters
----------
C: Adaptor2d_Curve2d

Returns
-------
TopAbs_Orientation
") Orientation;
		virtual TopAbs_Orientation Orientation(const opencascade::handle<Adaptor2d_Curve2d> & C);

		/****************** Orientation ******************/
		/**** md5 signature: b97399854b9802139edc16aa1fd0c067 ****/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "Returns the orientation of the vertex v. the vertex has been found with an exploration on a given arc. the orientation is the orientation of the vertex on this arc.

Parameters
----------
V: Adaptor3d_HVertex

Returns
-------
TopAbs_Orientation
") Orientation;
		virtual TopAbs_Orientation Orientation(const opencascade::handle<Adaptor3d_HVertex> & V);

		/****************** Pnt ******************/
		/**** md5 signature: f39649c498746c92e9e0e5c9f69ca51e ****/
		%feature("compactdefaultargs") Pnt;
		%feature("autodoc", "Returns 3d point of the vertex v.

Parameters
----------
V: Adaptor3d_HVertex

Returns
-------
gp_Pnt
") Pnt;
		virtual gp_Pnt Pnt(const opencascade::handle<Adaptor3d_HVertex> & V);

		/****************** SamplePnts ******************/
		/**** md5 signature: cb1bbdcdfeca14f92fa49d557a8ab965 ****/
		%feature("compactdefaultargs") SamplePnts;
		%feature("autodoc", "Compute the sample-points for the intersections algorithms by adaptive algorithm for bspline surfaces. for other surfaces algorithm is the same as in method computesamplepoints(), but only fill arrays of u and v sample parameters; @param thedefl [in] a required deflection @param thenumin [in] minimal nb points for u @param thenvmin [in] minimal nb points for v.

Parameters
----------
theDefl: float
theNUmin: int
theNVmin: int

Returns
-------
None
") SamplePnts;
		virtual void SamplePnts(const Standard_Real theDefl, const Standard_Integer theNUmin, const Standard_Integer theNVmin);

		/****************** SamplePoint ******************/
		/**** md5 signature: fa80c305164d2e62ffe8cb0ec7643678 ****/
		%feature("compactdefaultargs") SamplePoint;
		%feature("autodoc", "No available documentation.

Parameters
----------
Index: int
P2d: gp_Pnt2d
P3d: gp_Pnt

Returns
-------
None
") SamplePoint;
		virtual void SamplePoint(const Standard_Integer Index, gp_Pnt2d & P2d, gp_Pnt & P3d);

		/****************** Tol3d ******************/
		/**** md5 signature: ca38e336a92c0a050652dac5bd784e6b ****/
		%feature("compactdefaultargs") Tol3d;
		%feature("autodoc", "Returns 3d tolerance of the arc c.

Parameters
----------
C: Adaptor2d_Curve2d

Returns
-------
float
") Tol3d;
		virtual Standard_Real Tol3d(const opencascade::handle<Adaptor2d_Curve2d> & C);

		/****************** Tol3d ******************/
		/**** md5 signature: e2e5362802ebc0fb247e0d27af1a66c7 ****/
		%feature("compactdefaultargs") Tol3d;
		%feature("autodoc", "Returns 3d tolerance of the vertex v.

Parameters
----------
V: Adaptor3d_HVertex

Returns
-------
float
") Tol3d;
		virtual Standard_Real Tol3d(const opencascade::handle<Adaptor3d_HVertex> & V);

		/****************** UParameters ******************/
		/**** md5 signature: ca8708c5011ae09ddc342ec3e782fcd0 ****/
		%feature("compactdefaultargs") UParameters;
		%feature("autodoc", "Return the set of u parameters on the surface obtained by the method samplepnts.

Parameters
----------
theArray: TColStd_Array1OfReal

Returns
-------
None
") UParameters;
		void UParameters(TColStd_Array1OfReal & theArray);

		/****************** VParameters ******************/
		/**** md5 signature: 7d86a95e3c8948209ccc18ec9e74b2ce ****/
		%feature("compactdefaultargs") VParameters;
		%feature("autodoc", "Return the set of v parameters on the surface obtained by the method samplepnts.

Parameters
----------
theArray: TColStd_Array1OfReal

Returns
-------
None
") VParameters;
		void VParameters(TColStd_Array1OfReal & theArray);

		/****************** Value ******************/
		/**** md5 signature: 69341486cc398dcbf57c11fda47f97ca ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Adaptor2d_Curve2d>
") Value;
		virtual opencascade::handle<Adaptor2d_Curve2d> Value();

		/****************** Vertex ******************/
		/**** md5 signature: 5fa61bdbc5145c1abf55279009e1141b ****/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Adaptor3d_HVertex>
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
		/****************** Adaptor3d_CurveOnSurface ******************/
		/**** md5 signature: 6b7eb8b8fde65fd79c0e562453b0df89 ****/
		%feature("compactdefaultargs") Adaptor3d_CurveOnSurface;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Adaptor3d_CurveOnSurface;
		 Adaptor3d_CurveOnSurface();

		/****************** Adaptor3d_CurveOnSurface ******************/
		/**** md5 signature: 43855c057bcf63a011b7ed029a6545e6 ****/
		%feature("compactdefaultargs") Adaptor3d_CurveOnSurface;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: Adaptor3d_Surface

Returns
-------
None
") Adaptor3d_CurveOnSurface;
		 Adaptor3d_CurveOnSurface(const opencascade::handle<Adaptor3d_Surface> & S);

		/****************** Adaptor3d_CurveOnSurface ******************/
		/**** md5 signature: b05d3f0d46c0fd08ffcffadc70a4838b ****/
		%feature("compactdefaultargs") Adaptor3d_CurveOnSurface;
		%feature("autodoc", "Creates a curveonsurface from the 2d curve <c> and the surface <s>.

Parameters
----------
C: Adaptor2d_Curve2d
S: Adaptor3d_Surface

Returns
-------
None
") Adaptor3d_CurveOnSurface;
		 Adaptor3d_CurveOnSurface(const opencascade::handle<Adaptor2d_Curve2d> & C, const opencascade::handle<Adaptor3d_Surface> & S);

		/****************** BSpline ******************/
		/**** md5 signature: 3ccc0d851302bffb5de6344e3eb3e58d ****/
		%feature("compactdefaultargs") BSpline;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom_BSplineCurve>
") BSpline;
		opencascade::handle<Geom_BSplineCurve> BSpline();

		/****************** Bezier ******************/
		/**** md5 signature: 092280fc6ee0e7104fbbe3460d73e83c ****/
		%feature("compactdefaultargs") Bezier;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom_BezierCurve>
") Bezier;
		opencascade::handle<Geom_BezierCurve> Bezier();

		/****************** ChangeCurve ******************/
		/**** md5 signature: 0751d1f9e5791d4ab52f473cba6aa712 ****/
		%feature("compactdefaultargs") ChangeCurve;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Adaptor2d_Curve2d>
") ChangeCurve;
		opencascade::handle<Adaptor2d_Curve2d> & ChangeCurve();

		/****************** ChangeSurface ******************/
		/**** md5 signature: b8c30fe30999884649c5e492e4d3ae1b ****/
		%feature("compactdefaultargs") ChangeSurface;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Adaptor3d_Surface>
") ChangeSurface;
		opencascade::handle<Adaptor3d_Surface> & ChangeSurface();

		/****************** Circle ******************/
		/**** md5 signature: 5f382e7a6af009845ea6e16d54814298 ****/
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Circ
") Circle;
		gp_Circ Circle();

		/****************** Continuity ******************/
		/**** md5 signature: 9381b370dfdd50af7f1b79ce202f0c6f ****/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "No available documentation.

Returns
-------
GeomAbs_Shape
") Continuity;
		GeomAbs_Shape Continuity();

		/****************** D0 ******************/
		/**** md5 signature: 5f7d08d8d17afc516aac9ef64bf9711f ****/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "Computes the point of parameter u on the curve.

Parameters
----------
U: float
P: gp_Pnt

Returns
-------
None
") D0;
		void D0(const Standard_Real U, gp_Pnt & P);

		/****************** D1 ******************/
		/**** md5 signature: 1dc830ec49a945a61cde5e5c027b78d7 ****/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "Computes the point of parameter u on the curve with its first derivative. raised if the continuity of the current interval is not c1.

Parameters
----------
U: float
P: gp_Pnt
V: gp_Vec

Returns
-------
None
") D1;
		void D1(const Standard_Real U, gp_Pnt & P, gp_Vec & V);

		/****************** D2 ******************/
		/**** md5 signature: a694b4ba68c0fd83fbac79f945cb5d8c ****/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "Returns the point p of parameter u, the first and second derivatives v1 and v2. raised if the continuity of the current interval is not c2.

Parameters
----------
U: float
P: gp_Pnt
V1: gp_Vec
V2: gp_Vec

Returns
-------
None
") D2;
		void D2(const Standard_Real U, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2);

		/****************** D3 ******************/
		/**** md5 signature: cf1c3b5fe7af9d5c183c1b16b21c43f1 ****/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "Returns the point p of parameter u, the first, the second and the third derivative. raised if the continuity of the current interval is not c3.

Parameters
----------
U: float
P: gp_Pnt
V1: gp_Vec
V2: gp_Vec
V3: gp_Vec

Returns
-------
None
") D3;
		void D3(const Standard_Real U, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2, gp_Vec & V3);

		/****************** DN ******************/
		/**** md5 signature: 0d4a3e2fc2b4b03d2a49e0796a487efb ****/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "The returned vector gives the value of the derivative for the order of derivation n. raised if the continuity of the current interval is not cn. raised if n < 1.

Parameters
----------
U: float
N: int

Returns
-------
gp_Vec
") DN;
		gp_Vec DN(const Standard_Real U, const Standard_Integer N);

		/****************** Degree ******************/
		/**** md5 signature: 5ce473e72cc7bb935a667f4c839dab09 ****/
		%feature("compactdefaultargs") Degree;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") Degree;
		Standard_Integer Degree();

		/****************** Ellipse ******************/
		/**** md5 signature: e9a77f14e9bbca29370202de404ea9c1 ****/
		%feature("compactdefaultargs") Ellipse;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Elips
") Ellipse;
		gp_Elips Ellipse();

		/****************** FirstParameter ******************/
		/**** md5 signature: eb9ebe94572bd67588fe8811eac261fb ****/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") FirstParameter;
		Standard_Real FirstParameter();

		/****************** GetCurve ******************/
		/**** md5 signature: 59faf580a052d0534228f92dbc8fa8ec ****/
		%feature("compactdefaultargs") GetCurve;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Adaptor2d_Curve2d>
") GetCurve;
		const opencascade::handle<Adaptor2d_Curve2d> & GetCurve();

		/****************** GetSurface ******************/
		/**** md5 signature: 56dff0248d5d8fc9e2bd341c8dad1556 ****/
		%feature("compactdefaultargs") GetSurface;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Adaptor3d_Surface>
") GetSurface;
		const opencascade::handle<Adaptor3d_Surface> & GetSurface();

		/****************** GetType ******************/
		/**** md5 signature: 0ad61dcbb5497908c1b536e766f0fcb9 ****/
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "Returns the type of the curve in the current interval : line, circle, ellipse, hyperbola, parabola, beziercurve, bsplinecurve, othercurve.

Returns
-------
GeomAbs_CurveType
") GetType;
		GeomAbs_CurveType GetType();

		/****************** Hyperbola ******************/
		/**** md5 signature: a96ca49b2ad017b35bb09d0b86cb690d ****/
		%feature("compactdefaultargs") Hyperbola;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Hypr
") Hyperbola;
		gp_Hypr Hyperbola();

		/****************** Intervals ******************/
		/**** md5 signature: fc573cb56cf1a9c05ee189fd913ff6f5 ****/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "Stores in <t> the parameters bounding the intervals of continuity <s>. //! the array must provide enough room to accommodate for the parameters. i.e. t.length() > nbintervals().

Parameters
----------
T: TColStd_Array1OfReal
S: GeomAbs_Shape

Returns
-------
None
") Intervals;
		void Intervals(TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****************** IsClosed ******************/
		/**** md5 signature: 00978070ec4cb5f00d1d002a8d5d3763 ****/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsClosed;
		Standard_Boolean IsClosed();

		/****************** IsPeriodic ******************/
		/**** md5 signature: 15e3ccfd3ad4ae42959489f7f64aa8ca ****/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsPeriodic;
		Standard_Boolean IsPeriodic();

		/****************** IsRational ******************/
		/**** md5 signature: 82ca56fad113156125f40128b25c0d8e ****/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsRational;
		Standard_Boolean IsRational();

		/****************** LastParameter ******************/
		/**** md5 signature: cb4925a2d4a451ceec8f6ad486530f9c ****/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") LastParameter;
		Standard_Real LastParameter();

		/****************** Line ******************/
		/**** md5 signature: cf28f5541e4e744dd8038e2a9ac75a8f ****/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Lin
") Line;
		gp_Lin Line();

		/****************** Load ******************/
		/**** md5 signature: 5fdedc45f7f3e3286603c8152dd5d5ba ****/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "Changes the surface.

Parameters
----------
S: Adaptor3d_Surface

Returns
-------
None
") Load;
		void Load(const opencascade::handle<Adaptor3d_Surface> & S);

		/****************** Load ******************/
		/**** md5 signature: ddca440597e53b1ed736274984f99921 ****/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "Changes the 2d curve.

Parameters
----------
C: Adaptor2d_Curve2d

Returns
-------
None
") Load;
		void Load(const opencascade::handle<Adaptor2d_Curve2d> & C);

		/****************** Load ******************/
		/**** md5 signature: 30aac2c787964491ce82a24360e0e4be ****/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "Load both curve and surface.

Parameters
----------
C: Adaptor2d_Curve2d
S: Adaptor3d_Surface

Returns
-------
None
") Load;
		void Load(const opencascade::handle<Adaptor2d_Curve2d> & C, const opencascade::handle<Adaptor3d_Surface> & S);

		/****************** NbIntervals ******************/
		/**** md5 signature: 8ce4f61bff96d1ce0784028b47edd8dc ****/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "Returns the number of intervals for continuity <s>. may be one if continuity(me) >= <s>.

Parameters
----------
S: GeomAbs_Shape

Returns
-------
int
") NbIntervals;
		Standard_Integer NbIntervals(const GeomAbs_Shape S);

		/****************** NbKnots ******************/
		/**** md5 signature: 841663cbf96bec3b939f307c52df6c7c ****/
		%feature("compactdefaultargs") NbKnots;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbKnots;
		Standard_Integer NbKnots();

		/****************** NbPoles ******************/
		/**** md5 signature: 52e5fadf897540545847ef59cc0ba942 ****/
		%feature("compactdefaultargs") NbPoles;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbPoles;
		Standard_Integer NbPoles();

		/****************** Parabola ******************/
		/**** md5 signature: 68860abab63fd184ea5c7eb97f0762c1 ****/
		%feature("compactdefaultargs") Parabola;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Parab
") Parabola;
		gp_Parab Parabola();

		/****************** Period ******************/
		/**** md5 signature: 88909a321398632744c0d6841580c626 ****/
		%feature("compactdefaultargs") Period;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Period;
		Standard_Real Period();

		/****************** Resolution ******************/
		/**** md5 signature: cc4a4d9111fadd20ad48e62bc4df1579 ****/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "Returns the parametric resolution corresponding to the real space resolution <r3d>.

Parameters
----------
R3d: float

Returns
-------
float
") Resolution;
		Standard_Real Resolution(const Standard_Real R3d);

		/****************** Trim ******************/
		/**** md5 signature: 40a46ffe7379c6d919968b501b8343a5 ****/
		%feature("compactdefaultargs") Trim;
		%feature("autodoc", "Returns a curve equivalent of <self> between parameters <first> and <last>. <tol> is used to test for 3d points confusion. if <first> >= <last>.

Parameters
----------
First: float
Last: float
Tol: float

Returns
-------
opencascade::handle<Adaptor3d_Curve>
") Trim;
		opencascade::handle<Adaptor3d_Curve> Trim(const Standard_Real First, const Standard_Real Last, const Standard_Real Tol);

		/****************** Value ******************/
		/**** md5 signature: d7f310c73762cbaa285ace0a141bc7bf ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Computes the point of parameter u on the curve.

Parameters
----------
U: float

Returns
-------
gp_Pnt
") Value;
		gp_Pnt Value(const Standard_Real U);

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
		/****************** Adaptor3d_IsoCurve ******************/
		/**** md5 signature: cb862f00a186757c14cd5025f695a90c ****/
		%feature("compactdefaultargs") Adaptor3d_IsoCurve;
		%feature("autodoc", "The iso is set to noneiso.

Returns
-------
None
") Adaptor3d_IsoCurve;
		 Adaptor3d_IsoCurve();

		/****************** Adaptor3d_IsoCurve ******************/
		/**** md5 signature: 607c0557eaedda13d060731388d0c004 ****/
		%feature("compactdefaultargs") Adaptor3d_IsoCurve;
		%feature("autodoc", "The surface is loaded. the iso is set to noneiso.

Parameters
----------
S: Adaptor3d_Surface

Returns
-------
None
") Adaptor3d_IsoCurve;
		 Adaptor3d_IsoCurve(const opencascade::handle<Adaptor3d_Surface> & S);

		/****************** Adaptor3d_IsoCurve ******************/
		/**** md5 signature: bfbcfabf7a1c156890f141f7adbff1f4 ****/
		%feature("compactdefaultargs") Adaptor3d_IsoCurve;
		%feature("autodoc", "Creates an isocurve curve. iso defines the type (isou or isou) param defines the value of the iso. the bounds of the iso are the bounds of the surface.

Parameters
----------
S: Adaptor3d_Surface
Iso: GeomAbs_IsoType
Param: float

Returns
-------
None
") Adaptor3d_IsoCurve;
		 Adaptor3d_IsoCurve(const opencascade::handle<Adaptor3d_Surface> & S, const GeomAbs_IsoType Iso, const Standard_Real Param);

		/****************** Adaptor3d_IsoCurve ******************/
		/**** md5 signature: e4dee8adea539086aa810249d6783f57 ****/
		%feature("compactdefaultargs") Adaptor3d_IsoCurve;
		%feature("autodoc", "Create an isocurve curve. iso defines the type (isou or isov). param defines the value of the iso. wfirst,wlast define the bounds of the iso.

Parameters
----------
S: Adaptor3d_Surface
Iso: GeomAbs_IsoType
Param: float
WFirst: float
WLast: float

Returns
-------
None
") Adaptor3d_IsoCurve;
		 Adaptor3d_IsoCurve(const opencascade::handle<Adaptor3d_Surface> & S, const GeomAbs_IsoType Iso, const Standard_Real Param, const Standard_Real WFirst, const Standard_Real WLast);

		/****************** BSpline ******************/
		/**** md5 signature: 3ccc0d851302bffb5de6344e3eb3e58d ****/
		%feature("compactdefaultargs") BSpline;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom_BSplineCurve>
") BSpline;
		opencascade::handle<Geom_BSplineCurve> BSpline();

		/****************** Bezier ******************/
		/**** md5 signature: 092280fc6ee0e7104fbbe3460d73e83c ****/
		%feature("compactdefaultargs") Bezier;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom_BezierCurve>
") Bezier;
		opencascade::handle<Geom_BezierCurve> Bezier();

		/****************** Circle ******************/
		/**** md5 signature: 5f382e7a6af009845ea6e16d54814298 ****/
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Circ
") Circle;
		gp_Circ Circle();

		/****************** Continuity ******************/
		/**** md5 signature: 9381b370dfdd50af7f1b79ce202f0c6f ****/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "No available documentation.

Returns
-------
GeomAbs_Shape
") Continuity;
		GeomAbs_Shape Continuity();

		/****************** D0 ******************/
		/**** md5 signature: 5f7d08d8d17afc516aac9ef64bf9711f ****/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "Computes the point of parameter u on the curve.

Parameters
----------
U: float
P: gp_Pnt

Returns
-------
None
") D0;
		void D0(const Standard_Real U, gp_Pnt & P);

		/****************** D1 ******************/
		/**** md5 signature: 1dc830ec49a945a61cde5e5c027b78d7 ****/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "Computes the point of parameter u on the curve with its first derivative. raised if the continuity of the current interval is not c1.

Parameters
----------
U: float
P: gp_Pnt
V: gp_Vec

Returns
-------
None
") D1;
		void D1(const Standard_Real U, gp_Pnt & P, gp_Vec & V);

		/****************** D2 ******************/
		/**** md5 signature: a694b4ba68c0fd83fbac79f945cb5d8c ****/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "Returns the point p of parameter u, the first and second derivatives v1 and v2. raised if the continuity of the current interval is not c2.

Parameters
----------
U: float
P: gp_Pnt
V1: gp_Vec
V2: gp_Vec

Returns
-------
None
") D2;
		void D2(const Standard_Real U, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2);

		/****************** D3 ******************/
		/**** md5 signature: cf1c3b5fe7af9d5c183c1b16b21c43f1 ****/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "Returns the point p of parameter u, the first, the second and the third derivative. raised if the continuity of the current interval is not c3.

Parameters
----------
U: float
P: gp_Pnt
V1: gp_Vec
V2: gp_Vec
V3: gp_Vec

Returns
-------
None
") D3;
		void D3(const Standard_Real U, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2, gp_Vec & V3);

		/****************** DN ******************/
		/**** md5 signature: 0d4a3e2fc2b4b03d2a49e0796a487efb ****/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "The returned vector gives the value of the derivative for the order of derivation n. raised if the continuity of the current interval is not cn. raised if n < 1.

Parameters
----------
U: float
N: int

Returns
-------
gp_Vec
") DN;
		gp_Vec DN(const Standard_Real U, const Standard_Integer N);

		/****************** Degree ******************/
		/**** md5 signature: 5ce473e72cc7bb935a667f4c839dab09 ****/
		%feature("compactdefaultargs") Degree;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") Degree;
		Standard_Integer Degree();

		/****************** Ellipse ******************/
		/**** md5 signature: e9a77f14e9bbca29370202de404ea9c1 ****/
		%feature("compactdefaultargs") Ellipse;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Elips
") Ellipse;
		gp_Elips Ellipse();

		/****************** FirstParameter ******************/
		/**** md5 signature: 93c381754667baab23468a195644e410 ****/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") FirstParameter;
		virtual Standard_Real FirstParameter();

		/****************** GetType ******************/
		/**** md5 signature: 0ad61dcbb5497908c1b536e766f0fcb9 ****/
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "Returns the type of the curve in the current interval : line, circle, ellipse, hyperbola, parabola, beziercurve, bsplinecurve, othercurve.

Returns
-------
GeomAbs_CurveType
") GetType;
		GeomAbs_CurveType GetType();

		/****************** Hyperbola ******************/
		/**** md5 signature: a96ca49b2ad017b35bb09d0b86cb690d ****/
		%feature("compactdefaultargs") Hyperbola;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Hypr
") Hyperbola;
		gp_Hypr Hyperbola();

		/****************** Intervals ******************/
		/**** md5 signature: fc573cb56cf1a9c05ee189fd913ff6f5 ****/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "Stores in <t> the parameters bounding the intervals of continuity <s>. //! the array must provide enough room to accommodate for the parameters. i.e. t.length() > nbintervals().

Parameters
----------
T: TColStd_Array1OfReal
S: GeomAbs_Shape

Returns
-------
None
") Intervals;
		void Intervals(TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****************** IsClosed ******************/
		/**** md5 signature: 00978070ec4cb5f00d1d002a8d5d3763 ****/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsClosed;
		Standard_Boolean IsClosed();

		/****************** IsPeriodic ******************/
		/**** md5 signature: 15e3ccfd3ad4ae42959489f7f64aa8ca ****/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsPeriodic;
		Standard_Boolean IsPeriodic();

		/****************** IsRational ******************/
		/**** md5 signature: 82ca56fad113156125f40128b25c0d8e ****/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsRational;
		Standard_Boolean IsRational();

		/****************** Iso ******************/
		/**** md5 signature: ab18592b64592fda4c22a1eda51e637d ****/
		%feature("compactdefaultargs") Iso;
		%feature("autodoc", "No available documentation.

Returns
-------
GeomAbs_IsoType
") Iso;
		GeomAbs_IsoType Iso();

		/****************** LastParameter ******************/
		/**** md5 signature: a2893a92f9c4af09acb0cd59d959d964 ****/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") LastParameter;
		virtual Standard_Real LastParameter();

		/****************** Line ******************/
		/**** md5 signature: cf28f5541e4e744dd8038e2a9ac75a8f ****/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Lin
") Line;
		gp_Lin Line();

		/****************** Load ******************/
		/**** md5 signature: 5fdedc45f7f3e3286603c8152dd5d5ba ****/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "Changes the surface. the iso is reset to noneiso.

Parameters
----------
S: Adaptor3d_Surface

Returns
-------
None
") Load;
		void Load(const opencascade::handle<Adaptor3d_Surface> & S);

		/****************** Load ******************/
		/**** md5 signature: 66ff0843f86cebdbf3cebf29ed66e909 ****/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "Changes the iso on the current surface.

Parameters
----------
Iso: GeomAbs_IsoType
Param: float

Returns
-------
None
") Load;
		void Load(const GeomAbs_IsoType Iso, const Standard_Real Param);

		/****************** Load ******************/
		/**** md5 signature: ce2acdffae7f9f3edf3c676305191098 ****/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "Changes the iso on the current surface.

Parameters
----------
Iso: GeomAbs_IsoType
Param: float
WFirst: float
WLast: float

Returns
-------
None
") Load;
		void Load(const GeomAbs_IsoType Iso, const Standard_Real Param, const Standard_Real WFirst, const Standard_Real WLast);

		/****************** NbIntervals ******************/
		/**** md5 signature: 8ce4f61bff96d1ce0784028b47edd8dc ****/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "Returns the number of intervals for continuity <s>. may be one if continuity(me) >= <s>.

Parameters
----------
S: GeomAbs_Shape

Returns
-------
int
") NbIntervals;
		Standard_Integer NbIntervals(const GeomAbs_Shape S);

		/****************** NbKnots ******************/
		/**** md5 signature: 841663cbf96bec3b939f307c52df6c7c ****/
		%feature("compactdefaultargs") NbKnots;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbKnots;
		Standard_Integer NbKnots();

		/****************** NbPoles ******************/
		/**** md5 signature: 52e5fadf897540545847ef59cc0ba942 ****/
		%feature("compactdefaultargs") NbPoles;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbPoles;
		Standard_Integer NbPoles();

		/****************** Parabola ******************/
		/**** md5 signature: 68860abab63fd184ea5c7eb97f0762c1 ****/
		%feature("compactdefaultargs") Parabola;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Parab
") Parabola;
		gp_Parab Parabola();

		/****************** Parameter ******************/
		/**** md5 signature: a1c30d1196ee452cd8e422f1e25a0fbc ****/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Parameter;
		Standard_Real Parameter();

		/****************** Period ******************/
		/**** md5 signature: 88909a321398632744c0d6841580c626 ****/
		%feature("compactdefaultargs") Period;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Period;
		Standard_Real Period();

		/****************** Resolution ******************/
		/**** md5 signature: cc4a4d9111fadd20ad48e62bc4df1579 ****/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "Returns the parametric resolution corresponding to the real space resolution <r3d>.

Parameters
----------
R3d: float

Returns
-------
float
") Resolution;
		Standard_Real Resolution(const Standard_Real R3d);

		/****************** Surface ******************/
		/**** md5 signature: 36b438ec6a4fa276d7bb47e4d8b0376a ****/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Adaptor3d_Surface>
") Surface;
		const opencascade::handle<Adaptor3d_Surface> & Surface();

		/****************** Trim ******************/
		/**** md5 signature: 40a46ffe7379c6d919968b501b8343a5 ****/
		%feature("compactdefaultargs") Trim;
		%feature("autodoc", "Returns a curve equivalent of <self> between parameters <first> and <last>. <tol> is used to test for 3d points confusion. if <first> >= <last>.

Parameters
----------
First: float
Last: float
Tol: float

Returns
-------
opencascade::handle<Adaptor3d_Curve>
") Trim;
		opencascade::handle<Adaptor3d_Curve> Trim(const Standard_Real First, const Standard_Real Last, const Standard_Real Tol);

		/****************** Value ******************/
		/**** md5 signature: d7f310c73762cbaa285ace0a141bc7bf ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Computes the point of parameter u on the curve.

Parameters
----------
U: float

Returns
-------
gp_Pnt
") Value;
		gp_Pnt Value(const Standard_Real U);

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
