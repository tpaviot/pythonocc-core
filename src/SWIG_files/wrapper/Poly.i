/*
Copyright 2008-2020 Thomas Paviot (tpaviot@gmail.com)

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
%define POLYDOCSTRING
"Poly module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_poly.html"
%enddef
%module (package="OCC.Core", docstring=POLYDOCSTRING) Poly


%{
#ifdef WNT
#pragma warning(disable : 4716)
#endif
%}

%include ../common/CommonIncludes.i
%include ../common/ExceptionCatcher.i
%include ../common/FunctionTransformers.i
%include ../common/Operators.i
%include ../common/OccHandle.i


%{
#include<Poly_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<gp_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TShort_module.hxx>
#include<NCollection_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import gp.i
%import TColgp.i
%import TColStd.i
%import TShort.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
/* end public enums declaration */

/* python proy classes for enums */
%pythoncode {
};
/* end python proxy for enums */

/* handles */
%wrap_handle(Poly_Polygon2D)
%wrap_handle(Poly_Polygon3D)
%wrap_handle(Poly_PolygonOnTriangulation)
%wrap_handle(Poly_Triangulation)
%wrap_handle(Poly_HArray1OfTriangle)
/* end handles declaration */

/* templates */
%template(Poly_Array1OfTriangle) NCollection_Array1<Poly_Triangle>;

%extend NCollection_Array1<Poly_Triangle> {
    %pythoncode {
    def __getitem__(self, index):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            return self.Value(index + self.Lower())

    def __setitem__(self, index, value):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            self.SetValue(index + self.Lower(), value)

    def __len__(self):
        return self.Length()

    def __iter__(self):
        self.low = self.Lower()
        self.up = self.Upper()
        self.current = self.Lower() - 1
        return self

    def next(self):
        if self.current >= self.Upper():
            raise StopIteration
        else:
            self.current += 1
        return self.Value(self.current)

    __next__ = next
    }
};
%template(Poly_ListOfTriangulation) NCollection_List<opencascade::handle<Poly_Triangulation>>;

%extend NCollection_List<opencascade::handle<Poly_Triangulation>> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
/* end templates declaration */

/* typedefs */
typedef NCollection_Array1<Poly_Triangle> Poly_Array1OfTriangle;
typedef NCollection_Vector<Poly_CoherentLink>::Iterator Poly_BaseIteratorOfCoherentLink;
typedef NCollection_Vector<Poly_CoherentNode>::Iterator Poly_BaseIteratorOfCoherentNode;
typedef NCollection_Vector<Poly_CoherentTriangle>::Iterator Poly_BaseIteratorOfCoherentTriangle;
typedef NCollection_List<opencascade::handle<Poly_Triangulation>> Poly_ListOfTriangulation;
/* end typedefs declaration */

