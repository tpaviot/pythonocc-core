/*
Copyright 2008-2019 Thomas Paviot (tpaviot@gmail.com)

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
/* public enums */
/* end public enums declaration */

/* handles */
%wrap_handle(BRepAdaptor_HCompCurve)
%wrap_handle(BRepAdaptor_HCurve)
%wrap_handle(BRepAdaptor_HCurve2d)
%wrap_handle(BRepAdaptor_HSurface)
%wrap_handle(BRepAdaptor_HArray1OfCurve)
/* end handles declaration */

/* templates */
%template(BRepAdaptor_Array1OfCurve) NCollection_Array1 <BRepAdaptor_Curve>;

%extend NCollection_Array1 <BRepAdaptor_Curve> {
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
typedef NCollection_Array1 <BRepAdaptor_Curve> BRepAdaptor_Array1OfCurve;
/* end typedefs declaration */

/******************************
* class BRepAdaptor_CompCurve *
******************************/
class BRepAdaptor_CompCurve : public Adaptor3d_Curve {
	public:
		/****************** BRepAdaptor_CompCurve ******************/
		%feature("compactdefaultargs") BRepAdaptor_CompCurve;
		%feature("autodoc", "* Creates an undefined Curve with no Wire loaded.
	:rtype: None") BRepAdaptor_CompCurve;
		 BRepAdaptor_CompCurve ();

		/****************** BRepAdaptor_CompCurve ******************/
		%feature("compactdefaultargs") BRepAdaptor_CompCurve;
		%feature("autodoc", ":param W:
	:type W: TopoDS_Wire
	:param KnotByCurvilinearAbcissa: default value is Standard_False
	:type KnotByCurvilinearAbcissa: bool
	:rtype: None") BRepAdaptor_CompCurve;
		 BRepAdaptor_CompCurve (const TopoDS_Wire & W,const Standard_Boolean KnotByCurvilinearAbcissa = Standard_False);

		/****************** BRepAdaptor_CompCurve ******************/
		%feature("compactdefaultargs") BRepAdaptor_CompCurve;
		%feature("autodoc", "* Creates a Curve to acces to the geometry of edge <W>.
	:param W:
	:type W: TopoDS_Wire
	:param KnotByCurvilinearAbcissa:
	:type KnotByCurvilinearAbcissa: bool
	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:param Tol:
	:type Tol: float
	:rtype: None") BRepAdaptor_CompCurve;
		 BRepAdaptor_CompCurve (const TopoDS_Wire & W,const Standard_Boolean KnotByCurvilinearAbcissa,const Standard_Real First,const Standard_Real Last,const Standard_Real Tol);

		/****************** BSpline ******************/
		%feature("compactdefaultargs") BSpline;
		%feature("autodoc", ":rtype: opencascade::handle<Geom_BSplineCurve>") BSpline;
		opencascade::handle<Geom_BSplineCurve> BSpline ();

		/****************** Bezier ******************/
		%feature("compactdefaultargs") Bezier;
		%feature("autodoc", ":rtype: opencascade::handle<Geom_BezierCurve>") Bezier;
		opencascade::handle<Geom_BezierCurve> Bezier ();

		/****************** Circle ******************/
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", ":rtype: gp_Circ") Circle;
		gp_Circ Circle ();

		/****************** Continuity ******************/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", ":rtype: GeomAbs_Shape") Continuity;
		GeomAbs_Shape Continuity ();

		/****************** D0 ******************/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "* Computes the point of parameter U.
	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt
	:rtype: None") D0;
		void D0 (const Standard_Real U,gp_Pnt & P);

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "* Computes the point of parameter U on the curve with its first derivative. Raised if the continuity of the current interval is not C1.
	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt
	:param V:
	:type V: gp_Vec
	:rtype: None") D1;
		void D1 (const Standard_Real U,gp_Pnt & P,gp_Vec & V);

		/****************** D2 ******************/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "* Returns the point P of parameter U, the first and second derivatives V1 and V2. Raised if the continuity of the current interval is not C2.
	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt
	:param V1:
	:type V1: gp_Vec
	:param V2:
	:type V2: gp_Vec
	:rtype: None") D2;
		void D2 (const Standard_Real U,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2);

		/****************** D3 ******************/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "* Returns the point P of parameter U, the first, the second and the third derivative. Raised if the continuity of the current interval is not C3.
	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt
	:param V1:
	:type V1: gp_Vec
	:param V2:
	:type V2: gp_Vec
	:param V3:
	:type V3: gp_Vec
	:rtype: None") D3;
		void D3 (const Standard_Real U,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2,gp_Vec & V3);

		/****************** DN ******************/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "* The returned vector gives the value of the derivative for the order of derivation N. Raised if the continuity of the current interval is not CN. Raised if N < 1.
	:param U:
	:type U: float
	:param N:
	:type N: int
	:rtype: gp_Vec") DN;
		gp_Vec DN (const Standard_Real U,const Standard_Integer N);

		/****************** Degree ******************/
		%feature("compactdefaultargs") Degree;
		%feature("autodoc", ":rtype: int") Degree;
		Standard_Integer Degree ();

		/****************** Edge ******************/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "* returns an edge and one parameter on them corresponding to the parameter U.
	:param U:
	:type U: float
	:param E:
	:type E: TopoDS_Edge
	:param UonE:
	:type UonE: float
	:rtype: None") Edge;
		void Edge (const Standard_Real U,TopoDS_Edge & E,Standard_Real &OutValue);

		/****************** Ellipse ******************/
		%feature("compactdefaultargs") Ellipse;
		%feature("autodoc", ":rtype: gp_Elips") Ellipse;
		gp_Elips Ellipse ();

		/****************** FirstParameter ******************/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", ":rtype: float") FirstParameter;
		Standard_Real FirstParameter ();

		/****************** GetType ******************/
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", ":rtype: GeomAbs_CurveType") GetType;
		GeomAbs_CurveType GetType ();

		/****************** Hyperbola ******************/
		%feature("compactdefaultargs") Hyperbola;
		%feature("autodoc", ":rtype: gp_Hypr") Hyperbola;
		gp_Hypr Hyperbola ();

		/****************** Initialize ******************/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "* Sets the wire <W>.
	:param W:
	:type W: TopoDS_Wire
	:param KnotByCurvilinearAbcissa:
	:type KnotByCurvilinearAbcissa: bool
	:rtype: None") Initialize;
		void Initialize (const TopoDS_Wire & W,const Standard_Boolean KnotByCurvilinearAbcissa);

		/****************** Initialize ******************/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "* Sets wire <W> and trimmed parameter.
	:param W:
	:type W: TopoDS_Wire
	:param KnotByCurvilinearAbcissa:
	:type KnotByCurvilinearAbcissa: bool
	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:param Tol:
	:type Tol: float
	:rtype: None") Initialize;
		void Initialize (const TopoDS_Wire & W,const Standard_Boolean KnotByCurvilinearAbcissa,const Standard_Real First,const Standard_Real Last,const Standard_Real Tol);

		/****************** Intervals ******************/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "* Stores in <T> the parameters bounding the intervals of continuity <S>. //! The array must provide enough room to accomodate for the parameters. i.e. T.Length() > NbIntervals()
	:param T:
	:type T: TColStd_Array1OfReal
	:param S:
	:type S: GeomAbs_Shape
	:rtype: None") Intervals;
		void Intervals (TColStd_Array1OfReal & T,const GeomAbs_Shape S);

		/****************** IsClosed ******************/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", ":rtype: bool") IsClosed;
		Standard_Boolean IsClosed ();

		/****************** IsPeriodic ******************/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", ":rtype: bool") IsPeriodic;
		Standard_Boolean IsPeriodic ();

		/****************** IsRational ******************/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", ":rtype: bool") IsRational;
		Standard_Boolean IsRational ();

		/****************** LastParameter ******************/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", ":rtype: float") LastParameter;
		Standard_Real LastParameter ();

		/****************** Line ******************/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", ":rtype: gp_Lin") Line;
		gp_Lin Line ();

		/****************** NbIntervals ******************/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "* Returns the number of intervals for continuity <S>. May be one if Continuity(me) >= <S>
	:param S:
	:type S: GeomAbs_Shape
	:rtype: int") NbIntervals;
		Standard_Integer NbIntervals (const GeomAbs_Shape S);

		/****************** NbKnots ******************/
		%feature("compactdefaultargs") NbKnots;
		%feature("autodoc", ":rtype: int") NbKnots;
		Standard_Integer NbKnots ();

		/****************** NbPoles ******************/
		%feature("compactdefaultargs") NbPoles;
		%feature("autodoc", ":rtype: int") NbPoles;
		Standard_Integer NbPoles ();

		/****************** Parabola ******************/
		%feature("compactdefaultargs") Parabola;
		%feature("autodoc", ":rtype: gp_Parab") Parabola;
		gp_Parab Parabola ();

		/****************** Period ******************/
		%feature("compactdefaultargs") Period;
		%feature("autodoc", ":rtype: float") Period;
		Standard_Real Period ();

		/****************** Resolution ******************/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "* returns the parametric resolution
	:param R3d:
	:type R3d: float
	:rtype: float") Resolution;
		Standard_Real Resolution (const Standard_Real R3d);

		/****************** Trim ******************/
		%feature("compactdefaultargs") Trim;
		%feature("autodoc", "* Returns a curve equivalent of <self> between parameters <First> and <Last>. <Tol> is used to test for 3d points confusion. If <First> >= <Last>
	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:param Tol:
	:type Tol: float
	:rtype: opencascade::handle<Adaptor3d_HCurve>") Trim;
		opencascade::handle<Adaptor3d_HCurve> Trim (const Standard_Real First,const Standard_Real Last,const Standard_Real Tol);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* Computes the point of parameter U on the curve
	:param U:
	:type U: float
	:rtype: gp_Pnt") Value;
		gp_Pnt Value (const Standard_Real U);

		/****************** Wire ******************/
		%feature("compactdefaultargs") Wire;
		%feature("autodoc", "* Returns the wire.
	:rtype: TopoDS_Wire") Wire;
		const TopoDS_Wire  Wire ();

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
		%feature("autodoc", "* Creates an undefined Curve with no Edge loaded.
	:rtype: None") BRepAdaptor_Curve;
		 BRepAdaptor_Curve ();

		/****************** BRepAdaptor_Curve ******************/
		%feature("compactdefaultargs") BRepAdaptor_Curve;
		%feature("autodoc", "* Creates a Curve to acces to the geometry of edge <E>.
	:param E:
	:type E: TopoDS_Edge
	:rtype: None") BRepAdaptor_Curve;
		 BRepAdaptor_Curve (const TopoDS_Edge & E);

		/****************** BRepAdaptor_Curve ******************/
		%feature("compactdefaultargs") BRepAdaptor_Curve;
		%feature("autodoc", "* Creates a Curve to acces to the geometry of edge <E>. The geometry will be computed using the parametric curve of <E> on the face <F>. An Error is raised if the edge does not have a pcurve on the face.
	:param E:
	:type E: TopoDS_Edge
	:param F:
	:type F: TopoDS_Face
	:rtype: None") BRepAdaptor_Curve;
		 BRepAdaptor_Curve (const TopoDS_Edge & E,const TopoDS_Face & F);

		/****************** BSpline ******************/
		%feature("compactdefaultargs") BSpline;
		%feature("autodoc", "* Warning : This will make a copy of the BSpline Curve since it applies to it myTsrf . Be carefull when using this method
	:rtype: opencascade::handle<Geom_BSplineCurve>") BSpline;
		opencascade::handle<Geom_BSplineCurve> BSpline ();

		/****************** Bezier ******************/
		%feature("compactdefaultargs") Bezier;
		%feature("autodoc", "* Warning : This will make a copy of the Bezier Curve since it applies to it myTsrf . Be carefull when using this method
	:rtype: opencascade::handle<Geom_BezierCurve>") Bezier;
		opencascade::handle<Geom_BezierCurve> Bezier ();

		/****************** Circle ******************/
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", ":rtype: gp_Circ") Circle;
		gp_Circ Circle ();

		/****************** Continuity ******************/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", ":rtype: GeomAbs_Shape") Continuity;
		GeomAbs_Shape Continuity ();

		/****************** Curve ******************/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "* Returns the Curve of the edge.
	:rtype: GeomAdaptor_Curve") Curve;
		const GeomAdaptor_Curve & Curve ();

		/****************** CurveOnSurface ******************/
		%feature("compactdefaultargs") CurveOnSurface;
		%feature("autodoc", "* Returns the CurveOnSurface of the edge.
	:rtype: Adaptor3d_CurveOnSurface") CurveOnSurface;
		const Adaptor3d_CurveOnSurface & CurveOnSurface ();

		/****************** D0 ******************/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "* Computes the point of parameter U.
	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt
	:rtype: None") D0;
		void D0 (const Standard_Real U,gp_Pnt & P);

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "* Computes the point of parameter U on the curve with its first derivative. Raised if the continuity of the current interval is not C1.
	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt
	:param V:
	:type V: gp_Vec
	:rtype: None") D1;
		void D1 (const Standard_Real U,gp_Pnt & P,gp_Vec & V);

		/****************** D2 ******************/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "* Returns the point P of parameter U, the first and second derivatives V1 and V2. Raised if the continuity of the current interval is not C2.
	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt
	:param V1:
	:type V1: gp_Vec
	:param V2:
	:type V2: gp_Vec
	:rtype: None") D2;
		void D2 (const Standard_Real U,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2);

		/****************** D3 ******************/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "* Returns the point P of parameter U, the first, the second and the third derivative. Raised if the continuity of the current interval is not C3.
	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt
	:param V1:
	:type V1: gp_Vec
	:param V2:
	:type V2: gp_Vec
	:param V3:
	:type V3: gp_Vec
	:rtype: None") D3;
		void D3 (const Standard_Real U,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2,gp_Vec & V3);

		/****************** DN ******************/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "* The returned vector gives the value of the derivative for the order of derivation N. Raised if the continuity of the current interval is not CN. Raised if N < 1.
	:param U:
	:type U: float
	:param N:
	:type N: int
	:rtype: gp_Vec") DN;
		gp_Vec DN (const Standard_Real U,const Standard_Integer N);

		/****************** Degree ******************/
		%feature("compactdefaultargs") Degree;
		%feature("autodoc", ":rtype: int") Degree;
		Standard_Integer Degree ();

		/****************** Edge ******************/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "* Returns the edge.
	:rtype: TopoDS_Edge") Edge;
		const TopoDS_Edge  Edge ();

		/****************** Ellipse ******************/
		%feature("compactdefaultargs") Ellipse;
		%feature("autodoc", ":rtype: gp_Elips") Ellipse;
		gp_Elips Ellipse ();

		/****************** FirstParameter ******************/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", ":rtype: float") FirstParameter;
		Standard_Real FirstParameter ();

		/****************** GetType ******************/
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", ":rtype: GeomAbs_CurveType") GetType;
		GeomAbs_CurveType GetType ();

		/****************** Hyperbola ******************/
		%feature("compactdefaultargs") Hyperbola;
		%feature("autodoc", ":rtype: gp_Hypr") Hyperbola;
		gp_Hypr Hyperbola ();

		/****************** Initialize ******************/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "* Sets the Curve <self> to acces to the geometry of edge <E>.
	:param E:
	:type E: TopoDS_Edge
	:rtype: None") Initialize;
		void Initialize (const TopoDS_Edge & E);

		/****************** Initialize ******************/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "* Sets the Curve <self> to acces to the geometry of edge <E>. The geometry will be computed using the parametric curve of <E> on the face <F>. An Error is raised if the edge does not have a pcurve on the face.
	:param E:
	:type E: TopoDS_Edge
	:param F:
	:type F: TopoDS_Face
	:rtype: None") Initialize;
		void Initialize (const TopoDS_Edge & E,const TopoDS_Face & F);

		/****************** Intervals ******************/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "* Stores in <T> the parameters bounding the intervals of continuity <S>. //! The array must provide enough room to accomodate for the parameters. i.e. T.Length() > NbIntervals()
	:param T:
	:type T: TColStd_Array1OfReal
	:param S:
	:type S: GeomAbs_Shape
	:rtype: None") Intervals;
		void Intervals (TColStd_Array1OfReal & T,const GeomAbs_Shape S);

		/****************** Is3DCurve ******************/
		%feature("compactdefaultargs") Is3DCurve;
		%feature("autodoc", "* Returns True if the edge geometry is computed from a 3D curve.
	:rtype: bool") Is3DCurve;
		Standard_Boolean Is3DCurve ();

		/****************** IsClosed ******************/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", ":rtype: bool") IsClosed;
		Standard_Boolean IsClosed ();

		/****************** IsCurveOnSurface ******************/
		%feature("compactdefaultargs") IsCurveOnSurface;
		%feature("autodoc", "* Returns True if the edge geometry is computed from a pcurve on a surface.
	:rtype: bool") IsCurveOnSurface;
		Standard_Boolean IsCurveOnSurface ();

		/****************** IsPeriodic ******************/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", ":rtype: bool") IsPeriodic;
		Standard_Boolean IsPeriodic ();

		/****************** IsRational ******************/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", ":rtype: bool") IsRational;
		Standard_Boolean IsRational ();

		/****************** LastParameter ******************/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", ":rtype: float") LastParameter;
		Standard_Real LastParameter ();

		/****************** Line ******************/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", ":rtype: gp_Lin") Line;
		gp_Lin Line ();

		/****************** NbIntervals ******************/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "* Returns the number of intervals for continuity <S>. May be one if Continuity(me) >= <S>
	:param S:
	:type S: GeomAbs_Shape
	:rtype: int") NbIntervals;
		Standard_Integer NbIntervals (const GeomAbs_Shape S);

		/****************** NbKnots ******************/
		%feature("compactdefaultargs") NbKnots;
		%feature("autodoc", ":rtype: int") NbKnots;
		Standard_Integer NbKnots ();

		/****************** NbPoles ******************/
		%feature("compactdefaultargs") NbPoles;
		%feature("autodoc", ":rtype: int") NbPoles;
		Standard_Integer NbPoles ();

		/****************** OffsetCurve ******************/
		%feature("compactdefaultargs") OffsetCurve;
		%feature("autodoc", ":rtype: opencascade::handle<Geom_OffsetCurve>") OffsetCurve;
		opencascade::handle<Geom_OffsetCurve> OffsetCurve ();

		/****************** Parabola ******************/
		%feature("compactdefaultargs") Parabola;
		%feature("autodoc", ":rtype: gp_Parab") Parabola;
		gp_Parab Parabola ();

		/****************** Period ******************/
		%feature("compactdefaultargs") Period;
		%feature("autodoc", ":rtype: float") Period;
		Standard_Real Period ();

		/****************** Reset ******************/
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", "* Reset currently loaded curve (undone Load()).
	:rtype: None") Reset;
		void Reset ();

		/****************** Resolution ******************/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "* returns the parametric resolution
	:param R3d:
	:type R3d: float
	:rtype: float") Resolution;
		Standard_Real Resolution (const Standard_Real R3d);

		/****************** Tolerance ******************/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "* Returns the edge tolerance.
	:rtype: float") Tolerance;
		Standard_Real Tolerance ();

		/****************** Trim ******************/
		%feature("compactdefaultargs") Trim;
		%feature("autodoc", "* Returns a curve equivalent of <self> between parameters <First> and <Last>. <Tol> is used to test for 3d points confusion. If <First> >= <Last>
	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:param Tol:
	:type Tol: float
	:rtype: opencascade::handle<Adaptor3d_HCurve>") Trim;
		opencascade::handle<Adaptor3d_HCurve> Trim (const Standard_Real First,const Standard_Real Last,const Standard_Real Tol);

		/****************** Trsf ******************/
		%feature("compactdefaultargs") Trsf;
		%feature("autodoc", "* Returns the coordinate system of the curve.
	:rtype: gp_Trsf") Trsf;
		const gp_Trsf  Trsf ();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* Computes the point of parameter U on the curve
	:param U:
	:type U: float
	:rtype: gp_Pnt") Value;
		gp_Pnt Value (const Standard_Real U);

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
		%feature("autodoc", "* Creates an uninitialized curve2d.
	:rtype: None") BRepAdaptor_Curve2d;
		 BRepAdaptor_Curve2d ();

		/****************** BRepAdaptor_Curve2d ******************/
		%feature("compactdefaultargs") BRepAdaptor_Curve2d;
		%feature("autodoc", "* Creates with the pcurve of <E> on <F>.
	:param E:
	:type E: TopoDS_Edge
	:param F:
	:type F: TopoDS_Face
	:rtype: None") BRepAdaptor_Curve2d;
		 BRepAdaptor_Curve2d (const TopoDS_Edge & E,const TopoDS_Face & F);

		/****************** Edge ******************/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "* Returns the Edge.
	:rtype: TopoDS_Edge") Edge;
		const TopoDS_Edge  Edge ();

		/****************** Face ******************/
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "* Returns the Face.
	:rtype: TopoDS_Face") Face;
		const TopoDS_Face  Face ();

		/****************** Initialize ******************/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "* Initialize with the pcurve of <E> on <F>.
	:param E:
	:type E: TopoDS_Edge
	:param F:
	:type F: TopoDS_Face
	:rtype: None") Initialize;
		void Initialize (const TopoDS_Edge & E,const TopoDS_Face & F);

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
		%feature("autodoc", "* Creates an empty GenHCurve.
	:rtype: None") BRepAdaptor_HCompCurve;
		 BRepAdaptor_HCompCurve ();

		/****************** BRepAdaptor_HCompCurve ******************/
		%feature("compactdefaultargs") BRepAdaptor_HCompCurve;
		%feature("autodoc", "* Creates a GenHCurve from a Curve
	:param C:
	:type C: BRepAdaptor_CompCurve
	:rtype: None") BRepAdaptor_HCompCurve;
		 BRepAdaptor_HCompCurve (const BRepAdaptor_CompCurve & C);

		/****************** ChangeCurve ******************/
		%feature("compactdefaultargs") ChangeCurve;
		%feature("autodoc", "* Returns the curve used to create the GenHCurve.
	:rtype: BRepAdaptor_CompCurve") ChangeCurve;
		BRepAdaptor_CompCurve & ChangeCurve ();

		/****************** Curve ******************/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "* Returns the curve used to create the GenHCurve. This is redefined from HCurve, cannot be inline.
	:rtype: Adaptor3d_Curve") Curve;
		const Adaptor3d_Curve & Curve ();

		/****************** GetCurve ******************/
		%feature("compactdefaultargs") GetCurve;
		%feature("autodoc", "* Returns the curve used to create the GenHCurve. This is redefined from HCurve, cannot be inline.
	:rtype: Adaptor3d_Curve") GetCurve;
		Adaptor3d_Curve & GetCurve ();

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "* Sets the field of the GenHCurve.
	:param C:
	:type C: BRepAdaptor_CompCurve
	:rtype: None") Set;
		void Set (const BRepAdaptor_CompCurve & C);

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
		%feature("autodoc", "* Creates an empty GenHCurve.
	:rtype: None") BRepAdaptor_HCurve;
		 BRepAdaptor_HCurve ();

		/****************** BRepAdaptor_HCurve ******************/
		%feature("compactdefaultargs") BRepAdaptor_HCurve;
		%feature("autodoc", "* Creates a GenHCurve from a Curve
	:param C:
	:type C: BRepAdaptor_Curve
	:rtype: None") BRepAdaptor_HCurve;
		 BRepAdaptor_HCurve (const BRepAdaptor_Curve & C);

		/****************** ChangeCurve ******************/
		%feature("compactdefaultargs") ChangeCurve;
		%feature("autodoc", "* Returns the curve used to create the GenHCurve.
	:rtype: BRepAdaptor_Curve") ChangeCurve;
		BRepAdaptor_Curve & ChangeCurve ();

		/****************** Curve ******************/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "* Returns the curve used to create the GenHCurve. This is redefined from HCurve, cannot be inline.
	:rtype: Adaptor3d_Curve") Curve;
		const Adaptor3d_Curve & Curve ();

		/****************** GetCurve ******************/
		%feature("compactdefaultargs") GetCurve;
		%feature("autodoc", "* Returns the curve used to create the GenHCurve. This is redefined from HCurve, cannot be inline.
	:rtype: Adaptor3d_Curve") GetCurve;
		Adaptor3d_Curve & GetCurve ();

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "* Sets the field of the GenHCurve.
	:param C:
	:type C: BRepAdaptor_Curve
	:rtype: None") Set;
		void Set (const BRepAdaptor_Curve & C);

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
		%feature("autodoc", "* Creates an empty GenHCurve2d.
	:rtype: None") BRepAdaptor_HCurve2d;
		 BRepAdaptor_HCurve2d ();

		/****************** BRepAdaptor_HCurve2d ******************/
		%feature("compactdefaultargs") BRepAdaptor_HCurve2d;
		%feature("autodoc", "* Creates a GenHCurve2d from a Curve
	:param C:
	:type C: BRepAdaptor_Curve2d
	:rtype: None") BRepAdaptor_HCurve2d;
		 BRepAdaptor_HCurve2d (const BRepAdaptor_Curve2d & C);

		/****************** ChangeCurve2d ******************/
		%feature("compactdefaultargs") ChangeCurve2d;
		%feature("autodoc", "* Returns the curve used to create the GenHCurve.
	:rtype: BRepAdaptor_Curve2d") ChangeCurve2d;
		BRepAdaptor_Curve2d & ChangeCurve2d ();

		/****************** Curve2d ******************/
		%feature("compactdefaultargs") Curve2d;
		%feature("autodoc", "* Returns the curve used to create the GenHCurve2d. This is redefined from HCurve2d, cannot be inline.
	:rtype: Adaptor2d_Curve2d") Curve2d;
		const Adaptor2d_Curve2d & Curve2d ();

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "* Sets the field of the GenHCurve2d.
	:param C:
	:type C: BRepAdaptor_Curve2d
	:rtype: None") Set;
		void Set (const BRepAdaptor_Curve2d & C);

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
		%feature("autodoc", "* Creates an empty GenHSurface.
	:rtype: None") BRepAdaptor_HSurface;
		 BRepAdaptor_HSurface ();

		/****************** BRepAdaptor_HSurface ******************/
		%feature("compactdefaultargs") BRepAdaptor_HSurface;
		%feature("autodoc", "* Creates a GenHSurface from a Surface.
	:param S:
	:type S: BRepAdaptor_Surface
	:rtype: None") BRepAdaptor_HSurface;
		 BRepAdaptor_HSurface (const BRepAdaptor_Surface & S);

		/****************** ChangeSurface ******************/
		%feature("compactdefaultargs") ChangeSurface;
		%feature("autodoc", "* Returns the surface used to create the GenHSurface.
	:rtype: BRepAdaptor_Surface") ChangeSurface;
		BRepAdaptor_Surface & ChangeSurface ();

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "* Sets the field of the GenHSurface.
	:param S:
	:type S: BRepAdaptor_Surface
	:rtype: None") Set;
		void Set (const BRepAdaptor_Surface & S);

		/****************** Surface ******************/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "* Returns a reference to the Surface inside the HSurface. This is redefined from HSurface, cannot be inline.
	:rtype: Adaptor3d_Surface") Surface;
		const Adaptor3d_Surface & Surface ();

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
		/****************** AxeOfRevolution ******************/
		%feature("compactdefaultargs") AxeOfRevolution;
		%feature("autodoc", ":rtype: gp_Ax1") AxeOfRevolution;
		gp_Ax1 AxeOfRevolution ();

		/****************** BRepAdaptor_Surface ******************/
		%feature("compactdefaultargs") BRepAdaptor_Surface;
		%feature("autodoc", "* Creates an undefined surface with no face loaded.
	:rtype: None") BRepAdaptor_Surface;
		 BRepAdaptor_Surface ();

		/****************** BRepAdaptor_Surface ******************/
		%feature("compactdefaultargs") BRepAdaptor_Surface;
		%feature("autodoc", "* Creates a surface to access the geometry of <F>. If <Restriction> is true the parameter range is the parameter range in the UV space of the restriction.
	:param F:
	:type F: TopoDS_Face
	:param R: default value is Standard_True
	:type R: bool
	:rtype: None") BRepAdaptor_Surface;
		 BRepAdaptor_Surface (const TopoDS_Face & F,const Standard_Boolean R = Standard_True);

		/****************** BSpline ******************/
		%feature("compactdefaultargs") BSpline;
		%feature("autodoc", "* Warning : this will make a copy of the BSpline Surface since it applies to it the myTsrf transformation Be Carefull when using this method
	:rtype: opencascade::handle<Geom_BSplineSurface>") BSpline;
		opencascade::handle<Geom_BSplineSurface> BSpline ();

		/****************** BasisCurve ******************/
		%feature("compactdefaultargs") BasisCurve;
		%feature("autodoc", "* only for SurfaceOfExtrusion and SurfaceOfRevolution Warning: this will make a copy of the underlying curve since it applies to it the transformation myTrsf. Be carefull when using this method.
	:rtype: opencascade::handle<Adaptor3d_HCurve>") BasisCurve;
		opencascade::handle<Adaptor3d_HCurve> BasisCurve ();

		/****************** BasisSurface ******************/
		%feature("compactdefaultargs") BasisSurface;
		%feature("autodoc", ":rtype: opencascade::handle<Adaptor3d_HSurface>") BasisSurface;
		opencascade::handle<Adaptor3d_HSurface> BasisSurface ();

		/****************** Bezier ******************/
		%feature("compactdefaultargs") Bezier;
		%feature("autodoc", ":rtype: opencascade::handle<Geom_BezierSurface>") Bezier;
		opencascade::handle<Geom_BezierSurface> Bezier ();

		/****************** ChangeSurface ******************/
		%feature("compactdefaultargs") ChangeSurface;
		%feature("autodoc", "* Returns the surface.
	:rtype: GeomAdaptor_Surface") ChangeSurface;
		GeomAdaptor_Surface & ChangeSurface ();

		/****************** Cone ******************/
		%feature("compactdefaultargs") Cone;
		%feature("autodoc", ":rtype: gp_Cone") Cone;
		gp_Cone Cone ();

		/****************** Cylinder ******************/
		%feature("compactdefaultargs") Cylinder;
		%feature("autodoc", ":rtype: gp_Cylinder") Cylinder;
		gp_Cylinder Cylinder ();

		/****************** D0 ******************/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "* Computes the point of parameters U,V on the surface.
	:param U:
	:type U: float
	:param V:
	:type V: float
	:param P:
	:type P: gp_Pnt
	:rtype: None") D0;
		void D0 (const Standard_Real U,const Standard_Real V,gp_Pnt & P);

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "* Computes the point and the first derivatives on the surface. Raised if the continuity of the current intervals is not C1.
	:param U:
	:type U: float
	:param V:
	:type V: float
	:param P:
	:type P: gp_Pnt
	:param D1U:
	:type D1U: gp_Vec
	:param D1V:
	:type D1V: gp_Vec
	:rtype: None") D1;
		void D1 (const Standard_Real U,const Standard_Real V,gp_Pnt & P,gp_Vec & D1U,gp_Vec & D1V);

		/****************** D2 ******************/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "* Computes the point, the first and second derivatives on the surface. Raised if the continuity of the current intervals is not C2.
	:param U:
	:type U: float
	:param V:
	:type V: float
	:param P:
	:type P: gp_Pnt
	:param D1U:
	:type D1U: gp_Vec
	:param D1V:
	:type D1V: gp_Vec
	:param D2U:
	:type D2U: gp_Vec
	:param D2V:
	:type D2V: gp_Vec
	:param D2UV:
	:type D2UV: gp_Vec
	:rtype: None") D2;
		void D2 (const Standard_Real U,const Standard_Real V,gp_Pnt & P,gp_Vec & D1U,gp_Vec & D1V,gp_Vec & D2U,gp_Vec & D2V,gp_Vec & D2UV);

		/****************** D3 ******************/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "* Computes the point, the first, second and third derivatives on the surface. Raised if the continuity of the current intervals is not C3.
	:param U:
	:type U: float
	:param V:
	:type V: float
	:param P:
	:type P: gp_Pnt
	:param D1U:
	:type D1U: gp_Vec
	:param D1V:
	:type D1V: gp_Vec
	:param D2U:
	:type D2U: gp_Vec
	:param D2V:
	:type D2V: gp_Vec
	:param D2UV:
	:type D2UV: gp_Vec
	:param D3U:
	:type D3U: gp_Vec
	:param D3V:
	:type D3V: gp_Vec
	:param D3UUV:
	:type D3UUV: gp_Vec
	:param D3UVV:
	:type D3UVV: gp_Vec
	:rtype: None") D3;
		void D3 (const Standard_Real U,const Standard_Real V,gp_Pnt & P,gp_Vec & D1U,gp_Vec & D1V,gp_Vec & D2U,gp_Vec & D2V,gp_Vec & D2UV,gp_Vec & D3U,gp_Vec & D3V,gp_Vec & D3UUV,gp_Vec & D3UVV);

		/****************** DN ******************/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "* Computes the derivative of order Nu in the direction U and Nv in the direction V at the point P(U, V). Raised if the current U interval is not not CNu and the current V interval is not CNv. Raised if Nu + Nv < 1 or Nu < 0 or Nv < 0.
	:param U:
	:type U: float
	:param V:
	:type V: float
	:param Nu:
	:type Nu: int
	:param Nv:
	:type Nv: int
	:rtype: gp_Vec") DN;
		gp_Vec DN (const Standard_Real U,const Standard_Real V,const Standard_Integer Nu,const Standard_Integer Nv);

		/****************** Direction ******************/
		%feature("compactdefaultargs") Direction;
		%feature("autodoc", ":rtype: gp_Dir") Direction;
		gp_Dir Direction ();

		/****************** Face ******************/
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "* Returns the face.
	:rtype: TopoDS_Face") Face;
		const TopoDS_Face  Face ();

		/****************** FirstUParameter ******************/
		%feature("compactdefaultargs") FirstUParameter;
		%feature("autodoc", ":rtype: float") FirstUParameter;
		Standard_Real FirstUParameter ();

		/****************** FirstVParameter ******************/
		%feature("compactdefaultargs") FirstVParameter;
		%feature("autodoc", ":rtype: float") FirstVParameter;
		Standard_Real FirstVParameter ();

		/****************** GetType ******************/
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "* Returns the type of the surface : Plane, Cylinder, Cone, Sphere, Torus, BezierSurface, BSplineSurface, SurfaceOfRevolution, SurfaceOfExtrusion, OtherSurface
	:rtype: GeomAbs_SurfaceType") GetType;
		GeomAbs_SurfaceType GetType ();

		/****************** Initialize ******************/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "* Sets the surface to the geometry of <F>.
	:param F:
	:type F: TopoDS_Face
	:param Restriction: default value is Standard_True
	:type Restriction: bool
	:rtype: None") Initialize;
		void Initialize (const TopoDS_Face & F,const Standard_Boolean Restriction = Standard_True);

		/****************** IsUClosed ******************/
		%feature("compactdefaultargs") IsUClosed;
		%feature("autodoc", ":rtype: bool") IsUClosed;
		Standard_Boolean IsUClosed ();

		/****************** IsUPeriodic ******************/
		%feature("compactdefaultargs") IsUPeriodic;
		%feature("autodoc", ":rtype: bool") IsUPeriodic;
		Standard_Boolean IsUPeriodic ();

		/****************** IsURational ******************/
		%feature("compactdefaultargs") IsURational;
		%feature("autodoc", ":rtype: bool") IsURational;
		Standard_Boolean IsURational ();

		/****************** IsVClosed ******************/
		%feature("compactdefaultargs") IsVClosed;
		%feature("autodoc", ":rtype: bool") IsVClosed;
		Standard_Boolean IsVClosed ();

		/****************** IsVPeriodic ******************/
		%feature("compactdefaultargs") IsVPeriodic;
		%feature("autodoc", ":rtype: bool") IsVPeriodic;
		Standard_Boolean IsVPeriodic ();

		/****************** IsVRational ******************/
		%feature("compactdefaultargs") IsVRational;
		%feature("autodoc", ":rtype: bool") IsVRational;
		Standard_Boolean IsVRational ();

		/****************** LastUParameter ******************/
		%feature("compactdefaultargs") LastUParameter;
		%feature("autodoc", ":rtype: float") LastUParameter;
		Standard_Real LastUParameter ();

		/****************** LastVParameter ******************/
		%feature("compactdefaultargs") LastVParameter;
		%feature("autodoc", ":rtype: float") LastVParameter;
		Standard_Real LastVParameter ();

		/****************** NbUIntervals ******************/
		%feature("compactdefaultargs") NbUIntervals;
		%feature("autodoc", "* If necessary, breaks the surface in U intervals of continuity <S>. And returns the number of intervals.
	:param S:
	:type S: GeomAbs_Shape
	:rtype: int") NbUIntervals;
		Standard_Integer NbUIntervals (const GeomAbs_Shape S);

		/****************** NbUKnots ******************/
		%feature("compactdefaultargs") NbUKnots;
		%feature("autodoc", ":rtype: int") NbUKnots;
		Standard_Integer NbUKnots ();

		/****************** NbUPoles ******************/
		%feature("compactdefaultargs") NbUPoles;
		%feature("autodoc", ":rtype: int") NbUPoles;
		Standard_Integer NbUPoles ();

		/****************** NbVIntervals ******************/
		%feature("compactdefaultargs") NbVIntervals;
		%feature("autodoc", "* If necessary, breaks the surface in V intervals of continuity <S>. And returns the number of intervals.
	:param S:
	:type S: GeomAbs_Shape
	:rtype: int") NbVIntervals;
		Standard_Integer NbVIntervals (const GeomAbs_Shape S);

		/****************** NbVKnots ******************/
		%feature("compactdefaultargs") NbVKnots;
		%feature("autodoc", ":rtype: int") NbVKnots;
		Standard_Integer NbVKnots ();

		/****************** NbVPoles ******************/
		%feature("compactdefaultargs") NbVPoles;
		%feature("autodoc", ":rtype: int") NbVPoles;
		Standard_Integer NbVPoles ();

		/****************** OffsetValue ******************/
		%feature("compactdefaultargs") OffsetValue;
		%feature("autodoc", ":rtype: float") OffsetValue;
		Standard_Real OffsetValue ();

		/****************** Plane ******************/
		%feature("compactdefaultargs") Plane;
		%feature("autodoc", ":rtype: gp_Pln") Plane;
		gp_Pln Plane ();

		/****************** Sphere ******************/
		%feature("compactdefaultargs") Sphere;
		%feature("autodoc", ":rtype: gp_Sphere") Sphere;
		gp_Sphere Sphere ();

		/****************** Surface ******************/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "* Returns the surface.
	:rtype: GeomAdaptor_Surface") Surface;
		const GeomAdaptor_Surface & Surface ();

		/****************** Tolerance ******************/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "* Returns the face tolerance.
	:rtype: float") Tolerance;
		Standard_Real Tolerance ();

		/****************** Torus ******************/
		%feature("compactdefaultargs") Torus;
		%feature("autodoc", ":rtype: gp_Torus") Torus;
		gp_Torus Torus ();

		/****************** Trsf ******************/
		%feature("compactdefaultargs") Trsf;
		%feature("autodoc", "* Returns the surface coordinate system.
	:rtype: gp_Trsf") Trsf;
		const gp_Trsf  Trsf ();

		/****************** UContinuity ******************/
		%feature("compactdefaultargs") UContinuity;
		%feature("autodoc", ":rtype: GeomAbs_Shape") UContinuity;
		GeomAbs_Shape UContinuity ();

		/****************** UDegree ******************/
		%feature("compactdefaultargs") UDegree;
		%feature("autodoc", ":rtype: int") UDegree;
		Standard_Integer UDegree ();

		/****************** UIntervals ******************/
		%feature("compactdefaultargs") UIntervals;
		%feature("autodoc", "* Returns the intervals with the requested continuity in the U direction.
	:param T:
	:type T: TColStd_Array1OfReal
	:param S:
	:type S: GeomAbs_Shape
	:rtype: None") UIntervals;
		void UIntervals (TColStd_Array1OfReal & T,const GeomAbs_Shape S);

		/****************** UPeriod ******************/
		%feature("compactdefaultargs") UPeriod;
		%feature("autodoc", ":rtype: float") UPeriod;
		Standard_Real UPeriod ();

		/****************** UResolution ******************/
		%feature("compactdefaultargs") UResolution;
		%feature("autodoc", "* Returns the parametric U resolution corresponding to the real space resolution <R3d>.
	:param R3d:
	:type R3d: float
	:rtype: float") UResolution;
		Standard_Real UResolution (const Standard_Real R3d);

		/****************** UTrim ******************/
		%feature("compactdefaultargs") UTrim;
		%feature("autodoc", "* Returns a surface trimmed in the U direction equivalent of <self> between parameters <First> and <Last>. <Tol> is used to test for 3d points confusion. If <First> >= <Last>
	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:param Tol:
	:type Tol: float
	:rtype: opencascade::handle<Adaptor3d_HSurface>") UTrim;
		opencascade::handle<Adaptor3d_HSurface> UTrim (const Standard_Real First,const Standard_Real Last,const Standard_Real Tol);

		/****************** VContinuity ******************/
		%feature("compactdefaultargs") VContinuity;
		%feature("autodoc", ":rtype: GeomAbs_Shape") VContinuity;
		GeomAbs_Shape VContinuity ();

		/****************** VDegree ******************/
		%feature("compactdefaultargs") VDegree;
		%feature("autodoc", ":rtype: int") VDegree;
		Standard_Integer VDegree ();

		/****************** VIntervals ******************/
		%feature("compactdefaultargs") VIntervals;
		%feature("autodoc", "* Returns the intervals with the requested continuity in the V direction.
	:param T:
	:type T: TColStd_Array1OfReal
	:param S:
	:type S: GeomAbs_Shape
	:rtype: None") VIntervals;
		void VIntervals (TColStd_Array1OfReal & T,const GeomAbs_Shape S);

		/****************** VPeriod ******************/
		%feature("compactdefaultargs") VPeriod;
		%feature("autodoc", ":rtype: float") VPeriod;
		Standard_Real VPeriod ();

		/****************** VResolution ******************/
		%feature("compactdefaultargs") VResolution;
		%feature("autodoc", "* Returns the parametric V resolution corresponding to the real space resolution <R3d>.
	:param R3d:
	:type R3d: float
	:rtype: float") VResolution;
		Standard_Real VResolution (const Standard_Real R3d);

		/****************** VTrim ******************/
		%feature("compactdefaultargs") VTrim;
		%feature("autodoc", "* Returns a surface trimmed in the V direction between parameters <First> and <Last>. <Tol> is used to test for 3d points confusion. If <First> >= <Last>
	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:param Tol:
	:type Tol: float
	:rtype: opencascade::handle<Adaptor3d_HSurface>") VTrim;
		opencascade::handle<Adaptor3d_HSurface> VTrim (const Standard_Real First,const Standard_Real Last,const Standard_Real Tol);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* Computes the point of parameters U,V on the surface.
	:param U:
	:type U: float
	:param V:
	:type V: float
	:rtype: gp_Pnt") Value;
		gp_Pnt Value (const Standard_Real U,const Standard_Real V);

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
