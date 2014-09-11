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
%module (package="OCC") Poly

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

%include Poly_headers.i

/* typedefs */
typedef NCollection_Vector <Poly_CoherentLink>::Iterator Poly_BaseIteratorOfCoherentLink;
typedef NCollection_Vector <Poly_CoherentNode>::Iterator Poly_BaseIteratorOfCoherentNode;
typedef NCollection_Vector <Poly_CoherentTriangle>::Iterator Poly_BaseIteratorOfCoherentTriangle;
typedef NCollection_List <Handle_Poly_Triangulation> Poly_ListOfTriangulation;
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%rename(poly) Poly;
%nodefaultctor Poly;
class Poly {
	public:
		%feature("autodoc", "Args:
	lstTri(Poly_ListOfTriangulation)

Returns:
	static Handle_Poly_Triangulation

Computes and  stores  the    link from   nodes  to  
         triangles     and from triangles to   neighbouring  
         triangles.  
This tool is obsolete, replaced by Poly_CoherentTriangulation  Algorithm to make minimal loops in a graph  Join several triangulations to one new triangulation object.  
         The new triangulation is just a mechanical sum of input  
         triangulations, without node sharing. UV coordinates are  
         dropped in the result.") Catenate;
		static Handle_Poly_Triangulation Catenate (const Poly_ListOfTriangulation & lstTri);
		%feature("autodoc", "Args:
	T(Handle_Poly_Triangulation)
	OS(Standard_OStream)
	Compact(Standard_Boolean)=Standard_True

Returns:
	static void

Writes the content of the triangulation <T> on the  
         stream <OS>. If <Compact> is true this is a 'save'  
         format  intended  to  be read back   with the Read  
         method. If compact is False  it is a 'Dump' format  
         intended to be informative.") Write;
		static void Write (const Handle_Poly_Triangulation & T,Standard_OStream & OS,const Standard_Boolean Compact = Standard_True);
		%feature("autodoc", "Args:
	P(Handle_Poly_Polygon3D)
	OS(Standard_OStream)
	Compact(Standard_Boolean)=Standard_True

Returns:
	static void

Writes  the  content  of the 3D polygon <P> on the  
         stream <OS>. If <Compact> is true this is a 'save'  
         format  intended  to  be read back   with the Read  
         method. If compact is False  it is a 'Dump' format  
         intended to be informative.") Write;
		static void Write (const Handle_Poly_Polygon3D & P,Standard_OStream & OS,const Standard_Boolean Compact = Standard_True);
		%feature("autodoc", "Args:
	P(Handle_Poly_Polygon2D)
	OS(Standard_OStream)
	Compact(Standard_Boolean)=Standard_True

Returns:
	static void

Writes the  content  of the 2D polygon  <P> on the  
         stream <OS>. If <Compact> is true this is a 'save'  
         format  intended  to  be read back   with the Read  
         method. If compact is False  it is a 'Dump' format  
         intended to be informative.") Write;
		static void Write (const Handle_Poly_Polygon2D & P,Standard_OStream & OS,const Standard_Boolean Compact = Standard_True);
		%feature("autodoc", "Args:
	T(Handle_Poly_Triangulation)
	OS(Standard_OStream)

Returns:
	static void

Dumps  the triangulation.  This   is a call to  the  
         previous method with Comapct set to False.") Dump;
		static void Dump (const Handle_Poly_Triangulation & T,Standard_OStream & OS);
		%feature("autodoc", "Args:
	P(Handle_Poly_Polygon3D)
	OS(Standard_OStream)

Returns:
	static void

Dumps  the  3D  polygon.  This   is a call to  the  
         previous method with Comapct set to False.") Dump;
		static void Dump (const Handle_Poly_Polygon3D & P,Standard_OStream & OS);
		%feature("autodoc", "Args:
	P(Handle_Poly_Polygon2D)
	OS(Standard_OStream)

Returns:
	static void

Dumps  the  2D  polygon.  This   is a call to  the  
         previous method with Comapct set to False.") Dump;
		static void Dump (const Handle_Poly_Polygon2D & P,Standard_OStream & OS);

        %feature("autodoc", "1");
        %extend{
            void ReadTriangulationFromString(std::string src) {
            std::stringstream s(src);
            self->ReadTriangulation(s);}
        };
        
        %feature("autodoc", "1");
        %extend{
            void ReadPolygon3DFromString(std::string src) {
            std::stringstream s(src);
            self->ReadPolygon3D(s);}
        };
        
        %feature("autodoc", "1");
        %extend{
            void ReadPolygon2DFromString(std::string src) {
            std::stringstream s(src);
            self->ReadPolygon2D(s);}
        };
        		%feature("autodoc", "Args:
	Tri(Handle_Poly_Triangulation)

Returns:
	static void

Compute node normals for face triangulation  
 as mean normal of surrounding triangles") ComputeNormals;
		static void ComputeNormals (const Handle_Poly_Triangulation & Tri);
		%feature("autodoc", "Args:
	P1(gp_XY)
	P2(gp_XY)
	P3(gp_XY)
	P(gp_XY)
	UV(gp_XY)

Returns:
	static Standard_Real

Computes parameters of the point P on triangle  
         defined by points P1, P2, and P3, in 2d.  
         The parameters U and V are defined so that  
         P = P1 + U * (P2 - P1) + V * (P3 - P1),  
         with U >= 0, V >= 0, U + V <= 1.  
         If P is located outside of triangle, or triangle  
         is degenerated, the returned parameters correspond  
         to closest point, and returned value is square of  
         the distance from original point to triangle (0 if  
         point is inside).") PointOnTriangle;
		static Standard_Real PointOnTriangle (const gp_XY & P1,const gp_XY & P2,const gp_XY & P3,const gp_XY & P,gp_XY & UV);
};


%feature("shadow") Poly::~Poly %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Poly {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Poly_Array1OfTriangle;
class Poly_Array1OfTriangle {
	public:
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Poly_Array1OfTriangle;
		 Poly_Array1OfTriangle (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	Item(Poly_Triangle)
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Poly_Array1OfTriangle;
		 Poly_Array1OfTriangle (const Poly_Triangle & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	V(Poly_Triangle)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const Poly_Triangle & V);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Destroy;
		void Destroy ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("autodoc", "Args:
	Other(Poly_Array1OfTriangle)

Returns:
	Poly_Array1OfTriangle

No detailed docstring for this function.") Assign;
		const Poly_Array1OfTriangle & Assign (const Poly_Array1OfTriangle & Other);
		%feature("autodoc", "Args:
	Other(Poly_Array1OfTriangle)

Returns:
	Poly_Array1OfTriangle

No detailed docstring for this function.") operator=;
		const Poly_Array1OfTriangle & operator = (const Poly_Array1OfTriangle & Other);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Length;
		Standard_Integer Length ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Lower;
		Standard_Integer Lower ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Upper;
		Standard_Integer Upper ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Value(Poly_Triangle)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Poly_Triangle & Value);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Poly_Triangle

No detailed docstring for this function.") Value;
		const Poly_Triangle & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Poly_Triangle

No detailed docstring for this function.") ChangeValue;
		Poly_Triangle & ChangeValue (const Standard_Integer Index);
};


%feature("shadow") Poly_Array1OfTriangle::~Poly_Array1OfTriangle %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Poly_Array1OfTriangle {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Poly_CoherentLink;
class Poly_CoherentLink {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

/**
* Empty constructor.
*/") Poly_CoherentLink;
		 Poly_CoherentLink ();
		%feature("autodoc", "Args:
	iNode0(Standard_Integer)
	iNode1(Standard_Integer)

Returns:
	None

/**
* Constructor. Creates a Link that has no reference to 'opposite nodes'.
* This constructor is useful to create temporary object that is not
* inserted into any existing triangulation.
*/") Poly_CoherentLink;
		 Poly_CoherentLink (const Standard_Integer iNode0,const Standard_Integer iNode1);
		%feature("autodoc", "Args:
	theTri(Poly_CoherentTriangle)
	iSide(Standard_Integer)

Returns:
	None

/**
* Constructor, takes a triangle and a side. A link is created always such
* that myNode[0] < myNode[1]. Unlike the previous constructor, this one
* assigns the 'opposite node' fields. This constructor is used when a
* link is inserted into a Poly_CoherentTriangulation structure.  
* @param theTri
*   Triangle containing the link that is created
* @param iSide
*   Can be 0, 1 or 2. Index of the node
*/") Poly_CoherentLink;
		 Poly_CoherentLink (const Poly_CoherentTriangle & theTri,Standard_Integer iSide);
		%feature("autodoc", "Args:
	ind(Standard_Integer)

Returns:
	inline Standard_Integer

/**
* Return the node index in the current triangulation.
* @param ind
*   0 or 1 making distinction of the two nodes that constitute the Link.
*   Node(0) always returns a smaller number than Node(1).
*/") Node;
		inline Standard_Integer Node (const Standard_Integer ind);
		%feature("autodoc", "Args:
	ind(Standard_Integer)

Returns:
	inline Standard_Integer

/**
* Return the opposite node (belonging to the left or right incident triangle)
* index in the current triangulation.
* @param ind
*   0 or 1 making distinction of the two involved triangles: 0 on the left,
*   1 on the right side of the Link.
*/") OppositeNode;
		inline Standard_Integer OppositeNode (const Standard_Integer ind);
		%feature("autodoc", "Args:
	None
Returns:
	inline Standard_Address

/**
* Query the attribute of the Link.
*/") GetAttribute;
		inline Standard_Address GetAttribute ();
		%feature("autodoc", "Args:
	theAtt(Standard_Address)

Returns:
	inline void

/**
* Set the attribute of the Link.
*/") SetAttribute;
		inline void SetAttribute (const Standard_Address theAtt);
		%feature("autodoc", "Args:
	None
Returns:
	inline Standard_Boolean

/**
* Query the status of the link - if it is an invalid one.
* An invalid link has Node members equal to -1.
*/") IsEmpty;
		inline Standard_Boolean IsEmpty ();
		%feature("autodoc", "Args:
	None
Returns:
	inline void

/**
* Invalidate this Link.
*/") Nullify;
		inline void Nullify ();
};


%feature("shadow") Poly_CoherentLink::~Poly_CoherentLink %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Poly_CoherentLink {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Poly_CoherentNode;
class Poly_CoherentNode : public gp_XYZ {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

/**
* Empty constructor.
*/") Poly_CoherentNode;
		 Poly_CoherentNode ();
		%feature("autodoc", "Args:
	thePnt(gp_XYZ)

Returns:
	None

/**
* Constructor.
*/") Poly_CoherentNode;
		 Poly_CoherentNode (const gp_XYZ & thePnt);
		%feature("autodoc", "Args:
	theU(Standard_Real)
	theV(Standard_Real)

Returns:
	inline void

/**
* Set the UV coordinates of the Node.
*/") SetUV;
		inline void SetUV (const Standard_Real theU,const Standard_Real theV);
		%feature("autodoc", "Args:
	None
Returns:
	inline Standard_Real

/**
* Get U coordinate of the Node.
*/") GetU;
		inline Standard_Real GetU ();
		%feature("autodoc", "Args:
	None
Returns:
	inline Standard_Real

/**
* Get V coordinate of the Node.
*/") GetV;
		inline Standard_Real GetV ();
		%feature("autodoc", "Args:
	theVector(gp_XYZ)

Returns:
	None

/**
* Define the normal vector in the Node.
*/") SetNormal;
		void SetNormal (const gp_XYZ & theVector);
		%feature("autodoc", "Args:
	None
Returns:
	inline Standard_Boolean

/**
* Query if the Node contains a normal vector.
*/") HasNormal;
		inline Standard_Boolean HasNormal ();
		%feature("autodoc", "Args:
	None
Returns:
	inline gp_XYZ

/**
* Get the stored normal in the node.
*/") GetNormal;
		inline gp_XYZ GetNormal ();
		%feature("autodoc", "Args:
	theIndex(Standard_Integer)

Returns:
	inline void

/**
* Set the value of node Index.
*/") SetIndex;
		inline void SetIndex (const Standard_Integer theIndex);
		%feature("autodoc", "Args:
	None
Returns:
	inline Standard_Integer

/**
* Get the value of node Index.
*/") GetIndex;
		inline Standard_Integer GetIndex ();
		%feature("autodoc", "Args:
	None
Returns:
	inline Standard_Boolean

/**
* Check if this is a free node, i.e., a node without a single
* incident triangle.
*/") IsFreeNode;
		inline Standard_Boolean IsFreeNode ();
		%feature("autodoc", "Args:
	&(Handle_NCollection_BaseAllocator)

Returns:
	None

/**
* Reset the Node to void.
*/") Clear;
		void Clear (const Handle_NCollection_BaseAllocator &);
		%feature("autodoc", "Args:
	theTri(Poly_CoherentTriangle)
	theA(Handle_NCollection_BaseAllocator)

Returns:
	None

/**
* Connect a triangle to this Node.
*/") AddTriangle;
		void AddTriangle (const Poly_CoherentTriangle & theTri,const Handle_NCollection_BaseAllocator & theA);
		%feature("autodoc", "Args:
	theTri(Poly_CoherentTriangle)
	theA(Handle_NCollection_BaseAllocator)

Returns:
	Standard_Boolean

/**
* Disconnect a triangle from this Node.
*/") RemoveTriangle;
		Standard_Boolean RemoveTriangle (const Poly_CoherentTriangle & theTri,const Handle_NCollection_BaseAllocator & theA);
		%feature("autodoc", "Args:
	None
Returns:
	inline Poly_CoherentTriPtr::Iterator

/**
* Create an iterator of incident triangles.
*/") TriangleIterator;
		inline Poly_CoherentTriPtr::Iterator TriangleIterator ();

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        };


%feature("shadow") Poly_CoherentNode::~Poly_CoherentNode %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Poly_CoherentNode {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Poly_CoherentTriangle;
class Poly_CoherentTriangle {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

/**
* Empty constructor.
*/") Poly_CoherentTriangle;
		 Poly_CoherentTriangle ();
		%feature("autodoc", "Args:
	iNode0(Standard_Integer)
	iNode1(Standard_Integer)
	iNode2(Standard_Integer)

Returns:
	None

/**
* Constructor.
*/") Poly_CoherentTriangle;
		 Poly_CoherentTriangle (const Standard_Integer iNode0,const Standard_Integer iNode1,const Standard_Integer iNode2);
		%feature("autodoc", "Args:
	ind(Standard_Integer)

Returns:
	inline Standard_Integer

/**
* Query the node index in the position given by the parameter 'ind'
*/") Node;
		inline Standard_Integer Node (const Standard_Integer ind);
		%feature("autodoc", "Args:
	None
Returns:
	inline Standard_Boolean

/**
* Query if this is a valid triangle.
*/") IsEmpty;
		inline Standard_Boolean IsEmpty ();
		%feature("autodoc", "Args:
	iConn(Standard_Integer)
	theTr(Poly_CoherentTriangle)

Returns:
	Standard_Boolean

/**
* Create connection with another triangle theTri.
* This method creates both connections: in this triangle and in theTri. You
* do not need to call the same method on triangle theTr.
* @param iConn
*   Can be 0, 1 or 2 - index of the node that is opposite to the connection
*   (shared link).
* @param theTr
*   Triangle that is connected on the given link.
* @return
*   True if successful, False if the connection is rejected
*   due to improper topology.
*/") SetConnection;
		Standard_Boolean SetConnection (const Standard_Integer iConn,Poly_CoherentTriangle & theTr);
		%feature("autodoc", "Args:
	theTri(Poly_CoherentTriangle)

Returns:
	Standard_Boolean

/**
* Create connection with another triangle theTri.
* This method creates both connections: in this triangle and in theTri.
* This method is slower than the previous one, because it makes analysis
* what sides of both triangles are connected.
* @param theTri
*   Triangle that is connected.
* @return
*   True if successful, False if the connection is rejected
*   due to improper topology.
*/") SetConnection;
		Standard_Boolean SetConnection (Poly_CoherentTriangle & theTri);
		%feature("autodoc", "Args:
	iConn(Standard_Integer)

Returns:
	None

/**
* Remove the connection with the given index.
* @param iConn
*   Can be 0, 1 or 2 - index of the node that is opposite to the connection
*   (shared link).
*/") RemoveConnection;
		void RemoveConnection (const Standard_Integer iConn);
		%feature("autodoc", "Args:
	theTri(Poly_CoherentTriangle)

Returns:
	Standard_Boolean

/**
* Remove the connection with the given Triangle.
* @return
*  True if successfuol or False if the connection has not been found.
*/") RemoveConnection;
		Standard_Boolean RemoveConnection (Poly_CoherentTriangle & theTri);
		%feature("autodoc", "Args:
	None
Returns:
	inline Standard_Integer

/**
* Query the number of connected triangles.
*/") NConnections;
		inline Standard_Integer NConnections ();
		%feature("autodoc", "Args:
	iConn(Standard_Integer)

Returns:
	inline Standard_Integer

/**
* Query the connected node on the given side.
* Returns -1 if there is no connection on the specified side.
*/") GetConnectedNode;
		inline Standard_Integer GetConnectedNode (const Standard_Integer iConn);
		%feature("autodoc", "Args:
	iConn(Standard_Integer)

Returns:
	inline  Poly_CoherentTriangle *

/**
* Query the connected triangle on the given side.
* Returns NULL if there is no connection on the specified side.
*/") GetConnectedTri;
		inline const Poly_CoherentTriangle * GetConnectedTri (const Standard_Integer iConn);
		%feature("autodoc", "Args:
	iLink(Standard_Integer)

Returns:
	inline  Poly_CoherentLink *

/**
* Query the Link associate with the given side of the Triangle.
* May return NULL if there are no links in the triangulation.
*/") GetLink;
		inline const Poly_CoherentLink * GetLink (const Standard_Integer iLink);
		%feature("autodoc", "Args:
	&(Poly_CoherentTriangle)

Returns:
	Standard_Integer

/**
* Retuns the index of the connection with the given triangle, or -1 if not
* found.
*/") FindConnection;
		Standard_Integer FindConnection (const Poly_CoherentTriangle &);
};


%feature("shadow") Poly_CoherentTriangle::~Poly_CoherentTriangle %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Poly_CoherentTriangle {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Poly_Connect;
class Poly_Connect {
	public:
		%feature("autodoc", "Args:
	T(Handle_Poly_Triangulation)

Returns:
	None

Constructs an algorithm to explore the adjacency data of  
nodes or triangles for the triangulation T.") Poly_Connect;
		 Poly_Connect (const Handle_Poly_Triangulation & T);
		%feature("autodoc", "Args:
	None
Returns:
	Handle_Poly_Triangulation

Returns the triangulation analyzed by this tool.") Triangulation;
		Handle_Poly_Triangulation Triangulation ();
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	Standard_Integer

Returns the index of a triangle containing the node at  
index N in the nodes table specific to the triangulation analyzed by this tool") Triangle;
		Standard_Integer Triangle (const Standard_Integer N);
		%feature("autodoc", "Args:
	T(Standard_Integer)
	t1(Standard_Integer)
	t2(Standard_Integer)
	t3(Standard_Integer)

Returns:
	None

Returns in t1, t2 and t3, the indices of the 3 triangles  
adjacent to the triangle at index T in the triangles table  
specific to the triangulation analyzed by this tool.  
Warning  
Null indices are returned when there are fewer than 3  
adjacent triangles.") Triangles;
		void Triangles (const Standard_Integer T,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	T(Standard_Integer)
	n1(Standard_Integer)
	n2(Standard_Integer)
	n3(Standard_Integer)

Returns:
	None

Returns, in n1, n2 and n3, the indices of the 3 nodes  
adjacent to the triangle referenced at index T in the  
triangles table specific to the triangulation analyzed by this tool.  
Warning  
Null indices are returned when there are fewer than 3 adjacent nodes.") Nodes;
		void Nodes (const Standard_Integer T,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	N(Standard_Integer)

Returns:
	None

Initializes an iterator to search for all the triangles  
containing the node referenced at index N in the nodes  
table, for the triangulation analyzed by this tool.  
The iterator is managed by the following functions:  
-   More, which checks if there are still elements in the iterator  
-   Next, which positions the iterator on the next element  
-   Value, which returns the current element.  
The use of such an iterator provides direct access to the  
triangles around a particular node, i.e. it avoids iterating on  
all the component triangles of a triangulation.  
Example  
Poly_Connect C(Tr);  
for  
(C.Initialize(n1);C.More();C.Next())  
{  
       t = C.Value();  
}") Initialize;
		void Initialize (const Standard_Integer N);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns true if there is another element in the iterator  
defined with the function Initialize (i.e. if there is another  
triangle containing the given node).") More;
		Standard_Boolean More ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Advances the iterator defined with the function Initialize to  
access the next triangle.  
Note: There is no action if the iterator is empty (i.e. if the  
function More returns false).-") Next;
		void Next ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the index of the current triangle to which the  
iterator, defined with the function Initialize, points. This is  
an index in the triangles table specific to the triangulation  
analyzed by this tool") Value;
		Standard_Integer Value ();
};


%feature("shadow") Poly_Connect::~Poly_Connect %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Poly_Connect {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Poly_HArray1OfTriangle;
class Poly_HArray1OfTriangle : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") Poly_HArray1OfTriangle;
		 Poly_HArray1OfTriangle (const Standard_Integer Low,const Standard_Integer Up);
		%feature("autodoc", "Args:
	Low(Standard_Integer)
	Up(Standard_Integer)
	V(Poly_Triangle)

Returns:
	None

No detailed docstring for this function.") Poly_HArray1OfTriangle;
		 Poly_HArray1OfTriangle (const Standard_Integer Low,const Standard_Integer Up,const Poly_Triangle & V);
		%feature("autodoc", "Args:
	V(Poly_Triangle)

Returns:
	None

No detailed docstring for this function.") Init;
		void Init (const Poly_Triangle & V);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Length;
		Standard_Integer Length ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Lower;
		Standard_Integer Lower ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") Upper;
		Standard_Integer Upper ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Value(Poly_Triangle)

Returns:
	None

No detailed docstring for this function.") SetValue;
		void SetValue (const Standard_Integer Index,const Poly_Triangle & Value);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Poly_Triangle

No detailed docstring for this function.") Value;
		const Poly_Triangle & Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Poly_Triangle

No detailed docstring for this function.") ChangeValue;
		Poly_Triangle & ChangeValue (const Standard_Integer Index);
		%feature("autodoc", "Args:
	None
Returns:
	Poly_Array1OfTriangle

No detailed docstring for this function.") Array1;
		const Poly_Array1OfTriangle & Array1 ();
		%feature("autodoc", "Args:
	None
Returns:
	Poly_Array1OfTriangle

No detailed docstring for this function.") ChangeArray1;
		Poly_Array1OfTriangle & ChangeArray1 ();
};


%feature("shadow") Poly_HArray1OfTriangle::~Poly_HArray1OfTriangle %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Poly_HArray1OfTriangle {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Poly_HArray1OfTriangle {
	Handle_Poly_HArray1OfTriangle GetHandle() {
	return *(Handle_Poly_HArray1OfTriangle*) &$self;
	}
};

%nodefaultctor Handle_Poly_HArray1OfTriangle;
class Handle_Poly_HArray1OfTriangle : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Poly_HArray1OfTriangle();
        Handle_Poly_HArray1OfTriangle(const Handle_Poly_HArray1OfTriangle &aHandle);
        Handle_Poly_HArray1OfTriangle(const Poly_HArray1OfTriangle *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Poly_HArray1OfTriangle DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Poly_HArray1OfTriangle {
    Poly_HArray1OfTriangle* GetObject() {
    return (Poly_HArray1OfTriangle*)$self->Access();
    }
};
%feature("shadow") Handle_Poly_HArray1OfTriangle::~Handle_Poly_HArray1OfTriangle %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Poly_HArray1OfTriangle {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Poly_Polygon2D;
class Poly_Polygon2D : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	Nodes(TColgp_Array1OfPnt2d)

Returns:
	None

Constructs a 2D polygon defined by the table of points, <Nodes>.") Poly_Polygon2D;
		 Poly_Polygon2D (const TColgp_Array1OfPnt2d & Nodes);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the deflection of this polygon.  
 Deflection is used in cases where the polygon is an  
approximate representation of a curve. Deflection  
represents the maximum distance permitted between any  
point on the curve and the corresponding point on the polygon.  
By default the deflection value is equal to 0. An algorithm  
using this 2D polygon with a deflection value equal to 0  
considers that it is working with a true polygon and not with  
an approximate representation of a curve. The Deflection  
function is used to modify the deflection value of this polygon.  
The deflection value can be used by any algorithm working  with 2D polygons.  
For example:  
-   An algorithm may use a unique deflection value for all  
  its polygons. In this case it is not necessary to use the  
  Deflection function.  
-   Or an algorithm may want to attach a different  
  deflection to each polygon. In this case, the Deflection  
  function is used to set a value on each polygon, and  
  later to fetch the value.") Deflection;
		Standard_Real Deflection ();
		%feature("autodoc", "Args:
	D(Standard_Real)

Returns:
	None

Sets the deflection of this polygon to D") Deflection;
		void Deflection (const Standard_Real D);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the number of nodes in this polygon.  
Note: If the polygon is closed, the point of closure is  
repeated at the end of its table of nodes. Thus, on a closed  
triangle, the function NbNodes returns 4.") NbNodes;
		Standard_Integer NbNodes ();
		%feature("autodoc", "Args:
	None
Returns:
	TColgp_Array1OfPnt2d

Returns the table of nodes for this polygon.") Nodes;
		const TColgp_Array1OfPnt2d & Nodes ();
};


%feature("shadow") Poly_Polygon2D::~Poly_Polygon2D %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Poly_Polygon2D {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Poly_Polygon2D {
	Handle_Poly_Polygon2D GetHandle() {
	return *(Handle_Poly_Polygon2D*) &$self;
	}
};

%nodefaultctor Handle_Poly_Polygon2D;
class Handle_Poly_Polygon2D : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Poly_Polygon2D();
        Handle_Poly_Polygon2D(const Handle_Poly_Polygon2D &aHandle);
        Handle_Poly_Polygon2D(const Poly_Polygon2D *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Poly_Polygon2D DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Poly_Polygon2D {
    Poly_Polygon2D* GetObject() {
    return (Poly_Polygon2D*)$self->Access();
    }
};
%feature("shadow") Handle_Poly_Polygon2D::~Handle_Poly_Polygon2D %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Poly_Polygon2D {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Poly_Polygon3D;
class Poly_Polygon3D : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	Nodes(TColgp_Array1OfPnt)

Returns:
	None

onstructs a 3D polygon defined by the table of points, Nodes.") Poly_Polygon3D;
		 Poly_Polygon3D (const TColgp_Array1OfPnt & Nodes);
		%feature("autodoc", "Args:
	Nodes(TColgp_Array1OfPnt)
	Parameters(TColStd_Array1OfReal)

Returns:
	None

Constructs a 3D polygon defined by  
the table of points, Nodes, and the parallel table of  
 parameters, Parameters, where each value of the table  
 Parameters is the parameter of the corresponding point  
 on the curve approximated by the constructed polygon.  
Warning  
Both the Nodes and Parameters tables must have the  
same bounds. This property is not checked at construction time.") Poly_Polygon3D;
		 Poly_Polygon3D (const TColgp_Array1OfPnt & Nodes,const TColStd_Array1OfReal & Parameters);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the deflection of this polygon") Deflection;
		Standard_Real Deflection ();
		%feature("autodoc", "Args:
	D(Standard_Real)

Returns:
	None

Sets the deflection of this polygon to D. See more on deflection in Poly_Polygon2D") Deflection;
		void Deflection (const Standard_Real D);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the number of nodes in this polygon.  
Note: If the polygon is closed, the point of closure is  
repeated at the end of its table of nodes. Thus, on a closed  
triangle the function NbNodes returns 4.") NbNodes;
		Standard_Integer NbNodes ();
		%feature("autodoc", "Args:
	None
Returns:
	TColgp_Array1OfPnt

Returns the table of nodes for this polygon.") Nodes;
		const TColgp_Array1OfPnt & Nodes ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns the table of the parameters associated with each node in this polygon.  
 HasParameters function checks if   parameters are associated with the nodes of this polygon.") HasParameters;
		Standard_Boolean HasParameters ();
		%feature("autodoc", "Args:
	None
Returns:
	TColStd_Array1OfReal

Returns true if parameters are associated with the nodes  
in this polygon.") Parameters;
		const TColStd_Array1OfReal & Parameters ();
		%feature("autodoc", "Args:
	None
Returns:
	TColStd_Array1OfReal

Returns the table of the parameters associated with each node in this polygon.  
       ChangeParameters function returnes the  array as shared. Therefore if the table is selected by  
  reference you can, by simply modifying it, directly modify  
  the data structure of this polygon.") ChangeParameters;
		TColStd_Array1OfReal & ChangeParameters ();
};


%feature("shadow") Poly_Polygon3D::~Poly_Polygon3D %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Poly_Polygon3D {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Poly_Polygon3D {
	Handle_Poly_Polygon3D GetHandle() {
	return *(Handle_Poly_Polygon3D*) &$self;
	}
};

%nodefaultctor Handle_Poly_Polygon3D;
class Handle_Poly_Polygon3D : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Poly_Polygon3D();
        Handle_Poly_Polygon3D(const Handle_Poly_Polygon3D &aHandle);
        Handle_Poly_Polygon3D(const Poly_Polygon3D *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Poly_Polygon3D DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Poly_Polygon3D {
    Poly_Polygon3D* GetObject() {
    return (Poly_Polygon3D*)$self->Access();
    }
};
%feature("shadow") Handle_Poly_Polygon3D::~Handle_Poly_Polygon3D %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Poly_Polygon3D {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Poly_PolygonOnTriangulation;
class Poly_PolygonOnTriangulation : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	Nodes(TColStd_Array1OfInteger)

Returns:
	None

Constructs a 3D polygon on the triangulation of a shape,  
defined by the table of nodes, <Nodes>.") Poly_PolygonOnTriangulation;
		 Poly_PolygonOnTriangulation (const TColStd_Array1OfInteger & Nodes);
		%feature("autodoc", "Args:
	Nodes(TColStd_Array1OfInteger)
	Parameters(TColStd_Array1OfReal)

Returns:
	None

Constructs a 3D polygon on the triangulation of a shape, defined by:  
 -   the table of nodes, Nodes, and the table of parameters, <Parameters>.  
where:  
-   a node value is an index in the table of nodes specific  
  to an existing triangulation of a shape  
-   and a parameter value is the value of the parameter of  
  the corresponding point on the curve approximated by  
  the constructed polygon.  
Warning  
The tables Nodes and Parameters must be the same size.  
This property is not checked at construction time.") Poly_PolygonOnTriangulation;
		 Poly_PolygonOnTriangulation (const TColStd_Array1OfInteger & Nodes,const TColStd_Array1OfReal & Parameters);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the deflection of this polygon") Deflection;
		Standard_Real Deflection ();
		%feature("autodoc", "Args:
	D(Standard_Real)

Returns:
	None

Sets the deflection of this polygon to D.  
See more on deflection in Poly_Polygones2D.") Deflection;
		void Deflection (const Standard_Real D);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the number of nodes for this polygon.  
Note: If the polygon is closed, the point of closure is  
repeated at the end of its table of nodes. Thus, on a closed  
triangle, the function NbNodes returns 4.") NbNodes;
		Standard_Integer NbNodes ();
		%feature("autodoc", "Args:
	None
Returns:
	TColStd_Array1OfInteger

Returns the table of nodes for this polygon. A node value  
is an index in the table of nodes specific to an existing  
triangulation of a shape.") Nodes;
		const TColStd_Array1OfInteger & Nodes ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns true if parameters are associated with the nodes in this polygon.") HasParameters;
		Standard_Boolean HasParameters ();
		%feature("autodoc", "Args:
	None
Returns:
	Handle_TColStd_HArray1OfReal

Returns the table of the parameters associated with each node in this polygon.  
Warning  
Use the function HasParameters to check if parameters  
are associated with the nodes in this polygon.") Parameters;
		Handle_TColStd_HArray1OfReal Parameters ();
};


%feature("shadow") Poly_PolygonOnTriangulation::~Poly_PolygonOnTriangulation %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Poly_PolygonOnTriangulation {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Poly_PolygonOnTriangulation {
	Handle_Poly_PolygonOnTriangulation GetHandle() {
	return *(Handle_Poly_PolygonOnTriangulation*) &$self;
	}
};

%nodefaultctor Handle_Poly_PolygonOnTriangulation;
class Handle_Poly_PolygonOnTriangulation : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Poly_PolygonOnTriangulation();
        Handle_Poly_PolygonOnTriangulation(const Handle_Poly_PolygonOnTriangulation &aHandle);
        Handle_Poly_PolygonOnTriangulation(const Poly_PolygonOnTriangulation *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Poly_PolygonOnTriangulation DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Poly_PolygonOnTriangulation {
    Poly_PolygonOnTriangulation* GetObject() {
    return (Poly_PolygonOnTriangulation*)$self->Access();
    }
};
%feature("shadow") Handle_Poly_PolygonOnTriangulation::~Handle_Poly_PolygonOnTriangulation %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Poly_PolygonOnTriangulation {
    void _kill_pointed() {
        delete $self;
    }
};

%nodefaultctor Poly_Triangle;
class Poly_Triangle {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Constructs a triangle and sets all indices to zero.") Poly_Triangle;
		 Poly_Triangle ();
		%feature("autodoc", "Args:
	N1(Standard_Integer)
	N2(Standard_Integer)
	N3(Standard_Integer)

Returns:
	None

Constructs a triangle and sets its three indices  
to N1, N2 and N3 respectively, where these node values  
  are indices in the table of nodes specific to an existing  
  triangulation of a shape.") Poly_Triangle;
		 Poly_Triangle (const Standard_Integer N1,const Standard_Integer N2,const Standard_Integer N3);
		%feature("autodoc", "Args:
	N1(Standard_Integer)
	N2(Standard_Integer)
	N3(Standard_Integer)

Returns:
	None

Sets the value of  the three nodes of this triangle to N1, N2 and N3   respectively.") Set;
		void Set (const Standard_Integer N1,const Standard_Integer N2,const Standard_Integer N3);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	Node(Standard_Integer)

Returns:
	None

Sets the value of  the Indexth node of this triangle to Node.  
Raises OutOfRange if Index is not in 1,2,3") Set;
		void Set (const Standard_Integer Index,const Standard_Integer Node);
		%feature("autodoc", "Args:
	N1(Standard_Integer)
	N2(Standard_Integer)
	N3(Standard_Integer)

Returns:
	None

Returns the node indices of this triangle in N1, N2 and N3.") Get;
		void Get (Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Standard_Integer

Get the node of given Index.  
Raises OutOfRange from Standard if Index is not in 1,2,3") Value;
		Standard_Integer Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Standard_Integer

Get the node of given Index.  
Raises OutOfRange if Index is not in 1,2,3") ChangeValue;
		Standard_Integer & ChangeValue (const Standard_Integer Index);
};


%feature("shadow") Poly_Triangle::~Poly_Triangle %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Poly_Triangle {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor Poly_Triangulation;
class Poly_Triangulation : public MMgt_TShared {
	public:
		%feature("autodoc", "Args:
	nbNodes(Standard_Integer)
	nbTriangles(Standard_Integer)
	UVNodes(Standard_Boolean)

Returns:
	None

Constructs a triangulation from a set of triangles. The  
triangulation is initialized without a triangle or a node, but capable of  
  containing nbNodes nodes, and nbTriangles  
  triangles. Here the UVNodes flag indicates whether  
  2D nodes will be associated with 3D ones, (i.e. to  
  enable a 2D representation).") Poly_Triangulation;
		 Poly_Triangulation (const Standard_Integer nbNodes,const Standard_Integer nbTriangles,const Standard_Boolean UVNodes);
		%feature("autodoc", "Args:
	Nodes(TColgp_Array1OfPnt)
	Triangles(Poly_Array1OfTriangle)

Returns:
	None

Constructs a triangulation from a set of triangles. The  
triangulation is initialized with 3D points from Nodes and triangles  
 from Triangles.") Poly_Triangulation;
		 Poly_Triangulation (const TColgp_Array1OfPnt & Nodes,const Poly_Array1OfTriangle & Triangles);
		%feature("autodoc", "Args:
	Nodes(TColgp_Array1OfPnt)
	UVNodes(TColgp_Array1OfPnt2d)
	Triangles(Poly_Array1OfTriangle)

Returns:
	None

Constructs a triangulation from a set of triangles. The  
triangulation is initialized with 3D points from Nodes, 2D points from  
  UVNodes and triangles from Triangles, where  
  coordinates of a 2D point from UVNodes are the  
  (u, v) parameters of the corresponding 3D point  
  from Nodes on the surface approximated by the  
  constructed triangulation.") Poly_Triangulation;
		 Poly_Triangulation (const TColgp_Array1OfPnt & Nodes,const TColgp_Array1OfPnt2d & UVNodes,const Poly_Array1OfTriangle & Triangles);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the deflection of this triangulation.") Deflection;
		Standard_Real Deflection ();
		%feature("autodoc", "Args:
	D(Standard_Real)

Returns:
	None

Sets the deflection of this triangulation to D.  
   See more on deflection in Polygon2D") Deflection;
		void Deflection (const Standard_Real D);
		%feature("autodoc", "Args:
	None
Returns:
	None

Deallocates the UV nodes.") RemoveUVNodes;
		void RemoveUVNodes ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the number of nodes for this triangulation.  
Null if the nodes are not yet defined.") NbNodes;
		Standard_Integer NbNodes ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the number of triangles for this triangulation.  
Null if the Triangles are not yet defined.") NbTriangles;
		Standard_Integer NbTriangles ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns true if 2D nodes are associated with 3D nodes for  
this triangulation.") HasUVNodes;
		Standard_Boolean HasUVNodes ();
		%feature("autodoc", "Args:
	None
Returns:
	TColgp_Array1OfPnt

Returns the table of 3D nodes (3D points) for this triangulation.") Nodes;
		const TColgp_Array1OfPnt & Nodes ();
		%feature("autodoc", "Args:
	None
Returns:
	TColgp_Array1OfPnt

Returns the table of 3D nodes (3D points) for this triangulation.  
       The returned array is  
shared. Therefore if the table is selected by reference, you  
can, by simply modifying it, directly modify the data  
structure of this triangulation.") ChangeNodes;
		TColgp_Array1OfPnt & ChangeNodes ();
		%feature("autodoc", "Args:
	None
Returns:
	TColgp_Array1OfPnt2d

Returns the table of 2D nodes (2D points) associated with  
each 3D node of this triangulation.  
The function HasUVNodes  checks if 2D nodes  
are associated with the 3D nodes of this triangulation.  
Const reference on the 2d nodes values.") UVNodes;
		const TColgp_Array1OfPnt2d & UVNodes ();
		%feature("autodoc", "Args:
	None
Returns:
	TColgp_Array1OfPnt2d

Returns the table of 2D nodes (2D points) associated with  
each 3D node of this triangulation.  
Function ChangeUVNodes shares  the returned array.  
  Therefore if the table is selected by reference,  
  you can, by simply modifying it, directly modify the data  
  structure of this triangulation.") ChangeUVNodes;
		TColgp_Array1OfPnt2d & ChangeUVNodes ();
		%feature("autodoc", "Args:
	None
Returns:
	Poly_Array1OfTriangle

Returns the table of triangles for this triangulation.") Triangles;
		const Poly_Array1OfTriangle & Triangles ();
		%feature("autodoc", "Args:
	None
Returns:
	Poly_Array1OfTriangle

Returns the table of triangles for this triangulation.  
Function ChangeUVNodes shares  the returned array.  
  Therefore if the table is selected by reference,  
  you can, by simply modifying it, directly modify the data  
  structure of this triangulation.") ChangeTriangles;
		Poly_Array1OfTriangle & ChangeTriangles ();
		%feature("autodoc", "Args:
	theNormals(Handle_TShort_HArray1OfShortReal)

Returns:
	None

Sets the table of node normals.  
raises exception if length of theNormals != 3*NbNodes") SetNormals;
		void SetNormals (const Handle_TShort_HArray1OfShortReal & theNormals);
		%feature("autodoc", "Args:
	None
Returns:
	TShort_Array1OfShortReal

No detailed docstring for this function.") Normals;
		const TShort_Array1OfShortReal & Normals ();
		%feature("autodoc", "Args:
	None
Returns:
	TShort_Array1OfShortReal

No detailed docstring for this function.") ChangeNormals;
		TShort_Array1OfShortReal & ChangeNormals ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") HasNormals;
		Standard_Boolean HasNormals ();
};


%feature("shadow") Poly_Triangulation::~Poly_Triangulation %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend Poly_Triangulation {
	void _kill_pointed() {
		delete $self;
	}
};
%extend Poly_Triangulation {
	Handle_Poly_Triangulation GetHandle() {
	return *(Handle_Poly_Triangulation*) &$self;
	}
};

%nodefaultctor Handle_Poly_Triangulation;
class Handle_Poly_Triangulation : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_Poly_Triangulation();
        Handle_Poly_Triangulation(const Handle_Poly_Triangulation &aHandle);
        Handle_Poly_Triangulation(const Poly_Triangulation *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Poly_Triangulation DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Poly_Triangulation {
    Poly_Triangulation* GetObject() {
    return (Poly_Triangulation*)$self->Access();
    }
};
%feature("shadow") Handle_Poly_Triangulation::~Handle_Poly_Triangulation %{
def __del__(self):
    try:
        self.thisown = False
        GarbageCollector.garbage.collect_object(self)
    except:
        pass
%}

%extend Handle_Poly_Triangulation {
    void _kill_pointed() {
        delete $self;
    }
};

