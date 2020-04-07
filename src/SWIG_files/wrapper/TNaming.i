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

/* python proy classes for enums */
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
%template(TNaming_MapOfNamedShape) NCollection_Map<opencascade::handle<TNaming_NamedShape>,TNaming_NamedShapeHasher>;
%template(TNaming_MapOfShape) NCollection_Map<TopoDS_Shape>;
%template(TNaming_NamedShapeHasher) NCollection_DefaultHasher<opencascade::handle<TNaming_NamedShape>>;
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
typedef NCollection_Map<opencascade::handle<TNaming_NamedShape>, TNaming_NamedShapeHasher>::Iterator TNaming_MapIteratorOfMapOfNamedShape;
typedef TNaming_MapOfShape::Iterator TNaming_MapIteratorOfMapOfShape;
typedef NCollection_Map<opencascade::handle<TNaming_NamedShape>, TNaming_NamedShapeHasher> TNaming_MapOfNamedShape;
typedef NCollection_Map<TopoDS_Shape> TNaming_MapOfShape;
typedef NCollection_DefaultHasher<opencascade::handle<TNaming_NamedShape>> TNaming_NamedShapeHasher;
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
		/****************** ChangeShapes ******************/
		%feature("compactdefaultargs") ChangeShapes;
		%feature("autodoc", "Remplace les shapes du label et des sous-labels par des copies.

Parameters
----------
label: TDF_Label
M: TopTools_DataMapOfShapeShape

Returns
-------
None
") ChangeShapes;
		static void ChangeShapes(const TDF_Label & label, TopTools_DataMapOfShapeShape & M);

		/****************** Displace ******************/
		%feature("compactdefaultargs") Displace;
		%feature("autodoc", "Application de la location sur les shapes du label et de ses sous labels.

Parameters
----------
label: TDF_Label
aLocation: TopLoc_Location
WithOld: bool,optional
	default value is Standard_True

Returns
-------
None
") Displace;
		static void Displace(const TDF_Label & label, const TopLoc_Location & aLocation, const Standard_Boolean WithOld = Standard_True);

		/****************** FindUniqueContext ******************/
		%feature("compactdefaultargs") FindUniqueContext;
		%feature("autodoc", "Find unique context of shape <s>.

Parameters
----------
S: TopoDS_Shape
Context: TopoDS_Shape

Returns
-------
TopoDS_Shape
") FindUniqueContext;
		static TopoDS_Shape FindUniqueContext(const TopoDS_Shape & S, const TopoDS_Shape & Context);

		/****************** FindUniqueContextSet ******************/
		%feature("compactdefaultargs") FindUniqueContextSet;
		%feature("autodoc", "Find unique context of shape <s>,which is pure concatenation of atomic shapes (compound). the result is concatenation of single contexts.

Parameters
----------
S: TopoDS_Shape
Context: TopoDS_Shape
Arr: TopTools_HArray1OfShape

Returns
-------
TopoDS_Shape
") FindUniqueContextSet;
		static TopoDS_Shape FindUniqueContextSet(const TopoDS_Shape & S, const TopoDS_Shape & Context, opencascade::handle<TopTools_HArray1OfShape> & Arr);

		/****************** IDList ******************/
		%feature("compactdefaultargs") IDList;
		%feature("autodoc", "Appends to <anidlist> the list of the attributes ids of this package. caution: <anidlist> is not cleared before use.

Parameters
----------
anIDList: TDF_IDList

Returns
-------
None
") IDList;
		static void IDList(TDF_IDList & anIDList);

		/****************** MakeShape ******************/
		%feature("compactdefaultargs") MakeShape;
		%feature("autodoc", "Builds shape from map content.

Parameters
----------
MS: TopTools_MapOfShape

Returns
-------
TopoDS_Shape
") MakeShape;
		static TopoDS_Shape MakeShape(const TopTools_MapOfShape & MS);

		/****************** OuterShell ******************/
		%feature("compactdefaultargs") OuterShell;
		%feature("autodoc", "Returns true if outer shell is found and the found shell in <theshell>. print of tnaming enumeration =============================.

Parameters
----------
theSolid: TopoDS_Solid
theShell: TopoDS_Shell

Returns
-------
bool
") OuterShell;
		static Standard_Boolean OuterShell(const TopoDS_Solid & theSolid, TopoDS_Shell & theShell);

		/****************** OuterWire ******************/
		%feature("compactdefaultargs") OuterWire;
		%feature("autodoc", "Returns true if outer wire is found and the found wire in <thewire>.

Parameters
----------
theFace: TopoDS_Face
theWire: TopoDS_Wire

Returns
-------
bool
") OuterWire;
		static Standard_Boolean OuterWire(const TopoDS_Face & theFace, TopoDS_Wire & theWire);

		/****************** Replicate ******************/
		%feature("compactdefaultargs") Replicate;
		%feature("autodoc", "Replicates the named shape with the transformation <t> on the label <l> (and sub-labels if necessary) (tnaming_generated is set).

Parameters
----------
NS: TNaming_NamedShape
T: gp_Trsf
L: TDF_Label

Returns
-------
None
") Replicate;
		static void Replicate(const opencascade::handle<TNaming_NamedShape> & NS, const gp_Trsf & T, const TDF_Label & L);

		/****************** Replicate ******************/
		%feature("compactdefaultargs") Replicate;
		%feature("autodoc", "Replicates the shape with the transformation <t> on the label <l> (and sub-labels if necessary) (tnaming_generated is set).

Parameters
----------
SH: TopoDS_Shape
T: gp_Trsf
L: TDF_Label

Returns
-------
None
") Replicate;
		static void Replicate(const TopoDS_Shape & SH, const gp_Trsf & T, const TDF_Label & L);

		/****************** Substitute ******************/
		%feature("compactdefaultargs") Substitute;
		%feature("autodoc", "Subtituter les shapes sur les structures de source vers cible.

Parameters
----------
labelsource: TDF_Label
labelcible: TDF_Label
mapOldNew: TopTools_DataMapOfShapeShape

Returns
-------
None
") Substitute;
		static void Substitute(const TDF_Label & labelsource, const TDF_Label & labelcible, TopTools_DataMapOfShapeShape & mapOldNew);

		/****************** SubstituteSShape ******************/
		%feature("compactdefaultargs") SubstituteSShape;
		%feature("autodoc", "Subtitutes shape in source structure.

Parameters
----------
accesslabel: TDF_Label
From: TopoDS_Shape
To: TopoDS_Shape

Returns
-------
bool
") SubstituteSShape;
		static Standard_Boolean SubstituteSShape(const TDF_Label & accesslabel, const TopoDS_Shape & From, TopoDS_Shape & To);

		/****************** Transform ******************/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "Application de la transformation sur les shapes du label et de ses sous labels. warning: le remplacement du shape est fait dans tous les attributs qui le contiennent meme si ceux ci ne sont pas associees a des sous-labels de <label>.

Parameters
----------
label: TDF_Label
aTransformation: gp_Trsf

Returns
-------
None
") Transform;
		static void Transform(const TDF_Label & label, const gp_Trsf & aTransformation);

		/****************** Update ******************/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "Mise a jour des shapes du label et de ses fils en tenant compte des substitutions decrite par mapoldnew. //! warning: le remplacement du shape est fait dans tous les attributs qui le contiennent meme si ceux ci ne sont pas associees a des sous-labels de <label>.

Parameters
----------
label: TDF_Label
mapOldNew: TopTools_DataMapOfShapeShape

Returns
-------
None
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
		/****************** TNaming_Builder ******************/
		%feature("compactdefaultargs") TNaming_Builder;
		%feature("autodoc", "Create an builder. warning: before addition copies the current value, and clear.

Parameters
----------
aLabel: TDF_Label

Returns
-------
None
") TNaming_Builder;
		 TNaming_Builder(const TDF_Label & aLabel);

		/****************** Delete ******************/
		%feature("compactdefaultargs") Delete;
		%feature("autodoc", "Records the shape oldshape which was deleted from the current label. as an example, consider the case of a face removed by a boolean operation.

Parameters
----------
oldShape: TopoDS_Shape

Returns
-------
None
") Delete;
		void Delete(const TopoDS_Shape & oldShape);

		/****************** Generated ******************/
		%feature("compactdefaultargs") Generated;
		%feature("autodoc", "Records the shape newshape which was generated during a topological construction. as an example, consider the case of a face generated in construction of a box.

Parameters
----------
newShape: TopoDS_Shape

Returns
-------
None
") Generated;
		void Generated(const TopoDS_Shape & newShape);

		/****************** Generated ******************/
		%feature("compactdefaultargs") Generated;
		%feature("autodoc", "Records the shape newshape which was generated from the shape oldshape during a topological construction. as an example, consider the case of a face generated from an edge in construction of a prism.

Parameters
----------
oldShape: TopoDS_Shape
newShape: TopoDS_Shape

Returns
-------
None
") Generated;
		void Generated(const TopoDS_Shape & oldShape, const TopoDS_Shape & newShape);

		/****************** Modify ******************/
		%feature("compactdefaultargs") Modify;
		%feature("autodoc", "Records the shape newshape which is a modification of the shape oldshape. as an example, consider the case of a face split or merged in a boolean operation.

Parameters
----------
oldShape: TopoDS_Shape
newShape: TopoDS_Shape

Returns
-------
None
") Modify;
		void Modify(const TopoDS_Shape & oldShape, const TopoDS_Shape & newShape);

		/****************** NamedShape ******************/
		%feature("compactdefaultargs") NamedShape;
		%feature("autodoc", "Returns the namedshape which has been built or is under construction.

Returns
-------
opencascade::handle<TNaming_NamedShape>
") NamedShape;
		opencascade::handle<TNaming_NamedShape> NamedShape();

		/****************** Select ******************/
		%feature("compactdefaultargs") Select;
		%feature("autodoc", "Add a shape to the current label , this shape is unmodified. used for example to define a set of shapes under a label.

Parameters
----------
aShape: TopoDS_Shape
inShape: TopoDS_Shape

Returns
-------
None
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
		/****************** CopyTool ******************/
		%feature("compactdefaultargs") CopyTool;
		%feature("autodoc", "Makes copy a set of shape(s), using the amap.

Parameters
----------
aShape: TopoDS_Shape
aMap: TColStd_IndexedDataMapOfTransientTransient
aResult: TopoDS_Shape

Returns
-------
None
") CopyTool;
		static void CopyTool(const TopoDS_Shape & aShape, TColStd_IndexedDataMapOfTransientTransient & aMap, TopoDS_Shape & aResult);

		/****************** Translate ******************/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "Translates a transient shape(s) to transient.

Parameters
----------
aShape: TopoDS_Shape
aMap: TColStd_IndexedDataMapOfTransientTransient
aResult: TopoDS_Shape
TrTool: TNaming_TranslateTool

Returns
-------
None
") Translate;
		static void Translate(const TopoDS_Shape & aShape, TColStd_IndexedDataMapOfTransientTransient & aMap, TopoDS_Shape & aResult, const opencascade::handle<TNaming_TranslateTool> & TrTool);

		/****************** Translate ******************/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "Translates a topological location to an other top. location.

Parameters
----------
L: TopLoc_Location
aMap: TColStd_IndexedDataMapOfTransientTransient

Returns
-------
TopLoc_Location
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
		/****************** TNaming_DeltaOnModification ******************/
		%feature("compactdefaultargs") TNaming_DeltaOnModification;
		%feature("autodoc", "Initializes a tdf_deltaonmodification.

Parameters
----------
NS: TNaming_NamedShape

Returns
-------
None
") TNaming_DeltaOnModification;
		 TNaming_DeltaOnModification(const opencascade::handle<TNaming_NamedShape> & NS);

		/****************** Apply ******************/
		%feature("compactdefaultargs") Apply;
		%feature("autodoc", "Applies the delta to the attribute.

Returns
-------
None
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
		/****************** TNaming_DeltaOnRemoval ******************/
		%feature("compactdefaultargs") TNaming_DeltaOnRemoval;
		%feature("autodoc", "Initializes a tdf_deltaonmodification.

Parameters
----------
NS: TNaming_NamedShape

Returns
-------
None
") TNaming_DeltaOnRemoval;
		 TNaming_DeltaOnRemoval(const opencascade::handle<TNaming_NamedShape> & NS);

		/****************** Apply ******************/
		%feature("compactdefaultargs") Apply;
		%feature("autodoc", "Applies the delta to the attribute.

Returns
-------
None
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
		/****************** TNaming_Identifier ******************/
		%feature("compactdefaultargs") TNaming_Identifier;
		%feature("autodoc", "No available documentation.

Parameters
----------
Lab: TDF_Label
S: TopoDS_Shape
Context: TopoDS_Shape
Geom: bool

Returns
-------
None
") TNaming_Identifier;
		 TNaming_Identifier(const TDF_Label & Lab, const TopoDS_Shape & S, const TopoDS_Shape & Context, const Standard_Boolean Geom);

		/****************** TNaming_Identifier ******************/
		%feature("compactdefaultargs") TNaming_Identifier;
		%feature("autodoc", "No available documentation.

Parameters
----------
Lab: TDF_Label
S: TopoDS_Shape
ContextNS: TNaming_NamedShape
Geom: bool

Returns
-------
None
") TNaming_Identifier;
		 TNaming_Identifier(const TDF_Label & Lab, const TopoDS_Shape & S, const opencascade::handle<TNaming_NamedShape> & ContextNS, const Standard_Boolean Geom);

		/****************** AncestorIdentification ******************/
		%feature("compactdefaultargs") AncestorIdentification;
		%feature("autodoc", "No available documentation.

Parameters
----------
Localizer: TNaming_Localizer
Context: TopoDS_Shape

Returns
-------
None
") AncestorIdentification;
		void AncestorIdentification(TNaming_Localizer & Localizer, const TopoDS_Shape & Context);

		/****************** ArgIsFeature ******************/
		%feature("compactdefaultargs") ArgIsFeature;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") ArgIsFeature;
		Standard_Boolean ArgIsFeature();

		/****************** Feature ******************/
		%feature("compactdefaultargs") Feature;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TNaming_NamedShape>
") Feature;
		opencascade::handle<TNaming_NamedShape> Feature();

		/****************** FeatureArg ******************/
		%feature("compactdefaultargs") FeatureArg;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TNaming_NamedShape>
") FeatureArg;
		opencascade::handle<TNaming_NamedShape> FeatureArg();

		/****************** GeneratedIdentification ******************/
		%feature("compactdefaultargs") GeneratedIdentification;
		%feature("autodoc", "No available documentation.

Parameters
----------
Localizer: TNaming_Localizer
NS: TNaming_NamedShape

Returns
-------
None
") GeneratedIdentification;
		void GeneratedIdentification(TNaming_Localizer & Localizer, const opencascade::handle<TNaming_NamedShape> & NS);

		/****************** Identification ******************/
		%feature("compactdefaultargs") Identification;
		%feature("autodoc", "No available documentation.

Parameters
----------
Localizer: TNaming_Localizer
NS: TNaming_NamedShape

Returns
-------
None
") Identification;
		void Identification(TNaming_Localizer & Localizer, const opencascade::handle<TNaming_NamedShape> & NS);

		/****************** InitArgs ******************/
		%feature("compactdefaultargs") InitArgs;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") InitArgs;
		void InitArgs();

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** IsFeature ******************/
		%feature("compactdefaultargs") IsFeature;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsFeature;
		Standard_Boolean IsFeature();

		/****************** MoreArgs ******************/
		%feature("compactdefaultargs") MoreArgs;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") MoreArgs;
		Standard_Boolean MoreArgs();

		/****************** NamedShapeOfGeneration ******************/
		%feature("compactdefaultargs") NamedShapeOfGeneration;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TNaming_NamedShape>
") NamedShapeOfGeneration;
		opencascade::handle<TNaming_NamedShape> NamedShapeOfGeneration();

		/****************** NextArg ******************/
		%feature("compactdefaultargs") NextArg;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") NextArg;
		void NextArg();

		/****************** PrimitiveIdentification ******************/
		%feature("compactdefaultargs") PrimitiveIdentification;
		%feature("autodoc", "No available documentation.

Parameters
----------
Localizer: TNaming_Localizer
NS: TNaming_NamedShape

Returns
-------
None
") PrimitiveIdentification;
		void PrimitiveIdentification(TNaming_Localizer & Localizer, const opencascade::handle<TNaming_NamedShape> & NS);

		/****************** ShapeArg ******************/
		%feature("compactdefaultargs") ShapeArg;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Shape
") ShapeArg;
		TopoDS_Shape ShapeArg();

		/****************** ShapeContext ******************/
		%feature("compactdefaultargs") ShapeContext;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Shape
") ShapeContext;
		TopoDS_Shape ShapeContext();

		/****************** Type ******************/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "No available documentation.

Returns
-------
TNaming_NameType
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
		/****************** TNaming_Iterator ******************/
		%feature("compactdefaultargs") TNaming_Iterator;
		%feature("autodoc", "Iterates on all the history records in <anatt>.

Parameters
----------
anAtt: TNaming_NamedShape

Returns
-------
None
") TNaming_Iterator;
		 TNaming_Iterator(const opencascade::handle<TNaming_NamedShape> & anAtt);

		/****************** TNaming_Iterator ******************/
		%feature("compactdefaultargs") TNaming_Iterator;
		%feature("autodoc", "Iterates on all the history records in the current transaction.

Parameters
----------
aLabel: TDF_Label

Returns
-------
None
") TNaming_Iterator;
		 TNaming_Iterator(const TDF_Label & aLabel);

		/****************** TNaming_Iterator ******************/
		%feature("compactdefaultargs") TNaming_Iterator;
		%feature("autodoc", "Iterates on all the history records in the transaction <atrans>.

Parameters
----------
aLabel: TDF_Label
aTrans: int

Returns
-------
None
") TNaming_Iterator;
		 TNaming_Iterator(const TDF_Label & aLabel, const Standard_Integer aTrans);

		/****************** Evolution ******************/
		%feature("compactdefaultargs") Evolution;
		%feature("autodoc", "No available documentation.

Returns
-------
TNaming_Evolution
") Evolution;
		TNaming_Evolution Evolution();

		/****************** IsModification ******************/
		%feature("compactdefaultargs") IsModification;
		%feature("autodoc", "Returns true if the new shape is a modification (split, fuse,etc...) of the old shape.

Returns
-------
bool
") IsModification;
		Standard_Boolean IsModification();

		/****************** More ******************/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Returns true if there is a current item in the iteration.

Returns
-------
bool
") More;
		Standard_Boolean More();

		/****************** NewShape ******************/
		%feature("compactdefaultargs") NewShape;
		%feature("autodoc", "Returns the new shape in this iterator object.

Returns
-------
TopoDS_Shape
") NewShape;
		const TopoDS_Shape NewShape();

		/****************** Next ******************/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Moves the iteration to the next item.

Returns
-------
None
") Next;
		void Next();

		/****************** OldShape ******************/
		%feature("compactdefaultargs") OldShape;
		%feature("autodoc", "Returns the old shape in this iterator object. this shape can be a null one.

Returns
-------
TopoDS_Shape
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
		/****************** TNaming_IteratorOnShapesSet ******************/
		%feature("compactdefaultargs") TNaming_IteratorOnShapesSet;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TNaming_IteratorOnShapesSet;
		 TNaming_IteratorOnShapesSet();

		/****************** TNaming_IteratorOnShapesSet ******************/
		%feature("compactdefaultargs") TNaming_IteratorOnShapesSet;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TNaming_ShapesSet

Returns
-------
None
") TNaming_IteratorOnShapesSet;
		 TNaming_IteratorOnShapesSet(const TNaming_ShapesSet & S);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize the iteration.

Parameters
----------
S: TNaming_ShapesSet

Returns
-------
None
") Init;
		void Init(const TNaming_ShapesSet & S);

		/****************** More ******************/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Returns true if there is a current item in the iteration.

Returns
-------
bool
") More;
		Standard_Boolean More();

		/****************** Next ******************/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Move to the next item.

Returns
-------
None
") Next;
		void Next();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Shape
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
		/****************** TNaming_Localizer ******************/
		%feature("compactdefaultargs") TNaming_Localizer;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TNaming_Localizer;
		 TNaming_Localizer();

		/****************** Ancestors ******************/
		%feature("compactdefaultargs") Ancestors;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape
Type: TopAbs_ShapeEnum

Returns
-------
TopTools_IndexedDataMapOfShapeListOfShape
") Ancestors;
		const TopTools_IndexedDataMapOfShapeListOfShape & Ancestors(const TopoDS_Shape & S, const TopAbs_ShapeEnum Type);

		/****************** Backward ******************/
		%feature("compactdefaultargs") Backward;
		%feature("autodoc", "No available documentation.

Parameters
----------
NS: TNaming_NamedShape
S: TopoDS_Shape
Primitives: TNaming_MapOfNamedShape
ValidShapes: TopTools_MapOfShape

Returns
-------
None
") Backward;
		void Backward(const opencascade::handle<TNaming_NamedShape> & NS, const TopoDS_Shape & S, TNaming_MapOfNamedShape & Primitives, TopTools_MapOfShape & ValidShapes);

		/****************** FindFeaturesInAncestors ******************/
		%feature("compactdefaultargs") FindFeaturesInAncestors;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape
In: TopoDS_Shape
AncInFeatures: TopTools_MapOfShape

Returns
-------
None
") FindFeaturesInAncestors;
		void FindFeaturesInAncestors(const TopoDS_Shape & S, const TopoDS_Shape & In, TopTools_MapOfShape & AncInFeatures);

		/****************** FindGenerator ******************/
		%feature("compactdefaultargs") FindGenerator;
		%feature("autodoc", "No available documentation.

Parameters
----------
NS: TNaming_NamedShape
S: TopoDS_Shape
theListOfGenerators: TopTools_ListOfShape

Returns
-------
None
") FindGenerator;
		static void FindGenerator(const opencascade::handle<TNaming_NamedShape> & NS, const TopoDS_Shape & S, TopTools_ListOfShape & theListOfGenerators);

		/****************** FindNeighbourg ******************/
		%feature("compactdefaultargs") FindNeighbourg;
		%feature("autodoc", "No available documentation.

Parameters
----------
Cont: TopoDS_Shape
S: TopoDS_Shape
Neighbourg: TopTools_MapOfShape

Returns
-------
None
") FindNeighbourg;
		void FindNeighbourg(const TopoDS_Shape & Cont, const TopoDS_Shape & S, TopTools_MapOfShape & Neighbourg);

		/****************** FindShapeContext ******************/
		%feature("compactdefaultargs") FindShapeContext;
		%feature("autodoc", "Finds context of the shape <s>.

Parameters
----------
NS: TNaming_NamedShape
theS: TopoDS_Shape
theSC: TopoDS_Shape

Returns
-------
None
") FindShapeContext;
		static void FindShapeContext(const opencascade::handle<TNaming_NamedShape> & NS, const TopoDS_Shape & theS, TopoDS_Shape & theSC);

		/****************** GoBack ******************/
		%feature("compactdefaultargs") GoBack;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape
Lab: TDF_Label
Evol: TNaming_Evolution
OldS: TopTools_ListOfShape
OldLab: TNaming_ListOfNamedShape

Returns
-------
None
") GoBack;
		void GoBack(const TopoDS_Shape & S, const TDF_Label & Lab, const TNaming_Evolution Evol, TopTools_ListOfShape & OldS, TNaming_ListOfNamedShape & OldLab);

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
US: TNaming_UsedShapes
CurTrans: int

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TNaming_UsedShapes> & US, const Standard_Integer CurTrans);

		/****************** IsNew ******************/
		%feature("compactdefaultargs") IsNew;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape
NS: TNaming_NamedShape

Returns
-------
bool
") IsNew;
		static Standard_Boolean IsNew(const TopoDS_Shape & S, const opencascade::handle<TNaming_NamedShape> & NS);

		/****************** SubShapes ******************/
		%feature("compactdefaultargs") SubShapes;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape
Type: TopAbs_ShapeEnum

Returns
-------
TopTools_MapOfShape
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
		/****************** TNaming_Name ******************/
		%feature("compactdefaultargs") TNaming_Name;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TNaming_Name;
		 TNaming_Name();

		/****************** Append ******************/
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "No available documentation.

Parameters
----------
arg: TNaming_NamedShape

Returns
-------
None
") Append;
		void Append(const opencascade::handle<TNaming_NamedShape> & arg);

		/****************** Arguments ******************/
		%feature("compactdefaultargs") Arguments;
		%feature("autodoc", "No available documentation.

Returns
-------
TNaming_ListOfNamedShape
") Arguments;
		const TNaming_ListOfNamedShape & Arguments();

		/****************** ContextLabel ******************/
		%feature("compactdefaultargs") ContextLabel;
		%feature("autodoc", "No available documentation.

Parameters
----------
theLab: TDF_Label

Returns
-------
None
") ContextLabel;
		void ContextLabel(const TDF_Label & theLab);

		/****************** ContextLabel ******************/
		%feature("compactdefaultargs") ContextLabel;
		%feature("autodoc", "No available documentation.

Returns
-------
TDF_Label
") ContextLabel;
		const TDF_Label & ContextLabel();

		/****************** Index ******************/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: int

Returns
-------
None
") Index;
		void Index(const Standard_Integer I);

		/****************** Index ******************/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") Index;
		Standard_Integer Index();

		/****************** Orientation ******************/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "No available documentation.

Parameters
----------
theOrientation: TopAbs_Orientation

Returns
-------
None
") Orientation;
		void Orientation(const TopAbs_Orientation theOrientation);

		/****************** Orientation ******************/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "No available documentation.

Returns
-------
TopAbs_Orientation
") Orientation;
		TopAbs_Orientation Orientation();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "No available documentation.

Parameters
----------
into: TNaming_Name
RT: TDF_RelocationTable

Returns
-------
None
") Paste;
		void Paste(TNaming_Name & into, const opencascade::handle<TDF_RelocationTable> & RT);

		/****************** Shape ******************/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "No available documentation.

Parameters
----------
theShape: TopoDS_Shape

Returns
-------
None
") Shape;
		void Shape(const TopoDS_Shape & theShape);

		/****************** Shape ******************/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Shape
") Shape;
		TopoDS_Shape Shape();

		/****************** ShapeType ******************/
		%feature("compactdefaultargs") ShapeType;
		%feature("autodoc", "No available documentation.

Parameters
----------
aType: TopAbs_ShapeEnum

Returns
-------
None
") ShapeType;
		void ShapeType(const TopAbs_ShapeEnum aType);

		/****************** ShapeType ******************/
		%feature("compactdefaultargs") ShapeType;
		%feature("autodoc", "No available documentation.

Returns
-------
TopAbs_ShapeEnum
") ShapeType;
		TopAbs_ShapeEnum ShapeType();

		/****************** Solve ******************/
		%feature("compactdefaultargs") Solve;
		%feature("autodoc", "No available documentation.

Parameters
----------
aLab: TDF_Label
Valid: TDF_LabelMap

Returns
-------
bool
") Solve;
		Standard_Boolean Solve(const TDF_Label & aLab, const TDF_LabelMap & Valid);

		/****************** StopNamedShape ******************/
		%feature("compactdefaultargs") StopNamedShape;
		%feature("autodoc", "No available documentation.

Parameters
----------
arg: TNaming_NamedShape

Returns
-------
None
") StopNamedShape;
		void StopNamedShape(const opencascade::handle<TNaming_NamedShape> & arg);

		/****************** StopNamedShape ******************/
		%feature("compactdefaultargs") StopNamedShape;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TNaming_NamedShape>
") StopNamedShape;
		opencascade::handle<TNaming_NamedShape> StopNamedShape();

		/****************** Type ******************/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "No available documentation.

Parameters
----------
aType: TNaming_NameType

Returns
-------
None
") Type;
		void Type(const TNaming_NameType aType);

		/****************** Type ******************/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "No available documentation.

Returns
-------
TNaming_NameType
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
		/****************** TNaming_NamedShape ******************/
		%feature("compactdefaultargs") TNaming_NamedShape;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TNaming_NamedShape;
		 TNaming_NamedShape();

		/****************** AfterUndo ******************/
		%feature("compactdefaultargs") AfterUndo;
		%feature("autodoc", "Something to do after applying <anattdelta>.

Parameters
----------
anAttDelta: TDF_AttributeDelta
forceIt: bool,optional
	default value is Standard_False

Returns
-------
bool
") AfterUndo;
		virtual Standard_Boolean AfterUndo(const opencascade::handle<TDF_AttributeDelta> & anAttDelta, const Standard_Boolean forceIt = Standard_False);

		/****************** BackupCopy ******************/
		%feature("compactdefaultargs") BackupCopy;
		%feature("autodoc", "Copies the attribute contents into a new other attribute. it is used by backup().

Returns
-------
opencascade::handle<TDF_Attribute>
") BackupCopy;
		virtual opencascade::handle<TDF_Attribute> BackupCopy();

		/****************** BeforeRemoval ******************/
		%feature("compactdefaultargs") BeforeRemoval;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") BeforeRemoval;
		virtual void BeforeRemoval();

		/****************** BeforeUndo ******************/
		%feature("compactdefaultargs") BeforeUndo;
		%feature("autodoc", "Something to do before applying <anattdelta>.

Parameters
----------
anAttDelta: TDF_AttributeDelta
forceIt: bool,optional
	default value is Standard_False

Returns
-------
bool
") BeforeUndo;
		virtual Standard_Boolean BeforeUndo(const opencascade::handle<TDF_AttributeDelta> & anAttDelta, const Standard_Boolean forceIt = Standard_False);

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Clear;
		void Clear();

		/****************** DeltaOnModification ******************/
		%feature("compactdefaultargs") DeltaOnModification;
		%feature("autodoc", "Makes a deltaonmodification between <self> and <anoldattribute.

Parameters
----------
anOldAttribute: TDF_Attribute

Returns
-------
opencascade::handle<TDF_DeltaOnModification>
") DeltaOnModification;
		virtual opencascade::handle<TDF_DeltaOnModification> DeltaOnModification(const opencascade::handle<TDF_Attribute> & anOldAttribute);

		/****************** DeltaOnModification ******************/
		%feature("compactdefaultargs") DeltaOnModification;
		%feature("autodoc", "Applies a deltaonmodification to <self>.

Parameters
----------
aDelta: TDF_DeltaOnModification

Returns
-------
None
") DeltaOnModification;
		virtual void DeltaOnModification(const opencascade::handle<TDF_DeltaOnModification> & aDelta);

		/****************** DeltaOnRemoval ******************/
		%feature("compactdefaultargs") DeltaOnRemoval;
		%feature("autodoc", "Makes a deltaonremoval on <self> because <self> has disappeared from the ds.

Returns
-------
opencascade::handle<TDF_DeltaOnRemoval>
") DeltaOnRemoval;
		virtual opencascade::handle<TDF_DeltaOnRemoval> DeltaOnRemoval();


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
		/****************** Evolution ******************/
		%feature("compactdefaultargs") Evolution;
		%feature("autodoc", "Returns the evolution of the attribute.

Returns
-------
TNaming_Evolution
") Evolution;
		TNaming_Evolution Evolution();

		/****************** Get ******************/
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "Returns the shapes contained in <ns>. returns a null shape if isempty.

Returns
-------
TopoDS_Shape
") Get;
		TopoDS_Shape Get();

		/****************** GetID ******************/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Class method ============ returns the guid for named shapes.

Returns
-------
Standard_GUID
") GetID;
		static const Standard_GUID & GetID();

		/****************** ID ******************/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "Returns the id of the attribute.

Returns
-------
Standard_GUID
") ID;
		const Standard_GUID & ID();

		/****************** IsEmpty ******************/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsEmpty;
		Standard_Boolean IsEmpty();

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "Returns an new empty attribute from the good end type. it is used by the copy algorithm.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		virtual opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "This method is different from the 'copy' one, because it is used when copying an attribute from a source structure into a target structure. this method pastes the current attribute to the label corresponding to the insertor. the pasted attribute may be a brand new one or a new version of the previous one.

Parameters
----------
intoAttribute: TDF_Attribute
aRelocTationable: TDF_RelocationTable

Returns
-------
None
") Paste;
		virtual void Paste(const opencascade::handle<TDF_Attribute> & intoAttribute, const opencascade::handle<TDF_RelocationTable> & aRelocTationable);

		/****************** References ******************/
		%feature("compactdefaultargs") References;
		%feature("autodoc", "Adds the directly referenced attributes and labels to <adataset>. 'directly' means we have only to look at the first level of references.

Parameters
----------
aDataSet: TDF_DataSet

Returns
-------
None
") References;
		virtual void References(const opencascade::handle<TDF_DataSet> & aDataSet);

		/****************** Restore ******************/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "Restores the contents from <anattribute> into this one. it is used when aborting a transaction.

Parameters
----------
anAttribute: TDF_Attribute

Returns
-------
None
") Restore;
		virtual void Restore(const opencascade::handle<TDF_Attribute> & anAttribute);

		/****************** SetVersion ******************/
		%feature("compactdefaultargs") SetVersion;
		%feature("autodoc", "Set the version of the attribute.

Parameters
----------
version: int

Returns
-------
None
") SetVersion;
		void SetVersion(const Standard_Integer version);

		/****************** Version ******************/
		%feature("compactdefaultargs") Version;
		%feature("autodoc", "Returns the version of the attribute.

Returns
-------
int
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
		/****************** TNaming_Naming ******************/
		%feature("compactdefaultargs") TNaming_Naming;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TNaming_Naming;
		 TNaming_Naming();

		/****************** ChangeName ******************/
		%feature("compactdefaultargs") ChangeName;
		%feature("autodoc", "No available documentation.

Returns
-------
TNaming_Name
") ChangeName;
		TNaming_Name & ChangeName();


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
		/****************** GetID ******************/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Following code from tdesignstd ==============================.

Returns
-------
Standard_GUID
") GetID;
		static const Standard_GUID & GetID();

		/****************** GetName ******************/
		%feature("compactdefaultargs") GetName;
		%feature("autodoc", "No available documentation.

Returns
-------
TNaming_Name
") GetName;
		const TNaming_Name & GetName();

		/****************** ID ******************/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "Deferred methods from tdf_attribute ===================================.

Returns
-------
Standard_GUID
") ID;
		virtual const Standard_GUID & ID();

		/****************** Insert ******************/
		%feature("compactdefaultargs") Insert;
		%feature("autodoc", "No available documentation.

Parameters
----------
under: TDF_Label

Returns
-------
opencascade::handle<TNaming_Naming>
") Insert;
		static opencascade::handle<TNaming_Naming> Insert(const TDF_Label & under);

		/****************** IsDefined ******************/
		%feature("compactdefaultargs") IsDefined;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsDefined;
		Standard_Boolean IsDefined();

		/****************** Name ******************/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Creates a namimg attribute at label <where> to identify the shape <selection>. geometry is standard_true if we are only interested by the underlying geometry (e.g. setting a constraint). <context> is used to find neighbours of <s> when required by the naming. if keeporientation is true the selection orientation is taken into account. bnproblem == true points out that context sub-shapes in df have orientation differences with context shape itself. instance method ===============.

Parameters
----------
where: TDF_Label
Selection: TopoDS_Shape
Context: TopoDS_Shape
Geometry: bool,optional
	default value is Standard_False
KeepOrientation: bool,optional
	default value is Standard_False
BNproblem: bool,optional
	default value is Standard_False

Returns
-------
opencascade::handle<TNaming_NamedShape>
") Name;
		static opencascade::handle<TNaming_NamedShape> Name(const TDF_Label & where, const TopoDS_Shape & Selection, const TopoDS_Shape & Context, const Standard_Boolean Geometry = Standard_False, const Standard_Boolean KeepOrientation = Standard_False, const Standard_Boolean BNproblem = Standard_False);

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "No available documentation.

Parameters
----------
Into: TDF_Attribute
RT: TDF_RelocationTable

Returns
-------
None
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & Into, const opencascade::handle<TDF_RelocationTable> & RT);

		/****************** References ******************/
		%feature("compactdefaultargs") References;
		%feature("autodoc", "No available documentation.

Parameters
----------
aDataSet: TDF_DataSet

Returns
-------
None
") References;
		virtual void References(const opencascade::handle<TDF_DataSet> & aDataSet);

		/****************** Regenerate ******************/
		%feature("compactdefaultargs") Regenerate;
		%feature("autodoc", "Regenerate only the name associated to me.

Parameters
----------
scope: TDF_LabelMap

Returns
-------
bool
") Regenerate;
		Standard_Boolean Regenerate(TDF_LabelMap & scope);

		/****************** Restore ******************/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "No available documentation.

Parameters
----------
With: TDF_Attribute

Returns
-------
None
") Restore;
		void Restore(const opencascade::handle<TDF_Attribute> & With);

		/****************** Solve ******************/
		%feature("compactdefaultargs") Solve;
		%feature("autodoc", "Regenerate recursively the whole name with scope. if scope is empty it means that all the labels of the framework are valid.

Parameters
----------
scope: TDF_LabelMap

Returns
-------
bool
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
		/****************** BuildDescendants ******************/
		%feature("compactdefaultargs") BuildDescendants;
		%feature("autodoc", "No available documentation.

Parameters
----------
NS: TNaming_NamedShape
Labels: TDF_LabelMap

Returns
-------
None
") BuildDescendants;
		static void BuildDescendants(const opencascade::handle<TNaming_NamedShape> & NS, TDF_LabelMap & Labels);

		/****************** CurrentShape ******************/
		%feature("compactdefaultargs") CurrentShape;
		%feature("autodoc", "No available documentation.

Parameters
----------
Valid: TDF_LabelMap
Forbiden: TDF_LabelMap
NS: TNaming_NamedShape
MS: TopTools_IndexedMapOfShape

Returns
-------
None
") CurrentShape;
		static void CurrentShape(const TDF_LabelMap & Valid, const TDF_LabelMap & Forbiden, const opencascade::handle<TNaming_NamedShape> & NS, TopTools_IndexedMapOfShape & MS);

		/****************** CurrentShapeFromShape ******************/
		%feature("compactdefaultargs") CurrentShapeFromShape;
		%feature("autodoc", "No available documentation.

Parameters
----------
Valid: TDF_LabelMap
Forbiden: TDF_LabelMap
Acces: TDF_Label
S: TopoDS_Shape
MS: TopTools_IndexedMapOfShape

Returns
-------
None
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
		/****************** TNaming_NewShapeIterator ******************/
		%feature("compactdefaultargs") TNaming_NewShapeIterator;
		%feature("autodoc", "No available documentation.

Parameters
----------
aShape: TopoDS_Shape
Transaction: int
access: TDF_Label

Returns
-------
None
") TNaming_NewShapeIterator;
		 TNaming_NewShapeIterator(const TopoDS_Shape & aShape, const Standard_Integer Transaction, const TDF_Label & access);

		/****************** TNaming_NewShapeIterator ******************/
		%feature("compactdefaultargs") TNaming_NewShapeIterator;
		%feature("autodoc", "No available documentation.

Parameters
----------
aShape: TopoDS_Shape
access: TDF_Label

Returns
-------
None
") TNaming_NewShapeIterator;
		 TNaming_NewShapeIterator(const TopoDS_Shape & aShape, const TDF_Label & access);

		/****************** TNaming_NewShapeIterator ******************/
		%feature("compactdefaultargs") TNaming_NewShapeIterator;
		%feature("autodoc", "Iterates from the current shape in <aniterator>.

Parameters
----------
anIterator: TNaming_NewShapeIterator

Returns
-------
None
") TNaming_NewShapeIterator;
		 TNaming_NewShapeIterator(const TNaming_NewShapeIterator & anIterator);

		/****************** TNaming_NewShapeIterator ******************/
		%feature("compactdefaultargs") TNaming_NewShapeIterator;
		%feature("autodoc", "Iterates from the current shape in <aniterator>.

Parameters
----------
anIterator: TNaming_Iterator

Returns
-------
None
") TNaming_NewShapeIterator;
		 TNaming_NewShapeIterator(const TNaming_Iterator & anIterator);

		/****************** IsModification ******************/
		%feature("compactdefaultargs") IsModification;
		%feature("autodoc", "True if the new shape is a modification (split, fuse,etc...) of the old shape.

Returns
-------
bool
") IsModification;
		Standard_Boolean IsModification();

		/****************** Label ******************/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "No available documentation.

Returns
-------
TDF_Label
") Label;
		TDF_Label Label();

		/****************** More ******************/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") More;
		Standard_Boolean More();

		/****************** NamedShape ******************/
		%feature("compactdefaultargs") NamedShape;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TNaming_NamedShape>
") NamedShape;
		opencascade::handle<TNaming_NamedShape> NamedShape();

		/****************** Next ******************/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Next;
		void Next();

		/****************** Shape ******************/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "Warning! can be a null shape if a descendant is deleted.

Returns
-------
TopoDS_Shape
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
		/****************** TNaming_OldShapeIterator ******************/
		%feature("compactdefaultargs") TNaming_OldShapeIterator;
		%feature("autodoc", "No available documentation.

Parameters
----------
aShape: TopoDS_Shape
Transaction: int
access: TDF_Label

Returns
-------
None
") TNaming_OldShapeIterator;
		 TNaming_OldShapeIterator(const TopoDS_Shape & aShape, const Standard_Integer Transaction, const TDF_Label & access);

		/****************** TNaming_OldShapeIterator ******************/
		%feature("compactdefaultargs") TNaming_OldShapeIterator;
		%feature("autodoc", "No available documentation.

Parameters
----------
aShape: TopoDS_Shape
access: TDF_Label

Returns
-------
None
") TNaming_OldShapeIterator;
		 TNaming_OldShapeIterator(const TopoDS_Shape & aShape, const TDF_Label & access);

		/****************** TNaming_OldShapeIterator ******************/
		%feature("compactdefaultargs") TNaming_OldShapeIterator;
		%feature("autodoc", "Iterates from the current shape in <aniterator>.

Parameters
----------
anIterator: TNaming_OldShapeIterator

Returns
-------
None
") TNaming_OldShapeIterator;
		 TNaming_OldShapeIterator(const TNaming_OldShapeIterator & anIterator);

		/****************** TNaming_OldShapeIterator ******************/
		%feature("compactdefaultargs") TNaming_OldShapeIterator;
		%feature("autodoc", "Iterates from the current shape in <aniterator>.

Parameters
----------
anIterator: TNaming_Iterator

Returns
-------
None
") TNaming_OldShapeIterator;
		 TNaming_OldShapeIterator(const TNaming_Iterator & anIterator);

		/****************** IsModification ******************/
		%feature("compactdefaultargs") IsModification;
		%feature("autodoc", "True if the new shape is a modification (split, fuse,etc...) of the old shape.

Returns
-------
bool
") IsModification;
		Standard_Boolean IsModification();

		/****************** Label ******************/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "No available documentation.

Returns
-------
TDF_Label
") Label;
		TDF_Label Label();

		/****************** More ******************/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") More;
		Standard_Boolean More();

		/****************** NamedShape ******************/
		%feature("compactdefaultargs") NamedShape;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TNaming_NamedShape>
") NamedShape;
		opencascade::handle<TNaming_NamedShape> NamedShape();

		/****************** Next ******************/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Next;
		void Next();

		/****************** Shape ******************/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Shape
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
		/****************** TNaming_RefShape ******************/
		%feature("compactdefaultargs") TNaming_RefShape;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TNaming_RefShape;
		 TNaming_RefShape();

		/****************** TNaming_RefShape ******************/
		%feature("compactdefaultargs") TNaming_RefShape;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape

Returns
-------
None
") TNaming_RefShape;
		 TNaming_RefShape(const TopoDS_Shape & S);

		/****************** FirstUse ******************/
		%feature("compactdefaultargs") FirstUse;
		%feature("autodoc", "No available documentation.

Parameters
----------
aPtr: TNaming_PtrNode

Returns
-------
None
") FirstUse;
		void FirstUse(const TNaming_PtrNode & aPtr);

		/****************** FirstUse ******************/
		%feature("compactdefaultargs") FirstUse;
		%feature("autodoc", "No available documentation.

Returns
-------
TNaming_PtrNode
") FirstUse;
		TNaming_PtrNode FirstUse();

		/****************** Label ******************/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "No available documentation.

Returns
-------
TDF_Label
") Label;
		TDF_Label Label();

		/****************** NamedShape ******************/
		%feature("compactdefaultargs") NamedShape;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TNaming_NamedShape>
") NamedShape;
		opencascade::handle<TNaming_NamedShape> NamedShape();

		/****************** Shape ******************/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape

Returns
-------
None
") Shape;
		void Shape(const TopoDS_Shape & S);

		/****************** Shape ******************/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Shape
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
		/****************** TNaming_SameShapeIterator ******************/
		%feature("compactdefaultargs") TNaming_SameShapeIterator;
		%feature("autodoc", "No available documentation.

Parameters
----------
aShape: TopoDS_Shape
access: TDF_Label

Returns
-------
None
") TNaming_SameShapeIterator;
		 TNaming_SameShapeIterator(const TopoDS_Shape & aShape, const TDF_Label & access);

		/****************** Label ******************/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "No available documentation.

Returns
-------
TDF_Label
") Label;
		TDF_Label Label();

		/****************** More ******************/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") More;
		Standard_Boolean More();

		/****************** Next ******************/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "No available documentation.

Returns
-------
None
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
		/****************** TNaming_Scope ******************/
		%feature("compactdefaultargs") TNaming_Scope;
		%feature("autodoc", "Withvalid = false.

Returns
-------
None
") TNaming_Scope;
		 TNaming_Scope();

		/****************** TNaming_Scope ******************/
		%feature("compactdefaultargs") TNaming_Scope;
		%feature("autodoc", "If <withvalid> the scope is defined by the map. if not on the whole framework.

Parameters
----------
WithValid: bool

Returns
-------
None
") TNaming_Scope;
		 TNaming_Scope(const Standard_Boolean WithValid);

		/****************** TNaming_Scope ******************/
		%feature("compactdefaultargs") TNaming_Scope;
		%feature("autodoc", "Create a scope with a map. withvalid = true.

Parameters
----------
valid: TDF_LabelMap

Returns
-------
None
") TNaming_Scope;
		 TNaming_Scope(TDF_LabelMap & valid);

		/****************** ChangeValid ******************/
		%feature("compactdefaultargs") ChangeValid;
		%feature("autodoc", "No available documentation.

Returns
-------
TDF_LabelMap
") ChangeValid;
		TDF_LabelMap & ChangeValid();

		/****************** ClearValid ******************/
		%feature("compactdefaultargs") ClearValid;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") ClearValid;
		void ClearValid();

		/****************** CurrentShape ******************/
		%feature("compactdefaultargs") CurrentShape;
		%feature("autodoc", "Returns the current value of <ns> according to the valid scope.

Parameters
----------
NS: TNaming_NamedShape

Returns
-------
TopoDS_Shape
") CurrentShape;
		TopoDS_Shape CurrentShape(const opencascade::handle<TNaming_NamedShape> & NS);

		/****************** GetValid ******************/
		%feature("compactdefaultargs") GetValid;
		%feature("autodoc", "No available documentation.

Returns
-------
TDF_LabelMap
") GetValid;
		const TDF_LabelMap & GetValid();

		/****************** IsValid ******************/
		%feature("compactdefaultargs") IsValid;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: TDF_Label

Returns
-------
bool
") IsValid;
		Standard_Boolean IsValid(const TDF_Label & L);

		/****************** Unvalid ******************/
		%feature("compactdefaultargs") Unvalid;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: TDF_Label

Returns
-------
None
") Unvalid;
		void Unvalid(const TDF_Label & L);

		/****************** UnvalidChildren ******************/
		%feature("compactdefaultargs") UnvalidChildren;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: TDF_Label
withroot: bool,optional
	default value is Standard_True

Returns
-------
None
") UnvalidChildren;
		void UnvalidChildren(const TDF_Label & L, const Standard_Boolean withroot = Standard_True);

		/****************** Valid ******************/
		%feature("compactdefaultargs") Valid;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: TDF_Label

Returns
-------
None
") Valid;
		void Valid(const TDF_Label & L);

		/****************** ValidChildren ******************/
		%feature("compactdefaultargs") ValidChildren;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: TDF_Label
withroot: bool,optional
	default value is Standard_True

Returns
-------
None
") ValidChildren;
		void ValidChildren(const TDF_Label & L, const Standard_Boolean withroot = Standard_True);

		/****************** WithValid ******************/
		%feature("compactdefaultargs") WithValid;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") WithValid;
		Standard_Boolean WithValid();

		/****************** WithValid ******************/
		%feature("compactdefaultargs") WithValid;
		%feature("autodoc", "No available documentation.

Parameters
----------
mode: bool

Returns
-------
None
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
		/****************** TNaming_Selector ******************/
		%feature("compactdefaultargs") TNaming_Selector;
		%feature("autodoc", "Create a selector on this label to select a shape. ==================.

Parameters
----------
aLabel: TDF_Label

Returns
-------
None
") TNaming_Selector;
		 TNaming_Selector(const TDF_Label & aLabel);

		/****************** Arguments ******************/
		%feature("compactdefaultargs") Arguments;
		%feature("autodoc", "Returns the attribute list args. this list contains the named shape on which the topological naming was built.

Parameters
----------
args: TDF_AttributeMap

Returns
-------
None
") Arguments;
		void Arguments(TDF_AttributeMap & args);

		/****************** IsIdentified ******************/
		%feature("compactdefaultargs") IsIdentified;
		%feature("autodoc", "To know if a shape is already identified (not selected) ======================================================= //! the label access defines the point of access to the data framework. selection is the shape for which we want to know whether it is identified or not. if true, ns is returned as the identity of selection. if geometry is true, ns will be the named shape containing the first appearance of selection and not any other shape. in other words, selection must be the only shape stored in ns.

Parameters
----------
access: TDF_Label
selection: TopoDS_Shape
NS: TNaming_NamedShape
Geometry: bool,optional
	default value is Standard_False

Returns
-------
bool
") IsIdentified;
		static Standard_Boolean IsIdentified(const TDF_Label & access, const TopoDS_Shape & selection, opencascade::handle<TNaming_NamedShape> & NS, const Standard_Boolean Geometry = Standard_False);

		/****************** NamedShape ******************/
		%feature("compactdefaultargs") NamedShape;
		%feature("autodoc", "Returns the namedshape build or under construction, which contains the topological naming..

Returns
-------
opencascade::handle<TNaming_NamedShape>
") NamedShape;
		opencascade::handle<TNaming_NamedShape> NamedShape();

		/****************** Select ******************/
		%feature("compactdefaultargs") Select;
		%feature("autodoc", "Creates a topological naming on the label alabel given as an argument at construction time. if successful, the shape selection - found in the shape context - is now identified in the named shape returned in namedshape. if geometry is true, namedshape contains the first appearance of selection. this syntax is more robust than the previous syntax for this method.

Parameters
----------
Selection: TopoDS_Shape
Context: TopoDS_Shape
Geometry: bool,optional
	default value is Standard_False
KeepOrientatation: bool,optional
	default value is Standard_False

Returns
-------
bool
") Select;
		Standard_Boolean Select(const TopoDS_Shape & Selection, const TopoDS_Shape & Context, const Standard_Boolean Geometry = Standard_False, const Standard_Boolean KeepOrientatation = Standard_False);

		/****************** Select ******************/
		%feature("compactdefaultargs") Select;
		%feature("autodoc", "Creates a topological naming on the label alabel given as an argument at construction time. if successful, the shape selection is now identified in the named shape returned in namedshape. if geometry is true, namedshape contains the first appearance of selection.

Parameters
----------
Selection: TopoDS_Shape
Geometry: bool,optional
	default value is Standard_False
KeepOrientatation: bool,optional
	default value is Standard_False

Returns
-------
bool
") Select;
		Standard_Boolean Select(const TopoDS_Shape & Selection, const Standard_Boolean Geometry = Standard_False, const Standard_Boolean KeepOrientatation = Standard_False);

		/****************** Solve ******************/
		%feature("compactdefaultargs") Solve;
		%feature("autodoc", "Updates the topological naming on the label alabel given as an argument at construction time. the underlying shape returned in the method namedshape is updated. to read this shape, use the method tnaming_tool::getshape.

Parameters
----------
Valid: TDF_LabelMap

Returns
-------
bool
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
		/****************** TNaming_ShapesSet ******************/
		%feature("compactdefaultargs") TNaming_ShapesSet;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TNaming_ShapesSet;
		 TNaming_ShapesSet();

		/****************** TNaming_ShapesSet ******************/
		%feature("compactdefaultargs") TNaming_ShapesSet;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape
Type: TopAbs_ShapeEnum,optional
	default value is TopAbs_SHAPE

Returns
-------
None
") TNaming_ShapesSet;
		 TNaming_ShapesSet(const TopoDS_Shape & S, const TopAbs_ShapeEnum Type = TopAbs_SHAPE);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Adds the shape <s>.

Parameters
----------
S: TopoDS_Shape

Returns
-------
bool
") Add;
		Standard_Boolean Add(const TopoDS_Shape & S);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Adds the shapes contained in <shapes>.

Parameters
----------
Shapes: TNaming_ShapesSet

Returns
-------
None
") Add;
		void Add(const TNaming_ShapesSet & Shapes);

		/****************** ChangeMap ******************/
		%feature("compactdefaultargs") ChangeMap;
		%feature("autodoc", "No available documentation.

Returns
-------
TopTools_MapOfShape
") ChangeMap;
		TopTools_MapOfShape & ChangeMap();

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Removes all shapes.

Returns
-------
None
") Clear;
		void Clear();

		/****************** Contains ******************/
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "Returns true if <s> is in <self>.

Parameters
----------
S: TopoDS_Shape

Returns
-------
bool
") Contains;
		Standard_Boolean Contains(const TopoDS_Shape & S);

		/****************** Filter ******************/
		%feature("compactdefaultargs") Filter;
		%feature("autodoc", "Erases in <self> the shapes not contained in <shapes>.

Parameters
----------
Shapes: TNaming_ShapesSet

Returns
-------
None
") Filter;
		void Filter(const TNaming_ShapesSet & Shapes);

		/****************** IsEmpty ******************/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsEmpty;
		Standard_Boolean IsEmpty();

		/****************** Map ******************/
		%feature("compactdefaultargs") Map;
		%feature("autodoc", "No available documentation.

Returns
-------
TopTools_MapOfShape
") Map;
		const TopTools_MapOfShape & Map();

		/****************** NbShapes ******************/
		%feature("compactdefaultargs") NbShapes;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbShapes;
		Standard_Integer NbShapes();

		/****************** Remove ******************/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "Removes <s> in <self>.

Parameters
----------
S: TopoDS_Shape

Returns
-------
bool
") Remove;
		Standard_Boolean Remove(const TopoDS_Shape & S);

		/****************** Remove ******************/
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "Removes in <self> the shapes contained in <shapes>.

Parameters
----------
Shapes: TNaming_ShapesSet

Returns
-------
None
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
		/****************** Collect ******************/
		%feature("compactdefaultargs") Collect;
		%feature("autodoc", "No available documentation.

Parameters
----------
NS: TNaming_NamedShape
Labels: TNaming_MapOfNamedShape
OnlyModif: bool,optional
	default value is Standard_True

Returns
-------
None
") Collect;
		static void Collect(const opencascade::handle<TNaming_NamedShape> & NS, TNaming_MapOfNamedShape & Labels, const Standard_Boolean OnlyModif = Standard_True);

		/****************** CurrentNamedShape ******************/
		%feature("compactdefaultargs") CurrentNamedShape;
		%feature("autodoc", "Returns the namedshape of the last modification of <ns>. this shape is identified by a label.

Parameters
----------
NS: TNaming_NamedShape
Updated: TDF_LabelMap

Returns
-------
opencascade::handle<TNaming_NamedShape>
") CurrentNamedShape;
		static opencascade::handle<TNaming_NamedShape> CurrentNamedShape(const opencascade::handle<TNaming_NamedShape> & NS, const TDF_LabelMap & Updated);

		/****************** CurrentNamedShape ******************/
		%feature("compactdefaultargs") CurrentNamedShape;
		%feature("autodoc", "Returns namedshape the last modification of <ns>.

Parameters
----------
NS: TNaming_NamedShape

Returns
-------
opencascade::handle<TNaming_NamedShape>
") CurrentNamedShape;
		static opencascade::handle<TNaming_NamedShape> CurrentNamedShape(const opencascade::handle<TNaming_NamedShape> & NS);

		/****************** CurrentShape ******************/
		%feature("compactdefaultargs") CurrentShape;
		%feature("autodoc", "Returns the last modification of <ns>. returns the shape currentshape contained in the named shape attribute ns. currentshape is the current state of the entities if they have been modified in other attributes of the same data structure. each call to this function creates a new compound.

Parameters
----------
NS: TNaming_NamedShape

Returns
-------
TopoDS_Shape
") CurrentShape;
		static TopoDS_Shape CurrentShape(const opencascade::handle<TNaming_NamedShape> & NS);

		/****************** CurrentShape ******************/
		%feature("compactdefaultargs") CurrentShape;
		%feature("autodoc", "Returns the shape currentshape contained in the named shape attribute ns, and present in the updated attribute map updated. currentshape is the current state of the entities if they have been modified in other attributes of the same data structure. each call to this function creates a new compound. warning only the contents of updated are searched.r.

Parameters
----------
NS: TNaming_NamedShape
Updated: TDF_LabelMap

Returns
-------
TopoDS_Shape
") CurrentShape;
		static TopoDS_Shape CurrentShape(const opencascade::handle<TNaming_NamedShape> & NS, const TDF_LabelMap & Updated);

		/****************** FindShape ******************/
		%feature("compactdefaultargs") FindShape;
		%feature("autodoc", "Returns the current shape (a wire or a shell) built (in the data framework) from the the shapes of the argument named shape. it is used for identity name type computation.

Parameters
----------
Valid: TDF_LabelMap
Forbiden: TDF_LabelMap
Arg: TNaming_NamedShape
S: TopoDS_Shape

Returns
-------
None
") FindShape;
		static void FindShape(const TDF_LabelMap & Valid, const TDF_LabelMap & Forbiden, const opencascade::handle<TNaming_NamedShape> & Arg, TopoDS_Shape & S);

		/****************** GeneratedShape ******************/
		%feature("compactdefaultargs") GeneratedShape;
		%feature("autodoc", "Returns the shape generated from s or by a modification of s and contained in the named shape generation.

Parameters
----------
S: TopoDS_Shape
Generation: TNaming_NamedShape

Returns
-------
TopoDS_Shape
") GeneratedShape;
		static TopoDS_Shape GeneratedShape(const TopoDS_Shape & S, const opencascade::handle<TNaming_NamedShape> & Generation);

		/****************** GetShape ******************/
		%feature("compactdefaultargs") GetShape;
		%feature("autodoc", "Returns the entities stored in the named shape attribute ns. if there is only one old-new pair, the new shape is returned. otherwise, a compound is returned. this compound is made out of all the new shapes found. each call to this function creates a new compound.

Parameters
----------
NS: TNaming_NamedShape

Returns
-------
TopoDS_Shape
") GetShape;
		static TopoDS_Shape GetShape(const opencascade::handle<TNaming_NamedShape> & NS);

		/****************** HasLabel ******************/
		%feature("compactdefaultargs") HasLabel;
		%feature("autodoc", "Returns true if <ashape> appears under a label.(dp).

Parameters
----------
access: TDF_Label
aShape: TopoDS_Shape

Returns
-------
bool
") HasLabel;
		static Standard_Boolean HasLabel(const TDF_Label & access, const TopoDS_Shape & aShape);

		/****************** InitialShape ******************/
		%feature("compactdefaultargs") InitialShape;
		%feature("autodoc", "Returns the shape created from the shape ashape contained in the attribute anacces.

Parameters
----------
aShape: TopoDS_Shape
anAcces: TDF_Label
Labels: TDF_LabelList

Returns
-------
TopoDS_Shape
") InitialShape;
		static TopoDS_Shape InitialShape(const TopoDS_Shape & aShape, const TDF_Label & anAcces, TDF_LabelList & Labels);

		/****************** Label ******************/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "Returns the label of the first apparition of <ashape>. transdef is a value of the transaction of the first apparition of <ashape>.

Parameters
----------
access: TDF_Label
aShape: TopoDS_Shape

Returns
-------
TransDef: int
") Label;
		static TDF_Label Label(const TDF_Label & access, const TopoDS_Shape & aShape, Standard_Integer &OutValue);

		/****************** NamedShape ******************/
		%feature("compactdefaultargs") NamedShape;
		%feature("autodoc", "Returns the named shape attribute defined by the shape ashape and the label anaccess. this attribute is returned as a new shape. you call this function, if you need to create a topological attribute for existing data. example class mypkg_myclass { public: standard_boolean sameedge(const opencascade::handle<ocaftest_line>& , const opencascade::handle<caftest_line>& ); }; //! standard_boolean mypkg_myclass::sameedge (const opencascade::handle<ocaftest_line>& l1 const opencascade::handle<ocaftest_line>& l2) { opencascade::handle<tnaming_namedshape> ns1 = l1->namedshape(); opencascade::handle<tnaming_namedshape> ns2 = l2->namedshape(); //! return breptools::compare(ns1->get(),ns2->get()); } in the example above, the function sameedge is created to compare the edges having two lines for geometric supports. if these edges are found by breptools::compare to be within the same tolerance, they are considered to be the same. warning to avoid sharing of names, a selected attribute will not be returned. sharing of names makes it harder to manage the data structure. when the user of the name is removed, for example, it is difficult to know whether the name should be destroyed.

Parameters
----------
aShape: TopoDS_Shape
anAcces: TDF_Label

Returns
-------
opencascade::handle<TNaming_NamedShape>
") NamedShape;
		static opencascade::handle<TNaming_NamedShape> NamedShape(const TopoDS_Shape & aShape, const TDF_Label & anAcces);

		/****************** OriginalShape ******************/
		%feature("compactdefaultargs") OriginalShape;
		%feature("autodoc", "Returns the shape contained as oldshape in <ns>.

Parameters
----------
NS: TNaming_NamedShape

Returns
-------
TopoDS_Shape
") OriginalShape;
		static TopoDS_Shape OriginalShape(const opencascade::handle<TNaming_NamedShape> & NS);

		/****************** ValidUntil ******************/
		%feature("compactdefaultargs") ValidUntil;
		%feature("autodoc", "Returns the last transaction where the creation of s is valid.

Parameters
----------
access: TDF_Label
S: TopoDS_Shape

Returns
-------
int
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
		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "No available documentation.

Parameters
----------
S1: TopoDS_Shape
S2: TopoDS_Shape

Returns
-------
None
") Add;
		void Add(TopoDS_Shape & S1, const TopoDS_Shape & S2);

		/****************** MakeCompSolid ******************/
		%feature("compactdefaultargs") MakeCompSolid;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape

Returns
-------
None
") MakeCompSolid;
		void MakeCompSolid(TopoDS_Shape & S);

		/****************** MakeCompound ******************/
		%feature("compactdefaultargs") MakeCompound;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape

Returns
-------
None
") MakeCompound;
		void MakeCompound(TopoDS_Shape & S);

		/****************** MakeEdge ******************/
		%feature("compactdefaultargs") MakeEdge;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape

Returns
-------
None
") MakeEdge;
		void MakeEdge(TopoDS_Shape & S);

		/****************** MakeFace ******************/
		%feature("compactdefaultargs") MakeFace;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape

Returns
-------
None
") MakeFace;
		void MakeFace(TopoDS_Shape & S);

		/****************** MakeShell ******************/
		%feature("compactdefaultargs") MakeShell;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape

Returns
-------
None
") MakeShell;
		void MakeShell(TopoDS_Shape & S);

		/****************** MakeSolid ******************/
		%feature("compactdefaultargs") MakeSolid;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape

Returns
-------
None
") MakeSolid;
		void MakeSolid(TopoDS_Shape & S);

		/****************** MakeVertex ******************/
		%feature("compactdefaultargs") MakeVertex;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape

Returns
-------
None
") MakeVertex;
		void MakeVertex(TopoDS_Shape & S);

		/****************** MakeWire ******************/
		%feature("compactdefaultargs") MakeWire;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape

Returns
-------
None
") MakeWire;
		void MakeWire(TopoDS_Shape & S);

		/****************** UpdateEdge ******************/
		%feature("compactdefaultargs") UpdateEdge;
		%feature("autodoc", "No available documentation.

Parameters
----------
S1: TopoDS_Shape
S2: TopoDS_Shape
M: TColStd_IndexedDataMapOfTransientTransient

Returns
-------
None
") UpdateEdge;
		void UpdateEdge(const TopoDS_Shape & S1, TopoDS_Shape & S2, TColStd_IndexedDataMapOfTransientTransient & M);

		/****************** UpdateFace ******************/
		%feature("compactdefaultargs") UpdateFace;
		%feature("autodoc", "No available documentation.

Parameters
----------
S1: TopoDS_Shape
S2: TopoDS_Shape
M: TColStd_IndexedDataMapOfTransientTransient

Returns
-------
None
") UpdateFace;
		void UpdateFace(const TopoDS_Shape & S1, TopoDS_Shape & S2, TColStd_IndexedDataMapOfTransientTransient & M);

		/****************** UpdateShape ******************/
		%feature("compactdefaultargs") UpdateShape;
		%feature("autodoc", "No available documentation.

Parameters
----------
S1: TopoDS_Shape
S2: TopoDS_Shape

Returns
-------
None
") UpdateShape;
		void UpdateShape(const TopoDS_Shape & S1, TopoDS_Shape & S2);

		/****************** UpdateVertex ******************/
		%feature("compactdefaultargs") UpdateVertex;
		%feature("autodoc", "No available documentation.

Parameters
----------
S1: TopoDS_Shape
S2: TopoDS_Shape
M: TColStd_IndexedDataMapOfTransientTransient

Returns
-------
None
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
		/****************** TNaming_Translator ******************/
		%feature("compactdefaultargs") TNaming_Translator;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TNaming_Translator;
		 TNaming_Translator();

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "No available documentation.

Parameters
----------
aShape: TopoDS_Shape

Returns
-------
None
") Add;
		void Add(const TopoDS_Shape & aShape);

		/****************** Copied ******************/
		%feature("compactdefaultargs") Copied;
		%feature("autodoc", "Returns copied shape.

Parameters
----------
aShape: TopoDS_Shape

Returns
-------
TopoDS_Shape
") Copied;
		const TopoDS_Shape Copied(const TopoDS_Shape & aShape);

		/****************** Copied ******************/
		%feature("compactdefaultargs") Copied;
		%feature("autodoc", "Returns datamap of results; (shape <-> copied shape).

Returns
-------
TopTools_DataMapOfShapeShape
") Copied;
		const TopTools_DataMapOfShapeShape & Copied();

		/****************** DumpMap ******************/
		%feature("compactdefaultargs") DumpMap;
		%feature("autodoc", "No available documentation.

Parameters
----------
isWrite: bool,optional
	default value is Standard_False

Returns
-------
None
") DumpMap;
		void DumpMap(const Standard_Boolean isWrite = Standard_False);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Returns
-------
None
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
		/****************** AfterUndo ******************/
		%feature("compactdefaultargs") AfterUndo;
		%feature("autodoc", "Something to do after applying <anattdelta>.

Parameters
----------
anAttDelta: TDF_AttributeDelta
forceIt: bool,optional
	default value is Standard_False

Returns
-------
bool
") AfterUndo;
		virtual Standard_Boolean AfterUndo(const opencascade::handle<TDF_AttributeDelta> & anAttDelta, const Standard_Boolean forceIt = Standard_False);

		/****************** BackupCopy ******************/
		%feature("compactdefaultargs") BackupCopy;
		%feature("autodoc", "Copies the attribute contents into a new other attribute. it is used by backup().

Returns
-------
opencascade::handle<TDF_Attribute>
") BackupCopy;
		virtual opencascade::handle<TDF_Attribute> BackupCopy();

		/****************** BeforeRemoval ******************/
		%feature("compactdefaultargs") BeforeRemoval;
		%feature("autodoc", "Clears the table.

Returns
-------
None
") BeforeRemoval;
		virtual void BeforeRemoval();

		/****************** DeltaOnAddition ******************/
		%feature("compactdefaultargs") DeltaOnAddition;
		%feature("autodoc", "This method returns a null handle (no delta).

Returns
-------
opencascade::handle<TDF_DeltaOnAddition>
") DeltaOnAddition;
		virtual opencascade::handle<TDF_DeltaOnAddition> DeltaOnAddition();

		/****************** DeltaOnRemoval ******************/
		%feature("compactdefaultargs") DeltaOnRemoval;
		%feature("autodoc", "This method returns a null handle (no delta).

Returns
-------
opencascade::handle<TDF_DeltaOnRemoval>
") DeltaOnRemoval;
		virtual opencascade::handle<TDF_DeltaOnRemoval> DeltaOnRemoval();

		/****************** Destroy ******************/
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Destroy;
		void Destroy();


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
		/****************** GetID ******************/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Returns the id: 2a96b614-ec8b-11d0-bee7-080009dc3333.

Returns
-------
Standard_GUID
") GetID;
		static const Standard_GUID & GetID();

		/****************** ID ******************/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "Returns the id of the attribute.

Returns
-------
Standard_GUID
") ID;
		const Standard_GUID & ID();

		/****************** Map ******************/
		%feature("compactdefaultargs") Map;
		%feature("autodoc", "No available documentation.

Returns
-------
TNaming_DataMapOfShapePtrRefShape
") Map;
		TNaming_DataMapOfShapePtrRefShape & Map();

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "Returns an new empty attribute from the good end type. it is used by the copy algorithm.

Returns
-------
opencascade::handle<TDF_Attribute>
") NewEmpty;
		virtual opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "This method is different from the 'copy' one, because it is used when copying an attribute from a source structure into a target structure. this method pastes the current attribute to the label corresponding to the insertor. the pasted attribute may be a brand new one or a new version of the previous one.

Parameters
----------
intoAttribute: TDF_Attribute
aRelocTationable: TDF_RelocationTable

Returns
-------
None
") Paste;
		virtual void Paste(const opencascade::handle<TDF_Attribute> & intoAttribute, const opencascade::handle<TDF_RelocationTable> & aRelocTationable);

		/****************** References ******************/
		%feature("compactdefaultargs") References;
		%feature("autodoc", "Adds the directly referenced attributes and labels to <adataset>. 'directly' means we have only to look at the first level of references. //! for this, use only the addlabel() & addattribute() from dataset and do not try to modify information previously stored in <adataset>.

Parameters
----------
aDataSet: TDF_DataSet

Returns
-------
None
") References;
		virtual void References(const opencascade::handle<TDF_DataSet> & aDataSet);

		/****************** Restore ******************/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "Restores the contents from <anattribute> into this one. it is used when aborting a transaction.

Parameters
----------
anAttribute: TDF_Attribute

Returns
-------
None
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
