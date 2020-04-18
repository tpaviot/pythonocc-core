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
%define BREPFILLETAPIDOCSTRING
"BRepFilletAPI module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_brepfilletapi.html"
%enddef
%module (package="OCC.Core", docstring=BREPFILLETAPIDOCSTRING) BRepFilletAPI


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
#include<BRepFilletAPI_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<BRepBuilderAPI_module.hxx>
#include<TopoDS_module.hxx>
#include<ChFiDS_module.hxx>
#include<TopTools_module.hxx>
#include<ChFi2d_module.hxx>
#include<TopOpeBRepBuild_module.hxx>
#include<ChFi3d_module.hxx>
#include<Law_module.hxx>
#include<TColgp_module.hxx>
#include<Geom_module.hxx>
#include<GeomAbs_module.hxx>
#include<Adaptor3d_module.hxx>
#include<GeomAdaptor_module.hxx>
#include<Geom2d_module.hxx>
#include<GeomFill_module.hxx>
#include<BRep_module.hxx>
#include<Geom2d_module.hxx>
#include<BRepAdaptor_module.hxx>
#include<Adaptor2d_module.hxx>
#include<BRepTools_module.hxx>
#include<Approx_module.hxx>
#include<TopLoc_module.hxx>
#include<TopOpeBRepDS_module.hxx>
#include<Extrema_module.hxx>
#include<Approx_module.hxx>
#include<BRepBlend_module.hxx>
#include<Message_module.hxx>
#include<TopOpeBRepTool_module.hxx>
#include<Geom2dAdaptor_module.hxx>
#include<BRepAdaptor_module.hxx>
#include<AppParCurves_module.hxx>
#include<Bnd_module.hxx>
#include<Poly_module.hxx>
#include<TColGeom_module.hxx>
#include<TShort_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import BRepBuilderAPI.i
%import TopoDS.i
%import ChFiDS.i
%import TopTools.i
%import ChFi2d.i
%import TopOpeBRepBuild.i
%import ChFi3d.i
%import Law.i
%import TColgp.i
%import Geom.i
%import GeomAbs.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
/* end public enums declaration */

/* python proy classes for enums */
%pythoncode {
};
/* end python proxy for enums */

