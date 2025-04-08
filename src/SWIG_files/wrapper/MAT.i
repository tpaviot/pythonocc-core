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
%define MATDOCSTRING
"MAT module, see official documentation at
https://dev.opencascade.org/doc/occt-7.8.0/refman/html/package_mat.html"
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
%include ../common/EnumTemplates.i
%include ../common/Operators.i
%include ../common/OccHandle.i
%include ../common/IOStream.i
%include ../common/ArrayMacros.i


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

/* python proxy classes for enums */
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
%template(MAT_DataMapOfIntegerArc) NCollection_DataMap<Standard_Integer,opencascade::handle<MAT_Arc>>;

%extend NCollection_DataMap<Standard_Integer,opencascade::handle<MAT_Arc>> {
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
%template(MAT_DataMapOfIntegerBasicElt) NCollection_DataMap<Standard_Integer,opencascade::handle<MAT_BasicElt>>;

%extend NCollection_DataMap<Standard_Integer,opencascade::handle<MAT_BasicElt>> {
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
%template(MAT_DataMapOfIntegerBisector) NCollection_DataMap<Standard_Integer,opencascade::handle<MAT_Bisector>>;

%extend NCollection_DataMap<Standard_Integer,opencascade::handle<MAT_Bisector>> {
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
%template(MAT_DataMapOfIntegerNode) NCollection_DataMap<Standard_Integer,opencascade::handle<MAT_Node>>;

%extend NCollection_DataMap<Standard_Integer,opencascade::handle<MAT_Node>> {
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

%extend NCollection_Sequence<opencascade::handle<MAT_Arc>> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(MAT_SequenceOfBasicElt) NCollection_Sequence<opencascade::handle<MAT_BasicElt>>;

%extend NCollection_Sequence<opencascade::handle<MAT_BasicElt>> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
/* end templates declaration */

/* typedefs */
typedef NCollection_DataMap<Standard_Integer, opencascade::handle<MAT_Arc>>::Iterator MAT_DataMapIteratorOfDataMapOfIntegerArc;
typedef NCollection_DataMap<Standard_Integer, opencascade::handle<MAT_BasicElt>>::Iterator MAT_DataMapIteratorOfDataMapOfIntegerBasicElt;
typedef NCollection_DataMap<Standard_Integer, opencascade::handle<MAT_Bisector>>::Iterator MAT_DataMapIteratorOfDataMapOfIntegerBisector;
typedef NCollection_DataMap<Standard_Integer, opencascade::handle<MAT_Node>>::Iterator MAT_DataMapIteratorOfDataMapOfIntegerNode;
typedef NCollection_DataMap<Standard_Integer, opencascade::handle<MAT_Arc>> MAT_DataMapOfIntegerArc;
typedef NCollection_DataMap<Standard_Integer, opencascade::handle<MAT_BasicElt>> MAT_DataMapOfIntegerBasicElt;
typedef NCollection_DataMap<Standard_Integer, opencascade::handle<MAT_Bisector>> MAT_DataMapOfIntegerBisector;
typedef NCollection_DataMap<Standard_Integer, opencascade::handle<MAT_Node>> MAT_DataMapOfIntegerNode;
typedef NCollection_Sequence<opencascade::handle<MAT_Arc>> MAT_SequenceOfArc;
typedef NCollection_Sequence<opencascade::handle<MAT_BasicElt>> MAT_SequenceOfBasicElt;
/* end typedefs declaration */

/****************
* class MAT_Arc *
****************/
class MAT_Arc : public Standard_Transient {
	public:
		/****** MAT_Arc::MAT_Arc ******/
		/****** md5 signature: d3206fbe009d9b95382c9a48fba00a39 ******/
		%feature("compactdefaultargs") MAT_Arc;
		%feature("autodoc", "
Parameters
----------
ArcIndex: int
GeomIndex: int
FirstElement: MAT_BasicElt
SecondElement: MAT_BasicElt

Return
-------
None

Description
-----------
No available documentation.
") MAT_Arc;
		 MAT_Arc(const Standard_Integer ArcIndex, const Standard_Integer GeomIndex, const opencascade::handle<MAT_BasicElt> & FirstElement, const opencascade::handle<MAT_BasicElt> & SecondElement);

		/****** MAT_Arc::FirstElement ******/
		/****** md5 signature: 85f5e03e44caefa2f19031581de5b5a5 ******/
		%feature("compactdefaultargs") FirstElement;
		%feature("autodoc", "Return
-------
opencascade::handle<MAT_BasicElt>

Description
-----------
Returns one of the BasicElt equidistant from <self>.
") FirstElement;
		opencascade::handle<MAT_BasicElt> FirstElement();

		/****** MAT_Arc::FirstNode ******/
		/****** md5 signature: 8cdf5b8b1a89c274b60a767afb484f50 ******/
		%feature("compactdefaultargs") FirstNode;
		%feature("autodoc", "Return
-------
opencascade::handle<MAT_Node>

Description
-----------
Returns one Node extremity of <self>.
") FirstNode;
		opencascade::handle<MAT_Node> FirstNode();

		/****** MAT_Arc::GeomIndex ******/
		/****** md5 signature: 75ab1e2933a328a4595c114f05273572 ******/
		%feature("compactdefaultargs") GeomIndex;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the index associated of the geometric representation of <self>.
") GeomIndex;
		Standard_Integer GeomIndex();

		/****** MAT_Arc::HasNeighbour ******/
		/****** md5 signature: 3e981550ba669abb145da44df5109c0b ******/
		%feature("compactdefaultargs") HasNeighbour;
		%feature("autodoc", "
Parameters
----------
aNode: MAT_Node
aSide: MAT_Side

Return
-------
bool

Description
-----------
Returns True if there is an arc linked to the Node <aNode> located on the side <aSide> of <self>; if <aNode> is not on <self>.
") HasNeighbour;
		Standard_Boolean HasNeighbour(const opencascade::handle<MAT_Node> & aNode, const MAT_Side aSide);

		/****** MAT_Arc::Index ******/
		/****** md5 signature: 407d80ef3037d55996765198adea3908 ******/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the index of <self> in Graph.theArcs.
") Index;
		Standard_Integer Index();

		/****** MAT_Arc::Neighbour ******/
		/****** md5 signature: 6ab4ed254673a995ada0dbaed9392114 ******/
		%feature("compactdefaultargs") Neighbour;
		%feature("autodoc", "
Parameters
----------
aNode: MAT_Node
aSide: MAT_Side

Return
-------
opencascade::handle<MAT_Arc>

Description
-----------
Returns the first arc linked to the Node <aNode> located on the side <aSide> of <self>; if HasNeighbour() returns False.
") Neighbour;
		opencascade::handle<MAT_Arc> Neighbour(const opencascade::handle<MAT_Node> & aNode, const MAT_Side aSide);

		/****** MAT_Arc::SecondElement ******/
		/****** md5 signature: 49fb9ddc951019100701a82780aa971b ******/
		%feature("compactdefaultargs") SecondElement;
		%feature("autodoc", "Return
-------
opencascade::handle<MAT_BasicElt>

Description
-----------
Returns the other BasicElt equidistant from <self>.
") SecondElement;
		opencascade::handle<MAT_BasicElt> SecondElement();

		/****** MAT_Arc::SecondNode ******/
		/****** md5 signature: fa8a45938e4a068875e5ae30e51d4dd4 ******/
		%feature("compactdefaultargs") SecondNode;
		%feature("autodoc", "Return
-------
opencascade::handle<MAT_Node>

Description
-----------
Returns the other Node extremity of <self>.
") SecondNode;
		opencascade::handle<MAT_Node> SecondNode();

		/****** MAT_Arc::SetFirstArc ******/
		/****** md5 signature: af11f882ce4e0c99c81c787624d41f0a ******/
		%feature("compactdefaultargs") SetFirstArc;
		%feature("autodoc", "
Parameters
----------
aSide: MAT_Side
anArc: MAT_Arc

Return
-------
None

Description
-----------
No available documentation.
") SetFirstArc;
		void SetFirstArc(const MAT_Side aSide, const opencascade::handle<MAT_Arc> & anArc);

		/****** MAT_Arc::SetFirstElement ******/
		/****** md5 signature: 3d11d2179e94b6852ee59574ddb5207e ******/
		%feature("compactdefaultargs") SetFirstElement;
		%feature("autodoc", "
Parameters
----------
aBasicElt: MAT_BasicElt

Return
-------
None

Description
-----------
No available documentation.
") SetFirstElement;
		void SetFirstElement(const opencascade::handle<MAT_BasicElt> & aBasicElt);

		/****** MAT_Arc::SetFirstNode ******/
		/****** md5 signature: 375b87e06c6d7e6216cda7686caeda0f ******/
		%feature("compactdefaultargs") SetFirstNode;
		%feature("autodoc", "
Parameters
----------
aNode: MAT_Node

Return
-------
None

Description
-----------
No available documentation.
") SetFirstNode;
		void SetFirstNode(const opencascade::handle<MAT_Node> & aNode);

		/****** MAT_Arc::SetGeomIndex ******/
		/****** md5 signature: e9725eff02cf81b15556ce08a3187a45 ******/
		%feature("compactdefaultargs") SetGeomIndex;
		%feature("autodoc", "
Parameters
----------
anInteger: int

Return
-------
None

Description
-----------
No available documentation.
") SetGeomIndex;
		void SetGeomIndex(const Standard_Integer anInteger);

		/****** MAT_Arc::SetIndex ******/
		/****** md5 signature: 9296ef0981618ddef50a929d6665f2d8 ******/
		%feature("compactdefaultargs") SetIndex;
		%feature("autodoc", "
Parameters
----------
anInteger: int

Return
-------
None

Description
-----------
No available documentation.
") SetIndex;
		void SetIndex(const Standard_Integer anInteger);

		/****** MAT_Arc::SetNeighbour ******/
		/****** md5 signature: a7bb876e96af2d55cffb19a0e25ee34a ******/
		%feature("compactdefaultargs") SetNeighbour;
		%feature("autodoc", "
Parameters
----------
aSide: MAT_Side
aNode: MAT_Node
anArc: MAT_Arc

Return
-------
None

Description
-----------
No available documentation.
") SetNeighbour;
		void SetNeighbour(const MAT_Side aSide, const opencascade::handle<MAT_Node> & aNode, const opencascade::handle<MAT_Arc> & anArc);

		/****** MAT_Arc::SetSecondArc ******/
		/****** md5 signature: 1ef6d305aea14619a2d996f075eac0fa ******/
		%feature("compactdefaultargs") SetSecondArc;
		%feature("autodoc", "
Parameters
----------
aSide: MAT_Side
anArc: MAT_Arc

Return
-------
None

Description
-----------
No available documentation.
") SetSecondArc;
		void SetSecondArc(const MAT_Side aSide, const opencascade::handle<MAT_Arc> & anArc);

		/****** MAT_Arc::SetSecondElement ******/
		/****** md5 signature: 61841fc252165e0561bdbf5a3d62d23f ******/
		%feature("compactdefaultargs") SetSecondElement;
		%feature("autodoc", "
Parameters
----------
aBasicElt: MAT_BasicElt

Return
-------
None

Description
-----------
No available documentation.
") SetSecondElement;
		void SetSecondElement(const opencascade::handle<MAT_BasicElt> & aBasicElt);

		/****** MAT_Arc::SetSecondNode ******/
		/****** md5 signature: 806c753d7a0c51c7ae51e94e775c3bdf ******/
		%feature("compactdefaultargs") SetSecondNode;
		%feature("autodoc", "
Parameters
----------
aNode: MAT_Node

Return
-------
None

Description
-----------
No available documentation.
") SetSecondNode;
		void SetSecondNode(const opencascade::handle<MAT_Node> & aNode);

		/****** MAT_Arc::TheOtherNode ******/
		/****** md5 signature: c07b875bb7da48be77fbbf128b63d070 ******/
		%feature("compactdefaultargs") TheOtherNode;
		%feature("autodoc", "
Parameters
----------
aNode: MAT_Node

Return
-------
opencascade::handle<MAT_Node>

Description
-----------
An Arc has two Node, if <aNode> equals one Returns the other. //! if <aNode> is not oh <self>.
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
		/****** MAT_BasicElt::MAT_BasicElt ******/
		/****** md5 signature: 1f8c44c064f108bb3ed1b3c0d41536a0 ******/
		%feature("compactdefaultargs") MAT_BasicElt;
		%feature("autodoc", "
Parameters
----------
anInteger: int

Return
-------
None

Description
-----------
Constructor, <anInteger> is the <index> of <self>.
") MAT_BasicElt;
		 MAT_BasicElt(const Standard_Integer anInteger);

		/****** MAT_BasicElt::EndArc ******/
		/****** md5 signature: b81b4c468709de095e46e724e5ae8333 ******/
		%feature("compactdefaultargs") EndArc;
		%feature("autodoc", "Return
-------
opencascade::handle<MAT_Arc>

Description
-----------
Return <endArcLeft> or <endArcRight> corresponding to <aSide>.
") EndArc;
		opencascade::handle<MAT_Arc> EndArc();

		/****** MAT_BasicElt::GeomIndex ******/
		/****** md5 signature: 75ab1e2933a328a4595c114f05273572 ******/
		%feature("compactdefaultargs") GeomIndex;
		%feature("autodoc", "Return
-------
int

Description
-----------
Return the <GeomIndex> of <self>.
") GeomIndex;
		Standard_Integer GeomIndex();

		/****** MAT_BasicElt::Index ******/
		/****** md5 signature: 407d80ef3037d55996765198adea3908 ******/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "Return
-------
int

Description
-----------
Return the <index> of <self> in Graph.TheBasicElts.
") Index;
		Standard_Integer Index();

		/****** MAT_BasicElt::SetEndArc ******/
		/****** md5 signature: cb9777edd3a82cbc7857a1613ef33d07 ******/
		%feature("compactdefaultargs") SetEndArc;
		%feature("autodoc", "
Parameters
----------
anArc: MAT_Arc

Return
-------
None

Description
-----------
No available documentation.
") SetEndArc;
		void SetEndArc(const opencascade::handle<MAT_Arc> & anArc);

		/****** MAT_BasicElt::SetGeomIndex ******/
		/****** md5 signature: e9725eff02cf81b15556ce08a3187a45 ******/
		%feature("compactdefaultargs") SetGeomIndex;
		%feature("autodoc", "
Parameters
----------
anInteger: int

Return
-------
None

Description
-----------
No available documentation.
") SetGeomIndex;
		void SetGeomIndex(const Standard_Integer anInteger);

		/****** MAT_BasicElt::SetIndex ******/
		/****** md5 signature: 9296ef0981618ddef50a929d6665f2d8 ******/
		%feature("compactdefaultargs") SetIndex;
		%feature("autodoc", "
Parameters
----------
anInteger: int

Return
-------
None

Description
-----------
No available documentation.
") SetIndex;
		void SetIndex(const Standard_Integer anInteger);

		/****** MAT_BasicElt::SetStartArc ******/
		/****** md5 signature: cdbaae9631098b9cbee93770965f910c ******/
		%feature("compactdefaultargs") SetStartArc;
		%feature("autodoc", "
Parameters
----------
anArc: MAT_Arc

Return
-------
None

Description
-----------
No available documentation.
") SetStartArc;
		void SetStartArc(const opencascade::handle<MAT_Arc> & anArc);

		/****** MAT_BasicElt::StartArc ******/
		/****** md5 signature: 903782747ea4becfa49c4c7f6a677243 ******/
		%feature("compactdefaultargs") StartArc;
		%feature("autodoc", "Return
-------
opencascade::handle<MAT_Arc>

Description
-----------
Return <startArcLeft> or <startArcRight> corresponding to <aSide>.
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
		/****** MAT_Bisector::MAT_Bisector ******/
		/****** md5 signature: 7b85bd872c181919a21dca1ba8631ad5 ******/
		%feature("compactdefaultargs") MAT_Bisector;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") MAT_Bisector;
		 MAT_Bisector();

		/****** MAT_Bisector::AddBisector ******/
		/****** md5 signature: 978a1c90d11175293a1045755243dabb ******/
		%feature("compactdefaultargs") AddBisector;
		%feature("autodoc", "
Parameters
----------
abisector: MAT_Bisector

Return
-------
None

Description
-----------
No available documentation.
") AddBisector;
		void AddBisector(const opencascade::handle<MAT_Bisector> & abisector);

		/****** MAT_Bisector::BisectorNumber ******/
		/****** md5 signature: 09d6b027dec3942cf92c63a32ed241d0 ******/
		%feature("compactdefaultargs") BisectorNumber;
		%feature("autodoc", "
Parameters
----------
anumber: int

Return
-------
None

Description
-----------
No available documentation.
") BisectorNumber;
		void BisectorNumber(const Standard_Integer anumber);

		/****** MAT_Bisector::BisectorNumber ******/
		/****** md5 signature: 281081086bca6dc75149fb4fb1a143ac ******/
		%feature("compactdefaultargs") BisectorNumber;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") BisectorNumber;
		Standard_Integer BisectorNumber();

		/****** MAT_Bisector::DistIssuePoint ******/
		/****** md5 signature: e3e5006c1b9fab1f8a1bedaaffa6fb3e ******/
		%feature("compactdefaultargs") DistIssuePoint;
		%feature("autodoc", "
Parameters
----------
areal: float

Return
-------
None

Description
-----------
No available documentation.
") DistIssuePoint;
		void DistIssuePoint(const Standard_Real areal);

		/****** MAT_Bisector::DistIssuePoint ******/
		/****** md5 signature: 94af4238d7f0dec22f06e993036044c0 ******/
		%feature("compactdefaultargs") DistIssuePoint;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") DistIssuePoint;
		Standard_Real DistIssuePoint();

		/****** MAT_Bisector::Dump ******/
		/****** md5 signature: 34be4d9f12ae70558c563310451f527a ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------
ashift: int
alevel: int

Return
-------
None

Description
-----------
No available documentation.
") Dump;
		void Dump(const Standard_Integer ashift, const Standard_Integer alevel);

		/****** MAT_Bisector::EndPoint ******/
		/****** md5 signature: e12fcbaa168959458dbf44911c1a14a6 ******/
		%feature("compactdefaultargs") EndPoint;
		%feature("autodoc", "
Parameters
----------
apoint: int

Return
-------
None

Description
-----------
No available documentation.
") EndPoint;
		void EndPoint(const Standard_Integer apoint);

		/****** MAT_Bisector::EndPoint ******/
		/****** md5 signature: a3bad375aec3108900c6a43ab78968e3 ******/
		%feature("compactdefaultargs") EndPoint;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") EndPoint;
		Standard_Integer EndPoint();

		/****** MAT_Bisector::FirstBisector ******/
		/****** md5 signature: 6a0a4aea60b0db98ebfd028b078a2e75 ******/
		%feature("compactdefaultargs") FirstBisector;
		%feature("autodoc", "Return
-------
opencascade::handle<MAT_Bisector>

Description
-----------
No available documentation.
") FirstBisector;
		opencascade::handle<MAT_Bisector> FirstBisector();

		/****** MAT_Bisector::FirstEdge ******/
		/****** md5 signature: 8aa8765f87f6be5663199744ba6e0c80 ******/
		%feature("compactdefaultargs") FirstEdge;
		%feature("autodoc", "
Parameters
----------
anedge: MAT_Edge

Return
-------
None

Description
-----------
No available documentation.
") FirstEdge;
		void FirstEdge(const opencascade::handle<MAT_Edge> & anedge);

		/****** MAT_Bisector::FirstEdge ******/
		/****** md5 signature: b5c7cc54e6929626abc10181872d6deb ******/
		%feature("compactdefaultargs") FirstEdge;
		%feature("autodoc", "Return
-------
opencascade::handle<MAT_Edge>

Description
-----------
No available documentation.
") FirstEdge;
		opencascade::handle<MAT_Edge> FirstEdge();

		/****** MAT_Bisector::FirstParameter ******/
		/****** md5 signature: 9a8018bc679a9420f60343c0490ef46b ******/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "
Parameters
----------
aparameter: float

Return
-------
None

Description
-----------
No available documentation.
") FirstParameter;
		void FirstParameter(const Standard_Real aparameter);

		/****** MAT_Bisector::FirstParameter ******/
		/****** md5 signature: 4ccedbaad83be904f510b4760c75f69c ******/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") FirstParameter;
		Standard_Real FirstParameter();

		/****** MAT_Bisector::FirstVector ******/
		/****** md5 signature: 94c4013a4724436e52f18643b6f07896 ******/
		%feature("compactdefaultargs") FirstVector;
		%feature("autodoc", "
Parameters
----------
avector: int

Return
-------
None

Description
-----------
No available documentation.
") FirstVector;
		void FirstVector(const Standard_Integer avector);

		/****** MAT_Bisector::FirstVector ******/
		/****** md5 signature: a19a68af02464d9d7597a87a2c121a76 ******/
		%feature("compactdefaultargs") FirstVector;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") FirstVector;
		Standard_Integer FirstVector();

		/****** MAT_Bisector::IndexNumber ******/
		/****** md5 signature: 3ed32b6e776360a264e1a21468911734 ******/
		%feature("compactdefaultargs") IndexNumber;
		%feature("autodoc", "
Parameters
----------
anumber: int

Return
-------
None

Description
-----------
No available documentation.
") IndexNumber;
		void IndexNumber(const Standard_Integer anumber);

		/****** MAT_Bisector::IndexNumber ******/
		/****** md5 signature: 310e530533450b4adffb62e106fbc8ec ******/
		%feature("compactdefaultargs") IndexNumber;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") IndexNumber;
		Standard_Integer IndexNumber();

		/****** MAT_Bisector::IssuePoint ******/
		/****** md5 signature: 88569e83bdfe98148879543464c46eee ******/
		%feature("compactdefaultargs") IssuePoint;
		%feature("autodoc", "
Parameters
----------
apoint: int

Return
-------
None

Description
-----------
No available documentation.
") IssuePoint;
		void IssuePoint(const Standard_Integer apoint);

		/****** MAT_Bisector::IssuePoint ******/
		/****** md5 signature: c5917a3475426533fa2c9b24fb2e9921 ******/
		%feature("compactdefaultargs") IssuePoint;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") IssuePoint;
		Standard_Integer IssuePoint();

		/****** MAT_Bisector::LastBisector ******/
		/****** md5 signature: 8d2f00b1c47f5c12cafd060f730ea8af ******/
		%feature("compactdefaultargs") LastBisector;
		%feature("autodoc", "Return
-------
opencascade::handle<MAT_Bisector>

Description
-----------
No available documentation.
") LastBisector;
		opencascade::handle<MAT_Bisector> LastBisector();

		/****** MAT_Bisector::List ******/
		/****** md5 signature: f301c2b5549964b55d5211086d05000e ******/
		%feature("compactdefaultargs") List;
		%feature("autodoc", "Return
-------
opencascade::handle<MAT_ListOfBisector>

Description
-----------
No available documentation.
") List;
		opencascade::handle<MAT_ListOfBisector> List();

		/****** MAT_Bisector::SecondEdge ******/
		/****** md5 signature: 02e697a143468e06ada6d688bb7dc970 ******/
		%feature("compactdefaultargs") SecondEdge;
		%feature("autodoc", "
Parameters
----------
anedge: MAT_Edge

Return
-------
None

Description
-----------
No available documentation.
") SecondEdge;
		void SecondEdge(const opencascade::handle<MAT_Edge> & anedge);

		/****** MAT_Bisector::SecondEdge ******/
		/****** md5 signature: 9f6ce4119ea4165de792399381494e68 ******/
		%feature("compactdefaultargs") SecondEdge;
		%feature("autodoc", "Return
-------
opencascade::handle<MAT_Edge>

Description
-----------
No available documentation.
") SecondEdge;
		opencascade::handle<MAT_Edge> SecondEdge();

		/****** MAT_Bisector::SecondParameter ******/
		/****** md5 signature: eaadc60ebcfd12fe19847498b765ac29 ******/
		%feature("compactdefaultargs") SecondParameter;
		%feature("autodoc", "
Parameters
----------
aparameter: float

Return
-------
None

Description
-----------
No available documentation.
") SecondParameter;
		void SecondParameter(const Standard_Real aparameter);

		/****** MAT_Bisector::SecondParameter ******/
		/****** md5 signature: f3439ad96dffddc852702ac7bf2cb4bb ******/
		%feature("compactdefaultargs") SecondParameter;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") SecondParameter;
		Standard_Real SecondParameter();

		/****** MAT_Bisector::SecondVector ******/
		/****** md5 signature: 5d5ee4e99d01771b1b32c6e6d515f7c4 ******/
		%feature("compactdefaultargs") SecondVector;
		%feature("autodoc", "
Parameters
----------
avector: int

Return
-------
None

Description
-----------
No available documentation.
") SecondVector;
		void SecondVector(const Standard_Integer avector);

		/****** MAT_Bisector::SecondVector ******/
		/****** md5 signature: 0ef76da14ac5cbca4dc4d93c495a758d ******/
		%feature("compactdefaultargs") SecondVector;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") SecondVector;
		Standard_Integer SecondVector();

		/****** MAT_Bisector::Sense ******/
		/****** md5 signature: 6fb43a0152cc52f33de589a55a7c60c0 ******/
		%feature("compactdefaultargs") Sense;
		%feature("autodoc", "
Parameters
----------
asense: float

Return
-------
None

Description
-----------
No available documentation.
") Sense;
		void Sense(const Standard_Real asense);

		/****** MAT_Bisector::Sense ******/
		/****** md5 signature: c756786710e2cc2c23f20d0351ca88e4 ******/
		%feature("compactdefaultargs") Sense;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
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
		/****** MAT_Edge::MAT_Edge ******/
		/****** md5 signature: 85007907c3a57d3ee5a0eb1f914e52a9 ******/
		%feature("compactdefaultargs") MAT_Edge;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") MAT_Edge;
		 MAT_Edge();

		/****** MAT_Edge::Distance ******/
		/****** md5 signature: 3ae0b9dfb95cca74bdd17827ec43670b ******/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "
Parameters
----------
adistance: float

Return
-------
None

Description
-----------
No available documentation.
") Distance;
		void Distance(const Standard_Real adistance);

		/****** MAT_Edge::Distance ******/
		/****** md5 signature: c054352e1b604c83d759bc4ccf6c526d ******/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") Distance;
		Standard_Real Distance();

		/****** MAT_Edge::Dump ******/
		/****** md5 signature: 34be4d9f12ae70558c563310451f527a ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------
ashift: int
alevel: int

Return
-------
None

Description
-----------
No available documentation.
") Dump;
		void Dump(const Standard_Integer ashift, const Standard_Integer alevel);

		/****** MAT_Edge::EdgeNumber ******/
		/****** md5 signature: bd91ac2a05ea29d47596e180da953aab ******/
		%feature("compactdefaultargs") EdgeNumber;
		%feature("autodoc", "
Parameters
----------
anumber: int

Return
-------
None

Description
-----------
No available documentation.
") EdgeNumber;
		void EdgeNumber(const Standard_Integer anumber);

		/****** MAT_Edge::EdgeNumber ******/
		/****** md5 signature: eb9e7a0dc8a55b6376577d683feb50a9 ******/
		%feature("compactdefaultargs") EdgeNumber;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") EdgeNumber;
		Standard_Integer EdgeNumber();

		/****** MAT_Edge::FirstBisector ******/
		/****** md5 signature: 1263e63d26d7bb5f643ce6ac9acc57b6 ******/
		%feature("compactdefaultargs") FirstBisector;
		%feature("autodoc", "
Parameters
----------
abisector: MAT_Bisector

Return
-------
None

Description
-----------
No available documentation.
") FirstBisector;
		void FirstBisector(const opencascade::handle<MAT_Bisector> & abisector);

		/****** MAT_Edge::FirstBisector ******/
		/****** md5 signature: 6a0a4aea60b0db98ebfd028b078a2e75 ******/
		%feature("compactdefaultargs") FirstBisector;
		%feature("autodoc", "Return
-------
opencascade::handle<MAT_Bisector>

Description
-----------
No available documentation.
") FirstBisector;
		opencascade::handle<MAT_Bisector> FirstBisector();

		/****** MAT_Edge::IntersectionPoint ******/
		/****** md5 signature: 732c80277fba5d9e36d159d1de3e1813 ******/
		%feature("compactdefaultargs") IntersectionPoint;
		%feature("autodoc", "
Parameters
----------
apoint: int

Return
-------
None

Description
-----------
No available documentation.
") IntersectionPoint;
		void IntersectionPoint(const Standard_Integer apoint);

		/****** MAT_Edge::IntersectionPoint ******/
		/****** md5 signature: 54fd7947375c0f8d02705efd7de973b7 ******/
		%feature("compactdefaultargs") IntersectionPoint;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") IntersectionPoint;
		Standard_Integer IntersectionPoint();

		/****** MAT_Edge::SecondBisector ******/
		/****** md5 signature: d3dea24468ecbdd59867953344b09769 ******/
		%feature("compactdefaultargs") SecondBisector;
		%feature("autodoc", "
Parameters
----------
abisector: MAT_Bisector

Return
-------
None

Description
-----------
No available documentation.
") SecondBisector;
		void SecondBisector(const opencascade::handle<MAT_Bisector> & abisector);

		/****** MAT_Edge::SecondBisector ******/
		/****** md5 signature: e622db9d8ee4143c899aaa96174aa4b1 ******/
		%feature("compactdefaultargs") SecondBisector;
		%feature("autodoc", "Return
-------
opencascade::handle<MAT_Bisector>

Description
-----------
No available documentation.
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
		/****** MAT_Graph::MAT_Graph ******/
		/****** md5 signature: 7fba2183164a2aabe48fffdcad6b1a3f ******/
		%feature("compactdefaultargs") MAT_Graph;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") MAT_Graph;
		 MAT_Graph();

		/****** MAT_Graph::Arc ******/
		/****** md5 signature: 0e94d7b18a9967b59f8bc69d0262227d ******/
		%feature("compactdefaultargs") Arc;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
opencascade::handle<MAT_Arc>

Description
-----------
Return the Arc of index <Index> in <theArcs>.
") Arc;
		opencascade::handle<MAT_Arc> Arc(const Standard_Integer Index);

		/****** MAT_Graph::BasicElt ******/
		/****** md5 signature: 1f08facde7cc7ca0fd4903a2bf2590da ******/
		%feature("compactdefaultargs") BasicElt;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
opencascade::handle<MAT_BasicElt>

Description
-----------
Return the BasicElt of index <Index> in <theBasicElts>.
") BasicElt;
		opencascade::handle<MAT_BasicElt> BasicElt(const Standard_Integer Index);

		/****** MAT_Graph::ChangeBasicElt ******/
		/****** md5 signature: 9c303c9e8b75698556375e476f11ad80 ******/
		%feature("compactdefaultargs") ChangeBasicElt;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
opencascade::handle<MAT_BasicElt>

Description
-----------
No available documentation.
") ChangeBasicElt;
		opencascade::handle<MAT_BasicElt> ChangeBasicElt(const Standard_Integer Index);

		/****** MAT_Graph::ChangeBasicElts ******/
		/****** md5 signature: 45b15276b256fa4fb02392c2a4eec683 ******/
		%feature("compactdefaultargs") ChangeBasicElts;
		%feature("autodoc", "
Parameters
----------
NewMap: MAT_DataMapOfIntegerBasicElt

Return
-------
None

Description
-----------
No available documentation.
") ChangeBasicElts;
		void ChangeBasicElts(const MAT_DataMapOfIntegerBasicElt & NewMap);

		/****** MAT_Graph::CompactArcs ******/
		/****** md5 signature: 72a7920557248784ad886ab9fa212648 ******/
		%feature("compactdefaultargs") CompactArcs;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") CompactArcs;
		void CompactArcs();

		/****** MAT_Graph::CompactNodes ******/
		/****** md5 signature: 0b42f5d87d39b7693188acec7a06d6d1 ******/
		%feature("compactdefaultargs") CompactNodes;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") CompactNodes;
		void CompactNodes();

		/****** MAT_Graph::FusionOfBasicElts ******/
		/****** md5 signature: 638689c5771647cc22a350da0457bf47 ******/
		%feature("compactdefaultargs") FusionOfBasicElts;
		%feature("autodoc", "
Parameters
----------
IndexElt1: int
IndexElt2: int

Return
-------
MergeArc1: bool
GeomIndexArc1: int
GeomIndexArc2: int
MergeArc2: bool
GeomIndexArc3: int
GeomIndexArc4: int

Description
-----------
Merge two BasicElts. The End of the BasicElt Elt1 of IndexElt1 becomes The End of the BasicElt Elt2 of IndexElt2. Elt2 is replaced in the arcs by Elt1, Elt2 is eliminated. //! <MergeArc1> is True if the fusion of the BasicElts => a fusion of two Arcs which separated the same elements. In this case <GeomIndexArc1> and <GeomIndexArc2> are the Geometric Index of this arcs. //! If the BasicElt corresponds to a close line , the StartArc and the EndArc of Elt1 can separate the same elements . In this case there is a fusion of this arcs, <MergeArc2> is true and <GeomIndexArc3> and <GeomIndexArc4> are the Geometric Index of this arcs.
") FusionOfBasicElts;
		void FusionOfBasicElts(const Standard_Integer IndexElt1, const Standard_Integer IndexElt2, Standard_Boolean &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Boolean &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****** MAT_Graph::Node ******/
		/****** md5 signature: f38b649a7d121651fd32b256cc2d101c ******/
		%feature("compactdefaultargs") Node;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
opencascade::handle<MAT_Node>

Description
-----------
Return the Node of index <Index> in <theNodes>.
") Node;
		opencascade::handle<MAT_Node> Node(const Standard_Integer Index);

		/****** MAT_Graph::NumberOfArcs ******/
		/****** md5 signature: 19c071f3281234be8385bb27a771f8d7 ******/
		%feature("compactdefaultargs") NumberOfArcs;
		%feature("autodoc", "Return
-------
int

Description
-----------
Return the number of arcs of <self>.
") NumberOfArcs;
		Standard_Integer NumberOfArcs();

		/****** MAT_Graph::NumberOfBasicElts ******/
		/****** md5 signature: a606eb9e6a2e88954e122eb04c6f87cb ******/
		%feature("compactdefaultargs") NumberOfBasicElts;
		%feature("autodoc", "Return
-------
int

Description
-----------
Return the number of basic elements of <self>.
") NumberOfBasicElts;
		Standard_Integer NumberOfBasicElts();

		/****** MAT_Graph::NumberOfInfiniteNodes ******/
		/****** md5 signature: 4297643b0125d2cbae67f5cb0b5eef8a ******/
		%feature("compactdefaultargs") NumberOfInfiniteNodes;
		%feature("autodoc", "Return
-------
int

Description
-----------
Return the number of infinites nodes of <self>.
") NumberOfInfiniteNodes;
		Standard_Integer NumberOfInfiniteNodes();

		/****** MAT_Graph::NumberOfNodes ******/
		/****** md5 signature: 11577890e2bc13345c8dfe96f3774315 ******/
		%feature("compactdefaultargs") NumberOfNodes;
		%feature("autodoc", "Return
-------
int

Description
-----------
Return the number of nodes of <self>.
") NumberOfNodes;
		Standard_Integer NumberOfNodes();

		/****** MAT_Graph::Perform ******/
		/****** md5 signature: 43a4f7df1254a20e61562ab83ad60052 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
SemiInfinite: bool
TheRoots: MAT_ListOfBisector
NbBasicElts: int
NbArcs: int

Return
-------
None

Description
-----------
Construct <self> from the result of the method <CreateMat> of the class <MAT> from <MAT>. //! <SemiInfinite>: if some bisector are infinites. <TheRoots>: Set of the bisectors. <NbBasicElts>: Number of Basic Elements. <NbArcs>: Number of Arcs = Number of Bisectors.
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
		/****** MAT_ListOfBisector::MAT_ListOfBisector ******/
		/****** md5 signature: 8e31b64b38c872d4bf615de42ba57531 ******/
		%feature("compactdefaultargs") MAT_ListOfBisector;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") MAT_ListOfBisector;
		 MAT_ListOfBisector();

		/****** MAT_ListOfBisector::BackAdd ******/
		/****** md5 signature: 825358aeafc9ae456c5623370b02d227 ******/
		%feature("compactdefaultargs") BackAdd;
		%feature("autodoc", "
Parameters
----------
anitem: MAT_Bisector

Return
-------
None

Description
-----------
No available documentation.
") BackAdd;
		void BackAdd(const opencascade::handle<MAT_Bisector> & anitem);

		/****** MAT_ListOfBisector::Brackets ******/
		/****** md5 signature: 6ab31b9b49bbd19fa6c31b575d6678d1 ******/
		%feature("compactdefaultargs") Brackets;
		%feature("autodoc", "
Parameters
----------
anindex: int

Return
-------
opencascade::handle<MAT_Bisector>

Description
-----------
No available documentation.
") Brackets;
		opencascade::handle<MAT_Bisector> Brackets(const Standard_Integer anindex);

		/****** MAT_ListOfBisector::Current ******/
		/****** md5 signature: 159937c2e6187be533f033f2f56b590f ******/
		%feature("compactdefaultargs") Current;
		%feature("autodoc", "Return
-------
opencascade::handle<MAT_Bisector>

Description
-----------
No available documentation.
") Current;
		opencascade::handle<MAT_Bisector> Current();

		/****** MAT_ListOfBisector::Current ******/
		/****** md5 signature: a2f89a5d0580329419e2caf169bc4352 ******/
		%feature("compactdefaultargs") Current;
		%feature("autodoc", "
Parameters
----------
anitem: MAT_Bisector

Return
-------
None

Description
-----------
No available documentation.
") Current;
		void Current(const opencascade::handle<MAT_Bisector> & anitem);

		/****** MAT_ListOfBisector::Dump ******/
		/****** md5 signature: 467b3545138e672ad1fa81c231ba99bc ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------
ashift: int
alevel: int

Return
-------
None

Description
-----------
No available documentation.
") Dump;
		void Dump(const Standard_Integer ashift, const Standard_Integer alevel);

		/****** MAT_ListOfBisector::First ******/
		/****** md5 signature: 59f44b9359a423593f8c8e012b4d01ac ******/
		%feature("compactdefaultargs") First;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") First;
		void First();

		/****** MAT_ListOfBisector::FirstItem ******/
		/****** md5 signature: 9eeb9fa1707bb677b4976cf1c6822898 ******/
		%feature("compactdefaultargs") FirstItem;
		%feature("autodoc", "Return
-------
opencascade::handle<MAT_Bisector>

Description
-----------
No available documentation.
") FirstItem;
		opencascade::handle<MAT_Bisector> FirstItem();

		/****** MAT_ListOfBisector::FrontAdd ******/
		/****** md5 signature: 8f0f8b80d594650e051ee70ad0182903 ******/
		%feature("compactdefaultargs") FrontAdd;
		%feature("autodoc", "
Parameters
----------
anitem: MAT_Bisector

Return
-------
None

Description
-----------
No available documentation.
") FrontAdd;
		void FrontAdd(const opencascade::handle<MAT_Bisector> & anitem);

		/****** MAT_ListOfBisector::Index ******/
		/****** md5 signature: 407d80ef3037d55996765198adea3908 ******/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Index;
		Standard_Integer Index();

		/****** MAT_ListOfBisector::Init ******/
		/****** md5 signature: 35dbfc8bb54417af374971f124bd8997 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aniten: MAT_Bisector

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<MAT_Bisector> & aniten);

		/****** MAT_ListOfBisector::IsEmpty ******/
		/****** md5 signature: 6ab5e1ad63f93168856ab126dd374b81 ******/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsEmpty;
		Standard_Boolean IsEmpty();

		/****** MAT_ListOfBisector::Last ******/
		/****** md5 signature: 0e5c3db748783edeccd565d0b7958daf ******/
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Last;
		void Last();

		/****** MAT_ListOfBisector::LastItem ******/
		/****** md5 signature: ad5a0f614718ae0fdb65e5ca6617a804 ******/
		%feature("compactdefaultargs") LastItem;
		%feature("autodoc", "Return
-------
opencascade::handle<MAT_Bisector>

Description
-----------
No available documentation.
") LastItem;
		opencascade::handle<MAT_Bisector> LastItem();

		/****** MAT_ListOfBisector::LinkAfter ******/
		/****** md5 signature: f9044a6a96b5eed1e79d8d970b8a15bd ******/
		%feature("compactdefaultargs") LinkAfter;
		%feature("autodoc", "
Parameters
----------
anitem: MAT_Bisector

Return
-------
None

Description
-----------
No available documentation.
") LinkAfter;
		void LinkAfter(const opencascade::handle<MAT_Bisector> & anitem);

		/****** MAT_ListOfBisector::LinkBefore ******/
		/****** md5 signature: 21f69c1a54ff9c4842a7e1f6fd1c09fa ******/
		%feature("compactdefaultargs") LinkBefore;
		%feature("autodoc", "
Parameters
----------
anitem: MAT_Bisector

Return
-------
None

Description
-----------
No available documentation.
") LinkBefore;
		void LinkBefore(const opencascade::handle<MAT_Bisector> & anitem);

		/****** MAT_ListOfBisector::Loop ******/
		/****** md5 signature: 8cef1eb22640b64bb30c1ab83ba646b8 ******/
		%feature("compactdefaultargs") Loop;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Loop;
		void Loop();

		/****** MAT_ListOfBisector::More ******/
		/****** md5 signature: 6f6e915c9a3dca758c059d9e8af02dff ******/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") More;
		Standard_Boolean More();

		/****** MAT_ListOfBisector::Next ******/
		/****** md5 signature: f35c0df5f1d7c877986db18081404532 ******/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Next;
		void Next();

		/****** MAT_ListOfBisector::NextItem ******/
		/****** md5 signature: f853b276e924225e16f572f44930bbd8 ******/
		%feature("compactdefaultargs") NextItem;
		%feature("autodoc", "Return
-------
opencascade::handle<MAT_Bisector>

Description
-----------
No available documentation.
") NextItem;
		opencascade::handle<MAT_Bisector> NextItem();

		/****** MAT_ListOfBisector::Number ******/
		/****** md5 signature: 0049d1350ba9feffbbe0d130f3765410 ******/
		%feature("compactdefaultargs") Number;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Number;
		Standard_Integer Number();

		/****** MAT_ListOfBisector::Permute ******/
		/****** md5 signature: 0281dd20df55b302a94134545c64fb8f ******/
		%feature("compactdefaultargs") Permute;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Permute;
		void Permute();

		/****** MAT_ListOfBisector::Previous ******/
		/****** md5 signature: 10ee6681b6721b6898a973304d76bbf5 ******/
		%feature("compactdefaultargs") Previous;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Previous;
		void Previous();

		/****** MAT_ListOfBisector::PreviousItem ******/
		/****** md5 signature: 818bc0b5baf9c434bbb742764f7a10a0 ******/
		%feature("compactdefaultargs") PreviousItem;
		%feature("autodoc", "Return
-------
opencascade::handle<MAT_Bisector>

Description
-----------
No available documentation.
") PreviousItem;
		opencascade::handle<MAT_Bisector> PreviousItem();

		/****** MAT_ListOfBisector::Unlink ******/
		/****** md5 signature: 292a8a7af4c9ec0d13d9cc55ed8c3f9b ******/
		%feature("compactdefaultargs") Unlink;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
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
		/****** MAT_ListOfEdge::MAT_ListOfEdge ******/
		/****** md5 signature: 1884208cc7078a0de1bd9ecca6d1d2b5 ******/
		%feature("compactdefaultargs") MAT_ListOfEdge;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") MAT_ListOfEdge;
		 MAT_ListOfEdge();

		/****** MAT_ListOfEdge::BackAdd ******/
		/****** md5 signature: e188c598a93c0ca17015e92527054052 ******/
		%feature("compactdefaultargs") BackAdd;
		%feature("autodoc", "
Parameters
----------
anitem: MAT_Edge

Return
-------
None

Description
-----------
No available documentation.
") BackAdd;
		void BackAdd(const opencascade::handle<MAT_Edge> & anitem);

		/****** MAT_ListOfEdge::Brackets ******/
		/****** md5 signature: f651483f1a4f406c7623b7097a88b657 ******/
		%feature("compactdefaultargs") Brackets;
		%feature("autodoc", "
Parameters
----------
anindex: int

Return
-------
opencascade::handle<MAT_Edge>

Description
-----------
No available documentation.
") Brackets;
		opencascade::handle<MAT_Edge> Brackets(const Standard_Integer anindex);

		/****** MAT_ListOfEdge::Current ******/
		/****** md5 signature: 4a9a7bf500b63d2ddfe13bceed52f1ff ******/
		%feature("compactdefaultargs") Current;
		%feature("autodoc", "Return
-------
opencascade::handle<MAT_Edge>

Description
-----------
No available documentation.
") Current;
		opencascade::handle<MAT_Edge> Current();

		/****** MAT_ListOfEdge::Current ******/
		/****** md5 signature: c15e8e6630ed54aa96c253b92f3e004b ******/
		%feature("compactdefaultargs") Current;
		%feature("autodoc", "
Parameters
----------
anitem: MAT_Edge

Return
-------
None

Description
-----------
No available documentation.
") Current;
		void Current(const opencascade::handle<MAT_Edge> & anitem);

		/****** MAT_ListOfEdge::Dump ******/
		/****** md5 signature: 467b3545138e672ad1fa81c231ba99bc ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------
ashift: int
alevel: int

Return
-------
None

Description
-----------
No available documentation.
") Dump;
		void Dump(const Standard_Integer ashift, const Standard_Integer alevel);

		/****** MAT_ListOfEdge::First ******/
		/****** md5 signature: 59f44b9359a423593f8c8e012b4d01ac ******/
		%feature("compactdefaultargs") First;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") First;
		void First();

		/****** MAT_ListOfEdge::FirstItem ******/
		/****** md5 signature: 2e942d9d475457d087e71bec639896fc ******/
		%feature("compactdefaultargs") FirstItem;
		%feature("autodoc", "Return
-------
opencascade::handle<MAT_Edge>

Description
-----------
No available documentation.
") FirstItem;
		opencascade::handle<MAT_Edge> FirstItem();

		/****** MAT_ListOfEdge::FrontAdd ******/
		/****** md5 signature: bb7f11b690cdb2015a60dcf83b18b344 ******/
		%feature("compactdefaultargs") FrontAdd;
		%feature("autodoc", "
Parameters
----------
anitem: MAT_Edge

Return
-------
None

Description
-----------
No available documentation.
") FrontAdd;
		void FrontAdd(const opencascade::handle<MAT_Edge> & anitem);

		/****** MAT_ListOfEdge::Index ******/
		/****** md5 signature: 407d80ef3037d55996765198adea3908 ******/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Index;
		Standard_Integer Index();

		/****** MAT_ListOfEdge::Init ******/
		/****** md5 signature: fb09a251208dda7c3c7e26970ce99385 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
aniten: MAT_Edge

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<MAT_Edge> & aniten);

		/****** MAT_ListOfEdge::IsEmpty ******/
		/****** md5 signature: 6ab5e1ad63f93168856ab126dd374b81 ******/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsEmpty;
		Standard_Boolean IsEmpty();

		/****** MAT_ListOfEdge::Last ******/
		/****** md5 signature: 0e5c3db748783edeccd565d0b7958daf ******/
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Last;
		void Last();

		/****** MAT_ListOfEdge::LastItem ******/
		/****** md5 signature: f69657d081944ced1041fd3bb9be9a40 ******/
		%feature("compactdefaultargs") LastItem;
		%feature("autodoc", "Return
-------
opencascade::handle<MAT_Edge>

Description
-----------
No available documentation.
") LastItem;
		opencascade::handle<MAT_Edge> LastItem();

		/****** MAT_ListOfEdge::LinkAfter ******/
		/****** md5 signature: ab7f093f02b9336057e2e5e460d133de ******/
		%feature("compactdefaultargs") LinkAfter;
		%feature("autodoc", "
Parameters
----------
anitem: MAT_Edge

Return
-------
None

Description
-----------
No available documentation.
") LinkAfter;
		void LinkAfter(const opencascade::handle<MAT_Edge> & anitem);

		/****** MAT_ListOfEdge::LinkBefore ******/
		/****** md5 signature: 8a1500445a190717d5bb9eded7c6d73c ******/
		%feature("compactdefaultargs") LinkBefore;
		%feature("autodoc", "
Parameters
----------
anitem: MAT_Edge

Return
-------
None

Description
-----------
No available documentation.
") LinkBefore;
		void LinkBefore(const opencascade::handle<MAT_Edge> & anitem);

		/****** MAT_ListOfEdge::Loop ******/
		/****** md5 signature: 8cef1eb22640b64bb30c1ab83ba646b8 ******/
		%feature("compactdefaultargs") Loop;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Loop;
		void Loop();

		/****** MAT_ListOfEdge::More ******/
		/****** md5 signature: 6f6e915c9a3dca758c059d9e8af02dff ******/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") More;
		Standard_Boolean More();

		/****** MAT_ListOfEdge::Next ******/
		/****** md5 signature: f35c0df5f1d7c877986db18081404532 ******/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Next;
		void Next();

		/****** MAT_ListOfEdge::NextItem ******/
		/****** md5 signature: 36b03a5b85486bf4f06c2eb45fba7363 ******/
		%feature("compactdefaultargs") NextItem;
		%feature("autodoc", "Return
-------
opencascade::handle<MAT_Edge>

Description
-----------
No available documentation.
") NextItem;
		opencascade::handle<MAT_Edge> NextItem();

		/****** MAT_ListOfEdge::Number ******/
		/****** md5 signature: 0049d1350ba9feffbbe0d130f3765410 ******/
		%feature("compactdefaultargs") Number;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Number;
		Standard_Integer Number();

		/****** MAT_ListOfEdge::Permute ******/
		/****** md5 signature: 0281dd20df55b302a94134545c64fb8f ******/
		%feature("compactdefaultargs") Permute;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Permute;
		void Permute();

		/****** MAT_ListOfEdge::Previous ******/
		/****** md5 signature: 10ee6681b6721b6898a973304d76bbf5 ******/
		%feature("compactdefaultargs") Previous;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Previous;
		void Previous();

		/****** MAT_ListOfEdge::PreviousItem ******/
		/****** md5 signature: 7441b91bc3e5aa06e647b465e8b85e94 ******/
		%feature("compactdefaultargs") PreviousItem;
		%feature("autodoc", "Return
-------
opencascade::handle<MAT_Edge>

Description
-----------
No available documentation.
") PreviousItem;
		opencascade::handle<MAT_Edge> PreviousItem();

		/****** MAT_ListOfEdge::Unlink ******/
		/****** md5 signature: 292a8a7af4c9ec0d13d9cc55ed8c3f9b ******/
		%feature("compactdefaultargs") Unlink;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
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
		/****** MAT_Node::MAT_Node ******/
		/****** md5 signature: 4008f3832f7519d4f09ad0963334e97e ******/
		%feature("compactdefaultargs") MAT_Node;
		%feature("autodoc", "
Parameters
----------
GeomIndex: int
LinkedArc: MAT_Arc
Distance: float

Return
-------
None

Description
-----------
No available documentation.
") MAT_Node;
		 MAT_Node(const Standard_Integer GeomIndex, const opencascade::handle<MAT_Arc> & LinkedArc, const Standard_Real Distance);

		/****** MAT_Node::Distance ******/
		/****** md5 signature: c054352e1b604c83d759bc4ccf6c526d ******/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") Distance;
		Standard_Real Distance();

		/****** MAT_Node::GeomIndex ******/
		/****** md5 signature: 75ab1e2933a328a4595c114f05273572 ******/
		%feature("compactdefaultargs") GeomIndex;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the index associated of the geometric representation of <self>.
") GeomIndex;
		Standard_Integer GeomIndex();

		/****** MAT_Node::Index ******/
		/****** md5 signature: 407d80ef3037d55996765198adea3908 ******/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the index associated of the node.
") Index;
		Standard_Integer Index();

		/****** MAT_Node::Infinite ******/
		/****** md5 signature: a09600d55a8e8ec8794e81ddde2ada71 ******/
		%feature("compactdefaultargs") Infinite;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the distance of <self> is Infinite.
") Infinite;
		Standard_Boolean Infinite();

		/****** MAT_Node::LinkedArcs ******/
		/****** md5 signature: 8c9a4ec2d65315db961ed412093b3463 ******/
		%feature("compactdefaultargs") LinkedArcs;
		%feature("autodoc", "
Parameters
----------
S: MAT_SequenceOfArc

Return
-------
None

Description
-----------
Returns in <S> the Arcs linked to <self>.
") LinkedArcs;
		void LinkedArcs(MAT_SequenceOfArc & S);

		/****** MAT_Node::NearElts ******/
		/****** md5 signature: 597f8ff8ea3e1e0afecdf37c4d3af6b1 ******/
		%feature("compactdefaultargs") NearElts;
		%feature("autodoc", "
Parameters
----------
S: MAT_SequenceOfBasicElt

Return
-------
None

Description
-----------
Returns in <S> the BasicElts equidistant to <self>.
") NearElts;
		void NearElts(MAT_SequenceOfBasicElt & S);

		/****** MAT_Node::OnBasicElt ******/
		/****** md5 signature: eac0bcd6f6358794c7f60cbfeb0cab35 ******/
		%feature("compactdefaultargs") OnBasicElt;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if <self> belongs to the figure.
") OnBasicElt;
		Standard_Boolean OnBasicElt();

		/****** MAT_Node::PendingNode ******/
		/****** md5 signature: a2588d479fe9ed38380aee1542f810a8 ******/
		%feature("compactdefaultargs") PendingNode;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if <self> is a pending Node. (ie: the number of Arc Linked = 1).
") PendingNode;
		Standard_Boolean PendingNode();

		/****** MAT_Node::SetIndex ******/
		/****** md5 signature: 0876ee38f8335bd23a147905d6b9fa41 ******/
		%feature("compactdefaultargs") SetIndex;
		%feature("autodoc", "
Parameters
----------
anIndex: int

Return
-------
None

Description
-----------
Set the index associated of the node.
") SetIndex;
		void SetIndex(const Standard_Integer anIndex);

		/****** MAT_Node::SetLinkedArc ******/
		/****** md5 signature: 386b9f088408239f488a831ff8808b2b ******/
		%feature("compactdefaultargs") SetLinkedArc;
		%feature("autodoc", "
Parameters
----------
anArc: MAT_Arc

Return
-------
None

Description
-----------
No available documentation.
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
		/****** MAT_TListNodeOfListOfBisector::MAT_TListNodeOfListOfBisector ******/
		/****** md5 signature: 6aa4ef8ad30bc54c63f0b75f09ac8615 ******/
		%feature("compactdefaultargs") MAT_TListNodeOfListOfBisector;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") MAT_TListNodeOfListOfBisector;
		 MAT_TListNodeOfListOfBisector();

		/****** MAT_TListNodeOfListOfBisector::MAT_TListNodeOfListOfBisector ******/
		/****** md5 signature: cf9a9b5898d10253fd2c66adf742ea5c ******/
		%feature("compactdefaultargs") MAT_TListNodeOfListOfBisector;
		%feature("autodoc", "
Parameters
----------
anitem: MAT_Bisector

Return
-------
None

Description
-----------
No available documentation.
") MAT_TListNodeOfListOfBisector;
		 MAT_TListNodeOfListOfBisector(const opencascade::handle<MAT_Bisector> & anitem);

		/****** MAT_TListNodeOfListOfBisector::Dummy ******/
		/****** md5 signature: b2c791fbcbf49b805b1bd8320f7fe32e ******/
		%feature("compactdefaultargs") Dummy;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Dummy;
		void Dummy();

		/****** MAT_TListNodeOfListOfBisector::GetItem ******/
		/****** md5 signature: 5154fac8082abb26ea1742dc73964cfa ******/
		%feature("compactdefaultargs") GetItem;
		%feature("autodoc", "Return
-------
opencascade::handle<MAT_Bisector>

Description
-----------
No available documentation.
") GetItem;
		opencascade::handle<MAT_Bisector> GetItem();

		/****** MAT_TListNodeOfListOfBisector::Next ******/
		/****** md5 signature: 433833e6bd5c3e86cc5786be2ad5d651 ******/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Return
-------
opencascade::handle<MAT_TListNodeOfListOfBisector>

Description
-----------
No available documentation.
") Next;
		opencascade::handle<MAT_TListNodeOfListOfBisector> Next();

		/****** MAT_TListNodeOfListOfBisector::Next ******/
		/****** md5 signature: eda312940bb2a7ae3ec33c6e5dea0e4f ******/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "
Parameters
----------
atlistnode: MAT_TListNodeOfListOfBisector

Return
-------
None

Description
-----------
No available documentation.
") Next;
		void Next(const opencascade::handle<MAT_TListNodeOfListOfBisector> & atlistnode);

		/****** MAT_TListNodeOfListOfBisector::Previous ******/
		/****** md5 signature: f198637b3ed67220a1cfa4c724860f00 ******/
		%feature("compactdefaultargs") Previous;
		%feature("autodoc", "Return
-------
opencascade::handle<MAT_TListNodeOfListOfBisector>

Description
-----------
No available documentation.
") Previous;
		opencascade::handle<MAT_TListNodeOfListOfBisector> Previous();

		/****** MAT_TListNodeOfListOfBisector::Previous ******/
		/****** md5 signature: fa6954c268611240c50de178955b8a51 ******/
		%feature("compactdefaultargs") Previous;
		%feature("autodoc", "
Parameters
----------
atlistnode: MAT_TListNodeOfListOfBisector

Return
-------
None

Description
-----------
No available documentation.
") Previous;
		void Previous(const opencascade::handle<MAT_TListNodeOfListOfBisector> & atlistnode);

		/****** MAT_TListNodeOfListOfBisector::SetItem ******/
		/****** md5 signature: 47bc2fa134077ec1c68ac23a7835f141 ******/
		%feature("compactdefaultargs") SetItem;
		%feature("autodoc", "
Parameters
----------
anitem: MAT_Bisector

Return
-------
None

Description
-----------
No available documentation.
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
		/****** MAT_TListNodeOfListOfEdge::MAT_TListNodeOfListOfEdge ******/
		/****** md5 signature: bfc2c804f716a3f19add5f95ac43f2bb ******/
		%feature("compactdefaultargs") MAT_TListNodeOfListOfEdge;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") MAT_TListNodeOfListOfEdge;
		 MAT_TListNodeOfListOfEdge();

		/****** MAT_TListNodeOfListOfEdge::MAT_TListNodeOfListOfEdge ******/
		/****** md5 signature: 737dae1e5a7de48e84a72150c65afcf2 ******/
		%feature("compactdefaultargs") MAT_TListNodeOfListOfEdge;
		%feature("autodoc", "
Parameters
----------
anitem: MAT_Edge

Return
-------
None

Description
-----------
No available documentation.
") MAT_TListNodeOfListOfEdge;
		 MAT_TListNodeOfListOfEdge(const opencascade::handle<MAT_Edge> & anitem);

		/****** MAT_TListNodeOfListOfEdge::Dummy ******/
		/****** md5 signature: b2c791fbcbf49b805b1bd8320f7fe32e ******/
		%feature("compactdefaultargs") Dummy;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Dummy;
		void Dummy();

		/****** MAT_TListNodeOfListOfEdge::GetItem ******/
		/****** md5 signature: f421a3a89cbdf2f1ec7b771a57ef73d4 ******/
		%feature("compactdefaultargs") GetItem;
		%feature("autodoc", "Return
-------
opencascade::handle<MAT_Edge>

Description
-----------
No available documentation.
") GetItem;
		opencascade::handle<MAT_Edge> GetItem();

		/****** MAT_TListNodeOfListOfEdge::Next ******/
		/****** md5 signature: 606d852f527c22b2989a55ad02757989 ******/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Return
-------
opencascade::handle<MAT_TListNodeOfListOfEdge>

Description
-----------
No available documentation.
") Next;
		opencascade::handle<MAT_TListNodeOfListOfEdge> Next();

		/****** MAT_TListNodeOfListOfEdge::Next ******/
		/****** md5 signature: 693dcc06b05ebc3f9d79979e1716f14c ******/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "
Parameters
----------
atlistnode: MAT_TListNodeOfListOfEdge

Return
-------
None

Description
-----------
No available documentation.
") Next;
		void Next(const opencascade::handle<MAT_TListNodeOfListOfEdge> & atlistnode);

		/****** MAT_TListNodeOfListOfEdge::Previous ******/
		/****** md5 signature: 603eae626a2fb2375db30059468990c2 ******/
		%feature("compactdefaultargs") Previous;
		%feature("autodoc", "Return
-------
opencascade::handle<MAT_TListNodeOfListOfEdge>

Description
-----------
No available documentation.
") Previous;
		opencascade::handle<MAT_TListNodeOfListOfEdge> Previous();

		/****** MAT_TListNodeOfListOfEdge::Previous ******/
		/****** md5 signature: e403e791404ebd5a01668d69fec5c1b2 ******/
		%feature("compactdefaultargs") Previous;
		%feature("autodoc", "
Parameters
----------
atlistnode: MAT_TListNodeOfListOfEdge

Return
-------
None

Description
-----------
No available documentation.
") Previous;
		void Previous(const opencascade::handle<MAT_TListNodeOfListOfEdge> & atlistnode);

		/****** MAT_TListNodeOfListOfEdge::SetItem ******/
		/****** md5 signature: a8ecf4dde2aeeaa3b317d7601a1f1604 ******/
		%feature("compactdefaultargs") SetItem;
		%feature("autodoc", "
Parameters
----------
anitem: MAT_Edge

Return
-------
None

Description
-----------
No available documentation.
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
		/****** MAT_Zone::MAT_Zone ******/
		/****** md5 signature: 0020b85ee03658c3d5a50ed3b9ba156c ******/
		%feature("compactdefaultargs") MAT_Zone;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") MAT_Zone;
		 MAT_Zone();

		/****** MAT_Zone::MAT_Zone ******/
		/****** md5 signature: 0458866d22b82484e7c82a5175701e76 ******/
		%feature("compactdefaultargs") MAT_Zone;
		%feature("autodoc", "
Parameters
----------
aBasicElt: MAT_BasicElt

Return
-------
None

Description
-----------
Compute the frontier of the Zone of proximity.
") MAT_Zone;
		 MAT_Zone(const opencascade::handle<MAT_BasicElt> & aBasicElt);

		/****** MAT_Zone::ArcOnFrontier ******/
		/****** md5 signature: 895ef2f967cb6f22379f0760e66af186 ******/
		%feature("compactdefaultargs") ArcOnFrontier;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
opencascade::handle<MAT_Arc>

Description
-----------
Return the Arc number <Index> on the frontier. of <self>.
") ArcOnFrontier;
		opencascade::handle<MAT_Arc> ArcOnFrontier(const Standard_Integer Index);

		/****** MAT_Zone::Limited ******/
		/****** md5 signature: 5d723c22ad68dcae5fe215524cf5e124 ******/
		%feature("compactdefaultargs") Limited;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return True if <self> is Limited.
") Limited;
		Standard_Boolean Limited();

		/****** MAT_Zone::NoEmptyZone ******/
		/****** md5 signature: 7356e2270f432409f152933ac3bf7a8d ******/
		%feature("compactdefaultargs") NoEmptyZone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Return True if <self> is not empty .
") NoEmptyZone;
		Standard_Boolean NoEmptyZone();

		/****** MAT_Zone::NumberOfArcs ******/
		/****** md5 signature: 19c071f3281234be8385bb27a771f8d7 ******/
		%feature("compactdefaultargs") NumberOfArcs;
		%feature("autodoc", "Return
-------
int

Description
-----------
Return the number Of Arcs On the frontier of <self>.
") NumberOfArcs;
		Standard_Integer NumberOfArcs();

		/****** MAT_Zone::Perform ******/
		/****** md5 signature: 94139b27151e1c4e39a2c05a14c3c3a6 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
aBasicElt: MAT_BasicElt

Return
-------
None

Description
-----------
Compute the frontier of the Zone of proximity.
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
/* class aliases */
%pythoncode {
}
