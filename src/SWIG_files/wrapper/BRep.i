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
%template(BRep_ListIteratorOfListOfCurveRepresentation) NCollection_TListIterator<opencascade::handle<BRep_CurveRepresentation>>;
%template(BRep_ListIteratorOfListOfPointRepresentation) NCollection_TListIterator<opencascade::handle<BRep_PointRepresentation>>;
%template(BRep_ListOfCurveRepresentation) NCollection_List<opencascade::handle<BRep_CurveRepresentation>>;
%template(BRep_ListOfPointRepresentation) NCollection_List<opencascade::handle<BRep_PointRepresentation>>;
/* end templates declaration */

/* typedefs */
typedef NCollection_List<opencascade::handle<BRep_CurveRepresentation>>::Iterator BRep_ListIteratorOfListOfCurveRepresentation;
typedef NCollection_List<opencascade::handle<BRep_PointRepresentation>>::Iterator BRep_ListIteratorOfListOfPointRepresentation;
typedef NCollection_List<opencascade::handle<BRep_CurveRepresentation>> BRep_ListOfCurveRepresentation;
typedef NCollection_List<opencascade::handle<BRep_PointRepresentation>> BRep_ListOfPointRepresentation;
/* end typedefs declaration */

/*********************
* class BRep_Builder *
*********************/
class BRep_Builder : public TopoDS_Builder {
	public:
		/****************** Continuity ******************/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "Sets the geometric continuity on the edge.

Parameters
----------
E: TopoDS_Edge
F1: TopoDS_Face
F2: TopoDS_Face
C: GeomAbs_Shape

Returns
-------
None
") Continuity;
		void Continuity(const TopoDS_Edge & E, const TopoDS_Face & F1, const TopoDS_Face & F2, const GeomAbs_Shape C);

		/****************** Continuity ******************/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "Sets the geometric continuity on the edge.

Parameters
----------
E: TopoDS_Edge
S1: Geom_Surface
S2: Geom_Surface
L1: TopLoc_Location
L2: TopLoc_Location
C: GeomAbs_Shape

Returns
-------
None
") Continuity;
		void Continuity(const TopoDS_Edge & E, const opencascade::handle<Geom_Surface> & S1, const opencascade::handle<Geom_Surface> & S2, const TopLoc_Location & L1, const TopLoc_Location & L2, const GeomAbs_Shape C);

