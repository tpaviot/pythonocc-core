/*
Copyright 2008-2024 Thomas Paviot (tpaviot@gmail.com)

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
https://dev.opencascade.org/doc/occt-7.8.0/refman/html/package_poly.html"
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
%include ../common/IOStream.i
%include ../common/ArrayMacros.i


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

/*
numpy support for Geom, Geom2d, Poly, TColStd, TColgp, TShort see
https://github.com/tpaviot/pythonocc-core/pull/1381
*/
%{
#define SWIG_FILE_WITH_INIT
%}
%include ../common/numpy.i

%init %{
        import_array();
%}

%pythoncode {
    import numpy as np
}
%apply (double* IN_ARRAY1, int DIM1) { (double* numpyArrayU, int nRowsU) };
%apply (double* IN_ARRAY2, int DIM1, int DIM2) { (double* numpyArrayUV, int nRowsUV, int nColUV) };
%apply (double* ARGOUT_ARRAY1, int DIM1) { (double* numpyArrayResultArgout, int aSizeArgout) };

/*
end of numpy support section
*/
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
%wrap_handle(Poly_CoherentTriangulation)
%wrap_handle(Poly_MergeNodesTool)
%wrap_handle(Poly_Polygon2D)
%wrap_handle(Poly_Polygon3D)
%wrap_handle(Poly_PolygonOnTriangulation)
%wrap_handle(Poly_Triangulation)
%wrap_handle(Poly_TriangulationParameters)
%wrap_handle(Poly_HArray1OfTriangle)
/* end handles declaration */

