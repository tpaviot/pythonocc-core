/*
Copyright 2008-2023 Thomas Paviot (tpaviot@gmail.com)

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
%define TOPOPEBREPDSDOCSTRING
"TopOpeBRepDS module, see official documentation at
https://www.opencascade.com/doc/occt-7.7.0/refman/html/package_topopebrepds.html"
%enddef
%module (package="OCC.Core", docstring=TOPOPEBREPDSDOCSTRING) TopOpeBRepDS


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


%{
#include<TopOpeBRepDS_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<Geom_module.hxx>
#include<TopAbs_module.hxx>
#include<TCollection_module.hxx>
#include<TopOpeBRepTool_module.hxx>
#include<TopoDS_module.hxx>
#include<Geom2d_module.hxx>
#include<TopTools_module.hxx>
#include<gp_module.hxx>
#include<TColStd_module.hxx>
#include<TopLoc_module.hxx>
#include<TColgp_module.hxx>
#include<Adaptor2d_module.hxx>
#include<Bnd_module.hxx>
#include<BRepAdaptor_module.hxx>
#include<Adaptor3d_module.hxx>
#include<Intf_module.hxx>
#include<Message_module.hxx>
#include<IntSurf_module.hxx>
#include<Extrema_module.hxx>
#include<IntCurveSurface_module.hxx>
#include<Geom2d_module.hxx>
#include<Geom2dAdaptor_module.hxx>
#include<BRepAdaptor_module.hxx>
#include<GeomAdaptor_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import Geom.i
%import TopAbs.i
%import TCollection.i
%import TopOpeBRepTool.i
%import TopoDS.i
%import Geom2d.i
%import TopTools.i
%import gp.i
%import TColStd.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
enum TopOpeBRepDS_CheckStatus {
	TopOpeBRepDS_OK = 0,
	TopOpeBRepDS_NOK = 1,
};

enum TopOpeBRepDS_Config {
	TopOpeBRepDS_UNSHGEOMETRY = 0,
	TopOpeBRepDS_SAMEORIENTED = 1,
	TopOpeBRepDS_DIFFORIENTED = 2,
};

enum TopOpeBRepDS_Kind {
	TopOpeBRepDS_POINT = 0,
	TopOpeBRepDS_CURVE = 1,
	TopOpeBRepDS_SURFACE = 2,
	TopOpeBRepDS_VERTEX = 3,
	TopOpeBRepDS_EDGE = 4,
	TopOpeBRepDS_WIRE = 5,
	TopOpeBRepDS_FACE = 6,
	TopOpeBRepDS_SHELL = 7,
	TopOpeBRepDS_SOLID = 8,
	TopOpeBRepDS_COMPSOLID = 9,
	TopOpeBRepDS_COMPOUND = 10,
	TopOpeBRepDS_UNKNOWN = 11,
};

/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {

class TopOpeBRepDS_CheckStatus(IntEnum):
	TopOpeBRepDS_OK = 0
	TopOpeBRepDS_NOK = 1
TopOpeBRepDS_OK = TopOpeBRepDS_CheckStatus.TopOpeBRepDS_OK
TopOpeBRepDS_NOK = TopOpeBRepDS_CheckStatus.TopOpeBRepDS_NOK

class TopOpeBRepDS_Config(IntEnum):
	TopOpeBRepDS_UNSHGEOMETRY = 0
	TopOpeBRepDS_SAMEORIENTED = 1
	TopOpeBRepDS_DIFFORIENTED = 2
TopOpeBRepDS_UNSHGEOMETRY = TopOpeBRepDS_Config.TopOpeBRepDS_UNSHGEOMETRY
TopOpeBRepDS_SAMEORIENTED = TopOpeBRepDS_Config.TopOpeBRepDS_SAMEORIENTED
TopOpeBRepDS_DIFFORIENTED = TopOpeBRepDS_Config.TopOpeBRepDS_DIFFORIENTED

class TopOpeBRepDS_Kind(IntEnum):
	TopOpeBRepDS_POINT = 0
	TopOpeBRepDS_CURVE = 1
	TopOpeBRepDS_SURFACE = 2
	TopOpeBRepDS_VERTEX = 3
	TopOpeBRepDS_EDGE = 4
	TopOpeBRepDS_WIRE = 5
	TopOpeBRepDS_FACE = 6
	TopOpeBRepDS_SHELL = 7
	TopOpeBRepDS_SOLID = 8
	TopOpeBRepDS_COMPSOLID = 9
	TopOpeBRepDS_COMPOUND = 10
	TopOpeBRepDS_UNKNOWN = 11
TopOpeBRepDS_POINT = TopOpeBRepDS_Kind.TopOpeBRepDS_POINT
TopOpeBRepDS_CURVE = TopOpeBRepDS_Kind.TopOpeBRepDS_CURVE
TopOpeBRepDS_SURFACE = TopOpeBRepDS_Kind.TopOpeBRepDS_SURFACE
TopOpeBRepDS_VERTEX = TopOpeBRepDS_Kind.TopOpeBRepDS_VERTEX
TopOpeBRepDS_EDGE = TopOpeBRepDS_Kind.TopOpeBRepDS_EDGE
TopOpeBRepDS_WIRE = TopOpeBRepDS_Kind.TopOpeBRepDS_WIRE
TopOpeBRepDS_FACE = TopOpeBRepDS_Kind.TopOpeBRepDS_FACE
TopOpeBRepDS_SHELL = TopOpeBRepDS_Kind.TopOpeBRepDS_SHELL
TopOpeBRepDS_SOLID = TopOpeBRepDS_Kind.TopOpeBRepDS_SOLID
TopOpeBRepDS_COMPSOLID = TopOpeBRepDS_Kind.TopOpeBRepDS_COMPSOLID
TopOpeBRepDS_COMPOUND = TopOpeBRepDS_Kind.TopOpeBRepDS_COMPOUND
TopOpeBRepDS_UNKNOWN = TopOpeBRepDS_Kind.TopOpeBRepDS_UNKNOWN
};
/* end python proxy for enums */

/* handles */
%wrap_handle(TopOpeBRepDS_Association)
%wrap_handle(TopOpeBRepDS_Check)
%wrap_handle(TopOpeBRepDS_GapTool)
%wrap_handle(TopOpeBRepDS_Interference)
%wrap_handle(TopOpeBRepDS_Marker)
%wrap_handle(TopOpeBRepDS_CurvePointInterference)
%wrap_handle(TopOpeBRepDS_ShapeShapeInterference)
%wrap_handle(TopOpeBRepDS_SolidSurfaceInterference)
%wrap_handle(TopOpeBRepDS_SurfaceCurveInterference)
%wrap_handle(TopOpeBRepDS_EdgeVertexInterference)
%wrap_handle(TopOpeBRepDS_FaceEdgeInterference)
%wrap_handle(TopOpeBRepDS_HArray1OfDataMapOfIntegerListOfInterference)
/* end handles declaration */

/* templates */
%template(TopOpeBRepDS_DataMapOfCheckStatus) NCollection_DataMap<Standard_Integer,TopOpeBRepDS_CheckStatus>;

%extend NCollection_DataMap<Standard_Integer,TopOpeBRepDS_CheckStatus> {
    PyObject* Keys() {
        PyObject *l=PyList_New(0);
        for (TopOpeBRepDS_DataMapOfCheckStatus::Iterator anIt1(*self); anIt1.More(); anIt1.Next()) {
          PyObject *o = PyLong_FromLong(anIt1.Key());
          PyList_Append(l, o);
          Py_DECREF(o);
        }
    return l;
    }
};
%template(TopOpeBRepDS_DataMapOfIntegerListOfInterference) NCollection_DataMap<Standard_Integer,TopOpeBRepDS_ListOfInterference>;

%extend NCollection_DataMap<Standard_Integer,TopOpeBRepDS_ListOfInterference> {
    PyObject* Keys() {
        PyObject *l=PyList_New(0);
        for (TopOpeBRepDS_DataMapOfIntegerListOfInterference::Iterator anIt1(*self); anIt1.More(); anIt1.Next()) {
          PyObject *o = PyLong_FromLong(anIt1.Key());
          PyList_Append(l, o);
          Py_DECREF(o);
        }
    return l;
    }
};
%template(TopOpeBRepDS_DataMapOfInterferenceListOfInterference) NCollection_DataMap<opencascade::handle<TopOpeBRepDS_Interference>,TopOpeBRepDS_ListOfInterference>;
%template(TopOpeBRepDS_DataMapOfInterferenceShape) NCollection_DataMap<opencascade::handle<TopOpeBRepDS_Interference>,TopoDS_Shape>;
%template(TopOpeBRepDS_DataMapOfShapeListOfShapeOn1State) NCollection_DataMap<TopoDS_Shape,TopOpeBRepDS_ListOfShapeOn1State,TopTools_ShapeMapHasher>;
%template(TopOpeBRepDS_DataMapOfShapeState) NCollection_DataMap<TopoDS_Shape,TopAbs_State,TopTools_ShapeMapHasher>;
%template(TopOpeBRepDS_DoubleMapOfIntegerShape) NCollection_DoubleMap<Standard_Integer,TopoDS_Shape,NCollection_DefaultHasher<int>,TopTools_ShapeMapHasher>;
%template(TopOpeBRepDS_IndexedDataMapOfShapeWithState) NCollection_IndexedDataMap<TopoDS_Shape,TopOpeBRepDS_ShapeWithState,TopTools_ShapeMapHasher>;
%template(TopOpeBRepDS_IndexedDataMapOfVertexPoint) NCollection_IndexedDataMap<TopoDS_Shape,TopOpeBRepDS_Point,TopTools_ShapeMapHasher>;
%template(TopOpeBRepDS_ListIteratorOfListOfInterference) NCollection_TListIterator<opencascade::handle<TopOpeBRepDS_Interference>>;
%template(TopOpeBRepDS_ListOfInterference) NCollection_List<opencascade::handle<TopOpeBRepDS_Interference>>;

%extend NCollection_List<opencascade::handle<TopOpeBRepDS_Interference>> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(TopOpeBRepDS_MapOfCurve) NCollection_DataMap<Standard_Integer,TopOpeBRepDS_CurveData>;

%extend NCollection_DataMap<Standard_Integer,TopOpeBRepDS_CurveData> {
    PyObject* Keys() {
        PyObject *l=PyList_New(0);
        for (TopOpeBRepDS_MapOfCurve::Iterator anIt1(*self); anIt1.More(); anIt1.Next()) {
          PyObject *o = PyLong_FromLong(anIt1.Key());
          PyList_Append(l, o);
          Py_DECREF(o);
        }
    return l;
    }
};
%template(TopOpeBRepDS_MapOfIntegerShapeData) NCollection_DataMap<Standard_Integer,TopOpeBRepDS_ShapeData>;

%extend NCollection_DataMap<Standard_Integer,TopOpeBRepDS_ShapeData> {
    PyObject* Keys() {
        PyObject *l=PyList_New(0);
        for (TopOpeBRepDS_MapOfIntegerShapeData::Iterator anIt1(*self); anIt1.More(); anIt1.Next()) {
          PyObject *o = PyLong_FromLong(anIt1.Key());
          PyList_Append(l, o);
          Py_DECREF(o);
        }
    return l;
    }
};
%template(TopOpeBRepDS_MapOfPoint) NCollection_DataMap<Standard_Integer,TopOpeBRepDS_PointData>;

%extend NCollection_DataMap<Standard_Integer,TopOpeBRepDS_PointData> {
    PyObject* Keys() {
        PyObject *l=PyList_New(0);
        for (TopOpeBRepDS_MapOfPoint::Iterator anIt1(*self); anIt1.More(); anIt1.Next()) {
          PyObject *o = PyLong_FromLong(anIt1.Key());
          PyList_Append(l, o);
          Py_DECREF(o);
        }
    return l;
    }
};
%template(TopOpeBRepDS_MapOfShapeData) NCollection_IndexedDataMap<TopoDS_Shape,TopOpeBRepDS_ShapeData,TopTools_ShapeMapHasher>;
%template(TopOpeBRepDS_MapOfSurface) NCollection_DataMap<Standard_Integer,TopOpeBRepDS_SurfaceData>;

%extend NCollection_DataMap<Standard_Integer,TopOpeBRepDS_SurfaceData> {
    PyObject* Keys() {
        PyObject *l=PyList_New(0);
        for (TopOpeBRepDS_MapOfSurface::Iterator anIt1(*self); anIt1.More(); anIt1.Next()) {
          PyObject *o = PyLong_FromLong(anIt1.Key());
          PyList_Append(l, o);
          Py_DECREF(o);
        }
    return l;
    }
};
%template(TopOpeBRepDS_ShapeSurface) NCollection_DataMap<TopoDS_Shape,opencascade::handle<Geom_Surface>,TopTools_ShapeMapHasher>;
/* end templates declaration */

/* typedefs */
typedef NCollection_Array1<TopOpeBRepDS_DataMapOfIntegerListOfInterference> TopOpeBRepDS_Array1OfDataMapOfIntegerListOfInterference;
typedef NCollection_DataMap<Standard_Integer, TopOpeBRepDS_CheckStatus>::Iterator TopOpeBRepDS_DataMapIteratorOfDataMapOfCheckStatus;
typedef NCollection_DataMap<Standard_Integer, TopOpeBRepDS_ListOfInterference>::Iterator TopOpeBRepDS_DataMapIteratorOfDataMapOfIntegerListOfInterference;
typedef NCollection_DataMap<opencascade::handle<TopOpeBRepDS_Interference>, TopOpeBRepDS_ListOfInterference>::Iterator TopOpeBRepDS_DataMapIteratorOfDataMapOfInterferenceListOfInterference;
typedef NCollection_DataMap<opencascade::handle<TopOpeBRepDS_Interference>, TopoDS_Shape>::Iterator TopOpeBRepDS_DataMapIteratorOfDataMapOfInterferenceShape;
typedef NCollection_DataMap<TopoDS_Shape, TopOpeBRepDS_ListOfShapeOn1State, TopTools_ShapeMapHasher>::Iterator TopOpeBRepDS_DataMapIteratorOfDataMapOfShapeListOfShapeOn1State;
typedef NCollection_DataMap<TopoDS_Shape, TopAbs_State, TopTools_ShapeMapHasher>::Iterator TopOpeBRepDS_DataMapIteratorOfDataMapOfShapeState;
typedef NCollection_DataMap<Standard_Integer, TopOpeBRepDS_CurveData>::Iterator TopOpeBRepDS_DataMapIteratorOfMapOfCurve;
typedef NCollection_DataMap<Standard_Integer, TopOpeBRepDS_ShapeData>::Iterator TopOpeBRepDS_DataMapIteratorOfMapOfIntegerShapeData;
typedef NCollection_DataMap<Standard_Integer, TopOpeBRepDS_PointData>::Iterator TopOpeBRepDS_DataMapIteratorOfMapOfPoint;
typedef NCollection_DataMap<Standard_Integer, TopOpeBRepDS_SurfaceData>::Iterator TopOpeBRepDS_DataMapIteratorOfMapOfSurface;
typedef NCollection_DataMap<TopoDS_Shape, opencascade::handle<Geom_Surface>, TopTools_ShapeMapHasher>::Iterator TopOpeBRepDS_DataMapIteratorOfShapeSurface;
typedef NCollection_DataMap<Standard_Integer, TopOpeBRepDS_CheckStatus> TopOpeBRepDS_DataMapOfCheckStatus;
typedef NCollection_DataMap<Standard_Integer, TopOpeBRepDS_ListOfInterference> TopOpeBRepDS_DataMapOfIntegerListOfInterference;
typedef NCollection_DataMap<opencascade::handle<TopOpeBRepDS_Interference>, TopOpeBRepDS_ListOfInterference> TopOpeBRepDS_DataMapOfInterferenceListOfInterference;
typedef NCollection_DataMap<opencascade::handle<TopOpeBRepDS_Interference>, TopoDS_Shape> TopOpeBRepDS_DataMapOfInterferenceShape;
typedef NCollection_DataMap<TopoDS_Shape, TopOpeBRepDS_ListOfShapeOn1State, TopTools_ShapeMapHasher> TopOpeBRepDS_DataMapOfShapeListOfShapeOn1State;
typedef NCollection_DataMap<TopoDS_Shape, TopAbs_State, TopTools_ShapeMapHasher> TopOpeBRepDS_DataMapOfShapeState;
typedef TopOpeBRepDS_DoubleMapOfIntegerShape::Iterator TopOpeBRepDS_DoubleMapIteratorOfDoubleMapOfIntegerShape;
typedef NCollection_DoubleMap<Standard_Integer, TopoDS_Shape, NCollection_DefaultHasher<int>, TopTools_ShapeMapHasher> TopOpeBRepDS_DoubleMapOfIntegerShape;
typedef NCollection_IndexedDataMap<TopoDS_Shape, TopOpeBRepDS_ShapeWithState, TopTools_ShapeMapHasher> TopOpeBRepDS_IndexedDataMapOfShapeWithState;
typedef NCollection_IndexedDataMap<TopoDS_Shape, TopOpeBRepDS_Point, TopTools_ShapeMapHasher> TopOpeBRepDS_IndexedDataMapOfVertexPoint;
typedef NCollection_List<opencascade::handle<TopOpeBRepDS_Interference>>::Iterator TopOpeBRepDS_ListIteratorOfListOfInterference;
typedef NCollection_List<opencascade::handle<TopOpeBRepDS_Interference>> TopOpeBRepDS_ListOfInterference;
typedef NCollection_DataMap<Standard_Integer, TopOpeBRepDS_CurveData> TopOpeBRepDS_MapOfCurve;
typedef NCollection_DataMap<Standard_Integer, TopOpeBRepDS_ShapeData> TopOpeBRepDS_MapOfIntegerShapeData;
typedef NCollection_DataMap<Standard_Integer, TopOpeBRepDS_PointData> TopOpeBRepDS_MapOfPoint;
typedef NCollection_IndexedDataMap<TopoDS_Shape, TopOpeBRepDS_ShapeData, TopTools_ShapeMapHasher> TopOpeBRepDS_MapOfShapeData;
typedef NCollection_DataMap<Standard_Integer, TopOpeBRepDS_SurfaceData> TopOpeBRepDS_MapOfSurface;
typedef TopOpeBRepDS_DataStructure * TopOpeBRepDS_PDataStructure;
typedef NCollection_DataMap<TopoDS_Shape, opencascade::handle<Geom_Surface>, TopTools_ShapeMapHasher> TopOpeBRepDS_ShapeSurface;
/* end typedefs declaration */

