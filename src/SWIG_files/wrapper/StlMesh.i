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
%module StlMesh

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

%include StlMesh_required_python_modules.i
%include StlMesh_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%rename(stlmesh) StlMesh;
%nodefaultctor StlMesh;
class StlMesh {
	public:
		%feature("autodoc", "Args:
	mesh1(Handle_StlMesh_Mesh)
	mesh2(Handle_StlMesh_Mesh)

Returns:
	static Handle_StlMesh_Mesh

Sequence of meshes  Make a merge of two Mesh and returns a new Mesh.  
         Very useful if you want to merge partMesh and CheckSurfaceMesh  
         for example") Merge;
		static Handle_StlMesh_Mesh Merge (const Handle_StlMesh_Mesh & mesh1,const Handle_StlMesh_Mesh & mesh2);
};


%feature("shadow") StlMesh::~StlMesh %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend StlMesh {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor StlMesh_Mesh;
class StlMesh_Mesh : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Creates an empty mesh.") StlMesh_Mesh;
		 StlMesh_Mesh ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

Adds a   new mesh domain.  The  mesh deflection is  
         defaulted to Confusion from package Precision.") AddDomain;
		virtual void AddDomain ();
		%feature("autodoc", "Args:
	Deflection(Standard_Real)

Returns:
	virtual void

Adds a new mesh domain.  Raised if the deflection is lower than zero  Raised if  the deflection is lower  than Confusion  
         from package Precision") AddDomain;
		virtual void AddDomain (const Standard_Real Deflection);
		%feature("autodoc", "Args:
	V1(Standard_Integer)
	V2(Standard_Integer)
	V3(Standard_Integer)
	Xn(Standard_Real)
	Yn(Standard_Real)
	Zn(Standard_Real)

Returns:
	virtual Standard_Integer

Build a triangle with the triplet of vertices (V1,  
         V2, V3).  This triplet defines  the indexes of the  
         vertex in the  current domain The coordinates  Xn,  
         Yn,  Zn  defines   the normal  direction   to  the  
         triangle.  Returns  the  range of  the triangle in  
         the current domain.") AddTriangle;
		virtual Standard_Integer AddTriangle (const Standard_Integer V1,const Standard_Integer V2,const Standard_Integer V3,const Standard_Real Xn,const Standard_Real Yn,const Standard_Real Zn);
		%feature("autodoc", "Args:
	X(Standard_Real)
	Y(Standard_Real)
	Z(Standard_Real)

Returns:
	virtual Standard_Integer

Returns the  range  of the  vertex in the  current  
         domain.") AddVertex;
		virtual Standard_Integer AddVertex (const Standard_Real X,const Standard_Real Y,const Standard_Real Z);
		%feature("autodoc", "Args:
	X(Standard_Real)
	Y(Standard_Real)
	Z(Standard_Real)

Returns:
	virtual Standard_Integer

Returns  the range of   the vertex in  the current  
         domain.  The current vertex is not inserted in the  
         mesh if it already exist.") AddOnlyNewVertex;
		virtual Standard_Integer AddOnlyNewVertex (const Standard_Real X,const Standard_Real Y,const Standard_Real Z);
		%feature("autodoc", "Args:
	XYZmax(gp_XYZ)
	XYZmin(gp_XYZ)

Returns:
	virtual void

Each  vertex of  the  mesh verifies  the following  
         relations :  
         XYZMin.X() <= X <= XYZMax.X()  
         XYZMin.Y() <= Y <= XYZMax.y()  
         XYZMin.Z() <= Z <= XYZMax.Z()") Bounds;
		virtual void Bounds (gp_XYZ & XYZmax,gp_XYZ & XYZmin);
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

No detailed docstring for this function.") Clear;
		virtual void Clear ();
		%feature("autodoc", "Args:
	DomainIndex(Standard_Integer)

Returns:
	virtual Standard_Real

Returns the deflection of the mesh of the domain  
         of range <DomainIndex>.  Raised if <DomainIndex> is lower than 1 or greater  
         than the number of domains.") Deflection;
		virtual Standard_Real Deflection (const Standard_Integer DomainIndex);
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

Number of domains in the mesh.") NbDomains;
		Standard_Integer NbDomains ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Cumulative Number of triangles in the mesh.") NbTriangles;
		Standard_Integer NbTriangles ();
		%feature("autodoc", "Args:
	DomainIndex(Standard_Integer)

Returns:
	virtual Standard_Integer

Number of  triangles   in  the  domain   of  range  
         <DomainIndex>.  Raised if <DomainIndex> is lower than 1 or greater  
         than the number of domains.") NbTriangles;
		virtual Standard_Integer NbTriangles (const Standard_Integer DomainIndex);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Cumulative Number of vertices in the mesh.") NbVertices;
		Standard_Integer NbVertices ();
		%feature("autodoc", "Args:
	DomainIndex(Standard_Integer)

Returns:
	virtual Standard_Integer

Number of vertices in the domain of range  
         <DomainIndex>.  Raised if <DomainIndex> is lower than 1 or greater  
         than the number of domains.") NbVertices;
		virtual Standard_Integer NbVertices (const Standard_Integer DomainIndex);
		%feature("autodoc", "Args:
	DomainIndex(Standard_Integer)=1

Returns:
	virtual  StlMesh_SequenceOfMeshTriangle

Returns the set of triangle   of   the  mesh domain   of   range  
         <DomainIndex>.  Raised if <DomainIndex> is lower than 1 or greater  
         than the number of domains.") Triangles;
		virtual const StlMesh_SequenceOfMeshTriangle & Triangles (const Standard_Integer DomainIndex = 1);
		%feature("autodoc", "Args:
	DomainIndex(Standard_Integer)=1

Returns:
	virtual  TColgp_SequenceOfXYZ

Returns  the coordinates   of the  vertices of the  
         mesh domain   of range <DomainIndex>.   {XV1, YV1,  
         ZV1, XV2, YV2, ZV2, XV3,.....}  Raised if <DomainIndex> is lower than 1 or greater  
         than the number of domains.") Vertices;
		virtual const TColgp_SequenceOfXYZ & Vertices (const Standard_Integer DomainIndex = 1);
};


%feature("shadow") StlMesh_Mesh::~StlMesh_Mesh %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend StlMesh_Mesh {
	void _kill_pointed() {
		delete $self;
	}
};
%extend StlMesh_Mesh {
	Handle_StlMesh_Mesh GetHandle() {
	return *(Handle_StlMesh_Mesh*) &$self;
	}
};

%nodefaultctor Handle_StlMesh_Mesh;
class Handle_StlMesh_Mesh : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StlMesh_Mesh();
        Handle_StlMesh_Mesh(const Handle_StlMesh_Mesh &aHandle);
        Handle_StlMesh_Mesh(const StlMesh_Mesh *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StlMesh_Mesh DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StlMesh_Mesh {
    StlMesh_Mesh* GetObject() {
    return (StlMesh_Mesh*)$self->Access();
    }
};
%feature("shadow") Handle_StlMesh_Mesh::~Handle_StlMesh_Mesh %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_StlMesh_Mesh {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor StlMesh_MeshDomain;
class StlMesh_MeshDomain : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

The mesh deflection is defaulted to Confusion from  
         package Precision.") StlMesh_MeshDomain;
		 StlMesh_MeshDomain ();
		%feature("autodoc", "Args:
	Deflection(Standard_Real)

Returns:
	None

Raised if the deflection is lower than zero  Raised if the deflection  is lower than  Confusion  
         from package Precision") StlMesh_MeshDomain;
		 StlMesh_MeshDomain (const Standard_Real Deflection);
		%feature("autodoc", "Args:
	V1(Standard_Integer)
	V2(Standard_Integer)
	V3(Standard_Integer)
	Xn(Standard_Real)
	Yn(Standard_Real)
	Zn(Standard_Real)

Returns:
	virtual Standard_Integer

Build a triangle with the triplet of vertices (V1,  
         V2, V3).  This triplet defines  the indexes of the  
         vertex in the  current domain The coordinates  Xn,  
         Yn,  Zn  defines   the normal  direction   to  the  
         triangle.  Returns  the  range of  the triangle in  
         the current domain.") AddTriangle;
		virtual Standard_Integer AddTriangle (const Standard_Integer V1,const Standard_Integer V2,const Standard_Integer V3,const Standard_Real Xn,const Standard_Real Yn,const Standard_Real Zn);
		%feature("autodoc", "Args:
	X(Standard_Real)
	Y(Standard_Real)
	Z(Standard_Real)

Returns:
	virtual Standard_Integer

Returns the range of the vertex in the current  
         domain.") AddVertex;
		virtual Standard_Integer AddVertex (const Standard_Real X,const Standard_Real Y,const Standard_Real Z);
		%feature("autodoc", "Args:
	X(Standard_Real)
	Y(Standard_Real)
	Z(Standard_Real)
	IsNew(Standard_Boolean)

Returns:
	virtual Standard_Integer

Returns  the range of   the vertex in  the current  
         domain.  The current vertex is not inserted in the  
         mesh if it already exist.") AddOnlyNewVertex;
		virtual Standard_Integer AddOnlyNewVertex (const Standard_Real X,const Standard_Real Y,const Standard_Real Z,Standard_Boolean & IsNew);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") Deflection;
		Standard_Real Deflection ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Number of triangles in the mesh.") NbTriangles;
		Standard_Integer NbTriangles ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Number of vertices in the mesh.") NbVertices;
		Standard_Integer NbVertices ();
		%feature("autodoc", "Args:
	None
Returns:
	StlMesh_SequenceOfMeshTriangle

Returns the set of triangles of the  current mesh domain") Triangles;
		const StlMesh_SequenceOfMeshTriangle & Triangles ();
		%feature("autodoc", "Args:
	None
Returns:
	TColgp_SequenceOfXYZ

Returns  the coordinates   of the  vertices of the  
         mesh domain   of range <DomainIndex>.   {XV1, YV1,  
         ZV1, XV2, YV2, ZV2, XV3,.....}") Vertices;
		const TColgp_SequenceOfXYZ & Vertices ();
};


%feature("shadow") StlMesh_MeshDomain::~StlMesh_MeshDomain %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend StlMesh_MeshDomain {
	void _kill_pointed() {
		delete $self;
	}
};
%extend StlMesh_MeshDomain {
	Handle_StlMesh_MeshDomain GetHandle() {
	return *(Handle_StlMesh_MeshDomain*) &$self;
	}
};

%nodefaultctor Handle_StlMesh_MeshDomain;
class Handle_StlMesh_MeshDomain : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StlMesh_MeshDomain();
        Handle_StlMesh_MeshDomain(const Handle_StlMesh_MeshDomain &aHandle);
        Handle_StlMesh_MeshDomain(const StlMesh_MeshDomain *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StlMesh_MeshDomain DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StlMesh_MeshDomain {
    StlMesh_MeshDomain* GetObject() {
    return (StlMesh_MeshDomain*)$self->Access();
    }
};
%feature("shadow") Handle_StlMesh_MeshDomain::~Handle_StlMesh_MeshDomain %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_StlMesh_MeshDomain {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor StlMesh_MeshExplorer;
class StlMesh_MeshExplorer {
	public:
		%feature("autodoc", "Args:
	M(Handle_StlMesh_Mesh)

Returns:
	None

No detailed docstring for this function.") StlMesh_MeshExplorer;
		 StlMesh_MeshExplorer (const Handle_StlMesh_Mesh & M);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the mesh deflection of the current domain.") Deflection;
		Standard_Real Deflection ();
		%feature("autodoc", "Args:
	DomainIndex(Standard_Integer)=1

Returns:
	None

Initializes the exploration  of the  triangles  of  
         the mesh domain of range <DomainIndex>.  Raised if <DomainIndex> is lower than 1 or greater  
         than the number of domains.") InitTriangle;
		void InitTriangle (const Standard_Integer DomainIndex = 1);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") MoreTriangle;
		Standard_Boolean MoreTriangle ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Raised if there is no more triangle in the current  
         domain.") NextTriangle;
		void NextTriangle ();
		%feature("autodoc", "Args:
	X1(Standard_Real)
	Y1(Standard_Real)
	Z1(Standard_Real)
	X2(Standard_Real)
	Y2(Standard_Real)
	Z2(Standard_Real)
	X3(Standard_Real)
	Y3(Standard_Real)
	Z3(Standard_Real)

Returns:
	None

Raised if there is no more triangle in the current  
         domain.") TriangleVertices;
		void TriangleVertices (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	Xn(Standard_Real)
	Yn(Standard_Real)
	Zn(Standard_Real)

Returns:
	None

Raised if there is no more triangle in the current  
         domain.") TriangleOrientation;
		void TriangleOrientation (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
};


%feature("shadow") StlMesh_MeshExplorer::~StlMesh_MeshExplorer %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend StlMesh_MeshExplorer {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor StlMesh_MeshTriangle;
class StlMesh_MeshTriangle : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

empty constructor") StlMesh_MeshTriangle;
		 StlMesh_MeshTriangle ();
		%feature("autodoc", "Args:
	V1(Standard_Integer)
	V2(Standard_Integer)
	V3(Standard_Integer)
	Xn(Standard_Real)
	Yn(Standard_Real)
	Zn(Standard_Real)

Returns:
	None

create a triangle defined with the indexes of its three vertices  
         and its orientation  Raised if V1, V2 or V3 is lower than zero") StlMesh_MeshTriangle;
		 StlMesh_MeshTriangle (const Standard_Integer V1,const Standard_Integer V2,const Standard_Integer V3,const Standard_Real Xn,const Standard_Real Yn,const Standard_Real Zn);
		%feature("autodoc", "Args:
	V1(Standard_Integer)
	V2(Standard_Integer)
	V3(Standard_Integer)
	Xn(Standard_Real)
	Yn(Standard_Real)
	Zn(Standard_Real)

Returns:
	None

get indexes of the three vertices (V1,V2,V3) and the orientation") GetVertexAndOrientation;
		void GetVertexAndOrientation (Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	V1(Standard_Integer)
	V2(Standard_Integer)
	V3(Standard_Integer)
	Xn(Standard_Real)
	Yn(Standard_Real)
	Zn(Standard_Real)

Returns:
	None

set indexes of the three vertices (V1,V2,V3) and the orientation  Raised if V1, V2 or V3 is lower than zero") SetVertexAndOrientation;
		void SetVertexAndOrientation (const Standard_Integer V1,const Standard_Integer V2,const Standard_Integer V3,const Standard_Real Xn,const Standard_Real Yn,const Standard_Real Zn);
		%feature("autodoc", "Args:
	V1(Standard_Integer)
	V2(Standard_Integer)
	V3(Standard_Integer)

Returns:
	None

get indexes of the three vertices (V1,V2,V3)") GetVertex;
		void GetVertex (Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	V1(Standard_Integer)
	V2(Standard_Integer)
	V3(Standard_Integer)

Returns:
	None

set indexes of the three vertices (V1,V2,V3)  Raised if V1, V2 or V3 is lower than zero") SetVertex;
		void SetVertex (const Standard_Integer V1,const Standard_Integer V2,const Standard_Integer V3);
};


%feature("shadow") StlMesh_MeshTriangle::~StlMesh_MeshTriangle %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend StlMesh_MeshTriangle {
	void _kill_pointed() {
		delete $self;
	}
};
%extend StlMesh_MeshTriangle {
	Handle_StlMesh_MeshTriangle GetHandle() {
	return *(Handle_StlMesh_MeshTriangle*) &$self;
	}
};

%nodefaultctor Handle_StlMesh_MeshTriangle;
class Handle_StlMesh_MeshTriangle : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_StlMesh_MeshTriangle();
        Handle_StlMesh_MeshTriangle(const Handle_StlMesh_MeshTriangle &aHandle);
        Handle_StlMesh_MeshTriangle(const StlMesh_MeshTriangle *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StlMesh_MeshTriangle DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StlMesh_MeshTriangle {
    StlMesh_MeshTriangle* GetObject() {
    return (StlMesh_MeshTriangle*)$self->Access();
    }
};
%feature("shadow") Handle_StlMesh_MeshTriangle::~Handle_StlMesh_MeshTriangle %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_StlMesh_MeshTriangle {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor StlMesh_SequenceNodeOfSequenceOfMesh;
class StlMesh_SequenceNodeOfSequenceOfMesh : public TCollection_SeqNode {
	public:
		%feature("autodoc", "Args:
	I(Handle_StlMesh_Mesh)
	n(TCollection_SeqNodePtr)
	p(TCollection_SeqNodePtr)

Returns:
	None

No detailed docstring for this function.") StlMesh_SequenceNodeOfSequenceOfMesh;
		 StlMesh_SequenceNodeOfSequenceOfMesh (const Handle_StlMesh_Mesh & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_StlMesh_Mesh

No detailed docstring for this function.") Value;
		Handle_StlMesh_Mesh & Value ();
};


%feature("shadow") StlMesh_SequenceNodeOfSequenceOfMesh::~StlMesh_SequenceNodeOfSequenceOfMesh %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend StlMesh_SequenceNodeOfSequenceOfMesh {
	void _kill_pointed() {
		delete $self;
	}
};
%extend StlMesh_SequenceNodeOfSequenceOfMesh {
	Handle_StlMesh_SequenceNodeOfSequenceOfMesh GetHandle() {
	return *(Handle_StlMesh_SequenceNodeOfSequenceOfMesh*) &$self;
	}
};

%nodefaultctor Handle_StlMesh_SequenceNodeOfSequenceOfMesh;
class Handle_StlMesh_SequenceNodeOfSequenceOfMesh : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_StlMesh_SequenceNodeOfSequenceOfMesh();
        Handle_StlMesh_SequenceNodeOfSequenceOfMesh(const Handle_StlMesh_SequenceNodeOfSequenceOfMesh &aHandle);
        Handle_StlMesh_SequenceNodeOfSequenceOfMesh(const StlMesh_SequenceNodeOfSequenceOfMesh *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StlMesh_SequenceNodeOfSequenceOfMesh DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StlMesh_SequenceNodeOfSequenceOfMesh {
    StlMesh_SequenceNodeOfSequenceOfMesh* GetObject() {
    return (StlMesh_SequenceNodeOfSequenceOfMesh*)$self->Access();
    }
};
%feature("shadow") Handle_StlMesh_SequenceNodeOfSequenceOfMesh::~Handle_StlMesh_SequenceNodeOfSequenceOfMesh %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_StlMesh_SequenceNodeOfSequenceOfMesh {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor StlMesh_SequenceNodeOfSequenceOfMeshDomain;
class StlMesh_SequenceNodeOfSequenceOfMeshDomain : public TCollection_SeqNode {
	public:
		%feature("autodoc", "Args:
	I(Handle_StlMesh_MeshDomain)
	n(TCollection_SeqNodePtr)
	p(TCollection_SeqNodePtr)

Returns:
	None

No detailed docstring for this function.") StlMesh_SequenceNodeOfSequenceOfMeshDomain;
		 StlMesh_SequenceNodeOfSequenceOfMeshDomain (const Handle_StlMesh_MeshDomain & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_StlMesh_MeshDomain

No detailed docstring for this function.") Value;
		Handle_StlMesh_MeshDomain & Value ();
};


%feature("shadow") StlMesh_SequenceNodeOfSequenceOfMeshDomain::~StlMesh_SequenceNodeOfSequenceOfMeshDomain %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend StlMesh_SequenceNodeOfSequenceOfMeshDomain {
	void _kill_pointed() {
		delete $self;
	}
};
%extend StlMesh_SequenceNodeOfSequenceOfMeshDomain {
	Handle_StlMesh_SequenceNodeOfSequenceOfMeshDomain GetHandle() {
	return *(Handle_StlMesh_SequenceNodeOfSequenceOfMeshDomain*) &$self;
	}
};

%nodefaultctor Handle_StlMesh_SequenceNodeOfSequenceOfMeshDomain;
class Handle_StlMesh_SequenceNodeOfSequenceOfMeshDomain : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_StlMesh_SequenceNodeOfSequenceOfMeshDomain();
        Handle_StlMesh_SequenceNodeOfSequenceOfMeshDomain(const Handle_StlMesh_SequenceNodeOfSequenceOfMeshDomain &aHandle);
        Handle_StlMesh_SequenceNodeOfSequenceOfMeshDomain(const StlMesh_SequenceNodeOfSequenceOfMeshDomain *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StlMesh_SequenceNodeOfSequenceOfMeshDomain DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StlMesh_SequenceNodeOfSequenceOfMeshDomain {
    StlMesh_SequenceNodeOfSequenceOfMeshDomain* GetObject() {
    return (StlMesh_SequenceNodeOfSequenceOfMeshDomain*)$self->Access();
    }
};
%feature("shadow") Handle_StlMesh_SequenceNodeOfSequenceOfMeshDomain::~Handle_StlMesh_SequenceNodeOfSequenceOfMeshDomain %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_StlMesh_SequenceNodeOfSequenceOfMeshDomain {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor StlMesh_SequenceNodeOfSequenceOfMeshTriangle;
class StlMesh_SequenceNodeOfSequenceOfMeshTriangle : public TCollection_SeqNode {
	public:
		%feature("autodoc", "Args:
	I(Handle_StlMesh_MeshTriangle)
	n(TCollection_SeqNodePtr)
	p(TCollection_SeqNodePtr)

Returns:
	None

No detailed docstring for this function.") StlMesh_SequenceNodeOfSequenceOfMeshTriangle;
		 StlMesh_SequenceNodeOfSequenceOfMeshTriangle (const Handle_StlMesh_MeshTriangle & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_StlMesh_MeshTriangle

No detailed docstring for this function.") Value;
		Handle_StlMesh_MeshTriangle & Value ();
};


%feature("shadow") StlMesh_SequenceNodeOfSequenceOfMeshTriangle::~StlMesh_SequenceNodeOfSequenceOfMeshTriangle %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend StlMesh_SequenceNodeOfSequenceOfMeshTriangle {
	void _kill_pointed() {
		delete $self;
	}
};
%extend StlMesh_SequenceNodeOfSequenceOfMeshTriangle {
	Handle_StlMesh_SequenceNodeOfSequenceOfMeshTriangle GetHandle() {
	return *(Handle_StlMesh_SequenceNodeOfSequenceOfMeshTriangle*) &$self;
	}
};

%nodefaultctor Handle_StlMesh_SequenceNodeOfSequenceOfMeshTriangle;
class Handle_StlMesh_SequenceNodeOfSequenceOfMeshTriangle : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_StlMesh_SequenceNodeOfSequenceOfMeshTriangle();
        Handle_StlMesh_SequenceNodeOfSequenceOfMeshTriangle(const Handle_StlMesh_SequenceNodeOfSequenceOfMeshTriangle &aHandle);
        Handle_StlMesh_SequenceNodeOfSequenceOfMeshTriangle(const StlMesh_SequenceNodeOfSequenceOfMeshTriangle *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_StlMesh_SequenceNodeOfSequenceOfMeshTriangle DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StlMesh_SequenceNodeOfSequenceOfMeshTriangle {
    StlMesh_SequenceNodeOfSequenceOfMeshTriangle* GetObject() {
    return (StlMesh_SequenceNodeOfSequenceOfMeshTriangle*)$self->Access();
    }
};
%feature("shadow") Handle_StlMesh_SequenceNodeOfSequenceOfMeshTriangle::~Handle_StlMesh_SequenceNodeOfSequenceOfMeshTriangle %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_StlMesh_SequenceNodeOfSequenceOfMeshTriangle {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor StlMesh_SequenceOfMesh;
class StlMesh_SequenceOfMesh : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") StlMesh_SequenceOfMesh;
		 StlMesh_SequenceOfMesh ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	Other(StlMesh_SequenceOfMesh)

Returns:
	StlMesh_SequenceOfMesh

No detailed docstring for this function.") Assign;
		const StlMesh_SequenceOfMesh & Assign (const StlMesh_SequenceOfMesh & Other);
		%feature("autodoc", "Args:
	Other(StlMesh_SequenceOfMesh)

Returns:
	StlMesh_SequenceOfMesh

No detailed docstring for this function.") operator=;
		const StlMesh_SequenceOfMesh & operator = (const StlMesh_SequenceOfMesh & Other);
		%feature("autodoc", "Args:
	T(Handle_StlMesh_Mesh)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_StlMesh_Mesh & T);
		%feature("autodoc", "Args:
	S(StlMesh_SequenceOfMesh)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (StlMesh_SequenceOfMesh & S);
		%feature("autodoc", "Args:
	T(Handle_StlMesh_Mesh)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_StlMesh_Mesh & T);
		%feature("autodoc", "Args:
	S(StlMesh_SequenceOfMesh)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (StlMesh_SequenceOfMesh & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Handle_StlMesh_Mesh)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_StlMesh_Mesh & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(StlMesh_SequenceOfMesh)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,StlMesh_SequenceOfMesh & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Handle_StlMesh_Mesh)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_StlMesh_Mesh & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(StlMesh_SequenceOfMesh)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,StlMesh_SequenceOfMesh & S);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_StlMesh_Mesh

No detailed docstring for this function.") First;
		const Handle_StlMesh_Mesh & First ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_StlMesh_Mesh

No detailed docstring for this function.") Last;
		const Handle_StlMesh_Mesh & Last ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Sub(StlMesh_SequenceOfMesh)

Returns:
	None

No detailed docstring for this function.") Split;
		void Split (const Standard_Integer Index,StlMesh_SequenceOfMesh & Sub);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_StlMesh_Mesh

No detailed docstring for this function.") Value;
		const Handle_StlMesh_Mesh & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	I(Handle_StlMesh_Mesh)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_StlMesh_Mesh & I);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_StlMesh_Mesh

No detailed docstring for this function.") ChangeValue;
		Handle_StlMesh_Mesh & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer Index);
		%feature("autodoc", "Args:
	FromIndex(Standard_Integer)
	ToIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%feature("shadow") StlMesh_SequenceOfMesh::~StlMesh_SequenceOfMesh %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend StlMesh_SequenceOfMesh {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor StlMesh_SequenceOfMeshDomain;
class StlMesh_SequenceOfMeshDomain : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") StlMesh_SequenceOfMeshDomain;
		 StlMesh_SequenceOfMeshDomain ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	Other(StlMesh_SequenceOfMeshDomain)

Returns:
	StlMesh_SequenceOfMeshDomain

No detailed docstring for this function.") Assign;
		const StlMesh_SequenceOfMeshDomain & Assign (const StlMesh_SequenceOfMeshDomain & Other);
		%feature("autodoc", "Args:
	Other(StlMesh_SequenceOfMeshDomain)

Returns:
	StlMesh_SequenceOfMeshDomain

No detailed docstring for this function.") operator=;
		const StlMesh_SequenceOfMeshDomain & operator = (const StlMesh_SequenceOfMeshDomain & Other);
		%feature("autodoc", "Args:
	T(Handle_StlMesh_MeshDomain)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_StlMesh_MeshDomain & T);
		%feature("autodoc", "Args:
	S(StlMesh_SequenceOfMeshDomain)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (StlMesh_SequenceOfMeshDomain & S);
		%feature("autodoc", "Args:
	T(Handle_StlMesh_MeshDomain)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_StlMesh_MeshDomain & T);
		%feature("autodoc", "Args:
	S(StlMesh_SequenceOfMeshDomain)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (StlMesh_SequenceOfMeshDomain & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Handle_StlMesh_MeshDomain)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_StlMesh_MeshDomain & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(StlMesh_SequenceOfMeshDomain)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,StlMesh_SequenceOfMeshDomain & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Handle_StlMesh_MeshDomain)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_StlMesh_MeshDomain & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(StlMesh_SequenceOfMeshDomain)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,StlMesh_SequenceOfMeshDomain & S);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_StlMesh_MeshDomain

No detailed docstring for this function.") First;
		const Handle_StlMesh_MeshDomain & First ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_StlMesh_MeshDomain

No detailed docstring for this function.") Last;
		const Handle_StlMesh_MeshDomain & Last ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Sub(StlMesh_SequenceOfMeshDomain)

Returns:
	None

No detailed docstring for this function.") Split;
		void Split (const Standard_Integer Index,StlMesh_SequenceOfMeshDomain & Sub);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_StlMesh_MeshDomain

No detailed docstring for this function.") Value;
		const Handle_StlMesh_MeshDomain & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	I(Handle_StlMesh_MeshDomain)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_StlMesh_MeshDomain & I);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_StlMesh_MeshDomain

No detailed docstring for this function.") ChangeValue;
		Handle_StlMesh_MeshDomain & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer Index);
		%feature("autodoc", "Args:
	FromIndex(Standard_Integer)
	ToIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%feature("shadow") StlMesh_SequenceOfMeshDomain::~StlMesh_SequenceOfMeshDomain %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend StlMesh_SequenceOfMeshDomain {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor StlMesh_SequenceOfMeshTriangle;
class StlMesh_SequenceOfMeshTriangle : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") StlMesh_SequenceOfMeshTriangle;
		 StlMesh_SequenceOfMeshTriangle ();
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Clear;
		void Clear ();
		%feature("autodoc", "Args:
	Other(StlMesh_SequenceOfMeshTriangle)

Returns:
	StlMesh_SequenceOfMeshTriangle

No detailed docstring for this function.") Assign;
		const StlMesh_SequenceOfMeshTriangle & Assign (const StlMesh_SequenceOfMeshTriangle & Other);
		%feature("autodoc", "Args:
	Other(StlMesh_SequenceOfMeshTriangle)

Returns:
	StlMesh_SequenceOfMeshTriangle

No detailed docstring for this function.") operator=;
		const StlMesh_SequenceOfMeshTriangle & operator = (const StlMesh_SequenceOfMeshTriangle & Other);
		%feature("autodoc", "Args:
	T(Handle_StlMesh_MeshTriangle)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (const Handle_StlMesh_MeshTriangle & T);
		%feature("autodoc", "Args:
	S(StlMesh_SequenceOfMeshTriangle)

Returns:
	None

No detailed docstring for this function.") Append;
		void Append (StlMesh_SequenceOfMeshTriangle & S);
		%feature("autodoc", "Args:
	T(Handle_StlMesh_MeshTriangle)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (const Handle_StlMesh_MeshTriangle & T);
		%feature("autodoc", "Args:
	S(StlMesh_SequenceOfMeshTriangle)

Returns:
	None

No detailed docstring for this function.") Prepend;
		void Prepend (StlMesh_SequenceOfMeshTriangle & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Handle_StlMesh_MeshTriangle)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_StlMesh_MeshTriangle & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(StlMesh_SequenceOfMeshTriangle)

Returns:
	None

No detailed docstring for this function.") InsertBefore;
		void InsertBefore (const Standard_Integer Index,StlMesh_SequenceOfMeshTriangle & S);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	T(Handle_StlMesh_MeshTriangle)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_StlMesh_MeshTriangle & T);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	S(StlMesh_SequenceOfMeshTriangle)

Returns:
	None

No detailed docstring for this function.") InsertAfter;
		void InsertAfter (const Standard_Integer Index,StlMesh_SequenceOfMeshTriangle & S);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_StlMesh_MeshTriangle

No detailed docstring for this function.") First;
		const Handle_StlMesh_MeshTriangle & First ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_StlMesh_MeshTriangle

No detailed docstring for this function.") Last;
		const Handle_StlMesh_MeshTriangle & Last ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Sub(StlMesh_SequenceOfMeshTriangle)

Returns:
	None

No detailed docstring for this function.") Split;
		void Split (const Standard_Integer Index,StlMesh_SequenceOfMeshTriangle & Sub);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_StlMesh_MeshTriangle

No detailed docstring for this function.") Value;
		const Handle_StlMesh_MeshTriangle & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	I(Handle_StlMesh_MeshTriangle)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_StlMesh_MeshTriangle & I);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Handle_StlMesh_MeshTriangle

No detailed docstring for this function.") ChangeValue;
		Handle_StlMesh_MeshTriangle & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer Index);
		%feature("autodoc", "Args:
	FromIndex(Standard_Integer)
	ToIndex(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%feature("shadow") StlMesh_SequenceOfMeshTriangle::~StlMesh_SequenceOfMeshTriangle %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend StlMesh_SequenceOfMeshTriangle {
	void _kill_pointed() {
		delete $self;
	}
};
