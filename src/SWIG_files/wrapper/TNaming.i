/*
Copyright 2008-2017 Thomas Paviot (tpaviot@gmail.com)


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
%module (package="OCC") TNaming

#pragma SWIG nowarn=504,325,503

%{
#ifdef WNT
#pragma warning(disable : 4716)
#endif
%}

%include ../common/CommonIncludes.i
%include ../common/ExceptionCatcher.i
%include ../common/FunctionTransformers.i
%include ../common/Operators.i


%include TNaming_headers.i


%pythoncode {
def register_handle(handle, base_object):
    """
    Inserts the handle into the base object to
    prevent memory corruption in certain cases
    """
    try:
        if base_object.IsKind("Standard_Transient"):
            base_object.thisHandle = handle
            base_object.thisown = False
    except:
        pass
};

/* typedefs */
typedef TNaming_RefShape * TNaming_PtrRefShape;
typedef NCollection_Map <TopoDS_Shape> TNaming_MapOfShape;
typedef TNaming_DataMapOfShapeMapOfShape::Iterator TNaming_DataMapIteratorOfDataMapOfShapeMapOfShape;
typedef TNaming_DataMapOfShapePtrRefShape * TNaming_PtrDataMapOfShapePtrRefShape;
typedef NCollection_DataMap <TopoDS_Shape , TNaming_MapOfShape> TNaming_DataMapOfShapeMapOfShape;
typedef TNaming_MapOfShape::Iterator TNaming_MapIteratorOfMapOfShape;
typedef TNaming_Node * TNaming_PtrNode;
typedef TNaming_NamedShape * TNaming_PtrAttribute;
/* end typedefs declaration */

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

