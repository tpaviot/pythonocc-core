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
%module (package="OCC") Poly

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


%include Poly_headers.i


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
typedef NCollection_Vector <Poly_CoherentLink>::Iterator Poly_BaseIteratorOfCoherentLink;
typedef NCollection_Vector <Poly_CoherentNode>::Iterator Poly_BaseIteratorOfCoherentNode;
typedef NCollection_Vector <Poly_CoherentTriangle>::Iterator Poly_BaseIteratorOfCoherentTriangle;
typedef NCollection_List <Handle_Poly_Triangulation> Poly_ListOfTriangulation;
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%rename(poly) Poly;
class Poly {
	public:
		%feature("compactdefaultargs") Catenate;
		%feature("autodoc", "	* Computes and stores the link from nodes to triangles and from triangles to neighbouring triangles. This tool is obsolete, replaced by Poly_CoherentTriangulation Algorithm to make minimal loops in a graph Join several triangulations to one new triangulation object. The new triangulation is just a mechanical sum of input triangulations, without node sharing. UV coordinates are dropped in the result.

	:param lstTri:
	:type lstTri: Poly_ListOfTriangulation &
	:rtype: Handle_Poly_Triangulation
") Catenate;
		static Handle_Poly_Triangulation Catenate (const Poly_ListOfTriangulation & lstTri);
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "	* Writes the content of the triangulation <T> on the stream <OS>. If <Compact> is true this is a 'save' format intended to be read back with the Read method. If compact is False it is a 'Dump' format intended to be informative.

	:param T:
	:type T: Handle_Poly_Triangulation &
	:param OS:
	:type OS: Standard_OStream &
	:param Compact: default value is Standard_True
	:type Compact: bool
	:rtype: void
") Write;
		static void Write (const Handle_Poly_Triangulation & T,Standard_OStream & OS,const Standard_Boolean Compact = Standard_True);
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "	* Writes the content of the 3D polygon <P> on the stream <OS>. If <Compact> is true this is a 'save' format intended to be read back with the Read method. If compact is False it is a 'Dump' format intended to be informative.

	:param P:
	:type P: Handle_Poly_Polygon3D &
	:param OS:
	:type OS: Standard_OStream &
	:param Compact: default value is Standard_True
	:type Compact: bool
	:rtype: void
") Write;
		static void Write (const Handle_Poly_Polygon3D & P,Standard_OStream & OS,const Standard_Boolean Compact = Standard_True);
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "	* Writes the content of the 2D polygon <P> on the stream <OS>. If <Compact> is true this is a 'save' format intended to be read back with the Read method. If compact is False it is a 'Dump' format intended to be informative.

	:param P:
	:type P: Handle_Poly_Polygon2D &
	:param OS:
	:type OS: Standard_OStream &
	:param Compact: default value is Standard_True
	:type Compact: bool
	:rtype: void
") Write;
		static void Write (const Handle_Poly_Polygon2D & P,Standard_OStream & OS,const Standard_Boolean Compact = Standard_True);
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "	* Dumps the triangulation. This is a call to the previous method with Comapct set to False.

	:param T:
	:type T: Handle_Poly_Triangulation &
	:param OS:
	:type OS: Standard_OStream &
	:rtype: void
") Dump;
		static void Dump (const Handle_Poly_Triangulation & T,Standard_OStream & OS);
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "	* Dumps the 3D polygon. This is a call to the previous method with Comapct set to False.

	:param P:
	:type P: Handle_Poly_Polygon3D &
	:param OS:
	:type OS: Standard_OStream &
	:rtype: void
") Dump;
		static void Dump (const Handle_Poly_Polygon3D & P,Standard_OStream & OS);
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "	* Dumps the 2D polygon. This is a call to the previous method with Comapct set to False.

	:param P:
	:type P: Handle_Poly_Polygon2D &
	:param OS:
	:type OS: Standard_OStream &
	:rtype: void
") Dump;
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
        		%feature("compactdefaultargs") ComputeNormals;
		%feature("autodoc", "	* Compute node normals for face triangulation as mean normal of surrounding triangles

	:param Tri:
	:type Tri: Handle_Poly_Triangulation &
	:rtype: void
") ComputeNormals;
		static void ComputeNormals (const Handle_Poly_Triangulation & Tri);
		%feature("compactdefaultargs") PointOnTriangle;
		%feature("autodoc", "	* Computes parameters of the point P on triangle defined by points P1, P2, and P3, in 2d. The parameters U and V are defined so that P = P1 + U * (P2 - P1) + V * (P3 - P1), with U >= 0, V >= 0, U + V <= 1. If P is located outside of triangle, or triangle is degenerated, the returned parameters correspond to closest point, and returned value is square of the distance from original point to triangle (0 if point is inside).

	:param P1:
	:type P1: gp_XY
	:param P2:
	:type P2: gp_XY
	:param P3:
	:type P3: gp_XY
	:param P:
	:type P: gp_XY
	:param UV:
	:type UV: gp_XY
	:rtype: float
") PointOnTriangle;
		static Standard_Real PointOnTriangle (const gp_XY & P1,const gp_XY & P2,const gp_XY & P3,const gp_XY & P,gp_XY & UV);
};


%extend Poly {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Poly_Array1OfTriangle;
class Poly_Array1OfTriangle {
	public:
		%feature("compactdefaultargs") Poly_Array1OfTriangle;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") Poly_Array1OfTriangle;
		 Poly_Array1OfTriangle (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Poly_Array1OfTriangle;
		%feature("autodoc", "	:param Item:
	:type Item: Poly_Triangle &
	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") Poly_Array1OfTriangle;
		 Poly_Array1OfTriangle (const Poly_Triangle & Item,const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Poly_Triangle &
	:rtype: None
") Init;
		void Init (const Poly_Triangle & V);
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
		%feature("compactdefaultargs") IsAllocated;
		%feature("autodoc", "	:rtype: bool
") IsAllocated;
		Standard_Boolean IsAllocated ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: Poly_Array1OfTriangle &
	:rtype: Poly_Array1OfTriangle
") Assign;
		const Poly_Array1OfTriangle & Assign (const Poly_Array1OfTriangle & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: Poly_Array1OfTriangle &
	:rtype: Poly_Array1OfTriangle
") operator =;
		const Poly_Array1OfTriangle & operator = (const Poly_Array1OfTriangle & Other);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: Poly_Triangle &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Poly_Triangle & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Poly_Triangle
") Value;
		const Poly_Triangle & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Poly_Triangle
") ChangeValue;
		Poly_Triangle & ChangeValue (const Standard_Integer Index);
};


%extend Poly_Array1OfTriangle {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Poly_CoherentLink;
class Poly_CoherentLink {
	public:
		%feature("compactdefaultargs") Poly_CoherentLink;
		%feature("autodoc", "	* /** * Empty constructor. */

	:rtype: None
") Poly_CoherentLink;
		 Poly_CoherentLink ();
		%feature("compactdefaultargs") Poly_CoherentLink;
		%feature("autodoc", "	* /** * Constructor. Creates a Link that has no reference to 'opposite nodes'. * This constructor is useful to create temporary object that is not * inserted into any existing triangulation. */

	:param iNode0:
	:type iNode0: int
	:param iNode1:
	:type iNode1: int
	:rtype: None
") Poly_CoherentLink;
		 Poly_CoherentLink (const Standard_Integer iNode0,const Standard_Integer iNode1);
		%feature("compactdefaultargs") Poly_CoherentLink;
		%feature("autodoc", "	* /** * Constructor, takes a triangle and a side. A link is created always such * that myNode[0] < myNode[1]. Unlike the previous constructor, this one * assigns the 'opposite node' fields. This constructor is used when a * link is inserted into a Poly_CoherentTriangulation structure. * @param theTri * Triangle containing the link that is created * @param iSide * Can be 0, 1 or 2. Index of the node */

	:param theTri:
	:type theTri: Poly_CoherentTriangle &
	:param iSide:
	:type iSide: int
	:rtype: None
") Poly_CoherentLink;
		 Poly_CoherentLink (const Poly_CoherentTriangle & theTri,Standard_Integer iSide);
		%feature("compactdefaultargs") Node;
		%feature("autodoc", "	* /** * Return the node index in the current triangulation. * @param ind * 0 or 1 making distinction of the two nodes that constitute the Link. * Node(0) always returns a smaller number than Node(1). */

	:param ind:
	:type ind: int
	:rtype: inline int
") Node;
		inline Standard_Integer Node (const Standard_Integer ind);
		%feature("compactdefaultargs") OppositeNode;
		%feature("autodoc", "	* /** * Return the opposite node (belonging to the left or right incident triangle) * index in the current triangulation. * @param ind * 0 or 1 making distinction of the two involved triangles: 0 on the left, * 1 on the right side of the Link. */

	:param ind:
	:type ind: int
	:rtype: inline int
") OppositeNode;
		inline Standard_Integer OppositeNode (const Standard_Integer ind);
		%feature("compactdefaultargs") GetAttribute;
		%feature("autodoc", "	* /** * Query the attribute of the Link. */

	:rtype: inline Standard_Address
") GetAttribute;
		inline Standard_Address GetAttribute ();
		%feature("compactdefaultargs") SetAttribute;
		%feature("autodoc", "	* /** * Set the attribute of the Link. */

	:param theAtt:
	:type theAtt: Standard_Address
	:rtype: inline void
") SetAttribute;
		inline void SetAttribute (const Standard_Address theAtt);
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	* /** * Query the status of the link - if it is an invalid one. * An invalid link has Node members equal to -1. */

	:rtype: inline bool
") IsEmpty;
		inline Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") Nullify;
		%feature("autodoc", "	* /** * Invalidate this Link. */

	:rtype: inline void
") Nullify;
		inline void Nullify ();
};


%extend Poly_CoherentLink {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Poly_CoherentNode;
class Poly_CoherentNode : public gp_XYZ {
	public:
		%feature("compactdefaultargs") Poly_CoherentNode;
		%feature("autodoc", "	* /** * Empty constructor. */

	:rtype: None
") Poly_CoherentNode;
		 Poly_CoherentNode ();
		%feature("compactdefaultargs") Poly_CoherentNode;
		%feature("autodoc", "	* /** * Constructor. */

	:param thePnt:
	:type thePnt: gp_XYZ
	:rtype: None
") Poly_CoherentNode;
		 Poly_CoherentNode (const gp_XYZ & thePnt);
		%feature("compactdefaultargs") SetUV;
		%feature("autodoc", "	* /** * Set the UV coordinates of the Node. */

	:param theU:
	:type theU: float
	:param theV:
	:type theV: float
	:rtype: inline void
") SetUV;
		inline void SetUV (const Standard_Real theU,const Standard_Real theV);
		%feature("compactdefaultargs") GetU;
		%feature("autodoc", "	* /** * Get U coordinate of the Node. */

	:rtype: inline float
") GetU;
		inline Standard_Real GetU ();
		%feature("compactdefaultargs") GetV;
		%feature("autodoc", "	* /** * Get V coordinate of the Node. */

	:rtype: inline float
") GetV;
		inline Standard_Real GetV ();
		%feature("compactdefaultargs") SetNormal;
		%feature("autodoc", "	* /** * Define the normal vector in the Node. */

	:param theVector:
	:type theVector: gp_XYZ
	:rtype: None
") SetNormal;
		void SetNormal (const gp_XYZ & theVector);
		%feature("compactdefaultargs") HasNormal;
		%feature("autodoc", "	* /** * Query if the Node contains a normal vector. */

	:rtype: inline bool
") HasNormal;
		inline Standard_Boolean HasNormal ();
		%feature("compactdefaultargs") GetNormal;
		%feature("autodoc", "	* /** * Get the stored normal in the node. */

	:rtype: inline gp_XYZ
") GetNormal;
		inline gp_XYZ GetNormal ();
		%feature("compactdefaultargs") SetIndex;
		%feature("autodoc", "	* /** * Set the value of node Index. */

	:param theIndex:
	:type theIndex: int
	:rtype: inline void
") SetIndex;
		inline void SetIndex (const Standard_Integer theIndex);
		%feature("compactdefaultargs") GetIndex;
		%feature("autodoc", "	* /** * Get the value of node Index. */

	:rtype: inline int
") GetIndex;
		inline Standard_Integer GetIndex ();
		%feature("compactdefaultargs") IsFreeNode;
		%feature("autodoc", "	* /** * Check if this is a free node, i.e., a node without a single * incident triangle. */

	:rtype: inline bool
") IsFreeNode;
		inline Standard_Boolean IsFreeNode ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	* /** * Reset the Node to void. */

	:param &:
	:type &: Handle_NCollection_BaseAllocator
	:rtype: None
") Clear;
		void Clear (const Handle_NCollection_BaseAllocator &);
		%feature("compactdefaultargs") AddTriangle;
		%feature("autodoc", "	* /** * Connect a triangle to this Node. */

	:param theTri:
	:type theTri: Poly_CoherentTriangle &
	:param theA:
	:type theA: Handle_NCollection_BaseAllocator &
	:rtype: None
") AddTriangle;
		void AddTriangle (const Poly_CoherentTriangle & theTri,const Handle_NCollection_BaseAllocator & theA);
		%feature("compactdefaultargs") RemoveTriangle;
		%feature("autodoc", "	* /** * Disconnect a triangle from this Node. */

	:param theTri:
	:type theTri: Poly_CoherentTriangle &
	:param theA:
	:type theA: Handle_NCollection_BaseAllocator &
	:rtype: bool
") RemoveTriangle;
		Standard_Boolean RemoveTriangle (const Poly_CoherentTriangle & theTri,const Handle_NCollection_BaseAllocator & theA);
		%feature("compactdefaultargs") TriangleIterator;
		%feature("autodoc", "	* /** * Create an iterator of incident triangles. */

	:rtype: inline Poly_CoherentTriPtr::Iterator
") TriangleIterator;
		inline Poly_CoherentTriPtr::Iterator TriangleIterator ();

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        };


%extend Poly_CoherentNode {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Poly_CoherentTriangle;
class Poly_CoherentTriangle {
	public:
		%feature("compactdefaultargs") Poly_CoherentTriangle;
		%feature("autodoc", "	* /** * Empty constructor. */

	:rtype: None
") Poly_CoherentTriangle;
		 Poly_CoherentTriangle ();
		%feature("compactdefaultargs") Poly_CoherentTriangle;
		%feature("autodoc", "	* /** * Constructor. */

	:param iNode0:
	:type iNode0: int
	:param iNode1:
	:type iNode1: int
	:param iNode2:
	:type iNode2: int
	:rtype: None
") Poly_CoherentTriangle;
		 Poly_CoherentTriangle (const Standard_Integer iNode0,const Standard_Integer iNode1,const Standard_Integer iNode2);
		%feature("compactdefaultargs") Node;
		%feature("autodoc", "	* /** * Query the node index in the position given by the parameter 'ind' */

	:param ind:
	:type ind: int
	:rtype: inline int
") Node;
		inline Standard_Integer Node (const Standard_Integer ind);
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	* /** * Query if this is a valid triangle. */

	:rtype: inline bool
") IsEmpty;
		inline Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") SetConnection;
		%feature("autodoc", "	* /** * Create connection with another triangle theTri. * This method creates both connections: in this triangle and in theTri. You * do not need to call the same method on triangle theTr. * @param iConn * Can be 0, 1 or 2 - index of the node that is opposite to the connection * (shared link). * @param theTr * Triangle that is connected on the given link. * returns * True if successful, False if the connection is rejected * due to improper topology. */

	:param iConn:
	:type iConn: int
	:param theTr:
	:type theTr: Poly_CoherentTriangle &
	:rtype: bool
") SetConnection;
		Standard_Boolean SetConnection (const Standard_Integer iConn,Poly_CoherentTriangle & theTr);
		%feature("compactdefaultargs") SetConnection;
		%feature("autodoc", "	* /** * Create connection with another triangle theTri. * This method creates both connections: in this triangle and in theTri. * This method is slower than the previous one, because it makes analysis * what sides of both triangles are connected. * @param theTri * Triangle that is connected. * returns * True if successful, False if the connection is rejected * due to improper topology. */

	:param theTri:
	:type theTri: Poly_CoherentTriangle &
	:rtype: bool
") SetConnection;
		Standard_Boolean SetConnection (Poly_CoherentTriangle & theTri);
		%feature("compactdefaultargs") RemoveConnection;
		%feature("autodoc", "	* /** * Remove the connection with the given index. * @param iConn * Can be 0, 1 or 2 - index of the node that is opposite to the connection * (shared link). */

	:param iConn:
	:type iConn: int
	:rtype: None
") RemoveConnection;
		void RemoveConnection (const Standard_Integer iConn);
		%feature("compactdefaultargs") RemoveConnection;
		%feature("autodoc", "	* /** * Remove the connection with the given Triangle. * returns * True if successfuol or False if the connection has not been found. */

	:param theTri:
	:type theTri: Poly_CoherentTriangle &
	:rtype: bool
") RemoveConnection;
		Standard_Boolean RemoveConnection (Poly_CoherentTriangle & theTri);
		%feature("compactdefaultargs") NConnections;
		%feature("autodoc", "	* /** * Query the number of connected triangles. */

	:rtype: inline int
") NConnections;
		inline Standard_Integer NConnections ();
		%feature("compactdefaultargs") GetConnectedNode;
		%feature("autodoc", "	* /** * Query the connected node on the given side. * Returns -1 if there is no connection on the specified side. */

	:param iConn:
	:type iConn: int
	:rtype: inline int
") GetConnectedNode;
		inline Standard_Integer GetConnectedNode (const Standard_Integer iConn);
		%feature("compactdefaultargs") GetConnectedTri;
		%feature("autodoc", "	* /** * Query the connected triangle on the given side. * Returns NULL if there is no connection on the specified side. */

	:param iConn:
	:type iConn: int
	:rtype: inline  Poly_CoherentTriangle *
") GetConnectedTri;
		inline const Poly_CoherentTriangle * GetConnectedTri (const Standard_Integer iConn);
		%feature("compactdefaultargs") GetLink;
		%feature("autodoc", "	* /** * Query the Link associate with the given side of the Triangle. * May return NULL if there are no links in the triangulation. */

	:param iLink:
	:type iLink: int
	:rtype: inline  Poly_CoherentLink *
") GetLink;
		inline const Poly_CoherentLink * GetLink (const Standard_Integer iLink);
		%feature("compactdefaultargs") FindConnection;
		%feature("autodoc", "	* /** * Retuns the index of the connection with the given triangle, or -1 if not * found. */

	:param &:
	:type &: Poly_CoherentTriangle
	:rtype: int
") FindConnection;
		Standard_Integer FindConnection (const Poly_CoherentTriangle &);
};


%extend Poly_CoherentTriangle {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Poly_Connect;
class Poly_Connect {
	public:
		%feature("compactdefaultargs") Poly_Connect;
		%feature("autodoc", "	* Constructs an algorithm to explore the adjacency data of nodes or triangles for the triangulation T.

	:param T:
	:type T: Handle_Poly_Triangulation &
	:rtype: None
") Poly_Connect;
		 Poly_Connect (const Handle_Poly_Triangulation & T);
		%feature("compactdefaultargs") Triangulation;
		%feature("autodoc", "	* Returns the triangulation analyzed by this tool.

	:rtype: Handle_Poly_Triangulation
") Triangulation;
		Handle_Poly_Triangulation Triangulation ();
		%feature("compactdefaultargs") Triangle;
		%feature("autodoc", "	* Returns the index of a triangle containing the node at index N in the nodes table specific to the triangulation analyzed by this tool

	:param N:
	:type N: int
	:rtype: int
") Triangle;
		Standard_Integer Triangle (const Standard_Integer N);
		%feature("compactdefaultargs") Triangles;
		%feature("autodoc", "	* Returns in t1, t2 and t3, the indices of the 3 triangles adjacent to the triangle at index T in the triangles table specific to the triangulation analyzed by this tool. Warning Null indices are returned when there are fewer than 3 adjacent triangles.

	:param T:
	:type T: int
	:param t1:
	:type t1: int &
	:param t2:
	:type t2: int &
	:param t3:
	:type t3: int &
	:rtype: None
") Triangles;
		void Triangles (const Standard_Integer T,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("compactdefaultargs") Nodes;
		%feature("autodoc", "	* Returns, in n1, n2 and n3, the indices of the 3 nodes adjacent to the triangle referenced at index T in the triangles table specific to the triangulation analyzed by this tool. Warning Null indices are returned when there are fewer than 3 adjacent nodes.

	:param T:
	:type T: int
	:param n1:
	:type n1: int &
	:param n2:
	:type n2: int &
	:param n3:
	:type n3: int &
	:rtype: None
") Nodes;
		void Nodes (const Standard_Integer T,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	* Initializes an iterator to search for all the triangles containing the node referenced at index N in the nodes table, for the triangulation analyzed by this tool. The iterator is managed by the following functions: - More, which checks if there are still elements in the iterator - Next, which positions the iterator on the next element - Value, which returns the current element. The use of such an iterator provides direct access to the triangles around a particular node, i.e. it avoids iterating on all the component triangles of a triangulation. Example Poly_Connect C(Tr); for (C.Initialize(n1);C.More();C.Next()) { t = C.Value(); }

	:param N:
	:type N: int
	:rtype: None
") Initialize;
		void Initialize (const Standard_Integer N);
		%feature("compactdefaultargs") More;
		%feature("autodoc", "	* Returns true if there is another element in the iterator defined with the function Initialize (i.e. if there is another triangle containing the given node).

	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "	* Advances the iterator defined with the function Initialize to access the next triangle. Note: There is no action if the iterator is empty (i.e. if the function More returns false).-

	:rtype: None
") Next;
		void Next ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Returns the index of the current triangle to which the iterator, defined with the function Initialize, points. This is an index in the triangles table specific to the triangulation analyzed by this tool

	:rtype: int
") Value;
		Standard_Integer Value ();
};


%extend Poly_Connect {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Poly_HArray1OfTriangle;
class Poly_HArray1OfTriangle : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") Poly_HArray1OfTriangle;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:rtype: None
") Poly_HArray1OfTriangle;
		 Poly_HArray1OfTriangle (const Standard_Integer Low,const Standard_Integer Up);
		%feature("compactdefaultargs") Poly_HArray1OfTriangle;
		%feature("autodoc", "	:param Low:
	:type Low: int
	:param Up:
	:type Up: int
	:param V:
	:type V: Poly_Triangle &
	:rtype: None
") Poly_HArray1OfTriangle;
		 Poly_HArray1OfTriangle (const Standard_Integer Low,const Standard_Integer Up,const Poly_Triangle & V);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param V:
	:type V: Poly_Triangle &
	:rtype: None
") Init;
		void Init (const Poly_Triangle & V);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "	:rtype: int
") Lower;
		Standard_Integer Lower ();
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "	:rtype: int
") Upper;
		Standard_Integer Upper ();
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Value:
	:type Value: Poly_Triangle &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const Poly_Triangle & Value);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Poly_Triangle
") Value;
		const Poly_Triangle & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Poly_Triangle
") ChangeValue;
		Poly_Triangle & ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Array1;
		%feature("autodoc", "	:rtype: Poly_Array1OfTriangle
") Array1;
		const Poly_Array1OfTriangle & Array1 ();
		%feature("compactdefaultargs") ChangeArray1;
		%feature("autodoc", "	:rtype: Poly_Array1OfTriangle
") ChangeArray1;
		Poly_Array1OfTriangle & ChangeArray1 ();
};


%extend Poly_HArray1OfTriangle {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Poly_HArray1OfTriangle(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Poly_HArray1OfTriangle::Handle_Poly_HArray1OfTriangle %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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
    Poly_HArray1OfTriangle* _get_reference() {
    return (Poly_HArray1OfTriangle*)$self->Access();
    }
};

%extend Handle_Poly_HArray1OfTriangle {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Poly_HArray1OfTriangle {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Poly_Polygon2D;
class Poly_Polygon2D : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") Poly_Polygon2D;
		%feature("autodoc", "	* Constructs a 2D polygon defined by the table of points, <Nodes>.

	:param Nodes:
	:type Nodes: TColgp_Array1OfPnt2d
	:rtype: None
") Poly_Polygon2D;
		 Poly_Polygon2D (const TColgp_Array1OfPnt2d & Nodes);
		%feature("compactdefaultargs") Deflection;
		%feature("autodoc", "	* Returns the deflection of this polygon. Deflection is used in cases where the polygon is an approximate representation of a curve. Deflection represents the maximum distance permitted between any point on the curve and the corresponding point on the polygon. By default the deflection value is equal to 0. An algorithm using this 2D polygon with a deflection value equal to 0 considers that it is working with a true polygon and not with an approximate representation of a curve. The Deflection function is used to modify the deflection value of this polygon. The deflection value can be used by any algorithm working with 2D polygons. For example: - An algorithm may use a unique deflection value for all its polygons. In this case it is not necessary to use the Deflection function. - Or an algorithm may want to attach a different deflection to each polygon. In this case, the Deflection function is used to set a value on each polygon, and later to fetch the value.

	:rtype: float
") Deflection;
		Standard_Real Deflection ();
		%feature("compactdefaultargs") Deflection;
		%feature("autodoc", "	* Sets the deflection of this polygon to D

	:param D:
	:type D: float
	:rtype: None
") Deflection;
		void Deflection (const Standard_Real D);
		%feature("compactdefaultargs") NbNodes;
		%feature("autodoc", "	* Returns the number of nodes in this polygon. Note: If the polygon is closed, the point of closure is repeated at the end of its table of nodes. Thus, on a closed triangle, the function NbNodes returns 4.

	:rtype: int
") NbNodes;
		Standard_Integer NbNodes ();
		%feature("compactdefaultargs") Nodes;
		%feature("autodoc", "	* Returns the table of nodes for this polygon.

	:rtype: TColgp_Array1OfPnt2d
") Nodes;
		const TColgp_Array1OfPnt2d & Nodes ();
};


%extend Poly_Polygon2D {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Poly_Polygon2D(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Poly_Polygon2D::Handle_Poly_Polygon2D %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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
    Poly_Polygon2D* _get_reference() {
    return (Poly_Polygon2D*)$self->Access();
    }
};

%extend Handle_Poly_Polygon2D {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Poly_Polygon2D {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Poly_Polygon3D;
class Poly_Polygon3D : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") Poly_Polygon3D;
		%feature("autodoc", "	* onstructs a 3D polygon defined by the table of points, Nodes.

	:param Nodes:
	:type Nodes: TColgp_Array1OfPnt
	:rtype: None
") Poly_Polygon3D;
		 Poly_Polygon3D (const TColgp_Array1OfPnt & Nodes);
		%feature("compactdefaultargs") Poly_Polygon3D;
		%feature("autodoc", "	* Constructs a 3D polygon defined by the table of points, Nodes, and the parallel table of parameters, Parameters, where each value of the table Parameters is the parameter of the corresponding point on the curve approximated by the constructed polygon. Warning Both the Nodes and Parameters tables must have the same bounds. This property is not checked at construction time.

	:param Nodes:
	:type Nodes: TColgp_Array1OfPnt
	:param Parameters:
	:type Parameters: TColStd_Array1OfReal &
	:rtype: None
") Poly_Polygon3D;
		 Poly_Polygon3D (const TColgp_Array1OfPnt & Nodes,const TColStd_Array1OfReal & Parameters);
		%feature("compactdefaultargs") Deflection;
		%feature("autodoc", "	* Returns the deflection of this polygon

	:rtype: float
") Deflection;
		Standard_Real Deflection ();
		%feature("compactdefaultargs") Deflection;
		%feature("autodoc", "	* Sets the deflection of this polygon to D. See more on deflection in Poly_Polygon2D

	:param D:
	:type D: float
	:rtype: None
") Deflection;
		void Deflection (const Standard_Real D);
		%feature("compactdefaultargs") NbNodes;
		%feature("autodoc", "	* Returns the number of nodes in this polygon. Note: If the polygon is closed, the point of closure is repeated at the end of its table of nodes. Thus, on a closed triangle the function NbNodes returns 4.

	:rtype: int
") NbNodes;
		Standard_Integer NbNodes ();
		%feature("compactdefaultargs") Nodes;
		%feature("autodoc", "	* Returns the table of nodes for this polygon.

	:rtype: TColgp_Array1OfPnt
") Nodes;
		const TColgp_Array1OfPnt & Nodes ();
		%feature("compactdefaultargs") HasParameters;
		%feature("autodoc", "	* Returns the table of the parameters associated with each node in this polygon. HasParameters function checks if parameters are associated with the nodes of this polygon.

	:rtype: bool
") HasParameters;
		Standard_Boolean HasParameters ();
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "	* Returns true if parameters are associated with the nodes in this polygon.

	:rtype: TColStd_Array1OfReal
") Parameters;
		const TColStd_Array1OfReal & Parameters ();
		%feature("compactdefaultargs") ChangeParameters;
		%feature("autodoc", "	* Returns the table of the parameters associated with each node in this polygon. ChangeParameters function returnes the array as shared. Therefore if the table is selected by reference you can, by simply modifying it, directly modify the data structure of this polygon.

	:rtype: TColStd_Array1OfReal
") ChangeParameters;
		TColStd_Array1OfReal & ChangeParameters ();
};


%extend Poly_Polygon3D {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Poly_Polygon3D(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Poly_Polygon3D::Handle_Poly_Polygon3D %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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
    Poly_Polygon3D* _get_reference() {
    return (Poly_Polygon3D*)$self->Access();
    }
};

%extend Handle_Poly_Polygon3D {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Poly_Polygon3D {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Poly_PolygonOnTriangulation;
class Poly_PolygonOnTriangulation : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") Poly_PolygonOnTriangulation;
		%feature("autodoc", "	* Constructs a 3D polygon on the triangulation of a shape, defined by the table of nodes, <Nodes>.

	:param Nodes:
	:type Nodes: TColStd_Array1OfInteger &
	:rtype: None
") Poly_PolygonOnTriangulation;
		 Poly_PolygonOnTriangulation (const TColStd_Array1OfInteger & Nodes);
		%feature("compactdefaultargs") Poly_PolygonOnTriangulation;
		%feature("autodoc", "	* Constructs a 3D polygon on the triangulation of a shape, defined by: - the table of nodes, Nodes, and the table of parameters, <Parameters>. where: - a node value is an index in the table of nodes specific to an existing triangulation of a shape - and a parameter value is the value of the parameter of the corresponding point on the curve approximated by the constructed polygon. Warning The tables Nodes and Parameters must be the same size. This property is not checked at construction time.

	:param Nodes:
	:type Nodes: TColStd_Array1OfInteger &
	:param Parameters:
	:type Parameters: TColStd_Array1OfReal &
	:rtype: None
") Poly_PolygonOnTriangulation;
		 Poly_PolygonOnTriangulation (const TColStd_Array1OfInteger & Nodes,const TColStd_Array1OfReal & Parameters);
		%feature("compactdefaultargs") Deflection;
		%feature("autodoc", "	* Returns the deflection of this polygon

	:rtype: float
") Deflection;
		Standard_Real Deflection ();
		%feature("compactdefaultargs") Deflection;
		%feature("autodoc", "	* Sets the deflection of this polygon to D. See more on deflection in Poly_Polygones2D.

	:param D:
	:type D: float
	:rtype: None
") Deflection;
		void Deflection (const Standard_Real D);
		%feature("compactdefaultargs") NbNodes;
		%feature("autodoc", "	* Returns the number of nodes for this polygon. Note: If the polygon is closed, the point of closure is repeated at the end of its table of nodes. Thus, on a closed triangle, the function NbNodes returns 4.

	:rtype: int
") NbNodes;
		Standard_Integer NbNodes ();
		%feature("compactdefaultargs") Nodes;
		%feature("autodoc", "	* Returns the table of nodes for this polygon. A node value is an index in the table of nodes specific to an existing triangulation of a shape.

	:rtype: TColStd_Array1OfInteger
") Nodes;
		const TColStd_Array1OfInteger & Nodes ();
		%feature("compactdefaultargs") HasParameters;
		%feature("autodoc", "	* Returns true if parameters are associated with the nodes in this polygon.

	:rtype: bool
") HasParameters;
		Standard_Boolean HasParameters ();
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "	* Returns the table of the parameters associated with each node in this polygon. Warning Use the function HasParameters to check if parameters are associated with the nodes in this polygon.

	:rtype: Handle_TColStd_HArray1OfReal
") Parameters;
		Handle_TColStd_HArray1OfReal Parameters ();
};


%extend Poly_PolygonOnTriangulation {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Poly_PolygonOnTriangulation(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Poly_PolygonOnTriangulation::Handle_Poly_PolygonOnTriangulation %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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
    Poly_PolygonOnTriangulation* _get_reference() {
    return (Poly_PolygonOnTriangulation*)$self->Access();
    }
};

%extend Handle_Poly_PolygonOnTriangulation {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Poly_PolygonOnTriangulation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Poly_Triangle;
class Poly_Triangle {
	public:
		%feature("compactdefaultargs") Poly_Triangle;
		%feature("autodoc", "	* Constructs a triangle and sets all indices to zero.

	:rtype: None
") Poly_Triangle;
		 Poly_Triangle ();
		%feature("compactdefaultargs") Poly_Triangle;
		%feature("autodoc", "	* Constructs a triangle and sets its three indices to N1, N2 and N3 respectively, where these node values are indices in the table of nodes specific to an existing triangulation of a shape.

	:param N1:
	:type N1: int
	:param N2:
	:type N2: int
	:param N3:
	:type N3: int
	:rtype: None
") Poly_Triangle;
		 Poly_Triangle (const Standard_Integer N1,const Standard_Integer N2,const Standard_Integer N3);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Sets the value of the three nodes of this triangle to N1, N2 and N3 respectively.

	:param N1:
	:type N1: int
	:param N2:
	:type N2: int
	:param N3:
	:type N3: int
	:rtype: None
") Set;
		void Set (const Standard_Integer N1,const Standard_Integer N2,const Standard_Integer N3);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Sets the value of the Indexth node of this triangle to Node. Raises OutOfRange if Index is not in 1,2,3

	:param Index:
	:type Index: int
	:param Node:
	:type Node: int
	:rtype: None
") Set;
		void Set (const Standard_Integer Index,const Standard_Integer Node);
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "	* Returns the node indices of this triangle in N1, N2 and N3.

	:param N1:
	:type N1: int &
	:param N2:
	:type N2: int &
	:param N3:
	:type N3: int &
	:rtype: None
") Get;
		void Get (Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Get the node of given Index. Raises OutOfRange from Standard if Index is not in 1,2,3

	:param Index:
	:type Index: int
	:rtype: int
") Value;
		Standard_Integer Value (const Standard_Integer Index);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	* Get the node of given Index. Raises OutOfRange if Index is not in 1,2,3

	:param Index:
	:type Index: int
	:rtype: int
") ChangeValue;
		Standard_Integer & ChangeValue (const Standard_Integer Index);
};


%extend Poly_Triangle {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Poly_Triangulation;
class Poly_Triangulation : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") Poly_Triangulation;
		%feature("autodoc", "	* Constructs a triangulation from a set of triangles. The triangulation is initialized without a triangle or a node, but capable of containing nbNodes nodes, and nbTriangles triangles. Here the UVNodes flag indicates whether 2D nodes will be associated with 3D ones, (i.e. to enable a 2D representation).

	:param nbNodes:
	:type nbNodes: int
	:param nbTriangles:
	:type nbTriangles: int
	:param UVNodes:
	:type UVNodes: bool
	:rtype: None
") Poly_Triangulation;
		 Poly_Triangulation (const Standard_Integer nbNodes,const Standard_Integer nbTriangles,const Standard_Boolean UVNodes);
		%feature("compactdefaultargs") Poly_Triangulation;
		%feature("autodoc", "	* Constructs a triangulation from a set of triangles. The triangulation is initialized with 3D points from Nodes and triangles from Triangles.

	:param Nodes:
	:type Nodes: TColgp_Array1OfPnt
	:param Triangles:
	:type Triangles: Poly_Array1OfTriangle &
	:rtype: None
") Poly_Triangulation;
		 Poly_Triangulation (const TColgp_Array1OfPnt & Nodes,const Poly_Array1OfTriangle & Triangles);
		%feature("compactdefaultargs") Poly_Triangulation;
		%feature("autodoc", "	* Constructs a triangulation from a set of triangles. The triangulation is initialized with 3D points from Nodes, 2D points from UVNodes and triangles from Triangles, where coordinates of a 2D point from UVNodes are the (u, v) parameters of the corresponding 3D point from Nodes on the surface approximated by the constructed triangulation.

	:param Nodes:
	:type Nodes: TColgp_Array1OfPnt
	:param UVNodes:
	:type UVNodes: TColgp_Array1OfPnt2d
	:param Triangles:
	:type Triangles: Poly_Array1OfTriangle &
	:rtype: None
") Poly_Triangulation;
		 Poly_Triangulation (const TColgp_Array1OfPnt & Nodes,const TColgp_Array1OfPnt2d & UVNodes,const Poly_Array1OfTriangle & Triangles);
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "	* Creates full copy of current triangulation.

	:rtype: Handle_Poly_Triangulation
") Copy;
		Handle_Poly_Triangulation Copy ();
		%feature("compactdefaultargs") Deflection;
		%feature("autodoc", "	* Returns the deflection of this triangulation.

	:rtype: float
") Deflection;
		Standard_Real Deflection ();
		%feature("compactdefaultargs") Deflection;
		%feature("autodoc", "	* Sets the deflection of this triangulation to D. See more on deflection in Polygon2D

	:param D:
	:type D: float
	:rtype: None
") Deflection;
		void Deflection (const Standard_Real D);
		%feature("compactdefaultargs") RemoveUVNodes;
		%feature("autodoc", "	* Deallocates the UV nodes.

	:rtype: None
") RemoveUVNodes;
		void RemoveUVNodes ();
		%feature("compactdefaultargs") NbNodes;
		%feature("autodoc", "	* Returns the number of nodes for this triangulation. Null if the nodes are not yet defined.

	:rtype: int
") NbNodes;
		Standard_Integer NbNodes ();
		%feature("compactdefaultargs") NbTriangles;
		%feature("autodoc", "	* Returns the number of triangles for this triangulation. Null if the Triangles are not yet defined.

	:rtype: int
") NbTriangles;
		Standard_Integer NbTriangles ();
		%feature("compactdefaultargs") HasUVNodes;
		%feature("autodoc", "	* Returns true if 2D nodes are associated with 3D nodes for this triangulation.

	:rtype: bool
") HasUVNodes;
		Standard_Boolean HasUVNodes ();
		%feature("compactdefaultargs") Nodes;
		%feature("autodoc", "	* Returns the table of 3D nodes (3D points) for this triangulation.

	:rtype: TColgp_Array1OfPnt
") Nodes;
		const TColgp_Array1OfPnt & Nodes ();
		%feature("compactdefaultargs") ChangeNodes;
		%feature("autodoc", "	* Returns the table of 3D nodes (3D points) for this triangulation. The returned array is shared. Therefore if the table is selected by reference, you can, by simply modifying it, directly modify the data structure of this triangulation.

	:rtype: TColgp_Array1OfPnt
") ChangeNodes;
		TColgp_Array1OfPnt & ChangeNodes ();
		%feature("compactdefaultargs") UVNodes;
		%feature("autodoc", "	* Returns the table of 2D nodes (2D points) associated with each 3D node of this triangulation. The function HasUVNodes checks if 2D nodes are associated with the 3D nodes of this triangulation. Const reference on the 2d nodes values.

	:rtype: TColgp_Array1OfPnt2d
") UVNodes;
		const TColgp_Array1OfPnt2d & UVNodes ();
		%feature("compactdefaultargs") ChangeUVNodes;
		%feature("autodoc", "	* Returns the table of 2D nodes (2D points) associated with each 3D node of this triangulation. Function ChangeUVNodes shares the returned array. Therefore if the table is selected by reference, you can, by simply modifying it, directly modify the data structure of this triangulation.

	:rtype: TColgp_Array1OfPnt2d
") ChangeUVNodes;
		TColgp_Array1OfPnt2d & ChangeUVNodes ();
		%feature("compactdefaultargs") Triangles;
		%feature("autodoc", "	* Returns the table of triangles for this triangulation.

	:rtype: Poly_Array1OfTriangle
") Triangles;
		const Poly_Array1OfTriangle & Triangles ();
		%feature("compactdefaultargs") ChangeTriangles;
		%feature("autodoc", "	* Returns the table of triangles for this triangulation. Function ChangeUVNodes shares the returned array. Therefore if the table is selected by reference, you can, by simply modifying it, directly modify the data structure of this triangulation.

	:rtype: Poly_Array1OfTriangle
") ChangeTriangles;
		Poly_Array1OfTriangle & ChangeTriangles ();
		%feature("compactdefaultargs") SetNormals;
		%feature("autodoc", "	* Sets the table of node normals. raises exception if length of theNormals != 3*NbNodes

	:param theNormals:
	:type theNormals: Handle_TShort_HArray1OfShortReal &
	:rtype: None
") SetNormals;
		void SetNormals (const Handle_TShort_HArray1OfShortReal & theNormals);
		%feature("compactdefaultargs") Normals;
		%feature("autodoc", "	:rtype: TShort_Array1OfShortReal
") Normals;
		const TShort_Array1OfShortReal & Normals ();
		%feature("compactdefaultargs") ChangeNormals;
		%feature("autodoc", "	:rtype: TShort_Array1OfShortReal
") ChangeNormals;
		TShort_Array1OfShortReal & ChangeNormals ();
		%feature("compactdefaultargs") HasNormals;
		%feature("autodoc", "	:rtype: bool
") HasNormals;
		Standard_Boolean HasNormals ();
};


%extend Poly_Triangulation {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Poly_Triangulation(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Poly_Triangulation::Handle_Poly_Triangulation %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

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
    Poly_Triangulation* _get_reference() {
    return (Poly_Triangulation*)$self->Access();
    }
};

%extend Handle_Poly_Triangulation {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Poly_Triangulation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
