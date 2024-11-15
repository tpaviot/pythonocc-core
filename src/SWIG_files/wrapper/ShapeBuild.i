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
%define SHAPEBUILDDOCSTRING
"ShapeBuild module, see official documentation at
https://dev.opencascade.org/doc/occt-7.8.0/refman/html/package_shapebuild.html"
%enddef
%module (package="OCC.Core", docstring=SHAPEBUILDDOCSTRING) ShapeBuild


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
#include<ShapeBuild_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<Geom_module.hxx>
#include<TopoDS_module.hxx>
#include<TopLoc_module.hxx>
#include<Geom2d_module.hxx>
#include<gp_module.hxx>
#include<BRepTools_module.hxx>
#include<TopAbs_module.hxx>
#include<ShapeExtend_module.hxx>
#include<TShort_module.hxx>
#include<TColGeom_module.hxx>
#include<BRep_module.hxx>
#include<Message_module.hxx>
#include<TopTools_module.hxx>
#include<Bnd_module.hxx>
#include<TCollection_module.hxx>
#include<Poly_module.hxx>
#include<Geom_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import Geom.i
%import TopoDS.i
%import TopLoc.i
%import Geom2d.i
%import gp.i
%import BRepTools.i
%import TopAbs.i
%import ShapeExtend.i

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
%wrap_handle(ShapeBuild_ReShape)
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/*******************
* class ShapeBuild *
*******************/
%rename(shapebuild) ShapeBuild;
class ShapeBuild {
	public:
		/****** ShapeBuild::PlaneXOY ******/
		/****** md5 signature: 57bfc50d9755d4555c88b66820d939ca ******/
		%feature("compactdefaultargs") PlaneXOY;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Plane>

Description
-----------
Rebuilds a shape with substitution of some components returns a geom_surface which is the plane xoy (z positive) this allows to consider an uv space homologous to a 3d space, with this support surface.
") PlaneXOY;
		static opencascade::handle<Geom_Plane> PlaneXOY();

};


