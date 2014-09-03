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
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") BRepAdaptor_Array1OfCurve;
		 BRepAdaptor_Array1OfCurve (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	Item(BRepAdaptor_Curve)
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") BRepAdaptor_Array1OfCurve;
		 BRepAdaptor_Array1OfCurve (const BRepAdaptor_Curve & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	V(BRepAdaptor_Curve)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const BRepAdaptor_Curve & V);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Destroy;
		void Destroy ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("autodoc", "Args:
	Other(BRepAdaptor_Array1OfCurve)

Returns:
	BRepAdaptor_Array1OfCurve

No detailed docstring for this function.") Assign;
		const BRepAdaptor_Array1OfCurve & Assign (const BRepAdaptor_Array1OfCurve & Other);
		%feature("autodoc", "Args:
	Other(BRepAdaptor_Array1OfCurve)

Returns:
	BRepAdaptor_Array1OfCurve

No detailed docstring for this function.") operator=;
		const BRepAdaptor_Array1OfCurve & operator = (const BRepAdaptor_Array1OfCurve & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Length;
		Standard_Integer Length ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Lower;
		Standard_Integer Lower ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Upper;
		Standard_Integer Upper ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Value(BRepAdaptor_Curve)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const BRepAdaptor_Curve & Value);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	BRepAdaptor_Curve

No detailed docstring for this function.") Value;
		const BRepAdaptor_Curve & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	BRepAdaptor_Curve

No detailed docstring for this function.") ChangeValue;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates an undefined Curve with no Wire loaded.") BRepAdaptor_CompCurve;
		 BRepAdaptor_CompCurve ();
		%feature("autodoc", "Args:
	W(TopoDS_Wire)
	KnotByCurvilinearAbcissa(Standard_Boolean)=Standard_False

Returns:
	None

No detailed docstring for this function.") BRepAdaptor_CompCurve;
		 BRepAdaptor_CompCurve (const TopoDS_Wire & W,const Standard_Boolean KnotByCurvilinearAbcissa = Standard_False);
		%feature("autodoc", "Args:
	W(TopoDS_Wire)
	KnotByCurvilinearAbcissa(Standard_Boolean)
	First(Standard_Real)
	Last(Standard_Real)
	Tol(Standard_Real)

Returns:
	None

Creates a Curve  to  acces to the geometry of edge  
         <W>.") BRepAdaptor_CompCurve;
		 BRepAdaptor_CompCurve (const TopoDS_Wire & W,const Standard_Boolean KnotByCurvilinearAbcissa,const Standard_Real First,const Standard_Real Last,const Standard_Real Tol);
		%feature("autodoc", "Args:
	W(TopoDS_Wire)
	KnotByCurvilinearAbcissa(Standard_Boolean)

Returns:
	None

Sets the  wire <W>.") Initialize;
		void Initialize (const TopoDS_Wire & W,const Standard_Boolean KnotByCurvilinearAbcissa);
		%feature("autodoc", "Args:
	W(TopoDS_Wire)
	KnotByCurvilinearAbcissa(Standard_Boolean)
	First(Standard_Real)
	Last(Standard_Real)
	Tol(Standard_Real)

Returns:
	None

Sets wire <W> and trimmed  parameter.") Initialize;
		void Initialize (const TopoDS_Wire & W,const Standard_Boolean KnotByCurvilinearAbcissa,const Standard_Real First,const Standard_Real Last,const Standard_Real Tol);
		%feature("autodoc", "Args:
	Periodic(Standard_Boolean)

Returns:
	None

Set the flag Periodic.  
 Warning: This method has no effect if the wire is not closed") SetPeriodic;
		void SetPeriodic (const Standard_Boolean Periodic);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Wire

Returns the wire.") Wire;
		const TopoDS_Wire & Wire ();
		%feature("autodoc", "Args:
	U(Standard_Real)
	E(TopoDS_Edge)
	UonE(Standard_Real)

Returns:
	None

returns an  edge  and   one  parameter on them  
          corresponding to the parameter U.") Edge;
		void Edge (const Standard_Real U,TopoDS_Edge & E,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") FirstParameter;
		Standard_Real FirstParameter ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") LastParameter;
		Standard_Real LastParameter ();
		%feature("autodoc", "Args:
	None
Returns:
	GeomAbs_Shape

No detailed docstring for this function.") Continuity;
		GeomAbs_Shape Continuity ();
		%feature("autodoc", "Args:
	S(GeomAbs_Shape)

Returns:
	Standard_Integer

Returns  the number  of  intervals for  continuity  
         <S>. May be one if Continuity(me) >= <S>") NbIntervals;
		Standard_Integer NbIntervals (const GeomAbs_Shape S);
		%feature("autodoc", "Args:
	T(TColStd_Array1OfReal)
	S(GeomAbs_Shape)

Returns:
	None

Stores in <T> the  parameters bounding the intervals  
         of continuity <S>.  
 
         The array must provide  enough room to  accomodate  
         for the parameters. i.e. T.Length() > NbIntervals()") Intervals;
		void Intervals (TColStd_Array1OfReal & T,const GeomAbs_Shape S);
		%feature("autodoc", "Args:
	First(Standard_Real)
	Last(Standard_Real)
	Tol(Standard_Real)

Returns:
	Handle_Adaptor3d_HCurve

Returns    a  curve equivalent   of  <self>  between  
         parameters <First>  and <Last>. <Tol>  is used  to  
         test for 3d points confusion.  If <First> >= <Last>") Trim;
		Handle_Adaptor3d_HCurve Trim (const Standard_Real First,const Standard_Real Last,const Standard_Real Tol);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsClosed;
		Standard_Boolean IsClosed ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsPeriodic;
		Standard_Boolean IsPeriodic ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") Period;
		Standard_Real Period ();
		%feature("autodoc", "Args:
	U(Standard_Real)

Returns:
	gp_Pnt

Computes the point of parameter U on the curve") Value;
		gp_Pnt Value (const Standard_Real U);
		%feature("autodoc", "Args:
	U(Standard_Real)
	P(gp_Pnt)

Returns:
	None

Computes the point of parameter U.") D0;
		void D0 (const Standard_Real U,gp_Pnt & P);
		%feature("autodoc", "Args:
	U(Standard_Real)
	P(gp_Pnt)
	V(gp_Vec)

Returns:
	None

Computes the point of parameter U on the curve  
 with its first derivative.  Raised if the continuity of the current interval  
 is not C1.") D1;
		void D1 (const Standard_Real U,gp_Pnt & P,gp_Vec & V);
		%feature("autodoc", "Args:
	U(Standard_Real)
	P(gp_Pnt)
	V1(gp_Vec)
	V2(gp_Vec)

Returns:
	None

Returns the point P of parameter U, the first and second  
 derivatives V1 and V2.  Raised if the continuity of the current interval  
 is not C2.") D2;
		void D2 (const Standard_Real U,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2);
		%feature("autodoc", "Args:
	U(Standard_Real)
	P(gp_Pnt)
	V1(gp_Vec)
	V2(gp_Vec)
	V3(gp_Vec)

Returns:
	None

Returns the point P of parameter U, the first, the second  
 and the third derivative.  Raised if the continuity of the current interval  
 is not C3.") D3;
		void D3 (const Standard_Real U,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2,gp_Vec & V3);
		%feature("autodoc", "Args:
	U(Standard_Real)
	N(Standard_Integer)

Returns:
	gp_Vec

The returned vector gives the value of the derivative for the  
 order of derivation N.  Raised if the continuity of the current interval  
 is not CN.  Raised if N < 1.") DN;
		gp_Vec DN (const Standard_Real U,const Standard_Integer N);
		%feature("autodoc", "Args:
	R3d(Standard_Real)

Returns:
	Standard_Real

returns the parametric resolution") Resolution;
		Standard_Real Resolution (const Standard_Real R3d);
		%feature("autodoc", "Args:
	None
Returns:
	GeomAbs_CurveType

No detailed docstring for this function.") GetType;
		GeomAbs_CurveType GetType ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Lin

No detailed docstring for this function.") Line;
		gp_Lin Line ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Circ

No detailed docstring for this function.") Circle;
		gp_Circ Circle ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Elips

No detailed docstring for this function.") Ellipse;
		gp_Elips Ellipse ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Hypr

No detailed docstring for this function.") Hyperbola;
		gp_Hypr Hyperbola ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Parab

No detailed docstring for this function.") Parabola;
		gp_Parab Parabola ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Degree;
		Standard_Integer Degree ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsRational;
		Standard_Boolean IsRational ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbPoles;
		Standard_Integer NbPoles ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbKnots;
		Standard_Integer NbKnots ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_BezierCurve

No detailed docstring for this function.") Bezier;
		Handle_Geom_BezierCurve Bezier ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_BSplineCurve

No detailed docstring for this function.") BSpline;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates an undefined Curve with no Edge loaded.") BRepAdaptor_Curve;
		 BRepAdaptor_Curve ();
		%feature("autodoc", "Args:
	E(TopoDS_Edge)

Returns:
	None

Creates a Curve  to  acces to the geometry of edge  
         <E>.") BRepAdaptor_Curve;
		 BRepAdaptor_Curve (const TopoDS_Edge & E);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)
	F(TopoDS_Face)

Returns:
	None

Creates a Curve to acces to  the geometry  of edge  
         <E>.   The geometry  will   be  computed using the  
         parametric curve of <E> on the face  <F>. An Error  
         is  raised if  the edge does  not have a pcurve on  
         the face.") BRepAdaptor_Curve;
		 BRepAdaptor_Curve (const TopoDS_Edge & E,const TopoDS_Face & F);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)

Returns:
	None

Sets  the Curve <self>  to acces to the  geometry of  
         edge <E>.") Initialize;
		void Initialize (const TopoDS_Edge & E);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)
	F(TopoDS_Face)

Returns:
	None

Sets the Curve <self>  to acces to  the  geometry of  
         edge <E>.  The geometry will be computed using the  
         parametric curve of <E>  on the face <F>. An Error  
         is raised if the edge  does not  have a pcurve  on  
         the face.") Initialize;
		void Initialize (const TopoDS_Edge & E,const TopoDS_Face & F);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Trsf

Returns the coordinate system of the curve.") Trsf;
		const gp_Trsf & Trsf ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True if the edge geometry is computed from  
         a 3D curve.") Is3DCurve;
		Standard_Boolean Is3DCurve ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True if the edge geometry is computed from  
         a pcurve on a surface.") IsCurveOnSurface;
		Standard_Boolean IsCurveOnSurface ();
		%feature("autodoc", "Args:
	None
Returns:
	GeomAdaptor_Curve

Returns the Curve of  the  edge.") Curve;
		const GeomAdaptor_Curve & Curve ();
		%feature("autodoc", "Args:
	None
Returns:
	Adaptor3d_CurveOnSurface

Returns the CurveOnSurface of the edge.") CurveOnSurface;
		const Adaptor3d_CurveOnSurface & CurveOnSurface ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Edge

Returns the edge.") Edge;
		const TopoDS_Edge & Edge ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the edge tolerance.") Tolerance;
		Standard_Real Tolerance ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") FirstParameter;
		Standard_Real FirstParameter ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") LastParameter;
		Standard_Real LastParameter ();
		%feature("autodoc", "Args:
	None
Returns:
	GeomAbs_Shape

No detailed docstring for this function.") Continuity;
		GeomAbs_Shape Continuity ();
		%feature("autodoc", "Args:
	S(GeomAbs_Shape)

Returns:
	Standard_Integer

Returns  the number  of  intervals for  continuity  
         <S>. May be one if Continuity(me) >= <S>") NbIntervals;
		Standard_Integer NbIntervals (const GeomAbs_Shape S);
		%feature("autodoc", "Args:
	T(TColStd_Array1OfReal)
	S(GeomAbs_Shape)

Returns:
	None

Stores in <T> the  parameters bounding the intervals  
         of continuity <S>.  
 
         The array must provide  enough room to  accomodate  
         for the parameters. i.e. T.Length() > NbIntervals()") Intervals;
		void Intervals (TColStd_Array1OfReal & T,const GeomAbs_Shape S);
		%feature("autodoc", "Args:
	First(Standard_Real)
	Last(Standard_Real)
	Tol(Standard_Real)

Returns:
	Handle_Adaptor3d_HCurve

Returns    a  curve equivalent   of  <self>  between  
         parameters <First>  and <Last>. <Tol>  is used  to  
         test for 3d points confusion.  If <First> >= <Last>") Trim;
		Handle_Adaptor3d_HCurve Trim (const Standard_Real First,const Standard_Real Last,const Standard_Real Tol);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsClosed;
		Standard_Boolean IsClosed ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsPeriodic;
		Standard_Boolean IsPeriodic ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") Period;
		Standard_Real Period ();
		%feature("autodoc", "Args:
	U(Standard_Real)

Returns:
	gp_Pnt

Computes the point of parameter U on the curve") Value;
		gp_Pnt Value (const Standard_Real U);
		%feature("autodoc", "Args:
	U(Standard_Real)
	P(gp_Pnt)

Returns:
	None

Computes the point of parameter U.") D0;
		void D0 (const Standard_Real U,gp_Pnt & P);
		%feature("autodoc", "Args:
	U(Standard_Real)
	P(gp_Pnt)
	V(gp_Vec)

Returns:
	None

Computes the point of parameter U on the curve  
 with its first derivative.  Raised if the continuity of the current interval  
 is not C1.") D1;
		void D1 (const Standard_Real U,gp_Pnt & P,gp_Vec & V);
		%feature("autodoc", "Args:
	U(Standard_Real)
	P(gp_Pnt)
	V1(gp_Vec)
	V2(gp_Vec)

Returns:
	None

Returns the point P of parameter U, the first and second  
 derivatives V1 and V2.  Raised if the continuity of the current interval  
 is not C2.") D2;
		void D2 (const Standard_Real U,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2);
		%feature("autodoc", "Args:
	U(Standard_Real)
	P(gp_Pnt)
	V1(gp_Vec)
	V2(gp_Vec)
	V3(gp_Vec)

Returns:
	None

Returns the point P of parameter U, the first, the second  
 and the third derivative.  Raised if the continuity of the current interval  
 is not C3.") D3;
		void D3 (const Standard_Real U,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2,gp_Vec & V3);
		%feature("autodoc", "Args:
	U(Standard_Real)
	N(Standard_Integer)

Returns:
	gp_Vec

The returned vector gives the value of the derivative for the  
 order of derivation N.  Raised if the continuity of the current interval  
 is not CN.  Raised if N < 1.") DN;
		gp_Vec DN (const Standard_Real U,const Standard_Integer N);
		%feature("autodoc", "Args:
	R3d(Standard_Real)

Returns:
	Standard_Real

returns the parametric resolution") Resolution;
		Standard_Real Resolution (const Standard_Real R3d);
		%feature("autodoc", "Args:
	None
Returns:
	GeomAbs_CurveType

No detailed docstring for this function.") GetType;
		GeomAbs_CurveType GetType ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Lin

No detailed docstring for this function.") Line;
		gp_Lin Line ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Circ

No detailed docstring for this function.") Circle;
		gp_Circ Circle ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Elips

No detailed docstring for this function.") Ellipse;
		gp_Elips Ellipse ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Hypr

No detailed docstring for this function.") Hyperbola;
		gp_Hypr Hyperbola ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Parab

No detailed docstring for this function.") Parabola;
		gp_Parab Parabola ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Degree;
		Standard_Integer Degree ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsRational;
		Standard_Boolean IsRational ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbPoles;
		Standard_Integer NbPoles ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbKnots;
		Standard_Integer NbKnots ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_BezierCurve

Warning :  
        This  will    make a copy of the Bezier Curve  
        since it applies to it myTsrf . Be carefull when  
        using this method") Bezier;
		Handle_Geom_BezierCurve Bezier ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_BSplineCurve

Warning :  
        This will   make a copy of the BSpline Curve  
        since it applies to it myTsrf . Be carefull when  
        using this method") BSpline;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates an uninitialized curve2d.") BRepAdaptor_Curve2d;
		 BRepAdaptor_Curve2d ();
		%feature("autodoc", "Args:
	E(TopoDS_Edge)
	F(TopoDS_Face)

Returns:
	None

Creates with the pcurve of <E> on <F>.") BRepAdaptor_Curve2d;
		 BRepAdaptor_Curve2d (const TopoDS_Edge & E,const TopoDS_Face & F);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)
	F(TopoDS_Face)

Returns:
	None

Initialize with the pcurve of <E> on <F>.") Initialize;
		void Initialize (const TopoDS_Edge & E,const TopoDS_Face & F);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Edge

Returns the Edge.") Edge;
		const TopoDS_Edge & Edge ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Face

Returns the Face.") Face;
		const TopoDS_Face & Face ();
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
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") BRepAdaptor_HArray1OfCurve;
		 BRepAdaptor_HArray1OfCurve (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)
	V(BRepAdaptor_Curve)

Returns:
	None

No detailed docstring for this function.") BRepAdaptor_HArray1OfCurve;
		 BRepAdaptor_HArray1OfCurve (const Standard_Integer Low,const Standard_Integer Up,const BRepAdaptor_Curve & V);
		%feature("autodoc", "Args:
	V(BRepAdaptor_Curve)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const BRepAdaptor_Curve & V);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Length;
		Standard_Integer Length ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Lower;
		Standard_Integer Lower ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Upper;
		Standard_Integer Upper ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Value(BRepAdaptor_Curve)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const BRepAdaptor_Curve & Value);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	BRepAdaptor_Curve

No detailed docstring for this function.") Value;
		const BRepAdaptor_Curve & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	BRepAdaptor_Curve

No detailed docstring for this function.") ChangeValue;
		BRepAdaptor_Curve & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "Args:
	None
Returns:
	BRepAdaptor_Array1OfCurve

No detailed docstring for this function.") Array1;
		const BRepAdaptor_Array1OfCurve & Array1 ();
		%feature("autodoc", "Args:
	None
Returns:
	BRepAdaptor_Array1OfCurve

No detailed docstring for this function.") ChangeArray1;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") BRepAdaptor_HCompCurve;
		 BRepAdaptor_HCompCurve ();
		%feature("autodoc", "Args:
	C(BRepAdaptor_CompCurve)

Returns:
	None

No detailed docstring for this function.") BRepAdaptor_HCompCurve;
		 BRepAdaptor_HCompCurve (const BRepAdaptor_CompCurve & C);
		%feature("autodoc", "Args:
	C(BRepAdaptor_CompCurve)

Returns:
	None

No detailed docstring for this function.") Set;
		void Set (const BRepAdaptor_CompCurve & C);
		%feature("autodoc", "Args:
	None
Returns:
	Adaptor3d_Curve

No detailed docstring for this function.") Curve;
		const Adaptor3d_Curve & Curve ();
		%feature("autodoc", "Args:
	None
Returns:
	Adaptor3d_Curve

No detailed docstring for this function.") GetCurve;
		Adaptor3d_Curve & GetCurve ();
		%feature("autodoc", "Args:
	None
Returns:
	BRepAdaptor_CompCurve

No detailed docstring for this function.") ChangeCurve;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") BRepAdaptor_HCurve;
		 BRepAdaptor_HCurve ();
		%feature("autodoc", "Args:
	C(BRepAdaptor_Curve)

Returns:
	None

No detailed docstring for this function.") BRepAdaptor_HCurve;
		 BRepAdaptor_HCurve (const BRepAdaptor_Curve & C);
		%feature("autodoc", "Args:
	C(BRepAdaptor_Curve)

Returns:
	None

No detailed docstring for this function.") Set;
		void Set (const BRepAdaptor_Curve & C);
		%feature("autodoc", "Args:
	None
Returns:
	Adaptor3d_Curve

No detailed docstring for this function.") Curve;
		const Adaptor3d_Curve & Curve ();
		%feature("autodoc", "Args:
	None
Returns:
	Adaptor3d_Curve

No detailed docstring for this function.") GetCurve;
		Adaptor3d_Curve & GetCurve ();
		%feature("autodoc", "Args:
	None
Returns:
	BRepAdaptor_Curve

No detailed docstring for this function.") ChangeCurve;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") BRepAdaptor_HCurve2d;
		 BRepAdaptor_HCurve2d ();
		%feature("autodoc", "Args:
	C(BRepAdaptor_Curve2d)

Returns:
	None

No detailed docstring for this function.") BRepAdaptor_HCurve2d;
		 BRepAdaptor_HCurve2d (const BRepAdaptor_Curve2d & C);
		%feature("autodoc", "Args:
	C(BRepAdaptor_Curve2d)

Returns:
	None

No detailed docstring for this function.") Set;
		void Set (const BRepAdaptor_Curve2d & C);
		%feature("autodoc", "Args:
	None
Returns:
	Adaptor2d_Curve2d

No detailed docstring for this function.") Curve2d;
		const Adaptor2d_Curve2d & Curve2d ();
		%feature("autodoc", "Args:
	None
Returns:
	BRepAdaptor_Curve2d

No detailed docstring for this function.") ChangeCurve2d;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") BRepAdaptor_HSurface;
		 BRepAdaptor_HSurface ();
		%feature("autodoc", "Args:
	S(BRepAdaptor_Surface)

Returns:
	None

No detailed docstring for this function.") BRepAdaptor_HSurface;
		 BRepAdaptor_HSurface (const BRepAdaptor_Surface & S);
		%feature("autodoc", "Args:
	S(BRepAdaptor_Surface)

Returns:
	None

No detailed docstring for this function.") Set;
		void Set (const BRepAdaptor_Surface & S);
		%feature("autodoc", "Args:
	None
Returns:
	Adaptor3d_Surface

No detailed docstring for this function.") Surface;
		const Adaptor3d_Surface & Surface ();
		%feature("autodoc", "Args:
	None
Returns:
	BRepAdaptor_Surface

No detailed docstring for this function.") ChangeSurface;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates an undefined surface with no face loaded.") BRepAdaptor_Surface;
		 BRepAdaptor_Surface ();
		%feature("autodoc", "Args:
	F(TopoDS_Face)
	R(Standard_Boolean)=Standard_True

Returns:
	None

Creates a surface to  access the geometry  of <F>.  
         If  <Restriction> is  true  the parameter range is  
         the  parameter  range  in   the  UV space  of  the  
         restriction.") BRepAdaptor_Surface;
		 BRepAdaptor_Surface (const TopoDS_Face & F,const Standard_Boolean R = Standard_True);
		%feature("autodoc", "Args:
	F(TopoDS_Face)
	Restriction(Standard_Boolean)=Standard_True

Returns:
	None

Sets the surface to the geometry of <F>.") Initialize;
		void Initialize (const TopoDS_Face & F,const Standard_Boolean Restriction = Standard_True);
		%feature("autodoc", "Args:
	None
Returns:
	GeomAdaptor_Surface

Returns the surface.") Surface;
		const GeomAdaptor_Surface & Surface ();
		%feature("autodoc", "Args:
	None
Returns:
	GeomAdaptor_Surface

Returns the surface.") ChangeSurface;
		GeomAdaptor_Surface & ChangeSurface ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Trsf

Returns the surface coordinate system.") Trsf;
		const gp_Trsf & Trsf ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Face

Returns the face.") Face;
		const TopoDS_Face & Face ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the face tolerance.") Tolerance;
		Standard_Real Tolerance ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") FirstUParameter;
		Standard_Real FirstUParameter ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") LastUParameter;
		Standard_Real LastUParameter ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") FirstVParameter;
		Standard_Real FirstVParameter ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") LastVParameter;
		Standard_Real LastVParameter ();
		%feature("autodoc", "Args:
	None
Returns:
	GeomAbs_Shape

No detailed docstring for this function.") UContinuity;
		GeomAbs_Shape UContinuity ();
		%feature("autodoc", "Args:
	None
Returns:
	GeomAbs_Shape

No detailed docstring for this function.") VContinuity;
		GeomAbs_Shape VContinuity ();
		%feature("autodoc", "Args:
	S(GeomAbs_Shape)

Returns:
	Standard_Integer

If necessary, breaks the surface in U intervals of  
         continuity    <S>.  And   returns  the  number  of  
         intervals.") NbUIntervals;
		Standard_Integer NbUIntervals (const GeomAbs_Shape S);
		%feature("autodoc", "Args:
	S(GeomAbs_Shape)

Returns:
	Standard_Integer

If necessary, breaks the surface in V intervals of  
         continuity    <S>.  And   returns  the  number  of  
         intervals.") NbVIntervals;
		Standard_Integer NbVIntervals (const GeomAbs_Shape S);
		%feature("autodoc", "Args:
	T(TColStd_Array1OfReal)
	S(GeomAbs_Shape)

Returns:
	None

Returns the  intervals with the requested continuity  
         in the U direction.") UIntervals;
		void UIntervals (TColStd_Array1OfReal & T,const GeomAbs_Shape S);
		%feature("autodoc", "Args:
	T(TColStd_Array1OfReal)
	S(GeomAbs_Shape)

Returns:
	None

Returns the  intervals with the requested continuity  
         in the V direction.") VIntervals;
		void VIntervals (TColStd_Array1OfReal & T,const GeomAbs_Shape S);
		%feature("autodoc", "Args:
	First(Standard_Real)
	Last(Standard_Real)
	Tol(Standard_Real)

Returns:
	Handle_Adaptor3d_HSurface

Returns    a  surface trimmed in the U direction  
          equivalent   of  <self>  between  
         parameters <First>  and <Last>. <Tol>  is used  to  
         test for 3d points confusion.  If <First> >= <Last>") UTrim;
		Handle_Adaptor3d_HSurface UTrim (const Standard_Real First,const Standard_Real Last,const Standard_Real Tol);
		%feature("autodoc", "Args:
	First(Standard_Real)
	Last(Standard_Real)
	Tol(Standard_Real)

Returns:
	Handle_Adaptor3d_HSurface

Returns    a  surface trimmed in the V direction  between  
         parameters <First>  and <Last>. <Tol>  is used  to  
         test for 3d points confusion.  If <First> >= <Last>") VTrim;
		Handle_Adaptor3d_HSurface VTrim (const Standard_Real First,const Standard_Real Last,const Standard_Real Tol);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsUClosed;
		Standard_Boolean IsUClosed ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsVClosed;
		Standard_Boolean IsVClosed ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsUPeriodic;
		Standard_Boolean IsUPeriodic ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") UPeriod;
		Standard_Real UPeriod ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsVPeriodic;
		Standard_Boolean IsVPeriodic ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") VPeriod;
		Standard_Real VPeriod ();
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)

Returns:
	gp_Pnt

Computes the point of parameters U,V on the surface.") Value;
		gp_Pnt Value (const Standard_Real U,const Standard_Real V);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	P(gp_Pnt)

Returns:
	None

Computes the point of parameters U,V on the surface.") D0;
		void D0 (const Standard_Real U,const Standard_Real V,gp_Pnt & P);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	P(gp_Pnt)
	D1U(gp_Vec)
	D1V(gp_Vec)

Returns:
	None

Computes the point  and the first derivatives on  
 the surface.  Raised   if  the continuity  of   the  current  
 intervals is not C1.") D1;
		void D1 (const Standard_Real U,const Standard_Real V,gp_Pnt & P,gp_Vec & D1U,gp_Vec & D1V);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	P(gp_Pnt)
	D1U(gp_Vec)
	D1V(gp_Vec)
	D2U(gp_Vec)
	D2V(gp_Vec)
	D2UV(gp_Vec)

Returns:
	None

Computes   the point,  the  first  and  second  
 derivatives on the surface.  Raised  if   the   continuity   of the current  
 intervals is not C2.") D2;
		void D2 (const Standard_Real U,const Standard_Real V,gp_Pnt & P,gp_Vec & D1U,gp_Vec & D1V,gp_Vec & D2U,gp_Vec & D2V,gp_Vec & D2UV);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	P(gp_Pnt)
	D1U(gp_Vec)
	D1V(gp_Vec)
	D2U(gp_Vec)
	D2V(gp_Vec)
	D2UV(gp_Vec)
	D3U(gp_Vec)
	D3V(gp_Vec)
	D3UUV(gp_Vec)
	D3UVV(gp_Vec)

Returns:
	None

Computes the point,  the first, second and third  
 derivatives on the surface.  Raised  if   the   continuity   of the current  
 intervals is not C3.") D3;
		void D3 (const Standard_Real U,const Standard_Real V,gp_Pnt & P,gp_Vec & D1U,gp_Vec & D1V,gp_Vec & D2U,gp_Vec & D2V,gp_Vec & D2UV,gp_Vec & D3U,gp_Vec & D3V,gp_Vec & D3UUV,gp_Vec & D3UVV);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	Nu(Standard_Integer)
	Nv(Standard_Integer)

Returns:
	gp_Vec

Computes the derivative of order Nu in the direction  
 U and Nv in the direction V at the point P(U, V).  Raised if the current U  interval is not not CNu  
 and the current V interval is not CNv.  Raised if Nu + Nv < 1 or Nu < 0 or Nv < 0.") DN;
		gp_Vec DN (const Standard_Real U,const Standard_Real V,const Standard_Integer Nu,const Standard_Integer Nv);
		%feature("autodoc", "Args:
	R3d(Standard_Real)

Returns:
	Standard_Real

Returns the parametric U  resolution corresponding  
        to the real space resolution <R3d>.") UResolution;
		Standard_Real UResolution (const Standard_Real R3d);
		%feature("autodoc", "Args:
	R3d(Standard_Real)

Returns:
	Standard_Real

Returns the parametric V  resolution corresponding  
        to the real space resolution <R3d>.") VResolution;
		Standard_Real VResolution (const Standard_Real R3d);
		%feature("autodoc", "Args:
	None
Returns:
	GeomAbs_SurfaceType

Returns the type of the surface : Plane, Cylinder,  
         Cone,      Sphere,        Torus,    BezierSurface,  
         BSplineSurface,               SurfaceOfRevolution,  
         SurfaceOfExtrusion, OtherSurface") GetType;
		GeomAbs_SurfaceType GetType ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pln

No detailed docstring for this function.") Plane;
		gp_Pln Plane ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Cylinder

No detailed docstring for this function.") Cylinder;
		gp_Cylinder Cylinder ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Cone

No detailed docstring for this function.") Cone;
		gp_Cone Cone ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Sphere

No detailed docstring for this function.") Sphere;
		gp_Sphere Sphere ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Torus

No detailed docstring for this function.") Torus;
		gp_Torus Torus ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") UDegree;
		Standard_Integer UDegree ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbUPoles;
		Standard_Integer NbUPoles ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") VDegree;
		Standard_Integer VDegree ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbVPoles;
		Standard_Integer NbVPoles ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbUKnots;
		Standard_Integer NbUKnots ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbVKnots;
		Standard_Integer NbVKnots ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsURational;
		Standard_Boolean IsURational ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsVRational;
		Standard_Boolean IsVRational ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_BezierSurface

No detailed docstring for this function.") Bezier;
		Handle_Geom_BezierSurface Bezier ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_BSplineSurface

Warning : this will make a copy of the  
          BSpline Surface since it applies  
          to it the myTsrf transformation  
          Be Carefull when using this method") BSpline;
		Handle_Geom_BSplineSurface BSpline ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Ax1

No detailed docstring for this function.") AxeOfRevolution;
		gp_Ax1 AxeOfRevolution ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Dir

No detailed docstring for this function.") Direction;
		gp_Dir Direction ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Adaptor3d_HCurve

only for SurfaceOfExtrusion and SurfaceOfRevolution  
 Warning: this will make a copy of the underlying curve  
         since it applies to it the transformation  
         myTrsf. Be carefull when using this method.") BasisCurve;
		Handle_Adaptor3d_HCurve BasisCurve ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Adaptor3d_HSurface

No detailed docstring for this function.") BasisSurface;
		Handle_Adaptor3d_HSurface BasisSurface ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") OffsetValue;
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
