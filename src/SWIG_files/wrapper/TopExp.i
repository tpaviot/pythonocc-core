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
%define TOPEXPDOCSTRING
"TopExp module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_topexp.html"
%enddef
%module (package="OCC.Core", docstring=TOPEXPDOCSTRING) TopExp


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
#include<TopExp_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TopoDS_module.hxx>
#include<TopAbs_module.hxx>
#include<TopTools_module.hxx>
#include<Message_module.hxx>
#include<TopLoc_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import TopoDS.i
%import TopAbs.i
%import TopTools.i

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
typedef TopoDS_Iterator * TopExp_Stack;
/* end typedefs declaration */

/***************
* class TopExp *
***************/
%rename(topexp) TopExp;
class TopExp {
	public:
		/****************** CommonVertex ******************/
		%feature("compactdefaultargs") CommonVertex;
		%feature("autodoc", "Finds the vertex <v> common to the two edges <e1,e2>, returns true if this vertex exists. //! warning: <v> has sense only if the value <true> is returned.

Parameters
----------
E1: TopoDS_Edge
E2: TopoDS_Edge
V: TopoDS_Vertex

Returns
-------
bool
") CommonVertex;
		static Standard_Boolean CommonVertex(const TopoDS_Edge & E1, const TopoDS_Edge & E2, TopoDS_Vertex & V);

		/****************** FirstVertex ******************/
		%feature("compactdefaultargs") FirstVertex;
		%feature("autodoc", "Returns the vertex of orientation forward in e. if there is none returns a null shape. cumori = true : taking account the edge orientation.

Parameters
----------
E: TopoDS_Edge
CumOri: bool,optional
	default value is Standard_False

Returns
-------
TopoDS_Vertex
") FirstVertex;
		static TopoDS_Vertex FirstVertex(const TopoDS_Edge & E, const Standard_Boolean CumOri = Standard_False);

		/****************** LastVertex ******************/
		%feature("compactdefaultargs") LastVertex;
		%feature("autodoc", "Returns the vertex of orientation reversed in e. if there is none returns a null shape. cumori = true : taking account the edge orientation.

Parameters
----------
E: TopoDS_Edge
CumOri: bool,optional
	default value is Standard_False

Returns
-------
TopoDS_Vertex
") LastVertex;
		static TopoDS_Vertex LastVertex(const TopoDS_Edge & E, const Standard_Boolean CumOri = Standard_False);

		/****************** MapShapes ******************/
		%feature("compactdefaultargs") MapShapes;
		%feature("autodoc", "Tool to explore a topological data structure. stores in the map <m> all the sub-shapes of <s> of type <t>. //! warning: the map is not cleared at first.

Parameters
----------
S: TopoDS_Shape
T: TopAbs_ShapeEnum
M: TopTools_IndexedMapOfShape

Returns
-------
None
") MapShapes;
		static void MapShapes(const TopoDS_Shape & S, const TopAbs_ShapeEnum T, TopTools_IndexedMapOfShape & M);

		/****************** MapShapes ******************/
		%feature("compactdefaultargs") MapShapes;
		%feature("autodoc", "Stores in the map <m> all the sub-shapes of <s>.

Parameters
----------
S: TopoDS_Shape
M: TopTools_IndexedMapOfShape

Returns
-------
None
") MapShapes;
		static void MapShapes(const TopoDS_Shape & S, TopTools_IndexedMapOfShape & M);

		/****************** MapShapes ******************/
		%feature("compactdefaultargs") MapShapes;
		%feature("autodoc", "Stores in the map <m> all the sub-shapes of <s>.

Parameters
----------
S: TopoDS_Shape
M: TopTools_MapOfShape

Returns
-------
None
") MapShapes;
		static void MapShapes(const TopoDS_Shape & S, TopTools_MapOfShape & M);

		/****************** MapShapesAndAncestors ******************/
		%feature("compactdefaultargs") MapShapesAndAncestors;
		%feature("autodoc", "Stores in the map <m> all the subshape of <s> of type <ts> for each one append to the list all the ancestors of type <ta>. for example map all the edges and bind the list of faces. warning: the map is not cleared at first.

Parameters
----------
S: TopoDS_Shape
TS: TopAbs_ShapeEnum
TA: TopAbs_ShapeEnum
M: TopTools_IndexedDataMapOfShapeListOfShape

Returns
-------
None
") MapShapesAndAncestors;
		static void MapShapesAndAncestors(const TopoDS_Shape & S, const TopAbs_ShapeEnum TS, const TopAbs_ShapeEnum TA, TopTools_IndexedDataMapOfShapeListOfShape & M);

		/****************** MapShapesAndUniqueAncestors ******************/
		%feature("compactdefaultargs") MapShapesAndUniqueAncestors;
		%feature("autodoc", "Stores in the map <m> all the subshape of <s> of type <ts> for each one append to the list all unique ancestors of type <ta>. for example map all the edges and bind the list of faces. useorientation = true : taking account the ancestor orientation warning: the map is not cleared at first.

Parameters
----------
S: TopoDS_Shape
TS: TopAbs_ShapeEnum
TA: TopAbs_ShapeEnum
M: TopTools_IndexedDataMapOfShapeListOfShape
useOrientation: bool,optional
	default value is Standard_False

Returns
-------
None
") MapShapesAndUniqueAncestors;
		static void MapShapesAndUniqueAncestors(const TopoDS_Shape & S, const TopAbs_ShapeEnum TS, const TopAbs_ShapeEnum TA, TopTools_IndexedDataMapOfShapeListOfShape & M, const Standard_Boolean useOrientation = Standard_False);

		/****************** Vertices ******************/
		%feature("compactdefaultargs") Vertices;
		%feature("autodoc", "Returns in vfirst, vlast the forward and reversed vertices of the edge <e>. may be null shapes. cumori = true : taking account the edge orientation.

Parameters
----------
E: TopoDS_Edge
Vfirst: TopoDS_Vertex
Vlast: TopoDS_Vertex
CumOri: bool,optional
	default value is Standard_False

Returns
-------
None
") Vertices;
		static void Vertices(const TopoDS_Edge & E, TopoDS_Vertex & Vfirst, TopoDS_Vertex & Vlast, const Standard_Boolean CumOri = Standard_False);

		/****************** Vertices ******************/
		%feature("compactdefaultargs") Vertices;
		%feature("autodoc", "Returns in vfirst, vlast the first and last vertices of the open wire <w>. may be null shapes. if <w> is closed vfirst and vlast are a same vertex on <w>. if <w> is no manifold. vfirst and vlast are null shapes.

Parameters
----------
W: TopoDS_Wire
Vfirst: TopoDS_Vertex
Vlast: TopoDS_Vertex

Returns
-------
None
") Vertices;
		static void Vertices(const TopoDS_Wire & W, TopoDS_Vertex & Vfirst, TopoDS_Vertex & Vlast);

};


%extend TopExp {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class TopExp_Explorer *
************************/
class TopExp_Explorer {
	public:
		/****************** TopExp_Explorer ******************/
		%feature("compactdefaultargs") TopExp_Explorer;
		%feature("autodoc", "Creates an empty explorer, becomes usefull after init.

Returns
-------
None
") TopExp_Explorer;
		 TopExp_Explorer();

		/****************** TopExp_Explorer ******************/
		%feature("compactdefaultargs") TopExp_Explorer;
		%feature("autodoc", "Creates an explorer on the shape <s>. //! <tofind> is the type of shapes to search. topabs_vertex, topabs_edge, ... //! <toavoid> is the type of shape to skip in the exploration. if <toavoid> is equal or less complex than <tofind> or if <toavoid> is shape it has no effect on the exploration.

Parameters
----------
S: TopoDS_Shape
ToFind: TopAbs_ShapeEnum
ToAvoid: TopAbs_ShapeEnum,optional
	default value is TopAbs_SHAPE

Returns
-------
None
") TopExp_Explorer;
		 TopExp_Explorer(const TopoDS_Shape & S, const TopAbs_ShapeEnum ToFind, const TopAbs_ShapeEnum ToAvoid = TopAbs_SHAPE);

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Clears the content of the explorer. it will return false on more().

Returns
-------
None
") Clear;
		void Clear();

		/****************** Current ******************/
		%feature("compactdefaultargs") Current;
		%feature("autodoc", "Returns the current shape in the exploration. exceptions standard_nosuchobject if this explorer has no more shapes to explore.

Returns
-------
TopoDS_Shape
") Current;
		const TopoDS_Shape Current();

		/****************** Depth ******************/
		%feature("compactdefaultargs") Depth;
		%feature("autodoc", "Returns the current depth of the exploration. 0 is the shape to explore itself.

Returns
-------
int
") Depth;
		Standard_Integer Depth();

		/****************** Destroy ******************/
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Destroy;
		void Destroy();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Resets this explorer on the shape s. it is initialized to search the shape s, for shapes of type tofind, that are not part of a shape toavoid. if the shape toavoid is equal to topabs_shape, or if it is the same as, or less complex than, the shape tofind it has no effect on the search.

Parameters
----------
S: TopoDS_Shape
ToFind: TopAbs_ShapeEnum
ToAvoid: TopAbs_ShapeEnum,optional
	default value is TopAbs_SHAPE

Returns
-------
None
") Init;
		void Init(const TopoDS_Shape & S, const TopAbs_ShapeEnum ToFind, const TopAbs_ShapeEnum ToAvoid = TopAbs_SHAPE);

		/****************** More ******************/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Returns true if there are more shapes in the exploration.

Returns
-------
bool
") More;
		Standard_Boolean More();

		/****************** Next ******************/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Moves to the next shape in the exploration. exceptions standard_nomoreobject if there are no more shapes to explore.

Returns
-------
None
") Next;
		void Next();

		/****************** ReInit ******************/
		%feature("compactdefaultargs") ReInit;
		%feature("autodoc", "Reinitialize the exploration with the original arguments.

Returns
-------
None
") ReInit;
		void ReInit();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the current shape in the exploration. exceptions standard_nosuchobject if this explorer has no more shapes to explore.

Returns
-------
TopoDS_Shape
") Value;
		const TopoDS_Shape Value();

};


%extend TopExp_Explorer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
