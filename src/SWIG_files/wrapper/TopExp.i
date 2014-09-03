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
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	T(TopAbs_ShapeEnum)
	M(TopTools_IndexedMapOfShape)

Returns:
	static void

Tool to explore a topological data structure.  Stores in the map <M> all  the sub-shapes of <S>  
         of type <T>.  
 
 Warning: The map is not cleared at first.") MapShapes;
		static void MapShapes (const TopoDS_Shape & S,const TopAbs_ShapeEnum T,TopTools_IndexedMapOfShape & M);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	M(TopTools_IndexedMapOfShape)

Returns:
	static void

Stores in the map <M> all  the sub-shapes of <S>.") MapShapes;
		static void MapShapes (const TopoDS_Shape & S,TopTools_IndexedMapOfShape & M);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	TS(TopAbs_ShapeEnum)
	TA(TopAbs_ShapeEnum)
	M(TopTools_IndexedDataMapOfShapeListOfShape)

Returns:
	static void

Stores in the map <M> all the subshape of <S> of  
         type <TS>  for each one append  to  the list all  
         the ancestors of type <TA>.  For example map all  
         the edges and bind the list of faces.  
 Warning: The map is not cleared at first.") MapShapesAndAncestors;
		static void MapShapesAndAncestors (const TopoDS_Shape & S,const TopAbs_ShapeEnum TS,const TopAbs_ShapeEnum TA,TopTools_IndexedDataMapOfShapeListOfShape & M);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)
	CumOri(Standard_Boolean)=Standard_False

Returns:
	static TopoDS_Vertex

Returns the Vertex of orientation FORWARD in E. If  
         there is none returns a Null Shape.  
         CumOri = True : taking account the edge orientation") FirstVertex;
		static TopoDS_Vertex FirstVertex (const TopoDS_Edge & E,const Standard_Boolean CumOri = Standard_False);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)
	CumOri(Standard_Boolean)=Standard_False

Returns:
	static TopoDS_Vertex

Returns the Vertex of orientation REVERSED in E. If  
         there is none returns a Null Shape.  
         CumOri = True : taking account the edge orientation") LastVertex;
		static TopoDS_Vertex LastVertex (const TopoDS_Edge & E,const Standard_Boolean CumOri = Standard_False);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)
	Vfirst(TopoDS_Vertex)
	Vlast(TopoDS_Vertex)
	CumOri(Standard_Boolean)=Standard_False

Returns:
	static void

