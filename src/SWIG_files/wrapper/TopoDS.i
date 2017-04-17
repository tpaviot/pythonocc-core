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
%module (package="OCC") TopoDS

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


%include TopoDS_headers.i


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

%rename(topods) TopoDS;
class TopoDS {
	public:
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "	* Basic tool to access the data structure. Casts shape S to the more specialized return type, Vertex. Exceptions Standard_TypeMismatch if S cannot be cast to this return type.

	:param S:
	:type S: TopoDS_Shape &
	:rtype: TopoDS_Vertex
") Vertex;
		static const TopoDS_Vertex  Vertex (const TopoDS_Shape & S);
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "	:param &:
	:type &: TopoDS_Shape
	:rtype: inline TopoDS_Vertex
") Vertex;
		inline static TopoDS_Vertex  Vertex (TopoDS_Shape &);
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "	* Casts shape S to the more specialized return type, Edge Exceptions Standard_TypeMismatch if S cannot be cast to this return type.

	:param S:
	:type S: TopoDS_Shape &
	:rtype: TopoDS_Edge
") Edge;
		static const TopoDS_Edge  Edge (const TopoDS_Shape & S);
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "	:param &:
	:type &: TopoDS_Shape
	:rtype: inline TopoDS_Edge
") Edge;
		inline static TopoDS_Edge  Edge (TopoDS_Shape &);
		%feature("compactdefaultargs") Wire;
		%feature("autodoc", "	* Casts shape S to the more specialized return type, Wire. Exceptions Standard_TypeMismatch if S cannot be cast to this return type.

	:param S:
	:type S: TopoDS_Shape &
	:rtype: TopoDS_Wire
") Wire;
		static const TopoDS_Wire  Wire (const TopoDS_Shape & S);
		%feature("compactdefaultargs") Wire;
		%feature("autodoc", "	:param &:
	:type &: TopoDS_Shape
	:rtype: inline TopoDS_Wire
") Wire;
		inline static TopoDS_Wire  Wire (TopoDS_Shape &);
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "	* Casts shape S to the more specialized return type, Face. Exceptions Standard_TypeMismatch if S cannot be cast to this return type.

	:param S:
	:type S: TopoDS_Shape &
	:rtype: TopoDS_Face
") Face;
		static const TopoDS_Face  Face (const TopoDS_Shape & S);
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "	:param &:
	:type &: TopoDS_Shape
	:rtype: inline TopoDS_Face
") Face;
		inline static TopoDS_Face  Face (TopoDS_Shape &);
		%feature("compactdefaultargs") Shell;
		%feature("autodoc", "	* Casts shape S to the more specialized return type, Shell. Exceptions Standard_TypeMismatch if S cannot be cast to this return type.

	:param S:
	:type S: TopoDS_Shape &
	:rtype: TopoDS_Shell
") Shell;
		static const TopoDS_Shell  Shell (const TopoDS_Shape & S);
		%feature("compactdefaultargs") Shell;
		%feature("autodoc", "	:param &:
	:type &: TopoDS_Shape
	:rtype: inline TopoDS_Shell
") Shell;
		inline static TopoDS_Shell  Shell (TopoDS_Shape &);
		%feature("compactdefaultargs") Solid;
		%feature("autodoc", "	* Casts shape S to the more specialized return type, Solid. Exceptions Standard_TypeMismatch if S cannot be cast to this return type.

	:param S:
	:type S: TopoDS_Shape &
	:rtype: TopoDS_Solid
") Solid;
		static const TopoDS_Solid  Solid (const TopoDS_Shape & S);
		%feature("compactdefaultargs") Solid;
		%feature("autodoc", "	:param &:
	:type &: TopoDS_Shape
	:rtype: inline TopoDS_Solid
") Solid;
		inline static TopoDS_Solid  Solid (TopoDS_Shape &);
		%feature("compactdefaultargs") CompSolid;
		%feature("autodoc", "	* Casts shape S to the more specialized return type, CompSolid. Exceptions Standard_TypeMismatch if S cannot be cast to this return type.

	:param S:
	:type S: TopoDS_Shape &
	:rtype: TopoDS_CompSolid
") CompSolid;
		static const TopoDS_CompSolid  CompSolid (const TopoDS_Shape & S);
		%feature("compactdefaultargs") CompSolid;
		%feature("autodoc", "	:param &:
	:type &: TopoDS_Shape
	:rtype: inline TopoDS_CompSolid
") CompSolid;
		inline static TopoDS_CompSolid  CompSolid (TopoDS_Shape &);
		%feature("compactdefaultargs") Compound;
		%feature("autodoc", "	* Casts shape S to the more specialized return type, Compound. Exceptions Standard_TypeMismatch if S cannot be cast to this return type.

	:param S:
	:type S: TopoDS_Shape &
	:rtype: TopoDS_Compound
") Compound;
		static const TopoDS_Compound  Compound (const TopoDS_Shape & S);
		%feature("compactdefaultargs") Compound;
		%feature("autodoc", "	:param &:
	:type &: TopoDS_Shape
	:rtype: inline TopoDS_Compound
") Compound;
		inline static TopoDS_Compound  Compound (TopoDS_Shape &);
};


%extend TopoDS {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class TopoDS_Builder {
	public:
		%feature("compactdefaultargs") MakeWire;
		%feature("autodoc", "	* Make an empty Wire.

	:param W:
	:type W: TopoDS_Wire &
	:rtype: None
") MakeWire;
		void MakeWire (TopoDS_Wire & W);
		%feature("compactdefaultargs") MakeShell;
		%feature("autodoc", "	* Make an empty Shell.

	:param S:
	:type S: TopoDS_Shell &
	:rtype: None
") MakeShell;
		void MakeShell (TopoDS_Shell & S);
		%feature("compactdefaultargs") MakeSolid;
		%feature("autodoc", "	* Make a Solid covering the whole 3D space.

	:param S:
	:type S: TopoDS_Solid &
	:rtype: None
") MakeSolid;
		void MakeSolid (TopoDS_Solid & S);
		%feature("compactdefaultargs") MakeCompSolid;
		%feature("autodoc", "	* Make an empty Composite Solid.

	:param C:
	:type C: TopoDS_CompSolid &
	:rtype: None
") MakeCompSolid;
		void MakeCompSolid (TopoDS_CompSolid & C);
		%feature("compactdefaultargs") MakeCompound;
		%feature("autodoc", "	* Make an empty Compound.

	:param C:
	:type C: TopoDS_Compound &
	:rtype: None
") MakeCompound;
		void MakeCompound (TopoDS_Compound & C);
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* Add the Shape C in the Shape S. Exceptions - TopoDS_FrozenShape if S is not free and cannot be modified. - TopoDS__UnCompatibleShapes if S and C are not compatible.

	:param S:
	:type S: TopoDS_Shape &
	:param C:
	:type C: TopoDS_Shape &
	:rtype: None
") Add;
		void Add (TopoDS_Shape & S,const TopoDS_Shape & C);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	* Remove the Shape C from the Shape S. Exceptions TopoDS_FrozenShape if S is frozen and cannot be modified.

	:param S:
	:type S: TopoDS_Shape &
	:param C:
	:type C: TopoDS_Shape &
	:rtype: None
") Remove;
		void Remove (TopoDS_Shape & S,const TopoDS_Shape & C);
};


%extend TopoDS_Builder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopoDS_HShape;
class TopoDS_HShape : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") TopoDS_HShape;
		%feature("autodoc", "	* Constructs an empty shape object

	:rtype: None
") TopoDS_HShape;
		 TopoDS_HShape ();
		%feature("compactdefaultargs") TopoDS_HShape;
		%feature("autodoc", "	* Constructs a shape object defined by the shape aShape.

	:param aShape:
	:type aShape: TopoDS_Shape &
	:rtype: None
") TopoDS_HShape;
		 TopoDS_HShape (const TopoDS_Shape & aShape);
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "	* Loads this shape with the shape aShape

	:param aShape:
	:type aShape: TopoDS_Shape &
	:rtype: None
") Shape;
		void Shape (const TopoDS_Shape & aShape);
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "	* Returns a reference to a constant TopoDS_Shape based on this shape.

	:rtype: TopoDS_Shape
") Shape;
		const TopoDS_Shape  Shape ();
		%feature("compactdefaultargs") ChangeShape;
		%feature("autodoc", "	* Exchanges the TopoDS_Shape object defining this shape for another one referencing the same underlying shape Accesses the list of shapes within the underlying shape referenced by the TopoDS_Shape object. Returns a reference to a TopoDS_Shape based on this shape. The TopoDS_Shape can be modified.

	:rtype: TopoDS_Shape
") ChangeShape;
		TopoDS_Shape  ChangeShape ();
};


%extend TopoDS_HShape {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TopoDS_HShape(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TopoDS_HShape::Handle_TopoDS_HShape %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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
    TopoDS_HShape* _get_reference() {
    return (TopoDS_HShape*)$self->Access();
    }
};

%extend Handle_TopoDS_HShape {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TopoDS_HShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopoDS_Iterator;
class TopoDS_Iterator {
	public:
		%feature("compactdefaultargs") TopoDS_Iterator;
		%feature("autodoc", "	* Creates an empty Iterator.

	:rtype: None
") TopoDS_Iterator;
		 TopoDS_Iterator ();
		%feature("compactdefaultargs") TopoDS_Iterator;
		%feature("autodoc", "	* Creates an Iterator on <S> sub-shapes. Note: - If cumOri is true, the function composes all sub-shapes with the orientation of S. - If cumLoc is true, the function multiplies all sub-shapes by the location of S, i.e. it applies to each sub-shape the transformation that is associated with S.

	:param S:
	:type S: TopoDS_Shape &
	:param cumOri: default value is Standard_True
	:type cumOri: bool
	:param cumLoc: default value is Standard_True
	:type cumLoc: bool
	:rtype: None
") TopoDS_Iterator;
		 TopoDS_Iterator (const TopoDS_Shape & S,const Standard_Boolean cumOri = Standard_True,const Standard_Boolean cumLoc = Standard_True);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	* Initializes this iterator with shape S. Note: - If cumOri is true, the function composes all sub-shapes with the orientation of S. - If cumLoc is true, the function multiplies all sub-shapes by the location of S, i.e. it applies to each sub-shape the transformation that is associated with S.

	:param S:
	:type S: TopoDS_Shape &
	:param cumOri: default value is Standard_True
	:type cumOri: bool
	:param cumLoc: default value is Standard_True
	:type cumLoc: bool
	:rtype: None
") Initialize;
		void Initialize (const TopoDS_Shape & S,const Standard_Boolean cumOri = Standard_True,const Standard_Boolean cumLoc = Standard_True);
		%feature("compactdefaultargs") More;
		%feature("autodoc", "	* Returns true if there is another sub-shape in the shape which this iterator is scanning.

	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "	* Moves on to the next sub-shape in the shape which this iterator is scanning. Exceptions Standard_NoMoreObject if there are no more sub-shapes in the shape.

	:rtype: None
") Next;
		void Next ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Returns the current sub-shape in the shape which this iterator is scanning. Exceptions Standard_NoSuchObject if there is no current sub-shape.

	:rtype: TopoDS_Shape
") Value;
		const TopoDS_Shape  Value ();
};


%extend TopoDS_Iterator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopoDS_ListIteratorOfListOfShape;
class TopoDS_ListIteratorOfListOfShape {
	public:
		%feature("compactdefaultargs") TopoDS_ListIteratorOfListOfShape;
		%feature("autodoc", "	:rtype: None
") TopoDS_ListIteratorOfListOfShape;
		 TopoDS_ListIteratorOfListOfShape ();
		%feature("compactdefaultargs") TopoDS_ListIteratorOfListOfShape;
		%feature("autodoc", "	:param L:
	:type L: TopoDS_ListOfShape &
	:rtype: None
") TopoDS_ListIteratorOfListOfShape;
		 TopoDS_ListIteratorOfListOfShape (const TopoDS_ListOfShape & L);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param L:
	:type L: TopoDS_ListOfShape &
	:rtype: None
") Initialize;
		void Initialize (const TopoDS_ListOfShape & L);
		%feature("compactdefaultargs") More;
		%feature("autodoc", "	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "	:rtype: None
") Next;
		void Next ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Value;
		TopoDS_Shape  Value ();
};


%extend TopoDS_ListIteratorOfListOfShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopoDS_ListNodeOfListOfShape;
class TopoDS_ListNodeOfListOfShape : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") TopoDS_ListNodeOfListOfShape;
		%feature("autodoc", "	:param I:
	:type I: TopoDS_Shape &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") TopoDS_ListNodeOfListOfShape;
		 TopoDS_ListNodeOfListOfShape (const TopoDS_Shape & I,const TCollection_MapNodePtr & n);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Value;
		TopoDS_Shape  Value ();
};


%extend TopoDS_ListNodeOfListOfShape {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TopoDS_ListNodeOfListOfShape(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TopoDS_ListNodeOfListOfShape::Handle_TopoDS_ListNodeOfListOfShape %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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
    TopoDS_ListNodeOfListOfShape* _get_reference() {
    return (TopoDS_ListNodeOfListOfShape*)$self->Access();
    }
};

%extend Handle_TopoDS_ListNodeOfListOfShape {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TopoDS_ListNodeOfListOfShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopoDS_ListOfShape;
class TopoDS_ListOfShape {
	public:
		%feature("compactdefaultargs") TopoDS_ListOfShape;
		%feature("autodoc", "	:rtype: None
") TopoDS_ListOfShape;
		 TopoDS_ListOfShape ();
		%feature("compactdefaultargs") TopoDS_ListOfShape;
		%feature("autodoc", "	:param Other:
	:type Other: TopoDS_ListOfShape &
	:rtype: None
") TopoDS_ListOfShape;
		 TopoDS_ListOfShape (const TopoDS_ListOfShape & Other);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: TopoDS_ListOfShape &
	:rtype: None
") Assign;
		void Assign (const TopoDS_ListOfShape & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: TopoDS_ListOfShape &
	:rtype: None
") operator =;
		void operator = (const TopoDS_ListOfShape & Other);
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
	:type I: TopoDS_Shape &
	:rtype: None
") Prepend;
		void Prepend (const TopoDS_Shape & I);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param I:
	:type I: TopoDS_Shape &
	:param theIt:
	:type theIt: TopoDS_ListIteratorOfListOfShape &
	:rtype: None
") Prepend;
		void Prepend (const TopoDS_Shape & I,TopoDS_ListIteratorOfListOfShape & theIt);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param Other:
	:type Other: TopoDS_ListOfShape &
	:rtype: None
") Prepend;
		void Prepend (TopoDS_ListOfShape & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param I:
	:type I: TopoDS_Shape &
	:rtype: None
") Append;
		void Append (const TopoDS_Shape & I);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param I:
	:type I: TopoDS_Shape &
	:param theIt:
	:type theIt: TopoDS_ListIteratorOfListOfShape &
	:rtype: None
") Append;
		void Append (const TopoDS_Shape & I,TopoDS_ListIteratorOfListOfShape & theIt);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param Other:
	:type Other: TopoDS_ListOfShape &
	:rtype: None
") Append;
		void Append (TopoDS_ListOfShape & Other);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") First;
		TopoDS_Shape  First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Last;
		TopoDS_Shape  Last ();
		%feature("compactdefaultargs") RemoveFirst;
		%feature("autodoc", "	:rtype: None
") RemoveFirst;
		void RemoveFirst ();
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param It:
	:type It: TopoDS_ListIteratorOfListOfShape &
	:rtype: None
") Remove;
		void Remove (TopoDS_ListIteratorOfListOfShape & It);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param I:
	:type I: TopoDS_Shape &
	:param It:
	:type It: TopoDS_ListIteratorOfListOfShape &
	:rtype: None
") InsertBefore;
		void InsertBefore (const TopoDS_Shape & I,TopoDS_ListIteratorOfListOfShape & It);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Other:
	:type Other: TopoDS_ListOfShape &
	:param It:
	:type It: TopoDS_ListIteratorOfListOfShape &
	:rtype: None
") InsertBefore;
		void InsertBefore (TopoDS_ListOfShape & Other,TopoDS_ListIteratorOfListOfShape & It);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param I:
	:type I: TopoDS_Shape &
	:param It:
	:type It: TopoDS_ListIteratorOfListOfShape &
	:rtype: None
") InsertAfter;
		void InsertAfter (const TopoDS_Shape & I,TopoDS_ListIteratorOfListOfShape & It);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Other:
	:type Other: TopoDS_ListOfShape &
	:param It:
	:type It: TopoDS_ListIteratorOfListOfShape &
	:rtype: None
") InsertAfter;
		void InsertAfter (TopoDS_ListOfShape & Other,TopoDS_ListIteratorOfListOfShape & It);
};


%extend TopoDS_ListOfShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopoDS_Shape;
class TopoDS_Shape {
	public:
		%feature("autodoc", "1");
		TopoDS_Shape(const TopoDS_Shape arg0);
		%feature("compactdefaultargs") TopoDS_Shape;
		%feature("autodoc", "	* Creates a NULL Shape referring to nothing.

	:rtype: None
") TopoDS_Shape;
		 TopoDS_Shape ();
		%feature("compactdefaultargs") IsNull;
		%feature("autodoc", "	* Returns true if this shape is null. In other words, it references no underlying shape with the potential to be given a location and an orientation.

	:rtype: bool
") IsNull;
		Standard_Boolean IsNull ();
		%feature("compactdefaultargs") Nullify;
		%feature("autodoc", "	* Destroys the reference to the underlying shape stored in this shape. As a result, this shape becomes null.

	:rtype: None
") Nullify;
		void Nullify ();
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "	* Returns the shape local coordinate system.

	:rtype: TopLoc_Location
") Location;
		const TopLoc_Location & Location ();
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "	* Sets the shape local coordinate system.

	:param Loc:
	:type Loc: TopLoc_Location &
	:rtype: None
") Location;
		void Location (const TopLoc_Location & Loc);
		%feature("compactdefaultargs") Located;
		%feature("autodoc", "	* Returns a shape similar to <self> with the local coordinate system set to <Loc>.

	:param Loc:
	:type Loc: TopLoc_Location &
	:rtype: TopoDS_Shape
") Located;
		TopoDS_Shape Located (const TopLoc_Location & Loc);
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "	* Returns the shape orientation.

	:rtype: TopAbs_Orientation
") Orientation;
		TopAbs_Orientation Orientation ();
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "	* Sets the shape orientation.

	:param Orient:
	:type Orient: TopAbs_Orientation
	:rtype: None
") Orientation;
		void Orientation (const TopAbs_Orientation Orient);
		%feature("compactdefaultargs") Oriented;
		%feature("autodoc", "	* Returns a shape similar to <self> with the orientation set to <Or>.

	:param Or:
	:type Or: TopAbs_Orientation
	:rtype: TopoDS_Shape
") Oriented;
		TopoDS_Shape Oriented (const TopAbs_Orientation Or);
		%feature("compactdefaultargs") TShape;
		%feature("autodoc", "	:rtype: Handle_TopoDS_TShape
") TShape;
		const Handle_TopoDS_TShape  TShape ();
		%feature("compactdefaultargs") ShapeType;
		%feature("autodoc", "	* Returns the value of the TopAbs_ShapeEnum enumeration that corresponds to this shape, for example VERTEX, EDGE, and so on. Exceptions Standard_NullObject if this shape is null.

	:rtype: TopAbs_ShapeEnum
") ShapeType;
		TopAbs_ShapeEnum ShapeType ();
		%feature("compactdefaultargs") Free;
		%feature("autodoc", "	* Returns the free flag.

	:rtype: bool
") Free;
		Standard_Boolean Free ();
		%feature("compactdefaultargs") Free;
		%feature("autodoc", "	* Sets the free flag.

	:param F:
	:type F: bool
	:rtype: None
") Free;
		void Free (const Standard_Boolean F);
		%feature("compactdefaultargs") Locked;
		%feature("autodoc", "	* Returns the locked flag.

	:rtype: bool
") Locked;
		Standard_Boolean Locked ();
		%feature("compactdefaultargs") Locked;
		%feature("autodoc", "	* Sets the locked flag.

	:param F:
	:type F: bool
	:rtype: None
") Locked;
		void Locked (const Standard_Boolean F);
		%feature("compactdefaultargs") Modified;
		%feature("autodoc", "	* Returns the modification flag.

	:rtype: bool
") Modified;
		Standard_Boolean Modified ();
		%feature("compactdefaultargs") Modified;
		%feature("autodoc", "	* Sets the modification flag.

	:param M:
	:type M: bool
	:rtype: None
") Modified;
		void Modified (const Standard_Boolean M);
		%feature("compactdefaultargs") Checked;
		%feature("autodoc", "	* Returns the checked flag.

	:rtype: bool
") Checked;
		Standard_Boolean Checked ();
		%feature("compactdefaultargs") Checked;
		%feature("autodoc", "	* Sets the checked flag.

	:param C:
	:type C: bool
	:rtype: None
") Checked;
		void Checked (const Standard_Boolean C);
		%feature("compactdefaultargs") Orientable;
		%feature("autodoc", "	* Returns the orientability flag.

	:rtype: bool
") Orientable;
		Standard_Boolean Orientable ();
		%feature("compactdefaultargs") Orientable;
		%feature("autodoc", "	* Sets the orientability flag.

	:param C:
	:type C: bool
	:rtype: None
") Orientable;
		void Orientable (const Standard_Boolean C);
		%feature("compactdefaultargs") Closed;
		%feature("autodoc", "	* Returns the closedness flag.

	:rtype: bool
") Closed;
		Standard_Boolean Closed ();
		%feature("compactdefaultargs") Closed;
		%feature("autodoc", "	* Sets the closedness flag.

	:param C:
	:type C: bool
	:rtype: None
") Closed;
		void Closed (const Standard_Boolean C);
		%feature("compactdefaultargs") Infinite;
		%feature("autodoc", "	* Returns the infinity flag.

	:rtype: bool
") Infinite;
		Standard_Boolean Infinite ();
		%feature("compactdefaultargs") Infinite;
		%feature("autodoc", "	* Sets the infinity flag.

	:param C:
	:type C: bool
	:rtype: None
") Infinite;
		void Infinite (const Standard_Boolean C);
		%feature("compactdefaultargs") Convex;
		%feature("autodoc", "	* Returns the convexness flag.

	:rtype: bool
") Convex;
		Standard_Boolean Convex ();
		%feature("compactdefaultargs") Convex;
		%feature("autodoc", "	* Sets the convexness flag.

	:param C:
	:type C: bool
	:rtype: None
") Convex;
		void Convex (const Standard_Boolean C);
		%feature("compactdefaultargs") Move;
		%feature("autodoc", "	* Multiplies the Shape location by <position>.

	:param position:
	:type position: TopLoc_Location &
	:rtype: None
") Move;
		void Move (const TopLoc_Location & position);
		%feature("compactdefaultargs") Moved;
		%feature("autodoc", "	* Returns a shape similar to <self> with a location multiplied by <position>.

	:param position:
	:type position: TopLoc_Location &
	:rtype: TopoDS_Shape
") Moved;
		TopoDS_Shape Moved (const TopLoc_Location & position);
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "	* Reverses the orientation, using the Reverse method from the TopAbs package.

	:rtype: None
") Reverse;
		void Reverse ();
		%feature("compactdefaultargs") Reversed;
		%feature("autodoc", "	* Returns a shape similar to <self> with the orientation reversed, using the Reverse method from the TopAbs package.

	:rtype: TopoDS_Shape
") Reversed;
		TopoDS_Shape Reversed ();
		%feature("compactdefaultargs") Complement;
		%feature("autodoc", "	* Complements the orientation, using the Complement method from the TopAbs package.

	:rtype: None
") Complement;
		void Complement ();
		%feature("compactdefaultargs") Complemented;
		%feature("autodoc", "	* Returns a shape similar to <self> with the orientation complemented, using the Complement method from the TopAbs package.

	:rtype: TopoDS_Shape
") Complemented;
		TopoDS_Shape Complemented ();
		%feature("compactdefaultargs") Compose;
		%feature("autodoc", "	* Updates the Shape Orientation by composition with <Orient>, using the Compose method from the TopAbs package.

	:param Orient:
	:type Orient: TopAbs_Orientation
	:rtype: None
") Compose;
		void Compose (const TopAbs_Orientation Orient);
		%feature("compactdefaultargs") Composed;
		%feature("autodoc", "	* Returns a shape similar to <self> with the orientation composed with <Orient>, using the Compose method from the TopAbs package.

	:param Orient:
	:type Orient: TopAbs_Orientation
	:rtype: TopoDS_Shape
") Composed;
		TopoDS_Shape Composed (const TopAbs_Orientation Orient);
		%feature("compactdefaultargs") IsPartner;
		%feature("autodoc", "	* Returns True if two shapes are partners, i.e. if they share the same TShape. Locations and Orientations may differ.

	:param other:
	:type other: TopoDS_Shape &
	:rtype: bool
") IsPartner;
		Standard_Boolean IsPartner (const TopoDS_Shape & other);
		%feature("compactdefaultargs") IsSame;
		%feature("autodoc", "	* Returns True if two shapes are same, i.e. if they share the same TShape with the same Locations. Orientations may differ.

	:param other:
	:type other: TopoDS_Shape &
	:rtype: bool
") IsSame;
		Standard_Boolean IsSame (const TopoDS_Shape & other);
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "	* Returns True if two shapes are equal, i.e. if they share the same TShape with the same Locations and Orientations.

	:param other:
	:type other: TopoDS_Shape &
	:rtype: bool
") IsEqual;
		Standard_Boolean IsEqual (const TopoDS_Shape & other);

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
        		%feature("compactdefaultargs") IsNotEqual;
		%feature("autodoc", "	* Negation of the IsEqual method.

	:param other:
	:type other: TopoDS_Shape &
	:rtype: bool
") IsNotEqual;
		Standard_Boolean IsNotEqual (const TopoDS_Shape & other);

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
        		%feature("compactdefaultargs") HashCode;
		%feature("autodoc", "	* Returns a hashed value denoting <self>. This value is in the range 1..<Upper>. It is computed from the TShape and the Location. The Orientation is not used.

	:param Upper:
	:type Upper: int
	:rtype: int
") HashCode;
		Standard_Integer HashCode (const Standard_Integer Upper);

        %extend {
            Standard_Integer __hash__() {
            return $self->HashCode(2147483647);
            }
        };
        		%feature("compactdefaultargs") EmptyCopy;
		%feature("autodoc", "	* Replace <self> by a new Shape with the same Orientation and Location and a new TShape with the same geometry and no sub-shapes.

	:rtype: None
") EmptyCopy;
		void EmptyCopy ();
		%feature("compactdefaultargs") EmptyCopied;
		%feature("autodoc", "	* Returns a new Shape with the same Orientation and Location and a new TShape with the same geometry and no sub-shapes.

	:rtype: TopoDS_Shape
") EmptyCopied;
		TopoDS_Shape EmptyCopied ();
		%feature("compactdefaultargs") TShape;
		%feature("autodoc", "	:param T:
	:type T: Handle_TopoDS_TShape &
	:rtype: None
") TShape;
		void TShape (const Handle_TopoDS_TShape & T);
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
%extend TopoDS_Shape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopoDS_TShape;
class TopoDS_TShape : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") Free;
		%feature("autodoc", "	* Returns the free flag.

	:rtype: bool
") Free;
		Standard_Boolean Free ();
		%feature("compactdefaultargs") Free;
		%feature("autodoc", "	* Sets the free flag.

	:param F:
	:type F: bool
	:rtype: None
") Free;
		void Free (const Standard_Boolean F);
		%feature("compactdefaultargs") Locked;
		%feature("autodoc", "	* Returns the locked flag.

	:rtype: bool
") Locked;
		Standard_Boolean Locked ();
		%feature("compactdefaultargs") Locked;
		%feature("autodoc", "	* Sets the locked flag.

	:param F:
	:type F: bool
	:rtype: None
") Locked;
		void Locked (const Standard_Boolean F);
		%feature("compactdefaultargs") Modified;
		%feature("autodoc", "	* Returns the modification flag.

	:rtype: bool
") Modified;
		Standard_Boolean Modified ();
		%feature("compactdefaultargs") Modified;
		%feature("autodoc", "	* Sets the modification flag.

	:param M:
	:type M: bool
	:rtype: None
") Modified;
		void Modified (const Standard_Boolean M);
		%feature("compactdefaultargs") Checked;
		%feature("autodoc", "	* Returns the checked flag.

	:rtype: bool
") Checked;
		Standard_Boolean Checked ();
		%feature("compactdefaultargs") Checked;
		%feature("autodoc", "	* Sets the checked flag.

	:param C:
	:type C: bool
	:rtype: None
") Checked;
		void Checked (const Standard_Boolean C);
		%feature("compactdefaultargs") Orientable;
		%feature("autodoc", "	* Returns the orientability flag.

	:rtype: bool
") Orientable;
		Standard_Boolean Orientable ();
		%feature("compactdefaultargs") Orientable;
		%feature("autodoc", "	* Sets the orientability flag.

	:param C:
	:type C: bool
	:rtype: None
") Orientable;
		void Orientable (const Standard_Boolean C);
		%feature("compactdefaultargs") Closed;
		%feature("autodoc", "	* Returns the closedness flag.

	:rtype: bool
") Closed;
		Standard_Boolean Closed ();
		%feature("compactdefaultargs") Closed;
		%feature("autodoc", "	* Sets the closedness flag.

	:param C:
	:type C: bool
	:rtype: None
") Closed;
		void Closed (const Standard_Boolean C);
		%feature("compactdefaultargs") Infinite;
		%feature("autodoc", "	* Returns the infinity flag.

	:rtype: bool
") Infinite;
		Standard_Boolean Infinite ();
		%feature("compactdefaultargs") Infinite;
		%feature("autodoc", "	* Sets the infinity flag.

	:param C:
	:type C: bool
	:rtype: None
") Infinite;
		void Infinite (const Standard_Boolean C);
		%feature("compactdefaultargs") Convex;
		%feature("autodoc", "	* Returns the convexness flag.

	:rtype: bool
") Convex;
		Standard_Boolean Convex ();
		%feature("compactdefaultargs") Convex;
		%feature("autodoc", "	* Sets the convexness flag.

	:param C:
	:type C: bool
	:rtype: None
") Convex;
		void Convex (const Standard_Boolean C);
		%feature("compactdefaultargs") ShapeType;
		%feature("autodoc", "	* Returns the type as a term of the ShapeEnum enum : VERTEX, EDGE, WIRE, FACE, ....

	:rtype: TopAbs_ShapeEnum
") ShapeType;
		virtual TopAbs_ShapeEnum ShapeType ();
		%feature("compactdefaultargs") EmptyCopy;
		%feature("autodoc", "	* Returns a copy of the TShape with no sub-shapes.

	:rtype: Handle_TopoDS_TShape
") EmptyCopy;
		virtual Handle_TopoDS_TShape EmptyCopy ();
};


%extend TopoDS_TShape {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TopoDS_TShape(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TopoDS_TShape::Handle_TopoDS_TShape %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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
    TopoDS_TShape* _get_reference() {
    return (TopoDS_TShape*)$self->Access();
    }
};

%extend Handle_TopoDS_TShape {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TopoDS_TShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopoDS_CompSolid;
class TopoDS_CompSolid : public TopoDS_Shape {
	public:
		%feature("compactdefaultargs") TopoDS_CompSolid;
		%feature("autodoc", "	* Constructs an Undefined CompSolid.

	:rtype: None
") TopoDS_CompSolid;
		 TopoDS_CompSolid ();
};


%extend TopoDS_CompSolid {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopoDS_Compound;
class TopoDS_Compound : public TopoDS_Shape {
	public:
		%feature("compactdefaultargs") TopoDS_Compound;
		%feature("autodoc", "	* Constructs an Undefined Compound.

	:rtype: None
") TopoDS_Compound;
		 TopoDS_Compound ();
};


%extend TopoDS_Compound {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopoDS_Edge;
class TopoDS_Edge : public TopoDS_Shape {
	public:
		%feature("compactdefaultargs") TopoDS_Edge;
		%feature("autodoc", "	* Undefined Edge.

	:rtype: None
") TopoDS_Edge;
		 TopoDS_Edge ();
};


%extend TopoDS_Edge {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopoDS_Face;
class TopoDS_Face : public TopoDS_Shape {
	public:
		%feature("compactdefaultargs") TopoDS_Face;
		%feature("autodoc", "	* Undefined Face.

	:rtype: None
") TopoDS_Face;
		 TopoDS_Face ();
};


%extend TopoDS_Face {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopoDS_Shell;
class TopoDS_Shell : public TopoDS_Shape {
	public:
		%feature("compactdefaultargs") TopoDS_Shell;
		%feature("autodoc", "	* Constructs an Undefined Shell.

	:rtype: None
") TopoDS_Shell;
		 TopoDS_Shell ();
};


%extend TopoDS_Shell {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopoDS_Solid;
class TopoDS_Solid : public TopoDS_Shape {
	public:
		%feature("compactdefaultargs") TopoDS_Solid;
		%feature("autodoc", "	* Constructs an Undefined Solid.

	:rtype: None
") TopoDS_Solid;
		 TopoDS_Solid ();
};


%extend TopoDS_Solid {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopoDS_TCompSolid;
class TopoDS_TCompSolid : public TopoDS_TShape {
	public:
		%feature("compactdefaultargs") TopoDS_TCompSolid;
		%feature("autodoc", "	* Creates an empty TCompSolid.

	:rtype: None
") TopoDS_TCompSolid;
		 TopoDS_TCompSolid ();
		%feature("compactdefaultargs") ShapeType;
		%feature("autodoc", "	* returns COMPSOLID

	:rtype: TopAbs_ShapeEnum
") ShapeType;
		TopAbs_ShapeEnum ShapeType ();
		%feature("compactdefaultargs") EmptyCopy;
		%feature("autodoc", "	* Returns an empty TCompSolid.

	:rtype: Handle_TopoDS_TShape
") EmptyCopy;
		Handle_TopoDS_TShape EmptyCopy ();
};


%extend TopoDS_TCompSolid {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TopoDS_TCompSolid(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TopoDS_TCompSolid::Handle_TopoDS_TCompSolid %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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
    TopoDS_TCompSolid* _get_reference() {
    return (TopoDS_TCompSolid*)$self->Access();
    }
};

%extend Handle_TopoDS_TCompSolid {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TopoDS_TCompSolid {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopoDS_TCompound;
class TopoDS_TCompound : public TopoDS_TShape {
	public:
		%feature("compactdefaultargs") TopoDS_TCompound;
		%feature("autodoc", "	* Creates an empty TCompound.

	:rtype: None
") TopoDS_TCompound;
		 TopoDS_TCompound ();
		%feature("compactdefaultargs") ShapeType;
		%feature("autodoc", "	* Returns COMPOUND.

	:rtype: TopAbs_ShapeEnum
") ShapeType;
		TopAbs_ShapeEnum ShapeType ();
		%feature("compactdefaultargs") EmptyCopy;
		%feature("autodoc", "	* Returns an empty TCompound.

	:rtype: Handle_TopoDS_TShape
") EmptyCopy;
		Handle_TopoDS_TShape EmptyCopy ();
};


%extend TopoDS_TCompound {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TopoDS_TCompound(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TopoDS_TCompound::Handle_TopoDS_TCompound %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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
    TopoDS_TCompound* _get_reference() {
    return (TopoDS_TCompound*)$self->Access();
    }
};

%extend Handle_TopoDS_TCompound {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TopoDS_TCompound {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopoDS_TEdge;
class TopoDS_TEdge : public TopoDS_TShape {
	public:
		%feature("compactdefaultargs") ShapeType;
		%feature("autodoc", "	* Returns EDGE.

	:rtype: TopAbs_ShapeEnum
") ShapeType;
		TopAbs_ShapeEnum ShapeType ();
};


%extend TopoDS_TEdge {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TopoDS_TEdge(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TopoDS_TEdge::Handle_TopoDS_TEdge %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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
    TopoDS_TEdge* _get_reference() {
    return (TopoDS_TEdge*)$self->Access();
    }
};

%extend Handle_TopoDS_TEdge {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TopoDS_TEdge {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopoDS_TFace;
class TopoDS_TFace : public TopoDS_TShape {
	public:
		%feature("compactdefaultargs") TopoDS_TFace;
		%feature("autodoc", "	* Creates an empty TFace.

	:rtype: None
") TopoDS_TFace;
		 TopoDS_TFace ();
		%feature("compactdefaultargs") ShapeType;
		%feature("autodoc", "	* returns FACE.

	:rtype: TopAbs_ShapeEnum
") ShapeType;
		TopAbs_ShapeEnum ShapeType ();
		%feature("compactdefaultargs") EmptyCopy;
		%feature("autodoc", "	* Returns an empty TFace.

	:rtype: Handle_TopoDS_TShape
") EmptyCopy;
		virtual Handle_TopoDS_TShape EmptyCopy ();
};


%extend TopoDS_TFace {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TopoDS_TFace(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TopoDS_TFace::Handle_TopoDS_TFace %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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
    TopoDS_TFace* _get_reference() {
    return (TopoDS_TFace*)$self->Access();
    }
};

%extend Handle_TopoDS_TFace {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TopoDS_TFace {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopoDS_TShell;
class TopoDS_TShell : public TopoDS_TShape {
	public:
		%feature("compactdefaultargs") TopoDS_TShell;
		%feature("autodoc", "	* Creates an empty TShell.

	:rtype: None
") TopoDS_TShell;
		 TopoDS_TShell ();
		%feature("compactdefaultargs") ShapeType;
		%feature("autodoc", "	* Returns SHELL.

	:rtype: TopAbs_ShapeEnum
") ShapeType;
		TopAbs_ShapeEnum ShapeType ();
		%feature("compactdefaultargs") EmptyCopy;
		%feature("autodoc", "	* Returns an empty TShell.

	:rtype: Handle_TopoDS_TShape
") EmptyCopy;
		Handle_TopoDS_TShape EmptyCopy ();
};


%extend TopoDS_TShell {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TopoDS_TShell(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TopoDS_TShell::Handle_TopoDS_TShell %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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
    TopoDS_TShell* _get_reference() {
    return (TopoDS_TShell*)$self->Access();
    }
};

%extend Handle_TopoDS_TShell {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TopoDS_TShell {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopoDS_TSolid;
class TopoDS_TSolid : public TopoDS_TShape {
	public:
		%feature("compactdefaultargs") TopoDS_TSolid;
		%feature("autodoc", "	* Creates an empty TSolid.

	:rtype: None
") TopoDS_TSolid;
		 TopoDS_TSolid ();
		%feature("compactdefaultargs") ShapeType;
		%feature("autodoc", "	* returns SOLID.

	:rtype: TopAbs_ShapeEnum
") ShapeType;
		TopAbs_ShapeEnum ShapeType ();
		%feature("compactdefaultargs") EmptyCopy;
		%feature("autodoc", "	* Returns an empty TSolid.

	:rtype: Handle_TopoDS_TShape
") EmptyCopy;
		Handle_TopoDS_TShape EmptyCopy ();
};


%extend TopoDS_TSolid {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TopoDS_TSolid(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TopoDS_TSolid::Handle_TopoDS_TSolid %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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
    TopoDS_TSolid* _get_reference() {
    return (TopoDS_TSolid*)$self->Access();
    }
};

%extend Handle_TopoDS_TSolid {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TopoDS_TSolid {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopoDS_TVertex;
class TopoDS_TVertex : public TopoDS_TShape {
	public:
		%feature("compactdefaultargs") ShapeType;
		%feature("autodoc", "	* Returns VERTEX.

	:rtype: TopAbs_ShapeEnum
") ShapeType;
		TopAbs_ShapeEnum ShapeType ();
};


%extend TopoDS_TVertex {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TopoDS_TVertex(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TopoDS_TVertex::Handle_TopoDS_TVertex %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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
    TopoDS_TVertex* _get_reference() {
    return (TopoDS_TVertex*)$self->Access();
    }
};

%extend Handle_TopoDS_TVertex {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TopoDS_TVertex {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopoDS_TWire;
class TopoDS_TWire : public TopoDS_TShape {
	public:
		%feature("compactdefaultargs") TopoDS_TWire;
		%feature("autodoc", "	* Creates an empty TWire.

	:rtype: None
") TopoDS_TWire;
		 TopoDS_TWire ();
		%feature("compactdefaultargs") ShapeType;
		%feature("autodoc", "	* Returns WIRE.

	:rtype: TopAbs_ShapeEnum
") ShapeType;
		TopAbs_ShapeEnum ShapeType ();
		%feature("compactdefaultargs") EmptyCopy;
		%feature("autodoc", "	* Returns an empty TWire.

	:rtype: Handle_TopoDS_TShape
") EmptyCopy;
		Handle_TopoDS_TShape EmptyCopy ();
};


%extend TopoDS_TWire {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_TopoDS_TWire(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_TopoDS_TWire::Handle_TopoDS_TWire %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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
    TopoDS_TWire* _get_reference() {
    return (TopoDS_TWire*)$self->Access();
    }
};

%extend Handle_TopoDS_TWire {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend TopoDS_TWire {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopoDS_Vertex;
class TopoDS_Vertex : public TopoDS_Shape {
	public:
		%feature("autodoc", "1");
		TopoDS_Vertex(const TopoDS_Vertex arg0);
		%feature("compactdefaultargs") TopoDS_Vertex;
		%feature("autodoc", "	* Undefined Vertex.

	:rtype: None
") TopoDS_Vertex;
		 TopoDS_Vertex ();
};


%extend TopoDS_Vertex {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor TopoDS_Wire;
class TopoDS_Wire : public TopoDS_Shape {
	public:
		%feature("compactdefaultargs") TopoDS_Wire;
		%feature("autodoc", "	* Undefined Wire.

	:rtype: None
") TopoDS_Wire;
		 TopoDS_Wire ();
};


%extend TopoDS_Wire {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
