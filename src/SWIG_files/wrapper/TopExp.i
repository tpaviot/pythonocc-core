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
%define TOPEXPDOCSTRING
"TopExp module, see official documentation at
https://dev.opencascade.org/doc/occt-7.8.0/refman/html/package_topexp.html"
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
%include ../common/EnumTemplates.i
%include ../common/Operators.i
%include ../common/OccHandle.i
%include ../common/IOStream.i
%include ../common/ArrayMacros.i


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
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
/* end public enums declaration */

/* python proxy classes for enums */
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
		/****** TopExp::CommonVertex ******/
		/****** md5 signature: 988ba28b6b8eed9cf889373017dc105e ******/
		%feature("compactdefaultargs") CommonVertex;
		%feature("autodoc", "
Parameters
----------
E1: TopoDS_Edge
E2: TopoDS_Edge
V: TopoDS_Vertex

Return
-------
bool

Description
-----------
Finds the vertex <V> common to the two edges <E1,E2>, returns True if this vertex exists. //! Warning: <V> has sense only if the value <True> is returned.
") CommonVertex;
		static Standard_Boolean CommonVertex(const TopoDS_Edge & E1, const TopoDS_Edge & E2, TopoDS_Vertex & V);

		/****** TopExp::FirstVertex ******/
		/****** md5 signature: 1e3a778db1d24724585ef762df35b8da ******/
		%feature("compactdefaultargs") FirstVertex;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
CumOri: bool (optional, default to Standard_False)

Return
-------
TopoDS_Vertex

Description
-----------
Returns the Vertex of orientation FORWARD in E. If there is none returns a Null Shape. CumOri = True: taking account the edge orientation.
") FirstVertex;
		static TopoDS_Vertex FirstVertex(const TopoDS_Edge & E, const Standard_Boolean CumOri = Standard_False);

		/****** TopExp::LastVertex ******/
		/****** md5 signature: 04fb60a9260731d34a4cd1067f86b9c3 ******/
		%feature("compactdefaultargs") LastVertex;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
CumOri: bool (optional, default to Standard_False)

Return
-------
TopoDS_Vertex

Description
-----------
Returns the Vertex of orientation REVERSED in E. If there is none returns a Null Shape. CumOri = True: taking account the edge orientation.
") LastVertex;
		static TopoDS_Vertex LastVertex(const TopoDS_Edge & E, const Standard_Boolean CumOri = Standard_False);

		/****** TopExp::MapShapes ******/
		/****** md5 signature: 60bc2b4e0c9273357852c8e9beffdff3 ******/
		%feature("compactdefaultargs") MapShapes;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
T: TopAbs_ShapeEnum
M: TopTools_IndexedMapOfShape

Return
-------
None

Description
-----------
Tool to explore a topological data structure. Stores in the map <M> all the sub-shapes of <S> of type <T>. //! Warning: The map is not cleared at first.
") MapShapes;
		static void MapShapes(const TopoDS_Shape & S, const TopAbs_ShapeEnum T, TopTools_IndexedMapOfShape & M);

		/****** TopExp::MapShapes ******/
		/****** md5 signature: 8ad4c7fd7687fc41855cb624a1a10e23 ******/
		%feature("compactdefaultargs") MapShapes;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
M: TopTools_IndexedMapOfShape
cumOri: bool (optional, default to Standard_True)
cumLoc: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Stores in the map <M> all the sub-shapes of <S>. - If cumOri is true, the function composes all sub-shapes with the orientation of S. - If cumLoc is true, the function multiplies all sub-shapes by the location of S, i.e. it applies to each sub-shape the transformation that is associated with S.
") MapShapes;
		static void MapShapes(const TopoDS_Shape & S, TopTools_IndexedMapOfShape & M, const Standard_Boolean cumOri = Standard_True, const Standard_Boolean cumLoc = Standard_True);

		/****** TopExp::MapShapes ******/
		/****** md5 signature: 59a69a04bbcca596c45fa1794e17b17f ******/
		%feature("compactdefaultargs") MapShapes;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
M: TopTools_MapOfShape
cumOri: bool (optional, default to Standard_True)
cumLoc: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
Stores in the map <M> all the sub-shapes of <S>. - If cumOri is true, the function composes all sub-shapes with the orientation of S. - If cumLoc is true, the function multiplies all sub-shapes by the location of S, i.e. it applies to each sub-shape the transformation that is associated with S.
") MapShapes;
		static void MapShapes(const TopoDS_Shape & S, TopTools_MapOfShape & M, const Standard_Boolean cumOri = Standard_True, const Standard_Boolean cumLoc = Standard_True);

		/****** TopExp::MapShapesAndAncestors ******/
		/****** md5 signature: fc7e7494ab1de4025c967815075492e6 ******/
		%feature("compactdefaultargs") MapShapesAndAncestors;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
TS: TopAbs_ShapeEnum
TA: TopAbs_ShapeEnum
M: TopTools_IndexedDataMapOfShapeListOfShape

Return
-------
None

Description
-----------
Stores in the map <M> all the subshape of <S> of type <TS> for each one append to the list all the ancestors of type <TA>. For example map all the edges and bind the list of faces. Warning: The map is not cleared at first.
") MapShapesAndAncestors;
		static void MapShapesAndAncestors(const TopoDS_Shape & S, const TopAbs_ShapeEnum TS, const TopAbs_ShapeEnum TA, TopTools_IndexedDataMapOfShapeListOfShape & M);

		/****** TopExp::MapShapesAndUniqueAncestors ******/
		/****** md5 signature: f94b9653fca47c3f0b754b8acac0dde2 ******/
		%feature("compactdefaultargs") MapShapesAndUniqueAncestors;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
TS: TopAbs_ShapeEnum
TA: TopAbs_ShapeEnum
M: TopTools_IndexedDataMapOfShapeListOfShape
useOrientation: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Stores in the map <M> all the subshape of <S> of type <TS> for each one append to the list all unique ancestors of type <TA>. For example map all the edges and bind the list of faces. useOrientation = True: taking account the ancestor orientation Warning: The map is not cleared at first.
") MapShapesAndUniqueAncestors;
		static void MapShapesAndUniqueAncestors(const TopoDS_Shape & S, const TopAbs_ShapeEnum TS, const TopAbs_ShapeEnum TA, TopTools_IndexedDataMapOfShapeListOfShape & M, const Standard_Boolean useOrientation = Standard_False);

		/****** TopExp::Vertices ******/
		/****** md5 signature: a72e80c884bcaa3dda22157f5840ea7b ******/
		%feature("compactdefaultargs") Vertices;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
Vfirst: TopoDS_Vertex
Vlast: TopoDS_Vertex
CumOri: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
Returns in Vfirst, Vlast the FORWARD and REVERSED vertices of the edge <E>. May be null shapes. CumOri = True: taking account the edge orientation.
") Vertices;
		static void Vertices(const TopoDS_Edge & E, TopoDS_Vertex & Vfirst, TopoDS_Vertex & Vlast, const Standard_Boolean CumOri = Standard_False);

		/****** TopExp::Vertices ******/
		/****** md5 signature: 859807e2bbe069634fa97df162545baa ******/
		%feature("compactdefaultargs") Vertices;
		%feature("autodoc", "
Parameters
----------
W: TopoDS_Wire
Vfirst: TopoDS_Vertex
Vlast: TopoDS_Vertex

Return
-------
None

Description
-----------
Returns in Vfirst, Vlast the first and last vertices of the open wire <W>. May be null shapes. if <W> is closed Vfirst and Vlast are a same vertex on <W>. if <W> is no manifold. VFirst and VLast are null shapes.
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
		/****** TopExp_Explorer::TopExp_Explorer ******/
		/****** md5 signature: 114ebc7b26413ef0fdc8ef82c2742207 ******/
		%feature("compactdefaultargs") TopExp_Explorer;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates an empty explorer, becomes useful after Init.
") TopExp_Explorer;
		 TopExp_Explorer();

		/****** TopExp_Explorer::TopExp_Explorer ******/
		/****** md5 signature: 589f01dcb817bc2e0b8d8c5724883ba7 ******/
		%feature("compactdefaultargs") TopExp_Explorer;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
ToFind: TopAbs_ShapeEnum
ToAvoid: TopAbs_ShapeEnum (optional, default to TopAbs_SHAPE)

Return
-------
None

Description
-----------
Creates an Explorer on the Shape <S>. //! <ToFind> is the type of shapes to search. TopAbs_VERTEX, TopAbs_EDGE, ... //! <ToAvoid> is the type of shape to skip in the exploration. If <ToAvoid> is equal or less complex than <ToFind> or if <ToAVoid> is SHAPE it has no effect on the exploration.
") TopExp_Explorer;
		 TopExp_Explorer(const TopoDS_Shape & S, const TopAbs_ShapeEnum ToFind, const TopAbs_ShapeEnum ToAvoid = TopAbs_SHAPE);

		/****** TopExp_Explorer::Clear ******/
		/****** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clears the content of the explorer. It will return False on More().
") Clear;
		void Clear();

		/****** TopExp_Explorer::Current ******/
		/****** md5 signature: b191bf677bf7b52144f20d0821ea8f06 ******/
		%feature("compactdefaultargs") Current;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Returns the current shape in the exploration. Exceptions Standard_NoSuchObject if this explorer has no more shapes to explore.
") Current;
		const TopoDS_Shape Current();

		/****** TopExp_Explorer::Depth ******/
		/****** md5 signature: c4b1854410c3a66cc10b6255dc50b8fa ******/
		%feature("compactdefaultargs") Depth;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the current depth of the exploration. 0 is the shape to explore itself.
") Depth;
		Standard_Integer Depth();

		/****** TopExp_Explorer::ExploredShape ******/
		/****** md5 signature: c8a47d07240c1a2b5ff731be2f859ced ******/
		%feature("compactdefaultargs") ExploredShape;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Return explored shape.
") ExploredShape;
		const TopoDS_Shape ExploredShape();

		/****** TopExp_Explorer::Init ******/
		/****** md5 signature: 4f638c73ea412faa633dc32890a0e8ef ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
ToFind: TopAbs_ShapeEnum
ToAvoid: TopAbs_ShapeEnum (optional, default to TopAbs_SHAPE)

Return
-------
None

Description
-----------
Resets this explorer on the shape S. It is initialized to search the shape S, for shapes of type ToFind, that are not part of a shape ToAvoid. If the shape ToAvoid is equal to TopAbs_SHAPE, or if it is the same as, or less complex than, the shape ToFind it has no effect on the search.
") Init;
		void Init(const TopoDS_Shape & S, const TopAbs_ShapeEnum ToFind, const TopAbs_ShapeEnum ToAvoid = TopAbs_SHAPE);

		/****** TopExp_Explorer::More ******/
		/****** md5 signature: cff271d3b32940da94bada40648f9096 ******/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if there are more shapes in the exploration.
") More;
		Standard_Boolean More();

		/****** TopExp_Explorer::Next ******/
		/****** md5 signature: f35c0df5f1d7c877986db18081404532 ******/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Return
-------
None

Description
-----------
Moves to the next Shape in the exploration. Exceptions Standard_NoMoreObject if there are no more shapes to explore.
") Next;
		void Next();

		/****** TopExp_Explorer::ReInit ******/
		/****** md5 signature: fcda78d8b1268862e93fbb2cf6a2a652 ******/
		%feature("compactdefaultargs") ReInit;
		%feature("autodoc", "Return
-------
None

Description
-----------
Reinitialize the exploration with the original arguments.
") ReInit;
		void ReInit();

		/****** TopExp_Explorer::Value ******/
		/****** md5 signature: ebbff234a3094c505e960926e0773ed1 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
Returns the current shape in the exploration. Exceptions Standard_NoSuchObject if this explorer has no more shapes to explore.
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
/* class aliases */
%pythoncode {
}
/* deprecated methods */
%pythoncode {
@deprecated
def topexp_CommonVertex(*args):
	return topexp.CommonVertex(*args)

@deprecated
def topexp_FirstVertex(*args):
	return topexp.FirstVertex(*args)

@deprecated
def topexp_LastVertex(*args):
	return topexp.LastVertex(*args)

@deprecated
def topexp_MapShapes(*args):
	return topexp.MapShapes(*args)

@deprecated
def topexp_MapShapes(*args):
	return topexp.MapShapes(*args)

@deprecated
def topexp_MapShapes(*args):
	return topexp.MapShapes(*args)

@deprecated
def topexp_MapShapesAndAncestors(*args):
	return topexp.MapShapesAndAncestors(*args)

@deprecated
def topexp_MapShapesAndUniqueAncestors(*args):
	return topexp.MapShapesAndUniqueAncestors(*args)

@deprecated
def topexp_Vertices(*args):
	return topexp.Vertices(*args)

@deprecated
def topexp_Vertices(*args):
	return topexp.Vertices(*args)

}
