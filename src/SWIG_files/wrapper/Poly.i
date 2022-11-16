/*
Copyright 2008-2022 Thomas Paviot (tpaviot@gmail.com)

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
https://www.opencascade.com/doc/occt-7.6.0/refman/html/package_poly.html"
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
%include ../common/EnumTemplates.i
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
#include<Bnd_module.hxx>
#include<OSD_module.hxx>
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
%import Bnd.i
%import OSD.i
%import TShort.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
enum  {
	Poly_MeshPurpose_NONE = 0,
	Poly_MeshPurpose_Calculation = 1,
	Poly_MeshPurpose_Presentation = 2,
	Poly_MeshPurpose_Active = 4,
	Poly_MeshPurpose_Loaded = 8,
	Poly_MeshPurpose_AnyFallback = 16,
	Poly_MeshPurpose_USER = 32,
};

/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {
};
/* end python proxy for enums */

/* handles */
%wrap_handle(Poly_MergeNodesTool)
%wrap_handle(Poly_Polygon2D)
%wrap_handle(Poly_Polygon3D)
%wrap_handle(Poly_PolygonOnTriangulation)
%wrap_handle(Poly_Triangulation)
%wrap_handle(Poly_TriangulationParameters)
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
typedef unsigned int Poly_MeshPurpose;
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

		/****************** Intersect ******************/
		/**** md5 signature: 71cc08bc38965ffeef03bdfbfe9c34a4 ****/
		%feature("compactdefaultargs") Intersect;
		%feature("autodoc", "Computes the intersection between axis and triangulation. @param thetri [in] input triangulation @param theaxis [in] intersecting ray @param theisclosest [in] finds the closest intersection when true, finds the farthest otherwise @param thetriangle [out] intersected triangle @param thedistance [out] distance along ray to intersection point returns true if intersection takes place, false otherwise.

Parameters
----------
theTri: Poly_Triangulation
theAxis: gp_Ax1
theIsClosest: bool
theTriangle: Poly_Triangle

Returns
-------
theDistance: float
") Intersect;
		static Standard_Boolean Intersect(const opencascade::handle<Poly_Triangulation> & theTri, const gp_Ax1 & theAxis, const Standard_Boolean theIsClosest, Poly_Triangle & theTriangle, Standard_Real &OutValue);

		/****************** IntersectTriLine ******************/
		/**** md5 signature: 3f27e1173b34c9ae04f7086818dc488c ****/
		%feature("compactdefaultargs") IntersectTriLine;
		%feature("autodoc", "Computes the intersection between a triangle defined by three vertexes and a line. @param thestart [in] picking ray origin @param thedir [in] picking ray direction @param thev0 [in] first triangle node @param thev1 [in] second triangle node @param thev2 [in] third triangle node @param theparam [out] param on line of the intersection point returns 1 if intersection was found, 0 otherwise.

Parameters
----------
theStart: gp_XYZ
theDir: gp_Dir
theV0: gp_XYZ
theV1: gp_XYZ
theV2: gp_XYZ

Returns
-------
theParam: float
") IntersectTriLine;
		static Standard_Integer IntersectTriLine(const gp_XYZ & theStart, const gp_Dir & theDir, const gp_XYZ & theV0, const gp_XYZ & theV1, const gp_XYZ & theV2, Standard_Real &OutValue);

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
* class Poly_ArrayOfNodes *
**************************/
class Poly_ArrayOfNodes : public NCollection_AliasedArray<> {
	public:
		/****************** Poly_ArrayOfNodes ******************/
		/**** md5 signature: a3fbef88d7cea7f227931f473b2f3f7e ****/
		%feature("compactdefaultargs") Poly_ArrayOfNodes;
		%feature("autodoc", "Empty constructor of double-precision array.

Returns
-------
None
") Poly_ArrayOfNodes;
		 Poly_ArrayOfNodes();

		/****************** Poly_ArrayOfNodes ******************/
		/**** md5 signature: b77f7672fcf3bad012991e517148d0b6 ****/
		%feature("compactdefaultargs") Poly_ArrayOfNodes;
		%feature("autodoc", "Constructor of double-precision array.

Parameters
----------
theLength: int

Returns
-------
None
") Poly_ArrayOfNodes;
		 Poly_ArrayOfNodes(Standard_Integer theLength);

		/****************** Poly_ArrayOfNodes ******************/
		/**** md5 signature: 71c54cc617fa3212fe7f98037904ee67 ****/
		%feature("compactdefaultargs") Poly_ArrayOfNodes;
		%feature("autodoc", "Copy constructor .

Parameters
----------
theOther: Poly_ArrayOfNodes

Returns
-------
None
") Poly_ArrayOfNodes;
		 Poly_ArrayOfNodes(const Poly_ArrayOfNodes & theOther);

		/****************** Poly_ArrayOfNodes ******************/
		/**** md5 signature: 282e112d1d6b3b00cb621fbcc3d69c68 ****/
		%feature("compactdefaultargs") Poly_ArrayOfNodes;
		%feature("autodoc", "Constructor wrapping pre-allocated c-array of values without copying them.

Parameters
----------
theBegin: gp_Pnt
theLength: int

Returns
-------
None
") Poly_ArrayOfNodes;
		 Poly_ArrayOfNodes(const gp_Pnt & theBegin, Standard_Integer theLength);

		/****************** Poly_ArrayOfNodes ******************/
		/**** md5 signature: f55ffaa17385828819bcc3d1f6ab78f6 ****/
		%feature("compactdefaultargs") Poly_ArrayOfNodes;
		%feature("autodoc", "Constructor wrapping pre-allocated c-array of values without copying them.

Parameters
----------
theBegin: gp_Vec3f
theLength: int

Returns
-------
None
") Poly_ArrayOfNodes;
		 Poly_ArrayOfNodes(const gp_Vec3f & theBegin, Standard_Integer theLength);

		/****************** Poly_ArrayOfNodes ******************/
		/**** md5 signature: cb5136ed6787652571068de864b16043 ****/
		%feature("compactdefaultargs") Poly_ArrayOfNodes;
		%feature("autodoc", "Move constructor.

Parameters
----------
theOther: Poly_ArrayOfNodes

Returns
-------
None
") Poly_ArrayOfNodes;
		 Poly_ArrayOfNodes(Poly_ArrayOfNodes & theOther);

		/****************** Assign ******************/
		/**** md5 signature: 702830dcb95dd43aecf671cba8d7bfdb ****/
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "Copies data of theother array to this. the arrays should have the same length, but may have different precision / number of components (data conversion will be applied in the latter case).

Parameters
----------
theOther: Poly_ArrayOfNodes

Returns
-------
Poly_ArrayOfNodes
") Assign;
		Poly_ArrayOfNodes & Assign(const Poly_ArrayOfNodes & theOther);

		/****************** IsDoublePrecision ******************/
		/**** md5 signature: c768d26054fe7836c133ffb1451dd7cd ****/
		%feature("compactdefaultargs") IsDoublePrecision;
		%feature("autodoc", "Returns true if array defines nodes with double precision.

Returns
-------
bool
") IsDoublePrecision;
		bool IsDoublePrecision();

		/****************** Move ******************/
		/**** md5 signature: 20553a602539ccce80fca1871695acaa ****/
		%feature("compactdefaultargs") Move;
		%feature("autodoc", "Move assignment.

Parameters
----------
theOther: Poly_ArrayOfNodes

Returns
-------
Poly_ArrayOfNodes
") Move;
		Poly_ArrayOfNodes & Move(Poly_ArrayOfNodes & theOther);

		/****************** SetDoublePrecision ******************/
		/**** md5 signature: 2fee9d611d346cc1324a9f63e1c71f99 ****/
		%feature("compactdefaultargs") SetDoublePrecision;
		%feature("autodoc", "Sets if array should define nodes with double or single precision. raises exception if array was already allocated.

Parameters
----------
theIsDouble: bool

Returns
-------
None
") SetDoublePrecision;
		void SetDoublePrecision(bool theIsDouble);

		/****************** SetValue ******************/
		/**** md5 signature: 1aac1c7522caf00e0c3f974b2daa072f ****/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "A generalized setter for point.

Parameters
----------
theIndex: int
theValue: gp_Pnt

Returns
-------
None
") SetValue;
		void SetValue(Standard_Integer theIndex, const gp_Pnt & theValue);

		/****************** Value ******************/
		/**** md5 signature: cbbd0dda18a18774ab964a5d559342fd ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "A generalized accessor to point.

Parameters
----------
theIndex: int

Returns
-------
gp_Pnt
") Value;
		gp_Pnt Value(Standard_Integer theIndex);

};


%extend Poly_ArrayOfNodes {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class Poly_ArrayOfUVNodes *
****************************/
class Poly_ArrayOfUVNodes : public NCollection_AliasedArray<> {
	public:
		/****************** Poly_ArrayOfUVNodes ******************/
		/**** md5 signature: 6a860cf1c687b8dd0af354b672ebd0be ****/
		%feature("compactdefaultargs") Poly_ArrayOfUVNodes;
		%feature("autodoc", "Empty constructor of double-precision array.

Returns
-------
None
") Poly_ArrayOfUVNodes;
		 Poly_ArrayOfUVNodes();

		/****************** Poly_ArrayOfUVNodes ******************/
		/**** md5 signature: 1d8cb6cf40bbc06f334d0a0a080d9f94 ****/
		%feature("compactdefaultargs") Poly_ArrayOfUVNodes;
		%feature("autodoc", "Constructor of double-precision array.

Parameters
----------
theLength: int

Returns
-------
None
") Poly_ArrayOfUVNodes;
		 Poly_ArrayOfUVNodes(Standard_Integer theLength);

		/****************** Poly_ArrayOfUVNodes ******************/
		/**** md5 signature: e7970186b41655b1bbfbf070a9a812fa ****/
		%feature("compactdefaultargs") Poly_ArrayOfUVNodes;
		%feature("autodoc", "Copy constructor .

Parameters
----------
theOther: Poly_ArrayOfUVNodes

Returns
-------
None
") Poly_ArrayOfUVNodes;
		 Poly_ArrayOfUVNodes(const Poly_ArrayOfUVNodes & theOther);

		/****************** Poly_ArrayOfUVNodes ******************/
		/**** md5 signature: fcc79601f1f551bf654e4b036563851d ****/
		%feature("compactdefaultargs") Poly_ArrayOfUVNodes;
		%feature("autodoc", "Constructor wrapping pre-allocated c-array of values without copying them.

Parameters
----------
theBegin: gp_Pnt2d
theLength: int

Returns
-------
None
") Poly_ArrayOfUVNodes;
		 Poly_ArrayOfUVNodes(const gp_Pnt2d & theBegin, Standard_Integer theLength);

		/****************** Poly_ArrayOfUVNodes ******************/
		/**** md5 signature: 8dc88b2a8e6a1970829bc8d4ae3807c9 ****/
		%feature("compactdefaultargs") Poly_ArrayOfUVNodes;
		%feature("autodoc", "Constructor wrapping pre-allocated c-array of values without copying them.

Parameters
----------
theBegin: gp_Vec2f
theLength: int

Returns
-------
None
") Poly_ArrayOfUVNodes;
		 Poly_ArrayOfUVNodes(const gp_Vec2f & theBegin, Standard_Integer theLength);

		/****************** Poly_ArrayOfUVNodes ******************/
		/**** md5 signature: e99c7bef1e8b316f6baf0752957bcbf9 ****/
		%feature("compactdefaultargs") Poly_ArrayOfUVNodes;
		%feature("autodoc", "Move constructor.

Parameters
----------
theOther: Poly_ArrayOfUVNodes

Returns
-------
None
") Poly_ArrayOfUVNodes;
		 Poly_ArrayOfUVNodes(Poly_ArrayOfUVNodes & theOther);

		/****************** Assign ******************/
		/**** md5 signature: 0bd9a842cd074feea2878a80c6c59e05 ****/
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "Copies data of theother array to this. the arrays should have the same length, but may have different precision / number of components (data conversion will be applied in the latter case).

Parameters
----------
theOther: Poly_ArrayOfUVNodes

Returns
-------
Poly_ArrayOfUVNodes
") Assign;
		Poly_ArrayOfUVNodes & Assign(const Poly_ArrayOfUVNodes & theOther);

		/****************** IsDoublePrecision ******************/
		/**** md5 signature: c768d26054fe7836c133ffb1451dd7cd ****/
		%feature("compactdefaultargs") IsDoublePrecision;
		%feature("autodoc", "Returns true if array defines nodes with double precision.

Returns
-------
bool
") IsDoublePrecision;
		bool IsDoublePrecision();

		/****************** Move ******************/
		/**** md5 signature: 540403cdd9a8016019da7b6bbf0e77a2 ****/
		%feature("compactdefaultargs") Move;
		%feature("autodoc", "Move assignment.

Parameters
----------
theOther: Poly_ArrayOfUVNodes

Returns
-------
Poly_ArrayOfUVNodes
") Move;
		Poly_ArrayOfUVNodes & Move(Poly_ArrayOfUVNodes & theOther);

		/****************** SetDoublePrecision ******************/
		/**** md5 signature: 2fee9d611d346cc1324a9f63e1c71f99 ****/
		%feature("compactdefaultargs") SetDoublePrecision;
		%feature("autodoc", "Sets if array should define nodes with double or single precision. raises exception if array was already allocated.

Parameters
----------
theIsDouble: bool

Returns
-------
None
") SetDoublePrecision;
		void SetDoublePrecision(bool theIsDouble);

		/****************** SetValue ******************/
		/**** md5 signature: 932309e2e29429a1b56967cc7847fbb2 ****/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "A generalized setter for point.

Parameters
----------
theIndex: int
theValue: gp_Pnt2d

Returns
-------
None
") SetValue;
		void SetValue(Standard_Integer theIndex, const gp_Pnt2d & theValue);

		/****************** Value ******************/
		/**** md5 signature: 4d7c0ab83170d94e467103748821c3a2 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "A generalized accessor to point.

Parameters
----------
theIndex: int

Returns
-------
gp_Pnt2d
") Value;
		gp_Pnt2d Value(Standard_Integer theIndex);

};


%extend Poly_ArrayOfUVNodes {
	%pythoncode {
	__repr__ = _dumps_object
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
		%feature("autodoc", "/** * returns the index of the connection with the given triangle, or -1 if not found. */.

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
/****************************
* class Poly_MergeNodesTool *
****************************/
class Poly_MergeNodesTool : public Standard_Transient {
	public:
		class Vec3AndNormal {};
		class MergedNodesMap {};
		class MergedElemHasher {};
		/****************** Poly_MergeNodesTool ******************/
		/**** md5 signature: 3a7388c9049734e002b68e6950dd289b ****/
		%feature("compactdefaultargs") Poly_MergeNodesTool;
		%feature("autodoc", "Constructor @param[in] thesmoothangle smooth angle in radians or 0.0 to disable merging by angle @param[in] themergetolerance node merging maximum distance @param[in] thenbfacets estimated number of facets for map preallocation.

Parameters
----------
theSmoothAngle: double
theMergeTolerance: double,optional
	default value is 0.0
theNbFacets: int,optional
	default value is -1

Returns
-------
None
") Poly_MergeNodesTool;
		 Poly_MergeNodesTool(const double theSmoothAngle, const double theMergeTolerance = 0.0, const int theNbFacets = -1);

		/****************** AddElement ******************/
		/**** md5 signature: f54449798b8c250c1939c2e71ad619e9 ****/
		%feature("compactdefaultargs") AddElement;
		%feature("autodoc", "Add new triangle or quad. @param[in] theelemnodes element nodes @param[in] thenbnodes number of element nodes, should be 3 or 4.

Parameters
----------
theElemNodes: gp_XYZ *
theNbNodes: int

Returns
-------
None
") AddElement;
		void AddElement(const gp_XYZ * theElemNodes, int theNbNodes);

		/****************** AddQuad ******************/
		/**** md5 signature: 466ec42f2ca8a5fa29a362ea7d89be15 ****/
		%feature("compactdefaultargs") AddQuad;
		%feature("autodoc", "Add new quad. @param[in] theelemnodes 4 element nodes.

Parameters
----------
theElemNodes: gp_XYZ

Returns
-------
None
") AddQuad;
		void AddQuad(const gp_XYZ theElemNodes[4]);

		/****************** AddTriangle ******************/
		/**** md5 signature: 3f99f4658880f383d17505464542edaf ****/
		%feature("compactdefaultargs") AddTriangle;
		%feature("autodoc", "Add new triangle. @param[in] theelemnodes 3 element nodes.

Parameters
----------
theElemNodes: gp_XYZ

Returns
-------
None
") AddTriangle;
		void AddTriangle(const gp_XYZ theElemNodes[3]);

		/****************** AddTriangulation ******************/
		/**** md5 signature: bc6056f0ba55a334b398b898dd60cb25 ****/
		%feature("compactdefaultargs") AddTriangulation;
		%feature("autodoc", "Add another triangulation to created one. @param[in] thetris triangulation to add @param[in] thetrsf transformation to apply @param[in] thetoreverse reverse triangle nodes order.

Parameters
----------
theTris: Poly_Triangulation
theTrsf: gp_Trsf,optional
	default value is gp_Trsf()
theToReverse: bool,optional
	default value is false

Returns
-------
None
") AddTriangulation;
		virtual void AddTriangulation(const opencascade::handle<Poly_Triangulation> & theTris, const gp_Trsf & theTrsf = gp_Trsf(), const Standard_Boolean theToReverse = false);

		/****************** ChangeElementNode ******************/
		/**** md5 signature: cfa2b9d654017414261980230af66908 ****/
		%feature("compactdefaultargs") ChangeElementNode;
		%feature("autodoc", "Change node coordinates of element to be pushed. @param[in] theindex node index within current element, in 0..3 range.

Parameters
----------
theIndex: int

Returns
-------
gp_XYZ
") ChangeElementNode;
		gp_XYZ ChangeElementNode(int theIndex);

		/****************** ChangeOutput ******************/
		/**** md5 signature: a9dc71f3c110b2a16acbd54cfd1bfeaa ****/
		%feature("compactdefaultargs") ChangeOutput;
		%feature("autodoc", "Setup output triangulation for modifications. when set to null, the tool could be used as a merge map for filling in external mesh structure.

Returns
-------
opencascade::handle<Poly_Triangulation>
") ChangeOutput;
		opencascade::handle<Poly_Triangulation> & ChangeOutput();

		/****************** ElementNodeIndex ******************/
		/**** md5 signature: b3912f8ed8ba96458bb5fe8222b9db8a ****/
		%feature("compactdefaultargs") ElementNodeIndex;
		%feature("autodoc", "Return current element node index defined by pushlastelement().

Parameters
----------
theIndex: int

Returns
-------
int
") ElementNodeIndex;
		Standard_Integer ElementNodeIndex(int theIndex);

		/****************** MergeAngle ******************/
		/**** md5 signature: 5d00926a7bd3e498cdc5a4c2a8db704c ****/
		%feature("compactdefaultargs") MergeAngle;
		%feature("autodoc", "Return merge angle in radians; 0.0 by default (normals with non-exact directions are not merged).

Returns
-------
double
") MergeAngle;
		double MergeAngle();

		/****************** MergeNodes ******************/
		/**** md5 signature: 69db4be2948df2cb0f73011b0524e17b ****/
		%feature("compactdefaultargs") MergeNodes;
		%feature("autodoc", "Merge nodes of existing mesh and return the new mesh. @param[in] thetris triangulation to add @param[in] thetrsf transformation to apply @param[in] thetoreverse reverse triangle nodes order @param[in] thesmoothangle merge angle in radians @param[in] themergetolerance linear merge tolerance @param[in] thetoforce return merged triangulation even if it's statistics is equal to input one returns merged triangulation or null on no result.

Parameters
----------
theTris: Poly_Triangulation
theTrsf: gp_Trsf
theToReverse: bool
theSmoothAngle: double
theMergeTolerance: double,optional
	default value is 0.0
theToForce: bool,optional
	default value is true

Returns
-------
opencascade::handle<Poly_Triangulation>
") MergeNodes;
		static opencascade::handle<Poly_Triangulation> MergeNodes(const opencascade::handle<Poly_Triangulation> & theTris, const gp_Trsf & theTrsf, const Standard_Boolean theToReverse, const double theSmoothAngle, const double theMergeTolerance = 0.0, const bool theToForce = true);

		/****************** MergeTolerance ******************/
		/**** md5 signature: fa6eb2c52a4c2b1d74d587a33cf643e6 ****/
		%feature("compactdefaultargs") MergeTolerance;
		%feature("autodoc", "Return merge tolerance; 0.0 by default (only 3d points with exactly matching coordinates are merged).

Returns
-------
double
") MergeTolerance;
		double MergeTolerance();

		/****************** NbDegenerativeElems ******************/
		/**** md5 signature: f7c1a94fbb555c490c2bfa3343d230dd ****/
		%feature("compactdefaultargs") NbDegenerativeElems;
		%feature("autodoc", "Return number of discarded degenerate elements.

Returns
-------
int
") NbDegenerativeElems;
		int NbDegenerativeElems();

		/****************** NbElements ******************/
		/**** md5 signature: a3bde70b76cbd01fd87444d7af358185 ****/
		%feature("compactdefaultargs") NbElements;
		%feature("autodoc", "Return number of elements.

Returns
-------
int
") NbElements;
		int NbElements();

		/****************** NbMergedElems ******************/
		/**** md5 signature: ecd75b52f11a73bd5b6b9dd1889271df ****/
		%feature("compactdefaultargs") NbMergedElems;
		%feature("autodoc", "Return number of merged equal elements.

Returns
-------
int
") NbMergedElems;
		int NbMergedElems();

		/****************** NbNodes ******************/
		/**** md5 signature: d40157e610feffebe18aa0d56c09a4f4 ****/
		%feature("compactdefaultargs") NbNodes;
		%feature("autodoc", "Return number of nodes.

Returns
-------
int
") NbNodes;
		int NbNodes();

		/****************** PushLastElement ******************/
		/**** md5 signature: 277d833a2ade233d612ac9bbb60ac6d1 ****/
		%feature("compactdefaultargs") PushLastElement;
		%feature("autodoc", "Add new triangle or quad with nodes specified by changeelementnode().

Parameters
----------
theNbNodes: int

Returns
-------
None
") PushLastElement;
		void PushLastElement(int theNbNodes);

		/****************** PushLastQuad ******************/
		/**** md5 signature: 1cfa8ee32054107dba52c4d795b9c6bb ****/
		%feature("compactdefaultargs") PushLastQuad;
		%feature("autodoc", "Add new quad with nodes specified by changeelementnode().

Returns
-------
None
") PushLastQuad;
		void PushLastQuad();

		/****************** PushLastTriangle ******************/
		/**** md5 signature: ae8c69e28e2e9bd5ae3ca8a822d92073 ****/
		%feature("compactdefaultargs") PushLastTriangle;
		%feature("autodoc", "Add new triangle with nodes specified by changeelementnode().

Returns
-------
None
") PushLastTriangle;
		void PushLastTriangle();

		/****************** Result ******************/
		/**** md5 signature: 8f645f11f5d462565ca5df82c5facbc2 ****/
		%feature("compactdefaultargs") Result;
		%feature("autodoc", "Prepare and return result triangulation (temporary data will be truncated to result size).

Returns
-------
opencascade::handle<Poly_Triangulation>
") Result;
		opencascade::handle<Poly_Triangulation> Result();

		/****************** SetDropDegenerative ******************/
		/**** md5 signature: 2afb3f12bc4617f94254843e80b1098c ****/
		%feature("compactdefaultargs") SetDropDegenerative;
		%feature("autodoc", "Set if degenerate elements should be discarded.

Parameters
----------
theToDrop: bool

Returns
-------
None
") SetDropDegenerative;
		void SetDropDegenerative(bool theToDrop);

		/****************** SetMergeAngle ******************/
		/**** md5 signature: 87c2aaa1acaed6770f3402745832717c ****/
		%feature("compactdefaultargs") SetMergeAngle;
		%feature("autodoc", "Set merge angle.

Parameters
----------
theAngleRad: double

Returns
-------
None
") SetMergeAngle;
		void SetMergeAngle(double theAngleRad);

		/****************** SetMergeElems ******************/
		/**** md5 signature: ed329276ee91b65e45badb01dc0e8260 ****/
		%feature("compactdefaultargs") SetMergeElems;
		%feature("autodoc", "Set if equal elements should be filtered.

Parameters
----------
theToMerge: bool

Returns
-------
None
") SetMergeElems;
		void SetMergeElems(bool theToMerge);

		/****************** SetMergeOpposite ******************/
		/**** md5 signature: 4e4c753314be161d9f17adb6eee772b4 ****/
		%feature("compactdefaultargs") SetMergeOpposite;
		%feature("autodoc", "Set if nodes with opposite normals should be merged.

Parameters
----------
theToMerge: bool

Returns
-------
None
") SetMergeOpposite;
		void SetMergeOpposite(bool theToMerge);

		/****************** SetMergeTolerance ******************/
		/**** md5 signature: 68ac77dc68d463a45fe791220c4c1037 ****/
		%feature("compactdefaultargs") SetMergeTolerance;
		%feature("autodoc", "Set merge tolerance.

Parameters
----------
theTolerance: double

Returns
-------
None
") SetMergeTolerance;
		void SetMergeTolerance(double theTolerance);

		/****************** SetUnitFactor ******************/
		/**** md5 signature: f7ae34d46d91996c57038f792982636e ****/
		%feature("compactdefaultargs") SetUnitFactor;
		%feature("autodoc", "Setup unit factor.

Parameters
----------
theUnitFactor: double

Returns
-------
None
") SetUnitFactor;
		void SetUnitFactor(double theUnitFactor);

		/****************** ToDropDegenerative ******************/
		/**** md5 signature: d0d29e78b3ec8be2e3b06c85e4aa3169 ****/
		%feature("compactdefaultargs") ToDropDegenerative;
		%feature("autodoc", "Return true if degenerate elements should be discarded; true by default.

Returns
-------
bool
") ToDropDegenerative;
		bool ToDropDegenerative();

		/****************** ToMergeElems ******************/
		/**** md5 signature: faab5f7e47b13d1e82a5f43489d865d7 ****/
		%feature("compactdefaultargs") ToMergeElems;
		%feature("autodoc", "Return true if equal elements should be filtered; false by default.

Returns
-------
bool
") ToMergeElems;
		bool ToMergeElems();

		/****************** ToMergeOpposite ******************/
		/**** md5 signature: 28336470350be6372b143f45e7955794 ****/
		%feature("compactdefaultargs") ToMergeOpposite;
		%feature("autodoc", "Return true if nodes with opposite normals should be merged; false by default.

Returns
-------
bool
") ToMergeOpposite;
		bool ToMergeOpposite();

		/****************** computeTriNormal ******************/
		/**** md5 signature: 25e09c9ffb0af3cb0363dc699d14ab79 ****/
		%feature("compactdefaultargs") computeTriNormal;
		%feature("autodoc", "Compute normal for the mesh element.

Returns
-------
NCollection_Vec3<float >
") computeTriNormal;
		NCollection_Vec3<float > computeTriNormal();

};


%make_alias(Poly_MergeNodesTool)

%extend Poly_MergeNodesTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class Poly_Polygon2D *
***********************/
class Poly_Polygon2D : public Standard_Transient {
	public:
		/****************** Poly_Polygon2D ******************/
		/**** md5 signature: 3a8c467f0240c4e2a1e715ce82b546ac ****/
		%feature("compactdefaultargs") Poly_Polygon2D;
		%feature("autodoc", "Constructs a 2d polygon with specified number of nodes.

Parameters
----------
theNbNodes: int

Returns
-------
None
") Poly_Polygon2D;
		 Poly_Polygon2D(const Standard_Integer theNbNodes);

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

		/****************** ChangeNodes ******************/
		/**** md5 signature: f72dedd03604abdffc46813042de4100 ****/
		%feature("compactdefaultargs") ChangeNodes;
		%feature("autodoc", "Returns the table of nodes for this polygon.

Returns
-------
TColgp_Array1OfPnt2d
") ChangeNodes;
		TColgp_Array1OfPnt2d & ChangeNodes();

		/****************** Deflection ******************/
		/**** md5 signature: 6fb4c31e8f4445c1597fc8b70a63cbfb ****/
		%feature("compactdefaultargs") Deflection;
		%feature("autodoc", "Returns the deflection of this polygon. deflection is used in cases where the polygon is an approximate representation of a curve. deflection represents the maximum distance permitted between any point on the curve and the corresponding point on the polygon. by default the deflection value is equal to 0. an algorithm using this 2d polygon with a deflection value equal to 0 considers that it is working with a true polygon and not with an approximate representation of a curve. the deflection function is used to modify the deflection value of this polygon. the deflection value can be used by any algorithm working with 2d polygons. for example: - an algorithm may use a unique deflection value for all its polygons. in this case it is not necessary to use the deflection function. - or an algorithm may want to attach a different deflection to each polygon. in this case, the deflection function is used to set a value on each polygon, and later to fetch the value.

Returns
-------
float
") Deflection;
		Standard_Real Deflection();

		/****************** Deflection ******************/
		/**** md5 signature: 252c3a361469b253f0b50ec6dd3eaf91 ****/
		%feature("compactdefaultargs") Deflection;
		%feature("autodoc", "Sets the deflection of this polygon.

Parameters
----------
theDefl: float

Returns
-------
None
") Deflection;
		void Deflection(const Standard_Real theDefl);


            %feature("autodoc", "1");
            %extend{
                std::string DumpJsonToString(int depth=-1) {
                std::stringstream s;
                self->DumpJson(s, depth);
                return s.str();}
            };
		/****************** NbNodes ******************/
		/**** md5 signature: e10a1e755c3c99568fdfec53b6a1d5d1 ****/
		%feature("compactdefaultargs") NbNodes;
		%feature("autodoc", "Returns the number of nodes in this polygon. note: if the polygon is closed, the point of closure is repeated at the end of its table of nodes. thus, on a closed triangle, the function nbnodes returns 4.

Returns
-------
int
") NbNodes;
		Standard_Integer NbNodes();

		/****************** Nodes ******************/
		/**** md5 signature: ce444df29b5147afe69540167695be39 ****/
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
		/**** md5 signature: 4faa728c416c9f8f85a9105f43c878a8 ****/
		%feature("compactdefaultargs") Poly_Polygon3D;
		%feature("autodoc", "Constructs a 3d polygon with specific number of nodes.

Parameters
----------
theNbNodes: int
theHasParams: bool

Returns
-------
None
") Poly_Polygon3D;
		 Poly_Polygon3D(const Standard_Integer theNbNodes, const Standard_Boolean theHasParams);

		/****************** Poly_Polygon3D ******************/
		/**** md5 signature: 95a657f5932969c3e086462497053db5 ****/
		%feature("compactdefaultargs") Poly_Polygon3D;
		%feature("autodoc", "Constructs a 3d polygon defined by the table of points, nodes.

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

		/****************** ChangeNodes ******************/
		/**** md5 signature: bc61f369247d26fc843e3e40e222a6e0 ****/
		%feature("compactdefaultargs") ChangeNodes;
		%feature("autodoc", "Returns the table of nodes for this polygon.

Returns
-------
TColgp_Array1OfPnt
") ChangeNodes;
		TColgp_Array1OfPnt & ChangeNodes();

		/****************** ChangeParameters ******************/
		/**** md5 signature: 8ed84ac3a67f35b579cc6d28270bac04 ****/
		%feature("compactdefaultargs") ChangeParameters;
		%feature("autodoc", "Returns the table of the parameters associated with each node in this polygon. changeparameters function returns the array as shared. therefore if the table is selected by reference you can, by simply modifying it, directly modify the data structure of this polygon.

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
		/**** md5 signature: 6fb4c31e8f4445c1597fc8b70a63cbfb ****/
		%feature("compactdefaultargs") Deflection;
		%feature("autodoc", "Returns the deflection of this polygon.

Returns
-------
float
") Deflection;
		Standard_Real Deflection();

		/****************** Deflection ******************/
		/**** md5 signature: 252c3a361469b253f0b50ec6dd3eaf91 ****/
		%feature("compactdefaultargs") Deflection;
		%feature("autodoc", "Sets the deflection of this polygon. see more on deflection in poly_polygon2d.

Parameters
----------
theDefl: float

Returns
-------
None
") Deflection;
		void Deflection(const Standard_Real theDefl);


            %feature("autodoc", "1");
            %extend{
                std::string DumpJsonToString(int depth=-1) {
                std::stringstream s;
                self->DumpJson(s, depth);
                return s.str();}
            };
		/****************** HasParameters ******************/
		/**** md5 signature: 948932cf6475b2432a8160f0c25bcdc0 ****/
		%feature("compactdefaultargs") HasParameters;
		%feature("autodoc", "Returns the table of the parameters associated with each node in this polygon. hasparameters function checks if parameters are associated with the nodes of this polygon.

Returns
-------
bool
") HasParameters;
		Standard_Boolean HasParameters();

		/****************** NbNodes ******************/
		/**** md5 signature: e10a1e755c3c99568fdfec53b6a1d5d1 ****/
		%feature("compactdefaultargs") NbNodes;
		%feature("autodoc", "Returns the number of nodes in this polygon. note: if the polygon is closed, the point of closure is repeated at the end of its table of nodes. thus, on a closed triangle the function nbnodes returns 4.

Returns
-------
int
") NbNodes;
		Standard_Integer NbNodes();

		/****************** Nodes ******************/
		/**** md5 signature: 63910e43049268bc77cc7eb526dc4294 ****/
		%feature("compactdefaultargs") Nodes;
		%feature("autodoc", "Returns the table of nodes for this polygon.

Returns
-------
TColgp_Array1OfPnt
") Nodes;
		const TColgp_Array1OfPnt & Nodes();

		/****************** Parameters ******************/
		/**** md5 signature: f774f1ba7bac44b5949bb046f4e4d73b ****/
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
		/**** md5 signature: 99e686aa9441dd0e1f48f7bb6bc146cd ****/
		%feature("compactdefaultargs") Poly_PolygonOnTriangulation;
		%feature("autodoc", "Constructs a 3d polygon on the triangulation of a shape with specified size of nodes.

Parameters
----------
theNbNodes: int
theHasParams: bool

Returns
-------
None
") Poly_PolygonOnTriangulation;
		 Poly_PolygonOnTriangulation(const Standard_Integer theNbNodes, const Standard_Boolean theHasParams);

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

		/****************** ChangeNodes ******************/
		/**** md5 signature: 804d9242adacaa7a4d3f6b5e4c274788 ****/
		%feature("compactdefaultargs") ChangeNodes;
		%feature("autodoc", "No available documentation.

Returns
-------
TColStd_Array1OfInteger
") ChangeNodes;
		TColStd_Array1OfInteger & ChangeNodes();

		/****************** ChangeParameters ******************/
		/**** md5 signature: 40b04bec95a03e3395d29d982eedb28b ****/
		%feature("compactdefaultargs") ChangeParameters;
		%feature("autodoc", "No available documentation.

Returns
-------
TColStd_Array1OfReal
") ChangeParameters;
		TColStd_Array1OfReal & ChangeParameters();

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
		/**** md5 signature: 6fb4c31e8f4445c1597fc8b70a63cbfb ****/
		%feature("compactdefaultargs") Deflection;
		%feature("autodoc", "Returns the deflection of this polygon.

Returns
-------
float
") Deflection;
		Standard_Real Deflection();

		/****************** Deflection ******************/
		/**** md5 signature: 252c3a361469b253f0b50ec6dd3eaf91 ****/
		%feature("compactdefaultargs") Deflection;
		%feature("autodoc", "Sets the deflection of this polygon. see more on deflection in poly_polygones2d.

Parameters
----------
theDefl: float

Returns
-------
None
") Deflection;
		void Deflection(const Standard_Real theDefl);


            %feature("autodoc", "1");
            %extend{
                std::string DumpJsonToString(int depth=-1) {
                std::stringstream s;
                self->DumpJson(s, depth);
                return s.str();}
            };
		/****************** HasParameters ******************/
		/**** md5 signature: 948932cf6475b2432a8160f0c25bcdc0 ****/
		%feature("compactdefaultargs") HasParameters;
		%feature("autodoc", "Returns true if parameters are associated with the nodes in this polygon.

Returns
-------
bool
") HasParameters;
		Standard_Boolean HasParameters();

		/****************** NbNodes ******************/
		/**** md5 signature: e10a1e755c3c99568fdfec53b6a1d5d1 ****/
		%feature("compactdefaultargs") NbNodes;
		%feature("autodoc", "Returns the number of nodes for this polygon. note: if the polygon is closed, the point of closure is repeated at the end of its table of nodes. thus, on a closed triangle, the function nbnodes returns 4.

Returns
-------
int
") NbNodes;
		Standard_Integer NbNodes();

		/****************** Node ******************/
		/**** md5 signature: 9f232dd20d41f5521d50372a652ec320 ****/
		%feature("compactdefaultargs") Node;
		%feature("autodoc", "Returns node at the given index.

Parameters
----------
theIndex: int

Returns
-------
int
") Node;
		Standard_Integer Node(Standard_Integer theIndex);

		/****************** Nodes ******************/
		/**** md5 signature: 70cb2993ef664c271d7fd9a8e642d0be ****/
		%feature("compactdefaultargs") Nodes;
		%feature("autodoc", "Returns the table of nodes for this polygon. a node value is an index in the table of nodes specific to an existing triangulation of a shape.

Returns
-------
TColStd_Array1OfInteger
") Nodes;
		const TColStd_Array1OfInteger & Nodes();

		/****************** Parameter ******************/
		/**** md5 signature: 2f5e734c6e42280e9e364952ae484882 ****/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Returns parameter at the given index.

Parameters
----------
theIndex: int

Returns
-------
float
") Parameter;
		Standard_Real Parameter(Standard_Integer theIndex);

		/****************** Parameters ******************/
		/**** md5 signature: daf943ce276a3f498cf7feb206e7f048 ****/
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "Returns the table of the parameters associated with each node in this polygon. warning! use the function hasparameters to check if parameters are associated with the nodes in this polygon.

Returns
-------
opencascade::handle<TColStd_HArray1OfReal>
") Parameters;
		const opencascade::handle<TColStd_HArray1OfReal> & Parameters();

		/****************** SetNode ******************/
		/**** md5 signature: 6dafb5b35480fc427463237a0f797a89 ****/
		%feature("compactdefaultargs") SetNode;
		%feature("autodoc", "Sets node at the given index.

Parameters
----------
theIndex: int
theNode: int

Returns
-------
None
") SetNode;
		void SetNode(Standard_Integer theIndex, Standard_Integer theNode);

		/****************** SetParameter ******************/
		/**** md5 signature: 222a24354720b23b67bfff1614cffd76 ****/
		%feature("compactdefaultargs") SetParameter;
		%feature("autodoc", "Sets parameter at the given index.

Parameters
----------
theIndex: int
theValue: float

Returns
-------
None
") SetParameter;
		void SetParameter(Standard_Integer theIndex, Standard_Real theValue);

		/****************** SetParameters ******************/
		/**** md5 signature: 7e854a225b1c5a73057ee36a637ee884 ****/
		%feature("compactdefaultargs") SetParameters;
		%feature("autodoc", "Sets the table of the parameters associated with each node in this polygon. raises exception if array size doesn't much number of polygon nodes.

Parameters
----------
theParameters: TColStd_HArray1OfReal

Returns
-------
None
") SetParameters;
		void SetParameters(const opencascade::handle<TColStd_HArray1OfReal> & theParameters);

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
		/**** md5 signature: e5e4ddcb150e767e7fd52ddc274ac740 ****/
		%feature("compactdefaultargs") Poly_Triangle;
		%feature("autodoc", "Constructs a triangle and sets all indices to zero.

Returns
-------
None
") Poly_Triangle;
		 Poly_Triangle();

		/****************** Poly_Triangle ******************/
		/**** md5 signature: dbf41763cb6560ddac34be6e981e87aa ****/
		%feature("compactdefaultargs") Poly_Triangle;
		%feature("autodoc", "Constructs a triangle and sets its three indices, where these node values are indices in the table of nodes specific to an existing triangulation of a shape.

Parameters
----------
theN1: int
theN2: int
theN3: int

Returns
-------
None
") Poly_Triangle;
		 Poly_Triangle(const Standard_Integer theN1, const Standard_Integer theN2, const Standard_Integer theN3);


        %feature("autodoc","1");
        %extend {
            Standard_Integer GetChangeValue(const Standard_Integer theIndex) {
            return (Standard_Integer) $self->ChangeValue(theIndex);
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetChangeValue(const Standard_Integer theIndex,Standard_Integer value) {
            $self->ChangeValue(theIndex)=value;
            }
        };
		/****************** Get ******************/
		/**** md5 signature: ddf4ad86732262802cbb024e5688e653 ****/
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "Returns the node indices of this triangle.

Parameters
----------

Returns
-------
theN1: int
theN2: int
theN3: int
") Get;
		void Get(Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** Set ******************/
		/**** md5 signature: fa0fefff609bb2b2e13376358214c481 ****/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Sets the value of the three nodes of this triangle.

Parameters
----------
theN1: int
theN2: int
theN3: int

Returns
-------
None
") Set;
		void Set(const Standard_Integer theN1, const Standard_Integer theN2, const Standard_Integer theN3);

		/****************** Set ******************/
		/**** md5 signature: 18bb187316263700055821b3756ccaff ****/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Sets the value of node with specified index of this triangle. raises standard_outofrange if index is not in 1,2,3.

Parameters
----------
theIndex: int
theNode: int

Returns
-------
None
") Set;
		void Set(const Standard_Integer theIndex, const Standard_Integer theNode);

		/****************** Value ******************/
		/**** md5 signature: 14d118f74e707c89d3bca2fd9e165273 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Get the node of given index. raises outofrange from standard if index is not in 1,2,3.

Parameters
----------
theIndex: int

Returns
-------
int
") Value;
		Standard_Integer Value(const Standard_Integer theIndex);

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
		/**** md5 signature: fb64c7c55a06db0e43a312bf4d247ed4 ****/
		%feature("compactdefaultargs") Poly_Triangulation;
		%feature("autodoc", "Constructs an empty triangulation.

Returns
-------
None
") Poly_Triangulation;
		 Poly_Triangulation();

		/****************** Poly_Triangulation ******************/
		/**** md5 signature: cf580e761a0d35d2b1b1bf249127ab07 ****/
		%feature("compactdefaultargs") Poly_Triangulation;
		%feature("autodoc", "Constructs a triangulation from a set of triangles. the triangulation is initialized without a triangle or a node, but capable of containing specified number of nodes and triangles. @param thenbnodes [in] number of nodes to allocate @param thenbtriangles [in] number of triangles to allocate @param thehasuvnodes [in] indicates whether 2d nodes will be associated with 3d ones,  (i.e. to enable a 2d representation) @param thehasnormals [in] indicates whether normals will be given and associated with nodes.

Parameters
----------
theNbNodes: int
theNbTriangles: int
theHasUVNodes: bool
theHasNormals: bool,optional
	default value is false

Returns
-------
None
") Poly_Triangulation;
		 Poly_Triangulation(const Standard_Integer theNbNodes, const Standard_Integer theNbTriangles, const Standard_Boolean theHasUVNodes, const Standard_Boolean theHasNormals = false);

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

		/****************** AddNormals ******************/
		/**** md5 signature: 988703ac37188d57b77d5222e786606b ****/
		%feature("compactdefaultargs") AddNormals;
		%feature("autodoc", "If an array for normals is not allocated yet, do it now.

Returns
-------
None
") AddNormals;
		void AddNormals();

		/****************** AddUVNodes ******************/
		/**** md5 signature: aef4f8f1c7752e806298ac1fdb6f085e ****/
		%feature("compactdefaultargs") AddUVNodes;
		%feature("autodoc", "If an array for uv coordinates is not allocated yet, do it now.

Returns
-------
None
") AddUVNodes;
		void AddUVNodes();

		/****************** CachedMinMax ******************/
		/**** md5 signature: 860f1473de4c867bdd1263481bff6a31 ****/
		%feature("compactdefaultargs") CachedMinMax;
		%feature("autodoc", "Returns cached min - max range of triangulation data, which is void by default (e.g, no cached information).

Returns
-------
Bnd_Box
") CachedMinMax;
		const Bnd_Box & CachedMinMax();

		/****************** ChangeTriangle ******************/
		/**** md5 signature: 97503b6bcbbe63dc66901debc4bacfe4 ****/
		%feature("compactdefaultargs") ChangeTriangle;
		%feature("autodoc", "No available documentation.

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
		%feature("autodoc", "No available documentation.

Returns
-------
Poly_Array1OfTriangle
") ChangeTriangles;
		Poly_Array1OfTriangle & ChangeTriangles();

		/****************** Clear ******************/
		/**** md5 signature: 1badd2d119b64dbdb177834e510c3af9 ****/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Clears internal arrays of nodes and all attributes.

Returns
-------
None
") Clear;
		virtual void Clear();

		/****************** ComputeNormals ******************/
		/**** md5 signature: 110f2870d1645fb6f770425c5390b82b ****/
		%feature("compactdefaultargs") ComputeNormals;
		%feature("autodoc", "Compute smooth normals by averaging triangle normals.

Returns
-------
None
") ComputeNormals;
		void ComputeNormals();

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
		/**** md5 signature: b86bc3614056d639b4f5cd50c01cdd01 ****/
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

		/****************** DetachedLoadDeferredData ******************/
		/**** md5 signature: 9af9a4d45f59e107cacdd9ec789b0012 ****/
		%feature("compactdefaultargs") DetachedLoadDeferredData;
		%feature("autodoc", "Loads triangulation data into new poly_triangulation object from some deferred storage using specified shared input file system.

Parameters
----------
theFileSystem: OSD_FileSystem,optional
	default value is opencascade::handle<OSD_FileSystem>()

Returns
-------
opencascade::handle<Poly_Triangulation>
") DetachedLoadDeferredData;
		virtual opencascade::handle<Poly_Triangulation> DetachedLoadDeferredData(const opencascade::handle<OSD_FileSystem> & theFileSystem = opencascade::handle<OSD_FileSystem>());


            %feature("autodoc", "1");
            %extend{
                std::string DumpJsonToString(int depth=-1) {
                std::stringstream s;
                self->DumpJson(s, depth);
                return s.str();}
            };
		/****************** HasCachedMinMax ******************/
		/**** md5 signature: f79a105a5bcf422403c5e9f9fd81b27f ****/
		%feature("compactdefaultargs") HasCachedMinMax;
		%feature("autodoc", "Returns true if there is some cached min - max range of this triangulation.

Returns
-------
bool
") HasCachedMinMax;
		Standard_Boolean HasCachedMinMax();

		/****************** HasDeferredData ******************/
		/**** md5 signature: 6d3e21e66856957a5fa945244fecad2c ****/
		%feature("compactdefaultargs") HasDeferredData;
		%feature("autodoc", "Returns true if there is some triangulation data that can be loaded using loaddeferreddata().

Returns
-------
bool
") HasDeferredData;
		virtual Standard_Boolean HasDeferredData();

		/****************** HasGeometry ******************/
		/**** md5 signature: a4660e9afa0dc45d915e55b9cc6a1ce8 ****/
		%feature("compactdefaultargs") HasGeometry;
		%feature("autodoc", "Returns true if triangulation has some geometry.

Returns
-------
bool
") HasGeometry;
		virtual Standard_Boolean HasGeometry();

		/****************** HasNormals ******************/
		/**** md5 signature: 07515066bfaef42256152544d89b8a1b ****/
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

		/****************** InternalNodes ******************/
		/**** md5 signature: 403a5fe5cb6597f76bbee32dd2e0bec6 ****/
		%feature("compactdefaultargs") InternalNodes;
		%feature("autodoc", "Returns an internal array of nodes. node()/setnode() should be used instead in portable code.

Returns
-------
Poly_ArrayOfNodes
") InternalNodes;
		Poly_ArrayOfNodes & InternalNodes();

		/****************** InternalNormals ******************/
		/**** md5 signature: 93e4192abafb087bf6c239c37a37ebf6 ****/
		%feature("compactdefaultargs") InternalNormals;
		%feature("autodoc", "Return an internal array of normals. normal()/setnormal() should be used instead in portable code.

Returns
-------
NCollection_Array1<gp_Vec3f>
") InternalNormals;
		NCollection_Array1<gp_Vec3f> InternalNormals();

		/****************** InternalTriangles ******************/
		/**** md5 signature: 1a53bffdd17170444b156e94f8320fdf ****/
		%feature("compactdefaultargs") InternalTriangles;
		%feature("autodoc", "Returns an internal array of triangles. triangle()/settriangle() should be used instead in portable code.

Returns
-------
Poly_Array1OfTriangle
") InternalTriangles;
		Poly_Array1OfTriangle & InternalTriangles();

		/****************** InternalUVNodes ******************/
		/**** md5 signature: 59cea86b8917085f807b814917ebbb4e ****/
		%feature("compactdefaultargs") InternalUVNodes;
		%feature("autodoc", "Returns an internal array of uv nodes. ubnode()/setuvnode() should be used instead in portable code.

Returns
-------
Poly_ArrayOfUVNodes
") InternalUVNodes;
		Poly_ArrayOfUVNodes & InternalUVNodes();

		/****************** IsDoublePrecision ******************/
		/**** md5 signature: c768d26054fe7836c133ffb1451dd7cd ****/
		%feature("compactdefaultargs") IsDoublePrecision;
		%feature("autodoc", "Returns true if node positions are defined with double precision; true by default.

Returns
-------
bool
") IsDoublePrecision;
		bool IsDoublePrecision();

		/****************** LoadDeferredData ******************/
		/**** md5 signature: 24c1ab4ecc3f85c797488cce47e81392 ****/
		%feature("compactdefaultargs") LoadDeferredData;
		%feature("autodoc", "Loads triangulation data into itself from some deferred storage using specified shared input file system.

Parameters
----------
theFileSystem: OSD_FileSystem,optional
	default value is opencascade::handle<OSD_FileSystem>()

Returns
-------
bool
") LoadDeferredData;
		virtual Standard_Boolean LoadDeferredData(const opencascade::handle<OSD_FileSystem> & theFileSystem = opencascade::handle<OSD_FileSystem>());

		/****************** MapNodeArray ******************/
		/**** md5 signature: 9c275c60798ddd9c1b7e5d68f7c29b6d ****/
		%feature("compactdefaultargs") MapNodeArray;
		%feature("autodoc", "Returns the table of 3d points for read-only access or null if nodes array is undefined. poly_triangulation::node() should be used instead when possible. returned object should not be used after poly_triangulation destruction.

Returns
-------
opencascade::handle<TColgp_HArray1OfPnt>
") MapNodeArray;
		opencascade::handle<TColgp_HArray1OfPnt> MapNodeArray();

		/****************** MapNormalArray ******************/
		/**** md5 signature: 4ff4fd7887eef1b2c85132e2201f9244 ****/
		%feature("compactdefaultargs") MapNormalArray;
		%feature("autodoc", "Returns the table of per-vertex normals for read-only access or null if normals array is undefined. poly_triangulation::normal() should be used instead when possible. returned object should not be used after poly_triangulation destruction.

Returns
-------
opencascade::handle<TShort_HArray1OfShortReal>
") MapNormalArray;
		opencascade::handle<TShort_HArray1OfShortReal> MapNormalArray();

		/****************** MapTriangleArray ******************/
		/**** md5 signature: e5a1f4ced93fc073d52de30aa690a57d ****/
		%feature("compactdefaultargs") MapTriangleArray;
		%feature("autodoc", "Returns the triangle array for read-only access or null if triangle array is undefined. poly_triangulation::triangle() should be used instead when possible. returned object should not be used after poly_triangulation destruction.

Returns
-------
opencascade::handle<Poly_HArray1OfTriangle>
") MapTriangleArray;
		opencascade::handle<Poly_HArray1OfTriangle> MapTriangleArray();

		/****************** MapUVNodeArray ******************/
		/**** md5 signature: 06601b50e73ad7b0e2ea1e0a991dfb6f ****/
		%feature("compactdefaultargs") MapUVNodeArray;
		%feature("autodoc", "Returns the table of 2d nodes for read-only access or null if uv nodes array is undefined. poly_triangulation::uvnode() should be used instead when possible. returned object should not be used after poly_triangulation destruction.

Returns
-------
opencascade::handle<TColgp_HArray1OfPnt2d>
") MapUVNodeArray;
		opencascade::handle<TColgp_HArray1OfPnt2d> MapUVNodeArray();

		/****************** MeshPurpose ******************/
		/**** md5 signature: ba1e18e20d36cd45158708664262234a ****/
		%feature("compactdefaultargs") MeshPurpose;
		%feature("autodoc", "Returns mesh purpose bits.

Returns
-------
Poly_MeshPurpose
") MeshPurpose;
		Poly_MeshPurpose MeshPurpose();

		/****************** MinMax ******************/
		/**** md5 signature: 6e35e4cffcebf3b16403a57344e99893 ****/
		%feature("compactdefaultargs") MinMax;
		%feature("autodoc", "Extends the passed box with bounding box of this triangulation. uses cached min - max range when available and: - input transformation thetrsf has no rotation part; - theisaccurate is set to false; - no triangulation data available (e.g. it is deferred and not loaded). @param thebox [in] [out] bounding box to extend by this triangulation @param thetrsf [in] optional transformation @param theisaccurate [in] when false, allows using a cached min - max range of this triangulation  even for non-identity transformation. returns false if there is no any data to extend the passed box (no both triangulation and cached min - max range).

Parameters
----------
theBox: Bnd_Box
theTrsf: gp_Trsf
theIsAccurate: bool,optional
	default value is false

Returns
-------
bool
") MinMax;
		Standard_Boolean MinMax(Bnd_Box & theBox, const gp_Trsf & theTrsf, const bool theIsAccurate = false);

		/****************** NbDeferredNodes ******************/
		/**** md5 signature: 181f24753f86afef53db878ca490cb7f ****/
		%feature("compactdefaultargs") NbDeferredNodes;
		%feature("autodoc", "Returns number of deferred nodes that can be loaded using loaddeferreddata(). note: this is estimated values, which might be different from actually loaded values. always check triangulation size of actually loaded data in code to avoid out-of-range issues.

Returns
-------
int
") NbDeferredNodes;
		virtual Standard_Integer NbDeferredNodes();

		/****************** NbDeferredTriangles ******************/
		/**** md5 signature: 6590098237c07bc2fc7c793b6ca3b413 ****/
		%feature("compactdefaultargs") NbDeferredTriangles;
		%feature("autodoc", "Returns number of deferred triangles that can be loaded using loaddeferreddata(). note: this is estimated values, which might be different from actually loaded values always check triangulation size of actually loaded data in code to avoid out-of-range issues.

Returns
-------
int
") NbDeferredTriangles;
		virtual Standard_Integer NbDeferredTriangles();

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
		/**** md5 signature: 48e932705302aa5c401569deb665fd5b ****/
		%feature("compactdefaultargs") Node;
		%feature("autodoc", "Returns a node at the given index. @param[in] theindex node index within [1, nbnodes()] range returns 3d point coordinates.

Parameters
----------
theIndex: int

Returns
-------
gp_Pnt
") Node;
		gp_Pnt Node(Standard_Integer theIndex);

		/****************** Normal ******************/
		/**** md5 signature: 253664a7e4e8068dfd6a122d8bad4c73 ****/
		%feature("compactdefaultargs") Normal;
		%feature("autodoc", "Returns normal at the given index. @param[in] theindex node index within [1, nbnodes()] range returns normalized 3d vector defining a surface normal.

Parameters
----------
theIndex: int

Returns
-------
gp_Dir
") Normal;
		gp_Dir Normal(Standard_Integer theIndex);

		/****************** Normal ******************/
		/**** md5 signature: 110aa4fbe5c4eb7a7d08446898f30660 ****/
		%feature("compactdefaultargs") Normal;
		%feature("autodoc", "Returns normal at the given index. @param[in] theindex node index within [1, nbnodes()] range @param[out] thevec3 3d vector defining a surface normal.

Parameters
----------
theIndex: int
theVec3: gp_Vec3f

Returns
-------
None
") Normal;
		void Normal(Standard_Integer theIndex, gp_Vec3f & theVec3);

		/****************** Parameters ******************/
		/**** md5 signature: 6252211024a9c3cb02e54aa22a221883 ****/
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "Returns initial set of parameters used to generate this triangulation.

Returns
-------
opencascade::handle<Poly_TriangulationParameters>
") Parameters;
		const opencascade::handle<Poly_TriangulationParameters> & Parameters();

		/****************** Parameters ******************/
		/**** md5 signature: 61d90060156bad034a55aa0c625a7f41 ****/
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "Updates initial set of parameters used to generate this triangulation.

Parameters
----------
theParams: Poly_TriangulationParameters

Returns
-------
None
") Parameters;
		void Parameters(const opencascade::handle<Poly_TriangulationParameters> & theParams);

		/****************** RemoveNormals ******************/
		/**** md5 signature: 906873267f0d5cb3a94c9b91f41d3f43 ****/
		%feature("compactdefaultargs") RemoveNormals;
		%feature("autodoc", "Deallocates the normals array.

Returns
-------
None
") RemoveNormals;
		void RemoveNormals();

		/****************** RemoveUVNodes ******************/
		/**** md5 signature: 40045c3c77e535165bfc8c8523acf1d5 ****/
		%feature("compactdefaultargs") RemoveUVNodes;
		%feature("autodoc", "Deallocates the uv nodes array.

Returns
-------
None
") RemoveUVNodes;
		void RemoveUVNodes();

		/****************** ResizeNodes ******************/
		/**** md5 signature: 3b86fbe9b3c9ba30b4ebf0344ad53a7b ****/
		%feature("compactdefaultargs") ResizeNodes;
		%feature("autodoc", "Method resizing internal arrays of nodes (synchronously for all attributes). @param thenbnodes [in] new number of nodes @param thetocopyold [in] copy old nodes into the new array.

Parameters
----------
theNbNodes: int
theToCopyOld: bool

Returns
-------
None
") ResizeNodes;
		void ResizeNodes(Standard_Integer theNbNodes, Standard_Boolean theToCopyOld);

		/****************** ResizeTriangles ******************/
		/**** md5 signature: adc8606878f0507cdc07dcad06d7a5a2 ****/
		%feature("compactdefaultargs") ResizeTriangles;
		%feature("autodoc", "Method resizing an internal array of triangles. @param thenbtriangles [in] new number of triangles @param thetocopyold [in] copy old triangles into the new array.

Parameters
----------
theNbTriangles: int
theToCopyOld: bool

Returns
-------
None
") ResizeTriangles;
		void ResizeTriangles(Standard_Integer theNbTriangles, Standard_Boolean theToCopyOld);

		/****************** SetCachedMinMax ******************/
		/**** md5 signature: 19ad72bfcaa33accf71079a046805f6c ****/
		%feature("compactdefaultargs") SetCachedMinMax;
		%feature("autodoc", "Sets a cached min - max range of this triangulation. the bounding box should exactly match actual range of triangulation data without a gap or transformation, or otherwise undefined behavior will be observed. passing a void range invalidates the cache.

Parameters
----------
theBox: Bnd_Box

Returns
-------
None
") SetCachedMinMax;
		void SetCachedMinMax(const Bnd_Box & theBox);

		/****************** SetDoublePrecision ******************/
		/**** md5 signature: 6c35f8efef0e359ce10f5e168a8c2030 ****/
		%feature("compactdefaultargs") SetDoublePrecision;
		%feature("autodoc", "Set if node positions should be defined with double or single precision for 3d and uv nodes. raises exception if data was already allocated.

Parameters
----------
theIsDouble: bool

Returns
-------
None
") SetDoublePrecision;
		void SetDoublePrecision(bool theIsDouble);

		/****************** SetMeshPurpose ******************/
		/**** md5 signature: 196379fb8aefcd5ad64b2c91f7fee649 ****/
		%feature("compactdefaultargs") SetMeshPurpose;
		%feature("autodoc", "Sets mesh purpose bits.

Parameters
----------
thePurpose: Poly_MeshPurpose

Returns
-------
None
") SetMeshPurpose;
		void SetMeshPurpose(const Poly_MeshPurpose thePurpose);

		/****************** SetNode ******************/
		/**** md5 signature: 4c86150f9d355bdf6918f3438a943304 ****/
		%feature("compactdefaultargs") SetNode;
		%feature("autodoc", "Sets a node coordinates. @param[in] theindex node index within [1, nbnodes()] range @param[in] thepnt 3d point coordinates.

Parameters
----------
theIndex: int
thePnt: gp_Pnt

Returns
-------
None
") SetNode;
		void SetNode(Standard_Integer theIndex, const gp_Pnt & thePnt);

		/****************** SetNormal ******************/
		/**** md5 signature: dc19aaf77561dbe449024631f4eeee1b ****/
		%feature("compactdefaultargs") SetNormal;
		%feature("autodoc", "Changes normal at the given index. @param[in] theindex node index within [1, nbnodes()] range @param[in] thevec3 normalized 3d vector defining a surface normal.

Parameters
----------
theIndex: int
theNormal: gp_Vec3f

Returns
-------
None
") SetNormal;
		void SetNormal(const Standard_Integer theIndex, const gp_Vec3f & theNormal);

		/****************** SetNormal ******************/
		/**** md5 signature: 0fdfdf6eef8e01f6f44ef167778a8399 ****/
		%feature("compactdefaultargs") SetNormal;
		%feature("autodoc", "Changes normal at the given index. @param[in] theindex node index within [1, nbnodes()] range @param[in] thenormal normalized 3d vector defining a surface normal.

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
		%feature("autodoc", "No available documentation.

Parameters
----------
theNormals: TShort_HArray1OfShortReal

Returns
-------
None
") SetNormals;
		void SetNormals(const opencascade::handle<TShort_HArray1OfShortReal> & theNormals);

		/****************** SetTriangle ******************/
		/**** md5 signature: 95a552e8aa9d409a641c1fe5418519b3 ****/
		%feature("compactdefaultargs") SetTriangle;
		%feature("autodoc", "Sets a triangle. @param[in] theindex triangle index within [1, nbtriangles()] range @param[in] thetriangle triangle node indices, with each node defined within [1, nbnodes()] range.

Parameters
----------
theIndex: int
theTriangle: Poly_Triangle

Returns
-------
None
") SetTriangle;
		void SetTriangle(Standard_Integer theIndex, const Poly_Triangle & theTriangle);

		/****************** SetUVNode ******************/
		/**** md5 signature: 75f2dd3953e33c453b0caa0b3b20f49f ****/
		%feature("compactdefaultargs") SetUVNode;
		%feature("autodoc", "Sets an uv-node coordinates. @param[in] theindex node index within [1, nbnodes()] range @param[in] thepnt uv coordinates.

Parameters
----------
theIndex: int
thePnt: gp_Pnt2d

Returns
-------
None
") SetUVNode;
		void SetUVNode(Standard_Integer theIndex, const gp_Pnt2d & thePnt);

		/****************** Triangle ******************/
		/**** md5 signature: 3883dfb3e28eb482bbc2fa1ac9c0a8bd ****/
		%feature("compactdefaultargs") Triangle;
		%feature("autodoc", "Returns triangle at the given index. @param[in] theindex triangle index within [1, nbtriangles()] range returns triangle node indices, with each node defined within [1, nbnodes()] range.

Parameters
----------
theIndex: int

Returns
-------
Poly_Triangle
") Triangle;
		const Poly_Triangle & Triangle(Standard_Integer theIndex);

		/****************** Triangles ******************/
		/**** md5 signature: ba43a8d32c20fbeb1020e37bd97d4aca ****/
		%feature("compactdefaultargs") Triangles;
		%feature("autodoc", "No available documentation.

Returns
-------
Poly_Array1OfTriangle
") Triangles;
		const Poly_Array1OfTriangle & Triangles();

		/****************** UVNode ******************/
		/**** md5 signature: 30f3fd5f160869900c18f852f4c89b00 ****/
		%feature("compactdefaultargs") UVNode;
		%feature("autodoc", "Returns uv-node at the given index. @param[in] theindex node index within [1, nbnodes()] range returns 2d point defining uv coordinates.

Parameters
----------
theIndex: int

Returns
-------
gp_Pnt2d
") UVNode;
		gp_Pnt2d UVNode(Standard_Integer theIndex);

		/****************** UnloadDeferredData ******************/
		/**** md5 signature: 7d284011e56d3e968d822420287d0f32 ****/
		%feature("compactdefaultargs") UnloadDeferredData;
		%feature("autodoc", "Releases triangulation data if it has connected deferred storage.

Returns
-------
bool
") UnloadDeferredData;
		virtual Standard_Boolean UnloadDeferredData();

		/****************** UpdateCachedMinMax ******************/
		/**** md5 signature: 4c361d8b4180a1ed7c2336bf5a7b6550 ****/
		%feature("compactdefaultargs") UpdateCachedMinMax;
		%feature("autodoc", "Updates cached min - max range of this triangulation with bounding box of nodal data.

Returns
-------
None
") UpdateCachedMinMax;
		void UpdateCachedMinMax();

};


%make_alias(Poly_Triangulation)

%extend Poly_Triangulation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class Poly_TriangulationParameters *
*************************************/
class Poly_TriangulationParameters : public Standard_Transient {
	public:
		/****************** Poly_TriangulationParameters ******************/
		/**** md5 signature: 2846ec507556dc9aeed354635ae24a71 ****/
		%feature("compactdefaultargs") Poly_TriangulationParameters;
		%feature("autodoc", "Constructor. initializes object with the given parameters. @param thedeflection linear deflection @param theangle angular deflection @param theminsize minimum size.

Parameters
----------
theDeflection: float,optional
	default value is -1
theAngle: float,optional
	default value is -1
theMinSize: float,optional
	default value is -1

Returns
-------
None
") Poly_TriangulationParameters;
		 Poly_TriangulationParameters(const Standard_Real theDeflection = -1, const Standard_Real theAngle = -1, const Standard_Real theMinSize = -1);

		/****************** Angle ******************/
		/**** md5 signature: 2e7a91a67b1745bc9ecd36bc3650ed68 ****/
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "Returns angular deflection or -1 if undefined.

Returns
-------
float
") Angle;
		Standard_Real Angle();

		/****************** Deflection ******************/
		/**** md5 signature: 6fb4c31e8f4445c1597fc8b70a63cbfb ****/
		%feature("compactdefaultargs") Deflection;
		%feature("autodoc", "Returns linear deflection or -1 if undefined.

Returns
-------
float
") Deflection;
		Standard_Real Deflection();

		/****************** HasAngle ******************/
		/**** md5 signature: c1223160f2439e874120d1b51f6c461c ****/
		%feature("compactdefaultargs") HasAngle;
		%feature("autodoc", "Returns true if angular deflection is defined.

Returns
-------
bool
") HasAngle;
		Standard_Boolean HasAngle();

		/****************** HasDeflection ******************/
		/**** md5 signature: 90ac27dcf3a3d8ea534c31817e1d0330 ****/
		%feature("compactdefaultargs") HasDeflection;
		%feature("autodoc", "Returns true if linear deflection is defined.

Returns
-------
bool
") HasDeflection;
		Standard_Boolean HasDeflection();

		/****************** HasMinSize ******************/
		/**** md5 signature: d918376e08395b3d644d99b6d1b1d4f9 ****/
		%feature("compactdefaultargs") HasMinSize;
		%feature("autodoc", "Returns true if minimum size is defined.

Returns
-------
bool
") HasMinSize;
		Standard_Boolean HasMinSize();

		/****************** MinSize ******************/
		/**** md5 signature: e59d58f0974e9001490d4ab40193a04b ****/
		%feature("compactdefaultargs") MinSize;
		%feature("autodoc", "Returns minimum size or -1 if undefined.

Returns
-------
float
") MinSize;
		Standard_Real MinSize();

};


%make_alias(Poly_TriangulationParameters)

%extend Poly_TriangulationParameters {
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
/* class aliases */
%pythoncode {
}
