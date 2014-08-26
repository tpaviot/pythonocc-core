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
%module GraphTools

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

%include GraphTools_required_python_modules.i
%include GraphTools_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%nodefaultctor GraphTools_ListIteratorOfListOfSequenceOfInteger;
class GraphTools_ListIteratorOfListOfSequenceOfInteger {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") GraphTools_ListIteratorOfListOfSequenceOfInteger;
		 GraphTools_ListIteratorOfListOfSequenceOfInteger ();
		%feature("autodoc", "Args:
	L(GraphTools_ListOfSequenceOfInteger)

Returns:
	None

No detailed docstring for this function.") GraphTools_ListIteratorOfListOfSequenceOfInteger;
		 GraphTools_ListIteratorOfListOfSequenceOfInteger (const GraphTools_ListOfSequenceOfInteger & L);
		%feature("autodoc", "Args:
	L(GraphTools_ListOfSequenceOfInteger)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const GraphTools_ListOfSequenceOfInteger & L);
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
	TColStd_SequenceOfInteger

No detailed docstring for this function.") Value;
		TColStd_SequenceOfInteger & Value ();
};


%feature("shadow") GraphTools_ListIteratorOfListOfSequenceOfInteger::~GraphTools_ListIteratorOfListOfSequenceOfInteger %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend GraphTools_ListIteratorOfListOfSequenceOfInteger {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor GraphTools_ListIteratorOfSCList;
class GraphTools_ListIteratorOfSCList {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") GraphTools_ListIteratorOfSCList;
		 GraphTools_ListIteratorOfSCList ();
		%feature("autodoc", "Args:
	L(GraphTools_SCList)

Returns:
	None

No detailed docstring for this function.") GraphTools_ListIteratorOfSCList;
		 GraphTools_ListIteratorOfSCList (const GraphTools_SCList & L);
		%feature("autodoc", "Args:
	L(GraphTools_SCList)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const GraphTools_SCList & L);
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
	Handle_GraphTools_SC

No detailed docstring for this function.") Value;
		Handle_GraphTools_SC & Value ();
};


%feature("shadow") GraphTools_ListIteratorOfSCList::~GraphTools_ListIteratorOfSCList %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend GraphTools_ListIteratorOfSCList {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor GraphTools_ListNodeOfListOfSequenceOfInteger;
class GraphTools_ListNodeOfListOfSequenceOfInteger : public TCollection_MapNode {
	public:
		%feature("autodoc", "Args:
	I(TColStd_SequenceOfInteger)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") GraphTools_ListNodeOfListOfSequenceOfInteger;
		 GraphTools_ListNodeOfListOfSequenceOfInteger (const TColStd_SequenceOfInteger & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "Args:
	None
Returns:
	TColStd_SequenceOfInteger

No detailed docstring for this function.") Value;
		TColStd_SequenceOfInteger & Value ();
};


%feature("shadow") GraphTools_ListNodeOfListOfSequenceOfInteger::~GraphTools_ListNodeOfListOfSequenceOfInteger %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend GraphTools_ListNodeOfListOfSequenceOfInteger {
	void _kill_pointed() {
		delete $self;
	}
};
%extend GraphTools_ListNodeOfListOfSequenceOfInteger {
	Handle_GraphTools_ListNodeOfListOfSequenceOfInteger GetHandle() {
	return *(Handle_GraphTools_ListNodeOfListOfSequenceOfInteger*) &$self;
	}
};

%nodefaultctor Handle_GraphTools_ListNodeOfListOfSequenceOfInteger;
class Handle_GraphTools_ListNodeOfListOfSequenceOfInteger : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_GraphTools_ListNodeOfListOfSequenceOfInteger();
        Handle_GraphTools_ListNodeOfListOfSequenceOfInteger(const Handle_GraphTools_ListNodeOfListOfSequenceOfInteger &aHandle);
        Handle_GraphTools_ListNodeOfListOfSequenceOfInteger(const GraphTools_ListNodeOfListOfSequenceOfInteger *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_GraphTools_ListNodeOfListOfSequenceOfInteger DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_GraphTools_ListNodeOfListOfSequenceOfInteger {
    GraphTools_ListNodeOfListOfSequenceOfInteger* GetObject() {
    return (GraphTools_ListNodeOfListOfSequenceOfInteger*)$self->Access();
    }
};
%feature("shadow") Handle_GraphTools_ListNodeOfListOfSequenceOfInteger::~Handle_GraphTools_ListNodeOfListOfSequenceOfInteger %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_GraphTools_ListNodeOfListOfSequenceOfInteger {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor GraphTools_ListNodeOfSCList;
class GraphTools_ListNodeOfSCList : public TCollection_MapNode {
	public:
		%feature("autodoc", "Args:
	I(Handle_GraphTools_SC)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") GraphTools_ListNodeOfSCList;
		 GraphTools_ListNodeOfSCList (const Handle_GraphTools_SC & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_GraphTools_SC

No detailed docstring for this function.") Value;
		Handle_GraphTools_SC & Value ();
};


%feature("shadow") GraphTools_ListNodeOfSCList::~GraphTools_ListNodeOfSCList %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend GraphTools_ListNodeOfSCList {
	void _kill_pointed() {
		delete $self;
	}
};
%extend GraphTools_ListNodeOfSCList {
	Handle_GraphTools_ListNodeOfSCList GetHandle() {
	return *(Handle_GraphTools_ListNodeOfSCList*) &$self;
	}
};

%nodefaultctor Handle_GraphTools_ListNodeOfSCList;
class Handle_GraphTools_ListNodeOfSCList : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_GraphTools_ListNodeOfSCList();
        Handle_GraphTools_ListNodeOfSCList(const Handle_GraphTools_ListNodeOfSCList &aHandle);
        Handle_GraphTools_ListNodeOfSCList(const GraphTools_ListNodeOfSCList *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_GraphTools_ListNodeOfSCList DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_GraphTools_ListNodeOfSCList {
    GraphTools_ListNodeOfSCList* GetObject() {
    return (GraphTools_ListNodeOfSCList*)$self->Access();
    }
};
%feature("shadow") Handle_GraphTools_ListNodeOfSCList::~Handle_GraphTools_ListNodeOfSCList %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_GraphTools_ListNodeOfSCList {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor GraphTools_ListOfSequenceOfInteger;
class GraphTools_ListOfSequenceOfInteger {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") GraphTools_ListOfSequenceOfInteger;
		 GraphTools_ListOfSequenceOfInteger ();
		%feature("autodoc", "Args:
	Other(GraphTools_ListOfSequenceOfInteger)

Returns:
	None

No detailed docstring for this function.") Assign;
		void Assign (const GraphTools_ListOfSequenceOfInteger & Other);
		%feature("autodoc", "Args:
	Other(GraphTools_ListOfSequenceOfInteger)

Returns:
	None

No detailed docstring for this function.") operator=;
		void operator = (const GraphTools_ListOfSequenceOfInteger & Other);
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
	I(TColStd_SequenceOfInteger)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const TColStd_SequenceOfInteger & I);
		%feature("autodoc", "Args:
	I(TColStd_SequenceOfInteger)
	theIt(GraphTools_ListIteratorOfListOfSequenceOfInteger)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const TColStd_SequenceOfInteger & I,GraphTools_ListIteratorOfListOfSequenceOfInteger & theIt);
		%feature("autodoc", "Args:
	Other(GraphTools_ListOfSequenceOfInteger)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (GraphTools_ListOfSequenceOfInteger & Other);
		%feature("autodoc", "Args:
	I(TColStd_SequenceOfInteger)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const TColStd_SequenceOfInteger & I);
		%feature("autodoc", "Args:
	I(TColStd_SequenceOfInteger)
	theIt(GraphTools_ListIteratorOfListOfSequenceOfInteger)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const TColStd_SequenceOfInteger & I,GraphTools_ListIteratorOfListOfSequenceOfInteger & theIt);
		%feature("autodoc", "Args:
	Other(GraphTools_ListOfSequenceOfInteger)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (GraphTools_ListOfSequenceOfInteger & Other);
		%feature("autodoc", "Args:
	None
Returns:
	TColStd_SequenceOfInteger

No detailed docstring for this function.") First;
		TColStd_SequenceOfInteger & First ();
		%feature("autodoc", "Args:
	None
Returns:
	TColStd_SequenceOfInteger

No detailed docstring for this function.") Last;
		TColStd_SequenceOfInteger & Last ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") RemoveFirst;
		void RemoveFirst ();
		%feature("autodoc", "Args:
	It(GraphTools_ListIteratorOfListOfSequenceOfInteger)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (GraphTools_ListIteratorOfListOfSequenceOfInteger & It);
		%feature("autodoc", "Args:
	I(TColStd_SequenceOfInteger)
	It(GraphTools_ListIteratorOfListOfSequenceOfInteger)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const TColStd_SequenceOfInteger & I,GraphTools_ListIteratorOfListOfSequenceOfInteger & It);
		%feature("autodoc", "Args:
	Other(GraphTools_ListOfSequenceOfInteger)
	It(GraphTools_ListIteratorOfListOfSequenceOfInteger)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (GraphTools_ListOfSequenceOfInteger & Other,GraphTools_ListIteratorOfListOfSequenceOfInteger & It);
		%feature("autodoc", "Args:
	I(TColStd_SequenceOfInteger)
	It(GraphTools_ListIteratorOfListOfSequenceOfInteger)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const TColStd_SequenceOfInteger & I,GraphTools_ListIteratorOfListOfSequenceOfInteger & It);
		%feature("autodoc", "Args:
	Other(GraphTools_ListOfSequenceOfInteger)
	It(GraphTools_ListIteratorOfListOfSequenceOfInteger)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (GraphTools_ListOfSequenceOfInteger & Other,GraphTools_ListIteratorOfListOfSequenceOfInteger & It);
};


%feature("shadow") GraphTools_ListOfSequenceOfInteger::~GraphTools_ListOfSequenceOfInteger %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend GraphTools_ListOfSequenceOfInteger {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor GraphTools_RGNode;
class GraphTools_RGNode {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") GraphTools_RGNode;
		 GraphTools_RGNode ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Reset;
		void Reset ();
		%feature("autodoc", "Args:
	v(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") SetVisited;
		void SetVisited (const Standard_Integer v);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") GetVisited;
		Standard_Integer GetVisited ();
		%feature("autodoc", "Args:
	adj(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") AddAdj;
		void AddAdj (const Standard_Integer adj);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbAdj;
		Standard_Integer NbAdj ();
		%feature("autodoc", "Args:
	index(Standard_Integer)

Returns:
	Standard_Integer

No detailed docstring for this function.") GetAdj;
		Standard_Integer GetAdj (const Standard_Integer index);
		%feature("autodoc", "Args:
	SC(Handle_GraphTools_SC)

Returns:
	None

No detailed docstring for this function.") SetSC;
		void SetSC (const Handle_GraphTools_SC & SC);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_GraphTools_SC

No detailed docstring for this function.") GetSC;
		Handle_GraphTools_SC GetSC ();
};


%feature("shadow") GraphTools_RGNode::~GraphTools_RGNode %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend GraphTools_RGNode {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor GraphTools_SC;
class GraphTools_SC : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") GraphTools_SC;
		 GraphTools_SC ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Reset;
		void Reset ();
		%feature("autodoc", "Args:
	V(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") AddVertex;
		void AddVertex (const Standard_Integer V);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbVertices;
		Standard_Integer NbVertices ();
		%feature("autodoc", "Args:
	index(Standard_Integer)

Returns:
	Standard_Integer

No detailed docstring for this function.") GetVertex;
		Standard_Integer GetVertex (const Standard_Integer index);
		%feature("autodoc", "Args:
	SC(Handle_GraphTools_SC)

Returns:
	None

No detailed docstring for this function.") AddFrontSC;
		void AddFrontSC (const Handle_GraphTools_SC & SC);
		%feature("autodoc", "Args:
	None
Returns:
	GraphTools_SCList

No detailed docstring for this function.") GetFrontSC;
		const GraphTools_SCList & GetFrontSC ();
		%feature("autodoc", "Args:
	SC(Handle_GraphTools_SC)

Returns:
	None

No detailed docstring for this function.") AddBackSC;
		void AddBackSC (const Handle_GraphTools_SC & SC);
		%feature("autodoc", "Args:
	None
Returns:
	GraphTools_SCList

No detailed docstring for this function.") GetBackSC;
		const GraphTools_SCList & GetBackSC ();
};


%feature("shadow") GraphTools_SC::~GraphTools_SC %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend GraphTools_SC {
	void _kill_pointed() {
		delete $self;
	}
};
%extend GraphTools_SC {
	Handle_GraphTools_SC GetHandle() {
	return *(Handle_GraphTools_SC*) &$self;
	}
};

%nodefaultctor Handle_GraphTools_SC;
class Handle_GraphTools_SC : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_GraphTools_SC();
        Handle_GraphTools_SC(const Handle_GraphTools_SC &aHandle);
        Handle_GraphTools_SC(const GraphTools_SC *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_GraphTools_SC DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_GraphTools_SC {
    GraphTools_SC* GetObject() {
    return (GraphTools_SC*)$self->Access();
    }
};
%feature("shadow") Handle_GraphTools_SC::~Handle_GraphTools_SC %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_GraphTools_SC {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor GraphTools_SCList;
class GraphTools_SCList {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") GraphTools_SCList;
		 GraphTools_SCList ();
		%feature("autodoc", "Args:
	Other(GraphTools_SCList)

Returns:
	None

No detailed docstring for this function.") Assign;
		void Assign (const GraphTools_SCList & Other);
		%feature("autodoc", "Args:
	Other(GraphTools_SCList)

Returns:
	None

No detailed docstring for this function.") operator=;
		void operator = (const GraphTools_SCList & Other);
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
	I(Handle_GraphTools_SC)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_GraphTools_SC & I);
		%feature("autodoc", "Args:
	I(Handle_GraphTools_SC)
	theIt(GraphTools_ListIteratorOfSCList)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_GraphTools_SC & I,GraphTools_ListIteratorOfSCList & theIt);
		%feature("autodoc", "Args:
	Other(GraphTools_SCList)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (GraphTools_SCList & Other);
		%feature("autodoc", "Args:
	I(Handle_GraphTools_SC)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_GraphTools_SC & I);
		%feature("autodoc", "Args:
	I(Handle_GraphTools_SC)
	theIt(GraphTools_ListIteratorOfSCList)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_GraphTools_SC & I,GraphTools_ListIteratorOfSCList & theIt);
		%feature("autodoc", "Args:
	Other(GraphTools_SCList)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (GraphTools_SCList & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_GraphTools_SC

No detailed docstring for this function.") First;
		Handle_GraphTools_SC & First ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_GraphTools_SC

No detailed docstring for this function.") Last;
		Handle_GraphTools_SC & Last ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") RemoveFirst;
		void RemoveFirst ();
		%feature("autodoc", "Args:
	It(GraphTools_ListIteratorOfSCList)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (GraphTools_ListIteratorOfSCList & It);
		%feature("autodoc", "Args:
	I(Handle_GraphTools_SC)
	It(GraphTools_ListIteratorOfSCList)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Handle_GraphTools_SC & I,GraphTools_ListIteratorOfSCList & It);
		%feature("autodoc", "Args:
	Other(GraphTools_SCList)
	It(GraphTools_ListIteratorOfSCList)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (GraphTools_SCList & Other,GraphTools_ListIteratorOfSCList & It);
		%feature("autodoc", "Args:
	I(Handle_GraphTools_SC)
	It(GraphTools_ListIteratorOfSCList)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Handle_GraphTools_SC & I,GraphTools_ListIteratorOfSCList & It);
		%feature("autodoc", "Args:
	Other(GraphTools_SCList)
	It(GraphTools_ListIteratorOfSCList)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (GraphTools_SCList & Other,GraphTools_ListIteratorOfSCList & It);
};


%feature("shadow") GraphTools_SCList::~GraphTools_SCList %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend GraphTools_SCList {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor GraphTools_TSNode;
class GraphTools_TSNode {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") GraphTools_TSNode;
		 GraphTools_TSNode ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Reset;
		void Reset ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") IncreaseRef;
		void IncreaseRef ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") DecreaseRef;
		void DecreaseRef ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbRef;
		Standard_Integer NbRef ();
		%feature("autodoc", "Args:
	s(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") AddSuccessor;
		void AddSuccessor (const Standard_Integer s);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbSuccessors;
		Standard_Integer NbSuccessors ();
		%feature("autodoc", "Args:
	index(Standard_Integer)

Returns:
	Standard_Integer

No detailed docstring for this function.") GetSuccessor;
		Standard_Integer GetSuccessor (const Standard_Integer index);
};


%feature("shadow") GraphTools_TSNode::~GraphTools_TSNode %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend GraphTools_TSNode {
	void _kill_pointed() {
		delete $self;
	}
};
