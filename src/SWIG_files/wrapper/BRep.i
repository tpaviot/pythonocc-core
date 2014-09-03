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
%module (package="OCC") BRep

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

%include BRep_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%nodefaultctor BRep_Builder;
class BRep_Builder : public TopoDS_Builder {
	public:
		%feature("autodoc", "Args:
	F(TopoDS_Face)

Returns:
	None

Makes an undefined Face.") MakeFace;
		void MakeFace (TopoDS_Face & F);
		%feature("autodoc", "Args:
	F(TopoDS_Face)
	S(Handle_Geom_Surface)
	Tol(Standard_Real)

Returns:
	None

Makes a Face with a surface.") MakeFace;
		void MakeFace (TopoDS_Face & F,const Handle_Geom_Surface & S,const Standard_Real Tol);
		%feature("autodoc", "Args:
	F(TopoDS_Face)
	S(Handle_Geom_Surface)
	L(TopLoc_Location)
	Tol(Standard_Real)

Returns:
	None

Makes a Face with a surface and a location.") MakeFace;
		void MakeFace (TopoDS_Face & F,const Handle_Geom_Surface & S,const TopLoc_Location & L,const Standard_Real Tol);
		%feature("autodoc", "Args:
	F(TopoDS_Face)
	T(Handle_Poly_Triangulation)

Returns:
	None

Makes a Face with a triangulation. The triangulation  
         is in the same reference system than the TFace.") MakeFace;
		void MakeFace (TopoDS_Face & F,const Handle_Poly_Triangulation & T);
		%feature("autodoc", "Args:
	F(TopoDS_Face)
	S(Handle_Geom_Surface)
	L(TopLoc_Location)
	Tol(Standard_Real)

Returns:
	None

Updates the face F using the tolerance value Tol,  
surface S and location Location.") UpdateFace;
		void UpdateFace (const TopoDS_Face & F,const Handle_Geom_Surface & S,const TopLoc_Location & L,const Standard_Real Tol);
		%feature("autodoc", "Args:
	F(TopoDS_Face)
	T(Handle_Poly_Triangulation)

Returns:
	None

Changes a  face triangulation.  
 
         A null Triangulation removes the triangulation.") UpdateFace;
		void UpdateFace (const TopoDS_Face & F,const Handle_Poly_Triangulation & T);
		%feature("autodoc", "Args:
	F(TopoDS_Face)
	Tol(Standard_Real)

Returns:
	None

Updates the face Tolerance.") UpdateFace;
		void UpdateFace (const TopoDS_Face & F,const Standard_Real Tol);
		%feature("autodoc", "Args:
	F(TopoDS_Face)
	N(Standard_Boolean)

Returns:
	None

Sets the  NaturalRestriction flag of  the face.") NaturalRestriction;
		void NaturalRestriction (const TopoDS_Face & F,const Standard_Boolean N);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)

Returns:
	None

Makes an undefined Edge (no geometry).") MakeEdge;
		void MakeEdge (TopoDS_Edge & E);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)
	C(Handle_Geom_Curve)
	Tol(Standard_Real)

Returns:
	None

Makes an Edge with a curve.") MakeEdge;
		void MakeEdge (TopoDS_Edge & E,const Handle_Geom_Curve & C,const Standard_Real Tol);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)
	C(Handle_Geom_Curve)
	L(TopLoc_Location)
	Tol(Standard_Real)

Returns:
	None

Makes an Edge with a curve and a location.") MakeEdge;
		void MakeEdge (TopoDS_Edge & E,const Handle_Geom_Curve & C,const TopLoc_Location & L,const Standard_Real Tol);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)
	P(Handle_Poly_Polygon3D)

Returns:
	None

Makes an Edge with a polygon 3d.") MakeEdge;
		void MakeEdge (TopoDS_Edge & E,const Handle_Poly_Polygon3D & P);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)
	N(Handle_Poly_PolygonOnTriangulation)
	T(Handle_Poly_Triangulation)

Returns:
	None

makes an Edge polygon on Triangulation.") MakeEdge;
		void MakeEdge (TopoDS_Edge & E,const Handle_Poly_PolygonOnTriangulation & N,const Handle_Poly_Triangulation & T);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)
	N(Handle_Poly_PolygonOnTriangulation)
	T(Handle_Poly_Triangulation)
	L(TopLoc_Location)

Returns:
	None

makes an Edge polygon on Triangulation.") MakeEdge;
		void MakeEdge (TopoDS_Edge & E,const Handle_Poly_PolygonOnTriangulation & N,const Handle_Poly_Triangulation & T,const TopLoc_Location & L);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)
	C(Handle_Geom_Curve)
	Tol(Standard_Real)

Returns:
	None

Sets a 3D curve for the edge.  
         If <C> is a null handle, remove any existing 3d curve.") UpdateEdge;
		void UpdateEdge (const TopoDS_Edge & E,const Handle_Geom_Curve & C,const Standard_Real Tol);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)
	C(Handle_Geom_Curve)
	L(TopLoc_Location)
	Tol(Standard_Real)

Returns:
	None

Sets a 3D curve for the edge.  
         If <C> is a null handle, remove any existing 3d curve.") UpdateEdge;
		void UpdateEdge (const TopoDS_Edge & E,const Handle_Geom_Curve & C,const TopLoc_Location & L,const Standard_Real Tol);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)
	C(Handle_Geom2d_Curve)
	F(TopoDS_Face)
	Tol(Standard_Real)

Returns:
	None

Sets a pcurve for the edge on the face.  
         If <C> is a null handle, remove any existing pcurve.") UpdateEdge;
		void UpdateEdge (const TopoDS_Edge & E,const Handle_Geom2d_Curve & C,const TopoDS_Face & F,const Standard_Real Tol);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)
	C1(Handle_Geom2d_Curve)
	C2(Handle_Geom2d_Curve)
	F(TopoDS_Face)
	Tol(Standard_Real)

Returns:
	None

Sets pcurves for the edge on the  closed face.  If  
         <C1> or <C2> is a null handle, remove any existing  
         pcurve.") UpdateEdge;
		void UpdateEdge (const TopoDS_Edge & E,const Handle_Geom2d_Curve & C1,const Handle_Geom2d_Curve & C2,const TopoDS_Face & F,const Standard_Real Tol);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)
	C(Handle_Geom2d_Curve)
	S(Handle_Geom_Surface)
	L(TopLoc_Location)
	Tol(Standard_Real)

Returns:
	None

Sets a pcurve for the edge on the face.  
         If <C> is a null handle, remove any existing pcurve.") UpdateEdge;
		void UpdateEdge (const TopoDS_Edge & E,const Handle_Geom2d_Curve & C,const Handle_Geom_Surface & S,const TopLoc_Location & L,const Standard_Real Tol);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)
	C(Handle_Geom2d_Curve)
	S(Handle_Geom_Surface)
	L(TopLoc_Location)
	Tol(Standard_Real)
	Pf(gp_Pnt2d)
	Pl(gp_Pnt2d)

Returns:
	None

Sets a pcurve for the edge on the face.  
         If <C> is a null handle, remove any existing pcurve.  
         Sets UV bounds for curve repsentation") UpdateEdge;
		void UpdateEdge (const TopoDS_Edge & E,const Handle_Geom2d_Curve & C,const Handle_Geom_Surface & S,const TopLoc_Location & L,const Standard_Real Tol,const gp_Pnt2d & Pf,const gp_Pnt2d & Pl);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)
	C1(Handle_Geom2d_Curve)
	C2(Handle_Geom2d_Curve)
	S(Handle_Geom_Surface)
	L(TopLoc_Location)
	Tol(Standard_Real)

Returns:
	None

Sets pcurves for the edge on the closed surface.  
         <C1> or <C2> is a null handle, remove any existing  
         pcurve.") UpdateEdge;
		void UpdateEdge (const TopoDS_Edge & E,const Handle_Geom2d_Curve & C1,const Handle_Geom2d_Curve & C2,const Handle_Geom_Surface & S,const TopLoc_Location & L,const Standard_Real Tol);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)
	C1(Handle_Geom2d_Curve)
	C2(Handle_Geom2d_Curve)
	S(Handle_Geom_Surface)
	L(TopLoc_Location)
	Tol(Standard_Real)
	Pf(gp_Pnt2d)
	Pl(gp_Pnt2d)

Returns:
	None

Sets pcurves for the edge on the closed surface.  
         <C1> or <C2> is a null handle, remove any existing  
         pcurve.  
         Sets UV bounds for curve repsentation") UpdateEdge;
		void UpdateEdge (const TopoDS_Edge & E,const Handle_Geom2d_Curve & C1,const Handle_Geom2d_Curve & C2,const Handle_Geom_Surface & S,const TopLoc_Location & L,const Standard_Real Tol,const gp_Pnt2d & Pf,const gp_Pnt2d & Pl);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)
	P(Handle_Poly_Polygon3D)

Returns:
	None

Changes an Edge 3D polygon.  
         A null Polygon removes the 3d Polygon.") UpdateEdge;
		void UpdateEdge (const TopoDS_Edge & E,const Handle_Poly_Polygon3D & P);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)
	P(Handle_Poly_Polygon3D)
	L(TopLoc_Location)

Returns:
	None

Changes an Edge 3D polygon.  
         A null Polygon removes the 3d Polygon.") UpdateEdge;
		void UpdateEdge (const TopoDS_Edge & E,const Handle_Poly_Polygon3D & P,const TopLoc_Location & L);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)
	N(Handle_Poly_PolygonOnTriangulation)
	T(Handle_Poly_Triangulation)

Returns:
	None

Changes an Edge polygon on Triangulation.") UpdateEdge;
		void UpdateEdge (const TopoDS_Edge & E,const Handle_Poly_PolygonOnTriangulation & N,const Handle_Poly_Triangulation & T);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)
	N(Handle_Poly_PolygonOnTriangulation)
	T(Handle_Poly_Triangulation)
	L(TopLoc_Location)

Returns:
	None

Changes an Edge polygon on Triangulation.") UpdateEdge;
		void UpdateEdge (const TopoDS_Edge & E,const Handle_Poly_PolygonOnTriangulation & N,const Handle_Poly_Triangulation & T,const TopLoc_Location & L);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)
	N1(Handle_Poly_PolygonOnTriangulation)
	N2(Handle_Poly_PolygonOnTriangulation)
	T(Handle_Poly_Triangulation)

Returns:
	None

Changes an Edge polygon on Triangulation.") UpdateEdge;
		void UpdateEdge (const TopoDS_Edge & E,const Handle_Poly_PolygonOnTriangulation & N1,const Handle_Poly_PolygonOnTriangulation & N2,const Handle_Poly_Triangulation & T);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)
	N1(Handle_Poly_PolygonOnTriangulation)
	N2(Handle_Poly_PolygonOnTriangulation)
	T(Handle_Poly_Triangulation)
	L(TopLoc_Location)

Returns:
	None

Changes an Edge polygon on Triangulation.") UpdateEdge;
		void UpdateEdge (const TopoDS_Edge & E,const Handle_Poly_PolygonOnTriangulation & N1,const Handle_Poly_PolygonOnTriangulation & N2,const Handle_Poly_Triangulation & T,const TopLoc_Location & L);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)
	P(Handle_Poly_Polygon2D)
	S(TopoDS_Face)

Returns:
	None

Changes Edge polygon on a face.") UpdateEdge;
		void UpdateEdge (const TopoDS_Edge & E,const Handle_Poly_Polygon2D & P,const TopoDS_Face & S);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)
	P(Handle_Poly_Polygon2D)
	S(Handle_Geom_Surface)
	T(TopLoc_Location)

Returns:
	None

Changes Edge polygon on a face.") UpdateEdge;
		void UpdateEdge (const TopoDS_Edge & E,const Handle_Poly_Polygon2D & P,const Handle_Geom_Surface & S,const TopLoc_Location & T);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)
	P1(Handle_Poly_Polygon2D)
	P2(Handle_Poly_Polygon2D)
	S(TopoDS_Face)

Returns:
	None

Changes Edge polygons on a face.  
 
         A null Polygon removes the 2d Polygon.") UpdateEdge;
		void UpdateEdge (const TopoDS_Edge & E,const Handle_Poly_Polygon2D & P1,const Handle_Poly_Polygon2D & P2,const TopoDS_Face & S);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)
	P1(Handle_Poly_Polygon2D)
	P2(Handle_Poly_Polygon2D)
	S(Handle_Geom_Surface)
	L(TopLoc_Location)

Returns:
	None

Changes Edge polygons on a face.  
 
         A null Polygon removes the 2d Polygon.") UpdateEdge;
		void UpdateEdge (const TopoDS_Edge & E,const Handle_Poly_Polygon2D & P1,const Handle_Poly_Polygon2D & P2,const Handle_Geom_Surface & S,const TopLoc_Location & L);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)
	Tol(Standard_Real)

Returns:
	None

Updates the edge tolerance.") UpdateEdge;
		void UpdateEdge (const TopoDS_Edge & E,const Standard_Real Tol);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)
	F1(TopoDS_Face)
	F2(TopoDS_Face)
	C(GeomAbs_Shape)

Returns:
	None

Sets the geometric continuity on the edge.") Continuity;
		void Continuity (const TopoDS_Edge & E,const TopoDS_Face & F1,const TopoDS_Face & F2,const GeomAbs_Shape C);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)
	S1(Handle_Geom_Surface)
	S2(Handle_Geom_Surface)
	L1(TopLoc_Location)
	L2(TopLoc_Location)
	C(GeomAbs_Shape)

Returns:
	None

Sets the geometric continuity on the edge.") Continuity;
		void Continuity (const TopoDS_Edge & E,const Handle_Geom_Surface & S1,const Handle_Geom_Surface & S2,const TopLoc_Location & L1,const TopLoc_Location & L2,const GeomAbs_Shape C);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)
	S(Standard_Boolean)

