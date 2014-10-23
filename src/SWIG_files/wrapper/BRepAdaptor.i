/*
Copyright 2008-2014 Thomas Paviot (tpaviot@gmail.com)


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
%module (package="OCC") BRepAdaptor

#pragma SWIG nowarn=504,325,503

%{
#ifdef WNT
#pragma warning(disable : 4716)
#endif
%}

%include ../common/CommonIncludes.i
%include ../common/StandardDefines.i
%include ../common/ExceptionCatcher.i
%include ../common/FunctionTransformers.i
%include ../common/Operators.i

%include BRepAdaptor_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%nodefaultctor BRepAdaptor_Array1OfCurve;
class BRepAdaptor_Array1OfCurve {
	public:
		%feature("autodoc", "	:param Low:
	:type Low: Standard_Integer
	:param Up:
	:type Up: Standard_Integer
	:rtype: None
") BRepAdaptor_Array1OfCurve;
		 BRepAdaptor_Array1OfCurve (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "	:param Item:
	:type Item: BRepAdaptor_Curve &
	:param Low:
	:type Low: Standard_Integer
	:param Up:
	:type Up: Standard_Integer
	:rtype: None
") BRepAdaptor_Array1OfCurve;
		 BRepAdaptor_Array1OfCurve (const BRepAdaptor_Curve & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "	:param V:
	:type V: BRepAdaptor_Curve &
	:rtype: None
") Init;
		void Init (const BRepAdaptor_Curve & V);
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("autodoc", "	:rtype: bool
") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("autodoc", "	:param Other:
	:type Other: BRepAdaptor_Array1OfCurve &
	:rtype: BRepAdaptor_Array1OfCurve
") Assign;
		const BRepAdaptor_Array1OfCurve & Assign (const BRepAdaptor_Array1OfCurve & Other);
		%feature("autodoc", "	:param Other:
	:type Other: BRepAdaptor_Array1OfCurve &
	:rtype: BRepAdaptor_Array1OfCurve
") operator=;
		const BRepAdaptor_Array1OfCurve & operator = (const BRepAdaptor_Array1OfCurve & Other);
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param Value:
	:type Value: BRepAdaptor_Curve &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const BRepAdaptor_Curve & Value);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: BRepAdaptor_Curve
") Value;
		const BRepAdaptor_Curve & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: BRepAdaptor_Curve
") ChangeValue;
		BRepAdaptor_Curve & ChangeValue (const Standard_Integer Index);
};


%feature("shadow") BRepAdaptor_Array1OfCurve::~BRepAdaptor_Array1OfCurve %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepAdaptor_Array1OfCurve {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepAdaptor_CompCurve;
class BRepAdaptor_CompCurve : public Adaptor3d_Curve {
	public:
		%feature("autodoc", "	* Creates an undefined Curve with no Wire loaded.

	:rtype: None
") BRepAdaptor_CompCurve;
		 BRepAdaptor_CompCurve ();
		%feature("autodoc", "	:param W:
	:type W: TopoDS_Wire &
	:param KnotByCurvilinearAbcissa: default value is Standard_False
	:type KnotByCurvilinearAbcissa: bool
	:rtype: None
") BRepAdaptor_CompCurve;
		 BRepAdaptor_CompCurve (const TopoDS_Wire & W,const Standard_Boolean KnotByCurvilinearAbcissa = Standard_False);
		%feature("autodoc", "	* Creates a Curve to acces to the geometry of edge <W>.

	:param W:
	:type W: TopoDS_Wire &
	:param KnotByCurvilinearAbcissa:
	:type KnotByCurvilinearAbcissa: bool
	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:param Tol:
	:type Tol: float
	:rtype: None
") BRepAdaptor_CompCurve;
		 BRepAdaptor_CompCurve (const TopoDS_Wire & W,const Standard_Boolean KnotByCurvilinearAbcissa,const Standard_Real First,const Standard_Real Last,const Standard_Real Tol);
		%feature("autodoc", "	* Sets the wire <W>.

	:param W:
	:type W: TopoDS_Wire &
	:param KnotByCurvilinearAbcissa:
	:type KnotByCurvilinearAbcissa: bool
	:rtype: None
") Initialize;
		void Initialize (const TopoDS_Wire & W,const Standard_Boolean KnotByCurvilinearAbcissa);
		%feature("autodoc", "	* Sets wire <W> and trimmed parameter.

	:param W:
	:type W: TopoDS_Wire &
	:param KnotByCurvilinearAbcissa:
	:type KnotByCurvilinearAbcissa: bool
	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:param Tol:
	:type Tol: float
	:rtype: None
") Initialize;
		void Initialize (const TopoDS_Wire & W,const Standard_Boolean KnotByCurvilinearAbcissa,const Standard_Real First,const Standard_Real Last,const Standard_Real Tol);
		%feature("autodoc", "	* Set the flag Periodic. Warning: This method has no effect if the wire is not closed

	:param Periodic:
	:type Periodic: bool
	:rtype: None
") SetPeriodic;
		void SetPeriodic (const Standard_Boolean Periodic);
		%feature("autodoc", "	* Returns the wire.

	:rtype: TopoDS_Wire
") Wire;
		const TopoDS_Wire  Wire ();
		%feature("autodoc", "	* returns an edge and one parameter on them corresponding to the parameter U.

	:param U:
	:type U: float
	:param E:
	:type E: TopoDS_Edge &
	:param UonE:
	:type UonE: float &
	:rtype: None
") Edge;
		void Edge (const Standard_Real U,TopoDS_Edge & E,Standard_Real &OutValue);
		%feature("autodoc", "	:rtype: float
") FirstParameter;
		Standard_Real FirstParameter ();
		%feature("autodoc", "	:rtype: float
") LastParameter;
		Standard_Real LastParameter ();
		%feature("autodoc", "	:rtype: GeomAbs_Shape
") Continuity;
		GeomAbs_Shape Continuity ();
		%feature("autodoc", "	* Returns the number of intervals for continuity <S>. May be one if Continuity(me) >= <S>

	:param S:
	:type S: GeomAbs_Shape
	:rtype: int
") NbIntervals;
		Standard_Integer NbIntervals (const GeomAbs_Shape S);
		%feature("autodoc", "	* Stores in <T> the parameters bounding the intervals of continuity <S>.  The array must provide enough room to accomodate for the parameters. i.e. T.Length() > NbIntervals()

	:param T:
	:type T: TColStd_Array1OfReal &
	:param S:
	:type S: GeomAbs_Shape
	:rtype: None
") Intervals;
		void Intervals (TColStd_Array1OfReal & T,const GeomAbs_Shape S);
		%feature("autodoc", "	* Returns a curve equivalent of <self> between parameters <First> and <Last>. <Tol> is used to test for 3d points confusion. If <First> >= <Last>

	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:param Tol:
	:type Tol: float
	:rtype: Handle_Adaptor3d_HCurve
") Trim;
		Handle_Adaptor3d_HCurve Trim (const Standard_Real First,const Standard_Real Last,const Standard_Real Tol);
		%feature("autodoc", "	:rtype: bool
") IsClosed;
		Standard_Boolean IsClosed ();
		%feature("autodoc", "	:rtype: bool
") IsPeriodic;
		Standard_Boolean IsPeriodic ();
		%feature("autodoc", "	:rtype: float
") Period;
		Standard_Real Period ();
		%feature("autodoc", "	* Computes the point of parameter U on the curve

	:param U:
	:type U: float
	:rtype: gp_Pnt
") Value;
		gp_Pnt Value (const Standard_Real U);
		%feature("autodoc", "	* Computes the point of parameter U.

	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt
	:rtype: None
") D0;
		void D0 (const Standard_Real U,gp_Pnt & P);
		%feature("autodoc", "	* Computes the point of parameter U on the curve with its first derivative. Raised if the continuity of the current interval is not C1.

	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt
	:param V:
	:type V: gp_Vec
	:rtype: None
") D1;
		void D1 (const Standard_Real U,gp_Pnt & P,gp_Vec & V);
		%feature("autodoc", "	* Returns the point P of parameter U, the first and second derivatives V1 and V2. Raised if the continuity of the current interval is not C2.

	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt
	:param V1:
	:type V1: gp_Vec
	:param V2:
	:type V2: gp_Vec
	:rtype: None
") D2;
		void D2 (const Standard_Real U,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2);
		%feature("autodoc", "	* Returns the point P of parameter U, the first, the second and the third derivative. Raised if the continuity of the current interval is not C3.

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
	:rtype: None
") D3;
		void D3 (const Standard_Real U,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2,gp_Vec & V3);
		%feature("autodoc", "	* The returned vector gives the value of the derivative for the order of derivation N. Raised if the continuity of the current interval is not CN. Raised if N < 1.

	:param U:
	:type U: float
	:param N:
	:type N: Standard_Integer
	:rtype: gp_Vec
") DN;
		gp_Vec DN (const Standard_Real U,const Standard_Integer N);
		%feature("autodoc", "	* returns the parametric resolution

	:param R3d:
	:type R3d: float
	:rtype: float
") Resolution;
		Standard_Real Resolution (const Standard_Real R3d);
		%feature("autodoc", "	:rtype: GeomAbs_CurveType
") GetType;
		GeomAbs_CurveType GetType ();
		%feature("autodoc", "	:rtype: gp_Lin
") Line;
		gp_Lin Line ();
		%feature("autodoc", "	:rtype: gp_Circ
") Circle;
		gp_Circ Circle ();
		%feature("autodoc", "	:rtype: gp_Elips
") Ellipse;
		gp_Elips Ellipse ();
		%feature("autodoc", "	:rtype: gp_Hypr
") Hyperbola;
		gp_Hypr Hyperbola ();
		%feature("autodoc", "	:rtype: gp_Parab
") Parabola;
		gp_Parab Parabola ();
		%feature("autodoc", "	:rtype: int
") Degree;
		Standard_Integer Degree ();
		%feature("autodoc", "	:rtype: bool
") IsRational;
		Standard_Boolean IsRational ();
		%feature("autodoc", "	:rtype: int
") NbPoles;
		Standard_Integer NbPoles ();
		%feature("autodoc", "	:rtype: int
") NbKnots;
		Standard_Integer NbKnots ();
		%feature("autodoc", "	:rtype: Handle_Geom_BezierCurve
") Bezier;
		Handle_Geom_BezierCurve Bezier ();
		%feature("autodoc", "	:rtype: Handle_Geom_BSplineCurve
") BSpline;
		Handle_Geom_BSplineCurve BSpline ();
};


%feature("shadow") BRepAdaptor_CompCurve::~BRepAdaptor_CompCurve %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepAdaptor_CompCurve {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepAdaptor_Curve;
class BRepAdaptor_Curve : public Adaptor3d_Curve {
	public:
		%feature("autodoc", "	* Creates an undefined Curve with no Edge loaded.

	:rtype: None
") BRepAdaptor_Curve;
		 BRepAdaptor_Curve ();
		%feature("autodoc", "	* Creates a Curve to acces to the geometry of edge <E>.

	:param E:
	:type E: TopoDS_Edge &
	:rtype: None
") BRepAdaptor_Curve;
		 BRepAdaptor_Curve (const TopoDS_Edge & E);
		%feature("autodoc", "	* Creates a Curve to acces to the geometry of edge <E>. The geometry will be computed using the parametric curve of <E> on the face <F>. An Error is raised if the edge does not have a pcurve on the face.

	:param E:
	:type E: TopoDS_Edge &
	:param F:
	:type F: TopoDS_Face &
	:rtype: None
") BRepAdaptor_Curve;
		 BRepAdaptor_Curve (const TopoDS_Edge & E,const TopoDS_Face & F);
		%feature("autodoc", "	* Sets the Curve <self> to acces to the geometry of edge <E>.

	:param E:
	:type E: TopoDS_Edge &
	:rtype: None
") Initialize;
		void Initialize (const TopoDS_Edge & E);
		%feature("autodoc", "	* Sets the Curve <self> to acces to the geometry of edge <E>. The geometry will be computed using the parametric curve of <E> on the face <F>. An Error is raised if the edge does not have a pcurve on the face.

	:param E:
	:type E: TopoDS_Edge &
	:param F:
	:type F: TopoDS_Face &
	:rtype: None
") Initialize;
		void Initialize (const TopoDS_Edge & E,const TopoDS_Face & F);
		%feature("autodoc", "	* Returns the coordinate system of the curve.

	:rtype: gp_Trsf
") Trsf;
		const gp_Trsf  Trsf ();
		%feature("autodoc", "	* Returns True if the edge geometry is computed from a 3D curve.

	:rtype: bool
") Is3DCurve;
		Standard_Boolean Is3DCurve ();
		%feature("autodoc", "	* Returns True if the edge geometry is computed from a pcurve on a surface.

	:rtype: bool
") IsCurveOnSurface;
		Standard_Boolean IsCurveOnSurface ();
		%feature("autodoc", "	* Returns the Curve of the edge.

	:rtype: GeomAdaptor_Curve
") Curve;
		const GeomAdaptor_Curve & Curve ();
		%feature("autodoc", "	* Returns the CurveOnSurface of the edge.

	:rtype: Adaptor3d_CurveOnSurface
") CurveOnSurface;
		const Adaptor3d_CurveOnSurface & CurveOnSurface ();
		%feature("autodoc", "	* Returns the edge.

	:rtype: TopoDS_Edge
") Edge;
		const TopoDS_Edge  Edge ();
		%feature("autodoc", "	* Returns the edge tolerance.

	:rtype: float
") Tolerance;
		Standard_Real Tolerance ();
		%feature("autodoc", "	:rtype: float
") FirstParameter;
		Standard_Real FirstParameter ();
		%feature("autodoc", "	:rtype: float
") LastParameter;
		Standard_Real LastParameter ();
		%feature("autodoc", "	:rtype: GeomAbs_Shape
") Continuity;
		GeomAbs_Shape Continuity ();
		%feature("autodoc", "	* Returns the number of intervals for continuity <S>. May be one if Continuity(me) >= <S>

	:param S:
	:type S: GeomAbs_Shape
	:rtype: int
") NbIntervals;
		Standard_Integer NbIntervals (const GeomAbs_Shape S);
		%feature("autodoc", "	* Stores in <T> the parameters bounding the intervals of continuity <S>.  The array must provide enough room to accomodate for the parameters. i.e. T.Length() > NbIntervals()

	:param T:
	:type T: TColStd_Array1OfReal &
	:param S:
	:type S: GeomAbs_Shape
	:rtype: None
") Intervals;
		void Intervals (TColStd_Array1OfReal & T,const GeomAbs_Shape S);
		%feature("autodoc", "	* Returns a curve equivalent of <self> between parameters <First> and <Last>. <Tol> is used to test for 3d points confusion. If <First> >= <Last>

	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:param Tol:
	:type Tol: float
	:rtype: Handle_Adaptor3d_HCurve
") Trim;
		Handle_Adaptor3d_HCurve Trim (const Standard_Real First,const Standard_Real Last,const Standard_Real Tol);
		%feature("autodoc", "	:rtype: bool
") IsClosed;
		Standard_Boolean IsClosed ();
		%feature("autodoc", "	:rtype: bool
") IsPeriodic;
		Standard_Boolean IsPeriodic ();
		%feature("autodoc", "	:rtype: float
") Period;
		Standard_Real Period ();
		%feature("autodoc", "	* Computes the point of parameter U on the curve

	:param U:
	:type U: float
	:rtype: gp_Pnt
") Value;
		gp_Pnt Value (const Standard_Real U);
		%feature("autodoc", "	* Computes the point of parameter U.

	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt
	:rtype: None
") D0;
		void D0 (const Standard_Real U,gp_Pnt & P);
		%feature("autodoc", "	* Computes the point of parameter U on the curve with its first derivative. Raised if the continuity of the current interval is not C1.

	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt
	:param V:
	:type V: gp_Vec
	:rtype: None
") D1;
		void D1 (const Standard_Real U,gp_Pnt & P,gp_Vec & V);
		%feature("autodoc", "	* Returns the point P of parameter U, the first and second derivatives V1 and V2. Raised if the continuity of the current interval is not C2.

	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt
	:param V1:
	:type V1: gp_Vec
	:param V2:
	:type V2: gp_Vec
	:rtype: None
") D2;
		void D2 (const Standard_Real U,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2);
		%feature("autodoc", "	* Returns the point P of parameter U, the first, the second and the third derivative. Raised if the continuity of the current interval is not C3.

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
	:rtype: None
") D3;
		void D3 (const Standard_Real U,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2,gp_Vec & V3);
		%feature("autodoc", "	* The returned vector gives the value of the derivative for the order of derivation N. Raised if the continuity of the current interval is not CN. Raised if N < 1.

	:param U:
	:type U: float
	:param N:
	:type N: Standard_Integer
	:rtype: gp_Vec
") DN;
		gp_Vec DN (const Standard_Real U,const Standard_Integer N);
		%feature("autodoc", "	* returns the parametric resolution

	:param R3d:
	:type R3d: float
	:rtype: float
") Resolution;
		Standard_Real Resolution (const Standard_Real R3d);
		%feature("autodoc", "	:rtype: GeomAbs_CurveType
") GetType;
		GeomAbs_CurveType GetType ();
		%feature("autodoc", "	:rtype: gp_Lin
") Line;
		gp_Lin Line ();
		%feature("autodoc", "	:rtype: gp_Circ
") Circle;
		gp_Circ Circle ();
		%feature("autodoc", "	:rtype: gp_Elips
") Ellipse;
		gp_Elips Ellipse ();
		%feature("autodoc", "	:rtype: gp_Hypr
") Hyperbola;
		gp_Hypr Hyperbola ();
		%feature("autodoc", "	:rtype: gp_Parab
") Parabola;
		gp_Parab Parabola ();
		%feature("autodoc", "	:rtype: int
") Degree;
		Standard_Integer Degree ();
		%feature("autodoc", "	:rtype: bool
") IsRational;
		Standard_Boolean IsRational ();
		%feature("autodoc", "	:rtype: int
") NbPoles;
		Standard_Integer NbPoles ();
		%feature("autodoc", "	:rtype: int
") NbKnots;
		Standard_Integer NbKnots ();
		%feature("autodoc", "	* Warning :  This will make a copy of the Bezier Curve  since it applies to it myTsrf . Be carefull when  using this method

	:rtype: Handle_Geom_BezierCurve
") Bezier;
		Handle_Geom_BezierCurve Bezier ();
		%feature("autodoc", "	* Warning :  This will make a copy of the BSpline Curve  since it applies to it myTsrf . Be carefull when  using this method

	:rtype: Handle_Geom_BSplineCurve
") BSpline;
		Handle_Geom_BSplineCurve BSpline ();
};


%feature("shadow") BRepAdaptor_Curve::~BRepAdaptor_Curve %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepAdaptor_Curve {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepAdaptor_Curve2d;
class BRepAdaptor_Curve2d : public Geom2dAdaptor_Curve {
	public:
		%feature("autodoc", "	* Creates an uninitialized curve2d.

	:rtype: None
") BRepAdaptor_Curve2d;
		 BRepAdaptor_Curve2d ();
		%feature("autodoc", "	* Creates with the pcurve of <E> on <F>.

	:param E:
	:type E: TopoDS_Edge &
	:param F:
	:type F: TopoDS_Face &
	:rtype: None
") BRepAdaptor_Curve2d;
		 BRepAdaptor_Curve2d (const TopoDS_Edge & E,const TopoDS_Face & F);
		%feature("autodoc", "	* Initialize with the pcurve of <E> on <F>.

	:param E:
	:type E: TopoDS_Edge &
	:param F:
	:type F: TopoDS_Face &
	:rtype: None
") Initialize;
		void Initialize (const TopoDS_Edge & E,const TopoDS_Face & F);
		%feature("autodoc", "	* Returns the Edge.

	:rtype: TopoDS_Edge
") Edge;
		const TopoDS_Edge  Edge ();
		%feature("autodoc", "	* Returns the Face.

	:rtype: TopoDS_Face
") Face;
		const TopoDS_Face  Face ();
};


%feature("shadow") BRepAdaptor_Curve2d::~BRepAdaptor_Curve2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepAdaptor_Curve2d {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepAdaptor_HArray1OfCurve;
class BRepAdaptor_HArray1OfCurve : public MMgt_TShared {
	public:
		%feature("autodoc", "	:param Low:
	:type Low: Standard_Integer
	:param Up:
	:type Up: Standard_Integer
	:rtype: None
") BRepAdaptor_HArray1OfCurve;
		 BRepAdaptor_HArray1OfCurve (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "	:param Low:
	:type Low: Standard_Integer
	:param Up:
	:type Up: Standard_Integer
	:param V:
	:type V: BRepAdaptor_Curve &
	:rtype: None
") BRepAdaptor_HArray1OfCurve;
		 BRepAdaptor_HArray1OfCurve (const Standard_Integer Low,const Standard_Integer Up,const BRepAdaptor_Curve & V);
		%feature("autodoc", "	:param V:
	:type V: BRepAdaptor_Curve &
	:rtype: None
") Init;
		void Init (const BRepAdaptor_Curve & V);
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param Value:
	:type Value: BRepAdaptor_Curve &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const BRepAdaptor_Curve & Value);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: BRepAdaptor_Curve
") Value;
		const BRepAdaptor_Curve & Value (const Standard_Integer Index);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: BRepAdaptor_Curve
") ChangeValue;
		BRepAdaptor_Curve & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "	:rtype: BRepAdaptor_Array1OfCurve
") Array1;
		const BRepAdaptor_Array1OfCurve & Array1 ();
		%feature("autodoc", "	:rtype: BRepAdaptor_Array1OfCurve
") ChangeArray1;
		BRepAdaptor_Array1OfCurve & ChangeArray1 ();
};


%feature("shadow") BRepAdaptor_HArray1OfCurve::~BRepAdaptor_HArray1OfCurve %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepAdaptor_HArray1OfCurve {
	void _kill_pointed() {
		delete $self;
	}
};
%extend BRepAdaptor_HArray1OfCurve {
	Handle_BRepAdaptor_HArray1OfCurve GetHandle() {
	return *(Handle_BRepAdaptor_HArray1OfCurve*) &$self;
	}
};

%nodefaultctor Handle_BRepAdaptor_HArray1OfCurve;
class Handle_BRepAdaptor_HArray1OfCurve : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_BRepAdaptor_HArray1OfCurve();
        Handle_BRepAdaptor_HArray1OfCurve(const Handle_BRepAdaptor_HArray1OfCurve &aHandle);
        Handle_BRepAdaptor_HArray1OfCurve(const BRepAdaptor_HArray1OfCurve *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BRepAdaptor_HArray1OfCurve DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BRepAdaptor_HArray1OfCurve {
    BRepAdaptor_HArray1OfCurve* GetObject() {
    return (BRepAdaptor_HArray1OfCurve*)$self->Access();
    }
};
%feature("shadow") Handle_BRepAdaptor_HArray1OfCurve::~Handle_BRepAdaptor_HArray1OfCurve %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_BRepAdaptor_HArray1OfCurve {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor BRepAdaptor_HCompCurve;
class BRepAdaptor_HCompCurve : public Adaptor3d_HCurve {
	public:
		%feature("autodoc", "	:rtype: None
") BRepAdaptor_HCompCurve;
		 BRepAdaptor_HCompCurve ();
		%feature("autodoc", "	:param C:
	:type C: BRepAdaptor_CompCurve &
	:rtype: None
") BRepAdaptor_HCompCurve;
		 BRepAdaptor_HCompCurve (const BRepAdaptor_CompCurve & C);
		%feature("autodoc", "	:param C:
	:type C: BRepAdaptor_CompCurve &
	:rtype: None
") Set;
		void Set (const BRepAdaptor_CompCurve & C);
		%feature("autodoc", "	:rtype: Adaptor3d_Curve
") Curve;
		const Adaptor3d_Curve & Curve ();
		%feature("autodoc", "	:rtype: Adaptor3d_Curve
") GetCurve;
		Adaptor3d_Curve & GetCurve ();
		%feature("autodoc", "	:rtype: BRepAdaptor_CompCurve
") ChangeCurve;
		BRepAdaptor_CompCurve & ChangeCurve ();
};


%feature("shadow") BRepAdaptor_HCompCurve::~BRepAdaptor_HCompCurve %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepAdaptor_HCompCurve {
	void _kill_pointed() {
		delete $self;
	}
};
%extend BRepAdaptor_HCompCurve {
	Handle_BRepAdaptor_HCompCurve GetHandle() {
	return *(Handle_BRepAdaptor_HCompCurve*) &$self;
	}
};

%nodefaultctor Handle_BRepAdaptor_HCompCurve;
class Handle_BRepAdaptor_HCompCurve : public Handle_Adaptor3d_HCurve {

    public:
        // constructors
        Handle_BRepAdaptor_HCompCurve();
        Handle_BRepAdaptor_HCompCurve(const Handle_BRepAdaptor_HCompCurve &aHandle);
        Handle_BRepAdaptor_HCompCurve(const BRepAdaptor_HCompCurve *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BRepAdaptor_HCompCurve DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BRepAdaptor_HCompCurve {
    BRepAdaptor_HCompCurve* GetObject() {
    return (BRepAdaptor_HCompCurve*)$self->Access();
    }
};
%feature("shadow") Handle_BRepAdaptor_HCompCurve::~Handle_BRepAdaptor_HCompCurve %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_BRepAdaptor_HCompCurve {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor BRepAdaptor_HCurve;
class BRepAdaptor_HCurve : public Adaptor3d_HCurve {
	public:
		%feature("autodoc", "	:rtype: None
") BRepAdaptor_HCurve;
		 BRepAdaptor_HCurve ();
		%feature("autodoc", "	:param C:
	:type C: BRepAdaptor_Curve &
	:rtype: None
") BRepAdaptor_HCurve;
		 BRepAdaptor_HCurve (const BRepAdaptor_Curve & C);
		%feature("autodoc", "	:param C:
	:type C: BRepAdaptor_Curve &
	:rtype: None
") Set;
		void Set (const BRepAdaptor_Curve & C);
		%feature("autodoc", "	:rtype: Adaptor3d_Curve
") Curve;
		const Adaptor3d_Curve & Curve ();
		%feature("autodoc", "	:rtype: Adaptor3d_Curve
") GetCurve;
		Adaptor3d_Curve & GetCurve ();
		%feature("autodoc", "	:rtype: BRepAdaptor_Curve
") ChangeCurve;
		BRepAdaptor_Curve & ChangeCurve ();
};


%feature("shadow") BRepAdaptor_HCurve::~BRepAdaptor_HCurve %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepAdaptor_HCurve {
	void _kill_pointed() {
		delete $self;
	}
};
%extend BRepAdaptor_HCurve {
	Handle_BRepAdaptor_HCurve GetHandle() {
	return *(Handle_BRepAdaptor_HCurve*) &$self;
	}
};

%nodefaultctor Handle_BRepAdaptor_HCurve;
class Handle_BRepAdaptor_HCurve : public Handle_Adaptor3d_HCurve {

    public:
        // constructors
        Handle_BRepAdaptor_HCurve();
        Handle_BRepAdaptor_HCurve(const Handle_BRepAdaptor_HCurve &aHandle);
        Handle_BRepAdaptor_HCurve(const BRepAdaptor_HCurve *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BRepAdaptor_HCurve DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BRepAdaptor_HCurve {
    BRepAdaptor_HCurve* GetObject() {
    return (BRepAdaptor_HCurve*)$self->Access();
    }
};
%feature("shadow") Handle_BRepAdaptor_HCurve::~Handle_BRepAdaptor_HCurve %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_BRepAdaptor_HCurve {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor BRepAdaptor_HCurve2d;
class BRepAdaptor_HCurve2d : public Adaptor2d_HCurve2d {
	public:
		%feature("autodoc", "	:rtype: None
") BRepAdaptor_HCurve2d;
		 BRepAdaptor_HCurve2d ();
		%feature("autodoc", "	:param C:
	:type C: BRepAdaptor_Curve2d &
	:rtype: None
") BRepAdaptor_HCurve2d;
		 BRepAdaptor_HCurve2d (const BRepAdaptor_Curve2d & C);
		%feature("autodoc", "	:param C:
	:type C: BRepAdaptor_Curve2d &
	:rtype: None
") Set;
		void Set (const BRepAdaptor_Curve2d & C);
		%feature("autodoc", "	:rtype: Adaptor2d_Curve2d
") Curve2d;
		const Adaptor2d_Curve2d & Curve2d ();
		%feature("autodoc", "	:rtype: BRepAdaptor_Curve2d
") ChangeCurve2d;
		BRepAdaptor_Curve2d & ChangeCurve2d ();
};


%feature("shadow") BRepAdaptor_HCurve2d::~BRepAdaptor_HCurve2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepAdaptor_HCurve2d {
	void _kill_pointed() {
		delete $self;
	}
};
%extend BRepAdaptor_HCurve2d {
	Handle_BRepAdaptor_HCurve2d GetHandle() {
	return *(Handle_BRepAdaptor_HCurve2d*) &$self;
	}
};

%nodefaultctor Handle_BRepAdaptor_HCurve2d;
class Handle_BRepAdaptor_HCurve2d : public Handle_Adaptor2d_HCurve2d {

    public:
        // constructors
        Handle_BRepAdaptor_HCurve2d();
        Handle_BRepAdaptor_HCurve2d(const Handle_BRepAdaptor_HCurve2d &aHandle);
        Handle_BRepAdaptor_HCurve2d(const BRepAdaptor_HCurve2d *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BRepAdaptor_HCurve2d DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BRepAdaptor_HCurve2d {
    BRepAdaptor_HCurve2d* GetObject() {
    return (BRepAdaptor_HCurve2d*)$self->Access();
    }
};
%feature("shadow") Handle_BRepAdaptor_HCurve2d::~Handle_BRepAdaptor_HCurve2d %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_BRepAdaptor_HCurve2d {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor BRepAdaptor_HSurface;
class BRepAdaptor_HSurface : public Adaptor3d_HSurface {
	public:
		%feature("autodoc", "	:rtype: None
") BRepAdaptor_HSurface;
		 BRepAdaptor_HSurface ();
		%feature("autodoc", "	:param S:
	:type S: BRepAdaptor_Surface &
	:rtype: None
") BRepAdaptor_HSurface;
		 BRepAdaptor_HSurface (const BRepAdaptor_Surface & S);
		%feature("autodoc", "	:param S:
	:type S: BRepAdaptor_Surface &
	:rtype: None
") Set;
		void Set (const BRepAdaptor_Surface & S);
		%feature("autodoc", "	:rtype: Adaptor3d_Surface
") Surface;
		const Adaptor3d_Surface & Surface ();
		%feature("autodoc", "	:rtype: BRepAdaptor_Surface
") ChangeSurface;
		BRepAdaptor_Surface & ChangeSurface ();
};


%feature("shadow") BRepAdaptor_HSurface::~BRepAdaptor_HSurface %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepAdaptor_HSurface {
	void _kill_pointed() {
		delete $self;
	}
};
%extend BRepAdaptor_HSurface {
	Handle_BRepAdaptor_HSurface GetHandle() {
	return *(Handle_BRepAdaptor_HSurface*) &$self;
	}
};

%nodefaultctor Handle_BRepAdaptor_HSurface;
class Handle_BRepAdaptor_HSurface : public Handle_Adaptor3d_HSurface {

    public:
        // constructors
        Handle_BRepAdaptor_HSurface();
        Handle_BRepAdaptor_HSurface(const Handle_BRepAdaptor_HSurface &aHandle);
        Handle_BRepAdaptor_HSurface(const BRepAdaptor_HSurface *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BRepAdaptor_HSurface DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BRepAdaptor_HSurface {
    BRepAdaptor_HSurface* GetObject() {
    return (BRepAdaptor_HSurface*)$self->Access();
    }
};
%feature("shadow") Handle_BRepAdaptor_HSurface::~Handle_BRepAdaptor_HSurface %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_BRepAdaptor_HSurface {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor BRepAdaptor_Surface;
class BRepAdaptor_Surface : public Adaptor3d_Surface {
	public:
		%feature("autodoc", "	* Creates an undefined surface with no face loaded.

	:rtype: None
") BRepAdaptor_Surface;
		 BRepAdaptor_Surface ();
		%feature("autodoc", "	* Creates a surface to access the geometry of <F>. If <Restriction> is true the parameter range is the parameter range in the UV space of the restriction.

	:param F:
	:type F: TopoDS_Face &
	:param R: default value is Standard_True
	:type R: bool
	:rtype: None
") BRepAdaptor_Surface;
		 BRepAdaptor_Surface (const TopoDS_Face & F,const Standard_Boolean R = Standard_True);
		%feature("autodoc", "	* Sets the surface to the geometry of <F>.

	:param F:
	:type F: TopoDS_Face &
	:param Restriction: default value is Standard_True
	:type Restriction: bool
	:rtype: None
") Initialize;
		void Initialize (const TopoDS_Face & F,const Standard_Boolean Restriction = Standard_True);
		%feature("autodoc", "	* Returns the surface.

	:rtype: GeomAdaptor_Surface
") Surface;
		const GeomAdaptor_Surface & Surface ();
		%feature("autodoc", "	* Returns the surface.

	:rtype: GeomAdaptor_Surface
") ChangeSurface;
		GeomAdaptor_Surface & ChangeSurface ();
		%feature("autodoc", "	* Returns the surface coordinate system.

	:rtype: gp_Trsf
") Trsf;
		const gp_Trsf  Trsf ();
		%feature("autodoc", "	* Returns the face.

	:rtype: TopoDS_Face
") Face;
		const TopoDS_Face  Face ();
		%feature("autodoc", "	* Returns the face tolerance.

	:rtype: float
") Tolerance;
		Standard_Real Tolerance ();
		%feature("autodoc", "	:rtype: float
") FirstUParameter;
		Standard_Real FirstUParameter ();
		%feature("autodoc", "	:rtype: float
") LastUParameter;
		Standard_Real LastUParameter ();
		%feature("autodoc", "	:rtype: float
") FirstVParameter;
		Standard_Real FirstVParameter ();
		%feature("autodoc", "	:rtype: float
") LastVParameter;
		Standard_Real LastVParameter ();
		%feature("autodoc", "	:rtype: GeomAbs_Shape
") UContinuity;
		GeomAbs_Shape UContinuity ();
		%feature("autodoc", "	:rtype: GeomAbs_Shape
") VContinuity;
		GeomAbs_Shape VContinuity ();
		%feature("autodoc", "	* If necessary, breaks the surface in U intervals of continuity <S>. And returns the number of intervals.

	:param S:
	:type S: GeomAbs_Shape
	:rtype: int
") NbUIntervals;
		Standard_Integer NbUIntervals (const GeomAbs_Shape S);
		%feature("autodoc", "	* If necessary, breaks the surface in V intervals of continuity <S>. And returns the number of intervals.

	:param S:
	:type S: GeomAbs_Shape
	:rtype: int
") NbVIntervals;
		Standard_Integer NbVIntervals (const GeomAbs_Shape S);
		%feature("autodoc", "	* Returns the intervals with the requested continuity in the U direction.

	:param T:
	:type T: TColStd_Array1OfReal &
	:param S:
	:type S: GeomAbs_Shape
	:rtype: None
") UIntervals;
		void UIntervals (TColStd_Array1OfReal & T,const GeomAbs_Shape S);
		%feature("autodoc", "	* Returns the intervals with the requested continuity in the V direction.

	:param T:
	:type T: TColStd_Array1OfReal &
	:param S:
	:type S: GeomAbs_Shape
	:rtype: None
") VIntervals;
		void VIntervals (TColStd_Array1OfReal & T,const GeomAbs_Shape S);
		%feature("autodoc", "	* Returns a surface trimmed in the U direction equivalent of <self> between parameters <First> and <Last>. <Tol> is used to test for 3d points confusion. If <First> >= <Last>

	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:param Tol:
	:type Tol: float
	:rtype: Handle_Adaptor3d_HSurface
") UTrim;
		Handle_Adaptor3d_HSurface UTrim (const Standard_Real First,const Standard_Real Last,const Standard_Real Tol);
		%feature("autodoc", "	* Returns a surface trimmed in the V direction between parameters <First> and <Last>. <Tol> is used to test for 3d points confusion. If <First> >= <Last>

	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:param Tol:
	:type Tol: float
	:rtype: Handle_Adaptor3d_HSurface
") VTrim;
		Handle_Adaptor3d_HSurface VTrim (const Standard_Real First,const Standard_Real Last,const Standard_Real Tol);
		%feature("autodoc", "	:rtype: bool
") IsUClosed;
		Standard_Boolean IsUClosed ();
		%feature("autodoc", "	:rtype: bool
") IsVClosed;
		Standard_Boolean IsVClosed ();
		%feature("autodoc", "	:rtype: bool
") IsUPeriodic;
		Standard_Boolean IsUPeriodic ();
		%feature("autodoc", "	:rtype: float
") UPeriod;
		Standard_Real UPeriod ();
		%feature("autodoc", "	:rtype: bool
") IsVPeriodic;
		Standard_Boolean IsVPeriodic ();
		%feature("autodoc", "	:rtype: float
") VPeriod;
		Standard_Real VPeriod ();
		%feature("autodoc", "	* Computes the point of parameters U,V on the surface.

	:param U:
	:type U: float
	:param V:
	:type V: float
	:rtype: gp_Pnt
") Value;
		gp_Pnt Value (const Standard_Real U,const Standard_Real V);
		%feature("autodoc", "	* Computes the point of parameters U,V on the surface.

	:param U:
	:type U: float
	:param V:
	:type V: float
	:param P:
	:type P: gp_Pnt
	:rtype: None
") D0;
		void D0 (const Standard_Real U,const Standard_Real V,gp_Pnt & P);
		%feature("autodoc", "	* Computes the point and the first derivatives on the surface. Raised if the continuity of the current intervals is not C1.

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
	:rtype: None
") D1;
		void D1 (const Standard_Real U,const Standard_Real V,gp_Pnt & P,gp_Vec & D1U,gp_Vec & D1V);
		%feature("autodoc", "	* Computes the point, the first and second derivatives on the surface. Raised if the continuity of the current intervals is not C2.

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
	:rtype: None
") D2;
		void D2 (const Standard_Real U,const Standard_Real V,gp_Pnt & P,gp_Vec & D1U,gp_Vec & D1V,gp_Vec & D2U,gp_Vec & D2V,gp_Vec & D2UV);
		%feature("autodoc", "	* Computes the point, the first, second and third derivatives on the surface. Raised if the continuity of the current intervals is not C3.

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
	:rtype: None
") D3;
		void D3 (const Standard_Real U,const Standard_Real V,gp_Pnt & P,gp_Vec & D1U,gp_Vec & D1V,gp_Vec & D2U,gp_Vec & D2V,gp_Vec & D2UV,gp_Vec & D3U,gp_Vec & D3V,gp_Vec & D3UUV,gp_Vec & D3UVV);
		%feature("autodoc", "	* Computes the derivative of order Nu in the direction U and Nv in the direction V at the point P(U, V). Raised if the current U interval is not not CNu and the current V interval is not CNv. Raised if Nu + Nv < 1 or Nu < 0 or Nv < 0.

	:param U:
	:type U: float
	:param V:
	:type V: float
	:param Nu:
	:type Nu: Standard_Integer
	:param Nv:
	:type Nv: Standard_Integer
	:rtype: gp_Vec
") DN;
		gp_Vec DN (const Standard_Real U,const Standard_Real V,const Standard_Integer Nu,const Standard_Integer Nv);
		%feature("autodoc", "	* Returns the parametric U resolution corresponding  to the real space resolution <R3d>.

	:param R3d:
	:type R3d: float
	:rtype: float
") UResolution;
		Standard_Real UResolution (const Standard_Real R3d);
		%feature("autodoc", "	* Returns the parametric V resolution corresponding  to the real space resolution <R3d>.

	:param R3d:
	:type R3d: float
	:rtype: float
") VResolution;
		Standard_Real VResolution (const Standard_Real R3d);
		%feature("autodoc", "	* Returns the type of the surface : Plane, Cylinder, Cone, Sphere, Torus, BezierSurface, BSplineSurface, SurfaceOfRevolution, SurfaceOfExtrusion, OtherSurface

	:rtype: GeomAbs_SurfaceType
") GetType;
		GeomAbs_SurfaceType GetType ();
		%feature("autodoc", "	:rtype: gp_Pln
") Plane;
		gp_Pln Plane ();
		%feature("autodoc", "	:rtype: gp_Cylinder
") Cylinder;
		gp_Cylinder Cylinder ();
		%feature("autodoc", "	:rtype: gp_Cone
") Cone;
		gp_Cone Cone ();
		%feature("autodoc", "	:rtype: gp_Sphere
") Sphere;
		gp_Sphere Sphere ();
		%feature("autodoc", "	:rtype: gp_Torus
") Torus;
		gp_Torus Torus ();
		%feature("autodoc", "	:rtype: int
") UDegree;
		Standard_Integer UDegree ();
		%feature("autodoc", "	:rtype: int
") NbUPoles;
		Standard_Integer NbUPoles ();
		%feature("autodoc", "	:rtype: int
") VDegree;
		Standard_Integer VDegree ();
		%feature("autodoc", "	:rtype: int
") NbVPoles;
		Standard_Integer NbVPoles ();
		%feature("autodoc", "	:rtype: int
") NbUKnots;
		Standard_Integer NbUKnots ();
		%feature("autodoc", "	:rtype: int
") NbVKnots;
		Standard_Integer NbVKnots ();
		%feature("autodoc", "	:rtype: bool
") IsURational;
		Standard_Boolean IsURational ();
		%feature("autodoc", "	:rtype: bool
") IsVRational;
		Standard_Boolean IsVRational ();
		%feature("autodoc", "	:rtype: Handle_Geom_BezierSurface
") Bezier;
		Handle_Geom_BezierSurface Bezier ();
		%feature("autodoc", "	* Warning : this will make a copy of the BSpline Surface since it applies to it the myTsrf transformation Be Carefull when using this method

	:rtype: Handle_Geom_BSplineSurface
") BSpline;
		Handle_Geom_BSplineSurface BSpline ();
		%feature("autodoc", "	:rtype: gp_Ax1
") AxeOfRevolution;
		gp_Ax1 AxeOfRevolution ();
		%feature("autodoc", "	:rtype: gp_Dir
") Direction;
		gp_Dir Direction ();
		%feature("autodoc", "	* only for SurfaceOfExtrusion and SurfaceOfRevolution Warning: this will make a copy of the underlying curve since it applies to it the transformation myTrsf. Be carefull when using this method.

	:rtype: Handle_Adaptor3d_HCurve
") BasisCurve;
		Handle_Adaptor3d_HCurve BasisCurve ();
		%feature("autodoc", "	:rtype: Handle_Adaptor3d_HSurface
") BasisSurface;
		Handle_Adaptor3d_HSurface BasisSurface ();
		%feature("autodoc", "	:rtype: float
") OffsetValue;
		Standard_Real OffsetValue ();
};


%feature("shadow") BRepAdaptor_Surface::~BRepAdaptor_Surface %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepAdaptor_Surface {
	void _kill_pointed() {
		delete $self;
	}
};
