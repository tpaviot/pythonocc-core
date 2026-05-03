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
%define BREPDOCSTRING
"BRep module, see official documentation at
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_brep.html"
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
		/****** md5 signature: 7b0ba3a797e3277337cb5da1484fc8e1 ******/
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
		void Degenerated(const TopoDS_Edge & E, const bool D);

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
		/****** md5 signature: 72ba054d40219ab4ae69a2af1054a1e5 ******/
		%feature("compactdefaultargs") MakeEdge;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
C: Geom_Curve
Tol: double

Return
-------
None

Description
-----------
Makes an Edge with a curve.
") MakeEdge;
		void MakeEdge(TopoDS_Edge & E, const opencascade::handle<Geom_Curve> & C, const double Tol);

		/****** BRep_Builder::MakeEdge ******/
		/****** md5 signature: eb12c7e8cdf367eddd399db60957953f ******/
		%feature("compactdefaultargs") MakeEdge;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
C: Geom_Curve
L: TopLoc_Location
Tol: double

Return
-------
None

Description
-----------
Makes an Edge with a curve and a location.
") MakeEdge;
		void MakeEdge(TopoDS_Edge & E, const opencascade::handle<Geom_Curve> & C, const TopLoc_Location & L, const double Tol);

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
		/****** md5 signature: ec096ac2176eedc7b47b8a4162bd9ef1 ******/
		%feature("compactdefaultargs") MakeFace;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face
S: Geom_Surface
Tol: double

Return
-------
None

Description
-----------
Makes a Face with a surface.
") MakeFace;
		void MakeFace(TopoDS_Face & F, const opencascade::handle<Geom_Surface> & S, const double Tol);

		/****** BRep_Builder::MakeFace ******/
		/****** md5 signature: 8e82943c145179e19a9c81f2891383ff ******/
		%feature("compactdefaultargs") MakeFace;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face
S: Geom_Surface
L: TopLoc_Location
Tol: double

Return
-------
None