Returns:
	None

Sets the same parameter flag for the edge <E>.") SameParameter;
		void SameParameter (const TopoDS_Edge & E,const Standard_Boolean S);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)
	S(Standard_Boolean)

Returns:
	None

Sets the same range flag for the edge <E>.") SameRange;
		void SameRange (const TopoDS_Edge & E,const Standard_Boolean S);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)
	D(Standard_Boolean)

Returns:
	None

Sets the degenerated flag for the edge <E>.") Degenerated;
		void Degenerated (const TopoDS_Edge & E,const Standard_Boolean D);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)
	First(Standard_Real)
	Last(Standard_Real)
	Only3d(Standard_Boolean)=Standard_False

Returns:
	None

Sets the range of the 3d curve if Only3d=TRUE,  
         otherwise sets the range to all the representations") Range;
		void Range (const TopoDS_Edge & E,const Standard_Real First,const Standard_Real Last,const Standard_Boolean Only3d = Standard_False);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)
	S(Handle_Geom_Surface)
	L(TopLoc_Location)
	First(Standard_Real)
	Last(Standard_Real)

Returns:
	None

Sets the range  of the edge  on the pcurve on  the  
         surface.") Range;
		void Range (const TopoDS_Edge & E,const Handle_Geom_Surface & S,const TopLoc_Location & L,const Standard_Real First,const Standard_Real Last);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)
	F(TopoDS_Face)
	First(Standard_Real)
	Last(Standard_Real)

Returns:
	None

