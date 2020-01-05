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
%define HLRTOPOBREPDOCSTRING
"HLRTopoBRep module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_hlrtopobrep.html"
%enddef
%module (package="OCC.Core", docstring=HLRTOPOBREPDOCSTRING) HLRTopoBRep


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
#include<HLRTopoBRep_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TopoDS_module.hxx>
#include<Contap_module.hxx>
#include<BRepTopAdaptor_module.hxx>
#include<TopTools_module.hxx>
#include<Geom2d_module.hxx>
#include<gp_module.hxx>
#include<HLRAlgo_module.hxx>
#include<TColStd_module.hxx>
#include<TColgp_module.hxx>
#include<BRepAdaptor_module.hxx>
#include<TopLoc_module.hxx>
#include<IntSurf_module.hxx>
#include<GeomAdaptor_module.hxx>
#include<Geom_module.hxx>
#include<Adaptor3d_module.hxx>
#include<Message_module.hxx>
#include<Geom2dAdaptor_module.hxx>
#include<Adaptor2d_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import TopoDS.i
%import Contap.i
%import BRepTopAdaptor.i
%import TopTools.i
%import Geom2d.i
%import gp.i
%import HLRAlgo.i
/* public enums */
/* end public enums declaration */

/* handles */
%wrap_handle(HLRTopoBRep_OutLiner)
/* end handles declaration */

/* templates */
%template(HLRTopoBRep_DataMapOfShapeFaceData) NCollection_DataMap <TopoDS_Shape , HLRTopoBRep_FaceData , TopTools_ShapeMapHasher>;
%template(HLRTopoBRep_ListOfVData) NCollection_List <HLRTopoBRep_VData>;
%template(HLRTopoBRep_ListIteratorOfListOfVData) NCollection_TListIterator<HLRTopoBRep_VData>;
%template(HLRTopoBRep_MapOfShapeListOfVData) NCollection_DataMap <TopoDS_Shape , HLRTopoBRep_ListOfVData , TopTools_ShapeMapHasher>;
/* end templates declaration */

/* typedefs */
typedef NCollection_DataMap <TopoDS_Shape , HLRTopoBRep_FaceData , TopTools_ShapeMapHasher> HLRTopoBRep_DataMapOfShapeFaceData;
typedef NCollection_DataMap <TopoDS_Shape , HLRTopoBRep_FaceData , TopTools_ShapeMapHasher>::Iterator HLRTopoBRep_DataMapIteratorOfDataMapOfShapeFaceData;
typedef NCollection_List <HLRTopoBRep_VData> HLRTopoBRep_ListOfVData;
typedef NCollection_List <HLRTopoBRep_VData>::Iterator HLRTopoBRep_ListIteratorOfListOfVData;
typedef NCollection_DataMap <TopoDS_Shape , HLRTopoBRep_ListOfVData , TopTools_ShapeMapHasher> HLRTopoBRep_MapOfShapeListOfVData;
typedef NCollection_DataMap <TopoDS_Shape , HLRTopoBRep_ListOfVData , TopTools_ShapeMapHasher>::Iterator HLRTopoBRep_DataMapIteratorOfMapOfShapeListOfVData;
/* end typedefs declaration */