%extend ShapeBuild {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class ShapeBuild_Edge *
************************/
class ShapeBuild_Edge {
	public:
		/****** ShapeBuild_Edge::BuildCurve3d ******/
		/****** md5 signature: b71a447f0e9234b04cd01c1d5fdad27b ******/
		%feature("compactdefaultargs") BuildCurve3d;
		%feature("autodoc", "
Parameters
----------
edge: TopoDS_Edge

Return
-------
bool

Description
-----------
Calls breptools::buildcurve3d.
") BuildCurve3d;
		Standard_Boolean BuildCurve3d(const TopoDS_Edge & edge);

		/****** ShapeBuild_Edge::Copy ******/
		/****** md5 signature: 6acc1f216ee40fc49cbc082da9c35725 ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "
Parameters
----------
edge: TopoDS_Edge
sharepcurves: bool (optional, default to Standard_True)

Return
-------
TopoDS_Edge

Description
-----------
Make a copy of <edge> by call to copyreplacevertices() (i.e. construct new tedge with the same pcurves and vertices). if <sharepcurves> is false, pcurves are also replaced by their copies with help of method copypcurves.
") Copy;
		TopoDS_Edge Copy(const TopoDS_Edge & edge, const Standard_Boolean sharepcurves = Standard_True);

		/****** ShapeBuild_Edge::CopyPCurves ******/
		/****** md5 signature: 25f7a109de32430c6672825d5075da37 ******/
		%feature("compactdefaultargs") CopyPCurves;
		%feature("autodoc", "
Parameters
----------
toedge: TopoDS_Edge
fromedge: TopoDS_Edge

Return
-------
None

Description
-----------
Makes a copy of pcurves from edge <fromedge> into edge <toedge>. pcurves which are already present in <toedge>, are replaced by copies, other are copied. ranges are also copied.
") CopyPCurves;
		void CopyPCurves(const TopoDS_Edge & toedge, const TopoDS_Edge & fromedge);

		/****** ShapeBuild_Edge::CopyRanges ******/
		/****** md5 signature: 771bf2b7126654a55a746498755ddceb ******/
		%feature("compactdefaultargs") CopyRanges;
		%feature("autodoc", "
Parameters
----------
toedge: TopoDS_Edge
fromedge: TopoDS_Edge
alpha: float (optional, default to 0)
beta: float (optional, default to 1)

Return
-------
None

Description
-----------
Copies ranges for curve3d and all common pcurves from edge <fromedge> into edge <toedge>.
") CopyRanges;
		void CopyRanges(const TopoDS_Edge & toedge, const TopoDS_Edge & fromedge, const Standard_Real alpha = 0, const Standard_Real beta = 1);

		/****** ShapeBuild_Edge::CopyReplaceVertices ******/
		/****** md5 signature: 3d5d12e2d1fda9c50f7aaae2f0610953 ******/
		%feature("compactdefaultargs") CopyReplaceVertices;
		%feature("autodoc", "
Parameters
----------
edge: TopoDS_Edge
V1: TopoDS_Vertex
V2: TopoDS_Vertex

Return
-------
TopoDS_Edge

Description
-----------
Copy edge and replace one or both its vertices to a given one(s). vertex v1 replaces forward vertex, and v2 - reversed, as they are found by topods_iterator. if v1 or v2 is null, the original vertex is taken.
") CopyReplaceVertices;
		TopoDS_Edge CopyReplaceVertices(const TopoDS_Edge & edge, const TopoDS_Vertex & V1, const TopoDS_Vertex & V2);

		/****** ShapeBuild_Edge::MakeEdge ******/
		/****** md5 signature: 1fc6d3953c1103bdfb609a4ced11036a ******/
		%feature("compactdefaultargs") MakeEdge;
		%feature("autodoc", "
Parameters
----------
edge: TopoDS_Edge
curve: Geom_Curve
L: TopLoc_Location

Return
-------
None

Description
-----------
Makes edge with curve and location.
") MakeEdge;
		void MakeEdge(TopoDS_Edge & edge, const opencascade::handle<Geom_Curve> & curve, const TopLoc_Location & L);

		/****** ShapeBuild_Edge::MakeEdge ******/
		/****** md5 signature: d4cdac56f8675391ab4f571abd67da65 ******/
		%feature("compactdefaultargs") MakeEdge;
		%feature("autodoc", "
Parameters
----------
edge: TopoDS_Edge
curve: Geom_Curve
L: TopLoc_Location
p1: float
p2: float

Return
-------
None

Description
-----------
Makes edge with curve, location and range [p1, p2].
") MakeEdge;
		void MakeEdge(TopoDS_Edge & edge, const opencascade::handle<Geom_Curve> & curve, const TopLoc_Location & L, const Standard_Real p1, const Standard_Real p2);

		/****** ShapeBuild_Edge::MakeEdge ******/
		/****** md5 signature: 109d90ad9284a8640032afb7e98fabd1 ******/
		%feature("compactdefaultargs") MakeEdge;
		%feature("autodoc", "
Parameters
----------
edge: TopoDS_Edge
pcurve: Geom2d_Curve
face: TopoDS_Face

Return
-------
None

Description
-----------
Makes edge with pcurve and face.
") MakeEdge;
		void MakeEdge(TopoDS_Edge & edge, const opencascade::handle<Geom2d_Curve> & pcurve, const TopoDS_Face & face);

		/****** ShapeBuild_Edge::MakeEdge ******/
		/****** md5 signature: 88e9aed13da38129c72a6dc41ddee75b ******/
		%feature("compactdefaultargs") MakeEdge;
		%feature("autodoc", "
Parameters
----------
edge: TopoDS_Edge
pcurve: Geom2d_Curve
face: TopoDS_Face
p1: float
p2: float

Return
-------
None

Description
-----------
Makes edge with pcurve, face and range [p1, p2].
") MakeEdge;
		void MakeEdge(TopoDS_Edge & edge, const opencascade::handle<Geom2d_Curve> & pcurve, const TopoDS_Face & face, const Standard_Real p1, const Standard_Real p2);

		/****** ShapeBuild_Edge::MakeEdge ******/
		/****** md5 signature: 554307a7f2511e208e591c34e55f51cc ******/
		%feature("compactdefaultargs") MakeEdge;
		%feature("autodoc", "
Parameters
----------
edge: TopoDS_Edge
pcurve: Geom2d_Curve
S: Geom_Surface
L: TopLoc_Location

Return
-------
None

Description
-----------
Makes edge with pcurve, surface and location.
") MakeEdge;
		void MakeEdge(TopoDS_Edge & edge, const opencascade::handle<Geom2d_Curve> & pcurve, const opencascade::handle<Geom_Surface> & S, const TopLoc_Location & L);

		/****** ShapeBuild_Edge::MakeEdge ******/
		/****** md5 signature: 7976c2010dcf9efa9b0ec3996a9d0e0f ******/
		%feature("compactdefaultargs") MakeEdge;
		%feature("autodoc", "
Parameters
----------
edge: TopoDS_Edge
pcurve: Geom2d_Curve
S: Geom_Surface
L: TopLoc_Location
p1: float
p2: float

Return
-------
None

Description
-----------
Makes edge with pcurve, surface, location and range [p1, p2].
") MakeEdge;
		void MakeEdge(TopoDS_Edge & edge, const opencascade::handle<Geom2d_Curve> & pcurve, const opencascade::handle<Geom_Surface> & S, const TopLoc_Location & L, const Standard_Real p1, const Standard_Real p2);

		/****** ShapeBuild_Edge::ReassignPCurve ******/
		/****** md5 signature: eedcd30142f0ad4566d72eeb6adf4683 ******/
		%feature("compactdefaultargs") ReassignPCurve;
		%feature("autodoc", "
Parameters
----------
edge: TopoDS_Edge
old: TopoDS_Face
sub: TopoDS_Face

Return
-------
bool

Description
-----------
Reassign edge pcurve lying on face <old> to another face <sub>. if edge has two pcurves on <old> face, only one of them will be reassigned, and other will left alone. similarly, if edge already had a pcurve on face <sub>, it will have two pcurves on it. returns true if succeeded, false if no pcurve lying on <old> found.
") ReassignPCurve;
		Standard_Boolean ReassignPCurve(const TopoDS_Edge & edge, const TopoDS_Face & old, const TopoDS_Face & sub);

		/****** ShapeBuild_Edge::RemoveCurve3d ******/
		/****** md5 signature: 7b8d7623b7b24e340d8a01475f614ce6 ******/
		%feature("compactdefaultargs") RemoveCurve3d;
		%feature("autodoc", "
Parameters
----------
edge: TopoDS_Edge

Return
-------
None

Description
-----------
Removes the curve3d recorded in an edge.
") RemoveCurve3d;
		void RemoveCurve3d(const TopoDS_Edge & edge);

		/****** ShapeBuild_Edge::RemovePCurve ******/
		/****** md5 signature: 398e4916e3e589e390e8a5f466db0e1a ******/
		%feature("compactdefaultargs") RemovePCurve;
		%feature("autodoc", "
Parameters
----------
edge: TopoDS_Edge
face: TopoDS_Face

Return
-------
None

Description
-----------
Removes the pcurve(s) which could be recorded in an edge for the given face.
") RemovePCurve;
		void RemovePCurve(const TopoDS_Edge & edge, const TopoDS_Face & face);

		/****** ShapeBuild_Edge::RemovePCurve ******/
		/****** md5 signature: f9e58f628061ecf4be08633e2e09e204 ******/
		%feature("compactdefaultargs") RemovePCurve;
		%feature("autodoc", "
Parameters
----------
edge: TopoDS_Edge
surf: Geom_Surface

Return
-------
None

Description
-----------
Removes the pcurve(s) which could be recorded in an edge for the given surface.
") RemovePCurve;
		void RemovePCurve(const TopoDS_Edge & edge, const opencascade::handle<Geom_Surface> & surf);

		/****** ShapeBuild_Edge::RemovePCurve ******/
		/****** md5 signature: cfb0f7bbde4ab2b266721244b43acf63 ******/
		%feature("compactdefaultargs") RemovePCurve;
		%feature("autodoc", "
Parameters
----------
edge: TopoDS_Edge
surf: Geom_Surface
loc: TopLoc_Location

Return
-------
None

Description
-----------
Removes the pcurve(s) which could be recorded in an edge for the given surface, with given location.
") RemovePCurve;
		void RemovePCurve(const TopoDS_Edge & edge, const opencascade::handle<Geom_Surface> & surf, const TopLoc_Location & loc);

		/****** ShapeBuild_Edge::ReplacePCurve ******/
		/****** md5 signature: 59fbba485521ce76bf7e900bbd4827fc ******/
		%feature("compactdefaultargs") ReplacePCurve;
		%feature("autodoc", "
Parameters
----------
edge: TopoDS_Edge
pcurve: Geom2d_Curve
face: TopoDS_Face

Return
-------
None

Description
-----------
Replace the pcurve in an edge for the given face in case if edge is seam, i.e. has 2 pcurves on that face, only pcurve corresponding to the orientation of the edge is replaced.
") ReplacePCurve;
		void ReplacePCurve(const TopoDS_Edge & edge, const opencascade::handle<Geom2d_Curve> & pcurve, const TopoDS_Face & face);

		/****** ShapeBuild_Edge::SetRange3d ******/
		/****** md5 signature: 0807ccb8f8adb5587984329cb315c2be ******/
		%feature("compactdefaultargs") SetRange3d;
		%feature("autodoc", "
Parameters
----------
edge: TopoDS_Edge
first: float
last: float

Return
-------
None

Description
-----------
Sets range on 3d curve only.
") SetRange3d;
		void SetRange3d(const TopoDS_Edge & edge, const Standard_Real first, const Standard_Real last);

		/****** ShapeBuild_Edge::TransformPCurve ******/
		/****** md5 signature: 988d463c51d5165a3d827e7cd66158e8 ******/
		%feature("compactdefaultargs") TransformPCurve;
		%feature("autodoc", "
Parameters
----------
pcurve: Geom2d_Curve
trans: gp_Trsf2d
uFact: float

Return
-------
aFirst: float
aLast: float

Description
-----------
Transforms the pcurve with given matrix and affinity u factor.
") TransformPCurve;
		opencascade::handle<Geom2d_Curve> TransformPCurve(const opencascade::handle<Geom2d_Curve> & pcurve, const gp_Trsf2d & trans, const Standard_Real uFact, Standard_Real &OutValue, Standard_Real &OutValue);

};


%extend ShapeBuild_Edge {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class ShapeBuild_ReShape *
***************************/
class ShapeBuild_ReShape : public BRepTools_ReShape {
	public:
		/****** ShapeBuild_ReShape::ShapeBuild_ReShape ******/
		/****** md5 signature: cfd845e160cc424763c5aa51390aac0a ******/
		%feature("compactdefaultargs") ShapeBuild_ReShape;
		%feature("autodoc", "Return
-------
None

Description
-----------
Returns an empty reshape.
") ShapeBuild_ReShape;
		 ShapeBuild_ReShape();

		/****** ShapeBuild_ReShape::Apply ******/
		/****** md5 signature: 12ba89fbea5e6ee53d81d4b37fbd9ef2 ******/
		%feature("compactdefaultargs") Apply;
		%feature("autodoc", "
Parameters
----------
shape: TopoDS_Shape
until: TopAbs_ShapeEnum
buildmode: int

Return
-------
TopoDS_Shape

Description
-----------
Applies the substitutions requests to a shape //! <until> gives the level of type until which requests are taken into account. for subshapes of the type <until> no rebuild and further exploring are done. actually, not implemented below topabs_face //! <buildmode> says how to do on a solid,shell ... if one of its sub-shapes has been changed: 0: at least one replace or remove -> compound, else as such 1: at least one remove (replace are ignored) -> compound 2: replace and remove are both ignored if replace/remove are ignored or absent, the result as same type as the starting shape.
") Apply;
		virtual TopoDS_Shape Apply(const TopoDS_Shape & shape, const TopAbs_ShapeEnum until, const Standard_Integer buildmode);

		/****** ShapeBuild_ReShape::Apply ******/
		/****** md5 signature: 9fa21a223a211d6010aadfc1a9387cb1 ******/
		%feature("compactdefaultargs") Apply;
		%feature("autodoc", "
Parameters
----------
shape: TopoDS_Shape
until: TopAbs_ShapeEnum (optional, default to TopAbs_SHAPE)

Return
-------
TopoDS_Shape

Description
-----------
Applies the substitutions requests to a shape. //! <until> gives the level of type until which requests are taken into account. for subshapes of the type <until> no rebuild and further exploring are done. //! note: each subshape can be replaced by shape of the same type or by shape containing only shapes of that type (for example, topods_edge can be replaced by topods_edge, topods_wire or topods_compound containing topods_edges). if incompatible shape type is encountered, it is ignored and flag fail1 is set in status.
") Apply;
		virtual TopoDS_Shape Apply(const TopoDS_Shape & shape, const TopAbs_ShapeEnum until = TopAbs_SHAPE);

		/****** ShapeBuild_ReShape::Status ******/
		/****** md5 signature: 985ce37c5dc3d1c0dd4a10cb52f132ac ******/
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "
Parameters
----------
shape: TopoDS_Shape
newsh: TopoDS_Shape
last: bool (optional, default to Standard_False)

Return
-------
int

Description
-----------
Returns a complete substitution status for a shape 0: not recorded, <newsh> = original <shape> < 0: to be removed, <newsh> is null > 0: to be replaced, <newsh> is a new item if <last> is false, returns status and new shape recorded in the map directly for the shape, if true and status > 0 then recursively searches for the last status and new shape.
") Status;
		virtual Standard_Integer Status(const TopoDS_Shape & shape, TopoDS_Shape & newsh, const Standard_Boolean last = Standard_False);

		/****** ShapeBuild_ReShape::Status ******/
		/****** md5 signature: 99e3d5f98caf7305689b1d0bcc3d4886 ******/
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "
Parameters
----------
status: ShapeExtend_Status

Return
-------
bool

Description
-----------
Queries the status of last call to apply(shape,enum) ok: no (sub)shapes replaced or removed done1: source (starting) shape replaced done2: source (starting) shape removed done3: some subshapes replaced done4: some subshapes removed fail1: some replacements not done because of bad type of subshape.
") Status;
		virtual Standard_Boolean Status(const ShapeExtend_Status status);

};


%make_alias(ShapeBuild_ReShape)

%extend ShapeBuild_ReShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class ShapeBuild_Vertex *
**************************/
class ShapeBuild_Vertex {
	public:
		/****** ShapeBuild_Vertex::CombineVertex ******/
		/****** md5 signature: 4407a48668b1398c19e6849624256518 ******/
		%feature("compactdefaultargs") CombineVertex;
		%feature("autodoc", "
Parameters
----------
V1: TopoDS_Vertex
V2: TopoDS_Vertex
tolFactor: float (optional, default to 1.0001)

Return
-------
TopoDS_Vertex

Description
-----------
Combines new vertex from two others. this new one is the smallest vertex which comprises both of the source vertices. the function takes into account the positions and tolerances of the source vertices. the tolerance of the new vertex will be equal to the minimal tolerance that is required to comprise source vertices multiplied by tolfactor (in order to avoid errors because of discreteness of calculations).
") CombineVertex;
		TopoDS_Vertex CombineVertex(const TopoDS_Vertex & V1, const TopoDS_Vertex & V2, const Standard_Real tolFactor = 1.0001);

		/****** ShapeBuild_Vertex::CombineVertex ******/
		/****** md5 signature: 51f2a8e391a417018b98763c1d708317 ******/
		%feature("compactdefaultargs") CombineVertex;
		%feature("autodoc", "
Parameters
----------
pnt1: gp_Pnt
pnt2: gp_Pnt
tol1: float
tol2: float
tolFactor: float (optional, default to 1.0001)

Return
-------
TopoDS_Vertex

Description
-----------
The same function as above, except that it accepts two points and two tolerances instead of vertices.
") CombineVertex;
		TopoDS_Vertex CombineVertex(const gp_Pnt & pnt1, const gp_Pnt & pnt2, const Standard_Real tol1, const Standard_Real tol2, const Standard_Real tolFactor = 1.0001);

};


%extend ShapeBuild_Vertex {
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
def shapebuild_PlaneXOY(*args):
	return shapebuild.PlaneXOY(*args)

}
