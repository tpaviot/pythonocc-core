/*
Copyright 2008-2014 Thomas Paviot (tpaviot@gmail.com)


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
%include ../common/StandardDefines.i
%include ../common/ExceptionCatcher.i
%include ../common/FunctionTransformers.i
%include ../common/Operators.i

%include HLRTopoBRep_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%nodefaultctor HLRTopoBRep_DSFiller;
class HLRTopoBRep_DSFiller {
	public:
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
	:type nbIso: Standard_Integer
	:rtype: void
") Insert;
		static void Insert (const TopoDS_Shape & S,Contap_Contour & FO,HLRTopoBRep_Data & DS,BRepTopAdaptor_MapOfShapeTool & MST,const Standard_Integer nbIso);
};


%feature("shadow") HLRTopoBRep_DSFiller::~HLRTopoBRep_DSFiller %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend HLRTopoBRep_DSFiller {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor HLRTopoBRep_Data;
class HLRTopoBRep_Data {
	public:
		%feature("autodoc", "	:rtype: None
") HLRTopoBRep_Data;
		 HLRTopoBRep_Data ();
		%feature("autodoc", "	* Clear of all the maps.

	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	* Clear of all the data not needed during and after the hiding process.

	:rtype: None
") Clean;
		void Clean ();
		%feature("autodoc", "	* Returns True if the Edge is split.

	:param E:
	:type E: TopoDS_Edge &
	:rtype: bool
") EdgeHasSplE;
		Standard_Boolean EdgeHasSplE (const TopoDS_Edge & E);
		%feature("autodoc", "	* Returns True if the Face has internal outline.

	:param F:
	:type F: TopoDS_Face &
	:rtype: bool
") FaceHasIntL;
		Standard_Boolean FaceHasIntL (const TopoDS_Face & F);
		%feature("autodoc", "	* Returns True if the Face has outlines on restriction.

	:param F:
	:type F: TopoDS_Face &
	:rtype: bool
") FaceHasOutL;
		Standard_Boolean FaceHasOutL (const TopoDS_Face & F);
		%feature("autodoc", "	* Returns True if the Face has isolines.

	:param F:
	:type F: TopoDS_Face &
	:rtype: bool
") FaceHasIsoL;
		Standard_Boolean FaceHasIsoL (const TopoDS_Face & F);
		%feature("autodoc", "	:param E1:
	:type E1: TopoDS_Edge &
	:param E2:
	:type E2: TopoDS_Edge &
	:rtype: bool
") IsSplEEdgeEdge;
		Standard_Boolean IsSplEEdgeEdge (const TopoDS_Edge & E1,const TopoDS_Edge & E2);
		%feature("autodoc", "	:param F:
	:type F: TopoDS_Face &
	:param E:
	:type E: TopoDS_Edge &
	:rtype: bool
") IsIntLFaceEdge;
		Standard_Boolean IsIntLFaceEdge (const TopoDS_Face & F,const TopoDS_Edge & E);
		%feature("autodoc", "	:param F:
	:type F: TopoDS_Face &
	:param E:
	:type E: TopoDS_Edge &
	:rtype: bool
") IsOutLFaceEdge;
		Standard_Boolean IsOutLFaceEdge (const TopoDS_Face & F,const TopoDS_Edge & E);
		%feature("autodoc", "	:param F:
	:type F: TopoDS_Face &
	:param E:
	:type E: TopoDS_Edge &
	:rtype: bool
") IsIsoLFaceEdge;
		Standard_Boolean IsIsoLFaceEdge (const TopoDS_Face & F,const TopoDS_Edge & E);
		%feature("autodoc", "	:param New:
	:type New: TopoDS_Shape &
	:rtype: TopoDS_Shape
") NewSOldS;
		TopoDS_Shape NewSOldS (const TopoDS_Shape & New);
		%feature("autodoc", "	* Returns the list of the edges.

	:param E:
	:type E: TopoDS_Edge &
	:rtype: TopTools_ListOfShape
") EdgeSplE;
		const TopTools_ListOfShape & EdgeSplE (const TopoDS_Edge & E);
		%feature("autodoc", "	* Returns the list of the internal OutLines.

	:param F:
	:type F: TopoDS_Face &
	:rtype: TopTools_ListOfShape
") FaceIntL;
		const TopTools_ListOfShape & FaceIntL (const TopoDS_Face & F);
		%feature("autodoc", "	* Returns the list of the OutLines on restriction.

	:param F:
	:type F: TopoDS_Face &
	:rtype: TopTools_ListOfShape
") FaceOutL;
		const TopTools_ListOfShape & FaceOutL (const TopoDS_Face & F);
		%feature("autodoc", "	* Returns the list of the IsoLines.

	:param F:
	:type F: TopoDS_Face &
	:rtype: TopTools_ListOfShape
") FaceIsoL;
		const TopTools_ListOfShape & FaceIsoL (const TopoDS_Face & F);
		%feature("autodoc", "	* Returns True if V is an outline vertex on a restriction.

	:param V:
	:type V: TopoDS_Vertex &
	:rtype: bool
") IsOutV;
		Standard_Boolean IsOutV (const TopoDS_Vertex & V);
		%feature("autodoc", "	* Returns True if V is an internal outline vertex.

	:param V:
	:type V: TopoDS_Vertex &
	:rtype: bool
") IsIntV;
		Standard_Boolean IsIntV (const TopoDS_Vertex & V);
		%feature("autodoc", "	:param NewS:
	:type NewS: TopoDS_Shape &
	:param OldS:
	:type OldS: TopoDS_Shape &
	:rtype: None
") AddOldS;
		void AddOldS (const TopoDS_Shape & NewS,const TopoDS_Shape & OldS);
		%feature("autodoc", "	:param E:
	:type E: TopoDS_Edge &
	:rtype: TopTools_ListOfShape
") AddSplE;
		TopTools_ListOfShape & AddSplE (const TopoDS_Edge & E);
		%feature("autodoc", "	:param F:
	:type F: TopoDS_Face &
	:rtype: TopTools_ListOfShape
") AddIntL;
		TopTools_ListOfShape & AddIntL (const TopoDS_Face & F);
		%feature("autodoc", "	:param F:
	:type F: TopoDS_Face &
	:rtype: TopTools_ListOfShape
") AddOutL;
		TopTools_ListOfShape & AddOutL (const TopoDS_Face & F);
		%feature("autodoc", "	:param F:
	:type F: TopoDS_Face &
	:rtype: TopTools_ListOfShape
") AddIsoL;
		TopTools_ListOfShape & AddIsoL (const TopoDS_Face & F);
		%feature("autodoc", "	:param V:
	:type V: TopoDS_Vertex &
	:rtype: None
") AddOutV;
		void AddOutV (const TopoDS_Vertex & V);
		%feature("autodoc", "	:param V:
	:type V: TopoDS_Vertex &
	:rtype: None
") AddIntV;
		void AddIntV (const TopoDS_Vertex & V);
		%feature("autodoc", "	:rtype: None
") InitEdge;
		void InitEdge ();
		%feature("autodoc", "	:rtype: bool
") MoreEdge;
		Standard_Boolean MoreEdge ();
		%feature("autodoc", "	:rtype: None
") NextEdge;
		void NextEdge ();
		%feature("autodoc", "	:rtype: TopoDS_Edge
") Edge;
		const TopoDS_Edge  Edge ();
		%feature("autodoc", "	* Start an iteration on the vertices of E.

	:param E:
	:type E: TopoDS_Edge &
	:rtype: None
") InitVertex;
		void InitVertex (const TopoDS_Edge & E);
		%feature("autodoc", "	:rtype: bool
") MoreVertex;
		Standard_Boolean MoreVertex ();
		%feature("autodoc", "	:rtype: None
") NextVertex;
		void NextVertex ();
		%feature("autodoc", "	:rtype: TopoDS_Vertex
") Vertex;
		const TopoDS_Vertex  Vertex ();
		%feature("autodoc", "	:rtype: float
") Parameter;
		Standard_Real Parameter ();
		%feature("autodoc", "	* Insert before the current position.

	:param V:
	:type V: TopoDS_Vertex &
	:param P:
	:type P: float
	:rtype: None
") InsertBefore;
		void InsertBefore (const TopoDS_Vertex & V,const Standard_Real P);
		%feature("autodoc", "	:param V:
	:type V: TopoDS_Vertex &
	:param P:
	:type P: float
	:rtype: None
") Append;
		void Append (const TopoDS_Vertex & V,const Standard_Real P);
};


%feature("shadow") HLRTopoBRep_Data::~HLRTopoBRep_Data %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend HLRTopoBRep_Data {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor HLRTopoBRep_DataMapIteratorOfDataMapOfShapeFaceData;
class HLRTopoBRep_DataMapIteratorOfDataMapOfShapeFaceData : public TCollection_BasicMapIterator {
	public:
		%feature("autodoc", "	:rtype: None
") HLRTopoBRep_DataMapIteratorOfDataMapOfShapeFaceData;
		 HLRTopoBRep_DataMapIteratorOfDataMapOfShapeFaceData ();
		%feature("autodoc", "	:param aMap:
	:type aMap: HLRTopoBRep_DataMapOfShapeFaceData &
	:rtype: None
") HLRTopoBRep_DataMapIteratorOfDataMapOfShapeFaceData;
		 HLRTopoBRep_DataMapIteratorOfDataMapOfShapeFaceData (const HLRTopoBRep_DataMapOfShapeFaceData & aMap);
		%feature("autodoc", "	:param aMap:
	:type aMap: HLRTopoBRep_DataMapOfShapeFaceData &
	:rtype: None
") Initialize;
		void Initialize (const HLRTopoBRep_DataMapOfShapeFaceData & aMap);
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Key;
		const TopoDS_Shape  Key ();
		%feature("autodoc", "	:rtype: HLRTopoBRep_FaceData
") Value;
		const HLRTopoBRep_FaceData & Value ();
};


%feature("shadow") HLRTopoBRep_DataMapIteratorOfDataMapOfShapeFaceData::~HLRTopoBRep_DataMapIteratorOfDataMapOfShapeFaceData %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend HLRTopoBRep_DataMapIteratorOfDataMapOfShapeFaceData {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor HLRTopoBRep_DataMapIteratorOfMapOfShapeListOfVData;
class HLRTopoBRep_DataMapIteratorOfMapOfShapeListOfVData : public TCollection_BasicMapIterator {
	public:
		%feature("autodoc", "	:rtype: None
") HLRTopoBRep_DataMapIteratorOfMapOfShapeListOfVData;
		 HLRTopoBRep_DataMapIteratorOfMapOfShapeListOfVData ();
		%feature("autodoc", "	:param aMap:
	:type aMap: HLRTopoBRep_MapOfShapeListOfVData &
	:rtype: None
") HLRTopoBRep_DataMapIteratorOfMapOfShapeListOfVData;
		 HLRTopoBRep_DataMapIteratorOfMapOfShapeListOfVData (const HLRTopoBRep_MapOfShapeListOfVData & aMap);
		%feature("autodoc", "	:param aMap:
	:type aMap: HLRTopoBRep_MapOfShapeListOfVData &
	:rtype: None
") Initialize;
		void Initialize (const HLRTopoBRep_MapOfShapeListOfVData & aMap);
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Key;
		const TopoDS_Shape  Key ();
		%feature("autodoc", "	:rtype: HLRTopoBRep_ListOfVData
") Value;
		const HLRTopoBRep_ListOfVData & Value ();
};


%feature("shadow") HLRTopoBRep_DataMapIteratorOfMapOfShapeListOfVData::~HLRTopoBRep_DataMapIteratorOfMapOfShapeListOfVData %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend HLRTopoBRep_DataMapIteratorOfMapOfShapeListOfVData {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor HLRTopoBRep_DataMapNodeOfDataMapOfShapeFaceData;
class HLRTopoBRep_DataMapNodeOfDataMapOfShapeFaceData : public TCollection_MapNode {
	public:
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:param I:
	:type I: HLRTopoBRep_FaceData &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") HLRTopoBRep_DataMapNodeOfDataMapOfShapeFaceData;
		 HLRTopoBRep_DataMapNodeOfDataMapOfShapeFaceData (const TopoDS_Shape & K,const HLRTopoBRep_FaceData & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Key;
		TopoDS_Shape  Key ();
		%feature("autodoc", "	:rtype: HLRTopoBRep_FaceData
") Value;
		HLRTopoBRep_FaceData & Value ();
};


%feature("shadow") HLRTopoBRep_DataMapNodeOfDataMapOfShapeFaceData::~HLRTopoBRep_DataMapNodeOfDataMapOfShapeFaceData %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend HLRTopoBRep_DataMapNodeOfDataMapOfShapeFaceData {
	void _kill_pointed() {
		delete $self;
	}
};
%extend HLRTopoBRep_DataMapNodeOfDataMapOfShapeFaceData {
	Handle_HLRTopoBRep_DataMapNodeOfDataMapOfShapeFaceData GetHandle() {
	return *(Handle_HLRTopoBRep_DataMapNodeOfDataMapOfShapeFaceData*) &$self;
	}
};

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
    HLRTopoBRep_DataMapNodeOfDataMapOfShapeFaceData* GetObject() {
    return (HLRTopoBRep_DataMapNodeOfDataMapOfShapeFaceData*)$self->Access();
    }
};
%feature("shadow") Handle_HLRTopoBRep_DataMapNodeOfDataMapOfShapeFaceData::~Handle_HLRTopoBRep_DataMapNodeOfDataMapOfShapeFaceData %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_HLRTopoBRep_DataMapNodeOfDataMapOfShapeFaceData {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor HLRTopoBRep_DataMapNodeOfMapOfShapeListOfVData;
class HLRTopoBRep_DataMapNodeOfMapOfShapeListOfVData : public TCollection_MapNode {
	public:
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:param I:
	:type I: HLRTopoBRep_ListOfVData &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") HLRTopoBRep_DataMapNodeOfMapOfShapeListOfVData;
		 HLRTopoBRep_DataMapNodeOfMapOfShapeListOfVData (const TopoDS_Shape & K,const HLRTopoBRep_ListOfVData & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Key;
		TopoDS_Shape  Key ();
		%feature("autodoc", "	:rtype: HLRTopoBRep_ListOfVData
") Value;
		HLRTopoBRep_ListOfVData & Value ();
};


%feature("shadow") HLRTopoBRep_DataMapNodeOfMapOfShapeListOfVData::~HLRTopoBRep_DataMapNodeOfMapOfShapeListOfVData %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend HLRTopoBRep_DataMapNodeOfMapOfShapeListOfVData {
	void _kill_pointed() {
		delete $self;
	}
};
%extend HLRTopoBRep_DataMapNodeOfMapOfShapeListOfVData {
	Handle_HLRTopoBRep_DataMapNodeOfMapOfShapeListOfVData GetHandle() {
	return *(Handle_HLRTopoBRep_DataMapNodeOfMapOfShapeListOfVData*) &$self;
	}
};

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
    HLRTopoBRep_DataMapNodeOfMapOfShapeListOfVData* GetObject() {
    return (HLRTopoBRep_DataMapNodeOfMapOfShapeListOfVData*)$self->Access();
    }
};
%feature("shadow") Handle_HLRTopoBRep_DataMapNodeOfMapOfShapeListOfVData::~Handle_HLRTopoBRep_DataMapNodeOfMapOfShapeListOfVData %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_HLRTopoBRep_DataMapNodeOfMapOfShapeListOfVData {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor HLRTopoBRep_DataMapOfShapeFaceData;
class HLRTopoBRep_DataMapOfShapeFaceData : public TCollection_BasicMap {
	public:
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: Standard_Integer
	:rtype: None
") HLRTopoBRep_DataMapOfShapeFaceData;
		 HLRTopoBRep_DataMapOfShapeFaceData (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "	:param Other:
	:type Other: HLRTopoBRep_DataMapOfShapeFaceData &
	:rtype: HLRTopoBRep_DataMapOfShapeFaceData
") Assign;
		HLRTopoBRep_DataMapOfShapeFaceData & Assign (const HLRTopoBRep_DataMapOfShapeFaceData & Other);
		%feature("autodoc", "	:param Other:
	:type Other: HLRTopoBRep_DataMapOfShapeFaceData &
	:rtype: HLRTopoBRep_DataMapOfShapeFaceData
") operator=;
		HLRTopoBRep_DataMapOfShapeFaceData & operator = (const HLRTopoBRep_DataMapOfShapeFaceData & Other);
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: Standard_Integer
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:param I:
	:type I: HLRTopoBRep_FaceData &
	:rtype: bool
") Bind;
		Standard_Boolean Bind (const TopoDS_Shape & K,const HLRTopoBRep_FaceData & I);
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: bool
") IsBound;
		Standard_Boolean IsBound (const TopoDS_Shape & K);
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: bool
") UnBind;
		Standard_Boolean UnBind (const TopoDS_Shape & K);
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: HLRTopoBRep_FaceData
") Find;
		const HLRTopoBRep_FaceData & Find (const TopoDS_Shape & K);
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: HLRTopoBRep_FaceData
") ChangeFind;
		HLRTopoBRep_FaceData & ChangeFind (const TopoDS_Shape & K);
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: Standard_Address
") Find1;
		Standard_Address Find1 (const TopoDS_Shape & K);
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: Standard_Address
") ChangeFind1;
		Standard_Address ChangeFind1 (const TopoDS_Shape & K);
};


%feature("shadow") HLRTopoBRep_DataMapOfShapeFaceData::~HLRTopoBRep_DataMapOfShapeFaceData %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend HLRTopoBRep_DataMapOfShapeFaceData {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor HLRTopoBRep_FaceData;
class HLRTopoBRep_FaceData {
	public:
		%feature("autodoc", "	:rtype: None
") HLRTopoBRep_FaceData;
		 HLRTopoBRep_FaceData ();
		%feature("autodoc", "	:rtype: TopTools_ListOfShape
") FaceIntL;
		const TopTools_ListOfShape & FaceIntL ();
		%feature("autodoc", "	:rtype: TopTools_ListOfShape
") FaceOutL;
		const TopTools_ListOfShape & FaceOutL ();
		%feature("autodoc", "	:rtype: TopTools_ListOfShape
") FaceIsoL;
		const TopTools_ListOfShape & FaceIsoL ();
		%feature("autodoc", "	:rtype: TopTools_ListOfShape
") AddIntL;
		TopTools_ListOfShape & AddIntL ();
		%feature("autodoc", "	:rtype: TopTools_ListOfShape
") AddOutL;
		TopTools_ListOfShape & AddOutL ();
		%feature("autodoc", "	:rtype: TopTools_ListOfShape
") AddIsoL;
		TopTools_ListOfShape & AddIsoL ();
};


%feature("shadow") HLRTopoBRep_FaceData::~HLRTopoBRep_FaceData %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend HLRTopoBRep_FaceData {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor HLRTopoBRep_FaceIsoLiner;
class HLRTopoBRep_FaceIsoLiner {
	public:
		%feature("autodoc", "	:param FI:
	:type FI: Standard_Integer
	:param F:
	:type F: TopoDS_Face &
	:param DS:
	:type DS: HLRTopoBRep_Data &
	:param nbIsos:
	:type nbIsos: Standard_Integer
	:rtype: void
") Perform;
		static void Perform (const Standard_Integer FI,const TopoDS_Face & F,HLRTopoBRep_Data & DS,const Standard_Integer nbIsos);
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


%feature("shadow") HLRTopoBRep_FaceIsoLiner::~HLRTopoBRep_FaceIsoLiner %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend HLRTopoBRep_FaceIsoLiner {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor HLRTopoBRep_ListIteratorOfListOfVData;
class HLRTopoBRep_ListIteratorOfListOfVData {
	public:
		%feature("autodoc", "	:rtype: None
") HLRTopoBRep_ListIteratorOfListOfVData;
		 HLRTopoBRep_ListIteratorOfListOfVData ();
		%feature("autodoc", "	:param L:
	:type L: HLRTopoBRep_ListOfVData &
	:rtype: None
") HLRTopoBRep_ListIteratorOfListOfVData;
		 HLRTopoBRep_ListIteratorOfListOfVData (const HLRTopoBRep_ListOfVData & L);
		%feature("autodoc", "	:param L:
	:type L: HLRTopoBRep_ListOfVData &
	:rtype: None
") Initialize;
		void Initialize (const HLRTopoBRep_ListOfVData & L);
		%feature("autodoc", "	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("autodoc", "	:rtype: None
") Next;
		void Next ();
		%feature("autodoc", "	:rtype: HLRTopoBRep_VData
") Value;
		HLRTopoBRep_VData & Value ();
};


%feature("shadow") HLRTopoBRep_ListIteratorOfListOfVData::~HLRTopoBRep_ListIteratorOfListOfVData %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend HLRTopoBRep_ListIteratorOfListOfVData {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor HLRTopoBRep_ListNodeOfListOfVData;
class HLRTopoBRep_ListNodeOfListOfVData : public TCollection_MapNode {
	public:
		%feature("autodoc", "	:param I:
	:type I: HLRTopoBRep_VData &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") HLRTopoBRep_ListNodeOfListOfVData;
		 HLRTopoBRep_ListNodeOfListOfVData (const HLRTopoBRep_VData & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "	:rtype: HLRTopoBRep_VData
") Value;
		HLRTopoBRep_VData & Value ();
};


%feature("shadow") HLRTopoBRep_ListNodeOfListOfVData::~HLRTopoBRep_ListNodeOfListOfVData %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend HLRTopoBRep_ListNodeOfListOfVData {
	void _kill_pointed() {
		delete $self;
	}
};
%extend HLRTopoBRep_ListNodeOfListOfVData {
	Handle_HLRTopoBRep_ListNodeOfListOfVData GetHandle() {
	return *(Handle_HLRTopoBRep_ListNodeOfListOfVData*) &$self;
	}
};

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
    HLRTopoBRep_ListNodeOfListOfVData* GetObject() {
    return (HLRTopoBRep_ListNodeOfListOfVData*)$self->Access();
    }
};
%feature("shadow") Handle_HLRTopoBRep_ListNodeOfListOfVData::~Handle_HLRTopoBRep_ListNodeOfListOfVData %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_HLRTopoBRep_ListNodeOfListOfVData {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor HLRTopoBRep_ListOfVData;
class HLRTopoBRep_ListOfVData {
	public:
		%feature("autodoc", "	:rtype: None
") HLRTopoBRep_ListOfVData;
		 HLRTopoBRep_ListOfVData ();
		%feature("autodoc", "	:param Other:
	:type Other: HLRTopoBRep_ListOfVData &
	:rtype: None
") Assign;
		void Assign (const HLRTopoBRep_ListOfVData & Other);
		%feature("autodoc", "	:param Other:
	:type Other: HLRTopoBRep_ListOfVData &
	:rtype: None
") operator=;
		void operator = (const HLRTopoBRep_ListOfVData & Other);
		%feature("autodoc", "	:rtype: int
") Extent;
		Standard_Integer Extent ();
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "	:param I:
	:type I: HLRTopoBRep_VData &
	:rtype: None
") Prepend;
		void Prepend (const HLRTopoBRep_VData & I);
		%feature("autodoc", "	:param I:
	:type I: HLRTopoBRep_VData &
	:param theIt:
	:type theIt: HLRTopoBRep_ListIteratorOfListOfVData &
	:rtype: None
") Prepend;
		void Prepend (const HLRTopoBRep_VData & I,HLRTopoBRep_ListIteratorOfListOfVData & theIt);
		%feature("autodoc", "	:param Other:
	:type Other: HLRTopoBRep_ListOfVData &
	:rtype: None
") Prepend;
		void Prepend (HLRTopoBRep_ListOfVData & Other);
		%feature("autodoc", "	:param I:
	:type I: HLRTopoBRep_VData &
	:rtype: None
") Append;
		void Append (const HLRTopoBRep_VData & I);
		%feature("autodoc", "	:param I:
	:type I: HLRTopoBRep_VData &
	:param theIt:
	:type theIt: HLRTopoBRep_ListIteratorOfListOfVData &
	:rtype: None
") Append;
		void Append (const HLRTopoBRep_VData & I,HLRTopoBRep_ListIteratorOfListOfVData & theIt);
		%feature("autodoc", "	:param Other:
	:type Other: HLRTopoBRep_ListOfVData &
	:rtype: None
") Append;
		void Append (HLRTopoBRep_ListOfVData & Other);
		%feature("autodoc", "	:rtype: HLRTopoBRep_VData
") First;
		HLRTopoBRep_VData & First ();
		%feature("autodoc", "	:rtype: HLRTopoBRep_VData
") Last;
		HLRTopoBRep_VData & Last ();
		%feature("autodoc", "	:rtype: None
") RemoveFirst;
		void RemoveFirst ();
		%feature("autodoc", "	:param It:
	:type It: HLRTopoBRep_ListIteratorOfListOfVData &
	:rtype: None
") Remove;
		void Remove (HLRTopoBRep_ListIteratorOfListOfVData & It);
		%feature("autodoc", "	:param I:
	:type I: HLRTopoBRep_VData &
	:param It:
	:type It: HLRTopoBRep_ListIteratorOfListOfVData &
	:rtype: None
") InsertBefore;
		void InsertBefore (const HLRTopoBRep_VData & I,HLRTopoBRep_ListIteratorOfListOfVData & It);
		%feature("autodoc", "	:param Other:
	:type Other: HLRTopoBRep_ListOfVData &
	:param It:
	:type It: HLRTopoBRep_ListIteratorOfListOfVData &
	:rtype: None
") InsertBefore;
		void InsertBefore (HLRTopoBRep_ListOfVData & Other,HLRTopoBRep_ListIteratorOfListOfVData & It);
		%feature("autodoc", "	:param I:
	:type I: HLRTopoBRep_VData &
	:param It:
	:type It: HLRTopoBRep_ListIteratorOfListOfVData &
	:rtype: None
") InsertAfter;
		void InsertAfter (const HLRTopoBRep_VData & I,HLRTopoBRep_ListIteratorOfListOfVData & It);
		%feature("autodoc", "	:param Other:
	:type Other: HLRTopoBRep_ListOfVData &
	:param It:
	:type It: HLRTopoBRep_ListIteratorOfListOfVData &
	:rtype: None
") InsertAfter;
		void InsertAfter (HLRTopoBRep_ListOfVData & Other,HLRTopoBRep_ListIteratorOfListOfVData & It);
};


%feature("shadow") HLRTopoBRep_ListOfVData::~HLRTopoBRep_ListOfVData %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend HLRTopoBRep_ListOfVData {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor HLRTopoBRep_MapOfShapeListOfVData;
class HLRTopoBRep_MapOfShapeListOfVData : public TCollection_BasicMap {
	public:
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: Standard_Integer
	:rtype: None
") HLRTopoBRep_MapOfShapeListOfVData;
		 HLRTopoBRep_MapOfShapeListOfVData (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "	:param Other:
	:type Other: HLRTopoBRep_MapOfShapeListOfVData &
	:rtype: HLRTopoBRep_MapOfShapeListOfVData
") Assign;
		HLRTopoBRep_MapOfShapeListOfVData & Assign (const HLRTopoBRep_MapOfShapeListOfVData & Other);
		%feature("autodoc", "	:param Other:
	:type Other: HLRTopoBRep_MapOfShapeListOfVData &
	:rtype: HLRTopoBRep_MapOfShapeListOfVData
") operator=;
		HLRTopoBRep_MapOfShapeListOfVData & operator = (const HLRTopoBRep_MapOfShapeListOfVData & Other);
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: Standard_Integer
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:param I:
	:type I: HLRTopoBRep_ListOfVData &
	:rtype: bool
") Bind;
		Standard_Boolean Bind (const TopoDS_Shape & K,const HLRTopoBRep_ListOfVData & I);
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: bool
") IsBound;
		Standard_Boolean IsBound (const TopoDS_Shape & K);
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: bool
") UnBind;
		Standard_Boolean UnBind (const TopoDS_Shape & K);
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: HLRTopoBRep_ListOfVData
") Find;
		const HLRTopoBRep_ListOfVData & Find (const TopoDS_Shape & K);
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: HLRTopoBRep_ListOfVData
") ChangeFind;
		HLRTopoBRep_ListOfVData & ChangeFind (const TopoDS_Shape & K);
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: Standard_Address
") Find1;
		Standard_Address Find1 (const TopoDS_Shape & K);
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: Standard_Address
") ChangeFind1;
		Standard_Address ChangeFind1 (const TopoDS_Shape & K);
};


%feature("shadow") HLRTopoBRep_MapOfShapeListOfVData::~HLRTopoBRep_MapOfShapeListOfVData %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend HLRTopoBRep_MapOfShapeListOfVData {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor HLRTopoBRep_OutLiner;
class HLRTopoBRep_OutLiner : public MMgt_TShared {
	public:
		%feature("autodoc", "	:rtype: None
") HLRTopoBRep_OutLiner;
		 HLRTopoBRep_OutLiner ();
		%feature("autodoc", "	:param OriSh:
	:type OriSh: TopoDS_Shape &
	:rtype: None
") HLRTopoBRep_OutLiner;
		 HLRTopoBRep_OutLiner (const TopoDS_Shape & OriSh);
		%feature("autodoc", "	:param OriS:
	:type OriS: TopoDS_Shape &
	:param OutS:
	:type OutS: TopoDS_Shape &
	:rtype: None
") HLRTopoBRep_OutLiner;
		 HLRTopoBRep_OutLiner (const TopoDS_Shape & OriS,const TopoDS_Shape & OutS);
		%feature("autodoc", "	:param OriS:
	:type OriS: TopoDS_Shape &
	:rtype: None
") OriginalShape;
		void OriginalShape (const TopoDS_Shape & OriS);
		%feature("autodoc", "	:rtype: TopoDS_Shape
") OriginalShape;
		TopoDS_Shape  OriginalShape ();
		%feature("autodoc", "	:param OutS:
	:type OutS: TopoDS_Shape &
	:rtype: None
") OutLinedShape;
		void OutLinedShape (const TopoDS_Shape & OutS);
		%feature("autodoc", "	:rtype: TopoDS_Shape
") OutLinedShape;
		TopoDS_Shape  OutLinedShape ();
		%feature("autodoc", "	:rtype: HLRTopoBRep_Data
") DataStructure;
		HLRTopoBRep_Data & DataStructure ();
		%feature("autodoc", "	:param P:
	:type P: HLRAlgo_Projector &
	:param MST:
	:type MST: BRepTopAdaptor_MapOfShapeTool &
	:param nbIso:
	:type nbIso: Standard_Integer
	:rtype: None
") Fill;
		void Fill (const HLRAlgo_Projector & P,BRepTopAdaptor_MapOfShapeTool & MST,const Standard_Integer nbIso);
};


%feature("shadow") HLRTopoBRep_OutLiner::~HLRTopoBRep_OutLiner %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend HLRTopoBRep_OutLiner {
	void _kill_pointed() {
		delete $self;
	}
};
%extend HLRTopoBRep_OutLiner {
	Handle_HLRTopoBRep_OutLiner GetHandle() {
	return *(Handle_HLRTopoBRep_OutLiner*) &$self;
	}
};

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
    HLRTopoBRep_OutLiner* GetObject() {
    return (HLRTopoBRep_OutLiner*)$self->Access();
    }
};
%feature("shadow") Handle_HLRTopoBRep_OutLiner::~Handle_HLRTopoBRep_OutLiner %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_HLRTopoBRep_OutLiner {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor HLRTopoBRep_VData;
class HLRTopoBRep_VData {
	public:
		%feature("autodoc", "	:rtype: None
") HLRTopoBRep_VData;
		 HLRTopoBRep_VData ();
		%feature("autodoc", "	:param P:
	:type P: float
	:param V:
	:type V: TopoDS_Shape &
	:rtype: None
") HLRTopoBRep_VData;
		 HLRTopoBRep_VData (const Standard_Real P,const TopoDS_Shape & V);
		%feature("autodoc", "	:rtype: float
") Parameter;
		Standard_Real Parameter ();
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Vertex;
		const TopoDS_Shape  Vertex ();
};


%feature("shadow") HLRTopoBRep_VData::~HLRTopoBRep_VData %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend HLRTopoBRep_VData {
	void _kill_pointed() {
		delete $self;
	}
};
