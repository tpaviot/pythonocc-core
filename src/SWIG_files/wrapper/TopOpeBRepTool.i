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
%define TOPOPEBREPTOOLDOCSTRING
"TopOpeBRepTool module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_topopebreptool.html"
%enddef
%module (package="OCC.Core", docstring=TOPOPEBREPTOOLDOCSTRING) TopOpeBRepTool


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
#include<TopOpeBRepTool_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TopTools_module.hxx>
#include<BRepClass3d_module.hxx>
#include<TopoDS_module.hxx>
#include<TopAbs_module.hxx>
#include<Bnd_module.hxx>
#include<TColStd_module.hxx>
#include<Geom2d_module.hxx>
#include<GeomAdaptor_module.hxx>
#include<Geom_module.hxx>
#include<TColgp_module.hxx>
#include<gp_module.hxx>
#include<TopExp_module.hxx>
#include<BRepAdaptor_module.hxx>
#include<TCollection_module.hxx>
#include<GeomAbs_module.hxx>
#include<Extrema_module.hxx>
#include<Geom_module.hxx>
#include<Adaptor2d_module.hxx>
#include<Bnd_module.hxx>
#include<BRepAdaptor_module.hxx>
#include<TopLoc_module.hxx>
#include<Adaptor3d_module.hxx>
#include<Message_module.hxx>
#include<Intf_module.hxx>
#include<IntSurf_module.hxx>
#include<Extrema_module.hxx>
#include<IntCurveSurface_module.hxx>
#include<Geom2d_module.hxx>
#include<Geom2dAdaptor_module.hxx>
#include<BRepAdaptor_module.hxx>
#include<GeomAdaptor_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import TopTools.i
%import BRepClass3d.i
%import TopoDS.i
%import TopAbs.i
%import Bnd.i
%import TColStd.i
%import Geom2d.i
%import GeomAdaptor.i
%import Geom.i
%import TColgp.i
%import gp.i
%import TopExp.i
%import BRepAdaptor.i
%import TCollection.i
%import GeomAbs.i
%import Extrema.i
/* public enums */
enum TopOpeBRepTool_OutCurveType {
	TopOpeBRepTool_BSPLINE1 = 0,
	TopOpeBRepTool_APPROX = 1,
	TopOpeBRepTool_INTERPOL = 2,
};

/* end public enums declaration */

/* handles */
%wrap_handle(TopOpeBRepTool_HBoxTool)
/* end handles declaration */

/* templates */
%template(TopOpeBRepTool_IndexedDataMapOfShapeconnexity) NCollection_IndexedDataMap <TopoDS_Shape , TopOpeBRepTool_connexity , TopTools_ShapeMapHasher>;
%template(TopOpeBRepTool_DataMapOfShapeface) NCollection_DataMap <TopoDS_Shape , TopOpeBRepTool_face , TopTools_ShapeMapHasher>;
%template(TopOpeBRepTool_DataMapOfOrientedShapeC2DF) NCollection_DataMap <TopoDS_Shape , TopOpeBRepTool_C2DF , TopTools_OrientedShapeMapHasher>;
%template(TopOpeBRepTool_DataMapOfShapeListOfC2DF) NCollection_DataMap <TopoDS_Shape , TopOpeBRepTool_ListOfC2DF , TopTools_ShapeMapHasher>;
%template(TopOpeBRepTool_IndexedDataMapOfShapeBox) NCollection_IndexedDataMap <TopoDS_Shape , Bnd_Box , TopTools_OrientedShapeMapHasher>;
%template(TopOpeBRepTool_IndexedDataMapOfShapeBox2d) NCollection_IndexedDataMap <TopoDS_Shape , Bnd_Box2d , TopTools_OrientedShapeMapHasher>;
%template(TopOpeBRepTool_ListOfC2DF) NCollection_List <TopOpeBRepTool_C2DF>;
%template(TopOpeBRepTool_ListIteratorOfListOfC2DF) NCollection_TListIterator<TopOpeBRepTool_C2DF>;
/* end templates declaration */

/* typedefs */
typedef TopOpeBRepTool_ShapeClassifier * TopOpeBRepTool_PShapeClassifier;
typedef TopTools_ListOfShape * TopOpeBRepTool_Plos;
typedef NCollection_IndexedDataMap <TopoDS_Shape , TopOpeBRepTool_connexity , TopTools_ShapeMapHasher> TopOpeBRepTool_IndexedDataMapOfShapeconnexity;
typedef NCollection_DataMap <TopoDS_Shape , TopOpeBRepTool_face , TopTools_ShapeMapHasher> TopOpeBRepTool_DataMapOfShapeface;
typedef NCollection_DataMap <TopoDS_Shape , TopOpeBRepTool_face , TopTools_ShapeMapHasher>::Iterator TopOpeBRepTool_DataMapIteratorOfDataMapOfShapeface;
typedef NCollection_DataMap <TopoDS_Shape , TopOpeBRepTool_C2DF , TopTools_OrientedShapeMapHasher> TopOpeBRepTool_DataMapOfOrientedShapeC2DF;
typedef NCollection_DataMap <TopoDS_Shape , TopOpeBRepTool_C2DF , TopTools_OrientedShapeMapHasher>::Iterator TopOpeBRepTool_DataMapIteratorOfDataMapOfOrientedShapeC2DF;
typedef BRepClass3d_SolidClassifier * TopOpeBRepTool_PSoClassif;
typedef NCollection_DataMap <TopoDS_Shape , TopOpeBRepTool_ListOfC2DF , TopTools_ShapeMapHasher> TopOpeBRepTool_DataMapOfShapeListOfC2DF;
typedef NCollection_DataMap <TopoDS_Shape , TopOpeBRepTool_ListOfC2DF , TopTools_ShapeMapHasher>::Iterator TopOpeBRepTool_DataMapIteratorOfDataMapOfShapeListOfC2DF;
typedef NCollection_IndexedDataMap <TopoDS_Shape , Bnd_Box , TopTools_OrientedShapeMapHasher> TopOpeBRepTool_IndexedDataMapOfShapeBox;
typedef NCollection_IndexedDataMap <TopoDS_Shape , Bnd_Box2d , TopTools_OrientedShapeMapHasher> TopOpeBRepTool_IndexedDataMapOfShapeBox2d;
typedef NCollection_List <TopOpeBRepTool_C2DF> TopOpeBRepTool_ListOfC2DF;
typedef NCollection_List <TopOpeBRepTool_C2DF>::Iterator TopOpeBRepTool_ListIteratorOfListOfC2DF;
/* end typedefs declaration */

