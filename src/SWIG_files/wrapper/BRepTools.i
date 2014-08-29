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
%module BRepTools

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

%include BRepTools_required_python_modules.i
%include BRepTools_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%rename(breptools) BRepTools;
%nodefaultctor BRepTools;
class BRepTools {
	public:
		%feature("autodoc", "Args:
	F(TopoDS_Face)
	UMin(Standard_Real)
	UMax(Standard_Real)
	VMin(Standard_Real)
	VMax(Standard_Real)

Returns:
	static void

Returns in UMin,  UMax, VMin,  VMax  the  bounding  
         values in the parametric space of F.") UVBounds;
		static void UVBounds (const TopoDS_Face & F,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	F(TopoDS_Face)
	W(TopoDS_Wire)
	UMin(Standard_Real)
	UMax(Standard_Real)
	VMin(Standard_Real)
	VMax(Standard_Real)

Returns:
	static void

Returns in UMin,  UMax, VMin,  VMax  the  bounding  
         values of the wire in the parametric space of F.") UVBounds;
		static void UVBounds (const TopoDS_Face & F,const TopoDS_Wire & W,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	F(TopoDS_Face)
	E(TopoDS_Edge)
	UMin(Standard_Real)
	UMax(Standard_Real)
	VMin(Standard_Real)
	VMax(Standard_Real)

Returns:
	static void

Returns in UMin,  UMax, VMin,  VMax  the  bounding  
         values of the edge in the parametric space of F.") UVBounds;
		static void UVBounds (const TopoDS_Face & F,const TopoDS_Edge & E,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	F(TopoDS_Face)
	B(Bnd_Box2d)

Returns:
	static void

Adds  to  the box <B>  the bounding values in  the  
         parametric space of F.") AddUVBounds;
		static void AddUVBounds (const TopoDS_Face & F,Bnd_Box2d & B);
		%feature("autodoc", "Args:
	F(TopoDS_Face)
	W(TopoDS_Wire)
	B(Bnd_Box2d)

Returns:
	static void

Adds  to the box  <B>  the bounding  values of the  
         wire in the parametric space of F.") AddUVBounds;
		static void AddUVBounds (const TopoDS_Face & F,const TopoDS_Wire & W,Bnd_Box2d & B);
		%feature("autodoc", "Args:
	F(TopoDS_Face)
	E(TopoDS_Edge)
	B(Bnd_Box2d)

Returns:
	static void

Adds to  the box <B>  the  bounding values  of the  
         edge in the parametric space of F.") AddUVBounds;
		static void AddUVBounds (const TopoDS_Face & F,const TopoDS_Edge & E,Bnd_Box2d & B);
		%feature("autodoc", "Args:
	V(TopoDS_Vertex)

Returns:
	static void

Update a vertex (nothing is done)") Update;
		static void Update (const TopoDS_Vertex & V);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)

Returns:
	static void

Update an edge, compute 2d bounding boxes.") Update;
		static void Update (const TopoDS_Edge & E);
		%feature("autodoc", "Args:
	W(TopoDS_Wire)

Returns:
	static void

Update a wire (nothing is done)") Update;
		static void Update (const TopoDS_Wire & W);
		%feature("autodoc", "Args:
	F(TopoDS_Face)

Returns:
	static void

Update a Face, update UV points.") Update;
		static void Update (const TopoDS_Face & F);
		%feature("autodoc", "Args:
	S(TopoDS_Shell)

Returns:
	static void

Update a shell (nothing is done)") Update;
		static void Update (const TopoDS_Shell & S);
		%feature("autodoc", "Args:
	S(TopoDS_Solid)

Returns:
	static void

Update a solid (nothing is done)") Update;
		static void Update (const TopoDS_Solid & S);
		%feature("autodoc", "Args:
	C(TopoDS_CompSolid)

Returns:
	static void

Update a composite solid (nothing is done)") Update;
		static void Update (const TopoDS_CompSolid & C);
		%feature("autodoc", "Args:
	C(TopoDS_Compound)

Returns:
	static void

Update a compound (nothing is done)") Update;
		static void Update (const TopoDS_Compound & C);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	static void

Update a shape, call the corect update.") Update;
		static void Update (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	F(TopoDS_Face)

Returns:
	static void

For  all the edges  of the face  <F> reset  the UV  
         points to  ensure that  connected  faces  have the  
         same point at there common extremity.") UpdateFaceUVPoints;
		static void UpdateFaceUVPoints (const TopoDS_Face & F);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	static void

Removes all the triangulations of the faces of <S>  
         and removes all polygons on triangulations of the  
         edges.") Clean;
		static void Clean (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	static void

Removes all the pcurves of the edges of <S> that  
         refer to surfaces not belonging to any face of <S>") RemoveUnusedPCurves;
		static void RemoveUnusedPCurves (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	deflec(Standard_Real)

Returns:
	static Standard_Boolean

verifies that each face from the shape <S> has got  
         a triangulation  with a  deflection <= deflec  and  
         the edges a discretisation on  this triangulation.") Triangulation;
		static Standard_Boolean Triangulation (const TopoDS_Shape & S,const Standard_Real deflec);
		%feature("autodoc", "Args:
	V1(TopoDS_Vertex)
	V2(TopoDS_Vertex)

Returns:
	static Standard_Boolean

Returns  True if  the    distance between the  two  
         vertices is lower than their tolerance.") Compare;
		static Standard_Boolean Compare (const TopoDS_Vertex & V1,const TopoDS_Vertex & V2);
		%feature("autodoc", "Args:
	E1(TopoDS_Edge)
	E2(TopoDS_Edge)

Returns:
	static Standard_Boolean

Returns  True if  the    distance between the  two  
         edges is lower than their tolerance.") Compare;
		static Standard_Boolean Compare (const TopoDS_Edge & E1,const TopoDS_Edge & E2);
		%feature("autodoc", "Args:
	F(TopoDS_Face)

Returns:
	static TopoDS_Wire

Returns the outer most wire of <F>. Returns a Null  
         wire if <F> has no wires.") OuterWire;
		static TopoDS_Wire OuterWire (const TopoDS_Face & F);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	M(TopTools_IndexedMapOfShape)

Returns:
	static void

Stores in the map  <M> all the 3D topology edges  
         of <S>.") Map3DEdges;
		static void Map3DEdges (const TopoDS_Shape & S,TopTools_IndexedMapOfShape & M);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)
	F(TopoDS_Face)

Returns:
	static Standard_Boolean

Verifies that the edge  <E> is found two  times on  
         the face <F> before calling BRep_Tool::IsClosed.") IsReallyClosed;
		static Standard_Boolean IsReallyClosed (const TopoDS_Edge & E,const TopoDS_Face & F);
		%feature("autodoc", "Args:
	Sh(TopoDS_Shape)
	S(Standard_OStream)

Returns:
	static void

Dumps the topological structure and the geometry  
         of <Sh> on the stream <S>.") Dump;
		static void Dump (const TopoDS_Shape & Sh,Standard_OStream & S);
		%feature("autodoc", "Args:
	Sh(TopoDS_Shape)
	S(Standard_OStream)
	PR(Handle_Message_ProgressIndicator)=NULL

Returns:
	static void

Writes <Sh> on <S> in an ASCII format.") Write;
		static void Write (const TopoDS_Shape & Sh,Standard_OStream & S,const Handle_Message_ProgressIndicator & PR = NULL);
		%feature("autodoc", "Args:
	Sh(TopoDS_Shape)
	S(Standard_IStream)
	B(BRep_Builder)
	PR(Handle_Message_ProgressIndicator)=NULL

Returns:
	static void

Reads a Shape  from <S> in  returns it in  <Sh>.  
         <B> is used to build the shape.") Read;
		static void Read (TopoDS_Shape & Sh,Standard_IStream & S,const BRep_Builder & B,const Handle_Message_ProgressIndicator & PR = NULL);
		%feature("autodoc", "Args:
	Sh(TopoDS_Shape)
	File(char *)
	PR(Handle_Message_ProgressIndicator)=NULL

Returns:
	static Standard_Boolean

Writes <Sh> in <File>.") Write;
		static Standard_Boolean Write (const TopoDS_Shape & Sh,const char * File,const Handle_Message_ProgressIndicator & PR = NULL);
		%feature("autodoc", "Args:
	Sh(TopoDS_Shape)
	File(char *)
	B(BRep_Builder)
	PR(Handle_Message_ProgressIndicator)=NULL

Returns:
	static Standard_Boolean

Reads a Shape  from <File>,  returns it in  <Sh>.  
         <B> is used to build the shape.") Read;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") BRepTools_DataMapIteratorOfMapOfVertexPnt2d;
		 BRepTools_DataMapIteratorOfMapOfVertexPnt2d ();
		%feature("autodoc", "Args:
	aMap(BRepTools_MapOfVertexPnt2d)

Returns:
	None

No detailed docstring for this function.") BRepTools_DataMapIteratorOfMapOfVertexPnt2d;
		 BRepTools_DataMapIteratorOfMapOfVertexPnt2d (const BRepTools_MapOfVertexPnt2d & aMap);
		%feature("autodoc", "Args:
	aMap(BRepTools_MapOfVertexPnt2d)

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const BRepTools_MapOfVertexPnt2d & aMap);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Key;
		const TopoDS_Shape & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	TColgp_SequenceOfPnt2d

No detailed docstring for this function.") Value;
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
		%feature("autodoc", "Args:
	K(TopoDS_Shape)
	I(TColgp_SequenceOfPnt2d)
	n(TCollection_MapNodePtr)

Returns:
	None

No detailed docstring for this function.") BRepTools_DataMapNodeOfMapOfVertexPnt2d;
		 BRepTools_DataMapNodeOfMapOfVertexPnt2d (const TopoDS_Shape & K,const TColgp_SequenceOfPnt2d & I,const TCollection_MapNodePtr & n);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

No detailed docstring for this function.") Key;
		TopoDS_Shape & Key ();
		%feature("autodoc", "Args:
	None
Returns:
	TColgp_SequenceOfPnt2d

No detailed docstring for this function.") Value;
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
		%feature("autodoc", "Args:
	NbBuckets(Standard_Integer)=1

Returns:
	None

No detailed docstring for this function.") BRepTools_MapOfVertexPnt2d;
		 BRepTools_MapOfVertexPnt2d (const Standard_Integer NbBuckets = 1);
		%feature("autodoc", "Args:
	Other(BRepTools_MapOfVertexPnt2d)

Returns:
	BRepTools_MapOfVertexPnt2d

No detailed docstring for this function.") Assign;
		BRepTools_MapOfVertexPnt2d & Assign (const BRepTools_MapOfVertexPnt2d & Other);
		%feature("autodoc", "Args:
	Other(BRepTools_MapOfVertexPnt2d)

Returns:
	BRepTools_MapOfVertexPnt2d

No detailed docstring for this function.") operator=;
		BRepTools_MapOfVertexPnt2d & operator = (const BRepTools_MapOfVertexPnt2d & Other);
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
	I(TColgp_SequenceOfPnt2d)

Returns:
	Standard_Boolean

No detailed docstring for this function.") Bind;
		Standard_Boolean Bind (const TopoDS_Shape & K,const TColgp_SequenceOfPnt2d & I);
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
	TColgp_SequenceOfPnt2d

No detailed docstring for this function.") Find;
		const TColgp_SequenceOfPnt2d & Find (const TopoDS_Shape & K);
		%feature("autodoc", "Args:
	K(TopoDS_Shape)

Returns:
	TColgp_SequenceOfPnt2d

No detailed docstring for this function.") ChangeFind;
		TColgp_SequenceOfPnt2d & ChangeFind (const TopoDS_Shape & K);
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
		%feature("autodoc", "Args:
	F(TopoDS_Face)
	S(Handle_Geom_Surface)
	L(TopLoc_Location)
	Tol(Standard_Real)
	RevWires(Standard_Boolean)
	RevFace(Standard_Boolean)

Returns:
	virtual Standard_Boolean

Returns true if the face, F, has been modified.  
If the face has been modified:  
- S is the new geometry of the face,  
- L is its new location, and  
- Tol is the new tolerance.  
The flag, RevWires, is set to true when the  
modification reverses the normal of the surface, (i.e.  
the wires have to be reversed).  
The flag, RevFace, is set to true if the orientation of  
the modified face changes in the shells which contain it.  
If the face has not been modified this function returns  
false, and the values of S, L, Tol, RevWires and  
RevFace are not significant.") NewSurface;
		virtual Standard_Boolean NewSurface (const TopoDS_Face & F,Handle_Geom_Surface & S,TopLoc_Location & L,Standard_Real &OutValue,Standard_Boolean & RevWires,Standard_Boolean & RevFace);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)
	C(Handle_Geom_Curve)
	L(TopLoc_Location)
	Tol(Standard_Real)

Returns:
	virtual Standard_Boolean

Returns true if the edge, E, has been modified.  
If the edge has been modified:  
- C is the new geometry associated with the edge,  
- L is its new location, and  
- Tol is the new tolerance.  
  If the edge has not been modified, this function  
returns false, and the values of C, L and Tol are not significant.") NewCurve;
		virtual Standard_Boolean NewCurve (const TopoDS_Edge & E,Handle_Geom_Curve & C,TopLoc_Location & L,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	V(TopoDS_Vertex)
	P(gp_Pnt)
	Tol(Standard_Real)

Returns:
	virtual Standard_Boolean

Returns true if the vertex V has been modified.  
If V has been modified:  
- P is the new geometry of the vertex, and  
- Tol is the new tolerance.  
  If the vertex has not been modified this function  
returns false, and the values of P and Tol are not significant.") NewPoint;
		virtual Standard_Boolean NewPoint (const TopoDS_Vertex & V,gp_Pnt & P,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)
	F(TopoDS_Face)
	NewE(TopoDS_Edge)
	NewF(TopoDS_Face)
	C(Handle_Geom2d_Curve)
	Tol(Standard_Real)

Returns:
	virtual Standard_Boolean

Returns true if the edge, E, has a new curve on  
surface on the face, F.  
If a new curve exists:  
- C is the new geometry of the edge,  
- L is the new location, and  
- Tol is the new tolerance.  
  NewE is the new edge created from E, and NewF is  
the new face created from F.  
If there is no new curve on the face, this function  
returns false, and the values of C, L and Tol are not significant.") NewCurve2d;
		virtual Standard_Boolean NewCurve2d (const TopoDS_Edge & E,const TopoDS_Face & F,const TopoDS_Edge & NewE,const TopoDS_Face & NewF,Handle_Geom2d_Curve & C,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	V(TopoDS_Vertex)
	E(TopoDS_Edge)
	P(Standard_Real)
	Tol(Standard_Real)

Returns:
	virtual Standard_Boolean

Returns true if the vertex V has a new parameter on the edge E.  
If a new parameter exists:  
- P is the parameter, and  
- Tol is the new tolerance.  
  If there is no new parameter this function returns  
false, and the values of P and Tol are not significant.") NewParameter;
		virtual Standard_Boolean NewParameter (const TopoDS_Vertex & V,const TopoDS_Edge & E,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)
	F1(TopoDS_Face)
	F2(TopoDS_Face)
	NewE(TopoDS_Edge)
	NewF1(TopoDS_Face)
	NewF2(TopoDS_Face)

Returns:
	virtual GeomAbs_Shape

Returns the  continuity of  <NewE> between <NewF1>  
         and <NewF2>.  
         <NewE> is the new  edge created from <E>.  <NewF1>  
         (resp. <NewF2>) is the new  face created from <F1>  
         (resp. <F2>).") Continuity;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates an empty Modifier.") BRepTools_Modifier;
		 BRepTools_Modifier ();
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	None

Creates a modifier on the shape <S>.") BRepTools_Modifier;
		 BRepTools_Modifier (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	M(Handle_BRepTools_Modification)

Returns:
	None

Creates a modifier on  the shape <S>, and performs  
         the modifications described by <M>.") BRepTools_Modifier;
		 BRepTools_Modifier (const TopoDS_Shape & S,const Handle_BRepTools_Modification & M);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	None

Initializes the modifier with the shape <S>.") Init;
		void Init (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	M(Handle_BRepTools_Modification)

Returns:
	None

Performs the modifications described by <M>.") Perform;
		void Perform (const Handle_BRepTools_Modification & M);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns Standard_True if the modification has  
         been computed successfully.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	TopoDS_Shape

Returns the modified shape corresponding to <S>.") ModifiedShape;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") BRepTools_Quilt;
		 BRepTools_Quilt ();
		%feature("autodoc", "Args:
	Eold(TopoDS_Edge)
	Enew(TopoDS_Edge)

Returns:
	None

Binds <Enew> to   be  the  new edge  instead   of  
         <Eold>.  
 
         The faces  of  the added  shape containing  <Eold>  
         will be copied to substitute <Eold> by <Enew>.  
 
         The vertices  of   <Eold> will   be bound to   the  
         vertices of <Enew> with the same orientation.  
 
         If <Eold>  and <Enew>  have different orientations  
         the curves are considered  to be opposite  and the  
         pcurves of <Eold>  will be copied  and reversed in  
         the new faces.  
 
         <Eold> must belong to the next added shape, <Enew> must belong  
         to a Shape added before.") Bind;
		void Bind (const TopoDS_Edge & Eold,const TopoDS_Edge & Enew);
		%feature("autodoc", "Args:
	Vold(TopoDS_Vertex)
	Vnew(TopoDS_Vertex)

Returns:
	None

Binds <VNew> to be a new vertex instead of <Vold>.  
 
         The faces  of  the added  shape containing  <Vold>  
         will be copied to substitute <Vold> by <Vnew>.") Bind;
		void Bind (const TopoDS_Vertex & Vold,const TopoDS_Vertex & Vnew);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	None

Add   the faces of  <S>  to  the Quilt,  the faces  
         containing bounded edges are copied.") Add;
		void Add (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	Standard_Boolean

Returns   True if <S> has   been  copied (<S> is a  
         vertex, an edge or a face)") IsCopied;
		Standard_Boolean IsCopied (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	TopoDS_Shape

Returns the shape  substitued to <S> in the Quilt.") Copy;
		const TopoDS_Shape & Copy (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Shape

Returns a Compound of shells made from the current  
         set of faces. The shells will be flagged as closed  
         or not closed.") Shells;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

Returns an empty Reshape") BRepTools_ReShape;
		 BRepTools_ReShape ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Clears all substitutions requests") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	shape(TopoDS_Shape)
	oriented(Standard_Boolean)=Standard_False

Returns:
	None

Sets a request to Remove a Shape  
         If <oriented> is True, only for a shape with the SAME  
         orientation. Else, whatever the orientation") Remove;
		void Remove (const TopoDS_Shape & shape,const Standard_Boolean oriented = Standard_False);
		%feature("autodoc", "Args:
	shape(TopoDS_Shape)
	newshape(TopoDS_Shape)
	oriented(Standard_Boolean)=Standard_False

Returns:
	None

Sets a request to Replace a Shape by a new one  
         If <oriented> is True, only if the orientation is the same  
         Else, whatever the orientation, and the new shape takes the  
         same orientation as <newshape> if the replaced one has the  
         same as <shape>, else it is reversed") Replace;
		void Replace (const TopoDS_Shape & shape,const TopoDS_Shape & newshape,const Standard_Boolean oriented = Standard_False);
		%feature("autodoc", "Args:
	shape(TopoDS_Shape)

Returns:
	Standard_Boolean

Tells if a shape is recorded for Replace/Remove") IsRecorded;
		Standard_Boolean IsRecorded (const TopoDS_Shape & shape);
		%feature("autodoc", "Args:
	shape(TopoDS_Shape)

Returns:
	TopoDS_Shape

Returns the new value for an individual shape  
         If not recorded, returns the original shape itself  
         If to be Removed, returns a Null Shape  
         Else, returns the replacing item") Value;
		TopoDS_Shape Value (const TopoDS_Shape & shape);
		%feature("autodoc", "Args:
	shape(TopoDS_Shape)
	newsh(TopoDS_Shape)
	last(Standard_Boolean)=Standard_False

Returns:
	virtual Standard_Integer

Returns a complete substitution status for a shape  
         0  : not recorded,   <newsh> = original <shape>  
         < 0: to be removed,  <newsh> is NULL  
         > 0: to be replaced, <newsh> is a new item  
         If <last> is False, returns status and new shape recorded in  
         the map directly for the shape, if True and status > 0 then  
         recursively searches for the last status and new shape.") Status;
		virtual Standard_Integer Status (const TopoDS_Shape & shape,TopoDS_Shape & newsh,const Standard_Boolean last = Standard_False);
		%feature("autodoc", "Args:
	shape(TopoDS_Shape)
	until(TopAbs_ShapeEnum)
	buildmode(Standard_Integer)

Returns:
	virtual TopoDS_Shape

Applies the substitutions requests to a shape  
 
         <until> gives the level of type until which requests are taken  
         into account. For subshapes of the type <until> no rebuild  
         and futher exploring are done.  
         ACTUALLY, NOT IMPLEMENTED BELOW  TopAbs_FACE  
 
         <buildmode> says how to do on a SOLID,SHELL ... if one of its  
         sub-shapes has been changed:  
         0: at least one Replace or Remove -> COMPOUND, else as such  
         1: at least one Remove (Replace are ignored) -> COMPOUND  
         2: Replace and Remove are both ignored  
         If Replace/Remove are ignored or absent, the result as same  
         type as the starting shape") Apply;
		virtual TopoDS_Shape Apply (const TopoDS_Shape & shape,const TopAbs_ShapeEnum until,const Standard_Integer buildmode);
		%feature("autodoc", "Args:
	shape(TopoDS_Shape)
	until(TopAbs_ShapeEnum)=TopAbs_SHAPE

Returns:
	virtual TopoDS_Shape

Applies the substitutions requests to a shape.  
 
         <until> gives the level of type until which requests are taken  
         into account. For subshapes of the type <until> no rebuild  
         and futher exploring are done.  
 
         NOTE: each subshape can be replaced by shape of the same type  
         or by shape containing only shapes of that type (for  
         example, TopoDS_Edge can be replaced by TopoDS_Edge,  
         TopoDS_Wire or TopoDS_Compound containing TopoDS_Edges).  
         If incompatible shape type is encountered, it is ignored  
         and flag FAIL1 is set in Status.") Apply;
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
		%feature("autodoc", "Args:
	isWithTriangles(Standard_Boolean)=Standard_True

Returns:
	None

Builds an empty ShapeSet.  
         Parameter <isWithTriangles> is added for XML Persistence") BRepTools_ShapeSet;
		 BRepTools_ShapeSet (const Standard_Boolean isWithTriangles = Standard_True);
		%feature("autodoc", "Args:
	B(BRep_Builder)
	isWithTriangles(Standard_Boolean)=Standard_True

Returns:
	None

Builds an empty ShapeSet.  
         Parameter <isWithTriangles> is added for XML Persistence") BRepTools_ShapeSet;
		 BRepTools_ShapeSet (const BRep_Builder & B,const Standard_Boolean isWithTriangles = Standard_True);
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

Clears the content of the set.") Clear;
		virtual void Clear ();
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	virtual void

Stores the goemetry of <S>.") AddGeometry;
		virtual void AddGeometry (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	OS(Standard_OStream)

Returns:
	virtual void

Dumps the geometry of me on the stream <OS>.") DumpGeometry;
		virtual void DumpGeometry (Standard_OStream & OS);
		%feature("autodoc", "Args:
	OS(Standard_OStream)

Returns:
	virtual void

Writes the geometry of  me  on the stream <OS> in a  
         format that can be read back by Read.") WriteGeometry;
		virtual void WriteGeometry (Standard_OStream & OS);
		%feature("autodoc", "Args:
	IS(Standard_IStream)

Returns:
	virtual void

Reads the geometry of me from the  stream  <IS>.") ReadGeometry;
		virtual void ReadGeometry (Standard_IStream & IS);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	OS(Standard_OStream)

Returns:
	virtual void

Dumps the geometry of <S> on the stream <OS>.") DumpGeometry;
		virtual void DumpGeometry (const TopoDS_Shape & S,Standard_OStream & OS);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	OS(Standard_OStream)

Returns:
	virtual void

Writes the geometry of <S>  on the stream <OS> in a  
         format that can be read back by Read.") WriteGeometry;
		virtual void WriteGeometry (const TopoDS_Shape & S,Standard_OStream & OS);
		%feature("autodoc", "Args:
	T(TopAbs_ShapeEnum)
	IS(Standard_IStream)
	S(TopoDS_Shape)

Returns:
	virtual void

Reads the geometry of a shape of type <T> from the  
         stream <IS> and returns it in <S>.") ReadGeometry;
		virtual void ReadGeometry (const TopAbs_ShapeEnum T,Standard_IStream & IS,TopoDS_Shape & S);
		%feature("autodoc", "Args:
	S1(TopoDS_Shape)
	S2(TopoDS_Shape)

Returns:
	virtual void

Inserts  the shape <S2> in  the  shape <S1>.  This  
         method must be   redefined  to  use   the  correct  
         builder.") AddShapes;
		virtual void AddShapes (TopoDS_Shape & S1,const TopoDS_Shape & S2);
		%feature("autodoc", "Args:
	T(TopAbs_ShapeEnum)
	S(TopoDS_Shape)

Returns:
	virtual void

No detailed docstring for this function.") Check;
		virtual void Check (const TopAbs_ShapeEnum T,TopoDS_Shape & S);
		%feature("autodoc", "Args:
	IS(Standard_IStream)

Returns:
	None

Reads the 3d polygons  of me  
         from the  stream  <IS>.") ReadPolygon3D;
		void ReadPolygon3D (Standard_IStream & IS);
		%feature("autodoc", "Args:
	OS(Standard_OStream)
	Compact(Standard_Boolean)=Standard_True

Returns:
	None

Writes the 3d polygons  
         on the stream <OS> in a format that can  
         be read back by Read.") WritePolygon3D;
		void WritePolygon3D (Standard_OStream & OS,const Standard_Boolean Compact = Standard_True);
		%feature("autodoc", "Args:
	OS(Standard_OStream)

Returns:
	None

Dumps the 3d polygons  
         on the stream <OS>.") DumpPolygon3D;
		void DumpPolygon3D (Standard_OStream & OS);
		%feature("autodoc", "Args:
	IS(Standard_IStream)

Returns:
	None

Reads the triangulation of me  
         from the  stream  <IS>.") ReadTriangulation;
		void ReadTriangulation (Standard_IStream & IS);
		%feature("autodoc", "Args:
	OS(Standard_OStream)
	Compact(Standard_Boolean)=Standard_True

Returns:
	None

Writes the triangulation  
         on the stream <OS> in a format that can  
         be read back by Read.") WriteTriangulation;
		void WriteTriangulation (Standard_OStream & OS,const Standard_Boolean Compact = Standard_True);
		%feature("autodoc", "Args:
	OS(Standard_OStream)

Returns:
	None

Dumps the triangulation  
         on the stream <OS>.") DumpTriangulation;
		void DumpTriangulation (Standard_OStream & OS);
		%feature("autodoc", "Args:
	IS(Standard_IStream)

Returns:
	None

Reads the polygons on triangulation of me  
         from the  stream  <IS>.") ReadPolygonOnTriangulation;
		void ReadPolygonOnTriangulation (Standard_IStream & IS);
		%feature("autodoc", "Args:
	OS(Standard_OStream)
	Compact(Standard_Boolean)=Standard_True

Returns:
	None

Writes the polygons on triangulation  
         on the stream <OS> in a format that can  
         be read back by Read.") WritePolygonOnTriangulation;
		void WritePolygonOnTriangulation (Standard_OStream & OS,const Standard_Boolean Compact = Standard_True);
		%feature("autodoc", "Args:
	OS(Standard_OStream)

Returns:
	None

Dumps the polygons on triangulation  
         on the stream <OS>.") DumpPolygonOnTriangulation;
		void DumpPolygonOnTriangulation (Standard_OStream & OS);
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") BRepTools_Substitution;
		 BRepTools_Substitution ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Reset all the fields.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	OldShape(TopoDS_Shape)
	NewShapes(TopTools_ListOfShape)

Returns:
	None

<Oldshape> will be replaced by <NewShapes>.  
 
         <NewShapes> can be empty , in this case <OldShape>  
         will disparate from its ancestors.  
 
         if an item of <NewShapes> is oriented FORWARD.  
         it will be oriented as <OldShape> in its ancestors.  
         else it will be reversed.") Substitute;
		void Substitute (const TopoDS_Shape & OldShape,const TopTools_ListOfShape & NewShapes);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	None

Build NewShape from <S> if its subshapes has modified.  
 
         The methods <IsCopied> and <Copy> allows you to keep  
         the resul of <Build>") Build;
		void Build (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	Standard_Boolean

Returns   True if <S> has   been  replaced .") IsCopied;
		Standard_Boolean IsCopied (const TopoDS_Shape & S);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)

Returns:
	TopTools_ListOfShape

Returns the set of shapes  substitued to <S> .") Copy;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

Constructs an empty explorer (which can be initialized using Init)") BRepTools_WireExplorer;
		 BRepTools_WireExplorer ();
		%feature("autodoc", "Args:
	W(TopoDS_Wire)

Returns:
	None

IInitializes an exploration  of the wire <W>.") BRepTools_WireExplorer;
		 BRepTools_WireExplorer (const TopoDS_Wire & W);
		%feature("autodoc", "Args:
	W(TopoDS_Wire)
	F(TopoDS_Face)

Returns:
	None

Initializes an exploration  of the wire <W>.  
         F is used to select the edge connected to the  
         previous in the parametric representation of <F>.") BRepTools_WireExplorer;
		 BRepTools_WireExplorer (const TopoDS_Wire & W,const TopoDS_Face & F);
		%feature("autodoc", "Args:
	W(TopoDS_Wire)

Returns:
	None

Initializes an exploration of the wire <W>.") Init;
		void Init (const TopoDS_Wire & W);
		%feature("autodoc", "Args:
	W(TopoDS_Wire)
	F(TopoDS_Face)

Returns:
	None

Initializes an exploration of the wire <W>.  
         F is used to select the edge connected to the  
         previous in the parametric representation of <F>.") Init;
		void Init (const TopoDS_Wire & W,const TopoDS_Face & F);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True if there  is a current  edge.") More;
		Standard_Boolean More ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Proceeds to the next edge.") Next;
		void Next ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Edge

Returns the current edge.") Current;
		const TopoDS_Edge & Current ();
		%feature("autodoc", "Args:
	None
Returns:
	TopAbs_Orientation

Returns an Orientation for the current edge.") Orientation;
		TopAbs_Orientation Orientation ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Vertex

Returns the vertex connecting the current  edge to  
         the previous one.") CurrentVertex;
		const TopoDS_Vertex & CurrentVertex ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Clears the content of the explorer.") Clear;
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
		%feature("autodoc", "Args:
	T(gp_GTrsf)

Returns:
	None

No detailed docstring for this function.") BRepTools_GTrsfModification;
		 BRepTools_GTrsfModification (const gp_GTrsf & T);
		%feature("autodoc", "Args:
	None
Returns:
	gp_GTrsf

Gives an access on the GTrsf.") GTrsf;
		gp_GTrsf & GTrsf ();
		%feature("autodoc", "Args:
	F(TopoDS_Face)
	S(Handle_Geom_Surface)
	L(TopLoc_Location)
	Tol(Standard_Real)
	RevWires(Standard_Boolean)
	RevFace(Standard_Boolean)

Returns:
	Standard_Boolean

Returns Standard_True  if  the face  <F> has  been  
         modified.  In this  case, <S> is the new geometric  
         support of  the  face, <L> the  new location,<Tol>  
         the new  tolerance.<RevWires> has  to  be set   to  
         Standard_True   when the modification reverses the  
         normal of  the   surface.(the wires   have  to  be  
         reversed).   <RevFace>   has   to   be   set    to  
         Standard_True if  the orientation  of the modified  
         face changes in the  shells which contain  it.  --  
         Here, <RevFace>  will  return Standard_True if the  
         -- gp_Trsf is negative.") NewSurface;
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
         <Tol> are not significant.") NewCurve2d;
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
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") BRepTools_NurbsConvertModification;
		 BRepTools_NurbsConvertModification ();
		%feature("autodoc", "Args:
	F(TopoDS_Face)
	S(Handle_Geom_Surface)
	L(TopLoc_Location)
	Tol(Standard_Real)
	RevWires(Standard_Boolean)
	RevFace(Standard_Boolean)

Returns:
	Standard_Boolean

Returns Standard_True  if  the face  <F> has  been  
         modified.  In this  case, <S> is the new geometric  
         support of  the  face, <L> the  new location,<Tol>  
         the new  tolerance.<RevWires> has  to  be set   to  
         Standard_True   when the modification reverses the  
         normal of  the   surface.(the wires   have  to  be  
         reversed).   <RevFace>   has   to   be   set    to  
         Standard_True if  the orientation  of the modified  
         face changes in the  shells which contain  it.  --  
         Here, <RevFace>  will  return Standard_True if the  
         -- gp_Trsf is negative.") NewSurface;
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
         <Tol> are not significant.") NewCurve2d;
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
		%feature("autodoc", "Args:
	T(gp_Trsf)

Returns:
	None

No detailed docstring for this function.") BRepTools_TrsfModification;
		 BRepTools_TrsfModification (const gp_Trsf & T);
		%feature("autodoc", "Args:
	None
Returns:
	gp_Trsf

Provides access to the gp_Trsf associated with this  
modification. The transformation can be changed.") Trsf;
		gp_Trsf & Trsf ();
		%feature("autodoc", "Args:
	F(TopoDS_Face)
	S(Handle_Geom_Surface)
	L(TopLoc_Location)
	Tol(Standard_Real)
	RevWires(Standard_Boolean)
	RevFace(Standard_Boolean)

Returns:
	Standard_Boolean

Returns true if the face F has been modified.  
If the face has been modified:  
- S is the new geometry of the face,  
- L is its new location, and  
- Tol is the new tolerance.  
RevWires is set to true when the modification  
reverses the normal of the surface (the wires have to be reversed).  
RevFace is set to true if the orientation of the  
modified face changes in the shells which contain it.  
For this class, RevFace returns true if the gp_Trsf  
associated with this modification is negative.") NewSurface;
		Standard_Boolean NewSurface (const TopoDS_Face & F,Handle_Geom_Surface & S,TopLoc_Location & L,Standard_Real &OutValue,Standard_Boolean & RevWires,Standard_Boolean & RevFace);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)
	C(Handle_Geom_Curve)
	L(TopLoc_Location)
	Tol(Standard_Real)

Returns:
	Standard_Boolean

Returns true if the edge E has been modified.  
If the edge has been modified:  
- C is the new geometric support of the edge,  
- L is the new location, and  
- Tol is the new tolerance.  
  If the edge has not been modified, this function  
returns false, and the values of C, L and Tol are not significant.") NewCurve;
		Standard_Boolean NewCurve (const TopoDS_Edge & E,Handle_Geom_Curve & C,TopLoc_Location & L,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	V(TopoDS_Vertex)
	P(gp_Pnt)
	Tol(Standard_Real)

Returns:
	Standard_Boolean

Returns true if the vertex V has been modified.  
If the vertex has been modified:  
- P is the new geometry of the vertex, and  
- Tol is the new tolerance.  
  If the vertex has not been modified this function  
returns false, and the values of P and Tol are not significant.") NewPoint;
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

Returns true if the edge E has a new curve on surface on the face F.  
If a new curve exists:  
- C is the new geometric support of the edge,  
- L is the new location, and  
- Tol the new tolerance.  
  If no new curve exists, this function returns false, and  
the values of C, L and Tol are not significant.") NewCurve2d;
		Standard_Boolean NewCurve2d (const TopoDS_Edge & E,const TopoDS_Face & F,const TopoDS_Edge & NewE,const TopoDS_Face & NewF,Handle_Geom2d_Curve & C,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	V(TopoDS_Vertex)
	E(TopoDS_Edge)
	P(Standard_Real)
	Tol(Standard_Real)

Returns:
	Standard_Boolean

Returns true if the Vertex V has a new parameter on the edge E.  
If a new parameter exists:  
- P is the parameter, and  
- Tol is the new tolerance.  
  If no new parameter exists, this function returns false,  
and the values of P and Tol are not significant.") NewParameter;
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