Description
-----------
Makes a Face with a surface and a location.
") MakeFace;
		void MakeFace(TopoDS_Face & F, const opencascade::handle<Geom_Surface> & S, const TopLoc_Location & L, const double Tol);

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
		/****** md5 signature: 317385f3fb973d7fb472476ce936fa6d ******/
		%feature("compactdefaultargs") MakeFace;
		%feature("autodoc", "
Parameters
----------
theFace: TopoDS_Face
theTriangulations: Poly_Triangulation
theActiveTriangulation: Poly_Triangulation (optional, default to opencascade::handle<Poly_Triangulation>())

Return
-------
None

Description
-----------
Makes a Face with a list of triangulations and active one. Use NULL active triangulation to set the first triangulation in list as active. The triangulations is in the same reference system than the TFace.
") MakeFace;
		void MakeFace(TopoDS_Face & theFace, const NCollection_List<opencascade::handle<Poly_Triangulation> > & theTriangulations, const opencascade::handle<Poly_Triangulation> & theActiveTriangulation = opencascade::handle<Poly_Triangulation>());

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
		/****** md5 signature: afb5d60c5767e185d008430386799d2a ******/
		%feature("compactdefaultargs") MakeVertex;
		%feature("autodoc", "
Parameters
----------
V: TopoDS_Vertex
P: gp_Pnt
Tol: double

Return
-------
None

Description
-----------
Makes a vertex from a 3D point.
") MakeVertex;
		void MakeVertex(TopoDS_Vertex & V, const gp_Pnt & P, const double Tol);

		/****** BRep_Builder::NaturalRestriction ******/
		/****** md5 signature: 04187fbf107a0921d3ce106fc2326947 ******/
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
		void NaturalRestriction(const TopoDS_Face & F, const bool N);

		/****** BRep_Builder::Range ******/
		/****** md5 signature: b9773a8b065f30b281f9d62dcaa44a97 ******/
		%feature("compactdefaultargs") Range;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
First: double
Last: double
Only3d: bool (optional, default to false)

Return
-------
None

Description
-----------
Sets the range of the 3d curve if Only3d=True, otherwise sets the range to all the representations.
") Range;
		void Range(const TopoDS_Edge & E, const double First, const double Last, const bool Only3d = false);

		/****** BRep_Builder::Range ******/
		/****** md5 signature: 1a9f21a939ad61a8ee4ef112fa7bbcbd ******/
		%feature("compactdefaultargs") Range;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
S: Geom_Surface
L: TopLoc_Location
First: double
Last: double

Return
-------
None

Description
-----------
Sets the range of the edge on the pcurve on the surface.
") Range;
		void Range(const TopoDS_Edge & E, const opencascade::handle<Geom_Surface> & S, const TopLoc_Location & L, const double First, const double Last);

		/****** BRep_Builder::Range ******/
		/****** md5 signature: 75204cacec21ef1d2957c711716a26d3 ******/
		%feature("compactdefaultargs") Range;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
F: TopoDS_Face
First: double
Last: double

Return
-------
None

Description
-----------
Sets the range of the edge on the pcurve on the face.
") Range;
		void Range(const TopoDS_Edge & E, const TopoDS_Face & F, const double First, const double Last);

		/****** BRep_Builder::SameParameter ******/
		/****** md5 signature: 6fe461076dd3b4aafe55220f5e0bc744 ******/
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
		void SameParameter(const TopoDS_Edge & E, const bool S);

		/****** BRep_Builder::SameRange ******/
		/****** md5 signature: 5120b85f09ed8baccaa7921eaa2034b9 ******/
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
		void SameRange(const TopoDS_Edge & E, const bool S);

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
		/****** md5 signature: 2f955546e0cfcd040011c853efd53926 ******/
		%feature("compactdefaultargs") UpdateEdge;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
C: Geom_Curve
Tol: double

Return
-------
None

Description
-----------
Sets a 3D curve for the edge. If <C> is a null handle, remove any existing 3d curve.
") UpdateEdge;
		void UpdateEdge(const TopoDS_Edge & E, const opencascade::handle<Geom_Curve> & C, const double Tol);

		/****** BRep_Builder::UpdateEdge ******/
		/****** md5 signature: 671d79fd0eaf7c5501f544aae854e189 ******/
		%feature("compactdefaultargs") UpdateEdge;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
C: Geom_Curve
L: TopLoc_Location
Tol: double

Return
-------
None

Description
-----------
Sets a 3D curve for the edge. If <C> is a null handle, remove any existing 3d curve.
") UpdateEdge;
		void UpdateEdge(const TopoDS_Edge & E, const opencascade::handle<Geom_Curve> & C, const TopLoc_Location & L, const double Tol);

		/****** BRep_Builder::UpdateEdge ******/
		/****** md5 signature: d8fed946826d01a89359eb4de5ada590 ******/
		%feature("compactdefaultargs") UpdateEdge;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
C: Geom2d_Curve
F: TopoDS_Face
Tol: double

Return
-------
None

Description
-----------
Sets a pcurve for the edge on the face. If <C> is a null handle, remove any existing pcurve.
") UpdateEdge;
		void UpdateEdge(const TopoDS_Edge & E, const opencascade::handle<Geom2d_Curve> & C, const TopoDS_Face & F, const double Tol);

		/****** BRep_Builder::UpdateEdge ******/
		/****** md5 signature: 1149e4cf129bfae3ab68e552ef4d7ad9 ******/
		%feature("compactdefaultargs") UpdateEdge;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
C1: Geom2d_Curve
C2: Geom2d_Curve
F: TopoDS_Face
Tol: double

Return
-------
None

Description
-----------
Sets pcurves for the edge on the closed face. If <C1> or <C2> is a null handle, remove any existing pcurve.
") UpdateEdge;
		void UpdateEdge(const TopoDS_Edge & E, const opencascade::handle<Geom2d_Curve> & C1, const opencascade::handle<Geom2d_Curve> & C2, const TopoDS_Face & F, const double Tol);

		/****** BRep_Builder::UpdateEdge ******/
		/****** md5 signature: b0f877d32009f622611545b64d3821eb ******/
		%feature("compactdefaultargs") UpdateEdge;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
C: Geom2d_Curve
S: Geom_Surface
L: TopLoc_Location
Tol: double

Return
-------
None

Description
-----------
Sets a pcurve for the edge on the face. If <C> is a null handle, remove any existing pcurve.
") UpdateEdge;
		void UpdateEdge(const TopoDS_Edge & E, const opencascade::handle<Geom2d_Curve> & C, const opencascade::handle<Geom_Surface> & S, const TopLoc_Location & L, const double Tol);

		/****** BRep_Builder::UpdateEdge ******/
		/****** md5 signature: 9f9f47966be66658dde6ea87e19e47ed ******/
		%feature("compactdefaultargs") UpdateEdge;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
C: Geom2d_Curve
S: Geom_Surface
L: TopLoc_Location
Tol: double
Pf: gp_Pnt2d
Pl: gp_Pnt2d

Return
-------
None

Description
-----------
Sets a pcurve for the edge on the face. If <C> is a null handle, remove any existing pcurve. Sets UV bounds for curve repsentation.
") UpdateEdge;
		void UpdateEdge(const TopoDS_Edge & E, const opencascade::handle<Geom2d_Curve> & C, const opencascade::handle<Geom_Surface> & S, const TopLoc_Location & L, const double Tol, const gp_Pnt2d & Pf, const gp_Pnt2d & Pl);

		/****** BRep_Builder::UpdateEdge ******/
		/****** md5 signature: 11be4e2a846639b8718e8fdad37e3f33 ******/
		%feature("compactdefaultargs") UpdateEdge;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
C1: Geom2d_Curve
C2: Geom2d_Curve
S: Geom_Surface
L: TopLoc_Location
Tol: double

Return
-------
None

Description
-----------
Sets pcurves for the edge on the closed surface. <C1> or <C2> is a null handle, remove any existing pcurve.
") UpdateEdge;
		void UpdateEdge(const TopoDS_Edge & E, const opencascade::handle<Geom2d_Curve> & C1, const opencascade::handle<Geom2d_Curve> & C2, const opencascade::handle<Geom_Surface> & S, const TopLoc_Location & L, const double Tol);

		/****** BRep_Builder::UpdateEdge ******/
		/****** md5 signature: 238c533d11cd6542dd83ab2a5b12078b ******/
		%feature("compactdefaultargs") UpdateEdge;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
C1: Geom2d_Curve
C2: Geom2d_Curve
S: Geom_Surface
L: TopLoc_Location
Tol: double
Pf: gp_Pnt2d
Pl: gp_Pnt2d

Return
-------
None

Description
-----------
Sets pcurves for the edge on the closed surface. <C1> or <C2> is a null handle, remove any existing pcurve. Sets UV bounds for curve repsentation.
") UpdateEdge;
		void UpdateEdge(const TopoDS_Edge & E, const opencascade::handle<Geom2d_Curve> & C1, const opencascade::handle<Geom2d_Curve> & C2, const opencascade::handle<Geom_Surface> & S, const TopLoc_Location & L, const double Tol, const gp_Pnt2d & Pf, const gp_Pnt2d & Pl);

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
		/****** md5 signature: 228d3e991dee16b38eb5627cc2cc5e0d ******/
		%feature("compactdefaultargs") UpdateEdge;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
Tol: double

Return
-------
None

Description
-----------
Updates the edge tolerance.
") UpdateEdge;
		void UpdateEdge(const TopoDS_Edge & E, const double Tol);

		/****** BRep_Builder::UpdateFace ******/
		/****** md5 signature: 6b4bed9957cd75f286062f88523d9675 ******/
		%feature("compactdefaultargs") UpdateFace;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face
S: Geom_Surface
L: TopLoc_Location
Tol: double

Return
-------
None

Description
-----------
Updates the face F using the tolerance value Tol, surface S and location Location.
") UpdateFace;
		void UpdateFace(const TopoDS_Face & F, const opencascade::handle<Geom_Surface> & S, const TopLoc_Location & L, const double Tol);

		/****** BRep_Builder::UpdateFace ******/
		/****** md5 signature: 777ae9f58e68d95f213725ef11136ab2 ******/
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
		void UpdateFace(const TopoDS_Face & theFace, const opencascade::handle<Poly_Triangulation> & theTriangulation, const bool theToReset = true);

		/****** BRep_Builder::UpdateFace ******/
		/****** md5 signature: 5e9453b36d888ec434bc58c16e44815a ******/
		%feature("compactdefaultargs") UpdateFace;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face
Tol: double

Return
-------
None

Description
-----------
Updates the face Tolerance.
") UpdateFace;
		void UpdateFace(const TopoDS_Face & F, const double Tol);

		/****** BRep_Builder::UpdateVertex ******/
		/****** md5 signature: ccf91f30a8fe7009f56b147cc2af7c5c ******/
		%feature("compactdefaultargs") UpdateVertex;
		%feature("autodoc", "
Parameters
----------
V: TopoDS_Vertex
P: gp_Pnt
Tol: double

Return
-------
None

Description
-----------
Sets a 3D point on the vertex.
") UpdateVertex;
		void UpdateVertex(const TopoDS_Vertex & V, const gp_Pnt & P, const double Tol);

		/****** BRep_Builder::UpdateVertex ******/
		/****** md5 signature: 1cf15e2d4bcd9d03181c96e9b9fc9179 ******/
		%feature("compactdefaultargs") UpdateVertex;
		%feature("autodoc", "
Parameters
----------
V: TopoDS_Vertex
P: double
E: TopoDS_Edge
Tol: double

Return
-------
None

Description
-----------
Sets the parameter for the vertex on the edge curves.
") UpdateVertex;
		void UpdateVertex(const TopoDS_Vertex & V, const double P, const TopoDS_Edge & E, const double Tol);

		/****** BRep_Builder::UpdateVertex ******/
		/****** md5 signature: 3904aa2d631b71fce0bca9fb55f8dca7 ******/
		%feature("compactdefaultargs") UpdateVertex;
		%feature("autodoc", "
Parameters
----------
V: TopoDS_Vertex
P: double
E: TopoDS_Edge
F: TopoDS_Face
Tol: double

Return
-------
None

Description
-----------
Sets the parameter for the vertex on the edge pcurve on the face.
") UpdateVertex;
		void UpdateVertex(const TopoDS_Vertex & V, const double P, const TopoDS_Edge & E, const TopoDS_Face & F, const double Tol);

		/****** BRep_Builder::UpdateVertex ******/
		/****** md5 signature: a8ef001e4b567cb8238916b71878d9e4 ******/
		%feature("compactdefaultargs") UpdateVertex;
		%feature("autodoc", "
Parameters
----------
V: TopoDS_Vertex
P: double
E: TopoDS_Edge
S: Geom_Surface
L: TopLoc_Location
Tol: double

Return
-------
None

Description
-----------
Sets the parameter for the vertex on the edge pcurve on the surface.
") UpdateVertex;
		void UpdateVertex(const TopoDS_Vertex & V, const double P, const TopoDS_Edge & E, const opencascade::handle<Geom_Surface> & S, const TopLoc_Location & L, const double Tol);

		/****** BRep_Builder::UpdateVertex ******/
		/****** md5 signature: 52c3072857c2ac8c36666b968cced876 ******/
		%feature("compactdefaultargs") UpdateVertex;
		%feature("autodoc", "
Parameters
----------
Ve: TopoDS_Vertex
U: double
V: double
F: TopoDS_Face
Tol: double

Return
-------
None

Description
-----------
Sets the parameters for the vertex on the face.
") UpdateVertex;
		void UpdateVertex(const TopoDS_Vertex & Ve, const double U, const double V, const TopoDS_Face & F, const double Tol);

		/****** BRep_Builder::UpdateVertex ******/
		/****** md5 signature: fcf0e7863365eee770489e7d1452649b ******/
		%feature("compactdefaultargs") UpdateVertex;
		%feature("autodoc", "
Parameters
----------
V: TopoDS_Vertex
Tol: double

Return
-------
None

Description
-----------
Updates the vertex tolerance.
") UpdateVertex;
		void UpdateVertex(const TopoDS_Vertex & V, const double Tol);

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
		/****** md5 signature: e0f42fd021063f46049e8df188961cdc ******/
		%feature("compactdefaultargs") IsCurve3D;
		%feature("autodoc", "Return
-------
bool

Description
-----------
A 3D curve representation.
") IsCurve3D;
		virtual bool IsCurve3D();

		/****** BRep_CurveRepresentation::IsCurveOnClosedSurface ******/
		/****** md5 signature: 8c98534ead06e2a3ca148a235a4b66df ******/
		%feature("compactdefaultargs") IsCurveOnClosedSurface;
		%feature("autodoc", "Return
-------
bool

Description
-----------
A curve with two parametric curves on the same surface.
") IsCurveOnClosedSurface;
		virtual bool IsCurveOnClosedSurface();

		/****** BRep_CurveRepresentation::IsCurveOnSurface ******/
		/****** md5 signature: 5eb32ca622412097f6844e300a75ef85 ******/
		%feature("compactdefaultargs") IsCurveOnSurface;
		%feature("autodoc", "Return
-------
bool

Description
-----------
A curve in the parametric space of a surface.
") IsCurveOnSurface;
		virtual bool IsCurveOnSurface();

		/****** BRep_CurveRepresentation::IsCurveOnSurface ******/
		/****** md5 signature: 2ab49008881eaea1b8c59607a07f94bd ******/
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
		virtual bool IsCurveOnSurface(const opencascade::handle<Geom_Surface> & S, const TopLoc_Location & L);

		/****** BRep_CurveRepresentation::IsPolygon3D ******/
		/****** md5 signature: 6b02e5e5e21bb428f1431b4caf6d1912 ******/
		%feature("compactdefaultargs") IsPolygon3D;
		%feature("autodoc", "Return
-------
bool

Description
-----------
A 3D polygon representation.
") IsPolygon3D;
		virtual bool IsPolygon3D();

		/****** BRep_CurveRepresentation::IsPolygonOnClosedSurface ******/
		/****** md5 signature: 4f99adb646b4cdd7c51b5c5f7c6ab2e5 ******/
		%feature("compactdefaultargs") IsPolygonOnClosedSurface;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Two 2D polygon representations in the parametric space of a surface.
") IsPolygonOnClosedSurface;
		virtual bool IsPolygonOnClosedSurface();

		/****** BRep_CurveRepresentation::IsPolygonOnClosedTriangulation ******/
		/****** md5 signature: 0b77a12fd70c3477f64befd46a777bcd ******/
		%feature("compactdefaultargs") IsPolygonOnClosedTriangulation;
		%feature("autodoc", "Return
-------
bool

Description
-----------
A representation by two arrays of nodes on a triangulation.
") IsPolygonOnClosedTriangulation;
		virtual bool IsPolygonOnClosedTriangulation();

		/****** BRep_CurveRepresentation::IsPolygonOnSurface ******/
		/****** md5 signature: eed3d3f897c948af663bcbb6797b8459 ******/
		%feature("compactdefaultargs") IsPolygonOnSurface;
		%feature("autodoc", "Return
-------
bool

Description
-----------
A polygon in the parametric space of a surface.
") IsPolygonOnSurface;
		virtual bool IsPolygonOnSurface();

		/****** BRep_CurveRepresentation::IsPolygonOnSurface ******/
		/****** md5 signature: f8a5e59efc54aa364deda55c3fcead49 ******/
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
		virtual bool IsPolygonOnSurface(const opencascade::handle<Geom_Surface> & S, const TopLoc_Location & L);

		/****** BRep_CurveRepresentation::IsPolygonOnTriangulation ******/
		/****** md5 signature: 4b85de0fda0957fe6e82a8b1a8ce3392 ******/
		%feature("compactdefaultargs") IsPolygonOnTriangulation;
		%feature("autodoc", "Return
-------
bool

Description
-----------
A representation by an array of nodes on a triangulation.
") IsPolygonOnTriangulation;
		virtual bool IsPolygonOnTriangulation();

		/****** BRep_CurveRepresentation::IsPolygonOnTriangulation ******/
		/****** md5 signature: fafcfc5ae7e26e01ef0c6b165be87b32 ******/
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
		virtual bool IsPolygonOnTriangulation(const opencascade::handle<Poly_Triangulation> & T, const TopLoc_Location & L);

		/****** BRep_CurveRepresentation::IsRegularity ******/
		/****** md5 signature: 8ddb0e930061f238611e0578f7f18825 ******/
		%feature("compactdefaultargs") IsRegularity;
		%feature("autodoc", "Return
-------
bool

Description
-----------
A continuity between two surfaces.
") IsRegularity;
		virtual bool IsRegularity();

		/****** BRep_CurveRepresentation::IsRegularity ******/
		/****** md5 signature: 1fa41be432c04cc83e15cbbe89902351 ******/
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
		virtual bool IsRegularity(const opencascade::handle<Geom_Surface> & S1, const opencascade::handle<Geom_Surface> & S2, const TopLoc_Location & L1, const TopLoc_Location & L2);

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
		/****** md5 signature: 91cccc05c7f4a5b1c790fc9d2466d67c ******/
		%feature("compactdefaultargs") IsPointOnCurve;
		%feature("autodoc", "Return
-------
bool

Description
-----------
A point on a 3d curve.
") IsPointOnCurve;
		virtual bool IsPointOnCurve();

		/****** BRep_PointRepresentation::IsPointOnCurve ******/
		/****** md5 signature: 3d6612d4b69be9cc68206df38ace8f5d ******/
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
		virtual bool IsPointOnCurve(const opencascade::handle<Geom_Curve> & C, const TopLoc_Location & L);

		/****** BRep_PointRepresentation::IsPointOnCurveOnSurface ******/
		/****** md5 signature: 429c2ff0e5d347a94e70e87600fd43e3 ******/
		%feature("compactdefaultargs") IsPointOnCurveOnSurface;
		%feature("autodoc", "Return
-------
bool

Description
-----------
A point on a 2d curve on a surface.
") IsPointOnCurveOnSurface;
		virtual bool IsPointOnCurveOnSurface();

		/****** BRep_PointRepresentation::IsPointOnCurveOnSurface ******/
		/****** md5 signature: 471d1048ad33ab40e97de6a151543c56 ******/
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
		virtual bool IsPointOnCurveOnSurface(const opencascade::handle<Geom2d_Curve> & PC, const opencascade::handle<Geom_Surface> & S, const TopLoc_Location & L);

		/****** BRep_PointRepresentation::IsPointOnSurface ******/
		/****** md5 signature: 7f4f7473d296bb1bc1e9c35ba21437e6 ******/
		%feature("compactdefaultargs") IsPointOnSurface;
		%feature("autodoc", "Return
-------
bool

Description
-----------
A point on a surface.
") IsPointOnSurface;
		virtual bool IsPointOnSurface();

		/****** BRep_PointRepresentation::IsPointOnSurface ******/
		/****** md5 signature: 255ca0aebae4011c18bd39be9dd8c37e ******/
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
		virtual bool IsPointOnSurface(const opencascade::handle<Geom_Surface> & S, const TopLoc_Location & L);

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
		/****** md5 signature: 28e42519a120bf741c23eca7aaca5525 ******/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") Parameter;
		double Parameter();

		/****** BRep_PointRepresentation::Parameter ******/
		/****** md5 signature: bd5fcf434c6f44bcf7a174a8658fcc12 ******/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "
Parameters
----------
P: double

Return
-------
None

Description
-----------
No available documentation.
") Parameter;
		void Parameter(const double P);

		/****** BRep_PointRepresentation::Parameter2 ******/
		/****** md5 signature: 432751a118c2496572e4f85326f63f54 ******/
		%feature("compactdefaultargs") Parameter2;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") Parameter2;
		virtual double Parameter2();

		/****** BRep_PointRepresentation::Parameter2 ******/
		/****** md5 signature: b8fde9f74718489e310d5c320dde61aa ******/
		%feature("compactdefaultargs") Parameter2;
		%feature("autodoc", "
Parameters
----------
P: double

Return
-------
None

Description
-----------
No available documentation.
") Parameter2;
		virtual void Parameter2(const double P);

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
		/****** md5 signature: e7c81265ef15459b47c22d0dbf86b685 ******/
		%feature("compactdefaultargs") ChangeCurves;
		%feature("autodoc", "Return
-------
NCollection_List<opencascade::handle<BRep_CurveRepresentation>>

Description
-----------
No available documentation.
") ChangeCurves;
		NCollection_List<opencascade::handle<BRep_CurveRepresentation>> & ChangeCurves();

		/****** BRep_TEdge::Curves ******/
		/****** md5 signature: 90c2bd8c5072fe6a040ad0cf47b2c009 ******/
		%feature("compactdefaultargs") Curves;
		%feature("autodoc", "Return
-------
NCollection_List<opencascade::handle<BRep_CurveRepresentation>>

Description
-----------
No available documentation.
") Curves;
		const NCollection_List<opencascade::handle<BRep_CurveRepresentation>> & Curves();

		/****** BRep_TEdge::Degenerated ******/
		/****** md5 signature: d0771b019acf30abb189c10d9c2b211f ******/
		%feature("compactdefaultargs") Degenerated;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") Degenerated;
		bool Degenerated();

		/****** BRep_TEdge::Degenerated ******/
		/****** md5 signature: fd356bcb31b2e5325f7ba6ebf2ac5b8a ******/
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
		void Degenerated(const bool S);


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
		/****** md5 signature: 4efe27e8f9e1b2193e247b39035abef8 ******/
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
		/****** md5 signature: 7d573ad605574a7eea7fe27487c18961 ******/
		%feature("compactdefaultargs") SameParameter;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") SameParameter;
		bool SameParameter();

		/****** BRep_TEdge::SameParameter ******/
		/****** md5 signature: e866dc49de9800fea5d3f6c1bd84382c ******/
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
		void SameParameter(const bool S);

		/****** BRep_TEdge::SameRange ******/
		/****** md5 signature: 8e5074cd5ad0de39fa2d1237be5b321c ******/
		%feature("compactdefaultargs") SameRange;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") SameRange;
		bool SameRange();

		/****** BRep_TEdge::SameRange ******/
		/****** md5 signature: 60f921b9bc5d3544704422e5588414be ******/
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
		void SameRange(const bool S);

		/****** BRep_TEdge::Tolerance ******/
		/****** md5 signature: a95a606eeb289469358ac00a6b44ad86 ******/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") Tolerance;
		double Tolerance();

		/****** BRep_TEdge::Tolerance ******/
		/****** md5 signature: eaa3ea34aa8053c3c82cd9c5e0f72895 ******/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "
Parameters
----------
T: double

Return
-------
None

Description
-----------
No available documentation.
") Tolerance;
		void Tolerance(const double T);

		/****** BRep_TEdge::UpdateTolerance ******/
		/****** md5 signature: fa7d64cc7d815f68a4b18523f11d8e1a ******/
		%feature("compactdefaultargs") UpdateTolerance;
		%feature("autodoc", "
Parameters
----------
T: double

Return
-------
None

Description
-----------
Sets the tolerance to the max of <T> and the current tolerance.
") UpdateTolerance;
		void UpdateTolerance(const double T);

};


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
		/****** md5 signature: 4efe27e8f9e1b2193e247b39035abef8 ******/
		%feature("compactdefaultargs") EmptyCopy;
		%feature("autodoc", "Return
-------
opencascade::handle<TopoDS_TShape>

Description
-----------
Returns a copy of the TShape with no sub-shapes. The new Face has no triangulation.
") EmptyCopy;
		opencascade::handle<TopoDS_TShape> EmptyCopy();

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
		/****** md5 signature: 67a32a564bd7628d181cc76a3d1d6bac ******/
		%feature("compactdefaultargs") NaturalRestriction;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the boundary of this face is known to be the parametric space (Umin, UMax, VMin, VMax).
") NaturalRestriction;
		bool NaturalRestriction();

		/****** BRep_TFace::NaturalRestriction ******/
		/****** md5 signature: 2665b72a647de399d4fec031a215f51f ******/
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
		void NaturalRestriction(const bool theRestriction);

		/****** BRep_TFace::NbTriangulations ******/
		/****** md5 signature: 679597684d9b70a2adc10b0c9ed8f23a ******/
		%feature("compactdefaultargs") NbTriangulations;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns number of available face triangulations.
") NbTriangulations;
		int NbTriangulations();

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
		/****** md5 signature: 0f371f25723fe3719d8c637d644b341d ******/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the face tolerance.
") Tolerance;
		double Tolerance();

		/****** BRep_TFace::Tolerance ******/
		/****** md5 signature: aab4178c48b0397b48311514691176b8 ******/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "
Parameters
----------
theTolerance: double

Return
-------
None

Description
-----------
Sets the tolerance for this face.
") Tolerance;
		void Tolerance(const double theTolerance);

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
		/****** md5 signature: e1c7ee60d85629b64b17dce7eed33049 ******/
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
		void Triangulation(const opencascade::handle<Poly_Triangulation> & theTriangulation, const bool theToReset = true);

		/****** BRep_TFace::Triangulations ******/
		/****** md5 signature: 9dd26dda9be48d5596c30f2c08e5a3a7 ******/
		%feature("compactdefaultargs") Triangulations;
		%feature("autodoc", "Return
-------
NCollection_List<opencascade::handle<Poly_Triangulation>>

Description
-----------
Returns the list of available face triangulations.
") Triangulations;
		const NCollection_List<opencascade::handle<Poly_Triangulation>> & Triangulations();

		/****** BRep_TFace::Triangulations ******/
		/****** md5 signature: a10b4aba0181a7bd3fa7f8b7f6856212 ******/
		%feature("compactdefaultargs") Triangulations;
		%feature("autodoc", "
Parameters
----------
theTriangulations: Poly_Triangulation
theActiveTriangulation: Poly_Triangulation

Return
-------
None

Description
-----------
Sets input list of triangulations and currently active triangulation for this face. If list is empty internal list of triangulations will be cleared and active triangulation will be nullified. Else this list will be saved and the input active triangulation be saved as active. Use NULL active triangulation to set the first triangulation in list as active. Note: the method throws exception if there is any NULL triangulation in input list or if this list doesn't contain input active triangulation.
") Triangulations;
		void Triangulations(const NCollection_List<opencascade::handle<Poly_Triangulation> > & theTriangulations, const opencascade::handle<Poly_Triangulation> & theActiveTriangulation);

};


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
		/****** md5 signature: efa68fa421958b630b091451278ac77e ******/
		%feature("compactdefaultargs") ChangePoints;
		%feature("autodoc", "Return
-------
NCollection_List<opencascade::handle<BRep_PointRepresentation>>

Description
-----------
No available documentation.
") ChangePoints;
		NCollection_List<opencascade::handle<BRep_PointRepresentation>> & ChangePoints();


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
		/****** md5 signature: 4efe27e8f9e1b2193e247b39035abef8 ******/
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
		/****** md5 signature: 2607ea33f5db0d4130048ea3cb337595 ******/
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "Return
-------
NCollection_List<opencascade::handle<BRep_PointRepresentation>>

Description
-----------
No available documentation.
") Points;
		const NCollection_List<opencascade::handle<BRep_PointRepresentation>> & Points();

		/****** BRep_TVertex::Tolerance ******/
		/****** md5 signature: a95a606eeb289469358ac00a6b44ad86 ******/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") Tolerance;
		double Tolerance();

		/****** BRep_TVertex::Tolerance ******/
		/****** md5 signature: eaa3ea34aa8053c3c82cd9c5e0f72895 ******/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "
Parameters
----------
T: double

Return
-------
None

Description
-----------
No available documentation.
") Tolerance;
		void Tolerance(const double T);

		/****** BRep_TVertex::UpdateTolerance ******/
		/****** md5 signature: fa7d64cc7d815f68a4b18523f11d8e1a ******/
		%feature("compactdefaultargs") UpdateTolerance;
		%feature("autodoc", "
Parameters
----------
T: double

Return
-------
None

Description
-----------
Sets the tolerance to the max of <T> and the current tolerance.
") UpdateTolerance;
		void UpdateTolerance(const double T);

};


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
		/****** md5 signature: 1abd292ac4fb01119938fe056c6c4bb5 ******/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
L: TopLoc_Location

Return
-------
First: double
Last: double

Description
-----------
Returns the 3D curve of the edge. May be a Null handle. Returns in <L> the location for the curve. In <First> and <Last> the parameter range.
") Curve;
		static const opencascade::handle<Geom_Curve> & Curve(const TopoDS_Edge & E, TopLoc_Location & L, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** BRep_Tool::Curve ******/
		/****** md5 signature: 1375e789b56a1337646359a803edb149 ******/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge

Return
-------
First: double
Last: double

Description
-----------
Returns the 3D curve of the edge. May be a Null handle. In <First> and <Last> the parameter range. It can be a copy if there is a Location.
") Curve;
		static opencascade::handle<Geom_Curve> Curve(const TopoDS_Edge & E, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** BRep_Tool::CurveOnPlane ******/
		/****** md5 signature: 31763c69b0b7b86c7050271977c0a58d ******/
		%feature("compactdefaultargs") CurveOnPlane;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
S: Geom_Surface
L: TopLoc_Location

Return
-------
First: double
Last: double

Description
-----------
For the planar surface builds the 2d curve for the edge by projection of the edge on plane. Returns a NULL handle if the surface is not planar or the projection failed.
") CurveOnPlane;
		static opencascade::handle<Geom2d_Curve> CurveOnPlane(const TopoDS_Edge & E, const opencascade::handle<Geom_Surface> & S, const TopLoc_Location & L, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** BRep_Tool::CurveOnSurface ******/
		/****** md5 signature: 644e14868b8a1db107de4b234febd0d7 ******/
		%feature("compactdefaultargs") CurveOnSurface;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
F: TopoDS_Face
theIsStored: bool * (optional, default to nullptr)

Return
-------
First: double
Last: double

Description
-----------
Returns the curve associated to the edge in the parametric space of the face. Returns a NULL handle if this curve does not exist. Returns in <First> and <Last> the parameter range. If the surface is a plane the curve can be not stored but created a new each time. The flag pointed by <theIsStored> serves to indicate storage status. It is valued if the pointer is non-null.
") CurveOnSurface;
		static opencascade::handle<Geom2d_Curve> CurveOnSurface(const TopoDS_Edge & E, const TopoDS_Face & F, Standard_Real &OutValue, Standard_Real &OutValue, bool * theIsStored = nullptr);

		/****** BRep_Tool::CurveOnSurface ******/
		/****** md5 signature: a87d13695ac0e17186c95298893466af ******/
		%feature("compactdefaultargs") CurveOnSurface;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
S: Geom_Surface
L: TopLoc_Location
theIsStored: bool * (optional, default to nullptr)

Return
-------
First: double
Last: double

Description
-----------
Returns the curve associated to the edge in the parametric space of the surface. Returns a NULL handle if this curve does not exist. Returns in <First> and <Last> the parameter range. If the surface is a plane the curve can be not stored but created a new each time. The flag pointed by <theIsStored> serves to indicate storage status. It is valued if the pointer is non-null.
") CurveOnSurface;
		static opencascade::handle<Geom2d_Curve> CurveOnSurface(const TopoDS_Edge & E, const opencascade::handle<Geom_Surface> & S, const TopLoc_Location & L, Standard_Real &OutValue, Standard_Real &OutValue, bool * theIsStored = nullptr);

		/****** BRep_Tool::CurveOnSurface ******/
		/****** md5 signature: 170989feda2030a519de0e7a54228661 ******/
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
First: double
Last: double

Description
-----------
Returns in <C>, <S>, <L> a 2d curve, a surface and a location for the edge <E>. <C> and <S> are null if the edge has no curve on surface. Returns in <First> and <Last> the parameter range.
") CurveOnSurface;
		static void CurveOnSurface(const TopoDS_Edge & E, opencascade::handle<Geom2d_Curve> & C, opencascade::handle<Geom_Surface> & S, TopLoc_Location & L, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** BRep_Tool::CurveOnSurface ******/
		/****** md5 signature: d4c58b3f63cdc0286b2b87f76327d6bf ******/
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
First: double
Last: double

Description
-----------
Returns in <C>, <S>, <L> the 2d curve, the surface and the location for the edge <E> of rank <Index>. <C> and <S> are null if the index is out of range. Returns in <First> and <Last> the parameter range.
") CurveOnSurface;
		static void CurveOnSurface(const TopoDS_Edge & E, opencascade::handle<Geom2d_Curve> & C, opencascade::handle<Geom_Surface> & S, TopLoc_Location & L, Standard_Real &OutValue, Standard_Real &OutValue, const int Index);

		/****** BRep_Tool::Degenerated ******/
		/****** md5 signature: 7d507a0b5a66315454c56eb44c0635e2 ******/
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
		static bool Degenerated(const TopoDS_Edge & E);

		/****** BRep_Tool::HasContinuity ******/
		/****** md5 signature: becf400094dfcd3dcb0eae6429aba082 ******/
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
		static bool HasContinuity(const TopoDS_Edge & E, const TopoDS_Face & F1, const TopoDS_Face & F2);

		/****** BRep_Tool::HasContinuity ******/
		/****** md5 signature: e6c67172e9e5bf4957dcc621524d7c76 ******/
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
		static bool HasContinuity(const TopoDS_Edge & E, const opencascade::handle<Geom_Surface> & S1, const opencascade::handle<Geom_Surface> & S2, const TopLoc_Location & L1, const TopLoc_Location & L2);

		/****** BRep_Tool::HasContinuity ******/
		/****** md5 signature: 3ea330a27c891fb1577d56c6e50eb61b ******/
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
		static bool HasContinuity(const TopoDS_Edge & E);

		/****** BRep_Tool::IsClosed ******/
		/****** md5 signature: 96d2104b08e5df0fae3798c5b5fcc72f ******/
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
		static bool IsClosed(const TopoDS_Shape & S);

		/****** BRep_Tool::IsClosed ******/
		/****** md5 signature: 0959b36ccd612c95ed6c1e4ac187b564 ******/
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
		static bool IsClosed(const TopoDS_Edge & E, const TopoDS_Face & F);

		/****** BRep_Tool::IsClosed ******/
		/****** md5 signature: f728305f430cb2a64d8c3302018899f6 ******/
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
		static bool IsClosed(const TopoDS_Edge & E, const opencascade::handle<Geom_Surface> & S, const TopLoc_Location & L);

		/****** BRep_Tool::IsClosed ******/
		/****** md5 signature: d10d7ffdd9bb5186c8899d5b7fb63542 ******/
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
		static bool IsClosed(const TopoDS_Edge & E, const opencascade::handle<Poly_Triangulation> & T, const TopLoc_Location & L);

		/****** BRep_Tool::IsGeometric ******/
		/****** md5 signature: e946caa4c6da68ba9e7a39686585ea0e ******/
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
		static bool IsGeometric(const TopoDS_Face & F);

		/****** BRep_Tool::IsGeometric ******/
		/****** md5 signature: cc170ed9dc816293f704bc21aa10bf74 ******/
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
		static bool IsGeometric(const TopoDS_Edge & E);

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
Returns the max continuity of edge between some surfaces or GeomAbs_C0 if there are no such surfaces.
") MaxContinuity;
		static GeomAbs_Shape MaxContinuity(const TopoDS_Edge & theEdge);

		/****** BRep_Tool::MaxTolerance ******/
		/****** md5 signature: 1d6773576652972c735aa566ec907bb5 ******/
		%feature("compactdefaultargs") MaxTolerance;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape
theSubShape: TopAbs_ShapeEnum

Return
-------
double

Description
-----------
Returns the maximum tolerance of input shape subshapes.
") MaxTolerance;
		static double MaxTolerance(const TopoDS_Shape & theShape, const TopAbs_ShapeEnum theSubShape);

		/****** BRep_Tool::NaturalRestriction ******/
		/****** md5 signature: 6835023e0e10ddb90f526ebb4337aca7 ******/
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
		static bool NaturalRestriction(const TopoDS_Face & F);

		/****** BRep_Tool::Parameter ******/
		/****** md5 signature: 7be20514d1888d48e7f71f8f2bd0336a ******/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "
Parameters
----------
theV: TopoDS_Vertex
theE: TopoDS_Edge

Return
-------
theParam: double

Description
-----------
Finds the parameter of <theV> on <theE>. 
Input parameter: theV input vertex 
Input parameter: theE input edge @param[out] theParam calculated parameter on the curve 
Return: True if done.
") Parameter;
		static bool Parameter(const TopoDS_Vertex & theV, const TopoDS_Edge & theE, Standard_Real &OutValue);

		/****** BRep_Tool::Parameter ******/
		/****** md5 signature: d547460699c7f1664cf13d9fdecfbda8 ******/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "
Parameters
----------
V: TopoDS_Vertex
E: TopoDS_Edge

Return
-------
double

Description
-----------
Returns the parameter of <V> on <E>. Throws Standard_NoSuchObject if no parameter on edge.
") Parameter;
		static double Parameter(const TopoDS_Vertex & V, const TopoDS_Edge & E);

		/****** BRep_Tool::Parameter ******/
		/****** md5 signature: bf904406a5da06159afa29002e9dbfdd ******/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "
Parameters
----------
V: TopoDS_Vertex
E: TopoDS_Edge
F: TopoDS_Face

Return
-------
double

Description
-----------
Returns the parameters of the vertex on the pcurve of the edge on the face.
") Parameter;
		static double Parameter(const TopoDS_Vertex & V, const TopoDS_Edge & E, const TopoDS_Face & F);

		/****** BRep_Tool::Parameter ******/
		/****** md5 signature: ac38cf6a7d235aa5a957fad5c2503018 ******/
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
double

Description
-----------
Returns the parameters of the vertex on the pcurve of the edge on the surface.
") Parameter;
		static double Parameter(const TopoDS_Vertex & V, const TopoDS_Edge & E, const opencascade::handle<Geom_Surface> & S, const TopLoc_Location & L);

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
		/****** md5 signature: 17d93eb7db3cd53e8ccbeebda08e1d7c ******/
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
		static void PolygonOnSurface(const TopoDS_Edge & E, opencascade::handle<Poly_Polygon2D> & C, opencascade::handle<Geom_Surface> & S, TopLoc_Location & L, const int Index);

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
		/****** md5 signature: f320b808ad931cae2e548af2ddc56f8b ******/
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
		static void PolygonOnTriangulation(const TopoDS_Edge & E, opencascade::handle<Poly_PolygonOnTriangulation> & P, opencascade::handle<Poly_Triangulation> & T, TopLoc_Location & L, const int Index);

		/****** BRep_Tool::Range ******/
		/****** md5 signature: de52bcc1571249d09da9bb798a03e98d ******/
		%feature("compactdefaultargs") Range;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge

Return
-------
First: double
Last: double

Description
-----------
Gets the range of the 3d curve.
") Range;
		static void Range(const TopoDS_Edge & E, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** BRep_Tool::Range ******/
		/****** md5 signature: d29f03083d1b99c96ecdb21e808fd919 ******/
		%feature("compactdefaultargs") Range;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
S: Geom_Surface
L: TopLoc_Location

Return
-------
First: double
Last: double

Description
-----------
Gets the range of the edge on the pcurve on the surface.
") Range;
		static void Range(const TopoDS_Edge & E, const opencascade::handle<Geom_Surface> & S, const TopLoc_Location & L, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** BRep_Tool::Range ******/
		/****** md5 signature: 6c0cc1f6ef69228989084ce6834f2e24 ******/
		%feature("compactdefaultargs") Range;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
F: TopoDS_Face

Return
-------
First: double
Last: double

Description
-----------
Gets the range of the edge on the pcurve on the face.
") Range;
		static void Range(const TopoDS_Edge & E, const TopoDS_Face & F, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** BRep_Tool::SameParameter ******/
		/****** md5 signature: c4ec5f77f8c69a04e55c420f3a9244c7 ******/
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
		static bool SameParameter(const TopoDS_Edge & E);

		/****** BRep_Tool::SameRange ******/
		/****** md5 signature: 2ffef88cf02781e1472f862268a040f2 ******/
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
		static bool SameRange(const TopoDS_Edge & E);

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
		/****** md5 signature: 06d7c3ae8122264d460335cd80ba5424 ******/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face

Return
-------
double

Description
-----------
Returns the tolerance of the face.
") Tolerance;
		static double Tolerance(const TopoDS_Face & F);

		/****** BRep_Tool::Tolerance ******/
		/****** md5 signature: b5c79bf8b87af97a568ca2ee4933aa8e ******/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge

Return
-------
double

Description
-----------
Returns the tolerance for <E>.
") Tolerance;
		static double Tolerance(const TopoDS_Edge & E);

		/****** BRep_Tool::Tolerance ******/
		/****** md5 signature: 25f36324a51c2ff9bd41c5c2e14e071d ******/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "
Parameters
----------
V: TopoDS_Vertex

Return
-------
double

Description
-----------
Returns the tolerance.
") Tolerance;
		static double Tolerance(const TopoDS_Vertex & V);

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
		/****** md5 signature: 59986720cd5825b19da811dddcb8d927 ******/
		%feature("compactdefaultargs") Triangulations;
		%feature("autodoc", "
Parameters
----------
theFace: TopoDS_Face
theLocation: TopLoc_Location

Return
-------
NCollection_List<opencascade::handle<Poly_Triangulation>>

Description
-----------
Returns all triangulations of the face. 
Input parameter: theFace the input face. @param[out] theLocation the face location. 
Return: list of all available face triangulations.
") Triangulations;
		static const NCollection_List<opencascade::handle<Poly_Triangulation>> & Triangulations(const TopoDS_Face & theFace, TopLoc_Location & theLocation);

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
		/****** md5 signature: 32fa5c123c8346854a4ff108992a4dda ******/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "Return
-------
GeomAbs_Shape

Description
-----------
No available documentation.
") Continuity;
		const GeomAbs_Shape  Continuity();

		/****** BRep_CurveOn2Surfaces::Continuity ******/
		/****** md5 signature: 1f9d92a99f02635898383e88d0572655 ******/
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
		void Continuity(const GeomAbs_Shape C);

		/****** BRep_CurveOn2Surfaces::Copy ******/
		/****** md5 signature: eae667bd401f29253617aa3bf3863a9e ******/
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
		/****** md5 signature: d44fc8b79f74fec79a6c1299c0966002 ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
U: double
P: gp_Pnt

Return
-------
None

Description
-----------
Raises an error.
") D0;
		void D0(const double U, gp_Pnt & P);


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
		/****** md5 signature: c5ea8511de99de4c514d7c75ea39bf3c ******/
		%feature("compactdefaultargs") IsRegularity;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True.
") IsRegularity;
		bool IsRegularity();

		/****** BRep_CurveOn2Surfaces::IsRegularity ******/
		/****** md5 signature: a560fccae223fb9293d3da6180385a47 ******/
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
		bool IsRegularity(const opencascade::handle<Geom_Surface> & S1, const opencascade::handle<Geom_Surface> & S2, const TopLoc_Location & L1, const TopLoc_Location & L2);

		/****** BRep_CurveOn2Surfaces::Location2 ******/
		/****** md5 signature: 03931fb650206a9013acdd64f9693ef0 ******/
		%feature("compactdefaultargs") Location2;
		%feature("autodoc", "Return
-------
TopLoc_Location

Description
-----------
No available documentation.
") Location2;
		const TopLoc_Location & Location2();

		/****** BRep_CurveOn2Surfaces::Surface ******/
		/****** md5 signature: debd386cdd5eddf087482f15d6a663ac ******/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Surface>

Description
-----------
No available documentation.
") Surface;
		const opencascade::handle<Geom_Surface> & Surface();

		/****** BRep_CurveOn2Surfaces::Surface2 ******/
		/****** md5 signature: 9d4fe6322a8e8c5bd5d4c0b6e3633875 ******/
		%feature("compactdefaultargs") Surface2;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Surface>

Description
-----------
No available documentation.
") Surface2;
		const opencascade::handle<Geom_Surface> & Surface2();

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
		/****** md5 signature: 70e4517c721855ed052c516861139bfb ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
U: double
P: gp_Pnt

Return
-------
None

Description
-----------
Computes the point at parameter U.
") D0;
		virtual void D0(const double U, gp_Pnt & P);


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
		/****** md5 signature: 61ce69da508d1629f019b1eaed06f2ac ******/
		%feature("compactdefaultargs") First;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") First;
		double First();

		/****** BRep_GCurve::First ******/
		/****** md5 signature: c0cedb8f4b81fcd83bd05b51063ad29f ******/
		%feature("compactdefaultargs") First;
		%feature("autodoc", "
Parameters
----------
F: double

Return
-------
None

Description
-----------
No available documentation.
") First;
		void First(const double F);

		/****** BRep_GCurve::Last ******/
		/****** md5 signature: f68736fde4f79ad5767aa65cfae8fd87 ******/
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") Last;
		double Last();

		/****** BRep_GCurve::Last ******/
		/****** md5 signature: 37c9db5c6e738b05e88daecf974aecd1 ******/
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "
Parameters
----------
L: double

Return
-------
None

Description
-----------
No available documentation.
") Last;
		void Last(const double L);

		/****** BRep_GCurve::Range ******/
		/****** md5 signature: c32884cda3a28610e32c4835f8497e34 ******/
		%feature("compactdefaultargs") Range;
		%feature("autodoc", "
Parameters
----------

Return
-------
First: double
Last: double

Description
-----------
No available documentation.
") Range;
		void Range(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** BRep_GCurve::SetRange ******/
		/****** md5 signature: 526f31214adc678145a22614b0117fd4 ******/
		%feature("compactdefaultargs") SetRange;
		%feature("autodoc", "
Parameters
----------
First: double
Last: double

Return
-------
None

Description
-----------
No available documentation.
") SetRange;
		void SetRange(const double First, const double Last);

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
		/****** md5 signature: 7e77685d3ecea511c728fdc772619a4c ******/
		%feature("compactdefaultargs") BRep_PointOnCurve;
		%feature("autodoc", "
Parameters
----------
P: double
C: Geom_Curve
L: TopLoc_Location

Return
-------
None

Description
-----------
No available documentation.
") BRep_PointOnCurve;
		 BRep_PointOnCurve(const double P, const opencascade::handle<Geom_Curve> & C, const TopLoc_Location & L);

		/****** BRep_PointOnCurve::Curve ******/
		/****** md5 signature: 8a188840c6b028e21218c64bb7ed0c78 ******/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Curve>

Description
-----------
No available documentation.
") Curve;
		const opencascade::handle<Geom_Curve> & Curve();

		/****** BRep_PointOnCurve::Curve ******/
		/****** md5 signature: 5f30790de7d414ca0cd3c659e85b64d6 ******/
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
		void Curve(const opencascade::handle<Geom_Curve> & C);


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
		/****** md5 signature: 7be202f8ee44a472acb8f866be520bd3 ******/
		%feature("compactdefaultargs") IsPointOnCurve;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True.
") IsPointOnCurve;
		bool IsPointOnCurve();

		/****** BRep_PointOnCurve::IsPointOnCurve ******/
		/****** md5 signature: ef8fd3eabd9ffcf7c1f6e75f7a3d2249 ******/
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
		bool IsPointOnCurve(const opencascade::handle<Geom_Curve> & C, const TopLoc_Location & L);

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
		/****** md5 signature: debd386cdd5eddf087482f15d6a663ac ******/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Surface>

Description
-----------
No available documentation.
") Surface;
		const opencascade::handle<Geom_Surface> & Surface();

		/****** BRep_PointsOnSurface::Surface ******/
		/****** md5 signature: 95fc638330cc3b610ae300de0c967cac ******/
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
		void Surface(const opencascade::handle<Geom_Surface> & S);

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
		/****** md5 signature: eae667bd401f29253617aa3bf3863a9e ******/
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
		/****** md5 signature: 42e56cb16772a9e3b567a56488940d8a ******/
		%feature("compactdefaultargs") IsPolygon3D;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True.
") IsPolygon3D;
		bool IsPolygon3D();

		/****** BRep_Polygon3D::Polygon3D ******/
		/****** md5 signature: e168278abf8a96b09d36dfd3c9ccbe55 ******/
		%feature("compactdefaultargs") Polygon3D;
		%feature("autodoc", "Return
-------
opencascade::handle<Poly_Polygon3D>

Description
-----------
No available documentation.
") Polygon3D;
		const opencascade::handle<Poly_Polygon3D> & Polygon3D();

		/****** BRep_Polygon3D::Polygon3D ******/
		/****** md5 signature: b0d86878d587a5bcb25a5c568a882cca ******/
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
		void Polygon3D(const opencascade::handle<Poly_Polygon3D> & P);

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
		/****** md5 signature: eae667bd401f29253617aa3bf3863a9e ******/
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
		/****** BRep_PolygonOnSurface::IsPolygonOnSurface ******/
		/****** md5 signature: cd9c628ccb360261f2ab81491a5f1291 ******/
		%feature("compactdefaultargs") IsPolygonOnSurface;
		%feature("autodoc", "Return
-------
bool

Description
-----------
A 2D polygon representation in the parametric space of a surface.
") IsPolygonOnSurface;
		bool IsPolygonOnSurface();

		/****** BRep_PolygonOnSurface::IsPolygonOnSurface ******/
		/****** md5 signature: 830cecb3f1b1fd1743f2a1a93dd4852f ******/
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
		bool IsPolygonOnSurface(const opencascade::handle<Geom_Surface> & S, const TopLoc_Location & L);

		/****** BRep_PolygonOnSurface::Polygon ******/
		/****** md5 signature: b5230ca6b038208c50545dca7043ad94 ******/
		%feature("compactdefaultargs") Polygon;
		%feature("autodoc", "Return
-------
opencascade::handle<Poly_Polygon2D>

Description
-----------
No available documentation.
") Polygon;
		const opencascade::handle<Poly_Polygon2D> & Polygon();

		/****** BRep_PolygonOnSurface::Polygon ******/
		/****** md5 signature: 664e237d3cf75340bc36a49e138d44b9 ******/
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
		void Polygon(const opencascade::handle<Poly_Polygon2D> & P);

		/****** BRep_PolygonOnSurface::Surface ******/
		/****** md5 signature: debd386cdd5eddf087482f15d6a663ac ******/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Surface>

Description
-----------
No available documentation.
") Surface;
		const opencascade::handle<Geom_Surface> & Surface();

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
		/****** md5 signature: eae667bd401f29253617aa3bf3863a9e ******/
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
		/****** BRep_PolygonOnTriangulation::IsPolygonOnTriangulation ******/
		/****** md5 signature: 1597b6a60028655d58181db08920fd48 ******/
		%feature("compactdefaultargs") IsPolygonOnTriangulation;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns True.
") IsPolygonOnTriangulation;
		bool IsPolygonOnTriangulation();

		/****** BRep_PolygonOnTriangulation::IsPolygonOnTriangulation ******/
		/****** md5 signature: 1e408688149b85ad7d02a6effc370b00 ******/
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
		bool IsPolygonOnTriangulation(const opencascade::handle<Poly_Triangulation> & T, const TopLoc_Location & L);

		/****** BRep_PolygonOnTriangulation::PolygonOnTriangulation ******/
		/****** md5 signature: ff47b93907906edfdc19ee0f69e375ac ******/
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
		void PolygonOnTriangulation(const opencascade::handle<Poly_PolygonOnTriangulation> & P);

		/****** BRep_PolygonOnTriangulation::PolygonOnTriangulation ******/
		/****** md5 signature: 32171cf162f3d6e728758b622c58fc60 ******/
		%feature("compactdefaultargs") PolygonOnTriangulation;
		%feature("autodoc", "Return
-------
opencascade::handle<Poly_PolygonOnTriangulation>

Description
-----------
No available documentation.
") PolygonOnTriangulation;
		const opencascade::handle<Poly_PolygonOnTriangulation> & PolygonOnTriangulation();

		/****** BRep_PolygonOnTriangulation::Triangulation ******/
		/****** md5 signature: 2d36e6beeeefa684e1277c908a60e580 ******/
		%feature("compactdefaultargs") Triangulation;
		%feature("autodoc", "Return
-------
opencascade::handle<Poly_Triangulation>

Description
-----------
No available documentation.
") Triangulation;
		const opencascade::handle<Poly_Triangulation> & Triangulation();

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
		/****** md5 signature: eae667bd401f29253617aa3bf3863a9e ******/
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
		/****** md5 signature: ecc9f6fb109fc46a43e8587901592689 ******/
		%feature("compactdefaultargs") Curve3D;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Curve>

Description
-----------
No available documentation.
") Curve3D;
		const opencascade::handle<Geom_Curve> & Curve3D();

		/****** BRep_Curve3D::Curve3D ******/
		/****** md5 signature: 1db02b0b7e0d09ca281c9d8269136580 ******/
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
		void Curve3D(const opencascade::handle<Geom_Curve> & C);

		/****** BRep_Curve3D::D0 ******/
		/****** md5 signature: b6308e201d1906d6e34336d84aecbb91 ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
U: double
P: gp_Pnt

Return
-------
None

Description
-----------
Computes the point at parameter U.
") D0;
		void D0(const double U, gp_Pnt & P);


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
		/****** md5 signature: 8bd2ff72addea9ac0c1dc47886e0eef6 ******/
		%feature("compactdefaultargs") IsCurve3D;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True.
") IsCurve3D;
		bool IsCurve3D();

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
		/****** md5 signature: eae667bd401f29253617aa3bf3863a9e ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<BRep_CurveRepresentation>

Description
-----------
Return a copy of this representation.
") Copy;
		opencascade::handle<BRep_CurveRepresentation> Copy();

		/****** BRep_CurveOnSurface::D0 ******/
		/****** md5 signature: b6308e201d1906d6e34336d84aecbb91 ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
U: double
P: gp_Pnt

Return
-------
None

Description
-----------
Computes the point at parameter U.
") D0;
		void D0(const double U, gp_Pnt & P);


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
		/****** md5 signature: a8efdbe525e5f2048f7b392a80962575 ******/
		%feature("compactdefaultargs") IsCurveOnSurface;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True.
") IsCurveOnSurface;
		bool IsCurveOnSurface();

		/****** BRep_CurveOnSurface::IsCurveOnSurface ******/
		/****** md5 signature: 47a980ccbd00f37be7ef9660c18d346b ******/
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
		bool IsCurveOnSurface(const opencascade::handle<Geom_Surface> & S, const TopLoc_Location & L);

		/****** BRep_CurveOnSurface::PCurve ******/
		/****** md5 signature: d46aab3ea40a63665bd588f2509cf682 ******/
		%feature("compactdefaultargs") PCurve;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom2d_Curve>

Description
-----------
No available documentation.
") PCurve;
		const opencascade::handle<Geom2d_Curve> & PCurve();

		/****** BRep_CurveOnSurface::PCurve ******/
		/****** md5 signature: 2aae0e42496aa1491f48f4160d49fe96 ******/
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
		void PCurve(const opencascade::handle<Geom2d_Curve> & C);

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
		/****** md5 signature: debd386cdd5eddf087482f15d6a663ac ******/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Surface>

Description
-----------
No available documentation.
") Surface;
		const opencascade::handle<Geom_Surface> & Surface();

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
		/****** md5 signature: 28e4936208826ac11902de6a771202fc ******/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "Return
-------
None

Description
-----------
Recomputes any derived data after a modification. This is called when the range is modified.
") Update;
		void Update();

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
		/****** md5 signature: 8c402a8062d6cb194b220170568c7762 ******/
		%feature("compactdefaultargs") BRep_PointOnCurveOnSurface;
		%feature("autodoc", "
Parameters
----------
P: double
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
		 BRep_PointOnCurveOnSurface(const double P, const opencascade::handle<Geom2d_Curve> & C, const opencascade::handle<Geom_Surface> & S, const TopLoc_Location & L);


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
		/****** md5 signature: 8898530c890926f20f957e759114fe7d ******/
		%feature("compactdefaultargs") IsPointOnCurveOnSurface;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True.
") IsPointOnCurveOnSurface;
		bool IsPointOnCurveOnSurface();

		/****** BRep_PointOnCurveOnSurface::IsPointOnCurveOnSurface ******/
		/****** md5 signature: 687099533952a53b1cb341c3ddbc14d0 ******/
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
		bool IsPointOnCurveOnSurface(const opencascade::handle<Geom2d_Curve> & PC, const opencascade::handle<Geom_Surface> & S, const TopLoc_Location & L);

		/****** BRep_PointOnCurveOnSurface::PCurve ******/
		/****** md5 signature: d46aab3ea40a63665bd588f2509cf682 ******/
		%feature("compactdefaultargs") PCurve;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom2d_Curve>

Description
-----------
No available documentation.
") PCurve;
		const opencascade::handle<Geom2d_Curve> & PCurve();

		/****** BRep_PointOnCurveOnSurface::PCurve ******/
		/****** md5 signature: 2aae0e42496aa1491f48f4160d49fe96 ******/
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
		void PCurve(const opencascade::handle<Geom2d_Curve> & C);

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
		/****** md5 signature: 93b36adccd8f781d9d8e09862101e8d7 ******/
		%feature("compactdefaultargs") BRep_PointOnSurface;
		%feature("autodoc", "
Parameters
----------
P1: double
P2: double
S: Geom_Surface
L: TopLoc_Location

Return
-------
None

Description
-----------
No available documentation.
") BRep_PointOnSurface;
		 BRep_PointOnSurface(const double P1, const double P2, const opencascade::handle<Geom_Surface> & S, const TopLoc_Location & L);

		/****** BRep_PointOnSurface::IsPointOnSurface ******/
		/****** md5 signature: 52df0150db050c26095857ba1c771acf ******/
		%feature("compactdefaultargs") IsPointOnSurface;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsPointOnSurface;
		bool IsPointOnSurface();

		/****** BRep_PointOnSurface::IsPointOnSurface ******/
		/****** md5 signature: 41cce64c1d3a978fa95bff702f17faa0 ******/
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
		bool IsPointOnSurface(const opencascade::handle<Geom_Surface> & S, const TopLoc_Location & L);

		/****** BRep_PointOnSurface::Parameter2 ******/
		/****** md5 signature: c48b1302d34b7fb55325abf634982e60 ******/
		%feature("compactdefaultargs") Parameter2;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") Parameter2;
		double Parameter2();

		/****** BRep_PointOnSurface::Parameter2 ******/
		/****** md5 signature: bfe51eaa725c27201a4a15bc90921bce ******/
		%feature("compactdefaultargs") Parameter2;
		%feature("autodoc", "
Parameters
----------
P: double

Return
-------
None

Description
-----------
No available documentation.
") Parameter2;
		void Parameter2(const double P);

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
		/****** md5 signature: eae667bd401f29253617aa3bf3863a9e ******/
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
		/****** BRep_PolygonOnClosedSurface::IsPolygonOnClosedSurface ******/
		/****** md5 signature: b8355a34651ec181aff35df99109e63d ******/
		%feature("compactdefaultargs") IsPolygonOnClosedSurface;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns True.
") IsPolygonOnClosedSurface;
		bool IsPolygonOnClosedSurface();

		/****** BRep_PolygonOnClosedSurface::Polygon2 ******/
		/****** md5 signature: 135ceba7d2c84380df5783c139d2449f ******/
		%feature("compactdefaultargs") Polygon2;
		%feature("autodoc", "Return
-------
opencascade::handle<Poly_Polygon2D>

Description
-----------
No available documentation.
") Polygon2;
		const opencascade::handle<Poly_Polygon2D> & Polygon2();

		/****** BRep_PolygonOnClosedSurface::Polygon2 ******/
		/****** md5 signature: 0442d51dcf6a6d095d569e290a2a707a ******/
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
		void Polygon2(const opencascade::handle<Poly_Polygon2D> & P);

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
		/****** md5 signature: eae667bd401f29253617aa3bf3863a9e ******/
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
		/****** BRep_PolygonOnClosedTriangulation::IsPolygonOnClosedTriangulation ******/
		/****** md5 signature: a9e6122af2c8cdf0d580f44b2e460d1f ******/
		%feature("compactdefaultargs") IsPolygonOnClosedTriangulation;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True.
") IsPolygonOnClosedTriangulation;
		bool IsPolygonOnClosedTriangulation();

		/****** BRep_PolygonOnClosedTriangulation::PolygonOnTriangulation2 ******/
		/****** md5 signature: e96ab2094c5805593d8b49103f908348 ******/
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
		void PolygonOnTriangulation2(const opencascade::handle<Poly_PolygonOnTriangulation> & P2);

		/****** BRep_PolygonOnClosedTriangulation::PolygonOnTriangulation2 ******/
		/****** md5 signature: 80c6a2db287e2020a7e316d2e73a6b3f ******/
		%feature("compactdefaultargs") PolygonOnTriangulation2;
		%feature("autodoc", "Return
-------
opencascade::handle<Poly_PolygonOnTriangulation>

Description
-----------
No available documentation.
") PolygonOnTriangulation2;
		const opencascade::handle<Poly_PolygonOnTriangulation> & PolygonOnTriangulation2();

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
		/****** md5 signature: 32fa5c123c8346854a4ff108992a4dda ******/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "Return
-------
GeomAbs_Shape

Description
-----------
No available documentation.
") Continuity;
		const GeomAbs_Shape  Continuity();

		/****** BRep_CurveOnClosedSurface::Continuity ******/
		/****** md5 signature: 1f9d92a99f02635898383e88d0572655 ******/
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
		void Continuity(const GeomAbs_Shape C);

		/****** BRep_CurveOnClosedSurface::Copy ******/
		/****** md5 signature: eae667bd401f29253617aa3bf3863a9e ******/
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
		/****** BRep_CurveOnClosedSurface::IsCurveOnClosedSurface ******/
		/****** md5 signature: 78e79cbaa7ebe3af3136f7463ef9e787 ******/
		%feature("compactdefaultargs") IsCurveOnClosedSurface;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True.
") IsCurveOnClosedSurface;
		bool IsCurveOnClosedSurface();

		/****** BRep_CurveOnClosedSurface::IsRegularity ******/
		/****** md5 signature: c5ea8511de99de4c514d7c75ea39bf3c ******/
		%feature("compactdefaultargs") IsRegularity;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True.
") IsRegularity;
		bool IsRegularity();

		/****** BRep_CurveOnClosedSurface::IsRegularity ******/
		/****** md5 signature: a560fccae223fb9293d3da6180385a47 ******/
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
		bool IsRegularity(const opencascade::handle<Geom_Surface> & S1, const opencascade::handle<Geom_Surface> & S2, const TopLoc_Location & L1, const TopLoc_Location & L2);

		/****** BRep_CurveOnClosedSurface::Location2 ******/
		/****** md5 signature: 03931fb650206a9013acdd64f9693ef0 ******/
		%feature("compactdefaultargs") Location2;
		%feature("autodoc", "Return
-------
TopLoc_Location

Description
-----------
Returns Location().
") Location2;
		const TopLoc_Location & Location2();

		/****** BRep_CurveOnClosedSurface::PCurve2 ******/
		/****** md5 signature: aaf89e3a58610fe90aa66a4d6e7f608f ******/
		%feature("compactdefaultargs") PCurve2;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom2d_Curve>

Description
-----------
No available documentation.
") PCurve2;
		const opencascade::handle<Geom2d_Curve> & PCurve2();

		/****** BRep_CurveOnClosedSurface::PCurve2 ******/
		/****** md5 signature: 49e6da8059ad554609d6c7c1a751852f ******/
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
		void PCurve2(const opencascade::handle<Geom2d_Curve> & C);

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
		/****** md5 signature: 9d4fe6322a8e8c5bd5d4c0b6e3633875 ******/
		%feature("compactdefaultargs") Surface2;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Surface>

Description
-----------
Returns Surface().
") Surface2;
		const opencascade::handle<Geom_Surface> & Surface2();

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
		/****** md5 signature: 28e4936208826ac11902de6a771202fc ******/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "Return
-------
None

Description
-----------
Recomputes any derived data after a modification. This is called when the range is modified.
") Update;
		void Update();

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