/* handles */
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/*************************************
* class BRepFilletAPI_LocalOperation *
*************************************/
%nodefaultctor BRepFilletAPI_LocalOperation;
class BRepFilletAPI_LocalOperation : public BRepBuilderAPI_MakeShape {
	public:
		/****************** Abscissa ******************/
		%feature("compactdefaultargs") Abscissa;
		%feature("autodoc", "Returns the abscissa of the vertex v on the contour of index ic.

Parameters
----------
IC: int
V: TopoDS_Vertex

Returns
-------
float
") Abscissa;
		virtual Standard_Real Abscissa(const Standard_Integer IC, const TopoDS_Vertex & V);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Adds a contour in the builder (builds a contour of tangent edges).

Parameters
----------
E: TopoDS_Edge

Returns
-------
None
") Add;
		virtual void Add(const TopoDS_Edge & E);

		/****************** Closed ******************/
		%feature("compactdefaultargs") Closed;
		%feature("autodoc", "Returns true if the contour of index ic is closed.

Parameters
----------
IC: int

Returns
-------
bool
") Closed;
		virtual Standard_Boolean Closed(const Standard_Integer IC);

		/****************** ClosedAndTangent ******************/
		%feature("compactdefaultargs") ClosedAndTangent;
		%feature("autodoc", "Returns true if the contour of index ic is closed an tangent.

Parameters
----------
IC: int

Returns
-------
bool
") ClosedAndTangent;
		virtual Standard_Boolean ClosedAndTangent(const Standard_Integer IC);

		/****************** Contour ******************/
		%feature("compactdefaultargs") Contour;
		%feature("autodoc", "Returns the index of the contour containing the edge e, returns 0 if e doesn't belong to any contour.

Parameters
----------
E: TopoDS_Edge

Returns
-------
int
") Contour;
		virtual Standard_Integer Contour(const TopoDS_Edge & E);

		/****************** Edge ******************/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "Returns the edge j in the contour i.

Parameters
----------
I: int
J: int

Returns
-------
TopoDS_Edge
") Edge;
		virtual const TopoDS_Edge Edge(const Standard_Integer I, const Standard_Integer J);

		/****************** FirstVertex ******************/
		%feature("compactdefaultargs") FirstVertex;
		%feature("autodoc", "Returns the first vertex of the contour of index ic.

Parameters
----------
IC: int

Returns
-------
TopoDS_Vertex
") FirstVertex;
		virtual TopoDS_Vertex FirstVertex(const Standard_Integer IC);

		/****************** LastVertex ******************/
		%feature("compactdefaultargs") LastVertex;
		%feature("autodoc", "Returns the last vertex of the contour of index ic.

Parameters
----------
IC: int

Returns
-------
TopoDS_Vertex
") LastVertex;
		virtual TopoDS_Vertex LastVertex(const Standard_Integer IC);

		/****************** Length ******************/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "Returns the length the contour of index ic.

Parameters
----------
IC: int

Returns
-------
float
") Length;
		virtual Standard_Real Length(const Standard_Integer IC);

		/****************** NbContours ******************/
		%feature("compactdefaultargs") NbContours;
		%feature("autodoc", "Number of contours.

Returns
-------
int
") NbContours;
		virtual Standard_Integer NbContours();

		/****************** NbEdges ******************/
		%feature("compactdefaultargs") NbEdges;
		%feature("autodoc", "Number of edges in the contour i.

Parameters
----------
I: int

Returns
-------
int
") NbEdges;
		virtual Standard_Integer NbEdges(const Standard_Integer I);

		/****************** NbSurf ******************/
		%feature("compactdefaultargs") NbSurf;
		%feature("autodoc", "No available documentation.

Parameters
----------
IC: int

Returns
-------
int
") NbSurf;
		virtual Standard_Integer NbSurf(const Standard_Integer IC);

		/****************** RelativeAbscissa ******************/
		%feature("compactdefaultargs") RelativeAbscissa;
		%feature("autodoc", "Returns the relative abscissa([0.,1.]) of the vertex v on the contour of index ic.

Parameters
----------
IC: int
V: TopoDS_Vertex

Returns
-------
float
") RelativeAbscissa;
		virtual Standard_Real RelativeAbscissa(const Standard_Integer IC, const TopoDS_Vertex & V);

		/****************** Remove ******************/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "Remove the contour containing the edge e.

Parameters
----------
E: TopoDS_Edge

Returns
-------
None
") Remove;
		virtual void Remove(const TopoDS_Edge & E);

		/****************** Reset ******************/
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", "Reset all the fields updated by build operation and leave the algorithm in the same state than before build call. it allows contours and radius modifications to build the result another time.

Returns
-------
None
") Reset;
		virtual void Reset();

		/****************** ResetContour ******************/
		%feature("compactdefaultargs") ResetContour;
		%feature("autodoc", "Reset the contour of index ic, there is nomore information in the contour.

Parameters
----------
IC: int

Returns
-------
None
") ResetContour;
		virtual void ResetContour(const Standard_Integer IC);

		/****************** Sect ******************/
		%feature("compactdefaultargs") Sect;
		%feature("autodoc", "No available documentation.

Parameters
----------
IC: int
IS: int

Returns
-------
opencascade::handle<ChFiDS_SecHArray1>
") Sect;
		virtual opencascade::handle<ChFiDS_SecHArray1> Sect(const Standard_Integer IC, const Standard_Integer IS);

		/****************** Simulate ******************/
		%feature("compactdefaultargs") Simulate;
		%feature("autodoc", "No available documentation.

Parameters
----------
IC: int

Returns
-------
None
") Simulate;
		virtual void Simulate(const Standard_Integer IC);

};


%extend BRepFilletAPI_LocalOperation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class BRepFilletAPI_MakeFillet2d *
***********************************/
class BRepFilletAPI_MakeFillet2d : public BRepBuilderAPI_MakeShape {
	public:
		/****************** BRepFilletAPI_MakeFillet2d ******************/
		%feature("compactdefaultargs") BRepFilletAPI_MakeFillet2d;
		%feature("autodoc", "Initializes an empty algorithm for computing fillets and chamfers. the face on which the fillets and chamfers are built is defined using the init function. the vertices on which fillets or chamfers are built are defined using the addfillet or addchamfer function. warning the status of the initialization, as given by the status function, can be one of the following: - chfi2d_ready if the initialization is correct, - chfi2d_notplanar if f is not planar, - chfi2d_noface if f is a null face.

Returns
-------
None
") BRepFilletAPI_MakeFillet2d;
		 BRepFilletAPI_MakeFillet2d();

		/****************** BRepFilletAPI_MakeFillet2d ******************/
		%feature("compactdefaultargs") BRepFilletAPI_MakeFillet2d;
		%feature("autodoc", "Initializes an algorithm for computing fillets and chamfers on the face f. the vertices on which fillets or chamfers are built are defined using the addfillet or addchamfer function. warning the status of the initialization, as given by the status function, can be one of the following: - chfi2d_ready if the initialization is correct, - chfi2d_notplanar if f is not planar, - chfi2d_noface if f is a null face.

Parameters
----------
F: TopoDS_Face

Returns
-------
None
") BRepFilletAPI_MakeFillet2d;
		 BRepFilletAPI_MakeFillet2d(const TopoDS_Face & F);

		/****************** AddChamfer ******************/
		%feature("compactdefaultargs") AddChamfer;
		%feature("autodoc", "Adds a chamfer on the face modified by this algorithm between the two adjacent edges e1 and e2, where the extremities of the chamfer are on e1 and e2 at distances d1 and d2 respectively in cases where the edges are not rectilinear, distances are measured using the curvilinear abscissa of the edges and the angle is measured with respect to the tangent at the corresponding point. the angle ang is given in radians. this function returns the chamfer and builds the resulting face.

Parameters
----------
E1: TopoDS_Edge
E2: TopoDS_Edge
D1: float
D2: float

Returns
-------
TopoDS_Edge
") AddChamfer;
		TopoDS_Edge AddChamfer(const TopoDS_Edge & E1, const TopoDS_Edge & E2, const Standard_Real D1, const Standard_Real D2);

		/****************** AddChamfer ******************/
		%feature("compactdefaultargs") AddChamfer;
		%feature("autodoc", "Adds a chamfer on the face modified by this algorithm between the two edges connected by the vertex v, where e is one of the two edges. the chamfer makes an angle ang with e and one of its extremities is on e at distance d from v. in cases where the edges are not rectilinear, distances are measured using the curvilinear abscissa of the edges and the angle is measured with respect to the tangent at the corresponding point. the angle ang is given in radians. this function returns the chamfer and builds the resulting face. warning the status of the construction, as given by the status function, can be one of the following: - chfi2d_isdone if the chamfer is built, - chfi2d_parameterserror if d1, d2, d or ang is less than or equal to zero, - chfi2d_connexionerror if: - the edge e, e1 or e2 does not belong to the initial face, or - the edges e1 and e2 are not adjacent, or - the vertex v is not one of the limit points of the edge e, - chfi2d_computationerror if the parameters of the chamfer are too large to build a chamfer between the two adjacent edges, - chfi2d_notauthorized if: - the edge e1, e2 or one of the two edges connected to v is a fillet or chamfer, or - a curve other than a straight line or an arc of a circle is used as e, e1 or e2. do not use the returned chamfer if the status of the construction is not chfi2d_isdone.

Parameters
----------
E: TopoDS_Edge
V: TopoDS_Vertex
D: float
Ang: float

Returns
-------
TopoDS_Edge
") AddChamfer;
		TopoDS_Edge AddChamfer(const TopoDS_Edge & E, const TopoDS_Vertex & V, const Standard_Real D, const Standard_Real Ang);

		/****************** AddFillet ******************/
		%feature("compactdefaultargs") AddFillet;
		%feature("autodoc", "Adds a fillet of radius radius between the two edges adjacent to the vertex v on the face modified by this algorithm. the two edges do not need to be rectilinear. this function returns the fillet and builds the resulting face. warning the status of the construction, as given by the status function, can be one of the following: - chfi2d_isdone if the fillet is built, - chfi2d_connexionerror if v does not belong to the initial face, - chfi2d_computationerror if radius is too large to build a fillet between the two adjacent edges, - chfi2d_notauthorized - if one of the two edges connected to v is a fillet or chamfer, or - if a curve other than a straight line or an arc of a circle is used as e, e1 or e2. do not use the returned fillet if the status of the construction is not chfi2d_isdone. exceptions standard_negativevalue if radius is less than or equal to zero.

Parameters
----------
V: TopoDS_Vertex
Radius: float

Returns
-------
TopoDS_Edge
") AddFillet;
		TopoDS_Edge AddFillet(const TopoDS_Vertex & V, const Standard_Real Radius);

		/****************** BasisEdge ******************/
		%feature("compactdefaultargs") BasisEdge;
		%feature("autodoc", "Returns the basis edge on the face modified by this algorithm from which the chamfered or filleted edge e is built. if e has not been modified, this function returns e. warning e is returned if it does not belong to the initial face.

Parameters
----------
E: TopoDS_Edge

Returns
-------
TopoDS_Edge
") BasisEdge;
		const TopoDS_Edge BasisEdge(const TopoDS_Edge & E);

		/****************** Build ******************/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "Update the result and set the done flag.

Returns
-------
None
") Build;
		virtual void Build();

		/****************** ChamferEdges ******************/
		%feature("compactdefaultargs") ChamferEdges;
		%feature("autodoc", "Returns the table of chamfers on the face modified by this algorithm.

Returns
-------
TopTools_SequenceOfShape
") ChamferEdges;
		const TopTools_SequenceOfShape & ChamferEdges();

		/****************** DescendantEdge ******************/
		%feature("compactdefaultargs") DescendantEdge;
		%feature("autodoc", "Returns the chamfered or filleted edge built from the edge e on the face modified by this algorithm. if e has not been modified, this function returns e. exceptions standard_nosuchobject if the edge e does not belong to the initial face.

Parameters
----------
E: TopoDS_Edge

Returns
-------
TopoDS_Edge
") DescendantEdge;
		const TopoDS_Edge DescendantEdge(const TopoDS_Edge & E);

		/****************** FilletEdges ******************/
		%feature("compactdefaultargs") FilletEdges;
		%feature("autodoc", "Returns the table of fillets on the face modified by this algorithm.

Returns
-------
TopTools_SequenceOfShape
") FilletEdges;
		const TopTools_SequenceOfShape & FilletEdges();

		/****************** HasDescendant ******************/
		%feature("compactdefaultargs") HasDescendant;
		%feature("autodoc", "No available documentation.

Parameters
----------
E: TopoDS_Edge

Returns
-------
bool
") HasDescendant;
		Standard_Boolean HasDescendant(const TopoDS_Edge & E);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initializes this algorithm for constructing fillets or chamfers with the face f. warning the status of the initialization, as given by the status function, can be one of the following: - chfi2d_ready if the initialization is correct, - chfi2d_notplanar if f is not planar, - chfi2d_noface if f is a null face.

Parameters
----------
F: TopoDS_Face

Returns
-------
None
") Init;
		void Init(const TopoDS_Face & F);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "This initialize method allow to init the builder from a face <refface> and another face <modface> which derive from <refface>. this is usefull to modify a fillet or a chamfer already created on <modface> .

Parameters
----------
RefFace: TopoDS_Face
ModFace: TopoDS_Face

Returns
-------
None
") Init;
		void Init(const TopoDS_Face & RefFace, const TopoDS_Face & ModFace);

		/****************** IsModified ******************/
		%feature("compactdefaultargs") IsModified;
		%feature("autodoc", "Returns true if the edge e on the face modified by this algorithm is chamfered or filleted. warning returns false if e does not belong to the face modified by this algorithm.

Parameters
----------
E: TopoDS_Edge

Returns
-------
bool
") IsModified;
		Standard_Boolean IsModified(const TopoDS_Edge & E);

		/****************** Modified ******************/
		%feature("compactdefaultargs") Modified;
		%feature("autodoc", "Returns the list of shapes modified from the shape <s>.

Parameters
----------
S: TopoDS_Shape

Returns
-------
TopTools_ListOfShape
") Modified;
		virtual const TopTools_ListOfShape & Modified(const TopoDS_Shape & S);

		/****************** ModifyChamfer ******************/
		%feature("compactdefaultargs") ModifyChamfer;
		%feature("autodoc", "Modifies the chamfer chamfer on the face modified by this algorithm, where: e1 and e2 are the two adjacent edges on which chamfer is already built; the extremities of the new chamfer are on e1 and e2 at distances d1 and d2 respectively.

Parameters
----------
Chamfer: TopoDS_Edge
E1: TopoDS_Edge
E2: TopoDS_Edge
D1: float
D2: float

Returns
-------
TopoDS_Edge
") ModifyChamfer;
		TopoDS_Edge ModifyChamfer(const TopoDS_Edge & Chamfer, const TopoDS_Edge & E1, const TopoDS_Edge & E2, const Standard_Real D1, const Standard_Real D2);

		/****************** ModifyChamfer ******************/
		%feature("compactdefaultargs") ModifyChamfer;
		%feature("autodoc", "Modifies the chamfer chamfer on the face modified by this algorithm, where: e is one of the two adjacent edges on which chamfer is already built; the new chamfer makes an angle ang with e and one of its extremities is on e at distance d from the vertex on which the chamfer is built. in cases where the edges are not rectilinear, the distances are measured using the curvilinear abscissa of the edges and the angle is measured with respect to the tangent at the corresponding point. the angle ang is given in radians. this function returns the new chamfer and modifies the existing face. warning the status of the construction, as given by the status function, can be one of the following: - chfi2d_isdone if the chamfer is built, - chfi2d_parameterserror if d1, d2, d or ang is less than or equal to zero, - chfi2d_connexionerror if: - the edge e, e1, e2 or chamfer does not belong to the existing face, or - the edges e1 and e2 are not adjacent, - chfi2d_computationerror if the parameters of the chamfer are too large to build a chamfer between the two adjacent edges, - chfi2d_notauthorized if e1 or e2 is a fillet or chamfer. do not use the returned chamfer if the status of the construction is not chfi2d_isdone.

Parameters
----------
Chamfer: TopoDS_Edge
E: TopoDS_Edge
D: float
Ang: float

Returns
-------
TopoDS_Edge
") ModifyChamfer;
		TopoDS_Edge ModifyChamfer(const TopoDS_Edge & Chamfer, const TopoDS_Edge & E, const Standard_Real D, const Standard_Real Ang);

		/****************** ModifyFillet ******************/
		%feature("compactdefaultargs") ModifyFillet;
		%feature("autodoc", "Assigns the radius radius to the fillet fillet already built on the face modified by this algorithm. this function returns the new fillet and modifies the existing face. warning the status of the construction, as given by the status function, can be one of the following: - chfi2d_isdone if the new fillet is built, - chfi2d_connexionerror if fillet does not belong to the existing face, - chfi2d_computationerror if radius is too large to build a fillet between the two adjacent edges. do not use the returned fillet if the status of the construction is not chfi2d_isdone. exceptions standard_negativevalue if radius is less than or equal to zero.

Parameters
----------
Fillet: TopoDS_Edge
Radius: float

Returns
-------
TopoDS_Edge
") ModifyFillet;
		TopoDS_Edge ModifyFillet(const TopoDS_Edge & Fillet, const Standard_Real Radius);

		/****************** NbChamfer ******************/
		%feature("compactdefaultargs") NbChamfer;
		%feature("autodoc", "Returns the number of chamfers on the face modified by this algorithm.

Returns
-------
int
") NbChamfer;
		Standard_Integer NbChamfer();

		/****************** NbCurves ******************/
		%feature("compactdefaultargs") NbCurves;
		%feature("autodoc", "Returns the number of new curves after the shape creation.

Returns
-------
int
") NbCurves;
		Standard_Integer NbCurves();

		/****************** NbFillet ******************/
		%feature("compactdefaultargs") NbFillet;
		%feature("autodoc", "Returns the number of fillets on the face modified by this algorithm.

Returns
-------
int
") NbFillet;
		Standard_Integer NbFillet();

		/****************** NewEdges ******************/
		%feature("compactdefaultargs") NewEdges;
		%feature("autodoc", "Return the edges created for curve i.

Parameters
----------
I: int

Returns
-------
TopTools_ListOfShape
") NewEdges;
		const TopTools_ListOfShape & NewEdges(const Standard_Integer I);

		/****************** RemoveChamfer ******************/
		%feature("compactdefaultargs") RemoveChamfer;
		%feature("autodoc", "Removes the chamfer chamfer already built on the face modified by this algorithm. this function returns the vertex connecting the two adjacent edges of chamfer and modifies the existing face. warning - the returned vertex is only valid if the status function returns chfi2d_isdone. - a null vertex is returned if the edge chamfer does not belong to the initial face.

Parameters
----------
Chamfer: TopoDS_Edge

Returns
-------
TopoDS_Vertex
") RemoveChamfer;
		TopoDS_Vertex RemoveChamfer(const TopoDS_Edge & Chamfer);

		/****************** RemoveFillet ******************/
		%feature("compactdefaultargs") RemoveFillet;
		%feature("autodoc", "Removes the fillet fillet already built on the face modified by this algorithm. this function returns the vertex connecting the two adjacent edges of fillet and modifies the existing face. warning - the returned vertex is only valid if the status function returns chfi2d_isdone. - a null vertex is returned if the edge fillet does not belong to the initial face.

Parameters
----------
Fillet: TopoDS_Edge

Returns
-------
TopoDS_Vertex
") RemoveFillet;
		TopoDS_Vertex RemoveFillet(const TopoDS_Edge & Fillet);

		/****************** Status ******************/
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "No available documentation.

Returns
-------
ChFi2d_ConstructionError
") Status;
		ChFi2d_ConstructionError Status();

};


%extend BRepFilletAPI_MakeFillet2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class BRepFilletAPI_MakeChamfer *
**********************************/
class BRepFilletAPI_MakeChamfer : public BRepFilletAPI_LocalOperation {
	public:
		/****************** BRepFilletAPI_MakeChamfer ******************/
		%feature("compactdefaultargs") BRepFilletAPI_MakeChamfer;
		%feature("autodoc", "Initializes an algorithm for computing chamfers on the shape s. the edges on which chamfers are built are defined using the add function.

Parameters
----------
S: TopoDS_Shape

Returns
-------
None
") BRepFilletAPI_MakeChamfer;
		 BRepFilletAPI_MakeChamfer(const TopoDS_Shape & S);

		/****************** Abscissa ******************/
		%feature("compactdefaultargs") Abscissa;
		%feature("autodoc", "Returns the curvilinear abscissa of the vertex v on the contour of index ic in the internal data structure of this algorithm. warning returns -1. if: - ic is outside the bounds of the table of contours, or - v is not on the contour of index ic.

Parameters
----------
IC: int
V: TopoDS_Vertex

Returns
-------
float
") Abscissa;
		Standard_Real Abscissa(const Standard_Integer IC, const TopoDS_Vertex & V);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Adds edge e to the table of edges used by this algorithm to build chamfers, where the parameters of the chamfer must be set after the.

Parameters
----------
E: TopoDS_Edge

Returns
-------
None
") Add;
		void Add(const TopoDS_Edge & E);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Adds edge e to the table of edges used by this algorithm to build chamfers, where the parameters of the chamfer are given by the distance dis (symmetric chamfer). the add function results in a contour being built by propagation from the edge e (i.e. the contour contains at least this edge). this contour is composed of edges of the shape which are tangential to one another and which delimit two series of tangential faces, with one series of faces being located on either side of the contour. warning nothing is done if edge e or the face f does not belong to the initial shape.

Parameters
----------
Dis: float
E: TopoDS_Edge

Returns
-------
None
") Add;
		void Add(const Standard_Real Dis, const TopoDS_Edge & E);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Adds edge e to the table of edges used by this algorithm to build chamfers, where the parameters of the chamfer are given by the two distances dis1 and dis2; the face f identifies the side where dis1 is measured. the add function results in a contour being built by propagation from the edge e (i.e. the contour contains at least this edge). this contour is composed of edges of the shape which are tangential to one another and which delimit two series of tangential faces, with one series of faces being located on either side of the contour. warning nothing is done if edge e or the face f does not belong to the initial shape.

Parameters
----------
Dis1: float
Dis2: float
E: TopoDS_Edge
F: TopoDS_Face

Returns
-------
None
") Add;
		void Add(const Standard_Real Dis1, const Standard_Real Dis2, const TopoDS_Edge & E, const TopoDS_Face & F);

		/****************** AddDA ******************/
		%feature("compactdefaultargs") AddDA;
		%feature("autodoc", "Adds a fillet contour in the builder (builds a contour of tangent edges to <e> and sets the distance <dis1> and angle <angle> ( parameters of the chamfer ) ).

Parameters
----------
Dis: float
Angle: float
E: TopoDS_Edge
F: TopoDS_Face

Returns
-------
None
") AddDA;
		void AddDA(const Standard_Real Dis, const Standard_Real Angle, const TopoDS_Edge & E, const TopoDS_Face & F);

		/****************** Build ******************/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "Builds the chamfers on all the contours in the internal data structure of this algorithm and constructs the resulting shape. use the function isdone to verify that the chamfered shape is built. use the function shape to retrieve the chamfered shape. warning the construction of chamfers implements highly complex construction algorithms. consequently, there may be instances where the algorithm fails, for example if the data defining the parameters of the chamfer is not compatible with the geometry of the initial shape. there is no initial analysis of errors and these only become evident at the construction stage. additionally, in the current software release, the following cases are not handled: - the end point of the contour is the point of intersection of 4 or more edges of the shape, or - the intersection of the chamfer with a face which limits the contour is not fully contained in this face.

Returns
-------
None
") Build;
		virtual void Build();

		/****************** Builder ******************/
		%feature("compactdefaultargs") Builder;
		%feature("autodoc", "Returns the internal filleting algorithm.

Returns
-------
opencascade::handle<TopOpeBRepBuild_HBuilder>
") Builder;
		opencascade::handle<TopOpeBRepBuild_HBuilder> Builder();

		/****************** Closed ******************/
		%feature("compactdefaultargs") Closed;
		%feature("autodoc", "Returns true if the contour of index ic in the internal data structure of this algorithm is closed. warning returns false if ic is outside the bounds of the table of contours.

Parameters
----------
IC: int

Returns
-------
bool
") Closed;
		Standard_Boolean Closed(const Standard_Integer IC);

		/****************** ClosedAndTangent ******************/
		%feature("compactdefaultargs") ClosedAndTangent;
		%feature("autodoc", "Eturns true if the contour of index ic in the internal data structure of this algorithm is closed and tangential at the point of closure. warning returns false if ic is outside the bounds of the table of contours.

Parameters
----------
IC: int

Returns
-------
bool
") ClosedAndTangent;
		Standard_Boolean ClosedAndTangent(const Standard_Integer IC);

		/****************** Contour ******************/
		%feature("compactdefaultargs") Contour;
		%feature("autodoc", "Returns the index of the contour in the internal data structure of this algorithm, which contains the edge e of the shape. this function returns 0 if the edge e does not belong to any contour. warning this index can change if a contour is removed from the internal data structure of this algorithm using the function remove.

Parameters
----------
E: TopoDS_Edge

Returns
-------
int
") Contour;
		Standard_Integer Contour(const TopoDS_Edge & E);

		/****************** Dists ******************/
		%feature("compactdefaultargs") Dists;
		%feature("autodoc", "Returns the distances dis1 and dis2 which give the parameters of the chamfer along the contour of index ic in the internal data structure of this algorithm. warning -1. is returned if ic is outside the bounds of the table of contours.

Parameters
----------
IC: int

Returns
-------
Dis1: float
Dis2: float
") Dists;
		void Dists(const Standard_Integer IC, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Edge ******************/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "Returns the edge of index j in the contour of index i in the internal data structure of this algorithm. warning returns a null shape if: - i is outside the bounds of the table of contours, or - j is outside the bounds of the table of edges of the contour of index i.

Parameters
----------
I: int
J: int

Returns
-------
TopoDS_Edge
") Edge;
		const TopoDS_Edge Edge(const Standard_Integer I, const Standard_Integer J);

		/****************** FirstVertex ******************/
		%feature("compactdefaultargs") FirstVertex;
		%feature("autodoc", "Returns the first vertex of the contour of index ic in the internal data structure of this algorithm. warning returns a null shape if ic is outside the bounds of the table of contours.

Parameters
----------
IC: int

Returns
-------
TopoDS_Vertex
") FirstVertex;
		TopoDS_Vertex FirstVertex(const Standard_Integer IC);

		/****************** Generated ******************/
		%feature("compactdefaultargs") Generated;
		%feature("autodoc", "Returns the list of shapes generated from the shape <eorv>.

Parameters
----------
EorV: TopoDS_Shape

Returns
-------
TopTools_ListOfShape
") Generated;
		virtual const TopTools_ListOfShape & Generated(const TopoDS_Shape & EorV);

		/****************** GetDist ******************/
		%feature("compactdefaultargs") GetDist;
		%feature("autodoc", "No available documentation.

Parameters
----------
IC: int

Returns
-------
Dis: float
") GetDist;
		void GetDist(const Standard_Integer IC, Standard_Real &OutValue);

		/****************** GetDistAngle ******************/
		%feature("compactdefaultargs") GetDistAngle;
		%feature("autodoc", "Gives the distances <dis> and <angle> of the fillet contour of index <ic> in the ds.

Parameters
----------
IC: int

Returns
-------
Dis: float
Angle: float
") GetDistAngle;
		void GetDistAngle(const Standard_Integer IC, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** IsDeleted ******************/
		%feature("compactdefaultargs") IsDeleted;
		%feature("autodoc", "No available documentation.

Parameters
----------
F: TopoDS_Shape

Returns
-------
bool
") IsDeleted;
		virtual Standard_Boolean IsDeleted(const TopoDS_Shape & F);

		/****************** IsDistanceAngle ******************/
		%feature("compactdefaultargs") IsDistanceAngle;
		%feature("autodoc", "Return true if chamfer is made with distance and angle false else.

Parameters
----------
IC: int

Returns
-------
bool
") IsDistanceAngle;
		Standard_Boolean IsDistanceAngle(const Standard_Integer IC);

		/****************** IsSymetric ******************/
		%feature("compactdefaultargs") IsSymetric;
		%feature("autodoc", "Return true if chamfer symetric false else.

Parameters
----------
IC: int

Returns
-------
bool
") IsSymetric;
		Standard_Boolean IsSymetric(const Standard_Integer IC);

		/****************** IsTwoDistances ******************/
		%feature("compactdefaultargs") IsTwoDistances;
		%feature("autodoc", "Return true if chamfer is made with two distances false else.

Parameters
----------
IC: int

Returns
-------
bool
") IsTwoDistances;
		Standard_Boolean IsTwoDistances(const Standard_Integer IC);

		/****************** LastVertex ******************/
		%feature("compactdefaultargs") LastVertex;
		%feature("autodoc", "Returns the last vertex of the contour of index ic in the internal data structure of this algorithm. warning returns a null shape if ic is outside the bounds of the table of contours.

Parameters
----------
IC: int

Returns
-------
TopoDS_Vertex
") LastVertex;
		TopoDS_Vertex LastVertex(const Standard_Integer IC);

		/****************** Length ******************/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "Returns the length of the contour of index ic in the internal data structure of this algorithm. warning returns -1. if ic is outside the bounds of the table of contours.

Parameters
----------
IC: int

Returns
-------
float
") Length;
		Standard_Real Length(const Standard_Integer IC);

		/****************** Modified ******************/
		%feature("compactdefaultargs") Modified;
		%feature("autodoc", "Returns the list of shapes modified from the shape <f>.

Parameters
----------
F: TopoDS_Shape

Returns
-------
TopTools_ListOfShape
") Modified;
		virtual const TopTools_ListOfShape & Modified(const TopoDS_Shape & F);

		/****************** NbContours ******************/
		%feature("compactdefaultargs") NbContours;
		%feature("autodoc", "Returns the number of contours generated using the add function in the internal data structure of this algorithm.

Returns
-------
int
") NbContours;
		Standard_Integer NbContours();

		/****************** NbEdges ******************/
		%feature("compactdefaultargs") NbEdges;
		%feature("autodoc", "Returns the number of edges in the contour of index i in the internal data structure of this algorithm. warning returns 0 if i is outside the bounds of the table of contours.

Parameters
----------
I: int

Returns
-------
int
") NbEdges;
		Standard_Integer NbEdges(const Standard_Integer I);

		/****************** NbSurf ******************/
		%feature("compactdefaultargs") NbSurf;
		%feature("autodoc", "No available documentation.

Parameters
----------
IC: int

Returns
-------
int
") NbSurf;
		Standard_Integer NbSurf(const Standard_Integer IC);

		/****************** RelativeAbscissa ******************/
		%feature("compactdefaultargs") RelativeAbscissa;
		%feature("autodoc", "Returns the relative curvilinear abscissa (i.e. between 0 and 1) of the vertex v on the contour of index ic in the internal data structure of this algorithm. warning returns -1. if: - ic is outside the bounds of the table of contours, or - v is not on the contour of index ic.

Parameters
----------
IC: int
V: TopoDS_Vertex

Returns
-------
float
") RelativeAbscissa;
		Standard_Real RelativeAbscissa(const Standard_Integer IC, const TopoDS_Vertex & V);

		/****************** Remove ******************/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "Removes the contour in the internal data structure of this algorithm which contains the edge e of the shape. warning nothing is done if the edge e does not belong to the contour in the internal data structure of this algorithm.

Parameters
----------
E: TopoDS_Edge

Returns
-------
None
") Remove;
		void Remove(const TopoDS_Edge & E);

		/****************** Reset ******************/
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", "Reinitializes this algorithm, thus canceling the effects of the build function. this function allows modifications to be made to the contours and chamfer parameters in order to rebuild the shape.

Returns
-------
None
") Reset;
		void Reset();

		/****************** ResetContour ******************/
		%feature("compactdefaultargs") ResetContour;
		%feature("autodoc", "Erases the chamfer parameters on the contour of index ic in the internal data structure of this algorithm. use the setdists function to reset this data. warning nothing is done if ic is outside the bounds of the table of contours.

Parameters
----------
IC: int

Returns
-------
None
") ResetContour;
		void ResetContour(const Standard_Integer IC);

		/****************** Sect ******************/
		%feature("compactdefaultargs") Sect;
		%feature("autodoc", "No available documentation.

Parameters
----------
IC: int
IS: int

Returns
-------
opencascade::handle<ChFiDS_SecHArray1>
") Sect;
		opencascade::handle<ChFiDS_SecHArray1> Sect(const Standard_Integer IC, const Standard_Integer IS);

		/****************** SetDist ******************/
		%feature("compactdefaultargs") SetDist;
		%feature("autodoc", "Sets the distances dis1 and dis2 which give the parameters of the chamfer along the contour of index ic generated using the add function in the internal data structure of this algorithm. the face f identifies the side where dis1 is measured. warning nothing is done if either the edge e or the face f does not belong to the initial shape.

Parameters
----------
Dis: float
IC: int
F: TopoDS_Face

Returns
-------
None
") SetDist;
		void SetDist(const Standard_Real Dis, const Standard_Integer IC, const TopoDS_Face & F);

		/****************** SetDistAngle ******************/
		%feature("compactdefaultargs") SetDistAngle;
		%feature("autodoc", "Set the distance <dis> and <angle> of the fillet contour of index <ic> in the ds with <dis> on <f>. if the face <f> is not one of common faces of an edge of the contour <ic>.

Parameters
----------
Dis: float
Angle: float
IC: int
F: TopoDS_Face

Returns
-------
None
") SetDistAngle;
		void SetDistAngle(const Standard_Real Dis, const Standard_Real Angle, const Standard_Integer IC, const TopoDS_Face & F);

		/****************** SetDists ******************/
		%feature("compactdefaultargs") SetDists;
		%feature("autodoc", "Sets the distances dis1 and dis2 which give the parameters of the chamfer along the contour of index ic generated using the add function in the internal data structure of this algorithm. the face f identifies the side where dis1 is measured. warning nothing is done if either the edge e or the face f does not belong to the initial shape.

Parameters
----------
Dis1: float
Dis2: float
IC: int
F: TopoDS_Face

Returns
-------
None
") SetDists;
		void SetDists(const Standard_Real Dis1, const Standard_Real Dis2, const Standard_Integer IC, const TopoDS_Face & F);

		/****************** SetMode ******************/
		%feature("compactdefaultargs") SetMode;
		%feature("autodoc", "Sets the mode of chamfer.

Parameters
----------
theMode: ChFiDS_ChamfMode

Returns
-------
None
") SetMode;
		void SetMode(const ChFiDS_ChamfMode theMode);

		/****************** Simulate ******************/
		%feature("compactdefaultargs") Simulate;
		%feature("autodoc", "No available documentation.

Parameters
----------
IC: int

Returns
-------
None
") Simulate;
		void Simulate(const Standard_Integer IC);

};


%extend BRepFilletAPI_MakeChamfer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class BRepFilletAPI_MakeFillet *
*********************************/
class BRepFilletAPI_MakeFillet : public BRepFilletAPI_LocalOperation {
	public:
		/****************** BRepFilletAPI_MakeFillet ******************/
		%feature("compactdefaultargs") BRepFilletAPI_MakeFillet;
		%feature("autodoc", "Initializes the computation of the fillets. <fshape> sets the type of fillet surface. the default value is chfi3d_rational (classical nurbs representation of circles). chfi3d_quasiangular corresponds to a nurbs representation of circles which parameterisation matches the circle one. chfi3d_polynomial corresponds to a polynomial representation of circles.

Parameters
----------
S: TopoDS_Shape
FShape: ChFi3d_FilletShape,optional
	default value is ChFi3d_Rational

Returns
-------
None
") BRepFilletAPI_MakeFillet;
		 BRepFilletAPI_MakeFillet(const TopoDS_Shape & S, const ChFi3d_FilletShape FShape = ChFi3d_Rational);

		/****************** Abscissa ******************/
		%feature("compactdefaultargs") Abscissa;
		%feature("autodoc", "Returns the curvilinear abscissa of the vertex v on the contour of index ic in the internal data structure of this algorithm. warning returns -1. if: - ic is outside the bounds of the table of contours, or - v is not on the contour of index ic.

Parameters
----------
IC: int
V: TopoDS_Vertex

Returns
-------
float
") Abscissa;
		Standard_Real Abscissa(const Standard_Integer IC, const TopoDS_Vertex & V);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Adds a fillet contour in the builder (builds a contour of tangent edges). the radius must be set after.

Parameters
----------
E: TopoDS_Edge

Returns
-------
None
") Add;
		void Add(const TopoDS_Edge & E);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Adds a fillet description in the builder - builds a contour of tangent edges, - sets the radius.

Parameters
----------
Radius: float
E: TopoDS_Edge

Returns
-------
None
") Add;
		void Add(const Standard_Real Radius, const TopoDS_Edge & E);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Adds a fillet description in the builder - builds a contour of tangent edges, - sets a linear radius evolution law between the first and last vertex of the spine.

Parameters
----------
R1: float
R2: float
E: TopoDS_Edge

Returns
-------
None
") Add;
		void Add(const Standard_Real R1, const Standard_Real R2, const TopoDS_Edge & E);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Adds a fillet description in the builder - builds a contour of tangent edges, - sest the radius evolution law.

Parameters
----------
L: Law_Function
E: TopoDS_Edge

Returns
-------
None
") Add;
		void Add(const opencascade::handle<Law_Function> & L, const TopoDS_Edge & E);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Adds a fillet description in the builder - builds a contour of tangent edges, - sets the radius evolution law interpolating the values given in the array uandr : //! p2d.x() = relative parameter on the spine [0,1] p2d.y() = value of the radius.

Parameters
----------
UandR: TColgp_Array1OfPnt2d
E: TopoDS_Edge

Returns
-------
None
") Add;
		void Add(const TColgp_Array1OfPnt2d & UandR, const TopoDS_Edge & E);

		/****************** BadShape ******************/
		%feature("compactdefaultargs") BadShape;
		%feature("autodoc", "If (hasresult()) returns the partial result.

Returns
-------
TopoDS_Shape
") BadShape;
		TopoDS_Shape BadShape();

		/****************** Build ******************/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "Builds the fillets on all the contours in the internal data structure of this algorithm and constructs the resulting shape. use the function isdone to verify that the filleted shape is built. use the function shape to retrieve the filleted shape. warning the construction of fillets implements highly complex construction algorithms. consequently, there may be instances where the algorithm fails, for example if the data defining the radius of the fillet is not compatible with the geometry of the initial shape. there is no initial analysis of errors and they only become evident at the construction stage. additionally, in the current software release, the following cases are not handled: - the end point of the contour is the point of intersection of 4 or more edges of the shape, or - the intersection of the fillet with a face which limits the contour is not fully contained in this face.

Returns
-------
None
") Build;
		virtual void Build();

		/****************** Builder ******************/
		%feature("compactdefaultargs") Builder;
		%feature("autodoc", "Returns the internal topology building algorithm.

Returns
-------
opencascade::handle<TopOpeBRepBuild_HBuilder>
") Builder;
		opencascade::handle<TopOpeBRepBuild_HBuilder> Builder();

		/****************** Closed ******************/
		%feature("compactdefaultargs") Closed;
		%feature("autodoc", "Returns true if the contour of index ic in the internal data structure of this algorithm is closed. warning returns false if ic is outside the bounds of the table of contours.

Parameters
----------
IC: int

Returns
-------
bool
") Closed;
		Standard_Boolean Closed(const Standard_Integer IC);

		/****************** ClosedAndTangent ******************/
		%feature("compactdefaultargs") ClosedAndTangent;
		%feature("autodoc", "Returns true if the contour of index ic in the internal data structure of this algorithm is closed and tangential at the point of closure. warning returns false if ic is outside the bounds of the table of contours.

Parameters
----------
IC: int

Returns
-------
bool
") ClosedAndTangent;
		Standard_Boolean ClosedAndTangent(const Standard_Integer IC);

		/****************** ComputedSurface ******************/
		%feature("compactdefaultargs") ComputedSurface;
		%feature("autodoc", "Returns the surface number is concerning the contour ic.

Parameters
----------
IC: int
IS: int

Returns
-------
opencascade::handle<Geom_Surface>
") ComputedSurface;
		opencascade::handle<Geom_Surface> ComputedSurface(const Standard_Integer IC, const Standard_Integer IS);

		/****************** Contour ******************/
		%feature("compactdefaultargs") Contour;
		%feature("autodoc", "Returns the index of the contour in the internal data structure of this algorithm which contains the edge e of the shape. this function returns 0 if the edge e does not belong to any contour. warning this index can change if a contour is removed from the internal data structure of this algorithm using the function remove.

Parameters
----------
E: TopoDS_Edge

Returns
-------
int
") Contour;
		Standard_Integer Contour(const TopoDS_Edge & E);

		/****************** Edge ******************/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "Returns the edge of index j in the contour of index i in the internal data structure of this algorithm. warning returns a null shape if: - i is outside the bounds of the table of contours, or - j is outside the bounds of the table of edges of the index i contour.

Parameters
----------
I: int
J: int

Returns
-------
TopoDS_Edge
") Edge;
		const TopoDS_Edge Edge(const Standard_Integer I, const Standard_Integer J);

		/****************** FaultyContour ******************/
		%feature("compactdefaultargs") FaultyContour;
		%feature("autodoc", "For each i in [1.. nbfaultycontours] returns the index ic of the contour where the computation of the fillet failed. the method nbedges(ic) gives the number of edges in the contour ic the method edge(ic,ie) gives the edge number ie of the contour ic.

Parameters
----------
I: int

Returns
-------
int
") FaultyContour;
		Standard_Integer FaultyContour(const Standard_Integer I);

		/****************** FaultyVertex ******************/
		%feature("compactdefaultargs") FaultyVertex;
		%feature("autodoc", "Returns the vertex where the computation failed.

Parameters
----------
IV: int

Returns
-------
TopoDS_Vertex
") FaultyVertex;
		TopoDS_Vertex FaultyVertex(const Standard_Integer IV);

		/****************** FirstVertex ******************/
		%feature("compactdefaultargs") FirstVertex;
		%feature("autodoc", "Returns the first vertex of the contour of index ic in the internal data structure of this algorithm. warning returns a null shape if ic is outside the bounds of the table of contours.

Parameters
----------
IC: int

Returns
-------
TopoDS_Vertex
") FirstVertex;
		TopoDS_Vertex FirstVertex(const Standard_Integer IC);

		/****************** Generated ******************/
		%feature("compactdefaultargs") Generated;
		%feature("autodoc", "Returns the list of shapes generated from the shape <eorv>.

Parameters
----------
EorV: TopoDS_Shape

Returns
-------
TopTools_ListOfShape
") Generated;
		virtual const TopTools_ListOfShape & Generated(const TopoDS_Shape & EorV);

		/****************** GetBounds ******************/
		%feature("compactdefaultargs") GetBounds;
		%feature("autodoc", "No available documentation.

Parameters
----------
IC: int
E: TopoDS_Edge

Returns
-------
F: float
L: float
") GetBounds;
		Standard_Boolean GetBounds(const Standard_Integer IC, const TopoDS_Edge & E, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** GetFilletShape ******************/
		%feature("compactdefaultargs") GetFilletShape;
		%feature("autodoc", "Returns the type of fillet shape built by this algorithm.

Returns
-------
ChFi3d_FilletShape
") GetFilletShape;
		ChFi3d_FilletShape GetFilletShape();

		/****************** GetLaw ******************/
		%feature("compactdefaultargs") GetLaw;
		%feature("autodoc", "No available documentation.

Parameters
----------
IC: int
E: TopoDS_Edge

Returns
-------
opencascade::handle<Law_Function>
") GetLaw;
		opencascade::handle<Law_Function> GetLaw(const Standard_Integer IC, const TopoDS_Edge & E);

		/****************** HasResult ******************/
		%feature("compactdefaultargs") HasResult;
		%feature("autodoc", "Returns true if a part of the result has been computed if the filling in a corner failed a shape with a hole is returned.

Returns
-------
bool
") HasResult;
		Standard_Boolean HasResult();

		/****************** IsConstant ******************/
		%feature("compactdefaultargs") IsConstant;
		%feature("autodoc", "Returns true if the radius of the fillet along the contour of index ic in the internal data structure of this algorithm is constant, warning false is returned if ic is outside the bounds of the table of contours or if e does not belong to the contour of index ic.

Parameters
----------
IC: int

Returns
-------
bool
") IsConstant;
		Standard_Boolean IsConstant(const Standard_Integer IC);

		/****************** IsConstant ******************/
		%feature("compactdefaultargs") IsConstant;
		%feature("autodoc", "Returns true if the radius of the fillet along the edge e of the contour of index ic in the internal data structure of this algorithm is constant. warning false is returned if ic is outside the bounds of the table of contours or if e does not belong to the contour of index ic.

Parameters
----------
IC: int
E: TopoDS_Edge

Returns
-------
bool
") IsConstant;
		Standard_Boolean IsConstant(const Standard_Integer IC, const TopoDS_Edge & E);

		/****************** IsDeleted ******************/
		%feature("compactdefaultargs") IsDeleted;
		%feature("autodoc", "No available documentation.

Parameters
----------
F: TopoDS_Shape

Returns
-------
bool
") IsDeleted;
		virtual Standard_Boolean IsDeleted(const TopoDS_Shape & F);

		/****************** LastVertex ******************/
		%feature("compactdefaultargs") LastVertex;
		%feature("autodoc", "Returns the last vertex of the contour of index ic in the internal data structure of this algorithm. warning returns a null shape if ic is outside the bounds of the table of contours.

Parameters
----------
IC: int

Returns
-------
TopoDS_Vertex
") LastVertex;
		TopoDS_Vertex LastVertex(const Standard_Integer IC);

		/****************** Length ******************/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "Returns the length of the contour of index ic in the internal data structure of this algorithm. warning returns -1. if ic is outside the bounds of the table of contours.

Parameters
----------
IC: int

Returns
-------
float
") Length;
		Standard_Real Length(const Standard_Integer IC);

		/****************** Modified ******************/
		%feature("compactdefaultargs") Modified;
		%feature("autodoc", "Returns the list of shapes modified from the shape <f>.

Parameters
----------
F: TopoDS_Shape

Returns
-------
TopTools_ListOfShape
") Modified;
		virtual const TopTools_ListOfShape & Modified(const TopoDS_Shape & F);

		/****************** NbComputedSurfaces ******************/
		%feature("compactdefaultargs") NbComputedSurfaces;
		%feature("autodoc", "Returns the number of surfaces which have been computed on the contour ic.

Parameters
----------
IC: int

Returns
-------
int
") NbComputedSurfaces;
		Standard_Integer NbComputedSurfaces(const Standard_Integer IC);

		/****************** NbContours ******************/
		%feature("compactdefaultargs") NbContours;
		%feature("autodoc", "Returns the number of contours generated using the add function in the internal data structure of this algorithm.

Returns
-------
int
") NbContours;
		Standard_Integer NbContours();

		/****************** NbEdges ******************/
		%feature("compactdefaultargs") NbEdges;
		%feature("autodoc", "Returns the number of edges in the contour of index i in the internal data structure of this algorithm. warning returns 0 if i is outside the bounds of the table of contours.

Parameters
----------
I: int

Returns
-------
int
") NbEdges;
		Standard_Integer NbEdges(const Standard_Integer I);

		/****************** NbFaultyContours ******************/
		%feature("compactdefaultargs") NbFaultyContours;
		%feature("autodoc", "Returns the number of contours where the computation of the fillet failed.

Returns
-------
int
") NbFaultyContours;
		Standard_Integer NbFaultyContours();

		/****************** NbFaultyVertices ******************/
		%feature("compactdefaultargs") NbFaultyVertices;
		%feature("autodoc", "Returns the number of vertices where the computation failed.

Returns
-------
int
") NbFaultyVertices;
		Standard_Integer NbFaultyVertices();

		/****************** NbSurf ******************/
		%feature("compactdefaultargs") NbSurf;
		%feature("autodoc", "No available documentation.

Parameters
----------
IC: int

Returns
-------
int
") NbSurf;
		Standard_Integer NbSurf(const Standard_Integer IC);

		/****************** NbSurfaces ******************/
		%feature("compactdefaultargs") NbSurfaces;
		%feature("autodoc", "Returns the number of surfaces after the shape creation.

Returns
-------
int
") NbSurfaces;
		Standard_Integer NbSurfaces();

		/****************** NewFaces ******************/
		%feature("compactdefaultargs") NewFaces;
		%feature("autodoc", "Return the faces created for surface <i>.

Parameters
----------
I: int

Returns
-------
TopTools_ListOfShape
") NewFaces;
		const TopTools_ListOfShape & NewFaces(const Standard_Integer I);

		/****************** Radius ******************/
		%feature("compactdefaultargs") Radius;
		%feature("autodoc", "Returns the radius of the fillet along the contour of index ic in the internal data structure of this algorithm warning - use this function only if the radius is constant. - -1. is returned if ic is outside the bounds of the table of contours or if e does not belong to the contour of index ic.

Parameters
----------
IC: int

Returns
-------
float
") Radius;
		Standard_Real Radius(const Standard_Integer IC);

		/****************** Radius ******************/
		%feature("compactdefaultargs") Radius;
		%feature("autodoc", "Returns the radius of the fillet along the edge e of the contour of index ic in the internal data structure of this algorithm. warning - use this function only if the radius is constant. - -1 is returned if ic is outside the bounds of the table of contours or if e does not belong to the contour of index ic.

Parameters
----------
IC: int
E: TopoDS_Edge

Returns
-------
float
") Radius;
		Standard_Real Radius(const Standard_Integer IC, const TopoDS_Edge & E);

		/****************** RelativeAbscissa ******************/
		%feature("compactdefaultargs") RelativeAbscissa;
		%feature("autodoc", "Returns the relative curvilinear abscissa (i.e. between 0 and 1) of the vertex v on the contour of index ic in the internal data structure of this algorithm. warning returns -1. if: - ic is outside the bounds of the table of contours, or - v is not on the contour of index ic.

Parameters
----------
IC: int
V: TopoDS_Vertex

Returns
-------
float
") RelativeAbscissa;
		Standard_Real RelativeAbscissa(const Standard_Integer IC, const TopoDS_Vertex & V);

		/****************** Remove ******************/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "Removes the contour in the internal data structure of this algorithm which contains the edge e of the shape. warning nothing is done if the edge e does not belong to the contour in the internal data structure of this algorithm.

Parameters
----------
E: TopoDS_Edge

Returns
-------
None
") Remove;
		void Remove(const TopoDS_Edge & E);

		/****************** Reset ******************/
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", "Reinitializes this algorithm, thus canceling the effects of the build function. this function allows modifications to be made to the contours and fillet parameters in order to rebuild the shape.

Returns
-------
None
") Reset;
		void Reset();

		/****************** ResetContour ******************/
		%feature("compactdefaultargs") ResetContour;
		%feature("autodoc", "Erases the radius information on the contour of index ic in the internal data structure of this algorithm. use the setradius function to reset this data. warning nothing is done if ic is outside the bounds of the table of contours.

Parameters
----------
IC: int

Returns
-------
None
") ResetContour;
		void ResetContour(const Standard_Integer IC);

		/****************** Sect ******************/
		%feature("compactdefaultargs") Sect;
		%feature("autodoc", "No available documentation.

Parameters
----------
IC: int
IS: int

Returns
-------
opencascade::handle<ChFiDS_SecHArray1>
") Sect;
		opencascade::handle<ChFiDS_SecHArray1> Sect(const Standard_Integer IC, const Standard_Integer IS);

		/****************** SetContinuity ******************/
		%feature("compactdefaultargs") SetContinuity;
		%feature("autodoc", "Changes the parameters of continiuity internalcontinuity to produce fillet'surfaces with an continuity ci (i=0,1 or 2). by defaultinternalcontinuity = geomabs_c1. angulartolerance is the g1 tolerance between fillet and support'faces.

Parameters
----------
InternalContinuity: GeomAbs_Shape
AngularTolerance: float

Returns
-------
None
") SetContinuity;
		void SetContinuity(const GeomAbs_Shape InternalContinuity, const Standard_Real AngularTolerance);

		/****************** SetFilletShape ******************/
		%feature("compactdefaultargs") SetFilletShape;
		%feature("autodoc", "Assigns fshape as the type of fillet shape built by this algorithm.

Parameters
----------
FShape: ChFi3d_FilletShape

Returns
-------
None
") SetFilletShape;
		void SetFilletShape(const ChFi3d_FilletShape FShape);

		/****************** SetLaw ******************/
		%feature("compactdefaultargs") SetLaw;
		%feature("autodoc", "No available documentation.

Parameters
----------
IC: int
E: TopoDS_Edge
L: Law_Function

Returns
-------
None
") SetLaw;
		void SetLaw(const Standard_Integer IC, const TopoDS_Edge & E, const opencascade::handle<Law_Function> & L);

		/****************** SetParams ******************/
		%feature("compactdefaultargs") SetParams;
		%feature("autodoc", "No available documentation.

Parameters
----------
Tang: float
Tesp: float
T2d: float
TApp3d: float
TolApp2d: float
Fleche: float

Returns
-------
None
") SetParams;
		void SetParams(const Standard_Real Tang, const Standard_Real Tesp, const Standard_Real T2d, const Standard_Real TApp3d, const Standard_Real TolApp2d, const Standard_Real Fleche);

		/****************** SetRadius ******************/
		%feature("compactdefaultargs") SetRadius;
		%feature("autodoc", "Sets the parameters of the fillet along the contour of index ic generated using the add function in the internal data structure of this algorithm, where radius is the radius of the fillet.

Parameters
----------
Radius: float
IC: int
IinC: int

Returns
-------
None
") SetRadius;
		void SetRadius(const Standard_Real Radius, const Standard_Integer IC, const Standard_Integer IinC);

		/****************** SetRadius ******************/
		%feature("compactdefaultargs") SetRadius;
		%feature("autodoc", "Sets the parameters of the fillet along the contour of index ic generated using the add function in the internal data structure of this algorithm, where the radius of the fillet evolves according to a linear evolution law defined from r1 to r2, between the first and last vertices of the contour of index ic.

Parameters
----------
R1: float
R2: float
IC: int
IinC: int

Returns
-------
None
") SetRadius;
		void SetRadius(const Standard_Real R1, const Standard_Real R2, const Standard_Integer IC, const Standard_Integer IinC);

		/****************** SetRadius ******************/
		%feature("compactdefaultargs") SetRadius;
		%feature("autodoc", "Sets the parameters of the fillet along the contour of index ic generated using the add function in the internal data structure of this algorithm, where the radius of the fillet evolves according to the evolution law l, between the first and last vertices of the contour of index ic.

Parameters
----------
L: Law_Function
IC: int
IinC: int

Returns
-------
None
") SetRadius;
		void SetRadius(const opencascade::handle<Law_Function> & L, const Standard_Integer IC, const Standard_Integer IinC);

		/****************** SetRadius ******************/
		%feature("compactdefaultargs") SetRadius;
		%feature("autodoc", "Sets the parameters of the fillet along the contour of index ic generated using the add function in the internal data structure of this algorithm, where the radius of the fillet evolves according to the evolution law which interpolates the set of parameter and radius pairs given in the array uandr as follows: - the x coordinate of a point in uandr defines a relative parameter on the contour (i.e. a parameter between 0 and 1), - the y coordinate of a point in uandr gives the corresponding value of the radius, and the radius evolves between the first and last vertices of the contour of index ic.

Parameters
----------
UandR: TColgp_Array1OfPnt2d
IC: int
IinC: int

Returns
-------
None
") SetRadius;
		void SetRadius(const TColgp_Array1OfPnt2d & UandR, const Standard_Integer IC, const Standard_Integer IinC);

		/****************** SetRadius ******************/
		%feature("compactdefaultargs") SetRadius;
		%feature("autodoc", "Assigns radius as the radius of the fillet on the edge e.

Parameters
----------
Radius: float
IC: int
E: TopoDS_Edge

Returns
-------
None
") SetRadius;
		void SetRadius(const Standard_Real Radius, const Standard_Integer IC, const TopoDS_Edge & E);

		/****************** SetRadius ******************/
		%feature("compactdefaultargs") SetRadius;
		%feature("autodoc", "No available documentation.

Parameters
----------
Radius: float
IC: int
V: TopoDS_Vertex

Returns
-------
None
") SetRadius;
		void SetRadius(const Standard_Real Radius, const Standard_Integer IC, const TopoDS_Vertex & V);

		/****************** Simulate ******************/
		%feature("compactdefaultargs") Simulate;
		%feature("autodoc", "No available documentation.

Parameters
----------
IC: int

Returns
-------
None
") Simulate;
		void Simulate(const Standard_Integer IC);

		/****************** StripeStatus ******************/
		%feature("compactdefaultargs") StripeStatus;
		%feature("autodoc", "Returns the status concerning the contour ic in case of error chfids_ok : the computation is ok chfids_startsolfailure : the computation can't start, perhaps the the radius is too big chfids_twistedsurface : the computation failed because of a twisted surface chfids_walkingfailure : there is a problem in the walking chfids_error: other error different from above.

Parameters
----------
IC: int

Returns
-------
ChFiDS_ErrorStatus
") StripeStatus;
		ChFiDS_ErrorStatus StripeStatus(const Standard_Integer IC);

};


%extend BRepFilletAPI_MakeFillet {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
