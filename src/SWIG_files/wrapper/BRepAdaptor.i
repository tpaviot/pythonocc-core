/*
Copyright 2008-2020 Thomas Paviot (tpaviot@gmail.com)

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
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_brepadaptor.html"
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
%include ../common/Operators.i
%include ../common/OccHandle.i


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
from OCC.Core.Exception import *
};

/* public enums */
/* end public enums declaration */

/* python proy classes for enums */
%pythoncode {
};
/* end python proxy for enums */

/* handles */
%wrap_handle(BRepAdaptor_HCompCurve)
%wrap_handle(BRepAdaptor_HCurve)
%wrap_handle(BRepAdaptor_HCurve2d)
%wrap_handle(BRepAdaptor_HSurface)
%wrap_handle(BRepAdaptor_HArray1OfCurve)
/* end handles declaration */

/* templates */
%template(BRepAdaptor_Array1OfCurve) NCollection_Array1<BRepAdaptor_Curve>;

%extend NCollection_Array1<BRepAdaptor_Curve> {
    %pythoncode {
    def __getitem__(self, index):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            return self.Value(index + self.Lower())

    def __setitem__(self, index, value):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            self.SetValue(index + self.Lower(), value)

    def __len__(self):
        return self.Length()

    def __iter__(self):
        self.low = self.Lower()
        self.up = self.Upper()
        self.current = self.Lower() - 1
        return self

    def next(self):
        if self.current >= self.Upper():
            raise StopIteration
        else:
            self.current += 1
        return self.Value(self.current)

    __next__ = next
    }
};
/* end templates declaration */

/* typedefs */
typedef NCollection_Array1<BRepAdaptor_Curve> BRepAdaptor_Array1OfCurve;
/* end typedefs declaration */

