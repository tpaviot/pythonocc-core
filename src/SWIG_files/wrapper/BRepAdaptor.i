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
%define BREPADAPTORDOCSTRING
"BRepAdaptor module, see official documentation at
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_brepadaptor.html"
%enddef
%module (package="OCC.Core", docstring=BREPADAPTORDOCSTRING) BRepAdaptor


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
#include<BRepAdaptor_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<Adaptor3d_module.hxx>
#include<TopoDS_module.hxx>
#include<Geom_module.hxx>
#include<gp_module.hxx>
#include<GeomAbs_module.hxx>
#include<TColStd_module.hxx>
#include<GeomAdaptor_module.hxx>
#include<Geom2dAdaptor_module.hxx>
#include<Adaptor2d_module.hxx>
#include<TopLoc_module.hxx>
#include<Geom2d_module.hxx>
#include<Message_module.hxx>
#include<Adaptor2d_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import Adaptor3d.i
%import TopoDS.i
%import Geom.i
%import gp.i
%import GeomAbs.i
%import TColStd.i
%import GeomAdaptor.i
%import Geom2dAdaptor.i
%import Adaptor2d.i

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
%wrap_handle(BRepAdaptor_CompCurve)
%wrap_handle(BRepAdaptor_Curve)
%wrap_handle(BRepAdaptor_Curve2d)
%wrap_handle(BRepAdaptor_Surface)
/* end handles declaration */

/* templates */
%template(BRepAdaptor_Array1OfCurve) NCollection_Array1<BRepAdaptor_Curve>;
Array1ExtendIter(BRepAdaptor_Curve)

/* end templates declaration */

/* typedefs */
typedef NCollection_Array1<BRepAdaptor_Curve> BRepAdaptor_Array1OfCurve;
typedef NCollection_HArray1<BRepAdaptor_Curve> BRepAdaptor_HArray1OfCurve;
/* end typedefs declaration */

/******************************
* class BRepAdaptor_CompCurve *
******************************/
class BRepAdaptor_CompCurve : public Adaptor3d_Curve {
	public:
		/****** BRepAdaptor_CompCurve::BRepAdaptor_CompCurve ******/
		/****** md5 signature: c1152ba591cae8b160ace1ba10d270dc ******/
		%feature("compactdefaultargs") BRepAdaptor_CompCurve;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates an undefined Curve with no Wire loaded.
") BRepAdaptor_CompCurve;
		 BRepAdaptor_CompCurve();

