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
%module (package="OCC") BRepOffset

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

%include BRepOffset_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
enum BRepOffset_Error {
	BRepOffset_NoError = 0,
	BRepOffset_OffsetSurfaceFailed = 1,
	BRepOffset_UnCorrectClosingFace = 2,
	BRepOffset_ExtentFaceFailed = 3,
	BRepOffset_RadiusEqualOffset = 4,
	BRepOffset_UnknownError = 5,
};

enum BRepOffset_Mode {
	BRepOffset_Skin = 0,
	BRepOffset_Pipe = 1,
	BRepOffset_RectoVerso = 2,
};

enum BRepOffset_Status {
	BRepOffset_Good = 0,
	BRepOffset_Reversed = 1,
	BRepOffset_Degenerated = 2,
	BRepOffset_Unknown = 3,
};

enum BRepOffset_Type {
	BRepOffset_Concave = 0,
	BRepOffset_Convex = 1,
	BRepOffset_Tangent = 2,
	BRepOffset_FreeBoundary = 3,
	BRepOffset_Other = 4,
};

/* end public enums declaration */

%rename(brepoffset) BRepOffset;
%nodefaultctor BRepOffset;
class BRepOffset {
	public:
		%feature("autodoc", "Args:
	Surface(Handle_Geom_Surface)
	Offset(Standard_Real)
	Status(BRepOffset_Status)

Returns:
	static Handle_Geom_Surface

returns   the  Offset  surface  computed from  the  
         surface <Surface> at an OffsetDistance <Offset>.  
 
         If possible, this method returns  the real type of  
         the surface ( e.g. An Offset of a plane is a plane).  
 
         If  no particular  case  is detected, the returned  
         surface will have the Type Geom_OffsetSurface.") Surface;
		static Handle_Geom_Surface Surface (const Handle_Geom_Surface & Surface,const Standard_Real Offset,BRepOffset_Status & Status);
};


%feature("shadow") BRepOffset::~BRepOffset %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepOffset {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepOffset_Analyse;
class BRepOffset_Analyse {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") BRepOffset_Analyse;
		 BRepOffset_Analyse ();
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	Angle(Standard_Real)

Returns:
	None

No detailed docstring for this function.") BRepOffset_Analyse;
		 BRepOffset_Analyse (const TopoDS_Shape & S,const Standard_Real Angle);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	Angle(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const TopoDS_Shape & S,const Standard_Real Angle);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	E(TopoDS_Edge)

Returns:
	BRepOffset_ListOfInterval

No detailed docstring for this function.") Type;
		const BRepOffset_ListOfInterval & Type (const TopoDS_Edge & E);
		%feature("autodoc", "Args:
	V(TopoDS_Vertex)
	T(BRepOffset_Type)
	L(TopTools_ListOfShape)

Returns:
	None

Stores in <L> all the edges of Type <T>  
         on the vertex <V>.") Edges;
		void Edges (const TopoDS_Vertex & V,const BRepOffset_Type T,TopTools_ListOfShape & L);
		%feature("autodoc", "Args:
	F(TopoDS_Face)
	T(BRepOffset_Type)
	L(TopTools_ListOfShape)

Returns:
	None

Stores in <L> all the edges of Type <T>  
         on the face <F>.") Edges;
		void Edges (const TopoDS_Face & F,const BRepOffset_Type T,TopTools_ListOfShape & L);
		%feature("autodoc", "Args:
	Edge(TopoDS_Edge)
	Vertex(TopoDS_Vertex)
	Edges(TopTools_ListOfShape)

Returns:
	None

set in <Edges> all  the Edges of <Shape> which are  
         tangent to <Edge> at the vertex <Vertex>.") TangentEdges;
		void TangentEdges (const TopoDS_Edge & Edge,const TopoDS_Vertex & Vertex,TopTools_ListOfShape & Edges);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	Standard_Boolean

No detailed docstring for this function.") HasAncestor;
		Standard_Boolean HasAncestor (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	TopTools_ListOfShape

No detailed docstring for this function.") Ancestors;
		const TopTools_ListOfShape & Ancestors (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	L(TopTools_ListOfShape)
	Type(BRepOffset_Type)

Returns:
	None

Explode in compounds of faces where  
         all the connex edges are of type <Side>") Explode;
		void Explode (TopTools_ListOfShape & L,const BRepOffset_Type Type);
		%feature("autodoc", "Args:
	L(TopTools_ListOfShape)
	Type1(BRepOffset_Type)
	Type2(BRepOffset_Type)

Returns:
	None

Explode in compounds of faces where  
         all the connex edges are of type <Side1> or <Side2>") Explode;
		void Explode (TopTools_ListOfShape & L,const BRepOffset_Type Type1,const BRepOffset_Type Type2);
		%feature("autodoc", "Args:
	Face(TopoDS_Face)
	Co(TopoDS_Compound)
	Map(TopTools_MapOfShape)
	Type(BRepOffset_Type)

Returns:
	None

Add in <CO> the faces of the shell containing <Face>  
         where all the connex edges are of type <Side>.") AddFaces;
		void AddFaces (const TopoDS_Face & Face,TopoDS_Compound & Co,TopTools_MapOfShape & Map,const BRepOffset_Type Type);
		%feature("autodoc", "Args:
	Face(TopoDS_Face)
	Co(TopoDS_Compound)
	Map(TopTools_MapOfShape)
	Type1(BRepOffset_Type)
	Type2(BRepOffset_Type)

Returns:
	None

Add in <CO> the faces of the shell containing <Face>  
         where all the connex edges are of type <Side1> or <Side2>.") AddFaces;
		void AddFaces (const TopoDS_Face & Face,TopoDS_Compound & Co,TopTools_MapOfShape & Map,const BRepOffset_Type Type1,const BRepOffset_Type Type2);
};


%feature("shadow") BRepOffset_Analyse::~BRepOffset_Analyse %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepOffset_Analyse {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepOffset_DataMapIteratorOfDataMapOfShapeListOfInterval;
class BRepOffset_DataMapIteratorOfDataMapOfShapeListOfInterval : public TCollection_BasicMapIterator {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") BRepOffset_DataMapIteratorOfDataMapOfShapeListOfInterval;
		 BRepOffset_DataMapIteratorOfDataMapOfShapeListOfInterval ();
		%feature("autodoc", "Args:
	aMap(BRepOffset_DataMapOfShapeListOfInterval)

Returns:
	None

No detailed docstring for this function.") BRepOffset_DataMapIteratorOfDataMapOfShapeListOfInterval;
		 BRepOffset_DataMapIteratorOfDataMapOfShapeListOfInterval (const BRepOffset_DataMapOfShapeListOfInterval & aMap);
		%feature("autodoc", "Args:
	aMap(BRepOffset_DataMapOfShapeListOfInterval)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const BRepOffset_DataMapOfShapeListOfInterval & aMap);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Key;
		const TopoDS_Shape & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	BRepOffset_ListOfInterval

No detailed docstring for this function.") Value;
		const BRepOffset_ListOfInterval & Value ();
};


%feature("shadow") BRepOffset_DataMapIteratorOfDataMapOfShapeListOfInterval::~BRepOffset_DataMapIteratorOfDataMapOfShapeListOfInterval %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepOffset_DataMapIteratorOfDataMapOfShapeListOfInterval {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepOffset_DataMapIteratorOfDataMapOfShapeMapOfShape;
class BRepOffset_DataMapIteratorOfDataMapOfShapeMapOfShape : public TCollection_BasicMapIterator {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") BRepOffset_DataMapIteratorOfDataMapOfShapeMapOfShape;
		 BRepOffset_DataMapIteratorOfDataMapOfShapeMapOfShape ();
		%feature("autodoc", "Args:
	aMap(BRepOffset_DataMapOfShapeMapOfShape)

Returns:
	None

No detailed docstring for this function.") BRepOffset_DataMapIteratorOfDataMapOfShapeMapOfShape;
		 BRepOffset_DataMapIteratorOfDataMapOfShapeMapOfShape (const BRepOffset_DataMapOfShapeMapOfShape & aMap);
		%feature("autodoc", "Args:
	aMap(BRepOffset_DataMapOfShapeMapOfShape)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const BRepOffset_DataMapOfShapeMapOfShape & aMap);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Key;
		const TopoDS_Shape & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	TopTools_MapOfShape

No detailed docstring for this function.") Value;
		const TopTools_MapOfShape & Value ();
};


%feature("shadow") BRepOffset_DataMapIteratorOfDataMapOfShapeMapOfShape::~BRepOffset_DataMapIteratorOfDataMapOfShapeMapOfShape %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepOffset_DataMapIteratorOfDataMapOfShapeMapOfShape {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepOffset_DataMapIteratorOfDataMapOfShapeOffset;
class BRepOffset_DataMapIteratorOfDataMapOfShapeOffset : public TCollection_BasicMapIterator {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") BRepOffset_DataMapIteratorOfDataMapOfShapeOffset;
		 BRepOffset_DataMapIteratorOfDataMapOfShapeOffset ();
		%feature("autodoc", "Args:
	aMap(BRepOffset_DataMapOfShapeOffset)

Returns:
	None

No detailed docstring for this function.") BRepOffset_DataMapIteratorOfDataMapOfShapeOffset;
		 BRepOffset_DataMapIteratorOfDataMapOfShapeOffset (const BRepOffset_DataMapOfShapeOffset & aMap);
		%feature("autodoc", "Args:
	aMap(BRepOffset_DataMapOfShapeOffset)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const BRepOffset_DataMapOfShapeOffset & aMap);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Key;
		const TopoDS_Shape & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	BRepOffset_Offset

No detailed docstring for this function.") Value;
		const BRepOffset_Offset & Value ();
};


%feature("shadow") BRepOffset_DataMapIteratorOfDataMapOfShapeOffset::~BRepOffset_DataMapIteratorOfDataMapOfShapeOffset %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepOffset_DataMapIteratorOfDataMapOfShapeOffset {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepOffset_DataMapNodeOfDataMapOfShapeListOfInterval;
class BRepOffset_DataMapNodeOfDataMapOfShapeListOfInterval : public TCollection_MapNode {
	public:
		%feature("autodoc", "Args:
	K(TopoDS_Shape)
	I(BRepOffset_ListOfInterval)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") BRepOffset_DataMapNodeOfDataMapOfShapeListOfInterval;
		 BRepOffset_DataMapNodeOfDataMapOfShapeListOfInterval (const TopoDS_Shape & K,const BRepOffset_ListOfInterval & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Key;
		TopoDS_Shape & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	BRepOffset_ListOfInterval

No detailed docstring for this function.") Value;
		BRepOffset_ListOfInterval & Value ();
};


%feature("shadow") BRepOffset_DataMapNodeOfDataMapOfShapeListOfInterval::~BRepOffset_DataMapNodeOfDataMapOfShapeListOfInterval %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepOffset_DataMapNodeOfDataMapOfShapeListOfInterval {
	void _kill_pointed() {
		delete $self;
	}
};
%extend BRepOffset_DataMapNodeOfDataMapOfShapeListOfInterval {
	Handle_BRepOffset_DataMapNodeOfDataMapOfShapeListOfInterval GetHandle() {
	return *(Handle_BRepOffset_DataMapNodeOfDataMapOfShapeListOfInterval*) &$self;
	}
};

%nodefaultctor Handle_BRepOffset_DataMapNodeOfDataMapOfShapeListOfInterval;
class Handle_BRepOffset_DataMapNodeOfDataMapOfShapeListOfInterval : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_BRepOffset_DataMapNodeOfDataMapOfShapeListOfInterval();
        Handle_BRepOffset_DataMapNodeOfDataMapOfShapeListOfInterval(const Handle_BRepOffset_DataMapNodeOfDataMapOfShapeListOfInterval &aHandle);
        Handle_BRepOffset_DataMapNodeOfDataMapOfShapeListOfInterval(const BRepOffset_DataMapNodeOfDataMapOfShapeListOfInterval *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BRepOffset_DataMapNodeOfDataMapOfShapeListOfInterval DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BRepOffset_DataMapNodeOfDataMapOfShapeListOfInterval {
    BRepOffset_DataMapNodeOfDataMapOfShapeListOfInterval* GetObject() {
    return (BRepOffset_DataMapNodeOfDataMapOfShapeListOfInterval*)$self->Access();
    }
};
%feature("shadow") Handle_BRepOffset_DataMapNodeOfDataMapOfShapeListOfInterval::~Handle_BRepOffset_DataMapNodeOfDataMapOfShapeListOfInterval %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_BRepOffset_DataMapNodeOfDataMapOfShapeListOfInterval {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor BRepOffset_DataMapNodeOfDataMapOfShapeMapOfShape;
class BRepOffset_DataMapNodeOfDataMapOfShapeMapOfShape : public TCollection_MapNode {
	public:
		%feature("autodoc", "Args:
	K(TopoDS_Shape)
	I(TopTools_MapOfShape)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") BRepOffset_DataMapNodeOfDataMapOfShapeMapOfShape;
		 BRepOffset_DataMapNodeOfDataMapOfShapeMapOfShape (const TopoDS_Shape & K,const TopTools_MapOfShape & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Key;
		TopoDS_Shape & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	TopTools_MapOfShape

No detailed docstring for this function.") Value;
		TopTools_MapOfShape & Value ();
};


%feature("shadow") BRepOffset_DataMapNodeOfDataMapOfShapeMapOfShape::~BRepOffset_DataMapNodeOfDataMapOfShapeMapOfShape %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepOffset_DataMapNodeOfDataMapOfShapeMapOfShape {
	void _kill_pointed() {
		delete $self;
	}
};
%extend BRepOffset_DataMapNodeOfDataMapOfShapeMapOfShape {
	Handle_BRepOffset_DataMapNodeOfDataMapOfShapeMapOfShape GetHandle() {
	return *(Handle_BRepOffset_DataMapNodeOfDataMapOfShapeMapOfShape*) &$self;
	}
};

%nodefaultctor Handle_BRepOffset_DataMapNodeOfDataMapOfShapeMapOfShape;
class Handle_BRepOffset_DataMapNodeOfDataMapOfShapeMapOfShape : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_BRepOffset_DataMapNodeOfDataMapOfShapeMapOfShape();
        Handle_BRepOffset_DataMapNodeOfDataMapOfShapeMapOfShape(const Handle_BRepOffset_DataMapNodeOfDataMapOfShapeMapOfShape &aHandle);
        Handle_BRepOffset_DataMapNodeOfDataMapOfShapeMapOfShape(const BRepOffset_DataMapNodeOfDataMapOfShapeMapOfShape *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BRepOffset_DataMapNodeOfDataMapOfShapeMapOfShape DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BRepOffset_DataMapNodeOfDataMapOfShapeMapOfShape {
    BRepOffset_DataMapNodeOfDataMapOfShapeMapOfShape* GetObject() {
    return (BRepOffset_DataMapNodeOfDataMapOfShapeMapOfShape*)$self->Access();
    }
};
%feature("shadow") Handle_BRepOffset_DataMapNodeOfDataMapOfShapeMapOfShape::~Handle_BRepOffset_DataMapNodeOfDataMapOfShapeMapOfShape %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_BRepOffset_DataMapNodeOfDataMapOfShapeMapOfShape {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor BRepOffset_DataMapNodeOfDataMapOfShapeOffset;
class BRepOffset_DataMapNodeOfDataMapOfShapeOffset : public TCollection_MapNode {
	public:
		%feature("autodoc", "Args:
	K(TopoDS_Shape)
	I(BRepOffset_Offset)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") BRepOffset_DataMapNodeOfDataMapOfShapeOffset;
		 BRepOffset_DataMapNodeOfDataMapOfShapeOffset (const TopoDS_Shape & K,const BRepOffset_Offset & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Key;
		TopoDS_Shape & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	BRepOffset_Offset

No detailed docstring for this function.") Value;
		BRepOffset_Offset & Value ();
};


%feature("shadow") BRepOffset_DataMapNodeOfDataMapOfShapeOffset::~BRepOffset_DataMapNodeOfDataMapOfShapeOffset %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepOffset_DataMapNodeOfDataMapOfShapeOffset {
	void _kill_pointed() {
		delete $self;
	}
};
%extend BRepOffset_DataMapNodeOfDataMapOfShapeOffset {
	Handle_BRepOffset_DataMapNodeOfDataMapOfShapeOffset GetHandle() {
	return *(Handle_BRepOffset_DataMapNodeOfDataMapOfShapeOffset*) &$self;
	}
};

%nodefaultctor Handle_BRepOffset_DataMapNodeOfDataMapOfShapeOffset;
class Handle_BRepOffset_DataMapNodeOfDataMapOfShapeOffset : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_BRepOffset_DataMapNodeOfDataMapOfShapeOffset();
        Handle_BRepOffset_DataMapNodeOfDataMapOfShapeOffset(const Handle_BRepOffset_DataMapNodeOfDataMapOfShapeOffset &aHandle);
        Handle_BRepOffset_DataMapNodeOfDataMapOfShapeOffset(const BRepOffset_DataMapNodeOfDataMapOfShapeOffset *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BRepOffset_DataMapNodeOfDataMapOfShapeOffset DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BRepOffset_DataMapNodeOfDataMapOfShapeOffset {
    BRepOffset_DataMapNodeOfDataMapOfShapeOffset* GetObject() {
    return (BRepOffset_DataMapNodeOfDataMapOfShapeOffset*)$self->Access();
    }
};
%feature("shadow") Handle_BRepOffset_DataMapNodeOfDataMapOfShapeOffset::~Handle_BRepOffset_DataMapNodeOfDataMapOfShapeOffset %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_BRepOffset_DataMapNodeOfDataMapOfShapeOffset {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor BRepOffset_DataMapOfShapeListOfInterval;
class BRepOffset_DataMapOfShapeListOfInterval : public TCollection_BasicMap {
	public:
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)=1

Returns:
	None

No detailed docstring for this function.") BRepOffset_DataMapOfShapeListOfInterval;
		 BRepOffset_DataMapOfShapeListOfInterval (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "Args:
	Other(BRepOffset_DataMapOfShapeListOfInterval)

Returns:
	BRepOffset_DataMapOfShapeListOfInterval

No detailed docstring for this function.") Assign;
		BRepOffset_DataMapOfShapeListOfInterval & Assign (const BRepOffset_DataMapOfShapeListOfInterval & Other);
		%feature("autodoc", "Args:
	Other(BRepOffset_DataMapOfShapeListOfInterval)

Returns:
	BRepOffset_DataMapOfShapeListOfInterval

No detailed docstring for this function.") operator=;
		BRepOffset_DataMapOfShapeListOfInterval & operator = (const BRepOffset_DataMapOfShapeListOfInterval & Other);
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
	I(BRepOffset_ListOfInterval)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Bind;
		Standard_Boolean Bind (const TopoDS_Shape & K,const BRepOffset_ListOfInterval & I);
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
	BRepOffset_ListOfInterval

No detailed docstring for this function.") Find;
		const BRepOffset_ListOfInterval & Find (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	BRepOffset_ListOfInterval

No detailed docstring for this function.") ChangeFind;
		BRepOffset_ListOfInterval & ChangeFind (const TopoDS_Shape & K);
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


%feature("shadow") BRepOffset_DataMapOfShapeListOfInterval::~BRepOffset_DataMapOfShapeListOfInterval %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepOffset_DataMapOfShapeListOfInterval {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepOffset_DataMapOfShapeMapOfShape;
class BRepOffset_DataMapOfShapeMapOfShape : public TCollection_BasicMap {
	public:
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)=1

Returns:
	None

No detailed docstring for this function.") BRepOffset_DataMapOfShapeMapOfShape;
		 BRepOffset_DataMapOfShapeMapOfShape (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "Args:
	Other(BRepOffset_DataMapOfShapeMapOfShape)

Returns:
	BRepOffset_DataMapOfShapeMapOfShape

No detailed docstring for this function.") Assign;
		BRepOffset_DataMapOfShapeMapOfShape & Assign (const BRepOffset_DataMapOfShapeMapOfShape & Other);
		%feature("autodoc", "Args:
	Other(BRepOffset_DataMapOfShapeMapOfShape)

Returns:
	BRepOffset_DataMapOfShapeMapOfShape

No detailed docstring for this function.") operator=;
		BRepOffset_DataMapOfShapeMapOfShape & operator = (const BRepOffset_DataMapOfShapeMapOfShape & Other);
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
	I(TopTools_MapOfShape)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Bind;
		Standard_Boolean Bind (const TopoDS_Shape & K,const TopTools_MapOfShape & I);
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
	TopTools_MapOfShape

No detailed docstring for this function.") Find;
		const TopTools_MapOfShape & Find (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	TopTools_MapOfShape

No detailed docstring for this function.") ChangeFind;
		TopTools_MapOfShape & ChangeFind (const TopoDS_Shape & K);
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


%feature("shadow") BRepOffset_DataMapOfShapeMapOfShape::~BRepOffset_DataMapOfShapeMapOfShape %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepOffset_DataMapOfShapeMapOfShape {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepOffset_DataMapOfShapeOffset;
class BRepOffset_DataMapOfShapeOffset : public TCollection_BasicMap {
	public:
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)=1

Returns:
	None

No detailed docstring for this function.") BRepOffset_DataMapOfShapeOffset;
		 BRepOffset_DataMapOfShapeOffset (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "Args:
	Other(BRepOffset_DataMapOfShapeOffset)

Returns:
	BRepOffset_DataMapOfShapeOffset

No detailed docstring for this function.") Assign;
		BRepOffset_DataMapOfShapeOffset & Assign (const BRepOffset_DataMapOfShapeOffset & Other);
		%feature("autodoc", "Args:
	Other(BRepOffset_DataMapOfShapeOffset)

Returns:
	BRepOffset_DataMapOfShapeOffset

No detailed docstring for this function.") operator=;
		BRepOffset_DataMapOfShapeOffset & operator = (const BRepOffset_DataMapOfShapeOffset & Other);
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
	I(BRepOffset_Offset)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Bind;
		Standard_Boolean Bind (const TopoDS_Shape & K,const BRepOffset_Offset & I);
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
	BRepOffset_Offset

No detailed docstring for this function.") Find;
		const BRepOffset_Offset & Find (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	BRepOffset_Offset

No detailed docstring for this function.") ChangeFind;
		BRepOffset_Offset & ChangeFind (const TopoDS_Shape & K);
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


%feature("shadow") BRepOffset_DataMapOfShapeOffset::~BRepOffset_DataMapOfShapeOffset %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepOffset_DataMapOfShapeOffset {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepOffset_Inter2d;
class BRepOffset_Inter2d {
	public:
		%feature("autodoc", "Args:
	AsDes(Handle_BRepAlgo_AsDes)
	F(TopoDS_Face)
	NewEdges(TopTools_IndexedMapOfShape)
	Tol(Standard_Real)

Returns:
	static void

Computes the intersections between the edges stored  
         is AsDes as descendants of <F> . Intersections is computed  
         between two edges if one of them is bound in NewEdges.") Compute;
		static void Compute (const Handle_BRepAlgo_AsDes & AsDes,const TopoDS_Face & F,const TopTools_IndexedMapOfShape & NewEdges,const Standard_Real Tol);
		%feature("autodoc", "Args:
	FI(TopoDS_Face)
	OFI(BRepOffset_Offset)
	MES(TopTools_DataMapOfShapeShape)
	Build(TopTools_DataMapOfShapeShape)
	AsDes(Handle_BRepAlgo_AsDes)
	Offset(Standard_Real)
	Tol(Standard_Real)

Returns:
	static void

No detailed docstring for this function.") ConnexIntByInt;
		static void ConnexIntByInt (const TopoDS_Face & FI,BRepOffset_Offset & OFI,TopTools_DataMapOfShapeShape & MES,const TopTools_DataMapOfShapeShape & Build,const Handle_BRepAlgo_AsDes & AsDes,const Standard_Real Offset,const Standard_Real Tol);
};


%feature("shadow") BRepOffset_Inter2d::~BRepOffset_Inter2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepOffset_Inter2d {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepOffset_Inter3d;
class BRepOffset_Inter3d {
	public:
		%feature("autodoc", "Args:
	AsDes(Handle_BRepAlgo_AsDes)
	Side(TopAbs_State)
	Tol(Standard_Real)

Returns:
	None

No detailed docstring for this function.") BRepOffset_Inter3d;
		 BRepOffset_Inter3d (const Handle_BRepAlgo_AsDes & AsDes,const TopAbs_State Side,const Standard_Real Tol);
		%feature("autodoc", "Args:
	SetOfFaces(TopTools_ListOfShape)
	InitOffsetFace(BRepAlgo_Image)

Returns:
	None

No detailed docstring for this function.") CompletInt;
		void CompletInt (const TopTools_ListOfShape & SetOfFaces,const BRepAlgo_Image & InitOffsetFace);
		%feature("autodoc", "Args:
	F1(TopoDS_Face)
	F2(TopoDS_Face)
	InitOffsetFace(BRepAlgo_Image)

Returns:
	None

No detailed docstring for this function.") FaceInter;
		void FaceInter (const TopoDS_Face & F1,const TopoDS_Face & F2,const BRepAlgo_Image & InitOffsetFace);
		%feature("autodoc", "Args:
	SetOfFaces(TopTools_ListOfShape)
	ShapeInit(TopoDS_Shape)
	Analyse(BRepOffset_Analyse)
	InitOffsetFace(BRepAlgo_Image)

Returns:
	None

No detailed docstring for this function.") ConnexIntByArc;
		void ConnexIntByArc (const TopTools_ListOfShape & SetOfFaces,const TopoDS_Shape & ShapeInit,const BRepOffset_Analyse & Analyse,const BRepAlgo_Image & InitOffsetFace);
		%feature("autodoc", "Args:
	SI(TopoDS_Shape)
	MapSF(BRepOffset_DataMapOfShapeOffset)
	A(BRepOffset_Analyse)
	MES(TopTools_DataMapOfShapeShape)
	Build(TopTools_DataMapOfShapeShape)
	Failed(TopTools_ListOfShape)

Returns:
	None

No detailed docstring for this function.") ConnexIntByInt;
		void ConnexIntByInt (const TopoDS_Shape & SI,const BRepOffset_DataMapOfShapeOffset & MapSF,const BRepOffset_Analyse & A,TopTools_DataMapOfShapeShape & MES,TopTools_DataMapOfShapeShape & Build,TopTools_ListOfShape & Failed);
		%feature("autodoc", "Args:
	ContextFaces(TopTools_IndexedMapOfShape)
	ExtentContext(Standard_Boolean)
	MapSF(BRepOffset_DataMapOfShapeOffset)
	A(BRepOffset_Analyse)
	MES(TopTools_DataMapOfShapeShape)
	Build(TopTools_DataMapOfShapeShape)
	Failed(TopTools_ListOfShape)

Returns:
	None

No detailed docstring for this function.") ContextIntByInt;
		void ContextIntByInt (const TopTools_IndexedMapOfShape & ContextFaces,const Standard_Boolean ExtentContext,const BRepOffset_DataMapOfShapeOffset & MapSF,const BRepOffset_Analyse & A,TopTools_DataMapOfShapeShape & MES,TopTools_DataMapOfShapeShape & Build,TopTools_ListOfShape & Failed);
		%feature("autodoc", "Args:
	ContextFaces(TopTools_IndexedMapOfShape)
	ExtentContext(Standard_Boolean)
	Analyse(BRepOffset_Analyse)
	InitOffsetFace(BRepAlgo_Image)
	InitOffsetEdge(BRepAlgo_Image)

Returns:
	None

No detailed docstring for this function.") ContextIntByArc;
		void ContextIntByArc (const TopTools_IndexedMapOfShape & ContextFaces,const Standard_Boolean ExtentContext,const BRepOffset_Analyse & Analyse,const BRepAlgo_Image & InitOffsetFace,BRepAlgo_Image & InitOffsetEdge);
		%feature("autodoc", "Args:
	SetOfFaces(TopTools_ListOfShape)

Returns:
	None

No detailed docstring for this function.") AddCommonEdges;
		void AddCommonEdges (const TopTools_ListOfShape & SetOfFaces);
		%feature("autodoc", "Args:
	F1(TopoDS_Face)
	F2(TopoDS_Face)

Returns:
	None

No detailed docstring for this function.") SetDone;
		void SetDone (const TopoDS_Face & F1,const TopoDS_Face & F2);
		%feature("autodoc", "Args:
	F1(TopoDS_Face)
	F2(TopoDS_Face)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsDone;
		Standard_Boolean IsDone (const TopoDS_Face & F1,const TopoDS_Face & F2);
		%feature("autodoc", "Args:
	None
Returns:
	TopTools_IndexedMapOfShape

No detailed docstring for this function.") TouchedFaces;
		TopTools_IndexedMapOfShape & TouchedFaces ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_BRepAlgo_AsDes

No detailed docstring for this function.") AsDes;
		Handle_BRepAlgo_AsDes AsDes ();
		%feature("autodoc", "Args:
	None
Returns:
	TopTools_IndexedMapOfShape

No detailed docstring for this function.") NewEdges;
		TopTools_IndexedMapOfShape & NewEdges ();
};


%feature("shadow") BRepOffset_Inter3d::~BRepOffset_Inter3d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepOffset_Inter3d {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepOffset_Interval;
class BRepOffset_Interval {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") BRepOffset_Interval;
		 BRepOffset_Interval ();
		%feature("autodoc", "Args:
	U1(Standard_Real)
	U2(Standard_Real)
	Type(BRepOffset_Type)

Returns:
	None

No detailed docstring for this function.") BRepOffset_Interval;
		 BRepOffset_Interval (const Standard_Real U1,const Standard_Real U2,const BRepOffset_Type Type);
		%feature("autodoc", "Args:
	U(Standard_Real)

Returns:
	None

No detailed docstring for this function.") First;
		void First (const Standard_Real U);
		%feature("autodoc", "Args:
	U(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Last;
		void Last (const Standard_Real U);
		%feature("autodoc", "Args:
	T(BRepOffset_Type)

Returns:
	None

No detailed docstring for this function.") Type;
		void Type (const BRepOffset_Type T);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") First;
		Standard_Real First ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") Last;
		Standard_Real Last ();
		%feature("autodoc", "Args:
	None
Returns:
	BRepOffset_Type

No detailed docstring for this function.") Type;
		BRepOffset_Type Type ();
};


%feature("shadow") BRepOffset_Interval::~BRepOffset_Interval %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepOffset_Interval {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepOffset_ListIteratorOfListOfInterval;
class BRepOffset_ListIteratorOfListOfInterval {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") BRepOffset_ListIteratorOfListOfInterval;
		 BRepOffset_ListIteratorOfListOfInterval ();
		%feature("autodoc", "Args:
	L(BRepOffset_ListOfInterval)

Returns:
	None

No detailed docstring for this function.") BRepOffset_ListIteratorOfListOfInterval;
		 BRepOffset_ListIteratorOfListOfInterval (const BRepOffset_ListOfInterval & L);
		%feature("autodoc", "Args:
	L(BRepOffset_ListOfInterval)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const BRepOffset_ListOfInterval & L);
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
	BRepOffset_Interval

No detailed docstring for this function.") Value;
		BRepOffset_Interval & Value ();
};


%feature("shadow") BRepOffset_ListIteratorOfListOfInterval::~BRepOffset_ListIteratorOfListOfInterval %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepOffset_ListIteratorOfListOfInterval {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepOffset_ListNodeOfListOfInterval;
class BRepOffset_ListNodeOfListOfInterval : public TCollection_MapNode {
	public:
		%feature("autodoc", "Args:
	I(BRepOffset_Interval)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") BRepOffset_ListNodeOfListOfInterval;
		 BRepOffset_ListNodeOfListOfInterval (const BRepOffset_Interval & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "Args:
	None
Returns:
	BRepOffset_Interval

No detailed docstring for this function.") Value;
		BRepOffset_Interval & Value ();
};


%feature("shadow") BRepOffset_ListNodeOfListOfInterval::~BRepOffset_ListNodeOfListOfInterval %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepOffset_ListNodeOfListOfInterval {
	void _kill_pointed() {
		delete $self;
	}
};
%extend BRepOffset_ListNodeOfListOfInterval {
	Handle_BRepOffset_ListNodeOfListOfInterval GetHandle() {
	return *(Handle_BRepOffset_ListNodeOfListOfInterval*) &$self;
	}
};

%nodefaultctor Handle_BRepOffset_ListNodeOfListOfInterval;
class Handle_BRepOffset_ListNodeOfListOfInterval : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_BRepOffset_ListNodeOfListOfInterval();
        Handle_BRepOffset_ListNodeOfListOfInterval(const Handle_BRepOffset_ListNodeOfListOfInterval &aHandle);
        Handle_BRepOffset_ListNodeOfListOfInterval(const BRepOffset_ListNodeOfListOfInterval *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BRepOffset_ListNodeOfListOfInterval DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BRepOffset_ListNodeOfListOfInterval {
    BRepOffset_ListNodeOfListOfInterval* GetObject() {
    return (BRepOffset_ListNodeOfListOfInterval*)$self->Access();
    }
};
%feature("shadow") Handle_BRepOffset_ListNodeOfListOfInterval::~Handle_BRepOffset_ListNodeOfListOfInterval %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_BRepOffset_ListNodeOfListOfInterval {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor BRepOffset_ListOfInterval;
class BRepOffset_ListOfInterval {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") BRepOffset_ListOfInterval;
		 BRepOffset_ListOfInterval ();
		%feature("autodoc", "Args:
	Other(BRepOffset_ListOfInterval)

Returns:
	None

No detailed docstring for this function.") Assign;
		void Assign (const BRepOffset_ListOfInterval & Other);
		%feature("autodoc", "Args:
	Other(BRepOffset_ListOfInterval)

Returns:
	None

No detailed docstring for this function.") operator=;
		void operator = (const BRepOffset_ListOfInterval & Other);
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
	I(BRepOffset_Interval)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const BRepOffset_Interval & I);
		%feature("autodoc", "Args:
	I(BRepOffset_Interval)
	theIt(BRepOffset_ListIteratorOfListOfInterval)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const BRepOffset_Interval & I,BRepOffset_ListIteratorOfListOfInterval & theIt);
		%feature("autodoc", "Args:
	Other(BRepOffset_ListOfInterval)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (BRepOffset_ListOfInterval & Other);
		%feature("autodoc", "Args:
	I(BRepOffset_Interval)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const BRepOffset_Interval & I);
		%feature("autodoc", "Args:
	I(BRepOffset_Interval)
	theIt(BRepOffset_ListIteratorOfListOfInterval)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const BRepOffset_Interval & I,BRepOffset_ListIteratorOfListOfInterval & theIt);
		%feature("autodoc", "Args:
	Other(BRepOffset_ListOfInterval)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (BRepOffset_ListOfInterval & Other);
		%feature("autodoc", "Args:
	None
Returns:
	BRepOffset_Interval

No detailed docstring for this function.") First;
		BRepOffset_Interval & First ();
		%feature("autodoc", "Args:
	None
Returns:
	BRepOffset_Interval

No detailed docstring for this function.") Last;
		BRepOffset_Interval & Last ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") RemoveFirst;
		void RemoveFirst ();
		%feature("autodoc", "Args:
	It(BRepOffset_ListIteratorOfListOfInterval)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (BRepOffset_ListIteratorOfListOfInterval & It);
		%feature("autodoc", "Args:
	I(BRepOffset_Interval)
	It(BRepOffset_ListIteratorOfListOfInterval)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const BRepOffset_Interval & I,BRepOffset_ListIteratorOfListOfInterval & It);
		%feature("autodoc", "Args:
	Other(BRepOffset_ListOfInterval)
	It(BRepOffset_ListIteratorOfListOfInterval)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (BRepOffset_ListOfInterval & Other,BRepOffset_ListIteratorOfListOfInterval & It);
		%feature("autodoc", "Args:
	I(BRepOffset_Interval)
	It(BRepOffset_ListIteratorOfListOfInterval)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const BRepOffset_Interval & I,BRepOffset_ListIteratorOfListOfInterval & It);
		%feature("autodoc", "Args:
	Other(BRepOffset_ListOfInterval)
	It(BRepOffset_ListIteratorOfListOfInterval)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (BRepOffset_ListOfInterval & Other,BRepOffset_ListIteratorOfListOfInterval & It);
};


%feature("shadow") BRepOffset_ListOfInterval::~BRepOffset_ListOfInterval %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepOffset_ListOfInterval {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepOffset_MakeLoops;
class BRepOffset_MakeLoops {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") BRepOffset_MakeLoops;
		 BRepOffset_MakeLoops ();
		%feature("autodoc", "Args:
	LF(TopTools_ListOfShape)
	AsDes(Handle_BRepAlgo_AsDes)
	Image(BRepAlgo_Image)

Returns:
	None

No detailed docstring for this function.") Build;
		void Build (const TopTools_ListOfShape & LF,const Handle_BRepAlgo_AsDes & AsDes,BRepAlgo_Image & Image);
		%feature("autodoc", "Args:
	LContext(TopTools_ListOfShape)
	Analyse(BRepOffset_Analyse)
	AsDes(Handle_BRepAlgo_AsDes)
	Image(BRepAlgo_Image)
	InSide(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") BuildOnContext;
		void BuildOnContext (const TopTools_ListOfShape & LContext,const BRepOffset_Analyse & Analyse,const Handle_BRepAlgo_AsDes & AsDes,BRepAlgo_Image & Image,const Standard_Boolean InSide);
		%feature("autodoc", "Args:
	LF(TopTools_ListOfShape)
	AsDes(Handle_BRepAlgo_AsDes)
	Image(BRepAlgo_Image)

Returns:
	None

No detailed docstring for this function.") BuildFaces;
		void BuildFaces (const TopTools_ListOfShape & LF,const Handle_BRepAlgo_AsDes & AsDes,BRepAlgo_Image & Image);
};


%feature("shadow") BRepOffset_MakeLoops::~BRepOffset_MakeLoops %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepOffset_MakeLoops {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepOffset_MakeOffset;
class BRepOffset_MakeOffset {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") BRepOffset_MakeOffset;
		 BRepOffset_MakeOffset ();
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	Offset(Standard_Real)
	Tol(Standard_Real)
	Mode(BRepOffset_Mode)=BRepOffset_Skin
	Intersection(Standard_Boolean)=Standard_False
	SelfInter(Standard_Boolean)=Standard_False
	Join(GeomAbs_JoinType)=GeomAbs_Arc
	Thickening(Standard_Boolean)=Standard_False

Returns:
	None

No detailed docstring for this function.") BRepOffset_MakeOffset;
		 BRepOffset_MakeOffset (const TopoDS_Shape & S,const Standard_Real Offset,const Standard_Real Tol,const BRepOffset_Mode Mode = BRepOffset_Skin,const Standard_Boolean Intersection = Standard_False,const Standard_Boolean SelfInter = Standard_False,const GeomAbs_JoinType Join = GeomAbs_Arc,const Standard_Boolean Thickening = Standard_False);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	Offset(Standard_Real)
	Tol(Standard_Real)
	Mode(BRepOffset_Mode)=BRepOffset_Skin
	Intersection(Standard_Boolean)=Standard_False
	SelfInter(Standard_Boolean)=Standard_False
	Join(GeomAbs_JoinType)=GeomAbs_Arc
	Thickening(Standard_Boolean)=Standard_False

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const TopoDS_Shape & S,const Standard_Real Offset,const Standard_Real Tol,const BRepOffset_Mode Mode = BRepOffset_Skin,const Standard_Boolean Intersection = Standard_False,const Standard_Boolean SelfInter = Standard_False,const GeomAbs_JoinType Join = GeomAbs_Arc,const Standard_Boolean Thickening = Standard_False);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	F(TopoDS_Face)

Returns:
	None

Add Closing Faces,  <F>  has to be  in  the initial  
         shape S.") AddFace;
		void AddFace (const TopoDS_Face & F);
		%feature("autodoc", "Args:
	F(TopoDS_Face)
	Off(Standard_Real)

Returns:
	None

set the offset <Off> on the Face <F>") SetOffsetOnFace;
		void SetOffsetOnFace (const TopoDS_Face & F,const Standard_Real Off);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") MakeOffsetShape;
		void MakeOffsetShape ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") MakeThickSolid;
		void MakeThickSolid ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Shape;
		const TopoDS_Shape & Shape ();
		%feature("autodoc", "Args:
	None
Returns:
	BRepOffset_Error

returns information if IsDone() = FALSE.") Error;
		BRepOffset_Error Error ();
		%feature("autodoc", "Args:
	None
Returns:
	BRepAlgo_Image

Returns <Image> containing links between initials  
         shapes and offset faces.") OffsetFacesFromShapes;
		const BRepAlgo_Image & OffsetFacesFromShapes ();
		%feature("autodoc", "Args:
	None
Returns:
	GeomAbs_JoinType

Returns myJoin.") GetJoinType;
		GeomAbs_JoinType GetJoinType ();
		%feature("autodoc", "Args:
	None
Returns:
	BRepAlgo_Image

Returns <Image> containing links between initials  
         shapes and offset edges.") OffsetEdgesFromShapes;
		const BRepAlgo_Image & OffsetEdgesFromShapes ();
		%feature("autodoc", "Args:
	None
Returns:
	TopTools_IndexedMapOfShape

Returns the list of closing faces stores by AddFace") ClosingFaces;
		const TopTools_IndexedMapOfShape & ClosingFaces ();
};


%feature("shadow") BRepOffset_MakeOffset::~BRepOffset_MakeOffset %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepOffset_MakeOffset {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepOffset_Offset;
class BRepOffset_Offset {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") BRepOffset_Offset;
		 BRepOffset_Offset ();
		%feature("autodoc", "Args:
	Face(TopoDS_Face)
	Offset(Standard_Real)
	OffsetOutside(Standard_Boolean)=Standard_True
	JoinType(GeomAbs_JoinType)=GeomAbs_Arc

Returns:
	None

No detailed docstring for this function.") BRepOffset_Offset;
		 BRepOffset_Offset (const TopoDS_Face & Face,const Standard_Real Offset,const Standard_Boolean OffsetOutside = Standard_True,const GeomAbs_JoinType JoinType = GeomAbs_Arc);
		%feature("autodoc", "Args:
	Face(TopoDS_Face)
	Offset(Standard_Real)
	Created(TopTools_DataMapOfShapeShape)
	OffsetOutside(Standard_Boolean)=Standard_True
	JoinType(GeomAbs_JoinType)=GeomAbs_Arc

Returns:
	None

This method will be  called when you want to share  
         the  edges  soon generated  from  an other  face.  
         e.g. when two faces are  tangents the common  edge  
         will generate only one edge ( no pipe).  
 
         The Map  will be fill  as  follow:  
 
         Created(E) = E'  
         with: E  = an edge of <Face>  
               E' = the image of E in the offseting  of  
                    another  face  sharing E  with a  
                    continuity at least G1") BRepOffset_Offset;
		 BRepOffset_Offset (const TopoDS_Face & Face,const Standard_Real Offset,const TopTools_DataMapOfShapeShape & Created,const Standard_Boolean OffsetOutside = Standard_True,const GeomAbs_JoinType JoinType = GeomAbs_Arc);
		%feature("autodoc", "Args:
	Path(TopoDS_Edge)
	Edge1(TopoDS_Edge)
	Edge2(TopoDS_Edge)
	Offset(Standard_Real)
	Polynomial(Standard_Boolean)=Standard_False
	Tol(Standard_Real)=1.0e-4
	Conti(GeomAbs_Shape)=GeomAbs_C1

Returns:
	None

No detailed docstring for this function.") BRepOffset_Offset;
		 BRepOffset_Offset (const TopoDS_Edge & Path,const TopoDS_Edge & Edge1,const TopoDS_Edge & Edge2,const Standard_Real Offset,const Standard_Boolean Polynomial = Standard_False,const Standard_Real Tol = 1.0e-4,const GeomAbs_Shape Conti = GeomAbs_C1);
		%feature("autodoc", "Args:
	Path(TopoDS_Edge)
	Edge1(TopoDS_Edge)
	Edge2(TopoDS_Edge)
	Offset(Standard_Real)
	FirstEdge(TopoDS_Edge)
	LastEdge(TopoDS_Edge)
	Polynomial(Standard_Boolean)=Standard_False
	Tol(Standard_Real)=1.0e-4
	Conti(GeomAbs_Shape)=GeomAbs_C1

Returns:
	None

No detailed docstring for this function.") BRepOffset_Offset;
		 BRepOffset_Offset (const TopoDS_Edge & Path,const TopoDS_Edge & Edge1,const TopoDS_Edge & Edge2,const Standard_Real Offset,const TopoDS_Edge & FirstEdge,const TopoDS_Edge & LastEdge,const Standard_Boolean Polynomial = Standard_False,const Standard_Real Tol = 1.0e-4,const GeomAbs_Shape Conti = GeomAbs_C1);
		%feature("autodoc", "Args:
	Vertex(TopoDS_Vertex)
	LEdge(TopTools_ListOfShape)
	Offset(Standard_Real)
	Polynomial(Standard_Boolean)=Standard_False
	Tol(Standard_Real)=1.0e-4
	Conti(GeomAbs_Shape)=GeomAbs_C1

Returns:
	None

Tol and Conti are only used if Polynomial is True  
         (Used to perfrom the approximation)") BRepOffset_Offset;
		 BRepOffset_Offset (const TopoDS_Vertex & Vertex,const TopTools_ListOfShape & LEdge,const Standard_Real Offset,const Standard_Boolean Polynomial = Standard_False,const Standard_Real Tol = 1.0e-4,const GeomAbs_Shape Conti = GeomAbs_C1);
		%feature("autodoc", "Args:
	Face(TopoDS_Face)
	Offset(Standard_Real)
	OffsetOutside(Standard_Boolean)=Standard_True
	JoinType(GeomAbs_JoinType)=GeomAbs_Arc

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const TopoDS_Face & Face,const Standard_Real Offset,const Standard_Boolean OffsetOutside = Standard_True,const GeomAbs_JoinType JoinType = GeomAbs_Arc);
		%feature("autodoc", "Args:
	Face(TopoDS_Face)
	Offset(Standard_Real)
	Created(TopTools_DataMapOfShapeShape)
	OffsetOutside(Standard_Boolean)=Standard_True
	JoinType(GeomAbs_JoinType)=GeomAbs_Arc

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const TopoDS_Face & Face,const Standard_Real Offset,const TopTools_DataMapOfShapeShape & Created,const Standard_Boolean OffsetOutside = Standard_True,const GeomAbs_JoinType JoinType = GeomAbs_Arc);
		%feature("autodoc", "Args:
	Path(TopoDS_Edge)
	Edge1(TopoDS_Edge)
	Edge2(TopoDS_Edge)
	Offset(Standard_Real)
	Polynomial(Standard_Boolean)=Standard_False
	Tol(Standard_Real)=1.0e-4
	Conti(GeomAbs_Shape)=GeomAbs_C1

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const TopoDS_Edge & Path,const TopoDS_Edge & Edge1,const TopoDS_Edge & Edge2,const Standard_Real Offset,const Standard_Boolean Polynomial = Standard_False,const Standard_Real Tol = 1.0e-4,const GeomAbs_Shape Conti = GeomAbs_C1);
		%feature("autodoc", "Args:
	Path(TopoDS_Edge)
	Edge1(TopoDS_Edge)
	Edge2(TopoDS_Edge)
	Offset(Standard_Real)
	FirstEdge(TopoDS_Edge)
	LastEdge(TopoDS_Edge)
	Polynomial(Standard_Boolean)=Standard_False
	Tol(Standard_Real)=1.0e-4
	Conti(GeomAbs_Shape)=GeomAbs_C1

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const TopoDS_Edge & Path,const TopoDS_Edge & Edge1,const TopoDS_Edge & Edge2,const Standard_Real Offset,const TopoDS_Edge & FirstEdge,const TopoDS_Edge & LastEdge,const Standard_Boolean Polynomial = Standard_False,const Standard_Real Tol = 1.0e-4,const GeomAbs_Shape Conti = GeomAbs_C1);
		%feature("autodoc", "Args:
	Vertex(TopoDS_Vertex)
	LEdge(TopTools_ListOfShape)
	Offset(Standard_Real)
	Polynomial(Standard_Boolean)=Standard_False
	Tol(Standard_Real)=1.0e-4
	Conti(GeomAbs_Shape)=GeomAbs_C1

Returns:
	None

Tol and Conti are only used if Polynomial is True  
         (Used to perfrom the approximation)") Init;
		void Init (const TopoDS_Vertex & Vertex,const TopTools_ListOfShape & LEdge,const Standard_Real Offset,const Standard_Boolean Polynomial = Standard_False,const Standard_Real Tol = 1.0e-4,const GeomAbs_Shape Conti = GeomAbs_C1);
		%feature("autodoc", "Args:
	Edge(TopoDS_Edge)
	Offset(Standard_Real)

Returns:
	None

Only used in Rolling Ball. Pipe on Free Boundary") Init;
		void Init (const TopoDS_Edge & Edge,const Standard_Real Offset);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") InitialShape;
		const TopoDS_Shape & InitialShape ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Face

No detailed docstring for this function.") Face;
		const TopoDS_Face & Face ();
		%feature("autodoc", "Args:
	Shape(TopoDS_Shape)

Returns:
	TopoDS_Shape

No detailed docstring for this function.") Generated;
		TopoDS_Shape Generated (const TopoDS_Shape & Shape);
		%feature("autodoc", "Args:
	None
Returns:
	BRepOffset_Status

No detailed docstring for this function.") Status;
		BRepOffset_Status Status ();
};


%feature("shadow") BRepOffset_Offset::~BRepOffset_Offset %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepOffset_Offset {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepOffset_Tool;
class BRepOffset_Tool {
	public:
		%feature("autodoc", "Args:
	E(TopoDS_Edge)
	V1(TopoDS_Vertex)
	V2(TopoDS_Vertex)

Returns:
	static void

<V1> is the FirstVertex ,<V2> is the Last Vertex of <Edge>  
         taking account the orientation of Edge.") EdgeVertices;
		static void EdgeVertices (const TopoDS_Edge & E,TopoDS_Vertex & V1,TopoDS_Vertex & V2);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)
	F(TopoDS_Face)

Returns:
	static TopAbs_Orientation

returns the cumul  of the orientation  of <Edge>  
         and thc containing wire in <Face>") OriEdgeInFace;
		static TopAbs_Orientation OriEdgeInFace (const TopoDS_Edge & E,const TopoDS_Face & F);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)
	F1(TopoDS_Face)
	F2(TopoDS_Face)
	O1(TopAbs_Orientation)
	O2(TopAbs_Orientation)

Returns:
	static void

<E> is a section  between <F1> and <F2>.  Computes  
         <O1> the orientation of <E> in <F1> influenced by <F2>.  
         idem for <O2>.") OrientSection;
		static void OrientSection (const TopoDS_Edge & E,const TopoDS_Face & F1,const TopoDS_Face & F2,TopAbs_Orientation & O1,TopAbs_Orientation & O2);
		%feature("autodoc", "Args:
	F1(TopoDS_Face)
	F2(TopoDS_Face)
	LE(TopTools_ListOfShape)
	LV(TopTools_ListOfShape)

Returns:
	static Standard_Boolean

Returns True if  <F1> and <F2> has common Vertices  
         or edges , <LE> contains the common edges. <LV> the  
         common vertices.") HasCommonShapes;
		static Standard_Boolean HasCommonShapes (const TopoDS_Face & F1,const TopoDS_Face & F2,TopTools_ListOfShape & LE,TopTools_ListOfShape & LV);
		%feature("autodoc", "Args:
	F1(TopoDS_Face)
	F2(TopoDS_Face)
	LInt1(TopTools_ListOfShape)
	LInt2(TopTools_ListOfShape)
	Side(TopAbs_State)
	RefEdge(TopoDS_Edge)
	IsRefEdgeDefined(Standard_Boolean)=Standard_False

Returns:
	static void

Computes the   Section betwwen  <F1> and  <F2> the  
         edges solution   are  stored in <LInt1>  with  the  
         orientation on <F1>, the sames edges are stored in  
         <Lint2> with the orientation on <F2>.") Inter3D;
		static void Inter3D (const TopoDS_Face & F1,const TopoDS_Face & F2,TopTools_ListOfShape & LInt1,TopTools_ListOfShape & LInt2,const TopAbs_State Side,const TopoDS_Edge & RefEdge,const Standard_Boolean IsRefEdgeDefined = Standard_False);
		%feature("autodoc", "Args:
	F1(TopoDS_Face)
	F2(TopoDS_Face)
	Edges(TopTools_ListOfShape)
	LInt1(TopTools_ListOfShape)
	LInt2(TopTools_ListOfShape)
	Side(TopAbs_State)
	TolConf(Standard_Real)

Returns:
	static Standard_Boolean

Find if the edges <Edges> of the face <F2> are on  
         the face <F1>.  
         Set in <LInt1> <LInt2> the updated edges.  
         If all the edges are computed, returns true.") TryProject;
		static Standard_Boolean TryProject (const TopoDS_Face & F1,const TopoDS_Face & F2,const TopTools_ListOfShape & Edges,TopTools_ListOfShape & LInt1,TopTools_ListOfShape & LInt2,const TopAbs_State Side,const Standard_Real TolConf);
		%feature("autodoc", "Args:
	F1(TopoDS_Face)
	F2(TopoDS_Face)
	LInt1(TopTools_ListOfShape)
	LInt2(TopTools_ListOfShape)
	Side(TopAbs_State)

Returns:
	static void

No detailed docstring for this function.") PipeInter;
		static void PipeInter (const TopoDS_Face & F1,const TopoDS_Face & F2,TopTools_ListOfShape & LInt1,TopTools_ListOfShape & LInt2,const TopAbs_State Side);
		%feature("autodoc", "Args:
	F(TopoDS_Face)
	E1(TopoDS_Edge)
	E2(TopoDS_Edge)
	LV(TopTools_ListOfShape)
	Tol(Standard_Real)

Returns:
	static void

No detailed docstring for this function.") Inter2d;
		static void Inter2d (const TopoDS_Face & F,const TopoDS_Edge & E1,const TopoDS_Edge & E2,TopTools_ListOfShape & LV,const Standard_Real Tol);
		%feature("autodoc", "Args:
	F1(TopoDS_Face)
	F2(TopoDS_Face)
	LInt1(TopTools_ListOfShape)
	LInt2(TopTools_ListOfShape)
	Side(TopAbs_State)

Returns:
	static void

No detailed docstring for this function.") InterOrExtent;
		static void InterOrExtent (const TopoDS_Face & F1,const TopoDS_Face & F2,TopTools_ListOfShape & LInt1,TopTools_ListOfShape & LInt2,const TopAbs_State Side);
		%feature("autodoc", "Args:
	F(TopoDS_Face)
	Analyse(BRepOffset_Analyse)
	enlargeU(Standard_Boolean)
	enlargeVfirst(Standard_Boolean)
	enlargeVlast(Standard_Boolean)

Returns:
	static void

No detailed docstring for this function.") CheckBounds;
		static void CheckBounds (const TopoDS_Face & F,const BRepOffset_Analyse & Analyse,Standard_Boolean & enlargeU,Standard_Boolean & enlargeVfirst,Standard_Boolean & enlargeVlast);
		%feature("autodoc", "Args:
	F(TopoDS_Face)
	NF(TopoDS_Face)
	ChangeGeom(Standard_Boolean)
	UpDatePCurve(Standard_Boolean)=Standard_False
	enlargeU(Standard_Boolean)=Standard_True
	enlargeVfirst(Standard_Boolean)=Standard_True
	enlargeVlast(Standard_Boolean)=Standard_True

Returns:
	static Standard_Boolean

if <ChangeGeom> is TRUE  ,   the surface  can  be  
         changed .  
         if <UpdatePCurve>  is  TRUE, update the  pcurves of the  
         edges of <F> on   the new surface.if the surface has  been changed,  
         Returns  True if The Surface of  <NF> has changed.") EnLargeFace;
		static Standard_Boolean EnLargeFace (const TopoDS_Face & F,TopoDS_Face & NF,const Standard_Boolean ChangeGeom,const Standard_Boolean UpDatePCurve = Standard_False,const Standard_Boolean enlargeU = Standard_True,const Standard_Boolean enlargeVfirst = Standard_True,const Standard_Boolean enlargeVlast = Standard_True);
		%feature("autodoc", "Args:
	F(TopoDS_Face)
	ConstShapes(TopTools_DataMapOfShapeShape)
	ToBuild(TopTools_DataMapOfShapeShape)
	Side(TopAbs_State)
	TolConf(Standard_Real)
	NF(TopoDS_Face)

Returns:
	static void

No detailed docstring for this function.") ExtentFace;
		static void ExtentFace (const TopoDS_Face & F,TopTools_DataMapOfShapeShape & ConstShapes,TopTools_DataMapOfShapeShape & ToBuild,const TopAbs_State Side,const Standard_Real TolConf,TopoDS_Face & NF);
		%feature("autodoc", "Args:
	W(TopoDS_Wire)
	F(TopoDS_Face)
	NOnV1(TopTools_DataMapOfShapeShape)
	NOnV2(TopTools_DataMapOfShapeShape)

Returns:
	static void

Via the wire explorer store in <NOnV1> for  
         an Edge <E> of <W> his Edge neighbour on the first  
         vertex <V1> of <E>.  
         Store in NOnV2 the Neighbour of <E>on the last  
         vertex <V2> of <E>.") BuildNeighbour;
		static void BuildNeighbour (const TopoDS_Wire & W,const TopoDS_Face & F,TopTools_DataMapOfShapeShape & NOnV1,TopTools_DataMapOfShapeShape & NOnV2);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	MVE(TopTools_DataMapOfShapeListOfShape)

Returns:
	static void

Store in MVE for a vertex <V>  in <S> the incident  
         edges <E> in <S>.  
         An Edge is Store only one Time for a vertex.") MapVertexEdges;
		static void MapVertexEdges (const TopoDS_Shape & S,TopTools_DataMapOfShapeListOfShape & MVE);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	Boundary(TopTools_MapOfShape)

Returns:
	static TopoDS_Shape

Remove the non valid   part of an offsetshape  
         1 - Remove all the free boundary  and the faces  
         connex to such edges.  
         2 - Remove all the shapes not  valid in the result  
         (according to the side of offseting)  
  in this verion only the first point is implemented.") Deboucle3D;
		static TopoDS_Shape Deboucle3D (const TopoDS_Shape & S,const TopTools_MapOfShape & Boundary);
		%feature("autodoc", "Args:
	SI(TopoDS_Shape)
	NewEdges(TopTools_IndexedMapOfShape)
	AsDes(Handle_BRepAlgo_AsDes)
	InitOffset(BRepAlgo_Image)
	Offset(Standard_Real)

Returns:
	static void

No detailed docstring for this function.") CorrectOrientation;
		static void CorrectOrientation (const TopoDS_Shape & SI,const TopTools_IndexedMapOfShape & NewEdges,Handle_BRepAlgo_AsDes & AsDes,BRepAlgo_Image & InitOffset,const Standard_Real Offset);
		%feature("autodoc", "Args:
	aCurve(Handle_Geom_Curve)

Returns:
	static Standard_Real

No detailed docstring for this function.") Gabarit;
		static Standard_Real Gabarit (const Handle_Geom_Curve & aCurve);
};


%feature("shadow") BRepOffset_Tool::~BRepOffset_Tool %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepOffset_Tool {
	void _kill_pointed() {
		delete $self;
	}
};