/***************
* class TOPKRO *
***************/
/***********************
* class TopOpeBRepTool *
***********************/
%rename(topopebreptool) TopOpeBRepTool;
class TopOpeBRepTool {
	public:
		/****************** CorrectONUVISO ******************/
		%feature("compactdefaultargs") CorrectONUVISO;
		%feature("autodoc", ":param F:
	:type F: TopoDS_Face
	:param Fsp:
	:type Fsp: TopoDS_Face
	:rtype: bool") CorrectONUVISO;
		static Standard_Boolean CorrectONUVISO (const TopoDS_Face & F,TopoDS_Face & Fsp);

		/****************** MakeFaces ******************/
		%feature("compactdefaultargs") MakeFaces;
		%feature("autodoc", "* Builds up the correct list of faces <LOFF> from <LOF>, using faulty shapes from map <MshNOK>. <LOF> is the list of <F>'s descendant faces. returns false if building fails
	:param F:
	:type F: TopoDS_Face
	:param LOF:
	:type LOF: TopTools_ListOfShape
	:param MshNOK:
	:type MshNOK: TopTools_IndexedMapOfOrientedShape
	:param LOFF:
	:type LOFF: TopTools_ListOfShape
	:rtype: bool") MakeFaces;
		static Standard_Boolean MakeFaces (const TopoDS_Face & F,const TopTools_ListOfShape & LOF,const TopTools_IndexedMapOfOrientedShape & MshNOK,TopTools_ListOfShape & LOFF);

		/****************** Print ******************/
		%feature("compactdefaultargs") Print;
		%feature("autodoc", "* Prints <OCT> as string on stream <S>; returns <S>.
	:param OCT:
	:type OCT: TopOpeBRepTool_OutCurveType
	:param S:
	:type S: Standard_OStream
	:rtype: Standard_OStream") Print;
		static Standard_OStream & Print (const TopOpeBRepTool_OutCurveType OCT,Standard_OStream & S);

		/****************** PurgeClosingEdges ******************/
		%feature("compactdefaultargs") PurgeClosingEdges;
		%feature("autodoc", "* Fuse edges (in a wire) of a shape where we have useless vertex. In case face <FF> is built on UV-non-connexed wires (with the two closing edges FORWARD and REVERSED, in spite of one only), we find out the faulty edge, add the faulty shapes (edge,wire,face) to <MshNOK>. <FF> is a face descendant of <F>. <MWisOld>(wire) = 1 if wire is wire of <F> 0 wire results from <F>'s wire splitted. returns false if purge fails
	:param F:
	:type F: TopoDS_Face
	:param FF:
	:type FF: TopoDS_Face
	:param MWisOld:
	:type MWisOld: TopTools_DataMapOfShapeInteger
	:param MshNOK:
	:type MshNOK: TopTools_IndexedMapOfOrientedShape
	:rtype: bool") PurgeClosingEdges;
		static Standard_Boolean PurgeClosingEdges (const TopoDS_Face & F,const TopoDS_Face & FF,const TopTools_DataMapOfShapeInteger & MWisOld,TopTools_IndexedMapOfOrientedShape & MshNOK);

		/****************** PurgeClosingEdges ******************/
		%feature("compactdefaultargs") PurgeClosingEdges;
		%feature("autodoc", ":param F:
	:type F: TopoDS_Face
	:param LOF:
	:type LOF: TopTools_ListOfShape
	:param MWisOld:
	:type MWisOld: TopTools_DataMapOfShapeInteger
	:param MshNOK:
	:type MshNOK: TopTools_IndexedMapOfOrientedShape
	:rtype: bool") PurgeClosingEdges;
		static Standard_Boolean PurgeClosingEdges (const TopoDS_Face & F,const TopTools_ListOfShape & LOF,const TopTools_DataMapOfShapeInteger & MWisOld,TopTools_IndexedMapOfOrientedShape & MshNOK);

		/****************** Regularize ******************/
		%feature("compactdefaultargs") Regularize;
		%feature("autodoc", "* Returns <False> if the face is valid (the UV representation of the face is a set of pcurves connexed by points with connexity 2). Else, splits <aFace> in order to return a list of valid faces.
	:param aFace:
	:type aFace: TopoDS_Face
	:param aListOfFaces:
	:type aListOfFaces: TopTools_ListOfShape
	:param ESplits:
	:type ESplits: TopTools_DataMapOfShapeListOfShape
	:rtype: bool") Regularize;
		static Standard_Boolean Regularize (const TopoDS_Face & aFace,TopTools_ListOfShape & aListOfFaces,TopTools_DataMapOfShapeListOfShape & ESplits);

		/****************** RegularizeFace ******************/
		%feature("compactdefaultargs") RegularizeFace;
		%feature("autodoc", "* Classify wire's splits of map <OldWiresnewWires> in order to compute <aListOfFaces>, the splits of <aFace>.
	:param aFace:
	:type aFace: TopoDS_Face
	:param OldWiresnewWires:
	:type OldWiresnewWires: TopTools_DataMapOfShapeListOfShape
	:param aListOfFaces:
	:type aListOfFaces: TopTools_ListOfShape
	:rtype: bool") RegularizeFace;
		static Standard_Boolean RegularizeFace (const TopoDS_Face & aFace,const TopTools_DataMapOfShapeListOfShape & OldWiresnewWires,TopTools_ListOfShape & aListOfFaces);

		/****************** RegularizeShells ******************/
		%feature("compactdefaultargs") RegularizeShells;
		%feature("autodoc", "* Returns <False> if the shell is valid (the solid is a set of faces connexed by edges with connexity 2). Else, splits faces of the shell; <OldFacesnewFaces> describes (face, splits of face).
	:param aSolid:
	:type aSolid: TopoDS_Solid
	:param OldSheNewShe:
	:type OldSheNewShe: TopTools_DataMapOfShapeListOfShape
	:param FSplits:
	:type FSplits: TopTools_DataMapOfShapeListOfShape
	:rtype: bool") RegularizeShells;
		static Standard_Boolean RegularizeShells (const TopoDS_Solid & aSolid,TopTools_DataMapOfShapeListOfShape & OldSheNewShe,TopTools_DataMapOfShapeListOfShape & FSplits);

		/****************** RegularizeWires ******************/
		%feature("compactdefaultargs") RegularizeWires;
		%feature("autodoc", "* Returns <False> if the face is valid (the UV representation of the face is a set of pcurves connexed by points with connexity 2). Else, splits wires of the face, these are boundaries of the new faces to build up; <OldWiresNewWires> describes (wire, splits of wire); <ESplits> describes (edge, edge's splits)
	:param aFace:
	:type aFace: TopoDS_Face
	:param OldWiresNewWires:
	:type OldWiresNewWires: TopTools_DataMapOfShapeListOfShape
	:param ESplits:
	:type ESplits: TopTools_DataMapOfShapeListOfShape
	:rtype: bool") RegularizeWires;
		static Standard_Boolean RegularizeWires (const TopoDS_Face & aFace,TopTools_DataMapOfShapeListOfShape & OldWiresNewWires,TopTools_DataMapOfShapeListOfShape & ESplits);

};


%extend TopOpeBRepTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class TopOpeBRepTool_AncestorsTool *
*************************************/
class TopOpeBRepTool_AncestorsTool {
	public:
		/****************** MakeAncestors ******************/
		%feature("compactdefaultargs") MakeAncestors;
		%feature("autodoc", "* same as package method TopExp::MapShapeListOfShapes()
	:param S:
	:type S: TopoDS_Shape
	:param TS:
	:type TS: TopAbs_ShapeEnum
	:param TA:
	:type TA: TopAbs_ShapeEnum
	:param M:
	:type M: TopTools_IndexedDataMapOfShapeListOfShape
	:rtype: void") MakeAncestors;
		static void MakeAncestors (const TopoDS_Shape & S,const TopAbs_ShapeEnum TS,const TopAbs_ShapeEnum TA,TopTools_IndexedDataMapOfShapeListOfShape & M);

};


%extend TopOpeBRepTool_AncestorsTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class TopOpeBRepTool_BoxSort *
*******************************/
class TopOpeBRepTool_BoxSort {
	public:
		/****************** AddBoxes ******************/
		%feature("compactdefaultargs") AddBoxes;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:param TS:
	:type TS: TopAbs_ShapeEnum
	:param TA: default value is TopAbs_SHAPE
	:type TA: TopAbs_ShapeEnum
	:rtype: None") AddBoxes;
		void AddBoxes (const TopoDS_Shape & S,const TopAbs_ShapeEnum TS,const TopAbs_ShapeEnum TA = TopAbs_SHAPE);

		/****************** AddBoxesMakeCOB ******************/
		%feature("compactdefaultargs") AddBoxesMakeCOB;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:param TS:
	:type TS: TopAbs_ShapeEnum
	:param TA: default value is TopAbs_SHAPE
	:type TA: TopAbs_ShapeEnum
	:rtype: None") AddBoxesMakeCOB;
		void AddBoxesMakeCOB (const TopoDS_Shape & S,const TopAbs_ShapeEnum TS,const TopAbs_ShapeEnum TA = TopAbs_SHAPE);

		/****************** Box ******************/
		%feature("compactdefaultargs") Box;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:rtype: Bnd_Box") Box;
		const Bnd_Box & Box (const TopoDS_Shape & S);

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", ":rtype: None") Clear;
		void Clear ();

		/****************** Compare ******************/
		%feature("compactdefaultargs") Compare;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:rtype: TColStd_ListIteratorOfListOfInteger") Compare;
		const TColStd_ListIteratorOfListOfInteger & Compare (const TopoDS_Shape & S);

		/****************** HAB ******************/
		%feature("compactdefaultargs") HAB;
		%feature("autodoc", ":rtype: opencascade::handle<Bnd_HArray1OfBox>") HAB;
		const opencascade::handle<Bnd_HArray1OfBox> & HAB ();

		/****************** HABShape ******************/
		%feature("compactdefaultargs") HABShape;
		%feature("autodoc", ":param I:
	:type I: int
	:rtype: TopoDS_Shape") HABShape;
		const TopoDS_Shape  HABShape (const Standard_Integer I);

		/****************** HBoxTool ******************/
		%feature("compactdefaultargs") HBoxTool;
		%feature("autodoc", ":rtype: opencascade::handle<TopOpeBRepTool_HBoxTool>") HBoxTool;
		const opencascade::handle<TopOpeBRepTool_HBoxTool> & HBoxTool ();

		/****************** MakeCOB ******************/
		%feature("compactdefaultargs") MakeCOB;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:param TS:
	:type TS: TopAbs_ShapeEnum
	:param TA: default value is TopAbs_SHAPE
	:type TA: TopAbs_ShapeEnum
	:rtype: None") MakeCOB;
		void MakeCOB (const TopoDS_Shape & S,const TopAbs_ShapeEnum TS,const TopAbs_ShapeEnum TA = TopAbs_SHAPE);

		/****************** MakeHAB ******************/
		%feature("compactdefaultargs") MakeHAB;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:param TS:
	:type TS: TopAbs_ShapeEnum
	:param TA: default value is TopAbs_SHAPE
	:type TA: TopAbs_ShapeEnum
	:rtype: None") MakeHAB;
		void MakeHAB (const TopoDS_Shape & S,const TopAbs_ShapeEnum TS,const TopAbs_ShapeEnum TA = TopAbs_SHAPE);

		/****************** MakeHABCOB ******************/
		%feature("compactdefaultargs") MakeHABCOB;
		%feature("autodoc", ":param HAB:
	:type HAB: Bnd_HArray1OfBox
	:param COB:
	:type COB: Bnd_Box
	:rtype: void") MakeHABCOB;
		static void MakeHABCOB (const opencascade::handle<Bnd_HArray1OfBox> & HAB,Bnd_Box & COB);

		/****************** SetHBoxTool ******************/
		%feature("compactdefaultargs") SetHBoxTool;
		%feature("autodoc", ":param T:
	:type T: TopOpeBRepTool_HBoxTool
	:rtype: None") SetHBoxTool;
		void SetHBoxTool (const opencascade::handle<TopOpeBRepTool_HBoxTool> & T);

		/****************** TopOpeBRepTool_BoxSort ******************/
		%feature("compactdefaultargs") TopOpeBRepTool_BoxSort;
		%feature("autodoc", ":rtype: None") TopOpeBRepTool_BoxSort;
		 TopOpeBRepTool_BoxSort ();

		/****************** TopOpeBRepTool_BoxSort ******************/
		%feature("compactdefaultargs") TopOpeBRepTool_BoxSort;
		%feature("autodoc", ":param T:
	:type T: TopOpeBRepTool_HBoxTool
	:rtype: None") TopOpeBRepTool_BoxSort;
		 TopOpeBRepTool_BoxSort (const opencascade::handle<TopOpeBRepTool_HBoxTool> & T);

		/****************** TouchedShape ******************/
		%feature("compactdefaultargs") TouchedShape;
		%feature("autodoc", ":param I:
	:type I: TColStd_ListIteratorOfListOfInteger
	:rtype: TopoDS_Shape") TouchedShape;
		const TopoDS_Shape  TouchedShape (const TColStd_ListIteratorOfListOfInteger & I);

};


%extend TopOpeBRepTool_BoxSort {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class TopOpeBRepTool_C2DF *
****************************/
class TopOpeBRepTool_C2DF {
	public:
		/****************** Face ******************/
		%feature("compactdefaultargs") Face;
		%feature("autodoc", ":rtype: TopoDS_Face") Face;
		const TopoDS_Face  Face ();

		/****************** IsFace ******************/
		%feature("compactdefaultargs") IsFace;
		%feature("autodoc", ":param F:
	:type F: TopoDS_Face
	:rtype: bool") IsFace;
		Standard_Boolean IsFace (const TopoDS_Face & F);

		/****************** IsPC ******************/
		%feature("compactdefaultargs") IsPC;
		%feature("autodoc", ":param PC:
	:type PC: Geom2d_Curve
	:rtype: bool") IsPC;
		Standard_Boolean IsPC (const opencascade::handle<Geom2d_Curve> & PC);

		/****************** PC ******************/
		%feature("compactdefaultargs") PC;
		%feature("autodoc", ":param f2d:
	:type f2d: float
	:param l2d:
	:type l2d: float
	:param tol:
	:type tol: float
	:rtype: opencascade::handle<Geom2d_Curve>") PC;
		const opencascade::handle<Geom2d_Curve> & PC (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** SetFace ******************/
		%feature("compactdefaultargs") SetFace;
		%feature("autodoc", ":param F:
	:type F: TopoDS_Face
	:rtype: None") SetFace;
		void SetFace (const TopoDS_Face & F);

		/****************** SetPC ******************/
		%feature("compactdefaultargs") SetPC;
		%feature("autodoc", ":param PC:
	:type PC: Geom2d_Curve
	:param f2d:
	:type f2d: float
	:param l2d:
	:type l2d: float
	:param tol:
	:type tol: float
	:rtype: None") SetPC;
		void SetPC (const opencascade::handle<Geom2d_Curve> & PC,const Standard_Real f2d,const Standard_Real l2d,const Standard_Real tol);

		/****************** TopOpeBRepTool_C2DF ******************/
		%feature("compactdefaultargs") TopOpeBRepTool_C2DF;
		%feature("autodoc", ":rtype: None") TopOpeBRepTool_C2DF;
		 TopOpeBRepTool_C2DF ();

		/****************** TopOpeBRepTool_C2DF ******************/
		%feature("compactdefaultargs") TopOpeBRepTool_C2DF;
		%feature("autodoc", ":param PC:
	:type PC: Geom2d_Curve
	:param f2d:
	:type f2d: float
	:param l2d:
	:type l2d: float
	:param tol:
	:type tol: float
	:param F:
	:type F: TopoDS_Face
	:rtype: None") TopOpeBRepTool_C2DF;
		 TopOpeBRepTool_C2DF (const opencascade::handle<Geom2d_Curve> & PC,const Standard_Real f2d,const Standard_Real l2d,const Standard_Real tol,const TopoDS_Face & F);

};


%extend TopOpeBRepTool_C2DF {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class TopOpeBRepTool_CLASSI *
******************************/
class TopOpeBRepTool_CLASSI {
	public:
		/****************** Add2d ******************/
		%feature("compactdefaultargs") Add2d;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:rtype: bool") Add2d;
		Standard_Boolean Add2d (const TopoDS_Shape & S);

		/****************** ClassiBnd2d ******************/
		%feature("compactdefaultargs") ClassiBnd2d;
		%feature("autodoc", ":param S1:
	:type S1: TopoDS_Shape
	:param S2:
	:type S2: TopoDS_Shape
	:param tol:
	:type tol: float
	:param checklarge:
	:type checklarge: bool
	:rtype: int") ClassiBnd2d;
		Standard_Integer ClassiBnd2d (const TopoDS_Shape & S1,const TopoDS_Shape & S2,const Standard_Real tol,const Standard_Boolean checklarge);

		/****************** Classilist ******************/
		%feature("compactdefaultargs") Classilist;
		%feature("autodoc", ":param lS:
	:type lS: TopTools_ListOfShape
	:param mapgreasma:
	:type mapgreasma: TopTools_DataMapOfShapeListOfShape
	:rtype: bool") Classilist;
		Standard_Boolean Classilist (const TopTools_ListOfShape & lS,TopTools_DataMapOfShapeListOfShape & mapgreasma);

		/****************** Classip2d ******************/
		%feature("compactdefaultargs") Classip2d;
		%feature("autodoc", ":param S1:
	:type S1: TopoDS_Shape
	:param S2:
	:type S2: TopoDS_Shape
	:param stabnd2d12:
	:type stabnd2d12: int
	:rtype: int") Classip2d;
		Standard_Integer Classip2d (const TopoDS_Shape & S1,const TopoDS_Shape & S2,const Standard_Integer stabnd2d12);

		/****************** GetBox2d ******************/
		%feature("compactdefaultargs") GetBox2d;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:param Box2d:
	:type Box2d: Bnd_Box2d
	:rtype: bool") GetBox2d;
		Standard_Boolean GetBox2d (const TopoDS_Shape & S,Bnd_Box2d & Box2d);

		/****************** Getface ******************/
		%feature("compactdefaultargs") Getface;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:param fa:
	:type fa: TopOpeBRepTool_face
	:rtype: bool") Getface;
		Standard_Boolean Getface (const TopoDS_Shape & S,TopOpeBRepTool_face & fa);

		/****************** HasInit2d ******************/
		%feature("compactdefaultargs") HasInit2d;
		%feature("autodoc", ":rtype: bool") HasInit2d;
		Standard_Boolean HasInit2d ();

		/****************** Init2d ******************/
		%feature("compactdefaultargs") Init2d;
		%feature("autodoc", ":param Fref:
	:type Fref: TopoDS_Face
	:rtype: None") Init2d;
		void Init2d (const TopoDS_Face & Fref);

		/****************** TopOpeBRepTool_CLASSI ******************/
		%feature("compactdefaultargs") TopOpeBRepTool_CLASSI;
		%feature("autodoc", ":rtype: None") TopOpeBRepTool_CLASSI;
		 TopOpeBRepTool_CLASSI ();

};


%extend TopOpeBRepTool_CLASSI {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class TopOpeBRepTool_CORRISO *
*******************************/
class TopOpeBRepTool_CORRISO {
	public:
		/****************** AddNewConnexity ******************/
		%feature("compactdefaultargs") AddNewConnexity;
		%feature("autodoc", ":param V:
	:type V: TopoDS_Vertex
	:param E:
	:type E: TopoDS_Edge
	:rtype: bool") AddNewConnexity;
		Standard_Boolean AddNewConnexity (const TopoDS_Vertex & V,const TopoDS_Edge & E);

		/****************** Connexity ******************/
		%feature("compactdefaultargs") Connexity;
		%feature("autodoc", ":param V:
	:type V: TopoDS_Vertex
	:param Eds:
	:type Eds: TopTools_ListOfShape
	:rtype: bool") Connexity;
		Standard_Boolean Connexity (const TopoDS_Vertex & V,TopTools_ListOfShape & Eds);

		/****************** EdgeOUTofBoundsUV ******************/
		%feature("compactdefaultargs") EdgeOUTofBoundsUV;
		%feature("autodoc", ":param E:
	:type E: TopoDS_Edge
	:param onU:
	:type onU: bool
	:param tolx:
	:type tolx: float
	:param parspE:
	:type parspE: float
	:rtype: int") EdgeOUTofBoundsUV;
		Standard_Integer EdgeOUTofBoundsUV (const TopoDS_Edge & E,const Standard_Boolean onU,const Standard_Real tolx,Standard_Real &OutValue);

		/****************** EdgeWithFaultyUV ******************/
		%feature("compactdefaultargs") EdgeWithFaultyUV;
		%feature("autodoc", ":param E:
	:type E: TopoDS_Edge
	:param Ivfaulty:
	:type Ivfaulty: int
	:rtype: bool") EdgeWithFaultyUV;
		Standard_Boolean EdgeWithFaultyUV (const TopoDS_Edge & E,Standard_Integer &OutValue);

		/****************** EdgeWithFaultyUV ******************/
		%feature("compactdefaultargs") EdgeWithFaultyUV;
		%feature("autodoc", ":param EdsToCheck:
	:type EdsToCheck: TopTools_ListOfShape
	:param nfybounds:
	:type nfybounds: int
	:param fyE:
	:type fyE: TopoDS_Shape
	:param Ifaulty:
	:type Ifaulty: int
	:rtype: bool") EdgeWithFaultyUV;
		Standard_Boolean EdgeWithFaultyUV (const TopTools_ListOfShape & EdsToCheck,const Standard_Integer nfybounds,TopoDS_Shape & fyE,Standard_Integer &OutValue);

		/****************** EdgesOUTofBoundsUV ******************/
		%feature("compactdefaultargs") EdgesOUTofBoundsUV;
		%feature("autodoc", ":param EdsToCheck:
	:type EdsToCheck: TopTools_ListOfShape
	:param onU:
	:type onU: bool
	:param tolx:
	:type tolx: float
	:param FyEds:
	:type FyEds: TopTools_DataMapOfOrientedShapeInteger
	:rtype: bool") EdgesOUTofBoundsUV;
		Standard_Boolean EdgesOUTofBoundsUV (const TopTools_ListOfShape & EdsToCheck,const Standard_Boolean onU,const Standard_Real tolx,TopTools_DataMapOfOrientedShapeInteger & FyEds);

		/****************** EdgesWithFaultyUV ******************/
		%feature("compactdefaultargs") EdgesWithFaultyUV;
		%feature("autodoc", ":param EdsToCheck:
	:type EdsToCheck: TopTools_ListOfShape
	:param nfybounds:
	:type nfybounds: int
	:param FyEds:
	:type FyEds: TopTools_DataMapOfOrientedShapeInteger
	:param stopatfirst: default value is Standard_False
	:type stopatfirst: bool
	:rtype: bool") EdgesWithFaultyUV;
		Standard_Boolean EdgesWithFaultyUV (const TopTools_ListOfShape & EdsToCheck,const Standard_Integer nfybounds,TopTools_DataMapOfOrientedShapeInteger & FyEds,const Standard_Boolean stopatfirst = Standard_False);

		/****************** Eds ******************/
		%feature("compactdefaultargs") Eds;
		%feature("autodoc", ":rtype: TopTools_ListOfShape") Eds;
		const TopTools_ListOfShape & Eds ();

		/****************** Fref ******************/
		%feature("compactdefaultargs") Fref;
		%feature("autodoc", ":rtype: TopoDS_Face") Fref;
		const TopoDS_Face  Fref ();

		/****************** GASref ******************/
		%feature("compactdefaultargs") GASref;
		%feature("autodoc", ":rtype: GeomAdaptor_Surface") GASref;
		const GeomAdaptor_Surface & GASref ();

		/****************** GetnewS ******************/
		%feature("compactdefaultargs") GetnewS;
		%feature("autodoc", ":param newS:
	:type newS: TopoDS_Face
	:rtype: bool") GetnewS;
		Standard_Boolean GetnewS (TopoDS_Face & newS);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:rtype: bool") Init;
		Standard_Boolean Init (const TopoDS_Shape & S);

		/****************** PurgeFyClosingE ******************/
		%feature("compactdefaultargs") PurgeFyClosingE;
		%feature("autodoc", ":param ClEds:
	:type ClEds: TopTools_ListOfShape
	:param fyClEds:
	:type fyClEds: TopTools_ListOfShape
	:rtype: bool") PurgeFyClosingE;
		Standard_Boolean PurgeFyClosingE (const TopTools_ListOfShape & ClEds,TopTools_ListOfShape & fyClEds);

		/****************** Refclosed ******************/
		%feature("compactdefaultargs") Refclosed;
		%feature("autodoc", ":param x:
	:type x: int
	:param xperiod:
	:type xperiod: float
	:rtype: bool") Refclosed;
		Standard_Boolean Refclosed (const Standard_Integer x,Standard_Real &OutValue);

		/****************** RemoveOldConnexity ******************/
		%feature("compactdefaultargs") RemoveOldConnexity;
		%feature("autodoc", ":param V:
	:type V: TopoDS_Vertex
	:param E:
	:type E: TopoDS_Edge
	:rtype: bool") RemoveOldConnexity;
		Standard_Boolean RemoveOldConnexity (const TopoDS_Vertex & V,const TopoDS_Edge & E);

		/****************** S ******************/
		%feature("compactdefaultargs") S;
		%feature("autodoc", ":rtype: TopoDS_Shape") S;
		const TopoDS_Shape  S ();

		/****************** SetConnexity ******************/
		%feature("compactdefaultargs") SetConnexity;
		%feature("autodoc", ":param V:
	:type V: TopoDS_Vertex
	:param Eds:
	:type Eds: TopTools_ListOfShape
	:rtype: bool") SetConnexity;
		Standard_Boolean SetConnexity (const TopoDS_Vertex & V,const TopTools_ListOfShape & Eds);

		/****************** SetUVRep ******************/
		%feature("compactdefaultargs") SetUVRep;
		%feature("autodoc", ":param E:
	:type E: TopoDS_Edge
	:param C2DF:
	:type C2DF: TopOpeBRepTool_C2DF
	:rtype: bool") SetUVRep;
		Standard_Boolean SetUVRep (const TopoDS_Edge & E,const TopOpeBRepTool_C2DF & C2DF);

		/****************** Tol ******************/
		%feature("compactdefaultargs") Tol;
		%feature("autodoc", ":param I:
	:type I: int
	:param tol3d:
	:type tol3d: float
	:rtype: float") Tol;
		Standard_Real Tol (const Standard_Integer I,const Standard_Real tol3d);

		/****************** TopOpeBRepTool_CORRISO ******************/
		%feature("compactdefaultargs") TopOpeBRepTool_CORRISO;
		%feature("autodoc", ":rtype: None") TopOpeBRepTool_CORRISO;
		 TopOpeBRepTool_CORRISO ();

		/****************** TopOpeBRepTool_CORRISO ******************/
		%feature("compactdefaultargs") TopOpeBRepTool_CORRISO;
		%feature("autodoc", ":param FRef:
	:type FRef: TopoDS_Face
	:rtype: None") TopOpeBRepTool_CORRISO;
		 TopOpeBRepTool_CORRISO (const TopoDS_Face & FRef);

		/****************** TrslUV ******************/
		%feature("compactdefaultargs") TrslUV;
		%feature("autodoc", ":param onU:
	:type onU: bool
	:param FyEds:
	:type FyEds: TopTools_DataMapOfOrientedShapeInteger
	:rtype: bool") TrslUV;
		Standard_Boolean TrslUV (const Standard_Boolean onU,const TopTools_DataMapOfOrientedShapeInteger & FyEds);

		/****************** UVClosed ******************/
		%feature("compactdefaultargs") UVClosed;
		%feature("autodoc", ":rtype: bool") UVClosed;
		Standard_Boolean UVClosed ();

		/****************** UVRep ******************/
		%feature("compactdefaultargs") UVRep;
		%feature("autodoc", ":param E:
	:type E: TopoDS_Edge
	:param C2DF:
	:type C2DF: TopOpeBRepTool_C2DF
	:rtype: bool") UVRep;
		Standard_Boolean UVRep (const TopoDS_Edge & E,TopOpeBRepTool_C2DF & C2DF);

};


%extend TopOpeBRepTool_CORRISO {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class TopOpeBRepTool_CurveTool *
*********************************/
class TopOpeBRepTool_CurveTool {
	public:
		/****************** ChangeGeomTool ******************/
		%feature("compactdefaultargs") ChangeGeomTool;
		%feature("autodoc", ":rtype: TopOpeBRepTool_GeomTool") ChangeGeomTool;
		TopOpeBRepTool_GeomTool & ChangeGeomTool ();

		/****************** GetGeomTool ******************/
		%feature("compactdefaultargs") GetGeomTool;
		%feature("autodoc", ":rtype: TopOpeBRepTool_GeomTool") GetGeomTool;
		const TopOpeBRepTool_GeomTool & GetGeomTool ();

		/****************** IsProjectable ******************/
		%feature("compactdefaultargs") IsProjectable;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:param C:
	:type C: Geom_Curve
	:rtype: bool") IsProjectable;
		static Standard_Boolean IsProjectable (const TopoDS_Shape & S,const opencascade::handle<Geom_Curve> & C);

		/****************** MakeBSpline1fromPnt ******************/
		%feature("compactdefaultargs") MakeBSpline1fromPnt;
		%feature("autodoc", ":param P:
	:type P: TColgp_Array1OfPnt
	:rtype: opencascade::handle<Geom_Curve>") MakeBSpline1fromPnt;
		static opencascade::handle<Geom_Curve> MakeBSpline1fromPnt (const TColgp_Array1OfPnt & P);

		/****************** MakeBSpline1fromPnt2d ******************/
		%feature("compactdefaultargs") MakeBSpline1fromPnt2d;
		%feature("autodoc", ":param P:
	:type P: TColgp_Array1OfPnt2d
	:rtype: opencascade::handle<Geom2d_Curve>") MakeBSpline1fromPnt2d;
		static opencascade::handle<Geom2d_Curve> MakeBSpline1fromPnt2d (const TColgp_Array1OfPnt2d & P);

		/****************** MakeCurves ******************/
		%feature("compactdefaultargs") MakeCurves;
		%feature("autodoc", "* Approximates curves. Returns False in the case of failure
	:param min:
	:type min: float
	:param max:
	:type max: float
	:param C3D:
	:type C3D: Geom_Curve
	:param PC1:
	:type PC1: Geom2d_Curve
	:param PC2:
	:type PC2: Geom2d_Curve
	:param S1:
	:type S1: TopoDS_Shape
	:param S2:
	:type S2: TopoDS_Shape
	:param C3DN:
	:type C3DN: Geom_Curve
	:param PC1N:
	:type PC1N: Geom2d_Curve
	:param PC2N:
	:type PC2N: Geom2d_Curve
	:param Tol3d:
	:type Tol3d: float
	:param Tol2d:
	:type Tol2d: float
	:rtype: bool") MakeCurves;
		Standard_Boolean MakeCurves (const Standard_Real min,const Standard_Real max,const opencascade::handle<Geom_Curve> & C3D,const opencascade::handle<Geom2d_Curve> & PC1,const opencascade::handle<Geom2d_Curve> & PC2,const TopoDS_Shape & S1,const TopoDS_Shape & S2,opencascade::handle<Geom_Curve> & C3DN,opencascade::handle<Geom2d_Curve> & PC1N,opencascade::handle<Geom2d_Curve> & PC2N,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** MakePCurveOnFace ******************/
		%feature("compactdefaultargs") MakePCurveOnFace;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:param C:
	:type C: Geom_Curve
	:param TolReached2d:
	:type TolReached2d: float
	:param first: default value is 0.0
	:type first: float
	:param last: default value is 0.0
	:type last: float
	:rtype: opencascade::handle<Geom2d_Curve>") MakePCurveOnFace;
		static opencascade::handle<Geom2d_Curve> MakePCurveOnFace (const TopoDS_Shape & S,const opencascade::handle<Geom_Curve> & C,Standard_Real &OutValue,const Standard_Real first = 0.0,const Standard_Real last = 0.0);

		/****************** SetGeomTool ******************/
		%feature("compactdefaultargs") SetGeomTool;
		%feature("autodoc", ":param GT:
	:type GT: TopOpeBRepTool_GeomTool
	:rtype: None") SetGeomTool;
		void SetGeomTool (const TopOpeBRepTool_GeomTool & GT);

		/****************** TopOpeBRepTool_CurveTool ******************/
		%feature("compactdefaultargs") TopOpeBRepTool_CurveTool;
		%feature("autodoc", ":rtype: None") TopOpeBRepTool_CurveTool;
		 TopOpeBRepTool_CurveTool ();

		/****************** TopOpeBRepTool_CurveTool ******************/
		%feature("compactdefaultargs") TopOpeBRepTool_CurveTool;
		%feature("autodoc", ":param OCT:
	:type OCT: TopOpeBRepTool_OutCurveType
	:rtype: None") TopOpeBRepTool_CurveTool;
		 TopOpeBRepTool_CurveTool (const TopOpeBRepTool_OutCurveType OCT);

		/****************** TopOpeBRepTool_CurveTool ******************/
		%feature("compactdefaultargs") TopOpeBRepTool_CurveTool;
		%feature("autodoc", ":param GT:
	:type GT: TopOpeBRepTool_GeomTool
	:rtype: None") TopOpeBRepTool_CurveTool;
		 TopOpeBRepTool_CurveTool (const TopOpeBRepTool_GeomTool & GT);

};


%extend TopOpeBRepTool_CurveTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class TopOpeBRepTool_FuseEdges *
*********************************/
class TopOpeBRepTool_FuseEdges {
	public:
		/****************** AvoidEdges ******************/
		%feature("compactdefaultargs") AvoidEdges;
		%feature("autodoc", "* set edges to avoid being fused
	:param theMapEdg:
	:type theMapEdg: TopTools_IndexedMapOfShape
	:rtype: None") AvoidEdges;
		void AvoidEdges (const TopTools_IndexedMapOfShape & theMapEdg);

		/****************** Edges ******************/
		%feature("compactdefaultargs") Edges;
		%feature("autodoc", "* returns all the list of edges to be fused each list of the map represent a set of connex edges that can be fused.
	:param theMapLstEdg:
	:type theMapLstEdg: TopTools_DataMapOfIntegerListOfShape
	:rtype: None") Edges;
		void Edges (TopTools_DataMapOfIntegerListOfShape & theMapLstEdg);

		/****************** Faces ******************/
		%feature("compactdefaultargs") Faces;
		%feature("autodoc", "* returns the map of modified faces.
	:param theMapFac:
	:type theMapFac: TopTools_DataMapOfShapeShape
	:rtype: None") Faces;
		void Faces (TopTools_DataMapOfShapeShape & theMapFac);

		/****************** NbVertices ******************/
		%feature("compactdefaultargs") NbVertices;
		%feature("autodoc", "* returns the number of vertices candidate to be removed
	:rtype: int") NbVertices;
		Standard_Integer NbVertices ();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Using map of list of connex edges, fuse each list to one edge and then update myShape
	:rtype: None") Perform;
		void Perform ();

		/****************** ResultEdges ******************/
		%feature("compactdefaultargs") ResultEdges;
		%feature("autodoc", "* returns all the fused edges. each integer entry in the map corresponds to the integer in the DataMapOfIntegerListOfShape we get in method Edges. That is to say, to the list of edges in theMapLstEdg(i) corresponds the resulting edge theMapEdge(i)
	:param theMapEdg:
	:type theMapEdg: TopTools_DataMapOfIntegerShape
	:rtype: None") ResultEdges;
		void ResultEdges (TopTools_DataMapOfIntegerShape & theMapEdg);

		/****************** Shape ******************/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "* returns myShape modified with the list of internal edges removed from it.
	:rtype: TopoDS_Shape") Shape;
		TopoDS_Shape  Shape ();

		/****************** TopOpeBRepTool_FuseEdges ******************/
		%feature("compactdefaultargs") TopOpeBRepTool_FuseEdges;
		%feature("autodoc", "* Initialise members and build construction of map of ancestors.
	:param theShape:
	:type theShape: TopoDS_Shape
	:param PerformNow: default value is Standard_False
	:type PerformNow: bool
	:rtype: None") TopOpeBRepTool_FuseEdges;
		 TopOpeBRepTool_FuseEdges (const TopoDS_Shape & theShape,const Standard_Boolean PerformNow = Standard_False);

};


%extend TopOpeBRepTool_FuseEdges {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class TopOpeBRepTool_GeomTool *
********************************/
class TopOpeBRepTool_GeomTool {
	public:
		/****************** CompC3D ******************/
		%feature("compactdefaultargs") CompC3D;
		%feature("autodoc", ":rtype: bool") CompC3D;
		Standard_Boolean CompC3D ();

		/****************** CompPC1 ******************/
		%feature("compactdefaultargs") CompPC1;
		%feature("autodoc", ":rtype: bool") CompPC1;
		Standard_Boolean CompPC1 ();

		/****************** CompPC2 ******************/
		%feature("compactdefaultargs") CompPC2;
		%feature("autodoc", ":rtype: bool") CompPC2;
		Standard_Boolean CompPC2 ();

		/****************** Define ******************/
		%feature("compactdefaultargs") Define;
		%feature("autodoc", ":param TypeC3D:
	:type TypeC3D: TopOpeBRepTool_OutCurveType
	:param CompC3D:
	:type CompC3D: bool
	:param CompPC1:
	:type CompPC1: bool
	:param CompPC2:
	:type CompPC2: bool
	:rtype: None") Define;
		void Define (const TopOpeBRepTool_OutCurveType TypeC3D,const Standard_Boolean CompC3D,const Standard_Boolean CompPC1,const Standard_Boolean CompPC2);

		/****************** Define ******************/
		%feature("compactdefaultargs") Define;
		%feature("autodoc", ":param TypeC3D:
	:type TypeC3D: TopOpeBRepTool_OutCurveType
	:rtype: None") Define;
		void Define (const TopOpeBRepTool_OutCurveType TypeC3D);

		/****************** Define ******************/
		%feature("compactdefaultargs") Define;
		%feature("autodoc", ":param GT:
	:type GT: TopOpeBRepTool_GeomTool
	:rtype: None") Define;
		void Define (const TopOpeBRepTool_GeomTool & GT);

		/****************** DefineCurves ******************/
		%feature("compactdefaultargs") DefineCurves;
		%feature("autodoc", ":param CompC3D:
	:type CompC3D: bool
	:rtype: None") DefineCurves;
		void DefineCurves (const Standard_Boolean CompC3D);

		/****************** DefinePCurves1 ******************/
		%feature("compactdefaultargs") DefinePCurves1;
		%feature("autodoc", ":param CompPC1:
	:type CompPC1: bool
	:rtype: None") DefinePCurves1;
		void DefinePCurves1 (const Standard_Boolean CompPC1);

		/****************** DefinePCurves2 ******************/
		%feature("compactdefaultargs") DefinePCurves2;
		%feature("autodoc", ":param CompPC2:
	:type CompPC2: bool
	:rtype: None") DefinePCurves2;
		void DefinePCurves2 (const Standard_Boolean CompPC2);

		/****************** GetTolerances ******************/
		%feature("compactdefaultargs") GetTolerances;
		%feature("autodoc", ":param tol3d:
	:type tol3d: float
	:param tol2d:
	:type tol2d: float
	:rtype: None") GetTolerances;
		void GetTolerances (Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** NbPntMax ******************/
		%feature("compactdefaultargs") NbPntMax;
		%feature("autodoc", ":rtype: int") NbPntMax;
		Standard_Integer NbPntMax ();

		/****************** SetNbPntMax ******************/
		%feature("compactdefaultargs") SetNbPntMax;
		%feature("autodoc", ":param NbPntMax:
	:type NbPntMax: int
	:rtype: None") SetNbPntMax;
		void SetNbPntMax (const Standard_Integer NbPntMax);

		/****************** SetTolerances ******************/
		%feature("compactdefaultargs") SetTolerances;
		%feature("autodoc", ":param tol3d:
	:type tol3d: float
	:param tol2d:
	:type tol2d: float
	:rtype: None") SetTolerances;
		void SetTolerances (const Standard_Real tol3d,const Standard_Real tol2d);

		/****************** TopOpeBRepTool_GeomTool ******************/
		%feature("compactdefaultargs") TopOpeBRepTool_GeomTool;
		%feature("autodoc", "* Boolean flags <CompC3D>, <CompPC1>, <CompPC2> indicate whether the corresponding result curves <C3D>, <PC1>, <PC2> of MakeCurves method must or not be computed from an intersection line <L>. When the line <L> is a walking one, <TypeC3D> is the kind of the 3D curve <C3D> to compute : - BSPLINE1 to compute a BSpline of degree 1 on the walking points of <L>, - APPROX to build an approximation curve on the walking points of <L>.
	:param TypeC3D: default value is TopOpeBRepTool_BSPLINE1
	:type TypeC3D: TopOpeBRepTool_OutCurveType
	:param CompC3D: default value is Standard_True
	:type CompC3D: bool
	:param CompPC1: default value is Standard_True
	:type CompPC1: bool
	:param CompPC2: default value is Standard_True
	:type CompPC2: bool
	:rtype: None") TopOpeBRepTool_GeomTool;
		 TopOpeBRepTool_GeomTool (const TopOpeBRepTool_OutCurveType TypeC3D = TopOpeBRepTool_BSPLINE1,const Standard_Boolean CompC3D = Standard_True,const Standard_Boolean CompPC1 = Standard_True,const Standard_Boolean CompPC2 = Standard_True);

		/****************** TypeC3D ******************/
		%feature("compactdefaultargs") TypeC3D;
		%feature("autodoc", ":rtype: TopOpeBRepTool_OutCurveType") TypeC3D;
		TopOpeBRepTool_OutCurveType TypeC3D ();

};


%extend TopOpeBRepTool_GeomTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class TopOpeBRepTool_HBoxTool *
********************************/
class TopOpeBRepTool_HBoxTool : public Standard_Transient {
	public:
		/****************** AddBox ******************/
		%feature("compactdefaultargs") AddBox;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:rtype: None") AddBox;
		void AddBox (const TopoDS_Shape & S);

		/****************** AddBoxes ******************/
		%feature("compactdefaultargs") AddBoxes;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:param TS:
	:type TS: TopAbs_ShapeEnum
	:param TA: default value is TopAbs_SHAPE
	:type TA: TopAbs_ShapeEnum
	:rtype: None") AddBoxes;
		void AddBoxes (const TopoDS_Shape & S,const TopAbs_ShapeEnum TS,const TopAbs_ShapeEnum TA = TopAbs_SHAPE);

		/****************** Box ******************/
		%feature("compactdefaultargs") Box;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:rtype: Bnd_Box") Box;
		const Bnd_Box & Box (const TopoDS_Shape & S);

		/****************** Box ******************/
		%feature("compactdefaultargs") Box;
		%feature("autodoc", ":param I:
	:type I: int
	:rtype: Bnd_Box") Box;
		const Bnd_Box & Box (const Standard_Integer I);

		/****************** ChangeIMS ******************/
		%feature("compactdefaultargs") ChangeIMS;
		%feature("autodoc", ":rtype: TopOpeBRepTool_IndexedDataMapOfShapeBox") ChangeIMS;
		TopOpeBRepTool_IndexedDataMapOfShapeBox & ChangeIMS ();

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", ":rtype: None") Clear;
		void Clear ();

		/****************** ComputeBox ******************/
		%feature("compactdefaultargs") ComputeBox;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:param B:
	:type B: Bnd_Box
	:rtype: void") ComputeBox;
		static void ComputeBox (const TopoDS_Shape & S,Bnd_Box & B);

		/****************** ComputeBoxOnVertices ******************/
		%feature("compactdefaultargs") ComputeBoxOnVertices;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:param B:
	:type B: Bnd_Box
	:rtype: void") ComputeBoxOnVertices;
		static void ComputeBoxOnVertices (const TopoDS_Shape & S,Bnd_Box & B);

		/****************** DumpB ******************/
		%feature("compactdefaultargs") DumpB;
		%feature("autodoc", ":param B:
	:type B: Bnd_Box
	:rtype: void") DumpB;
		static void DumpB (const Bnd_Box & B);

		/****************** Extent ******************/
		%feature("compactdefaultargs") Extent;
		%feature("autodoc", ":rtype: int") Extent;
		Standard_Integer Extent ();

		/****************** HasBox ******************/
		%feature("compactdefaultargs") HasBox;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:rtype: bool") HasBox;
		Standard_Boolean HasBox (const TopoDS_Shape & S);

		/****************** IMS ******************/
		%feature("compactdefaultargs") IMS;
		%feature("autodoc", ":rtype: TopOpeBRepTool_IndexedDataMapOfShapeBox") IMS;
		const TopOpeBRepTool_IndexedDataMapOfShapeBox & IMS ();

		/****************** Index ******************/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:rtype: int") Index;
		Standard_Integer Index (const TopoDS_Shape & S);

		/****************** Shape ******************/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", ":param I:
	:type I: int
	:rtype: TopoDS_Shape") Shape;
		const TopoDS_Shape  Shape (const Standard_Integer I);

		/****************** TopOpeBRepTool_HBoxTool ******************/
		%feature("compactdefaultargs") TopOpeBRepTool_HBoxTool;
		%feature("autodoc", ":rtype: None") TopOpeBRepTool_HBoxTool;
		 TopOpeBRepTool_HBoxTool ();

};


%make_alias(TopOpeBRepTool_HBoxTool)

%extend TopOpeBRepTool_HBoxTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************
* class TopOpeBRepTool_PurgeInternalEdges *
******************************************/
class TopOpeBRepTool_PurgeInternalEdges {
	public:
		/****************** Faces ******************/
		%feature("compactdefaultargs") Faces;
		%feature("autodoc", "* returns the list internal edges associated with the faces of the myShape. If PerformNow was False when created, then call the private Perform method that do the main job.
	:param theMapFacLstEdg:
	:type theMapFacLstEdg: TopTools_DataMapOfShapeListOfShape
	:rtype: None") Faces;
		void Faces (TopTools_DataMapOfShapeListOfShape & theMapFacLstEdg);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "* returns False if the list of internal edges has not been extracted
	:rtype: bool") IsDone;
		Standard_Boolean IsDone ();

		/****************** NbEdges ******************/
		%feature("compactdefaultargs") NbEdges;
		%feature("autodoc", "* returns the number of edges candidate to be removed
	:rtype: int") NbEdges;
		Standard_Integer NbEdges ();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Using the list of internal edge from each face, rebuild myShape by removing thoses edges.
	:rtype: None") Perform;
		void Perform ();

		/****************** Shape ******************/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "* returns myShape modified with the list of internal edges removed from it.
	:rtype: TopoDS_Shape") Shape;
		TopoDS_Shape  Shape ();

		/****************** TopOpeBRepTool_PurgeInternalEdges ******************/
		%feature("compactdefaultargs") TopOpeBRepTool_PurgeInternalEdges;
		%feature("autodoc", "* Initialize members and begin exploration of shape depending of the value of PerformNow
	:param theShape:
	:type theShape: TopoDS_Shape
	:param PerformNow: default value is Standard_True
	:type PerformNow: bool
	:rtype: None") TopOpeBRepTool_PurgeInternalEdges;
		 TopOpeBRepTool_PurgeInternalEdges (const TopoDS_Shape & theShape,const Standard_Boolean PerformNow = Standard_True);

};


%extend TopOpeBRepTool_PurgeInternalEdges {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class TopOpeBRepTool_REGUS *
*****************************/
class TopOpeBRepTool_REGUS {
	public:
		/****************** GetFsplits ******************/
		%feature("compactdefaultargs") GetFsplits;
		%feature("autodoc", ":param Fsplits:
	:type Fsplits: TopTools_DataMapOfShapeListOfShape
	:rtype: None") GetFsplits;
		void GetFsplits (TopTools_DataMapOfShapeListOfShape & Fsplits);

		/****************** GetOshNsh ******************/
		%feature("compactdefaultargs") GetOshNsh;
		%feature("autodoc", ":param OshNsh:
	:type OshNsh: TopTools_DataMapOfShapeListOfShape
	:rtype: None") GetOshNsh;
		void GetOshNsh (TopTools_DataMapOfShapeListOfShape & OshNsh);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:rtype: None") Init;
		void Init (const TopoDS_Shape & S);

		/****************** InitBlock ******************/
		%feature("compactdefaultargs") InitBlock;
		%feature("autodoc", ":rtype: bool") InitBlock;
		Standard_Boolean InitBlock ();

		/****************** MapS ******************/
		%feature("compactdefaultargs") MapS;
		%feature("autodoc", ":rtype: bool") MapS;
		Standard_Boolean MapS ();

		/****************** NearestF ******************/
		%feature("compactdefaultargs") NearestF;
		%feature("autodoc", ":param e:
	:type e: TopoDS_Edge
	:param lof:
	:type lof: TopTools_ListOfShape
	:param ffound:
	:type ffound: TopoDS_Face
	:rtype: bool") NearestF;
		Standard_Boolean NearestF (const TopoDS_Edge & e,const TopTools_ListOfShape & lof,TopoDS_Face & ffound);

		/****************** NextinBlock ******************/
		%feature("compactdefaultargs") NextinBlock;
		%feature("autodoc", ":rtype: bool") NextinBlock;
		Standard_Boolean NextinBlock ();

		/****************** REGU ******************/
		%feature("compactdefaultargs") REGU;
		%feature("autodoc", ":rtype: bool") REGU;
		Standard_Boolean REGU ();

		/****************** S ******************/
		%feature("compactdefaultargs") S;
		%feature("autodoc", ":rtype: TopoDS_Shape") S;
		const TopoDS_Shape  S ();

		/****************** SetFsplits ******************/
		%feature("compactdefaultargs") SetFsplits;
		%feature("autodoc", ":param Fsplits:
	:type Fsplits: TopTools_DataMapOfShapeListOfShape
	:rtype: None") SetFsplits;
		void SetFsplits (TopTools_DataMapOfShapeListOfShape & Fsplits);

		/****************** SetOshNsh ******************/
		%feature("compactdefaultargs") SetOshNsh;
		%feature("autodoc", ":param OshNsh:
	:type OshNsh: TopTools_DataMapOfShapeListOfShape
	:rtype: None") SetOshNsh;
		void SetOshNsh (TopTools_DataMapOfShapeListOfShape & OshNsh);

		/****************** SplitF ******************/
		%feature("compactdefaultargs") SplitF;
		%feature("autodoc", ":param Fanc:
	:type Fanc: TopoDS_Face
	:param FSplits:
	:type FSplits: TopTools_ListOfShape
	:rtype: bool") SplitF;
		static Standard_Boolean SplitF (const TopoDS_Face & Fanc,TopTools_ListOfShape & FSplits);

		/****************** SplitFaces ******************/
		%feature("compactdefaultargs") SplitFaces;
		%feature("autodoc", ":rtype: bool") SplitFaces;
		Standard_Boolean SplitFaces ();

		/****************** TopOpeBRepTool_REGUS ******************/
		%feature("compactdefaultargs") TopOpeBRepTool_REGUS;
		%feature("autodoc", ":rtype: None") TopOpeBRepTool_REGUS;
		 TopOpeBRepTool_REGUS ();

		/****************** WireToFace ******************/
		%feature("compactdefaultargs") WireToFace;
		%feature("autodoc", ":param Fanc:
	:type Fanc: TopoDS_Face
	:param nWs:
	:type nWs: TopTools_ListOfShape
	:param nFs:
	:type nFs: TopTools_ListOfShape
	:rtype: bool") WireToFace;
		static Standard_Boolean WireToFace (const TopoDS_Face & Fanc,const TopTools_ListOfShape & nWs,TopTools_ListOfShape & nFs);

};


%extend TopOpeBRepTool_REGUS {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class TopOpeBRepTool_REGUW *
*****************************/
class TopOpeBRepTool_REGUW {
	public:
		/****************** AddNewConnexity ******************/
		%feature("compactdefaultargs") AddNewConnexity;
		%feature("autodoc", ":param v:
	:type v: TopoDS_Vertex
	:param OriKey:
	:type OriKey: int
	:param e:
	:type e: TopoDS_Edge
	:rtype: bool") AddNewConnexity;
		Standard_Boolean AddNewConnexity (const TopoDS_Vertex & v,const Standard_Integer OriKey,const TopoDS_Edge & e);

		/****************** Connexity ******************/
		%feature("compactdefaultargs") Connexity;
		%feature("autodoc", ":param v:
	:type v: TopoDS_Vertex
	:param co:
	:type co: TopOpeBRepTool_connexity
	:rtype: bool") Connexity;
		Standard_Boolean Connexity (const TopoDS_Vertex & v,TopOpeBRepTool_connexity & co);

		/****************** Fref ******************/
		%feature("compactdefaultargs") Fref;
		%feature("autodoc", ":rtype: TopoDS_Face") Fref;
		const TopoDS_Face  Fref ();

		/****************** GetEsplits ******************/
		%feature("compactdefaultargs") GetEsplits;
		%feature("autodoc", ":param Esplits:
	:type Esplits: TopTools_DataMapOfShapeListOfShape
	:rtype: None") GetEsplits;
		void GetEsplits (TopTools_DataMapOfShapeListOfShape & Esplits);

		/****************** GetOwNw ******************/
		%feature("compactdefaultargs") GetOwNw;
		%feature("autodoc", ":param OwNw:
	:type OwNw: TopTools_DataMapOfShapeListOfShape
	:rtype: None") GetOwNw;
		void GetOwNw (TopTools_DataMapOfShapeListOfShape & OwNw);

		/****************** GetSplits ******************/
		%feature("compactdefaultargs") GetSplits;
		%feature("autodoc", ":param Splits:
	:type Splits: TopTools_ListOfShape
	:rtype: bool") GetSplits;
		Standard_Boolean GetSplits (TopTools_ListOfShape & Splits);

		/****************** HasInit ******************/
		%feature("compactdefaultargs") HasInit;
		%feature("autodoc", ":rtype: bool") HasInit;
		Standard_Boolean HasInit ();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:rtype: None") Init;
		void Init (const TopoDS_Shape & S);

		/****************** InitBlock ******************/
		%feature("compactdefaultargs") InitBlock;
		%feature("autodoc", ":rtype: bool") InitBlock;
		Standard_Boolean InitBlock ();

		/****************** MapS ******************/
		%feature("compactdefaultargs") MapS;
		%feature("autodoc", ":rtype: bool") MapS;
		Standard_Boolean MapS ();

		/****************** NearestE ******************/
		%feature("compactdefaultargs") NearestE;
		%feature("autodoc", ":param loe:
	:type loe: TopTools_ListOfShape
	:param efound:
	:type efound: TopoDS_Edge
	:rtype: bool") NearestE;
		Standard_Boolean NearestE (const TopTools_ListOfShape & loe,TopoDS_Edge & efound);

		/****************** NextinBlock ******************/
		%feature("compactdefaultargs") NextinBlock;
		%feature("autodoc", ":rtype: bool") NextinBlock;
		Standard_Boolean NextinBlock ();

		/****************** REGU ******************/
		%feature("compactdefaultargs") REGU;
		%feature("autodoc", ":param istep:
	:type istep: int
	:param Scur:
	:type Scur: TopoDS_Shape
	:param Splits:
	:type Splits: TopTools_ListOfShape
	:rtype: bool") REGU;
		Standard_Boolean REGU (const Standard_Integer istep,const TopoDS_Shape & Scur,TopTools_ListOfShape & Splits);

		/****************** REGU ******************/
		%feature("compactdefaultargs") REGU;
		%feature("autodoc", ":rtype: bool") REGU;
		Standard_Boolean REGU ();

		/****************** RemoveOldConnexity ******************/
		%feature("compactdefaultargs") RemoveOldConnexity;
		%feature("autodoc", ":param v:
	:type v: TopoDS_Vertex
	:param OriKey:
	:type OriKey: int
	:param e:
	:type e: TopoDS_Edge
	:rtype: bool") RemoveOldConnexity;
		Standard_Boolean RemoveOldConnexity (const TopoDS_Vertex & v,const Standard_Integer OriKey,const TopoDS_Edge & e);

		/****************** S ******************/
		%feature("compactdefaultargs") S;
		%feature("autodoc", ":rtype: TopoDS_Shape") S;
		const TopoDS_Shape  S ();

		/****************** SetEsplits ******************/
		%feature("compactdefaultargs") SetEsplits;
		%feature("autodoc", ":param Esplits:
	:type Esplits: TopTools_DataMapOfShapeListOfShape
	:rtype: None") SetEsplits;
		void SetEsplits (TopTools_DataMapOfShapeListOfShape & Esplits);

		/****************** SetOwNw ******************/
		%feature("compactdefaultargs") SetOwNw;
		%feature("autodoc", ":param OwNw:
	:type OwNw: TopTools_DataMapOfShapeListOfShape
	:rtype: None") SetOwNw;
		void SetOwNw (TopTools_DataMapOfShapeListOfShape & OwNw);

		/****************** SplitEds ******************/
		%feature("compactdefaultargs") SplitEds;
		%feature("autodoc", ":rtype: bool") SplitEds;
		Standard_Boolean SplitEds ();

		/****************** TopOpeBRepTool_REGUW ******************/
		%feature("compactdefaultargs") TopOpeBRepTool_REGUW;
		%feature("autodoc", ":param FRef:
	:type FRef: TopoDS_Face
	:rtype: None") TopOpeBRepTool_REGUW;
		 TopOpeBRepTool_REGUW (const TopoDS_Face & FRef);

		/****************** UpdateMultiple ******************/
		%feature("compactdefaultargs") UpdateMultiple;
		%feature("autodoc", ":param v:
	:type v: TopoDS_Vertex
	:rtype: bool") UpdateMultiple;
		Standard_Boolean UpdateMultiple (const TopoDS_Vertex & v);

};


%extend TopOpeBRepTool_REGUW {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class TopOpeBRepTool_STATE *
*****************************/
/***************************************
* class TopOpeBRepTool_ShapeClassifier *
***************************************/
class TopOpeBRepTool_ShapeClassifier {
	public:
		/****************** ChangeSolidClassifier ******************/
		%feature("compactdefaultargs") ChangeSolidClassifier;
		%feature("autodoc", ":rtype: TopOpeBRepTool_SolidClassifier") ChangeSolidClassifier;
		TopOpeBRepTool_SolidClassifier & ChangeSolidClassifier ();

		/****************** ClearAll ******************/
		%feature("compactdefaultargs") ClearAll;
		%feature("autodoc", "* reset all internal data (SolidClassifier included)
	:rtype: None") ClearAll;
		void ClearAll ();

		/****************** ClearCurrent ******************/
		%feature("compactdefaultargs") ClearCurrent;
		%feature("autodoc", "* reset all internal data (except SolidClassified)
	:rtype: None") ClearCurrent;
		void ClearCurrent ();

		/****************** P2D ******************/
		%feature("compactdefaultargs") P2D;
		%feature("autodoc", ":rtype: gp_Pnt2d") P2D;
		const gp_Pnt2d  P2D ();

		/****************** P3D ******************/
		%feature("compactdefaultargs") P3D;
		%feature("autodoc", ":rtype: gp_Pnt") P3D;
		const gp_Pnt  P3D ();

		/****************** SameDomain ******************/
		%feature("compactdefaultargs") SameDomain;
		%feature("autodoc", ":rtype: int") SameDomain;
		Standard_Integer SameDomain ();

		/****************** SameDomain ******************/
		%feature("compactdefaultargs") SameDomain;
		%feature("autodoc", "* set mode for next StateShapeShape call samedomain = true --> S,Sref are same domain --> point on restriction (ON S) is used to classify S. samedomain = false --> S,Sref are not domain --> point not on restriction of S (IN S) is used to classify S. samedomain value is used only in next StateShapeShape call
	:param samedomain:
	:type samedomain: int
	:rtype: None") SameDomain;
		void SameDomain (const Standard_Integer samedomain);

		/****************** SetReference ******************/
		%feature("compactdefaultargs") SetReference;
		%feature("autodoc", "* Set SRef as reference shape the next StateShapeReference(S,AvoidS) calls will classify S with SRef.
	:param SRef:
	:type SRef: TopoDS_Shape
	:rtype: None") SetReference;
		void SetReference (const TopoDS_Shape & SRef);

		/****************** State ******************/
		%feature("compactdefaultargs") State;
		%feature("autodoc", "* return field myState
	:rtype: TopAbs_State") State;
		TopAbs_State State ();

		/****************** StateP2DReference ******************/
		%feature("compactdefaultargs") StateP2DReference;
		%feature("autodoc", "* classify point P2D with myRef
	:param P2D:
	:type P2D: gp_Pnt2d
	:rtype: None") StateP2DReference;
		void StateP2DReference (const gp_Pnt2d & P2D);

		/****************** StateP3DReference ******************/
		%feature("compactdefaultargs") StateP3DReference;
		%feature("autodoc", "* classify point P3D with myRef
	:param P3D:
	:type P3D: gp_Pnt
	:rtype: None") StateP3DReference;
		void StateP3DReference (const gp_Pnt & P3D);

		/****************** StateShapeReference ******************/
		%feature("compactdefaultargs") StateShapeReference;
		%feature("autodoc", "* classify shape S compared with reference shape. AvoidS is not used in classification; AvoidS may be IsNull(). (usefull to avoid ON or UNKNOWN state in special cases)
	:param S:
	:type S: TopoDS_Shape
	:param AvoidS:
	:type AvoidS: TopoDS_Shape
	:rtype: TopAbs_State") StateShapeReference;
		TopAbs_State StateShapeReference (const TopoDS_Shape & S,const TopoDS_Shape & AvoidS);

		/****************** StateShapeReference ******************/
		%feature("compactdefaultargs") StateShapeReference;
		%feature("autodoc", "* classify shape S compared with reference shape. LAvoidS is list of S subshapes to avoid in classification (usefull to avoid ON or UNKNOWN state in special cases)
	:param S:
	:type S: TopoDS_Shape
	:param LAvoidS:
	:type LAvoidS: TopTools_ListOfShape
	:rtype: TopAbs_State") StateShapeReference;
		TopAbs_State StateShapeReference (const TopoDS_Shape & S,const TopTools_ListOfShape & LAvoidS);

		/****************** StateShapeShape ******************/
		%feature("compactdefaultargs") StateShapeShape;
		%feature("autodoc", "* classify shape S compared with shape SRef. samedomain = 0 : S1,S2 are not same domain samedomain = 1 : S1,S2 are same domain
	:param S:
	:type S: TopoDS_Shape
	:param SRef:
	:type SRef: TopoDS_Shape
	:param samedomain: default value is 0
	:type samedomain: int
	:rtype: TopAbs_State") StateShapeShape;
		TopAbs_State StateShapeShape (const TopoDS_Shape & S,const TopoDS_Shape & SRef,const Standard_Integer samedomain = 0);

		/****************** StateShapeShape ******************/
		%feature("compactdefaultargs") StateShapeShape;
		%feature("autodoc", "* classify shape S compared with shape SRef. AvoidS is not used in classification; AvoidS may be IsNull(). (usefull to avoid ON or UNKNOWN state in special cases)
	:param S:
	:type S: TopoDS_Shape
	:param AvoidS:
	:type AvoidS: TopoDS_Shape
	:param SRef:
	:type SRef: TopoDS_Shape
	:rtype: TopAbs_State") StateShapeShape;
		TopAbs_State StateShapeShape (const TopoDS_Shape & S,const TopoDS_Shape & AvoidS,const TopoDS_Shape & SRef);

		/****************** StateShapeShape ******************/
		%feature("compactdefaultargs") StateShapeShape;
		%feature("autodoc", "* classify shape S compared with shape SRef. LAvoidS is list of S subshapes to avoid in classification AvoidS is not used in classification; AvoidS may be IsNull(). (usefull to avoid ON or UNKNOWN state in special cases)
	:param S:
	:type S: TopoDS_Shape
	:param LAvoidS:
	:type LAvoidS: TopTools_ListOfShape
	:param SRef:
	:type SRef: TopoDS_Shape
	:rtype: TopAbs_State") StateShapeShape;
		TopAbs_State StateShapeShape (const TopoDS_Shape & S,const TopTools_ListOfShape & LAvoidS,const TopoDS_Shape & SRef);

		/****************** TopOpeBRepTool_ShapeClassifier ******************/
		%feature("compactdefaultargs") TopOpeBRepTool_ShapeClassifier;
		%feature("autodoc", ":rtype: None") TopOpeBRepTool_ShapeClassifier;
		 TopOpeBRepTool_ShapeClassifier ();

		/****************** TopOpeBRepTool_ShapeClassifier ******************/
		%feature("compactdefaultargs") TopOpeBRepTool_ShapeClassifier;
		%feature("autodoc", "* SRef is the reference shape. StateShapeShape(S) calls will classify S with SRef.
	:param SRef:
	:type SRef: TopoDS_Shape
	:rtype: None") TopOpeBRepTool_ShapeClassifier;
		 TopOpeBRepTool_ShapeClassifier (const TopoDS_Shape & SRef);

};


%extend TopOpeBRepTool_ShapeClassifier {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class TopOpeBRepTool_ShapeExplorer *
*************************************/
class TopOpeBRepTool_ShapeExplorer : public TopExp_Explorer {
	public:

        %feature("autodoc", "1");
        %extend{
            std::string DumpCurrentToString() {
            std::stringstream s;
            self->DumpCurrent(s);
            return s.str();}
        };
        		/****************** Index ******************/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "* Index of current sub-shape
	:rtype: int") Index;
		Standard_Integer Index ();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:param ToFind:
	:type ToFind: TopAbs_ShapeEnum
	:param ToAvoid: default value is TopAbs_SHAPE
	:type ToAvoid: TopAbs_ShapeEnum
	:rtype: None") Init;
		void Init (const TopoDS_Shape & S,const TopAbs_ShapeEnum ToFind,const TopAbs_ShapeEnum ToAvoid = TopAbs_SHAPE);

		/****************** Next ******************/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "* Moves to the next Shape in the exploration.
	:rtype: None") Next;
		void Next ();

		/****************** TopOpeBRepTool_ShapeExplorer ******************/
		%feature("compactdefaultargs") TopOpeBRepTool_ShapeExplorer;
		%feature("autodoc", "* Creates an empty explorer, becomes usefull after Init.
	:rtype: None") TopOpeBRepTool_ShapeExplorer;
		 TopOpeBRepTool_ShapeExplorer ();

		/****************** TopOpeBRepTool_ShapeExplorer ******************/
		%feature("compactdefaultargs") TopOpeBRepTool_ShapeExplorer;
		%feature("autodoc", "* Creates an Explorer on the Shape <S>. //! <ToFind> is the type of shapes to search. TopAbs_VERTEX, TopAbs_EDGE, ... //! <ToAvoid> is the type of shape to skip in the exploration. If <ToAvoid> is equal or less complex than <ToFind> or if <ToAVoid> is SHAPE it has no effect on the exploration.
	:param S:
	:type S: TopoDS_Shape
	:param ToFind:
	:type ToFind: TopAbs_ShapeEnum
	:param ToAvoid: default value is TopAbs_SHAPE
	:type ToAvoid: TopAbs_ShapeEnum
	:rtype: None") TopOpeBRepTool_ShapeExplorer;
		 TopOpeBRepTool_ShapeExplorer (const TopoDS_Shape & S,const TopAbs_ShapeEnum ToFind,const TopAbs_ShapeEnum ToAvoid = TopAbs_SHAPE);

};


%extend TopOpeBRepTool_ShapeExplorer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class TopOpeBRepTool_ShapeTool *
*********************************/
class TopOpeBRepTool_ShapeTool {
	public:
		/****************** AdjustOnPeriodic ******************/
		%feature("compactdefaultargs") AdjustOnPeriodic;
		%feature("autodoc", "* ajust u,v values in UVBounds of the domain of the geometric shape <S>, according to Uperiodicity and VPeriodicity of the domain. <S> is assumed to be a face. u and/or v is/are not modified when the domain is not periodic in U and/or V .
	:param S:
	:type S: TopoDS_Shape
	:param u:
	:type u: float
	:param v:
	:type v: float
	:rtype: void") AdjustOnPeriodic;
		static void AdjustOnPeriodic (const TopoDS_Shape & S,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** BASISCURVE ******************/
		%feature("compactdefaultargs") BASISCURVE;
		%feature("autodoc", ":param C:
	:type C: Geom_Curve
	:rtype: opencascade::handle<Geom_Curve>") BASISCURVE;
		static opencascade::handle<Geom_Curve> BASISCURVE (const opencascade::handle<Geom_Curve> & C);

		/****************** BASISCURVE ******************/
		%feature("compactdefaultargs") BASISCURVE;
		%feature("autodoc", ":param E:
	:type E: TopoDS_Edge
	:rtype: opencascade::handle<Geom_Curve>") BASISCURVE;
		static opencascade::handle<Geom_Curve> BASISCURVE (const TopoDS_Edge & E);

		/****************** BASISSURFACE ******************/
		%feature("compactdefaultargs") BASISSURFACE;
		%feature("autodoc", ":param S:
	:type S: Geom_Surface
	:rtype: opencascade::handle<Geom_Surface>") BASISSURFACE;
		static opencascade::handle<Geom_Surface> BASISSURFACE (const opencascade::handle<Geom_Surface> & S);

		/****************** BASISSURFACE ******************/
		%feature("compactdefaultargs") BASISSURFACE;
		%feature("autodoc", ":param F:
	:type F: TopoDS_Face
	:rtype: opencascade::handle<Geom_Surface>") BASISSURFACE;
		static opencascade::handle<Geom_Surface> BASISSURFACE (const TopoDS_Face & F);

		/****************** Closed ******************/
		%feature("compactdefaultargs") Closed;
		%feature("autodoc", "* indicates wheter shape S1 is a closing shape on S2 or not.
	:param S1:
	:type S1: TopoDS_Shape
	:param S2:
	:type S2: TopoDS_Shape
	:rtype: bool") Closed;
		static Standard_Boolean Closed (const TopoDS_Shape & S1,const TopoDS_Shape & S2);

		/****************** CurvesSameOriented ******************/
		%feature("compactdefaultargs") CurvesSameOriented;
		%feature("autodoc", ":param C1:
	:type C1: BRepAdaptor_Curve
	:param C2:
	:type C2: BRepAdaptor_Curve
	:rtype: bool") CurvesSameOriented;
		static Standard_Boolean CurvesSameOriented (const BRepAdaptor_Curve & C1,const BRepAdaptor_Curve & C2);

		/****************** EdgeData ******************/
		%feature("compactdefaultargs") EdgeData;
		%feature("autodoc", "* Compute tangent T, normal N, curvature C at point of parameter P on curve BRAC. Returns the tolerance indicating if T,N are null.
	:param BRAC:
	:type BRAC: BRepAdaptor_Curve
	:param P:
	:type P: float
	:param T:
	:type T: gp_Dir
	:param N:
	:type N: gp_Dir
	:param C:
	:type C: float
	:rtype: float") EdgeData;
		static Standard_Real EdgeData (const BRepAdaptor_Curve & BRAC,const Standard_Real P,gp_Dir & T,gp_Dir & N,Standard_Real &OutValue);

		/****************** EdgeData ******************/
		%feature("compactdefaultargs") EdgeData;
		%feature("autodoc", "* Same as previous on edge E.
	:param E:
	:type E: TopoDS_Shape
	:param P:
	:type P: float
	:param T:
	:type T: gp_Dir
	:param N:
	:type N: gp_Dir
	:param C:
	:type C: float
	:rtype: float") EdgeData;
		static Standard_Real EdgeData (const TopoDS_Shape & E,const Standard_Real P,gp_Dir & T,gp_Dir & N,Standard_Real &OutValue);

		/****************** EdgesSameOriented ******************/
		%feature("compactdefaultargs") EdgesSameOriented;
		%feature("autodoc", ":param E1:
	:type E1: TopoDS_Shape
	:param E2:
	:type E2: TopoDS_Shape
	:rtype: bool") EdgesSameOriented;
		static Standard_Boolean EdgesSameOriented (const TopoDS_Shape & E1,const TopoDS_Shape & E2);

		/****************** FacesSameOriented ******************/
		%feature("compactdefaultargs") FacesSameOriented;
		%feature("autodoc", ":param F1:
	:type F1: TopoDS_Shape
	:param F2:
	:type F2: TopoDS_Shape
	:rtype: bool") FacesSameOriented;
		static Standard_Boolean FacesSameOriented (const TopoDS_Shape & F1,const TopoDS_Shape & F2);

		/****************** PeriodizeParameter ******************/
		%feature("compactdefaultargs") PeriodizeParameter;
		%feature("autodoc", ":param par:
	:type par: float
	:param EE:
	:type EE: TopoDS_Shape
	:param FF:
	:type FF: TopoDS_Shape
	:rtype: float") PeriodizeParameter;
		static Standard_Real PeriodizeParameter (const Standard_Real par,const TopoDS_Shape & EE,const TopoDS_Shape & FF);

		/****************** Pnt ******************/
		%feature("compactdefaultargs") Pnt;
		%feature("autodoc", "* Returns 3D point of vertex <S>.
	:param S:
	:type S: TopoDS_Shape
	:rtype: gp_Pnt") Pnt;
		static gp_Pnt Pnt (const TopoDS_Shape & S);

		/****************** Resolution3d ******************/
		%feature("compactdefaultargs") Resolution3d;
		%feature("autodoc", ":param SU:
	:type SU: Geom_Surface
	:param Tol2d:
	:type Tol2d: float
	:rtype: float") Resolution3d;
		static Standard_Real Resolution3d (const opencascade::handle<Geom_Surface> & SU,const Standard_Real Tol2d);

		/****************** Resolution3d ******************/
		%feature("compactdefaultargs") Resolution3d;
		%feature("autodoc", ":param F:
	:type F: TopoDS_Face
	:param Tol2d:
	:type Tol2d: float
	:rtype: float") Resolution3d;
		static Standard_Real Resolution3d (const TopoDS_Face & F,const Standard_Real Tol2d);

		/****************** Resolution3dU ******************/
		%feature("compactdefaultargs") Resolution3dU;
		%feature("autodoc", ":param SU:
	:type SU: Geom_Surface
	:param Tol2d:
	:type Tol2d: float
	:rtype: float") Resolution3dU;
		static Standard_Real Resolution3dU (const opencascade::handle<Geom_Surface> & SU,const Standard_Real Tol2d);

		/****************** Resolution3dV ******************/
		%feature("compactdefaultargs") Resolution3dV;
		%feature("autodoc", ":param SU:
	:type SU: Geom_Surface
	:param Tol2d:
	:type Tol2d: float
	:rtype: float") Resolution3dV;
		static Standard_Real Resolution3dV (const opencascade::handle<Geom_Surface> & SU,const Standard_Real Tol2d);

		/****************** ShapesSameOriented ******************/
		%feature("compactdefaultargs") ShapesSameOriented;
		%feature("autodoc", ":param S1:
	:type S1: TopoDS_Shape
	:param S2:
	:type S2: TopoDS_Shape
	:rtype: bool") ShapesSameOriented;
		static Standard_Boolean ShapesSameOriented (const TopoDS_Shape & S1,const TopoDS_Shape & S2);

		/****************** SurfacesSameOriented ******************/
		%feature("compactdefaultargs") SurfacesSameOriented;
		%feature("autodoc", ":param S1:
	:type S1: BRepAdaptor_Surface
	:param S2:
	:type S2: BRepAdaptor_Surface
	:rtype: bool") SurfacesSameOriented;
		static Standard_Boolean SurfacesSameOriented (const BRepAdaptor_Surface & S1,const BRepAdaptor_Surface & S2);

		/****************** Tolerance ******************/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "* Returns the tolerance of the shape <S>. If the shape <S> is Null, returns 0.
	:param S:
	:type S: TopoDS_Shape
	:rtype: float") Tolerance;
		static Standard_Real Tolerance (const TopoDS_Shape & S);

		/****************** UVBOUNDS ******************/
		%feature("compactdefaultargs") UVBOUNDS;
		%feature("autodoc", ":param S:
	:type S: Geom_Surface
	:param UPeri:
	:type UPeri: bool
	:param VPeri:
	:type VPeri: bool
	:param Umin:
	:type Umin: float
	:param Umax:
	:type Umax: float
	:param Vmin:
	:type Vmin: float
	:param Vmax:
	:type Vmax: float
	:rtype: void") UVBOUNDS;
		static void UVBOUNDS (const opencascade::handle<Geom_Surface> & S,Standard_Boolean &OutValue,Standard_Boolean &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** UVBOUNDS ******************/
		%feature("compactdefaultargs") UVBOUNDS;
		%feature("autodoc", ":param F:
	:type F: TopoDS_Face
	:param UPeri:
	:type UPeri: bool
	:param VPeri:
	:type VPeri: bool
	:param Umin:
	:type Umin: float
	:param Umax:
	:type Umax: float
	:param Vmin:
	:type Vmin: float
	:param Vmax:
	:type Vmax: float
	:rtype: void") UVBOUNDS;
		static void UVBOUNDS (const TopoDS_Face & F,Standard_Boolean &OutValue,Standard_Boolean &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);

};


%extend TopOpeBRepTool_ShapeTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************
* class TopOpeBRepTool_SolidClassifier *
***************************************/
class TopOpeBRepTool_SolidClassifier {
	public:
		/****************** Classify ******************/
		%feature("compactdefaultargs") Classify;
		%feature("autodoc", "* compute the position of point <P> regarding with the geometric domain of the solid <S>.
	:param S:
	:type S: TopoDS_Solid
	:param P:
	:type P: gp_Pnt
	:param Tol:
	:type Tol: float
	:rtype: TopAbs_State") Classify;
		TopAbs_State Classify (const TopoDS_Solid & S,const gp_Pnt & P,const Standard_Real Tol);

		/****************** Classify ******************/
		%feature("compactdefaultargs") Classify;
		%feature("autodoc", "* compute the position of point <P> regarding with the geometric domain of the shell <S>.
	:param S:
	:type S: TopoDS_Shell
	:param P:
	:type P: gp_Pnt
	:param Tol:
	:type Tol: float
	:rtype: TopAbs_State") Classify;
		TopAbs_State Classify (const TopoDS_Shell & S,const gp_Pnt & P,const Standard_Real Tol);

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", ":rtype: None") Clear;
		void Clear ();

		/****************** LoadShell ******************/
		%feature("compactdefaultargs") LoadShell;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shell
	:rtype: None") LoadShell;
		void LoadShell (const TopoDS_Shell & S);

		/****************** LoadSolid ******************/
		%feature("compactdefaultargs") LoadSolid;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Solid
	:rtype: None") LoadSolid;
		void LoadSolid (const TopoDS_Solid & S);

		/****************** State ******************/
		%feature("compactdefaultargs") State;
		%feature("autodoc", ":rtype: TopAbs_State") State;
		TopAbs_State State ();

		/****************** TopOpeBRepTool_SolidClassifier ******************/
		%feature("compactdefaultargs") TopOpeBRepTool_SolidClassifier;
		%feature("autodoc", ":rtype: None") TopOpeBRepTool_SolidClassifier;
		 TopOpeBRepTool_SolidClassifier ();

};


%extend TopOpeBRepTool_SolidClassifier {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class TopOpeBRepTool_TOOL *
****************************/
class TopOpeBRepTool_TOOL {
	public:
		/****************** ClosedE ******************/
		%feature("compactdefaultargs") ClosedE;
		%feature("autodoc", ":param E:
	:type E: TopoDS_Edge
	:param vclo:
	:type vclo: TopoDS_Vertex
	:rtype: bool") ClosedE;
		static Standard_Boolean ClosedE (const TopoDS_Edge & E,TopoDS_Vertex & vclo);

		/****************** ClosedS ******************/
		%feature("compactdefaultargs") ClosedS;
		%feature("autodoc", ":param F:
	:type F: TopoDS_Face
	:rtype: bool") ClosedS;
		static Standard_Boolean ClosedS (const TopoDS_Face & F);

		/****************** CurvE ******************/
		%feature("compactdefaultargs") CurvE;
		%feature("autodoc", ":param E:
	:type E: TopoDS_Edge
	:param par:
	:type par: float
	:param tg0:
	:type tg0: gp_Dir
	:param Curv:
	:type Curv: float
	:rtype: bool") CurvE;
		static Standard_Boolean CurvE (const TopoDS_Edge & E,const Standard_Real par,const gp_Dir & tg0,Standard_Real &OutValue);

		/****************** CurvF ******************/
		%feature("compactdefaultargs") CurvF;
		%feature("autodoc", ":param F:
	:type F: TopoDS_Face
	:param uv:
	:type uv: gp_Pnt2d
	:param tg0:
	:type tg0: gp_Dir
	:param Curv:
	:type Curv: float
	:param direct:
	:type direct: bool
	:rtype: bool") CurvF;
		static Standard_Boolean CurvF (const TopoDS_Face & F,const gp_Pnt2d & uv,const gp_Dir & tg0,Standard_Real &OutValue,Standard_Boolean &OutValue);

		/****************** EdgeONFace ******************/
		%feature("compactdefaultargs") EdgeONFace;
		%feature("autodoc", ":param par:
	:type par: float
	:param ed:
	:type ed: TopoDS_Edge
	:param uv:
	:type uv: gp_Pnt2d
	:param fa:
	:type fa: TopoDS_Face
	:param isonfa:
	:type isonfa: bool
	:rtype: bool") EdgeONFace;
		static Standard_Boolean EdgeONFace (const Standard_Real par,const TopoDS_Edge & ed,const gp_Pnt2d & uv,const TopoDS_Face & fa,Standard_Boolean &OutValue);

		/****************** Getduv ******************/
		%feature("compactdefaultargs") Getduv;
		%feature("autodoc", ":param f:
	:type f: TopoDS_Face
	:param uv:
	:type uv: gp_Pnt2d
	:param dir:
	:type dir: gp_Vec
	:param factor:
	:type factor: float
	:param duv:
	:type duv: gp_Dir2d
	:rtype: bool") Getduv;
		static Standard_Boolean Getduv (const TopoDS_Face & f,const gp_Pnt2d & uv,const gp_Vec & dir,const Standard_Real factor,gp_Dir2d & duv);

		/****************** Getstp3dF ******************/
		%feature("compactdefaultargs") Getstp3dF;
		%feature("autodoc", ":param p:
	:type p: gp_Pnt
	:param f:
	:type f: TopoDS_Face
	:param uv:
	:type uv: gp_Pnt2d
	:param st:
	:type st: TopAbs_State
	:rtype: bool") Getstp3dF;
		static Standard_Boolean Getstp3dF (const gp_Pnt & p,const TopoDS_Face & f,gp_Pnt2d & uv,TopAbs_State & st);

		/****************** IsClosingE ******************/
		%feature("compactdefaultargs") IsClosingE;
		%feature("autodoc", ":param E:
	:type E: TopoDS_Edge
	:param F:
	:type F: TopoDS_Face
	:rtype: bool") IsClosingE;
		static Standard_Boolean IsClosingE (const TopoDS_Edge & E,const TopoDS_Face & F);

		/****************** IsClosingE ******************/
		%feature("compactdefaultargs") IsClosingE;
		%feature("autodoc", ":param E:
	:type E: TopoDS_Edge
	:param W:
	:type W: TopoDS_Shape
	:param F:
	:type F: TopoDS_Face
	:rtype: bool") IsClosingE;
		static Standard_Boolean IsClosingE (const TopoDS_Edge & E,const TopoDS_Shape & W,const TopoDS_Face & F);

		/****************** IsQuad ******************/
		%feature("compactdefaultargs") IsQuad;
		%feature("autodoc", ":param E:
	:type E: TopoDS_Edge
	:rtype: bool") IsQuad;
		static Standard_Boolean IsQuad (const TopoDS_Edge & E);

		/****************** IsQuad ******************/
		%feature("compactdefaultargs") IsQuad;
		%feature("autodoc", ":param F:
	:type F: TopoDS_Face
	:rtype: bool") IsQuad;
		static Standard_Boolean IsQuad (const TopoDS_Face & F);

		/****************** IsonCLO ******************/
		%feature("compactdefaultargs") IsonCLO;
		%feature("autodoc", ":param PC:
	:type PC: Geom2d_Curve
	:param onU:
	:type onU: bool
	:param xfirst:
	:type xfirst: float
	:param xperiod:
	:type xperiod: float
	:param xtol:
	:type xtol: float
	:rtype: bool") IsonCLO;
		static Standard_Boolean IsonCLO (const opencascade::handle<Geom2d_Curve> & PC,const Standard_Boolean onU,const Standard_Real xfirst,const Standard_Real xperiod,const Standard_Real xtol);

		/****************** IsonCLO ******************/
		%feature("compactdefaultargs") IsonCLO;
		%feature("autodoc", ":param C2DF:
	:type C2DF: TopOpeBRepTool_C2DF
	:param onU:
	:type onU: bool
	:param xfirst:
	:type xfirst: float
	:param xperiod:
	:type xperiod: float
	:param xtol:
	:type xtol: float
	:rtype: bool") IsonCLO;
		static Standard_Boolean IsonCLO (const TopOpeBRepTool_C2DF & C2DF,const Standard_Boolean onU,const Standard_Real xfirst,const Standard_Real xperiod,const Standard_Real xtol);

		/****************** Matter ******************/
		%feature("compactdefaultargs") Matter;
		%feature("autodoc", ":param d1:
	:type d1: gp_Vec
	:param d2:
	:type d2: gp_Vec
	:param ref:
	:type ref: gp_Vec
	:rtype: float") Matter;
		static Standard_Real Matter (const gp_Vec & d1,const gp_Vec & d2,const gp_Vec & ref);

		/****************** Matter ******************/
		%feature("compactdefaultargs") Matter;
		%feature("autodoc", ":param d1:
	:type d1: gp_Vec2d
	:param d2:
	:type d2: gp_Vec2d
	:rtype: float") Matter;
		static Standard_Real Matter (const gp_Vec2d & d1,const gp_Vec2d & d2);

		/****************** Matter ******************/
		%feature("compactdefaultargs") Matter;
		%feature("autodoc", ":param xx1:
	:type xx1: gp_Dir
	:param nt1:
	:type nt1: gp_Dir
	:param xx2:
	:type xx2: gp_Dir
	:param nt2:
	:type nt2: gp_Dir
	:param tola:
	:type tola: float
	:param Ang:
	:type Ang: float
	:rtype: bool") Matter;
		static Standard_Boolean Matter (const gp_Dir & xx1,const gp_Dir & nt1,const gp_Dir & xx2,const gp_Dir & nt2,const Standard_Real tola,Standard_Real &OutValue);

		/****************** Matter ******************/
		%feature("compactdefaultargs") Matter;
		%feature("autodoc", ":param f1:
	:type f1: TopoDS_Face
	:param f2:
	:type f2: TopoDS_Face
	:param e:
	:type e: TopoDS_Edge
	:param pare:
	:type pare: float
	:param tola:
	:type tola: float
	:param Ang:
	:type Ang: float
	:rtype: bool") Matter;
		static Standard_Boolean Matter (const TopoDS_Face & f1,const TopoDS_Face & f2,const TopoDS_Edge & e,const Standard_Real pare,const Standard_Real tola,Standard_Real &OutValue);

		/****************** MatterKPtg ******************/
		%feature("compactdefaultargs") MatterKPtg;
		%feature("autodoc", ":param f1:
	:type f1: TopoDS_Face
	:param f2:
	:type f2: TopoDS_Face
	:param e:
	:type e: TopoDS_Edge
	:param Ang:
	:type Ang: float
	:rtype: bool") MatterKPtg;
		static Standard_Boolean MatterKPtg (const TopoDS_Face & f1,const TopoDS_Face & f2,const TopoDS_Edge & e,Standard_Real &OutValue);

		/****************** MkShell ******************/
		%feature("compactdefaultargs") MkShell;
		%feature("autodoc", ":param lF:
	:type lF: TopTools_ListOfShape
	:param She:
	:type She: TopoDS_Shape
	:rtype: void") MkShell;
		static void MkShell (const TopTools_ListOfShape & lF,TopoDS_Shape & She);

		/****************** NgApp ******************/
		%feature("compactdefaultargs") NgApp;
		%feature("autodoc", ":param par:
	:type par: float
	:param E:
	:type E: TopoDS_Edge
	:param F:
	:type F: TopoDS_Face
	:param tola:
	:type tola: float
	:param ngApp:
	:type ngApp: gp_Dir
	:rtype: bool") NgApp;
		static Standard_Boolean NgApp (const Standard_Real par,const TopoDS_Edge & E,const TopoDS_Face & F,const Standard_Real tola,gp_Dir & ngApp);

		/****************** NggeomF ******************/
		%feature("compactdefaultargs") NggeomF;
		%feature("autodoc", ":param uv:
	:type uv: gp_Pnt2d
	:param F:
	:type F: TopoDS_Face
	:param ng:
	:type ng: gp_Vec
	:rtype: bool") NggeomF;
		static Standard_Boolean NggeomF (const gp_Pnt2d & uv,const TopoDS_Face & F,gp_Vec & ng);

		/****************** Nt ******************/
		%feature("compactdefaultargs") Nt;
		%feature("autodoc", ":param uv:
	:type uv: gp_Pnt2d
	:param f:
	:type f: TopoDS_Face
	:param normt:
	:type normt: gp_Dir
	:rtype: bool") Nt;
		static Standard_Boolean Nt (const gp_Pnt2d & uv,const TopoDS_Face & f,gp_Dir & normt);

		/****************** OnBoundary ******************/
		%feature("compactdefaultargs") OnBoundary;
		%feature("autodoc", ":param par:
	:type par: float
	:param E:
	:type E: TopoDS_Edge
	:rtype: int") OnBoundary;
		static Standard_Integer OnBoundary (const Standard_Real par,const TopoDS_Edge & E);

		/****************** OriinSor ******************/
		%feature("compactdefaultargs") OriinSor;
		%feature("autodoc", ":param sub:
	:type sub: TopoDS_Shape
	:param S:
	:type S: TopoDS_Shape
	:param checkclo: default value is Standard_False
	:type checkclo: bool
	:rtype: int") OriinSor;
		static Standard_Integer OriinSor (const TopoDS_Shape & sub,const TopoDS_Shape & S,const Standard_Boolean checkclo = Standard_False);

		/****************** OriinSorclosed ******************/
		%feature("compactdefaultargs") OriinSorclosed;
		%feature("autodoc", ":param sub:
	:type sub: TopoDS_Shape
	:param S:
	:type S: TopoDS_Shape
	:rtype: int") OriinSorclosed;
		static Standard_Integer OriinSorclosed (const TopoDS_Shape & sub,const TopoDS_Shape & S);

		/****************** ParE ******************/
		%feature("compactdefaultargs") ParE;
		%feature("autodoc", ":param Iv:
	:type Iv: int
	:param E:
	:type E: TopoDS_Edge
	:rtype: float") ParE;
		static Standard_Real ParE (const Standard_Integer Iv,const TopoDS_Edge & E);

		/****************** ParE2d ******************/
		%feature("compactdefaultargs") ParE2d;
		%feature("autodoc", ":param p2d:
	:type p2d: gp_Pnt2d
	:param e:
	:type e: TopoDS_Edge
	:param f:
	:type f: TopoDS_Face
	:param par:
	:type par: float
	:param dist:
	:type dist: float
	:rtype: bool") ParE2d;
		static Standard_Boolean ParE2d (const gp_Pnt2d & p2d,const TopoDS_Edge & e,const TopoDS_Face & f,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** ParISO ******************/
		%feature("compactdefaultargs") ParISO;
		%feature("autodoc", ":param p2d:
	:type p2d: gp_Pnt2d
	:param e:
	:type e: TopoDS_Edge
	:param f:
	:type f: TopoDS_Face
	:param pare:
	:type pare: float
	:rtype: bool") ParISO;
		static Standard_Boolean ParISO (const gp_Pnt2d & p2d,const TopoDS_Edge & e,const TopoDS_Face & f,Standard_Real &OutValue);

		/****************** Remove ******************/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", ":param loS:
	:type loS: TopTools_ListOfShape
	:param toremove:
	:type toremove: TopoDS_Shape
	:rtype: bool") Remove;
		static Standard_Boolean Remove (TopTools_ListOfShape & loS,const TopoDS_Shape & toremove);

		/****************** SplitE ******************/
		%feature("compactdefaultargs") SplitE;
		%feature("autodoc", ":param Eanc:
	:type Eanc: TopoDS_Edge
	:param Splits:
	:type Splits: TopTools_ListOfShape
	:rtype: bool") SplitE;
		static Standard_Boolean SplitE (const TopoDS_Edge & Eanc,TopTools_ListOfShape & Splits);

		/****************** Tg2d ******************/
		%feature("compactdefaultargs") Tg2d;
		%feature("autodoc", ":param iv:
	:type iv: int
	:param E:
	:type E: TopoDS_Edge
	:param C2DF:
	:type C2DF: TopOpeBRepTool_C2DF
	:rtype: gp_Vec2d") Tg2d;
		static gp_Vec2d Tg2d (const Standard_Integer iv,const TopoDS_Edge & E,const TopOpeBRepTool_C2DF & C2DF);

		/****************** Tg2dApp ******************/
		%feature("compactdefaultargs") Tg2dApp;
		%feature("autodoc", ":param iv:
	:type iv: int
	:param E:
	:type E: TopoDS_Edge
	:param C2DF:
	:type C2DF: TopOpeBRepTool_C2DF
	:param factor:
	:type factor: float
	:rtype: gp_Vec2d") Tg2dApp;
		static gp_Vec2d Tg2dApp (const Standard_Integer iv,const TopoDS_Edge & E,const TopOpeBRepTool_C2DF & C2DF,const Standard_Real factor);

		/****************** TgINSIDE ******************/
		%feature("compactdefaultargs") TgINSIDE;
		%feature("autodoc", ":param v:
	:type v: TopoDS_Vertex
	:param E:
	:type E: TopoDS_Edge
	:param Tg:
	:type Tg: gp_Vec
	:param OvinE:
	:type OvinE: int
	:rtype: bool") TgINSIDE;
		static Standard_Boolean TgINSIDE (const TopoDS_Vertex & v,const TopoDS_Edge & E,gp_Vec & Tg,Standard_Integer &OutValue);

		/****************** TggeomE ******************/
		%feature("compactdefaultargs") TggeomE;
		%feature("autodoc", ":param par:
	:type par: float
	:param BC:
	:type BC: BRepAdaptor_Curve
	:param Tg:
	:type Tg: gp_Vec
	:rtype: bool") TggeomE;
		static Standard_Boolean TggeomE (const Standard_Real par,const BRepAdaptor_Curve & BC,gp_Vec & Tg);

		/****************** TggeomE ******************/
		%feature("compactdefaultargs") TggeomE;
		%feature("autodoc", ":param par:
	:type par: float
	:param E:
	:type E: TopoDS_Edge
	:param Tg:
	:type Tg: gp_Vec
	:rtype: bool") TggeomE;
		static Standard_Boolean TggeomE (const Standard_Real par,const TopoDS_Edge & E,gp_Vec & Tg);

		/****************** TolP ******************/
		%feature("compactdefaultargs") TolP;
		%feature("autodoc", ":param E:
	:type E: TopoDS_Edge
	:param F:
	:type F: TopoDS_Face
	:rtype: float") TolP;
		static Standard_Real TolP (const TopoDS_Edge & E,const TopoDS_Face & F);

		/****************** TolUV ******************/
		%feature("compactdefaultargs") TolUV;
		%feature("autodoc", ":param F:
	:type F: TopoDS_Face
	:param tol3d:
	:type tol3d: float
	:rtype: float") TolUV;
		static Standard_Real TolUV (const TopoDS_Face & F,const Standard_Real tol3d);

		/****************** TrslUV ******************/
		%feature("compactdefaultargs") TrslUV;
		%feature("autodoc", ":param t2d:
	:type t2d: gp_Vec2d
	:param C2DF:
	:type C2DF: TopOpeBRepTool_C2DF
	:rtype: void") TrslUV;
		static void TrslUV (const gp_Vec2d & t2d,TopOpeBRepTool_C2DF & C2DF);

		/****************** TrslUVModifE ******************/
		%feature("compactdefaultargs") TrslUVModifE;
		%feature("autodoc", ":param t2d:
	:type t2d: gp_Vec2d
	:param F:
	:type F: TopoDS_Face
	:param E:
	:type E: TopoDS_Edge
	:rtype: bool") TrslUVModifE;
		static Standard_Boolean TrslUVModifE (const gp_Vec2d & t2d,const TopoDS_Face & F,TopoDS_Edge & E);

		/****************** UVF ******************/
		%feature("compactdefaultargs") UVF;
		%feature("autodoc", ":param par:
	:type par: float
	:param C2DF:
	:type C2DF: TopOpeBRepTool_C2DF
	:rtype: gp_Pnt2d") UVF;
		static gp_Pnt2d UVF (const Standard_Real par,const TopOpeBRepTool_C2DF & C2DF);

		/****************** UVISO ******************/
		%feature("compactdefaultargs") UVISO;
		%feature("autodoc", ":param PC:
	:type PC: Geom2d_Curve
	:param isou:
	:type isou: bool
	:param isov:
	:type isov: bool
	:param d2d:
	:type d2d: gp_Dir2d
	:param o2d:
	:type o2d: gp_Pnt2d
	:rtype: bool") UVISO;
		static Standard_Boolean UVISO (const opencascade::handle<Geom2d_Curve> & PC,Standard_Boolean &OutValue,Standard_Boolean &OutValue,gp_Dir2d & d2d,gp_Pnt2d & o2d);

		/****************** UVISO ******************/
		%feature("compactdefaultargs") UVISO;
		%feature("autodoc", ":param C2DF:
	:type C2DF: TopOpeBRepTool_C2DF
	:param isou:
	:type isou: bool
	:param isov:
	:type isov: bool
	:param d2d:
	:type d2d: gp_Dir2d
	:param o2d:
	:type o2d: gp_Pnt2d
	:rtype: bool") UVISO;
		static Standard_Boolean UVISO (const TopOpeBRepTool_C2DF & C2DF,Standard_Boolean &OutValue,Standard_Boolean &OutValue,gp_Dir2d & d2d,gp_Pnt2d & o2d);

		/****************** UVISO ******************/
		%feature("compactdefaultargs") UVISO;
		%feature("autodoc", ":param E:
	:type E: TopoDS_Edge
	:param F:
	:type F: TopoDS_Face
	:param isou:
	:type isou: bool
	:param isov:
	:type isov: bool
	:param d2d:
	:type d2d: gp_Dir2d
	:param o2d:
	:type o2d: gp_Pnt2d
	:rtype: bool") UVISO;
		static Standard_Boolean UVISO (const TopoDS_Edge & E,const TopoDS_Face & F,Standard_Boolean &OutValue,Standard_Boolean &OutValue,gp_Dir2d & d2d,gp_Pnt2d & o2d);

		/****************** Vertex ******************/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", ":param Iv:
	:type Iv: int
	:param E:
	:type E: TopoDS_Edge
	:rtype: TopoDS_Vertex") Vertex;
		static TopoDS_Vertex Vertex (const Standard_Integer Iv,const TopoDS_Edge & E);

		/****************** Vertices ******************/
		%feature("compactdefaultargs") Vertices;
		%feature("autodoc", ":param E:
	:type E: TopoDS_Edge
	:param Vces:
	:type Vces: TopTools_Array1OfShape
	:rtype: void") Vertices;
		static void Vertices (const TopoDS_Edge & E,TopTools_Array1OfShape & Vces);

		/****************** WireToFace ******************/
		%feature("compactdefaultargs") WireToFace;
		%feature("autodoc", ":param Fref:
	:type Fref: TopoDS_Face
	:param mapWlow:
	:type mapWlow: TopTools_DataMapOfShapeListOfShape
	:param lFs:
	:type lFs: TopTools_ListOfShape
	:rtype: bool") WireToFace;
		static Standard_Boolean WireToFace (const TopoDS_Face & Fref,const TopTools_DataMapOfShapeListOfShape & mapWlow,TopTools_ListOfShape & lFs);

		/****************** XX ******************/
		%feature("compactdefaultargs") XX;
		%feature("autodoc", ":param uv:
	:type uv: gp_Pnt2d
	:param f:
	:type f: TopoDS_Face
	:param par:
	:type par: float
	:param e:
	:type e: TopoDS_Edge
	:param xx:
	:type xx: gp_Dir
	:rtype: bool") XX;
		static Standard_Boolean XX (const gp_Pnt2d & uv,const TopoDS_Face & f,const Standard_Real par,const TopoDS_Edge & e,gp_Dir & xx);

		/****************** minDUV ******************/
		%feature("compactdefaultargs") minDUV;
		%feature("autodoc", ":param F:
	:type F: TopoDS_Face
	:rtype: float") minDUV;
		static Standard_Real minDUV (const TopoDS_Face & F);

		/****************** outUVbounds ******************/
		%feature("compactdefaultargs") outUVbounds;
		%feature("autodoc", ":param uv:
	:type uv: gp_Pnt2d
	:param F:
	:type F: TopoDS_Face
	:rtype: bool") outUVbounds;
		static Standard_Boolean outUVbounds (const gp_Pnt2d & uv,const TopoDS_Face & F);

		/****************** stuvF ******************/
		%feature("compactdefaultargs") stuvF;
		%feature("autodoc", ":param uv:
	:type uv: gp_Pnt2d
	:param F:
	:type F: TopoDS_Face
	:param onU:
	:type onU: int
	:param onV:
	:type onV: int
	:rtype: void") stuvF;
		static void stuvF (const gp_Pnt2d & uv,const TopoDS_Face & F,Standard_Integer &OutValue,Standard_Integer &OutValue);

		/****************** tryNgApp ******************/
		%feature("compactdefaultargs") tryNgApp;
		%feature("autodoc", ":param par:
	:type par: float
	:param E:
	:type E: TopoDS_Edge
	:param F:
	:type F: TopoDS_Face
	:param tola:
	:type tola: float
	:param ng:
	:type ng: gp_Dir
	:rtype: bool") tryNgApp;
		static Standard_Boolean tryNgApp (const Standard_Real par,const TopoDS_Edge & E,const TopoDS_Face & F,const Standard_Real tola,gp_Dir & ng);

		/****************** tryOriEinF ******************/
		%feature("compactdefaultargs") tryOriEinF;
		%feature("autodoc", ":param par:
	:type par: float
	:param E:
	:type E: TopoDS_Edge
	:param F:
	:type F: TopoDS_Face
	:rtype: int") tryOriEinF;
		static Standard_Integer tryOriEinF (const Standard_Real par,const TopoDS_Edge & E,const TopoDS_Face & F);

		/****************** tryTg2dApp ******************/
		%feature("compactdefaultargs") tryTg2dApp;
		%feature("autodoc", ":param iv:
	:type iv: int
	:param E:
	:type E: TopoDS_Edge
	:param C2DF:
	:type C2DF: TopOpeBRepTool_C2DF
	:param factor:
	:type factor: float
	:rtype: gp_Vec2d") tryTg2dApp;
		static gp_Vec2d tryTg2dApp (const Standard_Integer iv,const TopoDS_Edge & E,const TopOpeBRepTool_C2DF & C2DF,const Standard_Real factor);

		/****************** uvApp ******************/
		%feature("compactdefaultargs") uvApp;
		%feature("autodoc", ":param f:
	:type f: TopoDS_Face
	:param e:
	:type e: TopoDS_Edge
	:param par:
	:type par: float
	:param eps:
	:type eps: float
	:param uvapp:
	:type uvapp: gp_Pnt2d
	:rtype: bool") uvApp;
		static Standard_Boolean uvApp (const TopoDS_Face & f,const TopoDS_Edge & e,const Standard_Real par,const Standard_Real eps,gp_Pnt2d & uvapp);

};


%extend TopOpeBRepTool_TOOL {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class TopOpeBRepTool_connexity *
*********************************/
class TopOpeBRepTool_connexity {
	public:
		/****************** AddItem ******************/
		%feature("compactdefaultargs") AddItem;
		%feature("autodoc", ":param OriKey:
	:type OriKey: int
	:param Item:
	:type Item: TopTools_ListOfShape
	:rtype: None") AddItem;
		void AddItem (const Standard_Integer OriKey,const TopTools_ListOfShape & Item);

		/****************** AddItem ******************/
		%feature("compactdefaultargs") AddItem;
		%feature("autodoc", ":param OriKey:
	:type OriKey: int
	:param Item:
	:type Item: TopoDS_Shape
	:rtype: None") AddItem;
		void AddItem (const Standard_Integer OriKey,const TopoDS_Shape & Item);

		/****************** AllItems ******************/
		%feature("compactdefaultargs") AllItems;
		%feature("autodoc", ":param Item:
	:type Item: TopTools_ListOfShape
	:rtype: int") AllItems;
		Standard_Integer AllItems (TopTools_ListOfShape & Item);

		/****************** ChangeItem ******************/
		%feature("compactdefaultargs") ChangeItem;
		%feature("autodoc", ":param OriKey:
	:type OriKey: int
	:rtype: TopTools_ListOfShape") ChangeItem;
		TopTools_ListOfShape & ChangeItem (const Standard_Integer OriKey);

		/****************** IsFaulty ******************/
		%feature("compactdefaultargs") IsFaulty;
		%feature("autodoc", ":rtype: bool") IsFaulty;
		Standard_Boolean IsFaulty ();

		/****************** IsInternal ******************/
		%feature("compactdefaultargs") IsInternal;
		%feature("autodoc", ":param Item:
	:type Item: TopTools_ListOfShape
	:rtype: int") IsInternal;
		Standard_Integer IsInternal (TopTools_ListOfShape & Item);

		/****************** IsMultiple ******************/
		%feature("compactdefaultargs") IsMultiple;
		%feature("autodoc", ":rtype: bool") IsMultiple;
		Standard_Boolean IsMultiple ();

		/****************** Item ******************/
		%feature("compactdefaultargs") Item;
		%feature("autodoc", ":param OriKey:
	:type OriKey: int
	:param Item:
	:type Item: TopTools_ListOfShape
	:rtype: int") Item;
		Standard_Integer Item (const Standard_Integer OriKey,TopTools_ListOfShape & Item);

		/****************** Key ******************/
		%feature("compactdefaultargs") Key;
		%feature("autodoc", ":rtype: TopoDS_Shape") Key;
		const TopoDS_Shape  Key ();

		/****************** RemoveItem ******************/
		%feature("compactdefaultargs") RemoveItem;
		%feature("autodoc", ":param OriKey:
	:type OriKey: int
	:param Item:
	:type Item: TopoDS_Shape
	:rtype: bool") RemoveItem;
		Standard_Boolean RemoveItem (const Standard_Integer OriKey,const TopoDS_Shape & Item);

		/****************** RemoveItem ******************/
		%feature("compactdefaultargs") RemoveItem;
		%feature("autodoc", ":param Item:
	:type Item: TopoDS_Shape
	:rtype: bool") RemoveItem;
		Standard_Boolean RemoveItem (const TopoDS_Shape & Item);

		/****************** SetKey ******************/
		%feature("compactdefaultargs") SetKey;
		%feature("autodoc", ":param Key:
	:type Key: TopoDS_Shape
	:rtype: None") SetKey;
		void SetKey (const TopoDS_Shape & Key);

		/****************** TopOpeBRepTool_connexity ******************/
		%feature("compactdefaultargs") TopOpeBRepTool_connexity;
		%feature("autodoc", ":rtype: None") TopOpeBRepTool_connexity;
		 TopOpeBRepTool_connexity ();

		/****************** TopOpeBRepTool_connexity ******************/
		%feature("compactdefaultargs") TopOpeBRepTool_connexity;
		%feature("autodoc", ":param Key:
	:type Key: TopoDS_Shape
	:rtype: None") TopOpeBRepTool_connexity;
		 TopOpeBRepTool_connexity (const TopoDS_Shape & Key);

};


%extend TopOpeBRepTool_connexity {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class TopOpeBRepTool_face *
****************************/
class TopOpeBRepTool_face {
	public:
		/****************** Ffinite ******************/
		%feature("compactdefaultargs") Ffinite;
		%feature("autodoc", ":rtype: TopoDS_Face") Ffinite;
		const TopoDS_Face  Ffinite ();

		/****************** Finite ******************/
		%feature("compactdefaultargs") Finite;
		%feature("autodoc", ":rtype: bool") Finite;
		Standard_Boolean Finite ();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", ":param W:
	:type W: TopoDS_Wire
	:param Fref:
	:type Fref: TopoDS_Face
	:rtype: bool") Init;
		Standard_Boolean Init (const TopoDS_Wire & W,const TopoDS_Face & Fref);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", ":rtype: bool") IsDone;
		Standard_Boolean IsDone ();

		/****************** RealF ******************/
		%feature("compactdefaultargs") RealF;
		%feature("autodoc", ":rtype: TopoDS_Face") RealF;
		TopoDS_Face RealF ();

		/****************** TopOpeBRepTool_face ******************/
		%feature("compactdefaultargs") TopOpeBRepTool_face;
		%feature("autodoc", ":rtype: None") TopOpeBRepTool_face;
		 TopOpeBRepTool_face ();

		/****************** W ******************/
		%feature("compactdefaultargs") W;
		%feature("autodoc", ":rtype: TopoDS_Wire") W;
		const TopoDS_Wire  W ();

};


%extend TopOpeBRepTool_face {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class TopOpeBRepTool_makeTransition *
**************************************/
class TopOpeBRepTool_makeTransition {
	public:
		/****************** Getfactor ******************/
		%feature("compactdefaultargs") Getfactor;
		%feature("autodoc", ":rtype: float") Getfactor;
		Standard_Real Getfactor ();

		/****************** HasRest ******************/
		%feature("compactdefaultargs") HasRest;
		%feature("autodoc", ":rtype: bool") HasRest;
		Standard_Boolean HasRest ();

		/****************** Initialize ******************/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", ":param E:
	:type E: TopoDS_Edge
	:param pbef:
	:type pbef: float
	:param paft:
	:type paft: float
	:param parE:
	:type parE: float
	:param FS:
	:type FS: TopoDS_Face
	:param uv:
	:type uv: gp_Pnt2d
	:param factor:
	:type factor: float
	:rtype: bool") Initialize;
		Standard_Boolean Initialize (const TopoDS_Edge & E,const Standard_Real pbef,const Standard_Real paft,const Standard_Real parE,const TopoDS_Face & FS,const gp_Pnt2d & uv,const Standard_Real factor);

		/****************** IsT2d ******************/
		%feature("compactdefaultargs") IsT2d;
		%feature("autodoc", ":rtype: bool") IsT2d;
		Standard_Boolean IsT2d ();

		/****************** MkT2donE ******************/
		%feature("compactdefaultargs") MkT2donE;
		%feature("autodoc", ":param stb:
	:type stb: TopAbs_State
	:param sta:
	:type sta: TopAbs_State
	:rtype: bool") MkT2donE;
		Standard_Boolean MkT2donE (TopAbs_State & stb,TopAbs_State & sta);

		/****************** MkT3dproj ******************/
		%feature("compactdefaultargs") MkT3dproj;
		%feature("autodoc", ":param stb:
	:type stb: TopAbs_State
	:param sta:
	:type sta: TopAbs_State
	:rtype: bool") MkT3dproj;
		Standard_Boolean MkT3dproj (TopAbs_State & stb,TopAbs_State & sta);

		/****************** MkT3onE ******************/
		%feature("compactdefaultargs") MkT3onE;
		%feature("autodoc", ":param stb:
	:type stb: TopAbs_State
	:param sta:
	:type sta: TopAbs_State
	:rtype: bool") MkT3onE;
		Standard_Boolean MkT3onE (TopAbs_State & stb,TopAbs_State & sta);

		/****************** MkTonE ******************/
		%feature("compactdefaultargs") MkTonE;
		%feature("autodoc", ":param stb:
	:type stb: TopAbs_State
	:param sta:
	:type sta: TopAbs_State
	:rtype: bool") MkTonE;
		Standard_Boolean MkTonE (TopAbs_State & stb,TopAbs_State & sta);

		/****************** SetRest ******************/
		%feature("compactdefaultargs") SetRest;
		%feature("autodoc", ":param ES:
	:type ES: TopoDS_Edge
	:param parES:
	:type parES: float
	:rtype: bool") SetRest;
		Standard_Boolean SetRest (const TopoDS_Edge & ES,const Standard_Real parES);

		/****************** Setfactor ******************/
		%feature("compactdefaultargs") Setfactor;
		%feature("autodoc", ":param factor:
	:type factor: float
	:rtype: None") Setfactor;
		void Setfactor (const Standard_Real factor);

		/****************** TopOpeBRepTool_makeTransition ******************/
		%feature("compactdefaultargs") TopOpeBRepTool_makeTransition;
		%feature("autodoc", ":rtype: None") TopOpeBRepTool_makeTransition;
		 TopOpeBRepTool_makeTransition ();

};


%extend TopOpeBRepTool_makeTransition {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class TopOpeBRepTool_mkTondgE *
********************************/
/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