/******************************
* class BRepAdaptor_CompCurve *
******************************/
class BRepAdaptor_CompCurve : public Adaptor3d_Curve {
	public:
		/****************** BRepAdaptor_CompCurve ******************/
		%feature("compactdefaultargs") BRepAdaptor_CompCurve;
		%feature("autodoc", "Creates an undefined curve with no wire loaded.

Returns
-------
None
") BRepAdaptor_CompCurve;
		 BRepAdaptor_CompCurve();

		/****************** BRepAdaptor_CompCurve ******************/
		%feature("compactdefaultargs") BRepAdaptor_CompCurve;
		%feature("autodoc", "No available documentation.

Parameters
----------
W: TopoDS_Wire
KnotByCurvilinearAbcissa: bool,optional
	default value is Standard_False

Returns
-------
None
") BRepAdaptor_CompCurve;
		 BRepAdaptor_CompCurve(const TopoDS_Wire & W, const Standard_Boolean KnotByCurvilinearAbcissa = Standard_False);

		/****************** BRepAdaptor_CompCurve ******************/
		%feature("compactdefaultargs") BRepAdaptor_CompCurve;
		%feature("autodoc", "Creates a curve to acces to the geometry of edge <w>.

Parameters
----------
W: TopoDS_Wire
KnotByCurvilinearAbcissa: bool
First: float
Last: float
Tol: float

Returns
-------
None
") BRepAdaptor_CompCurve;
		 BRepAdaptor_CompCurve(const TopoDS_Wire & W, const Standard_Boolean KnotByCurvilinearAbcissa, const Standard_Real First, const Standard_Real Last, const Standard_Real Tol);

		/****************** BSpline ******************/
		%feature("compactdefaultargs") BSpline;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom_BSplineCurve>
") BSpline;
		opencascade::handle<Geom_BSplineCurve> BSpline();

		/****************** Bezier ******************/
		%feature("compactdefaultargs") Bezier;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom_BezierCurve>
") Bezier;
		opencascade::handle<Geom_BezierCurve> Bezier();

		/****************** Circle ******************/
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Circ
") Circle;
		gp_Circ Circle();

		/****************** Continuity ******************/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "No available documentation.

Returns
-------
GeomAbs_Shape
") Continuity;
		GeomAbs_Shape Continuity();

		/****************** D0 ******************/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "Computes the point of parameter u.

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
		%feature("compactdefaultargs") Degree;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") Degree;
		Standard_Integer Degree();

		/****************** Edge ******************/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "Returns an edge and one parameter on them corresponding to the parameter u.

Parameters
----------
U: float
E: TopoDS_Edge

Returns
-------
UonE: float
") Edge;
		void Edge(const Standard_Real U, TopoDS_Edge & E, Standard_Real &OutValue);

		/****************** Ellipse ******************/
		%feature("compactdefaultargs") Ellipse;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Elips
") Ellipse;
		gp_Elips Ellipse();

		/****************** FirstParameter ******************/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") FirstParameter;
		Standard_Real FirstParameter();

		/****************** GetType ******************/
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "No available documentation.

Returns
-------
GeomAbs_CurveType
") GetType;
		GeomAbs_CurveType GetType();

		/****************** Hyperbola ******************/
		%feature("compactdefaultargs") Hyperbola;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Hypr
") Hyperbola;
		gp_Hypr Hyperbola();

		/****************** Initialize ******************/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Sets the wire <w>.

Parameters
----------
W: TopoDS_Wire
KnotByCurvilinearAbcissa: bool

Returns
-------
None
") Initialize;
		void Initialize(const TopoDS_Wire & W, const Standard_Boolean KnotByCurvilinearAbcissa);

		/****************** Initialize ******************/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Sets wire <w> and trimmed parameter.

Parameters
----------
W: TopoDS_Wire
KnotByCurvilinearAbcissa: bool
First: float
Last: float
Tol: float

Returns
-------
None
") Initialize;
		void Initialize(const TopoDS_Wire & W, const Standard_Boolean KnotByCurvilinearAbcissa, const Standard_Real First, const Standard_Real Last, const Standard_Real Tol);

		/****************** Intervals ******************/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "Stores in <t> the parameters bounding the intervals of continuity <s>. //! the array must provide enough room to accomodate for the parameters. i.e. t.length() > nbintervals().

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
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsClosed;
		Standard_Boolean IsClosed();

		/****************** IsPeriodic ******************/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsPeriodic;
		Standard_Boolean IsPeriodic();

		/****************** IsRational ******************/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsRational;
		Standard_Boolean IsRational();

		/****************** LastParameter ******************/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") LastParameter;
		Standard_Real LastParameter();

		/****************** Line ******************/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Lin
") Line;
		gp_Lin Line();

		/****************** NbIntervals ******************/
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
		%feature("compactdefaultargs") NbKnots;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbKnots;
		Standard_Integer NbKnots();

		/****************** NbPoles ******************/
		%feature("compactdefaultargs") NbPoles;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbPoles;
		Standard_Integer NbPoles();

		/****************** Parabola ******************/
		%feature("compactdefaultargs") Parabola;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Parab
") Parabola;
		gp_Parab Parabola();

		/****************** Period ******************/
		%feature("compactdefaultargs") Period;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Period;
		Standard_Real Period();

		/****************** Resolution ******************/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "Returns the parametric resolution.

Parameters
----------
R3d: float

Returns
-------
float
") Resolution;
		Standard_Real Resolution(const Standard_Real R3d);

		/****************** Trim ******************/
		%feature("compactdefaultargs") Trim;
		%feature("autodoc", "Returns a curve equivalent of <self> between parameters <first> and <last>. <tol> is used to test for 3d points confusion. if <first> >= <last>.

Parameters
----------
First: float
Last: float
Tol: float

Returns
-------
opencascade::handle<Adaptor3d_HCurve>
") Trim;
		opencascade::handle<Adaptor3d_HCurve> Trim(const Standard_Real First, const Standard_Real Last, const Standard_Real Tol);

		/****************** Value ******************/
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

		/****************** Wire ******************/
		%feature("compactdefaultargs") Wire;
		%feature("autodoc", "Returns the wire.

Returns
-------
TopoDS_Wire
") Wire;
		const TopoDS_Wire Wire();

};


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
		/****************** BRepAdaptor_Curve ******************/
		%feature("compactdefaultargs") BRepAdaptor_Curve;
		%feature("autodoc", "Creates an undefined curve with no edge loaded.

Returns
-------
None
") BRepAdaptor_Curve;
		 BRepAdaptor_Curve();

		/****************** BRepAdaptor_Curve ******************/
		%feature("compactdefaultargs") BRepAdaptor_Curve;
		%feature("autodoc", "Creates a curve to acces to the geometry of edge <e>.

Parameters
----------
E: TopoDS_Edge

Returns
-------
None
") BRepAdaptor_Curve;
		 BRepAdaptor_Curve(const TopoDS_Edge & E);

		/****************** BRepAdaptor_Curve ******************/
		%feature("compactdefaultargs") BRepAdaptor_Curve;
		%feature("autodoc", "Creates a curve to acces to the geometry of edge <e>. the geometry will be computed using the parametric curve of <e> on the face <f>. an error is raised if the edge does not have a pcurve on the face.

Parameters
----------
E: TopoDS_Edge
F: TopoDS_Face

Returns
-------
None
") BRepAdaptor_Curve;
		 BRepAdaptor_Curve(const TopoDS_Edge & E, const TopoDS_Face & F);

		/****************** BSpline ******************/
		%feature("compactdefaultargs") BSpline;
		%feature("autodoc", "Warning : this will make a copy of the bspline curve since it applies to it mytsrf . be carefull when using this method.

Returns
-------
opencascade::handle<Geom_BSplineCurve>
") BSpline;
		opencascade::handle<Geom_BSplineCurve> BSpline();

		/****************** Bezier ******************/
		%feature("compactdefaultargs") Bezier;
		%feature("autodoc", "Warning : this will make a copy of the bezier curve since it applies to it mytsrf . be carefull when using this method.

Returns
-------
opencascade::handle<Geom_BezierCurve>
") Bezier;
		opencascade::handle<Geom_BezierCurve> Bezier();

		/****************** Circle ******************/
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Circ
") Circle;
		gp_Circ Circle();

		/****************** Continuity ******************/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "No available documentation.

Returns
-------
GeomAbs_Shape
") Continuity;
		GeomAbs_Shape Continuity();

		/****************** Curve ******************/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "Returns the curve of the edge.

Returns
-------
GeomAdaptor_Curve
") Curve;
		const GeomAdaptor_Curve & Curve();

		/****************** CurveOnSurface ******************/
		%feature("compactdefaultargs") CurveOnSurface;
		%feature("autodoc", "Returns the curveonsurface of the edge.

Returns
-------
Adaptor3d_CurveOnSurface
") CurveOnSurface;
		const Adaptor3d_CurveOnSurface & CurveOnSurface();

		/****************** D0 ******************/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "Computes the point of parameter u.

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
		%feature("compactdefaultargs") Degree;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") Degree;
		Standard_Integer Degree();

		/****************** Edge ******************/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "Returns the edge.

Returns
-------
TopoDS_Edge
") Edge;
		const TopoDS_Edge Edge();

		/****************** Ellipse ******************/
		%feature("compactdefaultargs") Ellipse;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Elips
") Ellipse;
		gp_Elips Ellipse();

		/****************** FirstParameter ******************/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") FirstParameter;
		Standard_Real FirstParameter();

		/****************** GetType ******************/
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "No available documentation.

Returns
-------
GeomAbs_CurveType
") GetType;
		GeomAbs_CurveType GetType();

		/****************** Hyperbola ******************/
		%feature("compactdefaultargs") Hyperbola;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Hypr
") Hyperbola;
		gp_Hypr Hyperbola();

		/****************** Initialize ******************/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Sets the curve <self> to acces to the geometry of edge <e>.

Parameters
----------
E: TopoDS_Edge

Returns
-------
None
") Initialize;
		void Initialize(const TopoDS_Edge & E);

		/****************** Initialize ******************/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Sets the curve <self> to acces to the geometry of edge <e>. the geometry will be computed using the parametric curve of <e> on the face <f>. an error is raised if the edge does not have a pcurve on the face.

Parameters
----------
E: TopoDS_Edge
F: TopoDS_Face

Returns
-------
None
") Initialize;
		void Initialize(const TopoDS_Edge & E, const TopoDS_Face & F);

		/****************** Intervals ******************/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "Stores in <t> the parameters bounding the intervals of continuity <s>. //! the array must provide enough room to accomodate for the parameters. i.e. t.length() > nbintervals().

Parameters
----------
T: TColStd_Array1OfReal
S: GeomAbs_Shape

Returns
-------
None
") Intervals;
		void Intervals(TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****************** Is3DCurve ******************/
		%feature("compactdefaultargs") Is3DCurve;
		%feature("autodoc", "Returns true if the edge geometry is computed from a 3d curve.

Returns
-------
bool
") Is3DCurve;
		Standard_Boolean Is3DCurve();

		/****************** IsClosed ******************/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsClosed;
		Standard_Boolean IsClosed();

		/****************** IsCurveOnSurface ******************/
		%feature("compactdefaultargs") IsCurveOnSurface;
		%feature("autodoc", "Returns true if the edge geometry is computed from a pcurve on a surface.

Returns
-------
bool
") IsCurveOnSurface;
		Standard_Boolean IsCurveOnSurface();

		/****************** IsPeriodic ******************/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsPeriodic;
		Standard_Boolean IsPeriodic();

		/****************** IsRational ******************/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsRational;
		Standard_Boolean IsRational();

		/****************** LastParameter ******************/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") LastParameter;
		Standard_Real LastParameter();

		/****************** Line ******************/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Lin
") Line;
		gp_Lin Line();

		/****************** NbIntervals ******************/
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
		%feature("compactdefaultargs") NbKnots;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbKnots;
		Standard_Integer NbKnots();

		/****************** NbPoles ******************/
		%feature("compactdefaultargs") NbPoles;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbPoles;
		Standard_Integer NbPoles();

		/****************** OffsetCurve ******************/
		%feature("compactdefaultargs") OffsetCurve;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom_OffsetCurve>
") OffsetCurve;
		opencascade::handle<Geom_OffsetCurve> OffsetCurve();

		/****************** Parabola ******************/
		%feature("compactdefaultargs") Parabola;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Parab
") Parabola;
		gp_Parab Parabola();

		/****************** Period ******************/
		%feature("compactdefaultargs") Period;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Period;
		Standard_Real Period();

		/****************** Reset ******************/
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", "Reset currently loaded curve (undone load()).

Returns
-------
None
") Reset;
		void Reset();

		/****************** Resolution ******************/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "Returns the parametric resolution.

Parameters
----------
R3d: float

Returns
-------
float
") Resolution;
		Standard_Real Resolution(const Standard_Real R3d);

		/****************** Tolerance ******************/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "Returns the edge tolerance.

Returns
-------
float
") Tolerance;
		Standard_Real Tolerance();

		/****************** Trim ******************/
		%feature("compactdefaultargs") Trim;
		%feature("autodoc", "Returns a curve equivalent of <self> between parameters <first> and <last>. <tol> is used to test for 3d points confusion. if <first> >= <last>.

Parameters
----------
First: float
Last: float
Tol: float

Returns
-------
opencascade::handle<Adaptor3d_HCurve>
") Trim;
		opencascade::handle<Adaptor3d_HCurve> Trim(const Standard_Real First, const Standard_Real Last, const Standard_Real Tol);

		/****************** Trsf ******************/
		%feature("compactdefaultargs") Trsf;
		%feature("autodoc", "Returns the coordinate system of the curve.

Returns
-------
gp_Trsf
") Trsf;
		const gp_Trsf Trsf();

		/****************** Value ******************/
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
		/****************** BRepAdaptor_Curve2d ******************/
		%feature("compactdefaultargs") BRepAdaptor_Curve2d;
		%feature("autodoc", "Creates an uninitialized curve2d.

Returns
-------
None
") BRepAdaptor_Curve2d;
		 BRepAdaptor_Curve2d();

		/****************** BRepAdaptor_Curve2d ******************/
		%feature("compactdefaultargs") BRepAdaptor_Curve2d;
		%feature("autodoc", "Creates with the pcurve of <e> on <f>.

Parameters
----------
E: TopoDS_Edge
F: TopoDS_Face

Returns
-------
None
") BRepAdaptor_Curve2d;
		 BRepAdaptor_Curve2d(const TopoDS_Edge & E, const TopoDS_Face & F);

		/****************** Edge ******************/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "Returns the edge.

Returns
-------
TopoDS_Edge
") Edge;
		const TopoDS_Edge Edge();

		/****************** Face ******************/
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "Returns the face.

Returns
-------
TopoDS_Face
") Face;
		const TopoDS_Face Face();

		/****************** Initialize ******************/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Initialize with the pcurve of <e> on <f>.

Parameters
----------
E: TopoDS_Edge
F: TopoDS_Face

Returns
-------
None
") Initialize;
		void Initialize(const TopoDS_Edge & E, const TopoDS_Face & F);

};


%extend BRepAdaptor_Curve2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class BRepAdaptor_HCompCurve *
*******************************/
class BRepAdaptor_HCompCurve : public Adaptor3d_HCurve {
	public:
		/****************** BRepAdaptor_HCompCurve ******************/
		%feature("compactdefaultargs") BRepAdaptor_HCompCurve;
		%feature("autodoc", "Creates an empty genhcurve.

Returns
-------
None
") BRepAdaptor_HCompCurve;
		 BRepAdaptor_HCompCurve();

		/****************** BRepAdaptor_HCompCurve ******************/
		%feature("compactdefaultargs") BRepAdaptor_HCompCurve;
		%feature("autodoc", "Creates a genhcurve from a curve.

Parameters
----------
C: BRepAdaptor_CompCurve

Returns
-------
None
") BRepAdaptor_HCompCurve;
		 BRepAdaptor_HCompCurve(const BRepAdaptor_CompCurve & C);

		/****************** ChangeCurve ******************/
		%feature("compactdefaultargs") ChangeCurve;
		%feature("autodoc", "Returns the curve used to create the genhcurve.

Returns
-------
BRepAdaptor_CompCurve
") ChangeCurve;
		BRepAdaptor_CompCurve & ChangeCurve();

		/****************** Curve ******************/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "Returns the curve used to create the genhcurve. this is redefined from hcurve, cannot be inline.

Returns
-------
Adaptor3d_Curve
") Curve;
		const Adaptor3d_Curve & Curve();

		/****************** GetCurve ******************/
		%feature("compactdefaultargs") GetCurve;
		%feature("autodoc", "Returns the curve used to create the genhcurve. this is redefined from hcurve, cannot be inline.

Returns
-------
Adaptor3d_Curve
") GetCurve;
		Adaptor3d_Curve & GetCurve();

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Sets the field of the genhcurve.

Parameters
----------
C: BRepAdaptor_CompCurve

Returns
-------
None
") Set;
		void Set(const BRepAdaptor_CompCurve & C);

};


%make_alias(BRepAdaptor_HCompCurve)

%extend BRepAdaptor_HCompCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class BRepAdaptor_HCurve *
***************************/
class BRepAdaptor_HCurve : public Adaptor3d_HCurve {
	public:
		/****************** BRepAdaptor_HCurve ******************/
		%feature("compactdefaultargs") BRepAdaptor_HCurve;
		%feature("autodoc", "Creates an empty genhcurve.

Returns
-------
None
") BRepAdaptor_HCurve;
		 BRepAdaptor_HCurve();

		/****************** BRepAdaptor_HCurve ******************/
		%feature("compactdefaultargs") BRepAdaptor_HCurve;
		%feature("autodoc", "Creates a genhcurve from a curve.

Parameters
----------
C: BRepAdaptor_Curve

Returns
-------
None
") BRepAdaptor_HCurve;
		 BRepAdaptor_HCurve(const BRepAdaptor_Curve & C);

		/****************** ChangeCurve ******************/
		%feature("compactdefaultargs") ChangeCurve;
		%feature("autodoc", "Returns the curve used to create the genhcurve.

Returns
-------
BRepAdaptor_Curve
") ChangeCurve;
		BRepAdaptor_Curve & ChangeCurve();

		/****************** Curve ******************/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "Returns the curve used to create the genhcurve. this is redefined from hcurve, cannot be inline.

Returns
-------
Adaptor3d_Curve
") Curve;
		const Adaptor3d_Curve & Curve();

		/****************** GetCurve ******************/
		%feature("compactdefaultargs") GetCurve;
		%feature("autodoc", "Returns the curve used to create the genhcurve. this is redefined from hcurve, cannot be inline.

Returns
-------
Adaptor3d_Curve
") GetCurve;
		Adaptor3d_Curve & GetCurve();

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Sets the field of the genhcurve.

Parameters
----------
C: BRepAdaptor_Curve

Returns
-------
None
") Set;
		void Set(const BRepAdaptor_Curve & C);

};


%make_alias(BRepAdaptor_HCurve)

%extend BRepAdaptor_HCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class BRepAdaptor_HCurve2d *
*****************************/
class BRepAdaptor_HCurve2d : public Adaptor2d_HCurve2d {
	public:
		/****************** BRepAdaptor_HCurve2d ******************/
		%feature("compactdefaultargs") BRepAdaptor_HCurve2d;
		%feature("autodoc", "Creates an empty genhcurve2d.

Returns
-------
None
") BRepAdaptor_HCurve2d;
		 BRepAdaptor_HCurve2d();

		/****************** BRepAdaptor_HCurve2d ******************/
		%feature("compactdefaultargs") BRepAdaptor_HCurve2d;
		%feature("autodoc", "Creates a genhcurve2d from a curve.

Parameters
----------
C: BRepAdaptor_Curve2d

Returns
-------
None
") BRepAdaptor_HCurve2d;
		 BRepAdaptor_HCurve2d(const BRepAdaptor_Curve2d & C);

		/****************** ChangeCurve2d ******************/
		%feature("compactdefaultargs") ChangeCurve2d;
		%feature("autodoc", "Returns the curve used to create the genhcurve.

Returns
-------
BRepAdaptor_Curve2d
") ChangeCurve2d;
		BRepAdaptor_Curve2d & ChangeCurve2d();

		/****************** Curve2d ******************/
		%feature("compactdefaultargs") Curve2d;
		%feature("autodoc", "Returns the curve used to create the genhcurve2d. this is redefined from hcurve2d, cannot be inline.

Returns
-------
Adaptor2d_Curve2d
") Curve2d;
		const Adaptor2d_Curve2d & Curve2d();

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Sets the field of the genhcurve2d.

Parameters
----------
C: BRepAdaptor_Curve2d

Returns
-------
None
") Set;
		void Set(const BRepAdaptor_Curve2d & C);

};


%make_alias(BRepAdaptor_HCurve2d)

%extend BRepAdaptor_HCurve2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class BRepAdaptor_HSurface *
*****************************/
class BRepAdaptor_HSurface : public Adaptor3d_HSurface {
	public:
		/****************** BRepAdaptor_HSurface ******************/
		%feature("compactdefaultargs") BRepAdaptor_HSurface;
		%feature("autodoc", "Creates an empty genhsurface.

Returns
-------
None
") BRepAdaptor_HSurface;
		 BRepAdaptor_HSurface();

		/****************** BRepAdaptor_HSurface ******************/
		%feature("compactdefaultargs") BRepAdaptor_HSurface;
		%feature("autodoc", "Creates a genhsurface from a surface.

Parameters
----------
S: BRepAdaptor_Surface

Returns
-------
None
") BRepAdaptor_HSurface;
		 BRepAdaptor_HSurface(const BRepAdaptor_Surface & S);

		/****************** ChangeSurface ******************/
		%feature("compactdefaultargs") ChangeSurface;
		%feature("autodoc", "Returns the surface used to create the genhsurface.

Returns
-------
BRepAdaptor_Surface
") ChangeSurface;
		BRepAdaptor_Surface & ChangeSurface();

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Sets the field of the genhsurface.

Parameters
----------
S: BRepAdaptor_Surface

Returns
-------
None
") Set;
		void Set(const BRepAdaptor_Surface & S);

		/****************** Surface ******************/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "Returns a reference to the surface inside the hsurface. this is redefined from hsurface, cannot be inline.

Returns
-------
Adaptor3d_Surface
") Surface;
		const Adaptor3d_Surface & Surface();

};


%make_alias(BRepAdaptor_HSurface)

%extend BRepAdaptor_HSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class BRepAdaptor_Surface *
****************************/
class BRepAdaptor_Surface : public Adaptor3d_Surface {
	public:
		/****************** BRepAdaptor_Surface ******************/
		%feature("compactdefaultargs") BRepAdaptor_Surface;
		%feature("autodoc", "Creates an undefined surface with no face loaded.

Returns
-------
None
") BRepAdaptor_Surface;
		 BRepAdaptor_Surface();

		/****************** BRepAdaptor_Surface ******************/
		%feature("compactdefaultargs") BRepAdaptor_Surface;
		%feature("autodoc", "Creates a surface to access the geometry of <f>. if <restriction> is true the parameter range is the parameter range in the uv space of the restriction.

Parameters
----------
F: TopoDS_Face
R: bool,optional
	default value is Standard_True

Returns
-------
None
") BRepAdaptor_Surface;
		 BRepAdaptor_Surface(const TopoDS_Face & F, const Standard_Boolean R = Standard_True);

		/****************** AxeOfRevolution ******************/
		%feature("compactdefaultargs") AxeOfRevolution;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Ax1
") AxeOfRevolution;
		gp_Ax1 AxeOfRevolution();

		/****************** BSpline ******************/
		%feature("compactdefaultargs") BSpline;
		%feature("autodoc", "Warning : this will make a copy of the bspline surface since it applies to it the mytsrf transformation be carefull when using this method.

Returns
-------
opencascade::handle<Geom_BSplineSurface>
") BSpline;
		opencascade::handle<Geom_BSplineSurface> BSpline();

		/****************** BasisCurve ******************/
		%feature("compactdefaultargs") BasisCurve;
		%feature("autodoc", "Only for surfaceofextrusion and surfaceofrevolution warning: this will make a copy of the underlying curve since it applies to it the transformation mytrsf. be carefull when using this method.

Returns
-------
opencascade::handle<Adaptor3d_HCurve>
") BasisCurve;
		opencascade::handle<Adaptor3d_HCurve> BasisCurve();

		/****************** BasisSurface ******************/
		%feature("compactdefaultargs") BasisSurface;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Adaptor3d_HSurface>
") BasisSurface;
		opencascade::handle<Adaptor3d_HSurface> BasisSurface();

		/****************** Bezier ******************/
		%feature("compactdefaultargs") Bezier;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom_BezierSurface>
") Bezier;
		opencascade::handle<Geom_BezierSurface> Bezier();

		/****************** ChangeSurface ******************/
		%feature("compactdefaultargs") ChangeSurface;
		%feature("autodoc", "Returns the surface.

Returns
-------
GeomAdaptor_Surface
") ChangeSurface;
		GeomAdaptor_Surface & ChangeSurface();

		/****************** Cone ******************/
		%feature("compactdefaultargs") Cone;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Cone
") Cone;
		gp_Cone Cone();

		/****************** Cylinder ******************/
		%feature("compactdefaultargs") Cylinder;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Cylinder
") Cylinder;
		gp_Cylinder Cylinder();

		/****************** D0 ******************/
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
		void D0(const Standard_Real U, const Standard_Real V, gp_Pnt & P);

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "Computes the point and the first derivatives on the surface. raised if the continuity of the current intervals is not c1.

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
		void D1(const Standard_Real U, const Standard_Real V, gp_Pnt & P, gp_Vec & D1U, gp_Vec & D1V);

		/****************** D2 ******************/
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
		void D2(const Standard_Real U, const Standard_Real V, gp_Pnt & P, gp_Vec & D1U, gp_Vec & D1V, gp_Vec & D2U, gp_Vec & D2V, gp_Vec & D2UV);

		/****************** D3 ******************/
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
		void D3(const Standard_Real U, const Standard_Real V, gp_Pnt & P, gp_Vec & D1U, gp_Vec & D1V, gp_Vec & D2U, gp_Vec & D2V, gp_Vec & D2UV, gp_Vec & D3U, gp_Vec & D3V, gp_Vec & D3UUV, gp_Vec & D3UVV);

		/****************** DN ******************/
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
		gp_Vec DN(const Standard_Real U, const Standard_Real V, const Standard_Integer Nu, const Standard_Integer Nv);

		/****************** Direction ******************/
		%feature("compactdefaultargs") Direction;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Dir
") Direction;
		gp_Dir Direction();

		/****************** Face ******************/
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "Returns the face.

Returns
-------
TopoDS_Face
") Face;
		const TopoDS_Face Face();

		/****************** FirstUParameter ******************/
		%feature("compactdefaultargs") FirstUParameter;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") FirstUParameter;
		Standard_Real FirstUParameter();

		/****************** FirstVParameter ******************/
		%feature("compactdefaultargs") FirstVParameter;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") FirstVParameter;
		Standard_Real FirstVParameter();

		/****************** GetType ******************/
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "Returns the type of the surface : plane, cylinder, cone, sphere, torus, beziersurface, bsplinesurface, surfaceofrevolution, surfaceofextrusion, othersurface.

Returns
-------
GeomAbs_SurfaceType
") GetType;
		GeomAbs_SurfaceType GetType();

		/****************** Initialize ******************/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Sets the surface to the geometry of <f>.

Parameters
----------
F: TopoDS_Face
Restriction: bool,optional
	default value is Standard_True

Returns
-------
None
") Initialize;
		void Initialize(const TopoDS_Face & F, const Standard_Boolean Restriction = Standard_True);

		/****************** IsUClosed ******************/
		%feature("compactdefaultargs") IsUClosed;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsUClosed;
		Standard_Boolean IsUClosed();

		/****************** IsUPeriodic ******************/
		%feature("compactdefaultargs") IsUPeriodic;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsUPeriodic;
		Standard_Boolean IsUPeriodic();

		/****************** IsURational ******************/
		%feature("compactdefaultargs") IsURational;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsURational;
		Standard_Boolean IsURational();

		/****************** IsVClosed ******************/
		%feature("compactdefaultargs") IsVClosed;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsVClosed;
		Standard_Boolean IsVClosed();

		/****************** IsVPeriodic ******************/
		%feature("compactdefaultargs") IsVPeriodic;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsVPeriodic;
		Standard_Boolean IsVPeriodic();

		/****************** IsVRational ******************/
		%feature("compactdefaultargs") IsVRational;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsVRational;
		Standard_Boolean IsVRational();

		/****************** LastUParameter ******************/
		%feature("compactdefaultargs") LastUParameter;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") LastUParameter;
		Standard_Real LastUParameter();

		/****************** LastVParameter ******************/
		%feature("compactdefaultargs") LastVParameter;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") LastVParameter;
		Standard_Real LastVParameter();

		/****************** NbUIntervals ******************/
		%feature("compactdefaultargs") NbUIntervals;
		%feature("autodoc", "If necessary, breaks the surface in u intervals of continuity <s>. and returns the number of intervals.

Parameters
----------
S: GeomAbs_Shape

Returns
-------
int
") NbUIntervals;
		Standard_Integer NbUIntervals(const GeomAbs_Shape S);

		/****************** NbUKnots ******************/
		%feature("compactdefaultargs") NbUKnots;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbUKnots;
		Standard_Integer NbUKnots();

		/****************** NbUPoles ******************/
		%feature("compactdefaultargs") NbUPoles;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbUPoles;
		Standard_Integer NbUPoles();

		/****************** NbVIntervals ******************/
		%feature("compactdefaultargs") NbVIntervals;
		%feature("autodoc", "If necessary, breaks the surface in v intervals of continuity <s>. and returns the number of intervals.

Parameters
----------
S: GeomAbs_Shape

Returns
-------
int
") NbVIntervals;
		Standard_Integer NbVIntervals(const GeomAbs_Shape S);

		/****************** NbVKnots ******************/
		%feature("compactdefaultargs") NbVKnots;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbVKnots;
		Standard_Integer NbVKnots();

		/****************** NbVPoles ******************/
		%feature("compactdefaultargs") NbVPoles;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbVPoles;
		Standard_Integer NbVPoles();

		/****************** OffsetValue ******************/
		%feature("compactdefaultargs") OffsetValue;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") OffsetValue;
		Standard_Real OffsetValue();

		/****************** Plane ******************/
		%feature("compactdefaultargs") Plane;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Pln
") Plane;
		gp_Pln Plane();

		/****************** Sphere ******************/
		%feature("compactdefaultargs") Sphere;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Sphere
") Sphere;
		gp_Sphere Sphere();

		/****************** Surface ******************/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "Returns the surface.

Returns
-------
GeomAdaptor_Surface
") Surface;
		const GeomAdaptor_Surface & Surface();

		/****************** Tolerance ******************/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "Returns the face tolerance.

Returns
-------
float
") Tolerance;
		Standard_Real Tolerance();

		/****************** Torus ******************/
		%feature("compactdefaultargs") Torus;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Torus
") Torus;
		gp_Torus Torus();

		/****************** Trsf ******************/
		%feature("compactdefaultargs") Trsf;
		%feature("autodoc", "Returns the surface coordinate system.

Returns
-------
gp_Trsf
") Trsf;
		const gp_Trsf Trsf();

		/****************** UContinuity ******************/
		%feature("compactdefaultargs") UContinuity;
		%feature("autodoc", "No available documentation.

Returns
-------
GeomAbs_Shape
") UContinuity;
		GeomAbs_Shape UContinuity();

		/****************** UDegree ******************/
		%feature("compactdefaultargs") UDegree;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") UDegree;
		Standard_Integer UDegree();

		/****************** UIntervals ******************/
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
		void UIntervals(TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****************** UPeriod ******************/
		%feature("compactdefaultargs") UPeriod;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") UPeriod;
		Standard_Real UPeriod();

		/****************** UResolution ******************/
		%feature("compactdefaultargs") UResolution;
		%feature("autodoc", "Returns the parametric u resolution corresponding to the real space resolution <r3d>.

Parameters
----------
R3d: float

Returns
-------
float
") UResolution;
		Standard_Real UResolution(const Standard_Real R3d);

		/****************** UTrim ******************/
		%feature("compactdefaultargs") UTrim;
		%feature("autodoc", "Returns a surface trimmed in the u direction equivalent of <self> between parameters <first> and <last>. <tol> is used to test for 3d points confusion. if <first> >= <last>.

Parameters
----------
First: float
Last: float
Tol: float

Returns
-------
opencascade::handle<Adaptor3d_HSurface>
") UTrim;
		opencascade::handle<Adaptor3d_HSurface> UTrim(const Standard_Real First, const Standard_Real Last, const Standard_Real Tol);

		/****************** VContinuity ******************/
		%feature("compactdefaultargs") VContinuity;
		%feature("autodoc", "No available documentation.

Returns
-------
GeomAbs_Shape
") VContinuity;
		GeomAbs_Shape VContinuity();

		/****************** VDegree ******************/
		%feature("compactdefaultargs") VDegree;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") VDegree;
		Standard_Integer VDegree();

		/****************** VIntervals ******************/
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
		void VIntervals(TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****************** VPeriod ******************/
		%feature("compactdefaultargs") VPeriod;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") VPeriod;
		Standard_Real VPeriod();

		/****************** VResolution ******************/
		%feature("compactdefaultargs") VResolution;
		%feature("autodoc", "Returns the parametric v resolution corresponding to the real space resolution <r3d>.

Parameters
----------
R3d: float

Returns
-------
float
") VResolution;
		Standard_Real VResolution(const Standard_Real R3d);

		/****************** VTrim ******************/
		%feature("compactdefaultargs") VTrim;
		%feature("autodoc", "Returns a surface trimmed in the v direction between parameters <first> and <last>. <tol> is used to test for 3d points confusion. if <first> >= <last>.

Parameters
----------
First: float
Last: float
Tol: float

Returns
-------
opencascade::handle<Adaptor3d_HSurface>
") VTrim;
		opencascade::handle<Adaptor3d_HSurface> VTrim(const Standard_Real First, const Standard_Real Last, const Standard_Real Tol);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Computes the point of parameters u,v on the surface.

Parameters
----------
U: float
V: float

Returns
-------
gp_Pnt
") Value;
		gp_Pnt Value(const Standard_Real U, const Standard_Real V);

};


%extend BRepAdaptor_Surface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
class BRepAdaptor_HArray1OfCurve : public  BRepAdaptor_Array1OfCurve, public Standard_Transient {
  public:
    BRepAdaptor_HArray1OfCurve(const Standard_Integer theLower, const Standard_Integer theUpper);
    BRepAdaptor_HArray1OfCurve(const Standard_Integer theLower, const Standard_Integer theUpper, const  BRepAdaptor_Array1OfCurve::value_type& theValue);
    BRepAdaptor_HArray1OfCurve(const  BRepAdaptor_Array1OfCurve& theOther);
    const  BRepAdaptor_Array1OfCurve& Array1();
     BRepAdaptor_Array1OfCurve& ChangeArray1();
};
%make_alias(BRepAdaptor_HArray1OfCurve)


/* harray2 classes */
/* hsequence classes */
