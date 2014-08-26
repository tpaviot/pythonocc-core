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
%module Draft

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

%include Draft_required_python_modules.i
%include Draft_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
enum Draft_ErrorStatus {
	Draft_NoError = 0,
	Draft_FaceRecomputation = 1,
	Draft_EdgeRecomputation = 2,
	Draft_VertexRecomputation = 3,
};

/* end public enums declaration */

%rename(draft) Draft;
%nodefaultctor Draft;
class Draft {
	public:
		%feature("autodoc", "Args:
	F(TopoDS_Face)
	Direction(gp_Dir)

Returns:
	static Standard_Real

Returns the draft angle of the  face <F> using the  
         direction <Direction>.  The  method is valid for :  
         - Plane  faces,  
         - Cylindrical or conical faces, when the direction  
         of the axis of the surface is colinear with the  
         direction.  
         Otherwise, the exception DomainError is raised.") Angle;
		static Standard_Real Angle (const TopoDS_Face & F,const gp_Dir & Direction);
};


%feature("shadow") Draft::~Draft %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Draft {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Draft_DataMapIteratorOfDataMapOfEdgeEdgeInfo;
class Draft_DataMapIteratorOfDataMapOfEdgeEdgeInfo : public TCollection_BasicMapIterator {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Draft_DataMapIteratorOfDataMapOfEdgeEdgeInfo;
		 Draft_DataMapIteratorOfDataMapOfEdgeEdgeInfo ();
		%feature("autodoc", "Args:
	aMap(Draft_DataMapOfEdgeEdgeInfo)

Returns:
	None

No detailed docstring for this function.") Draft_DataMapIteratorOfDataMapOfEdgeEdgeInfo;
		 Draft_DataMapIteratorOfDataMapOfEdgeEdgeInfo (const Draft_DataMapOfEdgeEdgeInfo & aMap);
		%feature("autodoc", "Args:
	aMap(Draft_DataMapOfEdgeEdgeInfo)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const Draft_DataMapOfEdgeEdgeInfo & aMap);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Edge

No detailed docstring for this function.") Key;
		const TopoDS_Edge & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	Draft_EdgeInfo

No detailed docstring for this function.") Value;
		const Draft_EdgeInfo & Value ();
};


%feature("shadow") Draft_DataMapIteratorOfDataMapOfEdgeEdgeInfo::~Draft_DataMapIteratorOfDataMapOfEdgeEdgeInfo %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Draft_DataMapIteratorOfDataMapOfEdgeEdgeInfo {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Draft_DataMapIteratorOfDataMapOfFaceFaceInfo;
class Draft_DataMapIteratorOfDataMapOfFaceFaceInfo : public TCollection_BasicMapIterator {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Draft_DataMapIteratorOfDataMapOfFaceFaceInfo;
		 Draft_DataMapIteratorOfDataMapOfFaceFaceInfo ();
		%feature("autodoc", "Args:
	aMap(Draft_DataMapOfFaceFaceInfo)

Returns:
	None

No detailed docstring for this function.") Draft_DataMapIteratorOfDataMapOfFaceFaceInfo;
		 Draft_DataMapIteratorOfDataMapOfFaceFaceInfo (const Draft_DataMapOfFaceFaceInfo & aMap);
		%feature("autodoc", "Args:
	aMap(Draft_DataMapOfFaceFaceInfo)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const Draft_DataMapOfFaceFaceInfo & aMap);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Face

No detailed docstring for this function.") Key;
		const TopoDS_Face & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	Draft_FaceInfo

No detailed docstring for this function.") Value;
		const Draft_FaceInfo & Value ();
};


%feature("shadow") Draft_DataMapIteratorOfDataMapOfFaceFaceInfo::~Draft_DataMapIteratorOfDataMapOfFaceFaceInfo %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Draft_DataMapIteratorOfDataMapOfFaceFaceInfo {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Draft_DataMapIteratorOfDataMapOfVertexVertexInfo;
class Draft_DataMapIteratorOfDataMapOfVertexVertexInfo : public TCollection_BasicMapIterator {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Draft_DataMapIteratorOfDataMapOfVertexVertexInfo;
		 Draft_DataMapIteratorOfDataMapOfVertexVertexInfo ();
		%feature("autodoc", "Args:
	aMap(Draft_DataMapOfVertexVertexInfo)

Returns:
	None

No detailed docstring for this function.") Draft_DataMapIteratorOfDataMapOfVertexVertexInfo;
		 Draft_DataMapIteratorOfDataMapOfVertexVertexInfo (const Draft_DataMapOfVertexVertexInfo & aMap);
		%feature("autodoc", "Args:
	aMap(Draft_DataMapOfVertexVertexInfo)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const Draft_DataMapOfVertexVertexInfo & aMap);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Vertex

No detailed docstring for this function.") Key;
		const TopoDS_Vertex & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	Draft_VertexInfo

No detailed docstring for this function.") Value;
		const Draft_VertexInfo & Value ();
};


%feature("shadow") Draft_DataMapIteratorOfDataMapOfVertexVertexInfo::~Draft_DataMapIteratorOfDataMapOfVertexVertexInfo %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Draft_DataMapIteratorOfDataMapOfVertexVertexInfo {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Draft_DataMapNodeOfDataMapOfEdgeEdgeInfo;
class Draft_DataMapNodeOfDataMapOfEdgeEdgeInfo : public TCollection_MapNode {
	public:
		%feature("autodoc", "Args:
	K(TopoDS_Edge)
	I(Draft_EdgeInfo)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") Draft_DataMapNodeOfDataMapOfEdgeEdgeInfo;
		 Draft_DataMapNodeOfDataMapOfEdgeEdgeInfo (const TopoDS_Edge & K,const Draft_EdgeInfo & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Edge

No detailed docstring for this function.") Key;
		TopoDS_Edge & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	Draft_EdgeInfo

No detailed docstring for this function.") Value;
		Draft_EdgeInfo & Value ();
};


%feature("shadow") Draft_DataMapNodeOfDataMapOfEdgeEdgeInfo::~Draft_DataMapNodeOfDataMapOfEdgeEdgeInfo %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Draft_DataMapNodeOfDataMapOfEdgeEdgeInfo {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Draft_DataMapNodeOfDataMapOfEdgeEdgeInfo {
	Handle_Draft_DataMapNodeOfDataMapOfEdgeEdgeInfo GetHandle() {
	return *(Handle_Draft_DataMapNodeOfDataMapOfEdgeEdgeInfo*) &$self;
	}
};

%nodefaultctor Handle_Draft_DataMapNodeOfDataMapOfEdgeEdgeInfo;
class Handle_Draft_DataMapNodeOfDataMapOfEdgeEdgeInfo : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_Draft_DataMapNodeOfDataMapOfEdgeEdgeInfo();
        Handle_Draft_DataMapNodeOfDataMapOfEdgeEdgeInfo(const Handle_Draft_DataMapNodeOfDataMapOfEdgeEdgeInfo &aHandle);
        Handle_Draft_DataMapNodeOfDataMapOfEdgeEdgeInfo(const Draft_DataMapNodeOfDataMapOfEdgeEdgeInfo *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Draft_DataMapNodeOfDataMapOfEdgeEdgeInfo DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Draft_DataMapNodeOfDataMapOfEdgeEdgeInfo {
    Draft_DataMapNodeOfDataMapOfEdgeEdgeInfo* GetObject() {
    return (Draft_DataMapNodeOfDataMapOfEdgeEdgeInfo*)$self->Access();
    }
};
%feature("shadow") Handle_Draft_DataMapNodeOfDataMapOfEdgeEdgeInfo::~Handle_Draft_DataMapNodeOfDataMapOfEdgeEdgeInfo %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Draft_DataMapNodeOfDataMapOfEdgeEdgeInfo {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Draft_DataMapNodeOfDataMapOfFaceFaceInfo;
class Draft_DataMapNodeOfDataMapOfFaceFaceInfo : public TCollection_MapNode {
	public:
		%feature("autodoc", "Args:
	K(TopoDS_Face)
	I(Draft_FaceInfo)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") Draft_DataMapNodeOfDataMapOfFaceFaceInfo;
		 Draft_DataMapNodeOfDataMapOfFaceFaceInfo (const TopoDS_Face & K,const Draft_FaceInfo & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Face

No detailed docstring for this function.") Key;
		TopoDS_Face & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	Draft_FaceInfo

No detailed docstring for this function.") Value;
		Draft_FaceInfo & Value ();
};


%feature("shadow") Draft_DataMapNodeOfDataMapOfFaceFaceInfo::~Draft_DataMapNodeOfDataMapOfFaceFaceInfo %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Draft_DataMapNodeOfDataMapOfFaceFaceInfo {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Draft_DataMapNodeOfDataMapOfFaceFaceInfo {
	Handle_Draft_DataMapNodeOfDataMapOfFaceFaceInfo GetHandle() {
	return *(Handle_Draft_DataMapNodeOfDataMapOfFaceFaceInfo*) &$self;
	}
};

%nodefaultctor Handle_Draft_DataMapNodeOfDataMapOfFaceFaceInfo;
class Handle_Draft_DataMapNodeOfDataMapOfFaceFaceInfo : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_Draft_DataMapNodeOfDataMapOfFaceFaceInfo();
        Handle_Draft_DataMapNodeOfDataMapOfFaceFaceInfo(const Handle_Draft_DataMapNodeOfDataMapOfFaceFaceInfo &aHandle);
        Handle_Draft_DataMapNodeOfDataMapOfFaceFaceInfo(const Draft_DataMapNodeOfDataMapOfFaceFaceInfo *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Draft_DataMapNodeOfDataMapOfFaceFaceInfo DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Draft_DataMapNodeOfDataMapOfFaceFaceInfo {
    Draft_DataMapNodeOfDataMapOfFaceFaceInfo* GetObject() {
    return (Draft_DataMapNodeOfDataMapOfFaceFaceInfo*)$self->Access();
    }
};
%feature("shadow") Handle_Draft_DataMapNodeOfDataMapOfFaceFaceInfo::~Handle_Draft_DataMapNodeOfDataMapOfFaceFaceInfo %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Draft_DataMapNodeOfDataMapOfFaceFaceInfo {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Draft_DataMapNodeOfDataMapOfVertexVertexInfo;
class Draft_DataMapNodeOfDataMapOfVertexVertexInfo : public TCollection_MapNode {
	public:
		%feature("autodoc", "Args:
	K(TopoDS_Vertex)
	I(Draft_VertexInfo)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") Draft_DataMapNodeOfDataMapOfVertexVertexInfo;
		 Draft_DataMapNodeOfDataMapOfVertexVertexInfo (const TopoDS_Vertex & K,const Draft_VertexInfo & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Vertex

No detailed docstring for this function.") Key;
		TopoDS_Vertex & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	Draft_VertexInfo

No detailed docstring for this function.") Value;
		Draft_VertexInfo & Value ();
};


%feature("shadow") Draft_DataMapNodeOfDataMapOfVertexVertexInfo::~Draft_DataMapNodeOfDataMapOfVertexVertexInfo %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Draft_DataMapNodeOfDataMapOfVertexVertexInfo {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Draft_DataMapNodeOfDataMapOfVertexVertexInfo {
	Handle_Draft_DataMapNodeOfDataMapOfVertexVertexInfo GetHandle() {
	return *(Handle_Draft_DataMapNodeOfDataMapOfVertexVertexInfo*) &$self;
	}
};

%nodefaultctor Handle_Draft_DataMapNodeOfDataMapOfVertexVertexInfo;
class Handle_Draft_DataMapNodeOfDataMapOfVertexVertexInfo : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_Draft_DataMapNodeOfDataMapOfVertexVertexInfo();
        Handle_Draft_DataMapNodeOfDataMapOfVertexVertexInfo(const Handle_Draft_DataMapNodeOfDataMapOfVertexVertexInfo &aHandle);
        Handle_Draft_DataMapNodeOfDataMapOfVertexVertexInfo(const Draft_DataMapNodeOfDataMapOfVertexVertexInfo *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Draft_DataMapNodeOfDataMapOfVertexVertexInfo DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Draft_DataMapNodeOfDataMapOfVertexVertexInfo {
    Draft_DataMapNodeOfDataMapOfVertexVertexInfo* GetObject() {
    return (Draft_DataMapNodeOfDataMapOfVertexVertexInfo*)$self->Access();
    }
};
%feature("shadow") Handle_Draft_DataMapNodeOfDataMapOfVertexVertexInfo::~Handle_Draft_DataMapNodeOfDataMapOfVertexVertexInfo %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Draft_DataMapNodeOfDataMapOfVertexVertexInfo {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Draft_DataMapOfEdgeEdgeInfo;
class Draft_DataMapOfEdgeEdgeInfo : public TCollection_BasicMap {
	public:
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)=1

Returns:
	None

No detailed docstring for this function.") Draft_DataMapOfEdgeEdgeInfo;
		 Draft_DataMapOfEdgeEdgeInfo (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "Args:
	Other(Draft_DataMapOfEdgeEdgeInfo)

Returns:
	Draft_DataMapOfEdgeEdgeInfo

No detailed docstring for this function.") Assign;
		Draft_DataMapOfEdgeEdgeInfo & Assign (const Draft_DataMapOfEdgeEdgeInfo & Other);
		%feature("autodoc", "Args:
	Other(Draft_DataMapOfEdgeEdgeInfo)

Returns:
	Draft_DataMapOfEdgeEdgeInfo

No detailed docstring for this function.") operator=;
		Draft_DataMapOfEdgeEdgeInfo & operator = (const Draft_DataMapOfEdgeEdgeInfo & Other);
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
	K(TopoDS_Edge)
	I(Draft_EdgeInfo)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Bind;
		Standard_Boolean Bind (const TopoDS_Edge & K,const Draft_EdgeInfo & I);
		%feature("autodoc", "Args:
	K(TopoDS_Edge)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsBound;
		Standard_Boolean IsBound (const TopoDS_Edge & K);
		%feature("autodoc", "Args:
	K(TopoDS_Edge)

Returns:
	Standard_Boolean

No detailed docstring for this function.") UnBind;
		Standard_Boolean UnBind (const TopoDS_Edge & K);
		%feature("autodoc", "Args:
	K(TopoDS_Edge)

Returns:
	Draft_EdgeInfo

No detailed docstring for this function.") Find;
		const Draft_EdgeInfo & Find (const TopoDS_Edge & K);
		%feature("autodoc", "Args:
	K(TopoDS_Edge)

Returns:
	Draft_EdgeInfo

No detailed docstring for this function.") ChangeFind;
		Draft_EdgeInfo & ChangeFind (const TopoDS_Edge & K);
		%feature("autodoc", "Args:
	K(TopoDS_Edge)

Returns:
	Standard_Address

No detailed docstring for this function.") Find1;
		Standard_Address Find1 (const TopoDS_Edge & K);
		%feature("autodoc", "Args:
	K(TopoDS_Edge)

Returns:
	Standard_Address

No detailed docstring for this function.") ChangeFind1;
		Standard_Address ChangeFind1 (const TopoDS_Edge & K);
};


%feature("shadow") Draft_DataMapOfEdgeEdgeInfo::~Draft_DataMapOfEdgeEdgeInfo %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Draft_DataMapOfEdgeEdgeInfo {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Draft_DataMapOfFaceFaceInfo;
class Draft_DataMapOfFaceFaceInfo : public TCollection_BasicMap {
	public:
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)=1

Returns:
	None

No detailed docstring for this function.") Draft_DataMapOfFaceFaceInfo;
		 Draft_DataMapOfFaceFaceInfo (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "Args:
	Other(Draft_DataMapOfFaceFaceInfo)

Returns:
	Draft_DataMapOfFaceFaceInfo

No detailed docstring for this function.") Assign;
		Draft_DataMapOfFaceFaceInfo & Assign (const Draft_DataMapOfFaceFaceInfo & Other);
		%feature("autodoc", "Args:
	Other(Draft_DataMapOfFaceFaceInfo)

Returns:
	Draft_DataMapOfFaceFaceInfo

No detailed docstring for this function.") operator=;
		Draft_DataMapOfFaceFaceInfo & operator = (const Draft_DataMapOfFaceFaceInfo & Other);
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
	K(TopoDS_Face)
	I(Draft_FaceInfo)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Bind;
		Standard_Boolean Bind (const TopoDS_Face & K,const Draft_FaceInfo & I);
		%feature("autodoc", "Args:
	K(TopoDS_Face)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsBound;
		Standard_Boolean IsBound (const TopoDS_Face & K);
		%feature("autodoc", "Args:
	K(TopoDS_Face)

Returns:
	Standard_Boolean

No detailed docstring for this function.") UnBind;
		Standard_Boolean UnBind (const TopoDS_Face & K);
		%feature("autodoc", "Args:
	K(TopoDS_Face)

Returns:
	Draft_FaceInfo

No detailed docstring for this function.") Find;
		const Draft_FaceInfo & Find (const TopoDS_Face & K);
		%feature("autodoc", "Args:
	K(TopoDS_Face)

Returns:
	Draft_FaceInfo

No detailed docstring for this function.") ChangeFind;
		Draft_FaceInfo & ChangeFind (const TopoDS_Face & K);
		%feature("autodoc", "Args:
	K(TopoDS_Face)

Returns:
	Standard_Address

No detailed docstring for this function.") Find1;
		Standard_Address Find1 (const TopoDS_Face & K);
		%feature("autodoc", "Args:
	K(TopoDS_Face)

Returns:
	Standard_Address

No detailed docstring for this function.") ChangeFind1;
		Standard_Address ChangeFind1 (const TopoDS_Face & K);
};


%feature("shadow") Draft_DataMapOfFaceFaceInfo::~Draft_DataMapOfFaceFaceInfo %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Draft_DataMapOfFaceFaceInfo {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Draft_DataMapOfVertexVertexInfo;
class Draft_DataMapOfVertexVertexInfo : public TCollection_BasicMap {
	public:
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)=1

Returns:
	None

No detailed docstring for this function.") Draft_DataMapOfVertexVertexInfo;
		 Draft_DataMapOfVertexVertexInfo (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "Args:
	Other(Draft_DataMapOfVertexVertexInfo)

Returns:
	Draft_DataMapOfVertexVertexInfo

No detailed docstring for this function.") Assign;
		Draft_DataMapOfVertexVertexInfo & Assign (const Draft_DataMapOfVertexVertexInfo & Other);
		%feature("autodoc", "Args:
	Other(Draft_DataMapOfVertexVertexInfo)

Returns:
	Draft_DataMapOfVertexVertexInfo

No detailed docstring for this function.") operator=;
		Draft_DataMapOfVertexVertexInfo & operator = (const Draft_DataMapOfVertexVertexInfo & Other);
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
	K(TopoDS_Vertex)
	I(Draft_VertexInfo)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Bind;
		Standard_Boolean Bind (const TopoDS_Vertex & K,const Draft_VertexInfo & I);
		%feature("autodoc", "Args:
	K(TopoDS_Vertex)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsBound;
		Standard_Boolean IsBound (const TopoDS_Vertex & K);
		%feature("autodoc", "Args:
	K(TopoDS_Vertex)

Returns:
	Standard_Boolean

No detailed docstring for this function.") UnBind;
		Standard_Boolean UnBind (const TopoDS_Vertex & K);
		%feature("autodoc", "Args:
	K(TopoDS_Vertex)

Returns:
	Draft_VertexInfo

No detailed docstring for this function.") Find;
		const Draft_VertexInfo & Find (const TopoDS_Vertex & K);
		%feature("autodoc", "Args:
	K(TopoDS_Vertex)

Returns:
	Draft_VertexInfo

No detailed docstring for this function.") ChangeFind;
		Draft_VertexInfo & ChangeFind (const TopoDS_Vertex & K);
		%feature("autodoc", "Args:
	K(TopoDS_Vertex)

Returns:
	Standard_Address

No detailed docstring for this function.") Find1;
		Standard_Address Find1 (const TopoDS_Vertex & K);
		%feature("autodoc", "Args:
	K(TopoDS_Vertex)

Returns:
	Standard_Address

No detailed docstring for this function.") ChangeFind1;
		Standard_Address ChangeFind1 (const TopoDS_Vertex & K);
};


%feature("shadow") Draft_DataMapOfVertexVertexInfo::~Draft_DataMapOfVertexVertexInfo %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Draft_DataMapOfVertexVertexInfo {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Draft_EdgeInfo;
class Draft_EdgeInfo {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Draft_EdgeInfo;
		 Draft_EdgeInfo ();
		%feature("autodoc", "Args:
	HasNewGeometry(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") Draft_EdgeInfo;
		 Draft_EdgeInfo (const Standard_Boolean HasNewGeometry);
		%feature("autodoc", "Args:
	F(TopoDS_Face)

Returns:
	None

No detailed docstring for this function.") Add;
		void Add (const TopoDS_Face & F);
		%feature("autodoc", "Args:
	F(TopoDS_Face)

Returns:
	None

No detailed docstring for this function.") RootFace;
		void RootFace (const TopoDS_Face & F);
		%feature("autodoc", "Args:
	P(gp_Pnt)

Returns:
	None

No detailed docstring for this function.") Tangent;
		void Tangent (const gp_Pnt & P);
		%feature("autodoc", "Args:
	P(gp_Pnt)

Returns:
	Standard_Boolean

No detailed docstring for this function.") IsTangent;
		Standard_Boolean IsTangent (gp_Pnt & P);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") NewGeometry;
		Standard_Boolean NewGeometry ();
		%feature("autodoc", "Args:
	NewGeom(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") SetNewGeometry;
		void SetNewGeometry (const Standard_Boolean NewGeom);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_Curve

No detailed docstring for this function.") Geometry;
		const Handle_Geom_Curve & Geometry ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Face

No detailed docstring for this function.") FirstFace;
		const TopoDS_Face & FirstFace ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Face

No detailed docstring for this function.") SecondFace;
		const TopoDS_Face & SecondFace ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom2d_Curve

No detailed docstring for this function.") FirstPC;
		const Handle_Geom2d_Curve & FirstPC ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom2d_Curve

No detailed docstring for this function.") SecondPC;
		const Handle_Geom2d_Curve & SecondPC ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_Curve

No detailed docstring for this function.") ChangeGeometry;
		Handle_Geom_Curve & ChangeGeometry ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom2d_Curve

No detailed docstring for this function.") ChangeFirstPC;
		Handle_Geom2d_Curve & ChangeFirstPC ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom2d_Curve

No detailed docstring for this function.") ChangeSecondPC;
		Handle_Geom2d_Curve & ChangeSecondPC ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Face

No detailed docstring for this function.") RootFace;
		const TopoDS_Face & RootFace ();
		%feature("autodoc", "Args:
	tol(Standard_Real)

Returns:
	None

No detailed docstring for this function.") Tolerance;
		void Tolerance (const Standard_Real tol);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") Tolerance;
		Standard_Real Tolerance ();
};


%feature("shadow") Draft_EdgeInfo::~Draft_EdgeInfo %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Draft_EdgeInfo {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Draft_FaceInfo;
class Draft_FaceInfo {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Draft_FaceInfo;
		 Draft_FaceInfo ();
		%feature("autodoc", "Args:
	S(Handle_Geom_Surface)
	HasNewGeometry(Standard_Boolean)

Returns:
	None

No detailed docstring for this function.") Draft_FaceInfo;
		 Draft_FaceInfo (const Handle_Geom_Surface & S,const Standard_Boolean HasNewGeometry);
		%feature("autodoc", "Args:
	F(TopoDS_Face)

Returns:
	None

No detailed docstring for this function.") RootFace;
		void RootFace (const TopoDS_Face & F);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") NewGeometry;
		Standard_Boolean NewGeometry ();
		%feature("autodoc", "Args:
	F(TopoDS_Face)

Returns:
	None

No detailed docstring for this function.") Add;
		void Add (const TopoDS_Face & F);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Face

No detailed docstring for this function.") FirstFace;
		const TopoDS_Face & FirstFace ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Face

No detailed docstring for this function.") SecondFace;
		const TopoDS_Face & SecondFace ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_Surface

No detailed docstring for this function.") Geometry;
		const Handle_Geom_Surface & Geometry ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_Surface

No detailed docstring for this function.") ChangeGeometry;
		Handle_Geom_Surface & ChangeGeometry ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Face

No detailed docstring for this function.") RootFace;
		const TopoDS_Face & RootFace ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_Curve

No detailed docstring for this function.") ChangeCurve;
		Handle_Geom_Curve & ChangeCurve ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Geom_Curve

No detailed docstring for this function.") Curve;
		const Handle_Geom_Curve & Curve ();
};


%feature("shadow") Draft_FaceInfo::~Draft_FaceInfo %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Draft_FaceInfo {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Draft_Modification;
class Draft_Modification : public BRepTools_Modification {
	public:
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	None

No detailed docstring for this function.") Draft_Modification;
		 Draft_Modification (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	None
Returns:
	None

Resets on the same shape.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	None

Changes the basis shape and resets.") Init;
		void Init (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	F(TopoDS_Face)
	Direction(gp_Dir)
	Angle(Standard_Real)
	NeutralPlane(gp_Pln)
	Flag(Standard_Boolean)=Standard_True

Returns:
	Standard_Boolean

Adds  the  face  F    and propagates    the  draft  
         modification to  its  neighbour faces if they  are  
         tangent. If an error occurs, will return False and  
         ProblematicShape  will  return the 'bad' face.") Add;
		Standard_Boolean Add (const TopoDS_Face & F,const gp_Dir & Direction,const Standard_Real Angle,const gp_Pln & NeutralPlane,const Standard_Boolean Flag = Standard_True);
		%feature("autodoc", "Args:
	F(TopoDS_Face)

Returns:
	None

Removes the face F and the neighbour faces if they  
         are tangent.   It will be  necessary to  call this  
         method if  the  method Add returns Standard_False,  
         to unset ProblematicFace.") Remove;
		void Remove (const TopoDS_Face & F);
		%feature("autodoc", "Args:
	None
Returns:
	None

Performs the draft angle modification and sets the  
         value returned by the method  IsDone.  If an error  
         occurs, IsDone  will return Standard_False, and an  
         error status will  be  given by the  method Error,  
         and the  shape on which  the problem appeared will  
         be given by ProblematicShape") Perform;
		void Perform ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns  True  if   Perform has  been  succesfully  
         called. Otherwise more information can be obtained  
         using the methods Error() and ProblematicShape().") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	Draft_ErrorStatus

No detailed docstring for this function.") Error;
		Draft_ErrorStatus Error ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

Returns the shape (Face,  Edge or Vertex) on which  
         an error occured.") ProblematicShape;
		const TopoDS_Shape & ProblematicShape ();
		%feature("autodoc", "Args:
	F(TopoDS_Face)

Returns:
	TopTools_ListOfShape

Returns all  the  faces   which  have been   added  
         together with the face <F>.") ConnectedFaces;
		const TopTools_ListOfShape & ConnectedFaces (const TopoDS_Face & F);
		%feature("autodoc", "Args:
	None
Returns:
	TopTools_ListOfShape

Returns all the faces  on which a modification has  
         been given.") ModifiedFaces;
		const TopTools_ListOfShape & ModifiedFaces ();
		%feature("autodoc", "Args:
	F(TopoDS_Face)
	S(Handle_Geom_Surface)
	L(TopLoc_Location)
	Tol(Standard_Real)
	RevWires(Standard_Boolean)
	RevFace(Standard_Boolean)

Returns:
	Standard_Boolean

Returns Standard_True if   the face <F>  has  been  
         modified.  In this case,  <S> is the new geometric  
         support of the  face,  <L> the new  location,<Tol>  
         the   new tolerance.<RevWires>  has  to  be set to  
         Standard_True when   the modification reverses the  
         normal   of  the  surface.(the  wires   have to be  
         reversed).  <RevFace>    has    to  be   set    to  
         Standard_True  if  the orientation of the modified  
         face changes in  the shells which contain it. Here  
         it will be set to Standard_False.  
 
         Otherwise, returns Standard_False, and <S>,   <L>,  
         <Tol> , <RevWires> ,<RevFace> are not  significant.") NewSurface;
		Standard_Boolean NewSurface (const TopoDS_Face & F,Handle_Geom_Surface & S,TopLoc_Location & L,Standard_Real &OutValue,Standard_Boolean & RevWires,Standard_Boolean & RevFace);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)
	C(Handle_Geom_Curve)
	L(TopLoc_Location)
	Tol(Standard_Real)

Returns:
	Standard_Boolean

Returns Standard_True  if  the edge  <E> has  been  
         modified.  In this case,  <C> is the new geometric  
         support of the  edge, <L> the  new location, <Tol>  
         the         new    tolerance.   Otherwise, returns  
         Standard_False,    and  <C>,  <L>,   <Tol> are not  
         significant.") NewCurve;
		Standard_Boolean NewCurve (const TopoDS_Edge & E,Handle_Geom_Curve & C,TopLoc_Location & L,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	V(TopoDS_Vertex)
	P(gp_Pnt)
	Tol(Standard_Real)

Returns:
	Standard_Boolean

Returns  Standard_True if the  vertex <V> has been  
         modified.  In this  case, <P> is the new geometric  
         support of the vertex,   <Tol> the new  tolerance.  
         Otherwise, returns Standard_False, and <P>,  <Tol>  
         are not significant.") NewPoint;
		Standard_Boolean NewPoint (const TopoDS_Vertex & V,gp_Pnt & P,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)
	F(TopoDS_Face)
	NewE(TopoDS_Edge)
	NewF(TopoDS_Face)
	C(Handle_Geom2d_Curve)
	Tol(Standard_Real)

Returns:
	Standard_Boolean

Returns Standard_True if  the edge  <E> has a  new  
         curve on surface on the face <F>.In this case, <C>  
         is the new geometric support of  the edge, <L> the  
         new location, <Tol> the new tolerance.  
 
         Otherwise, returns  Standard_False, and <C>,  <L>,  
         <Tol> are not significant.  
 
         <NewE> is the new  edge created from  <E>.  <NewF>  
         is the new face created from <F>. They may be usefull.") NewCurve2d;
		Standard_Boolean NewCurve2d (const TopoDS_Edge & E,const TopoDS_Face & F,const TopoDS_Edge & NewE,const TopoDS_Face & NewF,Handle_Geom2d_Curve & C,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	V(TopoDS_Vertex)
	E(TopoDS_Edge)
	P(Standard_Real)
	Tol(Standard_Real)

Returns:
	Standard_Boolean

Returns Standard_True if the Vertex  <V> has a new  
         parameter on the  edge <E>. In  this case,  <P> is  
         the parameter,    <Tol>  the     new    tolerance.  
         Otherwise, returns Standard_False, and <P>,  <Tol>  
         are not significant.") NewParameter;
		Standard_Boolean NewParameter (const TopoDS_Vertex & V,const TopoDS_Edge & E,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)
	F1(TopoDS_Face)
	F2(TopoDS_Face)
	NewE(TopoDS_Edge)
	NewF1(TopoDS_Face)
	NewF2(TopoDS_Face)

Returns:
	GeomAbs_Shape

Returns the  continuity of  <NewE> between <NewF1>  
         and <NewF2>.  
 
         <NewE> is the new  edge created from <E>.  <NewF1>  
         (resp. <NewF2>) is the new  face created from <F1>  
         (resp. <F2>).") Continuity;
		GeomAbs_Shape Continuity (const TopoDS_Edge & E,const TopoDS_Face & F1,const TopoDS_Face & F2,const TopoDS_Edge & NewE,const TopoDS_Face & NewF1,const TopoDS_Face & NewF2);
};


%feature("shadow") Draft_Modification::~Draft_Modification %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Draft_Modification {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Draft_Modification {
	Handle_Draft_Modification GetHandle() {
	return *(Handle_Draft_Modification*) &$self;
	}
};

%nodefaultctor Handle_Draft_Modification;
class Handle_Draft_Modification : public Handle_BRepTools_Modification {

    public:
        // constructors
        Handle_Draft_Modification();
        Handle_Draft_Modification(const Handle_Draft_Modification &aHandle);
        Handle_Draft_Modification(const Draft_Modification *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Draft_Modification DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Draft_Modification {
    Draft_Modification* GetObject() {
    return (Draft_Modification*)$self->Access();
    }
};
%feature("shadow") Handle_Draft_Modification::~Handle_Draft_Modification %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Draft_Modification {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Draft_VertexInfo;
class Draft_VertexInfo {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Draft_VertexInfo;
		 Draft_VertexInfo ();
		%feature("autodoc", "Args:
	E(TopoDS_Edge)

Returns:
	None

No detailed docstring for this function.") Add;
		void Add (const TopoDS_Edge & E);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt

No detailed docstring for this function.") Geometry;
		const gp_Pnt & Geometry ();
		%feature("autodoc", "Args:
	E(TopoDS_Edge)

Returns:
	Standard_Real

No detailed docstring for this function.") Parameter;
		Standard_Real Parameter (const TopoDS_Edge & E);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") InitEdgeIterator;
		void InitEdgeIterator ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Edge

No detailed docstring for this function.") Edge;
		const TopoDS_Edge & Edge ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") NextEdge;
		void NextEdge ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") MoreEdge;
		Standard_Boolean MoreEdge ();
		%feature("autodoc", "Args:
	None
Returns:
	gp_Pnt

No detailed docstring for this function.") ChangeGeometry;
		gp_Pnt & ChangeGeometry ();
		%feature("autodoc", "Args:
	E(TopoDS_Edge)

Returns:
	Standard_Real

No detailed docstring for this function.") ChangeParameter;
		Standard_Real & ChangeParameter (const TopoDS_Edge & E);
};


%feature("shadow") Draft_VertexInfo::~Draft_VertexInfo %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Draft_VertexInfo {
	void _kill_pointed() {
		delete $self;
	}
};
