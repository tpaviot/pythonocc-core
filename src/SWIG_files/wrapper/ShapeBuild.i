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
%define SHAPEBUILDDOCSTRING
"ShapeBuild module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_shapebuild.html"
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
%include ../common/Operators.i
%include ../common/OccHandle.i


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
/* public enums */
/* end public enums declaration */

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
		/****************** PlaneXOY ******************/
		%feature("compactdefaultargs") PlaneXOY;
		%feature("autodoc", "* Rebuilds a shape with substitution of some components Returns a Geom_Surface which is the Plane XOY (Z positive) This allows to consider an UV space homologous to a 3D space, with this support surface
	:rtype: opencascade::handle<Geom_Plane>") PlaneXOY;
		static opencascade::handle<Geom_Plane> PlaneXOY ();

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
		/****************** BuildCurve3d ******************/
		%feature("compactdefaultargs") BuildCurve3d;
		%feature("autodoc", "* Calls BRepTools::BuildCurve3D
	:param edge:
	:type edge: TopoDS_Edge
	:rtype: bool") BuildCurve3d;
		Standard_Boolean BuildCurve3d (const TopoDS_Edge & edge);

		/****************** Copy ******************/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "* Make a copy of <edge> by call to CopyReplaceVertices() (i.e. construct new TEdge with the same pcurves and vertices). If <sharepcurves> is False, pcurves are also replaced by their copies with help of method CopyPCurves
	:param edge:
	:type edge: TopoDS_Edge
	:param sharepcurves: default value is Standard_True
	:type sharepcurves: bool
	:rtype: TopoDS_Edge") Copy;
		TopoDS_Edge Copy (const TopoDS_Edge & edge,const Standard_Boolean sharepcurves = Standard_True);

		/****************** CopyPCurves ******************/
		%feature("compactdefaultargs") CopyPCurves;
		%feature("autodoc", "* Makes a copy of pcurves from edge <fromedge> into edge <toedge>. Pcurves which are already present in <toedge>, are replaced by copies, other are copied. Ranges are also copied.
	:param toedge:
	:type toedge: TopoDS_Edge
	:param fromedge:
	:type fromedge: TopoDS_Edge
	:rtype: None") CopyPCurves;
		void CopyPCurves (const TopoDS_Edge & toedge,const TopoDS_Edge & fromedge);

		/****************** CopyRanges ******************/
		%feature("compactdefaultargs") CopyRanges;
		%feature("autodoc", "* Copies ranges for curve3d and all common pcurves from edge <fromedge> into edge <toedge>.
	:param toedge:
	:type toedge: TopoDS_Edge
	:param fromedge:
	:type fromedge: TopoDS_Edge
	:param alpha: default value is 0
	:type alpha: float
	:param beta: default value is 1
	:type beta: float
	:rtype: None") CopyRanges;
		void CopyRanges (const TopoDS_Edge & toedge,const TopoDS_Edge & fromedge,const Standard_Real alpha = 0,const Standard_Real beta = 1);

		/****************** CopyReplaceVertices ******************/
		%feature("compactdefaultargs") CopyReplaceVertices;
		%feature("autodoc", "* Copy edge and replace one or both its vertices to a given one(s). Vertex V1 replaces FORWARD vertex, and V2 - REVERSED, as they are found by TopoDS_Iterator. If V1 or V2 is NULL, the original vertex is taken
	:param edge:
	:type edge: TopoDS_Edge
	:param V1:
	:type V1: TopoDS_Vertex
	:param V2:
	:type V2: TopoDS_Vertex
	:rtype: TopoDS_Edge") CopyReplaceVertices;
		TopoDS_Edge CopyReplaceVertices (const TopoDS_Edge & edge,const TopoDS_Vertex & V1,const TopoDS_Vertex & V2);

		/****************** MakeEdge ******************/
		%feature("compactdefaultargs") MakeEdge;
		%feature("autodoc", "* Makes edge with curve and location
	:param edge:
	:type edge: TopoDS_Edge
	:param curve:
	:type curve: Geom_Curve
	:param L:
	:type L: TopLoc_Location
	:rtype: None") MakeEdge;
		void MakeEdge (TopoDS_Edge & edge,const opencascade::handle<Geom_Curve> & curve,const TopLoc_Location & L);

		/****************** MakeEdge ******************/
		%feature("compactdefaultargs") MakeEdge;
		%feature("autodoc", "* Makes edge with curve, location and range [p1, p2]
	:param edge:
	:type edge: TopoDS_Edge
	:param curve:
	:type curve: Geom_Curve
	:param L:
	:type L: TopLoc_Location
	:param p1:
	:type p1: float
	:param p2:
	:type p2: float
	:rtype: None") MakeEdge;
		void MakeEdge (TopoDS_Edge & edge,const opencascade::handle<Geom_Curve> & curve,const TopLoc_Location & L,const Standard_Real p1,const Standard_Real p2);

		/****************** MakeEdge ******************/
		%feature("compactdefaultargs") MakeEdge;
		%feature("autodoc", "* Makes edge with pcurve and face
	:param edge:
	:type edge: TopoDS_Edge
	:param pcurve:
	:type pcurve: Geom2d_Curve
	:param face:
	:type face: TopoDS_Face
	:rtype: None") MakeEdge;
		void MakeEdge (TopoDS_Edge & edge,const opencascade::handle<Geom2d_Curve> & pcurve,const TopoDS_Face & face);

		/****************** MakeEdge ******************/
		%feature("compactdefaultargs") MakeEdge;
		%feature("autodoc", "* Makes edge with pcurve, face and range [p1, p2]
	:param edge:
	:type edge: TopoDS_Edge
	:param pcurve:
	:type pcurve: Geom2d_Curve
	:param face:
	:type face: TopoDS_Face
	:param p1:
	:type p1: float
	:param p2:
	:type p2: float
	:rtype: None") MakeEdge;
		void MakeEdge (TopoDS_Edge & edge,const opencascade::handle<Geom2d_Curve> & pcurve,const TopoDS_Face & face,const Standard_Real p1,const Standard_Real p2);

		/****************** MakeEdge ******************/
		%feature("compactdefaultargs") MakeEdge;
		%feature("autodoc", "* Makes edge with pcurve, surface and location
	:param edge:
	:type edge: TopoDS_Edge
	:param pcurve:
	:type pcurve: Geom2d_Curve
	:param S:
	:type S: Geom_Surface
	:param L:
	:type L: TopLoc_Location
	:rtype: None") MakeEdge;
		void MakeEdge (TopoDS_Edge & edge,const opencascade::handle<Geom2d_Curve> & pcurve,const opencascade::handle<Geom_Surface> & S,const TopLoc_Location & L);

		/****************** MakeEdge ******************/
		%feature("compactdefaultargs") MakeEdge;
		%feature("autodoc", "* Makes edge with pcurve, surface, location and range [p1, p2]
	:param edge:
	:type edge: TopoDS_Edge
	:param pcurve:
	:type pcurve: Geom2d_Curve
	:param S:
	:type S: Geom_Surface
	:param L:
	:type L: TopLoc_Location
	:param p1:
	:type p1: float
	:param p2:
	:type p2: float
	:rtype: None") MakeEdge;
		void MakeEdge (TopoDS_Edge & edge,const opencascade::handle<Geom2d_Curve> & pcurve,const opencascade::handle<Geom_Surface> & S,const TopLoc_Location & L,const Standard_Real p1,const Standard_Real p2);

		/****************** ReassignPCurve ******************/
		%feature("compactdefaultargs") ReassignPCurve;
		%feature("autodoc", "* Reassign edge pcurve lying on face <old> to another face <sub>. If edge has two pcurves on <old> face, only one of them will be reassigned, and other will left alone. Similarly, if edge already had a pcurve on face <sub>, it will have two pcurves on it. Returns True if succeeded, False if no pcurve lying on <old> found.
	:param edge:
	:type edge: TopoDS_Edge
	:param old:
	:type old: TopoDS_Face
	:param sub:
	:type sub: TopoDS_Face
	:rtype: bool") ReassignPCurve;
		Standard_Boolean ReassignPCurve (const TopoDS_Edge & edge,const TopoDS_Face & old,const TopoDS_Face & sub);

		/****************** RemoveCurve3d ******************/
		%feature("compactdefaultargs") RemoveCurve3d;
		%feature("autodoc", "* Removes the Curve3D recorded in an Edge
	:param edge:
	:type edge: TopoDS_Edge
	:rtype: None") RemoveCurve3d;
		void RemoveCurve3d (const TopoDS_Edge & edge);

		/****************** RemovePCurve ******************/
		%feature("compactdefaultargs") RemovePCurve;
		%feature("autodoc", "* Removes the PCurve(s) which could be recorded in an Edge for the given Face
	:param edge:
	:type edge: TopoDS_Edge
	:param face:
	:type face: TopoDS_Face
	:rtype: None") RemovePCurve;
		void RemovePCurve (const TopoDS_Edge & edge,const TopoDS_Face & face);

		/****************** RemovePCurve ******************/
		%feature("compactdefaultargs") RemovePCurve;
		%feature("autodoc", "* Removes the PCurve(s) which could be recorded in an Edge for the given Surface
	:param edge:
	:type edge: TopoDS_Edge
	:param surf:
	:type surf: Geom_Surface
	:rtype: None") RemovePCurve;
		void RemovePCurve (const TopoDS_Edge & edge,const opencascade::handle<Geom_Surface> & surf);

		/****************** RemovePCurve ******************/
		%feature("compactdefaultargs") RemovePCurve;
		%feature("autodoc", "* Removes the PCurve(s) which could be recorded in an Edge for the given Surface, with given Location
	:param edge:
	:type edge: TopoDS_Edge
	:param surf:
	:type surf: Geom_Surface
	:param loc:
	:type loc: TopLoc_Location
	:rtype: None") RemovePCurve;
		void RemovePCurve (const TopoDS_Edge & edge,const opencascade::handle<Geom_Surface> & surf,const TopLoc_Location & loc);

		/****************** ReplacePCurve ******************/
		%feature("compactdefaultargs") ReplacePCurve;
		%feature("autodoc", "* Replace the PCurve in an Edge for the given Face In case if edge is seam, i.e. has 2 pcurves on that face, only pcurve corresponding to the orientation of the edge is replaced
	:param edge:
	:type edge: TopoDS_Edge
	:param pcurve:
	:type pcurve: Geom2d_Curve
	:param face:
	:type face: TopoDS_Face
	:rtype: None") ReplacePCurve;
		void ReplacePCurve (const TopoDS_Edge & edge,const opencascade::handle<Geom2d_Curve> & pcurve,const TopoDS_Face & face);

		/****************** SetRange3d ******************/
		%feature("compactdefaultargs") SetRange3d;
		%feature("autodoc", "* Sets range on 3d curve only.
	:param edge:
	:type edge: TopoDS_Edge
	:param first:
	:type first: float
	:param last:
	:type last: float
	:rtype: None") SetRange3d;
		void SetRange3d (const TopoDS_Edge & edge,const Standard_Real first,const Standard_Real last);

		/****************** TransformPCurve ******************/
		%feature("compactdefaultargs") TransformPCurve;
		%feature("autodoc", "* Transforms the PCurve with given matrix and affinity U factor.
	:param pcurve:
	:type pcurve: Geom2d_Curve
	:param trans:
	:type trans: gp_Trsf2d
	:param uFact:
	:type uFact: float
	:param aFirst:
	:type aFirst: float
	:param aLast:
	:type aLast: float
	:rtype: opencascade::handle<Geom2d_Curve>") TransformPCurve;
		opencascade::handle<Geom2d_Curve> TransformPCurve (const opencascade::handle<Geom2d_Curve> & pcurve,const gp_Trsf2d & trans,const Standard_Real uFact,Standard_Real &OutValue,Standard_Real &OutValue);

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
		/****************** Apply ******************/
		%feature("compactdefaultargs") Apply;
		%feature("autodoc", "* Applies the substitutions requests to a shape //! <until> gives the level of type until which requests are taken into account. For subshapes of the type <until> no rebuild and futher exploring are done. ACTUALLY, NOT IMPLEMENTED BELOW TopAbs_FACE //! <buildmode> says how to do on a SOLID,SHELL ... if one of its sub-shapes has been changed: 0: at least one Replace or Remove -> COMPOUND, else as such 1: at least one Remove (Replace are ignored) -> COMPOUND 2: Replace and Remove are both ignored If Replace/Remove are ignored or absent, the result as same type as the starting shape
	:param shape:
	:type shape: TopoDS_Shape
	:param until:
	:type until: TopAbs_ShapeEnum
	:param buildmode:
	:type buildmode: int
	:rtype: TopoDS_Shape") Apply;
		virtual TopoDS_Shape Apply (const TopoDS_Shape & shape,const TopAbs_ShapeEnum until,const Standard_Integer buildmode);

		/****************** Apply ******************/
		%feature("compactdefaultargs") Apply;
		%feature("autodoc", "* Applies the substitutions requests to a shape. //! <until> gives the level of type until which requests are taken into account. For subshapes of the type <until> no rebuild and futher exploring are done. //! NOTE: each subshape can be replaced by shape of the same type or by shape containing only shapes of that type (for example, TopoDS_Edge can be replaced by TopoDS_Edge, TopoDS_Wire or TopoDS_Compound containing TopoDS_Edges). If incompatible shape type is encountered, it is ignored and flag FAIL1 is set in Status.
	:param shape:
	:type shape: TopoDS_Shape
	:param until: default value is TopAbs_SHAPE
	:type until: TopAbs_ShapeEnum
	:rtype: TopoDS_Shape") Apply;
		virtual TopoDS_Shape Apply (const TopoDS_Shape & shape,const TopAbs_ShapeEnum until = TopAbs_SHAPE);

		/****************** ShapeBuild_ReShape ******************/
		%feature("compactdefaultargs") ShapeBuild_ReShape;
		%feature("autodoc", "* Returns an empty Reshape
	:rtype: None") ShapeBuild_ReShape;
		 ShapeBuild_ReShape ();

		/****************** Status ******************/
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "* Returns a complete substitution status for a shape 0 : not recorded, <newsh> = original <shape> < 0: to be removed, <newsh> is NULL > 0: to be replaced, <newsh> is a new item If <last> is False, returns status and new shape recorded in the map directly for the shape, if True and status > 0 then recursively searches for the last status and new shape.
	:param shape:
	:type shape: TopoDS_Shape
	:param newsh:
	:type newsh: TopoDS_Shape
	:param last: default value is Standard_False
	:type last: bool
	:rtype: int") Status;
		virtual Standard_Integer Status (const TopoDS_Shape & shape,TopoDS_Shape & newsh,const Standard_Boolean last = Standard_False);

		/****************** Status ******************/
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "* Queries the status of last call to Apply(shape,enum) OK : no (sub)shapes replaced or removed DONE1: source (starting) shape replaced DONE2: source (starting) shape removed DONE3: some subshapes replaced DONE4: some subshapes removed FAIL1: some replacements not done because of bad type of subshape
	:param status:
	:type status: ShapeExtend_Status
	:rtype: bool") Status;
		virtual Standard_Boolean Status (const ShapeExtend_Status status);

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
		/****************** CombineVertex ******************/
		%feature("compactdefaultargs") CombineVertex;
		%feature("autodoc", "* Combines new vertex from two others. This new one is the smallest vertex which comprises both of the source vertices. The function takes into account the positions and tolerances of the source vertices. The tolerance of the new vertex will be equal to the minimal tolerance that is required to comprise source vertices multiplied by tolFactor (in order to avoid errors because of discreteness of calculations).
	:param V1:
	:type V1: TopoDS_Vertex
	:param V2:
	:type V2: TopoDS_Vertex
	:param tolFactor: default value is 1.0001
	:type tolFactor: float
	:rtype: TopoDS_Vertex") CombineVertex;
		TopoDS_Vertex CombineVertex (const TopoDS_Vertex & V1,const TopoDS_Vertex & V2,const Standard_Real tolFactor = 1.0001);

		/****************** CombineVertex ******************/
		%feature("compactdefaultargs") CombineVertex;
		%feature("autodoc", "* The same function as above, except that it accepts two points and two tolerances instead of vertices
	:param pnt1:
	:type pnt1: gp_Pnt
	:param pnt2:
	:type pnt2: gp_Pnt
	:param tol1:
	:type tol1: float
	:param tol2:
	:type tol2: float
	:param tolFactor: default value is 1.0001
	:type tolFactor: float
	:rtype: TopoDS_Vertex") CombineVertex;
		TopoDS_Vertex CombineVertex (const gp_Pnt & pnt1,const gp_Pnt & pnt2,const Standard_Real tol1,const Standard_Real tol2,const Standard_Real tolFactor = 1.0001);

};


%extend ShapeBuild_Vertex {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