/* templates */
%apply (long long* IN_ARRAY2, int DIM1, int DIM2) { (long long* numpyArray2, int nRows2, int nDims2) };
%apply (long long* ARGOUT_ARRAY1, int DIM1) { (long long* numpyArray2Argout, int aSizeArgout) };
Array1OfTriaNumpyTemplate(Poly_Array1OfTriangle, Poly_Triangle)

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
		/****** Poly::Catenate ******/
		/****** md5 signature: 8b036e4e75e3078148e1b7346b52eb84 ******/
		%feature("compactdefaultargs") Catenate;
		%feature("autodoc", "
Parameters
----------
lstTri: Poly_ListOfTriangulation

Return
-------
opencascade::handle<Poly_Triangulation>

Description
-----------
Computes and stores the link from nodes to triangles and from triangles to neighbouring triangles. This tool is obsolete, replaced by Poly_CoherentTriangulation Algorithm to make minimal loops in a graph Join several triangulations to one new triangulation object. The new triangulation is just a mechanical sum of input triangulations, without node sharing. UV coordinates are dropped in the result.
") Catenate;
		static opencascade::handle<Poly_Triangulation> Catenate(const Poly_ListOfTriangulation & lstTri);

		/****** Poly::ComputeNormals ******/
		/****** md5 signature: 4015a8f6c870ca14e91d70eaa454df12 ******/
		%feature("compactdefaultargs") ComputeNormals;
		%feature("autodoc", "
Parameters
----------
Tri: Poly_Triangulation

Return
-------
None

Description
-----------
Compute node normals for face triangulation as mean normal of surrounding triangles.
") ComputeNormals;
		static void ComputeNormals(const opencascade::handle<Poly_Triangulation> & Tri);

		/****** Poly::Dump ******/
		/****** md5 signature: 20ef821c6b6ca818ea67764cc6c404e0 ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------
T: Poly_Triangulation

Return
-------
OS: Standard_OStream

Description
-----------
Dumps the triangulation. This is a call to the previous method with Comapct set to False.
") Dump;
		static void Dump(const opencascade::handle<Poly_Triangulation> & T, std::ostream &OutValue);

		/****** Poly::Dump ******/
		/****** md5 signature: 124fa6bb0d1c932fed8d7c2f072153ff ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------
P: Poly_Polygon3D

Return
-------
OS: Standard_OStream

Description
-----------
Dumps the 3D polygon. This is a call to the previous method with Comapct set to False.
") Dump;
		static void Dump(const opencascade::handle<Poly_Polygon3D> & P, std::ostream &OutValue);

		/****** Poly::Dump ******/
		/****** md5 signature: cec175f277279955d3c47430641a6e45 ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------
P: Poly_Polygon2D

Return
-------
OS: Standard_OStream

Description
-----------
Dumps the 2D polygon. This is a call to the previous method with Comapct set to False.
") Dump;
		static void Dump(const opencascade::handle<Poly_Polygon2D> & P, std::ostream &OutValue);

		/****** Poly::Intersect ******/
		/****** md5 signature: 71cc08bc38965ffeef03bdfbfe9c34a4 ******/
		%feature("compactdefaultargs") Intersect;
		%feature("autodoc", "
Parameters
----------
theTri: Poly_Triangulation
theAxis: gp_Ax1
theIsClosest: bool
theTriangle: Poly_Triangle

Return
-------
theDistance: float

Description
-----------
Computes the intersection between axis and triangulation. 
Input parameter: theTri input triangulation 
Input parameter: theAxis intersecting ray 
Input parameter: theIsClosest finds the closest intersection when True, finds the farthest otherwise @param[out] theTriangle intersected triangle @param[out] theDistance distance along ray to intersection point 
Return: True if intersection takes place, False otherwise.
") Intersect;
		static Standard_Boolean Intersect(const opencascade::handle<Poly_Triangulation> & theTri, const gp_Ax1 & theAxis, const Standard_Boolean theIsClosest, Poly_Triangle & theTriangle, Standard_Real &OutValue);

		/****** Poly::IntersectTriLine ******/
		/****** md5 signature: 3f27e1173b34c9ae04f7086818dc488c ******/
		%feature("compactdefaultargs") IntersectTriLine;
		%feature("autodoc", "
Parameters
----------
theStart: gp_XYZ
theDir: gp_Dir
theV0: gp_XYZ
theV1: gp_XYZ
theV2: gp_XYZ

Return
-------
theParam: float

Description
-----------
Computes the intersection between a triangle defined by three vertexes and a line. 
Input parameter: theStart picking ray origin 
Input parameter: theDir picking ray direction 
Input parameter: theV0 first triangle node 
Input parameter: theV1 second triangle node 
Input parameter: theV2 third triangle node @param[out] theParam param on line of the intersection point 
Return: 1 if intersection was found, 0 otherwise.
") IntersectTriLine;
		static Standard_Integer IntersectTriLine(const gp_XYZ & theStart, const gp_Dir & theDir, const gp_XYZ & theV0, const gp_XYZ & theV1, const gp_XYZ & theV2, Standard_Real &OutValue);

		/****** Poly::PointOnTriangle ******/
		/****** md5 signature: f16707629e29bded6eb5591e5f49f99e ******/
		%feature("compactdefaultargs") PointOnTriangle;
		%feature("autodoc", "
Parameters
----------
P1: gp_XY
P2: gp_XY
P3: gp_XY
P: gp_XY
UV: gp_XY

Return
-------
float

Description
-----------
Computes parameters of the point P on triangle defined by points P1, P2, and P3, in 2d. The parameters U and V are defined so that P = P1 + U * (P2 - P1) + V * (P3 - P1), with U >= 0, V >= 0, U + V <= 1. If P is located outside of triangle, or triangle is degenerated, the returned parameters correspond to closest point, and returned value is square of the distance from original point to triangle (0 if point is inside).
") PointOnTriangle;
		static Standard_Real PointOnTriangle(const gp_XY & P1, const gp_XY & P2, const gp_XY & P3, const gp_XY & P, gp_XY & UV);

		/****** Poly::ReadPolygon2D ******/
		/****** md5 signature: 5203f6d8bfde5b08c5cdc75dc617276a ******/
		%feature("compactdefaultargs") ReadPolygon2D;
		%feature("autodoc", "
Parameters
----------
IS: str

Return
-------
opencascade::handle<Poly_Polygon2D>

Description
-----------
Reads a 2D polygon from the stream <IS>.
") ReadPolygon2D;
		static opencascade::handle<Poly_Polygon2D> ReadPolygon2D(std::istream & IS);

		/****** Poly::ReadPolygon3D ******/
		/****** md5 signature: b03d53c160a0fe0fe5c347003d67f6e3 ******/
		%feature("compactdefaultargs") ReadPolygon3D;
		%feature("autodoc", "
Parameters
----------
IS: str

Return
-------
opencascade::handle<Poly_Polygon3D>

Description
-----------
Reads a 3d polygon from the stream <IS>.
") ReadPolygon3D;
		static opencascade::handle<Poly_Polygon3D> ReadPolygon3D(std::istream & IS);

		/****** Poly::ReadTriangulation ******/
		/****** md5 signature: ed5c32c8ff81d9265e69f08077c31530 ******/
		%feature("compactdefaultargs") ReadTriangulation;
		%feature("autodoc", "
Parameters
----------
IS: str

Return
-------
opencascade::handle<Poly_Triangulation>

Description
-----------
Reads a triangulation from the stream <IS>.
") ReadTriangulation;
		static opencascade::handle<Poly_Triangulation> ReadTriangulation(std::istream & IS);

		/****** Poly::Write ******/
		/****** md5 signature: bbcae193e547f8e4d5c04a8c44cf6fdd ******/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "
Parameters
----------
T: Poly_Triangulation
Compact: bool (optional, default to Standard_True)

Return
-------
OS: Standard_OStream

Description
-----------
Writes the content of the triangulation <T> on the stream <OS>. If <Compact> is true this is a 'save' format intended to be read back with the Read method. If compact is False it is a 'Dump' format intended to be informative.
") Write;
		static void Write(const opencascade::handle<Poly_Triangulation> & T, std::ostream &OutValue, const Standard_Boolean Compact = Standard_True);

		/****** Poly::Write ******/
		/****** md5 signature: a0bed661a393965709bba5b5fe673585 ******/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "
Parameters
----------
P: Poly_Polygon3D
Compact: bool (optional, default to Standard_True)

Return
-------
OS: Standard_OStream

Description
-----------
Writes the content of the 3D polygon <P> on the stream <OS>. If <Compact> is true this is a 'save' format intended to be read back with the Read method. If compact is False it is a 'Dump' format intended to be informative.
") Write;
		static void Write(const opencascade::handle<Poly_Polygon3D> & P, std::ostream &OutValue, const Standard_Boolean Compact = Standard_True);

		/****** Poly::Write ******/
		/****** md5 signature: b1b1fb366e3d9a725c25026564e0ba21 ******/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "
Parameters
----------
P: Poly_Polygon2D
Compact: bool (optional, default to Standard_True)

Return
-------
OS: Standard_OStream

Description
-----------
Writes the content of the 2D polygon <P> on the stream <OS>. If <Compact> is true this is a 'save' format intended to be read back with the Read method. If compact is False it is a 'Dump' format intended to be informative.
") Write;
		static void Write(const opencascade::handle<Poly_Polygon2D> & P, std::ostream &OutValue, const Standard_Boolean Compact = Standard_True);

};


%extend Poly {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class Poly_ArrayOfNodes *
**************************/
class Poly_ArrayOfNodes : public NCollection_AliasedArray<> {
	public:
		/****** Poly_ArrayOfNodes::Poly_ArrayOfNodes ******/
		/****** md5 signature: a3fbef88d7cea7f227931f473b2f3f7e ******/
		%feature("compactdefaultargs") Poly_ArrayOfNodes;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor of double-precision array.
") Poly_ArrayOfNodes;
		 Poly_ArrayOfNodes();

		/****** Poly_ArrayOfNodes::Poly_ArrayOfNodes ******/
		/****** md5 signature: b77f7672fcf3bad012991e517148d0b6 ******/
		%feature("compactdefaultargs") Poly_ArrayOfNodes;
		%feature("autodoc", "
Parameters
----------
theLength: int

Return
-------
None

Description
-----------
Constructor of double-precision array.
") Poly_ArrayOfNodes;
		 Poly_ArrayOfNodes(Standard_Integer theLength);

		/****** Poly_ArrayOfNodes::Poly_ArrayOfNodes ******/
		/****** md5 signature: 71c54cc617fa3212fe7f98037904ee67 ******/
		%feature("compactdefaultargs") Poly_ArrayOfNodes;
		%feature("autodoc", "
Parameters
----------
theOther: Poly_ArrayOfNodes

Return
-------
None

Description
-----------
Copy constructor.
") Poly_ArrayOfNodes;
		 Poly_ArrayOfNodes(const Poly_ArrayOfNodes & theOther);

		/****** Poly_ArrayOfNodes::Poly_ArrayOfNodes ******/
		/****** md5 signature: 282e112d1d6b3b00cb621fbcc3d69c68 ******/
		%feature("compactdefaultargs") Poly_ArrayOfNodes;
		%feature("autodoc", "
Parameters
----------
theBegin: gp_Pnt
theLength: int

Return
-------
None

Description
-----------
Constructor wrapping pre-allocated C-array of values without copying them.
") Poly_ArrayOfNodes;
		 Poly_ArrayOfNodes(const gp_Pnt & theBegin, Standard_Integer theLength);

		/****** Poly_ArrayOfNodes::Poly_ArrayOfNodes ******/
		/****** md5 signature: f55ffaa17385828819bcc3d1f6ab78f6 ******/
		%feature("compactdefaultargs") Poly_ArrayOfNodes;
		%feature("autodoc", "
Parameters
----------
theBegin: gp_Vec3f
theLength: int

Return
-------
None

Description
-----------
Constructor wrapping pre-allocated C-array of values without copying them.
") Poly_ArrayOfNodes;
		 Poly_ArrayOfNodes(const gp_Vec3f & theBegin, Standard_Integer theLength);

		/****** Poly_ArrayOfNodes::Poly_ArrayOfNodes ******/
		/****** md5 signature: cb5136ed6787652571068de864b16043 ******/
		%feature("compactdefaultargs") Poly_ArrayOfNodes;
		%feature("autodoc", "
Parameters
----------
theOther: Poly_ArrayOfNodes

Return
-------
None

Description
-----------
Move constructor.
") Poly_ArrayOfNodes;
		 Poly_ArrayOfNodes(Poly_ArrayOfNodes & theOther);

		/****** Poly_ArrayOfNodes::Assign ******/
		/****** md5 signature: 702830dcb95dd43aecf671cba8d7bfdb ******/
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "
Parameters
----------
theOther: Poly_ArrayOfNodes

Return
-------
Poly_ArrayOfNodes

Description
-----------
Copies data of theOther array to this. The arrays should have the same length, but may have different precision / number of components (data conversion will be applied in the latter case).
") Assign;
		Poly_ArrayOfNodes & Assign(const Poly_ArrayOfNodes & theOther);

		/****** Poly_ArrayOfNodes::IsDoublePrecision ******/
		/****** md5 signature: c768d26054fe7836c133ffb1451dd7cd ******/
		%feature("compactdefaultargs") IsDoublePrecision;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if array defines nodes with double precision.
") IsDoublePrecision;
		bool IsDoublePrecision();

		/****** Poly_ArrayOfNodes::Move ******/
		/****** md5 signature: 20553a602539ccce80fca1871695acaa ******/
		%feature("compactdefaultargs") Move;
		%feature("autodoc", "
Parameters
----------
theOther: Poly_ArrayOfNodes

Return
-------
Poly_ArrayOfNodes

Description
-----------
Move assignment.
") Move;
		Poly_ArrayOfNodes & Move(Poly_ArrayOfNodes & theOther);

		/****** Poly_ArrayOfNodes::SetDoublePrecision ******/
		/****** md5 signature: 2fee9d611d346cc1324a9f63e1c71f99 ******/
		%feature("compactdefaultargs") SetDoublePrecision;
		%feature("autodoc", "
Parameters
----------
theIsDouble: bool

Return
-------
None

Description
-----------
Sets if array should define nodes with double or single precision. Raises exception if array was already allocated.
") SetDoublePrecision;
		void SetDoublePrecision(bool theIsDouble);

		/****** Poly_ArrayOfNodes::SetValue ******/
		/****** md5 signature: 1aac1c7522caf00e0c3f974b2daa072f ******/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "
Parameters
----------
theIndex: int
theValue: gp_Pnt

Return
-------
None

Description
-----------
A generalized setter for point.
") SetValue;
		void SetValue(Standard_Integer theIndex, const gp_Pnt & theValue);

		/****** Poly_ArrayOfNodes::Value ******/
		/****** md5 signature: cbbd0dda18a18774ab964a5d559342fd ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
gp_Pnt

Description
-----------
A generalized accessor to point.
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
		/****** Poly_ArrayOfUVNodes::Poly_ArrayOfUVNodes ******/
		/****** md5 signature: 6a860cf1c687b8dd0af354b672ebd0be ******/
		%feature("compactdefaultargs") Poly_ArrayOfUVNodes;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor of double-precision array.
") Poly_ArrayOfUVNodes;
		 Poly_ArrayOfUVNodes();

		/****** Poly_ArrayOfUVNodes::Poly_ArrayOfUVNodes ******/
		/****** md5 signature: 1d8cb6cf40bbc06f334d0a0a080d9f94 ******/
		%feature("compactdefaultargs") Poly_ArrayOfUVNodes;
		%feature("autodoc", "
Parameters
----------
theLength: int

Return
-------
None

Description
-----------
Constructor of double-precision array.
") Poly_ArrayOfUVNodes;
		 Poly_ArrayOfUVNodes(Standard_Integer theLength);

		/****** Poly_ArrayOfUVNodes::Poly_ArrayOfUVNodes ******/
		/****** md5 signature: e7970186b41655b1bbfbf070a9a812fa ******/
		%feature("compactdefaultargs") Poly_ArrayOfUVNodes;
		%feature("autodoc", "
Parameters
----------
theOther: Poly_ArrayOfUVNodes

Return
-------
None

Description
-----------
Copy constructor.
") Poly_ArrayOfUVNodes;
		 Poly_ArrayOfUVNodes(const Poly_ArrayOfUVNodes & theOther);

		/****** Poly_ArrayOfUVNodes::Poly_ArrayOfUVNodes ******/
		/****** md5 signature: fcc79601f1f551bf654e4b036563851d ******/
		%feature("compactdefaultargs") Poly_ArrayOfUVNodes;
		%feature("autodoc", "
Parameters
----------
theBegin: gp_Pnt2d
theLength: int

Return
-------
None

Description
-----------
Constructor wrapping pre-allocated C-array of values without copying them.
") Poly_ArrayOfUVNodes;
		 Poly_ArrayOfUVNodes(const gp_Pnt2d & theBegin, Standard_Integer theLength);

		/****** Poly_ArrayOfUVNodes::Poly_ArrayOfUVNodes ******/
		/****** md5 signature: 8dc88b2a8e6a1970829bc8d4ae3807c9 ******/
		%feature("compactdefaultargs") Poly_ArrayOfUVNodes;
		%feature("autodoc", "
Parameters
----------
theBegin: gp_Vec2f
theLength: int

Return
-------
None

Description
-----------
Constructor wrapping pre-allocated C-array of values without copying them.
") Poly_ArrayOfUVNodes;
		 Poly_ArrayOfUVNodes(const gp_Vec2f & theBegin, Standard_Integer theLength);

		/****** Poly_ArrayOfUVNodes::Poly_ArrayOfUVNodes ******/
		/****** md5 signature: e99c7bef1e8b316f6baf0752957bcbf9 ******/
		%feature("compactdefaultargs") Poly_ArrayOfUVNodes;
		%feature("autodoc", "
Parameters
----------
theOther: Poly_ArrayOfUVNodes

Return
-------
None

Description
-----------
Move constructor.
") Poly_ArrayOfUVNodes;
		 Poly_ArrayOfUVNodes(Poly_ArrayOfUVNodes & theOther);

		/****** Poly_ArrayOfUVNodes::Assign ******/
		/****** md5 signature: 0bd9a842cd074feea2878a80c6c59e05 ******/
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "
Parameters
----------
theOther: Poly_ArrayOfUVNodes

Return
-------
Poly_ArrayOfUVNodes

Description
-----------
Copies data of theOther array to this. The arrays should have the same length, but may have different precision / number of components (data conversion will be applied in the latter case).
") Assign;
		Poly_ArrayOfUVNodes & Assign(const Poly_ArrayOfUVNodes & theOther);

		/****** Poly_ArrayOfUVNodes::IsDoublePrecision ******/
		/****** md5 signature: c768d26054fe7836c133ffb1451dd7cd ******/
		%feature("compactdefaultargs") IsDoublePrecision;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if array defines nodes with double precision.
") IsDoublePrecision;
		bool IsDoublePrecision();

		/****** Poly_ArrayOfUVNodes::Move ******/
		/****** md5 signature: 540403cdd9a8016019da7b6bbf0e77a2 ******/
		%feature("compactdefaultargs") Move;
		%feature("autodoc", "
Parameters
----------
theOther: Poly_ArrayOfUVNodes

Return
-------
Poly_ArrayOfUVNodes

Description
-----------
Move assignment.
") Move;
		Poly_ArrayOfUVNodes & Move(Poly_ArrayOfUVNodes & theOther);

		/****** Poly_ArrayOfUVNodes::SetDoublePrecision ******/
		/****** md5 signature: 2fee9d611d346cc1324a9f63e1c71f99 ******/
		%feature("compactdefaultargs") SetDoublePrecision;
		%feature("autodoc", "
Parameters
----------
theIsDouble: bool

Return
-------
None

Description
-----------
Sets if array should define nodes with double or single precision. Raises exception if array was already allocated.
") SetDoublePrecision;
		void SetDoublePrecision(bool theIsDouble);

		/****** Poly_ArrayOfUVNodes::SetValue ******/
		/****** md5 signature: 932309e2e29429a1b56967cc7847fbb2 ******/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "
Parameters
----------
theIndex: int
theValue: gp_Pnt2d

Return
-------
None

Description
-----------
A generalized setter for point.
") SetValue;
		void SetValue(Standard_Integer theIndex, const gp_Pnt2d & theValue);

		/****** Poly_ArrayOfUVNodes::Value ******/
		/****** md5 signature: 4d7c0ab83170d94e467103748821c3a2 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
gp_Pnt2d

Description
-----------
A generalized accessor to point.
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
		/****** Poly_CoherentLink::Poly_CoherentLink ******/
		/****** md5 signature: de339f475ff4c5e96b485232d5b4c51b ******/
		%feature("compactdefaultargs") Poly_CoherentLink;
		%feature("autodoc", "Return
-------
None

Description
-----------
/** * Empty constructor. */.
") Poly_CoherentLink;
		 Poly_CoherentLink();

		/****** Poly_CoherentLink::Poly_CoherentLink ******/
		/****** md5 signature: 4e38aae465e5a86814325a10b67df9b3 ******/
		%feature("compactdefaultargs") Poly_CoherentLink;
		%feature("autodoc", "
Parameters
----------
iNode0: int
iNode1: int

Return
-------
None

Description
-----------
/** * Constructor. Creates a Link that has no reference to 'opposite nodes'. * This constructor is useful to create temporary object that is not * inserted into any existing triangulation. */.
") Poly_CoherentLink;
		 Poly_CoherentLink(const Standard_Integer iNode0, const Standard_Integer iNode1);

		/****** Poly_CoherentLink::Poly_CoherentLink ******/
		/****** md5 signature: 4c370c5efce77297b2639c4a3356b1ac ******/
		%feature("compactdefaultargs") Poly_CoherentLink;
		%feature("autodoc", "
Parameters
----------
theTri: Poly_CoherentTriangle
iSide: int

Return
-------
None

Description
-----------
/** * Constructor, takes a triangle and a side. A link is created always such * that myNode[0] < myNode[1]. Unlike the previous constructor, this one * assigns the 'opposite node' fields. This constructor is used when a * link is inserted into a Poly_CoherentTriangulation structure. * 
Parameter theTri * Triangle containing the link that is created * 
Parameter iSide * Can be 0, 1 or 2. Index of the node */.
") Poly_CoherentLink;
		 Poly_CoherentLink(const Poly_CoherentTriangle & theTri, Standard_Integer iSide);

		/****** Poly_CoherentLink::GetAttribute ******/
		/****** md5 signature: f9b24d82f6ecd615807725529006c38c ******/
		%feature("compactdefaultargs") GetAttribute;
		%feature("autodoc", "Return
-------
Standard_Address

Description
-----------
/** * Query the attribute of the Link. */.
") GetAttribute;
		Standard_Address GetAttribute();

		/****** Poly_CoherentLink::IsEmpty ******/
		/****** md5 signature: e0fa1d0f35a1c4ad702e4e993780ae41 ******/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Return
-------
bool

Description
-----------
/** * Query the status of the link - if it is an invalid one. * An invalid link has Node members equal to -1. */.
") IsEmpty;
		Standard_Boolean IsEmpty();

		/****** Poly_CoherentLink::Node ******/
		/****** md5 signature: 0c8b3e4d6b02b354a59bbdabd461f25e ******/
		%feature("compactdefaultargs") Node;
		%feature("autodoc", "
Parameters
----------
ind: int

Return
-------
int

Description
-----------
/** * Return the node index in the current triangulation. * 
Parameter ind * 0 or 1 making distinction of the two nodes that constitute the Link. * Node(0) always returns a smaller number than Node(1). */.
") Node;
		Standard_Integer Node(const Standard_Integer ind);

		/****** Poly_CoherentLink::Nullify ******/
		/****** md5 signature: da3ddb1c253fce8554813210fafdb757 ******/
		%feature("compactdefaultargs") Nullify;
		%feature("autodoc", "Return
-------
None

Description
-----------
/** * Invalidate this Link. */.
") Nullify;
		void Nullify();

		/****** Poly_CoherentLink::OppositeNode ******/
		/****** md5 signature: 38ad0f771fdab79fb96de90e7fdf8dde ******/
		%feature("compactdefaultargs") OppositeNode;
		%feature("autodoc", "
Parameters
----------
ind: int

Return
-------
int

Description
-----------
/** * Return the opposite node (belonging to the left or right incident triangle) * index in the current triangulation. * 
Parameter ind * 0 or 1 making distinction of the two involved triangles: 0 on the left, * 1 on the right side of the Link. */.
") OppositeNode;
		Standard_Integer OppositeNode(const Standard_Integer ind);

		/****** Poly_CoherentLink::SetAttribute ******/
		/****** md5 signature: 010064256220b0dd62418f98aaddd85b ******/
		%feature("compactdefaultargs") SetAttribute;
		%feature("autodoc", "
Parameters
----------
theAtt: Standard_Address

Return
-------
None

Description
-----------
/** * Set the attribute of the Link. */.
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
		/****** Poly_CoherentNode::Poly_CoherentNode ******/
		/****** md5 signature: 2e6eb857b24efe616d474b306cd58a72 ******/
		%feature("compactdefaultargs") Poly_CoherentNode;
		%feature("autodoc", "Return
-------
None

Description
-----------
/** * Empty constructor. */.
") Poly_CoherentNode;
		 Poly_CoherentNode();

		/****** Poly_CoherentNode::Poly_CoherentNode ******/
		/****** md5 signature: 7e2af40a10394af569759ee7160a203e ******/
		%feature("compactdefaultargs") Poly_CoherentNode;
		%feature("autodoc", "
Parameters
----------
thePnt: gp_XYZ

Return
-------
None

Description
-----------
/** * Constructor. */.
") Poly_CoherentNode;
		 Poly_CoherentNode(const gp_XYZ & thePnt);

		/****** Poly_CoherentNode::AddTriangle ******/
		/****** md5 signature: a342747927755ed5b36e383e9b43f2cf ******/
		%feature("compactdefaultargs") AddTriangle;
		%feature("autodoc", "
Parameters
----------
theTri: Poly_CoherentTriangle
theA: NCollection_BaseAllocator

Return
-------
None

Description
-----------
/** * Connect a triangle to this Node. */.
") AddTriangle;
		void AddTriangle(const Poly_CoherentTriangle & theTri, const opencascade::handle<NCollection_BaseAllocator> & theA);

		/****** Poly_CoherentNode::Clear ******/
		/****** md5 signature: 12e5229aab26b2af1d6a024d75590933 ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "
Parameters
----------
&: NCollection_BaseAllocator

Return
-------
None

Description
-----------
/** * Reset the Node to void. */.
") Clear;
		void Clear(const opencascade::handle<NCollection_BaseAllocator > &);

		/****** Poly_CoherentNode::Dump ******/
		/****** md5 signature: c7b7f3310b5193de5f2365d935cd2c95 ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------

Return
-------
theStream: Standard_OStream

Description
-----------
No available documentation.
") Dump;
		void Dump(std::ostream &OutValue);

		/****** Poly_CoherentNode::GetIndex ******/
		/****** md5 signature: be68311c24420307bc05134408d2c9e3 ******/
		%feature("compactdefaultargs") GetIndex;
		%feature("autodoc", "Return
-------
int

Description
-----------
/** * Get the value of node Index. */.
") GetIndex;
		Standard_Integer GetIndex();

		/****** Poly_CoherentNode::GetNormal ******/
		/****** md5 signature: df606ba50212d9d3d862cb1144920109 ******/
		%feature("compactdefaultargs") GetNormal;
		%feature("autodoc", "Return
-------
gp_XYZ

Description
-----------
/** * Get the stored normal in the node. */.
") GetNormal;
		gp_XYZ GetNormal();

		/****** Poly_CoherentNode::GetU ******/
		/****** md5 signature: 556ee62969f53fa454ac85ee4c38c218 ******/
		%feature("compactdefaultargs") GetU;
		%feature("autodoc", "Return
-------
float

Description
-----------
/** * Get U coordinate of the Node. */.
") GetU;
		Standard_Real GetU();

		/****** Poly_CoherentNode::GetV ******/
		/****** md5 signature: d163971450f10223055714766ac9732c ******/
		%feature("compactdefaultargs") GetV;
		%feature("autodoc", "Return
-------
float

Description
-----------
/** * Get V coordinate of the Node. */.
") GetV;
		Standard_Real GetV();

		/****** Poly_CoherentNode::HasNormal ******/
		/****** md5 signature: f8f58ef06722b8ccc4ca569b238b0131 ******/
		%feature("compactdefaultargs") HasNormal;
		%feature("autodoc", "Return
-------
bool

Description
-----------
/** * Query if the Node contains a normal vector. */.
") HasNormal;
		Standard_Boolean HasNormal();

		/****** Poly_CoherentNode::IsFreeNode ******/
		/****** md5 signature: 6f86c9feae49f6018fdfa1c1cc416abc ******/
		%feature("compactdefaultargs") IsFreeNode;
		%feature("autodoc", "Return
-------
bool

Description
-----------
/** * Check if this is a free node, i.e., a node without a single * incident triangle. */.
") IsFreeNode;
		Standard_Boolean IsFreeNode();

		/****** Poly_CoherentNode::RemoveTriangle ******/
		/****** md5 signature: d1a4317c9ea5271ea94d8b07067e3352 ******/
		%feature("compactdefaultargs") RemoveTriangle;
		%feature("autodoc", "
Parameters
----------
theTri: Poly_CoherentTriangle
theA: NCollection_BaseAllocator

Return
-------
bool

Description
-----------
/** * Disconnect a triangle from this Node. */.
") RemoveTriangle;
		Standard_Boolean RemoveTriangle(const Poly_CoherentTriangle & theTri, const opencascade::handle<NCollection_BaseAllocator> & theA);

		/****** Poly_CoherentNode::SetIndex ******/
		/****** md5 signature: 4df39428d5163adcf3df08fcfadd7b59 ******/
		%feature("compactdefaultargs") SetIndex;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
None

Description
-----------
/** * Set the value of node Index. */.
") SetIndex;
		void SetIndex(const Standard_Integer theIndex);

		/****** Poly_CoherentNode::SetNormal ******/
		/****** md5 signature: 42571b60712fece320abefbb371dd328 ******/
		%feature("compactdefaultargs") SetNormal;
		%feature("autodoc", "
Parameters
----------
theVector: gp_XYZ

Return
-------
None

Description
-----------
/** * Define the normal vector in the Node. */.
") SetNormal;
		void SetNormal(const gp_XYZ & theVector);

		/****** Poly_CoherentNode::SetUV ******/
		/****** md5 signature: ff179e70ed852320501bdbec48546cca ******/
		%feature("compactdefaultargs") SetUV;
		%feature("autodoc", "
Parameters
----------
theU: float
theV: float

Return
-------
None

Description
-----------
/** * Set the UV coordinates of the Node. */.
") SetUV;
		void SetUV(const Standard_Real theU, const Standard_Real theV);

		/****** Poly_CoherentNode::TriangleIterator ******/
		/****** md5 signature: abb21a0bc72481ca955b0d303e2f72d2 ******/
		%feature("compactdefaultargs") TriangleIterator;
		%feature("autodoc", "Return
-------
Poly_CoherentTriPtr::Iterator

Description
-----------
/** * Create an iterator of incident triangles. */.
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
		/****** Poly_CoherentTriangle::Poly_CoherentTriangle ******/
		/****** md5 signature: 9446cdddb4a57c633081505b863c20fd ******/
		%feature("compactdefaultargs") Poly_CoherentTriangle;
		%feature("autodoc", "Return
-------
None

Description
-----------
/** * Empty constructor. */.
") Poly_CoherentTriangle;
		 Poly_CoherentTriangle();

		/****** Poly_CoherentTriangle::Poly_CoherentTriangle ******/
		/****** md5 signature: 8535db5fe78046824ff6fba22e657613 ******/
		%feature("compactdefaultargs") Poly_CoherentTriangle;
		%feature("autodoc", "
Parameters
----------
iNode0: int
iNode1: int
iNode2: int

Return
-------
None

Description
-----------
/** * Constructor. */.
") Poly_CoherentTriangle;
		 Poly_CoherentTriangle(const Standard_Integer iNode0, const Standard_Integer iNode1, const Standard_Integer iNode2);

		/****** Poly_CoherentTriangle::FindConnection ******/
		/****** md5 signature: 505623f75ec36da5e1eb5d1c4b345491 ******/
		%feature("compactdefaultargs") FindConnection;
		%feature("autodoc", "
Parameters
----------
&: Poly_CoherentTriangle

Return
-------
int

Description
-----------
/** * Returns the index of the connection with the given triangle, or -1 if not found. */.
") FindConnection;
		Standard_Integer FindConnection(const Poly_CoherentTriangle &);

		/****** Poly_CoherentTriangle::GetConnectedNode ******/
		/****** md5 signature: db18ee0663392691dff091840d705211 ******/
		%feature("compactdefaultargs") GetConnectedNode;
		%feature("autodoc", "
Parameters
----------
iConn: int

Return
-------
int

Description
-----------
/** * Query the connected node on the given side. * Returns -1 if there is no connection on the specified side. */.
") GetConnectedNode;
		Standard_Integer GetConnectedNode(const Standard_Integer iConn);

		/****** Poly_CoherentTriangle::GetConnectedTri ******/
		/****** md5 signature: a594865824d29f8efc10c28f93cb6719 ******/
		%feature("compactdefaultargs") GetConnectedTri;
		%feature("autodoc", "
Parameters
----------
iConn: int

Return
-------
Poly_CoherentTriangle *

Description
-----------
/** * Query the connected triangle on the given side. * Returns NULL if there is no connection on the specified side. */.
") GetConnectedTri;
		const Poly_CoherentTriangle * GetConnectedTri(const Standard_Integer iConn);

		/****** Poly_CoherentTriangle::GetLink ******/
		/****** md5 signature: 3147cabde40a5b5c4a6566469e78c1af ******/
		%feature("compactdefaultargs") GetLink;
		%feature("autodoc", "
Parameters
----------
iLink: int

Return
-------
Poly_CoherentLink *

Description
-----------
/** * Query the Link associate with the given side of the Triangle. * May return NULL if there are no links in the triangulation. */.
") GetLink;
		const Poly_CoherentLink * GetLink(const Standard_Integer iLink);

		/****** Poly_CoherentTriangle::IsEmpty ******/
		/****** md5 signature: e0fa1d0f35a1c4ad702e4e993780ae41 ******/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Return
-------
bool

Description
-----------
/** * Query if this is a valid triangle. */.
") IsEmpty;
		Standard_Boolean IsEmpty();

		/****** Poly_CoherentTriangle::NConnections ******/
		/****** md5 signature: 7c08f0ab362e6158b745da0f9b271c9e ******/
		%feature("compactdefaultargs") NConnections;
		%feature("autodoc", "Return
-------
int

Description
-----------
/** * Query the number of connected triangles. */.
") NConnections;
		Standard_Integer NConnections();

		/****** Poly_CoherentTriangle::Node ******/
		/****** md5 signature: 0c8b3e4d6b02b354a59bbdabd461f25e ******/
		%feature("compactdefaultargs") Node;
		%feature("autodoc", "
Parameters
----------
ind: int

Return
-------
int

Description
-----------
/** * Query the node index in the position given by the parameter 'ind' */.
") Node;
		Standard_Integer Node(const Standard_Integer ind);

		/****** Poly_CoherentTriangle::RemoveConnection ******/
		/****** md5 signature: f5aebaf1db860838366c89c8ceeceb3f ******/
		%feature("compactdefaultargs") RemoveConnection;
		%feature("autodoc", "
Parameters
----------
iConn: int

Return
-------
None

Description
-----------
/** * Remove the connection with the given index. * 
Parameter iConn * Can be 0, 1 or 2 - index of the node that is opposite to the connection * (shared link). */.
") RemoveConnection;
		void RemoveConnection(const Standard_Integer iConn);

		/****** Poly_CoherentTriangle::RemoveConnection ******/
		/****** md5 signature: 53930c44b0711688627163ac9483ac87 ******/
		%feature("compactdefaultargs") RemoveConnection;
		%feature("autodoc", "
Parameters
----------
theTri: Poly_CoherentTriangle

Return
-------
bool

Description
-----------
/** * Remove the connection with the given Triangle. * 
Return: * True if successfuol or False if the connection has not been found. */.
") RemoveConnection;
		Standard_Boolean RemoveConnection(Poly_CoherentTriangle & theTri);

		/****** Poly_CoherentTriangle::SetConnection ******/
		/****** md5 signature: a0b2140ca6f1d80d7f8a3e55163906d6 ******/
		%feature("compactdefaultargs") SetConnection;
		%feature("autodoc", "
Parameters
----------
iConn: int
theTr: Poly_CoherentTriangle

Return
-------
bool

Description
-----------
/** * Create connection with another triangle theTri. * This method creates both connections: in this triangle and in theTri. You * do not need to call the same method on triangle theTr. * 
Parameter iConn * Can be 0, 1 or 2 - index of the node that is opposite to the connection * (shared link). * 
Parameter theTr * Triangle that is connected on the given link. * 
Return: * True if successful, False if the connection is rejected * due to improper topology. */.
") SetConnection;
		Standard_Boolean SetConnection(const Standard_Integer iConn, Poly_CoherentTriangle & theTr);

		/****** Poly_CoherentTriangle::SetConnection ******/
		/****** md5 signature: a1d2b4791de1c59c255b11dd301760e2 ******/
		%feature("compactdefaultargs") SetConnection;
		%feature("autodoc", "
Parameters
----------
theTri: Poly_CoherentTriangle

Return
-------
bool

Description
-----------
/** * Create connection with another triangle theTri. * This method creates both connections: in this triangle and in theTri. * This method is slower than the previous one, because it makes analysis * what sides of both triangles are connected. * 
Parameter theTri * Triangle that is connected. * 
Return: * True if successful, False if the connection is rejected * due to improper topology. */.
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
class Poly_CoherentTriangulation : public Standard_Transient {
	public:
		class IteratorOfTriangle {};
		class IteratorOfNode {};
		class IteratorOfLink {};
		class TwoIntegers {};
		/****** Poly_CoherentTriangulation::Poly_CoherentTriangulation ******/
		/****** md5 signature: c4f8c7b71e7718a463574a09b41b644a ******/
		%feature("compactdefaultargs") Poly_CoherentTriangulation;
		%feature("autodoc", "
Parameters
----------
theAlloc: NCollection_BaseAllocator (optional, default to 0)

Return
-------
None

Description
-----------
/** * Empty constructor. */.
") Poly_CoherentTriangulation;
		 Poly_CoherentTriangulation(const opencascade::handle<NCollection_BaseAllocator> & theAlloc = 0L);

		/****** Poly_CoherentTriangulation::Poly_CoherentTriangulation ******/
		/****** md5 signature: 163ea72de00c929c63a8b49de2b51bd6 ******/
		%feature("compactdefaultargs") Poly_CoherentTriangulation;
		%feature("autodoc", "
Parameters
----------
theTriangulation: Poly_Triangulation
theAlloc: NCollection_BaseAllocator (optional, default to 0)

Return
-------
None

Description
-----------
/** * Constructor. It does not create Links, you should call ComputeLinks * following this constructor if you need these links. */.
") Poly_CoherentTriangulation;
		 Poly_CoherentTriangulation(const opencascade::handle<Poly_Triangulation> & theTriangulation, const opencascade::handle<NCollection_BaseAllocator> & theAlloc = 0L);

		/****** Poly_CoherentTriangulation::AddLink ******/
		/****** md5 signature: d15291b77b4fd10067451e2e179eba6d ******/
		%feature("compactdefaultargs") AddLink;
		%feature("autodoc", "
Parameters
----------
theTri: Poly_CoherentTriangle
theConn: int

Return
-------
Poly_CoherentLink *

Description
-----------
/** * Add a single link to triangulation, based on a triangle and its side index. * This method does not check for coincidence with already present links. * 
Parameter theTri * Triangle that contains the link to be added. * 
Parameter theConn * Index of the side (i.e., 0, 1 0r 2) defining the added link. */.
") AddLink;
		Poly_CoherentLink * AddLink(const Poly_CoherentTriangle & theTri, const Standard_Integer theConn);

		/****** Poly_CoherentTriangulation::AddTriangle ******/
		/****** md5 signature: 4ee00860fab587752ebb033c949a0805 ******/
		%feature("compactdefaultargs") AddTriangle;
		%feature("autodoc", "
Parameters
----------
iNode0: int
iNode1: int
iNode2: int

Return
-------
Poly_CoherentTriangle *

Description
-----------
/** * Add a triangle to the triangulation. * 
Return: * Pointer to the added triangle instance or NULL if an error occurred. */.
") AddTriangle;
		Poly_CoherentTriangle * AddTriangle(const Standard_Integer iNode0, const Standard_Integer iNode1, const Standard_Integer iNode2);

		/****** Poly_CoherentTriangulation::Allocator ******/
		/****** md5 signature: 75ac096a2dab7bdb7c5e825729dee2e1 ******/
		%feature("compactdefaultargs") Allocator;
		%feature("autodoc", "Return
-------
opencascade::handle<NCollection_BaseAllocator>

Description
-----------
/** * Query the allocator of elements, this allocator can be used for other * objects */.
") Allocator;
		const opencascade::handle<NCollection_BaseAllocator> & Allocator();

		/****** Poly_CoherentTriangulation::ChangeNode ******/
		/****** md5 signature: 151174f85490aa769fc4611977a376db ******/
		%feature("compactdefaultargs") ChangeNode;
		%feature("autodoc", "
Parameters
----------
i: int

Return
-------
Poly_CoherentNode

Description
-----------
/** * Get the node at the given index 'i'. */.
") ChangeNode;
		Poly_CoherentNode & ChangeNode(const Standard_Integer i);

		/****** Poly_CoherentTriangulation::ClearLinks ******/
		/****** md5 signature: deb79b52e99dd6fb167aeaa98b663164 ******/
		%feature("compactdefaultargs") ClearLinks;
		%feature("autodoc", "Return
-------
None

Description
-----------
/** * Clear all Links data from the Triangulation data. */.
") ClearLinks;
		void ClearLinks();

		/****** Poly_CoherentTriangulation::Clone ******/
		/****** md5 signature: c13bdc787280002fbcafef9414d7e89f ******/
		%feature("compactdefaultargs") Clone;
		%feature("autodoc", "
Parameters
----------
theAlloc: NCollection_BaseAllocator

Return
-------
opencascade::handle<Poly_CoherentTriangulation>

Description
-----------
/** * Create a copy of this Triangulation, using the given allocator. */.
") Clone;
		opencascade::handle<Poly_CoherentTriangulation> Clone(const opencascade::handle<NCollection_BaseAllocator> & theAlloc);

		/****** Poly_CoherentTriangulation::ComputeLinks ******/
		/****** md5 signature: cfcca9f4ed297fab112e76aea687016c ******/
		%feature("compactdefaultargs") ComputeLinks;
		%feature("autodoc", "Return
-------
int

Description
-----------
/** * (Re)Calculate all links in this Triangulation. */.
") ComputeLinks;
		Standard_Integer ComputeLinks();

		/****** Poly_CoherentTriangulation::Deflection ******/
		/****** md5 signature: bd8a78210f29f60909df1d27a05e2f6b ******/
		%feature("compactdefaultargs") Deflection;
		%feature("autodoc", "Return
-------
float

Description
-----------
/** * Query the Deflection parameter (default value 0. -- if never initialized) */.
") Deflection;
		Standard_Real Deflection();

		/****** Poly_CoherentTriangulation::Dump ******/
		/****** md5 signature: 67deed0701458c3d54847bd8f3e44642 ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------

Return
-------
&: Standard_OStream

Description
-----------
/** * Debugging output. */.
") Dump;
		void Dump(std::ostream &OutValue);

		/****** Poly_CoherentTriangulation::FindTriangle ******/
		/****** md5 signature: 0bd57b9c3b2e3b0b46985d4808a94564 ******/
		%feature("compactdefaultargs") FindTriangle;
		%feature("autodoc", "
Parameters
----------
theLink: Poly_CoherentLink
pTri: Poly_CoherentTriangle *

Return
-------
bool

Description
-----------
/** * Find one or two triangles that share the given couple of nodes. * 
Parameter theLink * Link (in fact, just a couple of nodes) on which the triangle is * searched. * 
Parameter pTri * <tt>[out]</tt> Array of two pointers to triangle. pTri[0] stores the * triangle to the left of the link, while pTri[1] stores the one to the * right of the link. * 
Return: * True if at least one triangle is found and output as pTri. */.
") FindTriangle;
		Standard_Boolean FindTriangle(const Poly_CoherentLink & theLink, const Poly_CoherentTriangle * pTri[2]);

		/****** Poly_CoherentTriangulation::GetFreeNodes ******/
		/****** md5 signature: 9bcc6a5083222ab25ada3d13987af9be ******/
		%feature("compactdefaultargs") GetFreeNodes;
		%feature("autodoc", "
Parameters
----------
lstNodes: NCollection_List<int>

Return
-------
bool

Description
-----------
/** * Create a list of free nodes. These nodes may appear as a result of any * custom mesh decimation or RemoveDegenerated() call. This analysis is * necessary if you support additional data structures based on the * triangulation (e.g., edges on the surface boundary). * 
Parameter lstNodes * <tt>[out]</tt> List that receives the indices of free nodes. */.
") GetFreeNodes;
		Standard_Boolean GetFreeNodes(NCollection_List<Standard_Integer> & lstNodes);

		/****** Poly_CoherentTriangulation::GetTriangulation ******/
		/****** md5 signature: 43bd327b5645ba0da5653a0bd81a9f5b ******/
		%feature("compactdefaultargs") GetTriangulation;
		%feature("autodoc", "Return
-------
opencascade::handle<Poly_Triangulation>

Description
-----------
/** * Create an instance of Poly_Triangulation from this object. */.
") GetTriangulation;
		opencascade::handle<Poly_Triangulation> GetTriangulation();

		/****** Poly_CoherentTriangulation::MaxNode ******/
		/****** md5 signature: affccc346b5a1303fde57c0411a6ba93 ******/
		%feature("compactdefaultargs") MaxNode;
		%feature("autodoc", "Return
-------
int

Description
-----------
/** * Query the index of the last node in the triangulation */.
") MaxNode;
		Standard_Integer MaxNode();

		/****** Poly_CoherentTriangulation::MaxTriangle ******/
		/****** md5 signature: 57326ba966f4711c1c7fa3d6bf7fbcdb ******/
		%feature("compactdefaultargs") MaxTriangle;
		%feature("autodoc", "Return
-------
int

Description
-----------
/** * Query the index of the last triangle in the triangulation */.
") MaxTriangle;
		Standard_Integer MaxTriangle();

		/****** Poly_CoherentTriangulation::NLinks ******/
		/****** md5 signature: 8d724a43cd997034232e3dd34ce723bd ******/
		%feature("compactdefaultargs") NLinks;
		%feature("autodoc", "Return
-------
int

Description
-----------
/** * Query the total number of active Links. */.
") NLinks;
		Standard_Integer NLinks();

		/****** Poly_CoherentTriangulation::NNodes ******/
		/****** md5 signature: 688a21a995915d4deb299349bac84212 ******/
		%feature("compactdefaultargs") NNodes;
		%feature("autodoc", "Return
-------
int

Description
-----------
/** * Query the total number of active nodes (i.e. nodes used by 1 or more * triangles) */.
") NNodes;
		Standard_Integer NNodes();

		/****** Poly_CoherentTriangulation::NTriangles ******/
		/****** md5 signature: 0daeacc33061dccf0b610feae7985f1e ******/
		%feature("compactdefaultargs") NTriangles;
		%feature("autodoc", "Return
-------
int

Description
-----------
/** * Query the total number of active triangles (i.e. triangles that refer * nodes, non-empty ones) */.
") NTriangles;
		Standard_Integer NTriangles();

		/****** Poly_CoherentTriangulation::Node ******/
		/****** md5 signature: 94b6af8f631482df51fce41def1736a5 ******/
		%feature("compactdefaultargs") Node;
		%feature("autodoc", "
Parameters
----------
i: int

Return
-------
Poly_CoherentNode

Description
-----------
/** * Get the node at the given index 'i'. */.
") Node;
		const Poly_CoherentNode & Node(const Standard_Integer i);

		/****** Poly_CoherentTriangulation::RemoveDegenerated ******/
		/****** md5 signature: 94aff1ee43dae768e7ec11e72b3725ff ******/
		%feature("compactdefaultargs") RemoveDegenerated;
		%feature("autodoc", "
Parameters
----------
theTol: float
pLstRemovedNode: NCollection_List<TwoIntegers> * (optional, default to 0)

Return
-------
bool

Description
-----------
/** * Find and remove degenerated triangles in Triangulation. * 
Parameter theTol * Tolerance for the degeneration case. If any two nodes of a triangle have * the distance less than this tolerance, this triangle is considered * degenerated and therefore removed by this method. * 
Parameter pLstRemovedNode * Optional parameter. If defined, then it will receive the list of arrays * where the first number is the index of removed node and the second - * the index of remaining node to which the mesh was reconnected. */.
") RemoveDegenerated;
		Standard_Boolean RemoveDegenerated(const Standard_Real theTol, NCollection_List<TwoIntegers> * pLstRemovedNode = 0L);

		/****** Poly_CoherentTriangulation::RemoveLink ******/
		/****** md5 signature: 7288b4225a28089451844f087cbc85cb ******/
		%feature("compactdefaultargs") RemoveLink;
		%feature("autodoc", "
Parameters
----------
theLink: Poly_CoherentLink

Return
-------
None

Description
-----------
/** * Removal of a single link from the triangulation. */.
") RemoveLink;
		void RemoveLink(Poly_CoherentLink & theLink);

		/****** Poly_CoherentTriangulation::RemoveTriangle ******/
		/****** md5 signature: 77399395cd178d45800a915f5a168db1 ******/
		%feature("compactdefaultargs") RemoveTriangle;
		%feature("autodoc", "
Parameters
----------
theTr: Poly_CoherentTriangle

Return
-------
bool

Description
-----------
/** * Removal of a single triangle from the triangulation. */.
") RemoveTriangle;
		Standard_Boolean RemoveTriangle(Poly_CoherentTriangle & theTr);

		/****** Poly_CoherentTriangulation::ReplaceNodes ******/
		/****** md5 signature: 51008505dd378758ffcdf7480f20397b ******/
		%feature("compactdefaultargs") ReplaceNodes;
		%feature("autodoc", "
Parameters
----------
theTriangle: Poly_CoherentTriangle
iNode0: int
iNode1: int
iNode2: int

Return
-------
bool

Description
-----------
/** * Replace nodes in the given triangle. * 
Return: * True if operation succeeded. */.
") ReplaceNodes;
		Standard_Boolean ReplaceNodes(Poly_CoherentTriangle & theTriangle, const Standard_Integer iNode0, const Standard_Integer iNode1, const Standard_Integer iNode2);

		/****** Poly_CoherentTriangulation::SetDeflection ******/
		/****** md5 signature: 68b68d2c6b675b38dad6580b38e01fa8 ******/
		%feature("compactdefaultargs") SetDeflection;
		%feature("autodoc", "
Parameters
----------
theDefl: float

Return
-------
None

Description
-----------
/** * Set the Deflection value as the parameter of the given triangulation. */.
") SetDeflection;
		void SetDeflection(const Standard_Real theDefl);

		/****** Poly_CoherentTriangulation::SetNode ******/
		/****** md5 signature: 93bc79731c24b10de141ddc37f49b2cf ******/
		%feature("compactdefaultargs") SetNode;
		%feature("autodoc", "
Parameters
----------
thePnt: gp_XYZ
iN: int (optional, default to -1)

Return
-------
int

Description
-----------
/** * Initialize a node * 
Parameter thePoint * 3D Coordinates of the node. * 
Parameter iN * Index of the node. If negative (default), the node is added to the * end of the current array of nodes. * 
Return: * Index of the added node. */.
") SetNode;
		Standard_Integer SetNode(const gp_XYZ & thePnt, const Standard_Integer iN = -1);

		/****** Poly_CoherentTriangulation::Triangle ******/
		/****** md5 signature: 97a5e63995d0f5000f482b5a30d85401 ******/
		%feature("compactdefaultargs") Triangle;
		%feature("autodoc", "
Parameters
----------
i: int

Return
-------
Poly_CoherentTriangle

Description
-----------
/** * Get the triangle at the given index 'i'. */.
") Triangle;
		const Poly_CoherentTriangle & Triangle(const Standard_Integer i);

};


%make_alias(Poly_CoherentTriangulation)

%extend Poly_CoherentTriangulation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************
* class Poly_Connect *
*********************/
class Poly_Connect {
	public:
		/****** Poly_Connect::Poly_Connect ******/
		/****** md5 signature: 4858952e2e888663b625612d1cf23291 ******/
		%feature("compactdefaultargs") Poly_Connect;
		%feature("autodoc", "Return
-------
None

Description
-----------
Constructs an uninitialized algorithm.
") Poly_Connect;
		 Poly_Connect();

		/****** Poly_Connect::Poly_Connect ******/
		/****** md5 signature: 4eb6cc0957a90b6d58996c53fea15fc5 ******/
		%feature("compactdefaultargs") Poly_Connect;
		%feature("autodoc", "
Parameters
----------
theTriangulation: Poly_Triangulation

Return
-------
None

Description
-----------
Constructs an algorithm to explore the adjacency data of nodes or triangles for the triangulation T.
") Poly_Connect;
		 Poly_Connect(const opencascade::handle<Poly_Triangulation> & theTriangulation);

		/****** Poly_Connect::Initialize ******/
		/****** md5 signature: 6f8df921119c4a0c799d7d72700b20c6 ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
None

Description
-----------
Initializes an iterator to search for all the triangles containing the node referenced at index N in the nodes table, for the triangulation analyzed by this tool. The iterator is managed by the following functions: - More, which checks if there are still elements in the iterator - Next, which positions the iterator on the next element - Value, which returns the current element. The use of such an iterator provides direct access to the triangles around a particular node, i.e. it avoids iterating on all the component triangles of a triangulation. Example Poly_Connect C(Tr); for (C.Initialize(n1);C.More();C.Next()) { t = C.Value(); }.
") Initialize;
		void Initialize(const Standard_Integer N);

		/****** Poly_Connect::Load ******/
		/****** md5 signature: c900fdea745abf63070ebdf0f0a3e891 ******/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "
Parameters
----------
theTriangulation: Poly_Triangulation

Return
-------
None

Description
-----------
Initialize the algorithm to explore the adjacency data of nodes or triangles for the triangulation theTriangulation.
") Load;
		void Load(const opencascade::handle<Poly_Triangulation> & theTriangulation);

		/****** Poly_Connect::More ******/
		/****** md5 signature: cff271d3b32940da94bada40648f9096 ******/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if there is another element in the iterator defined with the function Initialize (i.e. if there is another triangle containing the given node).
") More;
		Standard_Boolean More();

		/****** Poly_Connect::Next ******/
		/****** md5 signature: f35c0df5f1d7c877986db18081404532 ******/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Return
-------
None

Description
-----------
Advances the iterator defined with the function Initialize to access the next triangle. Note: There is no action if the iterator is empty (i.e. if the function More returns false).-.
") Next;
		void Next();

		/****** Poly_Connect::Nodes ******/
		/****** md5 signature: b9bb3c65b024b1d8b094aa12cf07fc4e ******/
		%feature("compactdefaultargs") Nodes;
		%feature("autodoc", "
Parameters
----------
T: int

Return
-------
n1: int
n2: int
n3: int

Description
-----------
Returns, in n1, n2 and n3, the indices of the 3 nodes adjacent to the triangle referenced at index T in the triangles table specific to the triangulation analyzed by this tool. Warning Null indices are returned when there are fewer than 3 adjacent nodes.
") Nodes;
		void Nodes(const Standard_Integer T, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****** Poly_Connect::Triangle ******/
		/****** md5 signature: c5a10e9fa89662a218d195aa7e1d77d9 ******/
		%feature("compactdefaultargs") Triangle;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
int

Description
-----------
Returns the index of a triangle containing the node at index N in the nodes table specific to the triangulation analyzed by this tool.
") Triangle;
		Standard_Integer Triangle(const Standard_Integer N);

		/****** Poly_Connect::Triangles ******/
		/****** md5 signature: 3d1f5f78ef9f1e155ddb82f445db6470 ******/
		%feature("compactdefaultargs") Triangles;
		%feature("autodoc", "
Parameters
----------
T: int

Return
-------
t1: int
t2: int
t3: int

Description
-----------
Returns in t1, t2 and t3, the indices of the 3 triangles adjacent to the triangle at index T in the triangles table specific to the triangulation analyzed by this tool. Warning Null indices are returned when there are fewer than 3 adjacent triangles.
") Triangles;
		void Triangles(const Standard_Integer T, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****** Poly_Connect::Triangulation ******/
		/****** md5 signature: 640157cb50c1198f3e4d8cfb1696811e ******/
		%feature("compactdefaultargs") Triangulation;
		%feature("autodoc", "Return
-------
opencascade::handle<Poly_Triangulation>

Description
-----------
Returns the triangulation analyzed by this tool.
") Triangulation;
		const opencascade::handle<Poly_Triangulation> & Triangulation();

		/****** Poly_Connect::Value ******/
		/****** md5 signature: 0152a8596198c54f2b940c881f570bf0 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the index of the current triangle to which the iterator, defined with the function Initialize, points. This is an index in the triangles table specific to the triangulation analyzed by this tool.
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
		/****** Poly_MergeNodesTool::Poly_MergeNodesTool ******/
		/****** md5 signature: 3a7388c9049734e002b68e6950dd289b ******/
		%feature("compactdefaultargs") Poly_MergeNodesTool;
		%feature("autodoc", "
Parameters
----------
theSmoothAngle: double
theMergeTolerance: double (optional, default to 0.0)
theNbFacets: int (optional, default to -1)

Return
-------
None

Description
-----------
Constructor 
Input parameter: theSmoothAngle smooth angle in radians or 0.0 to disable merging by angle 
Input parameter: theMergeTolerance node merging maximum distance 
Input parameter: theNbFacets estimated number of facets for map preallocation.
") Poly_MergeNodesTool;
		 Poly_MergeNodesTool(const double theSmoothAngle, const double theMergeTolerance = 0.0, const int theNbFacets = -1);

		/****** Poly_MergeNodesTool::AddElement ******/
		/****** md5 signature: f54449798b8c250c1939c2e71ad619e9 ******/
		%feature("compactdefaultargs") AddElement;
		%feature("autodoc", "
Parameters
----------
theElemNodes: gp_XYZ *
theNbNodes: int

Return
-------
None

Description
-----------
Add new triangle or quad. 
Input parameter: theElemNodes element nodes 
Input parameter: theNbNodes number of element nodes, should be 3 or 4.
") AddElement;
		void AddElement(const gp_XYZ * theElemNodes, int theNbNodes);

		/****** Poly_MergeNodesTool::AddQuad ******/
		/****** md5 signature: 466ec42f2ca8a5fa29a362ea7d89be15 ******/
		%feature("compactdefaultargs") AddQuad;
		%feature("autodoc", "
Parameters
----------
theElemNodes: gp_XYZ

Return
-------
None

Description
-----------
Add new quad. 
Input parameter: theElemNodes 4 element nodes.
") AddQuad;
		void AddQuad(const gp_XYZ theElemNodes[4]);

		/****** Poly_MergeNodesTool::AddTriangle ******/
		/****** md5 signature: 3f99f4658880f383d17505464542edaf ******/
		%feature("compactdefaultargs") AddTriangle;
		%feature("autodoc", "
Parameters
----------
theElemNodes: gp_XYZ

Return
-------
None

Description
-----------
Add new triangle. 
Input parameter: theElemNodes 3 element nodes.
") AddTriangle;
		void AddTriangle(const gp_XYZ theElemNodes[3]);

		/****** Poly_MergeNodesTool::AddTriangulation ******/
		/****** md5 signature: bc6056f0ba55a334b398b898dd60cb25 ******/
		%feature("compactdefaultargs") AddTriangulation;
		%feature("autodoc", "
Parameters
----------
theTris: Poly_Triangulation
theTrsf: gp_Trsf (optional, default to gp_Trsf())
theToReverse: bool (optional, default to false)

Return
-------
None

Description
-----------
Add another triangulation to created one. 
Input parameter: theTris triangulation to add 
Input parameter: theTrsf transformation to apply 
Input parameter: theToReverse reverse triangle nodes order.
") AddTriangulation;
		virtual void AddTriangulation(const opencascade::handle<Poly_Triangulation> & theTris, const gp_Trsf & theTrsf = gp_Trsf(), const Standard_Boolean theToReverse = false);

		/****** Poly_MergeNodesTool::ChangeElementNode ******/
		/****** md5 signature: cfa2b9d654017414261980230af66908 ******/
		%feature("compactdefaultargs") ChangeElementNode;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
gp_XYZ

Description
-----------
Change node coordinates of element to be pushed. 
Input parameter: theIndex node index within current element, in 0..3 range.
") ChangeElementNode;
		gp_XYZ ChangeElementNode(int theIndex);

		/****** Poly_MergeNodesTool::ChangeOutput ******/
		/****** md5 signature: a9dc71f3c110b2a16acbd54cfd1bfeaa ******/
		%feature("compactdefaultargs") ChangeOutput;
		%feature("autodoc", "Return
-------
opencascade::handle<Poly_Triangulation>

Description
-----------
Setup output triangulation for modifications. When set to NULL, the tool could be used as a merge map for filling in external mesh structure.
") ChangeOutput;
		opencascade::handle<Poly_Triangulation> & ChangeOutput();

		/****** Poly_MergeNodesTool::ElementNodeIndex ******/
		/****** md5 signature: b3912f8ed8ba96458bb5fe8222b9db8a ******/
		%feature("compactdefaultargs") ElementNodeIndex;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
int

Description
-----------
Return current element node index defined by PushLastElement().
") ElementNodeIndex;
		Standard_Integer ElementNodeIndex(int theIndex);

		/****** Poly_MergeNodesTool::MergeAngle ******/
		/****** md5 signature: 5d00926a7bd3e498cdc5a4c2a8db704c ******/
		%feature("compactdefaultargs") MergeAngle;
		%feature("autodoc", "Return
-------
double

Description
-----------
Return merge angle in radians; 0.0 by default (normals with non-exact directions are not merged).
") MergeAngle;
		double MergeAngle();

		/****** Poly_MergeNodesTool::MergeNodes ******/
		/****** md5 signature: 69db4be2948df2cb0f73011b0524e17b ******/
		%feature("compactdefaultargs") MergeNodes;
		%feature("autodoc", "
Parameters
----------
theTris: Poly_Triangulation
theTrsf: gp_Trsf
theToReverse: bool
theSmoothAngle: double
theMergeTolerance: double (optional, default to 0.0)
theToForce: bool (optional, default to true)

Return
-------
opencascade::handle<Poly_Triangulation>

Description
-----------
Merge nodes of existing mesh and return the new mesh. 
Input parameter: theTris triangulation to add 
Input parameter: theTrsf transformation to apply 
Input parameter: theToReverse reverse triangle nodes order 
Input parameter: theSmoothAngle merge angle in radians 
Input parameter: theMergeTolerance linear merge tolerance 
Input parameter: theToForce return merged triangulation even if it's statistics is equal to input one 
Return: merged triangulation or NULL on no result.
") MergeNodes;
		static opencascade::handle<Poly_Triangulation> MergeNodes(const opencascade::handle<Poly_Triangulation> & theTris, const gp_Trsf & theTrsf, const Standard_Boolean theToReverse, const double theSmoothAngle, const double theMergeTolerance = 0.0, const bool theToForce = true);

		/****** Poly_MergeNodesTool::MergeTolerance ******/
		/****** md5 signature: fa6eb2c52a4c2b1d74d587a33cf643e6 ******/
		%feature("compactdefaultargs") MergeTolerance;
		%feature("autodoc", "Return
-------
double

Description
-----------
Return merge tolerance; 0.0 by default (only 3D points with exactly matching coordinates are merged).
") MergeTolerance;
		double MergeTolerance();

		/****** Poly_MergeNodesTool::NbDegenerativeElems ******/
		/****** md5 signature: f7c1a94fbb555c490c2bfa3343d230dd ******/
		%feature("compactdefaultargs") NbDegenerativeElems;
		%feature("autodoc", "Return
-------
int

Description
-----------
Return number of discarded degenerate elements.
") NbDegenerativeElems;
		int NbDegenerativeElems();

		/****** Poly_MergeNodesTool::NbElements ******/
		/****** md5 signature: a3bde70b76cbd01fd87444d7af358185 ******/
		%feature("compactdefaultargs") NbElements;
		%feature("autodoc", "Return
-------
int

Description
-----------
Return number of elements.
") NbElements;
		int NbElements();

		/****** Poly_MergeNodesTool::NbMergedElems ******/
		/****** md5 signature: ecd75b52f11a73bd5b6b9dd1889271df ******/
		%feature("compactdefaultargs") NbMergedElems;
		%feature("autodoc", "Return
-------
int

Description
-----------
Return number of merged equal elements.
") NbMergedElems;
		int NbMergedElems();

		/****** Poly_MergeNodesTool::NbNodes ******/
		/****** md5 signature: d40157e610feffebe18aa0d56c09a4f4 ******/
		%feature("compactdefaultargs") NbNodes;
		%feature("autodoc", "Return
-------
int

Description
-----------
Return number of nodes.
") NbNodes;
		int NbNodes();

		/****** Poly_MergeNodesTool::PushLastElement ******/
		/****** md5 signature: 277d833a2ade233d612ac9bbb60ac6d1 ******/
		%feature("compactdefaultargs") PushLastElement;
		%feature("autodoc", "
Parameters
----------
theNbNodes: int

Return
-------
None

Description
-----------
Add new triangle or quad with nodes specified by ChangeElementNode().
") PushLastElement;
		void PushLastElement(int theNbNodes);

		/****** Poly_MergeNodesTool::PushLastQuad ******/
		/****** md5 signature: 1cfa8ee32054107dba52c4d795b9c6bb ******/
		%feature("compactdefaultargs") PushLastQuad;
		%feature("autodoc", "Return
-------
None

Description
-----------
Add new quad with nodes specified by ChangeElementNode().
") PushLastQuad;
		void PushLastQuad();

		/****** Poly_MergeNodesTool::PushLastTriangle ******/
		/****** md5 signature: ae8c69e28e2e9bd5ae3ca8a822d92073 ******/
		%feature("compactdefaultargs") PushLastTriangle;
		%feature("autodoc", "Return
-------
None

Description
-----------
Add new triangle with nodes specified by ChangeElementNode().
") PushLastTriangle;
		void PushLastTriangle();

		/****** Poly_MergeNodesTool::Result ******/
		/****** md5 signature: 8f645f11f5d462565ca5df82c5facbc2 ******/
		%feature("compactdefaultargs") Result;
		%feature("autodoc", "Return
-------
opencascade::handle<Poly_Triangulation>

Description
-----------
Prepare and return result triangulation (temporary data will be truncated to result size).
") Result;
		opencascade::handle<Poly_Triangulation> Result();

		/****** Poly_MergeNodesTool::SetDropDegenerative ******/
		/****** md5 signature: 2afb3f12bc4617f94254843e80b1098c ******/
		%feature("compactdefaultargs") SetDropDegenerative;
		%feature("autodoc", "
Parameters
----------
theToDrop: bool

Return
-------
None

Description
-----------
Set if degenerate elements should be discarded.
") SetDropDegenerative;
		void SetDropDegenerative(bool theToDrop);

		/****** Poly_MergeNodesTool::SetMergeAngle ******/
		/****** md5 signature: 87c2aaa1acaed6770f3402745832717c ******/
		%feature("compactdefaultargs") SetMergeAngle;
		%feature("autodoc", "
Parameters
----------
theAngleRad: double

Return
-------
None

Description
-----------
Set merge angle.
") SetMergeAngle;
		void SetMergeAngle(double theAngleRad);

		/****** Poly_MergeNodesTool::SetMergeElems ******/
		/****** md5 signature: ed329276ee91b65e45badb01dc0e8260 ******/
		%feature("compactdefaultargs") SetMergeElems;
		%feature("autodoc", "
Parameters
----------
theToMerge: bool

Return
-------
None

Description
-----------
Set if equal elements should be filtered.
") SetMergeElems;
		void SetMergeElems(bool theToMerge);

		/****** Poly_MergeNodesTool::SetMergeOpposite ******/
		/****** md5 signature: 4e4c753314be161d9f17adb6eee772b4 ******/
		%feature("compactdefaultargs") SetMergeOpposite;
		%feature("autodoc", "
Parameters
----------
theToMerge: bool

Return
-------
None

Description
-----------
Set if nodes with opposite normals should be merged.
") SetMergeOpposite;
		void SetMergeOpposite(bool theToMerge);

		/****** Poly_MergeNodesTool::SetMergeTolerance ******/
		/****** md5 signature: 68ac77dc68d463a45fe791220c4c1037 ******/
		%feature("compactdefaultargs") SetMergeTolerance;
		%feature("autodoc", "
Parameters
----------
theTolerance: double

Return
-------
None

Description
-----------
Set merge tolerance.
") SetMergeTolerance;
		void SetMergeTolerance(double theTolerance);

		/****** Poly_MergeNodesTool::SetUnitFactor ******/
		/****** md5 signature: f7ae34d46d91996c57038f792982636e ******/
		%feature("compactdefaultargs") SetUnitFactor;
		%feature("autodoc", "
Parameters
----------
theUnitFactor: double

Return
-------
None

Description
-----------
Setup unit factor.
") SetUnitFactor;
		void SetUnitFactor(double theUnitFactor);

		/****** Poly_MergeNodesTool::ToDropDegenerative ******/
		/****** md5 signature: d0d29e78b3ec8be2e3b06c85e4aa3169 ******/
		%feature("compactdefaultargs") ToDropDegenerative;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return True if degenerate elements should be discarded; True by default.
") ToDropDegenerative;
		bool ToDropDegenerative();

		/****** Poly_MergeNodesTool::ToMergeElems ******/
		/****** md5 signature: faab5f7e47b13d1e82a5f43489d865d7 ******/
		%feature("compactdefaultargs") ToMergeElems;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return True if equal elements should be filtered; False by default.
") ToMergeElems;
		bool ToMergeElems();

		/****** Poly_MergeNodesTool::ToMergeOpposite ******/
		/****** md5 signature: 28336470350be6372b143f45e7955794 ******/
		%feature("compactdefaultargs") ToMergeOpposite;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return True if nodes with opposite normals should be merged; False by default.
") ToMergeOpposite;
		bool ToMergeOpposite();

		/****** Poly_MergeNodesTool::computeTriNormal ******/
		/****** md5 signature: 25e09c9ffb0af3cb0363dc699d14ab79 ******/
		%feature("compactdefaultargs") computeTriNormal;
		%feature("autodoc", "Return
-------
NCollection_Vec3<float >

Description
-----------
Compute normal for the mesh element.
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
		/****** Poly_Polygon2D::Poly_Polygon2D ******/
		/****** md5 signature: 3a8c467f0240c4e2a1e715ce82b546ac ******/
		%feature("compactdefaultargs") Poly_Polygon2D;
		%feature("autodoc", "
Parameters
----------
theNbNodes: int

Return
-------
None

Description
-----------
Constructs a 2D polygon with specified number of nodes.
") Poly_Polygon2D;
		 Poly_Polygon2D(const Standard_Integer theNbNodes);

		/****** Poly_Polygon2D::Poly_Polygon2D ******/
		/****** md5 signature: ce8c56beaf19a56938aa246c5bd1a08e ******/
		%feature("compactdefaultargs") Poly_Polygon2D;
		%feature("autodoc", "
Parameters
----------
Nodes: TColgp_Array1OfPnt2d

Return
-------
None

Description
-----------
Constructs a 2D polygon defined by the table of points, <Nodes>.
") Poly_Polygon2D;
		 Poly_Polygon2D(const TColgp_Array1OfPnt2d & Nodes);

		/****** Poly_Polygon2D::ChangeNodes ******/
		/****** md5 signature: f72dedd03604abdffc46813042de4100 ******/
		%feature("compactdefaultargs") ChangeNodes;
		%feature("autodoc", "Return
-------
TColgp_Array1OfPnt2d

Description
-----------
Returns the table of nodes for this polygon.
") ChangeNodes;
		TColgp_Array1OfPnt2d & ChangeNodes();

		/****** Poly_Polygon2D::Deflection ******/
		/****** md5 signature: 6fb4c31e8f4445c1597fc8b70a63cbfb ******/
		%feature("compactdefaultargs") Deflection;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the deflection of this polygon. Deflection is used in cases where the polygon is an approximate representation of a curve. Deflection represents the maximum distance permitted between any point on the curve and the corresponding point on the polygon. By default the deflection value is equal to 0. An algorithm using this 2D polygon with a deflection value equal to 0 considers that it is working with a true polygon and not with an approximate representation of a curve. The Deflection function is used to modify the deflection value of this polygon. The deflection value can be used by any algorithm working with 2D polygons. For example: - An algorithm may use a unique deflection value for all its polygons. In this case it is not necessary to use the Deflection function. - Or an algorithm may want to attach a different deflection to each polygon. In this case, the Deflection function is used to set a value on each polygon, and later to fetch the value.
") Deflection;
		Standard_Real Deflection();

		/****** Poly_Polygon2D::Deflection ******/
		/****** md5 signature: 252c3a361469b253f0b50ec6dd3eaf91 ******/
		%feature("compactdefaultargs") Deflection;
		%feature("autodoc", "
Parameters
----------
theDefl: float

Return
-------
None

Description
-----------
Sets the deflection of this polygon.
") Deflection;
		void Deflection(const Standard_Real theDefl);


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** Poly_Polygon2D::NbNodes ******/
		/****** md5 signature: e10a1e755c3c99568fdfec53b6a1d5d1 ******/
		%feature("compactdefaultargs") NbNodes;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of nodes in this polygon. Note: If the polygon is closed, the point of closure is repeated at the end of its table of nodes. Thus, on a closed triangle, the function NbNodes returns 4.
") NbNodes;
		Standard_Integer NbNodes();

		/****** Poly_Polygon2D::Nodes ******/
		/****** md5 signature: ce444df29b5147afe69540167695be39 ******/
		%feature("compactdefaultargs") Nodes;
		%feature("autodoc", "Return
-------
TColgp_Array1OfPnt2d

Description
-----------
Returns the table of nodes for this polygon.
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
		/****** Poly_Polygon3D::Poly_Polygon3D ******/
		/****** md5 signature: 4faa728c416c9f8f85a9105f43c878a8 ******/
		%feature("compactdefaultargs") Poly_Polygon3D;
		%feature("autodoc", "
Parameters
----------
theNbNodes: int
theHasParams: bool

Return
-------
None

Description
-----------
Constructs a 3D polygon with specific number of nodes.
") Poly_Polygon3D;
		 Poly_Polygon3D(const Standard_Integer theNbNodes, const Standard_Boolean theHasParams);

		/****** Poly_Polygon3D::Poly_Polygon3D ******/
		/****** md5 signature: 95a657f5932969c3e086462497053db5 ******/
		%feature("compactdefaultargs") Poly_Polygon3D;
		%feature("autodoc", "
Parameters
----------
Nodes: TColgp_Array1OfPnt

Return
-------
None

Description
-----------
Constructs a 3D polygon defined by the table of points, Nodes.
") Poly_Polygon3D;
		 Poly_Polygon3D(const TColgp_Array1OfPnt & Nodes);

		/****** Poly_Polygon3D::Poly_Polygon3D ******/
		/****** md5 signature: 8ec8fbe07f9a1e4cb17164843b379dc2 ******/
		%feature("compactdefaultargs") Poly_Polygon3D;
		%feature("autodoc", "
Parameters
----------
Nodes: TColgp_Array1OfPnt
Parameters: TColStd_Array1OfReal

Return
-------
None

Description
-----------
Constructs a 3D polygon defined by the table of points, Nodes, and the parallel table of parameters, Parameters, where each value of the table Parameters is the parameter of the corresponding point on the curve approximated by the constructed polygon. Warning Both the Nodes and Parameters tables must have the same bounds. This property is not checked at construction time.
") Poly_Polygon3D;
		 Poly_Polygon3D(const TColgp_Array1OfPnt & Nodes, const TColStd_Array1OfReal & Parameters);

		/****** Poly_Polygon3D::ChangeNodes ******/
		/****** md5 signature: bc61f369247d26fc843e3e40e222a6e0 ******/
		%feature("compactdefaultargs") ChangeNodes;
		%feature("autodoc", "Return
-------
TColgp_Array1OfPnt

Description
-----------
Returns the table of nodes for this polygon.
") ChangeNodes;
		TColgp_Array1OfPnt & ChangeNodes();

		/****** Poly_Polygon3D::ChangeParameters ******/
		/****** md5 signature: 8ed84ac3a67f35b579cc6d28270bac04 ******/
		%feature("compactdefaultargs") ChangeParameters;
		%feature("autodoc", "Return
-------
TColStd_Array1OfReal

Description
-----------
Returns the table of the parameters associated with each node in this polygon. ChangeParameters function returns the array as shared. Therefore if the table is selected by reference you can, by simply modifying it, directly modify the data structure of this polygon.
") ChangeParameters;
		TColStd_Array1OfReal & ChangeParameters();

		/****** Poly_Polygon3D::Copy ******/
		/****** md5 signature: 532fa451e830dd05948eb705384072ad ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<Poly_Polygon3D>

Description
-----------
Creates a copy of current polygon.
") Copy;
		virtual opencascade::handle<Poly_Polygon3D> Copy();

		/****** Poly_Polygon3D::Deflection ******/
		/****** md5 signature: 6fb4c31e8f4445c1597fc8b70a63cbfb ******/
		%feature("compactdefaultargs") Deflection;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the deflection of this polygon.
") Deflection;
		Standard_Real Deflection();

		/****** Poly_Polygon3D::Deflection ******/
		/****** md5 signature: 252c3a361469b253f0b50ec6dd3eaf91 ******/
		%feature("compactdefaultargs") Deflection;
		%feature("autodoc", "
Parameters
----------
theDefl: float

Return
-------
None

Description
-----------
Sets the deflection of this polygon. See more on deflection in Poly_Polygon2D.
") Deflection;
		void Deflection(const Standard_Real theDefl);


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** Poly_Polygon3D::HasParameters ******/
		/****** md5 signature: 948932cf6475b2432a8160f0c25bcdc0 ******/
		%feature("compactdefaultargs") HasParameters;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns the table of the parameters associated with each node in this polygon. HasParameters function checks if parameters are associated with the nodes of this polygon.
") HasParameters;
		Standard_Boolean HasParameters();

		/****** Poly_Polygon3D::NbNodes ******/
		/****** md5 signature: e10a1e755c3c99568fdfec53b6a1d5d1 ******/
		%feature("compactdefaultargs") NbNodes;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of nodes in this polygon. Note: If the polygon is closed, the point of closure is repeated at the end of its table of nodes. Thus, on a closed triangle the function NbNodes returns 4.
") NbNodes;
		Standard_Integer NbNodes();

		/****** Poly_Polygon3D::Nodes ******/
		/****** md5 signature: 63910e43049268bc77cc7eb526dc4294 ******/
		%feature("compactdefaultargs") Nodes;
		%feature("autodoc", "Return
-------
TColgp_Array1OfPnt

Description
-----------
Returns the table of nodes for this polygon.
") Nodes;
		const TColgp_Array1OfPnt & Nodes();

		/****** Poly_Polygon3D::Parameters ******/
		/****** md5 signature: f774f1ba7bac44b5949bb046f4e4d73b ******/
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "Return
-------
TColStd_Array1OfReal

Description
-----------
Returns true if parameters are associated with the nodes in this polygon.
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
		/****** Poly_PolygonOnTriangulation::Poly_PolygonOnTriangulation ******/
		/****** md5 signature: 99e686aa9441dd0e1f48f7bb6bc146cd ******/
		%feature("compactdefaultargs") Poly_PolygonOnTriangulation;
		%feature("autodoc", "
Parameters
----------
theNbNodes: int
theHasParams: bool

Return
-------
None

Description
-----------
Constructs a 3D polygon on the triangulation of a shape with specified size of nodes.
") Poly_PolygonOnTriangulation;
		 Poly_PolygonOnTriangulation(const Standard_Integer theNbNodes, const Standard_Boolean theHasParams);

		/****** Poly_PolygonOnTriangulation::Poly_PolygonOnTriangulation ******/
		/****** md5 signature: 9991779463c28107e5c10363e72d709e ******/
		%feature("compactdefaultargs") Poly_PolygonOnTriangulation;
		%feature("autodoc", "
Parameters
----------
Nodes: TColStd_Array1OfInteger

Return
-------
None

Description
-----------
Constructs a 3D polygon on the triangulation of a shape, defined by the table of nodes, <Nodes>.
") Poly_PolygonOnTriangulation;
		 Poly_PolygonOnTriangulation(const TColStd_Array1OfInteger & Nodes);

		/****** Poly_PolygonOnTriangulation::Poly_PolygonOnTriangulation ******/
		/****** md5 signature: bdb19dbfd52b28d3a9283b7f180a1ce5 ******/
		%feature("compactdefaultargs") Poly_PolygonOnTriangulation;
		%feature("autodoc", "
Parameters
----------
Nodes: TColStd_Array1OfInteger
Parameters: TColStd_Array1OfReal

Return
-------
None

Description
-----------
Constructs a 3D polygon on the triangulation of a shape, defined by: - the table of nodes, Nodes, and the table of parameters, <Parameters>. where: - a node value is an index in the table of nodes specific to an existing triangulation of a shape - and a parameter value is the value of the parameter of the corresponding point on the curve approximated by the constructed polygon. Warning The tables Nodes and Parameters must be the same size. This property is not checked at construction time.
") Poly_PolygonOnTriangulation;
		 Poly_PolygonOnTriangulation(const TColStd_Array1OfInteger & Nodes, const TColStd_Array1OfReal & Parameters);

		/****** Poly_PolygonOnTriangulation::ChangeNodes ******/
		/****** md5 signature: 804d9242adacaa7a4d3f6b5e4c274788 ******/
		%feature("compactdefaultargs") ChangeNodes;
		%feature("autodoc", "Return
-------
TColStd_Array1OfInteger

Description
-----------
No available documentation.
") ChangeNodes;
		TColStd_Array1OfInteger & ChangeNodes();

		/****** Poly_PolygonOnTriangulation::ChangeParameters ******/
		/****** md5 signature: 40b04bec95a03e3395d29d982eedb28b ******/
		%feature("compactdefaultargs") ChangeParameters;
		%feature("autodoc", "Return
-------
TColStd_Array1OfReal

Description
-----------
No available documentation.
") ChangeParameters;
		TColStd_Array1OfReal & ChangeParameters();

		/****** Poly_PolygonOnTriangulation::Copy ******/
		/****** md5 signature: 249421ad14c91ad15ac15a6b20c906cc ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<Poly_PolygonOnTriangulation>

Description
-----------
Creates a copy of current polygon.
") Copy;
		virtual opencascade::handle<Poly_PolygonOnTriangulation> Copy();

		/****** Poly_PolygonOnTriangulation::Deflection ******/
		/****** md5 signature: 6fb4c31e8f4445c1597fc8b70a63cbfb ******/
		%feature("compactdefaultargs") Deflection;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the deflection of this polygon.
") Deflection;
		Standard_Real Deflection();

		/****** Poly_PolygonOnTriangulation::Deflection ******/
		/****** md5 signature: 252c3a361469b253f0b50ec6dd3eaf91 ******/
		%feature("compactdefaultargs") Deflection;
		%feature("autodoc", "
Parameters
----------
theDefl: float

Return
-------
None

Description
-----------
Sets the deflection of this polygon. See more on deflection in Poly_Polygones2D.
") Deflection;
		void Deflection(const Standard_Real theDefl);


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** Poly_PolygonOnTriangulation::HasParameters ******/
		/****** md5 signature: 948932cf6475b2432a8160f0c25bcdc0 ******/
		%feature("compactdefaultargs") HasParameters;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if parameters are associated with the nodes in this polygon.
") HasParameters;
		Standard_Boolean HasParameters();

		/****** Poly_PolygonOnTriangulation::NbNodes ******/
		/****** md5 signature: e10a1e755c3c99568fdfec53b6a1d5d1 ******/
		%feature("compactdefaultargs") NbNodes;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of nodes for this polygon. Note: If the polygon is closed, the point of closure is repeated at the end of its table of nodes. Thus, on a closed triangle, the function NbNodes returns 4.
") NbNodes;
		Standard_Integer NbNodes();

		/****** Poly_PolygonOnTriangulation::Node ******/
		/****** md5 signature: 9f232dd20d41f5521d50372a652ec320 ******/
		%feature("compactdefaultargs") Node;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
int

Description
-----------
Returns node at the given index.
") Node;
		Standard_Integer Node(Standard_Integer theIndex);

		/****** Poly_PolygonOnTriangulation::Nodes ******/
		/****** md5 signature: 70cb2993ef664c271d7fd9a8e642d0be ******/
		%feature("compactdefaultargs") Nodes;
		%feature("autodoc", "Return
-------
TColStd_Array1OfInteger

Description
-----------
Returns the table of nodes for this polygon. A node value is an index in the table of nodes specific to an existing triangulation of a shape.
") Nodes;
		const TColStd_Array1OfInteger & Nodes();

		/****** Poly_PolygonOnTriangulation::Parameter ******/
		/****** md5 signature: 2f5e734c6e42280e9e364952ae484882 ******/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
float

Description
-----------
Returns parameter at the given index.
") Parameter;
		Standard_Real Parameter(Standard_Integer theIndex);

		/****** Poly_PolygonOnTriangulation::Parameters ******/
		/****** md5 signature: daf943ce276a3f498cf7feb206e7f048 ******/
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "Return
-------
opencascade::handle<TColStd_HArray1OfReal>

Description
-----------
Returns the table of the parameters associated with each node in this polygon. Warning! Use the function HasParameters to check if parameters are associated with the nodes in this polygon.
") Parameters;
		const opencascade::handle<TColStd_HArray1OfReal> & Parameters();

		/****** Poly_PolygonOnTriangulation::SetNode ******/
		/****** md5 signature: 6dafb5b35480fc427463237a0f797a89 ******/
		%feature("compactdefaultargs") SetNode;
		%feature("autodoc", "
Parameters
----------
theIndex: int
theNode: int

Return
-------
None

Description
-----------
Sets node at the given index.
") SetNode;
		void SetNode(Standard_Integer theIndex, Standard_Integer theNode);

		/****** Poly_PolygonOnTriangulation::SetParameter ******/
		/****** md5 signature: 222a24354720b23b67bfff1614cffd76 ******/
		%feature("compactdefaultargs") SetParameter;
		%feature("autodoc", "
Parameters
----------
theIndex: int
theValue: float

Return
-------
None

Description
-----------
Sets parameter at the given index.
") SetParameter;
		void SetParameter(Standard_Integer theIndex, Standard_Real theValue);

		/****** Poly_PolygonOnTriangulation::SetParameters ******/
		/****** md5 signature: 7e854a225b1c5a73057ee36a637ee884 ******/
		%feature("compactdefaultargs") SetParameters;
		%feature("autodoc", "
Parameters
----------
theParameters: TColStd_HArray1OfReal

Return
-------
None

Description
-----------
Sets the table of the parameters associated with each node in this polygon. Raises exception if array size doesn't much number of polygon nodes.
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
		/****** Poly_Triangle::Poly_Triangle ******/
		/****** md5 signature: e5e4ddcb150e767e7fd52ddc274ac740 ******/
		%feature("compactdefaultargs") Poly_Triangle;
		%feature("autodoc", "Return
-------
None

Description
-----------
Constructs a triangle and sets all indices to zero.
") Poly_Triangle;
		 Poly_Triangle();

		/****** Poly_Triangle::Poly_Triangle ******/
		/****** md5 signature: dbf41763cb6560ddac34be6e981e87aa ******/
		%feature("compactdefaultargs") Poly_Triangle;
		%feature("autodoc", "
Parameters
----------
theN1: int
theN2: int
theN3: int

Return
-------
None

Description
-----------
Constructs a triangle and sets its three indices, where these node values are indices in the table of nodes specific to an existing triangulation of a shape.
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
		/****** Poly_Triangle::Get ******/
		/****** md5 signature: ddf4ad86732262802cbb024e5688e653 ******/
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "
Parameters
----------

Return
-------
theN1: int
theN2: int
theN3: int

Description
-----------
Returns the node indices of this triangle.
") Get;
		void Get(Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****** Poly_Triangle::Set ******/
		/****** md5 signature: fa0fefff609bb2b2e13376358214c481 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
theN1: int
theN2: int
theN3: int

Return
-------
None

Description
-----------
Sets the value of the three nodes of this triangle.
") Set;
		void Set(const Standard_Integer theN1, const Standard_Integer theN2, const Standard_Integer theN3);

		/****** Poly_Triangle::Set ******/
		/****** md5 signature: 18bb187316263700055821b3756ccaff ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
theIndex: int
theNode: int

Return
-------
None

Description
-----------
Sets the value of node with specified index of this triangle. Raises Standard_OutOfRange if index is not in 1,2,3.
") Set;
		void Set(const Standard_Integer theIndex, const Standard_Integer theNode);

		/****** Poly_Triangle::Value ******/
		/****** md5 signature: 14d118f74e707c89d3bca2fd9e165273 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
int

Description
-----------
Get the node of given Index. Raises OutOfRange from Standard if Index is not in 1,2,3.
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
		/****** Poly_Triangulation::Poly_Triangulation ******/
		/****** md5 signature: fb64c7c55a06db0e43a312bf4d247ed4 ******/
		%feature("compactdefaultargs") Poly_Triangulation;
		%feature("autodoc", "Return
-------
None

Description
-----------
Constructs an empty triangulation.
") Poly_Triangulation;
		 Poly_Triangulation();

		/****** Poly_Triangulation::Poly_Triangulation ******/
		/****** md5 signature: cf580e761a0d35d2b1b1bf249127ab07 ******/
		%feature("compactdefaultargs") Poly_Triangulation;
		%feature("autodoc", "
Parameters
----------
theNbNodes: int
theNbTriangles: int
theHasUVNodes: bool
theHasNormals: bool (optional, default to false)

Return
-------
None

Description
-----------
Constructs a triangulation from a set of triangles. The triangulation is initialized without a triangle or a node, but capable of containing specified number of nodes and triangles. 
Input parameter: theNbNodes number of nodes to allocate 
Input parameter: theNbTriangles number of triangles to allocate 
Input parameter: theHasUVNodes indicates whether 2D nodes will be associated with 3D ones,  (i.e. to enable a 2D representation) 
Input parameter: theHasNormals indicates whether normals will be given and associated with nodes.
") Poly_Triangulation;
		 Poly_Triangulation(const Standard_Integer theNbNodes, const Standard_Integer theNbTriangles, const Standard_Boolean theHasUVNodes, const Standard_Boolean theHasNormals = false);

		/****** Poly_Triangulation::Poly_Triangulation ******/
		/****** md5 signature: 5868e2be354e056689e3361d93e4d1a9 ******/
		%feature("compactdefaultargs") Poly_Triangulation;
		%feature("autodoc", "
Parameters
----------
Nodes: TColgp_Array1OfPnt
Triangles: Poly_Array1OfTriangle

Return
-------
None

Description
-----------
Constructs a triangulation from a set of triangles. The triangulation is initialized with 3D points from Nodes and triangles from Triangles.
") Poly_Triangulation;
		 Poly_Triangulation(const TColgp_Array1OfPnt & Nodes, const Poly_Array1OfTriangle & Triangles);

		/****** Poly_Triangulation::Poly_Triangulation ******/
		/****** md5 signature: 92e3542add7756f0977cd981c497a96b ******/
		%feature("compactdefaultargs") Poly_Triangulation;
		%feature("autodoc", "
Parameters
----------
Nodes: TColgp_Array1OfPnt
UVNodes: TColgp_Array1OfPnt2d
Triangles: Poly_Array1OfTriangle

Return
-------
None

Description
-----------
Constructs a triangulation from a set of triangles. The triangulation is initialized with 3D points from Nodes, 2D points from UVNodes and triangles from Triangles, where coordinates of a 2D point from UVNodes are the (u, v) parameters of the corresponding 3D point from Nodes on the surface approximated by the constructed triangulation.
") Poly_Triangulation;
		 Poly_Triangulation(const TColgp_Array1OfPnt & Nodes, const TColgp_Array1OfPnt2d & UVNodes, const Poly_Array1OfTriangle & Triangles);

		/****** Poly_Triangulation::Poly_Triangulation ******/
		/****** md5 signature: 4d757cd3935962606f0dd1da74e67a8b ******/
		%feature("compactdefaultargs") Poly_Triangulation;
		%feature("autodoc", "
Parameters
----------
theTriangulation: Poly_Triangulation

Return
-------
None

Description
-----------
Copy constructor for triangulation.
") Poly_Triangulation;
		 Poly_Triangulation(const opencascade::handle<Poly_Triangulation> & theTriangulation);

		/****** Poly_Triangulation::AddNormals ******/
		/****** md5 signature: 988703ac37188d57b77d5222e786606b ******/
		%feature("compactdefaultargs") AddNormals;
		%feature("autodoc", "Return
-------
None

Description
-----------
If an array for normals is not allocated yet, do it now.
") AddNormals;
		void AddNormals();

		/****** Poly_Triangulation::AddUVNodes ******/
		/****** md5 signature: aef4f8f1c7752e806298ac1fdb6f085e ******/
		%feature("compactdefaultargs") AddUVNodes;
		%feature("autodoc", "Return
-------
None

Description
-----------
If an array for UV coordinates is not allocated yet, do it now.
") AddUVNodes;
		void AddUVNodes();

		/****** Poly_Triangulation::CachedMinMax ******/
		/****** md5 signature: 860f1473de4c867bdd1263481bff6a31 ******/
		%feature("compactdefaultargs") CachedMinMax;
		%feature("autodoc", "Return
-------
Bnd_Box

Description
-----------
Returns cached min - max range of triangulation data, which is VOID by default (e.g, no cached information).
") CachedMinMax;
		const Bnd_Box & CachedMinMax();

		/****** Poly_Triangulation::ChangeTriangle ******/
		/****** md5 signature: 97503b6bcbbe63dc66901debc4bacfe4 ******/
		%feature("compactdefaultargs") ChangeTriangle;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
Poly_Triangle

Description
-----------
No available documentation.
") ChangeTriangle;
		Poly_Triangle & ChangeTriangle(const Standard_Integer theIndex);

		/****** Poly_Triangulation::ChangeTriangles ******/
		/****** md5 signature: 93e00889ebc68a48adbbe563da75709d ******/
		%feature("compactdefaultargs") ChangeTriangles;
		%feature("autodoc", "Return
-------
Poly_Array1OfTriangle

Description
-----------
No available documentation.
") ChangeTriangles;
		Poly_Array1OfTriangle & ChangeTriangles();

		/****** Poly_Triangulation::Clear ******/
		/****** md5 signature: 1badd2d119b64dbdb177834e510c3af9 ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clears internal arrays of nodes and all attributes.
") Clear;
		virtual void Clear();

		/****** Poly_Triangulation::ComputeNormals ******/
		/****** md5 signature: 110f2870d1645fb6f770425c5390b82b ******/
		%feature("compactdefaultargs") ComputeNormals;
		%feature("autodoc", "Return
-------
None

Description
-----------
Compute smooth normals by averaging triangle normals.
") ComputeNormals;
		void ComputeNormals();

		/****** Poly_Triangulation::Copy ******/
		/****** md5 signature: eca097a0bd418e6d57a457eb92e7098f ******/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Return
-------
opencascade::handle<Poly_Triangulation>

Description
-----------
Creates full copy of current triangulation.
") Copy;
		virtual opencascade::handle<Poly_Triangulation> Copy();

		/****** Poly_Triangulation::Deflection ******/
		/****** md5 signature: 6fb4c31e8f4445c1597fc8b70a63cbfb ******/
		%feature("compactdefaultargs") Deflection;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the deflection of this triangulation.
") Deflection;
		Standard_Real Deflection();

		/****** Poly_Triangulation::Deflection ******/
		/****** md5 signature: b86bc3614056d639b4f5cd50c01cdd01 ******/
		%feature("compactdefaultargs") Deflection;
		%feature("autodoc", "
Parameters
----------
theDeflection: float

Return
-------
None

Description
-----------
Sets the deflection of this triangulation to theDeflection. See more on deflection in Polygon2D.
") Deflection;
		void Deflection(const Standard_Real theDeflection);

		/****** Poly_Triangulation::DetachedLoadDeferredData ******/
		/****** md5 signature: 9af9a4d45f59e107cacdd9ec789b0012 ******/
		%feature("compactdefaultargs") DetachedLoadDeferredData;
		%feature("autodoc", "
Parameters
----------
theFileSystem: OSD_FileSystem (optional, default to opencascade::handle<OSD_FileSystem>())

Return
-------
opencascade::handle<Poly_Triangulation>

Description
-----------
Loads triangulation data into new Poly_Triangulation object from some deferred storage using specified shared input file system.
") DetachedLoadDeferredData;
		virtual opencascade::handle<Poly_Triangulation> DetachedLoadDeferredData(const opencascade::handle<OSD_FileSystem> & theFileSystem = opencascade::handle<OSD_FileSystem>());


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** Poly_Triangulation::HasCachedMinMax ******/
		/****** md5 signature: f79a105a5bcf422403c5e9f9fd81b27f ******/
		%feature("compactdefaultargs") HasCachedMinMax;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if there is some cached min - max range of this triangulation.
") HasCachedMinMax;
		Standard_Boolean HasCachedMinMax();

		/****** Poly_Triangulation::HasDeferredData ******/
		/****** md5 signature: 6d3e21e66856957a5fa945244fecad2c ******/
		%feature("compactdefaultargs") HasDeferredData;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if there is some triangulation data that can be loaded using LoadDeferredData().
") HasDeferredData;
		virtual Standard_Boolean HasDeferredData();

		/****** Poly_Triangulation::HasGeometry ******/
		/****** md5 signature: a4660e9afa0dc45d915e55b9cc6a1ce8 ******/
		%feature("compactdefaultargs") HasGeometry;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if triangulation has some geometry.
") HasGeometry;
		virtual Standard_Boolean HasGeometry();

		/****** Poly_Triangulation::HasNormals ******/
		/****** md5 signature: 07515066bfaef42256152544d89b8a1b ******/
		%feature("compactdefaultargs") HasNormals;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns Standard_True if nodal normals are defined.
") HasNormals;
		Standard_Boolean HasNormals();

		/****** Poly_Triangulation::HasUVNodes ******/
		/****** md5 signature: 735518b51047c7fd797f5a3e32f5d96e ******/
		%feature("compactdefaultargs") HasUVNodes;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns Standard_True if 2D nodes are associated with 3D nodes for this triangulation.
") HasUVNodes;
		Standard_Boolean HasUVNodes();

		/****** Poly_Triangulation::InternalNodes ******/
		/****** md5 signature: 403a5fe5cb6597f76bbee32dd2e0bec6 ******/
		%feature("compactdefaultargs") InternalNodes;
		%feature("autodoc", "Return
-------
Poly_ArrayOfNodes

Description
-----------
Returns an internal array of nodes. Node()/SetNode() should be used instead in portable code.
") InternalNodes;
		Poly_ArrayOfNodes & InternalNodes();

		/****** Poly_Triangulation::InternalNormals ******/
		/****** md5 signature: 93e4192abafb087bf6c239c37a37ebf6 ******/
		%feature("compactdefaultargs") InternalNormals;
		%feature("autodoc", "Return
-------
NCollection_Array1<gp_Vec3f>

Description
-----------
Return an internal array of normals. Normal()/SetNormal() should be used instead in portable code.
") InternalNormals;
		NCollection_Array1<gp_Vec3f> InternalNormals();

		/****** Poly_Triangulation::InternalTriangles ******/
		/****** md5 signature: 1a53bffdd17170444b156e94f8320fdf ******/
		%feature("compactdefaultargs") InternalTriangles;
		%feature("autodoc", "Return
-------
Poly_Array1OfTriangle

Description
-----------
Returns an internal array of triangles. Triangle()/SetTriangle() should be used instead in portable code.
") InternalTriangles;
		Poly_Array1OfTriangle & InternalTriangles();

		/****** Poly_Triangulation::InternalUVNodes ******/
		/****** md5 signature: 59cea86b8917085f807b814917ebbb4e ******/
		%feature("compactdefaultargs") InternalUVNodes;
		%feature("autodoc", "Return
-------
Poly_ArrayOfUVNodes

Description
-----------
Returns an internal array of UV nodes. UBNode()/SetUVNode() should be used instead in portable code.
") InternalUVNodes;
		Poly_ArrayOfUVNodes & InternalUVNodes();

		/****** Poly_Triangulation::IsDoublePrecision ******/
		/****** md5 signature: c768d26054fe7836c133ffb1451dd7cd ******/
		%feature("compactdefaultargs") IsDoublePrecision;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if node positions are defined with double precision; True by default.
") IsDoublePrecision;
		bool IsDoublePrecision();

		/****** Poly_Triangulation::LoadDeferredData ******/
		/****** md5 signature: 24c1ab4ecc3f85c797488cce47e81392 ******/
		%feature("compactdefaultargs") LoadDeferredData;
		%feature("autodoc", "
Parameters
----------
theFileSystem: OSD_FileSystem (optional, default to opencascade::handle<OSD_FileSystem>())

Return
-------
bool

Description
-----------
Loads triangulation data into itself from some deferred storage using specified shared input file system.
") LoadDeferredData;
		virtual Standard_Boolean LoadDeferredData(const opencascade::handle<OSD_FileSystem> & theFileSystem = opencascade::handle<OSD_FileSystem>());

		/****** Poly_Triangulation::MapNodeArray ******/
		/****** md5 signature: 9c275c60798ddd9c1b7e5d68f7c29b6d ******/
		%feature("compactdefaultargs") MapNodeArray;
		%feature("autodoc", "Return
-------
opencascade::handle<TColgp_HArray1OfPnt>

Description
-----------
Returns the table of 3D points for read-only access or NULL if nodes array is undefined. Poly_Triangulation::Node() should be used instead when possible. Returned object should not be used after Poly_Triangulation destruction.
") MapNodeArray;
		opencascade::handle<TColgp_HArray1OfPnt> MapNodeArray();

		/****** Poly_Triangulation::MapNormalArray ******/
		/****** md5 signature: 4ff4fd7887eef1b2c85132e2201f9244 ******/
		%feature("compactdefaultargs") MapNormalArray;
		%feature("autodoc", "Return
-------
opencascade::handle<TShort_HArray1OfShortReal>

Description
-----------
Returns the table of per-vertex normals for read-only access or NULL if normals array is undefined. Poly_Triangulation::Normal() should be used instead when possible. Returned object should not be used after Poly_Triangulation destruction.
") MapNormalArray;
		opencascade::handle<TShort_HArray1OfShortReal> MapNormalArray();

		/****** Poly_Triangulation::MapTriangleArray ******/
		/****** md5 signature: e5a1f4ced93fc073d52de30aa690a57d ******/
		%feature("compactdefaultargs") MapTriangleArray;
		%feature("autodoc", "Return
-------
opencascade::handle<Poly_HArray1OfTriangle>

Description
-----------
Returns the triangle array for read-only access or NULL if triangle array is undefined. Poly_Triangulation::Triangle() should be used instead when possible. Returned object should not be used after Poly_Triangulation destruction.
") MapTriangleArray;
		opencascade::handle<Poly_HArray1OfTriangle> MapTriangleArray();

		/****** Poly_Triangulation::MapUVNodeArray ******/
		/****** md5 signature: 06601b50e73ad7b0e2ea1e0a991dfb6f ******/
		%feature("compactdefaultargs") MapUVNodeArray;
		%feature("autodoc", "Return
-------
opencascade::handle<TColgp_HArray1OfPnt2d>

Description
-----------
Returns the table of 2D nodes for read-only access or NULL if UV nodes array is undefined. Poly_Triangulation::UVNode() should be used instead when possible. Returned object should not be used after Poly_Triangulation destruction.
") MapUVNodeArray;
		opencascade::handle<TColgp_HArray1OfPnt2d> MapUVNodeArray();

		/****** Poly_Triangulation::MeshPurpose ******/
		/****** md5 signature: ba1e18e20d36cd45158708664262234a ******/
		%feature("compactdefaultargs") MeshPurpose;
		%feature("autodoc", "Return
-------
Poly_MeshPurpose

Description
-----------
Returns mesh purpose bits.
") MeshPurpose;
		Poly_MeshPurpose MeshPurpose();

		/****** Poly_Triangulation::MinMax ******/
		/****** md5 signature: 6e35e4cffcebf3b16403a57344e99893 ******/
		%feature("compactdefaultargs") MinMax;
		%feature("autodoc", "
Parameters
----------
theBox: Bnd_Box
theTrsf: gp_Trsf
theIsAccurate: bool (optional, default to false)

Return
-------
bool

Description
-----------
Extends the passed box with bounding box of this triangulation. Uses cached min - max range when available and: - input transformation theTrsf has no rotation part; - theIsAccurate is set to False; - no triangulation data available (e.g. it is deferred and not loaded). 
Input parameter:[out] theBox bounding box to extend by this triangulation 
Input parameter: theTrsf optional transformation 
Input parameter: theIsAccurate when False, allows using a cached min - max range of this triangulation  even for non-identity transformation. 
Return: False if there is no any data to extend the passed box (no both triangulation and cached min - max range).
") MinMax;
		Standard_Boolean MinMax(Bnd_Box & theBox, const gp_Trsf & theTrsf, const bool theIsAccurate = false);

		/****** Poly_Triangulation::NbDeferredNodes ******/
		/****** md5 signature: 181f24753f86afef53db878ca490cb7f ******/
		%feature("compactdefaultargs") NbDeferredNodes;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns number of deferred nodes that can be loaded using LoadDeferredData(). Note: this is estimated values, which might be different from actually loaded values. Always check triangulation size of actually loaded data in code to avoid out-of-range issues.
") NbDeferredNodes;
		virtual Standard_Integer NbDeferredNodes();

		/****** Poly_Triangulation::NbDeferredTriangles ******/
		/****** md5 signature: 6590098237c07bc2fc7c793b6ca3b413 ******/
		%feature("compactdefaultargs") NbDeferredTriangles;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns number of deferred triangles that can be loaded using LoadDeferredData(). Note: this is estimated values, which might be different from actually loaded values Always check triangulation size of actually loaded data in code to avoid out-of-range issues.
") NbDeferredTriangles;
		virtual Standard_Integer NbDeferredTriangles();

		/****** Poly_Triangulation::NbNodes ******/
		/****** md5 signature: e10a1e755c3c99568fdfec53b6a1d5d1 ******/
		%feature("compactdefaultargs") NbNodes;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of nodes for this triangulation.
") NbNodes;
		Standard_Integer NbNodes();

		/****** Poly_Triangulation::NbTriangles ******/
		/****** md5 signature: 192b02c351e0888abe52f9e1c6139918 ******/
		%feature("compactdefaultargs") NbTriangles;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of triangles for this triangulation.
") NbTriangles;
		Standard_Integer NbTriangles();

		/****** Poly_Triangulation::Node ******/
		/****** md5 signature: 48e932705302aa5c401569deb665fd5b ******/
		%feature("compactdefaultargs") Node;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
gp_Pnt

Description
-----------
Returns a node at the given index. 
Input parameter: theIndex node index within [1, NbNodes()] range 
Return: 3D point coordinates.
") Node;
		gp_Pnt Node(Standard_Integer theIndex);

		/****** Poly_Triangulation::Normal ******/
		/****** md5 signature: 253664a7e4e8068dfd6a122d8bad4c73 ******/
		%feature("compactdefaultargs") Normal;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
gp_Dir

Description
-----------
Returns normal at the given index. 
Input parameter: theIndex node index within [1, NbNodes()] range 
Return: normalized 3D vector defining a surface normal.
") Normal;
		gp_Dir Normal(Standard_Integer theIndex);

		/****** Poly_Triangulation::Normal ******/
		/****** md5 signature: 110aa4fbe5c4eb7a7d08446898f30660 ******/
		%feature("compactdefaultargs") Normal;
		%feature("autodoc", "
Parameters
----------
theIndex: int
theVec3: gp_Vec3f

Return
-------
None

Description
-----------
Returns normal at the given index. 
Input parameter: theIndex node index within [1, NbNodes()] range @param[out] theVec3 3D vector defining a surface normal.
") Normal;
		void Normal(Standard_Integer theIndex, gp_Vec3f & theVec3);

		/****** Poly_Triangulation::Parameters ******/
		/****** md5 signature: 6252211024a9c3cb02e54aa22a221883 ******/
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "Return
-------
opencascade::handle<Poly_TriangulationParameters>

Description
-----------
Returns initial set of parameters used to generate this triangulation.
") Parameters;
		const opencascade::handle<Poly_TriangulationParameters> & Parameters();

		/****** Poly_Triangulation::Parameters ******/
		/****** md5 signature: 61d90060156bad034a55aa0c625a7f41 ******/
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "
Parameters
----------
theParams: Poly_TriangulationParameters

Return
-------
None

Description
-----------
Updates initial set of parameters used to generate this triangulation.
") Parameters;
		void Parameters(const opencascade::handle<Poly_TriangulationParameters> & theParams);

		/****** Poly_Triangulation::RemoveNormals ******/
		/****** md5 signature: 906873267f0d5cb3a94c9b91f41d3f43 ******/
		%feature("compactdefaultargs") RemoveNormals;
		%feature("autodoc", "Return
-------
None

Description
-----------
Deallocates the normals array.
") RemoveNormals;
		void RemoveNormals();

		/****** Poly_Triangulation::RemoveUVNodes ******/
		/****** md5 signature: 40045c3c77e535165bfc8c8523acf1d5 ******/
		%feature("compactdefaultargs") RemoveUVNodes;
		%feature("autodoc", "Return
-------
None

Description
-----------
Deallocates the UV nodes array.
") RemoveUVNodes;
		void RemoveUVNodes();

		/****** Poly_Triangulation::ResizeNodes ******/
		/****** md5 signature: 3b86fbe9b3c9ba30b4ebf0344ad53a7b ******/
		%feature("compactdefaultargs") ResizeNodes;
		%feature("autodoc", "
Parameters
----------
theNbNodes: int
theToCopyOld: bool

Return
-------
None

Description
-----------
Method resizing internal arrays of nodes (synchronously for all attributes). 
Input parameter: theNbNodes new number of nodes 
Input parameter: theToCopyOld copy old nodes into the new array.
") ResizeNodes;
		void ResizeNodes(Standard_Integer theNbNodes, Standard_Boolean theToCopyOld);

		/****** Poly_Triangulation::ResizeTriangles ******/
		/****** md5 signature: adc8606878f0507cdc07dcad06d7a5a2 ******/
		%feature("compactdefaultargs") ResizeTriangles;
		%feature("autodoc", "
Parameters
----------
theNbTriangles: int
theToCopyOld: bool

Return
-------
None

Description
-----------
Method resizing an internal array of triangles. 
Input parameter: theNbTriangles new number of triangles 
Input parameter: theToCopyOld copy old triangles into the new array.
") ResizeTriangles;
		void ResizeTriangles(Standard_Integer theNbTriangles, Standard_Boolean theToCopyOld);

		/****** Poly_Triangulation::SetCachedMinMax ******/
		/****** md5 signature: 19ad72bfcaa33accf71079a046805f6c ******/
		%feature("compactdefaultargs") SetCachedMinMax;
		%feature("autodoc", "
Parameters
----------
theBox: Bnd_Box

Return
-------
None

Description
-----------
Sets a cached min - max range of this triangulation. The bounding box should exactly match actual range of triangulation data without a gap or transformation, or otherwise undefined behavior will be observed. Passing a VOID range invalidates the cache.
") SetCachedMinMax;
		void SetCachedMinMax(const Bnd_Box & theBox);

		/****** Poly_Triangulation::SetDoublePrecision ******/
		/****** md5 signature: 6c35f8efef0e359ce10f5e168a8c2030 ******/
		%feature("compactdefaultargs") SetDoublePrecision;
		%feature("autodoc", "
Parameters
----------
theIsDouble: bool

Return
-------
None

Description
-----------
Set if node positions should be defined with double or single precision for 3D and UV nodes. Raises exception if data was already allocated.
") SetDoublePrecision;
		void SetDoublePrecision(bool theIsDouble);

		/****** Poly_Triangulation::SetMeshPurpose ******/
		/****** md5 signature: 196379fb8aefcd5ad64b2c91f7fee649 ******/
		%feature("compactdefaultargs") SetMeshPurpose;
		%feature("autodoc", "
Parameters
----------
thePurpose: Poly_MeshPurpose

Return
-------
None

Description
-----------
Sets mesh purpose bits.
") SetMeshPurpose;
		void SetMeshPurpose(const Poly_MeshPurpose thePurpose);

		/****** Poly_Triangulation::SetNode ******/
		/****** md5 signature: 4c86150f9d355bdf6918f3438a943304 ******/
		%feature("compactdefaultargs") SetNode;
		%feature("autodoc", "
Parameters
----------
theIndex: int
thePnt: gp_Pnt

Return
-------
None

Description
-----------
Sets a node coordinates. 
Input parameter: theIndex node index within [1, NbNodes()] range 
Input parameter: thePnt 3D point coordinates.
") SetNode;
		void SetNode(Standard_Integer theIndex, const gp_Pnt & thePnt);

		/****** Poly_Triangulation::SetNormal ******/
		/****** md5 signature: dc19aaf77561dbe449024631f4eeee1b ******/
		%feature("compactdefaultargs") SetNormal;
		%feature("autodoc", "
Parameters
----------
theIndex: int
theNormal: gp_Vec3f

Return
-------
None

Description
-----------
Changes normal at the given index. 
Input parameter: theIndex node index within [1, NbNodes()] range 
Input parameter: theVec3 normalized 3D vector defining a surface normal.
") SetNormal;
		void SetNormal(const Standard_Integer theIndex, const gp_Vec3f & theNormal);

		/****** Poly_Triangulation::SetNormal ******/
		/****** md5 signature: 0fdfdf6eef8e01f6f44ef167778a8399 ******/
		%feature("compactdefaultargs") SetNormal;
		%feature("autodoc", "
Parameters
----------
theIndex: int
theNormal: gp_Dir

Return
-------
None

Description
-----------
Changes normal at the given index. 
Input parameter: theIndex node index within [1, NbNodes()] range 
Input parameter: theNormal normalized 3D vector defining a surface normal.
") SetNormal;
		void SetNormal(const Standard_Integer theIndex, const gp_Dir & theNormal);

		/****** Poly_Triangulation::SetNormals ******/
		/****** md5 signature: 7c3a3b618d135482bdaa83f0ced5edb7 ******/
		%feature("compactdefaultargs") SetNormals;
		%feature("autodoc", "
Parameters
----------
theNormals: TShort_HArray1OfShortReal

Return
-------
None

Description
-----------
No available documentation.
") SetNormals;
		void SetNormals(const opencascade::handle<TShort_HArray1OfShortReal> & theNormals);

		/****** Poly_Triangulation::SetTriangle ******/
		/****** md5 signature: 95a552e8aa9d409a641c1fe5418519b3 ******/
		%feature("compactdefaultargs") SetTriangle;
		%feature("autodoc", "
Parameters
----------
theIndex: int
theTriangle: Poly_Triangle

Return
-------
None

Description
-----------
Sets a triangle. 
Input parameter: theIndex triangle index within [1, NbTriangles()] range 
Input parameter: theTriangle triangle node indices, with each node defined within [1, NbNodes()] range.
") SetTriangle;
		void SetTriangle(Standard_Integer theIndex, const Poly_Triangle & theTriangle);

		/****** Poly_Triangulation::SetUVNode ******/
		/****** md5 signature: 75f2dd3953e33c453b0caa0b3b20f49f ******/
		%feature("compactdefaultargs") SetUVNode;
		%feature("autodoc", "
Parameters
----------
theIndex: int
thePnt: gp_Pnt2d

Return
-------
None

Description
-----------
Sets an UV-node coordinates. 
Input parameter: theIndex node index within [1, NbNodes()] range 
Input parameter: thePnt UV coordinates.
") SetUVNode;
		void SetUVNode(Standard_Integer theIndex, const gp_Pnt2d & thePnt);

		/****** Poly_Triangulation::Triangle ******/
		/****** md5 signature: 3883dfb3e28eb482bbc2fa1ac9c0a8bd ******/
		%feature("compactdefaultargs") Triangle;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
Poly_Triangle

Description
-----------
Returns triangle at the given index. 
Input parameter: theIndex triangle index within [1, NbTriangles()] range 
Return: triangle node indices, with each node defined within [1, NbNodes()] range.
") Triangle;
		const Poly_Triangle & Triangle(Standard_Integer theIndex);

		/****** Poly_Triangulation::Triangles ******/
		/****** md5 signature: ba43a8d32c20fbeb1020e37bd97d4aca ******/
		%feature("compactdefaultargs") Triangles;
		%feature("autodoc", "Return
-------
Poly_Array1OfTriangle

Description
-----------
No available documentation.
") Triangles;
		const Poly_Array1OfTriangle & Triangles();

		/****** Poly_Triangulation::UVNode ******/
		/****** md5 signature: 30f3fd5f160869900c18f852f4c89b00 ******/
		%feature("compactdefaultargs") UVNode;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
gp_Pnt2d

Description
-----------
Returns UV-node at the given index. 
Input parameter: theIndex node index within [1, NbNodes()] range 
Return: 2D point defining UV coordinates.
") UVNode;
		gp_Pnt2d UVNode(Standard_Integer theIndex);

		/****** Poly_Triangulation::UnloadDeferredData ******/
		/****** md5 signature: 7d284011e56d3e968d822420287d0f32 ******/
		%feature("compactdefaultargs") UnloadDeferredData;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Releases triangulation data if it has connected deferred storage.
") UnloadDeferredData;
		virtual Standard_Boolean UnloadDeferredData();

		/****** Poly_Triangulation::UpdateCachedMinMax ******/
		/****** md5 signature: 4c361d8b4180a1ed7c2336bf5a7b6550 ******/
		%feature("compactdefaultargs") UpdateCachedMinMax;
		%feature("autodoc", "Return
-------
None

Description
-----------
Updates cached min - max range of this triangulation with bounding box of nodal data.
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
		/****** Poly_TriangulationParameters::Poly_TriangulationParameters ******/
		/****** md5 signature: 2846ec507556dc9aeed354635ae24a71 ******/
		%feature("compactdefaultargs") Poly_TriangulationParameters;
		%feature("autodoc", "
Parameters
----------
theDeflection: float (optional, default to -1)
theAngle: float (optional, default to -1)
theMinSize: float (optional, default to -1)

Return
-------
None

Description
-----------
Constructor. Initializes object with the given parameters. 
Parameter theDeflection linear deflection 
Parameter theAngle angular deflection 
Parameter theMinSize minimum size.
") Poly_TriangulationParameters;
		 Poly_TriangulationParameters(const Standard_Real theDeflection = -1, const Standard_Real theAngle = -1, const Standard_Real theMinSize = -1);

		/****** Poly_TriangulationParameters::Angle ******/
		/****** md5 signature: 2e7a91a67b1745bc9ecd36bc3650ed68 ******/
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns angular deflection or -1 if undefined.
") Angle;
		Standard_Real Angle();

		/****** Poly_TriangulationParameters::Deflection ******/
		/****** md5 signature: 6fb4c31e8f4445c1597fc8b70a63cbfb ******/
		%feature("compactdefaultargs") Deflection;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns linear deflection or -1 if undefined.
") Deflection;
		Standard_Real Deflection();

		/****** Poly_TriangulationParameters::HasAngle ******/
		/****** md5 signature: c1223160f2439e874120d1b51f6c461c ******/
		%feature("compactdefaultargs") HasAngle;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if angular deflection is defined.
") HasAngle;
		Standard_Boolean HasAngle();

		/****** Poly_TriangulationParameters::HasDeflection ******/
		/****** md5 signature: 90ac27dcf3a3d8ea534c31817e1d0330 ******/
		%feature("compactdefaultargs") HasDeflection;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if linear deflection is defined.
") HasDeflection;
		Standard_Boolean HasDeflection();

		/****** Poly_TriangulationParameters::HasMinSize ******/
		/****** md5 signature: d918376e08395b3d644d99b6d1b1d4f9 ******/
		%feature("compactdefaultargs") HasMinSize;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if minimum size is defined.
") HasMinSize;
		Standard_Boolean HasMinSize();

		/****** Poly_TriangulationParameters::MinSize ******/
		/****** md5 signature: e59d58f0974e9001490d4ab40193a04b ******/
		%feature("compactdefaultargs") MinSize;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns minimum size or -1 if undefined.
") MinSize;
		Standard_Real MinSize();

};


%make_alias(Poly_TriangulationParameters)

%extend Poly_TriangulationParameters {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************
* class equal_to<Poly_MakeLoops::Link> *
***************************************/
/***********************************
* class hash<Poly_MakeLoops::Link> *
***********************************/
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
/* deprecated methods */
%pythoncode {
@deprecated
def poly_Catenate(*args):
	return poly.Catenate(*args)

@deprecated
def poly_ComputeNormals(*args):
	return poly.ComputeNormals(*args)

@deprecated
def poly_Dump(*args):
	return poly.Dump(*args)

@deprecated
def poly_Dump(*args):
	return poly.Dump(*args)

@deprecated
def poly_Dump(*args):
	return poly.Dump(*args)

@deprecated
def poly_Intersect(*args):
	return poly.Intersect(*args)

@deprecated
def poly_IntersectTriLine(*args):
	return poly.IntersectTriLine(*args)

@deprecated
def poly_PointOnTriangle(*args):
	return poly.PointOnTriangle(*args)

@deprecated
def poly_ReadPolygon2D(*args):
	return poly.ReadPolygon2D(*args)

@deprecated
def poly_ReadPolygon3D(*args):
	return poly.ReadPolygon3D(*args)

@deprecated
def poly_ReadTriangulation(*args):
	return poly.ReadTriangulation(*args)

@deprecated
def poly_Write(*args):
	return poly.Write(*args)

@deprecated
def poly_Write(*args):
	return poly.Write(*args)

@deprecated
def poly_Write(*args):
	return poly.Write(*args)

@deprecated
def Poly_MergeNodesTool_MergeNodes(*args):
	return Poly_MergeNodesTool.MergeNodes(*args)

}
