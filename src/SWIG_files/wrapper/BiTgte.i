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
%module BiTgte

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

%include BiTgte_required_python_modules.i
%include BiTgte_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
enum BiTgte_ContactType {
	BiTgte_FaceFace = 0,
	BiTgte_FaceEdge = 1,
	BiTgte_FaceVertex = 2,
	BiTgte_EdgeEdge = 3,
	BiTgte_EdgeVertex = 4,
	BiTgte_VertexVertex = 5,
};

/* end public enums declaration */

%nodefaultctor BiTgte_Blend;
class BiTgte_Blend {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") BiTgte_Blend;
		 BiTgte_Blend ();
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	Radius(Standard_Real)
	Tol(Standard_Real)
	NUBS(Standard_Boolean)

Returns:
	None

<S>: Shape to be rounded  
         <Radius>: radius of the fillet  
         <Tol>: Tol3d used in approximations  
         <NUBS>: if true,  generate only NUBS surfaces,  
                 if false, generate analytical surfaces if possible") BiTgte_Blend;
		 BiTgte_Blend (const TopoDS_Shape & S,const Standard_Real Radius,const Standard_Real Tol,const Standard_Boolean NUBS);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	Radius(Standard_Real)
	Tol(Standard_Real)
	NUBS(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const TopoDS_Shape & S,const Standard_Real Radius,const Standard_Real Tol,const Standard_Boolean NUBS);
		%feature("autodoc", "Args:
	None
Returns:
	None

Clear all the Fields.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	F1(TopoDS_Face)
	F2(TopoDS_Face)

Returns:
	None

Set two faces   of <myShape> on which the  Sphere  
                   must roll.") SetFaces;
		void SetFaces (const TopoDS_Face & F1,const TopoDS_Face & F2);
		%feature("autodoc", "Args:
	Edge(TopoDS_Edge)

Returns:
	None

Set an edge of <myShape> to be rounded.") SetEdge;
		void SetEdge (const TopoDS_Edge & Edge);
		%feature("autodoc", "Args:
	Face(TopoDS_Face)

Returns:
	None

Set a face on which the fillet must stop.") SetStoppingFace;
		void SetStoppingFace (const TopoDS_Face & Face);
		%feature("autodoc", "Args:
	BuildShape(Standard_Boolean)=Standard_True

Returns:
	None

Compute the generated surfaces.  
         If <BuildShape> is true, compute the resulting Shape.  
         If false, only the blending surfaces are computed.") Perform;
		void Perform (const Standard_Boolean BuildShape = Standard_True);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

returns the result") Shape;
		const TopoDS_Shape & Shape ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

returns the Number of generated surfaces.") NbSurfaces;
		Standard_Integer NbSurfaces ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Geom_Surface

returns the surface of range Index") Surface;
		Handle_Geom_Surface Surface (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	TopoDS_Face

returns the surface of range Index") Face;
		const TopoDS_Face & Face (const Standard_Integer Index);
		%feature("autodoc", "Args:
	LC(TopTools_ListOfShape)

Returns:
	None

set in <LC> all the center lines") CenterLines;
		void CenterLines (TopTools_ListOfShape & LC);
		%feature("autodoc", "Args:
	CenterLine(TopoDS_Shape)

Returns:
	Handle_Geom_Surface

returns  the surface generated  by the centerline.  
         <CenterLine> may be  
            - an edge  : generate a pipe.  
            - a vertex : generate a sphere.  
 Warning: returns a Null Handle if <CenterLine> generates  
         no surface.") Surface;
		Handle_Geom_Surface Surface (const TopoDS_Shape & CenterLine);
		%feature("autodoc", "Args:
	CenterLine(TopoDS_Shape)

Returns:
	TopoDS_Face

returns  the face generated  by the centerline.  
         <CenterLine> may be  
            - an edge  : generate a pipe.  
            - a vertex : generate a sphere.  
 Warning: returns a Null Shape if <CenterLine> generates  
         no surface.") Face;
		const TopoDS_Face & Face (const TopoDS_Shape & CenterLine);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	BiTgte_ContactType

returns the type of contact") ContactType;
		BiTgte_ContactType ContactType (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	TopoDS_Shape

gives the first support shape relative to  
         SurfaceFillet(Index);") SupportShape1;
		const TopoDS_Shape & SupportShape1 (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	TopoDS_Shape

gives the second support shape relative to  
         SurfaceFillet(Index);") SupportShape2;
		const TopoDS_Shape & SupportShape2 (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Geom_Curve

gives the 3d curve of SurfaceFillet(Index)  
         on SupportShape1(Index)") CurveOnShape1;
		Handle_Geom_Curve CurveOnShape1 (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Geom_Curve

gives the 3d curve of SurfaceFillet(Index)  
         on SupportShape2(Index)") CurveOnShape2;
		Handle_Geom_Curve CurveOnShape2 (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Geom2d_Curve

gives the PCurve associated to CurvOnShape1(Index)  
         on the support face  
 Warning: returns a Null Handle if SupportShape1 is not a Face") PCurveOnFace1;
		Handle_Geom2d_Curve PCurveOnFace1 (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Geom2d_Curve

gives the PCurve associated to CurveOnShape1(Index)  
         on the Fillet") PCurve1OnFillet;
		Handle_Geom2d_Curve PCurve1OnFillet (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Geom2d_Curve

gives the PCurve  associated to CurveOnShape2(Index)  
         on the  support face  
 Warning: returns a Null Handle if SupportShape2 is not a Face") PCurveOnFace2;
		Handle_Geom2d_Curve PCurveOnFace2 (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_Geom2d_Curve

gives the PCurve associated to CurveOnShape2(Index)  
         on the fillet") PCurve2OnFillet;
		Handle_Geom2d_Curve PCurve2OnFillet (const Standard_Integer Index);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbBranches;
		Standard_Integer NbBranches ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	From(Standard_Integer)
	To(Standard_Integer)

Returns:
	None

Set in <From>,<To>   the indices of the faces  of  
 the branche <Index>.  
 
 i.e: Branche<Index> = Face(From) + Face(From+1) + ..+ Face(To)") IndicesOfBranche;
		void IndicesOfBranche (const Standard_Integer Index,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	None

Computes the center lines") ComputeCenters;
		void ComputeCenters ();
};


%feature("shadow") BiTgte_Blend::~BiTgte_Blend %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BiTgte_Blend {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BiTgte_CurveOnEdge;
class BiTgte_CurveOnEdge : public Adaptor3d_Curve {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") BiTgte_CurveOnEdge;
		 BiTgte_CurveOnEdge ();
		%feature("autodoc", "Args:
	EonF(TopoDS_Edge)
	Edge(TopoDS_Edge)

Returns:
	None

No detailed docstring for this function.") BiTgte_CurveOnEdge;
		 BiTgte_CurveOnEdge (const TopoDS_Edge & EonF,const TopoDS_Edge & Edge);
		%feature("autodoc", "Args:
	EonF(TopoDS_Edge)
	Edge(TopoDS_Edge)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const TopoDS_Edge & EonF,const TopoDS_Edge & Edge);
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

Computes the point of parameter U on the curve.") Value;
		gp_Pnt Value (const Standard_Real U);
		%feature("autodoc", "Args:
	U(Standard_Real)
	P(gp_Pnt)

Returns:
	None

Computes the point of parameter U on the curve.") D0;
		void D0 (const Standard_Real U,gp_Pnt & P);
		%feature("autodoc", "Args:
	U(Standard_Real)
	P(gp_Pnt)
	V(gp_Vec)

Returns:
	None

Computes the point of parameter U on the curve with its  
 first derivative.  Raised if the continuity of the current interval  
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

Returns the parametric  resolution corresponding  
        to the real space resolution <R3d>.") Resolution;
		Standard_Real Resolution (const Standard_Real R3d);
		%feature("autodoc", "Args:
	None
Returns:
	GeomAbs_CurveType

Returns  the  type of the   curve  in the  current  
         interval :   Line,   Circle,   Ellipse, Hyperbola,  
         Parabola, BezierCurve, BSplineCurve, OtherCurve.") GetType;
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


%feature("shadow") BiTgte_CurveOnEdge::~BiTgte_CurveOnEdge %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BiTgte_CurveOnEdge {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BiTgte_CurveOnVertex;
class BiTgte_CurveOnVertex : public Adaptor3d_Curve {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") BiTgte_CurveOnVertex;
		 BiTgte_CurveOnVertex ();
		%feature("autodoc", "Args:
	EonF(TopoDS_Edge)
	V(TopoDS_Vertex)

Returns:
	None

No detailed docstring for this function.") BiTgte_CurveOnVertex;
		 BiTgte_CurveOnVertex (const TopoDS_Edge & EonF,const TopoDS_Vertex & V);
		%feature("autodoc", "Args:
	EonF(TopoDS_Edge)
	V(TopoDS_Vertex)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const TopoDS_Edge & EonF,const TopoDS_Vertex & V);
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

Computes the point of parameter U on the curve.") Value;
		gp_Pnt Value (const Standard_Real U);
		%feature("autodoc", "Args:
	U(Standard_Real)
	P(gp_Pnt)

Returns:
	None

Computes the point of parameter U on the curve.") D0;
		void D0 (const Standard_Real U,gp_Pnt & P);
		%feature("autodoc", "Args:
	U(Standard_Real)
	P(gp_Pnt)
	V(gp_Vec)

Returns:
	None

Computes the point of parameter U on the curve with its  
 first derivative.  Raised if the continuity of the current interval  
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

Returns the parametric  resolution corresponding  
        to the real space resolution <R3d>.") Resolution;
		Standard_Real Resolution (const Standard_Real R3d);
		%feature("autodoc", "Args:
	None
Returns:
	GeomAbs_CurveType

Returns  the  type of the   curve  in the  current  
         interval :   Line,   Circle,   Ellipse, Hyperbola,  
         Parabola, BezierCurve, BSplineCurve, OtherCurve.") GetType;
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


%feature("shadow") BiTgte_CurveOnVertex::~BiTgte_CurveOnVertex %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BiTgte_CurveOnVertex {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BiTgte_DataMapIteratorOfDataMapOfShapeBox;
class BiTgte_DataMapIteratorOfDataMapOfShapeBox : public TCollection_BasicMapIterator {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") BiTgte_DataMapIteratorOfDataMapOfShapeBox;
		 BiTgte_DataMapIteratorOfDataMapOfShapeBox ();
		%feature("autodoc", "Args:
	aMap(BiTgte_DataMapOfShapeBox)

Returns:
	None

No detailed docstring for this function.") BiTgte_DataMapIteratorOfDataMapOfShapeBox;
		 BiTgte_DataMapIteratorOfDataMapOfShapeBox (const BiTgte_DataMapOfShapeBox & aMap);
		%feature("autodoc", "Args:
	aMap(BiTgte_DataMapOfShapeBox)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const BiTgte_DataMapOfShapeBox & aMap);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Key;
		const TopoDS_Shape & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	Bnd_Box

No detailed docstring for this function.") Value;
		const Bnd_Box & Value ();
};


%feature("shadow") BiTgte_DataMapIteratorOfDataMapOfShapeBox::~BiTgte_DataMapIteratorOfDataMapOfShapeBox %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BiTgte_DataMapIteratorOfDataMapOfShapeBox {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BiTgte_DataMapNodeOfDataMapOfShapeBox;
class BiTgte_DataMapNodeOfDataMapOfShapeBox : public TCollection_MapNode {
	public:
		%feature("autodoc", "Args:
	K(TopoDS_Shape)
	I(Bnd_Box)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") BiTgte_DataMapNodeOfDataMapOfShapeBox;
		 BiTgte_DataMapNodeOfDataMapOfShapeBox (const TopoDS_Shape & K,const Bnd_Box & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Key;
		TopoDS_Shape & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	Bnd_Box

No detailed docstring for this function.") Value;
		Bnd_Box & Value ();
};


%feature("shadow") BiTgte_DataMapNodeOfDataMapOfShapeBox::~BiTgte_DataMapNodeOfDataMapOfShapeBox %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BiTgte_DataMapNodeOfDataMapOfShapeBox {
	void _kill_pointed() {
		delete $self;
	}
};
%extend BiTgte_DataMapNodeOfDataMapOfShapeBox {
	Handle_BiTgte_DataMapNodeOfDataMapOfShapeBox GetHandle() {
	return *(Handle_BiTgte_DataMapNodeOfDataMapOfShapeBox*) &$self;
	}
};

%nodefaultctor Handle_BiTgte_DataMapNodeOfDataMapOfShapeBox;
class Handle_BiTgte_DataMapNodeOfDataMapOfShapeBox : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_BiTgte_DataMapNodeOfDataMapOfShapeBox();
        Handle_BiTgte_DataMapNodeOfDataMapOfShapeBox(const Handle_BiTgte_DataMapNodeOfDataMapOfShapeBox &aHandle);
        Handle_BiTgte_DataMapNodeOfDataMapOfShapeBox(const BiTgte_DataMapNodeOfDataMapOfShapeBox *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BiTgte_DataMapNodeOfDataMapOfShapeBox DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BiTgte_DataMapNodeOfDataMapOfShapeBox {
    BiTgte_DataMapNodeOfDataMapOfShapeBox* GetObject() {
    return (BiTgte_DataMapNodeOfDataMapOfShapeBox*)$self->Access();
    }
};
%feature("shadow") Handle_BiTgte_DataMapNodeOfDataMapOfShapeBox::~Handle_BiTgte_DataMapNodeOfDataMapOfShapeBox %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_BiTgte_DataMapNodeOfDataMapOfShapeBox {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor BiTgte_DataMapOfShapeBox;
class BiTgte_DataMapOfShapeBox : public TCollection_BasicMap {
	public:
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)=1

Returns:
	None

No detailed docstring for this function.") BiTgte_DataMapOfShapeBox;
		 BiTgte_DataMapOfShapeBox (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "Args:
	Other(BiTgte_DataMapOfShapeBox)

Returns:
	BiTgte_DataMapOfShapeBox

No detailed docstring for this function.") Assign;
		BiTgte_DataMapOfShapeBox & Assign (const BiTgte_DataMapOfShapeBox & Other);
		%feature("autodoc", "Args:
	Other(BiTgte_DataMapOfShapeBox)

Returns:
	BiTgte_DataMapOfShapeBox

No detailed docstring for this function.") operator=;
		BiTgte_DataMapOfShapeBox & operator = (const BiTgte_DataMapOfShapeBox & Other);
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	K(TopoDS_Shape)
	I(Bnd_Box)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Bind;
		Standard_Boolean Bind (const TopoDS_Shape & K,const Bnd_Box & I);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsBound;
		Standard_Boolean IsBound (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Boolean

No detailed docstring for this function.") UnBind;
		Standard_Boolean UnBind (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Bnd_Box

No detailed docstring for this function.") Find;
		const Bnd_Box & Find (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Bnd_Box

No detailed docstring for this function.") ChangeFind;
		Bnd_Box & ChangeFind (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Address

No detailed docstring for this function.") Find1;
		Standard_Address Find1 (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Address

No detailed docstring for this function.") ChangeFind1;
		Standard_Address ChangeFind1 (const TopoDS_Shape & K);
};


%feature("shadow") BiTgte_DataMapOfShapeBox::~BiTgte_DataMapOfShapeBox %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BiTgte_DataMapOfShapeBox {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BiTgte_HCurveOnEdge;
class BiTgte_HCurveOnEdge : public Adaptor3d_HCurve {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") BiTgte_HCurveOnEdge;
		 BiTgte_HCurveOnEdge ();
		%feature("autodoc", "Args:
	C(BiTgte_CurveOnEdge)

Returns:
	None

No detailed docstring for this function.") BiTgte_HCurveOnEdge;
		 BiTgte_HCurveOnEdge (const BiTgte_CurveOnEdge & C);
		%feature("autodoc", "Args:
	C(BiTgte_CurveOnEdge)

Returns:
	None

No detailed docstring for this function.") Set;
		void Set (const BiTgte_CurveOnEdge & C);
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
	BiTgte_CurveOnEdge

No detailed docstring for this function.") ChangeCurve;
		BiTgte_CurveOnEdge & ChangeCurve ();
};


%feature("shadow") BiTgte_HCurveOnEdge::~BiTgte_HCurveOnEdge %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BiTgte_HCurveOnEdge {
	void _kill_pointed() {
		delete $self;
	}
};
%extend BiTgte_HCurveOnEdge {
	Handle_BiTgte_HCurveOnEdge GetHandle() {
	return *(Handle_BiTgte_HCurveOnEdge*) &$self;
	}
};

%nodefaultctor Handle_BiTgte_HCurveOnEdge;
class Handle_BiTgte_HCurveOnEdge : public Handle_Adaptor3d_HCurve {

    public:
        // constructors
        Handle_BiTgte_HCurveOnEdge();
        Handle_BiTgte_HCurveOnEdge(const Handle_BiTgte_HCurveOnEdge &aHandle);
        Handle_BiTgte_HCurveOnEdge(const BiTgte_HCurveOnEdge *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BiTgte_HCurveOnEdge DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BiTgte_HCurveOnEdge {
    BiTgte_HCurveOnEdge* GetObject() {
    return (BiTgte_HCurveOnEdge*)$self->Access();
    }
};
%feature("shadow") Handle_BiTgte_HCurveOnEdge::~Handle_BiTgte_HCurveOnEdge %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_BiTgte_HCurveOnEdge {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor BiTgte_HCurveOnVertex;
class BiTgte_HCurveOnVertex : public Adaptor3d_HCurve {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") BiTgte_HCurveOnVertex;
		 BiTgte_HCurveOnVertex ();
		%feature("autodoc", "Args:
	C(BiTgte_CurveOnVertex)

Returns:
	None

No detailed docstring for this function.") BiTgte_HCurveOnVertex;
		 BiTgte_HCurveOnVertex (const BiTgte_CurveOnVertex & C);
		%feature("autodoc", "Args:
	C(BiTgte_CurveOnVertex)

Returns:
	None

No detailed docstring for this function.") Set;
		void Set (const BiTgte_CurveOnVertex & C);
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
	BiTgte_CurveOnVertex

No detailed docstring for this function.") ChangeCurve;
		BiTgte_CurveOnVertex & ChangeCurve ();
};


%feature("shadow") BiTgte_HCurveOnVertex::~BiTgte_HCurveOnVertex %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BiTgte_HCurveOnVertex {
	void _kill_pointed() {
		delete $self;
	}
};
%extend BiTgte_HCurveOnVertex {
	Handle_BiTgte_HCurveOnVertex GetHandle() {
	return *(Handle_BiTgte_HCurveOnVertex*) &$self;
	}
};

%nodefaultctor Handle_BiTgte_HCurveOnVertex;
class Handle_BiTgte_HCurveOnVertex : public Handle_Adaptor3d_HCurve {

    public:
        // constructors
        Handle_BiTgte_HCurveOnVertex();
        Handle_BiTgte_HCurveOnVertex(const Handle_BiTgte_HCurveOnVertex &aHandle);
        Handle_BiTgte_HCurveOnVertex(const BiTgte_HCurveOnVertex *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BiTgte_HCurveOnVertex DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BiTgte_HCurveOnVertex {
    BiTgte_HCurveOnVertex* GetObject() {
    return (BiTgte_HCurveOnVertex*)$self->Access();
    }
};
%feature("shadow") Handle_BiTgte_HCurveOnVertex::~Handle_BiTgte_HCurveOnVertex %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_BiTgte_HCurveOnVertex {
    void _kill_pointed() {
        delete $self;
    }
};

