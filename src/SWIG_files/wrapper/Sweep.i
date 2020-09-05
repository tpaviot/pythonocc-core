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
%define SWEEPDOCSTRING
"Sweep module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_sweep.html"
%enddef
%module (package="OCC.Core", docstring=SWEEPDOCSTRING) Sweep


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
#include<Sweep_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TopAbs_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import TopAbs.i

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
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/***********************
* class Sweep_NumShape *
***********************/
class Sweep_NumShape {
	public:
		/****************** Sweep_NumShape ******************/
		/**** md5 signature: 3f873b51e81d8ddab3d5be2d11f8e11e ****/
		%feature("compactdefaultargs") Sweep_NumShape;
		%feature("autodoc", "Creates a dummy indexed edge.

Returns
-------
None
") Sweep_NumShape;
		 Sweep_NumShape();

		/****************** Sweep_NumShape ******************/
		/**** md5 signature: f74f5efc1b7fe5d2d292f9da3e31eab4 ****/
		%feature("compactdefaultargs") Sweep_NumShape;
		%feature("autodoc", "Creates a new simple indexed edge. //! for an edge : index is the number of vertices (0, 1 or 2),type is topabs_edge, closed is true if it is a closed edge, beginf is true if the edge is infinite at the begenning, endinf is true if the edge is infinite at the end. //! for a vertex : index is the index of the vertex in the edge (1 or 2), type is topabsvertex, all the other fields have no meanning.

Parameters
----------
Index: int
Type: TopAbs_ShapeEnum
Closed: bool,optional
	default value is Standard_False
BegInf: bool,optional
	default value is Standard_False
EndInf: bool,optional
	default value is Standard_False

Returns
-------
None
") Sweep_NumShape;
		 Sweep_NumShape(const Standard_Integer Index, const TopAbs_ShapeEnum Type, const Standard_Boolean Closed = Standard_False, const Standard_Boolean BegInf = Standard_False, const Standard_Boolean EndInf = Standard_False);

		/****************** BegInfinite ******************/
		/**** md5 signature: 4fb9c294eab51637abaf071c19d4a021 ****/
		%feature("compactdefaultargs") BegInfinite;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") BegInfinite;
		Standard_Boolean BegInfinite();

		/****************** Closed ******************/
		/**** md5 signature: 6964da666f9b5a80bedb32cfb1fdc0ba ****/
		%feature("compactdefaultargs") Closed;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") Closed;
		Standard_Boolean Closed();

		/****************** EndInfinite ******************/
		/**** md5 signature: 476bab42a0dcaafcb903df86a82adb7f ****/
		%feature("compactdefaultargs") EndInfinite;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") EndInfinite;
		Standard_Boolean EndInfinite();

		/****************** Index ******************/
		/**** md5 signature: 407d80ef3037d55996765198adea3908 ****/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") Index;
		Standard_Integer Index();

		/****************** Init ******************/
		/**** md5 signature: b0a0a53424ec34c8f8f3bbe108ad77db ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Reinitialize a simple indexed edge. //! for an edge : index is the number of vertices (0, 1 or 2),type is topabs_edge, closed is true if it is a closed edge, beginf is true if the edge is infinite at the begenning, endinf is true if the edge is infinite at the end. //! for a vertex : index is the index of the vertex in the edge (1 or 2), type is topabsvertex, closed is true if it is the vertex of a closed edge, all the other fields have no meanning.

Parameters
----------
Index: int
Type: TopAbs_ShapeEnum
Closed: bool,optional
	default value is Standard_False
BegInf: bool,optional
	default value is Standard_False
EndInf: bool,optional
	default value is Standard_False

Returns
-------
None
") Init;
		void Init(const Standard_Integer Index, const TopAbs_ShapeEnum Type, const Standard_Boolean Closed = Standard_False, const Standard_Boolean BegInf = Standard_False, const Standard_Boolean EndInf = Standard_False);

		/****************** Orientation ******************/
		/**** md5 signature: 328242fe19b1f80489d8169681ebc029 ****/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "No available documentation.

Returns
-------
TopAbs_Orientation
") Orientation;
		TopAbs_Orientation Orientation();

		/****************** Type ******************/
		/**** md5 signature: 3f27a65186b8053d282c2c0d8c4513b8 ****/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "No available documentation.

Returns
-------
TopAbs_ShapeEnum
") Type;
		TopAbs_ShapeEnum Type();

};


%extend Sweep_NumShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class Sweep_NumShapeIterator *
*******************************/
class Sweep_NumShapeIterator {
	public:
		/****************** Sweep_NumShapeIterator ******************/
		/**** md5 signature: d9b67541c7de3a516d27bcdf966a4fba ****/
		%feature("compactdefaultargs") Sweep_NumShapeIterator;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Sweep_NumShapeIterator;
		 Sweep_NumShapeIterator();

		/****************** Init ******************/
		/**** md5 signature: 9d541733c548a19a3e04659ced67dd20 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Resest the numshapeiterator on sub-shapes of <ashape>.

Parameters
----------
aShape: Sweep_NumShape

Returns
-------
None
") Init;
		void Init(const Sweep_NumShape & aShape);

		/****************** More ******************/
		/**** md5 signature: 6f6e915c9a3dca758c059d9e8af02dff ****/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Returns true if there is a current sub-shape.

Returns
-------
bool
") More;
		Standard_Boolean More();

		/****************** Next ******************/
		/**** md5 signature: f35c0df5f1d7c877986db18081404532 ****/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Moves to the next sub-shape.

Returns
-------
None
") Next;
		void Next();

		/****************** Orientation ******************/
		/**** md5 signature: 328242fe19b1f80489d8169681ebc029 ****/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "Returns the orientation of the current sub-shape.

Returns
-------
TopAbs_Orientation
") Orientation;
		TopAbs_Orientation Orientation();

		/****************** Value ******************/
		/**** md5 signature: d1e49624503396926cc40230ed2dfbe3 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the current sub-shape.

Returns
-------
Sweep_NumShape
") Value;
		const Sweep_NumShape & Value();

};


%extend Sweep_NumShapeIterator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class Sweep_NumShapeTool *
***************************/
class Sweep_NumShapeTool {
	public:
		/****************** Sweep_NumShapeTool ******************/
		/**** md5 signature: fb48864711b8ddb07ae4802ec0e00133 ****/
		%feature("compactdefaultargs") Sweep_NumShapeTool;
		%feature("autodoc", "Create a new numshapetool with <ashape>. the tool must prepare an indexation for all the subshapes of this shape.

Parameters
----------
aShape: Sweep_NumShape

Returns
-------
None
") Sweep_NumShapeTool;
		 Sweep_NumShapeTool(const Sweep_NumShape & aShape);

		/****************** FirstVertex ******************/
		/**** md5 signature: 7bebe6af1878ded198d7c439ee78197f ****/
		%feature("compactdefaultargs") FirstVertex;
		%feature("autodoc", "Returns the first vertex.

Returns
-------
Sweep_NumShape
") FirstVertex;
		Sweep_NumShape FirstVertex();

		/****************** HasFirstVertex ******************/
		/**** md5 signature: 106ce7f96fc5b1cd719e3bbdca47736a ****/
		%feature("compactdefaultargs") HasFirstVertex;
		%feature("autodoc", "Returns true if there is a first vertex in the shape.

Returns
-------
bool
") HasFirstVertex;
		Standard_Boolean HasFirstVertex();

		/****************** HasLastVertex ******************/
		/**** md5 signature: f4cf3374b365d7c0ae22d8b5d56f43ae ****/
		%feature("compactdefaultargs") HasLastVertex;
		%feature("autodoc", "Returns true if there is a last vertex in the shape.

Returns
-------
bool
") HasLastVertex;
		Standard_Boolean HasLastVertex();

		/****************** Index ******************/
		/**** md5 signature: d8d41f1e135100046f53349998fc4021 ****/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "Returns the index of <ashape>.

Parameters
----------
aShape: Sweep_NumShape

Returns
-------
int
") Index;
		Standard_Integer Index(const Sweep_NumShape & aShape);

		/****************** LastVertex ******************/
		/**** md5 signature: 42e8de781c32579a09b293ee5facf62b ****/
		%feature("compactdefaultargs") LastVertex;
		%feature("autodoc", "Returns the last vertex.

Returns
-------
Sweep_NumShape
") LastVertex;
		Sweep_NumShape LastVertex();

		/****************** NbShapes ******************/
		/**** md5 signature: ea90d1514db96ad18becf0e04a33abf6 ****/
		%feature("compactdefaultargs") NbShapes;
		%feature("autodoc", "Returns the number of subshapes in the shape.

Returns
-------
int
") NbShapes;
		Standard_Integer NbShapes();

		/****************** Orientation ******************/
		/**** md5 signature: 811407dea437ab8d2413d7000acad4f2 ****/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "Returns the orientation of <ashape>.

Parameters
----------
aShape: Sweep_NumShape

Returns
-------
TopAbs_Orientation
") Orientation;
		TopAbs_Orientation Orientation(const Sweep_NumShape & aShape);

		/****************** Shape ******************/
		/**** md5 signature: 93186f95d8445145d1155256dcdda14d ****/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "Returns the shape at index anindex.

Parameters
----------
anIndex: int

Returns
-------
Sweep_NumShape
") Shape;
		Sweep_NumShape Shape(const Standard_Integer anIndex);

		/****************** Type ******************/
		/**** md5 signature: 4d5de1a9527f334cac00917bb8d1e0da ****/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "Returns the type of <ashape>.

Parameters
----------
aShape: Sweep_NumShape

Returns
-------
TopAbs_ShapeEnum
") Type;
		TopAbs_ShapeEnum Type(const Sweep_NumShape & aShape);

};


%extend Sweep_NumShapeTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