%rename(tnaming) TNaming;
class TNaming {
	public:
		%feature("compactdefaultargs") Substitute;
		%feature("autodoc", "	* Subtituter les shapes sur les structures de source vers cible

	:param labelsource:
	:type labelsource: TDF_Label &
	:param labelcible:
	:type labelcible: TDF_Label &
	:param mapOldNew:
	:type mapOldNew: TopTools_DataMapOfShapeShape &
	:rtype: void
") Substitute;
		static void Substitute (const TDF_Label & labelsource,const TDF_Label & labelcible,TopTools_DataMapOfShapeShape & mapOldNew);
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "	* Mise a jour des shapes du label et de ses fils en tenant compte des substitutions decrite par mapOldNew. //! Warning: le remplacement du shape est fait dans tous les attributs qui le contiennent meme si ceux ci ne sont pas associees a des sous-labels de <Label>.

	:param label:
	:type label: TDF_Label &
	:param mapOldNew:
	:type mapOldNew: TopTools_DataMapOfShapeShape &
	:rtype: void
") Update;
		static void Update (const TDF_Label & label,TopTools_DataMapOfShapeShape & mapOldNew);
		%feature("compactdefaultargs") Displace;
		%feature("autodoc", "	* Application de la Location sur les shapes du label et de ses sous labels.

	:param label:
	:type label: TDF_Label &
	:param aLocation:
	:type aLocation: TopLoc_Location &
	:param WithOld: default value is Standard_True
	:type WithOld: bool
	:rtype: void
") Displace;
		static void Displace (const TDF_Label & label,const TopLoc_Location & aLocation,const Standard_Boolean WithOld = Standard_True);
		%feature("compactdefaultargs") ChangeShapes;
		%feature("autodoc", "	* Remplace les shapes du label et des sous-labels par des copies.

	:param label:
	:type label: TDF_Label &
	:param M:
	:type M: TopTools_DataMapOfShapeShape &
	:rtype: void
") ChangeShapes;
		static void ChangeShapes (const TDF_Label & label,TopTools_DataMapOfShapeShape & M);
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "	* Application de la transformation sur les shapes du label et de ses sous labels. Warning: le remplacement du shape est fait dans tous les attributs qui le contiennent meme si ceux ci ne sont pas associees a des sous-labels de <Label>.

	:param label:
	:type label: TDF_Label &
	:param aTransformation:
	:type aTransformation: gp_Trsf
	:rtype: void
") Transform;
		static void Transform (const TDF_Label & label,const gp_Trsf & aTransformation);
		%feature("compactdefaultargs") Replicate;
		%feature("autodoc", "	* Replicates the named shape with the transformation <T> on the label <L> (and sub-labels if necessary) (TNaming_GENERATED is set)

	:param NS:
	:type NS: Handle_TNaming_NamedShape &
	:param T:
	:type T: gp_Trsf
	:param L:
	:type L: TDF_Label &
	:rtype: void
") Replicate;
		static void Replicate (const Handle_TNaming_NamedShape & NS,const gp_Trsf & T,const TDF_Label & L);
		%feature("compactdefaultargs") Replicate;
		%feature("autodoc", "	* Replicates the shape with the transformation <T> on the label <L> (and sub-labels if necessary) (TNaming_GENERATED is set)

	:param SH:
	:type SH: TopoDS_Shape &
	:param T:
	:type T: gp_Trsf
	:param L:
	:type L: TDF_Label &
	:rtype: void
") Replicate;
		static void Replicate (const TopoDS_Shape & SH,const gp_Trsf & T,const TDF_Label & L);
		%feature("compactdefaultargs") MakeShape;
		%feature("autodoc", "	* Builds shape from map content

	:param MS:
	:type MS: TopTools_MapOfShape &
	:rtype: TopoDS_Shape
") MakeShape;
		static TopoDS_Shape MakeShape (const TopTools_MapOfShape & MS);
		%feature("compactdefaultargs") FindUniqueContext;
		%feature("autodoc", "	* Find unique context of shape <S>

	:param S:
	:type S: TopoDS_Shape &
	:param Context:
	:type Context: TopoDS_Shape &
	:rtype: TopoDS_Shape
") FindUniqueContext;
		static TopoDS_Shape FindUniqueContext (const TopoDS_Shape & S,const TopoDS_Shape & Context);
		%feature("compactdefaultargs") FindUniqueContextSet;
		%feature("autodoc", "	* Find unique context of shape <S>,which is pure concatenation of atomic shapes (Compound). The result is concatenation of single contexts

	:param S:
	:type S: TopoDS_Shape &
	:param Context:
	:type Context: TopoDS_Shape &
	:param Arr:
	:type Arr: Handle_TopTools_HArray1OfShape &
	:rtype: TopoDS_Shape
") FindUniqueContextSet;
		static TopoDS_Shape FindUniqueContextSet (const TopoDS_Shape & S,const TopoDS_Shape & Context,Handle_TopTools_HArray1OfShape & Arr);
		%feature("compactdefaultargs") SubstituteSShape;
		%feature("autodoc", "	* Subtitutes shape in source structure

	:param accesslabel:
	:type accesslabel: TDF_Label &
	:param From:
	:type From: TopoDS_Shape &
	:param To:
	:type To: TopoDS_Shape &
	:rtype: bool
") SubstituteSShape;
		static Standard_Boolean SubstituteSShape (const TDF_Label & accesslabel,const TopoDS_Shape & From,TopoDS_Shape & To);
		%feature("compactdefaultargs") OuterWire;
		%feature("autodoc", "	* Returns True if outer wire is found and the found wire in <theWire>.

	:param theFace:
	:type theFace: TopoDS_Face &
	:param theWire:
	:type theWire: TopoDS_Wire &
	:rtype: bool
") OuterWire;
		static Standard_Boolean OuterWire (const TopoDS_Face & theFace,TopoDS_Wire & theWire);
		%feature("compactdefaultargs") OuterShell;
		%feature("autodoc", "	* Returns True if outer Shell is found and the found shell in <theShell>. Print of TNaming enumeration =============================

	:param theSolid:
	:type theSolid: TopoDS_Solid &
	:param theShell:
	:type theShell: TopoDS_Shell &
	:rtype: bool
") OuterShell;
		static Standard_Boolean OuterShell (const TopoDS_Solid & theSolid,TopoDS_Shell & theShell);
		%feature("compactdefaultargs") IDList;
		%feature("autodoc", "	* Appends to <anIDList> the list of the attributes IDs of this package. CAUTION: <anIDList> is NOT cleared before use.

	:param anIDList:
	:type anIDList: TDF_IDList &
	:rtype: void
") IDList;
		static void IDList (TDF_IDList & anIDList);
		%feature("compactdefaultargs") Print;
		%feature("autodoc", "	* Prints the evolution <EVOL> as a String on the Stream <S> and returns <S>.

	:param EVOL:
	:type EVOL: TNaming_Evolution
	:param S:
	:type S: Standard_OStream &
	:rtype: Standard_OStream
") Print;
		static Standard_OStream & Print (const TNaming_Evolution EVOL,Standard_OStream & S);
		%feature("compactdefaultargs") Print;
		%feature("autodoc", "	* Prints the name of name type <NAME> as a String on the Stream <S> and returns <S>.

	:param NAME:
	:type NAME: TNaming_NameType
	:param S:
	:type S: Standard_OStream &
	:rtype: Standard_OStream
") Print;
		static Standard_OStream & Print (const TNaming_NameType NAME,Standard_OStream & S);
		%feature("compactdefaultargs") Print;
		%feature("autodoc", "	* Prints the content of UsedShapes private attribute as a String Table on the Stream <S> and returns <S>.

	:param ACCESS:
	:type ACCESS: TDF_Label &
	:param S:
	:type S: Standard_OStream &
	:rtype: Standard_OStream
") Print;
		static Standard_OStream & Print (const TDF_Label & ACCESS,Standard_OStream & S);
};


%extend TNaming {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TNaming_Builder;
class TNaming_Builder {
	public:
		%feature("compactdefaultargs") TNaming_Builder;
		%feature("autodoc", "	* Create an Builder. Warning: Before Addition copies the current Value, and clear

	:param aLabel:
	:type aLabel: TDF_Label &
	:rtype: None
") TNaming_Builder;
		 TNaming_Builder (const TDF_Label & aLabel);
		%feature("compactdefaultargs") Generated;
		%feature("autodoc", "	* Records the shape newShape which was generated during a topological construction. As an example, consider the case of a face generated in construction of a box.

	:param newShape:
	:type newShape: TopoDS_Shape &
	:rtype: None
") Generated;
		void Generated (const TopoDS_Shape & newShape);
		%feature("compactdefaultargs") Generated;
		%feature("autodoc", "	* Records the shape newShape which was generated from the shape oldShape during a topological construction. As an example, consider the case of a face generated from an edge in construction of a prism.

	:param oldShape:
	:type oldShape: TopoDS_Shape &
	:param newShape:
	:type newShape: TopoDS_Shape &
	:rtype: None
") Generated;
		void Generated (const TopoDS_Shape & oldShape,const TopoDS_Shape & newShape);
		%feature("compactdefaultargs") Delete;
		%feature("autodoc", "	* Records the shape oldShape which was deleted from the current label. As an example, consider the case of a face removed by a Boolean operation.

	:param oldShape:
	:type oldShape: TopoDS_Shape &
	:rtype: None
") Delete;
		void Delete (const TopoDS_Shape & oldShape);
		%feature("compactdefaultargs") Modify;
		%feature("autodoc", "	* Records the shape newShape which is a modification of the shape oldShape. As an example, consider the case of a face split or merged in a Boolean operation.

	:param oldShape:
	:type oldShape: TopoDS_Shape &
	:param newShape:
	:type newShape: TopoDS_Shape &
	:rtype: None
") Modify;
		void Modify (const TopoDS_Shape & oldShape,const TopoDS_Shape & newShape);
		%feature("compactdefaultargs") Select;
		%feature("autodoc", "	* Add a Shape to the current label , This Shape is unmodified. Used for example to define a set of shapes under a label.

	:param aShape:
	:type aShape: TopoDS_Shape &
	:param inShape:
	:type inShape: TopoDS_Shape &
	:rtype: None
") Select;
		void Select (const TopoDS_Shape & aShape,const TopoDS_Shape & inShape);
		%feature("compactdefaultargs") NamedShape;
		%feature("autodoc", "	* Returns the NamedShape which has been built or is under construction.

	:rtype: Handle_TNaming_NamedShape
") NamedShape;
		Handle_TNaming_NamedShape NamedShape ();
};


%extend TNaming_Builder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class TNaming_CopyShape {
	public:
		%feature("compactdefaultargs") CopyTool;
		%feature("autodoc", "	* Makes copy a set of shape(s), using the aMap

	:param aShape:
	:type aShape: TopoDS_Shape &
	:param aMap:
	:type aMap: TColStd_IndexedDataMapOfTransientTransient &
	:param aResult:
	:type aResult: TopoDS_Shape &
	:rtype: void
") CopyTool;
		static void CopyTool (const TopoDS_Shape & aShape,TColStd_IndexedDataMapOfTransientTransient & aMap,TopoDS_Shape & aResult);
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "	* Translates a Transient shape(s) to Transient

	:param aShape:
	:type aShape: TopoDS_Shape &
	:param aMap:
	:type aMap: TColStd_IndexedDataMapOfTransientTransient &
	:param aResult:
	:type aResult: TopoDS_Shape &
	:param TrTool:
	:type TrTool: Handle_TNaming_TranslateTool &
	:rtype: void
") Translate;
		static void Translate (const TopoDS_Shape & aShape,TColStd_IndexedDataMapOfTransientTransient & aMap,TopoDS_Shape & aResult,const Handle_TNaming_TranslateTool & TrTool);
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "	* Translates a Topological Location to an other Top. Location

	:param L:
	:type L: TopLoc_Location &
	:param aMap:
	:type aMap: TColStd_IndexedDataMapOfTransientTransient &
	:rtype: TopLoc_Location
") Translate;
		static TopLoc_Location Translate (const TopLoc_Location & L,TColStd_IndexedDataMapOfTransientTransient & aMap);
};


%extend TNaming_CopyShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TNaming_DataMapIteratorOfDataMapOfShapePtrRefShape;
class TNaming_DataMapIteratorOfDataMapOfShapePtrRefShape : public TCollection_BasicMapIterator {
	public:
		%feature("compactdefaultargs") TNaming_DataMapIteratorOfDataMapOfShapePtrRefShape;
		%feature("autodoc", "	:rtype: None
") TNaming_DataMapIteratorOfDataMapOfShapePtrRefShape;
		 TNaming_DataMapIteratorOfDataMapOfShapePtrRefShape ();
		%feature("compactdefaultargs") TNaming_DataMapIteratorOfDataMapOfShapePtrRefShape;
		%feature("autodoc", "	:param aMap:
	:type aMap: TNaming_DataMapOfShapePtrRefShape &
	:rtype: None
") TNaming_DataMapIteratorOfDataMapOfShapePtrRefShape;
		 TNaming_DataMapIteratorOfDataMapOfShapePtrRefShape (const TNaming_DataMapOfShapePtrRefShape & aMap);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param aMap:
	:type aMap: TNaming_DataMapOfShapePtrRefShape &
	:rtype: None
") Initialize;
		void Initialize (const TNaming_DataMapOfShapePtrRefShape & aMap);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Key;
		const TopoDS_Shape  Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: TNaming_PtrRefShape
") Value;
		const TNaming_PtrRefShape & Value ();
};


%extend TNaming_DataMapIteratorOfDataMapOfShapePtrRefShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TNaming_DataMapIteratorOfDataMapOfShapeShapesSet;
class TNaming_DataMapIteratorOfDataMapOfShapeShapesSet : public TCollection_BasicMapIterator {
	public:
		%feature("compactdefaultargs") TNaming_DataMapIteratorOfDataMapOfShapeShapesSet;
		%feature("autodoc", "	:rtype: None
") TNaming_DataMapIteratorOfDataMapOfShapeShapesSet;
		 TNaming_DataMapIteratorOfDataMapOfShapeShapesSet ();
		%feature("compactdefaultargs") TNaming_DataMapIteratorOfDataMapOfShapeShapesSet;
		%feature("autodoc", "	:param aMap:
	:type aMap: TNaming_DataMapOfShapeShapesSet &
	:rtype: None
") TNaming_DataMapIteratorOfDataMapOfShapeShapesSet;
		 TNaming_DataMapIteratorOfDataMapOfShapeShapesSet (const TNaming_DataMapOfShapeShapesSet & aMap);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param aMap:
	:type aMap: TNaming_DataMapOfShapeShapesSet &
	:rtype: None
") Initialize;
		void Initialize (const TNaming_DataMapOfShapeShapesSet & aMap);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Key;
		const TopoDS_Shape  Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: TNaming_ShapesSet
") Value;
		const TNaming_ShapesSet & Value ();
};


%extend TNaming_DataMapIteratorOfDataMapOfShapeShapesSet {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TNaming_DataMapNodeOfDataMapOfShapePtrRefShape;
class TNaming_DataMapNodeOfDataMapOfShapePtrRefShape : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") TNaming_DataMapNodeOfDataMapOfShapePtrRefShape;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:param I:
	:type I: TNaming_PtrRefShape &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") TNaming_DataMapNodeOfDataMapOfShapePtrRefShape;
		 TNaming_DataMapNodeOfDataMapOfShapePtrRefShape (const TopoDS_Shape & K,const TNaming_PtrRefShape & I,const TCollection_MapNodePtr & n);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Key;
		TopoDS_Shape  Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: TNaming_PtrRefShape
") Value;
		TNaming_PtrRefShape & Value ();
};


%extend TNaming_DataMapNodeOfDataMapOfShapePtrRefShape {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TNaming_DataMapNodeOfDataMapOfShapePtrRefShape(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TNaming_DataMapNodeOfDataMapOfShapePtrRefShape::Handle_TNaming_DataMapNodeOfDataMapOfShapePtrRefShape %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TNaming_DataMapNodeOfDataMapOfShapePtrRefShape;
class Handle_TNaming_DataMapNodeOfDataMapOfShapePtrRefShape : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_TNaming_DataMapNodeOfDataMapOfShapePtrRefShape();
        Handle_TNaming_DataMapNodeOfDataMapOfShapePtrRefShape(const Handle_TNaming_DataMapNodeOfDataMapOfShapePtrRefShape &aHandle);
        Handle_TNaming_DataMapNodeOfDataMapOfShapePtrRefShape(const TNaming_DataMapNodeOfDataMapOfShapePtrRefShape *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TNaming_DataMapNodeOfDataMapOfShapePtrRefShape DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TNaming_DataMapNodeOfDataMapOfShapePtrRefShape {
    TNaming_DataMapNodeOfDataMapOfShapePtrRefShape* _get_reference() {
    return (TNaming_DataMapNodeOfDataMapOfShapePtrRefShape*)$self->Access();
    }
};

%extend Handle_TNaming_DataMapNodeOfDataMapOfShapePtrRefShape {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TNaming_DataMapNodeOfDataMapOfShapePtrRefShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TNaming_DataMapNodeOfDataMapOfShapeShapesSet;
class TNaming_DataMapNodeOfDataMapOfShapeShapesSet : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") TNaming_DataMapNodeOfDataMapOfShapeShapesSet;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:param I:
	:type I: TNaming_ShapesSet &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") TNaming_DataMapNodeOfDataMapOfShapeShapesSet;
		 TNaming_DataMapNodeOfDataMapOfShapeShapesSet (const TopoDS_Shape & K,const TNaming_ShapesSet & I,const TCollection_MapNodePtr & n);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Key;
		TopoDS_Shape  Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: TNaming_ShapesSet
") Value;
		TNaming_ShapesSet & Value ();
};


%extend TNaming_DataMapNodeOfDataMapOfShapeShapesSet {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TNaming_DataMapNodeOfDataMapOfShapeShapesSet(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TNaming_DataMapNodeOfDataMapOfShapeShapesSet::Handle_TNaming_DataMapNodeOfDataMapOfShapeShapesSet %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TNaming_DataMapNodeOfDataMapOfShapeShapesSet;
class Handle_TNaming_DataMapNodeOfDataMapOfShapeShapesSet : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_TNaming_DataMapNodeOfDataMapOfShapeShapesSet();
        Handle_TNaming_DataMapNodeOfDataMapOfShapeShapesSet(const Handle_TNaming_DataMapNodeOfDataMapOfShapeShapesSet &aHandle);
        Handle_TNaming_DataMapNodeOfDataMapOfShapeShapesSet(const TNaming_DataMapNodeOfDataMapOfShapeShapesSet *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TNaming_DataMapNodeOfDataMapOfShapeShapesSet DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TNaming_DataMapNodeOfDataMapOfShapeShapesSet {
    TNaming_DataMapNodeOfDataMapOfShapeShapesSet* _get_reference() {
    return (TNaming_DataMapNodeOfDataMapOfShapeShapesSet*)$self->Access();
    }
};

%extend Handle_TNaming_DataMapNodeOfDataMapOfShapeShapesSet {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TNaming_DataMapNodeOfDataMapOfShapeShapesSet {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TNaming_DataMapOfShapePtrRefShape;
class TNaming_DataMapOfShapePtrRefShape : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") TNaming_DataMapOfShapePtrRefShape;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") TNaming_DataMapOfShapePtrRefShape;
		 TNaming_DataMapOfShapePtrRefShape (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TNaming_DataMapOfShapePtrRefShape &
	:rtype: TNaming_DataMapOfShapePtrRefShape
") Assign;
		TNaming_DataMapOfShapePtrRefShape & Assign (const TNaming_DataMapOfShapePtrRefShape & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TNaming_DataMapOfShapePtrRefShape &
	:rtype: TNaming_DataMapOfShapePtrRefShape
") operator =;
		TNaming_DataMapOfShapePtrRefShape & operator = (const TNaming_DataMapOfShapePtrRefShape & Other);
		%feature("compactdefaultargs") ReSize;
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: int
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:param I:
	:type I: TNaming_PtrRefShape &
	:rtype: bool
") Bind;
		Standard_Boolean Bind (const TopoDS_Shape & K,const TNaming_PtrRefShape & I);
		%feature("compactdefaultargs") IsBound;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: bool
") IsBound;
		Standard_Boolean IsBound (const TopoDS_Shape & K);
		%feature("compactdefaultargs") UnBind;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: bool
") UnBind;
		Standard_Boolean UnBind (const TopoDS_Shape & K);
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: TNaming_PtrRefShape
") Find;
		const TNaming_PtrRefShape & Find (const TopoDS_Shape & K);
		%feature("compactdefaultargs") ChangeFind;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: TNaming_PtrRefShape
") ChangeFind;
		TNaming_PtrRefShape & ChangeFind (const TopoDS_Shape & K);
		%feature("compactdefaultargs") Find1;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: Standard_Address
") Find1;
		Standard_Address Find1 (const TopoDS_Shape & K);
		%feature("compactdefaultargs") ChangeFind1;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: Standard_Address
") ChangeFind1;
		Standard_Address ChangeFind1 (const TopoDS_Shape & K);
};


%extend TNaming_DataMapOfShapePtrRefShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TNaming_DataMapOfShapeShapesSet;
class TNaming_DataMapOfShapeShapesSet : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") TNaming_DataMapOfShapeShapesSet;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") TNaming_DataMapOfShapeShapesSet;
		 TNaming_DataMapOfShapeShapesSet (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TNaming_DataMapOfShapeShapesSet &
	:rtype: TNaming_DataMapOfShapeShapesSet
") Assign;
		TNaming_DataMapOfShapeShapesSet & Assign (const TNaming_DataMapOfShapeShapesSet & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TNaming_DataMapOfShapeShapesSet &
	:rtype: TNaming_DataMapOfShapeShapesSet
") operator =;
		TNaming_DataMapOfShapeShapesSet & operator = (const TNaming_DataMapOfShapeShapesSet & Other);
		%feature("compactdefaultargs") ReSize;
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: int
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:param I:
	:type I: TNaming_ShapesSet &
	:rtype: bool
") Bind;
		Standard_Boolean Bind (const TopoDS_Shape & K,const TNaming_ShapesSet & I);
		%feature("compactdefaultargs") IsBound;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: bool
") IsBound;
		Standard_Boolean IsBound (const TopoDS_Shape & K);
		%feature("compactdefaultargs") UnBind;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: bool
") UnBind;
		Standard_Boolean UnBind (const TopoDS_Shape & K);
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: TNaming_ShapesSet
") Find;
		const TNaming_ShapesSet & Find (const TopoDS_Shape & K);
		%feature("compactdefaultargs") ChangeFind;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: TNaming_ShapesSet
") ChangeFind;
		TNaming_ShapesSet & ChangeFind (const TopoDS_Shape & K);
		%feature("compactdefaultargs") Find1;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: Standard_Address
") Find1;
		Standard_Address Find1 (const TopoDS_Shape & K);
		%feature("compactdefaultargs") ChangeFind1;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: Standard_Address
") ChangeFind1;
		Standard_Address ChangeFind1 (const TopoDS_Shape & K);
};


%extend TNaming_DataMapOfShapeShapesSet {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TNaming_DeltaOnModification;
class TNaming_DeltaOnModification : public TDF_DeltaOnModification {
	public:
		%feature("compactdefaultargs") TNaming_DeltaOnModification;
		%feature("autodoc", "	* Initializes a TDF_DeltaOnModification.

	:param NS:
	:type NS: Handle_TNaming_NamedShape &
	:rtype: None
") TNaming_DeltaOnModification;
		 TNaming_DeltaOnModification (const Handle_TNaming_NamedShape & NS);
		%feature("compactdefaultargs") Apply;
		%feature("autodoc", "	* Applies the delta to the attribute.

	:rtype: void
") Apply;
		virtual void Apply ();
};


%extend TNaming_DeltaOnModification {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TNaming_DeltaOnModification(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TNaming_DeltaOnModification::Handle_TNaming_DeltaOnModification %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TNaming_DeltaOnModification;
class Handle_TNaming_DeltaOnModification : public Handle_TDF_DeltaOnModification {

    public:
        // constructors
        Handle_TNaming_DeltaOnModification();
        Handle_TNaming_DeltaOnModification(const Handle_TNaming_DeltaOnModification &aHandle);
        Handle_TNaming_DeltaOnModification(const TNaming_DeltaOnModification *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TNaming_DeltaOnModification DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TNaming_DeltaOnModification {
    TNaming_DeltaOnModification* _get_reference() {
    return (TNaming_DeltaOnModification*)$self->Access();
    }
};

%extend Handle_TNaming_DeltaOnModification {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TNaming_DeltaOnModification {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TNaming_DeltaOnRemoval;
class TNaming_DeltaOnRemoval : public TDF_DeltaOnRemoval {
	public:
		%feature("compactdefaultargs") TNaming_DeltaOnRemoval;
		%feature("autodoc", "	* Initializes a TDF_DeltaOnModification.

	:param NS:
	:type NS: Handle_TNaming_NamedShape &
	:rtype: None
") TNaming_DeltaOnRemoval;
		 TNaming_DeltaOnRemoval (const Handle_TNaming_NamedShape & NS);
		%feature("compactdefaultargs") Apply;
		%feature("autodoc", "	* Applies the delta to the attribute.

	:rtype: void
") Apply;
		virtual void Apply ();
};


%extend TNaming_DeltaOnRemoval {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TNaming_DeltaOnRemoval(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TNaming_DeltaOnRemoval::Handle_TNaming_DeltaOnRemoval %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TNaming_DeltaOnRemoval;
class Handle_TNaming_DeltaOnRemoval : public Handle_TDF_DeltaOnRemoval {

    public:
        // constructors
        Handle_TNaming_DeltaOnRemoval();
        Handle_TNaming_DeltaOnRemoval(const Handle_TNaming_DeltaOnRemoval &aHandle);
        Handle_TNaming_DeltaOnRemoval(const TNaming_DeltaOnRemoval *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TNaming_DeltaOnRemoval DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TNaming_DeltaOnRemoval {
    TNaming_DeltaOnRemoval* _get_reference() {
    return (TNaming_DeltaOnRemoval*)$self->Access();
    }
};

%extend Handle_TNaming_DeltaOnRemoval {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TNaming_DeltaOnRemoval {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TNaming_Identifier;
class TNaming_Identifier {
	public:
		%feature("compactdefaultargs") TNaming_Identifier;
		%feature("autodoc", "	:param Lab:
	:type Lab: TDF_Label &
	:param S:
	:type S: TopoDS_Shape &
	:param Context:
	:type Context: TopoDS_Shape &
	:param Geom:
	:type Geom: bool
	:rtype: None
") TNaming_Identifier;
		 TNaming_Identifier (const TDF_Label & Lab,const TopoDS_Shape & S,const TopoDS_Shape & Context,const Standard_Boolean Geom);
		%feature("compactdefaultargs") TNaming_Identifier;
		%feature("autodoc", "	:param Lab:
	:type Lab: TDF_Label &
	:param S:
	:type S: TopoDS_Shape &
	:param ContextNS:
	:type ContextNS: Handle_TNaming_NamedShape &
	:param Geom:
	:type Geom: bool
	:rtype: None
") TNaming_Identifier;
		 TNaming_Identifier (const TDF_Label & Lab,const TopoDS_Shape & S,const Handle_TNaming_NamedShape & ContextNS,const Standard_Boolean Geom);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "	:rtype: TNaming_NameType
") Type;
		TNaming_NameType Type ();
		%feature("compactdefaultargs") IsFeature;
		%feature("autodoc", "	:rtype: bool
") IsFeature;
		Standard_Boolean IsFeature ();
		%feature("compactdefaultargs") Feature;
		%feature("autodoc", "	:rtype: Handle_TNaming_NamedShape
") Feature;
		Handle_TNaming_NamedShape Feature ();
		%feature("compactdefaultargs") InitArgs;
		%feature("autodoc", "	:rtype: None
") InitArgs;
		void InitArgs ();
		%feature("compactdefaultargs") MoreArgs;
		%feature("autodoc", "	:rtype: bool
") MoreArgs;
		Standard_Boolean MoreArgs ();
		%feature("compactdefaultargs") NextArg;
		%feature("autodoc", "	:rtype: None
") NextArg;
		void NextArg ();
		%feature("compactdefaultargs") ArgIsFeature;
		%feature("autodoc", "	:rtype: bool
") ArgIsFeature;
		Standard_Boolean ArgIsFeature ();
		%feature("compactdefaultargs") FeatureArg;
		%feature("autodoc", "	:rtype: Handle_TNaming_NamedShape
") FeatureArg;
		Handle_TNaming_NamedShape FeatureArg ();
		%feature("compactdefaultargs") ShapeArg;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") ShapeArg;
		TopoDS_Shape ShapeArg ();
		%feature("compactdefaultargs") ShapeContext;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") ShapeContext;
		TopoDS_Shape ShapeContext ();
		%feature("compactdefaultargs") NamedShapeOfGeneration;
		%feature("autodoc", "	:rtype: Handle_TNaming_NamedShape
") NamedShapeOfGeneration;
		Handle_TNaming_NamedShape NamedShapeOfGeneration ();
		%feature("compactdefaultargs") AncestorIdentification;
		%feature("autodoc", "	:param Localizer:
	:type Localizer: TNaming_Localizer &
	:param Context:
	:type Context: TopoDS_Shape &
	:rtype: None
") AncestorIdentification;
		void AncestorIdentification (TNaming_Localizer & Localizer,const TopoDS_Shape & Context);
		%feature("compactdefaultargs") PrimitiveIdentification;
		%feature("autodoc", "	:param Localizer:
	:type Localizer: TNaming_Localizer &
	:param NS:
	:type NS: Handle_TNaming_NamedShape &
	:rtype: None
") PrimitiveIdentification;
		void PrimitiveIdentification (TNaming_Localizer & Localizer,const Handle_TNaming_NamedShape & NS);
		%feature("compactdefaultargs") GeneratedIdentification;
		%feature("autodoc", "	:param Localizer:
	:type Localizer: TNaming_Localizer &
	:param NS:
	:type NS: Handle_TNaming_NamedShape &
	:rtype: None
") GeneratedIdentification;
		void GeneratedIdentification (TNaming_Localizer & Localizer,const Handle_TNaming_NamedShape & NS);
		%feature("compactdefaultargs") Identification;
		%feature("autodoc", "	:param Localizer:
	:type Localizer: TNaming_Localizer &
	:param NS:
	:type NS: Handle_TNaming_NamedShape &
	:rtype: None
") Identification;
		void Identification (TNaming_Localizer & Localizer,const Handle_TNaming_NamedShape & NS);
};


%extend TNaming_Identifier {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TNaming_Iterator;
class TNaming_Iterator {
	public:
		%feature("compactdefaultargs") TNaming_Iterator;
		%feature("autodoc", "	* Iterates on all the history records in <anAtt>.

	:param anAtt:
	:type anAtt: Handle_TNaming_NamedShape &
	:rtype: None
") TNaming_Iterator;
		 TNaming_Iterator (const Handle_TNaming_NamedShape & anAtt);
		%feature("compactdefaultargs") TNaming_Iterator;
		%feature("autodoc", "	* Iterates on all the history records in the current transaction

	:param aLabel:
	:type aLabel: TDF_Label &
	:rtype: None
") TNaming_Iterator;
		 TNaming_Iterator (const TDF_Label & aLabel);
		%feature("compactdefaultargs") TNaming_Iterator;
		%feature("autodoc", "	* Iterates on all the history records in the transaction <aTrans>

	:param aLabel:
	:type aLabel: TDF_Label &
	:param aTrans:
	:type aTrans: int
	:rtype: None
") TNaming_Iterator;
		 TNaming_Iterator (const TDF_Label & aLabel,const Standard_Integer aTrans);
		%feature("compactdefaultargs") More;
		%feature("autodoc", "	* Returns True if there is a current Item in the iteration.

	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "	* Moves the iteration to the next Item

	:rtype: None
") Next;
		void Next ();
		%feature("compactdefaultargs") OldShape;
		%feature("autodoc", "	* Returns the old shape in this iterator object. This shape can be a null one.

	:rtype: TopoDS_Shape
") OldShape;
		const TopoDS_Shape  OldShape ();
		%feature("compactdefaultargs") NewShape;
		%feature("autodoc", "	* Returns the new shape in this iterator object.

	:rtype: TopoDS_Shape
") NewShape;
		const TopoDS_Shape  NewShape ();
		%feature("compactdefaultargs") IsModification;
		%feature("autodoc", "	* Returns true if the new shape is a modification (split, fuse,etc...) of the old shape.

	:rtype: bool
") IsModification;
		Standard_Boolean IsModification ();
		%feature("compactdefaultargs") Evolution;
		%feature("autodoc", "	:rtype: TNaming_Evolution
") Evolution;
		TNaming_Evolution Evolution ();
};


%extend TNaming_Iterator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TNaming_IteratorOnShapesSet;
class TNaming_IteratorOnShapesSet {
	public:
		%feature("compactdefaultargs") TNaming_IteratorOnShapesSet;
		%feature("autodoc", "	:rtype: None
") TNaming_IteratorOnShapesSet;
		 TNaming_IteratorOnShapesSet ();
		%feature("compactdefaultargs") TNaming_IteratorOnShapesSet;
		%feature("autodoc", "	:param S:
	:type S: TNaming_ShapesSet &
	:rtype: None
") TNaming_IteratorOnShapesSet;
		 TNaming_IteratorOnShapesSet (const TNaming_ShapesSet & S);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize the iteration

	:param S:
	:type S: TNaming_ShapesSet &
	:rtype: None
") Init;
		void Init (const TNaming_ShapesSet & S);
		%feature("compactdefaultargs") More;
		%feature("autodoc", "	* Returns True if there is a current Item in the iteration.

	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "	* Move to the next Item

	:rtype: None
") Next;
		void Next ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Value;
		const TopoDS_Shape  Value ();
};


%extend TNaming_IteratorOnShapesSet {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TNaming_ListIteratorOfListOfIndexedDataMapOfShapeListOfShape;
class TNaming_ListIteratorOfListOfIndexedDataMapOfShapeListOfShape {
	public:
		%feature("compactdefaultargs") TNaming_ListIteratorOfListOfIndexedDataMapOfShapeListOfShape;
		%feature("autodoc", "	:rtype: None
") TNaming_ListIteratorOfListOfIndexedDataMapOfShapeListOfShape;
		 TNaming_ListIteratorOfListOfIndexedDataMapOfShapeListOfShape ();
		%feature("compactdefaultargs") TNaming_ListIteratorOfListOfIndexedDataMapOfShapeListOfShape;
		%feature("autodoc", "	:param L:
	:type L: TNaming_ListOfIndexedDataMapOfShapeListOfShape &
	:rtype: None
") TNaming_ListIteratorOfListOfIndexedDataMapOfShapeListOfShape;
		 TNaming_ListIteratorOfListOfIndexedDataMapOfShapeListOfShape (const TNaming_ListOfIndexedDataMapOfShapeListOfShape & L);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param L:
	:type L: TNaming_ListOfIndexedDataMapOfShapeListOfShape &
	:rtype: None
") Initialize;
		void Initialize (const TNaming_ListOfIndexedDataMapOfShapeListOfShape & L);
		%feature("compactdefaultargs") More;
		%feature("autodoc", "	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "	:rtype: None
") Next;
		void Next ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: TopTools_IndexedDataMapOfShapeListOfShape
") Value;
		TopTools_IndexedDataMapOfShapeListOfShape & Value ();
};


%extend TNaming_ListIteratorOfListOfIndexedDataMapOfShapeListOfShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TNaming_ListIteratorOfListOfMapOfShape;
class TNaming_ListIteratorOfListOfMapOfShape {
	public:
		%feature("compactdefaultargs") TNaming_ListIteratorOfListOfMapOfShape;
		%feature("autodoc", "	:rtype: None
") TNaming_ListIteratorOfListOfMapOfShape;
		 TNaming_ListIteratorOfListOfMapOfShape ();
		%feature("compactdefaultargs") TNaming_ListIteratorOfListOfMapOfShape;
		%feature("autodoc", "	:param L:
	:type L: TNaming_ListOfMapOfShape &
	:rtype: None
") TNaming_ListIteratorOfListOfMapOfShape;
		 TNaming_ListIteratorOfListOfMapOfShape (const TNaming_ListOfMapOfShape & L);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param L:
	:type L: TNaming_ListOfMapOfShape &
	:rtype: None
") Initialize;
		void Initialize (const TNaming_ListOfMapOfShape & L);
		%feature("compactdefaultargs") More;
		%feature("autodoc", "	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "	:rtype: None
") Next;
		void Next ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: TopTools_MapOfShape
") Value;
		TopTools_MapOfShape & Value ();
};


%extend TNaming_ListIteratorOfListOfMapOfShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TNaming_ListIteratorOfListOfNamedShape;
class TNaming_ListIteratorOfListOfNamedShape {
	public:
		%feature("compactdefaultargs") TNaming_ListIteratorOfListOfNamedShape;
		%feature("autodoc", "	:rtype: None
") TNaming_ListIteratorOfListOfNamedShape;
		 TNaming_ListIteratorOfListOfNamedShape ();
		%feature("compactdefaultargs") TNaming_ListIteratorOfListOfNamedShape;
		%feature("autodoc", "	:param L:
	:type L: TNaming_ListOfNamedShape &
	:rtype: None
") TNaming_ListIteratorOfListOfNamedShape;
		 TNaming_ListIteratorOfListOfNamedShape (const TNaming_ListOfNamedShape & L);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param L:
	:type L: TNaming_ListOfNamedShape &
	:rtype: None
") Initialize;
		void Initialize (const TNaming_ListOfNamedShape & L);
		%feature("compactdefaultargs") More;
		%feature("autodoc", "	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "	:rtype: None
") Next;
		void Next ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_TNaming_NamedShape
") Value;
		Handle_TNaming_NamedShape Value ();
};


%extend TNaming_ListIteratorOfListOfNamedShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TNaming_ListNodeOfListOfIndexedDataMapOfShapeListOfShape;
class TNaming_ListNodeOfListOfIndexedDataMapOfShapeListOfShape : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") TNaming_ListNodeOfListOfIndexedDataMapOfShapeListOfShape;
		%feature("autodoc", "	:param I:
	:type I: TopTools_IndexedDataMapOfShapeListOfShape &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") TNaming_ListNodeOfListOfIndexedDataMapOfShapeListOfShape;
		 TNaming_ListNodeOfListOfIndexedDataMapOfShapeListOfShape (const TopTools_IndexedDataMapOfShapeListOfShape & I,const TCollection_MapNodePtr & n);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: TopTools_IndexedDataMapOfShapeListOfShape
") Value;
		TopTools_IndexedDataMapOfShapeListOfShape & Value ();
};


%extend TNaming_ListNodeOfListOfIndexedDataMapOfShapeListOfShape {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TNaming_ListNodeOfListOfIndexedDataMapOfShapeListOfShape(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TNaming_ListNodeOfListOfIndexedDataMapOfShapeListOfShape::Handle_TNaming_ListNodeOfListOfIndexedDataMapOfShapeListOfShape %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TNaming_ListNodeOfListOfIndexedDataMapOfShapeListOfShape;
class Handle_TNaming_ListNodeOfListOfIndexedDataMapOfShapeListOfShape : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_TNaming_ListNodeOfListOfIndexedDataMapOfShapeListOfShape();
        Handle_TNaming_ListNodeOfListOfIndexedDataMapOfShapeListOfShape(const Handle_TNaming_ListNodeOfListOfIndexedDataMapOfShapeListOfShape &aHandle);
        Handle_TNaming_ListNodeOfListOfIndexedDataMapOfShapeListOfShape(const TNaming_ListNodeOfListOfIndexedDataMapOfShapeListOfShape *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TNaming_ListNodeOfListOfIndexedDataMapOfShapeListOfShape DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TNaming_ListNodeOfListOfIndexedDataMapOfShapeListOfShape {
    TNaming_ListNodeOfListOfIndexedDataMapOfShapeListOfShape* _get_reference() {
    return (TNaming_ListNodeOfListOfIndexedDataMapOfShapeListOfShape*)$self->Access();
    }
};

%extend Handle_TNaming_ListNodeOfListOfIndexedDataMapOfShapeListOfShape {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TNaming_ListNodeOfListOfIndexedDataMapOfShapeListOfShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TNaming_ListNodeOfListOfMapOfShape;
class TNaming_ListNodeOfListOfMapOfShape : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") TNaming_ListNodeOfListOfMapOfShape;
		%feature("autodoc", "	:param I:
	:type I: TopTools_MapOfShape &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") TNaming_ListNodeOfListOfMapOfShape;
		 TNaming_ListNodeOfListOfMapOfShape (const TopTools_MapOfShape & I,const TCollection_MapNodePtr & n);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: TopTools_MapOfShape
") Value;
		TopTools_MapOfShape & Value ();
};


%extend TNaming_ListNodeOfListOfMapOfShape {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TNaming_ListNodeOfListOfMapOfShape(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TNaming_ListNodeOfListOfMapOfShape::Handle_TNaming_ListNodeOfListOfMapOfShape %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TNaming_ListNodeOfListOfMapOfShape;
class Handle_TNaming_ListNodeOfListOfMapOfShape : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_TNaming_ListNodeOfListOfMapOfShape();
        Handle_TNaming_ListNodeOfListOfMapOfShape(const Handle_TNaming_ListNodeOfListOfMapOfShape &aHandle);
        Handle_TNaming_ListNodeOfListOfMapOfShape(const TNaming_ListNodeOfListOfMapOfShape *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TNaming_ListNodeOfListOfMapOfShape DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TNaming_ListNodeOfListOfMapOfShape {
    TNaming_ListNodeOfListOfMapOfShape* _get_reference() {
    return (TNaming_ListNodeOfListOfMapOfShape*)$self->Access();
    }
};

%extend Handle_TNaming_ListNodeOfListOfMapOfShape {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TNaming_ListNodeOfListOfMapOfShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TNaming_ListNodeOfListOfNamedShape;
class TNaming_ListNodeOfListOfNamedShape : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") TNaming_ListNodeOfListOfNamedShape;
		%feature("autodoc", "	:param I:
	:type I: Handle_TNaming_NamedShape &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") TNaming_ListNodeOfListOfNamedShape;
		 TNaming_ListNodeOfListOfNamedShape (const Handle_TNaming_NamedShape & I,const TCollection_MapNodePtr & n);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_TNaming_NamedShape
") Value;
		Handle_TNaming_NamedShape Value ();
};


%extend TNaming_ListNodeOfListOfNamedShape {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TNaming_ListNodeOfListOfNamedShape(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TNaming_ListNodeOfListOfNamedShape::Handle_TNaming_ListNodeOfListOfNamedShape %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TNaming_ListNodeOfListOfNamedShape;
class Handle_TNaming_ListNodeOfListOfNamedShape : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_TNaming_ListNodeOfListOfNamedShape();
        Handle_TNaming_ListNodeOfListOfNamedShape(const Handle_TNaming_ListNodeOfListOfNamedShape &aHandle);
        Handle_TNaming_ListNodeOfListOfNamedShape(const TNaming_ListNodeOfListOfNamedShape *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TNaming_ListNodeOfListOfNamedShape DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TNaming_ListNodeOfListOfNamedShape {
    TNaming_ListNodeOfListOfNamedShape* _get_reference() {
    return (TNaming_ListNodeOfListOfNamedShape*)$self->Access();
    }
};

%extend Handle_TNaming_ListNodeOfListOfNamedShape {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TNaming_ListNodeOfListOfNamedShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TNaming_ListOfIndexedDataMapOfShapeListOfShape;
class TNaming_ListOfIndexedDataMapOfShapeListOfShape {
	public:
		%feature("compactdefaultargs") TNaming_ListOfIndexedDataMapOfShapeListOfShape;
		%feature("autodoc", "	:rtype: None
") TNaming_ListOfIndexedDataMapOfShapeListOfShape;
		 TNaming_ListOfIndexedDataMapOfShapeListOfShape ();
		%feature("compactdefaultargs") TNaming_ListOfIndexedDataMapOfShapeListOfShape;
		%feature("autodoc", "	:param Other:
	:type Other: TNaming_ListOfIndexedDataMapOfShapeListOfShape &
	:rtype: None
") TNaming_ListOfIndexedDataMapOfShapeListOfShape;
		 TNaming_ListOfIndexedDataMapOfShapeListOfShape (const TNaming_ListOfIndexedDataMapOfShapeListOfShape & Other);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TNaming_ListOfIndexedDataMapOfShapeListOfShape &
	:rtype: None
") Assign;
		void Assign (const TNaming_ListOfIndexedDataMapOfShapeListOfShape & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TNaming_ListOfIndexedDataMapOfShapeListOfShape &
	:rtype: None
") operator =;
		void operator = (const TNaming_ListOfIndexedDataMapOfShapeListOfShape & Other);
		%feature("compactdefaultargs") Extent;
		%feature("autodoc", "	:rtype: int
") Extent;
		Standard_Integer Extent ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param I:
	:type I: TopTools_IndexedDataMapOfShapeListOfShape &
	:rtype: None
") Prepend;
		void Prepend (const TopTools_IndexedDataMapOfShapeListOfShape & I);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param I:
	:type I: TopTools_IndexedDataMapOfShapeListOfShape &
	:param theIt:
	:type theIt: TNaming_ListIteratorOfListOfIndexedDataMapOfShapeListOfShape &
	:rtype: None
") Prepend;
		void Prepend (const TopTools_IndexedDataMapOfShapeListOfShape & I,TNaming_ListIteratorOfListOfIndexedDataMapOfShapeListOfShape & theIt);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param Other:
	:type Other: TNaming_ListOfIndexedDataMapOfShapeListOfShape &
	:rtype: None
") Prepend;
		void Prepend (TNaming_ListOfIndexedDataMapOfShapeListOfShape & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param I:
	:type I: TopTools_IndexedDataMapOfShapeListOfShape &
	:rtype: None
") Append;
		void Append (const TopTools_IndexedDataMapOfShapeListOfShape & I);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param I:
	:type I: TopTools_IndexedDataMapOfShapeListOfShape &
	:param theIt:
	:type theIt: TNaming_ListIteratorOfListOfIndexedDataMapOfShapeListOfShape &
	:rtype: None
") Append;
		void Append (const TopTools_IndexedDataMapOfShapeListOfShape & I,TNaming_ListIteratorOfListOfIndexedDataMapOfShapeListOfShape & theIt);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param Other:
	:type Other: TNaming_ListOfIndexedDataMapOfShapeListOfShape &
	:rtype: None
") Append;
		void Append (TNaming_ListOfIndexedDataMapOfShapeListOfShape & Other);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: TopTools_IndexedDataMapOfShapeListOfShape
") First;
		TopTools_IndexedDataMapOfShapeListOfShape & First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: TopTools_IndexedDataMapOfShapeListOfShape
") Last;
		TopTools_IndexedDataMapOfShapeListOfShape & Last ();
		%feature("compactdefaultargs") RemoveFirst;
		%feature("autodoc", "	:rtype: None
") RemoveFirst;
		void RemoveFirst ();
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param It:
	:type It: TNaming_ListIteratorOfListOfIndexedDataMapOfShapeListOfShape &
	:rtype: None
") Remove;
		void Remove (TNaming_ListIteratorOfListOfIndexedDataMapOfShapeListOfShape & It);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param I:
	:type I: TopTools_IndexedDataMapOfShapeListOfShape &
	:param It:
	:type It: TNaming_ListIteratorOfListOfIndexedDataMapOfShapeListOfShape &
	:rtype: None
") InsertBefore;
		void InsertBefore (const TopTools_IndexedDataMapOfShapeListOfShape & I,TNaming_ListIteratorOfListOfIndexedDataMapOfShapeListOfShape & It);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Other:
	:type Other: TNaming_ListOfIndexedDataMapOfShapeListOfShape &
	:param It:
	:type It: TNaming_ListIteratorOfListOfIndexedDataMapOfShapeListOfShape &
	:rtype: None
") InsertBefore;
		void InsertBefore (TNaming_ListOfIndexedDataMapOfShapeListOfShape & Other,TNaming_ListIteratorOfListOfIndexedDataMapOfShapeListOfShape & It);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param I:
	:type I: TopTools_IndexedDataMapOfShapeListOfShape &
	:param It:
	:type It: TNaming_ListIteratorOfListOfIndexedDataMapOfShapeListOfShape &
	:rtype: None
") InsertAfter;
		void InsertAfter (const TopTools_IndexedDataMapOfShapeListOfShape & I,TNaming_ListIteratorOfListOfIndexedDataMapOfShapeListOfShape & It);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Other:
	:type Other: TNaming_ListOfIndexedDataMapOfShapeListOfShape &
	:param It:
	:type It: TNaming_ListIteratorOfListOfIndexedDataMapOfShapeListOfShape &
	:rtype: None
") InsertAfter;
		void InsertAfter (TNaming_ListOfIndexedDataMapOfShapeListOfShape & Other,TNaming_ListIteratorOfListOfIndexedDataMapOfShapeListOfShape & It);
};


%extend TNaming_ListOfIndexedDataMapOfShapeListOfShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TNaming_ListOfMapOfShape;
class TNaming_ListOfMapOfShape {
	public:
		%feature("compactdefaultargs") TNaming_ListOfMapOfShape;
		%feature("autodoc", "	:rtype: None
") TNaming_ListOfMapOfShape;
		 TNaming_ListOfMapOfShape ();
		%feature("compactdefaultargs") TNaming_ListOfMapOfShape;
		%feature("autodoc", "	:param Other:
	:type Other: TNaming_ListOfMapOfShape &
	:rtype: None
") TNaming_ListOfMapOfShape;
		 TNaming_ListOfMapOfShape (const TNaming_ListOfMapOfShape & Other);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TNaming_ListOfMapOfShape &
	:rtype: None
") Assign;
		void Assign (const TNaming_ListOfMapOfShape & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TNaming_ListOfMapOfShape &
	:rtype: None
") operator =;
		void operator = (const TNaming_ListOfMapOfShape & Other);
		%feature("compactdefaultargs") Extent;
		%feature("autodoc", "	:rtype: int
") Extent;
		Standard_Integer Extent ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param I:
	:type I: TopTools_MapOfShape &
	:rtype: None
") Prepend;
		void Prepend (const TopTools_MapOfShape & I);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param I:
	:type I: TopTools_MapOfShape &
	:param theIt:
	:type theIt: TNaming_ListIteratorOfListOfMapOfShape &
	:rtype: None
") Prepend;
		void Prepend (const TopTools_MapOfShape & I,TNaming_ListIteratorOfListOfMapOfShape & theIt);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param Other:
	:type Other: TNaming_ListOfMapOfShape &
	:rtype: None
") Prepend;
		void Prepend (TNaming_ListOfMapOfShape & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param I:
	:type I: TopTools_MapOfShape &
	:rtype: None
") Append;
		void Append (const TopTools_MapOfShape & I);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param I:
	:type I: TopTools_MapOfShape &
	:param theIt:
	:type theIt: TNaming_ListIteratorOfListOfMapOfShape &
	:rtype: None
") Append;
		void Append (const TopTools_MapOfShape & I,TNaming_ListIteratorOfListOfMapOfShape & theIt);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param Other:
	:type Other: TNaming_ListOfMapOfShape &
	:rtype: None
") Append;
		void Append (TNaming_ListOfMapOfShape & Other);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: TopTools_MapOfShape
") First;
		TopTools_MapOfShape & First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: TopTools_MapOfShape
") Last;
		TopTools_MapOfShape & Last ();
		%feature("compactdefaultargs") RemoveFirst;
		%feature("autodoc", "	:rtype: None
") RemoveFirst;
		void RemoveFirst ();
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param It:
	:type It: TNaming_ListIteratorOfListOfMapOfShape &
	:rtype: None
") Remove;
		void Remove (TNaming_ListIteratorOfListOfMapOfShape & It);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param I:
	:type I: TopTools_MapOfShape &
	:param It:
	:type It: TNaming_ListIteratorOfListOfMapOfShape &
	:rtype: None
") InsertBefore;
		void InsertBefore (const TopTools_MapOfShape & I,TNaming_ListIteratorOfListOfMapOfShape & It);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Other:
	:type Other: TNaming_ListOfMapOfShape &
	:param It:
	:type It: TNaming_ListIteratorOfListOfMapOfShape &
	:rtype: None
") InsertBefore;
		void InsertBefore (TNaming_ListOfMapOfShape & Other,TNaming_ListIteratorOfListOfMapOfShape & It);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param I:
	:type I: TopTools_MapOfShape &
	:param It:
	:type It: TNaming_ListIteratorOfListOfMapOfShape &
	:rtype: None
") InsertAfter;
		void InsertAfter (const TopTools_MapOfShape & I,TNaming_ListIteratorOfListOfMapOfShape & It);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Other:
	:type Other: TNaming_ListOfMapOfShape &
	:param It:
	:type It: TNaming_ListIteratorOfListOfMapOfShape &
	:rtype: None
") InsertAfter;
		void InsertAfter (TNaming_ListOfMapOfShape & Other,TNaming_ListIteratorOfListOfMapOfShape & It);
};


%extend TNaming_ListOfMapOfShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TNaming_ListOfNamedShape;
class TNaming_ListOfNamedShape {
	public:
		%feature("compactdefaultargs") TNaming_ListOfNamedShape;
		%feature("autodoc", "	:rtype: None
") TNaming_ListOfNamedShape;
		 TNaming_ListOfNamedShape ();
		%feature("compactdefaultargs") TNaming_ListOfNamedShape;
		%feature("autodoc", "	:param Other:
	:type Other: TNaming_ListOfNamedShape &
	:rtype: None
") TNaming_ListOfNamedShape;
		 TNaming_ListOfNamedShape (const TNaming_ListOfNamedShape & Other);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TNaming_ListOfNamedShape &
	:rtype: None
") Assign;
		void Assign (const TNaming_ListOfNamedShape & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TNaming_ListOfNamedShape &
	:rtype: None
") operator =;
		void operator = (const TNaming_ListOfNamedShape & Other);
		%feature("compactdefaultargs") Extent;
		%feature("autodoc", "	:rtype: int
") Extent;
		Standard_Integer Extent ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param I:
	:type I: Handle_TNaming_NamedShape &
	:rtype: None
") Prepend;
		void Prepend (const Handle_TNaming_NamedShape & I);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param I:
	:type I: Handle_TNaming_NamedShape &
	:param theIt:
	:type theIt: TNaming_ListIteratorOfListOfNamedShape &
	:rtype: None
") Prepend;
		void Prepend (const Handle_TNaming_NamedShape & I,TNaming_ListIteratorOfListOfNamedShape & theIt);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param Other:
	:type Other: TNaming_ListOfNamedShape &
	:rtype: None
") Prepend;
		void Prepend (TNaming_ListOfNamedShape & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param I:
	:type I: Handle_TNaming_NamedShape &
	:rtype: None
") Append;
		void Append (const Handle_TNaming_NamedShape & I);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param I:
	:type I: Handle_TNaming_NamedShape &
	:param theIt:
	:type theIt: TNaming_ListIteratorOfListOfNamedShape &
	:rtype: None
") Append;
		void Append (const Handle_TNaming_NamedShape & I,TNaming_ListIteratorOfListOfNamedShape & theIt);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param Other:
	:type Other: TNaming_ListOfNamedShape &
	:rtype: None
") Append;
		void Append (TNaming_ListOfNamedShape & Other);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: Handle_TNaming_NamedShape
") First;
		Handle_TNaming_NamedShape First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: Handle_TNaming_NamedShape
") Last;
		Handle_TNaming_NamedShape Last ();
		%feature("compactdefaultargs") RemoveFirst;
		%feature("autodoc", "	:rtype: None
") RemoveFirst;
		void RemoveFirst ();
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param It:
	:type It: TNaming_ListIteratorOfListOfNamedShape &
	:rtype: None
") Remove;
		void Remove (TNaming_ListIteratorOfListOfNamedShape & It);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param I:
	:type I: Handle_TNaming_NamedShape &
	:param It:
	:type It: TNaming_ListIteratorOfListOfNamedShape &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Handle_TNaming_NamedShape & I,TNaming_ListIteratorOfListOfNamedShape & It);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Other:
	:type Other: TNaming_ListOfNamedShape &
	:param It:
	:type It: TNaming_ListIteratorOfListOfNamedShape &
	:rtype: None
") InsertBefore;
		void InsertBefore (TNaming_ListOfNamedShape & Other,TNaming_ListIteratorOfListOfNamedShape & It);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param I:
	:type I: Handle_TNaming_NamedShape &
	:param It:
	:type It: TNaming_ListIteratorOfListOfNamedShape &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Handle_TNaming_NamedShape & I,TNaming_ListIteratorOfListOfNamedShape & It);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Other:
	:type Other: TNaming_ListOfNamedShape &
	:param It:
	:type It: TNaming_ListIteratorOfListOfNamedShape &
	:rtype: None
") InsertAfter;
		void InsertAfter (TNaming_ListOfNamedShape & Other,TNaming_ListIteratorOfListOfNamedShape & It);
};


%extend TNaming_ListOfNamedShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TNaming_Localizer;
class TNaming_Localizer {
	public:
		%feature("compactdefaultargs") TNaming_Localizer;
		%feature("autodoc", "	:rtype: None
") TNaming_Localizer;
		 TNaming_Localizer ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param US:
	:type US: Handle_TNaming_UsedShapes &
	:param CurTrans:
	:type CurTrans: int
	:rtype: None
") Init;
		void Init (const Handle_TNaming_UsedShapes & US,const Standard_Integer CurTrans);
		%feature("compactdefaultargs") SubShapes;
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:param Type:
	:type Type: TopAbs_ShapeEnum
	:rtype: TopTools_MapOfShape
") SubShapes;
		const TopTools_MapOfShape & SubShapes (const TopoDS_Shape & S,const TopAbs_ShapeEnum Type);
		%feature("compactdefaultargs") Ancestors;
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:param Type:
	:type Type: TopAbs_ShapeEnum
	:rtype: TopTools_IndexedDataMapOfShapeListOfShape
") Ancestors;
		const TopTools_IndexedDataMapOfShapeListOfShape & Ancestors (const TopoDS_Shape & S,const TopAbs_ShapeEnum Type);
		%feature("compactdefaultargs") FindFeaturesInAncestors;
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:param In:
	:type In: TopoDS_Shape &
	:param AncInFeatures:
	:type AncInFeatures: TopTools_MapOfShape &
	:rtype: None
") FindFeaturesInAncestors;
		void FindFeaturesInAncestors (const TopoDS_Shape & S,const TopoDS_Shape & In,TopTools_MapOfShape & AncInFeatures);
		%feature("compactdefaultargs") GoBack;
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:param Lab:
	:type Lab: TDF_Label &
	:param Evol:
	:type Evol: TNaming_Evolution
	:param OldS:
	:type OldS: TopTools_ListOfShape &
	:param OldLab:
	:type OldLab: TNaming_ListOfNamedShape &
	:rtype: None
") GoBack;
		void GoBack (const TopoDS_Shape & S,const TDF_Label & Lab,const TNaming_Evolution Evol,TopTools_ListOfShape & OldS,TNaming_ListOfNamedShape & OldLab);
		%feature("compactdefaultargs") Backward;
		%feature("autodoc", "	:param NS:
	:type NS: Handle_TNaming_NamedShape &
	:param S:
	:type S: TopoDS_Shape &
	:param Primitives:
	:type Primitives: TNaming_MapOfNamedShape &
	:param ValidShapes:
	:type ValidShapes: TopTools_MapOfShape &
	:rtype: None
") Backward;
		void Backward (const Handle_TNaming_NamedShape & NS,const TopoDS_Shape & S,TNaming_MapOfNamedShape & Primitives,TopTools_MapOfShape & ValidShapes);
		%feature("compactdefaultargs") FindNeighbourg;
		%feature("autodoc", "	:param Cont:
	:type Cont: TopoDS_Shape &
	:param S:
	:type S: TopoDS_Shape &
	:param Neighbourg:
	:type Neighbourg: TopTools_MapOfShape &
	:rtype: None
") FindNeighbourg;
		void FindNeighbourg (const TopoDS_Shape & Cont,const TopoDS_Shape & S,TopTools_MapOfShape & Neighbourg);
		%feature("compactdefaultargs") IsNew;
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:param NS:
	:type NS: Handle_TNaming_NamedShape &
	:rtype: bool
") IsNew;
		static Standard_Boolean IsNew (const TopoDS_Shape & S,const Handle_TNaming_NamedShape & NS);
		%feature("compactdefaultargs") FindGenerator;
		%feature("autodoc", "	:param NS:
	:type NS: Handle_TNaming_NamedShape &
	:param S:
	:type S: TopoDS_Shape &
	:param theListOfGenerators:
	:type theListOfGenerators: TopTools_ListOfShape &
	:rtype: void
") FindGenerator;
		static void FindGenerator (const Handle_TNaming_NamedShape & NS,const TopoDS_Shape & S,TopTools_ListOfShape & theListOfGenerators);
		%feature("compactdefaultargs") FindShapeContext;
		%feature("autodoc", "	* Finds context of the shape <S>.

	:param NS:
	:type NS: Handle_TNaming_NamedShape &
	:param theS:
	:type theS: TopoDS_Shape &
	:param theSC:
	:type theSC: TopoDS_Shape &
	:rtype: void
") FindShapeContext;
		static void FindShapeContext (const Handle_TNaming_NamedShape & NS,const TopoDS_Shape & theS,TopoDS_Shape & theSC);
};


%extend TNaming_Localizer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TNaming_MapIteratorOfMapOfNamedShape;
class TNaming_MapIteratorOfMapOfNamedShape : public TCollection_BasicMapIterator {
	public:
		%feature("compactdefaultargs") TNaming_MapIteratorOfMapOfNamedShape;
		%feature("autodoc", "	:rtype: None
") TNaming_MapIteratorOfMapOfNamedShape;
		 TNaming_MapIteratorOfMapOfNamedShape ();
		%feature("compactdefaultargs") TNaming_MapIteratorOfMapOfNamedShape;
		%feature("autodoc", "	:param aMap:
	:type aMap: TNaming_MapOfNamedShape &
	:rtype: None
") TNaming_MapIteratorOfMapOfNamedShape;
		 TNaming_MapIteratorOfMapOfNamedShape (const TNaming_MapOfNamedShape & aMap);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param aMap:
	:type aMap: TNaming_MapOfNamedShape &
	:rtype: None
") Initialize;
		void Initialize (const TNaming_MapOfNamedShape & aMap);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: Handle_TNaming_NamedShape
") Key;
		Handle_TNaming_NamedShape Key ();
};


%extend TNaming_MapIteratorOfMapOfNamedShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TNaming_MapOfNamedShape;
class TNaming_MapOfNamedShape : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") TNaming_MapOfNamedShape;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") TNaming_MapOfNamedShape;
		 TNaming_MapOfNamedShape (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") TNaming_MapOfNamedShape;
		%feature("autodoc", "	:param Other:
	:type Other: TNaming_MapOfNamedShape &
	:rtype: None
") TNaming_MapOfNamedShape;
		 TNaming_MapOfNamedShape (const TNaming_MapOfNamedShape & Other);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TNaming_MapOfNamedShape &
	:rtype: TNaming_MapOfNamedShape
") Assign;
		TNaming_MapOfNamedShape & Assign (const TNaming_MapOfNamedShape & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TNaming_MapOfNamedShape &
	:rtype: TNaming_MapOfNamedShape
") operator =;
		TNaming_MapOfNamedShape & operator = (const TNaming_MapOfNamedShape & Other);
		%feature("compactdefaultargs") ReSize;
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: int
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	:param aKey:
	:type aKey: Handle_TNaming_NamedShape &
	:rtype: bool
") Add;
		Standard_Boolean Add (const Handle_TNaming_NamedShape & aKey);
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "	:param aKey:
	:type aKey: Handle_TNaming_NamedShape &
	:rtype: bool
") Contains;
		Standard_Boolean Contains (const Handle_TNaming_NamedShape & aKey);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param aKey:
	:type aKey: Handle_TNaming_NamedShape &
	:rtype: bool
") Remove;
		Standard_Boolean Remove (const Handle_TNaming_NamedShape & aKey);
};


%extend TNaming_MapOfNamedShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TNaming_Name;
class TNaming_Name {
	public:
		%feature("compactdefaultargs") TNaming_Name;
		%feature("autodoc", "	:rtype: None
") TNaming_Name;
		 TNaming_Name ();
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "	:param aType:
	:type aType: TNaming_NameType
	:rtype: None
") Type;
		void Type (const TNaming_NameType aType);
		%feature("compactdefaultargs") ShapeType;
		%feature("autodoc", "	:param aType:
	:type aType: TopAbs_ShapeEnum
	:rtype: None
") ShapeType;
		void ShapeType (const TopAbs_ShapeEnum aType);
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "	:param theShape:
	:type theShape: TopoDS_Shape &
	:rtype: None
") Shape;
		void Shape (const TopoDS_Shape & theShape);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param arg:
	:type arg: Handle_TNaming_NamedShape &
	:rtype: None
") Append;
		void Append (const Handle_TNaming_NamedShape & arg);
		%feature("compactdefaultargs") StopNamedShape;
		%feature("autodoc", "	:param arg:
	:type arg: Handle_TNaming_NamedShape &
	:rtype: None
") StopNamedShape;
		void StopNamedShape (const Handle_TNaming_NamedShape & arg);
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "	:param I:
	:type I: int
	:rtype: None
") Index;
		void Index (const Standard_Integer I);
		%feature("compactdefaultargs") ContextLabel;
		%feature("autodoc", "	:param theLab:
	:type theLab: TDF_Label &
	:rtype: None
") ContextLabel;
		void ContextLabel (const TDF_Label & theLab);
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "	:param theOrientation:
	:type theOrientation: TopAbs_Orientation
	:rtype: None
") Orientation;
		void Orientation (const TopAbs_Orientation theOrientation);
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "	:rtype: TNaming_NameType
") Type;
		TNaming_NameType Type ();
		%feature("compactdefaultargs") ShapeType;
		%feature("autodoc", "	:rtype: TopAbs_ShapeEnum
") ShapeType;
		TopAbs_ShapeEnum ShapeType ();
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Shape;
		TopoDS_Shape Shape ();
		%feature("compactdefaultargs") Arguments;
		%feature("autodoc", "	:rtype: TNaming_ListOfNamedShape
") Arguments;
		const TNaming_ListOfNamedShape & Arguments ();
		%feature("compactdefaultargs") StopNamedShape;
		%feature("autodoc", "	:rtype: Handle_TNaming_NamedShape
") StopNamedShape;
		Handle_TNaming_NamedShape StopNamedShape ();
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "	:rtype: int
") Index;
		Standard_Integer Index ();
		%feature("compactdefaultargs") ContextLabel;
		%feature("autodoc", "	:rtype: TDF_Label
") ContextLabel;
		const TDF_Label & ContextLabel ();
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "	:rtype: TopAbs_Orientation
") Orientation;
		TopAbs_Orientation Orientation ();
		%feature("compactdefaultargs") Solve;
		%feature("autodoc", "	:param aLab:
	:type aLab: TDF_Label &
	:param Valid:
	:type Valid: TDF_LabelMap &
	:rtype: bool
") Solve;
		Standard_Boolean Solve (const TDF_Label & aLab,const TDF_LabelMap & Valid);
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param into:
	:type into: TNaming_Name &
	:param RT:
	:type RT: Handle_TDF_RelocationTable &
	:rtype: None
") Paste;
		void Paste (TNaming_Name & into,const Handle_TDF_RelocationTable & RT);
};


%extend TNaming_Name {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TNaming_NamedShape;
class TNaming_NamedShape : public TDF_Attribute {
	public:
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "	* class method ============ Returns the GUID for named shapes.

	:rtype: Standard_GUID
") GetID;
		static const Standard_GUID & GetID ();
		%feature("compactdefaultargs") TNaming_NamedShape;
		%feature("autodoc", "	:rtype: None
") TNaming_NamedShape;
		 TNaming_NamedShape ();
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "	* Returns the shapes contained in <NS>. Returns a null shape if IsEmpty.

	:rtype: TopoDS_Shape
") Get;
		TopoDS_Shape Get ();
		%feature("compactdefaultargs") Evolution;
		%feature("autodoc", "	* Returns the Evolution of the attribute.

	:rtype: TNaming_Evolution
") Evolution;
		TNaming_Evolution Evolution ();
		%feature("compactdefaultargs") Version;
		%feature("autodoc", "	* Returns the Version of the attribute.

	:rtype: int
") Version;
		Standard_Integer Version ();
		%feature("compactdefaultargs") SetVersion;
		%feature("autodoc", "	* Set the Version of the attribute.

	:param version:
	:type version: int
	:rtype: None
") SetVersion;
		void SetVersion (const Standard_Integer version);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "	* Returns the ID of the attribute.

	:rtype: Standard_GUID
") ID;
		const Standard_GUID & ID ();
		%feature("compactdefaultargs") BackupCopy;
		%feature("autodoc", "	* Copies the attribute contents into a new other attribute. It is used by Backup().

	:rtype: Handle_TDF_Attribute
") BackupCopy;
		virtual Handle_TDF_Attribute BackupCopy ();
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "	* Restores the contents from <anAttribute> into this one. It is used when aborting a transaction.

	:param anAttribute:
	:type anAttribute: Handle_TDF_Attribute &
	:rtype: void
") Restore;
		virtual void Restore (const Handle_TDF_Attribute & anAttribute);
		%feature("compactdefaultargs") DeltaOnModification;
		%feature("autodoc", "	* Makes a DeltaOnModification between <self> and <anOldAttribute.

	:param anOldAttribute:
	:type anOldAttribute: Handle_TDF_Attribute &
	:rtype: Handle_TDF_DeltaOnModification
") DeltaOnModification;
		virtual Handle_TDF_DeltaOnModification DeltaOnModification (const Handle_TDF_Attribute & anOldAttribute);
		%feature("compactdefaultargs") DeltaOnModification;
		%feature("autodoc", "	* Applies a DeltaOnModification to <self>.

	:param aDelta:
	:type aDelta: Handle_TDF_DeltaOnModification &
	:rtype: void
") DeltaOnModification;
		virtual void DeltaOnModification (const Handle_TDF_DeltaOnModification & aDelta);
		%feature("compactdefaultargs") DeltaOnRemoval;
		%feature("autodoc", "	* Makes a DeltaOnRemoval on <self> because <self> has disappeared from the DS.

	:rtype: Handle_TDF_DeltaOnRemoval
") DeltaOnRemoval;
		virtual Handle_TDF_DeltaOnRemoval DeltaOnRemoval ();
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	* Returns an new empty attribute from the good end type. It is used by the copy algorithm.

	:rtype: Handle_TDF_Attribute
") NewEmpty;
		virtual Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	* This method is different from the 'Copy' one, because it is used when copying an attribute from a source structure into a target structure. This method pastes the current attribute to the label corresponding to the insertor. The pasted attribute may be a brand new one or a new version of the previous one.

	:param intoAttribute:
	:type intoAttribute: Handle_TDF_Attribute &
	:param aRelocTationable:
	:type aRelocTationable: Handle_TDF_RelocationTable &
	:rtype: void
") Paste;
		virtual void Paste (const Handle_TDF_Attribute & intoAttribute,const Handle_TDF_RelocationTable & aRelocTationable);
		%feature("compactdefaultargs") References;
		%feature("autodoc", "	* Adds the directly referenced attributes and labels to <aDataSet>. 'Directly' means we have only to look at the first level of references.

	:param aDataSet:
	:type aDataSet: Handle_TDF_DataSet &
	:rtype: void
") References;
		virtual void References (const Handle_TDF_DataSet & aDataSet);
		%feature("compactdefaultargs") BeforeRemoval;
		%feature("autodoc", "	:rtype: void
") BeforeRemoval;
		virtual void BeforeRemoval ();
		%feature("compactdefaultargs") BeforeUndo;
		%feature("autodoc", "	* Something to do before applying <anAttDelta>

	:param anAttDelta:
	:type anAttDelta: Handle_TDF_AttributeDelta &
	:param forceIt: default value is Standard_False
	:type forceIt: bool
	:rtype: bool
") BeforeUndo;
		virtual Standard_Boolean BeforeUndo (const Handle_TDF_AttributeDelta & anAttDelta,const Standard_Boolean forceIt = Standard_False);
		%feature("compactdefaultargs") AfterUndo;
		%feature("autodoc", "	* Something to do after applying <anAttDelta>.

	:param anAttDelta:
	:type anAttDelta: Handle_TDF_AttributeDelta &
	:param forceIt: default value is Standard_False
	:type forceIt: bool
	:rtype: bool
") AfterUndo;
		virtual Standard_Boolean AfterUndo (const Handle_TDF_AttributeDelta & anAttDelta,const Standard_Boolean forceIt = Standard_False);

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        };


%extend TNaming_NamedShape {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TNaming_NamedShape(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TNaming_NamedShape::Handle_TNaming_NamedShape %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TNaming_NamedShape;
class Handle_TNaming_NamedShape : public Handle_TDF_Attribute {

    public:
        // constructors
        Handle_TNaming_NamedShape();
        Handle_TNaming_NamedShape(const Handle_TNaming_NamedShape &aHandle);
        Handle_TNaming_NamedShape(const TNaming_NamedShape *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TNaming_NamedShape DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TNaming_NamedShape {
    TNaming_NamedShape* _get_reference() {
    return (TNaming_NamedShape*)$self->Access();
    }
};

%extend Handle_TNaming_NamedShape {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TNaming_NamedShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class TNaming_NamedShapeHasher {
	public:
		%feature("compactdefaultargs") HashCode;
		%feature("autodoc", "	:param K:
	:type K: Handle_TNaming_NamedShape &
	:param Upper:
	:type Upper: int
	:rtype: int
") HashCode;
		static Standard_Integer HashCode (const Handle_TNaming_NamedShape & K,const Standard_Integer Upper);
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "	:param K1:
	:type K1: Handle_TNaming_NamedShape &
	:param K2:
	:type K2: Handle_TNaming_NamedShape &
	:rtype: bool
") IsEqual;
		static Standard_Boolean IsEqual (const Handle_TNaming_NamedShape & K1,const Handle_TNaming_NamedShape & K2);
};


%extend TNaming_NamedShapeHasher {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TNaming_Naming;
class TNaming_Naming : public TDF_Attribute {
	public:
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "	* following code from TDesignStd ==============================

	:rtype: Standard_GUID
") GetID;
		static const Standard_GUID & GetID ();
		%feature("compactdefaultargs") Insert;
		%feature("autodoc", "	:param under:
	:type under: TDF_Label &
	:rtype: Handle_TNaming_Naming
") Insert;
		static Handle_TNaming_Naming Insert (const TDF_Label & under);
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "	* Creates a Namimg attribute at label <where> to identify the shape <Selection>. Geometry is Standard_True if we are only interested by the underlying geometry (e.g. setting a constraint). <Context> is used to find neighbours of <S> when required by the naming. If KeepOrientation is True the Selection orientation is taken into account. BNproblem == True points out that Context sub-shapes in DF have orientation differences with Context shape itself. instance method ===============

	:param where:
	:type where: TDF_Label &
	:param Selection:
	:type Selection: TopoDS_Shape &
	:param Context:
	:type Context: TopoDS_Shape &
	:param Geometry: default value is Standard_False
	:type Geometry: bool
	:param KeepOrientation: default value is Standard_False
	:type KeepOrientation: bool
	:param BNproblem: default value is Standard_False
	:type BNproblem: bool
	:rtype: Handle_TNaming_NamedShape
") Name;
		static Handle_TNaming_NamedShape Name (const TDF_Label & where,const TopoDS_Shape & Selection,const TopoDS_Shape & Context,const Standard_Boolean Geometry = Standard_False,const Standard_Boolean KeepOrientation = Standard_False,const Standard_Boolean BNproblem = Standard_False);
		%feature("compactdefaultargs") TNaming_Naming;
		%feature("autodoc", "	:rtype: None
") TNaming_Naming;
		 TNaming_Naming ();
		%feature("compactdefaultargs") IsDefined;
		%feature("autodoc", "	:rtype: bool
") IsDefined;
		Standard_Boolean IsDefined ();
		%feature("compactdefaultargs") GetName;
		%feature("autodoc", "	:rtype: TNaming_Name
") GetName;
		const TNaming_Name & GetName ();
		%feature("compactdefaultargs") ChangeName;
		%feature("autodoc", "	:rtype: TNaming_Name
") ChangeName;
		TNaming_Name & ChangeName ();
		%feature("compactdefaultargs") Regenerate;
		%feature("autodoc", "	* regenerate only the Name associated to me

	:param scope:
	:type scope: TDF_LabelMap &
	:rtype: bool
") Regenerate;
		Standard_Boolean Regenerate (TDF_LabelMap & scope);
		%feature("compactdefaultargs") Solve;
		%feature("autodoc", "	* Regenerate recursively the whole name with scope. If scope is empty it means that all the labels of the framework are valid.

	:param scope:
	:type scope: TDF_LabelMap &
	:rtype: bool
") Solve;
		Standard_Boolean Solve (TDF_LabelMap & scope);
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "	* Deferred methods from TDF_Attribute ===================================

	:rtype: Standard_GUID
") ID;
		virtual const Standard_GUID & ID ();
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: Handle_TDF_Attribute
") NewEmpty;
		Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "	:param With:
	:type With: Handle_TDF_Attribute &
	:rtype: None
") Restore;
		void Restore (const Handle_TDF_Attribute & With);
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Into:
	:type Into: Handle_TDF_Attribute &
	:param RT:
	:type RT: Handle_TDF_RelocationTable &
	:rtype: None
") Paste;
		void Paste (const Handle_TDF_Attribute & Into,const Handle_TDF_RelocationTable & RT);
		%feature("compactdefaultargs") References;
		%feature("autodoc", "	:param aDataSet:
	:type aDataSet: Handle_TDF_DataSet &
	:rtype: void
") References;
		virtual void References (const Handle_TDF_DataSet & aDataSet);

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        		%feature("compactdefaultargs") ExtendedDump;
		%feature("autodoc", "	:param anOS:
	:type anOS: Standard_OStream &
	:param aFilter:
	:type aFilter: TDF_IDFilter &
	:param aMap:
	:type aMap: TDF_AttributeIndexedMap &
	:rtype: void
") ExtendedDump;
		virtual void ExtendedDump (Standard_OStream & anOS,const TDF_IDFilter & aFilter,TDF_AttributeIndexedMap & aMap);
};


%extend TNaming_Naming {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TNaming_Naming(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TNaming_Naming::Handle_TNaming_Naming %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TNaming_Naming;
class Handle_TNaming_Naming : public Handle_TDF_Attribute {

    public:
        // constructors
        Handle_TNaming_Naming();
        Handle_TNaming_Naming(const Handle_TNaming_Naming &aHandle);
        Handle_TNaming_Naming(const TNaming_Naming *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TNaming_Naming DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TNaming_Naming {
    TNaming_Naming* _get_reference() {
    return (TNaming_Naming*)$self->Access();
    }
};

%extend Handle_TNaming_Naming {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TNaming_Naming {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class TNaming_NamingTool {
	public:
		%feature("compactdefaultargs") CurrentShape;
		%feature("autodoc", "	:param Valid:
	:type Valid: TDF_LabelMap &
	:param Forbiden:
	:type Forbiden: TDF_LabelMap &
	:param NS:
	:type NS: Handle_TNaming_NamedShape &
	:param MS:
	:type MS: TopTools_IndexedMapOfShape &
	:rtype: void
") CurrentShape;
		static void CurrentShape (const TDF_LabelMap & Valid,const TDF_LabelMap & Forbiden,const Handle_TNaming_NamedShape & NS,TopTools_IndexedMapOfShape & MS);
		%feature("compactdefaultargs") CurrentShapeFromShape;
		%feature("autodoc", "	:param Valid:
	:type Valid: TDF_LabelMap &
	:param Forbiden:
	:type Forbiden: TDF_LabelMap &
	:param Acces:
	:type Acces: TDF_Label &
	:param S:
	:type S: TopoDS_Shape &
	:param MS:
	:type MS: TopTools_IndexedMapOfShape &
	:rtype: void
") CurrentShapeFromShape;
		static void CurrentShapeFromShape (const TDF_LabelMap & Valid,const TDF_LabelMap & Forbiden,const TDF_Label & Acces,const TopoDS_Shape & S,TopTools_IndexedMapOfShape & MS);
		%feature("compactdefaultargs") BuildDescendants;
		%feature("autodoc", "	:param NS:
	:type NS: Handle_TNaming_NamedShape &
	:param Labels:
	:type Labels: TDF_LabelMap &
	:rtype: void
") BuildDescendants;
		static void BuildDescendants (const Handle_TNaming_NamedShape & NS,TDF_LabelMap & Labels);
};


%extend TNaming_NamingTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TNaming_NewShapeIterator;
class TNaming_NewShapeIterator {
	public:
		%feature("compactdefaultargs") TNaming_NewShapeIterator;
		%feature("autodoc", "	:param aShape:
	:type aShape: TopoDS_Shape &
	:param Transaction:
	:type Transaction: int
	:param access:
	:type access: TDF_Label &
	:rtype: None
") TNaming_NewShapeIterator;
		 TNaming_NewShapeIterator (const TopoDS_Shape & aShape,const Standard_Integer Transaction,const TDF_Label & access);
		%feature("compactdefaultargs") TNaming_NewShapeIterator;
		%feature("autodoc", "	:param aShape:
	:type aShape: TopoDS_Shape &
	:param access:
	:type access: TDF_Label &
	:rtype: None
") TNaming_NewShapeIterator;
		 TNaming_NewShapeIterator (const TopoDS_Shape & aShape,const TDF_Label & access);
		%feature("compactdefaultargs") TNaming_NewShapeIterator;
		%feature("autodoc", "	* Iterates from the current Shape in <anIterator>

	:param anIterator:
	:type anIterator: TNaming_NewShapeIterator &
	:rtype: None
") TNaming_NewShapeIterator;
		 TNaming_NewShapeIterator (const TNaming_NewShapeIterator & anIterator);
		%feature("compactdefaultargs") TNaming_NewShapeIterator;
		%feature("autodoc", "	* Iterates from the current Shape in <anIterator>

	:param anIterator:
	:type anIterator: TNaming_Iterator &
	:rtype: None
") TNaming_NewShapeIterator;
		 TNaming_NewShapeIterator (const TNaming_Iterator & anIterator);
		%feature("compactdefaultargs") More;
		%feature("autodoc", "	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "	:rtype: None
") Next;
		void Next ();
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "	:rtype: TDF_Label
") Label;
		TDF_Label Label ();
		%feature("compactdefaultargs") NamedShape;
		%feature("autodoc", "	:rtype: Handle_TNaming_NamedShape
") NamedShape;
		Handle_TNaming_NamedShape NamedShape ();
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "	* Warning! Can be a Null Shape if a descendant is deleted.

	:rtype: TopoDS_Shape
") Shape;
		const TopoDS_Shape  Shape ();
		%feature("compactdefaultargs") IsModification;
		%feature("autodoc", "	* True if the new shape is a modification (split, fuse,etc...) of the old shape.

	:rtype: bool
") IsModification;
		Standard_Boolean IsModification ();
};


%extend TNaming_NewShapeIterator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TNaming_OldShapeIterator;
class TNaming_OldShapeIterator {
	public:
		%feature("compactdefaultargs") TNaming_OldShapeIterator;
		%feature("autodoc", "	:param aShape:
	:type aShape: TopoDS_Shape &
	:param Transaction:
	:type Transaction: int
	:param access:
	:type access: TDF_Label &
	:rtype: None
") TNaming_OldShapeIterator;
		 TNaming_OldShapeIterator (const TopoDS_Shape & aShape,const Standard_Integer Transaction,const TDF_Label & access);
		%feature("compactdefaultargs") TNaming_OldShapeIterator;
		%feature("autodoc", "	:param aShape:
	:type aShape: TopoDS_Shape &
	:param access:
	:type access: TDF_Label &
	:rtype: None
") TNaming_OldShapeIterator;
		 TNaming_OldShapeIterator (const TopoDS_Shape & aShape,const TDF_Label & access);
		%feature("compactdefaultargs") TNaming_OldShapeIterator;
		%feature("autodoc", "	* Iterates from the current Shape in <anIterator>

	:param anIterator:
	:type anIterator: TNaming_OldShapeIterator &
	:rtype: None
") TNaming_OldShapeIterator;
		 TNaming_OldShapeIterator (const TNaming_OldShapeIterator & anIterator);
		%feature("compactdefaultargs") TNaming_OldShapeIterator;
		%feature("autodoc", "	* Iterates from the current Shape in <anIterator>

	:param anIterator:
	:type anIterator: TNaming_Iterator &
	:rtype: None
") TNaming_OldShapeIterator;
		 TNaming_OldShapeIterator (const TNaming_Iterator & anIterator);
		%feature("compactdefaultargs") More;
		%feature("autodoc", "	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "	:rtype: None
") Next;
		void Next ();
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "	:rtype: TDF_Label
") Label;
		TDF_Label Label ();
		%feature("compactdefaultargs") NamedShape;
		%feature("autodoc", "	:rtype: Handle_TNaming_NamedShape
") NamedShape;
		Handle_TNaming_NamedShape NamedShape ();
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Shape;
		const TopoDS_Shape  Shape ();
		%feature("compactdefaultargs") IsModification;
		%feature("autodoc", "	* True if the new shape is a modification (split, fuse,etc...) of the old shape.

	:rtype: bool
") IsModification;
		Standard_Boolean IsModification ();
};


%extend TNaming_OldShapeIterator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TNaming_RefShape;
class TNaming_RefShape {
	public:
		%feature("compactdefaultargs") TNaming_RefShape;
		%feature("autodoc", "	:rtype: None
") TNaming_RefShape;
		 TNaming_RefShape ();
		%feature("compactdefaultargs") TNaming_RefShape;
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:rtype: None
") TNaming_RefShape;
		 TNaming_RefShape (const TopoDS_Shape & S);
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:rtype: None
") Shape;
		void Shape (const TopoDS_Shape & S);
		%feature("compactdefaultargs") FirstUse;
		%feature("autodoc", "	:param aPtr:
	:type aPtr: TNaming_PtrNode &
	:rtype: None
") FirstUse;
		void FirstUse (const TNaming_PtrNode & aPtr);
		%feature("compactdefaultargs") FirstUse;
		%feature("autodoc", "	:rtype: TNaming_PtrNode
") FirstUse;
		TNaming_PtrNode FirstUse ();
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Shape;
		const TopoDS_Shape  Shape ();
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "	:rtype: TDF_Label
") Label;
		TDF_Label Label ();
		%feature("compactdefaultargs") NamedShape;
		%feature("autodoc", "	:rtype: Handle_TNaming_NamedShape
") NamedShape;
		Handle_TNaming_NamedShape NamedShape ();
};


%extend TNaming_RefShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TNaming_SameShapeIterator;
class TNaming_SameShapeIterator {
	public:
		%feature("compactdefaultargs") TNaming_SameShapeIterator;
		%feature("autodoc", "	:param aShape:
	:type aShape: TopoDS_Shape &
	:param access:
	:type access: TDF_Label &
	:rtype: None
") TNaming_SameShapeIterator;
		 TNaming_SameShapeIterator (const TopoDS_Shape & aShape,const TDF_Label & access);
		%feature("compactdefaultargs") More;
		%feature("autodoc", "	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "	:rtype: None
") Next;
		void Next ();
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "	:rtype: TDF_Label
") Label;
		TDF_Label Label ();
};


%extend TNaming_SameShapeIterator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TNaming_Scope;
class TNaming_Scope {
	public:
		%feature("compactdefaultargs") TNaming_Scope;
		%feature("autodoc", "	* WithValid = False

	:rtype: None
") TNaming_Scope;
		 TNaming_Scope ();
		%feature("compactdefaultargs") TNaming_Scope;
		%feature("autodoc", "	* if <WithValid> the scope is defined by the map. If not on the whole framework.

	:param WithValid:
	:type WithValid: bool
	:rtype: None
") TNaming_Scope;
		 TNaming_Scope (const Standard_Boolean WithValid);
		%feature("compactdefaultargs") TNaming_Scope;
		%feature("autodoc", "	* create a scope with a map. WithValid = True.

	:param valid:
	:type valid: TDF_LabelMap &
	:rtype: None
") TNaming_Scope;
		 TNaming_Scope (TDF_LabelMap & valid);
		%feature("compactdefaultargs") WithValid;
		%feature("autodoc", "	:rtype: bool
") WithValid;
		Standard_Boolean WithValid ();
		%feature("compactdefaultargs") WithValid;
		%feature("autodoc", "	:param mode:
	:type mode: bool
	:rtype: None
") WithValid;
		void WithValid (const Standard_Boolean mode);
		%feature("compactdefaultargs") ClearValid;
		%feature("autodoc", "	:rtype: None
") ClearValid;
		void ClearValid ();
		%feature("compactdefaultargs") Valid;
		%feature("autodoc", "	:param L:
	:type L: TDF_Label &
	:rtype: None
") Valid;
		void Valid (const TDF_Label & L);
		%feature("compactdefaultargs") ValidChildren;
		%feature("autodoc", "	:param L:
	:type L: TDF_Label &
	:param withroot: default value is Standard_True
	:type withroot: bool
	:rtype: None
") ValidChildren;
		void ValidChildren (const TDF_Label & L,const Standard_Boolean withroot = Standard_True);
		%feature("compactdefaultargs") Unvalid;
		%feature("autodoc", "	:param L:
	:type L: TDF_Label &
	:rtype: None
") Unvalid;
		void Unvalid (const TDF_Label & L);
		%feature("compactdefaultargs") UnvalidChildren;
		%feature("autodoc", "	:param L:
	:type L: TDF_Label &
	:param withroot: default value is Standard_True
	:type withroot: bool
	:rtype: None
") UnvalidChildren;
		void UnvalidChildren (const TDF_Label & L,const Standard_Boolean withroot = Standard_True);
		%feature("compactdefaultargs") IsValid;
		%feature("autodoc", "	:param L:
	:type L: TDF_Label &
	:rtype: bool
") IsValid;
		Standard_Boolean IsValid (const TDF_Label & L);
		%feature("compactdefaultargs") GetValid;
		%feature("autodoc", "	:rtype: TDF_LabelMap
") GetValid;
		const TDF_LabelMap & GetValid ();
		%feature("compactdefaultargs") ChangeValid;
		%feature("autodoc", "	:rtype: TDF_LabelMap
") ChangeValid;
		TDF_LabelMap & ChangeValid ();
		%feature("compactdefaultargs") CurrentShape;
		%feature("autodoc", "	* Returns the current value of <NS> according to the Valid Scope.

	:param NS:
	:type NS: Handle_TNaming_NamedShape &
	:rtype: TopoDS_Shape
") CurrentShape;
		TopoDS_Shape CurrentShape (const Handle_TNaming_NamedShape & NS);
};


%extend TNaming_Scope {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class TNaming_Selector {
	public:
		%feature("compactdefaultargs") IsIdentified;
		%feature("autodoc", "	* To know if a shape is already identified (not selected) ======================================================= //! The label access defines the point of access to the data framework. selection is the shape for which we want to know whether it is identified or not. If true, NS is returned as the identity of selection. If Geometry is true, NS will be the named shape containing the first appearance of selection and not any other shape. In other words, selection must be the only shape stored in NS.

	:param access:
	:type access: TDF_Label &
	:param selection:
	:type selection: TopoDS_Shape &
	:param NS:
	:type NS: Handle_TNaming_NamedShape &
	:param Geometry: default value is Standard_False
	:type Geometry: bool
	:rtype: bool
") IsIdentified;
		static Standard_Boolean IsIdentified (const TDF_Label & access,const TopoDS_Shape & selection,Handle_TNaming_NamedShape & NS,const Standard_Boolean Geometry = Standard_False);
		%feature("compactdefaultargs") TNaming_Selector;
		%feature("autodoc", "	* Create a selector on this label to select a shape. ==================

	:param aLabel:
	:type aLabel: TDF_Label &
	:rtype: None
") TNaming_Selector;
		 TNaming_Selector (const TDF_Label & aLabel);
		%feature("compactdefaultargs") Select;
		%feature("autodoc", "	* Creates a topological naming on the label aLabel given as an argument at construction time. If successful, the shape Selection - found in the shape Context - is now identified in the named shape returned in NamedShape. If Geometry is true, NamedShape contains the first appearance of Selection. This syntax is more robust than the previous syntax for this method.

	:param Selection:
	:type Selection: TopoDS_Shape &
	:param Context:
	:type Context: TopoDS_Shape &
	:param Geometry: default value is Standard_False
	:type Geometry: bool
	:param KeepOrientatation: default value is Standard_False
	:type KeepOrientatation: bool
	:rtype: bool
") Select;
		Standard_Boolean Select (const TopoDS_Shape & Selection,const TopoDS_Shape & Context,const Standard_Boolean Geometry = Standard_False,const Standard_Boolean KeepOrientatation = Standard_False);
		%feature("compactdefaultargs") Select;
		%feature("autodoc", "	* Creates a topological naming on the label aLabel given as an argument at construction time. If successful, the shape Selection is now identified in the named shape returned in NamedShape. If Geometry is true, NamedShape contains the first appearance of Selection.

	:param Selection:
	:type Selection: TopoDS_Shape &
	:param Geometry: default value is Standard_False
	:type Geometry: bool
	:param KeepOrientatation: default value is Standard_False
	:type KeepOrientatation: bool
	:rtype: bool
") Select;
		Standard_Boolean Select (const TopoDS_Shape & Selection,const Standard_Boolean Geometry = Standard_False,const Standard_Boolean KeepOrientatation = Standard_False);
		%feature("compactdefaultargs") Solve;
		%feature("autodoc", "	* Updates the topological naming on the label aLabel given as an argument at construction time. The underlying shape returned in the method NamedShape is updated. To read this shape, use the method TNaming_Tool::GetShape

	:param Valid:
	:type Valid: TDF_LabelMap &
	:rtype: bool
") Solve;
		Standard_Boolean Solve (TDF_LabelMap & Valid);
		%feature("compactdefaultargs") Arguments;
		%feature("autodoc", "	* Returns the attribute list args. This list contains the named shape on which the topological naming was built.

	:param args:
	:type args: TDF_AttributeMap &
	:rtype: None
") Arguments;
		void Arguments (TDF_AttributeMap & args);
		%feature("compactdefaultargs") NamedShape;
		%feature("autodoc", "	* Returns the NamedShape build or under construction, which contains the topological naming..

	:rtype: Handle_TNaming_NamedShape
") NamedShape;
		Handle_TNaming_NamedShape NamedShape ();
};


%extend TNaming_Selector {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TNaming_ShapesSet;
class TNaming_ShapesSet {
	public:
		%feature("compactdefaultargs") TNaming_ShapesSet;
		%feature("autodoc", "	:rtype: None
") TNaming_ShapesSet;
		 TNaming_ShapesSet ();
		%feature("compactdefaultargs") TNaming_ShapesSet;
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:param Type: default value is TopAbs_SHAPE
	:type Type: TopAbs_ShapeEnum
	:rtype: None
") TNaming_ShapesSet;
		 TNaming_ShapesSet (const TopoDS_Shape & S,const TopAbs_ShapeEnum Type = TopAbs_SHAPE);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	* Removes all Shapes

	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* Adds the Shape <S>

	:param S:
	:type S: TopoDS_Shape &
	:rtype: bool
") Add;
		Standard_Boolean Add (const TopoDS_Shape & S);
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "	* Returns True if <S> is in <self>

	:param S:
	:type S: TopoDS_Shape &
	:rtype: bool
") Contains;
		Standard_Boolean Contains (const TopoDS_Shape & S);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	* Removes <S> in <self>.

	:param S:
	:type S: TopoDS_Shape &
	:rtype: bool
") Remove;
		Standard_Boolean Remove (const TopoDS_Shape & S);
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* Adds the shapes contained in <Shapes>.

	:param Shapes:
	:type Shapes: TNaming_ShapesSet &
	:rtype: None
") Add;
		void Add (const TNaming_ShapesSet & Shapes);
		%feature("compactdefaultargs") Filter;
		%feature("autodoc", "	* Erases in <self> the shapes not contained in <Shapes>

	:param Shapes:
	:type Shapes: TNaming_ShapesSet &
	:rtype: None
") Filter;
		void Filter (const TNaming_ShapesSet & Shapes);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	* Removes in <self> the shapes contained in <Shapes>

	:param Shapes:
	:type Shapes: TNaming_ShapesSet &
	:rtype: None
") Remove;
		void Remove (const TNaming_ShapesSet & Shapes);
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") NbShapes;
		%feature("autodoc", "	:rtype: int
") NbShapes;
		Standard_Integer NbShapes ();
		%feature("compactdefaultargs") ChangeMap;
		%feature("autodoc", "	:rtype: TopTools_MapOfShape
") ChangeMap;
		TopTools_MapOfShape & ChangeMap ();
		%feature("compactdefaultargs") Map;
		%feature("autodoc", "	:rtype: TopTools_MapOfShape
") Map;
		const TopTools_MapOfShape & Map ();
};


%extend TNaming_ShapesSet {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TNaming_StdMapNodeOfMapOfNamedShape;
class TNaming_StdMapNodeOfMapOfNamedShape : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") TNaming_StdMapNodeOfMapOfNamedShape;
		%feature("autodoc", "	:param K:
	:type K: Handle_TNaming_NamedShape &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") TNaming_StdMapNodeOfMapOfNamedShape;
		 TNaming_StdMapNodeOfMapOfNamedShape (const Handle_TNaming_NamedShape & K,const TCollection_MapNodePtr & n);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: Handle_TNaming_NamedShape
") Key;
		Handle_TNaming_NamedShape Key ();
};


%extend TNaming_StdMapNodeOfMapOfNamedShape {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TNaming_StdMapNodeOfMapOfNamedShape(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TNaming_StdMapNodeOfMapOfNamedShape::Handle_TNaming_StdMapNodeOfMapOfNamedShape %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TNaming_StdMapNodeOfMapOfNamedShape;
class Handle_TNaming_StdMapNodeOfMapOfNamedShape : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_TNaming_StdMapNodeOfMapOfNamedShape();
        Handle_TNaming_StdMapNodeOfMapOfNamedShape(const Handle_TNaming_StdMapNodeOfMapOfNamedShape &aHandle);
        Handle_TNaming_StdMapNodeOfMapOfNamedShape(const TNaming_StdMapNodeOfMapOfNamedShape *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TNaming_StdMapNodeOfMapOfNamedShape DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TNaming_StdMapNodeOfMapOfNamedShape {
    TNaming_StdMapNodeOfMapOfNamedShape* _get_reference() {
    return (TNaming_StdMapNodeOfMapOfNamedShape*)$self->Access();
    }
};

%extend Handle_TNaming_StdMapNodeOfMapOfNamedShape {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TNaming_StdMapNodeOfMapOfNamedShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class TNaming_Tool {
	public:
		%feature("compactdefaultargs") CurrentShape;
		%feature("autodoc", "	* Returns the last Modification of <NS>. Returns the shape CurrentShape contained in the named shape attribute NS. CurrentShape is the current state of the entities if they have been modified in other attributes of the same data structure. Each call to this function creates a new compound.

	:param NS:
	:type NS: Handle_TNaming_NamedShape &
	:rtype: TopoDS_Shape
") CurrentShape;
		static TopoDS_Shape CurrentShape (const Handle_TNaming_NamedShape & NS);
		%feature("compactdefaultargs") CurrentShape;
		%feature("autodoc", "	* Returns the shape CurrentShape contained in the named shape attribute NS, and present in the updated attribute map Updated. CurrentShape is the current state of the entities if they have been modified in other attributes of the same data structure. Each call to this function creates a new compound. Warning Only the contents of Updated are searched.R

	:param NS:
	:type NS: Handle_TNaming_NamedShape &
	:param Updated:
	:type Updated: TDF_LabelMap &
	:rtype: TopoDS_Shape
") CurrentShape;
		static TopoDS_Shape CurrentShape (const Handle_TNaming_NamedShape & NS,const TDF_LabelMap & Updated);
		%feature("compactdefaultargs") CurrentNamedShape;
		%feature("autodoc", "	* Returns the NamedShape of the last Modification of <NS>. This shape is identified by a label.

	:param NS:
	:type NS: Handle_TNaming_NamedShape &
	:param Updated:
	:type Updated: TDF_LabelMap &
	:rtype: Handle_TNaming_NamedShape
") CurrentNamedShape;
		static Handle_TNaming_NamedShape CurrentNamedShape (const Handle_TNaming_NamedShape & NS,const TDF_LabelMap & Updated);
		%feature("compactdefaultargs") CurrentNamedShape;
		%feature("autodoc", "	* Returns NamedShape the last Modification of <NS>.

	:param NS:
	:type NS: Handle_TNaming_NamedShape &
	:rtype: Handle_TNaming_NamedShape
") CurrentNamedShape;
		static Handle_TNaming_NamedShape CurrentNamedShape (const Handle_TNaming_NamedShape & NS);
		%feature("compactdefaultargs") NamedShape;
		%feature("autodoc", "	* Returns the named shape attribute defined by the shape aShape and the label anAccess. This attribute is returned as a new shape. You call this function, if you need to create a topological attribute for existing data. Example class MyPkg_MyClass { public: Standard_Boolean SameEdge(const Handle_OCafTest_Line& , const Handle_CafTest_Line& ); }; //! Standard_Boolean MyPkg_MyClass::SameEdge (const Handle_OCafTest_Line& L1 const Handle_OCafTest_Line& L2) { Handle_TNaming_NamedShape NS1 = L1->NamedShape(); Handle_TNaming_NamedShape NS2 = L2->NamedShape(); //! return BRepTools::Compare(NS1->Get(),NS2->Get()); } In the example above, the function SameEdge is created to compare the edges having two lines for geometric supports. If these edges are found by BRepTools::Compare to be within the same tolerance, they are considered to be the same. Warning To avoid sharing of names, a SELECTED attribute will not be returned. Sharing of names makes it harder to manage the data structure. When the user of the name is removed, for example, it is difficult to know whether the name should be destroyed.

	:param aShape:
	:type aShape: TopoDS_Shape &
	:param anAcces:
	:type anAcces: TDF_Label &
	:rtype: Handle_TNaming_NamedShape
") NamedShape;
		static Handle_TNaming_NamedShape NamedShape (const TopoDS_Shape & aShape,const TDF_Label & anAcces);
		%feature("compactdefaultargs") GetShape;
		%feature("autodoc", "	* Returns the entities stored in the named shape attribute NS. If there is only one old-new pair, the new shape is returned. Otherwise, a Compound is returned. This compound is made out of all the new shapes found. Each call to this function creates a new compound.

	:param NS:
	:type NS: Handle_TNaming_NamedShape &
	:rtype: TopoDS_Shape
") GetShape;
		static TopoDS_Shape GetShape (const Handle_TNaming_NamedShape & NS);
		%feature("compactdefaultargs") OriginalShape;
		%feature("autodoc", "	* Returns the shape contained as OldShape in <NS>

	:param NS:
	:type NS: Handle_TNaming_NamedShape &
	:rtype: TopoDS_Shape
") OriginalShape;
		static TopoDS_Shape OriginalShape (const Handle_TNaming_NamedShape & NS);
		%feature("compactdefaultargs") GeneratedShape;
		%feature("autodoc", "	* Returns the shape generated from S or by a modification of S and contained in the named shape Generation.

	:param S:
	:type S: TopoDS_Shape &
	:param Generation:
	:type Generation: Handle_TNaming_NamedShape &
	:rtype: TopoDS_Shape
") GeneratedShape;
		static TopoDS_Shape GeneratedShape (const TopoDS_Shape & S,const Handle_TNaming_NamedShape & Generation);
		%feature("compactdefaultargs") Collect;
		%feature("autodoc", "	:param NS:
	:type NS: Handle_TNaming_NamedShape &
	:param Labels:
	:type Labels: TNaming_MapOfNamedShape &
	:param OnlyModif: default value is Standard_True
	:type OnlyModif: bool
	:rtype: void
") Collect;
		static void Collect (const Handle_TNaming_NamedShape & NS,TNaming_MapOfNamedShape & Labels,const Standard_Boolean OnlyModif = Standard_True);
		%feature("compactdefaultargs") HasLabel;
		%feature("autodoc", "	* Returns True if <aShape> appears under a label.(DP)

	:param access:
	:type access: TDF_Label &
	:param aShape:
	:type aShape: TopoDS_Shape &
	:rtype: bool
") HasLabel;
		static Standard_Boolean HasLabel (const TDF_Label & access,const TopoDS_Shape & aShape);
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "	* Returns the label of the first apparition of <aShape>. Transdef is a value of the transaction of the first apparition of <aShape>.

	:param access:
	:type access: TDF_Label &
	:param aShape:
	:type aShape: TopoDS_Shape &
	:param TransDef:
	:type TransDef: int &
	:rtype: TDF_Label
") Label;
		static TDF_Label Label (const TDF_Label & access,const TopoDS_Shape & aShape,Standard_Integer &OutValue);
		%feature("compactdefaultargs") InitialShape;
		%feature("autodoc", "	* Returns the shape created from the shape aShape contained in the attribute anAcces.

	:param aShape:
	:type aShape: TopoDS_Shape &
	:param anAcces:
	:type anAcces: TDF_Label &
	:param Labels:
	:type Labels: TDF_LabelList &
	:rtype: TopoDS_Shape
") InitialShape;
		static TopoDS_Shape InitialShape (const TopoDS_Shape & aShape,const TDF_Label & anAcces,TDF_LabelList & Labels);
		%feature("compactdefaultargs") ValidUntil;
		%feature("autodoc", "	* Returns the last transaction where the creation of S is valid.

	:param access:
	:type access: TDF_Label &
	:param S:
	:type S: TopoDS_Shape &
	:rtype: int
") ValidUntil;
		static Standard_Integer ValidUntil (const TDF_Label & access,const TopoDS_Shape & S);
		%feature("compactdefaultargs") FindShape;
		%feature("autodoc", "	* Returns the current shape (a Wire or a Shell) built (in the data framework) from the the shapes of the argument named shape. It is used for IDENTITY name type computation.

	:param Valid:
	:type Valid: TDF_LabelMap &
	:param Forbiden:
	:type Forbiden: TDF_LabelMap &
	:param Arg:
	:type Arg: Handle_TNaming_NamedShape &
	:param S:
	:type S: TopoDS_Shape &
	:rtype: void
") FindShape;
		static void FindShape (const TDF_LabelMap & Valid,const TDF_LabelMap & Forbiden,const Handle_TNaming_NamedShape & Arg,TopoDS_Shape & S);
};


%extend TNaming_Tool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TNaming_TranslateTool;
class TNaming_TranslateTool : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	:param S1:
	:type S1: TopoDS_Shape &
	:param S2:
	:type S2: TopoDS_Shape &
	:rtype: None
") Add;
		void Add (TopoDS_Shape & S1,const TopoDS_Shape & S2);
		%feature("compactdefaultargs") MakeVertex;
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:rtype: None
") MakeVertex;
		void MakeVertex (TopoDS_Shape & S);
		%feature("compactdefaultargs") MakeEdge;
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:rtype: None
") MakeEdge;
		void MakeEdge (TopoDS_Shape & S);
		%feature("compactdefaultargs") MakeWire;
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:rtype: None
") MakeWire;
		void MakeWire (TopoDS_Shape & S);
		%feature("compactdefaultargs") MakeFace;
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:rtype: None
") MakeFace;
		void MakeFace (TopoDS_Shape & S);
		%feature("compactdefaultargs") MakeShell;
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:rtype: None
") MakeShell;
		void MakeShell (TopoDS_Shape & S);
		%feature("compactdefaultargs") MakeSolid;
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:rtype: None
") MakeSolid;
		void MakeSolid (TopoDS_Shape & S);
		%feature("compactdefaultargs") MakeCompSolid;
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:rtype: None
") MakeCompSolid;
		void MakeCompSolid (TopoDS_Shape & S);
		%feature("compactdefaultargs") MakeCompound;
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:rtype: None
") MakeCompound;
		void MakeCompound (TopoDS_Shape & S);
		%feature("compactdefaultargs") UpdateVertex;
		%feature("autodoc", "	:param S1:
	:type S1: TopoDS_Shape &
	:param S2:
	:type S2: TopoDS_Shape &
	:param M:
	:type M: TColStd_IndexedDataMapOfTransientTransient &
	:rtype: None
") UpdateVertex;
		void UpdateVertex (const TopoDS_Shape & S1,TopoDS_Shape & S2,TColStd_IndexedDataMapOfTransientTransient & M);
		%feature("compactdefaultargs") UpdateEdge;
		%feature("autodoc", "	:param S1:
	:type S1: TopoDS_Shape &
	:param S2:
	:type S2: TopoDS_Shape &
	:param M:
	:type M: TColStd_IndexedDataMapOfTransientTransient &
	:rtype: None
") UpdateEdge;
		void UpdateEdge (const TopoDS_Shape & S1,TopoDS_Shape & S2,TColStd_IndexedDataMapOfTransientTransient & M);
		%feature("compactdefaultargs") UpdateFace;
		%feature("autodoc", "	:param S1:
	:type S1: TopoDS_Shape &
	:param S2:
	:type S2: TopoDS_Shape &
	:param M:
	:type M: TColStd_IndexedDataMapOfTransientTransient &
	:rtype: None
") UpdateFace;
		void UpdateFace (const TopoDS_Shape & S1,TopoDS_Shape & S2,TColStd_IndexedDataMapOfTransientTransient & M);
		%feature("compactdefaultargs") UpdateShape;
		%feature("autodoc", "	:param S1:
	:type S1: TopoDS_Shape &
	:param S2:
	:type S2: TopoDS_Shape &
	:rtype: None
") UpdateShape;
		void UpdateShape (const TopoDS_Shape & S1,TopoDS_Shape & S2);
};


%extend TNaming_TranslateTool {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TNaming_TranslateTool(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TNaming_TranslateTool::Handle_TNaming_TranslateTool %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TNaming_TranslateTool;
class Handle_TNaming_TranslateTool : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_TNaming_TranslateTool();
        Handle_TNaming_TranslateTool(const Handle_TNaming_TranslateTool &aHandle);
        Handle_TNaming_TranslateTool(const TNaming_TranslateTool *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TNaming_TranslateTool DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TNaming_TranslateTool {
    TNaming_TranslateTool* _get_reference() {
    return (TNaming_TranslateTool*)$self->Access();
    }
};

%extend Handle_TNaming_TranslateTool {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TNaming_TranslateTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TNaming_Translator;
class TNaming_Translator {
	public:
		%feature("compactdefaultargs") TNaming_Translator;
		%feature("autodoc", "	:rtype: None
") TNaming_Translator;
		 TNaming_Translator ();
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	:param aShape:
	:type aShape: TopoDS_Shape &
	:rtype: None
") Add;
		void Add (const TopoDS_Shape & aShape);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:rtype: None
") Perform;
		void Perform ();
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") Copied;
		%feature("autodoc", "	* returns copied shape

	:param aShape:
	:type aShape: TopoDS_Shape &
	:rtype: TopoDS_Shape
") Copied;
		const TopoDS_Shape Copied (const TopoDS_Shape & aShape);
		%feature("compactdefaultargs") Copied;
		%feature("autodoc", "	* returns DataMap of results; (shape <-> copied shape)

	:rtype: TopTools_DataMapOfShapeShape
") Copied;
		const TopTools_DataMapOfShapeShape & Copied ();
		%feature("compactdefaultargs") DumpMap;
		%feature("autodoc", "	:param isWrite: default value is Standard_False
	:type isWrite: bool
	:rtype: None
") DumpMap;
		void DumpMap (const Standard_Boolean isWrite = Standard_False);
};


%extend TNaming_Translator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TNaming_UsedShapes;
class TNaming_UsedShapes : public TDF_Attribute {
	public:
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("compactdefaultargs") Map;
		%feature("autodoc", "	:rtype: TNaming_DataMapOfShapePtrRefShape
") Map;
		TNaming_DataMapOfShapePtrRefShape & Map ();
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "	* Returns the ID of the attribute.

	:rtype: Standard_GUID
") ID;
		const Standard_GUID & ID ();
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "	* Returns the ID: 2a96b614-ec8b-11d0-bee7-080009dc3333.

	:rtype: Standard_GUID
") GetID;
		static const Standard_GUID & GetID ();
		%feature("compactdefaultargs") BackupCopy;
		%feature("autodoc", "	* Copies the attribute contents into a new other attribute. It is used by Backup().

	:rtype: Handle_TDF_Attribute
") BackupCopy;
		virtual Handle_TDF_Attribute BackupCopy ();
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "	* Restores the contents from <anAttribute> into this one. It is used when aborting a transaction.

	:param anAttribute:
	:type anAttribute: Handle_TDF_Attribute &
	:rtype: void
") Restore;
		virtual void Restore (const Handle_TDF_Attribute & anAttribute);
		%feature("compactdefaultargs") BeforeRemoval;
		%feature("autodoc", "	* Clears the table.

	:rtype: void
") BeforeRemoval;
		virtual void BeforeRemoval ();
		%feature("compactdefaultargs") AfterUndo;
		%feature("autodoc", "	* Something to do after applying <anAttDelta>.

	:param anAttDelta:
	:type anAttDelta: Handle_TDF_AttributeDelta &
	:param forceIt: default value is Standard_False
	:type forceIt: bool
	:rtype: bool
") AfterUndo;
		virtual Standard_Boolean AfterUndo (const Handle_TDF_AttributeDelta & anAttDelta,const Standard_Boolean forceIt = Standard_False);
		%feature("compactdefaultargs") DeltaOnAddition;
		%feature("autodoc", "	* this method returns a null handle (no delta).

	:rtype: Handle_TDF_DeltaOnAddition
") DeltaOnAddition;
		virtual Handle_TDF_DeltaOnAddition DeltaOnAddition ();
		%feature("compactdefaultargs") DeltaOnRemoval;
		%feature("autodoc", "	* this method returns a null handle (no delta).

	:rtype: Handle_TDF_DeltaOnRemoval
") DeltaOnRemoval;
		virtual Handle_TDF_DeltaOnRemoval DeltaOnRemoval ();
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	* Returns an new empty attribute from the good end type. It is used by the copy algorithm.

	:rtype: Handle_TDF_Attribute
") NewEmpty;
		virtual Handle_TDF_Attribute NewEmpty ();
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	* This method is different from the 'Copy' one, because it is used when copying an attribute from a source structure into a target structure. This method pastes the current attribute to the label corresponding to the insertor. The pasted attribute may be a brand new one or a new version of the previous one.

	:param intoAttribute:
	:type intoAttribute: Handle_TDF_Attribute &
	:param aRelocTationable:
	:type aRelocTationable: Handle_TDF_RelocationTable &
	:rtype: void
") Paste;
		virtual void Paste (const Handle_TDF_Attribute & intoAttribute,const Handle_TDF_RelocationTable & aRelocTationable);
		%feature("compactdefaultargs") References;
		%feature("autodoc", "	* Adds the directly referenced attributes and labels to <aDataSet>. 'Directly' means we have only to look at the first level of references. //! For this, use only the AddLabel() & AddAttribute() from DataSet and do not try to modify information previously stored in <aDataSet>.

	:param aDataSet:
	:type aDataSet: Handle_TDF_DataSet &
	:rtype: void
") References;
		virtual void References (const Handle_TDF_DataSet & aDataSet);

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        };


%extend TNaming_UsedShapes {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TNaming_UsedShapes(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TNaming_UsedShapes::Handle_TNaming_UsedShapes %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_TNaming_UsedShapes;
class Handle_TNaming_UsedShapes : public Handle_TDF_Attribute {

    public:
        // constructors
        Handle_TNaming_UsedShapes();
        Handle_TNaming_UsedShapes(const Handle_TNaming_UsedShapes &aHandle);
        Handle_TNaming_UsedShapes(const TNaming_UsedShapes *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TNaming_UsedShapes DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TNaming_UsedShapes {
    TNaming_UsedShapes* _get_reference() {
    return (TNaming_UsedShapes*)$self->Access();
    }
};

%extend Handle_TNaming_UsedShapes {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TNaming_UsedShapes {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
