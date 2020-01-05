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
%define BREPDOCSTRING
"BRep module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_brep.html"
%enddef
%module (package="OCC.Core", docstring=BREPDOCSTRING) BRep


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
#include<BRep_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TopoDS_module.hxx>
#include<GeomAbs_module.hxx>
#include<Geom_module.hxx>
#include<TopLoc_module.hxx>
#include<Poly_module.hxx>
#include<gp_module.hxx>
#include<Geom2d_module.hxx>
#include<TopAbs_module.hxx>
#include<TShort_module.hxx>
#include<Message_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import TopoDS.i
%import GeomAbs.i
%import Geom.i
%import TopLoc.i
%import Poly.i
%import gp.i
%import Geom2d.i
%import TopAbs.i
/* public enums */
/* end public enums declaration */

/* handles */
%wrap_handle(BRep_CurveRepresentation)
%wrap_handle(BRep_PointRepresentation)
%wrap_handle(BRep_TEdge)
%wrap_handle(BRep_TFace)
%wrap_handle(BRep_TVertex)
%wrap_handle(BRep_CurveOn2Surfaces)
%wrap_handle(BRep_GCurve)
%wrap_handle(BRep_PointOnCurve)
%wrap_handle(BRep_PointsOnSurface)
%wrap_handle(BRep_Polygon3D)
%wrap_handle(BRep_PolygonOnSurface)
%wrap_handle(BRep_PolygonOnTriangulation)
%wrap_handle(BRep_Curve3D)
%wrap_handle(BRep_CurveOnSurface)
%wrap_handle(BRep_PointOnCurveOnSurface)
%wrap_handle(BRep_PointOnSurface)
%wrap_handle(BRep_PolygonOnClosedSurface)
%wrap_handle(BRep_PolygonOnClosedTriangulation)
%wrap_handle(BRep_CurveOnClosedSurface)
/* end handles declaration */

/* templates */
%template(BRep_ListOfPointRepresentation) NCollection_List <opencascade::handle <BRep_PointRepresentation>>;
%template(BRep_ListIteratorOfListOfPointRepresentation) NCollection_TListIterator<opencascade::handle<BRep_PointRepresentation>>;
%template(BRep_ListOfCurveRepresentation) NCollection_List <opencascade::handle <BRep_CurveRepresentation>>;
%template(BRep_ListIteratorOfListOfCurveRepresentation) NCollection_TListIterator<opencascade::handle<BRep_CurveRepresentation>>;
/* end templates declaration */

/* typedefs */
typedef NCollection_List <opencascade::handle <BRep_PointRepresentation>> BRep_ListOfPointRepresentation;
typedef NCollection_List <opencascade::handle <BRep_PointRepresentation>>::Iterator BRep_ListIteratorOfListOfPointRepresentation;
typedef NCollection_List <opencascade::handle <BRep_CurveRepresentation>> BRep_ListOfCurveRepresentation;
typedef NCollection_List <opencascade::handle <BRep_CurveRepresentation>>::Iterator BRep_ListIteratorOfListOfCurveRepresentation;
/* end typedefs declaration */

/*********************
* class BRep_Builder *
*********************/
class BRep_Builder : public TopoDS_Builder {
	public:
		/****************** Continuity ******************/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "* Sets the geometric continuity on the edge.
	:param E:
	:type E: TopoDS_Edge
	:param F1:
	:type F1: TopoDS_Face
	:param F2:
	:type F2: TopoDS_Face
	:param C:
	:type C: GeomAbs_Shape
	:rtype: None") Continuity;
		void Continuity (const TopoDS_Edge & E,const TopoDS_Face & F1,const TopoDS_Face & F2,const GeomAbs_Shape C);

		/****************** Continuity ******************/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "* Sets the geometric continuity on the edge.
	:param E:
	:type E: TopoDS_Edge
	:param S1:
	:type S1: Geom_Surface
	:param S2:
	:type S2: Geom_Surface
	:param L1:
	:type L1: TopLoc_Location
	:param L2:
	:type L2: TopLoc_Location
	:param C:
	:type C: GeomAbs_Shape
	:rtype: None") Continuity;
		void Continuity (const TopoDS_Edge & E,const opencascade::handle<Geom_Surface> & S1,const opencascade::handle<Geom_Surface> & S2,const TopLoc_Location & L1,const TopLoc_Location & L2,const GeomAbs_Shape C);

