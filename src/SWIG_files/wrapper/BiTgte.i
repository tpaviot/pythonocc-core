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

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

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

/* python proy classes for enums */
%pythoncode {

class BiTgte_ContactType(IntEnum):
	BiTgte_FaceFace = 0
	BiTgte_FaceEdge = 1
	BiTgte_FaceVertex = 2
	BiTgte_EdgeEdge = 3
	BiTgte_EdgeVertex = 4
	BiTgte_VertexVertex = 5
BiTgte_FaceFace = BiTgte_ContactType.BiTgte_FaceFace
BiTgte_FaceEdge = BiTgte_ContactType.BiTgte_FaceEdge
BiTgte_FaceVertex = BiTgte_ContactType.BiTgte_FaceVertex
BiTgte_EdgeEdge = BiTgte_ContactType.BiTgte_EdgeEdge
BiTgte_EdgeVertex = BiTgte_ContactType.BiTgte_EdgeVertex
BiTgte_VertexVertex = BiTgte_ContactType.BiTgte_VertexVertex
};
/* end python proxy for enums */

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
		%feature("autodoc", "No available documentation.

Returns
-------
None
") BiTgte_Blend;
		 BiTgte_Blend();

		/****************** BiTgte_Blend ******************/
		%feature("compactdefaultargs") BiTgte_Blend;
		%feature("autodoc", "<s>: shape to be rounded <radius>: radius of the fillet <tol>: tol3d used in approximations <nubs>: if true, generate only nubs surfaces, if false, generate analytical surfaces if possible.

Parameters
----------
S: TopoDS_Shape
Radius: float
Tol: float
NUBS: bool

Returns
-------
None
") BiTgte_Blend;
		 BiTgte_Blend(const TopoDS_Shape & S, const Standard_Real Radius, const Standard_Real Tol, const Standard_Boolean NUBS);

		/****************** CenterLines ******************/
		%feature("compactdefaultargs") CenterLines;
		%feature("autodoc", "Set in <lc> all the center lines.

Parameters
----------
LC: TopTools_ListOfShape

Returns
-------
None
") CenterLines;
		void CenterLines(TopTools_ListOfShape & LC);

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Clear all the fields.

Returns
-------
None
") Clear;
		void Clear();

		/****************** ComputeCenters ******************/
		%feature("compactdefaultargs") ComputeCenters;
		%feature("autodoc", "Computes the center lines.

Returns
-------
None
") ComputeCenters;
		void ComputeCenters();

		/****************** ContactType ******************/
		%feature("compactdefaultargs") ContactType;
		%feature("autodoc", "Returns the type of contact.

Parameters
----------
Index: int

Returns
-------
BiTgte_ContactType
") ContactType;
		BiTgte_ContactType ContactType(const Standard_Integer Index);

		/****************** CurveOnShape1 ******************/
		%feature("compactdefaultargs") CurveOnShape1;
		%feature("autodoc", "Gives the 3d curve of surfacefillet(index) on supportshape1(index).

Parameters
----------
Index: int

Returns
-------
opencascade::handle<Geom_Curve>
") CurveOnShape1;
		opencascade::handle<Geom_Curve> CurveOnShape1(const Standard_Integer Index);

		/****************** CurveOnShape2 ******************/
		%feature("compactdefaultargs") CurveOnShape2;
		%feature("autodoc", "Gives the 3d curve of surfacefillet(index) on supportshape2(index).

Parameters
----------
Index: int

Returns
-------
opencascade::handle<Geom_Curve>
") CurveOnShape2;
		opencascade::handle<Geom_Curve> CurveOnShape2(const Standard_Integer Index);

		/****************** Face ******************/
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "Returns the surface of range index.

Parameters
----------
Index: int

Returns
-------
TopoDS_Face
") Face;
		const TopoDS_Face Face(const Standard_Integer Index);

		/****************** Face ******************/
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "Returns the face generated by the centerline. <centerline> may be - an edge : generate a pipe. - a vertex : generate a sphere. warning: returns a null shape if <centerline> generates no surface.

Parameters
----------
CenterLine: TopoDS_Shape

Returns
-------
TopoDS_Face
") Face;
		const TopoDS_Face Face(const TopoDS_Shape & CenterLine);

		/****************** IndicesOfBranche ******************/
		%feature("compactdefaultargs") IndicesOfBranche;
		%feature("autodoc", "Set in <from>,<to> the indices of the faces of the branche <index>. //! i.e: branche<index> = face(from) + face(from+1) + ..+ face(to).

Parameters
----------
Index: int

Returns
-------
From: int
To: int
") IndicesOfBranche;
		void IndicesOfBranche(const Standard_Integer Index, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape
Radius: float
Tol: float
NUBS: bool

Returns
-------
None
") Init;
		void Init(const TopoDS_Shape & S, const Standard_Real Radius, const Standard_Real Tol, const Standard_Boolean NUBS);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** NbBranches ******************/
		%feature("compactdefaultargs") NbBranches;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbBranches;
		Standard_Integer NbBranches();

		/****************** NbSurfaces ******************/
		%feature("compactdefaultargs") NbSurfaces;
		%feature("autodoc", "Returns the number of generated surfaces.

Returns
-------
int
") NbSurfaces;
		Standard_Integer NbSurfaces();

		/****************** PCurve1OnFillet ******************/
		%feature("compactdefaultargs") PCurve1OnFillet;
		%feature("autodoc", "Gives the pcurve associated to curveonshape1(index) on the fillet.

Parameters
----------
Index: int

Returns
-------
opencascade::handle<Geom2d_Curve>
") PCurve1OnFillet;
		opencascade::handle<Geom2d_Curve> PCurve1OnFillet(const Standard_Integer Index);

		/****************** PCurve2OnFillet ******************/
		%feature("compactdefaultargs") PCurve2OnFillet;
		%feature("autodoc", "Gives the pcurve associated to curveonshape2(index) on the fillet.

Parameters
----------
Index: int

Returns
-------
opencascade::handle<Geom2d_Curve>
") PCurve2OnFillet;
		opencascade::handle<Geom2d_Curve> PCurve2OnFillet(const Standard_Integer Index);

		/****************** PCurveOnFace1 ******************/
		%feature("compactdefaultargs") PCurveOnFace1;
		%feature("autodoc", "Gives the pcurve associated to curvonshape1(index) on the support face warning: returns a null handle if supportshape1 is not a face.

Parameters
----------
Index: int

Returns
-------
opencascade::handle<Geom2d_Curve>
") PCurveOnFace1;
		opencascade::handle<Geom2d_Curve> PCurveOnFace1(const Standard_Integer Index);

		/****************** PCurveOnFace2 ******************/
		%feature("compactdefaultargs") PCurveOnFace2;
		%feature("autodoc", "Gives the pcurve associated to curveonshape2(index) on the support face warning: returns a null handle if supportshape2 is not a face.

Parameters
----------
Index: int

Returns
-------
opencascade::handle<Geom2d_Curve>
") PCurveOnFace2;
		opencascade::handle<Geom2d_Curve> PCurveOnFace2(const Standard_Integer Index);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Compute the generated surfaces. if <buildshape> is true, compute the resulting shape. if false, only the blending surfaces are computed.

Parameters
----------
BuildShape: bool,optional
	default value is Standard_True

Returns
-------
None
") Perform;
		void Perform(const Standard_Boolean BuildShape = Standard_True);

		/****************** SetEdge ******************/
		%feature("compactdefaultargs") SetEdge;
		%feature("autodoc", "Set an edge of <myshape> to be rounded.

Parameters
----------
Edge: TopoDS_Edge

Returns
-------
None
") SetEdge;
		void SetEdge(const TopoDS_Edge & Edge);

		/****************** SetFaces ******************/
		%feature("compactdefaultargs") SetFaces;
		%feature("autodoc", "Set two faces of <myshape> on which the sphere must roll.

Parameters
----------
F1: TopoDS_Face
F2: TopoDS_Face

Returns
-------
None
") SetFaces;
		void SetFaces(const TopoDS_Face & F1, const TopoDS_Face & F2);

		/****************** SetStoppingFace ******************/
		%feature("compactdefaultargs") SetStoppingFace;
		%feature("autodoc", "Set a face on which the fillet must stop.

Parameters
----------
Face: TopoDS_Face

Returns
-------
None
") SetStoppingFace;
		void SetStoppingFace(const TopoDS_Face & Face);

		/****************** Shape ******************/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "Returns the result.

Returns
-------
TopoDS_Shape
") Shape;
		const TopoDS_Shape Shape();

		/****************** SupportShape1 ******************/
		%feature("compactdefaultargs") SupportShape1;
		%feature("autodoc", "Gives the first support shape relative to surfacefillet(index);.

Parameters
----------
Index: int

Returns
-------
TopoDS_Shape
") SupportShape1;
		const TopoDS_Shape SupportShape1(const Standard_Integer Index);

		/****************** SupportShape2 ******************/
		%feature("compactdefaultargs") SupportShape2;
		%feature("autodoc", "Gives the second support shape relative to surfacefillet(index);.

Parameters
----------
Index: int

Returns
-------
TopoDS_Shape
") SupportShape2;
		const TopoDS_Shape SupportShape2(const Standard_Integer Index);

		/****************** Surface ******************/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "Returns the surface of range index.

Parameters
----------
Index: int

Returns
-------
opencascade::handle<Geom_Surface>
") Surface;
		opencascade::handle<Geom_Surface> Surface(const Standard_Integer Index);

		/****************** Surface ******************/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "Returns the surface generated by the centerline. <centerline> may be - an edge : generate a pipe. - a vertex : generate a sphere. warning: returns a null handle if <centerline> generates no surface.

Parameters
----------
CenterLine: TopoDS_Shape

Returns
-------
opencascade::handle<Geom_Surface>
") Surface;
		opencascade::handle<Geom_Surface> Surface(const TopoDS_Shape & CenterLine);

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
		/****************** BiTgte_CurveOnEdge ******************/
		%feature("compactdefaultargs") BiTgte_CurveOnEdge;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") BiTgte_CurveOnEdge;
		 BiTgte_CurveOnEdge();

		/****************** BiTgte_CurveOnEdge ******************/
		%feature("compactdefaultargs") BiTgte_CurveOnEdge;
		%feature("autodoc", "No available documentation.

Parameters
----------
EonF: TopoDS_Edge
Edge: TopoDS_Edge

Returns
-------
None
") BiTgte_CurveOnEdge;
		 BiTgte_CurveOnEdge(const TopoDS_Edge & EonF, const TopoDS_Edge & Edge);

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
		%feature("autodoc", "Computes the point of parameter u on the curve.

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
		%feature("autodoc", "Returns the type of the curve in the current interval : line, circle, ellipse, hyperbola, parabola, beziercurve, bsplinecurve, othercurve.

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

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
EonF: TopoDS_Edge
Edge: TopoDS_Edge

Returns
-------
None
") Init;
		void Init(const TopoDS_Edge & EonF, const TopoDS_Edge & Edge);

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
		%feature("autodoc", "Returns the parametric resolution corresponding to the real space resolution <r3d>.

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
		/****************** BiTgte_CurveOnVertex ******************/
		%feature("compactdefaultargs") BiTgte_CurveOnVertex;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") BiTgte_CurveOnVertex;
		 BiTgte_CurveOnVertex();

		/****************** BiTgte_CurveOnVertex ******************/
		%feature("compactdefaultargs") BiTgte_CurveOnVertex;
		%feature("autodoc", "No available documentation.

Parameters
----------
EonF: TopoDS_Edge
V: TopoDS_Vertex

Returns
-------
None
") BiTgte_CurveOnVertex;
		 BiTgte_CurveOnVertex(const TopoDS_Edge & EonF, const TopoDS_Vertex & V);

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
		%feature("autodoc", "Computes the point of parameter u on the curve.

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
		%feature("autodoc", "Returns the type of the curve in the current interval : line, circle, ellipse, hyperbola, parabola, beziercurve, bsplinecurve, othercurve.

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

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
EonF: TopoDS_Edge
V: TopoDS_Vertex

Returns
-------
None
") Init;
		void Init(const TopoDS_Edge & EonF, const TopoDS_Vertex & V);

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
		%feature("autodoc", "Returns the parametric resolution corresponding to the real space resolution <r3d>.

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
		%feature("autodoc", "Creates an empty genhcurve.

Returns
-------
None
") BiTgte_HCurveOnEdge;
		 BiTgte_HCurveOnEdge();

		/****************** BiTgte_HCurveOnEdge ******************/
		%feature("compactdefaultargs") BiTgte_HCurveOnEdge;
		%feature("autodoc", "Creates a genhcurve from a curve.

Parameters
----------
C: BiTgte_CurveOnEdge

Returns
-------
None
") BiTgte_HCurveOnEdge;
		 BiTgte_HCurveOnEdge(const BiTgte_CurveOnEdge & C);

		/****************** ChangeCurve ******************/
		%feature("compactdefaultargs") ChangeCurve;
		%feature("autodoc", "Returns the curve used to create the genhcurve.

Returns
-------
BiTgte_CurveOnEdge
") ChangeCurve;
		BiTgte_CurveOnEdge & ChangeCurve();

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
C: BiTgte_CurveOnEdge

Returns
-------
None
") Set;
		void Set(const BiTgte_CurveOnEdge & C);

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
		%feature("autodoc", "Creates an empty genhcurve.

Returns
-------
None
") BiTgte_HCurveOnVertex;
		 BiTgte_HCurveOnVertex();

		/****************** BiTgte_HCurveOnVertex ******************/
		%feature("compactdefaultargs") BiTgte_HCurveOnVertex;
		%feature("autodoc", "Creates a genhcurve from a curve.

Parameters
----------
C: BiTgte_CurveOnVertex

Returns
-------
None
") BiTgte_HCurveOnVertex;
		 BiTgte_HCurveOnVertex(const BiTgte_CurveOnVertex & C);

		/****************** ChangeCurve ******************/
		%feature("compactdefaultargs") ChangeCurve;
		%feature("autodoc", "Returns the curve used to create the genhcurve.

Returns
-------
BiTgte_CurveOnVertex
") ChangeCurve;
		BiTgte_CurveOnVertex & ChangeCurve();

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
C: BiTgte_CurveOnVertex

Returns
-------
None
") Set;
		void Set(const BiTgte_CurveOnVertex & C);

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
