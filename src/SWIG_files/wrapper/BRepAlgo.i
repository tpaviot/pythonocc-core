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
%define BREPALGODOCSTRING
"BRepAlgo module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_brepalgo.html"
%enddef
%module (package="OCC.Core", docstring=BREPALGODOCSTRING) BRepAlgo


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
#include<BRepAlgo_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TopoDS_module.hxx>
#include<GeomAbs_module.hxx>
#include<TopTools_module.hxx>
#include<BRepBuilderAPI_module.hxx>
#include<TopOpeBRepBuild_module.hxx>
#include<TopAbs_module.hxx>
#include<Adaptor3d_module.hxx>
#include<gp_module.hxx>
#include<Geom_module.hxx>
#include<TopExp_module.hxx>
#include<TopLoc_module.hxx>
#include<IntSurf_module.hxx>
#include<BRep_module.hxx>
#include<TopOpeBRepDS_module.hxx>
#include<Bnd_module.hxx>
#include<Message_module.hxx>
#include<TShort_module.hxx>
#include<Intf_module.hxx>
#include<TopOpeBRepTool_module.hxx>
#include<Poly_module.hxx>
#include<Extrema_module.hxx>
#include<BRepTools_module.hxx>
#include<IntCurveSurface_module.hxx>
#include<Geom2d_module.hxx>
#include<Geom2dAdaptor_module.hxx>
#include<BRepAdaptor_module.hxx>
#include<GeomAdaptor_module.hxx>
#include<Adaptor2d_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import TopoDS.i
%import GeomAbs.i
%import TopTools.i
%import BRepBuilderAPI.i
%import TopOpeBRepBuild.i
%import TopAbs.i
%import Adaptor3d.i
%import gp.i
%import Geom.i
/* public enums */
enum BRepAlgo_CheckStatus {
	BRepAlgo_OK = 0,
	BRepAlgo_NOK = 1,
};

/* end public enums declaration */

