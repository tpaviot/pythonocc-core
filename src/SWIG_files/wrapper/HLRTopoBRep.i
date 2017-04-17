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
%module (package="OCC") HLRTopoBRep

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


%include HLRTopoBRep_headers.i


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
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

class HLRTopoBRep_DSFiller {
	public:
		%feature("compactdefaultargs") Insert;
		%feature("autodoc", "	* Stores in <DS> the outlines of <S> using the current outliner and stores the isolines in <DS> using a Hatcher.

	:param S:
	:type S: TopoDS_Shape &
	:param FO:
	:type FO: Contap_Contour &
	:param DS:
	:type DS: HLRTopoBRep_Data &
	:param MST:
	:type MST: BRepTopAdaptor_MapOfShapeTool &
	:param nbIso:
	:type nbIso: int
	:rtype: void
") Insert;
		static void Insert (const TopoDS_Shape & S,Contap_Contour & FO,HLRTopoBRep_Data & DS,BRepTopAdaptor_MapOfShapeTool & MST,const Standard_Integer nbIso);
};


%extend HLRTopoBRep_DSFiller {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor HLRTopoBRep_Data;
class HLRTopoBRep_Data {
	public:
		%feature("compactdefaultargs") HLRTopoBRep_Data;
		%feature("autodoc", "	:rtype: None
") HLRTopoBRep_Data;
		 HLRTopoBRep_Data ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	* Clear of all the maps.

	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Clean;
		%feature("autodoc", "	* Clear of all the data not needed during and after the hiding process.

	:rtype: None
") Clean;
		void Clean ();
		%feature("compactdefaultargs") EdgeHasSplE;
		%feature("autodoc", "	* Returns True if the Edge is split.

	:param E:
	:type E: TopoDS_Edge &
	:rtype: bool
") EdgeHasSplE;
		Standard_Boolean EdgeHasSplE (const TopoDS_Edge & E);
		%feature("compactdefaultargs") FaceHasIntL;
		%feature("autodoc", "	* Returns True if the Face has internal outline.

	:param F:
	:type F: TopoDS_Face &
	:rtype: bool
") FaceHasIntL;
		Standard_Boolean FaceHasIntL (const TopoDS_Face & F);
		%feature("compactdefaultargs") FaceHasOutL;
		%feature("autodoc", "	* Returns True if the Face has outlines on restriction.

	:param F:
	:type F: TopoDS_Face &
	:rtype: bool
") FaceHasOutL;
		Standard_Boolean FaceHasOutL (const TopoDS_Face & F);
		%feature("compactdefaultargs") FaceHasIsoL;
		%feature("autodoc", "	* Returns True if the Face has isolines.

	:param F:
	:type F: TopoDS_Face &
	:rtype: bool
") FaceHasIsoL;
		Standard_Boolean FaceHasIsoL (const TopoDS_Face & F);
		%feature("compactdefaultargs") IsSplEEdgeEdge;
		%feature("autodoc", "	:param E1:
	:type E1: TopoDS_Edge &
	:param E2:
	:type E2: TopoDS_Edge &
	:rtype: bool
") IsSplEEdgeEdge;
		Standard_Boolean IsSplEEdgeEdge (const TopoDS_Edge & E1,const TopoDS_Edge & E2);
		%feature("compactdefaultargs") IsIntLFaceEdge;
		%feature("autodoc", "	:param F:
	:type F: TopoDS_Face &
	:param E:
	:type E: TopoDS_Edge &
	:rtype: bool
") IsIntLFaceEdge;
		Standard_Boolean IsIntLFaceEdge (const TopoDS_Face & F,const TopoDS_Edge & E);
		%feature("compactdefaultargs") IsOutLFaceEdge;
		%feature("autodoc", "	:param F:
	:type F: TopoDS_Face &
	:param E:
	:type E: TopoDS_Edge &
	:rtype: bool
") IsOutLFaceEdge;
		Standard_Boolean IsOutLFaceEdge (const TopoDS_Face & F,const TopoDS_Edge & E);
		%feature("compactdefaultargs") IsIsoLFaceEdge;
		%feature("autodoc", "	:param F:
	:type F: TopoDS_Face &
	:param E:
	:type E: TopoDS_Edge &
	:rtype: bool
") IsIsoLFaceEdge;
		Standard_Boolean IsIsoLFaceEdge (const TopoDS_Face & F,const TopoDS_Edge & E);
		%feature("compactdefaultargs") NewSOldS;
		%feature("autodoc", "	:param New:
	:type New: TopoDS_Shape &
	:rtype: TopoDS_Shape
") NewSOldS;
		TopoDS_Shape NewSOldS (const TopoDS_Shape & New);
		%feature("compactdefaultargs") EdgeSplE;
		%feature("autodoc", "	* Returns the list of the edges.

	:param E:
	:type E: TopoDS_Edge &
	:rtype: TopTools_ListOfShape
") EdgeSplE;
		const TopTools_ListOfShape & EdgeSplE (const TopoDS_Edge & E);
		%feature("compactdefaultargs") FaceIntL;
		%feature("autodoc", "	* Returns the list of the internal OutLines.

	:param F:
	:type F: TopoDS_Face &
	:rtype: TopTools_ListOfShape
") FaceIntL;
		const TopTools_ListOfShape & FaceIntL (const TopoDS_Face & F);
		%feature("compactdefaultargs") FaceOutL;
		%feature("autodoc", "	* Returns the list of the OutLines on restriction.

	:param F:
	:type F: TopoDS_Face &
	:rtype: TopTools_ListOfShape
") FaceOutL;
		const TopTools_ListOfShape & FaceOutL (const TopoDS_Face & F);
		%feature("compactdefaultargs") FaceIsoL;
		%feature("autodoc", "	* Returns the list of the IsoLines.

	:param F:
	:type F: TopoDS_Face &
	:rtype: TopTools_ListOfShape
") FaceIsoL;
		const TopTools_ListOfShape & FaceIsoL (const TopoDS_Face & F);
		%feature("compactdefaultargs") IsOutV;
		%feature("autodoc", "	* Returns True if V is an outline vertex on a restriction.

	:param V:
	:type V: TopoDS_Vertex &
	:rtype: bool
") IsOutV;
		Standard_Boolean IsOutV (const TopoDS_Vertex & V);
		%feature("compactdefaultargs") IsIntV;
		%feature("autodoc", "	* Returns True if V is an internal outline vertex.

	:param V:
	:type V: TopoDS_Vertex &
	:rtype: bool
") IsIntV;
		Standard_Boolean IsIntV (const TopoDS_Vertex & V);
		%feature("compactdefaultargs") AddOldS;
		%feature("autodoc", "	:param NewS:
	:type NewS: TopoDS_Shape &
	:param OldS:
	:type OldS: TopoDS_Shape &
	:rtype: None
") AddOldS;
		void AddOldS (const TopoDS_Shape & NewS,const TopoDS_Shape & OldS);
		%feature("compactdefaultargs") AddSplE;
		%feature("autodoc", "	:param E:
	:type E: TopoDS_Edge &
	:rtype: TopTools_ListOfShape
") AddSplE;
		TopTools_ListOfShape & AddSplE (const TopoDS_Edge & E);
		%feature("compactdefaultargs") AddIntL;
		%feature("autodoc", "	:param F:
	:type F: TopoDS_Face &
	:rtype: TopTools_ListOfShape
") AddIntL;
		TopTools_ListOfShape & AddIntL (const TopoDS_Face & F);
		%feature("compactdefaultargs") AddOutL;
		%feature("autodoc", "	:param F:
	:type F: TopoDS_Face &
	:rtype: TopTools_ListOfShape
") AddOutL;
		TopTools_ListOfShape & AddOutL (const TopoDS_Face & F);
		%feature("compactdefaultargs") AddIsoL;
		%feature("autodoc", "	:param F:
	:type F: TopoDS_Face &
	:rtype: TopTools_ListOfShape
") AddIsoL;
		TopTools_ListOfShape & AddIsoL (const TopoDS_Face & F);
		%feature("compactdefaultargs") AddOutV;
		%feature("autodoc", "	:param V:
	:type V: TopoDS_Vertex &
	:rtype: None
") AddOutV;
		void AddOutV (const TopoDS_Vertex & V);
		%feature("compactdefaultargs") AddIntV;
		%feature("autodoc", "	:param V:
	:type V: TopoDS_Vertex &
	:rtype: None
") AddIntV;
		void AddIntV (const TopoDS_Vertex & V);
		%feature("compactdefaultargs") InitEdge;
		%feature("autodoc", "	:rtype: None
") InitEdge;
		void InitEdge ();
		%feature("compactdefaultargs") MoreEdge;
		%feature("autodoc", "	:rtype: bool
") MoreEdge;
		Standard_Boolean MoreEdge ();
		%feature("compactdefaultargs") NextEdge;
		%feature("autodoc", "	:rtype: None
") NextEdge;
		void NextEdge ();
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "	:rtype: TopoDS_Edge
") Edge;
		const TopoDS_Edge  Edge ();
		%feature("compactdefaultargs") InitVertex;
		%feature("autodoc", "	* Start an iteration on the vertices of E.

	:param E:
	:type E: TopoDS_Edge &
	:rtype: None
") InitVertex;
		void InitVertex (const TopoDS_Edge & E);
		%feature("compactdefaultargs") MoreVertex;
		%feature("autodoc", "	:rtype: bool
") MoreVertex;
		Standard_Boolean MoreVertex ();
		%feature("compactdefaultargs") NextVertex;
		%feature("autodoc", "	:rtype: None
") NextVertex;
		void NextVertex ();
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "	:rtype: TopoDS_Vertex
") Vertex;
		const TopoDS_Vertex  Vertex ();
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "	:rtype: float
") Parameter;
		Standard_Real Parameter ();
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	* Insert before the current position.

	:param V:
	:type V: TopoDS_Vertex &
	:param P:
	:type P: float
	:rtype: None
") InsertBefore;
		void InsertBefore (const TopoDS_Vertex & V,const Standard_Real P);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param V:
	:type V: TopoDS_Vertex &
	:param P:
	:type P: float
	:rtype: None
") Append;
		void Append (const TopoDS_Vertex & V,const Standard_Real P);
};


%extend HLRTopoBRep_Data {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor HLRTopoBRep_DataMapIteratorOfDataMapOfShapeFaceData;
class HLRTopoBRep_DataMapIteratorOfDataMapOfShapeFaceData : public TCollection_BasicMapIterator {
	public:
		%feature("compactdefaultargs") HLRTopoBRep_DataMapIteratorOfDataMapOfShapeFaceData;
		%feature("autodoc", "	:rtype: None
") HLRTopoBRep_DataMapIteratorOfDataMapOfShapeFaceData;
		 HLRTopoBRep_DataMapIteratorOfDataMapOfShapeFaceData ();
		%feature("compactdefaultargs") HLRTopoBRep_DataMapIteratorOfDataMapOfShapeFaceData;
		%feature("autodoc", "	:param aMap:
	:type aMap: HLRTopoBRep_DataMapOfShapeFaceData &
	:rtype: None
") HLRTopoBRep_DataMapIteratorOfDataMapOfShapeFaceData;
		 HLRTopoBRep_DataMapIteratorOfDataMapOfShapeFaceData (const HLRTopoBRep_DataMapOfShapeFaceData & aMap);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param aMap:
	:type aMap: HLRTopoBRep_DataMapOfShapeFaceData &
	:rtype: None
") Initialize;
		void Initialize (const HLRTopoBRep_DataMapOfShapeFaceData & aMap);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Key;
		const TopoDS_Shape  Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: HLRTopoBRep_FaceData
") Value;
		const HLRTopoBRep_FaceData & Value ();
};


%extend HLRTopoBRep_DataMapIteratorOfDataMapOfShapeFaceData {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor HLRTopoBRep_DataMapIteratorOfMapOfShapeListOfVData;
class HLRTopoBRep_DataMapIteratorOfMapOfShapeListOfVData : public TCollection_BasicMapIterator {
	public:
		%feature("compactdefaultargs") HLRTopoBRep_DataMapIteratorOfMapOfShapeListOfVData;
		%feature("autodoc", "	:rtype: None
") HLRTopoBRep_DataMapIteratorOfMapOfShapeListOfVData;
		 HLRTopoBRep_DataMapIteratorOfMapOfShapeListOfVData ();
		%feature("compactdefaultargs") HLRTopoBRep_DataMapIteratorOfMapOfShapeListOfVData;
		%feature("autodoc", "	:param aMap:
	:type aMap: HLRTopoBRep_MapOfShapeListOfVData &
	:rtype: None
") HLRTopoBRep_DataMapIteratorOfMapOfShapeListOfVData;
		 HLRTopoBRep_DataMapIteratorOfMapOfShapeListOfVData (const HLRTopoBRep_MapOfShapeListOfVData & aMap);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param aMap:
	:type aMap: HLRTopoBRep_MapOfShapeListOfVData &
	:rtype: None
") Initialize;
		void Initialize (const HLRTopoBRep_MapOfShapeListOfVData & aMap);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Key;
		const TopoDS_Shape  Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: HLRTopoBRep_ListOfVData
") Value;
		const HLRTopoBRep_ListOfVData & Value ();
};


%extend HLRTopoBRep_DataMapIteratorOfMapOfShapeListOfVData {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor HLRTopoBRep_DataMapNodeOfDataMapOfShapeFaceData;
class HLRTopoBRep_DataMapNodeOfDataMapOfShapeFaceData : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") HLRTopoBRep_DataMapNodeOfDataMapOfShapeFaceData;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:param I:
	:type I: HLRTopoBRep_FaceData &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") HLRTopoBRep_DataMapNodeOfDataMapOfShapeFaceData;
		 HLRTopoBRep_DataMapNodeOfDataMapOfShapeFaceData (const TopoDS_Shape & K,const HLRTopoBRep_FaceData & I,const TCollection_MapNodePtr & n);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Key;
		TopoDS_Shape  Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: HLRTopoBRep_FaceData
") Value;
		HLRTopoBRep_FaceData & Value ();
};


%extend HLRTopoBRep_DataMapNodeOfDataMapOfShapeFaceData {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_HLRTopoBRep_DataMapNodeOfDataMapOfShapeFaceData(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_HLRTopoBRep_DataMapNodeOfDataMapOfShapeFaceData::Handle_HLRTopoBRep_DataMapNodeOfDataMapOfShapeFaceData %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_HLRTopoBRep_DataMapNodeOfDataMapOfShapeFaceData;
class Handle_HLRTopoBRep_DataMapNodeOfDataMapOfShapeFaceData : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_HLRTopoBRep_DataMapNodeOfDataMapOfShapeFaceData();
        Handle_HLRTopoBRep_DataMapNodeOfDataMapOfShapeFaceData(const Handle_HLRTopoBRep_DataMapNodeOfDataMapOfShapeFaceData &aHandle);
        Handle_HLRTopoBRep_DataMapNodeOfDataMapOfShapeFaceData(const HLRTopoBRep_DataMapNodeOfDataMapOfShapeFaceData *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_HLRTopoBRep_DataMapNodeOfDataMapOfShapeFaceData DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_HLRTopoBRep_DataMapNodeOfDataMapOfShapeFaceData {
    HLRTopoBRep_DataMapNodeOfDataMapOfShapeFaceData* _get_reference() {
    return (HLRTopoBRep_DataMapNodeOfDataMapOfShapeFaceData*)$self->Access();
    }
};

%extend Handle_HLRTopoBRep_DataMapNodeOfDataMapOfShapeFaceData {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend HLRTopoBRep_DataMapNodeOfDataMapOfShapeFaceData {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor HLRTopoBRep_DataMapNodeOfMapOfShapeListOfVData;
class HLRTopoBRep_DataMapNodeOfMapOfShapeListOfVData : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") HLRTopoBRep_DataMapNodeOfMapOfShapeListOfVData;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:param I:
	:type I: HLRTopoBRep_ListOfVData &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") HLRTopoBRep_DataMapNodeOfMapOfShapeListOfVData;
		 HLRTopoBRep_DataMapNodeOfMapOfShapeListOfVData (const TopoDS_Shape & K,const HLRTopoBRep_ListOfVData & I,const TCollection_MapNodePtr & n);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Key;
		TopoDS_Shape  Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: HLRTopoBRep_ListOfVData
") Value;
		HLRTopoBRep_ListOfVData & Value ();
};


%extend HLRTopoBRep_DataMapNodeOfMapOfShapeListOfVData {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_HLRTopoBRep_DataMapNodeOfMapOfShapeListOfVData(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_HLRTopoBRep_DataMapNodeOfMapOfShapeListOfVData::Handle_HLRTopoBRep_DataMapNodeOfMapOfShapeListOfVData %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_HLRTopoBRep_DataMapNodeOfMapOfShapeListOfVData;
class Handle_HLRTopoBRep_DataMapNodeOfMapOfShapeListOfVData : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_HLRTopoBRep_DataMapNodeOfMapOfShapeListOfVData();
        Handle_HLRTopoBRep_DataMapNodeOfMapOfShapeListOfVData(const Handle_HLRTopoBRep_DataMapNodeOfMapOfShapeListOfVData &aHandle);
        Handle_HLRTopoBRep_DataMapNodeOfMapOfShapeListOfVData(const HLRTopoBRep_DataMapNodeOfMapOfShapeListOfVData *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_HLRTopoBRep_DataMapNodeOfMapOfShapeListOfVData DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_HLRTopoBRep_DataMapNodeOfMapOfShapeListOfVData {
    HLRTopoBRep_DataMapNodeOfMapOfShapeListOfVData* _get_reference() {
    return (HLRTopoBRep_DataMapNodeOfMapOfShapeListOfVData*)$self->Access();
    }
};

%extend Handle_HLRTopoBRep_DataMapNodeOfMapOfShapeListOfVData {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend HLRTopoBRep_DataMapNodeOfMapOfShapeListOfVData {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor HLRTopoBRep_DataMapOfShapeFaceData;
class HLRTopoBRep_DataMapOfShapeFaceData : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") HLRTopoBRep_DataMapOfShapeFaceData;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") HLRTopoBRep_DataMapOfShapeFaceData;
		 HLRTopoBRep_DataMapOfShapeFaceData (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: HLRTopoBRep_DataMapOfShapeFaceData &
	:rtype: HLRTopoBRep_DataMapOfShapeFaceData
") Assign;
		HLRTopoBRep_DataMapOfShapeFaceData & Assign (const HLRTopoBRep_DataMapOfShapeFaceData & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: HLRTopoBRep_DataMapOfShapeFaceData &
	:rtype: HLRTopoBRep_DataMapOfShapeFaceData
") operator =;
		HLRTopoBRep_DataMapOfShapeFaceData & operator = (const HLRTopoBRep_DataMapOfShapeFaceData & Other);
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
	:type I: HLRTopoBRep_FaceData &
	:rtype: bool
") Bind;
		Standard_Boolean Bind (const TopoDS_Shape & K,const HLRTopoBRep_FaceData & I);
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
	:rtype: HLRTopoBRep_FaceData
") Find;
		const HLRTopoBRep_FaceData & Find (const TopoDS_Shape & K);
		%feature("compactdefaultargs") ChangeFind;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: HLRTopoBRep_FaceData
") ChangeFind;
		HLRTopoBRep_FaceData & ChangeFind (const TopoDS_Shape & K);
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


%extend HLRTopoBRep_DataMapOfShapeFaceData {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor HLRTopoBRep_FaceData;
class HLRTopoBRep_FaceData {
	public:
		%feature("compactdefaultargs") HLRTopoBRep_FaceData;
		%feature("autodoc", "	:rtype: None
") HLRTopoBRep_FaceData;
		 HLRTopoBRep_FaceData ();
		%feature("compactdefaultargs") FaceIntL;
		%feature("autodoc", "	:rtype: TopTools_ListOfShape
") FaceIntL;
		const TopTools_ListOfShape & FaceIntL ();
		%feature("compactdefaultargs") FaceOutL;
		%feature("autodoc", "	:rtype: TopTools_ListOfShape
") FaceOutL;
		const TopTools_ListOfShape & FaceOutL ();
		%feature("compactdefaultargs") FaceIsoL;
		%feature("autodoc", "	:rtype: TopTools_ListOfShape
") FaceIsoL;
		const TopTools_ListOfShape & FaceIsoL ();
		%feature("compactdefaultargs") AddIntL;
		%feature("autodoc", "	:rtype: TopTools_ListOfShape
") AddIntL;
		TopTools_ListOfShape & AddIntL ();
		%feature("compactdefaultargs") AddOutL;
		%feature("autodoc", "	:rtype: TopTools_ListOfShape
") AddOutL;
		TopTools_ListOfShape & AddOutL ();
		%feature("compactdefaultargs") AddIsoL;
		%feature("autodoc", "	:rtype: TopTools_ListOfShape
") AddIsoL;
		TopTools_ListOfShape & AddIsoL ();
};


%extend HLRTopoBRep_FaceData {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class HLRTopoBRep_FaceIsoLiner {
	public:
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param FI:
	:type FI: int
	:param F:
	:type F: TopoDS_Face &
	:param DS:
	:type DS: HLRTopoBRep_Data &
	:param nbIsos:
	:type nbIsos: int
	:rtype: void
") Perform;
		static void Perform (const Standard_Integer FI,const TopoDS_Face & F,HLRTopoBRep_Data & DS,const Standard_Integer nbIsos);
		%feature("compactdefaultargs") MakeVertex;
		%feature("autodoc", "	:param E:
	:type E: TopoDS_Edge &
	:param P:
	:type P: gp_Pnt
	:param Par:
	:type Par: float
	:param Tol:
	:type Tol: float
	:param DS:
	:type DS: HLRTopoBRep_Data &
	:rtype: TopoDS_Vertex
") MakeVertex;
		static TopoDS_Vertex MakeVertex (const TopoDS_Edge & E,const gp_Pnt & P,const Standard_Real Par,const Standard_Real Tol,HLRTopoBRep_Data & DS);
		%feature("compactdefaultargs") MakeIsoLine;
		%feature("autodoc", "	:param F:
	:type F: TopoDS_Face &
	:param Iso:
	:type Iso: Handle_Geom2d_Line &
	:param V1:
	:type V1: TopoDS_Vertex &
	:param V2:
	:type V2: TopoDS_Vertex &
	:param U1:
	:type U1: float
	:param U2:
	:type U2: float
	:param Tol:
	:type Tol: float
	:param DS:
	:type DS: HLRTopoBRep_Data &
	:rtype: void
") MakeIsoLine;
		static void MakeIsoLine (const TopoDS_Face & F,const Handle_Geom2d_Line & Iso,TopoDS_Vertex & V1,TopoDS_Vertex & V2,const Standard_Real U1,const Standard_Real U2,const Standard_Real Tol,HLRTopoBRep_Data & DS);
};


%extend HLRTopoBRep_FaceIsoLiner {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor HLRTopoBRep_ListIteratorOfListOfVData;
class HLRTopoBRep_ListIteratorOfListOfVData {
	public:
		%feature("compactdefaultargs") HLRTopoBRep_ListIteratorOfListOfVData;
		%feature("autodoc", "	:rtype: None
") HLRTopoBRep_ListIteratorOfListOfVData;
		 HLRTopoBRep_ListIteratorOfListOfVData ();
		%feature("compactdefaultargs") HLRTopoBRep_ListIteratorOfListOfVData;
		%feature("autodoc", "	:param L:
	:type L: HLRTopoBRep_ListOfVData &
	:rtype: None
") HLRTopoBRep_ListIteratorOfListOfVData;
		 HLRTopoBRep_ListIteratorOfListOfVData (const HLRTopoBRep_ListOfVData & L);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param L:
	:type L: HLRTopoBRep_ListOfVData &
	:rtype: None
") Initialize;
		void Initialize (const HLRTopoBRep_ListOfVData & L);
		%feature("compactdefaultargs") More;
		%feature("autodoc", "	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "	:rtype: None
") Next;
		void Next ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: HLRTopoBRep_VData
") Value;
		HLRTopoBRep_VData & Value ();
};


%extend HLRTopoBRep_ListIteratorOfListOfVData {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor HLRTopoBRep_ListNodeOfListOfVData;
class HLRTopoBRep_ListNodeOfListOfVData : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") HLRTopoBRep_ListNodeOfListOfVData;
		%feature("autodoc", "	:param I:
	:type I: HLRTopoBRep_VData &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") HLRTopoBRep_ListNodeOfListOfVData;
		 HLRTopoBRep_ListNodeOfListOfVData (const HLRTopoBRep_VData & I,const TCollection_MapNodePtr & n);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: HLRTopoBRep_VData
") Value;
		HLRTopoBRep_VData & Value ();
};


%extend HLRTopoBRep_ListNodeOfListOfVData {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_HLRTopoBRep_ListNodeOfListOfVData(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_HLRTopoBRep_ListNodeOfListOfVData::Handle_HLRTopoBRep_ListNodeOfListOfVData %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_HLRTopoBRep_ListNodeOfListOfVData;
class Handle_HLRTopoBRep_ListNodeOfListOfVData : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_HLRTopoBRep_ListNodeOfListOfVData();
        Handle_HLRTopoBRep_ListNodeOfListOfVData(const Handle_HLRTopoBRep_ListNodeOfListOfVData &aHandle);
        Handle_HLRTopoBRep_ListNodeOfListOfVData(const HLRTopoBRep_ListNodeOfListOfVData *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_HLRTopoBRep_ListNodeOfListOfVData DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_HLRTopoBRep_ListNodeOfListOfVData {
    HLRTopoBRep_ListNodeOfListOfVData* _get_reference() {
    return (HLRTopoBRep_ListNodeOfListOfVData*)$self->Access();
    }
};

%extend Handle_HLRTopoBRep_ListNodeOfListOfVData {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend HLRTopoBRep_ListNodeOfListOfVData {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor HLRTopoBRep_ListOfVData;
class HLRTopoBRep_ListOfVData {
	public:
		%feature("compactdefaultargs") HLRTopoBRep_ListOfVData;
		%feature("autodoc", "	:rtype: None
") HLRTopoBRep_ListOfVData;
		 HLRTopoBRep_ListOfVData ();
		%feature("compactdefaultargs") HLRTopoBRep_ListOfVData;
		%feature("autodoc", "	:param Other:
	:type Other: HLRTopoBRep_ListOfVData &
	:rtype: None
") HLRTopoBRep_ListOfVData;
		 HLRTopoBRep_ListOfVData (const HLRTopoBRep_ListOfVData & Other);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: HLRTopoBRep_ListOfVData &
	:rtype: None
") Assign;
		void Assign (const HLRTopoBRep_ListOfVData & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: HLRTopoBRep_ListOfVData &
	:rtype: None
") operator =;
		void operator = (const HLRTopoBRep_ListOfVData & Other);
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
	:type I: HLRTopoBRep_VData &
	:rtype: None
") Prepend;
		void Prepend (const HLRTopoBRep_VData & I);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param I:
	:type I: HLRTopoBRep_VData &
	:param theIt:
	:type theIt: HLRTopoBRep_ListIteratorOfListOfVData &
	:rtype: None
") Prepend;
		void Prepend (const HLRTopoBRep_VData & I,HLRTopoBRep_ListIteratorOfListOfVData & theIt);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param Other:
	:type Other: HLRTopoBRep_ListOfVData &
	:rtype: None
") Prepend;
		void Prepend (HLRTopoBRep_ListOfVData & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param I:
	:type I: HLRTopoBRep_VData &
	:rtype: None
") Append;
		void Append (const HLRTopoBRep_VData & I);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param I:
	:type I: HLRTopoBRep_VData &
	:param theIt:
	:type theIt: HLRTopoBRep_ListIteratorOfListOfVData &
	:rtype: None
") Append;
		void Append (const HLRTopoBRep_VData & I,HLRTopoBRep_ListIteratorOfListOfVData & theIt);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param Other:
	:type Other: HLRTopoBRep_ListOfVData &
	:rtype: None
") Append;
		void Append (HLRTopoBRep_ListOfVData & Other);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: HLRTopoBRep_VData
") First;
		HLRTopoBRep_VData & First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: HLRTopoBRep_VData
") Last;
		HLRTopoBRep_VData & Last ();
		%feature("compactdefaultargs") RemoveFirst;
		%feature("autodoc", "	:rtype: None
") RemoveFirst;
		void RemoveFirst ();
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param It:
	:type It: HLRTopoBRep_ListIteratorOfListOfVData &
	:rtype: None
") Remove;
		void Remove (HLRTopoBRep_ListIteratorOfListOfVData & It);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param I:
	:type I: HLRTopoBRep_VData &
	:param It:
	:type It: HLRTopoBRep_ListIteratorOfListOfVData &
	:rtype: None
") InsertBefore;
		void InsertBefore (const HLRTopoBRep_VData & I,HLRTopoBRep_ListIteratorOfListOfVData & It);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Other:
	:type Other: HLRTopoBRep_ListOfVData &
	:param It:
	:type It: HLRTopoBRep_ListIteratorOfListOfVData &
	:rtype: None
") InsertBefore;
		void InsertBefore (HLRTopoBRep_ListOfVData & Other,HLRTopoBRep_ListIteratorOfListOfVData & It);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param I:
	:type I: HLRTopoBRep_VData &
	:param It:
	:type It: HLRTopoBRep_ListIteratorOfListOfVData &
	:rtype: None
") InsertAfter;
		void InsertAfter (const HLRTopoBRep_VData & I,HLRTopoBRep_ListIteratorOfListOfVData & It);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Other:
	:type Other: HLRTopoBRep_ListOfVData &
	:param It:
	:type It: HLRTopoBRep_ListIteratorOfListOfVData &
	:rtype: None
") InsertAfter;
		void InsertAfter (HLRTopoBRep_ListOfVData & Other,HLRTopoBRep_ListIteratorOfListOfVData & It);
};


%extend HLRTopoBRep_ListOfVData {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor HLRTopoBRep_MapOfShapeListOfVData;
class HLRTopoBRep_MapOfShapeListOfVData : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") HLRTopoBRep_MapOfShapeListOfVData;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") HLRTopoBRep_MapOfShapeListOfVData;
		 HLRTopoBRep_MapOfShapeListOfVData (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: HLRTopoBRep_MapOfShapeListOfVData &
	:rtype: HLRTopoBRep_MapOfShapeListOfVData
") Assign;
		HLRTopoBRep_MapOfShapeListOfVData & Assign (const HLRTopoBRep_MapOfShapeListOfVData & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: HLRTopoBRep_MapOfShapeListOfVData &
	:rtype: HLRTopoBRep_MapOfShapeListOfVData
") operator =;
		HLRTopoBRep_MapOfShapeListOfVData & operator = (const HLRTopoBRep_MapOfShapeListOfVData & Other);
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
	:type I: HLRTopoBRep_ListOfVData &
	:rtype: bool
") Bind;
		Standard_Boolean Bind (const TopoDS_Shape & K,const HLRTopoBRep_ListOfVData & I);
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
	:rtype: HLRTopoBRep_ListOfVData
") Find;
		const HLRTopoBRep_ListOfVData & Find (const TopoDS_Shape & K);
		%feature("compactdefaultargs") ChangeFind;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: HLRTopoBRep_ListOfVData
") ChangeFind;
		HLRTopoBRep_ListOfVData & ChangeFind (const TopoDS_Shape & K);
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


%extend HLRTopoBRep_MapOfShapeListOfVData {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor HLRTopoBRep_OutLiner;
class HLRTopoBRep_OutLiner : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") HLRTopoBRep_OutLiner;
		%feature("autodoc", "	:rtype: None
") HLRTopoBRep_OutLiner;
		 HLRTopoBRep_OutLiner ();
		%feature("compactdefaultargs") HLRTopoBRep_OutLiner;
		%feature("autodoc", "	:param OriSh:
	:type OriSh: TopoDS_Shape &
	:rtype: None
") HLRTopoBRep_OutLiner;
		 HLRTopoBRep_OutLiner (const TopoDS_Shape & OriSh);
		%feature("compactdefaultargs") HLRTopoBRep_OutLiner;
		%feature("autodoc", "	:param OriS:
	:type OriS: TopoDS_Shape &
	:param OutS:
	:type OutS: TopoDS_Shape &
	:rtype: None
") HLRTopoBRep_OutLiner;
		 HLRTopoBRep_OutLiner (const TopoDS_Shape & OriS,const TopoDS_Shape & OutS);
		%feature("compactdefaultargs") OriginalShape;
		%feature("autodoc", "	:param OriS:
	:type OriS: TopoDS_Shape &
	:rtype: None
") OriginalShape;
		void OriginalShape (const TopoDS_Shape & OriS);
		%feature("compactdefaultargs") OriginalShape;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") OriginalShape;
		TopoDS_Shape  OriginalShape ();
		%feature("compactdefaultargs") OutLinedShape;
		%feature("autodoc", "	:param OutS:
	:type OutS: TopoDS_Shape &
	:rtype: None
") OutLinedShape;
		void OutLinedShape (const TopoDS_Shape & OutS);
		%feature("compactdefaultargs") OutLinedShape;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") OutLinedShape;
		TopoDS_Shape  OutLinedShape ();
		%feature("compactdefaultargs") DataStructure;
		%feature("autodoc", "	:rtype: HLRTopoBRep_Data
") DataStructure;
		HLRTopoBRep_Data & DataStructure ();
		%feature("compactdefaultargs") Fill;
		%feature("autodoc", "	:param P:
	:type P: HLRAlgo_Projector &
	:param MST:
	:type MST: BRepTopAdaptor_MapOfShapeTool &
	:param nbIso:
	:type nbIso: int
	:rtype: None
") Fill;
		void Fill (const HLRAlgo_Projector & P,BRepTopAdaptor_MapOfShapeTool & MST,const Standard_Integer nbIso);
};


%extend HLRTopoBRep_OutLiner {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_HLRTopoBRep_OutLiner(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_HLRTopoBRep_OutLiner::Handle_HLRTopoBRep_OutLiner %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_HLRTopoBRep_OutLiner;
class Handle_HLRTopoBRep_OutLiner : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_HLRTopoBRep_OutLiner();
        Handle_HLRTopoBRep_OutLiner(const Handle_HLRTopoBRep_OutLiner &aHandle);
        Handle_HLRTopoBRep_OutLiner(const HLRTopoBRep_OutLiner *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_HLRTopoBRep_OutLiner DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_HLRTopoBRep_OutLiner {
    HLRTopoBRep_OutLiner* _get_reference() {
    return (HLRTopoBRep_OutLiner*)$self->Access();
    }
};

%extend Handle_HLRTopoBRep_OutLiner {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend HLRTopoBRep_OutLiner {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor HLRTopoBRep_VData;
class HLRTopoBRep_VData {
	public:
		%feature("compactdefaultargs") HLRTopoBRep_VData;
		%feature("autodoc", "	:rtype: None
") HLRTopoBRep_VData;
		 HLRTopoBRep_VData ();
		%feature("compactdefaultargs") HLRTopoBRep_VData;
		%feature("autodoc", "	:param P:
	:type P: float
	:param V:
	:type V: TopoDS_Shape &
	:rtype: None
") HLRTopoBRep_VData;
		 HLRTopoBRep_VData (const Standard_Real P,const TopoDS_Shape & V);
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "	:rtype: float
") Parameter;
		Standard_Real Parameter ();
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Vertex;
		const TopoDS_Shape  Vertex ();
};


%extend HLRTopoBRep_VData {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
