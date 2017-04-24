/*
Copyright 2008-2017 Thomas Paviot (tpaviot@gmail.com)


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
%module (package="OCC") BiTgte

#pragma SWIG nowarn=504,325,503

%{
#ifdef WNT
#pragma warning(disable : 4716)
#endif
%}

%include ../common/CommonIncludes.i
%include ../common/ExceptionCatcher.i
%include ../common/FunctionTransformers.i
%include ../common/Operators.i


%include BiTgte_headers.i


%pythoncode {
def register_handle(handle, base_object):
    """
    Inserts the handle into the base object to
    prevent memory corruption in certain cases
    """
    try:
        if base_object.IsKind("Standard_Transient"):
            base_object.thisHandle = handle
            base_object.thisown = False
    except:
        pass
};

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
		%feature("compactdefaultargs") BiTgte_Blend;
		%feature("autodoc", "	:rtype: None
") BiTgte_Blend;
		 BiTgte_Blend ();
		%feature("compactdefaultargs") BiTgte_Blend;
		%feature("autodoc", "	* <S>: Shape to be rounded <Radius>: radius of the fillet <Tol>: Tol3d used in approximations <NUBS>: if true, generate only NUBS surfaces, if false, generate analytical surfaces if possible

	:param S:
	:type S: TopoDS_Shape &
	:param Radius:
	:type Radius: float
	:param Tol:
	:type Tol: float
	:param NUBS:
	:type NUBS: bool
	:rtype: None
") BiTgte_Blend;
		 BiTgte_Blend (const TopoDS_Shape & S,const Standard_Real Radius,const Standard_Real Tol,const Standard_Boolean NUBS);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:param Radius:
	:type Radius: float
	:param Tol:
	:type Tol: float
	:param NUBS:
	:type NUBS: bool
	:rtype: None
") Init;
		void Init (const TopoDS_Shape & S,const Standard_Real Radius,const Standard_Real Tol,const Standard_Boolean NUBS);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	* Clear all the Fields.

	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") SetFaces;
		%feature("autodoc", "	* Set two faces of <myShape> on which the Sphere must roll.

	:param F1:
	:type F1: TopoDS_Face &
	:param F2:
	:type F2: TopoDS_Face &
	:rtype: None
") SetFaces;
		void SetFaces (const TopoDS_Face & F1,const TopoDS_Face & F2);
		%feature("compactdefaultargs") SetEdge;
		%feature("autodoc", "	* Set an edge of <myShape> to be rounded.

	:param Edge:
	:type Edge: TopoDS_Edge &
	:rtype: None
") SetEdge;
		void SetEdge (const TopoDS_Edge & Edge);
		%feature("compactdefaultargs") SetStoppingFace;
		%feature("autodoc", "	* Set a face on which the fillet must stop.

	:param Face:
	:type Face: TopoDS_Face &
	:rtype: None
") SetStoppingFace;
		void SetStoppingFace (const TopoDS_Face & Face);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Compute the generated surfaces. If <BuildShape> is true, compute the resulting Shape. If false, only the blending surfaces are computed.

	:param BuildShape: default value is Standard_True
	:type BuildShape: bool
	:rtype: None
") Perform;
		void Perform (const Standard_Boolean BuildShape = Standard_True);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "	* returns the result

	:rtype: TopoDS_Shape
") Shape;
		const TopoDS_Shape  Shape ();
		%feature("compactdefaultargs") NbSurfaces;
		%feature("autodoc", "	* returns the Number of generated surfaces.

	:rtype: int
") NbSurfaces;
		Standard_Integer NbSurfaces ();
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "	* returns the surface of range Index

	:param Index:
	:type Index: int
	:rtype: Handle_Geom_Surface
") Surface;
		Handle_Geom_Surface Surface (const Standard_Integer Index);
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "	* returns the surface of range Index

	:param Index:
	:type Index: int
	:rtype: TopoDS_Face
") Face;
		const TopoDS_Face  Face (const Standard_Integer Index);
		%feature("compactdefaultargs") CenterLines;
		%feature("autodoc", "	* set in <LC> all the center lines

	:param LC:
	:type LC: TopTools_ListOfShape &
	:rtype: None
") CenterLines;
		void CenterLines (TopTools_ListOfShape & LC);
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "	* returns the surface generated by the centerline. <CenterLine> may be - an edge : generate a pipe. - a vertex : generate a sphere. Warning: returns a Null Handle if <CenterLine> generates no surface.

	:param CenterLine:
	:type CenterLine: TopoDS_Shape &
	:rtype: Handle_Geom_Surface
") Surface;
		Handle_Geom_Surface Surface (const TopoDS_Shape & CenterLine);
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "	* returns the face generated by the centerline. <CenterLine> may be - an edge : generate a pipe. - a vertex : generate a sphere. Warning: returns a Null Shape if <CenterLine> generates no surface.

	:param CenterLine:
	:type CenterLine: TopoDS_Shape &
	:rtype: TopoDS_Face
") Face;
		const TopoDS_Face  Face (const TopoDS_Shape & CenterLine);
		%feature("compactdefaultargs") ContactType;
		%feature("autodoc", "	* returns the type of contact

	:param Index:
	:type Index: int
	:rtype: BiTgte_ContactType
") ContactType;
		BiTgte_ContactType ContactType (const Standard_Integer Index);
		%feature("compactdefaultargs") SupportShape1;
		%feature("autodoc", "	* gives the first support shape relative to SurfaceFillet(Index);

	:param Index:
	:type Index: int
	:rtype: TopoDS_Shape
") SupportShape1;
		const TopoDS_Shape  SupportShape1 (const Standard_Integer Index);
		%feature("compactdefaultargs") SupportShape2;
		%feature("autodoc", "	* gives the second support shape relative to SurfaceFillet(Index);

	:param Index:
	:type Index: int
	:rtype: TopoDS_Shape
") SupportShape2;
		const TopoDS_Shape  SupportShape2 (const Standard_Integer Index);
		%feature("compactdefaultargs") CurveOnShape1;
		%feature("autodoc", "	* gives the 3d curve of SurfaceFillet(Index) on SupportShape1(Index)

	:param Index:
	:type Index: int
	:rtype: Handle_Geom_Curve
") CurveOnShape1;
		Handle_Geom_Curve CurveOnShape1 (const Standard_Integer Index);
		%feature("compactdefaultargs") CurveOnShape2;
		%feature("autodoc", "	* gives the 3d curve of SurfaceFillet(Index) on SupportShape2(Index)

	:param Index:
	:type Index: int
	:rtype: Handle_Geom_Curve
") CurveOnShape2;
		Handle_Geom_Curve CurveOnShape2 (const Standard_Integer Index);
		%feature("compactdefaultargs") PCurveOnFace1;
		%feature("autodoc", "	* gives the PCurve associated to CurvOnShape1(Index) on the support face Warning: returns a Null Handle if SupportShape1 is not a Face

	:param Index:
	:type Index: int
	:rtype: Handle_Geom2d_Curve
") PCurveOnFace1;
		Handle_Geom2d_Curve PCurveOnFace1 (const Standard_Integer Index);
		%feature("compactdefaultargs") PCurve1OnFillet;
		%feature("autodoc", "	* gives the PCurve associated to CurveOnShape1(Index) on the Fillet

	:param Index:
	:type Index: int
	:rtype: Handle_Geom2d_Curve
") PCurve1OnFillet;
		Handle_Geom2d_Curve PCurve1OnFillet (const Standard_Integer Index);
		%feature("compactdefaultargs") PCurveOnFace2;
		%feature("autodoc", "	* gives the PCurve associated to CurveOnShape2(Index) on the support face Warning: returns a Null Handle if SupportShape2 is not a Face

	:param Index:
	:type Index: int
	:rtype: Handle_Geom2d_Curve
") PCurveOnFace2;
		Handle_Geom2d_Curve PCurveOnFace2 (const Standard_Integer Index);
		%feature("compactdefaultargs") PCurve2OnFillet;
		%feature("autodoc", "	* gives the PCurve associated to CurveOnShape2(Index) on the fillet

	:param Index:
	:type Index: int
	:rtype: Handle_Geom2d_Curve
") PCurve2OnFillet;
		Handle_Geom2d_Curve PCurve2OnFillet (const Standard_Integer Index);
		%feature("compactdefaultargs") NbBranches;
		%feature("autodoc", "	:rtype: int
") NbBranches;
		Standard_Integer NbBranches ();
		%feature("compactdefaultargs") IndicesOfBranche;
		%feature("autodoc", "	* Set in <From>,<To> the indices of the faces of the branche <Index>. //! i.e: Branche<Index> = Face(From) + Face(From+1) + ..+ Face(To)

	:param Index:
	:type Index: int
	:param From:
	:type From: int &
	:param To:
	:type To: int &
	:rtype: None
") IndicesOfBranche;
		void IndicesOfBranche (const Standard_Integer Index,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("compactdefaultargs") ComputeCenters;
		%feature("autodoc", "	* Computes the center lines

	:rtype: None
") ComputeCenters;
		void ComputeCenters ();
};


%extend BiTgte_Blend {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BiTgte_CurveOnEdge;
class BiTgte_CurveOnEdge : public Adaptor3d_Curve {
	public:
		%feature("compactdefaultargs") BiTgte_CurveOnEdge;
		%feature("autodoc", "	:rtype: None
") BiTgte_CurveOnEdge;
		 BiTgte_CurveOnEdge ();
		%feature("compactdefaultargs") BiTgte_CurveOnEdge;
		%feature("autodoc", "	:param EonF:
	:type EonF: TopoDS_Edge &
	:param Edge:
	:type Edge: TopoDS_Edge &
	:rtype: None
") BiTgte_CurveOnEdge;
		 BiTgte_CurveOnEdge (const TopoDS_Edge & EonF,const TopoDS_Edge & Edge);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param EonF:
	:type EonF: TopoDS_Edge &
	:param Edge:
	:type Edge: TopoDS_Edge &
	:rtype: None
") Init;
		void Init (const TopoDS_Edge & EonF,const TopoDS_Edge & Edge);
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "	:rtype: float
") FirstParameter;
		Standard_Real FirstParameter ();
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "	:rtype: float
") LastParameter;
		Standard_Real LastParameter ();
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "	:rtype: GeomAbs_Shape
") Continuity;
		GeomAbs_Shape Continuity ();
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "	* Returns the number of intervals for continuity <S>. May be one if Continuity(me) >= <S>

	:param S:
	:type S: GeomAbs_Shape
	:rtype: int
") NbIntervals;
		Standard_Integer NbIntervals (const GeomAbs_Shape S);
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "	* Stores in <T> the parameters bounding the intervals of continuity <S>. //! The array must provide enough room to accomodate for the parameters. i.e. T.Length() > NbIntervals()

	:param T:
	:type T: TColStd_Array1OfReal &
	:param S:
	:type S: GeomAbs_Shape
	:rtype: None
") Intervals;
		void Intervals (TColStd_Array1OfReal & T,const GeomAbs_Shape S);
		%feature("compactdefaultargs") Trim;
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
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "	:rtype: bool
") IsClosed;
		Standard_Boolean IsClosed ();
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "	:rtype: bool
") IsPeriodic;
		Standard_Boolean IsPeriodic ();
		%feature("compactdefaultargs") Period;
		%feature("autodoc", "	:rtype: float
") Period;
		Standard_Real Period ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Computes the point of parameter U on the curve.

	:param U:
	:type U: float
	:rtype: gp_Pnt
") Value;
		gp_Pnt Value (const Standard_Real U);
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "	* Computes the point of parameter U on the curve.

	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt
	:rtype: None
") D0;
		void D0 (const Standard_Real U,gp_Pnt & P);
		%feature("compactdefaultargs") D1;
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
		%feature("compactdefaultargs") D2;
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
		%feature("compactdefaultargs") D3;
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
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "	* The returned vector gives the value of the derivative for the order of derivation N. Raised if the continuity of the current interval is not CN. Raised if N < 1.

	:param U:
	:type U: float
	:param N:
	:type N: int
	:rtype: gp_Vec
") DN;
		gp_Vec DN (const Standard_Real U,const Standard_Integer N);
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "	* Returns the parametric resolution corresponding to the real space resolution <R3d>.

	:param R3d:
	:type R3d: float
	:rtype: float
") Resolution;
		Standard_Real Resolution (const Standard_Real R3d);
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "	* Returns the type of the curve in the current interval : Line, Circle, Ellipse, Hyperbola, Parabola, BezierCurve, BSplineCurve, OtherCurve.

	:rtype: GeomAbs_CurveType
") GetType;
		GeomAbs_CurveType GetType ();
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "	:rtype: gp_Lin
") Line;
		gp_Lin Line ();
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", "	:rtype: gp_Circ
") Circle;
		gp_Circ Circle ();
		%feature("compactdefaultargs") Ellipse;
		%feature("autodoc", "	:rtype: gp_Elips
") Ellipse;
		gp_Elips Ellipse ();
		%feature("compactdefaultargs") Hyperbola;
		%feature("autodoc", "	:rtype: gp_Hypr
") Hyperbola;
		gp_Hypr Hyperbola ();
		%feature("compactdefaultargs") Parabola;
		%feature("autodoc", "	:rtype: gp_Parab
") Parabola;
		gp_Parab Parabola ();
		%feature("compactdefaultargs") Degree;
		%feature("autodoc", "	:rtype: int
") Degree;
		Standard_Integer Degree ();
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "	:rtype: bool
") IsRational;
		Standard_Boolean IsRational ();
		%feature("compactdefaultargs") NbPoles;
		%feature("autodoc", "	:rtype: int
") NbPoles;
		Standard_Integer NbPoles ();
		%feature("compactdefaultargs") NbKnots;
		%feature("autodoc", "	:rtype: int
") NbKnots;
		Standard_Integer NbKnots ();
		%feature("compactdefaultargs") Bezier;
		%feature("autodoc", "	:rtype: Handle_Geom_BezierCurve
") Bezier;
		Handle_Geom_BezierCurve Bezier ();
		%feature("compactdefaultargs") BSpline;
		%feature("autodoc", "	:rtype: Handle_Geom_BSplineCurve
") BSpline;
		Handle_Geom_BSplineCurve BSpline ();
};


%extend BiTgte_CurveOnEdge {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BiTgte_CurveOnVertex;
class BiTgte_CurveOnVertex : public Adaptor3d_Curve {
	public:
		%feature("compactdefaultargs") BiTgte_CurveOnVertex;
		%feature("autodoc", "	:rtype: None
") BiTgte_CurveOnVertex;
		 BiTgte_CurveOnVertex ();
		%feature("compactdefaultargs") BiTgte_CurveOnVertex;
		%feature("autodoc", "	:param EonF:
	:type EonF: TopoDS_Edge &
	:param V:
	:type V: TopoDS_Vertex &
	:rtype: None
") BiTgte_CurveOnVertex;
		 BiTgte_CurveOnVertex (const TopoDS_Edge & EonF,const TopoDS_Vertex & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param EonF:
	:type EonF: TopoDS_Edge &
	:param V:
	:type V: TopoDS_Vertex &
	:rtype: None
") Init;
		void Init (const TopoDS_Edge & EonF,const TopoDS_Vertex & V);
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "	:rtype: float
") FirstParameter;
		Standard_Real FirstParameter ();
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "	:rtype: float
") LastParameter;
		Standard_Real LastParameter ();
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "	:rtype: GeomAbs_Shape
") Continuity;
		GeomAbs_Shape Continuity ();
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "	* Returns the number of intervals for continuity <S>. May be one if Continuity(me) >= <S>

	:param S:
	:type S: GeomAbs_Shape
	:rtype: int
") NbIntervals;
		Standard_Integer NbIntervals (const GeomAbs_Shape S);
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "	* Stores in <T> the parameters bounding the intervals of continuity <S>. //! The array must provide enough room to accomodate for the parameters. i.e. T.Length() > NbIntervals()

	:param T:
	:type T: TColStd_Array1OfReal &
	:param S:
	:type S: GeomAbs_Shape
	:rtype: None
") Intervals;
		void Intervals (TColStd_Array1OfReal & T,const GeomAbs_Shape S);
		%feature("compactdefaultargs") Trim;
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
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "	:rtype: bool
") IsClosed;
		Standard_Boolean IsClosed ();
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "	:rtype: bool
") IsPeriodic;
		Standard_Boolean IsPeriodic ();
		%feature("compactdefaultargs") Period;
		%feature("autodoc", "	:rtype: float
") Period;
		Standard_Real Period ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Computes the point of parameter U on the curve.

	:param U:
	:type U: float
	:rtype: gp_Pnt
") Value;
		gp_Pnt Value (const Standard_Real U);
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "	* Computes the point of parameter U on the curve.

	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt
	:rtype: None
") D0;
		void D0 (const Standard_Real U,gp_Pnt & P);
		%feature("compactdefaultargs") D1;
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
		%feature("compactdefaultargs") D2;
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
		%feature("compactdefaultargs") D3;
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
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "	* The returned vector gives the value of the derivative for the order of derivation N. Raised if the continuity of the current interval is not CN. Raised if N < 1.

	:param U:
	:type U: float
	:param N:
	:type N: int
	:rtype: gp_Vec
") DN;
		gp_Vec DN (const Standard_Real U,const Standard_Integer N);
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "	* Returns the parametric resolution corresponding to the real space resolution <R3d>.

	:param R3d:
	:type R3d: float
	:rtype: float
") Resolution;
		Standard_Real Resolution (const Standard_Real R3d);
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "	* Returns the type of the curve in the current interval : Line, Circle, Ellipse, Hyperbola, Parabola, BezierCurve, BSplineCurve, OtherCurve.

	:rtype: GeomAbs_CurveType
") GetType;
		GeomAbs_CurveType GetType ();
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "	:rtype: gp_Lin
") Line;
		gp_Lin Line ();
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", "	:rtype: gp_Circ
") Circle;
		gp_Circ Circle ();
		%feature("compactdefaultargs") Ellipse;
		%feature("autodoc", "	:rtype: gp_Elips
") Ellipse;
		gp_Elips Ellipse ();
		%feature("compactdefaultargs") Hyperbola;
		%feature("autodoc", "	:rtype: gp_Hypr
") Hyperbola;
		gp_Hypr Hyperbola ();
		%feature("compactdefaultargs") Parabola;
		%feature("autodoc", "	:rtype: gp_Parab
") Parabola;
		gp_Parab Parabola ();
		%feature("compactdefaultargs") Degree;
		%feature("autodoc", "	:rtype: int
") Degree;
		Standard_Integer Degree ();
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "	:rtype: bool
") IsRational;
		Standard_Boolean IsRational ();
		%feature("compactdefaultargs") NbPoles;
		%feature("autodoc", "	:rtype: int
") NbPoles;
		Standard_Integer NbPoles ();
		%feature("compactdefaultargs") NbKnots;
		%feature("autodoc", "	:rtype: int
") NbKnots;
		Standard_Integer NbKnots ();
		%feature("compactdefaultargs") Bezier;
		%feature("autodoc", "	:rtype: Handle_Geom_BezierCurve
") Bezier;
		Handle_Geom_BezierCurve Bezier ();
		%feature("compactdefaultargs") BSpline;
		%feature("autodoc", "	:rtype: Handle_Geom_BSplineCurve
") BSpline;
		Handle_Geom_BSplineCurve BSpline ();
};


%extend BiTgte_CurveOnVertex {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BiTgte_DataMapIteratorOfDataMapOfShapeBox;
class BiTgte_DataMapIteratorOfDataMapOfShapeBox : public TCollection_BasicMapIterator {
	public:
		%feature("compactdefaultargs") BiTgte_DataMapIteratorOfDataMapOfShapeBox;
		%feature("autodoc", "	:rtype: None
") BiTgte_DataMapIteratorOfDataMapOfShapeBox;
		 BiTgte_DataMapIteratorOfDataMapOfShapeBox ();
		%feature("compactdefaultargs") BiTgte_DataMapIteratorOfDataMapOfShapeBox;
		%feature("autodoc", "	:param aMap:
	:type aMap: BiTgte_DataMapOfShapeBox &
	:rtype: None
") BiTgte_DataMapIteratorOfDataMapOfShapeBox;
		 BiTgte_DataMapIteratorOfDataMapOfShapeBox (const BiTgte_DataMapOfShapeBox & aMap);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param aMap:
	:type aMap: BiTgte_DataMapOfShapeBox &
	:rtype: None
") Initialize;
		void Initialize (const BiTgte_DataMapOfShapeBox & aMap);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Key;
		const TopoDS_Shape  Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Bnd_Box
") Value;
		const Bnd_Box & Value ();
};


%extend BiTgte_DataMapIteratorOfDataMapOfShapeBox {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BiTgte_DataMapNodeOfDataMapOfShapeBox;
class BiTgte_DataMapNodeOfDataMapOfShapeBox : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") BiTgte_DataMapNodeOfDataMapOfShapeBox;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:param I:
	:type I: Bnd_Box &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") BiTgte_DataMapNodeOfDataMapOfShapeBox;
		 BiTgte_DataMapNodeOfDataMapOfShapeBox (const TopoDS_Shape & K,const Bnd_Box & I,const TCollection_MapNodePtr & n);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Key;
		TopoDS_Shape  Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Bnd_Box
") Value;
		Bnd_Box & Value ();
};


%extend BiTgte_DataMapNodeOfDataMapOfShapeBox {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_BiTgte_DataMapNodeOfDataMapOfShapeBox(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_BiTgte_DataMapNodeOfDataMapOfShapeBox::Handle_BiTgte_DataMapNodeOfDataMapOfShapeBox %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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
    BiTgte_DataMapNodeOfDataMapOfShapeBox* _get_reference() {
    return (BiTgte_DataMapNodeOfDataMapOfShapeBox*)$self->Access();
    }
};

%extend Handle_BiTgte_DataMapNodeOfDataMapOfShapeBox {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend BiTgte_DataMapNodeOfDataMapOfShapeBox {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BiTgte_DataMapOfShapeBox;
class BiTgte_DataMapOfShapeBox : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") BiTgte_DataMapOfShapeBox;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") BiTgte_DataMapOfShapeBox;
		 BiTgte_DataMapOfShapeBox (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: BiTgte_DataMapOfShapeBox &
	:rtype: BiTgte_DataMapOfShapeBox
") Assign;
		BiTgte_DataMapOfShapeBox & Assign (const BiTgte_DataMapOfShapeBox & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: BiTgte_DataMapOfShapeBox &
	:rtype: BiTgte_DataMapOfShapeBox
") operator =;
		BiTgte_DataMapOfShapeBox & operator = (const BiTgte_DataMapOfShapeBox & Other);
		%feature("compactdefaultargs") ReSize;
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: int
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:param I:
	:type I: Bnd_Box &
	:rtype: bool
") Bind;
		Standard_Boolean Bind (const TopoDS_Shape & K,const Bnd_Box & I);
		%feature("compactdefaultargs") IsBound;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: bool
") IsBound;
		Standard_Boolean IsBound (const TopoDS_Shape & K);
		%feature("compactdefaultargs") UnBind;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: bool
") UnBind;
		Standard_Boolean UnBind (const TopoDS_Shape & K);
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: Bnd_Box
") Find;
		const Bnd_Box & Find (const TopoDS_Shape & K);
		%feature("compactdefaultargs") ChangeFind;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: Bnd_Box
") ChangeFind;
		Bnd_Box & ChangeFind (const TopoDS_Shape & K);
		%feature("compactdefaultargs") Find1;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: Standard_Address
") Find1;
		Standard_Address Find1 (const TopoDS_Shape & K);
		%feature("compactdefaultargs") ChangeFind1;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: Standard_Address
") ChangeFind1;
		Standard_Address ChangeFind1 (const TopoDS_Shape & K);
};


%extend BiTgte_DataMapOfShapeBox {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BiTgte_HCurveOnEdge;
class BiTgte_HCurveOnEdge : public Adaptor3d_HCurve {
	public:
		%feature("compactdefaultargs") BiTgte_HCurveOnEdge;
		%feature("autodoc", "	:rtype: None
") BiTgte_HCurveOnEdge;
		 BiTgte_HCurveOnEdge ();
		%feature("compactdefaultargs") BiTgte_HCurveOnEdge;
		%feature("autodoc", "	:param C:
	:type C: BiTgte_CurveOnEdge &
	:rtype: None
") BiTgte_HCurveOnEdge;
		 BiTgte_HCurveOnEdge (const BiTgte_CurveOnEdge & C);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	:param C:
	:type C: BiTgte_CurveOnEdge &
	:rtype: None
") Set;
		void Set (const BiTgte_CurveOnEdge & C);
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "	:rtype: Adaptor3d_Curve
") Curve;
		const Adaptor3d_Curve & Curve ();
		%feature("compactdefaultargs") GetCurve;
		%feature("autodoc", "	:rtype: Adaptor3d_Curve
") GetCurve;
		Adaptor3d_Curve & GetCurve ();
		%feature("compactdefaultargs") ChangeCurve;
		%feature("autodoc", "	:rtype: BiTgte_CurveOnEdge
") ChangeCurve;
		BiTgte_CurveOnEdge & ChangeCurve ();
};


%extend BiTgte_HCurveOnEdge {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_BiTgte_HCurveOnEdge(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_BiTgte_HCurveOnEdge::Handle_BiTgte_HCurveOnEdge %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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
    BiTgte_HCurveOnEdge* _get_reference() {
    return (BiTgte_HCurveOnEdge*)$self->Access();
    }
};

%extend Handle_BiTgte_HCurveOnEdge {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend BiTgte_HCurveOnEdge {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BiTgte_HCurveOnVertex;
class BiTgte_HCurveOnVertex : public Adaptor3d_HCurve {
	public:
		%feature("compactdefaultargs") BiTgte_HCurveOnVertex;
		%feature("autodoc", "	:rtype: None
") BiTgte_HCurveOnVertex;
		 BiTgte_HCurveOnVertex ();
		%feature("compactdefaultargs") BiTgte_HCurveOnVertex;
		%feature("autodoc", "	:param C:
	:type C: BiTgte_CurveOnVertex &
	:rtype: None
") BiTgte_HCurveOnVertex;
		 BiTgte_HCurveOnVertex (const BiTgte_CurveOnVertex & C);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	:param C:
	:type C: BiTgte_CurveOnVertex &
	:rtype: None
") Set;
		void Set (const BiTgte_CurveOnVertex & C);
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "	:rtype: Adaptor3d_Curve
") Curve;
		const Adaptor3d_Curve & Curve ();
		%feature("compactdefaultargs") GetCurve;
		%feature("autodoc", "	:rtype: Adaptor3d_Curve
") GetCurve;
		Adaptor3d_Curve & GetCurve ();
		%feature("compactdefaultargs") ChangeCurve;
		%feature("autodoc", "	:rtype: BiTgte_CurveOnVertex
") ChangeCurve;
		BiTgte_CurveOnVertex & ChangeCurve ();
};


%extend BiTgte_HCurveOnVertex {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_BiTgte_HCurveOnVertex(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_BiTgte_HCurveOnVertex::Handle_BiTgte_HCurveOnVertex %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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
    BiTgte_HCurveOnVertex* _get_reference() {
    return (BiTgte_HCurveOnVertex*)$self->Access();
    }
};

%extend Handle_BiTgte_HCurveOnVertex {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend BiTgte_HCurveOnVertex {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