Sets the range of the edge on the pcurve on the face.") Range;
		void Range (const TopoDS_Edge & E,const TopoDS_Face & F,const Standard_Real First,const Standard_Real Last);
		%feature("autodoc", "Args:
	Ein(TopoDS_Edge)
	Eout(TopoDS_Edge)

Returns:
	None

Add  to <Eout>  the  geometric representations  of  
         <Ein>.") Transfert;
		void Transfert (const TopoDS_Edge & Ein,const TopoDS_Edge & Eout);
		%feature("autodoc", "Args:
	V(TopoDS_Vertex)

Returns:
	None

Makes an udefined vertex without geometry.") MakeVertex;
		void MakeVertex (TopoDS_Vertex & V);
		%feature("autodoc", "Args:
	V(TopoDS_Vertex)
	P(gp_Pnt)
	Tol(Standard_Real)

Returns:
	None

Makes a vertex from a 3D point.") MakeVertex;
		void MakeVertex (TopoDS_Vertex & V,const gp_Pnt & P,const Standard_Real Tol);
		%feature("autodoc", "Args:
	V(TopoDS_Vertex)
	P(gp_Pnt)
	Tol(Standard_Real)

Returns:
	None

Sets a 3D point on the vertex.") UpdateVertex;
		void UpdateVertex (const TopoDS_Vertex & V,const gp_Pnt & P,const Standard_Real Tol);
		%feature("autodoc", "Args:
	V(TopoDS_Vertex)
	P(Standard_Real)
	E(TopoDS_Edge)
	Tol(Standard_Real)

Returns:
	None

Sets  the parameter  for the   vertex on the  edge  
         curves.") UpdateVertex;
		void UpdateVertex (const TopoDS_Vertex & V,const Standard_Real P,const TopoDS_Edge & E,const Standard_Real Tol);
		%feature("autodoc", "Args:
	V(TopoDS_Vertex)
	P(Standard_Real)
	E(TopoDS_Edge)
	F(TopoDS_Face)
	Tol(Standard_Real)

Returns:
	None

Sets  the parameter  for the  vertex  on the  edge  
         pcurve  on the face.") UpdateVertex;
		void UpdateVertex (const TopoDS_Vertex & V,const Standard_Real P,const TopoDS_Edge & E,const TopoDS_Face & F,const Standard_Real Tol);
		%feature("autodoc", "Args:
	V(TopoDS_Vertex)
	P(Standard_Real)
	E(TopoDS_Edge)
	S(Handle_Geom_Surface)
	L(TopLoc_Location)
	Tol(Standard_Real)

Returns:
	None

Sets  the parameter  for the  vertex  on the  edge  
         pcurve  on the surface.") UpdateVertex;
		void UpdateVertex (const TopoDS_Vertex & V,const Standard_Real P,const TopoDS_Edge & E,const Handle_Geom_Surface & S,const TopLoc_Location & L,const Standard_Real Tol);
		%feature("autodoc", "Args:
	Ve(TopoDS_Vertex)
	U(Standard_Real)
	V(Standard_Real)
	F(TopoDS_Face)
	Tol(Standard_Real)

Returns:
	None

Sets the parameters for the vertex on the face.") UpdateVertex;
		void UpdateVertex (const TopoDS_Vertex & Ve,const Standard_Real U,const Standard_Real V,const TopoDS_Face & F,const Standard_Real Tol);
		%feature("autodoc", "Args:
	V(TopoDS_Vertex)
	Tol(Standard_Real)

Returns:
	None

Updates the vertex tolerance.") UpdateVertex;
		void UpdateVertex (const TopoDS_Vertex & V,const Standard_Real Tol);
		%feature("autodoc", "Args:
	Ein(TopoDS_Edge)
	Eout(TopoDS_Edge)
	Vin(TopoDS_Vertex)
	Vout(TopoDS_Vertex)

Returns:
	None

Transfert the parameters  of   Vin on  Ein as  the  
         parameter of Vout on Eout.") Transfert;
		void Transfert (const TopoDS_Edge & Ein,const TopoDS_Edge & Eout,const TopoDS_Vertex & Vin,const TopoDS_Vertex & Vout);
};


%feature("shadow") BRep_Builder::~BRep_Builder %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRep_Builder {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRep_CurveRepresentation;
class BRep_CurveRepresentation : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

A 3D curve representation.") IsCurve3D;
		virtual Standard_Boolean IsCurve3D ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

A curve in the parametric space of a surface.") IsCurveOnSurface;
		virtual Standard_Boolean IsCurveOnSurface ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

A continuity between two surfaces.") IsRegularity;
		virtual Standard_Boolean IsRegularity ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

A curve with two parametric   curves  on the  same  
         surface.") IsCurveOnClosedSurface;
		virtual Standard_Boolean IsCurveOnClosedSurface ();
		%feature("autodoc", "Args:
	S(Handle_Geom_Surface)
	L(TopLoc_Location)

Returns:
	virtual Standard_Boolean

Is it a curve in the parametric space  of <S> with  
         location <L>.") IsCurveOnSurface;
		virtual Standard_Boolean IsCurveOnSurface (const Handle_Geom_Surface & S,const TopLoc_Location & L);
		%feature("autodoc", "Args:
	S1(Handle_Geom_Surface)
	S2(Handle_Geom_Surface)
	L1(TopLoc_Location)
	L2(TopLoc_Location)

Returns:
	virtual Standard_Boolean

Is it  a  regularity between  <S1> and   <S2> with  
         location <L1> and <L2>.") IsRegularity;
		virtual Standard_Boolean IsRegularity (const Handle_Geom_Surface & S1,const Handle_Geom_Surface & S2,const TopLoc_Location & L1,const TopLoc_Location & L2);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

A 3D polygon representation.") IsPolygon3D;
		virtual Standard_Boolean IsPolygon3D ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

A representation by an array of nodes on a  
         triangulation.") IsPolygonOnTriangulation;
		virtual Standard_Boolean IsPolygonOnTriangulation ();
		%feature("autodoc", "Args:
	T(Handle_Poly_Triangulation)
	L(TopLoc_Location)

Returns:
	virtual Standard_Boolean

Is it a polygon in the definition of <T> with  
         location <L>.") IsPolygonOnTriangulation;
		virtual Standard_Boolean IsPolygonOnTriangulation (const Handle_Poly_Triangulation & T,const TopLoc_Location & L);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

A representation by two arrays of nodes on a  
         triangulation.") IsPolygonOnClosedTriangulation;
		virtual Standard_Boolean IsPolygonOnClosedTriangulation ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

A polygon in the parametric space of a surface.") IsPolygonOnSurface;
		virtual Standard_Boolean IsPolygonOnSurface ();
		%feature("autodoc", "Args:
	S(Handle_Geom_Surface)
	L(TopLoc_Location)

Returns:
	virtual Standard_Boolean

Is it a polygon in the parametric space  of <S> with  
         location <L>.") IsPolygonOnSurface;
		virtual Standard_Boolean IsPolygonOnSurface (const Handle_Geom_Surface & S,const TopLoc_Location & L);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

Two   2D polygon  representations  in the  parametric  
         space of a surface.") IsPolygonOnClosedSurface;
		virtual Standard_Boolean IsPolygonOnClosedSurface ();
		%feature("autodoc", "Args:
	None
Returns:
	TopLoc_Location

No detailed docstring for this function.") Location;
		const TopLoc_Location & Location ();
		%feature("autodoc", "Args:
	L(TopLoc_Location)

Returns:
	None

No detailed docstring for this function.") Location;
		void Location (const TopLoc_Location & L);
		%feature("autodoc", "Args:
	None
Returns:
	virtual  Handle_Geom_Curve

No detailed docstring for this function.") Curve3D;
		virtual const Handle_Geom_Curve & Curve3D ();
		%feature("autodoc", "Args:
	C(Handle_Geom_Curve)

Returns:
	virtual void

No detailed docstring for this function.") Curve3D;
		virtual void Curve3D (const Handle_Geom_Curve & C);
		%feature("autodoc", "Args:
	None
Returns:
	virtual  Handle_Geom_Surface

No detailed docstring for this function.") Surface;
		virtual const Handle_Geom_Surface & Surface ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual  Handle_Geom2d_Curve

No detailed docstring for this function.") PCurve;
		virtual const Handle_Geom2d_Curve & PCurve ();
		%feature("autodoc", "Args:
	C(Handle_Geom2d_Curve)

Returns:
	virtual void

No detailed docstring for this function.") PCurve;
		virtual void PCurve (const Handle_Geom2d_Curve & C);
		%feature("autodoc", "Args:
	None
Returns:
	virtual  Handle_Geom2d_Curve

No detailed docstring for this function.") PCurve2;
		virtual const Handle_Geom2d_Curve & PCurve2 ();
		%feature("autodoc", "Args:
	C(Handle_Geom2d_Curve)

Returns:
	virtual void

No detailed docstring for this function.") PCurve2;
		virtual void PCurve2 (const Handle_Geom2d_Curve & C);
		%feature("autodoc", "Args:
	None
Returns:
	virtual  Handle_Poly_Polygon3D

No detailed docstring for this function.") Polygon3D;
		virtual const Handle_Poly_Polygon3D & Polygon3D ();
		%feature("autodoc", "Args:
	P(Handle_Poly_Polygon3D)

Returns:
	virtual void

No detailed docstring for this function.") Polygon3D;
		virtual void Polygon3D (const Handle_Poly_Polygon3D & P);
		%feature("autodoc", "Args:
	None
Returns:
	virtual  Handle_Poly_Polygon2D

No detailed docstring for this function.") Polygon;
		virtual const Handle_Poly_Polygon2D & Polygon ();
		%feature("autodoc", "Args:
	P(Handle_Poly_Polygon2D)

Returns:
	virtual void

No detailed docstring for this function.") Polygon;
		virtual void Polygon (const Handle_Poly_Polygon2D & P);
		%feature("autodoc", "Args:
	None
Returns:
	virtual  Handle_Poly_Polygon2D

No detailed docstring for this function.") Polygon2;
		virtual const Handle_Poly_Polygon2D & Polygon2 ();
		%feature("autodoc", "Args:
	P(Handle_Poly_Polygon2D)

Returns:
	virtual void

No detailed docstring for this function.") Polygon2;
		virtual void Polygon2 (const Handle_Poly_Polygon2D & P);
		%feature("autodoc", "Args:
	None
Returns:
	virtual  Handle_Poly_Triangulation

No detailed docstring for this function.") Triangulation;
		virtual const Handle_Poly_Triangulation & Triangulation ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual  Handle_Poly_PolygonOnTriangulation

No detailed docstring for this function.") PolygonOnTriangulation;
		virtual const Handle_Poly_PolygonOnTriangulation & PolygonOnTriangulation ();
		%feature("autodoc", "Args:
	P(Handle_Poly_PolygonOnTriangulation)

Returns:
	virtual void

No detailed docstring for this function.") PolygonOnTriangulation;
		virtual void PolygonOnTriangulation (const Handle_Poly_PolygonOnTriangulation & P);
		%feature("autodoc", "Args:
	None
Returns:
	virtual  Handle_Poly_PolygonOnTriangulation

No detailed docstring for this function.") PolygonOnTriangulation2;
		virtual const Handle_Poly_PolygonOnTriangulation & PolygonOnTriangulation2 ();
		%feature("autodoc", "Args:
	P2(Handle_Poly_PolygonOnTriangulation)

Returns:
	virtual void

No detailed docstring for this function.") PolygonOnTriangulation2;
		virtual void PolygonOnTriangulation2 (const Handle_Poly_PolygonOnTriangulation & P2);
		%feature("autodoc", "Args:
	None
Returns:
	virtual  Handle_Geom_Surface

No detailed docstring for this function.") Surface2;
		virtual const Handle_Geom_Surface & Surface2 ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual  TopLoc_Location

No detailed docstring for this function.") Location2;
		virtual const TopLoc_Location & Location2 ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual  GeomAbs_Shape

No detailed docstring for this function.") Continuity;
		virtual const GeomAbs_Shape & Continuity ();
		%feature("autodoc", "Args:
	C(GeomAbs_Shape)

Returns:
	virtual void

No detailed docstring for this function.") Continuity;
		virtual void Continuity (const GeomAbs_Shape C);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Handle_BRep_CurveRepresentation

Return a copy of this representation.") Copy;
		virtual Handle_BRep_CurveRepresentation Copy ();
};


%feature("shadow") BRep_CurveRepresentation::~BRep_CurveRepresentation %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRep_CurveRepresentation {
	void _kill_pointed() {
		delete $self;
	}
};
%extend BRep_CurveRepresentation {
	Handle_BRep_CurveRepresentation GetHandle() {
	return *(Handle_BRep_CurveRepresentation*) &$self;
	}
};

%nodefaultctor Handle_BRep_CurveRepresentation;
class Handle_BRep_CurveRepresentation : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_BRep_CurveRepresentation();
        Handle_BRep_CurveRepresentation(const Handle_BRep_CurveRepresentation &aHandle);
        Handle_BRep_CurveRepresentation(const BRep_CurveRepresentation *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BRep_CurveRepresentation DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BRep_CurveRepresentation {
    BRep_CurveRepresentation* GetObject() {
    return (BRep_CurveRepresentation*)$self->Access();
    }
};
%feature("shadow") Handle_BRep_CurveRepresentation::~Handle_BRep_CurveRepresentation %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_BRep_CurveRepresentation {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor BRep_ListIteratorOfListOfCurveRepresentation;
class BRep_ListIteratorOfListOfCurveRepresentation {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") BRep_ListIteratorOfListOfCurveRepresentation;
		 BRep_ListIteratorOfListOfCurveRepresentation ();
		%feature("autodoc", "Args:
	L(BRep_ListOfCurveRepresentation)

Returns:
	None

No detailed docstring for this function.") BRep_ListIteratorOfListOfCurveRepresentation;
		 BRep_ListIteratorOfListOfCurveRepresentation (const BRep_ListOfCurveRepresentation & L);
		%feature("autodoc", "Args:
	L(BRep_ListOfCurveRepresentation)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const BRep_ListOfCurveRepresentation & L);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") More;
		Standard_Boolean More ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Next;
		void Next ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_BRep_CurveRepresentation

No detailed docstring for this function.") Value;
		Handle_BRep_CurveRepresentation & Value ();
};


%feature("shadow") BRep_ListIteratorOfListOfCurveRepresentation::~BRep_ListIteratorOfListOfCurveRepresentation %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRep_ListIteratorOfListOfCurveRepresentation {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRep_ListIteratorOfListOfPointRepresentation;
class BRep_ListIteratorOfListOfPointRepresentation {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") BRep_ListIteratorOfListOfPointRepresentation;
		 BRep_ListIteratorOfListOfPointRepresentation ();
		%feature("autodoc", "Args:
	L(BRep_ListOfPointRepresentation)

Returns:
	None

No detailed docstring for this function.") BRep_ListIteratorOfListOfPointRepresentation;
		 BRep_ListIteratorOfListOfPointRepresentation (const BRep_ListOfPointRepresentation & L);
		%feature("autodoc", "Args:
	L(BRep_ListOfPointRepresentation)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const BRep_ListOfPointRepresentation & L);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") More;
		Standard_Boolean More ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Next;
		void Next ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_BRep_PointRepresentation

No detailed docstring for this function.") Value;
		Handle_BRep_PointRepresentation & Value ();
};


%feature("shadow") BRep_ListIteratorOfListOfPointRepresentation::~BRep_ListIteratorOfListOfPointRepresentation %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRep_ListIteratorOfListOfPointRepresentation {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRep_ListNodeOfListOfCurveRepresentation;
class BRep_ListNodeOfListOfCurveRepresentation : public TCollection_MapNode {
	public:
		%feature("autodoc", "Args:
	I(Handle_BRep_CurveRepresentation)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") BRep_ListNodeOfListOfCurveRepresentation;
		 BRep_ListNodeOfListOfCurveRepresentation (const Handle_BRep_CurveRepresentation & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_BRep_CurveRepresentation

No detailed docstring for this function.") Value;
		Handle_BRep_CurveRepresentation & Value ();
};


%feature("shadow") BRep_ListNodeOfListOfCurveRepresentation::~BRep_ListNodeOfListOfCurveRepresentation %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRep_ListNodeOfListOfCurveRepresentation {
	void _kill_pointed() {
		delete $self;
	}
};
%extend BRep_ListNodeOfListOfCurveRepresentation {
	Handle_BRep_ListNodeOfListOfCurveRepresentation GetHandle() {
	return *(Handle_BRep_ListNodeOfListOfCurveRepresentation*) &$self;
	}
};

%nodefaultctor Handle_BRep_ListNodeOfListOfCurveRepresentation;
class Handle_BRep_ListNodeOfListOfCurveRepresentation : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_BRep_ListNodeOfListOfCurveRepresentation();
        Handle_BRep_ListNodeOfListOfCurveRepresentation(const Handle_BRep_ListNodeOfListOfCurveRepresentation &aHandle);
        Handle_BRep_ListNodeOfListOfCurveRepresentation(const BRep_ListNodeOfListOfCurveRepresentation *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BRep_ListNodeOfListOfCurveRepresentation DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BRep_ListNodeOfListOfCurveRepresentation {
    BRep_ListNodeOfListOfCurveRepresentation* GetObject() {
    return (BRep_ListNodeOfListOfCurveRepresentation*)$self->Access();
    }
};
%feature("shadow") Handle_BRep_ListNodeOfListOfCurveRepresentation::~Handle_BRep_ListNodeOfListOfCurveRepresentation %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_BRep_ListNodeOfListOfCurveRepresentation {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor BRep_ListNodeOfListOfPointRepresentation;
class BRep_ListNodeOfListOfPointRepresentation : public TCollection_MapNode {
	public:
		%feature("autodoc", "Args:
	I(Handle_BRep_PointRepresentation)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") BRep_ListNodeOfListOfPointRepresentation;
		 BRep_ListNodeOfListOfPointRepresentation (const Handle_BRep_PointRepresentation & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_BRep_PointRepresentation

No detailed docstring for this function.") Value;
		Handle_BRep_PointRepresentation & Value ();
};


%feature("shadow") BRep_ListNodeOfListOfPointRepresentation::~BRep_ListNodeOfListOfPointRepresentation %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRep_ListNodeOfListOfPointRepresentation {
	void _kill_pointed() {
		delete $self;
	}
};
%extend BRep_ListNodeOfListOfPointRepresentation {
	Handle_BRep_ListNodeOfListOfPointRepresentation GetHandle() {
	return *(Handle_BRep_ListNodeOfListOfPointRepresentation*) &$self;
	}
};

%nodefaultctor Handle_BRep_ListNodeOfListOfPointRepresentation;
class Handle_BRep_ListNodeOfListOfPointRepresentation : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_BRep_ListNodeOfListOfPointRepresentation();
        Handle_BRep_ListNodeOfListOfPointRepresentation(const Handle_BRep_ListNodeOfListOfPointRepresentation &aHandle);
        Handle_BRep_ListNodeOfListOfPointRepresentation(const BRep_ListNodeOfListOfPointRepresentation *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BRep_ListNodeOfListOfPointRepresentation DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BRep_ListNodeOfListOfPointRepresentation {
    BRep_ListNodeOfListOfPointRepresentation* GetObject() {
    return (BRep_ListNodeOfListOfPointRepresentation*)$self->Access();
    }
};
%feature("shadow") Handle_BRep_ListNodeOfListOfPointRepresentation::~Handle_BRep_ListNodeOfListOfPointRepresentation %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_BRep_ListNodeOfListOfPointRepresentation {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor BRep_ListOfCurveRepresentation;
class BRep_ListOfCurveRepresentation {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") BRep_ListOfCurveRepresentation;
		 BRep_ListOfCurveRepresentation ();
		%feature("autodoc", "Args:
	Other(BRep_ListOfCurveRepresentation)

Returns:
	None

No detailed docstring for this function.") Assign;
		void Assign (const BRep_ListOfCurveRepresentation & Other);
		%feature("autodoc", "Args:
	Other(BRep_ListOfCurveRepresentation)

Returns:
	None

No detailed docstring for this function.") operator=;
		void operator = (const BRep_ListOfCurveRepresentation & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Extent;
		Standard_Integer Extent ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "Args:
	I(Handle_BRep_CurveRepresentation)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_BRep_CurveRepresentation & I);
		%feature("autodoc", "Args:
	I(Handle_BRep_CurveRepresentation)
	theIt(BRep_ListIteratorOfListOfCurveRepresentation)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_BRep_CurveRepresentation & I,BRep_ListIteratorOfListOfCurveRepresentation & theIt);
		%feature("autodoc", "Args:
	Other(BRep_ListOfCurveRepresentation)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (BRep_ListOfCurveRepresentation & Other);
		%feature("autodoc", "Args:
	I(Handle_BRep_CurveRepresentation)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_BRep_CurveRepresentation & I);
		%feature("autodoc", "Args:
	I(Handle_BRep_CurveRepresentation)
	theIt(BRep_ListIteratorOfListOfCurveRepresentation)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_BRep_CurveRepresentation & I,BRep_ListIteratorOfListOfCurveRepresentation & theIt);
		%feature("autodoc", "Args:
	Other(BRep_ListOfCurveRepresentation)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (BRep_ListOfCurveRepresentation & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_BRep_CurveRepresentation

No detailed docstring for this function.") First;
		Handle_BRep_CurveRepresentation & First ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_BRep_CurveRepresentation

No detailed docstring for this function.") Last;
		Handle_BRep_CurveRepresentation & Last ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") RemoveFirst;
		void RemoveFirst ();
		%feature("autodoc", "Args:
	It(BRep_ListIteratorOfListOfCurveRepresentation)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (BRep_ListIteratorOfListOfCurveRepresentation & It);
		%feature("autodoc", "Args:
	I(Handle_BRep_CurveRepresentation)
	It(BRep_ListIteratorOfListOfCurveRepresentation)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Handle_BRep_CurveRepresentation & I,BRep_ListIteratorOfListOfCurveRepresentation & It);
		%feature("autodoc", "Args:
	Other(BRep_ListOfCurveRepresentation)
	It(BRep_ListIteratorOfListOfCurveRepresentation)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (BRep_ListOfCurveRepresentation & Other,BRep_ListIteratorOfListOfCurveRepresentation & It);
		%feature("autodoc", "Args:
	I(Handle_BRep_CurveRepresentation)
	It(BRep_ListIteratorOfListOfCurveRepresentation)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Handle_BRep_CurveRepresentation & I,BRep_ListIteratorOfListOfCurveRepresentation & It);
		%feature("autodoc", "Args:
	Other(BRep_ListOfCurveRepresentation)
	It(BRep_ListIteratorOfListOfCurveRepresentation)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (BRep_ListOfCurveRepresentation & Other,BRep_ListIteratorOfListOfCurveRepresentation & It);
};


%feature("shadow") BRep_ListOfCurveRepresentation::~BRep_ListOfCurveRepresentation %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRep_ListOfCurveRepresentation {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRep_ListOfPointRepresentation;
class BRep_ListOfPointRepresentation {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") BRep_ListOfPointRepresentation;
		 BRep_ListOfPointRepresentation ();
		%feature("autodoc", "Args:
	Other(BRep_ListOfPointRepresentation)

Returns:
	None

No detailed docstring for this function.") Assign;
		void Assign (const BRep_ListOfPointRepresentation & Other);
		%feature("autodoc", "Args:
	Other(BRep_ListOfPointRepresentation)

Returns:
	None

No detailed docstring for this function.") operator=;
		void operator = (const BRep_ListOfPointRepresentation & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Extent;
		Standard_Integer Extent ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "Args:
	I(Handle_BRep_PointRepresentation)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_BRep_PointRepresentation & I);
		%feature("autodoc", "Args:
	I(Handle_BRep_PointRepresentation)
	theIt(BRep_ListIteratorOfListOfPointRepresentation)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_BRep_PointRepresentation & I,BRep_ListIteratorOfListOfPointRepresentation & theIt);
		%feature("autodoc", "Args:
	Other(BRep_ListOfPointRepresentation)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (BRep_ListOfPointRepresentation & Other);
		%feature("autodoc", "Args:
	I(Handle_BRep_PointRepresentation)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_BRep_PointRepresentation & I);
		%feature("autodoc", "Args:
	I(Handle_BRep_PointRepresentation)
	theIt(BRep_ListIteratorOfListOfPointRepresentation)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_BRep_PointRepresentation & I,BRep_ListIteratorOfListOfPointRepresentation & theIt);
		%feature("autodoc", "Args:
	Other(BRep_ListOfPointRepresentation)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (BRep_ListOfPointRepresentation & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_BRep_PointRepresentation

No detailed docstring for this function.") First;
		Handle_BRep_PointRepresentation & First ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_BRep_PointRepresentation

No detailed docstring for this function.") Last;
		Handle_BRep_PointRepresentation & Last ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") RemoveFirst;
		void RemoveFirst ();
		%feature("autodoc", "Args:
	It(BRep_ListIteratorOfListOfPointRepresentation)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (BRep_ListIteratorOfListOfPointRepresentation & It);
		%feature("autodoc", "Args:
	I(Handle_BRep_PointRepresentation)
	It(BRep_ListIteratorOfListOfPointRepresentation)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Handle_BRep_PointRepresentation & I,BRep_ListIteratorOfListOfPointRepresentation & It);
		%feature("autodoc", "Args:
	Other(BRep_ListOfPointRepresentation)
	It(BRep_ListIteratorOfListOfPointRepresentation)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (BRep_ListOfPointRepresentation & Other,BRep_ListIteratorOfListOfPointRepresentation & It);
		%feature("autodoc", "Args:
	I(Handle_BRep_PointRepresentation)
	It(BRep_ListIteratorOfListOfPointRepresentation)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Handle_BRep_PointRepresentation & I,BRep_ListIteratorOfListOfPointRepresentation & It);
		%feature("autodoc", "Args:
	Other(BRep_ListOfPointRepresentation)
	It(BRep_ListIteratorOfListOfPointRepresentation)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (BRep_ListOfPointRepresentation & Other,BRep_ListIteratorOfListOfPointRepresentation & It);
};


%feature("shadow") BRep_ListOfPointRepresentation::~BRep_ListOfPointRepresentation %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRep_ListOfPointRepresentation {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRep_PointRepresentation;
class BRep_PointRepresentation : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

A point on a 3d curve.") IsPointOnCurve;
		virtual Standard_Boolean IsPointOnCurve ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

A point on a 2d curve on a surface.") IsPointOnCurveOnSurface;
		virtual Standard_Boolean IsPointOnCurveOnSurface ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

A point on a surface.") IsPointOnSurface;
		virtual Standard_Boolean IsPointOnSurface ();
		%feature("autodoc", "Args:
	C(Handle_Geom_Curve)
	L(TopLoc_Location)

Returns:
	virtual Standard_Boolean

A point on the curve <C>.") IsPointOnCurve;
		virtual Standard_Boolean IsPointOnCurve (const Handle_Geom_Curve & C,const TopLoc_Location & L);
		%feature("autodoc", "Args:
	PC(Handle_Geom2d_Curve)
	S(Handle_Geom_Surface)
	L(TopLoc_Location)

Returns:
	virtual Standard_Boolean

A point on the 2d curve <PC> on the surface <S>.") IsPointOnCurveOnSurface;
		virtual Standard_Boolean IsPointOnCurveOnSurface (const Handle_Geom2d_Curve & PC,const Handle_Geom_Surface & S,const TopLoc_Location & L);
		%feature("autodoc", "Args:
	S(Handle_Geom_Surface)
	L(TopLoc_Location)

Returns:
	virtual Standard_Boolean

A point on the surface <S>.") IsPointOnSurface;
		virtual Standard_Boolean IsPointOnSurface (const Handle_Geom_Surface & S,const TopLoc_Location & L);
		%feature("autodoc", "Args:
	None
Returns:
	TopLoc_Location

No detailed docstring for this function.") Location;
		const TopLoc_Location & Location ();
		%feature("autodoc", "Args:
	L(TopLoc_Location)

Returns:
	None

No detailed docstring for this function.") Location;
		void Location (const TopLoc_Location & L);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") Parameter;
		Standard_Real Parameter ();
		%feature("autodoc", "Args:
	P(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Parameter;
		void Parameter (const Standard_Real P);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Real

No detailed docstring for this function.") Parameter2;
		virtual Standard_Real Parameter2 ();
		%feature("autodoc", "Args:
	P(Standard_Real)

Returns:
	virtual void

No detailed docstring for this function.") Parameter2;
		virtual void Parameter2 (const Standard_Real P);
		%feature("autodoc", "Args:
	None
Returns:
	virtual  Handle_Geom_Curve

No detailed docstring for this function.") Curve;
		virtual const Handle_Geom_Curve & Curve ();
		%feature("autodoc", "Args:
	C(Handle_Geom_Curve)

Returns:
	virtual void

No detailed docstring for this function.") Curve;
		virtual void Curve (const Handle_Geom_Curve & C);
		%feature("autodoc", "Args:
	None
Returns:
	virtual  Handle_Geom2d_Curve

No detailed docstring for this function.") PCurve;
		virtual const Handle_Geom2d_Curve & PCurve ();
		%feature("autodoc", "Args:
	C(Handle_Geom2d_Curve)

Returns:
	virtual void

No detailed docstring for this function.") PCurve;
		virtual void PCurve (const Handle_Geom2d_Curve & C);
		%feature("autodoc", "Args:
	None
Returns:
	virtual  Handle_Geom_Surface

No detailed docstring for this function.") Surface;
		virtual const Handle_Geom_Surface & Surface ();
		%feature("autodoc", "Args:
	S(Handle_Geom_Surface)

Returns:
	virtual void

No detailed docstring for this function.") Surface;
		virtual void Surface (const Handle_Geom_Surface & S);
};


%feature("shadow") BRep_PointRepresentation::~BRep_PointRepresentation %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRep_PointRepresentation {
	void _kill_pointed() {
		delete $self;
	}
};
%extend BRep_PointRepresentation {
	Handle_BRep_PointRepresentation GetHandle() {
	return *(Handle_BRep_PointRepresentation*) &$self;
	}
};

%nodefaultctor Handle_BRep_PointRepresentation;
class Handle_BRep_PointRepresentation : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_BRep_PointRepresentation();
        Handle_BRep_PointRepresentation(const Handle_BRep_PointRepresentation &aHandle);
        Handle_BRep_PointRepresentation(const BRep_PointRepresentation *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BRep_PointRepresentation DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BRep_PointRepresentation {
    BRep_PointRepresentation* GetObject() {
    return (BRep_PointRepresentation*)$self->Access();
    }
};
%feature("shadow") Handle_BRep_PointRepresentation::~Handle_BRep_PointRepresentation %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_BRep_PointRepresentation {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor BRep_TEdge;
class BRep_TEdge : public TopoDS_TEdge {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates an empty TEdge.") BRep_TEdge;
		 BRep_TEdge ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") Tolerance;
		Standard_Real Tolerance ();
		%feature("autodoc", "Args:
	T(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Tolerance;
		void Tolerance (const Standard_Real T);
		%feature("autodoc", "Args:
	T(Standard_Real)

Returns:
	None

Sets the tolerance  to the   max  of <T>  and  the  
         current  tolerance.") UpdateTolerance;
		void UpdateTolerance (const Standard_Real T);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") SameParameter;
		Standard_Boolean SameParameter ();
		%feature("autodoc", "Args:
	S(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") SameParameter;
		void SameParameter (const Standard_Boolean S);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") SameRange;
		Standard_Boolean SameRange ();
		%feature("autodoc", "Args:
	S(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") SameRange;
		void SameRange (const Standard_Boolean S);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") Degenerated;
		Standard_Boolean Degenerated ();
		%feature("autodoc", "Args:
	S(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") Degenerated;
		void Degenerated (const Standard_Boolean S);
		%feature("autodoc", "Args:
	None
Returns:
	BRep_ListOfCurveRepresentation

No detailed docstring for this function.") Curves;
		const BRep_ListOfCurveRepresentation & Curves ();
		%feature("autodoc", "Args:
	None
Returns:
	BRep_ListOfCurveRepresentation

No detailed docstring for this function.") ChangeCurves;
		BRep_ListOfCurveRepresentation & ChangeCurves ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TopoDS_TShape

Returns a copy  of the  TShape  with no sub-shapes.") EmptyCopy;
		Handle_TopoDS_TShape EmptyCopy ();
};


%feature("shadow") BRep_TEdge::~BRep_TEdge %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRep_TEdge {
	void _kill_pointed() {
		delete $self;
	}
};
%extend BRep_TEdge {
	Handle_BRep_TEdge GetHandle() {
	return *(Handle_BRep_TEdge*) &$self;
	}
};

%nodefaultctor Handle_BRep_TEdge;
class Handle_BRep_TEdge : public Handle_TopoDS_TEdge {

    public:
        // constructors
        Handle_BRep_TEdge();
        Handle_BRep_TEdge(const Handle_BRep_TEdge &aHandle);
        Handle_BRep_TEdge(const BRep_TEdge *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BRep_TEdge DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BRep_TEdge {
    BRep_TEdge* GetObject() {
    return (BRep_TEdge*)$self->Access();
    }
};
%feature("shadow") Handle_BRep_TEdge::~Handle_BRep_TEdge %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_BRep_TEdge {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor BRep_TFace;
class BRep_TFace : public TopoDS_TFace {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates an empty TFace.") BRep_TFace;
		 BRep_TFace ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_Surface

No detailed docstring for this function.") Surface;
		const Handle_Geom_Surface & Surface ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Poly_Triangulation

No detailed docstring for this function.") Triangulation;
		const Handle_Poly_Triangulation & Triangulation ();
		%feature("autodoc", "Args:
	None
Returns:
	TopLoc_Location

No detailed docstring for this function.") Location;
		const TopLoc_Location & Location ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") Tolerance;
		Standard_Real Tolerance ();
		%feature("autodoc", "Args:
	S(Handle_Geom_Surface)

Returns:
	None

No detailed docstring for this function.") Surface;
		void Surface (const Handle_Geom_Surface & S);
		%feature("autodoc", "Args:
	T(Handle_Poly_Triangulation)

Returns:
	None

No detailed docstring for this function.") Triangulation;
		void Triangulation (const Handle_Poly_Triangulation & T);
		%feature("autodoc", "Args:
	L(TopLoc_Location)

Returns:
	None

No detailed docstring for this function.") Location;
		void Location (const TopLoc_Location & L);
		%feature("autodoc", "Args:
	T(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Tolerance;
		void Tolerance (const Standard_Real T);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") NaturalRestriction;
		Standard_Boolean NaturalRestriction ();
		%feature("autodoc", "Args:
	N(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") NaturalRestriction;
		void NaturalRestriction (const Standard_Boolean N);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Handle_TopoDS_TShape

Returns a copy  of the  TShape  with no sub-shapes.  
         The new Face has no triangulation.") EmptyCopy;
		virtual Handle_TopoDS_TShape EmptyCopy ();
};


%feature("shadow") BRep_TFace::~BRep_TFace %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRep_TFace {
	void _kill_pointed() {
		delete $self;
	}
};
%extend BRep_TFace {
	Handle_BRep_TFace GetHandle() {
	return *(Handle_BRep_TFace*) &$self;
	}
};

%nodefaultctor Handle_BRep_TFace;
class Handle_BRep_TFace : public Handle_TopoDS_TFace {

    public:
        // constructors
        Handle_BRep_TFace();
        Handle_BRep_TFace(const Handle_BRep_TFace &aHandle);
        Handle_BRep_TFace(const BRep_TFace *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BRep_TFace DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BRep_TFace {
    BRep_TFace* GetObject() {
    return (BRep_TFace*)$self->Access();
    }
};
%feature("shadow") Handle_BRep_TFace::~Handle_BRep_TFace %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_BRep_TFace {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor BRep_TVertex;
class BRep_TVertex : public TopoDS_TVertex {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") BRep_TVertex;
		 BRep_TVertex ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") Tolerance;
		Standard_Real Tolerance ();
		%feature("autodoc", "Args:
	T(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Tolerance;
		void Tolerance (const Standard_Real T);
		%feature("autodoc", "Args:
	T(Standard_Real)

Returns:
	None

Sets the tolerance  to the   max  of <T>  and  the  
         current  tolerance.") UpdateTolerance;
		void UpdateTolerance (const Standard_Real T);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt

No detailed docstring for this function.") Pnt;
		const gp_Pnt & Pnt ();
		%feature("autodoc", "Args:
	P(gp_Pnt)

Returns:
	None

No detailed docstring for this function.") Pnt;
		void Pnt (const gp_Pnt & P);
		%feature("autodoc", "Args:
	None
Returns:
	BRep_ListOfPointRepresentation

No detailed docstring for this function.") Points;
		const BRep_ListOfPointRepresentation & Points ();
		%feature("autodoc", "Args:
	None
Returns:
	BRep_ListOfPointRepresentation

No detailed docstring for this function.") ChangePoints;
		BRep_ListOfPointRepresentation & ChangePoints ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TopoDS_TShape

Returns a copy  of the  TShape  with no sub-shapes.") EmptyCopy;
		Handle_TopoDS_TShape EmptyCopy ();
};


%feature("shadow") BRep_TVertex::~BRep_TVertex %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRep_TVertex {
	void _kill_pointed() {
		delete $self;
	}
};
%extend BRep_TVertex {
	Handle_BRep_TVertex GetHandle() {
	return *(Handle_BRep_TVertex*) &$self;
	}
};

%nodefaultctor Handle_BRep_TVertex;
class Handle_BRep_TVertex : public Handle_TopoDS_TVertex {

    public:
        // constructors
        Handle_BRep_TVertex();
        Handle_BRep_TVertex(const Handle_BRep_TVertex &aHandle);
        Handle_BRep_TVertex(const BRep_TVertex *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BRep_TVertex DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BRep_TVertex {
    BRep_TVertex* GetObject() {
    return (BRep_TVertex*)$self->Access();
    }
};
%feature("shadow") Handle_BRep_TVertex::~Handle_BRep_TVertex %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_BRep_TVertex {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor BRep_Tool;
class BRep_Tool {
	public:
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	static Standard_Boolean

Returns <True>  if S if flaged Closed, if S is a  
         Solid,Shell or Compound  returns <True> is S has no free boundaries.") IsClosed;
		static Standard_Boolean IsClosed (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	F(TopoDS_Face)
	L(TopLoc_Location)

Returns:
	static  Handle_Geom_Surface

Returns the geometric surface of the face. Returns  
         in <L> the location for the surface.") Surface;
		static const Handle_Geom_Surface & Surface (const TopoDS_Face & F,TopLoc_Location & L);
		%feature("autodoc", "Args:
	F(TopoDS_Face)

Returns:
	static Handle_Geom_Surface

Returns the geometric  surface of the face. It can  
         be a copy if there is a Location.") Surface;
		static Handle_Geom_Surface Surface (const TopoDS_Face & F);
		%feature("autodoc", "Args:
	F(TopoDS_Face)
	L(TopLoc_Location)

Returns:
	static  Handle_Poly_Triangulation

Returns  the Triangulation of  the  face. It  is a  
         null handle if there is no triangulation.") Triangulation;
		static const Handle_Poly_Triangulation & Triangulation (const TopoDS_Face & F,TopLoc_Location & L);
		%feature("autodoc", "Args:
	F(TopoDS_Face)

Returns:
	static Standard_Real

Returns the tolerance of the face.") Tolerance;
		static Standard_Real Tolerance (const TopoDS_Face & F);
		%feature("autodoc", "Args:
	F(TopoDS_Face)

Returns:
	static Standard_Boolean

Returns the  NaturalRestriction  flag of the  face.") NaturalRestriction;
		static Standard_Boolean NaturalRestriction (const TopoDS_Face & F);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)

Returns:
	static Standard_Boolean

Returns True if <E> is a 3d curve or a curve on  
         surface.") IsGeometric;
		static Standard_Boolean IsGeometric (const TopoDS_Edge & E);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)
	L(TopLoc_Location)
	First(Standard_Real)
	Last(Standard_Real)

Returns:
	static  Handle_Geom_Curve

Returns the 3D curve  of the edge.  May be  a Null  
         handle. Returns in <L> the location for the curve.  
         In <First> and <Last> the parameter range.") Curve;
		static const Handle_Geom_Curve & Curve (const TopoDS_Edge & E,TopLoc_Location & L,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)
	First(Standard_Real)
	Last(Standard_Real)

Returns:
	static Handle_Geom_Curve

Returns the 3D curve  of the edge. May be a Null handle.  
         In <First> and <Last> the parameter range.  
         It can be a copy if there is a Location.") Curve;
		static Handle_Geom_Curve Curve (const TopoDS_Edge & E,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)
	L(TopLoc_Location)

Returns:
	static  Handle_Poly_Polygon3D

Returns the 3D polygon of the edge. May be   a Null  
         handle. Returns in <L> the location for the polygon.") Polygon3D;
		static const Handle_Poly_Polygon3D & Polygon3D (const TopoDS_Edge & E,TopLoc_Location & L);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)
	F(TopoDS_Face)
	First(Standard_Real)
	Last(Standard_Real)

Returns:
	static Handle_Geom2d_Curve

Returns the curve  associated to the  edge in  the  
         parametric  space of  the  face.  Returns   a NULL  
         handle  if this curve  does not exist.  Returns in  
         <First> and <Last> the parameter range.") CurveOnSurface;
		static Handle_Geom2d_Curve CurveOnSurface (const TopoDS_Edge & E,const TopoDS_Face & F,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)
	S(Handle_Geom_Surface)
	L(TopLoc_Location)
	First(Standard_Real)
	Last(Standard_Real)

Returns:
	static Handle_Geom2d_Curve

Returns the  curve associated to   the edge in the  
         parametric  space of the   surface. Returns a NULL  
         handle  if this curve does  not exist.  Returns in  
         <First> and <Last> the parameter range.") CurveOnSurface;
		static Handle_Geom2d_Curve CurveOnSurface (const TopoDS_Edge & E,const Handle_Geom_Surface & S,const TopLoc_Location & L,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)
	C(Handle_Geom2d_Curve)
	S(Handle_Geom_Surface)
	L(TopLoc_Location)
	First(Standard_Real)
	Last(Standard_Real)

Returns:
	static void

Returns in <C>, <S>, <L> a 2d curve, a surface and  
         a location for the edge <E>. <C> and <S>  are null  
         if the  edge has no curve on  surface.  Returns in  
         <First> and <Last> the parameter range.") CurveOnSurface;
		static void CurveOnSurface (const TopoDS_Edge & E,Handle_Geom2d_Curve & C,Handle_Geom_Surface & S,TopLoc_Location & L,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)
	C(Handle_Geom2d_Curve)
	S(Handle_Geom_Surface)
	L(TopLoc_Location)
	First(Standard_Real)
	Last(Standard_Real)
	Index(Standard_Integer)

Returns:
	static void

Returns in <C>, <S>, <L> the 2d curve, the surface  
         and the location for the edge <E> of rank <Index>.  
         <C> and <S> are null if the index is out of range.  
         Returns in <First> and <Last> the parameter range.") CurveOnSurface;
		static void CurveOnSurface (const TopoDS_Edge & E,Handle_Geom2d_Curve & C,Handle_Geom_Surface & S,TopLoc_Location & L,Standard_Real &OutValue,Standard_Real &OutValue,const Standard_Integer Index);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)
	F(TopoDS_Face)

Returns:
	static Handle_Poly_Polygon2D

Returns the polygon associated to the  edge in  the  
         parametric  space of  the  face.  Returns   a NULL  
         handle  if this polygon  does not exist.") PolygonOnSurface;
		static Handle_Poly_Polygon2D PolygonOnSurface (const TopoDS_Edge & E,const TopoDS_Face & F);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)
	S(Handle_Geom_Surface)
	L(TopLoc_Location)

Returns:
	static Handle_Poly_Polygon2D

Returns the polygon associated to the  edge in  the  
         parametric  space of  the surface. Returns   a NULL  
         handle  if this polygon  does not exist.") PolygonOnSurface;
		static Handle_Poly_Polygon2D PolygonOnSurface (const TopoDS_Edge & E,const Handle_Geom_Surface & S,const TopLoc_Location & L);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)
	C(Handle_Poly_Polygon2D)
	S(Handle_Geom_Surface)
	L(TopLoc_Location)

Returns:
	static void

Returns in <C>, <S>, <L> a 2d curve, a surface and  
         a location for the edge <E>. <C> and <S>  are null  
         if the  edge has no polygon on  surface.") PolygonOnSurface;
		static void PolygonOnSurface (const TopoDS_Edge & E,Handle_Poly_Polygon2D & C,Handle_Geom_Surface & S,TopLoc_Location & L);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)
	C(Handle_Poly_Polygon2D)
	S(Handle_Geom_Surface)
	L(TopLoc_Location)
	Index(Standard_Integer)

Returns:
	static void

Returns in <C>, <S>, <L> the 2d curve, the surface  
         and the location for the edge <E> of rank <Index>.  
         <C> and <S> are null if the index is out of range.") PolygonOnSurface;
		static void PolygonOnSurface (const TopoDS_Edge & E,Handle_Poly_Polygon2D & C,Handle_Geom_Surface & S,TopLoc_Location & L,const Standard_Integer Index);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)
	T(Handle_Poly_Triangulation)
	L(TopLoc_Location)

Returns:
	static  Handle_Poly_PolygonOnTriangulation

Returns the polygon associated to the  edge in  the  
         parametric  space of  the  face.  Returns   a NULL  
         handle  if this polygon  does not exist.") PolygonOnTriangulation;
		static const Handle_Poly_PolygonOnTriangulation & PolygonOnTriangulation (const TopoDS_Edge & E,const Handle_Poly_Triangulation & T,const TopLoc_Location & L);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)
	P(Handle_Poly_PolygonOnTriangulation)
	T(Handle_Poly_Triangulation)
	L(TopLoc_Location)

Returns:
	static void

Returns in <P>, <T>, <L> a polygon on triangulation, a  
         triangulation and a location for the edge <E>.  
         <P>  and  <T>  are null  if  the  edge has no  
         polygon on  triangulation.") PolygonOnTriangulation;
		static void PolygonOnTriangulation (const TopoDS_Edge & E,Handle_Poly_PolygonOnTriangulation & P,Handle_Poly_Triangulation & T,TopLoc_Location & L);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)
	P(Handle_Poly_PolygonOnTriangulation)
	T(Handle_Poly_Triangulation)
	L(TopLoc_Location)
	Index(Standard_Integer)

Returns:
	static void

Returns   in   <P>,  <T>,    <L> a     polygon  on  
         triangulation,   a triangulation  and a  location for  
         the edge <E> for the range index.  <C> and <S> are  
         null if the edge has no polygon on triangulation.") PolygonOnTriangulation;
		static void PolygonOnTriangulation (const TopoDS_Edge & E,Handle_Poly_PolygonOnTriangulation & P,Handle_Poly_Triangulation & T,TopLoc_Location & L,const Standard_Integer Index);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)
	F(TopoDS_Face)

Returns:
	static Standard_Boolean

Returns  True  if  <E>  has  two  PCurves  in  the  
         parametric space of <F>. i.e.  <F>  is on a closed  
         surface and <E> is on the closing curve.") IsClosed;
		static Standard_Boolean IsClosed (const TopoDS_Edge & E,const TopoDS_Face & F);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)
	S(Handle_Geom_Surface)
	L(TopLoc_Location)

Returns:
	static Standard_Boolean

Returns  True  if  <E>  has  two  PCurves  in  the  
         parametric space  of <S>.  i.e.   <S>  is a closed  
         surface and <E> is on the closing curve.") IsClosed;
		static Standard_Boolean IsClosed (const TopoDS_Edge & E,const Handle_Geom_Surface & S,const TopLoc_Location & L);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)
	T(Handle_Poly_Triangulation)

Returns:
	static Standard_Boolean

Returns  True  if <E> has two arrays of indices in  
         the triangulation <T>.") IsClosed;
		static Standard_Boolean IsClosed (const TopoDS_Edge & E,const Handle_Poly_Triangulation & T);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)

Returns:
	static Standard_Real

Returns the tolerance for <E>.") Tolerance;
		static Standard_Real Tolerance (const TopoDS_Edge & E);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)

Returns:
	static Standard_Boolean

Returns the SameParameter flag for the edge.") SameParameter;
		static Standard_Boolean SameParameter (const TopoDS_Edge & E);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)

Returns:
	static Standard_Boolean

Returns the SameRange flag for the edge.") SameRange;
		static Standard_Boolean SameRange (const TopoDS_Edge & E);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)

Returns:
	static Standard_Boolean

Returns True  if the edge is degenerated.") Degenerated;
		static Standard_Boolean Degenerated (const TopoDS_Edge & E);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)
	First(Standard_Real)
	Last(Standard_Real)

Returns:
	static void

Gets the range of the 3d curve.") Range;
		static void Range (const TopoDS_Edge & E,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)
	S(Handle_Geom_Surface)
	L(TopLoc_Location)
	First(Standard_Real)
	Last(Standard_Real)

Returns:
	static void

Gets the range  of the edge  on the pcurve on  the  
         surface.") Range;
		static void Range (const TopoDS_Edge & E,const Handle_Geom_Surface & S,const TopLoc_Location & L,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)
	F(TopoDS_Face)
	First(Standard_Real)
	Last(Standard_Real)

Returns:
	static void

Gets the range of the edge on the pcurve on the face.") Range;
		static void Range (const TopoDS_Edge & E,const TopoDS_Face & F,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)
	S(Handle_Geom_Surface)
	L(TopLoc_Location)
	PFirst(gp_Pnt2d)
	PLast(gp_Pnt2d)

Returns:
	static void

Gets the UV locations of the extremities of the edge.") UVPoints;
		static void UVPoints (const TopoDS_Edge & E,const Handle_Geom_Surface & S,const TopLoc_Location & L,gp_Pnt2d & PFirst,gp_Pnt2d & PLast);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)
	F(TopoDS_Face)
	PFirst(gp_Pnt2d)
	PLast(gp_Pnt2d)

Returns:
	static void

Gets the UV locations of the extremities of the edge.") UVPoints;
		static void UVPoints (const TopoDS_Edge & E,const TopoDS_Face & F,gp_Pnt2d & PFirst,gp_Pnt2d & PLast);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)
	S(Handle_Geom_Surface)
	L(TopLoc_Location)
	PFirst(gp_Pnt2d)
	PLast(gp_Pnt2d)

Returns:
	static void

Sets the UV locations of the extremities of the edge.") SetUVPoints;
		static void SetUVPoints (const TopoDS_Edge & E,const Handle_Geom_Surface & S,const TopLoc_Location & L,const gp_Pnt2d & PFirst,const gp_Pnt2d & PLast);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)
	F(TopoDS_Face)
	PFirst(gp_Pnt2d)
	PLast(gp_Pnt2d)

Returns:
	static void

Sets the UV locations of the extremities of the edge.") SetUVPoints;
		static void SetUVPoints (const TopoDS_Edge & E,const TopoDS_Face & F,const gp_Pnt2d & PFirst,const gp_Pnt2d & PLast);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)
	F1(TopoDS_Face)
	F2(TopoDS_Face)

Returns:
	static Standard_Boolean

Returns True if the edge is on the surfaces of the  
         two faces.") HasContinuity;
		static Standard_Boolean HasContinuity (const TopoDS_Edge & E,const TopoDS_Face & F1,const TopoDS_Face & F2);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)
	F1(TopoDS_Face)
	F2(TopoDS_Face)

Returns:
	static GeomAbs_Shape

Returns the continuity.") Continuity;
		static GeomAbs_Shape Continuity (const TopoDS_Edge & E,const TopoDS_Face & F1,const TopoDS_Face & F2);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)
	S1(Handle_Geom_Surface)
	S2(Handle_Geom_Surface)
	L1(TopLoc_Location)
	L2(TopLoc_Location)

Returns:
	static Standard_Boolean

Returns True if the edge is on the surfaces.") HasContinuity;
		static Standard_Boolean HasContinuity (const TopoDS_Edge & E,const Handle_Geom_Surface & S1,const Handle_Geom_Surface & S2,const TopLoc_Location & L1,const TopLoc_Location & L2);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)
	S1(Handle_Geom_Surface)
	S2(Handle_Geom_Surface)
	L1(TopLoc_Location)
	L2(TopLoc_Location)

Returns:
	static GeomAbs_Shape

Returns the continuity.") Continuity;
		static GeomAbs_Shape Continuity (const TopoDS_Edge & E,const Handle_Geom_Surface & S1,const Handle_Geom_Surface & S2,const TopLoc_Location & L1,const TopLoc_Location & L2);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)

Returns:
	static Standard_Boolean

Returns True if the edge has regularity on some  
         two surfaces") HasContinuity;
		static Standard_Boolean HasContinuity (const TopoDS_Edge & E);
		%feature("autodoc", "Args:
	V(TopoDS_Vertex)

Returns:
	static gp_Pnt

Returns the 3d point.") Pnt;
		static gp_Pnt Pnt (const TopoDS_Vertex & V);
		%feature("autodoc", "Args:
	V(TopoDS_Vertex)

Returns:
	static Standard_Real

Returns the tolerance.") Tolerance;
		static Standard_Real Tolerance (const TopoDS_Vertex & V);
		%feature("autodoc", "Args:
	V(TopoDS_Vertex)
	E(TopoDS_Edge)

Returns:
	static Standard_Real

Returns the parameter of <V> on <E>.") Parameter;
		static Standard_Real Parameter (const TopoDS_Vertex & V,const TopoDS_Edge & E);
		%feature("autodoc", "Args:
	V(TopoDS_Vertex)
	E(TopoDS_Edge)
	F(TopoDS_Face)

Returns:
	static Standard_Real

Returns the  parameters  of   the  vertex   on the  
         pcurve of the edge on the face.") Parameter;
		static Standard_Real Parameter (const TopoDS_Vertex & V,const TopoDS_Edge & E,const TopoDS_Face & F);
		%feature("autodoc", "Args:
	V(TopoDS_Vertex)
	E(TopoDS_Edge)
	S(Handle_Geom_Surface)
	L(TopLoc_Location)

Returns:
	static Standard_Real

Returns the  parameters  of   the  vertex   on the  
         pcurve of the edge on the surface.") Parameter;
		static Standard_Real Parameter (const TopoDS_Vertex & V,const TopoDS_Edge & E,const Handle_Geom_Surface & S,const TopLoc_Location & L);
		%feature("autodoc", "Args:
	V(TopoDS_Vertex)
	F(TopoDS_Face)

Returns:
	static gp_Pnt2d

Returns the parameters of the vertex on the face.") Parameters;
		static gp_Pnt2d Parameters (const TopoDS_Vertex & V,const TopoDS_Face & F);
};


%feature("shadow") BRep_Tool::~BRep_Tool %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRep_Tool {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRep_CurveOn2Surfaces;
class BRep_CurveOn2Surfaces : public BRep_CurveRepresentation {
	public:
		%feature("autodoc", "Args:
	S1(Handle_Geom_Surface)
	S2(Handle_Geom_Surface)
	L1(TopLoc_Location)
	L2(TopLoc_Location)
	C(GeomAbs_Shape)

Returns:
	None

No detailed docstring for this function.") BRep_CurveOn2Surfaces;
		 BRep_CurveOn2Surfaces (const Handle_Geom_Surface & S1,const Handle_Geom_Surface & S2,const TopLoc_Location & L1,const TopLoc_Location & L2,const GeomAbs_Shape C);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

Returns True.") IsRegularity;
		virtual Standard_Boolean IsRegularity ();
		%feature("autodoc", "Args:
	S1(Handle_Geom_Surface)
	S2(Handle_Geom_Surface)
	L1(TopLoc_Location)
	L2(TopLoc_Location)

Returns:
	virtual Standard_Boolean

A curve on two surfaces (continuity).") IsRegularity;
		virtual Standard_Boolean IsRegularity (const Handle_Geom_Surface & S1,const Handle_Geom_Surface & S2,const TopLoc_Location & L1,const TopLoc_Location & L2);
		%feature("autodoc", "Args:
	U(Standard_Real)
	P(gp_Pnt)

Returns:
	None

Raises an error.") D0;
		void D0 (const Standard_Real U,gp_Pnt & P);
		%feature("autodoc", "Args:
	None
Returns:
	virtual  Handle_Geom_Surface

No detailed docstring for this function.") Surface;
		virtual const Handle_Geom_Surface & Surface ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual  Handle_Geom_Surface

No detailed docstring for this function.") Surface2;
		virtual const Handle_Geom_Surface & Surface2 ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual  TopLoc_Location

No detailed docstring for this function.") Location2;
		virtual const TopLoc_Location & Location2 ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual  GeomAbs_Shape

No detailed docstring for this function.") Continuity;
		virtual const GeomAbs_Shape & Continuity ();
		%feature("autodoc", "Args:
	C(GeomAbs_Shape)

Returns:
	virtual void

No detailed docstring for this function.") Continuity;
		virtual void Continuity (const GeomAbs_Shape C);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_BRep_CurveRepresentation

Return a copy of this representation.") Copy;
		Handle_BRep_CurveRepresentation Copy ();
};


%feature("shadow") BRep_CurveOn2Surfaces::~BRep_CurveOn2Surfaces %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRep_CurveOn2Surfaces {
	void _kill_pointed() {
		delete $self;
	}
};
%extend BRep_CurveOn2Surfaces {
	Handle_BRep_CurveOn2Surfaces GetHandle() {
	return *(Handle_BRep_CurveOn2Surfaces*) &$self;
	}
};

%nodefaultctor Handle_BRep_CurveOn2Surfaces;
class Handle_BRep_CurveOn2Surfaces : public Handle_BRep_CurveRepresentation {

    public:
        // constructors
        Handle_BRep_CurveOn2Surfaces();
        Handle_BRep_CurveOn2Surfaces(const Handle_BRep_CurveOn2Surfaces &aHandle);
        Handle_BRep_CurveOn2Surfaces(const BRep_CurveOn2Surfaces *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BRep_CurveOn2Surfaces DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BRep_CurveOn2Surfaces {
    BRep_CurveOn2Surfaces* GetObject() {
    return (BRep_CurveOn2Surfaces*)$self->Access();
    }
};
%feature("shadow") Handle_BRep_CurveOn2Surfaces::~Handle_BRep_CurveOn2Surfaces %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_BRep_CurveOn2Surfaces {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor BRep_GCurve;
class BRep_GCurve : public BRep_CurveRepresentation {
	public:
		%feature("autodoc", "Args:
	First(Standard_Real)
	Last(Standard_Real)

Returns:
	None

No detailed docstring for this function.") SetRange;
		void SetRange (const Standard_Real First,const Standard_Real Last);
		%feature("autodoc", "Args:
	First(Standard_Real)
	Last(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Range;
		void Range (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") First;
		Standard_Real First ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") Last;
		Standard_Real Last ();
		%feature("autodoc", "Args:
	F(Standard_Real)

Returns:
	None

No detailed docstring for this function.") First;
		void First (const Standard_Real F);
		%feature("autodoc", "Args:
	L(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Last;
		void Last (const Standard_Real L);
		%feature("autodoc", "Args:
	U(Standard_Real)
	P(gp_Pnt)

Returns:
	virtual void

Computes the point at parameter U.") D0;
		virtual void D0 (const Standard_Real U,gp_Pnt & P);
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

Recomputes any derived data after a modification.  
         This is called when the range is modified.") Update;
		virtual void Update ();
};


%feature("shadow") BRep_GCurve::~BRep_GCurve %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRep_GCurve {
	void _kill_pointed() {
		delete $self;
	}
};
%extend BRep_GCurve {
	Handle_BRep_GCurve GetHandle() {
	return *(Handle_BRep_GCurve*) &$self;
	}
};

%nodefaultctor Handle_BRep_GCurve;
class Handle_BRep_GCurve : public Handle_BRep_CurveRepresentation {

    public:
        // constructors
        Handle_BRep_GCurve();
        Handle_BRep_GCurve(const Handle_BRep_GCurve &aHandle);
        Handle_BRep_GCurve(const BRep_GCurve *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BRep_GCurve DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BRep_GCurve {
    BRep_GCurve* GetObject() {
    return (BRep_GCurve*)$self->Access();
    }
};
%feature("shadow") Handle_BRep_GCurve::~Handle_BRep_GCurve %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_BRep_GCurve {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor BRep_PointOnCurve;
class BRep_PointOnCurve : public BRep_PointRepresentation {
	public:
		%feature("autodoc", "Args:
	P(Standard_Real)
	C(Handle_Geom_Curve)
	L(TopLoc_Location)

Returns:
	None

No detailed docstring for this function.") BRep_PointOnCurve;
		 BRep_PointOnCurve (const Standard_Real P,const Handle_Geom_Curve & C,const TopLoc_Location & L);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

Returns True") IsPointOnCurve;
		virtual Standard_Boolean IsPointOnCurve ();
		%feature("autodoc", "Args:
	C(Handle_Geom_Curve)
	L(TopLoc_Location)

Returns:
	virtual Standard_Boolean

No detailed docstring for this function.") IsPointOnCurve;
		virtual Standard_Boolean IsPointOnCurve (const Handle_Geom_Curve & C,const TopLoc_Location & L);
		%feature("autodoc", "Args:
	None
Returns:
	virtual  Handle_Geom_Curve

No detailed docstring for this function.") Curve;
		virtual const Handle_Geom_Curve & Curve ();
		%feature("autodoc", "Args:
	C(Handle_Geom_Curve)

Returns:
	virtual void

No detailed docstring for this function.") Curve;
		virtual void Curve (const Handle_Geom_Curve & C);
};


%feature("shadow") BRep_PointOnCurve::~BRep_PointOnCurve %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRep_PointOnCurve {
	void _kill_pointed() {
		delete $self;
	}
};
%extend BRep_PointOnCurve {
	Handle_BRep_PointOnCurve GetHandle() {
	return *(Handle_BRep_PointOnCurve*) &$self;
	}
};

%nodefaultctor Handle_BRep_PointOnCurve;
class Handle_BRep_PointOnCurve : public Handle_BRep_PointRepresentation {

    public:
        // constructors
        Handle_BRep_PointOnCurve();
        Handle_BRep_PointOnCurve(const Handle_BRep_PointOnCurve &aHandle);
        Handle_BRep_PointOnCurve(const BRep_PointOnCurve *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BRep_PointOnCurve DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BRep_PointOnCurve {
    BRep_PointOnCurve* GetObject() {
    return (BRep_PointOnCurve*)$self->Access();
    }
};
%feature("shadow") Handle_BRep_PointOnCurve::~Handle_BRep_PointOnCurve %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_BRep_PointOnCurve {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor BRep_PointsOnSurface;
class BRep_PointsOnSurface : public BRep_PointRepresentation {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	virtual  Handle_Geom_Surface

No detailed docstring for this function.") Surface;
		virtual const Handle_Geom_Surface & Surface ();
		%feature("autodoc", "Args:
	S(Handle_Geom_Surface)

Returns:
	virtual void

No detailed docstring for this function.") Surface;
		virtual void Surface (const Handle_Geom_Surface & S);
};


%feature("shadow") BRep_PointsOnSurface::~BRep_PointsOnSurface %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRep_PointsOnSurface {
	void _kill_pointed() {
		delete $self;
	}
};
%extend BRep_PointsOnSurface {
	Handle_BRep_PointsOnSurface GetHandle() {
	return *(Handle_BRep_PointsOnSurface*) &$self;
	}
};

%nodefaultctor Handle_BRep_PointsOnSurface;
class Handle_BRep_PointsOnSurface : public Handle_BRep_PointRepresentation {

    public:
        // constructors
        Handle_BRep_PointsOnSurface();
        Handle_BRep_PointsOnSurface(const Handle_BRep_PointsOnSurface &aHandle);
        Handle_BRep_PointsOnSurface(const BRep_PointsOnSurface *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BRep_PointsOnSurface DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BRep_PointsOnSurface {
    BRep_PointsOnSurface* GetObject() {
    return (BRep_PointsOnSurface*)$self->Access();
    }
};
%feature("shadow") Handle_BRep_PointsOnSurface::~Handle_BRep_PointsOnSurface %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_BRep_PointsOnSurface {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor BRep_Polygon3D;
class BRep_Polygon3D : public BRep_CurveRepresentation {
	public:
		%feature("autodoc", "Args:
	P(Handle_Poly_Polygon3D)
	L(TopLoc_Location)

Returns:
	None

No detailed docstring for this function.") BRep_Polygon3D;
		 BRep_Polygon3D (const Handle_Poly_Polygon3D & P,const TopLoc_Location & L);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

Returns True.") IsPolygon3D;
		virtual Standard_Boolean IsPolygon3D ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual  Handle_Poly_Polygon3D

No detailed docstring for this function.") Polygon3D;
		virtual const Handle_Poly_Polygon3D & Polygon3D ();
		%feature("autodoc", "Args:
	P(Handle_Poly_Polygon3D)

Returns:
	virtual void

No detailed docstring for this function.") Polygon3D;
		virtual void Polygon3D (const Handle_Poly_Polygon3D & P);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_BRep_CurveRepresentation

Return a copy of this representation.") Copy;
		Handle_BRep_CurveRepresentation Copy ();
};


%feature("shadow") BRep_Polygon3D::~BRep_Polygon3D %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRep_Polygon3D {
	void _kill_pointed() {
		delete $self;
	}
};
%extend BRep_Polygon3D {
	Handle_BRep_Polygon3D GetHandle() {
	return *(Handle_BRep_Polygon3D*) &$self;
	}
};

%nodefaultctor Handle_BRep_Polygon3D;
class Handle_BRep_Polygon3D : public Handle_BRep_CurveRepresentation {

    public:
        // constructors
        Handle_BRep_Polygon3D();
        Handle_BRep_Polygon3D(const Handle_BRep_Polygon3D &aHandle);
        Handle_BRep_Polygon3D(const BRep_Polygon3D *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BRep_Polygon3D DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BRep_Polygon3D {
    BRep_Polygon3D* GetObject() {
    return (BRep_Polygon3D*)$self->Access();
    }
};
%feature("shadow") Handle_BRep_Polygon3D::~Handle_BRep_Polygon3D %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_BRep_Polygon3D {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor BRep_PolygonOnSurface;
class BRep_PolygonOnSurface : public BRep_CurveRepresentation {
	public:
		%feature("autodoc", "Args:
	P(Handle_Poly_Polygon2D)
	S(Handle_Geom_Surface)
	L(TopLoc_Location)

Returns:
	None

No detailed docstring for this function.") BRep_PolygonOnSurface;
		 BRep_PolygonOnSurface (const Handle_Poly_Polygon2D & P,const Handle_Geom_Surface & S,const TopLoc_Location & L);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

A   2D polygon  representation  in the  parametric  
         space of a surface.") IsPolygonOnSurface;
		virtual Standard_Boolean IsPolygonOnSurface ();
		%feature("autodoc", "Args:
	S(Handle_Geom_Surface)
	L(TopLoc_Location)

Returns:
	virtual Standard_Boolean

A   2D polygon  representation  in the  parametric  
         space of a surface.") IsPolygonOnSurface;
		virtual Standard_Boolean IsPolygonOnSurface (const Handle_Geom_Surface & S,const TopLoc_Location & L);
		%feature("autodoc", "Args:
	None
Returns:
	virtual  Handle_Geom_Surface

No detailed docstring for this function.") Surface;
		virtual const Handle_Geom_Surface & Surface ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual  Handle_Poly_Polygon2D

No detailed docstring for this function.") Polygon;
		virtual const Handle_Poly_Polygon2D & Polygon ();
		%feature("autodoc", "Args:
	P(Handle_Poly_Polygon2D)

Returns:
	virtual void

No detailed docstring for this function.") Polygon;
		virtual void Polygon (const Handle_Poly_Polygon2D & P);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Handle_BRep_CurveRepresentation

Return a copy of this representation.") Copy;
		virtual Handle_BRep_CurveRepresentation Copy ();
};


%feature("shadow") BRep_PolygonOnSurface::~BRep_PolygonOnSurface %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRep_PolygonOnSurface {
	void _kill_pointed() {
		delete $self;
	}
};
%extend BRep_PolygonOnSurface {
	Handle_BRep_PolygonOnSurface GetHandle() {
	return *(Handle_BRep_PolygonOnSurface*) &$self;
	}
};

%nodefaultctor Handle_BRep_PolygonOnSurface;
class Handle_BRep_PolygonOnSurface : public Handle_BRep_CurveRepresentation {

    public:
        // constructors
        Handle_BRep_PolygonOnSurface();
        Handle_BRep_PolygonOnSurface(const Handle_BRep_PolygonOnSurface &aHandle);
        Handle_BRep_PolygonOnSurface(const BRep_PolygonOnSurface *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BRep_PolygonOnSurface DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BRep_PolygonOnSurface {
    BRep_PolygonOnSurface* GetObject() {
    return (BRep_PolygonOnSurface*)$self->Access();
    }
};
%feature("shadow") Handle_BRep_PolygonOnSurface::~Handle_BRep_PolygonOnSurface %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_BRep_PolygonOnSurface {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor BRep_PolygonOnTriangulation;
class BRep_PolygonOnTriangulation : public BRep_CurveRepresentation {
	public:
		%feature("autodoc", "Args:
	P(Handle_Poly_PolygonOnTriangulation)
	T(Handle_Poly_Triangulation)
	L(TopLoc_Location)

Returns:
	None

No detailed docstring for this function.") BRep_PolygonOnTriangulation;
		 BRep_PolygonOnTriangulation (const Handle_Poly_PolygonOnTriangulation & P,const Handle_Poly_Triangulation & T,const TopLoc_Location & L);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

returns True.") IsPolygonOnTriangulation;
		virtual Standard_Boolean IsPolygonOnTriangulation ();
		%feature("autodoc", "Args:
	T(Handle_Poly_Triangulation)
	L(TopLoc_Location)

Returns:
	virtual Standard_Boolean

Is it a polygon in the definition of <T> with  
         location <L>.") IsPolygonOnTriangulation;
		virtual Standard_Boolean IsPolygonOnTriangulation (const Handle_Poly_Triangulation & T,const TopLoc_Location & L);
		%feature("autodoc", "Args:
	P(Handle_Poly_PolygonOnTriangulation)

Returns:
	virtual void

returns True.") PolygonOnTriangulation;
		virtual void PolygonOnTriangulation (const Handle_Poly_PolygonOnTriangulation & P);
		%feature("autodoc", "Args:
	None
Returns:
	virtual  Handle_Poly_Triangulation

No detailed docstring for this function.") Triangulation;
		virtual const Handle_Poly_Triangulation & Triangulation ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual  Handle_Poly_PolygonOnTriangulation

No detailed docstring for this function.") PolygonOnTriangulation;
		virtual const Handle_Poly_PolygonOnTriangulation & PolygonOnTriangulation ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Handle_BRep_CurveRepresentation

Return a copy of this representation.") Copy;
		virtual Handle_BRep_CurveRepresentation Copy ();
};


%feature("shadow") BRep_PolygonOnTriangulation::~BRep_PolygonOnTriangulation %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRep_PolygonOnTriangulation {
	void _kill_pointed() {
		delete $self;
	}
};
%extend BRep_PolygonOnTriangulation {
	Handle_BRep_PolygonOnTriangulation GetHandle() {
	return *(Handle_BRep_PolygonOnTriangulation*) &$self;
	}
};

%nodefaultctor Handle_BRep_PolygonOnTriangulation;
class Handle_BRep_PolygonOnTriangulation : public Handle_BRep_CurveRepresentation {

    public:
        // constructors
        Handle_BRep_PolygonOnTriangulation();
        Handle_BRep_PolygonOnTriangulation(const Handle_BRep_PolygonOnTriangulation &aHandle);
        Handle_BRep_PolygonOnTriangulation(const BRep_PolygonOnTriangulation *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BRep_PolygonOnTriangulation DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BRep_PolygonOnTriangulation {
    BRep_PolygonOnTriangulation* GetObject() {
    return (BRep_PolygonOnTriangulation*)$self->Access();
    }
};
%feature("shadow") Handle_BRep_PolygonOnTriangulation::~Handle_BRep_PolygonOnTriangulation %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_BRep_PolygonOnTriangulation {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor BRep_Curve3D;
class BRep_Curve3D : public BRep_GCurve {
	public:
		%feature("autodoc", "Args:
	C(Handle_Geom_Curve)
	L(TopLoc_Location)

Returns:
	None

No detailed docstring for this function.") BRep_Curve3D;
		 BRep_Curve3D (const Handle_Geom_Curve & C,const TopLoc_Location & L);
		%feature("autodoc", "Args:
	U(Standard_Real)
	P(gp_Pnt)

Returns:
	None

Computes the point at parameter U.") D0;
		void D0 (const Standard_Real U,gp_Pnt & P);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

Returns True.") IsCurve3D;
		virtual Standard_Boolean IsCurve3D ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual  Handle_Geom_Curve

No detailed docstring for this function.") Curve3D;
		virtual const Handle_Geom_Curve & Curve3D ();
		%feature("autodoc", "Args:
	C(Handle_Geom_Curve)

Returns:
	virtual void

No detailed docstring for this function.") Curve3D;
		virtual void Curve3D (const Handle_Geom_Curve & C);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_BRep_CurveRepresentation

Return a copy of this representation.") Copy;
		Handle_BRep_CurveRepresentation Copy ();
};


%feature("shadow") BRep_Curve3D::~BRep_Curve3D %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRep_Curve3D {
	void _kill_pointed() {
		delete $self;
	}
};
%extend BRep_Curve3D {
	Handle_BRep_Curve3D GetHandle() {
	return *(Handle_BRep_Curve3D*) &$self;
	}
};

%nodefaultctor Handle_BRep_Curve3D;
class Handle_BRep_Curve3D : public Handle_BRep_GCurve {

    public:
        // constructors
        Handle_BRep_Curve3D();
        Handle_BRep_Curve3D(const Handle_BRep_Curve3D &aHandle);
        Handle_BRep_Curve3D(const BRep_Curve3D *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BRep_Curve3D DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BRep_Curve3D {
    BRep_Curve3D* GetObject() {
    return (BRep_Curve3D*)$self->Access();
    }
};
%feature("shadow") Handle_BRep_Curve3D::~Handle_BRep_Curve3D %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_BRep_Curve3D {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor BRep_CurveOnSurface;
class BRep_CurveOnSurface : public BRep_GCurve {
	public:
		%feature("autodoc", "Args:
	PC(Handle_Geom2d_Curve)
	S(Handle_Geom_Surface)
	L(TopLoc_Location)

Returns:
	None

No detailed docstring for this function.") BRep_CurveOnSurface;
		 BRep_CurveOnSurface (const Handle_Geom2d_Curve & PC,const Handle_Geom_Surface & S,const TopLoc_Location & L);
		%feature("autodoc", "Args:
	P1(gp_Pnt2d)
	P2(gp_Pnt2d)

Returns:
	None

No detailed docstring for this function.") SetUVPoints;
		void SetUVPoints (const gp_Pnt2d & P1,const gp_Pnt2d & P2);
		%feature("autodoc", "Args:
	P1(gp_Pnt2d)
	P2(gp_Pnt2d)

Returns:
	None

No detailed docstring for this function.") UVPoints;
		void UVPoints (gp_Pnt2d & P1,gp_Pnt2d & P2);
		%feature("autodoc", "Args:
	U(Standard_Real)
	P(gp_Pnt)

Returns:
	None

Computes the point at parameter U.") D0;
		void D0 (const Standard_Real U,gp_Pnt & P);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

Returns True.") IsCurveOnSurface;
		virtual Standard_Boolean IsCurveOnSurface ();
		%feature("autodoc", "Args:
	S(Handle_Geom_Surface)
	L(TopLoc_Location)

Returns:
	virtual Standard_Boolean

A curve in the parametric space of a surface.") IsCurveOnSurface;
		virtual Standard_Boolean IsCurveOnSurface (const Handle_Geom_Surface & S,const TopLoc_Location & L);
		%feature("autodoc", "Args:
	None
Returns:
	virtual  Handle_Geom_Surface

No detailed docstring for this function.") Surface;
		virtual const Handle_Geom_Surface & Surface ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual  Handle_Geom2d_Curve

No detailed docstring for this function.") PCurve;
		virtual const Handle_Geom2d_Curve & PCurve ();
		%feature("autodoc", "Args:
	C(Handle_Geom2d_Curve)

Returns:
	virtual void

No detailed docstring for this function.") PCurve;
		virtual void PCurve (const Handle_Geom2d_Curve & C);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Handle_BRep_CurveRepresentation

Return a copy of this representation.") Copy;
		virtual Handle_BRep_CurveRepresentation Copy ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

Recomputes any derived data after a modification.  
         This is called when the range is modified.") Update;
		virtual void Update ();
};


%feature("shadow") BRep_CurveOnSurface::~BRep_CurveOnSurface %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRep_CurveOnSurface {
	void _kill_pointed() {
		delete $self;
	}
};
%extend BRep_CurveOnSurface {
	Handle_BRep_CurveOnSurface GetHandle() {
	return *(Handle_BRep_CurveOnSurface*) &$self;
	}
};

%nodefaultctor Handle_BRep_CurveOnSurface;
class Handle_BRep_CurveOnSurface : public Handle_BRep_GCurve {

    public:
        // constructors
        Handle_BRep_CurveOnSurface();
        Handle_BRep_CurveOnSurface(const Handle_BRep_CurveOnSurface &aHandle);
        Handle_BRep_CurveOnSurface(const BRep_CurveOnSurface *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BRep_CurveOnSurface DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BRep_CurveOnSurface {
    BRep_CurveOnSurface* GetObject() {
    return (BRep_CurveOnSurface*)$self->Access();
    }
};
%feature("shadow") Handle_BRep_CurveOnSurface::~Handle_BRep_CurveOnSurface %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_BRep_CurveOnSurface {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor BRep_PointOnCurveOnSurface;
class BRep_PointOnCurveOnSurface : public BRep_PointsOnSurface {
	public:
		%feature("autodoc", "Args:
	P(Standard_Real)
	C(Handle_Geom2d_Curve)
	S(Handle_Geom_Surface)
	L(TopLoc_Location)

Returns:
	None

No detailed docstring for this function.") BRep_PointOnCurveOnSurface;
		 BRep_PointOnCurveOnSurface (const Standard_Real P,const Handle_Geom2d_Curve & C,const Handle_Geom_Surface & S,const TopLoc_Location & L);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

Returns True") IsPointOnCurveOnSurface;
		virtual Standard_Boolean IsPointOnCurveOnSurface ();
		%feature("autodoc", "Args:
	PC(Handle_Geom2d_Curve)
	S(Handle_Geom_Surface)
	L(TopLoc_Location)

Returns:
	virtual Standard_Boolean

No detailed docstring for this function.") IsPointOnCurveOnSurface;
		virtual Standard_Boolean IsPointOnCurveOnSurface (const Handle_Geom2d_Curve & PC,const Handle_Geom_Surface & S,const TopLoc_Location & L);
		%feature("autodoc", "Args:
	None
Returns:
	virtual  Handle_Geom2d_Curve

No detailed docstring for this function.") PCurve;
		virtual const Handle_Geom2d_Curve & PCurve ();
		%feature("autodoc", "Args:
	C(Handle_Geom2d_Curve)

Returns:
	virtual void

No detailed docstring for this function.") PCurve;
		virtual void PCurve (const Handle_Geom2d_Curve & C);
};


%feature("shadow") BRep_PointOnCurveOnSurface::~BRep_PointOnCurveOnSurface %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRep_PointOnCurveOnSurface {
	void _kill_pointed() {
		delete $self;
	}
};
%extend BRep_PointOnCurveOnSurface {
	Handle_BRep_PointOnCurveOnSurface GetHandle() {
	return *(Handle_BRep_PointOnCurveOnSurface*) &$self;
	}
};

%nodefaultctor Handle_BRep_PointOnCurveOnSurface;
class Handle_BRep_PointOnCurveOnSurface : public Handle_BRep_PointsOnSurface {

    public:
        // constructors
        Handle_BRep_PointOnCurveOnSurface();
        Handle_BRep_PointOnCurveOnSurface(const Handle_BRep_PointOnCurveOnSurface &aHandle);
        Handle_BRep_PointOnCurveOnSurface(const BRep_PointOnCurveOnSurface *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BRep_PointOnCurveOnSurface DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BRep_PointOnCurveOnSurface {
    BRep_PointOnCurveOnSurface* GetObject() {
    return (BRep_PointOnCurveOnSurface*)$self->Access();
    }
};
%feature("shadow") Handle_BRep_PointOnCurveOnSurface::~Handle_BRep_PointOnCurveOnSurface %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_BRep_PointOnCurveOnSurface {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor BRep_PointOnSurface;
class BRep_PointOnSurface : public BRep_PointsOnSurface {
	public:
		%feature("autodoc", "Args:
	P1(Standard_Real)
	P2(Standard_Real)
	S(Handle_Geom_Surface)
	L(TopLoc_Location)

Returns:
	None

No detailed docstring for this function.") BRep_PointOnSurface;
		 BRep_PointOnSurface (const Standard_Real P1,const Standard_Real P2,const Handle_Geom_Surface & S,const TopLoc_Location & L);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

No detailed docstring for this function.") IsPointOnSurface;
		virtual Standard_Boolean IsPointOnSurface ();
		%feature("autodoc", "Args:
	S(Handle_Geom_Surface)
	L(TopLoc_Location)

Returns:
	virtual Standard_Boolean

No detailed docstring for this function.") IsPointOnSurface;
		virtual Standard_Boolean IsPointOnSurface (const Handle_Geom_Surface & S,const TopLoc_Location & L);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Real

No detailed docstring for this function.") Parameter2;
		virtual Standard_Real Parameter2 ();
		%feature("autodoc", "Args:
	P(Standard_Real)

Returns:
	virtual void

No detailed docstring for this function.") Parameter2;
		virtual void Parameter2 (const Standard_Real P);
};


%feature("shadow") BRep_PointOnSurface::~BRep_PointOnSurface %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRep_PointOnSurface {
	void _kill_pointed() {
		delete $self;
	}
};
%extend BRep_PointOnSurface {
	Handle_BRep_PointOnSurface GetHandle() {
	return *(Handle_BRep_PointOnSurface*) &$self;
	}
};

%nodefaultctor Handle_BRep_PointOnSurface;
class Handle_BRep_PointOnSurface : public Handle_BRep_PointsOnSurface {

    public:
        // constructors
        Handle_BRep_PointOnSurface();
        Handle_BRep_PointOnSurface(const Handle_BRep_PointOnSurface &aHandle);
        Handle_BRep_PointOnSurface(const BRep_PointOnSurface *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BRep_PointOnSurface DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BRep_PointOnSurface {
    BRep_PointOnSurface* GetObject() {
    return (BRep_PointOnSurface*)$self->Access();
    }
};
%feature("shadow") Handle_BRep_PointOnSurface::~Handle_BRep_PointOnSurface %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_BRep_PointOnSurface {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor BRep_PolygonOnClosedSurface;
class BRep_PolygonOnClosedSurface : public BRep_PolygonOnSurface {
	public:
		%feature("autodoc", "Args:
	P1(Handle_Poly_Polygon2D)
	P2(Handle_Poly_Polygon2D)
	S(Handle_Geom_Surface)
	L(TopLoc_Location)

Returns:
	None

No detailed docstring for this function.") BRep_PolygonOnClosedSurface;
		 BRep_PolygonOnClosedSurface (const Handle_Poly_Polygon2D & P1,const Handle_Poly_Polygon2D & P2,const Handle_Geom_Surface & S,const TopLoc_Location & L);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

returns True.") IsPolygonOnClosedSurface;
		virtual Standard_Boolean IsPolygonOnClosedSurface ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual  Handle_Poly_Polygon2D

No detailed docstring for this function.") Polygon2;
		virtual const Handle_Poly_Polygon2D & Polygon2 ();
		%feature("autodoc", "Args:
	P(Handle_Poly_Polygon2D)

Returns:
	virtual void

No detailed docstring for this function.") Polygon2;
		virtual void Polygon2 (const Handle_Poly_Polygon2D & P);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Handle_BRep_CurveRepresentation

Return a copy of this representation.") Copy;
		virtual Handle_BRep_CurveRepresentation Copy ();
};


%feature("shadow") BRep_PolygonOnClosedSurface::~BRep_PolygonOnClosedSurface %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRep_PolygonOnClosedSurface {
	void _kill_pointed() {
		delete $self;
	}
};
%extend BRep_PolygonOnClosedSurface {
	Handle_BRep_PolygonOnClosedSurface GetHandle() {
	return *(Handle_BRep_PolygonOnClosedSurface*) &$self;
	}
};

%nodefaultctor Handle_BRep_PolygonOnClosedSurface;
class Handle_BRep_PolygonOnClosedSurface : public Handle_BRep_PolygonOnSurface {

    public:
        // constructors
        Handle_BRep_PolygonOnClosedSurface();
        Handle_BRep_PolygonOnClosedSurface(const Handle_BRep_PolygonOnClosedSurface &aHandle);
        Handle_BRep_PolygonOnClosedSurface(const BRep_PolygonOnClosedSurface *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BRep_PolygonOnClosedSurface DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BRep_PolygonOnClosedSurface {
    BRep_PolygonOnClosedSurface* GetObject() {
    return (BRep_PolygonOnClosedSurface*)$self->Access();
    }
};
%feature("shadow") Handle_BRep_PolygonOnClosedSurface::~Handle_BRep_PolygonOnClosedSurface %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_BRep_PolygonOnClosedSurface {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor BRep_PolygonOnClosedTriangulation;
class BRep_PolygonOnClosedTriangulation : public BRep_PolygonOnTriangulation {
	public:
		%feature("autodoc", "Args:
	P1(Handle_Poly_PolygonOnTriangulation)
	P2(Handle_Poly_PolygonOnTriangulation)
	Tr(Handle_Poly_Triangulation)
	L(TopLoc_Location)

Returns:
	None

No detailed docstring for this function.") BRep_PolygonOnClosedTriangulation;
		 BRep_PolygonOnClosedTriangulation (const Handle_Poly_PolygonOnTriangulation & P1,const Handle_Poly_PolygonOnTriangulation & P2,const Handle_Poly_Triangulation & Tr,const TopLoc_Location & L);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

Returns True.") IsPolygonOnClosedTriangulation;
		virtual Standard_Boolean IsPolygonOnClosedTriangulation ();
		%feature("autodoc", "Args:
	P2(Handle_Poly_PolygonOnTriangulation)

Returns:
	virtual void

No detailed docstring for this function.") PolygonOnTriangulation2;
		virtual void PolygonOnTriangulation2 (const Handle_Poly_PolygonOnTriangulation & P2);
		%feature("autodoc", "Args:
	None
Returns:
	virtual  Handle_Poly_PolygonOnTriangulation

No detailed docstring for this function.") PolygonOnTriangulation2;
		virtual const Handle_Poly_PolygonOnTriangulation & PolygonOnTriangulation2 ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Handle_BRep_CurveRepresentation

Return a copy of this representation.") Copy;
		virtual Handle_BRep_CurveRepresentation Copy ();
};


%feature("shadow") BRep_PolygonOnClosedTriangulation::~BRep_PolygonOnClosedTriangulation %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRep_PolygonOnClosedTriangulation {
	void _kill_pointed() {
		delete $self;
	}
};
%extend BRep_PolygonOnClosedTriangulation {
	Handle_BRep_PolygonOnClosedTriangulation GetHandle() {
	return *(Handle_BRep_PolygonOnClosedTriangulation*) &$self;
	}
};

%nodefaultctor Handle_BRep_PolygonOnClosedTriangulation;
class Handle_BRep_PolygonOnClosedTriangulation : public Handle_BRep_PolygonOnTriangulation {

    public:
        // constructors
        Handle_BRep_PolygonOnClosedTriangulation();
        Handle_BRep_PolygonOnClosedTriangulation(const Handle_BRep_PolygonOnClosedTriangulation &aHandle);
        Handle_BRep_PolygonOnClosedTriangulation(const BRep_PolygonOnClosedTriangulation *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BRep_PolygonOnClosedTriangulation DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BRep_PolygonOnClosedTriangulation {
    BRep_PolygonOnClosedTriangulation* GetObject() {
    return (BRep_PolygonOnClosedTriangulation*)$self->Access();
    }
};
%feature("shadow") Handle_BRep_PolygonOnClosedTriangulation::~Handle_BRep_PolygonOnClosedTriangulation %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_BRep_PolygonOnClosedTriangulation {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor BRep_CurveOnClosedSurface;
class BRep_CurveOnClosedSurface : public BRep_CurveOnSurface {
	public:
		%feature("autodoc", "Args:
	PC1(Handle_Geom2d_Curve)
	PC2(Handle_Geom2d_Curve)
	S(Handle_Geom_Surface)
	L(TopLoc_Location)
	C(GeomAbs_Shape)

Returns:
	None

No detailed docstring for this function.") BRep_CurveOnClosedSurface;
		 BRep_CurveOnClosedSurface (const Handle_Geom2d_Curve & PC1,const Handle_Geom2d_Curve & PC2,const Handle_Geom_Surface & S,const TopLoc_Location & L,const GeomAbs_Shape C);
		%feature("autodoc", "Args:
	P1(gp_Pnt2d)
	P2(gp_Pnt2d)

Returns:
	None

No detailed docstring for this function.") SetUVPoints2;
		void SetUVPoints2 (const gp_Pnt2d & P1,const gp_Pnt2d & P2);
		%feature("autodoc", "Args:
	P1(gp_Pnt2d)
	P2(gp_Pnt2d)

Returns:
	None

No detailed docstring for this function.") UVPoints2;
		void UVPoints2 (gp_Pnt2d & P1,gp_Pnt2d & P2);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

Returns True.") IsCurveOnClosedSurface;
		virtual Standard_Boolean IsCurveOnClosedSurface ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

Returns True") IsRegularity;
		virtual Standard_Boolean IsRegularity ();
		%feature("autodoc", "Args:
	S1(Handle_Geom_Surface)
	S2(Handle_Geom_Surface)
	L1(TopLoc_Location)
	L2(TopLoc_Location)

Returns:
	virtual Standard_Boolean

A curve on two surfaces (continuity).") IsRegularity;
		virtual Standard_Boolean IsRegularity (const Handle_Geom_Surface & S1,const Handle_Geom_Surface & S2,const TopLoc_Location & L1,const TopLoc_Location & L2);
		%feature("autodoc", "Args:
	None
Returns:
	virtual  Handle_Geom2d_Curve

No detailed docstring for this function.") PCurve2;
		virtual const Handle_Geom2d_Curve & PCurve2 ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual  Handle_Geom_Surface

Returns Surface()") Surface2;
		virtual const Handle_Geom_Surface & Surface2 ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual  TopLoc_Location

Returns Location()") Location2;
		virtual const TopLoc_Location & Location2 ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual  GeomAbs_Shape

No detailed docstring for this function.") Continuity;
		virtual const GeomAbs_Shape & Continuity ();
		%feature("autodoc", "Args:
	C(GeomAbs_Shape)

Returns:
	virtual void

No detailed docstring for this function.") Continuity;
		virtual void Continuity (const GeomAbs_Shape C);
		%feature("autodoc", "Args:
	C(Handle_Geom2d_Curve)

Returns:
	virtual void

No detailed docstring for this function.") PCurve2;
		virtual void PCurve2 (const Handle_Geom2d_Curve & C);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Handle_BRep_CurveRepresentation

Return a copy of this representation.") Copy;
		virtual Handle_BRep_CurveRepresentation Copy ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

Recomputes any derived data after a modification.  
         This is called when the range is modified.") Update;
		virtual void Update ();
};


%feature("shadow") BRep_CurveOnClosedSurface::~BRep_CurveOnClosedSurface %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRep_CurveOnClosedSurface {
	void _kill_pointed() {
		delete $self;
	}
};
%extend BRep_CurveOnClosedSurface {
	Handle_BRep_CurveOnClosedSurface GetHandle() {
	return *(Handle_BRep_CurveOnClosedSurface*) &$self;
	}
};

%nodefaultctor Handle_BRep_CurveOnClosedSurface;
class Handle_BRep_CurveOnClosedSurface : public Handle_BRep_CurveOnSurface {

    public:
        // constructors
        Handle_BRep_CurveOnClosedSurface();
        Handle_BRep_CurveOnClosedSurface(const Handle_BRep_CurveOnClosedSurface &aHandle);
        Handle_BRep_CurveOnClosedSurface(const BRep_CurveOnClosedSurface *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BRep_CurveOnClosedSurface DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BRep_CurveOnClosedSurface {
    BRep_CurveOnClosedSurface* GetObject() {
    return (BRep_CurveOnClosedSurface*)$self->Access();
    }
};
%feature("shadow") Handle_BRep_CurveOnClosedSurface::~Handle_BRep_CurveOnClosedSurface %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_BRep_CurveOnClosedSurface {
    void _kill_pointed() {
        delete $self;
    }
};

