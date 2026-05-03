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
#include<Geom_module.hxx>
#include<Geom2d_module.hxx>
#include<Adaptor3d_module.hxx>
#include<gp_module.hxx>
#include<GeomAbs_module.hxx>
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
%import Geom.i
%import Geom2d.i
%import Adaptor3d.i
%import gp.i
%import GeomAbs.i

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
		/****** md5 signature: 9285548d4615dabfb5a36da23e0548f5 ******/
		%feature("compactdefaultargs") BiTgte_Blend;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
Radius: double
Tol: double
NUBS: bool

Return
-------
None

Description
-----------
<S>: Shape to be rounded <Radius>: radius of the fillet <Tol>: Tol3d used in approximations <NUBS>: if true, generate only NUBS surfaces, if false, generate analytical surfaces if possible.
") BiTgte_Blend;
		 BiTgte_Blend(const TopoDS_Shape & S, const double Radius, const double Tol, const bool NUBS);

		/****** BiTgte_Blend::CenterLines ******/
		/****** md5 signature: 89e49f73f5ad1e9c3fbbee5adbba7a6e ******/
		%feature("compactdefaultargs") CenterLines;
		%feature("autodoc", "
Parameters
----------
LC: NCollection_List<TopoDS_Shape>

Return
-------
None

Description
-----------
set in <LC> all the center lines.
") CenterLines;
		void CenterLines(NCollection_List<TopoDS_Shape> & LC);

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
		/****** md5 signature: 6639575c6220a659a3cdff145932d99a ******/
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
		BiTgte_ContactType ContactType(const int Index);

		/****** BiTgte_Blend::CurveOnShape1 ******/
		/****** md5 signature: 1c0b61e4eaff3e2caeb211dd39532ba0 ******/
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
		opencascade::handle<Geom_Curve> CurveOnShape1(const int Index);

		/****** BiTgte_Blend::CurveOnShape2 ******/
		/****** md5 signature: 4950bf596cfff488b837d6e1747533b2 ******/
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
		opencascade::handle<Geom_Curve> CurveOnShape2(const int Index);

		/****** BiTgte_Blend::Face ******/
		/****** md5 signature: a50d0545bdebd29e41826fba289c4e01 ******/
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
		const TopoDS_Face Face(const int Index);

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
		/****** md5 signature: a2c39c3c9f6fdb621a9c795f511d0d63 ******/
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
		void IndicesOfBranche(const int Index, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****** BiTgte_Blend::Init ******/
		/****** md5 signature: 42edcd67909339c690142a4a76d6e782 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
Radius: double
Tol: double
NUBS: bool

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const TopoDS_Shape & S, const double Radius, const double Tol, const bool NUBS);

		/****** BiTgte_Blend::IsDone ******/
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsDone;
		bool IsDone();

		/****** BiTgte_Blend::NbBranches ******/
		/****** md5 signature: 73153f6b864fdac9e485c725574be8a3 ******/
		%feature("compactdefaultargs") NbBranches;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbBranches;
		int NbBranches();

		/****** BiTgte_Blend::NbSurfaces ******/
		/****** md5 signature: 7e22bdd58e61d1f35b25d270c1134651 ******/
		%feature("compactdefaultargs") NbSurfaces;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the Number of generated surfaces.
") NbSurfaces;
		int NbSurfaces();

		/****** BiTgte_Blend::PCurve1OnFillet ******/
		/****** md5 signature: 535dcbbfb4cb6f2ce10a1ab855253dff ******/
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
		opencascade::handle<Geom2d_Curve> PCurve1OnFillet(const int Index);

		/****** BiTgte_Blend::PCurve2OnFillet ******/
		/****** md5 signature: 9db193ffa57ab7e72eebb1c708da0900 ******/
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
		opencascade::handle<Geom2d_Curve> PCurve2OnFillet(const int Index);

		/****** BiTgte_Blend::PCurveOnFace1 ******/
		/****** md5 signature: cc90442f4b6f3f82bcfff465396224b3 ******/
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
		opencascade::handle<Geom2d_Curve> PCurveOnFace1(const int Index);

		/****** BiTgte_Blend::PCurveOnFace2 ******/
		/****** md5 signature: d9551bee3cb42d1fc45f072d8c38bb41 ******/
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
		opencascade::handle<Geom2d_Curve> PCurveOnFace2(const int Index);

		/****** BiTgte_Blend::Perform ******/
		/****** md5 signature: a3dd71600bd415c42382175682c883b7 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
BuildShape: bool (optional, default to true)

Return
-------
None

Description
-----------
Compute the generated surfaces. If <BuildShape> is true, compute the resulting Shape. If false, only the blending surfaces are computed.
") Perform;
		void Perform(const bool BuildShape = true);

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
		/****** md5 signature: d204152256483d00bc5ecf4bece81176 ******/
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
		const TopoDS_Shape SupportShape1(const int Index);

		/****** BiTgte_Blend::SupportShape2 ******/
		/****** md5 signature: bc55833e7e2f950769753526e911dda3 ******/
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
		const TopoDS_Shape SupportShape2(const int Index);

		/****** BiTgte_Blend::Surface ******/
		/****** md5 signature: 25592a42d0e8aaf77202ea32fd9d7991 ******/
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
		opencascade::handle<Geom_Surface> Surface(const int Index);

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
		/****** md5 signature: 7bed4aa4788773a8c748371dea2999b6 ******/
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
		/****** md5 signature: 18c746ed347d210e28744f5b1c7eb527 ******/
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
		/****** md5 signature: 7475f3d2915ecc09ceb3114f02b43080 ******/
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
		/****** md5 signature: 8a904df22c5de40ac55e533d992dce2a ******/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "Return
-------
GeomAbs_Shape

Description
-----------
No available documentation.
") Continuity;
		GeomAbs_Shape Continuity();

		/****** BiTgte_CurveOnEdge::Degree ******/
		/****** md5 signature: 6a99b61f429058b67ffcdab561815cfb ******/
		%feature("compactdefaultargs") Degree;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Degree;
		int Degree();

		/****** BiTgte_CurveOnEdge::Ellipse ******/
		/****** md5 signature: b7cf7020e3992d6d2378fd2118e8d198 ******/
		%feature("compactdefaultargs") Ellipse;
		%feature("autodoc", "Return
-------
gp_Elips

Description
-----------
No available documentation.
") Ellipse;
		gp_Elips Ellipse();

		/****** BiTgte_CurveOnEdge::EvalD0 ******/
		/****** md5 signature: 534d5bf2fd8e92a6dcc7c1d53e829bc3 ******/
		%feature("compactdefaultargs") EvalD0;
		%feature("autodoc", "
Parameters
----------
theU: double

Return
-------
gp_Pnt

Description
-----------
Computes the point of parameter theU on the curve.
") EvalD0;
		gp_Pnt EvalD0(const double theU);

		/****** BiTgte_CurveOnEdge::EvalD1 ******/
		/****** md5 signature: 7afa7a9bd3f5047a6ef303b4732e48db ******/
		%feature("compactdefaultargs") EvalD1;
		%feature("autodoc", "
Parameters
----------
theU: double

Return
-------
Geom_Curve::ResD1

Description
-----------
Computes the point and first derivative at parameter theU.
") EvalD1;
		Geom_Curve::ResD1 EvalD1(const double theU);

		/****** BiTgte_CurveOnEdge::EvalD2 ******/
		/****** md5 signature: bdf34f9b5fb078dabb16e072337b36b5 ******/
		%feature("compactdefaultargs") EvalD2;
		%feature("autodoc", "
Parameters
----------
theU: double

Return
-------
Geom_Curve::ResD2

Description
-----------
Computes the point and first two derivatives at parameter theU.
") EvalD2;
		Geom_Curve::ResD2 EvalD2(const double theU);

		/****** BiTgte_CurveOnEdge::EvalD3 ******/
		/****** md5 signature: a6e2ea19f102d61c7a916bef9a895bcb ******/
		%feature("compactdefaultargs") EvalD3;
		%feature("autodoc", "
Parameters
----------
theU: double

Return
-------
Geom_Curve::ResD3

Description
-----------
Computes the point and first three derivatives at parameter theU.
") EvalD3;
		Geom_Curve::ResD3 EvalD3(const double theU);

		/****** BiTgte_CurveOnEdge::EvalDN ******/
		/****** md5 signature: 77005f048bbfcdbbddaf4af5a7b6cef4 ******/
		%feature("compactdefaultargs") EvalDN;
		%feature("autodoc", "
Parameters
----------
theU: double
theN: int

Return
-------
gp_Vec

Description
-----------
Returns the derivative of order theN at parameter theU.
") EvalDN;
		gp_Vec EvalDN(const double theU, const int theN);

		/****** BiTgte_CurveOnEdge::FirstParameter ******/
		/****** md5 signature: a030fd3ced91f50691075634ae7b49fb ******/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") FirstParameter;
		double FirstParameter();

		/****** BiTgte_CurveOnEdge::GetType ******/
		/****** md5 signature: 5a645f79981f2ae05742e39e35676600 ******/
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
		/****** md5 signature: 308d3b34f3aaba706261ba7e6cb1678e ******/
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
		/****** md5 signature: c706a9ee65ae76457235d7e55942295b ******/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "
Parameters
----------
T: NCollection_Array1<double>
S: GeomAbs_Shape

Return
-------
None

Description
-----------
Stores in <T> the parameters bounding the intervals of continuity <S>. //! The array must provide enough room to accommodate for the parameters. i.e. T.Length() > NbIntervals().
") Intervals;
		void Intervals(NCollection_Array1<double> & T, const GeomAbs_Shape S);

		/****** BiTgte_CurveOnEdge::IsClosed ******/
		/****** md5 signature: e10ee7204b25ff2ff849146f37c83359 ******/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsClosed;
		bool IsClosed();

		/****** BiTgte_CurveOnEdge::IsPeriodic ******/
		/****** md5 signature: c33341d130b25859848a016acbcaf4dd ******/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsPeriodic;
		bool IsPeriodic();

		/****** BiTgte_CurveOnEdge::IsRational ******/
		/****** md5 signature: 43e7b94be36c1d44222e606d2d075195 ******/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsRational;
		bool IsRational();

		/****** BiTgte_CurveOnEdge::LastParameter ******/
		/****** md5 signature: dd6d522a80d5537086a8d1fbe2265300 ******/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") LastParameter;
		double LastParameter();

		/****** BiTgte_CurveOnEdge::Line ******/
		/****** md5 signature: acdc8f5fc99e967530fe196307d05538 ******/
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
		/****** md5 signature: b2aaad8a5aa5a35490639df04a76a09e ******/
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
		int NbIntervals(const GeomAbs_Shape S);

		/****** BiTgte_CurveOnEdge::NbKnots ******/
		/****** md5 signature: d6bff4f2a244b781cf7c609ff1cddaf1 ******/
		%feature("compactdefaultargs") NbKnots;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbKnots;
		int NbKnots();

		/****** BiTgte_CurveOnEdge::NbPoles ******/
		/****** md5 signature: bdb1092e5fcaeae9c85a332311d7f069 ******/
		%feature("compactdefaultargs") NbPoles;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbPoles;
		int NbPoles();

		/****** BiTgte_CurveOnEdge::Parabola ******/
		/****** md5 signature: de70ebd3fa2d227512b9d0058ee94ca5 ******/
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
		/****** md5 signature: 1f089b3595450d6c97092473e379f329 ******/
		%feature("compactdefaultargs") Period;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") Period;
		double Period();

		/****** BiTgte_CurveOnEdge::Resolution ******/
		/****** md5 signature: 7cb383c1a004c01dc3f51b7088c4d899 ******/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "
Parameters
----------
R3d: double

Return
-------
double

Description
-----------
Returns the parametric resolution corresponding to the real space resolution <R3d>.
") Resolution;
		double Resolution(const double R3d);

		/****** BiTgte_CurveOnEdge::ShallowCopy ******/
		/****** md5 signature: 20e70b6ba2d95db55811b68454eb9003 ******/
		%feature("compactdefaultargs") ShallowCopy;
		%feature("autodoc", "Return
-------
opencascade::handle<Adaptor3d_Curve>

Description
-----------
Shallow copy of adaptor.
") ShallowCopy;
		opencascade::handle<Adaptor3d_Curve> ShallowCopy();

		/****** BiTgte_CurveOnEdge::Trim ******/
		/****** md5 signature: 91538b497dfbccd564dbd54083e8e395 ******/
		%feature("compactdefaultargs") Trim;
		%feature("autodoc", "
Parameters
----------
First: double
Last: double
Tol: double

Return
-------
opencascade::handle<Adaptor3d_Curve>

Description
-----------
Returns a curve equivalent of <self> between parameters <First> and <Last>. <Tol> is used to test for 3d points confusion. If <First> >= <Last>.
") Trim;
		opencascade::handle<Adaptor3d_Curve> Trim(const double First, const double Last, const double Tol);

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
		/****** md5 signature: 7bed4aa4788773a8c748371dea2999b6 ******/
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
		/****** md5 signature: 18c746ed347d210e28744f5b1c7eb527 ******/
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
		/****** md5 signature: 7475f3d2915ecc09ceb3114f02b43080 ******/
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
		/****** md5 signature: 8a904df22c5de40ac55e533d992dce2a ******/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "Return
-------
GeomAbs_Shape

Description
-----------
No available documentation.
") Continuity;
		GeomAbs_Shape Continuity();

		/****** BiTgte_CurveOnVertex::Degree ******/
		/****** md5 signature: 6a99b61f429058b67ffcdab561815cfb ******/
		%feature("compactdefaultargs") Degree;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Degree;
		int Degree();

		/****** BiTgte_CurveOnVertex::Ellipse ******/
		/****** md5 signature: b7cf7020e3992d6d2378fd2118e8d198 ******/
		%feature("compactdefaultargs") Ellipse;
		%feature("autodoc", "Return
-------
gp_Elips

Description
-----------
No available documentation.
") Ellipse;
		gp_Elips Ellipse();

		/****** BiTgte_CurveOnVertex::EvalD0 ******/
		/****** md5 signature: 534d5bf2fd8e92a6dcc7c1d53e829bc3 ******/
		%feature("compactdefaultargs") EvalD0;
		%feature("autodoc", "
Parameters
----------
theU: double

Return
-------
gp_Pnt

Description
-----------
Computes the point of parameter theU on the curve.
") EvalD0;
		gp_Pnt EvalD0(const double theU);

		/****** BiTgte_CurveOnVertex::EvalD1 ******/
		/****** md5 signature: 7afa7a9bd3f5047a6ef303b4732e48db ******/
		%feature("compactdefaultargs") EvalD1;
		%feature("autodoc", "
Parameters
----------
theU: double

Return
-------
Geom_Curve::ResD1

Description
-----------
Computes the point and first derivative at parameter theU.
") EvalD1;
		Geom_Curve::ResD1 EvalD1(const double theU);

		/****** BiTgte_CurveOnVertex::EvalD2 ******/
		/****** md5 signature: bdf34f9b5fb078dabb16e072337b36b5 ******/
		%feature("compactdefaultargs") EvalD2;
		%feature("autodoc", "
Parameters
----------
theU: double

Return
-------
Geom_Curve::ResD2

Description
-----------
Computes the point and first two derivatives at parameter theU.
") EvalD2;
		Geom_Curve::ResD2 EvalD2(const double theU);

		/****** BiTgte_CurveOnVertex::EvalD3 ******/
		/****** md5 signature: a6e2ea19f102d61c7a916bef9a895bcb ******/
		%feature("compactdefaultargs") EvalD3;
		%feature("autodoc", "
Parameters
----------
theU: double

Return
-------
Geom_Curve::ResD3

Description
-----------
Computes the point and first three derivatives at parameter theU.
") EvalD3;
		Geom_Curve::ResD3 EvalD3(const double theU);

		/****** BiTgte_CurveOnVertex::EvalDN ******/
		/****** md5 signature: 77005f048bbfcdbbddaf4af5a7b6cef4 ******/
		%feature("compactdefaultargs") EvalDN;
		%feature("autodoc", "
Parameters
----------
theU: double
theN: int

Return
-------
gp_Vec

Description
-----------
Returns the derivative of order theN at parameter theU.
") EvalDN;
		gp_Vec EvalDN(const double theU, const int theN);

		/****** BiTgte_CurveOnVertex::FirstParameter ******/
		/****** md5 signature: a030fd3ced91f50691075634ae7b49fb ******/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") FirstParameter;
		double FirstParameter();

		/****** BiTgte_CurveOnVertex::GetType ******/
		/****** md5 signature: 5a645f79981f2ae05742e39e35676600 ******/
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
		/****** md5 signature: 308d3b34f3aaba706261ba7e6cb1678e ******/
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
		/****** md5 signature: c706a9ee65ae76457235d7e55942295b ******/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "
Parameters
----------
T: NCollection_Array1<double>
S: GeomAbs_Shape

Return
-------
None

Description
-----------
Stores in <T> the parameters bounding the intervals of continuity <S>. //! The array must provide enough room to accommodate for the parameters. i.e. T.Length() > NbIntervals().
") Intervals;
		void Intervals(NCollection_Array1<double> & T, const GeomAbs_Shape S);

		/****** BiTgte_CurveOnVertex::IsClosed ******/
		/****** md5 signature: e10ee7204b25ff2ff849146f37c83359 ******/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsClosed;
		bool IsClosed();

		/****** BiTgte_CurveOnVertex::IsPeriodic ******/
		/****** md5 signature: c33341d130b25859848a016acbcaf4dd ******/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsPeriodic;
		bool IsPeriodic();

		/****** BiTgte_CurveOnVertex::IsRational ******/
		/****** md5 signature: 43e7b94be36c1d44222e606d2d075195 ******/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsRational;
		bool IsRational();

		/****** BiTgte_CurveOnVertex::LastParameter ******/
		/****** md5 signature: dd6d522a80d5537086a8d1fbe2265300 ******/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") LastParameter;
		double LastParameter();

		/****** BiTgte_CurveOnVertex::Line ******/
		/****** md5 signature: acdc8f5fc99e967530fe196307d05538 ******/
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
		/****** md5 signature: b2aaad8a5aa5a35490639df04a76a09e ******/
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
		int NbIntervals(const GeomAbs_Shape S);

		/****** BiTgte_CurveOnVertex::NbKnots ******/
		/****** md5 signature: d6bff4f2a244b781cf7c609ff1cddaf1 ******/
		%feature("compactdefaultargs") NbKnots;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbKnots;
		int NbKnots();

		/****** BiTgte_CurveOnVertex::NbPoles ******/
		/****** md5 signature: bdb1092e5fcaeae9c85a332311d7f069 ******/
		%feature("compactdefaultargs") NbPoles;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbPoles;
		int NbPoles();

		/****** BiTgte_CurveOnVertex::Parabola ******/
		/****** md5 signature: de70ebd3fa2d227512b9d0058ee94ca5 ******/
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
		/****** md5 signature: 1f089b3595450d6c97092473e379f329 ******/
		%feature("compactdefaultargs") Period;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") Period;
		double Period();

		/****** BiTgte_CurveOnVertex::Resolution ******/
		/****** md5 signature: 7cb383c1a004c01dc3f51b7088c4d899 ******/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "
Parameters
----------
R3d: double

Return
-------
double

Description
-----------
Returns the parametric resolution corresponding to the real space resolution <R3d>.
") Resolution;
		double Resolution(const double R3d);

		/****** BiTgte_CurveOnVertex::Trim ******/
		/****** md5 signature: 91538b497dfbccd564dbd54083e8e395 ******/
		%feature("compactdefaultargs") Trim;
		%feature("autodoc", "
Parameters
----------
First: double
Last: double
Tol: double

Return
-------
opencascade::handle<Adaptor3d_Curve>

Description
-----------
Returns a curve equivalent of <self> between parameters <First> and <Last>. <Tol> is used to test for 3d points confusion. If <First> >= <Last>.
") Trim;
		opencascade::handle<Adaptor3d_Curve> Trim(const double First, const double Last, const double Tol);

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