/*********************
* class TopOpeBRepDS *
*********************/
%rename(topopebrepds) TopOpeBRepDS;
class TopOpeBRepDS {
	public:
		/****************** IsGeometry ******************/
		/**** md5 signature: 242801ca13f95697674c13c65cc7edb4 ****/
		%feature("compactdefaultargs") IsGeometry;
		%feature("autodoc", "
Parameters
----------
K: TopOpeBRepDS_Kind

Return
-------
bool

Description
-----------
No available documentation.
") IsGeometry;
		static Standard_Boolean IsGeometry(const TopOpeBRepDS_Kind K);

		/****************** IsTopology ******************/
		/**** md5 signature: cfdfdf915ba934546693fb38ce9166d5 ****/
		%feature("compactdefaultargs") IsTopology;
		%feature("autodoc", "
Parameters
----------
K: TopOpeBRepDS_Kind

Return
-------
bool

Description
-----------
No available documentation.
") IsTopology;
		static Standard_Boolean IsTopology(const TopOpeBRepDS_Kind K);

		/****************** KindToShape ******************/
		/**** md5 signature: 4f93bc69579bee1b877edfea8f0ccbd9 ****/
		%feature("compactdefaultargs") KindToShape;
		%feature("autodoc", "
Parameters
----------
K: TopOpeBRepDS_Kind

Return
-------
TopAbs_ShapeEnum

Description
-----------
No available documentation.
") KindToShape;
		static TopAbs_ShapeEnum KindToShape(const TopOpeBRepDS_Kind K);

		/****************** Print ******************/
		/**** md5 signature: 0ef9d8e552686e3841b3de5afdb9e892 ****/
		%feature("compactdefaultargs") Print;
		%feature("autodoc", "
Parameters
----------
S: TopAbs_State

Return
-------
OS: Standard_OStream

Description
-----------
No available documentation.
") Print;
		static Standard_OStream & Print(const TopAbs_State S, std::ostream &OutValue);

		/****************** Print ******************/
		/**** md5 signature: 3a4129a4c2148a798a76811bead8b8ba ****/
		%feature("compactdefaultargs") Print;
		%feature("autodoc", "
Parameters
----------
K: TopOpeBRepDS_Kind

Return
-------
S: Standard_OStream

Description
-----------
No available documentation.
") Print;
		static Standard_OStream & Print(const TopOpeBRepDS_Kind K, std::ostream &OutValue);

		/****************** Print ******************/
		/**** md5 signature: 5d0e4822af3cf499d0d29a1903417a5b ****/
		%feature("compactdefaultargs") Print;
		%feature("autodoc", "
Parameters
----------
K: TopOpeBRepDS_Kind
I: int
B: str (optional, default to "")
A: str (optional, default to "")

Return
-------
S: Standard_OStream

Description
-----------
No available documentation.
") Print;
		static Standard_OStream & Print(const TopOpeBRepDS_Kind K, const Standard_Integer I, std::ostream &OutValue, TCollection_AsciiString B = "", TCollection_AsciiString A = "");

		/****************** Print ******************/
		/**** md5 signature: 4d591b5485e1695cd7750b55883e11d9 ****/
		%feature("compactdefaultargs") Print;
		%feature("autodoc", "
Parameters
----------
T: TopAbs_ShapeEnum
I: int

Return
-------
S: Standard_OStream

Description
-----------
No available documentation.
") Print;
		static Standard_OStream & Print(const TopAbs_ShapeEnum T, const Standard_Integer I, std::ostream &OutValue);

		/****************** Print ******************/
		/**** md5 signature: a5f6b6cef25348e934b1a293f0918f9b ****/
		%feature("compactdefaultargs") Print;
		%feature("autodoc", "
Parameters
----------
C: TopOpeBRepDS_Config

Return
-------
S: Standard_OStream

Description
-----------
No available documentation.
") Print;
		static Standard_OStream & Print(const TopOpeBRepDS_Config C, std::ostream &OutValue);

		/****************** SPrint ******************/
		/**** md5 signature: 8e8bd1974589e4b4a60a8ae1d385d1b2 ****/
		%feature("compactdefaultargs") SPrint;
		%feature("autodoc", "
Parameters
----------
S: TopAbs_State

Return
-------
TCollection_AsciiString

Description
-----------
In ou on un.
") SPrint;
		static TCollection_AsciiString SPrint(const TopAbs_State S);

		/****************** SPrint ******************/
		/**** md5 signature: 968197e24095559e9b74f828c6becff7 ****/
		%feature("compactdefaultargs") SPrint;
		%feature("autodoc", "
Parameters
----------
K: TopOpeBRepDS_Kind

Return
-------
TCollection_AsciiString

Description
-----------
<k>.
") SPrint;
		static TCollection_AsciiString SPrint(const TopOpeBRepDS_Kind K);

		/****************** SPrint ******************/
		/**** md5 signature: b21c57041921895593da7320e6faa822 ****/
		%feature("compactdefaultargs") SPrint;
		%feature("autodoc", "
Parameters
----------
K: TopOpeBRepDS_Kind
I: int
B: str (optional, default to "")
A: str (optional, default to "")

Return
-------
TCollection_AsciiString

Description
-----------
S1(<k>,<i>)s2.
") SPrint;
		static TCollection_AsciiString SPrint(const TopOpeBRepDS_Kind K, const Standard_Integer I, TCollection_AsciiString B = "", TCollection_AsciiString A = "");

		/****************** SPrint ******************/
		/**** md5 signature: bfdba83544259d7a60db9ed56c313822 ****/
		%feature("compactdefaultargs") SPrint;
		%feature("autodoc", "
Parameters
----------
T: TopAbs_ShapeEnum

Return
-------
TCollection_AsciiString

Description
-----------
No available documentation.
") SPrint;
		static TCollection_AsciiString SPrint(const TopAbs_ShapeEnum T);

		/****************** SPrint ******************/
		/**** md5 signature: 97f7d073e84efbd0be15cd8afad13777 ****/
		%feature("compactdefaultargs") SPrint;
		%feature("autodoc", "
Parameters
----------
T: TopAbs_ShapeEnum
I: int

Return
-------
TCollection_AsciiString

Description
-----------
(<t>,<i>).
") SPrint;
		static TCollection_AsciiString SPrint(const TopAbs_ShapeEnum T, const Standard_Integer I);

		/****************** SPrint ******************/
		/**** md5 signature: b2e9c40b17d2064b1d342271b06bfc31 ****/
		%feature("compactdefaultargs") SPrint;
		%feature("autodoc", "
Parameters
----------
O: TopAbs_Orientation

Return
-------
TCollection_AsciiString

Description
-----------
No available documentation.
") SPrint;
		static TCollection_AsciiString SPrint(const TopAbs_Orientation O);

		/****************** SPrint ******************/
		/**** md5 signature: a74f48fc6ca5d45de42930d3b22fca1f ****/
		%feature("compactdefaultargs") SPrint;
		%feature("autodoc", "
Parameters
----------
C: TopOpeBRepDS_Config

Return
-------
TCollection_AsciiString

Description
-----------
No available documentation.
") SPrint;
		static TCollection_AsciiString SPrint(const TopOpeBRepDS_Config C);

		/****************** ShapeToKind ******************/
		/**** md5 signature: 26c9c1a2dce5b1a31a4637d999319989 ****/
		%feature("compactdefaultargs") ShapeToKind;
		%feature("autodoc", "
Parameters
----------
S: TopAbs_ShapeEnum

Return
-------
TopOpeBRepDS_Kind

Description
-----------
No available documentation.
") ShapeToKind;
		static TopOpeBRepDS_Kind ShapeToKind(const TopAbs_ShapeEnum S);

};


%extend TopOpeBRepDS {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class TopOpeBRepDS_Association *
*********************************/
class TopOpeBRepDS_Association : public Standard_Transient {
	public:
		/****************** TopOpeBRepDS_Association ******************/
		/**** md5 signature: e4e81300cdb8cd7b407eb32100435f79 ****/
		%feature("compactdefaultargs") TopOpeBRepDS_Association;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepDS_Association;
		 TopOpeBRepDS_Association();

		/****************** AreAssociated ******************/
		/**** md5 signature: 4a754e21e44b132fa50843d27ed967f9 ****/
		%feature("compactdefaultargs") AreAssociated;
		%feature("autodoc", "
Parameters
----------
I: TopOpeBRepDS_Interference
K: TopOpeBRepDS_Interference

Return
-------
bool

Description
-----------
No available documentation.
") AreAssociated;
		Standard_Boolean AreAssociated(const opencascade::handle<TopOpeBRepDS_Interference> & I, const opencascade::handle<TopOpeBRepDS_Interference> & K);

		/****************** Associate ******************/
		/**** md5 signature: de02326dc5a740c1244a4872cd74bc4e ****/
		%feature("compactdefaultargs") Associate;
		%feature("autodoc", "
Parameters
----------
I: TopOpeBRepDS_Interference
K: TopOpeBRepDS_Interference

Return
-------
None

Description
-----------
No available documentation.
") Associate;
		void Associate(const opencascade::handle<TopOpeBRepDS_Interference> & I, const opencascade::handle<TopOpeBRepDS_Interference> & K);

		/****************** Associate ******************/
		/**** md5 signature: ddadbf71778dfb11dc9a17555bea8682 ****/
		%feature("compactdefaultargs") Associate;
		%feature("autodoc", "
Parameters
----------
I: TopOpeBRepDS_Interference
LI: TopOpeBRepDS_ListOfInterference

Return
-------
None

Description
-----------
No available documentation.
") Associate;
		void Associate(const opencascade::handle<TopOpeBRepDS_Interference> & I, const TopOpeBRepDS_ListOfInterference & LI);

		/****************** Associated ******************/
		/**** md5 signature: 9ac2e79662be6672ebdb208f9c40ead4 ****/
		%feature("compactdefaultargs") Associated;
		%feature("autodoc", "
Parameters
----------
I: TopOpeBRepDS_Interference

Return
-------
TopOpeBRepDS_ListOfInterference

Description
-----------
No available documentation.
") Associated;
		TopOpeBRepDS_ListOfInterference & Associated(const opencascade::handle<TopOpeBRepDS_Interference> & I);

		/****************** HasAssociation ******************/
		/**** md5 signature: ba92e7cf09f82761c90ea4da8e4203d8 ****/
		%feature("compactdefaultargs") HasAssociation;
		%feature("autodoc", "
Parameters
----------
I: TopOpeBRepDS_Interference

Return
-------
bool

Description
-----------
No available documentation.
") HasAssociation;
		Standard_Boolean HasAssociation(const opencascade::handle<TopOpeBRepDS_Interference> & I);

};


%make_alias(TopOpeBRepDS_Association)

%extend TopOpeBRepDS_Association {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class TopOpeBRepDS_BuildTool *
*******************************/
class TopOpeBRepDS_BuildTool {
	public:
		/****************** TopOpeBRepDS_BuildTool ******************/
		/**** md5 signature: e179694367c7bb5d379d5a549731dcbc ****/
		%feature("compactdefaultargs") TopOpeBRepDS_BuildTool;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepDS_BuildTool;
		 TopOpeBRepDS_BuildTool();

		/****************** TopOpeBRepDS_BuildTool ******************/
		/**** md5 signature: 00739303cea300cc817a756deadf1b49 ****/
		%feature("compactdefaultargs") TopOpeBRepDS_BuildTool;
		%feature("autodoc", "
Parameters
----------
OutCurveType: TopOpeBRepTool_OutCurveType

Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepDS_BuildTool;
		 TopOpeBRepDS_BuildTool(const TopOpeBRepTool_OutCurveType OutCurveType);

		/****************** TopOpeBRepDS_BuildTool ******************/
		/**** md5 signature: 0da06c51a0249b2dd4b9ce17d186f195 ****/
		%feature("compactdefaultargs") TopOpeBRepDS_BuildTool;
		%feature("autodoc", "
Parameters
----------
GT: TopOpeBRepTool_GeomTool

Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepDS_BuildTool;
		 TopOpeBRepDS_BuildTool(const TopOpeBRepTool_GeomTool & GT);

		/****************** AddEdgeVertex ******************/
		/**** md5 signature: 58bb2ee5393762c0e8e49f8a433e277c ****/
		%feature("compactdefaultargs") AddEdgeVertex;
		%feature("autodoc", "
Parameters
----------
Ein: TopoDS_Shape
Eou: TopoDS_Shape
V: TopoDS_Shape

Return
-------
None

Description
-----------
No available documentation.
") AddEdgeVertex;
		void AddEdgeVertex(const TopoDS_Shape & Ein, TopoDS_Shape & Eou, const TopoDS_Shape & V);

		/****************** AddEdgeVertex ******************/
		/**** md5 signature: d3cefa98d80572093c05bdff4359c470 ****/
		%feature("compactdefaultargs") AddEdgeVertex;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Shape
V: TopoDS_Shape

Return
-------
None

Description
-----------
No available documentation.
") AddEdgeVertex;
		void AddEdgeVertex(TopoDS_Shape & E, const TopoDS_Shape & V);

		/****************** AddFaceWire ******************/
		/**** md5 signature: 61e37223c866465cbdca424e9367353d ****/
		%feature("compactdefaultargs") AddFaceWire;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Shape
W: TopoDS_Shape

Return
-------
None

Description
-----------
No available documentation.
") AddFaceWire;
		void AddFaceWire(TopoDS_Shape & F, const TopoDS_Shape & W);

		/****************** AddShellFace ******************/
		/**** md5 signature: e6cdc0d1e33dc9ca784cbb32e551a598 ****/
		%feature("compactdefaultargs") AddShellFace;
		%feature("autodoc", "
Parameters
----------
Sh: TopoDS_Shape
F: TopoDS_Shape

Return
-------
None

Description
-----------
No available documentation.
") AddShellFace;
		void AddShellFace(TopoDS_Shape & Sh, const TopoDS_Shape & F);

		/****************** AddSolidShell ******************/
		/**** md5 signature: c13854a2554d2626024d2177860b77ef ****/
		%feature("compactdefaultargs") AddSolidShell;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
Sh: TopoDS_Shape

Return
-------
None

Description
-----------
No available documentation.
") AddSolidShell;
		void AddSolidShell(TopoDS_Shape & S, const TopoDS_Shape & Sh);

		/****************** AddWireEdge ******************/
		/**** md5 signature: d6a19f1fd9bc39f9a24a491f29232199 ****/
		%feature("compactdefaultargs") AddWireEdge;
		%feature("autodoc", "
Parameters
----------
W: TopoDS_Shape
E: TopoDS_Shape

Return
-------
None

Description
-----------
No available documentation.
") AddWireEdge;
		void AddWireEdge(TopoDS_Shape & W, const TopoDS_Shape & E);

		/****************** ApproxCurves ******************/
		/**** md5 signature: 5a40deaa5f89cd7a7ffdabb637762813 ****/
		%feature("compactdefaultargs") ApproxCurves;
		%feature("autodoc", "
Parameters
----------
C: TopOpeBRepDS_Curve
E: TopoDS_Edge
HDS: TopOpeBRepDS_HDataStructure

Return
-------
inewC: int

Description
-----------
No available documentation.
") ApproxCurves;
		void ApproxCurves(const TopOpeBRepDS_Curve & C, TopoDS_Edge & E, Standard_Integer &OutValue, const opencascade::handle<TopOpeBRepDS_HDataStructure> & HDS);

		/****************** Approximation ******************/
		/**** md5 signature: 8db59148951ab23443121333db4394c0 ****/
		%feature("compactdefaultargs") Approximation;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") Approximation;
		Standard_Boolean Approximation();

		/****************** ChangeGeomTool ******************/
		/**** md5 signature: ec177d99f76bb4ed7e436f53436adf03 ****/
		%feature("compactdefaultargs") ChangeGeomTool;
		%feature("autodoc", "Return
-------
TopOpeBRepTool_GeomTool

Description
-----------
No available documentation.
") ChangeGeomTool;
		TopOpeBRepTool_GeomTool & ChangeGeomTool();

		/****************** Closed ******************/
		/**** md5 signature: 82202c2c3ebbcceda8be892e8098526a ****/
		%feature("compactdefaultargs") Closed;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
B: bool

Return
-------
None

Description
-----------
No available documentation.
") Closed;
		void Closed(TopoDS_Shape & S, const Standard_Boolean B);

		/****************** ComputePCurves ******************/
		/**** md5 signature: cd0135f7e8be2cce26eee4970435a681 ****/
		%feature("compactdefaultargs") ComputePCurves;
		%feature("autodoc", "
Parameters
----------
C: TopOpeBRepDS_Curve
E: TopoDS_Edge
newC: TopOpeBRepDS_Curve
CompPC1: bool
CompPC2: bool
CompC3D: bool

Return
-------
None

Description
-----------
No available documentation.
") ComputePCurves;
		void ComputePCurves(const TopOpeBRepDS_Curve & C, TopoDS_Edge & E, TopOpeBRepDS_Curve & newC, const Standard_Boolean CompPC1, const Standard_Boolean CompPC2, const Standard_Boolean CompC3D);

		/****************** CopyEdge ******************/
		/**** md5 signature: 06d20ad51d28fd85815a9bc8a46a8a7c ****/
		%feature("compactdefaultargs") CopyEdge;
		%feature("autodoc", "
Parameters
----------
Ein: TopoDS_Shape
Eou: TopoDS_Shape

Return
-------
None

Description
-----------
Make an edge <eou> with the curve of the edge <ein>.
") CopyEdge;
		void CopyEdge(const TopoDS_Shape & Ein, TopoDS_Shape & Eou);

		/****************** CopyFace ******************/
		/**** md5 signature: 977c888106a494a0a2f71cb77a551880 ****/
		%feature("compactdefaultargs") CopyFace;
		%feature("autodoc", "
Parameters
----------
Fin: TopoDS_Shape
Fou: TopoDS_Shape

Return
-------
None

Description
-----------
Make a face <fou> with the surface of the face <fin>.
") CopyFace;
		void CopyFace(const TopoDS_Shape & Fin, TopoDS_Shape & Fou);

		/****************** Curve3D ******************/
		/**** md5 signature: 69d4a367443c8988c91467ed755a8c70 ****/
		%feature("compactdefaultargs") Curve3D;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Shape
C: Geom_Curve
Tol: float

Return
-------
None

Description
-----------
Sets the curve <c> for the edge <e>.
") Curve3D;
		void Curve3D(TopoDS_Shape & E, const opencascade::handle<Geom_Curve> & C, const Standard_Real Tol);

		/****************** GetGeomTool ******************/
		/**** md5 signature: 6b33ef83138f718a68f748ea1ea7a345 ****/
		%feature("compactdefaultargs") GetGeomTool;
		%feature("autodoc", "Return
-------
TopOpeBRepTool_GeomTool

Description
-----------
No available documentation.
") GetGeomTool;
		const TopOpeBRepTool_GeomTool & GetGeomTool();

		/****************** GetOrientedEdgeVertices ******************/
		/**** md5 signature: 8a058faad507a36784264f0791a5e956 ****/
		%feature("compactdefaultargs") GetOrientedEdgeVertices;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
Vmin: TopoDS_Vertex
Vmax: TopoDS_Vertex

Return
-------
Parmin: float
Parmax: float

Description
-----------
No available documentation.
") GetOrientedEdgeVertices;
		void GetOrientedEdgeVertices(TopoDS_Edge & E, TopoDS_Vertex & Vmin, TopoDS_Vertex & Vmax, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** MakeEdge ******************/
		/**** md5 signature: c322d9d41c58eebc78ebeb1a368336bc ****/
		%feature("compactdefaultargs") MakeEdge;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Shape
C: TopOpeBRepDS_Curve

Return
-------
None

Description
-----------
No available documentation.
") MakeEdge;
		void MakeEdge(TopoDS_Shape & E, const TopOpeBRepDS_Curve & C);

		/****************** MakeEdge ******************/
		/**** md5 signature: 0c42debf93b6fa7c080165ed32339ea3 ****/
		%feature("compactdefaultargs") MakeEdge;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Shape
C: TopOpeBRepDS_Curve
DS: TopOpeBRepDS_DataStructure

Return
-------
None

Description
-----------
No available documentation.
") MakeEdge;
		void MakeEdge(TopoDS_Shape & E, const TopOpeBRepDS_Curve & C, const TopOpeBRepDS_DataStructure & DS);

		/****************** MakeEdge ******************/
		/**** md5 signature: ee710c2759cd467c4c7abf745b9a0bc2 ****/
		%feature("compactdefaultargs") MakeEdge;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Shape
C: Geom_Curve
Tol: float

Return
-------
None

Description
-----------
No available documentation.
") MakeEdge;
		void MakeEdge(TopoDS_Shape & E, const opencascade::handle<Geom_Curve> & C, const Standard_Real Tol);

		/****************** MakeEdge ******************/
		/**** md5 signature: 4cda8d3e9a1d3660cb358bf543f1397c ****/
		%feature("compactdefaultargs") MakeEdge;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Shape

Return
-------
None

Description
-----------
No available documentation.
") MakeEdge;
		void MakeEdge(TopoDS_Shape & E);

		/****************** MakeFace ******************/
		/**** md5 signature: 3a34eb1fc35111f0a067741bebfa5aed ****/
		%feature("compactdefaultargs") MakeFace;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Shape
S: TopOpeBRepDS_Surface

Return
-------
None

Description
-----------
No available documentation.
") MakeFace;
		void MakeFace(TopoDS_Shape & F, const TopOpeBRepDS_Surface & S);

		/****************** MakeShell ******************/
		/**** md5 signature: 9c44d97836e48ae73f7a7852af003860 ****/
		%feature("compactdefaultargs") MakeShell;
		%feature("autodoc", "
Parameters
----------
Sh: TopoDS_Shape

Return
-------
None

Description
-----------
No available documentation.
") MakeShell;
		void MakeShell(TopoDS_Shape & Sh);

		/****************** MakeSolid ******************/
		/**** md5 signature: 09e9258c227e928cb1c324e293a90586 ****/
		%feature("compactdefaultargs") MakeSolid;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
None

Description
-----------
No available documentation.
") MakeSolid;
		void MakeSolid(TopoDS_Shape & S);

		/****************** MakeVertex ******************/
		/**** md5 signature: 88c0c3b11eb5379cf70017d38ff16712 ****/
		%feature("compactdefaultargs") MakeVertex;
		%feature("autodoc", "
Parameters
----------
V: TopoDS_Shape
P: TopOpeBRepDS_Point

Return
-------
None

Description
-----------
No available documentation.
") MakeVertex;
		void MakeVertex(TopoDS_Shape & V, const TopOpeBRepDS_Point & P);

		/****************** MakeWire ******************/
		/**** md5 signature: 12a6efd1de3c0a775278886280ca3adb ****/
		%feature("compactdefaultargs") MakeWire;
		%feature("autodoc", "
Parameters
----------
W: TopoDS_Shape

Return
-------
None

Description
-----------
No available documentation.
") MakeWire;
		void MakeWire(TopoDS_Shape & W);

		/****************** Orientation ******************/
		/**** md5 signature: 2fbb2de5d16be3ec96ed304d6ce2745d ****/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
O: TopAbs_Orientation

Return
-------
None

Description
-----------
No available documentation.
") Orientation;
		void Orientation(TopoDS_Shape & S, const TopAbs_Orientation O);

		/****************** Orientation ******************/
		/**** md5 signature: c02dc3934a0a045b39da810286896c0e ****/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
TopAbs_Orientation

Description
-----------
No available documentation.
") Orientation;
		TopAbs_Orientation Orientation(const TopoDS_Shape & S);

		/****************** OverWrite ******************/
		/**** md5 signature: bec7518940a71167e19b7d3b8acfd144 ****/
		%feature("compactdefaultargs") OverWrite;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") OverWrite;
		Standard_Boolean OverWrite();

		/****************** OverWrite ******************/
		/**** md5 signature: b6e6e846fd6cd1de15cd79ebec13906a ****/
		%feature("compactdefaultargs") OverWrite;
		%feature("autodoc", "
Parameters
----------
O: bool

Return
-------
None

Description
-----------
No available documentation.
") OverWrite;
		void OverWrite(const Standard_Boolean O);

		/****************** PCurve ******************/
		/**** md5 signature: 6f1565ac048eede1654fba5b2c1082b8 ****/
		%feature("compactdefaultargs") PCurve;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Shape
E: TopoDS_Shape
C: Geom2d_Curve

Return
-------
None

Description
-----------
Sets the pcurve <c> for the edge <e> on the face <f>. if overwrite is true the old pcurve if there is one is overwritten, else the two pcurves are set.
") PCurve;
		void PCurve(TopoDS_Shape & F, TopoDS_Shape & E, const opencascade::handle<Geom2d_Curve> & C);

		/****************** PCurve ******************/
		/**** md5 signature: 5bff66786d077f5ee740a26003145005 ****/
		%feature("compactdefaultargs") PCurve;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Shape
E: TopoDS_Shape
CDS: TopOpeBRepDS_Curve
C: Geom2d_Curve

Return
-------
None

Description
-----------
No available documentation.
") PCurve;
		void PCurve(TopoDS_Shape & F, TopoDS_Shape & E, const TopOpeBRepDS_Curve & CDS, const opencascade::handle<Geom2d_Curve> & C);

		/****************** Parameter ******************/
		/**** md5 signature: ccf33a9c2da9d479a0183b51984856e7 ****/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Shape
V: TopoDS_Shape
P: float

Return
-------
None

Description
-----------
Sets the parameter <p> for the vertex <v> on the edge <e>.
") Parameter;
		void Parameter(const TopoDS_Shape & E, const TopoDS_Shape & V, const Standard_Real P);

		/****************** Parameter ******************/
		/**** md5 signature: dfdc2af0b69aff19501456742113f6e3 ****/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "
Parameters
----------
C: TopOpeBRepDS_Curve
E: TopoDS_Shape
V: TopoDS_Shape

Return
-------
None

Description
-----------
Compute the parameter of the vertex <v>, supported by the edge <e>, on the curve <c>.
") Parameter;
		void Parameter(const TopOpeBRepDS_Curve & C, TopoDS_Shape & E, TopoDS_Shape & V);

		/****************** PutPCurves ******************/
		/**** md5 signature: 68b0e14caf774f2149574f0121231899 ****/
		%feature("compactdefaultargs") PutPCurves;
		%feature("autodoc", "
Parameters
----------
newC: TopOpeBRepDS_Curve
E: TopoDS_Edge
CompPC1: bool
CompPC2: bool

Return
-------
None

Description
-----------
No available documentation.
") PutPCurves;
		void PutPCurves(const TopOpeBRepDS_Curve & newC, TopoDS_Edge & E, const Standard_Boolean CompPC1, const Standard_Boolean CompPC2);

		/****************** Range ******************/
		/**** md5 signature: 91ddc155afc8aa9023e379809ec9e767 ****/
		%feature("compactdefaultargs") Range;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Shape
first: float
last: float

Return
-------
None

Description
-----------
Sets the range of edge <e>.
") Range;
		void Range(const TopoDS_Shape & E, const Standard_Real first, const Standard_Real last);

		/****************** RecomputeCurves ******************/
		/**** md5 signature: d2268d16d9f1e23969ee64454d1f91c1 ****/
		%feature("compactdefaultargs") RecomputeCurves;
		%feature("autodoc", "
Parameters
----------
C: TopOpeBRepDS_Curve
oldE: TopoDS_Edge
E: TopoDS_Edge
HDS: TopOpeBRepDS_HDataStructure

Return
-------
inewC: int

Description
-----------
No available documentation.
") RecomputeCurves;
		void RecomputeCurves(const TopOpeBRepDS_Curve & C, const TopoDS_Edge & oldE, TopoDS_Edge & E, Standard_Integer &OutValue, const opencascade::handle<TopOpeBRepDS_HDataStructure> & HDS);

		/****************** Translate ******************/
		/**** md5 signature: 7d0fd2105504278affaad5695ece8dc9 ****/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") Translate;
		Standard_Boolean Translate();

		/****************** Translate ******************/
		/**** md5 signature: c67ac8924df1d8b8f15727247fb6fc77 ****/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "
Parameters
----------
T: bool

Return
-------
None

Description
-----------
No available documentation.
") Translate;
		void Translate(const Standard_Boolean T);

		/****************** UpdateEdge ******************/
		/**** md5 signature: f8436c0d941de854d2f6a6738e02eb32 ****/
		%feature("compactdefaultargs") UpdateEdge;
		%feature("autodoc", "
Parameters
----------
Ein: TopoDS_Shape
Eou: TopoDS_Shape

Return
-------
None

Description
-----------
Sets the range of edge <eou> from <ein> only when <ein> has a closed geometry.
") UpdateEdge;
		void UpdateEdge(const TopoDS_Shape & Ein, TopoDS_Shape & Eou);

		/****************** UpdateEdgeCurveTol ******************/
		/**** md5 signature: 938d401b4d706f3534dc3ddc7a87ac22 ****/
		%feature("compactdefaultargs") UpdateEdgeCurveTol;
		%feature("autodoc", "
Parameters
----------
F1: TopoDS_Face
F2: TopoDS_Face
E: TopoDS_Edge
C3Dnew: Geom_Curve
tol3d: float
tol2d1: float
tol2d2: float

Return
-------
newtol: float
newparmin: float
newparmax: float

Description
-----------
No available documentation.
") UpdateEdgeCurveTol;
		void UpdateEdgeCurveTol(const TopoDS_Face & F1, const TopoDS_Face & F2, TopoDS_Edge & E, const opencascade::handle<Geom_Curve> & C3Dnew, const Standard_Real tol3d, const Standard_Real tol2d1, const Standard_Real tol2d2, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** UpdateSurface ******************/
		/**** md5 signature: e2b70bce5d5cbd079befa501a27c0de3 ****/
		%feature("compactdefaultargs") UpdateSurface;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Shape
SU: Geom_Surface

Return
-------
None

Description
-----------
No available documentation.
") UpdateSurface;
		void UpdateSurface(const TopoDS_Shape & F, const opencascade::handle<Geom_Surface> & SU);

		/****************** UpdateSurface ******************/
		/**** md5 signature: 526799dbf22174892653b37213b71068 ****/
		%feature("compactdefaultargs") UpdateSurface;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Shape
oldF: TopoDS_Shape
newF: TopoDS_Shape

Return
-------
None

Description
-----------
No available documentation.
") UpdateSurface;
		void UpdateSurface(const TopoDS_Shape & E, const TopoDS_Shape & oldF, const TopoDS_Shape & newF);

};


%extend TopOpeBRepDS_BuildTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class TopOpeBRepDS_Check *
***************************/
class TopOpeBRepDS_Check : public Standard_Transient {
	public:
		/****************** TopOpeBRepDS_Check ******************/
		/**** md5 signature: 8ef8085199907b0ae11d48dea0ded0be ****/
		%feature("compactdefaultargs") TopOpeBRepDS_Check;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepDS_Check;
		 TopOpeBRepDS_Check();

		/****************** TopOpeBRepDS_Check ******************/
		/**** md5 signature: 1bffeafdbcbacafe2b7843776c06ea75 ****/
		%feature("compactdefaultargs") TopOpeBRepDS_Check;
		%feature("autodoc", "
Parameters
----------
HDS: TopOpeBRepDS_HDataStructure

Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepDS_Check;
		 TopOpeBRepDS_Check(const opencascade::handle<TopOpeBRepDS_HDataStructure> & HDS);

		/****************** ChangeHDS ******************/
		/**** md5 signature: f6ae620a0089db5e0e1f53e2df140a22 ****/
		%feature("compactdefaultargs") ChangeHDS;
		%feature("autodoc", "Return
-------
opencascade::handle<TopOpeBRepDS_HDataStructure>

Description
-----------
No available documentation.
") ChangeHDS;
		opencascade::handle<TopOpeBRepDS_HDataStructure> & ChangeHDS();

		/****************** CheckDS ******************/
		/**** md5 signature: 7c4d02a9a20320516669bd3c7d333560 ****/
		%feature("compactdefaultargs") CheckDS;
		%feature("autodoc", "
Parameters
----------
i: int
K: TopOpeBRepDS_Kind

Return
-------
bool

Description
-----------
Verifie que le ieme element de la ds existe, et pour un k de type topologique, verifie qu'il est du bon type (vertex, edge, wire, face, shell ou solid).
") CheckDS;
		Standard_Boolean CheckDS(const Standard_Integer i, const TopOpeBRepDS_Kind K);

		/****************** CheckShapes ******************/
		/**** md5 signature: a6bcd6a1ec62e019edc8f3555be4d4ff ****/
		%feature("compactdefaultargs") CheckShapes;
		%feature("autodoc", "
Parameters
----------
LS: TopTools_ListOfShape

Return
-------
bool

Description
-----------
Verifie que les shapes existent bien dans la ds utile pour les shapes samedomain si la liste est vide, renvoie vrai.
") CheckShapes;
		Standard_Boolean CheckShapes(const TopTools_ListOfShape & LS);

		/****************** ChkIntg ******************/
		/**** md5 signature: 91cb7fe5fcb74707a99a7630b852c120 ****/
		%feature("compactdefaultargs") ChkIntg;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Check integrition of ds.
") ChkIntg;
		Standard_Boolean ChkIntg();

		/****************** ChkIntgInterf ******************/
		/**** md5 signature: 3b02951ab93530d6690357693ef8598e ****/
		%feature("compactdefaultargs") ChkIntgInterf;
		%feature("autodoc", "
Parameters
----------
LI: TopOpeBRepDS_ListOfInterference

Return
-------
bool

Description
-----------
Check integrition of interferences (les supports et les geometries de li).
") ChkIntgInterf;
		Standard_Boolean ChkIntgInterf(const TopOpeBRepDS_ListOfInterference & LI);

		/****************** ChkIntgSamDom ******************/
		/**** md5 signature: 54a9ae2f5bbbf5013dded9d16a77e089 ****/
		%feature("compactdefaultargs") ChkIntgSamDom;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Check integrition des champs samedomain de la ds.
") ChkIntgSamDom;
		Standard_Boolean ChkIntgSamDom();

		/****************** HDS ******************/
		/**** md5 signature: 06b167d233b9790bcd0a135ca06a4a10 ****/
		%feature("compactdefaultargs") HDS;
		%feature("autodoc", "Return
-------
opencascade::handle<TopOpeBRepDS_HDataStructure>

Description
-----------
No available documentation.
") HDS;
		const opencascade::handle<TopOpeBRepDS_HDataStructure> & HDS();

		/****************** OneVertexOnPnt ******************/
		/**** md5 signature: 85b7f7c95f7658ca07c0dcb4b73a83d3 ****/
		%feature("compactdefaultargs") OneVertexOnPnt;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Verifie que les vertex non samedomain sont bien nonsamedomain, que les vertex samedomain sont bien samedomain, que les points sont non confondus ni entre eux, ni avec des vertex.
") OneVertexOnPnt;
		Standard_Boolean OneVertexOnPnt();

		/****************** Print ******************/
		/**** md5 signature: 086af6ff7c70fce4047a52ee56d84e30 ****/
		%feature("compactdefaultargs") Print;
		%feature("autodoc", "
Parameters
----------
stat: TopOpeBRepDS_CheckStatus

Return
-------
S: Standard_OStream

Description
-----------
Prints the name of checkstatus <stat> as a string.
") Print;
		Standard_OStream & Print(const TopOpeBRepDS_CheckStatus stat, std::ostream &OutValue);

		/****************** PrintIntg ******************/
		/**** md5 signature: 87c9033c33359faee40e17ca777bad2d ****/
		%feature("compactdefaultargs") PrintIntg;
		%feature("autodoc", "
Parameters
----------

Return
-------
S: Standard_OStream

Description
-----------
No available documentation.
") PrintIntg;
		Standard_OStream & PrintIntg(std::ostream &OutValue);

		/****************** PrintShape ******************/
		/**** md5 signature: c932bb977c67cb2dcc0f16639aaccff2 ****/
		%feature("compactdefaultargs") PrintShape;
		%feature("autodoc", "
Parameters
----------
SE: TopAbs_ShapeEnum

Return
-------
S: Standard_OStream

Description
-----------
Prints the name of checkstatus <stat> as a string.
") PrintShape;
		Standard_OStream & PrintShape(const TopAbs_ShapeEnum SE, std::ostream &OutValue);

		/****************** PrintShape ******************/
		/**** md5 signature: d41a7aa820a314e867e8755240d58f62 ****/
		%feature("compactdefaultargs") PrintShape;
		%feature("autodoc", "
Parameters
----------
index: int

Return
-------
S: Standard_OStream

Description
-----------
Prints the name of checkstatus <stat> as a string.
") PrintShape;
		Standard_OStream & PrintShape(const Standard_Integer index, std::ostream &OutValue);

};


%make_alias(TopOpeBRepDS_Check)

%extend TopOpeBRepDS_Check {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class TopOpeBRepDS_Curve *
***************************/
class TopOpeBRepDS_Curve {
	public:
		/****************** TopOpeBRepDS_Curve ******************/
		/**** md5 signature: dc73cbca407d7ef96f5b43ead9ae3fad ****/
		%feature("compactdefaultargs") TopOpeBRepDS_Curve;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepDS_Curve;
		 TopOpeBRepDS_Curve();

		/****************** TopOpeBRepDS_Curve ******************/
		/**** md5 signature: de3714b8f28f90d36c1dc9586e5289b3 ****/
		%feature("compactdefaultargs") TopOpeBRepDS_Curve;
		%feature("autodoc", "
Parameters
----------
P: Geom_Curve
T: float
IsWalk: bool (optional, default to Standard_False)

Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepDS_Curve;
		 TopOpeBRepDS_Curve(const opencascade::handle<Geom_Curve> & P, const Standard_Real T, const Standard_Boolean IsWalk = Standard_False);

		/****************** ChangeCurve ******************/
		/**** md5 signature: e819346faf86cc2bea5f869865af9ed2 ****/
		%feature("compactdefaultargs") ChangeCurve;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Curve>

Description
-----------
No available documentation.
") ChangeCurve;
		opencascade::handle<Geom_Curve> & ChangeCurve();

		/****************** ChangeDSIndex ******************/
		/**** md5 signature: 4165a2881b0bdbc8f8e733871dfb4516 ****/
		%feature("compactdefaultargs") ChangeDSIndex;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
None

Description
-----------
No available documentation.
") ChangeDSIndex;
		void ChangeDSIndex(const Standard_Integer I);

		/****************** ChangeIsWalk ******************/
		/**** md5 signature: a85870a545a55473e88e53b335d20638 ****/
		%feature("compactdefaultargs") ChangeIsWalk;
		%feature("autodoc", "
Parameters
----------
B: bool

Return
-------
None

Description
-----------
No available documentation.
") ChangeIsWalk;
		void ChangeIsWalk(const Standard_Boolean B);

		/****************** ChangeKeep ******************/
		/**** md5 signature: 75f379b6bb874b0da2db245ffe678874 ****/
		%feature("compactdefaultargs") ChangeKeep;
		%feature("autodoc", "
Parameters
----------
B: bool

Return
-------
None

Description
-----------
No available documentation.
") ChangeKeep;
		void ChangeKeep(const Standard_Boolean B);

		/****************** ChangeMother ******************/
		/**** md5 signature: c4cfccc9364c313425bc77805633396f ****/
		%feature("compactdefaultargs") ChangeMother;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
None

Description
-----------
No available documentation.
") ChangeMother;
		void ChangeMother(const Standard_Integer I);

		/****************** ChangeShape1 ******************/
		/**** md5 signature: d2743f9a46939c6cada33939dd36f3f1 ****/
		%feature("compactdefaultargs") ChangeShape1;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") ChangeShape1;
		TopoDS_Shape ChangeShape1();

		/****************** ChangeShape2 ******************/
		/**** md5 signature: 9df648ca98f0f035360705446acc37f1 ****/
		%feature("compactdefaultargs") ChangeShape2;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") ChangeShape2;
		TopoDS_Shape ChangeShape2();

		/****************** Curve ******************/
		/**** md5 signature: 976a03829ec92d091e0b58dd7f58e869 ****/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Curve>

Description
-----------
No available documentation.
") Curve;
		const opencascade::handle<Geom_Curve> & Curve();

		/****************** Curve ******************/
		/**** md5 signature: e59e8fad0818900531492d1df21d07a6 ****/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "
Parameters
----------
C3D: Geom_Curve
Tol: float

Return
-------
None

Description
-----------
No available documentation.
") Curve;
		void Curve(const opencascade::handle<Geom_Curve> & C3D, const Standard_Real Tol);

		/****************** Curve1 ******************/
		/**** md5 signature: a306dd9436c220a3a90cc21c2a19c805 ****/
		%feature("compactdefaultargs") Curve1;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom2d_Curve>

Description
-----------
No available documentation.
") Curve1;
		const opencascade::handle<Geom2d_Curve> & Curve1();

		/****************** Curve1 ******************/
		/**** md5 signature: fd91e8daf242d68bbe2820c57be32f13 ****/
		%feature("compactdefaultargs") Curve1;
		%feature("autodoc", "
Parameters
----------
PC1: Geom2d_Curve

Return
-------
None

Description
-----------
No available documentation.
") Curve1;
		void Curve1(const opencascade::handle<Geom2d_Curve> & PC1);

		/****************** Curve2 ******************/
		/**** md5 signature: f5d60c1f5a2a15607f83d0cba669b34f ****/
		%feature("compactdefaultargs") Curve2;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom2d_Curve>

Description
-----------
No available documentation.
") Curve2;
		const opencascade::handle<Geom2d_Curve> & Curve2();

		/****************** Curve2 ******************/
		/**** md5 signature: 36634219d55de4c4b906b2079a686144 ****/
		%feature("compactdefaultargs") Curve2;
		%feature("autodoc", "
Parameters
----------
PC2: Geom2d_Curve

Return
-------
None

Description
-----------
No available documentation.
") Curve2;
		void Curve2(const opencascade::handle<Geom2d_Curve> & PC2);

		/****************** DSIndex ******************/
		/**** md5 signature: 0c1df20e7fc560a5a6aeb68151a347a2 ****/
		%feature("compactdefaultargs") DSIndex;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") DSIndex;
		Standard_Integer DSIndex();

		/****************** DefineCurve ******************/
		/**** md5 signature: 725838433163328cad89da4ad0eab9b6 ****/
		%feature("compactdefaultargs") DefineCurve;
		%feature("autodoc", "
Parameters
----------
P: Geom_Curve
T: float
IsWalk: bool

Return
-------
None

Description
-----------
No available documentation.
") DefineCurve;
		void DefineCurve(const opencascade::handle<Geom_Curve> & P, const Standard_Real T, const Standard_Boolean IsWalk);

		/****************** GetSCI ******************/
		/**** md5 signature: 5fd9c24ea42e179b86dcfbcfccd1820b ****/
		%feature("compactdefaultargs") GetSCI;
		%feature("autodoc", "
Parameters
----------
I1: TopOpeBRepDS_Interference
I2: TopOpeBRepDS_Interference

Return
-------
None

Description
-----------
No available documentation.
") GetSCI;
		void GetSCI(opencascade::handle<TopOpeBRepDS_Interference> & I1, opencascade::handle<TopOpeBRepDS_Interference> & I2);

		/****************** GetSCI1 ******************/
		/**** md5 signature: e188e03baf96eae1d28e151ff60ea317 ****/
		%feature("compactdefaultargs") GetSCI1;
		%feature("autodoc", "Return
-------
opencascade::handle<TopOpeBRepDS_Interference>

Description
-----------
No available documentation.
") GetSCI1;
		const opencascade::handle<TopOpeBRepDS_Interference> & GetSCI1();

		/****************** GetSCI2 ******************/
		/**** md5 signature: 2a413ccb701972d663239d2624fa2ff5 ****/
		%feature("compactdefaultargs") GetSCI2;
		%feature("autodoc", "Return
-------
opencascade::handle<TopOpeBRepDS_Interference>

Description
-----------
No available documentation.
") GetSCI2;
		const opencascade::handle<TopOpeBRepDS_Interference> & GetSCI2();

		/****************** GetShapes ******************/
		/**** md5 signature: afd553f86b0ab4e9a4d04d7122dab87e ****/
		%feature("compactdefaultargs") GetShapes;
		%feature("autodoc", "
Parameters
----------
S1: TopoDS_Shape
S2: TopoDS_Shape

Return
-------
None

Description
-----------
No available documentation.
") GetShapes;
		void GetShapes(TopoDS_Shape & S1, TopoDS_Shape & S2);

		/****************** IsWalk ******************/
		/**** md5 signature: 66ccf6ca8d750aa2bca9b1b1c0ea87f9 ****/
		%feature("compactdefaultargs") IsWalk;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsWalk;
		Standard_Boolean IsWalk();

		/****************** Keep ******************/
		/**** md5 signature: 49f5fb06c6fb4c03a84c4eb06dd2637f ****/
		%feature("compactdefaultargs") Keep;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") Keep;
		Standard_Boolean Keep();

		/****************** Mother ******************/
		/**** md5 signature: d14db32971971ed33042eb9000386c14 ****/
		%feature("compactdefaultargs") Mother;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Mother;
		Standard_Integer Mother();

		/****************** Range ******************/
		/**** md5 signature: 399e1aef232e5044dddcdca6c1014dd9 ****/
		%feature("compactdefaultargs") Range;
		%feature("autodoc", "
Parameters
----------

Return
-------
First: float
Last: float

Description
-----------
No available documentation.
") Range;
		Standard_Boolean Range(Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** SetRange ******************/
		/**** md5 signature: 4a19c7b6bd2369f897cb3fd2e6cdf6dd ****/
		%feature("compactdefaultargs") SetRange;
		%feature("autodoc", "
Parameters
----------
First: float
Last: float

Return
-------
None

Description
-----------
No available documentation.
") SetRange;
		void SetRange(const Standard_Real First, const Standard_Real Last);

		/****************** SetSCI ******************/
		/**** md5 signature: 423e8469585bf5f37f922a228def0989 ****/
		%feature("compactdefaultargs") SetSCI;
		%feature("autodoc", "
Parameters
----------
I1: TopOpeBRepDS_Interference
I2: TopOpeBRepDS_Interference

Return
-------
None

Description
-----------
Define the interferences face/curve.
") SetSCI;
		void SetSCI(const opencascade::handle<TopOpeBRepDS_Interference> & I1, const opencascade::handle<TopOpeBRepDS_Interference> & I2);

		/****************** SetShapes ******************/
		/**** md5 signature: a1d7f5311427e380aae9b6a0bfa750c4 ****/
		%feature("compactdefaultargs") SetShapes;
		%feature("autodoc", "
Parameters
----------
S1: TopoDS_Shape
S2: TopoDS_Shape

Return
-------
None

Description
-----------
No available documentation.
") SetShapes;
		void SetShapes(const TopoDS_Shape & S1, const TopoDS_Shape & S2);

		/****************** Shape1 ******************/
		/**** md5 signature: 07a3db9d6b637af56fb1391aee4b7641 ****/
		%feature("compactdefaultargs") Shape1;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") Shape1;
		const TopoDS_Shape Shape1();

		/****************** Shape2 ******************/
		/**** md5 signature: 3655a6c56b55e5313d1b146d7ee7458a ****/
		%feature("compactdefaultargs") Shape2;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") Shape2;
		const TopoDS_Shape Shape2();

		/****************** Tolerance ******************/
		/**** md5 signature: e925b87131cc380a2e6cb497cb7384fa ****/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "
Parameters
----------
tol: float

Return
-------
None

Description
-----------
Update the tolerance.
") Tolerance;
		void Tolerance(const Standard_Real tol);

		/****************** Tolerance ******************/
		/**** md5 signature: 9e5775014410d884d1a1adc1cd47930b ****/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") Tolerance;
		Standard_Real Tolerance();

};


%extend TopOpeBRepDS_Curve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class TopOpeBRepDS_CurveExplorer *
***********************************/
class TopOpeBRepDS_CurveExplorer {
	public:
		/****************** TopOpeBRepDS_CurveExplorer ******************/
		/**** md5 signature: 632d6e194b72d88c80fd65034cacd252 ****/
		%feature("compactdefaultargs") TopOpeBRepDS_CurveExplorer;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepDS_CurveExplorer;
		 TopOpeBRepDS_CurveExplorer();

		/****************** TopOpeBRepDS_CurveExplorer ******************/
		/**** md5 signature: c0701acb0605e0e56ff447b1f7203a30 ****/
		%feature("compactdefaultargs") TopOpeBRepDS_CurveExplorer;
		%feature("autodoc", "
Parameters
----------
DS: TopOpeBRepDS_DataStructure
FindOnlyKeep: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepDS_CurveExplorer;
		 TopOpeBRepDS_CurveExplorer(const TopOpeBRepDS_DataStructure & DS, const Standard_Boolean FindOnlyKeep = Standard_True);

		/****************** Curve ******************/
		/**** md5 signature: ad855b410817599ecd2040b239b5eadd ****/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "Return
-------
TopOpeBRepDS_Curve

Description
-----------
No available documentation.
") Curve;
		const TopOpeBRepDS_Curve & Curve();

		/****************** Curve ******************/
		/**** md5 signature: f53cb61e2b022b236aa70ffbec11ac31 ****/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
TopOpeBRepDS_Curve

Description
-----------
No available documentation.
") Curve;
		const TopOpeBRepDS_Curve & Curve(const Standard_Integer I);

		/****************** Index ******************/
		/**** md5 signature: 407d80ef3037d55996765198adea3908 ****/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Index;
		Standard_Integer Index();

		/****************** Init ******************/
		/**** md5 signature: 3cb53884a0dedff3ad42657c8c345e44 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
DS: TopOpeBRepDS_DataStructure
FindOnlyKeep: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const TopOpeBRepDS_DataStructure & DS, const Standard_Boolean FindOnlyKeep = Standard_True);

		/****************** IsCurve ******************/
		/**** md5 signature: f8407e8ba0b908da25f9e9bcca8ca235 ****/
		%feature("compactdefaultargs") IsCurve;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
bool

Description
-----------
No available documentation.
") IsCurve;
		Standard_Boolean IsCurve(const Standard_Integer I);

		/****************** IsCurveKeep ******************/
		/**** md5 signature: b0656fe012bcbf6c193065206be8cfb3 ****/
		%feature("compactdefaultargs") IsCurveKeep;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
bool

Description
-----------
No available documentation.
") IsCurveKeep;
		Standard_Boolean IsCurveKeep(const Standard_Integer I);

		/****************** More ******************/
		/**** md5 signature: 6f6e915c9a3dca758c059d9e8af02dff ****/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") More;
		Standard_Boolean More();

		/****************** NbCurve ******************/
		/**** md5 signature: d4b093ea6471975ce0cb92d8164116b0 ****/
		%feature("compactdefaultargs") NbCurve;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbCurve;
		Standard_Integer NbCurve();

		/****************** Next ******************/
		/**** md5 signature: f35c0df5f1d7c877986db18081404532 ****/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Next;
		void Next();

};


%extend TopOpeBRepDS_CurveExplorer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class TopOpeBRepDS_DataStructure *
***********************************/
class TopOpeBRepDS_DataStructure {
	public:
		/****************** TopOpeBRepDS_DataStructure ******************/
		/**** md5 signature: bad3ca6b7e33bd5e4622944f75e44de8 ****/
		%feature("compactdefaultargs") TopOpeBRepDS_DataStructure;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepDS_DataStructure;
		 TopOpeBRepDS_DataStructure();

		/****************** AddCurve ******************/
		/**** md5 signature: 536314d052ec1598a85b19cda8574d31 ****/
		%feature("compactdefaultargs") AddCurve;
		%feature("autodoc", "
Parameters
----------
S: TopOpeBRepDS_Curve

Return
-------
int

Description
-----------
Insert a new curve. returns the index.
") AddCurve;
		Standard_Integer AddCurve(const TopOpeBRepDS_Curve & S);

		/****************** AddPoint ******************/
		/**** md5 signature: 1660691bbbd5a65d53b37c5d419c78ad ****/
		%feature("compactdefaultargs") AddPoint;
		%feature("autodoc", "
Parameters
----------
PDS: TopOpeBRepDS_Point

Return
-------
int

Description
-----------
Insert a new point. returns the index.
") AddPoint;
		Standard_Integer AddPoint(const TopOpeBRepDS_Point & PDS);

		/****************** AddPointSS ******************/
		/**** md5 signature: 6a6ba9e50dc4ec7e303372f43a3b7b49 ****/
		%feature("compactdefaultargs") AddPointSS;
		%feature("autodoc", "
Parameters
----------
PDS: TopOpeBRepDS_Point
S1: TopoDS_Shape
S2: TopoDS_Shape

Return
-------
int

Description
-----------
Insert a new point. returns the index.
") AddPointSS;
		Standard_Integer AddPointSS(const TopOpeBRepDS_Point & PDS, const TopoDS_Shape & S1, const TopoDS_Shape & S2);

		/****************** AddSectionEdge ******************/
		/**** md5 signature: 135b445dae35ce43de370fa83956831e ****/
		%feature("compactdefaultargs") AddSectionEdge;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge

Return
-------
int

Description
-----------
No available documentation.
") AddSectionEdge;
		Standard_Integer AddSectionEdge(const TopoDS_Edge & E);

		/****************** AddShape ******************/
		/**** md5 signature: c451987d8af344862bcedcb55c2e67f4 ****/
		%feature("compactdefaultargs") AddShape;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
int

Description
-----------
Insert a shape s. returns the index.
") AddShape;
		Standard_Integer AddShape(const TopoDS_Shape & S);

		/****************** AddShape ******************/
		/**** md5 signature: 3a33334e90bbe52b73a13279c2a7055b ****/
		%feature("compactdefaultargs") AddShape;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
I: int

Return
-------
int

Description
-----------
Insert a shape s which ancestor is i = 1 or 2. returns the index.
") AddShape;
		Standard_Integer AddShape(const TopoDS_Shape & S, const Standard_Integer I);

		/****************** AddShapeInterference ******************/
		/**** md5 signature: dfbd0f55c4b90afe9386f234f93b2caf ****/
		%feature("compactdefaultargs") AddShapeInterference;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
I: TopOpeBRepDS_Interference

Return
-------
None

Description
-----------
No available documentation.
") AddShapeInterference;
		void AddShapeInterference(const TopoDS_Shape & S, const opencascade::handle<TopOpeBRepDS_Interference> & I);

		/****************** AddShapeSameDomain ******************/
		/**** md5 signature: fe10a4775c3d346e9027a750dcc5fce0 ****/
		%feature("compactdefaultargs") AddShapeSameDomain;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
SSD: TopoDS_Shape

Return
-------
None

Description
-----------
No available documentation.
") AddShapeSameDomain;
		void AddShapeSameDomain(const TopoDS_Shape & S, const TopoDS_Shape & SSD);

		/****************** AddSurface ******************/
		/**** md5 signature: 78c0f2ee65d21c911a1531c2c7d8e876 ****/
		%feature("compactdefaultargs") AddSurface;
		%feature("autodoc", "
Parameters
----------
S: TopOpeBRepDS_Surface

Return
-------
int

Description
-----------
Insert a new surface. returns the index.
") AddSurface;
		Standard_Integer AddSurface(const TopOpeBRepDS_Surface & S);

		/****************** AncestorRank ******************/
		/**** md5 signature: 9208946994ce6724866cfa51407fc62f ****/
		%feature("compactdefaultargs") AncestorRank;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
int

Description
-----------
No available documentation.
") AncestorRank;
		Standard_Integer AncestorRank(const Standard_Integer I);

		/****************** AncestorRank ******************/
		/**** md5 signature: 962427246486e1c68d80c16027531953 ****/
		%feature("compactdefaultargs") AncestorRank;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
int

Description
-----------
No available documentation.
") AncestorRank;
		Standard_Integer AncestorRank(const TopoDS_Shape & S);

		/****************** AncestorRank ******************/
		/**** md5 signature: 416b03cc7621f4695e4c1c3abb59f5f2 ****/
		%feature("compactdefaultargs") AncestorRank;
		%feature("autodoc", "
Parameters
----------
I: int
Ianc: int

Return
-------
None

Description
-----------
No available documentation.
") AncestorRank;
		void AncestorRank(const Standard_Integer I, const Standard_Integer Ianc);

		/****************** AncestorRank ******************/
		/**** md5 signature: 6435424809880d1c5a01b8622c605f62 ****/
		%feature("compactdefaultargs") AncestorRank;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
Ianc: int

Return
-------
None

Description
-----------
No available documentation.
") AncestorRank;
		void AncestorRank(const TopoDS_Shape & S, const Standard_Integer Ianc);

		/****************** ChangeCurve ******************/
		/**** md5 signature: 0963e13770cf795b99436987493a8a15 ****/
		%feature("compactdefaultargs") ChangeCurve;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
TopOpeBRepDS_Curve

Description
-----------
Returns the curve of index <i>.
") ChangeCurve;
		TopOpeBRepDS_Curve & ChangeCurve(const Standard_Integer I);

		/****************** ChangeCurveInterferences ******************/
		/**** md5 signature: 7deab7ca7e22e42e7a56f29ee8deec68 ****/
		%feature("compactdefaultargs") ChangeCurveInterferences;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
TopOpeBRepDS_ListOfInterference

Description
-----------
No available documentation.
") ChangeCurveInterferences;
		TopOpeBRepDS_ListOfInterference & ChangeCurveInterferences(const Standard_Integer I);

		/****************** ChangeKeepCurve ******************/
		/**** md5 signature: 4070cbb88042c78999bf00a2161ac9aa ****/
		%feature("compactdefaultargs") ChangeKeepCurve;
		%feature("autodoc", "
Parameters
----------
I: int
FindKeep: bool

Return
-------
None

Description
-----------
No available documentation.
") ChangeKeepCurve;
		void ChangeKeepCurve(const Standard_Integer I, const Standard_Boolean FindKeep);

		/****************** ChangeKeepCurve ******************/
		/**** md5 signature: bd15a97145444ff65f98c8ce8982593e ****/
		%feature("compactdefaultargs") ChangeKeepCurve;
		%feature("autodoc", "
Parameters
----------
C: TopOpeBRepDS_Curve
FindKeep: bool

Return
-------
None

Description
-----------
No available documentation.
") ChangeKeepCurve;
		void ChangeKeepCurve(TopOpeBRepDS_Curve & C, const Standard_Boolean FindKeep);

		/****************** ChangeKeepPoint ******************/
		/**** md5 signature: a4f111963e183c8efc05d35e57c1e848 ****/
		%feature("compactdefaultargs") ChangeKeepPoint;
		%feature("autodoc", "
Parameters
----------
I: int
FindKeep: bool

Return
-------
None

Description
-----------
No available documentation.
") ChangeKeepPoint;
		void ChangeKeepPoint(const Standard_Integer I, const Standard_Boolean FindKeep);

		/****************** ChangeKeepPoint ******************/
		/**** md5 signature: 066e2a50a54f5f4a40ec489dbeb09c82 ****/
		%feature("compactdefaultargs") ChangeKeepPoint;
		%feature("autodoc", "
Parameters
----------
P: TopOpeBRepDS_Point
FindKeep: bool

Return
-------
None

Description
-----------
No available documentation.
") ChangeKeepPoint;
		void ChangeKeepPoint(TopOpeBRepDS_Point & P, const Standard_Boolean FindKeep);

		/****************** ChangeKeepShape ******************/
		/**** md5 signature: 6210d7ece8c1f1578866f3be6eb1859c ****/
		%feature("compactdefaultargs") ChangeKeepShape;
		%feature("autodoc", "
Parameters
----------
I: int
FindKeep: bool

Return
-------
None

Description
-----------
No available documentation.
") ChangeKeepShape;
		void ChangeKeepShape(const Standard_Integer I, const Standard_Boolean FindKeep);

		/****************** ChangeKeepShape ******************/
		/**** md5 signature: b8b96d1ef3e8f90505ad39e9a82d1771 ****/
		%feature("compactdefaultargs") ChangeKeepShape;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
FindKeep: bool

Return
-------
None

Description
-----------
No available documentation.
") ChangeKeepShape;
		void ChangeKeepShape(const TopoDS_Shape & S, const Standard_Boolean FindKeep);

		/****************** ChangeKeepSurface ******************/
		/**** md5 signature: 6eb03af2c227ffbca9e9cb9adb640c32 ****/
		%feature("compactdefaultargs") ChangeKeepSurface;
		%feature("autodoc", "
Parameters
----------
I: int
FindKeep: bool

Return
-------
None

Description
-----------
No available documentation.
") ChangeKeepSurface;
		void ChangeKeepSurface(const Standard_Integer I, const Standard_Boolean FindKeep);

		/****************** ChangeKeepSurface ******************/
		/**** md5 signature: 69f3fa757fc8355475728bf401e9c5dd ****/
		%feature("compactdefaultargs") ChangeKeepSurface;
		%feature("autodoc", "
Parameters
----------
S: TopOpeBRepDS_Surface
FindKeep: bool

Return
-------
None

Description
-----------
No available documentation.
") ChangeKeepSurface;
		void ChangeKeepSurface(TopOpeBRepDS_Surface & S, const Standard_Boolean FindKeep);

		/****************** ChangeMapOfRejectedShapesObj ******************/
		/**** md5 signature: e40559c2eada0493596e18730a9c83f4 ****/
		%feature("compactdefaultargs") ChangeMapOfRejectedShapesObj;
		%feature("autodoc", "Return
-------
TopTools_IndexedMapOfShape

Description
-----------
No available documentation.
") ChangeMapOfRejectedShapesObj;
		TopTools_IndexedMapOfShape & ChangeMapOfRejectedShapesObj();

		/****************** ChangeMapOfRejectedShapesTool ******************/
		/**** md5 signature: 3d138fb53314f7a5a40fe9a6bc36a7d3 ****/
		%feature("compactdefaultargs") ChangeMapOfRejectedShapesTool;
		%feature("autodoc", "Return
-------
TopTools_IndexedMapOfShape

Description
-----------
No available documentation.
") ChangeMapOfRejectedShapesTool;
		TopTools_IndexedMapOfShape & ChangeMapOfRejectedShapesTool();

		/****************** ChangeMapOfShapeWithState ******************/
		/**** md5 signature: cf7ca25726f7a47424fa1e24c9eaffad ****/
		%feature("compactdefaultargs") ChangeMapOfShapeWithState;
		%feature("autodoc", "
Parameters
----------
aShape: TopoDS_Shape

Return
-------
aFlag: bool

Description
-----------
No available documentation.
") ChangeMapOfShapeWithState;
		TopOpeBRepDS_IndexedDataMapOfShapeWithState & ChangeMapOfShapeWithState(const TopoDS_Shape & aShape, Standard_Boolean &OutValue);

		/****************** ChangeMapOfShapeWithStateObj ******************/
		/**** md5 signature: 6e81b081dcbc1e04934ac25b851372dc ****/
		%feature("compactdefaultargs") ChangeMapOfShapeWithStateObj;
		%feature("autodoc", "Return
-------
TopOpeBRepDS_IndexedDataMapOfShapeWithState

Description
-----------
No available documentation.
") ChangeMapOfShapeWithStateObj;
		TopOpeBRepDS_IndexedDataMapOfShapeWithState & ChangeMapOfShapeWithStateObj();

		/****************** ChangeMapOfShapeWithStateTool ******************/
		/**** md5 signature: 7c5055cc273de3803b1a58bf0d74f8a8 ****/
		%feature("compactdefaultargs") ChangeMapOfShapeWithStateTool;
		%feature("autodoc", "Return
-------
TopOpeBRepDS_IndexedDataMapOfShapeWithState

Description
-----------
No available documentation.
") ChangeMapOfShapeWithStateTool;
		TopOpeBRepDS_IndexedDataMapOfShapeWithState & ChangeMapOfShapeWithStateTool();

		/****************** ChangeNbCurves ******************/
		/**** md5 signature: 61918d90723549dda13bcb2198f3f6a1 ****/
		%feature("compactdefaultargs") ChangeNbCurves;
		%feature("autodoc", "
Parameters
----------
N: int

Return
-------
None

Description
-----------
No available documentation.
") ChangeNbCurves;
		void ChangeNbCurves(const Standard_Integer N);

		/****************** ChangePoint ******************/
		/**** md5 signature: f328d7e06d1ef5c46763a0489395f251 ****/
		%feature("compactdefaultargs") ChangePoint;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
TopOpeBRepDS_Point

Description
-----------
Returns the point of index <i>.
") ChangePoint;
		TopOpeBRepDS_Point & ChangePoint(const Standard_Integer I);

		/****************** ChangePointInterferences ******************/
		/**** md5 signature: 2a5052527e6519704e556eaa65900401 ****/
		%feature("compactdefaultargs") ChangePointInterferences;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
TopOpeBRepDS_ListOfInterference

Description
-----------
No available documentation.
") ChangePointInterferences;
		TopOpeBRepDS_ListOfInterference & ChangePointInterferences(const Standard_Integer I);

		/****************** ChangeShapeInterferences ******************/
		/**** md5 signature: ce1a8a73e7ce343c3d3e3e3f5422ecd1 ****/
		%feature("compactdefaultargs") ChangeShapeInterferences;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
TopOpeBRepDS_ListOfInterference

Description
-----------
No available documentation.
") ChangeShapeInterferences;
		TopOpeBRepDS_ListOfInterference & ChangeShapeInterferences(const TopoDS_Shape & S);

		/****************** ChangeShapeInterferences ******************/
		/**** md5 signature: c7c62d3c2d46def711397ef32fa49dc1 ****/
		%feature("compactdefaultargs") ChangeShapeInterferences;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
TopOpeBRepDS_ListOfInterference

Description
-----------
No available documentation.
") ChangeShapeInterferences;
		TopOpeBRepDS_ListOfInterference & ChangeShapeInterferences(const Standard_Integer I);

		/****************** ChangeShapeSameDomain ******************/
		/**** md5 signature: ef398371e60f7181b036dab752b7daed ****/
		%feature("compactdefaultargs") ChangeShapeSameDomain;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
TopTools_ListOfShape

Description
-----------
No available documentation.
") ChangeShapeSameDomain;
		TopTools_ListOfShape & ChangeShapeSameDomain(const TopoDS_Shape & S);

		/****************** ChangeShapeSameDomain ******************/
		/**** md5 signature: 5b49d2b8d5777a7f0965113f565e2b9f ****/
		%feature("compactdefaultargs") ChangeShapeSameDomain;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
TopTools_ListOfShape

Description
-----------
No available documentation.
") ChangeShapeSameDomain;
		TopTools_ListOfShape & ChangeShapeSameDomain(const Standard_Integer I);

		/****************** ChangeShapes ******************/
		/**** md5 signature: 5939b51e203c5eb042017ec89d062826 ****/
		%feature("compactdefaultargs") ChangeShapes;
		%feature("autodoc", "Return
-------
TopOpeBRepDS_MapOfShapeData

Description
-----------
No available documentation.
") ChangeShapes;
		TopOpeBRepDS_MapOfShapeData & ChangeShapes();

		/****************** ChangeSurface ******************/
		/**** md5 signature: df871aa12b0a35203ee1f41548d4667c ****/
		%feature("compactdefaultargs") ChangeSurface;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
TopOpeBRepDS_Surface

Description
-----------
Returns the surface of index <i>.
") ChangeSurface;
		TopOpeBRepDS_Surface & ChangeSurface(const Standard_Integer I);

		/****************** ChangeSurfaceInterferences ******************/
		/**** md5 signature: b092d6884d606ccce117b72ba79b7234 ****/
		%feature("compactdefaultargs") ChangeSurfaceInterferences;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
TopOpeBRepDS_ListOfInterference

Description
-----------
No available documentation.
") ChangeSurfaceInterferences;
		TopOpeBRepDS_ListOfInterference & ChangeSurfaceInterferences(const Standard_Integer I);

		/****************** Curve ******************/
		/**** md5 signature: f53cb61e2b022b236aa70ffbec11ac31 ****/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
TopOpeBRepDS_Curve

Description
-----------
Returns the curve of index <i>.
") Curve;
		const TopOpeBRepDS_Curve & Curve(const Standard_Integer I);

		/****************** CurveInterferences ******************/
		/**** md5 signature: 0ae607216e1128d734c938cbcd7a9b19 ****/
		%feature("compactdefaultargs") CurveInterferences;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
TopOpeBRepDS_ListOfInterference

Description
-----------
No available documentation.
") CurveInterferences;
		const TopOpeBRepDS_ListOfInterference & CurveInterferences(const Standard_Integer I);

		/****************** FillShapesSameDomain ******************/
		/**** md5 signature: 9b085f8f00de0ab0fb18482c7f2aba0a ****/
		%feature("compactdefaultargs") FillShapesSameDomain;
		%feature("autodoc", "
Parameters
----------
S1: TopoDS_Shape
S2: TopoDS_Shape
refFirst: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
No available documentation.
") FillShapesSameDomain;
		void FillShapesSameDomain(const TopoDS_Shape & S1, const TopoDS_Shape & S2, const Standard_Boolean refFirst = Standard_True);

		/****************** FillShapesSameDomain ******************/
		/**** md5 signature: 2c20793bceac1cb02fd82f898232bb78 ****/
		%feature("compactdefaultargs") FillShapesSameDomain;
		%feature("autodoc", "
Parameters
----------
S1: TopoDS_Shape
S2: TopoDS_Shape
c1: TopOpeBRepDS_Config
c2: TopOpeBRepDS_Config
refFirst: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
No available documentation.
") FillShapesSameDomain;
		void FillShapesSameDomain(const TopoDS_Shape & S1, const TopoDS_Shape & S2, const TopOpeBRepDS_Config c1, const TopOpeBRepDS_Config c2, const Standard_Boolean refFirst = Standard_True);

		/****************** GetShapeWithState ******************/
		/**** md5 signature: a6f2b4fcd0e7a847188e96d6fa4347ba ****/
		%feature("compactdefaultargs") GetShapeWithState;
		%feature("autodoc", "
Parameters
----------
aShape: TopoDS_Shape

Return
-------
TopOpeBRepDS_ShapeWithState

Description
-----------
No available documentation.
") GetShapeWithState;
		const TopOpeBRepDS_ShapeWithState & GetShapeWithState(const TopoDS_Shape & aShape);

		/****************** HasGeometry ******************/
		/**** md5 signature: 515d3381600536728112287b52b5cac8 ****/
		%feature("compactdefaultargs") HasGeometry;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
bool

Description
-----------
Returns true if <s> has new geometries, i.e: true si: hasshape(s) true s a une liste d'interferences non vide. s = solid, face, edge: true/false s = shell, wire, vertex: false.
") HasGeometry;
		Standard_Boolean HasGeometry(const TopoDS_Shape & S);

		/****************** HasNewSurface ******************/
		/**** md5 signature: 4520d52fb0be8c5259d9561c83cbec20 ****/
		%feature("compactdefaultargs") HasNewSurface;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Shape

Return
-------
bool

Description
-----------
No available documentation.
") HasNewSurface;
		Standard_Boolean HasNewSurface(const TopoDS_Shape & F);

		/****************** HasShape ******************/
		/**** md5 signature: 5afea513cd4da105b0a805fd98689f7b ****/
		%feature("compactdefaultargs") HasShape;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
FindKeep: bool (optional, default to Standard_True)

Return
-------
bool

Description
-----------
Returns true if <s> est dans myshapes.
") HasShape;
		Standard_Boolean HasShape(const TopoDS_Shape & S, const Standard_Boolean FindKeep = Standard_True);

		/****************** Init ******************/
		/**** md5 signature: 0de93ef32c53d091768788dca0e281fd ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Return
-------
None

Description
-----------
Reset the data structure.
") Init;
		void Init();

		/****************** InitSectionEdges ******************/
		/**** md5 signature: 8a9fd75a3bda2254991fb49f99a7add4 ****/
		%feature("compactdefaultargs") InitSectionEdges;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") InitSectionEdges;
		void InitSectionEdges();

		/****************** IsSectionEdge ******************/
		/**** md5 signature: 48c5e1d6cbf668c80de3274958fb7aad ****/
		%feature("compactdefaultargs") IsSectionEdge;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
FindKeep: bool (optional, default to Standard_True)

Return
-------
bool

Description
-----------
No available documentation.
") IsSectionEdge;
		Standard_Boolean IsSectionEdge(const TopoDS_Edge & E, const Standard_Boolean FindKeep = Standard_True);

		/****************** Isfafa ******************/
		/**** md5 signature: 627b4d3daad0ef2a74d63fc5001f22c5 ****/
		%feature("compactdefaultargs") Isfafa;
		%feature("autodoc", "
Parameters
----------
isfafa: bool

Return
-------
None

Description
-----------
No available documentation.
") Isfafa;
		void Isfafa(const Standard_Boolean isfafa);

		/****************** Isfafa ******************/
		/**** md5 signature: c33bc00e352e9205edc83c835d0965a9 ****/
		%feature("compactdefaultargs") Isfafa;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") Isfafa;
		Standard_Boolean Isfafa();

		/****************** KeepCurve ******************/
		/**** md5 signature: a31a1de3acdc06b8d608a4825c7b65d1 ****/
		%feature("compactdefaultargs") KeepCurve;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
bool

Description
-----------
No available documentation.
") KeepCurve;
		Standard_Boolean KeepCurve(const Standard_Integer I);

		/****************** KeepCurve ******************/
		/**** md5 signature: 819d464c0a535e10eb3ccd04e73534f9 ****/
		%feature("compactdefaultargs") KeepCurve;
		%feature("autodoc", "
Parameters
----------
C: TopOpeBRepDS_Curve

Return
-------
bool

Description
-----------
No available documentation.
") KeepCurve;
		Standard_Boolean KeepCurve(const TopOpeBRepDS_Curve & C);

		/****************** KeepPoint ******************/
		/**** md5 signature: c25a8067859a9a79c209816fb30a01f5 ****/
		%feature("compactdefaultargs") KeepPoint;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
bool

Description
-----------
No available documentation.
") KeepPoint;
		Standard_Boolean KeepPoint(const Standard_Integer I);

		/****************** KeepPoint ******************/
		/**** md5 signature: 73c36fa076d5daf4a05be4fafb7459ba ****/
		%feature("compactdefaultargs") KeepPoint;
		%feature("autodoc", "
Parameters
----------
P: TopOpeBRepDS_Point

Return
-------
bool

Description
-----------
No available documentation.
") KeepPoint;
		Standard_Boolean KeepPoint(const TopOpeBRepDS_Point & P);

		/****************** KeepShape ******************/
		/**** md5 signature: 42d63f4833fb0f4baa5b575971397ec7 ****/
		%feature("compactdefaultargs") KeepShape;
		%feature("autodoc", "
Parameters
----------
I: int
FindKeep: bool (optional, default to Standard_True)

Return
-------
bool

Description
-----------
No available documentation.
") KeepShape;
		Standard_Boolean KeepShape(const Standard_Integer I, const Standard_Boolean FindKeep = Standard_True);

		/****************** KeepShape ******************/
		/**** md5 signature: 8022899b383af025b8b4518995a74765 ****/
		%feature("compactdefaultargs") KeepShape;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
FindKeep: bool (optional, default to Standard_True)

Return
-------
bool

Description
-----------
No available documentation.
") KeepShape;
		Standard_Boolean KeepShape(const TopoDS_Shape & S, const Standard_Boolean FindKeep = Standard_True);

		/****************** KeepSurface ******************/
		/**** md5 signature: 1306c7905bac38efdc491cb827df27c8 ****/
		%feature("compactdefaultargs") KeepSurface;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
bool

Description
-----------
No available documentation.
") KeepSurface;
		Standard_Boolean KeepSurface(const Standard_Integer I);

		/****************** KeepSurface ******************/
		/**** md5 signature: bb98baef27e6279929b589dc67f12903 ****/
		%feature("compactdefaultargs") KeepSurface;
		%feature("autodoc", "
Parameters
----------
S: TopOpeBRepDS_Surface

Return
-------
bool

Description
-----------
No available documentation.
") KeepSurface;
		Standard_Boolean KeepSurface(TopOpeBRepDS_Surface & S);

		/****************** NbCurves ******************/
		/**** md5 signature: f7f6dbd981df076443155a5a87b5c223 ****/
		%feature("compactdefaultargs") NbCurves;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbCurves;
		Standard_Integer NbCurves();

		/****************** NbPoints ******************/
		/**** md5 signature: 1d4bbbd7c4dda4f1e56c00ae994bedbe ****/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbPoints;
		Standard_Integer NbPoints();

		/****************** NbSectionEdges ******************/
		/**** md5 signature: aea8f7c64070df22874bc46708a9d81c ****/
		%feature("compactdefaultargs") NbSectionEdges;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbSectionEdges;
		Standard_Integer NbSectionEdges();

		/****************** NbShapes ******************/
		/**** md5 signature: ea90d1514db96ad18becf0e04a33abf6 ****/
		%feature("compactdefaultargs") NbShapes;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbShapes;
		Standard_Integer NbShapes();

		/****************** NbSurfaces ******************/
		/**** md5 signature: fbc438e1ec12b28d849e6d0aeb23caaa ****/
		%feature("compactdefaultargs") NbSurfaces;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbSurfaces;
		Standard_Integer NbSurfaces();

		/****************** NewSurface ******************/
		/**** md5 signature: 7add5b9199c86c93a7ee2ecb3009e02b ****/
		%feature("compactdefaultargs") NewSurface;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Shape

Return
-------
opencascade::handle<Geom_Surface>

Description
-----------
No available documentation.
") NewSurface;
		const opencascade::handle<Geom_Surface> & NewSurface(const TopoDS_Shape & F);

		/****************** Point ******************/
		/**** md5 signature: 5b8c65793f4550a005f74995c521586b ****/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
TopOpeBRepDS_Point

Description
-----------
Returns the point of index <i>.
") Point;
		const TopOpeBRepDS_Point & Point(const Standard_Integer I);

		/****************** PointInterferences ******************/
		/**** md5 signature: 06b954c921d0d1e460c381ddbe58ac66 ****/
		%feature("compactdefaultargs") PointInterferences;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
TopOpeBRepDS_ListOfInterference

Description
-----------
No available documentation.
") PointInterferences;
		const TopOpeBRepDS_ListOfInterference & PointInterferences(const Standard_Integer I);

		/****************** RemoveCurve ******************/
		/**** md5 signature: 195425abb6b81c28c9baa5e9f38c8649 ****/
		%feature("compactdefaultargs") RemoveCurve;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
None

Description
-----------
No available documentation.
") RemoveCurve;
		void RemoveCurve(const Standard_Integer I);

		/****************** RemovePoint ******************/
		/**** md5 signature: c7bf0e4af319953519a4144b346ae43d ****/
		%feature("compactdefaultargs") RemovePoint;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
None

Description
-----------
No available documentation.
") RemovePoint;
		void RemovePoint(const Standard_Integer I);

		/****************** RemoveShapeInterference ******************/
		/**** md5 signature: 412e6543d3fd7929a60f32d7a69d67f2 ****/
		%feature("compactdefaultargs") RemoveShapeInterference;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
I: TopOpeBRepDS_Interference

Return
-------
None

Description
-----------
No available documentation.
") RemoveShapeInterference;
		void RemoveShapeInterference(const TopoDS_Shape & S, const opencascade::handle<TopOpeBRepDS_Interference> & I);

		/****************** RemoveShapeSameDomain ******************/
		/**** md5 signature: f50e763fe94ec1790029ac6e97357534 ****/
		%feature("compactdefaultargs") RemoveShapeSameDomain;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
SSD: TopoDS_Shape

Return
-------
None

Description
-----------
No available documentation.
") RemoveShapeSameDomain;
		void RemoveShapeSameDomain(const TopoDS_Shape & S, const TopoDS_Shape & SSD);

		/****************** RemoveSurface ******************/
		/**** md5 signature: a69795b89612c323bca1cbc3d673efe5 ****/
		%feature("compactdefaultargs") RemoveSurface;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
None

Description
-----------
No available documentation.
") RemoveSurface;
		void RemoveSurface(const Standard_Integer I);

		/****************** SameDomainInd ******************/
		/**** md5 signature: f56179352f4117ca69ca4087b1b0f5f5 ****/
		%feature("compactdefaultargs") SameDomainInd;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
int

Description
-----------
No available documentation.
") SameDomainInd;
		Standard_Integer SameDomainInd(const Standard_Integer I);

		/****************** SameDomainInd ******************/
		/**** md5 signature: 6f0a88aed570b81816061ae0eb4d1e82 ****/
		%feature("compactdefaultargs") SameDomainInd;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
int

Description
-----------
No available documentation.
") SameDomainInd;
		Standard_Integer SameDomainInd(const TopoDS_Shape & S);

		/****************** SameDomainInd ******************/
		/**** md5 signature: cad8376b20aa19813e52027a34b83505 ****/
		%feature("compactdefaultargs") SameDomainInd;
		%feature("autodoc", "
Parameters
----------
I: int
Ind: int

Return
-------
None

Description
-----------
No available documentation.
") SameDomainInd;
		void SameDomainInd(const Standard_Integer I, const Standard_Integer Ind);

		/****************** SameDomainInd ******************/
		/**** md5 signature: e59bc7a08b6820b92c68b6007a300c04 ****/
		%feature("compactdefaultargs") SameDomainInd;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
Ind: int

Return
-------
None

Description
-----------
No available documentation.
") SameDomainInd;
		void SameDomainInd(const TopoDS_Shape & S, const Standard_Integer Ind);

		/****************** SameDomainOri ******************/
		/**** md5 signature: e17e474da5df36106cb5b63a342b0de1 ****/
		%feature("compactdefaultargs") SameDomainOri;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
TopOpeBRepDS_Config

Description
-----------
No available documentation.
") SameDomainOri;
		TopOpeBRepDS_Config SameDomainOri(const Standard_Integer I);

		/****************** SameDomainOri ******************/
		/**** md5 signature: f5745d68e6f11784571b9b419388de6b ****/
		%feature("compactdefaultargs") SameDomainOri;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
TopOpeBRepDS_Config

Description
-----------
No available documentation.
") SameDomainOri;
		TopOpeBRepDS_Config SameDomainOri(const TopoDS_Shape & S);

		/****************** SameDomainOri ******************/
		/**** md5 signature: 5feee33f07dec4e9f64d583aeb283a57 ****/
		%feature("compactdefaultargs") SameDomainOri;
		%feature("autodoc", "
Parameters
----------
I: int
Ori: TopOpeBRepDS_Config

Return
-------
None

Description
-----------
No available documentation.
") SameDomainOri;
		void SameDomainOri(const Standard_Integer I, const TopOpeBRepDS_Config Ori);

		/****************** SameDomainOri ******************/
		/**** md5 signature: 4e62c89b45488901580ee57713832fc7 ****/
		%feature("compactdefaultargs") SameDomainOri;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
Ori: TopOpeBRepDS_Config

Return
-------
None

Description
-----------
No available documentation.
") SameDomainOri;
		void SameDomainOri(const TopoDS_Shape & S, const TopOpeBRepDS_Config Ori);

		/****************** SameDomainRef ******************/
		/**** md5 signature: d905234925d75a0cf96827306b66a6f8 ****/
		%feature("compactdefaultargs") SameDomainRef;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
int

Description
-----------
No available documentation.
") SameDomainRef;
		Standard_Integer SameDomainRef(const Standard_Integer I);

		/****************** SameDomainRef ******************/
		/**** md5 signature: 526031793d8c10151b323146cd2137b6 ****/
		%feature("compactdefaultargs") SameDomainRef;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
int

Description
-----------
No available documentation.
") SameDomainRef;
		Standard_Integer SameDomainRef(const TopoDS_Shape & S);

		/****************** SameDomainRef ******************/
		/**** md5 signature: e2c1f51d8216243aee8e9ca18e5ee030 ****/
		%feature("compactdefaultargs") SameDomainRef;
		%feature("autodoc", "
Parameters
----------
I: int
Ref: int

Return
-------
None

Description
-----------
No available documentation.
") SameDomainRef;
		void SameDomainRef(const Standard_Integer I, const Standard_Integer Ref);

		/****************** SameDomainRef ******************/
		/**** md5 signature: c4971ef3bef119a1854e73f0db5bd833 ****/
		%feature("compactdefaultargs") SameDomainRef;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
Ref: int

Return
-------
None

Description
-----------
No available documentation.
") SameDomainRef;
		void SameDomainRef(const TopoDS_Shape & S, const Standard_Integer Ref);

		/****************** SectionEdge ******************/
		/**** md5 signature: ec2665bd1079cd0f52a4e5419be32faa ****/
		%feature("compactdefaultargs") SectionEdge;
		%feature("autodoc", "
Parameters
----------
I: int
FindKeep: bool (optional, default to Standard_True)

Return
-------
TopoDS_Edge

Description
-----------
No available documentation.
") SectionEdge;
		const TopoDS_Edge SectionEdge(const Standard_Integer I, const Standard_Boolean FindKeep = Standard_True);

		/****************** SectionEdge ******************/
		/**** md5 signature: 4fe69fdd3fecc294f0813b9064c01390 ****/
		%feature("compactdefaultargs") SectionEdge;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
FindKeep: bool (optional, default to Standard_True)

Return
-------
int

Description
-----------
No available documentation.
") SectionEdge;
		Standard_Integer SectionEdge(const TopoDS_Edge & E, const Standard_Boolean FindKeep = Standard_True);

		/****************** SetNewSurface ******************/
		/**** md5 signature: d9f8b56466b71f82a0c5d38767680a12 ****/
		%feature("compactdefaultargs") SetNewSurface;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Shape
S: Geom_Surface

Return
-------
None

Description
-----------
No available documentation.
") SetNewSurface;
		void SetNewSurface(const TopoDS_Shape & F, const opencascade::handle<Geom_Surface> & S);

		/****************** Shape ******************/
		/**** md5 signature: 2a9802512a4fc686052467294ae73114 ****/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "
Parameters
----------
I: int
FindKeep: bool (optional, default to Standard_True)

Return
-------
TopoDS_Shape

Description
-----------
Returns the shape of index i stored in the map myshapes, accessing a list of interference.
") Shape;
		const TopoDS_Shape Shape(const Standard_Integer I, const Standard_Boolean FindKeep = Standard_True);

		/****************** Shape ******************/
		/**** md5 signature: f7e95ef33c87fbd9433c9833cd48ad97 ****/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
FindKeep: bool (optional, default to Standard_True)

Return
-------
int

Description
-----------
Returns the index of shape <s> stored in the map myshapes, accessing a list of interference. returns 0 if <s> is not in the map.
") Shape;
		Standard_Integer Shape(const TopoDS_Shape & S, const Standard_Boolean FindKeep = Standard_True);

		/****************** ShapeInterferences ******************/
		/**** md5 signature: c868e708a42528c47a0ca2a4c3f6a0e4 ****/
		%feature("compactdefaultargs") ShapeInterferences;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
FindKeep: bool (optional, default to Standard_True)

Return
-------
TopOpeBRepDS_ListOfInterference

Description
-----------
No available documentation.
") ShapeInterferences;
		const TopOpeBRepDS_ListOfInterference & ShapeInterferences(const TopoDS_Shape & S, const Standard_Boolean FindKeep = Standard_True);

		/****************** ShapeInterferences ******************/
		/**** md5 signature: ece9e59140b26b1432b40d26cf22bb47 ****/
		%feature("compactdefaultargs") ShapeInterferences;
		%feature("autodoc", "
Parameters
----------
I: int
FindKeep: bool (optional, default to Standard_True)

Return
-------
TopOpeBRepDS_ListOfInterference

Description
-----------
No available documentation.
") ShapeInterferences;
		const TopOpeBRepDS_ListOfInterference & ShapeInterferences(const Standard_Integer I, const Standard_Boolean FindKeep = Standard_True);

		/****************** ShapeSameDomain ******************/
		/**** md5 signature: 05999893fcaefdaecc7122403e98d5cc ****/
		%feature("compactdefaultargs") ShapeSameDomain;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
TopTools_ListOfShape

Description
-----------
No available documentation.
") ShapeSameDomain;
		const TopTools_ListOfShape & ShapeSameDomain(const TopoDS_Shape & S);

		/****************** ShapeSameDomain ******************/
		/**** md5 signature: 5c698556b709903375c4c06d616536f7 ****/
		%feature("compactdefaultargs") ShapeSameDomain;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
TopTools_ListOfShape

Description
-----------
No available documentation.
") ShapeSameDomain;
		const TopTools_ListOfShape & ShapeSameDomain(const Standard_Integer I);

		/****************** Surface ******************/
		/**** md5 signature: 0fa398e726541e213860705286d521cb ****/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
TopOpeBRepDS_Surface

Description
-----------
Returns the surface of index <i>.
") Surface;
		const TopOpeBRepDS_Surface & Surface(const Standard_Integer I);

		/****************** SurfaceInterferences ******************/
		/**** md5 signature: 732d2b836e88fd503fa982b880b0a0eb ****/
		%feature("compactdefaultargs") SurfaceInterferences;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
TopOpeBRepDS_ListOfInterference

Description
-----------
No available documentation.
") SurfaceInterferences;
		const TopOpeBRepDS_ListOfInterference & SurfaceInterferences(const Standard_Integer I);

		/****************** UnfillShapesSameDomain ******************/
		/**** md5 signature: 905209a2e684aadc3d1ca6d75dc22261 ****/
		%feature("compactdefaultargs") UnfillShapesSameDomain;
		%feature("autodoc", "
Parameters
----------
S1: TopoDS_Shape
S2: TopoDS_Shape

Return
-------
None

Description
-----------
No available documentation.
") UnfillShapesSameDomain;
		void UnfillShapesSameDomain(const TopoDS_Shape & S1, const TopoDS_Shape & S2);

};


%extend TopOpeBRepDS_DataStructure {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class TopOpeBRepDS_Dumper *
****************************/
class TopOpeBRepDS_Dumper {
	public:
		/****************** TopOpeBRepDS_Dumper ******************/
		/**** md5 signature: 3545ff8a5f08c6885b2d88a4f61861d0 ****/
		%feature("compactdefaultargs") TopOpeBRepDS_Dumper;
		%feature("autodoc", "
Parameters
----------
HDS: TopOpeBRepDS_HDataStructure

Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepDS_Dumper;
		 TopOpeBRepDS_Dumper(const opencascade::handle<TopOpeBRepDS_HDataStructure> & HDS);

		/****************** SDumpRefOri ******************/
		/**** md5 signature: 8e6b49d64bdb0a06e4b412da92478a80 ****/
		%feature("compactdefaultargs") SDumpRefOri;
		%feature("autodoc", "
Parameters
----------
K: TopOpeBRepDS_Kind
I: int

Return
-------
TCollection_AsciiString

Description
-----------
No available documentation.
") SDumpRefOri;
		TCollection_AsciiString SDumpRefOri(const TopOpeBRepDS_Kind K, const Standard_Integer I);

		/****************** SDumpRefOri ******************/
		/**** md5 signature: 2de056c6b87cd98b2ce3ade55eccba16 ****/
		%feature("compactdefaultargs") SDumpRefOri;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
TCollection_AsciiString

Description
-----------
No available documentation.
") SDumpRefOri;
		TCollection_AsciiString SDumpRefOri(const TopoDS_Shape & S);

		/****************** SPrintShape ******************/
		/**** md5 signature: b2cb96d441d854b1d0f54190036738cc ****/
		%feature("compactdefaultargs") SPrintShape;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
TCollection_AsciiString

Description
-----------
No available documentation.
") SPrintShape;
		TCollection_AsciiString SPrintShape(const Standard_Integer I);

		/****************** SPrintShape ******************/
		/**** md5 signature: 29aa3a0f30477ccf992e00d9f2c4ade9 ****/
		%feature("compactdefaultargs") SPrintShape;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
TCollection_AsciiString

Description
-----------
No available documentation.
") SPrintShape;
		TCollection_AsciiString SPrintShape(const TopoDS_Shape & S);

		/****************** SPrintShapeRefOri ******************/
		/**** md5 signature: b87193ebb49975a024fdbcf4acf5737e ****/
		%feature("compactdefaultargs") SPrintShapeRefOri;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
B: str (optional, default to "")

Return
-------
TCollection_AsciiString

Description
-----------
No available documentation.
") SPrintShapeRefOri;
		TCollection_AsciiString SPrintShapeRefOri(const TopoDS_Shape & S, TCollection_AsciiString B = "");

		/****************** SPrintShapeRefOri ******************/
		/**** md5 signature: 54da13540540d3a734590ba936839e14 ****/
		%feature("compactdefaultargs") SPrintShapeRefOri;
		%feature("autodoc", "
Parameters
----------
L: TopTools_ListOfShape
B: str (optional, default to "")

Return
-------
TCollection_AsciiString

Description
-----------
No available documentation.
") SPrintShapeRefOri;
		TCollection_AsciiString SPrintShapeRefOri(const TopTools_ListOfShape & L, TCollection_AsciiString B = "");

};


%extend TopOpeBRepDS_Dumper {
	%pythoncode {
	__repr__ = _dumps_object

	@methodnotwrapped
	def Print(self):
		pass
	}
};

/*************************
* class TopOpeBRepDS_EIR *
*************************/
class TopOpeBRepDS_EIR {
	public:
		/****************** TopOpeBRepDS_EIR ******************/
		/**** md5 signature: 080ad68854c97251af5c7951dae3285a ****/
		%feature("compactdefaultargs") TopOpeBRepDS_EIR;
		%feature("autodoc", "
Parameters
----------
HDS: TopOpeBRepDS_HDataStructure

Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepDS_EIR;
		 TopOpeBRepDS_EIR(const opencascade::handle<TopOpeBRepDS_HDataStructure> & HDS);

		/****************** ProcessEdgeInterferences ******************/
		/**** md5 signature: fdb0a9346715ac3d5b07add0cbfe07d8 ****/
		%feature("compactdefaultargs") ProcessEdgeInterferences;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") ProcessEdgeInterferences;
		void ProcessEdgeInterferences();

		/****************** ProcessEdgeInterferences ******************/
		/**** md5 signature: acd902e6f368f098486cef5b71d435ec ****/
		%feature("compactdefaultargs") ProcessEdgeInterferences;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
None

Description
-----------
No available documentation.
") ProcessEdgeInterferences;
		void ProcessEdgeInterferences(const Standard_Integer I);

};


%extend TopOpeBRepDS_EIR {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************************
* class TopOpeBRepDS_Edge3dInterferenceTool *
********************************************/
class TopOpeBRepDS_Edge3dInterferenceTool {
	public:
		/****************** TopOpeBRepDS_Edge3dInterferenceTool ******************/
		/**** md5 signature: 989690dea45d908958214a81d3f29bc5 ****/
		%feature("compactdefaultargs") TopOpeBRepDS_Edge3dInterferenceTool;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepDS_Edge3dInterferenceTool;
		 TopOpeBRepDS_Edge3dInterferenceTool();

		/****************** Add ******************/
		/**** md5 signature: f5412b5c46c5e401b7e23d3bbaf85690 ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
Eref: TopoDS_Shape
E: TopoDS_Shape
F: TopoDS_Shape
I: TopOpeBRepDS_Interference

Return
-------
None

Description
-----------
No available documentation.
") Add;
		void Add(const TopoDS_Shape & Eref, const TopoDS_Shape & E, const TopoDS_Shape & F, const opencascade::handle<TopOpeBRepDS_Interference> & I);

		/****************** Init ******************/
		/**** md5 signature: bd799a083bd15005a62ec114ed5690e5 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
Eref: TopoDS_Shape
E: TopoDS_Shape
F: TopoDS_Shape
I: TopOpeBRepDS_Interference

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const TopoDS_Shape & Eref, const TopoDS_Shape & E, const TopoDS_Shape & F, const opencascade::handle<TopOpeBRepDS_Interference> & I);

		/****************** InitPointVertex ******************/
		/**** md5 signature: cc467f069475b40c868db51fa15b6e4f ****/
		%feature("compactdefaultargs") InitPointVertex;
		%feature("autodoc", "
Parameters
----------
IsVertex: int
VonOO: TopoDS_Shape

Return
-------
None

Description
-----------
No available documentation.
") InitPointVertex;
		void InitPointVertex(const Standard_Integer IsVertex, const TopoDS_Shape & VonOO);

		/****************** Transition ******************/
		/**** md5 signature: cddcef230eeaaa0ab8b7f8b429bec838 ****/
		%feature("compactdefaultargs") Transition;
		%feature("autodoc", "
Parameters
----------
I: TopOpeBRepDS_Interference

Return
-------
None

Description
-----------
No available documentation.
") Transition;
		void Transition(const opencascade::handle<TopOpeBRepDS_Interference> & I);

};


%extend TopOpeBRepDS_Edge3dInterferenceTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************
* class TopOpeBRepDS_EdgeInterferenceTool *
******************************************/
class TopOpeBRepDS_EdgeInterferenceTool {
	public:
		/****************** TopOpeBRepDS_EdgeInterferenceTool ******************/
		/**** md5 signature: 161f54aa2c0b78b3be6e57b13979bf3b ****/
		%feature("compactdefaultargs") TopOpeBRepDS_EdgeInterferenceTool;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepDS_EdgeInterferenceTool;
		 TopOpeBRepDS_EdgeInterferenceTool();

		/****************** Add ******************/
		/**** md5 signature: 984a46bb46b06bb362c9533fee8aecbf ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Shape
V: TopoDS_Shape
I: TopOpeBRepDS_Interference

Return
-------
None

Description
-----------
No available documentation.
") Add;
		void Add(const TopoDS_Shape & E, const TopoDS_Shape & V, const opencascade::handle<TopOpeBRepDS_Interference> & I);

		/****************** Add ******************/
		/**** md5 signature: 57a3df2710a6e43e79ce80fcd3aeb88e ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Shape
P: TopOpeBRepDS_Point
I: TopOpeBRepDS_Interference

Return
-------
None

Description
-----------
No available documentation.
") Add;
		void Add(const TopoDS_Shape & E, const TopOpeBRepDS_Point & P, const opencascade::handle<TopOpeBRepDS_Interference> & I);

		/****************** Init ******************/
		/**** md5 signature: 1e2831de8f226d054fe6dfca5fa05068 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Shape
I: TopOpeBRepDS_Interference

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const TopoDS_Shape & E, const opencascade::handle<TopOpeBRepDS_Interference> & I);

		/****************** Transition ******************/
		/**** md5 signature: cddcef230eeaaa0ab8b7f8b429bec838 ****/
		%feature("compactdefaultargs") Transition;
		%feature("autodoc", "
Parameters
----------
I: TopOpeBRepDS_Interference

Return
-------
None

Description
-----------
No available documentation.
") Transition;
		void Transition(const opencascade::handle<TopOpeBRepDS_Interference> & I);

};


%extend TopOpeBRepDS_EdgeInterferenceTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class TopOpeBRepDS_Explorer *
******************************/
class TopOpeBRepDS_Explorer {
	public:
		/****************** TopOpeBRepDS_Explorer ******************/
		/**** md5 signature: 2293d0207469764caec658537b0e3756 ****/
		%feature("compactdefaultargs") TopOpeBRepDS_Explorer;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepDS_Explorer;
		 TopOpeBRepDS_Explorer();

		/****************** TopOpeBRepDS_Explorer ******************/
		/**** md5 signature: e366addb18ef341ba9e3f059d5ff2398 ****/
		%feature("compactdefaultargs") TopOpeBRepDS_Explorer;
		%feature("autodoc", "
Parameters
----------
HDS: TopOpeBRepDS_HDataStructure
T: TopAbs_ShapeEnum (optional, default to TopAbs_SHAPE)
findkeep: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepDS_Explorer;
		 TopOpeBRepDS_Explorer(const opencascade::handle<TopOpeBRepDS_HDataStructure> & HDS, const TopAbs_ShapeEnum T = TopAbs_SHAPE, const Standard_Boolean findkeep = Standard_True);

		/****************** Current ******************/
		/**** md5 signature: b191bf677bf7b52144f20d0821ea8f06 ****/
		%feature("compactdefaultargs") Current;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") Current;
		const TopoDS_Shape Current();

		/****************** Edge ******************/
		/**** md5 signature: be590cff987799d8b7c28083399d0e9f ****/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "Return
-------
TopoDS_Edge

Description
-----------
No available documentation.
") Edge;
		const TopoDS_Edge Edge();

		/****************** Face ******************/
		/**** md5 signature: 91e216ebeb76e55c73eb9e179241a6ff ****/
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "Return
-------
TopoDS_Face

Description
-----------
No available documentation.
") Face;
		const TopoDS_Face Face();

		/****************** Index ******************/
		/**** md5 signature: 407d80ef3037d55996765198adea3908 ****/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Index;
		Standard_Integer Index();

		/****************** Init ******************/
		/**** md5 signature: 6fde6f7a8628097003212c0a7065c5e6 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
HDS: TopOpeBRepDS_HDataStructure
T: TopAbs_ShapeEnum (optional, default to TopAbs_SHAPE)
findkeep: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TopOpeBRepDS_HDataStructure> & HDS, const TopAbs_ShapeEnum T = TopAbs_SHAPE, const Standard_Boolean findkeep = Standard_True);

		/****************** More ******************/
		/**** md5 signature: 6f6e915c9a3dca758c059d9e8af02dff ****/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") More;
		Standard_Boolean More();

		/****************** Next ******************/
		/**** md5 signature: f35c0df5f1d7c877986db18081404532 ****/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Next;
		void Next();

		/****************** Type ******************/
		/**** md5 signature: 3f27a65186b8053d282c2c0d8c4513b8 ****/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "Return
-------
TopAbs_ShapeEnum

Description
-----------
No available documentation.
") Type;
		TopAbs_ShapeEnum Type();

		/****************** Vertex ******************/
		/**** md5 signature: 84212ff79cd7d64cd0ebfa6f17214e90 ****/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "Return
-------
TopoDS_Vertex

Description
-----------
No available documentation.
") Vertex;
		const TopoDS_Vertex Vertex();

};


%extend TopOpeBRepDS_Explorer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class TopOpeBRepDS_FIR *
*************************/
class TopOpeBRepDS_FIR {
	public:
		/****************** TopOpeBRepDS_FIR ******************/
		/**** md5 signature: e43092489ebd9a0dac299aa04f677b13 ****/
		%feature("compactdefaultargs") TopOpeBRepDS_FIR;
		%feature("autodoc", "
Parameters
----------
HDS: TopOpeBRepDS_HDataStructure

Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepDS_FIR;
		 TopOpeBRepDS_FIR(const opencascade::handle<TopOpeBRepDS_HDataStructure> & HDS);

		/****************** ProcessFaceInterferences ******************/
		/**** md5 signature: 22ea874d673770f31f98a3c38885bd6a ****/
		%feature("compactdefaultargs") ProcessFaceInterferences;
		%feature("autodoc", "
Parameters
----------
M: TopOpeBRepDS_DataMapOfShapeListOfShapeOn1State

Return
-------
None

Description
-----------
No available documentation.
") ProcessFaceInterferences;
		void ProcessFaceInterferences(const TopOpeBRepDS_DataMapOfShapeListOfShapeOn1State & M);

		/****************** ProcessFaceInterferences ******************/
		/**** md5 signature: f498bfbdbef6b2b2c5c6887b29314d97 ****/
		%feature("compactdefaultargs") ProcessFaceInterferences;
		%feature("autodoc", "
Parameters
----------
I: int
M: TopOpeBRepDS_DataMapOfShapeListOfShapeOn1State

Return
-------
None

Description
-----------
No available documentation.
") ProcessFaceInterferences;
		void ProcessFaceInterferences(const Standard_Integer I, const TopOpeBRepDS_DataMapOfShapeListOfShapeOn1State & M);

};


%extend TopOpeBRepDS_FIR {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************
* class TopOpeBRepDS_FaceInterferenceTool *
******************************************/
class TopOpeBRepDS_FaceInterferenceTool {
	public:
		/****************** TopOpeBRepDS_FaceInterferenceTool ******************/
		/**** md5 signature: 2d3febd4d9968db559e4cd129f0a6bf9 ****/
		%feature("compactdefaultargs") TopOpeBRepDS_FaceInterferenceTool;
		%feature("autodoc", "
Parameters
----------
P: TopOpeBRepDS_PDataStructure

Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepDS_FaceInterferenceTool;
		 TopOpeBRepDS_FaceInterferenceTool(const TopOpeBRepDS_PDataStructure & P);

		/****************** Add ******************/
		/**** md5 signature: 850f900a261e084982a4ff2f1d4e03e9 ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
FI: TopoDS_Shape
F: TopoDS_Shape
E: TopoDS_Shape
Eisnew: bool
I: TopOpeBRepDS_Interference

Return
-------
None

Description
-----------
Eisnew = true if e is a new edge built on edge i->geometry() false if e is shape <=> i->geometry().
") Add;
		void Add(const TopoDS_Shape & FI, const TopoDS_Shape & F, const TopoDS_Shape & E, const Standard_Boolean Eisnew, const opencascade::handle<TopOpeBRepDS_Interference> & I);

		/****************** Add ******************/
		/**** md5 signature: 47cc6602993a12c2438dc9b1d0e36a75 ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Shape
C: TopOpeBRepDS_Curve
I: TopOpeBRepDS_Interference

Return
-------
None

Description
-----------
No available documentation.
") Add;
		void Add(const TopoDS_Shape & E, const TopOpeBRepDS_Curve & C, const opencascade::handle<TopOpeBRepDS_Interference> & I);

		/****************** GetEdgePntPar ******************/
		/**** md5 signature: f23d64f925254b1a87ef0e152423c9f7 ****/
		%feature("compactdefaultargs") GetEdgePntPar;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt

Return
-------
par: float

Description
-----------
No available documentation.
") GetEdgePntPar;
		void GetEdgePntPar(gp_Pnt & P, Standard_Real &OutValue);

		/****************** Init ******************/
		/**** md5 signature: 4fdbc4d55bb6b5d8955adabdcd7f8921 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
FI: TopoDS_Shape
E: TopoDS_Shape
Eisnew: bool
I: TopOpeBRepDS_Interference

Return
-------
None

Description
-----------
Eisnew = true if e is a new edge built on edge i->geometry() false if e is shape <=> i->geometry().
") Init;
		void Init(const TopoDS_Shape & FI, const TopoDS_Shape & E, const Standard_Boolean Eisnew, const opencascade::handle<TopOpeBRepDS_Interference> & I);

		/****************** IsEdgePntParDef ******************/
		/**** md5 signature: 1396dc1709803c83163f56bf7cbfcc5a ****/
		%feature("compactdefaultargs") IsEdgePntParDef;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsEdgePntParDef;
		Standard_Boolean IsEdgePntParDef();

		/****************** SetEdgePntPar ******************/
		/**** md5 signature: 7ab4d2ac72a72d51d433c55bbba758c0 ****/
		%feature("compactdefaultargs") SetEdgePntPar;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
par: float

Return
-------
None

Description
-----------
No available documentation.
") SetEdgePntPar;
		void SetEdgePntPar(const gp_Pnt & P, const Standard_Real par);

		/****************** Transition ******************/
		/**** md5 signature: cddcef230eeaaa0ab8b7f8b429bec838 ****/
		%feature("compactdefaultargs") Transition;
		%feature("autodoc", "
Parameters
----------
I: TopOpeBRepDS_Interference

Return
-------
None

Description
-----------
No available documentation.
") Transition;
		void Transition(const opencascade::handle<TopOpeBRepDS_Interference> & I);

};


%extend TopOpeBRepDS_FaceInterferenceTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class TopOpeBRepDS_Filter *
****************************/
class TopOpeBRepDS_Filter {
	public:
		/****************** TopOpeBRepDS_Filter ******************/
		/**** md5 signature: 75fb8c520ae1c01d147cebdf2ba9d2bb ****/
		%feature("compactdefaultargs") TopOpeBRepDS_Filter;
		%feature("autodoc", "
Parameters
----------
HDS: TopOpeBRepDS_HDataStructure
pClassif: TopOpeBRepTool_PShapeClassifier (optional, default to 0)

Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepDS_Filter;
		 TopOpeBRepDS_Filter(const opencascade::handle<TopOpeBRepDS_HDataStructure> & HDS, const TopOpeBRepTool_PShapeClassifier & pClassif = 0);

		/****************** ProcessCurveInterferences ******************/
		/**** md5 signature: 1465b61e58c569ca8b3a40b168fef6ef ****/
		%feature("compactdefaultargs") ProcessCurveInterferences;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") ProcessCurveInterferences;
		void ProcessCurveInterferences();

		/****************** ProcessCurveInterferences ******************/
		/**** md5 signature: 9e91fd561d91f3a2e8ba5d6fef022eaf ****/
		%feature("compactdefaultargs") ProcessCurveInterferences;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
None

Description
-----------
No available documentation.
") ProcessCurveInterferences;
		void ProcessCurveInterferences(const Standard_Integer I);

		/****************** ProcessEdgeInterferences ******************/
		/**** md5 signature: fdb0a9346715ac3d5b07add0cbfe07d8 ****/
		%feature("compactdefaultargs") ProcessEdgeInterferences;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") ProcessEdgeInterferences;
		void ProcessEdgeInterferences();

		/****************** ProcessEdgeInterferences ******************/
		/**** md5 signature: acd902e6f368f098486cef5b71d435ec ****/
		%feature("compactdefaultargs") ProcessEdgeInterferences;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
None

Description
-----------
No available documentation.
") ProcessEdgeInterferences;
		void ProcessEdgeInterferences(const Standard_Integer I);

		/****************** ProcessFaceInterferences ******************/
		/**** md5 signature: 8e2cf91d4fa889e880274c3f50d117c2 ****/
		%feature("compactdefaultargs") ProcessFaceInterferences;
		%feature("autodoc", "
Parameters
----------
MEsp: TopOpeBRepDS_DataMapOfShapeListOfShapeOn1State

Return
-------
None

Description
-----------
No available documentation.
") ProcessFaceInterferences;
		void ProcessFaceInterferences(const TopOpeBRepDS_DataMapOfShapeListOfShapeOn1State & MEsp);

		/****************** ProcessFaceInterferences ******************/
		/**** md5 signature: e5aa50a62588b5d67aa50f847ca70ba7 ****/
		%feature("compactdefaultargs") ProcessFaceInterferences;
		%feature("autodoc", "
Parameters
----------
I: int
MEsp: TopOpeBRepDS_DataMapOfShapeListOfShapeOn1State

Return
-------
None

Description
-----------
No available documentation.
") ProcessFaceInterferences;
		void ProcessFaceInterferences(const Standard_Integer I, const TopOpeBRepDS_DataMapOfShapeListOfShapeOn1State & MEsp);

		/****************** ProcessInterferences ******************/
		/**** md5 signature: 03ecfa694ab2b8c0bb984407262d748c ****/
		%feature("compactdefaultargs") ProcessInterferences;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") ProcessInterferences;
		void ProcessInterferences();

};


%extend TopOpeBRepDS_Filter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class TopOpeBRepDS_GapFiller *
*******************************/
class TopOpeBRepDS_GapFiller {
	public:
		/****************** TopOpeBRepDS_GapFiller ******************/
		/**** md5 signature: 722b2cba45fefb9f5d5867e80460ce34 ****/
		%feature("compactdefaultargs") TopOpeBRepDS_GapFiller;
		%feature("autodoc", "
Parameters
----------
HDS: TopOpeBRepDS_HDataStructure

Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepDS_GapFiller;
		 TopOpeBRepDS_GapFiller(const opencascade::handle<TopOpeBRepDS_HDataStructure> & HDS);

		/****************** AddPointsOnConnexShape ******************/
		/**** md5 signature: a1a33da8601ba47e27ee7deae1184771 ****/
		%feature("compactdefaultargs") AddPointsOnConnexShape;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Shape
LI: TopOpeBRepDS_ListOfInterference

Return
-------
None

Description
-----------
Methodes pour reduire la liste des points qui peuvent correspondre a une point donne.
") AddPointsOnConnexShape;
		void AddPointsOnConnexShape(const TopoDS_Shape & F, const TopOpeBRepDS_ListOfInterference & LI);

		/****************** AddPointsOnShape ******************/
		/**** md5 signature: c6339e54001bd6cc3323655b5757d5d3 ****/
		%feature("compactdefaultargs") AddPointsOnShape;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
LI: TopOpeBRepDS_ListOfInterference

Return
-------
None

Description
-----------
No available documentation.
") AddPointsOnShape;
		void AddPointsOnShape(const TopoDS_Shape & S, TopOpeBRepDS_ListOfInterference & LI);

		/****************** BuildNewGeometries ******************/
		/**** md5 signature: 2bcc3a668d4ba8f8140566f3c713941d ****/
		%feature("compactdefaultargs") BuildNewGeometries;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") BuildNewGeometries;
		void BuildNewGeometries();

		/****************** CheckConnexity ******************/
		/**** md5 signature: c663927441caf5a2bdb02a0d53cddde0 ****/
		%feature("compactdefaultargs") CheckConnexity;
		%feature("autodoc", "
Parameters
----------
LI: TopOpeBRepDS_ListOfInterference

Return
-------
bool

Description
-----------
Enchaine les sections via les points d'interferences deja associe; renvoit dans <l> les points extremites des lignes. methodes pour construire la liste des points qui peuvent correspondre a une point donne.
") CheckConnexity;
		Standard_Boolean CheckConnexity(TopOpeBRepDS_ListOfInterference & LI);

		/****************** FilterByEdge ******************/
		/**** md5 signature: 1c416ae069d10e8f5408d34ef6f14063 ****/
		%feature("compactdefaultargs") FilterByEdge;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
LI: TopOpeBRepDS_ListOfInterference

Return
-------
None

Description
-----------
No available documentation.
") FilterByEdge;
		void FilterByEdge(const TopoDS_Edge & E, TopOpeBRepDS_ListOfInterference & LI);

		/****************** FilterByFace ******************/
		/**** md5 signature: b071ee09f7ff2dec464933e3f78f23c0 ****/
		%feature("compactdefaultargs") FilterByFace;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face
LI: TopOpeBRepDS_ListOfInterference

Return
-------
None

Description
-----------
No available documentation.
") FilterByFace;
		void FilterByFace(const TopoDS_Face & F, TopOpeBRepDS_ListOfInterference & LI);

		/****************** FilterByIncidentDistance ******************/
		/**** md5 signature: a20273e832ac0e3a103a3cc20b44dbce ****/
		%feature("compactdefaultargs") FilterByIncidentDistance;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face
I: TopOpeBRepDS_Interference
LI: TopOpeBRepDS_ListOfInterference

Return
-------
None

Description
-----------
No available documentation.
") FilterByIncidentDistance;
		void FilterByIncidentDistance(const TopoDS_Face & F, const opencascade::handle<TopOpeBRepDS_Interference> & I, TopOpeBRepDS_ListOfInterference & LI);

		/****************** FindAssociatedPoints ******************/
		/**** md5 signature: 3a1e8b7f77ae03ac217b2d9432f3b884 ****/
		%feature("compactdefaultargs") FindAssociatedPoints;
		%feature("autodoc", "
Parameters
----------
I: TopOpeBRepDS_Interference
LI: TopOpeBRepDS_ListOfInterference

Return
-------
None

Description
-----------
Recherche parmi l'ensemble des points d'interference la liste <li> des points qui correspondent au point d'indice <index>.
") FindAssociatedPoints;
		void FindAssociatedPoints(const opencascade::handle<TopOpeBRepDS_Interference> & I, TopOpeBRepDS_ListOfInterference & LI);

		/****************** IsOnEdge ******************/
		/**** md5 signature: 601084fd5330ff669b8e8a168e3849b9 ****/
		%feature("compactdefaultargs") IsOnEdge;
		%feature("autodoc", "
Parameters
----------
I: TopOpeBRepDS_Interference
E: TopoDS_Edge

Return
-------
bool

Description
-----------
Return true si i ou une de ses representaions a pour support <e>. methodes de reconstructions des geometries des point et des courbes de section.
") IsOnEdge;
		Standard_Boolean IsOnEdge(const opencascade::handle<TopOpeBRepDS_Interference> & I, const TopoDS_Edge & E);

		/****************** IsOnFace ******************/
		/**** md5 signature: 70f5ecde5396a914e5538d3bfb583667 ****/
		%feature("compactdefaultargs") IsOnFace;
		%feature("autodoc", "
Parameters
----------
I: TopOpeBRepDS_Interference
F: TopoDS_Face

Return
-------
bool

Description
-----------
Return true si i a ete obtenu par une intersection avec <f>.
") IsOnFace;
		Standard_Boolean IsOnFace(const opencascade::handle<TopOpeBRepDS_Interference> & I, const TopoDS_Face & F);

		/****************** Perform ******************/
		/**** md5 signature: c04b01412cba7220c024b5eb4532697f ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform();

		/****************** ReBuildGeom ******************/
		/**** md5 signature: 739221b80bfd83fbdc3d57147fd38d81 ****/
		%feature("compactdefaultargs") ReBuildGeom;
		%feature("autodoc", "
Parameters
----------
I1: TopOpeBRepDS_Interference
Done: TColStd_MapOfInteger

Return
-------
None

Description
-----------
No available documentation.
") ReBuildGeom;
		void ReBuildGeom(const opencascade::handle<TopOpeBRepDS_Interference> & I1, TColStd_MapOfInteger & Done);

};


%extend TopOpeBRepDS_GapFiller {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class TopOpeBRepDS_GapTool *
*****************************/
class TopOpeBRepDS_GapTool : public Standard_Transient {
	public:
		/****************** TopOpeBRepDS_GapTool ******************/
		/**** md5 signature: 0f7c1efdc5925f5b689eb91c0c74aa96 ****/
		%feature("compactdefaultargs") TopOpeBRepDS_GapTool;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepDS_GapTool;
		 TopOpeBRepDS_GapTool();

		/****************** TopOpeBRepDS_GapTool ******************/
		/**** md5 signature: bbdcd383be0fc32ea4fde576950b3a17 ****/
		%feature("compactdefaultargs") TopOpeBRepDS_GapTool;
		%feature("autodoc", "
Parameters
----------
HDS: TopOpeBRepDS_HDataStructure

Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepDS_GapTool;
		 TopOpeBRepDS_GapTool(const opencascade::handle<TopOpeBRepDS_HDataStructure> & HDS);

		/****************** ChangeSameInterferences ******************/
		/**** md5 signature: 10ff921a613b395592d9493ffc88126a ****/
		%feature("compactdefaultargs") ChangeSameInterferences;
		%feature("autodoc", "
Parameters
----------
I: TopOpeBRepDS_Interference

Return
-------
TopOpeBRepDS_ListOfInterference

Description
-----------
No available documentation.
") ChangeSameInterferences;
		TopOpeBRepDS_ListOfInterference & ChangeSameInterferences(const opencascade::handle<TopOpeBRepDS_Interference> & I);

		/****************** Curve ******************/
		/**** md5 signature: a13078d92284b0bd68397d6d4e9713bd ****/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "
Parameters
----------
I: TopOpeBRepDS_Interference
C: TopOpeBRepDS_Curve

Return
-------
bool

Description
-----------
No available documentation.
") Curve;
		Standard_Boolean Curve(const opencascade::handle<TopOpeBRepDS_Interference> & I, TopOpeBRepDS_Curve & C);

		/****************** EdgeSupport ******************/
		/**** md5 signature: f6132fe52c3cba50cbfc1e403330620b ****/
		%feature("compactdefaultargs") EdgeSupport;
		%feature("autodoc", "
Parameters
----------
I: TopOpeBRepDS_Interference
E: TopoDS_Shape

Return
-------
bool

Description
-----------
No available documentation.
") EdgeSupport;
		Standard_Boolean EdgeSupport(const opencascade::handle<TopOpeBRepDS_Interference> & I, TopoDS_Shape & E);

		/****************** FacesSupport ******************/
		/**** md5 signature: c5eb5d668cb3be5c28e849f094ed2ac8 ****/
		%feature("compactdefaultargs") FacesSupport;
		%feature("autodoc", "
Parameters
----------
I: TopOpeBRepDS_Interference
F1: TopoDS_Shape
F2: TopoDS_Shape

Return
-------
bool

Description
-----------
Return les faces qui ont genere la section origine de i.
") FacesSupport;
		Standard_Boolean FacesSupport(const opencascade::handle<TopOpeBRepDS_Interference> & I, TopoDS_Shape & F1, TopoDS_Shape & F2);

		/****************** Init ******************/
		/**** md5 signature: 024bcfdbf9359dde26d22897154bd930 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
HDS: TopOpeBRepDS_HDataStructure

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TopOpeBRepDS_HDataStructure> & HDS);

		/****************** Interferences ******************/
		/**** md5 signature: ac3f8088a166d46a6c4fb1c5cd2a2333 ****/
		%feature("compactdefaultargs") Interferences;
		%feature("autodoc", "
Parameters
----------
IndexPoint: int

Return
-------
TopOpeBRepDS_ListOfInterference

Description
-----------
No available documentation.
") Interferences;
		const TopOpeBRepDS_ListOfInterference & Interferences(const Standard_Integer IndexPoint);

		/****************** ParameterOnEdge ******************/
		/**** md5 signature: fd91bba7a092a453fa1dfa4824d15a70 ****/
		%feature("compactdefaultargs") ParameterOnEdge;
		%feature("autodoc", "
Parameters
----------
I: TopOpeBRepDS_Interference
E: TopoDS_Shape

Return
-------
U: float

Description
-----------
No available documentation.
") ParameterOnEdge;
		Standard_Boolean ParameterOnEdge(const opencascade::handle<TopOpeBRepDS_Interference> & I, const TopoDS_Shape & E, Standard_Real &OutValue);

		/****************** SameInterferences ******************/
		/**** md5 signature: 16567c61420f685f242ddf5294ab3beb ****/
		%feature("compactdefaultargs") SameInterferences;
		%feature("autodoc", "
Parameters
----------
I: TopOpeBRepDS_Interference

Return
-------
TopOpeBRepDS_ListOfInterference

Description
-----------
No available documentation.
") SameInterferences;
		const TopOpeBRepDS_ListOfInterference & SameInterferences(const opencascade::handle<TopOpeBRepDS_Interference> & I);

		/****************** SetParameterOnEdge ******************/
		/**** md5 signature: 03ce205e073cc6cb39764a6c7302c52d ****/
		%feature("compactdefaultargs") SetParameterOnEdge;
		%feature("autodoc", "
Parameters
----------
I: TopOpeBRepDS_Interference
E: TopoDS_Shape
U: float

Return
-------
None

Description
-----------
No available documentation.
") SetParameterOnEdge;
		void SetParameterOnEdge(const opencascade::handle<TopOpeBRepDS_Interference> & I, const TopoDS_Shape & E, const Standard_Real U);

		/****************** SetPoint ******************/
		/**** md5 signature: 22cd93a3133fc7e6f2a7b9e6de48b67d ****/
		%feature("compactdefaultargs") SetPoint;
		%feature("autodoc", "
Parameters
----------
I: TopOpeBRepDS_Interference
IndexPoint: int

Return
-------
None

Description
-----------
No available documentation.
") SetPoint;
		void SetPoint(const opencascade::handle<TopOpeBRepDS_Interference> & I, const Standard_Integer IndexPoint);

};


%make_alias(TopOpeBRepDS_GapTool)

%extend TopOpeBRepDS_GapTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class TopOpeBRepDS_GeometryData *
**********************************/
class TopOpeBRepDS_GeometryData {
	public:
		/****************** TopOpeBRepDS_GeometryData ******************/
		/**** md5 signature: 2c996296693d7f1858d92dfd1d41c646 ****/
		%feature("compactdefaultargs") TopOpeBRepDS_GeometryData;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepDS_GeometryData;
		 TopOpeBRepDS_GeometryData();

		/****************** TopOpeBRepDS_GeometryData ******************/
		/**** md5 signature: b9cc3a4e21ada85ace1f83e1a78be2ca ****/
		%feature("compactdefaultargs") TopOpeBRepDS_GeometryData;
		%feature("autodoc", "
Parameters
----------
Other: TopOpeBRepDS_GeometryData

Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepDS_GeometryData;
		 TopOpeBRepDS_GeometryData(const TopOpeBRepDS_GeometryData & Other);

		/****************** AddInterference ******************/
		/**** md5 signature: 5f60096821134e0e43b7c194b77bc0aa ****/
		%feature("compactdefaultargs") AddInterference;
		%feature("autodoc", "
Parameters
----------
I: TopOpeBRepDS_Interference

Return
-------
None

Description
-----------
No available documentation.
") AddInterference;
		void AddInterference(const opencascade::handle<TopOpeBRepDS_Interference> & I);

		/****************** Assign ******************/
		/**** md5 signature: bd100538f072155057df1d5f3c464a3a ****/
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "
Parameters
----------
Other: TopOpeBRepDS_GeometryData

Return
-------
None

Description
-----------
No available documentation.
") Assign;
		void Assign(const TopOpeBRepDS_GeometryData & Other);

		/****************** ChangeInterferences ******************/
		/**** md5 signature: 1c8cdb23abd41bd3fe65cba4df26ed63 ****/
		%feature("compactdefaultargs") ChangeInterferences;
		%feature("autodoc", "Return
-------
TopOpeBRepDS_ListOfInterference

Description
-----------
No available documentation.
") ChangeInterferences;
		TopOpeBRepDS_ListOfInterference & ChangeInterferences();

		/****************** Interferences ******************/
		/**** md5 signature: 237ed42d67b2b8b56ca50b69c4e86889 ****/
		%feature("compactdefaultargs") Interferences;
		%feature("autodoc", "Return
-------
TopOpeBRepDS_ListOfInterference

Description
-----------
No available documentation.
") Interferences;
		const TopOpeBRepDS_ListOfInterference & Interferences();

};


%extend TopOpeBRepDS_GeometryData {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class TopOpeBRepDS_HDataStructure *
************************************/
/**********************************
* class TopOpeBRepDS_Interference *
**********************************/
class TopOpeBRepDS_Interference : public Standard_Transient {
	public:
		/****************** TopOpeBRepDS_Interference ******************/
		/**** md5 signature: eb974943fa755fceaa6da2308ba06466 ****/
		%feature("compactdefaultargs") TopOpeBRepDS_Interference;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepDS_Interference;
		 TopOpeBRepDS_Interference();

		/****************** TopOpeBRepDS_Interference ******************/
		/**** md5 signature: 57f654165021ed20333eaeb9cc568bda ****/
		%feature("compactdefaultargs") TopOpeBRepDS_Interference;
		%feature("autodoc", "
Parameters
----------
Transition: TopOpeBRepDS_Transition
SupportType: TopOpeBRepDS_Kind
Support: int
GeometryType: TopOpeBRepDS_Kind
Geometry: int

Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepDS_Interference;
		 TopOpeBRepDS_Interference(const TopOpeBRepDS_Transition & Transition, const TopOpeBRepDS_Kind SupportType, const Standard_Integer Support, const TopOpeBRepDS_Kind GeometryType, const Standard_Integer Geometry);

		/****************** TopOpeBRepDS_Interference ******************/
		/**** md5 signature: 24dc11f4674be209a27cf60b2243e080 ****/
		%feature("compactdefaultargs") TopOpeBRepDS_Interference;
		%feature("autodoc", "
Parameters
----------
I: TopOpeBRepDS_Interference

Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepDS_Interference;
		 TopOpeBRepDS_Interference(const opencascade::handle<TopOpeBRepDS_Interference> & I);

		/****************** ChangeTransition ******************/
		/**** md5 signature: 1011287ae55d0acc146aae0c7dd5b16e ****/
		%feature("compactdefaultargs") ChangeTransition;
		%feature("autodoc", "Return
-------
TopOpeBRepDS_Transition

Description
-----------
No available documentation.
") ChangeTransition;
		TopOpeBRepDS_Transition & ChangeTransition();

		/****************** GKGSKS ******************/
		/**** md5 signature: 29fece9f7cd768c83761bb164d307d2f ****/
		%feature("compactdefaultargs") GKGSKS;
		%feature("autodoc", "
Parameters
----------

Return
-------
GK: TopOpeBRepDS_Kind
G: int
SK: TopOpeBRepDS_Kind
S: int

Description
-----------
Return geometrytype + geometry + supporttype + support.
") GKGSKS;
		void GKGSKS(TopOpeBRepDS_Kind &OutValue, Standard_Integer &OutValue, TopOpeBRepDS_Kind &OutValue, Standard_Integer &OutValue);

		/****************** Geometry ******************/
		/**** md5 signature: 37e738c2b410a542f3698c2f6ed890de ****/
		%feature("compactdefaultargs") Geometry;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Geometry;
		Standard_Integer Geometry();

		/****************** Geometry ******************/
		/**** md5 signature: 0f344c7bfc84ae146a04f63060ef6b22 ****/
		%feature("compactdefaultargs") Geometry;
		%feature("autodoc", "
Parameters
----------
G: int

Return
-------
None

Description
-----------
No available documentation.
") Geometry;
		void Geometry(const Standard_Integer G);

		/****************** GeometryType ******************/
		/**** md5 signature: 844ce07794e9ce4fc9b3f97ebf69382f ****/
		%feature("compactdefaultargs") GeometryType;
		%feature("autodoc", "Return
-------
TopOpeBRepDS_Kind

Description
-----------
No available documentation.
") GeometryType;
		TopOpeBRepDS_Kind GeometryType();

		/****************** GeometryType ******************/
		/**** md5 signature: 698c8f46bf348e356e4f525e01faab03 ****/
		%feature("compactdefaultargs") GeometryType;
		%feature("autodoc", "
Parameters
----------
GT: TopOpeBRepDS_Kind

Return
-------
None

Description
-----------
No available documentation.
") GeometryType;
		void GeometryType(const TopOpeBRepDS_Kind GT);

		/****************** HasSameGeometry ******************/
		/**** md5 signature: 9722ce3aeab1e2366ee5810c098d5ed3 ****/
		%feature("compactdefaultargs") HasSameGeometry;
		%feature("autodoc", "
Parameters
----------
Other: TopOpeBRepDS_Interference

Return
-------
bool

Description
-----------
No available documentation.
") HasSameGeometry;
		Standard_Boolean HasSameGeometry(const opencascade::handle<TopOpeBRepDS_Interference> & Other);

		/****************** HasSameSupport ******************/
		/**** md5 signature: 87f6d4f0ee76b48cd98408e83cf2da3e ****/
		%feature("compactdefaultargs") HasSameSupport;
		%feature("autodoc", "
Parameters
----------
Other: TopOpeBRepDS_Interference

Return
-------
bool

Description
-----------
No available documentation.
") HasSameSupport;
		Standard_Boolean HasSameSupport(const opencascade::handle<TopOpeBRepDS_Interference> & Other);

		/****************** SetGeometry ******************/
		/**** md5 signature: 15428bccd2287a10ef837e9e8f5eb21d ****/
		%feature("compactdefaultargs") SetGeometry;
		%feature("autodoc", "
Parameters
----------
GI: int

Return
-------
None

Description
-----------
No available documentation.
") SetGeometry;
		void SetGeometry(const Standard_Integer GI);

		/****************** Support ******************/
		/**** md5 signature: 7aa624728551f1bd526b097364323e6c ****/
		%feature("compactdefaultargs") Support;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Support;
		Standard_Integer Support();

		/****************** Support ******************/
		/**** md5 signature: 40fffd6992a1a134cd3c63bb788aba9a ****/
		%feature("compactdefaultargs") Support;
		%feature("autodoc", "
Parameters
----------
S: int

Return
-------
None

Description
-----------
No available documentation.
") Support;
		void Support(const Standard_Integer S);

		/****************** SupportType ******************/
		/**** md5 signature: 7133e5c87610c7bbd71b6f22b6e541eb ****/
		%feature("compactdefaultargs") SupportType;
		%feature("autodoc", "Return
-------
TopOpeBRepDS_Kind

Description
-----------
No available documentation.
") SupportType;
		TopOpeBRepDS_Kind SupportType();

		/****************** SupportType ******************/
		/**** md5 signature: 42aa9ca2bc4bdce738b125b385ecb19d ****/
		%feature("compactdefaultargs") SupportType;
		%feature("autodoc", "
Parameters
----------
ST: TopOpeBRepDS_Kind

Return
-------
None

Description
-----------
No available documentation.
") SupportType;
		void SupportType(const TopOpeBRepDS_Kind ST);

		/****************** Transition ******************/
		/**** md5 signature: b5272cce68efc51cec1c0feca2f97771 ****/
		%feature("compactdefaultargs") Transition;
		%feature("autodoc", "Return
-------
TopOpeBRepDS_Transition

Description
-----------
No available documentation.
") Transition;
		const TopOpeBRepDS_Transition & Transition();

		/****************** Transition ******************/
		/**** md5 signature: 9d87175c97a5fdd5dd0051ebaa8ceb42 ****/
		%feature("compactdefaultargs") Transition;
		%feature("autodoc", "
Parameters
----------
T: TopOpeBRepDS_Transition

Return
-------
None

Description
-----------
No available documentation.
") Transition;
		void Transition(const TopOpeBRepDS_Transition & T);

};


%make_alias(TopOpeBRepDS_Interference)

%extend TopOpeBRepDS_Interference {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************
* class TopOpeBRepDS_InterferenceIterator *
******************************************/
class TopOpeBRepDS_InterferenceIterator {
	public:
		/****************** TopOpeBRepDS_InterferenceIterator ******************/
		/**** md5 signature: 4872340032b48839fd5050af3f4a5143 ****/
		%feature("compactdefaultargs") TopOpeBRepDS_InterferenceIterator;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepDS_InterferenceIterator;
		 TopOpeBRepDS_InterferenceIterator();

		/****************** TopOpeBRepDS_InterferenceIterator ******************/
		/**** md5 signature: 8ed0f027e76b4565a73cb84db6c20802 ****/
		%feature("compactdefaultargs") TopOpeBRepDS_InterferenceIterator;
		%feature("autodoc", "
Parameters
----------
L: TopOpeBRepDS_ListOfInterference

Return
-------
None

Description
-----------
Creates an iterator on the interference of list <l>.
") TopOpeBRepDS_InterferenceIterator;
		 TopOpeBRepDS_InterferenceIterator(const TopOpeBRepDS_ListOfInterference & L);

		/****************** ChangeIterator ******************/
		/**** md5 signature: 5a8a77a0345b10343cd11bd4937db862 ****/
		%feature("compactdefaultargs") ChangeIterator;
		%feature("autodoc", "Return
-------
TopOpeBRepDS_ListIteratorOfListOfInterference

Description
-----------
No available documentation.
") ChangeIterator;
		TopOpeBRepDS_ListIteratorOfListOfInterference & ChangeIterator();

		/****************** Geometry ******************/
		/**** md5 signature: 0f344c7bfc84ae146a04f63060ef6b22 ****/
		%feature("compactdefaultargs") Geometry;
		%feature("autodoc", "
Parameters
----------
G: int

Return
-------
None

Description
-----------
Define a condition on interference iteration process. interference must match the geometry <g>.
") Geometry;
		void Geometry(const Standard_Integer G);

		/****************** GeometryKind ******************/
		/**** md5 signature: 7c24d25f53c83a2fe339cd9736091f36 ****/
		%feature("compactdefaultargs") GeometryKind;
		%feature("autodoc", "
Parameters
----------
GK: TopOpeBRepDS_Kind

Return
-------
None

Description
-----------
Define a condition on interference iteration process. interference must match the geometry kind <st>.
") GeometryKind;
		void GeometryKind(const TopOpeBRepDS_Kind GK);

		/****************** Init ******************/
		/**** md5 signature: 7f5819da47cd75207e05c93d57cc56c6 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
L: TopOpeBRepDS_ListOfInterference

Return
-------
None

Description
-----------
Re-initialize interference iteration process on the list of interference <l>. conditions are not modified.
") Init;
		void Init(const TopOpeBRepDS_ListOfInterference & L);

		/****************** Match ******************/
		/**** md5 signature: 3b22ed9ef0be8edf337a58574cb50ef5 ****/
		%feature("compactdefaultargs") Match;
		%feature("autodoc", "Return
-------
None

Description
-----------
Reach for an interference matching the conditions (if defined).
") Match;
		void Match();

		/****************** MatchInterference ******************/
		/**** md5 signature: f113425c763c976ba037fd6b98a7d608 ****/
		%feature("compactdefaultargs") MatchInterference;
		%feature("autodoc", "
Parameters
----------
I: TopOpeBRepDS_Interference

Return
-------
bool

Description
-----------
Returns true if the interference <i> matches the conditions (if defined). if no conditions defined, returns true.
") MatchInterference;
		virtual Standard_Boolean MatchInterference(const opencascade::handle<TopOpeBRepDS_Interference> & I);

		/****************** More ******************/
		/**** md5 signature: 6f6e915c9a3dca758c059d9e8af02dff ****/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if there is a current interference in the iteration.
") More;
		Standard_Boolean More();

		/****************** Next ******************/
		/**** md5 signature: f35c0df5f1d7c877986db18081404532 ****/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Return
-------
None

Description
-----------
Move to the next interference.
") Next;
		void Next();

		/****************** Support ******************/
		/**** md5 signature: 40fffd6992a1a134cd3c63bb788aba9a ****/
		%feature("compactdefaultargs") Support;
		%feature("autodoc", "
Parameters
----------
S: int

Return
-------
None

Description
-----------
Define a condition on interference iteration process. interference must match the support <s>.
") Support;
		void Support(const Standard_Integer S);

		/****************** SupportKind ******************/
		/**** md5 signature: ecfb3fa2c4963c8fa0cac03ac9ad9f77 ****/
		%feature("compactdefaultargs") SupportKind;
		%feature("autodoc", "
Parameters
----------
ST: TopOpeBRepDS_Kind

Return
-------
None

Description
-----------
Define a condition on interference iteration process. interference must match the support kind <st>.
") SupportKind;
		void SupportKind(const TopOpeBRepDS_Kind ST);

		/****************** Value ******************/
		/**** md5 signature: f3debc8b4caf6d71048cb33034f07851 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
opencascade::handle<TopOpeBRepDS_Interference>

Description
-----------
Returns the current interference, matching the conditions (if defined).
") Value;
		const opencascade::handle<TopOpeBRepDS_Interference> & Value();

};


%extend TopOpeBRepDS_InterferenceIterator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class TopOpeBRepDS_InterferenceTool *
**************************************/
class TopOpeBRepDS_InterferenceTool {
	public:
		/****************** DuplicateCurvePointInterference ******************/
		/**** md5 signature: bec019de9146c13249de5a5236bf951b ****/
		%feature("compactdefaultargs") DuplicateCurvePointInterference;
		%feature("autodoc", "
Parameters
----------
I: TopOpeBRepDS_Interference

Return
-------
opencascade::handle<TopOpeBRepDS_Interference>

Description
-----------
Duplicate i in a new interference with complement() transition.
") DuplicateCurvePointInterference;
		static opencascade::handle<TopOpeBRepDS_Interference> DuplicateCurvePointInterference(const opencascade::handle<TopOpeBRepDS_Interference> & I);

		/****************** MakeCurveInterference ******************/
		/**** md5 signature: 71edbf5e87c4306ef5dfa4f0a637ce26 ****/
		%feature("compactdefaultargs") MakeCurveInterference;
		%feature("autodoc", "
Parameters
----------
T: TopOpeBRepDS_Transition
SK: TopOpeBRepDS_Kind
SI: int
GK: TopOpeBRepDS_Kind
GI: int
P: float

Return
-------
opencascade::handle<TopOpeBRepDS_Interference>

Description
-----------
No available documentation.
") MakeCurveInterference;
		static opencascade::handle<TopOpeBRepDS_Interference> MakeCurveInterference(const TopOpeBRepDS_Transition & T, const TopOpeBRepDS_Kind SK, const Standard_Integer SI, const TopOpeBRepDS_Kind GK, const Standard_Integer GI, const Standard_Real P);

		/****************** MakeEdgeInterference ******************/
		/**** md5 signature: 80c82fe33e5082861fed7023d51e20eb ****/
		%feature("compactdefaultargs") MakeEdgeInterference;
		%feature("autodoc", "
Parameters
----------
T: TopOpeBRepDS_Transition
SK: TopOpeBRepDS_Kind
SI: int
GK: TopOpeBRepDS_Kind
GI: int
P: float

Return
-------
opencascade::handle<TopOpeBRepDS_Interference>

Description
-----------
No available documentation.
") MakeEdgeInterference;
		static opencascade::handle<TopOpeBRepDS_Interference> MakeEdgeInterference(const TopOpeBRepDS_Transition & T, const TopOpeBRepDS_Kind SK, const Standard_Integer SI, const TopOpeBRepDS_Kind GK, const Standard_Integer GI, const Standard_Real P);

		/****************** MakeEdgeVertexInterference ******************/
		/**** md5 signature: c6ba7aaf7a9e5b341392fd222ecf8cb5 ****/
		%feature("compactdefaultargs") MakeEdgeVertexInterference;
		%feature("autodoc", "
Parameters
----------
Transition: TopOpeBRepDS_Transition
EdgeI: int
VertexI: int
VertexIsBound: bool
Config: TopOpeBRepDS_Config
param: float

Return
-------
opencascade::handle<TopOpeBRepDS_Interference>

Description
-----------
No available documentation.
") MakeEdgeVertexInterference;
		static opencascade::handle<TopOpeBRepDS_Interference> MakeEdgeVertexInterference(const TopOpeBRepDS_Transition & Transition, const Standard_Integer EdgeI, const Standard_Integer VertexI, const Standard_Boolean VertexIsBound, const TopOpeBRepDS_Config Config, const Standard_Real param);

		/****************** MakeFaceCurveInterference ******************/
		/**** md5 signature: 73510f6558324661f2cebcfd5b8da326 ****/
		%feature("compactdefaultargs") MakeFaceCurveInterference;
		%feature("autodoc", "
Parameters
----------
Transition: TopOpeBRepDS_Transition
FaceI: int
CurveI: int
PC: Geom2d_Curve

Return
-------
opencascade::handle<TopOpeBRepDS_Interference>

Description
-----------
No available documentation.
") MakeFaceCurveInterference;
		static opencascade::handle<TopOpeBRepDS_Interference> MakeFaceCurveInterference(const TopOpeBRepDS_Transition & Transition, const Standard_Integer FaceI, const Standard_Integer CurveI, const opencascade::handle<Geom2d_Curve> & PC);

		/****************** MakeFaceEdgeInterference ******************/
		/**** md5 signature: d3c084d7a313c6f7c27270c4ed2607f2 ****/
		%feature("compactdefaultargs") MakeFaceEdgeInterference;
		%feature("autodoc", "
Parameters
----------
Transition: TopOpeBRepDS_Transition
FaceI: int
EdgeI: int
EdgeIsBound: bool
Config: TopOpeBRepDS_Config

Return
-------
opencascade::handle<TopOpeBRepDS_Interference>

Description
-----------
No available documentation.
") MakeFaceEdgeInterference;
		static opencascade::handle<TopOpeBRepDS_Interference> MakeFaceEdgeInterference(const TopOpeBRepDS_Transition & Transition, const Standard_Integer FaceI, const Standard_Integer EdgeI, const Standard_Boolean EdgeIsBound, const TopOpeBRepDS_Config Config);

		/****************** MakeSolidSurfaceInterference ******************/
		/**** md5 signature: 8760ffc9204d7f5d327f3734b96d1eb7 ****/
		%feature("compactdefaultargs") MakeSolidSurfaceInterference;
		%feature("autodoc", "
Parameters
----------
Transition: TopOpeBRepDS_Transition
SolidI: int
SurfaceI: int

Return
-------
opencascade::handle<TopOpeBRepDS_Interference>

Description
-----------
No available documentation.
") MakeSolidSurfaceInterference;
		static opencascade::handle<TopOpeBRepDS_Interference> MakeSolidSurfaceInterference(const TopOpeBRepDS_Transition & Transition, const Standard_Integer SolidI, const Standard_Integer SurfaceI);

		/****************** Parameter ******************/
		/**** md5 signature: 7167c86f23457411d69314ecbc317185 ****/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "
Parameters
----------
CPI: TopOpeBRepDS_Interference

Return
-------
float

Description
-----------
No available documentation.
") Parameter;
		static Standard_Real Parameter(const opencascade::handle<TopOpeBRepDS_Interference> & CPI);

		/****************** Parameter ******************/
		/**** md5 signature: a8e6ad703ffe00dceff696129323dd38 ****/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "
Parameters
----------
CPI: TopOpeBRepDS_Interference
Par: float

Return
-------
None

Description
-----------
No available documentation.
") Parameter;
		static void Parameter(const opencascade::handle<TopOpeBRepDS_Interference> & CPI, const Standard_Real Par);

};


%extend TopOpeBRepDS_InterferenceTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************************
* class TopOpeBRepDS_ListOfShapeOn1State *
*****************************************/
class TopOpeBRepDS_ListOfShapeOn1State {
	public:
		/****************** TopOpeBRepDS_ListOfShapeOn1State ******************/
		/**** md5 signature: 3c910e3da46e5737762c0e1e3252741c ****/
		%feature("compactdefaultargs") TopOpeBRepDS_ListOfShapeOn1State;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepDS_ListOfShapeOn1State;
		 TopOpeBRepDS_ListOfShapeOn1State();

		/****************** ChangeListOnState ******************/
		/**** md5 signature: 9f8af2605e3234694bc140cf2db45f55 ****/
		%feature("compactdefaultargs") ChangeListOnState;
		%feature("autodoc", "Return
-------
TopTools_ListOfShape

Description
-----------
No available documentation.
") ChangeListOnState;
		TopTools_ListOfShape & ChangeListOnState();

		/****************** Clear ******************/
		/**** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ****/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Clear;
		void Clear();

		/****************** IsSplit ******************/
		/**** md5 signature: cd297e5305c37fd756c77025e3454dc1 ****/
		%feature("compactdefaultargs") IsSplit;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsSplit;
		Standard_Boolean IsSplit();

		/****************** ListOnState ******************/
		/**** md5 signature: d8eeb9ed0a4e645267970191ba00edb2 ****/
		%feature("compactdefaultargs") ListOnState;
		%feature("autodoc", "Return
-------
TopTools_ListOfShape

Description
-----------
No available documentation.
") ListOnState;
		const TopTools_ListOfShape & ListOnState();

		/****************** Split ******************/
		/**** md5 signature: e15f6a006a319f619e60613f8e8a67e2 ****/
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "
Parameters
----------
B: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
No available documentation.
") Split;
		void Split(const Standard_Boolean B = Standard_True);

};


%extend TopOpeBRepDS_ListOfShapeOn1State {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class TopOpeBRepDS_Marker *
****************************/
class TopOpeBRepDS_Marker : public Standard_Transient {
	public:
		/****************** TopOpeBRepDS_Marker ******************/
		/**** md5 signature: 82599982c5bfd4d6e56e71ba94394b62 ****/
		%feature("compactdefaultargs") TopOpeBRepDS_Marker;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepDS_Marker;
		 TopOpeBRepDS_Marker();

		/****************** Allocate ******************/
		/**** md5 signature: 8dd88c711bbc17d9cac35e2bf2761af3 ****/
		%feature("compactdefaultargs") Allocate;
		%feature("autodoc", "
Parameters
----------
n: int

Return
-------
None

Description
-----------
No available documentation.
") Allocate;
		void Allocate(const Standard_Integer n);

		/****************** GetI ******************/
		/**** md5 signature: c504e43ed37d8f9405ff96c0f67ca224 ****/
		%feature("compactdefaultargs") GetI;
		%feature("autodoc", "
Parameters
----------
i: int

Return
-------
bool

Description
-----------
No available documentation.
") GetI;
		Standard_Boolean GetI(const Standard_Integer i);

		/****************** Reset ******************/
		/**** md5 signature: 7beb446fe26b948f797f8de87e46c23d ****/
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Reset;
		void Reset();

		/****************** Set ******************/
		/**** md5 signature: c99879bf672036eccb4611c79446d14d ****/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
i: int
b: bool

Return
-------
None

Description
-----------
No available documentation.
") Set;
		void Set(const Standard_Integer i, const Standard_Boolean b);

		/****************** Set ******************/
		/**** md5 signature: 3b803ad34d046b499b986074b29cf199 ****/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
b: bool
n: int
a: Standard_Address

Return
-------
None

Description
-----------
No available documentation.
") Set;
		void Set(const Standard_Boolean b, const Standard_Integer n, const Standard_Address a);

};


%make_alias(TopOpeBRepDS_Marker)

%extend TopOpeBRepDS_Marker {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class TopOpeBRepDS_Point *
***************************/
class TopOpeBRepDS_Point {
	public:
		/****************** TopOpeBRepDS_Point ******************/
		/**** md5 signature: 83a29b568430e739ad8fe8ae52fcb158 ****/
		%feature("compactdefaultargs") TopOpeBRepDS_Point;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepDS_Point;
		 TopOpeBRepDS_Point();

		/****************** TopOpeBRepDS_Point ******************/
		/**** md5 signature: b5958abaa1eb0e97583f37b5ac0924a7 ****/
		%feature("compactdefaultargs") TopOpeBRepDS_Point;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
T: float

Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepDS_Point;
		 TopOpeBRepDS_Point(const gp_Pnt & P, const Standard_Real T);

		/****************** TopOpeBRepDS_Point ******************/
		/**** md5 signature: 1e6cf5507d272bf5736e0d7a92f091d3 ****/
		%feature("compactdefaultargs") TopOpeBRepDS_Point;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepDS_Point;
		 TopOpeBRepDS_Point(const TopoDS_Shape & S);

		/****************** ChangeKeep ******************/
		/**** md5 signature: 75f379b6bb874b0da2db245ffe678874 ****/
		%feature("compactdefaultargs") ChangeKeep;
		%feature("autodoc", "
Parameters
----------
B: bool

Return
-------
None

Description
-----------
No available documentation.
") ChangeKeep;
		void ChangeKeep(const Standard_Boolean B);

		/****************** ChangePoint ******************/
		/**** md5 signature: 33f76a92948a53a65ecd0d3de11b040d ****/
		%feature("compactdefaultargs") ChangePoint;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
No available documentation.
") ChangePoint;
		gp_Pnt ChangePoint();

		/****************** IsEqual ******************/
		/**** md5 signature: 5e59b6db27abceb6b2820f06b0880d15 ****/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "
Parameters
----------
other: TopOpeBRepDS_Point

Return
-------
bool

Description
-----------
No available documentation.
") IsEqual;
		Standard_Boolean IsEqual(const TopOpeBRepDS_Point & other);

		/****************** Keep ******************/
		/**** md5 signature: 49f5fb06c6fb4c03a84c4eb06dd2637f ****/
		%feature("compactdefaultargs") Keep;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") Keep;
		Standard_Boolean Keep();

		/****************** Point ******************/
		/**** md5 signature: 177e376cc11d1fedb2819bac56591ea8 ****/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
No available documentation.
") Point;
		const gp_Pnt Point();

		/****************** Tolerance ******************/
		/**** md5 signature: 9e5775014410d884d1a1adc1cd47930b ****/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") Tolerance;
		Standard_Real Tolerance();

		/****************** Tolerance ******************/
		/**** md5 signature: e925b87131cc380a2e6cb497cb7384fa ****/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "
Parameters
----------
Tol: float

Return
-------
None

Description
-----------
No available documentation.
") Tolerance;
		void Tolerance(const Standard_Real Tol);

};


%extend TopOpeBRepDS_Point {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class TopOpeBRepDS_PointExplorer *
***********************************/
class TopOpeBRepDS_PointExplorer {
	public:
		/****************** TopOpeBRepDS_PointExplorer ******************/
		/**** md5 signature: dc00b242873f7bcf861cfdbca34501e9 ****/
		%feature("compactdefaultargs") TopOpeBRepDS_PointExplorer;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepDS_PointExplorer;
		 TopOpeBRepDS_PointExplorer();

		/****************** TopOpeBRepDS_PointExplorer ******************/
		/**** md5 signature: 2a6dbca93721718f1bf55918e0c7a00e ****/
		%feature("compactdefaultargs") TopOpeBRepDS_PointExplorer;
		%feature("autodoc", "
Parameters
----------
DS: TopOpeBRepDS_DataStructure
FindOnlyKeep: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepDS_PointExplorer;
		 TopOpeBRepDS_PointExplorer(const TopOpeBRepDS_DataStructure & DS, const Standard_Boolean FindOnlyKeep = Standard_True);

		/****************** Index ******************/
		/**** md5 signature: 407d80ef3037d55996765198adea3908 ****/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Index;
		Standard_Integer Index();

		/****************** Init ******************/
		/**** md5 signature: 3cb53884a0dedff3ad42657c8c345e44 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
DS: TopOpeBRepDS_DataStructure
FindOnlyKeep: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const TopOpeBRepDS_DataStructure & DS, const Standard_Boolean FindOnlyKeep = Standard_True);

		/****************** IsPoint ******************/
		/**** md5 signature: b47fb5bce98c767ee2068a626d524140 ****/
		%feature("compactdefaultargs") IsPoint;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
bool

Description
-----------
No available documentation.
") IsPoint;
		Standard_Boolean IsPoint(const Standard_Integer I);

		/****************** IsPointKeep ******************/
		/**** md5 signature: 51dc517d07c940f5d6befee4a6048cc5 ****/
		%feature("compactdefaultargs") IsPointKeep;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
bool

Description
-----------
No available documentation.
") IsPointKeep;
		Standard_Boolean IsPointKeep(const Standard_Integer I);

		/****************** More ******************/
		/**** md5 signature: 6f6e915c9a3dca758c059d9e8af02dff ****/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") More;
		Standard_Boolean More();

		/****************** NbPoint ******************/
		/**** md5 signature: 31a8a75525c80d8d0cd3972a811a871a ****/
		%feature("compactdefaultargs") NbPoint;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbPoint;
		Standard_Integer NbPoint();

		/****************** Next ******************/
		/**** md5 signature: f35c0df5f1d7c877986db18081404532 ****/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Next;
		void Next();

		/****************** Point ******************/
		/**** md5 signature: b78584a0e22a5b86a67814fa9f99e5f7 ****/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Return
-------
TopOpeBRepDS_Point

Description
-----------
No available documentation.
") Point;
		const TopOpeBRepDS_Point & Point();

		/****************** Point ******************/
		/**** md5 signature: 5b8c65793f4550a005f74995c521586b ****/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
TopOpeBRepDS_Point

Description
-----------
No available documentation.
") Point;
		const TopOpeBRepDS_Point & Point(const Standard_Integer I);

};


%extend TopOpeBRepDS_PointExplorer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class TopOpeBRepDS_Reducer *
*****************************/
class TopOpeBRepDS_Reducer {
	public:
		/****************** TopOpeBRepDS_Reducer ******************/
		/**** md5 signature: 37b5bdea3959e23940c29f4e29e77235 ****/
		%feature("compactdefaultargs") TopOpeBRepDS_Reducer;
		%feature("autodoc", "
Parameters
----------
HDS: TopOpeBRepDS_HDataStructure

Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepDS_Reducer;
		 TopOpeBRepDS_Reducer(const opencascade::handle<TopOpeBRepDS_HDataStructure> & HDS);

		/****************** ProcessEdgeInterferences ******************/
		/**** md5 signature: fdb0a9346715ac3d5b07add0cbfe07d8 ****/
		%feature("compactdefaultargs") ProcessEdgeInterferences;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") ProcessEdgeInterferences;
		void ProcessEdgeInterferences();

		/****************** ProcessFaceInterferences ******************/
		/**** md5 signature: 22ea874d673770f31f98a3c38885bd6a ****/
		%feature("compactdefaultargs") ProcessFaceInterferences;
		%feature("autodoc", "
Parameters
----------
M: TopOpeBRepDS_DataMapOfShapeListOfShapeOn1State

Return
-------
None

Description
-----------
No available documentation.
") ProcessFaceInterferences;
		void ProcessFaceInterferences(const TopOpeBRepDS_DataMapOfShapeListOfShapeOn1State & M);

};


%extend TopOpeBRepDS_Reducer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class TopOpeBRepDS_ShapeData *
*******************************/
class TopOpeBRepDS_ShapeData {
	public:
		/****************** TopOpeBRepDS_ShapeData ******************/
		/**** md5 signature: 57c5d4e33f2655d9681294dfd2eb97b5 ****/
		%feature("compactdefaultargs") TopOpeBRepDS_ShapeData;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepDS_ShapeData;
		 TopOpeBRepDS_ShapeData();

		/****************** ChangeInterferences ******************/
		/**** md5 signature: 1c8cdb23abd41bd3fe65cba4df26ed63 ****/
		%feature("compactdefaultargs") ChangeInterferences;
		%feature("autodoc", "Return
-------
TopOpeBRepDS_ListOfInterference

Description
-----------
No available documentation.
") ChangeInterferences;
		TopOpeBRepDS_ListOfInterference & ChangeInterferences();

		/****************** ChangeKeep ******************/
		/**** md5 signature: 75f379b6bb874b0da2db245ffe678874 ****/
		%feature("compactdefaultargs") ChangeKeep;
		%feature("autodoc", "
Parameters
----------
B: bool

Return
-------
None

Description
-----------
No available documentation.
") ChangeKeep;
		void ChangeKeep(const Standard_Boolean B);

		/****************** Interferences ******************/
		/**** md5 signature: 237ed42d67b2b8b56ca50b69c4e86889 ****/
		%feature("compactdefaultargs") Interferences;
		%feature("autodoc", "Return
-------
TopOpeBRepDS_ListOfInterference

Description
-----------
No available documentation.
") Interferences;
		const TopOpeBRepDS_ListOfInterference & Interferences();

		/****************** Keep ******************/
		/**** md5 signature: 49f5fb06c6fb4c03a84c4eb06dd2637f ****/
		%feature("compactdefaultargs") Keep;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") Keep;
		Standard_Boolean Keep();

};


%extend TopOpeBRepDS_ShapeData {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class TopOpeBRepDS_ShapeWithState *
************************************/
class TopOpeBRepDS_ShapeWithState {
	public:
		/****************** TopOpeBRepDS_ShapeWithState ******************/
		/**** md5 signature: 4381f6f6290e6f3ef044083d8c51c29a ****/
		%feature("compactdefaultargs") TopOpeBRepDS_ShapeWithState;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepDS_ShapeWithState;
		 TopOpeBRepDS_ShapeWithState();

		/****************** AddPart ******************/
		/**** md5 signature: 3f89161790069044c8e7efde38c7a855 ****/
		%feature("compactdefaultargs") AddPart;
		%feature("autodoc", "
Parameters
----------
aShape: TopoDS_Shape
aState: TopAbs_State

Return
-------
None

Description
-----------
No available documentation.
") AddPart;
		void AddPart(const TopoDS_Shape & aShape, const TopAbs_State aState);

		/****************** AddParts ******************/
		/**** md5 signature: 1b97aa34dfcfaba07a4d57d24b82410d ****/
		%feature("compactdefaultargs") AddParts;
		%feature("autodoc", "
Parameters
----------
aListOfShape: TopTools_ListOfShape
aState: TopAbs_State

Return
-------
None

Description
-----------
No available documentation.
") AddParts;
		void AddParts(const TopTools_ListOfShape & aListOfShape, const TopAbs_State aState);

		/****************** IsSplitted ******************/
		/**** md5 signature: e67faeac515fe8ba137b50086f37c89e ****/
		%feature("compactdefaultargs") IsSplitted;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsSplitted;
		Standard_Boolean IsSplitted();

		/****************** Part ******************/
		/**** md5 signature: 39c7dce1e3b86388fa9280e1271e19ab ****/
		%feature("compactdefaultargs") Part;
		%feature("autodoc", "
Parameters
----------
aState: TopAbs_State

Return
-------
TopTools_ListOfShape

Description
-----------
No available documentation.
") Part;
		const TopTools_ListOfShape & Part(const TopAbs_State aState);

		/****************** SetIsSplitted ******************/
		/**** md5 signature: e39ed6edc2cda52aa3e12d1bdbdde93b ****/
		%feature("compactdefaultargs") SetIsSplitted;
		%feature("autodoc", "
Parameters
----------
anIsSplitted: bool

Return
-------
None

Description
-----------
No available documentation.
") SetIsSplitted;
		void SetIsSplitted(const Standard_Boolean anIsSplitted);

		/****************** SetState ******************/
		/**** md5 signature: 8d4728ca94737d0ac8e24be948ef249b ****/
		%feature("compactdefaultargs") SetState;
		%feature("autodoc", "
Parameters
----------
aState: TopAbs_State

Return
-------
None

Description
-----------
No available documentation.
") SetState;
		void SetState(const TopAbs_State aState);

		/****************** State ******************/
		/**** md5 signature: 927c83b1efdec797adb47eb058eddaa0 ****/
		%feature("compactdefaultargs") State;
		%feature("autodoc", "Return
-------
TopAbs_State

Description
-----------
No available documentation.
") State;
		TopAbs_State State();

};


%extend TopOpeBRepDS_ShapeWithState {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class TopOpeBRepDS_Surface *
*****************************/
class TopOpeBRepDS_Surface {
	public:
		/****************** TopOpeBRepDS_Surface ******************/
		/**** md5 signature: 10b8fac68cd2dde99360bef80bdfef9c ****/
		%feature("compactdefaultargs") TopOpeBRepDS_Surface;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepDS_Surface;
		 TopOpeBRepDS_Surface();

		/****************** TopOpeBRepDS_Surface ******************/
		/**** md5 signature: d182222c8bc6c34b87980490e4b78679 ****/
		%feature("compactdefaultargs") TopOpeBRepDS_Surface;
		%feature("autodoc", "
Parameters
----------
P: Geom_Surface
T: float

Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepDS_Surface;
		 TopOpeBRepDS_Surface(const opencascade::handle<Geom_Surface> & P, const Standard_Real T);

		/****************** TopOpeBRepDS_Surface ******************/
		/**** md5 signature: 752d3f0d36c9488cd962ac08a53cdde3 ****/
		%feature("compactdefaultargs") TopOpeBRepDS_Surface;
		%feature("autodoc", "
Parameters
----------
Other: TopOpeBRepDS_Surface

Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepDS_Surface;
		 TopOpeBRepDS_Surface(const TopOpeBRepDS_Surface & Other);

		/****************** Assign ******************/
		/**** md5 signature: 887e886360184f6c5ae1ac009665df5c ****/
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "
Parameters
----------
Other: TopOpeBRepDS_Surface

Return
-------
None

Description
-----------
No available documentation.
") Assign;
		void Assign(const TopOpeBRepDS_Surface & Other);

		/****************** ChangeKeep ******************/
		/**** md5 signature: c0b034be6ced0ecf537a4d2cd976c965 ****/
		%feature("compactdefaultargs") ChangeKeep;
		%feature("autodoc", "
Parameters
----------
theToKeep: bool

Return
-------
None

Description
-----------
No available documentation.
") ChangeKeep;
		void ChangeKeep(Standard_Boolean theToKeep);

		/****************** Keep ******************/
		/**** md5 signature: 7a6eea11b699a258601fdf5543ded844 ****/
		%feature("compactdefaultargs") Keep;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") Keep;
		Standard_Boolean Keep();

		/****************** Surface ******************/
		/**** md5 signature: 3aa31a6d63da8a25f018cf96599c0928 ****/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Surface>

Description
-----------
No available documentation.
") Surface;
		const opencascade::handle<Geom_Surface> & Surface();

		/****************** Tolerance ******************/
		/**** md5 signature: 327dcbe220ae5ba3e0203f32c61c38db ****/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") Tolerance;
		Standard_Real Tolerance();

		/****************** Tolerance ******************/
		/**** md5 signature: 6e44bbef8a403b18484e0d3b65d37a2b ****/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "
Parameters
----------
theTol: float

Return
-------
None

Description
-----------
Update the tolerance.
") Tolerance;
		void Tolerance(Standard_Real theTol);

};


%extend TopOpeBRepDS_Surface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class TopOpeBRepDS_SurfaceExplorer *
*************************************/
class TopOpeBRepDS_SurfaceExplorer {
	public:
		/****************** TopOpeBRepDS_SurfaceExplorer ******************/
		/**** md5 signature: 5e6ccfbf6133bd02c15d1742ebb7e8d8 ****/
		%feature("compactdefaultargs") TopOpeBRepDS_SurfaceExplorer;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepDS_SurfaceExplorer;
		 TopOpeBRepDS_SurfaceExplorer();

		/****************** TopOpeBRepDS_SurfaceExplorer ******************/
		/**** md5 signature: 8cbac392ec2c20a95da9ab8967461215 ****/
		%feature("compactdefaultargs") TopOpeBRepDS_SurfaceExplorer;
		%feature("autodoc", "
Parameters
----------
DS: TopOpeBRepDS_DataStructure
FindOnlyKeep: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepDS_SurfaceExplorer;
		 TopOpeBRepDS_SurfaceExplorer(const TopOpeBRepDS_DataStructure & DS, const Standard_Boolean FindOnlyKeep = Standard_True);

		/****************** Index ******************/
		/**** md5 signature: 407d80ef3037d55996765198adea3908 ****/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Index;
		Standard_Integer Index();

		/****************** Init ******************/
		/**** md5 signature: 3cb53884a0dedff3ad42657c8c345e44 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
DS: TopOpeBRepDS_DataStructure
FindOnlyKeep: bool (optional, default to Standard_True)

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const TopOpeBRepDS_DataStructure & DS, const Standard_Boolean FindOnlyKeep = Standard_True);

		/****************** IsSurface ******************/
		/**** md5 signature: 23653089f9220cade768c1e060f8ad7e ****/
		%feature("compactdefaultargs") IsSurface;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
bool

Description
-----------
No available documentation.
") IsSurface;
		Standard_Boolean IsSurface(const Standard_Integer I);

		/****************** IsSurfaceKeep ******************/
		/**** md5 signature: b3b41974489a001805ef550cf30b329d ****/
		%feature("compactdefaultargs") IsSurfaceKeep;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
bool

Description
-----------
No available documentation.
") IsSurfaceKeep;
		Standard_Boolean IsSurfaceKeep(const Standard_Integer I);

		/****************** More ******************/
		/**** md5 signature: 6f6e915c9a3dca758c059d9e8af02dff ****/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") More;
		Standard_Boolean More();

		/****************** NbSurface ******************/
		/**** md5 signature: 01f2d8c6928db710b4dd4353c5bece7f ****/
		%feature("compactdefaultargs") NbSurface;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbSurface;
		Standard_Integer NbSurface();

		/****************** Next ******************/
		/**** md5 signature: f35c0df5f1d7c877986db18081404532 ****/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Next;
		void Next();

		/****************** Surface ******************/
		/**** md5 signature: f14ed172bc4994a2659e658ac71310ff ****/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "Return
-------
TopOpeBRepDS_Surface

Description
-----------
No available documentation.
") Surface;
		const TopOpeBRepDS_Surface & Surface();

		/****************** Surface ******************/
		/**** md5 signature: 0fa398e726541e213860705286d521cb ****/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
TopOpeBRepDS_Surface

Description
-----------
No available documentation.
") Surface;
		const TopOpeBRepDS_Surface & Surface(const Standard_Integer I);

};


%extend TopOpeBRepDS_SurfaceExplorer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class TopOpeBRepDS_TKI *
*************************/
class TopOpeBRepDS_TKI {
	public:
		/****************** TopOpeBRepDS_TKI ******************/
		/**** md5 signature: db43a70607261f43f669e070754d8a98 ****/
		%feature("compactdefaultargs") TopOpeBRepDS_TKI;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepDS_TKI;
		 TopOpeBRepDS_TKI();

		/****************** Add ******************/
		/**** md5 signature: f55a2389af157567e50919391478ec0f ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
K: TopOpeBRepDS_Kind
G: int

Return
-------
None

Description
-----------
No available documentation.
") Add;
		void Add(const TopOpeBRepDS_Kind K, const Standard_Integer G);

		/****************** Add ******************/
		/**** md5 signature: bf4db3b7c8d2d6237acea717b54695ba ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
K: TopOpeBRepDS_Kind
G: int
HI: TopOpeBRepDS_Interference

Return
-------
None

Description
-----------
No available documentation.
") Add;
		void Add(const TopOpeBRepDS_Kind K, const Standard_Integer G, const opencascade::handle<TopOpeBRepDS_Interference> & HI);

		/****************** ChangeInterferences ******************/
		/**** md5 signature: 2f520ca726f7c5c6d80ab09ed2c80e08 ****/
		%feature("compactdefaultargs") ChangeInterferences;
		%feature("autodoc", "
Parameters
----------
K: TopOpeBRepDS_Kind
G: int

Return
-------
TopOpeBRepDS_ListOfInterference

Description
-----------
No available documentation.
") ChangeInterferences;
		TopOpeBRepDS_ListOfInterference & ChangeInterferences(const TopOpeBRepDS_Kind K, const Standard_Integer G);

		/****************** ChangeValue ******************/
		/**** md5 signature: 94fd5d5cbd269e45cd12e8da39fea321 ****/
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "
Parameters
----------

Return
-------
K: TopOpeBRepDS_Kind
G: int

Description
-----------
No available documentation.
") ChangeValue;
		TopOpeBRepDS_ListOfInterference & ChangeValue(TopOpeBRepDS_Kind &OutValue, Standard_Integer &OutValue);

		/****************** Clear ******************/
		/**** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ****/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Clear;
		void Clear();

		/****************** DumpTKIIterator ******************/
		/**** md5 signature: f8bb25e34cb8c428f8657fd68e1ef90e ****/
		%feature("compactdefaultargs") DumpTKIIterator;
		%feature("autodoc", "
Parameters
----------
s1: str (optional, default to "")
s2: str (optional, default to "")

Return
-------
None

Description
-----------
No available documentation.
") DumpTKIIterator;
		void DumpTKIIterator(TCollection_AsciiString s1 = "", TCollection_AsciiString s2 = "");

		/****************** FillOnGeometry ******************/
		/**** md5 signature: bc57c0884bf6423d13a2fa1a0ba316da ****/
		%feature("compactdefaultargs") FillOnGeometry;
		%feature("autodoc", "
Parameters
----------
L: TopOpeBRepDS_ListOfInterference

Return
-------
None

Description
-----------
No available documentation.
") FillOnGeometry;
		void FillOnGeometry(const TopOpeBRepDS_ListOfInterference & L);

		/****************** FillOnSupport ******************/
		/**** md5 signature: 545c50b7aba4391215c5814b43c1ecbd ****/
		%feature("compactdefaultargs") FillOnSupport;
		%feature("autodoc", "
Parameters
----------
L: TopOpeBRepDS_ListOfInterference

Return
-------
None

Description
-----------
No available documentation.
") FillOnSupport;
		void FillOnSupport(const TopOpeBRepDS_ListOfInterference & L);

		/****************** HasInterferences ******************/
		/**** md5 signature: f227c521c6c63e3c9841ef5b7409367c ****/
		%feature("compactdefaultargs") HasInterferences;
		%feature("autodoc", "
Parameters
----------
K: TopOpeBRepDS_Kind
G: int

Return
-------
bool

Description
-----------
No available documentation.
") HasInterferences;
		Standard_Boolean HasInterferences(const TopOpeBRepDS_Kind K, const Standard_Integer G);

		/****************** Init ******************/
		/**** md5 signature: 0de93ef32c53d091768788dca0e281fd ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init();

		/****************** Interferences ******************/
		/**** md5 signature: 3ff5c12c6b6327e3c022a6739fba28d2 ****/
		%feature("compactdefaultargs") Interferences;
		%feature("autodoc", "
Parameters
----------
K: TopOpeBRepDS_Kind
G: int

Return
-------
TopOpeBRepDS_ListOfInterference

Description
-----------
No available documentation.
") Interferences;
		const TopOpeBRepDS_ListOfInterference & Interferences(const TopOpeBRepDS_Kind K, const Standard_Integer G);

		/****************** IsBound ******************/
		/**** md5 signature: e5a495fdf225daf5a4c7ba3d93b0ea9a ****/
		%feature("compactdefaultargs") IsBound;
		%feature("autodoc", "
Parameters
----------
K: TopOpeBRepDS_Kind
G: int

Return
-------
bool

Description
-----------
No available documentation.
") IsBound;
		Standard_Boolean IsBound(const TopOpeBRepDS_Kind K, const Standard_Integer G);

		/****************** More ******************/
		/**** md5 signature: 6f6e915c9a3dca758c059d9e8af02dff ****/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") More;
		Standard_Boolean More();

		/****************** Next ******************/
		/**** md5 signature: f35c0df5f1d7c877986db18081404532 ****/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Next;
		void Next();

		/****************** Value ******************/
		/**** md5 signature: 74319da71df133747d4e785790ac7c21 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------

Return
-------
K: TopOpeBRepDS_Kind
G: int

Description
-----------
No available documentation.
") Value;
		const TopOpeBRepDS_ListOfInterference & Value(TopOpeBRepDS_Kind &OutValue, Standard_Integer &OutValue);

};


%extend TopOpeBRepDS_TKI {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class TopOpeBRepDS_TOOL *
**************************/
class TopOpeBRepDS_TOOL {
	public:
		/****************** EShareG ******************/
		/**** md5 signature: b849239d1a609d8f9cb08a451d6b1a1a ****/
		%feature("compactdefaultargs") EShareG;
		%feature("autodoc", "
Parameters
----------
HDS: TopOpeBRepDS_HDataStructure
E: TopoDS_Edge
lEsd: TopTools_ListOfShape

Return
-------
int

Description
-----------
No available documentation.
") EShareG;
		static Standard_Integer EShareG(const opencascade::handle<TopOpeBRepDS_HDataStructure> & HDS, const TopoDS_Edge & E, TopTools_ListOfShape & lEsd);

		/****************** GetConfig ******************/
		/**** md5 signature: 50e3bd3f9d1963cf5a34f472b7207004 ****/
		%feature("compactdefaultargs") GetConfig;
		%feature("autodoc", "
Parameters
----------
HDS: TopOpeBRepDS_HDataStructure
MEspON: TopOpeBRepDS_DataMapOfShapeListOfShapeOn1State
ie: int
iesd: int

Return
-------
conf: int

Description
-----------
No available documentation.
") GetConfig;
		static Standard_Boolean GetConfig(const opencascade::handle<TopOpeBRepDS_HDataStructure> & HDS, const TopOpeBRepDS_DataMapOfShapeListOfShapeOn1State & MEspON, const Standard_Integer ie, const Standard_Integer iesd, Standard_Integer &OutValue);

		/****************** GetEsd ******************/
		/**** md5 signature: b00b236e3c31577ce32f80c90a4b14a3 ****/
		%feature("compactdefaultargs") GetEsd;
		%feature("autodoc", "
Parameters
----------
HDS: TopOpeBRepDS_HDataStructure
S: TopoDS_Shape
ie: int

Return
-------
iesd: int

Description
-----------
No available documentation.
") GetEsd;
		static Standard_Boolean GetEsd(const opencascade::handle<TopOpeBRepDS_HDataStructure> & HDS, const TopoDS_Shape & S, const Standard_Integer ie, Standard_Integer &OutValue);

		/****************** ShareG ******************/
		/**** md5 signature: d39c16d7b46413f1d5ecaf6edf9774b7 ****/
		%feature("compactdefaultargs") ShareG;
		%feature("autodoc", "
Parameters
----------
HDS: TopOpeBRepDS_HDataStructure
is1: int
is2: int

Return
-------
bool

Description
-----------
No available documentation.
") ShareG;
		static Standard_Boolean ShareG(const opencascade::handle<TopOpeBRepDS_HDataStructure> & HDS, const Standard_Integer is1, const Standard_Integer is2);

		/****************** ShareSplitON ******************/
		/**** md5 signature: 9628684691e319e9a5963fd0252f466a ****/
		%feature("compactdefaultargs") ShareSplitON;
		%feature("autodoc", "
Parameters
----------
HDS: TopOpeBRepDS_HDataStructure
MspON: TopOpeBRepDS_DataMapOfShapeListOfShapeOn1State
i1: int
i2: int
spON: TopoDS_Shape

Return
-------
bool

Description
-----------
No available documentation.
") ShareSplitON;
		static Standard_Boolean ShareSplitON(const opencascade::handle<TopOpeBRepDS_HDataStructure> & HDS, const TopOpeBRepDS_DataMapOfShapeListOfShapeOn1State & MspON, const Standard_Integer i1, const Standard_Integer i2, TopoDS_Shape & spON);

};


%extend TopOpeBRepDS_TOOL {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class TopOpeBRepDS_Transition *
********************************/
class TopOpeBRepDS_Transition {
	public:
		/****************** TopOpeBRepDS_Transition ******************/
		/**** md5 signature: b0f031dc3541ef102b6397d2d7a1a516 ****/
		%feature("compactdefaultargs") TopOpeBRepDS_Transition;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepDS_Transition;
		 TopOpeBRepDS_Transition();

		/****************** TopOpeBRepDS_Transition ******************/
		/**** md5 signature: f2d39af7aa0cba09bc14429f57dd8c18 ****/
		%feature("compactdefaultargs") TopOpeBRepDS_Transition;
		%feature("autodoc", "
Parameters
----------
StateBefore: TopAbs_State
StateAfter: TopAbs_State
ShapeBefore: TopAbs_ShapeEnum (optional, default to TopAbs_FACE)
ShapeAfter: TopAbs_ShapeEnum (optional, default to TopAbs_FACE)

Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepDS_Transition;
		 TopOpeBRepDS_Transition(const TopAbs_State StateBefore, const TopAbs_State StateAfter, const TopAbs_ShapeEnum ShapeBefore = TopAbs_FACE, const TopAbs_ShapeEnum ShapeAfter = TopAbs_FACE);

		/****************** TopOpeBRepDS_Transition ******************/
		/**** md5 signature: 249a16cc5bbcf2be99319e0964d91a6b ****/
		%feature("compactdefaultargs") TopOpeBRepDS_Transition;
		%feature("autodoc", "
Parameters
----------
O: TopAbs_Orientation

Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepDS_Transition;
		 TopOpeBRepDS_Transition(const TopAbs_Orientation O);

		/****************** After ******************/
		/**** md5 signature: a2c5df0ddcd2e8c33fa1f44aecdd13ee ****/
		%feature("compactdefaultargs") After;
		%feature("autodoc", "
Parameters
----------
S: TopAbs_State
ShapeAfter: TopAbs_ShapeEnum (optional, default to TopAbs_FACE)

Return
-------
None

Description
-----------
No available documentation.
") After;
		void After(const TopAbs_State S, const TopAbs_ShapeEnum ShapeAfter = TopAbs_FACE);

		/****************** After ******************/
		/**** md5 signature: 0130d06cb83ecca0888806946b20635a ****/
		%feature("compactdefaultargs") After;
		%feature("autodoc", "Return
-------
TopAbs_State

Description
-----------
No available documentation.
") After;
		TopAbs_State After();

		/****************** Before ******************/
		/**** md5 signature: bb0ee36e91deb1cb406862c3def1bf56 ****/
		%feature("compactdefaultargs") Before;
		%feature("autodoc", "
Parameters
----------
S: TopAbs_State
ShapeBefore: TopAbs_ShapeEnum (optional, default to TopAbs_FACE)

Return
-------
None

Description
-----------
No available documentation.
") Before;
		void Before(const TopAbs_State S, const TopAbs_ShapeEnum ShapeBefore = TopAbs_FACE);

		/****************** Before ******************/
		/**** md5 signature: f0e6b6334b2f08c45649ca23a4263f82 ****/
		%feature("compactdefaultargs") Before;
		%feature("autodoc", "Return
-------
TopAbs_State

Description
-----------
No available documentation.
") Before;
		TopAbs_State Before();

		/****************** Complement ******************/
		/**** md5 signature: 2ad99db6589ec94469edd4ee0dd1a47d ****/
		%feature("compactdefaultargs") Complement;
		%feature("autodoc", "Return
-------
TopOpeBRepDS_Transition

Description
-----------
No available documentation.
") Complement;
		TopOpeBRepDS_Transition Complement();

		/****************** Index ******************/
		/**** md5 signature: 14b6f4590eeca8d2e66a904c0019a95f ****/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
None

Description
-----------
No available documentation.
") Index;
		void Index(const Standard_Integer I);

		/****************** Index ******************/
		/**** md5 signature: 407d80ef3037d55996765198adea3908 ****/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Index;
		Standard_Integer Index();

		/****************** IndexAfter ******************/
		/**** md5 signature: 6107475a303c254e6ec126186032ec74 ****/
		%feature("compactdefaultargs") IndexAfter;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
None

Description
-----------
No available documentation.
") IndexAfter;
		void IndexAfter(const Standard_Integer I);

		/****************** IndexAfter ******************/
		/**** md5 signature: 36ca760f09f0a2780bd04edd64041a5f ****/
		%feature("compactdefaultargs") IndexAfter;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") IndexAfter;
		Standard_Integer IndexAfter();

		/****************** IndexBefore ******************/
		/**** md5 signature: bad742ca713bae21fed223779cd45538 ****/
		%feature("compactdefaultargs") IndexBefore;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
None

Description
-----------
No available documentation.
") IndexBefore;
		void IndexBefore(const Standard_Integer I);

		/****************** IndexBefore ******************/
		/**** md5 signature: 85450063c5853e01bb91dec3ff91f13f ****/
		%feature("compactdefaultargs") IndexBefore;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") IndexBefore;
		Standard_Integer IndexBefore();

		/****************** IsUnknown ******************/
		/**** md5 signature: 3664e7b68ca3ddc8f89b66fb416769e1 ****/
		%feature("compactdefaultargs") IsUnknown;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if both states are unknown.
") IsUnknown;
		Standard_Boolean IsUnknown();

		/****************** ONAfter ******************/
		/**** md5 signature: 008dca4f114debbf73dba6e7dc3497a8 ****/
		%feature("compactdefaultargs") ONAfter;
		%feature("autodoc", "Return
-------
TopAbs_ShapeEnum

Description
-----------
No available documentation.
") ONAfter;
		TopAbs_ShapeEnum ONAfter();

		/****************** ONBefore ******************/
		/**** md5 signature: 2b95fcd8529b8241abc8ac9e9340521b ****/
		%feature("compactdefaultargs") ONBefore;
		%feature("autodoc", "Return
-------
TopAbs_ShapeEnum

Description
-----------
No available documentation.
") ONBefore;
		TopAbs_ShapeEnum ONBefore();

		/****************** Orientation ******************/
		/**** md5 signature: fac36aaf9a745b7e79b351c3e940eb85 ****/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "
Parameters
----------
S: TopAbs_State
T: TopAbs_ShapeEnum (optional, default to TopAbs_FACE)

Return
-------
TopAbs_Orientation

Description
-----------
Returns the orientation corresponding to state <s> //! before and after not equal topabs_on: -------------------------------------- before after computed orientation //! s not s reversed (we leave state s) not s s forward (we enter state s) s s internal (we stay in state s) not s not s external (we stay outside state s).
") Orientation;
		TopAbs_Orientation Orientation(const TopAbs_State S, const TopAbs_ShapeEnum T = TopAbs_FACE);

		/****************** Set ******************/
		/**** md5 signature: 4928947a67feca2ba52483e250914cf5 ****/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
StateBefore: TopAbs_State
StateAfter: TopAbs_State
ShapeBefore: TopAbs_ShapeEnum (optional, default to TopAbs_FACE)
ShapeAfter: TopAbs_ShapeEnum (optional, default to TopAbs_FACE)

Return
-------
None

Description
-----------
No available documentation.
") Set;
		void Set(const TopAbs_State StateBefore, const TopAbs_State StateAfter, const TopAbs_ShapeEnum ShapeBefore = TopAbs_FACE, const TopAbs_ShapeEnum ShapeAfter = TopAbs_FACE);

		/****************** Set ******************/
		/**** md5 signature: 565e36f717cf668f6a1dba95ac37ca78 ****/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
O: TopAbs_Orientation

Return
-------
None

Description
-----------
Set the transition corresponding to orientation <o> //! o before after //! forward out in reversed in out internal in in external out out.
") Set;
		void Set(const TopAbs_Orientation O);

		/****************** ShapeAfter ******************/
		/**** md5 signature: 9bac723e506fae84bc6112fa9eb8af3d ****/
		%feature("compactdefaultargs") ShapeAfter;
		%feature("autodoc", "
Parameters
----------
SE: TopAbs_ShapeEnum

Return
-------
None

Description
-----------
No available documentation.
") ShapeAfter;
		void ShapeAfter(const TopAbs_ShapeEnum SE);

		/****************** ShapeAfter ******************/
		/**** md5 signature: bb9fe4018e7529347a72f5cd01863779 ****/
		%feature("compactdefaultargs") ShapeAfter;
		%feature("autodoc", "Return
-------
TopAbs_ShapeEnum

Description
-----------
No available documentation.
") ShapeAfter;
		TopAbs_ShapeEnum ShapeAfter();

		/****************** ShapeBefore ******************/
		/**** md5 signature: 593103fd0d882efa2c2ba16f9715c496 ****/
		%feature("compactdefaultargs") ShapeBefore;
		%feature("autodoc", "
Parameters
----------
SE: TopAbs_ShapeEnum

Return
-------
None

Description
-----------
No available documentation.
") ShapeBefore;
		void ShapeBefore(const TopAbs_ShapeEnum SE);

		/****************** ShapeBefore ******************/
		/**** md5 signature: 9f9440c9eee019790015c78656c810f1 ****/
		%feature("compactdefaultargs") ShapeBefore;
		%feature("autodoc", "Return
-------
TopAbs_ShapeEnum

Description
-----------
No available documentation.
") ShapeBefore;
		TopAbs_ShapeEnum ShapeBefore();

		/****************** StateAfter ******************/
		/**** md5 signature: d482f8b89008d7e48bba2a0091db7e0e ****/
		%feature("compactdefaultargs") StateAfter;
		%feature("autodoc", "
Parameters
----------
S: TopAbs_State

Return
-------
None

Description
-----------
No available documentation.
") StateAfter;
		void StateAfter(const TopAbs_State S);

		/****************** StateBefore ******************/
		/**** md5 signature: 3604f53f49079234a85dde72a3aad0f9 ****/
		%feature("compactdefaultargs") StateBefore;
		%feature("autodoc", "
Parameters
----------
S: TopAbs_State

Return
-------
None

Description
-----------
No available documentation.
") StateBefore;
		void StateBefore(const TopAbs_State S);

};


%extend TopOpeBRepDS_Transition {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class TopOpeBRepDS_CurveData *
*******************************/
class TopOpeBRepDS_CurveData : public TopOpeBRepDS_GeometryData {
	public:
		/****************** TopOpeBRepDS_CurveData ******************/
		/**** md5 signature: ab1de503a7276c3af41cd46b60ec2718 ****/
		%feature("compactdefaultargs") TopOpeBRepDS_CurveData;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepDS_CurveData;
		 TopOpeBRepDS_CurveData();

		/****************** TopOpeBRepDS_CurveData ******************/
		/**** md5 signature: cf41ff245973298d204dfbd9436d4f2d ****/
		%feature("compactdefaultargs") TopOpeBRepDS_CurveData;
		%feature("autodoc", "
Parameters
----------
C: TopOpeBRepDS_Curve

Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepDS_CurveData;
		 TopOpeBRepDS_CurveData(const TopOpeBRepDS_Curve & C);

};


%extend TopOpeBRepDS_CurveData {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class TopOpeBRepDS_CurveIterator *
***********************************/
class TopOpeBRepDS_CurveIterator : public TopOpeBRepDS_InterferenceIterator {
	public:
		/****************** TopOpeBRepDS_CurveIterator ******************/
		/**** md5 signature: 2270e0964c87c6cda964e18d58567e4d ****/
		%feature("compactdefaultargs") TopOpeBRepDS_CurveIterator;
		%feature("autodoc", "
Parameters
----------
L: TopOpeBRepDS_ListOfInterference

Return
-------
None

Description
-----------
Creates an iterator on the curves on surface described by the interferences in <l>.
") TopOpeBRepDS_CurveIterator;
		 TopOpeBRepDS_CurveIterator(const TopOpeBRepDS_ListOfInterference & L);

		/****************** Current ******************/
		/**** md5 signature: a56c202295a85f5f102575dc8279e0d7 ****/
		%feature("compactdefaultargs") Current;
		%feature("autodoc", "Return
-------
int

Description
-----------
Index of the curve in the data structure.
") Current;
		Standard_Integer Current();

		/****************** MatchInterference ******************/
		/**** md5 signature: 65853f9699421547bf44f4ac95967e30 ****/
		%feature("compactdefaultargs") MatchInterference;
		%feature("autodoc", "
Parameters
----------
I: TopOpeBRepDS_Interference

Return
-------
bool

Description
-----------
Returns true if the interference <i> has a geometrytype() topopebrepds_curve returns false else.
") MatchInterference;
		virtual Standard_Boolean MatchInterference(const opencascade::handle<TopOpeBRepDS_Interference> & I);

		/****************** Orientation ******************/
		/**** md5 signature: 2b25381a7db220c2390cfe75dd2cf1f5 ****/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "
Parameters
----------
S: TopAbs_State

Return
-------
TopAbs_Orientation

Description
-----------
No available documentation.
") Orientation;
		TopAbs_Orientation Orientation(const TopAbs_State S);

		/****************** PCurve ******************/
		/**** md5 signature: 8293ea8e22edce20d70506232b818ed1 ****/
		%feature("compactdefaultargs") PCurve;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom2d_Curve>

Description
-----------
No available documentation.
") PCurve;
		const opencascade::handle<Geom2d_Curve> & PCurve();

};


%extend TopOpeBRepDS_CurveIterator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************************
* class TopOpeBRepDS_CurvePointInterference *
********************************************/
class TopOpeBRepDS_CurvePointInterference : public TopOpeBRepDS_Interference {
	public:
		/****************** TopOpeBRepDS_CurvePointInterference ******************/
		/**** md5 signature: adf2a0972e67d37f0217c48b28206e04 ****/
		%feature("compactdefaultargs") TopOpeBRepDS_CurvePointInterference;
		%feature("autodoc", "
Parameters
----------
T: TopOpeBRepDS_Transition
ST: TopOpeBRepDS_Kind
S: int
GT: TopOpeBRepDS_Kind
G: int
P: float

Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepDS_CurvePointInterference;
		 TopOpeBRepDS_CurvePointInterference(const TopOpeBRepDS_Transition & T, const TopOpeBRepDS_Kind ST, const Standard_Integer S, const TopOpeBRepDS_Kind GT, const Standard_Integer G, const Standard_Real P);

		/****************** Parameter ******************/
		/**** md5 signature: ecccdeaeaa0deed24f47e61ad75d24f1 ****/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") Parameter;
		Standard_Real Parameter();

		/****************** Parameter ******************/
		/**** md5 signature: 26acaf0b4677a7a04af978de63424b8a ****/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "
Parameters
----------
P: float

Return
-------
None

Description
-----------
No available documentation.
") Parameter;
		void Parameter(const Standard_Real P);

};


%make_alias(TopOpeBRepDS_CurvePointInterference)

%extend TopOpeBRepDS_CurvePointInterference {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class TopOpeBRepDS_PointData *
*******************************/
class TopOpeBRepDS_PointData : public TopOpeBRepDS_GeometryData {
	public:
		/****************** TopOpeBRepDS_PointData ******************/
		/**** md5 signature: 427116425f2fb5005b5abf389c6f1fb3 ****/
		%feature("compactdefaultargs") TopOpeBRepDS_PointData;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepDS_PointData;
		 TopOpeBRepDS_PointData();

		/****************** TopOpeBRepDS_PointData ******************/
		/**** md5 signature: 101135fde8c14adfac00bc7a7fbc030f ****/
		%feature("compactdefaultargs") TopOpeBRepDS_PointData;
		%feature("autodoc", "
Parameters
----------
P: TopOpeBRepDS_Point

Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepDS_PointData;
		 TopOpeBRepDS_PointData(const TopOpeBRepDS_Point & P);

		/****************** TopOpeBRepDS_PointData ******************/
		/**** md5 signature: 6f9f1466981617ccc2049daa2802e3d1 ****/
		%feature("compactdefaultargs") TopOpeBRepDS_PointData;
		%feature("autodoc", "
Parameters
----------
P: TopOpeBRepDS_Point
I1: int
I2: int

Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepDS_PointData;
		 TopOpeBRepDS_PointData(const TopOpeBRepDS_Point & P, const Standard_Integer I1, const Standard_Integer I2);

		/****************** GetShapes ******************/
		/**** md5 signature: f83386b9050594750b3cbd4a9b328f40 ****/
		%feature("compactdefaultargs") GetShapes;
		%feature("autodoc", "
Parameters
----------

Return
-------
I1: int
I2: int

Description
-----------
No available documentation.
") GetShapes;
		void GetShapes(Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** SetShapes ******************/
		/**** md5 signature: 3595c3b14ebeb78e69fcff771910d717 ****/
		%feature("compactdefaultargs") SetShapes;
		%feature("autodoc", "
Parameters
----------
I1: int
I2: int

Return
-------
None

Description
-----------
No available documentation.
") SetShapes;
		void SetShapes(const Standard_Integer I1, const Standard_Integer I2);

};


%extend TopOpeBRepDS_PointData {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class TopOpeBRepDS_PointIterator *
***********************************/
class TopOpeBRepDS_PointIterator : public TopOpeBRepDS_InterferenceIterator {
	public:
		/****************** TopOpeBRepDS_PointIterator ******************/
		/**** md5 signature: 50786931fc02dcd3ee1645d646052bfc ****/
		%feature("compactdefaultargs") TopOpeBRepDS_PointIterator;
		%feature("autodoc", "
Parameters
----------
L: TopOpeBRepDS_ListOfInterference

Return
-------
None

Description
-----------
Creates an iterator on the points on curves described by the interferences in <l>.
") TopOpeBRepDS_PointIterator;
		 TopOpeBRepDS_PointIterator(const TopOpeBRepDS_ListOfInterference & L);

		/****************** Current ******************/
		/**** md5 signature: a56c202295a85f5f102575dc8279e0d7 ****/
		%feature("compactdefaultargs") Current;
		%feature("autodoc", "Return
-------
int

Description
-----------
Index of the point in the data structure.
") Current;
		Standard_Integer Current();

		/****************** DiffOriented ******************/
		/**** md5 signature: 466fb314d7b9e72be54b11041e5045a6 ****/
		%feature("compactdefaultargs") DiffOriented;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") DiffOriented;
		Standard_Boolean DiffOriented();

		/****************** IsPoint ******************/
		/**** md5 signature: 64dc7ed350d49695713d262fc8866a96 ****/
		%feature("compactdefaultargs") IsPoint;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsPoint;
		Standard_Boolean IsPoint();

		/****************** IsVertex ******************/
		/**** md5 signature: 7dbb6189450b7f2ae76146c6d5d6e875 ****/
		%feature("compactdefaultargs") IsVertex;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsVertex;
		Standard_Boolean IsVertex();

		/****************** MatchInterference ******************/
		/**** md5 signature: 65853f9699421547bf44f4ac95967e30 ****/
		%feature("compactdefaultargs") MatchInterference;
		%feature("autodoc", "
Parameters
----------
I: TopOpeBRepDS_Interference

Return
-------
bool

Description
-----------
Returns true if the interference <i> has a geometrytype() topopebrepds_point or topopebrepds_vertex returns false else.
") MatchInterference;
		virtual Standard_Boolean MatchInterference(const opencascade::handle<TopOpeBRepDS_Interference> & I);

		/****************** Orientation ******************/
		/**** md5 signature: 2b25381a7db220c2390cfe75dd2cf1f5 ****/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "
Parameters
----------
S: TopAbs_State

Return
-------
TopAbs_Orientation

Description
-----------
No available documentation.
") Orientation;
		TopAbs_Orientation Orientation(const TopAbs_State S);

		/****************** Parameter ******************/
		/**** md5 signature: ecccdeaeaa0deed24f47e61ad75d24f1 ****/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") Parameter;
		Standard_Real Parameter();

		/****************** SameOriented ******************/
		/**** md5 signature: 7ddd32a10a8f31f931586309eb2ef5bd ****/
		%feature("compactdefaultargs") SameOriented;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") SameOriented;
		Standard_Boolean SameOriented();

		/****************** Support ******************/
		/**** md5 signature: 7aa624728551f1bd526b097364323e6c ****/
		%feature("compactdefaultargs") Support;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Support;
		Standard_Integer Support();

};


%extend TopOpeBRepDS_PointIterator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************************
* class TopOpeBRepDS_ShapeShapeInterference *
********************************************/
class TopOpeBRepDS_ShapeShapeInterference : public TopOpeBRepDS_Interference {
	public:
		/****************** TopOpeBRepDS_ShapeShapeInterference ******************/
		/**** md5 signature: 8e2adb1114fe11559239180e94b3dd29 ****/
		%feature("compactdefaultargs") TopOpeBRepDS_ShapeShapeInterference;
		%feature("autodoc", "
Parameters
----------
T: TopOpeBRepDS_Transition
ST: TopOpeBRepDS_Kind
S: int
GT: TopOpeBRepDS_Kind
G: int
GBound: bool
C: TopOpeBRepDS_Config

Return
-------
None

Description
-----------
A shape interfers on shape <g> with shape <s>. examples: create a shapeshapeinterference describing: vertex v of edge e1 found on edge e2: st,s,gt,g = topopebrepds_edge,e2,topopebrepds_vertex,v //! create a shapeshapeinterference describing vertex v of edge e found on face f: st,s,gt,g = topopebrepds_face,f,topopebrepds_vertex,v //! <gbound> indicates if shape <g> is a bound of shape <s>. //! <scc>: unsh_geometry: <s> and <ancestor> have any types, <s> and <ancestor> don't share the same geometry same_oriented: <s> and <ancestor> have identical types, <s> and <ancestor> orientations are identical. diff_oriented: <s> and <ancestor> have identical types, <s> and <ancestor> orientations are different.
") TopOpeBRepDS_ShapeShapeInterference;
		 TopOpeBRepDS_ShapeShapeInterference(const TopOpeBRepDS_Transition & T, const TopOpeBRepDS_Kind ST, const Standard_Integer S, const TopOpeBRepDS_Kind GT, const Standard_Integer G, const Standard_Boolean GBound, const TopOpeBRepDS_Config C);

		/****************** Config ******************/
		/**** md5 signature: a2e2863b46aaef1bb776ec36ce222134 ****/
		%feature("compactdefaultargs") Config;
		%feature("autodoc", "Return
-------
TopOpeBRepDS_Config

Description
-----------
No available documentation.
") Config;
		TopOpeBRepDS_Config Config();

		/****************** GBound ******************/
		/**** md5 signature: 474bafe1cc0a3b14453ea14c11b4bbb5 ****/
		%feature("compactdefaultargs") GBound;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") GBound;
		Standard_Boolean GBound();

		/****************** SetGBound ******************/
		/**** md5 signature: d4bcfc295330ec37f4b72e3e05a87d19 ****/
		%feature("compactdefaultargs") SetGBound;
		%feature("autodoc", "
Parameters
----------
b: bool

Return
-------
None

Description
-----------
No available documentation.
") SetGBound;
		void SetGBound(const Standard_Boolean b);

};


%make_alias(TopOpeBRepDS_ShapeShapeInterference)

%extend TopOpeBRepDS_ShapeShapeInterference {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************************
* class TopOpeBRepDS_SolidSurfaceInterference *
**********************************************/
class TopOpeBRepDS_SolidSurfaceInterference : public TopOpeBRepDS_Interference {
	public:
		/****************** TopOpeBRepDS_SolidSurfaceInterference ******************/
		/**** md5 signature: 3f6ad256568b142d31e16390b222ab1c ****/
		%feature("compactdefaultargs") TopOpeBRepDS_SolidSurfaceInterference;
		%feature("autodoc", "
Parameters
----------
Transition: TopOpeBRepDS_Transition
SupportType: TopOpeBRepDS_Kind
Support: int
GeometryType: TopOpeBRepDS_Kind
Geometry: int

Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepDS_SolidSurfaceInterference;
		 TopOpeBRepDS_SolidSurfaceInterference(const TopOpeBRepDS_Transition & Transition, const TopOpeBRepDS_Kind SupportType, const Standard_Integer Support, const TopOpeBRepDS_Kind GeometryType, const Standard_Integer Geometry);

};


%make_alias(TopOpeBRepDS_SolidSurfaceInterference)

%extend TopOpeBRepDS_SolidSurfaceInterference {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************************
* class TopOpeBRepDS_SurfaceCurveInterference *
**********************************************/
class TopOpeBRepDS_SurfaceCurveInterference : public TopOpeBRepDS_Interference {
	public:
		/****************** TopOpeBRepDS_SurfaceCurveInterference ******************/
		/**** md5 signature: 55e9702d67f9198d4c87db9152ddfb7a ****/
		%feature("compactdefaultargs") TopOpeBRepDS_SurfaceCurveInterference;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepDS_SurfaceCurveInterference;
		 TopOpeBRepDS_SurfaceCurveInterference();

		/****************** TopOpeBRepDS_SurfaceCurveInterference ******************/
		/**** md5 signature: 1876a0c0b8a811e2c22fa5353edc53a7 ****/
		%feature("compactdefaultargs") TopOpeBRepDS_SurfaceCurveInterference;
		%feature("autodoc", "
Parameters
----------
Transition: TopOpeBRepDS_Transition
SupportType: TopOpeBRepDS_Kind
Support: int
GeometryType: TopOpeBRepDS_Kind
Geometry: int
PC: Geom2d_Curve

Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepDS_SurfaceCurveInterference;
		 TopOpeBRepDS_SurfaceCurveInterference(const TopOpeBRepDS_Transition & Transition, const TopOpeBRepDS_Kind SupportType, const Standard_Integer Support, const TopOpeBRepDS_Kind GeometryType, const Standard_Integer Geometry, const opencascade::handle<Geom2d_Curve> & PC);

		/****************** TopOpeBRepDS_SurfaceCurveInterference ******************/
		/**** md5 signature: 527fae42a771e52602c040083be3b2e2 ****/
		%feature("compactdefaultargs") TopOpeBRepDS_SurfaceCurveInterference;
		%feature("autodoc", "
Parameters
----------
I: TopOpeBRepDS_Interference

Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepDS_SurfaceCurveInterference;
		 TopOpeBRepDS_SurfaceCurveInterference(const opencascade::handle<TopOpeBRepDS_Interference> & I);

		/****************** PCurve ******************/
		/**** md5 signature: 8293ea8e22edce20d70506232b818ed1 ****/
		%feature("compactdefaultargs") PCurve;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom2d_Curve>

Description
-----------
No available documentation.
") PCurve;
		const opencascade::handle<Geom2d_Curve> & PCurve();

		/****************** PCurve ******************/
		/**** md5 signature: 2a9e7b35cdc30e1b3fe1aa52cdef828a ****/
		%feature("compactdefaultargs") PCurve;
		%feature("autodoc", "
Parameters
----------
PC: Geom2d_Curve

Return
-------
None

Description
-----------
No available documentation.
") PCurve;
		void PCurve(const opencascade::handle<Geom2d_Curve> & PC);

};


%make_alias(TopOpeBRepDS_SurfaceCurveInterference)

%extend TopOpeBRepDS_SurfaceCurveInterference {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class TopOpeBRepDS_SurfaceData *
*********************************/
class TopOpeBRepDS_SurfaceData : public TopOpeBRepDS_GeometryData {
	public:
		/****************** TopOpeBRepDS_SurfaceData ******************/
		/**** md5 signature: a69a6481affab57d7137c19f989d9b4e ****/
		%feature("compactdefaultargs") TopOpeBRepDS_SurfaceData;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepDS_SurfaceData;
		 TopOpeBRepDS_SurfaceData();

		/****************** TopOpeBRepDS_SurfaceData ******************/
		/**** md5 signature: 0f87db337a7f4a4afd8227cbded7271a ****/
		%feature("compactdefaultargs") TopOpeBRepDS_SurfaceData;
		%feature("autodoc", "
Parameters
----------
S: TopOpeBRepDS_Surface

Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepDS_SurfaceData;
		 TopOpeBRepDS_SurfaceData(const TopOpeBRepDS_Surface & S);

};


%extend TopOpeBRepDS_SurfaceData {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************
* class TopOpeBRepDS_SurfaceIterator *
*************************************/
class TopOpeBRepDS_SurfaceIterator : public TopOpeBRepDS_InterferenceIterator {
	public:
		/****************** TopOpeBRepDS_SurfaceIterator ******************/
		/**** md5 signature: f6e295c0d345024c535856fa6a3bf4a3 ****/
		%feature("compactdefaultargs") TopOpeBRepDS_SurfaceIterator;
		%feature("autodoc", "
Parameters
----------
L: TopOpeBRepDS_ListOfInterference

Return
-------
None

Description
-----------
Creates an iterator on the surfaces on solid described by the interferences in <l>.
") TopOpeBRepDS_SurfaceIterator;
		 TopOpeBRepDS_SurfaceIterator(const TopOpeBRepDS_ListOfInterference & L);

		/****************** Current ******************/
		/**** md5 signature: a56c202295a85f5f102575dc8279e0d7 ****/
		%feature("compactdefaultargs") Current;
		%feature("autodoc", "Return
-------
int

Description
-----------
Index of the surface in the data structure.
") Current;
		Standard_Integer Current();

		/****************** Orientation ******************/
		/**** md5 signature: 2b25381a7db220c2390cfe75dd2cf1f5 ****/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "
Parameters
----------
S: TopAbs_State

Return
-------
TopAbs_Orientation

Description
-----------
No available documentation.
") Orientation;
		TopAbs_Orientation Orientation(const TopAbs_State S);

};


%extend TopOpeBRepDS_SurfaceIterator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************************
* class TopOpeBRepDS_EdgeVertexInterference *
********************************************/
class TopOpeBRepDS_EdgeVertexInterference : public TopOpeBRepDS_ShapeShapeInterference {
	public:
		/****************** TopOpeBRepDS_EdgeVertexInterference ******************/
		/**** md5 signature: ba596e70e44bb7010c9ba4d1c9a7a43e ****/
		%feature("compactdefaultargs") TopOpeBRepDS_EdgeVertexInterference;
		%feature("autodoc", "
Parameters
----------
T: TopOpeBRepDS_Transition
ST: TopOpeBRepDS_Kind
S: int
G: int
GIsBound: bool
C: TopOpeBRepDS_Config
P: float

Return
-------
None

Description
-----------
Create an interference of vertex <g> on a crossed edge e. //! if support type <st> == edge: <s> is edge e face: <s> is the face with bound e. <t> is the transition along the edge, crossing the crossed edge. e is the crossed edge. <gisbound> indicates if <g> is a bound of the edge. <p> is the parameter of <g> on the edge. //! interference is stored in the list of interfs of the edge.
") TopOpeBRepDS_EdgeVertexInterference;
		 TopOpeBRepDS_EdgeVertexInterference(const TopOpeBRepDS_Transition & T, const TopOpeBRepDS_Kind ST, const Standard_Integer S, const Standard_Integer G, const Standard_Boolean GIsBound, const TopOpeBRepDS_Config C, const Standard_Real P);

		/****************** TopOpeBRepDS_EdgeVertexInterference ******************/
		/**** md5 signature: 3f20aa74eb9e0a4458bdc25bc6cee5b5 ****/
		%feature("compactdefaultargs") TopOpeBRepDS_EdgeVertexInterference;
		%feature("autodoc", "
Parameters
----------
T: TopOpeBRepDS_Transition
S: int
G: int
GIsBound: bool
C: TopOpeBRepDS_Config
P: float

Return
-------
None

Description
-----------
Create an interference of vertex <g> on crossed edge <s>. //! <t> is the transition along the edge, crossing the crossed edge. <s> is the crossed edge. <gisbound> indicates if <g> is a bound of the edge. <c> indicates the geometric configuration between the edge and the crossed edge. <p> is the parameter of <g> on the edge. //! interference is stored in the list of interfs of the edge.
") TopOpeBRepDS_EdgeVertexInterference;
		 TopOpeBRepDS_EdgeVertexInterference(const TopOpeBRepDS_Transition & T, const Standard_Integer S, const Standard_Integer G, const Standard_Boolean GIsBound, const TopOpeBRepDS_Config C, const Standard_Real P);

		/****************** Parameter ******************/
		/**** md5 signature: ecccdeaeaa0deed24f47e61ad75d24f1 ****/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") Parameter;
		Standard_Real Parameter();

		/****************** Parameter ******************/
		/**** md5 signature: 26acaf0b4677a7a04af978de63424b8a ****/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "
Parameters
----------
P: float

Return
-------
None

Description
-----------
No available documentation.
") Parameter;
		void Parameter(const Standard_Real P);

};


%make_alias(TopOpeBRepDS_EdgeVertexInterference)

%extend TopOpeBRepDS_EdgeVertexInterference {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************
* class TopOpeBRepDS_FaceEdgeInterference *
******************************************/
class TopOpeBRepDS_FaceEdgeInterference : public TopOpeBRepDS_ShapeShapeInterference {
	public:
		/****************** TopOpeBRepDS_FaceEdgeInterference ******************/
		/**** md5 signature: 179b7fd57a29ac2f03aa9151c52b6da4 ****/
		%feature("compactdefaultargs") TopOpeBRepDS_FaceEdgeInterference;
		%feature("autodoc", "
Parameters
----------
T: TopOpeBRepDS_Transition
S: int
G: int
GIsBound: bool
C: TopOpeBRepDS_Config

Return
-------
None

Description
-----------
Create an interference of edge <g> on face <s>.
") TopOpeBRepDS_FaceEdgeInterference;
		 TopOpeBRepDS_FaceEdgeInterference(const TopOpeBRepDS_Transition & T, const Standard_Integer S, const Standard_Integer G, const Standard_Boolean GIsBound, const TopOpeBRepDS_Config C);

};


%make_alias(TopOpeBRepDS_FaceEdgeInterference)

%extend TopOpeBRepDS_FaceEdgeInterference {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* python proxy for excluded classes */
%pythoncode {
@classnotwrapped
class TopOpeBRepDS_DSS:
	pass

@classnotwrapped
class TopOpeBRepDS_HDataStructure:
	pass

}
/* end python proxy for excluded classes */
/* harray1 classes */

class TopOpeBRepDS_HArray1OfDataMapOfIntegerListOfInterference : public TopOpeBRepDS_Array1OfDataMapOfIntegerListOfInterference, public Standard_Transient {
  public:
    TopOpeBRepDS_HArray1OfDataMapOfIntegerListOfInterference(const Standard_Integer theLower, const Standard_Integer theUpper);
    TopOpeBRepDS_HArray1OfDataMapOfIntegerListOfInterference(const Standard_Integer theLower, const Standard_Integer theUpper, const TopOpeBRepDS_Array1OfDataMapOfIntegerListOfInterference::value_type& theValue);
    TopOpeBRepDS_HArray1OfDataMapOfIntegerListOfInterference(const TopOpeBRepDS_Array1OfDataMapOfIntegerListOfInterference& theOther);
    const TopOpeBRepDS_Array1OfDataMapOfIntegerListOfInterference& Array1();
    TopOpeBRepDS_Array1OfDataMapOfIntegerListOfInterference& ChangeArray1();
};
%make_alias(TopOpeBRepDS_HArray1OfDataMapOfIntegerListOfInterference)

/* harray2 classes */
/* hsequence classes */
/* class aliases */
%pythoncode {
}
/* deprecated methods */
%pythoncode {
@deprecated
def topopebrepds_IsGeometry(*args):
	return topopebrepds.IsGeometry(*args)

@deprecated
def topopebrepds_IsTopology(*args):
	return topopebrepds.IsTopology(*args)

@deprecated
def topopebrepds_KindToShape(*args):
	return topopebrepds.KindToShape(*args)

@deprecated
def topopebrepds_Print(*args):
	return topopebrepds.Print(*args)

@deprecated
def topopebrepds_Print(*args):
	return topopebrepds.Print(*args)

@deprecated
def topopebrepds_Print(*args):
	return topopebrepds.Print(*args)

@deprecated
def topopebrepds_Print(*args):
	return topopebrepds.Print(*args)

@deprecated
def topopebrepds_Print(*args):
	return topopebrepds.Print(*args)

@deprecated
def topopebrepds_SPrint(*args):
	return topopebrepds.SPrint(*args)

@deprecated
def topopebrepds_SPrint(*args):
	return topopebrepds.SPrint(*args)

@deprecated
def topopebrepds_SPrint(*args):
	return topopebrepds.SPrint(*args)

@deprecated
def topopebrepds_SPrint(*args):
	return topopebrepds.SPrint(*args)

@deprecated
def topopebrepds_SPrint(*args):
	return topopebrepds.SPrint(*args)

@deprecated
def topopebrepds_SPrint(*args):
	return topopebrepds.SPrint(*args)

@deprecated
def topopebrepds_SPrint(*args):
	return topopebrepds.SPrint(*args)

@deprecated
def topopebrepds_ShapeToKind(*args):
	return topopebrepds.ShapeToKind(*args)

@deprecated
def TopOpeBRepDS_InterferenceTool_DuplicateCurvePointInterference(*args):
	return TopOpeBRepDS_InterferenceTool.DuplicateCurvePointInterference(*args)

@deprecated
def TopOpeBRepDS_InterferenceTool_MakeCurveInterference(*args):
	return TopOpeBRepDS_InterferenceTool.MakeCurveInterference(*args)

@deprecated
def TopOpeBRepDS_InterferenceTool_MakeEdgeInterference(*args):
	return TopOpeBRepDS_InterferenceTool.MakeEdgeInterference(*args)

@deprecated
def TopOpeBRepDS_InterferenceTool_MakeEdgeVertexInterference(*args):
	return TopOpeBRepDS_InterferenceTool.MakeEdgeVertexInterference(*args)

@deprecated
def TopOpeBRepDS_InterferenceTool_MakeFaceCurveInterference(*args):
	return TopOpeBRepDS_InterferenceTool.MakeFaceCurveInterference(*args)

@deprecated
def TopOpeBRepDS_InterferenceTool_MakeFaceEdgeInterference(*args):
	return TopOpeBRepDS_InterferenceTool.MakeFaceEdgeInterference(*args)

@deprecated
def TopOpeBRepDS_InterferenceTool_MakeSolidSurfaceInterference(*args):
	return TopOpeBRepDS_InterferenceTool.MakeSolidSurfaceInterference(*args)

@deprecated
def TopOpeBRepDS_InterferenceTool_Parameter(*args):
	return TopOpeBRepDS_InterferenceTool.Parameter(*args)

@deprecated
def TopOpeBRepDS_InterferenceTool_Parameter(*args):
	return TopOpeBRepDS_InterferenceTool.Parameter(*args)

@deprecated
def TopOpeBRepDS_TOOL_EShareG(*args):
	return TopOpeBRepDS_TOOL.EShareG(*args)

@deprecated
def TopOpeBRepDS_TOOL_GetConfig(*args):
	return TopOpeBRepDS_TOOL.GetConfig(*args)

@deprecated
def TopOpeBRepDS_TOOL_GetEsd(*args):
	return TopOpeBRepDS_TOOL.GetEsd(*args)

@deprecated
def TopOpeBRepDS_TOOL_ShareG(*args):
	return TopOpeBRepDS_TOOL.ShareG(*args)

@deprecated
def TopOpeBRepDS_TOOL_ShareSplitON(*args):
	return TopOpeBRepDS_TOOL.ShareSplitON(*args)

}
