/*
Copyright 2008-2019 Thomas Paviot (tpaviot@gmail.com)

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
/* public enums */
/* end public enums declaration */

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
		/****************** BegInfinite ******************/
		%feature("compactdefaultargs") BegInfinite;
		%feature("autodoc", ":rtype: bool") BegInfinite;
		Standard_Boolean BegInfinite ();

		/****************** Closed ******************/
		%feature("compactdefaultargs") Closed;
		%feature("autodoc", ":rtype: bool") Closed;
		Standard_Boolean Closed ();

		/****************** EndInfinite ******************/
		%feature("compactdefaultargs") EndInfinite;
		%feature("autodoc", ":rtype: bool") EndInfinite;
		Standard_Boolean EndInfinite ();

		/****************** Index ******************/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", ":rtype: int") Index;
		Standard_Integer Index ();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Reinitialize a simple indexed edge. //! For an Edge : Index is the number of vertices (0, 1 or 2),Type is TopAbs_EDGE, Closed is true if it is a closed edge, BegInf is true if the Edge is infinite at the begenning, EndInf is true if the edge is infinite at the end. //! For a Vertex : Index is the index of the vertex in the edge (1 or 2), Type is TopAbsVERTEX, Closed is true if it is the vertex of a closed edge, all the other fields have no meanning.
	:param Index:
	:type Index: int
	:param Type:
	:type Type: TopAbs_ShapeEnum
	:param Closed: default value is Standard_False
	:type Closed: bool
	:param BegInf: default value is Standard_False
	:type BegInf: bool
	:param EndInf: default value is Standard_False
	:type EndInf: bool
	:rtype: None") Init;
		void Init (const Standard_Integer Index,const TopAbs_ShapeEnum Type,const Standard_Boolean Closed = Standard_False,const Standard_Boolean BegInf = Standard_False,const Standard_Boolean EndInf = Standard_False);

		/****************** Orientation ******************/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", ":rtype: TopAbs_Orientation") Orientation;
		TopAbs_Orientation Orientation ();

		/****************** Sweep_NumShape ******************/
		%feature("compactdefaultargs") Sweep_NumShape;
		%feature("autodoc", "* Creates a dummy indexed edge.
	:rtype: None") Sweep_NumShape;
		 Sweep_NumShape ();

		/****************** Sweep_NumShape ******************/
		%feature("compactdefaultargs") Sweep_NumShape;
		%feature("autodoc", "* Creates a new simple indexed edge. //! For an Edge : Index is the number of vertices (0, 1 or 2),Type is TopAbs_EDGE, Closed is true if it is a closed edge, BegInf is true if the Edge is infinite at the begenning, EndInf is true if the edge is infinite at the end. //! For a Vertex : Index is the index of the vertex in the edge (1 or 2), Type is TopAbsVERTEX, all the other fields have no meanning.
	:param Index:
	:type Index: int
	:param Type:
	:type Type: TopAbs_ShapeEnum
	:param Closed: default value is Standard_False
	:type Closed: bool
	:param BegInf: default value is Standard_False
	:type BegInf: bool
	:param EndInf: default value is Standard_False
	:type EndInf: bool
	:rtype: None") Sweep_NumShape;
		 Sweep_NumShape (const Standard_Integer Index,const TopAbs_ShapeEnum Type,const Standard_Boolean Closed = Standard_False,const Standard_Boolean BegInf = Standard_False,const Standard_Boolean EndInf = Standard_False);

		/****************** Type ******************/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", ":rtype: TopAbs_ShapeEnum") Type;
		TopAbs_ShapeEnum Type ();

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
		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "* Resest the NumShapeIterator on sub-shapes of <aShape>.
	:param aShape:
	:type aShape: Sweep_NumShape
	:rtype: None") Init;
		void Init (const Sweep_NumShape & aShape);

		/****************** More ******************/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "* Returns True if there is a current sub-shape.
	:rtype: bool") More;
		Standard_Boolean More ();

		/****************** Next ******************/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "* Moves to the next sub-shape.
	:rtype: None") Next;
		void Next ();

		/****************** Orientation ******************/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "* Returns the orientation of the current sub-shape.
	:rtype: TopAbs_Orientation") Orientation;
		TopAbs_Orientation Orientation ();

		/****************** Sweep_NumShapeIterator ******************/
		%feature("compactdefaultargs") Sweep_NumShapeIterator;
		%feature("autodoc", ":rtype: None") Sweep_NumShapeIterator;
		 Sweep_NumShapeIterator ();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* Returns the current sub-shape.
	:rtype: Sweep_NumShape") Value;
		const Sweep_NumShape & Value ();

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
		/****************** FirstVertex ******************/
		%feature("compactdefaultargs") FirstVertex;
		%feature("autodoc", "* Returns the first vertex.
	:rtype: Sweep_NumShape") FirstVertex;
		Sweep_NumShape FirstVertex ();

		/****************** HasFirstVertex ******************/
		%feature("compactdefaultargs") HasFirstVertex;
		%feature("autodoc", "* Returns true if there is a First Vertex in the Shape.
	:rtype: bool") HasFirstVertex;
		Standard_Boolean HasFirstVertex ();

		/****************** HasLastVertex ******************/
		%feature("compactdefaultargs") HasLastVertex;
		%feature("autodoc", "* Returns true if there is a Last Vertex in the Shape.
	:rtype: bool") HasLastVertex;
		Standard_Boolean HasLastVertex ();

		/****************** Index ******************/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "* Returns the index of <aShape>.
	:param aShape:
	:type aShape: Sweep_NumShape
	:rtype: int") Index;
		Standard_Integer Index (const Sweep_NumShape & aShape);

		/****************** LastVertex ******************/
		%feature("compactdefaultargs") LastVertex;
		%feature("autodoc", "* Returns the last vertex.
	:rtype: Sweep_NumShape") LastVertex;
		Sweep_NumShape LastVertex ();

		/****************** NbShapes ******************/
		%feature("compactdefaultargs") NbShapes;
		%feature("autodoc", "* Returns the number of subshapes in the shape.
	:rtype: int") NbShapes;
		Standard_Integer NbShapes ();

		/****************** Orientation ******************/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "* Returns the orientation of <aShape>.
	:param aShape:
	:type aShape: Sweep_NumShape
	:rtype: TopAbs_Orientation") Orientation;
		TopAbs_Orientation Orientation (const Sweep_NumShape & aShape);

		/****************** Shape ******************/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "* Returns the Shape at index anIndex
	:param anIndex:
	:type anIndex: int
	:rtype: Sweep_NumShape") Shape;
		Sweep_NumShape Shape (const Standard_Integer anIndex);

		/****************** Sweep_NumShapeTool ******************/
		%feature("compactdefaultargs") Sweep_NumShapeTool;
		%feature("autodoc", "* Create a new NumShapeTool with <aShape>. The Tool must prepare an indexation for all the subshapes of this shape.
	:param aShape:
	:type aShape: Sweep_NumShape
	:rtype: None") Sweep_NumShapeTool;
		 Sweep_NumShapeTool (const Sweep_NumShape & aShape);

		/****************** Type ******************/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "* Returns the type of <aShape>.
	:param aShape:
	:type aShape: Sweep_NumShape
	:rtype: TopAbs_ShapeEnum") Type;
		TopAbs_ShapeEnum Type (const Sweep_NumShape & aShape);

};


%extend Sweep_NumShapeTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