		/****************** Degenerated ******************/
		%feature("compactdefaultargs") Degenerated;
		%feature("autodoc", "Sets the degenerated flag for the edge <e>.

Parameters
----------
E: TopoDS_Edge
D: bool

Returns
-------
None
") Degenerated;
		void Degenerated(const TopoDS_Edge & E, const Standard_Boolean D);

		/****************** MakeEdge ******************/
		%feature("compactdefaultargs") MakeEdge;
		%feature("autodoc", "Makes an undefined edge (no geometry).

Parameters
----------
E: TopoDS_Edge

Returns
-------
None
") MakeEdge;
		void MakeEdge(TopoDS_Edge & E);

		/****************** MakeEdge ******************/
		%feature("compactdefaultargs") MakeEdge;
		%feature("autodoc", "Makes an edge with a curve.

Parameters
----------
E: TopoDS_Edge
C: Geom_Curve
Tol: float

Returns
-------
None
") MakeEdge;
		void MakeEdge(TopoDS_Edge & E, const opencascade::handle<Geom_Curve> & C, const Standard_Real Tol);

		/****************** MakeEdge ******************/
		%feature("compactdefaultargs") MakeEdge;
		%feature("autodoc", "Makes an edge with a curve and a location.

Parameters
----------
E: TopoDS_Edge
C: Geom_Curve
L: TopLoc_Location
Tol: float

Returns
-------
None
") MakeEdge;
		void MakeEdge(TopoDS_Edge & E, const opencascade::handle<Geom_Curve> & C, const TopLoc_Location & L, const Standard_Real Tol);

		/****************** MakeEdge ******************/
		%feature("compactdefaultargs") MakeEdge;
		%feature("autodoc", "Makes an edge with a polygon 3d.

Parameters
----------
E: TopoDS_Edge
P: Poly_Polygon3D

Returns
-------
None
") MakeEdge;
		void MakeEdge(TopoDS_Edge & E, const opencascade::handle<Poly_Polygon3D> & P);

		/****************** MakeEdge ******************/
		%feature("compactdefaultargs") MakeEdge;
		%feature("autodoc", "Makes an edge polygon on triangulation.

Parameters
----------
E: TopoDS_Edge
N: Poly_PolygonOnTriangulation
T: Poly_Triangulation

Returns
-------
None
") MakeEdge;
		void MakeEdge(TopoDS_Edge & E, const opencascade::handle<Poly_PolygonOnTriangulation> & N, const opencascade::handle<Poly_Triangulation> & T);

		/****************** MakeEdge ******************/
		%feature("compactdefaultargs") MakeEdge;
		%feature("autodoc", "Makes an edge polygon on triangulation.

Parameters
----------
E: TopoDS_Edge
N: Poly_PolygonOnTriangulation
T: Poly_Triangulation
L: TopLoc_Location

Returns
-------
None
") MakeEdge;
		void MakeEdge(TopoDS_Edge & E, const opencascade::handle<Poly_PolygonOnTriangulation> & N, const opencascade::handle<Poly_Triangulation> & T, const TopLoc_Location & L);

		/****************** MakeFace ******************/
		%feature("compactdefaultargs") MakeFace;
		%feature("autodoc", "Makes an undefined face.

Parameters
----------
F: TopoDS_Face

Returns
-------
None
") MakeFace;
		void MakeFace(TopoDS_Face & F);

		/****************** MakeFace ******************/
		%feature("compactdefaultargs") MakeFace;
		%feature("autodoc", "Makes a face with a surface.

Parameters
----------
F: TopoDS_Face
S: Geom_Surface
Tol: float

Returns
-------
None
") MakeFace;
		void MakeFace(TopoDS_Face & F, const opencascade::handle<Geom_Surface> & S, const Standard_Real Tol);

		/****************** MakeFace ******************/
		%feature("compactdefaultargs") MakeFace;
		%feature("autodoc", "Makes a face with a surface and a location.

Parameters
----------
F: TopoDS_Face
S: Geom_Surface
L: TopLoc_Location
Tol: float

Returns
-------
None
") MakeFace;
		void MakeFace(TopoDS_Face & F, const opencascade::handle<Geom_Surface> & S, const TopLoc_Location & L, const Standard_Real Tol);

		/****************** MakeFace ******************/
		%feature("compactdefaultargs") MakeFace;
		%feature("autodoc", "Makes a face with a triangulation. the triangulation is in the same reference system than the tface.

Parameters
----------
F: TopoDS_Face
T: Poly_Triangulation

Returns
-------
None
") MakeFace;
		void MakeFace(TopoDS_Face & F, const opencascade::handle<Poly_Triangulation> & T);

		/****************** MakeVertex ******************/
		%feature("compactdefaultargs") MakeVertex;
		%feature("autodoc", "Makes an udefined vertex without geometry.

Parameters
----------
V: TopoDS_Vertex

Returns
-------
None
") MakeVertex;
		void MakeVertex(TopoDS_Vertex & V);

		/****************** MakeVertex ******************/
		%feature("compactdefaultargs") MakeVertex;
		%feature("autodoc", "Makes a vertex from a 3d point.

Parameters
----------
V: TopoDS_Vertex
P: gp_Pnt
Tol: float

Returns
-------
None
") MakeVertex;
		void MakeVertex(TopoDS_Vertex & V, const gp_Pnt & P, const Standard_Real Tol);

		/****************** NaturalRestriction ******************/
		%feature("compactdefaultargs") NaturalRestriction;
		%feature("autodoc", "Sets the naturalrestriction flag of the face.

Parameters
----------
F: TopoDS_Face
N: bool

Returns
-------
None
") NaturalRestriction;
		void NaturalRestriction(const TopoDS_Face & F, const Standard_Boolean N);

		/****************** Range ******************/
		%feature("compactdefaultargs") Range;
		%feature("autodoc", "Sets the range of the 3d curve if only3d=true, otherwise sets the range to all the representations.

Parameters
----------
E: TopoDS_Edge
First: float
Last: float
Only3d: bool,optional
	default value is Standard_False

Returns
-------
None
") Range;
		void Range(const TopoDS_Edge & E, const Standard_Real First, const Standard_Real Last, const Standard_Boolean Only3d = Standard_False);

		/****************** Range ******************/
		%feature("compactdefaultargs") Range;
		%feature("autodoc", "Sets the range of the edge on the pcurve on the surface.

Parameters
----------
E: TopoDS_Edge
S: Geom_Surface
L: TopLoc_Location
First: float
Last: float

Returns
-------
None
") Range;
		void Range(const TopoDS_Edge & E, const opencascade::handle<Geom_Surface> & S, const TopLoc_Location & L, const Standard_Real First, const Standard_Real Last);

		/****************** Range ******************/
		%feature("compactdefaultargs") Range;
		%feature("autodoc", "Sets the range of the edge on the pcurve on the face.

Parameters
----------
E: TopoDS_Edge
F: TopoDS_Face
First: float
Last: float

Returns
-------
None
") Range;
		void Range(const TopoDS_Edge & E, const TopoDS_Face & F, const Standard_Real First, const Standard_Real Last);

		/****************** SameParameter ******************/
		%feature("compactdefaultargs") SameParameter;
		%feature("autodoc", "Sets the same parameter flag for the edge <e>.

Parameters
----------
E: TopoDS_Edge
S: bool

Returns
-------
None
") SameParameter;
		void SameParameter(const TopoDS_Edge & E, const Standard_Boolean S);

		/****************** SameRange ******************/
		%feature("compactdefaultargs") SameRange;
		%feature("autodoc", "Sets the same range flag for the edge <e>.

Parameters
----------
E: TopoDS_Edge
S: bool

Returns
-------
None
") SameRange;
		void SameRange(const TopoDS_Edge & E, const Standard_Boolean S);

		/****************** Transfert ******************/
		%feature("compactdefaultargs") Transfert;
		%feature("autodoc", "Add to <eout> the geometric representations of <ein>.

Parameters
----------
Ein: TopoDS_Edge
Eout: TopoDS_Edge

Returns
-------
None
") Transfert;
		void Transfert(const TopoDS_Edge & Ein, const TopoDS_Edge & Eout);

		/****************** Transfert ******************/
		%feature("compactdefaultargs") Transfert;
		%feature("autodoc", "Transfert the parameters of vin on ein as the parameter of vout on eout.

Parameters
----------
Ein: TopoDS_Edge
Eout: TopoDS_Edge
Vin: TopoDS_Vertex
Vout: TopoDS_Vertex

Returns
-------
None
") Transfert;
		void Transfert(const TopoDS_Edge & Ein, const TopoDS_Edge & Eout, const TopoDS_Vertex & Vin, const TopoDS_Vertex & Vout);

		/****************** UpdateEdge ******************/
		%feature("compactdefaultargs") UpdateEdge;
		%feature("autodoc", "Sets a 3d curve for the edge. if <c> is a null handle, remove any existing 3d curve.

Parameters
----------
E: TopoDS_Edge
C: Geom_Curve
Tol: float

Returns
-------
None
") UpdateEdge;
		void UpdateEdge(const TopoDS_Edge & E, const opencascade::handle<Geom_Curve> & C, const Standard_Real Tol);

		/****************** UpdateEdge ******************/
		%feature("compactdefaultargs") UpdateEdge;
		%feature("autodoc", "Sets a 3d curve for the edge. if <c> is a null handle, remove any existing 3d curve.

Parameters
----------
E: TopoDS_Edge
C: Geom_Curve
L: TopLoc_Location
Tol: float

Returns
-------
None
") UpdateEdge;
		void UpdateEdge(const TopoDS_Edge & E, const opencascade::handle<Geom_Curve> & C, const TopLoc_Location & L, const Standard_Real Tol);

		/****************** UpdateEdge ******************/
		%feature("compactdefaultargs") UpdateEdge;
		%feature("autodoc", "Sets a pcurve for the edge on the face. if <c> is a null handle, remove any existing pcurve.

Parameters
----------
E: TopoDS_Edge
C: Geom2d_Curve
F: TopoDS_Face
Tol: float

Returns
-------
None
") UpdateEdge;
		void UpdateEdge(const TopoDS_Edge & E, const opencascade::handle<Geom2d_Curve> & C, const TopoDS_Face & F, const Standard_Real Tol);

		/****************** UpdateEdge ******************/
		%feature("compactdefaultargs") UpdateEdge;
		%feature("autodoc", "Sets pcurves for the edge on the closed face. if <c1> or <c2> is a null handle, remove any existing pcurve.

Parameters
----------
E: TopoDS_Edge
C1: Geom2d_Curve
C2: Geom2d_Curve
F: TopoDS_Face
Tol: float

Returns
-------
None
") UpdateEdge;
		void UpdateEdge(const TopoDS_Edge & E, const opencascade::handle<Geom2d_Curve> & C1, const opencascade::handle<Geom2d_Curve> & C2, const TopoDS_Face & F, const Standard_Real Tol);

		/****************** UpdateEdge ******************/
		%feature("compactdefaultargs") UpdateEdge;
		%feature("autodoc", "Sets a pcurve for the edge on the face. if <c> is a null handle, remove any existing pcurve.

Parameters
----------
E: TopoDS_Edge
C: Geom2d_Curve
S: Geom_Surface
L: TopLoc_Location
Tol: float

Returns
-------
None
") UpdateEdge;
		void UpdateEdge(const TopoDS_Edge & E, const opencascade::handle<Geom2d_Curve> & C, const opencascade::handle<Geom_Surface> & S, const TopLoc_Location & L, const Standard_Real Tol);

		/****************** UpdateEdge ******************/
		%feature("compactdefaultargs") UpdateEdge;
		%feature("autodoc", "Sets a pcurve for the edge on the face. if <c> is a null handle, remove any existing pcurve. sets uv bounds for curve repsentation.

Parameters
----------
E: TopoDS_Edge
C: Geom2d_Curve
S: Geom_Surface
L: TopLoc_Location
Tol: float
Pf: gp_Pnt2d
Pl: gp_Pnt2d

Returns
-------
None
") UpdateEdge;
		void UpdateEdge(const TopoDS_Edge & E, const opencascade::handle<Geom2d_Curve> & C, const opencascade::handle<Geom_Surface> & S, const TopLoc_Location & L, const Standard_Real Tol, const gp_Pnt2d & Pf, const gp_Pnt2d & Pl);

		/****************** UpdateEdge ******************/
		%feature("compactdefaultargs") UpdateEdge;
		%feature("autodoc", "Sets pcurves for the edge on the closed surface. <c1> or <c2> is a null handle, remove any existing pcurve.

Parameters
----------
E: TopoDS_Edge
C1: Geom2d_Curve
C2: Geom2d_Curve
S: Geom_Surface
L: TopLoc_Location
Tol: float

Returns
-------
None
") UpdateEdge;
		void UpdateEdge(const TopoDS_Edge & E, const opencascade::handle<Geom2d_Curve> & C1, const opencascade::handle<Geom2d_Curve> & C2, const opencascade::handle<Geom_Surface> & S, const TopLoc_Location & L, const Standard_Real Tol);

		/****************** UpdateEdge ******************/
		%feature("compactdefaultargs") UpdateEdge;
		%feature("autodoc", "Sets pcurves for the edge on the closed surface. <c1> or <c2> is a null handle, remove any existing pcurve. sets uv bounds for curve repsentation.

Parameters
----------
E: TopoDS_Edge
C1: Geom2d_Curve
C2: Geom2d_Curve
S: Geom_Surface
L: TopLoc_Location
Tol: float
Pf: gp_Pnt2d
Pl: gp_Pnt2d

Returns
-------
None
") UpdateEdge;
		void UpdateEdge(const TopoDS_Edge & E, const opencascade::handle<Geom2d_Curve> & C1, const opencascade::handle<Geom2d_Curve> & C2, const opencascade::handle<Geom_Surface> & S, const TopLoc_Location & L, const Standard_Real Tol, const gp_Pnt2d & Pf, const gp_Pnt2d & Pl);

		/****************** UpdateEdge ******************/
		%feature("compactdefaultargs") UpdateEdge;
		%feature("autodoc", "Changes an edge 3d polygon. a null polygon removes the 3d polygon.

Parameters
----------
E: TopoDS_Edge
P: Poly_Polygon3D

Returns
-------
None
") UpdateEdge;
		void UpdateEdge(const TopoDS_Edge & E, const opencascade::handle<Poly_Polygon3D> & P);

		/****************** UpdateEdge ******************/
		%feature("compactdefaultargs") UpdateEdge;
		%feature("autodoc", "Changes an edge 3d polygon. a null polygon removes the 3d polygon.

Parameters
----------
E: TopoDS_Edge
P: Poly_Polygon3D
L: TopLoc_Location

Returns
-------
None
") UpdateEdge;
		void UpdateEdge(const TopoDS_Edge & E, const opencascade::handle<Poly_Polygon3D> & P, const TopLoc_Location & L);

		/****************** UpdateEdge ******************/
		%feature("compactdefaultargs") UpdateEdge;
		%feature("autodoc", "Changes an edge polygon on triangulation.

Parameters
----------
E: TopoDS_Edge
N: Poly_PolygonOnTriangulation
T: Poly_Triangulation

Returns
-------
None
") UpdateEdge;
		void UpdateEdge(const TopoDS_Edge & E, const opencascade::handle<Poly_PolygonOnTriangulation> & N, const opencascade::handle<Poly_Triangulation> & T);

		/****************** UpdateEdge ******************/
		%feature("compactdefaultargs") UpdateEdge;
		%feature("autodoc", "Changes an edge polygon on triangulation.

Parameters
----------
E: TopoDS_Edge
N: Poly_PolygonOnTriangulation
T: Poly_Triangulation
L: TopLoc_Location

Returns
-------
None
") UpdateEdge;
		void UpdateEdge(const TopoDS_Edge & E, const opencascade::handle<Poly_PolygonOnTriangulation> & N, const opencascade::handle<Poly_Triangulation> & T, const TopLoc_Location & L);

		/****************** UpdateEdge ******************/
		%feature("compactdefaultargs") UpdateEdge;
		%feature("autodoc", "Changes an edge polygon on triangulation.

Parameters
----------
E: TopoDS_Edge
N1: Poly_PolygonOnTriangulation
N2: Poly_PolygonOnTriangulation
T: Poly_Triangulation

Returns
-------
None
") UpdateEdge;
		void UpdateEdge(const TopoDS_Edge & E, const opencascade::handle<Poly_PolygonOnTriangulation> & N1, const opencascade::handle<Poly_PolygonOnTriangulation> & N2, const opencascade::handle<Poly_Triangulation> & T);

		/****************** UpdateEdge ******************/
		%feature("compactdefaultargs") UpdateEdge;
		%feature("autodoc", "Changes an edge polygon on triangulation.

Parameters
----------
E: TopoDS_Edge
N1: Poly_PolygonOnTriangulation
N2: Poly_PolygonOnTriangulation
T: Poly_Triangulation
L: TopLoc_Location

Returns
-------
None
") UpdateEdge;
		void UpdateEdge(const TopoDS_Edge & E, const opencascade::handle<Poly_PolygonOnTriangulation> & N1, const opencascade::handle<Poly_PolygonOnTriangulation> & N2, const opencascade::handle<Poly_Triangulation> & T, const TopLoc_Location & L);

		/****************** UpdateEdge ******************/
		%feature("compactdefaultargs") UpdateEdge;
		%feature("autodoc", "Changes edge polygon on a face.

Parameters
----------
E: TopoDS_Edge
P: Poly_Polygon2D
S: TopoDS_Face

Returns
-------
None
") UpdateEdge;
		void UpdateEdge(const TopoDS_Edge & E, const opencascade::handle<Poly_Polygon2D> & P, const TopoDS_Face & S);

		/****************** UpdateEdge ******************/
		%feature("compactdefaultargs") UpdateEdge;
		%feature("autodoc", "Changes edge polygon on a face.

Parameters
----------
E: TopoDS_Edge
P: Poly_Polygon2D
S: Geom_Surface
T: TopLoc_Location

Returns
-------
None
") UpdateEdge;
		void UpdateEdge(const TopoDS_Edge & E, const opencascade::handle<Poly_Polygon2D> & P, const opencascade::handle<Geom_Surface> & S, const TopLoc_Location & T);

		/****************** UpdateEdge ******************/
		%feature("compactdefaultargs") UpdateEdge;
		%feature("autodoc", "Changes edge polygons on a face. //! a null polygon removes the 2d polygon.

Parameters
----------
E: TopoDS_Edge
P1: Poly_Polygon2D
P2: Poly_Polygon2D
S: TopoDS_Face

Returns
-------
None
") UpdateEdge;
		void UpdateEdge(const TopoDS_Edge & E, const opencascade::handle<Poly_Polygon2D> & P1, const opencascade::handle<Poly_Polygon2D> & P2, const TopoDS_Face & S);

		/****************** UpdateEdge ******************/
		%feature("compactdefaultargs") UpdateEdge;
		%feature("autodoc", "Changes edge polygons on a face. //! a null polygon removes the 2d polygon.

Parameters
----------
E: TopoDS_Edge
P1: Poly_Polygon2D
P2: Poly_Polygon2D
S: Geom_Surface
L: TopLoc_Location

Returns
-------
None
") UpdateEdge;
		void UpdateEdge(const TopoDS_Edge & E, const opencascade::handle<Poly_Polygon2D> & P1, const opencascade::handle<Poly_Polygon2D> & P2, const opencascade::handle<Geom_Surface> & S, const TopLoc_Location & L);

		/****************** UpdateEdge ******************/
		%feature("compactdefaultargs") UpdateEdge;
		%feature("autodoc", "Updates the edge tolerance.

Parameters
----------
E: TopoDS_Edge
Tol: float

Returns
-------
None
") UpdateEdge;
		void UpdateEdge(const TopoDS_Edge & E, const Standard_Real Tol);

		/****************** UpdateFace ******************/
		%feature("compactdefaultargs") UpdateFace;
		%feature("autodoc", "Updates the face f using the tolerance value tol, surface s and location location.

Parameters
----------
F: TopoDS_Face
S: Geom_Surface
L: TopLoc_Location
Tol: float

Returns
-------
None
") UpdateFace;
		void UpdateFace(const TopoDS_Face & F, const opencascade::handle<Geom_Surface> & S, const TopLoc_Location & L, const Standard_Real Tol);

		/****************** UpdateFace ******************/
		%feature("compactdefaultargs") UpdateFace;
		%feature("autodoc", "Changes a face triangulation. //! a null triangulation removes the triangulation.

Parameters
----------
F: TopoDS_Face
T: Poly_Triangulation

Returns
-------
None
") UpdateFace;
		void UpdateFace(const TopoDS_Face & F, const opencascade::handle<Poly_Triangulation> & T);

		/****************** UpdateFace ******************/
		%feature("compactdefaultargs") UpdateFace;
		%feature("autodoc", "Updates the face tolerance.

Parameters
----------
F: TopoDS_Face
Tol: float

Returns
-------
None
") UpdateFace;
		void UpdateFace(const TopoDS_Face & F, const Standard_Real Tol);

		/****************** UpdateVertex ******************/
		%feature("compactdefaultargs") UpdateVertex;
		%feature("autodoc", "Sets a 3d point on the vertex.

Parameters
----------
V: TopoDS_Vertex
P: gp_Pnt
Tol: float

Returns
-------
None
") UpdateVertex;
		void UpdateVertex(const TopoDS_Vertex & V, const gp_Pnt & P, const Standard_Real Tol);

		/****************** UpdateVertex ******************/
		%feature("compactdefaultargs") UpdateVertex;
		%feature("autodoc", "Sets the parameter for the vertex on the edge curves.

Parameters
----------
V: TopoDS_Vertex
P: float
E: TopoDS_Edge
Tol: float

Returns
-------
None
") UpdateVertex;
		void UpdateVertex(const TopoDS_Vertex & V, const Standard_Real P, const TopoDS_Edge & E, const Standard_Real Tol);

		/****************** UpdateVertex ******************/
		%feature("compactdefaultargs") UpdateVertex;
		%feature("autodoc", "Sets the parameter for the vertex on the edge pcurve on the face.

Parameters
----------
V: TopoDS_Vertex
P: float
E: TopoDS_Edge
F: TopoDS_Face
Tol: float

Returns
-------
None
") UpdateVertex;
		void UpdateVertex(const TopoDS_Vertex & V, const Standard_Real P, const TopoDS_Edge & E, const TopoDS_Face & F, const Standard_Real Tol);

		/****************** UpdateVertex ******************/
		%feature("compactdefaultargs") UpdateVertex;
		%feature("autodoc", "Sets the parameter for the vertex on the edge pcurve on the surface.

Parameters
----------
V: TopoDS_Vertex
P: float
E: TopoDS_Edge
S: Geom_Surface
L: TopLoc_Location
Tol: float

Returns
-------
None
") UpdateVertex;
		void UpdateVertex(const TopoDS_Vertex & V, const Standard_Real P, const TopoDS_Edge & E, const opencascade::handle<Geom_Surface> & S, const TopLoc_Location & L, const Standard_Real Tol);

		/****************** UpdateVertex ******************/
		%feature("compactdefaultargs") UpdateVertex;
		%feature("autodoc", "Sets the parameters for the vertex on the face.

Parameters
----------
Ve: TopoDS_Vertex
U: float
V: float
F: TopoDS_Face
Tol: float

Returns
-------
None
") UpdateVertex;
		void UpdateVertex(const TopoDS_Vertex & Ve, const Standard_Real U, const Standard_Real V, const TopoDS_Face & F, const Standard_Real Tol);

		/****************** UpdateVertex ******************/
		%feature("compactdefaultargs") UpdateVertex;
		%feature("autodoc", "Updates the vertex tolerance.

Parameters
----------
V: TopoDS_Vertex
Tol: float

Returns
-------
None
") UpdateVertex;
		void UpdateVertex(const TopoDS_Vertex & V, const Standard_Real Tol);

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
		%feature("autodoc", "No available documentation.

Returns
-------
GeomAbs_Shape
") Continuity;
		virtual const GeomAbs_Shape & Continuity();

		/****************** Continuity ******************/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: GeomAbs_Shape

Returns
-------
None
") Continuity;
		virtual void Continuity(const GeomAbs_Shape C);

		/****************** Copy ******************/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return a copy of this representation.

Returns
-------
opencascade::handle<BRep_CurveRepresentation>
") Copy;
		virtual opencascade::handle<BRep_CurveRepresentation> Copy();

		/****************** Curve3D ******************/
		%feature("compactdefaultargs") Curve3D;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom_Curve>
") Curve3D;
		virtual const opencascade::handle<Geom_Curve> & Curve3D();

		/****************** Curve3D ******************/
		%feature("compactdefaultargs") Curve3D;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Geom_Curve

Returns
-------
None
") Curve3D;
		virtual void Curve3D(const opencascade::handle<Geom_Curve> & C);

		/****************** IsCurve3D ******************/
		%feature("compactdefaultargs") IsCurve3D;
		%feature("autodoc", "A 3d curve representation.

Returns
-------
bool
") IsCurve3D;
		virtual Standard_Boolean IsCurve3D();

		/****************** IsCurveOnClosedSurface ******************/
		%feature("compactdefaultargs") IsCurveOnClosedSurface;
		%feature("autodoc", "A curve with two parametric curves on the same surface.

Returns
-------
bool
") IsCurveOnClosedSurface;
		virtual Standard_Boolean IsCurveOnClosedSurface();

		/****************** IsCurveOnSurface ******************/
		%feature("compactdefaultargs") IsCurveOnSurface;
		%feature("autodoc", "A curve in the parametric space of a surface.

Returns
-------
bool
") IsCurveOnSurface;
		virtual Standard_Boolean IsCurveOnSurface();

		/****************** IsCurveOnSurface ******************/
		%feature("compactdefaultargs") IsCurveOnSurface;
		%feature("autodoc", "Is it a curve in the parametric space of <s> with location <l>.

Parameters
----------
S: Geom_Surface
L: TopLoc_Location

Returns
-------
bool
") IsCurveOnSurface;
		virtual Standard_Boolean IsCurveOnSurface(const opencascade::handle<Geom_Surface> & S, const TopLoc_Location & L);

		/****************** IsPolygon3D ******************/
		%feature("compactdefaultargs") IsPolygon3D;
		%feature("autodoc", "A 3d polygon representation.

Returns
-------
bool
") IsPolygon3D;
		virtual Standard_Boolean IsPolygon3D();

		/****************** IsPolygonOnClosedSurface ******************/
		%feature("compactdefaultargs") IsPolygonOnClosedSurface;
		%feature("autodoc", "Two 2d polygon representations in the parametric space of a surface.

Returns
-------
bool
") IsPolygonOnClosedSurface;
		virtual Standard_Boolean IsPolygonOnClosedSurface();

		/****************** IsPolygonOnClosedTriangulation ******************/
		%feature("compactdefaultargs") IsPolygonOnClosedTriangulation;
		%feature("autodoc", "A representation by two arrays of nodes on a triangulation.

Returns
-------
bool
") IsPolygonOnClosedTriangulation;
		virtual Standard_Boolean IsPolygonOnClosedTriangulation();

		/****************** IsPolygonOnSurface ******************/
		%feature("compactdefaultargs") IsPolygonOnSurface;
		%feature("autodoc", "A polygon in the parametric space of a surface.

Returns
-------
bool
") IsPolygonOnSurface;
		virtual Standard_Boolean IsPolygonOnSurface();

		/****************** IsPolygonOnSurface ******************/
		%feature("compactdefaultargs") IsPolygonOnSurface;
		%feature("autodoc", "Is it a polygon in the parametric space of <s> with location <l>.

Parameters
----------
S: Geom_Surface
L: TopLoc_Location

Returns
-------
bool
") IsPolygonOnSurface;
		virtual Standard_Boolean IsPolygonOnSurface(const opencascade::handle<Geom_Surface> & S, const TopLoc_Location & L);

		/****************** IsPolygonOnTriangulation ******************/
		%feature("compactdefaultargs") IsPolygonOnTriangulation;
		%feature("autodoc", "A representation by an array of nodes on a triangulation.

Returns
-------
bool
") IsPolygonOnTriangulation;
		virtual Standard_Boolean IsPolygonOnTriangulation();

		/****************** IsPolygonOnTriangulation ******************/
		%feature("compactdefaultargs") IsPolygonOnTriangulation;
		%feature("autodoc", "Is it a polygon in the definition of <t> with location <l>.

Parameters
----------
T: Poly_Triangulation
L: TopLoc_Location

Returns
-------
bool
") IsPolygonOnTriangulation;
		virtual Standard_Boolean IsPolygonOnTriangulation(const opencascade::handle<Poly_Triangulation> & T, const TopLoc_Location & L);

		/****************** IsRegularity ******************/
		%feature("compactdefaultargs") IsRegularity;
		%feature("autodoc", "A continuity between two surfaces.

Returns
-------
bool
") IsRegularity;
		virtual Standard_Boolean IsRegularity();

		/****************** IsRegularity ******************/
		%feature("compactdefaultargs") IsRegularity;
		%feature("autodoc", "Is it a regularity between <s1> and <s2> with location <l1> and <l2>.

Parameters
----------
S1: Geom_Surface
S2: Geom_Surface
L1: TopLoc_Location
L2: TopLoc_Location

Returns
-------
bool
") IsRegularity;
		virtual Standard_Boolean IsRegularity(const opencascade::handle<Geom_Surface> & S1, const opencascade::handle<Geom_Surface> & S2, const TopLoc_Location & L1, const TopLoc_Location & L2);

		/****************** Location ******************/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "No available documentation.

Returns
-------
TopLoc_Location
") Location;
		const TopLoc_Location & Location();

		/****************** Location ******************/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: TopLoc_Location

Returns
-------
None
") Location;
		void Location(const TopLoc_Location & L);

		/****************** Location2 ******************/
		%feature("compactdefaultargs") Location2;
		%feature("autodoc", "No available documentation.

Returns
-------
TopLoc_Location
") Location2;
		virtual const TopLoc_Location & Location2();

		/****************** PCurve ******************/
		%feature("compactdefaultargs") PCurve;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom2d_Curve>
") PCurve;
		virtual const opencascade::handle<Geom2d_Curve> & PCurve();

		/****************** PCurve ******************/
		%feature("compactdefaultargs") PCurve;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Geom2d_Curve

Returns
-------
None
") PCurve;
		virtual void PCurve(const opencascade::handle<Geom2d_Curve> & C);

		/****************** PCurve2 ******************/
		%feature("compactdefaultargs") PCurve2;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom2d_Curve>
") PCurve2;
		virtual const opencascade::handle<Geom2d_Curve> & PCurve2();

		/****************** PCurve2 ******************/
		%feature("compactdefaultargs") PCurve2;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Geom2d_Curve

Returns
-------
None
") PCurve2;
		virtual void PCurve2(const opencascade::handle<Geom2d_Curve> & C);

		/****************** Polygon ******************/
		%feature("compactdefaultargs") Polygon;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Poly_Polygon2D>
") Polygon;
		virtual const opencascade::handle<Poly_Polygon2D> & Polygon();

		/****************** Polygon ******************/
		%feature("compactdefaultargs") Polygon;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: Poly_Polygon2D

Returns
-------
None
") Polygon;
		virtual void Polygon(const opencascade::handle<Poly_Polygon2D> & P);

		/****************** Polygon2 ******************/
		%feature("compactdefaultargs") Polygon2;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Poly_Polygon2D>
") Polygon2;
		virtual const opencascade::handle<Poly_Polygon2D> & Polygon2();

		/****************** Polygon2 ******************/
		%feature("compactdefaultargs") Polygon2;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: Poly_Polygon2D

Returns
-------
None
") Polygon2;
		virtual void Polygon2(const opencascade::handle<Poly_Polygon2D> & P);

		/****************** Polygon3D ******************/
		%feature("compactdefaultargs") Polygon3D;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Poly_Polygon3D>
") Polygon3D;
		virtual const opencascade::handle<Poly_Polygon3D> & Polygon3D();

		/****************** Polygon3D ******************/
		%feature("compactdefaultargs") Polygon3D;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: Poly_Polygon3D

Returns
-------
None
") Polygon3D;
		virtual void Polygon3D(const opencascade::handle<Poly_Polygon3D> & P);

		/****************** PolygonOnTriangulation ******************/
		%feature("compactdefaultargs") PolygonOnTriangulation;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Poly_PolygonOnTriangulation>
") PolygonOnTriangulation;
		virtual const opencascade::handle<Poly_PolygonOnTriangulation> & PolygonOnTriangulation();

		/****************** PolygonOnTriangulation ******************/
		%feature("compactdefaultargs") PolygonOnTriangulation;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: Poly_PolygonOnTriangulation

Returns
-------
None
") PolygonOnTriangulation;
		virtual void PolygonOnTriangulation(const opencascade::handle<Poly_PolygonOnTriangulation> & P);

		/****************** PolygonOnTriangulation2 ******************/
		%feature("compactdefaultargs") PolygonOnTriangulation2;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Poly_PolygonOnTriangulation>
") PolygonOnTriangulation2;
		virtual const opencascade::handle<Poly_PolygonOnTriangulation> & PolygonOnTriangulation2();

		/****************** PolygonOnTriangulation2 ******************/
		%feature("compactdefaultargs") PolygonOnTriangulation2;
		%feature("autodoc", "No available documentation.

Parameters
----------
P2: Poly_PolygonOnTriangulation

Returns
-------
None
") PolygonOnTriangulation2;
		virtual void PolygonOnTriangulation2(const opencascade::handle<Poly_PolygonOnTriangulation> & P2);

		/****************** Surface ******************/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom_Surface>
") Surface;
		virtual const opencascade::handle<Geom_Surface> & Surface();

		/****************** Surface2 ******************/
		%feature("compactdefaultargs") Surface2;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom_Surface>
") Surface2;
		virtual const opencascade::handle<Geom_Surface> & Surface2();

		/****************** Triangulation ******************/
		%feature("compactdefaultargs") Triangulation;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Poly_Triangulation>
") Triangulation;
		virtual const opencascade::handle<Poly_Triangulation> & Triangulation();

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
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom_Curve>
") Curve;
		virtual const opencascade::handle<Geom_Curve> & Curve();

		/****************** Curve ******************/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Geom_Curve

Returns
-------
None
") Curve;
		virtual void Curve(const opencascade::handle<Geom_Curve> & C);

		/****************** IsPointOnCurve ******************/
		%feature("compactdefaultargs") IsPointOnCurve;
		%feature("autodoc", "A point on a 3d curve.

Returns
-------
bool
") IsPointOnCurve;
		virtual Standard_Boolean IsPointOnCurve();

		/****************** IsPointOnCurve ******************/
		%feature("compactdefaultargs") IsPointOnCurve;
		%feature("autodoc", "A point on the curve <c>.

Parameters
----------
C: Geom_Curve
L: TopLoc_Location

Returns
-------
bool
") IsPointOnCurve;
		virtual Standard_Boolean IsPointOnCurve(const opencascade::handle<Geom_Curve> & C, const TopLoc_Location & L);

		/****************** IsPointOnCurveOnSurface ******************/
		%feature("compactdefaultargs") IsPointOnCurveOnSurface;
		%feature("autodoc", "A point on a 2d curve on a surface.

Returns
-------
bool
") IsPointOnCurveOnSurface;
		virtual Standard_Boolean IsPointOnCurveOnSurface();

		/****************** IsPointOnCurveOnSurface ******************/
		%feature("compactdefaultargs") IsPointOnCurveOnSurface;
		%feature("autodoc", "A point on the 2d curve <pc> on the surface <s>.

Parameters
----------
PC: Geom2d_Curve
S: Geom_Surface
L: TopLoc_Location

Returns
-------
bool
") IsPointOnCurveOnSurface;
		virtual Standard_Boolean IsPointOnCurveOnSurface(const opencascade::handle<Geom2d_Curve> & PC, const opencascade::handle<Geom_Surface> & S, const TopLoc_Location & L);

		/****************** IsPointOnSurface ******************/
		%feature("compactdefaultargs") IsPointOnSurface;
		%feature("autodoc", "A point on a surface.

Returns
-------
bool
") IsPointOnSurface;
		virtual Standard_Boolean IsPointOnSurface();

		/****************** IsPointOnSurface ******************/
		%feature("compactdefaultargs") IsPointOnSurface;
		%feature("autodoc", "A point on the surface <s>.

Parameters
----------
S: Geom_Surface
L: TopLoc_Location

Returns
-------
bool
") IsPointOnSurface;
		virtual Standard_Boolean IsPointOnSurface(const opencascade::handle<Geom_Surface> & S, const TopLoc_Location & L);

		/****************** Location ******************/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "No available documentation.

Returns
-------
TopLoc_Location
") Location;
		const TopLoc_Location & Location();

		/****************** Location ******************/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: TopLoc_Location

Returns
-------
None
") Location;
		void Location(const TopLoc_Location & L);

		/****************** PCurve ******************/
		%feature("compactdefaultargs") PCurve;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom2d_Curve>
") PCurve;
		virtual const opencascade::handle<Geom2d_Curve> & PCurve();

		/****************** PCurve ******************/
		%feature("compactdefaultargs") PCurve;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Geom2d_Curve

Returns
-------
None
") PCurve;
		virtual void PCurve(const opencascade::handle<Geom2d_Curve> & C);

		/****************** Parameter ******************/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Parameter;
		Standard_Real Parameter();

		/****************** Parameter ******************/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: float

Returns
-------
None
") Parameter;
		void Parameter(const Standard_Real P);

		/****************** Parameter2 ******************/
		%feature("compactdefaultargs") Parameter2;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Parameter2;
		virtual Standard_Real Parameter2();

		/****************** Parameter2 ******************/
		%feature("compactdefaultargs") Parameter2;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: float

Returns
-------
None
") Parameter2;
		virtual void Parameter2(const Standard_Real P);

		/****************** Surface ******************/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom_Surface>
") Surface;
		virtual const opencascade::handle<Geom_Surface> & Surface();

		/****************** Surface ******************/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: Geom_Surface

Returns
-------
None
") Surface;
		virtual void Surface(const opencascade::handle<Geom_Surface> & S);

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
		%feature("autodoc", "Creates an empty tedge.

Returns
-------
None
") BRep_TEdge;
		 BRep_TEdge();

		/****************** ChangeCurves ******************/
		%feature("compactdefaultargs") ChangeCurves;
		%feature("autodoc", "No available documentation.

Returns
-------
BRep_ListOfCurveRepresentation
") ChangeCurves;
		BRep_ListOfCurveRepresentation & ChangeCurves();

		/****************** Curves ******************/
		%feature("compactdefaultargs") Curves;
		%feature("autodoc", "No available documentation.

Returns
-------
BRep_ListOfCurveRepresentation
") Curves;
		const BRep_ListOfCurveRepresentation & Curves();

		/****************** Degenerated ******************/
		%feature("compactdefaultargs") Degenerated;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") Degenerated;
		Standard_Boolean Degenerated();

		/****************** Degenerated ******************/
		%feature("compactdefaultargs") Degenerated;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: bool

Returns
-------
None
") Degenerated;
		void Degenerated(const Standard_Boolean S);

		/****************** EmptyCopy ******************/
		%feature("compactdefaultargs") EmptyCopy;
		%feature("autodoc", "Returns a copy of the tshape with no sub-shapes.

Returns
-------
opencascade::handle<TopoDS_TShape>
") EmptyCopy;
		opencascade::handle<TopoDS_TShape> EmptyCopy();

		/****************** SameParameter ******************/
		%feature("compactdefaultargs") SameParameter;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") SameParameter;
		Standard_Boolean SameParameter();

		/****************** SameParameter ******************/
		%feature("compactdefaultargs") SameParameter;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: bool

Returns
-------
None
") SameParameter;
		void SameParameter(const Standard_Boolean S);

		/****************** SameRange ******************/
		%feature("compactdefaultargs") SameRange;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") SameRange;
		Standard_Boolean SameRange();

		/****************** SameRange ******************/
		%feature("compactdefaultargs") SameRange;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: bool

Returns
-------
None
") SameRange;
		void SameRange(const Standard_Boolean S);

		/****************** Tolerance ******************/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Tolerance;
		Standard_Real Tolerance();

		/****************** Tolerance ******************/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "No available documentation.

Parameters
----------
T: float

Returns
-------
None
") Tolerance;
		void Tolerance(const Standard_Real T);

		/****************** UpdateTolerance ******************/
		%feature("compactdefaultargs") UpdateTolerance;
		%feature("autodoc", "Sets the tolerance to the max of <t> and the current tolerance.

Parameters
----------
T: float

Returns
-------
None
") UpdateTolerance;
		void UpdateTolerance(const Standard_Real T);

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
		%feature("autodoc", "Creates an empty tface.

Returns
-------
None
") BRep_TFace;
		 BRep_TFace();

		/****************** EmptyCopy ******************/
		%feature("compactdefaultargs") EmptyCopy;
		%feature("autodoc", "Returns a copy of the tshape with no sub-shapes. the new face has no triangulation.

Returns
-------
opencascade::handle<TopoDS_TShape>
") EmptyCopy;
		virtual opencascade::handle<TopoDS_TShape> EmptyCopy();

		/****************** Location ******************/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "No available documentation.

Returns
-------
TopLoc_Location
") Location;
		const TopLoc_Location & Location();

		/****************** Location ******************/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: TopLoc_Location

Returns
-------
None
") Location;
		void Location(const TopLoc_Location & L);

		/****************** NaturalRestriction ******************/
		%feature("compactdefaultargs") NaturalRestriction;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") NaturalRestriction;
		Standard_Boolean NaturalRestriction();

		/****************** NaturalRestriction ******************/
		%feature("compactdefaultargs") NaturalRestriction;
		%feature("autodoc", "No available documentation.

Parameters
----------
N: bool

Returns
-------
None
") NaturalRestriction;
		void NaturalRestriction(const Standard_Boolean N);

		/****************** Surface ******************/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom_Surface>
") Surface;
		const opencascade::handle<Geom_Surface> & Surface();

		/****************** Surface ******************/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: Geom_Surface

Returns
-------
None
") Surface;
		void Surface(const opencascade::handle<Geom_Surface> & S);

		/****************** Tolerance ******************/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Tolerance;
		Standard_Real Tolerance();

		/****************** Tolerance ******************/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "No available documentation.

Parameters
----------
T: float

Returns
-------
None
") Tolerance;
		void Tolerance(const Standard_Real T);

		/****************** Triangulation ******************/
		%feature("compactdefaultargs") Triangulation;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Poly_Triangulation>
") Triangulation;
		const opencascade::handle<Poly_Triangulation> & Triangulation();

		/****************** Triangulation ******************/
		%feature("compactdefaultargs") Triangulation;
		%feature("autodoc", "No available documentation.

Parameters
----------
T: Poly_Triangulation

Returns
-------
None
") Triangulation;
		void Triangulation(const opencascade::handle<Poly_Triangulation> & T);

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
		%feature("autodoc", "No available documentation.

Returns
-------
None
") BRep_TVertex;
		 BRep_TVertex();

		/****************** ChangePoints ******************/
		%feature("compactdefaultargs") ChangePoints;
		%feature("autodoc", "No available documentation.

Returns
-------
BRep_ListOfPointRepresentation
") ChangePoints;
		BRep_ListOfPointRepresentation & ChangePoints();

		/****************** EmptyCopy ******************/
		%feature("compactdefaultargs") EmptyCopy;
		%feature("autodoc", "Returns a copy of the tshape with no sub-shapes.

Returns
-------
opencascade::handle<TopoDS_TShape>
") EmptyCopy;
		opencascade::handle<TopoDS_TShape> EmptyCopy();

		/****************** Pnt ******************/
		%feature("compactdefaultargs") Pnt;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Pnt
") Pnt;
		const gp_Pnt Pnt();

		/****************** Pnt ******************/
		%feature("compactdefaultargs") Pnt;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: gp_Pnt

Returns
-------
None
") Pnt;
		void Pnt(const gp_Pnt & P);

		/****************** Points ******************/
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "No available documentation.

Returns
-------
BRep_ListOfPointRepresentation
") Points;
		const BRep_ListOfPointRepresentation & Points();

		/****************** Tolerance ******************/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Tolerance;
		Standard_Real Tolerance();

		/****************** Tolerance ******************/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "No available documentation.

Parameters
----------
T: float

Returns
-------
None
") Tolerance;
		void Tolerance(const Standard_Real T);

		/****************** UpdateTolerance ******************/
		%feature("compactdefaultargs") UpdateTolerance;
		%feature("autodoc", "Sets the tolerance to the max of <t> and the current tolerance.

Parameters
----------
T: float

Returns
-------
None
") UpdateTolerance;
		void UpdateTolerance(const Standard_Real T);

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
		%feature("autodoc", "Returns the continuity.

Parameters
----------
E: TopoDS_Edge
F1: TopoDS_Face
F2: TopoDS_Face

Returns
-------
GeomAbs_Shape
") Continuity;
		static GeomAbs_Shape Continuity(const TopoDS_Edge & E, const TopoDS_Face & F1, const TopoDS_Face & F2);

		/****************** Continuity ******************/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "Returns the continuity.

Parameters
----------
E: TopoDS_Edge
S1: Geom_Surface
S2: Geom_Surface
L1: TopLoc_Location
L2: TopLoc_Location

Returns
-------
GeomAbs_Shape
") Continuity;
		static GeomAbs_Shape Continuity(const TopoDS_Edge & E, const opencascade::handle<Geom_Surface> & S1, const opencascade::handle<Geom_Surface> & S2, const TopLoc_Location & L1, const TopLoc_Location & L2);

		/****************** Curve ******************/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "Returns the 3d curve of the edge. may be a null handle. returns in <l> the location for the curve. in <first> and <last> the parameter range.

Parameters
----------
E: TopoDS_Edge
L: TopLoc_Location

Returns
-------
First: float
Last: float
") Curve;
		static const opencascade::handle<Geom_Curve> & Curve(const TopoDS_Edge & E, TopLoc_Location & L, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Curve ******************/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "Returns the 3d curve of the edge. may be a null handle. in <first> and <last> the parameter range. it can be a copy if there is a location.

Parameters
----------
E: TopoDS_Edge

Returns
-------
First: float
Last: float
") Curve;
		static opencascade::handle<Geom_Curve> Curve(const TopoDS_Edge & E, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** CurveOnPlane ******************/
		%feature("compactdefaultargs") CurveOnPlane;
		%feature("autodoc", "For the planar surface builds the 2d curve for the edge by projection of the edge on plane. returns a null handle if the surface is not planar or the projection failed.

Parameters
----------
E: TopoDS_Edge
S: Geom_Surface
L: TopLoc_Location

Returns
-------
First: float
Last: float
") CurveOnPlane;
		static opencascade::handle<Geom2d_Curve> CurveOnPlane(const TopoDS_Edge & E, const opencascade::handle<Geom_Surface> & S, const TopLoc_Location & L, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** CurveOnSurface ******************/
		%feature("compactdefaultargs") CurveOnSurface;
		%feature("autodoc", "Returns the curve associated to the edge in the parametric space of the face. returns a null handle if this curve does not exist. returns in <first> and <last> the parameter range. if the surface is a plane the curve can be not stored but created a new each time. the flag pointed by <theisstored> serves to indicate storage status. it is valued if the pointer is non-null.

Parameters
----------
E: TopoDS_Edge
F: TopoDS_Face
theIsStored: bool *,optional
	default value is NULL

Returns
-------
First: float
Last: float
") CurveOnSurface;
		static opencascade::handle<Geom2d_Curve> CurveOnSurface(const TopoDS_Edge & E, const TopoDS_Face & F, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Boolean * theIsStored = NULL);

		/****************** CurveOnSurface ******************/
		%feature("compactdefaultargs") CurveOnSurface;
		%feature("autodoc", "Returns the curve associated to the edge in the parametric space of the surface. returns a null handle if this curve does not exist. returns in <first> and <last> the parameter range. if the surface is a plane the curve can be not stored but created a new each time. the flag pointed by <theisstored> serves to indicate storage status. it is valued if the pointer is non-null.

Parameters
----------
E: TopoDS_Edge
S: Geom_Surface
L: TopLoc_Location
theIsStored: bool *,optional
	default value is NULL

Returns
-------
First: float
Last: float
") CurveOnSurface;
		static opencascade::handle<Geom2d_Curve> CurveOnSurface(const TopoDS_Edge & E, const opencascade::handle<Geom_Surface> & S, const TopLoc_Location & L, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Boolean * theIsStored = NULL);

		/****************** CurveOnSurface ******************/
		%feature("compactdefaultargs") CurveOnSurface;
		%feature("autodoc", "Returns in <c>, <s>, <l> a 2d curve, a surface and a location for the edge <e>. <c> and <s> are null if the edge has no curve on surface. returns in <first> and <last> the parameter range.

Parameters
----------
E: TopoDS_Edge
C: Geom2d_Curve
S: Geom_Surface
L: TopLoc_Location

Returns
-------
First: float
Last: float
") CurveOnSurface;
		static void CurveOnSurface(const TopoDS_Edge & E, opencascade::handle<Geom2d_Curve> & C, opencascade::handle<Geom_Surface> & S, TopLoc_Location & L, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** CurveOnSurface ******************/
		%feature("compactdefaultargs") CurveOnSurface;
		%feature("autodoc", "Returns in <c>, <s>, <l> the 2d curve, the surface and the location for the edge <e> of rank <index>. <c> and <s> are null if the index is out of range. returns in <first> and <last> the parameter range.

Parameters
----------
E: TopoDS_Edge
C: Geom2d_Curve
S: Geom_Surface
L: TopLoc_Location
Index: int

Returns
-------
First: float
Last: float
") CurveOnSurface;
		static void CurveOnSurface(const TopoDS_Edge & E, opencascade::handle<Geom2d_Curve> & C, opencascade::handle<Geom_Surface> & S, TopLoc_Location & L, Standard_Real &OutValue, Standard_Real &OutValue, const Standard_Integer Index);

		/****************** Degenerated ******************/
		%feature("compactdefaultargs") Degenerated;
		%feature("autodoc", "Returns true if the edge is degenerated.

Parameters
----------
E: TopoDS_Edge

Returns
-------
bool
") Degenerated;
		static Standard_Boolean Degenerated(const TopoDS_Edge & E);

		/****************** HasContinuity ******************/
		%feature("compactdefaultargs") HasContinuity;
		%feature("autodoc", "Returns true if the edge is on the surfaces of the two faces.

Parameters
----------
E: TopoDS_Edge
F1: TopoDS_Face
F2: TopoDS_Face

Returns
-------
bool
") HasContinuity;
		static Standard_Boolean HasContinuity(const TopoDS_Edge & E, const TopoDS_Face & F1, const TopoDS_Face & F2);

		/****************** HasContinuity ******************/
		%feature("compactdefaultargs") HasContinuity;
		%feature("autodoc", "Returns true if the edge is on the surfaces.

Parameters
----------
E: TopoDS_Edge
S1: Geom_Surface
S2: Geom_Surface
L1: TopLoc_Location
L2: TopLoc_Location

Returns
-------
bool
") HasContinuity;
		static Standard_Boolean HasContinuity(const TopoDS_Edge & E, const opencascade::handle<Geom_Surface> & S1, const opencascade::handle<Geom_Surface> & S2, const TopLoc_Location & L1, const TopLoc_Location & L2);

		/****************** HasContinuity ******************/
		%feature("compactdefaultargs") HasContinuity;
		%feature("autodoc", "Returns true if the edge has regularity on some two surfaces.

Parameters
----------
E: TopoDS_Edge

Returns
-------
bool
") HasContinuity;
		static Standard_Boolean HasContinuity(const TopoDS_Edge & E);

		/****************** IsClosed ******************/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "If s is shell, returns true if it has no free boundaries (edges). if s is wire, returns true if it has no free ends (vertices). (internal and external sub-shepes are ignored in these checks) if s is edge, returns true if its vertices are the same. for other shape types returns s.closed().

Parameters
----------
S: TopoDS_Shape

Returns
-------
bool
") IsClosed;
		static Standard_Boolean IsClosed(const TopoDS_Shape & S);

		/****************** IsClosed ******************/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "Returns true if <e> has two pcurves in the parametric space of <f>. i.e. <f> is on a closed surface and <e> is on the closing curve.

Parameters
----------
E: TopoDS_Edge
F: TopoDS_Face

Returns
-------
bool
") IsClosed;
		static Standard_Boolean IsClosed(const TopoDS_Edge & E, const TopoDS_Face & F);

		/****************** IsClosed ******************/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "Returns true if <e> has two pcurves in the parametric space of <s>. i.e. <s> is a closed surface and <e> is on the closing curve.

Parameters
----------
E: TopoDS_Edge
S: Geom_Surface
L: TopLoc_Location

Returns
-------
bool
") IsClosed;
		static Standard_Boolean IsClosed(const TopoDS_Edge & E, const opencascade::handle<Geom_Surface> & S, const TopLoc_Location & L);

		/****************** IsClosed ******************/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "Returns true if <e> has two arrays of indices in the triangulation <t>.

Parameters
----------
E: TopoDS_Edge
T: Poly_Triangulation
L: TopLoc_Location

Returns
-------
bool
") IsClosed;
		static Standard_Boolean IsClosed(const TopoDS_Edge & E, const opencascade::handle<Poly_Triangulation> & T, const TopLoc_Location & L);

		/****************** IsGeometric ******************/
		%feature("compactdefaultargs") IsGeometric;
		%feature("autodoc", "Returns true if <e> is a 3d curve or a curve on surface.

Parameters
----------
E: TopoDS_Edge

Returns
-------
bool
") IsGeometric;
		static Standard_Boolean IsGeometric(const TopoDS_Edge & E);

		/****************** MaxContinuity ******************/
		%feature("compactdefaultargs") MaxContinuity;
		%feature("autodoc", "Returns the max continuity of edge between some surfaces or geomabs_c0 if there no such surfaces.

Parameters
----------
theEdge: TopoDS_Edge

Returns
-------
GeomAbs_Shape
") MaxContinuity;
		static GeomAbs_Shape MaxContinuity(const TopoDS_Edge & theEdge);

		/****************** MaxTolerance ******************/
		%feature("compactdefaultargs") MaxTolerance;
		%feature("autodoc", "Returns the maximum tolerance of input shape subshapes.

Parameters
----------
theShape: TopoDS_Shape
theSubShape: TopAbs_ShapeEnum

Returns
-------
float
") MaxTolerance;
		static Standard_Real MaxTolerance(const TopoDS_Shape & theShape, const TopAbs_ShapeEnum theSubShape);

		/****************** NaturalRestriction ******************/
		%feature("compactdefaultargs") NaturalRestriction;
		%feature("autodoc", "Returns the naturalrestriction flag of the face.

Parameters
----------
F: TopoDS_Face

Returns
-------
bool
") NaturalRestriction;
		static Standard_Boolean NaturalRestriction(const TopoDS_Face & F);

		/****************** Parameter ******************/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Returns the parameter of <v> on <e>.

Parameters
----------
V: TopoDS_Vertex
E: TopoDS_Edge

Returns
-------
float
") Parameter;
		static Standard_Real Parameter(const TopoDS_Vertex & V, const TopoDS_Edge & E);

		/****************** Parameter ******************/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Returns the parameters of the vertex on the pcurve of the edge on the face.

Parameters
----------
V: TopoDS_Vertex
E: TopoDS_Edge
F: TopoDS_Face

Returns
-------
float
") Parameter;
		static Standard_Real Parameter(const TopoDS_Vertex & V, const TopoDS_Edge & E, const TopoDS_Face & F);

		/****************** Parameter ******************/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Returns the parameters of the vertex on the pcurve of the edge on the surface.

Parameters
----------
V: TopoDS_Vertex
E: TopoDS_Edge
S: Geom_Surface
L: TopLoc_Location

Returns
-------
float
") Parameter;
		static Standard_Real Parameter(const TopoDS_Vertex & V, const TopoDS_Edge & E, const opencascade::handle<Geom_Surface> & S, const TopLoc_Location & L);

		/****************** Parameters ******************/
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "Returns the parameters of the vertex on the face.

Parameters
----------
V: TopoDS_Vertex
F: TopoDS_Face

Returns
-------
gp_Pnt2d
") Parameters;
		static gp_Pnt2d Parameters(const TopoDS_Vertex & V, const TopoDS_Face & F);

		/****************** Pnt ******************/
		%feature("compactdefaultargs") Pnt;
		%feature("autodoc", "Returns the 3d point.

Parameters
----------
V: TopoDS_Vertex

Returns
-------
gp_Pnt
") Pnt;
		static gp_Pnt Pnt(const TopoDS_Vertex & V);

		/****************** Polygon3D ******************/
		%feature("compactdefaultargs") Polygon3D;
		%feature("autodoc", "Returns the 3d polygon of the edge. may be a null handle. returns in <l> the location for the polygon.

Parameters
----------
E: TopoDS_Edge
L: TopLoc_Location

Returns
-------
opencascade::handle<Poly_Polygon3D>
") Polygon3D;
		static const opencascade::handle<Poly_Polygon3D> & Polygon3D(const TopoDS_Edge & E, TopLoc_Location & L);

		/****************** PolygonOnSurface ******************/
		%feature("compactdefaultargs") PolygonOnSurface;
		%feature("autodoc", "Returns the polygon associated to the edge in the parametric space of the face. returns a null handle if this polygon does not exist.

Parameters
----------
E: TopoDS_Edge
F: TopoDS_Face

Returns
-------
opencascade::handle<Poly_Polygon2D>
") PolygonOnSurface;
		static opencascade::handle<Poly_Polygon2D> PolygonOnSurface(const TopoDS_Edge & E, const TopoDS_Face & F);

		/****************** PolygonOnSurface ******************/
		%feature("compactdefaultargs") PolygonOnSurface;
		%feature("autodoc", "Returns the polygon associated to the edge in the parametric space of the surface. returns a null handle if this polygon does not exist.

Parameters
----------
E: TopoDS_Edge
S: Geom_Surface
L: TopLoc_Location

Returns
-------
opencascade::handle<Poly_Polygon2D>
") PolygonOnSurface;
		static opencascade::handle<Poly_Polygon2D> PolygonOnSurface(const TopoDS_Edge & E, const opencascade::handle<Geom_Surface> & S, const TopLoc_Location & L);

		/****************** PolygonOnSurface ******************/
		%feature("compactdefaultargs") PolygonOnSurface;
		%feature("autodoc", "Returns in <c>, <s>, <l> a 2d curve, a surface and a location for the edge <e>. <c> and <s> are null if the edge has no polygon on surface.

Parameters
----------
E: TopoDS_Edge
C: Poly_Polygon2D
S: Geom_Surface
L: TopLoc_Location

Returns
-------
None
") PolygonOnSurface;
		static void PolygonOnSurface(const TopoDS_Edge & E, opencascade::handle<Poly_Polygon2D> & C, opencascade::handle<Geom_Surface> & S, TopLoc_Location & L);

		/****************** PolygonOnSurface ******************/
		%feature("compactdefaultargs") PolygonOnSurface;
		%feature("autodoc", "Returns in <c>, <s>, <l> the 2d curve, the surface and the location for the edge <e> of rank <index>. <c> and <s> are null if the index is out of range.

Parameters
----------
E: TopoDS_Edge
C: Poly_Polygon2D
S: Geom_Surface
L: TopLoc_Location
Index: int

Returns
-------
None
") PolygonOnSurface;
		static void PolygonOnSurface(const TopoDS_Edge & E, opencascade::handle<Poly_Polygon2D> & C, opencascade::handle<Geom_Surface> & S, TopLoc_Location & L, const Standard_Integer Index);

		/****************** PolygonOnTriangulation ******************/
		%feature("compactdefaultargs") PolygonOnTriangulation;
		%feature("autodoc", "Returns the polygon associated to the edge in the parametric space of the face. returns a null handle if this polygon does not exist.

Parameters
----------
E: TopoDS_Edge
T: Poly_Triangulation
L: TopLoc_Location

Returns
-------
opencascade::handle<Poly_PolygonOnTriangulation>
") PolygonOnTriangulation;
		static const opencascade::handle<Poly_PolygonOnTriangulation> & PolygonOnTriangulation(const TopoDS_Edge & E, const opencascade::handle<Poly_Triangulation> & T, const TopLoc_Location & L);

		/****************** PolygonOnTriangulation ******************/
		%feature("compactdefaultargs") PolygonOnTriangulation;
		%feature("autodoc", "Returns in <p>, <t>, <l> a polygon on triangulation, a triangulation and a location for the edge <e>. <p> and <t> are null if the edge has no polygon on triangulation.

Parameters
----------
E: TopoDS_Edge
P: Poly_PolygonOnTriangulation
T: Poly_Triangulation
L: TopLoc_Location

Returns
-------
None
") PolygonOnTriangulation;
		static void PolygonOnTriangulation(const TopoDS_Edge & E, opencascade::handle<Poly_PolygonOnTriangulation> & P, opencascade::handle<Poly_Triangulation> & T, TopLoc_Location & L);

		/****************** PolygonOnTriangulation ******************/
		%feature("compactdefaultargs") PolygonOnTriangulation;
		%feature("autodoc", "Returns in <p>, <t>, <l> a polygon on triangulation, a triangulation and a location for the edge <e> for the range index. <c> and <s> are null if the edge has no polygon on triangulation.

Parameters
----------
E: TopoDS_Edge
P: Poly_PolygonOnTriangulation
T: Poly_Triangulation
L: TopLoc_Location
Index: int

Returns
-------
None
") PolygonOnTriangulation;
		static void PolygonOnTriangulation(const TopoDS_Edge & E, opencascade::handle<Poly_PolygonOnTriangulation> & P, opencascade::handle<Poly_Triangulation> & T, TopLoc_Location & L, const Standard_Integer Index);

		/****************** Range ******************/
		%feature("compactdefaultargs") Range;
		%feature("autodoc", "Gets the range of the 3d curve.

Parameters
----------
E: TopoDS_Edge

Returns
-------
First: float
Last: float
") Range;
		static void Range(const TopoDS_Edge & E, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Range ******************/
		%feature("compactdefaultargs") Range;
		%feature("autodoc", "Gets the range of the edge on the pcurve on the surface.

Parameters
----------
E: TopoDS_Edge
S: Geom_Surface
L: TopLoc_Location

Returns
-------
First: float
Last: float
") Range;
		static void Range(const TopoDS_Edge & E, const opencascade::handle<Geom_Surface> & S, const TopLoc_Location & L, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Range ******************/
		%feature("compactdefaultargs") Range;
		%feature("autodoc", "Gets the range of the edge on the pcurve on the face.

Parameters
----------
E: TopoDS_Edge
F: TopoDS_Face

Returns
-------
First: float
Last: float
") Range;
		static void Range(const TopoDS_Edge & E, const TopoDS_Face & F, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** SameParameter ******************/
		%feature("compactdefaultargs") SameParameter;
		%feature("autodoc", "Returns the sameparameter flag for the edge.

Parameters
----------
E: TopoDS_Edge

Returns
-------
bool
") SameParameter;
		static Standard_Boolean SameParameter(const TopoDS_Edge & E);

		/****************** SameRange ******************/
		%feature("compactdefaultargs") SameRange;
		%feature("autodoc", "Returns the samerange flag for the edge.

Parameters
----------
E: TopoDS_Edge

Returns
-------
bool
") SameRange;
		static Standard_Boolean SameRange(const TopoDS_Edge & E);

		/****************** SetUVPoints ******************/
		%feature("compactdefaultargs") SetUVPoints;
		%feature("autodoc", "Sets the uv locations of the extremities of the edge.

Parameters
----------
E: TopoDS_Edge
S: Geom_Surface
L: TopLoc_Location
PFirst: gp_Pnt2d
PLast: gp_Pnt2d

Returns
-------
None
") SetUVPoints;
		static void SetUVPoints(const TopoDS_Edge & E, const opencascade::handle<Geom_Surface> & S, const TopLoc_Location & L, const gp_Pnt2d & PFirst, const gp_Pnt2d & PLast);

		/****************** SetUVPoints ******************/
		%feature("compactdefaultargs") SetUVPoints;
		%feature("autodoc", "Sets the uv locations of the extremities of the edge.

Parameters
----------
E: TopoDS_Edge
F: TopoDS_Face
PFirst: gp_Pnt2d
PLast: gp_Pnt2d

Returns
-------
None
") SetUVPoints;
		static void SetUVPoints(const TopoDS_Edge & E, const TopoDS_Face & F, const gp_Pnt2d & PFirst, const gp_Pnt2d & PLast);

		/****************** Surface ******************/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "Returns the geometric surface of the face. returns in <l> the location for the surface.

Parameters
----------
F: TopoDS_Face
L: TopLoc_Location

Returns
-------
opencascade::handle<Geom_Surface>
") Surface;
		static const opencascade::handle<Geom_Surface> & Surface(const TopoDS_Face & F, TopLoc_Location & L);

		/****************** Surface ******************/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "Returns the geometric surface of the face. it can be a copy if there is a location.

Parameters
----------
F: TopoDS_Face

Returns
-------
opencascade::handle<Geom_Surface>
") Surface;
		static opencascade::handle<Geom_Surface> Surface(const TopoDS_Face & F);

		/****************** Tolerance ******************/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "Returns the tolerance of the face.

Parameters
----------
F: TopoDS_Face

Returns
-------
float
") Tolerance;
		static Standard_Real Tolerance(const TopoDS_Face & F);

		/****************** Tolerance ******************/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "Returns the tolerance for <e>.

Parameters
----------
E: TopoDS_Edge

Returns
-------
float
") Tolerance;
		static Standard_Real Tolerance(const TopoDS_Edge & E);

		/****************** Tolerance ******************/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "Returns the tolerance.

Parameters
----------
V: TopoDS_Vertex

Returns
-------
float
") Tolerance;
		static Standard_Real Tolerance(const TopoDS_Vertex & V);

		/****************** Triangulation ******************/
		%feature("compactdefaultargs") Triangulation;
		%feature("autodoc", "Returns the triangulation of the face. it is a null handle if there is no triangulation.

Parameters
----------
F: TopoDS_Face
L: TopLoc_Location

Returns
-------
opencascade::handle<Poly_Triangulation>
") Triangulation;
		static const opencascade::handle<Poly_Triangulation> & Triangulation(const TopoDS_Face & F, TopLoc_Location & L);

		/****************** UVPoints ******************/
		%feature("compactdefaultargs") UVPoints;
		%feature("autodoc", "Gets the uv locations of the extremities of the edge.

Parameters
----------
E: TopoDS_Edge
S: Geom_Surface
L: TopLoc_Location
PFirst: gp_Pnt2d
PLast: gp_Pnt2d

Returns
-------
None
") UVPoints;
		static void UVPoints(const TopoDS_Edge & E, const opencascade::handle<Geom_Surface> & S, const TopLoc_Location & L, gp_Pnt2d & PFirst, gp_Pnt2d & PLast);

		/****************** UVPoints ******************/
		%feature("compactdefaultargs") UVPoints;
		%feature("autodoc", "Gets the uv locations of the extremities of the edge.

Parameters
----------
E: TopoDS_Edge
F: TopoDS_Face
PFirst: gp_Pnt2d
PLast: gp_Pnt2d

Returns
-------
None
") UVPoints;
		static void UVPoints(const TopoDS_Edge & E, const TopoDS_Face & F, gp_Pnt2d & PFirst, gp_Pnt2d & PLast);

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
		%feature("autodoc", "No available documentation.

Parameters
----------
S1: Geom_Surface
S2: Geom_Surface
L1: TopLoc_Location
L2: TopLoc_Location
C: GeomAbs_Shape

Returns
-------
None
") BRep_CurveOn2Surfaces;
		 BRep_CurveOn2Surfaces(const opencascade::handle<Geom_Surface> & S1, const opencascade::handle<Geom_Surface> & S2, const TopLoc_Location & L1, const TopLoc_Location & L2, const GeomAbs_Shape C);

		/****************** Continuity ******************/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "No available documentation.

Returns
-------
GeomAbs_Shape
") Continuity;
		virtual const GeomAbs_Shape & Continuity();

		/****************** Continuity ******************/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: GeomAbs_Shape

Returns
-------
None
") Continuity;
		virtual void Continuity(const GeomAbs_Shape C);

		/****************** Copy ******************/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return a copy of this representation.

Returns
-------
opencascade::handle<BRep_CurveRepresentation>
") Copy;
		opencascade::handle<BRep_CurveRepresentation> Copy();

		/****************** D0 ******************/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "Raises an error.

Parameters
----------
U: float
P: gp_Pnt

Returns
-------
None
") D0;
		void D0(const Standard_Real U, gp_Pnt & P);

		/****************** IsRegularity ******************/
		%feature("compactdefaultargs") IsRegularity;
		%feature("autodoc", "Returns true.

Returns
-------
bool
") IsRegularity;
		virtual Standard_Boolean IsRegularity();

		/****************** IsRegularity ******************/
		%feature("compactdefaultargs") IsRegularity;
		%feature("autodoc", "A curve on two surfaces (continuity).

Parameters
----------
S1: Geom_Surface
S2: Geom_Surface
L1: TopLoc_Location
L2: TopLoc_Location

Returns
-------
bool
") IsRegularity;
		virtual Standard_Boolean IsRegularity(const opencascade::handle<Geom_Surface> & S1, const opencascade::handle<Geom_Surface> & S2, const TopLoc_Location & L1, const TopLoc_Location & L2);

		/****************** Location2 ******************/
		%feature("compactdefaultargs") Location2;
		%feature("autodoc", "No available documentation.

Returns
-------
TopLoc_Location
") Location2;
		virtual const TopLoc_Location & Location2();

		/****************** Surface ******************/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom_Surface>
") Surface;
		virtual const opencascade::handle<Geom_Surface> & Surface();

		/****************** Surface2 ******************/
		%feature("compactdefaultargs") Surface2;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom_Surface>
") Surface2;
		virtual const opencascade::handle<Geom_Surface> & Surface2();

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
		%feature("autodoc", "Computes the point at parameter u.

Parameters
----------
U: float
P: gp_Pnt

Returns
-------
None
") D0;
		virtual void D0(const Standard_Real U, gp_Pnt & P);

		/****************** First ******************/
		%feature("compactdefaultargs") First;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") First;
		Standard_Real First();

		/****************** First ******************/
		%feature("compactdefaultargs") First;
		%feature("autodoc", "No available documentation.

Parameters
----------
F: float

Returns
-------
None
") First;
		void First(const Standard_Real F);

		/****************** Last ******************/
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Last;
		Standard_Real Last();

		/****************** Last ******************/
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: float

Returns
-------
None
") Last;
		void Last(const Standard_Real L);

		/****************** Range ******************/
		%feature("compactdefaultargs") Range;
		%feature("autodoc", "No available documentation.

Parameters
----------

Returns
-------
First: float
Last: float
") Range;
		void Range(Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** SetRange ******************/
		%feature("compactdefaultargs") SetRange;
		%feature("autodoc", "No available documentation.

Parameters
----------
First: float
Last: float

Returns
-------
None
") SetRange;
		void SetRange(const Standard_Real First, const Standard_Real Last);

		/****************** Update ******************/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "Recomputes any derived data after a modification. this is called when the range is modified.

Returns
-------
None
") Update;
		virtual void Update();

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
		%feature("autodoc", "No available documentation.

Parameters
----------
P: float
C: Geom_Curve
L: TopLoc_Location

Returns
-------
None
") BRep_PointOnCurve;
		 BRep_PointOnCurve(const Standard_Real P, const opencascade::handle<Geom_Curve> & C, const TopLoc_Location & L);

		/****************** Curve ******************/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom_Curve>
") Curve;
		virtual const opencascade::handle<Geom_Curve> & Curve();

		/****************** Curve ******************/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Geom_Curve

Returns
-------
None
") Curve;
		virtual void Curve(const opencascade::handle<Geom_Curve> & C);

		/****************** IsPointOnCurve ******************/
		%feature("compactdefaultargs") IsPointOnCurve;
		%feature("autodoc", "Returns true.

Returns
-------
bool
") IsPointOnCurve;
		virtual Standard_Boolean IsPointOnCurve();

		/****************** IsPointOnCurve ******************/
		%feature("compactdefaultargs") IsPointOnCurve;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Geom_Curve
L: TopLoc_Location

Returns
-------
bool
") IsPointOnCurve;
		virtual Standard_Boolean IsPointOnCurve(const opencascade::handle<Geom_Curve> & C, const TopLoc_Location & L);

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
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom_Surface>
") Surface;
		virtual const opencascade::handle<Geom_Surface> & Surface();

		/****************** Surface ******************/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: Geom_Surface

Returns
-------
None
") Surface;
		virtual void Surface(const opencascade::handle<Geom_Surface> & S);

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
		%feature("autodoc", "No available documentation.

Parameters
----------
P: Poly_Polygon3D
L: TopLoc_Location

Returns
-------
None
") BRep_Polygon3D;
		 BRep_Polygon3D(const opencascade::handle<Poly_Polygon3D> & P, const TopLoc_Location & L);

		/****************** Copy ******************/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return a copy of this representation.

Returns
-------
opencascade::handle<BRep_CurveRepresentation>
") Copy;
		opencascade::handle<BRep_CurveRepresentation> Copy();

		/****************** IsPolygon3D ******************/
		%feature("compactdefaultargs") IsPolygon3D;
		%feature("autodoc", "Returns true.

Returns
-------
bool
") IsPolygon3D;
		virtual Standard_Boolean IsPolygon3D();

		/****************** Polygon3D ******************/
		%feature("compactdefaultargs") Polygon3D;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Poly_Polygon3D>
") Polygon3D;
		virtual const opencascade::handle<Poly_Polygon3D> & Polygon3D();

		/****************** Polygon3D ******************/
		%feature("compactdefaultargs") Polygon3D;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: Poly_Polygon3D

Returns
-------
None
") Polygon3D;
		virtual void Polygon3D(const opencascade::handle<Poly_Polygon3D> & P);

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
		%feature("autodoc", "No available documentation.

Parameters
----------
P: Poly_Polygon2D
S: Geom_Surface
L: TopLoc_Location

Returns
-------
None
") BRep_PolygonOnSurface;
		 BRep_PolygonOnSurface(const opencascade::handle<Poly_Polygon2D> & P, const opencascade::handle<Geom_Surface> & S, const TopLoc_Location & L);

		/****************** Copy ******************/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return a copy of this representation.

Returns
-------
opencascade::handle<BRep_CurveRepresentation>
") Copy;
		virtual opencascade::handle<BRep_CurveRepresentation> Copy();

		/****************** IsPolygonOnSurface ******************/
		%feature("compactdefaultargs") IsPolygonOnSurface;
		%feature("autodoc", "A 2d polygon representation in the parametric space of a surface.

Returns
-------
bool
") IsPolygonOnSurface;
		virtual Standard_Boolean IsPolygonOnSurface();

		/****************** IsPolygonOnSurface ******************/
		%feature("compactdefaultargs") IsPolygonOnSurface;
		%feature("autodoc", "A 2d polygon representation in the parametric space of a surface.

Parameters
----------
S: Geom_Surface
L: TopLoc_Location

Returns
-------
bool
") IsPolygonOnSurface;
		virtual Standard_Boolean IsPolygonOnSurface(const opencascade::handle<Geom_Surface> & S, const TopLoc_Location & L);

		/****************** Polygon ******************/
		%feature("compactdefaultargs") Polygon;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Poly_Polygon2D>
") Polygon;
		virtual const opencascade::handle<Poly_Polygon2D> & Polygon();

		/****************** Polygon ******************/
		%feature("compactdefaultargs") Polygon;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: Poly_Polygon2D

Returns
-------
None
") Polygon;
		virtual void Polygon(const opencascade::handle<Poly_Polygon2D> & P);

		/****************** Surface ******************/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom_Surface>
") Surface;
		virtual const opencascade::handle<Geom_Surface> & Surface();

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
		%feature("autodoc", "No available documentation.

Parameters
----------
P: Poly_PolygonOnTriangulation
T: Poly_Triangulation
L: TopLoc_Location

Returns
-------
None
") BRep_PolygonOnTriangulation;
		 BRep_PolygonOnTriangulation(const opencascade::handle<Poly_PolygonOnTriangulation> & P, const opencascade::handle<Poly_Triangulation> & T, const TopLoc_Location & L);

		/****************** Copy ******************/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return a copy of this representation.

Returns
-------
opencascade::handle<BRep_CurveRepresentation>
") Copy;
		virtual opencascade::handle<BRep_CurveRepresentation> Copy();

		/****************** IsPolygonOnTriangulation ******************/
		%feature("compactdefaultargs") IsPolygonOnTriangulation;
		%feature("autodoc", "Returns true.

Returns
-------
bool
") IsPolygonOnTriangulation;
		virtual Standard_Boolean IsPolygonOnTriangulation();

		/****************** IsPolygonOnTriangulation ******************/
		%feature("compactdefaultargs") IsPolygonOnTriangulation;
		%feature("autodoc", "Is it a polygon in the definition of <t> with location <l>.

Parameters
----------
T: Poly_Triangulation
L: TopLoc_Location

Returns
-------
bool
") IsPolygonOnTriangulation;
		virtual Standard_Boolean IsPolygonOnTriangulation(const opencascade::handle<Poly_Triangulation> & T, const TopLoc_Location & L);

		/****************** PolygonOnTriangulation ******************/
		%feature("compactdefaultargs") PolygonOnTriangulation;
		%feature("autodoc", "Returns true.

Parameters
----------
P: Poly_PolygonOnTriangulation

Returns
-------
None
") PolygonOnTriangulation;
		virtual void PolygonOnTriangulation(const opencascade::handle<Poly_PolygonOnTriangulation> & P);

		/****************** PolygonOnTriangulation ******************/
		%feature("compactdefaultargs") PolygonOnTriangulation;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Poly_PolygonOnTriangulation>
") PolygonOnTriangulation;
		virtual const opencascade::handle<Poly_PolygonOnTriangulation> & PolygonOnTriangulation();

		/****************** Triangulation ******************/
		%feature("compactdefaultargs") Triangulation;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Poly_Triangulation>
") Triangulation;
		virtual const opencascade::handle<Poly_Triangulation> & Triangulation();

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
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Geom_Curve
L: TopLoc_Location

Returns
-------
None
") BRep_Curve3D;
		 BRep_Curve3D(const opencascade::handle<Geom_Curve> & C, const TopLoc_Location & L);

		/****************** Copy ******************/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return a copy of this representation.

Returns
-------
opencascade::handle<BRep_CurveRepresentation>
") Copy;
		opencascade::handle<BRep_CurveRepresentation> Copy();

		/****************** Curve3D ******************/
		%feature("compactdefaultargs") Curve3D;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom_Curve>
") Curve3D;
		virtual const opencascade::handle<Geom_Curve> & Curve3D();

		/****************** Curve3D ******************/
		%feature("compactdefaultargs") Curve3D;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Geom_Curve

Returns
-------
None
") Curve3D;
		virtual void Curve3D(const opencascade::handle<Geom_Curve> & C);

		/****************** D0 ******************/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "Computes the point at parameter u.

Parameters
----------
U: float
P: gp_Pnt

Returns
-------
None
") D0;
		void D0(const Standard_Real U, gp_Pnt & P);

		/****************** IsCurve3D ******************/
		%feature("compactdefaultargs") IsCurve3D;
		%feature("autodoc", "Returns true.

Returns
-------
bool
") IsCurve3D;
		virtual Standard_Boolean IsCurve3D();

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
		%feature("autodoc", "No available documentation.

Parameters
----------
PC: Geom2d_Curve
S: Geom_Surface
L: TopLoc_Location

Returns
-------
None
") BRep_CurveOnSurface;
		 BRep_CurveOnSurface(const opencascade::handle<Geom2d_Curve> & PC, const opencascade::handle<Geom_Surface> & S, const TopLoc_Location & L);

		/****************** Copy ******************/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return a copy of this representation.

Returns
-------
opencascade::handle<BRep_CurveRepresentation>
") Copy;
		virtual opencascade::handle<BRep_CurveRepresentation> Copy();

		/****************** D0 ******************/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "Computes the point at parameter u.

Parameters
----------
U: float
P: gp_Pnt

Returns
-------
None
") D0;
		void D0(const Standard_Real U, gp_Pnt & P);

		/****************** IsCurveOnSurface ******************/
		%feature("compactdefaultargs") IsCurveOnSurface;
		%feature("autodoc", "Returns true.

Returns
-------
bool
") IsCurveOnSurface;
		virtual Standard_Boolean IsCurveOnSurface();

		/****************** IsCurveOnSurface ******************/
		%feature("compactdefaultargs") IsCurveOnSurface;
		%feature("autodoc", "A curve in the parametric space of a surface.

Parameters
----------
S: Geom_Surface
L: TopLoc_Location

Returns
-------
bool
") IsCurveOnSurface;
		virtual Standard_Boolean IsCurveOnSurface(const opencascade::handle<Geom_Surface> & S, const TopLoc_Location & L);

		/****************** PCurve ******************/
		%feature("compactdefaultargs") PCurve;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom2d_Curve>
") PCurve;
		virtual const opencascade::handle<Geom2d_Curve> & PCurve();

		/****************** PCurve ******************/
		%feature("compactdefaultargs") PCurve;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Geom2d_Curve

Returns
-------
None
") PCurve;
		virtual void PCurve(const opencascade::handle<Geom2d_Curve> & C);

		/****************** SetUVPoints ******************/
		%feature("compactdefaultargs") SetUVPoints;
		%feature("autodoc", "No available documentation.

Parameters
----------
P1: gp_Pnt2d
P2: gp_Pnt2d

Returns
-------
None
") SetUVPoints;
		void SetUVPoints(const gp_Pnt2d & P1, const gp_Pnt2d & P2);

		/****************** Surface ******************/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom_Surface>
") Surface;
		virtual const opencascade::handle<Geom_Surface> & Surface();

		/****************** UVPoints ******************/
		%feature("compactdefaultargs") UVPoints;
		%feature("autodoc", "No available documentation.

Parameters
----------
P1: gp_Pnt2d
P2: gp_Pnt2d

Returns
-------
None
") UVPoints;
		void UVPoints(gp_Pnt2d & P1, gp_Pnt2d & P2);

		/****************** Update ******************/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "Recomputes any derived data after a modification. this is called when the range is modified.

Returns
-------
None
") Update;
		virtual void Update();

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
		%feature("autodoc", "No available documentation.

Parameters
----------
P: float
C: Geom2d_Curve
S: Geom_Surface
L: TopLoc_Location

Returns
-------
None
") BRep_PointOnCurveOnSurface;
		 BRep_PointOnCurveOnSurface(const Standard_Real P, const opencascade::handle<Geom2d_Curve> & C, const opencascade::handle<Geom_Surface> & S, const TopLoc_Location & L);

		/****************** IsPointOnCurveOnSurface ******************/
		%feature("compactdefaultargs") IsPointOnCurveOnSurface;
		%feature("autodoc", "Returns true.

Returns
-------
bool
") IsPointOnCurveOnSurface;
		virtual Standard_Boolean IsPointOnCurveOnSurface();

		/****************** IsPointOnCurveOnSurface ******************/
		%feature("compactdefaultargs") IsPointOnCurveOnSurface;
		%feature("autodoc", "No available documentation.

Parameters
----------
PC: Geom2d_Curve
S: Geom_Surface
L: TopLoc_Location

Returns
-------
bool
") IsPointOnCurveOnSurface;
		virtual Standard_Boolean IsPointOnCurveOnSurface(const opencascade::handle<Geom2d_Curve> & PC, const opencascade::handle<Geom_Surface> & S, const TopLoc_Location & L);

		/****************** PCurve ******************/
		%feature("compactdefaultargs") PCurve;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom2d_Curve>
") PCurve;
		virtual const opencascade::handle<Geom2d_Curve> & PCurve();

		/****************** PCurve ******************/
		%feature("compactdefaultargs") PCurve;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Geom2d_Curve

Returns
-------
None
") PCurve;
		virtual void PCurve(const opencascade::handle<Geom2d_Curve> & C);

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
		%feature("autodoc", "No available documentation.

Parameters
----------
P1: float
P2: float
S: Geom_Surface
L: TopLoc_Location

Returns
-------
None
") BRep_PointOnSurface;
		 BRep_PointOnSurface(const Standard_Real P1, const Standard_Real P2, const opencascade::handle<Geom_Surface> & S, const TopLoc_Location & L);

		/****************** IsPointOnSurface ******************/
		%feature("compactdefaultargs") IsPointOnSurface;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsPointOnSurface;
		virtual Standard_Boolean IsPointOnSurface();

		/****************** IsPointOnSurface ******************/
		%feature("compactdefaultargs") IsPointOnSurface;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: Geom_Surface
L: TopLoc_Location

Returns
-------
bool
") IsPointOnSurface;
		virtual Standard_Boolean IsPointOnSurface(const opencascade::handle<Geom_Surface> & S, const TopLoc_Location & L);

		/****************** Parameter2 ******************/
		%feature("compactdefaultargs") Parameter2;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Parameter2;
		virtual Standard_Real Parameter2();

		/****************** Parameter2 ******************/
		%feature("compactdefaultargs") Parameter2;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: float

Returns
-------
None
") Parameter2;
		virtual void Parameter2(const Standard_Real P);

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
		%feature("autodoc", "No available documentation.

Parameters
----------
P1: Poly_Polygon2D
P2: Poly_Polygon2D
S: Geom_Surface
L: TopLoc_Location

Returns
-------
None
") BRep_PolygonOnClosedSurface;
		 BRep_PolygonOnClosedSurface(const opencascade::handle<Poly_Polygon2D> & P1, const opencascade::handle<Poly_Polygon2D> & P2, const opencascade::handle<Geom_Surface> & S, const TopLoc_Location & L);

		/****************** Copy ******************/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return a copy of this representation.

Returns
-------
opencascade::handle<BRep_CurveRepresentation>
") Copy;
		virtual opencascade::handle<BRep_CurveRepresentation> Copy();

		/****************** IsPolygonOnClosedSurface ******************/
		%feature("compactdefaultargs") IsPolygonOnClosedSurface;
		%feature("autodoc", "Returns true.

Returns
-------
bool
") IsPolygonOnClosedSurface;
		virtual Standard_Boolean IsPolygonOnClosedSurface();

		/****************** Polygon2 ******************/
		%feature("compactdefaultargs") Polygon2;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Poly_Polygon2D>
") Polygon2;
		virtual const opencascade::handle<Poly_Polygon2D> & Polygon2();

		/****************** Polygon2 ******************/
		%feature("compactdefaultargs") Polygon2;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: Poly_Polygon2D

Returns
-------
None
") Polygon2;
		virtual void Polygon2(const opencascade::handle<Poly_Polygon2D> & P);

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
		%feature("autodoc", "No available documentation.

Parameters
----------
P1: Poly_PolygonOnTriangulation
P2: Poly_PolygonOnTriangulation
Tr: Poly_Triangulation
L: TopLoc_Location

Returns
-------
None
") BRep_PolygonOnClosedTriangulation;
		 BRep_PolygonOnClosedTriangulation(const opencascade::handle<Poly_PolygonOnTriangulation> & P1, const opencascade::handle<Poly_PolygonOnTriangulation> & P2, const opencascade::handle<Poly_Triangulation> & Tr, const TopLoc_Location & L);

		/****************** Copy ******************/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return a copy of this representation.

Returns
-------
opencascade::handle<BRep_CurveRepresentation>
") Copy;
		virtual opencascade::handle<BRep_CurveRepresentation> Copy();

		/****************** IsPolygonOnClosedTriangulation ******************/
		%feature("compactdefaultargs") IsPolygonOnClosedTriangulation;
		%feature("autodoc", "Returns true.

Returns
-------
bool
") IsPolygonOnClosedTriangulation;
		virtual Standard_Boolean IsPolygonOnClosedTriangulation();

		/****************** PolygonOnTriangulation2 ******************/
		%feature("compactdefaultargs") PolygonOnTriangulation2;
		%feature("autodoc", "No available documentation.

Parameters
----------
P2: Poly_PolygonOnTriangulation

Returns
-------
None
") PolygonOnTriangulation2;
		virtual void PolygonOnTriangulation2(const opencascade::handle<Poly_PolygonOnTriangulation> & P2);

		/****************** PolygonOnTriangulation2 ******************/
		%feature("compactdefaultargs") PolygonOnTriangulation2;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Poly_PolygonOnTriangulation>
") PolygonOnTriangulation2;
		virtual const opencascade::handle<Poly_PolygonOnTriangulation> & PolygonOnTriangulation2();

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
		%feature("autodoc", "No available documentation.

Parameters
----------
PC1: Geom2d_Curve
PC2: Geom2d_Curve
S: Geom_Surface
L: TopLoc_Location
C: GeomAbs_Shape

Returns
-------
None
") BRep_CurveOnClosedSurface;
		 BRep_CurveOnClosedSurface(const opencascade::handle<Geom2d_Curve> & PC1, const opencascade::handle<Geom2d_Curve> & PC2, const opencascade::handle<Geom_Surface> & S, const TopLoc_Location & L, const GeomAbs_Shape C);

		/****************** Continuity ******************/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "No available documentation.

Returns
-------
GeomAbs_Shape
") Continuity;
		virtual const GeomAbs_Shape & Continuity();

		/****************** Continuity ******************/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: GeomAbs_Shape

Returns
-------
None
") Continuity;
		virtual void Continuity(const GeomAbs_Shape C);

		/****************** Copy ******************/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return a copy of this representation.

Returns
-------
opencascade::handle<BRep_CurveRepresentation>
") Copy;
		virtual opencascade::handle<BRep_CurveRepresentation> Copy();

		/****************** IsCurveOnClosedSurface ******************/
		%feature("compactdefaultargs") IsCurveOnClosedSurface;
		%feature("autodoc", "Returns true.

Returns
-------
bool
") IsCurveOnClosedSurface;
		virtual Standard_Boolean IsCurveOnClosedSurface();

		/****************** IsRegularity ******************/
		%feature("compactdefaultargs") IsRegularity;
		%feature("autodoc", "Returns true.

Returns
-------
bool
") IsRegularity;
		virtual Standard_Boolean IsRegularity();

		/****************** IsRegularity ******************/
		%feature("compactdefaultargs") IsRegularity;
		%feature("autodoc", "A curve on two surfaces (continuity).

Parameters
----------
S1: Geom_Surface
S2: Geom_Surface
L1: TopLoc_Location
L2: TopLoc_Location

Returns
-------
bool
") IsRegularity;
		virtual Standard_Boolean IsRegularity(const opencascade::handle<Geom_Surface> & S1, const opencascade::handle<Geom_Surface> & S2, const TopLoc_Location & L1, const TopLoc_Location & L2);

		/****************** Location2 ******************/
		%feature("compactdefaultargs") Location2;
		%feature("autodoc", "Returns location().

Returns
-------
TopLoc_Location
") Location2;
		virtual const TopLoc_Location & Location2();

		/****************** PCurve2 ******************/
		%feature("compactdefaultargs") PCurve2;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom2d_Curve>
") PCurve2;
		virtual const opencascade::handle<Geom2d_Curve> & PCurve2();

		/****************** PCurve2 ******************/
		%feature("compactdefaultargs") PCurve2;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: Geom2d_Curve

Returns
-------
None
") PCurve2;
		virtual void PCurve2(const opencascade::handle<Geom2d_Curve> & C);

		/****************** SetUVPoints2 ******************/
		%feature("compactdefaultargs") SetUVPoints2;
		%feature("autodoc", "No available documentation.

Parameters
----------
P1: gp_Pnt2d
P2: gp_Pnt2d

Returns
-------
None
") SetUVPoints2;
		void SetUVPoints2(const gp_Pnt2d & P1, const gp_Pnt2d & P2);

		/****************** Surface2 ******************/
		%feature("compactdefaultargs") Surface2;
		%feature("autodoc", "Returns surface().

Returns
-------
opencascade::handle<Geom_Surface>
") Surface2;
		virtual const opencascade::handle<Geom_Surface> & Surface2();

		/****************** UVPoints2 ******************/
		%feature("compactdefaultargs") UVPoints2;
		%feature("autodoc", "No available documentation.

Parameters
----------
P1: gp_Pnt2d
P2: gp_Pnt2d

Returns
-------
None
") UVPoints2;
		void UVPoints2(gp_Pnt2d & P1, gp_Pnt2d & P2);

		/****************** Update ******************/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "Recomputes any derived data after a modification. this is called when the range is modified.

Returns
-------
None
") Update;
		virtual void Update();

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