		/****************** Degenerated ******************/
		%feature("compactdefaultargs") Degenerated;
		%feature("autodoc", "* Sets the degenerated flag for the edge <E>.
	:param E:
	:type E: TopoDS_Edge
	:param D:
	:type D: bool
	:rtype: None") Degenerated;
		void Degenerated (const TopoDS_Edge & E,const Standard_Boolean D);

		/****************** MakeEdge ******************/
		%feature("compactdefaultargs") MakeEdge;
		%feature("autodoc", "* Makes an undefined Edge (no geometry).
	:param E:
	:type E: TopoDS_Edge
	:rtype: None") MakeEdge;
		void MakeEdge (TopoDS_Edge & E);

		/****************** MakeEdge ******************/
		%feature("compactdefaultargs") MakeEdge;
		%feature("autodoc", "* Makes an Edge with a curve.
	:param E:
	:type E: TopoDS_Edge
	:param C:
	:type C: Geom_Curve
	:param Tol:
	:type Tol: float
	:rtype: None") MakeEdge;
		void MakeEdge (TopoDS_Edge & E,const opencascade::handle<Geom_Curve> & C,const Standard_Real Tol);

		/****************** MakeEdge ******************/
		%feature("compactdefaultargs") MakeEdge;
		%feature("autodoc", "* Makes an Edge with a curve and a location.
	:param E:
	:type E: TopoDS_Edge
	:param C:
	:type C: Geom_Curve
	:param L:
	:type L: TopLoc_Location
	:param Tol:
	:type Tol: float
	:rtype: None") MakeEdge;
		void MakeEdge (TopoDS_Edge & E,const opencascade::handle<Geom_Curve> & C,const TopLoc_Location & L,const Standard_Real Tol);

		/****************** MakeEdge ******************/
		%feature("compactdefaultargs") MakeEdge;
		%feature("autodoc", "* Makes an Edge with a polygon 3d.
	:param E:
	:type E: TopoDS_Edge
	:param P:
	:type P: Poly_Polygon3D
	:rtype: None") MakeEdge;
		void MakeEdge (TopoDS_Edge & E,const opencascade::handle<Poly_Polygon3D> & P);

		/****************** MakeEdge ******************/
		%feature("compactdefaultargs") MakeEdge;
		%feature("autodoc", "* makes an Edge polygon on Triangulation.
	:param E:
	:type E: TopoDS_Edge
	:param N:
	:type N: Poly_PolygonOnTriangulation
	:param T:
	:type T: Poly_Triangulation
	:rtype: None") MakeEdge;
		void MakeEdge (TopoDS_Edge & E,const opencascade::handle<Poly_PolygonOnTriangulation> & N,const opencascade::handle<Poly_Triangulation> & T);

		/****************** MakeEdge ******************/
		%feature("compactdefaultargs") MakeEdge;
		%feature("autodoc", "* makes an Edge polygon on Triangulation.
	:param E:
	:type E: TopoDS_Edge
	:param N:
	:type N: Poly_PolygonOnTriangulation
	:param T:
	:type T: Poly_Triangulation
	:param L:
	:type L: TopLoc_Location
	:rtype: None") MakeEdge;
		void MakeEdge (TopoDS_Edge & E,const opencascade::handle<Poly_PolygonOnTriangulation> & N,const opencascade::handle<Poly_Triangulation> & T,const TopLoc_Location & L);

		/****************** MakeFace ******************/
		%feature("compactdefaultargs") MakeFace;
		%feature("autodoc", "* Makes an undefined Face.
	:param F:
	:type F: TopoDS_Face
	:rtype: None") MakeFace;
		void MakeFace (TopoDS_Face & F);

		/****************** MakeFace ******************/
		%feature("compactdefaultargs") MakeFace;
		%feature("autodoc", "* Makes a Face with a surface.
	:param F:
	:type F: TopoDS_Face
	:param S:
	:type S: Geom_Surface
	:param Tol:
	:type Tol: float
	:rtype: None") MakeFace;
		void MakeFace (TopoDS_Face & F,const opencascade::handle<Geom_Surface> & S,const Standard_Real Tol);

		/****************** MakeFace ******************/
		%feature("compactdefaultargs") MakeFace;
		%feature("autodoc", "* Makes a Face with a surface and a location.
	:param F:
	:type F: TopoDS_Face
	:param S:
	:type S: Geom_Surface
	:param L:
	:type L: TopLoc_Location
	:param Tol:
	:type Tol: float
	:rtype: None") MakeFace;
		void MakeFace (TopoDS_Face & F,const opencascade::handle<Geom_Surface> & S,const TopLoc_Location & L,const Standard_Real Tol);

		/****************** MakeFace ******************/
		%feature("compactdefaultargs") MakeFace;
		%feature("autodoc", "* Makes a Face with a triangulation. The triangulation is in the same reference system than the TFace.
	:param F:
	:type F: TopoDS_Face
	:param T:
	:type T: Poly_Triangulation
	:rtype: None") MakeFace;
		void MakeFace (TopoDS_Face & F,const opencascade::handle<Poly_Triangulation> & T);

		/****************** MakeVertex ******************/
		%feature("compactdefaultargs") MakeVertex;
		%feature("autodoc", "* Makes an udefined vertex without geometry.
	:param V:
	:type V: TopoDS_Vertex
	:rtype: None") MakeVertex;
		void MakeVertex (TopoDS_Vertex & V);

		/****************** MakeVertex ******************/
		%feature("compactdefaultargs") MakeVertex;
		%feature("autodoc", "* Makes a vertex from a 3D point.
	:param V:
	:type V: TopoDS_Vertex
	:param P:
	:type P: gp_Pnt
	:param Tol:
	:type Tol: float
	:rtype: None") MakeVertex;
		void MakeVertex (TopoDS_Vertex & V,const gp_Pnt & P,const Standard_Real Tol);

		/****************** NaturalRestriction ******************/
		%feature("compactdefaultargs") NaturalRestriction;
		%feature("autodoc", "* Sets the NaturalRestriction flag of the face.
	:param F:
	:type F: TopoDS_Face
	:param N:
	:type N: bool
	:rtype: None") NaturalRestriction;
		void NaturalRestriction (const TopoDS_Face & F,const Standard_Boolean N);

		/****************** Range ******************/
		%feature("compactdefaultargs") Range;
		%feature("autodoc", "* Sets the range of the 3d curve if Only3d=True, otherwise sets the range to all the representations
	:param E:
	:type E: TopoDS_Edge
	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:param Only3d: default value is Standard_False
	:type Only3d: bool
	:rtype: None") Range;
		void Range (const TopoDS_Edge & E,const Standard_Real First,const Standard_Real Last,const Standard_Boolean Only3d = Standard_False);

		/****************** Range ******************/
		%feature("compactdefaultargs") Range;
		%feature("autodoc", "* Sets the range of the edge on the pcurve on the surface.
	:param E:
	:type E: TopoDS_Edge
	:param S:
	:type S: Geom_Surface
	:param L:
	:type L: TopLoc_Location
	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:rtype: None") Range;
		void Range (const TopoDS_Edge & E,const opencascade::handle<Geom_Surface> & S,const TopLoc_Location & L,const Standard_Real First,const Standard_Real Last);

		/****************** Range ******************/
		%feature("compactdefaultargs") Range;
		%feature("autodoc", "* Sets the range of the edge on the pcurve on the face.
	:param E:
	:type E: TopoDS_Edge
	:param F:
	:type F: TopoDS_Face
	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:rtype: None") Range;
		void Range (const TopoDS_Edge & E,const TopoDS_Face & F,const Standard_Real First,const Standard_Real Last);

		/****************** SameParameter ******************/
		%feature("compactdefaultargs") SameParameter;
		%feature("autodoc", "* Sets the same parameter flag for the edge <E>.
	:param E:
	:type E: TopoDS_Edge
	:param S:
	:type S: bool
	:rtype: None") SameParameter;
		void SameParameter (const TopoDS_Edge & E,const Standard_Boolean S);

		/****************** SameRange ******************/
		%feature("compactdefaultargs") SameRange;
		%feature("autodoc", "* Sets the same range flag for the edge <E>.
	:param E:
	:type E: TopoDS_Edge
	:param S:
	:type S: bool
	:rtype: None") SameRange;
		void SameRange (const TopoDS_Edge & E,const Standard_Boolean S);

		/****************** Transfert ******************/
		%feature("compactdefaultargs") Transfert;
		%feature("autodoc", "* Add to <Eout> the geometric representations of <Ein>.
	:param Ein:
	:type Ein: TopoDS_Edge
	:param Eout:
	:type Eout: TopoDS_Edge
	:rtype: None") Transfert;
		void Transfert (const TopoDS_Edge & Ein,const TopoDS_Edge & Eout);

		/****************** Transfert ******************/
		%feature("compactdefaultargs") Transfert;
		%feature("autodoc", "* Transfert the parameters of Vin on Ein as the parameter of Vout on Eout.
	:param Ein:
	:type Ein: TopoDS_Edge
	:param Eout:
	:type Eout: TopoDS_Edge
	:param Vin:
	:type Vin: TopoDS_Vertex
	:param Vout:
	:type Vout: TopoDS_Vertex
	:rtype: None") Transfert;
		void Transfert (const TopoDS_Edge & Ein,const TopoDS_Edge & Eout,const TopoDS_Vertex & Vin,const TopoDS_Vertex & Vout);

		/****************** UpdateEdge ******************/
		%feature("compactdefaultargs") UpdateEdge;
		%feature("autodoc", "* Sets a 3D curve for the edge. If <C> is a null handle, remove any existing 3d curve.
	:param E:
	:type E: TopoDS_Edge
	:param C:
	:type C: Geom_Curve
	:param Tol:
	:type Tol: float
	:rtype: None") UpdateEdge;
		void UpdateEdge (const TopoDS_Edge & E,const opencascade::handle<Geom_Curve> & C,const Standard_Real Tol);

		/****************** UpdateEdge ******************/
		%feature("compactdefaultargs") UpdateEdge;
		%feature("autodoc", "* Sets a 3D curve for the edge. If <C> is a null handle, remove any existing 3d curve.
	:param E:
	:type E: TopoDS_Edge
	:param C:
	:type C: Geom_Curve
	:param L:
	:type L: TopLoc_Location
	:param Tol:
	:type Tol: float
	:rtype: None") UpdateEdge;
		void UpdateEdge (const TopoDS_Edge & E,const opencascade::handle<Geom_Curve> & C,const TopLoc_Location & L,const Standard_Real Tol);

		/****************** UpdateEdge ******************/
		%feature("compactdefaultargs") UpdateEdge;
		%feature("autodoc", "* Sets a pcurve for the edge on the face. If <C> is a null handle, remove any existing pcurve.
	:param E:
	:type E: TopoDS_Edge
	:param C:
	:type C: Geom2d_Curve
	:param F:
	:type F: TopoDS_Face
	:param Tol:
	:type Tol: float
	:rtype: None") UpdateEdge;
		void UpdateEdge (const TopoDS_Edge & E,const opencascade::handle<Geom2d_Curve> & C,const TopoDS_Face & F,const Standard_Real Tol);

		/****************** UpdateEdge ******************/
		%feature("compactdefaultargs") UpdateEdge;
		%feature("autodoc", "* Sets pcurves for the edge on the closed face. If <C1> or <C2> is a null handle, remove any existing pcurve.
	:param E:
	:type E: TopoDS_Edge
	:param C1:
	:type C1: Geom2d_Curve
	:param C2:
	:type C2: Geom2d_Curve
	:param F:
	:type F: TopoDS_Face
	:param Tol:
	:type Tol: float
	:rtype: None") UpdateEdge;
		void UpdateEdge (const TopoDS_Edge & E,const opencascade::handle<Geom2d_Curve> & C1,const opencascade::handle<Geom2d_Curve> & C2,const TopoDS_Face & F,const Standard_Real Tol);

		/****************** UpdateEdge ******************/
		%feature("compactdefaultargs") UpdateEdge;
		%feature("autodoc", "* Sets a pcurve for the edge on the face. If <C> is a null handle, remove any existing pcurve.
	:param E:
	:type E: TopoDS_Edge
	:param C:
	:type C: Geom2d_Curve
	:param S:
	:type S: Geom_Surface
	:param L:
	:type L: TopLoc_Location
	:param Tol:
	:type Tol: float
	:rtype: None") UpdateEdge;
		void UpdateEdge (const TopoDS_Edge & E,const opencascade::handle<Geom2d_Curve> & C,const opencascade::handle<Geom_Surface> & S,const TopLoc_Location & L,const Standard_Real Tol);

		/****************** UpdateEdge ******************/
		%feature("compactdefaultargs") UpdateEdge;
		%feature("autodoc", "* Sets a pcurve for the edge on the face. If <C> is a null handle, remove any existing pcurve. Sets UV bounds for curve repsentation
	:param E:
	:type E: TopoDS_Edge
	:param C:
	:type C: Geom2d_Curve
	:param S:
	:type S: Geom_Surface
	:param L:
	:type L: TopLoc_Location
	:param Tol:
	:type Tol: float
	:param Pf:
	:type Pf: gp_Pnt2d
	:param Pl:
	:type Pl: gp_Pnt2d
	:rtype: None") UpdateEdge;
		void UpdateEdge (const TopoDS_Edge & E,const opencascade::handle<Geom2d_Curve> & C,const opencascade::handle<Geom_Surface> & S,const TopLoc_Location & L,const Standard_Real Tol,const gp_Pnt2d & Pf,const gp_Pnt2d & Pl);

		/****************** UpdateEdge ******************/
		%feature("compactdefaultargs") UpdateEdge;
		%feature("autodoc", "* Sets pcurves for the edge on the closed surface. <C1> or <C2> is a null handle, remove any existing pcurve.
	:param E:
	:type E: TopoDS_Edge
	:param C1:
	:type C1: Geom2d_Curve
	:param C2:
	:type C2: Geom2d_Curve
	:param S:
	:type S: Geom_Surface
	:param L:
	:type L: TopLoc_Location
	:param Tol:
	:type Tol: float
	:rtype: None") UpdateEdge;
		void UpdateEdge (const TopoDS_Edge & E,const opencascade::handle<Geom2d_Curve> & C1,const opencascade::handle<Geom2d_Curve> & C2,const opencascade::handle<Geom_Surface> & S,const TopLoc_Location & L,const Standard_Real Tol);

		/****************** UpdateEdge ******************/
		%feature("compactdefaultargs") UpdateEdge;
		%feature("autodoc", "* Sets pcurves for the edge on the closed surface. <C1> or <C2> is a null handle, remove any existing pcurve. Sets UV bounds for curve repsentation
	:param E:
	:type E: TopoDS_Edge
	:param C1:
	:type C1: Geom2d_Curve
	:param C2:
	:type C2: Geom2d_Curve
	:param S:
	:type S: Geom_Surface
	:param L:
	:type L: TopLoc_Location
	:param Tol:
	:type Tol: float
	:param Pf:
	:type Pf: gp_Pnt2d
	:param Pl:
	:type Pl: gp_Pnt2d
	:rtype: None") UpdateEdge;
		void UpdateEdge (const TopoDS_Edge & E,const opencascade::handle<Geom2d_Curve> & C1,const opencascade::handle<Geom2d_Curve> & C2,const opencascade::handle<Geom_Surface> & S,const TopLoc_Location & L,const Standard_Real Tol,const gp_Pnt2d & Pf,const gp_Pnt2d & Pl);

		/****************** UpdateEdge ******************/
		%feature("compactdefaultargs") UpdateEdge;
		%feature("autodoc", "* Changes an Edge 3D polygon. A null Polygon removes the 3d Polygon.
	:param E:
	:type E: TopoDS_Edge
	:param P:
	:type P: Poly_Polygon3D
	:rtype: None") UpdateEdge;
		void UpdateEdge (const TopoDS_Edge & E,const opencascade::handle<Poly_Polygon3D> & P);

		/****************** UpdateEdge ******************/
		%feature("compactdefaultargs") UpdateEdge;
		%feature("autodoc", "* Changes an Edge 3D polygon. A null Polygon removes the 3d Polygon.
	:param E:
	:type E: TopoDS_Edge
	:param P:
	:type P: Poly_Polygon3D
	:param L:
	:type L: TopLoc_Location
	:rtype: None") UpdateEdge;
		void UpdateEdge (const TopoDS_Edge & E,const opencascade::handle<Poly_Polygon3D> & P,const TopLoc_Location & L);

		/****************** UpdateEdge ******************/
		%feature("compactdefaultargs") UpdateEdge;
		%feature("autodoc", "* Changes an Edge polygon on Triangulation.
	:param E:
	:type E: TopoDS_Edge
	:param N:
	:type N: Poly_PolygonOnTriangulation
	:param T:
	:type T: Poly_Triangulation
	:rtype: None") UpdateEdge;
		void UpdateEdge (const TopoDS_Edge & E,const opencascade::handle<Poly_PolygonOnTriangulation> & N,const opencascade::handle<Poly_Triangulation> & T);

		/****************** UpdateEdge ******************/
		%feature("compactdefaultargs") UpdateEdge;
		%feature("autodoc", "* Changes an Edge polygon on Triangulation.
	:param E:
	:type E: TopoDS_Edge
	:param N:
	:type N: Poly_PolygonOnTriangulation
	:param T:
	:type T: Poly_Triangulation
	:param L:
	:type L: TopLoc_Location
	:rtype: None") UpdateEdge;
		void UpdateEdge (const TopoDS_Edge & E,const opencascade::handle<Poly_PolygonOnTriangulation> & N,const opencascade::handle<Poly_Triangulation> & T,const TopLoc_Location & L);

		/****************** UpdateEdge ******************/
		%feature("compactdefaultargs") UpdateEdge;
		%feature("autodoc", "* Changes an Edge polygon on Triangulation.
	:param E:
	:type E: TopoDS_Edge
	:param N1:
	:type N1: Poly_PolygonOnTriangulation
	:param N2:
	:type N2: Poly_PolygonOnTriangulation
	:param T:
	:type T: Poly_Triangulation
	:rtype: None") UpdateEdge;
		void UpdateEdge (const TopoDS_Edge & E,const opencascade::handle<Poly_PolygonOnTriangulation> & N1,const opencascade::handle<Poly_PolygonOnTriangulation> & N2,const opencascade::handle<Poly_Triangulation> & T);

		/****************** UpdateEdge ******************/
		%feature("compactdefaultargs") UpdateEdge;
		%feature("autodoc", "* Changes an Edge polygon on Triangulation.
	:param E:
	:type E: TopoDS_Edge
	:param N1:
	:type N1: Poly_PolygonOnTriangulation
	:param N2:
	:type N2: Poly_PolygonOnTriangulation
	:param T:
	:type T: Poly_Triangulation
	:param L:
	:type L: TopLoc_Location
	:rtype: None") UpdateEdge;
		void UpdateEdge (const TopoDS_Edge & E,const opencascade::handle<Poly_PolygonOnTriangulation> & N1,const opencascade::handle<Poly_PolygonOnTriangulation> & N2,const opencascade::handle<Poly_Triangulation> & T,const TopLoc_Location & L);

		/****************** UpdateEdge ******************/
		%feature("compactdefaultargs") UpdateEdge;
		%feature("autodoc", "* Changes Edge polygon on a face.
	:param E:
	:type E: TopoDS_Edge
	:param P:
	:type P: Poly_Polygon2D
	:param S:
	:type S: TopoDS_Face
	:rtype: None") UpdateEdge;
		void UpdateEdge (const TopoDS_Edge & E,const opencascade::handle<Poly_Polygon2D> & P,const TopoDS_Face & S);

		/****************** UpdateEdge ******************/
		%feature("compactdefaultargs") UpdateEdge;
		%feature("autodoc", "* Changes Edge polygon on a face.
	:param E:
	:type E: TopoDS_Edge
	:param P:
	:type P: Poly_Polygon2D
	:param S:
	:type S: Geom_Surface
	:param T:
	:type T: TopLoc_Location
	:rtype: None") UpdateEdge;
		void UpdateEdge (const TopoDS_Edge & E,const opencascade::handle<Poly_Polygon2D> & P,const opencascade::handle<Geom_Surface> & S,const TopLoc_Location & T);

		/****************** UpdateEdge ******************/
		%feature("compactdefaultargs") UpdateEdge;
		%feature("autodoc", "* Changes Edge polygons on a face. //! A null Polygon removes the 2d Polygon.
	:param E:
	:type E: TopoDS_Edge
	:param P1:
	:type P1: Poly_Polygon2D
	:param P2:
	:type P2: Poly_Polygon2D
	:param S:
	:type S: TopoDS_Face
	:rtype: None") UpdateEdge;
		void UpdateEdge (const TopoDS_Edge & E,const opencascade::handle<Poly_Polygon2D> & P1,const opencascade::handle<Poly_Polygon2D> & P2,const TopoDS_Face & S);

		/****************** UpdateEdge ******************/
		%feature("compactdefaultargs") UpdateEdge;
		%feature("autodoc", "* Changes Edge polygons on a face. //! A null Polygon removes the 2d Polygon.
	:param E:
	:type E: TopoDS_Edge
	:param P1:
	:type P1: Poly_Polygon2D
	:param P2:
	:type P2: Poly_Polygon2D
	:param S:
	:type S: Geom_Surface
	:param L:
	:type L: TopLoc_Location
	:rtype: None") UpdateEdge;
		void UpdateEdge (const TopoDS_Edge & E,const opencascade::handle<Poly_Polygon2D> & P1,const opencascade::handle<Poly_Polygon2D> & P2,const opencascade::handle<Geom_Surface> & S,const TopLoc_Location & L);

		/****************** UpdateEdge ******************/
		%feature("compactdefaultargs") UpdateEdge;
		%feature("autodoc", "* Updates the edge tolerance.
	:param E:
	:type E: TopoDS_Edge
	:param Tol:
	:type Tol: float
	:rtype: None") UpdateEdge;
		void UpdateEdge (const TopoDS_Edge & E,const Standard_Real Tol);

		/****************** UpdateFace ******************/
		%feature("compactdefaultargs") UpdateFace;
		%feature("autodoc", "* Updates the face F using the tolerance value Tol, surface S and location Location.
	:param F:
	:type F: TopoDS_Face
	:param S:
	:type S: Geom_Surface
	:param L:
	:type L: TopLoc_Location
	:param Tol:
	:type Tol: float
	:rtype: None") UpdateFace;
		void UpdateFace (const TopoDS_Face & F,const opencascade::handle<Geom_Surface> & S,const TopLoc_Location & L,const Standard_Real Tol);

		/****************** UpdateFace ******************/
		%feature("compactdefaultargs") UpdateFace;
		%feature("autodoc", "* Changes a face triangulation. //! A null Triangulation removes the triangulation.
	:param F:
	:type F: TopoDS_Face
	:param T:
	:type T: Poly_Triangulation
	:rtype: None") UpdateFace;
		void UpdateFace (const TopoDS_Face & F,const opencascade::handle<Poly_Triangulation> & T);

		/****************** UpdateFace ******************/
		%feature("compactdefaultargs") UpdateFace;
		%feature("autodoc", "* Updates the face Tolerance.
	:param F:
	:type F: TopoDS_Face
	:param Tol:
	:type Tol: float
	:rtype: None") UpdateFace;
		void UpdateFace (const TopoDS_Face & F,const Standard_Real Tol);

		/****************** UpdateVertex ******************/
		%feature("compactdefaultargs") UpdateVertex;
		%feature("autodoc", "* Sets a 3D point on the vertex.
	:param V:
	:type V: TopoDS_Vertex
	:param P:
	:type P: gp_Pnt
	:param Tol:
	:type Tol: float
	:rtype: None") UpdateVertex;
		void UpdateVertex (const TopoDS_Vertex & V,const gp_Pnt & P,const Standard_Real Tol);

		/****************** UpdateVertex ******************/
		%feature("compactdefaultargs") UpdateVertex;
		%feature("autodoc", "* Sets the parameter for the vertex on the edge curves.
	:param V:
	:type V: TopoDS_Vertex
	:param P:
	:type P: float
	:param E:
	:type E: TopoDS_Edge
	:param Tol:
	:type Tol: float
	:rtype: None") UpdateVertex;
		void UpdateVertex (const TopoDS_Vertex & V,const Standard_Real P,const TopoDS_Edge & E,const Standard_Real Tol);

		/****************** UpdateVertex ******************/
		%feature("compactdefaultargs") UpdateVertex;
		%feature("autodoc", "* Sets the parameter for the vertex on the edge pcurve on the face.
	:param V:
	:type V: TopoDS_Vertex
	:param P:
	:type P: float
	:param E:
	:type E: TopoDS_Edge
	:param F:
	:type F: TopoDS_Face
	:param Tol:
	:type Tol: float
	:rtype: None") UpdateVertex;
		void UpdateVertex (const TopoDS_Vertex & V,const Standard_Real P,const TopoDS_Edge & E,const TopoDS_Face & F,const Standard_Real Tol);

		/****************** UpdateVertex ******************/
		%feature("compactdefaultargs") UpdateVertex;
		%feature("autodoc", "* Sets the parameter for the vertex on the edge pcurve on the surface.
	:param V:
	:type V: TopoDS_Vertex
	:param P:
	:type P: float
	:param E:
	:type E: TopoDS_Edge
	:param S:
	:type S: Geom_Surface
	:param L:
	:type L: TopLoc_Location
	:param Tol:
	:type Tol: float
	:rtype: None") UpdateVertex;
		void UpdateVertex (const TopoDS_Vertex & V,const Standard_Real P,const TopoDS_Edge & E,const opencascade::handle<Geom_Surface> & S,const TopLoc_Location & L,const Standard_Real Tol);

		/****************** UpdateVertex ******************/
		%feature("compactdefaultargs") UpdateVertex;
		%feature("autodoc", "* Sets the parameters for the vertex on the face.
	:param Ve:
	:type Ve: TopoDS_Vertex
	:param U:
	:type U: float
	:param V:
	:type V: float
	:param F:
	:type F: TopoDS_Face
	:param Tol:
	:type Tol: float
	:rtype: None") UpdateVertex;
		void UpdateVertex (const TopoDS_Vertex & Ve,const Standard_Real U,const Standard_Real V,const TopoDS_Face & F,const Standard_Real Tol);

		/****************** UpdateVertex ******************/
		%feature("compactdefaultargs") UpdateVertex;
		%feature("autodoc", "* Updates the vertex tolerance.
	:param V:
	:type V: TopoDS_Vertex
	:param Tol:
	:type Tol: float
	:rtype: None") UpdateVertex;
		void UpdateVertex (const TopoDS_Vertex & V,const Standard_Real Tol);

};


%extend BRep_Builder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class BRep_CurveRepresentation *
*********************************/
%nodefaultctor BRep_CurveRepresentation;
class BRep_CurveRepresentation : public Standard_Transient {
	public:
		/****************** Continuity ******************/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", ":rtype: GeomAbs_Shape") Continuity;
		virtual const GeomAbs_Shape & Continuity ();

		/****************** Continuity ******************/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", ":param C:
	:type C: GeomAbs_Shape
	:rtype: void") Continuity;
		virtual void Continuity (const GeomAbs_Shape C);

		/****************** Copy ******************/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "* Return a copy of this representation.
	:rtype: opencascade::handle<BRep_CurveRepresentation>") Copy;
		virtual opencascade::handle<BRep_CurveRepresentation> Copy ();

		/****************** Curve3D ******************/
		%feature("compactdefaultargs") Curve3D;
		%feature("autodoc", ":rtype: opencascade::handle<Geom_Curve>") Curve3D;
		virtual const opencascade::handle<Geom_Curve> & Curve3D ();

		/****************** Curve3D ******************/
		%feature("compactdefaultargs") Curve3D;
		%feature("autodoc", ":param C:
	:type C: Geom_Curve
	:rtype: void") Curve3D;
		virtual void Curve3D (const opencascade::handle<Geom_Curve> & C);

		/****************** IsCurve3D ******************/
		%feature("compactdefaultargs") IsCurve3D;
		%feature("autodoc", "* A 3D curve representation.
	:rtype: bool") IsCurve3D;
		virtual Standard_Boolean IsCurve3D ();

		/****************** IsCurveOnClosedSurface ******************/
		%feature("compactdefaultargs") IsCurveOnClosedSurface;
		%feature("autodoc", "* A curve with two parametric curves on the same surface.
	:rtype: bool") IsCurveOnClosedSurface;
		virtual Standard_Boolean IsCurveOnClosedSurface ();

		/****************** IsCurveOnSurface ******************/
		%feature("compactdefaultargs") IsCurveOnSurface;
		%feature("autodoc", "* A curve in the parametric space of a surface.
	:rtype: bool") IsCurveOnSurface;
		virtual Standard_Boolean IsCurveOnSurface ();

		/****************** IsCurveOnSurface ******************/
		%feature("compactdefaultargs") IsCurveOnSurface;
		%feature("autodoc", "* Is it a curve in the parametric space of <S> with location <L>.
	:param S:
	:type S: Geom_Surface
	:param L:
	:type L: TopLoc_Location
	:rtype: bool") IsCurveOnSurface;
		virtual Standard_Boolean IsCurveOnSurface (const opencascade::handle<Geom_Surface> & S,const TopLoc_Location & L);

		/****************** IsPolygon3D ******************/
		%feature("compactdefaultargs") IsPolygon3D;
		%feature("autodoc", "* A 3D polygon representation.
	:rtype: bool") IsPolygon3D;
		virtual Standard_Boolean IsPolygon3D ();

		/****************** IsPolygonOnClosedSurface ******************/
		%feature("compactdefaultargs") IsPolygonOnClosedSurface;
		%feature("autodoc", "* Two 2D polygon representations in the parametric space of a surface.
	:rtype: bool") IsPolygonOnClosedSurface;
		virtual Standard_Boolean IsPolygonOnClosedSurface ();

		/****************** IsPolygonOnClosedTriangulation ******************/
		%feature("compactdefaultargs") IsPolygonOnClosedTriangulation;
		%feature("autodoc", "* A representation by two arrays of nodes on a triangulation.
	:rtype: bool") IsPolygonOnClosedTriangulation;
		virtual Standard_Boolean IsPolygonOnClosedTriangulation ();

		/****************** IsPolygonOnSurface ******************/
		%feature("compactdefaultargs") IsPolygonOnSurface;
		%feature("autodoc", "* A polygon in the parametric space of a surface.
	:rtype: bool") IsPolygonOnSurface;
		virtual Standard_Boolean IsPolygonOnSurface ();

		/****************** IsPolygonOnSurface ******************/
		%feature("compactdefaultargs") IsPolygonOnSurface;
		%feature("autodoc", "* Is it a polygon in the parametric space of <S> with location <L>.
	:param S:
	:type S: Geom_Surface
	:param L:
	:type L: TopLoc_Location
	:rtype: bool") IsPolygonOnSurface;
		virtual Standard_Boolean IsPolygonOnSurface (const opencascade::handle<Geom_Surface> & S,const TopLoc_Location & L);

		/****************** IsPolygonOnTriangulation ******************/
		%feature("compactdefaultargs") IsPolygonOnTriangulation;
		%feature("autodoc", "* A representation by an array of nodes on a triangulation.
	:rtype: bool") IsPolygonOnTriangulation;
		virtual Standard_Boolean IsPolygonOnTriangulation ();

		/****************** IsPolygonOnTriangulation ******************/
		%feature("compactdefaultargs") IsPolygonOnTriangulation;
		%feature("autodoc", "* Is it a polygon in the definition of <T> with location <L>.
	:param T:
	:type T: Poly_Triangulation
	:param L:
	:type L: TopLoc_Location
	:rtype: bool") IsPolygonOnTriangulation;
		virtual Standard_Boolean IsPolygonOnTriangulation (const opencascade::handle<Poly_Triangulation> & T,const TopLoc_Location & L);

		/****************** IsRegularity ******************/
		%feature("compactdefaultargs") IsRegularity;
		%feature("autodoc", "* A continuity between two surfaces.
	:rtype: bool") IsRegularity;
		virtual Standard_Boolean IsRegularity ();

		/****************** IsRegularity ******************/
		%feature("compactdefaultargs") IsRegularity;
		%feature("autodoc", "* Is it a regularity between <S1> and <S2> with location <L1> and <L2>.
	:param S1:
	:type S1: Geom_Surface
	:param S2:
	:type S2: Geom_Surface
	:param L1:
	:type L1: TopLoc_Location
	:param L2:
	:type L2: TopLoc_Location
	:rtype: bool") IsRegularity;
		virtual Standard_Boolean IsRegularity (const opencascade::handle<Geom_Surface> & S1,const opencascade::handle<Geom_Surface> & S2,const TopLoc_Location & L1,const TopLoc_Location & L2);

		/****************** Location ******************/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", ":rtype: TopLoc_Location") Location;
		const TopLoc_Location & Location ();

		/****************** Location ******************/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", ":param L:
	:type L: TopLoc_Location
	:rtype: None") Location;
		void Location (const TopLoc_Location & L);

		/****************** Location2 ******************/
		%feature("compactdefaultargs") Location2;
		%feature("autodoc", ":rtype: TopLoc_Location") Location2;
		virtual const TopLoc_Location & Location2 ();

		/****************** PCurve ******************/
		%feature("compactdefaultargs") PCurve;
		%feature("autodoc", ":rtype: opencascade::handle<Geom2d_Curve>") PCurve;
		virtual const opencascade::handle<Geom2d_Curve> & PCurve ();

		/****************** PCurve ******************/
		%feature("compactdefaultargs") PCurve;
		%feature("autodoc", ":param C:
	:type C: Geom2d_Curve
	:rtype: void") PCurve;
		virtual void PCurve (const opencascade::handle<Geom2d_Curve> & C);

		/****************** PCurve2 ******************/
		%feature("compactdefaultargs") PCurve2;
		%feature("autodoc", ":rtype: opencascade::handle<Geom2d_Curve>") PCurve2;
		virtual const opencascade::handle<Geom2d_Curve> & PCurve2 ();

		/****************** PCurve2 ******************/
		%feature("compactdefaultargs") PCurve2;
		%feature("autodoc", ":param C:
	:type C: Geom2d_Curve
	:rtype: void") PCurve2;
		virtual void PCurve2 (const opencascade::handle<Geom2d_Curve> & C);

		/****************** Polygon ******************/
		%feature("compactdefaultargs") Polygon;
		%feature("autodoc", ":rtype: opencascade::handle<Poly_Polygon2D>") Polygon;
		virtual const opencascade::handle<Poly_Polygon2D> & Polygon ();

		/****************** Polygon ******************/
		%feature("compactdefaultargs") Polygon;
		%feature("autodoc", ":param P:
	:type P: Poly_Polygon2D
	:rtype: void") Polygon;
		virtual void Polygon (const opencascade::handle<Poly_Polygon2D> & P);

		/****************** Polygon2 ******************/
		%feature("compactdefaultargs") Polygon2;
		%feature("autodoc", ":rtype: opencascade::handle<Poly_Polygon2D>") Polygon2;
		virtual const opencascade::handle<Poly_Polygon2D> & Polygon2 ();

		/****************** Polygon2 ******************/
		%feature("compactdefaultargs") Polygon2;
		%feature("autodoc", ":param P:
	:type P: Poly_Polygon2D
	:rtype: void") Polygon2;
		virtual void Polygon2 (const opencascade::handle<Poly_Polygon2D> & P);

		/****************** Polygon3D ******************/
		%feature("compactdefaultargs") Polygon3D;
		%feature("autodoc", ":rtype: opencascade::handle<Poly_Polygon3D>") Polygon3D;
		virtual const opencascade::handle<Poly_Polygon3D> & Polygon3D ();

		/****************** Polygon3D ******************/
		%feature("compactdefaultargs") Polygon3D;
		%feature("autodoc", ":param P:
	:type P: Poly_Polygon3D
	:rtype: void") Polygon3D;
		virtual void Polygon3D (const opencascade::handle<Poly_Polygon3D> & P);

		/****************** PolygonOnTriangulation ******************/
		%feature("compactdefaultargs") PolygonOnTriangulation;
		%feature("autodoc", ":rtype: opencascade::handle<Poly_PolygonOnTriangulation>") PolygonOnTriangulation;
		virtual const opencascade::handle<Poly_PolygonOnTriangulation> & PolygonOnTriangulation ();

		/****************** PolygonOnTriangulation ******************/
		%feature("compactdefaultargs") PolygonOnTriangulation;
		%feature("autodoc", ":param P:
	:type P: Poly_PolygonOnTriangulation
	:rtype: void") PolygonOnTriangulation;
		virtual void PolygonOnTriangulation (const opencascade::handle<Poly_PolygonOnTriangulation> & P);

		/****************** PolygonOnTriangulation2 ******************/
		%feature("compactdefaultargs") PolygonOnTriangulation2;
		%feature("autodoc", ":rtype: opencascade::handle<Poly_PolygonOnTriangulation>") PolygonOnTriangulation2;
		virtual const opencascade::handle<Poly_PolygonOnTriangulation> & PolygonOnTriangulation2 ();

		/****************** PolygonOnTriangulation2 ******************/
		%feature("compactdefaultargs") PolygonOnTriangulation2;
		%feature("autodoc", ":param P2:
	:type P2: Poly_PolygonOnTriangulation
	:rtype: void") PolygonOnTriangulation2;
		virtual void PolygonOnTriangulation2 (const opencascade::handle<Poly_PolygonOnTriangulation> & P2);

		/****************** Surface ******************/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", ":rtype: opencascade::handle<Geom_Surface>") Surface;
		virtual const opencascade::handle<Geom_Surface> & Surface ();

		/****************** Surface2 ******************/
		%feature("compactdefaultargs") Surface2;
		%feature("autodoc", ":rtype: opencascade::handle<Geom_Surface>") Surface2;
		virtual const opencascade::handle<Geom_Surface> & Surface2 ();

		/****************** Triangulation ******************/
		%feature("compactdefaultargs") Triangulation;
		%feature("autodoc", ":rtype: opencascade::handle<Poly_Triangulation>") Triangulation;
		virtual const opencascade::handle<Poly_Triangulation> & Triangulation ();

};


%make_alias(BRep_CurveRepresentation)

%extend BRep_CurveRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class BRep_PointRepresentation *
*********************************/
%nodefaultctor BRep_PointRepresentation;
class BRep_PointRepresentation : public Standard_Transient {
	public:
		/****************** Curve ******************/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", ":rtype: opencascade::handle<Geom_Curve>") Curve;
		virtual const opencascade::handle<Geom_Curve> & Curve ();

		/****************** Curve ******************/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", ":param C:
	:type C: Geom_Curve
	:rtype: void") Curve;
		virtual void Curve (const opencascade::handle<Geom_Curve> & C);

		/****************** IsPointOnCurve ******************/
		%feature("compactdefaultargs") IsPointOnCurve;
		%feature("autodoc", "* A point on a 3d curve.
	:rtype: bool") IsPointOnCurve;
		virtual Standard_Boolean IsPointOnCurve ();

		/****************** IsPointOnCurve ******************/
		%feature("compactdefaultargs") IsPointOnCurve;
		%feature("autodoc", "* A point on the curve <C>.
	:param C:
	:type C: Geom_Curve
	:param L:
	:type L: TopLoc_Location
	:rtype: bool") IsPointOnCurve;
		virtual Standard_Boolean IsPointOnCurve (const opencascade::handle<Geom_Curve> & C,const TopLoc_Location & L);

		/****************** IsPointOnCurveOnSurface ******************/
		%feature("compactdefaultargs") IsPointOnCurveOnSurface;
		%feature("autodoc", "* A point on a 2d curve on a surface.
	:rtype: bool") IsPointOnCurveOnSurface;
		virtual Standard_Boolean IsPointOnCurveOnSurface ();

		/****************** IsPointOnCurveOnSurface ******************/
		%feature("compactdefaultargs") IsPointOnCurveOnSurface;
		%feature("autodoc", "* A point on the 2d curve <PC> on the surface <S>.
	:param PC:
	:type PC: Geom2d_Curve
	:param S:
	:type S: Geom_Surface
	:param L:
	:type L: TopLoc_Location
	:rtype: bool") IsPointOnCurveOnSurface;
		virtual Standard_Boolean IsPointOnCurveOnSurface (const opencascade::handle<Geom2d_Curve> & PC,const opencascade::handle<Geom_Surface> & S,const TopLoc_Location & L);

		/****************** IsPointOnSurface ******************/
		%feature("compactdefaultargs") IsPointOnSurface;
		%feature("autodoc", "* A point on a surface.
	:rtype: bool") IsPointOnSurface;
		virtual Standard_Boolean IsPointOnSurface ();

		/****************** IsPointOnSurface ******************/
		%feature("compactdefaultargs") IsPointOnSurface;
		%feature("autodoc", "* A point on the surface <S>.
	:param S:
	:type S: Geom_Surface
	:param L:
	:type L: TopLoc_Location
	:rtype: bool") IsPointOnSurface;
		virtual Standard_Boolean IsPointOnSurface (const opencascade::handle<Geom_Surface> & S,const TopLoc_Location & L);

		/****************** Location ******************/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", ":rtype: TopLoc_Location") Location;
		const TopLoc_Location & Location ();

		/****************** Location ******************/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", ":param L:
	:type L: TopLoc_Location
	:rtype: None") Location;
		void Location (const TopLoc_Location & L);

		/****************** PCurve ******************/
		%feature("compactdefaultargs") PCurve;
		%feature("autodoc", ":rtype: opencascade::handle<Geom2d_Curve>") PCurve;
		virtual const opencascade::handle<Geom2d_Curve> & PCurve ();

		/****************** PCurve ******************/
		%feature("compactdefaultargs") PCurve;
		%feature("autodoc", ":param C:
	:type C: Geom2d_Curve
	:rtype: void") PCurve;
		virtual void PCurve (const opencascade::handle<Geom2d_Curve> & C);

		/****************** Parameter ******************/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", ":rtype: float") Parameter;
		Standard_Real Parameter ();

		/****************** Parameter ******************/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", ":param P:
	:type P: float
	:rtype: None") Parameter;
		void Parameter (const Standard_Real P);

		/****************** Parameter2 ******************/
		%feature("compactdefaultargs") Parameter2;
		%feature("autodoc", ":rtype: float") Parameter2;
		virtual Standard_Real Parameter2 ();

		/****************** Parameter2 ******************/
		%feature("compactdefaultargs") Parameter2;
		%feature("autodoc", ":param P:
	:type P: float
	:rtype: void") Parameter2;
		virtual void Parameter2 (const Standard_Real P);

		/****************** Surface ******************/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", ":rtype: opencascade::handle<Geom_Surface>") Surface;
		virtual const opencascade::handle<Geom_Surface> & Surface ();

		/****************** Surface ******************/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", ":param S:
	:type S: Geom_Surface
	:rtype: void") Surface;
		virtual void Surface (const opencascade::handle<Geom_Surface> & S);

};


%make_alias(BRep_PointRepresentation)

%extend BRep_PointRepresentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************
* class BRep_TEdge *
*******************/
class BRep_TEdge : public TopoDS_TEdge {
	public:
		/****************** BRep_TEdge ******************/
		%feature("compactdefaultargs") BRep_TEdge;
		%feature("autodoc", "* Creates an empty TEdge.
	:rtype: None") BRep_TEdge;
		 BRep_TEdge ();

		/****************** ChangeCurves ******************/
		%feature("compactdefaultargs") ChangeCurves;
		%feature("autodoc", ":rtype: BRep_ListOfCurveRepresentation") ChangeCurves;
		BRep_ListOfCurveRepresentation & ChangeCurves ();

		/****************** Curves ******************/
		%feature("compactdefaultargs") Curves;
		%feature("autodoc", ":rtype: BRep_ListOfCurveRepresentation") Curves;
		const BRep_ListOfCurveRepresentation & Curves ();

		/****************** Degenerated ******************/
		%feature("compactdefaultargs") Degenerated;
		%feature("autodoc", ":rtype: bool") Degenerated;
		Standard_Boolean Degenerated ();

		/****************** Degenerated ******************/
		%feature("compactdefaultargs") Degenerated;
		%feature("autodoc", ":param S:
	:type S: bool
	:rtype: None") Degenerated;
		void Degenerated (const Standard_Boolean S);

		/****************** EmptyCopy ******************/
		%feature("compactdefaultargs") EmptyCopy;
		%feature("autodoc", "* Returns a copy of the TShape with no sub-shapes.
	:rtype: opencascade::handle<TopoDS_TShape>") EmptyCopy;
		opencascade::handle<TopoDS_TShape> EmptyCopy ();

		/****************** SameParameter ******************/
		%feature("compactdefaultargs") SameParameter;
		%feature("autodoc", ":rtype: bool") SameParameter;
		Standard_Boolean SameParameter ();

		/****************** SameParameter ******************/
		%feature("compactdefaultargs") SameParameter;
		%feature("autodoc", ":param S:
	:type S: bool
	:rtype: None") SameParameter;
		void SameParameter (const Standard_Boolean S);

		/****************** SameRange ******************/
		%feature("compactdefaultargs") SameRange;
		%feature("autodoc", ":rtype: bool") SameRange;
		Standard_Boolean SameRange ();

		/****************** SameRange ******************/
		%feature("compactdefaultargs") SameRange;
		%feature("autodoc", ":param S:
	:type S: bool
	:rtype: None") SameRange;
		void SameRange (const Standard_Boolean S);

		/****************** Tolerance ******************/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", ":rtype: float") Tolerance;
		Standard_Real Tolerance ();

		/****************** Tolerance ******************/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", ":param T:
	:type T: float
	:rtype: None") Tolerance;
		void Tolerance (const Standard_Real T);

		/****************** UpdateTolerance ******************/
		%feature("compactdefaultargs") UpdateTolerance;
		%feature("autodoc", "* Sets the tolerance to the max of <T> and the current tolerance.
	:param T:
	:type T: float
	:rtype: None") UpdateTolerance;
		void UpdateTolerance (const Standard_Real T);

};


%make_alias(BRep_TEdge)

%extend BRep_TEdge {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************
* class BRep_TFace *
*******************/
class BRep_TFace : public TopoDS_TFace {
	public:
		/****************** BRep_TFace ******************/
		%feature("compactdefaultargs") BRep_TFace;
		%feature("autodoc", "* Creates an empty TFace.
	:rtype: None") BRep_TFace;
		 BRep_TFace ();

		/****************** EmptyCopy ******************/
		%feature("compactdefaultargs") EmptyCopy;
		%feature("autodoc", "* Returns a copy of the TShape with no sub-shapes. The new Face has no triangulation.
	:rtype: opencascade::handle<TopoDS_TShape>") EmptyCopy;
		virtual opencascade::handle<TopoDS_TShape> EmptyCopy ();

		/****************** Location ******************/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", ":rtype: TopLoc_Location") Location;
		const TopLoc_Location & Location ();

		/****************** Location ******************/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", ":param L:
	:type L: TopLoc_Location
	:rtype: None") Location;
		void Location (const TopLoc_Location & L);

		/****************** NaturalRestriction ******************/
		%feature("compactdefaultargs") NaturalRestriction;
		%feature("autodoc", ":rtype: bool") NaturalRestriction;
		Standard_Boolean NaturalRestriction ();

		/****************** NaturalRestriction ******************/
		%feature("compactdefaultargs") NaturalRestriction;
		%feature("autodoc", ":param N:
	:type N: bool
	:rtype: None") NaturalRestriction;
		void NaturalRestriction (const Standard_Boolean N);

		/****************** Surface ******************/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", ":rtype: opencascade::handle<Geom_Surface>") Surface;
		const opencascade::handle<Geom_Surface> & Surface ();

		/****************** Surface ******************/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", ":param S:
	:type S: Geom_Surface
	:rtype: None") Surface;
		void Surface (const opencascade::handle<Geom_Surface> & S);

		/****************** Tolerance ******************/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", ":rtype: float") Tolerance;
		Standard_Real Tolerance ();

		/****************** Tolerance ******************/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", ":param T:
	:type T: float
	:rtype: None") Tolerance;
		void Tolerance (const Standard_Real T);

		/****************** Triangulation ******************/
		%feature("compactdefaultargs") Triangulation;
		%feature("autodoc", ":rtype: opencascade::handle<Poly_Triangulation>") Triangulation;
		const opencascade::handle<Poly_Triangulation> & Triangulation ();

		/****************** Triangulation ******************/
		%feature("compactdefaultargs") Triangulation;
		%feature("autodoc", ":param T:
	:type T: Poly_Triangulation
	:rtype: None") Triangulation;
		void Triangulation (const opencascade::handle<Poly_Triangulation> & T);

};


%make_alias(BRep_TFace)

%extend BRep_TFace {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************
* class BRep_TVertex *
*********************/
class BRep_TVertex : public TopoDS_TVertex {
	public:
		/****************** BRep_TVertex ******************/
		%feature("compactdefaultargs") BRep_TVertex;
		%feature("autodoc", ":rtype: None") BRep_TVertex;
		 BRep_TVertex ();

		/****************** ChangePoints ******************/
		%feature("compactdefaultargs") ChangePoints;
		%feature("autodoc", ":rtype: BRep_ListOfPointRepresentation") ChangePoints;
		BRep_ListOfPointRepresentation & ChangePoints ();

		/****************** EmptyCopy ******************/
		%feature("compactdefaultargs") EmptyCopy;
		%feature("autodoc", "* Returns a copy of the TShape with no sub-shapes.
	:rtype: opencascade::handle<TopoDS_TShape>") EmptyCopy;
		opencascade::handle<TopoDS_TShape> EmptyCopy ();

		/****************** Pnt ******************/
		%feature("compactdefaultargs") Pnt;
		%feature("autodoc", ":rtype: gp_Pnt") Pnt;
		const gp_Pnt  Pnt ();

		/****************** Pnt ******************/
		%feature("compactdefaultargs") Pnt;
		%feature("autodoc", ":param P:
	:type P: gp_Pnt
	:rtype: None") Pnt;
		void Pnt (const gp_Pnt & P);

		/****************** Points ******************/
		%feature("compactdefaultargs") Points;
		%feature("autodoc", ":rtype: BRep_ListOfPointRepresentation") Points;
		const BRep_ListOfPointRepresentation & Points ();

		/****************** Tolerance ******************/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", ":rtype: float") Tolerance;
		Standard_Real Tolerance ();

		/****************** Tolerance ******************/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", ":param T:
	:type T: float
	:rtype: None") Tolerance;
		void Tolerance (const Standard_Real T);

		/****************** UpdateTolerance ******************/
		%feature("compactdefaultargs") UpdateTolerance;
		%feature("autodoc", "* Sets the tolerance to the max of <T> and the current tolerance.
	:param T:
	:type T: float
	:rtype: None") UpdateTolerance;
		void UpdateTolerance (const Standard_Real T);

};


%make_alias(BRep_TVertex)

%extend BRep_TVertex {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************
* class BRep_Tool *
******************/
class BRep_Tool {
	public:
		/****************** Continuity ******************/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "* Returns the continuity.
	:param E:
	:type E: TopoDS_Edge
	:param F1:
	:type F1: TopoDS_Face
	:param F2:
	:type F2: TopoDS_Face
	:rtype: GeomAbs_Shape") Continuity;
		static GeomAbs_Shape Continuity (const TopoDS_Edge & E,const TopoDS_Face & F1,const TopoDS_Face & F2);

		/****************** Continuity ******************/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "* Returns the continuity.
	:param E:
	:type E: TopoDS_Edge
	:param S1:
	:type S1: Geom_Surface
	:param S2:
	:type S2: Geom_Surface
	:param L1:
	:type L1: TopLoc_Location
	:param L2:
	:type L2: TopLoc_Location
	:rtype: GeomAbs_Shape") Continuity;
		static GeomAbs_Shape Continuity (const TopoDS_Edge & E,const opencascade::handle<Geom_Surface> & S1,const opencascade::handle<Geom_Surface> & S2,const TopLoc_Location & L1,const TopLoc_Location & L2);

		/****************** Curve ******************/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "* Returns the 3D curve of the edge. May be a Null handle. Returns in <L> the location for the curve. In <First> and <Last> the parameter range.
	:param E:
	:type E: TopoDS_Edge
	:param L:
	:type L: TopLoc_Location
	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:rtype: opencascade::handle<Geom_Curve>") Curve;
		static const opencascade::handle<Geom_Curve> & Curve (const TopoDS_Edge & E,TopLoc_Location & L,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** Curve ******************/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "* Returns the 3D curve of the edge. May be a Null handle. In <First> and <Last> the parameter range. It can be a copy if there is a Location.
	:param E:
	:type E: TopoDS_Edge
	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:rtype: opencascade::handle<Geom_Curve>") Curve;
		static opencascade::handle<Geom_Curve> Curve (const TopoDS_Edge & E,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** CurveOnPlane ******************/
		%feature("compactdefaultargs") CurveOnPlane;
		%feature("autodoc", "* For the planar surface builds the 2d curve for the edge by projection of the edge on plane. Returns a NULL handle if the surface is not planar or the projection failed.
	:param E:
	:type E: TopoDS_Edge
	:param S:
	:type S: Geom_Surface
	:param L:
	:type L: TopLoc_Location
	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:rtype: opencascade::handle<Geom2d_Curve>") CurveOnPlane;
		static opencascade::handle<Geom2d_Curve> CurveOnPlane (const TopoDS_Edge & E,const opencascade::handle<Geom_Surface> & S,const TopLoc_Location & L,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** CurveOnSurface ******************/
		%feature("compactdefaultargs") CurveOnSurface;
		%feature("autodoc", "* Returns the curve associated to the edge in the parametric space of the face. Returns a NULL handle if this curve does not exist. Returns in <First> and <Last> the parameter range. If the surface is a plane the curve can be not stored but created a new each time. The flag pointed by <theIsStored> serves to indicate storage status. It is valued if the pointer is non-null.
	:param E:
	:type E: TopoDS_Edge
	:param F:
	:type F: TopoDS_Face
	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:param theIsStored: default value is NULL
	:type theIsStored: bool *
	:rtype: opencascade::handle<Geom2d_Curve>") CurveOnSurface;
		static opencascade::handle<Geom2d_Curve> CurveOnSurface (const TopoDS_Edge & E,const TopoDS_Face & F,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Boolean * theIsStored = NULL);

		/****************** CurveOnSurface ******************/
		%feature("compactdefaultargs") CurveOnSurface;
		%feature("autodoc", "* Returns the curve associated to the edge in the parametric space of the surface. Returns a NULL handle if this curve does not exist. Returns in <First> and <Last> the parameter range. If the surface is a plane the curve can be not stored but created a new each time. The flag pointed by <theIsStored> serves to indicate storage status. It is valued if the pointer is non-null.
	:param E:
	:type E: TopoDS_Edge
	:param S:
	:type S: Geom_Surface
	:param L:
	:type L: TopLoc_Location
	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:param theIsStored: default value is NULL
	:type theIsStored: bool *
	:rtype: opencascade::handle<Geom2d_Curve>") CurveOnSurface;
		static opencascade::handle<Geom2d_Curve> CurveOnSurface (const TopoDS_Edge & E,const opencascade::handle<Geom_Surface> & S,const TopLoc_Location & L,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Boolean * theIsStored = NULL);

		/****************** CurveOnSurface ******************/
		%feature("compactdefaultargs") CurveOnSurface;
		%feature("autodoc", "* Returns in <C>, <S>, <L> a 2d curve, a surface and a location for the edge <E>. <C> and <S> are null if the edge has no curve on surface. Returns in <First> and <Last> the parameter range.
	:param E:
	:type E: TopoDS_Edge
	:param C:
	:type C: Geom2d_Curve
	:param S:
	:type S: Geom_Surface
	:param L:
	:type L: TopLoc_Location
	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:rtype: void") CurveOnSurface;
		static void CurveOnSurface (const TopoDS_Edge & E,opencascade::handle<Geom2d_Curve> & C,opencascade::handle<Geom_Surface> & S,TopLoc_Location & L,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** CurveOnSurface ******************/
		%feature("compactdefaultargs") CurveOnSurface;
		%feature("autodoc", "* Returns in <C>, <S>, <L> the 2d curve, the surface and the location for the edge <E> of rank <Index>. <C> and <S> are null if the index is out of range. Returns in <First> and <Last> the parameter range.
	:param E:
	:type E: TopoDS_Edge
	:param C:
	:type C: Geom2d_Curve
	:param S:
	:type S: Geom_Surface
	:param L:
	:type L: TopLoc_Location
	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:param Index:
	:type Index: int
	:rtype: void") CurveOnSurface;
		static void CurveOnSurface (const TopoDS_Edge & E,opencascade::handle<Geom2d_Curve> & C,opencascade::handle<Geom_Surface> & S,TopLoc_Location & L,Standard_Real &OutValue,Standard_Real &OutValue,const Standard_Integer Index);

		/****************** Degenerated ******************/
		%feature("compactdefaultargs") Degenerated;
		%feature("autodoc", "* Returns True if the edge is degenerated.
	:param E:
	:type E: TopoDS_Edge
	:rtype: bool") Degenerated;
		static Standard_Boolean Degenerated (const TopoDS_Edge & E);

		/****************** HasContinuity ******************/
		%feature("compactdefaultargs") HasContinuity;
		%feature("autodoc", "* Returns True if the edge is on the surfaces of the two faces.
	:param E:
	:type E: TopoDS_Edge
	:param F1:
	:type F1: TopoDS_Face
	:param F2:
	:type F2: TopoDS_Face
	:rtype: bool") HasContinuity;
		static Standard_Boolean HasContinuity (const TopoDS_Edge & E,const TopoDS_Face & F1,const TopoDS_Face & F2);

		/****************** HasContinuity ******************/
		%feature("compactdefaultargs") HasContinuity;
		%feature("autodoc", "* Returns True if the edge is on the surfaces.
	:param E:
	:type E: TopoDS_Edge
	:param S1:
	:type S1: Geom_Surface
	:param S2:
	:type S2: Geom_Surface
	:param L1:
	:type L1: TopLoc_Location
	:param L2:
	:type L2: TopLoc_Location
	:rtype: bool") HasContinuity;
		static Standard_Boolean HasContinuity (const TopoDS_Edge & E,const opencascade::handle<Geom_Surface> & S1,const opencascade::handle<Geom_Surface> & S2,const TopLoc_Location & L1,const TopLoc_Location & L2);

		/****************** HasContinuity ******************/
		%feature("compactdefaultargs") HasContinuity;
		%feature("autodoc", "* Returns True if the edge has regularity on some two surfaces
	:param E:
	:type E: TopoDS_Edge
	:rtype: bool") HasContinuity;
		static Standard_Boolean HasContinuity (const TopoDS_Edge & E);

		/****************** IsClosed ******************/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "* If S is Shell, returns True if it has no free boundaries (edges). If S is Wire, returns True if it has no free ends (vertices). (Internal and External sub-shepes are ignored in these checks) If S is Edge, returns True if its vertices are the same. For other shape types returns S.Closed().
	:param S:
	:type S: TopoDS_Shape
	:rtype: bool") IsClosed;
		static Standard_Boolean IsClosed (const TopoDS_Shape & S);

		/****************** IsClosed ******************/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "* Returns True if <E> has two PCurves in the parametric space of <F>. i.e. <F> is on a closed surface and <E> is on the closing curve.
	:param E:
	:type E: TopoDS_Edge
	:param F:
	:type F: TopoDS_Face
	:rtype: bool") IsClosed;
		static Standard_Boolean IsClosed (const TopoDS_Edge & E,const TopoDS_Face & F);

		/****************** IsClosed ******************/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "* Returns True if <E> has two PCurves in the parametric space of <S>. i.e. <S> is a closed surface and <E> is on the closing curve.
	:param E:
	:type E: TopoDS_Edge
	:param S:
	:type S: Geom_Surface
	:param L:
	:type L: TopLoc_Location
	:rtype: bool") IsClosed;
		static Standard_Boolean IsClosed (const TopoDS_Edge & E,const opencascade::handle<Geom_Surface> & S,const TopLoc_Location & L);

		/****************** IsClosed ******************/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "* Returns True if <E> has two arrays of indices in the triangulation <T>.
	:param E:
	:type E: TopoDS_Edge
	:param T:
	:type T: Poly_Triangulation
	:param L:
	:type L: TopLoc_Location
	:rtype: bool") IsClosed;
		static Standard_Boolean IsClosed (const TopoDS_Edge & E,const opencascade::handle<Poly_Triangulation> & T,const TopLoc_Location & L);

		/****************** IsGeometric ******************/
		%feature("compactdefaultargs") IsGeometric;
		%feature("autodoc", "* Returns True if <E> is a 3d curve or a curve on surface.
	:param E:
	:type E: TopoDS_Edge
	:rtype: bool") IsGeometric;
		static Standard_Boolean IsGeometric (const TopoDS_Edge & E);

		/****************** MaxContinuity ******************/
		%feature("compactdefaultargs") MaxContinuity;
		%feature("autodoc", "* Returns the max continuity of edge between some surfaces or GeomAbs_C0 if there no such surfaces.
	:param theEdge:
	:type theEdge: TopoDS_Edge
	:rtype: GeomAbs_Shape") MaxContinuity;
		static GeomAbs_Shape MaxContinuity (const TopoDS_Edge & theEdge);

		/****************** MaxTolerance ******************/
		%feature("compactdefaultargs") MaxTolerance;
		%feature("autodoc", "* Returns the maximum tolerance of input shape subshapes.
	:param theShape:
	:type theShape: TopoDS_Shape
	:param theSubShape:
	:type theSubShape: TopAbs_ShapeEnum
	:rtype: float") MaxTolerance;
		static Standard_Real MaxTolerance (const TopoDS_Shape & theShape,const TopAbs_ShapeEnum theSubShape);

		/****************** NaturalRestriction ******************/
		%feature("compactdefaultargs") NaturalRestriction;
		%feature("autodoc", "* Returns the NaturalRestriction flag of the face.
	:param F:
	:type F: TopoDS_Face
	:rtype: bool") NaturalRestriction;
		static Standard_Boolean NaturalRestriction (const TopoDS_Face & F);

		/****************** Parameter ******************/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "* Returns the parameter of <V> on <E>.
	:param V:
	:type V: TopoDS_Vertex
	:param E:
	:type E: TopoDS_Edge
	:rtype: float") Parameter;
		static Standard_Real Parameter (const TopoDS_Vertex & V,const TopoDS_Edge & E);

		/****************** Parameter ******************/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "* Returns the parameters of the vertex on the pcurve of the edge on the face.
	:param V:
	:type V: TopoDS_Vertex
	:param E:
	:type E: TopoDS_Edge
	:param F:
	:type F: TopoDS_Face
	:rtype: float") Parameter;
		static Standard_Real Parameter (const TopoDS_Vertex & V,const TopoDS_Edge & E,const TopoDS_Face & F);

		/****************** Parameter ******************/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "* Returns the parameters of the vertex on the pcurve of the edge on the surface.
	:param V:
	:type V: TopoDS_Vertex
	:param E:
	:type E: TopoDS_Edge
	:param S:
	:type S: Geom_Surface
	:param L:
	:type L: TopLoc_Location
	:rtype: float") Parameter;
		static Standard_Real Parameter (const TopoDS_Vertex & V,const TopoDS_Edge & E,const opencascade::handle<Geom_Surface> & S,const TopLoc_Location & L);

		/****************** Parameters ******************/
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "* Returns the parameters of the vertex on the face.
	:param V:
	:type V: TopoDS_Vertex
	:param F:
	:type F: TopoDS_Face
	:rtype: gp_Pnt2d") Parameters;
		static gp_Pnt2d Parameters (const TopoDS_Vertex & V,const TopoDS_Face & F);

		/****************** Pnt ******************/
		%feature("compactdefaultargs") Pnt;
		%feature("autodoc", "* Returns the 3d point.
	:param V:
	:type V: TopoDS_Vertex
	:rtype: gp_Pnt") Pnt;
		static gp_Pnt Pnt (const TopoDS_Vertex & V);

		/****************** Polygon3D ******************/
		%feature("compactdefaultargs") Polygon3D;
		%feature("autodoc", "* Returns the 3D polygon of the edge. May be a Null handle. Returns in <L> the location for the polygon.
	:param E:
	:type E: TopoDS_Edge
	:param L:
	:type L: TopLoc_Location
	:rtype: opencascade::handle<Poly_Polygon3D>") Polygon3D;
		static const opencascade::handle<Poly_Polygon3D> & Polygon3D (const TopoDS_Edge & E,TopLoc_Location & L);

		/****************** PolygonOnSurface ******************/
		%feature("compactdefaultargs") PolygonOnSurface;
		%feature("autodoc", "* Returns the polygon associated to the edge in the parametric space of the face. Returns a NULL handle if this polygon does not exist.
	:param E:
	:type E: TopoDS_Edge
	:param F:
	:type F: TopoDS_Face
	:rtype: opencascade::handle<Poly_Polygon2D>") PolygonOnSurface;
		static opencascade::handle<Poly_Polygon2D> PolygonOnSurface (const TopoDS_Edge & E,const TopoDS_Face & F);

		/****************** PolygonOnSurface ******************/
		%feature("compactdefaultargs") PolygonOnSurface;
		%feature("autodoc", "* Returns the polygon associated to the edge in the parametric space of the surface. Returns a NULL handle if this polygon does not exist.
	:param E:
	:type E: TopoDS_Edge
	:param S:
	:type S: Geom_Surface
	:param L:
	:type L: TopLoc_Location
	:rtype: opencascade::handle<Poly_Polygon2D>") PolygonOnSurface;
		static opencascade::handle<Poly_Polygon2D> PolygonOnSurface (const TopoDS_Edge & E,const opencascade::handle<Geom_Surface> & S,const TopLoc_Location & L);

		/****************** PolygonOnSurface ******************/
		%feature("compactdefaultargs") PolygonOnSurface;
		%feature("autodoc", "* Returns in <C>, <S>, <L> a 2d curve, a surface and a location for the edge <E>. <C> and <S> are null if the edge has no polygon on surface.
	:param E:
	:type E: TopoDS_Edge
	:param C:
	:type C: Poly_Polygon2D
	:param S:
	:type S: Geom_Surface
	:param L:
	:type L: TopLoc_Location
	:rtype: void") PolygonOnSurface;
		static void PolygonOnSurface (const TopoDS_Edge & E,opencascade::handle<Poly_Polygon2D> & C,opencascade::handle<Geom_Surface> & S,TopLoc_Location & L);

		/****************** PolygonOnSurface ******************/
		%feature("compactdefaultargs") PolygonOnSurface;
		%feature("autodoc", "* Returns in <C>, <S>, <L> the 2d curve, the surface and the location for the edge <E> of rank <Index>. <C> and <S> are null if the index is out of range.
	:param E:
	:type E: TopoDS_Edge
	:param C:
	:type C: Poly_Polygon2D
	:param S:
	:type S: Geom_Surface
	:param L:
	:type L: TopLoc_Location
	:param Index:
	:type Index: int
	:rtype: void") PolygonOnSurface;
		static void PolygonOnSurface (const TopoDS_Edge & E,opencascade::handle<Poly_Polygon2D> & C,opencascade::handle<Geom_Surface> & S,TopLoc_Location & L,const Standard_Integer Index);

		/****************** PolygonOnTriangulation ******************/
		%feature("compactdefaultargs") PolygonOnTriangulation;
		%feature("autodoc", "* Returns the polygon associated to the edge in the parametric space of the face. Returns a NULL handle if this polygon does not exist.
	:param E:
	:type E: TopoDS_Edge
	:param T:
	:type T: Poly_Triangulation
	:param L:
	:type L: TopLoc_Location
	:rtype: opencascade::handle<Poly_PolygonOnTriangulation>") PolygonOnTriangulation;
		static const opencascade::handle<Poly_PolygonOnTriangulation> & PolygonOnTriangulation (const TopoDS_Edge & E,const opencascade::handle<Poly_Triangulation> & T,const TopLoc_Location & L);

		/****************** PolygonOnTriangulation ******************/
		%feature("compactdefaultargs") PolygonOnTriangulation;
		%feature("autodoc", "* Returns in <P>, <T>, <L> a polygon on triangulation, a triangulation and a location for the edge <E>. <P> and <T> are null if the edge has no polygon on triangulation.
	:param E:
	:type E: TopoDS_Edge
	:param P:
	:type P: Poly_PolygonOnTriangulation
	:param T:
	:type T: Poly_Triangulation
	:param L:
	:type L: TopLoc_Location
	:rtype: void") PolygonOnTriangulation;
		static void PolygonOnTriangulation (const TopoDS_Edge & E,opencascade::handle<Poly_PolygonOnTriangulation> & P,opencascade::handle<Poly_Triangulation> & T,TopLoc_Location & L);

		/****************** PolygonOnTriangulation ******************/
		%feature("compactdefaultargs") PolygonOnTriangulation;
		%feature("autodoc", "* Returns in <P>, <T>, <L> a polygon on triangulation, a triangulation and a location for the edge <E> for the range index. <C> and <S> are null if the edge has no polygon on triangulation.
	:param E:
	:type E: TopoDS_Edge
	:param P:
	:type P: Poly_PolygonOnTriangulation
	:param T:
	:type T: Poly_Triangulation
	:param L:
	:type L: TopLoc_Location
	:param Index:
	:type Index: int
	:rtype: void") PolygonOnTriangulation;
		static void PolygonOnTriangulation (const TopoDS_Edge & E,opencascade::handle<Poly_PolygonOnTriangulation> & P,opencascade::handle<Poly_Triangulation> & T,TopLoc_Location & L,const Standard_Integer Index);

		/****************** Range ******************/
		%feature("compactdefaultargs") Range;
		%feature("autodoc", "* Gets the range of the 3d curve.
	:param E:
	:type E: TopoDS_Edge
	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:rtype: void") Range;
		static void Range (const TopoDS_Edge & E,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** Range ******************/
		%feature("compactdefaultargs") Range;
		%feature("autodoc", "* Gets the range of the edge on the pcurve on the surface.
	:param E:
	:type E: TopoDS_Edge
	:param S:
	:type S: Geom_Surface
	:param L:
	:type L: TopLoc_Location
	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:rtype: void") Range;
		static void Range (const TopoDS_Edge & E,const opencascade::handle<Geom_Surface> & S,const TopLoc_Location & L,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** Range ******************/
		%feature("compactdefaultargs") Range;
		%feature("autodoc", "* Gets the range of the edge on the pcurve on the face.
	:param E:
	:type E: TopoDS_Edge
	:param F:
	:type F: TopoDS_Face
	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:rtype: void") Range;
		static void Range (const TopoDS_Edge & E,const TopoDS_Face & F,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** SameParameter ******************/
		%feature("compactdefaultargs") SameParameter;
		%feature("autodoc", "* Returns the SameParameter flag for the edge.
	:param E:
	:type E: TopoDS_Edge
	:rtype: bool") SameParameter;
		static Standard_Boolean SameParameter (const TopoDS_Edge & E);

		/****************** SameRange ******************/
		%feature("compactdefaultargs") SameRange;
		%feature("autodoc", "* Returns the SameRange flag for the edge.
	:param E:
	:type E: TopoDS_Edge
	:rtype: bool") SameRange;
		static Standard_Boolean SameRange (const TopoDS_Edge & E);

		/****************** SetUVPoints ******************/
		%feature("compactdefaultargs") SetUVPoints;
		%feature("autodoc", "* Sets the UV locations of the extremities of the edge.
	:param E:
	:type E: TopoDS_Edge
	:param S:
	:type S: Geom_Surface
	:param L:
	:type L: TopLoc_Location
	:param PFirst:
	:type PFirst: gp_Pnt2d
	:param PLast:
	:type PLast: gp_Pnt2d
	:rtype: void") SetUVPoints;
		static void SetUVPoints (const TopoDS_Edge & E,const opencascade::handle<Geom_Surface> & S,const TopLoc_Location & L,const gp_Pnt2d & PFirst,const gp_Pnt2d & PLast);

		/****************** SetUVPoints ******************/
		%feature("compactdefaultargs") SetUVPoints;
		%feature("autodoc", "* Sets the UV locations of the extremities of the edge.
	:param E:
	:type E: TopoDS_Edge
	:param F:
	:type F: TopoDS_Face
	:param PFirst:
	:type PFirst: gp_Pnt2d
	:param PLast:
	:type PLast: gp_Pnt2d
	:rtype: void") SetUVPoints;
		static void SetUVPoints (const TopoDS_Edge & E,const TopoDS_Face & F,const gp_Pnt2d & PFirst,const gp_Pnt2d & PLast);

		/****************** Surface ******************/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "* Returns the geometric surface of the face. Returns in <L> the location for the surface.
	:param F:
	:type F: TopoDS_Face
	:param L:
	:type L: TopLoc_Location
	:rtype: opencascade::handle<Geom_Surface>") Surface;
		static const opencascade::handle<Geom_Surface> & Surface (const TopoDS_Face & F,TopLoc_Location & L);

		/****************** Surface ******************/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "* Returns the geometric surface of the face. It can be a copy if there is a Location.
	:param F:
	:type F: TopoDS_Face
	:rtype: opencascade::handle<Geom_Surface>") Surface;
		static opencascade::handle<Geom_Surface> Surface (const TopoDS_Face & F);

		/****************** Tolerance ******************/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "* Returns the tolerance of the face.
	:param F:
	:type F: TopoDS_Face
	:rtype: float") Tolerance;
		static Standard_Real Tolerance (const TopoDS_Face & F);

		/****************** Tolerance ******************/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "* Returns the tolerance for <E>.
	:param E:
	:type E: TopoDS_Edge
	:rtype: float") Tolerance;
		static Standard_Real Tolerance (const TopoDS_Edge & E);

		/****************** Tolerance ******************/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "* Returns the tolerance.
	:param V:
	:type V: TopoDS_Vertex
	:rtype: float") Tolerance;
		static Standard_Real Tolerance (const TopoDS_Vertex & V);

		/****************** Triangulation ******************/
		%feature("compactdefaultargs") Triangulation;
		%feature("autodoc", "* Returns the Triangulation of the face. It is a null handle if there is no triangulation.
	:param F:
	:type F: TopoDS_Face
	:param L:
	:type L: TopLoc_Location
	:rtype: opencascade::handle<Poly_Triangulation>") Triangulation;
		static const opencascade::handle<Poly_Triangulation> & Triangulation (const TopoDS_Face & F,TopLoc_Location & L);

		/****************** UVPoints ******************/
		%feature("compactdefaultargs") UVPoints;
		%feature("autodoc", "* Gets the UV locations of the extremities of the edge.
	:param E:
	:type E: TopoDS_Edge
	:param S:
	:type S: Geom_Surface
	:param L:
	:type L: TopLoc_Location
	:param PFirst:
	:type PFirst: gp_Pnt2d
	:param PLast:
	:type PLast: gp_Pnt2d
	:rtype: void") UVPoints;
		static void UVPoints (const TopoDS_Edge & E,const opencascade::handle<Geom_Surface> & S,const TopLoc_Location & L,gp_Pnt2d & PFirst,gp_Pnt2d & PLast);

		/****************** UVPoints ******************/
		%feature("compactdefaultargs") UVPoints;
		%feature("autodoc", "* Gets the UV locations of the extremities of the edge.
	:param E:
	:type E: TopoDS_Edge
	:param F:
	:type F: TopoDS_Face
	:param PFirst:
	:type PFirst: gp_Pnt2d
	:param PLast:
	:type PLast: gp_Pnt2d
	:rtype: void") UVPoints;
		static void UVPoints (const TopoDS_Edge & E,const TopoDS_Face & F,gp_Pnt2d & PFirst,gp_Pnt2d & PLast);

};


%extend BRep_Tool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class BRep_CurveOn2Surfaces *
******************************/
class BRep_CurveOn2Surfaces : public BRep_CurveRepresentation {
	public:
		/****************** BRep_CurveOn2Surfaces ******************/
		%feature("compactdefaultargs") BRep_CurveOn2Surfaces;
		%feature("autodoc", ":param S1:
	:type S1: Geom_Surface
	:param S2:
	:type S2: Geom_Surface
	:param L1:
	:type L1: TopLoc_Location
	:param L2:
	:type L2: TopLoc_Location
	:param C:
	:type C: GeomAbs_Shape
	:rtype: None") BRep_CurveOn2Surfaces;
		 BRep_CurveOn2Surfaces (const opencascade::handle<Geom_Surface> & S1,const opencascade::handle<Geom_Surface> & S2,const TopLoc_Location & L1,const TopLoc_Location & L2,const GeomAbs_Shape C);

		/****************** Continuity ******************/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", ":rtype: GeomAbs_Shape") Continuity;
		virtual const GeomAbs_Shape & Continuity ();

		/****************** Continuity ******************/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", ":param C:
	:type C: GeomAbs_Shape
	:rtype: void") Continuity;
		virtual void Continuity (const GeomAbs_Shape C);

		/****************** Copy ******************/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "* Return a copy of this representation.
	:rtype: opencascade::handle<BRep_CurveRepresentation>") Copy;
		opencascade::handle<BRep_CurveRepresentation> Copy ();

		/****************** D0 ******************/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "* Raises an error.
	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt
	:rtype: None") D0;
		void D0 (const Standard_Real U,gp_Pnt & P);

		/****************** IsRegularity ******************/
		%feature("compactdefaultargs") IsRegularity;
		%feature("autodoc", "* Returns True.
	:rtype: bool") IsRegularity;
		virtual Standard_Boolean IsRegularity ();

		/****************** IsRegularity ******************/
		%feature("compactdefaultargs") IsRegularity;
		%feature("autodoc", "* A curve on two surfaces (continuity).
	:param S1:
	:type S1: Geom_Surface
	:param S2:
	:type S2: Geom_Surface
	:param L1:
	:type L1: TopLoc_Location
	:param L2:
	:type L2: TopLoc_Location
	:rtype: bool") IsRegularity;
		virtual Standard_Boolean IsRegularity (const opencascade::handle<Geom_Surface> & S1,const opencascade::handle<Geom_Surface> & S2,const TopLoc_Location & L1,const TopLoc_Location & L2);

		/****************** Location2 ******************/
		%feature("compactdefaultargs") Location2;
		%feature("autodoc", ":rtype: TopLoc_Location") Location2;
		virtual const TopLoc_Location & Location2 ();

		/****************** Surface ******************/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", ":rtype: opencascade::handle<Geom_Surface>") Surface;
		virtual const opencascade::handle<Geom_Surface> & Surface ();

		/****************** Surface2 ******************/
		%feature("compactdefaultargs") Surface2;
		%feature("autodoc", ":rtype: opencascade::handle<Geom_Surface>") Surface2;
		virtual const opencascade::handle<Geom_Surface> & Surface2 ();

};


%make_alias(BRep_CurveOn2Surfaces)

%extend BRep_CurveOn2Surfaces {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************
* class BRep_GCurve *
********************/
%nodefaultctor BRep_GCurve;
class BRep_GCurve : public BRep_CurveRepresentation {
	public:
		/****************** D0 ******************/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "* Computes the point at parameter U.
	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt
	:rtype: void") D0;
		virtual void D0 (const Standard_Real U,gp_Pnt & P);

		/****************** First ******************/
		%feature("compactdefaultargs") First;
		%feature("autodoc", ":rtype: float") First;
		Standard_Real First ();

		/****************** First ******************/
		%feature("compactdefaultargs") First;
		%feature("autodoc", ":param F:
	:type F: float
	:rtype: None") First;
		void First (const Standard_Real F);

		/****************** Last ******************/
		%feature("compactdefaultargs") Last;
		%feature("autodoc", ":rtype: float") Last;
		Standard_Real Last ();

		/****************** Last ******************/
		%feature("compactdefaultargs") Last;
		%feature("autodoc", ":param L:
	:type L: float
	:rtype: None") Last;
		void Last (const Standard_Real L);

		/****************** Range ******************/
		%feature("compactdefaultargs") Range;
		%feature("autodoc", ":param First:
	:type First: float
	:param Last:
	:type Last: float
	:rtype: None") Range;
		void Range (Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** SetRange ******************/
		%feature("compactdefaultargs") SetRange;
		%feature("autodoc", ":param First:
	:type First: float
	:param Last:
	:type Last: float
	:rtype: None") SetRange;
		void SetRange (const Standard_Real First,const Standard_Real Last);

		/****************** Update ******************/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "* Recomputes any derived data after a modification. This is called when the range is modified.
	:rtype: void") Update;
		virtual void Update ();

};


%make_alias(BRep_GCurve)

%extend BRep_GCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class BRep_PointOnCurve *
**************************/
class BRep_PointOnCurve : public BRep_PointRepresentation {
	public:
		/****************** BRep_PointOnCurve ******************/
		%feature("compactdefaultargs") BRep_PointOnCurve;
		%feature("autodoc", ":param P:
	:type P: float
	:param C:
	:type C: Geom_Curve
	:param L:
	:type L: TopLoc_Location
	:rtype: None") BRep_PointOnCurve;
		 BRep_PointOnCurve (const Standard_Real P,const opencascade::handle<Geom_Curve> & C,const TopLoc_Location & L);

		/****************** Curve ******************/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", ":rtype: opencascade::handle<Geom_Curve>") Curve;
		virtual const opencascade::handle<Geom_Curve> & Curve ();

		/****************** Curve ******************/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", ":param C:
	:type C: Geom_Curve
	:rtype: void") Curve;
		virtual void Curve (const opencascade::handle<Geom_Curve> & C);

		/****************** IsPointOnCurve ******************/
		%feature("compactdefaultargs") IsPointOnCurve;
		%feature("autodoc", "* Returns True
	:rtype: bool") IsPointOnCurve;
		virtual Standard_Boolean IsPointOnCurve ();

		/****************** IsPointOnCurve ******************/
		%feature("compactdefaultargs") IsPointOnCurve;
		%feature("autodoc", ":param C:
	:type C: Geom_Curve
	:param L:
	:type L: TopLoc_Location
	:rtype: bool") IsPointOnCurve;
		virtual Standard_Boolean IsPointOnCurve (const opencascade::handle<Geom_Curve> & C,const TopLoc_Location & L);

};


%make_alias(BRep_PointOnCurve)

%extend BRep_PointOnCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class BRep_PointsOnSurface *
*****************************/
%nodefaultctor BRep_PointsOnSurface;
class BRep_PointsOnSurface : public BRep_PointRepresentation {
	public:
		/****************** Surface ******************/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", ":rtype: opencascade::handle<Geom_Surface>") Surface;
		virtual const opencascade::handle<Geom_Surface> & Surface ();

		/****************** Surface ******************/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", ":param S:
	:type S: Geom_Surface
	:rtype: void") Surface;
		virtual void Surface (const opencascade::handle<Geom_Surface> & S);

};


%make_alias(BRep_PointsOnSurface)

%extend BRep_PointsOnSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class BRep_Polygon3D *
***********************/
class BRep_Polygon3D : public BRep_CurveRepresentation {
	public:
		/****************** BRep_Polygon3D ******************/
		%feature("compactdefaultargs") BRep_Polygon3D;
		%feature("autodoc", ":param P:
	:type P: Poly_Polygon3D
	:param L:
	:type L: TopLoc_Location
	:rtype: None") BRep_Polygon3D;
		 BRep_Polygon3D (const opencascade::handle<Poly_Polygon3D> & P,const TopLoc_Location & L);

		/****************** Copy ******************/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "* Return a copy of this representation.
	:rtype: opencascade::handle<BRep_CurveRepresentation>") Copy;
		opencascade::handle<BRep_CurveRepresentation> Copy ();

		/****************** IsPolygon3D ******************/
		%feature("compactdefaultargs") IsPolygon3D;
		%feature("autodoc", "* Returns True.
	:rtype: bool") IsPolygon3D;
		virtual Standard_Boolean IsPolygon3D ();

		/****************** Polygon3D ******************/
		%feature("compactdefaultargs") Polygon3D;
		%feature("autodoc", ":rtype: opencascade::handle<Poly_Polygon3D>") Polygon3D;
		virtual const opencascade::handle<Poly_Polygon3D> & Polygon3D ();

		/****************** Polygon3D ******************/
		%feature("compactdefaultargs") Polygon3D;
		%feature("autodoc", ":param P:
	:type P: Poly_Polygon3D
	:rtype: void") Polygon3D;
		virtual void Polygon3D (const opencascade::handle<Poly_Polygon3D> & P);

};


%make_alias(BRep_Polygon3D)

%extend BRep_Polygon3D {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class BRep_PolygonOnSurface *
******************************/
class BRep_PolygonOnSurface : public BRep_CurveRepresentation {
	public:
		/****************** BRep_PolygonOnSurface ******************/
		%feature("compactdefaultargs") BRep_PolygonOnSurface;
		%feature("autodoc", ":param P:
	:type P: Poly_Polygon2D
	:param S:
	:type S: Geom_Surface
	:param L:
	:type L: TopLoc_Location
	:rtype: None") BRep_PolygonOnSurface;
		 BRep_PolygonOnSurface (const opencascade::handle<Poly_Polygon2D> & P,const opencascade::handle<Geom_Surface> & S,const TopLoc_Location & L);

		/****************** Copy ******************/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "* Return a copy of this representation.
	:rtype: opencascade::handle<BRep_CurveRepresentation>") Copy;
		virtual opencascade::handle<BRep_CurveRepresentation> Copy ();

		/****************** IsPolygonOnSurface ******************/
		%feature("compactdefaultargs") IsPolygonOnSurface;
		%feature("autodoc", "* A 2D polygon representation in the parametric space of a surface.
	:rtype: bool") IsPolygonOnSurface;
		virtual Standard_Boolean IsPolygonOnSurface ();

		/****************** IsPolygonOnSurface ******************/
		%feature("compactdefaultargs") IsPolygonOnSurface;
		%feature("autodoc", "* A 2D polygon representation in the parametric space of a surface.
	:param S:
	:type S: Geom_Surface
	:param L:
	:type L: TopLoc_Location
	:rtype: bool") IsPolygonOnSurface;
		virtual Standard_Boolean IsPolygonOnSurface (const opencascade::handle<Geom_Surface> & S,const TopLoc_Location & L);

		/****************** Polygon ******************/
		%feature("compactdefaultargs") Polygon;
		%feature("autodoc", ":rtype: opencascade::handle<Poly_Polygon2D>") Polygon;
		virtual const opencascade::handle<Poly_Polygon2D> & Polygon ();

		/****************** Polygon ******************/
		%feature("compactdefaultargs") Polygon;
		%feature("autodoc", ":param P:
	:type P: Poly_Polygon2D
	:rtype: void") Polygon;
		virtual void Polygon (const opencascade::handle<Poly_Polygon2D> & P);

		/****************** Surface ******************/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", ":rtype: opencascade::handle<Geom_Surface>") Surface;
		virtual const opencascade::handle<Geom_Surface> & Surface ();

};


%make_alias(BRep_PolygonOnSurface)

%extend BRep_PolygonOnSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class BRep_PolygonOnTriangulation *
************************************/
class BRep_PolygonOnTriangulation : public BRep_CurveRepresentation {
	public:
		/****************** BRep_PolygonOnTriangulation ******************/
		%feature("compactdefaultargs") BRep_PolygonOnTriangulation;
		%feature("autodoc", ":param P:
	:type P: Poly_PolygonOnTriangulation
	:param T:
	:type T: Poly_Triangulation
	:param L:
	:type L: TopLoc_Location
	:rtype: None") BRep_PolygonOnTriangulation;
		 BRep_PolygonOnTriangulation (const opencascade::handle<Poly_PolygonOnTriangulation> & P,const opencascade::handle<Poly_Triangulation> & T,const TopLoc_Location & L);

		/****************** Copy ******************/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "* Return a copy of this representation.
	:rtype: opencascade::handle<BRep_CurveRepresentation>") Copy;
		virtual opencascade::handle<BRep_CurveRepresentation> Copy ();

		/****************** IsPolygonOnTriangulation ******************/
		%feature("compactdefaultargs") IsPolygonOnTriangulation;
		%feature("autodoc", "* returns True.
	:rtype: bool") IsPolygonOnTriangulation;
		virtual Standard_Boolean IsPolygonOnTriangulation ();

		/****************** IsPolygonOnTriangulation ******************/
		%feature("compactdefaultargs") IsPolygonOnTriangulation;
		%feature("autodoc", "* Is it a polygon in the definition of <T> with location <L>.
	:param T:
	:type T: Poly_Triangulation
	:param L:
	:type L: TopLoc_Location
	:rtype: bool") IsPolygonOnTriangulation;
		virtual Standard_Boolean IsPolygonOnTriangulation (const opencascade::handle<Poly_Triangulation> & T,const TopLoc_Location & L);

		/****************** PolygonOnTriangulation ******************/
		%feature("compactdefaultargs") PolygonOnTriangulation;
		%feature("autodoc", "* returns True.
	:param P:
	:type P: Poly_PolygonOnTriangulation
	:rtype: void") PolygonOnTriangulation;
		virtual void PolygonOnTriangulation (const opencascade::handle<Poly_PolygonOnTriangulation> & P);

		/****************** PolygonOnTriangulation ******************/
		%feature("compactdefaultargs") PolygonOnTriangulation;
		%feature("autodoc", ":rtype: opencascade::handle<Poly_PolygonOnTriangulation>") PolygonOnTriangulation;
		virtual const opencascade::handle<Poly_PolygonOnTriangulation> & PolygonOnTriangulation ();

		/****************** Triangulation ******************/
		%feature("compactdefaultargs") Triangulation;
		%feature("autodoc", ":rtype: opencascade::handle<Poly_Triangulation>") Triangulation;
		virtual const opencascade::handle<Poly_Triangulation> & Triangulation ();

};


%make_alias(BRep_PolygonOnTriangulation)

%extend BRep_PolygonOnTriangulation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************
* class BRep_Curve3D *
*********************/
class BRep_Curve3D : public BRep_GCurve {
	public:
		/****************** BRep_Curve3D ******************/
		%feature("compactdefaultargs") BRep_Curve3D;
		%feature("autodoc", ":param C:
	:type C: Geom_Curve
	:param L:
	:type L: TopLoc_Location
	:rtype: None") BRep_Curve3D;
		 BRep_Curve3D (const opencascade::handle<Geom_Curve> & C,const TopLoc_Location & L);

		/****************** Copy ******************/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "* Return a copy of this representation.
	:rtype: opencascade::handle<BRep_CurveRepresentation>") Copy;
		opencascade::handle<BRep_CurveRepresentation> Copy ();

		/****************** Curve3D ******************/
		%feature("compactdefaultargs") Curve3D;
		%feature("autodoc", ":rtype: opencascade::handle<Geom_Curve>") Curve3D;
		virtual const opencascade::handle<Geom_Curve> & Curve3D ();

		/****************** Curve3D ******************/
		%feature("compactdefaultargs") Curve3D;
		%feature("autodoc", ":param C:
	:type C: Geom_Curve
	:rtype: void") Curve3D;
		virtual void Curve3D (const opencascade::handle<Geom_Curve> & C);

		/****************** D0 ******************/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "* Computes the point at parameter U.
	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt
	:rtype: None") D0;
		void D0 (const Standard_Real U,gp_Pnt & P);

		/****************** IsCurve3D ******************/
		%feature("compactdefaultargs") IsCurve3D;
		%feature("autodoc", "* Returns True.
	:rtype: bool") IsCurve3D;
		virtual Standard_Boolean IsCurve3D ();

};


%make_alias(BRep_Curve3D)

%extend BRep_Curve3D {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class BRep_CurveOnSurface *
****************************/
class BRep_CurveOnSurface : public BRep_GCurve {
	public:
		/****************** BRep_CurveOnSurface ******************/
		%feature("compactdefaultargs") BRep_CurveOnSurface;
		%feature("autodoc", ":param PC:
	:type PC: Geom2d_Curve
	:param S:
	:type S: Geom_Surface
	:param L:
	:type L: TopLoc_Location
	:rtype: None") BRep_CurveOnSurface;
		 BRep_CurveOnSurface (const opencascade::handle<Geom2d_Curve> & PC,const opencascade::handle<Geom_Surface> & S,const TopLoc_Location & L);

		/****************** Copy ******************/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "* Return a copy of this representation.
	:rtype: opencascade::handle<BRep_CurveRepresentation>") Copy;
		virtual opencascade::handle<BRep_CurveRepresentation> Copy ();

		/****************** D0 ******************/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "* Computes the point at parameter U.
	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt
	:rtype: None") D0;
		void D0 (const Standard_Real U,gp_Pnt & P);

		/****************** IsCurveOnSurface ******************/
		%feature("compactdefaultargs") IsCurveOnSurface;
		%feature("autodoc", "* Returns True.
	:rtype: bool") IsCurveOnSurface;
		virtual Standard_Boolean IsCurveOnSurface ();

		/****************** IsCurveOnSurface ******************/
		%feature("compactdefaultargs") IsCurveOnSurface;
		%feature("autodoc", "* A curve in the parametric space of a surface.
	:param S:
	:type S: Geom_Surface
	:param L:
	:type L: TopLoc_Location
	:rtype: bool") IsCurveOnSurface;
		virtual Standard_Boolean IsCurveOnSurface (const opencascade::handle<Geom_Surface> & S,const TopLoc_Location & L);

		/****************** PCurve ******************/
		%feature("compactdefaultargs") PCurve;
		%feature("autodoc", ":rtype: opencascade::handle<Geom2d_Curve>") PCurve;
		virtual const opencascade::handle<Geom2d_Curve> & PCurve ();

		/****************** PCurve ******************/
		%feature("compactdefaultargs") PCurve;
		%feature("autodoc", ":param C:
	:type C: Geom2d_Curve
	:rtype: void") PCurve;
		virtual void PCurve (const opencascade::handle<Geom2d_Curve> & C);

		/****************** SetUVPoints ******************/
		%feature("compactdefaultargs") SetUVPoints;
		%feature("autodoc", ":param P1:
	:type P1: gp_Pnt2d
	:param P2:
	:type P2: gp_Pnt2d
	:rtype: None") SetUVPoints;
		void SetUVPoints (const gp_Pnt2d & P1,const gp_Pnt2d & P2);

		/****************** Surface ******************/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", ":rtype: opencascade::handle<Geom_Surface>") Surface;
		virtual const opencascade::handle<Geom_Surface> & Surface ();

		/****************** UVPoints ******************/
		%feature("compactdefaultargs") UVPoints;
		%feature("autodoc", ":param P1:
	:type P1: gp_Pnt2d
	:param P2:
	:type P2: gp_Pnt2d
	:rtype: None") UVPoints;
		void UVPoints (gp_Pnt2d & P1,gp_Pnt2d & P2);

		/****************** Update ******************/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "* Recomputes any derived data after a modification. This is called when the range is modified.
	:rtype: void") Update;
		virtual void Update ();

};


%make_alias(BRep_CurveOnSurface)

%extend BRep_CurveOnSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class BRep_PointOnCurveOnSurface *
***********************************/
class BRep_PointOnCurveOnSurface : public BRep_PointsOnSurface {
	public:
		/****************** BRep_PointOnCurveOnSurface ******************/
		%feature("compactdefaultargs") BRep_PointOnCurveOnSurface;
		%feature("autodoc", ":param P:
	:type P: float
	:param C:
	:type C: Geom2d_Curve
	:param S:
	:type S: Geom_Surface
	:param L:
	:type L: TopLoc_Location
	:rtype: None") BRep_PointOnCurveOnSurface;
		 BRep_PointOnCurveOnSurface (const Standard_Real P,const opencascade::handle<Geom2d_Curve> & C,const opencascade::handle<Geom_Surface> & S,const TopLoc_Location & L);

		/****************** IsPointOnCurveOnSurface ******************/
		%feature("compactdefaultargs") IsPointOnCurveOnSurface;
		%feature("autodoc", "* Returns True
	:rtype: bool") IsPointOnCurveOnSurface;
		virtual Standard_Boolean IsPointOnCurveOnSurface ();

		/****************** IsPointOnCurveOnSurface ******************/
		%feature("compactdefaultargs") IsPointOnCurveOnSurface;
		%feature("autodoc", ":param PC:
	:type PC: Geom2d_Curve
	:param S:
	:type S: Geom_Surface
	:param L:
	:type L: TopLoc_Location
	:rtype: bool") IsPointOnCurveOnSurface;
		virtual Standard_Boolean IsPointOnCurveOnSurface (const opencascade::handle<Geom2d_Curve> & PC,const opencascade::handle<Geom_Surface> & S,const TopLoc_Location & L);

		/****************** PCurve ******************/
		%feature("compactdefaultargs") PCurve;
		%feature("autodoc", ":rtype: opencascade::handle<Geom2d_Curve>") PCurve;
		virtual const opencascade::handle<Geom2d_Curve> & PCurve ();

		/****************** PCurve ******************/
		%feature("compactdefaultargs") PCurve;
		%feature("autodoc", ":param C:
	:type C: Geom2d_Curve
	:rtype: void") PCurve;
		virtual void PCurve (const opencascade::handle<Geom2d_Curve> & C);

};


%make_alias(BRep_PointOnCurveOnSurface)

%extend BRep_PointOnCurveOnSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class BRep_PointOnSurface *
****************************/
class BRep_PointOnSurface : public BRep_PointsOnSurface {
	public:
		/****************** BRep_PointOnSurface ******************/
		%feature("compactdefaultargs") BRep_PointOnSurface;
		%feature("autodoc", ":param P1:
	:type P1: float
	:param P2:
	:type P2: float
	:param S:
	:type S: Geom_Surface
	:param L:
	:type L: TopLoc_Location
	:rtype: None") BRep_PointOnSurface;
		 BRep_PointOnSurface (const Standard_Real P1,const Standard_Real P2,const opencascade::handle<Geom_Surface> & S,const TopLoc_Location & L);

		/****************** IsPointOnSurface ******************/
		%feature("compactdefaultargs") IsPointOnSurface;
		%feature("autodoc", ":rtype: bool") IsPointOnSurface;
		virtual Standard_Boolean IsPointOnSurface ();

		/****************** IsPointOnSurface ******************/
		%feature("compactdefaultargs") IsPointOnSurface;
		%feature("autodoc", ":param S:
	:type S: Geom_Surface
	:param L:
	:type L: TopLoc_Location
	:rtype: bool") IsPointOnSurface;
		virtual Standard_Boolean IsPointOnSurface (const opencascade::handle<Geom_Surface> & S,const TopLoc_Location & L);

		/****************** Parameter2 ******************/
		%feature("compactdefaultargs") Parameter2;
		%feature("autodoc", ":rtype: float") Parameter2;
		virtual Standard_Real Parameter2 ();

		/****************** Parameter2 ******************/
		%feature("compactdefaultargs") Parameter2;
		%feature("autodoc", ":param P:
	:type P: float
	:rtype: void") Parameter2;
		virtual void Parameter2 (const Standard_Real P);

};


%make_alias(BRep_PointOnSurface)

%extend BRep_PointOnSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class BRep_PolygonOnClosedSurface *
************************************/
class BRep_PolygonOnClosedSurface : public BRep_PolygonOnSurface {
	public:
		/****************** BRep_PolygonOnClosedSurface ******************/
		%feature("compactdefaultargs") BRep_PolygonOnClosedSurface;
		%feature("autodoc", ":param P1:
	:type P1: Poly_Polygon2D
	:param P2:
	:type P2: Poly_Polygon2D
	:param S:
	:type S: Geom_Surface
	:param L:
	:type L: TopLoc_Location
	:rtype: None") BRep_PolygonOnClosedSurface;
		 BRep_PolygonOnClosedSurface (const opencascade::handle<Poly_Polygon2D> & P1,const opencascade::handle<Poly_Polygon2D> & P2,const opencascade::handle<Geom_Surface> & S,const TopLoc_Location & L);

		/****************** Copy ******************/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "* Return a copy of this representation.
	:rtype: opencascade::handle<BRep_CurveRepresentation>") Copy;
		virtual opencascade::handle<BRep_CurveRepresentation> Copy ();

		/****************** IsPolygonOnClosedSurface ******************/
		%feature("compactdefaultargs") IsPolygonOnClosedSurface;
		%feature("autodoc", "* returns True.
	:rtype: bool") IsPolygonOnClosedSurface;
		virtual Standard_Boolean IsPolygonOnClosedSurface ();

		/****************** Polygon2 ******************/
		%feature("compactdefaultargs") Polygon2;
		%feature("autodoc", ":rtype: opencascade::handle<Poly_Polygon2D>") Polygon2;
		virtual const opencascade::handle<Poly_Polygon2D> & Polygon2 ();

		/****************** Polygon2 ******************/
		%feature("compactdefaultargs") Polygon2;
		%feature("autodoc", ":param P:
	:type P: Poly_Polygon2D
	:rtype: void") Polygon2;
		virtual void Polygon2 (const opencascade::handle<Poly_Polygon2D> & P);

};


%make_alias(BRep_PolygonOnClosedSurface)

%extend BRep_PolygonOnClosedSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************
* class BRep_PolygonOnClosedTriangulation *
******************************************/
class BRep_PolygonOnClosedTriangulation : public BRep_PolygonOnTriangulation {
	public:
		/****************** BRep_PolygonOnClosedTriangulation ******************/
		%feature("compactdefaultargs") BRep_PolygonOnClosedTriangulation;
		%feature("autodoc", ":param P1:
	:type P1: Poly_PolygonOnTriangulation
	:param P2:
	:type P2: Poly_PolygonOnTriangulation
	:param Tr:
	:type Tr: Poly_Triangulation
	:param L:
	:type L: TopLoc_Location
	:rtype: None") BRep_PolygonOnClosedTriangulation;
		 BRep_PolygonOnClosedTriangulation (const opencascade::handle<Poly_PolygonOnTriangulation> & P1,const opencascade::handle<Poly_PolygonOnTriangulation> & P2,const opencascade::handle<Poly_Triangulation> & Tr,const TopLoc_Location & L);

		/****************** Copy ******************/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "* Return a copy of this representation.
	:rtype: opencascade::handle<BRep_CurveRepresentation>") Copy;
		virtual opencascade::handle<BRep_CurveRepresentation> Copy ();

		/****************** IsPolygonOnClosedTriangulation ******************/
		%feature("compactdefaultargs") IsPolygonOnClosedTriangulation;
		%feature("autodoc", "* Returns True.
	:rtype: bool") IsPolygonOnClosedTriangulation;
		virtual Standard_Boolean IsPolygonOnClosedTriangulation ();

		/****************** PolygonOnTriangulation2 ******************/
		%feature("compactdefaultargs") PolygonOnTriangulation2;
		%feature("autodoc", ":param P2:
	:type P2: Poly_PolygonOnTriangulation
	:rtype: void") PolygonOnTriangulation2;
		virtual void PolygonOnTriangulation2 (const opencascade::handle<Poly_PolygonOnTriangulation> & P2);

		/****************** PolygonOnTriangulation2 ******************/
		%feature("compactdefaultargs") PolygonOnTriangulation2;
		%feature("autodoc", ":rtype: opencascade::handle<Poly_PolygonOnTriangulation>") PolygonOnTriangulation2;
		virtual const opencascade::handle<Poly_PolygonOnTriangulation> & PolygonOnTriangulation2 ();

};


%make_alias(BRep_PolygonOnClosedTriangulation)

%extend BRep_PolygonOnClosedTriangulation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class BRep_CurveOnClosedSurface *
**********************************/
class BRep_CurveOnClosedSurface : public BRep_CurveOnSurface {
	public:
		/****************** BRep_CurveOnClosedSurface ******************/
		%feature("compactdefaultargs") BRep_CurveOnClosedSurface;
		%feature("autodoc", ":param PC1:
	:type PC1: Geom2d_Curve
	:param PC2:
	:type PC2: Geom2d_Curve
	:param S:
	:type S: Geom_Surface
	:param L:
	:type L: TopLoc_Location
	:param C:
	:type C: GeomAbs_Shape
	:rtype: None") BRep_CurveOnClosedSurface;
		 BRep_CurveOnClosedSurface (const opencascade::handle<Geom2d_Curve> & PC1,const opencascade::handle<Geom2d_Curve> & PC2,const opencascade::handle<Geom_Surface> & S,const TopLoc_Location & L,const GeomAbs_Shape C);

		/****************** Continuity ******************/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", ":rtype: GeomAbs_Shape") Continuity;
		virtual const GeomAbs_Shape & Continuity ();

		/****************** Continuity ******************/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", ":param C:
	:type C: GeomAbs_Shape
	:rtype: void") Continuity;
		virtual void Continuity (const GeomAbs_Shape C);

		/****************** Copy ******************/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "* Return a copy of this representation.
	:rtype: opencascade::handle<BRep_CurveRepresentation>") Copy;
		virtual opencascade::handle<BRep_CurveRepresentation> Copy ();

		/****************** IsCurveOnClosedSurface ******************/
		%feature("compactdefaultargs") IsCurveOnClosedSurface;
		%feature("autodoc", "* Returns True.
	:rtype: bool") IsCurveOnClosedSurface;
		virtual Standard_Boolean IsCurveOnClosedSurface ();

		/****************** IsRegularity ******************/
		%feature("compactdefaultargs") IsRegularity;
		%feature("autodoc", "* Returns True
	:rtype: bool") IsRegularity;
		virtual Standard_Boolean IsRegularity ();

		/****************** IsRegularity ******************/
		%feature("compactdefaultargs") IsRegularity;
		%feature("autodoc", "* A curve on two surfaces (continuity).
	:param S1:
	:type S1: Geom_Surface
	:param S2:
	:type S2: Geom_Surface
	:param L1:
	:type L1: TopLoc_Location
	:param L2:
	:type L2: TopLoc_Location
	:rtype: bool") IsRegularity;
		virtual Standard_Boolean IsRegularity (const opencascade::handle<Geom_Surface> & S1,const opencascade::handle<Geom_Surface> & S2,const TopLoc_Location & L1,const TopLoc_Location & L2);

		/****************** Location2 ******************/
		%feature("compactdefaultargs") Location2;
		%feature("autodoc", "* Returns Location()
	:rtype: TopLoc_Location") Location2;
		virtual const TopLoc_Location & Location2 ();

		/****************** PCurve2 ******************/
		%feature("compactdefaultargs") PCurve2;
		%feature("autodoc", ":rtype: opencascade::handle<Geom2d_Curve>") PCurve2;
		virtual const opencascade::handle<Geom2d_Curve> & PCurve2 ();

		/****************** PCurve2 ******************/
		%feature("compactdefaultargs") PCurve2;
		%feature("autodoc", ":param C:
	:type C: Geom2d_Curve
	:rtype: void") PCurve2;
		virtual void PCurve2 (const opencascade::handle<Geom2d_Curve> & C);

		/****************** SetUVPoints2 ******************/
		%feature("compactdefaultargs") SetUVPoints2;
		%feature("autodoc", ":param P1:
	:type P1: gp_Pnt2d
	:param P2:
	:type P2: gp_Pnt2d
	:rtype: None") SetUVPoints2;
		void SetUVPoints2 (const gp_Pnt2d & P1,const gp_Pnt2d & P2);

		/****************** Surface2 ******************/
		%feature("compactdefaultargs") Surface2;
		%feature("autodoc", "* Returns Surface()
	:rtype: opencascade::handle<Geom_Surface>") Surface2;
		virtual const opencascade::handle<Geom_Surface> & Surface2 ();

		/****************** UVPoints2 ******************/
		%feature("compactdefaultargs") UVPoints2;
		%feature("autodoc", ":param P1:
	:type P1: gp_Pnt2d
	:param P2:
	:type P2: gp_Pnt2d
	:rtype: None") UVPoints2;
		void UVPoints2 (gp_Pnt2d & P1,gp_Pnt2d & P2);

		/****************** Update ******************/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "* Recomputes any derived data after a modification. This is called when the range is modified.
	:rtype: void") Update;
		virtual void Update ();

};


%make_alias(BRep_CurveOnClosedSurface)

%extend BRep_CurveOnClosedSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
