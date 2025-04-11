/*
Copyright 2008-2025 Thomas Paviot (tpaviot@gmail.com)

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
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_bitgte.html"
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
%include ../common/EnumTemplates.i
%include ../common/Operators.i
%include ../common/OccHandle.i
%include ../common/IOStream.i
%include ../common/ArrayMacros.i


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

/* python proxy classes for enums */
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
%wrap_handle(BiTgte_CurveOnEdge)
%wrap_handle(BiTgte_CurveOnVertex)
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
		/****** BiTgte_Blend::BiTgte_Blend ******/
		/****** md5 signature: 17bbf5741df841e75fdafac78b2e1d31 ******/
		%feature("compactdefaultargs") BiTgte_Blend;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") BiTgte_Blend;
		 BiTgte_Blend();

		/****** BiTgte_Blend::BiTgte_Blend ******/
		/****** md5 signature: fcb4eb450d07dc46f49934b8ae41b66a ******/
		%feature("compactdefaultargs") BiTgte_Blend;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
Radius: float
Tol: float
NUBS: bool

Return
-------
None

Description
-----------
<S>: Shape to be rounded <Radius>: radius of the fillet <Tol>: Tol3d used in approximations <NUBS>: if true, generate only NUBS surfaces, if false, generate analytical surfaces if possible.
") BiTgte_Blend;
		 BiTgte_Blend(const TopoDS_Shape & S, const Standard_Real Radius, const Standard_Real Tol, const Standard_Boolean NUBS);

		/****** BiTgte_Blend::CenterLines ******/
		/****** md5 signature: 7cdcbf17f88410937fa3a02ee6e6ff64 ******/
		%feature("compactdefaultargs") CenterLines;
		%feature("autodoc", "
Parameters
----------
LC: TopTools_ListOfShape

Return
-------
None

Description
-----------
set in <LC> all the center lines.
") CenterLines;
		void CenterLines(TopTools_ListOfShape & LC);

		/****** BiTgte_Blend::Clear ******/
		/****** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clear all the Fields.
") Clear;
		void Clear();

		/****** BiTgte_Blend::ComputeCenters ******/
		/****** md5 signature: fe2fd315b9e436238841f2e4295f6482 ******/
		%feature("compactdefaultargs") ComputeCenters;
		%feature("autodoc", "Return
-------
None

Description
-----------
Computes the center lines.
") ComputeCenters;
		void ComputeCenters();

		/****** BiTgte_Blend::ContactType ******/
		/****** md5 signature: 06cf96a6f5ad52a17a27271b2a4780a8 ******/
		%feature("compactdefaultargs") ContactType;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
BiTgte_ContactType

Description
-----------
returns the type of contact.
") ContactType;
		BiTgte_ContactType ContactType(const Standard_Integer Index);

		/****** BiTgte_Blend::CurveOnShape1 ******/
		/****** md5 signature: ee20be21e256f2cf96d84ff8ef3129bb ******/
		%feature("compactdefaultargs") CurveOnShape1;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
opencascade::handle<Geom_Curve>

Description
-----------
gives the 3d curve of SurfaceFillet(Index) on SupportShape1(Index).
") CurveOnShape1;
		opencascade::handle<Geom_Curve> CurveOnShape1(const Standard_Integer Index);

		/****** BiTgte_Blend::CurveOnShape2 ******/
		/****** md5 signature: 7fc945de3a648a006805b4811834fb9f ******/
		%feature("compactdefaultargs") CurveOnShape2;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
opencascade::handle<Geom_Curve>

Description
-----------
gives the 3d curve of SurfaceFillet(Index) on SupportShape2(Index).
") CurveOnShape2;
		opencascade::handle<Geom_Curve> CurveOnShape2(const Standard_Integer Index);

		/****** BiTgte_Blend::Face ******/
		/****** md5 signature: 2cbffafda38288d6b1f44549ec0da32a ******/
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
TopoDS_Face

Description
-----------
returns the surface of range Index.
") Face;
		const TopoDS_Face Face(const Standard_Integer Index);

		/****** BiTgte_Blend::Face ******/
		/****** md5 signature: 4b7aded970014f9eaa6d00fc413a3191 ******/
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "
Parameters
----------
CenterLine: TopoDS_Shape

Return
-------
TopoDS_Face

Description
-----------
returns the face generated by the centerline. <CenterLine> may be - an edge: generate a pipe. - a vertex: generate a sphere. Warning: returns a Null Shape if <CenterLine> generates no surface.
") Face;
		const TopoDS_Face Face(const TopoDS_Shape & CenterLine);

		/****** BiTgte_Blend::IndicesOfBranche ******/
		/****** md5 signature: 5496dd9611670412e2f05c0778f3cd94 ******/
		%feature("compactdefaultargs") IndicesOfBranche;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
From: int
To: int

Description
-----------
Set in <From>,<To> the indices of the faces of the branche <Index>. //! i.e: Branche<Index> = Face(From) + Face(From+1) + ..+ Face(To).
") IndicesOfBranche;
		void IndicesOfBranche(const Standard_Integer Index, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****** BiTgte_Blend::Init ******/
		/****** md5 signature: 9117abf7335ad3e22ca004f959ef022d ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
Radius: float
Tol: float
NUBS: bool

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const TopoDS_Shape & S, const Standard_Real Radius, const Standard_Real Tol, const Standard_Boolean NUBS);

		/****** BiTgte_Blend::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsDone;
		Standard_Boolean IsDone();

		/****** BiTgte_Blend::NbBranches ******/
		/****** md5 signature: b64569026b92c0773cf3ea7449a53b4a ******/
		%feature("compactdefaultargs") NbBranches;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbBranches;
		Standard_Integer NbBranches();

		/****** BiTgte_Blend::NbSurfaces ******/
		/****** md5 signature: fbc438e1ec12b28d849e6d0aeb23caaa ******/
		%feature("compactdefaultargs") NbSurfaces;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the Number of generated surfaces.
") NbSurfaces;
		Standard_Integer NbSurfaces();

		/****** BiTgte_Blend::PCurve1OnFillet ******/
		/****** md5 signature: 66719317f03c4bb8a01bf69af92d0bec ******/
		%feature("compactdefaultargs") PCurve1OnFillet;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
opencascade::handle<Geom2d_Curve>

Description
-----------
gives the PCurve associated to CurveOnShape1(Index) on the Fillet.
") PCurve1OnFillet;
		opencascade::handle<Geom2d_Curve> PCurve1OnFillet(const Standard_Integer Index);

		/****** BiTgte_Blend::PCurve2OnFillet ******/
		/****** md5 signature: 8483d0ebe8d27721b9bdf3e5ef460abf ******/
		%feature("compactdefaultargs") PCurve2OnFillet;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
opencascade::handle<Geom2d_Curve>

Description
-----------
gives the PCurve associated to CurveOnShape2(Index) on the fillet.
") PCurve2OnFillet;
		opencascade::handle<Geom2d_Curve> PCurve2OnFillet(const Standard_Integer Index);

		/****** BiTgte_Blend::PCurveOnFace1 ******/
		/****** md5 signature: 34e81d4b57cd9e48b73731bb12790a88 ******/
		%feature("compactdefaultargs") PCurveOnFace1;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
opencascade::handle<Geom2d_Curve>

Description
-----------
gives the PCurve associated to CurvOnShape1(Index) on the support face Warning: returns a Null Handle if SupportShape1 is not a Face.
") PCurveOnFace1;
		opencascade::handle<Geom2d_Curve> PCurveOnFace1(const Standard_Integer Index);

		/****** BiTgte_Blend::PCurveOnFace2 ******/
		/****** md5 signature: ab07bb99678af55707111b62c6fece34 ******/
		%feature("compactdefaultargs") PCurveOnFace2;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
opencascade::handle<Geom2d_Curve>

Description
-----------
gives the PCurve associated to CurveOnShape2(Index) on the support face Warning: returns a Null Handle if SupportShape2 is not a Face.
") PCurveOnFace2;
		opencascade::handle<Geom2d_Curve> PCurveOnFace2(const Standard_Integer Index);

		/****** BiTgte_Blend::Perform ******/
		/****** md5 signature: 26f90eb30d35e3511898b9066f769985 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
BuildShape: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Compute the generated surfaces. If <BuildShape> is true, compute the resulting Shape. If false, only the blending surfaces are computed.
") Perform;
		void Perform(const Standard_Boolean BuildShape = Standard_True);

		/****** BiTgte_Blend::SetEdge ******/
		/****** md5 signature: 2cae578848d84ae3c3668cd048d5885d ******/
		%feature("compactdefaultargs") SetEdge;
		%feature("autodoc", "
Parameters
----------
Edge: TopoDS_Edge

Return
-------
None

Description
-----------
Set an edge of <myShape> to be rounded.
") SetEdge;
		void SetEdge(const TopoDS_Edge & Edge);

		/****** BiTgte_Blend::SetFaces ******/
		/****** md5 signature: 46dc023c2aed2e35da6777aafef31609 ******/
		%feature("compactdefaultargs") SetFaces;
		%feature("autodoc", "
Parameters
----------
F1: TopoDS_Face
F2: TopoDS_Face

Return
-------
None

Description
-----------
Set two faces of <myShape> on which the Sphere must roll.
") SetFaces;
		void SetFaces(const TopoDS_Face & F1, const TopoDS_Face & F2);

		/****** BiTgte_Blend::SetStoppingFace ******/
		/****** md5 signature: 31e99b5f54ada3288ae28080c35765a0 ******/
		%feature("compactdefaultargs") SetStoppingFace;
		%feature("autodoc", "
Parameters
----------
Face: TopoDS_Face

Return
-------
None

Description
-----------
Set a face on which the fillet must stop.
") SetStoppingFace;
		void SetStoppingFace(const TopoDS_Face & Face);

		/****** BiTgte_Blend::Shape ******/
		/****** md5 signature: e2e979bbf0e2f5cedfc0e482bf183e08 ******/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
returns the result.
") Shape;
		const TopoDS_Shape Shape();

		/****** BiTgte_Blend::SupportShape1 ******/
		/****** md5 signature: 10214c27a45d2d8e8b096d1ae2f312ed ******/
		%feature("compactdefaultargs") SupportShape1;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
TopoDS_Shape

Description
-----------
gives the first support shape relative to SurfaceFillet(Index);.
") SupportShape1;
		const TopoDS_Shape SupportShape1(const Standard_Integer Index);

		/****** BiTgte_Blend::SupportShape2 ******/
		/****** md5 signature: 7261f3e4970f2c1b0cdd582f6d687f13 ******/
		%feature("compactdefaultargs") SupportShape2;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
TopoDS_Shape

Description
-----------
gives the second support shape relative to SurfaceFillet(Index);.
") SupportShape2;
		const TopoDS_Shape SupportShape2(const Standard_Integer Index);

		/****** BiTgte_Blend::Surface ******/
		/****** md5 signature: ca0d44253c2baa75e6ac4da4acb1de35 ******/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
opencascade::handle<Geom_Surface>

Description
-----------
returns the surface of range Index.
") Surface;
		opencascade::handle<Geom_Surface> Surface(const Standard_Integer Index);

		/****** BiTgte_Blend::Surface ******/
		/****** md5 signature: 200bf7afd4a4bc656a2370bc00f08ebe ******/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "
Parameters
----------
CenterLine: TopoDS_Shape

Return
-------
opencascade::handle<Geom_Surface>

Description
-----------
returns the surface generated by the centerline. <CenterLine> may be - an edge: generate a pipe. - a vertex: generate a sphere. Warning: returns a Null Handle if <CenterLine> generates no surface.
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
		/****** BiTgte_CurveOnEdge::BiTgte_CurveOnEdge ******/
		/****** md5 signature: 0bc12bd3ec644ed3018a39a0799bc067 ******/
		%feature("compactdefaultargs") BiTgte_CurveOnEdge;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") BiTgte_CurveOnEdge;
		 BiTgte_CurveOnEdge();

		/****** BiTgte_CurveOnEdge::BiTgte_CurveOnEdge ******/
		/****** md5 signature: 36ffc866377ea1d78af716092ee3e006 ******/
		%feature("compactdefaultargs") BiTgte_CurveOnEdge;
		%feature("autodoc", "
Parameters
----------
EonF: TopoDS_Edge
Edge: TopoDS_Edge

Return
-------
None

Description
-----------
No available documentation.
") BiTgte_CurveOnEdge;
		 BiTgte_CurveOnEdge(const TopoDS_Edge & EonF, const TopoDS_Edge & Edge);

		/****** BiTgte_CurveOnEdge::BSpline ******/
		/****** md5 signature: 3ccc0d851302bffb5de6344e3eb3e58d ******/
		%feature("compactdefaultargs") BSpline;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_BSplineCurve>

Description
-----------
No available documentation.
") BSpline;
		opencascade::handle<Geom_BSplineCurve> BSpline();

		/****** BiTgte_CurveOnEdge::Bezier ******/
		/****** md5 signature: 092280fc6ee0e7104fbbe3460d73e83c ******/
		%feature("compactdefaultargs") Bezier;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_BezierCurve>

Description
-----------
No available documentation.
") Bezier;
		opencascade::handle<Geom_BezierCurve> Bezier();

		/****** BiTgte_CurveOnEdge::Circle ******/
		/****** md5 signature: 5f382e7a6af009845ea6e16d54814298 ******/
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", "Return
-------
gp_Circ

Description
-----------
No available documentation.
") Circle;
		gp_Circ Circle();

		/****** BiTgte_CurveOnEdge::Continuity ******/
		/****** md5 signature: 9381b370dfdd50af7f1b79ce202f0c6f ******/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "Return
-------
GeomAbs_Shape

Description
-----------
No available documentation.
") Continuity;
		GeomAbs_Shape Continuity();

		/****** BiTgte_CurveOnEdge::D0 ******/
		/****** md5 signature: 5f7d08d8d17afc516aac9ef64bf9711f ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
U: float
P: gp_Pnt

Return
-------
None

Description
-----------
Computes the point of parameter U on the curve.
") D0;
		void D0(const Standard_Real U, gp_Pnt & P);

		/****** BiTgte_CurveOnEdge::D1 ******/
		/****** md5 signature: 1dc830ec49a945a61cde5e5c027b78d7 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
U: float
P: gp_Pnt
V: gp_Vec

Return
-------
None

Description
-----------
Computes the point of parameter U on the curve with its first derivative. Raised if the continuity of the current interval is not C1.
") D1;
		void D1(const Standard_Real U, gp_Pnt & P, gp_Vec & V);

		/****** BiTgte_CurveOnEdge::D2 ******/
		/****** md5 signature: a694b4ba68c0fd83fbac79f945cb5d8c ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
U: float
P: gp_Pnt
V1: gp_Vec
V2: gp_Vec

Return
-------
None

Description
-----------
Returns the point P of parameter U, the first and second derivatives V1 and V2. Raised if the continuity of the current interval is not C2.
") D2;
		void D2(const Standard_Real U, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2);

		/****** BiTgte_CurveOnEdge::D3 ******/
		/****** md5 signature: cf1c3b5fe7af9d5c183c1b16b21c43f1 ******/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "
Parameters
----------
U: float
P: gp_Pnt
V1: gp_Vec
V2: gp_Vec
V3: gp_Vec

Return
-------
None

Description
-----------
Returns the point P of parameter U, the first, the second and the third derivative. Raised if the continuity of the current interval is not C3.
") D3;
		void D3(const Standard_Real U, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2, gp_Vec & V3);

		/****** BiTgte_CurveOnEdge::DN ******/
		/****** md5 signature: 0d4a3e2fc2b4b03d2a49e0796a487efb ******/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "
Parameters
----------
U: float
N: int

Return
-------
gp_Vec

Description
-----------
The returned vector gives the value of the derivative for the order of derivation N. Raised if the continuity of the current interval is not CN. Raised if N < 1.
") DN;
		gp_Vec DN(const Standard_Real U, const Standard_Integer N);

		/****** BiTgte_CurveOnEdge::Degree ******/
		/****** md5 signature: 5ce473e72cc7bb935a667f4c839dab09 ******/
		%feature("compactdefaultargs") Degree;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Degree;
		Standard_Integer Degree();

		/****** BiTgte_CurveOnEdge::Ellipse ******/
		/****** md5 signature: e9a77f14e9bbca29370202de404ea9c1 ******/
		%feature("compactdefaultargs") Ellipse;
		%feature("autodoc", "Return
-------
gp_Elips

Description
-----------
No available documentation.
") Ellipse;
		gp_Elips Ellipse();

		/****** BiTgte_CurveOnEdge::FirstParameter ******/
		/****** md5 signature: eb9ebe94572bd67588fe8811eac261fb ******/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") FirstParameter;
		Standard_Real FirstParameter();

		/****** BiTgte_CurveOnEdge::GetType ******/
		/****** md5 signature: 0ad61dcbb5497908c1b536e766f0fcb9 ******/
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "Return
-------
GeomAbs_CurveType

Description
-----------
Returns the type of the curve in the current interval: Line, Circle, Ellipse, Hyperbola, Parabola, BezierCurve, BSplineCurve, OtherCurve.
") GetType;
		GeomAbs_CurveType GetType();

		/****** BiTgte_CurveOnEdge::Hyperbola ******/
		/****** md5 signature: a96ca49b2ad017b35bb09d0b86cb690d ******/
		%feature("compactdefaultargs") Hyperbola;
		%feature("autodoc", "Return
-------
gp_Hypr

Description
-----------
No available documentation.
") Hyperbola;
		gp_Hypr Hyperbola();

		/****** BiTgte_CurveOnEdge::Init ******/
		/****** md5 signature: b74b189b5b7119a6bc7b6c812d488137 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
EonF: TopoDS_Edge
Edge: TopoDS_Edge

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const TopoDS_Edge & EonF, const TopoDS_Edge & Edge);

		/****** BiTgte_CurveOnEdge::Intervals ******/
		/****** md5 signature: fc573cb56cf1a9c05ee189fd913ff6f5 ******/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "
Parameters
----------
T: TColStd_Array1OfReal
S: GeomAbs_Shape

Return
-------
None

Description
-----------
Stores in <T> the parameters bounding the intervals of continuity <S>. //! The array must provide enough room to accommodate for the parameters. i.e. T.Length() > NbIntervals().
") Intervals;
		void Intervals(TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****** BiTgte_CurveOnEdge::IsClosed ******/
		/****** md5 signature: 00978070ec4cb5f00d1d002a8d5d3763 ******/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsClosed;
		Standard_Boolean IsClosed();

		/****** BiTgte_CurveOnEdge::IsPeriodic ******/
		/****** md5 signature: 15e3ccfd3ad4ae42959489f7f64aa8ca ******/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsPeriodic;
		Standard_Boolean IsPeriodic();

		/****** BiTgte_CurveOnEdge::IsRational ******/
		/****** md5 signature: 82ca56fad113156125f40128b25c0d8e ******/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsRational;
		Standard_Boolean IsRational();

		/****** BiTgte_CurveOnEdge::LastParameter ******/
		/****** md5 signature: cb4925a2d4a451ceec8f6ad486530f9c ******/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") LastParameter;
		Standard_Real LastParameter();

		/****** BiTgte_CurveOnEdge::Line ******/
		/****** md5 signature: cf28f5541e4e744dd8038e2a9ac75a8f ******/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "Return
-------
gp_Lin

Description
-----------
No available documentation.
") Line;
		gp_Lin Line();

		/****** BiTgte_CurveOnEdge::NbIntervals ******/
		/****** md5 signature: 8ce4f61bff96d1ce0784028b47edd8dc ******/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "
Parameters
----------
S: GeomAbs_Shape

Return
-------
int

Description
-----------
Returns the number of intervals for continuity <S>. May be one if Continuity(me) >= <S>.
") NbIntervals;
		Standard_Integer NbIntervals(const GeomAbs_Shape S);

		/****** BiTgte_CurveOnEdge::NbKnots ******/
		/****** md5 signature: 841663cbf96bec3b939f307c52df6c7c ******/
		%feature("compactdefaultargs") NbKnots;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbKnots;
		Standard_Integer NbKnots();

		/****** BiTgte_CurveOnEdge::NbPoles ******/
		/****** md5 signature: 52e5fadf897540545847ef59cc0ba942 ******/
		%feature("compactdefaultargs") NbPoles;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbPoles;
		Standard_Integer NbPoles();

		/****** BiTgte_CurveOnEdge::Parabola ******/
		/****** md5 signature: 68860abab63fd184ea5c7eb97f0762c1 ******/
		%feature("compactdefaultargs") Parabola;
		%feature("autodoc", "Return
-------
gp_Parab

Description
-----------
No available documentation.
") Parabola;
		gp_Parab Parabola();

		/****** BiTgte_CurveOnEdge::Period ******/
		/****** md5 signature: 88909a321398632744c0d6841580c626 ******/
		%feature("compactdefaultargs") Period;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") Period;
		Standard_Real Period();

		/****** BiTgte_CurveOnEdge::Resolution ******/
		/****** md5 signature: cc4a4d9111fadd20ad48e62bc4df1579 ******/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "
Parameters
----------
R3d: float

Return
-------
float

Description
-----------
Returns the parametric resolution corresponding to the real space resolution <R3d>.
") Resolution;
		Standard_Real Resolution(const Standard_Real R3d);

		/****** BiTgte_CurveOnEdge::ShallowCopy ******/
		/****** md5 signature: 1b6b0927543eab9d05e2c875c0c3efb6 ******/
		%feature("compactdefaultargs") ShallowCopy;
		%feature("autodoc", "Return
-------
opencascade::handle<Adaptor3d_Curve>

Description
-----------
Shallow copy of adaptor.
") ShallowCopy;
		virtual opencascade::handle<Adaptor3d_Curve> ShallowCopy();

		/****** BiTgte_CurveOnEdge::Trim ******/
		/****** md5 signature: 40a46ffe7379c6d919968b501b8343a5 ******/
		%feature("compactdefaultargs") Trim;
		%feature("autodoc", "
Parameters
----------
First: float
Last: float
Tol: float

Return
-------
opencascade::handle<Adaptor3d_Curve>

Description
-----------
Returns a curve equivalent of <self> between parameters <First> and <Last>. <Tol> is used to test for 3d points confusion. If <First> >= <Last>.
") Trim;
		opencascade::handle<Adaptor3d_Curve> Trim(const Standard_Real First, const Standard_Real Last, const Standard_Real Tol);

		/****** BiTgte_CurveOnEdge::Value ******/
		/****** md5 signature: d7f310c73762cbaa285ace0a141bc7bf ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
U: float

Return
-------
gp_Pnt

Description
-----------
Computes the point of parameter U on the curve.
") Value;
		gp_Pnt Value(const Standard_Real U);

};


%make_alias(BiTgte_CurveOnEdge)

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
		/****** BiTgte_CurveOnVertex::BiTgte_CurveOnVertex ******/
		/****** md5 signature: c38ff4f1f884bd661cd6b95b8827f160 ******/
		%feature("compactdefaultargs") BiTgte_CurveOnVertex;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") BiTgte_CurveOnVertex;
		 BiTgte_CurveOnVertex();

		/****** BiTgte_CurveOnVertex::BiTgte_CurveOnVertex ******/
		/****** md5 signature: 7c391382afc64ffc731f436162fd5b2d ******/
		%feature("compactdefaultargs") BiTgte_CurveOnVertex;
		%feature("autodoc", "
Parameters
----------
EonF: TopoDS_Edge
V: TopoDS_Vertex

Return
-------
None

Description
-----------
No available documentation.
") BiTgte_CurveOnVertex;
		 BiTgte_CurveOnVertex(const TopoDS_Edge & EonF, const TopoDS_Vertex & V);

		/****** BiTgte_CurveOnVertex::BSpline ******/
		/****** md5 signature: 3ccc0d851302bffb5de6344e3eb3e58d ******/
		%feature("compactdefaultargs") BSpline;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_BSplineCurve>

Description
-----------
No available documentation.
") BSpline;
		opencascade::handle<Geom_BSplineCurve> BSpline();

		/****** BiTgte_CurveOnVertex::Bezier ******/
		/****** md5 signature: 092280fc6ee0e7104fbbe3460d73e83c ******/
		%feature("compactdefaultargs") Bezier;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_BezierCurve>

Description
-----------
No available documentation.
") Bezier;
		opencascade::handle<Geom_BezierCurve> Bezier();

		/****** BiTgte_CurveOnVertex::Circle ******/
		/****** md5 signature: 5f382e7a6af009845ea6e16d54814298 ******/
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", "Return
-------
gp_Circ

Description
-----------
No available documentation.
") Circle;
		gp_Circ Circle();

		/****** BiTgte_CurveOnVertex::Continuity ******/
		/****** md5 signature: 9381b370dfdd50af7f1b79ce202f0c6f ******/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "Return
-------
GeomAbs_Shape

Description
-----------
No available documentation.
") Continuity;
		GeomAbs_Shape Continuity();

		/****** BiTgte_CurveOnVertex::D0 ******/
		/****** md5 signature: 5f7d08d8d17afc516aac9ef64bf9711f ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
U: float
P: gp_Pnt

Return
-------
None

Description
-----------
Computes the point of parameter U on the curve.
") D0;
		void D0(const Standard_Real U, gp_Pnt & P);

		/****** BiTgte_CurveOnVertex::D1 ******/
		/****** md5 signature: 1dc830ec49a945a61cde5e5c027b78d7 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
U: float
P: gp_Pnt
V: gp_Vec

Return
-------
None

Description
-----------
Computes the point of parameter U on the curve with its first derivative. Raised if the continuity of the current interval is not C1.
") D1;
		void D1(const Standard_Real U, gp_Pnt & P, gp_Vec & V);

		/****** BiTgte_CurveOnVertex::D2 ******/
		/****** md5 signature: a694b4ba68c0fd83fbac79f945cb5d8c ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
U: float
P: gp_Pnt
V1: gp_Vec
V2: gp_Vec

Return
-------
None

Description
-----------
Returns the point P of parameter U, the first and second derivatives V1 and V2. Raised if the continuity of the current interval is not C2.
") D2;
		void D2(const Standard_Real U, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2);

		/****** BiTgte_CurveOnVertex::D3 ******/
		/****** md5 signature: cf1c3b5fe7af9d5c183c1b16b21c43f1 ******/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "
Parameters
----------
U: float
P: gp_Pnt
V1: gp_Vec
V2: gp_Vec
V3: gp_Vec

Return
-------
None

Description
-----------
Returns the point P of parameter U, the first, the second and the third derivative. Raised if the continuity of the current interval is not C3.
") D3;
		void D3(const Standard_Real U, gp_Pnt & P, gp_Vec & V1, gp_Vec & V2, gp_Vec & V3);

		/****** BiTgte_CurveOnVertex::DN ******/
		/****** md5 signature: 0d4a3e2fc2b4b03d2a49e0796a487efb ******/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "
Parameters
----------
U: float
N: int

Return
-------
gp_Vec

Description
-----------
The returned vector gives the value of the derivative for the order of derivation N. Raised if the continuity of the current interval is not CN. Raised if N < 1.
") DN;
		gp_Vec DN(const Standard_Real U, const Standard_Integer N);

		/****** BiTgte_CurveOnVertex::Degree ******/
		/****** md5 signature: 5ce473e72cc7bb935a667f4c839dab09 ******/
		%feature("compactdefaultargs") Degree;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Degree;
		Standard_Integer Degree();

		/****** BiTgte_CurveOnVertex::Ellipse ******/
		/****** md5 signature: e9a77f14e9bbca29370202de404ea9c1 ******/
		%feature("compactdefaultargs") Ellipse;
		%feature("autodoc", "Return
-------
gp_Elips

Description
-----------
No available documentation.
") Ellipse;
		gp_Elips Ellipse();

		/****** BiTgte_CurveOnVertex::FirstParameter ******/
		/****** md5 signature: eb9ebe94572bd67588fe8811eac261fb ******/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") FirstParameter;
		Standard_Real FirstParameter();

		/****** BiTgte_CurveOnVertex::GetType ******/
		/****** md5 signature: 0ad61dcbb5497908c1b536e766f0fcb9 ******/
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "Return
-------
GeomAbs_CurveType

Description
-----------
Returns the type of the curve in the current interval: Line, Circle, Ellipse, Hyperbola, Parabola, BezierCurve, BSplineCurve, OtherCurve.
") GetType;
		GeomAbs_CurveType GetType();

		/****** BiTgte_CurveOnVertex::Hyperbola ******/
		/****** md5 signature: a96ca49b2ad017b35bb09d0b86cb690d ******/
		%feature("compactdefaultargs") Hyperbola;
		%feature("autodoc", "Return
-------
gp_Hypr

Description
-----------
No available documentation.
") Hyperbola;
		gp_Hypr Hyperbola();

		/****** BiTgte_CurveOnVertex::Init ******/
		/****** md5 signature: 2ff95074e6eeaa569d953bead28f9ffd ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
EonF: TopoDS_Edge
V: TopoDS_Vertex

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const TopoDS_Edge & EonF, const TopoDS_Vertex & V);

		/****** BiTgte_CurveOnVertex::Intervals ******/
		/****** md5 signature: fc573cb56cf1a9c05ee189fd913ff6f5 ******/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "
Parameters
----------
T: TColStd_Array1OfReal
S: GeomAbs_Shape

Return
-------
None

Description
-----------
Stores in <T> the parameters bounding the intervals of continuity <S>. //! The array must provide enough room to accommodate for the parameters. i.e. T.Length() > NbIntervals().
") Intervals;
		void Intervals(TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****** BiTgte_CurveOnVertex::IsClosed ******/
		/****** md5 signature: 00978070ec4cb5f00d1d002a8d5d3763 ******/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsClosed;
		Standard_Boolean IsClosed();

		/****** BiTgte_CurveOnVertex::IsPeriodic ******/
		/****** md5 signature: 15e3ccfd3ad4ae42959489f7f64aa8ca ******/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsPeriodic;
		Standard_Boolean IsPeriodic();

		/****** BiTgte_CurveOnVertex::IsRational ******/
		/****** md5 signature: 82ca56fad113156125f40128b25c0d8e ******/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsRational;
		Standard_Boolean IsRational();

		/****** BiTgte_CurveOnVertex::LastParameter ******/
		/****** md5 signature: cb4925a2d4a451ceec8f6ad486530f9c ******/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") LastParameter;
		Standard_Real LastParameter();

		/****** BiTgte_CurveOnVertex::Line ******/
		/****** md5 signature: cf28f5541e4e744dd8038e2a9ac75a8f ******/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "Return
-------
gp_Lin

Description
-----------
No available documentation.
") Line;
		gp_Lin Line();

		/****** BiTgte_CurveOnVertex::NbIntervals ******/
		/****** md5 signature: 8ce4f61bff96d1ce0784028b47edd8dc ******/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "
Parameters
----------
S: GeomAbs_Shape

Return
-------
int

Description
-----------
Returns the number of intervals for continuity <S>. May be one if Continuity(me) >= <S>.
") NbIntervals;
		Standard_Integer NbIntervals(const GeomAbs_Shape S);

		/****** BiTgte_CurveOnVertex::NbKnots ******/
		/****** md5 signature: 841663cbf96bec3b939f307c52df6c7c ******/
		%feature("compactdefaultargs") NbKnots;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbKnots;
		Standard_Integer NbKnots();

		/****** BiTgte_CurveOnVertex::NbPoles ******/
		/****** md5 signature: 52e5fadf897540545847ef59cc0ba942 ******/
		%feature("compactdefaultargs") NbPoles;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbPoles;
		Standard_Integer NbPoles();

		/****** BiTgte_CurveOnVertex::Parabola ******/
		/****** md5 signature: 68860abab63fd184ea5c7eb97f0762c1 ******/
		%feature("compactdefaultargs") Parabola;
		%feature("autodoc", "Return
-------
gp_Parab

Description
-----------
No available documentation.
") Parabola;
		gp_Parab Parabola();

		/****** BiTgte_CurveOnVertex::Period ******/
		/****** md5 signature: 88909a321398632744c0d6841580c626 ******/
		%feature("compactdefaultargs") Period;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") Period;
		Standard_Real Period();

		/****** BiTgte_CurveOnVertex::Resolution ******/
		/****** md5 signature: cc4a4d9111fadd20ad48e62bc4df1579 ******/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "
Parameters
----------
R3d: float

Return
-------
float

Description
-----------
Returns the parametric resolution corresponding to the real space resolution <R3d>.
") Resolution;
		Standard_Real Resolution(const Standard_Real R3d);

		/****** BiTgte_CurveOnVertex::Trim ******/
		/****** md5 signature: 40a46ffe7379c6d919968b501b8343a5 ******/
		%feature("compactdefaultargs") Trim;
		%feature("autodoc", "
Parameters
----------
First: float
Last: float
Tol: float

Return
-------
opencascade::handle<Adaptor3d_Curve>

Description
-----------
Returns a curve equivalent of <self> between parameters <First> and <Last>. <Tol> is used to test for 3d points confusion. If <First> >= <Last>.
") Trim;
		opencascade::handle<Adaptor3d_Curve> Trim(const Standard_Real First, const Standard_Real Last, const Standard_Real Tol);

		/****** BiTgte_CurveOnVertex::Value ******/
		/****** md5 signature: d7f310c73762cbaa285ace0a141bc7bf ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
U: float

Return
-------
gp_Pnt

Description
-----------
Computes the point of parameter U on the curve.
") Value;
		gp_Pnt Value(const Standard_Real U);

};


%make_alias(BiTgte_CurveOnVertex)

%extend BiTgte_CurveOnVertex {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
/* class aliases */
%pythoncode {
}
