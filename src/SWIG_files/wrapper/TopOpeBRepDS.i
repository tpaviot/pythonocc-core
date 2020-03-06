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

class TopOpeBRepDS_Config:
	TopOpeBRepDS_UNSHGEOMETRY = 0
	TopOpeBRepDS_SAMEORIENTED = 1
	TopOpeBRepDS_DIFFORIENTED = 2

class TopOpeBRepDS_CheckStatus:
	TopOpeBRepDS_OK = 0
	TopOpeBRepDS_NOK = 1

class TopOpeBRepDS_Kind:
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
		%feature("compactdefaultargs") TopOpeBRepDS_Association;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopOpeBRepDS_Association;
		 TopOpeBRepDS_Association();

		/****************** AreAssociated ******************/
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
		%feature("compactdefaultargs") TopOpeBRepDS_BuildTool;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopOpeBRepDS_BuildTool;
		 TopOpeBRepDS_BuildTool();

		/****************** TopOpeBRepDS_BuildTool ******************/
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
		%feature("compactdefaultargs") Approximation;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") Approximation;
		Standard_Boolean Approximation();

		/****************** ChangeGeomTool ******************/
		%feature("compactdefaultargs") ChangeGeomTool;
		%feature("autodoc", "No available documentation.

Returns
-------
TopOpeBRepTool_GeomTool
") ChangeGeomTool;
		TopOpeBRepTool_GeomTool & ChangeGeomTool();

		/****************** Closed ******************/
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
		%feature("compactdefaultargs") GetGeomTool;
		%feature("autodoc", "No available documentation.

Returns
-------
TopOpeBRepTool_GeomTool
") GetGeomTool;
		const TopOpeBRepTool_GeomTool & GetGeomTool();

		/****************** GetOrientedEdgeVertices ******************/
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
		%feature("compactdefaultargs") OverWrite;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") OverWrite;
		Standard_Boolean OverWrite();

		/****************** OverWrite ******************/
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
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") Translate;
		Standard_Boolean Translate();

		/****************** Translate ******************/
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
		%feature("compactdefaultargs") TopOpeBRepDS_Check;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopOpeBRepDS_Check;
		 TopOpeBRepDS_Check();

		/****************** TopOpeBRepDS_Check ******************/
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
		%feature("compactdefaultargs") ChangeHDS;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TopOpeBRepDS_HDataStructure>
") ChangeHDS;
		opencascade::handle<TopOpeBRepDS_HDataStructure> & ChangeHDS();

		/****************** CheckDS ******************/
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
		%feature("compactdefaultargs") ChkIntg;
		%feature("autodoc", "Check integrition of ds.

Returns
-------
bool
") ChkIntg;
		Standard_Boolean ChkIntg();

		/****************** ChkIntgInterf ******************/
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
		%feature("compactdefaultargs") ChkIntgSamDom;
		%feature("autodoc", "Check integrition des champs samedomain de la ds.

Returns
-------
bool
") ChkIntgSamDom;
		Standard_Boolean ChkIntgSamDom();

		/****************** HDS ******************/
		%feature("compactdefaultargs") HDS;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TopOpeBRepDS_HDataStructure>
") HDS;
		const opencascade::handle<TopOpeBRepDS_HDataStructure> & HDS();

		/****************** OneVertexOnPnt ******************/
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
		%feature("compactdefaultargs") TopOpeBRepDS_Curve;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopOpeBRepDS_Curve;
		 TopOpeBRepDS_Curve();

		/****************** TopOpeBRepDS_Curve ******************/
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
		%feature("compactdefaultargs") ChangeCurve;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom_Curve>
") ChangeCurve;
		opencascade::handle<Geom_Curve> & ChangeCurve();

		/****************** ChangeDSIndex ******************/
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
		%feature("compactdefaultargs") ChangeShape1;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Shape
") ChangeShape1;
		TopoDS_Shape ChangeShape1();

		/****************** ChangeShape2 ******************/
		%feature("compactdefaultargs") ChangeShape2;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Shape
") ChangeShape2;
		TopoDS_Shape ChangeShape2();

		/****************** Curve ******************/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom_Curve>
") Curve;
		const opencascade::handle<Geom_Curve> & Curve();

		/****************** Curve ******************/
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
		%feature("compactdefaultargs") Curve1;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom2d_Curve>
") Curve1;
		const opencascade::handle<Geom2d_Curve> & Curve1();

		/****************** Curve1 ******************/
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
		%feature("compactdefaultargs") Curve2;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom2d_Curve>
") Curve2;
		const opencascade::handle<Geom2d_Curve> & Curve2();

		/****************** Curve2 ******************/
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
		%feature("compactdefaultargs") DSIndex;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") DSIndex;
		Standard_Integer DSIndex();

		/****************** DefineCurve ******************/
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
		%feature("compactdefaultargs") GetSCI1;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TopOpeBRepDS_Interference>
") GetSCI1;
		const opencascade::handle<TopOpeBRepDS_Interference> & GetSCI1();

		/****************** GetSCI2 ******************/
		%feature("compactdefaultargs") GetSCI2;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<TopOpeBRepDS_Interference>
") GetSCI2;
		const opencascade::handle<TopOpeBRepDS_Interference> & GetSCI2();

		/****************** GetShapes ******************/
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
		%feature("compactdefaultargs") IsWalk;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsWalk;
		Standard_Boolean IsWalk();

		/****************** Keep ******************/
		%feature("compactdefaultargs") Keep;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") Keep;
		Standard_Boolean Keep();

		/****************** Mother ******************/
		%feature("compactdefaultargs") Mother;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") Mother;
		Standard_Integer Mother();

		/****************** Range ******************/
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
		%feature("compactdefaultargs") Shape1;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Shape
") Shape1;
		const TopoDS_Shape Shape1();

		/****************** Shape2 ******************/
		%feature("compactdefaultargs") Shape2;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Shape
") Shape2;
		const TopoDS_Shape Shape2();

		/****************** Tolerance ******************/
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
		%feature("compactdefaultargs") TopOpeBRepDS_CurveExplorer;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopOpeBRepDS_CurveExplorer;
		 TopOpeBRepDS_CurveExplorer();

		/****************** TopOpeBRepDS_CurveExplorer ******************/
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
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "No available documentation.

Returns
-------
TopOpeBRepDS_Curve
") Curve;
		const TopOpeBRepDS_Curve & Curve();

		/****************** Curve ******************/
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
DS: TopOpeBRepDS_DataStructure
FindOnlyKeep: bool,optional
	default value is Standard_True

Returns
-------
None
") Init;
		void Init(const TopOpeBRepDS_DataStructure & DS, const Standard_Boolean FindOnlyKeep = Standard_True);

		/****************** IsCurve ******************/
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
		%feature("compactdefaultargs") More;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") More;
		Standard_Boolean More();

		/****************** NbCurve ******************/
		%feature("compactdefaultargs") NbCurve;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbCurve;
		Standard_Integer NbCurve();

		/****************** Next ******************/
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
		%feature("compactdefaultargs") TopOpeBRepDS_DataStructure;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopOpeBRepDS_DataStructure;
		 TopOpeBRepDS_DataStructure();

		/****************** AddCurve ******************/
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
		%feature("compactdefaultargs") ChangeMapOfRejectedShapesObj;
		%feature("autodoc", "No available documentation.

Returns
-------
TopTools_IndexedMapOfShape
") ChangeMapOfRejectedShapesObj;
		TopTools_IndexedMapOfShape & ChangeMapOfRejectedShapesObj();

		/****************** ChangeMapOfRejectedShapesTool ******************/
		%feature("compactdefaultargs") ChangeMapOfRejectedShapesTool;
		%feature("autodoc", "No available documentation.

Returns
-------
TopTools_IndexedMapOfShape
") ChangeMapOfRejectedShapesTool;
		TopTools_IndexedMapOfShape & ChangeMapOfRejectedShapesTool();

		/****************** ChangeMapOfShapeWithState ******************/
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
		%feature("compactdefaultargs") ChangeMapOfShapeWithStateObj;
		%feature("autodoc", "No available documentation.

Returns
-------
TopOpeBRepDS_IndexedDataMapOfShapeWithState
") ChangeMapOfShapeWithStateObj;
		TopOpeBRepDS_IndexedDataMapOfShapeWithState & ChangeMapOfShapeWithStateObj();

		/****************** ChangeMapOfShapeWithStateTool ******************/
		%feature("compactdefaultargs") ChangeMapOfShapeWithStateTool;
		%feature("autodoc", "No available documentation.

Returns
-------
TopOpeBRepDS_IndexedDataMapOfShapeWithState
") ChangeMapOfShapeWithStateTool;
		TopOpeBRepDS_IndexedDataMapOfShapeWithState & ChangeMapOfShapeWithStateTool();

		/****************** ChangeNbCurves ******************/
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
		%feature("compactdefaultargs") ChangeShapes;
		%feature("autodoc", "No available documentation.

Returns
-------
TopOpeBRepDS_MapOfShapeData
") ChangeShapes;
		TopOpeBRepDS_MapOfShapeData & ChangeShapes();

		/****************** ChangeSurface ******************/
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
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Reset the data structure.

Returns
-------
None
") Init;
		void Init();

		/****************** InitSectionEdges ******************/
		%feature("compactdefaultargs") InitSectionEdges;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") InitSectionEdges;
		void InitSectionEdges();

		/****************** IsSectionEdge ******************/
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
		%feature("compactdefaultargs") Isfafa;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") Isfafa;
		Standard_Boolean Isfafa();

		/****************** KeepCurve ******************/
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
		%feature("compactdefaultargs") NbCurves;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbCurves;
		Standard_Integer NbCurves();

		/****************** NbPoints ******************/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbPoints;
		Standard_Integer NbPoints();

		/****************** NbSectionEdges ******************/
		%feature("compactdefaultargs") NbSectionEdges;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbSectionEdges;
		Standard_Integer NbSectionEdges();

		/****************** NbShapes ******************/
		%feature("compactdefaultargs") NbShapes;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbShapes;
		Standard_Integer NbShapes();

		/****************** NbSurfaces ******************/
		%feature("compactdefaultargs") NbSurfaces;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbSurfaces;
		Standard_Integer NbSurfaces();

		/****************** NewSurface ******************/
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
		%feature("compactdefaultargs") ProcessEdgeInterferences;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") ProcessEdgeInterferences;
		void ProcessEdgeInterferences();

		/****************** ProcessEdgeInterferences ******************/
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
		%feature("compactdefaultargs") TopOpeBRepDS_Edge3dInterferenceTool;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopOpeBRepDS_Edge3dInterferenceTool;
		 TopOpeBRepDS_Edge3dInterferenceTool();

		/****************** Add ******************/
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
		%feature("compactdefaultargs") TopOpeBRepDS_EdgeInterferenceTool;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopOpeBRepDS_EdgeInterferenceTool;
		 TopOpeBRepDS_EdgeInterferenceTool();

		/****************** Add ******************/
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
		%feature("compactdefaultargs") TopOpeBRepDS_Explorer;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopOpeBRepDS_Explorer;
		 TopOpeBRepDS_Explorer();

		/****************** TopOpeBRepDS_Explorer ******************/
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
		%feature("compactdefaultargs") Current;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Shape
") Current;
		const TopoDS_Shape Current();

		/****************** Edge ******************/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Edge
") Edge;
		const TopoDS_Edge Edge();

		/****************** Face ******************/
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "No available documentation.

Returns
-------
TopoDS_Face
") Face;
		const TopoDS_Face Face();

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

		/****************** Type ******************/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "No available documentation.

Returns
-------
TopAbs_ShapeEnum
") Type;
		TopAbs_ShapeEnum Type();

		/****************** Vertex ******************/
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
		%feature("compactdefaultargs") IsEdgePntParDef;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsEdgePntParDef;
		Standard_Boolean IsEdgePntParDef();

		/****************** SetEdgePntPar ******************/
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
		%feature("compactdefaultargs") ProcessCurveInterferences;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") ProcessCurveInterferences;
		void ProcessCurveInterferences();

		/****************** ProcessCurveInterferences ******************/
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
		%feature("compactdefaultargs") ProcessEdgeInterferences;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") ProcessEdgeInterferences;
		void ProcessEdgeInterferences();

		/****************** ProcessEdgeInterferences ******************/
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
		%feature("compactdefaultargs") BuildNewGeometries;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") BuildNewGeometries;
		void BuildNewGeometries();

		/****************** CheckConnexity ******************/
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
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Perform;
		void Perform();

		/****************** ReBuildGeom ******************/
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
		%feature("compactdefaultargs") TopOpeBRepDS_GapTool;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopOpeBRepDS_GapTool;
		 TopOpeBRepDS_GapTool();

		/****************** TopOpeBRepDS_GapTool ******************/
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
		%feature("compactdefaultargs") TopOpeBRepDS_GeometryData;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopOpeBRepDS_GeometryData;
		 TopOpeBRepDS_GeometryData();

		/****************** TopOpeBRepDS_GeometryData ******************/
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
		%feature("compactdefaultargs") ChangeInterferences;
		%feature("autodoc", "No available documentation.

Returns
-------
TopOpeBRepDS_ListOfInterference
") ChangeInterferences;
		TopOpeBRepDS_ListOfInterference & ChangeInterferences();

		/****************** Interferences ******************/
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
		%feature("compactdefaultargs") TopOpeBRepDS_Interference;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopOpeBRepDS_Interference;
		 TopOpeBRepDS_Interference();

		/****************** TopOpeBRepDS_Interference ******************/
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
		%feature("compactdefaultargs") ChangeTransition;
		%feature("autodoc", "No available documentation.

Returns
-------
TopOpeBRepDS_Transition
") ChangeTransition;
		TopOpeBRepDS_Transition & ChangeTransition();

		/****************** GKGSKS ******************/
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
		%feature("compactdefaultargs") Geometry;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") Geometry;
		Standard_Integer Geometry();

		/****************** Geometry ******************/
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
		%feature("compactdefaultargs") GeometryType;
		%feature("autodoc", "No available documentation.

Returns
-------
TopOpeBRepDS_Kind
") GeometryType;
		TopOpeBRepDS_Kind GeometryType();

		/****************** GeometryType ******************/
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
		%feature("compactdefaultargs") Support;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") Support;
		Standard_Integer Support();

		/****************** Support ******************/
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
		%feature("compactdefaultargs") SupportType;
		%feature("autodoc", "No available documentation.

Returns
-------
TopOpeBRepDS_Kind
") SupportType;
		TopOpeBRepDS_Kind SupportType();

		/****************** SupportType ******************/
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
		%feature("compactdefaultargs") Transition;
		%feature("autodoc", "No available documentation.

Returns
-------
TopOpeBRepDS_Transition
") Transition;
		const TopOpeBRepDS_Transition & Transition();

		/****************** Transition ******************/
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
		%feature("compactdefaultargs") TopOpeBRepDS_InterferenceIterator;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopOpeBRepDS_InterferenceIterator;
		 TopOpeBRepDS_InterferenceIterator();

		/****************** TopOpeBRepDS_InterferenceIterator ******************/
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
		%feature("compactdefaultargs") ChangeIterator;
		%feature("autodoc", "No available documentation.

Returns
-------
TopOpeBRepDS_ListIteratorOfListOfInterference
") ChangeIterator;
		TopOpeBRepDS_ListIteratorOfListOfInterference & ChangeIterator();

		/****************** Geometry ******************/
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
		%feature("compactdefaultargs") Match;
		%feature("autodoc", "Reach for an interference matching the conditions (if defined).

Returns
-------
None
") Match;
		void Match();

		/****************** MatchInterference ******************/
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
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Returns true if there is a current interference in the iteration.

Returns
-------
bool
") More;
		Standard_Boolean More();

		/****************** Next ******************/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Move to the next interference.

Returns
-------
None
") Next;
		void Next();

		/****************** Support ******************/
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
		%feature("compactdefaultargs") TopOpeBRepDS_ListOfShapeOn1State;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopOpeBRepDS_ListOfShapeOn1State;
		 TopOpeBRepDS_ListOfShapeOn1State();

		/****************** ChangeListOnState ******************/
		%feature("compactdefaultargs") ChangeListOnState;
		%feature("autodoc", "No available documentation.

Returns
-------
TopTools_ListOfShape
") ChangeListOnState;
		TopTools_ListOfShape & ChangeListOnState();

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Clear;
		void Clear();

		/****************** IsSplit ******************/
		%feature("compactdefaultargs") IsSplit;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsSplit;
		Standard_Boolean IsSplit();

		/****************** ListOnState ******************/
		%feature("compactdefaultargs") ListOnState;
		%feature("autodoc", "No available documentation.

Returns
-------
TopTools_ListOfShape
") ListOnState;
		const TopTools_ListOfShape & ListOnState();

		/****************** Split ******************/
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
		%feature("compactdefaultargs") TopOpeBRepDS_Marker;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopOpeBRepDS_Marker;
		 TopOpeBRepDS_Marker();

		/****************** Allocate ******************/
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
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Reset;
		void Reset();

		/****************** Set ******************/
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
		%feature("compactdefaultargs") TopOpeBRepDS_Point;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopOpeBRepDS_Point;
		 TopOpeBRepDS_Point();

		/****************** TopOpeBRepDS_Point ******************/
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
		%feature("compactdefaultargs") ChangePoint;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Pnt
") ChangePoint;
		gp_Pnt ChangePoint();

		/****************** IsEqual ******************/
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
		%feature("compactdefaultargs") Keep;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") Keep;
		Standard_Boolean Keep();

		/****************** Point ******************/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "No available documentation.

Returns
-------
gp_Pnt
") Point;
		const gp_Pnt Point();

		/****************** Tolerance ******************/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Tolerance;
		Standard_Real Tolerance();

		/****************** Tolerance ******************/
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
		%feature("compactdefaultargs") TopOpeBRepDS_PointExplorer;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopOpeBRepDS_PointExplorer;
		 TopOpeBRepDS_PointExplorer();

		/****************** TopOpeBRepDS_PointExplorer ******************/
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
DS: TopOpeBRepDS_DataStructure
FindOnlyKeep: bool,optional
	default value is Standard_True

Returns
-------
None
") Init;
		void Init(const TopOpeBRepDS_DataStructure & DS, const Standard_Boolean FindOnlyKeep = Standard_True);

		/****************** IsPoint ******************/
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
		%feature("compactdefaultargs") More;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") More;
		Standard_Boolean More();

		/****************** NbPoint ******************/
		%feature("compactdefaultargs") NbPoint;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbPoint;
		Standard_Integer NbPoint();

		/****************** Next ******************/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Next;
		void Next();

		/****************** Point ******************/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "No available documentation.

Returns
-------
TopOpeBRepDS_Point
") Point;
		const TopOpeBRepDS_Point & Point();

		/****************** Point ******************/
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
		%feature("compactdefaultargs") ProcessEdgeInterferences;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") ProcessEdgeInterferences;
		void ProcessEdgeInterferences();

		/****************** ProcessFaceInterferences ******************/
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
		%feature("compactdefaultargs") TopOpeBRepDS_ShapeData;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopOpeBRepDS_ShapeData;
		 TopOpeBRepDS_ShapeData();

		/****************** ChangeInterferences ******************/
		%feature("compactdefaultargs") ChangeInterferences;
		%feature("autodoc", "No available documentation.

Returns
-------
TopOpeBRepDS_ListOfInterference
") ChangeInterferences;
		TopOpeBRepDS_ListOfInterference & ChangeInterferences();

		/****************** ChangeKeep ******************/
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
		%feature("compactdefaultargs") Interferences;
		%feature("autodoc", "No available documentation.

Returns
-------
TopOpeBRepDS_ListOfInterference
") Interferences;
		const TopOpeBRepDS_ListOfInterference & Interferences();

		/****************** Keep ******************/
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
		%feature("compactdefaultargs") TopOpeBRepDS_ShapeWithState;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopOpeBRepDS_ShapeWithState;
		 TopOpeBRepDS_ShapeWithState();

		/****************** AddPart ******************/
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
		%feature("compactdefaultargs") IsSplitted;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsSplitted;
		Standard_Boolean IsSplitted();

		/****************** Part ******************/
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
		%feature("compactdefaultargs") TopOpeBRepDS_Surface;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopOpeBRepDS_Surface;
		 TopOpeBRepDS_Surface();

		/****************** TopOpeBRepDS_Surface ******************/
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
		%feature("compactdefaultargs") Keep;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") Keep;
		Standard_Boolean Keep();

		/****************** Surface ******************/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom_Surface>
") Surface;
		const opencascade::handle<Geom_Surface> & Surface();

		/****************** Tolerance ******************/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Tolerance;
		Standard_Real Tolerance();

		/****************** Tolerance ******************/
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
		%feature("compactdefaultargs") TopOpeBRepDS_SurfaceExplorer;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopOpeBRepDS_SurfaceExplorer;
		 TopOpeBRepDS_SurfaceExplorer();

		/****************** TopOpeBRepDS_SurfaceExplorer ******************/
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
DS: TopOpeBRepDS_DataStructure
FindOnlyKeep: bool,optional
	default value is Standard_True

Returns
-------
None
") Init;
		void Init(const TopOpeBRepDS_DataStructure & DS, const Standard_Boolean FindOnlyKeep = Standard_True);

		/****************** IsSurface ******************/
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
		%feature("compactdefaultargs") More;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") More;
		Standard_Boolean More();

		/****************** NbSurface ******************/
		%feature("compactdefaultargs") NbSurface;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") NbSurface;
		Standard_Integer NbSurface();

		/****************** Next ******************/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Next;
		void Next();

		/****************** Surface ******************/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "No available documentation.

Returns
-------
TopOpeBRepDS_Surface
") Surface;
		const TopOpeBRepDS_Surface & Surface();

		/****************** Surface ******************/
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
		%feature("compactdefaultargs") TopOpeBRepDS_TKI;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopOpeBRepDS_TKI;
		 TopOpeBRepDS_TKI();

		/****************** Add ******************/
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
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Clear;
		void Clear();

		/****************** DumpTKIIterator ******************/
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
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Init;
		void Init();

		/****************** Interferences ******************/
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

		/****************** Value ******************/
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
		%feature("compactdefaultargs") TopOpeBRepDS_Transition;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopOpeBRepDS_Transition;
		 TopOpeBRepDS_Transition();

		/****************** TopOpeBRepDS_Transition ******************/
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
		%feature("compactdefaultargs") After;
		%feature("autodoc", "No available documentation.

Returns
-------
TopAbs_State
") After;
		TopAbs_State After();

		/****************** Before ******************/
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
		%feature("compactdefaultargs") Before;
		%feature("autodoc", "No available documentation.

Returns
-------
TopAbs_State
") Before;
		TopAbs_State Before();

		/****************** Complement ******************/
		%feature("compactdefaultargs") Complement;
		%feature("autodoc", "No available documentation.

Returns
-------
TopOpeBRepDS_Transition
") Complement;
		TopOpeBRepDS_Transition Complement();

		/****************** Index ******************/
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
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") Index;
		Standard_Integer Index();

		/****************** IndexAfter ******************/
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
		%feature("compactdefaultargs") IndexAfter;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") IndexAfter;
		Standard_Integer IndexAfter();

		/****************** IndexBefore ******************/
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
		%feature("compactdefaultargs") IndexBefore;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") IndexBefore;
		Standard_Integer IndexBefore();

		/****************** IsUnknown ******************/
		%feature("compactdefaultargs") IsUnknown;
		%feature("autodoc", "Returns true if both states are unknown.

Returns
-------
bool
") IsUnknown;
		Standard_Boolean IsUnknown();

		/****************** ONAfter ******************/
		%feature("compactdefaultargs") ONAfter;
		%feature("autodoc", "No available documentation.

Returns
-------
TopAbs_ShapeEnum
") ONAfter;
		TopAbs_ShapeEnum ONAfter();

		/****************** ONBefore ******************/
		%feature("compactdefaultargs") ONBefore;
		%feature("autodoc", "No available documentation.

Returns
-------
TopAbs_ShapeEnum
") ONBefore;
		TopAbs_ShapeEnum ONBefore();

		/****************** Orientation ******************/
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
		%feature("compactdefaultargs") ShapeAfter;
		%feature("autodoc", "No available documentation.

Returns
-------
TopAbs_ShapeEnum
") ShapeAfter;
		TopAbs_ShapeEnum ShapeAfter();

		/****************** ShapeBefore ******************/
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
		%feature("compactdefaultargs") ShapeBefore;
		%feature("autodoc", "No available documentation.

Returns
-------
TopAbs_ShapeEnum
") ShapeBefore;
		TopAbs_ShapeEnum ShapeBefore();

		/****************** StateAfter ******************/
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
		%feature("compactdefaultargs") TopOpeBRepDS_CurveData;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopOpeBRepDS_CurveData;
		 TopOpeBRepDS_CurveData();

		/****************** TopOpeBRepDS_CurveData ******************/
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
		%feature("compactdefaultargs") Current;
		%feature("autodoc", "Index of the curve in the data structure.

Returns
-------
int
") Current;
		Standard_Integer Current();

		/****************** MatchInterference ******************/
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
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Parameter;
		Standard_Real Parameter();

		/****************** Parameter ******************/
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
		%feature("compactdefaultargs") TopOpeBRepDS_PointData;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopOpeBRepDS_PointData;
		 TopOpeBRepDS_PointData();

		/****************** TopOpeBRepDS_PointData ******************/
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
		%feature("compactdefaultargs") Current;
		%feature("autodoc", "Index of the point in the data structure.

Returns
-------
int
") Current;
		Standard_Integer Current();

		/****************** DiffOriented ******************/
		%feature("compactdefaultargs") DiffOriented;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") DiffOriented;
		Standard_Boolean DiffOriented();

		/****************** IsPoint ******************/
		%feature("compactdefaultargs") IsPoint;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsPoint;
		Standard_Boolean IsPoint();

		/****************** IsVertex ******************/
		%feature("compactdefaultargs") IsVertex;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsVertex;
		Standard_Boolean IsVertex();

		/****************** MatchInterference ******************/
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
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Parameter;
		Standard_Real Parameter();

		/****************** SameOriented ******************/
		%feature("compactdefaultargs") SameOriented;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") SameOriented;
		Standard_Boolean SameOriented();

		/****************** Support ******************/
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
		%feature("compactdefaultargs") Config;
		%feature("autodoc", "No available documentation.

Returns
-------
TopOpeBRepDS_Config
") Config;
		TopOpeBRepDS_Config Config();

		/****************** GBound ******************/
		%feature("compactdefaultargs") GBound;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") GBound;
		Standard_Boolean GBound();

		/****************** SetGBound ******************/
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
		%feature("compactdefaultargs") TopOpeBRepDS_SurfaceCurveInterference;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopOpeBRepDS_SurfaceCurveInterference;
		 TopOpeBRepDS_SurfaceCurveInterference();

		/****************** TopOpeBRepDS_SurfaceCurveInterference ******************/
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
		%feature("compactdefaultargs") PCurve;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Geom2d_Curve>
") PCurve;
		const opencascade::handle<Geom2d_Curve> & PCurve();

		/****************** PCurve ******************/
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
		%feature("compactdefaultargs") TopOpeBRepDS_SurfaceData;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") TopOpeBRepDS_SurfaceData;
		 TopOpeBRepDS_SurfaceData();

		/****************** TopOpeBRepDS_SurfaceData ******************/
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
		%feature("compactdefaultargs") Current;
		%feature("autodoc", "Index of the surface in the data structure.

Returns
-------
int
") Current;
		Standard_Integer Current();

		/****************** Orientation ******************/
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
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") Parameter;
		Standard_Real Parameter();

		/****************** Parameter ******************/
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
class TopOpeBRepDS_HArray1OfDataMapOfIntegerListOfInterference : public  TopOpeBRepDS_Array1OfDataMapOfIntegerListOfInterference, public Standard_Transient {
  public:
    TopOpeBRepDS_HArray1OfDataMapOfIntegerListOfInterference(const Standard_Integer theLower, const Standard_Integer theUpper);
    TopOpeBRepDS_HArray1OfDataMapOfIntegerListOfInterference(const Standard_Integer theLower, const Standard_Integer theUpper, const  TopOpeBRepDS_Array1OfDataMapOfIntegerListOfInterference::value_type& theValue);
    TopOpeBRepDS_HArray1OfDataMapOfIntegerListOfInterference(const  TopOpeBRepDS_Array1OfDataMapOfIntegerListOfInterference& theOther);
    const  TopOpeBRepDS_Array1OfDataMapOfIntegerListOfInterference& Array1();
     TopOpeBRepDS_Array1OfDataMapOfIntegerListOfInterference& ChangeArray1();
};
%make_alias(TopOpeBRepDS_HArray1OfDataMapOfIntegerListOfInterference)


/* harray2 classes */
/* hsequence classes */
