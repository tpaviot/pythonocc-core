/*
Copyright 2008-2024 Thomas Paviot (tpaviot@gmail.com)

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
https://dev.opencascade.org/doc/occt-7.8.0/refman/html/package_brep.html"
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
%include ../common/EnumTemplates.i
%include ../common/Operators.i
%include ../common/OccHandle.i
%include ../common/IOStream.i
%include ../common/ArrayMacros.i


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
#include<Bnd_module.hxx>
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
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
/* end public enums declaration */

/* python proxy classes for enums */
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

%extend NCollection_List<opencascade::handle<BRep_CurveRepresentation>> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(BRep_ListOfPointRepresentation) NCollection_List<opencascade::handle<BRep_PointRepresentation>>;

%extend NCollection_List<opencascade::handle<BRep_PointRepresentation>> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
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
		/****** BRep_Builder::Continuity ******/
		/****** md5 signature: ad510666139039f52608a143ce53cdd7 ******/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
F1: TopoDS_Face
F2: TopoDS_Face
C: GeomAbs_Shape

Return
-------
None

Description
-----------
Sets the geometric continuity on the edge.
") Continuity;
		void Continuity(const TopoDS_Edge & E, const TopoDS_Face & F1, const TopoDS_Face & F2, const GeomAbs_Shape C);

		/****** BRep_Builder::Continuity ******/
		/****** md5 signature: feff2af26f83833fcfbdc2257209ef12 ******/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
S1: Geom_Surface
S2: Geom_Surface
L1: TopLoc_Location
L2: TopLoc_Location
C: GeomAbs_Shape

Return
-------
None

Description
-----------
Sets the geometric continuity on the edge.
") Continuity;
		void Continuity(const TopoDS_Edge & E, const opencascade::handle<Geom_Surface> & S1, const opencascade::handle<Geom_Surface> & S2, const TopLoc_Location & L1, const TopLoc_Location & L2, const GeomAbs_Shape C);

		/****** BRep_Builder::Degenerated ******/
		/****** md5 signature: 85fb0e4fff22a970366aebab9413a0a0 ******/
		%feature("compactdefaultargs") Degenerated;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
D: bool

Return
-------
None

Description
-----------
Sets the degenerated flag for the edge <E>.
") Degenerated;
		void Degenerated(const TopoDS_Edge & E, const Standard_Boolean D);

		/****** BRep_Builder::MakeEdge ******/
		/****** md5 signature: b674f239b626d44dda9dada9ca8f29f4 ******/
		%feature("compactdefaultargs") MakeEdge;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge

Return
-------
None

Description
-----------
Makes an undefined Edge (no geometry).
") MakeEdge;
		void MakeEdge(TopoDS_Edge & E);

		/****** BRep_Builder::MakeEdge ******/
		/****** md5 signature: f0f2d5e71e37e4d20e9feffc9c1d3b2d ******/
		%feature("compactdefaultargs") MakeEdge;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
C: Geom_Curve
Tol: float

Return
-------
None

Description
-----------
Makes an Edge with a curve.
") MakeEdge;
		void MakeEdge(TopoDS_Edge & E, const opencascade::handle<Geom_Curve> & C, const Standard_Real Tol);

		/****** BRep_Builder::MakeEdge ******/
		/****** md5 signature: eadfa705523a213a6ec77659a57a54ff ******/
		%feature("compactdefaultargs") MakeEdge;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
C: Geom_Curve
L: TopLoc_Location
Tol: float

Return
-------
None

Description
-----------
Makes an Edge with a curve and a location.
") MakeEdge;
		void MakeEdge(TopoDS_Edge & E, const opencascade::handle<Geom_Curve> & C, const TopLoc_Location & L, const Standard_Real Tol);

		/****** BRep_Builder::MakeEdge ******/
		/****** md5 signature: 1d75b5022ed1df63600c7bc1fc939182 ******/
		%feature("compactdefaultargs") MakeEdge;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
P: Poly_Polygon3D

Return
-------
None

Description
-----------
Makes an Edge with a polygon 3d.
") MakeEdge;
		void MakeEdge(TopoDS_Edge & E, const opencascade::handle<Poly_Polygon3D> & P);

		/****** BRep_Builder::MakeEdge ******/
		/****** md5 signature: ff614951ea63361125c2261b4c2628c2 ******/
		%feature("compactdefaultargs") MakeEdge;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
N: Poly_PolygonOnTriangulation
T: Poly_Triangulation

Return
-------
None

Description
-----------
makes an Edge polygon on Triangulation.
") MakeEdge;
		void MakeEdge(TopoDS_Edge & E, const opencascade::handle<Poly_PolygonOnTriangulation> & N, const opencascade::handle<Poly_Triangulation> & T);

		/****** BRep_Builder::MakeEdge ******/
		/****** md5 signature: f33683631bfbf43b74881c51e3c77a67 ******/
		%feature("compactdefaultargs") MakeEdge;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
N: Poly_PolygonOnTriangulation
T: Poly_Triangulation
L: TopLoc_Location

Return
-------
None

Description
-----------
makes an Edge polygon on Triangulation.
") MakeEdge;
		void MakeEdge(TopoDS_Edge & E, const opencascade::handle<Poly_PolygonOnTriangulation> & N, const opencascade::handle<Poly_Triangulation> & T, const TopLoc_Location & L);

		/****** BRep_Builder::MakeFace ******/
		/****** md5 signature: c71240caa9bb39e7508c010ada76421f ******/
		%feature("compactdefaultargs") MakeFace;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face

Return
-------
None

Description
-----------
Makes an undefined Face.
") MakeFace;
		void MakeFace(TopoDS_Face & F);

		/****** BRep_Builder::MakeFace ******/
		/****** md5 signature: 21344df19ec72586cd876f667d9215d4 ******/
		%feature("compactdefaultargs") MakeFace;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face
S: Geom_Surface
Tol: float

Return
-------
None

Description
-----------
Makes a Face with a surface.
") MakeFace;
		void MakeFace(TopoDS_Face & F, const opencascade::handle<Geom_Surface> & S, const Standard_Real Tol);

		/****** BRep_Builder::MakeFace ******/
		/****** md5 signature: 4cc7cf2c0bdd48e757b5571ce63016a9 ******/
		%feature("compactdefaultargs") MakeFace;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face
S: Geom_Surface
L: TopLoc_Location
Tol: float

Return
-------
None

