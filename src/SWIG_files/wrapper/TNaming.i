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
%define TNAMINGDOCSTRING
"TNaming module, see official documentation at
https://dev.opencascade.org/doc/occt-7.8.0/refman/html/package_tnaming.html"
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
%include ../common/EnumTemplates.i
%include ../common/Operators.i
%include ../common/OccHandle.i
%include ../common/IOStream.i
%include ../common/ArrayMacros.i


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

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

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

/* python proxy classes for enums */
%pythoncode {

class TNaming_Evolution(IntEnum):
	TNaming_PRIMITIVE = 0
	TNaming_GENERATED = 1
	TNaming_MODIFY = 2
	TNaming_DELETE = 3
	TNaming_REPLACE = 4
	TNaming_SELECTED = 5
TNaming_PRIMITIVE = TNaming_Evolution.TNaming_PRIMITIVE
TNaming_GENERATED = TNaming_Evolution.TNaming_GENERATED
TNaming_MODIFY = TNaming_Evolution.TNaming_MODIFY
TNaming_DELETE = TNaming_Evolution.TNaming_DELETE
TNaming_REPLACE = TNaming_Evolution.TNaming_REPLACE
TNaming_SELECTED = TNaming_Evolution.TNaming_SELECTED

class TNaming_NameType(IntEnum):
	TNaming_UNKNOWN = 0
	TNaming_IDENTITY = 1
	TNaming_MODIFUNTIL = 2
	TNaming_GENERATION = 3
	TNaming_INTERSECTION = 4
	TNaming_UNION = 5
	TNaming_SUBSTRACTION = 6
	TNaming_CONSTSHAPE = 7
	TNaming_FILTERBYNEIGHBOURGS = 8
	TNaming_ORIENTATION = 9
	TNaming_WIREIN = 10
	TNaming_SHELLIN = 11
TNaming_UNKNOWN = TNaming_NameType.TNaming_UNKNOWN
TNaming_IDENTITY = TNaming_NameType.TNaming_IDENTITY
TNaming_MODIFUNTIL = TNaming_NameType.TNaming_MODIFUNTIL
TNaming_GENERATION = TNaming_NameType.TNaming_GENERATION
TNaming_INTERSECTION = TNaming_NameType.TNaming_INTERSECTION
TNaming_UNION = TNaming_NameType.TNaming_UNION
TNaming_SUBSTRACTION = TNaming_NameType.TNaming_SUBSTRACTION
TNaming_CONSTSHAPE = TNaming_NameType.TNaming_CONSTSHAPE
TNaming_FILTERBYNEIGHBOURGS = TNaming_NameType.TNaming_FILTERBYNEIGHBOURGS
TNaming_ORIENTATION = TNaming_NameType.TNaming_ORIENTATION
TNaming_WIREIN = TNaming_NameType.TNaming_WIREIN
TNaming_SHELLIN = TNaming_NameType.TNaming_SHELLIN
};
/* end python proxy for enums */

/* handles */
%wrap_handle(TNaming_DeltaOnModification)
%wrap_handle(TNaming_DeltaOnRemoval)
%wrap_handle(TNaming_NamedShape)
%wrap_handle(TNaming_Naming)
%wrap_handle(TNaming_TranslateTool)
%wrap_handle(TNaming_UsedShapes)
/* end handles declaration */

/* templates */
%template(TNaming_DataMapOfShapeMapOfShape) NCollection_DataMap<TopoDS_Shape,TNaming_MapOfShape>;
%template(TNaming_DataMapOfShapePtrRefShape) NCollection_DataMap<TopoDS_Shape,TNaming_PtrRefShape,TopTools_ShapeMapHasher>;
%template(TNaming_DataMapOfShapeShapesSet) NCollection_DataMap<TopoDS_Shape,TNaming_ShapesSet,TopTools_ShapeMapHasher>;
%template(TNaming_ListIteratorOfListOfIndexedDataMapOfShapeListOfShape) NCollection_TListIterator<TopTools_IndexedDataMapOfShapeListOfShape>;
%template(TNaming_ListIteratorOfListOfMapOfShape) NCollection_TListIterator<TopTools_MapOfShape>;
%template(TNaming_ListIteratorOfListOfNamedShape) NCollection_TListIterator<opencascade::handle<TNaming_NamedShape>>;
%template(TNaming_ListOfIndexedDataMapOfShapeListOfShape) NCollection_List<TopTools_IndexedDataMapOfShapeListOfShape>;

%extend NCollection_List<TopTools_IndexedDataMapOfShapeListOfShape> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(TNaming_ListOfMapOfShape) NCollection_List<TopTools_MapOfShape>;

%extend NCollection_List<TopTools_MapOfShape> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(TNaming_ListOfNamedShape) NCollection_List<opencascade::handle<TNaming_NamedShape>>;

%extend NCollection_List<opencascade::handle<TNaming_NamedShape>> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(TNaming_MapOfNamedShape) NCollection_Map<opencascade::handle<TNaming_NamedShape>>;
%template(TNaming_MapOfShape) NCollection_Map<TopoDS_Shape>;
/* end templates declaration */

/* typedefs */
typedef TNaming_DataMapOfShapeMapOfShape::Iterator TNaming_DataMapIteratorOfDataMapOfShapeMapOfShape;
typedef NCollection_DataMap<TopoDS_Shape, TNaming_PtrRefShape, TopTools_ShapeMapHasher>::Iterator TNaming_DataMapIteratorOfDataMapOfShapePtrRefShape;
typedef NCollection_DataMap<TopoDS_Shape, TNaming_ShapesSet, TopTools_ShapeMapHasher>::Iterator TNaming_DataMapIteratorOfDataMapOfShapeShapesSet;
typedef NCollection_DataMap<TopoDS_Shape, TNaming_MapOfShape> TNaming_DataMapOfShapeMapOfShape;
typedef NCollection_DataMap<TopoDS_Shape, TNaming_PtrRefShape, TopTools_ShapeMapHasher> TNaming_DataMapOfShapePtrRefShape;
typedef NCollection_DataMap<TopoDS_Shape, TNaming_ShapesSet, TopTools_ShapeMapHasher> TNaming_DataMapOfShapeShapesSet;
typedef NCollection_List<TopTools_IndexedDataMapOfShapeListOfShape>::Iterator TNaming_ListIteratorOfListOfIndexedDataMapOfShapeListOfShape;
typedef NCollection_List<TopTools_MapOfShape>::Iterator TNaming_ListIteratorOfListOfMapOfShape;
typedef NCollection_List<opencascade::handle<TNaming_NamedShape>>::Iterator TNaming_ListIteratorOfListOfNamedShape;
typedef NCollection_List<TopTools_IndexedDataMapOfShapeListOfShape> TNaming_ListOfIndexedDataMapOfShapeListOfShape;
typedef NCollection_List<TopTools_MapOfShape> TNaming_ListOfMapOfShape;
typedef NCollection_List<opencascade::handle<TNaming_NamedShape>> TNaming_ListOfNamedShape;
typedef NCollection_Map<opencascade::handle<TNaming_NamedShape>>::Iterator TNaming_MapIteratorOfMapOfNamedShape;
typedef TNaming_MapOfShape::Iterator TNaming_MapIteratorOfMapOfShape;
typedef NCollection_Map<opencascade::handle<TNaming_NamedShape>> TNaming_MapOfNamedShape;
typedef NCollection_Map<TopoDS_Shape> TNaming_MapOfShape;
typedef TNaming_NamedShape * TNaming_PtrAttribute;
typedef TNaming_Node * TNaming_PtrNode;
typedef TNaming_RefShape * TNaming_PtrRefShape;
/* end typedefs declaration */

