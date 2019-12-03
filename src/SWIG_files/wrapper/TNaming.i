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
%define TNAMINGDOCSTRING
"TNaming module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_tnaming.html"
%enddef
%module (package="OCC.Core", docstring=TNAMINGDOCSTRING) TNaming


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
#include<TNaming_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TDF_module.hxx>
#include<TopTools_module.hxx>
#include<TopLoc_module.hxx>
#include<TopoDS_module.hxx>
#include<gp_module.hxx>
#include<TColStd_module.hxx>
#include<TopAbs_module.hxx>
#include<TCollection_module.hxx>
#include<Message_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import TDF.i
%import TopTools.i
%import TopLoc.i
%import TopoDS.i
%import gp.i
%import TColStd.i
%import TopAbs.i
/* public enums */
enum TNaming_Evolution {
	TNaming_PRIMITIVE = 0,
	TNaming_GENERATED = 1,
	TNaming_MODIFY = 2,
	TNaming_DELETE = 3,
	TNaming_REPLACE = 4,
	TNaming_SELECTED = 5,
};

enum TNaming_NameType {
	TNaming_UNKNOWN = 0,
	TNaming_IDENTITY = 1,
	TNaming_MODIFUNTIL = 2,
	TNaming_GENERATION = 3,
	TNaming_INTERSECTION = 4,
	TNaming_UNION = 5,
	TNaming_SUBSTRACTION = 6,
	TNaming_CONSTSHAPE = 7,
	TNaming_FILTERBYNEIGHBOURGS = 8,
	TNaming_ORIENTATION = 9,
	TNaming_WIREIN = 10,
	TNaming_SHELLIN = 11,
};

/* end public enums declaration */

/* handles */
%wrap_handle(TNaming_DeltaOnModification)
%wrap_handle(TNaming_DeltaOnRemoval)
%wrap_handle(TNaming_NamedShape)
%wrap_handle(TNaming_Naming)
%wrap_handle(TNaming_TranslateTool)
%wrap_handle(TNaming_UsedShapes)
/* end handles declaration */

/* templates */
%template(TNaming_DataMapOfShapePtrRefShape) NCollection_DataMap <TopoDS_Shape , TNaming_PtrRefShape , TopTools_ShapeMapHasher>;
%template(TNaming_ListOfIndexedDataMapOfShapeListOfShape) NCollection_List <TopTools_IndexedDataMapOfShapeListOfShape>;
%template(TNaming_ListIteratorOfListOfIndexedDataMapOfShapeListOfShape) NCollection_TListIterator<TopTools_IndexedDataMapOfShapeListOfShape>;
%template(TNaming_NamedShapeHasher) NCollection_DefaultHasher <opencascade::handle <TNaming_NamedShape>>;
%template(TNaming_MapOfShape) NCollection_Map <TopoDS_Shape>;
%template(TNaming_DataMapOfShapeMapOfShape) NCollection_DataMap <TopoDS_Shape , TNaming_MapOfShape>;
%template(TNaming_MapOfNamedShape) NCollection_Map <opencascade::handle <TNaming_NamedShape>, TNaming_NamedShapeHasher>;
%template(TNaming_ListOfNamedShape) NCollection_List <opencascade::handle <TNaming_NamedShape>>;
%template(TNaming_ListIteratorOfListOfNamedShape) NCollection_TListIterator<opencascade::handle<TNaming_NamedShape>>;
%template(TNaming_DataMapOfShapeShapesSet) NCollection_DataMap <TopoDS_Shape , TNaming_ShapesSet , TopTools_ShapeMapHasher>;
%template(TNaming_ListOfMapOfShape) NCollection_List <TopTools_MapOfShape>;
%template(TNaming_ListIteratorOfListOfMapOfShape) NCollection_TListIterator<TopTools_MapOfShape>;
/* end templates declaration */

/* typedefs */
typedef NCollection_DataMap <TopoDS_Shape , TNaming_PtrRefShape , TopTools_ShapeMapHasher> TNaming_DataMapOfShapePtrRefShape;
typedef NCollection_DataMap <TopoDS_Shape , TNaming_PtrRefShape , TopTools_ShapeMapHasher>::Iterator TNaming_DataMapIteratorOfDataMapOfShapePtrRefShape;
typedef NCollection_List <TopTools_IndexedDataMapOfShapeListOfShape> TNaming_ListOfIndexedDataMapOfShapeListOfShape;
typedef NCollection_List <TopTools_IndexedDataMapOfShapeListOfShape>::Iterator TNaming_ListIteratorOfListOfIndexedDataMapOfShapeListOfShape;
typedef TNaming_NamedShape * TNaming_PtrAttribute;
typedef NCollection_DefaultHasher <opencascade::handle <TNaming_NamedShape>> TNaming_NamedShapeHasher;
typedef NCollection_Map <TopoDS_Shape> TNaming_MapOfShape;
typedef TNaming_MapOfShape::Iterator TNaming_MapIteratorOfMapOfShape;
typedef NCollection_DataMap <TopoDS_Shape , TNaming_MapOfShape> TNaming_DataMapOfShapeMapOfShape;
typedef TNaming_DataMapOfShapeMapOfShape::Iterator TNaming_DataMapIteratorOfDataMapOfShapeMapOfShape;
typedef TNaming_RefShape * TNaming_PtrRefShape;
typedef NCollection_Map <opencascade::handle <TNaming_NamedShape>, TNaming_NamedShapeHasher> TNaming_MapOfNamedShape;
typedef NCollection_Map <opencascade::handle <TNaming_NamedShape>, TNaming_NamedShapeHasher>::Iterator TNaming_MapIteratorOfMapOfNamedShape;
typedef NCollection_List <opencascade::handle <TNaming_NamedShape>> TNaming_ListOfNamedShape;
typedef NCollection_List <opencascade::handle <TNaming_NamedShape>>::Iterator TNaming_ListIteratorOfListOfNamedShape;
typedef NCollection_DataMap <TopoDS_Shape , TNaming_ShapesSet , TopTools_ShapeMapHasher> TNaming_DataMapOfShapeShapesSet;
typedef NCollection_DataMap <TopoDS_Shape , TNaming_ShapesSet , TopTools_ShapeMapHasher>::Iterator TNaming_DataMapIteratorOfDataMapOfShapeShapesSet;
typedef NCollection_List <TopTools_MapOfShape> TNaming_ListOfMapOfShape;
typedef NCollection_List <TopTools_MapOfShape>::Iterator TNaming_ListIteratorOfListOfMapOfShape;
typedef TNaming_Node * TNaming_PtrNode;
/* end typedefs declaration */

