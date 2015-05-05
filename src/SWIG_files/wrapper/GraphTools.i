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
%module (package="OCC") GraphTools

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

%include GraphTools_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%nodefaultctor GraphTools_ListIteratorOfListOfSequenceOfInteger;
class GraphTools_ListIteratorOfListOfSequenceOfInteger {
	public:
		%feature("autodoc", "	:rtype: None
") GraphTools_ListIteratorOfListOfSequenceOfInteger;
		 GraphTools_ListIteratorOfListOfSequenceOfInteger ();
		%feature("autodoc", "	:param L:
	:type L: GraphTools_ListOfSequenceOfInteger &
	:rtype: None
") GraphTools_ListIteratorOfListOfSequenceOfInteger;
		 GraphTools_ListIteratorOfListOfSequenceOfInteger (const GraphTools_ListOfSequenceOfInteger & L);
		%feature("autodoc", "	:param L:
	:type L: GraphTools_ListOfSequenceOfInteger &
	:rtype: None
") Initialize;
		void Initialize (const GraphTools_ListOfSequenceOfInteger & L);
		%feature("autodoc", "	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("autodoc", "	:rtype: None
") Next;
		void Next ();
		%feature("autodoc", "	:rtype: TColStd_SequenceOfInteger
") Value;
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
		%feature("autodoc", "	:rtype: None
") GraphTools_ListIteratorOfSCList;
		 GraphTools_ListIteratorOfSCList ();
		%feature("autodoc", "	:param L:
	:type L: GraphTools_SCList &
	:rtype: None
") GraphTools_ListIteratorOfSCList;
		 GraphTools_ListIteratorOfSCList (const GraphTools_SCList & L);
		%feature("autodoc", "	:param L:
	:type L: GraphTools_SCList &
	:rtype: None
") Initialize;
		void Initialize (const GraphTools_SCList & L);
		%feature("autodoc", "	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("autodoc", "	:rtype: None
") Next;
		void Next ();
		%feature("autodoc", "	:rtype: Handle_GraphTools_SC
") Value;
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
		%feature("autodoc", "	:param I:
	:type I: TColStd_SequenceOfInteger &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") GraphTools_ListNodeOfListOfSequenceOfInteger;
		 GraphTools_ListNodeOfListOfSequenceOfInteger (const TColStd_SequenceOfInteger & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "	:rtype: TColStd_SequenceOfInteger
") Value;
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
		%feature("autodoc", "	:param I:
	:type I: Handle_GraphTools_SC &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") GraphTools_ListNodeOfSCList;
		 GraphTools_ListNodeOfSCList (const Handle_GraphTools_SC & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "	:rtype: Handle_GraphTools_SC
") Value;
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
		%feature("autodoc", "	:rtype: None
") GraphTools_ListOfSequenceOfInteger;
		 GraphTools_ListOfSequenceOfInteger ();
		%feature("autodoc", "	:param Other:
	:type Other: GraphTools_ListOfSequenceOfInteger &
	:rtype: None
") Assign;
		void Assign (const GraphTools_ListOfSequenceOfInteger & Other);
		%feature("autodoc", "	:param Other:
	:type Other: GraphTools_ListOfSequenceOfInteger &
	:rtype: None
") operator=;
		void operator = (const GraphTools_ListOfSequenceOfInteger & Other);
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
	:type I: TColStd_SequenceOfInteger &
	:rtype: None
") Prepend;
		void Prepend (const TColStd_SequenceOfInteger & I);
		%feature("autodoc", "	:param I:
	:type I: TColStd_SequenceOfInteger &
	:param theIt:
	:type theIt: GraphTools_ListIteratorOfListOfSequenceOfInteger &
	:rtype: None
") Prepend;
		void Prepend (const TColStd_SequenceOfInteger & I,GraphTools_ListIteratorOfListOfSequenceOfInteger & theIt);
		%feature("autodoc", "	:param Other:
	:type Other: GraphTools_ListOfSequenceOfInteger &
	:rtype: None
") Prepend;
		void Prepend (GraphTools_ListOfSequenceOfInteger & Other);
		%feature("autodoc", "	:param I:
	:type I: TColStd_SequenceOfInteger &
	:rtype: None
") Append;
		void Append (const TColStd_SequenceOfInteger & I);
		%feature("autodoc", "	:param I:
	:type I: TColStd_SequenceOfInteger &
	:param theIt:
	:type theIt: GraphTools_ListIteratorOfListOfSequenceOfInteger &
	:rtype: None
") Append;
		void Append (const TColStd_SequenceOfInteger & I,GraphTools_ListIteratorOfListOfSequenceOfInteger & theIt);
		%feature("autodoc", "	:param Other:
	:type Other: GraphTools_ListOfSequenceOfInteger &
	:rtype: None
") Append;
		void Append (GraphTools_ListOfSequenceOfInteger & Other);
		%feature("autodoc", "	:rtype: TColStd_SequenceOfInteger
") First;
		TColStd_SequenceOfInteger & First ();
		%feature("autodoc", "	:rtype: TColStd_SequenceOfInteger
") Last;
		TColStd_SequenceOfInteger & Last ();
		%feature("autodoc", "	:rtype: None
") RemoveFirst;
		void RemoveFirst ();
		%feature("autodoc", "	:param It:
	:type It: GraphTools_ListIteratorOfListOfSequenceOfInteger &
	:rtype: None
") Remove;
		void Remove (GraphTools_ListIteratorOfListOfSequenceOfInteger & It);
		%feature("autodoc", "	:param I:
	:type I: TColStd_SequenceOfInteger &
	:param It:
	:type It: GraphTools_ListIteratorOfListOfSequenceOfInteger &
	:rtype: None
") InsertBefore;
		void InsertBefore (const TColStd_SequenceOfInteger & I,GraphTools_ListIteratorOfListOfSequenceOfInteger & It);
		%feature("autodoc", "	:param Other:
	:type Other: GraphTools_ListOfSequenceOfInteger &
	:param It:
	:type It: GraphTools_ListIteratorOfListOfSequenceOfInteger &
	:rtype: None
") InsertBefore;
		void InsertBefore (GraphTools_ListOfSequenceOfInteger & Other,GraphTools_ListIteratorOfListOfSequenceOfInteger & It);
		%feature("autodoc", "	:param I:
	:type I: TColStd_SequenceOfInteger &
	:param It:
	:type It: GraphTools_ListIteratorOfListOfSequenceOfInteger &
	:rtype: None
") InsertAfter;
		void InsertAfter (const TColStd_SequenceOfInteger & I,GraphTools_ListIteratorOfListOfSequenceOfInteger & It);
		%feature("autodoc", "	:param Other:
	:type Other: GraphTools_ListOfSequenceOfInteger &
	:param It:
	:type It: GraphTools_ListIteratorOfListOfSequenceOfInteger &
	:rtype: None
") InsertAfter;
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
		%feature("autodoc", "	:rtype: None
") GraphTools_RGNode;
		 GraphTools_RGNode ();
		%feature("autodoc", "	:rtype: None
") Reset;
		void Reset ();
		%feature("autodoc", "	:param v:
	:type v: Standard_Integer
	:rtype: None
") SetVisited;
		void SetVisited (const Standard_Integer v);
		%feature("autodoc", "	:rtype: int
") GetVisited;
		Standard_Integer GetVisited ();
		%feature("autodoc", "	:param adj:
	:type adj: Standard_Integer
	:rtype: None
") AddAdj;
		void AddAdj (const Standard_Integer adj);
		%feature("autodoc", "	:rtype: int
") NbAdj;
		Standard_Integer NbAdj ();
		%feature("autodoc", "	:param index:
	:type index: Standard_Integer
	:rtype: int
") GetAdj;
		Standard_Integer GetAdj (const Standard_Integer index);
		%feature("autodoc", "	:param SC:
	:type SC: Handle_GraphTools_SC &
	:rtype: None
") SetSC;
		void SetSC (const Handle_GraphTools_SC & SC);
		%feature("autodoc", "	:rtype: Handle_GraphTools_SC
") GetSC;
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
		%feature("autodoc", "	:rtype: None
") GraphTools_SC;
		 GraphTools_SC ();
		%feature("autodoc", "	:rtype: None
") Reset;
		void Reset ();
		%feature("autodoc", "	:param V:
	:type V: Standard_Integer
	:rtype: None
") AddVertex;
		void AddVertex (const Standard_Integer V);
		%feature("autodoc", "	:rtype: int
") NbVertices;
		Standard_Integer NbVertices ();
		%feature("autodoc", "	:param index:
	:type index: Standard_Integer
	:rtype: int
") GetVertex;
		Standard_Integer GetVertex (const Standard_Integer index);
		%feature("autodoc", "	:param SC:
	:type SC: Handle_GraphTools_SC &
	:rtype: None
") AddFrontSC;
		void AddFrontSC (const Handle_GraphTools_SC & SC);
		%feature("autodoc", "	:rtype: GraphTools_SCList
") GetFrontSC;
		const GraphTools_SCList & GetFrontSC ();
		%feature("autodoc", "	:param SC:
	:type SC: Handle_GraphTools_SC &
	:rtype: None
") AddBackSC;
		void AddBackSC (const Handle_GraphTools_SC & SC);
		%feature("autodoc", "	:rtype: GraphTools_SCList
") GetBackSC;
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
		%feature("autodoc", "	:rtype: None
") GraphTools_SCList;
		 GraphTools_SCList ();
		%feature("autodoc", "	:param Other:
	:type Other: GraphTools_SCList &
	:rtype: None
") Assign;
		void Assign (const GraphTools_SCList & Other);
		%feature("autodoc", "	:param Other:
	:type Other: GraphTools_SCList &
	:rtype: None
") operator=;
		void operator = (const GraphTools_SCList & Other);
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
	:type I: Handle_GraphTools_SC &
	:rtype: None
") Prepend;
		void Prepend (const Handle_GraphTools_SC & I);
		%feature("autodoc", "	:param I:
	:type I: Handle_GraphTools_SC &
	:param theIt:
	:type theIt: GraphTools_ListIteratorOfSCList &
	:rtype: None
") Prepend;
		void Prepend (const Handle_GraphTools_SC & I,GraphTools_ListIteratorOfSCList & theIt);
		%feature("autodoc", "	:param Other:
	:type Other: GraphTools_SCList &
	:rtype: None
") Prepend;
		void Prepend (GraphTools_SCList & Other);
		%feature("autodoc", "	:param I:
	:type I: Handle_GraphTools_SC &
	:rtype: None
") Append;
		void Append (const Handle_GraphTools_SC & I);
		%feature("autodoc", "	:param I:
	:type I: Handle_GraphTools_SC &
	:param theIt:
	:type theIt: GraphTools_ListIteratorOfSCList &
	:rtype: None
") Append;
		void Append (const Handle_GraphTools_SC & I,GraphTools_ListIteratorOfSCList & theIt);
		%feature("autodoc", "	:param Other:
	:type Other: GraphTools_SCList &
	:rtype: None
") Append;
		void Append (GraphTools_SCList & Other);
		%feature("autodoc", "	:rtype: Handle_GraphTools_SC
") First;
		Handle_GraphTools_SC & First ();
		%feature("autodoc", "	:rtype: Handle_GraphTools_SC
") Last;
		Handle_GraphTools_SC & Last ();
		%feature("autodoc", "	:rtype: None
") RemoveFirst;
		void RemoveFirst ();
		%feature("autodoc", "	:param It:
	:type It: GraphTools_ListIteratorOfSCList &
	:rtype: None
") Remove;
		void Remove (GraphTools_ListIteratorOfSCList & It);
		%feature("autodoc", "	:param I:
	:type I: Handle_GraphTools_SC &
	:param It:
	:type It: GraphTools_ListIteratorOfSCList &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Handle_GraphTools_SC & I,GraphTools_ListIteratorOfSCList & It);
		%feature("autodoc", "	:param Other:
	:type Other: GraphTools_SCList &
	:param It:
	:type It: GraphTools_ListIteratorOfSCList &
	:rtype: None
") InsertBefore;
		void InsertBefore (GraphTools_SCList & Other,GraphTools_ListIteratorOfSCList & It);
		%feature("autodoc", "	:param I:
	:type I: Handle_GraphTools_SC &
	:param It:
	:type It: GraphTools_ListIteratorOfSCList &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Handle_GraphTools_SC & I,GraphTools_ListIteratorOfSCList & It);
		%feature("autodoc", "	:param Other:
	:type Other: GraphTools_SCList &
	:param It:
	:type It: GraphTools_ListIteratorOfSCList &
	:rtype: None
") InsertAfter;
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
		%feature("autodoc", "	:rtype: None
") GraphTools_TSNode;
		 GraphTools_TSNode ();
		%feature("autodoc", "	:rtype: None
") Reset;
		void Reset ();
		%feature("autodoc", "	:rtype: None
") IncreaseRef;
		void IncreaseRef ();
		%feature("autodoc", "	:rtype: None
") DecreaseRef;
		void DecreaseRef ();
		%feature("autodoc", "	:rtype: int
") NbRef;
		Standard_Integer NbRef ();
		%feature("autodoc", "	:param s:
	:type s: Standard_Integer
	:rtype: None
") AddSuccessor;
		void AddSuccessor (const Standard_Integer s);
		%feature("autodoc", "	:rtype: int
") NbSuccessors;
		Standard_Integer NbSuccessors ();
		%feature("autodoc", "	:param index:
	:type index: Standard_Integer
	:rtype: int
") GetSuccessor;
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