/*****************************
* class HLRTopoBRep_DSFiller *
*****************************/
class HLRTopoBRep_DSFiller {
	public:
		/****************** Insert ******************/
		%feature("compactdefaultargs") Insert;
		%feature("autodoc", "* Stores in <DS> the outlines of <S> using the current outliner and stores the isolines in <DS> using a Hatcher.
	:param S:
	:type S: TopoDS_Shape
	:param FO:
	:type FO: Contap_Contour
	:param DS:
	:type DS: HLRTopoBRep_Data
	:param MST:
	:type MST: BRepTopAdaptor_MapOfShapeTool
	:param nbIso:
	:type nbIso: int
	:rtype: void") Insert;
		static void Insert (const TopoDS_Shape & S,Contap_Contour & FO,HLRTopoBRep_Data & DS,BRepTopAdaptor_MapOfShapeTool & MST,const Standard_Integer nbIso);

};


%extend HLRTopoBRep_DSFiller {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class HLRTopoBRep_Data *
*************************/
class HLRTopoBRep_Data {
	public:
		/****************** AddIntL ******************/
		%feature("compactdefaultargs") AddIntL;
		%feature("autodoc", ":param F:
	:type F: TopoDS_Face
	:rtype: TopTools_ListOfShape") AddIntL;
		TopTools_ListOfShape & AddIntL (const TopoDS_Face & F);

		/****************** AddIntV ******************/
		%feature("compactdefaultargs") AddIntV;
		%feature("autodoc", ":param V:
	:type V: TopoDS_Vertex
	:rtype: None") AddIntV;
		void AddIntV (const TopoDS_Vertex & V);

		/****************** AddIsoL ******************/
		%feature("compactdefaultargs") AddIsoL;
		%feature("autodoc", ":param F:
	:type F: TopoDS_Face
	:rtype: TopTools_ListOfShape") AddIsoL;
		TopTools_ListOfShape & AddIsoL (const TopoDS_Face & F);

		/****************** AddOldS ******************/
		%feature("compactdefaultargs") AddOldS;
		%feature("autodoc", ":param NewS:
	:type NewS: TopoDS_Shape
	:param OldS:
	:type OldS: TopoDS_Shape
	:rtype: None") AddOldS;
		void AddOldS (const TopoDS_Shape & NewS,const TopoDS_Shape & OldS);

		/****************** AddOutL ******************/
		%feature("compactdefaultargs") AddOutL;
		%feature("autodoc", ":param F:
	:type F: TopoDS_Face
	:rtype: TopTools_ListOfShape") AddOutL;
		TopTools_ListOfShape & AddOutL (const TopoDS_Face & F);

		/****************** AddOutV ******************/
		%feature("compactdefaultargs") AddOutV;
		%feature("autodoc", ":param V:
	:type V: TopoDS_Vertex
	:rtype: None") AddOutV;
		void AddOutV (const TopoDS_Vertex & V);

		/****************** AddSplE ******************/
		%feature("compactdefaultargs") AddSplE;
		%feature("autodoc", ":param E:
	:type E: TopoDS_Edge
	:rtype: TopTools_ListOfShape") AddSplE;
		TopTools_ListOfShape & AddSplE (const TopoDS_Edge & E);

		/****************** Append ******************/
		%feature("compactdefaultargs") Append;
		%feature("autodoc", ":param V:
	:type V: TopoDS_Vertex
	:param P:
	:type P: float
	:rtype: None") Append;
		void Append (const TopoDS_Vertex & V,const Standard_Real P);

		/****************** Clean ******************/
		%feature("compactdefaultargs") Clean;
		%feature("autodoc", "* Clear of all the data not needed during and after the hiding process.
	:rtype: None") Clean;
		void Clean ();

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "* Clear of all the maps.
	:rtype: None") Clear;
		void Clear ();

		/****************** Edge ******************/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", ":rtype: TopoDS_Edge") Edge;
		const TopoDS_Edge  Edge ();

		/****************** EdgeHasSplE ******************/
		%feature("compactdefaultargs") EdgeHasSplE;
		%feature("autodoc", "* Returns True if the Edge is split.
	:param E:
	:type E: TopoDS_Edge
	:rtype: bool") EdgeHasSplE;
		Standard_Boolean EdgeHasSplE (const TopoDS_Edge & E);

		/****************** EdgeSplE ******************/
		%feature("compactdefaultargs") EdgeSplE;
		%feature("autodoc", "* Returns the list of the edges.
	:param E:
	:type E: TopoDS_Edge
	:rtype: TopTools_ListOfShape") EdgeSplE;
		const TopTools_ListOfShape & EdgeSplE (const TopoDS_Edge & E);

		/****************** FaceHasIntL ******************/
		%feature("compactdefaultargs") FaceHasIntL;
		%feature("autodoc", "* Returns True if the Face has internal outline.
	:param F:
	:type F: TopoDS_Face
	:rtype: bool") FaceHasIntL;
		Standard_Boolean FaceHasIntL (const TopoDS_Face & F);

		/****************** FaceHasIsoL ******************/
		%feature("compactdefaultargs") FaceHasIsoL;
		%feature("autodoc", "* Returns True if the Face has isolines.
	:param F:
	:type F: TopoDS_Face
	:rtype: bool") FaceHasIsoL;
		Standard_Boolean FaceHasIsoL (const TopoDS_Face & F);

		/****************** FaceHasOutL ******************/
		%feature("compactdefaultargs") FaceHasOutL;
		%feature("autodoc", "* Returns True if the Face has outlines on restriction.
	:param F:
	:type F: TopoDS_Face
	:rtype: bool") FaceHasOutL;
		Standard_Boolean FaceHasOutL (const TopoDS_Face & F);

		/****************** FaceIntL ******************/
		%feature("compactdefaultargs") FaceIntL;
		%feature("autodoc", "* Returns the list of the internal OutLines.
	:param F:
	:type F: TopoDS_Face
	:rtype: TopTools_ListOfShape") FaceIntL;
		const TopTools_ListOfShape & FaceIntL (const TopoDS_Face & F);

		/****************** FaceIsoL ******************/
		%feature("compactdefaultargs") FaceIsoL;
		%feature("autodoc", "* Returns the list of the IsoLines.
	:param F:
	:type F: TopoDS_Face
	:rtype: TopTools_ListOfShape") FaceIsoL;
		const TopTools_ListOfShape & FaceIsoL (const TopoDS_Face & F);

		/****************** FaceOutL ******************/
		%feature("compactdefaultargs") FaceOutL;
		%feature("autodoc", "* Returns the list of the OutLines on restriction.
	:param F:
	:type F: TopoDS_Face
	:rtype: TopTools_ListOfShape") FaceOutL;
		const TopTools_ListOfShape & FaceOutL (const TopoDS_Face & F);

		/****************** HLRTopoBRep_Data ******************/
		%feature("compactdefaultargs") HLRTopoBRep_Data;
		%feature("autodoc", ":rtype: None") HLRTopoBRep_Data;
		 HLRTopoBRep_Data ();

		/****************** InitEdge ******************/
		%feature("compactdefaultargs") InitEdge;
		%feature("autodoc", ":rtype: None") InitEdge;
		void InitEdge ();

		/****************** InitVertex ******************/
		%feature("compactdefaultargs") InitVertex;
		%feature("autodoc", "* Start an iteration on the vertices of E.
	:param E:
	:type E: TopoDS_Edge
	:rtype: None") InitVertex;
		void InitVertex (const TopoDS_Edge & E);

		/****************** InsertBefore ******************/
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "* Insert before the current position.
	:param V:
	:type V: TopoDS_Vertex
	:param P:
	:type P: float
	:rtype: None") InsertBefore;
		void InsertBefore (const TopoDS_Vertex & V,const Standard_Real P);

		/****************** IsIntLFaceEdge ******************/
		%feature("compactdefaultargs") IsIntLFaceEdge;
		%feature("autodoc", ":param F:
	:type F: TopoDS_Face
	:param E:
	:type E: TopoDS_Edge
	:rtype: bool") IsIntLFaceEdge;
		Standard_Boolean IsIntLFaceEdge (const TopoDS_Face & F,const TopoDS_Edge & E);

		/****************** IsIntV ******************/
		%feature("compactdefaultargs") IsIntV;
		%feature("autodoc", "* Returns True if V is an internal outline vertex.
	:param V:
	:type V: TopoDS_Vertex
	:rtype: bool") IsIntV;
		Standard_Boolean IsIntV (const TopoDS_Vertex & V);

		/****************** IsIsoLFaceEdge ******************/
		%feature("compactdefaultargs") IsIsoLFaceEdge;
		%feature("autodoc", ":param F:
	:type F: TopoDS_Face
	:param E:
	:type E: TopoDS_Edge
	:rtype: bool") IsIsoLFaceEdge;
		Standard_Boolean IsIsoLFaceEdge (const TopoDS_Face & F,const TopoDS_Edge & E);

		/****************** IsOutLFaceEdge ******************/
		%feature("compactdefaultargs") IsOutLFaceEdge;
		%feature("autodoc", ":param F:
	:type F: TopoDS_Face
	:param E:
	:type E: TopoDS_Edge
	:rtype: bool") IsOutLFaceEdge;
		Standard_Boolean IsOutLFaceEdge (const TopoDS_Face & F,const TopoDS_Edge & E);

		/****************** IsOutV ******************/
		%feature("compactdefaultargs") IsOutV;
		%feature("autodoc", "* Returns True if V is an outline vertex on a restriction.
	:param V:
	:type V: TopoDS_Vertex
	:rtype: bool") IsOutV;
		Standard_Boolean IsOutV (const TopoDS_Vertex & V);

		/****************** IsSplEEdgeEdge ******************/
		%feature("compactdefaultargs") IsSplEEdgeEdge;
		%feature("autodoc", ":param E1:
	:type E1: TopoDS_Edge
	:param E2:
	:type E2: TopoDS_Edge
	:rtype: bool") IsSplEEdgeEdge;
		Standard_Boolean IsSplEEdgeEdge (const TopoDS_Edge & E1,const TopoDS_Edge & E2);

		/****************** MoreEdge ******************/
		%feature("compactdefaultargs") MoreEdge;
		%feature("autodoc", ":rtype: bool") MoreEdge;
		Standard_Boolean MoreEdge ();

		/****************** MoreVertex ******************/
		%feature("compactdefaultargs") MoreVertex;
		%feature("autodoc", ":rtype: bool") MoreVertex;
		Standard_Boolean MoreVertex ();

		/****************** NewSOldS ******************/
		%feature("compactdefaultargs") NewSOldS;
		%feature("autodoc", ":param New:
	:type New: TopoDS_Shape
	:rtype: TopoDS_Shape") NewSOldS;
		TopoDS_Shape NewSOldS (const TopoDS_Shape & New);

		/****************** NextEdge ******************/
		%feature("compactdefaultargs") NextEdge;
		%feature("autodoc", ":rtype: None") NextEdge;
		void NextEdge ();

		/****************** NextVertex ******************/
		%feature("compactdefaultargs") NextVertex;
		%feature("autodoc", ":rtype: None") NextVertex;
		void NextVertex ();

		/****************** Parameter ******************/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", ":rtype: float") Parameter;
		Standard_Real Parameter ();

		/****************** Vertex ******************/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", ":rtype: TopoDS_Vertex") Vertex;
		const TopoDS_Vertex  Vertex ();

};


%extend HLRTopoBRep_Data {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class HLRTopoBRep_FaceData *
*****************************/
class HLRTopoBRep_FaceData {
	public:
		/****************** AddIntL ******************/
		%feature("compactdefaultargs") AddIntL;
		%feature("autodoc", ":rtype: TopTools_ListOfShape") AddIntL;
		TopTools_ListOfShape & AddIntL ();

		/****************** AddIsoL ******************/
		%feature("compactdefaultargs") AddIsoL;
		%feature("autodoc", ":rtype: TopTools_ListOfShape") AddIsoL;
		TopTools_ListOfShape & AddIsoL ();

		/****************** AddOutL ******************/
		%feature("compactdefaultargs") AddOutL;
		%feature("autodoc", ":rtype: TopTools_ListOfShape") AddOutL;
		TopTools_ListOfShape & AddOutL ();

		/****************** FaceIntL ******************/
		%feature("compactdefaultargs") FaceIntL;
		%feature("autodoc", ":rtype: TopTools_ListOfShape") FaceIntL;
		const TopTools_ListOfShape & FaceIntL ();

		/****************** FaceIsoL ******************/
		%feature("compactdefaultargs") FaceIsoL;
		%feature("autodoc", ":rtype: TopTools_ListOfShape") FaceIsoL;
		const TopTools_ListOfShape & FaceIsoL ();

		/****************** FaceOutL ******************/
		%feature("compactdefaultargs") FaceOutL;
		%feature("autodoc", ":rtype: TopTools_ListOfShape") FaceOutL;
		const TopTools_ListOfShape & FaceOutL ();

		/****************** HLRTopoBRep_FaceData ******************/
		%feature("compactdefaultargs") HLRTopoBRep_FaceData;
		%feature("autodoc", ":rtype: None") HLRTopoBRep_FaceData;
		 HLRTopoBRep_FaceData ();

};


%extend HLRTopoBRep_FaceData {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class HLRTopoBRep_FaceIsoLiner *
*********************************/
class HLRTopoBRep_FaceIsoLiner {
	public:
		/****************** MakeIsoLine ******************/
		%feature("compactdefaultargs") MakeIsoLine;
		%feature("autodoc", ":param F:
	:type F: TopoDS_Face
	:param Iso:
	:type Iso: Geom2d_Line
	:param V1:
	:type V1: TopoDS_Vertex
	:param V2:
	:type V2: TopoDS_Vertex
	:param U1:
	:type U1: float
	:param U2:
	:type U2: float
	:param Tol:
	:type Tol: float
	:param DS:
	:type DS: HLRTopoBRep_Data
	:rtype: void") MakeIsoLine;
		static void MakeIsoLine (const TopoDS_Face & F,const opencascade::handle<Geom2d_Line> & Iso,TopoDS_Vertex & V1,TopoDS_Vertex & V2,const Standard_Real U1,const Standard_Real U2,const Standard_Real Tol,HLRTopoBRep_Data & DS);

		/****************** MakeVertex ******************/
		%feature("compactdefaultargs") MakeVertex;
		%feature("autodoc", ":param E:
	:type E: TopoDS_Edge
	:param P:
	:type P: gp_Pnt
	:param Par:
	:type Par: float
	:param Tol:
	:type Tol: float
	:param DS:
	:type DS: HLRTopoBRep_Data
	:rtype: TopoDS_Vertex") MakeVertex;
		static TopoDS_Vertex MakeVertex (const TopoDS_Edge & E,const gp_Pnt & P,const Standard_Real Par,const Standard_Real Tol,HLRTopoBRep_Data & DS);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", ":param FI:
	:type FI: int
	:param F:
	:type F: TopoDS_Face
	:param DS:
	:type DS: HLRTopoBRep_Data
	:param nbIsos:
	:type nbIsos: int
	:rtype: void") Perform;
		static void Perform (const Standard_Integer FI,const TopoDS_Face & F,HLRTopoBRep_Data & DS,const Standard_Integer nbIsos);

};


%extend HLRTopoBRep_FaceIsoLiner {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class HLRTopoBRep_OutLiner *
*****************************/
class HLRTopoBRep_OutLiner : public Standard_Transient {
	public:
		/****************** DataStructure ******************/
		%feature("compactdefaultargs") DataStructure;
		%feature("autodoc", ":rtype: HLRTopoBRep_Data") DataStructure;
		HLRTopoBRep_Data & DataStructure ();

		/****************** Fill ******************/
		%feature("compactdefaultargs") Fill;
		%feature("autodoc", ":param P:
	:type P: HLRAlgo_Projector
	:param MST:
	:type MST: BRepTopAdaptor_MapOfShapeTool
	:param nbIso:
	:type nbIso: int
	:rtype: None") Fill;
		void Fill (const HLRAlgo_Projector & P,BRepTopAdaptor_MapOfShapeTool & MST,const Standard_Integer nbIso);

		/****************** HLRTopoBRep_OutLiner ******************/
		%feature("compactdefaultargs") HLRTopoBRep_OutLiner;
		%feature("autodoc", ":rtype: None") HLRTopoBRep_OutLiner;
		 HLRTopoBRep_OutLiner ();

		/****************** HLRTopoBRep_OutLiner ******************/
		%feature("compactdefaultargs") HLRTopoBRep_OutLiner;
		%feature("autodoc", ":param OriSh:
	:type OriSh: TopoDS_Shape
	:rtype: None") HLRTopoBRep_OutLiner;
		 HLRTopoBRep_OutLiner (const TopoDS_Shape & OriSh);

		/****************** HLRTopoBRep_OutLiner ******************/
		%feature("compactdefaultargs") HLRTopoBRep_OutLiner;
		%feature("autodoc", ":param OriS:
	:type OriS: TopoDS_Shape
	:param OutS:
	:type OutS: TopoDS_Shape
	:rtype: None") HLRTopoBRep_OutLiner;
		 HLRTopoBRep_OutLiner (const TopoDS_Shape & OriS,const TopoDS_Shape & OutS);

		/****************** OriginalShape ******************/
		%feature("compactdefaultargs") OriginalShape;
		%feature("autodoc", ":param OriS:
	:type OriS: TopoDS_Shape
	:rtype: None") OriginalShape;
		void OriginalShape (const TopoDS_Shape & OriS);

		/****************** OriginalShape ******************/
		%feature("compactdefaultargs") OriginalShape;
		%feature("autodoc", ":rtype: TopoDS_Shape") OriginalShape;
		TopoDS_Shape  OriginalShape ();

		/****************** OutLinedShape ******************/
		%feature("compactdefaultargs") OutLinedShape;
		%feature("autodoc", ":param OutS:
	:type OutS: TopoDS_Shape
	:rtype: None") OutLinedShape;
		void OutLinedShape (const TopoDS_Shape & OutS);

		/****************** OutLinedShape ******************/
		%feature("compactdefaultargs") OutLinedShape;
		%feature("autodoc", ":rtype: TopoDS_Shape") OutLinedShape;
		TopoDS_Shape  OutLinedShape ();

};


%make_alias(HLRTopoBRep_OutLiner)

%extend HLRTopoBRep_OutLiner {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class HLRTopoBRep_VData *
**************************/
class HLRTopoBRep_VData {
	public:
		/****************** HLRTopoBRep_VData ******************/
		%feature("compactdefaultargs") HLRTopoBRep_VData;
		%feature("autodoc", ":rtype: None") HLRTopoBRep_VData;
		 HLRTopoBRep_VData ();

		/****************** HLRTopoBRep_VData ******************/
		%feature("compactdefaultargs") HLRTopoBRep_VData;
		%feature("autodoc", ":param P:
	:type P: float
	:param V:
	:type V: TopoDS_Shape
	:rtype: None") HLRTopoBRep_VData;
		 HLRTopoBRep_VData (const Standard_Real P,const TopoDS_Shape & V);

		/****************** Parameter ******************/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", ":rtype: float") Parameter;
		Standard_Real Parameter ();

		/****************** Vertex ******************/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", ":rtype: TopoDS_Shape") Vertex;
		const TopoDS_Shape  Vertex ();

};


%extend HLRTopoBRep_VData {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