/*************
* class Poly *
*************/
%rename(poly) Poly;
class Poly {
	public:
		/****************** Catenate ******************/
		/**** md5 signature: 8b036e4e75e3078148e1b7346b52eb84 ****/
		%feature("compactdefaultargs") Catenate;
		%feature("autodoc", "Computes and stores the link from nodes to triangles and from triangles to neighbouring triangles. this tool is obsolete, replaced by poly_coherenttriangulation algorithm to make minimal loops in a graph join several triangulations to one new triangulation object. the new triangulation is just a mechanical sum of input triangulations, without node sharing. uv coordinates are dropped in the result.

Parameters
----------
lstTri: Poly_ListOfTriangulation

Returns
-------
opencascade::handle<Poly_Triangulation>
") Catenate;
		static opencascade::handle<Poly_Triangulation> Catenate(const Poly_ListOfTriangulation & lstTri);

		/****************** ComputeNormals ******************/
		/**** md5 signature: 4015a8f6c870ca14e91d70eaa454df12 ****/
		%feature("compactdefaultargs") ComputeNormals;
		%feature("autodoc", "Compute node normals for face triangulation as mean normal of surrounding triangles.

Parameters
----------
Tri: Poly_Triangulation

Returns
-------
None
") ComputeNormals;
		static void ComputeNormals(const opencascade::handle<Poly_Triangulation> & Tri);

		/****************** PointOnTriangle ******************/
		/**** md5 signature: f16707629e29bded6eb5591e5f49f99e ****/
		%feature("compactdefaultargs") PointOnTriangle;
		%feature("autodoc", "Computes parameters of the point p on triangle defined by points p1, p2, and p3, in 2d. the parameters u and v are defined so that p = p1 + u * (p2 - p1) + v * (p3 - p1), with u >= 0, v >= 0, u + v <= 1. if p is located outside of triangle, or triangle is degenerated, the returned parameters correspond to closest point, and returned value is square of the distance from original point to triangle (0 if point is inside).

Parameters
----------
P1: gp_XY
P2: gp_XY
P3: gp_XY
P: gp_XY
UV: gp_XY

Returns
-------
float
") PointOnTriangle;
		static Standard_Real PointOnTriangle(const gp_XY & P1, const gp_XY & P2, const gp_XY & P3, const gp_XY & P, gp_XY & UV);


            %feature("autodoc", "1");
            %extend{
                void ReadPolygon2DFromString(std::string src) {
                std::stringstream s(src);
                self->ReadPolygon2D(s);}
            };

            %feature("autodoc", "1");
            %extend{
                void ReadPolygon3DFromString(std::string src) {
                std::stringstream s(src);
                self->ReadPolygon3D(s);}
            };

            %feature("autodoc", "1");
            %extend{
                void ReadTriangulationFromString(std::string src) {
                std::stringstream s(src);
                self->ReadTriangulation(s);}
            };
};


%extend Poly {
	%pythoncode {
	__repr__ = _dumps_object

	@methodnotwrapped
	def PolygonProperties(self):
		pass
	}
};

/**************************
* class Poly_CoherentLink *
**************************/
class Poly_CoherentLink {
	public:
		/****************** Poly_CoherentLink ******************/
		/**** md5 signature: de339f475ff4c5e96b485232d5b4c51b ****/
		%feature("compactdefaultargs") Poly_CoherentLink;
		%feature("autodoc", "/** * empty constructor. */.

Returns
-------
None
") Poly_CoherentLink;
		 Poly_CoherentLink();

		/****************** Poly_CoherentLink ******************/
		/**** md5 signature: 4e38aae465e5a86814325a10b67df9b3 ****/
		%feature("compactdefaultargs") Poly_CoherentLink;
		%feature("autodoc", "No available documentation.

Parameters
----------
iNode0: int
iNode1: int

Returns
-------
None
") Poly_CoherentLink;
		 Poly_CoherentLink(const Standard_Integer iNode0, const Standard_Integer iNode1);

		/****************** Poly_CoherentLink ******************/
		/**** md5 signature: 4c370c5efce77297b2639c4a3356b1ac ****/
		%feature("compactdefaultargs") Poly_CoherentLink;
		%feature("autodoc", "/** * constructor, takes a triangle and a side. a link is created always such * that mynode[0] < mynode[1]. unlike the previous constructor, this one * assigns the 'opposite node' fields. this constructor is used when a * link is inserted into a poly_coherenttriangulation structure. * @param thetri * triangle containing the link that is created * @param iside * can be 0, 1 or 2. index of the node */.

Parameters
----------
theTri: Poly_CoherentTriangle
iSide: int

Returns
-------
None
") Poly_CoherentLink;
		 Poly_CoherentLink(const Poly_CoherentTriangle & theTri, Standard_Integer iSide);

		/****************** GetAttribute ******************/
		/**** md5 signature: f9b24d82f6ecd615807725529006c38c ****/
		%feature("compactdefaultargs") GetAttribute;
		%feature("autodoc", "/** * query the attribute of the link. */.

Returns
-------
Standard_Address
") GetAttribute;
		Standard_Address GetAttribute();

		/****************** IsEmpty ******************/
		/**** md5 signature: e0fa1d0f35a1c4ad702e4e993780ae41 ****/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "/** * query the status of the link - if it is an invalid one. * an invalid link has node members equal to -1. */.

Returns
-------
bool
") IsEmpty;
		Standard_Boolean IsEmpty();

		/****************** Node ******************/
		/**** md5 signature: 0c8b3e4d6b02b354a59bbdabd461f25e ****/
		%feature("compactdefaultargs") Node;
		%feature("autodoc", "/** * return the node index in the current triangulation. * @param ind * 0 or 1 making distinction of the two nodes that constitute the link. * node(0) always returns a smaller number than node(1). */.

Parameters
----------
ind: int

Returns
-------
int
") Node;
		Standard_Integer Node(const Standard_Integer ind);

		/****************** Nullify ******************/
		/**** md5 signature: da3ddb1c253fce8554813210fafdb757 ****/
		%feature("compactdefaultargs") Nullify;
		%feature("autodoc", "/** * invalidate this link. */.

Returns
-------
None
") Nullify;
		void Nullify();

		/****************** OppositeNode ******************/
		/**** md5 signature: 38ad0f771fdab79fb96de90e7fdf8dde ****/
		%feature("compactdefaultargs") OppositeNode;
		%feature("autodoc", "/** * return the opposite node (belonging to the left or right incident triangle) * index in the current triangulation. * @param ind * 0 or 1 making distinction of the two involved triangles: 0 on the left, * 1 on the right side of the link. */.

Parameters
----------
ind: int

Returns
-------
int
") OppositeNode;
		Standard_Integer OppositeNode(const Standard_Integer ind);

		/****************** SetAttribute ******************/
		/**** md5 signature: 010064256220b0dd62418f98aaddd85b ****/
		%feature("compactdefaultargs") SetAttribute;
		%feature("autodoc", "/** * set the attribute of the link. */.

Parameters
----------
theAtt: Standard_Address

Returns
-------
None
") SetAttribute;
		void SetAttribute(const Standard_Address theAtt);

};


%extend Poly_CoherentLink {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class Poly_CoherentNode *
**************************/
class Poly_CoherentNode : public gp_XYZ {
	public:
		/****************** Poly_CoherentNode ******************/
		/**** md5 signature: 2e6eb857b24efe616d474b306cd58a72 ****/
		%feature("compactdefaultargs") Poly_CoherentNode;
		%feature("autodoc", "/** * empty constructor. */.

Returns
-------
None
") Poly_CoherentNode;
		 Poly_CoherentNode();

		/****************** Poly_CoherentNode ******************/
		/**** md5 signature: 7e2af40a10394af569759ee7160a203e ****/
		%feature("compactdefaultargs") Poly_CoherentNode;
		%feature("autodoc", "/** * constructor. */.

Parameters
----------
thePnt: gp_XYZ

Returns
-------
None
") Poly_CoherentNode;
		 Poly_CoherentNode(const gp_XYZ & thePnt);

		/****************** AddTriangle ******************/
		/**** md5 signature: a342747927755ed5b36e383e9b43f2cf ****/
		%feature("compactdefaultargs") AddTriangle;
		%feature("autodoc", "/** * connect a triangle to this node. */.

Parameters
----------
theTri: Poly_CoherentTriangle
theA: NCollection_BaseAllocator

Returns
-------
None
") AddTriangle;
		void AddTriangle(const Poly_CoherentTriangle & theTri, const opencascade::handle<NCollection_BaseAllocator> & theA);

		/****************** Clear ******************/
		/**** md5 signature: 12e5229aab26b2af1d6a024d75590933 ****/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "/** * reset the node to void. */.

Parameters
----------
&: NCollection_BaseAllocator

Returns
-------
None
") Clear;
		void Clear(const opencascade::handle<NCollection_BaseAllocator > &);


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
		/****************** GetIndex ******************/
		/**** md5 signature: be68311c24420307bc05134408d2c9e3 ****/
		%feature("compactdefaultargs") GetIndex;
		%feature("autodoc", "/** * get the value of node index. */.

Returns
-------
int
") GetIndex;
		Standard_Integer GetIndex();

		/****************** GetNormal ******************/
		/**** md5 signature: df606ba50212d9d3d862cb1144920109 ****/
		%feature("compactdefaultargs") GetNormal;
		%feature("autodoc", "/** * get the stored normal in the node. */.

Returns
-------
gp_XYZ
") GetNormal;
		gp_XYZ GetNormal();

		/****************** GetU ******************/
		/**** md5 signature: 556ee62969f53fa454ac85ee4c38c218 ****/
		%feature("compactdefaultargs") GetU;
		%feature("autodoc", "/** * get u coordinate of the node. */.

Returns
-------
float
") GetU;
		Standard_Real GetU();

		/****************** GetV ******************/
		/**** md5 signature: d163971450f10223055714766ac9732c ****/
		%feature("compactdefaultargs") GetV;
		%feature("autodoc", "/** * get v coordinate of the node. */.

Returns
-------
float
") GetV;
		Standard_Real GetV();

		/****************** HasNormal ******************/
		/**** md5 signature: f8f58ef06722b8ccc4ca569b238b0131 ****/
		%feature("compactdefaultargs") HasNormal;
		%feature("autodoc", "/** * query if the node contains a normal vector. */.

Returns
-------
bool
") HasNormal;
		Standard_Boolean HasNormal();

		/****************** IsFreeNode ******************/
		/**** md5 signature: 6f86c9feae49f6018fdfa1c1cc416abc ****/
		%feature("compactdefaultargs") IsFreeNode;
		%feature("autodoc", "/** * check if this is a free node, i.e., a node without a single * incident triangle. */.

Returns
-------
bool
") IsFreeNode;
		Standard_Boolean IsFreeNode();

		/****************** RemoveTriangle ******************/
		/**** md5 signature: d1a4317c9ea5271ea94d8b07067e3352 ****/
		%feature("compactdefaultargs") RemoveTriangle;
		%feature("autodoc", "/** * disconnect a triangle from this node. */.

Parameters
----------
theTri: Poly_CoherentTriangle
theA: NCollection_BaseAllocator

Returns
-------
bool
") RemoveTriangle;
		Standard_Boolean RemoveTriangle(const Poly_CoherentTriangle & theTri, const opencascade::handle<NCollection_BaseAllocator> & theA);

		/****************** SetIndex ******************/
		/**** md5 signature: 4df39428d5163adcf3df08fcfadd7b59 ****/
		%feature("compactdefaultargs") SetIndex;
		%feature("autodoc", "/** * set the value of node index. */.

Parameters
----------
theIndex: int

Returns
-------
None
") SetIndex;
		void SetIndex(const Standard_Integer theIndex);

		/****************** SetNormal ******************/
		/**** md5 signature: 42571b60712fece320abefbb371dd328 ****/
		%feature("compactdefaultargs") SetNormal;
		%feature("autodoc", "/** * define the normal vector in the node. */.

Parameters
----------
theVector: gp_XYZ

Returns
-------
None
") SetNormal;
		void SetNormal(const gp_XYZ & theVector);

		/****************** SetUV ******************/
		/**** md5 signature: ff179e70ed852320501bdbec48546cca ****/
		%feature("compactdefaultargs") SetUV;
		%feature("autodoc", "/** * set the uv coordinates of the node. */.

Parameters
----------
theU: float
theV: float

Returns
-------
None
") SetUV;
		void SetUV(const Standard_Real theU, const Standard_Real theV);

		/****************** TriangleIterator ******************/
		/**** md5 signature: abb21a0bc72481ca955b0d303e2f72d2 ****/
		%feature("compactdefaultargs") TriangleIterator;
		%feature("autodoc", "/** * create an iterator of incident triangles. */.

Returns
-------
Poly_CoherentTriPtr::Iterator
") TriangleIterator;
		Poly_CoherentTriPtr::Iterator TriangleIterator();

};


%extend Poly_CoherentNode {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class Poly_CoherentTriPtr *
****************************/
/******************************
* class Poly_CoherentTriangle *
******************************/
class Poly_CoherentTriangle {
	public:
		/****************** Poly_CoherentTriangle ******************/
		/**** md5 signature: 9446cdddb4a57c633081505b863c20fd ****/
		%feature("compactdefaultargs") Poly_CoherentTriangle;
		%feature("autodoc", "/** * empty constructor. */.

Returns
-------
None
") Poly_CoherentTriangle;
		 Poly_CoherentTriangle();

		/****************** Poly_CoherentTriangle ******************/
		/**** md5 signature: 8535db5fe78046824ff6fba22e657613 ****/
		%feature("compactdefaultargs") Poly_CoherentTriangle;
		%feature("autodoc", "/** * constructor. */.

Parameters
----------
iNode0: int
iNode1: int
iNode2: int

Returns
-------
None
") Poly_CoherentTriangle;
		 Poly_CoherentTriangle(const Standard_Integer iNode0, const Standard_Integer iNode1, const Standard_Integer iNode2);

		/****************** FindConnection ******************/
		/**** md5 signature: 505623f75ec36da5e1eb5d1c4b345491 ****/
		%feature("compactdefaultargs") FindConnection;
		%feature("autodoc", "/** * retuns the index of the connection with the given triangle, or -1 if not * found. */.

Parameters
----------
&: Poly_CoherentTriangle

Returns
-------
int
") FindConnection;
		Standard_Integer FindConnection(const Poly_CoherentTriangle &);

		/****************** GetConnectedNode ******************/
		/**** md5 signature: db18ee0663392691dff091840d705211 ****/
		%feature("compactdefaultargs") GetConnectedNode;
		%feature("autodoc", "/** * query the connected node on the given side. * returns -1 if there is no connection on the specified side. */.

Parameters
----------
iConn: int

Returns
-------
int
") GetConnectedNode;
		Standard_Integer GetConnectedNode(const Standard_Integer iConn);

		/****************** GetConnectedTri ******************/
		/**** md5 signature: a594865824d29f8efc10c28f93cb6719 ****/
		%feature("compactdefaultargs") GetConnectedTri;
		%feature("autodoc", "/** * query the connected triangle on the given side. * returns null if there is no connection on the specified side. */.

Parameters
----------
iConn: int

Returns
-------
Poly_CoherentTriangle *
") GetConnectedTri;
		const Poly_CoherentTriangle * GetConnectedTri(const Standard_Integer iConn);

		/****************** GetLink ******************/
		/**** md5 signature: 3147cabde40a5b5c4a6566469e78c1af ****/
		%feature("compactdefaultargs") GetLink;
		%feature("autodoc", "/** * query the link associate with the given side of the triangle. * may return null if there are no links in the triangulation. */.

Parameters
----------
iLink: int

Returns
-------
Poly_CoherentLink *
") GetLink;
		const Poly_CoherentLink * GetLink(const Standard_Integer iLink);

		/****************** IsEmpty ******************/
		/**** md5 signature: e0fa1d0f35a1c4ad702e4e993780ae41 ****/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "/** * query if this is a valid triangle. */.

Returns
-------
bool
") IsEmpty;
		Standard_Boolean IsEmpty();

		/****************** NConnections ******************/
		/**** md5 signature: 7c08f0ab362e6158b745da0f9b271c9e ****/
		%feature("compactdefaultargs") NConnections;
		%feature("autodoc", "/** * query the number of connected triangles. */.

Returns
-------
int
") NConnections;
		Standard_Integer NConnections();

		/****************** Node ******************/
		/**** md5 signature: 0c8b3e4d6b02b354a59bbdabd461f25e ****/
		%feature("compactdefaultargs") Node;
		%feature("autodoc", "/** * query the node index in the position given by the parameter 'ind' */.

Parameters
----------
ind: int

Returns
-------
int
") Node;
		Standard_Integer Node(const Standard_Integer ind);

		/****************** RemoveConnection ******************/
		/**** md5 signature: f5aebaf1db860838366c89c8ceeceb3f ****/
		%feature("compactdefaultargs") RemoveConnection;
		%feature("autodoc", "/** * remove the connection with the given index. * @param iconn * can be 0, 1 or 2 - index of the node that is opposite to the connection * (shared link). */.

Parameters
----------
iConn: int

Returns
-------
None
") RemoveConnection;
		void RemoveConnection(const Standard_Integer iConn);

		/****************** RemoveConnection ******************/
		/**** md5 signature: 53930c44b0711688627163ac9483ac87 ****/
		%feature("compactdefaultargs") RemoveConnection;
		%feature("autodoc", "/** * remove the connection with the given triangle. * returns * true if successfuol or false if the connection has not been found. */.

Parameters
----------
theTri: Poly_CoherentTriangle

Returns
-------
bool
") RemoveConnection;
		Standard_Boolean RemoveConnection(Poly_CoherentTriangle & theTri);

		/****************** SetConnection ******************/
		/**** md5 signature: a0b2140ca6f1d80d7f8a3e55163906d6 ****/
		%feature("compactdefaultargs") SetConnection;
		%feature("autodoc", "/** * create connection with another triangle thetri. * this method creates both connections: in this triangle and in thetri. you * do not need to call the same method on triangle thetr. * @param iconn * can be 0, 1 or 2 - index of the node that is opposite to the connection * (shared link). * @param thetr * triangle that is connected on the given link. * returns * true if successful, false if the connection is rejected * due to improper topology. */.

Parameters
----------
iConn: int
theTr: Poly_CoherentTriangle

Returns
-------
bool
") SetConnection;
		Standard_Boolean SetConnection(const Standard_Integer iConn, Poly_CoherentTriangle & theTr);

		/****************** SetConnection ******************/
		/**** md5 signature: a1d2b4791de1c59c255b11dd301760e2 ****/
		%feature("compactdefaultargs") SetConnection;
		%feature("autodoc", "/** * create connection with another triangle thetri. * this method creates both connections: in this triangle and in thetri. * this method is slower than the previous one, because it makes analysis * what sides of both triangles are connected. * @param thetri * triangle that is connected. * returns * true if successful, false if the connection is rejected * due to improper topology. */.

Parameters
----------
theTri: Poly_CoherentTriangle

Returns
-------
bool
") SetConnection;
		Standard_Boolean SetConnection(Poly_CoherentTriangle & theTri);

};


%extend Poly_CoherentTriangle {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class Poly_CoherentTriangulation *
***********************************/
/*********************
* class Poly_Connect *
*********************/
class Poly_Connect {
	public:
		/****************** Poly_Connect ******************/
		/**** md5 signature: 4858952e2e888663b625612d1cf23291 ****/
		%feature("compactdefaultargs") Poly_Connect;
		%feature("autodoc", "Constructs an uninitialized algorithm.

Returns
-------
None
") Poly_Connect;
		 Poly_Connect();

		/****************** Poly_Connect ******************/
		/**** md5 signature: 4eb6cc0957a90b6d58996c53fea15fc5 ****/
		%feature("compactdefaultargs") Poly_Connect;
		%feature("autodoc", "Constructs an algorithm to explore the adjacency data of nodes or triangles for the triangulation t.

Parameters
----------
theTriangulation: Poly_Triangulation

Returns
-------
None
") Poly_Connect;
		 Poly_Connect(const opencascade::handle<Poly_Triangulation> & theTriangulation);

		/****************** Initialize ******************/
		/**** md5 signature: 6f8df921119c4a0c799d7d72700b20c6 ****/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Initializes an iterator to search for all the triangles containing the node referenced at index n in the nodes table, for the triangulation analyzed by this tool. the iterator is managed by the following functions: - more, which checks if there are still elements in the iterator - next, which positions the iterator on the next element - value, which returns the current element. the use of such an iterator provides direct access to the triangles around a particular node, i.e. it avoids iterating on all the component triangles of a triangulation. example poly_connect c(tr); for (c.initialize(n1);c.more();c.next()) { t = c.value(); }.

Parameters
----------
N: int

Returns
-------
None
") Initialize;
		void Initialize(const Standard_Integer N);

		/****************** Load ******************/
		/**** md5 signature: c900fdea745abf63070ebdf0f0a3e891 ****/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "Initialize the algorithm to explore the adjacency data of nodes or triangles for the triangulation thetriangulation.

Parameters
----------
theTriangulation: Poly_Triangulation

Returns
-------
None
") Load;
		void Load(const opencascade::handle<Poly_Triangulation> & theTriangulation);

		/****************** More ******************/
		/**** md5 signature: cff271d3b32940da94bada40648f9096 ****/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Returns true if there is another element in the iterator defined with the function initialize (i.e. if there is another triangle containing the given node).

Returns
-------
bool
") More;
		Standard_Boolean More();

		/****************** Next ******************/
		/**** md5 signature: f35c0df5f1d7c877986db18081404532 ****/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Advances the iterator defined with the function initialize to access the next triangle. note: there is no action if the iterator is empty (i.e. if the function more returns false).-.

Returns
-------
None
") Next;
		void Next();

		/****************** Nodes ******************/
		/**** md5 signature: b9bb3c65b024b1d8b094aa12cf07fc4e ****/
		%feature("compactdefaultargs") Nodes;
		%feature("autodoc", "Returns, in n1, n2 and n3, the indices of the 3 nodes adjacent to the triangle referenced at index t in the triangles table specific to the triangulation analyzed by this tool. warning null indices are returned when there are fewer than 3 adjacent nodes.

Parameters
----------
T: int

Returns
-------
n1: int
n2: int
n3: int
") Nodes;
		void Nodes(const Standard_Integer T, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** Triangle ******************/
		/**** md5 signature: c5a10e9fa89662a218d195aa7e1d77d9 ****/
		%feature("compactdefaultargs") Triangle;
		%feature("autodoc", "Returns the index of a triangle containing the node at index n in the nodes table specific to the triangulation analyzed by this tool.

Parameters
----------
N: int

Returns
-------
int
") Triangle;
		Standard_Integer Triangle(const Standard_Integer N);

		/****************** Triangles ******************/
		/**** md5 signature: 3d1f5f78ef9f1e155ddb82f445db6470 ****/
		%feature("compactdefaultargs") Triangles;
		%feature("autodoc", "Returns in t1, t2 and t3, the indices of the 3 triangles adjacent to the triangle at index t in the triangles table specific to the triangulation analyzed by this tool. warning null indices are returned when there are fewer than 3 adjacent triangles.

Parameters
----------
T: int

Returns
-------
t1: int
t2: int
t3: int
") Triangles;
		void Triangles(const Standard_Integer T, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** Triangulation ******************/
		/**** md5 signature: 640157cb50c1198f3e4d8cfb1696811e ****/
		%feature("compactdefaultargs") Triangulation;
		%feature("autodoc", "Returns the triangulation analyzed by this tool.

Returns
-------
opencascade::handle<Poly_Triangulation>
") Triangulation;
		const opencascade::handle<Poly_Triangulation> & Triangulation();

		/****************** Value ******************/
		/**** md5 signature: 0152a8596198c54f2b940c881f570bf0 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the index of the current triangle to which the iterator, defined with the function initialize, points. this is an index in the triangles table specific to the triangulation analyzed by this tool.

Returns
-------
int
") Value;
		Standard_Integer Value();

};


%extend Poly_Connect {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class Poly_MakeLoops *
***********************/
/***********************
* class Poly_Polygon2D *
***********************/
class Poly_Polygon2D : public Standard_Transient {
	public:
		/****************** Poly_Polygon2D ******************/
		/**** md5 signature: ce8c56beaf19a56938aa246c5bd1a08e ****/
		%feature("compactdefaultargs") Poly_Polygon2D;
		%feature("autodoc", "Constructs a 2d polygon defined by the table of points, <nodes>.

Parameters
----------
Nodes: TColgp_Array1OfPnt2d

Returns
-------
None
") Poly_Polygon2D;
		 Poly_Polygon2D(const TColgp_Array1OfPnt2d & Nodes);

		/****************** Deflection ******************/
		/**** md5 signature: cc0b59ab46f82f52f9a9398cfae7702b ****/
		%feature("compactdefaultargs") Deflection;
		%feature("autodoc", "Returns the deflection of this polygon. deflection is used in cases where the polygon is an approximate representation of a curve. deflection represents the maximum distance permitted between any point on the curve and the corresponding point on the polygon. by default the deflection value is equal to 0. an algorithm using this 2d polygon with a deflection value equal to 0 considers that it is working with a true polygon and not with an approximate representation of a curve. the deflection function is used to modify the deflection value of this polygon. the deflection value can be used by any algorithm working with 2d polygons. for example: - an algorithm may use a unique deflection value for all its polygons. in this case it is not necessary to use the deflection function. - or an algorithm may want to attach a different deflection to each polygon. in this case, the deflection function is used to set a value on each polygon, and later to fetch the value.

Returns
-------
float
") Deflection;
		Standard_Real Deflection();

		/****************** Deflection ******************/
		/**** md5 signature: 8486f67f676bce29f6c5fc534ad518bf ****/
		%feature("compactdefaultargs") Deflection;
		%feature("autodoc", "Sets the deflection of this polygon to d.

Parameters
----------
D: float

Returns
-------
None
") Deflection;
		void Deflection(const Standard_Real D);

		/****************** NbNodes ******************/
		/**** md5 signature: b2716f774ff961df1fa7782a7d1f28be ****/
		%feature("compactdefaultargs") NbNodes;
		%feature("autodoc", "Returns the number of nodes in this polygon. note: if the polygon is closed, the point of closure is repeated at the end of its table of nodes. thus, on a closed triangle, the function nbnodes returns 4.

Returns
-------
int
") NbNodes;
		Standard_Integer NbNodes();

		/****************** Nodes ******************/
		/**** md5 signature: fe780f117ec114151d58fcaf89c9248c ****/
		%feature("compactdefaultargs") Nodes;
		%feature("autodoc", "Returns the table of nodes for this polygon.

Returns
-------
TColgp_Array1OfPnt2d
") Nodes;
		const TColgp_Array1OfPnt2d & Nodes();

};


%make_alias(Poly_Polygon2D)

%extend Poly_Polygon2D {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class Poly_Polygon3D *
***********************/
class Poly_Polygon3D : public Standard_Transient {
	public:
		/****************** Poly_Polygon3D ******************/
		/**** md5 signature: 95a657f5932969c3e086462497053db5 ****/
		%feature("compactdefaultargs") Poly_Polygon3D;
		%feature("autodoc", "Onstructs a 3d polygon defined by the table of points, nodes.

Parameters
----------
Nodes: TColgp_Array1OfPnt

Returns
-------
None
") Poly_Polygon3D;
		 Poly_Polygon3D(const TColgp_Array1OfPnt & Nodes);

		/****************** Poly_Polygon3D ******************/
		/**** md5 signature: 8ec8fbe07f9a1e4cb17164843b379dc2 ****/
		%feature("compactdefaultargs") Poly_Polygon3D;
		%feature("autodoc", "Constructs a 3d polygon defined by the table of points, nodes, and the parallel table of parameters, parameters, where each value of the table parameters is the parameter of the corresponding point on the curve approximated by the constructed polygon. warning both the nodes and parameters tables must have the same bounds. this property is not checked at construction time.

Parameters
----------
Nodes: TColgp_Array1OfPnt
Parameters: TColStd_Array1OfReal

Returns
-------
None
") Poly_Polygon3D;
		 Poly_Polygon3D(const TColgp_Array1OfPnt & Nodes, const TColStd_Array1OfReal & Parameters);

		/****************** ChangeParameters ******************/
		/**** md5 signature: 5867483c56dc9099dd99ee0cbe7fe06c ****/
		%feature("compactdefaultargs") ChangeParameters;
		%feature("autodoc", "Returns the table of the parameters associated with each node in this polygon. changeparameters function returnes the array as shared. therefore if the table is selected by reference you can, by simply modifying it, directly modify the data structure of this polygon.

Returns
-------
TColStd_Array1OfReal
") ChangeParameters;
		TColStd_Array1OfReal & ChangeParameters();

		/****************** Copy ******************/
		/**** md5 signature: 532fa451e830dd05948eb705384072ad ****/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Creates a copy of current polygon.

Returns
-------
opencascade::handle<Poly_Polygon3D>
") Copy;
		virtual opencascade::handle<Poly_Polygon3D> Copy();

		/****************** Deflection ******************/
		/**** md5 signature: cc0b59ab46f82f52f9a9398cfae7702b ****/
		%feature("compactdefaultargs") Deflection;
		%feature("autodoc", "Returns the deflection of this polygon.

Returns
-------
float
") Deflection;
		Standard_Real Deflection();

		/****************** Deflection ******************/
		/**** md5 signature: 8486f67f676bce29f6c5fc534ad518bf ****/
		%feature("compactdefaultargs") Deflection;
		%feature("autodoc", "Sets the deflection of this polygon to d. see more on deflection in poly_polygon2d.

Parameters
----------
D: float

Returns
-------
None
") Deflection;
		void Deflection(const Standard_Real D);

		/****************** HasParameters ******************/
		/**** md5 signature: 1936000019176c86bdcb300dda6ec431 ****/
		%feature("compactdefaultargs") HasParameters;
		%feature("autodoc", "Returns the table of the parameters associated with each node in this polygon. hasparameters function checks if parameters are associated with the nodes of this polygon.

Returns
-------
bool
") HasParameters;
		Standard_Boolean HasParameters();

		/****************** NbNodes ******************/
		/**** md5 signature: b2716f774ff961df1fa7782a7d1f28be ****/
		%feature("compactdefaultargs") NbNodes;
		%feature("autodoc", "Returns the number of nodes in this polygon. note: if the polygon is closed, the point of closure is repeated at the end of its table of nodes. thus, on a closed triangle the function nbnodes returns 4.

Returns
-------
int
") NbNodes;
		Standard_Integer NbNodes();

		/****************** Nodes ******************/
		/**** md5 signature: 68f56c6f54d258355729a2173dbed191 ****/
		%feature("compactdefaultargs") Nodes;
		%feature("autodoc", "Returns the table of nodes for this polygon.

Returns
-------
TColgp_Array1OfPnt
") Nodes;
		const TColgp_Array1OfPnt & Nodes();

		/****************** Parameters ******************/
		/**** md5 signature: 7c84e53bc11f80fb0f3c0e787e4b026e ****/
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "Returns true if parameters are associated with the nodes in this polygon.

Returns
-------
TColStd_Array1OfReal
") Parameters;
		const TColStd_Array1OfReal & Parameters();

};


%make_alias(Poly_Polygon3D)

%extend Poly_Polygon3D {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class Poly_PolygonOnTriangulation *
************************************/
class Poly_PolygonOnTriangulation : public Standard_Transient {
	public:
		/****************** Poly_PolygonOnTriangulation ******************/
		/**** md5 signature: 9991779463c28107e5c10363e72d709e ****/
		%feature("compactdefaultargs") Poly_PolygonOnTriangulation;
		%feature("autodoc", "Constructs a 3d polygon on the triangulation of a shape, defined by the table of nodes, <nodes>.

Parameters
----------
Nodes: TColStd_Array1OfInteger

Returns
-------
None
") Poly_PolygonOnTriangulation;
		 Poly_PolygonOnTriangulation(const TColStd_Array1OfInteger & Nodes);

		/****************** Poly_PolygonOnTriangulation ******************/
		/**** md5 signature: bdb19dbfd52b28d3a9283b7f180a1ce5 ****/
		%feature("compactdefaultargs") Poly_PolygonOnTriangulation;
		%feature("autodoc", "Constructs a 3d polygon on the triangulation of a shape, defined by: - the table of nodes, nodes, and the table of parameters, <parameters>. where: - a node value is an index in the table of nodes specific to an existing triangulation of a shape - and a parameter value is the value of the parameter of the corresponding point on the curve approximated by the constructed polygon. warning the tables nodes and parameters must be the same size. this property is not checked at construction time.

Parameters
----------
Nodes: TColStd_Array1OfInteger
Parameters: TColStd_Array1OfReal

Returns
-------
None
") Poly_PolygonOnTriangulation;
		 Poly_PolygonOnTriangulation(const TColStd_Array1OfInteger & Nodes, const TColStd_Array1OfReal & Parameters);

		/****************** Copy ******************/
		/**** md5 signature: 249421ad14c91ad15ac15a6b20c906cc ****/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Creates a copy of current polygon.

Returns
-------
opencascade::handle<Poly_PolygonOnTriangulation>
") Copy;
		virtual opencascade::handle<Poly_PolygonOnTriangulation> Copy();

		/****************** Deflection ******************/
		/**** md5 signature: cc0b59ab46f82f52f9a9398cfae7702b ****/
		%feature("compactdefaultargs") Deflection;
		%feature("autodoc", "Returns the deflection of this polygon.

Returns
-------
float
") Deflection;
		Standard_Real Deflection();

		/****************** Deflection ******************/
		/**** md5 signature: 8486f67f676bce29f6c5fc534ad518bf ****/
		%feature("compactdefaultargs") Deflection;
		%feature("autodoc", "Sets the deflection of this polygon to d. see more on deflection in poly_polygones2d.

Parameters
----------
D: float

Returns
-------
None
") Deflection;
		void Deflection(const Standard_Real D);

		/****************** HasParameters ******************/
		/**** md5 signature: 1936000019176c86bdcb300dda6ec431 ****/
		%feature("compactdefaultargs") HasParameters;
		%feature("autodoc", "Returns true if parameters are associated with the nodes in this polygon.

Returns
-------
bool
") HasParameters;
		Standard_Boolean HasParameters();

		/****************** NbNodes ******************/
		/**** md5 signature: b2716f774ff961df1fa7782a7d1f28be ****/
		%feature("compactdefaultargs") NbNodes;
		%feature("autodoc", "Returns the number of nodes for this polygon. note: if the polygon is closed, the point of closure is repeated at the end of its table of nodes. thus, on a closed triangle, the function nbnodes returns 4.

Returns
-------
int
") NbNodes;
		Standard_Integer NbNodes();

		/****************** Nodes ******************/
		/**** md5 signature: 47294c56b315b624305cf617e7ffa3a7 ****/
		%feature("compactdefaultargs") Nodes;
		%feature("autodoc", "Returns the table of nodes for this polygon. a node value is an index in the table of nodes specific to an existing triangulation of a shape.

Returns
-------
TColStd_Array1OfInteger
") Nodes;
		const TColStd_Array1OfInteger & Nodes();

		/****************** Parameters ******************/
		/**** md5 signature: d0d870e210781dd6d2c22f4afc6ae071 ****/
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "Returns the table of the parameters associated with each node in this polygon. warning use the function hasparameters to check if parameters are associated with the nodes in this polygon.

Returns
-------
opencascade::handle<TColStd_HArray1OfReal>
") Parameters;
		opencascade::handle<TColStd_HArray1OfReal> Parameters();

};


%make_alias(Poly_PolygonOnTriangulation)

%extend Poly_PolygonOnTriangulation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class Poly_Triangle *
**********************/
class Poly_Triangle {
	public:
		/****************** Poly_Triangle ******************/
		/**** md5 signature: f846812b11f5a9cf90e0870884169a9b ****/
		%feature("compactdefaultargs") Poly_Triangle;
		%feature("autodoc", "Constructs a triangle and sets all indices to zero.

Returns
-------
None
") Poly_Triangle;
		 Poly_Triangle();

		/****************** Poly_Triangle ******************/
		/**** md5 signature: f98f438839680ac98cbd9212c798c7ff ****/
		%feature("compactdefaultargs") Poly_Triangle;
		%feature("autodoc", "Constructs a triangle and sets its three indices to n1, n2 and n3 respectively, where these node values are indices in the table of nodes specific to an existing triangulation of a shape.

Parameters
----------
N1: int
N2: int
N3: int

Returns
-------
None
") Poly_Triangle;
		 Poly_Triangle(const Standard_Integer N1, const Standard_Integer N2, const Standard_Integer N3);


        %feature("autodoc","1");
        %extend {
            Standard_Integer GetChangeValue(const Standard_Integer Index) {
            return (Standard_Integer) $self->ChangeValue(Index);
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetChangeValue(const Standard_Integer Index,Standard_Integer value) {
            $self->ChangeValue(Index)=value;
            }
        };
		/****************** Get ******************/
		/**** md5 signature: 42505cc9ca50a1b0ad1b1a1011a40b3c ****/
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "Returns the node indices of this triangle in n1, n2 and n3.

Parameters
----------

Returns
-------
N1: int
N2: int
N3: int
") Get;
		void Get(Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** Set ******************/
		/**** md5 signature: 7632e5bf95aa5df0579593036fd42ef3 ****/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Sets the value of the three nodes of this triangle to n1, n2 and n3 respectively.

Parameters
----------
N1: int
N2: int
N3: int

Returns
-------
None
") Set;
		void Set(const Standard_Integer N1, const Standard_Integer N2, const Standard_Integer N3);

		/****************** Set ******************/
		/**** md5 signature: a3dcf233e41a6ca7f1c0b2295f69520c ****/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Sets the value of the indexth node of this triangle to node. raises outofrange if index is not in 1,2,3.

Parameters
----------
Index: int
Node: int

Returns
-------
None
") Set;
		void Set(const Standard_Integer Index, const Standard_Integer Node);

		/****************** Value ******************/
		/**** md5 signature: a0a106e66557a840a37128177a262f02 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Get the node of given index. raises outofrange from standard if index is not in 1,2,3.

Parameters
----------
Index: int

Returns
-------
int
") Value;
		Standard_Integer Value(const Standard_Integer Index);

};


%extend Poly_Triangle {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class Poly_Triangulation *
***************************/
class Poly_Triangulation : public Standard_Transient {
	public:
		/****************** Poly_Triangulation ******************/
		/**** md5 signature: 8341ada4161e016e785939dd9244fa45 ****/
		%feature("compactdefaultargs") Poly_Triangulation;
		%feature("autodoc", "Constructs a triangulation from a set of triangles. the triangulation is initialized without a triangle or a node, but capable of containing nbnodes nodes, and nbtriangles triangles. here the uvnodes flag indicates whether 2d nodes will be associated with 3d ones, (i.e. to enable a 2d representation).

Parameters
----------
nbNodes: int
nbTriangles: int
UVNodes: bool

Returns
-------
None
") Poly_Triangulation;
		 Poly_Triangulation(const Standard_Integer nbNodes, const Standard_Integer nbTriangles, const Standard_Boolean UVNodes);

		/****************** Poly_Triangulation ******************/
		/**** md5 signature: 5868e2be354e056689e3361d93e4d1a9 ****/
		%feature("compactdefaultargs") Poly_Triangulation;
		%feature("autodoc", "Constructs a triangulation from a set of triangles. the triangulation is initialized with 3d points from nodes and triangles from triangles.

Parameters
----------
Nodes: TColgp_Array1OfPnt
Triangles: Poly_Array1OfTriangle

Returns
-------
None
") Poly_Triangulation;
		 Poly_Triangulation(const TColgp_Array1OfPnt & Nodes, const Poly_Array1OfTriangle & Triangles);

		/****************** Poly_Triangulation ******************/
		/**** md5 signature: 92e3542add7756f0977cd981c497a96b ****/
		%feature("compactdefaultargs") Poly_Triangulation;
		%feature("autodoc", "Constructs a triangulation from a set of triangles. the triangulation is initialized with 3d points from nodes, 2d points from uvnodes and triangles from triangles, where coordinates of a 2d point from uvnodes are the (u, v) parameters of the corresponding 3d point from nodes on the surface approximated by the constructed triangulation.

Parameters
----------
Nodes: TColgp_Array1OfPnt
UVNodes: TColgp_Array1OfPnt2d
Triangles: Poly_Array1OfTriangle

Returns
-------
None
") Poly_Triangulation;
		 Poly_Triangulation(const TColgp_Array1OfPnt & Nodes, const TColgp_Array1OfPnt2d & UVNodes, const Poly_Array1OfTriangle & Triangles);

		/****************** Poly_Triangulation ******************/
		/**** md5 signature: 4d757cd3935962606f0dd1da74e67a8b ****/
		%feature("compactdefaultargs") Poly_Triangulation;
		%feature("autodoc", "Copy constructor for triangulation.

Parameters
----------
theTriangulation: Poly_Triangulation

Returns
-------
None
") Poly_Triangulation;
		 Poly_Triangulation(const opencascade::handle<Poly_Triangulation> & theTriangulation);

		/****************** ChangeNode ******************/
		/**** md5 signature: fa4e4a3502f183b462ac1eeeddb886b3 ****/
		%feature("compactdefaultargs") ChangeNode;
		%feature("autodoc", "Give access to the node at the given index. raises standard_outofrange exception if theindex is less than 1 or greater than nbnodes.

Parameters
----------
theIndex: int

Returns
-------
gp_Pnt
") ChangeNode;
		gp_Pnt ChangeNode(const Standard_Integer theIndex);

		/****************** ChangeNodes ******************/
		/**** md5 signature: bc61f369247d26fc843e3e40e222a6e0 ****/
		%feature("compactdefaultargs") ChangeNodes;
		%feature("autodoc", "Returns the table of 3d nodes (3d points) for this triangulation. the returned array is shared. therefore if the table is selected by reference, you can, by simply modifying it, directly modify the data structure of this triangulation.

Returns
-------
TColgp_Array1OfPnt
") ChangeNodes;
		TColgp_Array1OfPnt & ChangeNodes();

		/****************** ChangeNormals ******************/
		/**** md5 signature: 1dfff352fe8190fed215b0cd1a8bfcee ****/
		%feature("compactdefaultargs") ChangeNormals;
		%feature("autodoc", "Gives access to the table of node normals.

Returns
-------
TShort_Array1OfShortReal
") ChangeNormals;
		TShort_Array1OfShortReal & ChangeNormals();

		/****************** ChangeTriangle ******************/
		/**** md5 signature: 942d50a55a5601fac4f74bb8616e013c ****/
		%feature("compactdefaultargs") ChangeTriangle;
		%feature("autodoc", "Give access to the triangle at the given index. raises standard_outofrange exception if theindex is less than 1 or greater than nbtriangles.

Parameters
----------
theIndex: int

Returns
-------
Poly_Triangle
") ChangeTriangle;
		Poly_Triangle & ChangeTriangle(const Standard_Integer theIndex);

		/****************** ChangeTriangles ******************/
		/**** md5 signature: 93e00889ebc68a48adbbe563da75709d ****/
		%feature("compactdefaultargs") ChangeTriangles;
		%feature("autodoc", "Returns the table of triangles for this triangulation. function changeuvnodes shares the returned array. therefore if the table is selected by reference, you can, by simply modifying it, directly modify the data structure of this triangulation.

Returns
-------
Poly_Array1OfTriangle
") ChangeTriangles;
		Poly_Array1OfTriangle & ChangeTriangles();

		/****************** ChangeUVNode ******************/
		/**** md5 signature: 978695900b7c1d9e9271b954a113b0bd ****/
		%feature("compactdefaultargs") ChangeUVNode;
		%feature("autodoc", "Give access to the uvnode at the given index. raises standard_outofrange exception if theindex is less than 1 or greater than nbnodes.

Parameters
----------
theIndex: int

Returns
-------
gp_Pnt2d
") ChangeUVNode;
		gp_Pnt2d ChangeUVNode(const Standard_Integer theIndex);

		/****************** ChangeUVNodes ******************/
		/**** md5 signature: 369d7a8ffd94f297e7de73a825b82e73 ****/
		%feature("compactdefaultargs") ChangeUVNodes;
		%feature("autodoc", "Returns the table of 2d nodes (2d points) associated with each 3d node of this triangulation. function changeuvnodes shares the returned array. therefore if the table is selected by reference, you can, by simply modifying it, directly modify the data structure of this triangulation.

Returns
-------
TColgp_Array1OfPnt2d
") ChangeUVNodes;
		TColgp_Array1OfPnt2d & ChangeUVNodes();

		/****************** Copy ******************/
		/**** md5 signature: eca097a0bd418e6d57a457eb92e7098f ****/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Creates full copy of current triangulation.

Returns
-------
opencascade::handle<Poly_Triangulation>
") Copy;
		virtual opencascade::handle<Poly_Triangulation> Copy();

		/****************** Deflection ******************/
		/**** md5 signature: 6fb4c31e8f4445c1597fc8b70a63cbfb ****/
		%feature("compactdefaultargs") Deflection;
		%feature("autodoc", "Returns the deflection of this triangulation.

Returns
-------
float
") Deflection;
		Standard_Real Deflection();

		/****************** Deflection ******************/
		/**** md5 signature: e3314129dc278c4d2782072a6d9cb7bb ****/
		%feature("compactdefaultargs") Deflection;
		%feature("autodoc", "Sets the deflection of this triangulation to thedeflection. see more on deflection in polygon2d.

Parameters
----------
theDeflection: float

Returns
-------
None
") Deflection;
		void Deflection(const Standard_Real theDeflection);

		/****************** HasNormals ******************/
		/**** md5 signature: 181f2084bd118d7033834a50e616fde5 ****/
		%feature("compactdefaultargs") HasNormals;
		%feature("autodoc", "Returns standard_true if nodal normals are defined.

Returns
-------
bool
") HasNormals;
		Standard_Boolean HasNormals();

		/****************** HasUVNodes ******************/
		/**** md5 signature: 735518b51047c7fd797f5a3e32f5d96e ****/
		%feature("compactdefaultargs") HasUVNodes;
		%feature("autodoc", "Returns standard_true if 2d nodes are associated with 3d nodes for this triangulation.

Returns
-------
bool
") HasUVNodes;
		Standard_Boolean HasUVNodes();

		/****************** NbNodes ******************/
		/**** md5 signature: e10a1e755c3c99568fdfec53b6a1d5d1 ****/
		%feature("compactdefaultargs") NbNodes;
		%feature("autodoc", "Returns the number of nodes for this triangulation.

Returns
-------
int
") NbNodes;
		Standard_Integer NbNodes();

		/****************** NbTriangles ******************/
		/**** md5 signature: 192b02c351e0888abe52f9e1c6139918 ****/
		%feature("compactdefaultargs") NbTriangles;
		%feature("autodoc", "Returns the number of triangles for this triangulation.

Returns
-------
int
") NbTriangles;
		Standard_Integer NbTriangles();

		/****************** Node ******************/
		/**** md5 signature: 86df678a3d98d54374f5f531a65a2fc7 ****/
		%feature("compactdefaultargs") Node;
		%feature("autodoc", "Returns node at the given index. raises standard_outofrange exception if theindex is less than 1 or greater than nbnodes.

Parameters
----------
theIndex: int

Returns
-------
gp_Pnt
") Node;
		const gp_Pnt Node(const Standard_Integer theIndex);

		/****************** Nodes ******************/
		/**** md5 signature: 63910e43049268bc77cc7eb526dc4294 ****/
		%feature("compactdefaultargs") Nodes;
		%feature("autodoc", "Returns the table of 3d nodes (3d points) for this triangulation.

Returns
-------
TColgp_Array1OfPnt
") Nodes;
		const TColgp_Array1OfPnt & Nodes();

		/****************** Normal ******************/
		/**** md5 signature: 1f8c1bc50986664ddc2a6444da0aec81 ****/
		%feature("compactdefaultargs") Normal;
		%feature("autodoc", "Returns normal at the given index. raises standard_outofrange exception.

Parameters
----------
theIndex: int

Returns
-------
gp_Dir
") Normal;
		gp_Dir Normal(const Standard_Integer theIndex);

		/****************** Normals ******************/
		/**** md5 signature: 5caf9a2706fda608446853b1edfc2b27 ****/
		%feature("compactdefaultargs") Normals;
		%feature("autodoc", "Returns the table of node normals.

Returns
-------
TShort_Array1OfShortReal
") Normals;
		const TShort_Array1OfShortReal & Normals();

		/****************** RemoveUVNodes ******************/
		/**** md5 signature: 40045c3c77e535165bfc8c8523acf1d5 ****/
		%feature("compactdefaultargs") RemoveUVNodes;
		%feature("autodoc", "Deallocates the uv nodes.

Returns
-------
None
") RemoveUVNodes;
		void RemoveUVNodes();

		/****************** SetNormal ******************/
		/**** md5 signature: 16090a2b1fc1f76d31b9afd2a0c42cc1 ****/
		%feature("compactdefaultargs") SetNormal;
		%feature("autodoc", "Changes normal at the given index. raises standard_outofrange exception.

Parameters
----------
theIndex: int
theNormal: gp_Dir

Returns
-------
None
") SetNormal;
		void SetNormal(const Standard_Integer theIndex, const gp_Dir & theNormal);

		/****************** SetNormals ******************/
		/**** md5 signature: 7c3a3b618d135482bdaa83f0ced5edb7 ****/
		%feature("compactdefaultargs") SetNormals;
		%feature("autodoc", "Sets the table of node normals. raises exception if length of thenormals != 3*nbnodes.

Parameters
----------
theNormals: TShort_HArray1OfShortReal

Returns
-------
None
") SetNormals;
		void SetNormals(const opencascade::handle<TShort_HArray1OfShortReal> & theNormals);

		/****************** Triangle ******************/
		/**** md5 signature: 4b478dad3ef750a602442807b17fca5a ****/
		%feature("compactdefaultargs") Triangle;
		%feature("autodoc", "Returns triangle at the given index. raises standard_outofrange exception if theindex is less than 1 or greater than nbtriangles.

Parameters
----------
theIndex: int

Returns
-------
Poly_Triangle
") Triangle;
		const Poly_Triangle & Triangle(const Standard_Integer theIndex);

		/****************** Triangles ******************/
		/**** md5 signature: ba43a8d32c20fbeb1020e37bd97d4aca ****/
		%feature("compactdefaultargs") Triangles;
		%feature("autodoc", "Returns the table of triangles for this triangulation.

Returns
-------
Poly_Array1OfTriangle
") Triangles;
		const Poly_Array1OfTriangle & Triangles();

		/****************** UVNode ******************/
		/**** md5 signature: 45592da925c13e10349c0f573d7d2cd6 ****/
		%feature("compactdefaultargs") UVNode;
		%feature("autodoc", "Returns uvnode at the given index. raises standard_outofrange exception if theindex is less than 1 or greater than nbnodes.

Parameters
----------
theIndex: int

Returns
-------
gp_Pnt2d
") UVNode;
		const gp_Pnt2d UVNode(const Standard_Integer theIndex);

		/****************** UVNodes ******************/
		/**** md5 signature: 49590b14d68f909a1de6ea52cb486d50 ****/
		%feature("compactdefaultargs") UVNodes;
		%feature("autodoc", "Returns the table of 2d nodes (2d points) associated with each 3d node of this triangulation. the function hasuvnodes checks if 2d nodes are associated with the 3d nodes of this triangulation. const reference on the 2d nodes values.

Returns
-------
TColgp_Array1OfPnt2d
") UVNodes;
		const TColgp_Array1OfPnt2d & UVNodes();

};


%make_alias(Poly_Triangulation)

%extend Poly_Triangulation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class Poly_MakeLoops2D *
*************************/
/*************************
* class Poly_MakeLoops3D *
*************************/
/* python proxy for excluded classes */
%pythoncode {
@classnotwrapped
class Poly_CoherentTriPtr:
	pass

@classnotwrapped
class Poly_CoherentTriangulation:
	pass

@classnotwrapped
class Poly_MakeLoops:
	pass

@classnotwrapped
class Poly_MakeLoops3D:
	pass

@classnotwrapped
class Poly_MakeLoops2D:
	pass

}
/* end python proxy for excluded classes */
/* harray1 classes */

class Poly_HArray1OfTriangle : public Poly_Array1OfTriangle, public Standard_Transient {
  public:
    Poly_HArray1OfTriangle(const Standard_Integer theLower, const Standard_Integer theUpper);
    Poly_HArray1OfTriangle(const Standard_Integer theLower, const Standard_Integer theUpper, const Poly_Array1OfTriangle::value_type& theValue);
    Poly_HArray1OfTriangle(const Poly_Array1OfTriangle& theOther);
    const Poly_Array1OfTriangle& Array1();
    Poly_Array1OfTriangle& ChangeArray1();
};
%make_alias(Poly_HArray1OfTriangle)

/* harray2 classes */
/* hsequence classes */
