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
%module (package="OCC") BRepTools

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

%include BRepTools_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%rename(breptools) BRepTools;
%nodefaultctor BRepTools;
class BRepTools {
	public:
		%feature("autodoc", "	* Returns in UMin, UMax, VMin, VMax the bounding values in the parametric space of F.

	:param F:
	:type F: TopoDS_Face &
	:param UMin:
	:type UMin: float &
	:param UMax:
	:type UMax: float &
	:param VMin:
	:type VMin: float &
	:param VMax:
	:type VMax: float &
	:rtype: void
") UVBounds;
		static void UVBounds (const TopoDS_Face & F,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "	* Returns in UMin, UMax, VMin, VMax the bounding values of the wire in the parametric space of F.

	:param F:
	:type F: TopoDS_Face &
	:param W:
	:type W: TopoDS_Wire &
	:param UMin:
	:type UMin: float &
	:param UMax:
	:type UMax: float &
	:param VMin:
	:type VMin: float &
	:param VMax:
	:type VMax: float &
	:rtype: void
") UVBounds;
		static void UVBounds (const TopoDS_Face & F,const TopoDS_Wire & W,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "	* Returns in UMin, UMax, VMin, VMax the bounding values of the edge in the parametric space of F.

	:param F:
	:type F: TopoDS_Face &
	:param E:
	:type E: TopoDS_Edge &
	:param UMin:
	:type UMin: float &
	:param UMax:
	:type UMax: float &
	:param VMin:
	:type VMin: float &
	:param VMax:
	:type VMax: float &
	:rtype: void
") UVBounds;
		static void UVBounds (const TopoDS_Face & F,const TopoDS_Edge & E,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "	* Adds to the box <B> the bounding values in the parametric space of F.

	:param F:
	:type F: TopoDS_Face &
	:param B:
	:type B: Bnd_Box2d &
	:rtype: void
") AddUVBounds;
		static void AddUVBounds (const TopoDS_Face & F,Bnd_Box2d & B);
		%feature("autodoc", "	* Adds to the box <B> the bounding values of the wire in the parametric space of F.

	:param F:
	:type F: TopoDS_Face &
	:param W:
	:type W: TopoDS_Wire &
	:param B:
	:type B: Bnd_Box2d &
	:rtype: void
") AddUVBounds;
		static void AddUVBounds (const TopoDS_Face & F,const TopoDS_Wire & W,Bnd_Box2d & B);
		%feature("autodoc", "	* Adds to the box <B> the bounding values of the edge in the parametric space of F.

	:param F:
	:type F: TopoDS_Face &
	:param E:
	:type E: TopoDS_Edge &
	:param B:
	:type B: Bnd_Box2d &
	:rtype: void
") AddUVBounds;
		static void AddUVBounds (const TopoDS_Face & F,const TopoDS_Edge & E,Bnd_Box2d & B);
		%feature("autodoc", "	* Update a vertex (nothing is done)

	:param V:
	:type V: TopoDS_Vertex &
	:rtype: void
") Update;
		static void Update (const TopoDS_Vertex & V);
		%feature("autodoc", "	* Update an edge, compute 2d bounding boxes.

	:param E:
	:type E: TopoDS_Edge &
	:rtype: void
") Update;
		static void Update (const TopoDS_Edge & E);
		%feature("autodoc", "	* Update a wire (nothing is done)

	:param W:
	:type W: TopoDS_Wire &
	:rtype: void
") Update;
		static void Update (const TopoDS_Wire & W);
		%feature("autodoc", "	* Update a Face, update UV points.

	:param F:
	:type F: TopoDS_Face &
	:rtype: void
") Update;
		static void Update (const TopoDS_Face & F);
		%feature("autodoc", "	* Update a shell (nothing is done)

	:param S:
	:type S: TopoDS_Shell &
	:rtype: void
") Update;
		static void Update (const TopoDS_Shell & S);
		%feature("autodoc", "	* Update a solid (nothing is done)

	:param S:
	:type S: TopoDS_Solid &
	:rtype: void
") Update;
		static void Update (const TopoDS_Solid & S);
		%feature("autodoc", "	* Update a composite solid (nothing is done)

	:param C:
	:type C: TopoDS_CompSolid &
	:rtype: void
") Update;
		static void Update (const TopoDS_CompSolid & C);
		%feature("autodoc", "	* Update a compound (nothing is done)

	:param C:
	:type C: TopoDS_Compound &
	:rtype: void
") Update;
		static void Update (const TopoDS_Compound & C);
		%feature("autodoc", "	* Update a shape, call the corect update.

	:param S:
	:type S: TopoDS_Shape &
	:rtype: void
") Update;
		static void Update (const TopoDS_Shape & S);
		%feature("autodoc", "	* For all the edges of the face <F> reset the UV points to ensure that connected faces have the same point at there common extremity.

	:param F:
	:type F: TopoDS_Face &
	:rtype: void
") UpdateFaceUVPoints;
		static void UpdateFaceUVPoints (const TopoDS_Face & F);
		%feature("autodoc", "	* Removes all the triangulations of the faces of <S> and removes all polygons on triangulations of the edges.

	:param S:
	:type S: TopoDS_Shape &
	:rtype: void
") Clean;
		static void Clean (const TopoDS_Shape & S);
		%feature("autodoc", "	* Removes all the pcurves of the edges of <S> that refer to surfaces not belonging to any face of <S>

	:param S:
	:type S: TopoDS_Shape &
	:rtype: void
") RemoveUnusedPCurves;
		static void RemoveUnusedPCurves (const TopoDS_Shape & S);
		%feature("autodoc", "	* verifies that each face from the shape <S> has got a triangulation with a deflection <= deflec and the edges a discretisation on this triangulation.

	:param S:
	:type S: TopoDS_Shape &
	:param deflec:
	:type deflec: float
	:rtype: bool
") Triangulation;
		static Standard_Boolean Triangulation (const TopoDS_Shape & S,const Standard_Real deflec);
		%feature("autodoc", "	* Returns True if the distance between the two vertices is lower than their tolerance.

	:param V1:
	:type V1: TopoDS_Vertex &
	:param V2:
	:type V2: TopoDS_Vertex &
	:rtype: bool
") Compare;
		static Standard_Boolean Compare (const TopoDS_Vertex & V1,const TopoDS_Vertex & V2);
		%feature("autodoc", "	* Returns True if the distance between the two edges is lower than their tolerance.

	:param E1:
	:type E1: TopoDS_Edge &
	:param E2:
	:type E2: TopoDS_Edge &
	:rtype: bool
") Compare;
		static Standard_Boolean Compare (const TopoDS_Edge & E1,const TopoDS_Edge & E2);
		%feature("autodoc", "	* Returns the outer most wire of <F>. Returns a Null wire if <F> has no wires.

	:param F:
	:type F: TopoDS_Face &
	:rtype: TopoDS_Wire
") OuterWire;
		static TopoDS_Wire OuterWire (const TopoDS_Face & F);
		%feature("autodoc", "	* Stores in the map <M> all the 3D topology edges of <S>.

	:param S:
	:type S: TopoDS_Shape &
	:param M:
	:type M: TopTools_IndexedMapOfShape &
	:rtype: void
") Map3DEdges;
		static void Map3DEdges (const TopoDS_Shape & S,TopTools_IndexedMapOfShape & M);
		%feature("autodoc", "	* Verifies that the edge <E> is found two times on the face <F> before calling BRep_Tool::IsClosed.

	:param E:
	:type E: TopoDS_Edge &
	:param F:
	:type F: TopoDS_Face &
	:rtype: bool
") IsReallyClosed;
		static Standard_Boolean IsReallyClosed (const TopoDS_Edge & E,const TopoDS_Face & F);
		%feature("autodoc", "	* Dumps the topological structure and the geometry of <Sh> on the stream <S>.

	:param Sh:
	:type Sh: TopoDS_Shape &
	:param S:
	:type S: Standard_OStream &
	:rtype: void
") Dump;
		static void Dump (const TopoDS_Shape & Sh,Standard_OStream & S);
		%feature("autodoc", "	* Writes <Sh> on <S> in an ASCII format.

	:param Sh:
	:type Sh: TopoDS_Shape &
	:param S:
	:type S: Standard_OStream &
	:param PR: default value is NULL
	:type PR: Handle_Message_ProgressIndicator &
	:rtype: void
") Write;
		static void Write (const TopoDS_Shape & Sh,Standard_OStream & S,const Handle_Message_ProgressIndicator & PR = NULL);
		%feature("autodoc", "	* Reads a Shape from <S> in returns it in <Sh>. <B> is used to build the shape.

	:param Sh:
	:type Sh: TopoDS_Shape &
	:param S:
	:type S: Standard_IStream &
	:param B:
	:type B: BRep_Builder &
	:param PR: default value is NULL
	:type PR: Handle_Message_ProgressIndicator &
	:rtype: void
") Read;
		static void Read (TopoDS_Shape & Sh,Standard_IStream & S,const BRep_Builder & B,const Handle_Message_ProgressIndicator & PR = NULL);
		%feature("autodoc", "	* Writes <Sh> in <File>.

	:param Sh:
	:type Sh: TopoDS_Shape &
	:param File:
	:type File: char *
	:param PR: default value is NULL
	:type PR: Handle_Message_ProgressIndicator &
	:rtype: bool
") Write;
		static Standard_Boolean Write (const TopoDS_Shape & Sh,const char * File,const Handle_Message_ProgressIndicator & PR = NULL);
		%feature("autodoc", "	* Reads a Shape from <File>, returns it in <Sh>. <B> is used to build the shape.

	:param Sh:
	:type Sh: TopoDS_Shape &
	:param File:
	:type File: char *
	:param B:
	:type B: BRep_Builder &
	:param PR: default value is NULL
	:type PR: Handle_Message_ProgressIndicator &
	:rtype: bool
") Read;
		static Standard_Boolean Read (TopoDS_Shape & Sh,const char * File,const BRep_Builder & B,const Handle_Message_ProgressIndicator & PR = NULL);
};


%feature("shadow") BRepTools::~BRepTools %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepTools {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepTools_DataMapIteratorOfMapOfVertexPnt2d;
class BRepTools_DataMapIteratorOfMapOfVertexPnt2d : public TCollection_BasicMapIterator {
	public:
		%feature("autodoc", "	:rtype: None
") BRepTools_DataMapIteratorOfMapOfVertexPnt2d;
		 BRepTools_DataMapIteratorOfMapOfVertexPnt2d ();
		%feature("autodoc", "	:param aMap:
	:type aMap: BRepTools_MapOfVertexPnt2d &
	:rtype: None
") BRepTools_DataMapIteratorOfMapOfVertexPnt2d;
		 BRepTools_DataMapIteratorOfMapOfVertexPnt2d (const BRepTools_MapOfVertexPnt2d & aMap);
		%feature("autodoc", "	:param aMap:
	:type aMap: BRepTools_MapOfVertexPnt2d &
	:rtype: None
") Initialize;
		void Initialize (const BRepTools_MapOfVertexPnt2d & aMap);
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Key;
		const TopoDS_Shape & Key ();
		%feature("autodoc", "	:rtype: TColgp_SequenceOfPnt2d
") Value;
		const TColgp_SequenceOfPnt2d & Value ();
};


%feature("shadow") BRepTools_DataMapIteratorOfMapOfVertexPnt2d::~BRepTools_DataMapIteratorOfMapOfVertexPnt2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepTools_DataMapIteratorOfMapOfVertexPnt2d {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepTools_DataMapNodeOfMapOfVertexPnt2d;
class BRepTools_DataMapNodeOfMapOfVertexPnt2d : public TCollection_MapNode {
	public:
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:param I:
	:type I: TColgp_SequenceOfPnt2d
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") BRepTools_DataMapNodeOfMapOfVertexPnt2d;
		 BRepTools_DataMapNodeOfMapOfVertexPnt2d (const TopoDS_Shape & K,const TColgp_SequenceOfPnt2d & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Key;
		TopoDS_Shape & Key ();
		%feature("autodoc", "	:rtype: TColgp_SequenceOfPnt2d
") Value;
		TColgp_SequenceOfPnt2d & Value ();
};


%feature("shadow") BRepTools_DataMapNodeOfMapOfVertexPnt2d::~BRepTools_DataMapNodeOfMapOfVertexPnt2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepTools_DataMapNodeOfMapOfVertexPnt2d {
	void _kill_pointed() {
		delete $self;
	}
};
%extend BRepTools_DataMapNodeOfMapOfVertexPnt2d {
	Handle_BRepTools_DataMapNodeOfMapOfVertexPnt2d GetHandle() {
	return *(Handle_BRepTools_DataMapNodeOfMapOfVertexPnt2d*) &$self;
	}
};

%nodefaultctor Handle_BRepTools_DataMapNodeOfMapOfVertexPnt2d;
class Handle_BRepTools_DataMapNodeOfMapOfVertexPnt2d : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_BRepTools_DataMapNodeOfMapOfVertexPnt2d();
        Handle_BRepTools_DataMapNodeOfMapOfVertexPnt2d(const Handle_BRepTools_DataMapNodeOfMapOfVertexPnt2d &aHandle);
        Handle_BRepTools_DataMapNodeOfMapOfVertexPnt2d(const BRepTools_DataMapNodeOfMapOfVertexPnt2d *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BRepTools_DataMapNodeOfMapOfVertexPnt2d DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BRepTools_DataMapNodeOfMapOfVertexPnt2d {
    BRepTools_DataMapNodeOfMapOfVertexPnt2d* GetObject() {
    return (BRepTools_DataMapNodeOfMapOfVertexPnt2d*)$self->Access();
    }
};
%feature("shadow") Handle_BRepTools_DataMapNodeOfMapOfVertexPnt2d::~Handle_BRepTools_DataMapNodeOfMapOfVertexPnt2d %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_BRepTools_DataMapNodeOfMapOfVertexPnt2d {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor BRepTools_MapOfVertexPnt2d;
class BRepTools_MapOfVertexPnt2d : public TCollection_BasicMap {
	public:
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: Standard_Integer
	:rtype: None
") BRepTools_MapOfVertexPnt2d;
		 BRepTools_MapOfVertexPnt2d (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "	:param Other:
	:type Other: BRepTools_MapOfVertexPnt2d &
	:rtype: BRepTools_MapOfVertexPnt2d
") Assign;
		BRepTools_MapOfVertexPnt2d & Assign (const BRepTools_MapOfVertexPnt2d & Other);
		%feature("autodoc", "	:param Other:
	:type Other: BRepTools_MapOfVertexPnt2d &
	:rtype: BRepTools_MapOfVertexPnt2d
") operator=;
		BRepTools_MapOfVertexPnt2d & operator = (const BRepTools_MapOfVertexPnt2d & Other);
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: Standard_Integer
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:param I:
	:type I: TColgp_SequenceOfPnt2d
	:rtype: bool
") Bind;
		Standard_Boolean Bind (const TopoDS_Shape & K,const TColgp_SequenceOfPnt2d & I);
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: bool
") IsBound;
		Standard_Boolean IsBound (const TopoDS_Shape & K);
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: bool
") UnBind;
		Standard_Boolean UnBind (const TopoDS_Shape & K);
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: TColgp_SequenceOfPnt2d
") Find;
		const TColgp_SequenceOfPnt2d & Find (const TopoDS_Shape & K);
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: TColgp_SequenceOfPnt2d
") ChangeFind;
		TColgp_SequenceOfPnt2d & ChangeFind (const TopoDS_Shape & K);
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: Standard_Address
") Find1;
		Standard_Address Find1 (const TopoDS_Shape & K);
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: Standard_Address
") ChangeFind1;
		Standard_Address ChangeFind1 (const TopoDS_Shape & K);
};


%feature("shadow") BRepTools_MapOfVertexPnt2d::~BRepTools_MapOfVertexPnt2d %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepTools_MapOfVertexPnt2d {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepTools_Modification;
class BRepTools_Modification : public MMgt_TShared {
	public:
		%feature("autodoc", "	* Returns true if the face, F, has been modified. If the face has been modified: - S is the new geometry of the face, - L is its new location, and - Tol is the new tolerance. The flag, RevWires, is set to true when the modification reverses the normal of the surface, (i.e. the wires have to be reversed). The flag, RevFace, is set to true if the orientation of the modified face changes in the shells which contain it. If the face has not been modified this function returns false, and the values of S, L, Tol, RevWires and RevFace are not significant.

	:param F:
	:type F: TopoDS_Face &
	:param S:
	:type S: Handle_Geom_Surface &
	:param L:
	:type L: TopLoc_Location &
	:param Tol:
	:type Tol: float &
	:param RevWires:
	:type RevWires: bool
	:param RevFace:
	:type RevFace: bool
	:rtype: bool
") NewSurface;
		virtual Standard_Boolean NewSurface (const TopoDS_Face & F,Handle_Geom_Surface & S,TopLoc_Location & L,Standard_Real &OutValue,Standard_Boolean & RevWires,Standard_Boolean & RevFace);
		%feature("autodoc", "	* Returns true if the edge, E, has been modified. If the edge has been modified: - C is the new geometry associated with the edge, - L is its new location, and - Tol is the new tolerance. If the edge has not been modified, this function returns false, and the values of C, L and Tol are not significant.

	:param E:
	:type E: TopoDS_Edge &
	:param C:
	:type C: Handle_Geom_Curve &
	:param L:
	:type L: TopLoc_Location &
	:param Tol:
	:type Tol: float &
	:rtype: bool
") NewCurve;
		virtual Standard_Boolean NewCurve (const TopoDS_Edge & E,Handle_Geom_Curve & C,TopLoc_Location & L,Standard_Real &OutValue);
		%feature("autodoc", "	* Returns true if the vertex V has been modified. If V has been modified: - P is the new geometry of the vertex, and - Tol is the new tolerance. If the vertex has not been modified this function returns false, and the values of P and Tol are not significant.

	:param V:
	:type V: TopoDS_Vertex &
	:param P:
	:type P: gp_Pnt
	:param Tol:
	:type Tol: float &
	:rtype: bool
") NewPoint;
		virtual Standard_Boolean NewPoint (const TopoDS_Vertex & V,gp_Pnt & P,Standard_Real &OutValue);
		%feature("autodoc", "	* Returns true if the edge, E, has a new curve on surface on the face, F. If a new curve exists: - C is the new geometry of the edge, - L is the new location, and - Tol is the new tolerance. NewE is the new edge created from E, and NewF is the new face created from F. If there is no new curve on the face, this function returns false, and the values of C, L and Tol are not significant.

	:param E:
	:type E: TopoDS_Edge &
	:param F:
	:type F: TopoDS_Face &
	:param NewE:
	:type NewE: TopoDS_Edge &
	:param NewF:
	:type NewF: TopoDS_Face &
	:param C:
	:type C: Handle_Geom2d_Curve &
	:param Tol:
	:type Tol: float &
	:rtype: bool
") NewCurve2d;
		virtual Standard_Boolean NewCurve2d (const TopoDS_Edge & E,const TopoDS_Face & F,const TopoDS_Edge & NewE,const TopoDS_Face & NewF,Handle_Geom2d_Curve & C,Standard_Real &OutValue);
		%feature("autodoc", "	* Returns true if the vertex V has a new parameter on the edge E. If a new parameter exists: - P is the parameter, and - Tol is the new tolerance. If there is no new parameter this function returns false, and the values of P and Tol are not significant.

	:param V:
	:type V: TopoDS_Vertex &
	:param E:
	:type E: TopoDS_Edge &
	:param P:
	:type P: float &
	:param Tol:
	:type Tol: float &
	:rtype: bool
") NewParameter;
		virtual Standard_Boolean NewParameter (const TopoDS_Vertex & V,const TopoDS_Edge & E,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "	* Returns the continuity of <NewE> between <NewF1> and <NewF2>. <NewE> is the new edge created from <E>. <NewF1> (resp. <NewF2>) is the new face created from <F1> (resp. <F2>).

	:param E:
	:type E: TopoDS_Edge &
	:param F1:
	:type F1: TopoDS_Face &
	:param F2:
	:type F2: TopoDS_Face &
	:param NewE:
	:type NewE: TopoDS_Edge &
	:param NewF1:
	:type NewF1: TopoDS_Face &
	:param NewF2:
	:type NewF2: TopoDS_Face &
	:rtype: GeomAbs_Shape
") Continuity;
		virtual GeomAbs_Shape Continuity (const TopoDS_Edge & E,const TopoDS_Face & F1,const TopoDS_Face & F2,const TopoDS_Edge & NewE,const TopoDS_Face & NewF1,const TopoDS_Face & NewF2);
};


%feature("shadow") BRepTools_Modification::~BRepTools_Modification %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepTools_Modification {
	void _kill_pointed() {
		delete $self;
	}
};
%extend BRepTools_Modification {
	Handle_BRepTools_Modification GetHandle() {
	return *(Handle_BRepTools_Modification*) &$self;
	}
};

%nodefaultctor Handle_BRepTools_Modification;
class Handle_BRepTools_Modification : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_BRepTools_Modification();
        Handle_BRepTools_Modification(const Handle_BRepTools_Modification &aHandle);
        Handle_BRepTools_Modification(const BRepTools_Modification *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BRepTools_Modification DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BRepTools_Modification {
    BRepTools_Modification* GetObject() {
    return (BRepTools_Modification*)$self->Access();
    }
};
%feature("shadow") Handle_BRepTools_Modification::~Handle_BRepTools_Modification %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_BRepTools_Modification {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor BRepTools_Modifier;
class BRepTools_Modifier {
	public:
		%feature("autodoc", "	* Creates an empty Modifier.

	:rtype: None
") BRepTools_Modifier;
		 BRepTools_Modifier ();
		%feature("autodoc", "	* Creates a modifier on the shape <S>.

	:param S:
	:type S: TopoDS_Shape &
	:rtype: None
") BRepTools_Modifier;
		 BRepTools_Modifier (const TopoDS_Shape & S);
		%feature("autodoc", "	* Creates a modifier on the shape <S>, and performs the modifications described by <M>.

	:param S:
	:type S: TopoDS_Shape &
	:param M:
	:type M: Handle_BRepTools_Modification &
	:rtype: None
") BRepTools_Modifier;
		 BRepTools_Modifier (const TopoDS_Shape & S,const Handle_BRepTools_Modification & M);
		%feature("autodoc", "	* Initializes the modifier with the shape <S>.

	:param S:
	:type S: TopoDS_Shape &
	:rtype: None
") Init;
		void Init (const TopoDS_Shape & S);
		%feature("autodoc", "	* Performs the modifications described by <M>.

	:param M:
	:type M: Handle_BRepTools_Modification &
	:rtype: None
") Perform;
		void Perform (const Handle_BRepTools_Modification & M);
		%feature("autodoc", "	* Returns Standard_True if the modification has been computed successfully.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "	* Returns the modified shape corresponding to <S>.

	:param S:
	:type S: TopoDS_Shape &
	:rtype: TopoDS_Shape
") ModifiedShape;
		const TopoDS_Shape & ModifiedShape (const TopoDS_Shape & S);
};


%feature("shadow") BRepTools_Modifier::~BRepTools_Modifier %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepTools_Modifier {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepTools_Quilt;
class BRepTools_Quilt {
	public:
		%feature("autodoc", "	:rtype: None
") BRepTools_Quilt;
		 BRepTools_Quilt ();
		%feature("autodoc", "	* Binds <Enew> to be the new edge instead of <Eold>.  The faces of the added shape containing <Eold> will be copied to substitute <Eold> by <Enew>.  The vertices of <Eold> will be bound to the vertices of <Enew> with the same orientation.  If <Eold> and <Enew> have different orientations the curves are considered to be opposite and the pcurves of <Eold> will be copied and reversed in the new faces.  <Eold> must belong to the next added shape, <Enew> must belong to a Shape added before.

	:param Eold:
	:type Eold: TopoDS_Edge &
	:param Enew:
	:type Enew: TopoDS_Edge &
	:rtype: None
") Bind;
		void Bind (const TopoDS_Edge & Eold,const TopoDS_Edge & Enew);
		%feature("autodoc", "	* Binds <VNew> to be a new vertex instead of <Vold>.  The faces of the added shape containing <Vold> will be copied to substitute <Vold> by <Vnew>.

	:param Vold:
	:type Vold: TopoDS_Vertex &
	:param Vnew:
	:type Vnew: TopoDS_Vertex &
	:rtype: None
") Bind;
		void Bind (const TopoDS_Vertex & Vold,const TopoDS_Vertex & Vnew);
		%feature("autodoc", "	* Add the faces of <S> to the Quilt, the faces containing bounded edges are copied.

	:param S:
	:type S: TopoDS_Shape &
	:rtype: None
") Add;
		void Add (const TopoDS_Shape & S);
		%feature("autodoc", "	* Returns True if <S> has been copied (<S> is a vertex, an edge or a face)

	:param S:
	:type S: TopoDS_Shape &
	:rtype: bool
") IsCopied;
		Standard_Boolean IsCopied (const TopoDS_Shape & S);
		%feature("autodoc", "	* Returns the shape substitued to <S> in the Quilt.

	:param S:
	:type S: TopoDS_Shape &
	:rtype: TopoDS_Shape
") Copy;
		const TopoDS_Shape & Copy (const TopoDS_Shape & S);
		%feature("autodoc", "	* Returns a Compound of shells made from the current set of faces. The shells will be flagged as closed or not closed.

	:rtype: TopoDS_Shape
") Shells;
		TopoDS_Shape Shells ();
};


%feature("shadow") BRepTools_Quilt::~BRepTools_Quilt %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepTools_Quilt {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepTools_ReShape;
class BRepTools_ReShape : public MMgt_TShared {
	public:
		%feature("autodoc", "	* Returns an empty Reshape

	:rtype: None
") BRepTools_ReShape;
		 BRepTools_ReShape ();
		%feature("autodoc", "	* Clears all substitutions requests

	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	* Sets a request to Remove a Shape If <oriented> is True, only for a shape with the SAME orientation. Else, whatever the orientation

	:param shape:
	:type shape: TopoDS_Shape &
	:param oriented: default value is Standard_False
	:type oriented: bool
	:rtype: None
") Remove;
		void Remove (const TopoDS_Shape & shape,const Standard_Boolean oriented = Standard_False);
		%feature("autodoc", "	* Sets a request to Replace a Shape by a new one If <oriented> is True, only if the orientation is the same Else, whatever the orientation, and the new shape takes the same orientation as <newshape> if the replaced one has the same as <shape>, else it is reversed

	:param shape:
	:type shape: TopoDS_Shape &
	:param newshape:
	:type newshape: TopoDS_Shape &
	:param oriented: default value is Standard_False
	:type oriented: bool
	:rtype: None
") Replace;
		void Replace (const TopoDS_Shape & shape,const TopoDS_Shape & newshape,const Standard_Boolean oriented = Standard_False);
		%feature("autodoc", "	* Tells if a shape is recorded for Replace/Remove

	:param shape:
	:type shape: TopoDS_Shape &
	:rtype: bool
") IsRecorded;
		Standard_Boolean IsRecorded (const TopoDS_Shape & shape);
		%feature("autodoc", "	* Returns the new value for an individual shape If not recorded, returns the original shape itself If to be Removed, returns a Null Shape Else, returns the replacing item

	:param shape:
	:type shape: TopoDS_Shape &
	:rtype: TopoDS_Shape
") Value;
		TopoDS_Shape Value (const TopoDS_Shape & shape);
		%feature("autodoc", "	* Returns a complete substitution status for a shape 0 : not recorded, <newsh> = original <shape> < 0: to be removed, <newsh> is NULL > 0: to be replaced, <newsh> is a new item If <last> is False, returns status and new shape recorded in the map directly for the shape, if True and status > 0 then recursively searches for the last status and new shape.

	:param shape:
	:type shape: TopoDS_Shape &
	:param newsh:
	:type newsh: TopoDS_Shape &
	:param last: default value is Standard_False
	:type last: bool
	:rtype: int
") Status;
		virtual Standard_Integer Status (const TopoDS_Shape & shape,TopoDS_Shape & newsh,const Standard_Boolean last = Standard_False);
		%feature("autodoc", "	* Applies the substitutions requests to a shape  <until> gives the level of type until which requests are taken into account. For subshapes of the type <until> no rebuild and futher exploring are done. ACTUALLY, NOT IMPLEMENTED BELOW TopAbs_FACE  <buildmode> says how to do on a SOLID,SHELL ... if one of its sub-shapes has been changed: 0: at least one Replace or Remove -> COMPOUND, else as such 1: at least one Remove (Replace are ignored) -> COMPOUND 2: Replace and Remove are both ignored If Replace/Remove are ignored or absent, the result as same type as the starting shape

	:param shape:
	:type shape: TopoDS_Shape &
	:param until:
	:type until: TopAbs_ShapeEnum
	:param buildmode:
	:type buildmode: Standard_Integer
	:rtype: TopoDS_Shape
") Apply;
		virtual TopoDS_Shape Apply (const TopoDS_Shape & shape,const TopAbs_ShapeEnum until,const Standard_Integer buildmode);
		%feature("autodoc", "	* Applies the substitutions requests to a shape.  <until> gives the level of type until which requests are taken into account. For subshapes of the type <until> no rebuild and futher exploring are done.  NOTE: each subshape can be replaced by shape of the same type or by shape containing only shapes of that type (for example, TopoDS_Edge can be replaced by TopoDS_Edge, TopoDS_Wire or TopoDS_Compound containing TopoDS_Edges). If incompatible shape type is encountered, it is ignored and flag FAIL1 is set in Status.

	:param shape:
	:type shape: TopoDS_Shape &
	:param until: default value is TopAbs_SHAPE
	:type until: TopAbs_ShapeEnum
	:rtype: TopoDS_Shape
") Apply;
		virtual TopoDS_Shape Apply (const TopoDS_Shape & shape,const TopAbs_ShapeEnum until = TopAbs_SHAPE);

            %feature("autodoc","1");
            %extend {
                Standard_Boolean GetModeConsiderLocation() {
                return (Standard_Boolean) $self->ModeConsiderLocation();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetModeConsiderLocation(Standard_Boolean value ) {
                $self->ModeConsiderLocation()=value;
                }
            };
            
            %feature("autodoc","1");
            %extend {
                Standard_Boolean GetModeConsiderOrientation() {
                return (Standard_Boolean) $self->ModeConsiderOrientation();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetModeConsiderOrientation(Standard_Boolean value ) {
                $self->ModeConsiderOrientation()=value;
                }
            };
            };


%feature("shadow") BRepTools_ReShape::~BRepTools_ReShape %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepTools_ReShape {
	void _kill_pointed() {
		delete $self;
	}
};
%extend BRepTools_ReShape {
	Handle_BRepTools_ReShape GetHandle() {
	return *(Handle_BRepTools_ReShape*) &$self;
	}
};

%nodefaultctor Handle_BRepTools_ReShape;
class Handle_BRepTools_ReShape : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_BRepTools_ReShape();
        Handle_BRepTools_ReShape(const Handle_BRepTools_ReShape &aHandle);
        Handle_BRepTools_ReShape(const BRepTools_ReShape *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BRepTools_ReShape DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BRepTools_ReShape {
    BRepTools_ReShape* GetObject() {
    return (BRepTools_ReShape*)$self->Access();
    }
};
%feature("shadow") Handle_BRepTools_ReShape::~Handle_BRepTools_ReShape %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_BRepTools_ReShape {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor BRepTools_ShapeSet;
class BRepTools_ShapeSet : public TopTools_ShapeSet {
	public:
		%feature("autodoc", "	* Builds an empty ShapeSet. Parameter <isWithTriangles> is added for XML Persistence

	:param isWithTriangles: default value is Standard_True
	:type isWithTriangles: bool
	:rtype: None
") BRepTools_ShapeSet;
		 BRepTools_ShapeSet (const Standard_Boolean isWithTriangles = Standard_True);
		%feature("autodoc", "	* Builds an empty ShapeSet. Parameter <isWithTriangles> is added for XML Persistence

	:param B:
	:type B: BRep_Builder &
	:param isWithTriangles: default value is Standard_True
	:type isWithTriangles: bool
	:rtype: None
") BRepTools_ShapeSet;
		 BRepTools_ShapeSet (const BRep_Builder & B,const Standard_Boolean isWithTriangles = Standard_True);
		%feature("autodoc", "	* Clears the content of the set.

	:rtype: void
") Clear;
		virtual void Clear ();
		%feature("autodoc", "	* Stores the goemetry of <S>.

	:param S:
	:type S: TopoDS_Shape &
	:rtype: void
") AddGeometry;
		virtual void AddGeometry (const TopoDS_Shape & S);

        %feature("autodoc", "1");
        %extend{
            std::string DumpGeometryToString() {
            std::stringstream s;
            self->DumpGeometry(s);
            return s.str();}
        };
        
        %feature("autodoc", "1");
        %extend{
            std::string WriteGeometryToString() {
            std::stringstream s;
            self->WriteGeometry(s);
            return s.str();}
        };
        
        %feature("autodoc", "1");
        %extend{
            void ReadGeometryFromString(std::string src) {
            std::stringstream s(src);
            self->ReadGeometry(s);}
        };
        		%feature("autodoc", "	* Dumps the geometry of <S> on the stream <OS>.

	:param S:
	:type S: TopoDS_Shape &
	:param OS:
	:type OS: Standard_OStream &
	:rtype: void
") DumpGeometry;
		virtual void DumpGeometry (const TopoDS_Shape & S,Standard_OStream & OS);
		%feature("autodoc", "	* Writes the geometry of <S> on the stream <OS> in a format that can be read back by Read.

	:param S:
	:type S: TopoDS_Shape &
	:param OS:
	:type OS: Standard_OStream &
	:rtype: void
") WriteGeometry;
		virtual void WriteGeometry (const TopoDS_Shape & S,Standard_OStream & OS);
		%feature("autodoc", "	* Reads the geometry of a shape of type <T> from the stream <IS> and returns it in <S>.

	:param T:
	:type T: TopAbs_ShapeEnum
	:param IS:
	:type IS: Standard_IStream &
	:param S:
	:type S: TopoDS_Shape &
	:rtype: void
") ReadGeometry;
		virtual void ReadGeometry (const TopAbs_ShapeEnum T,Standard_IStream & IS,TopoDS_Shape & S);
		%feature("autodoc", "	* Inserts the shape <S2> in the shape <S1>. This method must be redefined to use the correct builder.

	:param S1:
	:type S1: TopoDS_Shape &
	:param S2:
	:type S2: TopoDS_Shape &
	:rtype: void
") AddShapes;
		virtual void AddShapes (TopoDS_Shape & S1,const TopoDS_Shape & S2);
		%feature("autodoc", "	:param T:
	:type T: TopAbs_ShapeEnum
	:param S:
	:type S: TopoDS_Shape &
	:rtype: void
") Check;
		virtual void Check (const TopAbs_ShapeEnum T,TopoDS_Shape & S);

        %feature("autodoc", "1");
        %extend{
            void ReadPolygon3DFromString(std::string src) {
            std::stringstream s(src);
            self->ReadPolygon3D(s);}
        };
        		%feature("autodoc", "	* Writes the 3d polygons on the stream <OS> in a format that can be read back by Read.

	:param OS:
	:type OS: Standard_OStream &
	:param Compact: default value is Standard_True
	:type Compact: bool
	:rtype: None
") WritePolygon3D;
		void WritePolygon3D (Standard_OStream & OS,const Standard_Boolean Compact = Standard_True);

        %feature("autodoc", "1");
        %extend{
            std::string DumpPolygon3DToString() {
            std::stringstream s;
            self->DumpPolygon3D(s);
            return s.str();}
        };
        
        %feature("autodoc", "1");
        %extend{
            void ReadTriangulationFromString(std::string src) {
            std::stringstream s(src);
            self->ReadTriangulation(s);}
        };
        		%feature("autodoc", "	* Writes the triangulation on the stream <OS> in a format that can be read back by Read.

	:param OS:
	:type OS: Standard_OStream &
	:param Compact: default value is Standard_True
	:type Compact: bool
	:rtype: None
") WriteTriangulation;
		void WriteTriangulation (Standard_OStream & OS,const Standard_Boolean Compact = Standard_True);

        %feature("autodoc", "1");
        %extend{
            std::string DumpTriangulationToString() {
            std::stringstream s;
            self->DumpTriangulation(s);
            return s.str();}
        };
        
        %feature("autodoc", "1");
        %extend{
            void ReadPolygonOnTriangulationFromString(std::string src) {
            std::stringstream s(src);
            self->ReadPolygonOnTriangulation(s);}
        };
        		%feature("autodoc", "	* Writes the polygons on triangulation on the stream <OS> in a format that can be read back by Read.

	:param OS:
	:type OS: Standard_OStream &
	:param Compact: default value is Standard_True
	:type Compact: bool
	:rtype: None
") WritePolygonOnTriangulation;
		void WritePolygonOnTriangulation (Standard_OStream & OS,const Standard_Boolean Compact = Standard_True);

        %feature("autodoc", "1");
        %extend{
            std::string DumpPolygonOnTriangulationToString() {
            std::stringstream s;
            self->DumpPolygonOnTriangulation(s);
            return s.str();}
        };
        };


%feature("shadow") BRepTools_ShapeSet::~BRepTools_ShapeSet %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepTools_ShapeSet {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepTools_Substitution;
class BRepTools_Substitution {
	public:
		%feature("autodoc", "	:rtype: None
") BRepTools_Substitution;
		 BRepTools_Substitution ();
		%feature("autodoc", "	* Reset all the fields.

	:rtype: None
") Clear;
		void Clear ();
		%feature("autodoc", "	* <Oldshape> will be replaced by <NewShapes>.  <NewShapes> can be empty , in this case <OldShape> will disparate from its ancestors.  if an item of <NewShapes> is oriented FORWARD. it will be oriented as <OldShape> in its ancestors. else it will be reversed.

	:param OldShape:
	:type OldShape: TopoDS_Shape &
	:param NewShapes:
	:type NewShapes: TopTools_ListOfShape &
	:rtype: None
") Substitute;
		void Substitute (const TopoDS_Shape & OldShape,const TopTools_ListOfShape & NewShapes);
		%feature("autodoc", "	* Build NewShape from <S> if its subshapes has modified.  The methods <IsCopied> and <Copy> allows you to keep the resul of <Build>

	:param S:
	:type S: TopoDS_Shape &
	:rtype: None
") Build;
		void Build (const TopoDS_Shape & S);
		%feature("autodoc", "	* Returns True if <S> has been replaced .

	:param S:
	:type S: TopoDS_Shape &
	:rtype: bool
") IsCopied;
		Standard_Boolean IsCopied (const TopoDS_Shape & S);
		%feature("autodoc", "	* Returns the set of shapes substitued to <S> .

	:param S:
	:type S: TopoDS_Shape &
	:rtype: TopTools_ListOfShape
") Copy;
		const TopTools_ListOfShape & Copy (const TopoDS_Shape & S);
};


%feature("shadow") BRepTools_Substitution::~BRepTools_Substitution %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepTools_Substitution {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepTools_WireExplorer;
class BRepTools_WireExplorer {
	public:
		%feature("autodoc", "	* Constructs an empty explorer (which can be initialized using Init)

	:rtype: None
") BRepTools_WireExplorer;
		 BRepTools_WireExplorer ();
		%feature("autodoc", "	* IInitializes an exploration of the wire <W>.

	:param W:
	:type W: TopoDS_Wire &
	:rtype: None
") BRepTools_WireExplorer;
		 BRepTools_WireExplorer (const TopoDS_Wire & W);
		%feature("autodoc", "	* Initializes an exploration of the wire <W>. F is used to select the edge connected to the previous in the parametric representation of <F>.

	:param W:
	:type W: TopoDS_Wire &
	:param F:
	:type F: TopoDS_Face &
	:rtype: None
") BRepTools_WireExplorer;
		 BRepTools_WireExplorer (const TopoDS_Wire & W,const TopoDS_Face & F);
		%feature("autodoc", "	* Initializes an exploration of the wire <W>.

	:param W:
	:type W: TopoDS_Wire &
	:rtype: None
") Init;
		void Init (const TopoDS_Wire & W);
		%feature("autodoc", "	* Initializes an exploration of the wire <W>. F is used to select the edge connected to the previous in the parametric representation of <F>.

	:param W:
	:type W: TopoDS_Wire &
	:param F:
	:type F: TopoDS_Face &
	:rtype: None
") Init;
		void Init (const TopoDS_Wire & W,const TopoDS_Face & F);
		%feature("autodoc", "	* Returns True if there is a current edge.

	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("autodoc", "	* Proceeds to the next edge.

	:rtype: None
") Next;
		void Next ();
		%feature("autodoc", "	* Returns the current edge.

	:rtype: TopoDS_Edge
") Current;
		const TopoDS_Edge & Current ();
		%feature("autodoc", "	* Returns an Orientation for the current edge.

	:rtype: TopAbs_Orientation
") Orientation;
		TopAbs_Orientation Orientation ();
		%feature("autodoc", "	* Returns the vertex connecting the current edge to the previous one.

	:rtype: TopoDS_Vertex
") CurrentVertex;
		const TopoDS_Vertex & CurrentVertex ();
		%feature("autodoc", "	* Clears the content of the explorer.

	:rtype: None
") Clear;
		void Clear ();
};


%feature("shadow") BRepTools_WireExplorer::~BRepTools_WireExplorer %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepTools_WireExplorer {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepTools_GTrsfModification;
class BRepTools_GTrsfModification : public BRepTools_Modification {
	public:
		%feature("autodoc", "	:param T:
	:type T: gp_GTrsf
	:rtype: None
") BRepTools_GTrsfModification;
		 BRepTools_GTrsfModification (const gp_GTrsf & T);
		%feature("autodoc", "	* Gives an access on the GTrsf.

	:rtype: gp_GTrsf
") GTrsf;
		gp_GTrsf & GTrsf ();
		%feature("autodoc", "	* Returns Standard_True if the face <F> has been modified. In this case, <S> is the new geometric support of the face, <L> the new location,<Tol> the new tolerance.<RevWires> has to be set to Standard_True when the modification reverses the normal of the surface.(the wires have to be reversed). <RevFace> has to be set to Standard_True if the orientation of the modified face changes in the shells which contain it. -- Here, <RevFace> will return Standard_True if the -- gp_Trsf is negative.

	:param F:
	:type F: TopoDS_Face &
	:param S:
	:type S: Handle_Geom_Surface &
	:param L:
	:type L: TopLoc_Location &
	:param Tol:
	:type Tol: float &
	:param RevWires:
	:type RevWires: bool
	:param RevFace:
	:type RevFace: bool
	:rtype: bool
") NewSurface;
		Standard_Boolean NewSurface (const TopoDS_Face & F,Handle_Geom_Surface & S,TopLoc_Location & L,Standard_Real &OutValue,Standard_Boolean & RevWires,Standard_Boolean & RevFace);
		%feature("autodoc", "	* Returns Standard_True if the edge <E> has been modified. In this case, <C> is the new geometric support of the edge, <L> the new location, <Tol> the new tolerance. Otherwise, returns Standard_False, and <C>, <L>, <Tol> are not significant.

	:param E:
	:type E: TopoDS_Edge &
	:param C:
	:type C: Handle_Geom_Curve &
	:param L:
	:type L: TopLoc_Location &
	:param Tol:
	:type Tol: float &
	:rtype: bool
") NewCurve;
		Standard_Boolean NewCurve (const TopoDS_Edge & E,Handle_Geom_Curve & C,TopLoc_Location & L,Standard_Real &OutValue);
		%feature("autodoc", "	* Returns Standard_True if the vertex <V> has been modified. In this case, <P> is the new geometric support of the vertex, <Tol> the new tolerance. Otherwise, returns Standard_False, and <P>, <Tol> are not significant.

	:param V:
	:type V: TopoDS_Vertex &
	:param P:
	:type P: gp_Pnt
	:param Tol:
	:type Tol: float &
	:rtype: bool
") NewPoint;
		Standard_Boolean NewPoint (const TopoDS_Vertex & V,gp_Pnt & P,Standard_Real &OutValue);
		%feature("autodoc", "	* Returns Standard_True if the edge <E> has a new curve on surface on the face <F>.In this case, <C> is the new geometric support of the edge, <L> the new location, <Tol> the new tolerance. Otherwise, returns Standard_False, and <C>, <L>, <Tol> are not significant.

	:param E:
	:type E: TopoDS_Edge &
	:param F:
	:type F: TopoDS_Face &
	:param NewE:
	:type NewE: TopoDS_Edge &
	:param NewF:
	:type NewF: TopoDS_Face &
	:param C:
	:type C: Handle_Geom2d_Curve &
	:param Tol:
	:type Tol: float &
	:rtype: bool
") NewCurve2d;
		Standard_Boolean NewCurve2d (const TopoDS_Edge & E,const TopoDS_Face & F,const TopoDS_Edge & NewE,const TopoDS_Face & NewF,Handle_Geom2d_Curve & C,Standard_Real &OutValue);
		%feature("autodoc", "	* Returns Standard_True if the Vertex <V> has a new parameter on the edge <E>. In this case, <P> is the parameter, <Tol> the new tolerance. Otherwise, returns Standard_False, and <P>, <Tol> are not significant.

	:param V:
	:type V: TopoDS_Vertex &
	:param E:
	:type E: TopoDS_Edge &
	:param P:
	:type P: float &
	:param Tol:
	:type Tol: float &
	:rtype: bool
") NewParameter;
		Standard_Boolean NewParameter (const TopoDS_Vertex & V,const TopoDS_Edge & E,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "	* Returns the continuity of <NewE> between <NewF1> and <NewF2>.  <NewE> is the new edge created from <E>. <NewF1> (resp. <NewF2>) is the new face created from <F1> (resp. <F2>).

	:param E:
	:type E: TopoDS_Edge &
	:param F1:
	:type F1: TopoDS_Face &
	:param F2:
	:type F2: TopoDS_Face &
	:param NewE:
	:type NewE: TopoDS_Edge &
	:param NewF1:
	:type NewF1: TopoDS_Face &
	:param NewF2:
	:type NewF2: TopoDS_Face &
	:rtype: GeomAbs_Shape
") Continuity;
		GeomAbs_Shape Continuity (const TopoDS_Edge & E,const TopoDS_Face & F1,const TopoDS_Face & F2,const TopoDS_Edge & NewE,const TopoDS_Face & NewF1,const TopoDS_Face & NewF2);
};


%feature("shadow") BRepTools_GTrsfModification::~BRepTools_GTrsfModification %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepTools_GTrsfModification {
	void _kill_pointed() {
		delete $self;
	}
};
%extend BRepTools_GTrsfModification {
	Handle_BRepTools_GTrsfModification GetHandle() {
	return *(Handle_BRepTools_GTrsfModification*) &$self;
	}
};

%nodefaultctor Handle_BRepTools_GTrsfModification;
class Handle_BRepTools_GTrsfModification : public Handle_BRepTools_Modification {

    public:
        // constructors
        Handle_BRepTools_GTrsfModification();
        Handle_BRepTools_GTrsfModification(const Handle_BRepTools_GTrsfModification &aHandle);
        Handle_BRepTools_GTrsfModification(const BRepTools_GTrsfModification *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BRepTools_GTrsfModification DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BRepTools_GTrsfModification {
    BRepTools_GTrsfModification* GetObject() {
    return (BRepTools_GTrsfModification*)$self->Access();
    }
};
%feature("shadow") Handle_BRepTools_GTrsfModification::~Handle_BRepTools_GTrsfModification %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_BRepTools_GTrsfModification {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor BRepTools_NurbsConvertModification;
class BRepTools_NurbsConvertModification : public BRepTools_Modification {
	public:
		%feature("autodoc", "	:rtype: None
") BRepTools_NurbsConvertModification;
		 BRepTools_NurbsConvertModification ();
		%feature("autodoc", "	* Returns Standard_True if the face <F> has been modified. In this case, <S> is the new geometric support of the face, <L> the new location,<Tol> the new tolerance.<RevWires> has to be set to Standard_True when the modification reverses the normal of the surface.(the wires have to be reversed). <RevFace> has to be set to Standard_True if the orientation of the modified face changes in the shells which contain it. -- Here, <RevFace> will return Standard_True if the -- gp_Trsf is negative.

	:param F:
	:type F: TopoDS_Face &
	:param S:
	:type S: Handle_Geom_Surface &
	:param L:
	:type L: TopLoc_Location &
	:param Tol:
	:type Tol: float &
	:param RevWires:
	:type RevWires: bool
	:param RevFace:
	:type RevFace: bool
	:rtype: bool
") NewSurface;
		Standard_Boolean NewSurface (const TopoDS_Face & F,Handle_Geom_Surface & S,TopLoc_Location & L,Standard_Real &OutValue,Standard_Boolean & RevWires,Standard_Boolean & RevFace);
		%feature("autodoc", "	* Returns Standard_True if the edge <E> has been modified. In this case, <C> is the new geometric support of the edge, <L> the new location, <Tol> the new tolerance. Otherwise, returns Standard_False, and <C>, <L>, <Tol> are not significant.

	:param E:
	:type E: TopoDS_Edge &
	:param C:
	:type C: Handle_Geom_Curve &
	:param L:
	:type L: TopLoc_Location &
	:param Tol:
	:type Tol: float &
	:rtype: bool
") NewCurve;
		Standard_Boolean NewCurve (const TopoDS_Edge & E,Handle_Geom_Curve & C,TopLoc_Location & L,Standard_Real &OutValue);
		%feature("autodoc", "	* Returns Standard_True if the vertex <V> has been modified. In this case, <P> is the new geometric support of the vertex, <Tol> the new tolerance. Otherwise, returns Standard_False, and <P>, <Tol> are not significant.

	:param V:
	:type V: TopoDS_Vertex &
	:param P:
	:type P: gp_Pnt
	:param Tol:
	:type Tol: float &
	:rtype: bool
") NewPoint;
		Standard_Boolean NewPoint (const TopoDS_Vertex & V,gp_Pnt & P,Standard_Real &OutValue);
		%feature("autodoc", "	* Returns Standard_True if the edge <E> has a new curve on surface on the face <F>.In this case, <C> is the new geometric support of the edge, <L> the new location, <Tol> the new tolerance. Otherwise, returns Standard_False, and <C>, <L>, <Tol> are not significant.

	:param E:
	:type E: TopoDS_Edge &
	:param F:
	:type F: TopoDS_Face &
	:param NewE:
	:type NewE: TopoDS_Edge &
	:param NewF:
	:type NewF: TopoDS_Face &
	:param C:
	:type C: Handle_Geom2d_Curve &
	:param Tol:
	:type Tol: float &
	:rtype: bool
") NewCurve2d;
		Standard_Boolean NewCurve2d (const TopoDS_Edge & E,const TopoDS_Face & F,const TopoDS_Edge & NewE,const TopoDS_Face & NewF,Handle_Geom2d_Curve & C,Standard_Real &OutValue);
		%feature("autodoc", "	* Returns Standard_True if the Vertex <V> has a new parameter on the edge <E>. In this case, <P> is the parameter, <Tol> the new tolerance. Otherwise, returns Standard_False, and <P>, <Tol> are not significant.

	:param V:
	:type V: TopoDS_Vertex &
	:param E:
	:type E: TopoDS_Edge &
	:param P:
	:type P: float &
	:param Tol:
	:type Tol: float &
	:rtype: bool
") NewParameter;
		Standard_Boolean NewParameter (const TopoDS_Vertex & V,const TopoDS_Edge & E,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "	* Returns the continuity of <NewE> between <NewF1> and <NewF2>.  <NewE> is the new edge created from <E>. <NewF1> (resp. <NewF2>) is the new face created from <F1> (resp. <F2>).

	:param E:
	:type E: TopoDS_Edge &
	:param F1:
	:type F1: TopoDS_Face &
	:param F2:
	:type F2: TopoDS_Face &
	:param NewE:
	:type NewE: TopoDS_Edge &
	:param NewF1:
	:type NewF1: TopoDS_Face &
	:param NewF2:
	:type NewF2: TopoDS_Face &
	:rtype: GeomAbs_Shape
") Continuity;
		GeomAbs_Shape Continuity (const TopoDS_Edge & E,const TopoDS_Face & F1,const TopoDS_Face & F2,const TopoDS_Edge & NewE,const TopoDS_Face & NewF1,const TopoDS_Face & NewF2);
};


%feature("shadow") BRepTools_NurbsConvertModification::~BRepTools_NurbsConvertModification %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepTools_NurbsConvertModification {
	void _kill_pointed() {
		delete $self;
	}
};
%extend BRepTools_NurbsConvertModification {
	Handle_BRepTools_NurbsConvertModification GetHandle() {
	return *(Handle_BRepTools_NurbsConvertModification*) &$self;
	}
};

%nodefaultctor Handle_BRepTools_NurbsConvertModification;
class Handle_BRepTools_NurbsConvertModification : public Handle_BRepTools_Modification {

    public:
        // constructors
        Handle_BRepTools_NurbsConvertModification();
        Handle_BRepTools_NurbsConvertModification(const Handle_BRepTools_NurbsConvertModification &aHandle);
        Handle_BRepTools_NurbsConvertModification(const BRepTools_NurbsConvertModification *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BRepTools_NurbsConvertModification DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BRepTools_NurbsConvertModification {
    BRepTools_NurbsConvertModification* GetObject() {
    return (BRepTools_NurbsConvertModification*)$self->Access();
    }
};
%feature("shadow") Handle_BRepTools_NurbsConvertModification::~Handle_BRepTools_NurbsConvertModification %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_BRepTools_NurbsConvertModification {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor BRepTools_TrsfModification;
class BRepTools_TrsfModification : public BRepTools_Modification {
	public:
		%feature("autodoc", "	:param T:
	:type T: gp_Trsf
	:rtype: None
") BRepTools_TrsfModification;
		 BRepTools_TrsfModification (const gp_Trsf & T);
		%feature("autodoc", "	* Provides access to the gp_Trsf associated with this modification. The transformation can be changed.

	:rtype: gp_Trsf
") Trsf;
		gp_Trsf & Trsf ();
		%feature("autodoc", "	* Returns true if the face F has been modified. If the face has been modified: - S is the new geometry of the face, - L is its new location, and - Tol is the new tolerance. RevWires is set to true when the modification reverses the normal of the surface (the wires have to be reversed). RevFace is set to true if the orientation of the modified face changes in the shells which contain it. For this class, RevFace returns true if the gp_Trsf associated with this modification is negative.

	:param F:
	:type F: TopoDS_Face &
	:param S:
	:type S: Handle_Geom_Surface &
	:param L:
	:type L: TopLoc_Location &
	:param Tol:
	:type Tol: float &
	:param RevWires:
	:type RevWires: bool
	:param RevFace:
	:type RevFace: bool
	:rtype: bool
") NewSurface;
		Standard_Boolean NewSurface (const TopoDS_Face & F,Handle_Geom_Surface & S,TopLoc_Location & L,Standard_Real &OutValue,Standard_Boolean & RevWires,Standard_Boolean & RevFace);
		%feature("autodoc", "	* Returns true if the edge E has been modified. If the edge has been modified: - C is the new geometric support of the edge, - L is the new location, and - Tol is the new tolerance. If the edge has not been modified, this function returns false, and the values of C, L and Tol are not significant.

	:param E:
	:type E: TopoDS_Edge &
	:param C:
	:type C: Handle_Geom_Curve &
	:param L:
	:type L: TopLoc_Location &
	:param Tol:
	:type Tol: float &
	:rtype: bool
") NewCurve;
		Standard_Boolean NewCurve (const TopoDS_Edge & E,Handle_Geom_Curve & C,TopLoc_Location & L,Standard_Real &OutValue);
		%feature("autodoc", "	* Returns true if the vertex V has been modified. If the vertex has been modified: - P is the new geometry of the vertex, and - Tol is the new tolerance. If the vertex has not been modified this function returns false, and the values of P and Tol are not significant.

	:param V:
	:type V: TopoDS_Vertex &
	:param P:
	:type P: gp_Pnt
	:param Tol:
	:type Tol: float &
	:rtype: bool
") NewPoint;
		Standard_Boolean NewPoint (const TopoDS_Vertex & V,gp_Pnt & P,Standard_Real &OutValue);
		%feature("autodoc", "	* Returns true if the edge E has a new curve on surface on the face F. If a new curve exists: - C is the new geometric support of the edge, - L is the new location, and - Tol the new tolerance. If no new curve exists, this function returns false, and the values of C, L and Tol are not significant.

	:param E:
	:type E: TopoDS_Edge &
	:param F:
	:type F: TopoDS_Face &
	:param NewE:
	:type NewE: TopoDS_Edge &
	:param NewF:
	:type NewF: TopoDS_Face &
	:param C:
	:type C: Handle_Geom2d_Curve &
	:param Tol:
	:type Tol: float &
	:rtype: bool
") NewCurve2d;
		Standard_Boolean NewCurve2d (const TopoDS_Edge & E,const TopoDS_Face & F,const TopoDS_Edge & NewE,const TopoDS_Face & NewF,Handle_Geom2d_Curve & C,Standard_Real &OutValue);
		%feature("autodoc", "	* Returns true if the Vertex V has a new parameter on the edge E. If a new parameter exists: - P is the parameter, and - Tol is the new tolerance. If no new parameter exists, this function returns false, and the values of P and Tol are not significant.

	:param V:
	:type V: TopoDS_Vertex &
	:param E:
	:type E: TopoDS_Edge &
	:param P:
	:type P: float &
	:param Tol:
	:type Tol: float &
	:rtype: bool
") NewParameter;
		Standard_Boolean NewParameter (const TopoDS_Vertex & V,const TopoDS_Edge & E,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "	* Returns the continuity of <NewE> between <NewF1> and <NewF2>.  <NewE> is the new edge created from <E>. <NewF1> (resp. <NewF2>) is the new face created from <F1> (resp. <F2>).

	:param E:
	:type E: TopoDS_Edge &
	:param F1:
	:type F1: TopoDS_Face &
	:param F2:
	:type F2: TopoDS_Face &
	:param NewE:
	:type NewE: TopoDS_Edge &
	:param NewF1:
	:type NewF1: TopoDS_Face &
	:param NewF2:
	:type NewF2: TopoDS_Face &
	:rtype: GeomAbs_Shape
") Continuity;
		GeomAbs_Shape Continuity (const TopoDS_Edge & E,const TopoDS_Face & F1,const TopoDS_Face & F2,const TopoDS_Edge & NewE,const TopoDS_Face & NewF1,const TopoDS_Face & NewF2);
};


%feature("shadow") BRepTools_TrsfModification::~BRepTools_TrsfModification %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepTools_TrsfModification {
	void _kill_pointed() {
		delete $self;
	}
};
%extend BRepTools_TrsfModification {
	Handle_BRepTools_TrsfModification GetHandle() {
	return *(Handle_BRepTools_TrsfModification*) &$self;
	}
};

%nodefaultctor Handle_BRepTools_TrsfModification;
class Handle_BRepTools_TrsfModification : public Handle_BRepTools_Modification {

    public:
        // constructors
        Handle_BRepTools_TrsfModification();
        Handle_BRepTools_TrsfModification(const Handle_BRepTools_TrsfModification &aHandle);
        Handle_BRepTools_TrsfModification(const BRepTools_TrsfModification *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BRepTools_TrsfModification DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BRepTools_TrsfModification {
    BRepTools_TrsfModification* GetObject() {
    return (BRepTools_TrsfModification*)$self->Access();
    }
};
%feature("shadow") Handle_BRepTools_TrsfModification::~Handle_BRepTools_TrsfModification %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_BRepTools_TrsfModification {
    void _kill_pointed() {
        delete $self;
    }
};

