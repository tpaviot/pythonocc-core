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
%define TOPOPEBREPDSDOCSTRING
"TopOpeBRepDS module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_topopebrepds.html"
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
%include ../common/Operators.i
%include ../common/OccHandle.i


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
enum TopOpeBRepDS_Config {
	TopOpeBRepDS_UNSHGEOMETRY = 0,
	TopOpeBRepDS_SAMEORIENTED = 1,
	TopOpeBRepDS_DIFFORIENTED = 2,
};

enum TopOpeBRepDS_CheckStatus {
	TopOpeBRepDS_OK = 0,
	TopOpeBRepDS_NOK = 1,
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

/* python proy classes for enums */
%pythoncode {

class TopOpeBRepDS_Config(IntEnum):
	TopOpeBRepDS_UNSHGEOMETRY = 0
	TopOpeBRepDS_SAMEORIENTED = 1
	TopOpeBRepDS_DIFFORIENTED = 2
TopOpeBRepDS_UNSHGEOMETRY = TopOpeBRepDS_Config.TopOpeBRepDS_UNSHGEOMETRY
TopOpeBRepDS_SAMEORIENTED = TopOpeBRepDS_Config.TopOpeBRepDS_SAMEORIENTED
TopOpeBRepDS_DIFFORIENTED = TopOpeBRepDS_Config.TopOpeBRepDS_DIFFORIENTED

class TopOpeBRepDS_CheckStatus(IntEnum):
	TopOpeBRepDS_OK = 0
	TopOpeBRepDS_NOK = 1
TopOpeBRepDS_OK = TopOpeBRepDS_CheckStatus.TopOpeBRepDS_OK
TopOpeBRepDS_NOK = TopOpeBRepDS_CheckStatus.TopOpeBRepDS_NOK

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
%template(TopOpeBRepDS_Array1OfDataMapOfIntegerListOfInterference) NCollection_Array1<TopOpeBRepDS_DataMapOfIntegerListOfInterference>;

%extend NCollection_Array1<TopOpeBRepDS_DataMapOfIntegerListOfInterference> {
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
%template(TopOpeBRepDS_DataMapOfCheckStatus) NCollection_DataMap<Standard_Integer,TopOpeBRepDS_CheckStatus,TColStd_MapIntegerHasher>;

%extend NCollection_DataMap<Standard_Integer,TopOpeBRepDS_CheckStatus,TColStd_MapIntegerHasher> {
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
%template(TopOpeBRepDS_DataMapOfIntegerListOfInterference) NCollection_DataMap<Standard_Integer,TopOpeBRepDS_ListOfInterference,TColStd_MapIntegerHasher>;

%extend NCollection_DataMap<Standard_Integer,TopOpeBRepDS_ListOfInterference,TColStd_MapIntegerHasher> {
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
%template(TopOpeBRepDS_DataMapOfInterferenceListOfInterference) NCollection_DataMap<opencascade::handle<TopOpeBRepDS_Interference>,TopOpeBRepDS_ListOfInterference,TColStd_MapTransientHasher>;
%template(TopOpeBRepDS_DataMapOfInterferenceShape) NCollection_DataMap<opencascade::handle<TopOpeBRepDS_Interference>,TopoDS_Shape,TColStd_MapTransientHasher>;
%template(TopOpeBRepDS_DataMapOfShapeListOfShapeOn1State) NCollection_DataMap<TopoDS_Shape,TopOpeBRepDS_ListOfShapeOn1State,TopTools_ShapeMapHasher>;
%template(TopOpeBRepDS_DataMapOfShapeState) NCollection_DataMap<TopoDS_Shape,TopAbs_State,TopTools_ShapeMapHasher>;
%template(TopOpeBRepDS_DoubleMapOfIntegerShape) NCollection_DoubleMap<Standard_Integer,TopoDS_Shape,TColStd_MapIntegerHasher,TopTools_ShapeMapHasher>;
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
%template(TopOpeBRepDS_MapOfCurve) NCollection_DataMap<Standard_Integer,TopOpeBRepDS_CurveData,TColStd_MapIntegerHasher>;

%extend NCollection_DataMap<Standard_Integer,TopOpeBRepDS_CurveData,TColStd_MapIntegerHasher> {
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
%template(TopOpeBRepDS_MapOfIntegerShapeData) NCollection_DataMap<Standard_Integer,TopOpeBRepDS_ShapeData,TColStd_MapIntegerHasher>;

%extend NCollection_DataMap<Standard_Integer,TopOpeBRepDS_ShapeData,TColStd_MapIntegerHasher> {
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
%template(TopOpeBRepDS_MapOfPoint) NCollection_DataMap<Standard_Integer,TopOpeBRepDS_PointData,TColStd_MapIntegerHasher>;

%extend NCollection_DataMap<Standard_Integer,TopOpeBRepDS_PointData,TColStd_MapIntegerHasher> {
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
%template(TopOpeBRepDS_MapOfSurface) NCollection_DataMap<Standard_Integer,TopOpeBRepDS_SurfaceData,TColStd_MapIntegerHasher>;

%extend NCollection_DataMap<Standard_Integer,TopOpeBRepDS_SurfaceData,TColStd_MapIntegerHasher> {
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
typedef NCollection_DataMap<Standard_Integer, TopOpeBRepDS_CheckStatus, TColStd_MapIntegerHasher>::Iterator TopOpeBRepDS_DataMapIteratorOfDataMapOfCheckStatus;
typedef NCollection_DataMap<Standard_Integer, TopOpeBRepDS_ListOfInterference, TColStd_MapIntegerHasher>::Iterator TopOpeBRepDS_DataMapIteratorOfDataMapOfIntegerListOfInterference;
typedef NCollection_DataMap<opencascade::handle<TopOpeBRepDS_Interference>, TopOpeBRepDS_ListOfInterference, TColStd_MapTransientHasher>::Iterator TopOpeBRepDS_DataMapIteratorOfDataMapOfInterferenceListOfInterference;
typedef NCollection_DataMap<opencascade::handle<TopOpeBRepDS_Interference>, TopoDS_Shape, TColStd_MapTransientHasher>::Iterator TopOpeBRepDS_DataMapIteratorOfDataMapOfInterferenceShape;
typedef NCollection_DataMap<TopoDS_Shape, TopOpeBRepDS_ListOfShapeOn1State, TopTools_ShapeMapHasher>::Iterator TopOpeBRepDS_DataMapIteratorOfDataMapOfShapeListOfShapeOn1State;
typedef NCollection_DataMap<TopoDS_Shape, TopAbs_State, TopTools_ShapeMapHasher>::Iterator TopOpeBRepDS_DataMapIteratorOfDataMapOfShapeState;
typedef NCollection_DataMap<Standard_Integer, TopOpeBRepDS_CurveData, TColStd_MapIntegerHasher>::Iterator TopOpeBRepDS_DataMapIteratorOfMapOfCurve;
typedef NCollection_DataMap<Standard_Integer, TopOpeBRepDS_ShapeData, TColStd_MapIntegerHasher>::Iterator TopOpeBRepDS_DataMapIteratorOfMapOfIntegerShapeData;
typedef NCollection_DataMap<Standard_Integer, TopOpeBRepDS_PointData, TColStd_MapIntegerHasher>::Iterator TopOpeBRepDS_DataMapIteratorOfMapOfPoint;
typedef NCollection_DataMap<Standard_Integer, TopOpeBRepDS_SurfaceData, TColStd_MapIntegerHasher>::Iterator TopOpeBRepDS_DataMapIteratorOfMapOfSurface;
typedef NCollection_DataMap<TopoDS_Shape, opencascade::handle<Geom_Surface>, TopTools_ShapeMapHasher>::Iterator TopOpeBRepDS_DataMapIteratorOfShapeSurface;
typedef NCollection_DataMap<Standard_Integer, TopOpeBRepDS_CheckStatus, TColStd_MapIntegerHasher> TopOpeBRepDS_DataMapOfCheckStatus;
typedef NCollection_DataMap<Standard_Integer, TopOpeBRepDS_ListOfInterference, TColStd_MapIntegerHasher> TopOpeBRepDS_DataMapOfIntegerListOfInterference;
typedef NCollection_DataMap<opencascade::handle<TopOpeBRepDS_Interference>, TopOpeBRepDS_ListOfInterference, TColStd_MapTransientHasher> TopOpeBRepDS_DataMapOfInterferenceListOfInterference;
typedef NCollection_DataMap<opencascade::handle<TopOpeBRepDS_Interference>, TopoDS_Shape, TColStd_MapTransientHasher> TopOpeBRepDS_DataMapOfInterferenceShape;
typedef NCollection_DataMap<TopoDS_Shape, TopOpeBRepDS_ListOfShapeOn1State, TopTools_ShapeMapHasher> TopOpeBRepDS_DataMapOfShapeListOfShapeOn1State;
typedef NCollection_DataMap<TopoDS_Shape, TopAbs_State, TopTools_ShapeMapHasher> TopOpeBRepDS_DataMapOfShapeState;
typedef NCollection_DoubleMap<Standard_Integer, TopoDS_Shape, TColStd_MapIntegerHasher, TopTools_ShapeMapHasher>::Iterator TopOpeBRepDS_DoubleMapIteratorOfDoubleMapOfIntegerShape;
typedef NCollection_DoubleMap<Standard_Integer, TopoDS_Shape, TColStd_MapIntegerHasher, TopTools_ShapeMapHasher> TopOpeBRepDS_DoubleMapOfIntegerShape;
typedef NCollection_IndexedDataMap<TopoDS_Shape, TopOpeBRepDS_ShapeWithState, TopTools_ShapeMapHasher> TopOpeBRepDS_IndexedDataMapOfShapeWithState;
typedef NCollection_IndexedDataMap<TopoDS_Shape, TopOpeBRepDS_Point, TopTools_ShapeMapHasher> TopOpeBRepDS_IndexedDataMapOfVertexPoint;
typedef NCollection_List<opencascade::handle<TopOpeBRepDS_Interference>>::Iterator TopOpeBRepDS_ListIteratorOfListOfInterference;
typedef NCollection_List<opencascade::handle<TopOpeBRepDS_Interference>> TopOpeBRepDS_ListOfInterference;
typedef NCollection_DataMap<Standard_Integer, TopOpeBRepDS_CurveData, TColStd_MapIntegerHasher> TopOpeBRepDS_MapOfCurve;
typedef NCollection_DataMap<Standard_Integer, TopOpeBRepDS_ShapeData, TColStd_MapIntegerHasher> TopOpeBRepDS_MapOfIntegerShapeData;
typedef NCollection_DataMap<Standard_Integer, TopOpeBRepDS_PointData, TColStd_MapIntegerHasher> TopOpeBRepDS_MapOfPoint;
typedef NCollection_IndexedDataMap<TopoDS_Shape, TopOpeBRepDS_ShapeData, TopTools_ShapeMapHasher> TopOpeBRepDS_MapOfShapeData;
typedef NCollection_DataMap<Standard_Integer, TopOpeBRepDS_SurfaceData, TColStd_MapIntegerHasher> TopOpeBRepDS_MapOfSurface;
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
		%feature("autodoc", "No available documentation.

Parameters
----------
K: TopOpeBRepDS_Kind

Returns
-------
bool
") IsGeometry;
		static Standard_Boolean IsGeometry(const TopOpeBRepDS_Kind K);

		/****************** IsTopology ******************/
		/**** md5 signature: cfdfdf915ba934546693fb38ce9166d5 ****/
		%feature("compactdefaultargs") IsTopology;
		%feature("autodoc", "No available documentation.

Parameters
----------
K: TopOpeBRepDS_Kind

Returns
-------
bool
") IsTopology;
		static Standard_Boolean IsTopology(const TopOpeBRepDS_Kind K);

		/****************** KindToShape ******************/
		/**** md5 signature: 4f93bc69579bee1b877edfea8f0ccbd9 ****/
		%feature("compactdefaultargs") KindToShape;
		%feature("autodoc", "No available documentation.

Parameters
----------
K: TopOpeBRepDS_Kind

Returns
-------
TopAbs_ShapeEnum
") KindToShape;
		static TopAbs_ShapeEnum KindToShape(const TopOpeBRepDS_Kind K);

		/****************** SPrint ******************/
		/**** md5 signature: 8e8bd1974589e4b4a60a8ae1d385d1b2 ****/
		%feature("compactdefaultargs") SPrint;
		%feature("autodoc", "In ou on un.

Parameters
----------
S: TopAbs_State

Returns
-------
TCollection_AsciiString
") SPrint;
		static TCollection_AsciiString SPrint(const TopAbs_State S);

		/****************** SPrint ******************/
		/**** md5 signature: 968197e24095559e9b74f828c6becff7 ****/
		%feature("compactdefaultargs") SPrint;
		%feature("autodoc", "<k>.

Parameters
----------
K: TopOpeBRepDS_Kind

Returns
-------
TCollection_AsciiString
") SPrint;
		static TCollection_AsciiString SPrint(const TopOpeBRepDS_Kind K);

		/****************** SPrint ******************/
		/**** md5 signature: b21c57041921895593da7320e6faa822 ****/
		%feature("compactdefaultargs") SPrint;
		%feature("autodoc", "S1(<k>,<i>)s2.

Parameters
----------
K: TopOpeBRepDS_Kind
I: int
B: TCollection_AsciiString,optional
	default value is ""
A: TCollection_AsciiString,optional
	default value is ""

Returns
-------
TCollection_AsciiString
") SPrint;
		static TCollection_AsciiString SPrint(const TopOpeBRepDS_Kind K, const Standard_Integer I, const TCollection_AsciiString & B = "", const TCollection_AsciiString & A = "");

		/****************** SPrint ******************/
		/**** md5 signature: bfdba83544259d7a60db9ed56c313822 ****/
		%feature("compactdefaultargs") SPrint;
		%feature("autodoc", "No available documentation.

Parameters
----------
T: TopAbs_ShapeEnum

Returns
-------
TCollection_AsciiString
") SPrint;
		static TCollection_AsciiString SPrint(const TopAbs_ShapeEnum T);

		/****************** SPrint ******************/
		/**** md5 signature: 97f7d073e84efbd0be15cd8afad13777 ****/
		%feature("compactdefaultargs") SPrint;
		%feature("autodoc", "(<t>,<i>).

Parameters
----------
T: TopAbs_ShapeEnum
I: int

Returns
-------
TCollection_AsciiString
") SPrint;
		static TCollection_AsciiString SPrint(const TopAbs_ShapeEnum T, const Standard_Integer I);

		/****************** SPrint ******************/
		/**** md5 signature: b2e9c40b17d2064b1d342271b06bfc31 ****/
		%feature("compactdefaultargs") SPrint;
		%feature("autodoc", "No available documentation.

Parameters
----------
O: TopAbs_Orientation

Returns
-------
TCollection_AsciiString
") SPrint;
		static TCollection_AsciiString SPrint(const TopAbs_Orientation O);

		/****************** SPrint ******************/
		/**** md5 signature: a74f48fc6ca5d45de42930d3b22fca1f ****/
		%feature("compactdefaultargs") SPrint;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: TopOpeBRepDS_Config

Returns
-------
TCollection_AsciiString
") SPrint;
		static TCollection_AsciiString SPrint(const TopOpeBRepDS_Config C);

		/****************** ShapeToKind ******************/
		/**** md5 signature: 26c9c1a2dce5b1a31a4637d999319989 ****/
		%feature("compactdefaultargs") ShapeToKind;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopAbs_ShapeEnum

Returns
-------
TopOpeBRepDS_Kind
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
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopOpeBRepDS_Association;
		 TopOpeBRepDS_Association();

		/****************** AreAssociated ******************/
		/**** md5 signature: 4a754e21e44b132fa50843d27ed967f9 ****/
		%feature("compactdefaultargs") AreAssociated;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: TopOpeBRepDS_Interference
K: TopOpeBRepDS_Interference

Returns
-------
bool
") AreAssociated;
		Standard_Boolean AreAssociated(const opencascade::handle<TopOpeBRepDS_Interference> & I, const opencascade::handle<TopOpeBRepDS_Interference> & K);

		/****************** Associate ******************/
		/**** md5 signature: de02326dc5a740c1244a4872cd74bc4e ****/
		%feature("compactdefaultargs") Associate;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: TopOpeBRepDS_Interference
K: TopOpeBRepDS_Interference

Returns
-------
None
") Associate;
		void Associate(const opencascade::handle<TopOpeBRepDS_Interference> & I, const opencascade::handle<TopOpeBRepDS_Interference> & K);

		/****************** Associate ******************/
		/**** md5 signature: ddadbf71778dfb11dc9a17555bea8682 ****/
		%feature("compactdefaultargs") Associate;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: TopOpeBRepDS_Interference
LI: TopOpeBRepDS_ListOfInterference

Returns
-------
None
") Associate;
		void Associate(const opencascade::handle<TopOpeBRepDS_Interference> & I, const TopOpeBRepDS_ListOfInterference & LI);

		/****************** Associated ******************/
		/**** md5 signature: 9ac2e79662be6672ebdb208f9c40ead4 ****/
		%feature("compactdefaultargs") Associated;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: TopOpeBRepDS_Interference

Returns
-------
TopOpeBRepDS_ListOfInterference
") Associated;
		TopOpeBRepDS_ListOfInterference & Associated(const opencascade::handle<TopOpeBRepDS_Interference> & I);

		/****************** HasAssociation ******************/
		/**** md5 signature: ba92e7cf09f82761c90ea4da8e4203d8 ****/
		%feature("compactdefaultargs") HasAssociation;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: TopOpeBRepDS_Interference

Returns
-------
bool
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
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopOpeBRepDS_BuildTool;
		 TopOpeBRepDS_BuildTool();

		/****************** TopOpeBRepDS_BuildTool ******************/
		/**** md5 signature: 00739303cea300cc817a756deadf1b49 ****/
		%feature("compactdefaultargs") TopOpeBRepDS_BuildTool;
		%feature("autodoc", "No available documentation.

Parameters
----------
OutCurveType: TopOpeBRepTool_OutCurveType

Returns
-------
None
") TopOpeBRepDS_BuildTool;
		 TopOpeBRepDS_BuildTool(const TopOpeBRepTool_OutCurveType OutCurveType);

		/****************** TopOpeBRepDS_BuildTool ******************/
		/**** md5 signature: 0da06c51a0249b2dd4b9ce17d186f195 ****/
		%feature("compactdefaultargs") TopOpeBRepDS_BuildTool;
		%feature("autodoc", "No available documentation.

Parameters
----------
GT: TopOpeBRepTool_GeomTool

Returns
-------
None
") TopOpeBRepDS_BuildTool;
		 TopOpeBRepDS_BuildTool(const TopOpeBRepTool_GeomTool & GT);

		/****************** AddEdgeVertex ******************/
		/**** md5 signature: 58bb2ee5393762c0e8e49f8a433e277c ****/
		%feature("compactdefaultargs") AddEdgeVertex;
		%feature("autodoc", "No available documentation.

Parameters
----------
Ein: TopoDS_Shape
Eou: TopoDS_Shape
V: TopoDS_Shape

Returns
-------
None
") AddEdgeVertex;
		void AddEdgeVertex(const TopoDS_Shape & Ein, TopoDS_Shape & Eou, const TopoDS_Shape & V);

		/****************** AddEdgeVertex ******************/
		/**** md5 signature: d3cefa98d80572093c05bdff4359c470 ****/
		%feature("compactdefaultargs") AddEdgeVertex;
		%feature("autodoc", "No available documentation.

Parameters
----------
E: TopoDS_Shape
V: TopoDS_Shape

Returns
-------
None
") AddEdgeVertex;
		void AddEdgeVertex(TopoDS_Shape & E, const TopoDS_Shape & V);

		/****************** AddFaceWire ******************/
		/**** md5 signature: 61e37223c866465cbdca424e9367353d ****/
		%feature("compactdefaultargs") AddFaceWire;
		%feature("autodoc", "No available documentation.

Parameters
----------
F: TopoDS_Shape
W: TopoDS_Shape

Returns
-------
None
") AddFaceWire;
		void AddFaceWire(TopoDS_Shape & F, const TopoDS_Shape & W);

		/****************** AddShellFace ******************/
		/**** md5 signature: e6cdc0d1e33dc9ca784cbb32e551a598 ****/
		%feature("compactdefaultargs") AddShellFace;
		%feature("autodoc", "No available documentation.

Parameters
----------
Sh: TopoDS_Shape
F: TopoDS_Shape

Returns
-------
None
") AddShellFace;
		void AddShellFace(TopoDS_Shape & Sh, const TopoDS_Shape & F);

		/****************** AddSolidShell ******************/
		/**** md5 signature: c13854a2554d2626024d2177860b77ef ****/
		%feature("compactdefaultargs") AddSolidShell;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape
Sh: TopoDS_Shape

Returns
-------
None
") AddSolidShell;
		void AddSolidShell(TopoDS_Shape & S, const TopoDS_Shape & Sh);

		/****************** AddWireEdge ******************/
		/**** md5 signature: d6a19f1fd9bc39f9a24a491f29232199 ****/
		%feature("compactdefaultargs") AddWireEdge;
		%feature("autodoc", "No available documentation.

Parameters
----------
W: TopoDS_Shape
E: TopoDS_Shape

Returns
-------
None
") AddWireEdge;
		void AddWireEdge(TopoDS_Shape & W, const TopoDS_Shape & E);

		/****************** ApproxCurves ******************/
		/**** md5 signature: 5a40deaa5f89cd7a7ffdabb637762813 ****/
		%feature("compactdefaultargs") ApproxCurves;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: TopOpeBRepDS_Curve
E: TopoDS_Edge
HDS: TopOpeBRepDS_HDataStructure

Returns
-------
inewC: int
") ApproxCurves;
		void ApproxCurves(const TopOpeBRepDS_Curve & C, TopoDS_Edge & E, Standard_Integer &OutValue, const opencascade::handle<TopOpeBRepDS_HDataStructure> & HDS);

		/****************** Approximation ******************/
		/**** md5 signature: 8db59148951ab23443121333db4394c0 ****/
		%feature("compactdefaultargs") Approximation;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") Approximation;
		Standard_Boolean Approximation();

		/****************** ChangeGeomTool ******************/
		/**** md5 signature: ec177d99f76bb4ed7e436f53436adf03 ****/
		%feature("compactdefaultargs") ChangeGeomTool;
		%feature("autodoc", "No available documentation.

Returns
-------
TopOpeBRepTool_GeomTool
") ChangeGeomTool;
		TopOpeBRepTool_GeomTool & ChangeGeomTool();

		/****************** Closed ******************/
		/**** md5 signature: 82202c2c3ebbcceda8be892e8098526a ****/
		%feature("compactdefaultargs") Closed;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape
B: bool

Returns
-------
None
") Closed;
		void Closed(TopoDS_Shape & S, const Standard_Boolean B);

		/****************** ComputePCurves ******************/
		/**** md5 signature: cd0135f7e8be2cce26eee4970435a681 ****/
		%feature("compactdefaultargs") ComputePCurves;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: TopOpeBRepDS_Curve
E: TopoDS_Edge
newC: TopOpeBRepDS_Curve
CompPC1: bool
CompPC2: bool
CompC3D: bool

Returns
-------
None
") ComputePCurves;
		void ComputePCurves(const TopOpeBRepDS_Curve & C, TopoDS_Edge & E, TopOpeBRepDS_Curve & newC, const Standard_Boolean CompPC1, const Standard_Boolean CompPC2, const Standard_Boolean CompC3D);

		/****************** CopyEdge ******************/
		/**** md5 signature: 06d20ad51d28fd85815a9bc8a46a8a7c ****/
		%feature("compactdefaultargs") CopyEdge;
		%feature("autodoc", "Make an edge <eou> with the curve of the edge <ein>.

Parameters
----------
Ein: TopoDS_Shape
Eou: TopoDS_Shape

Returns
-------
None
") CopyEdge;
		void CopyEdge(const TopoDS_Shape & Ein, TopoDS_Shape & Eou);

		/****************** CopyFace ******************/
		/**** md5 signature: 977c888106a494a0a2f71cb77a551880 ****/
		%feature("compactdefaultargs") CopyFace;
		%feature("autodoc", "Make a face <fou> with the surface of the face <fin>.

Parameters
----------
Fin: TopoDS_Shape
Fou: TopoDS_Shape

Returns
-------
None
") CopyFace;
		void CopyFace(const TopoDS_Shape & Fin, TopoDS_Shape & Fou);

		/****************** Curve3D ******************/
		/**** md5 signature: 69d4a367443c8988c91467ed755a8c70 ****/
		%feature("compactdefaultargs") Curve3D;
		%feature("autodoc", "Sets the curve <c> for the edge <e>.

Parameters
----------
E: TopoDS_Shape
C: Geom_Curve
Tol: float

Returns
-------
None
") Curve3D;
		void Curve3D(TopoDS_Shape & E, const opencascade::handle<Geom_Curve> & C, const Standard_Real Tol);

		/****************** GetGeomTool ******************/
		/**** md5 signature: 6b33ef83138f718a68f748ea1ea7a345 ****/
		%feature("compactdefaultargs") GetGeomTool;
		%feature("autodoc", "No available documentation.

Returns
-------
TopOpeBRepTool_GeomTool
") GetGeomTool;
		const TopOpeBRepTool_GeomTool & GetGeomTool();

		/****************** GetOrientedEdgeVertices ******************/
		/**** md5 signature: 8a058faad507a36784264f0791a5e956 ****/
		%feature("compactdefaultargs") GetOrientedEdgeVertices;
		%feature("autodoc", "No available documentation.

Parameters
----------
E: TopoDS_Edge
Vmin: TopoDS_Vertex
Vmax: TopoDS_Vertex

Returns
-------
Parmin: float
Parmax: float
") GetOrientedEdgeVertices;
		void GetOrientedEdgeVertices(TopoDS_Edge & E, TopoDS_Vertex & Vmin, TopoDS_Vertex & Vmax, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** MakeEdge ******************/
		/**** md5 signature: c322d9d41c58eebc78ebeb1a368336bc ****/
		%feature("compactdefaultargs") MakeEdge;
		%feature("autodoc", "No available documentation.

Parameters
----------
E: TopoDS_Shape
C: TopOpeBRepDS_Curve

Returns
-------
None
") MakeEdge;
		void MakeEdge(TopoDS_Shape & E, const TopOpeBRepDS_Curve & C);

		/****************** MakeEdge ******************/
		/**** md5 signature: 0c42debf93b6fa7c080165ed32339ea3 ****/
		%feature("compactdefaultargs") MakeEdge;
		%feature("autodoc", "No available documentation.

Parameters
----------
E: TopoDS_Shape
C: TopOpeBRepDS_Curve
DS: TopOpeBRepDS_DataStructure

Returns
-------
None
") MakeEdge;
		void MakeEdge(TopoDS_Shape & E, const TopOpeBRepDS_Curve & C, const TopOpeBRepDS_DataStructure & DS);

		/****************** MakeEdge ******************/
		/**** md5 signature: ee710c2759cd467c4c7abf745b9a0bc2 ****/
		%feature("compactdefaultargs") MakeEdge;
		%feature("autodoc", "No available documentation.

Parameters
----------
E: TopoDS_Shape
C: Geom_Curve
Tol: float

Returns
-------
None
") MakeEdge;
		void MakeEdge(TopoDS_Shape & E, const opencascade::handle<Geom_Curve> & C, const Standard_Real Tol);

		/****************** MakeEdge ******************/
		/**** md5 signature: 4cda8d3e9a1d3660cb358bf543f1397c ****/
		%feature("compactdefaultargs") MakeEdge;
		%feature("autodoc", "No available documentation.

Parameters
----------
E: TopoDS_Shape

Returns
-------
None
") MakeEdge;
		void MakeEdge(TopoDS_Shape & E);

		/****************** MakeFace ******************/
		/**** md5 signature: 3a34eb1fc35111f0a067741bebfa5aed ****/
		%feature("compactdefaultargs") MakeFace;
		%feature("autodoc", "No available documentation.

Parameters
----------
F: TopoDS_Shape
S: TopOpeBRepDS_Surface

Returns
-------
None
") MakeFace;
		void MakeFace(TopoDS_Shape & F, const TopOpeBRepDS_Surface & S);

		/****************** MakeShell ******************/
		/**** md5 signature: 9c44d97836e48ae73f7a7852af003860 ****/
		%feature("compactdefaultargs") MakeShell;
		%feature("autodoc", "No available documentation.

Parameters
----------
Sh: TopoDS_Shape

Returns
-------
None
") MakeShell;
		void MakeShell(TopoDS_Shape & Sh);

		/****************** MakeSolid ******************/
		/**** md5 signature: 09e9258c227e928cb1c324e293a90586 ****/
		%feature("compactdefaultargs") MakeSolid;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape

Returns
-------
None
") MakeSolid;
		void MakeSolid(TopoDS_Shape & S);

		/****************** MakeVertex ******************/
		/**** md5 signature: 88c0c3b11eb5379cf70017d38ff16712 ****/
		%feature("compactdefaultargs") MakeVertex;
		%feature("autodoc", "No available documentation.

Parameters
----------
V: TopoDS_Shape
P: TopOpeBRepDS_Point

Returns
-------
None
") MakeVertex;
		void MakeVertex(TopoDS_Shape & V, const TopOpeBRepDS_Point & P);

		/****************** MakeWire ******************/
		/**** md5 signature: 12a6efd1de3c0a775278886280ca3adb ****/
		%feature("compactdefaultargs") MakeWire;
		%feature("autodoc", "No available documentation.

Parameters
----------
W: TopoDS_Shape

Returns
-------
None
") MakeWire;
		void MakeWire(TopoDS_Shape & W);

		/****************** Orientation ******************/
		/**** md5 signature: 2fbb2de5d16be3ec96ed304d6ce2745d ****/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape
O: TopAbs_Orientation

Returns
-------
None
") Orientation;
		void Orientation(TopoDS_Shape & S, const TopAbs_Orientation O);

		/****************** Orientation ******************/
		/**** md5 signature: c02dc3934a0a045b39da810286896c0e ****/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape

Returns
-------
TopAbs_Orientation
") Orientation;
		TopAbs_Orientation Orientation(const TopoDS_Shape & S);

		/****************** OverWrite ******************/
		/**** md5 signature: bec7518940a71167e19b7d3b8acfd144 ****/
		%feature("compactdefaultargs") OverWrite;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") OverWrite;
		Standard_Boolean OverWrite();

		/****************** OverWrite ******************/
		/**** md5 signature: b6e6e846fd6cd1de15cd79ebec13906a ****/
		%feature("compactdefaultargs") OverWrite;
		%feature("autodoc", "No available documentation.

Parameters
----------
O: bool

Returns
-------
None
") OverWrite;
		void OverWrite(const Standard_Boolean O);

		/****************** PCurve ******************/
		/**** md5 signature: 6f1565ac048eede1654fba5b2c1082b8 ****/
		%feature("compactdefaultargs") PCurve;
		%feature("autodoc", "Sets the pcurve <c> for the edge <e> on the face <f>. if overwrite is true the old pcurve if there is one is overwritten, else the two pcurves are set.

Parameters
----------
F: TopoDS_Shape
E: TopoDS_Shape
C: Geom2d_Curve

Returns
-------
None
") PCurve;
		void PCurve(TopoDS_Shape & F, TopoDS_Shape & E, const opencascade::handle<Geom2d_Curve> & C);

		/****************** PCurve ******************/
		/**** md5 signature: 5bff66786d077f5ee740a26003145005 ****/
		%feature("compactdefaultargs") PCurve;
		%feature("autodoc", "No available documentation.

Parameters
----------
F: TopoDS_Shape
E: TopoDS_Shape
CDS: TopOpeBRepDS_Curve
C: Geom2d_Curve

Returns
-------
None
") PCurve;
		void PCurve(TopoDS_Shape & F, TopoDS_Shape & E, const TopOpeBRepDS_Curve & CDS, const opencascade::handle<Geom2d_Curve> & C);

		/****************** Parameter ******************/
		/**** md5 signature: ccf33a9c2da9d479a0183b51984856e7 ****/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Sets the parameter <p> for the vertex <v> on the edge <e>.

Parameters
----------
E: TopoDS_Shape
V: TopoDS_Shape
P: float

Returns
-------
None
") Parameter;
		void Parameter(const TopoDS_Shape & E, const TopoDS_Shape & V, const Standard_Real P);

		/****************** Parameter ******************/
		/**** md5 signature: dfdc2af0b69aff19501456742113f6e3 ****/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Compute the parameter of the vertex <v>, supported by the edge <e>, on the curve <c>.

Parameters
----------
C: TopOpeBRepDS_Curve
E: TopoDS_Shape
V: TopoDS_Shape

Returns
-------
None
") Parameter;
		void Parameter(const TopOpeBRepDS_Curve & C, TopoDS_Shape & E, TopoDS_Shape & V);

		/****************** PutPCurves ******************/
		/**** md5 signature: 68b0e14caf774f2149574f0121231899 ****/
		%feature("compactdefaultargs") PutPCurves;
		%feature("autodoc", "No available documentation.

Parameters
----------
newC: TopOpeBRepDS_Curve
E: TopoDS_Edge
CompPC1: bool
CompPC2: bool

Returns
-------
None
") PutPCurves;
		void PutPCurves(const TopOpeBRepDS_Curve & newC, TopoDS_Edge & E, const Standard_Boolean CompPC1, const Standard_Boolean CompPC2);

		/****************** Range ******************/
		/**** md5 signature: 91ddc155afc8aa9023e379809ec9e767 ****/
		%feature("compactdefaultargs") Range;
		%feature("autodoc", "Sets the range of edge <e>.

Parameters
----------
E: TopoDS_Shape
first: float
last: float

Returns
-------
None
") Range;
		void Range(const TopoDS_Shape & E, const Standard_Real first, const Standard_Real last);

		/****************** RecomputeCurves ******************/
		/**** md5 signature: d2268d16d9f1e23969ee64454d1f91c1 ****/
		%feature("compactdefaultargs") RecomputeCurves;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: TopOpeBRepDS_Curve
oldE: TopoDS_Edge
E: TopoDS_Edge
HDS: TopOpeBRepDS_HDataStructure

Returns
-------
inewC: int
") RecomputeCurves;
		void RecomputeCurves(const TopOpeBRepDS_Curve & C, const TopoDS_Edge & oldE, TopoDS_Edge & E, Standard_Integer &OutValue, const opencascade::handle<TopOpeBRepDS_HDataStructure> & HDS);

		/****************** Translate ******************/
		/**** md5 signature: 7d0fd2105504278affaad5695ece8dc9 ****/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") Translate;
		Standard_Boolean Translate();

		/****************** Translate ******************/
		/**** md5 signature: c67ac8924df1d8b8f15727247fb6fc77 ****/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "No available documentation.

Parameters
----------
T: bool

Returns
-------
None
") Translate;
		void Translate(const Standard_Boolean T);

		/****************** UpdateEdge ******************/
		/**** md5 signature: f8436c0d941de854d2f6a6738e02eb32 ****/
		%feature("compactdefaultargs") UpdateEdge;
		%feature("autodoc", "Sets the range of edge <eou> from <ein> only when <ein> has a closed geometry.

Parameters
----------
Ein: TopoDS_Shape
Eou: TopoDS_Shape

Returns
-------
None
") UpdateEdge;
		void UpdateEdge(const TopoDS_Shape & Ein, TopoDS_Shape & Eou);

		/****************** UpdateEdgeCurveTol ******************/
		/**** md5 signature: 938d401b4d706f3534dc3ddc7a87ac22 ****/
		%feature("compactdefaultargs") UpdateEdgeCurveTol;
		%feature("autodoc", "No available documentation.

Parameters
----------
F1: TopoDS_Face
F2: TopoDS_Face
E: TopoDS_Edge
C3Dnew: Geom_Curve
tol3d: float
tol2d1: float
tol2d2: float

Returns
-------
newtol: float
newparmin: float
newparmax: float
") UpdateEdgeCurveTol;
		void UpdateEdgeCurveTol(const TopoDS_Face & F1, const TopoDS_Face & F2, TopoDS_Edge & E, const opencascade::handle<Geom_Curve> & C3Dnew, const Standard_Real tol3d, const Standard_Real tol2d1, const Standard_Real tol2d2, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** UpdateSurface ******************/
		/**** md5 signature: e2b70bce5d5cbd079befa501a27c0de3 ****/
		%feature("compactdefaultargs") UpdateSurface;
		%feature("autodoc", "No available documentation.

Parameters
----------
F: TopoDS_Shape
SU: Geom_Surface

Returns
-------
None
") UpdateSurface;
		void UpdateSurface(const TopoDS_Shape & F, const opencascade::handle<Geom_Surface> & SU);

		/****************** UpdateSurface ******************/
		/**** md5 signature: 526799dbf22174892653b37213b71068 ****/
		%feature("compactdefaultargs") UpdateSurface;
		%feature("autodoc", "No available documentation.

Parameters
----------
E: TopoDS_Shape
oldF: TopoDS_Shape
newF: TopoDS_Shape

Returns
-------
None
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
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopOpeBRepDS_Check;
		 TopOpeBRepDS_Check();

		/****************** TopOpeBRepDS_Check ******************/
		/**** md5 signature: 1bffeafdbcbacafe2b7843776c06ea75 ****/
		%feature("compactdefaultargs") TopOpeBRepDS_Check;
		%feature("autodoc", "No available documentation.

Parameters
----------
HDS: TopOpeBRepDS_HDataStructure

Returns
-------
None
") TopOpeBRepDS_Check;
		 TopOpeBRepDS_Check(const opencascade::handle<TopOpeBRepDS_HDataStructure> & HDS);

		/****************** ChangeHDS ******************/
		/**** md5 signature: f6ae620a0089db5e0e1f53e2df140a22 ****/
		%feature("compactdefaultargs") ChangeHDS;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TopOpeBRepDS_HDataStructure>
") ChangeHDS;
		opencascade::handle<TopOpeBRepDS_HDataStructure> & ChangeHDS();

		/****************** CheckDS ******************/
		/**** md5 signature: 7c4d02a9a20320516669bd3c7d333560 ****/
		%feature("compactdefaultargs") CheckDS;
		%feature("autodoc", "Verifie que le ieme element de la ds existe, et pour un k de type topologique, verifie qu'il est du bon type (vertex, edge, wire, face, shell ou solid).

Parameters
----------
i: int
K: TopOpeBRepDS_Kind

Returns
-------
bool
") CheckDS;
		Standard_Boolean CheckDS(const Standard_Integer i, const TopOpeBRepDS_Kind K);

		/****************** CheckShapes ******************/
		/**** md5 signature: a6bcd6a1ec62e019edc8f3555be4d4ff ****/
		%feature("compactdefaultargs") CheckShapes;
		%feature("autodoc", "Verifie que les shapes existent bien dans la ds utile pour les shapes samedomain si la liste est vide, renvoie vrai.

Parameters
----------
LS: TopTools_ListOfShape

Returns
-------
bool
") CheckShapes;
		Standard_Boolean CheckShapes(const TopTools_ListOfShape & LS);

		/****************** ChkIntg ******************/
		/**** md5 signature: 91cb7fe5fcb74707a99a7630b852c120 ****/
		%feature("compactdefaultargs") ChkIntg;
		%feature("autodoc", "Check integrition of ds.

Returns
-------
bool
") ChkIntg;
		Standard_Boolean ChkIntg();

		/****************** ChkIntgInterf ******************/
		/**** md5 signature: 3b02951ab93530d6690357693ef8598e ****/
		%feature("compactdefaultargs") ChkIntgInterf;
		%feature("autodoc", "Check integrition of interferences (les supports et les geometries de li).

Parameters
----------
LI: TopOpeBRepDS_ListOfInterference

Returns
-------
bool
") ChkIntgInterf;
		Standard_Boolean ChkIntgInterf(const TopOpeBRepDS_ListOfInterference & LI);

		/****************** ChkIntgSamDom ******************/
		/**** md5 signature: 54a9ae2f5bbbf5013dded9d16a77e089 ****/
		%feature("compactdefaultargs") ChkIntgSamDom;
		%feature("autodoc", "Check integrition des champs samedomain de la ds.

Returns
-------
bool
") ChkIntgSamDom;
		Standard_Boolean ChkIntgSamDom();

		/****************** HDS ******************/
		/**** md5 signature: 06b167d233b9790bcd0a135ca06a4a10 ****/
		%feature("compactdefaultargs") HDS;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TopOpeBRepDS_HDataStructure>
") HDS;
		const opencascade::handle<TopOpeBRepDS_HDataStructure> & HDS();

		/****************** OneVertexOnPnt ******************/
		/**** md5 signature: 85b7f7c95f7658ca07c0dcb4b73a83d3 ****/
		%feature("compactdefaultargs") OneVertexOnPnt;
		%feature("autodoc", "Verifie que les vertex non samedomain sont bien nonsamedomain, que les vertex samedomain sont bien samedomain, que les points sont non confondus ni entre eux, ni avec des vertex.

Returns
-------
bool
") OneVertexOnPnt;
		Standard_Boolean OneVertexOnPnt();


        %feature("autodoc", "1");
        %extend{
            std::string PrintIntgToString() {
            std::stringstream s;
            self->PrintIntg(s);
            return s.str();}
        };
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
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopOpeBRepDS_Curve;
		 TopOpeBRepDS_Curve();

		/****************** TopOpeBRepDS_Curve ******************/
		/**** md5 signature: de3714b8f28f90d36c1dc9586e5289b3 ****/
		%feature("compactdefaultargs") TopOpeBRepDS_Curve;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: Geom_Curve
T: float
IsWalk: bool,optional
	default value is Standard_False

Returns
-------
None
") TopOpeBRepDS_Curve;
		 TopOpeBRepDS_Curve(const opencascade::handle<Geom_Curve> & P, const Standard_Real T, const Standard_Boolean IsWalk = Standard_False);

		/****************** ChangeCurve ******************/
		/**** md5 signature: e819346faf86cc2bea5f869865af9ed2 ****/
		%feature("compactdefaultargs") ChangeCurve;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom_Curve>
") ChangeCurve;
		opencascade::handle<Geom_Curve> & ChangeCurve();

		/****************** ChangeDSIndex ******************/
		/**** md5 signature: 4165a2881b0bdbc8f8e733871dfb4516 ****/
		%feature("compactdefaultargs") ChangeDSIndex;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: int

Returns
-------
None
") ChangeDSIndex;
		void ChangeDSIndex(const Standard_Integer I);

		/****************** ChangeIsWalk ******************/
		/**** md5 signature: a85870a545a55473e88e53b335d20638 ****/
		%feature("compactdefaultargs") ChangeIsWalk;
		%feature("autodoc", "No available documentation.

Parameters
----------
B: bool

Returns
-------
None
") ChangeIsWalk;
		void ChangeIsWalk(const Standard_Boolean B);

		/****************** ChangeKeep ******************/
		/**** md5 signature: 75f379b6bb874b0da2db245ffe678874 ****/
		%feature("compactdefaultargs") ChangeKeep;
		%feature("autodoc", "No available documentation.

Parameters
----------
B: bool

Returns
-------
None
") ChangeKeep;
		void ChangeKeep(const Standard_Boolean B);

		/****************** ChangeMother ******************/
		/**** md5 signature: c4cfccc9364c313425bc77805633396f ****/
		%feature("compactdefaultargs") ChangeMother;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: int

Returns
-------
None
") ChangeMother;
		void ChangeMother(const Standard_Integer I);

		/****************** ChangeShape1 ******************/
		/**** md5 signature: d2743f9a46939c6cada33939dd36f3f1 ****/
		%feature("compactdefaultargs") ChangeShape1;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Shape
") ChangeShape1;
		TopoDS_Shape ChangeShape1();

		/****************** ChangeShape2 ******************/
		/**** md5 signature: 9df648ca98f0f035360705446acc37f1 ****/
		%feature("compactdefaultargs") ChangeShape2;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Shape
") ChangeShape2;
		TopoDS_Shape ChangeShape2();

		/****************** Curve ******************/
		/**** md5 signature: 976a03829ec92d091e0b58dd7f58e869 ****/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom_Curve>
") Curve;
		const opencascade::handle<Geom_Curve> & Curve();

		/****************** Curve ******************/
		/**** md5 signature: e59e8fad0818900531492d1df21d07a6 ****/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "No available documentation.

Parameters
----------
C3D: Geom_Curve
Tol: float

Returns
-------
None
") Curve;
		void Curve(const opencascade::handle<Geom_Curve> & C3D, const Standard_Real Tol);

		/****************** Curve1 ******************/
		/**** md5 signature: a306dd9436c220a3a90cc21c2a19c805 ****/
		%feature("compactdefaultargs") Curve1;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom2d_Curve>
") Curve1;
		const opencascade::handle<Geom2d_Curve> & Curve1();

		/****************** Curve1 ******************/
		/**** md5 signature: fd91e8daf242d68bbe2820c57be32f13 ****/
		%feature("compactdefaultargs") Curve1;
		%feature("autodoc", "No available documentation.

Parameters
----------
PC1: Geom2d_Curve

Returns
-------
None
") Curve1;
		void Curve1(const opencascade::handle<Geom2d_Curve> & PC1);

		/****************** Curve2 ******************/
		/**** md5 signature: f5d60c1f5a2a15607f83d0cba669b34f ****/
		%feature("compactdefaultargs") Curve2;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom2d_Curve>
") Curve2;
		const opencascade::handle<Geom2d_Curve> & Curve2();

		/****************** Curve2 ******************/
		/**** md5 signature: 36634219d55de4c4b906b2079a686144 ****/
		%feature("compactdefaultargs") Curve2;
		%feature("autodoc", "No available documentation.

Parameters
----------
PC2: Geom2d_Curve

Returns
-------
None
") Curve2;
		void Curve2(const opencascade::handle<Geom2d_Curve> & PC2);

		/****************** DSIndex ******************/
		/**** md5 signature: 0c1df20e7fc560a5a6aeb68151a347a2 ****/
		%feature("compactdefaultargs") DSIndex;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") DSIndex;
		Standard_Integer DSIndex();

		/****************** DefineCurve ******************/
		/**** md5 signature: 725838433163328cad89da4ad0eab9b6 ****/
		%feature("compactdefaultargs") DefineCurve;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: Geom_Curve
T: float
IsWalk: bool

Returns
-------
None
") DefineCurve;
		void DefineCurve(const opencascade::handle<Geom_Curve> & P, const Standard_Real T, const Standard_Boolean IsWalk);

		/****************** GetSCI ******************/
		/**** md5 signature: 5fd9c24ea42e179b86dcfbcfccd1820b ****/
		%feature("compactdefaultargs") GetSCI;
		%feature("autodoc", "No available documentation.

Parameters
----------
I1: TopOpeBRepDS_Interference
I2: TopOpeBRepDS_Interference

Returns
-------
None
") GetSCI;
		void GetSCI(opencascade::handle<TopOpeBRepDS_Interference> & I1, opencascade::handle<TopOpeBRepDS_Interference> & I2);

		/****************** GetSCI1 ******************/
		/**** md5 signature: e188e03baf96eae1d28e151ff60ea317 ****/
		%feature("compactdefaultargs") GetSCI1;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TopOpeBRepDS_Interference>
") GetSCI1;
		const opencascade::handle<TopOpeBRepDS_Interference> & GetSCI1();

		/****************** GetSCI2 ******************/
		/**** md5 signature: 2a413ccb701972d663239d2624fa2ff5 ****/
		%feature("compactdefaultargs") GetSCI2;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TopOpeBRepDS_Interference>
") GetSCI2;
		const opencascade::handle<TopOpeBRepDS_Interference> & GetSCI2();

		/****************** GetShapes ******************/
		/**** md5 signature: afd553f86b0ab4e9a4d04d7122dab87e ****/
		%feature("compactdefaultargs") GetShapes;
		%feature("autodoc", "No available documentation.

Parameters
----------
S1: TopoDS_Shape
S2: TopoDS_Shape

Returns
-------
None
") GetShapes;
		void GetShapes(TopoDS_Shape & S1, TopoDS_Shape & S2);

		/****************** IsWalk ******************/
		/**** md5 signature: 66ccf6ca8d750aa2bca9b1b1c0ea87f9 ****/
		%feature("compactdefaultargs") IsWalk;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsWalk;
		Standard_Boolean IsWalk();

		/****************** Keep ******************/
		/**** md5 signature: 49f5fb06c6fb4c03a84c4eb06dd2637f ****/
		%feature("compactdefaultargs") Keep;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") Keep;
		Standard_Boolean Keep();

		/****************** Mother ******************/
		/**** md5 signature: d14db32971971ed33042eb9000386c14 ****/
		%feature("compactdefaultargs") Mother;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") Mother;
		Standard_Integer Mother();

		/****************** Range ******************/
		/**** md5 signature: 399e1aef232e5044dddcdca6c1014dd9 ****/
		%feature("compactdefaultargs") Range;
		%feature("autodoc", "No available documentation.

Parameters
----------

Returns
-------
First: float
Last: float
") Range;
		Standard_Boolean Range(Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** SetRange ******************/
		/**** md5 signature: 4a19c7b6bd2369f897cb3fd2e6cdf6dd ****/
		%feature("compactdefaultargs") SetRange;
		%feature("autodoc", "No available documentation.

Parameters
----------
First: float
Last: float

Returns
-------
None
") SetRange;
		void SetRange(const Standard_Real First, const Standard_Real Last);

		/****************** SetSCI ******************/
		/**** md5 signature: 423e8469585bf5f37f922a228def0989 ****/
		%feature("compactdefaultargs") SetSCI;
		%feature("autodoc", "Define the interferences face/curve.

Parameters
----------
I1: TopOpeBRepDS_Interference
I2: TopOpeBRepDS_Interference

Returns
-------
None
") SetSCI;
		void SetSCI(const opencascade::handle<TopOpeBRepDS_Interference> & I1, const opencascade::handle<TopOpeBRepDS_Interference> & I2);

		/****************** SetShapes ******************/
		/**** md5 signature: a1d7f5311427e380aae9b6a0bfa750c4 ****/
		%feature("compactdefaultargs") SetShapes;
		%feature("autodoc", "No available documentation.

Parameters
----------
S1: TopoDS_Shape
S2: TopoDS_Shape

Returns
-------
None
") SetShapes;
		void SetShapes(const TopoDS_Shape & S1, const TopoDS_Shape & S2);

		/****************** Shape1 ******************/
		/**** md5 signature: 07a3db9d6b637af56fb1391aee4b7641 ****/
		%feature("compactdefaultargs") Shape1;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Shape
") Shape1;
		const TopoDS_Shape Shape1();

		/****************** Shape2 ******************/
		/**** md5 signature: 3655a6c56b55e5313d1b146d7ee7458a ****/
		%feature("compactdefaultargs") Shape2;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Shape
") Shape2;
		const TopoDS_Shape Shape2();

		/****************** Tolerance ******************/
		/**** md5 signature: e925b87131cc380a2e6cb497cb7384fa ****/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "Update the tolerance.

Parameters
----------
tol: float

Returns
-------
None
") Tolerance;
		void Tolerance(const Standard_Real tol);

		/****************** Tolerance ******************/
		/**** md5 signature: 9e5775014410d884d1a1adc1cd47930b ****/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "No available documentation.

Returns
-------
float
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
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopOpeBRepDS_CurveExplorer;
		 TopOpeBRepDS_CurveExplorer();

		/****************** TopOpeBRepDS_CurveExplorer ******************/
		/**** md5 signature: c0701acb0605e0e56ff447b1f7203a30 ****/
		%feature("compactdefaultargs") TopOpeBRepDS_CurveExplorer;
		%feature("autodoc", "No available documentation.

Parameters
----------
DS: TopOpeBRepDS_DataStructure
FindOnlyKeep: bool,optional
	default value is Standard_True

Returns
-------
None
") TopOpeBRepDS_CurveExplorer;
		 TopOpeBRepDS_CurveExplorer(const TopOpeBRepDS_DataStructure & DS, const Standard_Boolean FindOnlyKeep = Standard_True);

		/****************** Curve ******************/
		/**** md5 signature: ad855b410817599ecd2040b239b5eadd ****/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "No available documentation.

Returns
-------
TopOpeBRepDS_Curve
") Curve;
		const TopOpeBRepDS_Curve & Curve();

		/****************** Curve ******************/
		/**** md5 signature: f53cb61e2b022b236aa70ffbec11ac31 ****/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: int

Returns
-------
TopOpeBRepDS_Curve
") Curve;
		const TopOpeBRepDS_Curve & Curve(const Standard_Integer I);

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
		/**** md5 signature: 3cb53884a0dedff3ad42657c8c345e44 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
DS: TopOpeBRepDS_DataStructure
FindOnlyKeep: bool,optional
	default value is Standard_True

Returns
-------
None
") Init;
		void Init(const TopOpeBRepDS_DataStructure & DS, const Standard_Boolean FindOnlyKeep = Standard_True);

		/****************** IsCurve ******************/
		/**** md5 signature: f8407e8ba0b908da25f9e9bcca8ca235 ****/
		%feature("compactdefaultargs") IsCurve;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: int

Returns
-------
bool
") IsCurve;
		Standard_Boolean IsCurve(const Standard_Integer I);

		/****************** IsCurveKeep ******************/
		/**** md5 signature: b0656fe012bcbf6c193065206be8cfb3 ****/
		%feature("compactdefaultargs") IsCurveKeep;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: int

Returns
-------
bool
") IsCurveKeep;
		Standard_Boolean IsCurveKeep(const Standard_Integer I);

		/****************** More ******************/
		/**** md5 signature: 6f6e915c9a3dca758c059d9e8af02dff ****/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") More;
		Standard_Boolean More();

		/****************** NbCurve ******************/
		/**** md5 signature: d4b093ea6471975ce0cb92d8164116b0 ****/
		%feature("compactdefaultargs") NbCurve;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbCurve;
		Standard_Integer NbCurve();

		/****************** Next ******************/
		/**** md5 signature: f35c0df5f1d7c877986db18081404532 ****/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "No available documentation.

Returns
-------
None
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
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopOpeBRepDS_DataStructure;
		 TopOpeBRepDS_DataStructure();

		/****************** AddCurve ******************/
		/**** md5 signature: 536314d052ec1598a85b19cda8574d31 ****/
		%feature("compactdefaultargs") AddCurve;
		%feature("autodoc", "Insert a new curve. returns the index.

Parameters
----------
S: TopOpeBRepDS_Curve

Returns
-------
int
") AddCurve;
		Standard_Integer AddCurve(const TopOpeBRepDS_Curve & S);

		/****************** AddPoint ******************/
		/**** md5 signature: 1660691bbbd5a65d53b37c5d419c78ad ****/
		%feature("compactdefaultargs") AddPoint;
		%feature("autodoc", "Insert a new point. returns the index.

Parameters
----------
PDS: TopOpeBRepDS_Point

Returns
-------
int
") AddPoint;
		Standard_Integer AddPoint(const TopOpeBRepDS_Point & PDS);

		/****************** AddPointSS ******************/
		/**** md5 signature: 6a6ba9e50dc4ec7e303372f43a3b7b49 ****/
		%feature("compactdefaultargs") AddPointSS;
		%feature("autodoc", "Insert a new point. returns the index.

Parameters
----------
PDS: TopOpeBRepDS_Point
S1: TopoDS_Shape
S2: TopoDS_Shape

Returns
-------
int
") AddPointSS;
		Standard_Integer AddPointSS(const TopOpeBRepDS_Point & PDS, const TopoDS_Shape & S1, const TopoDS_Shape & S2);

		/****************** AddSectionEdge ******************/
		/**** md5 signature: 135b445dae35ce43de370fa83956831e ****/
		%feature("compactdefaultargs") AddSectionEdge;
		%feature("autodoc", "No available documentation.

Parameters
----------
E: TopoDS_Edge

Returns
-------
int
") AddSectionEdge;
		Standard_Integer AddSectionEdge(const TopoDS_Edge & E);

		/****************** AddShape ******************/
		/**** md5 signature: c451987d8af344862bcedcb55c2e67f4 ****/
		%feature("compactdefaultargs") AddShape;
		%feature("autodoc", "Insert a shape s. returns the index.

Parameters
----------
S: TopoDS_Shape

Returns
-------
int
") AddShape;
		Standard_Integer AddShape(const TopoDS_Shape & S);

		/****************** AddShape ******************/
		/**** md5 signature: 3a33334e90bbe52b73a13279c2a7055b ****/
		%feature("compactdefaultargs") AddShape;
		%feature("autodoc", "Insert a shape s which ancestor is i = 1 or 2. returns the index.

Parameters
----------
S: TopoDS_Shape
I: int

Returns
-------
int
") AddShape;
		Standard_Integer AddShape(const TopoDS_Shape & S, const Standard_Integer I);

		/****************** AddShapeInterference ******************/
		/**** md5 signature: dfbd0f55c4b90afe9386f234f93b2caf ****/
		%feature("compactdefaultargs") AddShapeInterference;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape
I: TopOpeBRepDS_Interference

Returns
-------
None
") AddShapeInterference;
		void AddShapeInterference(const TopoDS_Shape & S, const opencascade::handle<TopOpeBRepDS_Interference> & I);

		/****************** AddShapeSameDomain ******************/
		/**** md5 signature: fe10a4775c3d346e9027a750dcc5fce0 ****/
		%feature("compactdefaultargs") AddShapeSameDomain;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape
SSD: TopoDS_Shape

Returns
-------
None
") AddShapeSameDomain;
		void AddShapeSameDomain(const TopoDS_Shape & S, const TopoDS_Shape & SSD);

		/****************** AddSurface ******************/
		/**** md5 signature: 78c0f2ee65d21c911a1531c2c7d8e876 ****/
		%feature("compactdefaultargs") AddSurface;
		%feature("autodoc", "Insert a new surface. returns the index.

Parameters
----------
S: TopOpeBRepDS_Surface

Returns
-------
int
") AddSurface;
		Standard_Integer AddSurface(const TopOpeBRepDS_Surface & S);

		/****************** AncestorRank ******************/
		/**** md5 signature: 9208946994ce6724866cfa51407fc62f ****/
		%feature("compactdefaultargs") AncestorRank;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: int

Returns
-------
int
") AncestorRank;
		Standard_Integer AncestorRank(const Standard_Integer I);

		/****************** AncestorRank ******************/
		/**** md5 signature: 962427246486e1c68d80c16027531953 ****/
		%feature("compactdefaultargs") AncestorRank;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape

Returns
-------
int
") AncestorRank;
		Standard_Integer AncestorRank(const TopoDS_Shape & S);

		/****************** AncestorRank ******************/
		/**** md5 signature: 416b03cc7621f4695e4c1c3abb59f5f2 ****/
		%feature("compactdefaultargs") AncestorRank;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: int
Ianc: int

Returns
-------
None
") AncestorRank;
		void AncestorRank(const Standard_Integer I, const Standard_Integer Ianc);

		/****************** AncestorRank ******************/
		/**** md5 signature: 6435424809880d1c5a01b8622c605f62 ****/
		%feature("compactdefaultargs") AncestorRank;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape
Ianc: int

Returns
-------
None
") AncestorRank;
		void AncestorRank(const TopoDS_Shape & S, const Standard_Integer Ianc);

		/****************** ChangeCurve ******************/
		/**** md5 signature: 0963e13770cf795b99436987493a8a15 ****/
		%feature("compactdefaultargs") ChangeCurve;
		%feature("autodoc", "Returns the curve of index <i>.

Parameters
----------
I: int

Returns
-------
TopOpeBRepDS_Curve
") ChangeCurve;
		TopOpeBRepDS_Curve & ChangeCurve(const Standard_Integer I);

		/****************** ChangeCurveInterferences ******************/
		/**** md5 signature: 7deab7ca7e22e42e7a56f29ee8deec68 ****/
		%feature("compactdefaultargs") ChangeCurveInterferences;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: int

Returns
-------
TopOpeBRepDS_ListOfInterference
") ChangeCurveInterferences;
		TopOpeBRepDS_ListOfInterference & ChangeCurveInterferences(const Standard_Integer I);

		/****************** ChangeKeepCurve ******************/
		/**** md5 signature: 4070cbb88042c78999bf00a2161ac9aa ****/
		%feature("compactdefaultargs") ChangeKeepCurve;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: int
FindKeep: bool

Returns
-------
None
") ChangeKeepCurve;
		void ChangeKeepCurve(const Standard_Integer I, const Standard_Boolean FindKeep);

		/****************** ChangeKeepCurve ******************/
		/**** md5 signature: bd15a97145444ff65f98c8ce8982593e ****/
		%feature("compactdefaultargs") ChangeKeepCurve;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: TopOpeBRepDS_Curve
FindKeep: bool

Returns
-------
None
") ChangeKeepCurve;
		void ChangeKeepCurve(TopOpeBRepDS_Curve & C, const Standard_Boolean FindKeep);

		/****************** ChangeKeepPoint ******************/
		/**** md5 signature: a4f111963e183c8efc05d35e57c1e848 ****/
		%feature("compactdefaultargs") ChangeKeepPoint;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: int
FindKeep: bool

Returns
-------
None
") ChangeKeepPoint;
		void ChangeKeepPoint(const Standard_Integer I, const Standard_Boolean FindKeep);

		/****************** ChangeKeepPoint ******************/
		/**** md5 signature: 066e2a50a54f5f4a40ec489dbeb09c82 ****/
		%feature("compactdefaultargs") ChangeKeepPoint;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: TopOpeBRepDS_Point
FindKeep: bool

Returns
-------
None
") ChangeKeepPoint;
		void ChangeKeepPoint(TopOpeBRepDS_Point & P, const Standard_Boolean FindKeep);

		/****************** ChangeKeepShape ******************/
		/**** md5 signature: 6210d7ece8c1f1578866f3be6eb1859c ****/
		%feature("compactdefaultargs") ChangeKeepShape;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: int
FindKeep: bool

Returns
-------
None
") ChangeKeepShape;
		void ChangeKeepShape(const Standard_Integer I, const Standard_Boolean FindKeep);

		/****************** ChangeKeepShape ******************/
		/**** md5 signature: b8b96d1ef3e8f90505ad39e9a82d1771 ****/
		%feature("compactdefaultargs") ChangeKeepShape;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape
FindKeep: bool

Returns
-------
None
") ChangeKeepShape;
		void ChangeKeepShape(const TopoDS_Shape & S, const Standard_Boolean FindKeep);

		/****************** ChangeKeepSurface ******************/
		/**** md5 signature: 6eb03af2c227ffbca9e9cb9adb640c32 ****/
		%feature("compactdefaultargs") ChangeKeepSurface;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: int
FindKeep: bool

Returns
-------
None
") ChangeKeepSurface;
		void ChangeKeepSurface(const Standard_Integer I, const Standard_Boolean FindKeep);

		/****************** ChangeKeepSurface ******************/
		/**** md5 signature: 69f3fa757fc8355475728bf401e9c5dd ****/
		%feature("compactdefaultargs") ChangeKeepSurface;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopOpeBRepDS_Surface
FindKeep: bool

Returns
-------
None
") ChangeKeepSurface;
		void ChangeKeepSurface(TopOpeBRepDS_Surface & S, const Standard_Boolean FindKeep);

		/****************** ChangeMapOfRejectedShapesObj ******************/
		/**** md5 signature: e40559c2eada0493596e18730a9c83f4 ****/
		%feature("compactdefaultargs") ChangeMapOfRejectedShapesObj;
		%feature("autodoc", "No available documentation.

Returns
-------
TopTools_IndexedMapOfShape
") ChangeMapOfRejectedShapesObj;
		TopTools_IndexedMapOfShape & ChangeMapOfRejectedShapesObj();

		/****************** ChangeMapOfRejectedShapesTool ******************/
		/**** md5 signature: 3d138fb53314f7a5a40fe9a6bc36a7d3 ****/
		%feature("compactdefaultargs") ChangeMapOfRejectedShapesTool;
		%feature("autodoc", "No available documentation.

Returns
-------
TopTools_IndexedMapOfShape
") ChangeMapOfRejectedShapesTool;
		TopTools_IndexedMapOfShape & ChangeMapOfRejectedShapesTool();

		/****************** ChangeMapOfShapeWithState ******************/
		/**** md5 signature: cf7ca25726f7a47424fa1e24c9eaffad ****/
		%feature("compactdefaultargs") ChangeMapOfShapeWithState;
		%feature("autodoc", "No available documentation.

Parameters
----------
aShape: TopoDS_Shape

Returns
-------
aFlag: bool
") ChangeMapOfShapeWithState;
		TopOpeBRepDS_IndexedDataMapOfShapeWithState & ChangeMapOfShapeWithState(const TopoDS_Shape & aShape, Standard_Boolean &OutValue);

		/****************** ChangeMapOfShapeWithStateObj ******************/
		/**** md5 signature: 6e81b081dcbc1e04934ac25b851372dc ****/
		%feature("compactdefaultargs") ChangeMapOfShapeWithStateObj;
		%feature("autodoc", "No available documentation.

Returns
-------
TopOpeBRepDS_IndexedDataMapOfShapeWithState
") ChangeMapOfShapeWithStateObj;
		TopOpeBRepDS_IndexedDataMapOfShapeWithState & ChangeMapOfShapeWithStateObj();

		/****************** ChangeMapOfShapeWithStateTool ******************/
		/**** md5 signature: 7c5055cc273de3803b1a58bf0d74f8a8 ****/
		%feature("compactdefaultargs") ChangeMapOfShapeWithStateTool;
		%feature("autodoc", "No available documentation.

Returns
-------
TopOpeBRepDS_IndexedDataMapOfShapeWithState
") ChangeMapOfShapeWithStateTool;
		TopOpeBRepDS_IndexedDataMapOfShapeWithState & ChangeMapOfShapeWithStateTool();

		/****************** ChangeNbCurves ******************/
		/**** md5 signature: 61918d90723549dda13bcb2198f3f6a1 ****/
		%feature("compactdefaultargs") ChangeNbCurves;
		%feature("autodoc", "No available documentation.

Parameters
----------
N: int

Returns
-------
None
") ChangeNbCurves;
		void ChangeNbCurves(const Standard_Integer N);

		/****************** ChangePoint ******************/
		/**** md5 signature: f328d7e06d1ef5c46763a0489395f251 ****/
		%feature("compactdefaultargs") ChangePoint;
		%feature("autodoc", "Returns the point of index <i>.

Parameters
----------
I: int

Returns
-------
TopOpeBRepDS_Point
") ChangePoint;
		TopOpeBRepDS_Point & ChangePoint(const Standard_Integer I);

		/****************** ChangePointInterferences ******************/
		/**** md5 signature: 2a5052527e6519704e556eaa65900401 ****/
		%feature("compactdefaultargs") ChangePointInterferences;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: int

Returns
-------
TopOpeBRepDS_ListOfInterference
") ChangePointInterferences;
		TopOpeBRepDS_ListOfInterference & ChangePointInterferences(const Standard_Integer I);

		/****************** ChangeShapeInterferences ******************/
		/**** md5 signature: ce1a8a73e7ce343c3d3e3e3f5422ecd1 ****/
		%feature("compactdefaultargs") ChangeShapeInterferences;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape

Returns
-------
TopOpeBRepDS_ListOfInterference
") ChangeShapeInterferences;
		TopOpeBRepDS_ListOfInterference & ChangeShapeInterferences(const TopoDS_Shape & S);

		/****************** ChangeShapeInterferences ******************/
		/**** md5 signature: c7c62d3c2d46def711397ef32fa49dc1 ****/
		%feature("compactdefaultargs") ChangeShapeInterferences;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: int

Returns
-------
TopOpeBRepDS_ListOfInterference
") ChangeShapeInterferences;
		TopOpeBRepDS_ListOfInterference & ChangeShapeInterferences(const Standard_Integer I);

		/****************** ChangeShapeSameDomain ******************/
		/**** md5 signature: ef398371e60f7181b036dab752b7daed ****/
		%feature("compactdefaultargs") ChangeShapeSameDomain;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape

Returns
-------
TopTools_ListOfShape
") ChangeShapeSameDomain;
		TopTools_ListOfShape & ChangeShapeSameDomain(const TopoDS_Shape & S);

		/****************** ChangeShapeSameDomain ******************/
		/**** md5 signature: 5b49d2b8d5777a7f0965113f565e2b9f ****/
		%feature("compactdefaultargs") ChangeShapeSameDomain;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: int

Returns
-------
TopTools_ListOfShape
") ChangeShapeSameDomain;
		TopTools_ListOfShape & ChangeShapeSameDomain(const Standard_Integer I);

		/****************** ChangeShapes ******************/
		/**** md5 signature: 5939b51e203c5eb042017ec89d062826 ****/
		%feature("compactdefaultargs") ChangeShapes;
		%feature("autodoc", "No available documentation.

Returns
-------
TopOpeBRepDS_MapOfShapeData
") ChangeShapes;
		TopOpeBRepDS_MapOfShapeData & ChangeShapes();

		/****************** ChangeSurface ******************/
		/**** md5 signature: df871aa12b0a35203ee1f41548d4667c ****/
		%feature("compactdefaultargs") ChangeSurface;
		%feature("autodoc", "Returns the surface of index <i>.

Parameters
----------
I: int

Returns
-------
TopOpeBRepDS_Surface
") ChangeSurface;
		TopOpeBRepDS_Surface & ChangeSurface(const Standard_Integer I);

		/****************** ChangeSurfaceInterferences ******************/
		/**** md5 signature: b092d6884d606ccce117b72ba79b7234 ****/
		%feature("compactdefaultargs") ChangeSurfaceInterferences;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: int

Returns
-------
TopOpeBRepDS_ListOfInterference
") ChangeSurfaceInterferences;
		TopOpeBRepDS_ListOfInterference & ChangeSurfaceInterferences(const Standard_Integer I);

		/****************** Curve ******************/
		/**** md5 signature: f53cb61e2b022b236aa70ffbec11ac31 ****/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "Returns the curve of index <i>.

Parameters
----------
I: int

Returns
-------
TopOpeBRepDS_Curve
") Curve;
		const TopOpeBRepDS_Curve & Curve(const Standard_Integer I);

		/****************** CurveInterferences ******************/
		/**** md5 signature: 0ae607216e1128d734c938cbcd7a9b19 ****/
		%feature("compactdefaultargs") CurveInterferences;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: int

Returns
-------
TopOpeBRepDS_ListOfInterference
") CurveInterferences;
		const TopOpeBRepDS_ListOfInterference & CurveInterferences(const Standard_Integer I);

		/****************** FillShapesSameDomain ******************/
		/**** md5 signature: 9b085f8f00de0ab0fb18482c7f2aba0a ****/
		%feature("compactdefaultargs") FillShapesSameDomain;
		%feature("autodoc", "No available documentation.

Parameters
----------
S1: TopoDS_Shape
S2: TopoDS_Shape
refFirst: bool,optional
	default value is Standard_True

Returns
-------
None
") FillShapesSameDomain;
		void FillShapesSameDomain(const TopoDS_Shape & S1, const TopoDS_Shape & S2, const Standard_Boolean refFirst = Standard_True);

		/****************** FillShapesSameDomain ******************/
		/**** md5 signature: 2c20793bceac1cb02fd82f898232bb78 ****/
		%feature("compactdefaultargs") FillShapesSameDomain;
		%feature("autodoc", "No available documentation.

Parameters
----------
S1: TopoDS_Shape
S2: TopoDS_Shape
c1: TopOpeBRepDS_Config
c2: TopOpeBRepDS_Config
refFirst: bool,optional
	default value is Standard_True

Returns
-------
None
") FillShapesSameDomain;
		void FillShapesSameDomain(const TopoDS_Shape & S1, const TopoDS_Shape & S2, const TopOpeBRepDS_Config c1, const TopOpeBRepDS_Config c2, const Standard_Boolean refFirst = Standard_True);

		/****************** GetShapeWithState ******************/
		/**** md5 signature: a6f2b4fcd0e7a847188e96d6fa4347ba ****/
		%feature("compactdefaultargs") GetShapeWithState;
		%feature("autodoc", "No available documentation.

Parameters
----------
aShape: TopoDS_Shape

Returns
-------
TopOpeBRepDS_ShapeWithState
") GetShapeWithState;
		const TopOpeBRepDS_ShapeWithState & GetShapeWithState(const TopoDS_Shape & aShape);

		/****************** HasGeometry ******************/
		/**** md5 signature: 515d3381600536728112287b52b5cac8 ****/
		%feature("compactdefaultargs") HasGeometry;
		%feature("autodoc", "Returns true if <s> has new geometries, i.e : true si : hasshape(s) true s a une liste d'interferences non vide. s = solid, face, edge : true/false s = shell, wire, vertex : false.

Parameters
----------
S: TopoDS_Shape

Returns
-------
bool
") HasGeometry;
		Standard_Boolean HasGeometry(const TopoDS_Shape & S);

		/****************** HasNewSurface ******************/
		/**** md5 signature: 4520d52fb0be8c5259d9561c83cbec20 ****/
		%feature("compactdefaultargs") HasNewSurface;
		%feature("autodoc", "No available documentation.

Parameters
----------
F: TopoDS_Shape

Returns
-------
bool
") HasNewSurface;
		Standard_Boolean HasNewSurface(const TopoDS_Shape & F);

		/****************** HasShape ******************/
		/**** md5 signature: 5afea513cd4da105b0a805fd98689f7b ****/
		%feature("compactdefaultargs") HasShape;
		%feature("autodoc", "Returns true if <s> est dans myshapes.

Parameters
----------
S: TopoDS_Shape
FindKeep: bool,optional
	default value is Standard_True

Returns
-------
bool
") HasShape;
		Standard_Boolean HasShape(const TopoDS_Shape & S, const Standard_Boolean FindKeep = Standard_True);

		/****************** Init ******************/
		/**** md5 signature: 0de93ef32c53d091768788dca0e281fd ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Reset the data structure.

Returns
-------
None
") Init;
		void Init();

		/****************** InitSectionEdges ******************/
		/**** md5 signature: 8a9fd75a3bda2254991fb49f99a7add4 ****/
		%feature("compactdefaultargs") InitSectionEdges;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") InitSectionEdges;
		void InitSectionEdges();

		/****************** IsSectionEdge ******************/
		/**** md5 signature: 48c5e1d6cbf668c80de3274958fb7aad ****/
		%feature("compactdefaultargs") IsSectionEdge;
		%feature("autodoc", "No available documentation.

Parameters
----------
E: TopoDS_Edge
FindKeep: bool,optional
	default value is Standard_True

Returns
-------
bool
") IsSectionEdge;
		Standard_Boolean IsSectionEdge(const TopoDS_Edge & E, const Standard_Boolean FindKeep = Standard_True);

		/****************** Isfafa ******************/
		/**** md5 signature: 627b4d3daad0ef2a74d63fc5001f22c5 ****/
		%feature("compactdefaultargs") Isfafa;
		%feature("autodoc", "No available documentation.

Parameters
----------
isfafa: bool

Returns
-------
None
") Isfafa;
		void Isfafa(const Standard_Boolean isfafa);

		/****************** Isfafa ******************/
		/**** md5 signature: c33bc00e352e9205edc83c835d0965a9 ****/
		%feature("compactdefaultargs") Isfafa;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") Isfafa;
		Standard_Boolean Isfafa();

		/****************** KeepCurve ******************/
		/**** md5 signature: a31a1de3acdc06b8d608a4825c7b65d1 ****/
		%feature("compactdefaultargs") KeepCurve;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: int

Returns
-------
bool
") KeepCurve;
		Standard_Boolean KeepCurve(const Standard_Integer I);

		/****************** KeepCurve ******************/
		/**** md5 signature: 819d464c0a535e10eb3ccd04e73534f9 ****/
		%feature("compactdefaultargs") KeepCurve;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: TopOpeBRepDS_Curve

Returns
-------
bool
") KeepCurve;
		Standard_Boolean KeepCurve(const TopOpeBRepDS_Curve & C);

		/****************** KeepPoint ******************/
		/**** md5 signature: c25a8067859a9a79c209816fb30a01f5 ****/
		%feature("compactdefaultargs") KeepPoint;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: int

Returns
-------
bool
") KeepPoint;
		Standard_Boolean KeepPoint(const Standard_Integer I);

		/****************** KeepPoint ******************/
		/**** md5 signature: 73c36fa076d5daf4a05be4fafb7459ba ****/
		%feature("compactdefaultargs") KeepPoint;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: TopOpeBRepDS_Point

Returns
-------
bool
") KeepPoint;
		Standard_Boolean KeepPoint(const TopOpeBRepDS_Point & P);

		/****************** KeepShape ******************/
		/**** md5 signature: 42d63f4833fb0f4baa5b575971397ec7 ****/
		%feature("compactdefaultargs") KeepShape;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: int
FindKeep: bool,optional
	default value is Standard_True

Returns
-------
bool
") KeepShape;
		Standard_Boolean KeepShape(const Standard_Integer I, const Standard_Boolean FindKeep = Standard_True);

		/****************** KeepShape ******************/
		/**** md5 signature: 8022899b383af025b8b4518995a74765 ****/
		%feature("compactdefaultargs") KeepShape;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape
FindKeep: bool,optional
	default value is Standard_True

Returns
-------
bool
") KeepShape;
		Standard_Boolean KeepShape(const TopoDS_Shape & S, const Standard_Boolean FindKeep = Standard_True);

		/****************** KeepSurface ******************/
		/**** md5 signature: 1306c7905bac38efdc491cb827df27c8 ****/
		%feature("compactdefaultargs") KeepSurface;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: int

Returns
-------
bool
") KeepSurface;
		Standard_Boolean KeepSurface(const Standard_Integer I);

		/****************** KeepSurface ******************/
		/**** md5 signature: bb98baef27e6279929b589dc67f12903 ****/
		%feature("compactdefaultargs") KeepSurface;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopOpeBRepDS_Surface

Returns
-------
bool
") KeepSurface;
		Standard_Boolean KeepSurface(TopOpeBRepDS_Surface & S);

		/****************** NbCurves ******************/
		/**** md5 signature: f7f6dbd981df076443155a5a87b5c223 ****/
		%feature("compactdefaultargs") NbCurves;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbCurves;
		Standard_Integer NbCurves();

		/****************** NbPoints ******************/
		/**** md5 signature: 1d4bbbd7c4dda4f1e56c00ae994bedbe ****/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbPoints;
		Standard_Integer NbPoints();

		/****************** NbSectionEdges ******************/
		/**** md5 signature: aea8f7c64070df22874bc46708a9d81c ****/
		%feature("compactdefaultargs") NbSectionEdges;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbSectionEdges;
		Standard_Integer NbSectionEdges();

		/****************** NbShapes ******************/
		/**** md5 signature: ea90d1514db96ad18becf0e04a33abf6 ****/
		%feature("compactdefaultargs") NbShapes;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbShapes;
		Standard_Integer NbShapes();

		/****************** NbSurfaces ******************/
		/**** md5 signature: fbc438e1ec12b28d849e6d0aeb23caaa ****/
		%feature("compactdefaultargs") NbSurfaces;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbSurfaces;
		Standard_Integer NbSurfaces();

		/****************** NewSurface ******************/
		/**** md5 signature: 7add5b9199c86c93a7ee2ecb3009e02b ****/
		%feature("compactdefaultargs") NewSurface;
		%feature("autodoc", "No available documentation.

Parameters
----------
F: TopoDS_Shape

Returns
-------
opencascade::handle<Geom_Surface>
") NewSurface;
		const opencascade::handle<Geom_Surface> & NewSurface(const TopoDS_Shape & F);

		/****************** Point ******************/
		/**** md5 signature: 5b8c65793f4550a005f74995c521586b ****/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Returns the point of index <i>.

Parameters
----------
I: int

Returns
-------
TopOpeBRepDS_Point
") Point;
		const TopOpeBRepDS_Point & Point(const Standard_Integer I);

		/****************** PointInterferences ******************/
		/**** md5 signature: 06b954c921d0d1e460c381ddbe58ac66 ****/
		%feature("compactdefaultargs") PointInterferences;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: int

Returns
-------
TopOpeBRepDS_ListOfInterference
") PointInterferences;
		const TopOpeBRepDS_ListOfInterference & PointInterferences(const Standard_Integer I);

		/****************** RemoveCurve ******************/
		/**** md5 signature: 195425abb6b81c28c9baa5e9f38c8649 ****/
		%feature("compactdefaultargs") RemoveCurve;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: int

Returns
-------
None
") RemoveCurve;
		void RemoveCurve(const Standard_Integer I);

		/****************** RemovePoint ******************/
		/**** md5 signature: c7bf0e4af319953519a4144b346ae43d ****/
		%feature("compactdefaultargs") RemovePoint;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: int

Returns
-------
None
") RemovePoint;
		void RemovePoint(const Standard_Integer I);

		/****************** RemoveShapeInterference ******************/
		/**** md5 signature: 412e6543d3fd7929a60f32d7a69d67f2 ****/
		%feature("compactdefaultargs") RemoveShapeInterference;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape
I: TopOpeBRepDS_Interference

Returns
-------
None
") RemoveShapeInterference;
		void RemoveShapeInterference(const TopoDS_Shape & S, const opencascade::handle<TopOpeBRepDS_Interference> & I);

		/****************** RemoveShapeSameDomain ******************/
		/**** md5 signature: f50e763fe94ec1790029ac6e97357534 ****/
		%feature("compactdefaultargs") RemoveShapeSameDomain;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape
SSD: TopoDS_Shape

Returns
-------
None
") RemoveShapeSameDomain;
		void RemoveShapeSameDomain(const TopoDS_Shape & S, const TopoDS_Shape & SSD);

		/****************** RemoveSurface ******************/
		/**** md5 signature: a69795b89612c323bca1cbc3d673efe5 ****/
		%feature("compactdefaultargs") RemoveSurface;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: int

Returns
-------
None
") RemoveSurface;
		void RemoveSurface(const Standard_Integer I);

		/****************** SameDomainInd ******************/
		/**** md5 signature: f56179352f4117ca69ca4087b1b0f5f5 ****/
		%feature("compactdefaultargs") SameDomainInd;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: int

Returns
-------
int
") SameDomainInd;
		Standard_Integer SameDomainInd(const Standard_Integer I);

		/****************** SameDomainInd ******************/
		/**** md5 signature: 6f0a88aed570b81816061ae0eb4d1e82 ****/
		%feature("compactdefaultargs") SameDomainInd;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape

Returns
-------
int
") SameDomainInd;
		Standard_Integer SameDomainInd(const TopoDS_Shape & S);

		/****************** SameDomainInd ******************/
		/**** md5 signature: cad8376b20aa19813e52027a34b83505 ****/
		%feature("compactdefaultargs") SameDomainInd;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: int
Ind: int

Returns
-------
None
") SameDomainInd;
		void SameDomainInd(const Standard_Integer I, const Standard_Integer Ind);

		/****************** SameDomainInd ******************/
		/**** md5 signature: e59bc7a08b6820b92c68b6007a300c04 ****/
		%feature("compactdefaultargs") SameDomainInd;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape
Ind: int

Returns
-------
None
") SameDomainInd;
		void SameDomainInd(const TopoDS_Shape & S, const Standard_Integer Ind);

		/****************** SameDomainOri ******************/
		/**** md5 signature: e17e474da5df36106cb5b63a342b0de1 ****/
		%feature("compactdefaultargs") SameDomainOri;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: int

Returns
-------
TopOpeBRepDS_Config
") SameDomainOri;
		TopOpeBRepDS_Config SameDomainOri(const Standard_Integer I);

		/****************** SameDomainOri ******************/
		/**** md5 signature: f5745d68e6f11784571b9b419388de6b ****/
		%feature("compactdefaultargs") SameDomainOri;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape

Returns
-------
TopOpeBRepDS_Config
") SameDomainOri;
		TopOpeBRepDS_Config SameDomainOri(const TopoDS_Shape & S);

		/****************** SameDomainOri ******************/
		/**** md5 signature: 5feee33f07dec4e9f64d583aeb283a57 ****/
		%feature("compactdefaultargs") SameDomainOri;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: int
Ori: TopOpeBRepDS_Config

Returns
-------
None
") SameDomainOri;
		void SameDomainOri(const Standard_Integer I, const TopOpeBRepDS_Config Ori);

		/****************** SameDomainOri ******************/
		/**** md5 signature: 4e62c89b45488901580ee57713832fc7 ****/
		%feature("compactdefaultargs") SameDomainOri;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape
Ori: TopOpeBRepDS_Config

Returns
-------
None
") SameDomainOri;
		void SameDomainOri(const TopoDS_Shape & S, const TopOpeBRepDS_Config Ori);

		/****************** SameDomainRef ******************/
		/**** md5 signature: d905234925d75a0cf96827306b66a6f8 ****/
		%feature("compactdefaultargs") SameDomainRef;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: int

Returns
-------
int
") SameDomainRef;
		Standard_Integer SameDomainRef(const Standard_Integer I);

		/****************** SameDomainRef ******************/
		/**** md5 signature: 526031793d8c10151b323146cd2137b6 ****/
		%feature("compactdefaultargs") SameDomainRef;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape

Returns
-------
int
") SameDomainRef;
		Standard_Integer SameDomainRef(const TopoDS_Shape & S);

		/****************** SameDomainRef ******************/
		/**** md5 signature: e2c1f51d8216243aee8e9ca18e5ee030 ****/
		%feature("compactdefaultargs") SameDomainRef;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: int
Ref: int

Returns
-------
None
") SameDomainRef;
		void SameDomainRef(const Standard_Integer I, const Standard_Integer Ref);

		/****************** SameDomainRef ******************/
		/**** md5 signature: c4971ef3bef119a1854e73f0db5bd833 ****/
		%feature("compactdefaultargs") SameDomainRef;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape
Ref: int

Returns
-------
None
") SameDomainRef;
		void SameDomainRef(const TopoDS_Shape & S, const Standard_Integer Ref);

		/****************** SectionEdge ******************/
		/**** md5 signature: ec2665bd1079cd0f52a4e5419be32faa ****/
		%feature("compactdefaultargs") SectionEdge;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: int
FindKeep: bool,optional
	default value is Standard_True

Returns
-------
TopoDS_Edge
") SectionEdge;
		const TopoDS_Edge SectionEdge(const Standard_Integer I, const Standard_Boolean FindKeep = Standard_True);

		/****************** SectionEdge ******************/
		/**** md5 signature: 4fe69fdd3fecc294f0813b9064c01390 ****/
		%feature("compactdefaultargs") SectionEdge;
		%feature("autodoc", "No available documentation.

Parameters
----------
E: TopoDS_Edge
FindKeep: bool,optional
	default value is Standard_True

Returns
-------
int
") SectionEdge;
		Standard_Integer SectionEdge(const TopoDS_Edge & E, const Standard_Boolean FindKeep = Standard_True);

		/****************** SetNewSurface ******************/
		/**** md5 signature: d9f8b56466b71f82a0c5d38767680a12 ****/
		%feature("compactdefaultargs") SetNewSurface;
		%feature("autodoc", "No available documentation.

Parameters
----------
F: TopoDS_Shape
S: Geom_Surface

Returns
-------
None
") SetNewSurface;
		void SetNewSurface(const TopoDS_Shape & F, const opencascade::handle<Geom_Surface> & S);

		/****************** Shape ******************/
		/**** md5 signature: 2a9802512a4fc686052467294ae73114 ****/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "Returns the shape of index i stored in the map myshapes, accessing a list of interference.

Parameters
----------
I: int
FindKeep: bool,optional
	default value is Standard_True

Returns
-------
TopoDS_Shape
") Shape;
		const TopoDS_Shape Shape(const Standard_Integer I, const Standard_Boolean FindKeep = Standard_True);

		/****************** Shape ******************/
		/**** md5 signature: f7e95ef33c87fbd9433c9833cd48ad97 ****/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "Returns the index of shape <s> stored in the map myshapes, accessing a list of interference. returns 0 if <s> is not in the map.

Parameters
----------
S: TopoDS_Shape
FindKeep: bool,optional
	default value is Standard_True

Returns
-------
int
") Shape;
		Standard_Integer Shape(const TopoDS_Shape & S, const Standard_Boolean FindKeep = Standard_True);

		/****************** ShapeInterferences ******************/
		/**** md5 signature: c868e708a42528c47a0ca2a4c3f6a0e4 ****/
		%feature("compactdefaultargs") ShapeInterferences;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape
FindKeep: bool,optional
	default value is Standard_True

Returns
-------
TopOpeBRepDS_ListOfInterference
") ShapeInterferences;
		const TopOpeBRepDS_ListOfInterference & ShapeInterferences(const TopoDS_Shape & S, const Standard_Boolean FindKeep = Standard_True);

		/****************** ShapeInterferences ******************/
		/**** md5 signature: ece9e59140b26b1432b40d26cf22bb47 ****/
		%feature("compactdefaultargs") ShapeInterferences;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: int
FindKeep: bool,optional
	default value is Standard_True

Returns
-------
TopOpeBRepDS_ListOfInterference
") ShapeInterferences;
		const TopOpeBRepDS_ListOfInterference & ShapeInterferences(const Standard_Integer I, const Standard_Boolean FindKeep = Standard_True);

		/****************** ShapeSameDomain ******************/
		/**** md5 signature: 05999893fcaefdaecc7122403e98d5cc ****/
		%feature("compactdefaultargs") ShapeSameDomain;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape

Returns
-------
TopTools_ListOfShape
") ShapeSameDomain;
		const TopTools_ListOfShape & ShapeSameDomain(const TopoDS_Shape & S);

		/****************** ShapeSameDomain ******************/
		/**** md5 signature: 5c698556b709903375c4c06d616536f7 ****/
		%feature("compactdefaultargs") ShapeSameDomain;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: int

Returns
-------
TopTools_ListOfShape
") ShapeSameDomain;
		const TopTools_ListOfShape & ShapeSameDomain(const Standard_Integer I);

		/****************** Surface ******************/
		/**** md5 signature: 0fa398e726541e213860705286d521cb ****/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "Returns the surface of index <i>.

Parameters
----------
I: int

Returns
-------
TopOpeBRepDS_Surface
") Surface;
		const TopOpeBRepDS_Surface & Surface(const Standard_Integer I);

		/****************** SurfaceInterferences ******************/
		/**** md5 signature: 732d2b836e88fd503fa982b880b0a0eb ****/
		%feature("compactdefaultargs") SurfaceInterferences;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: int

Returns
-------
TopOpeBRepDS_ListOfInterference
") SurfaceInterferences;
		const TopOpeBRepDS_ListOfInterference & SurfaceInterferences(const Standard_Integer I);

		/****************** UnfillShapesSameDomain ******************/
		/**** md5 signature: 905209a2e684aadc3d1ca6d75dc22261 ****/
		%feature("compactdefaultargs") UnfillShapesSameDomain;
		%feature("autodoc", "No available documentation.

Parameters
----------
S1: TopoDS_Shape
S2: TopoDS_Shape

Returns
-------
None
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
		%feature("autodoc", "No available documentation.

Parameters
----------
HDS: TopOpeBRepDS_HDataStructure

Returns
-------
None
") TopOpeBRepDS_Dumper;
		 TopOpeBRepDS_Dumper(const opencascade::handle<TopOpeBRepDS_HDataStructure> & HDS);

		/****************** SDumpRefOri ******************/
		/**** md5 signature: 8e6b49d64bdb0a06e4b412da92478a80 ****/
		%feature("compactdefaultargs") SDumpRefOri;
		%feature("autodoc", "No available documentation.

Parameters
----------
K: TopOpeBRepDS_Kind
I: int

Returns
-------
TCollection_AsciiString
") SDumpRefOri;
		TCollection_AsciiString SDumpRefOri(const TopOpeBRepDS_Kind K, const Standard_Integer I);

		/****************** SDumpRefOri ******************/
		/**** md5 signature: 2de056c6b87cd98b2ce3ade55eccba16 ****/
		%feature("compactdefaultargs") SDumpRefOri;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape

Returns
-------
TCollection_AsciiString
") SDumpRefOri;
		TCollection_AsciiString SDumpRefOri(const TopoDS_Shape & S);

		/****************** SPrintShape ******************/
		/**** md5 signature: b2cb96d441d854b1d0f54190036738cc ****/
		%feature("compactdefaultargs") SPrintShape;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: int

Returns
-------
TCollection_AsciiString
") SPrintShape;
		TCollection_AsciiString SPrintShape(const Standard_Integer I);

		/****************** SPrintShape ******************/
		/**** md5 signature: 29aa3a0f30477ccf992e00d9f2c4ade9 ****/
		%feature("compactdefaultargs") SPrintShape;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape

Returns
-------
TCollection_AsciiString
") SPrintShape;
		TCollection_AsciiString SPrintShape(const TopoDS_Shape & S);

		/****************** SPrintShapeRefOri ******************/
		/**** md5 signature: b87193ebb49975a024fdbcf4acf5737e ****/
		%feature("compactdefaultargs") SPrintShapeRefOri;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape
B: TCollection_AsciiString,optional
	default value is ""

Returns
-------
TCollection_AsciiString
") SPrintShapeRefOri;
		TCollection_AsciiString SPrintShapeRefOri(const TopoDS_Shape & S, const TCollection_AsciiString & B = "");

		/****************** SPrintShapeRefOri ******************/
		/**** md5 signature: 54da13540540d3a734590ba936839e14 ****/
		%feature("compactdefaultargs") SPrintShapeRefOri;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: TopTools_ListOfShape
B: TCollection_AsciiString,optional
	default value is ""

Returns
-------
TCollection_AsciiString
") SPrintShapeRefOri;
		TCollection_AsciiString SPrintShapeRefOri(const TopTools_ListOfShape & L, const TCollection_AsciiString & B = "");

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
		%feature("autodoc", "No available documentation.

Parameters
----------
HDS: TopOpeBRepDS_HDataStructure

Returns
-------
None
") TopOpeBRepDS_EIR;
		 TopOpeBRepDS_EIR(const opencascade::handle<TopOpeBRepDS_HDataStructure> & HDS);

		/****************** ProcessEdgeInterferences ******************/
		/**** md5 signature: fdb0a9346715ac3d5b07add0cbfe07d8 ****/
		%feature("compactdefaultargs") ProcessEdgeInterferences;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") ProcessEdgeInterferences;
		void ProcessEdgeInterferences();

		/****************** ProcessEdgeInterferences ******************/
		/**** md5 signature: acd902e6f368f098486cef5b71d435ec ****/
		%feature("compactdefaultargs") ProcessEdgeInterferences;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: int

Returns
-------
None
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
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopOpeBRepDS_Edge3dInterferenceTool;
		 TopOpeBRepDS_Edge3dInterferenceTool();

		/****************** Add ******************/
		/**** md5 signature: f5412b5c46c5e401b7e23d3bbaf85690 ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "No available documentation.

Parameters
----------
Eref: TopoDS_Shape
E: TopoDS_Shape
F: TopoDS_Shape
I: TopOpeBRepDS_Interference

Returns
-------
None
") Add;
		void Add(const TopoDS_Shape & Eref, const TopoDS_Shape & E, const TopoDS_Shape & F, const opencascade::handle<TopOpeBRepDS_Interference> & I);

		/****************** Init ******************/
		/**** md5 signature: bd799a083bd15005a62ec114ed5690e5 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
Eref: TopoDS_Shape
E: TopoDS_Shape
F: TopoDS_Shape
I: TopOpeBRepDS_Interference

Returns
-------
None
") Init;
		void Init(const TopoDS_Shape & Eref, const TopoDS_Shape & E, const TopoDS_Shape & F, const opencascade::handle<TopOpeBRepDS_Interference> & I);

		/****************** InitPointVertex ******************/
		/**** md5 signature: cc467f069475b40c868db51fa15b6e4f ****/
		%feature("compactdefaultargs") InitPointVertex;
		%feature("autodoc", "No available documentation.

Parameters
----------
IsVertex: int
VonOO: TopoDS_Shape

Returns
-------
None
") InitPointVertex;
		void InitPointVertex(const Standard_Integer IsVertex, const TopoDS_Shape & VonOO);

		/****************** Transition ******************/
		/**** md5 signature: cddcef230eeaaa0ab8b7f8b429bec838 ****/
		%feature("compactdefaultargs") Transition;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: TopOpeBRepDS_Interference

Returns
-------
None
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
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopOpeBRepDS_EdgeInterferenceTool;
		 TopOpeBRepDS_EdgeInterferenceTool();

		/****************** Add ******************/
		/**** md5 signature: 984a46bb46b06bb362c9533fee8aecbf ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "No available documentation.

Parameters
----------
E: TopoDS_Shape
V: TopoDS_Shape
I: TopOpeBRepDS_Interference

Returns
-------
None
") Add;
		void Add(const TopoDS_Shape & E, const TopoDS_Shape & V, const opencascade::handle<TopOpeBRepDS_Interference> & I);

		/****************** Add ******************/
		/**** md5 signature: 57a3df2710a6e43e79ce80fcd3aeb88e ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "No available documentation.

Parameters
----------
E: TopoDS_Shape
P: TopOpeBRepDS_Point
I: TopOpeBRepDS_Interference

Returns
-------
None
") Add;
		void Add(const TopoDS_Shape & E, const TopOpeBRepDS_Point & P, const opencascade::handle<TopOpeBRepDS_Interference> & I);

		/****************** Init ******************/
		/**** md5 signature: 1e2831de8f226d054fe6dfca5fa05068 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
E: TopoDS_Shape
I: TopOpeBRepDS_Interference

Returns
-------
None
") Init;
		void Init(const TopoDS_Shape & E, const opencascade::handle<TopOpeBRepDS_Interference> & I);

		/****************** Transition ******************/
		/**** md5 signature: cddcef230eeaaa0ab8b7f8b429bec838 ****/
		%feature("compactdefaultargs") Transition;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: TopOpeBRepDS_Interference

Returns
-------
None
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
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopOpeBRepDS_Explorer;
		 TopOpeBRepDS_Explorer();

		/****************** TopOpeBRepDS_Explorer ******************/
		/**** md5 signature: e366addb18ef341ba9e3f059d5ff2398 ****/
		%feature("compactdefaultargs") TopOpeBRepDS_Explorer;
		%feature("autodoc", "No available documentation.

Parameters
----------
HDS: TopOpeBRepDS_HDataStructure
T: TopAbs_ShapeEnum,optional
	default value is TopAbs_SHAPE
findkeep: bool,optional
	default value is Standard_True

Returns
-------
None
") TopOpeBRepDS_Explorer;
		 TopOpeBRepDS_Explorer(const opencascade::handle<TopOpeBRepDS_HDataStructure> & HDS, const TopAbs_ShapeEnum T = TopAbs_SHAPE, const Standard_Boolean findkeep = Standard_True);

		/****************** Current ******************/
		/**** md5 signature: b191bf677bf7b52144f20d0821ea8f06 ****/
		%feature("compactdefaultargs") Current;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Shape
") Current;
		const TopoDS_Shape Current();

		/****************** Edge ******************/
		/**** md5 signature: be590cff987799d8b7c28083399d0e9f ****/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Edge
") Edge;
		const TopoDS_Edge Edge();

		/****************** Face ******************/
		/**** md5 signature: 91e216ebeb76e55c73eb9e179241a6ff ****/
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Face
") Face;
		const TopoDS_Face Face();

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
		/**** md5 signature: 6fde6f7a8628097003212c0a7065c5e6 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
HDS: TopOpeBRepDS_HDataStructure
T: TopAbs_ShapeEnum,optional
	default value is TopAbs_SHAPE
findkeep: bool,optional
	default value is Standard_True

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TopOpeBRepDS_HDataStructure> & HDS, const TopAbs_ShapeEnum T = TopAbs_SHAPE, const Standard_Boolean findkeep = Standard_True);

		/****************** More ******************/
		/**** md5 signature: 6f6e915c9a3dca758c059d9e8af02dff ****/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") More;
		Standard_Boolean More();

		/****************** Next ******************/
		/**** md5 signature: f35c0df5f1d7c877986db18081404532 ****/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Next;
		void Next();

		/****************** Type ******************/
		/**** md5 signature: 3f27a65186b8053d282c2c0d8c4513b8 ****/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "No available documentation.

Returns
-------
TopAbs_ShapeEnum
") Type;
		TopAbs_ShapeEnum Type();

		/****************** Vertex ******************/
		/**** md5 signature: 84212ff79cd7d64cd0ebfa6f17214e90 ****/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Vertex
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
		%feature("autodoc", "No available documentation.

Parameters
----------
HDS: TopOpeBRepDS_HDataStructure

Returns
-------
None
") TopOpeBRepDS_FIR;
		 TopOpeBRepDS_FIR(const opencascade::handle<TopOpeBRepDS_HDataStructure> & HDS);

		/****************** ProcessFaceInterferences ******************/
		/**** md5 signature: 22ea874d673770f31f98a3c38885bd6a ****/
		%feature("compactdefaultargs") ProcessFaceInterferences;
		%feature("autodoc", "No available documentation.

Parameters
----------
M: TopOpeBRepDS_DataMapOfShapeListOfShapeOn1State

Returns
-------
None
") ProcessFaceInterferences;
		void ProcessFaceInterferences(const TopOpeBRepDS_DataMapOfShapeListOfShapeOn1State & M);

		/****************** ProcessFaceInterferences ******************/
		/**** md5 signature: f498bfbdbef6b2b2c5c6887b29314d97 ****/
		%feature("compactdefaultargs") ProcessFaceInterferences;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: int
M: TopOpeBRepDS_DataMapOfShapeListOfShapeOn1State

Returns
-------
None
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
		%feature("autodoc", "No available documentation.

Parameters
----------
P: TopOpeBRepDS_PDataStructure

Returns
-------
None
") TopOpeBRepDS_FaceInterferenceTool;
		 TopOpeBRepDS_FaceInterferenceTool(const TopOpeBRepDS_PDataStructure & P);

		/****************** Add ******************/
		/**** md5 signature: 850f900a261e084982a4ff2f1d4e03e9 ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Eisnew = true if e is a new edge built on edge i->geometry() false if e is shape <=> i->geometry().

Parameters
----------
FI: TopoDS_Shape
F: TopoDS_Shape
E: TopoDS_Shape
Eisnew: bool
I: TopOpeBRepDS_Interference

Returns
-------
None
") Add;
		void Add(const TopoDS_Shape & FI, const TopoDS_Shape & F, const TopoDS_Shape & E, const Standard_Boolean Eisnew, const opencascade::handle<TopOpeBRepDS_Interference> & I);

		/****************** Add ******************/
		/**** md5 signature: 47cc6602993a12c2438dc9b1d0e36a75 ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "No available documentation.

Parameters
----------
E: TopoDS_Shape
C: TopOpeBRepDS_Curve
I: TopOpeBRepDS_Interference

Returns
-------
None
") Add;
		void Add(const TopoDS_Shape & E, const TopOpeBRepDS_Curve & C, const opencascade::handle<TopOpeBRepDS_Interference> & I);

		/****************** GetEdgePntPar ******************/
		/**** md5 signature: f23d64f925254b1a87ef0e152423c9f7 ****/
		%feature("compactdefaultargs") GetEdgePntPar;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: gp_Pnt

Returns
-------
par: float
") GetEdgePntPar;
		void GetEdgePntPar(gp_Pnt & P, Standard_Real &OutValue);

		/****************** Init ******************/
		/**** md5 signature: 4fdbc4d55bb6b5d8955adabdcd7f8921 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Eisnew = true if e is a new edge built on edge i->geometry() false if e is shape <=> i->geometry().

Parameters
----------
FI: TopoDS_Shape
E: TopoDS_Shape
Eisnew: bool
I: TopOpeBRepDS_Interference

Returns
-------
None
") Init;
		void Init(const TopoDS_Shape & FI, const TopoDS_Shape & E, const Standard_Boolean Eisnew, const opencascade::handle<TopOpeBRepDS_Interference> & I);

		/****************** IsEdgePntParDef ******************/
		/**** md5 signature: 1396dc1709803c83163f56bf7cbfcc5a ****/
		%feature("compactdefaultargs") IsEdgePntParDef;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsEdgePntParDef;
		Standard_Boolean IsEdgePntParDef();

		/****************** SetEdgePntPar ******************/
		/**** md5 signature: 7ab4d2ac72a72d51d433c55bbba758c0 ****/
		%feature("compactdefaultargs") SetEdgePntPar;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: gp_Pnt
par: float

Returns
-------
None
") SetEdgePntPar;
		void SetEdgePntPar(const gp_Pnt & P, const Standard_Real par);

		/****************** Transition ******************/
		/**** md5 signature: cddcef230eeaaa0ab8b7f8b429bec838 ****/
		%feature("compactdefaultargs") Transition;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: TopOpeBRepDS_Interference

Returns
-------
None
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
		%feature("autodoc", "No available documentation.

Parameters
----------
HDS: TopOpeBRepDS_HDataStructure
pClassif: TopOpeBRepTool_PShapeClassifier,optional
	default value is 0

Returns
-------
None
") TopOpeBRepDS_Filter;
		 TopOpeBRepDS_Filter(const opencascade::handle<TopOpeBRepDS_HDataStructure> & HDS, const TopOpeBRepTool_PShapeClassifier & pClassif = 0);

		/****************** ProcessCurveInterferences ******************/
		/**** md5 signature: 1465b61e58c569ca8b3a40b168fef6ef ****/
		%feature("compactdefaultargs") ProcessCurveInterferences;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") ProcessCurveInterferences;
		void ProcessCurveInterferences();

		/****************** ProcessCurveInterferences ******************/
		/**** md5 signature: 9e91fd561d91f3a2e8ba5d6fef022eaf ****/
		%feature("compactdefaultargs") ProcessCurveInterferences;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: int

Returns
-------
None
") ProcessCurveInterferences;
		void ProcessCurveInterferences(const Standard_Integer I);

		/****************** ProcessEdgeInterferences ******************/
		/**** md5 signature: fdb0a9346715ac3d5b07add0cbfe07d8 ****/
		%feature("compactdefaultargs") ProcessEdgeInterferences;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") ProcessEdgeInterferences;
		void ProcessEdgeInterferences();

		/****************** ProcessEdgeInterferences ******************/
		/**** md5 signature: acd902e6f368f098486cef5b71d435ec ****/
		%feature("compactdefaultargs") ProcessEdgeInterferences;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: int

Returns
-------
None
") ProcessEdgeInterferences;
		void ProcessEdgeInterferences(const Standard_Integer I);

		/****************** ProcessFaceInterferences ******************/
		/**** md5 signature: 8e2cf91d4fa889e880274c3f50d117c2 ****/
		%feature("compactdefaultargs") ProcessFaceInterferences;
		%feature("autodoc", "No available documentation.

Parameters
----------
MEsp: TopOpeBRepDS_DataMapOfShapeListOfShapeOn1State

Returns
-------
None
") ProcessFaceInterferences;
		void ProcessFaceInterferences(const TopOpeBRepDS_DataMapOfShapeListOfShapeOn1State & MEsp);

		/****************** ProcessFaceInterferences ******************/
		/**** md5 signature: e5aa50a62588b5d67aa50f847ca70ba7 ****/
		%feature("compactdefaultargs") ProcessFaceInterferences;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: int
MEsp: TopOpeBRepDS_DataMapOfShapeListOfShapeOn1State

Returns
-------
None
") ProcessFaceInterferences;
		void ProcessFaceInterferences(const Standard_Integer I, const TopOpeBRepDS_DataMapOfShapeListOfShapeOn1State & MEsp);

		/****************** ProcessInterferences ******************/
		/**** md5 signature: 03ecfa694ab2b8c0bb984407262d748c ****/
		%feature("compactdefaultargs") ProcessInterferences;
		%feature("autodoc", "No available documentation.

Returns
-------
None
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
		%feature("autodoc", "No available documentation.

Parameters
----------
HDS: TopOpeBRepDS_HDataStructure

Returns
-------
None
") TopOpeBRepDS_GapFiller;
		 TopOpeBRepDS_GapFiller(const opencascade::handle<TopOpeBRepDS_HDataStructure> & HDS);

		/****************** AddPointsOnConnexShape ******************/
		/**** md5 signature: a1a33da8601ba47e27ee7deae1184771 ****/
		%feature("compactdefaultargs") AddPointsOnConnexShape;
		%feature("autodoc", "Methodes pour reduire la liste des points qui peuvent correspondre a une point donne.

Parameters
----------
F: TopoDS_Shape
LI: TopOpeBRepDS_ListOfInterference

Returns
-------
None
") AddPointsOnConnexShape;
		void AddPointsOnConnexShape(const TopoDS_Shape & F, const TopOpeBRepDS_ListOfInterference & LI);

		/****************** AddPointsOnShape ******************/
		/**** md5 signature: c6339e54001bd6cc3323655b5757d5d3 ****/
		%feature("compactdefaultargs") AddPointsOnShape;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape
LI: TopOpeBRepDS_ListOfInterference

Returns
-------
None
") AddPointsOnShape;
		void AddPointsOnShape(const TopoDS_Shape & S, TopOpeBRepDS_ListOfInterference & LI);

		/****************** BuildNewGeometries ******************/
		/**** md5 signature: 2bcc3a668d4ba8f8140566f3c713941d ****/
		%feature("compactdefaultargs") BuildNewGeometries;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") BuildNewGeometries;
		void BuildNewGeometries();

		/****************** CheckConnexity ******************/
		/**** md5 signature: c663927441caf5a2bdb02a0d53cddde0 ****/
		%feature("compactdefaultargs") CheckConnexity;
		%feature("autodoc", "Enchaine les sections via les points d'interferences deja associe; renvoit dans <l> les points extremites des lignes. methodes pour construire la liste des points qui peuvent correspondre a une point donne.

Parameters
----------
LI: TopOpeBRepDS_ListOfInterference

Returns
-------
bool
") CheckConnexity;
		Standard_Boolean CheckConnexity(TopOpeBRepDS_ListOfInterference & LI);

		/****************** FilterByEdge ******************/
		/**** md5 signature: 1c416ae069d10e8f5408d34ef6f14063 ****/
		%feature("compactdefaultargs") FilterByEdge;
		%feature("autodoc", "No available documentation.

Parameters
----------
E: TopoDS_Edge
LI: TopOpeBRepDS_ListOfInterference

Returns
-------
None
") FilterByEdge;
		void FilterByEdge(const TopoDS_Edge & E, TopOpeBRepDS_ListOfInterference & LI);

		/****************** FilterByFace ******************/
		/**** md5 signature: b071ee09f7ff2dec464933e3f78f23c0 ****/
		%feature("compactdefaultargs") FilterByFace;
		%feature("autodoc", "No available documentation.

Parameters
----------
F: TopoDS_Face
LI: TopOpeBRepDS_ListOfInterference

Returns
-------
None
") FilterByFace;
		void FilterByFace(const TopoDS_Face & F, TopOpeBRepDS_ListOfInterference & LI);

		/****************** FilterByIncidentDistance ******************/
		/**** md5 signature: a20273e832ac0e3a103a3cc20b44dbce ****/
		%feature("compactdefaultargs") FilterByIncidentDistance;
		%feature("autodoc", "No available documentation.

Parameters
----------
F: TopoDS_Face
I: TopOpeBRepDS_Interference
LI: TopOpeBRepDS_ListOfInterference

Returns
-------
None
") FilterByIncidentDistance;
		void FilterByIncidentDistance(const TopoDS_Face & F, const opencascade::handle<TopOpeBRepDS_Interference> & I, TopOpeBRepDS_ListOfInterference & LI);

		/****************** FindAssociatedPoints ******************/
		/**** md5 signature: 3a1e8b7f77ae03ac217b2d9432f3b884 ****/
		%feature("compactdefaultargs") FindAssociatedPoints;
		%feature("autodoc", "Recherche parmi l'ensemble des points d'interference la liste <li> des points qui correspondent au point d'indice <index>.

Parameters
----------
I: TopOpeBRepDS_Interference
LI: TopOpeBRepDS_ListOfInterference

Returns
-------
None
") FindAssociatedPoints;
		void FindAssociatedPoints(const opencascade::handle<TopOpeBRepDS_Interference> & I, TopOpeBRepDS_ListOfInterference & LI);

		/****************** IsOnEdge ******************/
		/**** md5 signature: 601084fd5330ff669b8e8a168e3849b9 ****/
		%feature("compactdefaultargs") IsOnEdge;
		%feature("autodoc", "Return true si i ou une de ses representaions a pour support <e>. methodes de reconstructions des geometries des point et des courbes de section.

Parameters
----------
I: TopOpeBRepDS_Interference
E: TopoDS_Edge

Returns
-------
bool
") IsOnEdge;
		Standard_Boolean IsOnEdge(const opencascade::handle<TopOpeBRepDS_Interference> & I, const TopoDS_Edge & E);

		/****************** IsOnFace ******************/
		/**** md5 signature: 70f5ecde5396a914e5538d3bfb583667 ****/
		%feature("compactdefaultargs") IsOnFace;
		%feature("autodoc", "Return true si i a ete obtenu par une intersection avec <f>.

Parameters
----------
I: TopOpeBRepDS_Interference
F: TopoDS_Face

Returns
-------
bool
") IsOnFace;
		Standard_Boolean IsOnFace(const opencascade::handle<TopOpeBRepDS_Interference> & I, const TopoDS_Face & F);

		/****************** Perform ******************/
		/**** md5 signature: c04b01412cba7220c024b5eb4532697f ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Perform;
		void Perform();

		/****************** ReBuildGeom ******************/
		/**** md5 signature: 739221b80bfd83fbdc3d57147fd38d81 ****/
		%feature("compactdefaultargs") ReBuildGeom;
		%feature("autodoc", "No available documentation.

Parameters
----------
I1: TopOpeBRepDS_Interference
Done: TColStd_MapOfInteger

Returns
-------
None
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
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopOpeBRepDS_GapTool;
		 TopOpeBRepDS_GapTool();

		/****************** TopOpeBRepDS_GapTool ******************/
		/**** md5 signature: bbdcd383be0fc32ea4fde576950b3a17 ****/
		%feature("compactdefaultargs") TopOpeBRepDS_GapTool;
		%feature("autodoc", "No available documentation.

Parameters
----------
HDS: TopOpeBRepDS_HDataStructure

Returns
-------
None
") TopOpeBRepDS_GapTool;
		 TopOpeBRepDS_GapTool(const opencascade::handle<TopOpeBRepDS_HDataStructure> & HDS);

		/****************** ChangeSameInterferences ******************/
		/**** md5 signature: 10ff921a613b395592d9493ffc88126a ****/
		%feature("compactdefaultargs") ChangeSameInterferences;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: TopOpeBRepDS_Interference

Returns
-------
TopOpeBRepDS_ListOfInterference
") ChangeSameInterferences;
		TopOpeBRepDS_ListOfInterference & ChangeSameInterferences(const opencascade::handle<TopOpeBRepDS_Interference> & I);

		/****************** Curve ******************/
		/**** md5 signature: a13078d92284b0bd68397d6d4e9713bd ****/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: TopOpeBRepDS_Interference
C: TopOpeBRepDS_Curve

Returns
-------
bool
") Curve;
		Standard_Boolean Curve(const opencascade::handle<TopOpeBRepDS_Interference> & I, TopOpeBRepDS_Curve & C);

		/****************** EdgeSupport ******************/
		/**** md5 signature: f6132fe52c3cba50cbfc1e403330620b ****/
		%feature("compactdefaultargs") EdgeSupport;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: TopOpeBRepDS_Interference
E: TopoDS_Shape

Returns
-------
bool
") EdgeSupport;
		Standard_Boolean EdgeSupport(const opencascade::handle<TopOpeBRepDS_Interference> & I, TopoDS_Shape & E);

		/****************** FacesSupport ******************/
		/**** md5 signature: c5eb5d668cb3be5c28e849f094ed2ac8 ****/
		%feature("compactdefaultargs") FacesSupport;
		%feature("autodoc", "Return les faces qui ont genere la section origine de i.

Parameters
----------
I: TopOpeBRepDS_Interference
F1: TopoDS_Shape
F2: TopoDS_Shape

Returns
-------
bool
") FacesSupport;
		Standard_Boolean FacesSupport(const opencascade::handle<TopOpeBRepDS_Interference> & I, TopoDS_Shape & F1, TopoDS_Shape & F2);

		/****************** Init ******************/
		/**** md5 signature: 024bcfdbf9359dde26d22897154bd930 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
HDS: TopOpeBRepDS_HDataStructure

Returns
-------
None
") Init;
		void Init(const opencascade::handle<TopOpeBRepDS_HDataStructure> & HDS);

		/****************** Interferences ******************/
		/**** md5 signature: ac3f8088a166d46a6c4fb1c5cd2a2333 ****/
		%feature("compactdefaultargs") Interferences;
		%feature("autodoc", "No available documentation.

Parameters
----------
IndexPoint: int

Returns
-------
TopOpeBRepDS_ListOfInterference
") Interferences;
		const TopOpeBRepDS_ListOfInterference & Interferences(const Standard_Integer IndexPoint);

		/****************** ParameterOnEdge ******************/
		/**** md5 signature: fd91bba7a092a453fa1dfa4824d15a70 ****/
		%feature("compactdefaultargs") ParameterOnEdge;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: TopOpeBRepDS_Interference
E: TopoDS_Shape

Returns
-------
U: float
") ParameterOnEdge;
		Standard_Boolean ParameterOnEdge(const opencascade::handle<TopOpeBRepDS_Interference> & I, const TopoDS_Shape & E, Standard_Real &OutValue);

		/****************** SameInterferences ******************/
		/**** md5 signature: 16567c61420f685f242ddf5294ab3beb ****/
		%feature("compactdefaultargs") SameInterferences;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: TopOpeBRepDS_Interference

Returns
-------
TopOpeBRepDS_ListOfInterference
") SameInterferences;
		const TopOpeBRepDS_ListOfInterference & SameInterferences(const opencascade::handle<TopOpeBRepDS_Interference> & I);

		/****************** SetParameterOnEdge ******************/
		/**** md5 signature: 03ce205e073cc6cb39764a6c7302c52d ****/
		%feature("compactdefaultargs") SetParameterOnEdge;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: TopOpeBRepDS_Interference
E: TopoDS_Shape
U: float

Returns
-------
None
") SetParameterOnEdge;
		void SetParameterOnEdge(const opencascade::handle<TopOpeBRepDS_Interference> & I, const TopoDS_Shape & E, const Standard_Real U);

		/****************** SetPoint ******************/
		/**** md5 signature: 22cd93a3133fc7e6f2a7b9e6de48b67d ****/
		%feature("compactdefaultargs") SetPoint;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: TopOpeBRepDS_Interference
IndexPoint: int

Returns
-------
None
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
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopOpeBRepDS_GeometryData;
		 TopOpeBRepDS_GeometryData();

		/****************** TopOpeBRepDS_GeometryData ******************/
		/**** md5 signature: b9cc3a4e21ada85ace1f83e1a78be2ca ****/
		%feature("compactdefaultargs") TopOpeBRepDS_GeometryData;
		%feature("autodoc", "No available documentation.

Parameters
----------
Other: TopOpeBRepDS_GeometryData

Returns
-------
None
") TopOpeBRepDS_GeometryData;
		 TopOpeBRepDS_GeometryData(const TopOpeBRepDS_GeometryData & Other);

		/****************** AddInterference ******************/
		/**** md5 signature: 5f60096821134e0e43b7c194b77bc0aa ****/
		%feature("compactdefaultargs") AddInterference;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: TopOpeBRepDS_Interference

Returns
-------
None
") AddInterference;
		void AddInterference(const opencascade::handle<TopOpeBRepDS_Interference> & I);

		/****************** Assign ******************/
		/**** md5 signature: bd100538f072155057df1d5f3c464a3a ****/
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "No available documentation.

Parameters
----------
Other: TopOpeBRepDS_GeometryData

Returns
-------
None
") Assign;
		void Assign(const TopOpeBRepDS_GeometryData & Other);

		/****************** ChangeInterferences ******************/
		/**** md5 signature: 1c8cdb23abd41bd3fe65cba4df26ed63 ****/
		%feature("compactdefaultargs") ChangeInterferences;
		%feature("autodoc", "No available documentation.

Returns
-------
TopOpeBRepDS_ListOfInterference
") ChangeInterferences;
		TopOpeBRepDS_ListOfInterference & ChangeInterferences();

		/****************** Interferences ******************/
		/**** md5 signature: 237ed42d67b2b8b56ca50b69c4e86889 ****/
		%feature("compactdefaultargs") Interferences;
		%feature("autodoc", "No available documentation.

Returns
-------
TopOpeBRepDS_ListOfInterference
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
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopOpeBRepDS_Interference;
		 TopOpeBRepDS_Interference();

		/****************** TopOpeBRepDS_Interference ******************/
		/**** md5 signature: 57f654165021ed20333eaeb9cc568bda ****/
		%feature("compactdefaultargs") TopOpeBRepDS_Interference;
		%feature("autodoc", "No available documentation.

Parameters
----------
Transition: TopOpeBRepDS_Transition
SupportType: TopOpeBRepDS_Kind
Support: int
GeometryType: TopOpeBRepDS_Kind
Geometry: int

Returns
-------
None
") TopOpeBRepDS_Interference;
		 TopOpeBRepDS_Interference(const TopOpeBRepDS_Transition & Transition, const TopOpeBRepDS_Kind SupportType, const Standard_Integer Support, const TopOpeBRepDS_Kind GeometryType, const Standard_Integer Geometry);

		/****************** TopOpeBRepDS_Interference ******************/
		/**** md5 signature: 24dc11f4674be209a27cf60b2243e080 ****/
		%feature("compactdefaultargs") TopOpeBRepDS_Interference;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: TopOpeBRepDS_Interference

Returns
-------
None
") TopOpeBRepDS_Interference;
		 TopOpeBRepDS_Interference(const opencascade::handle<TopOpeBRepDS_Interference> & I);

		/****************** ChangeTransition ******************/
		/**** md5 signature: 1011287ae55d0acc146aae0c7dd5b16e ****/
		%feature("compactdefaultargs") ChangeTransition;
		%feature("autodoc", "No available documentation.

Returns
-------
TopOpeBRepDS_Transition
") ChangeTransition;
		TopOpeBRepDS_Transition & ChangeTransition();

		/****************** GKGSKS ******************/
		/**** md5 signature: 29fece9f7cd768c83761bb164d307d2f ****/
		%feature("compactdefaultargs") GKGSKS;
		%feature("autodoc", "Return geometrytype + geometry + supporttype + support.

Parameters
----------
GK: TopOpeBRepDS_Kind
SK: TopOpeBRepDS_Kind

Returns
-------
G: int
S: int
") GKGSKS;
		void GKGSKS(TopOpeBRepDS_Kind & GK, Standard_Integer &OutValue, TopOpeBRepDS_Kind & SK, Standard_Integer &OutValue);

		/****************** Geometry ******************/
		/**** md5 signature: 37e738c2b410a542f3698c2f6ed890de ****/
		%feature("compactdefaultargs") Geometry;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") Geometry;
		Standard_Integer Geometry();

		/****************** Geometry ******************/
		/**** md5 signature: 0f344c7bfc84ae146a04f63060ef6b22 ****/
		%feature("compactdefaultargs") Geometry;
		%feature("autodoc", "No available documentation.

Parameters
----------
G: int

Returns
-------
None
") Geometry;
		void Geometry(const Standard_Integer G);

		/****************** GeometryType ******************/
		/**** md5 signature: 844ce07794e9ce4fc9b3f97ebf69382f ****/
		%feature("compactdefaultargs") GeometryType;
		%feature("autodoc", "No available documentation.

Returns
-------
TopOpeBRepDS_Kind
") GeometryType;
		TopOpeBRepDS_Kind GeometryType();

		/****************** GeometryType ******************/
		/**** md5 signature: 698c8f46bf348e356e4f525e01faab03 ****/
		%feature("compactdefaultargs") GeometryType;
		%feature("autodoc", "No available documentation.

Parameters
----------
GT: TopOpeBRepDS_Kind

Returns
-------
None
") GeometryType;
		void GeometryType(const TopOpeBRepDS_Kind GT);

		/****************** HasSameGeometry ******************/
		/**** md5 signature: 9722ce3aeab1e2366ee5810c098d5ed3 ****/
		%feature("compactdefaultargs") HasSameGeometry;
		%feature("autodoc", "No available documentation.

Parameters
----------
Other: TopOpeBRepDS_Interference

Returns
-------
bool
") HasSameGeometry;
		Standard_Boolean HasSameGeometry(const opencascade::handle<TopOpeBRepDS_Interference> & Other);

		/****************** HasSameSupport ******************/
		/**** md5 signature: 87f6d4f0ee76b48cd98408e83cf2da3e ****/
		%feature("compactdefaultargs") HasSameSupport;
		%feature("autodoc", "No available documentation.

Parameters
----------
Other: TopOpeBRepDS_Interference

Returns
-------
bool
") HasSameSupport;
		Standard_Boolean HasSameSupport(const opencascade::handle<TopOpeBRepDS_Interference> & Other);

		/****************** SetGeometry ******************/
		/**** md5 signature: 15428bccd2287a10ef837e9e8f5eb21d ****/
		%feature("compactdefaultargs") SetGeometry;
		%feature("autodoc", "No available documentation.

Parameters
----------
GI: int

Returns
-------
None
") SetGeometry;
		void SetGeometry(const Standard_Integer GI);

		/****************** Support ******************/
		/**** md5 signature: 7aa624728551f1bd526b097364323e6c ****/
		%feature("compactdefaultargs") Support;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") Support;
		Standard_Integer Support();

		/****************** Support ******************/
		/**** md5 signature: 40fffd6992a1a134cd3c63bb788aba9a ****/
		%feature("compactdefaultargs") Support;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: int

Returns
-------
None
") Support;
		void Support(const Standard_Integer S);

		/****************** SupportType ******************/
		/**** md5 signature: 7133e5c87610c7bbd71b6f22b6e541eb ****/
		%feature("compactdefaultargs") SupportType;
		%feature("autodoc", "No available documentation.

Returns
-------
TopOpeBRepDS_Kind
") SupportType;
		TopOpeBRepDS_Kind SupportType();

		/****************** SupportType ******************/
		/**** md5 signature: 42aa9ca2bc4bdce738b125b385ecb19d ****/
		%feature("compactdefaultargs") SupportType;
		%feature("autodoc", "No available documentation.

Parameters
----------
ST: TopOpeBRepDS_Kind

Returns
-------
None
") SupportType;
		void SupportType(const TopOpeBRepDS_Kind ST);

		/****************** Transition ******************/
		/**** md5 signature: b5272cce68efc51cec1c0feca2f97771 ****/
		%feature("compactdefaultargs") Transition;
		%feature("autodoc", "No available documentation.

Returns
-------
TopOpeBRepDS_Transition
") Transition;
		const TopOpeBRepDS_Transition & Transition();

		/****************** Transition ******************/
		/**** md5 signature: 9d87175c97a5fdd5dd0051ebaa8ceb42 ****/
		%feature("compactdefaultargs") Transition;
		%feature("autodoc", "No available documentation.

Parameters
----------
T: TopOpeBRepDS_Transition

Returns
-------
None
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
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopOpeBRepDS_InterferenceIterator;
		 TopOpeBRepDS_InterferenceIterator();

		/****************** TopOpeBRepDS_InterferenceIterator ******************/
		/**** md5 signature: 8ed0f027e76b4565a73cb84db6c20802 ****/
		%feature("compactdefaultargs") TopOpeBRepDS_InterferenceIterator;
		%feature("autodoc", "Creates an iterator on the interference of list <l>.

Parameters
----------
L: TopOpeBRepDS_ListOfInterference

Returns
-------
None
") TopOpeBRepDS_InterferenceIterator;
		 TopOpeBRepDS_InterferenceIterator(const TopOpeBRepDS_ListOfInterference & L);

		/****************** ChangeIterator ******************/
		/**** md5 signature: 5a8a77a0345b10343cd11bd4937db862 ****/
		%feature("compactdefaultargs") ChangeIterator;
		%feature("autodoc", "No available documentation.

Returns
-------
TopOpeBRepDS_ListIteratorOfListOfInterference
") ChangeIterator;
		TopOpeBRepDS_ListIteratorOfListOfInterference & ChangeIterator();

		/****************** Geometry ******************/
		/**** md5 signature: 0f344c7bfc84ae146a04f63060ef6b22 ****/
		%feature("compactdefaultargs") Geometry;
		%feature("autodoc", "Define a condition on interference iteration process. interference must match the geometry <g>.

Parameters
----------
G: int

Returns
-------
None
") Geometry;
		void Geometry(const Standard_Integer G);

		/****************** GeometryKind ******************/
		/**** md5 signature: 7c24d25f53c83a2fe339cd9736091f36 ****/
		%feature("compactdefaultargs") GeometryKind;
		%feature("autodoc", "Define a condition on interference iteration process. interference must match the geometry kind <st>.

Parameters
----------
GK: TopOpeBRepDS_Kind

Returns
-------
None
") GeometryKind;
		void GeometryKind(const TopOpeBRepDS_Kind GK);

		/****************** Init ******************/
		/**** md5 signature: 7f5819da47cd75207e05c93d57cc56c6 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Re-initialize interference iteration process on the list of interference <l>. conditions are not modified.

Parameters
----------
L: TopOpeBRepDS_ListOfInterference

Returns
-------
None
") Init;
		void Init(const TopOpeBRepDS_ListOfInterference & L);

		/****************** Match ******************/
		/**** md5 signature: 3b22ed9ef0be8edf337a58574cb50ef5 ****/
		%feature("compactdefaultargs") Match;
		%feature("autodoc", "Reach for an interference matching the conditions (if defined).

Returns
-------
None
") Match;
		void Match();

		/****************** MatchInterference ******************/
		/**** md5 signature: f113425c763c976ba037fd6b98a7d608 ****/
		%feature("compactdefaultargs") MatchInterference;
		%feature("autodoc", "Returns true if the interference <i> matches the conditions (if defined). if no conditions defined, returns true.

Parameters
----------
I: TopOpeBRepDS_Interference

Returns
-------
bool
") MatchInterference;
		virtual Standard_Boolean MatchInterference(const opencascade::handle<TopOpeBRepDS_Interference> & I);

		/****************** More ******************/
		/**** md5 signature: 6f6e915c9a3dca758c059d9e8af02dff ****/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Returns true if there is a current interference in the iteration.

Returns
-------
bool
") More;
		Standard_Boolean More();

		/****************** Next ******************/
		/**** md5 signature: f35c0df5f1d7c877986db18081404532 ****/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Move to the next interference.

Returns
-------
None
") Next;
		void Next();

		/****************** Support ******************/
		/**** md5 signature: 40fffd6992a1a134cd3c63bb788aba9a ****/
		%feature("compactdefaultargs") Support;
		%feature("autodoc", "Define a condition on interference iteration process. interference must match the support <s>.

Parameters
----------
S: int

Returns
-------
None
") Support;
		void Support(const Standard_Integer S);

		/****************** SupportKind ******************/
		/**** md5 signature: ecfb3fa2c4963c8fa0cac03ac9ad9f77 ****/
		%feature("compactdefaultargs") SupportKind;
		%feature("autodoc", "Define a condition on interference iteration process. interference must match the support kind <st>.

Parameters
----------
ST: TopOpeBRepDS_Kind

Returns
-------
None
") SupportKind;
		void SupportKind(const TopOpeBRepDS_Kind ST);

		/****************** Value ******************/
		/**** md5 signature: f3debc8b4caf6d71048cb33034f07851 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the current interference, matching the conditions (if defined).

Returns
-------
opencascade::handle<TopOpeBRepDS_Interference>
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
		%feature("autodoc", "Duplicate i in a new interference with complement() transition.

Parameters
----------
I: TopOpeBRepDS_Interference

Returns
-------
opencascade::handle<TopOpeBRepDS_Interference>
") DuplicateCurvePointInterference;
		static opencascade::handle<TopOpeBRepDS_Interference> DuplicateCurvePointInterference(const opencascade::handle<TopOpeBRepDS_Interference> & I);

		/****************** MakeCurveInterference ******************/
		/**** md5 signature: 71edbf5e87c4306ef5dfa4f0a637ce26 ****/
		%feature("compactdefaultargs") MakeCurveInterference;
		%feature("autodoc", "No available documentation.

Parameters
----------
T: TopOpeBRepDS_Transition
SK: TopOpeBRepDS_Kind
SI: int
GK: TopOpeBRepDS_Kind
GI: int
P: float

Returns
-------
opencascade::handle<TopOpeBRepDS_Interference>
") MakeCurveInterference;
		static opencascade::handle<TopOpeBRepDS_Interference> MakeCurveInterference(const TopOpeBRepDS_Transition & T, const TopOpeBRepDS_Kind SK, const Standard_Integer SI, const TopOpeBRepDS_Kind GK, const Standard_Integer GI, const Standard_Real P);

		/****************** MakeEdgeInterference ******************/
		/**** md5 signature: 80c82fe33e5082861fed7023d51e20eb ****/
		%feature("compactdefaultargs") MakeEdgeInterference;
		%feature("autodoc", "No available documentation.

Parameters
----------
T: TopOpeBRepDS_Transition
SK: TopOpeBRepDS_Kind
SI: int
GK: TopOpeBRepDS_Kind
GI: int
P: float

Returns
-------
opencascade::handle<TopOpeBRepDS_Interference>
") MakeEdgeInterference;
		static opencascade::handle<TopOpeBRepDS_Interference> MakeEdgeInterference(const TopOpeBRepDS_Transition & T, const TopOpeBRepDS_Kind SK, const Standard_Integer SI, const TopOpeBRepDS_Kind GK, const Standard_Integer GI, const Standard_Real P);

		/****************** MakeEdgeVertexInterference ******************/
		/**** md5 signature: c6ba7aaf7a9e5b341392fd222ecf8cb5 ****/
		%feature("compactdefaultargs") MakeEdgeVertexInterference;
		%feature("autodoc", "No available documentation.

Parameters
----------
Transition: TopOpeBRepDS_Transition
EdgeI: int
VertexI: int
VertexIsBound: bool
Config: TopOpeBRepDS_Config
param: float

Returns
-------
opencascade::handle<TopOpeBRepDS_Interference>
") MakeEdgeVertexInterference;
		static opencascade::handle<TopOpeBRepDS_Interference> MakeEdgeVertexInterference(const TopOpeBRepDS_Transition & Transition, const Standard_Integer EdgeI, const Standard_Integer VertexI, const Standard_Boolean VertexIsBound, const TopOpeBRepDS_Config Config, const Standard_Real param);

		/****************** MakeFaceCurveInterference ******************/
		/**** md5 signature: 73510f6558324661f2cebcfd5b8da326 ****/
		%feature("compactdefaultargs") MakeFaceCurveInterference;
		%feature("autodoc", "No available documentation.

Parameters
----------
Transition: TopOpeBRepDS_Transition
FaceI: int
CurveI: int
PC: Geom2d_Curve

Returns
-------
opencascade::handle<TopOpeBRepDS_Interference>
") MakeFaceCurveInterference;
		static opencascade::handle<TopOpeBRepDS_Interference> MakeFaceCurveInterference(const TopOpeBRepDS_Transition & Transition, const Standard_Integer FaceI, const Standard_Integer CurveI, const opencascade::handle<Geom2d_Curve> & PC);

		/****************** MakeFaceEdgeInterference ******************/
		/**** md5 signature: d3c084d7a313c6f7c27270c4ed2607f2 ****/
		%feature("compactdefaultargs") MakeFaceEdgeInterference;
		%feature("autodoc", "No available documentation.

Parameters
----------
Transition: TopOpeBRepDS_Transition
FaceI: int
EdgeI: int
EdgeIsBound: bool
Config: TopOpeBRepDS_Config

Returns
-------
opencascade::handle<TopOpeBRepDS_Interference>
") MakeFaceEdgeInterference;
		static opencascade::handle<TopOpeBRepDS_Interference> MakeFaceEdgeInterference(const TopOpeBRepDS_Transition & Transition, const Standard_Integer FaceI, const Standard_Integer EdgeI, const Standard_Boolean EdgeIsBound, const TopOpeBRepDS_Config Config);

		/****************** MakeSolidSurfaceInterference ******************/
		/**** md5 signature: 8760ffc9204d7f5d327f3734b96d1eb7 ****/
		%feature("compactdefaultargs") MakeSolidSurfaceInterference;
		%feature("autodoc", "No available documentation.

Parameters
----------
Transition: TopOpeBRepDS_Transition
SolidI: int
SurfaceI: int

Returns
-------
opencascade::handle<TopOpeBRepDS_Interference>
") MakeSolidSurfaceInterference;
		static opencascade::handle<TopOpeBRepDS_Interference> MakeSolidSurfaceInterference(const TopOpeBRepDS_Transition & Transition, const Standard_Integer SolidI, const Standard_Integer SurfaceI);

		/****************** Parameter ******************/
		/**** md5 signature: 7167c86f23457411d69314ecbc317185 ****/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "No available documentation.

Parameters
----------
CPI: TopOpeBRepDS_Interference

Returns
-------
float
") Parameter;
		static Standard_Real Parameter(const opencascade::handle<TopOpeBRepDS_Interference> & CPI);

		/****************** Parameter ******************/
		/**** md5 signature: a8e6ad703ffe00dceff696129323dd38 ****/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "No available documentation.

Parameters
----------
CPI: TopOpeBRepDS_Interference
Par: float

Returns
-------
None
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
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopOpeBRepDS_ListOfShapeOn1State;
		 TopOpeBRepDS_ListOfShapeOn1State();

		/****************** ChangeListOnState ******************/
		/**** md5 signature: 9f8af2605e3234694bc140cf2db45f55 ****/
		%feature("compactdefaultargs") ChangeListOnState;
		%feature("autodoc", "No available documentation.

Returns
-------
TopTools_ListOfShape
") ChangeListOnState;
		TopTools_ListOfShape & ChangeListOnState();

		/****************** Clear ******************/
		/**** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ****/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Clear;
		void Clear();

		/****************** IsSplit ******************/
		/**** md5 signature: cd297e5305c37fd756c77025e3454dc1 ****/
		%feature("compactdefaultargs") IsSplit;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsSplit;
		Standard_Boolean IsSplit();

		/****************** ListOnState ******************/
		/**** md5 signature: d8eeb9ed0a4e645267970191ba00edb2 ****/
		%feature("compactdefaultargs") ListOnState;
		%feature("autodoc", "No available documentation.

Returns
-------
TopTools_ListOfShape
") ListOnState;
		const TopTools_ListOfShape & ListOnState();

		/****************** Split ******************/
		/**** md5 signature: e15f6a006a319f619e60613f8e8a67e2 ****/
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "No available documentation.

Parameters
----------
B: bool,optional
	default value is Standard_True

Returns
-------
None
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
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopOpeBRepDS_Marker;
		 TopOpeBRepDS_Marker();

		/****************** Allocate ******************/
		/**** md5 signature: 8dd88c711bbc17d9cac35e2bf2761af3 ****/
		%feature("compactdefaultargs") Allocate;
		%feature("autodoc", "No available documentation.

Parameters
----------
n: int

Returns
-------
None
") Allocate;
		void Allocate(const Standard_Integer n);

		/****************** GetI ******************/
		/**** md5 signature: c504e43ed37d8f9405ff96c0f67ca224 ****/
		%feature("compactdefaultargs") GetI;
		%feature("autodoc", "No available documentation.

Parameters
----------
i: int

Returns
-------
bool
") GetI;
		Standard_Boolean GetI(const Standard_Integer i);

		/****************** Reset ******************/
		/**** md5 signature: 7beb446fe26b948f797f8de87e46c23d ****/
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Reset;
		void Reset();

		/****************** Set ******************/
		/**** md5 signature: c99879bf672036eccb4611c79446d14d ****/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "No available documentation.

Parameters
----------
i: int
b: bool

Returns
-------
None
") Set;
		void Set(const Standard_Integer i, const Standard_Boolean b);

		/****************** Set ******************/
		/**** md5 signature: 3b803ad34d046b499b986074b29cf199 ****/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "No available documentation.

Parameters
----------
b: bool
n: int
a: Standard_Address

Returns
-------
None
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
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopOpeBRepDS_Point;
		 TopOpeBRepDS_Point();

		/****************** TopOpeBRepDS_Point ******************/
		/**** md5 signature: b5958abaa1eb0e97583f37b5ac0924a7 ****/
		%feature("compactdefaultargs") TopOpeBRepDS_Point;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: gp_Pnt
T: float

Returns
-------
None
") TopOpeBRepDS_Point;
		 TopOpeBRepDS_Point(const gp_Pnt & P, const Standard_Real T);

		/****************** TopOpeBRepDS_Point ******************/
		/**** md5 signature: 1e6cf5507d272bf5736e0d7a92f091d3 ****/
		%feature("compactdefaultargs") TopOpeBRepDS_Point;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopoDS_Shape

Returns
-------
None
") TopOpeBRepDS_Point;
		 TopOpeBRepDS_Point(const TopoDS_Shape & S);

		/****************** ChangeKeep ******************/
		/**** md5 signature: 75f379b6bb874b0da2db245ffe678874 ****/
		%feature("compactdefaultargs") ChangeKeep;
		%feature("autodoc", "No available documentation.

Parameters
----------
B: bool

Returns
-------
None
") ChangeKeep;
		void ChangeKeep(const Standard_Boolean B);

		/****************** ChangePoint ******************/
		/**** md5 signature: 33f76a92948a53a65ecd0d3de11b040d ****/
		%feature("compactdefaultargs") ChangePoint;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Pnt
") ChangePoint;
		gp_Pnt ChangePoint();

		/****************** IsEqual ******************/
		/**** md5 signature: 5e59b6db27abceb6b2820f06b0880d15 ****/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "No available documentation.

Parameters
----------
other: TopOpeBRepDS_Point

Returns
-------
bool
") IsEqual;
		Standard_Boolean IsEqual(const TopOpeBRepDS_Point & other);

		/****************** Keep ******************/
		/**** md5 signature: 49f5fb06c6fb4c03a84c4eb06dd2637f ****/
		%feature("compactdefaultargs") Keep;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") Keep;
		Standard_Boolean Keep();

		/****************** Point ******************/
		/**** md5 signature: 177e376cc11d1fedb2819bac56591ea8 ****/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Pnt
") Point;
		const gp_Pnt Point();

		/****************** Tolerance ******************/
		/**** md5 signature: 9e5775014410d884d1a1adc1cd47930b ****/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Tolerance;
		Standard_Real Tolerance();

		/****************** Tolerance ******************/
		/**** md5 signature: e925b87131cc380a2e6cb497cb7384fa ****/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "No available documentation.

Parameters
----------
Tol: float

Returns
-------
None
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
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopOpeBRepDS_PointExplorer;
		 TopOpeBRepDS_PointExplorer();

		/****************** TopOpeBRepDS_PointExplorer ******************/
		/**** md5 signature: 2a6dbca93721718f1bf55918e0c7a00e ****/
		%feature("compactdefaultargs") TopOpeBRepDS_PointExplorer;
		%feature("autodoc", "No available documentation.

Parameters
----------
DS: TopOpeBRepDS_DataStructure
FindOnlyKeep: bool,optional
	default value is Standard_True

Returns
-------
None
") TopOpeBRepDS_PointExplorer;
		 TopOpeBRepDS_PointExplorer(const TopOpeBRepDS_DataStructure & DS, const Standard_Boolean FindOnlyKeep = Standard_True);

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
		/**** md5 signature: 3cb53884a0dedff3ad42657c8c345e44 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
DS: TopOpeBRepDS_DataStructure
FindOnlyKeep: bool,optional
	default value is Standard_True

Returns
-------
None
") Init;
		void Init(const TopOpeBRepDS_DataStructure & DS, const Standard_Boolean FindOnlyKeep = Standard_True);

		/****************** IsPoint ******************/
		/**** md5 signature: b47fb5bce98c767ee2068a626d524140 ****/
		%feature("compactdefaultargs") IsPoint;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: int

Returns
-------
bool
") IsPoint;
		Standard_Boolean IsPoint(const Standard_Integer I);

		/****************** IsPointKeep ******************/
		/**** md5 signature: 51dc517d07c940f5d6befee4a6048cc5 ****/
		%feature("compactdefaultargs") IsPointKeep;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: int

Returns
-------
bool
") IsPointKeep;
		Standard_Boolean IsPointKeep(const Standard_Integer I);

		/****************** More ******************/
		/**** md5 signature: 6f6e915c9a3dca758c059d9e8af02dff ****/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") More;
		Standard_Boolean More();

		/****************** NbPoint ******************/
		/**** md5 signature: 31a8a75525c80d8d0cd3972a811a871a ****/
		%feature("compactdefaultargs") NbPoint;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbPoint;
		Standard_Integer NbPoint();

		/****************** Next ******************/
		/**** md5 signature: f35c0df5f1d7c877986db18081404532 ****/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Next;
		void Next();

		/****************** Point ******************/
		/**** md5 signature: b78584a0e22a5b86a67814fa9f99e5f7 ****/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "No available documentation.

Returns
-------
TopOpeBRepDS_Point
") Point;
		const TopOpeBRepDS_Point & Point();

		/****************** Point ******************/
		/**** md5 signature: 5b8c65793f4550a005f74995c521586b ****/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: int

Returns
-------
TopOpeBRepDS_Point
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
		%feature("autodoc", "No available documentation.

Parameters
----------
HDS: TopOpeBRepDS_HDataStructure

Returns
-------
None
") TopOpeBRepDS_Reducer;
		 TopOpeBRepDS_Reducer(const opencascade::handle<TopOpeBRepDS_HDataStructure> & HDS);

		/****************** ProcessEdgeInterferences ******************/
		/**** md5 signature: fdb0a9346715ac3d5b07add0cbfe07d8 ****/
		%feature("compactdefaultargs") ProcessEdgeInterferences;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") ProcessEdgeInterferences;
		void ProcessEdgeInterferences();

		/****************** ProcessFaceInterferences ******************/
		/**** md5 signature: 22ea874d673770f31f98a3c38885bd6a ****/
		%feature("compactdefaultargs") ProcessFaceInterferences;
		%feature("autodoc", "No available documentation.

Parameters
----------
M: TopOpeBRepDS_DataMapOfShapeListOfShapeOn1State

Returns
-------
None
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
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopOpeBRepDS_ShapeData;
		 TopOpeBRepDS_ShapeData();

		/****************** ChangeInterferences ******************/
		/**** md5 signature: 1c8cdb23abd41bd3fe65cba4df26ed63 ****/
		%feature("compactdefaultargs") ChangeInterferences;
		%feature("autodoc", "No available documentation.

Returns
-------
TopOpeBRepDS_ListOfInterference
") ChangeInterferences;
		TopOpeBRepDS_ListOfInterference & ChangeInterferences();

		/****************** ChangeKeep ******************/
		/**** md5 signature: 75f379b6bb874b0da2db245ffe678874 ****/
		%feature("compactdefaultargs") ChangeKeep;
		%feature("autodoc", "No available documentation.

Parameters
----------
B: bool

Returns
-------
None
") ChangeKeep;
		void ChangeKeep(const Standard_Boolean B);

		/****************** Interferences ******************/
		/**** md5 signature: 237ed42d67b2b8b56ca50b69c4e86889 ****/
		%feature("compactdefaultargs") Interferences;
		%feature("autodoc", "No available documentation.

Returns
-------
TopOpeBRepDS_ListOfInterference
") Interferences;
		const TopOpeBRepDS_ListOfInterference & Interferences();

		/****************** Keep ******************/
		/**** md5 signature: 49f5fb06c6fb4c03a84c4eb06dd2637f ****/
		%feature("compactdefaultargs") Keep;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
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
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopOpeBRepDS_ShapeWithState;
		 TopOpeBRepDS_ShapeWithState();

		/****************** AddPart ******************/
		/**** md5 signature: 3f89161790069044c8e7efde38c7a855 ****/
		%feature("compactdefaultargs") AddPart;
		%feature("autodoc", "No available documentation.

Parameters
----------
aShape: TopoDS_Shape
aState: TopAbs_State

Returns
-------
None
") AddPart;
		void AddPart(const TopoDS_Shape & aShape, const TopAbs_State aState);

		/****************** AddParts ******************/
		/**** md5 signature: 1b97aa34dfcfaba07a4d57d24b82410d ****/
		%feature("compactdefaultargs") AddParts;
		%feature("autodoc", "No available documentation.

Parameters
----------
aListOfShape: TopTools_ListOfShape
aState: TopAbs_State

Returns
-------
None
") AddParts;
		void AddParts(const TopTools_ListOfShape & aListOfShape, const TopAbs_State aState);

		/****************** IsSplitted ******************/
		/**** md5 signature: e67faeac515fe8ba137b50086f37c89e ****/
		%feature("compactdefaultargs") IsSplitted;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsSplitted;
		Standard_Boolean IsSplitted();

		/****************** Part ******************/
		/**** md5 signature: 39c7dce1e3b86388fa9280e1271e19ab ****/
		%feature("compactdefaultargs") Part;
		%feature("autodoc", "No available documentation.

Parameters
----------
aState: TopAbs_State

Returns
-------
TopTools_ListOfShape
") Part;
		const TopTools_ListOfShape & Part(const TopAbs_State aState);

		/****************** SetIsSplitted ******************/
		/**** md5 signature: e39ed6edc2cda52aa3e12d1bdbdde93b ****/
		%feature("compactdefaultargs") SetIsSplitted;
		%feature("autodoc", "No available documentation.

Parameters
----------
anIsSplitted: bool

Returns
-------
None
") SetIsSplitted;
		void SetIsSplitted(const Standard_Boolean anIsSplitted);

		/****************** SetState ******************/
		/**** md5 signature: 8d4728ca94737d0ac8e24be948ef249b ****/
		%feature("compactdefaultargs") SetState;
		%feature("autodoc", "No available documentation.

Parameters
----------
aState: TopAbs_State

Returns
-------
None
") SetState;
		void SetState(const TopAbs_State aState);

		/****************** State ******************/
		/**** md5 signature: 927c83b1efdec797adb47eb058eddaa0 ****/
		%feature("compactdefaultargs") State;
		%feature("autodoc", "No available documentation.

Returns
-------
TopAbs_State
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
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopOpeBRepDS_Surface;
		 TopOpeBRepDS_Surface();

		/****************** TopOpeBRepDS_Surface ******************/
		/**** md5 signature: d182222c8bc6c34b87980490e4b78679 ****/
		%feature("compactdefaultargs") TopOpeBRepDS_Surface;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: Geom_Surface
T: float

Returns
-------
None
") TopOpeBRepDS_Surface;
		 TopOpeBRepDS_Surface(const opencascade::handle<Geom_Surface> & P, const Standard_Real T);

		/****************** TopOpeBRepDS_Surface ******************/
		/**** md5 signature: 752d3f0d36c9488cd962ac08a53cdde3 ****/
		%feature("compactdefaultargs") TopOpeBRepDS_Surface;
		%feature("autodoc", "No available documentation.

Parameters
----------
Other: TopOpeBRepDS_Surface

Returns
-------
None
") TopOpeBRepDS_Surface;
		 TopOpeBRepDS_Surface(const TopOpeBRepDS_Surface & Other);

		/****************** Assign ******************/
		/**** md5 signature: 887e886360184f6c5ae1ac009665df5c ****/
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "No available documentation.

Parameters
----------
Other: TopOpeBRepDS_Surface

Returns
-------
None
") Assign;
		void Assign(const TopOpeBRepDS_Surface & Other);

		/****************** ChangeKeep ******************/
		/**** md5 signature: c0b034be6ced0ecf537a4d2cd976c965 ****/
		%feature("compactdefaultargs") ChangeKeep;
		%feature("autodoc", "No available documentation.

Parameters
----------
theToKeep: bool

Returns
-------
None
") ChangeKeep;
		void ChangeKeep(Standard_Boolean theToKeep);

		/****************** Keep ******************/
		/**** md5 signature: 7a6eea11b699a258601fdf5543ded844 ****/
		%feature("compactdefaultargs") Keep;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") Keep;
		Standard_Boolean Keep();

		/****************** Surface ******************/
		/**** md5 signature: 3aa31a6d63da8a25f018cf96599c0928 ****/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom_Surface>
") Surface;
		const opencascade::handle<Geom_Surface> & Surface();

		/****************** Tolerance ******************/
		/**** md5 signature: 327dcbe220ae5ba3e0203f32c61c38db ****/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Tolerance;
		Standard_Real Tolerance();

		/****************** Tolerance ******************/
		/**** md5 signature: 6e44bbef8a403b18484e0d3b65d37a2b ****/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "Update the tolerance.

Parameters
----------
theTol: float

Returns
-------
None
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
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopOpeBRepDS_SurfaceExplorer;
		 TopOpeBRepDS_SurfaceExplorer();

		/****************** TopOpeBRepDS_SurfaceExplorer ******************/
		/**** md5 signature: 8cbac392ec2c20a95da9ab8967461215 ****/
		%feature("compactdefaultargs") TopOpeBRepDS_SurfaceExplorer;
		%feature("autodoc", "No available documentation.

Parameters
----------
DS: TopOpeBRepDS_DataStructure
FindOnlyKeep: bool,optional
	default value is Standard_True

Returns
-------
None
") TopOpeBRepDS_SurfaceExplorer;
		 TopOpeBRepDS_SurfaceExplorer(const TopOpeBRepDS_DataStructure & DS, const Standard_Boolean FindOnlyKeep = Standard_True);

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
		/**** md5 signature: 3cb53884a0dedff3ad42657c8c345e44 ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Parameters
----------
DS: TopOpeBRepDS_DataStructure
FindOnlyKeep: bool,optional
	default value is Standard_True

Returns
-------
None
") Init;
		void Init(const TopOpeBRepDS_DataStructure & DS, const Standard_Boolean FindOnlyKeep = Standard_True);

		/****************** IsSurface ******************/
		/**** md5 signature: 23653089f9220cade768c1e060f8ad7e ****/
		%feature("compactdefaultargs") IsSurface;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: int

Returns
-------
bool
") IsSurface;
		Standard_Boolean IsSurface(const Standard_Integer I);

		/****************** IsSurfaceKeep ******************/
		/**** md5 signature: b3b41974489a001805ef550cf30b329d ****/
		%feature("compactdefaultargs") IsSurfaceKeep;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: int

Returns
-------
bool
") IsSurfaceKeep;
		Standard_Boolean IsSurfaceKeep(const Standard_Integer I);

		/****************** More ******************/
		/**** md5 signature: 6f6e915c9a3dca758c059d9e8af02dff ****/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") More;
		Standard_Boolean More();

		/****************** NbSurface ******************/
		/**** md5 signature: 01f2d8c6928db710b4dd4353c5bece7f ****/
		%feature("compactdefaultargs") NbSurface;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbSurface;
		Standard_Integer NbSurface();

		/****************** Next ******************/
		/**** md5 signature: f35c0df5f1d7c877986db18081404532 ****/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Next;
		void Next();

		/****************** Surface ******************/
		/**** md5 signature: f14ed172bc4994a2659e658ac71310ff ****/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "No available documentation.

Returns
-------
TopOpeBRepDS_Surface
") Surface;
		const TopOpeBRepDS_Surface & Surface();

		/****************** Surface ******************/
		/**** md5 signature: 0fa398e726541e213860705286d521cb ****/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: int

Returns
-------
TopOpeBRepDS_Surface
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
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopOpeBRepDS_TKI;
		 TopOpeBRepDS_TKI();

		/****************** Add ******************/
		/**** md5 signature: f55a2389af157567e50919391478ec0f ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "No available documentation.

Parameters
----------
K: TopOpeBRepDS_Kind
G: int

Returns
-------
None
") Add;
		void Add(const TopOpeBRepDS_Kind K, const Standard_Integer G);

		/****************** Add ******************/
		/**** md5 signature: bf4db3b7c8d2d6237acea717b54695ba ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "No available documentation.

Parameters
----------
K: TopOpeBRepDS_Kind
G: int
HI: TopOpeBRepDS_Interference

Returns
-------
None
") Add;
		void Add(const TopOpeBRepDS_Kind K, const Standard_Integer G, const opencascade::handle<TopOpeBRepDS_Interference> & HI);

		/****************** ChangeInterferences ******************/
		/**** md5 signature: 2f520ca726f7c5c6d80ab09ed2c80e08 ****/
		%feature("compactdefaultargs") ChangeInterferences;
		%feature("autodoc", "No available documentation.

Parameters
----------
K: TopOpeBRepDS_Kind
G: int

Returns
-------
TopOpeBRepDS_ListOfInterference
") ChangeInterferences;
		TopOpeBRepDS_ListOfInterference & ChangeInterferences(const TopOpeBRepDS_Kind K, const Standard_Integer G);

		/****************** ChangeValue ******************/
		/**** md5 signature: 94fd5d5cbd269e45cd12e8da39fea321 ****/
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "No available documentation.

Parameters
----------
K: TopOpeBRepDS_Kind

Returns
-------
G: int
") ChangeValue;
		TopOpeBRepDS_ListOfInterference & ChangeValue(TopOpeBRepDS_Kind & K, Standard_Integer &OutValue);

		/****************** Clear ******************/
		/**** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ****/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Clear;
		void Clear();

		/****************** DumpTKIIterator ******************/
		/**** md5 signature: f8bb25e34cb8c428f8657fd68e1ef90e ****/
		%feature("compactdefaultargs") DumpTKIIterator;
		%feature("autodoc", "No available documentation.

Parameters
----------
s1: TCollection_AsciiString,optional
	default value is ""
s2: TCollection_AsciiString,optional
	default value is ""

Returns
-------
None
") DumpTKIIterator;
		void DumpTKIIterator(const TCollection_AsciiString & s1 = "", const TCollection_AsciiString & s2 = "");

		/****************** FillOnGeometry ******************/
		/**** md5 signature: bc57c0884bf6423d13a2fa1a0ba316da ****/
		%feature("compactdefaultargs") FillOnGeometry;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: TopOpeBRepDS_ListOfInterference

Returns
-------
None
") FillOnGeometry;
		void FillOnGeometry(const TopOpeBRepDS_ListOfInterference & L);

		/****************** FillOnSupport ******************/
		/**** md5 signature: 545c50b7aba4391215c5814b43c1ecbd ****/
		%feature("compactdefaultargs") FillOnSupport;
		%feature("autodoc", "No available documentation.

Parameters
----------
L: TopOpeBRepDS_ListOfInterference

Returns
-------
None
") FillOnSupport;
		void FillOnSupport(const TopOpeBRepDS_ListOfInterference & L);

		/****************** HasInterferences ******************/
		/**** md5 signature: f227c521c6c63e3c9841ef5b7409367c ****/
		%feature("compactdefaultargs") HasInterferences;
		%feature("autodoc", "No available documentation.

Parameters
----------
K: TopOpeBRepDS_Kind
G: int

Returns
-------
bool
") HasInterferences;
		Standard_Boolean HasInterferences(const TopOpeBRepDS_Kind K, const Standard_Integer G);

		/****************** Init ******************/
		/**** md5 signature: 0de93ef32c53d091768788dca0e281fd ****/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Init;
		void Init();

		/****************** Interferences ******************/
		/**** md5 signature: 3ff5c12c6b6327e3c022a6739fba28d2 ****/
		%feature("compactdefaultargs") Interferences;
		%feature("autodoc", "No available documentation.

Parameters
----------
K: TopOpeBRepDS_Kind
G: int

Returns
-------
TopOpeBRepDS_ListOfInterference
") Interferences;
		const TopOpeBRepDS_ListOfInterference & Interferences(const TopOpeBRepDS_Kind K, const Standard_Integer G);

		/****************** IsBound ******************/
		/**** md5 signature: e5a495fdf225daf5a4c7ba3d93b0ea9a ****/
		%feature("compactdefaultargs") IsBound;
		%feature("autodoc", "No available documentation.

Parameters
----------
K: TopOpeBRepDS_Kind
G: int

Returns
-------
bool
") IsBound;
		Standard_Boolean IsBound(const TopOpeBRepDS_Kind K, const Standard_Integer G);

		/****************** More ******************/
		/**** md5 signature: 6f6e915c9a3dca758c059d9e8af02dff ****/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") More;
		Standard_Boolean More();

		/****************** Next ******************/
		/**** md5 signature: f35c0df5f1d7c877986db18081404532 ****/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Next;
		void Next();

		/****************** Value ******************/
		/**** md5 signature: 74319da71df133747d4e785790ac7c21 ****/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "No available documentation.

Parameters
----------
K: TopOpeBRepDS_Kind

Returns
-------
G: int
") Value;
		const TopOpeBRepDS_ListOfInterference & Value(TopOpeBRepDS_Kind & K, Standard_Integer &OutValue);

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
		%feature("autodoc", "No available documentation.

Parameters
----------
HDS: TopOpeBRepDS_HDataStructure
E: TopoDS_Edge
lEsd: TopTools_ListOfShape

Returns
-------
int
") EShareG;
		static Standard_Integer EShareG(const opencascade::handle<TopOpeBRepDS_HDataStructure> & HDS, const TopoDS_Edge & E, TopTools_ListOfShape & lEsd);

		/****************** GetConfig ******************/
		/**** md5 signature: 50e3bd3f9d1963cf5a34f472b7207004 ****/
		%feature("compactdefaultargs") GetConfig;
		%feature("autodoc", "No available documentation.

Parameters
----------
HDS: TopOpeBRepDS_HDataStructure
MEspON: TopOpeBRepDS_DataMapOfShapeListOfShapeOn1State
ie: int
iesd: int

Returns
-------
conf: int
") GetConfig;
		static Standard_Boolean GetConfig(const opencascade::handle<TopOpeBRepDS_HDataStructure> & HDS, const TopOpeBRepDS_DataMapOfShapeListOfShapeOn1State & MEspON, const Standard_Integer ie, const Standard_Integer iesd, Standard_Integer &OutValue);

		/****************** GetEsd ******************/
		/**** md5 signature: b00b236e3c31577ce32f80c90a4b14a3 ****/
		%feature("compactdefaultargs") GetEsd;
		%feature("autodoc", "No available documentation.

Parameters
----------
HDS: TopOpeBRepDS_HDataStructure
S: TopoDS_Shape
ie: int

Returns
-------
iesd: int
") GetEsd;
		static Standard_Boolean GetEsd(const opencascade::handle<TopOpeBRepDS_HDataStructure> & HDS, const TopoDS_Shape & S, const Standard_Integer ie, Standard_Integer &OutValue);

		/****************** ShareG ******************/
		/**** md5 signature: d39c16d7b46413f1d5ecaf6edf9774b7 ****/
		%feature("compactdefaultargs") ShareG;
		%feature("autodoc", "No available documentation.

Parameters
----------
HDS: TopOpeBRepDS_HDataStructure
is1: int
is2: int

Returns
-------
bool
") ShareG;
		static Standard_Boolean ShareG(const opencascade::handle<TopOpeBRepDS_HDataStructure> & HDS, const Standard_Integer is1, const Standard_Integer is2);

		/****************** ShareSplitON ******************/
		/**** md5 signature: 9628684691e319e9a5963fd0252f466a ****/
		%feature("compactdefaultargs") ShareSplitON;
		%feature("autodoc", "No available documentation.

Parameters
----------
HDS: TopOpeBRepDS_HDataStructure
MspON: TopOpeBRepDS_DataMapOfShapeListOfShapeOn1State
i1: int
i2: int
spON: TopoDS_Shape

Returns
-------
bool
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
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopOpeBRepDS_Transition;
		 TopOpeBRepDS_Transition();

		/****************** TopOpeBRepDS_Transition ******************/
		/**** md5 signature: f2d39af7aa0cba09bc14429f57dd8c18 ****/
		%feature("compactdefaultargs") TopOpeBRepDS_Transition;
		%feature("autodoc", "No available documentation.

Parameters
----------
StateBefore: TopAbs_State
StateAfter: TopAbs_State
ShapeBefore: TopAbs_ShapeEnum,optional
	default value is TopAbs_FACE
ShapeAfter: TopAbs_ShapeEnum,optional
	default value is TopAbs_FACE

Returns
-------
None
") TopOpeBRepDS_Transition;
		 TopOpeBRepDS_Transition(const TopAbs_State StateBefore, const TopAbs_State StateAfter, const TopAbs_ShapeEnum ShapeBefore = TopAbs_FACE, const TopAbs_ShapeEnum ShapeAfter = TopAbs_FACE);

		/****************** TopOpeBRepDS_Transition ******************/
		/**** md5 signature: 249a16cc5bbcf2be99319e0964d91a6b ****/
		%feature("compactdefaultargs") TopOpeBRepDS_Transition;
		%feature("autodoc", "No available documentation.

Parameters
----------
O: TopAbs_Orientation

Returns
-------
None
") TopOpeBRepDS_Transition;
		 TopOpeBRepDS_Transition(const TopAbs_Orientation O);

		/****************** After ******************/
		/**** md5 signature: a2c5df0ddcd2e8c33fa1f44aecdd13ee ****/
		%feature("compactdefaultargs") After;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopAbs_State
ShapeAfter: TopAbs_ShapeEnum,optional
	default value is TopAbs_FACE

Returns
-------
None
") After;
		void After(const TopAbs_State S, const TopAbs_ShapeEnum ShapeAfter = TopAbs_FACE);

		/****************** After ******************/
		/**** md5 signature: 0130d06cb83ecca0888806946b20635a ****/
		%feature("compactdefaultargs") After;
		%feature("autodoc", "No available documentation.

Returns
-------
TopAbs_State
") After;
		TopAbs_State After();

		/****************** Before ******************/
		/**** md5 signature: bb0ee36e91deb1cb406862c3def1bf56 ****/
		%feature("compactdefaultargs") Before;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopAbs_State
ShapeBefore: TopAbs_ShapeEnum,optional
	default value is TopAbs_FACE

Returns
-------
None
") Before;
		void Before(const TopAbs_State S, const TopAbs_ShapeEnum ShapeBefore = TopAbs_FACE);

		/****************** Before ******************/
		/**** md5 signature: f0e6b6334b2f08c45649ca23a4263f82 ****/
		%feature("compactdefaultargs") Before;
		%feature("autodoc", "No available documentation.

Returns
-------
TopAbs_State
") Before;
		TopAbs_State Before();

		/****************** Complement ******************/
		/**** md5 signature: 2ad99db6589ec94469edd4ee0dd1a47d ****/
		%feature("compactdefaultargs") Complement;
		%feature("autodoc", "No available documentation.

Returns
-------
TopOpeBRepDS_Transition
") Complement;
		TopOpeBRepDS_Transition Complement();

		/****************** Index ******************/
		/**** md5 signature: 14b6f4590eeca8d2e66a904c0019a95f ****/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: int

Returns
-------
None
") Index;
		void Index(const Standard_Integer I);

		/****************** Index ******************/
		/**** md5 signature: 407d80ef3037d55996765198adea3908 ****/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") Index;
		Standard_Integer Index();

		/****************** IndexAfter ******************/
		/**** md5 signature: 6107475a303c254e6ec126186032ec74 ****/
		%feature("compactdefaultargs") IndexAfter;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: int

Returns
-------
None
") IndexAfter;
		void IndexAfter(const Standard_Integer I);

		/****************** IndexAfter ******************/
		/**** md5 signature: 36ca760f09f0a2780bd04edd64041a5f ****/
		%feature("compactdefaultargs") IndexAfter;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") IndexAfter;
		Standard_Integer IndexAfter();

		/****************** IndexBefore ******************/
		/**** md5 signature: bad742ca713bae21fed223779cd45538 ****/
		%feature("compactdefaultargs") IndexBefore;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: int

Returns
-------
None
") IndexBefore;
		void IndexBefore(const Standard_Integer I);

		/****************** IndexBefore ******************/
		/**** md5 signature: 85450063c5853e01bb91dec3ff91f13f ****/
		%feature("compactdefaultargs") IndexBefore;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") IndexBefore;
		Standard_Integer IndexBefore();

		/****************** IsUnknown ******************/
		/**** md5 signature: 3664e7b68ca3ddc8f89b66fb416769e1 ****/
		%feature("compactdefaultargs") IsUnknown;
		%feature("autodoc", "Returns true if both states are unknown.

Returns
-------
bool
") IsUnknown;
		Standard_Boolean IsUnknown();

		/****************** ONAfter ******************/
		/**** md5 signature: 008dca4f114debbf73dba6e7dc3497a8 ****/
		%feature("compactdefaultargs") ONAfter;
		%feature("autodoc", "No available documentation.

Returns
-------
TopAbs_ShapeEnum
") ONAfter;
		TopAbs_ShapeEnum ONAfter();

		/****************** ONBefore ******************/
		/**** md5 signature: 2b95fcd8529b8241abc8ac9e9340521b ****/
		%feature("compactdefaultargs") ONBefore;
		%feature("autodoc", "No available documentation.

Returns
-------
TopAbs_ShapeEnum
") ONBefore;
		TopAbs_ShapeEnum ONBefore();

		/****************** Orientation ******************/
		/**** md5 signature: fac36aaf9a745b7e79b351c3e940eb85 ****/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "Returns the orientation corresponding to state <s> //! before and after not equal topabs_on : -------------------------------------- before after computed orientation //! s not s reversed (we leave state s) not s s forward (we enter state s) s s internal (we stay in state s) not s not s external (we stay outside state s).

Parameters
----------
S: TopAbs_State
T: TopAbs_ShapeEnum,optional
	default value is TopAbs_FACE

Returns
-------
TopAbs_Orientation
") Orientation;
		TopAbs_Orientation Orientation(const TopAbs_State S, const TopAbs_ShapeEnum T = TopAbs_FACE);

		/****************** Set ******************/
		/**** md5 signature: 4928947a67feca2ba52483e250914cf5 ****/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "No available documentation.

Parameters
----------
StateBefore: TopAbs_State
StateAfter: TopAbs_State
ShapeBefore: TopAbs_ShapeEnum,optional
	default value is TopAbs_FACE
ShapeAfter: TopAbs_ShapeEnum,optional
	default value is TopAbs_FACE

Returns
-------
None
") Set;
		void Set(const TopAbs_State StateBefore, const TopAbs_State StateAfter, const TopAbs_ShapeEnum ShapeBefore = TopAbs_FACE, const TopAbs_ShapeEnum ShapeAfter = TopAbs_FACE);

		/****************** Set ******************/
		/**** md5 signature: 565e36f717cf668f6a1dba95ac37ca78 ****/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Set the transition corresponding to orientation <o> //! o before after //! forward out in reversed in out internal in in external out out.

Parameters
----------
O: TopAbs_Orientation

Returns
-------
None
") Set;
		void Set(const TopAbs_Orientation O);

		/****************** ShapeAfter ******************/
		/**** md5 signature: 9bac723e506fae84bc6112fa9eb8af3d ****/
		%feature("compactdefaultargs") ShapeAfter;
		%feature("autodoc", "No available documentation.

Parameters
----------
SE: TopAbs_ShapeEnum

Returns
-------
None
") ShapeAfter;
		void ShapeAfter(const TopAbs_ShapeEnum SE);

		/****************** ShapeAfter ******************/
		/**** md5 signature: bb9fe4018e7529347a72f5cd01863779 ****/
		%feature("compactdefaultargs") ShapeAfter;
		%feature("autodoc", "No available documentation.

Returns
-------
TopAbs_ShapeEnum
") ShapeAfter;
		TopAbs_ShapeEnum ShapeAfter();

		/****************** ShapeBefore ******************/
		/**** md5 signature: 593103fd0d882efa2c2ba16f9715c496 ****/
		%feature("compactdefaultargs") ShapeBefore;
		%feature("autodoc", "No available documentation.

Parameters
----------
SE: TopAbs_ShapeEnum

Returns
-------
None
") ShapeBefore;
		void ShapeBefore(const TopAbs_ShapeEnum SE);

		/****************** ShapeBefore ******************/
		/**** md5 signature: 9f9440c9eee019790015c78656c810f1 ****/
		%feature("compactdefaultargs") ShapeBefore;
		%feature("autodoc", "No available documentation.

Returns
-------
TopAbs_ShapeEnum
") ShapeBefore;
		TopAbs_ShapeEnum ShapeBefore();

		/****************** StateAfter ******************/
		/**** md5 signature: d482f8b89008d7e48bba2a0091db7e0e ****/
		%feature("compactdefaultargs") StateAfter;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopAbs_State

Returns
-------
None
") StateAfter;
		void StateAfter(const TopAbs_State S);

		/****************** StateBefore ******************/
		/**** md5 signature: 3604f53f49079234a85dde72a3aad0f9 ****/
		%feature("compactdefaultargs") StateBefore;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopAbs_State

Returns
-------
None
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
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopOpeBRepDS_CurveData;
		 TopOpeBRepDS_CurveData();

		/****************** TopOpeBRepDS_CurveData ******************/
		/**** md5 signature: cf41ff245973298d204dfbd9436d4f2d ****/
		%feature("compactdefaultargs") TopOpeBRepDS_CurveData;
		%feature("autodoc", "No available documentation.

Parameters
----------
C: TopOpeBRepDS_Curve

Returns
-------
None
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
		%feature("autodoc", "Creates an iterator on the curves on surface described by the interferences in <l>.

Parameters
----------
L: TopOpeBRepDS_ListOfInterference

Returns
-------
None
") TopOpeBRepDS_CurveIterator;
		 TopOpeBRepDS_CurveIterator(const TopOpeBRepDS_ListOfInterference & L);

		/****************** Current ******************/
		/**** md5 signature: a56c202295a85f5f102575dc8279e0d7 ****/
		%feature("compactdefaultargs") Current;
		%feature("autodoc", "Index of the curve in the data structure.

Returns
-------
int
") Current;
		Standard_Integer Current();

		/****************** MatchInterference ******************/
		/**** md5 signature: 65853f9699421547bf44f4ac95967e30 ****/
		%feature("compactdefaultargs") MatchInterference;
		%feature("autodoc", "Returns true if the interference <i> has a geometrytype() topopebrepds_curve returns false else.

Parameters
----------
I: TopOpeBRepDS_Interference

Returns
-------
bool
") MatchInterference;
		virtual Standard_Boolean MatchInterference(const opencascade::handle<TopOpeBRepDS_Interference> & I);

		/****************** Orientation ******************/
		/**** md5 signature: 2b25381a7db220c2390cfe75dd2cf1f5 ****/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopAbs_State

Returns
-------
TopAbs_Orientation
") Orientation;
		TopAbs_Orientation Orientation(const TopAbs_State S);

		/****************** PCurve ******************/
		/**** md5 signature: 8293ea8e22edce20d70506232b818ed1 ****/
		%feature("compactdefaultargs") PCurve;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom2d_Curve>
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
		%feature("autodoc", "No available documentation.

Parameters
----------
T: TopOpeBRepDS_Transition
ST: TopOpeBRepDS_Kind
S: int
GT: TopOpeBRepDS_Kind
G: int
P: float

Returns
-------
None
") TopOpeBRepDS_CurvePointInterference;
		 TopOpeBRepDS_CurvePointInterference(const TopOpeBRepDS_Transition & T, const TopOpeBRepDS_Kind ST, const Standard_Integer S, const TopOpeBRepDS_Kind GT, const Standard_Integer G, const Standard_Real P);

		/****************** Parameter ******************/
		/**** md5 signature: ecccdeaeaa0deed24f47e61ad75d24f1 ****/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Parameter;
		Standard_Real Parameter();

		/****************** Parameter ******************/
		/**** md5 signature: 26acaf0b4677a7a04af978de63424b8a ****/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: float

Returns
-------
None
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
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopOpeBRepDS_PointData;
		 TopOpeBRepDS_PointData();

		/****************** TopOpeBRepDS_PointData ******************/
		/**** md5 signature: 101135fde8c14adfac00bc7a7fbc030f ****/
		%feature("compactdefaultargs") TopOpeBRepDS_PointData;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: TopOpeBRepDS_Point

Returns
-------
None
") TopOpeBRepDS_PointData;
		 TopOpeBRepDS_PointData(const TopOpeBRepDS_Point & P);

		/****************** TopOpeBRepDS_PointData ******************/
		/**** md5 signature: 6f9f1466981617ccc2049daa2802e3d1 ****/
		%feature("compactdefaultargs") TopOpeBRepDS_PointData;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: TopOpeBRepDS_Point
I1: int
I2: int

Returns
-------
None
") TopOpeBRepDS_PointData;
		 TopOpeBRepDS_PointData(const TopOpeBRepDS_Point & P, const Standard_Integer I1, const Standard_Integer I2);

		/****************** GetShapes ******************/
		/**** md5 signature: f83386b9050594750b3cbd4a9b328f40 ****/
		%feature("compactdefaultargs") GetShapes;
		%feature("autodoc", "No available documentation.

Parameters
----------

Returns
-------
I1: int
I2: int
") GetShapes;
		void GetShapes(Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** SetShapes ******************/
		/**** md5 signature: 3595c3b14ebeb78e69fcff771910d717 ****/
		%feature("compactdefaultargs") SetShapes;
		%feature("autodoc", "No available documentation.

Parameters
----------
I1: int
I2: int

Returns
-------
None
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
		%feature("autodoc", "Creates an iterator on the points on curves described by the interferences in <l>.

Parameters
----------
L: TopOpeBRepDS_ListOfInterference

Returns
-------
None
") TopOpeBRepDS_PointIterator;
		 TopOpeBRepDS_PointIterator(const TopOpeBRepDS_ListOfInterference & L);

		/****************** Current ******************/
		/**** md5 signature: a56c202295a85f5f102575dc8279e0d7 ****/
		%feature("compactdefaultargs") Current;
		%feature("autodoc", "Index of the point in the data structure.

Returns
-------
int
") Current;
		Standard_Integer Current();

		/****************** DiffOriented ******************/
		/**** md5 signature: 466fb314d7b9e72be54b11041e5045a6 ****/
		%feature("compactdefaultargs") DiffOriented;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") DiffOriented;
		Standard_Boolean DiffOriented();

		/****************** IsPoint ******************/
		/**** md5 signature: 64dc7ed350d49695713d262fc8866a96 ****/
		%feature("compactdefaultargs") IsPoint;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsPoint;
		Standard_Boolean IsPoint();

		/****************** IsVertex ******************/
		/**** md5 signature: 7dbb6189450b7f2ae76146c6d5d6e875 ****/
		%feature("compactdefaultargs") IsVertex;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsVertex;
		Standard_Boolean IsVertex();

		/****************** MatchInterference ******************/
		/**** md5 signature: 65853f9699421547bf44f4ac95967e30 ****/
		%feature("compactdefaultargs") MatchInterference;
		%feature("autodoc", "Returns true if the interference <i> has a geometrytype() topopebrepds_point or topopebrepds_vertex returns false else.

Parameters
----------
I: TopOpeBRepDS_Interference

Returns
-------
bool
") MatchInterference;
		virtual Standard_Boolean MatchInterference(const opencascade::handle<TopOpeBRepDS_Interference> & I);

		/****************** Orientation ******************/
		/**** md5 signature: 2b25381a7db220c2390cfe75dd2cf1f5 ****/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopAbs_State

Returns
-------
TopAbs_Orientation
") Orientation;
		TopAbs_Orientation Orientation(const TopAbs_State S);

		/****************** Parameter ******************/
		/**** md5 signature: ecccdeaeaa0deed24f47e61ad75d24f1 ****/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Parameter;
		Standard_Real Parameter();

		/****************** SameOriented ******************/
		/**** md5 signature: 7ddd32a10a8f31f931586309eb2ef5bd ****/
		%feature("compactdefaultargs") SameOriented;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") SameOriented;
		Standard_Boolean SameOriented();

		/****************** Support ******************/
		/**** md5 signature: 7aa624728551f1bd526b097364323e6c ****/
		%feature("compactdefaultargs") Support;
		%feature("autodoc", "No available documentation.

Returns
-------
int
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
		%feature("autodoc", "A shape interfers on shape <g> with shape <s>. examples : create a shapeshapeinterference describing : vertex v of edge e1 found on edge e2 : st,s,gt,g = topopebrepds_edge,e2,topopebrepds_vertex,v //! create a shapeshapeinterference describing vertex v of edge e found on face f : st,s,gt,g = topopebrepds_face,f,topopebrepds_vertex,v //! <gbound> indicates if shape <g> is a bound of shape <s>. //! <scc> : unsh_geometry : <s> and <ancestor> have any types, <s> and <ancestor> don't share the same geometry same_oriented : <s> and <ancestor> have identical types, <s> and <ancestor> orientations are identical. diff_oriented : <s> and <ancestor> have identical types, <s> and <ancestor> orientations are different.

Parameters
----------
T: TopOpeBRepDS_Transition
ST: TopOpeBRepDS_Kind
S: int
GT: TopOpeBRepDS_Kind
G: int
GBound: bool
C: TopOpeBRepDS_Config

Returns
-------
None
") TopOpeBRepDS_ShapeShapeInterference;
		 TopOpeBRepDS_ShapeShapeInterference(const TopOpeBRepDS_Transition & T, const TopOpeBRepDS_Kind ST, const Standard_Integer S, const TopOpeBRepDS_Kind GT, const Standard_Integer G, const Standard_Boolean GBound, const TopOpeBRepDS_Config C);

		/****************** Config ******************/
		/**** md5 signature: a2e2863b46aaef1bb776ec36ce222134 ****/
		%feature("compactdefaultargs") Config;
		%feature("autodoc", "No available documentation.

Returns
-------
TopOpeBRepDS_Config
") Config;
		TopOpeBRepDS_Config Config();

		/****************** GBound ******************/
		/**** md5 signature: 474bafe1cc0a3b14453ea14c11b4bbb5 ****/
		%feature("compactdefaultargs") GBound;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") GBound;
		Standard_Boolean GBound();

		/****************** SetGBound ******************/
		/**** md5 signature: d4bcfc295330ec37f4b72e3e05a87d19 ****/
		%feature("compactdefaultargs") SetGBound;
		%feature("autodoc", "No available documentation.

Parameters
----------
b: bool

Returns
-------
None
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
		%feature("autodoc", "No available documentation.

Parameters
----------
Transition: TopOpeBRepDS_Transition
SupportType: TopOpeBRepDS_Kind
Support: int
GeometryType: TopOpeBRepDS_Kind
Geometry: int

Returns
-------
None
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
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopOpeBRepDS_SurfaceCurveInterference;
		 TopOpeBRepDS_SurfaceCurveInterference();

		/****************** TopOpeBRepDS_SurfaceCurveInterference ******************/
		/**** md5 signature: 1876a0c0b8a811e2c22fa5353edc53a7 ****/
		%feature("compactdefaultargs") TopOpeBRepDS_SurfaceCurveInterference;
		%feature("autodoc", "No available documentation.

Parameters
----------
Transition: TopOpeBRepDS_Transition
SupportType: TopOpeBRepDS_Kind
Support: int
GeometryType: TopOpeBRepDS_Kind
Geometry: int
PC: Geom2d_Curve

Returns
-------
None
") TopOpeBRepDS_SurfaceCurveInterference;
		 TopOpeBRepDS_SurfaceCurveInterference(const TopOpeBRepDS_Transition & Transition, const TopOpeBRepDS_Kind SupportType, const Standard_Integer Support, const TopOpeBRepDS_Kind GeometryType, const Standard_Integer Geometry, const opencascade::handle<Geom2d_Curve> & PC);

		/****************** TopOpeBRepDS_SurfaceCurveInterference ******************/
		/**** md5 signature: 527fae42a771e52602c040083be3b2e2 ****/
		%feature("compactdefaultargs") TopOpeBRepDS_SurfaceCurveInterference;
		%feature("autodoc", "No available documentation.

Parameters
----------
I: TopOpeBRepDS_Interference

Returns
-------
None
") TopOpeBRepDS_SurfaceCurveInterference;
		 TopOpeBRepDS_SurfaceCurveInterference(const opencascade::handle<TopOpeBRepDS_Interference> & I);

		/****************** PCurve ******************/
		/**** md5 signature: 8293ea8e22edce20d70506232b818ed1 ****/
		%feature("compactdefaultargs") PCurve;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom2d_Curve>
") PCurve;
		const opencascade::handle<Geom2d_Curve> & PCurve();

		/****************** PCurve ******************/
		/**** md5 signature: 2a9e7b35cdc30e1b3fe1aa52cdef828a ****/
		%feature("compactdefaultargs") PCurve;
		%feature("autodoc", "No available documentation.

Parameters
----------
PC: Geom2d_Curve

Returns
-------
None
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
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopOpeBRepDS_SurfaceData;
		 TopOpeBRepDS_SurfaceData();

		/****************** TopOpeBRepDS_SurfaceData ******************/
		/**** md5 signature: 0f87db337a7f4a4afd8227cbded7271a ****/
		%feature("compactdefaultargs") TopOpeBRepDS_SurfaceData;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopOpeBRepDS_Surface

Returns
-------
None
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
		%feature("autodoc", "Creates an iterator on the surfaces on solid described by the interferences in <l>.

Parameters
----------
L: TopOpeBRepDS_ListOfInterference

Returns
-------
None
") TopOpeBRepDS_SurfaceIterator;
		 TopOpeBRepDS_SurfaceIterator(const TopOpeBRepDS_ListOfInterference & L);

		/****************** Current ******************/
		/**** md5 signature: a56c202295a85f5f102575dc8279e0d7 ****/
		%feature("compactdefaultargs") Current;
		%feature("autodoc", "Index of the surface in the data structure.

Returns
-------
int
") Current;
		Standard_Integer Current();

		/****************** Orientation ******************/
		/**** md5 signature: 2b25381a7db220c2390cfe75dd2cf1f5 ****/
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "No available documentation.

Parameters
----------
S: TopAbs_State

Returns
-------
TopAbs_Orientation
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
		%feature("autodoc", "Create an interference of vertex <g> on a crossed edge e. //! if support type <st> == edge : <s> is edge e face : <s> is the face with bound e. <t> is the transition along the edge, crossing the crossed edge. e is the crossed edge. <gisbound> indicates if <g> is a bound of the edge. <p> is the parameter of <g> on the edge. //! interference is stored in the list of interfs of the edge.

Parameters
----------
T: TopOpeBRepDS_Transition
ST: TopOpeBRepDS_Kind
S: int
G: int
GIsBound: bool
C: TopOpeBRepDS_Config
P: float

Returns
-------
None
") TopOpeBRepDS_EdgeVertexInterference;
		 TopOpeBRepDS_EdgeVertexInterference(const TopOpeBRepDS_Transition & T, const TopOpeBRepDS_Kind ST, const Standard_Integer S, const Standard_Integer G, const Standard_Boolean GIsBound, const TopOpeBRepDS_Config C, const Standard_Real P);

		/****************** TopOpeBRepDS_EdgeVertexInterference ******************/
		/**** md5 signature: 3f20aa74eb9e0a4458bdc25bc6cee5b5 ****/
		%feature("compactdefaultargs") TopOpeBRepDS_EdgeVertexInterference;
		%feature("autodoc", "Create an interference of vertex <g> on crossed edge <s>. //! <t> is the transition along the edge, crossing the crossed edge. <s> is the crossed edge. <gisbound> indicates if <g> is a bound of the edge. <c> indicates the geometric configuration between the edge and the crossed edge. <p> is the parameter of <g> on the edge. //! interference is stored in the list of interfs of the edge.

Parameters
----------
T: TopOpeBRepDS_Transition
S: int
G: int
GIsBound: bool
C: TopOpeBRepDS_Config
P: float

Returns
-------
None
") TopOpeBRepDS_EdgeVertexInterference;
		 TopOpeBRepDS_EdgeVertexInterference(const TopOpeBRepDS_Transition & T, const Standard_Integer S, const Standard_Integer G, const Standard_Boolean GIsBound, const TopOpeBRepDS_Config C, const Standard_Real P);

		/****************** Parameter ******************/
		/**** md5 signature: ecccdeaeaa0deed24f47e61ad75d24f1 ****/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Parameter;
		Standard_Real Parameter();

		/****************** Parameter ******************/
		/**** md5 signature: 26acaf0b4677a7a04af978de63424b8a ****/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "No available documentation.

Parameters
----------
P: float

Returns
-------
None
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
		%feature("autodoc", "Create an interference of edge <g> on face <s>.

Parameters
----------
T: TopOpeBRepDS_Transition
S: int
G: int
GIsBound: bool
C: TopOpeBRepDS_Config

Returns
-------
None
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
