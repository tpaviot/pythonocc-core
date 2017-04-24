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
%module (package="OCC") StlMesh

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


%include StlMesh_headers.i


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

%rename(stlmesh) StlMesh;
class StlMesh {
	public:
		%feature("compactdefaultargs") Merge;
		%feature("autodoc", "	* Sequence of meshes Make a merge of two Mesh and returns a new Mesh. Very useful if you want to merge partMesh and CheckSurfaceMesh for example

	:param mesh1:
	:type mesh1: Handle_StlMesh_Mesh &
	:param mesh2:
	:type mesh2: Handle_StlMesh_Mesh &
	:rtype: Handle_StlMesh_Mesh
") Merge;
		static Handle_StlMesh_Mesh Merge (const Handle_StlMesh_Mesh & mesh1,const Handle_StlMesh_Mesh & mesh2);
};


%extend StlMesh {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StlMesh_Mesh;
class StlMesh_Mesh : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StlMesh_Mesh;
		%feature("autodoc", "	* Creates an empty mesh.

	:rtype: None
") StlMesh_Mesh;
		 StlMesh_Mesh ();
		%feature("compactdefaultargs") AddDomain;
		%feature("autodoc", "	* Adds a new mesh domain. The mesh deflection is defaulted to Confusion from package Precision.

	:rtype: void
") AddDomain;
		virtual void AddDomain ();
		%feature("compactdefaultargs") AddDomain;
		%feature("autodoc", "	* Adds a new mesh domain. Raised if the deflection is lower than zero Raised if the deflection is lower than Confusion from package Precision

	:param Deflection:
	:type Deflection: float
	:rtype: void
") AddDomain;
		virtual void AddDomain (const Standard_Real Deflection);
		%feature("compactdefaultargs") AddTriangle;
		%feature("autodoc", "	* Build a triangle with the triplet of vertices (V1, V2, V3). This triplet defines the indexes of the vertex in the current domain The coordinates Xn, Yn, Zn defines the normal direction to the triangle. Returns the range of the triangle in the current domain.

	:param V1:
	:type V1: int
	:param V2:
	:type V2: int
	:param V3:
	:type V3: int
	:param Xn:
	:type Xn: float
	:param Yn:
	:type Yn: float
	:param Zn:
	:type Zn: float
	:rtype: int
") AddTriangle;
		virtual Standard_Integer AddTriangle (const Standard_Integer V1,const Standard_Integer V2,const Standard_Integer V3,const Standard_Real Xn,const Standard_Real Yn,const Standard_Real Zn);
		%feature("compactdefaultargs") AddVertex;
		%feature("autodoc", "	* Returns the range of the vertex in the current domain.

	:param X:
	:type X: float
	:param Y:
	:type Y: float
	:param Z:
	:type Z: float
	:rtype: int
") AddVertex;
		virtual Standard_Integer AddVertex (const Standard_Real X,const Standard_Real Y,const Standard_Real Z);
		%feature("compactdefaultargs") AddOnlyNewVertex;
		%feature("autodoc", "	* Returns the range of the vertex in the current domain. The current vertex is not inserted in the mesh if it already exist.

	:param X:
	:type X: float
	:param Y:
	:type Y: float
	:param Z:
	:type Z: float
	:rtype: int
") AddOnlyNewVertex;
		virtual Standard_Integer AddOnlyNewVertex (const Standard_Real X,const Standard_Real Y,const Standard_Real Z);
		%feature("compactdefaultargs") Bounds;
		%feature("autodoc", "	* Each vertex of the mesh verifies the following relations : XYZMin.X() <= X <= XYZMax.X() XYZMin.Y() <= Y <= XYZMax.y() XYZMin.Z() <= Z <= XYZMax.Z()

	:param XYZmax:
	:type XYZmax: gp_XYZ
	:param XYZmin:
	:type XYZmin: gp_XYZ
	:rtype: void
") Bounds;
		virtual void Bounds (gp_XYZ & XYZmax,gp_XYZ & XYZmin);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: void
") Clear;
		virtual void Clear ();
		%feature("compactdefaultargs") Deflection;
		%feature("autodoc", "	* Returns the deflection of the mesh of the domain of range <DomainIndex>. Raised if <DomainIndex> is lower than 1 or greater than the number of domains.

	:param DomainIndex:
	:type DomainIndex: int
	:rtype: float
") Deflection;
		virtual Standard_Real Deflection (const Standard_Integer DomainIndex);
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") NbDomains;
		%feature("autodoc", "	* Number of domains in the mesh.

	:rtype: int
") NbDomains;
		Standard_Integer NbDomains ();
		%feature("compactdefaultargs") NbTriangles;
		%feature("autodoc", "	* Cumulative Number of triangles in the mesh.

	:rtype: int
") NbTriangles;
		Standard_Integer NbTriangles ();
		%feature("compactdefaultargs") NbTriangles;
		%feature("autodoc", "	* Number of triangles in the domain of range <DomainIndex>. Raised if <DomainIndex> is lower than 1 or greater than the number of domains.

	:param DomainIndex:
	:type DomainIndex: int
	:rtype: int
") NbTriangles;
		virtual Standard_Integer NbTriangles (const Standard_Integer DomainIndex);
		%feature("compactdefaultargs") NbVertices;
		%feature("autodoc", "	* Cumulative Number of vertices in the mesh.

	:rtype: int
") NbVertices;
		Standard_Integer NbVertices ();
		%feature("compactdefaultargs") NbVertices;
		%feature("autodoc", "	* Number of vertices in the domain of range <DomainIndex>. Raised if <DomainIndex> is lower than 1 or greater than the number of domains.

	:param DomainIndex:
	:type DomainIndex: int
	:rtype: int
") NbVertices;
		virtual Standard_Integer NbVertices (const Standard_Integer DomainIndex);
		%feature("compactdefaultargs") Triangles;
		%feature("autodoc", "	* Returns the set of triangle of the mesh domain of range <DomainIndex>. Raised if <DomainIndex> is lower than 1 or greater than the number of domains.

	:param DomainIndex: default value is 1
	:type DomainIndex: int
	:rtype: StlMesh_SequenceOfMeshTriangle
") Triangles;
		virtual const StlMesh_SequenceOfMeshTriangle & Triangles (const Standard_Integer DomainIndex = 1);
		%feature("compactdefaultargs") Vertices;
		%feature("autodoc", "	* Returns the coordinates of the vertices of the mesh domain of range <DomainIndex>. {XV1, YV1, ZV1, XV2, YV2, ZV2, XV3,.....} Raised if <DomainIndex> is lower than 1 or greater than the number of domains.

	:param DomainIndex: default value is 1
	:type DomainIndex: int
	:rtype: TColgp_SequenceOfXYZ
") Vertices;
		virtual const TColgp_SequenceOfXYZ & Vertices (const Standard_Integer DomainIndex = 1);
};


%extend StlMesh_Mesh {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StlMesh_Mesh(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StlMesh_Mesh::Handle_StlMesh_Mesh %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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
    StlMesh_Mesh* _get_reference() {
    return (StlMesh_Mesh*)$self->Access();
    }
};

%extend Handle_StlMesh_Mesh {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StlMesh_Mesh {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StlMesh_MeshDomain;
class StlMesh_MeshDomain : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StlMesh_MeshDomain;
		%feature("autodoc", "	* The mesh deflection is defaulted to Confusion from package Precision.

	:rtype: None
") StlMesh_MeshDomain;
		 StlMesh_MeshDomain ();
		%feature("compactdefaultargs") StlMesh_MeshDomain;
		%feature("autodoc", "	* Raised if the deflection is lower than zero Raised if the deflection is lower than Confusion from package Precision

	:param Deflection:
	:type Deflection: float
	:rtype: None
") StlMesh_MeshDomain;
		 StlMesh_MeshDomain (const Standard_Real Deflection);
		%feature("compactdefaultargs") AddTriangle;
		%feature("autodoc", "	* Build a triangle with the triplet of vertices (V1, V2, V3). This triplet defines the indexes of the vertex in the current domain The coordinates Xn, Yn, Zn defines the normal direction to the triangle. Returns the range of the triangle in the current domain.

	:param V1:
	:type V1: int
	:param V2:
	:type V2: int
	:param V3:
	:type V3: int
	:param Xn:
	:type Xn: float
	:param Yn:
	:type Yn: float
	:param Zn:
	:type Zn: float
	:rtype: int
") AddTriangle;
		virtual Standard_Integer AddTriangle (const Standard_Integer V1,const Standard_Integer V2,const Standard_Integer V3,const Standard_Real Xn,const Standard_Real Yn,const Standard_Real Zn);
		%feature("compactdefaultargs") AddVertex;
		%feature("autodoc", "	* Returns the range of the vertex in the current domain.

	:param X:
	:type X: float
	:param Y:
	:type Y: float
	:param Z:
	:type Z: float
	:rtype: int
") AddVertex;
		virtual Standard_Integer AddVertex (const Standard_Real X,const Standard_Real Y,const Standard_Real Z);
		%feature("compactdefaultargs") AddOnlyNewVertex;
		%feature("autodoc", "	* Returns the range of the vertex in the current domain. The current vertex is not inserted in the mesh if it already exist.

	:param X:
	:type X: float
	:param Y:
	:type Y: float
	:param Z:
	:type Z: float
	:param IsNew:
	:type IsNew: bool
	:rtype: int
") AddOnlyNewVertex;
		virtual Standard_Integer AddOnlyNewVertex (const Standard_Real X,const Standard_Real Y,const Standard_Real Z,Standard_Boolean &OutValue);
		%feature("compactdefaultargs") Deflection;
		%feature("autodoc", "	:rtype: float
") Deflection;
		Standard_Real Deflection ();
		%feature("compactdefaultargs") NbTriangles;
		%feature("autodoc", "	* Number of triangles in the mesh.

	:rtype: int
") NbTriangles;
		Standard_Integer NbTriangles ();
		%feature("compactdefaultargs") NbVertices;
		%feature("autodoc", "	* Number of vertices in the mesh.

	:rtype: int
") NbVertices;
		Standard_Integer NbVertices ();
		%feature("compactdefaultargs") Triangles;
		%feature("autodoc", "	* Returns the set of triangles of the current mesh domain

	:rtype: StlMesh_SequenceOfMeshTriangle
") Triangles;
		const StlMesh_SequenceOfMeshTriangle & Triangles ();
		%feature("compactdefaultargs") Vertices;
		%feature("autodoc", "	* Returns the coordinates of the vertices of the mesh domain of range <DomainIndex>. {XV1, YV1, ZV1, XV2, YV2, ZV2, XV3,.....}

	:rtype: TColgp_SequenceOfXYZ
") Vertices;
		const TColgp_SequenceOfXYZ & Vertices ();
};


%extend StlMesh_MeshDomain {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StlMesh_MeshDomain(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StlMesh_MeshDomain::Handle_StlMesh_MeshDomain %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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
    StlMesh_MeshDomain* _get_reference() {
    return (StlMesh_MeshDomain*)$self->Access();
    }
};

%extend Handle_StlMesh_MeshDomain {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StlMesh_MeshDomain {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StlMesh_MeshExplorer;
class StlMesh_MeshExplorer {
	public:
		%feature("compactdefaultargs") StlMesh_MeshExplorer;
		%feature("autodoc", "	:param M:
	:type M: Handle_StlMesh_Mesh &
	:rtype: None
") StlMesh_MeshExplorer;
		 StlMesh_MeshExplorer (const Handle_StlMesh_Mesh & M);
		%feature("compactdefaultargs") Deflection;
		%feature("autodoc", "	* Returns the mesh deflection of the current domain.

	:rtype: float
") Deflection;
		Standard_Real Deflection ();
		%feature("compactdefaultargs") InitTriangle;
		%feature("autodoc", "	* Initializes the exploration of the triangles of the mesh domain of range <DomainIndex>. Raised if <DomainIndex> is lower than 1 or greater than the number of domains.

	:param DomainIndex: default value is 1
	:type DomainIndex: int
	:rtype: None
") InitTriangle;
		void InitTriangle (const Standard_Integer DomainIndex = 1);
		%feature("compactdefaultargs") MoreTriangle;
		%feature("autodoc", "	:rtype: bool
") MoreTriangle;
		Standard_Boolean MoreTriangle ();
		%feature("compactdefaultargs") NextTriangle;
		%feature("autodoc", "	* Raised if there is no more triangle in the current domain.

	:rtype: None
") NextTriangle;
		void NextTriangle ();
		%feature("compactdefaultargs") TriangleVertices;
		%feature("autodoc", "	* Raised if there is no more triangle in the current domain.

	:param X1:
	:type X1: float &
	:param Y1:
	:type Y1: float &
	:param Z1:
	:type Z1: float &
	:param X2:
	:type X2: float &
	:param Y2:
	:type Y2: float &
	:param Z2:
	:type Z2: float &
	:param X3:
	:type X3: float &
	:param Y3:
	:type Y3: float &
	:param Z3:
	:type Z3: float &
	:rtype: None
") TriangleVertices;
		void TriangleVertices (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") TriangleOrientation;
		%feature("autodoc", "	* Raised if there is no more triangle in the current domain.

	:param Xn:
	:type Xn: float &
	:param Yn:
	:type Yn: float &
	:param Zn:
	:type Zn: float &
	:rtype: None
") TriangleOrientation;
		void TriangleOrientation (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
};


%extend StlMesh_MeshExplorer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StlMesh_MeshTriangle;
class StlMesh_MeshTriangle : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") StlMesh_MeshTriangle;
		%feature("autodoc", "	* empty constructor

	:rtype: None
") StlMesh_MeshTriangle;
		 StlMesh_MeshTriangle ();
		%feature("compactdefaultargs") StlMesh_MeshTriangle;
		%feature("autodoc", "	* create a triangle defined with the indexes of its three vertices and its orientation Raised if V1, V2 or V3 is lower than zero

	:param V1:
	:type V1: int
	:param V2:
	:type V2: int
	:param V3:
	:type V3: int
	:param Xn:
	:type Xn: float
	:param Yn:
	:type Yn: float
	:param Zn:
	:type Zn: float
	:rtype: None
") StlMesh_MeshTriangle;
		 StlMesh_MeshTriangle (const Standard_Integer V1,const Standard_Integer V2,const Standard_Integer V3,const Standard_Real Xn,const Standard_Real Yn,const Standard_Real Zn);
		%feature("compactdefaultargs") GetVertexAndOrientation;
		%feature("autodoc", "	* get indexes of the three vertices (V1,V2,V3) and the orientation

	:param V1:
	:type V1: int &
	:param V2:
	:type V2: int &
	:param V3:
	:type V3: int &
	:param Xn:
	:type Xn: float &
	:param Yn:
	:type Yn: float &
	:param Zn:
	:type Zn: float &
	:rtype: None
") GetVertexAndOrientation;
		void GetVertexAndOrientation (Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") SetVertexAndOrientation;
		%feature("autodoc", "	* set indexes of the three vertices (V1,V2,V3) and the orientation Raised if V1, V2 or V3 is lower than zero

	:param V1:
	:type V1: int
	:param V2:
	:type V2: int
	:param V3:
	:type V3: int
	:param Xn:
	:type Xn: float
	:param Yn:
	:type Yn: float
	:param Zn:
	:type Zn: float
	:rtype: None
") SetVertexAndOrientation;
		void SetVertexAndOrientation (const Standard_Integer V1,const Standard_Integer V2,const Standard_Integer V3,const Standard_Real Xn,const Standard_Real Yn,const Standard_Real Zn);
		%feature("compactdefaultargs") GetVertex;
		%feature("autodoc", "	* get indexes of the three vertices (V1,V2,V3)

	:param V1:
	:type V1: int &
	:param V2:
	:type V2: int &
	:param V3:
	:type V3: int &
	:rtype: None
") GetVertex;
		void GetVertex (Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("compactdefaultargs") SetVertex;
		%feature("autodoc", "	* set indexes of the three vertices (V1,V2,V3) Raised if V1, V2 or V3 is lower than zero

	:param V1:
	:type V1: int
	:param V2:
	:type V2: int
	:param V3:
	:type V3: int
	:rtype: None
") SetVertex;
		void SetVertex (const Standard_Integer V1,const Standard_Integer V2,const Standard_Integer V3);
};


%extend StlMesh_MeshTriangle {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StlMesh_MeshTriangle(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StlMesh_MeshTriangle::Handle_StlMesh_MeshTriangle %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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
    StlMesh_MeshTriangle* _get_reference() {
    return (StlMesh_MeshTriangle*)$self->Access();
    }
};

%extend Handle_StlMesh_MeshTriangle {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StlMesh_MeshTriangle {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StlMesh_SequenceNodeOfSequenceOfMesh;
class StlMesh_SequenceNodeOfSequenceOfMesh : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") StlMesh_SequenceNodeOfSequenceOfMesh;
		%feature("autodoc", "	:param I:
	:type I: Handle_StlMesh_Mesh &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") StlMesh_SequenceNodeOfSequenceOfMesh;
		 StlMesh_SequenceNodeOfSequenceOfMesh (const Handle_StlMesh_Mesh & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_StlMesh_Mesh
") Value;
		Handle_StlMesh_Mesh Value ();
};


%extend StlMesh_SequenceNodeOfSequenceOfMesh {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StlMesh_SequenceNodeOfSequenceOfMesh(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StlMesh_SequenceNodeOfSequenceOfMesh::Handle_StlMesh_SequenceNodeOfSequenceOfMesh %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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
    StlMesh_SequenceNodeOfSequenceOfMesh* _get_reference() {
    return (StlMesh_SequenceNodeOfSequenceOfMesh*)$self->Access();
    }
};

%extend Handle_StlMesh_SequenceNodeOfSequenceOfMesh {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StlMesh_SequenceNodeOfSequenceOfMesh {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StlMesh_SequenceNodeOfSequenceOfMeshDomain;
class StlMesh_SequenceNodeOfSequenceOfMeshDomain : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") StlMesh_SequenceNodeOfSequenceOfMeshDomain;
		%feature("autodoc", "	:param I:
	:type I: Handle_StlMesh_MeshDomain &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") StlMesh_SequenceNodeOfSequenceOfMeshDomain;
		 StlMesh_SequenceNodeOfSequenceOfMeshDomain (const Handle_StlMesh_MeshDomain & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_StlMesh_MeshDomain
") Value;
		Handle_StlMesh_MeshDomain Value ();
};


%extend StlMesh_SequenceNodeOfSequenceOfMeshDomain {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StlMesh_SequenceNodeOfSequenceOfMeshDomain(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StlMesh_SequenceNodeOfSequenceOfMeshDomain::Handle_StlMesh_SequenceNodeOfSequenceOfMeshDomain %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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
    StlMesh_SequenceNodeOfSequenceOfMeshDomain* _get_reference() {
    return (StlMesh_SequenceNodeOfSequenceOfMeshDomain*)$self->Access();
    }
};

%extend Handle_StlMesh_SequenceNodeOfSequenceOfMeshDomain {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StlMesh_SequenceNodeOfSequenceOfMeshDomain {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StlMesh_SequenceNodeOfSequenceOfMeshTriangle;
class StlMesh_SequenceNodeOfSequenceOfMeshTriangle : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") StlMesh_SequenceNodeOfSequenceOfMeshTriangle;
		%feature("autodoc", "	:param I:
	:type I: Handle_StlMesh_MeshTriangle &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") StlMesh_SequenceNodeOfSequenceOfMeshTriangle;
		 StlMesh_SequenceNodeOfSequenceOfMeshTriangle (const Handle_StlMesh_MeshTriangle & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Handle_StlMesh_MeshTriangle
") Value;
		Handle_StlMesh_MeshTriangle Value ();
};


%extend StlMesh_SequenceNodeOfSequenceOfMeshTriangle {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_StlMesh_SequenceNodeOfSequenceOfMeshTriangle(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_StlMesh_SequenceNodeOfSequenceOfMeshTriangle::Handle_StlMesh_SequenceNodeOfSequenceOfMeshTriangle %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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
    StlMesh_SequenceNodeOfSequenceOfMeshTriangle* _get_reference() {
    return (StlMesh_SequenceNodeOfSequenceOfMeshTriangle*)$self->Access();
    }
};

%extend Handle_StlMesh_SequenceNodeOfSequenceOfMeshTriangle {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend StlMesh_SequenceNodeOfSequenceOfMeshTriangle {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StlMesh_SequenceOfMesh;
class StlMesh_SequenceOfMesh : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") StlMesh_SequenceOfMesh;
		%feature("autodoc", "	:rtype: None
") StlMesh_SequenceOfMesh;
		 StlMesh_SequenceOfMesh ();
		%feature("compactdefaultargs") StlMesh_SequenceOfMesh;
		%feature("autodoc", "	:param Other:
	:type Other: StlMesh_SequenceOfMesh &
	:rtype: None
") StlMesh_SequenceOfMesh;
		 StlMesh_SequenceOfMesh (const StlMesh_SequenceOfMesh & Other);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: StlMesh_SequenceOfMesh &
	:rtype: StlMesh_SequenceOfMesh
") Assign;
		const StlMesh_SequenceOfMesh & Assign (const StlMesh_SequenceOfMesh & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: StlMesh_SequenceOfMesh &
	:rtype: StlMesh_SequenceOfMesh
") operator =;
		const StlMesh_SequenceOfMesh & operator = (const StlMesh_SequenceOfMesh & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: Handle_StlMesh_Mesh &
	:rtype: None
") Append;
		void Append (const Handle_StlMesh_Mesh & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: StlMesh_SequenceOfMesh &
	:rtype: None
") Append;
		void Append (StlMesh_SequenceOfMesh & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: Handle_StlMesh_Mesh &
	:rtype: None
") Prepend;
		void Prepend (const Handle_StlMesh_Mesh & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: StlMesh_SequenceOfMesh &
	:rtype: None
") Prepend;
		void Prepend (StlMesh_SequenceOfMesh & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_StlMesh_Mesh &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_StlMesh_Mesh & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: StlMesh_SequenceOfMesh &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,StlMesh_SequenceOfMesh & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_StlMesh_Mesh &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_StlMesh_Mesh & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: StlMesh_SequenceOfMesh &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,StlMesh_SequenceOfMesh & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: Handle_StlMesh_Mesh
") First;
		Handle_StlMesh_Mesh First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: Handle_StlMesh_Mesh
") Last;
		Handle_StlMesh_Mesh Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: StlMesh_SequenceOfMesh &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,StlMesh_SequenceOfMesh & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StlMesh_Mesh
") Value;
		Handle_StlMesh_Mesh Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: Handle_StlMesh_Mesh &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_StlMesh_Mesh & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StlMesh_Mesh
") ChangeValue;
		Handle_StlMesh_Mesh ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param FromIndex:
	:type FromIndex: int
	:param ToIndex:
	:type ToIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%extend StlMesh_SequenceOfMesh {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StlMesh_SequenceOfMeshDomain;
class StlMesh_SequenceOfMeshDomain : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") StlMesh_SequenceOfMeshDomain;
		%feature("autodoc", "	:rtype: None
") StlMesh_SequenceOfMeshDomain;
		 StlMesh_SequenceOfMeshDomain ();
		%feature("compactdefaultargs") StlMesh_SequenceOfMeshDomain;
		%feature("autodoc", "	:param Other:
	:type Other: StlMesh_SequenceOfMeshDomain &
	:rtype: None
") StlMesh_SequenceOfMeshDomain;
		 StlMesh_SequenceOfMeshDomain (const StlMesh_SequenceOfMeshDomain & Other);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: StlMesh_SequenceOfMeshDomain &
	:rtype: StlMesh_SequenceOfMeshDomain
") Assign;
		const StlMesh_SequenceOfMeshDomain & Assign (const StlMesh_SequenceOfMeshDomain & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: StlMesh_SequenceOfMeshDomain &
	:rtype: StlMesh_SequenceOfMeshDomain
") operator =;
		const StlMesh_SequenceOfMeshDomain & operator = (const StlMesh_SequenceOfMeshDomain & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: Handle_StlMesh_MeshDomain &
	:rtype: None
") Append;
		void Append (const Handle_StlMesh_MeshDomain & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: StlMesh_SequenceOfMeshDomain &
	:rtype: None
") Append;
		void Append (StlMesh_SequenceOfMeshDomain & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: Handle_StlMesh_MeshDomain &
	:rtype: None
") Prepend;
		void Prepend (const Handle_StlMesh_MeshDomain & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: StlMesh_SequenceOfMeshDomain &
	:rtype: None
") Prepend;
		void Prepend (StlMesh_SequenceOfMeshDomain & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_StlMesh_MeshDomain &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_StlMesh_MeshDomain & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: StlMesh_SequenceOfMeshDomain &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,StlMesh_SequenceOfMeshDomain & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_StlMesh_MeshDomain &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_StlMesh_MeshDomain & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: StlMesh_SequenceOfMeshDomain &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,StlMesh_SequenceOfMeshDomain & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: Handle_StlMesh_MeshDomain
") First;
		Handle_StlMesh_MeshDomain First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: Handle_StlMesh_MeshDomain
") Last;
		Handle_StlMesh_MeshDomain Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: StlMesh_SequenceOfMeshDomain &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,StlMesh_SequenceOfMeshDomain & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StlMesh_MeshDomain
") Value;
		Handle_StlMesh_MeshDomain Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: Handle_StlMesh_MeshDomain &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_StlMesh_MeshDomain & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StlMesh_MeshDomain
") ChangeValue;
		Handle_StlMesh_MeshDomain ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param FromIndex:
	:type FromIndex: int
	:param ToIndex:
	:type ToIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%extend StlMesh_SequenceOfMeshDomain {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StlMesh_SequenceOfMeshTriangle;
class StlMesh_SequenceOfMeshTriangle : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") StlMesh_SequenceOfMeshTriangle;
		%feature("autodoc", "	:rtype: None
") StlMesh_SequenceOfMeshTriangle;
		 StlMesh_SequenceOfMeshTriangle ();
		%feature("compactdefaultargs") StlMesh_SequenceOfMeshTriangle;
		%feature("autodoc", "	:param Other:
	:type Other: StlMesh_SequenceOfMeshTriangle &
	:rtype: None
") StlMesh_SequenceOfMeshTriangle;
		 StlMesh_SequenceOfMeshTriangle (const StlMesh_SequenceOfMeshTriangle & Other);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: StlMesh_SequenceOfMeshTriangle &
	:rtype: StlMesh_SequenceOfMeshTriangle
") Assign;
		const StlMesh_SequenceOfMeshTriangle & Assign (const StlMesh_SequenceOfMeshTriangle & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: StlMesh_SequenceOfMeshTriangle &
	:rtype: StlMesh_SequenceOfMeshTriangle
") operator =;
		const StlMesh_SequenceOfMeshTriangle & operator = (const StlMesh_SequenceOfMeshTriangle & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: Handle_StlMesh_MeshTriangle &
	:rtype: None
") Append;
		void Append (const Handle_StlMesh_MeshTriangle & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: StlMesh_SequenceOfMeshTriangle &
	:rtype: None
") Append;
		void Append (StlMesh_SequenceOfMeshTriangle & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: Handle_StlMesh_MeshTriangle &
	:rtype: None
") Prepend;
		void Prepend (const Handle_StlMesh_MeshTriangle & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: StlMesh_SequenceOfMeshTriangle &
	:rtype: None
") Prepend;
		void Prepend (StlMesh_SequenceOfMeshTriangle & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_StlMesh_MeshTriangle &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const Handle_StlMesh_MeshTriangle & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: StlMesh_SequenceOfMeshTriangle &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,StlMesh_SequenceOfMeshTriangle & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: Handle_StlMesh_MeshTriangle &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const Handle_StlMesh_MeshTriangle & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: StlMesh_SequenceOfMeshTriangle &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,StlMesh_SequenceOfMeshTriangle & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: Handle_StlMesh_MeshTriangle
") First;
		Handle_StlMesh_MeshTriangle First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: Handle_StlMesh_MeshTriangle
") Last;
		Handle_StlMesh_MeshTriangle Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: StlMesh_SequenceOfMeshTriangle &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,StlMesh_SequenceOfMeshTriangle & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StlMesh_MeshTriangle
") Value;
		Handle_StlMesh_MeshTriangle Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: Handle_StlMesh_MeshTriangle &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Handle_StlMesh_MeshTriangle & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Handle_StlMesh_MeshTriangle
") ChangeValue;
		Handle_StlMesh_MeshTriangle ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param FromIndex:
	:type FromIndex: int
	:param ToIndex:
	:type ToIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%extend StlMesh_SequenceOfMeshTriangle {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
