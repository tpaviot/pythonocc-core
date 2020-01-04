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
#include<Law_module.hxx>
#include<TColgp_module.hxx>
#include<ChFi3d_module.hxx>
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
%import Law.i
%import TColgp.i
%import ChFi3d.i
%import Geom.i
%import GeomAbs.i
/* public enums */
/* end public enums declaration */

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
		%feature("autodoc", "* returns the abscissa of the vertex V on the contour of index IC.
	:param IC:
	:type IC: int
	:param V:
	:type V: TopoDS_Vertex
	:rtype: float") Abscissa;
		virtual Standard_Real Abscissa (const Standard_Integer IC,const TopoDS_Vertex & V);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "* Adds a contour in the builder (builds a contour of tangent edges).
	:param E:
	:type E: TopoDS_Edge
	:rtype: void") Add;
		virtual void Add (const TopoDS_Edge & E);

		/****************** Closed ******************/
		%feature("compactdefaultargs") Closed;
		%feature("autodoc", "* returns true if the contour of index IC is closed
	:param IC:
	:type IC: int
	:rtype: bool") Closed;
		virtual Standard_Boolean Closed (const Standard_Integer IC);

		/****************** ClosedAndTangent ******************/
		%feature("compactdefaultargs") ClosedAndTangent;
		%feature("autodoc", "* returns true if the contour of index IC is closed an tangent.
	:param IC:
	:type IC: int
	:rtype: bool") ClosedAndTangent;
		virtual Standard_Boolean ClosedAndTangent (const Standard_Integer IC);

		/****************** Contour ******************/
		%feature("compactdefaultargs") Contour;
		%feature("autodoc", "* Returns the index of the contour containing the edge E, returns 0 if E doesn't belong to any contour.
	:param E:
	:type E: TopoDS_Edge
	:rtype: int") Contour;
		virtual Standard_Integer Contour (const TopoDS_Edge & E);

		/****************** Edge ******************/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "* Returns the Edge J in the contour I.
	:param I:
	:type I: int
	:param J:
	:type J: int
	:rtype: TopoDS_Edge") Edge;
		virtual const TopoDS_Edge  Edge (const Standard_Integer I,const Standard_Integer J);

		/****************** FirstVertex ******************/
		%feature("compactdefaultargs") FirstVertex;
		%feature("autodoc", "* Returns the first Vertex of the contour of index IC.
	:param IC:
	:type IC: int
	:rtype: TopoDS_Vertex") FirstVertex;
		virtual TopoDS_Vertex FirstVertex (const Standard_Integer IC);

		/****************** LastVertex ******************/
		%feature("compactdefaultargs") LastVertex;
		%feature("autodoc", "* Returns the last Vertex of the contour of index IC.
	:param IC:
	:type IC: int
	:rtype: TopoDS_Vertex") LastVertex;
		virtual TopoDS_Vertex LastVertex (const Standard_Integer IC);

		/****************** Length ******************/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "* returns the length the contour of index IC.
	:param IC:
	:type IC: int
	:rtype: float") Length;
		virtual Standard_Real Length (const Standard_Integer IC);

		/****************** NbContours ******************/
		%feature("compactdefaultargs") NbContours;
		%feature("autodoc", "* Number of contours.
	:rtype: int") NbContours;
		virtual Standard_Integer NbContours ();

		/****************** NbEdges ******************/
		%feature("compactdefaultargs") NbEdges;
		%feature("autodoc", "* Number of Edges in the contour I.
	:param I:
	:type I: int
	:rtype: int") NbEdges;
		virtual Standard_Integer NbEdges (const Standard_Integer I);

		/****************** NbSurf ******************/
		%feature("compactdefaultargs") NbSurf;
		%feature("autodoc", ":param IC:
	:type IC: int
	:rtype: int") NbSurf;
		virtual Standard_Integer NbSurf (const Standard_Integer IC);

		/****************** RelativeAbscissa ******************/
		%feature("compactdefaultargs") RelativeAbscissa;
		%feature("autodoc", "* returns the relative abscissa([0.,1.]) of the vertex V on the contour of index IC.
	:param IC:
	:type IC: int
	:param V:
	:type V: TopoDS_Vertex
	:rtype: float") RelativeAbscissa;
		virtual Standard_Real RelativeAbscissa (const Standard_Integer IC,const TopoDS_Vertex & V);

		/****************** Remove ******************/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "* remove the contour containing the Edge E.
	:param E:
	:type E: TopoDS_Edge
	:rtype: void") Remove;
		virtual void Remove (const TopoDS_Edge & E);

		/****************** Reset ******************/
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", "* Reset all the fields updated by Build operation and leave the algorithm in the same state than before build call. It allows contours and radius modifications to build the result another time.
	:rtype: void") Reset;
		virtual void Reset ();

		/****************** ResetContour ******************/
		%feature("compactdefaultargs") ResetContour;
		%feature("autodoc", "* Reset the contour of index IC, there is nomore information in the contour.
	:param IC:
	:type IC: int
	:rtype: void") ResetContour;
		virtual void ResetContour (const Standard_Integer IC);

		/****************** Sect ******************/
		%feature("compactdefaultargs") Sect;
		%feature("autodoc", ":param IC:
	:type IC: int
	:param IS:
	:type IS: int
	:rtype: opencascade::handle<ChFiDS_SecHArray1>") Sect;
		virtual opencascade::handle<ChFiDS_SecHArray1> Sect (const Standard_Integer IC,const Standard_Integer IS);

		/****************** Simulate ******************/
		%feature("compactdefaultargs") Simulate;
		%feature("autodoc", ":param IC:
	:type IC: int
	:rtype: void") Simulate;
		virtual void Simulate (const Standard_Integer IC);

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
		/****************** AddChamfer ******************/
		%feature("compactdefaultargs") AddChamfer;
		%feature("autodoc", "* Adds a chamfer on the face modified by this algorithm between the two adjacent edges E1 and E2, where the extremities of the chamfer are on E1 and E2 at distances D1 and D2 respectively In cases where the edges are not rectilinear, distances are measured using the curvilinear abscissa of the edges and the angle is measured with respect to the tangent at the corresponding point. The angle Ang is given in radians. This function returns the chamfer and builds the resulting face.
	:param E1:
	:type E1: TopoDS_Edge
	:param E2:
	:type E2: TopoDS_Edge
	:param D1:
	:type D1: float
	:param D2:
	:type D2: float
	:rtype: TopoDS_Edge") AddChamfer;
		TopoDS_Edge AddChamfer (const TopoDS_Edge & E1,const TopoDS_Edge & E2,const Standard_Real D1,const Standard_Real D2);

		/****************** AddChamfer ******************/
		%feature("compactdefaultargs") AddChamfer;
		%feature("autodoc", "* Adds a chamfer on the face modified by this algorithm between the two edges connected by the vertex V, where E is one of the two edges. The chamfer makes an angle Ang with E and one of its extremities is on E at distance D from V. In cases where the edges are not rectilinear, distances are measured using the curvilinear abscissa of the edges and the angle is measured with respect to the tangent at the corresponding point. The angle Ang is given in radians. This function returns the chamfer and builds the resulting face. Warning The status of the construction, as given by the Status function, can be one of the following: - ChFi2d_IsDone if the chamfer is built, - ChFi2d_ParametersError if D1, D2, D or Ang is less than or equal to zero, - ChFi2d_ConnexionError if: - the edge E, E1 or E2 does not belong to the initial face, or - the edges E1 and E2 are not adjacent, or - the vertex V is not one of the limit points of the edge E, - ChFi2d_ComputationError if the parameters of the chamfer are too large to build a chamfer between the two adjacent edges, - ChFi2d_NotAuthorized if: - the edge E1, E2 or one of the two edges connected to V is a fillet or chamfer, or - a curve other than a straight line or an arc of a circle is used as E, E1 or E2. Do not use the returned chamfer if the status of the construction is not ChFi2d_IsDone.
	:param E:
	:type E: TopoDS_Edge
	:param V:
	:type V: TopoDS_Vertex
	:param D:
	:type D: float
	:param Ang:
	:type Ang: float
	:rtype: TopoDS_Edge") AddChamfer;
		TopoDS_Edge AddChamfer (const TopoDS_Edge & E,const TopoDS_Vertex & V,const Standard_Real D,const Standard_Real Ang);

		/****************** AddFillet ******************/
		%feature("compactdefaultargs") AddFillet;
		%feature("autodoc", "* Adds a fillet of radius Radius between the two edges adjacent to the vertex V on the face modified by this algorithm. The two edges do not need to be rectilinear. This function returns the fillet and builds the resulting face. Warning The status of the construction, as given by the Status function, can be one of the following: - ChFi2d_IsDone if the fillet is built, - ChFi2d_ConnexionError if V does not belong to the initial face, - ChFi2d_ComputationError if Radius is too large to build a fillet between the two adjacent edges, - ChFi2d_NotAuthorized - if one of the two edges connected to V is a fillet or chamfer, or - if a curve other than a straight line or an arc of a circle is used as E, E1 or E2. Do not use the returned fillet if the status of the construction is not ChFi2d_IsDone. Exceptions Standard_NegativeValue if Radius is less than or equal to zero.
	:param V:
	:type V: TopoDS_Vertex
	:param Radius:
	:type Radius: float
	:rtype: TopoDS_Edge") AddFillet;
		TopoDS_Edge AddFillet (const TopoDS_Vertex & V,const Standard_Real Radius);

		/****************** BRepFilletAPI_MakeFillet2d ******************/
		%feature("compactdefaultargs") BRepFilletAPI_MakeFillet2d;
		%feature("autodoc", "* Initializes an empty algorithm for computing fillets and chamfers. The face on which the fillets and chamfers are built is defined using the Init function. The vertices on which fillets or chamfers are built are defined using the AddFillet or AddChamfer function. Warning The status of the initialization, as given by the Status function, can be one of the following: - ChFi2d_Ready if the initialization is correct, - ChFi2d_NotPlanar if F is not planar, - ChFi2d_NoFace if F is a null face.
	:rtype: None") BRepFilletAPI_MakeFillet2d;
		 BRepFilletAPI_MakeFillet2d ();

		/****************** BRepFilletAPI_MakeFillet2d ******************/
		%feature("compactdefaultargs") BRepFilletAPI_MakeFillet2d;
		%feature("autodoc", "* Initializes an algorithm for computing fillets and chamfers on the face F. The vertices on which fillets or chamfers are built are defined using the AddFillet or AddChamfer function. Warning The status of the initialization, as given by the Status function, can be one of the following: - ChFi2d_Ready if the initialization is correct, - ChFi2d_NotPlanar if F is not planar, - ChFi2d_NoFace if F is a null face.
	:param F:
	:type F: TopoDS_Face
	:rtype: None") BRepFilletAPI_MakeFillet2d;
		 BRepFilletAPI_MakeFillet2d (const TopoDS_Face & F);

		/****************** BasisEdge ******************/
		%feature("compactdefaultargs") BasisEdge;
		%feature("autodoc", "* Returns the basis edge on the face modified by this algorithm from which the chamfered or filleted edge E is built. If E has not been modified, this function returns E. Warning E is returned if it does not belong to the initial face.
	:param E:
	:type E: TopoDS_Edge
	:rtype: TopoDS_Edge") BasisEdge;
		const TopoDS_Edge  BasisEdge (const TopoDS_Edge & E);

		/****************** Build ******************/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "* Update the result and set the Done flag
	:rtype: void") Build;
		virtual void Build ();

		/****************** ChamferEdges ******************/
		%feature("compactdefaultargs") ChamferEdges;
		%feature("autodoc", "* Returns the table of chamfers on the face modified by this algorithm.
	:rtype: TopTools_SequenceOfShape") ChamferEdges;
		const TopTools_SequenceOfShape & ChamferEdges ();

		/****************** DescendantEdge ******************/
		%feature("compactdefaultargs") DescendantEdge;
		%feature("autodoc", "* Returns the chamfered or filleted edge built from the edge E on the face modified by this algorithm. If E has not been modified, this function returns E. Exceptions Standard_NoSuchObject if the edge E does not belong to the initial face.
	:param E:
	:type E: TopoDS_Edge
	:rtype: TopoDS_Edge") DescendantEdge;
		const TopoDS_Edge  DescendantEdge (const TopoDS_Edge & E);

		/****************** FilletEdges ******************/
		%feature("compactdefaultargs") FilletEdges;
		%feature("autodoc", "* Returns the table of fillets on the face modified by this algorithm.
	:rtype: TopTools_SequenceOfShape") FilletEdges;
		const TopTools_SequenceOfShape & FilletEdges ();

		/****************** HasDescendant ******************/
		%feature("compactdefaultargs") HasDescendant;
		%feature("autodoc", ":param E:
	:type E: TopoDS_Edge
	:rtype: bool") HasDescendant;
		Standard_Boolean HasDescendant (const TopoDS_Edge & E);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initializes this algorithm for constructing fillets or chamfers with the face F. Warning The status of the initialization, as given by the Status function, can be one of the following: - ChFi2d_Ready if the initialization is correct, - ChFi2d_NotPlanar if F is not planar, - ChFi2d_NoFace if F is a null face.
	:param F:
	:type F: TopoDS_Face
	:rtype: None") Init;
		void Init (const TopoDS_Face & F);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* This initialize method allow to init the builder from a face <RefFace> and another face <ModFace> which derive from <RefFace>. This is usefull to modify a fillet or a chamfer already created on <ModFace> .
	:param RefFace:
	:type RefFace: TopoDS_Face
	:param ModFace:
	:type ModFace: TopoDS_Face
	:rtype: None") Init;
		void Init (const TopoDS_Face & RefFace,const TopoDS_Face & ModFace);

		/****************** IsModified ******************/
		%feature("compactdefaultargs") IsModified;
		%feature("autodoc", "* Returns true if the edge E on the face modified by this algorithm is chamfered or filleted. Warning Returns false if E does not belong to the face modified by this algorithm.
	:param E:
	:type E: TopoDS_Edge
	:rtype: bool") IsModified;
		Standard_Boolean IsModified (const TopoDS_Edge & E);

		/****************** Modified ******************/
		%feature("compactdefaultargs") Modified;
		%feature("autodoc", "* Returns the list of shapes modified from the shape <S>.
	:param S:
	:type S: TopoDS_Shape
	:rtype: TopTools_ListOfShape") Modified;
		virtual const TopTools_ListOfShape & Modified (const TopoDS_Shape & S);

		/****************** ModifyChamfer ******************/
		%feature("compactdefaultargs") ModifyChamfer;
		%feature("autodoc", "* Modifies the chamfer Chamfer on the face modified by this algorithm, where: E1 and E2 are the two adjacent edges on which Chamfer is already built; the extremities of the new chamfer are on E1 and E2 at distances D1 and D2 respectively.
	:param Chamfer:
	:type Chamfer: TopoDS_Edge
	:param E1:
	:type E1: TopoDS_Edge
	:param E2:
	:type E2: TopoDS_Edge
	:param D1:
	:type D1: float
	:param D2:
	:type D2: float
	:rtype: TopoDS_Edge") ModifyChamfer;
		TopoDS_Edge ModifyChamfer (const TopoDS_Edge & Chamfer,const TopoDS_Edge & E1,const TopoDS_Edge & E2,const Standard_Real D1,const Standard_Real D2);

		/****************** ModifyChamfer ******************/
		%feature("compactdefaultargs") ModifyChamfer;
		%feature("autodoc", "* Modifies the chamfer Chamfer on the face modified by this algorithm, where: E is one of the two adjacent edges on which Chamfer is already built; the new chamfer makes an angle Ang with E and one of its extremities is on E at distance D from the vertex on which the chamfer is built. In cases where the edges are not rectilinear, the distances are measured using the curvilinear abscissa of the edges and the angle is measured with respect to the tangent at the corresponding point. The angle Ang is given in radians. This function returns the new chamfer and modifies the existing face. Warning The status of the construction, as given by the Status function, can be one of the following: - ChFi2d_IsDone if the chamfer is built, - ChFi2d_ParametersError if D1, D2, D or Ang is less than or equal to zero, - ChFi2d_ConnexionError if: - the edge E, E1, E2 or Chamfer does not belong to the existing face, or - the edges E1 and E2 are not adjacent, - ChFi2d_ComputationError if the parameters of the chamfer are too large to build a chamfer between the two adjacent edges, - ChFi2d_NotAuthorized if E1 or E2 is a fillet or chamfer. Do not use the returned chamfer if the status of the construction is not ChFi2d_IsDone.
	:param Chamfer:
	:type Chamfer: TopoDS_Edge
	:param E:
	:type E: TopoDS_Edge
	:param D:
	:type D: float
	:param Ang:
	:type Ang: float
	:rtype: TopoDS_Edge") ModifyChamfer;
		TopoDS_Edge ModifyChamfer (const TopoDS_Edge & Chamfer,const TopoDS_Edge & E,const Standard_Real D,const Standard_Real Ang);

		/****************** ModifyFillet ******************/
		%feature("compactdefaultargs") ModifyFillet;
		%feature("autodoc", "* Assigns the radius Radius to the fillet Fillet already built on the face modified by this algorithm. This function returns the new fillet and modifies the existing face. Warning The status of the construction, as given by the Status function, can be one of the following: - ChFi2d_IsDone if the new fillet is built, - ChFi2d_ConnexionError if Fillet does not belong to the existing face, - ChFi2d_ComputationError if Radius is too large to build a fillet between the two adjacent edges. Do not use the returned fillet if the status of the construction is not ChFi2d_IsDone. Exceptions Standard_NegativeValue if Radius is less than or equal to zero.
	:param Fillet:
	:type Fillet: TopoDS_Edge
	:param Radius:
	:type Radius: float
	:rtype: TopoDS_Edge") ModifyFillet;
		TopoDS_Edge ModifyFillet (const TopoDS_Edge & Fillet,const Standard_Real Radius);

		/****************** NbChamfer ******************/
		%feature("compactdefaultargs") NbChamfer;
		%feature("autodoc", "* Returns the number of chamfers on the face modified by this algorithm.
	:rtype: int") NbChamfer;
		Standard_Integer NbChamfer ();

		/****************** NbCurves ******************/
		%feature("compactdefaultargs") NbCurves;
		%feature("autodoc", "* returns the number of new curves after the shape creation.
	:rtype: int") NbCurves;
		Standard_Integer NbCurves ();

		/****************** NbFillet ******************/
		%feature("compactdefaultargs") NbFillet;
		%feature("autodoc", "* Returns the number of fillets on the face modified by this algorithm.
	:rtype: int") NbFillet;
		Standard_Integer NbFillet ();

		/****************** NewEdges ******************/
		%feature("compactdefaultargs") NewEdges;
		%feature("autodoc", "* Return the Edges created for curve I.
	:param I:
	:type I: int
	:rtype: TopTools_ListOfShape") NewEdges;
		const TopTools_ListOfShape & NewEdges (const Standard_Integer I);

		/****************** RemoveChamfer ******************/
		%feature("compactdefaultargs") RemoveChamfer;
		%feature("autodoc", "* Removes the chamfer Chamfer already built on the face modified by this algorithm. This function returns the vertex connecting the two adjacent edges of Chamfer and modifies the existing face. Warning - The returned vertex is only valid if the Status function returns ChFi2d_IsDone. - A null vertex is returned if the edge Chamfer does not belong to the initial face.
	:param Chamfer:
	:type Chamfer: TopoDS_Edge
	:rtype: TopoDS_Vertex") RemoveChamfer;
		TopoDS_Vertex RemoveChamfer (const TopoDS_Edge & Chamfer);

		/****************** RemoveFillet ******************/
		%feature("compactdefaultargs") RemoveFillet;
		%feature("autodoc", "* Removes the fillet Fillet already built on the face modified by this algorithm. This function returns the vertex connecting the two adjacent edges of Fillet and modifies the existing face. Warning - The returned vertex is only valid if the Status function returns ChFi2d_IsDone. - A null vertex is returned if the edge Fillet does not belong to the initial face.
	:param Fillet:
	:type Fillet: TopoDS_Edge
	:rtype: TopoDS_Vertex") RemoveFillet;
		TopoDS_Vertex RemoveFillet (const TopoDS_Edge & Fillet);

		/****************** Status ******************/
		%feature("compactdefaultargs") Status;
		%feature("autodoc", ":rtype: ChFi2d_ConstructionError") Status;
		ChFi2d_ConstructionError Status ();

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
		/****************** Abscissa ******************/
		%feature("compactdefaultargs") Abscissa;
		%feature("autodoc", "* Returns the curvilinear abscissa of the vertex V on the contour of index IC in the internal data structure of this algorithm. Warning Returns -1. if: - IC is outside the bounds of the table of contours, or - V is not on the contour of index IC.
	:param IC:
	:type IC: int
	:param V:
	:type V: TopoDS_Vertex
	:rtype: float") Abscissa;
		Standard_Real Abscissa (const Standard_Integer IC,const TopoDS_Vertex & V);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "* Adds edge E to the table of edges used by this algorithm to build chamfers, where the parameters of the chamfer must be set after the
	:param E:
	:type E: TopoDS_Edge
	:rtype: None") Add;
		void Add (const TopoDS_Edge & E);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "* Adds edge E to the table of edges used by this algorithm to build chamfers, where the parameters of the chamfer are given by the distance Dis (symmetric chamfer). The Add function results in a contour being built by propagation from the edge E (i.e. the contour contains at least this edge). This contour is composed of edges of the shape which are tangential to one another and which delimit two series of tangential faces, with one series of faces being located on either side of the contour. Warning Nothing is done if edge E or the face F does not belong to the initial shape.
	:param Dis:
	:type Dis: float
	:param E:
	:type E: TopoDS_Edge
	:rtype: None") Add;
		void Add (const Standard_Real Dis,const TopoDS_Edge & E);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "* Adds edge E to the table of edges used by this algorithm to build chamfers, where the parameters of the chamfer are given by the two distances Dis1 and Dis2; the face F identifies the side where Dis1 is measured. The Add function results in a contour being built by propagation from the edge E (i.e. the contour contains at least this edge). This contour is composed of edges of the shape which are tangential to one another and which delimit two series of tangential faces, with one series of faces being located on either side of the contour. Warning Nothing is done if edge E or the face F does not belong to the initial shape.
	:param Dis1:
	:type Dis1: float
	:param Dis2:
	:type Dis2: float
	:param E:
	:type E: TopoDS_Edge
	:param F:
	:type F: TopoDS_Face
	:rtype: None") Add;
		void Add (const Standard_Real Dis1,const Standard_Real Dis2,const TopoDS_Edge & E,const TopoDS_Face & F);

		/****************** AddDA ******************/
		%feature("compactdefaultargs") AddDA;
		%feature("autodoc", "* Adds a fillet contour in the builder (builds a contour of tangent edges to <E> and sets the distance <Dis1> and angle <Angle> ( parameters of the chamfer ) ).
	:param Dis:
	:type Dis: float
	:param Angle:
	:type Angle: float
	:param E:
	:type E: TopoDS_Edge
	:param F:
	:type F: TopoDS_Face
	:rtype: None") AddDA;
		void AddDA (const Standard_Real Dis,const Standard_Real Angle,const TopoDS_Edge & E,const TopoDS_Face & F);

		/****************** BRepFilletAPI_MakeChamfer ******************/
		%feature("compactdefaultargs") BRepFilletAPI_MakeChamfer;
		%feature("autodoc", "* Initializes an algorithm for computing chamfers on the shape S. The edges on which chamfers are built are defined using the Add function.
	:param S:
	:type S: TopoDS_Shape
	:rtype: None") BRepFilletAPI_MakeChamfer;
		 BRepFilletAPI_MakeChamfer (const TopoDS_Shape & S);

		/****************** Build ******************/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "* Builds the chamfers on all the contours in the internal data structure of this algorithm and constructs the resulting shape. Use the function IsDone to verify that the chamfered shape is built. Use the function Shape to retrieve the chamfered shape. Warning The construction of chamfers implements highly complex construction algorithms. Consequently, there may be instances where the algorithm fails, for example if the data defining the parameters of the chamfer is not compatible with the geometry of the initial shape. There is no initial analysis of errors and these only become evident at the construction stage. Additionally, in the current software release, the following cases are not handled: - the end point of the contour is the point of intersection of 4 or more edges of the shape, or - the intersection of the chamfer with a face which limits the contour is not fully contained in this face.
	:rtype: void") Build;
		virtual void Build ();

		/****************** Builder ******************/
		%feature("compactdefaultargs") Builder;
		%feature("autodoc", "* Returns the internal filleting algorithm.
	:rtype: opencascade::handle<TopOpeBRepBuild_HBuilder>") Builder;
		opencascade::handle<TopOpeBRepBuild_HBuilder> Builder ();

		/****************** Closed ******************/
		%feature("compactdefaultargs") Closed;
		%feature("autodoc", "* Returns true if the contour of index IC in the internal data structure of this algorithm is closed. Warning Returns false if IC is outside the bounds of the table of contours.
	:param IC:
	:type IC: int
	:rtype: bool") Closed;
		Standard_Boolean Closed (const Standard_Integer IC);

		/****************** ClosedAndTangent ******************/
		%feature("compactdefaultargs") ClosedAndTangent;
		%feature("autodoc", "* eturns true if the contour of index IC in the internal data structure of this algorithm is closed and tangential at the point of closure. Warning Returns false if IC is outside the bounds of the table of contours.
	:param IC:
	:type IC: int
	:rtype: bool") ClosedAndTangent;
		Standard_Boolean ClosedAndTangent (const Standard_Integer IC);

		/****************** Contour ******************/
		%feature("compactdefaultargs") Contour;
		%feature("autodoc", "* Returns the index of the contour in the internal data structure of this algorithm, which contains the edge E of the shape. This function returns 0 if the edge E does not belong to any contour. Warning This index can change if a contour is removed from the internal data structure of this algorithm using the function Remove.
	:param E:
	:type E: TopoDS_Edge
	:rtype: int") Contour;
		Standard_Integer Contour (const TopoDS_Edge & E);

		/****************** Dists ******************/
		%feature("compactdefaultargs") Dists;
		%feature("autodoc", "* Returns the distances Dis1 and Dis2 which give the parameters of the chamfer along the contour of index IC in the internal data structure of this algorithm. Warning -1. is returned if IC is outside the bounds of the table of contours.
	:param IC:
	:type IC: int
	:param Dis1:
	:type Dis1: float
	:param Dis2:
	:type Dis2: float
	:rtype: None") Dists;
		void Dists (const Standard_Integer IC,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** Edge ******************/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "* Returns the edge of index J in the contour of index I in the internal data structure of this algorithm. Warning Returns a null shape if: - I is outside the bounds of the table of contours, or - J is outside the bounds of the table of edges of the contour of index I.
	:param I:
	:type I: int
	:param J:
	:type J: int
	:rtype: TopoDS_Edge") Edge;
		const TopoDS_Edge  Edge (const Standard_Integer I,const Standard_Integer J);

		/****************** FirstVertex ******************/
		%feature("compactdefaultargs") FirstVertex;
		%feature("autodoc", "* Returns the first vertex of the contour of index IC in the internal data structure of this algorithm. Warning Returns a null shape if IC is outside the bounds of the table of contours.
	:param IC:
	:type IC: int
	:rtype: TopoDS_Vertex") FirstVertex;
		TopoDS_Vertex FirstVertex (const Standard_Integer IC);

		/****************** Generated ******************/
		%feature("compactdefaultargs") Generated;
		%feature("autodoc", "* Returns the list of shapes generated from the shape <EorV>.
	:param EorV:
	:type EorV: TopoDS_Shape
	:rtype: TopTools_ListOfShape") Generated;
		virtual const TopTools_ListOfShape & Generated (const TopoDS_Shape & EorV);

		/****************** GetDist ******************/
		%feature("compactdefaultargs") GetDist;
		%feature("autodoc", ":param IC:
	:type IC: int
	:param Dis:
	:type Dis: float
	:rtype: None") GetDist;
		void GetDist (const Standard_Integer IC,Standard_Real &OutValue);

		/****************** GetDistAngle ******************/
		%feature("compactdefaultargs") GetDistAngle;
		%feature("autodoc", "* gives the distances <Dis> and <Angle> of the fillet contour of index <IC> in the DS
	:param IC:
	:type IC: int
	:param Dis:
	:type Dis: float
	:param Angle:
	:type Angle: float
	:rtype: None") GetDistAngle;
		void GetDistAngle (const Standard_Integer IC,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** IsDeleted ******************/
		%feature("compactdefaultargs") IsDeleted;
		%feature("autodoc", ":param F:
	:type F: TopoDS_Shape
	:rtype: bool") IsDeleted;
		virtual Standard_Boolean IsDeleted (const TopoDS_Shape & F);

		/****************** IsDistanceAngle ******************/
		%feature("compactdefaultargs") IsDistanceAngle;
		%feature("autodoc", "* return True if chamfer is made with distance and angle false else.
	:param IC:
	:type IC: int
	:rtype: bool") IsDistanceAngle;
		Standard_Boolean IsDistanceAngle (const Standard_Integer IC);

		/****************** IsSymetric ******************/
		%feature("compactdefaultargs") IsSymetric;
		%feature("autodoc", "* return True if chamfer symetric false else.
	:param IC:
	:type IC: int
	:rtype: bool") IsSymetric;
		Standard_Boolean IsSymetric (const Standard_Integer IC);

		/****************** IsTwoDistances ******************/
		%feature("compactdefaultargs") IsTwoDistances;
		%feature("autodoc", "* return True if chamfer is made with two distances false else.
	:param IC:
	:type IC: int
	:rtype: bool") IsTwoDistances;
		Standard_Boolean IsTwoDistances (const Standard_Integer IC);

		/****************** LastVertex ******************/
		%feature("compactdefaultargs") LastVertex;
		%feature("autodoc", "* Returns the last vertex of the contour of index IC in the internal data structure of this algorithm. Warning Returns a null shape if IC is outside the bounds of the table of contours.
	:param IC:
	:type IC: int
	:rtype: TopoDS_Vertex") LastVertex;
		TopoDS_Vertex LastVertex (const Standard_Integer IC);

		/****************** Length ******************/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "* Returns the length of the contour of index IC in the internal data structure of this algorithm. Warning Returns -1. if IC is outside the bounds of the table of contours.
	:param IC:
	:type IC: int
	:rtype: float") Length;
		Standard_Real Length (const Standard_Integer IC);

		/****************** Modified ******************/
		%feature("compactdefaultargs") Modified;
		%feature("autodoc", "* Returns the list of shapes modified from the shape <F>.
	:param F:
	:type F: TopoDS_Shape
	:rtype: TopTools_ListOfShape") Modified;
		virtual const TopTools_ListOfShape & Modified (const TopoDS_Shape & F);

		/****************** NbContours ******************/
		%feature("compactdefaultargs") NbContours;
		%feature("autodoc", "* Returns the number of contours generated using the Add function in the internal data structure of this algorithm.
	:rtype: int") NbContours;
		Standard_Integer NbContours ();

		/****************** NbEdges ******************/
		%feature("compactdefaultargs") NbEdges;
		%feature("autodoc", "* Returns the number of edges in the contour of index I in the internal data structure of this algorithm. Warning Returns 0 if I is outside the bounds of the table of contours.
	:param I:
	:type I: int
	:rtype: int") NbEdges;
		Standard_Integer NbEdges (const Standard_Integer I);

		/****************** NbSurf ******************/
		%feature("compactdefaultargs") NbSurf;
		%feature("autodoc", ":param IC:
	:type IC: int
	:rtype: int") NbSurf;
		Standard_Integer NbSurf (const Standard_Integer IC);

		/****************** RelativeAbscissa ******************/
		%feature("compactdefaultargs") RelativeAbscissa;
		%feature("autodoc", "* Returns the relative curvilinear abscissa (i.e. between 0 and 1) of the vertex V on the contour of index IC in the internal data structure of this algorithm. Warning Returns -1. if: - IC is outside the bounds of the table of contours, or - V is not on the contour of index IC.
	:param IC:
	:type IC: int
	:param V:
	:type V: TopoDS_Vertex
	:rtype: float") RelativeAbscissa;
		Standard_Real RelativeAbscissa (const Standard_Integer IC,const TopoDS_Vertex & V);

		/****************** Remove ******************/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "* Removes the contour in the internal data structure of this algorithm which contains the edge E of the shape. Warning Nothing is done if the edge E does not belong to the contour in the internal data structure of this algorithm.
	:param E:
	:type E: TopoDS_Edge
	:rtype: None") Remove;
		void Remove (const TopoDS_Edge & E);

		/****************** Reset ******************/
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", "* Reinitializes this algorithm, thus canceling the effects of the Build function. This function allows modifications to be made to the contours and chamfer parameters in order to rebuild the shape.
	:rtype: None") Reset;
		void Reset ();

		/****************** ResetContour ******************/
		%feature("compactdefaultargs") ResetContour;
		%feature("autodoc", "* Erases the chamfer parameters on the contour of index IC in the internal data structure of this algorithm. Use the SetDists function to reset this data. Warning Nothing is done if IC is outside the bounds of the table of contours.
	:param IC:
	:type IC: int
	:rtype: None") ResetContour;
		void ResetContour (const Standard_Integer IC);

		/****************** Sect ******************/
		%feature("compactdefaultargs") Sect;
		%feature("autodoc", ":param IC:
	:type IC: int
	:param IS:
	:type IS: int
	:rtype: opencascade::handle<ChFiDS_SecHArray1>") Sect;
		opencascade::handle<ChFiDS_SecHArray1> Sect (const Standard_Integer IC,const Standard_Integer IS);

		/****************** SetDist ******************/
		%feature("compactdefaultargs") SetDist;
		%feature("autodoc", "* Sets the distances Dis1 and Dis2 which give the parameters of the chamfer along the contour of index IC generated using the Add function in the internal data structure of this algorithm. The face F identifies the side where Dis1 is measured. Warning Nothing is done if either the edge E or the face F does not belong to the initial shape.
	:param Dis:
	:type Dis: float
	:param IC:
	:type IC: int
	:param F:
	:type F: TopoDS_Face
	:rtype: None") SetDist;
		void SetDist (const Standard_Real Dis,const Standard_Integer IC,const TopoDS_Face & F);

		/****************** SetDistAngle ******************/
		%feature("compactdefaultargs") SetDistAngle;
		%feature("autodoc", "* set the distance <Dis> and <Angle> of the fillet contour of index <IC> in the DS with <Dis> on <F>. if the face <F> is not one of common faces of an edge of the contour <IC>
	:param Dis:
	:type Dis: float
	:param Angle:
	:type Angle: float
	:param IC:
	:type IC: int
	:param F:
	:type F: TopoDS_Face
	:rtype: None") SetDistAngle;
		void SetDistAngle (const Standard_Real Dis,const Standard_Real Angle,const Standard_Integer IC,const TopoDS_Face & F);

		/****************** SetDists ******************/
		%feature("compactdefaultargs") SetDists;
		%feature("autodoc", "* Sets the distances Dis1 and Dis2 which give the parameters of the chamfer along the contour of index IC generated using the Add function in the internal data structure of this algorithm. The face F identifies the side where Dis1 is measured. Warning Nothing is done if either the edge E or the face F does not belong to the initial shape.
	:param Dis1:
	:type Dis1: float
	:param Dis2:
	:type Dis2: float
	:param IC:
	:type IC: int
	:param F:
	:type F: TopoDS_Face
	:rtype: None") SetDists;
		void SetDists (const Standard_Real Dis1,const Standard_Real Dis2,const Standard_Integer IC,const TopoDS_Face & F);

		/****************** SetMode ******************/
		%feature("compactdefaultargs") SetMode;
		%feature("autodoc", "* Sets the mode of chamfer
	:param theMode:
	:type theMode: ChFiDS_ChamfMode
	:rtype: None") SetMode;
		void SetMode (const ChFiDS_ChamfMode theMode);

		/****************** Simulate ******************/
		%feature("compactdefaultargs") Simulate;
		%feature("autodoc", ":param IC:
	:type IC: int
	:rtype: None") Simulate;
		void Simulate (const Standard_Integer IC);

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
		/****************** Abscissa ******************/
		%feature("compactdefaultargs") Abscissa;
		%feature("autodoc", "* Returns the curvilinear abscissa of the vertex V on the contour of index IC in the internal data structure of this algorithm. Warning Returns -1. if: - IC is outside the bounds of the table of contours, or - V is not on the contour of index IC.
	:param IC:
	:type IC: int
	:param V:
	:type V: TopoDS_Vertex
	:rtype: float") Abscissa;
		Standard_Real Abscissa (const Standard_Integer IC,const TopoDS_Vertex & V);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "* Adds a fillet contour in the builder (builds a contour of tangent edges). The Radius must be set after.
	:param E:
	:type E: TopoDS_Edge
	:rtype: None") Add;
		void Add (const TopoDS_Edge & E);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "* Adds a fillet description in the builder - builds a contour of tangent edges, - sets the radius.
	:param Radius:
	:type Radius: float
	:param E:
	:type E: TopoDS_Edge
	:rtype: None") Add;
		void Add (const Standard_Real Radius,const TopoDS_Edge & E);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "* Adds a fillet description in the builder - builds a contour of tangent edges, - sets a linear radius evolution law between the first and last vertex of the spine.
	:param R1:
	:type R1: float
	:param R2:
	:type R2: float
	:param E:
	:type E: TopoDS_Edge
	:rtype: None") Add;
		void Add (const Standard_Real R1,const Standard_Real R2,const TopoDS_Edge & E);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "* Adds a fillet description in the builder - builds a contour of tangent edges, - sest the radius evolution law.
	:param L:
	:type L: Law_Function
	:param E:
	:type E: TopoDS_Edge
	:rtype: None") Add;
		void Add (const opencascade::handle<Law_Function> & L,const TopoDS_Edge & E);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "* Adds a fillet description in the builder - builds a contour of tangent edges, - sets the radius evolution law interpolating the values given in the array UandR : //! p2d.X() = relative parameter on the spine [0,1] p2d.Y() = value of the radius.
	:param UandR:
	:type UandR: TColgp_Array1OfPnt2d
	:param E:
	:type E: TopoDS_Edge
	:rtype: None") Add;
		void Add (const TColgp_Array1OfPnt2d & UandR,const TopoDS_Edge & E);

		/****************** BRepFilletAPI_MakeFillet ******************/
		%feature("compactdefaultargs") BRepFilletAPI_MakeFillet;
		%feature("autodoc", "* Initializes the computation of the fillets. <FShape> sets the type of fillet surface. The default value is ChFi3d_Rational (classical nurbs representation of circles). ChFi3d_QuasiAngular corresponds to a nurbs representation of circles which parameterisation matches the circle one. ChFi3d_Polynomial corresponds to a polynomial representation of circles.
	:param S:
	:type S: TopoDS_Shape
	:param FShape: default value is ChFi3d_Rational
	:type FShape: ChFi3d_FilletShape
	:rtype: None") BRepFilletAPI_MakeFillet;
		 BRepFilletAPI_MakeFillet (const TopoDS_Shape & S,const ChFi3d_FilletShape FShape = ChFi3d_Rational);

		/****************** BadShape ******************/
		%feature("compactdefaultargs") BadShape;
		%feature("autodoc", "* if (HasResult()) returns the partial result
	:rtype: TopoDS_Shape") BadShape;
		TopoDS_Shape BadShape ();

		/****************** Build ******************/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "* Builds the fillets on all the contours in the internal data structure of this algorithm and constructs the resulting shape. Use the function IsDone to verify that the filleted shape is built. Use the function Shape to retrieve the filleted shape. Warning The construction of fillets implements highly complex construction algorithms. Consequently, there may be instances where the algorithm fails, for example if the data defining the radius of the fillet is not compatible with the geometry of the initial shape. There is no initial analysis of errors and they only become evident at the construction stage. Additionally, in the current software release, the following cases are not handled: - the end point of the contour is the point of intersection of 4 or more edges of the shape, or - the intersection of the fillet with a face which limits the contour is not fully contained in this face.
	:rtype: void") Build;
		virtual void Build ();

		/****************** Builder ******************/
		%feature("compactdefaultargs") Builder;
		%feature("autodoc", "* Returns the internal topology building algorithm.
	:rtype: opencascade::handle<TopOpeBRepBuild_HBuilder>") Builder;
		opencascade::handle<TopOpeBRepBuild_HBuilder> Builder ();

		/****************** Closed ******************/
		%feature("compactdefaultargs") Closed;
		%feature("autodoc", "* Returns true if the contour of index IC in the internal data structure of this algorithm is closed. Warning Returns false if IC is outside the bounds of the table of contours.
	:param IC:
	:type IC: int
	:rtype: bool") Closed;
		Standard_Boolean Closed (const Standard_Integer IC);

		/****************** ClosedAndTangent ******************/
		%feature("compactdefaultargs") ClosedAndTangent;
		%feature("autodoc", "* Returns true if the contour of index IC in the internal data structure of this algorithm is closed and tangential at the point of closure. Warning Returns false if IC is outside the bounds of the table of contours.
	:param IC:
	:type IC: int
	:rtype: bool") ClosedAndTangent;
		Standard_Boolean ClosedAndTangent (const Standard_Integer IC);

		/****************** ComputedSurface ******************/
		%feature("compactdefaultargs") ComputedSurface;
		%feature("autodoc", "* returns the surface number IS concerning the contour IC
	:param IC:
	:type IC: int
	:param IS:
	:type IS: int
	:rtype: opencascade::handle<Geom_Surface>") ComputedSurface;
		opencascade::handle<Geom_Surface> ComputedSurface (const Standard_Integer IC,const Standard_Integer IS);

		/****************** Contour ******************/
		%feature("compactdefaultargs") Contour;
		%feature("autodoc", "* Returns the index of the contour in the internal data structure of this algorithm which contains the edge E of the shape. This function returns 0 if the edge E does not belong to any contour. Warning This index can change if a contour is removed from the internal data structure of this algorithm using the function Remove.
	:param E:
	:type E: TopoDS_Edge
	:rtype: int") Contour;
		Standard_Integer Contour (const TopoDS_Edge & E);

		/****************** Edge ******************/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "* Returns the edge of index J in the contour of index I in the internal data structure of this algorithm. Warning Returns a null shape if: - I is outside the bounds of the table of contours, or - J is outside the bounds of the table of edges of the index I contour.
	:param I:
	:type I: int
	:param J:
	:type J: int
	:rtype: TopoDS_Edge") Edge;
		const TopoDS_Edge  Edge (const Standard_Integer I,const Standard_Integer J);

		/****************** FaultyContour ******************/
		%feature("compactdefaultargs") FaultyContour;
		%feature("autodoc", "* for each I in [1.. NbFaultyContours] returns the index IC of the contour where the computation of the fillet failed. the method NbEdges(IC) gives the number of edges in the contour IC the method Edge(IC,ie) gives the edge number ie of the contour IC
	:param I:
	:type I: int
	:rtype: int") FaultyContour;
		Standard_Integer FaultyContour (const Standard_Integer I);

		/****************** FaultyVertex ******************/
		%feature("compactdefaultargs") FaultyVertex;
		%feature("autodoc", "* returns the vertex where the computation failed
	:param IV:
	:type IV: int
	:rtype: TopoDS_Vertex") FaultyVertex;
		TopoDS_Vertex FaultyVertex (const Standard_Integer IV);

		/****************** FirstVertex ******************/
		%feature("compactdefaultargs") FirstVertex;
		%feature("autodoc", "* Returns the first vertex of the contour of index IC in the internal data structure of this algorithm. Warning Returns a null shape if IC is outside the bounds of the table of contours.
	:param IC:
	:type IC: int
	:rtype: TopoDS_Vertex") FirstVertex;
		TopoDS_Vertex FirstVertex (const Standard_Integer IC);

		/****************** Generated ******************/
		%feature("compactdefaultargs") Generated;
		%feature("autodoc", "* Returns the list of shapes generated from the shape <EorV>.
	:param EorV:
	:type EorV: TopoDS_Shape
	:rtype: TopTools_ListOfShape") Generated;
		virtual const TopTools_ListOfShape & Generated (const TopoDS_Shape & EorV);

		/****************** GetBounds ******************/
		%feature("compactdefaultargs") GetBounds;
		%feature("autodoc", ":param IC:
	:type IC: int
	:param E:
	:type E: TopoDS_Edge
	:param F:
	:type F: float
	:param L:
	:type L: float
	:rtype: bool") GetBounds;
		Standard_Boolean GetBounds (const Standard_Integer IC,const TopoDS_Edge & E,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** GetFilletShape ******************/
		%feature("compactdefaultargs") GetFilletShape;
		%feature("autodoc", "* Returns the type of fillet shape built by this algorithm.
	:rtype: ChFi3d_FilletShape") GetFilletShape;
		ChFi3d_FilletShape GetFilletShape ();

		/****************** GetLaw ******************/
		%feature("compactdefaultargs") GetLaw;
		%feature("autodoc", ":param IC:
	:type IC: int
	:param E:
	:type E: TopoDS_Edge
	:rtype: opencascade::handle<Law_Function>") GetLaw;
		opencascade::handle<Law_Function> GetLaw (const Standard_Integer IC,const TopoDS_Edge & E);

		/****************** HasResult ******************/
		%feature("compactdefaultargs") HasResult;
		%feature("autodoc", "* returns true if a part of the result has been computed if the filling in a corner failed a shape with a hole is returned
	:rtype: bool") HasResult;
		Standard_Boolean HasResult ();

		/****************** IsConstant ******************/
		%feature("compactdefaultargs") IsConstant;
		%feature("autodoc", "* Returns true if the radius of the fillet along the contour of index IC in the internal data structure of this algorithm is constant, Warning False is returned if IC is outside the bounds of the table of contours or if E does not belong to the contour of index IC.
	:param IC:
	:type IC: int
	:rtype: bool") IsConstant;
		Standard_Boolean IsConstant (const Standard_Integer IC);

		/****************** IsConstant ******************/
		%feature("compactdefaultargs") IsConstant;
		%feature("autodoc", "* Returns true if the radius of the fillet along the edge E of the contour of index IC in the internal data structure of this algorithm is constant. Warning False is returned if IC is outside the bounds of the table of contours or if E does not belong to the contour of index IC.
	:param IC:
	:type IC: int
	:param E:
	:type E: TopoDS_Edge
	:rtype: bool") IsConstant;
		Standard_Boolean IsConstant (const Standard_Integer IC,const TopoDS_Edge & E);

		/****************** IsDeleted ******************/
		%feature("compactdefaultargs") IsDeleted;
		%feature("autodoc", ":param F:
	:type F: TopoDS_Shape
	:rtype: bool") IsDeleted;
		virtual Standard_Boolean IsDeleted (const TopoDS_Shape & F);

		/****************** LastVertex ******************/
		%feature("compactdefaultargs") LastVertex;
		%feature("autodoc", "* Returns the last vertex of the contour of index IC in the internal data structure of this algorithm. Warning Returns a null shape if IC is outside the bounds of the table of contours.
	:param IC:
	:type IC: int
	:rtype: TopoDS_Vertex") LastVertex;
		TopoDS_Vertex LastVertex (const Standard_Integer IC);

		/****************** Length ******************/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "* Returns the length of the contour of index IC in the internal data structure of this algorithm. Warning Returns -1. if IC is outside the bounds of the table of contours.
	:param IC:
	:type IC: int
	:rtype: float") Length;
		Standard_Real Length (const Standard_Integer IC);

		/****************** Modified ******************/
		%feature("compactdefaultargs") Modified;
		%feature("autodoc", "* Returns the list of shapes modified from the shape <F>.
	:param F:
	:type F: TopoDS_Shape
	:rtype: TopTools_ListOfShape") Modified;
		virtual const TopTools_ListOfShape & Modified (const TopoDS_Shape & F);

		/****************** NbComputedSurfaces ******************/
		%feature("compactdefaultargs") NbComputedSurfaces;
		%feature("autodoc", "* returns the number of surfaces which have been computed on the contour IC
	:param IC:
	:type IC: int
	:rtype: int") NbComputedSurfaces;
		Standard_Integer NbComputedSurfaces (const Standard_Integer IC);

		/****************** NbContours ******************/
		%feature("compactdefaultargs") NbContours;
		%feature("autodoc", "* Returns the number of contours generated using the Add function in the internal data structure of this algorithm.
	:rtype: int") NbContours;
		Standard_Integer NbContours ();

		/****************** NbEdges ******************/
		%feature("compactdefaultargs") NbEdges;
		%feature("autodoc", "* Returns the number of edges in the contour of index I in the internal data structure of this algorithm. Warning Returns 0 if I is outside the bounds of the table of contours.
	:param I:
	:type I: int
	:rtype: int") NbEdges;
		Standard_Integer NbEdges (const Standard_Integer I);

		/****************** NbFaultyContours ******************/
		%feature("compactdefaultargs") NbFaultyContours;
		%feature("autodoc", "* Returns the number of contours where the computation of the fillet failed
	:rtype: int") NbFaultyContours;
		Standard_Integer NbFaultyContours ();

		/****************** NbFaultyVertices ******************/
		%feature("compactdefaultargs") NbFaultyVertices;
		%feature("autodoc", "* returns the number of vertices where the computation failed
	:rtype: int") NbFaultyVertices;
		Standard_Integer NbFaultyVertices ();

		/****************** NbSurf ******************/
		%feature("compactdefaultargs") NbSurf;
		%feature("autodoc", ":param IC:
	:type IC: int
	:rtype: int") NbSurf;
		Standard_Integer NbSurf (const Standard_Integer IC);

		/****************** NbSurfaces ******************/
		%feature("compactdefaultargs") NbSurfaces;
		%feature("autodoc", "* returns the number of surfaces after the shape creation.
	:rtype: int") NbSurfaces;
		Standard_Integer NbSurfaces ();

		/****************** NewFaces ******************/
		%feature("compactdefaultargs") NewFaces;
		%feature("autodoc", "* Return the faces created for surface <I>.
	:param I:
	:type I: int
	:rtype: TopTools_ListOfShape") NewFaces;
		const TopTools_ListOfShape & NewFaces (const Standard_Integer I);

		/****************** Radius ******************/
		%feature("compactdefaultargs") Radius;
		%feature("autodoc", "* Returns the radius of the fillet along the contour of index IC in the internal data structure of this algorithm Warning - Use this function only if the radius is constant. - -1. is returned if IC is outside the bounds of the table of contours or if E does not belong to the contour of index IC.
	:param IC:
	:type IC: int
	:rtype: float") Radius;
		Standard_Real Radius (const Standard_Integer IC);

		/****************** Radius ******************/
		%feature("compactdefaultargs") Radius;
		%feature("autodoc", "* Returns the radius of the fillet along the edge E of the contour of index IC in the internal data structure of this algorithm. Warning - Use this function only if the radius is constant. - -1 is returned if IC is outside the bounds of the table of contours or if E does not belong to the contour of index IC.
	:param IC:
	:type IC: int
	:param E:
	:type E: TopoDS_Edge
	:rtype: float") Radius;
		Standard_Real Radius (const Standard_Integer IC,const TopoDS_Edge & E);

		/****************** RelativeAbscissa ******************/
		%feature("compactdefaultargs") RelativeAbscissa;
		%feature("autodoc", "* Returns the relative curvilinear abscissa (i.e. between 0 and 1) of the vertex V on the contour of index IC in the internal data structure of this algorithm. Warning Returns -1. if: - IC is outside the bounds of the table of contours, or - V is not on the contour of index IC.
	:param IC:
	:type IC: int
	:param V:
	:type V: TopoDS_Vertex
	:rtype: float") RelativeAbscissa;
		Standard_Real RelativeAbscissa (const Standard_Integer IC,const TopoDS_Vertex & V);

		/****************** Remove ******************/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "* Removes the contour in the internal data structure of this algorithm which contains the edge E of the shape. Warning Nothing is done if the edge E does not belong to the contour in the internal data structure of this algorithm.
	:param E:
	:type E: TopoDS_Edge
	:rtype: None") Remove;
		void Remove (const TopoDS_Edge & E);

		/****************** Reset ******************/
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", "* Reinitializes this algorithm, thus canceling the effects of the Build function. This function allows modifications to be made to the contours and fillet parameters in order to rebuild the shape.
	:rtype: None") Reset;
		void Reset ();

		/****************** ResetContour ******************/
		%feature("compactdefaultargs") ResetContour;
		%feature("autodoc", "* Erases the radius information on the contour of index IC in the internal data structure of this algorithm. Use the SetRadius function to reset this data. Warning Nothing is done if IC is outside the bounds of the table of contours.
	:param IC:
	:type IC: int
	:rtype: None") ResetContour;
		void ResetContour (const Standard_Integer IC);

		/****************** Sect ******************/
		%feature("compactdefaultargs") Sect;
		%feature("autodoc", ":param IC:
	:type IC: int
	:param IS:
	:type IS: int
	:rtype: opencascade::handle<ChFiDS_SecHArray1>") Sect;
		opencascade::handle<ChFiDS_SecHArray1> Sect (const Standard_Integer IC,const Standard_Integer IS);

		/****************** SetContinuity ******************/
		%feature("compactdefaultargs") SetContinuity;
		%feature("autodoc", "* Changes the parameters of continiuity InternalContinuity to produce fillet'surfaces with an continuity Ci (i=0,1 or 2). By defaultInternalContinuity = GeomAbs_C1. AngularTolerance is the G1 tolerance between fillet and support'faces.
	:param InternalContinuity:
	:type InternalContinuity: GeomAbs_Shape
	:param AngularTolerance:
	:type AngularTolerance: float
	:rtype: None") SetContinuity;
		void SetContinuity (const GeomAbs_Shape InternalContinuity,const Standard_Real AngularTolerance);

		/****************** SetFilletShape ******************/
		%feature("compactdefaultargs") SetFilletShape;
		%feature("autodoc", "* Assigns FShape as the type of fillet shape built by this algorithm.
	:param FShape:
	:type FShape: ChFi3d_FilletShape
	:rtype: None") SetFilletShape;
		void SetFilletShape (const ChFi3d_FilletShape FShape);

		/****************** SetLaw ******************/
		%feature("compactdefaultargs") SetLaw;
		%feature("autodoc", ":param IC:
	:type IC: int
	:param E:
	:type E: TopoDS_Edge
	:param L:
	:type L: Law_Function
	:rtype: None") SetLaw;
		void SetLaw (const Standard_Integer IC,const TopoDS_Edge & E,const opencascade::handle<Law_Function> & L);

		/****************** SetParams ******************/
		%feature("compactdefaultargs") SetParams;
		%feature("autodoc", ":param Tang:
	:type Tang: float
	:param Tesp:
	:type Tesp: float
	:param T2d:
	:type T2d: float
	:param TApp3d:
	:type TApp3d: float
	:param TolApp2d:
	:type TolApp2d: float
	:param Fleche:
	:type Fleche: float
	:rtype: None") SetParams;
		void SetParams (const Standard_Real Tang,const Standard_Real Tesp,const Standard_Real T2d,const Standard_Real TApp3d,const Standard_Real TolApp2d,const Standard_Real Fleche);

		/****************** SetRadius ******************/
		%feature("compactdefaultargs") SetRadius;
		%feature("autodoc", "* Sets the parameters of the fillet along the contour of index IC generated using the Add function in the internal data structure of this algorithm, where Radius is the radius of the fillet.
	:param Radius:
	:type Radius: float
	:param IC:
	:type IC: int
	:param IinC:
	:type IinC: int
	:rtype: None") SetRadius;
		void SetRadius (const Standard_Real Radius,const Standard_Integer IC,const Standard_Integer IinC);

		/****************** SetRadius ******************/
		%feature("compactdefaultargs") SetRadius;
		%feature("autodoc", "* Sets the parameters of the fillet along the contour of index IC generated using the Add function in the internal data structure of this algorithm, where the radius of the fillet evolves according to a linear evolution law defined from R1 to R2, between the first and last vertices of the contour of index IC.
	:param R1:
	:type R1: float
	:param R2:
	:type R2: float
	:param IC:
	:type IC: int
	:param IinC:
	:type IinC: int
	:rtype: None") SetRadius;
		void SetRadius (const Standard_Real R1,const Standard_Real R2,const Standard_Integer IC,const Standard_Integer IinC);

		/****************** SetRadius ******************/
		%feature("compactdefaultargs") SetRadius;
		%feature("autodoc", "* Sets the parameters of the fillet along the contour of index IC generated using the Add function in the internal data structure of this algorithm, where the radius of the fillet evolves according to the evolution law L, between the first and last vertices of the contour of index IC.
	:param L:
	:type L: Law_Function
	:param IC:
	:type IC: int
	:param IinC:
	:type IinC: int
	:rtype: None") SetRadius;
		void SetRadius (const opencascade::handle<Law_Function> & L,const Standard_Integer IC,const Standard_Integer IinC);

		/****************** SetRadius ******************/
		%feature("compactdefaultargs") SetRadius;
		%feature("autodoc", "* Sets the parameters of the fillet along the contour of index IC generated using the Add function in the internal data structure of this algorithm, where the radius of the fillet evolves according to the evolution law which interpolates the set of parameter and radius pairs given in the array UandR as follows: - the X coordinate of a point in UandR defines a relative parameter on the contour (i.e. a parameter between 0 and 1), - the Y coordinate of a point in UandR gives the corresponding value of the radius, and the radius evolves between the first and last vertices of the contour of index IC.
	:param UandR:
	:type UandR: TColgp_Array1OfPnt2d
	:param IC:
	:type IC: int
	:param IinC:
	:type IinC: int
	:rtype: None") SetRadius;
		void SetRadius (const TColgp_Array1OfPnt2d & UandR,const Standard_Integer IC,const Standard_Integer IinC);

		/****************** SetRadius ******************/
		%feature("compactdefaultargs") SetRadius;
		%feature("autodoc", "* Assigns Radius as the radius of the fillet on the edge E
	:param Radius:
	:type Radius: float
	:param IC:
	:type IC: int
	:param E:
	:type E: TopoDS_Edge
	:rtype: None") SetRadius;
		void SetRadius (const Standard_Real Radius,const Standard_Integer IC,const TopoDS_Edge & E);

		/****************** SetRadius ******************/
		%feature("compactdefaultargs") SetRadius;
		%feature("autodoc", ":param Radius:
	:type Radius: float
	:param IC:
	:type IC: int
	:param V:
	:type V: TopoDS_Vertex
	:rtype: None") SetRadius;
		void SetRadius (const Standard_Real Radius,const Standard_Integer IC,const TopoDS_Vertex & V);

		/****************** Simulate ******************/
		%feature("compactdefaultargs") Simulate;
		%feature("autodoc", ":param IC:
	:type IC: int
	:rtype: None") Simulate;
		void Simulate (const Standard_Integer IC);

		/****************** StripeStatus ******************/
		%feature("compactdefaultargs") StripeStatus;
		%feature("autodoc", "* returns the status concerning the contour IC in case of error ChFiDS_Ok : the computation is Ok ChFiDS_StartsolFailure : the computation can't start, perhaps the the radius is too big ChFiDS_TwistedSurface : the computation failed because of a twisted surface ChFiDS_WalkingFailure : there is a problem in the walking ChFiDS_Error: other error different from above
	:param IC:
	:type IC: int
	:rtype: ChFiDS_ErrorStatus") StripeStatus;
		ChFiDS_ErrorStatus StripeStatus (const Standard_Integer IC);

};


%extend BRepFilletAPI_MakeFillet {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