Returns in Vfirst, Vlast the  FORWARD and REVERSED  
         vertices of the edge <E>. May be null shapes.  
         CumOri = True : taking account the edge orientation") Vertices;
		static void Vertices (const TopoDS_Edge & E,TopoDS_Vertex & Vfirst,TopoDS_Vertex & Vlast,const Standard_Boolean CumOri = Standard_False);
		%feature("autodoc", "Args:
	W(TopoDS_Wire)
	Vfirst(TopoDS_Vertex)
	Vlast(TopoDS_Vertex)

Returns:
	static void

Returns  in  Vfirst,  Vlast   the first   and last  
         vertices of the open wire <W>. May be null shapes.  
         if   <W>  is closed Vfirst and Vlast  are a same  
         vertex on <W>.  
         if <W> is no manifold. VFirst and VLast are null  
         shapes.") Vertices;
		static void Vertices (const TopoDS_Wire & W,TopoDS_Vertex & Vfirst,TopoDS_Vertex & Vlast);
		%feature("autodoc", "Args:
	E1(TopoDS_Edge)
	E2(TopoDS_Edge)
	V(TopoDS_Vertex)

Returns:
	static Standard_Boolean

Finds   the  vertex <V> common   to  the two edges  
         <E1,E2>, returns True if this vertex exists.  
 
 Warning: <V> has sense only if the value <True> is returned") CommonVertex;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates an empty explorer, becomes usefull after Init.") TopExp_Explorer;
		 TopExp_Explorer ();
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	ToFind(TopAbs_ShapeEnum)
	ToAvoid(TopAbs_ShapeEnum)=TopAbs_SHAPE

Returns:
	None

Creates an Explorer on the Shape <S>.  
 
         <ToFind> is the type of shapes to search.  
             TopAbs_VERTEX, TopAbs_EDGE, ...  
 
         <ToAvoid>   is the type   of shape to  skip in the  
         exploration.   If   <ToAvoid>  is  equal  or  less  
         complex than <ToFind> or if  <ToAVoid> is SHAPE it  
         has no effect on the exploration.") TopExp_Explorer;
		 TopExp_Explorer (const TopoDS_Shape & S,const TopAbs_ShapeEnum ToFind,const TopAbs_ShapeEnum ToAvoid = TopAbs_SHAPE);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	ToFind(TopAbs_ShapeEnum)
	ToAvoid(TopAbs_ShapeEnum)=TopAbs_SHAPE

Returns:
	None

Resets this explorer on the shape S. It is initialized to  
search the shape S, for shapes of type ToFind, that  
are not part of a shape ToAvoid.  
If the shape ToAvoid is equal to TopAbs_SHAPE, or  
if it is the same as, or less complex than, the shape  
ToFind it has no effect on the search.") Init;
		void Init (const TopoDS_Shape & S,const TopAbs_ShapeEnum ToFind,const TopAbs_ShapeEnum ToAvoid = TopAbs_SHAPE);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns  True if  there are   more  shapes in  the  
         exploration.") More;
		Standard_Boolean More ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Moves to the next Shape in the exploration.  
Exceptions  
Standard_NoMoreObject if there are no more shapes to explore.") Next;
		void Next ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

Returns the current shape in the exploration.  
Exceptions  
Standard_NoSuchObject if this explorer has no more shapes to explore.") Current;
		const TopoDS_Shape & Current ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Reinitialize  the    exploration with the original  
         arguments.") ReInit;
		void ReInit ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the current depth of the exploration. 0 is  
         the shape to explore itself.") Depth;
		Standard_Integer Depth ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Clears the content of the explorer. It will return  
         False on More().") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Destroy;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TopExp_StackIteratorOfStackOfIterator;
		 TopExp_StackIteratorOfStackOfIterator ();
		%feature("autodoc", "Args:
	S(TopExp_StackOfIterator)

Returns:
	None

No detailed docstring for this function.") TopExp_StackIteratorOfStackOfIterator;
		 TopExp_StackIteratorOfStackOfIterator (const TopExp_StackOfIterator & S);
		%feature("autodoc", "Args:
	S(TopExp_StackOfIterator)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const TopExp_StackOfIterator & S);
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
	TopoDS_Iterator

No detailed docstring for this function.") Value;
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
		%feature("autodoc", "Args:
	I(TopoDS_Iterator)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") TopExp_StackNodeOfStackOfIterator;
		 TopExp_StackNodeOfStackOfIterator (const TopoDS_Iterator & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Iterator

No detailed docstring for this function.") Value;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TopExp_StackOfIterator;
		 TopExp_StackOfIterator ();
		%feature("autodoc", "Args:
	Other(TopExp_StackOfIterator)

Returns:
	TopExp_StackOfIterator

No detailed docstring for this function.") Assign;
		const TopExp_StackOfIterator & Assign (const TopExp_StackOfIterator & Other);
		%feature("autodoc", "Args:
	Other(TopExp_StackOfIterator)

Returns:
	TopExp_StackOfIterator

No detailed docstring for this function.") operator=;
		const TopExp_StackOfIterator & operator = (const TopExp_StackOfIterator & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Depth;
		Standard_Integer Depth ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Iterator

No detailed docstring for this function.") Top;
		const TopoDS_Iterator & Top ();
		%feature("autodoc", "Args:
	I(TopoDS_Iterator)

Returns:
	None

No detailed docstring for this function.") Push;
		void Push (const TopoDS_Iterator & I);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Pop;
		void Pop ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Iterator

No detailed docstring for this function.") ChangeTop;
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
