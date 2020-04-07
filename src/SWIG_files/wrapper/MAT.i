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
%define MATDOCSTRING
"MAT module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_mat.html"
%enddef
%module (package="OCC.Core", docstring=MATDOCSTRING) MAT


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
#include<MAT_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
enum MAT_Side {
	MAT_Left = 0,
	MAT_Right = 1,
};

/* end public enums declaration */

/* python proy classes for enums */
%pythoncode {

class MAT_Side(IntEnum):
	MAT_Left = 0
	MAT_Right = 1
MAT_Left = MAT_Side.MAT_Left
MAT_Right = MAT_Side.MAT_Right
};
/* end python proxy for enums */

/* handles */
%wrap_handle(MAT_Arc)
%wrap_handle(MAT_BasicElt)
%wrap_handle(MAT_Bisector)
%wrap_handle(MAT_Edge)
%wrap_handle(MAT_Graph)
%wrap_handle(MAT_ListOfBisector)
%wrap_handle(MAT_ListOfEdge)
%wrap_handle(MAT_Node)
%wrap_handle(MAT_TListNodeOfListOfBisector)
%wrap_handle(MAT_TListNodeOfListOfEdge)
%wrap_handle(MAT_Zone)
/* end handles declaration */

/* templates */
%template(MAT_DataMapOfIntegerArc) NCollection_DataMap<Standard_Integer,opencascade::handle<MAT_Arc>,TColStd_MapIntegerHasher>;

%extend NCollection_DataMap<Standard_Integer,opencascade::handle<MAT_Arc>,TColStd_MapIntegerHasher> {
    PyObject* Keys() {
        PyObject *l=PyList_New(0);
        for (MAT_DataMapOfIntegerArc::Iterator anIt1(*self); anIt1.More(); anIt1.Next()) {
          PyObject *o = PyLong_FromLong(anIt1.Key());
          PyList_Append(l, o);
          Py_DECREF(o);
        }
    return l;
    }
};
%template(MAT_DataMapOfIntegerBasicElt) NCollection_DataMap<Standard_Integer,opencascade::handle<MAT_BasicElt>,TColStd_MapIntegerHasher>;

%extend NCollection_DataMap<Standard_Integer,opencascade::handle<MAT_BasicElt>,TColStd_MapIntegerHasher> {
    PyObject* Keys() {
        PyObject *l=PyList_New(0);
        for (MAT_DataMapOfIntegerBasicElt::Iterator anIt1(*self); anIt1.More(); anIt1.Next()) {
          PyObject *o = PyLong_FromLong(anIt1.Key());
          PyList_Append(l, o);
          Py_DECREF(o);
        }
    return l;
    }
};
%template(MAT_DataMapOfIntegerBisector) NCollection_DataMap<Standard_Integer,opencascade::handle<MAT_Bisector>,TColStd_MapIntegerHasher>;

%extend NCollection_DataMap<Standard_Integer,opencascade::handle<MAT_Bisector>,TColStd_MapIntegerHasher> {
    PyObject* Keys() {
        PyObject *l=PyList_New(0);
        for (MAT_DataMapOfIntegerBisector::Iterator anIt1(*self); anIt1.More(); anIt1.Next()) {
          PyObject *o = PyLong_FromLong(anIt1.Key());
          PyList_Append(l, o);
          Py_DECREF(o);
        }
    return l;
    }
};
%template(MAT_DataMapOfIntegerNode) NCollection_DataMap<Standard_Integer,opencascade::handle<MAT_Node>,TColStd_MapIntegerHasher>;

%extend NCollection_DataMap<Standard_Integer,opencascade::handle<MAT_Node>,TColStd_MapIntegerHasher> {
    PyObject* Keys() {
        PyObject *l=PyList_New(0);
        for (MAT_DataMapOfIntegerNode::Iterator anIt1(*self); anIt1.More(); anIt1.Next()) {
          PyObject *o = PyLong_FromLong(anIt1.Key());
          PyList_Append(l, o);
          Py_DECREF(o);
        }
    return l;
    }
};
%template(MAT_SequenceOfArc) NCollection_Sequence<opencascade::handle<MAT_Arc>>;
%template(MAT_SequenceOfBasicElt) NCollection_Sequence<opencascade::handle<MAT_BasicElt>>;
/* end templates declaration */

/* typedefs */
typedef NCollection_DataMap<Standard_Integer, opencascade::handle<MAT_Arc>, TColStd_MapIntegerHasher>::Iterator MAT_DataMapIteratorOfDataMapOfIntegerArc;
typedef NCollection_DataMap<Standard_Integer, opencascade::handle<MAT_BasicElt>, TColStd_MapIntegerHasher>::Iterator MAT_DataMapIteratorOfDataMapOfIntegerBasicElt;
typedef NCollection_DataMap<Standard_Integer, opencascade::handle<MAT_Bisector>, TColStd_MapIntegerHasher>::Iterator MAT_DataMapIteratorOfDataMapOfIntegerBisector;
typedef NCollection_DataMap<Standard_Integer, opencascade::handle<MAT_Node>, TColStd_MapIntegerHasher>::Iterator MAT_DataMapIteratorOfDataMapOfIntegerNode;
typedef NCollection_DataMap<Standard_Integer, opencascade::handle<MAT_Arc>, TColStd_MapIntegerHasher> MAT_DataMapOfIntegerArc;
typedef NCollection_DataMap<Standard_Integer, opencascade::handle<MAT_BasicElt>, TColStd_MapIntegerHasher> MAT_DataMapOfIntegerBasicElt;
typedef NCollection_DataMap<Standard_Integer, opencascade::handle<MAT_Bisector>, TColStd_MapIntegerHasher> MAT_DataMapOfIntegerBisector;
typedef NCollection_DataMap<Standard_Integer, opencascade::handle<MAT_Node>, TColStd_MapIntegerHasher> MAT_DataMapOfIntegerNode;
typedef NCollection_Sequence<opencascade::handle<MAT_Arc>> MAT_SequenceOfArc;
typedef NCollection_Sequence<opencascade::handle<MAT_BasicElt>> MAT_SequenceOfBasicElt;
/* end typedefs declaration */