/****************
* class TNaming *
****************/
%rename(tnaming) TNaming;
class TNaming {
	public:
		/****************** ChangeShapes ******************/
		%feature("compactdefaultargs") ChangeShapes;
		%feature("autodoc", "* Remplace les shapes du label et des sous-labels par des copies.
	:param label:
	:type label: TDF_Label
	:param M:
	:type M: TopTools_DataMapOfShapeShape
	:rtype: void") ChangeShapes;
		static void ChangeShapes (const TDF_Label & label,TopTools_DataMapOfShapeShape & M);

		/****************** Displace ******************/
		%feature("compactdefaultargs") Displace;
		%feature("autodoc", "* Application de la Location sur les shapes du label et de ses sous labels.
	:param label:
	:type label: TDF_Label
	:param aLocation:
	:type aLocation: TopLoc_Location
	:param WithOld: default value is Standard_True
	:type WithOld: bool
	:rtype: void") Displace;
		static void Displace (const TDF_Label & label,const TopLoc_Location & aLocation,const Standard_Boolean WithOld = Standard_True);

		/****************** FindUniqueContext ******************/
		%feature("compactdefaultargs") FindUniqueContext;
		%feature("autodoc", "* Find unique context of shape <S>
	:param S:
	:type S: TopoDS_Shape
	:param Context:
	:type Context: TopoDS_Shape
	:rtype: TopoDS_Shape") FindUniqueContext;
		static TopoDS_Shape FindUniqueContext (const TopoDS_Shape & S,const TopoDS_Shape & Context);

		/****************** FindUniqueContextSet ******************/
		%feature("compactdefaultargs") FindUniqueContextSet;
		%feature("autodoc", "* Find unique context of shape <S>,which is pure concatenation of atomic shapes (Compound). The result is concatenation of single contexts
	:param S:
	:type S: TopoDS_Shape
	:param Context:
	:type Context: TopoDS_Shape
	:param Arr:
	:type Arr: TopTools_HArray1OfShape
	:rtype: TopoDS_Shape") FindUniqueContextSet;
		static TopoDS_Shape FindUniqueContextSet (const TopoDS_Shape & S,const TopoDS_Shape & Context,opencascade::handle<TopTools_HArray1OfShape> & Arr);

		/****************** IDList ******************/
		%feature("compactdefaultargs") IDList;
		%feature("autodoc", "* Appends to <anIDList> the list of the attributes IDs of this package. CAUTION: <anIDList> is NOT cleared before use.
	:param anIDList:
	:type anIDList: TDF_IDList
	:rtype: void") IDList;
		static void IDList (TDF_IDList & anIDList);

		/****************** MakeShape ******************/
		%feature("compactdefaultargs") MakeShape;
		%feature("autodoc", "* Builds shape from map content
	:param MS:
	:type MS: TopTools_MapOfShape
	:rtype: TopoDS_Shape") MakeShape;
		static TopoDS_Shape MakeShape (const TopTools_MapOfShape & MS);

		/****************** OuterShell ******************/
		%feature("compactdefaultargs") OuterShell;
		%feature("autodoc", "* Returns True if outer Shell is found and the found shell in <theShell>. Print of TNaming enumeration =============================
	:param theSolid:
	:type theSolid: TopoDS_Solid
	:param theShell:
	:type theShell: TopoDS_Shell
	:rtype: bool") OuterShell;
		static Standard_Boolean OuterShell (const TopoDS_Solid & theSolid,TopoDS_Shell & theShell);

		/****************** OuterWire ******************/
		%feature("compactdefaultargs") OuterWire;
		%feature("autodoc", "* Returns True if outer wire is found and the found wire in <theWire>.
	:param theFace:
	:type theFace: TopoDS_Face
	:param theWire:
	:type theWire: TopoDS_Wire
	:rtype: bool") OuterWire;
		static Standard_Boolean OuterWire (const TopoDS_Face & theFace,TopoDS_Wire & theWire);

		/****************** Print ******************/
		%feature("compactdefaultargs") Print;
		%feature("autodoc", "* Prints the evolution <EVOL> as a String on the Stream <S> and returns <S>.
	:param EVOL:
	:type EVOL: TNaming_Evolution
	:param S:
	:type S: Standard_OStream
	:rtype: Standard_OStream") Print;
		static Standard_OStream & Print (const TNaming_Evolution EVOL,Standard_OStream & S);

		/****************** Print ******************/
		%feature("compactdefaultargs") Print;
		%feature("autodoc", "* Prints the name of name type <NAME> as a String on the Stream <S> and returns <S>.
	:param NAME:
	:type NAME: TNaming_NameType
	:param S:
	:type S: Standard_OStream
	:rtype: Standard_OStream") Print;
		static Standard_OStream & Print (const TNaming_NameType NAME,Standard_OStream & S);

		/****************** Print ******************/
		%feature("compactdefaultargs") Print;
		%feature("autodoc", "* Prints the content of UsedShapes private attribute as a String Table on the Stream <S> and returns <S>.
	:param ACCESS:
	:type ACCESS: TDF_Label
	:param S:
	:type S: Standard_OStream
	:rtype: Standard_OStream") Print;
		static Standard_OStream & Print (const TDF_Label & ACCESS,Standard_OStream & S);

		/****************** Replicate ******************/
		%feature("compactdefaultargs") Replicate;
		%feature("autodoc", "* Replicates the named shape with the transformation <T> on the label <L> (and sub-labels if necessary) (TNaming_GENERATED is set)
	:param NS:
	:type NS: TNaming_NamedShape
	:param T:
	:type T: gp_Trsf
	:param L:
	:type L: TDF_Label
	:rtype: void") Replicate;
		static void Replicate (const opencascade::handle<TNaming_NamedShape> & NS,const gp_Trsf & T,const TDF_Label & L);

		/****************** Replicate ******************/
		%feature("compactdefaultargs") Replicate;
		%feature("autodoc", "* Replicates the shape with the transformation <T> on the label <L> (and sub-labels if necessary) (TNaming_GENERATED is set)
	:param SH:
	:type SH: TopoDS_Shape
	:param T:
	:type T: gp_Trsf
	:param L:
	:type L: TDF_Label
	:rtype: void") Replicate;
		static void Replicate (const TopoDS_Shape & SH,const gp_Trsf & T,const TDF_Label & L);

		/****************** Substitute ******************/
		%feature("compactdefaultargs") Substitute;
		%feature("autodoc", "* Subtituter les shapes sur les structures de source vers cible
	:param labelsource:
	:type labelsource: TDF_Label
	:param labelcible:
	:type labelcible: TDF_Label
	:param mapOldNew:
	:type mapOldNew: TopTools_DataMapOfShapeShape
	:rtype: void") Substitute;
		static void Substitute (const TDF_Label & labelsource,const TDF_Label & labelcible,TopTools_DataMapOfShapeShape & mapOldNew);

		/****************** SubstituteSShape ******************/
		%feature("compactdefaultargs") SubstituteSShape;
		%feature("autodoc", "* Subtitutes shape in source structure
	:param accesslabel:
	:type accesslabel: TDF_Label
	:param From:
	:type From: TopoDS_Shape
	:param To:
	:type To: TopoDS_Shape
	:rtype: bool") SubstituteSShape;
		static Standard_Boolean SubstituteSShape (const TDF_Label & accesslabel,const TopoDS_Shape & From,TopoDS_Shape & To);

		/****************** Transform ******************/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "* Application de la transformation sur les shapes du label et de ses sous labels. Warning: le remplacement du shape est fait dans tous les attributs qui le contiennent meme si ceux ci ne sont pas associees a des sous-labels de <Label>.
	:param label:
	:type label: TDF_Label
	:param aTransformation:
	:type aTransformation: gp_Trsf
	:rtype: void") Transform;
		static void Transform (const TDF_Label & label,const gp_Trsf & aTransformation);

		/****************** Update ******************/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "* Mise a jour des shapes du label et de ses fils en tenant compte des substitutions decrite par mapOldNew. //! Warning: le remplacement du shape est fait dans tous les attributs qui le contiennent meme si ceux ci ne sont pas associees a des sous-labels de <Label>.
	:param label:
	:type label: TDF_Label
	:param mapOldNew:
	:type mapOldNew: TopTools_DataMapOfShapeShape
	:rtype: void") Update;
		static void Update (const TDF_Label & label,TopTools_DataMapOfShapeShape & mapOldNew);

};


%extend TNaming {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class TNaming_Builder *
************************/
%nodefaultctor TNaming_Builder;
class TNaming_Builder {
	public:
		/****************** Delete ******************/
		%feature("compactdefaultargs") Delete;
		%feature("autodoc", "* Records the shape oldShape which was deleted from the current label. As an example, consider the case of a face removed by a Boolean operation.
	:param oldShape:
	:type oldShape: TopoDS_Shape
	:rtype: None") Delete;
		void Delete (const TopoDS_Shape & oldShape);

		/****************** Generated ******************/
		%feature("compactdefaultargs") Generated;
		%feature("autodoc", "* Records the shape newShape which was generated during a topological construction. As an example, consider the case of a face generated in construction of a box.
	:param newShape:
	:type newShape: TopoDS_Shape
	:rtype: None") Generated;
		void Generated (const TopoDS_Shape & newShape);

		/****************** Generated ******************/
		%feature("compactdefaultargs") Generated;
		%feature("autodoc", "* Records the shape newShape which was generated from the shape oldShape during a topological construction. As an example, consider the case of a face generated from an edge in construction of a prism.
	:param oldShape:
	:type oldShape: TopoDS_Shape
	:param newShape:
	:type newShape: TopoDS_Shape
	:rtype: None") Generated;
		void Generated (const TopoDS_Shape & oldShape,const TopoDS_Shape & newShape);

		/****************** Modify ******************/
		%feature("compactdefaultargs") Modify;
		%feature("autodoc", "* Records the shape newShape which is a modification of the shape oldShape. As an example, consider the case of a face split or merged in a Boolean operation.
	:param oldShape:
	:type oldShape: TopoDS_Shape
	:param newShape:
	:type newShape: TopoDS_Shape
	:rtype: None") Modify;
		void Modify (const TopoDS_Shape & oldShape,const TopoDS_Shape & newShape);

		/****************** NamedShape ******************/
		%feature("compactdefaultargs") NamedShape;
		%feature("autodoc", "* Returns the NamedShape which has been built or is under construction.
	:rtype: opencascade::handle<TNaming_NamedShape>") NamedShape;
		opencascade::handle<TNaming_NamedShape> NamedShape ();

		/****************** Select ******************/
		%feature("compactdefaultargs") Select;
		%feature("autodoc", "* Add a Shape to the current label , This Shape is unmodified. Used for example to define a set of shapes under a label.
	:param aShape:
	:type aShape: TopoDS_Shape
	:param inShape:
	:type inShape: TopoDS_Shape
	:rtype: None") Select;
		void Select (const TopoDS_Shape & aShape,const TopoDS_Shape & inShape);

		/****************** TNaming_Builder ******************/
		%feature("compactdefaultargs") TNaming_Builder;
		%feature("autodoc", "* Create an Builder. Warning: Before Addition copies the current Value, and clear
	:param aLabel:
	:type aLabel: TDF_Label
	:rtype: None") TNaming_Builder;
		 TNaming_Builder (const TDF_Label & aLabel);

};


%extend TNaming_Builder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class TNaming_CopyShape *
**************************/
class TNaming_CopyShape {
	public:
		/****************** CopyTool ******************/
		%feature("compactdefaultargs") CopyTool;
		%feature("autodoc", "* Makes copy a set of shape(s), using the aMap
	:param aShape:
	:type aShape: TopoDS_Shape
	:param aMap:
	:type aMap: TColStd_IndexedDataMapOfTransientTransient
	:param aResult:
	:type aResult: TopoDS_Shape
	:rtype: void") CopyTool;
		static void CopyTool (const TopoDS_Shape & aShape,TColStd_IndexedDataMapOfTransientTransient & aMap,TopoDS_Shape & aResult);

		/****************** Translate ******************/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "* Translates a Transient shape(s) to Transient
	:param aShape:
	:type aShape: TopoDS_Shape
	:param aMap:
	:type aMap: TColStd_IndexedDataMapOfTransientTransient
	:param aResult:
	:type aResult: TopoDS_Shape
	:param TrTool:
	:type TrTool: TNaming_TranslateTool
	:rtype: void") Translate;
		static void Translate (const TopoDS_Shape & aShape,TColStd_IndexedDataMapOfTransientTransient & aMap,TopoDS_Shape & aResult,const opencascade::handle<TNaming_TranslateTool> & TrTool);

		/****************** Translate ******************/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "* Translates a Topological Location to an other Top. Location
	:param L:
	:type L: TopLoc_Location
	:param aMap:
	:type aMap: TColStd_IndexedDataMapOfTransientTransient
	:rtype: TopLoc_Location") Translate;
		static TopLoc_Location Translate (const TopLoc_Location & L,TColStd_IndexedDataMapOfTransientTransient & aMap);

};


%extend TNaming_CopyShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class TNaming_DeltaOnModification *
************************************/
%nodefaultctor TNaming_DeltaOnModification;
class TNaming_DeltaOnModification : public TDF_DeltaOnModification {
	public:
		/****************** Apply ******************/
		%feature("compactdefaultargs") Apply;
		%feature("autodoc", "* Applies the delta to the attribute.
	:rtype: void") Apply;
		virtual void Apply ();

		/****************** TNaming_DeltaOnModification ******************/
		%feature("compactdefaultargs") TNaming_DeltaOnModification;
		%feature("autodoc", "* Initializes a TDF_DeltaOnModification.
	:param NS:
	:type NS: TNaming_NamedShape
	:rtype: None") TNaming_DeltaOnModification;
		 TNaming_DeltaOnModification (const opencascade::handle<TNaming_NamedShape> & NS);

};


%make_alias(TNaming_DeltaOnModification)

%extend TNaming_DeltaOnModification {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class TNaming_DeltaOnRemoval *
*******************************/
%nodefaultctor TNaming_DeltaOnRemoval;
class TNaming_DeltaOnRemoval : public TDF_DeltaOnRemoval {
	public:
		/****************** Apply ******************/
		%feature("compactdefaultargs") Apply;
		%feature("autodoc", "* Applies the delta to the attribute.
	:rtype: void") Apply;
		virtual void Apply ();

		/****************** TNaming_DeltaOnRemoval ******************/
		%feature("compactdefaultargs") TNaming_DeltaOnRemoval;
		%feature("autodoc", "* Initializes a TDF_DeltaOnModification.
	:param NS:
	:type NS: TNaming_NamedShape
	:rtype: None") TNaming_DeltaOnRemoval;
		 TNaming_DeltaOnRemoval (const opencascade::handle<TNaming_NamedShape> & NS);

};


%make_alias(TNaming_DeltaOnRemoval)

%extend TNaming_DeltaOnRemoval {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class TNaming_Identifier *
***************************/
%nodefaultctor TNaming_Identifier;
class TNaming_Identifier {
	public:
		/****************** AncestorIdentification ******************/
		%feature("compactdefaultargs") AncestorIdentification;
		%feature("autodoc", ":param Localizer:
	:type Localizer: TNaming_Localizer
	:param Context:
	:type Context: TopoDS_Shape
	:rtype: None") AncestorIdentification;
		void AncestorIdentification (TNaming_Localizer & Localizer,const TopoDS_Shape & Context);

		/****************** ArgIsFeature ******************/
		%feature("compactdefaultargs") ArgIsFeature;
		%feature("autodoc", ":rtype: bool") ArgIsFeature;
		Standard_Boolean ArgIsFeature ();

		/****************** Feature ******************/
		%feature("compactdefaultargs") Feature;
		%feature("autodoc", ":rtype: opencascade::handle<TNaming_NamedShape>") Feature;
		opencascade::handle<TNaming_NamedShape> Feature ();

		/****************** FeatureArg ******************/
		%feature("compactdefaultargs") FeatureArg;
		%feature("autodoc", ":rtype: opencascade::handle<TNaming_NamedShape>") FeatureArg;
		opencascade::handle<TNaming_NamedShape> FeatureArg ();

		/****************** GeneratedIdentification ******************/
		%feature("compactdefaultargs") GeneratedIdentification;
		%feature("autodoc", ":param Localizer:
	:type Localizer: TNaming_Localizer
	:param NS:
	:type NS: TNaming_NamedShape
	:rtype: None") GeneratedIdentification;
		void GeneratedIdentification (TNaming_Localizer & Localizer,const opencascade::handle<TNaming_NamedShape> & NS);

		/****************** Identification ******************/
		%feature("compactdefaultargs") Identification;
		%feature("autodoc", ":param Localizer:
	:type Localizer: TNaming_Localizer
	:param NS:
	:type NS: TNaming_NamedShape
	:rtype: None") Identification;
		void Identification (TNaming_Localizer & Localizer,const opencascade::handle<TNaming_NamedShape> & NS);

		/****************** InitArgs ******************/
		%feature("compactdefaultargs") InitArgs;
		%feature("autodoc", ":rtype: None") InitArgs;
		void InitArgs ();

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", ":rtype: bool") IsDone;
		Standard_Boolean IsDone ();

		/****************** IsFeature ******************/
		%feature("compactdefaultargs") IsFeature;
		%feature("autodoc", ":rtype: bool") IsFeature;
		Standard_Boolean IsFeature ();

		/****************** MoreArgs ******************/
		%feature("compactdefaultargs") MoreArgs;
		%feature("autodoc", ":rtype: bool") MoreArgs;
		Standard_Boolean MoreArgs ();

		/****************** NamedShapeOfGeneration ******************/
		%feature("compactdefaultargs") NamedShapeOfGeneration;
		%feature("autodoc", ":rtype: opencascade::handle<TNaming_NamedShape>") NamedShapeOfGeneration;
		opencascade::handle<TNaming_NamedShape> NamedShapeOfGeneration ();

		/****************** NextArg ******************/
		%feature("compactdefaultargs") NextArg;
		%feature("autodoc", ":rtype: None") NextArg;
		void NextArg ();

		/****************** PrimitiveIdentification ******************/
		%feature("compactdefaultargs") PrimitiveIdentification;
		%feature("autodoc", ":param Localizer:
	:type Localizer: TNaming_Localizer
	:param NS:
	:type NS: TNaming_NamedShape
	:rtype: None") PrimitiveIdentification;
		void PrimitiveIdentification (TNaming_Localizer & Localizer,const opencascade::handle<TNaming_NamedShape> & NS);

		/****************** ShapeArg ******************/
		%feature("compactdefaultargs") ShapeArg;
		%feature("autodoc", ":rtype: TopoDS_Shape") ShapeArg;
		TopoDS_Shape ShapeArg ();

		/****************** ShapeContext ******************/
		%feature("compactdefaultargs") ShapeContext;
		%feature("autodoc", ":rtype: TopoDS_Shape") ShapeContext;
		TopoDS_Shape ShapeContext ();

		/****************** TNaming_Identifier ******************/
		%feature("compactdefaultargs") TNaming_Identifier;
		%feature("autodoc", ":param Lab:
	:type Lab: TDF_Label
	:param S:
	:type S: TopoDS_Shape
	:param Context:
	:type Context: TopoDS_Shape
	:param Geom:
	:type Geom: bool
	:rtype: None") TNaming_Identifier;
		 TNaming_Identifier (const TDF_Label & Lab,const TopoDS_Shape & S,const TopoDS_Shape & Context,const Standard_Boolean Geom);

		/****************** TNaming_Identifier ******************/
		%feature("compactdefaultargs") TNaming_Identifier;
		%feature("autodoc", ":param Lab:
	:type Lab: TDF_Label
	:param S:
	:type S: TopoDS_Shape
	:param ContextNS:
	:type ContextNS: TNaming_NamedShape
	:param Geom:
	:type Geom: bool
	:rtype: None") TNaming_Identifier;
		 TNaming_Identifier (const TDF_Label & Lab,const TopoDS_Shape & S,const opencascade::handle<TNaming_NamedShape> & ContextNS,const Standard_Boolean Geom);

		/****************** Type ******************/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", ":rtype: TNaming_NameType") Type;
		TNaming_NameType Type ();

};


%extend TNaming_Identifier {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class TNaming_Iterator *
*************************/
%nodefaultctor TNaming_Iterator;
class TNaming_Iterator {
	public:
		/****************** Evolution ******************/
		%feature("compactdefaultargs") Evolution;
		%feature("autodoc", ":rtype: TNaming_Evolution") Evolution;
		TNaming_Evolution Evolution ();

		/****************** IsModification ******************/
		%feature("compactdefaultargs") IsModification;
		%feature("autodoc", "* Returns true if the new shape is a modification (split, fuse,etc...) of the old shape.
	:rtype: bool") IsModification;
		Standard_Boolean IsModification ();

		/****************** More ******************/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "* Returns True if there is a current Item in the iteration.
	:rtype: bool") More;
		Standard_Boolean More ();

		/****************** NewShape ******************/
		%feature("compactdefaultargs") NewShape;
		%feature("autodoc", "* Returns the new shape in this iterator object.
	:rtype: TopoDS_Shape") NewShape;
		const TopoDS_Shape  NewShape ();

		/****************** Next ******************/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "* Moves the iteration to the next Item
	:rtype: None") Next;
		void Next ();

		/****************** OldShape ******************/
		%feature("compactdefaultargs") OldShape;
		%feature("autodoc", "* Returns the old shape in this iterator object. This shape can be a null one.
	:rtype: TopoDS_Shape") OldShape;
		const TopoDS_Shape  OldShape ();

		/****************** TNaming_Iterator ******************/
		%feature("compactdefaultargs") TNaming_Iterator;
		%feature("autodoc", "* Iterates on all the history records in <anAtt>.
	:param anAtt:
	:type anAtt: TNaming_NamedShape
	:rtype: None") TNaming_Iterator;
		 TNaming_Iterator (const opencascade::handle<TNaming_NamedShape> & anAtt);

		/****************** TNaming_Iterator ******************/
		%feature("compactdefaultargs") TNaming_Iterator;
		%feature("autodoc", "* Iterates on all the history records in the current transaction
	:param aLabel:
	:type aLabel: TDF_Label
	:rtype: None") TNaming_Iterator;
		 TNaming_Iterator (const TDF_Label & aLabel);

		/****************** TNaming_Iterator ******************/
		%feature("compactdefaultargs") TNaming_Iterator;
		%feature("autodoc", "* Iterates on all the history records in the transaction <aTrans>
	:param aLabel:
	:type aLabel: TDF_Label
	:param aTrans:
	:type aTrans: int
	:rtype: None") TNaming_Iterator;
		 TNaming_Iterator (const TDF_Label & aLabel,const Standard_Integer aTrans);

};


%extend TNaming_Iterator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class TNaming_IteratorOnShapesSet *
************************************/
%nodefaultctor TNaming_IteratorOnShapesSet;
class TNaming_IteratorOnShapesSet {
	public:
		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Initialize the iteration
	:param S:
	:type S: TNaming_ShapesSet
	:rtype: None") Init;
		void Init (const TNaming_ShapesSet & S);

		/****************** More ******************/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "* Returns True if there is a current Item in the iteration.
	:rtype: bool") More;
		Standard_Boolean More ();

		/****************** Next ******************/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "* Move to the next Item
	:rtype: None") Next;
		void Next ();

		/****************** TNaming_IteratorOnShapesSet ******************/
		%feature("compactdefaultargs") TNaming_IteratorOnShapesSet;
		%feature("autodoc", ":rtype: None") TNaming_IteratorOnShapesSet;
		 TNaming_IteratorOnShapesSet ();

		/****************** TNaming_IteratorOnShapesSet ******************/
		%feature("compactdefaultargs") TNaming_IteratorOnShapesSet;
		%feature("autodoc", ":param S:
	:type S: TNaming_ShapesSet
	:rtype: None") TNaming_IteratorOnShapesSet;
		 TNaming_IteratorOnShapesSet (const TNaming_ShapesSet & S);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", ":rtype: TopoDS_Shape") Value;
		const TopoDS_Shape  Value ();

};


%extend TNaming_IteratorOnShapesSet {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class TNaming_Localizer *
**************************/
%nodefaultctor TNaming_Localizer;
class TNaming_Localizer {
	public:
		/****************** Ancestors ******************/
		%feature("compactdefaultargs") Ancestors;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:param Type:
	:type Type: TopAbs_ShapeEnum
	:rtype: TopTools_IndexedDataMapOfShapeListOfShape") Ancestors;
		const TopTools_IndexedDataMapOfShapeListOfShape & Ancestors (const TopoDS_Shape & S,const TopAbs_ShapeEnum Type);

		/****************** Backward ******************/
		%feature("compactdefaultargs") Backward;
		%feature("autodoc", ":param NS:
	:type NS: TNaming_NamedShape
	:param S:
	:type S: TopoDS_Shape
	:param Primitives:
	:type Primitives: TNaming_MapOfNamedShape
	:param ValidShapes:
	:type ValidShapes: TopTools_MapOfShape
	:rtype: None") Backward;
		void Backward (const opencascade::handle<TNaming_NamedShape> & NS,const TopoDS_Shape & S,TNaming_MapOfNamedShape & Primitives,TopTools_MapOfShape & ValidShapes);

		/****************** FindFeaturesInAncestors ******************/
		%feature("compactdefaultargs") FindFeaturesInAncestors;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:param In:
	:type In: TopoDS_Shape
	:param AncInFeatures:
	:type AncInFeatures: TopTools_MapOfShape
	:rtype: None") FindFeaturesInAncestors;
		void FindFeaturesInAncestors (const TopoDS_Shape & S,const TopoDS_Shape & In,TopTools_MapOfShape & AncInFeatures);

		/****************** FindGenerator ******************/
		%feature("compactdefaultargs") FindGenerator;
		%feature("autodoc", ":param NS:
	:type NS: TNaming_NamedShape
	:param S:
	:type S: TopoDS_Shape
	:param theListOfGenerators:
	:type theListOfGenerators: TopTools_ListOfShape
	:rtype: void") FindGenerator;
		static void FindGenerator (const opencascade::handle<TNaming_NamedShape> & NS,const TopoDS_Shape & S,TopTools_ListOfShape & theListOfGenerators);

		/****************** FindNeighbourg ******************/
		%feature("compactdefaultargs") FindNeighbourg;
		%feature("autodoc", ":param Cont:
	:type Cont: TopoDS_Shape
	:param S:
	:type S: TopoDS_Shape
	:param Neighbourg:
	:type Neighbourg: TopTools_MapOfShape
	:rtype: None") FindNeighbourg;
		void FindNeighbourg (const TopoDS_Shape & Cont,const TopoDS_Shape & S,TopTools_MapOfShape & Neighbourg);

		/****************** FindShapeContext ******************/
		%feature("compactdefaultargs") FindShapeContext;
		%feature("autodoc", "* Finds context of the shape <S>.
	:param NS:
	:type NS: TNaming_NamedShape
	:param theS:
	:type theS: TopoDS_Shape
	:param theSC:
	:type theSC: TopoDS_Shape
	:rtype: void") FindShapeContext;
		static void FindShapeContext (const opencascade::handle<TNaming_NamedShape> & NS,const TopoDS_Shape & theS,TopoDS_Shape & theSC);

		/****************** GoBack ******************/
		%feature("compactdefaultargs") GoBack;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:param Lab:
	:type Lab: TDF_Label
	:param Evol:
	:type Evol: TNaming_Evolution
	:param OldS:
	:type OldS: TopTools_ListOfShape
	:param OldLab:
	:type OldLab: TNaming_ListOfNamedShape
	:rtype: None") GoBack;
		void GoBack (const TopoDS_Shape & S,const TDF_Label & Lab,const TNaming_Evolution Evol,TopTools_ListOfShape & OldS,TNaming_ListOfNamedShape & OldLab);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", ":param US:
	:type US: TNaming_UsedShapes
	:param CurTrans:
	:type CurTrans: int
	:rtype: None") Init;
		void Init (const opencascade::handle<TNaming_UsedShapes> & US,const Standard_Integer CurTrans);

		/****************** IsNew ******************/
		%feature("compactdefaultargs") IsNew;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:param NS:
	:type NS: TNaming_NamedShape
	:rtype: bool") IsNew;
		static Standard_Boolean IsNew (const TopoDS_Shape & S,const opencascade::handle<TNaming_NamedShape> & NS);

		/****************** SubShapes ******************/
		%feature("compactdefaultargs") SubShapes;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:param Type:
	:type Type: TopAbs_ShapeEnum
	:rtype: TopTools_MapOfShape") SubShapes;
		const TopTools_MapOfShape & SubShapes (const TopoDS_Shape & S,const TopAbs_ShapeEnum Type);

		/****************** TNaming_Localizer ******************/
		%feature("compactdefaultargs") TNaming_Localizer;
		%feature("autodoc", ":rtype: None") TNaming_Localizer;
		 TNaming_Localizer ();

};


%extend TNaming_Localizer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************
* class TNaming_Name *
*********************/
%nodefaultctor TNaming_Name;
class TNaming_Name {
	public:
		/****************** Append ******************/
		%feature("compactdefaultargs") Append;
		%feature("autodoc", ":param arg:
	:type arg: TNaming_NamedShape
	:rtype: None") Append;
		void Append (const opencascade::handle<TNaming_NamedShape> & arg);

		/****************** Arguments ******************/
		%feature("compactdefaultargs") Arguments;
		%feature("autodoc", ":rtype: TNaming_ListOfNamedShape") Arguments;
		const TNaming_ListOfNamedShape & Arguments ();

		/****************** ContextLabel ******************/
		%feature("compactdefaultargs") ContextLabel;
		%feature("autodoc", ":param theLab:
	:type theLab: TDF_Label
	:rtype: None") ContextLabel;
		void ContextLabel (const TDF_Label & theLab);

		/****************** ContextLabel ******************/
		%feature("compactdefaultargs") ContextLabel;
		%feature("autodoc", ":rtype: TDF_Label") ContextLabel;
		const TDF_Label & ContextLabel ();

		/****************** Index ******************/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", ":param I:
	:type I: int
	:rtype: None") Index;
		void Index (const Standard_Integer I);

		/****************** Index ******************/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", ":rtype: int") Index;
		Standard_Integer Index ();

		/****************** Orientation ******************/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", ":param theOrientation:
	:type theOrientation: TopAbs_Orientation
	:rtype: None") Orientation;
		void Orientation (const TopAbs_Orientation theOrientation);

		/****************** Orientation ******************/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", ":rtype: TopAbs_Orientation") Orientation;
		TopAbs_Orientation Orientation ();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", ":param into:
	:type into: TNaming_Name
	:param RT:
	:type RT: TDF_RelocationTable
	:rtype: None") Paste;
		void Paste (TNaming_Name & into,const opencascade::handle<TDF_RelocationTable> & RT);

		/****************** Shape ******************/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", ":param theShape:
	:type theShape: TopoDS_Shape
	:rtype: None") Shape;
		void Shape (const TopoDS_Shape & theShape);

		/****************** Shape ******************/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", ":rtype: TopoDS_Shape") Shape;
		TopoDS_Shape Shape ();

		/****************** ShapeType ******************/
		%feature("compactdefaultargs") ShapeType;
		%feature("autodoc", ":param aType:
	:type aType: TopAbs_ShapeEnum
	:rtype: None") ShapeType;
		void ShapeType (const TopAbs_ShapeEnum aType);

		/****************** ShapeType ******************/
		%feature("compactdefaultargs") ShapeType;
		%feature("autodoc", ":rtype: TopAbs_ShapeEnum") ShapeType;
		TopAbs_ShapeEnum ShapeType ();

		/****************** Solve ******************/
		%feature("compactdefaultargs") Solve;
		%feature("autodoc", ":param aLab:
	:type aLab: TDF_Label
	:param Valid:
	:type Valid: TDF_LabelMap
	:rtype: bool") Solve;
		Standard_Boolean Solve (const TDF_Label & aLab,const TDF_LabelMap & Valid);

		/****************** StopNamedShape ******************/
		%feature("compactdefaultargs") StopNamedShape;
		%feature("autodoc", ":param arg:
	:type arg: TNaming_NamedShape
	:rtype: None") StopNamedShape;
		void StopNamedShape (const opencascade::handle<TNaming_NamedShape> & arg);

		/****************** StopNamedShape ******************/
		%feature("compactdefaultargs") StopNamedShape;
		%feature("autodoc", ":rtype: opencascade::handle<TNaming_NamedShape>") StopNamedShape;
		opencascade::handle<TNaming_NamedShape> StopNamedShape ();

		/****************** TNaming_Name ******************/
		%feature("compactdefaultargs") TNaming_Name;
		%feature("autodoc", ":rtype: None") TNaming_Name;
		 TNaming_Name ();

		/****************** Type ******************/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", ":param aType:
	:type aType: TNaming_NameType
	:rtype: None") Type;
		void Type (const TNaming_NameType aType);

		/****************** Type ******************/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", ":rtype: TNaming_NameType") Type;
		TNaming_NameType Type ();

};


%extend TNaming_Name {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class TNaming_NamedShape *
***************************/
%nodefaultctor TNaming_NamedShape;
class TNaming_NamedShape : public TDF_Attribute {
	public:
		/****************** AfterUndo ******************/
		%feature("compactdefaultargs") AfterUndo;
		%feature("autodoc", "* Something to do after applying <anAttDelta>.
	:param anAttDelta:
	:type anAttDelta: TDF_AttributeDelta
	:param forceIt: default value is Standard_False
	:type forceIt: bool
	:rtype: bool") AfterUndo;
		virtual Standard_Boolean AfterUndo (const opencascade::handle<TDF_AttributeDelta> & anAttDelta,const Standard_Boolean forceIt = Standard_False);

		/****************** BackupCopy ******************/
		%feature("compactdefaultargs") BackupCopy;
		%feature("autodoc", "* Copies the attribute contents into a new other attribute. It is used by Backup().
	:rtype: opencascade::handle<TDF_Attribute>") BackupCopy;
		virtual opencascade::handle<TDF_Attribute> BackupCopy ();

		/****************** BeforeRemoval ******************/
		%feature("compactdefaultargs") BeforeRemoval;
		%feature("autodoc", ":rtype: void") BeforeRemoval;
		virtual void BeforeRemoval ();

		/****************** BeforeUndo ******************/
		%feature("compactdefaultargs") BeforeUndo;
		%feature("autodoc", "* Something to do before applying <anAttDelta>
	:param anAttDelta:
	:type anAttDelta: TDF_AttributeDelta
	:param forceIt: default value is Standard_False
	:type forceIt: bool
	:rtype: bool") BeforeUndo;
		virtual Standard_Boolean BeforeUndo (const opencascade::handle<TDF_AttributeDelta> & anAttDelta,const Standard_Boolean forceIt = Standard_False);

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", ":rtype: None") Clear;
		void Clear ();

		/****************** DeltaOnModification ******************/
		%feature("compactdefaultargs") DeltaOnModification;
		%feature("autodoc", "* Makes a DeltaOnModification between <self> and <anOldAttribute.
	:param anOldAttribute:
	:type anOldAttribute: TDF_Attribute
	:rtype: opencascade::handle<TDF_DeltaOnModification>") DeltaOnModification;
		virtual opencascade::handle<TDF_DeltaOnModification> DeltaOnModification (const opencascade::handle<TDF_Attribute> & anOldAttribute);

		/****************** DeltaOnModification ******************/
		%feature("compactdefaultargs") DeltaOnModification;
		%feature("autodoc", "* Applies a DeltaOnModification to <self>.
	:param aDelta:
	:type aDelta: TDF_DeltaOnModification
	:rtype: void") DeltaOnModification;
		virtual void DeltaOnModification (const opencascade::handle<TDF_DeltaOnModification> & aDelta);

		/****************** DeltaOnRemoval ******************/
		%feature("compactdefaultargs") DeltaOnRemoval;
		%feature("autodoc", "* Makes a DeltaOnRemoval on <self> because <self> has disappeared from the DS.
	:rtype: opencascade::handle<TDF_DeltaOnRemoval>") DeltaOnRemoval;
		virtual opencascade::handle<TDF_DeltaOnRemoval> DeltaOnRemoval ();


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        		/****************** Evolution ******************/
		%feature("compactdefaultargs") Evolution;
		%feature("autodoc", "* Returns the Evolution of the attribute.
	:rtype: TNaming_Evolution") Evolution;
		TNaming_Evolution Evolution ();

		/****************** Get ******************/
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "* Returns the shapes contained in <NS>. Returns a null shape if IsEmpty.
	:rtype: TopoDS_Shape") Get;
		TopoDS_Shape Get ();

		/****************** GetID ******************/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "* class method ============ Returns the GUID for named shapes.
	:rtype: Standard_GUID") GetID;
		static const Standard_GUID & GetID ();

		/****************** ID ******************/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "* Returns the ID of the attribute.
	:rtype: Standard_GUID") ID;
		const Standard_GUID & ID ();

		/****************** IsEmpty ******************/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", ":rtype: bool") IsEmpty;
		Standard_Boolean IsEmpty ();

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "* Returns an new empty attribute from the good end type. It is used by the copy algorithm.
	:rtype: opencascade::handle<TDF_Attribute>") NewEmpty;
		virtual opencascade::handle<TDF_Attribute> NewEmpty ();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "* This method is different from the 'Copy' one, because it is used when copying an attribute from a source structure into a target structure. This method pastes the current attribute to the label corresponding to the insertor. The pasted attribute may be a brand new one or a new version of the previous one.
	:param intoAttribute:
	:type intoAttribute: TDF_Attribute
	:param aRelocTationable:
	:type aRelocTationable: TDF_RelocationTable
	:rtype: void") Paste;
		virtual void Paste (const opencascade::handle<TDF_Attribute> & intoAttribute,const opencascade::handle<TDF_RelocationTable> & aRelocTationable);

		/****************** References ******************/
		%feature("compactdefaultargs") References;
		%feature("autodoc", "* Adds the directly referenced attributes and labels to <aDataSet>. 'Directly' means we have only to look at the first level of references.
	:param aDataSet:
	:type aDataSet: TDF_DataSet
	:rtype: void") References;
		virtual void References (const opencascade::handle<TDF_DataSet> & aDataSet);

		/****************** Restore ******************/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "* Restores the contents from <anAttribute> into this one. It is used when aborting a transaction.
	:param anAttribute:
	:type anAttribute: TDF_Attribute
	:rtype: void") Restore;
		virtual void Restore (const opencascade::handle<TDF_Attribute> & anAttribute);

		/****************** SetVersion ******************/
		%feature("compactdefaultargs") SetVersion;
		%feature("autodoc", "* Set the Version of the attribute.
	:param version:
	:type version: int
	:rtype: None") SetVersion;
		void SetVersion (const Standard_Integer version);

		/****************** TNaming_NamedShape ******************/
		%feature("compactdefaultargs") TNaming_NamedShape;
		%feature("autodoc", ":rtype: None") TNaming_NamedShape;
		 TNaming_NamedShape ();

		/****************** Version ******************/
		%feature("compactdefaultargs") Version;
		%feature("autodoc", "* Returns the Version of the attribute.
	:rtype: int") Version;
		Standard_Integer Version ();

};


%make_alias(TNaming_NamedShape)

%extend TNaming_NamedShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class TNaming_Naming *
***********************/
%nodefaultctor TNaming_Naming;
class TNaming_Naming : public TDF_Attribute {
	public:
		/****************** ChangeName ******************/
		%feature("compactdefaultargs") ChangeName;
		%feature("autodoc", ":rtype: TNaming_Name") ChangeName;
		TNaming_Name & ChangeName ();


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        		/****************** ExtendedDump ******************/
		%feature("compactdefaultargs") ExtendedDump;
		%feature("autodoc", ":param anOS:
	:type anOS: Standard_OStream
	:param aFilter:
	:type aFilter: TDF_IDFilter
	:param aMap:
	:type aMap: TDF_AttributeIndexedMap
	:rtype: void") ExtendedDump;
		virtual void ExtendedDump (Standard_OStream & anOS,const TDF_IDFilter & aFilter,TDF_AttributeIndexedMap & aMap);

		/****************** GetID ******************/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "* following code from TDesignStd ==============================
	:rtype: Standard_GUID") GetID;
		static const Standard_GUID & GetID ();

		/****************** GetName ******************/
		%feature("compactdefaultargs") GetName;
		%feature("autodoc", ":rtype: TNaming_Name") GetName;
		const TNaming_Name & GetName ();

		/****************** ID ******************/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "* Deferred methods from TDF_Attribute ===================================
	:rtype: Standard_GUID") ID;
		virtual const Standard_GUID & ID ();

		/****************** Insert ******************/
		%feature("compactdefaultargs") Insert;
		%feature("autodoc", ":param under:
	:type under: TDF_Label
	:rtype: opencascade::handle<TNaming_Naming>") Insert;
		static opencascade::handle<TNaming_Naming> Insert (const TDF_Label & under);

		/****************** IsDefined ******************/
		%feature("compactdefaultargs") IsDefined;
		%feature("autodoc", ":rtype: bool") IsDefined;
		Standard_Boolean IsDefined ();

		/****************** Name ******************/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "* Creates a Namimg attribute at label <where> to identify the shape <Selection>. Geometry is Standard_True if we are only interested by the underlying geometry (e.g. setting a constraint). <Context> is used to find neighbours of <S> when required by the naming. If KeepOrientation is True the Selection orientation is taken into account. BNproblem == True points out that Context sub-shapes in DF have orientation differences with Context shape itself. instance method ===============
	:param where:
	:type where: TDF_Label
	:param Selection:
	:type Selection: TopoDS_Shape
	:param Context:
	:type Context: TopoDS_Shape
	:param Geometry: default value is Standard_False
	:type Geometry: bool
	:param KeepOrientation: default value is Standard_False
	:type KeepOrientation: bool
	:param BNproblem: default value is Standard_False
	:type BNproblem: bool
	:rtype: opencascade::handle<TNaming_NamedShape>") Name;
		static opencascade::handle<TNaming_NamedShape> Name (const TDF_Label & where,const TopoDS_Shape & Selection,const TopoDS_Shape & Context,const Standard_Boolean Geometry = Standard_False,const Standard_Boolean KeepOrientation = Standard_False,const Standard_Boolean BNproblem = Standard_False);

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", ":rtype: opencascade::handle<TDF_Attribute>") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty ();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", ":param Into:
	:type Into: TDF_Attribute
	:param RT:
	:type RT: TDF_RelocationTable
	:rtype: None") Paste;
		void Paste (const opencascade::handle<TDF_Attribute> & Into,const opencascade::handle<TDF_RelocationTable> & RT);

		/****************** References ******************/
		%feature("compactdefaultargs") References;
		%feature("autodoc", ":param aDataSet:
	:type aDataSet: TDF_DataSet
	:rtype: void") References;
		virtual void References (const opencascade::handle<TDF_DataSet> & aDataSet);

		/****************** Regenerate ******************/
		%feature("compactdefaultargs") Regenerate;
		%feature("autodoc", "* regenerate only the Name associated to me
	:param scope:
	:type scope: TDF_LabelMap
	:rtype: bool") Regenerate;
		Standard_Boolean Regenerate (TDF_LabelMap & scope);

		/****************** Restore ******************/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", ":param With:
	:type With: TDF_Attribute
	:rtype: None") Restore;
		void Restore (const opencascade::handle<TDF_Attribute> & With);

		/****************** Solve ******************/
		%feature("compactdefaultargs") Solve;
		%feature("autodoc", "* Regenerate recursively the whole name with scope. If scope is empty it means that all the labels of the framework are valid.
	:param scope:
	:type scope: TDF_LabelMap
	:rtype: bool") Solve;
		Standard_Boolean Solve (TDF_LabelMap & scope);

		/****************** TNaming_Naming ******************/
		%feature("compactdefaultargs") TNaming_Naming;
		%feature("autodoc", ":rtype: None") TNaming_Naming;
		 TNaming_Naming ();

};


%make_alias(TNaming_Naming)

%extend TNaming_Naming {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class TNaming_NamingTool *
***************************/
class TNaming_NamingTool {
	public:
		/****************** BuildDescendants ******************/
		%feature("compactdefaultargs") BuildDescendants;
		%feature("autodoc", ":param NS:
	:type NS: TNaming_NamedShape
	:param Labels:
	:type Labels: TDF_LabelMap
	:rtype: void") BuildDescendants;
		static void BuildDescendants (const opencascade::handle<TNaming_NamedShape> & NS,TDF_LabelMap & Labels);

		/****************** CurrentShape ******************/
		%feature("compactdefaultargs") CurrentShape;
		%feature("autodoc", ":param Valid:
	:type Valid: TDF_LabelMap
	:param Forbiden:
	:type Forbiden: TDF_LabelMap
	:param NS:
	:type NS: TNaming_NamedShape
	:param MS:
	:type MS: TopTools_IndexedMapOfShape
	:rtype: void") CurrentShape;
		static void CurrentShape (const TDF_LabelMap & Valid,const TDF_LabelMap & Forbiden,const opencascade::handle<TNaming_NamedShape> & NS,TopTools_IndexedMapOfShape & MS);

		/****************** CurrentShapeFromShape ******************/
		%feature("compactdefaultargs") CurrentShapeFromShape;
		%feature("autodoc", ":param Valid:
	:type Valid: TDF_LabelMap
	:param Forbiden:
	:type Forbiden: TDF_LabelMap
	:param Acces:
	:type Acces: TDF_Label
	:param S:
	:type S: TopoDS_Shape
	:param MS:
	:type MS: TopTools_IndexedMapOfShape
	:rtype: void") CurrentShapeFromShape;
		static void CurrentShapeFromShape (const TDF_LabelMap & Valid,const TDF_LabelMap & Forbiden,const TDF_Label & Acces,const TopoDS_Shape & S,TopTools_IndexedMapOfShape & MS);

};


%extend TNaming_NamingTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class TNaming_NewShapeIterator *
*********************************/
%nodefaultctor TNaming_NewShapeIterator;
class TNaming_NewShapeIterator {
	public:
		/****************** IsModification ******************/
		%feature("compactdefaultargs") IsModification;
		%feature("autodoc", "* True if the new shape is a modification (split, fuse,etc...) of the old shape.
	:rtype: bool") IsModification;
		Standard_Boolean IsModification ();

		/****************** Label ******************/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", ":rtype: TDF_Label") Label;
		TDF_Label Label ();

		/****************** More ******************/
		%feature("compactdefaultargs") More;
		%feature("autodoc", ":rtype: bool") More;
		Standard_Boolean More ();

		/****************** NamedShape ******************/
		%feature("compactdefaultargs") NamedShape;
		%feature("autodoc", ":rtype: opencascade::handle<TNaming_NamedShape>") NamedShape;
		opencascade::handle<TNaming_NamedShape> NamedShape ();

		/****************** Next ******************/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", ":rtype: None") Next;
		void Next ();

		/****************** Shape ******************/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "* Warning! Can be a Null Shape if a descendant is deleted.
	:rtype: TopoDS_Shape") Shape;
		const TopoDS_Shape  Shape ();

		/****************** TNaming_NewShapeIterator ******************/
		%feature("compactdefaultargs") TNaming_NewShapeIterator;
		%feature("autodoc", ":param aShape:
	:type aShape: TopoDS_Shape
	:param Transaction:
	:type Transaction: int
	:param access:
	:type access: TDF_Label
	:rtype: None") TNaming_NewShapeIterator;
		 TNaming_NewShapeIterator (const TopoDS_Shape & aShape,const Standard_Integer Transaction,const TDF_Label & access);

		/****************** TNaming_NewShapeIterator ******************/
		%feature("compactdefaultargs") TNaming_NewShapeIterator;
		%feature("autodoc", ":param aShape:
	:type aShape: TopoDS_Shape
	:param access:
	:type access: TDF_Label
	:rtype: None") TNaming_NewShapeIterator;
		 TNaming_NewShapeIterator (const TopoDS_Shape & aShape,const TDF_Label & access);

		/****************** TNaming_NewShapeIterator ******************/
		%feature("compactdefaultargs") TNaming_NewShapeIterator;
		%feature("autodoc", "* Iterates from the current Shape in <anIterator>
	:param anIterator:
	:type anIterator: TNaming_NewShapeIterator
	:rtype: None") TNaming_NewShapeIterator;
		 TNaming_NewShapeIterator (const TNaming_NewShapeIterator & anIterator);

		/****************** TNaming_NewShapeIterator ******************/
		%feature("compactdefaultargs") TNaming_NewShapeIterator;
		%feature("autodoc", "* Iterates from the current Shape in <anIterator>
	:param anIterator:
	:type anIterator: TNaming_Iterator
	:rtype: None") TNaming_NewShapeIterator;
		 TNaming_NewShapeIterator (const TNaming_Iterator & anIterator);

};


%extend TNaming_NewShapeIterator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class TNaming_OldShapeIterator *
*********************************/
%nodefaultctor TNaming_OldShapeIterator;
class TNaming_OldShapeIterator {
	public:
		/****************** IsModification ******************/
		%feature("compactdefaultargs") IsModification;
		%feature("autodoc", "* True if the new shape is a modification (split, fuse,etc...) of the old shape.
	:rtype: bool") IsModification;
		Standard_Boolean IsModification ();

		/****************** Label ******************/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", ":rtype: TDF_Label") Label;
		TDF_Label Label ();

		/****************** More ******************/
		%feature("compactdefaultargs") More;
		%feature("autodoc", ":rtype: bool") More;
		Standard_Boolean More ();

		/****************** NamedShape ******************/
		%feature("compactdefaultargs") NamedShape;
		%feature("autodoc", ":rtype: opencascade::handle<TNaming_NamedShape>") NamedShape;
		opencascade::handle<TNaming_NamedShape> NamedShape ();

		/****************** Next ******************/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", ":rtype: None") Next;
		void Next ();

		/****************** Shape ******************/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", ":rtype: TopoDS_Shape") Shape;
		const TopoDS_Shape  Shape ();

		/****************** TNaming_OldShapeIterator ******************/
		%feature("compactdefaultargs") TNaming_OldShapeIterator;
		%feature("autodoc", ":param aShape:
	:type aShape: TopoDS_Shape
	:param Transaction:
	:type Transaction: int
	:param access:
	:type access: TDF_Label
	:rtype: None") TNaming_OldShapeIterator;
		 TNaming_OldShapeIterator (const TopoDS_Shape & aShape,const Standard_Integer Transaction,const TDF_Label & access);

		/****************** TNaming_OldShapeIterator ******************/
		%feature("compactdefaultargs") TNaming_OldShapeIterator;
		%feature("autodoc", ":param aShape:
	:type aShape: TopoDS_Shape
	:param access:
	:type access: TDF_Label
	:rtype: None") TNaming_OldShapeIterator;
		 TNaming_OldShapeIterator (const TopoDS_Shape & aShape,const TDF_Label & access);

		/****************** TNaming_OldShapeIterator ******************/
		%feature("compactdefaultargs") TNaming_OldShapeIterator;
		%feature("autodoc", "* Iterates from the current Shape in <anIterator>
	:param anIterator:
	:type anIterator: TNaming_OldShapeIterator
	:rtype: None") TNaming_OldShapeIterator;
		 TNaming_OldShapeIterator (const TNaming_OldShapeIterator & anIterator);

		/****************** TNaming_OldShapeIterator ******************/
		%feature("compactdefaultargs") TNaming_OldShapeIterator;
		%feature("autodoc", "* Iterates from the current Shape in <anIterator>
	:param anIterator:
	:type anIterator: TNaming_Iterator
	:rtype: None") TNaming_OldShapeIterator;
		 TNaming_OldShapeIterator (const TNaming_Iterator & anIterator);

};


%extend TNaming_OldShapeIterator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class TNaming_RefShape *
*************************/
%nodefaultctor TNaming_RefShape;
class TNaming_RefShape {
	public:
		/****************** FirstUse ******************/
		%feature("compactdefaultargs") FirstUse;
		%feature("autodoc", ":param aPtr:
	:type aPtr: TNaming_PtrNode
	:rtype: None") FirstUse;
		void FirstUse (const TNaming_PtrNode & aPtr);

		/****************** FirstUse ******************/
		%feature("compactdefaultargs") FirstUse;
		%feature("autodoc", ":rtype: TNaming_PtrNode") FirstUse;
		TNaming_PtrNode FirstUse ();

		/****************** Label ******************/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", ":rtype: TDF_Label") Label;
		TDF_Label Label ();

		/****************** NamedShape ******************/
		%feature("compactdefaultargs") NamedShape;
		%feature("autodoc", ":rtype: opencascade::handle<TNaming_NamedShape>") NamedShape;
		opencascade::handle<TNaming_NamedShape> NamedShape ();

		/****************** Shape ******************/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:rtype: None") Shape;
		void Shape (const TopoDS_Shape & S);

		/****************** Shape ******************/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", ":rtype: TopoDS_Shape") Shape;
		const TopoDS_Shape  Shape ();

		/****************** TNaming_RefShape ******************/
		%feature("compactdefaultargs") TNaming_RefShape;
		%feature("autodoc", ":rtype: None") TNaming_RefShape;
		 TNaming_RefShape ();

		/****************** TNaming_RefShape ******************/
		%feature("compactdefaultargs") TNaming_RefShape;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:rtype: None") TNaming_RefShape;
		 TNaming_RefShape (const TopoDS_Shape & S);

};


%extend TNaming_RefShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class TNaming_SameShapeIterator *
**********************************/
%nodefaultctor TNaming_SameShapeIterator;
class TNaming_SameShapeIterator {
	public:
		/****************** Label ******************/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", ":rtype: TDF_Label") Label;
		TDF_Label Label ();

		/****************** More ******************/
		%feature("compactdefaultargs") More;
		%feature("autodoc", ":rtype: bool") More;
		Standard_Boolean More ();

		/****************** Next ******************/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", ":rtype: None") Next;
		void Next ();

		/****************** TNaming_SameShapeIterator ******************/
		%feature("compactdefaultargs") TNaming_SameShapeIterator;
		%feature("autodoc", ":param aShape:
	:type aShape: TopoDS_Shape
	:param access:
	:type access: TDF_Label
	:rtype: None") TNaming_SameShapeIterator;
		 TNaming_SameShapeIterator (const TopoDS_Shape & aShape,const TDF_Label & access);

};


%extend TNaming_SameShapeIterator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class TNaming_Scope *
**********************/
%nodefaultctor TNaming_Scope;
class TNaming_Scope {
	public:
		/****************** ChangeValid ******************/
		%feature("compactdefaultargs") ChangeValid;
		%feature("autodoc", ":rtype: TDF_LabelMap") ChangeValid;
		TDF_LabelMap & ChangeValid ();

		/****************** ClearValid ******************/
		%feature("compactdefaultargs") ClearValid;
		%feature("autodoc", ":rtype: None") ClearValid;
		void ClearValid ();

		/****************** CurrentShape ******************/
		%feature("compactdefaultargs") CurrentShape;
		%feature("autodoc", "* Returns the current value of <NS> according to the Valid Scope.
	:param NS:
	:type NS: TNaming_NamedShape
	:rtype: TopoDS_Shape") CurrentShape;
		TopoDS_Shape CurrentShape (const opencascade::handle<TNaming_NamedShape> & NS);

		/****************** GetValid ******************/
		%feature("compactdefaultargs") GetValid;
		%feature("autodoc", ":rtype: TDF_LabelMap") GetValid;
		const TDF_LabelMap & GetValid ();

		/****************** IsValid ******************/
		%feature("compactdefaultargs") IsValid;
		%feature("autodoc", ":param L:
	:type L: TDF_Label
	:rtype: bool") IsValid;
		Standard_Boolean IsValid (const TDF_Label & L);

		/****************** TNaming_Scope ******************/
		%feature("compactdefaultargs") TNaming_Scope;
		%feature("autodoc", "* WithValid = False
	:rtype: None") TNaming_Scope;
		 TNaming_Scope ();

		/****************** TNaming_Scope ******************/
		%feature("compactdefaultargs") TNaming_Scope;
		%feature("autodoc", "* if <WithValid> the scope is defined by the map. If not on the whole framework.
	:param WithValid:
	:type WithValid: bool
	:rtype: None") TNaming_Scope;
		 TNaming_Scope (const Standard_Boolean WithValid);

		/****************** TNaming_Scope ******************/
		%feature("compactdefaultargs") TNaming_Scope;
		%feature("autodoc", "* create a scope with a map. WithValid = True.
	:param valid:
	:type valid: TDF_LabelMap
	:rtype: None") TNaming_Scope;
		 TNaming_Scope (TDF_LabelMap & valid);

		/****************** Unvalid ******************/
		%feature("compactdefaultargs") Unvalid;
		%feature("autodoc", ":param L:
	:type L: TDF_Label
	:rtype: None") Unvalid;
		void Unvalid (const TDF_Label & L);

		/****************** UnvalidChildren ******************/
		%feature("compactdefaultargs") UnvalidChildren;
		%feature("autodoc", ":param L:
	:type L: TDF_Label
	:param withroot: default value is Standard_True
	:type withroot: bool
	:rtype: None") UnvalidChildren;
		void UnvalidChildren (const TDF_Label & L,const Standard_Boolean withroot = Standard_True);

		/****************** Valid ******************/
		%feature("compactdefaultargs") Valid;
		%feature("autodoc", ":param L:
	:type L: TDF_Label
	:rtype: None") Valid;
		void Valid (const TDF_Label & L);

		/****************** ValidChildren ******************/
		%feature("compactdefaultargs") ValidChildren;
		%feature("autodoc", ":param L:
	:type L: TDF_Label
	:param withroot: default value is Standard_True
	:type withroot: bool
	:rtype: None") ValidChildren;
		void ValidChildren (const TDF_Label & L,const Standard_Boolean withroot = Standard_True);

		/****************** WithValid ******************/
		%feature("compactdefaultargs") WithValid;
		%feature("autodoc", ":rtype: bool") WithValid;
		Standard_Boolean WithValid ();

		/****************** WithValid ******************/
		%feature("compactdefaultargs") WithValid;
		%feature("autodoc", ":param mode:
	:type mode: bool
	:rtype: None") WithValid;
		void WithValid (const Standard_Boolean mode);

};


%extend TNaming_Scope {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class TNaming_Selector *
*************************/
class TNaming_Selector {
	public:
		/****************** Arguments ******************/
		%feature("compactdefaultargs") Arguments;
		%feature("autodoc", "* Returns the attribute list args. This list contains the named shape on which the topological naming was built.
	:param args:
	:type args: TDF_AttributeMap
	:rtype: None") Arguments;
		void Arguments (TDF_AttributeMap & args);

		/****************** IsIdentified ******************/
		%feature("compactdefaultargs") IsIdentified;
		%feature("autodoc", "* To know if a shape is already identified (not selected) ======================================================= //! The label access defines the point of access to the data framework. selection is the shape for which we want to know whether it is identified or not. If true, NS is returned as the identity of selection. If Geometry is true, NS will be the named shape containing the first appearance of selection and not any other shape. In other words, selection must be the only shape stored in NS.
	:param access:
	:type access: TDF_Label
	:param selection:
	:type selection: TopoDS_Shape
	:param NS:
	:type NS: TNaming_NamedShape
	:param Geometry: default value is Standard_False
	:type Geometry: bool
	:rtype: bool") IsIdentified;
		static Standard_Boolean IsIdentified (const TDF_Label & access,const TopoDS_Shape & selection,opencascade::handle<TNaming_NamedShape> & NS,const Standard_Boolean Geometry = Standard_False);

		/****************** NamedShape ******************/
		%feature("compactdefaultargs") NamedShape;
		%feature("autodoc", "* Returns the NamedShape build or under construction, which contains the topological naming..
	:rtype: opencascade::handle<TNaming_NamedShape>") NamedShape;
		opencascade::handle<TNaming_NamedShape> NamedShape ();

		/****************** Select ******************/
		%feature("compactdefaultargs") Select;
		%feature("autodoc", "* Creates a topological naming on the label aLabel given as an argument at construction time. If successful, the shape Selection - found in the shape Context - is now identified in the named shape returned in NamedShape. If Geometry is true, NamedShape contains the first appearance of Selection. This syntax is more robust than the previous syntax for this method.
	:param Selection:
	:type Selection: TopoDS_Shape
	:param Context:
	:type Context: TopoDS_Shape
	:param Geometry: default value is Standard_False
	:type Geometry: bool
	:param KeepOrientatation: default value is Standard_False
	:type KeepOrientatation: bool
	:rtype: bool") Select;
		Standard_Boolean Select (const TopoDS_Shape & Selection,const TopoDS_Shape & Context,const Standard_Boolean Geometry = Standard_False,const Standard_Boolean KeepOrientatation = Standard_False);

		/****************** Select ******************/
		%feature("compactdefaultargs") Select;
		%feature("autodoc", "* Creates a topological naming on the label aLabel given as an argument at construction time. If successful, the shape Selection is now identified in the named shape returned in NamedShape. If Geometry is true, NamedShape contains the first appearance of Selection.
	:param Selection:
	:type Selection: TopoDS_Shape
	:param Geometry: default value is Standard_False
	:type Geometry: bool
	:param KeepOrientatation: default value is Standard_False
	:type KeepOrientatation: bool
	:rtype: bool") Select;
		Standard_Boolean Select (const TopoDS_Shape & Selection,const Standard_Boolean Geometry = Standard_False,const Standard_Boolean KeepOrientatation = Standard_False);

		/****************** Solve ******************/
		%feature("compactdefaultargs") Solve;
		%feature("autodoc", "* Updates the topological naming on the label aLabel given as an argument at construction time. The underlying shape returned in the method NamedShape is updated. To read this shape, use the method TNaming_Tool::GetShape
	:param Valid:
	:type Valid: TDF_LabelMap
	:rtype: bool") Solve;
		Standard_Boolean Solve (TDF_LabelMap & Valid);

		/****************** TNaming_Selector ******************/
		%feature("compactdefaultargs") TNaming_Selector;
		%feature("autodoc", "* Create a selector on this label to select a shape. ==================
	:param aLabel:
	:type aLabel: TDF_Label
	:rtype: None") TNaming_Selector;
		 TNaming_Selector (const TDF_Label & aLabel);

};


%extend TNaming_Selector {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class TNaming_ShapesSet *
**************************/
%nodefaultctor TNaming_ShapesSet;
class TNaming_ShapesSet {
	public:
		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "* Adds the Shape <S>
	:param S:
	:type S: TopoDS_Shape
	:rtype: bool") Add;
		Standard_Boolean Add (const TopoDS_Shape & S);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "* Adds the shapes contained in <Shapes>.
	:param Shapes:
	:type Shapes: TNaming_ShapesSet
	:rtype: None") Add;
		void Add (const TNaming_ShapesSet & Shapes);

		/****************** ChangeMap ******************/
		%feature("compactdefaultargs") ChangeMap;
		%feature("autodoc", ":rtype: TopTools_MapOfShape") ChangeMap;
		TopTools_MapOfShape & ChangeMap ();

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "* Removes all Shapes
	:rtype: None") Clear;
		void Clear ();

		/****************** Contains ******************/
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "* Returns True if <S> is in <self>
	:param S:
	:type S: TopoDS_Shape
	:rtype: bool") Contains;
		Standard_Boolean Contains (const TopoDS_Shape & S);

		/****************** Filter ******************/
		%feature("compactdefaultargs") Filter;
		%feature("autodoc", "* Erases in <self> the shapes not contained in <Shapes>
	:param Shapes:
	:type Shapes: TNaming_ShapesSet
	:rtype: None") Filter;
		void Filter (const TNaming_ShapesSet & Shapes);

		/****************** IsEmpty ******************/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", ":rtype: bool") IsEmpty;
		Standard_Boolean IsEmpty ();

		/****************** Map ******************/
		%feature("compactdefaultargs") Map;
		%feature("autodoc", ":rtype: TopTools_MapOfShape") Map;
		const TopTools_MapOfShape & Map ();

		/****************** NbShapes ******************/
		%feature("compactdefaultargs") NbShapes;
		%feature("autodoc", ":rtype: int") NbShapes;
		Standard_Integer NbShapes ();

		/****************** Remove ******************/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "* Removes <S> in <self>.
	:param S:
	:type S: TopoDS_Shape
	:rtype: bool") Remove;
		Standard_Boolean Remove (const TopoDS_Shape & S);

		/****************** Remove ******************/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "* Removes in <self> the shapes contained in <Shapes>
	:param Shapes:
	:type Shapes: TNaming_ShapesSet
	:rtype: None") Remove;
		void Remove (const TNaming_ShapesSet & Shapes);

		/****************** TNaming_ShapesSet ******************/
		%feature("compactdefaultargs") TNaming_ShapesSet;
		%feature("autodoc", ":rtype: None") TNaming_ShapesSet;
		 TNaming_ShapesSet ();

		/****************** TNaming_ShapesSet ******************/
		%feature("compactdefaultargs") TNaming_ShapesSet;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:param Type: default value is TopAbs_SHAPE
	:type Type: TopAbs_ShapeEnum
	:rtype: None") TNaming_ShapesSet;
		 TNaming_ShapesSet (const TopoDS_Shape & S,const TopAbs_ShapeEnum Type = TopAbs_SHAPE);

};


%extend TNaming_ShapesSet {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************
* class TNaming_Tool *
*********************/
class TNaming_Tool {
	public:
		/****************** Collect ******************/
		%feature("compactdefaultargs") Collect;
		%feature("autodoc", ":param NS:
	:type NS: TNaming_NamedShape
	:param Labels:
	:type Labels: TNaming_MapOfNamedShape
	:param OnlyModif: default value is Standard_True
	:type OnlyModif: bool
	:rtype: void") Collect;
		static void Collect (const opencascade::handle<TNaming_NamedShape> & NS,TNaming_MapOfNamedShape & Labels,const Standard_Boolean OnlyModif = Standard_True);

		/****************** CurrentNamedShape ******************/
		%feature("compactdefaultargs") CurrentNamedShape;
		%feature("autodoc", "* Returns the NamedShape of the last Modification of <NS>. This shape is identified by a label.
	:param NS:
	:type NS: TNaming_NamedShape
	:param Updated:
	:type Updated: TDF_LabelMap
	:rtype: opencascade::handle<TNaming_NamedShape>") CurrentNamedShape;
		static opencascade::handle<TNaming_NamedShape> CurrentNamedShape (const opencascade::handle<TNaming_NamedShape> & NS,const TDF_LabelMap & Updated);

		/****************** CurrentNamedShape ******************/
		%feature("compactdefaultargs") CurrentNamedShape;
		%feature("autodoc", "* Returns NamedShape the last Modification of <NS>.
	:param NS:
	:type NS: TNaming_NamedShape
	:rtype: opencascade::handle<TNaming_NamedShape>") CurrentNamedShape;
		static opencascade::handle<TNaming_NamedShape> CurrentNamedShape (const opencascade::handle<TNaming_NamedShape> & NS);

		/****************** CurrentShape ******************/
		%feature("compactdefaultargs") CurrentShape;
		%feature("autodoc", "* Returns the last Modification of <NS>. Returns the shape CurrentShape contained in the named shape attribute NS. CurrentShape is the current state of the entities if they have been modified in other attributes of the same data structure. Each call to this function creates a new compound.
	:param NS:
	:type NS: TNaming_NamedShape
	:rtype: TopoDS_Shape") CurrentShape;
		static TopoDS_Shape CurrentShape (const opencascade::handle<TNaming_NamedShape> & NS);

		/****************** CurrentShape ******************/
		%feature("compactdefaultargs") CurrentShape;
		%feature("autodoc", "* Returns the shape CurrentShape contained in the named shape attribute NS, and present in the updated attribute map Updated. CurrentShape is the current state of the entities if they have been modified in other attributes of the same data structure. Each call to this function creates a new compound. Warning Only the contents of Updated are searched.R
	:param NS:
	:type NS: TNaming_NamedShape
	:param Updated:
	:type Updated: TDF_LabelMap
	:rtype: TopoDS_Shape") CurrentShape;
		static TopoDS_Shape CurrentShape (const opencascade::handle<TNaming_NamedShape> & NS,const TDF_LabelMap & Updated);

		/****************** FindShape ******************/
		%feature("compactdefaultargs") FindShape;
		%feature("autodoc", "* Returns the current shape (a Wire or a Shell) built (in the data framework) from the the shapes of the argument named shape. It is used for IDENTITY name type computation.
	:param Valid:
	:type Valid: TDF_LabelMap
	:param Forbiden:
	:type Forbiden: TDF_LabelMap
	:param Arg:
	:type Arg: TNaming_NamedShape
	:param S:
	:type S: TopoDS_Shape
	:rtype: void") FindShape;
		static void FindShape (const TDF_LabelMap & Valid,const TDF_LabelMap & Forbiden,const opencascade::handle<TNaming_NamedShape> & Arg,TopoDS_Shape & S);

		/****************** GeneratedShape ******************/
		%feature("compactdefaultargs") GeneratedShape;
		%feature("autodoc", "* Returns the shape generated from S or by a modification of S and contained in the named shape Generation.
	:param S:
	:type S: TopoDS_Shape
	:param Generation:
	:type Generation: TNaming_NamedShape
	:rtype: TopoDS_Shape") GeneratedShape;
		static TopoDS_Shape GeneratedShape (const TopoDS_Shape & S,const opencascade::handle<TNaming_NamedShape> & Generation);

		/****************** GetShape ******************/
		%feature("compactdefaultargs") GetShape;
		%feature("autodoc", "* Returns the entities stored in the named shape attribute NS. If there is only one old-new pair, the new shape is returned. Otherwise, a Compound is returned. This compound is made out of all the new shapes found. Each call to this function creates a new compound.
	:param NS:
	:type NS: TNaming_NamedShape
	:rtype: TopoDS_Shape") GetShape;
		static TopoDS_Shape GetShape (const opencascade::handle<TNaming_NamedShape> & NS);

		/****************** HasLabel ******************/
		%feature("compactdefaultargs") HasLabel;
		%feature("autodoc", "* Returns True if <aShape> appears under a label.(DP)
	:param access:
	:type access: TDF_Label
	:param aShape:
	:type aShape: TopoDS_Shape
	:rtype: bool") HasLabel;
		static Standard_Boolean HasLabel (const TDF_Label & access,const TopoDS_Shape & aShape);

		/****************** InitialShape ******************/
		%feature("compactdefaultargs") InitialShape;
		%feature("autodoc", "* Returns the shape created from the shape aShape contained in the attribute anAcces.
	:param aShape:
	:type aShape: TopoDS_Shape
	:param anAcces:
	:type anAcces: TDF_Label
	:param Labels:
	:type Labels: TDF_LabelList
	:rtype: TopoDS_Shape") InitialShape;
		static TopoDS_Shape InitialShape (const TopoDS_Shape & aShape,const TDF_Label & anAcces,TDF_LabelList & Labels);

		/****************** Label ******************/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "* Returns the label of the first apparition of <aShape>. Transdef is a value of the transaction of the first apparition of <aShape>.
	:param access:
	:type access: TDF_Label
	:param aShape:
	:type aShape: TopoDS_Shape
	:param TransDef:
	:type TransDef: int
	:rtype: TDF_Label") Label;
		static TDF_Label Label (const TDF_Label & access,const TopoDS_Shape & aShape,Standard_Integer &OutValue);

		/****************** NamedShape ******************/
		%feature("compactdefaultargs") NamedShape;
		%feature("autodoc", "* Returns the named shape attribute defined by the shape aShape and the label anAccess. This attribute is returned as a new shape. You call this function, if you need to create a topological attribute for existing data. Example class MyPkg_MyClass { public: Standard_Boolean SameEdge(const opencascade::handle<OCafTest_Line>& , const opencascade::handle<CafTest_Line>& ); }; //! Standard_Boolean MyPkg_MyClass::SameEdge (const opencascade::handle<OCafTest_Line>& L1 const opencascade::handle<OCafTest_Line>& L2) { opencascade::handle<TNaming_NamedShape> NS1 = L1->NamedShape(); opencascade::handle<TNaming_NamedShape> NS2 = L2->NamedShape(); //! return BRepTools::Compare(NS1->Get(),NS2->Get()); } In the example above, the function SameEdge is created to compare the edges having two lines for geometric supports. If these edges are found by BRepTools::Compare to be within the same tolerance, they are considered to be the same. Warning To avoid sharing of names, a SELECTED attribute will not be returned. Sharing of names makes it harder to manage the data structure. When the user of the name is removed, for example, it is difficult to know whether the name should be destroyed.
	:param aShape:
	:type aShape: TopoDS_Shape
	:param anAcces:
	:type anAcces: TDF_Label
	:rtype: opencascade::handle<TNaming_NamedShape>") NamedShape;
		static opencascade::handle<TNaming_NamedShape> NamedShape (const TopoDS_Shape & aShape,const TDF_Label & anAcces);

		/****************** OriginalShape ******************/
		%feature("compactdefaultargs") OriginalShape;
		%feature("autodoc", "* Returns the shape contained as OldShape in <NS>
	:param NS:
	:type NS: TNaming_NamedShape
	:rtype: TopoDS_Shape") OriginalShape;
		static TopoDS_Shape OriginalShape (const opencascade::handle<TNaming_NamedShape> & NS);

		/****************** ValidUntil ******************/
		%feature("compactdefaultargs") ValidUntil;
		%feature("autodoc", "* Returns the last transaction where the creation of S is valid.
	:param access:
	:type access: TDF_Label
	:param S:
	:type S: TopoDS_Shape
	:rtype: int") ValidUntil;
		static Standard_Integer ValidUntil (const TDF_Label & access,const TopoDS_Shape & S);

};


%extend TNaming_Tool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class TNaming_TranslateTool *
******************************/
%nodefaultctor TNaming_TranslateTool;
class TNaming_TranslateTool : public Standard_Transient {
	public:
		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", ":param S1:
	:type S1: TopoDS_Shape
	:param S2:
	:type S2: TopoDS_Shape
	:rtype: None") Add;
		void Add (TopoDS_Shape & S1,const TopoDS_Shape & S2);

		/****************** MakeCompSolid ******************/
		%feature("compactdefaultargs") MakeCompSolid;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:rtype: None") MakeCompSolid;
		void MakeCompSolid (TopoDS_Shape & S);

		/****************** MakeCompound ******************/
		%feature("compactdefaultargs") MakeCompound;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:rtype: None") MakeCompound;
		void MakeCompound (TopoDS_Shape & S);

		/****************** MakeEdge ******************/
		%feature("compactdefaultargs") MakeEdge;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:rtype: None") MakeEdge;
		void MakeEdge (TopoDS_Shape & S);

		/****************** MakeFace ******************/
		%feature("compactdefaultargs") MakeFace;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:rtype: None") MakeFace;
		void MakeFace (TopoDS_Shape & S);

		/****************** MakeShell ******************/
		%feature("compactdefaultargs") MakeShell;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:rtype: None") MakeShell;
		void MakeShell (TopoDS_Shape & S);

		/****************** MakeSolid ******************/
		%feature("compactdefaultargs") MakeSolid;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:rtype: None") MakeSolid;
		void MakeSolid (TopoDS_Shape & S);

		/****************** MakeVertex ******************/
		%feature("compactdefaultargs") MakeVertex;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:rtype: None") MakeVertex;
		void MakeVertex (TopoDS_Shape & S);

		/****************** MakeWire ******************/
		%feature("compactdefaultargs") MakeWire;
		%feature("autodoc", ":param S:
	:type S: TopoDS_Shape
	:rtype: None") MakeWire;
		void MakeWire (TopoDS_Shape & S);

		/****************** UpdateEdge ******************/
		%feature("compactdefaultargs") UpdateEdge;
		%feature("autodoc", ":param S1:
	:type S1: TopoDS_Shape
	:param S2:
	:type S2: TopoDS_Shape
	:param M:
	:type M: TColStd_IndexedDataMapOfTransientTransient
	:rtype: None") UpdateEdge;
		void UpdateEdge (const TopoDS_Shape & S1,TopoDS_Shape & S2,TColStd_IndexedDataMapOfTransientTransient & M);

		/****************** UpdateFace ******************/
		%feature("compactdefaultargs") UpdateFace;
		%feature("autodoc", ":param S1:
	:type S1: TopoDS_Shape
	:param S2:
	:type S2: TopoDS_Shape
	:param M:
	:type M: TColStd_IndexedDataMapOfTransientTransient
	:rtype: None") UpdateFace;
		void UpdateFace (const TopoDS_Shape & S1,TopoDS_Shape & S2,TColStd_IndexedDataMapOfTransientTransient & M);

		/****************** UpdateShape ******************/
		%feature("compactdefaultargs") UpdateShape;
		%feature("autodoc", ":param S1:
	:type S1: TopoDS_Shape
	:param S2:
	:type S2: TopoDS_Shape
	:rtype: None") UpdateShape;
		void UpdateShape (const TopoDS_Shape & S1,TopoDS_Shape & S2);

		/****************** UpdateVertex ******************/
		%feature("compactdefaultargs") UpdateVertex;
		%feature("autodoc", ":param S1:
	:type S1: TopoDS_Shape
	:param S2:
	:type S2: TopoDS_Shape
	:param M:
	:type M: TColStd_IndexedDataMapOfTransientTransient
	:rtype: None") UpdateVertex;
		void UpdateVertex (const TopoDS_Shape & S1,TopoDS_Shape & S2,TColStd_IndexedDataMapOfTransientTransient & M);

};


%make_alias(TNaming_TranslateTool)

%extend TNaming_TranslateTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class TNaming_Translator *
***************************/
%nodefaultctor TNaming_Translator;
class TNaming_Translator {
	public:
		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", ":param aShape:
	:type aShape: TopoDS_Shape
	:rtype: None") Add;
		void Add (const TopoDS_Shape & aShape);

		/****************** Copied ******************/
		%feature("compactdefaultargs") Copied;
		%feature("autodoc", "* returns copied shape
	:param aShape:
	:type aShape: TopoDS_Shape
	:rtype: TopoDS_Shape") Copied;
		const TopoDS_Shape Copied (const TopoDS_Shape & aShape);

		/****************** Copied ******************/
		%feature("compactdefaultargs") Copied;
		%feature("autodoc", "* returns DataMap of results; (shape <-> copied shape)
	:rtype: TopTools_DataMapOfShapeShape") Copied;
		const TopTools_DataMapOfShapeShape & Copied ();

		/****************** DumpMap ******************/
		%feature("compactdefaultargs") DumpMap;
		%feature("autodoc", ":param isWrite: default value is Standard_False
	:type isWrite: bool
	:rtype: None") DumpMap;
		void DumpMap (const Standard_Boolean isWrite = Standard_False);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", ":rtype: bool") IsDone;
		Standard_Boolean IsDone ();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", ":rtype: None") Perform;
		void Perform ();

		/****************** TNaming_Translator ******************/
		%feature("compactdefaultargs") TNaming_Translator;
		%feature("autodoc", ":rtype: None") TNaming_Translator;
		 TNaming_Translator ();

};


%extend TNaming_Translator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class TNaming_UsedShapes *
***************************/
%nodefaultctor TNaming_UsedShapes;
class TNaming_UsedShapes : public TDF_Attribute {
	public:
		/****************** AfterUndo ******************/
		%feature("compactdefaultargs") AfterUndo;
		%feature("autodoc", "* Something to do after applying <anAttDelta>.
	:param anAttDelta:
	:type anAttDelta: TDF_AttributeDelta
	:param forceIt: default value is Standard_False
	:type forceIt: bool
	:rtype: bool") AfterUndo;
		virtual Standard_Boolean AfterUndo (const opencascade::handle<TDF_AttributeDelta> & anAttDelta,const Standard_Boolean forceIt = Standard_False);

		/****************** BackupCopy ******************/
		%feature("compactdefaultargs") BackupCopy;
		%feature("autodoc", "* Copies the attribute contents into a new other attribute. It is used by Backup().
	:rtype: opencascade::handle<TDF_Attribute>") BackupCopy;
		virtual opencascade::handle<TDF_Attribute> BackupCopy ();

		/****************** BeforeRemoval ******************/
		%feature("compactdefaultargs") BeforeRemoval;
		%feature("autodoc", "* Clears the table.
	:rtype: void") BeforeRemoval;
		virtual void BeforeRemoval ();

		/****************** DeltaOnAddition ******************/
		%feature("compactdefaultargs") DeltaOnAddition;
		%feature("autodoc", "* this method returns a null handle (no delta).
	:rtype: opencascade::handle<TDF_DeltaOnAddition>") DeltaOnAddition;
		virtual opencascade::handle<TDF_DeltaOnAddition> DeltaOnAddition ();

		/****************** DeltaOnRemoval ******************/
		%feature("compactdefaultargs") DeltaOnRemoval;
		%feature("autodoc", "* this method returns a null handle (no delta).
	:rtype: opencascade::handle<TDF_DeltaOnRemoval>") DeltaOnRemoval;
		virtual opencascade::handle<TDF_DeltaOnRemoval> DeltaOnRemoval ();

		/****************** Destroy ******************/
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", ":rtype: None") Destroy;
		void Destroy ();


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        		/****************** GetID ******************/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "* Returns the ID: 2a96b614-ec8b-11d0-bee7-080009dc3333.
	:rtype: Standard_GUID") GetID;
		static const Standard_GUID & GetID ();

		/****************** ID ******************/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "* Returns the ID of the attribute.
	:rtype: Standard_GUID") ID;
		const Standard_GUID & ID ();

		/****************** Map ******************/
		%feature("compactdefaultargs") Map;
		%feature("autodoc", ":rtype: TNaming_DataMapOfShapePtrRefShape") Map;
		TNaming_DataMapOfShapePtrRefShape & Map ();

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "* Returns an new empty attribute from the good end type. It is used by the copy algorithm.
	:rtype: opencascade::handle<TDF_Attribute>") NewEmpty;
		virtual opencascade::handle<TDF_Attribute> NewEmpty ();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "* This method is different from the 'Copy' one, because it is used when copying an attribute from a source structure into a target structure. This method pastes the current attribute to the label corresponding to the insertor. The pasted attribute may be a brand new one or a new version of the previous one.
	:param intoAttribute:
	:type intoAttribute: TDF_Attribute
	:param aRelocTationable:
	:type aRelocTationable: TDF_RelocationTable
	:rtype: void") Paste;
		virtual void Paste (const opencascade::handle<TDF_Attribute> & intoAttribute,const opencascade::handle<TDF_RelocationTable> & aRelocTationable);

		/****************** References ******************/
		%feature("compactdefaultargs") References;
		%feature("autodoc", "* Adds the directly referenced attributes and labels to <aDataSet>. 'Directly' means we have only to look at the first level of references. //! For this, use only the AddLabel() & AddAttribute() from DataSet and do not try to modify information previously stored in <aDataSet>.
	:param aDataSet:
	:type aDataSet: TDF_DataSet
	:rtype: void") References;
		virtual void References (const opencascade::handle<TDF_DataSet> & aDataSet);

		/****************** Restore ******************/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "* Restores the contents from <anAttribute> into this one. It is used when aborting a transaction.
	:param anAttribute:
	:type anAttribute: TDF_Attribute
	:rtype: void") Restore;
		virtual void Restore (const opencascade::handle<TDF_Attribute> & anAttribute);

};


%make_alias(TNaming_UsedShapes)

%extend TNaming_UsedShapes {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
