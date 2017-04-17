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
%module (package="OCC") BRepOffset

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


%include BRepOffset_headers.i


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
enum BRepOffset_Error {
	BRepOffset_NoError = 0,
	BRepOffset_OffsetSurfaceFailed = 1,
	BRepOffset_UnCorrectClosingFace = 2,
	BRepOffset_ExtentFaceFailed = 3,
	BRepOffset_RadiusEqualOffset = 4,
	BRepOffset_UnknownError = 5,
	BRepOffset_BadNormalsOnGeometry = 6,
	BRepOffset_C0Geometry = 7,
	BRepOffset_NullOffset = 8,
	BRepOffset_NotConnectedShell = 9,
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
class BRepOffset {
	public:
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "	* returns the Offset surface computed from the surface <Surface> at an OffsetDistance <Offset>. //! If possible, this method returns the real type of the surface ( e.g. An Offset of a plane is a plane). //! If no particular case is detected, the returned surface will have the Type Geom_OffsetSurface.

	:param Surface:
	:type Surface: Handle_Geom_Surface &
	:param Offset:
	:type Offset: float
	:param Status:
	:type Status: BRepOffset_Status &
	:rtype: Handle_Geom_Surface
") Surface;
		static Handle_Geom_Surface Surface (const Handle_Geom_Surface & Surface,const Standard_Real Offset,BRepOffset_Status & Status);
};


%extend BRepOffset {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepOffset_Analyse;
class BRepOffset_Analyse {
	public:
		%feature("compactdefaultargs") BRepOffset_Analyse;
		%feature("autodoc", "	:rtype: None
") BRepOffset_Analyse;
		 BRepOffset_Analyse ();
		%feature("compactdefaultargs") BRepOffset_Analyse;
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:param Angle:
	:type Angle: float
	:rtype: None
") BRepOffset_Analyse;
		 BRepOffset_Analyse (const TopoDS_Shape & S,const Standard_Real Angle);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:param Angle:
	:type Angle: float
	:rtype: None
") Perform;
		void Perform (const TopoDS_Shape & S,const Standard_Real Angle);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "	:param E:
	:type E: TopoDS_Edge &
	:rtype: BRepOffset_ListOfInterval
") Type;
		const BRepOffset_ListOfInterval & Type (const TopoDS_Edge & E);
		%feature("compactdefaultargs") Edges;
		%feature("autodoc", "	* Stores in <L> all the edges of Type <T> on the vertex <V>.

	:param V:
	:type V: TopoDS_Vertex &
	:param T:
	:type T: BRepOffset_Type
	:param L:
	:type L: TopTools_ListOfShape &
	:rtype: None
") Edges;
		void Edges (const TopoDS_Vertex & V,const BRepOffset_Type T,TopTools_ListOfShape & L);
		%feature("compactdefaultargs") Edges;
		%feature("autodoc", "	* Stores in <L> all the edges of Type <T> on the face <F>.

	:param F:
	:type F: TopoDS_Face &
	:param T:
	:type T: BRepOffset_Type
	:param L:
	:type L: TopTools_ListOfShape &
	:rtype: None
") Edges;
		void Edges (const TopoDS_Face & F,const BRepOffset_Type T,TopTools_ListOfShape & L);
		%feature("compactdefaultargs") TangentEdges;
		%feature("autodoc", "	* set in <Edges> all the Edges of <Shape> which are tangent to <Edge> at the vertex <Vertex>.

	:param Edge:
	:type Edge: TopoDS_Edge &
	:param Vertex:
	:type Vertex: TopoDS_Vertex &
	:param Edges:
	:type Edges: TopTools_ListOfShape &
	:rtype: None
") TangentEdges;
		void TangentEdges (const TopoDS_Edge & Edge,const TopoDS_Vertex & Vertex,TopTools_ListOfShape & Edges);
		%feature("compactdefaultargs") HasAncestor;
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:rtype: bool
") HasAncestor;
		Standard_Boolean HasAncestor (const TopoDS_Shape & S);
		%feature("compactdefaultargs") Ancestors;
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:rtype: TopTools_ListOfShape
") Ancestors;
		const TopTools_ListOfShape & Ancestors (const TopoDS_Shape & S);
		%feature("compactdefaultargs") Explode;
		%feature("autodoc", "	* Explode in compounds of faces where all the connex edges are of type <Side>

	:param L:
	:type L: TopTools_ListOfShape &
	:param Type:
	:type Type: BRepOffset_Type
	:rtype: None
") Explode;
		void Explode (TopTools_ListOfShape & L,const BRepOffset_Type Type);
		%feature("compactdefaultargs") Explode;
		%feature("autodoc", "	* Explode in compounds of faces where all the connex edges are of type <Side1> or <Side2>

	:param L:
	:type L: TopTools_ListOfShape &
	:param Type1:
	:type Type1: BRepOffset_Type
	:param Type2:
	:type Type2: BRepOffset_Type
	:rtype: None
") Explode;
		void Explode (TopTools_ListOfShape & L,const BRepOffset_Type Type1,const BRepOffset_Type Type2);
		%feature("compactdefaultargs") AddFaces;
		%feature("autodoc", "	* Add in <CO> the faces of the shell containing <Face> where all the connex edges are of type <Side>.

	:param Face:
	:type Face: TopoDS_Face &
	:param Co:
	:type Co: TopoDS_Compound &
	:param Map:
	:type Map: TopTools_MapOfShape &
	:param Type:
	:type Type: BRepOffset_Type
	:rtype: None
") AddFaces;
		void AddFaces (const TopoDS_Face & Face,TopoDS_Compound & Co,TopTools_MapOfShape & Map,const BRepOffset_Type Type);
		%feature("compactdefaultargs") AddFaces;
		%feature("autodoc", "	* Add in <CO> the faces of the shell containing <Face> where all the connex edges are of type <Side1> or <Side2>.

	:param Face:
	:type Face: TopoDS_Face &
	:param Co:
	:type Co: TopoDS_Compound &
	:param Map:
	:type Map: TopTools_MapOfShape &
	:param Type1:
	:type Type1: BRepOffset_Type
	:param Type2:
	:type Type2: BRepOffset_Type
	:rtype: None
") AddFaces;
		void AddFaces (const TopoDS_Face & Face,TopoDS_Compound & Co,TopTools_MapOfShape & Map,const BRepOffset_Type Type1,const BRepOffset_Type Type2);
};


%extend BRepOffset_Analyse {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepOffset_DataMapIteratorOfDataMapOfShapeListOfInterval;
class BRepOffset_DataMapIteratorOfDataMapOfShapeListOfInterval : public TCollection_BasicMapIterator {
	public:
		%feature("compactdefaultargs") BRepOffset_DataMapIteratorOfDataMapOfShapeListOfInterval;
		%feature("autodoc", "	:rtype: None
") BRepOffset_DataMapIteratorOfDataMapOfShapeListOfInterval;
		 BRepOffset_DataMapIteratorOfDataMapOfShapeListOfInterval ();
		%feature("compactdefaultargs") BRepOffset_DataMapIteratorOfDataMapOfShapeListOfInterval;
		%feature("autodoc", "	:param aMap:
	:type aMap: BRepOffset_DataMapOfShapeListOfInterval &
	:rtype: None
") BRepOffset_DataMapIteratorOfDataMapOfShapeListOfInterval;
		 BRepOffset_DataMapIteratorOfDataMapOfShapeListOfInterval (const BRepOffset_DataMapOfShapeListOfInterval & aMap);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param aMap:
	:type aMap: BRepOffset_DataMapOfShapeListOfInterval &
	:rtype: None
") Initialize;
		void Initialize (const BRepOffset_DataMapOfShapeListOfInterval & aMap);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Key;
		const TopoDS_Shape  Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: BRepOffset_ListOfInterval
") Value;
		const BRepOffset_ListOfInterval & Value ();
};


%extend BRepOffset_DataMapIteratorOfDataMapOfShapeListOfInterval {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepOffset_DataMapIteratorOfDataMapOfShapeMapOfShape;
class BRepOffset_DataMapIteratorOfDataMapOfShapeMapOfShape : public TCollection_BasicMapIterator {
	public:
		%feature("compactdefaultargs") BRepOffset_DataMapIteratorOfDataMapOfShapeMapOfShape;
		%feature("autodoc", "	:rtype: None
") BRepOffset_DataMapIteratorOfDataMapOfShapeMapOfShape;
		 BRepOffset_DataMapIteratorOfDataMapOfShapeMapOfShape ();
		%feature("compactdefaultargs") BRepOffset_DataMapIteratorOfDataMapOfShapeMapOfShape;
		%feature("autodoc", "	:param aMap:
	:type aMap: BRepOffset_DataMapOfShapeMapOfShape &
	:rtype: None
") BRepOffset_DataMapIteratorOfDataMapOfShapeMapOfShape;
		 BRepOffset_DataMapIteratorOfDataMapOfShapeMapOfShape (const BRepOffset_DataMapOfShapeMapOfShape & aMap);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param aMap:
	:type aMap: BRepOffset_DataMapOfShapeMapOfShape &
	:rtype: None
") Initialize;
		void Initialize (const BRepOffset_DataMapOfShapeMapOfShape & aMap);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Key;
		const TopoDS_Shape  Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: TopTools_MapOfShape
") Value;
		const TopTools_MapOfShape & Value ();
};


%extend BRepOffset_DataMapIteratorOfDataMapOfShapeMapOfShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepOffset_DataMapIteratorOfDataMapOfShapeOffset;
class BRepOffset_DataMapIteratorOfDataMapOfShapeOffset : public TCollection_BasicMapIterator {
	public:
		%feature("compactdefaultargs") BRepOffset_DataMapIteratorOfDataMapOfShapeOffset;
		%feature("autodoc", "	:rtype: None
") BRepOffset_DataMapIteratorOfDataMapOfShapeOffset;
		 BRepOffset_DataMapIteratorOfDataMapOfShapeOffset ();
		%feature("compactdefaultargs") BRepOffset_DataMapIteratorOfDataMapOfShapeOffset;
		%feature("autodoc", "	:param aMap:
	:type aMap: BRepOffset_DataMapOfShapeOffset &
	:rtype: None
") BRepOffset_DataMapIteratorOfDataMapOfShapeOffset;
		 BRepOffset_DataMapIteratorOfDataMapOfShapeOffset (const BRepOffset_DataMapOfShapeOffset & aMap);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param aMap:
	:type aMap: BRepOffset_DataMapOfShapeOffset &
	:rtype: None
") Initialize;
		void Initialize (const BRepOffset_DataMapOfShapeOffset & aMap);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Key;
		const TopoDS_Shape  Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: BRepOffset_Offset
") Value;
		const BRepOffset_Offset & Value ();
};


%extend BRepOffset_DataMapIteratorOfDataMapOfShapeOffset {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepOffset_DataMapNodeOfDataMapOfShapeListOfInterval;
class BRepOffset_DataMapNodeOfDataMapOfShapeListOfInterval : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") BRepOffset_DataMapNodeOfDataMapOfShapeListOfInterval;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:param I:
	:type I: BRepOffset_ListOfInterval &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") BRepOffset_DataMapNodeOfDataMapOfShapeListOfInterval;
		 BRepOffset_DataMapNodeOfDataMapOfShapeListOfInterval (const TopoDS_Shape & K,const BRepOffset_ListOfInterval & I,const TCollection_MapNodePtr & n);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Key;
		TopoDS_Shape  Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: BRepOffset_ListOfInterval
") Value;
		BRepOffset_ListOfInterval & Value ();
};


%extend BRepOffset_DataMapNodeOfDataMapOfShapeListOfInterval {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_BRepOffset_DataMapNodeOfDataMapOfShapeListOfInterval(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_BRepOffset_DataMapNodeOfDataMapOfShapeListOfInterval::Handle_BRepOffset_DataMapNodeOfDataMapOfShapeListOfInterval %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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
    BRepOffset_DataMapNodeOfDataMapOfShapeListOfInterval* _get_reference() {
    return (BRepOffset_DataMapNodeOfDataMapOfShapeListOfInterval*)$self->Access();
    }
};

%extend Handle_BRepOffset_DataMapNodeOfDataMapOfShapeListOfInterval {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend BRepOffset_DataMapNodeOfDataMapOfShapeListOfInterval {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepOffset_DataMapNodeOfDataMapOfShapeMapOfShape;
class BRepOffset_DataMapNodeOfDataMapOfShapeMapOfShape : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") BRepOffset_DataMapNodeOfDataMapOfShapeMapOfShape;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:param I:
	:type I: TopTools_MapOfShape &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") BRepOffset_DataMapNodeOfDataMapOfShapeMapOfShape;
		 BRepOffset_DataMapNodeOfDataMapOfShapeMapOfShape (const TopoDS_Shape & K,const TopTools_MapOfShape & I,const TCollection_MapNodePtr & n);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Key;
		TopoDS_Shape  Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: TopTools_MapOfShape
") Value;
		TopTools_MapOfShape & Value ();
};


%extend BRepOffset_DataMapNodeOfDataMapOfShapeMapOfShape {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_BRepOffset_DataMapNodeOfDataMapOfShapeMapOfShape(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_BRepOffset_DataMapNodeOfDataMapOfShapeMapOfShape::Handle_BRepOffset_DataMapNodeOfDataMapOfShapeMapOfShape %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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
    BRepOffset_DataMapNodeOfDataMapOfShapeMapOfShape* _get_reference() {
    return (BRepOffset_DataMapNodeOfDataMapOfShapeMapOfShape*)$self->Access();
    }
};

%extend Handle_BRepOffset_DataMapNodeOfDataMapOfShapeMapOfShape {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend BRepOffset_DataMapNodeOfDataMapOfShapeMapOfShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepOffset_DataMapNodeOfDataMapOfShapeOffset;
class BRepOffset_DataMapNodeOfDataMapOfShapeOffset : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") BRepOffset_DataMapNodeOfDataMapOfShapeOffset;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:param I:
	:type I: BRepOffset_Offset &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") BRepOffset_DataMapNodeOfDataMapOfShapeOffset;
		 BRepOffset_DataMapNodeOfDataMapOfShapeOffset (const TopoDS_Shape & K,const BRepOffset_Offset & I,const TCollection_MapNodePtr & n);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Key;
		TopoDS_Shape  Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: BRepOffset_Offset
") Value;
		BRepOffset_Offset & Value ();
};


%extend BRepOffset_DataMapNodeOfDataMapOfShapeOffset {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_BRepOffset_DataMapNodeOfDataMapOfShapeOffset(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_BRepOffset_DataMapNodeOfDataMapOfShapeOffset::Handle_BRepOffset_DataMapNodeOfDataMapOfShapeOffset %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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
    BRepOffset_DataMapNodeOfDataMapOfShapeOffset* _get_reference() {
    return (BRepOffset_DataMapNodeOfDataMapOfShapeOffset*)$self->Access();
    }
};

%extend Handle_BRepOffset_DataMapNodeOfDataMapOfShapeOffset {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend BRepOffset_DataMapNodeOfDataMapOfShapeOffset {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepOffset_DataMapOfShapeListOfInterval;
class BRepOffset_DataMapOfShapeListOfInterval : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") BRepOffset_DataMapOfShapeListOfInterval;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") BRepOffset_DataMapOfShapeListOfInterval;
		 BRepOffset_DataMapOfShapeListOfInterval (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: BRepOffset_DataMapOfShapeListOfInterval &
	:rtype: BRepOffset_DataMapOfShapeListOfInterval
") Assign;
		BRepOffset_DataMapOfShapeListOfInterval & Assign (const BRepOffset_DataMapOfShapeListOfInterval & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: BRepOffset_DataMapOfShapeListOfInterval &
	:rtype: BRepOffset_DataMapOfShapeListOfInterval
") operator =;
		BRepOffset_DataMapOfShapeListOfInterval & operator = (const BRepOffset_DataMapOfShapeListOfInterval & Other);
		%feature("compactdefaultargs") ReSize;
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: int
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:param I:
	:type I: BRepOffset_ListOfInterval &
	:rtype: bool
") Bind;
		Standard_Boolean Bind (const TopoDS_Shape & K,const BRepOffset_ListOfInterval & I);
		%feature("compactdefaultargs") IsBound;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: bool
") IsBound;
		Standard_Boolean IsBound (const TopoDS_Shape & K);
		%feature("compactdefaultargs") UnBind;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: bool
") UnBind;
		Standard_Boolean UnBind (const TopoDS_Shape & K);
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: BRepOffset_ListOfInterval
") Find;
		const BRepOffset_ListOfInterval & Find (const TopoDS_Shape & K);
		%feature("compactdefaultargs") ChangeFind;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: BRepOffset_ListOfInterval
") ChangeFind;
		BRepOffset_ListOfInterval & ChangeFind (const TopoDS_Shape & K);
		%feature("compactdefaultargs") Find1;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: Standard_Address
") Find1;
		Standard_Address Find1 (const TopoDS_Shape & K);
		%feature("compactdefaultargs") ChangeFind1;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: Standard_Address
") ChangeFind1;
		Standard_Address ChangeFind1 (const TopoDS_Shape & K);
};


%extend BRepOffset_DataMapOfShapeListOfInterval {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepOffset_DataMapOfShapeMapOfShape;
class BRepOffset_DataMapOfShapeMapOfShape : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") BRepOffset_DataMapOfShapeMapOfShape;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") BRepOffset_DataMapOfShapeMapOfShape;
		 BRepOffset_DataMapOfShapeMapOfShape (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: BRepOffset_DataMapOfShapeMapOfShape &
	:rtype: BRepOffset_DataMapOfShapeMapOfShape
") Assign;
		BRepOffset_DataMapOfShapeMapOfShape & Assign (const BRepOffset_DataMapOfShapeMapOfShape & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: BRepOffset_DataMapOfShapeMapOfShape &
	:rtype: BRepOffset_DataMapOfShapeMapOfShape
") operator =;
		BRepOffset_DataMapOfShapeMapOfShape & operator = (const BRepOffset_DataMapOfShapeMapOfShape & Other);
		%feature("compactdefaultargs") ReSize;
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: int
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:param I:
	:type I: TopTools_MapOfShape &
	:rtype: bool
") Bind;
		Standard_Boolean Bind (const TopoDS_Shape & K,const TopTools_MapOfShape & I);
		%feature("compactdefaultargs") IsBound;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: bool
") IsBound;
		Standard_Boolean IsBound (const TopoDS_Shape & K);
		%feature("compactdefaultargs") UnBind;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: bool
") UnBind;
		Standard_Boolean UnBind (const TopoDS_Shape & K);
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: TopTools_MapOfShape
") Find;
		const TopTools_MapOfShape & Find (const TopoDS_Shape & K);
		%feature("compactdefaultargs") ChangeFind;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: TopTools_MapOfShape
") ChangeFind;
		TopTools_MapOfShape & ChangeFind (const TopoDS_Shape & K);
		%feature("compactdefaultargs") Find1;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: Standard_Address
") Find1;
		Standard_Address Find1 (const TopoDS_Shape & K);
		%feature("compactdefaultargs") ChangeFind1;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: Standard_Address
") ChangeFind1;
		Standard_Address ChangeFind1 (const TopoDS_Shape & K);
};


%extend BRepOffset_DataMapOfShapeMapOfShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepOffset_DataMapOfShapeOffset;
class BRepOffset_DataMapOfShapeOffset : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") BRepOffset_DataMapOfShapeOffset;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") BRepOffset_DataMapOfShapeOffset;
		 BRepOffset_DataMapOfShapeOffset (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: BRepOffset_DataMapOfShapeOffset &
	:rtype: BRepOffset_DataMapOfShapeOffset
") Assign;
		BRepOffset_DataMapOfShapeOffset & Assign (const BRepOffset_DataMapOfShapeOffset & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: BRepOffset_DataMapOfShapeOffset &
	:rtype: BRepOffset_DataMapOfShapeOffset
") operator =;
		BRepOffset_DataMapOfShapeOffset & operator = (const BRepOffset_DataMapOfShapeOffset & Other);
		%feature("compactdefaultargs") ReSize;
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: int
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:param I:
	:type I: BRepOffset_Offset &
	:rtype: bool
") Bind;
		Standard_Boolean Bind (const TopoDS_Shape & K,const BRepOffset_Offset & I);
		%feature("compactdefaultargs") IsBound;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: bool
") IsBound;
		Standard_Boolean IsBound (const TopoDS_Shape & K);
		%feature("compactdefaultargs") UnBind;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: bool
") UnBind;
		Standard_Boolean UnBind (const TopoDS_Shape & K);
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: BRepOffset_Offset
") Find;
		const BRepOffset_Offset & Find (const TopoDS_Shape & K);
		%feature("compactdefaultargs") ChangeFind;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: BRepOffset_Offset
") ChangeFind;
		BRepOffset_Offset & ChangeFind (const TopoDS_Shape & K);
		%feature("compactdefaultargs") Find1;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: Standard_Address
") Find1;
		Standard_Address Find1 (const TopoDS_Shape & K);
		%feature("compactdefaultargs") ChangeFind1;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: Standard_Address
") ChangeFind1;
		Standard_Address ChangeFind1 (const TopoDS_Shape & K);
};


%extend BRepOffset_DataMapOfShapeOffset {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class BRepOffset_Inter2d {
	public:
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "	* Computes the intersections between the edges stored is AsDes as descendants of <F> . Intersections is computed between two edges if one of them is bound in NewEdges.

	:param AsDes:
	:type AsDes: Handle_BRepAlgo_AsDes &
	:param F:
	:type F: TopoDS_Face &
	:param NewEdges:
	:type NewEdges: TopTools_IndexedMapOfShape &
	:param Tol:
	:type Tol: float
	:rtype: void
") Compute;
		static void Compute (const Handle_BRepAlgo_AsDes & AsDes,const TopoDS_Face & F,const TopTools_IndexedMapOfShape & NewEdges,const Standard_Real Tol);
		%feature("compactdefaultargs") ConnexIntByInt;
		%feature("autodoc", "	:param FI:
	:type FI: TopoDS_Face &
	:param OFI:
	:type OFI: BRepOffset_Offset &
	:param MES:
	:type MES: TopTools_DataMapOfShapeShape &
	:param Build:
	:type Build: TopTools_DataMapOfShapeShape &
	:param AsDes:
	:type AsDes: Handle_BRepAlgo_AsDes &
	:param Offset:
	:type Offset: float
	:param Tol:
	:type Tol: float
	:rtype: void
") ConnexIntByInt;
		static void ConnexIntByInt (const TopoDS_Face & FI,BRepOffset_Offset & OFI,TopTools_DataMapOfShapeShape & MES,const TopTools_DataMapOfShapeShape & Build,const Handle_BRepAlgo_AsDes & AsDes,const Standard_Real Offset,const Standard_Real Tol);
};


%extend BRepOffset_Inter2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepOffset_Inter3d;
class BRepOffset_Inter3d {
	public:
		%feature("compactdefaultargs") BRepOffset_Inter3d;
		%feature("autodoc", "	:param AsDes:
	:type AsDes: Handle_BRepAlgo_AsDes &
	:param Side:
	:type Side: TopAbs_State
	:param Tol:
	:type Tol: float
	:rtype: None
") BRepOffset_Inter3d;
		 BRepOffset_Inter3d (const Handle_BRepAlgo_AsDes & AsDes,const TopAbs_State Side,const Standard_Real Tol);
		%feature("compactdefaultargs") CompletInt;
		%feature("autodoc", "	:param SetOfFaces:
	:type SetOfFaces: TopTools_ListOfShape &
	:param InitOffsetFace:
	:type InitOffsetFace: BRepAlgo_Image &
	:rtype: None
") CompletInt;
		void CompletInt (const TopTools_ListOfShape & SetOfFaces,const BRepAlgo_Image & InitOffsetFace);
		%feature("compactdefaultargs") FaceInter;
		%feature("autodoc", "	:param F1:
	:type F1: TopoDS_Face &
	:param F2:
	:type F2: TopoDS_Face &
	:param InitOffsetFace:
	:type InitOffsetFace: BRepAlgo_Image &
	:rtype: None
") FaceInter;
		void FaceInter (const TopoDS_Face & F1,const TopoDS_Face & F2,const BRepAlgo_Image & InitOffsetFace);
		%feature("compactdefaultargs") ConnexIntByArc;
		%feature("autodoc", "	:param SetOfFaces:
	:type SetOfFaces: TopTools_ListOfShape &
	:param ShapeInit:
	:type ShapeInit: TopoDS_Shape &
	:param Analyse:
	:type Analyse: BRepOffset_Analyse &
	:param InitOffsetFace:
	:type InitOffsetFace: BRepAlgo_Image &
	:rtype: None
") ConnexIntByArc;
		void ConnexIntByArc (const TopTools_ListOfShape & SetOfFaces,const TopoDS_Shape & ShapeInit,const BRepOffset_Analyse & Analyse,const BRepAlgo_Image & InitOffsetFace);
		%feature("compactdefaultargs") ConnexIntByInt;
		%feature("autodoc", "	:param SI:
	:type SI: TopoDS_Shape &
	:param MapSF:
	:type MapSF: BRepOffset_DataMapOfShapeOffset &
	:param A:
	:type A: BRepOffset_Analyse &
	:param MES:
	:type MES: TopTools_DataMapOfShapeShape &
	:param Build:
	:type Build: TopTools_DataMapOfShapeShape &
	:param Failed:
	:type Failed: TopTools_ListOfShape &
	:rtype: None
") ConnexIntByInt;
		void ConnexIntByInt (const TopoDS_Shape & SI,const BRepOffset_DataMapOfShapeOffset & MapSF,const BRepOffset_Analyse & A,TopTools_DataMapOfShapeShape & MES,TopTools_DataMapOfShapeShape & Build,TopTools_ListOfShape & Failed);
		%feature("compactdefaultargs") ContextIntByInt;
		%feature("autodoc", "	:param ContextFaces:
	:type ContextFaces: TopTools_IndexedMapOfShape &
	:param ExtentContext:
	:type ExtentContext: bool
	:param MapSF:
	:type MapSF: BRepOffset_DataMapOfShapeOffset &
	:param A:
	:type A: BRepOffset_Analyse &
	:param MES:
	:type MES: TopTools_DataMapOfShapeShape &
	:param Build:
	:type Build: TopTools_DataMapOfShapeShape &
	:param Failed:
	:type Failed: TopTools_ListOfShape &
	:rtype: None
") ContextIntByInt;
		void ContextIntByInt (const TopTools_IndexedMapOfShape & ContextFaces,const Standard_Boolean ExtentContext,const BRepOffset_DataMapOfShapeOffset & MapSF,const BRepOffset_Analyse & A,TopTools_DataMapOfShapeShape & MES,TopTools_DataMapOfShapeShape & Build,TopTools_ListOfShape & Failed);
		%feature("compactdefaultargs") ContextIntByArc;
		%feature("autodoc", "	:param ContextFaces:
	:type ContextFaces: TopTools_IndexedMapOfShape &
	:param ExtentContext:
	:type ExtentContext: bool
	:param Analyse:
	:type Analyse: BRepOffset_Analyse &
	:param InitOffsetFace:
	:type InitOffsetFace: BRepAlgo_Image &
	:param InitOffsetEdge:
	:type InitOffsetEdge: BRepAlgo_Image &
	:rtype: None
") ContextIntByArc;
		void ContextIntByArc (const TopTools_IndexedMapOfShape & ContextFaces,const Standard_Boolean ExtentContext,const BRepOffset_Analyse & Analyse,const BRepAlgo_Image & InitOffsetFace,BRepAlgo_Image & InitOffsetEdge);
		%feature("compactdefaultargs") AddCommonEdges;
		%feature("autodoc", "	:param SetOfFaces:
	:type SetOfFaces: TopTools_ListOfShape &
	:rtype: None
") AddCommonEdges;
		void AddCommonEdges (const TopTools_ListOfShape & SetOfFaces);
		%feature("compactdefaultargs") SetDone;
		%feature("autodoc", "	:param F1:
	:type F1: TopoDS_Face &
	:param F2:
	:type F2: TopoDS_Face &
	:rtype: None
") SetDone;
		void SetDone (const TopoDS_Face & F1,const TopoDS_Face & F2);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	:param F1:
	:type F1: TopoDS_Face &
	:param F2:
	:type F2: TopoDS_Face &
	:rtype: bool
") IsDone;
		Standard_Boolean IsDone (const TopoDS_Face & F1,const TopoDS_Face & F2);
		%feature("compactdefaultargs") TouchedFaces;
		%feature("autodoc", "	:rtype: TopTools_IndexedMapOfShape
") TouchedFaces;
		TopTools_IndexedMapOfShape & TouchedFaces ();
		%feature("compactdefaultargs") AsDes;
		%feature("autodoc", "	:rtype: Handle_BRepAlgo_AsDes
") AsDes;
		Handle_BRepAlgo_AsDes AsDes ();
		%feature("compactdefaultargs") NewEdges;
		%feature("autodoc", "	:rtype: TopTools_IndexedMapOfShape
") NewEdges;
		TopTools_IndexedMapOfShape & NewEdges ();
};


%extend BRepOffset_Inter3d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepOffset_Interval;
class BRepOffset_Interval {
	public:
		%feature("compactdefaultargs") BRepOffset_Interval;
		%feature("autodoc", "	:rtype: None
") BRepOffset_Interval;
		 BRepOffset_Interval ();
		%feature("compactdefaultargs") BRepOffset_Interval;
		%feature("autodoc", "	:param U1:
	:type U1: float
	:param U2:
	:type U2: float
	:param Type:
	:type Type: BRepOffset_Type
	:rtype: None
") BRepOffset_Interval;
		 BRepOffset_Interval (const Standard_Real U1,const Standard_Real U2,const BRepOffset_Type Type);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:param U:
	:type U: float
	:rtype: None
") First;
		void First (const Standard_Real U);
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:param U:
	:type U: float
	:rtype: None
") Last;
		void Last (const Standard_Real U);
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "	:param T:
	:type T: BRepOffset_Type
	:rtype: None
") Type;
		void Type (const BRepOffset_Type T);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: float
") First;
		Standard_Real First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: float
") Last;
		Standard_Real Last ();
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "	:rtype: BRepOffset_Type
") Type;
		BRepOffset_Type Type ();
};


%extend BRepOffset_Interval {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepOffset_ListIteratorOfListOfInterval;
class BRepOffset_ListIteratorOfListOfInterval {
	public:
		%feature("compactdefaultargs") BRepOffset_ListIteratorOfListOfInterval;
		%feature("autodoc", "	:rtype: None
") BRepOffset_ListIteratorOfListOfInterval;
		 BRepOffset_ListIteratorOfListOfInterval ();
		%feature("compactdefaultargs") BRepOffset_ListIteratorOfListOfInterval;
		%feature("autodoc", "	:param L:
	:type L: BRepOffset_ListOfInterval &
	:rtype: None
") BRepOffset_ListIteratorOfListOfInterval;
		 BRepOffset_ListIteratorOfListOfInterval (const BRepOffset_ListOfInterval & L);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param L:
	:type L: BRepOffset_ListOfInterval &
	:rtype: None
") Initialize;
		void Initialize (const BRepOffset_ListOfInterval & L);
		%feature("compactdefaultargs") More;
		%feature("autodoc", "	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "	:rtype: None
") Next;
		void Next ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: BRepOffset_Interval
") Value;
		BRepOffset_Interval & Value ();
};


%extend BRepOffset_ListIteratorOfListOfInterval {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepOffset_ListNodeOfListOfInterval;
class BRepOffset_ListNodeOfListOfInterval : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") BRepOffset_ListNodeOfListOfInterval;
		%feature("autodoc", "	:param I:
	:type I: BRepOffset_Interval &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") BRepOffset_ListNodeOfListOfInterval;
		 BRepOffset_ListNodeOfListOfInterval (const BRepOffset_Interval & I,const TCollection_MapNodePtr & n);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: BRepOffset_Interval
") Value;
		BRepOffset_Interval & Value ();
};


%extend BRepOffset_ListNodeOfListOfInterval {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_BRepOffset_ListNodeOfListOfInterval(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_BRepOffset_ListNodeOfListOfInterval::Handle_BRepOffset_ListNodeOfListOfInterval %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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
    BRepOffset_ListNodeOfListOfInterval* _get_reference() {
    return (BRepOffset_ListNodeOfListOfInterval*)$self->Access();
    }
};

%extend Handle_BRepOffset_ListNodeOfListOfInterval {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend BRepOffset_ListNodeOfListOfInterval {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepOffset_ListOfInterval;
class BRepOffset_ListOfInterval {
	public:
		%feature("compactdefaultargs") BRepOffset_ListOfInterval;
		%feature("autodoc", "	:rtype: None
") BRepOffset_ListOfInterval;
		 BRepOffset_ListOfInterval ();
		%feature("compactdefaultargs") BRepOffset_ListOfInterval;
		%feature("autodoc", "	:param Other:
	:type Other: BRepOffset_ListOfInterval &
	:rtype: None
") BRepOffset_ListOfInterval;
		 BRepOffset_ListOfInterval (const BRepOffset_ListOfInterval & Other);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: BRepOffset_ListOfInterval &
	:rtype: None
") Assign;
		void Assign (const BRepOffset_ListOfInterval & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: BRepOffset_ListOfInterval &
	:rtype: None
") operator =;
		void operator = (const BRepOffset_ListOfInterval & Other);
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
	:type I: BRepOffset_Interval &
	:rtype: None
") Prepend;
		void Prepend (const BRepOffset_Interval & I);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param I:
	:type I: BRepOffset_Interval &
	:param theIt:
	:type theIt: BRepOffset_ListIteratorOfListOfInterval &
	:rtype: None
") Prepend;
		void Prepend (const BRepOffset_Interval & I,BRepOffset_ListIteratorOfListOfInterval & theIt);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param Other:
	:type Other: BRepOffset_ListOfInterval &
	:rtype: None
") Prepend;
		void Prepend (BRepOffset_ListOfInterval & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param I:
	:type I: BRepOffset_Interval &
	:rtype: None
") Append;
		void Append (const BRepOffset_Interval & I);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param I:
	:type I: BRepOffset_Interval &
	:param theIt:
	:type theIt: BRepOffset_ListIteratorOfListOfInterval &
	:rtype: None
") Append;
		void Append (const BRepOffset_Interval & I,BRepOffset_ListIteratorOfListOfInterval & theIt);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param Other:
	:type Other: BRepOffset_ListOfInterval &
	:rtype: None
") Append;
		void Append (BRepOffset_ListOfInterval & Other);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: BRepOffset_Interval
") First;
		BRepOffset_Interval & First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: BRepOffset_Interval
") Last;
		BRepOffset_Interval & Last ();
		%feature("compactdefaultargs") RemoveFirst;
		%feature("autodoc", "	:rtype: None
") RemoveFirst;
		void RemoveFirst ();
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param It:
	:type It: BRepOffset_ListIteratorOfListOfInterval &
	:rtype: None
") Remove;
		void Remove (BRepOffset_ListIteratorOfListOfInterval & It);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param I:
	:type I: BRepOffset_Interval &
	:param It:
	:type It: BRepOffset_ListIteratorOfListOfInterval &
	:rtype: None
") InsertBefore;
		void InsertBefore (const BRepOffset_Interval & I,BRepOffset_ListIteratorOfListOfInterval & It);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Other:
	:type Other: BRepOffset_ListOfInterval &
	:param It:
	:type It: BRepOffset_ListIteratorOfListOfInterval &
	:rtype: None
") InsertBefore;
		void InsertBefore (BRepOffset_ListOfInterval & Other,BRepOffset_ListIteratorOfListOfInterval & It);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param I:
	:type I: BRepOffset_Interval &
	:param It:
	:type It: BRepOffset_ListIteratorOfListOfInterval &
	:rtype: None
") InsertAfter;
		void InsertAfter (const BRepOffset_Interval & I,BRepOffset_ListIteratorOfListOfInterval & It);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Other:
	:type Other: BRepOffset_ListOfInterval &
	:param It:
	:type It: BRepOffset_ListIteratorOfListOfInterval &
	:rtype: None
") InsertAfter;
		void InsertAfter (BRepOffset_ListOfInterval & Other,BRepOffset_ListIteratorOfListOfInterval & It);
};


%extend BRepOffset_ListOfInterval {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepOffset_MakeLoops;
class BRepOffset_MakeLoops {
	public:
		%feature("compactdefaultargs") BRepOffset_MakeLoops;
		%feature("autodoc", "	:rtype: None
") BRepOffset_MakeLoops;
		 BRepOffset_MakeLoops ();
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "	:param LF:
	:type LF: TopTools_ListOfShape &
	:param AsDes:
	:type AsDes: Handle_BRepAlgo_AsDes &
	:param Image:
	:type Image: BRepAlgo_Image &
	:rtype: None
") Build;
		void Build (const TopTools_ListOfShape & LF,const Handle_BRepAlgo_AsDes & AsDes,BRepAlgo_Image & Image);
		%feature("compactdefaultargs") BuildOnContext;
		%feature("autodoc", "	:param LContext:
	:type LContext: TopTools_ListOfShape &
	:param Analyse:
	:type Analyse: BRepOffset_Analyse &
	:param AsDes:
	:type AsDes: Handle_BRepAlgo_AsDes &
	:param Image:
	:type Image: BRepAlgo_Image &
	:param InSide:
	:type InSide: bool
	:rtype: None
") BuildOnContext;
		void BuildOnContext (const TopTools_ListOfShape & LContext,const BRepOffset_Analyse & Analyse,const Handle_BRepAlgo_AsDes & AsDes,BRepAlgo_Image & Image,const Standard_Boolean InSide);
		%feature("compactdefaultargs") BuildFaces;
		%feature("autodoc", "	:param LF:
	:type LF: TopTools_ListOfShape &
	:param AsDes:
	:type AsDes: Handle_BRepAlgo_AsDes &
	:param Image:
	:type Image: BRepAlgo_Image &
	:rtype: None
") BuildFaces;
		void BuildFaces (const TopTools_ListOfShape & LF,const Handle_BRepAlgo_AsDes & AsDes,BRepAlgo_Image & Image);
};


%extend BRepOffset_MakeLoops {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepOffset_MakeOffset;
class BRepOffset_MakeOffset {
	public:
		%feature("compactdefaultargs") BRepOffset_MakeOffset;
		%feature("autodoc", "	:rtype: None
") BRepOffset_MakeOffset;
		 BRepOffset_MakeOffset ();
		%feature("compactdefaultargs") BRepOffset_MakeOffset;
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:param Offset:
	:type Offset: float
	:param Tol:
	:type Tol: float
	:param Mode: default value is BRepOffset_Skin
	:type Mode: BRepOffset_Mode
	:param Intersection: default value is Standard_False
	:type Intersection: bool
	:param SelfInter: default value is Standard_False
	:type SelfInter: bool
	:param Join: default value is GeomAbs_Arc
	:type Join: GeomAbs_JoinType
	:param Thickening: default value is Standard_False
	:type Thickening: bool
	:rtype: None
") BRepOffset_MakeOffset;
		 BRepOffset_MakeOffset (const TopoDS_Shape & S,const Standard_Real Offset,const Standard_Real Tol,const BRepOffset_Mode Mode = BRepOffset_Skin,const Standard_Boolean Intersection = Standard_False,const Standard_Boolean SelfInter = Standard_False,const GeomAbs_JoinType Join = GeomAbs_Arc,const Standard_Boolean Thickening = Standard_False);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:param Offset:
	:type Offset: float
	:param Tol:
	:type Tol: float
	:param Mode: default value is BRepOffset_Skin
	:type Mode: BRepOffset_Mode
	:param Intersection: default value is Standard_False
	:type Intersection: bool
	:param SelfInter: default value is Standard_False
	:type SelfInter: bool
	:param Join: default value is GeomAbs_Arc
	:type Join: GeomAbs_JoinType
	:param Thickening: default value is Standard_False
	:type Thickening: bool
	:rtype: None
") Initialize;
		void Initialize (const TopoDS_Shape & S,const Standard_Real Offset,const Standard_Real Tol,const BRepOffset_Mode Mode = BRepOffset_Skin,const Standard_Boolean Intersection = Standard_False,const Standard_Boolean SelfInter = Standard_False,const GeomAbs_JoinType Join = GeomAbs_Arc,const Standard_Boolean Thickening = Standard_False);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") AddFace;
		%feature("autodoc", "	* Add Closing Faces, <F> has to be in the initial shape S.

	:param F:
	:type F: TopoDS_Face &
	:rtype: None
") AddFace;
		void AddFace (const TopoDS_Face & F);
		%feature("compactdefaultargs") SetOffsetOnFace;
		%feature("autodoc", "	* set the offset <Off> on the Face <F>

	:param F:
	:type F: TopoDS_Face &
	:param Off:
	:type Off: float
	:rtype: None
") SetOffsetOnFace;
		void SetOffsetOnFace (const TopoDS_Face & F,const Standard_Real Off);
		%feature("compactdefaultargs") MakeOffsetShape;
		%feature("autodoc", "	:rtype: None
") MakeOffsetShape;
		void MakeOffsetShape ();
		%feature("compactdefaultargs") MakeThickSolid;
		%feature("autodoc", "	:rtype: None
") MakeThickSolid;
		void MakeThickSolid ();
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Shape;
		const TopoDS_Shape  Shape ();
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "	* returns information if IsDone() = False.

	:rtype: BRepOffset_Error
") Error;
		BRepOffset_Error Error ();
		%feature("compactdefaultargs") OffsetFacesFromShapes;
		%feature("autodoc", "	* Returns <Image> containing links between initials shapes and offset faces.

	:rtype: BRepAlgo_Image
") OffsetFacesFromShapes;
		const BRepAlgo_Image & OffsetFacesFromShapes ();
		%feature("compactdefaultargs") GetJoinType;
		%feature("autodoc", "	* Returns myJoin.

	:rtype: GeomAbs_JoinType
") GetJoinType;
		GeomAbs_JoinType GetJoinType ();
		%feature("compactdefaultargs") OffsetEdgesFromShapes;
		%feature("autodoc", "	* Returns <Image> containing links between initials shapes and offset edges.

	:rtype: BRepAlgo_Image
") OffsetEdgesFromShapes;
		const BRepAlgo_Image & OffsetEdgesFromShapes ();
		%feature("compactdefaultargs") ClosingFaces;
		%feature("autodoc", "	* Returns the list of closing faces stores by AddFace

	:rtype: TopTools_IndexedMapOfShape
") ClosingFaces;
		const TopTools_IndexedMapOfShape & ClosingFaces ();
		%feature("compactdefaultargs") CheckInputData;
		%feature("autodoc", "	* Makes pre analysis of possibility offset perform. Use method Error() to get more information. Finds first error. List of checks: 1) Check for existence object with non-null offset. 2) Check for connectivity in offset shell. 3) Check continuity of input surfaces. 4) Check for normals existence on grid. returns 1 if possible make computations and 0 if not possible.

	:rtype: bool
") CheckInputData;
		Standard_Boolean CheckInputData ();
		%feature("compactdefaultargs") GetBadShape;
		%feature("autodoc", "	* Return bad shape, which obtained in CheckInputData.

	:rtype: TopoDS_Shape
") GetBadShape;
		const TopoDS_Shape  GetBadShape ();
};


%extend BRepOffset_MakeOffset {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepOffset_Offset;
class BRepOffset_Offset {
	public:
		%feature("compactdefaultargs") BRepOffset_Offset;
		%feature("autodoc", "	:rtype: None
") BRepOffset_Offset;
		 BRepOffset_Offset ();
		%feature("compactdefaultargs") BRepOffset_Offset;
		%feature("autodoc", "	:param Face:
	:type Face: TopoDS_Face &
	:param Offset:
	:type Offset: float
	:param OffsetOutside: default value is Standard_True
	:type OffsetOutside: bool
	:param JoinType: default value is GeomAbs_Arc
	:type JoinType: GeomAbs_JoinType
	:rtype: None
") BRepOffset_Offset;
		 BRepOffset_Offset (const TopoDS_Face & Face,const Standard_Real Offset,const Standard_Boolean OffsetOutside = Standard_True,const GeomAbs_JoinType JoinType = GeomAbs_Arc);
		%feature("compactdefaultargs") BRepOffset_Offset;
		%feature("autodoc", "	* This method will be called when you want to share the edges soon generated from an other face. e.g. when two faces are tangents the common edge will generate only one edge ( no pipe). //! The Map will be fill as follow: //! Created(E) = E' with: E = an edge of <Face> E' = the image of E in the offseting of another face sharing E with a continuity at least G1

	:param Face:
	:type Face: TopoDS_Face &
	:param Offset:
	:type Offset: float
	:param Created:
	:type Created: TopTools_DataMapOfShapeShape &
	:param OffsetOutside: default value is Standard_True
	:type OffsetOutside: bool
	:param JoinType: default value is GeomAbs_Arc
	:type JoinType: GeomAbs_JoinType
	:rtype: None
") BRepOffset_Offset;
		 BRepOffset_Offset (const TopoDS_Face & Face,const Standard_Real Offset,const TopTools_DataMapOfShapeShape & Created,const Standard_Boolean OffsetOutside = Standard_True,const GeomAbs_JoinType JoinType = GeomAbs_Arc);
		%feature("compactdefaultargs") BRepOffset_Offset;
		%feature("autodoc", "	:param Path:
	:type Path: TopoDS_Edge &
	:param Edge1:
	:type Edge1: TopoDS_Edge &
	:param Edge2:
	:type Edge2: TopoDS_Edge &
	:param Offset:
	:type Offset: float
	:param Polynomial: default value is Standard_False
	:type Polynomial: bool
	:param Tol: default value is 1.0e-4
	:type Tol: float
	:param Conti: default value is GeomAbs_C1
	:type Conti: GeomAbs_Shape
	:rtype: None
") BRepOffset_Offset;
		 BRepOffset_Offset (const TopoDS_Edge & Path,const TopoDS_Edge & Edge1,const TopoDS_Edge & Edge2,const Standard_Real Offset,const Standard_Boolean Polynomial = Standard_False,const Standard_Real Tol = 1.0e-4,const GeomAbs_Shape Conti = GeomAbs_C1);
		%feature("compactdefaultargs") BRepOffset_Offset;
		%feature("autodoc", "	:param Path:
	:type Path: TopoDS_Edge &
	:param Edge1:
	:type Edge1: TopoDS_Edge &
	:param Edge2:
	:type Edge2: TopoDS_Edge &
	:param Offset:
	:type Offset: float
	:param FirstEdge:
	:type FirstEdge: TopoDS_Edge &
	:param LastEdge:
	:type LastEdge: TopoDS_Edge &
	:param Polynomial: default value is Standard_False
	:type Polynomial: bool
	:param Tol: default value is 1.0e-4
	:type Tol: float
	:param Conti: default value is GeomAbs_C1
	:type Conti: GeomAbs_Shape
	:rtype: None
") BRepOffset_Offset;
		 BRepOffset_Offset (const TopoDS_Edge & Path,const TopoDS_Edge & Edge1,const TopoDS_Edge & Edge2,const Standard_Real Offset,const TopoDS_Edge & FirstEdge,const TopoDS_Edge & LastEdge,const Standard_Boolean Polynomial = Standard_False,const Standard_Real Tol = 1.0e-4,const GeomAbs_Shape Conti = GeomAbs_C1);
		%feature("compactdefaultargs") BRepOffset_Offset;
		%feature("autodoc", "	* Tol and Conti are only used if Polynomial is True (Used to perfrom the approximation)

	:param Vertex:
	:type Vertex: TopoDS_Vertex &
	:param LEdge:
	:type LEdge: TopTools_ListOfShape &
	:param Offset:
	:type Offset: float
	:param Polynomial: default value is Standard_False
	:type Polynomial: bool
	:param Tol: default value is 1.0e-4
	:type Tol: float
	:param Conti: default value is GeomAbs_C1
	:type Conti: GeomAbs_Shape
	:rtype: None
") BRepOffset_Offset;
		 BRepOffset_Offset (const TopoDS_Vertex & Vertex,const TopTools_ListOfShape & LEdge,const Standard_Real Offset,const Standard_Boolean Polynomial = Standard_False,const Standard_Real Tol = 1.0e-4,const GeomAbs_Shape Conti = GeomAbs_C1);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param Face:
	:type Face: TopoDS_Face &
	:param Offset:
	:type Offset: float
	:param OffsetOutside: default value is Standard_True
	:type OffsetOutside: bool
	:param JoinType: default value is GeomAbs_Arc
	:type JoinType: GeomAbs_JoinType
	:rtype: None
") Init;
		void Init (const TopoDS_Face & Face,const Standard_Real Offset,const Standard_Boolean OffsetOutside = Standard_True,const GeomAbs_JoinType JoinType = GeomAbs_Arc);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param Face:
	:type Face: TopoDS_Face &
	:param Offset:
	:type Offset: float
	:param Created:
	:type Created: TopTools_DataMapOfShapeShape &
	:param OffsetOutside: default value is Standard_True
	:type OffsetOutside: bool
	:param JoinType: default value is GeomAbs_Arc
	:type JoinType: GeomAbs_JoinType
	:rtype: None
") Init;
		void Init (const TopoDS_Face & Face,const Standard_Real Offset,const TopTools_DataMapOfShapeShape & Created,const Standard_Boolean OffsetOutside = Standard_True,const GeomAbs_JoinType JoinType = GeomAbs_Arc);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param Path:
	:type Path: TopoDS_Edge &
	:param Edge1:
	:type Edge1: TopoDS_Edge &
	:param Edge2:
	:type Edge2: TopoDS_Edge &
	:param Offset:
	:type Offset: float
	:param Polynomial: default value is Standard_False
	:type Polynomial: bool
	:param Tol: default value is 1.0e-4
	:type Tol: float
	:param Conti: default value is GeomAbs_C1
	:type Conti: GeomAbs_Shape
	:rtype: None
") Init;
		void Init (const TopoDS_Edge & Path,const TopoDS_Edge & Edge1,const TopoDS_Edge & Edge2,const Standard_Real Offset,const Standard_Boolean Polynomial = Standard_False,const Standard_Real Tol = 1.0e-4,const GeomAbs_Shape Conti = GeomAbs_C1);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param Path:
	:type Path: TopoDS_Edge &
	:param Edge1:
	:type Edge1: TopoDS_Edge &
	:param Edge2:
	:type Edge2: TopoDS_Edge &
	:param Offset:
	:type Offset: float
	:param FirstEdge:
	:type FirstEdge: TopoDS_Edge &
	:param LastEdge:
	:type LastEdge: TopoDS_Edge &
	:param Polynomial: default value is Standard_False
	:type Polynomial: bool
	:param Tol: default value is 1.0e-4
	:type Tol: float
	:param Conti: default value is GeomAbs_C1
	:type Conti: GeomAbs_Shape
	:rtype: None
") Init;
		void Init (const TopoDS_Edge & Path,const TopoDS_Edge & Edge1,const TopoDS_Edge & Edge2,const Standard_Real Offset,const TopoDS_Edge & FirstEdge,const TopoDS_Edge & LastEdge,const Standard_Boolean Polynomial = Standard_False,const Standard_Real Tol = 1.0e-4,const GeomAbs_Shape Conti = GeomAbs_C1);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Tol and Conti are only used if Polynomial is True (Used to perfrom the approximation)

	:param Vertex:
	:type Vertex: TopoDS_Vertex &
	:param LEdge:
	:type LEdge: TopTools_ListOfShape &
	:param Offset:
	:type Offset: float
	:param Polynomial: default value is Standard_False
	:type Polynomial: bool
	:param Tol: default value is 1.0e-4
	:type Tol: float
	:param Conti: default value is GeomAbs_C1
	:type Conti: GeomAbs_Shape
	:rtype: None
") Init;
		void Init (const TopoDS_Vertex & Vertex,const TopTools_ListOfShape & LEdge,const Standard_Real Offset,const Standard_Boolean Polynomial = Standard_False,const Standard_Real Tol = 1.0e-4,const GeomAbs_Shape Conti = GeomAbs_C1);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Only used in Rolling Ball. Pipe on Free Boundary

	:param Edge:
	:type Edge: TopoDS_Edge &
	:param Offset:
	:type Offset: float
	:rtype: None
") Init;
		void Init (const TopoDS_Edge & Edge,const Standard_Real Offset);
		%feature("compactdefaultargs") InitialShape;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") InitialShape;
		const TopoDS_Shape  InitialShape ();
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "	:rtype: TopoDS_Face
") Face;
		const TopoDS_Face  Face ();
		%feature("compactdefaultargs") Generated;
		%feature("autodoc", "	:param Shape:
	:type Shape: TopoDS_Shape &
	:rtype: TopoDS_Shape
") Generated;
		TopoDS_Shape Generated (const TopoDS_Shape & Shape);
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "	:rtype: BRepOffset_Status
") Status;
		BRepOffset_Status Status ();
};


%extend BRepOffset_Offset {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class BRepOffset_Tool {
	public:
		%feature("compactdefaultargs") EdgeVertices;
		%feature("autodoc", "	* <V1> is the FirstVertex ,<V2> is the Last Vertex of <Edge> taking account the orientation of Edge.

	:param E:
	:type E: TopoDS_Edge &
	:param V1:
	:type V1: TopoDS_Vertex &
	:param V2:
	:type V2: TopoDS_Vertex &
	:rtype: void
") EdgeVertices;
		static void EdgeVertices (const TopoDS_Edge & E,TopoDS_Vertex & V1,TopoDS_Vertex & V2);
		%feature("compactdefaultargs") OriEdgeInFace;
		%feature("autodoc", "	* returns the cumul of the orientation of <Edge> and thc containing wire in <Face>

	:param E:
	:type E: TopoDS_Edge &
	:param F:
	:type F: TopoDS_Face &
	:rtype: TopAbs_Orientation
") OriEdgeInFace;
		static TopAbs_Orientation OriEdgeInFace (const TopoDS_Edge & E,const TopoDS_Face & F);
		%feature("compactdefaultargs") OrientSection;
		%feature("autodoc", "	* <E> is a section between <F1> and <F2>. Computes <O1> the orientation of <E> in <F1> influenced by <F2>. idem for <O2>.

	:param E:
	:type E: TopoDS_Edge &
	:param F1:
	:type F1: TopoDS_Face &
	:param F2:
	:type F2: TopoDS_Face &
	:param O1:
	:type O1: TopAbs_Orientation &
	:param O2:
	:type O2: TopAbs_Orientation &
	:rtype: void
") OrientSection;
		static void OrientSection (const TopoDS_Edge & E,const TopoDS_Face & F1,const TopoDS_Face & F2,TopAbs_Orientation & O1,TopAbs_Orientation & O2);
		%feature("compactdefaultargs") HasCommonShapes;
		%feature("autodoc", "	* Returns True if <F1> and <F2> has common Vertices or edges , <LE> contains the common edges. <LV> the common vertices.

	:param F1:
	:type F1: TopoDS_Face &
	:param F2:
	:type F2: TopoDS_Face &
	:param LE:
	:type LE: TopTools_ListOfShape &
	:param LV:
	:type LV: TopTools_ListOfShape &
	:rtype: bool
") HasCommonShapes;
		static Standard_Boolean HasCommonShapes (const TopoDS_Face & F1,const TopoDS_Face & F2,TopTools_ListOfShape & LE,TopTools_ListOfShape & LV);
		%feature("compactdefaultargs") Inter3D;
		%feature("autodoc", "	* Computes the Section betwwen <F1> and <F2> the edges solution are stored in <LInt1> with the orientation on <F1>, the sames edges are stored in <Lint2> with the orientation on <F2>.

	:param F1:
	:type F1: TopoDS_Face &
	:param F2:
	:type F2: TopoDS_Face &
	:param LInt1:
	:type LInt1: TopTools_ListOfShape &
	:param LInt2:
	:type LInt2: TopTools_ListOfShape &
	:param Side:
	:type Side: TopAbs_State
	:param RefEdge:
	:type RefEdge: TopoDS_Edge &
	:param IsRefEdgeDefined: default value is Standard_False
	:type IsRefEdgeDefined: bool
	:rtype: void
") Inter3D;
		static void Inter3D (const TopoDS_Face & F1,const TopoDS_Face & F2,TopTools_ListOfShape & LInt1,TopTools_ListOfShape & LInt2,const TopAbs_State Side,const TopoDS_Edge & RefEdge,const Standard_Boolean IsRefEdgeDefined = Standard_False);
		%feature("compactdefaultargs") TryProject;
		%feature("autodoc", "	* Find if the edges <Edges> of the face <F2> are on the face <F1>. Set in <LInt1> <LInt2> the updated edges. If all the edges are computed, returns true.

	:param F1:
	:type F1: TopoDS_Face &
	:param F2:
	:type F2: TopoDS_Face &
	:param Edges:
	:type Edges: TopTools_ListOfShape &
	:param LInt1:
	:type LInt1: TopTools_ListOfShape &
	:param LInt2:
	:type LInt2: TopTools_ListOfShape &
	:param Side:
	:type Side: TopAbs_State
	:param TolConf:
	:type TolConf: float
	:rtype: bool
") TryProject;
		static Standard_Boolean TryProject (const TopoDS_Face & F1,const TopoDS_Face & F2,const TopTools_ListOfShape & Edges,TopTools_ListOfShape & LInt1,TopTools_ListOfShape & LInt2,const TopAbs_State Side,const Standard_Real TolConf);
		%feature("compactdefaultargs") PipeInter;
		%feature("autodoc", "	:param F1:
	:type F1: TopoDS_Face &
	:param F2:
	:type F2: TopoDS_Face &
	:param LInt1:
	:type LInt1: TopTools_ListOfShape &
	:param LInt2:
	:type LInt2: TopTools_ListOfShape &
	:param Side:
	:type Side: TopAbs_State
	:rtype: void
") PipeInter;
		static void PipeInter (const TopoDS_Face & F1,const TopoDS_Face & F2,TopTools_ListOfShape & LInt1,TopTools_ListOfShape & LInt2,const TopAbs_State Side);
		%feature("compactdefaultargs") Inter2d;
		%feature("autodoc", "	:param F:
	:type F: TopoDS_Face &
	:param E1:
	:type E1: TopoDS_Edge &
	:param E2:
	:type E2: TopoDS_Edge &
	:param LV:
	:type LV: TopTools_ListOfShape &
	:param Tol:
	:type Tol: float
	:rtype: void
") Inter2d;
		static void Inter2d (const TopoDS_Face & F,const TopoDS_Edge & E1,const TopoDS_Edge & E2,TopTools_ListOfShape & LV,const Standard_Real Tol);
		%feature("compactdefaultargs") InterOrExtent;
		%feature("autodoc", "	:param F1:
	:type F1: TopoDS_Face &
	:param F2:
	:type F2: TopoDS_Face &
	:param LInt1:
	:type LInt1: TopTools_ListOfShape &
	:param LInt2:
	:type LInt2: TopTools_ListOfShape &
	:param Side:
	:type Side: TopAbs_State
	:rtype: void
") InterOrExtent;
		static void InterOrExtent (const TopoDS_Face & F1,const TopoDS_Face & F2,TopTools_ListOfShape & LInt1,TopTools_ListOfShape & LInt2,const TopAbs_State Side);
		%feature("compactdefaultargs") CheckBounds;
		%feature("autodoc", "	:param F:
	:type F: TopoDS_Face &
	:param Analyse:
	:type Analyse: BRepOffset_Analyse &
	:param enlargeU:
	:type enlargeU: bool
	:param enlargeVfirst:
	:type enlargeVfirst: bool
	:param enlargeVlast:
	:type enlargeVlast: bool
	:rtype: void
") CheckBounds;
		static void CheckBounds (const TopoDS_Face & F,const BRepOffset_Analyse & Analyse,Standard_Boolean &OutValue,Standard_Boolean &OutValue,Standard_Boolean &OutValue);
		%feature("compactdefaultargs") EnLargeFace;
		%feature("autodoc", "	* if <ChangeGeom> is True , the surface can be changed . if <UpdatePCurve> is True, update the pcurves of the edges of <F> on the new surface.if the surface has been changed, Returns True if The Surface of <NF> has changed.

	:param F:
	:type F: TopoDS_Face &
	:param NF:
	:type NF: TopoDS_Face &
	:param ChangeGeom:
	:type ChangeGeom: bool
	:param UpDatePCurve: default value is Standard_False
	:type UpDatePCurve: bool
	:param enlargeU: default value is Standard_True
	:type enlargeU: bool
	:param enlargeVfirst: default value is Standard_True
	:type enlargeVfirst: bool
	:param enlargeVlast: default value is Standard_True
	:type enlargeVlast: bool
	:rtype: bool
") EnLargeFace;
		static Standard_Boolean EnLargeFace (const TopoDS_Face & F,TopoDS_Face & NF,const Standard_Boolean ChangeGeom,const Standard_Boolean UpDatePCurve = Standard_False,const Standard_Boolean enlargeU = Standard_True,const Standard_Boolean enlargeVfirst = Standard_True,const Standard_Boolean enlargeVlast = Standard_True);
		%feature("compactdefaultargs") ExtentFace;
		%feature("autodoc", "	:param F:
	:type F: TopoDS_Face &
	:param ConstShapes:
	:type ConstShapes: TopTools_DataMapOfShapeShape &
	:param ToBuild:
	:type ToBuild: TopTools_DataMapOfShapeShape &
	:param Side:
	:type Side: TopAbs_State
	:param TolConf:
	:type TolConf: float
	:param NF:
	:type NF: TopoDS_Face &
	:rtype: void
") ExtentFace;
		static void ExtentFace (const TopoDS_Face & F,TopTools_DataMapOfShapeShape & ConstShapes,TopTools_DataMapOfShapeShape & ToBuild,const TopAbs_State Side,const Standard_Real TolConf,TopoDS_Face & NF);
		%feature("compactdefaultargs") BuildNeighbour;
		%feature("autodoc", "	* Via the wire explorer store in <NOnV1> for an Edge <E> of <W> his Edge neighbour on the first vertex <V1> of <E>. Store in NOnV2 the Neighbour of <E>on the last vertex <V2> of <E>.

	:param W:
	:type W: TopoDS_Wire &
	:param F:
	:type F: TopoDS_Face &
	:param NOnV1:
	:type NOnV1: TopTools_DataMapOfShapeShape &
	:param NOnV2:
	:type NOnV2: TopTools_DataMapOfShapeShape &
	:rtype: void
") BuildNeighbour;
		static void BuildNeighbour (const TopoDS_Wire & W,const TopoDS_Face & F,TopTools_DataMapOfShapeShape & NOnV1,TopTools_DataMapOfShapeShape & NOnV2);
		%feature("compactdefaultargs") MapVertexEdges;
		%feature("autodoc", "	* Store in MVE for a vertex <V> in <S> the incident edges <E> in <S>. An Edge is Store only one Time for a vertex.

	:param S:
	:type S: TopoDS_Shape &
	:param MVE:
	:type MVE: TopTools_DataMapOfShapeListOfShape &
	:rtype: void
") MapVertexEdges;
		static void MapVertexEdges (const TopoDS_Shape & S,TopTools_DataMapOfShapeListOfShape & MVE);
		%feature("compactdefaultargs") Deboucle3D;
		%feature("autodoc", "	* Remove the non valid part of an offsetshape 1 - Remove all the free boundary and the faces connex to such edges. 2 - Remove all the shapes not valid in the result (according to the side of offseting) in this verion only the first point is implemented.

	:param S:
	:type S: TopoDS_Shape &
	:param Boundary:
	:type Boundary: TopTools_MapOfShape &
	:rtype: TopoDS_Shape
") Deboucle3D;
		static TopoDS_Shape Deboucle3D (const TopoDS_Shape & S,const TopTools_MapOfShape & Boundary);
		%feature("compactdefaultargs") CorrectOrientation;
		%feature("autodoc", "	:param SI:
	:type SI: TopoDS_Shape &
	:param NewEdges:
	:type NewEdges: TopTools_IndexedMapOfShape &
	:param AsDes:
	:type AsDes: Handle_BRepAlgo_AsDes &
	:param InitOffset:
	:type InitOffset: BRepAlgo_Image &
	:param Offset:
	:type Offset: float
	:rtype: void
") CorrectOrientation;
		static void CorrectOrientation (const TopoDS_Shape & SI,const TopTools_IndexedMapOfShape & NewEdges,Handle_BRepAlgo_AsDes & AsDes,BRepAlgo_Image & InitOffset,const Standard_Real Offset);
		%feature("compactdefaultargs") Gabarit;
		%feature("autodoc", "	:param aCurve:
	:type aCurve: Handle_Geom_Curve &
	:rtype: float
") Gabarit;
		static Standard_Real Gabarit (const Handle_Geom_Curve & aCurve);
};


%extend BRepOffset_Tool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