/****************
* class MAT_Arc *
****************/
class MAT_Arc : public Standard_Transient {
	public:
		/****************** MAT_Arc ******************/
		%feature("compactdefaultargs") MAT_Arc;
		%feature("autodoc", "No available documentation.

Parameters
----------
ArcIndex: int
GeomIndex: int
FirstElement: MAT_BasicElt
SecondElement: MAT_BasicElt

Returns
-------
None
") MAT_Arc;
		 MAT_Arc(const Standard_Integer ArcIndex, const Standard_Integer GeomIndex, const opencascade::handle<MAT_BasicElt> & FirstElement, const opencascade::handle<MAT_BasicElt> & SecondElement);

		/****************** FirstElement ******************/
		%feature("compactdefaultargs") FirstElement;
		%feature("autodoc", "Returns one of the basicelt equidistant from <self>.

Returns
-------
opencascade::handle<MAT_BasicElt>
") FirstElement;
		opencascade::handle<MAT_BasicElt> FirstElement();

		/****************** FirstNode ******************/
		%feature("compactdefaultargs") FirstNode;
		%feature("autodoc", "Returns one node extremity of <self>.

Returns
-------
opencascade::handle<MAT_Node>
") FirstNode;
		opencascade::handle<MAT_Node> FirstNode();

		/****************** GeomIndex ******************/
		%feature("compactdefaultargs") GeomIndex;
		%feature("autodoc", "Returns the index associated of the geometric representation of <self>.

Returns
-------
int
") GeomIndex;
		Standard_Integer GeomIndex();

		/****************** HasNeighbour ******************/
		%feature("compactdefaultargs") HasNeighbour;
		%feature("autodoc", "Returnst true is there is an arc linked to the node <anode> located on the side <aside> of <self>; if <anode> is not on <self>.

Parameters
----------
aNode: MAT_Node
aSide: MAT_Side

Returns
-------
bool
") HasNeighbour;
		Standard_Boolean HasNeighbour(const opencascade::handle<MAT_Node> & aNode, const MAT_Side aSide);

		/****************** Index ******************/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "Returns the index of <self> in graph.thearcs.

Returns
-------
int
") Index;
		Standard_Integer Index();

		/****************** Neighbour ******************/
		%feature("compactdefaultargs") Neighbour;
		%feature("autodoc", "Returns the first arc linked to the node <anode> located on the side <aside> of <self>; if hasneighbour() returns false.

Parameters
----------
aNode: MAT_Node
aSide: MAT_Side

Returns
-------
opencascade::handle<MAT_Arc>
") Neighbour;
		opencascade::handle<MAT_Arc> Neighbour(const opencascade::handle<MAT_Node> & aNode, const MAT_Side aSide);

		/****************** SecondElement ******************/
		%feature("compactdefaultargs") SecondElement;
		%feature("autodoc", "Returns the other basicelt equidistant from <self>.

Returns
-------
opencascade::handle<MAT_BasicElt>
") SecondElement;
		opencascade::handle<MAT_BasicElt> SecondElement();

		/****************** SecondNode ******************/
		%feature("compactdefaultargs") SecondNode;
		%feature("autodoc", "Returns the other node extremity of <self>.

Returns
-------
opencascade::handle<MAT_Node>
") SecondNode;
		opencascade::handle<MAT_Node> SecondNode();

		/****************** SetFirstArc ******************/
		%feature("compactdefaultargs") SetFirstArc;
		%feature("autodoc", "No available documentation.

Parameters
----------
aSide: MAT_Side
anArc: MAT_Arc

Returns
-------
None
") SetFirstArc;
		void SetFirstArc(const MAT_Side aSide, const opencascade::handle<MAT_Arc> & anArc);

		/****************** SetFirstElement ******************/
		%feature("compactdefaultargs") SetFirstElement;
		%feature("autodoc", "No available documentation.

Parameters
----------
aBasicElt: MAT_BasicElt

Returns
-------
None
") SetFirstElement;
		void SetFirstElement(const opencascade::handle<MAT_BasicElt> & aBasicElt);

		/****************** SetFirstNode ******************/
		%feature("compactdefaultargs") SetFirstNode;
		%feature("autodoc", "No available documentation.

Parameters
----------
aNode: MAT_Node

Returns
-------
None
") SetFirstNode;
		void SetFirstNode(const opencascade::handle<MAT_Node> & aNode);

		/****************** SetGeomIndex ******************/
		%feature("compactdefaultargs") SetGeomIndex;
		%feature("autodoc", "No available documentation.

Parameters
----------
anInteger: int

Returns
-------
None
") SetGeomIndex;
		void SetGeomIndex(const Standard_Integer anInteger);

		/****************** SetIndex ******************/
		%feature("compactdefaultargs") SetIndex;
		%feature("autodoc", "No available documentation.

Parameters
----------
anInteger: int

Returns
-------
None
") SetIndex;
		void SetIndex(const Standard_Integer anInteger);

		/****************** SetNeighbour ******************/
		%feature("compactdefaultargs") SetNeighbour;
		%feature("autodoc", "No available documentation.

Parameters
----------
aSide: MAT_Side
aNode: MAT_Node
anArc: MAT_Arc

Returns
-------
None
") SetNeighbour;
		void SetNeighbour(const MAT_Side aSide, const opencascade::handle<MAT_Node> & aNode, const opencascade::handle<MAT_Arc> & anArc);

		/****************** SetSecondArc ******************/
		%feature("compactdefaultargs") SetSecondArc;
		%feature("autodoc", "No available documentation.

Parameters
----------
aSide: MAT_Side
anArc: MAT_Arc

Returns
-------
None
") SetSecondArc;
		void SetSecondArc(const MAT_Side aSide, const opencascade::handle<MAT_Arc> & anArc);

		/****************** SetSecondElement ******************/
		%feature("compactdefaultargs") SetSecondElement;
		%feature("autodoc", "No available documentation.

Parameters
----------
aBasicElt: MAT_BasicElt

Returns
-------
None
") SetSecondElement;
		void SetSecondElement(const opencascade::handle<MAT_BasicElt> & aBasicElt);

		/****************** SetSecondNode ******************/
		%feature("compactdefaultargs") SetSecondNode;
		%feature("autodoc", "No available documentation.

Parameters
----------
aNode: MAT_Node

Returns
-------
None
") SetSecondNode;
		void SetSecondNode(const opencascade::handle<MAT_Node> & aNode);

		/****************** TheOtherNode ******************/
		%feature("compactdefaultargs") TheOtherNode;
		%feature("autodoc", "An arc has two node, if <anode> egal one returns the other. //! if <anode> is not oh <self>.

Parameters
----------
aNode: MAT_Node

Returns
-------
opencascade::handle<MAT_Node>
") TheOtherNode;
		opencascade::handle<MAT_Node> TheOtherNode(const opencascade::handle<MAT_Node> & aNode);

};


%make_alias(MAT_Arc)

%extend MAT_Arc {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************
* class MAT_BasicElt *
*********************/
class MAT_BasicElt : public Standard_Transient {
	public:
		/****************** MAT_BasicElt ******************/
		%feature("compactdefaultargs") MAT_BasicElt;
		%feature("autodoc", "Constructor, <aninteger> is the <index> of <self>.

Parameters
----------
anInteger: int

Returns
-------
None
") MAT_BasicElt;
		 MAT_BasicElt(const Standard_Integer anInteger);

		/****************** EndArc ******************/
		%feature("compactdefaultargs") EndArc;
		%feature("autodoc", "Return <endarcleft> or <endarcright> corresponding to <aside>.

Returns
-------
opencascade::handle<MAT_Arc>
") EndArc;
		opencascade::handle<MAT_Arc> EndArc();

		/****************** GeomIndex ******************/
		%feature("compactdefaultargs") GeomIndex;
		%feature("autodoc", "Return the <geomindex> of <self>.

Returns
-------
int
") GeomIndex;
		Standard_Integer GeomIndex();

		/****************** Index ******************/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "Return the <index> of <self> in graph.thebasicelts.

Returns
-------
int
") Index;
		Standard_Integer Index();

		/****************** SetEndArc ******************/
		%feature("compactdefaultargs") SetEndArc;
		%feature("autodoc", "No available documentation.

Parameters
----------
anArc: MAT_Arc

Returns
-------
None
") SetEndArc;
		void SetEndArc(const opencascade::handle<MAT_Arc> & anArc);

		/****************** SetGeomIndex ******************/
		%feature("compactdefaultargs") SetGeomIndex;
		%feature("autodoc", "No available documentation.

Parameters
----------
anInteger: int

Returns
-------
None
") SetGeomIndex;
		void SetGeomIndex(const Standard_Integer anInteger);

		/****************** SetIndex ******************/
		%feature("compactdefaultargs") SetIndex;
		%feature("autodoc", "No available documentation.

Parameters
----------
anInteger: int

Returns
-------
None
") SetIndex;
		void SetIndex(const Standard_Integer anInteger);

		/****************** SetStartArc ******************/
		%feature("compactdefaultargs") SetStartArc;
		%feature("autodoc", "No available documentation.

Parameters
----------
anArc: MAT_Arc

Returns
-------
None
") SetStartArc;
		void SetStartArc(const opencascade::handle<MAT_Arc> & anArc);

		/****************** StartArc ******************/
		%feature("compactdefaultargs") StartArc;
		%feature("autodoc", "Return <startarcleft> or <startarcright> corresponding to <aside>.

Returns
-------
opencascade::handle<MAT_Arc>
") StartArc;
		opencascade::handle<MAT_Arc> StartArc();

};


%make_alias(MAT_BasicElt)

%extend MAT_BasicElt {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************
* class MAT_Bisector *
*********************/
class MAT_Bisector : public Standard_Transient {
	public:
		/****************** MAT_Bisector ******************/
		%feature("compactdefaultargs") MAT_Bisector;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") MAT_Bisector;
		 MAT_Bisector();

		/****************** AddBisector ******************/
		%feature("compactdefaultargs") AddBisector;
		%feature("autodoc", "No available documentation.

Parameters
----------
abisector: MAT_Bisector

Returns
-------
None
") AddBisector;
		void AddBisector(const opencascade::handle<MAT_Bisector> & abisector);

		/****************** BisectorNumber ******************/
		%feature("compactdefaultargs") BisectorNumber;
		%feature("autodoc", "No available documentation.

Parameters
----------
anumber: int

Returns
-------
None
") BisectorNumber;
		void BisectorNumber(const Standard_Integer anumber);

		/****************** BisectorNumber ******************/
		%feature("compactdefaultargs") BisectorNumber;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") BisectorNumber;
		Standard_Integer BisectorNumber();

		/****************** DistIssuePoint ******************/
		%feature("compactdefaultargs") DistIssuePoint;
		%feature("autodoc", "No available documentation.

Parameters
----------
areal: float

Returns
-------
None
") DistIssuePoint;
		void DistIssuePoint(const Standard_Real areal);

		/****************** DistIssuePoint ******************/
		%feature("compactdefaultargs") DistIssuePoint;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") DistIssuePoint;
		Standard_Real DistIssuePoint();

		/****************** Dump ******************/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "No available documentation.

Parameters
----------
ashift: int
alevel: int

Returns
-------
None
") Dump;
		void Dump(const Standard_Integer ashift, const Standard_Integer alevel);

		/****************** EndPoint ******************/
		%feature("compactdefaultargs") EndPoint;
		%feature("autodoc", "No available documentation.

Parameters
----------
apoint: int

Returns
-------
None
") EndPoint;
		void EndPoint(const Standard_Integer apoint);

		/****************** EndPoint ******************/
		%feature("compactdefaultargs") EndPoint;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") EndPoint;
		Standard_Integer EndPoint();

		/****************** FirstBisector ******************/
		%feature("compactdefaultargs") FirstBisector;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<MAT_Bisector>
") FirstBisector;
		opencascade::handle<MAT_Bisector> FirstBisector();

		/****************** FirstEdge ******************/
		%feature("compactdefaultargs") FirstEdge;
		%feature("autodoc", "No available documentation.

Parameters
----------
anedge: MAT_Edge

Returns
-------
None
") FirstEdge;
		void FirstEdge(const opencascade::handle<MAT_Edge> & anedge);

		/****************** FirstEdge ******************/
		%feature("compactdefaultargs") FirstEdge;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<MAT_Edge>
") FirstEdge;
		opencascade::handle<MAT_Edge> FirstEdge();

		/****************** FirstParameter ******************/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "No available documentation.

Parameters
----------
aparameter: float

Returns
-------
None
") FirstParameter;
		void FirstParameter(const Standard_Real aparameter);

		/****************** FirstParameter ******************/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") FirstParameter;
		Standard_Real FirstParameter();

		/****************** FirstVector ******************/
		%feature("compactdefaultargs") FirstVector;
		%feature("autodoc", "No available documentation.

Parameters
----------
avector: int

Returns
-------
None
") FirstVector;
		void FirstVector(const Standard_Integer avector);

		/****************** FirstVector ******************/
		%feature("compactdefaultargs") FirstVector;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") FirstVector;
		Standard_Integer FirstVector();

		/****************** IndexNumber ******************/
		%feature("compactdefaultargs") IndexNumber;
		%feature("autodoc", "No available documentation.

Parameters
----------
anumber: int

Returns
-------
None
") IndexNumber;
		void IndexNumber(const Standard_Integer anumber);

		/****************** IndexNumber ******************/
		%feature("compactdefaultargs") IndexNumber;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") IndexNumber;
		Standard_Integer IndexNumber();

		/****************** IssuePoint ******************/
		%feature("compactdefaultargs") IssuePoint;
		%feature("autodoc", "No available documentation.

Parameters
----------
apoint: int

Returns
-------
None
") IssuePoint;
		void IssuePoint(const Standard_Integer apoint);

		/****************** IssuePoint ******************/
		%feature("compactdefaultargs") IssuePoint;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") IssuePoint;
		Standard_Integer IssuePoint();

		/****************** LastBisector ******************/
		%feature("compactdefaultargs") LastBisector;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<MAT_Bisector>
") LastBisector;
		opencascade::handle<MAT_Bisector> LastBisector();

		/****************** List ******************/
		%feature("compactdefaultargs") List;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<MAT_ListOfBisector>
") List;
		opencascade::handle<MAT_ListOfBisector> List();

		/****************** SecondEdge ******************/
		%feature("compactdefaultargs") SecondEdge;
		%feature("autodoc", "No available documentation.

Parameters
----------
anedge: MAT_Edge

Returns
-------
None
") SecondEdge;
		void SecondEdge(const opencascade::handle<MAT_Edge> & anedge);

		/****************** SecondEdge ******************/
		%feature("compactdefaultargs") SecondEdge;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<MAT_Edge>
") SecondEdge;
		opencascade::handle<MAT_Edge> SecondEdge();

		/****************** SecondParameter ******************/
		%feature("compactdefaultargs") SecondParameter;
		%feature("autodoc", "No available documentation.

Parameters
----------
aparameter: float

Returns
-------
None
") SecondParameter;
		void SecondParameter(const Standard_Real aparameter);

		/****************** SecondParameter ******************/
		%feature("compactdefaultargs") SecondParameter;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") SecondParameter;
		Standard_Real SecondParameter();

		/****************** SecondVector ******************/
		%feature("compactdefaultargs") SecondVector;
		%feature("autodoc", "No available documentation.

Parameters
----------
avector: int

Returns
-------
None
") SecondVector;
		void SecondVector(const Standard_Integer avector);

		/****************** SecondVector ******************/
		%feature("compactdefaultargs") SecondVector;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") SecondVector;
		Standard_Integer SecondVector();

		/****************** Sense ******************/
		%feature("compactdefaultargs") Sense;
		%feature("autodoc", "No available documentation.

Parameters
----------
asense: float

Returns
-------
None
") Sense;
		void Sense(const Standard_Real asense);

		/****************** Sense ******************/
		%feature("compactdefaultargs") Sense;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Sense;
		Standard_Real Sense();

};


%make_alias(MAT_Bisector)

%extend MAT_Bisector {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************
* class MAT_Edge *
*****************/
class MAT_Edge : public Standard_Transient {
	public:
		/****************** MAT_Edge ******************/
		%feature("compactdefaultargs") MAT_Edge;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") MAT_Edge;
		 MAT_Edge();

		/****************** Distance ******************/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "No available documentation.

Parameters
----------
adistance: float

Returns
-------
None
") Distance;
		void Distance(const Standard_Real adistance);

		/****************** Distance ******************/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Distance;
		Standard_Real Distance();

		/****************** Dump ******************/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "No available documentation.

Parameters
----------
ashift: int
alevel: int

Returns
-------
None
") Dump;
		void Dump(const Standard_Integer ashift, const Standard_Integer alevel);

		/****************** EdgeNumber ******************/
		%feature("compactdefaultargs") EdgeNumber;
		%feature("autodoc", "No available documentation.

Parameters
----------
anumber: int

Returns
-------
None
") EdgeNumber;
		void EdgeNumber(const Standard_Integer anumber);

		/****************** EdgeNumber ******************/
		%feature("compactdefaultargs") EdgeNumber;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") EdgeNumber;
		Standard_Integer EdgeNumber();

		/****************** FirstBisector ******************/
		%feature("compactdefaultargs") FirstBisector;
		%feature("autodoc", "No available documentation.

Parameters
----------
abisector: MAT_Bisector

Returns
-------
None
") FirstBisector;
		void FirstBisector(const opencascade::handle<MAT_Bisector> & abisector);

		/****************** FirstBisector ******************/
		%feature("compactdefaultargs") FirstBisector;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<MAT_Bisector>
") FirstBisector;
		opencascade::handle<MAT_Bisector> FirstBisector();

		/****************** IntersectionPoint ******************/
		%feature("compactdefaultargs") IntersectionPoint;
		%feature("autodoc", "No available documentation.

Parameters
----------
apoint: int

Returns
-------
None
") IntersectionPoint;
		void IntersectionPoint(const Standard_Integer apoint);

		/****************** IntersectionPoint ******************/
		%feature("compactdefaultargs") IntersectionPoint;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") IntersectionPoint;
		Standard_Integer IntersectionPoint();

		/****************** SecondBisector ******************/
		%feature("compactdefaultargs") SecondBisector;
		%feature("autodoc", "No available documentation.

Parameters
----------
abisector: MAT_Bisector

Returns
-------
None
") SecondBisector;
		void SecondBisector(const opencascade::handle<MAT_Bisector> & abisector);

		/****************** SecondBisector ******************/
		%feature("compactdefaultargs") SecondBisector;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<MAT_Bisector>
") SecondBisector;
		opencascade::handle<MAT_Bisector> SecondBisector();

};


%make_alias(MAT_Edge)

%extend MAT_Edge {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************
* class MAT_Graph *
******************/
class MAT_Graph : public Standard_Transient {
	public:
		/****************** MAT_Graph ******************/
		%feature("compactdefaultargs") MAT_Graph;
		%feature("autodoc", "Empty constructor.

Returns
-------
None
") MAT_Graph;
		 MAT_Graph();

		/****************** Arc ******************/
		%feature("compactdefaultargs") Arc;
		%feature("autodoc", "Return the arc of index <index> in <thearcs>.

Parameters
----------
Index: int

Returns
-------
opencascade::handle<MAT_Arc>
") Arc;
		opencascade::handle<MAT_Arc> Arc(const Standard_Integer Index);

		/****************** BasicElt ******************/
		%feature("compactdefaultargs") BasicElt;
		%feature("autodoc", "Return the basicelt of index <index> in <thebasicelts>.

Parameters
----------
Index: int

Returns
-------
opencascade::handle<MAT_BasicElt>
") BasicElt;
		opencascade::handle<MAT_BasicElt> BasicElt(const Standard_Integer Index);

		/****************** ChangeBasicElt ******************/
		%feature("compactdefaultargs") ChangeBasicElt;
		%feature("autodoc", "No available documentation.

Parameters
----------
Index: int

Returns
-------
opencascade::handle<MAT_BasicElt>
") ChangeBasicElt;
		opencascade::handle<MAT_BasicElt> ChangeBasicElt(const Standard_Integer Index);

		/****************** ChangeBasicElts ******************/
		%feature("compactdefaultargs") ChangeBasicElts;
		%feature("autodoc", "No available documentation.

Parameters
----------
NewMap: MAT_DataMapOfIntegerBasicElt

Returns
-------
None
") ChangeBasicElts;
		void ChangeBasicElts(const MAT_DataMapOfIntegerBasicElt & NewMap);

		/****************** CompactArcs ******************/
		%feature("compactdefaultargs") CompactArcs;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") CompactArcs;
		void CompactArcs();

		/****************** CompactNodes ******************/
		%feature("compactdefaultargs") CompactNodes;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") CompactNodes;
		void CompactNodes();

		/****************** FusionOfBasicElts ******************/
		%feature("compactdefaultargs") FusionOfBasicElts;
		%feature("autodoc", "Merge two basicelts. the end of the basicelt elt1 of indexelt1 becomes the end of the basicelt elt2 of indexelt2. elt2 is replaced in the arcs by elt1, elt2 is eliminated. //! <mergearc1> is true if the fusion of the basicelts => a fusion of two arcs which separated the same elements. in this case <geomindexarc1> and <geomindexarc2> are the geometric index of this arcs. //! if the basicelt corresponds to a close line , the startarc and the endarc of elt1 can separate the same elements . in this case there is a fusion of this arcs, <mergearc2> is true and <geomindexarc3> and <geomindexarc4> are the geometric index of this arcs.

Parameters
----------
IndexElt1: int
IndexElt2: int

Returns
-------
MergeArc1: bool
GeomIndexArc1: int
GeomIndexArc2: int
MergeArc2: bool
GeomIndexArc3: int
GeomIndexArc4: int
") FusionOfBasicElts;
		void FusionOfBasicElts(const Standard_Integer IndexElt1, const Standard_Integer IndexElt2, Standard_Boolean &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Boolean &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** Node ******************/
		%feature("compactdefaultargs") Node;
		%feature("autodoc", "Return the node of index <index> in <thenodes>.

Parameters
----------
Index: int

Returns
-------
opencascade::handle<MAT_Node>
") Node;
		opencascade::handle<MAT_Node> Node(const Standard_Integer Index);

		/****************** NumberOfArcs ******************/
		%feature("compactdefaultargs") NumberOfArcs;
		%feature("autodoc", "Return the number of arcs of <self>.

Returns
-------
int
") NumberOfArcs;
		Standard_Integer NumberOfArcs();

		/****************** NumberOfBasicElts ******************/
		%feature("compactdefaultargs") NumberOfBasicElts;
		%feature("autodoc", "Return the number of basic elements of <self>.

Returns
-------
int
") NumberOfBasicElts;
		Standard_Integer NumberOfBasicElts();

		/****************** NumberOfInfiniteNodes ******************/
		%feature("compactdefaultargs") NumberOfInfiniteNodes;
		%feature("autodoc", "Return the number of infinites nodes of <self>.

Returns
-------
int
") NumberOfInfiniteNodes;
		Standard_Integer NumberOfInfiniteNodes();

		/****************** NumberOfNodes ******************/
		%feature("compactdefaultargs") NumberOfNodes;
		%feature("autodoc", "Return the number of nodes of <self>.

Returns
-------
int
") NumberOfNodes;
		Standard_Integer NumberOfNodes();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Construct <self> from the result of the method <createmat> of the class <mat> from <mat>. //! <semiinfinite> : if some bisector are infinites. <theroots> : set of the bisectors. <nbbasicelts> : number of basic elements. <nbarcs> : number of arcs = number of bisectors.

Parameters
----------
SemiInfinite: bool
TheRoots: MAT_ListOfBisector
NbBasicElts: int
NbArcs: int

Returns
-------
None
") Perform;
		void Perform(const Standard_Boolean SemiInfinite, const opencascade::handle<MAT_ListOfBisector> & TheRoots, const Standard_Integer NbBasicElts, const Standard_Integer NbArcs);

};


%make_alias(MAT_Graph)

%extend MAT_Graph {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class MAT_ListOfBisector *
***************************/
class MAT_ListOfBisector : public Standard_Transient {
	public:
		/****************** MAT_ListOfBisector ******************/
		%feature("compactdefaultargs") MAT_ListOfBisector;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") MAT_ListOfBisector;
		 MAT_ListOfBisector();

		/****************** BackAdd ******************/
		%feature("compactdefaultargs") BackAdd;
		%feature("autodoc", "No available documentation.

Parameters
----------
anitem: MAT_Bisector

Returns
-------
None
") BackAdd;
		void BackAdd(const opencascade::handle<MAT_Bisector> & anitem);

		/****************** Brackets ******************/
		%feature("compactdefaultargs") Brackets;
		%feature("autodoc", "No available documentation.

Parameters
----------
anindex: int

Returns
-------
opencascade::handle<MAT_Bisector>
") Brackets;
		opencascade::handle<MAT_Bisector> Brackets(const Standard_Integer anindex);

		/****************** Current ******************/
		%feature("compactdefaultargs") Current;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<MAT_Bisector>
") Current;
		opencascade::handle<MAT_Bisector> Current();

		/****************** Current ******************/
		%feature("compactdefaultargs") Current;
		%feature("autodoc", "No available documentation.

Parameters
----------
anitem: MAT_Bisector

Returns
-------
None
") Current;
		void Current(const opencascade::handle<MAT_Bisector> & anitem);

		/****************** Dump ******************/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "No available documentation.

Parameters
----------
ashift: int
alevel: int

Returns
-------
None
") Dump;
		void Dump(const Standard_Integer ashift, const Standard_Integer alevel);

		/****************** First ******************/
		%feature("compactdefaultargs") First;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") First;
		void First();

		/****************** FirstItem ******************/
		%feature("compactdefaultargs") FirstItem;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<MAT_Bisector>
") FirstItem;
		opencascade::handle<MAT_Bisector> FirstItem();

		/****************** FrontAdd ******************/
		%feature("compactdefaultargs") FrontAdd;
		%feature("autodoc", "No available documentation.

Parameters
----------
anitem: MAT_Bisector

Returns
-------
None
") FrontAdd;
		void FrontAdd(const opencascade::handle<MAT_Bisector> & anitem);

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
		%feature("autodoc", "No available documentation.

Parameters
----------
aniten: MAT_Bisector

Returns
-------
None
") Init;
		void Init(const opencascade::handle<MAT_Bisector> & aniten);

		/****************** IsEmpty ******************/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsEmpty;
		Standard_Boolean IsEmpty();

		/****************** Last ******************/
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Last;
		void Last();

		/****************** LastItem ******************/
		%feature("compactdefaultargs") LastItem;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<MAT_Bisector>
") LastItem;
		opencascade::handle<MAT_Bisector> LastItem();

		/****************** LinkAfter ******************/
		%feature("compactdefaultargs") LinkAfter;
		%feature("autodoc", "No available documentation.

Parameters
----------
anitem: MAT_Bisector

Returns
-------
None
") LinkAfter;
		void LinkAfter(const opencascade::handle<MAT_Bisector> & anitem);

		/****************** LinkBefore ******************/
		%feature("compactdefaultargs") LinkBefore;
		%feature("autodoc", "No available documentation.

Parameters
----------
anitem: MAT_Bisector

Returns
-------
None
") LinkBefore;
		void LinkBefore(const opencascade::handle<MAT_Bisector> & anitem);

		/****************** Loop ******************/
		%feature("compactdefaultargs") Loop;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Loop;
		void Loop();

		/****************** More ******************/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") More;
		Standard_Boolean More();

		/****************** Next ******************/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Next;
		void Next();

		/****************** NextItem ******************/
		%feature("compactdefaultargs") NextItem;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<MAT_Bisector>
") NextItem;
		opencascade::handle<MAT_Bisector> NextItem();

		/****************** Number ******************/
		%feature("compactdefaultargs") Number;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") Number;
		Standard_Integer Number();

		/****************** Permute ******************/
		%feature("compactdefaultargs") Permute;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Permute;
		void Permute();

		/****************** Previous ******************/
		%feature("compactdefaultargs") Previous;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Previous;
		void Previous();

		/****************** PreviousItem ******************/
		%feature("compactdefaultargs") PreviousItem;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<MAT_Bisector>
") PreviousItem;
		opencascade::handle<MAT_Bisector> PreviousItem();

		/****************** Unlink ******************/
		%feature("compactdefaultargs") Unlink;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Unlink;
		void Unlink();

};


%make_alias(MAT_ListOfBisector)

%extend MAT_ListOfBisector {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class MAT_ListOfEdge *
***********************/
class MAT_ListOfEdge : public Standard_Transient {
	public:
		/****************** MAT_ListOfEdge ******************/
		%feature("compactdefaultargs") MAT_ListOfEdge;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") MAT_ListOfEdge;
		 MAT_ListOfEdge();

		/****************** BackAdd ******************/
		%feature("compactdefaultargs") BackAdd;
		%feature("autodoc", "No available documentation.

Parameters
----------
anitem: MAT_Edge

Returns
-------
None
") BackAdd;
		void BackAdd(const opencascade::handle<MAT_Edge> & anitem);

		/****************** Brackets ******************/
		%feature("compactdefaultargs") Brackets;
		%feature("autodoc", "No available documentation.

Parameters
----------
anindex: int

Returns
-------
opencascade::handle<MAT_Edge>
") Brackets;
		opencascade::handle<MAT_Edge> Brackets(const Standard_Integer anindex);

		/****************** Current ******************/
		%feature("compactdefaultargs") Current;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<MAT_Edge>
") Current;
		opencascade::handle<MAT_Edge> Current();

		/****************** Current ******************/
		%feature("compactdefaultargs") Current;
		%feature("autodoc", "No available documentation.

Parameters
----------
anitem: MAT_Edge

Returns
-------
None
") Current;
		void Current(const opencascade::handle<MAT_Edge> & anitem);

		/****************** Dump ******************/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "No available documentation.

Parameters
----------
ashift: int
alevel: int

Returns
-------
None
") Dump;
		void Dump(const Standard_Integer ashift, const Standard_Integer alevel);

		/****************** First ******************/
		%feature("compactdefaultargs") First;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") First;
		void First();

		/****************** FirstItem ******************/
		%feature("compactdefaultargs") FirstItem;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<MAT_Edge>
") FirstItem;
		opencascade::handle<MAT_Edge> FirstItem();

		/****************** FrontAdd ******************/
		%feature("compactdefaultargs") FrontAdd;
		%feature("autodoc", "No available documentation.

Parameters
----------
anitem: MAT_Edge

Returns
-------
None
") FrontAdd;
		void FrontAdd(const opencascade::handle<MAT_Edge> & anitem);

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
		%feature("autodoc", "No available documentation.

Parameters
----------
aniten: MAT_Edge

Returns
-------
None
") Init;
		void Init(const opencascade::handle<MAT_Edge> & aniten);

		/****************** IsEmpty ******************/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsEmpty;
		Standard_Boolean IsEmpty();

		/****************** Last ******************/
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Last;
		void Last();

		/****************** LastItem ******************/
		%feature("compactdefaultargs") LastItem;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<MAT_Edge>
") LastItem;
		opencascade::handle<MAT_Edge> LastItem();

		/****************** LinkAfter ******************/
		%feature("compactdefaultargs") LinkAfter;
		%feature("autodoc", "No available documentation.

Parameters
----------
anitem: MAT_Edge

Returns
-------
None
") LinkAfter;
		void LinkAfter(const opencascade::handle<MAT_Edge> & anitem);

		/****************** LinkBefore ******************/
		%feature("compactdefaultargs") LinkBefore;
		%feature("autodoc", "No available documentation.

Parameters
----------
anitem: MAT_Edge

Returns
-------
None
") LinkBefore;
		void LinkBefore(const opencascade::handle<MAT_Edge> & anitem);

		/****************** Loop ******************/
		%feature("compactdefaultargs") Loop;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Loop;
		void Loop();

		/****************** More ******************/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") More;
		Standard_Boolean More();

		/****************** Next ******************/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Next;
		void Next();

		/****************** NextItem ******************/
		%feature("compactdefaultargs") NextItem;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<MAT_Edge>
") NextItem;
		opencascade::handle<MAT_Edge> NextItem();

		/****************** Number ******************/
		%feature("compactdefaultargs") Number;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") Number;
		Standard_Integer Number();

		/****************** Permute ******************/
		%feature("compactdefaultargs") Permute;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Permute;
		void Permute();

		/****************** Previous ******************/
		%feature("compactdefaultargs") Previous;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Previous;
		void Previous();

		/****************** PreviousItem ******************/
		%feature("compactdefaultargs") PreviousItem;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<MAT_Edge>
") PreviousItem;
		opencascade::handle<MAT_Edge> PreviousItem();

		/****************** Unlink ******************/
		%feature("compactdefaultargs") Unlink;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Unlink;
		void Unlink();

};


%make_alias(MAT_ListOfEdge)

%extend MAT_ListOfEdge {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************
* class MAT_Node *
*****************/
class MAT_Node : public Standard_Transient {
	public:
		/****************** MAT_Node ******************/
		%feature("compactdefaultargs") MAT_Node;
		%feature("autodoc", "No available documentation.

Parameters
----------
GeomIndex: int
LinkedArc: MAT_Arc
Distance: float

Returns
-------
None
") MAT_Node;
		 MAT_Node(const Standard_Integer GeomIndex, const opencascade::handle<MAT_Arc> & LinkedArc, const Standard_Real Distance);

		/****************** Distance ******************/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Distance;
		Standard_Real Distance();

		/****************** GeomIndex ******************/
		%feature("compactdefaultargs") GeomIndex;
		%feature("autodoc", "Returns the index associated of the geometric representation of <self>.

Returns
-------
int
") GeomIndex;
		Standard_Integer GeomIndex();

		/****************** Index ******************/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "Returns the index associated of the node.

Returns
-------
int
") Index;
		Standard_Integer Index();

		/****************** Infinite ******************/
		%feature("compactdefaultargs") Infinite;
		%feature("autodoc", "Returns true if the distance of <self> is infinite.

Returns
-------
bool
") Infinite;
		Standard_Boolean Infinite();

		/****************** LinkedArcs ******************/
		%feature("compactdefaultargs") LinkedArcs;
		%feature("autodoc", "Returns in <s> the arcs linked to <self>.

Parameters
----------
S: MAT_SequenceOfArc

Returns
-------
None
") LinkedArcs;
		void LinkedArcs(MAT_SequenceOfArc & S);

		/****************** NearElts ******************/
		%feature("compactdefaultargs") NearElts;
		%feature("autodoc", "Returns in <s> the basicelts equidistant to <self>.

Parameters
----------
S: MAT_SequenceOfBasicElt

Returns
-------
None
") NearElts;
		void NearElts(MAT_SequenceOfBasicElt & S);

		/****************** OnBasicElt ******************/
		%feature("compactdefaultargs") OnBasicElt;
		%feature("autodoc", "Returns true if <self> belongs to the figure.

Returns
-------
bool
") OnBasicElt;
		Standard_Boolean OnBasicElt();

		/****************** PendingNode ******************/
		%feature("compactdefaultargs") PendingNode;
		%feature("autodoc", "Returns true if <self> is a pending node. (ie : the number of arc linked = 1).

Returns
-------
bool
") PendingNode;
		Standard_Boolean PendingNode();

		/****************** SetIndex ******************/
		%feature("compactdefaultargs") SetIndex;
		%feature("autodoc", "Set the index associated of the node.

Parameters
----------
anIndex: int

Returns
-------
None
") SetIndex;
		void SetIndex(const Standard_Integer anIndex);

		/****************** SetLinkedArc ******************/
		%feature("compactdefaultargs") SetLinkedArc;
		%feature("autodoc", "No available documentation.

Parameters
----------
anArc: MAT_Arc

Returns
-------
None
") SetLinkedArc;
		void SetLinkedArc(const opencascade::handle<MAT_Arc> & anArc);

};


%make_alias(MAT_Node)

%extend MAT_Node {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class MAT_TListNodeOfListOfBisector *
**************************************/
class MAT_TListNodeOfListOfBisector : public Standard_Transient {
	public:
		/****************** MAT_TListNodeOfListOfBisector ******************/
		%feature("compactdefaultargs") MAT_TListNodeOfListOfBisector;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") MAT_TListNodeOfListOfBisector;
		 MAT_TListNodeOfListOfBisector();

		/****************** MAT_TListNodeOfListOfBisector ******************/
		%feature("compactdefaultargs") MAT_TListNodeOfListOfBisector;
		%feature("autodoc", "No available documentation.

Parameters
----------
anitem: MAT_Bisector

Returns
-------
None
") MAT_TListNodeOfListOfBisector;
		 MAT_TListNodeOfListOfBisector(const opencascade::handle<MAT_Bisector> & anitem);

		/****************** Dummy ******************/
		%feature("compactdefaultargs") Dummy;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Dummy;
		void Dummy();

		/****************** GetItem ******************/
		%feature("compactdefaultargs") GetItem;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<MAT_Bisector>
") GetItem;
		opencascade::handle<MAT_Bisector> GetItem();

		/****************** Next ******************/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<MAT_TListNodeOfListOfBisector>
") Next;
		opencascade::handle<MAT_TListNodeOfListOfBisector> Next();

		/****************** Next ******************/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "No available documentation.

Parameters
----------
atlistnode: MAT_TListNodeOfListOfBisector

Returns
-------
None
") Next;
		void Next(const opencascade::handle<MAT_TListNodeOfListOfBisector> & atlistnode);

		/****************** Previous ******************/
		%feature("compactdefaultargs") Previous;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<MAT_TListNodeOfListOfBisector>
") Previous;
		opencascade::handle<MAT_TListNodeOfListOfBisector> Previous();

		/****************** Previous ******************/
		%feature("compactdefaultargs") Previous;
		%feature("autodoc", "No available documentation.

Parameters
----------
atlistnode: MAT_TListNodeOfListOfBisector

Returns
-------
None
") Previous;
		void Previous(const opencascade::handle<MAT_TListNodeOfListOfBisector> & atlistnode);

		/****************** SetItem ******************/
		%feature("compactdefaultargs") SetItem;
		%feature("autodoc", "No available documentation.

Parameters
----------
anitem: MAT_Bisector

Returns
-------
None
") SetItem;
		void SetItem(const opencascade::handle<MAT_Bisector> & anitem);

};


%make_alias(MAT_TListNodeOfListOfBisector)

%extend MAT_TListNodeOfListOfBisector {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class MAT_TListNodeOfListOfEdge *
**********************************/
class MAT_TListNodeOfListOfEdge : public Standard_Transient {
	public:
		/****************** MAT_TListNodeOfListOfEdge ******************/
		%feature("compactdefaultargs") MAT_TListNodeOfListOfEdge;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") MAT_TListNodeOfListOfEdge;
		 MAT_TListNodeOfListOfEdge();

		/****************** MAT_TListNodeOfListOfEdge ******************/
		%feature("compactdefaultargs") MAT_TListNodeOfListOfEdge;
		%feature("autodoc", "No available documentation.

Parameters
----------
anitem: MAT_Edge

Returns
-------
None
") MAT_TListNodeOfListOfEdge;
		 MAT_TListNodeOfListOfEdge(const opencascade::handle<MAT_Edge> & anitem);

		/****************** Dummy ******************/
		%feature("compactdefaultargs") Dummy;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Dummy;
		void Dummy();

		/****************** GetItem ******************/
		%feature("compactdefaultargs") GetItem;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<MAT_Edge>
") GetItem;
		opencascade::handle<MAT_Edge> GetItem();

		/****************** Next ******************/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<MAT_TListNodeOfListOfEdge>
") Next;
		opencascade::handle<MAT_TListNodeOfListOfEdge> Next();

		/****************** Next ******************/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "No available documentation.

Parameters
----------
atlistnode: MAT_TListNodeOfListOfEdge

Returns
-------
None
") Next;
		void Next(const opencascade::handle<MAT_TListNodeOfListOfEdge> & atlistnode);

		/****************** Previous ******************/
		%feature("compactdefaultargs") Previous;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<MAT_TListNodeOfListOfEdge>
") Previous;
		opencascade::handle<MAT_TListNodeOfListOfEdge> Previous();

		/****************** Previous ******************/
		%feature("compactdefaultargs") Previous;
		%feature("autodoc", "No available documentation.

Parameters
----------
atlistnode: MAT_TListNodeOfListOfEdge

Returns
-------
None
") Previous;
		void Previous(const opencascade::handle<MAT_TListNodeOfListOfEdge> & atlistnode);

		/****************** SetItem ******************/
		%feature("compactdefaultargs") SetItem;
		%feature("autodoc", "No available documentation.

Parameters
----------
anitem: MAT_Edge

Returns
-------
None
") SetItem;
		void SetItem(const opencascade::handle<MAT_Edge> & anitem);

};


%make_alias(MAT_TListNodeOfListOfEdge)

%extend MAT_TListNodeOfListOfEdge {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************
* class MAT_Zone *
*****************/
class MAT_Zone : public Standard_Transient {
	public:
		/****************** MAT_Zone ******************/
		%feature("compactdefaultargs") MAT_Zone;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") MAT_Zone;
		 MAT_Zone();

		/****************** MAT_Zone ******************/
		%feature("compactdefaultargs") MAT_Zone;
		%feature("autodoc", "Compute the frontier of the zone of proximity.

Parameters
----------
aBasicElt: MAT_BasicElt

Returns
-------
None
") MAT_Zone;
		 MAT_Zone(const opencascade::handle<MAT_BasicElt> & aBasicElt);

		/****************** ArcOnFrontier ******************/
		%feature("compactdefaultargs") ArcOnFrontier;
		%feature("autodoc", "Return the arc number <index> on the frontier. of <self>.

Parameters
----------
Index: int

Returns
-------
opencascade::handle<MAT_Arc>
") ArcOnFrontier;
		opencascade::handle<MAT_Arc> ArcOnFrontier(const Standard_Integer Index);

		/****************** Limited ******************/
		%feature("compactdefaultargs") Limited;
		%feature("autodoc", "Return true if <self> is limited.

Returns
-------
bool
") Limited;
		Standard_Boolean Limited();

		/****************** NoEmptyZone ******************/
		%feature("compactdefaultargs") NoEmptyZone;
		%feature("autodoc", "Return true if <self> is not empty .

Returns
-------
bool
") NoEmptyZone;
		Standard_Boolean NoEmptyZone();

		/****************** NumberOfArcs ******************/
		%feature("compactdefaultargs") NumberOfArcs;
		%feature("autodoc", "Return the number of arcs on the frontier of <self>.

Returns
-------
int
") NumberOfArcs;
		Standard_Integer NumberOfArcs();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Compute the frontier of the zone of proximity.

Parameters
----------
aBasicElt: MAT_BasicElt

Returns
-------
None
") Perform;
		void Perform(const opencascade::handle<MAT_BasicElt> & aBasicElt);

};


%make_alias(MAT_Zone)

%extend MAT_Zone {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
