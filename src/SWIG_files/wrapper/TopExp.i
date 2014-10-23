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
%module (package="OCC") TopExp

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

%include TopExp_headers.i

/* typedefs */
typedef TopoDS_Iterator * TopExp_Stack;
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%rename(topexp) TopExp;
%nodefaultctor TopExp;
class TopExp {
	public:
		%feature("autodoc", "	* Tool to explore a topological data structure. Stores in the map <M> all the sub-shapes of <S> of type <T>. Warning: The map is not cleared at first.

	:param S:
	:type S: TopoDS_Shape &
	:param T:
	:type T: TopAbs_ShapeEnum
	:param M:
	:type M: TopTools_IndexedMapOfShape &
	:rtype: void
") MapShapes;
		static void MapShapes (const TopoDS_Shape & S,const TopAbs_ShapeEnum T,TopTools_IndexedMapOfShape & M);
		%feature("autodoc", "	* Stores in the map <M> all the sub-shapes of <S>.

	:param S:
	:type S: TopoDS_Shape &
	:param M:
	:type M: TopTools_IndexedMapOfShape &
	:rtype: void
") MapShapes;
		static void MapShapes (const TopoDS_Shape & S,TopTools_IndexedMapOfShape & M);
		%feature("autodoc", "	* Stores in the map <M> all the subshape of <S> of type <TS> for each one append to the list all the ancestors of type <TA>. For example map all the edges and bind the list of faces. Warning: The map is not cleared at first.

	:param S:
	:type S: TopoDS_Shape &
	:param TS:
	:type TS: TopAbs_ShapeEnum
	:param TA:
	:type TA: TopAbs_ShapeEnum
	:param M:
	:type M: TopTools_IndexedDataMapOfShapeListOfShape &
	:rtype: void
") MapShapesAndAncestors;
		static void MapShapesAndAncestors (const TopoDS_Shape & S,const TopAbs_ShapeEnum TS,const TopAbs_ShapeEnum TA,TopTools_IndexedDataMapOfShapeListOfShape & M);
		%feature("autodoc", "	* Returns the Vertex of orientation FORWARD in E. If there is none returns a Null Shape. CumOri = True : taking account the edge orientation

	:param E:
	:type E: TopoDS_Edge &
	:param CumOri: default value is Standard_False
	:type CumOri: bool
	:rtype: TopoDS_Vertex
") FirstVertex;
		static TopoDS_Vertex FirstVertex (const TopoDS_Edge & E,const Standard_Boolean CumOri = Standard_False);
		%feature("autodoc", "	* Returns the Vertex of orientation REVERSED in E. If there is none returns a Null Shape. CumOri = True : taking account the edge orientation

	:param E:
	:type E: TopoDS_Edge &
	:param CumOri: default value is Standard_False
	:type CumOri: bool
	:rtype: TopoDS_Vertex
") LastVertex;
		static TopoDS_Vertex LastVertex (const TopoDS_Edge & E,const Standard_Boolean CumOri = Standard_False);
		%feature("autodoc", "	* Returns in Vfirst, Vlast the FORWARD and REVERSED vertices of the edge <E>. May be null shapes. CumOri = True : taking account the edge orientation

	:param E:
	:type E: TopoDS_Edge &
	:param Vfirst:
	:type Vfirst: TopoDS_Vertex &
	:param Vlast:
	:type Vlast: TopoDS_Vertex &
	:param CumOri: default value is Standard_False
	:type CumOri: bool
	:rtype: void
") Vertices;
		static void Vertices (const TopoDS_Edge & E,TopoDS_Vertex & Vfirst,TopoDS_Vertex & Vlast,const Standard_Boolean CumOri = Standard_False);
		%feature("autodoc", "	* Returns in Vfirst, Vlast the first and last vertices of the open wire <W>. May be null shapes. if <W> is closed Vfirst and Vlast are a same vertex on <W>. if <W> is no manifold. VFirst and VLast are null shapes.

	:param W:
	:type W: TopoDS_Wire &
	:param Vfirst:
	:type Vfirst: TopoDS_Vertex &
	:param Vlast:
	:type Vlast: TopoDS_Vertex &
	:rtype: void
") Vertices;
		static void Vertices (const TopoDS_Wire & W,TopoDS_Vertex & Vfirst,TopoDS_Vertex & Vlast);
		%feature("autodoc", "	* Finds the vertex <V> common to the two edges <E1,E2>, returns True if this vertex exists. Warning: <V> has sense only if the value <True> is returned

	:param E1:
	:type E1: TopoDS_Edge &
	:param E2:
	:type E2: TopoDS_Edge &
	:param V:
	:type V: TopoDS_Vertex &
	:rtype: bool
") CommonVertex;
		static Standard_Boolean CommonVertex (const TopoDS_Edge & E1,const TopoDS_Edge & E2,TopoDS_Vertex & V);
};


%feature("shadow") TopExp::~TopExp %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopExp {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopExp_Explorer;
class TopExp_Explorer {
	public:
		%feature("autodoc", "	* Creates an empty explorer, becomes usefull after Init.

	:rtype: None
") TopExp_Explorer;
		 TopExp_Explorer ();
		%feature("autodoc", "	* Creates an Explorer on the Shape <S>.  <ToFind> is the type of shapes to search. TopAbs_VERTEX, TopAbs_EDGE, ...  <ToAvoid> is the type of shape to skip in the exploration. If <ToAvoid> is equal or less complex than <ToFind> or if <ToAVoid> is SHAPE it has no effect on the exploration.

	:param S:
	:type S: TopoDS_Shape &
	:param ToFind:
	:type ToFind: TopAbs_ShapeEnum
	:param ToAvoid: default value is TopAbs_SHAPE
	:type ToAvoid: TopAbs_ShapeEnum
	:rtype: None
") TopExp_Explorer;
		 TopExp_Explorer (const TopoDS_Shape & S,const TopAbs_ShapeEnum ToFind,const TopAbs_ShapeEnum ToAvoid = TopAbs_SHAPE);
		%feature("autodoc", "	* Resets this explorer on the shape S. It is initialized to search the shape S, for shapes of type ToFind, that are not part of a shape ToAvoid. If the shape ToAvoid is equal to TopAbs_SHAPE, or if it is the same as, or less complex than, the shape ToFind it has no effect on the search.

	:param S:
	:type S: TopoDS_Shape &
	:param ToFind:
	:type ToFind: TopAbs_ShapeEnum
	:param ToAvoid: default value is TopAbs_SHAPE
	:type ToAvoid: TopAbs_ShapeEnum
	:rtype: None
") Init;
		void Init (const TopoDS_Shape & S,const TopAbs_ShapeEnum ToFind,const TopAbs_ShapeEnum ToAvoid = TopAbs_SHAPE);
		%feature("autodoc", "	* Returns True if there are more shapes in the exploration.

	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("autodoc", "	* Moves to the next Shape in the exploration. Exceptions Standard_NoMoreObject if there are no more shapes to explore.

	:rtype: None
") Next;
		void Next ();
		%feature("autodoc", "	* Returns the current shape in the exploration. Exceptions Standard_NoSuchObject if this explorer has no more shapes to explore.

	:rtype: TopoDS_Shape
") Current;
		const TopoDS_Shape & Current ();
		%feature("autodoc", "	* Reinitialize the exploration with the original arguments.

	:rtype: None
") ReInit;
		void ReInit ();
		%feature("autodoc", "	* Returns the current depth of the exploration. 0 is the shape to explore itself.

	:rtype: int
") Depth;
		Standard_Integer Depth ();
		%feature("autodoc", "	* Clears the content of the explorer. It will return False on More().

	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
};


%feature("shadow") TopExp_Explorer::~TopExp_Explorer %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopExp_Explorer {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopExp_StackIteratorOfStackOfIterator;
class TopExp_StackIteratorOfStackOfIterator {
	public:
		%feature("autodoc", "	:rtype: None
") TopExp_StackIteratorOfStackOfIterator;
		 TopExp_StackIteratorOfStackOfIterator ();
		%feature("autodoc", "	:param S:
	:type S: TopExp_StackOfIterator &
	:rtype: None
") TopExp_StackIteratorOfStackOfIterator;
		 TopExp_StackIteratorOfStackOfIterator (const TopExp_StackOfIterator & S);
		%feature("autodoc", "	:param S:
	:type S: TopExp_StackOfIterator &
	:rtype: None
") Initialize;
		void Initialize (const TopExp_StackOfIterator & S);
		%feature("autodoc", "	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("autodoc", "	:rtype: None
") Next;
		void Next ();
		%feature("autodoc", "	:rtype: TopoDS_Iterator
") Value;
		const TopoDS_Iterator & Value ();
};


%feature("shadow") TopExp_StackIteratorOfStackOfIterator::~TopExp_StackIteratorOfStackOfIterator %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopExp_StackIteratorOfStackOfIterator {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopExp_StackNodeOfStackOfIterator;
class TopExp_StackNodeOfStackOfIterator : public TCollection_MapNode {
	public:
		%feature("autodoc", "	:param I:
	:type I: TopoDS_Iterator &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") TopExp_StackNodeOfStackOfIterator;
		 TopExp_StackNodeOfStackOfIterator (const TopoDS_Iterator & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "	:rtype: TopoDS_Iterator
") Value;
		TopoDS_Iterator & Value ();
};


%feature("shadow") TopExp_StackNodeOfStackOfIterator::~TopExp_StackNodeOfStackOfIterator %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopExp_StackNodeOfStackOfIterator {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TopExp_StackNodeOfStackOfIterator {
	Handle_TopExp_StackNodeOfStackOfIterator GetHandle() {
	return *(Handle_TopExp_StackNodeOfStackOfIterator*) &$self;
	}
};

%nodefaultctor Handle_TopExp_StackNodeOfStackOfIterator;
class Handle_TopExp_StackNodeOfStackOfIterator : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_TopExp_StackNodeOfStackOfIterator();
        Handle_TopExp_StackNodeOfStackOfIterator(const Handle_TopExp_StackNodeOfStackOfIterator &aHandle);
        Handle_TopExp_StackNodeOfStackOfIterator(const TopExp_StackNodeOfStackOfIterator *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TopExp_StackNodeOfStackOfIterator DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TopExp_StackNodeOfStackOfIterator {
    TopExp_StackNodeOfStackOfIterator* GetObject() {
    return (TopExp_StackNodeOfStackOfIterator*)$self->Access();
    }
};
%feature("shadow") Handle_TopExp_StackNodeOfStackOfIterator::~Handle_TopExp_StackNodeOfStackOfIterator %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TopExp_StackNodeOfStackOfIterator {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TopExp_StackOfIterator;
class TopExp_StackOfIterator {
	public:
		%feature("autodoc", "	:rtype: None
") TopExp_StackOfIterator;
		 TopExp_StackOfIterator ();
		%feature("autodoc", "	:param Other:
	:type Other: TopExp_StackOfIterator &
	:rtype: TopExp_StackOfIterator
") Assign;
		const TopExp_StackOfIterator & Assign (const TopExp_StackOfIterator & Other);
		%feature("autodoc", "	:param Other:
	:type Other: TopExp_StackOfIterator &
	:rtype: TopExp_StackOfIterator
") operator=;
		const TopExp_StackOfIterator & operator = (const TopExp_StackOfIterator & Other);
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "	:rtype: int
") Depth;
		Standard_Integer Depth ();
		%feature("autodoc", "	:rtype: TopoDS_Iterator
") Top;
		const TopoDS_Iterator & Top ();
		%feature("autodoc", "	:param I:
	:type I: TopoDS_Iterator &
	:rtype: None
") Push;
		void Push (const TopoDS_Iterator & I);
		%feature("autodoc", "	:rtype: None
") Pop;
		void Pop ();
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:rtype: TopoDS_Iterator
") ChangeTop;
		TopoDS_Iterator & ChangeTop ();
};


%feature("shadow") TopExp_StackOfIterator::~TopExp_StackOfIterator %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopExp_StackOfIterator {
	void _kill_pointed() {
		delete $self;
	}
};
