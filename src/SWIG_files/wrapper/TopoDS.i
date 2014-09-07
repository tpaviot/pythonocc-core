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
%module (package="OCC") TopoDS

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

%include TopoDS_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%rename(topods) TopoDS;
%nodefaultctor TopoDS;
class TopoDS {
	public:
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	static  TopoDS_Vertex

Basic tool to access the data structure.  Casts shape S to the more specialized return type, Vertex.  
Exceptions  
Standard_TypeMismatch if S cannot be cast to this return type.") Vertex;
		static const TopoDS_Vertex & Vertex (const TopoDS_Shape  S);
		%feature("autodoc", "Args:
	&(TopoDS_Shape)

Returns:
	inline static TopoDS_Vertex

No detailed docstring for this function.") Vertex;
		inline static TopoDS_Vertex & Vertex (TopoDS_Shape &);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	static  TopoDS_Edge

Casts shape S to the more specialized return type, Edge  
Exceptions  
Standard_TypeMismatch if S cannot be cast to this return type.") Edge;
		static const TopoDS_Edge & Edge (const TopoDS_Shape  S);
		%feature("autodoc", "Args:
	&(TopoDS_Shape)

Returns:
	inline static TopoDS_Edge

No detailed docstring for this function.") Edge;
		inline static TopoDS_Edge & Edge (TopoDS_Shape &);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	static  TopoDS_Wire

Casts shape S to the more specialized return type, Wire.  
Exceptions  
Standard_TypeMismatch if S cannot be cast to this return type.") Wire;
		static const TopoDS_Wire & Wire (const TopoDS_Shape  S);
		%feature("autodoc", "Args:
	&(TopoDS_Shape)

Returns:
	inline static TopoDS_Wire

No detailed docstring for this function.") Wire;
		inline static TopoDS_Wire & Wire (TopoDS_Shape &);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	static  TopoDS_Face

Casts shape S to the more specialized return type, Face.  
Exceptions  
Standard_TypeMismatch if S cannot be cast to this return type.") Face;
		static const TopoDS_Face & Face (const TopoDS_Shape  S);
		%feature("autodoc", "Args:
	&(TopoDS_Shape)

Returns:
	inline static TopoDS_Face

No detailed docstring for this function.") Face;
		inline static TopoDS_Face & Face (TopoDS_Shape &);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	static  TopoDS_Shell

Casts shape S to the more specialized return type, Shell.  
Exceptions  
Standard_TypeMismatch if S cannot be cast to this return type.") Shell;
		static const TopoDS_Shell & Shell (const TopoDS_Shape  S);
		%feature("autodoc", "Args:
	&(TopoDS_Shape)

Returns:
	inline static TopoDS_Shell

No detailed docstring for this function.") Shell;
		inline static TopoDS_Shell & Shell (TopoDS_Shape &);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	static  TopoDS_Solid

Casts shape S to the more specialized return type, Solid.  
Exceptions  
Standard_TypeMismatch if S cannot be cast to this return type.") Solid;
		static const TopoDS_Solid & Solid (const TopoDS_Shape  S);
		%feature("autodoc", "Args:
	&(TopoDS_Shape)

Returns:
	inline static TopoDS_Solid

No detailed docstring for this function.") Solid;
		inline static TopoDS_Solid & Solid (TopoDS_Shape &);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	static  TopoDS_CompSolid

Casts shape S to the more specialized return type, CompSolid.  
Exceptions  
Standard_TypeMismatch if S cannot be cast to this return type.") CompSolid;
		static const TopoDS_CompSolid & CompSolid (const TopoDS_Shape  S);
		%feature("autodoc", "Args:
	&(TopoDS_Shape)

Returns:
	inline static TopoDS_CompSolid

No detailed docstring for this function.") CompSolid;
		inline static TopoDS_CompSolid & CompSolid (TopoDS_Shape &);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	static  TopoDS_Compound

Casts shape S to the more specialized return type, Compound.  
Exceptions  
Standard_TypeMismatch if S cannot be cast to this return type.") Compound;
		static const TopoDS_Compound & Compound (const TopoDS_Shape  S);
		%feature("autodoc", "Args:
	&(TopoDS_Shape)

Returns:
	inline static TopoDS_Compound

No detailed docstring for this function.") Compound;
		inline static TopoDS_Compound & Compound (TopoDS_Shape &);
};


%feature("shadow") TopoDS::~TopoDS %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopoDS {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopoDS_Builder;
class TopoDS_Builder {
	public:
		%feature("autodoc", "Args:
	W(TopoDS_Wire)

Returns:
	None

Make an empty Wire.") MakeWire;
		void MakeWire (TopoDS_Wire  W);
		%feature("autodoc", "Args:
	S(TopoDS_Shell)

Returns:
	None

Make an empty Shell.") MakeShell;
		void MakeShell (TopoDS_Shell  S);
		%feature("autodoc", "Args:
	S(TopoDS_Solid)

Returns:
	None

Make a Solid covering the whole 3D space.") MakeSolid;
		void MakeSolid (TopoDS_Solid  S);
		%feature("autodoc", "Args:
	C(TopoDS_CompSolid)

Returns:
	None

Make an empty Composite Solid.") MakeCompSolid;
		void MakeCompSolid (TopoDS_CompSolid  C);
		%feature("autodoc", "Args:
	C(TopoDS_Compound)

Returns:
	None

Make an empty Compound.") MakeCompound;
		void MakeCompound (TopoDS_Compound  C);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	C(TopoDS_Shape)

Returns:
	None

Add the Shape C in the Shape S.  
Exceptions  
- TopoDS_FrozenShape if S is not free and cannot be modified.  
- TopoDS__UnCompatibleShapes if S and C are not compatible.") Add;
		void Add (TopoDS_Shape  S,const TopoDS_Shape  C);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	C(TopoDS_Shape)

Returns:
	None

Remove the Shape C from the Shape S.  
Exceptions  
TopoDS_FrozenShape if S is frozen and cannot be modified.") Remove;
		void Remove (TopoDS_Shape  S,const TopoDS_Shape  C);
};


%feature("shadow") TopoDS_Builder::~TopoDS_Builder %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopoDS_Builder {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopoDS_HShape;
class TopoDS_HShape : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Constructs an empty shape object") TopoDS_HShape;
		 TopoDS_HShape ();
		%feature("autodoc", "Args:
	aShape(TopoDS_Shape)

Returns:
	None

Constructs a shape object defined by the shape aShape.") TopoDS_HShape;
		 TopoDS_HShape (const TopoDS_Shape  aShape);
		%feature("autodoc", "Args:
	aShape(TopoDS_Shape)

Returns:
	None

Loads this shape with the shape aShape") Shape;
		void Shape (const TopoDS_Shape  aShape);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

Returns a reference to a constant TopoDS_Shape based on this shape.") Shape;
		const TopoDS_Shape & Shape ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

Exchanges the TopoDS_Shape object defining this  
shape for another one referencing the same underlying shape  
Accesses the list of shapes within the underlying  
shape referenced by the TopoDS_Shape object.  
Returns a reference to a TopoDS_Shape based on  
this shape. The TopoDS_Shape can be modified.") ChangeShape;
		TopoDS_Shape & ChangeShape ();
};


%feature("shadow") TopoDS_HShape::~TopoDS_HShape %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopoDS_HShape {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TopoDS_HShape {
	Handle_TopoDS_HShape GetHandle() {
	return *(Handle_TopoDS_HShape*) &$self;
	}
};

%nodefaultctor Handle_TopoDS_HShape;
class Handle_TopoDS_HShape : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_TopoDS_HShape();
        Handle_TopoDS_HShape(const Handle_TopoDS_HShape &aHandle);
        Handle_TopoDS_HShape(const TopoDS_HShape *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TopoDS_HShape DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TopoDS_HShape {
    TopoDS_HShape* GetObject() {
    return (TopoDS_HShape*)$self->Access();
    }
};
%feature("shadow") Handle_TopoDS_HShape::~Handle_TopoDS_HShape %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TopoDS_HShape {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TopoDS_Iterator;
class TopoDS_Iterator {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates an empty Iterator.") TopoDS_Iterator;
		 TopoDS_Iterator ();
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	cumOri(Standard_Boolean)=Standard_True
	cumLoc(Standard_Boolean)=Standard_True

Returns:
	None

Creates an Iterator on <S> sub-shapes.  
     Note:  
- If cumOri is true, the function composes all  
  sub-shapes with the orientation of S.  
- If cumLoc is true, the function multiplies all  
  sub-shapes by the location of S, i.e. it applies to  
  each sub-shape the transformation that is associated with S.") TopoDS_Iterator;
		 TopoDS_Iterator (const TopoDS_Shape  S,const Standard_Boolean cumOri = Standard_True,const Standard_Boolean cumLoc = Standard_True);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	cumOri(Standard_Boolean)=Standard_True
	cumLoc(Standard_Boolean)=Standard_True

Returns:
	None

Initializes this iterator with shape S.  
Note:  
- If cumOri is true, the function composes all  
  sub-shapes with the orientation of S.  
- If cumLoc is true, the function multiplies all  
  sub-shapes by the location of S, i.e. it applies to  
  each sub-shape the transformation that is associated with S.") Initialize;
		void Initialize (const TopoDS_Shape  S,const Standard_Boolean cumOri = Standard_True,const Standard_Boolean cumLoc = Standard_True);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns true if there is another sub-shape in the  
shape which this iterator is scanning.") More;
		Standard_Boolean More ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Moves on to the next sub-shape in the shape which  
this iterator is scanning.  
Exceptions  
Standard_NoMoreObject if there are no more sub-shapes in the shape.") Next;
		void Next ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

Returns the current sub-shape in the shape which  
this iterator is scanning.  
Exceptions  
Standard_NoSuchObject if there is no current sub-shape.") Value;
		const TopoDS_Shape & Value ();
};


%feature("shadow") TopoDS_Iterator::~TopoDS_Iterator %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopoDS_Iterator {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopoDS_ListIteratorOfListOfShape;
class TopoDS_ListIteratorOfListOfShape {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TopoDS_ListIteratorOfListOfShape;
		 TopoDS_ListIteratorOfListOfShape ();
		%feature("autodoc", "Args:
	L(TopoDS_ListOfShape)

Returns:
	None

No detailed docstring for this function.") TopoDS_ListIteratorOfListOfShape;
		 TopoDS_ListIteratorOfListOfShape (const TopoDS_ListOfShape  L);
		%feature("autodoc", "Args:
	L(TopoDS_ListOfShape)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const TopoDS_ListOfShape  L);
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
	TopoDS_Shape

No detailed docstring for this function.") Value;
		TopoDS_Shape & Value ();
};


%feature("shadow") TopoDS_ListIteratorOfListOfShape::~TopoDS_ListIteratorOfListOfShape %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopoDS_ListIteratorOfListOfShape {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopoDS_ListNodeOfListOfShape;
class TopoDS_ListNodeOfListOfShape : public TCollection_MapNode {
	public:
		%feature("autodoc", "Args:
	I(TopoDS_Shape)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") TopoDS_ListNodeOfListOfShape;
		 TopoDS_ListNodeOfListOfShape (const TopoDS_Shape  I,const TCollection_MapNodePtr  n);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Value;
		TopoDS_Shape & Value ();
};


%feature("shadow") TopoDS_ListNodeOfListOfShape::~TopoDS_ListNodeOfListOfShape %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopoDS_ListNodeOfListOfShape {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TopoDS_ListNodeOfListOfShape {
	Handle_TopoDS_ListNodeOfListOfShape GetHandle() {
	return *(Handle_TopoDS_ListNodeOfListOfShape*) &$self;
	}
};

%nodefaultctor Handle_TopoDS_ListNodeOfListOfShape;
class Handle_TopoDS_ListNodeOfListOfShape : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_TopoDS_ListNodeOfListOfShape();
        Handle_TopoDS_ListNodeOfListOfShape(const Handle_TopoDS_ListNodeOfListOfShape &aHandle);
        Handle_TopoDS_ListNodeOfListOfShape(const TopoDS_ListNodeOfListOfShape *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TopoDS_ListNodeOfListOfShape DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TopoDS_ListNodeOfListOfShape {
    TopoDS_ListNodeOfListOfShape* GetObject() {
    return (TopoDS_ListNodeOfListOfShape*)$self->Access();
    }
};
%feature("shadow") Handle_TopoDS_ListNodeOfListOfShape::~Handle_TopoDS_ListNodeOfListOfShape %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TopoDS_ListNodeOfListOfShape {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TopoDS_ListOfShape;
class TopoDS_ListOfShape {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") TopoDS_ListOfShape;
		 TopoDS_ListOfShape ();
		%feature("autodoc", "Args:
	Other(TopoDS_ListOfShape)

Returns:
	None

No detailed docstring for this function.") Assign;
		void Assign (const TopoDS_ListOfShape  Other);
		%feature("autodoc", "Args:
	Other(TopoDS_ListOfShape)

Returns:
	None

No detailed docstring for this function.") operator=;
		void operator = (const TopoDS_ListOfShape  Other);
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
	I(TopoDS_Shape)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const TopoDS_Shape  I);
		%feature("autodoc", "Args:
	I(TopoDS_Shape)
	theIt(TopoDS_ListIteratorOfListOfShape)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const TopoDS_Shape  I,TopoDS_ListIteratorOfListOfShape  theIt);
		%feature("autodoc", "Args:
	Other(TopoDS_ListOfShape)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (TopoDS_ListOfShape  Other);
		%feature("autodoc", "Args:
	I(TopoDS_Shape)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const TopoDS_Shape  I);
		%feature("autodoc", "Args:
	I(TopoDS_Shape)
	theIt(TopoDS_ListIteratorOfListOfShape)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const TopoDS_Shape  I,TopoDS_ListIteratorOfListOfShape  theIt);
		%feature("autodoc", "Args:
	Other(TopoDS_ListOfShape)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (TopoDS_ListOfShape  Other);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") First;
		TopoDS_Shape & First ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Last;
		TopoDS_Shape & Last ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") RemoveFirst;
		void RemoveFirst ();
		%feature("autodoc", "Args:
	It(TopoDS_ListIteratorOfListOfShape)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (TopoDS_ListIteratorOfListOfShape  It);
		%feature("autodoc", "Args:
	I(TopoDS_Shape)
	It(TopoDS_ListIteratorOfListOfShape)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const TopoDS_Shape  I,TopoDS_ListIteratorOfListOfShape  It);
		%feature("autodoc", "Args:
	Other(TopoDS_ListOfShape)
	It(TopoDS_ListIteratorOfListOfShape)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (TopoDS_ListOfShape  Other,TopoDS_ListIteratorOfListOfShape  It);
		%feature("autodoc", "Args:
	I(TopoDS_Shape)
	It(TopoDS_ListIteratorOfListOfShape)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const TopoDS_Shape  I,TopoDS_ListIteratorOfListOfShape  It);
		%feature("autodoc", "Args:
	Other(TopoDS_ListOfShape)
	It(TopoDS_ListIteratorOfListOfShape)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (TopoDS_ListOfShape  Other,TopoDS_ListIteratorOfListOfShape  It);
};


%feature("shadow") TopoDS_ListOfShape::~TopoDS_ListOfShape %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopoDS_ListOfShape {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopoDS_Shape;
class TopoDS_Shape {
	public:
		%feature("autodoc", "1");
		TopoDS_Shape(const TopoDS_Shape arg0);
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates a NULL Shape referring to nothing.") TopoDS_Shape;
		 TopoDS_Shape ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns true if this shape is null. In other words, it  
references no underlying shape with the potential to  
be given a location and an orientation.") IsNull;
		Standard_Boolean IsNull ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Destroys the reference to the underlying shape  
stored in this shape. As a result, this shape becomes null.") Nullify;
		void Nullify ();
		%feature("autodoc", "Args:
	None
Returns:
	TopLoc_Location

Returns the shape local coordinate system.") Location;
		const TopLoc_Location & Location ();
		%feature("autodoc", "Args:
	Loc(TopLoc_Location)

Returns:
	None

Sets the shape local coordinate system.") Location;
		void Location (const TopLoc_Location  Loc);
		%feature("autodoc", "Args:
	Loc(TopLoc_Location)

Returns:
	TopoDS_Shape

Returns a  shape  similar to <self> with   the local  
         coordinate system set to <Loc>.") Located;
		TopoDS_Shape Located (const TopLoc_Location  Loc);
		%feature("autodoc", "Args:
	None
Returns:
	TopAbs_Orientation

Returns the shape orientation.") Orientation;
		TopAbs_Orientation Orientation ();
		%feature("autodoc", "Args:
	Orient(TopAbs_Orientation)

Returns:
	None

Sets the shape orientation.") Orientation;
		void Orientation (const TopAbs_Orientation Orient);
		%feature("autodoc", "Args:
	Or(TopAbs_Orientation)

Returns:
	TopoDS_Shape

Returns  a    shape  similar  to  <self>   with  the  
         orientation set to <Or>.") Oriented;
		TopoDS_Shape Oriented (const TopAbs_Orientation Or);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TopoDS_TShape

No detailed docstring for this function.") TShape;
		const Handle_TopoDS_TShape & TShape ();
		%feature("autodoc", "Args:
	None
Returns:
	TopAbs_ShapeEnum

Returns the value of the TopAbs_ShapeEnum  
enumeration that corresponds to this shape, for  
example VERTEX, EDGE, and so on.  
Exceptions  
Standard_NullObject if this shape is null.") ShapeType;
		TopAbs_ShapeEnum ShapeType ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns the free flag.") Free;
		Standard_Boolean Free ();
		%feature("autodoc", "Args:
	F(Standard_Boolean)

Returns:
	None

Sets the free flag.") Free;
		void Free (const Standard_Boolean F);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns the modification flag.") Modified;
		Standard_Boolean Modified ();
		%feature("autodoc", "Args:
	M(Standard_Boolean)

Returns:
	None

Sets the modification flag.") Modified;
		void Modified (const Standard_Boolean M);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns the checked flag.") Checked;
		Standard_Boolean Checked ();
		%feature("autodoc", "Args:
	C(Standard_Boolean)

Returns:
	None

Sets the checked flag.") Checked;
		void Checked (const Standard_Boolean C);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns the orientability flag.") Orientable;
		Standard_Boolean Orientable ();
		%feature("autodoc", "Args:
	C(Standard_Boolean)

Returns:
	None

Sets the orientability flag.") Orientable;
		void Orientable (const Standard_Boolean C);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns the closedness flag.") Closed;
		Standard_Boolean Closed ();
		%feature("autodoc", "Args:
	C(Standard_Boolean)

Returns:
	None

Sets the closedness flag.") Closed;
		void Closed (const Standard_Boolean C);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns the infinity flag.") Infinite;
		Standard_Boolean Infinite ();
		%feature("autodoc", "Args:
	C(Standard_Boolean)

Returns:
	None

Sets the infinity flag.") Infinite;
		void Infinite (const Standard_Boolean C);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns the convexness flag.") Convex;
		Standard_Boolean Convex ();
		%feature("autodoc", "Args:
	C(Standard_Boolean)

Returns:
	None

Sets the convexness flag.") Convex;
		void Convex (const Standard_Boolean C);
		%feature("autodoc", "Args:
	position(TopLoc_Location)

Returns:
	None

Multiplies the Shape location by <position>.") Move;
		void Move (const TopLoc_Location  position);
		%feature("autodoc", "Args:
	position(TopLoc_Location)

Returns:
	TopoDS_Shape

Returns  a shape similar  to  <self> with a location  
         multiplied  by <position>.") Moved;
		TopoDS_Shape Moved (const TopLoc_Location  position);
		%feature("autodoc", "Args:
	None
Returns:
	None

Reverses the orientation, using the Reverse method  
         from the TopAbs package.") Reverse;
		void Reverse ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

Returns    a shape  similar    to  <self>  with  the  
         orientation  reversed, using  the   Reverse method  
         from the TopAbs package.") Reversed;
		TopoDS_Shape Reversed ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Complements the orientation, using the  Complement  
         method from the TopAbs package.") Complement;
		void Complement ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

Returns  a   shape  similar  to   <self>   with  the  
         orientation complemented,  using   the  Complement  
         method from the TopAbs package.") Complemented;
		TopoDS_Shape Complemented ();
		%feature("autodoc", "Args:
	Orient(TopAbs_Orientation)

Returns:
	None

Updates the  Shape Orientation by composition with  
         <Orient>, using the Compose method from the TopAbs  
         package.") Compose;
		void Compose (const TopAbs_Orientation Orient);
		%feature("autodoc", "Args:
	Orient(TopAbs_Orientation)

Returns:
	TopoDS_Shape

Returns  a  shape   similar   to  <self>   with  the  
         orientation  composed  with <Orient>,   using  the  
         Compose method from the TopAbs package.") Composed;
		TopoDS_Shape Composed (const TopAbs_Orientation Orient);
		%feature("autodoc", "Args:
	other(TopoDS_Shape)

Returns:
	Standard_Boolean

Returns True if two shapes  are partners, i.e.  if  
         they   share   the   same  TShape.  Locations  and  
         Orientations may differ.") IsPartner;
		Standard_Boolean IsPartner (const TopoDS_Shape  other);
		%feature("autodoc", "Args:
	other(TopoDS_Shape)

Returns:
	Standard_Boolean

Returns True if two shapes are same, i.e.  if they  
         share  the  same TShape  with the same  Locations.  
         Orientations may differ.") IsSame;
		Standard_Boolean IsSame (const TopoDS_Shape  other);
		%feature("autodoc", "Args:
	other(TopoDS_Shape)

Returns:
	Standard_Boolean

Returns True if two shapes are equal, i.e. if they  
         share the same TShape with  the same Locations and  
         Orientations.") IsEqual;
		Standard_Boolean IsEqual (const TopoDS_Shape  other);

        %extend{
            bool __eq_wrapper__(const TopoDS_Shape  other) {
            if (*self==other) return true;
            else return false;
            }
        }
        %pythoncode {
        def __eq__(self,right):
            try:
                return self.__eq_wrapper__(right)
            except:
                return False
        }
        		%feature("autodoc", "Args:
	other(TopoDS_Shape)

Returns:
	Standard_Boolean

Negation of the IsEqual method.") IsNotEqual;
		Standard_Boolean IsNotEqual (const TopoDS_Shape  other);

        %extend{
            bool __ne_wrapper__(const TopoDS_Shape  other) {
            if (*self!=other) return true;
            else return false;
            }
        }
        %pythoncode {
        def __ne__(self,right):
            try:
                return self.__ne_wrapper__(right)
            except:
                return True
        }
        		%feature("autodoc", "Args:
	Upper(Standard_Integer)

Returns:
	Standard_Integer

Returns a hashed value  denoting <self>.  This value  
         is in the range  1..<Upper>.  It is  computed from  
         the  TShape  and the  Location. The Orientation is  
         not used.") HashCode;
		Standard_Integer HashCode (const Standard_Integer Upper);

        %extend {
            Standard_Integer __hash__() {
            return $self->HashCode(2147483647);
            }
        };
        		%feature("autodoc", "Args:
	None
Returns:
	None

Replace   <self> by  a  new   Shape with the    same  
         Orientation and Location and a new TShape with the  
         same geometry and no sub-shapes.") EmptyCopy;
		void EmptyCopy ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

Returns a new Shape with the  same Orientation and  
         Location and  a new TShape  with the same geometry  
         and no sub-shapes.") EmptyCopied;
		TopoDS_Shape EmptyCopied ();
		%feature("autodoc", "Args:
	T(Handle_TopoDS_TShape)

Returns:
	None

No detailed docstring for this function.") TShape;
		void TShape (const Handle_TopoDS_TShape  T);
};


%feature("shadow") TopoDS_Shape::~TopoDS_Shape %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopoDS_Shape {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TopoDS_Shape {
%pythoncode {
	def __getstate__(self):
		from .BRepTools import BRepTools_ShapeSet
		ss = BRepTools_ShapeSet()
		ss.Add(self)
		str_shape = ss.WriteToString()
		indx = ss.Locations().Index(self.Location())
		return str_shape, indx
	def __setstate__(self, state):
		from .BRepTools import BRepTools_ShapeSet
		topods_str, indx = state
		ss = BRepTools_ShapeSet()
		ss.ReadFromString(topods_str)
		the_shape = ss.Shape(ss.NbShapes())
		location = ss.Locations().Location(indx)
		the_shape.Location(location)
		self.this = the_shape.this
	}
};
%nodefaultctor TopoDS_TShape;
class TopoDS_TShape : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns the free flag.") Free;
		Standard_Boolean Free ();
		%feature("autodoc", "Args:
	F(Standard_Boolean)

Returns:
	None

Sets the free flag.") Free;
		void Free (const Standard_Boolean F);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns the modification flag.") Modified;
		Standard_Boolean Modified ();
		%feature("autodoc", "Args:
	M(Standard_Boolean)

Returns:
	None

Sets the modification flag.") Modified;
		void Modified (const Standard_Boolean M);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns the checked flag.") Checked;
		Standard_Boolean Checked ();
		%feature("autodoc", "Args:
	C(Standard_Boolean)

Returns:
	None

Sets the checked flag.") Checked;
		void Checked (const Standard_Boolean C);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns the orientability flag.") Orientable;
		Standard_Boolean Orientable ();
		%feature("autodoc", "Args:
	C(Standard_Boolean)

Returns:
	None

Sets the orientability flag.") Orientable;
		void Orientable (const Standard_Boolean C);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns the closedness flag.") Closed;
		Standard_Boolean Closed ();
		%feature("autodoc", "Args:
	C(Standard_Boolean)

Returns:
	None

Sets the closedness flag.") Closed;
		void Closed (const Standard_Boolean C);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns the infinity flag.") Infinite;
		Standard_Boolean Infinite ();
		%feature("autodoc", "Args:
	C(Standard_Boolean)

Returns:
	None

Sets the infinity flag.") Infinite;
		void Infinite (const Standard_Boolean C);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns the convexness flag.") Convex;
		Standard_Boolean Convex ();
		%feature("autodoc", "Args:
	C(Standard_Boolean)

Returns:
	None

Sets the convexness flag.") Convex;
		void Convex (const Standard_Boolean C);
		%feature("autodoc", "Args:
	None
Returns:
	virtual TopAbs_ShapeEnum

Returns the type as a term of the ShapeEnum enum :  
         VERTEX, EDGE, WIRE, FACE, ....") ShapeType;
		virtual TopAbs_ShapeEnum ShapeType ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Handle_TopoDS_TShape

Returns a copy  of the  TShape  with no sub-shapes.") EmptyCopy;
		virtual Handle_TopoDS_TShape EmptyCopy ();
};


%feature("shadow") TopoDS_TShape::~TopoDS_TShape %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopoDS_TShape {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TopoDS_TShape {
	Handle_TopoDS_TShape GetHandle() {
	return *(Handle_TopoDS_TShape*) &$self;
	}
};

%nodefaultctor Handle_TopoDS_TShape;
class Handle_TopoDS_TShape : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_TopoDS_TShape();
        Handle_TopoDS_TShape(const Handle_TopoDS_TShape &aHandle);
        Handle_TopoDS_TShape(const TopoDS_TShape *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TopoDS_TShape DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TopoDS_TShape {
    TopoDS_TShape* GetObject() {
    return (TopoDS_TShape*)$self->Access();
    }
};
%feature("shadow") Handle_TopoDS_TShape::~Handle_TopoDS_TShape %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TopoDS_TShape {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TopoDS_CompSolid;
class TopoDS_CompSolid : public TopoDS_Shape {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Constructs an Undefined CompSolid.") TopoDS_CompSolid;
		 TopoDS_CompSolid ();
};


%feature("shadow") TopoDS_CompSolid::~TopoDS_CompSolid %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopoDS_CompSolid {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopoDS_Compound;
class TopoDS_Compound : public TopoDS_Shape {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Constructs an Undefined Compound.") TopoDS_Compound;
		 TopoDS_Compound ();
};


%feature("shadow") TopoDS_Compound::~TopoDS_Compound %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopoDS_Compound {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopoDS_Edge;
class TopoDS_Edge : public TopoDS_Shape {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Undefined Edge.") TopoDS_Edge;
		 TopoDS_Edge ();
};


%feature("shadow") TopoDS_Edge::~TopoDS_Edge %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopoDS_Edge {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopoDS_Face;
class TopoDS_Face : public TopoDS_Shape {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Undefined Face.") TopoDS_Face;
		 TopoDS_Face ();
};


%feature("shadow") TopoDS_Face::~TopoDS_Face %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopoDS_Face {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopoDS_Shell;
class TopoDS_Shell : public TopoDS_Shape {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Constructs an Undefined Shell.") TopoDS_Shell;
		 TopoDS_Shell ();
};


%feature("shadow") TopoDS_Shell::~TopoDS_Shell %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopoDS_Shell {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopoDS_Solid;
class TopoDS_Solid : public TopoDS_Shape {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Constructs an Undefined Solid.") TopoDS_Solid;
		 TopoDS_Solid ();
};


%feature("shadow") TopoDS_Solid::~TopoDS_Solid %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopoDS_Solid {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopoDS_TCompSolid;
class TopoDS_TCompSolid : public TopoDS_TShape {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates an empty TCompSolid.") TopoDS_TCompSolid;
		 TopoDS_TCompSolid ();
		%feature("autodoc", "Args:
	None
Returns:
	TopAbs_ShapeEnum

returns COMPSOLID") ShapeType;
		TopAbs_ShapeEnum ShapeType ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TopoDS_TShape

Returns an empty TCompSolid.") EmptyCopy;
		Handle_TopoDS_TShape EmptyCopy ();
};


%feature("shadow") TopoDS_TCompSolid::~TopoDS_TCompSolid %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopoDS_TCompSolid {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TopoDS_TCompSolid {
	Handle_TopoDS_TCompSolid GetHandle() {
	return *(Handle_TopoDS_TCompSolid*) &$self;
	}
};

%nodefaultctor Handle_TopoDS_TCompSolid;
class Handle_TopoDS_TCompSolid : public Handle_TopoDS_TShape {

    public:
        // constructors
        Handle_TopoDS_TCompSolid();
        Handle_TopoDS_TCompSolid(const Handle_TopoDS_TCompSolid &aHandle);
        Handle_TopoDS_TCompSolid(const TopoDS_TCompSolid *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TopoDS_TCompSolid DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TopoDS_TCompSolid {
    TopoDS_TCompSolid* GetObject() {
    return (TopoDS_TCompSolid*)$self->Access();
    }
};
%feature("shadow") Handle_TopoDS_TCompSolid::~Handle_TopoDS_TCompSolid %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TopoDS_TCompSolid {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TopoDS_TCompound;
class TopoDS_TCompound : public TopoDS_TShape {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates an empty TCompound.") TopoDS_TCompound;
		 TopoDS_TCompound ();
		%feature("autodoc", "Args:
	None
Returns:
	TopAbs_ShapeEnum

Returns COMPOUND.") ShapeType;
		TopAbs_ShapeEnum ShapeType ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TopoDS_TShape

Returns an empty TCompound.") EmptyCopy;
		Handle_TopoDS_TShape EmptyCopy ();
};


%feature("shadow") TopoDS_TCompound::~TopoDS_TCompound %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopoDS_TCompound {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TopoDS_TCompound {
	Handle_TopoDS_TCompound GetHandle() {
	return *(Handle_TopoDS_TCompound*) &$self;
	}
};

%nodefaultctor Handle_TopoDS_TCompound;
class Handle_TopoDS_TCompound : public Handle_TopoDS_TShape {

    public:
        // constructors
        Handle_TopoDS_TCompound();
        Handle_TopoDS_TCompound(const Handle_TopoDS_TCompound &aHandle);
        Handle_TopoDS_TCompound(const TopoDS_TCompound *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TopoDS_TCompound DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TopoDS_TCompound {
    TopoDS_TCompound* GetObject() {
    return (TopoDS_TCompound*)$self->Access();
    }
};
%feature("shadow") Handle_TopoDS_TCompound::~Handle_TopoDS_TCompound %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TopoDS_TCompound {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TopoDS_TEdge;
class TopoDS_TEdge : public TopoDS_TShape {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	TopAbs_ShapeEnum

Returns  EDGE.") ShapeType;
		TopAbs_ShapeEnum ShapeType ();
};


%feature("shadow") TopoDS_TEdge::~TopoDS_TEdge %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopoDS_TEdge {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TopoDS_TEdge {
	Handle_TopoDS_TEdge GetHandle() {
	return *(Handle_TopoDS_TEdge*) &$self;
	}
};

%nodefaultctor Handle_TopoDS_TEdge;
class Handle_TopoDS_TEdge : public Handle_TopoDS_TShape {

    public:
        // constructors
        Handle_TopoDS_TEdge();
        Handle_TopoDS_TEdge(const Handle_TopoDS_TEdge &aHandle);
        Handle_TopoDS_TEdge(const TopoDS_TEdge *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TopoDS_TEdge DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TopoDS_TEdge {
    TopoDS_TEdge* GetObject() {
    return (TopoDS_TEdge*)$self->Access();
    }
};
%feature("shadow") Handle_TopoDS_TEdge::~Handle_TopoDS_TEdge %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TopoDS_TEdge {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TopoDS_TFace;
class TopoDS_TFace : public TopoDS_TShape {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates an empty TFace.") TopoDS_TFace;
		 TopoDS_TFace ();
		%feature("autodoc", "Args:
	None
Returns:
	TopAbs_ShapeEnum

returns FACE.") ShapeType;
		TopAbs_ShapeEnum ShapeType ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Handle_TopoDS_TShape

Returns an empty TFace.") EmptyCopy;
		virtual Handle_TopoDS_TShape EmptyCopy ();
};


%feature("shadow") TopoDS_TFace::~TopoDS_TFace %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopoDS_TFace {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TopoDS_TFace {
	Handle_TopoDS_TFace GetHandle() {
	return *(Handle_TopoDS_TFace*) &$self;
	}
};

%nodefaultctor Handle_TopoDS_TFace;
class Handle_TopoDS_TFace : public Handle_TopoDS_TShape {

    public:
        // constructors
        Handle_TopoDS_TFace();
        Handle_TopoDS_TFace(const Handle_TopoDS_TFace &aHandle);
        Handle_TopoDS_TFace(const TopoDS_TFace *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TopoDS_TFace DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TopoDS_TFace {
    TopoDS_TFace* GetObject() {
    return (TopoDS_TFace*)$self->Access();
    }
};
%feature("shadow") Handle_TopoDS_TFace::~Handle_TopoDS_TFace %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TopoDS_TFace {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TopoDS_TShell;
class TopoDS_TShell : public TopoDS_TShape {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates an empty TShell.") TopoDS_TShell;
		 TopoDS_TShell ();
		%feature("autodoc", "Args:
	None
Returns:
	TopAbs_ShapeEnum

Returns SHELL.") ShapeType;
		TopAbs_ShapeEnum ShapeType ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TopoDS_TShape

Returns an empty TShell.") EmptyCopy;
		Handle_TopoDS_TShape EmptyCopy ();
};


%feature("shadow") TopoDS_TShell::~TopoDS_TShell %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopoDS_TShell {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TopoDS_TShell {
	Handle_TopoDS_TShell GetHandle() {
	return *(Handle_TopoDS_TShell*) &$self;
	}
};

%nodefaultctor Handle_TopoDS_TShell;
class Handle_TopoDS_TShell : public Handle_TopoDS_TShape {

    public:
        // constructors
        Handle_TopoDS_TShell();
        Handle_TopoDS_TShell(const Handle_TopoDS_TShell &aHandle);
        Handle_TopoDS_TShell(const TopoDS_TShell *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TopoDS_TShell DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TopoDS_TShell {
    TopoDS_TShell* GetObject() {
    return (TopoDS_TShell*)$self->Access();
    }
};
%feature("shadow") Handle_TopoDS_TShell::~Handle_TopoDS_TShell %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TopoDS_TShell {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TopoDS_TSolid;
class TopoDS_TSolid : public TopoDS_TShape {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates an empty TSolid.") TopoDS_TSolid;
		 TopoDS_TSolid ();
		%feature("autodoc", "Args:
	None
Returns:
	TopAbs_ShapeEnum

returns SOLID.") ShapeType;
		TopAbs_ShapeEnum ShapeType ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TopoDS_TShape

Returns an empty TSolid.") EmptyCopy;
		Handle_TopoDS_TShape EmptyCopy ();
};


%feature("shadow") TopoDS_TSolid::~TopoDS_TSolid %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopoDS_TSolid {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TopoDS_TSolid {
	Handle_TopoDS_TSolid GetHandle() {
	return *(Handle_TopoDS_TSolid*) &$self;
	}
};

%nodefaultctor Handle_TopoDS_TSolid;
class Handle_TopoDS_TSolid : public Handle_TopoDS_TShape {

    public:
        // constructors
        Handle_TopoDS_TSolid();
        Handle_TopoDS_TSolid(const Handle_TopoDS_TSolid &aHandle);
        Handle_TopoDS_TSolid(const TopoDS_TSolid *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TopoDS_TSolid DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TopoDS_TSolid {
    TopoDS_TSolid* GetObject() {
    return (TopoDS_TSolid*)$self->Access();
    }
};
%feature("shadow") Handle_TopoDS_TSolid::~Handle_TopoDS_TSolid %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TopoDS_TSolid {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TopoDS_TVertex;
class TopoDS_TVertex : public TopoDS_TShape {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	TopAbs_ShapeEnum

Returns VERTEX.") ShapeType;
		TopAbs_ShapeEnum ShapeType ();
};


%feature("shadow") TopoDS_TVertex::~TopoDS_TVertex %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopoDS_TVertex {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TopoDS_TVertex {
	Handle_TopoDS_TVertex GetHandle() {
	return *(Handle_TopoDS_TVertex*) &$self;
	}
};

%nodefaultctor Handle_TopoDS_TVertex;
class Handle_TopoDS_TVertex : public Handle_TopoDS_TShape {

    public:
        // constructors
        Handle_TopoDS_TVertex();
        Handle_TopoDS_TVertex(const Handle_TopoDS_TVertex &aHandle);
        Handle_TopoDS_TVertex(const TopoDS_TVertex *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TopoDS_TVertex DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TopoDS_TVertex {
    TopoDS_TVertex* GetObject() {
    return (TopoDS_TVertex*)$self->Access();
    }
};
%feature("shadow") Handle_TopoDS_TVertex::~Handle_TopoDS_TVertex %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TopoDS_TVertex {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TopoDS_TWire;
class TopoDS_TWire : public TopoDS_TShape {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates an empty TWire.") TopoDS_TWire;
		 TopoDS_TWire ();
		%feature("autodoc", "Args:
	None
Returns:
	TopAbs_ShapeEnum

Returns WIRE.") ShapeType;
		TopAbs_ShapeEnum ShapeType ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TopoDS_TShape

Returns an empty TWire.") EmptyCopy;
		Handle_TopoDS_TShape EmptyCopy ();
};


%feature("shadow") TopoDS_TWire::~TopoDS_TWire %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopoDS_TWire {
	void _kill_pointed() {
		delete $self;
	}
};
%extend TopoDS_TWire {
	Handle_TopoDS_TWire GetHandle() {
	return *(Handle_TopoDS_TWire*) &$self;
	}
};

%nodefaultctor Handle_TopoDS_TWire;
class Handle_TopoDS_TWire : public Handle_TopoDS_TShape {

    public:
        // constructors
        Handle_TopoDS_TWire();
        Handle_TopoDS_TWire(const Handle_TopoDS_TWire &aHandle);
        Handle_TopoDS_TWire(const TopoDS_TWire *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_TopoDS_TWire DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TopoDS_TWire {
    TopoDS_TWire* GetObject() {
    return (TopoDS_TWire*)$self->Access();
    }
};
%feature("shadow") Handle_TopoDS_TWire::~Handle_TopoDS_TWire %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_TopoDS_TWire {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor TopoDS_Vertex;
class TopoDS_Vertex : public TopoDS_Shape {
	public:
		%feature("autodoc", "1");
		TopoDS_Vertex(const TopoDS_Vertex arg0);
		%feature("autodoc", "Args:
	None
Returns:
	None

Undefined Vertex.") TopoDS_Vertex;
		 TopoDS_Vertex ();
};


%feature("shadow") TopoDS_Vertex::~TopoDS_Vertex %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopoDS_Vertex {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor TopoDS_Wire;
class TopoDS_Wire : public TopoDS_Shape {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Undefined Wire.") TopoDS_Wire;
		 TopoDS_Wire ();
};


%feature("shadow") TopoDS_Wire::~TopoDS_Wire %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend TopoDS_Wire {
	void _kill_pointed() {
		delete $self;
	}
};
