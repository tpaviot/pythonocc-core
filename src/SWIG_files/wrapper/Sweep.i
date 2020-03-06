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
		%feature("compactdefaultargs") Sweep_NumShape;
		%feature("autodoc", "Creates a dummy indexed edge.

Returns
-------
None
") Sweep_NumShape;
		 Sweep_NumShape();

		/****************** Sweep_NumShape ******************/
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
		%feature("compactdefaultargs") BegInfinite;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") BegInfinite;
		Standard_Boolean BegInfinite();

		/****************** Closed ******************/
		%feature("compactdefaultargs") Closed;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") Closed;
		Standard_Boolean Closed();

		/****************** EndInfinite ******************/
		%feature("compactdefaultargs") EndInfinite;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") EndInfinite;
		Standard_Boolean EndInfinite();

		/****************** Index ******************/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") Index;
		Standard_Integer Index();

		/****************** Init ******************/
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
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "No available documentation.

Returns
-------
TopAbs_Orientation
") Orientation;
		TopAbs_Orientation Orientation();

		/****************** Type ******************/
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
		%feature("compactdefaultargs") Sweep_NumShapeIterator;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Sweep_NumShapeIterator;
		 Sweep_NumShapeIterator();

		/****************** Init ******************/
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
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Returns true if there is a current sub-shape.

Returns
-------
bool
") More;
		Standard_Boolean More();

		/****************** Next ******************/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Moves to the next sub-shape.

Returns
-------
None
") Next;
		void Next();

		/****************** Orientation ******************/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "Returns the orientation of the current sub-shape.

Returns
-------
TopAbs_Orientation
") Orientation;
		TopAbs_Orientation Orientation();

		/****************** Value ******************/
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
		%feature("compactdefaultargs") FirstVertex;
		%feature("autodoc", "Returns the first vertex.

Returns
-------
Sweep_NumShape
") FirstVertex;
		Sweep_NumShape FirstVertex();

		/****************** HasFirstVertex ******************/
		%feature("compactdefaultargs") HasFirstVertex;
		%feature("autodoc", "Returns true if there is a first vertex in the shape.

Returns
-------
bool
") HasFirstVertex;
		Standard_Boolean HasFirstVertex();

		/****************** HasLastVertex ******************/
		%feature("compactdefaultargs") HasLastVertex;
		%feature("autodoc", "Returns true if there is a last vertex in the shape.

Returns
-------
bool
") HasLastVertex;
		Standard_Boolean HasLastVertex();

		/****************** Index ******************/
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
		%feature("compactdefaultargs") LastVertex;
		%feature("autodoc", "Returns the last vertex.

Returns
-------
Sweep_NumShape
") LastVertex;
		Sweep_NumShape LastVertex();

		/****************** NbShapes ******************/
		%feature("compactdefaultargs") NbShapes;
		%feature("autodoc", "Returns the number of subshapes in the shape.

Returns
-------
int
") NbShapes;
		Standard_Integer NbShapes();

		/****************** Orientation ******************/
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
