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
%module HLRTopoBRep

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

%include HLRTopoBRep_required_python_modules.i
%include HLRTopoBRep_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%nodefaultctor HLRTopoBRep_DSFiller;
class HLRTopoBRep_DSFiller {
	public:
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	FO(Contap_Contour)
	DS(HLRTopoBRep_Data)
	MST(BRepTopAdaptor_MapOfShapeTool)
	nbIso(Standard_Integer)

Returns:
	static void

Stores in <DS> the outlines of  <S> using the current  
         outliner and stores the isolines in <DS> using a Hatcher.") Insert;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") HLRTopoBRep_Data;
		 HLRTopoBRep_Data ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Clear of all the maps.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Clear of all the data  not needed during and after  
         the hiding process.") Clean;
		void Clean ();
		%feature("autodoc", "Args:
	E(TopoDS_Edge)

Returns:
	Standard_Boolean

Returns True if the Edge is split.") EdgeHasSplE;
		Standard_Boolean EdgeHasSplE (const TopoDS_Edge & E);
		%feature("autodoc", "Args:
	F(TopoDS_Face)

Returns:
	Standard_Boolean

Returns True if the Face has internal outline.") FaceHasIntL;
		Standard_Boolean FaceHasIntL (const TopoDS_Face & F);
		%feature("autodoc", "Args:
	F(TopoDS_Face)

Returns:
	Standard_Boolean

Returns True if the Face has outlines on restriction.") FaceHasOutL;
		Standard_Boolean FaceHasOutL (const TopoDS_Face & F);
		%feature("autodoc", "Args:
	F(TopoDS_Face)

Returns:
	Standard_Boolean

Returns True if the Face has isolines.") FaceHasIsoL;
		Standard_Boolean FaceHasIsoL (const TopoDS_Face & F);
		%feature("autodoc", "Args:
	E1(TopoDS_Edge)
	E2(TopoDS_Edge)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsSplEEdgeEdge;
		Standard_Boolean IsSplEEdgeEdge (const TopoDS_Edge & E1,const TopoDS_Edge & E2);
		%feature("autodoc", "Args:
	F(TopoDS_Face)
	E(TopoDS_Edge)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsIntLFaceEdge;
		Standard_Boolean IsIntLFaceEdge (const TopoDS_Face & F,const TopoDS_Edge & E);
		%feature("autodoc", "Args:
	F(TopoDS_Face)
	E(TopoDS_Edge)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsOutLFaceEdge;
		Standard_Boolean IsOutLFaceEdge (const TopoDS_Face & F,const TopoDS_Edge & E);
		%feature("autodoc", "Args:
	F(TopoDS_Face)
	E(TopoDS_Edge)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsIsoLFaceEdge;
		Standard_Boolean IsIsoLFaceEdge (const TopoDS_Face & F,const TopoDS_Edge & E);
		%feature("autodoc", "Args:
	New(TopoDS_Shape)

Returns:
	TopoDS_Shape

No detailed docstring for this function.") NewSOldS;
		TopoDS_Shape NewSOldS (const TopoDS_Shape & New);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)

Returns:
	TopTools_ListOfShape

Returns the list of the edges.") EdgeSplE;
		const TopTools_ListOfShape & EdgeSplE (const TopoDS_Edge & E);
		%feature("autodoc", "Args:
	F(TopoDS_Face)

Returns:
	TopTools_ListOfShape

Returns the list of the internal OutLines.") FaceIntL;
		const TopTools_ListOfShape & FaceIntL (const TopoDS_Face & F);
		%feature("autodoc", "Args:
	F(TopoDS_Face)

Returns:
	TopTools_ListOfShape

Returns the list of the OutLines on restriction.") FaceOutL;
		const TopTools_ListOfShape & FaceOutL (const TopoDS_Face & F);
		%feature("autodoc", "Args:
	F(TopoDS_Face)

Returns:
	TopTools_ListOfShape

Returns the list of the IsoLines.") FaceIsoL;
		const TopTools_ListOfShape & FaceIsoL (const TopoDS_Face & F);
		%feature("autodoc", "Args:
	V(TopoDS_Vertex)

Returns:
	Standard_Boolean

Returns  True   if V is  an   outline vertex  on a  
         restriction.") IsOutV;
		Standard_Boolean IsOutV (const TopoDS_Vertex & V);
		%feature("autodoc", "Args:
	V(TopoDS_Vertex)

Returns:
	Standard_Boolean

Returns True if V is an internal outline vertex.") IsIntV;
		Standard_Boolean IsIntV (const TopoDS_Vertex & V);
		%feature("autodoc", "Args:
	NewS(TopoDS_Shape)
	OldS(TopoDS_Shape)

Returns:
	None

No detailed docstring for this function.") AddOldS;
		void AddOldS (const TopoDS_Shape & NewS,const TopoDS_Shape & OldS);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)

Returns:
	TopTools_ListOfShape

No detailed docstring for this function.") AddSplE;
		TopTools_ListOfShape & AddSplE (const TopoDS_Edge & E);
		%feature("autodoc", "Args:
	F(TopoDS_Face)

Returns:
	TopTools_ListOfShape

No detailed docstring for this function.") AddIntL;
		TopTools_ListOfShape & AddIntL (const TopoDS_Face & F);
		%feature("autodoc", "Args:
	F(TopoDS_Face)

Returns:
	TopTools_ListOfShape

No detailed docstring for this function.") AddOutL;
		TopTools_ListOfShape & AddOutL (const TopoDS_Face & F);
		%feature("autodoc", "Args:
	F(TopoDS_Face)

Returns:
	TopTools_ListOfShape

No detailed docstring for this function.") AddIsoL;
		TopTools_ListOfShape & AddIsoL (const TopoDS_Face & F);
		%feature("autodoc", "Args:
	V(TopoDS_Vertex)

Returns:
	None

No detailed docstring for this function.") AddOutV;
		void AddOutV (const TopoDS_Vertex & V);
		%feature("autodoc", "Args:
	V(TopoDS_Vertex)

Returns:
	None

No detailed docstring for this function.") AddIntV;
		void AddIntV (const TopoDS_Vertex & V);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") InitEdge;
		void InitEdge ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") MoreEdge;
		Standard_Boolean MoreEdge ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") NextEdge;
		void NextEdge ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Edge

No detailed docstring for this function.") Edge;
		const TopoDS_Edge & Edge ();
		%feature("autodoc", "Args:
	E(TopoDS_Edge)

Returns:
	None

Start an iteration on the vertices of E.") InitVertex;
		void InitVertex (const TopoDS_Edge & E);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") MoreVertex;
		Standard_Boolean MoreVertex ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") NextVertex;
		void NextVertex ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Vertex

No detailed docstring for this function.") Vertex;
		const TopoDS_Vertex & Vertex ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") Parameter;
		Standard_Real Parameter ();
		%feature("autodoc", "Args:
	V(TopoDS_Vertex)
	P(Standard_Real)

Returns:
	None

Insert before the current position.") InsertBefore;
		void InsertBefore (const TopoDS_Vertex & V,const Standard_Real P);
		%feature("autodoc", "Args:
	V(TopoDS_Vertex)
	P(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Append;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") HLRTopoBRep_DataMapIteratorOfDataMapOfShapeFaceData;
		 HLRTopoBRep_DataMapIteratorOfDataMapOfShapeFaceData ();
		%feature("autodoc", "Args:
	aMap(HLRTopoBRep_DataMapOfShapeFaceData)

Returns:
	None

No detailed docstring for this function.") HLRTopoBRep_DataMapIteratorOfDataMapOfShapeFaceData;
		 HLRTopoBRep_DataMapIteratorOfDataMapOfShapeFaceData (const HLRTopoBRep_DataMapOfShapeFaceData & aMap);
		%feature("autodoc", "Args:
	aMap(HLRTopoBRep_DataMapOfShapeFaceData)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const HLRTopoBRep_DataMapOfShapeFaceData & aMap);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Key;
		const TopoDS_Shape & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	HLRTopoBRep_FaceData

No detailed docstring for this function.") Value;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") HLRTopoBRep_DataMapIteratorOfMapOfShapeListOfVData;
		 HLRTopoBRep_DataMapIteratorOfMapOfShapeListOfVData ();
		%feature("autodoc", "Args:
	aMap(HLRTopoBRep_MapOfShapeListOfVData)

Returns:
	None

No detailed docstring for this function.") HLRTopoBRep_DataMapIteratorOfMapOfShapeListOfVData;
		 HLRTopoBRep_DataMapIteratorOfMapOfShapeListOfVData (const HLRTopoBRep_MapOfShapeListOfVData & aMap);
		%feature("autodoc", "Args:
	aMap(HLRTopoBRep_MapOfShapeListOfVData)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const HLRTopoBRep_MapOfShapeListOfVData & aMap);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Key;
		const TopoDS_Shape & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	HLRTopoBRep_ListOfVData

No detailed docstring for this function.") Value;
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
		%feature("autodoc", "Args:
	K(TopoDS_Shape)
	I(HLRTopoBRep_FaceData)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") HLRTopoBRep_DataMapNodeOfDataMapOfShapeFaceData;
		 HLRTopoBRep_DataMapNodeOfDataMapOfShapeFaceData (const TopoDS_Shape & K,const HLRTopoBRep_FaceData & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Key;
		TopoDS_Shape & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	HLRTopoBRep_FaceData

No detailed docstring for this function.") Value;
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
		%feature("autodoc", "Args:
	K(TopoDS_Shape)
	I(HLRTopoBRep_ListOfVData)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") HLRTopoBRep_DataMapNodeOfMapOfShapeListOfVData;
		 HLRTopoBRep_DataMapNodeOfMapOfShapeListOfVData (const TopoDS_Shape & K,const HLRTopoBRep_ListOfVData & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Key;
		TopoDS_Shape & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	HLRTopoBRep_ListOfVData

No detailed docstring for this function.") Value;
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
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)=1

Returns:
	None

No detailed docstring for this function.") HLRTopoBRep_DataMapOfShapeFaceData;
		 HLRTopoBRep_DataMapOfShapeFaceData (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "Args:
	Other(HLRTopoBRep_DataMapOfShapeFaceData)

Returns:
	HLRTopoBRep_DataMapOfShapeFaceData

No detailed docstring for this function.") Assign;
		HLRTopoBRep_DataMapOfShapeFaceData & Assign (const HLRTopoBRep_DataMapOfShapeFaceData & Other);
		%feature("autodoc", "Args:
	Other(HLRTopoBRep_DataMapOfShapeFaceData)

Returns:
	HLRTopoBRep_DataMapOfShapeFaceData

No detailed docstring for this function.") operator=;
		HLRTopoBRep_DataMapOfShapeFaceData & operator = (const HLRTopoBRep_DataMapOfShapeFaceData & Other);
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	K(TopoDS_Shape)
	I(HLRTopoBRep_FaceData)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Bind;
		Standard_Boolean Bind (const TopoDS_Shape & K,const HLRTopoBRep_FaceData & I);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsBound;
		Standard_Boolean IsBound (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Boolean

No detailed docstring for this function.") UnBind;
		Standard_Boolean UnBind (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	HLRTopoBRep_FaceData

No detailed docstring for this function.") Find;
		const HLRTopoBRep_FaceData & Find (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	HLRTopoBRep_FaceData

No detailed docstring for this function.") ChangeFind;
		HLRTopoBRep_FaceData & ChangeFind (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Address

No detailed docstring for this function.") Find1;
		Standard_Address Find1 (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Address

No detailed docstring for this function.") ChangeFind1;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") HLRTopoBRep_FaceData;
		 HLRTopoBRep_FaceData ();
		%feature("autodoc", "Args:
	None
Returns:
	TopTools_ListOfShape

No detailed docstring for this function.") FaceIntL;
		const TopTools_ListOfShape & FaceIntL ();
		%feature("autodoc", "Args:
	None
Returns:
	TopTools_ListOfShape

No detailed docstring for this function.") FaceOutL;
		const TopTools_ListOfShape & FaceOutL ();
		%feature("autodoc", "Args:
	None
Returns:
	TopTools_ListOfShape

No detailed docstring for this function.") FaceIsoL;
		const TopTools_ListOfShape & FaceIsoL ();
		%feature("autodoc", "Args:
	None
Returns:
	TopTools_ListOfShape

No detailed docstring for this function.") AddIntL;
		TopTools_ListOfShape & AddIntL ();
		%feature("autodoc", "Args:
	None
Returns:
	TopTools_ListOfShape

No detailed docstring for this function.") AddOutL;
		TopTools_ListOfShape & AddOutL ();
		%feature("autodoc", "Args:
	None
Returns:
	TopTools_ListOfShape

No detailed docstring for this function.") AddIsoL;
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
		%feature("autodoc", "Args:
	FI(Standard_Integer)
	F(TopoDS_Face)
	DS(HLRTopoBRep_Data)
	nbIsos(Standard_Integer)

Returns:
	static void

No detailed docstring for this function.") Perform;
		static void Perform (const Standard_Integer FI,const TopoDS_Face & F,HLRTopoBRep_Data & DS,const Standard_Integer nbIsos);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)
	P(gp_Pnt)
	Par(Standard_Real)
	Tol(Standard_Real)
	DS(HLRTopoBRep_Data)

Returns:
	static TopoDS_Vertex

No detailed docstring for this function.") MakeVertex;
		static TopoDS_Vertex MakeVertex (const TopoDS_Edge & E,const gp_Pnt & P,const Standard_Real Par,const Standard_Real Tol,HLRTopoBRep_Data & DS);
		%feature("autodoc", "Args:
	F(TopoDS_Face)
	Iso(Handle_Geom2d_Line)
	V1(TopoDS_Vertex)
	V2(TopoDS_Vertex)
	U1(Standard_Real)
	U2(Standard_Real)
	Tol(Standard_Real)
	DS(HLRTopoBRep_Data)

Returns:
	static void

No detailed docstring for this function.") MakeIsoLine;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") HLRTopoBRep_ListIteratorOfListOfVData;
		 HLRTopoBRep_ListIteratorOfListOfVData ();
		%feature("autodoc", "Args:
	L(HLRTopoBRep_ListOfVData)

Returns:
	None

No detailed docstring for this function.") HLRTopoBRep_ListIteratorOfListOfVData;
		 HLRTopoBRep_ListIteratorOfListOfVData (const HLRTopoBRep_ListOfVData & L);
		%feature("autodoc", "Args:
	L(HLRTopoBRep_ListOfVData)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const HLRTopoBRep_ListOfVData & L);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") More;
		Standard_Boolean More ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Next;
		void Next ();
		%feature("autodoc", "Args:
	None
Returns:
	HLRTopoBRep_VData

No detailed docstring for this function.") Value;
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
		%feature("autodoc", "Args:
	I(HLRTopoBRep_VData)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") HLRTopoBRep_ListNodeOfListOfVData;
		 HLRTopoBRep_ListNodeOfListOfVData (const HLRTopoBRep_VData & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "Args:
	None
Returns:
	HLRTopoBRep_VData

No detailed docstring for this function.") Value;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") HLRTopoBRep_ListOfVData;
		 HLRTopoBRep_ListOfVData ();
		%feature("autodoc", "Args:
	Other(HLRTopoBRep_ListOfVData)

Returns:
	None

No detailed docstring for this function.") Assign;
		void Assign (const HLRTopoBRep_ListOfVData & Other);
		%feature("autodoc", "Args:
	Other(HLRTopoBRep_ListOfVData)

Returns:
	None

No detailed docstring for this function.") operator=;
		void operator = (const HLRTopoBRep_ListOfVData & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Extent;
		Standard_Integer Extent ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "Args:
	I(HLRTopoBRep_VData)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const HLRTopoBRep_VData & I);
		%feature("autodoc", "Args:
	I(HLRTopoBRep_VData)
	theIt(HLRTopoBRep_ListIteratorOfListOfVData)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const HLRTopoBRep_VData & I,HLRTopoBRep_ListIteratorOfListOfVData & theIt);
		%feature("autodoc", "Args:
	Other(HLRTopoBRep_ListOfVData)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (HLRTopoBRep_ListOfVData & Other);
		%feature("autodoc", "Args:
	I(HLRTopoBRep_VData)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const HLRTopoBRep_VData & I);
		%feature("autodoc", "Args:
	I(HLRTopoBRep_VData)
	theIt(HLRTopoBRep_ListIteratorOfListOfVData)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const HLRTopoBRep_VData & I,HLRTopoBRep_ListIteratorOfListOfVData & theIt);
		%feature("autodoc", "Args:
	Other(HLRTopoBRep_ListOfVData)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (HLRTopoBRep_ListOfVData & Other);
		%feature("autodoc", "Args:
	None
Returns:
	HLRTopoBRep_VData

No detailed docstring for this function.") First;
		HLRTopoBRep_VData & First ();
		%feature("autodoc", "Args:
	None
Returns:
	HLRTopoBRep_VData

No detailed docstring for this function.") Last;
		HLRTopoBRep_VData & Last ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") RemoveFirst;
		void RemoveFirst ();
		%feature("autodoc", "Args:
	It(HLRTopoBRep_ListIteratorOfListOfVData)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (HLRTopoBRep_ListIteratorOfListOfVData & It);
		%feature("autodoc", "Args:
	I(HLRTopoBRep_VData)
	It(HLRTopoBRep_ListIteratorOfListOfVData)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const HLRTopoBRep_VData & I,HLRTopoBRep_ListIteratorOfListOfVData & It);
		%feature("autodoc", "Args:
	Other(HLRTopoBRep_ListOfVData)
	It(HLRTopoBRep_ListIteratorOfListOfVData)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (HLRTopoBRep_ListOfVData & Other,HLRTopoBRep_ListIteratorOfListOfVData & It);
		%feature("autodoc", "Args:
	I(HLRTopoBRep_VData)
	It(HLRTopoBRep_ListIteratorOfListOfVData)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const HLRTopoBRep_VData & I,HLRTopoBRep_ListIteratorOfListOfVData & It);
		%feature("autodoc", "Args:
	Other(HLRTopoBRep_ListOfVData)
	It(HLRTopoBRep_ListIteratorOfListOfVData)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
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
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)=1

Returns:
	None

No detailed docstring for this function.") HLRTopoBRep_MapOfShapeListOfVData;
		 HLRTopoBRep_MapOfShapeListOfVData (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "Args:
	Other(HLRTopoBRep_MapOfShapeListOfVData)

Returns:
	HLRTopoBRep_MapOfShapeListOfVData

No detailed docstring for this function.") Assign;
		HLRTopoBRep_MapOfShapeListOfVData & Assign (const HLRTopoBRep_MapOfShapeListOfVData & Other);
		%feature("autodoc", "Args:
	Other(HLRTopoBRep_MapOfShapeListOfVData)

Returns:
	HLRTopoBRep_MapOfShapeListOfVData

No detailed docstring for this function.") operator=;
		HLRTopoBRep_MapOfShapeListOfVData & operator = (const HLRTopoBRep_MapOfShapeListOfVData & Other);
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	K(TopoDS_Shape)
	I(HLRTopoBRep_ListOfVData)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Bind;
		Standard_Boolean Bind (const TopoDS_Shape & K,const HLRTopoBRep_ListOfVData & I);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsBound;
		Standard_Boolean IsBound (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Boolean

No detailed docstring for this function.") UnBind;
		Standard_Boolean UnBind (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	HLRTopoBRep_ListOfVData

No detailed docstring for this function.") Find;
		const HLRTopoBRep_ListOfVData & Find (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	HLRTopoBRep_ListOfVData

No detailed docstring for this function.") ChangeFind;
		HLRTopoBRep_ListOfVData & ChangeFind (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Address

No detailed docstring for this function.") Find1;
		Standard_Address Find1 (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	Standard_Address

No detailed docstring for this function.") ChangeFind1;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") HLRTopoBRep_OutLiner;
		 HLRTopoBRep_OutLiner ();
		%feature("autodoc", "Args:
	OriSh(TopoDS_Shape)

Returns:
	None

No detailed docstring for this function.") HLRTopoBRep_OutLiner;
		 HLRTopoBRep_OutLiner (const TopoDS_Shape & OriSh);
		%feature("autodoc", "Args:
	OriS(TopoDS_Shape)
	OutS(TopoDS_Shape)

Returns:
	None

No detailed docstring for this function.") HLRTopoBRep_OutLiner;
		 HLRTopoBRep_OutLiner (const TopoDS_Shape & OriS,const TopoDS_Shape & OutS);
		%feature("autodoc", "Args:
	OriS(TopoDS_Shape)

Returns:
	None

No detailed docstring for this function.") OriginalShape;
		void OriginalShape (const TopoDS_Shape & OriS);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") OriginalShape;
		TopoDS_Shape & OriginalShape ();
		%feature("autodoc", "Args:
	OutS(TopoDS_Shape)

Returns:
	None

No detailed docstring for this function.") OutLinedShape;
		void OutLinedShape (const TopoDS_Shape & OutS);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") OutLinedShape;
		TopoDS_Shape & OutLinedShape ();
		%feature("autodoc", "Args:
	None
Returns:
	HLRTopoBRep_Data

No detailed docstring for this function.") DataStructure;
		HLRTopoBRep_Data & DataStructure ();
		%feature("autodoc", "Args:
	P(HLRAlgo_Projector)
	MST(BRepTopAdaptor_MapOfShapeTool)
	nbIso(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Fill;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") HLRTopoBRep_VData;
		 HLRTopoBRep_VData ();
		%feature("autodoc", "Args:
	P(Standard_Real)
	V(TopoDS_Shape)

Returns:
	None

No detailed docstring for this function.") HLRTopoBRep_VData;
		 HLRTopoBRep_VData (const Standard_Real P,const TopoDS_Shape & V);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") Parameter;
		Standard_Real Parameter ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Vertex;
		const TopoDS_Shape & Vertex ();
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
