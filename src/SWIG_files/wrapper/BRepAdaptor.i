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
%define BREPADAPTORDOCSTRING
"BRepAdaptor module, see official documentation at
https://dev.opencascade.org/doc/occt-7.8.0/refman/html/package_brepadaptor.html"
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
#include<Geom2dAdaptor_module.hxx>
#include<Adaptor2d_module.hxx>
#include<GeomAdaptor_module.hxx>
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
%import Geom2dAdaptor.i
%import Adaptor2d.i
%import GeomAdaptor.i

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
%wrap_handle(BRepAdaptor_HArray1OfCurve)
/* end handles declaration */

/* templates */
%template(BRepAdaptor_Array1OfCurve) NCollection_Array1<BRepAdaptor_Curve>;
Array1ExtendIter(BRepAdaptor_Curve)

/* end templates declaration */

/* typedefs */
typedef NCollection_Array1<BRepAdaptor_Curve> BRepAdaptor_Array1OfCurve;
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
		/****** md5 signature: 536f827323fa633aa2cdc2b24e992a20 ******/
		%feature("compactdefaultargs") BRepAdaptor_CompCurve;
		%feature("autodoc", "
Parameters
----------
W: TopoDS_Wire
KnotByCurvilinearAbcissa: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
No available documentation.
") BRepAdaptor_CompCurve;
		 BRepAdaptor_CompCurve(const TopoDS_Wire & W, const Standard_Boolean KnotByCurvilinearAbcissa = Standard_False);

		/****** BRepAdaptor_CompCurve::BRepAdaptor_CompCurve ******/
		/****** md5 signature: d6d730d5ed59cc103614b39691bdbfd1 ******/
		%feature("compactdefaultargs") BRepAdaptor_CompCurve;
		%feature("autodoc", "
Parameters
----------
W: TopoDS_Wire
KnotByCurvilinearAbcissa: bool
First: float
Last: float
Tol: float

Return
-------
None

Description
-----------
Creates a Curve to access the geometry of edge <W>.
") BRepAdaptor_CompCurve;
		 BRepAdaptor_CompCurve(const TopoDS_Wire & W, const Standard_Boolean KnotByCurvilinearAbcissa, const Standard_Real First, const Standard_Real Last, const Standard_Real Tol);

		/****** BRepAdaptor_CompCurve::BSpline ******/
		/****** md5 signature: 3ccc0d851302bffb5de6344e3eb3e58d ******/
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
		/****** md5 signature: 092280fc6ee0e7104fbbe3460d73e83c ******/
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
		/****** md5 signature: 5f382e7a6af009845ea6e16d54814298 ******/
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
		/****** md5 signature: 9381b370dfdd50af7f1b79ce202f0c6f ******/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "Return
-------
GeomAbs_Shape

Description
-----------
No available documentation.
") Continuity;
		GeomAbs_Shape Continuity();

		/****** BRepAdaptor_CompCurve::D0 ******/
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
Computes the point of parameter U.
") D0;
		void D0(const Standard_Real U, gp_Pnt & P);

		/****** BRepAdaptor_CompCurve::D1 ******/
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

		/****** BRepAdaptor_CompCurve::D2 ******/
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

		/****** BRepAdaptor_CompCurve::D3 ******/
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
Returns the point P of parameter U, the first, the second and the third derivative. Raised if the continuity of the current interval is not C3.
") D3;
		void D3(const Standard_Real U, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2, gp_Vec & V3);

		/****** BRepAdaptor_CompCurve::DN ******/
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
The returned vector gives the value of the derivative for the order of derivation N. Raised if the continuity of the current interval is not CN. Raised if N < 1.
") DN;
		gp_Vec DN(const Standard_Real U, const Standard_Integer N);

		/****** BRepAdaptor_CompCurve::Degree ******/
		/****** md5 signature: 5ce473e72cc7bb935a667f4c839dab09 ******/
		%feature("compactdefaultargs") Degree;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Degree;
		Standard_Integer Degree();

		/****** BRepAdaptor_CompCurve::Edge ******/
		/****** md5 signature: f73dfc9c9040a29acf2262eb8cd9a8ea ******/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "
Parameters
----------
U: float
E: TopoDS_Edge

Return
-------
UonE: float

Description
-----------
returns an edge and one parameter on them corresponding to the parameter U.
") Edge;
		void Edge(const Standard_Real U, TopoDS_Edge & E, Standard_Real &OutValue);

		/****** BRepAdaptor_CompCurve::Ellipse ******/
		/****** md5 signature: e9a77f14e9bbca29370202de404ea9c1 ******/
		%feature("compactdefaultargs") Ellipse;
		%feature("autodoc", "Return
-------
gp_Elips

Description
-----------
No available documentation.
") Ellipse;
		gp_Elips Ellipse();

		/****** BRepAdaptor_CompCurve::FirstParameter ******/
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

		/****** BRepAdaptor_CompCurve::GetType ******/
		/****** md5 signature: 0ad61dcbb5497908c1b536e766f0fcb9 ******/
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
		/****** md5 signature: a96ca49b2ad017b35bb09d0b86cb690d ******/
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
		/****** md5 signature: 084e04b2711058308ee9c6ffc8589f6f ******/
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
		void Initialize(const TopoDS_Wire & W, const Standard_Boolean KnotByCurvilinearAbcissa);

		/****** BRepAdaptor_CompCurve::Initialize ******/
		/****** md5 signature: 3f7ce5fd6aa0f7b3bdaf45694f156692 ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
W: TopoDS_Wire
KnotByCurvilinearAbcissa: bool
First: float
Last: float
Tol: float

Return
-------
None

Description
-----------
Sets wire <W> and trimmed parameter.
") Initialize;
		void Initialize(const TopoDS_Wire & W, const Standard_Boolean KnotByCurvilinearAbcissa, const Standard_Real First, const Standard_Real Last, const Standard_Real Tol);

		/****** BRepAdaptor_CompCurve::Intervals ******/
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

		/****** BRepAdaptor_CompCurve::IsClosed ******/
		/****** md5 signature: 00978070ec4cb5f00d1d002a8d5d3763 ******/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsClosed;
		Standard_Boolean IsClosed();

		/****** BRepAdaptor_CompCurve::IsPeriodic ******/
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

		/****** BRepAdaptor_CompCurve::IsRational ******/
		/****** md5 signature: 82ca56fad113156125f40128b25c0d8e ******/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsRational;
		Standard_Boolean IsRational();

		/****** BRepAdaptor_CompCurve::LastParameter ******/
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

		/****** BRepAdaptor_CompCurve::Line ******/
		/****** md5 signature: cf28f5541e4e744dd8038e2a9ac75a8f ******/
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

		/****** BRepAdaptor_CompCurve::NbKnots ******/
		/****** md5 signature: 841663cbf96bec3b939f307c52df6c7c ******/
		%feature("compactdefaultargs") NbKnots;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbKnots;
		Standard_Integer NbKnots();

		/****** BRepAdaptor_CompCurve::NbPoles ******/
		/****** md5 signature: 52e5fadf897540545847ef59cc0ba942 ******/
		%feature("compactdefaultargs") NbPoles;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbPoles;
		Standard_Integer NbPoles();

		/****** BRepAdaptor_CompCurve::Parabola ******/
		/****** md5 signature: 68860abab63fd184ea5c7eb97f0762c1 ******/
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

		/****** BRepAdaptor_CompCurve::Resolution ******/
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
returns the parametric resolution.
") Resolution;
		Standard_Real Resolution(const Standard_Real R3d);

		/****** BRepAdaptor_CompCurve::ShallowCopy ******/
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

		/****** BRepAdaptor_CompCurve::Trim ******/
		/****** md5 signature: 40a46ffe7379c6d919968b501b8343a5 ******/
		%feature("compactdefaultargs") Trim;
		%feature("autodoc", "
Parameters
----------
First: float
Last: float
Tol: float

Return
-------
opencascade::handle<Adaptor3d_Curve>

Description
-----------
Returns a curve equivalent of <self> between parameters <First> and <Last>. <Tol> is used to test for 3d points confusion. If <First> >= <Last>.
") Trim;
		opencascade::handle<Adaptor3d_Curve> Trim(const Standard_Real First, const Standard_Real Last, const Standard_Real Tol);

		/****** BRepAdaptor_CompCurve::Value ******/
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
class BRepAdaptor_Curve : public Adaptor3d_Curve {
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

		/****** BRepAdaptor_Curve::BSpline ******/
		/****** md5 signature: 3ccc0d851302bffb5de6344e3eb3e58d ******/
		%feature("compactdefaultargs") BSpline;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_BSplineCurve>

Description
-----------
Warning: This will make a copy of the BSpline Curve since it applies to it myTsrf. Be careful when using this method.
") BSpline;
		opencascade::handle<Geom_BSplineCurve> BSpline();

		/****** BRepAdaptor_Curve::Bezier ******/
		/****** md5 signature: 092280fc6ee0e7104fbbe3460d73e83c ******/
		%feature("compactdefaultargs") Bezier;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_BezierCurve>

Description
-----------
Warning: This will make a copy of the Bezier Curve since it applies to it myTsrf. Be careful when using this method.
") Bezier;
		opencascade::handle<Geom_BezierCurve> Bezier();

		/****** BRepAdaptor_Curve::Circle ******/
		/****** md5 signature: 5f382e7a6af009845ea6e16d54814298 ******/
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", "Return
-------
gp_Circ

Description
-----------
No available documentation.
") Circle;
		gp_Circ Circle();

		/****** BRepAdaptor_Curve::Continuity ******/
		/****** md5 signature: 9381b370dfdd50af7f1b79ce202f0c6f ******/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "Return
-------
GeomAbs_Shape

Description
-----------
No available documentation.
") Continuity;
		GeomAbs_Shape Continuity();

		/****** BRepAdaptor_Curve::Curve ******/
		/****** md5 signature: f572f2bd5ed01577163560ac880dd538 ******/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "Return
-------
GeomAdaptor_Curve

Description
-----------
Returns the Curve of the edge.
") Curve;
		GeomAdaptor_Curve Curve();

		/****** BRepAdaptor_Curve::CurveOnSurface ******/
		/****** md5 signature: f06c54ea203f128f90114fb7bd684518 ******/
		%feature("compactdefaultargs") CurveOnSurface;
		%feature("autodoc", "Return
-------
Adaptor3d_CurveOnSurface

Description
-----------
Returns the CurveOnSurface of the edge.
") CurveOnSurface;
		Adaptor3d_CurveOnSurface CurveOnSurface();

		/****** BRepAdaptor_Curve::D0 ******/
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
Computes the point of parameter U.
") D0;
		void D0(const Standard_Real U, gp_Pnt & P);

		/****** BRepAdaptor_Curve::D1 ******/
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

		/****** BRepAdaptor_Curve::D2 ******/
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

		/****** BRepAdaptor_Curve::D3 ******/
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
Returns the point P of parameter U, the first, the second and the third derivative. Raised if the continuity of the current interval is not C3.
") D3;
		void D3(const Standard_Real U, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2, gp_Vec & V3);

		/****** BRepAdaptor_Curve::DN ******/
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
The returned vector gives the value of the derivative for the order of derivation N. Raised if the continuity of the current interval is not CN. Raised if N < 1.
") DN;
		gp_Vec DN(const Standard_Real U, const Standard_Integer N);

		/****** BRepAdaptor_Curve::Degree ******/
		/****** md5 signature: 5ce473e72cc7bb935a667f4c839dab09 ******/
		%feature("compactdefaultargs") Degree;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Degree;
		Standard_Integer Degree();

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

		/****** BRepAdaptor_Curve::Ellipse ******/
		/****** md5 signature: e9a77f14e9bbca29370202de404ea9c1 ******/
		%feature("compactdefaultargs") Ellipse;
		%feature("autodoc", "Return
-------
gp_Elips

Description
-----------
No available documentation.
") Ellipse;
		gp_Elips Ellipse();

		/****** BRepAdaptor_Curve::FirstParameter ******/
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

		/****** BRepAdaptor_Curve::GetType ******/
		/****** md5 signature: 0ad61dcbb5497908c1b536e766f0fcb9 ******/
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "Return
-------
GeomAbs_CurveType

Description
-----------
No available documentation.
") GetType;
		GeomAbs_CurveType GetType();

		/****** BRepAdaptor_Curve::Hyperbola ******/
		/****** md5 signature: a96ca49b2ad017b35bb09d0b86cb690d ******/
		%feature("compactdefaultargs") Hyperbola;
		%feature("autodoc", "Return
-------
gp_Hypr

Description
-----------
No available documentation.
") Hyperbola;
		gp_Hypr Hyperbola();

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

		/****** BRepAdaptor_Curve::Intervals ******/
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

		/****** BRepAdaptor_Curve::Is3DCurve ******/
		/****** md5 signature: f5d6aa26c69fccbb40636aa757b15284 ******/
		%feature("compactdefaultargs") Is3DCurve;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the edge geometry is computed from a 3D curve.
") Is3DCurve;
		Standard_Boolean Is3DCurve();

		/****** BRepAdaptor_Curve::IsClosed ******/
		/****** md5 signature: 00978070ec4cb5f00d1d002a8d5d3763 ******/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsClosed;
		Standard_Boolean IsClosed();

		/****** BRepAdaptor_Curve::IsCurveOnSurface ******/
		/****** md5 signature: 3910efc6129939aa50e8be5bbd9c78d4 ******/
		%feature("compactdefaultargs") IsCurveOnSurface;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the edge geometry is computed from a pcurve on a surface.
") IsCurveOnSurface;
		Standard_Boolean IsCurveOnSurface();

		/****** BRepAdaptor_Curve::IsPeriodic ******/
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

		/****** BRepAdaptor_Curve::IsRational ******/
		/****** md5 signature: 82ca56fad113156125f40128b25c0d8e ******/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsRational;
		Standard_Boolean IsRational();

		/****** BRepAdaptor_Curve::LastParameter ******/
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

		/****** BRepAdaptor_Curve::Line ******/
		/****** md5 signature: cf28f5541e4e744dd8038e2a9ac75a8f ******/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "Return
-------
gp_Lin

Description
-----------
No available documentation.
") Line;
		gp_Lin Line();

		/****** BRepAdaptor_Curve::NbIntervals ******/
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

		/****** BRepAdaptor_Curve::NbKnots ******/
		/****** md5 signature: 841663cbf96bec3b939f307c52df6c7c ******/
		%feature("compactdefaultargs") NbKnots;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbKnots;
		Standard_Integer NbKnots();

		/****** BRepAdaptor_Curve::NbPoles ******/
		/****** md5 signature: 52e5fadf897540545847ef59cc0ba942 ******/
		%feature("compactdefaultargs") NbPoles;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbPoles;
		Standard_Integer NbPoles();

		/****** BRepAdaptor_Curve::OffsetCurve ******/
		/****** md5 signature: c9712770a031ed315e762ca33ff3eddd ******/
		%feature("compactdefaultargs") OffsetCurve;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_OffsetCurve>

Description
-----------
No available documentation.
") OffsetCurve;
		opencascade::handle<Geom_OffsetCurve> OffsetCurve();

		/****** BRepAdaptor_Curve::Parabola ******/
		/****** md5 signature: 68860abab63fd184ea5c7eb97f0762c1 ******/
		%feature("compactdefaultargs") Parabola;
		%feature("autodoc", "Return
-------
gp_Parab

Description
-----------
No available documentation.
") Parabola;
		gp_Parab Parabola();

		/****** BRepAdaptor_Curve::Period ******/
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

		/****** BRepAdaptor_Curve::Resolution ******/
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
returns the parametric resolution.
") Resolution;
		Standard_Real Resolution(const Standard_Real R3d);

		/****** BRepAdaptor_Curve::ShallowCopy ******/
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

		/****** BRepAdaptor_Curve::Tolerance ******/
		/****** md5 signature: 9e5775014410d884d1a1adc1cd47930b ******/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the edge tolerance.
") Tolerance;
		Standard_Real Tolerance();

		/****** BRepAdaptor_Curve::Trim ******/
		/****** md5 signature: 40a46ffe7379c6d919968b501b8343a5 ******/
		%feature("compactdefaultargs") Trim;
		%feature("autodoc", "
Parameters
----------
First: float
Last: float
Tol: float

Return
-------
opencascade::handle<Adaptor3d_Curve>

Description
-----------
Returns a curve equivalent of <self> between parameters <First> and <Last>. <Tol> is used to test for 3d points confusion. If <First> >= <Last>.
") Trim;
		opencascade::handle<Adaptor3d_Curve> Trim(const Standard_Real First, const Standard_Real Last, const Standard_Real Tol);

		/****** BRepAdaptor_Curve::Trsf ******/
		/****** md5 signature: 97ab79d36bbfac916eee88e8b5acb351 ******/
		%feature("compactdefaultargs") Trsf;
		%feature("autodoc", "Return
-------
gp_Trsf

Description
-----------
Returns the coordinate system of the curve.
") Trsf;
		const gp_Trsf Trsf();

		/****** BRepAdaptor_Curve::Value ******/
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
		/****** md5 signature: 7526aff3b770b4e3b1eb3cc08adfb4b0 ******/
		%feature("compactdefaultargs") ShallowCopy;
		%feature("autodoc", "Return
-------
opencascade::handle<Adaptor2d_Curve2d>

Description
-----------
Shallow copy of adaptor.
") ShallowCopy;
		virtual opencascade::handle<Adaptor2d_Curve2d> ShallowCopy();

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
class BRepAdaptor_Surface : public Adaptor3d_Surface {
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
		/****** md5 signature: 0cf16f4fea8b7b02de8e7d0a77cdc16a ******/
		%feature("compactdefaultargs") BRepAdaptor_Surface;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face
R: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Creates a surface to access the geometry of <F>. If <Restriction> is true the parameter range is the parameter range in the UV space of the restriction.
") BRepAdaptor_Surface;
		 BRepAdaptor_Surface(const TopoDS_Face & F, const Standard_Boolean R = Standard_True);

		/****** BRepAdaptor_Surface::AxeOfRevolution ******/
		/****** md5 signature: ba4a8d5fbd6cead47ee1b295e5469d5d ******/
		%feature("compactdefaultargs") AxeOfRevolution;
		%feature("autodoc", "Return
-------
gp_Ax1

Description
-----------
No available documentation.
") AxeOfRevolution;
		gp_Ax1 AxeOfRevolution();

		/****** BRepAdaptor_Surface::BSpline ******/
		/****** md5 signature: 7edfedec29b3e090d1dbb1c560f9218f ******/
		%feature("compactdefaultargs") BSpline;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_BSplineSurface>

Description
-----------
Warning: this will make a copy of the BSpline Surface since it applies to it the myTsrf transformation Be Careful when using this method.
") BSpline;
		opencascade::handle<Geom_BSplineSurface> BSpline();

		/****** BRepAdaptor_Surface::BasisCurve ******/
		/****** md5 signature: 3da13dd15bd6f8a74a4a076b13266260 ******/
		%feature("compactdefaultargs") BasisCurve;
		%feature("autodoc", "Return
-------
opencascade::handle<Adaptor3d_Curve>

Description
-----------
only for SurfaceOfExtrusion and SurfaceOfRevolution Warning: this will make a copy of the underlying curve since it applies to it the transformation myTrsf. Be careful when using this method.
") BasisCurve;
		opencascade::handle<Adaptor3d_Curve> BasisCurve();

		/****** BRepAdaptor_Surface::BasisSurface ******/
		/****** md5 signature: de63a8a43356a45f5d395e828ec0014c ******/
		%feature("compactdefaultargs") BasisSurface;
		%feature("autodoc", "Return
-------
opencascade::handle<Adaptor3d_Surface>

Description
-----------
No available documentation.
") BasisSurface;
		opencascade::handle<Adaptor3d_Surface> BasisSurface();

		/****** BRepAdaptor_Surface::Bezier ******/
		/****** md5 signature: 98b7293dc91af28a1a57c0bfbd1e467a ******/
		%feature("compactdefaultargs") Bezier;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_BezierSurface>

Description
-----------
No available documentation.
") Bezier;
		opencascade::handle<Geom_BezierSurface> Bezier();

		/****** BRepAdaptor_Surface::ChangeSurface ******/
		/****** md5 signature: ead718e69fe53e8fd677c1b9c64ff5a3 ******/
		%feature("compactdefaultargs") ChangeSurface;
		%feature("autodoc", "Return
-------
GeomAdaptor_Surface

Description
-----------
Returns the surface.
") ChangeSurface;
		GeomAdaptor_Surface & ChangeSurface();

		/****** BRepAdaptor_Surface::Cone ******/
		/****** md5 signature: 3ce87f79e83a129f74e88ef746e3e34b ******/
		%feature("compactdefaultargs") Cone;
		%feature("autodoc", "Return
-------
gp_Cone

Description
-----------
No available documentation.
") Cone;
		gp_Cone Cone();

		/****** BRepAdaptor_Surface::Cylinder ******/
		/****** md5 signature: fdc0e133b47b8d299b834e1b65638963 ******/
		%feature("compactdefaultargs") Cylinder;
		%feature("autodoc", "Return
-------
gp_Cylinder

Description
-----------
No available documentation.
") Cylinder;
		gp_Cylinder Cylinder();

		/****** BRepAdaptor_Surface::D0 ******/
		/****** md5 signature: 909f7ecc223d561155c9c3ba4b8e7b64 ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
U: float
V: float
P: gp_Pnt

Return
-------
None

Description
-----------
Computes the point of parameters U,V on the surface.
") D0;
		void D0(const Standard_Real U, const Standard_Real V, gp_Pnt & P);

		/****** BRepAdaptor_Surface::D1 ******/
		/****** md5 signature: 0868b105367e01c443402a5728aa3395 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
U: float
V: float
P: gp_Pnt
D1U: gp_Vec
D1V: gp_Vec

Return
-------
None

Description
-----------
Computes the point and the first derivatives on the surface. Raised if the continuity of the current intervals is not C1. //! Tip: use GeomLib::NormEstim() to calculate surface normal at specified (U, V) point.
") D1;
		void D1(const Standard_Real U, const Standard_Real V, gp_Pnt & P, gp_Vec & D1U, gp_Vec & D1V);

		/****** BRepAdaptor_Surface::D2 ******/
		/****** md5 signature: 5bdb029d3f1561c55d7ab1d1b0b0282a ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
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

Return
-------
None

Description
-----------
Computes the point, the first and second derivatives on the surface. Raised if the continuity of the current intervals is not C2.
") D2;
		void D2(const Standard_Real U, const Standard_Real V, gp_Pnt & P, gp_Vec & D1U, gp_Vec & D1V, gp_Vec & D2U, gp_Vec & D2V, gp_Vec & D2UV);

		/****** BRepAdaptor_Surface::D3 ******/
		/****** md5 signature: 2fbd4d1b6bb5f19034b05b5a6e0ddec0 ******/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "
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

Return
-------
None

Description
-----------
Computes the point, the first, second and third derivatives on the surface. Raised if the continuity of the current intervals is not C3.
") D3;
		void D3(const Standard_Real U, const Standard_Real V, gp_Pnt & P, gp_Vec & D1U, gp_Vec & D1V, gp_Vec & D2U, gp_Vec & D2V, gp_Vec & D2UV, gp_Vec & D3U, gp_Vec & D3V, gp_Vec & D3UUV, gp_Vec & D3UVV);

		/****** BRepAdaptor_Surface::DN ******/
		/****** md5 signature: 78200f5fa5a4060f4022c2e3d9d8ac0e ******/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "
Parameters
----------
U: float
V: float
Nu: int
Nv: int

Return
-------
gp_Vec

Description
-----------
Computes the derivative of order Nu in the direction U and Nv in the direction V at the point P(U, V). Raised if the current U interval is not not CNu and the current V interval is not CNv. Raised if Nu + Nv < 1 or Nu < 0 or Nv < 0.
") DN;
		gp_Vec DN(const Standard_Real U, const Standard_Real V, const Standard_Integer Nu, const Standard_Integer Nv);

		/****** BRepAdaptor_Surface::Direction ******/
		/****** md5 signature: 701909e88752dfbf540944de6bad9f3a ******/
		%feature("compactdefaultargs") Direction;
		%feature("autodoc", "Return
-------
gp_Dir

Description
-----------
No available documentation.
") Direction;
		gp_Dir Direction();

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

		/****** BRepAdaptor_Surface::FirstUParameter ******/
		/****** md5 signature: 9f6a318ef39f30d9051cc243f6edc9ac ******/
		%feature("compactdefaultargs") FirstUParameter;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") FirstUParameter;
		virtual Standard_Real FirstUParameter();

		/****** BRepAdaptor_Surface::FirstVParameter ******/
		/****** md5 signature: 026c8b687e22be56263a275efcb1a191 ******/
		%feature("compactdefaultargs") FirstVParameter;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") FirstVParameter;
		virtual Standard_Real FirstVParameter();

		/****** BRepAdaptor_Surface::GetType ******/
		/****** md5 signature: 936170b269276a5a12605a71a86272c0 ******/
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "Return
-------
GeomAbs_SurfaceType

Description
-----------
Returns the type of the surface: Plane, Cylinder, Cone, Sphere, Torus, BezierSurface, BSplineSurface, SurfaceOfRevolution, SurfaceOfExtrusion, OtherSurface.
") GetType;
		virtual GeomAbs_SurfaceType GetType();

		/****** BRepAdaptor_Surface::Initialize ******/
		/****** md5 signature: f3aeecb0e2fbd866889f168f070cf082 ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face
Restriction: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Sets the surface to the geometry of <F>.
") Initialize;
		void Initialize(const TopoDS_Face & F, const Standard_Boolean Restriction = Standard_True);

		/****** BRepAdaptor_Surface::IsUClosed ******/
		/****** md5 signature: 3889881a8bccaf01bdc63482d847fec7 ******/
		%feature("compactdefaultargs") IsUClosed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsUClosed;
		virtual Standard_Boolean IsUClosed();

		/****** BRepAdaptor_Surface::IsUPeriodic ******/
		/****** md5 signature: baaa80f0fba4fab1ff0458c41067535b ******/
		%feature("compactdefaultargs") IsUPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsUPeriodic;
		virtual Standard_Boolean IsUPeriodic();

		/****** BRepAdaptor_Surface::IsURational ******/
		/****** md5 signature: 972bde55bb1931ba89cfd38a75b346b4 ******/
		%feature("compactdefaultargs") IsURational;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsURational;
		virtual Standard_Boolean IsURational();

		/****** BRepAdaptor_Surface::IsVClosed ******/
		/****** md5 signature: f5d8b2178f14695d158c648b5d67e50b ******/
		%feature("compactdefaultargs") IsVClosed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsVClosed;
		virtual Standard_Boolean IsVClosed();

		/****** BRepAdaptor_Surface::IsVPeriodic ******/
		/****** md5 signature: a7b7752f1716f49329b3486241deda0e ******/
		%feature("compactdefaultargs") IsVPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsVPeriodic;
		virtual Standard_Boolean IsVPeriodic();

		/****** BRepAdaptor_Surface::IsVRational ******/
		/****** md5 signature: bfc5bd774a4b38bf6259615a711f8ed2 ******/
		%feature("compactdefaultargs") IsVRational;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsVRational;
		virtual Standard_Boolean IsVRational();

		/****** BRepAdaptor_Surface::LastUParameter ******/
		/****** md5 signature: 3133997e2ee3ea09c0b46a884e833ca4 ******/
		%feature("compactdefaultargs") LastUParameter;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") LastUParameter;
		virtual Standard_Real LastUParameter();

		/****** BRepAdaptor_Surface::LastVParameter ******/
		/****** md5 signature: f1f64233932dd0768276d78ffb537717 ******/
		%feature("compactdefaultargs") LastVParameter;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") LastVParameter;
		virtual Standard_Real LastVParameter();

		/****** BRepAdaptor_Surface::NbUIntervals ******/
		/****** md5 signature: ae4875076949dd10d5b3e8aa53673562 ******/
		%feature("compactdefaultargs") NbUIntervals;
		%feature("autodoc", "
Parameters
----------
theSh: GeomAbs_Shape

Return
-------
int

Description
-----------
If necessary, breaks the surface in U intervals of continuity <S>. And returns the number of intervals.
") NbUIntervals;
		virtual Standard_Integer NbUIntervals(const GeomAbs_Shape theSh);

		/****** BRepAdaptor_Surface::NbUKnots ******/
		/****** md5 signature: 9c52bcf67cce67b26f246c3aa4ea551f ******/
		%feature("compactdefaultargs") NbUKnots;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbUKnots;
		virtual Standard_Integer NbUKnots();

		/****** BRepAdaptor_Surface::NbUPoles ******/
		/****** md5 signature: 8d31152e70dd85bb21fb36dbd5b33693 ******/
		%feature("compactdefaultargs") NbUPoles;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbUPoles;
		virtual Standard_Integer NbUPoles();

		/****** BRepAdaptor_Surface::NbVIntervals ******/
		/****** md5 signature: f8d85deebab1e39694985284c6a9f17e ******/
		%feature("compactdefaultargs") NbVIntervals;
		%feature("autodoc", "
Parameters
----------
theSh: GeomAbs_Shape

Return
-------
int

Description
-----------
If necessary, breaks the surface in V intervals of continuity <S>. And returns the number of intervals.
") NbVIntervals;
		virtual Standard_Integer NbVIntervals(const GeomAbs_Shape theSh);

		/****** BRepAdaptor_Surface::NbVKnots ******/
		/****** md5 signature: 6aef7952062b9c9994e4e5162b5eecc2 ******/
		%feature("compactdefaultargs") NbVKnots;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbVKnots;
		virtual Standard_Integer NbVKnots();

		/****** BRepAdaptor_Surface::NbVPoles ******/
		/****** md5 signature: c198f9b4e351d69009dae4cc79544fc2 ******/
		%feature("compactdefaultargs") NbVPoles;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbVPoles;
		virtual Standard_Integer NbVPoles();

		/****** BRepAdaptor_Surface::OffsetValue ******/
		/****** md5 signature: ae23f5f41fc62b65137ff41b8ee27c47 ******/
		%feature("compactdefaultargs") OffsetValue;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") OffsetValue;
		Standard_Real OffsetValue();

		/****** BRepAdaptor_Surface::Plane ******/
		/****** md5 signature: 38bd3e56cdca70a78cd998154292a430 ******/
		%feature("compactdefaultargs") Plane;
		%feature("autodoc", "Return
-------
gp_Pln

Description
-----------
No available documentation.
") Plane;
		gp_Pln Plane();

		/****** BRepAdaptor_Surface::ShallowCopy ******/
		/****** md5 signature: 0f1e5e5cc4137678a63b6cdf38f07462 ******/
		%feature("compactdefaultargs") ShallowCopy;
		%feature("autodoc", "Return
-------
opencascade::handle<Adaptor3d_Surface>

Description
-----------
Shallow copy of adaptor.
") ShallowCopy;
		virtual opencascade::handle<Adaptor3d_Surface> ShallowCopy();

		/****** BRepAdaptor_Surface::Sphere ******/
		/****** md5 signature: d13f3935ec312564a2f8ef1b299ecf9a ******/
		%feature("compactdefaultargs") Sphere;
		%feature("autodoc", "Return
-------
gp_Sphere

Description
-----------
No available documentation.
") Sphere;
		gp_Sphere Sphere();

		/****** BRepAdaptor_Surface::Surface ******/
		/****** md5 signature: e09b6aa0166ca76f2672af1ac0cf0ae2 ******/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "Return
-------
GeomAdaptor_Surface

Description
-----------
Returns the surface.
") Surface;
		GeomAdaptor_Surface Surface();

		/****** BRepAdaptor_Surface::Tolerance ******/
		/****** md5 signature: 9e5775014410d884d1a1adc1cd47930b ******/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the face tolerance.
") Tolerance;
		Standard_Real Tolerance();

		/****** BRepAdaptor_Surface::Torus ******/
		/****** md5 signature: 13ce946397b0f1bcfd3f38f215bbadac ******/
		%feature("compactdefaultargs") Torus;
		%feature("autodoc", "Return
-------
gp_Torus

Description
-----------
No available documentation.
") Torus;
		gp_Torus Torus();

		/****** BRepAdaptor_Surface::Trsf ******/
		/****** md5 signature: 97ab79d36bbfac916eee88e8b5acb351 ******/
		%feature("compactdefaultargs") Trsf;
		%feature("autodoc", "Return
-------
gp_Trsf

Description
-----------
Returns the surface coordinate system.
") Trsf;
		const gp_Trsf Trsf();

		/****** BRepAdaptor_Surface::UContinuity ******/
		/****** md5 signature: 3d5af3bf8bc22c7a70f14bdb9e75696a ******/
		%feature("compactdefaultargs") UContinuity;
		%feature("autodoc", "Return
-------
GeomAbs_Shape

Description
-----------
No available documentation.
") UContinuity;
		virtual GeomAbs_Shape UContinuity();

		/****** BRepAdaptor_Surface::UDegree ******/
		/****** md5 signature: 2acc7b7f865332e05b9779cd0a953da6 ******/
		%feature("compactdefaultargs") UDegree;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") UDegree;
		virtual Standard_Integer UDegree();

		/****** BRepAdaptor_Surface::UIntervals ******/
		/****** md5 signature: 5a653f364681c4a5c1065b7e92c5d659 ******/
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
		void UIntervals(TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****** BRepAdaptor_Surface::UPeriod ******/
		/****** md5 signature: 9816370c908f909f6185bf5b607b6ed4 ******/
		%feature("compactdefaultargs") UPeriod;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") UPeriod;
		virtual Standard_Real UPeriod();

		/****** BRepAdaptor_Surface::UResolution ******/
		/****** md5 signature: c908970ed85794b4b55fe21095a41df4 ******/
		%feature("compactdefaultargs") UResolution;
		%feature("autodoc", "
Parameters
----------
theR3d: float

Return
-------
float

Description
-----------
Returns the parametric U resolution corresponding to the real space resolution <R3d>.
") UResolution;
		virtual Standard_Real UResolution(const Standard_Real theR3d);

		/****** BRepAdaptor_Surface::UTrim ******/
		/****** md5 signature: 3604326125cf753b2a6722a946fb54be ******/
		%feature("compactdefaultargs") UTrim;
		%feature("autodoc", "
Parameters
----------
First: float
Last: float
Tol: float

Return
-------
opencascade::handle<Adaptor3d_Surface>

Description
-----------
Returns a surface trimmed in the U direction equivalent of <self> between parameters <First> and <Last>. <Tol> is used to test for 3d points confusion. If <First> >= <Last>.
") UTrim;
		opencascade::handle<Adaptor3d_Surface> UTrim(const Standard_Real First, const Standard_Real Last, const Standard_Real Tol);

		/****** BRepAdaptor_Surface::VContinuity ******/
		/****** md5 signature: a992dce85d001ed1cf99e1672e6d07ff ******/
		%feature("compactdefaultargs") VContinuity;
		%feature("autodoc", "Return
-------
GeomAbs_Shape

Description
-----------
No available documentation.
") VContinuity;
		virtual GeomAbs_Shape VContinuity();

		/****** BRepAdaptor_Surface::VDegree ******/
		/****** md5 signature: 40f217d7a0d71a97880e9ed212ed6f4e ******/
		%feature("compactdefaultargs") VDegree;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") VDegree;
		virtual Standard_Integer VDegree();

		/****** BRepAdaptor_Surface::VIntervals ******/
		/****** md5 signature: bf8bef8286fec18f81beea299dd5cb6d ******/
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
		void VIntervals(TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****** BRepAdaptor_Surface::VPeriod ******/
		/****** md5 signature: 72036cc062bfffc50fc8cd70671f4f03 ******/
		%feature("compactdefaultargs") VPeriod;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") VPeriod;
		virtual Standard_Real VPeriod();

		/****** BRepAdaptor_Surface::VResolution ******/
		/****** md5 signature: 6834713e8a40b99362514d586f78d876 ******/
		%feature("compactdefaultargs") VResolution;
		%feature("autodoc", "
Parameters
----------
theR3d: float

Return
-------
float

Description
-----------
Returns the parametric V resolution corresponding to the real space resolution <R3d>.
") VResolution;
		virtual Standard_Real VResolution(const Standard_Real theR3d);

		/****** BRepAdaptor_Surface::VTrim ******/
		/****** md5 signature: d094345261a4439c6edc98b200ea4e3d ******/
		%feature("compactdefaultargs") VTrim;
		%feature("autodoc", "
Parameters
----------
First: float
Last: float
Tol: float

Return
-------
opencascade::handle<Adaptor3d_Surface>

Description
-----------
Returns a surface trimmed in the V direction between parameters <First> and <Last>. <Tol> is used to test for 3d points confusion. If <First> >= <Last>.
") VTrim;
		opencascade::handle<Adaptor3d_Surface> VTrim(const Standard_Real First, const Standard_Real Last, const Standard_Real Tol);

		/****** BRepAdaptor_Surface::Value ******/
		/****** md5 signature: bc01a119296408176c75cc0dfb0636ae ******/
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
Computes the point of parameters U,V on the surface. Tip: use GeomLib::NormEstim() to calculate surface normal at specified (U, V) point.
") Value;
		gp_Pnt Value(const Standard_Real U, const Standard_Real V);

};


%make_alias(BRepAdaptor_Surface)

%extend BRepAdaptor_Surface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */

class BRepAdaptor_HArray1OfCurve : public BRepAdaptor_Array1OfCurve, public Standard_Transient {
  public:
    BRepAdaptor_HArray1OfCurve(const Standard_Integer theLower, const Standard_Integer theUpper);
    BRepAdaptor_HArray1OfCurve(const Standard_Integer theLower, const Standard_Integer theUpper, const BRepAdaptor_Array1OfCurve::value_type& theValue);
    BRepAdaptor_HArray1OfCurve(const BRepAdaptor_Array1OfCurve& theOther);
    const BRepAdaptor_Array1OfCurve& Array1();
    BRepAdaptor_Array1OfCurve& ChangeArray1();
};
%make_alias(BRepAdaptor_HArray1OfCurve)

/* harray2 classes */
/* hsequence classes */
/* class aliases */
%pythoncode {
}
