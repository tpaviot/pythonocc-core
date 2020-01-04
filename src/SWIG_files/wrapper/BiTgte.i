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
%define BITGTEDOCSTRING
"BiTgte module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_bitgte.html"
%enddef
%module (package="OCC.Core", docstring=BITGTEDOCSTRING) BiTgte


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
#include<BiTgte_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TopoDS_module.hxx>
#include<TopTools_module.hxx>
#include<Geom_module.hxx>
#include<Geom2d_module.hxx>
#include<Adaptor3d_module.hxx>
#include<gp_module.hxx>
#include<GeomAbs_module.hxx>
#include<TColStd_module.hxx>
#include<TopLoc_module.hxx>
#include<Message_module.hxx>
#include<Adaptor2d_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import TopoDS.i
%import TopTools.i
%import Geom.i
%import Geom2d.i
%import Adaptor3d.i
%import gp.i
%import GeomAbs.i
%import TColStd.i
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

/* handles */
%wrap_handle(BiTgte_HCurveOnEdge)
%wrap_handle(BiTgte_HCurveOnVertex)
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/*********************
* class BiTgte_Blend *
*********************/
class BiTgte_Blend {
	public:
		/****************** BiTgte_Blend ******************/
		%feature("compactdefaultargs") BiTgte_Blend;
		%feature("autodoc", ":rtype: None") BiTgte_Blend;
		 BiTgte_Blend ();