		/****** BRepAdaptor_CompCurve::BRepAdaptor_CompCurve ******/
		/****** md5 signature: 254f52f83796a6292561a86aa1a1bfe5 ******/
		%feature("compactdefaultargs") BRepAdaptor_CompCurve;
		%feature("autodoc", "
Parameters
----------
W: TopoDS_Wire
KnotByCurvilinearAbcissa: bool (optional, default to false)

Return
-------
None

Description
-----------
No available documentation.
") BRepAdaptor_CompCurve;
		 BRepAdaptor_CompCurve(const TopoDS_Wire & W, const bool KnotByCurvilinearAbcissa = false);

		/****** BRepAdaptor_CompCurve::BRepAdaptor_CompCurve ******/
		/****** md5 signature: 04ca3fddce04ba1d2c5003cabe70210f ******/
		%feature("compactdefaultargs") BRepAdaptor_CompCurve;
		%feature("autodoc", "
Parameters
----------
W: TopoDS_Wire
KnotByCurvilinearAbcissa: bool
First: double
Last: double
Tol: double

Return
-------
None

Description
-----------
Creates a Curve to access the geometry of edge <W>.
") BRepAdaptor_CompCurve;
		 BRepAdaptor_CompCurve(const TopoDS_Wire & W, const bool KnotByCurvilinearAbcissa, const double First, const double Last, const double Tol);

		/****** BRepAdaptor_CompCurve::BSpline ******/
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

		/****** BRepAdaptor_CompCurve::Bezier ******/
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

		/****** BRepAdaptor_CompCurve::Circle ******/
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

		/****** BRepAdaptor_CompCurve::Continuity ******/
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

		/****** BRepAdaptor_CompCurve::Degree ******/
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

		/****** BRepAdaptor_CompCurve::Edge ******/
		/****** md5 signature: e8ea308dd6b15ffdc2feed0b62e529c4 ******/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "
Parameters
----------
U: double
E: TopoDS_Edge

Return
-------
UonE: double

Description
-----------
returns an edge and one parameter on them corresponding to the parameter U.
") Edge;
		void Edge(const double U, TopoDS_Edge & E, Standard_Real &OutValue);

		/****** BRepAdaptor_CompCurve::Ellipse ******/
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

		/****** BRepAdaptor_CompCurve::EvalD0 ******/
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

		/****** BRepAdaptor_CompCurve::EvalD1 ******/
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

		/****** BRepAdaptor_CompCurve::EvalD2 ******/
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

		/****** BRepAdaptor_CompCurve::EvalD3 ******/
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

		/****** BRepAdaptor_CompCurve::EvalDN ******/
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

		/****** BRepAdaptor_CompCurve::FirstParameter ******/
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

		/****** BRepAdaptor_CompCurve::GetType ******/
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

		/****** BRepAdaptor_CompCurve::Hyperbola ******/
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

		/****** BRepAdaptor_CompCurve::Initialize ******/
		/****** md5 signature: f4de56389008489c7f99f21356162e4f ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
W: TopoDS_Wire
KnotByCurvilinearAbcissa: bool

Return
-------
None

Description
-----------
Sets the wire <W>.
") Initialize;
		void Initialize(const TopoDS_Wire & W, const bool KnotByCurvilinearAbcissa);

		/****** BRepAdaptor_CompCurve::Initialize ******/
		/****** md5 signature: 7640ff0438a709212871604b1c1e6912 ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
W: TopoDS_Wire
KnotByCurvilinearAbcissa: bool
First: double
Last: double
Tol: double

Return
-------
None

Description
-----------
Sets wire <W> and trimmed parameter.
") Initialize;
		void Initialize(const TopoDS_Wire & W, const bool KnotByCurvilinearAbcissa, const double First, const double Last, const double Tol);

		/****** BRepAdaptor_CompCurve::Intervals ******/
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

		/****** BRepAdaptor_CompCurve::IsClosed ******/
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

		/****** BRepAdaptor_CompCurve::IsPeriodic ******/
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

		/****** BRepAdaptor_CompCurve::IsRational ******/
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

		/****** BRepAdaptor_CompCurve::LastParameter ******/
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

		/****** BRepAdaptor_CompCurve::Line ******/
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

		/****** BRepAdaptor_CompCurve::NbIntervals ******/
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

		/****** BRepAdaptor_CompCurve::NbKnots ******/
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

		/****** BRepAdaptor_CompCurve::NbPoles ******/
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

		/****** BRepAdaptor_CompCurve::Parabola ******/
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

		/****** BRepAdaptor_CompCurve::Period ******/
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

		/****** BRepAdaptor_CompCurve::Resolution ******/
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
returns the parametric resolution.
") Resolution;
		double Resolution(const double R3d);

		/****** BRepAdaptor_CompCurve::ShallowCopy ******/
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

		/****** BRepAdaptor_CompCurve::Trim ******/
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

		/****** BRepAdaptor_CompCurve::Wire ******/
		/****** md5 signature: 066765b94f5225dad05ab95ae3f8b503 ******/
		%feature("compactdefaultargs") Wire;
		%feature("autodoc", "Return
-------
TopoDS_Wire

Description
-----------
Returns the wire.
") Wire;
		const TopoDS_Wire Wire();

};


%make_alias(BRepAdaptor_CompCurve)

%extend BRepAdaptor_CompCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class BRepAdaptor_Curve *
**************************/
class BRepAdaptor_Curve : public GeomAdaptor_TransformedCurve {
	public:
		/****** BRepAdaptor_Curve::BRepAdaptor_Curve ******/
		/****** md5 signature: 36916a7ac88f4dc1e560c43c25da0671 ******/
		%feature("compactdefaultargs") BRepAdaptor_Curve;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates an undefined Curve with no Edge loaded.
") BRepAdaptor_Curve;
		 BRepAdaptor_Curve();

		/****** BRepAdaptor_Curve::BRepAdaptor_Curve ******/
		/****** md5 signature: 740e451b59f60726263aab98ec1f1316 ******/
		%feature("compactdefaultargs") BRepAdaptor_Curve;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge

Return
-------
None

Description
-----------
Creates a Curve to access the geometry of edge <E>.
") BRepAdaptor_Curve;
		 BRepAdaptor_Curve(const TopoDS_Edge & E);

		/****** BRepAdaptor_Curve::BRepAdaptor_Curve ******/
		/****** md5 signature: c4ad88c445ddb172d9a61b5a673cf024 ******/
		%feature("compactdefaultargs") BRepAdaptor_Curve;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
F: TopoDS_Face

Return
-------
None

Description
-----------
Creates a Curve to access the geometry of edge <E>. The geometry will be computed using the parametric curve of <E> on the face <F>. An Error is raised if the edge does not have a pcurve on the face.
") BRepAdaptor_Curve;
		 BRepAdaptor_Curve(const TopoDS_Edge & E, const TopoDS_Face & F);

		/****** BRepAdaptor_Curve::Edge ******/
		/****** md5 signature: be590cff987799d8b7c28083399d0e9f ******/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "Return
-------
TopoDS_Edge

Description
-----------
Returns the edge.
") Edge;
		const TopoDS_Edge Edge();

		/****** BRepAdaptor_Curve::Initialize ******/
		/****** md5 signature: b0b8cb0790e5e63c5a8b3b133b757731 ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge

Return
-------
None

Description
-----------
Sets the Curve <self> to access the geometry of edge <E>.
") Initialize;
		void Initialize(const TopoDS_Edge & E);

		/****** BRepAdaptor_Curve::Initialize ******/
		/****** md5 signature: cf258179577adbc75b4efbc5847934f6 ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
F: TopoDS_Face

Return
-------
None

Description
-----------
Sets the Curve <self> to access the geometry of edge <E>. The geometry will be computed using the parametric curve of <E> on the face <F>. An Error is raised if the edge does not have a pcurve on the face.
") Initialize;
		void Initialize(const TopoDS_Edge & E, const TopoDS_Face & F);

		/****** BRepAdaptor_Curve::Reset ******/
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

		/****** BRepAdaptor_Curve::ShallowCopy ******/
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

		/****** BRepAdaptor_Curve::Tolerance ******/
		/****** md5 signature: a95a606eeb289469358ac00a6b44ad86 ******/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the edge tolerance.
") Tolerance;
		double Tolerance();

		/****** BRepAdaptor_Curve::Trim ******/
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
Returns a curve equivalent of <self> between parameters <First> and <Last>. <Tol> is used to test for 3d points confusion.
") Trim;
		opencascade::handle<Adaptor3d_Curve> Trim(const double First, const double Last, const double Tol);

};


%make_alias(BRepAdaptor_Curve)

%extend BRepAdaptor_Curve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class BRepAdaptor_Curve2d *
****************************/
class BRepAdaptor_Curve2d : public Geom2dAdaptor_Curve {
	public:
		/****** BRepAdaptor_Curve2d::BRepAdaptor_Curve2d ******/
		/****** md5 signature: b7ed47cccfb977bc356e474765ba5816 ******/
		%feature("compactdefaultargs") BRepAdaptor_Curve2d;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates an uninitialized curve2d.
") BRepAdaptor_Curve2d;
		 BRepAdaptor_Curve2d();

		/****** BRepAdaptor_Curve2d::BRepAdaptor_Curve2d ******/
		/****** md5 signature: e386e29ae63edd3b069e2ac2448ce78a ******/
		%feature("compactdefaultargs") BRepAdaptor_Curve2d;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
F: TopoDS_Face

Return
-------
None

Description
-----------
Creates with the pcurve of <E> on <F>.
") BRepAdaptor_Curve2d;
		 BRepAdaptor_Curve2d(const TopoDS_Edge & E, const TopoDS_Face & F);

		/****** BRepAdaptor_Curve2d::Edge ******/
		/****** md5 signature: be590cff987799d8b7c28083399d0e9f ******/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "Return
-------
TopoDS_Edge

Description
-----------
Returns the Edge.
") Edge;
		const TopoDS_Edge Edge();

		/****** BRepAdaptor_Curve2d::Face ******/
		/****** md5 signature: 91e216ebeb76e55c73eb9e179241a6ff ******/
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "Return
-------
TopoDS_Face

Description
-----------
Returns the Face.
") Face;
		const TopoDS_Face Face();

		/****** BRepAdaptor_Curve2d::Initialize ******/
		/****** md5 signature: cf258179577adbc75b4efbc5847934f6 ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
F: TopoDS_Face

Return
-------
None

Description
-----------
Initialize with the pcurve of <E> on <F>.
") Initialize;
		void Initialize(const TopoDS_Edge & E, const TopoDS_Face & F);

		/****** BRepAdaptor_Curve2d::ShallowCopy ******/
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

};


%make_alias(BRepAdaptor_Curve2d)

%extend BRepAdaptor_Curve2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class BRepAdaptor_Surface *
****************************/
class BRepAdaptor_Surface : public GeomAdaptor_TransformedSurface {
	public:
		/****** BRepAdaptor_Surface::BRepAdaptor_Surface ******/
		/****** md5 signature: fd2163b01d125040a3f6f06ce9213655 ******/
		%feature("compactdefaultargs") BRepAdaptor_Surface;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates an undefined surface with no face loaded.
") BRepAdaptor_Surface;
		 BRepAdaptor_Surface();

		/****** BRepAdaptor_Surface::BRepAdaptor_Surface ******/
		/****** md5 signature: 03f1b8151e36608bc220b7a46698b589 ******/
		%feature("compactdefaultargs") BRepAdaptor_Surface;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face
R: bool (optional, default to true)

Return
-------
None

Description
-----------
Creates a surface to access the geometry of <F>. If <Restriction> is true the parameter range is the parameter range in the UV space of the restriction.
") BRepAdaptor_Surface;
		 BRepAdaptor_Surface(const TopoDS_Face & F, const bool R = true);

		/****** BRepAdaptor_Surface::Face ******/
		/****** md5 signature: 91e216ebeb76e55c73eb9e179241a6ff ******/
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "Return
-------
TopoDS_Face

Description
-----------
Returns the face.
") Face;
		const TopoDS_Face Face();

		/****** BRepAdaptor_Surface::Initialize ******/
		/****** md5 signature: 9064c5575943061575894cb483ff5744 ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face
Restriction: bool (optional, default to true)

Return
-------
None

Description
-----------
Sets the surface to the geometry of <F>.
") Initialize;
		void Initialize(const TopoDS_Face & F, const bool Restriction = true);

		/****** BRepAdaptor_Surface::ShallowCopy ******/
		/****** md5 signature: 7aa156a18d0b7bf72bf05655ccd9ffff ******/
		%feature("compactdefaultargs") ShallowCopy;
		%feature("autodoc", "Return
-------
opencascade::handle<Adaptor3d_Surface>

Description
-----------
Shallow copy of adaptor.
") ShallowCopy;
		opencascade::handle<Adaptor3d_Surface> ShallowCopy();

		/****** BRepAdaptor_Surface::Tolerance ******/
		/****** md5 signature: a95a606eeb289469358ac00a6b44ad86 ******/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the face tolerance.
") Tolerance;
		double Tolerance();

};


%make_alias(BRepAdaptor_Surface)

%extend BRepAdaptor_Surface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */

class BRepAdaptor_HArray1OfCurve : public NCollection_Array1<BRepAdaptor_Curve>, public Standard_Transient {
  public:
    BRepAdaptor_HArray1OfCurve(const Standard_Integer theLower, const Standard_Integer theUpper);
    BRepAdaptor_HArray1OfCurve(const Standard_Integer theLower, const Standard_Integer theUpper, const NCollection_Array1<BRepAdaptor_Curve>::value_type& theValue);
    BRepAdaptor_HArray1OfCurve(const NCollection_Array1<BRepAdaptor_Curve>& theOther);
    const NCollection_Array1<BRepAdaptor_Curve>& Array1();
    NCollection_Array1<BRepAdaptor_Curve>& ChangeArray1();
};
%make_alias(BRepAdaptor_HArray1OfCurve)

/* harray2 classes */
/* hsequence classes */
/* class aliases */
%pythoncode {
}