/* handles */
%wrap_handle(BRepAlgo_AsDes)
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/*****************
* class BRepAlgo *
*****************/
%rename(brepalgo) BRepAlgo;
class BRepAlgo {
	public:
		/****************** ConcatenateWire ******************/
		%feature("compactdefaultargs") ConcatenateWire;
		%feature("autodoc", "* this method makes a wire whose edges are C1 from a Wire whose edges could be G1. It removes a vertex between G1 edges. Option can be G1 or C1.
	:param Wire:
	:type Wire: TopoDS_Wire
	:param Option:
	:type Option: GeomAbs_Shape
	:param AngularTolerance: default value is 1.0e-4
	:type AngularTolerance: float
	:rtype: TopoDS_Wire") ConcatenateWire;
		static TopoDS_Wire ConcatenateWire (const TopoDS_Wire & Wire,const GeomAbs_Shape Option,const Standard_Real AngularTolerance = 1.0e-4);

		/****************** ConcatenateWireC0 ******************/
		%feature("compactdefaultargs") ConcatenateWireC0;
		%feature("autodoc", "* this method makes an edge from a wire. Junction points between edges of wire may be sharp, resulting curve of the resulting edge may be C0.
	:param Wire:
	:type Wire: TopoDS_Wire
	:rtype: TopoDS_Edge") ConcatenateWireC0;
		static TopoDS_Edge ConcatenateWireC0 (const TopoDS_Wire & Wire);

		/****************** IsTopologicallyValid ******************/
		%feature("compactdefaultargs") IsTopologicallyValid;
		%feature("autodoc", "* Checks if the shape is 'correct'. If not, returns <Standard_False>, else returns <Standard_True>. This method differs from the previous one in the fact that no geometric contols (intersection of wires, pcurve validity) are performed.
	:param S:
	:type S: TopoDS_Shape
	:rtype: bool") IsTopologicallyValid;
		static Standard_Boolean IsTopologicallyValid (const TopoDS_Shape & S);

		/****************** IsValid ******************/
		%feature("compactdefaultargs") IsValid;
		%feature("autodoc", "* Checks if the shape is 'correct'. If not, returns <Standard_False>, else returns <Standard_True>.
	:param S:
	:type S: TopoDS_Shape
	:rtype: bool") IsValid;
		static Standard_Boolean IsValid (const TopoDS_Shape & S);

		/****************** IsValid ******************/
		%feature("compactdefaultargs") IsValid;
		%feature("autodoc", "* Checks if the Generated and Modified Faces from the shapes <arguments> in the shape <result> are 'correct'. The args may be empty, then all faces will be checked. If <Closed> is True, only closed shape are valid. If <GeomCtrl> is False the geometry of new vertices and edges are not verified and the auto-intersection of new wires are not searched.
	:param theArgs:
	:type theArgs: TopTools_ListOfShape
	:param theResult:
	:type theResult: TopoDS_Shape
	:param closedSolid: default value is Standard_False
	:type closedSolid: bool
	:param GeomCtrl: default value is Standard_True
	:type GeomCtrl: bool
	:rtype: bool") IsValid;
		static Standard_Boolean IsValid (const TopTools_ListOfShape & theArgs,const TopoDS_Shape & theResult,const Standard_Boolean closedSolid = Standard_False,const Standard_Boolean GeomCtrl = Standard_True);

};


%extend BRepAlgo {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class BRepAlgo_AsDes *
***********************/
class BRepAlgo_AsDes : public Standard_Transient {
	public:
		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "* Stores <SS> as a futur subshape of <S>.
	:param S:
	:type S: TopoDS_Shape
	:param SS:
	:type SS: TopoDS_Shape
	:rtype: None") Add;
		void Add (const TopoDS_Shape & S,const TopoDS_Shape & SS);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "* Stores <SS> as futurs SubShapes of <S>.
	:param S:
	:type S: TopoDS_Shape
	:param SS:
	:type SS: TopTools_ListOfShape
	:rtype: None") Add;
		void Add (const TopoDS_Shape & S,const TopTools_ListOfShape & SS);

		/****************** Ascendant ******************/
		%feature("compactdefaultargs") Ascendant;
		%feature("autodoc", "* Returns the Shape containing <S>.
	:param S:
	:type S: TopoDS_Shape
	:rtype: TopTools_ListOfShape") Ascendant;
		const TopTools_ListOfShape & Ascendant (const TopoDS_Shape & S);

		/****************** BRepAlgo_AsDes ******************/
		%feature("compactdefaultargs") BRepAlgo_AsDes;
		%feature("autodoc", "* Creates an empty AsDes.
	:rtype: None") BRepAlgo_AsDes;
		 BRepAlgo_AsDes ();

		/****************** ChangeDescendant ******************/
		%feature("compactdefaultargs") ChangeDescendant;
		%feature("autodoc", "* Returns futur subhapes of <S>.
	:param S:
	:type S: TopoDS_Shape
	:rtype: TopTools_ListOfShape") ChangeDescendant;
		TopTools_ListOfShape & ChangeDescendant (const TopoDS_Shape & S);

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", ":rtype: None") Clear;
		void Clear ();

		/****************** Descendant ******************/
		%feature("compactdefaultargs") Descendant;
		%feature("autodoc", "* Returns futur subhapes of <S>.
	:param S:
	:type S: TopoDS_Shape
	:rtype: TopTools_ListOfShape") Descendant;
		const TopTools_ListOfShape & Descendant (const TopoDS_Shape & S);

		/****************** HasAscendant ******************/
		%feature("compactdefaultargs") HasAscendant;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:rtype: bool") HasAscendant;
		Standard_Boolean HasAscendant (const TopoDS_Shape & S);

		/****************** HasCommonDescendant ******************/
		%feature("compactdefaultargs") HasCommonDescendant;
		%feature("autodoc", "* Returns True if (S1> and <S2> has common Descendants. Stores in <LC> the Commons Descendants.
	:param S1:
	:type S1: TopoDS_Shape
	:param S2:
	:type S2: TopoDS_Shape
	:param LC:
	:type LC: TopTools_ListOfShape
	:rtype: bool") HasCommonDescendant;
		Standard_Boolean HasCommonDescendant (const TopoDS_Shape & S1,const TopoDS_Shape & S2,TopTools_ListOfShape & LC);

		/****************** HasDescendant ******************/
		%feature("compactdefaultargs") HasDescendant;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:rtype: bool") HasDescendant;
		Standard_Boolean HasDescendant (const TopoDS_Shape & S);

		/****************** Remove ******************/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "* Remove <S> from me.
	:param S:
	:type S: TopoDS_Shape
	:rtype: None") Remove;
		void Remove (const TopoDS_Shape & S);

		/****************** Replace ******************/
		%feature("compactdefaultargs") Replace;
		%feature("autodoc", "* Replace <OldS> by <NewS>. <OldS> disapear from <self>.
	:param OldS:
	:type OldS: TopoDS_Shape
	:param NewS:
	:type NewS: TopoDS_Shape
	:rtype: None") Replace;
		void Replace (const TopoDS_Shape & OldS,const TopoDS_Shape & NewS);

};


%make_alias(BRepAlgo_AsDes)

%extend BRepAlgo_AsDes {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class BRepAlgo_BooleanOperation *
**********************************/
%nodefaultctor BRepAlgo_BooleanOperation;
class BRepAlgo_BooleanOperation : public BRepBuilderAPI_MakeShape {
	public:
		/****************** Builder ******************/
		%feature("compactdefaultargs") Builder;
		%feature("autodoc", ":rtype: opencascade::handle<TopOpeBRepBuild_HBuilder>") Builder;
		opencascade::handle<TopOpeBRepBuild_HBuilder> Builder ();

		/****************** IsDeleted ******************/
		%feature("compactdefaultargs") IsDeleted;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:rtype: bool") IsDeleted;
		virtual Standard_Boolean IsDeleted (const TopoDS_Shape & S);

		/****************** Modified ******************/
		%feature("compactdefaultargs") Modified;
		%feature("autodoc", "* Returns the list of shapes modified from the shape <S>.
	:param S:
	:type S: TopoDS_Shape
	:rtype: TopTools_ListOfShape") Modified;
		virtual const TopTools_ListOfShape & Modified (const TopoDS_Shape & S);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", ":param St1:
	:type St1: TopAbs_State
	:param St2:
	:type St2: TopAbs_State
	:rtype: None") Perform;
		void Perform (const TopAbs_State St1,const TopAbs_State St2);

		/****************** PerformDS ******************/
		%feature("compactdefaultargs") PerformDS;
		%feature("autodoc", ":rtype: None") PerformDS;
		void PerformDS ();

		/****************** Shape1 ******************/
		%feature("compactdefaultargs") Shape1;
		%feature("autodoc", "* Returns the first shape involved in this Boolean operation.
	:rtype: TopoDS_Shape") Shape1;
		const TopoDS_Shape  Shape1 ();

		/****************** Shape2 ******************/
		%feature("compactdefaultargs") Shape2;
		%feature("autodoc", "* Returns the second shape involved in this Boolean operation.
	:rtype: TopoDS_Shape") Shape2;
		const TopoDS_Shape  Shape2 ();

};


%extend BRepAlgo_BooleanOperation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class BRepAlgo_FaceRestrictor *
********************************/
class BRepAlgo_FaceRestrictor {
	public:
		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "* Add the wire <W> to the set of wires. //! Warning: The Wires must be closed. //! The edges of <W> can be modified if they have not pcurves on the surface <S> of <F>. In this case if <Proj> is false the first pcurve of the edge is positionned on <S>. if <Proj> is True ,the Pcurve On <S> is the projection of the curve 3d on <F>.
	:param W:
	:type W: TopoDS_Wire
	:rtype: None") Add;
		void Add (TopoDS_Wire & W);

		/****************** BRepAlgo_FaceRestrictor ******************/
		%feature("compactdefaultargs") BRepAlgo_FaceRestrictor;
		%feature("autodoc", ":rtype: None") BRepAlgo_FaceRestrictor;
		 BRepAlgo_FaceRestrictor ();

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "* Removes all the Wires
	:rtype: None") Clear;
		void Clear ();

		/****************** Current ******************/
		%feature("compactdefaultargs") Current;
		%feature("autodoc", ":rtype: TopoDS_Face") Current;
		TopoDS_Face Current ();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* the surface of <F> will be the the surface of each new faces built. <Proj> is used to update pcurves on edges if necessary. See Add().
	:param F:
	:type F: TopoDS_Face
	:param Proj: default value is Standard_False
	:type Proj: bool
	:param ControlOrientation: default value is Standard_False
	:type ControlOrientation: bool
	:rtype: None") Init;
		void Init (const TopoDS_Face & F,const Standard_Boolean Proj = Standard_False,const Standard_Boolean ControlOrientation = Standard_False);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", ":rtype: bool") IsDone;
		Standard_Boolean IsDone ();

		/****************** More ******************/
		%feature("compactdefaultargs") More;
		%feature("autodoc", ":rtype: bool") More;
		Standard_Boolean More ();

		/****************** Next ******************/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", ":rtype: None") Next;
		void Next ();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Evaluate all the faces limited by the set of Wires.
	:rtype: None") Perform;
		void Perform ();

};


%extend BRepAlgo_FaceRestrictor {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class BRepAlgo_Image *
***********************/
class BRepAlgo_Image {
	public:
		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "* Add <NewS> to the image of <OldS>.
	:param OldS:
	:type OldS: TopoDS_Shape
	:param NewS:
	:type NewS: TopoDS_Shape
	:rtype: None") Add;
		void Add (const TopoDS_Shape & OldS,const TopoDS_Shape & NewS);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "* Add <NewS> to the image of <OldS>.
	:param OldS:
	:type OldS: TopoDS_Shape
	:param NewS:
	:type NewS: TopTools_ListOfShape
	:rtype: None") Add;
		void Add (const TopoDS_Shape & OldS,const TopTools_ListOfShape & NewS);

		/****************** BRepAlgo_Image ******************/
		%feature("compactdefaultargs") BRepAlgo_Image;
		%feature("autodoc", ":rtype: None") BRepAlgo_Image;
		 BRepAlgo_Image ();

		/****************** Bind ******************/
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", "* Links <NewS> as image of <OldS>.
	:param OldS:
	:type OldS: TopoDS_Shape
	:param NewS:
	:type NewS: TopoDS_Shape
	:rtype: None") Bind;
		void Bind (const TopoDS_Shape & OldS,const TopoDS_Shape & NewS);

		/****************** Bind ******************/
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", "* Links <NewS> as image of <OldS>.
	:param OldS:
	:type OldS: TopoDS_Shape
	:param NewS:
	:type NewS: TopTools_ListOfShape
	:rtype: None") Bind;
		void Bind (const TopoDS_Shape & OldS,const TopTools_ListOfShape & NewS);

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", ":rtype: None") Clear;
		void Clear ();

		/****************** Compact ******************/
		%feature("compactdefaultargs") Compact;
		%feature("autodoc", "* Keeps only the link between roots and lastimage.
	:rtype: None") Compact;
		void Compact ();

		/****************** Filter ******************/
		%feature("compactdefaultargs") Filter;
		%feature("autodoc", "* Deletes in the images the shape of type <ShapeType> which are not in <S>. Warning: Compact() must be call before.
	:param S:
	:type S: TopoDS_Shape
	:param ShapeType:
	:type ShapeType: TopAbs_ShapeEnum
	:rtype: None") Filter;
		void Filter (const TopoDS_Shape & S,const TopAbs_ShapeEnum ShapeType);

		/****************** HasImage ******************/
		%feature("compactdefaultargs") HasImage;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:rtype: bool") HasImage;
		Standard_Boolean HasImage (const TopoDS_Shape & S);

		/****************** Image ******************/
		%feature("compactdefaultargs") Image;
		%feature("autodoc", "* Returns the Image of <S>. Returns <S> in the list if HasImage(S) is false.
	:param S:
	:type S: TopoDS_Shape
	:rtype: TopTools_ListOfShape") Image;
		const TopTools_ListOfShape & Image (const TopoDS_Shape & S);

		/****************** ImageFrom ******************/
		%feature("compactdefaultargs") ImageFrom;
		%feature("autodoc", "* Returns the generator of <S>
	:param S:
	:type S: TopoDS_Shape
	:rtype: TopoDS_Shape") ImageFrom;
		const TopoDS_Shape  ImageFrom (const TopoDS_Shape & S);

		/****************** IsImage ******************/
		%feature("compactdefaultargs") IsImage;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:rtype: bool") IsImage;
		Standard_Boolean IsImage (const TopoDS_Shape & S);

		/****************** LastImage ******************/
		%feature("compactdefaultargs") LastImage;
		%feature("autodoc", "* Stores in <L> the images of images of...images of <S>. <L> contains only <S> if HasImage(S) is false.
	:param S:
	:type S: TopoDS_Shape
	:param L:
	:type L: TopTools_ListOfShape
	:rtype: None") LastImage;
		void LastImage (const TopoDS_Shape & S,TopTools_ListOfShape & L);

		/****************** Remove ******************/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "* Remove <S> to set of images.
	:param S:
	:type S: TopoDS_Shape
	:rtype: None") Remove;
		void Remove (const TopoDS_Shape & S);

		/****************** Root ******************/
		%feature("compactdefaultargs") Root;
		%feature("autodoc", "* Returns the upper generator of <S>
	:param S:
	:type S: TopoDS_Shape
	:rtype: TopoDS_Shape") Root;
		const TopoDS_Shape  Root (const TopoDS_Shape & S);

		/****************** Roots ******************/
		%feature("compactdefaultargs") Roots;
		%feature("autodoc", ":rtype: TopTools_ListOfShape") Roots;
		const TopTools_ListOfShape & Roots ();

		/****************** SetRoot ******************/
		%feature("compactdefaultargs") SetRoot;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:rtype: None") SetRoot;
		void SetRoot (const TopoDS_Shape & S);

};


%extend BRepAlgo_Image {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class BRepAlgo_Loop *
**********************/
class BRepAlgo_Loop {
	public:
		/****************** AddConstEdge ******************/
		%feature("compactdefaultargs") AddConstEdge;
		%feature("autodoc", "* Add <E> as const edge, E can be in the result.
	:param E:
	:type E: TopoDS_Edge
	:rtype: None") AddConstEdge;
		void AddConstEdge (const TopoDS_Edge & E);

		/****************** AddConstEdges ******************/
		%feature("compactdefaultargs") AddConstEdges;
		%feature("autodoc", "* Add <LE> as a set of const edges.
	:param LE:
	:type LE: TopTools_ListOfShape
	:rtype: None") AddConstEdges;
		void AddConstEdges (const TopTools_ListOfShape & LE);

		/****************** AddEdge ******************/
		%feature("compactdefaultargs") AddEdge;
		%feature("autodoc", "* Add E with <LV>. <E> will be copied and trim by vertices in <LV>.
	:param E:
	:type E: TopoDS_Edge
	:param LV:
	:type LV: TopTools_ListOfShape
	:rtype: None") AddEdge;
		void AddEdge (TopoDS_Edge & E,const TopTools_ListOfShape & LV);

		/****************** BRepAlgo_Loop ******************/
		%feature("compactdefaultargs") BRepAlgo_Loop;
		%feature("autodoc", ":rtype: None") BRepAlgo_Loop;
		 BRepAlgo_Loop ();

		/****************** CutEdge ******************/
		%feature("compactdefaultargs") CutEdge;
		%feature("autodoc", "* Cut the edge <E> in several edges <NE> on the vertices<VonE>.
	:param E:
	:type E: TopoDS_Edge
	:param VonE:
	:type VonE: TopTools_ListOfShape
	:param NE:
	:type NE: TopTools_ListOfShape
	:rtype: None") CutEdge;
		void CutEdge (const TopoDS_Edge & E,const TopTools_ListOfShape & VonE,TopTools_ListOfShape & NE);

		/****************** GetVerticesForSubstitute ******************/
		%feature("compactdefaultargs") GetVerticesForSubstitute;
		%feature("autodoc", "* Returns the datamap of vertices with their substitutes.
	:param VerVerMap:
	:type VerVerMap: TopTools_DataMapOfShapeShape
	:rtype: None") GetVerticesForSubstitute;
		void GetVerticesForSubstitute (TopTools_DataMapOfShapeShape & VerVerMap);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Init with <F> the set of edges must have pcurves on <F>.
	:param F:
	:type F: TopoDS_Face
	:rtype: None") Init;
		void Init (const TopoDS_Face & F);

		/****************** NewEdges ******************/
		%feature("compactdefaultargs") NewEdges;
		%feature("autodoc", "* Returns the list of new edges built from an edge <E> it can be an empty list.
	:param E:
	:type E: TopoDS_Edge
	:rtype: TopTools_ListOfShape") NewEdges;
		const TopTools_ListOfShape & NewEdges (const TopoDS_Edge & E);

		/****************** NewFaces ******************/
		%feature("compactdefaultargs") NewFaces;
		%feature("autodoc", "* Returns the list of faces. Warning: The method <WiresToFaces> as to be called before. can be an empty list.
	:rtype: TopTools_ListOfShape") NewFaces;
		const TopTools_ListOfShape & NewFaces ();

		/****************** NewWires ******************/
		%feature("compactdefaultargs") NewWires;
		%feature("autodoc", "* Returns the list of wires performed. can be an empty list.
	:rtype: TopTools_ListOfShape") NewWires;
		const TopTools_ListOfShape & NewWires ();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Make loops.
	:rtype: None") Perform;
		void Perform ();

		/****************** VerticesForSubstitute ******************/
		%feature("compactdefaultargs") VerticesForSubstitute;
		%feature("autodoc", ":param VerVerMap:
	:type VerVerMap: TopTools_DataMapOfShapeShape
	:rtype: None") VerticesForSubstitute;
		void VerticesForSubstitute (TopTools_DataMapOfShapeShape & VerVerMap);

		/****************** WiresToFaces ******************/
		%feature("compactdefaultargs") WiresToFaces;
		%feature("autodoc", "* Build faces from the wires result.
	:rtype: None") WiresToFaces;
		void WiresToFaces ();

};


%extend BRepAlgo_Loop {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class BRepAlgo_NormalProjection *
**********************************/
class BRepAlgo_NormalProjection {
	public:
		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "* Add an edge or a wire to the list of shape to project
	:param ToProj:
	:type ToProj: TopoDS_Shape
	:rtype: None") Add;
		void Add (const TopoDS_Shape & ToProj);

		/****************** Ancestor ******************/
		%feature("compactdefaultargs") Ancestor;
		%feature("autodoc", "* For a resulting edge, returns the corresponding initial edge.
	:param E:
	:type E: TopoDS_Edge
	:rtype: TopoDS_Shape") Ancestor;
		const TopoDS_Shape  Ancestor (const TopoDS_Edge & E);

		/****************** BRepAlgo_NormalProjection ******************/
		%feature("compactdefaultargs") BRepAlgo_NormalProjection;
		%feature("autodoc", ":rtype: None") BRepAlgo_NormalProjection;
		 BRepAlgo_NormalProjection ();

		/****************** BRepAlgo_NormalProjection ******************/
		%feature("compactdefaultargs") BRepAlgo_NormalProjection;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:rtype: None") BRepAlgo_NormalProjection;
		 BRepAlgo_NormalProjection (const TopoDS_Shape & S);

		/****************** Build ******************/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "* Builds the result as a compound.
	:rtype: None") Build;
		void Build ();

		/****************** BuildWire ******************/
		%feature("compactdefaultargs") BuildWire;
		%feature("autodoc", "* build the result as a list of wire if possible in -- a first returns a wire only if there is only a wire.
	:param Liste:
	:type Liste: TopTools_ListOfShape
	:rtype: bool") BuildWire;
		Standard_Boolean BuildWire (TopTools_ListOfShape & Liste);

		/****************** Compute3d ******************/
		%feature("compactdefaultargs") Compute3d;
		%feature("autodoc", "* if With3d = Standard_False the 3dcurve is not computed the initial 3dcurve is kept to build the resulting edges.
	:param With3d: default value is Standard_True
	:type With3d: bool
	:rtype: None") Compute3d;
		void Compute3d (const Standard_Boolean With3d = Standard_True);

		/****************** Couple ******************/
		%feature("compactdefaultargs") Couple;
		%feature("autodoc", "* For a projected edge, returns the corresponding initial face.
	:param E:
	:type E: TopoDS_Edge
	:rtype: TopoDS_Shape") Couple;
		const TopoDS_Shape  Couple (const TopoDS_Edge & E);

		/****************** Generated ******************/
		%feature("compactdefaultargs") Generated;
		%feature("autodoc", "* Returns the list of shapes generated from the shape <S>.
	:param S:
	:type S: TopoDS_Shape
	:rtype: TopTools_ListOfShape") Generated;
		const TopTools_ListOfShape & Generated (const TopoDS_Shape & S);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:rtype: None") Init;
		void Init (const TopoDS_Shape & S);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", ":rtype: bool") IsDone;
		Standard_Boolean IsDone ();

		/****************** IsElementary ******************/
		%feature("compactdefaultargs") IsElementary;
		%feature("autodoc", ":param C:
	:type C: Adaptor3d_Curve
	:rtype: bool") IsElementary;
		Standard_Boolean IsElementary (const Adaptor3d_Curve & C);

		/****************** Projection ******************/
		%feature("compactdefaultargs") Projection;
		%feature("autodoc", "* returns the result
	:rtype: TopoDS_Shape") Projection;
		const TopoDS_Shape  Projection ();

		/****************** SetDefaultParams ******************/
		%feature("compactdefaultargs") SetDefaultParams;
		%feature("autodoc", "* Set the parameters used for computation in their default values
	:rtype: None") SetDefaultParams;
		void SetDefaultParams ();

		/****************** SetLimit ******************/
		%feature("compactdefaultargs") SetLimit;
		%feature("autodoc", "* Manage limitation of projected edges.
	:param FaceBoundaries: default value is Standard_True
	:type FaceBoundaries: bool
	:rtype: None") SetLimit;
		void SetLimit (const Standard_Boolean FaceBoundaries = Standard_True);

		/****************** SetMaxDistance ******************/
		%feature("compactdefaultargs") SetMaxDistance;
		%feature("autodoc", "* Sets the maximum distance between target shape and shape to project. If this condition is not satisfied then corresponding part of solution is discarded. if MaxDist < 0 then this method does not affect the algorithm
	:param MaxDist:
	:type MaxDist: float
	:rtype: None") SetMaxDistance;
		void SetMaxDistance (const Standard_Real MaxDist);

		/****************** SetParams ******************/
		%feature("compactdefaultargs") SetParams;
		%feature("autodoc", "* Set the parameters used for computation Tol3d is the requiered tolerance between the 3d projected curve and its 2d representation InternalContinuity is the order of constraints used for approximation. MaxDeg and MaxSeg are the maximum degree and the maximum number of segment for BSpline resulting of an approximation.
	:param Tol3D:
	:type Tol3D: float
	:param Tol2D:
	:type Tol2D: float
	:param InternalContinuity:
	:type InternalContinuity: GeomAbs_Shape
	:param MaxDegree:
	:type MaxDegree: int
	:param MaxSeg:
	:type MaxSeg: int
	:rtype: None") SetParams;
		void SetParams (const Standard_Real Tol3D,const Standard_Real Tol2D,const GeomAbs_Shape InternalContinuity,const Standard_Integer MaxDegree,const Standard_Integer MaxSeg);

};


%extend BRepAlgo_NormalProjection {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class BRepAlgo_Tool *
**********************/
class BRepAlgo_Tool {
	public:
		/****************** Deboucle3D ******************/
		%feature("compactdefaultargs") Deboucle3D;
		%feature("autodoc", "* Remove the non valid part of an offsetshape 1 - Remove all the free boundary and the faces connex to such edges. 2 - Remove all the shapes not valid in the result (according to the side of offseting) in this verion only the first point is implemented.
	:param S:
	:type S: TopoDS_Shape
	:param Boundary:
	:type Boundary: TopTools_MapOfShape
	:rtype: TopoDS_Shape") Deboucle3D;
		static TopoDS_Shape Deboucle3D (const TopoDS_Shape & S,const TopTools_MapOfShape & Boundary);

};


%extend BRepAlgo_Tool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class BRepAlgo_Common *
************************/
class BRepAlgo_Common : public BRepAlgo_BooleanOperation {
	public:
		/****************** BRepAlgo_Common ******************/
		%feature("compactdefaultargs") BRepAlgo_Common;
		%feature("autodoc", "* Constructs the common part of shapes S1 and S2.
	:param S1:
	:type S1: TopoDS_Shape
	:param S2:
	:type S2: TopoDS_Shape
	:rtype: None") BRepAlgo_Common;
		 BRepAlgo_Common (const TopoDS_Shape & S1,const TopoDS_Shape & S2);

};


%extend BRepAlgo_Common {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************
* class BRepAlgo_Cut *
*********************/
class BRepAlgo_Cut : public BRepAlgo_BooleanOperation {
	public:
		/****************** BRepAlgo_Cut ******************/
		%feature("compactdefaultargs") BRepAlgo_Cut;
		%feature("autodoc", "* Cuts the shape S2 from the shape S1.
	:param S1:
	:type S1: TopoDS_Shape
	:param S2:
	:type S2: TopoDS_Shape
	:rtype: None") BRepAlgo_Cut;
		 BRepAlgo_Cut (const TopoDS_Shape & S1,const TopoDS_Shape & S2);

};


%extend BRepAlgo_Cut {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class BRepAlgo_Fuse *
**********************/
class BRepAlgo_Fuse : public BRepAlgo_BooleanOperation {
	public:
		/****************** BRepAlgo_Fuse ******************/
		%feature("compactdefaultargs") BRepAlgo_Fuse;
		%feature("autodoc", "* Fuse S1 and S2.
	:param S1:
	:type S1: TopoDS_Shape
	:param S2:
	:type S2: TopoDS_Shape
	:rtype: None") BRepAlgo_Fuse;
		 BRepAlgo_Fuse (const TopoDS_Shape & S1,const TopoDS_Shape & S2);

};


%extend BRepAlgo_Fuse {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class BRepAlgo_Section *
*************************/
class BRepAlgo_Section : public BRepAlgo_BooleanOperation {
	public:
		/****************** Approximation ******************/
		%feature("compactdefaultargs") Approximation;
		%feature("autodoc", "* Defines an option for computation of further intersections. This computation will be performed by the function Build in this framework. By default, the underlying 3D geometry attached to each elementary edge of the result of a computed intersection is: - analytic where possible, provided the corresponding geometry corresponds to a type of analytic curve defined in the Geom package; for example the intersection of a cylindrical shape with a plane gives an ellipse or a circle; - or elsewhere, given as a succession of points grouped together in a BSpline curve of degree 1. If Approx equals true, when further computations are performed in this framework with the function Build, these edges will have an attached 3D geometry which is a BSpline approximation of the computed set of points. Note that as a result, approximations will be computed on edges built only on new intersection lines.
	:param B:
	:type B: bool
	:rtype: None") Approximation;
		void Approximation (const Standard_Boolean B);

		/****************** BRepAlgo_Section ******************/
		%feature("compactdefaultargs") BRepAlgo_Section;
		%feature("autodoc", ":param Sh1:
	:type Sh1: TopoDS_Shape
	:param Sh2:
	:type Sh2: TopoDS_Shape
	:param PerformNow: default value is Standard_True
	:type PerformNow: bool
	:rtype: None") BRepAlgo_Section;
		 BRepAlgo_Section (const TopoDS_Shape & Sh1,const TopoDS_Shape & Sh2,const Standard_Boolean PerformNow = Standard_True);

		/****************** BRepAlgo_Section ******************/
		%feature("compactdefaultargs") BRepAlgo_Section;
		%feature("autodoc", ":param Sh:
	:type Sh: TopoDS_Shape
	:param Pl:
	:type Pl: gp_Pln
	:param PerformNow: default value is Standard_True
	:type PerformNow: bool
	:rtype: None") BRepAlgo_Section;
		 BRepAlgo_Section (const TopoDS_Shape & Sh,const gp_Pln & Pl,const Standard_Boolean PerformNow = Standard_True);

		/****************** BRepAlgo_Section ******************/
		%feature("compactdefaultargs") BRepAlgo_Section;
		%feature("autodoc", ":param Sh:
	:type Sh: TopoDS_Shape
	:param Sf:
	:type Sf: Geom_Surface
	:param PerformNow: default value is Standard_True
	:type PerformNow: bool
	:rtype: None") BRepAlgo_Section;
		 BRepAlgo_Section (const TopoDS_Shape & Sh,const opencascade::handle<Geom_Surface> & Sf,const Standard_Boolean PerformNow = Standard_True);

		/****************** BRepAlgo_Section ******************/
		%feature("compactdefaultargs") BRepAlgo_Section;
		%feature("autodoc", ":param Sf:
	:type Sf: Geom_Surface
	:param Sh:
	:type Sh: TopoDS_Shape
	:param PerformNow: default value is Standard_True
	:type PerformNow: bool
	:rtype: None") BRepAlgo_Section;
		 BRepAlgo_Section (const opencascade::handle<Geom_Surface> & Sf,const TopoDS_Shape & Sh,const Standard_Boolean PerformNow = Standard_True);

		/****************** BRepAlgo_Section ******************/
		%feature("compactdefaultargs") BRepAlgo_Section;
		%feature("autodoc", "* This and the above algorithms construct a framework for computing the section lines of - the two shapes Sh1 and Sh2, or - the shape Sh and the plane Pl, or - the shape Sh and the surface Sf, or - the surface Sf and the shape Sh, or - the two surfaces Sf1 and Sf2, and builds the result if PerformNow equals true, its default value. If PerformNow equals false, the intersection will be computed later by the function Build. The constructed shape will be returned by the function Shape. This is a compound object composed of edges. These intersection edges may be built: - on new intersection lines, or - on coincident portions of edges in the two intersected shapes. These intersection edges are independent: they are not chained or grouped in wires. If no intersection edge exists, the result is an empty compound object. Note that other objects than TopoDS_Shape shapes involved in these syntaxes are converted into faces or shells before performing the computation of the intersection. A shape resulting from this conversion can be retrieved with the function Shape1 or Shape2. Parametric 2D curves on intersection edges No parametric 2D curve (pcurve) is defined for each elementary edge of the result. To attach such parametric curves to the constructed edges you may use a constructor with the PerformNow flag equal to false; then you use: - the function ComputePCurveOn1 to ask for the additional computation of a pcurve in the parametric space of the first shape, - the function ComputePCurveOn2 to ask for the additional computation of a pcurve in the parametric space of the second shape, - in the end, the function Build to construct the result. Note that as a result, pcurves will only be added on edges built on new intersection lines. Approximation of intersection edges The underlying 3D geometry attached to each elementary edge of the result is: - analytic where possible, provided the corresponding geometry corresponds to a type of analytic curve defined in the Geom package; for example, the intersection of a cylindrical shape with a plane gives an ellipse or a circle; - or elsewhere, given as a succession of points grouped together in a BSpline curve of degree 1. If you prefer to have an attached 3D geometry which is a BSpline approximation of the computed set of points on computed elementary intersection edges whose underlying geometry is not analytic, you may use a constructor with the PerformNow flag equal to false. Then you use: - the function Approximation to ask for this computation option, and - the function Build to construct the result. Note that as a result, approximations will only be computed on edges built on new intersection lines. Example You may also combine these computation options. In the following example: - each elementary edge of the computed intersection, built on a new intersection line, which does not correspond to an analytic Geom curve, will be approximated by a BSpline curve whose degree is not greater than 8. - each elementary edge built on a new intersection line, will have: - a pcurve in the parametric space of the shape S1, - no pcurve in the parametric space of the shape S2. // TopoDS_Shape S1 = ... , S2 = ... ; Standard_Boolean PerformNow = Standard_False; BRepAlgo_Section S ( S1, S2, PerformNow ); S.ComputePCurveOn1 (Standard_True); S.Approximation (Standard_True); S.Build(); TopoDS_Shape R = S.Shape();
	:param Sf1:
	:type Sf1: Geom_Surface
	:param Sf2:
	:type Sf2: Geom_Surface
	:param PerformNow: default value is Standard_True
	:type PerformNow: bool
	:rtype: None") BRepAlgo_Section;
		 BRepAlgo_Section (const opencascade::handle<Geom_Surface> & Sf1,const opencascade::handle<Geom_Surface> & Sf2,const Standard_Boolean PerformNow = Standard_True);

		/****************** Build ******************/
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "* Performs the computation of the section lines between the two parts defined at the time of construction of this framework or reinitialized with the Init1 and Init2 functions. The constructed shape will be returned by the function Shape. This is a compound object composed of edges. These intersection edges may be built: - on new intersection lines, or - on coincident portions of edges in the two intersected shapes. These intersection edges are independent: they are not chained or grouped into wires. If no intersection edge exists, the result is an empty compound object. The shapes involved in the construction of the section lines can be retrieved with the function Shape1 or Shape2. Note that other objects than TopoDS_Shape shapes given as arguments at the construction time of this framework, or to the Init1 or Init2 function, are converted into faces or shells before performing the computation of the intersection. Parametric 2D curves on intersection edges No parametric 2D curve (pcurve) is defined for the elementary edges of the result. To attach parametric curves like this to the constructed edges you have to use: - the function ComputePCurveOn1 to ask for the additional computation of a pcurve in the parametric space of the first shape, - the function ComputePCurveOn2 to ask for the additional computation of a pcurve in the parametric space of the second shape. This must be done before calling this function. Note that as a result, pcurves are added on edges built on new intersection lines only. Approximation of intersection edges The underlying 3D geometry attached to each elementary edge of the result is: - analytic where possible provided the corresponding geometry corresponds to a type of analytic curve defined in the Geom package; for example, the intersection of a cylindrical shape with a plane gives an ellipse or a circle; or - elsewhere, given as a succession of points grouped together in a BSpline curve of degree 1. If, on computed elementary intersection edges whose underlying geometry is not analytic, you prefer to have an attached 3D geometry which is a BSpline approximation of the computed set of points, you have to use the function Approximation to ask for this computation option before calling this function. You may also have combined these computation options: look at the example given above to illustrate the use of the constructors.
	:rtype: None") Build;
		void Build ();

		/****************** ComputePCurveOn1 ******************/
		%feature("compactdefaultargs") ComputePCurveOn1;
		%feature("autodoc", "* Indicates if the Pcurve must be (or not) performed on first part.
	:param B:
	:type B: bool
	:rtype: None") ComputePCurveOn1;
		void ComputePCurveOn1 (const Standard_Boolean B);

		/****************** ComputePCurveOn2 ******************/
		%feature("compactdefaultargs") ComputePCurveOn2;
		%feature("autodoc", "* Define options for the computation of further intersections which will be performed by the function Build in this framework. By default, no parametric 2D curve (pcurve) is defined for the elementary edges of the result. If ComputePCurve1 equals true, further computations performed in this framework with the function Build will attach an additional pcurve in the parametric space of the first shape to the constructed edges. If ComputePCurve2 equals true, the additional pcurve will be attached to the constructed edges in the parametric space of the second shape. These two functions may be used together. Note that as a result, pcurves will only be added onto edges built on new intersection lines.
	:param B:
	:type B: bool
	:rtype: None") ComputePCurveOn2;
		void ComputePCurveOn2 (const Standard_Boolean B);

		/****************** HasAncestorFaceOn1 ******************/
		%feature("compactdefaultargs") HasAncestorFaceOn1;
		%feature("autodoc", "* Identifies the ancestor faces of the new intersection edge E resulting from the last computation performed in this framework, that is, the faces of the two original shapes on which the edge E lies: - HasAncestorFaceOn1 gives the ancestor face in the first shape, and These functions return: - true if an ancestor face F is found, or - false if not. An ancestor face is identifiable for the edge E if the three following conditions are satisfied: - the first part on which this algorithm performed its last computation is a shape, that is, it was not given as a surface or a plane at the time of construction of this algorithm or at a later time by the Init1 function, - E is one of the elementary edges built by the last computation of this section algorithm, - the edge E is built on an intersection curve. In other words, E is a new edge built on the intersection curve, not on edges belonging to the intersecting shapes. To use these functions properly, you have to test the returned Boolean value before using the ancestor face: F is significant only if the returned Boolean value equals true.
	:param E:
	:type E: TopoDS_Shape
	:param F:
	:type F: TopoDS_Shape
	:rtype: bool") HasAncestorFaceOn1;
		Standard_Boolean HasAncestorFaceOn1 (const TopoDS_Shape & E,TopoDS_Shape & F);

		/****************** HasAncestorFaceOn2 ******************/
		%feature("compactdefaultargs") HasAncestorFaceOn2;
		%feature("autodoc", "* Identifies the ancestor faces of the new intersection edge E resulting from the last computation performed in this framework, that is, the faces of the two original shapes on which the edge E lies: - HasAncestorFaceOn2 gives the ancestor face in the second shape. These functions return: - true if an ancestor face F is found, or - false if not. An ancestor face is identifiable for the edge E if the three following conditions are satisfied: - the first part on which this algorithm performed its last computation is a shape, that is, it was not given as a surface or a plane at the time of construction of this algorithm or at a later time by the Init1 function, - E is one of the elementary edges built by the last computation of this section algorithm, - the edge E is built on an intersection curve. In other words, E is a new edge built on the intersection curve, not on edges belonging to the intersecting shapes. To use these functions properly, you have to test the returned Boolean value before using the ancestor face: F is significant only if the returned Boolean value equals true.
	:param E:
	:type E: TopoDS_Shape
	:param F:
	:type F: TopoDS_Shape
	:rtype: bool") HasAncestorFaceOn2;
		Standard_Boolean HasAncestorFaceOn2 (const TopoDS_Shape & E,TopoDS_Shape & F);

		/****************** Init1 ******************/
		%feature("compactdefaultargs") Init1;
		%feature("autodoc", "* Initializes the first part
	:param S1:
	:type S1: TopoDS_Shape
	:rtype: None") Init1;
		void Init1 (const TopoDS_Shape & S1);

		/****************** Init1 ******************/
		%feature("compactdefaultargs") Init1;
		%feature("autodoc", "* Initializes the first part
	:param Pl:
	:type Pl: gp_Pln
	:rtype: None") Init1;
		void Init1 (const gp_Pln & Pl);

		/****************** Init1 ******************/
		%feature("compactdefaultargs") Init1;
		%feature("autodoc", "* Initializes the first part
	:param Sf:
	:type Sf: Geom_Surface
	:rtype: None") Init1;
		void Init1 (const opencascade::handle<Geom_Surface> & Sf);

		/****************** Init2 ******************/
		%feature("compactdefaultargs") Init2;
		%feature("autodoc", "* initialize second part
	:param S2:
	:type S2: TopoDS_Shape
	:rtype: None") Init2;
		void Init2 (const TopoDS_Shape & S2);

		/****************** Init2 ******************/
		%feature("compactdefaultargs") Init2;
		%feature("autodoc", "* Initializes the second part
	:param Pl:
	:type Pl: gp_Pln
	:rtype: None") Init2;
		void Init2 (const gp_Pln & Pl);

		/****************** Init2 ******************/
		%feature("compactdefaultargs") Init2;
		%feature("autodoc", "* This and the above algorithms reinitialize the first and the second parts on which this algorithm is going to perform the intersection computation. This is done with either: the surface Sf, the plane Pl or the shape Sh. You use the function Build to construct the result.
	:param Sf:
	:type Sf: Geom_Surface
	:rtype: None") Init2;
		void Init2 (const opencascade::handle<Geom_Surface> & Sf);

};


%extend BRepAlgo_Section {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