		/****************** BiTgte_Blend ******************/
		%feature("compactdefaultargs") BiTgte_Blend;
		%feature("autodoc", "* <S>: Shape to be rounded <Radius>: radius of the fillet <Tol>: Tol3d used in approximations <NUBS>: if true, generate only NUBS surfaces, if false, generate analytical surfaces if possible
	:param S:
	:type S: TopoDS_Shape
	:param Radius:
	:type Radius: float
	:param Tol:
	:type Tol: float
	:param NUBS:
	:type NUBS: bool
	:rtype: None") BiTgte_Blend;
		 BiTgte_Blend (const TopoDS_Shape & S,const Standard_Real Radius,const Standard_Real Tol,const Standard_Boolean NUBS);

		/****************** CenterLines ******************/
		%feature("compactdefaultargs") CenterLines;
		%feature("autodoc", "* set in <LC> all the center lines
	:param LC:
	:type LC: TopTools_ListOfShape
	:rtype: None") CenterLines;
		void CenterLines (TopTools_ListOfShape & LC);

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "* Clear all the Fields.
	:rtype: None") Clear;
		void Clear ();

		/****************** ComputeCenters ******************/
		%feature("compactdefaultargs") ComputeCenters;
		%feature("autodoc", "* Computes the center lines
	:rtype: None") ComputeCenters;
		void ComputeCenters ();

		/****************** ContactType ******************/
		%feature("compactdefaultargs") ContactType;
		%feature("autodoc", "* returns the type of contact
	:param Index:
	:type Index: int
	:rtype: BiTgte_ContactType") ContactType;
		BiTgte_ContactType ContactType (const Standard_Integer Index);

		/****************** CurveOnShape1 ******************/
		%feature("compactdefaultargs") CurveOnShape1;
		%feature("autodoc", "* gives the 3d curve of SurfaceFillet(Index) on SupportShape1(Index)
	:param Index:
	:type Index: int
	:rtype: opencascade::handle<Geom_Curve>") CurveOnShape1;
		opencascade::handle<Geom_Curve> CurveOnShape1 (const Standard_Integer Index);

		/****************** CurveOnShape2 ******************/
		%feature("compactdefaultargs") CurveOnShape2;
		%feature("autodoc", "* gives the 3d curve of SurfaceFillet(Index) on SupportShape2(Index)
	:param Index:
	:type Index: int
	:rtype: opencascade::handle<Geom_Curve>") CurveOnShape2;
		opencascade::handle<Geom_Curve> CurveOnShape2 (const Standard_Integer Index);

		/****************** Face ******************/
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "* returns the surface of range Index
	:param Index:
	:type Index: int
	:rtype: TopoDS_Face") Face;
		const TopoDS_Face  Face (const Standard_Integer Index);

		/****************** Face ******************/
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "* returns the face generated by the centerline. <CenterLine> may be - an edge : generate a pipe. - a vertex : generate a sphere. Warning: returns a Null Shape if <CenterLine> generates no surface.
	:param CenterLine:
	:type CenterLine: TopoDS_Shape
	:rtype: TopoDS_Face") Face;
		const TopoDS_Face  Face (const TopoDS_Shape & CenterLine);

		/****************** IndicesOfBranche ******************/
		%feature("compactdefaultargs") IndicesOfBranche;
		%feature("autodoc", "* Set in <From>,<To> the indices of the faces of the branche <Index>. //! i.e: Branche<Index> = Face(From) + Face(From+1) + ..+ Face(To)
	:param Index:
	:type Index: int
	:param From:
	:type From: int
	:param To:
	:type To: int
	:rtype: None") IndicesOfBranche;
		void IndicesOfBranche (const Standard_Integer Index,Standard_Integer &OutValue,Standard_Integer &OutValue);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:param Radius:
	:type Radius: float
	:param Tol:
	:type Tol: float
	:param NUBS:
	:type NUBS: bool
	:rtype: None") Init;
		void Init (const TopoDS_Shape & S,const Standard_Real Radius,const Standard_Real Tol,const Standard_Boolean NUBS);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", ":rtype: bool") IsDone;
		Standard_Boolean IsDone ();

		/****************** NbBranches ******************/
		%feature("compactdefaultargs") NbBranches;
		%feature("autodoc", ":rtype: int") NbBranches;
		Standard_Integer NbBranches ();

		/****************** NbSurfaces ******************/
		%feature("compactdefaultargs") NbSurfaces;
		%feature("autodoc", "* returns the Number of generated surfaces.
	:rtype: int") NbSurfaces;
		Standard_Integer NbSurfaces ();

		/****************** PCurve1OnFillet ******************/
		%feature("compactdefaultargs") PCurve1OnFillet;
		%feature("autodoc", "* gives the PCurve associated to CurveOnShape1(Index) on the Fillet
	:param Index:
	:type Index: int
	:rtype: opencascade::handle<Geom2d_Curve>") PCurve1OnFillet;
		opencascade::handle<Geom2d_Curve> PCurve1OnFillet (const Standard_Integer Index);

		/****************** PCurve2OnFillet ******************/
		%feature("compactdefaultargs") PCurve2OnFillet;
		%feature("autodoc", "* gives the PCurve associated to CurveOnShape2(Index) on the fillet
	:param Index:
	:type Index: int
	:rtype: opencascade::handle<Geom2d_Curve>") PCurve2OnFillet;
		opencascade::handle<Geom2d_Curve> PCurve2OnFillet (const Standard_Integer Index);

		/****************** PCurveOnFace1 ******************/
		%feature("compactdefaultargs") PCurveOnFace1;
		%feature("autodoc", "* gives the PCurve associated to CurvOnShape1(Index) on the support face Warning: returns a Null Handle if SupportShape1 is not a Face
	:param Index:
	:type Index: int
	:rtype: opencascade::handle<Geom2d_Curve>") PCurveOnFace1;
		opencascade::handle<Geom2d_Curve> PCurveOnFace1 (const Standard_Integer Index);

		/****************** PCurveOnFace2 ******************/
		%feature("compactdefaultargs") PCurveOnFace2;
		%feature("autodoc", "* gives the PCurve associated to CurveOnShape2(Index) on the support face Warning: returns a Null Handle if SupportShape2 is not a Face
	:param Index:
	:type Index: int
	:rtype: opencascade::handle<Geom2d_Curve>") PCurveOnFace2;
		opencascade::handle<Geom2d_Curve> PCurveOnFace2 (const Standard_Integer Index);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Compute the generated surfaces. If <BuildShape> is true, compute the resulting Shape. If false, only the blending surfaces are computed.
	:param BuildShape: default value is Standard_True
	:type BuildShape: bool
	:rtype: None") Perform;
		void Perform (const Standard_Boolean BuildShape = Standard_True);

		/****************** SetEdge ******************/
		%feature("compactdefaultargs") SetEdge;
		%feature("autodoc", "* Set an edge of <myShape> to be rounded.
	:param Edge:
	:type Edge: TopoDS_Edge
	:rtype: None") SetEdge;
		void SetEdge (const TopoDS_Edge & Edge);

		/****************** SetFaces ******************/
		%feature("compactdefaultargs") SetFaces;
		%feature("autodoc", "* Set two faces of <myShape> on which the Sphere must roll.
	:param F1:
	:type F1: TopoDS_Face
	:param F2:
	:type F2: TopoDS_Face
	:rtype: None") SetFaces;
		void SetFaces (const TopoDS_Face & F1,const TopoDS_Face & F2);

		/****************** SetStoppingFace ******************/
		%feature("compactdefaultargs") SetStoppingFace;
		%feature("autodoc", "* Set a face on which the fillet must stop.
	:param Face:
	:type Face: TopoDS_Face
	:rtype: None") SetStoppingFace;
		void SetStoppingFace (const TopoDS_Face & Face);

		/****************** Shape ******************/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "* returns the result
	:rtype: TopoDS_Shape") Shape;
		const TopoDS_Shape  Shape ();

		/****************** SupportShape1 ******************/
		%feature("compactdefaultargs") SupportShape1;
		%feature("autodoc", "* gives the first support shape relative to SurfaceFillet(Index);
	:param Index:
	:type Index: int
	:rtype: TopoDS_Shape") SupportShape1;
		const TopoDS_Shape  SupportShape1 (const Standard_Integer Index);

		/****************** SupportShape2 ******************/
		%feature("compactdefaultargs") SupportShape2;
		%feature("autodoc", "* gives the second support shape relative to SurfaceFillet(Index);
	:param Index:
	:type Index: int
	:rtype: TopoDS_Shape") SupportShape2;
		const TopoDS_Shape  SupportShape2 (const Standard_Integer Index);

		/****************** Surface ******************/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "* returns the surface of range Index
	:param Index:
	:type Index: int
	:rtype: opencascade::handle<Geom_Surface>") Surface;
		opencascade::handle<Geom_Surface> Surface (const Standard_Integer Index);

		/****************** Surface ******************/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "* returns the surface generated by the centerline. <CenterLine> may be - an edge : generate a pipe. - a vertex : generate a sphere. Warning: returns a Null Handle if <CenterLine> generates no surface.
	:param CenterLine:
	:type CenterLine: TopoDS_Shape
	:rtype: opencascade::handle<Geom_Surface>") Surface;
		opencascade::handle<Geom_Surface> Surface (const TopoDS_Shape & CenterLine);

};


%extend BiTgte_Blend {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class BiTgte_CurveOnEdge *
***************************/
class BiTgte_CurveOnEdge : public Adaptor3d_Curve {
	public:
		/****************** BSpline ******************/
		%feature("compactdefaultargs") BSpline;
		%feature("autodoc", ":rtype: opencascade::handle<Geom_BSplineCurve>") BSpline;
		opencascade::handle<Geom_BSplineCurve> BSpline ();

		/****************** Bezier ******************/
		%feature("compactdefaultargs") Bezier;
		%feature("autodoc", ":rtype: opencascade::handle<Geom_BezierCurve>") Bezier;
		opencascade::handle<Geom_BezierCurve> Bezier ();

		/****************** BiTgte_CurveOnEdge ******************/
		%feature("compactdefaultargs") BiTgte_CurveOnEdge;
		%feature("autodoc", ":rtype: None") BiTgte_CurveOnEdge;
		 BiTgte_CurveOnEdge ();

		/****************** BiTgte_CurveOnEdge ******************/
		%feature("compactdefaultargs") BiTgte_CurveOnEdge;
		%feature("autodoc", ":param EonF:
	:type EonF: TopoDS_Edge
	:param Edge:
	:type Edge: TopoDS_Edge
	:rtype: None") BiTgte_CurveOnEdge;
		 BiTgte_CurveOnEdge (const TopoDS_Edge & EonF,const TopoDS_Edge & Edge);

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
		%feature("autodoc", "* Computes the point of parameter U on the curve.
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
		%feature("autodoc", "* Returns the type of the curve in the current interval : Line, Circle, Ellipse, Hyperbola, Parabola, BezierCurve, BSplineCurve, OtherCurve.
	:rtype: GeomAbs_CurveType") GetType;
		GeomAbs_CurveType GetType ();

		/****************** Hyperbola ******************/
		%feature("compactdefaultargs") Hyperbola;
		%feature("autodoc", ":rtype: gp_Hypr") Hyperbola;
		gp_Hypr Hyperbola ();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", ":param EonF:
	:type EonF: TopoDS_Edge
	:param Edge:
	:type Edge: TopoDS_Edge
	:rtype: None") Init;
		void Init (const TopoDS_Edge & EonF,const TopoDS_Edge & Edge);

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
		%feature("autodoc", "* Returns the parametric resolution corresponding to the real space resolution <R3d>.
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
		%feature("autodoc", "* Computes the point of parameter U on the curve.
	:param U:
	:type U: float
	:rtype: gp_Pnt") Value;
		gp_Pnt Value (const Standard_Real U);

};


%extend BiTgte_CurveOnEdge {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class BiTgte_CurveOnVertex *
*****************************/
class BiTgte_CurveOnVertex : public Adaptor3d_Curve {
	public:
		/****************** BSpline ******************/
		%feature("compactdefaultargs") BSpline;
		%feature("autodoc", ":rtype: opencascade::handle<Geom_BSplineCurve>") BSpline;
		opencascade::handle<Geom_BSplineCurve> BSpline ();

		/****************** Bezier ******************/
		%feature("compactdefaultargs") Bezier;
		%feature("autodoc", ":rtype: opencascade::handle<Geom_BezierCurve>") Bezier;
		opencascade::handle<Geom_BezierCurve> Bezier ();

		/****************** BiTgte_CurveOnVertex ******************/
		%feature("compactdefaultargs") BiTgte_CurveOnVertex;
		%feature("autodoc", ":rtype: None") BiTgte_CurveOnVertex;
		 BiTgte_CurveOnVertex ();

		/****************** BiTgte_CurveOnVertex ******************/
		%feature("compactdefaultargs") BiTgte_CurveOnVertex;
		%feature("autodoc", ":param EonF:
	:type EonF: TopoDS_Edge
	:param V:
	:type V: TopoDS_Vertex
	:rtype: None") BiTgte_CurveOnVertex;
		 BiTgte_CurveOnVertex (const TopoDS_Edge & EonF,const TopoDS_Vertex & V);

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
		%feature("autodoc", "* Computes the point of parameter U on the curve.
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
		%feature("autodoc", "* Returns the type of the curve in the current interval : Line, Circle, Ellipse, Hyperbola, Parabola, BezierCurve, BSplineCurve, OtherCurve.
	:rtype: GeomAbs_CurveType") GetType;
		GeomAbs_CurveType GetType ();

		/****************** Hyperbola ******************/
		%feature("compactdefaultargs") Hyperbola;
		%feature("autodoc", ":rtype: gp_Hypr") Hyperbola;
		gp_Hypr Hyperbola ();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", ":param EonF:
	:type EonF: TopoDS_Edge
	:param V:
	:type V: TopoDS_Vertex
	:rtype: None") Init;
		void Init (const TopoDS_Edge & EonF,const TopoDS_Vertex & V);

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
		%feature("autodoc", "* Returns the parametric resolution corresponding to the real space resolution <R3d>.
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
		%feature("autodoc", "* Computes the point of parameter U on the curve.
	:param U:
	:type U: float
	:rtype: gp_Pnt") Value;
		gp_Pnt Value (const Standard_Real U);

};


%extend BiTgte_CurveOnVertex {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class BiTgte_HCurveOnEdge *
****************************/
class BiTgte_HCurveOnEdge : public Adaptor3d_HCurve {
	public:
		/****************** BiTgte_HCurveOnEdge ******************/
		%feature("compactdefaultargs") BiTgte_HCurveOnEdge;
		%feature("autodoc", "* Creates an empty GenHCurve.
	:rtype: None") BiTgte_HCurveOnEdge;
		 BiTgte_HCurveOnEdge ();

		/****************** BiTgte_HCurveOnEdge ******************/
		%feature("compactdefaultargs") BiTgte_HCurveOnEdge;
		%feature("autodoc", "* Creates a GenHCurve from a Curve
	:param C:
	:type C: BiTgte_CurveOnEdge
	:rtype: None") BiTgte_HCurveOnEdge;
		 BiTgte_HCurveOnEdge (const BiTgte_CurveOnEdge & C);

		/****************** ChangeCurve ******************/
		%feature("compactdefaultargs") ChangeCurve;
		%feature("autodoc", "* Returns the curve used to create the GenHCurve.
	:rtype: BiTgte_CurveOnEdge") ChangeCurve;
		BiTgte_CurveOnEdge & ChangeCurve ();

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
	:type C: BiTgte_CurveOnEdge
	:rtype: None") Set;
		void Set (const BiTgte_CurveOnEdge & C);

};


%make_alias(BiTgte_HCurveOnEdge)

%extend BiTgte_HCurveOnEdge {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class BiTgte_HCurveOnVertex *
******************************/
class BiTgte_HCurveOnVertex : public Adaptor3d_HCurve {
	public:
		/****************** BiTgte_HCurveOnVertex ******************/
		%feature("compactdefaultargs") BiTgte_HCurveOnVertex;
		%feature("autodoc", "* Creates an empty GenHCurve.
	:rtype: None") BiTgte_HCurveOnVertex;
		 BiTgte_HCurveOnVertex ();

		/****************** BiTgte_HCurveOnVertex ******************/
		%feature("compactdefaultargs") BiTgte_HCurveOnVertex;
		%feature("autodoc", "* Creates a GenHCurve from a Curve
	:param C:
	:type C: BiTgte_CurveOnVertex
	:rtype: None") BiTgte_HCurveOnVertex;
		 BiTgte_HCurveOnVertex (const BiTgte_CurveOnVertex & C);

		/****************** ChangeCurve ******************/
		%feature("compactdefaultargs") ChangeCurve;
		%feature("autodoc", "* Returns the curve used to create the GenHCurve.
	:rtype: BiTgte_CurveOnVertex") ChangeCurve;
		BiTgte_CurveOnVertex & ChangeCurve ();

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
	:type C: BiTgte_CurveOnVertex
	:rtype: None") Set;
		void Set (const BiTgte_CurveOnVertex & C);

};


%make_alias(BiTgte_HCurveOnVertex)

%extend BiTgte_HCurveOnVertex {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