/****************
* class TNaming *
****************/
%rename(tnaming) TNaming;
class TNaming {
	public:
		/****** TNaming::ChangeShapes ******/
		/****** md5 signature: 35b83a9835df68d47b84e7b0a4cc67d1 ******/
		%feature("compactdefaultargs") ChangeShapes;
		%feature("autodoc", "
Parameters
----------
label: TDF_Label
M: TopTools_DataMapOfShapeShape

Return
-------
None

Description
-----------
Remplace les shapes du label et des sous-labels par des copies.
") ChangeShapes;
		static void ChangeShapes(const TDF_Label & label, TopTools_DataMapOfShapeShape & M);

		/****** TNaming::Displace ******/
		/****** md5 signature: f1e75faa1cad00c7f25ecf48dd5954ba ******/
		%feature("compactdefaultargs") Displace;
		%feature("autodoc", "
Parameters
----------
label: TDF_Label
aLocation: TopLoc_Location
WithOld: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Application de la Location sur les shapes du label et de ses sous labels.
") Displace;
		static void Displace(const TDF_Label & label, const TopLoc_Location & aLocation, const Standard_Boolean WithOld = Standard_True);

		/****** TNaming::FindUniqueContext ******/
		/****** md5 signature: a840eb0c1506c6b14b7841bb92bb32c8 ******/
		%feature("compactdefaultargs") FindUniqueContext;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
Context: TopoDS_Shape

Return
-------
TopoDS_Shape

Description
-----------
Find unique context of shape <S>.
") FindUniqueContext;
		static TopoDS_Shape FindUniqueContext(const TopoDS_Shape & S, const TopoDS_Shape & Context);

		/****** TNaming::FindUniqueContextSet ******/
		/****** md5 signature: f0bb2cb6f08fe13f1ef17596577f529e ******/
		%feature("compactdefaultargs") FindUniqueContextSet;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
Context: TopoDS_Shape
Arr: TopTools_HArray1OfShape

Return
-------
TopoDS_Shape

Description
-----------
Find unique context of shape <S>,which is pure concatenation of atomic shapes (Compound). The result is concatenation of single contexts.
") FindUniqueContextSet;
		static TopoDS_Shape FindUniqueContextSet(const TopoDS_Shape & S, const TopoDS_Shape & Context, opencascade::handle<TopTools_HArray1OfShape> & Arr);

		/****** TNaming::IDList ******/
		/****** md5 signature: 97de0b35f4f6abc04a631c65d32bacc4 ******/
		%feature("compactdefaultargs") IDList;
		%feature("autodoc", "
Parameters
----------
anIDList: TDF_IDList

Return
-------
None

Description
-----------
Appends to <anIDList> the list of the attributes IDs of this package. CAUTION: <anIDList> is NOT cleared before use.
") IDList;
		static void IDList(TDF_IDList & anIDList);

		/****** TNaming::MakeShape ******/
		/****** md5 signature: 630d783504c360aaf8c5e4c4900911e5 ******/
		%feature("compactdefaultargs") MakeShape;
		%feature("autodoc", "
Parameters
----------
MS: TopTools_MapOfShape

Return
-------
TopoDS_Shape

Description
-----------
Builds shape from map content.
") MakeShape;
		static TopoDS_Shape MakeShape(const TopTools_MapOfShape & MS);

		/****** TNaming::OuterShell ******/
		/****** md5 signature: 7b4f5582736299aaaff85491e430e183 ******/
		%feature("compactdefaultargs") OuterShell;
		%feature("autodoc", "
Parameters
----------
theSolid: TopoDS_Solid
theShell: TopoDS_Shell

Return
-------
bool

Description
-----------
Returns True if outer Shell is found and the found shell in <theShell>. Print of TNaming enumeration =============================.
") OuterShell;
		static Standard_Boolean OuterShell(const TopoDS_Solid & theSolid, TopoDS_Shell & theShell);

		/****** TNaming::OuterWire ******/
		/****** md5 signature: dd33967d99fbf8929938e36ba3c08e55 ******/
		%feature("compactdefaultargs") OuterWire;
		%feature("autodoc", "
Parameters
----------
theFace: TopoDS_Face
theWire: TopoDS_Wire

Return
-------
bool

Description
-----------
Returns True if outer wire is found and the found wire in <theWire>.
") OuterWire;
		static Standard_Boolean OuterWire(const TopoDS_Face & theFace, TopoDS_Wire & theWire);

		/****** TNaming::Print ******/
		/****** md5 signature: 2b639b8df3fe00401374dd95e415224e ******/
		%feature("compactdefaultargs") Print;
		%feature("autodoc", "
Parameters
----------
EVOL: TNaming_Evolution

Return
-------
S: Standard_OStream

Description
-----------
Prints the evolution <EVOL> as a String on the Stream <S> and returns <S>.
") Print;
		static Standard_OStream & Print(const TNaming_Evolution EVOL, std::ostream &OutValue);

		/****** TNaming::Print ******/
		/****** md5 signature: 0086f15e63801a19d591d96a9d20bb2a ******/
		%feature("compactdefaultargs") Print;
		%feature("autodoc", "
Parameters
----------
NAME: TNaming_NameType

Return
-------
S: Standard_OStream

Description
-----------
Prints the name of name type <NAME> as a String on the Stream <S> and returns <S>.
") Print;
		static Standard_OStream & Print(const TNaming_NameType NAME, std::ostream &OutValue);

		/****** TNaming::Print ******/
		/****** md5 signature: acadfcdd30dbbb74b400e87246c92ac0 ******/
		%feature("compactdefaultargs") Print;
		%feature("autodoc", "
Parameters
----------
ACCESS: TDF_Label

Return
-------
S: Standard_OStream

Description
-----------
Prints the content of UsedShapes private attribute as a String Table on the Stream <S> and returns <S>.
") Print;
		static Standard_OStream & Print(const TDF_Label & ACCESS, std::ostream &OutValue);

		/****** TNaming::Replicate ******/
		/****** md5 signature: b05536a641bcb5721eea10c9d85c5058 ******/
		%feature("compactdefaultargs") Replicate;
		%feature("autodoc", "
Parameters
----------
NS: TNaming_NamedShape
T: gp_Trsf
L: TDF_Label

Return
-------
None

Description
-----------
Replicates the named shape with the transformation <T> on the label <L> (and sub-labels if necessary) (TNaming_GENERATED is set).
") Replicate;
		static void Replicate(const opencascade::handle<TNaming_NamedShape> & NS, const gp_Trsf & T, const TDF_Label & L);

		/****** TNaming::Replicate ******/
		/****** md5 signature: be82fd2c07d5a19a591067e18daf4896 ******/
		%feature("compactdefaultargs") Replicate;
		%feature("autodoc", "
Parameters
----------
SH: TopoDS_Shape
T: gp_Trsf
L: TDF_Label

Return
-------
None

Description
-----------
Replicates the shape with the transformation <T> on the label <L> (and sub-labels if necessary) (TNaming_GENERATED is set).
") Replicate;
		static void Replicate(const TopoDS_Shape & SH, const gp_Trsf & T, const TDF_Label & L);

		/****** TNaming::Substitute ******/
		/****** md5 signature: 7442a06309ab6a50aecfb1cf15c3cc98 ******/
		%feature("compactdefaultargs") Substitute;
		%feature("autodoc", "
Parameters
----------
labelsource: TDF_Label
labelcible: TDF_Label
mapOldNew: TopTools_DataMapOfShapeShape

Return
-------
None

Description
-----------
Subtituter les shapes sur les structures de source vers cible.
") Substitute;
		static void Substitute(const TDF_Label & labelsource, const TDF_Label & labelcible, TopTools_DataMapOfShapeShape & mapOldNew);

		/****** TNaming::SubstituteSShape ******/
		/****** md5 signature: da4f9bfab8e604d3c3824a7968ba3ba0 ******/
		%feature("compactdefaultargs") SubstituteSShape;
		%feature("autodoc", "
Parameters
----------
accesslabel: TDF_Label
From: TopoDS_Shape
To: TopoDS_Shape

Return
-------
bool

Description
-----------
Substitutes shape in source structure.
") SubstituteSShape;
		static Standard_Boolean SubstituteSShape(const TDF_Label & accesslabel, const TopoDS_Shape & From, TopoDS_Shape & To);

		/****** TNaming::Transform ******/
		/****** md5 signature: 974cbac4440c78b11585fb3e507cfca5 ******/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "
Parameters
----------
label: TDF_Label
aTransformation: gp_Trsf

Return
-------
None

Description
-----------
Application de la transformation sur les shapes du label et de ses sous labels. Warning: le remplacement du shape est fait dans tous les attributs qui le contiennent meme si ceux ci ne sont pas associees a des sous-labels de <Label>.
") Transform;
		static void Transform(const TDF_Label & label, const gp_Trsf & aTransformation);

		/****** TNaming::Update ******/
		/****** md5 signature: 69bc78ea7b332ad3a707e4597841ba51 ******/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "
Parameters
----------
label: TDF_Label
mapOldNew: TopTools_DataMapOfShapeShape

Return
-------
None

Description
-----------
Mise a jour des shapes du label et de ses fils en tenant compte des substitutions decrite par mapOldNew. //! Warning: le remplacement du shape est fait dans tous les attributs qui le contiennent meme si ceux ci ne sont pas associees a des sous-labels de <Label>.
") Update;
		static void Update(const TDF_Label & label, TopTools_DataMapOfShapeShape & mapOldNew);

};


%extend TNaming {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class TNaming_Builder *
************************/
class TNaming_Builder {
	public:
		/****** TNaming_Builder::TNaming_Builder ******/
		/****** md5 signature: e527eb08a85542f6ff17d0c3b731b83f ******/
		%feature("compactdefaultargs") TNaming_Builder;
		%feature("autodoc", "
Parameters
----------
aLabel: TDF_Label

Return
-------
None

Description
-----------
Create an Builder. Warning: Before Addition copies the current Value, and clear.
") TNaming_Builder;
		 TNaming_Builder(const TDF_Label & aLabel);

		/****** TNaming_Builder::Delete ******/
		/****** md5 signature: e7d6c931d67eae5017e0e0a88560cecc ******/
		%feature("compactdefaultargs") Delete;
		%feature("autodoc", "
Parameters
----------
oldShape: TopoDS_Shape

Return
-------
None

Description
-----------
Records the shape oldShape which was deleted from the current label. As an example, consider the case of a face removed by a Boolean operation.
") Delete;
		void Delete(const TopoDS_Shape & oldShape);

		/****** TNaming_Builder::Generated ******/
		/****** md5 signature: f09ef1a786b6dd431efdb86a1146dd88 ******/
		%feature("compactdefaultargs") Generated;
		%feature("autodoc", "
Parameters
----------
newShape: TopoDS_Shape

Return
-------
None

Description
-----------
Records the shape newShape which was generated during a topological construction. As an example, consider the case of a face generated in construction of a box.
") Generated;
		void Generated(const TopoDS_Shape & newShape);

		/****** TNaming_Builder::Generated ******/
		/****** md5 signature: c7e28e797e6177c9154de8e9abf4e36c ******/
		%feature("compactdefaultargs") Generated;
		%feature("autodoc", "
Parameters
----------
oldShape: TopoDS_Shape
newShape: TopoDS_Shape

Return
-------
None

Description
-----------
Records the shape newShape which was generated from the shape oldShape during a topological construction. As an example, consider the case of a face generated from an edge in construction of a prism.
") Generated;
		void Generated(const TopoDS_Shape & oldShape, const TopoDS_Shape & newShape);

		/****** TNaming_Builder::Modify ******/
		/****** md5 signature: 0c3df32d18f4244119459dc202463488 ******/
		%feature("compactdefaultargs") Modify;
		%feature("autodoc", "
Parameters
----------
oldShape: TopoDS_Shape
newShape: TopoDS_Shape

Return
-------
None

Description
-----------
Records the shape newShape which is a modification of the shape oldShape. As an example, consider the case of a face split or merged in a Boolean operation.
") Modify;
		void Modify(const TopoDS_Shape & oldShape, const TopoDS_Shape & newShape);

		/****** TNaming_Builder::NamedShape ******/
		/****** md5 signature: f81ceec92565d5b27eb74fc46fdc0cc9 ******/
		%feature("compactdefaultargs") NamedShape;
		%feature("autodoc", "Return
-------
opencascade::handle<TNaming_NamedShape>

Description
-----------
Returns the NamedShape which has been built or is under construction.
") NamedShape;
		opencascade::handle<TNaming_NamedShape> NamedShape();

		/****** TNaming_Builder::Select ******/
		/****** md5 signature: f0fa18a8affb78f4f35d9d8e97c14fc8 ******/
		%feature("compactdefaultargs") Select;
		%feature("autodoc", "
Parameters
----------
aShape: TopoDS_Shape
inShape: TopoDS_Shape

Return
-------
None

Description
-----------
Add a Shape to the current label , This Shape is unmodified. Used for example to define a set of shapes under a label.
") Select;
		void Select(const TopoDS_Shape & aShape, const TopoDS_Shape & inShape);

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
		/****** TNaming_CopyShape::CopyTool ******/
		/****** md5 signature: 68dbabff764be4482b8310e46483bc53 ******/
		%feature("compactdefaultargs") CopyTool;
		%feature("autodoc", "
Parameters
----------
aShape: TopoDS_Shape
aMap: TColStd_IndexedDataMapOfTransientTransient
aResult: TopoDS_Shape

Return
-------
None

Description
-----------
Makes copy a set of shape(s), using the aMap.
") CopyTool;
		static void CopyTool(const TopoDS_Shape & aShape, TColStd_IndexedDataMapOfTransientTransient & aMap, TopoDS_Shape & aResult);

		/****** TNaming_CopyShape::Translate ******/
		/****** md5 signature: 979088cf76411c3c287d02989b1b7408 ******/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "
Parameters
----------
aShape: TopoDS_Shape
aMap: TColStd_IndexedDataMapOfTransientTransient
aResult: TopoDS_Shape
TrTool: TNaming_TranslateTool

Return
-------
None

Description
-----------
Translates a Transient shape(s) to Transient.
") Translate;
		static void Translate(const TopoDS_Shape & aShape, TColStd_IndexedDataMapOfTransientTransient & aMap, TopoDS_Shape & aResult, const opencascade::handle<TNaming_TranslateTool> & TrTool);

		/****** TNaming_CopyShape::Translate ******/
		/****** md5 signature: 1e92f022ff2e32420dfe6876b46407e3 ******/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "
Parameters
----------
L: TopLoc_Location
aMap: TColStd_IndexedDataMapOfTransientTransient

Return
-------
TopLoc_Location

Description
-----------
Translates a Topological Location to an other Top. Location.
") Translate;
		static TopLoc_Location Translate(const TopLoc_Location & L, TColStd_IndexedDataMapOfTransientTransient & aMap);

};


%extend TNaming_CopyShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class TNaming_DeltaOnModification *
************************************/
class TNaming_DeltaOnModification : public TDF_DeltaOnModification {
	public:
		/****** TNaming_DeltaOnModification::TNaming_DeltaOnModification ******/
		/****** md5 signature: c6d49c1244394b1dd9f9561df62966be ******/
		%feature("compactdefaultargs") TNaming_DeltaOnModification;
		%feature("autodoc", "
Parameters
----------
NS: TNaming_NamedShape

Return
-------
None

Description
-----------
Initializes a TDF_DeltaOnModification.
") TNaming_DeltaOnModification;
		 TNaming_DeltaOnModification(const opencascade::handle<TNaming_NamedShape> & NS);

		/****** TNaming_DeltaOnModification::Apply ******/
		/****** md5 signature: ddf5e396da23832dcae51d48e78a347f ******/
		%feature("compactdefaultargs") Apply;
		%feature("autodoc", "Return
-------
None

Description
-----------
Applies the delta to the attribute.
") Apply;
		virtual void Apply();

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
class TNaming_DeltaOnRemoval : public TDF_DeltaOnRemoval {
	public:
		/****** TNaming_DeltaOnRemoval::TNaming_DeltaOnRemoval ******/
		/****** md5 signature: b4081e7f409b52375f3658210398109d ******/
		%feature("compactdefaultargs") TNaming_DeltaOnRemoval;
		%feature("autodoc", "
Parameters
----------
NS: TNaming_NamedShape

Return
-------
None

Description
-----------
Initializes a TDF_DeltaOnModification.
") TNaming_DeltaOnRemoval;
		 TNaming_DeltaOnRemoval(const opencascade::handle<TNaming_NamedShape> & NS);

		/****** TNaming_DeltaOnRemoval::Apply ******/
		/****** md5 signature: ddf5e396da23832dcae51d48e78a347f ******/
		%feature("compactdefaultargs") Apply;
		%feature("autodoc", "Return
-------
None

Description
-----------
Applies the delta to the attribute.
") Apply;
		virtual void Apply();

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
class TNaming_Identifier {
	public:
		/****** TNaming_Identifier::TNaming_Identifier ******/
		/****** md5 signature: 62d0561d44133a83f74adfeb0d3107af ******/
		%feature("compactdefaultargs") TNaming_Identifier;
		%feature("autodoc", "
Parameters
----------
Lab: TDF_Label
S: TopoDS_Shape
Context: TopoDS_Shape
Geom: bool

Return
-------
None

Description
-----------
No available documentation.
") TNaming_Identifier;
		 TNaming_Identifier(const TDF_Label & Lab, const TopoDS_Shape & S, const TopoDS_Shape & Context, const Standard_Boolean Geom);

		/****** TNaming_Identifier::TNaming_Identifier ******/
		/****** md5 signature: 04356eb4451661be5a0af4cea18e81dc ******/
		%feature("compactdefaultargs") TNaming_Identifier;
		%feature("autodoc", "
Parameters
----------
Lab: TDF_Label
S: TopoDS_Shape
ContextNS: TNaming_NamedShape
Geom: bool

Return
-------
None

Description
-----------
No available documentation.
") TNaming_Identifier;
		 TNaming_Identifier(const TDF_Label & Lab, const TopoDS_Shape & S, const opencascade::handle<TNaming_NamedShape> & ContextNS, const Standard_Boolean Geom);

		/****** TNaming_Identifier::AncestorIdentification ******/
		/****** md5 signature: 2b81eef5c1e7248648501fe054976064 ******/
		%feature("compactdefaultargs") AncestorIdentification;
		%feature("autodoc", "
Parameters
----------
Localizer: TNaming_Localizer
Context: TopoDS_Shape

Return
-------
None

Description
-----------
No available documentation.
") AncestorIdentification;
		void AncestorIdentification(TNaming_Localizer & Localizer, const TopoDS_Shape & Context);

		/****** TNaming_Identifier::ArgIsFeature ******/
		/****** md5 signature: f6d4bd72536d6a3155180a2e5fe251af ******/
		%feature("compactdefaultargs") ArgIsFeature;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") ArgIsFeature;
		Standard_Boolean ArgIsFeature();

		/****** TNaming_Identifier::Feature ******/
		/****** md5 signature: 5e47ba9d75b024609702b0386c463cc2 ******/
		%feature("compactdefaultargs") Feature;
		%feature("autodoc", "Return
-------
opencascade::handle<TNaming_NamedShape>

Description
-----------
No available documentation.
") Feature;
		opencascade::handle<TNaming_NamedShape> Feature();

		/****** TNaming_Identifier::FeatureArg ******/
		/****** md5 signature: 75e9ac9e2a82e32346d3b72cb61aa353 ******/
		%feature("compactdefaultargs") FeatureArg;
		%feature("autodoc", "Return
-------
opencascade::handle<TNaming_NamedShape>

Description
-----------
No available documentation.
") FeatureArg;
		opencascade::handle<TNaming_NamedShape> FeatureArg();

		/****** TNaming_Identifier::GeneratedIdentification ******/
		/****** md5 signature: 792d53fcca5597d2a6dda3e28d8d1167 ******/
		%feature("compactdefaultargs") GeneratedIdentification;
		%feature("autodoc", "
Parameters
----------
Localizer: TNaming_Localizer
NS: TNaming_NamedShape

Return
-------
None

Description
-----------
No available documentation.
") GeneratedIdentification;
		void GeneratedIdentification(TNaming_Localizer & Localizer, const opencascade::handle<TNaming_NamedShape> & NS);

		/****** TNaming_Identifier::Identification ******/
		/****** md5 signature: bffb3f583c54aac29a9d2c2e48c124e1 ******/
		%feature("compactdefaultargs") Identification;
		%feature("autodoc", "
Parameters
----------
Localizer: TNaming_Localizer
NS: TNaming_NamedShape

Return
-------
None

Description
-----------
No available documentation.
") Identification;
		void Identification(TNaming_Localizer & Localizer, const opencascade::handle<TNaming_NamedShape> & NS);

		/****** TNaming_Identifier::InitArgs ******/
		/****** md5 signature: 3463266be18332e599bcc5ed3dece74b ******/
		%feature("compactdefaultargs") InitArgs;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") InitArgs;
		void InitArgs();

		/****** TNaming_Identifier::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsDone;
		Standard_Boolean IsDone();

		/****** TNaming_Identifier::IsFeature ******/
		/****** md5 signature: 39e8d87b7bf0d8fafa0ee5ee48574888 ******/
		%feature("compactdefaultargs") IsFeature;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsFeature;
		Standard_Boolean IsFeature();

		/****** TNaming_Identifier::MoreArgs ******/
		/****** md5 signature: 1932bf348ab7f430b6ffb77926d3dee5 ******/
		%feature("compactdefaultargs") MoreArgs;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") MoreArgs;
		Standard_Boolean MoreArgs();

		/****** TNaming_Identifier::NamedShapeOfGeneration ******/
		/****** md5 signature: a602a6f54d6c6371f0808dc2d3a65e1a ******/
		%feature("compactdefaultargs") NamedShapeOfGeneration;
		%feature("autodoc", "Return
-------
opencascade::handle<TNaming_NamedShape>

Description
-----------
No available documentation.
") NamedShapeOfGeneration;
		opencascade::handle<TNaming_NamedShape> NamedShapeOfGeneration();

		/****** TNaming_Identifier::NextArg ******/
		/****** md5 signature: 488470e36350129f8d1a1c2101139be2 ******/
		%feature("compactdefaultargs") NextArg;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") NextArg;
		void NextArg();

		/****** TNaming_Identifier::PrimitiveIdentification ******/
		/****** md5 signature: 97edcda3511bdcf6c9506ccd8ea64bee ******/
		%feature("compactdefaultargs") PrimitiveIdentification;
		%feature("autodoc", "
Parameters
----------
Localizer: TNaming_Localizer
NS: TNaming_NamedShape

Return
-------
None

Description
-----------
No available documentation.
") PrimitiveIdentification;
		void PrimitiveIdentification(TNaming_Localizer & Localizer, const opencascade::handle<TNaming_NamedShape> & NS);

		/****** TNaming_Identifier::ShapeArg ******/
		/****** md5 signature: 7268253bc671d549c564c519c408a43b ******/
		%feature("compactdefaultargs") ShapeArg;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") ShapeArg;
		TopoDS_Shape ShapeArg();

		/****** TNaming_Identifier::ShapeContext ******/
		/****** md5 signature: 046517dec276d0934d29122b6cafd283 ******/
		%feature("compactdefaultargs") ShapeContext;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") ShapeContext;
		TopoDS_Shape ShapeContext();

		/****** TNaming_Identifier::Type ******/
		/****** md5 signature: ee0bfd0d4d6a95e55beea18c6f14b91c ******/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "Return
-------
TNaming_NameType

Description
-----------
No available documentation.
") Type;
		TNaming_NameType Type();

};


%extend TNaming_Identifier {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class TNaming_Iterator *
*************************/
class TNaming_Iterator {
	public:
		/****** TNaming_Iterator::TNaming_Iterator ******/
		/****** md5 signature: 2baf5b02176dfe6fc9dc3febb75e5210 ******/
		%feature("compactdefaultargs") TNaming_Iterator;
		%feature("autodoc", "
Parameters
----------
anAtt: TNaming_NamedShape

Return
-------
None

Description
-----------
Iterates on all the history records in <anAtt>.
") TNaming_Iterator;
		 TNaming_Iterator(const opencascade::handle<TNaming_NamedShape> & anAtt);

		/****** TNaming_Iterator::TNaming_Iterator ******/
		/****** md5 signature: da64a614fcaa5642e1dd0054ad6bea1c ******/
		%feature("compactdefaultargs") TNaming_Iterator;
		%feature("autodoc", "
Parameters
----------
aLabel: TDF_Label

Return
-------
None

Description
-----------
Iterates on all the history records in the current transaction.
") TNaming_Iterator;
		 TNaming_Iterator(const TDF_Label & aLabel);

		/****** TNaming_Iterator::TNaming_Iterator ******/
		/****** md5 signature: 961ae652f49f014e24c3713b9f4091b3 ******/
		%feature("compactdefaultargs") TNaming_Iterator;
		%feature("autodoc", "
Parameters
----------
aLabel: TDF_Label
aTrans: int

Return
-------
None

Description
-----------
Iterates on all the history records in the transaction <aTrans>.
") TNaming_Iterator;
		 TNaming_Iterator(const TDF_Label & aLabel, const Standard_Integer aTrans);

		/****** TNaming_Iterator::Evolution ******/
		/****** md5 signature: 807db9d74d271aa42843b60e4aab188f ******/
		%feature("compactdefaultargs") Evolution;
		%feature("autodoc", "Return
-------
TNaming_Evolution

Description
-----------
No available documentation.
") Evolution;
		TNaming_Evolution Evolution();

		/****** TNaming_Iterator::IsModification ******/
		/****** md5 signature: d84cb461ae1f7bb445d699b3caee967e ******/
		%feature("compactdefaultargs") IsModification;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the new shape is a modification (split, fuse,etc...) of the old shape.
") IsModification;
		Standard_Boolean IsModification();

		/****** TNaming_Iterator::More ******/
		/****** md5 signature: 6f6e915c9a3dca758c059d9e8af02dff ******/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if there is a current Item in the iteration.
") More;
		Standard_Boolean More();

		/****** TNaming_Iterator::NewShape ******/
		/****** md5 signature: c4db9c58041458e5fc402a0a744b1143 ******/
		%feature("compactdefaultargs") NewShape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Returns the new shape in this iterator object.
") NewShape;
		const TopoDS_Shape NewShape();

		/****** TNaming_Iterator::Next ******/
		/****** md5 signature: f35c0df5f1d7c877986db18081404532 ******/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Return
-------
None

Description
-----------
Moves the iteration to the next Item.
") Next;
		void Next();

		/****** TNaming_Iterator::OldShape ******/
		/****** md5 signature: 49f402645447653641aa0348df5a44eb ******/
		%feature("compactdefaultargs") OldShape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Returns the old shape in this iterator object. This shape can be a null one.
") OldShape;
		const TopoDS_Shape OldShape();

};


%extend TNaming_Iterator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class TNaming_IteratorOnShapesSet *
************************************/
class TNaming_IteratorOnShapesSet {
	public:
		/****** TNaming_IteratorOnShapesSet::TNaming_IteratorOnShapesSet ******/
		/****** md5 signature: 97a7ad19a39acfcf960c423fcad4ec99 ******/
		%feature("compactdefaultargs") TNaming_IteratorOnShapesSet;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TNaming_IteratorOnShapesSet;
		 TNaming_IteratorOnShapesSet();

		/****** TNaming_IteratorOnShapesSet::TNaming_IteratorOnShapesSet ******/
		/****** md5 signature: 43e3ae1b194f84be6645e17bc31f19dc ******/
		%feature("compactdefaultargs") TNaming_IteratorOnShapesSet;
		%feature("autodoc", "
Parameters
----------
S: TNaming_ShapesSet

Return
-------
None

Description
-----------
No available documentation.
") TNaming_IteratorOnShapesSet;
		 TNaming_IteratorOnShapesSet(const TNaming_ShapesSet & S);

		/****** TNaming_IteratorOnShapesSet::Init ******/
		/****** md5 signature: 79f82d92afe17d744e32b64b23233cc5 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
S: TNaming_ShapesSet

Return
-------
None

Description
-----------
Initialize the iteration.
") Init;
		void Init(const TNaming_ShapesSet & S);

		/****** TNaming_IteratorOnShapesSet::More ******/
		/****** md5 signature: 6f6e915c9a3dca758c059d9e8af02dff ******/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if there is a current Item in the iteration.
") More;
		Standard_Boolean More();

		/****** TNaming_IteratorOnShapesSet::Next ******/
		/****** md5 signature: f35c0df5f1d7c877986db18081404532 ******/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Return
-------
None

Description
-----------
Move to the next Item.
") Next;
		void Next();

		/****** TNaming_IteratorOnShapesSet::Value ******/
		/****** md5 signature: 9e28ce63f808ff9cca4234cb4dd1cbd0 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") Value;
		const TopoDS_Shape Value();

};


%extend TNaming_IteratorOnShapesSet {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class TNaming_Localizer *
**************************/
class TNaming_Localizer {
	public:
		/****** TNaming_Localizer::TNaming_Localizer ******/
		/****** md5 signature: 49d183c07e88d79902408e9b86bd879f ******/
		%feature("compactdefaultargs") TNaming_Localizer;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TNaming_Localizer;
		 TNaming_Localizer();

		/****** TNaming_Localizer::Ancestors ******/
		/****** md5 signature: 249e20f96ebf354ebf2c2f0cfd41ff44 ******/
		%feature("compactdefaultargs") Ancestors;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
Type: TopAbs_ShapeEnum

Return
-------
TopTools_IndexedDataMapOfShapeListOfShape

Description
-----------
No available documentation.
") Ancestors;
		const TopTools_IndexedDataMapOfShapeListOfShape & Ancestors(const TopoDS_Shape & S, const TopAbs_ShapeEnum Type);

		/****** TNaming_Localizer::Backward ******/
		/****** md5 signature: 016c931ceee337fc05c1e64d54f393e2 ******/
		%feature("compactdefaultargs") Backward;
		%feature("autodoc", "
Parameters
----------
NS: TNaming_NamedShape
S: TopoDS_Shape
Primitives: TNaming_MapOfNamedShape
ValidShapes: TopTools_MapOfShape

Return
-------
None

Description
-----------
No available documentation.
") Backward;
		void Backward(const opencascade::handle<TNaming_NamedShape> & NS, const TopoDS_Shape & S, TNaming_MapOfNamedShape & Primitives, TopTools_MapOfShape & ValidShapes);

		/****** TNaming_Localizer::FindFeaturesInAncestors ******/
		/****** md5 signature: e0206583fcd95e7f42e8eb830a0a060b ******/
		%feature("compactdefaultargs") FindFeaturesInAncestors;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
In: TopoDS_Shape
AncInFeatures: TopTools_MapOfShape

Return
-------
None

Description
-----------
No available documentation.
") FindFeaturesInAncestors;
		void FindFeaturesInAncestors(const TopoDS_Shape & S, const TopoDS_Shape & In, TopTools_MapOfShape & AncInFeatures);

		/****** TNaming_Localizer::FindGenerator ******/
		/****** md5 signature: 396ba219ecc4aa41ab3d44bd0912e343 ******/
		%feature("compactdefaultargs") FindGenerator;
		%feature("autodoc", "
Parameters
----------
NS: TNaming_NamedShape
S: TopoDS_Shape
theListOfGenerators: TopTools_ListOfShape

Return
-------
None

Description
-----------
No available documentation.
") FindGenerator;
		static void FindGenerator(const opencascade::handle<TNaming_NamedShape> & NS, const TopoDS_Shape & S, TopTools_ListOfShape & theListOfGenerators);

		/****** TNaming_Localizer::FindNeighbourg ******/
		/****** md5 signature: a432bb9220952492e4158921ea252158 ******/
		%feature("compactdefaultargs") FindNeighbourg;
		%feature("autodoc", "
Parameters
----------
Cont: TopoDS_Shape
S: TopoDS_Shape
Neighbourg: TopTools_MapOfShape

Return
-------
None

Description
-----------
No available documentation.
") FindNeighbourg;
		void FindNeighbourg(const TopoDS_Shape & Cont, const TopoDS_Shape & S, TopTools_MapOfShape & Neighbourg);

		/****** TNaming_Localizer::FindShapeContext ******/
		/****** md5 signature: 3080ebceae5e84f4b49f367cb2d966e0 ******/
		%feature("compactdefaultargs") FindShapeContext;
		%feature("autodoc", "
Parameters
----------
NS: TNaming_NamedShape
theS: TopoDS_Shape
theSC: TopoDS_Shape

Return
-------
None

Description
-----------
Finds context of the shape <S>.
") FindShapeContext;
		static void FindShapeContext(const opencascade::handle<TNaming_NamedShape> & NS, const TopoDS_Shape & theS, TopoDS_Shape & theSC);

		/****** TNaming_Localizer::GoBack ******/
		/****** md5 signature: a6ff591266d2ce72f53a7282d0120b6b ******/
		%feature("compactdefaultargs") GoBack;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
Lab: TDF_Label
Evol: TNaming_Evolution
OldS: TopTools_ListOfShape
OldLab: TNaming_ListOfNamedShape

Return
-------
None

Description
-----------
No available documentation.
") GoBack;
		void GoBack(const TopoDS_Shape & S, const TDF_Label & Lab, const TNaming_Evolution Evol, TopTools_ListOfShape & OldS, TNaming_ListOfNamedShape & OldLab);

		/****** TNaming_Localizer::Init ******/
		/****** md5 signature: f1d09fe1c2db86931045549e32a5e2ee ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
US: TNaming_UsedShapes
CurTrans: int

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TNaming_UsedShapes> & US, const Standard_Integer CurTrans);

		/****** TNaming_Localizer::IsNew ******/
		/****** md5 signature: ff9f03fb517617ccaa57ffdaa1daf730 ******/
		%feature("compactdefaultargs") IsNew;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
NS: TNaming_NamedShape

Return
-------
bool

Description
-----------
No available documentation.
") IsNew;
		static Standard_Boolean IsNew(const TopoDS_Shape & S, const opencascade::handle<TNaming_NamedShape> & NS);

		/****** TNaming_Localizer::SubShapes ******/
		/****** md5 signature: f844c78d5c2f56db95a354e510879fd9 ******/
		%feature("compactdefaultargs") SubShapes;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
Type: TopAbs_ShapeEnum

Return
-------
TopTools_MapOfShape

Description
-----------
No available documentation.
") SubShapes;
		const TopTools_MapOfShape & SubShapes(const TopoDS_Shape & S, const TopAbs_ShapeEnum Type);

};


%extend TNaming_Localizer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************
* class TNaming_Name *
*********************/
class TNaming_Name {
	public:
		/****** TNaming_Name::TNaming_Name ******/
		/****** md5 signature: a4aff2d86ba864c2474ceff03d471d7a ******/
		%feature("compactdefaultargs") TNaming_Name;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TNaming_Name;
		 TNaming_Name();

		/****** TNaming_Name::Append ******/
		/****** md5 signature: ae06ad5f6fe1f9be7be3afe2b0a51e45 ******/
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "
Parameters
----------
arg: TNaming_NamedShape

Return
-------
None

Description
-----------
No available documentation.
") Append;
		void Append(const opencascade::handle<TNaming_NamedShape> & arg);

		/****** TNaming_Name::Arguments ******/
		/****** md5 signature: be638476169c3be8eb6c45ab65bd319e ******/
		%feature("compactdefaultargs") Arguments;
		%feature("autodoc", "Return
-------
TNaming_ListOfNamedShape

Description
-----------
No available documentation.
") Arguments;
		const TNaming_ListOfNamedShape & Arguments();

		/****** TNaming_Name::ContextLabel ******/
		/****** md5 signature: 9967b59a06d78957ec944381f315be12 ******/
		%feature("compactdefaultargs") ContextLabel;
		%feature("autodoc", "
Parameters
----------
theLab: TDF_Label

Return
-------
None

Description
-----------
No available documentation.
") ContextLabel;
		void ContextLabel(const TDF_Label & theLab);

		/****** TNaming_Name::ContextLabel ******/
		/****** md5 signature: 24e75e2705dd32cd09af887dc318645d ******/
		%feature("compactdefaultargs") ContextLabel;
		%feature("autodoc", "Return
-------
TDF_Label

Description
-----------
No available documentation.
") ContextLabel;
		const TDF_Label & ContextLabel();


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
		/****** TNaming_Name::Index ******/
		/****** md5 signature: 14b6f4590eeca8d2e66a904c0019a95f ******/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
None

Description
-----------
No available documentation.
") Index;
		void Index(const Standard_Integer I);

		/****** TNaming_Name::Index ******/
		/****** md5 signature: 407d80ef3037d55996765198adea3908 ******/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Index;
		Standard_Integer Index();

		/****** TNaming_Name::Orientation ******/
		/****** md5 signature: fb9858d598da2673e484eed6974efed9 ******/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "
Parameters
----------
theOrientation: TopAbs_Orientation

Return
-------
None

Description
-----------
No available documentation.
") Orientation;
		void Orientation(const TopAbs_Orientation theOrientation);

		/****** TNaming_Name::Orientation ******/
		/****** md5 signature: 03010048da537511bfd11160d3c898dc ******/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "Return
-------
TopAbs_Orientation

Description
-----------
No available documentation.
") Orientation;
		TopAbs_Orientation Orientation();

		/****** TNaming_Name::Paste ******/
		/****** md5 signature: 26f55b56dc1769098e5535c080f333bf ******/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "
Parameters
----------
into: TNaming_Name
RT: TDF_RelocationTable

Return
-------
None

Description
-----------
No available documentation.
") Paste;
		void Paste(TNaming_Name & into, const opencascade::handle<TDF_RelocationTable> & RT);

		/****** TNaming_Name::Shape ******/
		/****** md5 signature: af489619aba91207399f153b1fdb75dc ******/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "
Parameters
----------
theShape: TopoDS_Shape

Return
-------
None

Description
-----------
No available documentation.
") Shape;
		void Shape(const TopoDS_Shape & theShape);

		/****** TNaming_Name::Shape ******/
		/****** md5 signature: 3aece276415d56b8bd9afa5bf371db57 ******/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") Shape;
		TopoDS_Shape Shape();

		/****** TNaming_Name::ShapeType ******/
		/****** md5 signature: 90faef4382ebff28c6bd3303987a742d ******/
		%feature("compactdefaultargs") ShapeType;
		%feature("autodoc", "
Parameters
----------
aType: TopAbs_ShapeEnum

Return
-------
None

Description
-----------
No available documentation.
") ShapeType;
		void ShapeType(const TopAbs_ShapeEnum aType);

		/****** TNaming_Name::ShapeType ******/
		/****** md5 signature: fdb6bbab82f138b7eb96684b837c482d ******/
		%feature("compactdefaultargs") ShapeType;
		%feature("autodoc", "Return
-------
TopAbs_ShapeEnum

Description
-----------
No available documentation.
") ShapeType;
		TopAbs_ShapeEnum ShapeType();

		/****** TNaming_Name::Solve ******/
		/****** md5 signature: 327f0047e836e914c43f97af77251fc1 ******/
		%feature("compactdefaultargs") Solve;
		%feature("autodoc", "
Parameters
----------
aLab: TDF_Label
Valid: TDF_LabelMap

Return
-------
bool

Description
-----------
No available documentation.
") Solve;
		Standard_Boolean Solve(const TDF_Label & aLab, const TDF_LabelMap & Valid);

		/****** TNaming_Name::StopNamedShape ******/
		/****** md5 signature: 940a347c419778b1d92400dd9ecc55ce ******/
		%feature("compactdefaultargs") StopNamedShape;
		%feature("autodoc", "
Parameters
----------
arg: TNaming_NamedShape

Return
-------
None

Description
-----------
No available documentation.
") StopNamedShape;
		void StopNamedShape(const opencascade::handle<TNaming_NamedShape> & arg);

		/****** TNaming_Name::StopNamedShape ******/
		/****** md5 signature: e4f39035ddcee3edb8b5590bd48040c0 ******/
		%feature("compactdefaultargs") StopNamedShape;
		%feature("autodoc", "Return
-------
opencascade::handle<TNaming_NamedShape>

Description
-----------
No available documentation.
") StopNamedShape;
		opencascade::handle<TNaming_NamedShape> StopNamedShape();

		/****** TNaming_Name::Type ******/
		/****** md5 signature: 117169560b15480745cd7dd3817ec7af ******/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "
Parameters
----------
aType: TNaming_NameType

Return
-------
None

Description
-----------
No available documentation.
") Type;
		void Type(const TNaming_NameType aType);

		/****** TNaming_Name::Type ******/
		/****** md5 signature: ee0bfd0d4d6a95e55beea18c6f14b91c ******/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "Return
-------
TNaming_NameType

Description
-----------
No available documentation.
") Type;
		TNaming_NameType Type();

};


%extend TNaming_Name {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class TNaming_NamedShape *
***************************/
class TNaming_NamedShape : public TDF_Attribute {
	public:
		/****** TNaming_NamedShape::TNaming_NamedShape ******/
		/****** md5 signature: 5b226a78c722135cdb5da1643950aa84 ******/
		%feature("compactdefaultargs") TNaming_NamedShape;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TNaming_NamedShape;
		 TNaming_NamedShape();

		/****** TNaming_NamedShape::AfterUndo ******/
		/****** md5 signature: 6a782c706f1e9291f121f77d889ed576 ******/
		%feature("compactdefaultargs") AfterUndo;
		%feature("autodoc", "
Parameters
----------
anAttDelta: TDF_AttributeDelta
forceIt: bool (optional, default to Standard_False)

Return
-------
bool

Description
-----------
Something to do after applying <anAttDelta>.
") AfterUndo;
		virtual Standard_Boolean AfterUndo(const opencascade::handle<TDF_AttributeDelta> & anAttDelta, const Standard_Boolean forceIt = Standard_False);

		/****** TNaming_NamedShape::BackupCopy ******/
		/****** md5 signature: c0c9b77233d223451ec9a7e1bc2427c7 ******/
		%feature("compactdefaultargs") BackupCopy;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_Attribute>

Description
-----------
Copies the attribute contents into a new other attribute. It is used by Backup().
") BackupCopy;
		virtual opencascade::handle<TDF_Attribute> BackupCopy();

		/****** TNaming_NamedShape::BeforeRemoval ******/
		/****** md5 signature: fb87f8354fd142d1ab3d9cd55ada4556 ******/
		%feature("compactdefaultargs") BeforeRemoval;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") BeforeRemoval;
		virtual void BeforeRemoval();

		/****** TNaming_NamedShape::BeforeUndo ******/
		/****** md5 signature: d409c3f1c759e5fb3727056dd12910e7 ******/
		%feature("compactdefaultargs") BeforeUndo;
		%feature("autodoc", "
Parameters
----------
anAttDelta: TDF_AttributeDelta
forceIt: bool (optional, default to Standard_False)

Return
-------
bool

Description
-----------
Something to do before applying <anAttDelta>.
") BeforeUndo;
		virtual Standard_Boolean BeforeUndo(const opencascade::handle<TDF_AttributeDelta> & anAttDelta, const Standard_Boolean forceIt = Standard_False);

		/****** TNaming_NamedShape::Clear ******/
		/****** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Clear;
		void Clear();

		/****** TNaming_NamedShape::DeltaOnModification ******/
		/****** md5 signature: 9a96ec815d43dd1838c022740c5327d0 ******/
		%feature("compactdefaultargs") DeltaOnModification;
		%feature("autodoc", "
Parameters
----------
anOldAttribute: TDF_Attribute

Return
-------
opencascade::handle<TDF_DeltaOnModification>

Description
-----------
Makes a DeltaOnModification between <self> and <anOldAttribute.
") DeltaOnModification;
		virtual opencascade::handle<TDF_DeltaOnModification> DeltaOnModification(const opencascade::handle<TDF_Attribute> & anOldAttribute);

		/****** TNaming_NamedShape::DeltaOnModification ******/
		/****** md5 signature: ede0663285b98e98df96462eca3a6ecf ******/
		%feature("compactdefaultargs") DeltaOnModification;
		%feature("autodoc", "
Parameters
----------
aDelta: TDF_DeltaOnModification

Return
-------
None

Description
-----------
Applies a DeltaOnModification to <self>.
") DeltaOnModification;
		virtual void DeltaOnModification(const opencascade::handle<TDF_DeltaOnModification> & aDelta);

		/****** TNaming_NamedShape::DeltaOnRemoval ******/
		/****** md5 signature: fce2b18e72dadcfc2bcbf283227db136 ******/
		%feature("compactdefaultargs") DeltaOnRemoval;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_DeltaOnRemoval>

Description
-----------
Makes a DeltaOnRemoval on <self> because <self> has disappeared from the DS.
") DeltaOnRemoval;
		virtual opencascade::handle<TDF_DeltaOnRemoval> DeltaOnRemoval();

		/****** TNaming_NamedShape::Dump ******/
		/****** md5 signature: 3398f1042b24f9ae49f7e8da6125f793 ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------

Return
-------
anOS: Standard_OStream

Description
-----------
Dumps the attribute on <aStream>.
") Dump;
		virtual Standard_OStream & Dump(std::ostream &OutValue);


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
		/****** TNaming_NamedShape::Evolution ******/
		/****** md5 signature: 807db9d74d271aa42843b60e4aab188f ******/
		%feature("compactdefaultargs") Evolution;
		%feature("autodoc", "Return
-------
TNaming_Evolution

Description
-----------
Returns the Evolution of the attribute.
") Evolution;
		TNaming_Evolution Evolution();

		/****** TNaming_NamedShape::Get ******/
		/****** md5 signature: 706b9ff7761aba97b57079b140b2bbf6 ******/
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Returns the shapes contained in <NS>. Returns a null shape if IsEmpty.
") Get;
		TopoDS_Shape Get();

		/****** TNaming_NamedShape::GetID ******/
		/****** md5 signature: afe6002d90f641ca3ea8c9ae9f8fe97c ******/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
class method ============ Returns the GUID for named shapes.
") GetID;
		static const Standard_GUID & GetID();

		/****** TNaming_NamedShape::ID ******/
		/****** md5 signature: 4697ce8a095fa6dcef0217708d19718f ******/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
Returns the ID of the attribute.
") ID;
		const Standard_GUID & ID();

		/****** TNaming_NamedShape::IsEmpty ******/
		/****** md5 signature: 6ab5e1ad63f93168856ab126dd374b81 ******/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsEmpty;
		Standard_Boolean IsEmpty();

		/****** TNaming_NamedShape::NewEmpty ******/
		/****** md5 signature: 8be17a4d2a4deeee198571712e76805e ******/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_Attribute>

Description
-----------
Returns an new empty attribute from the good end type. It is used by the copy algorithm.
") NewEmpty;
		virtual opencascade::handle<TDF_Attribute> NewEmpty();

		/****** TNaming_NamedShape::Paste ******/
		/****** md5 signature: 53b4ec32bedd752fc0ccd186074f75ef ******/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "
Parameters
----------
intoAttribute: TDF_Attribute
aRelocTationable: TDF_RelocationTable

Return
-------
None

Description
-----------
This method is different from the 'Copy' one, because it is used when copying an attribute from a source structure into a target structure. This method pastes the current attribute to the label corresponding to the insertor. The pasted attribute may be a brand new one or a new version of the previous one.
") Paste;
		virtual void Paste(const opencascade::handle<TDF_Attribute> & intoAttribute, const opencascade::handle<TDF_RelocationTable> & aRelocTationable);

		/****** TNaming_NamedShape::References ******/
		/****** md5 signature: 3f614360a69c957f8600d26b49bc71b2 ******/
		%feature("compactdefaultargs") References;
		%feature("autodoc", "
Parameters
----------
aDataSet: TDF_DataSet

Return
-------
None

Description
-----------
Adds the directly referenced attributes and labels to <aDataSet>. 'Directly' means we have only to look at the first level of references.
") References;
		virtual void References(const opencascade::handle<TDF_DataSet> & aDataSet);

		/****** TNaming_NamedShape::Restore ******/
		/****** md5 signature: c280e51bf6f4f3b5011b0c3698dfb001 ******/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "
Parameters
----------
anAttribute: TDF_Attribute

Return
-------
None

Description
-----------
Restores the contents from <anAttribute> into this one. It is used when aborting a transaction.
") Restore;
		virtual void Restore(const opencascade::handle<TDF_Attribute> & anAttribute);

		/****** TNaming_NamedShape::SetVersion ******/
		/****** md5 signature: 78536ff299eb6d6824ab1bc2f1e8c204 ******/
		%feature("compactdefaultargs") SetVersion;
		%feature("autodoc", "
Parameters
----------
version: int

Return
-------
None

Description
-----------
Set the Version of the attribute.
") SetVersion;
		void SetVersion(const Standard_Integer version);

		/****** TNaming_NamedShape::Version ******/
		/****** md5 signature: 4bb71e2d63c3ae8458fb62f8d03b21ff ******/
		%feature("compactdefaultargs") Version;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the Version of the attribute.
") Version;
		Standard_Integer Version();

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
class TNaming_Naming : public TDF_Attribute {
	public:
		/****** TNaming_Naming::TNaming_Naming ******/
		/****** md5 signature: cd65d37fe445371eb548066328512e48 ******/
		%feature("compactdefaultargs") TNaming_Naming;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TNaming_Naming;
		 TNaming_Naming();

		/****** TNaming_Naming::ChangeName ******/
		/****** md5 signature: f56a3dc2deefccbd731e242fd2faf15e ******/
		%feature("compactdefaultargs") ChangeName;
		%feature("autodoc", "Return
-------
TNaming_Name

Description
-----------
No available documentation.
") ChangeName;
		TNaming_Name & ChangeName();

		/****** TNaming_Naming::Dump ******/
		/****** md5 signature: 3398f1042b24f9ae49f7e8da6125f793 ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------

Return
-------
anOS: Standard_OStream

Description
-----------
No available documentation.
") Dump;
		virtual Standard_OStream & Dump(std::ostream &OutValue);


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
		/****** TNaming_Naming::ExtendedDump ******/
		/****** md5 signature: cdafdec412b1ac94fc1e049a6ac0bb97 ******/
		%feature("compactdefaultargs") ExtendedDump;
		%feature("autodoc", "
Parameters
----------
aFilter: TDF_IDFilter
aMap: TDF_AttributeIndexedMap

Return
-------
anOS: Standard_OStream

Description
-----------
No available documentation.
") ExtendedDump;
		virtual void ExtendedDump(std::ostream &OutValue, const TDF_IDFilter & aFilter, TDF_AttributeIndexedMap & aMap);

		/****** TNaming_Naming::GetID ******/
		/****** md5 signature: afe6002d90f641ca3ea8c9ae9f8fe97c ******/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
following code from TDesignStd ==============================.
") GetID;
		static const Standard_GUID & GetID();

		/****** TNaming_Naming::GetName ******/
		/****** md5 signature: 797bac9ab1006319502b53ff025b7618 ******/
		%feature("compactdefaultargs") GetName;
		%feature("autodoc", "Return
-------
TNaming_Name

Description
-----------
No available documentation.
") GetName;
		const TNaming_Name & GetName();

		/****** TNaming_Naming::ID ******/
		/****** md5 signature: 18550bf05502080c8e2a8a16aabb4183 ******/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
Deferred methods from TDF_Attribute ===================================.
") ID;
		virtual const Standard_GUID & ID();

		/****** TNaming_Naming::Insert ******/
		/****** md5 signature: c840f860441ae6b6c580b2a585213883 ******/
		%feature("compactdefaultargs") Insert;
		%feature("autodoc", "
Parameters
----------
under: TDF_Label

Return
-------
opencascade::handle<TNaming_Naming>

Description
-----------
No available documentation.
") Insert;
		static opencascade::handle<TNaming_Naming> Insert(const TDF_Label & under);

		/****** TNaming_Naming::IsDefined ******/
		/****** md5 signature: 96257d1cfd02677e7d5918092c3e6fb1 ******/
		%feature("compactdefaultargs") IsDefined;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsDefined;
		Standard_Boolean IsDefined();

		/****** TNaming_Naming::Name ******/
		/****** md5 signature: 43a576a93986358dd6e60ab2987a31b9 ******/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "
Parameters
----------
where: TDF_Label
Selection: TopoDS_Shape
Context: TopoDS_Shape
Geometry: bool (optional, default to Standard_False)
KeepOrientation: bool (optional, default to Standard_False)
BNproblem: bool (optional, default to Standard_False)

Return
-------
opencascade::handle<TNaming_NamedShape>

Description
-----------
Creates a Namimg attribute at label <where> to identify the shape <Selection>. Geometry is Standard_True if we are only interested by the underlying geometry (e.g. setting a constraint). <Context> is used to find neighbours of <S> when required by the naming. If KeepOrientation is True the Selection orientation is taken into account. BNproblem == True points out that Context sub-shapes in DF have orientation differences with Context shape itself. instance method ===============.
") Name;
		static opencascade::handle<TNaming_NamedShape> Name(const TDF_Label & where, const TopoDS_Shape & Selection, const TopoDS_Shape & Context, const Standard_Boolean Geometry = Standard_False, const Standard_Boolean KeepOrientation = Standard_False, const Standard_Boolean BNproblem = Standard_False);

		/****** TNaming_Naming::NewEmpty ******/
		/****** md5 signature: c6d13c9ecc64c6c803b6e119e8216934 ******/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_Attribute>

Description
-----------
No available documentation.
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****** TNaming_Naming::Paste ******/
		/****** md5 signature: a6ff306a759c68a191c0262635db980f ******/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "
Parameters
----------
Into: TDF_Attribute
RT: TDF_RelocationTable

Return
-------
None

Description
-----------
No available documentation.
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & Into, const opencascade::handle<TDF_RelocationTable> & RT);

		/****** TNaming_Naming::References ******/
		/****** md5 signature: 3f614360a69c957f8600d26b49bc71b2 ******/
		%feature("compactdefaultargs") References;
		%feature("autodoc", "
Parameters
----------
aDataSet: TDF_DataSet

Return
-------
None

Description
-----------
No available documentation.
") References;
		virtual void References(const opencascade::handle<TDF_DataSet> & aDataSet);

		/****** TNaming_Naming::Regenerate ******/
		/****** md5 signature: 05a2338f432d838f78697d953440f9a7 ******/
		%feature("compactdefaultargs") Regenerate;
		%feature("autodoc", "
Parameters
----------
scope: TDF_LabelMap

Return
-------
bool

Description
-----------
regenerate only the Name associated to me.
") Regenerate;
		Standard_Boolean Regenerate(TDF_LabelMap & scope);

		/****** TNaming_Naming::Restore ******/
		/****** md5 signature: ddeae219d389a1d89eecb3e23c73522a ******/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "
Parameters
----------
With: TDF_Attribute

Return
-------
None

Description
-----------
No available documentation.
") Restore;
		void Restore(const opencascade::handle<TDF_Attribute> & With);

		/****** TNaming_Naming::Solve ******/
		/****** md5 signature: 69bbb6172130b18c37589c097aed4400 ******/
		%feature("compactdefaultargs") Solve;
		%feature("autodoc", "
Parameters
----------
scope: TDF_LabelMap

Return
-------
bool

Description
-----------
Regenerate recursively the whole name with scope. If scope is empty it means that all the labels of the framework are valid.
") Solve;
		Standard_Boolean Solve(TDF_LabelMap & scope);

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
		/****** TNaming_NamingTool::BuildDescendants ******/
		/****** md5 signature: 7926f142c131508f29512155d5f95f47 ******/
		%feature("compactdefaultargs") BuildDescendants;
		%feature("autodoc", "
Parameters
----------
NS: TNaming_NamedShape
Labels: TDF_LabelMap

Return
-------
None

Description
-----------
No available documentation.
") BuildDescendants;
		static void BuildDescendants(const opencascade::handle<TNaming_NamedShape> & NS, TDF_LabelMap & Labels);

		/****** TNaming_NamingTool::CurrentShape ******/
		/****** md5 signature: 0ef4d077ff57fd4ff0dcbace038cfc32 ******/
		%feature("compactdefaultargs") CurrentShape;
		%feature("autodoc", "
Parameters
----------
Valid: TDF_LabelMap
Forbiden: TDF_LabelMap
NS: TNaming_NamedShape
MS: TopTools_IndexedMapOfShape

Return
-------
None

Description
-----------
No available documentation.
") CurrentShape;
		static void CurrentShape(const TDF_LabelMap & Valid, const TDF_LabelMap & Forbiden, const opencascade::handle<TNaming_NamedShape> & NS, TopTools_IndexedMapOfShape & MS);

		/****** TNaming_NamingTool::CurrentShapeFromShape ******/
		/****** md5 signature: 8d45a58b80e88b893687176b16d94e8b ******/
		%feature("compactdefaultargs") CurrentShapeFromShape;
		%feature("autodoc", "
Parameters
----------
Valid: TDF_LabelMap
Forbiden: TDF_LabelMap
Acces: TDF_Label
S: TopoDS_Shape
MS: TopTools_IndexedMapOfShape

Return
-------
None

Description
-----------
No available documentation.
") CurrentShapeFromShape;
		static void CurrentShapeFromShape(const TDF_LabelMap & Valid, const TDF_LabelMap & Forbiden, const TDF_Label & Acces, const TopoDS_Shape & S, TopTools_IndexedMapOfShape & MS);

};


%extend TNaming_NamingTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class TNaming_NewShapeIterator *
*********************************/
class TNaming_NewShapeIterator {
	public:
		/****** TNaming_NewShapeIterator::TNaming_NewShapeIterator ******/
		/****** md5 signature: 2a4486f9fdd3c78dfadf3442489de981 ******/
		%feature("compactdefaultargs") TNaming_NewShapeIterator;
		%feature("autodoc", "
Parameters
----------
aShape: TopoDS_Shape
Transaction: int
access: TDF_Label

Return
-------
None

Description
-----------
No available documentation.
") TNaming_NewShapeIterator;
		 TNaming_NewShapeIterator(const TopoDS_Shape & aShape, const Standard_Integer Transaction, const TDF_Label & access);

		/****** TNaming_NewShapeIterator::TNaming_NewShapeIterator ******/
		/****** md5 signature: 141ccf0b4fb175df78bf5d046f067e10 ******/
		%feature("compactdefaultargs") TNaming_NewShapeIterator;
		%feature("autodoc", "
Parameters
----------
aShape: TopoDS_Shape
access: TDF_Label

Return
-------
None

Description
-----------
No available documentation.
") TNaming_NewShapeIterator;
		 TNaming_NewShapeIterator(const TopoDS_Shape & aShape, const TDF_Label & access);

		/****** TNaming_NewShapeIterator::TNaming_NewShapeIterator ******/
		/****** md5 signature: 609db790d2817dec99f05c07671f657d ******/
		%feature("compactdefaultargs") TNaming_NewShapeIterator;
		%feature("autodoc", "
Parameters
----------
anIterator: TNaming_NewShapeIterator

Return
-------
None

Description
-----------
Iterates from the current Shape in <anIterator>.
") TNaming_NewShapeIterator;
		 TNaming_NewShapeIterator(const TNaming_NewShapeIterator & anIterator);

		/****** TNaming_NewShapeIterator::TNaming_NewShapeIterator ******/
		/****** md5 signature: 1601b802df2ff029a6a08f3df82afe61 ******/
		%feature("compactdefaultargs") TNaming_NewShapeIterator;
		%feature("autodoc", "
Parameters
----------
anIterator: TNaming_Iterator

Return
-------
None

Description
-----------
Iterates from the current Shape in <anIterator>.
") TNaming_NewShapeIterator;
		 TNaming_NewShapeIterator(const TNaming_Iterator & anIterator);

		/****** TNaming_NewShapeIterator::IsModification ******/
		/****** md5 signature: d84cb461ae1f7bb445d699b3caee967e ******/
		%feature("compactdefaultargs") IsModification;
		%feature("autodoc", "Return
-------
bool

Description
-----------
True if the new shape is a modification (split, fuse,etc...) of the old shape.
") IsModification;
		Standard_Boolean IsModification();

		/****** TNaming_NewShapeIterator::Label ******/
		/****** md5 signature: 45446fb6d4e5a656e74b10a5eb4cd845 ******/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "Return
-------
TDF_Label

Description
-----------
No available documentation.
") Label;
		TDF_Label Label();

		/****** TNaming_NewShapeIterator::More ******/
		/****** md5 signature: 6f6e915c9a3dca758c059d9e8af02dff ******/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") More;
		Standard_Boolean More();

		/****** TNaming_NewShapeIterator::NamedShape ******/
		/****** md5 signature: f81ceec92565d5b27eb74fc46fdc0cc9 ******/
		%feature("compactdefaultargs") NamedShape;
		%feature("autodoc", "Return
-------
opencascade::handle<TNaming_NamedShape>

Description
-----------
No available documentation.
") NamedShape;
		opencascade::handle<TNaming_NamedShape> NamedShape();

		/****** TNaming_NewShapeIterator::Next ******/
		/****** md5 signature: f35c0df5f1d7c877986db18081404532 ******/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Next;
		void Next();

		/****** TNaming_NewShapeIterator::Shape ******/
		/****** md5 signature: e2e979bbf0e2f5cedfc0e482bf183e08 ******/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Warning! Can be a Null Shape if a descendant is deleted.
") Shape;
		const TopoDS_Shape Shape();

};


%extend TNaming_NewShapeIterator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class TNaming_OldShapeIterator *
*********************************/
class TNaming_OldShapeIterator {
	public:
		/****** TNaming_OldShapeIterator::TNaming_OldShapeIterator ******/
		/****** md5 signature: 0591db4a01d343a1392be5bf7b4bd0b6 ******/
		%feature("compactdefaultargs") TNaming_OldShapeIterator;
		%feature("autodoc", "
Parameters
----------
aShape: TopoDS_Shape
Transaction: int
access: TDF_Label

Return
-------
None

Description
-----------
No available documentation.
") TNaming_OldShapeIterator;
		 TNaming_OldShapeIterator(const TopoDS_Shape & aShape, const Standard_Integer Transaction, const TDF_Label & access);

		/****** TNaming_OldShapeIterator::TNaming_OldShapeIterator ******/
		/****** md5 signature: 86ee4b957cbf8b33c2595110c2d733c5 ******/
		%feature("compactdefaultargs") TNaming_OldShapeIterator;
		%feature("autodoc", "
Parameters
----------
aShape: TopoDS_Shape
access: TDF_Label

Return
-------
None

Description
-----------
No available documentation.
") TNaming_OldShapeIterator;
		 TNaming_OldShapeIterator(const TopoDS_Shape & aShape, const TDF_Label & access);

		/****** TNaming_OldShapeIterator::TNaming_OldShapeIterator ******/
		/****** md5 signature: 6536f03d39325e774b6a8aba962ac0d4 ******/
		%feature("compactdefaultargs") TNaming_OldShapeIterator;
		%feature("autodoc", "
Parameters
----------
anIterator: TNaming_OldShapeIterator

Return
-------
None

Description
-----------
Iterates from the current Shape in <anIterator>.
") TNaming_OldShapeIterator;
		 TNaming_OldShapeIterator(const TNaming_OldShapeIterator & anIterator);

		/****** TNaming_OldShapeIterator::TNaming_OldShapeIterator ******/
		/****** md5 signature: d427bb8948dd8b4165b7f6ca2a35f18a ******/
		%feature("compactdefaultargs") TNaming_OldShapeIterator;
		%feature("autodoc", "
Parameters
----------
anIterator: TNaming_Iterator

Return
-------
None

Description
-----------
Iterates from the current Shape in <anIterator>.
") TNaming_OldShapeIterator;
		 TNaming_OldShapeIterator(const TNaming_Iterator & anIterator);

		/****** TNaming_OldShapeIterator::IsModification ******/
		/****** md5 signature: d84cb461ae1f7bb445d699b3caee967e ******/
		%feature("compactdefaultargs") IsModification;
		%feature("autodoc", "Return
-------
bool

Description
-----------
True if the new shape is a modification (split, fuse,etc...) of the old shape.
") IsModification;
		Standard_Boolean IsModification();

		/****** TNaming_OldShapeIterator::Label ******/
		/****** md5 signature: 45446fb6d4e5a656e74b10a5eb4cd845 ******/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "Return
-------
TDF_Label

Description
-----------
No available documentation.
") Label;
		TDF_Label Label();

		/****** TNaming_OldShapeIterator::More ******/
		/****** md5 signature: 6f6e915c9a3dca758c059d9e8af02dff ******/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") More;
		Standard_Boolean More();

		/****** TNaming_OldShapeIterator::NamedShape ******/
		/****** md5 signature: f81ceec92565d5b27eb74fc46fdc0cc9 ******/
		%feature("compactdefaultargs") NamedShape;
		%feature("autodoc", "Return
-------
opencascade::handle<TNaming_NamedShape>

Description
-----------
No available documentation.
") NamedShape;
		opencascade::handle<TNaming_NamedShape> NamedShape();

		/****** TNaming_OldShapeIterator::Next ******/
		/****** md5 signature: f35c0df5f1d7c877986db18081404532 ******/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Next;
		void Next();

		/****** TNaming_OldShapeIterator::Shape ******/
		/****** md5 signature: e2e979bbf0e2f5cedfc0e482bf183e08 ******/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") Shape;
		const TopoDS_Shape Shape();

};


%extend TNaming_OldShapeIterator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class TNaming_RefShape *
*************************/
class TNaming_RefShape {
	public:
		/****** TNaming_RefShape::TNaming_RefShape ******/
		/****** md5 signature: b3694f0f9a726a67d2d4c410e0552808 ******/
		%feature("compactdefaultargs") TNaming_RefShape;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TNaming_RefShape;
		 TNaming_RefShape();

		/****** TNaming_RefShape::TNaming_RefShape ******/
		/****** md5 signature: 97cba1b7e49119d8e5f0a0a3edc5ef41 ******/
		%feature("compactdefaultargs") TNaming_RefShape;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
None

Description
-----------
No available documentation.
") TNaming_RefShape;
		 TNaming_RefShape(const TopoDS_Shape & S);


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
		/****** TNaming_RefShape::FirstUse ******/
		/****** md5 signature: e46533395323ec138eb9f0788412fd43 ******/
		%feature("compactdefaultargs") FirstUse;
		%feature("autodoc", "
Parameters
----------
aPtr: TNaming_PtrNode

Return
-------
None

Description
-----------
No available documentation.
") FirstUse;
		void FirstUse(const TNaming_PtrNode & aPtr);

		/****** TNaming_RefShape::FirstUse ******/
		/****** md5 signature: 495ac9c816ba5c059737fcefd608bd4e ******/
		%feature("compactdefaultargs") FirstUse;
		%feature("autodoc", "Return
-------
TNaming_PtrNode

Description
-----------
No available documentation.
") FirstUse;
		TNaming_PtrNode FirstUse();

		/****** TNaming_RefShape::Label ******/
		/****** md5 signature: 45446fb6d4e5a656e74b10a5eb4cd845 ******/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "Return
-------
TDF_Label

Description
-----------
No available documentation.
") Label;
		TDF_Label Label();

		/****** TNaming_RefShape::NamedShape ******/
		/****** md5 signature: f81ceec92565d5b27eb74fc46fdc0cc9 ******/
		%feature("compactdefaultargs") NamedShape;
		%feature("autodoc", "Return
-------
opencascade::handle<TNaming_NamedShape>

Description
-----------
No available documentation.
") NamedShape;
		opencascade::handle<TNaming_NamedShape> NamedShape();

		/****** TNaming_RefShape::Shape ******/
		/****** md5 signature: 4ad14bdfefa6edaba5ec8f3a5bcb98f4 ******/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
None

Description
-----------
No available documentation.
") Shape;
		void Shape(const TopoDS_Shape & S);

		/****** TNaming_RefShape::Shape ******/
		/****** md5 signature: e2e979bbf0e2f5cedfc0e482bf183e08 ******/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") Shape;
		const TopoDS_Shape Shape();

};


%extend TNaming_RefShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class TNaming_SameShapeIterator *
**********************************/
class TNaming_SameShapeIterator {
	public:
		/****** TNaming_SameShapeIterator::TNaming_SameShapeIterator ******/
		/****** md5 signature: 6c037d9ef9b860505439a46995ae206f ******/
		%feature("compactdefaultargs") TNaming_SameShapeIterator;
		%feature("autodoc", "
Parameters
----------
aShape: TopoDS_Shape
access: TDF_Label

Return
-------
None

Description
-----------
No available documentation.
") TNaming_SameShapeIterator;
		 TNaming_SameShapeIterator(const TopoDS_Shape & aShape, const TDF_Label & access);

		/****** TNaming_SameShapeIterator::Label ******/
		/****** md5 signature: 45446fb6d4e5a656e74b10a5eb4cd845 ******/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "Return
-------
TDF_Label

Description
-----------
No available documentation.
") Label;
		TDF_Label Label();

		/****** TNaming_SameShapeIterator::More ******/
		/****** md5 signature: 6f6e915c9a3dca758c059d9e8af02dff ******/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") More;
		Standard_Boolean More();

		/****** TNaming_SameShapeIterator::Next ******/
		/****** md5 signature: f35c0df5f1d7c877986db18081404532 ******/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Next;
		void Next();

};


%extend TNaming_SameShapeIterator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class TNaming_Scope *
**********************/
class TNaming_Scope {
	public:
		/****** TNaming_Scope::TNaming_Scope ******/
		/****** md5 signature: b60b0c2f87dfd55211b1af2e90685b38 ******/
		%feature("compactdefaultargs") TNaming_Scope;
		%feature("autodoc", "Return
-------
None

Description
-----------
WithValid = False.
") TNaming_Scope;
		 TNaming_Scope();

		/****** TNaming_Scope::TNaming_Scope ******/
		/****** md5 signature: 8932f816adb73ddad549d33c17c373d0 ******/
		%feature("compactdefaultargs") TNaming_Scope;
		%feature("autodoc", "
Parameters
----------
WithValid: bool

Return
-------
None

Description
-----------
if <WithValid> the scope is defined by the map. If not on the whole framework.
") TNaming_Scope;
		 TNaming_Scope(const Standard_Boolean WithValid);

		/****** TNaming_Scope::TNaming_Scope ******/
		/****** md5 signature: 268c46cd5cd358414148cf260c8c3319 ******/
		%feature("compactdefaultargs") TNaming_Scope;
		%feature("autodoc", "
Parameters
----------
valid: TDF_LabelMap

Return
-------
None

Description
-----------
create a scope with a map. WithValid = True.
") TNaming_Scope;
		 TNaming_Scope(TDF_LabelMap & valid);

		/****** TNaming_Scope::ChangeValid ******/
		/****** md5 signature: 86d84e474f21b877bdf2d277639f7521 ******/
		%feature("compactdefaultargs") ChangeValid;
		%feature("autodoc", "Return
-------
TDF_LabelMap

Description
-----------
No available documentation.
") ChangeValid;
		TDF_LabelMap & ChangeValid();

		/****** TNaming_Scope::ClearValid ******/
		/****** md5 signature: f75cb19c38c702d6e3a82709605286ee ******/
		%feature("compactdefaultargs") ClearValid;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") ClearValid;
		void ClearValid();

		/****** TNaming_Scope::CurrentShape ******/
		/****** md5 signature: aa251666a13ed76b453f16b476df78eb ******/
		%feature("compactdefaultargs") CurrentShape;
		%feature("autodoc", "
Parameters
----------
NS: TNaming_NamedShape

Return
-------
TopoDS_Shape

Description
-----------
Returns the current value of <NS> according to the Valid Scope.
") CurrentShape;
		TopoDS_Shape CurrentShape(const opencascade::handle<TNaming_NamedShape> & NS);

		/****** TNaming_Scope::GetValid ******/
		/****** md5 signature: c371157b895ee66ea6eea74aede1c22d ******/
		%feature("compactdefaultargs") GetValid;
		%feature("autodoc", "Return
-------
TDF_LabelMap

Description
-----------
No available documentation.
") GetValid;
		const TDF_LabelMap & GetValid();

		/****** TNaming_Scope::IsValid ******/
		/****** md5 signature: daf835546ae1359506d879d192f9cbc2 ******/
		%feature("compactdefaultargs") IsValid;
		%feature("autodoc", "
Parameters
----------
L: TDF_Label

Return
-------
bool

Description
-----------
No available documentation.
") IsValid;
		Standard_Boolean IsValid(const TDF_Label & L);

		/****** TNaming_Scope::Unvalid ******/
		/****** md5 signature: e970908a0d0a073625221373380e13b4 ******/
		%feature("compactdefaultargs") Unvalid;
		%feature("autodoc", "
Parameters
----------
L: TDF_Label

Return
-------
None

Description
-----------
No available documentation.
") Unvalid;
		void Unvalid(const TDF_Label & L);

		/****** TNaming_Scope::UnvalidChildren ******/
		/****** md5 signature: dc66e9c3e6a99a5fa20e3b02716bf14b ******/
		%feature("compactdefaultargs") UnvalidChildren;
		%feature("autodoc", "
Parameters
----------
L: TDF_Label
withroot: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
No available documentation.
") UnvalidChildren;
		void UnvalidChildren(const TDF_Label & L, const Standard_Boolean withroot = Standard_True);

		/****** TNaming_Scope::Valid ******/
		/****** md5 signature: 3e508c54217f142842715bf4d0c369a0 ******/
		%feature("compactdefaultargs") Valid;
		%feature("autodoc", "
Parameters
----------
L: TDF_Label

Return
-------
None

Description
-----------
No available documentation.
") Valid;
		void Valid(const TDF_Label & L);

		/****** TNaming_Scope::ValidChildren ******/
		/****** md5 signature: 2c79ea717fc02455603de17841a774b9 ******/
		%feature("compactdefaultargs") ValidChildren;
		%feature("autodoc", "
Parameters
----------
L: TDF_Label
withroot: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
No available documentation.
") ValidChildren;
		void ValidChildren(const TDF_Label & L, const Standard_Boolean withroot = Standard_True);

		/****** TNaming_Scope::WithValid ******/
		/****** md5 signature: 8866a58a3aceee3d9219aa3a6da5444f ******/
		%feature("compactdefaultargs") WithValid;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") WithValid;
		Standard_Boolean WithValid();

		/****** TNaming_Scope::WithValid ******/
		/****** md5 signature: 1aca92f030cfe32c12c4b8a462301f59 ******/
		%feature("compactdefaultargs") WithValid;
		%feature("autodoc", "
Parameters
----------
mode: bool

Return
-------
None

Description
-----------
No available documentation.
") WithValid;
		void WithValid(const Standard_Boolean mode);

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
		/****** TNaming_Selector::TNaming_Selector ******/
		/****** md5 signature: 70d603813b6d158c9258bc43212551f6 ******/
		%feature("compactdefaultargs") TNaming_Selector;
		%feature("autodoc", "
Parameters
----------
aLabel: TDF_Label

Return
-------
None

Description
-----------
Create a selector on this label to select a shape. ==================.
") TNaming_Selector;
		 TNaming_Selector(const TDF_Label & aLabel);

		/****** TNaming_Selector::Arguments ******/
		/****** md5 signature: c499cd07de035eeec365e9e3cb1fa454 ******/
		%feature("compactdefaultargs") Arguments;
		%feature("autodoc", "
Parameters
----------
args: TDF_AttributeMap

Return
-------
None

Description
-----------
Returns the attribute list args. This list contains the named shape on which the topological naming was built.
") Arguments;
		void Arguments(TDF_AttributeMap & args);

		/****** TNaming_Selector::IsIdentified ******/
		/****** md5 signature: 171ef65d8719ba2ead9abac890b562d0 ******/
		%feature("compactdefaultargs") IsIdentified;
		%feature("autodoc", "
Parameters
----------
access: TDF_Label
selection: TopoDS_Shape
NS: TNaming_NamedShape
Geometry: bool (optional, default to Standard_False)

Return
-------
bool

Description
-----------
To know if a shape is already identified (not selected) ======================================================= //! The label access defines the point of access to the data framework. selection is the shape for which we want to know whether it is identified or not. If true, NS is returned as the identity of selection. If Geometry is true, NS will be the named shape containing the first appearance of selection and not any other shape. In other words, selection must be the only shape stored in NS.
") IsIdentified;
		static Standard_Boolean IsIdentified(const TDF_Label & access, const TopoDS_Shape & selection, opencascade::handle<TNaming_NamedShape> & NS, const Standard_Boolean Geometry = Standard_False);

		/****** TNaming_Selector::NamedShape ******/
		/****** md5 signature: f81ceec92565d5b27eb74fc46fdc0cc9 ******/
		%feature("compactdefaultargs") NamedShape;
		%feature("autodoc", "Return
-------
opencascade::handle<TNaming_NamedShape>

Description
-----------
Returns the NamedShape build or under construction, which contains the topological naming..
") NamedShape;
		opencascade::handle<TNaming_NamedShape> NamedShape();

		/****** TNaming_Selector::Select ******/
		/****** md5 signature: f6787249f27ffbeb261c45ccce5f3b3a ******/
		%feature("compactdefaultargs") Select;
		%feature("autodoc", "
Parameters
----------
Selection: TopoDS_Shape
Context: TopoDS_Shape
Geometry: bool (optional, default to Standard_False)
KeepOrientatation: bool (optional, default to Standard_False)

Return
-------
bool

Description
-----------
Creates a topological naming on the label aLabel given as an argument at construction time. If successful, the shape Selection - found in the shape Context - is now identified in the named shape returned in NamedShape. If Geometry is true, NamedShape contains the first appearance of Selection. This syntax is more robust than the previous syntax for this method.
") Select;
		Standard_Boolean Select(const TopoDS_Shape & Selection, const TopoDS_Shape & Context, const Standard_Boolean Geometry = Standard_False, const Standard_Boolean KeepOrientatation = Standard_False);

		/****** TNaming_Selector::Select ******/
		/****** md5 signature: 1b089f4a0c9e7f5c0183a64e085582fc ******/
		%feature("compactdefaultargs") Select;
		%feature("autodoc", "
Parameters
----------
Selection: TopoDS_Shape
Geometry: bool (optional, default to Standard_False)
KeepOrientatation: bool (optional, default to Standard_False)

Return
-------
bool

Description
-----------
Creates a topological naming on the label aLabel given as an argument at construction time. If successful, the shape Selection is now identified in the named shape returned in NamedShape. If Geometry is true, NamedShape contains the first appearance of Selection.
") Select;
		Standard_Boolean Select(const TopoDS_Shape & Selection, const Standard_Boolean Geometry = Standard_False, const Standard_Boolean KeepOrientatation = Standard_False);

		/****** TNaming_Selector::Solve ******/
		/****** md5 signature: 3df66f09832bf5105dae6beb36286f58 ******/
		%feature("compactdefaultargs") Solve;
		%feature("autodoc", "
Parameters
----------
Valid: TDF_LabelMap

Return
-------
bool

Description
-----------
Updates the topological naming on the label aLabel given as an argument at construction time. The underlying shape returned in the method NamedShape is updated. To read this shape, use the method TNaming_Tool::GetShape.
") Solve;
		Standard_Boolean Solve(TDF_LabelMap & Valid);

};


%extend TNaming_Selector {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class TNaming_ShapesSet *
**************************/
class TNaming_ShapesSet {
	public:
		/****** TNaming_ShapesSet::TNaming_ShapesSet ******/
		/****** md5 signature: 3867cd6e9fdf4394cc4aea0688c7148a ******/
		%feature("compactdefaultargs") TNaming_ShapesSet;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TNaming_ShapesSet;
		 TNaming_ShapesSet();

		/****** TNaming_ShapesSet::TNaming_ShapesSet ******/
		/****** md5 signature: 78fcf6ecaac3ac3cbba72f336517ce05 ******/
		%feature("compactdefaultargs") TNaming_ShapesSet;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
Type: TopAbs_ShapeEnum (optional, default to TopAbs_SHAPE)

Return
-------
None

Description
-----------
No available documentation.
") TNaming_ShapesSet;
		 TNaming_ShapesSet(const TopoDS_Shape & S, const TopAbs_ShapeEnum Type = TopAbs_SHAPE);

		/****** TNaming_ShapesSet::Add ******/
		/****** md5 signature: 5d2382c33d1c9820807378c2a0badd9f ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
bool

Description
-----------
Adds the Shape <S>.
") Add;
		Standard_Boolean Add(const TopoDS_Shape & S);

		/****** TNaming_ShapesSet::Add ******/
		/****** md5 signature: 694b6f3c32c0e6d71bc4fa40da255662 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
Shapes: TNaming_ShapesSet

Return
-------
None

Description
-----------
Adds the shapes contained in <Shapes>.
") Add;
		void Add(const TNaming_ShapesSet & Shapes);

		/****** TNaming_ShapesSet::ChangeMap ******/
		/****** md5 signature: 59a4fe45f6aed0c2e4b3d9af0228a846 ******/
		%feature("compactdefaultargs") ChangeMap;
		%feature("autodoc", "Return
-------
TopTools_MapOfShape

Description
-----------
No available documentation.
") ChangeMap;
		TopTools_MapOfShape & ChangeMap();

		/****** TNaming_ShapesSet::Clear ******/
		/****** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
Removes all Shapes.
") Clear;
		void Clear();

		/****** TNaming_ShapesSet::Contains ******/
		/****** md5 signature: f099b22f53dc3705b9de7f86b775b20a ******/
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
bool

Description
-----------
Returns True if <S> is in <self>.
") Contains;
		Standard_Boolean Contains(const TopoDS_Shape & S);

		/****** TNaming_ShapesSet::Filter ******/
		/****** md5 signature: c77e18f9d11a430ef7e8cda4de9aa38d ******/
		%feature("compactdefaultargs") Filter;
		%feature("autodoc", "
Parameters
----------
Shapes: TNaming_ShapesSet

Return
-------
None

Description
-----------
Erases in <self> the shapes not contained in <Shapes>.
") Filter;
		void Filter(const TNaming_ShapesSet & Shapes);

		/****** TNaming_ShapesSet::IsEmpty ******/
		/****** md5 signature: 6ab5e1ad63f93168856ab126dd374b81 ******/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsEmpty;
		Standard_Boolean IsEmpty();

		/****** TNaming_ShapesSet::Map ******/
		/****** md5 signature: 3583c11e164a7116bd04e325b8161d42 ******/
		%feature("compactdefaultargs") Map;
		%feature("autodoc", "Return
-------
TopTools_MapOfShape

Description
-----------
No available documentation.
") Map;
		const TopTools_MapOfShape & Map();

		/****** TNaming_ShapesSet::NbShapes ******/
		/****** md5 signature: ea90d1514db96ad18becf0e04a33abf6 ******/
		%feature("compactdefaultargs") NbShapes;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbShapes;
		Standard_Integer NbShapes();

		/****** TNaming_ShapesSet::Remove ******/
		/****** md5 signature: 5449c02e45435de23a9951ba8c39aa95 ******/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
bool

Description
-----------
Removes <S> in <self>.
") Remove;
		Standard_Boolean Remove(const TopoDS_Shape & S);

		/****** TNaming_ShapesSet::Remove ******/
		/****** md5 signature: f13ae410acbb09ecf50860c238d4414e ******/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "
Parameters
----------
Shapes: TNaming_ShapesSet

Return
-------
None

Description
-----------
Removes in <self> the shapes contained in <Shapes>.
") Remove;
		void Remove(const TNaming_ShapesSet & Shapes);

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
		/****** TNaming_Tool::Collect ******/
		/****** md5 signature: ef8694741dc8a5a15ddcb7a64161db4a ******/
		%feature("compactdefaultargs") Collect;
		%feature("autodoc", "
Parameters
----------
NS: TNaming_NamedShape
Labels: TNaming_MapOfNamedShape
OnlyModif: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
No available documentation.
") Collect;
		static void Collect(const opencascade::handle<TNaming_NamedShape> & NS, TNaming_MapOfNamedShape & Labels, const Standard_Boolean OnlyModif = Standard_True);

		/****** TNaming_Tool::CurrentNamedShape ******/
		/****** md5 signature: 147ce32f7bd73532989750f6a0b51960 ******/
		%feature("compactdefaultargs") CurrentNamedShape;
		%feature("autodoc", "
Parameters
----------
NS: TNaming_NamedShape
Updated: TDF_LabelMap

Return
-------
opencascade::handle<TNaming_NamedShape>

Description
-----------
Returns the NamedShape of the last Modification of <NS>. This shape is identified by a label.
") CurrentNamedShape;
		static opencascade::handle<TNaming_NamedShape> CurrentNamedShape(const opencascade::handle<TNaming_NamedShape> & NS, const TDF_LabelMap & Updated);

		/****** TNaming_Tool::CurrentNamedShape ******/
		/****** md5 signature: 30b845dfc2bf9683aac7c44f233fb27d ******/
		%feature("compactdefaultargs") CurrentNamedShape;
		%feature("autodoc", "
Parameters
----------
NS: TNaming_NamedShape

Return
-------
opencascade::handle<TNaming_NamedShape>

Description
-----------
Returns NamedShape the last Modification of <NS>.
") CurrentNamedShape;
		static opencascade::handle<TNaming_NamedShape> CurrentNamedShape(const opencascade::handle<TNaming_NamedShape> & NS);

		/****** TNaming_Tool::CurrentShape ******/
		/****** md5 signature: a0362e0bcc3348f0c4fdd8452378294d ******/
		%feature("compactdefaultargs") CurrentShape;
		%feature("autodoc", "
Parameters
----------
NS: TNaming_NamedShape

Return
-------
TopoDS_Shape

Description
-----------
Returns the last Modification of <NS>. Returns the shape CurrentShape contained in the named shape attribute NS. CurrentShape is the current state of the entities if they have been modified in other attributes of the same data structure. Each call to this function creates a new compound.
") CurrentShape;
		static TopoDS_Shape CurrentShape(const opencascade::handle<TNaming_NamedShape> & NS);

		/****** TNaming_Tool::CurrentShape ******/
		/****** md5 signature: 215ab93ac3381a87a82142c64be729d7 ******/
		%feature("compactdefaultargs") CurrentShape;
		%feature("autodoc", "
Parameters
----------
NS: TNaming_NamedShape
Updated: TDF_LabelMap

Return
-------
TopoDS_Shape

Description
-----------
Returns the shape CurrentShape contained in the named shape attribute NS, and present in the updated attribute map Updated. CurrentShape is the current state of the entities if they have been modified in other attributes of the same data structure. Each call to this function creates a new compound. Warning Only the contents of Updated are searched.R.
") CurrentShape;
		static TopoDS_Shape CurrentShape(const opencascade::handle<TNaming_NamedShape> & NS, const TDF_LabelMap & Updated);

		/****** TNaming_Tool::FindShape ******/
		/****** md5 signature: b8f0c64cfdf6508bb0b1b137412bd585 ******/
		%feature("compactdefaultargs") FindShape;
		%feature("autodoc", "
Parameters
----------
Valid: TDF_LabelMap
Forbiden: TDF_LabelMap
Arg: TNaming_NamedShape
S: TopoDS_Shape

Return
-------
None

Description
-----------
Returns the current shape (a Wire or a Shell) built (in the data framework) from the shapes of the argument named shape. It is used for IDENTITY name type computation.
") FindShape;
		static void FindShape(const TDF_LabelMap & Valid, const TDF_LabelMap & Forbiden, const opencascade::handle<TNaming_NamedShape> & Arg, TopoDS_Shape & S);

		/****** TNaming_Tool::GeneratedShape ******/
		/****** md5 signature: f0cadb1e38b87f8969e887a7314d2d10 ******/
		%feature("compactdefaultargs") GeneratedShape;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
Generation: TNaming_NamedShape

Return
-------
TopoDS_Shape

Description
-----------
Returns the shape generated from S or by a modification of S and contained in the named shape Generation.
") GeneratedShape;
		static TopoDS_Shape GeneratedShape(const TopoDS_Shape & S, const opencascade::handle<TNaming_NamedShape> & Generation);

		/****** TNaming_Tool::GetShape ******/
		/****** md5 signature: cec4b1e0ab6aee147cf66c42538a59f2 ******/
		%feature("compactdefaultargs") GetShape;
		%feature("autodoc", "
Parameters
----------
NS: TNaming_NamedShape

Return
-------
TopoDS_Shape

Description
-----------
Returns the entities stored in the named shape attribute NS. If there is only one old-new pair, the new shape is returned. Otherwise, a Compound is returned. This compound is made out of all the new shapes found. Each call to this function creates a new compound.
") GetShape;
		static TopoDS_Shape GetShape(const opencascade::handle<TNaming_NamedShape> & NS);

		/****** TNaming_Tool::HasLabel ******/
		/****** md5 signature: 954def380083a98f46aca9ad63a0f44c ******/
		%feature("compactdefaultargs") HasLabel;
		%feature("autodoc", "
Parameters
----------
access: TDF_Label
aShape: TopoDS_Shape

Return
-------
bool

Description
-----------
Returns True if <aShape> appears under a label.(DP).
") HasLabel;
		static Standard_Boolean HasLabel(const TDF_Label & access, const TopoDS_Shape & aShape);

		/****** TNaming_Tool::InitialShape ******/
		/****** md5 signature: 81b1aa5e7722455cca164c9008574081 ******/
		%feature("compactdefaultargs") InitialShape;
		%feature("autodoc", "
Parameters
----------
aShape: TopoDS_Shape
anAcces: TDF_Label
Labels: TDF_LabelList

Return
-------
TopoDS_Shape

Description
-----------
Returns the shape created from the shape aShape contained in the attribute anAcces.
") InitialShape;
		static TopoDS_Shape InitialShape(const TopoDS_Shape & aShape, const TDF_Label & anAcces, TDF_LabelList & Labels);

		/****** TNaming_Tool::Label ******/
		/****** md5 signature: 0b54c4797f0a294a17228be81e2d2f85 ******/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "
Parameters
----------
access: TDF_Label
aShape: TopoDS_Shape

Return
-------
TransDef: int

Description
-----------
Returns the label of the first apparition of <aShape>. Transdef is a value of the transaction of the first apparition of <aShape>.
") Label;
		static TDF_Label Label(const TDF_Label & access, const TopoDS_Shape & aShape, Standard_Integer &OutValue);

		/****** TNaming_Tool::NamedShape ******/
		/****** md5 signature: 3956ffe795685626652ab82ae42f4692 ******/
		%feature("compactdefaultargs") NamedShape;
		%feature("autodoc", "
Parameters
----------
aShape: TopoDS_Shape
anAcces: TDF_Label

Return
-------
opencascade::handle<TNaming_NamedShape>

Description
-----------
Returns the named shape attribute defined by the shape aShape and the label anAccess. This attribute is returned as a new shape. You call this function, if you need to create a topological attribute for existing data. Example class MyPkg_MyClass { public: Standard_Boolean SameEdge(const opencascade::handle<OCafTest_Line>& , const opencascade::handle<CafTest_Line>& ); }; //! Standard_Boolean MyPkg_MyClass::SameEdge (const opencascade::handle<OCafTest_Line>& L1 const opencascade::handle<OCafTest_Line>& L2) { opencascade::handle<TNaming_NamedShape> NS1 = L1->NamedShape(); opencascade::handle<TNaming_NamedShape> NS2 = L2->NamedShape(); //! return BRepTools::Compare(NS1->Get(),NS2->Get()); } In the example above, the function SameEdge is created to compare the edges having two lines for geometric supports. If these edges are found by BRepTools::Compare to be within the same tolerance, they are considered to be the same. Warning To avoid sharing of names, a SELECTED attribute will not be returned. Sharing of names makes it harder to manage the data structure. When the user of the name is removed, for example, it is difficult to know whether the name should be destroyed.
") NamedShape;
		static opencascade::handle<TNaming_NamedShape> NamedShape(const TopoDS_Shape & aShape, const TDF_Label & anAcces);

		/****** TNaming_Tool::OriginalShape ******/
		/****** md5 signature: cb14e7b2e814c72e923631b51a543cf6 ******/
		%feature("compactdefaultargs") OriginalShape;
		%feature("autodoc", "
Parameters
----------
NS: TNaming_NamedShape

Return
-------
TopoDS_Shape

Description
-----------
Returns the shape contained as OldShape in <NS>.
") OriginalShape;
		static TopoDS_Shape OriginalShape(const opencascade::handle<TNaming_NamedShape> & NS);

		/****** TNaming_Tool::ValidUntil ******/
		/****** md5 signature: 9f164e3076ba934991747c998e5f774c ******/
		%feature("compactdefaultargs") ValidUntil;
		%feature("autodoc", "
Parameters
----------
access: TDF_Label
S: TopoDS_Shape

Return
-------
int

Description
-----------
Returns the last transaction where the creation of S is valid.
") ValidUntil;
		static Standard_Integer ValidUntil(const TDF_Label & access, const TopoDS_Shape & S);

};


%extend TNaming_Tool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class TNaming_TranslateTool *
******************************/
class TNaming_TranslateTool : public Standard_Transient {
	public:
		/****** TNaming_TranslateTool::Add ******/
		/****** md5 signature: 6b673c7ba91c9e899062149b65350d5b ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
S1: TopoDS_Shape
S2: TopoDS_Shape

Return
-------
None

Description
-----------
No available documentation.
") Add;
		void Add(TopoDS_Shape & S1, const TopoDS_Shape & S2);

		/****** TNaming_TranslateTool::MakeCompSolid ******/
		/****** md5 signature: 57fc159dd32fae99ace17587ea7b56d4 ******/
		%feature("compactdefaultargs") MakeCompSolid;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
None

Description
-----------
No available documentation.
") MakeCompSolid;
		void MakeCompSolid(TopoDS_Shape & S);

		/****** TNaming_TranslateTool::MakeCompound ******/
		/****** md5 signature: dcd3e74dd7b8a83db2f4e804d7ab98c8 ******/
		%feature("compactdefaultargs") MakeCompound;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
None

Description
-----------
No available documentation.
") MakeCompound;
		void MakeCompound(TopoDS_Shape & S);

		/****** TNaming_TranslateTool::MakeEdge ******/
		/****** md5 signature: 350c8c28f1fe9326aa82159933a81031 ******/
		%feature("compactdefaultargs") MakeEdge;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
None

Description
-----------
No available documentation.
") MakeEdge;
		void MakeEdge(TopoDS_Shape & S);

		/****** TNaming_TranslateTool::MakeFace ******/
		/****** md5 signature: 19694e210773e5f7ca5011597a8db511 ******/
		%feature("compactdefaultargs") MakeFace;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
None

Description
-----------
No available documentation.
") MakeFace;
		void MakeFace(TopoDS_Shape & S);

		/****** TNaming_TranslateTool::MakeShell ******/
		/****** md5 signature: ef072484592d72c21a5082c6a15089ad ******/
		%feature("compactdefaultargs") MakeShell;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
None

Description
-----------
No available documentation.
") MakeShell;
		void MakeShell(TopoDS_Shape & S);

		/****** TNaming_TranslateTool::MakeSolid ******/
		/****** md5 signature: 09e9258c227e928cb1c324e293a90586 ******/
		%feature("compactdefaultargs") MakeSolid;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
None

Description
-----------
No available documentation.
") MakeSolid;
		void MakeSolid(TopoDS_Shape & S);

		/****** TNaming_TranslateTool::MakeVertex ******/
		/****** md5 signature: 7395c8b131e7972d27b87d345265e3b9 ******/
		%feature("compactdefaultargs") MakeVertex;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
None

Description
-----------
No available documentation.
") MakeVertex;
		void MakeVertex(TopoDS_Shape & S);

		/****** TNaming_TranslateTool::MakeWire ******/
		/****** md5 signature: 37a383ff4a6c5af9e98059c2dfcddea8 ******/
		%feature("compactdefaultargs") MakeWire;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
None

Description
-----------
No available documentation.
") MakeWire;
		void MakeWire(TopoDS_Shape & S);

		/****** TNaming_TranslateTool::UpdateEdge ******/
		/****** md5 signature: 32c88d6a80c068ef7bc4a8f3a213e626 ******/
		%feature("compactdefaultargs") UpdateEdge;
		%feature("autodoc", "
Parameters
----------
S1: TopoDS_Shape
S2: TopoDS_Shape
M: TColStd_IndexedDataMapOfTransientTransient

Return
-------
None

Description
-----------
No available documentation.
") UpdateEdge;
		void UpdateEdge(const TopoDS_Shape & S1, TopoDS_Shape & S2, TColStd_IndexedDataMapOfTransientTransient & M);

		/****** TNaming_TranslateTool::UpdateFace ******/
		/****** md5 signature: a3dc337fc26d7c028daac8cce270aefe ******/
		%feature("compactdefaultargs") UpdateFace;
		%feature("autodoc", "
Parameters
----------
S1: TopoDS_Shape
S2: TopoDS_Shape
M: TColStd_IndexedDataMapOfTransientTransient

Return
-------
None

Description
-----------
No available documentation.
") UpdateFace;
		void UpdateFace(const TopoDS_Shape & S1, TopoDS_Shape & S2, TColStd_IndexedDataMapOfTransientTransient & M);

		/****** TNaming_TranslateTool::UpdateShape ******/
		/****** md5 signature: 8bf8def5c83f533e58852e9d10059929 ******/
		%feature("compactdefaultargs") UpdateShape;
		%feature("autodoc", "
Parameters
----------
S1: TopoDS_Shape
S2: TopoDS_Shape

Return
-------
None

Description
-----------
No available documentation.
") UpdateShape;
		void UpdateShape(const TopoDS_Shape & S1, TopoDS_Shape & S2);

		/****** TNaming_TranslateTool::UpdateVertex ******/
		/****** md5 signature: 996e38d30dc10b9ceef4cc601d23d36d ******/
		%feature("compactdefaultargs") UpdateVertex;
		%feature("autodoc", "
Parameters
----------
S1: TopoDS_Shape
S2: TopoDS_Shape
M: TColStd_IndexedDataMapOfTransientTransient

Return
-------
None

Description
-----------
No available documentation.
") UpdateVertex;
		void UpdateVertex(const TopoDS_Shape & S1, TopoDS_Shape & S2, TColStd_IndexedDataMapOfTransientTransient & M);

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
class TNaming_Translator {
	public:
		/****** TNaming_Translator::TNaming_Translator ******/
		/****** md5 signature: 8e39179b5baea728f06e58e27cd7a796 ******/
		%feature("compactdefaultargs") TNaming_Translator;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TNaming_Translator;
		 TNaming_Translator();

		/****** TNaming_Translator::Add ******/
		/****** md5 signature: 1c2c17ad83f5b4f9122afbf2d2376f4f ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
aShape: TopoDS_Shape

Return
-------
None

Description
-----------
No available documentation.
") Add;
		void Add(const TopoDS_Shape & aShape);

		/****** TNaming_Translator::Copied ******/
		/****** md5 signature: e5699ddbbe3da727a49d616c89f9eac1 ******/
		%feature("compactdefaultargs") Copied;
		%feature("autodoc", "
Parameters
----------
aShape: TopoDS_Shape

Return
-------
TopoDS_Shape

Description
-----------
returns copied shape.
") Copied;
		const TopoDS_Shape Copied(const TopoDS_Shape & aShape);

		/****** TNaming_Translator::Copied ******/
		/****** md5 signature: d10333a4c793322b9feccf7e3a23523a ******/
		%feature("compactdefaultargs") Copied;
		%feature("autodoc", "Return
-------
TopTools_DataMapOfShapeShape

Description
-----------
returns DataMap of results; (shape <-> copied shape).
") Copied;
		const TopTools_DataMapOfShapeShape & Copied();

		/****** TNaming_Translator::DumpMap ******/
		/****** md5 signature: 0a2ceed5a21dd3be8407730ae50ff428 ******/
		%feature("compactdefaultargs") DumpMap;
		%feature("autodoc", "
Parameters
----------
isWrite: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
No available documentation.
") DumpMap;
		void DumpMap(const Standard_Boolean isWrite = Standard_False);

		/****** TNaming_Translator::IsDone ******/
		/****** md5 signature: ec0624071ec7da54b3d9dacc7bcb05f9 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsDone;
		Standard_Boolean IsDone();

		/****** TNaming_Translator::Perform ******/
		/****** md5 signature: c04b01412cba7220c024b5eb4532697f ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform();

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
		/****** TNaming_UsedShapes::AfterUndo ******/
		/****** md5 signature: 6a782c706f1e9291f121f77d889ed576 ******/
		%feature("compactdefaultargs") AfterUndo;
		%feature("autodoc", "
Parameters
----------
anAttDelta: TDF_AttributeDelta
forceIt: bool (optional, default to Standard_False)

Return
-------
bool

Description
-----------
Something to do after applying <anAttDelta>.
") AfterUndo;
		virtual Standard_Boolean AfterUndo(const opencascade::handle<TDF_AttributeDelta> & anAttDelta, const Standard_Boolean forceIt = Standard_False);

		/****** TNaming_UsedShapes::BackupCopy ******/
		/****** md5 signature: c0c9b77233d223451ec9a7e1bc2427c7 ******/
		%feature("compactdefaultargs") BackupCopy;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_Attribute>

Description
-----------
Copies the attribute contents into a new other attribute. It is used by Backup().
") BackupCopy;
		virtual opencascade::handle<TDF_Attribute> BackupCopy();

		/****** TNaming_UsedShapes::BeforeRemoval ******/
		/****** md5 signature: fb87f8354fd142d1ab3d9cd55ada4556 ******/
		%feature("compactdefaultargs") BeforeRemoval;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clears the table.
") BeforeRemoval;
		virtual void BeforeRemoval();

		/****** TNaming_UsedShapes::DeltaOnAddition ******/
		/****** md5 signature: aa2ea5db23993a7e5b0a25784c07a50b ******/
		%feature("compactdefaultargs") DeltaOnAddition;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_DeltaOnAddition>

Description
-----------
this method returns a null handle (no delta).
") DeltaOnAddition;
		virtual opencascade::handle<TDF_DeltaOnAddition> DeltaOnAddition();

		/****** TNaming_UsedShapes::DeltaOnRemoval ******/
		/****** md5 signature: fce2b18e72dadcfc2bcbf283227db136 ******/
		%feature("compactdefaultargs") DeltaOnRemoval;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_DeltaOnRemoval>

Description
-----------
this method returns a null handle (no delta).
") DeltaOnRemoval;
		virtual opencascade::handle<TDF_DeltaOnRemoval> DeltaOnRemoval();

		/****** TNaming_UsedShapes::Destroy ******/
		/****** md5 signature: 73111f72f4ab0474eb2cfbd7e4af4e1a ******/
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Destroy;
		void Destroy();

		/****** TNaming_UsedShapes::Dump ******/
		/****** md5 signature: 3398f1042b24f9ae49f7e8da6125f793 ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------

Return
-------
anOS: Standard_OStream

Description
-----------
Dumps the attribute on <aStream>.
") Dump;
		virtual Standard_OStream & Dump(std::ostream &OutValue);


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
		/****** TNaming_UsedShapes::GetID ******/
		/****** md5 signature: afe6002d90f641ca3ea8c9ae9f8fe97c ******/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
Returns the ID: 2a96b614-ec8b-11d0-bee7-080009dc3333.
") GetID;
		static const Standard_GUID & GetID();

		/****** TNaming_UsedShapes::ID ******/
		/****** md5 signature: 4697ce8a095fa6dcef0217708d19718f ******/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "Return
-------
Standard_GUID

Description
-----------
Returns the ID of the attribute.
") ID;
		const Standard_GUID & ID();

		/****** TNaming_UsedShapes::Map ******/
		/****** md5 signature: 9334310995a65460bf5da71aabb605e3 ******/
		%feature("compactdefaultargs") Map;
		%feature("autodoc", "Return
-------
TNaming_DataMapOfShapePtrRefShape

Description
-----------
No available documentation.
") Map;
		TNaming_DataMapOfShapePtrRefShape & Map();

		/****** TNaming_UsedShapes::NewEmpty ******/
		/****** md5 signature: 8be17a4d2a4deeee198571712e76805e ******/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "Return
-------
opencascade::handle<TDF_Attribute>

Description
-----------
Returns an new empty attribute from the good end type. It is used by the copy algorithm.
") NewEmpty;
		virtual opencascade::handle<TDF_Attribute> NewEmpty();

		/****** TNaming_UsedShapes::Paste ******/
		/****** md5 signature: 53b4ec32bedd752fc0ccd186074f75ef ******/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "
Parameters
----------
intoAttribute: TDF_Attribute
aRelocTationable: TDF_RelocationTable

Return
-------
None

Description
-----------
This method is different from the 'Copy' one, because it is used when copying an attribute from a source structure into a target structure. This method pastes the current attribute to the label corresponding to the insertor. The pasted attribute may be a brand new one or a new version of the previous one.
") Paste;
		virtual void Paste(const opencascade::handle<TDF_Attribute> & intoAttribute, const opencascade::handle<TDF_RelocationTable> & aRelocTationable);

		/****** TNaming_UsedShapes::References ******/
		/****** md5 signature: 3f614360a69c957f8600d26b49bc71b2 ******/
		%feature("compactdefaultargs") References;
		%feature("autodoc", "
Parameters
----------
aDataSet: TDF_DataSet

Return
-------
None

Description
-----------
Adds the directly referenced attributes and labels to <aDataSet>. 'Directly' means we have only to look at the first level of references. //! For this, use only the AddLabel() & AddAttribute() from DataSet and do not try to modify information previously stored in <aDataSet>.
") References;
		virtual void References(const opencascade::handle<TDF_DataSet> & aDataSet);

		/****** TNaming_UsedShapes::Restore ******/
		/****** md5 signature: c280e51bf6f4f3b5011b0c3698dfb001 ******/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "
Parameters
----------
anAttribute: TDF_Attribute

Return
-------
None

Description
-----------
Restores the contents from <anAttribute> into this one. It is used when aborting a transaction.
") Restore;
		virtual void Restore(const opencascade::handle<TDF_Attribute> & anAttribute);

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
/* class aliases */
%pythoncode {
}
/* deprecated methods */
%pythoncode {
@deprecated
def tnaming_ChangeShapes(*args):
	return tnaming.ChangeShapes(*args)

@deprecated
def tnaming_Displace(*args):
	return tnaming.Displace(*args)

@deprecated
def tnaming_FindUniqueContext(*args):
	return tnaming.FindUniqueContext(*args)

@deprecated
def tnaming_FindUniqueContextSet(*args):
	return tnaming.FindUniqueContextSet(*args)

@deprecated
def tnaming_IDList(*args):
	return tnaming.IDList(*args)

@deprecated
def tnaming_MakeShape(*args):
	return tnaming.MakeShape(*args)

@deprecated
def tnaming_OuterShell(*args):
	return tnaming.OuterShell(*args)

@deprecated
def tnaming_OuterWire(*args):
	return tnaming.OuterWire(*args)

@deprecated
def tnaming_Print(*args):
	return tnaming.Print(*args)

@deprecated
def tnaming_Print(*args):
	return tnaming.Print(*args)

@deprecated
def tnaming_Print(*args):
	return tnaming.Print(*args)

@deprecated
def tnaming_Replicate(*args):
	return tnaming.Replicate(*args)

@deprecated
def tnaming_Replicate(*args):
	return tnaming.Replicate(*args)

@deprecated
def tnaming_Substitute(*args):
	return tnaming.Substitute(*args)

@deprecated
def tnaming_SubstituteSShape(*args):
	return tnaming.SubstituteSShape(*args)

@deprecated
def tnaming_Transform(*args):
	return tnaming.Transform(*args)

@deprecated
def tnaming_Update(*args):
	return tnaming.Update(*args)

@deprecated
def TNaming_CopyShape_CopyTool(*args):
	return TNaming_CopyShape.CopyTool(*args)

@deprecated
def TNaming_CopyShape_Translate(*args):
	return TNaming_CopyShape.Translate(*args)

@deprecated
def TNaming_CopyShape_Translate(*args):
	return TNaming_CopyShape.Translate(*args)

@deprecated
def TNaming_Localizer_FindGenerator(*args):
	return TNaming_Localizer.FindGenerator(*args)

@deprecated
def TNaming_Localizer_FindShapeContext(*args):
	return TNaming_Localizer.FindShapeContext(*args)

@deprecated
def TNaming_Localizer_IsNew(*args):
	return TNaming_Localizer.IsNew(*args)

@deprecated
def TNaming_NamedShape_GetID(*args):
	return TNaming_NamedShape.GetID(*args)

@deprecated
def TNaming_Naming_GetID(*args):
	return TNaming_Naming.GetID(*args)

@deprecated
def TNaming_Naming_Insert(*args):
	return TNaming_Naming.Insert(*args)

@deprecated
def TNaming_Naming_Name(*args):
	return TNaming_Naming.Name(*args)

@deprecated
def TNaming_NamingTool_BuildDescendants(*args):
	return TNaming_NamingTool.BuildDescendants(*args)

@deprecated
def TNaming_NamingTool_CurrentShape(*args):
	return TNaming_NamingTool.CurrentShape(*args)

@deprecated
def TNaming_NamingTool_CurrentShapeFromShape(*args):
	return TNaming_NamingTool.CurrentShapeFromShape(*args)

@deprecated
def TNaming_Selector_IsIdentified(*args):
	return TNaming_Selector.IsIdentified(*args)

@deprecated
def TNaming_Tool_Collect(*args):
	return TNaming_Tool.Collect(*args)

@deprecated
def TNaming_Tool_CurrentNamedShape(*args):
	return TNaming_Tool.CurrentNamedShape(*args)

@deprecated
def TNaming_Tool_CurrentNamedShape(*args):
	return TNaming_Tool.CurrentNamedShape(*args)

@deprecated
def TNaming_Tool_CurrentShape(*args):
	return TNaming_Tool.CurrentShape(*args)

@deprecated
def TNaming_Tool_CurrentShape(*args):
	return TNaming_Tool.CurrentShape(*args)

@deprecated
def TNaming_Tool_FindShape(*args):
	return TNaming_Tool.FindShape(*args)

@deprecated
def TNaming_Tool_GeneratedShape(*args):
	return TNaming_Tool.GeneratedShape(*args)

@deprecated
def TNaming_Tool_GetShape(*args):
	return TNaming_Tool.GetShape(*args)

@deprecated
def TNaming_Tool_HasLabel(*args):
	return TNaming_Tool.HasLabel(*args)

@deprecated
def TNaming_Tool_InitialShape(*args):
	return TNaming_Tool.InitialShape(*args)

@deprecated
def TNaming_Tool_Label(*args):
	return TNaming_Tool.Label(*args)

@deprecated
def TNaming_Tool_NamedShape(*args):
	return TNaming_Tool.NamedShape(*args)

@deprecated
def TNaming_Tool_OriginalShape(*args):
	return TNaming_Tool.OriginalShape(*args)

@deprecated
def TNaming_Tool_ValidUntil(*args):
	return TNaming_Tool.ValidUntil(*args)

@deprecated
def TNaming_UsedShapes_GetID(*args):
	return TNaming_UsedShapes.GetID(*args)

}