Description
-----------
Makes a Face with a surface and a location.
") MakeFace;
		void MakeFace(TopoDS_Face & F, const opencascade::handle<Geom_Surface> & S, const TopLoc_Location & L, const Standard_Real Tol);

		/****** BRep_Builder::MakeFace ******/
		/****** md5 signature: 82f593bb6499b901c0087602e0a5b4bc ******/
		%feature("compactdefaultargs") MakeFace;
		%feature("autodoc", "
Parameters
----------
theFace: TopoDS_Face
theTriangulation: Poly_Triangulation

Return
-------
None

Description
-----------
Makes a theFace with a single triangulation. The triangulation is in the same reference system than the TFace.
") MakeFace;
		void MakeFace(TopoDS_Face & theFace, const opencascade::handle<Poly_Triangulation> & theTriangulation);

		/****** BRep_Builder::MakeFace ******/
		/****** md5 signature: ca97f699b84f43b2b5cae440dbda0a60 ******/
		%feature("compactdefaultargs") MakeFace;
		%feature("autodoc", "
Parameters
----------
theFace: TopoDS_Face
theTriangulations: Poly_ListOfTriangulation
theActiveTriangulation: Poly_Triangulation (optional, default to opencascade::handle<Poly_Triangulation>())

Return
-------
None

Description
-----------
Makes a Face with a list of triangulations and active one. Use NULL active triangulation to set the first triangulation in list as active. The triangulations is in the same reference system than the TFace.
") MakeFace;
		void MakeFace(TopoDS_Face & theFace, const Poly_ListOfTriangulation & theTriangulations, const opencascade::handle<Poly_Triangulation> & theActiveTriangulation = opencascade::handle<Poly_Triangulation>());

		/****** BRep_Builder::MakeVertex ******/
		/****** md5 signature: 31d0795e1ce56b9f1ec86c08a180b99b ******/
		%feature("compactdefaultargs") MakeVertex;
		%feature("autodoc", "
Parameters
----------
V: TopoDS_Vertex

Return
-------
None

Description
-----------
Makes an udefined vertex without geometry.
") MakeVertex;
		void MakeVertex(TopoDS_Vertex & V);

		/****** BRep_Builder::MakeVertex ******/
		/****** md5 signature: 29bb0db6ab919b38d8ce3d1198ea2b37 ******/
		%feature("compactdefaultargs") MakeVertex;
		%feature("autodoc", "
Parameters
----------
V: TopoDS_Vertex
P: gp_Pnt
Tol: float

Return
-------
None

Description
-----------
Makes a vertex from a 3D point.
") MakeVertex;
		void MakeVertex(TopoDS_Vertex & V, const gp_Pnt & P, const Standard_Real Tol);

		/****** BRep_Builder::NaturalRestriction ******/
		/****** md5 signature: 9318ef19df3d36cddca0d86181d9235e ******/
		%feature("compactdefaultargs") NaturalRestriction;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face
N: bool

Return
-------
None

Description
-----------
Sets the NaturalRestriction flag of the face.
") NaturalRestriction;
		void NaturalRestriction(const TopoDS_Face & F, const Standard_Boolean N);

		/****** BRep_Builder::Range ******/
		/****** md5 signature: 4e181430c6418a692d54b7f2eb20b471 ******/
		%feature("compactdefaultargs") Range;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
First: float
Last: float
Only3d: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Sets the range of the 3d curve if Only3d=True, otherwise sets the range to all the representations.
") Range;
		void Range(const TopoDS_Edge & E, const Standard_Real First, const Standard_Real Last, const Standard_Boolean Only3d = Standard_False);

		/****** BRep_Builder::Range ******/
		/****** md5 signature: 8f140227716f210489934adf729eb0ac ******/
		%feature("compactdefaultargs") Range;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
S: Geom_Surface
L: TopLoc_Location
First: float
Last: float

Return
-------
None

Description
-----------
Sets the range of the edge on the pcurve on the surface.
") Range;
		void Range(const TopoDS_Edge & E, const opencascade::handle<Geom_Surface> & S, const TopLoc_Location & L, const Standard_Real First, const Standard_Real Last);

		/****** BRep_Builder::Range ******/
		/****** md5 signature: de1a40468c91090d0ec62f6a5752ec87 ******/
		%feature("compactdefaultargs") Range;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
F: TopoDS_Face
First: float
Last: float

Return
-------
None

Description
-----------
Sets the range of the edge on the pcurve on the face.
") Range;
		void Range(const TopoDS_Edge & E, const TopoDS_Face & F, const Standard_Real First, const Standard_Real Last);

		/****** BRep_Builder::SameParameter ******/
		/****** md5 signature: 637dd7757cdbbc36944a71eb51f0c647 ******/
		%feature("compactdefaultargs") SameParameter;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
S: bool

Return
-------
None

Description
-----------
Sets the same parameter flag for the edge <E>.
") SameParameter;
		void SameParameter(const TopoDS_Edge & E, const Standard_Boolean S);

		/****** BRep_Builder::SameRange ******/
		/****** md5 signature: e83a6e0df8791ada8869fddc2738519b ******/
		%feature("compactdefaultargs") SameRange;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
S: bool

Return
-------
None

Description
-----------
Sets the same range flag for the edge <E>.
") SameRange;
		void SameRange(const TopoDS_Edge & E, const Standard_Boolean S);

		/****** BRep_Builder::Transfert ******/
		/****** md5 signature: b171f0753a7014dc7505df77b53c2539 ******/
		%feature("compactdefaultargs") Transfert;
		%feature("autodoc", "
Parameters
----------
Ein: TopoDS_Edge
Eout: TopoDS_Edge

Return
-------
None

Description
-----------
Add to <Eout> the geometric representations of <Ein>.
") Transfert;
		void Transfert(const TopoDS_Edge & Ein, const TopoDS_Edge & Eout);

		/****** BRep_Builder::Transfert ******/
		/****** md5 signature: 6d7e283a0289d8207e491ceb01681950 ******/
		%feature("compactdefaultargs") Transfert;
		%feature("autodoc", "
Parameters
----------
Ein: TopoDS_Edge
Eout: TopoDS_Edge
Vin: TopoDS_Vertex
Vout: TopoDS_Vertex

Return
-------
None

Description
-----------
Transfert the parameters of Vin on Ein as the parameter of Vout on Eout.
") Transfert;
		void Transfert(const TopoDS_Edge & Ein, const TopoDS_Edge & Eout, const TopoDS_Vertex & Vin, const TopoDS_Vertex & Vout);

		/****** BRep_Builder::UpdateEdge ******/
		/****** md5 signature: 461de5bb3bcace2fe64ffd833ab805f0 ******/
		%feature("compactdefaultargs") UpdateEdge;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
C: Geom_Curve
Tol: float

Return
-------
None

Description
-----------
Sets a 3D curve for the edge. If <C> is a null handle, remove any existing 3d curve.
") UpdateEdge;
		void UpdateEdge(const TopoDS_Edge & E, const opencascade::handle<Geom_Curve> & C, const Standard_Real Tol);

		/****** BRep_Builder::UpdateEdge ******/
		/****** md5 signature: 8cfdbb2d500a89a88a4a76a7386f8aa9 ******/
		%feature("compactdefaultargs") UpdateEdge;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
C: Geom_Curve
L: TopLoc_Location
Tol: float

Return
-------
None

Description
-----------
Sets a 3D curve for the edge. If <C> is a null handle, remove any existing 3d curve.
") UpdateEdge;
		void UpdateEdge(const TopoDS_Edge & E, const opencascade::handle<Geom_Curve> & C, const TopLoc_Location & L, const Standard_Real Tol);

		/****** BRep_Builder::UpdateEdge ******/
		/****** md5 signature: 3bfa8179919e96725c4915bd3d329649 ******/
		%feature("compactdefaultargs") UpdateEdge;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
C: Geom2d_Curve
F: TopoDS_Face
Tol: float

Return
-------
None

Description
-----------
Sets a pcurve for the edge on the face. If <C> is a null handle, remove any existing pcurve.
") UpdateEdge;
		void UpdateEdge(const TopoDS_Edge & E, const opencascade::handle<Geom2d_Curve> & C, const TopoDS_Face & F, const Standard_Real Tol);

		/****** BRep_Builder::UpdateEdge ******/
		/****** md5 signature: 7d528612c919b79d92fd249803e88c61 ******/
		%feature("compactdefaultargs") UpdateEdge;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
C1: Geom2d_Curve
C2: Geom2d_Curve
F: TopoDS_Face
Tol: float

Return
-------
None

Description
-----------
Sets pcurves for the edge on the closed face. If <C1> or <C2> is a null handle, remove any existing pcurve.
") UpdateEdge;
		void UpdateEdge(const TopoDS_Edge & E, const opencascade::handle<Geom2d_Curve> & C1, const opencascade::handle<Geom2d_Curve> & C2, const TopoDS_Face & F, const Standard_Real Tol);

		/****** BRep_Builder::UpdateEdge ******/
		/****** md5 signature: 6cb83f897044ec0b34ebd0ae7baacd44 ******/
		%feature("compactdefaultargs") UpdateEdge;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
C: Geom2d_Curve
S: Geom_Surface
L: TopLoc_Location
Tol: float

Return
-------
None

Description
-----------
Sets a pcurve for the edge on the face. If <C> is a null handle, remove any existing pcurve.
") UpdateEdge;
		void UpdateEdge(const TopoDS_Edge & E, const opencascade::handle<Geom2d_Curve> & C, const opencascade::handle<Geom_Surface> & S, const TopLoc_Location & L, const Standard_Real Tol);

		/****** BRep_Builder::UpdateEdge ******/
		/****** md5 signature: c3858584a511426e079bc628910ddb2e ******/
		%feature("compactdefaultargs") UpdateEdge;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
C: Geom2d_Curve
S: Geom_Surface
L: TopLoc_Location
Tol: float
Pf: gp_Pnt2d
Pl: gp_Pnt2d

Return
-------
None

Description
-----------
Sets a pcurve for the edge on the face. If <C> is a null handle, remove any existing pcurve. Sets UV bounds for curve repsentation.
") UpdateEdge;
		void UpdateEdge(const TopoDS_Edge & E, const opencascade::handle<Geom2d_Curve> & C, const opencascade::handle<Geom_Surface> & S, const TopLoc_Location & L, const Standard_Real Tol, const gp_Pnt2d & Pf, const gp_Pnt2d & Pl);

		/****** BRep_Builder::UpdateEdge ******/
		/****** md5 signature: 414706636faf49609b66c5859100856d ******/
		%feature("compactdefaultargs") UpdateEdge;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
C1: Geom2d_Curve
C2: Geom2d_Curve
S: Geom_Surface
L: TopLoc_Location
Tol: float

Return
-------
None

Description
-----------
Sets pcurves for the edge on the closed surface. <C1> or <C2> is a null handle, remove any existing pcurve.
") UpdateEdge;
		void UpdateEdge(const TopoDS_Edge & E, const opencascade::handle<Geom2d_Curve> & C1, const opencascade::handle<Geom2d_Curve> & C2, const opencascade::handle<Geom_Surface> & S, const TopLoc_Location & L, const Standard_Real Tol);

		/****** BRep_Builder::UpdateEdge ******/
		/****** md5 signature: ecbe3e2c2db95e8527d500b1933fc18a ******/
		%feature("compactdefaultargs") UpdateEdge;
		%feature("autodoc", "
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

Return
-------
None

Description
-----------
Sets pcurves for the edge on the closed surface. <C1> or <C2> is a null handle, remove any existing pcurve. Sets UV bounds for curve repsentation.
") UpdateEdge;
		void UpdateEdge(const TopoDS_Edge & E, const opencascade::handle<Geom2d_Curve> & C1, const opencascade::handle<Geom2d_Curve> & C2, const opencascade::handle<Geom_Surface> & S, const TopLoc_Location & L, const Standard_Real Tol, const gp_Pnt2d & Pf, const gp_Pnt2d & Pl);

		/****** BRep_Builder::UpdateEdge ******/
		/****** md5 signature: 0fafa05abb68b0aedaead3c83b8ef0fe ******/
		%feature("compactdefaultargs") UpdateEdge;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
P: Poly_Polygon3D

Return
-------
None

Description
-----------
Changes an Edge 3D polygon. A null Polygon removes the 3d Polygon.
") UpdateEdge;
		void UpdateEdge(const TopoDS_Edge & E, const opencascade::handle<Poly_Polygon3D> & P);

		/****** BRep_Builder::UpdateEdge ******/
		/****** md5 signature: 18cdfe39bc36e28a79112a208855f95e ******/
		%feature("compactdefaultargs") UpdateEdge;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
P: Poly_Polygon3D
L: TopLoc_Location

Return
-------
None

Description
-----------
Changes an Edge 3D polygon. A null Polygon removes the 3d Polygon.
") UpdateEdge;
		void UpdateEdge(const TopoDS_Edge & E, const opencascade::handle<Poly_Polygon3D> & P, const TopLoc_Location & L);

		/****** BRep_Builder::UpdateEdge ******/
		/****** md5 signature: d270f40afd5ef59a6c3fdca0b12bf491 ******/
		%feature("compactdefaultargs") UpdateEdge;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
N: Poly_PolygonOnTriangulation
T: Poly_Triangulation

Return
-------
None

Description
-----------
Changes an Edge polygon on Triangulation.
") UpdateEdge;
		void UpdateEdge(const TopoDS_Edge & E, const opencascade::handle<Poly_PolygonOnTriangulation> & N, const opencascade::handle<Poly_Triangulation> & T);

		/****** BRep_Builder::UpdateEdge ******/
		/****** md5 signature: 33c1fd32e831b203fa0d899281a253af ******/
		%feature("compactdefaultargs") UpdateEdge;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
N: Poly_PolygonOnTriangulation
T: Poly_Triangulation
L: TopLoc_Location

Return
-------
None

Description
-----------
Changes an Edge polygon on Triangulation.
") UpdateEdge;
		void UpdateEdge(const TopoDS_Edge & E, const opencascade::handle<Poly_PolygonOnTriangulation> & N, const opencascade::handle<Poly_Triangulation> & T, const TopLoc_Location & L);

		/****** BRep_Builder::UpdateEdge ******/
		/****** md5 signature: 164a2998d0b4e92982ecc230cd19f259 ******/
		%feature("compactdefaultargs") UpdateEdge;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
N1: Poly_PolygonOnTriangulation
N2: Poly_PolygonOnTriangulation
T: Poly_Triangulation

Return
-------
None

Description
-----------
Changes an Edge polygon on Triangulation.
") UpdateEdge;
		void UpdateEdge(const TopoDS_Edge & E, const opencascade::handle<Poly_PolygonOnTriangulation> & N1, const opencascade::handle<Poly_PolygonOnTriangulation> & N2, const opencascade::handle<Poly_Triangulation> & T);

		/****** BRep_Builder::UpdateEdge ******/
		/****** md5 signature: c4fc0bba87beaabc83a7a01212438010 ******/
		%feature("compactdefaultargs") UpdateEdge;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
N1: Poly_PolygonOnTriangulation
N2: Poly_PolygonOnTriangulation
T: Poly_Triangulation
L: TopLoc_Location

Return
-------
None

Description
-----------
Changes an Edge polygon on Triangulation.
") UpdateEdge;
		void UpdateEdge(const TopoDS_Edge & E, const opencascade::handle<Poly_PolygonOnTriangulation> & N1, const opencascade::handle<Poly_PolygonOnTriangulation> & N2, const opencascade::handle<Poly_Triangulation> & T, const TopLoc_Location & L);

		/****** BRep_Builder::UpdateEdge ******/
		/****** md5 signature: c23ab2e3d4ab82a884c4a4e5e435a01c ******/
		%feature("compactdefaultargs") UpdateEdge;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
P: Poly_Polygon2D
S: TopoDS_Face

Return
-------
None

Description
-----------
Changes Edge polygon on a face.
") UpdateEdge;
		void UpdateEdge(const TopoDS_Edge & E, const opencascade::handle<Poly_Polygon2D> & P, const TopoDS_Face & S);

		/****** BRep_Builder::UpdateEdge ******/
		/****** md5 signature: 07b9e715d7ba688ac49e475242e13358 ******/
		%feature("compactdefaultargs") UpdateEdge;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
P: Poly_Polygon2D
S: Geom_Surface
T: TopLoc_Location

Return
-------
None

Description
-----------
Changes Edge polygon on a face.
") UpdateEdge;
		void UpdateEdge(const TopoDS_Edge & E, const opencascade::handle<Poly_Polygon2D> & P, const opencascade::handle<Geom_Surface> & S, const TopLoc_Location & T);

		/****** BRep_Builder::UpdateEdge ******/
		/****** md5 signature: 29e9574f15e8cd550ab1232427457506 ******/
		%feature("compactdefaultargs") UpdateEdge;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
P1: Poly_Polygon2D
P2: Poly_Polygon2D
S: TopoDS_Face

Return
-------
None

Description
-----------
Changes Edge polygons on a face. //! A null Polygon removes the 2d Polygon.
") UpdateEdge;
		void UpdateEdge(const TopoDS_Edge & E, const opencascade::handle<Poly_Polygon2D> & P1, const opencascade::handle<Poly_Polygon2D> & P2, const TopoDS_Face & S);

		/****** BRep_Builder::UpdateEdge ******/
		/****** md5 signature: 7cfe9fc63da93eb8832d2459ca6eadde ******/
		%feature("compactdefaultargs") UpdateEdge;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
P1: Poly_Polygon2D
P2: Poly_Polygon2D
S: Geom_Surface
L: TopLoc_Location

Return
-------
None

Description
-----------
Changes Edge polygons on a face. //! A null Polygon removes the 2d Polygon.
") UpdateEdge;
		void UpdateEdge(const TopoDS_Edge & E, const opencascade::handle<Poly_Polygon2D> & P1, const opencascade::handle<Poly_Polygon2D> & P2, const opencascade::handle<Geom_Surface> & S, const TopLoc_Location & L);

		/****** BRep_Builder::UpdateEdge ******/
		/****** md5 signature: 4ddfe00e32907cf6333c0e22b0b43935 ******/
		%feature("compactdefaultargs") UpdateEdge;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
Tol: float

Return
-------
None

Description
-----------
Updates the edge tolerance.
") UpdateEdge;
		void UpdateEdge(const TopoDS_Edge & E, const Standard_Real Tol);

		/****** BRep_Builder::UpdateFace ******/
		/****** md5 signature: 6fe40548ebb7a146acb2655ee1db5cd8 ******/
		%feature("compactdefaultargs") UpdateFace;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face
S: Geom_Surface
L: TopLoc_Location
Tol: float

Return
-------
None

Description
-----------
Updates the face F using the tolerance value Tol, surface S and location Location.
") UpdateFace;
		void UpdateFace(const TopoDS_Face & F, const opencascade::handle<Geom_Surface> & S, const TopLoc_Location & L, const Standard_Real Tol);

		/****** BRep_Builder::UpdateFace ******/
		/****** md5 signature: 46068466603e30f2f620c3de44d08407 ******/
		%feature("compactdefaultargs") UpdateFace;
		%feature("autodoc", "
Parameters
----------
theFace: TopoDS_Face
theTriangulation: Poly_Triangulation
theToReset: bool (optional, default to true)

Return
-------
None

Description
-----------
Changes a face triangulation. A NULL theTriangulation removes face triangulations. If theToReset is True face triangulations will be reset to new list with only one input triangulation that will be active. Else if theTriangulation is contained in internal triangulations list it will be made active, else the active triangulation will be replaced to theTriangulation one.
") UpdateFace;
		void UpdateFace(const TopoDS_Face & theFace, const opencascade::handle<Poly_Triangulation> & theTriangulation, const Standard_Boolean theToReset = true);

		/****** BRep_Builder::UpdateFace ******/
		/****** md5 signature: cfff4752b2b664eb9ba94b81dbc0aea1 ******/
		%feature("compactdefaultargs") UpdateFace;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face
Tol: float

Return
-------
None

Description
-----------
Updates the face Tolerance.
") UpdateFace;
		void UpdateFace(const TopoDS_Face & F, const Standard_Real Tol);

		/****** BRep_Builder::UpdateVertex ******/
		/****** md5 signature: 6ed16c5d2b630479bdda164fcceffbab ******/
		%feature("compactdefaultargs") UpdateVertex;
		%feature("autodoc", "
Parameters
----------
V: TopoDS_Vertex
P: gp_Pnt
Tol: float

Return
-------
None

Description
-----------
Sets a 3D point on the vertex.
") UpdateVertex;
		void UpdateVertex(const TopoDS_Vertex & V, const gp_Pnt & P, const Standard_Real Tol);

		/****** BRep_Builder::UpdateVertex ******/
		/****** md5 signature: b52feaaa4502df1d7f3cae6d3e9d7801 ******/
		%feature("compactdefaultargs") UpdateVertex;
		%feature("autodoc", "
Parameters
----------
V: TopoDS_Vertex
P: float
E: TopoDS_Edge
Tol: float

Return
-------
None

Description
-----------
Sets the parameter for the vertex on the edge curves.
") UpdateVertex;
		void UpdateVertex(const TopoDS_Vertex & V, const Standard_Real P, const TopoDS_Edge & E, const Standard_Real Tol);

		/****** BRep_Builder::UpdateVertex ******/
		/****** md5 signature: 5ad0bcf5af45a22a108943f1afb114c0 ******/
		%feature("compactdefaultargs") UpdateVertex;
		%feature("autodoc", "
Parameters
----------
V: TopoDS_Vertex
P: float
E: TopoDS_Edge
F: TopoDS_Face
Tol: float

Return
-------
None

Description
-----------
Sets the parameter for the vertex on the edge pcurve on the face.
") UpdateVertex;
		void UpdateVertex(const TopoDS_Vertex & V, const Standard_Real P, const TopoDS_Edge & E, const TopoDS_Face & F, const Standard_Real Tol);

		/****** BRep_Builder::UpdateVertex ******/
		/****** md5 signature: 47f9ee35ce872e21e298db1be568b800 ******/
		%feature("compactdefaultargs") UpdateVertex;
		%feature("autodoc", "
Parameters
----------
V: TopoDS_Vertex
P: float
E: TopoDS_Edge
S: Geom_Surface
L: TopLoc_Location
Tol: float

Return
-------
None

Description
-----------
Sets the parameter for the vertex on the edge pcurve on the surface.
") UpdateVertex;
		void UpdateVertex(const TopoDS_Vertex & V, const Standard_Real P, const TopoDS_Edge & E, const opencascade::handle<Geom_Surface> & S, const TopLoc_Location & L, const Standard_Real Tol);

		/****** BRep_Builder::UpdateVertex ******/
		/****** md5 signature: a4b2ad0dca279b29c6bdaf4e40d9c7ab ******/
		%feature("compactdefaultargs") UpdateVertex;
		%feature("autodoc", "
Parameters
----------
Ve: TopoDS_Vertex
U: float
V: float
F: TopoDS_Face
Tol: float

Return
-------
None

Description
-----------
Sets the parameters for the vertex on the face.
") UpdateVertex;
		void UpdateVertex(const TopoDS_Vertex & Ve, const Standard_Real U, const Standard_Real V, const TopoDS_Face & F, const Standard_Real Tol);

		/****** BRep_Builder::UpdateVertex ******/
		/****** md5 signature: cb6a93aeb2b020c8e41bd38b5d870c6d ******/
		%feature("compactdefaultargs") UpdateVertex;
		%feature("autodoc", "
Parameters
----------
V: TopoDS_Vertex
Tol: float

Return
-------
None

Description
-----------
Updates the vertex tolerance.
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
		/****** BRep_CurveRepresentation::Continuity ******/
		/****** md5 signature: 1ba066d280ca3c071eb1064dd6b783fc ******/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "Return
-------
GeomAbs_Shape

Description
-----------
No available documentation.
") Continuity;
		virtual const GeomAbs_Shape  Continuity();

		/****** BRep_CurveRepresentation::Continuity ******/
		/****** md5 signature: 78d8ca8e106bd2f55e42d4dc5945fc32 ******/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "
Parameters
----------
C: GeomAbs_Shape

Return
-------
None

Description
-----------
No available documentation.
") Continuity;
		virtual void Continuity(const GeomAbs_Shape C);

		/****** BRep_CurveRepresentation::Copy ******/
		/****** md5 signature: 2b4cb601b45011a74ab9e5426b2deaa9 ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<BRep_CurveRepresentation>

Description
-----------
Return a copy of this representation.
") Copy;
		virtual opencascade::handle<BRep_CurveRepresentation> Copy();

		/****** BRep_CurveRepresentation::Curve3D ******/
		/****** md5 signature: d279ed7bfc4c5a1c9d25cce3ea782276 ******/
		%feature("compactdefaultargs") Curve3D;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Curve>

Description
-----------
No available documentation.
") Curve3D;
		virtual const opencascade::handle<Geom_Curve> & Curve3D();

		/****** BRep_CurveRepresentation::Curve3D ******/
		/****** md5 signature: d87953b26144d002be0a7e64301c0a6a ******/
		%feature("compactdefaultargs") Curve3D;
		%feature("autodoc", "
Parameters
----------
C: Geom_Curve

Return
-------
None

Description
-----------
No available documentation.
") Curve3D;
		virtual void Curve3D(const opencascade::handle<Geom_Curve> & C);


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** BRep_CurveRepresentation::IsCurve3D ******/
		/****** md5 signature: 3eb9a6a272d02b06294d6182a9677766 ******/
		%feature("compactdefaultargs") IsCurve3D;
		%feature("autodoc", "Return
-------
bool

Description
-----------
A 3D curve representation.
") IsCurve3D;
		virtual Standard_Boolean IsCurve3D();

		/****** BRep_CurveRepresentation::IsCurveOnClosedSurface ******/
		/****** md5 signature: 72c88b632fff4ad75d6d297a2a2f7f9b ******/
		%feature("compactdefaultargs") IsCurveOnClosedSurface;
		%feature("autodoc", "Return
-------
bool

Description
-----------
A curve with two parametric curves on the same surface.
") IsCurveOnClosedSurface;
		virtual Standard_Boolean IsCurveOnClosedSurface();

		/****** BRep_CurveRepresentation::IsCurveOnSurface ******/
		/****** md5 signature: 99c67b3aceff7d9bd0bedc4586bbdb9c ******/
		%feature("compactdefaultargs") IsCurveOnSurface;
		%feature("autodoc", "Return
-------
bool

Description
-----------
A curve in the parametric space of a surface.
") IsCurveOnSurface;
		virtual Standard_Boolean IsCurveOnSurface();

		/****** BRep_CurveRepresentation::IsCurveOnSurface ******/
		/****** md5 signature: c2f5aa58d459c2124c584d9822dbcfa8 ******/
		%feature("compactdefaultargs") IsCurveOnSurface;
		%feature("autodoc", "
Parameters
----------
S: Geom_Surface
L: TopLoc_Location

Return
-------
bool

Description
-----------
Is it a curve in the parametric space of <S> with location <L>.
") IsCurveOnSurface;
		virtual Standard_Boolean IsCurveOnSurface(const opencascade::handle<Geom_Surface> & S, const TopLoc_Location & L);

		/****** BRep_CurveRepresentation::IsPolygon3D ******/
		/****** md5 signature: c82064ea4b47db0a2fc9f12440050f5f ******/
		%feature("compactdefaultargs") IsPolygon3D;
		%feature("autodoc", "Return
-------
bool

Description
-----------
A 3D polygon representation.
") IsPolygon3D;
		virtual Standard_Boolean IsPolygon3D();

		/****** BRep_CurveRepresentation::IsPolygonOnClosedSurface ******/
		/****** md5 signature: 08d24e672be6cac52e1cb77c8b36c07a ******/
		%feature("compactdefaultargs") IsPolygonOnClosedSurface;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Two 2D polygon representations in the parametric space of a surface.
") IsPolygonOnClosedSurface;
		virtual Standard_Boolean IsPolygonOnClosedSurface();

		/****** BRep_CurveRepresentation::IsPolygonOnClosedTriangulation ******/
		/****** md5 signature: b2c0e94e579bb49cddc711ef17a8417e ******/
		%feature("compactdefaultargs") IsPolygonOnClosedTriangulation;
		%feature("autodoc", "Return
-------
bool

Description
-----------
A representation by two arrays of nodes on a triangulation.
") IsPolygonOnClosedTriangulation;
		virtual Standard_Boolean IsPolygonOnClosedTriangulation();

		/****** BRep_CurveRepresentation::IsPolygonOnSurface ******/
		/****** md5 signature: 9e125f1682674ed70fec0c3b43b556e2 ******/
		%feature("compactdefaultargs") IsPolygonOnSurface;
		%feature("autodoc", "Return
-------
bool

Description
-----------
A polygon in the parametric space of a surface.
") IsPolygonOnSurface;
		virtual Standard_Boolean IsPolygonOnSurface();

		/****** BRep_CurveRepresentation::IsPolygonOnSurface ******/
		/****** md5 signature: 1c1f7b90498b125990ff9382d42d93c7 ******/
		%feature("compactdefaultargs") IsPolygonOnSurface;
		%feature("autodoc", "
Parameters
----------
S: Geom_Surface
L: TopLoc_Location

Return
-------
bool

Description
-----------
Is it a polygon in the parametric space of <S> with location <L>.
") IsPolygonOnSurface;
		virtual Standard_Boolean IsPolygonOnSurface(const opencascade::handle<Geom_Surface> & S, const TopLoc_Location & L);

		/****** BRep_CurveRepresentation::IsPolygonOnTriangulation ******/
		/****** md5 signature: f046a82ed644d4b2694291b4a32158de ******/
		%feature("compactdefaultargs") IsPolygonOnTriangulation;
		%feature("autodoc", "Return
-------
bool

Description
-----------
A representation by an array of nodes on a triangulation.
") IsPolygonOnTriangulation;
		virtual Standard_Boolean IsPolygonOnTriangulation();

		/****** BRep_CurveRepresentation::IsPolygonOnTriangulation ******/
		/****** md5 signature: 97eed3382962bceb72e11a7487b53ae0 ******/
		%feature("compactdefaultargs") IsPolygonOnTriangulation;
		%feature("autodoc", "
Parameters
----------
T: Poly_Triangulation
L: TopLoc_Location

Return
-------
bool

Description
-----------
Is it a polygon in the definition of <T> with location <L>.
") IsPolygonOnTriangulation;
		virtual Standard_Boolean IsPolygonOnTriangulation(const opencascade::handle<Poly_Triangulation> & T, const TopLoc_Location & L);

		/****** BRep_CurveRepresentation::IsRegularity ******/
		/****** md5 signature: b3ade1c3f35fca3622ae410d91171b9b ******/
		%feature("compactdefaultargs") IsRegularity;
		%feature("autodoc", "Return
-------
bool

Description
-----------
A continuity between two surfaces.
") IsRegularity;
		virtual Standard_Boolean IsRegularity();

		/****** BRep_CurveRepresentation::IsRegularity ******/
		/****** md5 signature: 76619362955f541a58be5b044aa8bfcd ******/
		%feature("compactdefaultargs") IsRegularity;
		%feature("autodoc", "
Parameters
----------
S1: Geom_Surface
S2: Geom_Surface
L1: TopLoc_Location
L2: TopLoc_Location

Return
-------
bool

Description
-----------
Is it a regularity between <S1> and <S2> with location <L1> and <L2>.
") IsRegularity;
		virtual Standard_Boolean IsRegularity(const opencascade::handle<Geom_Surface> & S1, const opencascade::handle<Geom_Surface> & S2, const TopLoc_Location & L1, const TopLoc_Location & L2);

		/****** BRep_CurveRepresentation::Location ******/
		/****** md5 signature: 1006fdd3bdd7eb59ebf6a6359a702a4f ******/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "Return
-------
TopLoc_Location

Description
-----------
No available documentation.
") Location;
		const TopLoc_Location & Location();

		/****** BRep_CurveRepresentation::Location ******/
		/****** md5 signature: a2c9495044664128886ca4ae6644e853 ******/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "
Parameters
----------
L: TopLoc_Location

Return
-------
None

Description
-----------
No available documentation.
") Location;
		void Location(const TopLoc_Location & L);

		/****** BRep_CurveRepresentation::Location2 ******/
		/****** md5 signature: a1ad6449a6ecb57b13b1f729a62f966c ******/
		%feature("compactdefaultargs") Location2;
		%feature("autodoc", "Return
-------
TopLoc_Location

Description
-----------
No available documentation.
") Location2;
		virtual const TopLoc_Location & Location2();

		/****** BRep_CurveRepresentation::PCurve ******/
		/****** md5 signature: 43048aaabc4361e78597bb73f5eacb84 ******/
		%feature("compactdefaultargs") PCurve;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom2d_Curve>

Description
-----------
No available documentation.
") PCurve;
		virtual const opencascade::handle<Geom2d_Curve> & PCurve();

		/****** BRep_CurveRepresentation::PCurve ******/
		/****** md5 signature: 4167f86bc8643b2c1f384c75757d828a ******/
		%feature("compactdefaultargs") PCurve;
		%feature("autodoc", "
Parameters
----------
C: Geom2d_Curve

Return
-------
None

Description
-----------
No available documentation.
") PCurve;
		virtual void PCurve(const opencascade::handle<Geom2d_Curve> & C);

		/****** BRep_CurveRepresentation::PCurve2 ******/
		/****** md5 signature: 1ec87e5e62d4cf52996d939d5f6c998c ******/
		%feature("compactdefaultargs") PCurve2;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom2d_Curve>

Description
-----------
No available documentation.
") PCurve2;
		virtual const opencascade::handle<Geom2d_Curve> & PCurve2();

		/****** BRep_CurveRepresentation::PCurve2 ******/
		/****** md5 signature: d62e9c14e6c8bb4586bc7d40c0050500 ******/
		%feature("compactdefaultargs") PCurve2;
		%feature("autodoc", "
Parameters
----------
C: Geom2d_Curve

Return
-------
None

Description
-----------
No available documentation.
") PCurve2;
		virtual void PCurve2(const opencascade::handle<Geom2d_Curve> & C);

		/****** BRep_CurveRepresentation::Polygon ******/
		/****** md5 signature: 7c83b4d9dd60de23db90d02f4823b0b7 ******/
		%feature("compactdefaultargs") Polygon;
		%feature("autodoc", "Return
-------
opencascade::handle<Poly_Polygon2D>

Description
-----------
No available documentation.
") Polygon;
		virtual const opencascade::handle<Poly_Polygon2D> & Polygon();

		/****** BRep_CurveRepresentation::Polygon ******/
		/****** md5 signature: 5a10418dc1d6401316bf3351b1ece99b ******/
		%feature("compactdefaultargs") Polygon;
		%feature("autodoc", "
Parameters
----------
P: Poly_Polygon2D

Return
-------
None

Description
-----------
No available documentation.
") Polygon;
		virtual void Polygon(const opencascade::handle<Poly_Polygon2D> & P);

		/****** BRep_CurveRepresentation::Polygon2 ******/
		/****** md5 signature: 7e67f4343ce0293f3c0d87fba7d3ad77 ******/
		%feature("compactdefaultargs") Polygon2;
		%feature("autodoc", "Return
-------
opencascade::handle<Poly_Polygon2D>

Description
-----------
No available documentation.
") Polygon2;
		virtual const opencascade::handle<Poly_Polygon2D> & Polygon2();

		/****** BRep_CurveRepresentation::Polygon2 ******/
		/****** md5 signature: 94e0a95d8b52abc29812d43e1fdcb012 ******/
		%feature("compactdefaultargs") Polygon2;
		%feature("autodoc", "
Parameters
----------
P: Poly_Polygon2D

Return
-------
None

Description
-----------
No available documentation.
") Polygon2;
		virtual void Polygon2(const opencascade::handle<Poly_Polygon2D> & P);

		/****** BRep_CurveRepresentation::Polygon3D ******/
		/****** md5 signature: c03b6e6dd649921e41357d84e4afa929 ******/
		%feature("compactdefaultargs") Polygon3D;
		%feature("autodoc", "Return
-------
opencascade::handle<Poly_Polygon3D>

Description
-----------
No available documentation.
") Polygon3D;
		virtual const opencascade::handle<Poly_Polygon3D> & Polygon3D();

		/****** BRep_CurveRepresentation::Polygon3D ******/
		/****** md5 signature: d69b9ed42bdfdbbfea3e22f152a9af2f ******/
		%feature("compactdefaultargs") Polygon3D;
		%feature("autodoc", "
Parameters
----------
P: Poly_Polygon3D

Return
-------
None

Description
-----------
No available documentation.
") Polygon3D;
		virtual void Polygon3D(const opencascade::handle<Poly_Polygon3D> & P);

		/****** BRep_CurveRepresentation::PolygonOnTriangulation ******/
		/****** md5 signature: 3513ff8f648f9dff9767d9bb2ff49a30 ******/
		%feature("compactdefaultargs") PolygonOnTriangulation;
		%feature("autodoc", "Return
-------
opencascade::handle<Poly_PolygonOnTriangulation>

Description
-----------
No available documentation.
") PolygonOnTriangulation;
		virtual const opencascade::handle<Poly_PolygonOnTriangulation> & PolygonOnTriangulation();

		/****** BRep_CurveRepresentation::PolygonOnTriangulation ******/
		/****** md5 signature: 50379d303554a02ec54f999e1d2c6e8c ******/
		%feature("compactdefaultargs") PolygonOnTriangulation;
		%feature("autodoc", "
Parameters
----------
P: Poly_PolygonOnTriangulation

Return
-------
None

Description
-----------
No available documentation.
") PolygonOnTriangulation;
		virtual void PolygonOnTriangulation(const opencascade::handle<Poly_PolygonOnTriangulation> & P);

		/****** BRep_CurveRepresentation::PolygonOnTriangulation2 ******/
		/****** md5 signature: bacac44468a1a9ac9b9bc4e0db96fc56 ******/
		%feature("compactdefaultargs") PolygonOnTriangulation2;
		%feature("autodoc", "Return
-------
opencascade::handle<Poly_PolygonOnTriangulation>

Description
-----------
No available documentation.
") PolygonOnTriangulation2;
		virtual const opencascade::handle<Poly_PolygonOnTriangulation> & PolygonOnTriangulation2();

		/****** BRep_CurveRepresentation::PolygonOnTriangulation2 ******/
		/****** md5 signature: ba9816f8223ae3766e6abe18498c8f50 ******/
		%feature("compactdefaultargs") PolygonOnTriangulation2;
		%feature("autodoc", "
Parameters
----------
P2: Poly_PolygonOnTriangulation

Return
-------
None

Description
-----------
No available documentation.
") PolygonOnTriangulation2;
		virtual void PolygonOnTriangulation2(const opencascade::handle<Poly_PolygonOnTriangulation> & P2);

		/****** BRep_CurveRepresentation::Surface ******/
		/****** md5 signature: caeaacb2504e4ba5658f6438ad005605 ******/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Surface>

Description
-----------
No available documentation.
") Surface;
		virtual const opencascade::handle<Geom_Surface> & Surface();

		/****** BRep_CurveRepresentation::Surface2 ******/
		/****** md5 signature: 469feb6c8dcb44ee50dfdedab0d8c3b9 ******/
		%feature("compactdefaultargs") Surface2;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Surface>

Description
-----------
No available documentation.
") Surface2;
		virtual const opencascade::handle<Geom_Surface> & Surface2();

		/****** BRep_CurveRepresentation::Triangulation ******/
		/****** md5 signature: 9c932a243ba3dce74eece1156590ffa4 ******/
		%feature("compactdefaultargs") Triangulation;
		%feature("autodoc", "Return
-------
opencascade::handle<Poly_Triangulation>

Description
-----------
No available documentation.
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
		/****** BRep_PointRepresentation::Curve ******/
		/****** md5 signature: 0b527860f975af99bae0f38157e0b434 ******/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Curve>

Description
-----------
No available documentation.
") Curve;
		virtual const opencascade::handle<Geom_Curve> & Curve();

		/****** BRep_PointRepresentation::Curve ******/
		/****** md5 signature: e7a526b0c2503e9af23a4b0971e6b198 ******/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "
Parameters
----------
C: Geom_Curve

Return
-------
None

Description
-----------
No available documentation.
") Curve;
		virtual void Curve(const opencascade::handle<Geom_Curve> & C);


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** BRep_PointRepresentation::IsPointOnCurve ******/
		/****** md5 signature: 7c324f51cb2ffeabf00df42f8c95d4fa ******/
		%feature("compactdefaultargs") IsPointOnCurve;
		%feature("autodoc", "Return
-------
bool

Description
-----------
A point on a 3d curve.
") IsPointOnCurve;
		virtual Standard_Boolean IsPointOnCurve();

		/****** BRep_PointRepresentation::IsPointOnCurve ******/
		/****** md5 signature: df3f830e1372e8a85aa278368212b7a0 ******/
		%feature("compactdefaultargs") IsPointOnCurve;
		%feature("autodoc", "
Parameters
----------
C: Geom_Curve
L: TopLoc_Location

Return
-------
bool

Description
-----------
A point on the curve <C>.
") IsPointOnCurve;
		virtual Standard_Boolean IsPointOnCurve(const opencascade::handle<Geom_Curve> & C, const TopLoc_Location & L);

		/****** BRep_PointRepresentation::IsPointOnCurveOnSurface ******/
		/****** md5 signature: 10495de40839fdd3337c523f5cd30d3f ******/
		%feature("compactdefaultargs") IsPointOnCurveOnSurface;
		%feature("autodoc", "Return
-------
bool

Description
-----------
A point on a 2d curve on a surface.
") IsPointOnCurveOnSurface;
		virtual Standard_Boolean IsPointOnCurveOnSurface();

		/****** BRep_PointRepresentation::IsPointOnCurveOnSurface ******/
		/****** md5 signature: 80624704f58b4028b17e9c7e2ade123c ******/
		%feature("compactdefaultargs") IsPointOnCurveOnSurface;
		%feature("autodoc", "
Parameters
----------
PC: Geom2d_Curve
S: Geom_Surface
L: TopLoc_Location

Return
-------
bool

Description
-----------
A point on the 2d curve <PC> on the surface <S>.
") IsPointOnCurveOnSurface;
		virtual Standard_Boolean IsPointOnCurveOnSurface(const opencascade::handle<Geom2d_Curve> & PC, const opencascade::handle<Geom_Surface> & S, const TopLoc_Location & L);

		/****** BRep_PointRepresentation::IsPointOnSurface ******/
		/****** md5 signature: 9f06ea5cc25d99745a00c53dd1c6ad46 ******/
		%feature("compactdefaultargs") IsPointOnSurface;
		%feature("autodoc", "Return
-------
bool

Description
-----------
A point on a surface.
") IsPointOnSurface;
		virtual Standard_Boolean IsPointOnSurface();

		/****** BRep_PointRepresentation::IsPointOnSurface ******/
		/****** md5 signature: 0cda33b49cc335d68473d388862051a2 ******/
		%feature("compactdefaultargs") IsPointOnSurface;
		%feature("autodoc", "
Parameters
----------
S: Geom_Surface
L: TopLoc_Location

Return
-------
bool

Description
-----------
A point on the surface <S>.
") IsPointOnSurface;
		virtual Standard_Boolean IsPointOnSurface(const opencascade::handle<Geom_Surface> & S, const TopLoc_Location & L);

		/****** BRep_PointRepresentation::Location ******/
		/****** md5 signature: 1006fdd3bdd7eb59ebf6a6359a702a4f ******/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "Return
-------
TopLoc_Location

Description
-----------
No available documentation.
") Location;
		const TopLoc_Location & Location();

		/****** BRep_PointRepresentation::Location ******/
		/****** md5 signature: a2c9495044664128886ca4ae6644e853 ******/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "
Parameters
----------
L: TopLoc_Location

Return
-------
None

Description
-----------
No available documentation.
") Location;
		void Location(const TopLoc_Location & L);

		/****** BRep_PointRepresentation::PCurve ******/
		/****** md5 signature: 43048aaabc4361e78597bb73f5eacb84 ******/
		%feature("compactdefaultargs") PCurve;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom2d_Curve>

Description
-----------
No available documentation.
") PCurve;
		virtual const opencascade::handle<Geom2d_Curve> & PCurve();

		/****** BRep_PointRepresentation::PCurve ******/
		/****** md5 signature: 4167f86bc8643b2c1f384c75757d828a ******/
		%feature("compactdefaultargs") PCurve;
		%feature("autodoc", "
Parameters
----------
C: Geom2d_Curve

Return
-------
None

Description
-----------
No available documentation.
") PCurve;
		virtual void PCurve(const opencascade::handle<Geom2d_Curve> & C);

		/****** BRep_PointRepresentation::Parameter ******/
		/****** md5 signature: ecccdeaeaa0deed24f47e61ad75d24f1 ******/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") Parameter;
		Standard_Real Parameter();

		/****** BRep_PointRepresentation::Parameter ******/
		/****** md5 signature: 26acaf0b4677a7a04af978de63424b8a ******/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "
Parameters
----------
P: float

Return
-------
None

Description
-----------
No available documentation.
") Parameter;
		void Parameter(const Standard_Real P);

		/****** BRep_PointRepresentation::Parameter2 ******/
		/****** md5 signature: ebec675141eed0afeab9cec9239b82fd ******/
		%feature("compactdefaultargs") Parameter2;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") Parameter2;
		virtual Standard_Real Parameter2();

		/****** BRep_PointRepresentation::Parameter2 ******/
		/****** md5 signature: ba1ce084d93aa3fbbf8109406ec28c85 ******/
		%feature("compactdefaultargs") Parameter2;
		%feature("autodoc", "
Parameters
----------
P: float

Return
-------
None

Description
-----------
No available documentation.
") Parameter2;
		virtual void Parameter2(const Standard_Real P);

		/****** BRep_PointRepresentation::Surface ******/
		/****** md5 signature: caeaacb2504e4ba5658f6438ad005605 ******/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Surface>

Description
-----------
No available documentation.
") Surface;
		virtual const opencascade::handle<Geom_Surface> & Surface();

		/****** BRep_PointRepresentation::Surface ******/
		/****** md5 signature: 2d28bc979e4349a8444df575f31f8c69 ******/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "
Parameters
----------
S: Geom_Surface

Return
-------
None

Description
-----------
No available documentation.
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
		/****** BRep_TEdge::BRep_TEdge ******/
		/****** md5 signature: dc5e73bb712d71a9e89a159289621391 ******/
		%feature("compactdefaultargs") BRep_TEdge;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates an empty TEdge.
") BRep_TEdge;
		 BRep_TEdge();

		/****** BRep_TEdge::ChangeCurves ******/
		/****** md5 signature: c7093778d271363c43221185b70772c2 ******/
		%feature("compactdefaultargs") ChangeCurves;
		%feature("autodoc", "Return
-------
BRep_ListOfCurveRepresentation

Description
-----------
No available documentation.
") ChangeCurves;
		BRep_ListOfCurveRepresentation & ChangeCurves();

		/****** BRep_TEdge::Curves ******/
		/****** md5 signature: 380c29c54228acfb467d87ab2aa82789 ******/
		%feature("compactdefaultargs") Curves;
		%feature("autodoc", "Return
-------
BRep_ListOfCurveRepresentation

Description
-----------
No available documentation.
") Curves;
		BRep_ListOfCurveRepresentation Curves();

		/****** BRep_TEdge::Degenerated ******/
		/****** md5 signature: ecd3f4abf547c73285489df59f09d893 ******/
		%feature("compactdefaultargs") Degenerated;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") Degenerated;
		Standard_Boolean Degenerated();

		/****** BRep_TEdge::Degenerated ******/
		/****** md5 signature: 060f5e58625d202b0cc508497a97f999 ******/
		%feature("compactdefaultargs") Degenerated;
		%feature("autodoc", "
Parameters
----------
S: bool

Return
-------
None

Description
-----------
No available documentation.
") Degenerated;
		void Degenerated(const Standard_Boolean S);


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** BRep_TEdge::EmptyCopy ******/
		/****** md5 signature: 8ab9f2aeb90e3da510c24152dd199206 ******/
		%feature("compactdefaultargs") EmptyCopy;
		%feature("autodoc", "Return
-------
opencascade::handle<TopoDS_TShape>

Description
-----------
Returns a copy of the TShape with no sub-shapes.
") EmptyCopy;
		opencascade::handle<TopoDS_TShape> EmptyCopy();

		/****** BRep_TEdge::SameParameter ******/
		/****** md5 signature: f4740c56ff2fddf1fa0cf5af61044630 ******/
		%feature("compactdefaultargs") SameParameter;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") SameParameter;
		Standard_Boolean SameParameter();

		/****** BRep_TEdge::SameParameter ******/
		/****** md5 signature: 971f1e388de91e0974c1ea559734a641 ******/
		%feature("compactdefaultargs") SameParameter;
		%feature("autodoc", "
Parameters
----------
S: bool

Return
-------
None

Description
-----------
No available documentation.
") SameParameter;
		void SameParameter(const Standard_Boolean S);

		/****** BRep_TEdge::SameRange ******/
		/****** md5 signature: f0165c4a9606e03adad27f73c14db766 ******/
		%feature("compactdefaultargs") SameRange;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") SameRange;
		Standard_Boolean SameRange();

		/****** BRep_TEdge::SameRange ******/
		/****** md5 signature: 776576a6b34833f7e7ff608a4ed6cb28 ******/
		%feature("compactdefaultargs") SameRange;
		%feature("autodoc", "
Parameters
----------
S: bool

Return
-------
None

Description
-----------
No available documentation.
") SameRange;
		void SameRange(const Standard_Boolean S);

		/****** BRep_TEdge::Tolerance ******/
		/****** md5 signature: 9e5775014410d884d1a1adc1cd47930b ******/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") Tolerance;
		Standard_Real Tolerance();

		/****** BRep_TEdge::Tolerance ******/
		/****** md5 signature: 36bec8dcfdb7e7f4f4edb2eeca6bf06a ******/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "
Parameters
----------
T: float

Return
-------
None

Description
-----------
No available documentation.
") Tolerance;
		void Tolerance(const Standard_Real T);

		/****** BRep_TEdge::UpdateTolerance ******/
		/****** md5 signature: d815779cec8f7136f7f9e7c3e47cab9e ******/
		%feature("compactdefaultargs") UpdateTolerance;
		%feature("autodoc", "
Parameters
----------
T: float

Return
-------
None

Description
-----------
Sets the tolerance to the max of <T> and the current tolerance.
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
		/****** BRep_TFace::BRep_TFace ******/
		/****** md5 signature: 48097eeafa59b1363f7b8916a9b44f72 ******/
		%feature("compactdefaultargs") BRep_TFace;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates an empty TFace.
") BRep_TFace;
		 BRep_TFace();

		/****** BRep_TFace::ActiveTriangulation ******/
		/****** md5 signature: 700e23716c69d5b67f3f27b14bf22b4f ******/
		%feature("compactdefaultargs") ActiveTriangulation;
		%feature("autodoc", "Return
-------
opencascade::handle<Poly_Triangulation>

Description
-----------
Returns current active triangulation.
") ActiveTriangulation;
		const opencascade::handle<Poly_Triangulation> & ActiveTriangulation();


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** BRep_TFace::EmptyCopy ******/
		/****** md5 signature: 3d9756f12a98e8eef17d86b0c132771f ******/
		%feature("compactdefaultargs") EmptyCopy;
		%feature("autodoc", "Return
-------
opencascade::handle<TopoDS_TShape>

Description
-----------
Returns a copy of the TShape with no sub-shapes. The new Face has no triangulation.
") EmptyCopy;
		virtual opencascade::handle<TopoDS_TShape> EmptyCopy();

		/****** BRep_TFace::Location ******/
		/****** md5 signature: 57e4db9c8a7a08cffc827dc50be227c9 ******/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "Return
-------
TopLoc_Location

Description
-----------
Returns the face location.
") Location;
		const TopLoc_Location & Location();

		/****** BRep_TFace::Location ******/
		/****** md5 signature: bb857ae8889d5b33371c407b0c54d0cb ******/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "
Parameters
----------
theLocation: TopLoc_Location

Return
-------
None

Description
-----------
Sets the location for this face.
") Location;
		void Location(const TopLoc_Location & theLocation);

		/****** BRep_TFace::NaturalRestriction ******/
		/****** md5 signature: 73f4cd683852501cbdb851a873e3006e ******/
		%feature("compactdefaultargs") NaturalRestriction;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the boundary of this face is known to be the parametric space (Umin, UMax, VMin, VMax).
") NaturalRestriction;
		Standard_Boolean NaturalRestriction();

		/****** BRep_TFace::NaturalRestriction ******/
		/****** md5 signature: 3dc8b4a5fc00fb6b99650b6f24e2c30a ******/
		%feature("compactdefaultargs") NaturalRestriction;
		%feature("autodoc", "
Parameters
----------
theRestriction: bool

Return
-------
None

Description
-----------
Sets the flag that is True if the boundary of this face is known to be the parametric space.
") NaturalRestriction;
		void NaturalRestriction(const Standard_Boolean theRestriction);

		/****** BRep_TFace::NbTriangulations ******/
		/****** md5 signature: 19c79cd06fe3039a67f78fa6226f6d24 ******/
		%feature("compactdefaultargs") NbTriangulations;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns number of available face triangulations.
") NbTriangulations;
		Standard_Integer NbTriangulations();

		/****** BRep_TFace::Surface ******/
		/****** md5 signature: 3aa31a6d63da8a25f018cf96599c0928 ******/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Surface>

Description
-----------
Returns face surface.
") Surface;
		const opencascade::handle<Geom_Surface> & Surface();

		/****** BRep_TFace::Surface ******/
		/****** md5 signature: 277744bd75ecf30c3537bd170d0e688b ******/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "
Parameters
----------
theSurface: Geom_Surface

Return
-------
None

Description
-----------
Sets surface for this face.
") Surface;
		void Surface(const opencascade::handle<Geom_Surface> & theSurface);

		/****** BRep_TFace::Tolerance ******/
		/****** md5 signature: 327dcbe220ae5ba3e0203f32c61c38db ******/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the face tolerance.
") Tolerance;
		Standard_Real Tolerance();

		/****** BRep_TFace::Tolerance ******/
		/****** md5 signature: 87220829eafedab2b5ef265dd6be1ecf ******/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "
Parameters
----------
theTolerance: float

Return
-------
None

Description
-----------
Sets the tolerance for this face.
") Tolerance;
		void Tolerance(const Standard_Real theTolerance);

		/****** BRep_TFace::Triangulation ******/
		/****** md5 signature: 031b83aac32b0db8569fa3861a62e31f ******/
		%feature("compactdefaultargs") Triangulation;
		%feature("autodoc", "
Parameters
----------
thePurpose: Poly_MeshPurpose (optional, default to Poly_MeshPurpose_NONE)

Return
-------
opencascade::handle<Poly_Triangulation>

Description
-----------
Returns the triangulation of this face according to the mesh purpose. 
Input parameter: thePurpose a mesh purpose to find appropriate triangulation (NONE by default). 
Return: an active triangulation in case of NONE purpose, the first triangulation appropriate for the input purpose, just the first triangulation if none matching other criteria and input purpose is AnyFallback or null handle if there is no any suitable triangulation.
") Triangulation;
		const opencascade::handle<Poly_Triangulation> & Triangulation(const Poly_MeshPurpose thePurpose = Poly_MeshPurpose_NONE);

		/****** BRep_TFace::Triangulation ******/
		/****** md5 signature: ec7f735385ed0e818ad3a3ad3c13b876 ******/
		%feature("compactdefaultargs") Triangulation;
		%feature("autodoc", "
Parameters
----------
theTriangulation: Poly_Triangulation
theToReset: bool (optional, default to true)

Return
-------
None

Description
-----------
Sets input triangulation for this face. 
Input parameter: theTriangulation triangulation to be set 
Input parameter: theToReset flag to reset triangulations list to new list with only one input triangulation. If theTriangulation is NULL internal list of triangulations will be cleared and active triangulation will be nullified. If theToReset is True internal list of triangulations will be reset to new list with only one input triangulation that will be active. Else if input triangulation is contained in internal triangulations list it will be made active, else the active triangulation will be replaced to input one.
") Triangulation;
		void Triangulation(const opencascade::handle<Poly_Triangulation> & theTriangulation, const Standard_Boolean theToReset = true);

		/****** BRep_TFace::Triangulations ******/
		/****** md5 signature: ff9482874654ec6c8f82dbd05f8b62aa ******/
		%feature("compactdefaultargs") Triangulations;
		%feature("autodoc", "Return
-------
Poly_ListOfTriangulation

Description
-----------
Returns the list of available face triangulations.
") Triangulations;
		const Poly_ListOfTriangulation & Triangulations();

		/****** BRep_TFace::Triangulations ******/
		/****** md5 signature: 9aea5c4c84dd41a6b79e5dc9a6ea0806 ******/
		%feature("compactdefaultargs") Triangulations;
		%feature("autodoc", "
Parameters
----------
theTriangulations: Poly_ListOfTriangulation
theActiveTriangulation: Poly_Triangulation

Return
-------
None

Description
-----------
Sets input list of triangulations and currently active triangulation for this face. If list is empty internal list of triangulations will be cleared and active triangulation will be nullified. Else this list will be saved and the input active triangulation be saved as active. Use NULL active triangulation to set the first triangulation in list as active. Note: the method throws exception if there is any NULL triangulation in input list or if this list doesn't contain input active triangulation.
") Triangulations;
		void Triangulations(const Poly_ListOfTriangulation & theTriangulations, const opencascade::handle<Poly_Triangulation> & theActiveTriangulation);

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
		/****** BRep_TVertex::BRep_TVertex ******/
		/****** md5 signature: 3922795a238613ee8bf7ad992e0d7900 ******/
		%feature("compactdefaultargs") BRep_TVertex;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") BRep_TVertex;
		 BRep_TVertex();

		/****** BRep_TVertex::ChangePoints ******/
		/****** md5 signature: 9c8aaec6ac35930ce290f4893d0d1dad ******/
		%feature("compactdefaultargs") ChangePoints;
		%feature("autodoc", "Return
-------
BRep_ListOfPointRepresentation

Description
-----------
No available documentation.
") ChangePoints;
		BRep_ListOfPointRepresentation & ChangePoints();


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** BRep_TVertex::EmptyCopy ******/
		/****** md5 signature: 8ab9f2aeb90e3da510c24152dd199206 ******/
		%feature("compactdefaultargs") EmptyCopy;
		%feature("autodoc", "Return
-------
opencascade::handle<TopoDS_TShape>

Description
-----------
Returns a copy of the TShape with no sub-shapes.
") EmptyCopy;
		opencascade::handle<TopoDS_TShape> EmptyCopy();

		/****** BRep_TVertex::Pnt ******/
		/****** md5 signature: c0bafeed50f4eebb5964e2bf8520bf90 ******/
		%feature("compactdefaultargs") Pnt;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
No available documentation.
") Pnt;
		const gp_Pnt Pnt();

		/****** BRep_TVertex::Pnt ******/
		/****** md5 signature: 5c63e7382eafc56383cc46ade985ccff ******/
		%feature("compactdefaultargs") Pnt;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") Pnt;
		void Pnt(const gp_Pnt & P);

		/****** BRep_TVertex::Points ******/
		/****** md5 signature: 94f0b490436a51d49c7e2367d3c7bbb0 ******/
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "Return
-------
BRep_ListOfPointRepresentation

Description
-----------
No available documentation.
") Points;
		const BRep_ListOfPointRepresentation & Points();

		/****** BRep_TVertex::Tolerance ******/
		/****** md5 signature: 9e5775014410d884d1a1adc1cd47930b ******/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") Tolerance;
		Standard_Real Tolerance();

		/****** BRep_TVertex::Tolerance ******/
		/****** md5 signature: 36bec8dcfdb7e7f4f4edb2eeca6bf06a ******/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "
Parameters
----------
T: float

Return
-------
None

Description
-----------
No available documentation.
") Tolerance;
		void Tolerance(const Standard_Real T);

		/****** BRep_TVertex::UpdateTolerance ******/
		/****** md5 signature: d815779cec8f7136f7f9e7c3e47cab9e ******/
		%feature("compactdefaultargs") UpdateTolerance;
		%feature("autodoc", "
Parameters
----------
T: float

Return
-------
None

Description
-----------
Sets the tolerance to the max of <T> and the current tolerance.
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
		/****** BRep_Tool::Continuity ******/
		/****** md5 signature: db1e3396b84a7e307be8da87ce7551cd ******/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
F1: TopoDS_Face
F2: TopoDS_Face

Return
-------
GeomAbs_Shape

Description
-----------
Returns the continuity.
") Continuity;
		static GeomAbs_Shape Continuity(const TopoDS_Edge & E, const TopoDS_Face & F1, const TopoDS_Face & F2);

		/****** BRep_Tool::Continuity ******/
		/****** md5 signature: 05bc8a9a3f4893b42026ee0c78170ca1 ******/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
S1: Geom_Surface
S2: Geom_Surface
L1: TopLoc_Location
L2: TopLoc_Location

Return
-------
GeomAbs_Shape

Description
-----------
Returns the continuity.
") Continuity;
		static GeomAbs_Shape Continuity(const TopoDS_Edge & E, const opencascade::handle<Geom_Surface> & S1, const opencascade::handle<Geom_Surface> & S2, const TopLoc_Location & L1, const TopLoc_Location & L2);

		/****** BRep_Tool::Curve ******/
		/****** md5 signature: 41bbd3916c9a4b8e71d76a77fd142236 ******/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
L: TopLoc_Location

Return
-------
First: float
Last: float

Description
-----------
Returns the 3D curve of the edge. May be a Null handle. Returns in <L> the location for the curve. In <First> and <Last> the parameter range.
") Curve;
		static const opencascade::handle<Geom_Curve> & Curve(const TopoDS_Edge & E, TopLoc_Location & L, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** BRep_Tool::Curve ******/
		/****** md5 signature: 25054d3585c70f9581241c1f399ea5e7 ******/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge

Return
-------
First: float
Last: float

Description
-----------
Returns the 3D curve of the edge. May be a Null handle. In <First> and <Last> the parameter range. It can be a copy if there is a Location.
") Curve;
		static opencascade::handle<Geom_Curve> Curve(const TopoDS_Edge & E, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** BRep_Tool::CurveOnPlane ******/
		/****** md5 signature: f92505101b8372fadb2e63ec301d6980 ******/
		%feature("compactdefaultargs") CurveOnPlane;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
S: Geom_Surface
L: TopLoc_Location

Return
-------
First: float
Last: float

Description
-----------
For the planar surface builds the 2d curve for the edge by projection of the edge on plane. Returns a NULL handle if the surface is not planar or the projection failed.
") CurveOnPlane;
		static opencascade::handle<Geom2d_Curve> CurveOnPlane(const TopoDS_Edge & E, const opencascade::handle<Geom_Surface> & S, const TopLoc_Location & L, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** BRep_Tool::CurveOnSurface ******/
		/****** md5 signature: 1490e00c62d6d2093296a244d8baa466 ******/
		%feature("compactdefaultargs") CurveOnSurface;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
F: TopoDS_Face
theIsStored: bool * (optional, default to NULL)

Return
-------
First: float
Last: float

Description
-----------
Returns the curve associated to the edge in the parametric space of the face. Returns a NULL handle if this curve does not exist. Returns in <First> and <Last> the parameter range. If the surface is a plane the curve can be not stored but created a new each time. The flag pointed by <theIsStored> serves to indicate storage status. It is valued if the pointer is non-null.
") CurveOnSurface;
		static opencascade::handle<Geom2d_Curve> CurveOnSurface(const TopoDS_Edge & E, const TopoDS_Face & F, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Boolean * theIsStored = NULL);

		/****** BRep_Tool::CurveOnSurface ******/
		/****** md5 signature: 3a442b1530d9c81bbff3fadea605743e ******/
		%feature("compactdefaultargs") CurveOnSurface;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
S: Geom_Surface
L: TopLoc_Location
theIsStored: bool * (optional, default to NULL)

Return
-------
First: float
Last: float

Description
-----------
Returns the curve associated to the edge in the parametric space of the surface. Returns a NULL handle if this curve does not exist. Returns in <First> and <Last> the parameter range. If the surface is a plane the curve can be not stored but created a new each time. The flag pointed by <theIsStored> serves to indicate storage status. It is valued if the pointer is non-null.
") CurveOnSurface;
		static opencascade::handle<Geom2d_Curve> CurveOnSurface(const TopoDS_Edge & E, const opencascade::handle<Geom_Surface> & S, const TopLoc_Location & L, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Boolean * theIsStored = NULL);

		/****** BRep_Tool::CurveOnSurface ******/
		/****** md5 signature: fb9b1fbc5f5e3312c1bd64ab586fa88f ******/
		%feature("compactdefaultargs") CurveOnSurface;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
C: Geom2d_Curve
S: Geom_Surface
L: TopLoc_Location

Return
-------
First: float
Last: float

Description
-----------
Returns in <C>, <S>, <L> a 2d curve, a surface and a location for the edge <E>. <C> and <S> are null if the edge has no curve on surface. Returns in <First> and <Last> the parameter range.
") CurveOnSurface;
		static void CurveOnSurface(const TopoDS_Edge & E, opencascade::handle<Geom2d_Curve> & C, opencascade::handle<Geom_Surface> & S, TopLoc_Location & L, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** BRep_Tool::CurveOnSurface ******/
		/****** md5 signature: 6f4f3f522500fc969face4c6451b085e ******/
		%feature("compactdefaultargs") CurveOnSurface;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
C: Geom2d_Curve
S: Geom_Surface
L: TopLoc_Location
Index: int

Return
-------
First: float
Last: float

Description
-----------
Returns in <C>, <S>, <L> the 2d curve, the surface and the location for the edge <E> of rank <Index>. <C> and <S> are null if the index is out of range. Returns in <First> and <Last> the parameter range.
") CurveOnSurface;
		static void CurveOnSurface(const TopoDS_Edge & E, opencascade::handle<Geom2d_Curve> & C, opencascade::handle<Geom_Surface> & S, TopLoc_Location & L, Standard_Real &OutValue, Standard_Real &OutValue, const Standard_Integer Index);

		/****** BRep_Tool::Degenerated ******/
		/****** md5 signature: 065e91ab65eebb04f4157f99dfb61a5f ******/
		%feature("compactdefaultargs") Degenerated;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge

Return
-------
bool

Description
-----------
Returns True if the edge is degenerated.
") Degenerated;
		static Standard_Boolean Degenerated(const TopoDS_Edge & E);

		/****** BRep_Tool::HasContinuity ******/
		/****** md5 signature: 28de7d368e6753102bc97f842c0bbc34 ******/
		%feature("compactdefaultargs") HasContinuity;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
F1: TopoDS_Face
F2: TopoDS_Face

Return
-------
bool

Description
-----------
Returns True if the edge is on the surfaces of the two faces.
") HasContinuity;
		static Standard_Boolean HasContinuity(const TopoDS_Edge & E, const TopoDS_Face & F1, const TopoDS_Face & F2);

		/****** BRep_Tool::HasContinuity ******/
		/****** md5 signature: 4e914e4f0ffad7c5e4ad1bbcbb49f9db ******/
		%feature("compactdefaultargs") HasContinuity;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
S1: Geom_Surface
S2: Geom_Surface
L1: TopLoc_Location
L2: TopLoc_Location

Return
-------
bool

Description
-----------
Returns True if the edge is on the surfaces.
") HasContinuity;
		static Standard_Boolean HasContinuity(const TopoDS_Edge & E, const opencascade::handle<Geom_Surface> & S1, const opencascade::handle<Geom_Surface> & S2, const TopLoc_Location & L1, const TopLoc_Location & L2);

		/****** BRep_Tool::HasContinuity ******/
		/****** md5 signature: 590c0c5ffdf73c7bc74af7efff8daacc ******/
		%feature("compactdefaultargs") HasContinuity;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge

Return
-------
bool

Description
-----------
Returns True if the edge has regularity on some two surfaces.
") HasContinuity;
		static Standard_Boolean HasContinuity(const TopoDS_Edge & E);

		/****** BRep_Tool::IsClosed ******/
		/****** md5 signature: f8e1bed2f4c39eb2e90687cebc873cc7 ******/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
bool

Description
-----------
If S is Shell, returns True if it has no free boundaries (edges). If S is Wire, returns True if it has no free ends (vertices). (Internal and External sub-shepes are ignored in these checks) If S is Edge, returns True if its vertices are the same. For other shape types returns S.Closed().
") IsClosed;
		static Standard_Boolean IsClosed(const TopoDS_Shape & S);

		/****** BRep_Tool::IsClosed ******/
		/****** md5 signature: fe1173e15d5c0fa9a4dc0e4bdc10019d ******/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
F: TopoDS_Face

Return
-------
bool

Description
-----------
Returns True if <E> has two PCurves in the parametric space of <F>. i.e. <F> is on a closed surface and <E> is on the closing curve.
") IsClosed;
		static Standard_Boolean IsClosed(const TopoDS_Edge & E, const TopoDS_Face & F);

		/****** BRep_Tool::IsClosed ******/
		/****** md5 signature: 5d71976e343bf12f49f22891aaedbbd4 ******/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
S: Geom_Surface
L: TopLoc_Location

Return
-------
bool

Description
-----------
Returns True if <E> has two PCurves in the parametric space of <S>. i.e. <S> is a closed surface and <E> is on the closing curve.
") IsClosed;
		static Standard_Boolean IsClosed(const TopoDS_Edge & E, const opencascade::handle<Geom_Surface> & S, const TopLoc_Location & L);

		/****** BRep_Tool::IsClosed ******/
		/****** md5 signature: 0fb623443621ae6a98b532d96fdea052 ******/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
T: Poly_Triangulation
L: TopLoc_Location

Return
-------
bool

Description
-----------
Returns True if <E> has two arrays of indices in the triangulation <T>.
") IsClosed;
		static Standard_Boolean IsClosed(const TopoDS_Edge & E, const opencascade::handle<Poly_Triangulation> & T, const TopLoc_Location & L);

		/****** BRep_Tool::IsGeometric ******/
		/****** md5 signature: a3ffa305b3ca35ee4bb109dae046e742 ******/
		%feature("compactdefaultargs") IsGeometric;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face

Return
-------
bool

Description
-----------
Returns True if <F> has a surface, false otherwise.
") IsGeometric;
		static Standard_Boolean IsGeometric(const TopoDS_Face & F);

		/****** BRep_Tool::IsGeometric ******/
		/****** md5 signature: a117bc77f4eeb666df610e8aa8cf72d3 ******/
		%feature("compactdefaultargs") IsGeometric;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge

Return
-------
bool

Description
-----------
Returns True if <E> is a 3d curve or a curve on surface.
") IsGeometric;
		static Standard_Boolean IsGeometric(const TopoDS_Edge & E);

		/****** BRep_Tool::MaxContinuity ******/
		/****** md5 signature: 43a8d131c797f0a5a3836d8b844dd91d ******/
		%feature("compactdefaultargs") MaxContinuity;
		%feature("autodoc", "
Parameters
----------
theEdge: TopoDS_Edge

Return
-------
GeomAbs_Shape

Description
-----------
Returns the max continuity of edge between some surfaces or GeomAbs_C0 if there no such surfaces.
") MaxContinuity;
		static GeomAbs_Shape MaxContinuity(const TopoDS_Edge & theEdge);

		/****** BRep_Tool::MaxTolerance ******/
		/****** md5 signature: 2e9b716a612aac14e6a93a8b379ae457 ******/
		%feature("compactdefaultargs") MaxTolerance;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape
theSubShape: TopAbs_ShapeEnum

Return
-------
float

Description
-----------
Returns the maximum tolerance of input shape subshapes.
") MaxTolerance;
		static Standard_Real MaxTolerance(const TopoDS_Shape & theShape, const TopAbs_ShapeEnum theSubShape);

		/****** BRep_Tool::NaturalRestriction ******/
		/****** md5 signature: 45722e9079a6a7d1eaf45dd458585b4b ******/
		%feature("compactdefaultargs") NaturalRestriction;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face

Return
-------
bool

Description
-----------
Returns the NaturalRestriction flag of the face.
") NaturalRestriction;
		static Standard_Boolean NaturalRestriction(const TopoDS_Face & F);

		/****** BRep_Tool::Parameter ******/
		/****** md5 signature: c56b7997627b41e5c85381896332b42c ******/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "
Parameters
----------
theV: TopoDS_Vertex
theE: TopoDS_Edge

Return
-------
theParam: float

Description
-----------
Finds the parameter of <theV> on <theE>. 
Input parameter: theV input vertex 
Input parameter: theE input edge @param[out] theParam calculated parameter on the curve 
Return: True if done.
") Parameter;
		static Standard_Boolean Parameter(const TopoDS_Vertex & theV, const TopoDS_Edge & theE, Standard_Real &OutValue);

		/****** BRep_Tool::Parameter ******/
		/****** md5 signature: acf610e0d04db95f94cbf8cee69452ec ******/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "
Parameters
----------
V: TopoDS_Vertex
E: TopoDS_Edge

Return
-------
float

Description
-----------
Returns the parameter of <V> on <E>. Throws Standard_NoSuchObject if no parameter on edge.
") Parameter;
		static Standard_Real Parameter(const TopoDS_Vertex & V, const TopoDS_Edge & E);

		/****** BRep_Tool::Parameter ******/
		/****** md5 signature: 4ab7069dc8aa92aba4d9bc115fe6539e ******/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "
Parameters
----------
V: TopoDS_Vertex
E: TopoDS_Edge
F: TopoDS_Face

Return
-------
float

Description
-----------
Returns the parameters of the vertex on the pcurve of the edge on the face.
") Parameter;
		static Standard_Real Parameter(const TopoDS_Vertex & V, const TopoDS_Edge & E, const TopoDS_Face & F);

		/****** BRep_Tool::Parameter ******/
		/****** md5 signature: 9607ea6c17746b94862cf9a0fd3d4098 ******/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "
Parameters
----------
V: TopoDS_Vertex
E: TopoDS_Edge
S: Geom_Surface
L: TopLoc_Location

Return
-------
float

Description
-----------
Returns the parameters of the vertex on the pcurve of the edge on the surface.
") Parameter;
		static Standard_Real Parameter(const TopoDS_Vertex & V, const TopoDS_Edge & E, const opencascade::handle<Geom_Surface> & S, const TopLoc_Location & L);

		/****** BRep_Tool::Parameters ******/
		/****** md5 signature: 2dc7c67673575d16337453d698ba351f ******/
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "
Parameters
----------
V: TopoDS_Vertex
F: TopoDS_Face

Return
-------
gp_Pnt2d

Description
-----------
Returns the parameters of the vertex on the face.
") Parameters;
		static gp_Pnt2d Parameters(const TopoDS_Vertex & V, const TopoDS_Face & F);

		/****** BRep_Tool::Pnt ******/
		/****** md5 signature: b95aeb40cfca21ad6dd9a569b19bd30a ******/
		%feature("compactdefaultargs") Pnt;
		%feature("autodoc", "
Parameters
----------
V: TopoDS_Vertex

Return
-------
gp_Pnt

Description
-----------
Returns the 3d point.
") Pnt;
		static gp_Pnt Pnt(const TopoDS_Vertex & V);

		/****** BRep_Tool::Polygon3D ******/
		/****** md5 signature: a86c387c6a4ceee0e0a5a44087861c1f ******/
		%feature("compactdefaultargs") Polygon3D;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
L: TopLoc_Location

Return
-------
opencascade::handle<Poly_Polygon3D>

Description
-----------
Returns the 3D polygon of the edge. May be a Null handle. Returns in <L> the location for the polygon.
") Polygon3D;
		static const opencascade::handle<Poly_Polygon3D> & Polygon3D(const TopoDS_Edge & E, TopLoc_Location & L);

		/****** BRep_Tool::PolygonOnSurface ******/
		/****** md5 signature: 0df44917fdba720095985a99c6679ef1 ******/
		%feature("compactdefaultargs") PolygonOnSurface;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
F: TopoDS_Face

Return
-------
opencascade::handle<Poly_Polygon2D>

Description
-----------
Returns the polygon associated to the edge in the parametric space of the face. Returns a NULL handle if this polygon does not exist.
") PolygonOnSurface;
		static opencascade::handle<Poly_Polygon2D> PolygonOnSurface(const TopoDS_Edge & E, const TopoDS_Face & F);

		/****** BRep_Tool::PolygonOnSurface ******/
		/****** md5 signature: 425f4961b1c3163ca433c2718b7f10a1 ******/
		%feature("compactdefaultargs") PolygonOnSurface;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
S: Geom_Surface
L: TopLoc_Location

Return
-------
opencascade::handle<Poly_Polygon2D>

Description
-----------
Returns the polygon associated to the edge in the parametric space of the surface. Returns a NULL handle if this polygon does not exist.
") PolygonOnSurface;
		static opencascade::handle<Poly_Polygon2D> PolygonOnSurface(const TopoDS_Edge & E, const opencascade::handle<Geom_Surface> & S, const TopLoc_Location & L);

		/****** BRep_Tool::PolygonOnSurface ******/
		/****** md5 signature: 6b8c2f4b25acb070680e0688d6abbb4c ******/
		%feature("compactdefaultargs") PolygonOnSurface;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
C: Poly_Polygon2D
S: Geom_Surface
L: TopLoc_Location

Return
-------
None

Description
-----------
Returns in <C>, <S>, <L> a 2d curve, a surface and a location for the edge <E>. <C> and <S> are null if the edge has no polygon on surface.
") PolygonOnSurface;
		static void PolygonOnSurface(const TopoDS_Edge & E, opencascade::handle<Poly_Polygon2D> & C, opencascade::handle<Geom_Surface> & S, TopLoc_Location & L);

		/****** BRep_Tool::PolygonOnSurface ******/
		/****** md5 signature: 4df2c84b232daf9288ee42d27cadc4ed ******/
		%feature("compactdefaultargs") PolygonOnSurface;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
C: Poly_Polygon2D
S: Geom_Surface
L: TopLoc_Location
Index: int

Return
-------
None

Description
-----------
Returns in <C>, <S>, <L> the 2d curve, the surface and the location for the edge <E> of rank <Index>. <C> and <S> are null if the index is out of range.
") PolygonOnSurface;
		static void PolygonOnSurface(const TopoDS_Edge & E, opencascade::handle<Poly_Polygon2D> & C, opencascade::handle<Geom_Surface> & S, TopLoc_Location & L, const Standard_Integer Index);

		/****** BRep_Tool::PolygonOnTriangulation ******/
		/****** md5 signature: 1f26c2d3f60238b6104180cbdf9d62fc ******/
		%feature("compactdefaultargs") PolygonOnTriangulation;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
T: Poly_Triangulation
L: TopLoc_Location

Return
-------
opencascade::handle<Poly_PolygonOnTriangulation>

Description
-----------
Returns the polygon associated to the edge in the parametric space of the face. Returns a NULL handle if this polygon does not exist.
") PolygonOnTriangulation;
		static const opencascade::handle<Poly_PolygonOnTriangulation> & PolygonOnTriangulation(const TopoDS_Edge & E, const opencascade::handle<Poly_Triangulation> & T, const TopLoc_Location & L);

		/****** BRep_Tool::PolygonOnTriangulation ******/
		/****** md5 signature: f1dccc0f56c6f5715c5a85be9e491eab ******/
		%feature("compactdefaultargs") PolygonOnTriangulation;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
P: Poly_PolygonOnTriangulation
T: Poly_Triangulation
L: TopLoc_Location

Return
-------
None

Description
-----------
Returns in <P>, <T>, <L> a polygon on triangulation, a triangulation and a location for the edge <E>. <P> and <T> are null if the edge has no polygon on triangulation.
") PolygonOnTriangulation;
		static void PolygonOnTriangulation(const TopoDS_Edge & E, opencascade::handle<Poly_PolygonOnTriangulation> & P, opencascade::handle<Poly_Triangulation> & T, TopLoc_Location & L);

		/****** BRep_Tool::PolygonOnTriangulation ******/
		/****** md5 signature: 8444cc17c9207c4de0356c44279d980f ******/
		%feature("compactdefaultargs") PolygonOnTriangulation;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
P: Poly_PolygonOnTriangulation
T: Poly_Triangulation
L: TopLoc_Location
Index: int

Return
-------
None

Description
-----------
Returns in <P>, <T>, <L> a polygon on triangulation, a triangulation and a location for the edge <E> for the range index. <C> and <S> are null if the edge has no polygon on triangulation.
") PolygonOnTriangulation;
		static void PolygonOnTriangulation(const TopoDS_Edge & E, opencascade::handle<Poly_PolygonOnTriangulation> & P, opencascade::handle<Poly_Triangulation> & T, TopLoc_Location & L, const Standard_Integer Index);

		/****** BRep_Tool::Range ******/
		/****** md5 signature: 452dcf373fd2428c9869849dc564036a ******/
		%feature("compactdefaultargs") Range;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge

Return
-------
First: float
Last: float

Description
-----------
Gets the range of the 3d curve.
") Range;
		static void Range(const TopoDS_Edge & E, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** BRep_Tool::Range ******/
		/****** md5 signature: 771b7c184556dfadb4f144600e6dcd6b ******/
		%feature("compactdefaultargs") Range;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
S: Geom_Surface
L: TopLoc_Location

Return
-------
First: float
Last: float

Description
-----------
Gets the range of the edge on the pcurve on the surface.
") Range;
		static void Range(const TopoDS_Edge & E, const opencascade::handle<Geom_Surface> & S, const TopLoc_Location & L, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** BRep_Tool::Range ******/
		/****** md5 signature: 884c3290ec68254a8384b7c25b18df19 ******/
		%feature("compactdefaultargs") Range;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
F: TopoDS_Face

Return
-------
First: float
Last: float

Description
-----------
Gets the range of the edge on the pcurve on the face.
") Range;
		static void Range(const TopoDS_Edge & E, const TopoDS_Face & F, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** BRep_Tool::SameParameter ******/
		/****** md5 signature: 98c3f7693a7b54bd16cfa7b435716dd7 ******/
		%feature("compactdefaultargs") SameParameter;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge

Return
-------
bool

Description
-----------
Returns the SameParameter flag for the edge.
") SameParameter;
		static Standard_Boolean SameParameter(const TopoDS_Edge & E);

		/****** BRep_Tool::SameRange ******/
		/****** md5 signature: e3ec20a22b9a7152ad26ab214fe505a1 ******/
		%feature("compactdefaultargs") SameRange;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge

Return
-------
bool

Description
-----------
Returns the SameRange flag for the edge.
") SameRange;
		static Standard_Boolean SameRange(const TopoDS_Edge & E);

		/****** BRep_Tool::SetUVPoints ******/
		/****** md5 signature: 673580e1d187fc89706cf9183100d91c ******/
		%feature("compactdefaultargs") SetUVPoints;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
S: Geom_Surface
L: TopLoc_Location
PFirst: gp_Pnt2d
PLast: gp_Pnt2d

Return
-------
None

Description
-----------
Sets the UV locations of the extremities of the edge.
") SetUVPoints;
		static void SetUVPoints(const TopoDS_Edge & E, const opencascade::handle<Geom_Surface> & S, const TopLoc_Location & L, const gp_Pnt2d & PFirst, const gp_Pnt2d & PLast);

		/****** BRep_Tool::SetUVPoints ******/
		/****** md5 signature: 2c4224463481424caa511d48bb2bb170 ******/
		%feature("compactdefaultargs") SetUVPoints;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
F: TopoDS_Face
PFirst: gp_Pnt2d
PLast: gp_Pnt2d

Return
-------
None

Description
-----------
Sets the UV locations of the extremities of the edge.
") SetUVPoints;
		static void SetUVPoints(const TopoDS_Edge & E, const TopoDS_Face & F, const gp_Pnt2d & PFirst, const gp_Pnt2d & PLast);

		/****** BRep_Tool::Surface ******/
		/****** md5 signature: df6db1093e3aea92a533703bc33e1bf1 ******/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face
L: TopLoc_Location

Return
-------
opencascade::handle<Geom_Surface>

Description
-----------
Returns the geometric surface of the face. Returns in <L> the location for the surface.
") Surface;
		static const opencascade::handle<Geom_Surface> & Surface(const TopoDS_Face & F, TopLoc_Location & L);

		/****** BRep_Tool::Surface ******/
		/****** md5 signature: 124bc3370b2c6ae0e621bca8b5f8d5ae ******/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face

Return
-------
opencascade::handle<Geom_Surface>

Description
-----------
Returns the geometric surface of the face. It can be a copy if there is a Location.
") Surface;
		static opencascade::handle<Geom_Surface> Surface(const TopoDS_Face & F);

		/****** BRep_Tool::Tolerance ******/
		/****** md5 signature: 856ae390a9a6947e76374ae65840fa78 ******/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face

Return
-------
float

Description
-----------
Returns the tolerance of the face.
") Tolerance;
		static Standard_Real Tolerance(const TopoDS_Face & F);

		/****** BRep_Tool::Tolerance ******/
		/****** md5 signature: fd914160aaa2a77dd68f63b0d2a1ac5e ******/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge

Return
-------
float

Description
-----------
Returns the tolerance for <E>.
") Tolerance;
		static Standard_Real Tolerance(const TopoDS_Edge & E);

		/****** BRep_Tool::Tolerance ******/
		/****** md5 signature: dfdd613eb3da93aeb47e457dcbb5de3d ******/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "
Parameters
----------
V: TopoDS_Vertex

Return
-------
float

Description
-----------
Returns the tolerance.
") Tolerance;
		static Standard_Real Tolerance(const TopoDS_Vertex & V);

		/****** BRep_Tool::Triangulation ******/
		/****** md5 signature: d68c07d5a1ca2d4b4e577d7fa4cf54e1 ******/
		%feature("compactdefaultargs") Triangulation;
		%feature("autodoc", "
Parameters
----------
theFace: TopoDS_Face
theLocation: TopLoc_Location
theMeshPurpose: Poly_MeshPurpose (optional, default to Poly_MeshPurpose_NONE)

Return
-------
opencascade::handle<Poly_Triangulation>

Description
-----------
Returns the triangulation of the face according to the mesh purpose. 
Input parameter: theFace the input face to find triangulation. @param[out] theLocation the face location. 
Input parameter: theMeshPurpose a mesh purpose to find appropriate triangulation (NONE by default). 
Return: an active triangulation in case of NONE purpose, the first triangulation appropriate for the input purpose, just the first triangulation if none matching other criteria and input purpose is AnyFallback or null handle if there is no any suitable triangulation.
") Triangulation;
		static const opencascade::handle<Poly_Triangulation> & Triangulation(const TopoDS_Face & theFace, TopLoc_Location & theLocation, const Poly_MeshPurpose theMeshPurpose = Poly_MeshPurpose_NONE);

		/****** BRep_Tool::Triangulations ******/
		/****** md5 signature: ac6d632b25937da86177ac5f5087cf51 ******/
		%feature("compactdefaultargs") Triangulations;
		%feature("autodoc", "
Parameters
----------
theFace: TopoDS_Face
theLocation: TopLoc_Location

Return
-------
Poly_ListOfTriangulation

Description
-----------
Returns all triangulations of the face. 
Input parameter: theFace the input face. @param[out] theLocation the face location. 
Return: list of all available face triangulations.
") Triangulations;
		static const Poly_ListOfTriangulation & Triangulations(const TopoDS_Face & theFace, TopLoc_Location & theLocation);

		/****** BRep_Tool::UVPoints ******/
		/****** md5 signature: 739ea64a3ca04f61d1659b66cfc128ff ******/
		%feature("compactdefaultargs") UVPoints;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
S: Geom_Surface
L: TopLoc_Location
PFirst: gp_Pnt2d
PLast: gp_Pnt2d

Return
-------
None

Description
-----------
Gets the UV locations of the extremities of the edge.
") UVPoints;
		static void UVPoints(const TopoDS_Edge & E, const opencascade::handle<Geom_Surface> & S, const TopLoc_Location & L, gp_Pnt2d & PFirst, gp_Pnt2d & PLast);

		/****** BRep_Tool::UVPoints ******/
		/****** md5 signature: 65131528005ae1e7ebb2aaf4488fe3b1 ******/
		%feature("compactdefaultargs") UVPoints;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
F: TopoDS_Face
PFirst: gp_Pnt2d
PLast: gp_Pnt2d

Return
-------
None

Description
-----------
Gets the UV locations of the extremities of the edge.
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
		/****** BRep_CurveOn2Surfaces::BRep_CurveOn2Surfaces ******/
		/****** md5 signature: 1b89b178cf238eb747d177b75dc964eb ******/
		%feature("compactdefaultargs") BRep_CurveOn2Surfaces;
		%feature("autodoc", "
Parameters
----------
S1: Geom_Surface
S2: Geom_Surface
L1: TopLoc_Location
L2: TopLoc_Location
C: GeomAbs_Shape

Return
-------
None

Description
-----------
No available documentation.
") BRep_CurveOn2Surfaces;
		 BRep_CurveOn2Surfaces(const opencascade::handle<Geom_Surface> & S1, const opencascade::handle<Geom_Surface> & S2, const TopLoc_Location & L1, const TopLoc_Location & L2, const GeomAbs_Shape C);

		/****** BRep_CurveOn2Surfaces::Continuity ******/
		/****** md5 signature: 67f71f7e1008e6ff605877f145944f2b ******/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "Return
-------
GeomAbs_Shape

Description
-----------
No available documentation.
") Continuity;
		virtual const GeomAbs_Shape  Continuity();

		/****** BRep_CurveOn2Surfaces::Continuity ******/
		/****** md5 signature: 7efede569c5d15316e14f5232ee3a296 ******/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "
Parameters
----------
C: GeomAbs_Shape

Return
-------
None

Description
-----------
No available documentation.
") Continuity;
		virtual void Continuity(const GeomAbs_Shape C);

		/****** BRep_CurveOn2Surfaces::Copy ******/
		/****** md5 signature: 5ae8a834b37d0441b91b744e5b050c6d ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<BRep_CurveRepresentation>

Description
-----------
Return a copy of this representation.
") Copy;
		opencascade::handle<BRep_CurveRepresentation> Copy();

		/****** BRep_CurveOn2Surfaces::D0 ******/
		/****** md5 signature: c5111ce8ff4abb74b6c4ba34040c62bb ******/
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
Raises an error.
") D0;
		void D0(const Standard_Real U, gp_Pnt & P);


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** BRep_CurveOn2Surfaces::IsRegularity ******/
		/****** md5 signature: fc2d0c9ac93b7bd44a0b1730043df993 ******/
		%feature("compactdefaultargs") IsRegularity;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True.
") IsRegularity;
		virtual Standard_Boolean IsRegularity();

		/****** BRep_CurveOn2Surfaces::IsRegularity ******/
		/****** md5 signature: d342137f91cebeb239140ef772bbae74 ******/
		%feature("compactdefaultargs") IsRegularity;
		%feature("autodoc", "
Parameters
----------
S1: Geom_Surface
S2: Geom_Surface
L1: TopLoc_Location
L2: TopLoc_Location

Return
-------
bool

Description
-----------
A curve on two surfaces (continuity).
") IsRegularity;
		virtual Standard_Boolean IsRegularity(const opencascade::handle<Geom_Surface> & S1, const opencascade::handle<Geom_Surface> & S2, const TopLoc_Location & L1, const TopLoc_Location & L2);

		/****** BRep_CurveOn2Surfaces::Location2 ******/
		/****** md5 signature: 35a20609403ba9e885d7f5ec0a54a126 ******/
		%feature("compactdefaultargs") Location2;
		%feature("autodoc", "Return
-------
TopLoc_Location

Description
-----------
No available documentation.
") Location2;
		virtual const TopLoc_Location & Location2();

		/****** BRep_CurveOn2Surfaces::Surface ******/
		/****** md5 signature: 15e9ea02ca588f3610ae3d0618d607d8 ******/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Surface>

Description
-----------
No available documentation.
") Surface;
		virtual const opencascade::handle<Geom_Surface> & Surface();

		/****** BRep_CurveOn2Surfaces::Surface2 ******/
		/****** md5 signature: 839f1c1ff057d92a50c65c26a6c27dd5 ******/
		%feature("compactdefaultargs") Surface2;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Surface>

Description
-----------
No available documentation.
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
		/****** BRep_GCurve::D0 ******/
		/****** md5 signature: 3375707864bca566a2f8c23866c10a67 ******/
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
Computes the point at parameter U.
") D0;
		virtual void D0(const Standard_Real U, gp_Pnt & P);


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** BRep_GCurve::First ******/
		/****** md5 signature: 009dd98af15e46b2da286731f40e1839 ******/
		%feature("compactdefaultargs") First;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") First;
		Standard_Real First();

		/****** BRep_GCurve::First ******/
		/****** md5 signature: 058d922daacc28980343d7871c7a22e5 ******/
		%feature("compactdefaultargs") First;
		%feature("autodoc", "
Parameters
----------
F: float

Return
-------
None

Description
-----------
No available documentation.
") First;
		void First(const Standard_Real F);

		/****** BRep_GCurve::Last ******/
		/****** md5 signature: 4c8063c237a4f73018a7949da8aef9fb ******/
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") Last;
		Standard_Real Last();

		/****** BRep_GCurve::Last ******/
		/****** md5 signature: c3340e5e5f9f21c952d6c5f41e315294 ******/
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "
Parameters
----------
L: float

Return
-------
None

Description
-----------
No available documentation.
") Last;
		void Last(const Standard_Real L);

		/****** BRep_GCurve::Range ******/
		/****** md5 signature: 7a1384b2dd1c0480bcaa08b2116f0e9a ******/
		%feature("compactdefaultargs") Range;
		%feature("autodoc", "
Parameters
----------

Return
-------
First: float
Last: float

Description
-----------
No available documentation.
") Range;
		void Range(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** BRep_GCurve::SetRange ******/
		/****** md5 signature: 4a19c7b6bd2369f897cb3fd2e6cdf6dd ******/
		%feature("compactdefaultargs") SetRange;
		%feature("autodoc", "
Parameters
----------
First: float
Last: float

Return
-------
None

Description
-----------
No available documentation.
") SetRange;
		void SetRange(const Standard_Real First, const Standard_Real Last);

		/****** BRep_GCurve::Update ******/
		/****** md5 signature: 39b31f53ec35285afdd1d13bf1b04e26 ******/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "Return
-------
None

Description
-----------
Recomputes any derived data after a modification. This is called when the range is modified.
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
		/****** BRep_PointOnCurve::BRep_PointOnCurve ******/
		/****** md5 signature: e833506021dac13fc08babefacd0adc1 ******/
		%feature("compactdefaultargs") BRep_PointOnCurve;
		%feature("autodoc", "
Parameters
----------
P: float
C: Geom_Curve
L: TopLoc_Location

Return
-------
None

Description
-----------
No available documentation.
") BRep_PointOnCurve;
		 BRep_PointOnCurve(const Standard_Real P, const opencascade::handle<Geom_Curve> & C, const TopLoc_Location & L);

		/****** BRep_PointOnCurve::Curve ******/
		/****** md5 signature: 7564dfeb906ea842191d6c8e9aa21fb2 ******/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Curve>

Description
-----------
No available documentation.
") Curve;
		virtual const opencascade::handle<Geom_Curve> & Curve();

		/****** BRep_PointOnCurve::Curve ******/
		/****** md5 signature: 7935cf5261f3f51e5d7edaf832f76e01 ******/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "
Parameters
----------
C: Geom_Curve

Return
-------
None

Description
-----------
No available documentation.
") Curve;
		virtual void Curve(const opencascade::handle<Geom_Curve> & C);


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** BRep_PointOnCurve::IsPointOnCurve ******/
		/****** md5 signature: afd14cc038cef12d5da511ac1ad22904 ******/
		%feature("compactdefaultargs") IsPointOnCurve;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True.
") IsPointOnCurve;
		virtual Standard_Boolean IsPointOnCurve();

		/****** BRep_PointOnCurve::IsPointOnCurve ******/
		/****** md5 signature: 0a0e9cdfd37665e4d43b20820fd84e9b ******/
		%feature("compactdefaultargs") IsPointOnCurve;
		%feature("autodoc", "
Parameters
----------
C: Geom_Curve
L: TopLoc_Location

Return
-------
bool

Description
-----------
No available documentation.
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

        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** BRep_PointsOnSurface::Surface ******/
		/****** md5 signature: 15e9ea02ca588f3610ae3d0618d607d8 ******/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Surface>

Description
-----------
No available documentation.
") Surface;
		virtual const opencascade::handle<Geom_Surface> & Surface();

		/****** BRep_PointsOnSurface::Surface ******/
		/****** md5 signature: 0ec0e10c27c82394399de7b386032405 ******/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "
Parameters
----------
S: Geom_Surface

Return
-------
None

Description
-----------
No available documentation.
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
		/****** BRep_Polygon3D::BRep_Polygon3D ******/
		/****** md5 signature: 13da97d656a6270590ac3f77034b0519 ******/
		%feature("compactdefaultargs") BRep_Polygon3D;
		%feature("autodoc", "
Parameters
----------
P: Poly_Polygon3D
L: TopLoc_Location

Return
-------
None

Description
-----------
No available documentation.
") BRep_Polygon3D;
		 BRep_Polygon3D(const opencascade::handle<Poly_Polygon3D> & P, const TopLoc_Location & L);

		/****** BRep_Polygon3D::Copy ******/
		/****** md5 signature: 5ae8a834b37d0441b91b744e5b050c6d ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<BRep_CurveRepresentation>

Description
-----------
Return a copy of this representation.
") Copy;
		opencascade::handle<BRep_CurveRepresentation> Copy();


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** BRep_Polygon3D::IsPolygon3D ******/
		/****** md5 signature: 9c97e39fb1a5808feb35966ed93c6297 ******/
		%feature("compactdefaultargs") IsPolygon3D;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True.
") IsPolygon3D;
		virtual Standard_Boolean IsPolygon3D();

		/****** BRep_Polygon3D::Polygon3D ******/
		/****** md5 signature: 1090ff267a4843b01559975989b64a28 ******/
		%feature("compactdefaultargs") Polygon3D;
		%feature("autodoc", "Return
-------
opencascade::handle<Poly_Polygon3D>

Description
-----------
No available documentation.
") Polygon3D;
		virtual const opencascade::handle<Poly_Polygon3D> & Polygon3D();

		/****** BRep_Polygon3D::Polygon3D ******/
		/****** md5 signature: 031241be9d7be389029c88d7a07457da ******/
		%feature("compactdefaultargs") Polygon3D;
		%feature("autodoc", "
Parameters
----------
P: Poly_Polygon3D

Return
-------
None

Description
-----------
No available documentation.
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
		/****** BRep_PolygonOnSurface::BRep_PolygonOnSurface ******/
		/****** md5 signature: c1b50f5f4d521e9aa7829b5e90a0286b ******/
		%feature("compactdefaultargs") BRep_PolygonOnSurface;
		%feature("autodoc", "
Parameters
----------
P: Poly_Polygon2D
S: Geom_Surface
L: TopLoc_Location

Return
-------
None

Description
-----------
No available documentation.
") BRep_PolygonOnSurface;
		 BRep_PolygonOnSurface(const opencascade::handle<Poly_Polygon2D> & P, const opencascade::handle<Geom_Surface> & S, const TopLoc_Location & L);

		/****** BRep_PolygonOnSurface::Copy ******/
		/****** md5 signature: 51f97eb612b00599d2d5b762223f64b3 ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<BRep_CurveRepresentation>

Description
-----------
Return a copy of this representation.
") Copy;
		virtual opencascade::handle<BRep_CurveRepresentation> Copy();


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** BRep_PolygonOnSurface::IsPolygonOnSurface ******/
		/****** md5 signature: 395f6d0696758a9ea0fc539532c7bf1c ******/
		%feature("compactdefaultargs") IsPolygonOnSurface;
		%feature("autodoc", "Return
-------
bool

Description
-----------
A 2D polygon representation in the parametric space of a surface.
") IsPolygonOnSurface;
		virtual Standard_Boolean IsPolygonOnSurface();

		/****** BRep_PolygonOnSurface::IsPolygonOnSurface ******/
		/****** md5 signature: c9250f078741a571290c03ae2f08a8fa ******/
		%feature("compactdefaultargs") IsPolygonOnSurface;
		%feature("autodoc", "
Parameters
----------
S: Geom_Surface
L: TopLoc_Location

Return
-------
bool

Description
-----------
A 2D polygon representation in the parametric space of a surface.
") IsPolygonOnSurface;
		virtual Standard_Boolean IsPolygonOnSurface(const opencascade::handle<Geom_Surface> & S, const TopLoc_Location & L);

		/****** BRep_PolygonOnSurface::Polygon ******/
		/****** md5 signature: 4f46d9d28803083bcdcdd10bba734397 ******/
		%feature("compactdefaultargs") Polygon;
		%feature("autodoc", "Return
-------
opencascade::handle<Poly_Polygon2D>

Description
-----------
No available documentation.
") Polygon;
		virtual const opencascade::handle<Poly_Polygon2D> & Polygon();

		/****** BRep_PolygonOnSurface::Polygon ******/
		/****** md5 signature: 14cb08b6625770c2b2a4cecc383369e7 ******/
		%feature("compactdefaultargs") Polygon;
		%feature("autodoc", "
Parameters
----------
P: Poly_Polygon2D

Return
-------
None

Description
-----------
No available documentation.
") Polygon;
		virtual void Polygon(const opencascade::handle<Poly_Polygon2D> & P);

		/****** BRep_PolygonOnSurface::Surface ******/
		/****** md5 signature: 15e9ea02ca588f3610ae3d0618d607d8 ******/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Surface>

Description
-----------
No available documentation.
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
		/****** BRep_PolygonOnTriangulation::BRep_PolygonOnTriangulation ******/
		/****** md5 signature: 483b70ddea0cb2c06f36d731647487b2 ******/
		%feature("compactdefaultargs") BRep_PolygonOnTriangulation;
		%feature("autodoc", "
Parameters
----------
P: Poly_PolygonOnTriangulation
T: Poly_Triangulation
L: TopLoc_Location

Return
-------
None

Description
-----------
No available documentation.
") BRep_PolygonOnTriangulation;
		 BRep_PolygonOnTriangulation(const opencascade::handle<Poly_PolygonOnTriangulation> & P, const opencascade::handle<Poly_Triangulation> & T, const TopLoc_Location & L);

		/****** BRep_PolygonOnTriangulation::Copy ******/
		/****** md5 signature: 51f97eb612b00599d2d5b762223f64b3 ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<BRep_CurveRepresentation>

Description
-----------
Return a copy of this representation.
") Copy;
		virtual opencascade::handle<BRep_CurveRepresentation> Copy();


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** BRep_PolygonOnTriangulation::IsPolygonOnTriangulation ******/
		/****** md5 signature: bc0acafa3cf68973589be66217bfe604 ******/
		%feature("compactdefaultargs") IsPolygonOnTriangulation;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns True.
") IsPolygonOnTriangulation;
		virtual Standard_Boolean IsPolygonOnTriangulation();

		/****** BRep_PolygonOnTriangulation::IsPolygonOnTriangulation ******/
		/****** md5 signature: e6cb71a9982f4593b1d939a57798d3be ******/
		%feature("compactdefaultargs") IsPolygonOnTriangulation;
		%feature("autodoc", "
Parameters
----------
T: Poly_Triangulation
L: TopLoc_Location

Return
-------
bool

Description
-----------
Is it a polygon in the definition of <T> with location <L>.
") IsPolygonOnTriangulation;
		virtual Standard_Boolean IsPolygonOnTriangulation(const opencascade::handle<Poly_Triangulation> & T, const TopLoc_Location & L);

		/****** BRep_PolygonOnTriangulation::PolygonOnTriangulation ******/
		/****** md5 signature: aeb65ee54d25f07c5b13b545be27eb94 ******/
		%feature("compactdefaultargs") PolygonOnTriangulation;
		%feature("autodoc", "
Parameters
----------
P: Poly_PolygonOnTriangulation

Return
-------
None

Description
-----------
returns True.
") PolygonOnTriangulation;
		virtual void PolygonOnTriangulation(const opencascade::handle<Poly_PolygonOnTriangulation> & P);

		/****** BRep_PolygonOnTriangulation::PolygonOnTriangulation ******/
		/****** md5 signature: cb14d47541b37689658847e4d993e5b5 ******/
		%feature("compactdefaultargs") PolygonOnTriangulation;
		%feature("autodoc", "Return
-------
opencascade::handle<Poly_PolygonOnTriangulation>

Description
-----------
No available documentation.
") PolygonOnTriangulation;
		virtual const opencascade::handle<Poly_PolygonOnTriangulation> & PolygonOnTriangulation();

		/****** BRep_PolygonOnTriangulation::Triangulation ******/
		/****** md5 signature: 8f80953fc5ab6ffc304eb150b661d5c2 ******/
		%feature("compactdefaultargs") Triangulation;
		%feature("autodoc", "Return
-------
opencascade::handle<Poly_Triangulation>

Description
-----------
No available documentation.
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
		/****** BRep_Curve3D::BRep_Curve3D ******/
		/****** md5 signature: 6f4db40c99a104c8d4ad18496b868b9e ******/
		%feature("compactdefaultargs") BRep_Curve3D;
		%feature("autodoc", "
Parameters
----------
C: Geom_Curve
L: TopLoc_Location

Return
-------
None

Description
-----------
No available documentation.
") BRep_Curve3D;
		 BRep_Curve3D(const opencascade::handle<Geom_Curve> & C, const TopLoc_Location & L);

		/****** BRep_Curve3D::Copy ******/
		/****** md5 signature: 5ae8a834b37d0441b91b744e5b050c6d ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<BRep_CurveRepresentation>

Description
-----------
Return a copy of this representation.
") Copy;
		opencascade::handle<BRep_CurveRepresentation> Copy();

		/****** BRep_Curve3D::Curve3D ******/
		/****** md5 signature: 4ad19464b6e2a334416af7923e8c568c ******/
		%feature("compactdefaultargs") Curve3D;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Curve>

Description
-----------
No available documentation.
") Curve3D;
		virtual const opencascade::handle<Geom_Curve> & Curve3D();

		/****** BRep_Curve3D::Curve3D ******/
		/****** md5 signature: 9fa24c50aeac5346e9a2f04499dfce3d ******/
		%feature("compactdefaultargs") Curve3D;
		%feature("autodoc", "
Parameters
----------
C: Geom_Curve

Return
-------
None

Description
-----------
No available documentation.
") Curve3D;
		virtual void Curve3D(const opencascade::handle<Geom_Curve> & C);

		/****** BRep_Curve3D::D0 ******/
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
Computes the point at parameter U.
") D0;
		void D0(const Standard_Real U, gp_Pnt & P);


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** BRep_Curve3D::IsCurve3D ******/
		/****** md5 signature: 6f953c114af47442e681e23b67fa28ca ******/
		%feature("compactdefaultargs") IsCurve3D;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True.
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
		/****** BRep_CurveOnSurface::BRep_CurveOnSurface ******/
		/****** md5 signature: 59273eae1970ce9ffdcf78e73cc3d381 ******/
		%feature("compactdefaultargs") BRep_CurveOnSurface;
		%feature("autodoc", "
Parameters
----------
PC: Geom2d_Curve
S: Geom_Surface
L: TopLoc_Location

Return
-------
None

Description
-----------
No available documentation.
") BRep_CurveOnSurface;
		 BRep_CurveOnSurface(const opencascade::handle<Geom2d_Curve> & PC, const opencascade::handle<Geom_Surface> & S, const TopLoc_Location & L);

		/****** BRep_CurveOnSurface::Copy ******/
		/****** md5 signature: 51f97eb612b00599d2d5b762223f64b3 ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<BRep_CurveRepresentation>

Description
-----------
Return a copy of this representation.
") Copy;
		virtual opencascade::handle<BRep_CurveRepresentation> Copy();

		/****** BRep_CurveOnSurface::D0 ******/
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
Computes the point at parameter U.
") D0;
		void D0(const Standard_Real U, gp_Pnt & P);


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** BRep_CurveOnSurface::IsCurveOnSurface ******/
		/****** md5 signature: 210e38c8bb961e7c47fbbde36d037c35 ******/
		%feature("compactdefaultargs") IsCurveOnSurface;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True.
") IsCurveOnSurface;
		virtual Standard_Boolean IsCurveOnSurface();

		/****** BRep_CurveOnSurface::IsCurveOnSurface ******/
		/****** md5 signature: c4de9cee4f5ff1a1acbfc71cdf8caad2 ******/
		%feature("compactdefaultargs") IsCurveOnSurface;
		%feature("autodoc", "
Parameters
----------
S: Geom_Surface
L: TopLoc_Location

Return
-------
bool

Description
-----------
A curve in the parametric space of a surface.
") IsCurveOnSurface;
		virtual Standard_Boolean IsCurveOnSurface(const opencascade::handle<Geom_Surface> & S, const TopLoc_Location & L);

		/****** BRep_CurveOnSurface::PCurve ******/
		/****** md5 signature: 9eebae17493f49c309610142e6619ca8 ******/
		%feature("compactdefaultargs") PCurve;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom2d_Curve>

Description
-----------
No available documentation.
") PCurve;
		virtual const opencascade::handle<Geom2d_Curve> & PCurve();

		/****** BRep_CurveOnSurface::PCurve ******/
		/****** md5 signature: c4807c5709eff8d53531d97e5607b176 ******/
		%feature("compactdefaultargs") PCurve;
		%feature("autodoc", "
Parameters
----------
C: Geom2d_Curve

Return
-------
None

Description
-----------
No available documentation.
") PCurve;
		virtual void PCurve(const opencascade::handle<Geom2d_Curve> & C);

		/****** BRep_CurveOnSurface::SetUVPoints ******/
		/****** md5 signature: 104bbdba35a986d957cf4a721e9b5cc6 ******/
		%feature("compactdefaultargs") SetUVPoints;
		%feature("autodoc", "
Parameters
----------
P1: gp_Pnt2d
P2: gp_Pnt2d

Return
-------
None

Description
-----------
No available documentation.
") SetUVPoints;
		void SetUVPoints(const gp_Pnt2d & P1, const gp_Pnt2d & P2);

		/****** BRep_CurveOnSurface::Surface ******/
		/****** md5 signature: 15e9ea02ca588f3610ae3d0618d607d8 ******/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Surface>

Description
-----------
No available documentation.
") Surface;
		virtual const opencascade::handle<Geom_Surface> & Surface();

		/****** BRep_CurveOnSurface::UVPoints ******/
		/****** md5 signature: cd877f540e3e3c3a8721175d218d5d8b ******/
		%feature("compactdefaultargs") UVPoints;
		%feature("autodoc", "
Parameters
----------
P1: gp_Pnt2d
P2: gp_Pnt2d

Return
-------
None

Description
-----------
No available documentation.
") UVPoints;
		void UVPoints(gp_Pnt2d & P1, gp_Pnt2d & P2);

		/****** BRep_CurveOnSurface::Update ******/
		/****** md5 signature: ee9219b845487d888d5a30df8b526357 ******/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "Return
-------
None

Description
-----------
Recomputes any derived data after a modification. This is called when the range is modified.
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
		/****** BRep_PointOnCurveOnSurface::BRep_PointOnCurveOnSurface ******/
		/****** md5 signature: e93dfc821caf33fd5ca4ee23cbe7e57d ******/
		%feature("compactdefaultargs") BRep_PointOnCurveOnSurface;
		%feature("autodoc", "
Parameters
----------
P: float
C: Geom2d_Curve
S: Geom_Surface
L: TopLoc_Location

Return
-------
None

Description
-----------
No available documentation.
") BRep_PointOnCurveOnSurface;
		 BRep_PointOnCurveOnSurface(const Standard_Real P, const opencascade::handle<Geom2d_Curve> & C, const opencascade::handle<Geom_Surface> & S, const TopLoc_Location & L);


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** BRep_PointOnCurveOnSurface::IsPointOnCurveOnSurface ******/
		/****** md5 signature: 092d698478e6d62f4961b5532d2a7e6a ******/
		%feature("compactdefaultargs") IsPointOnCurveOnSurface;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True.
") IsPointOnCurveOnSurface;
		virtual Standard_Boolean IsPointOnCurveOnSurface();

		/****** BRep_PointOnCurveOnSurface::IsPointOnCurveOnSurface ******/
		/****** md5 signature: 55b5bb312fb131280144e3b9026be1c1 ******/
		%feature("compactdefaultargs") IsPointOnCurveOnSurface;
		%feature("autodoc", "
Parameters
----------
PC: Geom2d_Curve
S: Geom_Surface
L: TopLoc_Location

Return
-------
bool

Description
-----------
No available documentation.
") IsPointOnCurveOnSurface;
		virtual Standard_Boolean IsPointOnCurveOnSurface(const opencascade::handle<Geom2d_Curve> & PC, const opencascade::handle<Geom_Surface> & S, const TopLoc_Location & L);

		/****** BRep_PointOnCurveOnSurface::PCurve ******/
		/****** md5 signature: 9eebae17493f49c309610142e6619ca8 ******/
		%feature("compactdefaultargs") PCurve;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom2d_Curve>

Description
-----------
No available documentation.
") PCurve;
		virtual const opencascade::handle<Geom2d_Curve> & PCurve();

		/****** BRep_PointOnCurveOnSurface::PCurve ******/
		/****** md5 signature: c4807c5709eff8d53531d97e5607b176 ******/
		%feature("compactdefaultargs") PCurve;
		%feature("autodoc", "
Parameters
----------
C: Geom2d_Curve

Return
-------
None

Description
-----------
No available documentation.
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
		/****** BRep_PointOnSurface::BRep_PointOnSurface ******/
		/****** md5 signature: 60272da688749be0222b20d59cb0ac08 ******/
		%feature("compactdefaultargs") BRep_PointOnSurface;
		%feature("autodoc", "
Parameters
----------
P1: float
P2: float
S: Geom_Surface
L: TopLoc_Location

Return
-------
None

Description
-----------
No available documentation.
") BRep_PointOnSurface;
		 BRep_PointOnSurface(const Standard_Real P1, const Standard_Real P2, const opencascade::handle<Geom_Surface> & S, const TopLoc_Location & L);

		/****** BRep_PointOnSurface::IsPointOnSurface ******/
		/****** md5 signature: 44c0910cf7013a21d92b11818dc5b8a3 ******/
		%feature("compactdefaultargs") IsPointOnSurface;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsPointOnSurface;
		virtual Standard_Boolean IsPointOnSurface();

		/****** BRep_PointOnSurface::IsPointOnSurface ******/
		/****** md5 signature: f3ce16cf5210f544c5b5896a8ea5a83a ******/
		%feature("compactdefaultargs") IsPointOnSurface;
		%feature("autodoc", "
Parameters
----------
S: Geom_Surface
L: TopLoc_Location

Return
-------
bool

Description
-----------
No available documentation.
") IsPointOnSurface;
		virtual Standard_Boolean IsPointOnSurface(const opencascade::handle<Geom_Surface> & S, const TopLoc_Location & L);

		/****** BRep_PointOnSurface::Parameter2 ******/
		/****** md5 signature: 4f32a1edb12e9ae972dce28ff068e1f9 ******/
		%feature("compactdefaultargs") Parameter2;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") Parameter2;
		virtual Standard_Real Parameter2();

		/****** BRep_PointOnSurface::Parameter2 ******/
		/****** md5 signature: b708a4a4c1d3b711f897a056c2332b20 ******/
		%feature("compactdefaultargs") Parameter2;
		%feature("autodoc", "
Parameters
----------
P: float

Return
-------
None

Description
-----------
No available documentation.
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
		/****** BRep_PolygonOnClosedSurface::BRep_PolygonOnClosedSurface ******/
		/****** md5 signature: e9ddffbb8250345ed95293e459416abf ******/
		%feature("compactdefaultargs") BRep_PolygonOnClosedSurface;
		%feature("autodoc", "
Parameters
----------
P1: Poly_Polygon2D
P2: Poly_Polygon2D
S: Geom_Surface
L: TopLoc_Location

Return
-------
None

Description
-----------
No available documentation.
") BRep_PolygonOnClosedSurface;
		 BRep_PolygonOnClosedSurface(const opencascade::handle<Poly_Polygon2D> & P1, const opencascade::handle<Poly_Polygon2D> & P2, const opencascade::handle<Geom_Surface> & S, const TopLoc_Location & L);

		/****** BRep_PolygonOnClosedSurface::Copy ******/
		/****** md5 signature: 51f97eb612b00599d2d5b762223f64b3 ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<BRep_CurveRepresentation>

Description
-----------
Return a copy of this representation.
") Copy;
		virtual opencascade::handle<BRep_CurveRepresentation> Copy();


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** BRep_PolygonOnClosedSurface::IsPolygonOnClosedSurface ******/
		/****** md5 signature: 411040a5cb708182d4445a5125b84a85 ******/
		%feature("compactdefaultargs") IsPolygonOnClosedSurface;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns True.
") IsPolygonOnClosedSurface;
		virtual Standard_Boolean IsPolygonOnClosedSurface();

		/****** BRep_PolygonOnClosedSurface::Polygon2 ******/
		/****** md5 signature: c307e8ebb624c2764bfb13d6f321c03f ******/
		%feature("compactdefaultargs") Polygon2;
		%feature("autodoc", "Return
-------
opencascade::handle<Poly_Polygon2D>

Description
-----------
No available documentation.
") Polygon2;
		virtual const opencascade::handle<Poly_Polygon2D> & Polygon2();

		/****** BRep_PolygonOnClosedSurface::Polygon2 ******/
		/****** md5 signature: aa9cd6dbf402bfda961114b161fa8333 ******/
		%feature("compactdefaultargs") Polygon2;
		%feature("autodoc", "
Parameters
----------
P: Poly_Polygon2D

Return
-------
None

Description
-----------
No available documentation.
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
		/****** BRep_PolygonOnClosedTriangulation::BRep_PolygonOnClosedTriangulation ******/
		/****** md5 signature: 9f8d780a4647186d27acb4c47dd6b93e ******/
		%feature("compactdefaultargs") BRep_PolygonOnClosedTriangulation;
		%feature("autodoc", "
Parameters
----------
P1: Poly_PolygonOnTriangulation
P2: Poly_PolygonOnTriangulation
Tr: Poly_Triangulation
L: TopLoc_Location

Return
-------
None

Description
-----------
No available documentation.
") BRep_PolygonOnClosedTriangulation;
		 BRep_PolygonOnClosedTriangulation(const opencascade::handle<Poly_PolygonOnTriangulation> & P1, const opencascade::handle<Poly_PolygonOnTriangulation> & P2, const opencascade::handle<Poly_Triangulation> & Tr, const TopLoc_Location & L);

		/****** BRep_PolygonOnClosedTriangulation::Copy ******/
		/****** md5 signature: 51f97eb612b00599d2d5b762223f64b3 ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<BRep_CurveRepresentation>

Description
-----------
Return a copy of this representation.
") Copy;
		virtual opencascade::handle<BRep_CurveRepresentation> Copy();


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** BRep_PolygonOnClosedTriangulation::IsPolygonOnClosedTriangulation ******/
		/****** md5 signature: 7402c9a74e47f727da04da14988b5819 ******/
		%feature("compactdefaultargs") IsPolygonOnClosedTriangulation;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True.
") IsPolygonOnClosedTriangulation;
		virtual Standard_Boolean IsPolygonOnClosedTriangulation();

		/****** BRep_PolygonOnClosedTriangulation::PolygonOnTriangulation2 ******/
		/****** md5 signature: f6eda594ab3c0f7d7e1508fe7826f971 ******/
		%feature("compactdefaultargs") PolygonOnTriangulation2;
		%feature("autodoc", "
Parameters
----------
P2: Poly_PolygonOnTriangulation

Return
-------
None

Description
-----------
No available documentation.
") PolygonOnTriangulation2;
		virtual void PolygonOnTriangulation2(const opencascade::handle<Poly_PolygonOnTriangulation> & P2);

		/****** BRep_PolygonOnClosedTriangulation::PolygonOnTriangulation2 ******/
		/****** md5 signature: 1a6454953aa9e78b14e72ba9aebf1711 ******/
		%feature("compactdefaultargs") PolygonOnTriangulation2;
		%feature("autodoc", "Return
-------
opencascade::handle<Poly_PolygonOnTriangulation>

Description
-----------
No available documentation.
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
		/****** BRep_CurveOnClosedSurface::BRep_CurveOnClosedSurface ******/
		/****** md5 signature: bd39ef3bd765f2ef4d84c061706a0fa1 ******/
		%feature("compactdefaultargs") BRep_CurveOnClosedSurface;
		%feature("autodoc", "
Parameters
----------
PC1: Geom2d_Curve
PC2: Geom2d_Curve
S: Geom_Surface
L: TopLoc_Location
C: GeomAbs_Shape

Return
-------
None

Description
-----------
No available documentation.
") BRep_CurveOnClosedSurface;
		 BRep_CurveOnClosedSurface(const opencascade::handle<Geom2d_Curve> & PC1, const opencascade::handle<Geom2d_Curve> & PC2, const opencascade::handle<Geom_Surface> & S, const TopLoc_Location & L, const GeomAbs_Shape C);

		/****** BRep_CurveOnClosedSurface::Continuity ******/
		/****** md5 signature: 67f71f7e1008e6ff605877f145944f2b ******/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "Return
-------
GeomAbs_Shape

Description
-----------
No available documentation.
") Continuity;
		virtual const GeomAbs_Shape  Continuity();

		/****** BRep_CurveOnClosedSurface::Continuity ******/
		/****** md5 signature: 7efede569c5d15316e14f5232ee3a296 ******/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "
Parameters
----------
C: GeomAbs_Shape

Return
-------
None

Description
-----------
No available documentation.
") Continuity;
		virtual void Continuity(const GeomAbs_Shape C);

		/****** BRep_CurveOnClosedSurface::Copy ******/
		/****** md5 signature: 51f97eb612b00599d2d5b762223f64b3 ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<BRep_CurveRepresentation>

Description
-----------
Return a copy of this representation.
") Copy;
		virtual opencascade::handle<BRep_CurveRepresentation> Copy();


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** BRep_CurveOnClosedSurface::IsCurveOnClosedSurface ******/
		/****** md5 signature: bec88248a793536f6c3cf9265d01178c ******/
		%feature("compactdefaultargs") IsCurveOnClosedSurface;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True.
") IsCurveOnClosedSurface;
		virtual Standard_Boolean IsCurveOnClosedSurface();

		/****** BRep_CurveOnClosedSurface::IsRegularity ******/
		/****** md5 signature: fc2d0c9ac93b7bd44a0b1730043df993 ******/
		%feature("compactdefaultargs") IsRegularity;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True.
") IsRegularity;
		virtual Standard_Boolean IsRegularity();

		/****** BRep_CurveOnClosedSurface::IsRegularity ******/
		/****** md5 signature: d342137f91cebeb239140ef772bbae74 ******/
		%feature("compactdefaultargs") IsRegularity;
		%feature("autodoc", "
Parameters
----------
S1: Geom_Surface
S2: Geom_Surface
L1: TopLoc_Location
L2: TopLoc_Location

Return
-------
bool

Description
-----------
A curve on two surfaces (continuity).
") IsRegularity;
		virtual Standard_Boolean IsRegularity(const opencascade::handle<Geom_Surface> & S1, const opencascade::handle<Geom_Surface> & S2, const TopLoc_Location & L1, const TopLoc_Location & L2);

		/****** BRep_CurveOnClosedSurface::Location2 ******/
		/****** md5 signature: 35a20609403ba9e885d7f5ec0a54a126 ******/
		%feature("compactdefaultargs") Location2;
		%feature("autodoc", "Return
-------
TopLoc_Location

Description
-----------
Returns Location().
") Location2;
		virtual const TopLoc_Location & Location2();

		/****** BRep_CurveOnClosedSurface::PCurve2 ******/
		/****** md5 signature: 48968d988acdaee69dcf1ac4f2402272 ******/
		%feature("compactdefaultargs") PCurve2;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom2d_Curve>

Description
-----------
No available documentation.
") PCurve2;
		virtual const opencascade::handle<Geom2d_Curve> & PCurve2();

		/****** BRep_CurveOnClosedSurface::PCurve2 ******/
		/****** md5 signature: 303604ea4f669013435b6e0712793764 ******/
		%feature("compactdefaultargs") PCurve2;
		%feature("autodoc", "
Parameters
----------
C: Geom2d_Curve

Return
-------
None

Description
-----------
No available documentation.
") PCurve2;
		virtual void PCurve2(const opencascade::handle<Geom2d_Curve> & C);

		/****** BRep_CurveOnClosedSurface::SetUVPoints2 ******/
		/****** md5 signature: 07669b38a7f71653c011c2f5b054db10 ******/
		%feature("compactdefaultargs") SetUVPoints2;
		%feature("autodoc", "
Parameters
----------
P1: gp_Pnt2d
P2: gp_Pnt2d

Return
-------
None

Description
-----------
No available documentation.
") SetUVPoints2;
		void SetUVPoints2(const gp_Pnt2d & P1, const gp_Pnt2d & P2);

		/****** BRep_CurveOnClosedSurface::Surface2 ******/
		/****** md5 signature: 839f1c1ff057d92a50c65c26a6c27dd5 ******/
		%feature("compactdefaultargs") Surface2;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Surface>

Description
-----------
Returns Surface().
") Surface2;
		virtual const opencascade::handle<Geom_Surface> & Surface2();

		/****** BRep_CurveOnClosedSurface::UVPoints2 ******/
		/****** md5 signature: 3ec595626a689f480a664aa42f0f31ba ******/
		%feature("compactdefaultargs") UVPoints2;
		%feature("autodoc", "
Parameters
----------
P1: gp_Pnt2d
P2: gp_Pnt2d

Return
-------
None

Description
-----------
No available documentation.
") UVPoints2;
		void UVPoints2(gp_Pnt2d & P1, gp_Pnt2d & P2);

		/****** BRep_CurveOnClosedSurface::Update ******/
		/****** md5 signature: ee9219b845487d888d5a30df8b526357 ******/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "Return
-------
None

Description
-----------
Recomputes any derived data after a modification. This is called when the range is modified.
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
/* class aliases */
%pythoncode {
}
/* deprecated methods */
%pythoncode {
@deprecated
def BRep_Tool_Continuity(*args):
	return BRep_Tool.Continuity(*args)

@deprecated
def BRep_Tool_Continuity(*args):
	return BRep_Tool.Continuity(*args)

@deprecated
def BRep_Tool_Curve(*args):
	return BRep_Tool.Curve(*args)

@deprecated
def BRep_Tool_Curve(*args):
	return BRep_Tool.Curve(*args)

@deprecated
def BRep_Tool_CurveOnPlane(*args):
	return BRep_Tool.CurveOnPlane(*args)

@deprecated
def BRep_Tool_CurveOnSurface(*args):
	return BRep_Tool.CurveOnSurface(*args)

@deprecated
def BRep_Tool_CurveOnSurface(*args):
	return BRep_Tool.CurveOnSurface(*args)

@deprecated
def BRep_Tool_CurveOnSurface(*args):
	return BRep_Tool.CurveOnSurface(*args)

@deprecated
def BRep_Tool_CurveOnSurface(*args):
	return BRep_Tool.CurveOnSurface(*args)

@deprecated
def BRep_Tool_Degenerated(*args):
	return BRep_Tool.Degenerated(*args)

@deprecated
def BRep_Tool_HasContinuity(*args):
	return BRep_Tool.HasContinuity(*args)

@deprecated
def BRep_Tool_HasContinuity(*args):
	return BRep_Tool.HasContinuity(*args)

@deprecated
def BRep_Tool_HasContinuity(*args):
	return BRep_Tool.HasContinuity(*args)

@deprecated
def BRep_Tool_IsClosed(*args):
	return BRep_Tool.IsClosed(*args)

@deprecated
def BRep_Tool_IsClosed(*args):
	return BRep_Tool.IsClosed(*args)

@deprecated
def BRep_Tool_IsClosed(*args):
	return BRep_Tool.IsClosed(*args)

@deprecated
def BRep_Tool_IsClosed(*args):
	return BRep_Tool.IsClosed(*args)

@deprecated
def BRep_Tool_IsGeometric(*args):
	return BRep_Tool.IsGeometric(*args)

@deprecated
def BRep_Tool_IsGeometric(*args):
	return BRep_Tool.IsGeometric(*args)

@deprecated
def BRep_Tool_MaxContinuity(*args):
	return BRep_Tool.MaxContinuity(*args)

@deprecated
def BRep_Tool_MaxTolerance(*args):
	return BRep_Tool.MaxTolerance(*args)

@deprecated
def BRep_Tool_NaturalRestriction(*args):
	return BRep_Tool.NaturalRestriction(*args)

@deprecated
def BRep_Tool_Parameter(*args):
	return BRep_Tool.Parameter(*args)

@deprecated
def BRep_Tool_Parameter(*args):
	return BRep_Tool.Parameter(*args)

@deprecated
def BRep_Tool_Parameter(*args):
	return BRep_Tool.Parameter(*args)

@deprecated
def BRep_Tool_Parameter(*args):
	return BRep_Tool.Parameter(*args)

@deprecated
def BRep_Tool_Parameters(*args):
	return BRep_Tool.Parameters(*args)

@deprecated
def BRep_Tool_Pnt(*args):
	return BRep_Tool.Pnt(*args)

@deprecated
def BRep_Tool_Polygon3D(*args):
	return BRep_Tool.Polygon3D(*args)

@deprecated
def BRep_Tool_PolygonOnSurface(*args):
	return BRep_Tool.PolygonOnSurface(*args)

@deprecated
def BRep_Tool_PolygonOnSurface(*args):
	return BRep_Tool.PolygonOnSurface(*args)

@deprecated
def BRep_Tool_PolygonOnSurface(*args):
	return BRep_Tool.PolygonOnSurface(*args)

@deprecated
def BRep_Tool_PolygonOnSurface(*args):
	return BRep_Tool.PolygonOnSurface(*args)

@deprecated
def BRep_Tool_PolygonOnTriangulation(*args):
	return BRep_Tool.PolygonOnTriangulation(*args)

@deprecated
def BRep_Tool_PolygonOnTriangulation(*args):
	return BRep_Tool.PolygonOnTriangulation(*args)

@deprecated
def BRep_Tool_PolygonOnTriangulation(*args):
	return BRep_Tool.PolygonOnTriangulation(*args)

@deprecated
def BRep_Tool_Range(*args):
	return BRep_Tool.Range(*args)

@deprecated
def BRep_Tool_Range(*args):
	return BRep_Tool.Range(*args)

@deprecated
def BRep_Tool_Range(*args):
	return BRep_Tool.Range(*args)

@deprecated
def BRep_Tool_SameParameter(*args):
	return BRep_Tool.SameParameter(*args)

@deprecated
def BRep_Tool_SameRange(*args):
	return BRep_Tool.SameRange(*args)

@deprecated
def BRep_Tool_SetUVPoints(*args):
	return BRep_Tool.SetUVPoints(*args)

@deprecated
def BRep_Tool_SetUVPoints(*args):
	return BRep_Tool.SetUVPoints(*args)

@deprecated
def BRep_Tool_Surface(*args):
	return BRep_Tool.Surface(*args)

@deprecated
def BRep_Tool_Surface(*args):
	return BRep_Tool.Surface(*args)

@deprecated
def BRep_Tool_Tolerance(*args):
	return BRep_Tool.Tolerance(*args)

@deprecated
def BRep_Tool_Tolerance(*args):
	return BRep_Tool.Tolerance(*args)

@deprecated
def BRep_Tool_Tolerance(*args):
	return BRep_Tool.Tolerance(*args)

@deprecated
def BRep_Tool_Triangulation(*args):
	return BRep_Tool.Triangulation(*args)

@deprecated
def BRep_Tool_Triangulations(*args):
	return BRep_Tool.Triangulations(*args)

@deprecated
def BRep_Tool_UVPoints(*args):
	return BRep_Tool.UVPoints(*args)

@deprecated
def BRep_Tool_UVPoints(*args):
	return BRep_Tool.UVPoints(*args)

}
