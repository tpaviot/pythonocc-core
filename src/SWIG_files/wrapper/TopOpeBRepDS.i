/*
Copyright 2008-2025 Thomas Paviot (tpaviot@gmail.com)

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
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_topopebrepds.html"
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
%include ../common/ArrayMacros.i


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
#include<gp_module.hxx>
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
%import gp.i

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
/* end handles declaration */

/* templates */
%ignore NCollection_DataMap<int,TopOpeBRepDS_CheckStatus>::Items;
%ignore NCollection_DataMap<int,TopOpeBRepDS_CheckStatus>::KeyValues;
%template(TopOpeBRepDS_DataMapOfCheckStatus) NCollection_DataMap<int,TopOpeBRepDS_CheckStatus>;
%ignore NCollection_DataMap<int,TopOpeBRepDS_ListOfInterference>::Items;
%ignore NCollection_DataMap<int,TopOpeBRepDS_ListOfInterference>::KeyValues;
%template(TopOpeBRepDS_DataMapOfIntegerListOfInterference) NCollection_DataMap<int,TopOpeBRepDS_ListOfInterference>;
%ignore NCollection_DataMap<opencascade::handle<TopOpeBRepDS_Interference>,TopOpeBRepDS_ListOfInterference>::Items;
%ignore NCollection_DataMap<opencascade::handle<TopOpeBRepDS_Interference>,TopOpeBRepDS_ListOfInterference>::KeyValues;
%template(TopOpeBRepDS_DataMapOfInterferenceListOfInterference) NCollection_DataMap<opencascade::handle<TopOpeBRepDS_Interference>,TopOpeBRepDS_ListOfInterference>;
%ignore NCollection_DataMap<opencascade::handle<TopOpeBRepDS_Interference>,TopoDS_Shape>::Items;
%ignore NCollection_DataMap<opencascade::handle<TopOpeBRepDS_Interference>,TopoDS_Shape>::KeyValues;
%template(TopOpeBRepDS_DataMapOfInterferenceShape) NCollection_DataMap<opencascade::handle<TopOpeBRepDS_Interference>,TopoDS_Shape>;
%ignore NCollection_DataMap<TopoDS_Shape,TopOpeBRepDS_ListOfShapeOn1State,TopTools_ShapeMapHasher>::Items;
%ignore NCollection_DataMap<TopoDS_Shape,TopOpeBRepDS_ListOfShapeOn1State,TopTools_ShapeMapHasher>::KeyValues;
%template(TopOpeBRepDS_DataMapOfShapeListOfShapeOn1State) NCollection_DataMap<TopoDS_Shape,TopOpeBRepDS_ListOfShapeOn1State,TopTools_ShapeMapHasher>;
%ignore NCollection_DataMap<TopoDS_Shape,TopAbs_State,TopTools_ShapeMapHasher>::Items;
%ignore NCollection_DataMap<TopoDS_Shape,TopAbs_State,TopTools_ShapeMapHasher>::KeyValues;
%template(TopOpeBRepDS_DataMapOfShapeState) NCollection_DataMap<TopoDS_Shape,TopAbs_State,TopTools_ShapeMapHasher>;
%template(TopOpeBRepDS_DoubleMapOfIntegerShape) NCollection_DoubleMap<int,TopoDS_Shape,NCollection_DefaultHasher<int>,TopTools_ShapeMapHasher>;
%ignore NCollection_IndexedDataMap<TopoDS_Shape,TopOpeBRepDS_ShapeWithState,TopTools_ShapeMapHasher>::Items;
%ignore NCollection_IndexedDataMap<TopoDS_Shape,TopOpeBRepDS_ShapeWithState,TopTools_ShapeMapHasher>::KeyValues;
%ignore NCollection_IndexedDataMap<TopoDS_Shape,TopOpeBRepDS_ShapeWithState,TopTools_ShapeMapHasher>::IndexedItems;
%ignore NCollection_IndexedDataMap<TopoDS_Shape,TopOpeBRepDS_ShapeWithState,TopTools_ShapeMapHasher>::Contained;
%template(TopOpeBRepDS_IndexedDataMapOfShapeWithState) NCollection_IndexedDataMap<TopoDS_Shape,TopOpeBRepDS_ShapeWithState,TopTools_ShapeMapHasher>;
%ignore NCollection_IndexedDataMap<TopoDS_Shape,TopOpeBRepDS_Point,TopTools_ShapeMapHasher>::Items;
%ignore NCollection_IndexedDataMap<TopoDS_Shape,TopOpeBRepDS_Point,TopTools_ShapeMapHasher>::KeyValues;
%ignore NCollection_IndexedDataMap<TopoDS_Shape,TopOpeBRepDS_Point,TopTools_ShapeMapHasher>::IndexedItems;
%ignore NCollection_IndexedDataMap<TopoDS_Shape,TopOpeBRepDS_Point,TopTools_ShapeMapHasher>::Contained;
%template(TopOpeBRepDS_IndexedDataMapOfVertexPoint) NCollection_IndexedDataMap<TopoDS_Shape,TopOpeBRepDS_Point,TopTools_ShapeMapHasher>;
%template(TopOpeBRepDS_ListIteratorOfListOfInterference) NCollection_TListIterator<opencascade::handle<TopOpeBRepDS_Interference>>;
%template(TopOpeBRepDS_ListOfInterference) NCollection_List<opencascade::handle<TopOpeBRepDS_Interference>>;

%extend NCollection_List<opencascade::handle<TopOpeBRepDS_Interference>> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%ignore NCollection_DataMap<int,TopOpeBRepDS_CurveData>::Items;
%ignore NCollection_DataMap<int,TopOpeBRepDS_CurveData>::KeyValues;
%template(TopOpeBRepDS_MapOfCurve) NCollection_DataMap<int,TopOpeBRepDS_CurveData>;
%ignore NCollection_DataMap<int,TopOpeBRepDS_ShapeData>::Items;
%ignore NCollection_DataMap<int,TopOpeBRepDS_ShapeData>::KeyValues;
%template(TopOpeBRepDS_MapOfIntegerShapeData) NCollection_DataMap<int,TopOpeBRepDS_ShapeData>;
%ignore NCollection_DataMap<int,TopOpeBRepDS_PointData>::Items;
%ignore NCollection_DataMap<int,TopOpeBRepDS_PointData>::KeyValues;
%template(TopOpeBRepDS_MapOfPoint) NCollection_DataMap<int,TopOpeBRepDS_PointData>;
%ignore NCollection_IndexedDataMap<TopoDS_Shape,TopOpeBRepDS_ShapeData,TopTools_ShapeMapHasher>::Items;
%ignore NCollection_IndexedDataMap<TopoDS_Shape,TopOpeBRepDS_ShapeData,TopTools_ShapeMapHasher>::KeyValues;
%ignore NCollection_IndexedDataMap<TopoDS_Shape,TopOpeBRepDS_ShapeData,TopTools_ShapeMapHasher>::IndexedItems;
%ignore NCollection_IndexedDataMap<TopoDS_Shape,TopOpeBRepDS_ShapeData,TopTools_ShapeMapHasher>::Contained;
%template(TopOpeBRepDS_MapOfShapeData) NCollection_IndexedDataMap<TopoDS_Shape,TopOpeBRepDS_ShapeData,TopTools_ShapeMapHasher>;
%ignore NCollection_DataMap<int,TopOpeBRepDS_SurfaceData>::Items;
%ignore NCollection_DataMap<int,TopOpeBRepDS_SurfaceData>::KeyValues;
%template(TopOpeBRepDS_MapOfSurface) NCollection_DataMap<int,TopOpeBRepDS_SurfaceData>;
%ignore NCollection_DataMap<TopoDS_Shape,opencascade::handle<Geom_Surface>,TopTools_ShapeMapHasher>::Items;
%ignore NCollection_DataMap<TopoDS_Shape,opencascade::handle<Geom_Surface>,TopTools_ShapeMapHasher>::KeyValues;
%template(TopOpeBRepDS_ShapeSurface) NCollection_DataMap<TopoDS_Shape,opencascade::handle<Geom_Surface>,TopTools_ShapeMapHasher>;
/* end templates declaration */

/* typedefs */
typedef NCollection_Array1<TopOpeBRepDS_DataMapOfIntegerListOfInterference> TopOpeBRepDS_Array1OfDataMapOfIntegerListOfInterference;
typedef NCollection_DataMap<int, TopOpeBRepDS_CheckStatus>::Iterator TopOpeBRepDS_DataMapIteratorOfDataMapOfCheckStatus;
typedef NCollection_DataMap<int, TopOpeBRepDS_ListOfInterference>::Iterator TopOpeBRepDS_DataMapIteratorOfDataMapOfIntegerListOfInterference;
typedef NCollection_DataMap<opencascade::handle<TopOpeBRepDS_Interference>, TopOpeBRepDS_ListOfInterference>::Iterator TopOpeBRepDS_DataMapIteratorOfDataMapOfInterferenceListOfInterference;
typedef NCollection_DataMap<opencascade::handle<TopOpeBRepDS_Interference>, TopoDS_Shape>::Iterator TopOpeBRepDS_DataMapIteratorOfDataMapOfInterferenceShape;
typedef NCollection_DataMap<TopoDS_Shape, TopOpeBRepDS_ListOfShapeOn1State, TopTools_ShapeMapHasher>::Iterator TopOpeBRepDS_DataMapIteratorOfDataMapOfShapeListOfShapeOn1State;
typedef NCollection_DataMap<TopoDS_Shape, TopAbs_State, TopTools_ShapeMapHasher>::Iterator TopOpeBRepDS_DataMapIteratorOfDataMapOfShapeState;
typedef NCollection_DataMap<int, TopOpeBRepDS_CurveData>::Iterator TopOpeBRepDS_DataMapIteratorOfMapOfCurve;
typedef NCollection_DataMap<int, TopOpeBRepDS_ShapeData>::Iterator TopOpeBRepDS_DataMapIteratorOfMapOfIntegerShapeData;
typedef NCollection_DataMap<int, TopOpeBRepDS_PointData>::Iterator TopOpeBRepDS_DataMapIteratorOfMapOfPoint;
typedef NCollection_DataMap<int, TopOpeBRepDS_SurfaceData>::Iterator TopOpeBRepDS_DataMapIteratorOfMapOfSurface;
typedef NCollection_DataMap<TopoDS_Shape, opencascade::handle<Geom_Surface>, TopTools_ShapeMapHasher>::Iterator TopOpeBRepDS_DataMapIteratorOfShapeSurface;
typedef NCollection_DataMap<int, TopOpeBRepDS_CheckStatus> TopOpeBRepDS_DataMapOfCheckStatus;
typedef NCollection_DataMap<int, TopOpeBRepDS_ListOfInterference> TopOpeBRepDS_DataMapOfIntegerListOfInterference;
typedef NCollection_DataMap<opencascade::handle<TopOpeBRepDS_Interference>, TopOpeBRepDS_ListOfInterference> TopOpeBRepDS_DataMapOfInterferenceListOfInterference;
typedef NCollection_DataMap<opencascade::handle<TopOpeBRepDS_Interference>, TopoDS_Shape> TopOpeBRepDS_DataMapOfInterferenceShape;
typedef NCollection_DataMap<TopoDS_Shape, TopOpeBRepDS_ListOfShapeOn1State, TopTools_ShapeMapHasher> TopOpeBRepDS_DataMapOfShapeListOfShapeOn1State;
typedef NCollection_DataMap<TopoDS_Shape, TopAbs_State, TopTools_ShapeMapHasher> TopOpeBRepDS_DataMapOfShapeState;
typedef NCollection_DoubleMap<int, TopoDS_Shape, NCollection_DefaultHasher<int>, TopTools_ShapeMapHasher>::Iterator TopOpeBRepDS_DoubleMapIteratorOfDoubleMapOfIntegerShape;
typedef NCollection_DoubleMap<int, TopoDS_Shape, NCollection_DefaultHasher<int>, TopTools_ShapeMapHasher> TopOpeBRepDS_DoubleMapOfIntegerShape;
typedef NCollection_HArray1<TopOpeBRepDS_DataMapOfIntegerListOfInterference> TopOpeBRepDS_HArray1OfDataMapOfIntegerListOfInterference;
typedef NCollection_IndexedDataMap<TopoDS_Shape, TopOpeBRepDS_ShapeWithState, TopTools_ShapeMapHasher> TopOpeBRepDS_IndexedDataMapOfShapeWithState;
typedef NCollection_IndexedDataMap<TopoDS_Shape, TopOpeBRepDS_Point, TopTools_ShapeMapHasher> TopOpeBRepDS_IndexedDataMapOfVertexPoint;
typedef NCollection_List<opencascade::handle<TopOpeBRepDS_Interference>>::Iterator TopOpeBRepDS_ListIteratorOfListOfInterference;
typedef NCollection_List<opencascade::handle<TopOpeBRepDS_Interference>> TopOpeBRepDS_ListOfInterference;
typedef NCollection_DataMap<int, TopOpeBRepDS_CurveData> TopOpeBRepDS_MapOfCurve;
typedef NCollection_DataMap<int, TopOpeBRepDS_ShapeData> TopOpeBRepDS_MapOfIntegerShapeData;
typedef NCollection_DataMap<int, TopOpeBRepDS_PointData> TopOpeBRepDS_MapOfPoint;
typedef NCollection_IndexedDataMap<TopoDS_Shape, TopOpeBRepDS_ShapeData, TopTools_ShapeMapHasher> TopOpeBRepDS_MapOfShapeData;
typedef NCollection_DataMap<int, TopOpeBRepDS_SurfaceData> TopOpeBRepDS_MapOfSurface;
typedef NCollection_DataMap<TopoDS_Shape, opencascade::handle<Geom_Surface>, TopTools_ShapeMapHasher> TopOpeBRepDS_ShapeSurface;
/* end typedefs declaration */

/*********************
* class TopOpeBRepDS *
*********************/
%rename(topopebrepds) TopOpeBRepDS;
class TopOpeBRepDS {
	public:
		/****** TopOpeBRepDS::IsGeometry ******/
		/****** md5 signature: cfdcf92a43598a1fc6e88319ab2a0862 ******/
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
		static bool IsGeometry(const TopOpeBRepDS_Kind K);

		/****** TopOpeBRepDS::IsTopology ******/
		/****** md5 signature: 5ae58c444d7627fc81949211cca84e8f ******/
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
		static bool IsTopology(const TopOpeBRepDS_Kind K);

		/****** TopOpeBRepDS::KindToShape ******/
		/****** md5 signature: 4f93bc69579bee1b877edfea8f0ccbd9 ******/
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

		/****** TopOpeBRepDS::Print ******/
		/****** md5 signature: 0ef9d8e552686e3841b3de5afdb9e892 ******/
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

		/****** TopOpeBRepDS::Print ******/
		/****** md5 signature: 3a4129a4c2148a798a76811bead8b8ba ******/
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

		/****** TopOpeBRepDS::Print ******/
		/****** md5 signature: c2c17f1cc64f7d4a8b197e412800ba2d ******/
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
		static Standard_OStream & Print(const TopOpeBRepDS_Kind K, const int I, std::ostream &OutValue, TCollection_AsciiString B = "", TCollection_AsciiString A = "");

		/****** TopOpeBRepDS::Print ******/
		/****** md5 signature: 17ec0c62a9d3401e3e13ad5683c33c07 ******/
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
		static Standard_OStream & Print(const TopAbs_ShapeEnum T, const int I, std::ostream &OutValue);

		/****** TopOpeBRepDS::Print ******/
		/****** md5 signature: a5f6b6cef25348e934b1a293f0918f9b ******/
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

		/****** TopOpeBRepDS::SPrint ******/
		/****** md5 signature: 8e8bd1974589e4b4a60a8ae1d385d1b2 ******/
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
IN OU ON UN.
") SPrint;
		static TCollection_AsciiString SPrint(const TopAbs_State S);

		/****** TopOpeBRepDS::SPrint ******/
		/****** md5 signature: 968197e24095559e9b74f828c6becff7 ******/
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
<K>.
") SPrint;
		static TCollection_AsciiString SPrint(const TopOpeBRepDS_Kind K);

		/****** TopOpeBRepDS::SPrint ******/
		/****** md5 signature: f621632fcd5e33db13021f0ee7cc586a ******/
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
S1(<K>,<I>)S2.
") SPrint;
		static TCollection_AsciiString SPrint(const TopOpeBRepDS_Kind K, const int I, TCollection_AsciiString B = "", TCollection_AsciiString A = "");

		/****** TopOpeBRepDS::SPrint ******/
		/****** md5 signature: bfdba83544259d7a60db9ed56c313822 ******/
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

		/****** TopOpeBRepDS::SPrint ******/
		/****** md5 signature: 4c1affc0e03e541d8e16a159119a0119 ******/
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
(<T>,<I>).
") SPrint;
		static TCollection_AsciiString SPrint(const TopAbs_ShapeEnum T, const int I);

		/****** TopOpeBRepDS::SPrint ******/
		/****** md5 signature: b2e9c40b17d2064b1d342271b06bfc31 ******/
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

		/****** TopOpeBRepDS::SPrint ******/
		/****** md5 signature: a74f48fc6ca5d45de42930d3b22fca1f ******/
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

		/****** TopOpeBRepDS::ShapeToKind ******/
		/****** md5 signature: 26c9c1a2dce5b1a31a4637d999319989 ******/
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
		/****** TopOpeBRepDS_Association::TopOpeBRepDS_Association ******/
		/****** md5 signature: e4e81300cdb8cd7b407eb32100435f79 ******/
		%feature("compactdefaultargs") TopOpeBRepDS_Association;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepDS_Association;
		 TopOpeBRepDS_Association();

		/****** TopOpeBRepDS_Association::AreAssociated ******/
		/****** md5 signature: 5574deb63e05019e25a8d6fd8f667b66 ******/
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
		bool AreAssociated(const opencascade::handle<TopOpeBRepDS_Interference> & I, const opencascade::handle<TopOpeBRepDS_Interference> & K);

		/****** TopOpeBRepDS_Association::Associate ******/
		/****** md5 signature: de02326dc5a740c1244a4872cd74bc4e ******/
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

		/****** TopOpeBRepDS_Association::Associate ******/
		/****** md5 signature: 6c7ef770424c0b064d68277b15adbc1a ******/
		%feature("compactdefaultargs") Associate;
		%feature("autodoc", "
Parameters
----------
I: TopOpeBRepDS_Interference
LI: TopOpeBRepDS_Interference

Return
-------
None

Description
-----------
No available documentation.
") Associate;
		void Associate(const opencascade::handle<TopOpeBRepDS_Interference> & I, const NCollection_List<opencascade::handle<TopOpeBRepDS_Interference> > & LI);

		/****** TopOpeBRepDS_Association::Associated ******/
		/****** md5 signature: 55026c3b148b0eccddd3d57c0a65730e ******/
		%feature("compactdefaultargs") Associated;
		%feature("autodoc", "
Parameters
----------
I: TopOpeBRepDS_Interference

Return
-------
NCollection_List<opencascade::handle<TopOpeBRepDS_Interference>>

Description
-----------
No available documentation.
") Associated;
		NCollection_List<opencascade::handle<TopOpeBRepDS_Interference>> & Associated(const opencascade::handle<TopOpeBRepDS_Interference> & I);

		/****** TopOpeBRepDS_Association::HasAssociation ******/
		/****** md5 signature: 405939b5afdfdac219ad3e37039134b6 ******/
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
		bool HasAssociation(const opencascade::handle<TopOpeBRepDS_Interference> & I);

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
		/****** TopOpeBRepDS_BuildTool::TopOpeBRepDS_BuildTool ******/
		/****** md5 signature: e179694367c7bb5d379d5a549731dcbc ******/
		%feature("compactdefaultargs") TopOpeBRepDS_BuildTool;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepDS_BuildTool;
		 TopOpeBRepDS_BuildTool();

		/****** TopOpeBRepDS_BuildTool::TopOpeBRepDS_BuildTool ******/
		/****** md5 signature: 00739303cea300cc817a756deadf1b49 ******/
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

		/****** TopOpeBRepDS_BuildTool::TopOpeBRepDS_BuildTool ******/
		/****** md5 signature: 0da06c51a0249b2dd4b9ce17d186f195 ******/
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

		/****** TopOpeBRepDS_BuildTool::AddEdgeVertex ******/
		/****** md5 signature: 58bb2ee5393762c0e8e49f8a433e277c ******/
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

		/****** TopOpeBRepDS_BuildTool::AddEdgeVertex ******/
		/****** md5 signature: d3cefa98d80572093c05bdff4359c470 ******/
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

		/****** TopOpeBRepDS_BuildTool::AddFaceWire ******/
		/****** md5 signature: 61e37223c866465cbdca424e9367353d ******/
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

		/****** TopOpeBRepDS_BuildTool::AddShellFace ******/
		/****** md5 signature: e6cdc0d1e33dc9ca784cbb32e551a598 ******/
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

		/****** TopOpeBRepDS_BuildTool::AddSolidShell ******/
		/****** md5 signature: c13854a2554d2626024d2177860b77ef ******/
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

		/****** TopOpeBRepDS_BuildTool::AddWireEdge ******/
		/****** md5 signature: d6a19f1fd9bc39f9a24a491f29232199 ******/
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

		/****** TopOpeBRepDS_BuildTool::ApproxCurves ******/
		/****** md5 signature: ab117f1fe56c0125cf2c91d3a346cc0d ******/
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

		/****** TopOpeBRepDS_BuildTool::Approximation ******/
		/****** md5 signature: 39b8174b8b89cccdd0203f7d6dc32342 ******/
		%feature("compactdefaultargs") Approximation;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") Approximation;
		bool Approximation();

		/****** TopOpeBRepDS_BuildTool::ChangeGeomTool ******/
		/****** md5 signature: ec177d99f76bb4ed7e436f53436adf03 ******/
		%feature("compactdefaultargs") ChangeGeomTool;
		%feature("autodoc", "Return
-------
TopOpeBRepTool_GeomTool

Description
-----------
No available documentation.
") ChangeGeomTool;
		TopOpeBRepTool_GeomTool & ChangeGeomTool();

		/****** TopOpeBRepDS_BuildTool::Closed ******/
		/****** md5 signature: f7e8c8213851789d8b29ea834f21e851 ******/
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
		void Closed(TopoDS_Shape & S, const bool B);

		/****** TopOpeBRepDS_BuildTool::ComputePCurves ******/
		/****** md5 signature: 7e0c66a2b24fd4da5e9c08b2dffd30e1 ******/
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
		void ComputePCurves(const TopOpeBRepDS_Curve & C, TopoDS_Edge & E, TopOpeBRepDS_Curve & newC, const bool CompPC1, const bool CompPC2, const bool CompC3D);

		/****** TopOpeBRepDS_BuildTool::CopyEdge ******/
		/****** md5 signature: 06d20ad51d28fd85815a9bc8a46a8a7c ******/
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
Make an edge <Eou> with the curve of the edge <Ein>.
") CopyEdge;
		void CopyEdge(const TopoDS_Shape & Ein, TopoDS_Shape & Eou);

		/****** TopOpeBRepDS_BuildTool::CopyFace ******/
		/****** md5 signature: 977c888106a494a0a2f71cb77a551880 ******/
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
Make a face <Fou> with the surface of the face <Fin>.
") CopyFace;
		void CopyFace(const TopoDS_Shape & Fin, TopoDS_Shape & Fou);

		/****** TopOpeBRepDS_BuildTool::Curve3D ******/
		/****** md5 signature: 469b96a8ff1fec91c4c0365b288ceb5c ******/
		%feature("compactdefaultargs") Curve3D;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Shape
C: Geom_Curve
Tol: double

Return
-------
None

Description
-----------
Sets the curve <C> for the edge <E>.
") Curve3D;
		void Curve3D(TopoDS_Shape & E, const opencascade::handle<Geom_Curve> & C, const double Tol);

		/****** TopOpeBRepDS_BuildTool::GetGeomTool ******/
		/****** md5 signature: 6b33ef83138f718a68f748ea1ea7a345 ******/
		%feature("compactdefaultargs") GetGeomTool;
		%feature("autodoc", "Return
-------
TopOpeBRepTool_GeomTool

Description
-----------
No available documentation.
") GetGeomTool;
		const TopOpeBRepTool_GeomTool & GetGeomTool();

		/****** TopOpeBRepDS_BuildTool::GetOrientedEdgeVertices ******/
		/****** md5 signature: 0caabdd7d3c1b8fd7c837c484dfe61c2 ******/
		%feature("compactdefaultargs") GetOrientedEdgeVertices;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
Vmin: TopoDS_Vertex
Vmax: TopoDS_Vertex

Return
-------
Parmin: double
Parmax: double

Description
-----------
No available documentation.
") GetOrientedEdgeVertices;
		void GetOrientedEdgeVertices(TopoDS_Edge & E, TopoDS_Vertex & Vmin, TopoDS_Vertex & Vmax, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** TopOpeBRepDS_BuildTool::MakeEdge ******/
		/****** md5 signature: c322d9d41c58eebc78ebeb1a368336bc ******/
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

		/****** TopOpeBRepDS_BuildTool::MakeEdge ******/
		/****** md5 signature: 0c42debf93b6fa7c080165ed32339ea3 ******/
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

		/****** TopOpeBRepDS_BuildTool::MakeEdge ******/
		/****** md5 signature: 37ba894b6197d0a9f974b36c818d51e2 ******/
		%feature("compactdefaultargs") MakeEdge;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Shape
C: Geom_Curve
Tol: double

Return
-------
None

Description
-----------
No available documentation.
") MakeEdge;
		void MakeEdge(TopoDS_Shape & E, const opencascade::handle<Geom_Curve> & C, const double Tol);

		/****** TopOpeBRepDS_BuildTool::MakeEdge ******/
		/****** md5 signature: 4cda8d3e9a1d3660cb358bf543f1397c ******/
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

		/****** TopOpeBRepDS_BuildTool::MakeFace ******/
		/****** md5 signature: 3a34eb1fc35111f0a067741bebfa5aed ******/
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

		/****** TopOpeBRepDS_BuildTool::MakeShell ******/
		/****** md5 signature: 9c44d97836e48ae73f7a7852af003860 ******/
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

		/****** TopOpeBRepDS_BuildTool::MakeSolid ******/
		/****** md5 signature: 09e9258c227e928cb1c324e293a90586 ******/
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

		/****** TopOpeBRepDS_BuildTool::MakeVertex ******/
		/****** md5 signature: 88c0c3b11eb5379cf70017d38ff16712 ******/
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

		/****** TopOpeBRepDS_BuildTool::MakeWire ******/
		/****** md5 signature: 12a6efd1de3c0a775278886280ca3adb ******/
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

		/****** TopOpeBRepDS_BuildTool::Orientation ******/
		/****** md5 signature: 2fbb2de5d16be3ec96ed304d6ce2745d ******/
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

		/****** TopOpeBRepDS_BuildTool::Orientation ******/
		/****** md5 signature: c02dc3934a0a045b39da810286896c0e ******/
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

		/****** TopOpeBRepDS_BuildTool::OverWrite ******/
		/****** md5 signature: 844cd5e61813505c0f672ad23ee1c20e ******/
		%feature("compactdefaultargs") OverWrite;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") OverWrite;
		bool OverWrite();

		/****** TopOpeBRepDS_BuildTool::OverWrite ******/
		/****** md5 signature: 98bb788a273583a113d4cedc5b1b9003 ******/
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
		void OverWrite(const bool O);

		/****** TopOpeBRepDS_BuildTool::PCurve ******/
		/****** md5 signature: 6f1565ac048eede1654fba5b2c1082b8 ******/
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
Sets the pcurve <C> for the edge <E> on the face <F>. If OverWrite is True the old pcurve if there is one is overwritten, else the two pcurves are set.
") PCurve;
		void PCurve(TopoDS_Shape & F, TopoDS_Shape & E, const opencascade::handle<Geom2d_Curve> & C);

		/****** TopOpeBRepDS_BuildTool::PCurve ******/
		/****** md5 signature: 5bff66786d077f5ee740a26003145005 ******/
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

		/****** TopOpeBRepDS_BuildTool::Parameter ******/
		/****** md5 signature: 5c041d92862d7aa6a12c52296033cc51 ******/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Shape
V: TopoDS_Shape
P: double

Return
-------
None

Description
-----------
Sets the parameter <P> for the vertex <V> on the edge <E>.
") Parameter;
		void Parameter(const TopoDS_Shape & E, const TopoDS_Shape & V, const double P);

		/****** TopOpeBRepDS_BuildTool::Parameter ******/
		/****** md5 signature: dfdc2af0b69aff19501456742113f6e3 ******/
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
Compute the parameter of the vertex <V>, supported by the edge <E>, on the curve <C>.
") Parameter;
		void Parameter(const TopOpeBRepDS_Curve & C, TopoDS_Shape & E, TopoDS_Shape & V);

		/****** TopOpeBRepDS_BuildTool::PutPCurves ******/
		/****** md5 signature: fa3d43ca44daedc5364fb59e824318a8 ******/
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
		void PutPCurves(const TopOpeBRepDS_Curve & newC, TopoDS_Edge & E, const bool CompPC1, const bool CompPC2);

		/****** TopOpeBRepDS_BuildTool::Range ******/
		/****** md5 signature: af54e54aedb9c7cd1c61efbf6f392d06 ******/
		%feature("compactdefaultargs") Range;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Shape
first: double
last: double

Return
-------
None

Description
-----------
Sets the range of edge <E>.
") Range;
		void Range(const TopoDS_Shape & E, const double first, const double last);

		/****** TopOpeBRepDS_BuildTool::RecomputeCurves ******/
		/****** md5 signature: d308aea533af187b4da7fe42d05be2a6 ******/
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

		/****** TopOpeBRepDS_BuildTool::Translate ******/
		/****** md5 signature: 104487bc04ec587ccaaf0fb982df7feb ******/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") Translate;
		bool Translate();

		/****** TopOpeBRepDS_BuildTool::Translate ******/
		/****** md5 signature: f304990c90bc5a55db6b7487682b11ef ******/
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
		void Translate(const bool T);

		/****** TopOpeBRepDS_BuildTool::UpdateEdge ******/
		/****** md5 signature: f8436c0d941de854d2f6a6738e02eb32 ******/
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
Sets the range of edge <Eou> from <Ein> only when <Ein> has a closed geometry.
") UpdateEdge;
		void UpdateEdge(const TopoDS_Shape & Ein, TopoDS_Shape & Eou);

		/****** TopOpeBRepDS_BuildTool::UpdateEdgeCurveTol ******/
		/****** md5 signature: 872cffa8318d3bdcb9936d16249d27e4 ******/
		%feature("compactdefaultargs") UpdateEdgeCurveTol;
		%feature("autodoc", "
Parameters
----------
F1: TopoDS_Face
F2: TopoDS_Face
E: TopoDS_Edge
C3Dnew: Geom_Curve
tol3d: double
tol2d1: double
tol2d2: double

Return
-------
newtol: double
newparmin: double
newparmax: double

Description
-----------
No available documentation.
") UpdateEdgeCurveTol;
		void UpdateEdgeCurveTol(const TopoDS_Face & F1, const TopoDS_Face & F2, TopoDS_Edge & E, const opencascade::handle<Geom_Curve> & C3Dnew, const double tol3d, const double tol2d1, const double tol2d2, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** TopOpeBRepDS_BuildTool::UpdateSurface ******/
		/****** md5 signature: e2b70bce5d5cbd079befa501a27c0de3 ******/
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

		/****** TopOpeBRepDS_BuildTool::UpdateSurface ******/
		/****** md5 signature: 526799dbf22174892653b37213b71068 ******/
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
		/****** TopOpeBRepDS_Check::TopOpeBRepDS_Check ******/
		/****** md5 signature: 8ef8085199907b0ae11d48dea0ded0be ******/
		%feature("compactdefaultargs") TopOpeBRepDS_Check;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepDS_Check;
		 TopOpeBRepDS_Check();

		/****** TopOpeBRepDS_Check::TopOpeBRepDS_Check ******/
		/****** md5 signature: 1bffeafdbcbacafe2b7843776c06ea75 ******/
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

		/****** TopOpeBRepDS_Check::ChangeHDS ******/
		/****** md5 signature: f6ae620a0089db5e0e1f53e2df140a22 ******/
		%feature("compactdefaultargs") ChangeHDS;
		%feature("autodoc", "Return
-------
opencascade::handle<TopOpeBRepDS_HDataStructure>

Description
-----------
No available documentation.
") ChangeHDS;
		opencascade::handle<TopOpeBRepDS_HDataStructure> & ChangeHDS();

		/****** TopOpeBRepDS_Check::CheckDS ******/
		/****** md5 signature: 7b6624cf6cdc34463e98f584602d67d7 ******/
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
Verifie que le ieme element de la DS existe, et pour un K de type topologique, verifie qu'il est du bon type (VERTEX, EDGE, WIRE, FACE, SHELL ou SOLID).
") CheckDS;
		bool CheckDS(const int i, const TopOpeBRepDS_Kind K);

		/****** TopOpeBRepDS_Check::CheckShapes ******/
		/****** md5 signature: 2da7af3666c73f483eaa09bf067e2340 ******/
		%feature("compactdefaultargs") CheckShapes;
		%feature("autodoc", "
Parameters
----------
LS: NCollection_List<TopoDS_Shape>

Return
-------
bool

Description
-----------
Verifie que les Shapes existent bien dans la DS Utile pour les Shapes SameDomain si la liste est vide, renvoie vrai.
") CheckShapes;
		bool CheckShapes(const NCollection_List<TopoDS_Shape> & LS);

		/****** TopOpeBRepDS_Check::ChkIntg ******/
		/****** md5 signature: 3990b4b9db667c54e616c270eec7ca18 ******/
		%feature("compactdefaultargs") ChkIntg;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Check integrition of DS.
") ChkIntg;
		bool ChkIntg();

		/****** TopOpeBRepDS_Check::ChkIntgInterf ******/
		/****** md5 signature: e672070f209cddedbd2fbf65151f8aec ******/
		%feature("compactdefaultargs") ChkIntgInterf;
		%feature("autodoc", "
Parameters
----------
LI: TopOpeBRepDS_Interference

Return
-------
bool

Description
-----------
Check integrition of interferences (les supports et les geometries de LI).
") ChkIntgInterf;
		bool ChkIntgInterf(const NCollection_List<opencascade::handle<TopOpeBRepDS_Interference> > & LI);

		/****** TopOpeBRepDS_Check::ChkIntgSamDom ******/
		/****** md5 signature: 0274cce6a1732517a76db3bc1f1d6ea6 ******/
		%feature("compactdefaultargs") ChkIntgSamDom;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Check integrition des champs SameDomain de la DS.
") ChkIntgSamDom;
		bool ChkIntgSamDom();

		/****** TopOpeBRepDS_Check::HDS ******/
		/****** md5 signature: 06b167d233b9790bcd0a135ca06a4a10 ******/
		%feature("compactdefaultargs") HDS;
		%feature("autodoc", "Return
-------
opencascade::handle<TopOpeBRepDS_HDataStructure>

Description
-----------
No available documentation.
") HDS;
		const opencascade::handle<TopOpeBRepDS_HDataStructure> & HDS();

		/****** TopOpeBRepDS_Check::OneVertexOnPnt ******/
		/****** md5 signature: bcb21d427034f8e239f84380810cec5c ******/
		%feature("compactdefaultargs") OneVertexOnPnt;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Verifie que les Vertex non SameDomain sont bien nonSameDomain, que les vertex sameDomain sont bien SameDomain, que les Points sont non confondus ni entre eux, ni avec des Vertex.
") OneVertexOnPnt;
		bool OneVertexOnPnt();

		/****** TopOpeBRepDS_Check::Print ******/
		/****** md5 signature: 086af6ff7c70fce4047a52ee56d84e30 ******/
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
Prints the name of CheckStatus <stat> as a String.
") Print;
		Standard_OStream & Print(const TopOpeBRepDS_CheckStatus stat, std::ostream &OutValue);

		/****** TopOpeBRepDS_Check::PrintIntg ******/
		/****** md5 signature: 87c9033c33359faee40e17ca777bad2d ******/
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

		/****** TopOpeBRepDS_Check::PrintShape ******/
		/****** md5 signature: c932bb977c67cb2dcc0f16639aaccff2 ******/
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
Prints the name of CheckStatus <stat> as a String.
") PrintShape;
		Standard_OStream & PrintShape(const TopAbs_ShapeEnum SE, std::ostream &OutValue);

		/****** TopOpeBRepDS_Check::PrintShape ******/
		/****** md5 signature: ca20ca2be037ebe7f4507d39b3272195 ******/
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
Prints the name of CheckStatus <stat> as a String.
") PrintShape;
		Standard_OStream & PrintShape(const int index, std::ostream &OutValue);

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
		/****** TopOpeBRepDS_Curve::TopOpeBRepDS_Curve ******/
		/****** md5 signature: dc73cbca407d7ef96f5b43ead9ae3fad ******/
		%feature("compactdefaultargs") TopOpeBRepDS_Curve;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepDS_Curve;
		 TopOpeBRepDS_Curve();

		/****** TopOpeBRepDS_Curve::TopOpeBRepDS_Curve ******/
		/****** md5 signature: 79ba3293009e58f80c98b1cf1af45ede ******/
		%feature("compactdefaultargs") TopOpeBRepDS_Curve;
		%feature("autodoc", "
Parameters
----------
P: Geom_Curve
T: double
IsWalk: bool (optional, default to false)

Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepDS_Curve;
		 TopOpeBRepDS_Curve(const opencascade::handle<Geom_Curve> & P, const double T, const bool IsWalk = false);

		/****** TopOpeBRepDS_Curve::ChangeCurve ******/
		/****** md5 signature: e819346faf86cc2bea5f869865af9ed2 ******/
		%feature("compactdefaultargs") ChangeCurve;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Curve>

Description
-----------
No available documentation.
") ChangeCurve;
		opencascade::handle<Geom_Curve> & ChangeCurve();

		/****** TopOpeBRepDS_Curve::ChangeDSIndex ******/
		/****** md5 signature: 453450fb8c11fe7077fe5077e1e6a0f5 ******/
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
		void ChangeDSIndex(const int I);

		/****** TopOpeBRepDS_Curve::ChangeIsWalk ******/
		/****** md5 signature: 4ddf011c809282b8540e987d53390aa8 ******/
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
		void ChangeIsWalk(const bool B);

		/****** TopOpeBRepDS_Curve::ChangeKeep ******/
		/****** md5 signature: 20e29780a2e40b1f09b5056bbe67f8ac ******/
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
		void ChangeKeep(const bool B);

		/****** TopOpeBRepDS_Curve::ChangeMother ******/
		/****** md5 signature: 4bdeba25ca72db000127744036469f90 ******/
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
		void ChangeMother(const int I);

		/****** TopOpeBRepDS_Curve::ChangeShape1 ******/
		/****** md5 signature: d2743f9a46939c6cada33939dd36f3f1 ******/
		%feature("compactdefaultargs") ChangeShape1;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") ChangeShape1;
		TopoDS_Shape ChangeShape1();

		/****** TopOpeBRepDS_Curve::ChangeShape2 ******/
		/****** md5 signature: 9df648ca98f0f035360705446acc37f1 ******/
		%feature("compactdefaultargs") ChangeShape2;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") ChangeShape2;
		TopoDS_Shape ChangeShape2();

		/****** TopOpeBRepDS_Curve::Curve ******/
		/****** md5 signature: 976a03829ec92d091e0b58dd7f58e869 ******/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Curve>

Description
-----------
No available documentation.
") Curve;
		const opencascade::handle<Geom_Curve> & Curve();

		/****** TopOpeBRepDS_Curve::Curve ******/
		/****** md5 signature: ab08e86e8bdf8bb10bfa6a69169321a5 ******/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "
Parameters
----------
C3D: Geom_Curve
Tol: double

Return
-------
None

Description
-----------
No available documentation.
") Curve;
		void Curve(const opencascade::handle<Geom_Curve> & C3D, const double Tol);

		/****** TopOpeBRepDS_Curve::Curve1 ******/
		/****** md5 signature: a306dd9436c220a3a90cc21c2a19c805 ******/
		%feature("compactdefaultargs") Curve1;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom2d_Curve>

Description
-----------
No available documentation.
") Curve1;
		const opencascade::handle<Geom2d_Curve> & Curve1();

		/****** TopOpeBRepDS_Curve::Curve1 ******/
		/****** md5 signature: fd91e8daf242d68bbe2820c57be32f13 ******/
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

		/****** TopOpeBRepDS_Curve::Curve2 ******/
		/****** md5 signature: f5d60c1f5a2a15607f83d0cba669b34f ******/
		%feature("compactdefaultargs") Curve2;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom2d_Curve>

Description
-----------
No available documentation.
") Curve2;
		const opencascade::handle<Geom2d_Curve> & Curve2();

		/****** TopOpeBRepDS_Curve::Curve2 ******/
		/****** md5 signature: 36634219d55de4c4b906b2079a686144 ******/
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

		/****** TopOpeBRepDS_Curve::DSIndex ******/
		/****** md5 signature: 058a6208b5bd8ca7b438b792e71d6d62 ******/
		%feature("compactdefaultargs") DSIndex;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") DSIndex;
		int DSIndex();

		/****** TopOpeBRepDS_Curve::DefineCurve ******/
		/****** md5 signature: 6e23c67c185f5081ac73a6d2343de689 ******/
		%feature("compactdefaultargs") DefineCurve;
		%feature("autodoc", "
Parameters
----------
P: Geom_Curve
T: double
IsWalk: bool

Return
-------
None

Description
-----------
No available documentation.
") DefineCurve;
		void DefineCurve(const opencascade::handle<Geom_Curve> & P, const double T, const bool IsWalk);

		/****** TopOpeBRepDS_Curve::GetSCI ******/
		/****** md5 signature: 454f78e3b81d7b2fcaebb2d730b6dc2b ******/
		%feature("compactdefaultargs") GetSCI;
		%feature("autodoc", "
Parameters
----------
theI1: TopOpeBRepDS_Interference
theI2: TopOpeBRepDS_Interference

Return
-------
None

Description
-----------
No available documentation.
") GetSCI;
		void GetSCI(opencascade::handle<TopOpeBRepDS_Interference> & theI1, opencascade::handle<TopOpeBRepDS_Interference> & theI2);

		/****** TopOpeBRepDS_Curve::GetSCI1 ******/
		/****** md5 signature: e188e03baf96eae1d28e151ff60ea317 ******/
		%feature("compactdefaultargs") GetSCI1;
		%feature("autodoc", "Return
-------
opencascade::handle<TopOpeBRepDS_Interference>

Description
-----------
Returns the first surface-curve interference. 
Return: handle to the first interference.
") GetSCI1;
		const opencascade::handle<TopOpeBRepDS_Interference> & GetSCI1();

		/****** TopOpeBRepDS_Curve::GetSCI2 ******/
		/****** md5 signature: 2a413ccb701972d663239d2624fa2ff5 ******/
		%feature("compactdefaultargs") GetSCI2;
		%feature("autodoc", "Return
-------
opencascade::handle<TopOpeBRepDS_Interference>

Description
-----------
Returns the second surface-curve interference. 
Return: handle to the second interference.
") GetSCI2;
		const opencascade::handle<TopOpeBRepDS_Interference> & GetSCI2();

		/****** TopOpeBRepDS_Curve::GetShapes ******/
		/****** md5 signature: afd553f86b0ab4e9a4d04d7122dab87e ******/
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

		/****** TopOpeBRepDS_Curve::IsWalk ******/
		/****** md5 signature: 4f940e3d444fa3363de226c191720ead ******/
		%feature("compactdefaultargs") IsWalk;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsWalk;
		bool IsWalk();

		/****** TopOpeBRepDS_Curve::Keep ******/
		/****** md5 signature: e8f73f4184955de8bddc5b09318bbab8 ******/
		%feature("compactdefaultargs") Keep;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") Keep;
		bool Keep();

		/****** TopOpeBRepDS_Curve::Mother ******/
		/****** md5 signature: 845da36d5bbd9f1614bc17a9a9c4f619 ******/
		%feature("compactdefaultargs") Mother;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Mother;
		int Mother();

		/****** TopOpeBRepDS_Curve::Range ******/
		/****** md5 signature: b9a5b3b4cc8874f3c744ba3d3e791856 ******/
		%feature("compactdefaultargs") Range;
		%feature("autodoc", "
Parameters
----------

Return
-------
First: double
Last: double

Description
-----------
No available documentation.
") Range;
		bool Range(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** TopOpeBRepDS_Curve::SetRange ******/
		/****** md5 signature: 526f31214adc678145a22614b0117fd4 ******/
		%feature("compactdefaultargs") SetRange;
		%feature("autodoc", "
Parameters
----------
First: double
Last: double

Return
-------
None

Description
-----------
No available documentation.
") SetRange;
		void SetRange(const double First, const double Last);

		/****** TopOpeBRepDS_Curve::SetSCI ******/
		/****** md5 signature: 423e8469585bf5f37f922a228def0989 ******/
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
define the interferences face/curve.
") SetSCI;
		void SetSCI(const opencascade::handle<TopOpeBRepDS_Interference> & I1, const opencascade::handle<TopOpeBRepDS_Interference> & I2);

		/****** TopOpeBRepDS_Curve::SetShapes ******/
		/****** md5 signature: a1d7f5311427e380aae9b6a0bfa750c4 ******/
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

		/****** TopOpeBRepDS_Curve::Shape1 ******/
		/****** md5 signature: 07a3db9d6b637af56fb1391aee4b7641 ******/
		%feature("compactdefaultargs") Shape1;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") Shape1;
		const TopoDS_Shape Shape1();

		/****** TopOpeBRepDS_Curve::Shape2 ******/
		/****** md5 signature: 3655a6c56b55e5313d1b146d7ee7458a ******/
		%feature("compactdefaultargs") Shape2;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") Shape2;
		const TopoDS_Shape Shape2();

		/****** TopOpeBRepDS_Curve::Tolerance ******/
		/****** md5 signature: c1c7212071b7d95bf782fac6a420fcbb ******/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "
Parameters
----------
tol: double

Return
-------
None

Description
-----------
Update the tolerance.
") Tolerance;
		void Tolerance(const double tol);

		/****** TopOpeBRepDS_Curve::Tolerance ******/
		/****** md5 signature: a95a606eeb289469358ac00a6b44ad86 ******/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") Tolerance;
		double Tolerance();

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
		/****** TopOpeBRepDS_CurveExplorer::TopOpeBRepDS_CurveExplorer ******/
		/****** md5 signature: 632d6e194b72d88c80fd65034cacd252 ******/
		%feature("compactdefaultargs") TopOpeBRepDS_CurveExplorer;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepDS_CurveExplorer;
		 TopOpeBRepDS_CurveExplorer();

		/****** TopOpeBRepDS_CurveExplorer::TopOpeBRepDS_CurveExplorer ******/
		/****** md5 signature: 9dacdef271ba94881167d94e3c65c693 ******/
		%feature("compactdefaultargs") TopOpeBRepDS_CurveExplorer;
		%feature("autodoc", "
Parameters
----------
DS: TopOpeBRepDS_DataStructure
FindOnlyKeep: bool (optional, default to true)

Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepDS_CurveExplorer;
		 TopOpeBRepDS_CurveExplorer(const TopOpeBRepDS_DataStructure & DS, const bool FindOnlyKeep = true);

		/****** TopOpeBRepDS_CurveExplorer::Curve ******/
		/****** md5 signature: ad855b410817599ecd2040b239b5eadd ******/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "Return
-------
TopOpeBRepDS_Curve

Description
-----------
No available documentation.
") Curve;
		TopOpeBRepDS_Curve Curve();

		/****** TopOpeBRepDS_CurveExplorer::Curve ******/
		/****** md5 signature: 8f68387be06709e7244d27d95219e433 ******/
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
		TopOpeBRepDS_Curve Curve(const int I);

		/****** TopOpeBRepDS_CurveExplorer::Index ******/
		/****** md5 signature: 5f8486b8f8a28d56e63445ad924b19d8 ******/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Index;
		int Index();

		/****** TopOpeBRepDS_CurveExplorer::Init ******/
		/****** md5 signature: 3df60a2c10c57d419d76e9d2d1ed5ff5 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
DS: TopOpeBRepDS_DataStructure
FindOnlyKeep: bool (optional, default to true)

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const TopOpeBRepDS_DataStructure & DS, const bool FindOnlyKeep = true);

		/****** TopOpeBRepDS_CurveExplorer::IsCurve ******/
		/****** md5 signature: 8fcb7c16114accee1c999ee81d86ecb4 ******/
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
		bool IsCurve(const int I);

		/****** TopOpeBRepDS_CurveExplorer::IsCurveKeep ******/
		/****** md5 signature: ac119712c0fdb3acd646f5e0b597b99a ******/
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
		bool IsCurveKeep(const int I);

		/****** TopOpeBRepDS_CurveExplorer::More ******/
		/****** md5 signature: 922f3b0d43975d648336ba28bdfd0416 ******/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") More;
		bool More();

		/****** TopOpeBRepDS_CurveExplorer::NbCurve ******/
		/****** md5 signature: a84cfb6d7590a28b52a9f401a7fcb02d ******/
		%feature("compactdefaultargs") NbCurve;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbCurve;
		int NbCurve();

		/****** TopOpeBRepDS_CurveExplorer::Next ******/
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
		/****** TopOpeBRepDS_DataStructure::TopOpeBRepDS_DataStructure ******/
		/****** md5 signature: bad3ca6b7e33bd5e4622944f75e44de8 ******/
		%feature("compactdefaultargs") TopOpeBRepDS_DataStructure;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepDS_DataStructure;
		 TopOpeBRepDS_DataStructure();

		/****** TopOpeBRepDS_DataStructure::AddCurve ******/
		/****** md5 signature: 4371c3e7aecf30971726d5e673296423 ******/
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
Insert a new curve. Returns the index.
") AddCurve;
		int AddCurve(const TopOpeBRepDS_Curve & S);

		/****** TopOpeBRepDS_DataStructure::AddPoint ******/
		/****** md5 signature: c4664a56d090ac2ddbd8b26f41ab565d ******/
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
Insert a new point. Returns the index.
") AddPoint;
		int AddPoint(const TopOpeBRepDS_Point & PDS);

		/****** TopOpeBRepDS_DataStructure::AddPointSS ******/
		/****** md5 signature: eabfa9ba503afb96e75edb32198f3b67 ******/
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
Insert a new point. Returns the index.
") AddPointSS;
		int AddPointSS(const TopOpeBRepDS_Point & PDS, const TopoDS_Shape & S1, const TopoDS_Shape & S2);

		/****** TopOpeBRepDS_DataStructure::AddSectionEdge ******/
		/****** md5 signature: ae4aca237423aab72efcba88cd90710a ******/
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
		int AddSectionEdge(const TopoDS_Edge & E);

		/****** TopOpeBRepDS_DataStructure::AddShape ******/
		/****** md5 signature: 5b7fed51d3997d5ec624416b2dc337dc ******/
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
Insert a shape S. Returns the index.
") AddShape;
		int AddShape(const TopoDS_Shape & S);

		/****** TopOpeBRepDS_DataStructure::AddShape ******/
		/****** md5 signature: 19402ed8d4ea531d120b9db1f281a969 ******/
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
Insert a shape S which ancestor is I = 1 or 2. Returns the index.
") AddShape;
		int AddShape(const TopoDS_Shape & S, const int I);

		/****** TopOpeBRepDS_DataStructure::AddShapeInterference ******/
		/****** md5 signature: dfbd0f55c4b90afe9386f234f93b2caf ******/
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

		/****** TopOpeBRepDS_DataStructure::AddShapeSameDomain ******/
		/****** md5 signature: fe10a4775c3d346e9027a750dcc5fce0 ******/
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

		/****** TopOpeBRepDS_DataStructure::AddSurface ******/
		/****** md5 signature: d8b77994640cc30d089aba5477884b56 ******/
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
Insert a new surface. Returns the index.
") AddSurface;
		int AddSurface(const TopOpeBRepDS_Surface & S);

		/****** TopOpeBRepDS_DataStructure::AncestorRank ******/
		/****** md5 signature: 0e96a08703e284f51d69ad0f8fc98ebb ******/
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
		int AncestorRank(const int I);

		/****** TopOpeBRepDS_DataStructure::AncestorRank ******/
		/****** md5 signature: 21d48a0b671f41622417b14a672e98df ******/
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
		int AncestorRank(const TopoDS_Shape & S);

		/****** TopOpeBRepDS_DataStructure::AncestorRank ******/
		/****** md5 signature: 563c966cd27964769bcf7edcef7e73b6 ******/
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
		void AncestorRank(const int I, const int Ianc);

		/****** TopOpeBRepDS_DataStructure::AncestorRank ******/
		/****** md5 signature: 87948d5a72cfd1dd55236056356d8077 ******/
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
		void AncestorRank(const TopoDS_Shape & S, const int Ianc);

		/****** TopOpeBRepDS_DataStructure::ChangeCurve ******/
		/****** md5 signature: 67f619e5c16674515b5d9329aed3580d ******/
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
Returns the Curve of index <I>.
") ChangeCurve;
		TopOpeBRepDS_Curve & ChangeCurve(const int I);

		/****** TopOpeBRepDS_DataStructure::ChangeCurveInterferences ******/
		/****** md5 signature: 41201d2021326a72d1abeb07a66df49c ******/
		%feature("compactdefaultargs") ChangeCurveInterferences;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
NCollection_List<opencascade::handle<TopOpeBRepDS_Interference>>

Description
-----------
No available documentation.
") ChangeCurveInterferences;
		NCollection_List<opencascade::handle<TopOpeBRepDS_Interference>> & ChangeCurveInterferences(const int I);

		/****** TopOpeBRepDS_DataStructure::ChangeKeepCurve ******/
		/****** md5 signature: 676ac24b41a25ce91a4f9cbd34e6ad09 ******/
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
		void ChangeKeepCurve(const int I, const bool FindKeep);

		/****** TopOpeBRepDS_DataStructure::ChangeKeepCurve ******/
		/****** md5 signature: 6d9bad5ea31844a10d6121a9359133ee ******/
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
		void ChangeKeepCurve(TopOpeBRepDS_Curve & C, const bool FindKeep);

		/****** TopOpeBRepDS_DataStructure::ChangeKeepPoint ******/
		/****** md5 signature: bed27a8c69489e78ff827a9d0020f745 ******/
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
		void ChangeKeepPoint(const int I, const bool FindKeep);

		/****** TopOpeBRepDS_DataStructure::ChangeKeepPoint ******/
		/****** md5 signature: 6e4c4439689d9b7dd06edf08483385b3 ******/
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
		void ChangeKeepPoint(TopOpeBRepDS_Point & P, const bool FindKeep);

		/****** TopOpeBRepDS_DataStructure::ChangeKeepShape ******/
		/****** md5 signature: 00ff16fd3cc8cb7abf738ee3b8ebf6f5 ******/
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
		void ChangeKeepShape(const int I, const bool FindKeep);

		/****** TopOpeBRepDS_DataStructure::ChangeKeepShape ******/
		/****** md5 signature: 7ec9025c30d84c9c34ed1bc9ea833fdc ******/
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
		void ChangeKeepShape(const TopoDS_Shape & S, const bool FindKeep);

		/****** TopOpeBRepDS_DataStructure::ChangeKeepSurface ******/
		/****** md5 signature: afc4f92ee63a21a0a07000682b74b9f7 ******/
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
		void ChangeKeepSurface(const int I, const bool FindKeep);

		/****** TopOpeBRepDS_DataStructure::ChangeKeepSurface ******/
		/****** md5 signature: e8789b32ea3c5bb57467b40e378cf6ee ******/
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
		void ChangeKeepSurface(TopOpeBRepDS_Surface & S, const bool FindKeep);

		/****** TopOpeBRepDS_DataStructure::ChangeMapOfRejectedShapesObj ******/
		/****** md5 signature: b69cd706f987a407d81642ede677c56b ******/
		%feature("compactdefaultargs") ChangeMapOfRejectedShapesObj;
		%feature("autodoc", "Return
-------
NCollection_IndexedMap<TopoDS_Shape, TopTools_ShapeMapHasher>

Description
-----------
No available documentation.
") ChangeMapOfRejectedShapesObj;
		NCollection_IndexedMap<TopoDS_Shape, TopTools_ShapeMapHasher> ChangeMapOfRejectedShapesObj();

		/****** TopOpeBRepDS_DataStructure::ChangeMapOfRejectedShapesTool ******/
		/****** md5 signature: 02b8b591bfa01669279e263b523cffbb ******/
		%feature("compactdefaultargs") ChangeMapOfRejectedShapesTool;
		%feature("autodoc", "Return
-------
NCollection_IndexedMap<TopoDS_Shape, TopTools_ShapeMapHasher>

Description
-----------
No available documentation.
") ChangeMapOfRejectedShapesTool;
		NCollection_IndexedMap<TopoDS_Shape, TopTools_ShapeMapHasher> ChangeMapOfRejectedShapesTool();

		/****** TopOpeBRepDS_DataStructure::ChangeMapOfShapeWithState ******/
		/****** md5 signature: 712182c2135607bb770f6b9506866bb4 ******/
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
		NCollection_IndexedDataMap<TopoDS_Shape, TopOpeBRepDS_ShapeWithState, TopTools_ShapeMapHasher> ChangeMapOfShapeWithState(const TopoDS_Shape & aShape, Standard_Boolean &OutValue);

		/****** TopOpeBRepDS_DataStructure::ChangeMapOfShapeWithStateObj ******/
		/****** md5 signature: 1e36fa550ed989946e775ce666d16c88 ******/
		%feature("compactdefaultargs") ChangeMapOfShapeWithStateObj;
		%feature("autodoc", "Return
-------
NCollection_IndexedDataMap<TopoDS_Shape, TopOpeBRepDS_ShapeWithState, TopTools_ShapeMapHasher>

Description
-----------
No available documentation.
") ChangeMapOfShapeWithStateObj;
		NCollection_IndexedDataMap<TopoDS_Shape, TopOpeBRepDS_ShapeWithState, TopTools_ShapeMapHasher> ChangeMapOfShapeWithStateObj();

		/****** TopOpeBRepDS_DataStructure::ChangeMapOfShapeWithStateTool ******/
		/****** md5 signature: a5b6470fc01bee8a29ef6087610084cd ******/
		%feature("compactdefaultargs") ChangeMapOfShapeWithStateTool;
		%feature("autodoc", "Return
-------
NCollection_IndexedDataMap<TopoDS_Shape, TopOpeBRepDS_ShapeWithState, TopTools_ShapeMapHasher>

Description
-----------
No available documentation.
") ChangeMapOfShapeWithStateTool;
		NCollection_IndexedDataMap<TopoDS_Shape, TopOpeBRepDS_ShapeWithState, TopTools_ShapeMapHasher> ChangeMapOfShapeWithStateTool();

		/****** TopOpeBRepDS_DataStructure::ChangeNbCurves ******/
		/****** md5 signature: bf7893831ffc07a69cb9b966a2082494 ******/
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
		void ChangeNbCurves(const int N);

		/****** TopOpeBRepDS_DataStructure::ChangePoint ******/
		/****** md5 signature: 0358c1015ded19b4de0f0ff3abaa67b8 ******/
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
Returns the point of index <I>.
") ChangePoint;
		TopOpeBRepDS_Point & ChangePoint(const int I);

		/****** TopOpeBRepDS_DataStructure::ChangePointInterferences ******/
		/****** md5 signature: bb6514324cc018b0cc762d59cd43e9c7 ******/
		%feature("compactdefaultargs") ChangePointInterferences;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
NCollection_List<opencascade::handle<TopOpeBRepDS_Interference>>

Description
-----------
No available documentation.
") ChangePointInterferences;
		NCollection_List<opencascade::handle<TopOpeBRepDS_Interference>> & ChangePointInterferences(const int I);

		/****** TopOpeBRepDS_DataStructure::ChangeShapeInterferences ******/
		/****** md5 signature: 75e4af12b91e5b6174f8ea6204df8dce ******/
		%feature("compactdefaultargs") ChangeShapeInterferences;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
NCollection_List<opencascade::handle<TopOpeBRepDS_Interference>>

Description
-----------
No available documentation.
") ChangeShapeInterferences;
		NCollection_List<opencascade::handle<TopOpeBRepDS_Interference>> & ChangeShapeInterferences(const TopoDS_Shape & S);

		/****** TopOpeBRepDS_DataStructure::ChangeShapeInterferences ******/
		/****** md5 signature: 29737c6952c3917bbe5882da94807073 ******/
		%feature("compactdefaultargs") ChangeShapeInterferences;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
NCollection_List<opencascade::handle<TopOpeBRepDS_Interference>>

Description
-----------
No available documentation.
") ChangeShapeInterferences;
		NCollection_List<opencascade::handle<TopOpeBRepDS_Interference>> & ChangeShapeInterferences(const int I);

		/****** TopOpeBRepDS_DataStructure::ChangeShapeSameDomain ******/
		/****** md5 signature: bf729ce1c599dd55f07b035922d8ee31 ******/
		%feature("compactdefaultargs") ChangeShapeSameDomain;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
NCollection_List<TopoDS_Shape>

Description
-----------
No available documentation.
") ChangeShapeSameDomain;
		NCollection_List<TopoDS_Shape> ChangeShapeSameDomain(const TopoDS_Shape & S);

		/****** TopOpeBRepDS_DataStructure::ChangeShapeSameDomain ******/
		/****** md5 signature: 8a03c50cfcc6e2cb52e5193cdcc98422 ******/
		%feature("compactdefaultargs") ChangeShapeSameDomain;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
NCollection_List<TopoDS_Shape>

Description
-----------
No available documentation.
") ChangeShapeSameDomain;
		NCollection_List<TopoDS_Shape> ChangeShapeSameDomain(const int I);

		/****** TopOpeBRepDS_DataStructure::ChangeShapes ******/
		/****** md5 signature: 5783c34d07d79ef4b3731d966b76b6fc ******/
		%feature("compactdefaultargs") ChangeShapes;
		%feature("autodoc", "Return
-------
NCollection_IndexedDataMap<TopoDS_Shape, TopOpeBRepDS_ShapeData, TopTools_ShapeMapHasher>

Description
-----------
No available documentation.
") ChangeShapes;
		NCollection_IndexedDataMap<TopoDS_Shape, TopOpeBRepDS_ShapeData, TopTools_ShapeMapHasher> ChangeShapes();

		/****** TopOpeBRepDS_DataStructure::ChangeSurface ******/
		/****** md5 signature: 498ee817d8826b59ce9050fb36380aa8 ******/
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
Returns the surface of index <I>.
") ChangeSurface;
		TopOpeBRepDS_Surface & ChangeSurface(const int I);

		/****** TopOpeBRepDS_DataStructure::ChangeSurfaceInterferences ******/
		/****** md5 signature: 2a4be9d0351ee56d7a895119cd3b24d6 ******/
		%feature("compactdefaultargs") ChangeSurfaceInterferences;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
NCollection_List<opencascade::handle<TopOpeBRepDS_Interference>>

Description
-----------
No available documentation.
") ChangeSurfaceInterferences;
		NCollection_List<opencascade::handle<TopOpeBRepDS_Interference>> & ChangeSurfaceInterferences(const int I);

		/****** TopOpeBRepDS_DataStructure::Curve ******/
		/****** md5 signature: 8f68387be06709e7244d27d95219e433 ******/
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
Returns the Curve of index <I>.
") Curve;
		TopOpeBRepDS_Curve Curve(const int I);

		/****** TopOpeBRepDS_DataStructure::CurveInterferences ******/
		/****** md5 signature: f6e70023f1bda541e93dd59ae8d550b2 ******/
		%feature("compactdefaultargs") CurveInterferences;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
NCollection_List<opencascade::handle<TopOpeBRepDS_Interference>>

Description
-----------
No available documentation.
") CurveInterferences;
		const NCollection_List<opencascade::handle<TopOpeBRepDS_Interference>> & CurveInterferences(const int I);

		/****** TopOpeBRepDS_DataStructure::FillShapesSameDomain ******/
		/****** md5 signature: dd772b074417cf4686f4ea79ce959f30 ******/
		%feature("compactdefaultargs") FillShapesSameDomain;
		%feature("autodoc", "
Parameters
----------
S1: TopoDS_Shape
S2: TopoDS_Shape
refFirst: bool (optional, default to true)

Return
-------
None

Description
-----------
No available documentation.
") FillShapesSameDomain;
		void FillShapesSameDomain(const TopoDS_Shape & S1, const TopoDS_Shape & S2, const bool refFirst = true);

		/****** TopOpeBRepDS_DataStructure::FillShapesSameDomain ******/
		/****** md5 signature: f085b3fd5b9d62c4070b9a8eae9e61fb ******/
		%feature("compactdefaultargs") FillShapesSameDomain;
		%feature("autodoc", "
Parameters
----------
S1: TopoDS_Shape
S2: TopoDS_Shape
c1: TopOpeBRepDS_Config
c2: TopOpeBRepDS_Config
refFirst: bool (optional, default to true)

Return
-------
None

Description
-----------
No available documentation.
") FillShapesSameDomain;
		void FillShapesSameDomain(const TopoDS_Shape & S1, const TopoDS_Shape & S2, const TopOpeBRepDS_Config c1, const TopOpeBRepDS_Config c2, const bool refFirst = true);

		/****** TopOpeBRepDS_DataStructure::GetShapeWithState ******/
		/****** md5 signature: a6f2b4fcd0e7a847188e96d6fa4347ba ******/
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

		/****** TopOpeBRepDS_DataStructure::HasGeometry ******/
		/****** md5 signature: 8dff57098ee43c62daaf450f31fbae15 ******/
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
Returns True if <S> has new geometries, i.e: True si: HasShape(S) True S a une liste d'interferences non vide. S = SOLID, FACE, EDGE: true/false S = SHELL, WIRE, VERTEX: false.
") HasGeometry;
		bool HasGeometry(const TopoDS_Shape & S);

		/****** TopOpeBRepDS_DataStructure::HasNewSurface ******/
		/****** md5 signature: 447e7b8d46da30b2c9c82f9252d0cf08 ******/
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
		bool HasNewSurface(const TopoDS_Shape & F);

		/****** TopOpeBRepDS_DataStructure::HasShape ******/
		/****** md5 signature: 591fc724353e5bc7095c261f3a5b5959 ******/
		%feature("compactdefaultargs") HasShape;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
FindKeep: bool (optional, default to true)

Return
-------
bool

Description
-----------
Returns True if <S> est dans myShapes.
") HasShape;
		bool HasShape(const TopoDS_Shape & S, const bool FindKeep = true);

		/****** TopOpeBRepDS_DataStructure::Init ******/
		/****** md5 signature: 0de93ef32c53d091768788dca0e281fd ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Return
-------
None

Description
-----------
reset the data structure.
") Init;
		void Init();

		/****** TopOpeBRepDS_DataStructure::InitSectionEdges ******/
		/****** md5 signature: 8a9fd75a3bda2254991fb49f99a7add4 ******/
		%feature("compactdefaultargs") InitSectionEdges;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") InitSectionEdges;
		void InitSectionEdges();

		/****** TopOpeBRepDS_DataStructure::IsSectionEdge ******/
		/****** md5 signature: debc534ed8012d19d7160c0f9603dd65 ******/
		%feature("compactdefaultargs") IsSectionEdge;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
FindKeep: bool (optional, default to true)

Return
-------
bool

Description
-----------
No available documentation.
") IsSectionEdge;
		bool IsSectionEdge(const TopoDS_Edge & E, const bool FindKeep = true);

		/****** TopOpeBRepDS_DataStructure::Isfafa ******/
		/****** md5 signature: 9e03383e2a0634d9edf342f02b593469 ******/
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
		void Isfafa(const bool isfafa);

		/****** TopOpeBRepDS_DataStructure::Isfafa ******/
		/****** md5 signature: eb8cbff7d58be168ab15a584d70eeab9 ******/
		%feature("compactdefaultargs") Isfafa;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") Isfafa;
		bool Isfafa();

		/****** TopOpeBRepDS_DataStructure::KeepCurve ******/
		/****** md5 signature: 6eee22374fb586e872634bc1370c1da3 ******/
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
		bool KeepCurve(const int I);

		/****** TopOpeBRepDS_DataStructure::KeepCurve ******/
		/****** md5 signature: 9e1183f9c59f24521e57711c45f9d3d0 ******/
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
		bool KeepCurve(const TopOpeBRepDS_Curve & C);

		/****** TopOpeBRepDS_DataStructure::KeepPoint ******/
		/****** md5 signature: 4c4d19b6d05ad8e64e3bfa7fa5c3f90e ******/
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
		bool KeepPoint(const int I);

		/****** TopOpeBRepDS_DataStructure::KeepPoint ******/
		/****** md5 signature: 2b5e58bb8fe35955e1199fe039f39128 ******/
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
		bool KeepPoint(const TopOpeBRepDS_Point & P);

		/****** TopOpeBRepDS_DataStructure::KeepShape ******/
		/****** md5 signature: 93777a2f8ce0776d335049094ab4ea10 ******/
		%feature("compactdefaultargs") KeepShape;
		%feature("autodoc", "
Parameters
----------
I: int
FindKeep: bool (optional, default to true)

Return
-------
bool

Description
-----------
No available documentation.
") KeepShape;
		bool KeepShape(const int I, const bool FindKeep = true);

		/****** TopOpeBRepDS_DataStructure::KeepShape ******/
		/****** md5 signature: 5796707c28db695ff6e24cb84548d804 ******/
		%feature("compactdefaultargs") KeepShape;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
FindKeep: bool (optional, default to true)

Return
-------
bool

Description
-----------
No available documentation.
") KeepShape;
		bool KeepShape(const TopoDS_Shape & S, const bool FindKeep = true);

		/****** TopOpeBRepDS_DataStructure::KeepSurface ******/
		/****** md5 signature: 4062622fc57e320adf8962d1bd44da27 ******/
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
		bool KeepSurface(const int I);

		/****** TopOpeBRepDS_DataStructure::KeepSurface ******/
		/****** md5 signature: b87e06eb8a6967356da594ae862561dd ******/
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
		bool KeepSurface(TopOpeBRepDS_Surface & S);

		/****** TopOpeBRepDS_DataStructure::NbCurves ******/
		/****** md5 signature: 99661be16aa6b87a1ba6043e7f8f9943 ******/
		%feature("compactdefaultargs") NbCurves;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbCurves;
		int NbCurves();

		/****** TopOpeBRepDS_DataStructure::NbPoints ******/
		/****** md5 signature: 0243a6484ef0942dcad871f7c247b5de ******/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbPoints;
		int NbPoints();

		/****** TopOpeBRepDS_DataStructure::NbSectionEdges ******/
		/****** md5 signature: c26a1a0efd47ff01f590b30a9601223f ******/
		%feature("compactdefaultargs") NbSectionEdges;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbSectionEdges;
		int NbSectionEdges();

		/****** TopOpeBRepDS_DataStructure::NbShapes ******/
		/****** md5 signature: 5033c6acdebfec4ad702502e01d3601a ******/
		%feature("compactdefaultargs") NbShapes;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbShapes;
		int NbShapes();

		/****** TopOpeBRepDS_DataStructure::NbSurfaces ******/
		/****** md5 signature: 7e22bdd58e61d1f35b25d270c1134651 ******/
		%feature("compactdefaultargs") NbSurfaces;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbSurfaces;
		int NbSurfaces();

		/****** TopOpeBRepDS_DataStructure::NewSurface ******/
		/****** md5 signature: 7add5b9199c86c93a7ee2ecb3009e02b ******/
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

		/****** TopOpeBRepDS_DataStructure::Point ******/
		/****** md5 signature: 46867378e1165b64904da8b83e56d84c ******/
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
Returns the point of index <I>.
") Point;
		const TopOpeBRepDS_Point & Point(const int I);

		/****** TopOpeBRepDS_DataStructure::PointInterferences ******/
		/****** md5 signature: 9dd2cc827c54a6d96a6c96a9a2be720a ******/
		%feature("compactdefaultargs") PointInterferences;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
NCollection_List<opencascade::handle<TopOpeBRepDS_Interference>>

Description
-----------
No available documentation.
") PointInterferences;
		const NCollection_List<opencascade::handle<TopOpeBRepDS_Interference>> & PointInterferences(const int I);

		/****** TopOpeBRepDS_DataStructure::RemoveCurve ******/
		/****** md5 signature: 594e8c4738bba31a696019dd52b91142 ******/
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
		void RemoveCurve(const int I);

		/****** TopOpeBRepDS_DataStructure::RemovePoint ******/
		/****** md5 signature: 12a1981b82617c972504a79452035927 ******/
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
		void RemovePoint(const int I);

		/****** TopOpeBRepDS_DataStructure::RemoveShapeInterference ******/
		/****** md5 signature: 412e6543d3fd7929a60f32d7a69d67f2 ******/
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

		/****** TopOpeBRepDS_DataStructure::RemoveShapeSameDomain ******/
		/****** md5 signature: f50e763fe94ec1790029ac6e97357534 ******/
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

		/****** TopOpeBRepDS_DataStructure::RemoveSurface ******/
		/****** md5 signature: c070a4db76a14f0ffa82c263ddfbc53c ******/
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
		void RemoveSurface(const int I);

		/****** TopOpeBRepDS_DataStructure::SameDomainInd ******/
		/****** md5 signature: fca589b676d3136e0a6b382907362654 ******/
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
		int SameDomainInd(const int I);

		/****** TopOpeBRepDS_DataStructure::SameDomainInd ******/
		/****** md5 signature: d74e44e56f08a9bf6aae541a54f847f5 ******/
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
		int SameDomainInd(const TopoDS_Shape & S);

		/****** TopOpeBRepDS_DataStructure::SameDomainInd ******/
		/****** md5 signature: 2ef407c4178afeaffa611b579b19e568 ******/
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
		void SameDomainInd(const int I, const int Ind);

		/****** TopOpeBRepDS_DataStructure::SameDomainInd ******/
		/****** md5 signature: aa028413f4e22d8f1fb874354b8f0e33 ******/
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
		void SameDomainInd(const TopoDS_Shape & S, const int Ind);

		/****** TopOpeBRepDS_DataStructure::SameDomainOri ******/
		/****** md5 signature: c1d024fcac2ec217e66f45fee84e30aa ******/
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
		TopOpeBRepDS_Config SameDomainOri(const int I);

		/****** TopOpeBRepDS_DataStructure::SameDomainOri ******/
		/****** md5 signature: f5745d68e6f11784571b9b419388de6b ******/
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

		/****** TopOpeBRepDS_DataStructure::SameDomainOri ******/
		/****** md5 signature: bccb8fe030eb61bcff28a260d9e4ef39 ******/
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
		void SameDomainOri(const int I, const TopOpeBRepDS_Config Ori);

		/****** TopOpeBRepDS_DataStructure::SameDomainOri ******/
		/****** md5 signature: 4e62c89b45488901580ee57713832fc7 ******/
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

		/****** TopOpeBRepDS_DataStructure::SameDomainRef ******/
		/****** md5 signature: e471f19dacf11be6ee17befd19e88877 ******/
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
		int SameDomainRef(const int I);

		/****** TopOpeBRepDS_DataStructure::SameDomainRef ******/
		/****** md5 signature: 13cfa60f07beaeff598b28ec2fbb89a0 ******/
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
		int SameDomainRef(const TopoDS_Shape & S);

		/****** TopOpeBRepDS_DataStructure::SameDomainRef ******/
		/****** md5 signature: 3b07b4cc523c404c32e8ec4f91211ae5 ******/
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
		void SameDomainRef(const int I, const int Ref);

		/****** TopOpeBRepDS_DataStructure::SameDomainRef ******/
		/****** md5 signature: 5304fee7ca4bc404928a44459f2feeb0 ******/
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
		void SameDomainRef(const TopoDS_Shape & S, const int Ref);

		/****** TopOpeBRepDS_DataStructure::SectionEdge ******/
		/****** md5 signature: e54a087246ff9af364b755b372dbcc15 ******/
		%feature("compactdefaultargs") SectionEdge;
		%feature("autodoc", "
Parameters
----------
I: int
FindKeep: bool (optional, default to true)

Return
-------
TopoDS_Edge

Description
-----------
No available documentation.
") SectionEdge;
		const TopoDS_Edge SectionEdge(const int I, const bool FindKeep = true);

		/****** TopOpeBRepDS_DataStructure::SectionEdge ******/
		/****** md5 signature: 73990d4a77b8b135ddecb84e839db676 ******/
		%feature("compactdefaultargs") SectionEdge;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
FindKeep: bool (optional, default to true)

Return
-------
int

Description
-----------
No available documentation.
") SectionEdge;
		int SectionEdge(const TopoDS_Edge & E, const bool FindKeep = true);

		/****** TopOpeBRepDS_DataStructure::SetNewSurface ******/
		/****** md5 signature: d9f8b56466b71f82a0c5d38767680a12 ******/
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

		/****** TopOpeBRepDS_DataStructure::Shape ******/
		/****** md5 signature: b7e9c2aeeb7bd4998022f2e899438e4e ******/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "
Parameters
----------
I: int
FindKeep: bool (optional, default to true)

Return
-------
TopoDS_Shape

Description
-----------
returns the shape of index I stored in the map myShapes, accessing a list of interference.
") Shape;
		const TopoDS_Shape Shape(const int I, const bool FindKeep = true);

		/****** TopOpeBRepDS_DataStructure::Shape ******/
		/****** md5 signature: 80f2d0f6c4ba45be9b2bf19b13a932df ******/
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
FindKeep: bool (optional, default to true)

Return
-------
int

Description
-----------
returns the index of shape <S> stored in the map myShapes, accessing a list of interference. returns 0 if <S> is not in the map.
") Shape;
		int Shape(const TopoDS_Shape & S, const bool FindKeep = true);

		/****** TopOpeBRepDS_DataStructure::ShapeInterferences ******/
		/****** md5 signature: 6cb9b033e68e587823d6c80d083b1630 ******/
		%feature("compactdefaultargs") ShapeInterferences;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
FindKeep: bool (optional, default to true)

Return
-------
NCollection_List<opencascade::handle<TopOpeBRepDS_Interference>>

Description
-----------
No available documentation.
") ShapeInterferences;
		const NCollection_List<opencascade::handle<TopOpeBRepDS_Interference>> & ShapeInterferences(const TopoDS_Shape & S, const bool FindKeep = true);

		/****** TopOpeBRepDS_DataStructure::ShapeInterferences ******/
		/****** md5 signature: 542da17277d15ac14071e10de90fe9a6 ******/
		%feature("compactdefaultargs") ShapeInterferences;
		%feature("autodoc", "
Parameters
----------
I: int
FindKeep: bool (optional, default to true)

Return
-------
NCollection_List<opencascade::handle<TopOpeBRepDS_Interference>>

Description
-----------
No available documentation.
") ShapeInterferences;
		const NCollection_List<opencascade::handle<TopOpeBRepDS_Interference>> & ShapeInterferences(const int I, const bool FindKeep = true);

		/****** TopOpeBRepDS_DataStructure::ShapeSameDomain ******/
		/****** md5 signature: 6a217a8a98f70554b4b23c567aeaafb7 ******/
		%feature("compactdefaultargs") ShapeSameDomain;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape

Return
-------
NCollection_List<TopoDS_Shape>

Description
-----------
No available documentation.
") ShapeSameDomain;
		const NCollection_List<TopoDS_Shape> ShapeSameDomain(const TopoDS_Shape & S);

		/****** TopOpeBRepDS_DataStructure::ShapeSameDomain ******/
		/****** md5 signature: f993452380df6d550c045bce6c02f3c4 ******/
		%feature("compactdefaultargs") ShapeSameDomain;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
NCollection_List<TopoDS_Shape>

Description
-----------
No available documentation.
") ShapeSameDomain;
		const NCollection_List<TopoDS_Shape> ShapeSameDomain(const int I);

		/****** TopOpeBRepDS_DataStructure::Surface ******/
		/****** md5 signature: 5439188fcb1b33bc27f0b1b898e5d6da ******/
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
Returns the surface of index <I>.
") Surface;
		TopOpeBRepDS_Surface Surface(const int I);

		/****** TopOpeBRepDS_DataStructure::SurfaceInterferences ******/
		/****** md5 signature: a1798d4f44ccf32b2ad8e35fabdaf007 ******/
		%feature("compactdefaultargs") SurfaceInterferences;
		%feature("autodoc", "
Parameters
----------
I: int

Return
-------
NCollection_List<opencascade::handle<TopOpeBRepDS_Interference>>

Description
-----------
No available documentation.
") SurfaceInterferences;
		const NCollection_List<opencascade::handle<TopOpeBRepDS_Interference>> & SurfaceInterferences(const int I);

		/****** TopOpeBRepDS_DataStructure::UnfillShapesSameDomain ******/
		/****** md5 signature: 905209a2e684aadc3d1ca6d75dc22261 ******/
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
		/****** TopOpeBRepDS_Dumper::TopOpeBRepDS_Dumper ******/
		/****** md5 signature: 3545ff8a5f08c6885b2d88a4f61861d0 ******/
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

		/****** TopOpeBRepDS_Dumper::SDumpRefOri ******/
		/****** md5 signature: e496c17e29dcdffa6053422e1a05b8bf ******/
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
		TCollection_AsciiString SDumpRefOri(const TopOpeBRepDS_Kind K, const int I);

		/****** TopOpeBRepDS_Dumper::SDumpRefOri ******/
		/****** md5 signature: 2de056c6b87cd98b2ce3ade55eccba16 ******/
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

		/****** TopOpeBRepDS_Dumper::SPrintShape ******/
		/****** md5 signature: c57cdbc75814e21e7fbbda8755c95f50 ******/
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
		TCollection_AsciiString SPrintShape(const int I);

		/****** TopOpeBRepDS_Dumper::SPrintShape ******/
		/****** md5 signature: 29aa3a0f30477ccf992e00d9f2c4ade9 ******/
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

		/****** TopOpeBRepDS_Dumper::SPrintShapeRefOri ******/
		/****** md5 signature: b87193ebb49975a024fdbcf4acf5737e ******/
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

		/****** TopOpeBRepDS_Dumper::SPrintShapeRefOri ******/
		/****** md5 signature: a055dcaf60954f6ba0f6efa46a95c3ce ******/
		%feature("compactdefaultargs") SPrintShapeRefOri;
		%feature("autodoc", "
Parameters
----------
L: NCollection_List<TopoDS_Shape>
B: str (optional, default to "")

Return
-------
TCollection_AsciiString

Description
-----------
No available documentation.
") SPrintShapeRefOri;
		TCollection_AsciiString SPrintShapeRefOri(const NCollection_List<TopoDS_Shape> & L, TCollection_AsciiString B = "");

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
		/****** TopOpeBRepDS_EIR::TopOpeBRepDS_EIR ******/
		/****** md5 signature: 080ad68854c97251af5c7951dae3285a ******/
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

		/****** TopOpeBRepDS_EIR::ProcessEdgeInterferences ******/
		/****** md5 signature: fdb0a9346715ac3d5b07add0cbfe07d8 ******/
		%feature("compactdefaultargs") ProcessEdgeInterferences;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") ProcessEdgeInterferences;
		void ProcessEdgeInterferences();

		/****** TopOpeBRepDS_EIR::ProcessEdgeInterferences ******/
		/****** md5 signature: 0701560f3ecad2ca4e4002b90f11b089 ******/
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
		void ProcessEdgeInterferences(const int I);

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
		/****** TopOpeBRepDS_Edge3dInterferenceTool::TopOpeBRepDS_Edge3dInterferenceTool ******/
		/****** md5 signature: 989690dea45d908958214a81d3f29bc5 ******/
		%feature("compactdefaultargs") TopOpeBRepDS_Edge3dInterferenceTool;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepDS_Edge3dInterferenceTool;
		 TopOpeBRepDS_Edge3dInterferenceTool();

		/****** TopOpeBRepDS_Edge3dInterferenceTool::Add ******/
		/****** md5 signature: f5412b5c46c5e401b7e23d3bbaf85690 ******/
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

		/****** TopOpeBRepDS_Edge3dInterferenceTool::Init ******/
		/****** md5 signature: bd799a083bd15005a62ec114ed5690e5 ******/
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

		/****** TopOpeBRepDS_Edge3dInterferenceTool::InitPointVertex ******/
		/****** md5 signature: 14c05cdc8221771971426edbf4152588 ******/
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
		void InitPointVertex(const int IsVertex, const TopoDS_Shape & VonOO);

		/****** TopOpeBRepDS_Edge3dInterferenceTool::Transition ******/
		/****** md5 signature: cddcef230eeaaa0ab8b7f8b429bec838 ******/
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
		/****** TopOpeBRepDS_EdgeInterferenceTool::TopOpeBRepDS_EdgeInterferenceTool ******/
		/****** md5 signature: 161f54aa2c0b78b3be6e57b13979bf3b ******/
		%feature("compactdefaultargs") TopOpeBRepDS_EdgeInterferenceTool;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepDS_EdgeInterferenceTool;
		 TopOpeBRepDS_EdgeInterferenceTool();

		/****** TopOpeBRepDS_EdgeInterferenceTool::Add ******/
		/****** md5 signature: 984a46bb46b06bb362c9533fee8aecbf ******/
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

		/****** TopOpeBRepDS_EdgeInterferenceTool::Add ******/
		/****** md5 signature: 57a3df2710a6e43e79ce80fcd3aeb88e ******/
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

		/****** TopOpeBRepDS_EdgeInterferenceTool::Init ******/
		/****** md5 signature: 1e2831de8f226d054fe6dfca5fa05068 ******/
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

		/****** TopOpeBRepDS_EdgeInterferenceTool::Transition ******/
		/****** md5 signature: cddcef230eeaaa0ab8b7f8b429bec838 ******/
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
		/****** TopOpeBRepDS_Explorer::TopOpeBRepDS_Explorer ******/
		/****** md5 signature: 2293d0207469764caec658537b0e3756 ******/
		%feature("compactdefaultargs") TopOpeBRepDS_Explorer;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepDS_Explorer;
		 TopOpeBRepDS_Explorer();

		/****** TopOpeBRepDS_Explorer::TopOpeBRepDS_Explorer ******/
		/****** md5 signature: 3436df1ceee801e0eaf7d993875ef821 ******/
		%feature("compactdefaultargs") TopOpeBRepDS_Explorer;
		%feature("autodoc", "
Parameters
----------
HDS: TopOpeBRepDS_HDataStructure
T: TopAbs_ShapeEnum (optional, default to TopAbs_SHAPE)
findkeep: bool (optional, default to true)

Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepDS_Explorer;
		 TopOpeBRepDS_Explorer(const opencascade::handle<TopOpeBRepDS_HDataStructure> & HDS, const TopAbs_ShapeEnum T = TopAbs_SHAPE, const bool findkeep = true);

		/****** TopOpeBRepDS_Explorer::Current ******/
		/****** md5 signature: b191bf677bf7b52144f20d0821ea8f06 ******/
		%feature("compactdefaultargs") Current;
		%feature("autodoc", "Return
-------
TopoDS_Shape

Description
-----------
No available documentation.
") Current;
		const TopoDS_Shape Current();

		/****** TopOpeBRepDS_Explorer::Edge ******/
		/****** md5 signature: be590cff987799d8b7c28083399d0e9f ******/
		%feature("compactdefaultargs") Edge;
		%feature("autodoc", "Return
-------
TopoDS_Edge

Description
-----------
No available documentation.
") Edge;
		const TopoDS_Edge Edge();

		/****** TopOpeBRepDS_Explorer::Face ******/
		/****** md5 signature: 91e216ebeb76e55c73eb9e179241a6ff ******/
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "Return
-------
TopoDS_Face

Description
-----------
No available documentation.
") Face;
		const TopoDS_Face Face();

		/****** TopOpeBRepDS_Explorer::Index ******/
		/****** md5 signature: 5f8486b8f8a28d56e63445ad924b19d8 ******/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Index;
		int Index();

		/****** TopOpeBRepDS_Explorer::Init ******/
		/****** md5 signature: 4100fb20cfdbefc87278a3665a6f7966 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
HDS: TopOpeBRepDS_HDataStructure
T: TopAbs_ShapeEnum (optional, default to TopAbs_SHAPE)
findkeep: bool (optional, default to true)

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const opencascade::handle<TopOpeBRepDS_HDataStructure> & HDS, const TopAbs_ShapeEnum T = TopAbs_SHAPE, const bool findkeep = true);

		/****** TopOpeBRepDS_Explorer::More ******/
		/****** md5 signature: 922f3b0d43975d648336ba28bdfd0416 ******/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") More;
		bool More();

		/****** TopOpeBRepDS_Explorer::Next ******/
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

		/****** TopOpeBRepDS_Explorer::Type ******/
		/****** md5 signature: 3f27a65186b8053d282c2c0d8c4513b8 ******/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "Return
-------
TopAbs_ShapeEnum

Description
-----------
No available documentation.
") Type;
		TopAbs_ShapeEnum Type();

		/****** TopOpeBRepDS_Explorer::Vertex ******/
		/****** md5 signature: 84212ff79cd7d64cd0ebfa6f17214e90 ******/
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
		/****** TopOpeBRepDS_FIR::TopOpeBRepDS_FIR ******/
		/****** md5 signature: e43092489ebd9a0dac299aa04f677b13 ******/
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

		/****** TopOpeBRepDS_FIR::ProcessFaceInterferences ******/
		/****** md5 signature: bca602f8ea802578396affd5ec299aa0 ******/
		%feature("compactdefaultargs") ProcessFaceInterferences;
		%feature("autodoc", "
Parameters
----------
M: NCollection_DataMap<TopoDS_Shape, TopOpeBRepDS_ListOfShapeOn1State, TopTools_ShapeMapHasher>

Return
-------
None

Description
-----------
No available documentation.
") ProcessFaceInterferences;
		void ProcessFaceInterferences(const NCollection_DataMap<TopoDS_Shape, TopOpeBRepDS_ListOfShapeOn1State, TopTools_ShapeMapHasher> & M);

		/****** TopOpeBRepDS_FIR::ProcessFaceInterferences ******/
		/****** md5 signature: e6d8ebcb6e3aeb55a9df40a7af39363b ******/
		%feature("compactdefaultargs") ProcessFaceInterferences;
		%feature("autodoc", "
Parameters
----------
I: int
M: NCollection_DataMap<TopoDS_Shape, TopOpeBRepDS_ListOfShapeOn1State, TopTools_ShapeMapHasher>

Return
-------
None

Description
-----------
No available documentation.
") ProcessFaceInterferences;
		void ProcessFaceInterferences(const int I, const NCollection_DataMap<TopoDS_Shape, TopOpeBRepDS_ListOfShapeOn1State, TopTools_ShapeMapHasher> & M);

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
		/****** TopOpeBRepDS_FaceInterferenceTool::TopOpeBRepDS_FaceInterferenceTool ******/
		/****** md5 signature: 2d3febd4d9968db559e4cd129f0a6bf9 ******/
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

		/****** TopOpeBRepDS_FaceInterferenceTool::Add ******/
		/****** md5 signature: 2864ecc8a9415c3b5fe19f0b704265bf ******/
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
Eisnew = true if E is a new edge built on edge I->Geometry() false if E is shape <=> I->Geometry().
") Add;
		void Add(const TopoDS_Shape & FI, const TopoDS_Shape & F, const TopoDS_Shape & E, const bool Eisnew, const opencascade::handle<TopOpeBRepDS_Interference> & I);

		/****** TopOpeBRepDS_FaceInterferenceTool::Add ******/
		/****** md5 signature: 47cc6602993a12c2438dc9b1d0e36a75 ******/
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

		/****** TopOpeBRepDS_FaceInterferenceTool::GetEdgePntPar ******/
		/****** md5 signature: 916678840a93b41566df9cf8cfa048b9 ******/
		%feature("compactdefaultargs") GetEdgePntPar;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt

Return
-------
par: double

Description
-----------
No available documentation.
") GetEdgePntPar;
		void GetEdgePntPar(gp_Pnt & P, Standard_Real &OutValue);

		/****** TopOpeBRepDS_FaceInterferenceTool::Init ******/
		/****** md5 signature: dabaaabcfc9b3a70988dd1e7d56925b5 ******/
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
Eisnew = true if E is a new edge built on edge I->Geometry() false if E is shape <=> I->Geometry().
") Init;
		void Init(const TopoDS_Shape & FI, const TopoDS_Shape & E, const bool Eisnew, const opencascade::handle<TopOpeBRepDS_Interference> & I);

		/****** TopOpeBRepDS_FaceInterferenceTool::IsEdgePntParDef ******/
		/****** md5 signature: ed0903e5e7dd49b112eb2c98f9ba0e01 ******/
		%feature("compactdefaultargs") IsEdgePntParDef;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsEdgePntParDef;
		bool IsEdgePntParDef();

		/****** TopOpeBRepDS_FaceInterferenceTool::SetEdgePntPar ******/
		/****** md5 signature: 009f7d98c109a6963d42544950e3df11 ******/
		%feature("compactdefaultargs") SetEdgePntPar;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
par: double

Return
-------
None

Description
-----------
No available documentation.
") SetEdgePntPar;
		void SetEdgePntPar(const gp_Pnt & P, const double par);

		/****** TopOpeBRepDS_FaceInterferenceTool::Transition ******/
		/****** md5 signature: cddcef230eeaaa0ab8b7f8b429bec838 ******/
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
		/****** TopOpeBRepDS_Filter::TopOpeBRepDS_Filter ******/
		/****** md5 signature: 95b1e65b7ce852331cd91591e45aa59d ******/
		%feature("compactdefaultargs") TopOpeBRepDS_Filter;
		%feature("autodoc", "
Parameters
----------
HDS: TopOpeBRepDS_HDataStructure
pClassif: TopOpeBRepTool_PShapeClassifier (optional, default to nullptr)

Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepDS_Filter;
		 TopOpeBRepDS_Filter(const opencascade::handle<TopOpeBRepDS_HDataStructure> & HDS, const TopOpeBRepTool_PShapeClassifier & pClassif = nullptr);

		/****** TopOpeBRepDS_Filter::ProcessCurveInterferences ******/
		/****** md5 signature: 1465b61e58c569ca8b3a40b168fef6ef ******/
		%feature("compactdefaultargs") ProcessCurveInterferences;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") ProcessCurveInterferences;
		void ProcessCurveInterferences();

		/****** TopOpeBRepDS_Filter::ProcessCurveInterferences ******/
		/****** md5 signature: 275ba336339545e8d0bda4bb5e69fb98 ******/
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
		void ProcessCurveInterferences(const int I);

		/****** TopOpeBRepDS_Filter::ProcessEdgeInterferences ******/
		/****** md5 signature: fdb0a9346715ac3d5b07add0cbfe07d8 ******/
		%feature("compactdefaultargs") ProcessEdgeInterferences;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") ProcessEdgeInterferences;
		void ProcessEdgeInterferences();

		/****** TopOpeBRepDS_Filter::ProcessEdgeInterferences ******/
		/****** md5 signature: 0701560f3ecad2ca4e4002b90f11b089 ******/
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
		void ProcessEdgeInterferences(const int I);

		/****** TopOpeBRepDS_Filter::ProcessFaceInterferences ******/
		/****** md5 signature: 13c725361cc2a6e075b5c72d72a85dc0 ******/
		%feature("compactdefaultargs") ProcessFaceInterferences;
		%feature("autodoc", "
Parameters
----------
MEsp: NCollection_DataMap<TopoDS_Shape, TopOpeBRepDS_ListOfShapeOn1State, TopTools_ShapeMapHasher>

Return
-------
None

Description
-----------
No available documentation.
") ProcessFaceInterferences;
		void ProcessFaceInterferences(const NCollection_DataMap<TopoDS_Shape, TopOpeBRepDS_ListOfShapeOn1State, TopTools_ShapeMapHasher> & MEsp);

		/****** TopOpeBRepDS_Filter::ProcessFaceInterferences ******/
		/****** md5 signature: 01fd55a0750a49826cf3a98c2db5ad6d ******/
		%feature("compactdefaultargs") ProcessFaceInterferences;
		%feature("autodoc", "
Parameters
----------
I: int
MEsp: NCollection_DataMap<TopoDS_Shape, TopOpeBRepDS_ListOfShapeOn1State, TopTools_ShapeMapHasher>

Return
-------
None

Description
-----------
No available documentation.
") ProcessFaceInterferences;
		void ProcessFaceInterferences(const int I, const NCollection_DataMap<TopoDS_Shape, TopOpeBRepDS_ListOfShapeOn1State, TopTools_ShapeMapHasher> & MEsp);

		/****** TopOpeBRepDS_Filter::ProcessInterferences ******/
		/****** md5 signature: 03ecfa694ab2b8c0bb984407262d748c ******/
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
		/****** TopOpeBRepDS_GapFiller::TopOpeBRepDS_GapFiller ******/
		/****** md5 signature: 722b2cba45fefb9f5d5867e80460ce34 ******/
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

		/****** TopOpeBRepDS_GapFiller::AddPointsOnConnexShape ******/
		/****** md5 signature: 8556d820215996b35b2a169de5d30ae5 ******/
		%feature("compactdefaultargs") AddPointsOnConnexShape;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Shape
LI: TopOpeBRepDS_Interference

Return
-------
None

Description
-----------
Methodes pour reduire la liste des Points qui peuvent correspondre a une Point donne.
") AddPointsOnConnexShape;
		void AddPointsOnConnexShape(const TopoDS_Shape & F, const NCollection_List<opencascade::handle<TopOpeBRepDS_Interference> > & LI);

		/****** TopOpeBRepDS_GapFiller::AddPointsOnShape ******/
		/****** md5 signature: fc71db17942f501c021a1604c6309d03 ******/
		%feature("compactdefaultargs") AddPointsOnShape;
		%feature("autodoc", "
Parameters
----------
S: TopoDS_Shape
LI: TopOpeBRepDS_Interference

Return
-------
None

Description
-----------
No available documentation.
") AddPointsOnShape;
		void AddPointsOnShape(const TopoDS_Shape & S, NCollection_List<opencascade::handle<TopOpeBRepDS_Interference> > & LI);

		/****** TopOpeBRepDS_GapFiller::BuildNewGeometries ******/
		/****** md5 signature: 2bcc3a668d4ba8f8140566f3c713941d ******/
		%feature("compactdefaultargs") BuildNewGeometries;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") BuildNewGeometries;
		void BuildNewGeometries();

		/****** TopOpeBRepDS_GapFiller::CheckConnexity ******/
		/****** md5 signature: cc8347d5af9b5a8b94a293377dff398a ******/
		%feature("compactdefaultargs") CheckConnexity;
		%feature("autodoc", "
Parameters
----------
LI: TopOpeBRepDS_Interference

Return
-------
bool

Description
-----------
Enchaine les sections via les points d'Interferences deja associe; Renvoit dans <L> les points extremites des Lignes. Methodes pour construire la liste des Points qui peuvent correspondre a une Point donne.
") CheckConnexity;
		bool CheckConnexity(NCollection_List<opencascade::handle<TopOpeBRepDS_Interference> > & LI);

		/****** TopOpeBRepDS_GapFiller::FilterByEdge ******/
		/****** md5 signature: 02110384f336a96f998b504bc6371609 ******/
		%feature("compactdefaultargs") FilterByEdge;
		%feature("autodoc", "
Parameters
----------
E: TopoDS_Edge
LI: TopOpeBRepDS_Interference

Return
-------
None

Description
-----------
No available documentation.
") FilterByEdge;
		void FilterByEdge(const TopoDS_Edge & E, NCollection_List<opencascade::handle<TopOpeBRepDS_Interference> > & LI);

		/****** TopOpeBRepDS_GapFiller::FilterByFace ******/
		/****** md5 signature: c9d55e69653dc7aab67ddf56d3b01bee ******/
		%feature("compactdefaultargs") FilterByFace;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face
LI: TopOpeBRepDS_Interference

Return
-------
None

Description
-----------
No available documentation.
") FilterByFace;
		void FilterByFace(const TopoDS_Face & F, NCollection_List<opencascade::handle<TopOpeBRepDS_Interference> > & LI);

		/****** TopOpeBRepDS_GapFiller::FilterByIncidentDistance ******/
		/****** md5 signature: 2f16df34faa705e6aef1ac78beba8895 ******/
		%feature("compactdefaultargs") FilterByIncidentDistance;
		%feature("autodoc", "
Parameters
----------
F: TopoDS_Face
I: TopOpeBRepDS_Interference
LI: TopOpeBRepDS_Interference

Return
-------
None

Description
-----------
No available documentation.
") FilterByIncidentDistance;
		void FilterByIncidentDistance(const TopoDS_Face & F, const opencascade::handle<TopOpeBRepDS_Interference> & I, NCollection_List<opencascade::handle<TopOpeBRepDS_Interference> > & LI);

		/****** TopOpeBRepDS_GapFiller::FindAssociatedPoints ******/
		/****** md5 signature: 6955d4e4f3421a25f28099268ef12408 ******/
		%feature("compactdefaultargs") FindAssociatedPoints;
		%feature("autodoc", "
Parameters
----------
I: TopOpeBRepDS_Interference
LI: TopOpeBRepDS_Interference

Return
-------
None

Description
-----------
Recherche parmi l'ensemble des points d'Interference la Liste <LI> des points qui correspondent au point d'indice <Index>.
") FindAssociatedPoints;
		void FindAssociatedPoints(const opencascade::handle<TopOpeBRepDS_Interference> & I, NCollection_List<opencascade::handle<TopOpeBRepDS_Interference> > & LI);

		/****** TopOpeBRepDS_GapFiller::IsOnEdge ******/
		/****** md5 signature: b1569a9a37dbc4b523f6b3835f8ef72b ******/
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
Return True si I ou une de ses representaions a pour support <E>. Methodes de reconstructions des geometries des point et des courbes de section.
") IsOnEdge;
		bool IsOnEdge(const opencascade::handle<TopOpeBRepDS_Interference> & I, const TopoDS_Edge & E);

		/****** TopOpeBRepDS_GapFiller::IsOnFace ******/
		/****** md5 signature: 4c3a9e96044d08455293511a2211ece7 ******/
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
Return True si I a ete obtenu par une intersection avec <F>.
") IsOnFace;
		bool IsOnFace(const opencascade::handle<TopOpeBRepDS_Interference> & I, const TopoDS_Face & F);

		/****** TopOpeBRepDS_GapFiller::Perform ******/
		/****** md5 signature: c04b01412cba7220c024b5eb4532697f ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform();

		/****** TopOpeBRepDS_GapFiller::ReBuildGeom ******/
		/****** md5 signature: d0f2733074da87b8be91b0130541a9b6 ******/
		%feature("compactdefaultargs") ReBuildGeom;
		%feature("autodoc", "
Parameters
----------
I1: TopOpeBRepDS_Interference
Done: NCollection_Map<int>

Return
-------
None

Description
-----------
No available documentation.
") ReBuildGeom;
		void ReBuildGeom(const opencascade::handle<TopOpeBRepDS_Interference> & I1, NCollection_Map<int> & Done);

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
		/****** TopOpeBRepDS_GapTool::TopOpeBRepDS_GapTool ******/
		/****** md5 signature: 0f7c1efdc5925f5b689eb91c0c74aa96 ******/
		%feature("compactdefaultargs") TopOpeBRepDS_GapTool;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepDS_GapTool;
		 TopOpeBRepDS_GapTool();

		/****** TopOpeBRepDS_GapTool::TopOpeBRepDS_GapTool ******/
		/****** md5 signature: bbdcd383be0fc32ea4fde576950b3a17 ******/
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

		/****** TopOpeBRepDS_GapTool::ChangeSameInterferences ******/
		/****** md5 signature: 42c6a5e2d0218832a7e4cd0110146ca2 ******/
		%feature("compactdefaultargs") ChangeSameInterferences;
		%feature("autodoc", "
Parameters
----------
I: TopOpeBRepDS_Interference

Return
-------
NCollection_List<opencascade::handle<TopOpeBRepDS_Interference>>

Description
-----------
No available documentation.
") ChangeSameInterferences;
		NCollection_List<opencascade::handle<TopOpeBRepDS_Interference>> & ChangeSameInterferences(const opencascade::handle<TopOpeBRepDS_Interference> & I);

		/****** TopOpeBRepDS_GapTool::Curve ******/
		/****** md5 signature: 6e94efa6e5f6f1ca70e39d93679de971 ******/
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
		bool Curve(const opencascade::handle<TopOpeBRepDS_Interference> & I, TopOpeBRepDS_Curve & C);

		/****** TopOpeBRepDS_GapTool::EdgeSupport ******/
		/****** md5 signature: 9c74ac3cf53b78cb6f02ddf0898e0eb9 ******/
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
		bool EdgeSupport(const opencascade::handle<TopOpeBRepDS_Interference> & I, TopoDS_Shape & E);

		/****** TopOpeBRepDS_GapTool::FacesSupport ******/
		/****** md5 signature: 601d36203c369acd0ee861257f512957 ******/
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
Return les faces qui ont genere la section origine de I.
") FacesSupport;
		bool FacesSupport(const opencascade::handle<TopOpeBRepDS_Interference> & I, TopoDS_Shape & F1, TopoDS_Shape & F2);

		/****** TopOpeBRepDS_GapTool::Init ******/
		/****** md5 signature: 024bcfdbf9359dde26d22897154bd930 ******/
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

		/****** TopOpeBRepDS_GapTool::Interferences ******/
		/****** md5 signature: 035d6298ac8221bf668baf25fc1baa47 ******/
		%feature("compactdefaultargs") Interferences;
		%feature("autodoc", "
Parameters
----------
IndexPoint: int

Return
-------
NCollection_List<opencascade::handle<TopOpeBRepDS_Interference>>

Description
-----------
No available documentation.
") Interferences;
		const NCollection_List<opencascade::handle<TopOpeBRepDS_Interference>> & Interferences(const int IndexPoint);

		/****** TopOpeBRepDS_GapTool::ParameterOnEdge ******/
		/****** md5 signature: e5b832249037d256fc995098dbbf80f1 ******/
		%feature("compactdefaultargs") ParameterOnEdge;
		%feature("autodoc", "
Parameters
----------
I: TopOpeBRepDS_Interference
E: TopoDS_Shape

Return
-------
U: double

Description
-----------
No available documentation.
") ParameterOnEdge;
		bool ParameterOnEdge(const opencascade::handle<TopOpeBRepDS_Interference> & I, const TopoDS_Shape & E, Standard_Real &OutValue);

		/****** TopOpeBRepDS_GapTool::SameInterferences ******/
		/****** md5 signature: 06df1ea106756c2ec9ddfc51953a3ea6 ******/
		%feature("compactdefaultargs") SameInterferences;
		%feature("autodoc", "
Parameters
----------
I: TopOpeBRepDS_Interference

Return
-------
NCollection_List<opencascade::handle<TopOpeBRepDS_Interference>>

Description
-----------
No available documentation.
") SameInterferences;
		const NCollection_List<opencascade::handle<TopOpeBRepDS_Interference>> & SameInterferences(const opencascade::handle<TopOpeBRepDS_Interference> & I);

		/****** TopOpeBRepDS_GapTool::SetParameterOnEdge ******/
		/****** md5 signature: e6a152fb4fbcbe38daa526a50220f40d ******/
		%feature("compactdefaultargs") SetParameterOnEdge;
		%feature("autodoc", "
Parameters
----------
I: TopOpeBRepDS_Interference
E: TopoDS_Shape
U: double

Return
-------
None

Description
-----------
No available documentation.
") SetParameterOnEdge;
		void SetParameterOnEdge(const opencascade::handle<TopOpeBRepDS_Interference> & I, const TopoDS_Shape & E, const double U);

		/****** TopOpeBRepDS_GapTool::SetPoint ******/
		/****** md5 signature: 7e6bef0c1672a6753e6846544d422bcf ******/
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
		void SetPoint(const opencascade::handle<TopOpeBRepDS_Interference> & I, const int IndexPoint);

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
		/****** TopOpeBRepDS_GeometryData::TopOpeBRepDS_GeometryData ******/
		/****** md5 signature: 2c996296693d7f1858d92dfd1d41c646 ******/
		%feature("compactdefaultargs") TopOpeBRepDS_GeometryData;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepDS_GeometryData;
		 TopOpeBRepDS_GeometryData();

		/****** TopOpeBRepDS_GeometryData::TopOpeBRepDS_GeometryData ******/
		/****** md5 signature: b9cc3a4e21ada85ace1f83e1a78be2ca ******/
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

		/****** TopOpeBRepDS_GeometryData::AddInterference ******/
		/****** md5 signature: 5f60096821134e0e43b7c194b77bc0aa ******/
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

		/****** TopOpeBRepDS_GeometryData::Assign ******/
		/****** md5 signature: bd100538f072155057df1d5f3c464a3a ******/
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

		/****** TopOpeBRepDS_GeometryData::ChangeInterferences ******/
		/****** md5 signature: 49be78cb30ff54b8097d34def094ca37 ******/
		%feature("compactdefaultargs") ChangeInterferences;
		%feature("autodoc", "Return
-------
NCollection_List<opencascade::handle<TopOpeBRepDS_Interference>>

Description
-----------
No available documentation.
") ChangeInterferences;
		NCollection_List<opencascade::handle<TopOpeBRepDS_Interference>> & ChangeInterferences();

		/****** TopOpeBRepDS_GeometryData::Interferences ******/
		/****** md5 signature: 1ad49ef4c8f0239686b904a9bb96ba95 ******/
		%feature("compactdefaultargs") Interferences;
		%feature("autodoc", "Return
-------
NCollection_List<opencascade::handle<TopOpeBRepDS_Interference>>

Description
-----------
No available documentation.
") Interferences;
		const NCollection_List<opencascade::handle<TopOpeBRepDS_Interference>> & Interferences();

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
		/****** TopOpeBRepDS_Interference::TopOpeBRepDS_Interference ******/
		/****** md5 signature: eb974943fa755fceaa6da2308ba06466 ******/
		%feature("compactdefaultargs") TopOpeBRepDS_Interference;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepDS_Interference;
		 TopOpeBRepDS_Interference();

		/****** TopOpeBRepDS_Interference::TopOpeBRepDS_Interference ******/
		/****** md5 signature: b8b0a349fd2930de89e28c9d435653d9 ******/
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
		 TopOpeBRepDS_Interference(const TopOpeBRepDS_Transition & Transition, const TopOpeBRepDS_Kind SupportType, const int Support, const TopOpeBRepDS_Kind GeometryType, const int Geometry);

		/****** TopOpeBRepDS_Interference::TopOpeBRepDS_Interference ******/
		/****** md5 signature: 24dc11f4674be209a27cf60b2243e080 ******/
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

		/****** TopOpeBRepDS_Interference::ChangeTransition ******/
		/****** md5 signature: 1011287ae55d0acc146aae0c7dd5b16e ******/
		%feature("compactdefaultargs") ChangeTransition;
		%feature("autodoc", "Return
-------
TopOpeBRepDS_Transition

Description
-----------
No available documentation.
") ChangeTransition;
		TopOpeBRepDS_Transition & ChangeTransition();

		/****** TopOpeBRepDS_Interference::GKGSKS ******/
		/****** md5 signature: b2ff7a0095004b13b25e424b823c7b53 ******/
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
return GeometryType + Geometry + SupportType + Support.
") GKGSKS;
		void GKGSKS(TopOpeBRepDS_Kind &OutValue, Standard_Integer &OutValue, TopOpeBRepDS_Kind &OutValue, Standard_Integer &OutValue);

		/****** TopOpeBRepDS_Interference::Geometry ******/
		/****** md5 signature: d704724ace2c7d114214e32c7195d171 ******/
		%feature("compactdefaultargs") Geometry;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Geometry;
		int Geometry();

		/****** TopOpeBRepDS_Interference::Geometry ******/
		/****** md5 signature: 024f2bb3166d1fb8e14c734adacf5638 ******/
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
		void Geometry(const int G);

		/****** TopOpeBRepDS_Interference::GeometryType ******/
		/****** md5 signature: 844ce07794e9ce4fc9b3f97ebf69382f ******/
		%feature("compactdefaultargs") GeometryType;
		%feature("autodoc", "Return
-------
TopOpeBRepDS_Kind

Description
-----------
No available documentation.
") GeometryType;
		TopOpeBRepDS_Kind GeometryType();

		/****** TopOpeBRepDS_Interference::GeometryType ******/
		/****** md5 signature: 698c8f46bf348e356e4f525e01faab03 ******/
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

		/****** TopOpeBRepDS_Interference::HasSameGeometry ******/
		/****** md5 signature: 5259d74dd3dd06f330243410119a0aaf ******/
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
		bool HasSameGeometry(const opencascade::handle<TopOpeBRepDS_Interference> & Other);

		/****** TopOpeBRepDS_Interference::HasSameSupport ******/
		/****** md5 signature: da7f4da5310c65588f329999db89ddb0 ******/
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
		bool HasSameSupport(const opencascade::handle<TopOpeBRepDS_Interference> & Other);

		/****** TopOpeBRepDS_Interference::SetGeometry ******/
		/****** md5 signature: c6ca5128a3805ef746f0eeff2a711fff ******/
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
		void SetGeometry(const int GI);

		/****** TopOpeBRepDS_Interference::Support ******/
		/****** md5 signature: 9090c4e5db2e5c0baea34ea7471993cf ******/
		%feature("compactdefaultargs") Support;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Support;
		int Support();

		/****** TopOpeBRepDS_Interference::Support ******/
		/****** md5 signature: 810c63323c69c8e664ac54087781f75a ******/
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
		void Support(const int S);

		/****** TopOpeBRepDS_Interference::SupportType ******/
		/****** md5 signature: 7133e5c87610c7bbd71b6f22b6e541eb ******/
		%feature("compactdefaultargs") SupportType;
		%feature("autodoc", "Return
-------
TopOpeBRepDS_Kind

Description
-----------
No available documentation.
") SupportType;
		TopOpeBRepDS_Kind SupportType();

		/****** TopOpeBRepDS_Interference::SupportType ******/
		/****** md5 signature: 42aa9ca2bc4bdce738b125b385ecb19d ******/
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

		/****** TopOpeBRepDS_Interference::Transition ******/
		/****** md5 signature: b5272cce68efc51cec1c0feca2f97771 ******/
		%feature("compactdefaultargs") Transition;
		%feature("autodoc", "Return
-------
TopOpeBRepDS_Transition

Description
-----------
No available documentation.
") Transition;
		const TopOpeBRepDS_Transition & Transition();

		/****** TopOpeBRepDS_Interference::Transition ******/
		/****** md5 signature: 9d87175c97a5fdd5dd0051ebaa8ceb42 ******/
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
		/****** TopOpeBRepDS_InterferenceIterator::TopOpeBRepDS_InterferenceIterator ******/
		/****** md5 signature: 4872340032b48839fd5050af3f4a5143 ******/
		%feature("compactdefaultargs") TopOpeBRepDS_InterferenceIterator;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepDS_InterferenceIterator;
		 TopOpeBRepDS_InterferenceIterator();

		/****** TopOpeBRepDS_InterferenceIterator::TopOpeBRepDS_InterferenceIterator ******/
		/****** md5 signature: 35eeb14939d4baaa7170286d7aa6509d ******/
		%feature("compactdefaultargs") TopOpeBRepDS_InterferenceIterator;
		%feature("autodoc", "
Parameters
----------
L: TopOpeBRepDS_Interference

Return
-------
None

Description
-----------
Creates an iterator on the Interference of list <L>.
") TopOpeBRepDS_InterferenceIterator;
		 TopOpeBRepDS_InterferenceIterator(const NCollection_List<opencascade::handle<TopOpeBRepDS_Interference> > & L);

		/****** TopOpeBRepDS_InterferenceIterator::ChangeIterator ******/
		/****** md5 signature: 4a5d38d3105b0250e1a523cf855144dd ******/
		%feature("compactdefaultargs") ChangeIterator;
		%feature("autodoc", "Return
-------
NCollection_List<opencascade::handle<TopOpeBRepDS_Interference>>::Iterator

Description
-----------
No available documentation.
") ChangeIterator;
		NCollection_List<opencascade::handle<TopOpeBRepDS_Interference>>::Iterator & ChangeIterator();

		/****** TopOpeBRepDS_InterferenceIterator::Geometry ******/
		/****** md5 signature: 024f2bb3166d1fb8e14c734adacf5638 ******/
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
define a condition on interference iteration process. Interference must match the Geometry <G>.
") Geometry;
		void Geometry(const int G);

		/****** TopOpeBRepDS_InterferenceIterator::GeometryKind ******/
		/****** md5 signature: 7c24d25f53c83a2fe339cd9736091f36 ******/
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
define a condition on interference iteration process. Interference must match the Geometry Kind <ST>.
") GeometryKind;
		void GeometryKind(const TopOpeBRepDS_Kind GK);

		/****** TopOpeBRepDS_InterferenceIterator::Init ******/
		/****** md5 signature: 17292fa3c18fc235f926ab48eb9544a7 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
L: TopOpeBRepDS_Interference

Return
-------
None

Description
-----------
re-initialize interference iteration process on the list of interference <L>. Conditions are not modified.
") Init;
		void Init(const NCollection_List<opencascade::handle<TopOpeBRepDS_Interference> > & L);

		/****** TopOpeBRepDS_InterferenceIterator::Match ******/
		/****** md5 signature: 3b22ed9ef0be8edf337a58574cb50ef5 ******/
		%feature("compactdefaultargs") Match;
		%feature("autodoc", "Return
-------
None

Description
-----------
reach for an interference matching the conditions (if defined).
") Match;
		void Match();

		/****** TopOpeBRepDS_InterferenceIterator::MatchInterference ******/
		/****** md5 signature: ca4b26263b412364b2a422f732b7e720 ******/
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
Returns True if the Interference <I> matches the conditions (if defined). If no conditions defined, returns True.
") MatchInterference;
		virtual bool MatchInterference(const opencascade::handle<TopOpeBRepDS_Interference> & I);

		/****** TopOpeBRepDS_InterferenceIterator::More ******/
		/****** md5 signature: 922f3b0d43975d648336ba28bdfd0416 ******/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if there is a current Interference in the iteration.
") More;
		bool More();

		/****** TopOpeBRepDS_InterferenceIterator::Next ******/
		/****** md5 signature: f35c0df5f1d7c877986db18081404532 ******/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Return
-------
None

Description
-----------
Move to the next Interference.
") Next;
		void Next();

		/****** TopOpeBRepDS_InterferenceIterator::Support ******/
		/****** md5 signature: 810c63323c69c8e664ac54087781f75a ******/
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
define a condition on interference iteration process. Interference must match the Support <S>.
") Support;
		void Support(const int S);

		/****** TopOpeBRepDS_InterferenceIterator::SupportKind ******/
		/****** md5 signature: ecfb3fa2c4963c8fa0cac03ac9ad9f77 ******/
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
define a condition on interference iteration process. Interference must match the Support Kind <ST>.
") SupportKind;
		void SupportKind(const TopOpeBRepDS_Kind ST);

		/****** TopOpeBRepDS_InterferenceIterator::Value ******/
		/****** md5 signature: f3debc8b4caf6d71048cb33034f07851 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
opencascade::handle<TopOpeBRepDS_Interference>

Description
-----------
Returns the current Interference, matching the conditions (if defined).
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
		/****** TopOpeBRepDS_InterferenceTool::DuplicateCurvePointInterference ******/
		/****** md5 signature: bec019de9146c13249de5a5236bf951b ******/
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
duplicate I in a new interference with Complement() transition.
") DuplicateCurvePointInterference;
		static opencascade::handle<TopOpeBRepDS_Interference> DuplicateCurvePointInterference(const opencascade::handle<TopOpeBRepDS_Interference> & I);

		/****** TopOpeBRepDS_InterferenceTool::MakeCurveInterference ******/
		/****** md5 signature: cc0b0ad8e68c7436219bdbf773c95a38 ******/
		%feature("compactdefaultargs") MakeCurveInterference;
		%feature("autodoc", "
Parameters
----------
T: TopOpeBRepDS_Transition
SK: TopOpeBRepDS_Kind
SI: int
GK: TopOpeBRepDS_Kind
GI: int
P: double

Return
-------
opencascade::handle<TopOpeBRepDS_Interference>

Description
-----------
No available documentation.
") MakeCurveInterference;
		static opencascade::handle<TopOpeBRepDS_Interference> MakeCurveInterference(const TopOpeBRepDS_Transition & T, const TopOpeBRepDS_Kind SK, const int SI, const TopOpeBRepDS_Kind GK, const int GI, const double P);

		/****** TopOpeBRepDS_InterferenceTool::MakeEdgeInterference ******/
		/****** md5 signature: deb89a3b30973ce6773ea93c08f3d8a7 ******/
		%feature("compactdefaultargs") MakeEdgeInterference;
		%feature("autodoc", "
Parameters
----------
T: TopOpeBRepDS_Transition
SK: TopOpeBRepDS_Kind
SI: int
GK: TopOpeBRepDS_Kind
GI: int
P: double

Return
-------
opencascade::handle<TopOpeBRepDS_Interference>

Description
-----------
No available documentation.
") MakeEdgeInterference;
		static opencascade::handle<TopOpeBRepDS_Interference> MakeEdgeInterference(const TopOpeBRepDS_Transition & T, const TopOpeBRepDS_Kind SK, const int SI, const TopOpeBRepDS_Kind GK, const int GI, const double P);

		/****** TopOpeBRepDS_InterferenceTool::MakeEdgeVertexInterference ******/
		/****** md5 signature: bc24b6adbf1d6d0f371271e49b2822dc ******/
		%feature("compactdefaultargs") MakeEdgeVertexInterference;
		%feature("autodoc", "
Parameters
----------
Transition: TopOpeBRepDS_Transition
EdgeI: int
VertexI: int
VertexIsBound: bool
Config: TopOpeBRepDS_Config
param: double

Return
-------
opencascade::handle<TopOpeBRepDS_Interference>

Description
-----------
No available documentation.
") MakeEdgeVertexInterference;
		static opencascade::handle<TopOpeBRepDS_Interference> MakeEdgeVertexInterference(const TopOpeBRepDS_Transition & Transition, const int EdgeI, const int VertexI, const bool VertexIsBound, const TopOpeBRepDS_Config Config, const double param);

		/****** TopOpeBRepDS_InterferenceTool::MakeFaceCurveInterference ******/
		/****** md5 signature: 12adeb83064b188d4c073bdb66f7684a ******/
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
		static opencascade::handle<TopOpeBRepDS_Interference> MakeFaceCurveInterference(const TopOpeBRepDS_Transition & Transition, const int FaceI, const int CurveI, const opencascade::handle<Geom2d_Curve> & PC);

		/****** TopOpeBRepDS_InterferenceTool::MakeFaceEdgeInterference ******/
		/****** md5 signature: 672da6d56bf9d604c88c45c8ffc2f4e6 ******/
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
		static opencascade::handle<TopOpeBRepDS_Interference> MakeFaceEdgeInterference(const TopOpeBRepDS_Transition & Transition, const int FaceI, const int EdgeI, const bool EdgeIsBound, const TopOpeBRepDS_Config Config);

		/****** TopOpeBRepDS_InterferenceTool::MakeSolidSurfaceInterference ******/
		/****** md5 signature: da4bdbcaa8086d7119a5200c2cc91da6 ******/
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
		static opencascade::handle<TopOpeBRepDS_Interference> MakeSolidSurfaceInterference(const TopOpeBRepDS_Transition & Transition, const int SolidI, const int SurfaceI);

		/****** TopOpeBRepDS_InterferenceTool::Parameter ******/
		/****** md5 signature: e73f1caf0ccd10c461e48173c19c6b86 ******/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "
Parameters
----------
CPI: TopOpeBRepDS_Interference

Return
-------
double

Description
-----------
No available documentation.
") Parameter;
		static double Parameter(const opencascade::handle<TopOpeBRepDS_Interference> & CPI);

		/****** TopOpeBRepDS_InterferenceTool::Parameter ******/
		/****** md5 signature: a0872f40cb096129e9eede50e4169a1f ******/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "
Parameters
----------
CPI: TopOpeBRepDS_Interference
Par: double

Return
-------
None

Description
-----------
No available documentation.
") Parameter;
		static void Parameter(const opencascade::handle<TopOpeBRepDS_Interference> & CPI, const double Par);

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
		/****** TopOpeBRepDS_ListOfShapeOn1State::TopOpeBRepDS_ListOfShapeOn1State ******/
		/****** md5 signature: 3c910e3da46e5737762c0e1e3252741c ******/
		%feature("compactdefaultargs") TopOpeBRepDS_ListOfShapeOn1State;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepDS_ListOfShapeOn1State;
		 TopOpeBRepDS_ListOfShapeOn1State();

		/****** TopOpeBRepDS_ListOfShapeOn1State::ChangeListOnState ******/
		/****** md5 signature: 6fe75ea6d75884eac3157e92c141a851 ******/
		%feature("compactdefaultargs") ChangeListOnState;
		%feature("autodoc", "Return
-------
NCollection_List<TopoDS_Shape>

Description
-----------
No available documentation.
") ChangeListOnState;
		NCollection_List<TopoDS_Shape> ChangeListOnState();

		/****** TopOpeBRepDS_ListOfShapeOn1State::Clear ******/
		/****** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Clear;
		void Clear();

		/****** TopOpeBRepDS_ListOfShapeOn1State::IsSplit ******/
		/****** md5 signature: 034069e41e8a0d6e15e3b619c0316146 ******/
		%feature("compactdefaultargs") IsSplit;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsSplit;
		bool IsSplit();

		/****** TopOpeBRepDS_ListOfShapeOn1State::ListOnState ******/
		/****** md5 signature: 98fe40f45e68151f93b2bf1aef8fea20 ******/
		%feature("compactdefaultargs") ListOnState;
		%feature("autodoc", "Return
-------
NCollection_List<TopoDS_Shape>

Description
-----------
No available documentation.
") ListOnState;
		const NCollection_List<TopoDS_Shape> ListOnState();

		/****** TopOpeBRepDS_ListOfShapeOn1State::Split ******/
		/****** md5 signature: a70d1e309550b349f80e954a73798755 ******/
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "
Parameters
----------
B: bool (optional, default to true)

Return
-------
None

Description
-----------
No available documentation.
") Split;
		void Split(const bool B = true);

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
		/****** TopOpeBRepDS_Marker::TopOpeBRepDS_Marker ******/
		/****** md5 signature: 82599982c5bfd4d6e56e71ba94394b62 ******/
		%feature("compactdefaultargs") TopOpeBRepDS_Marker;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepDS_Marker;
		 TopOpeBRepDS_Marker();

		/****** TopOpeBRepDS_Marker::Allocate ******/
		/****** md5 signature: c1ec1a7a867fd131169a1c428c2ea3af ******/
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
		void Allocate(const int n);

		/****** TopOpeBRepDS_Marker::GetI ******/
		/****** md5 signature: c16a5f89801b9e92a6be0fc5f8dab2f7 ******/
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
		bool GetI(const int i);

		/****** TopOpeBRepDS_Marker::Reset ******/
		/****** md5 signature: 7beb446fe26b948f797f8de87e46c23d ******/
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Reset;
		void Reset();

		/****** TopOpeBRepDS_Marker::Set ******/
		/****** md5 signature: 10541fb7799a27bfdf50925596472725 ******/
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
		void Set(const int i, const bool b);

		/****** TopOpeBRepDS_Marker::Set ******/
		/****** md5 signature: 6072b551bafb0bbb21f38504febf71af ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
b: bool
n: int
a: void *

Return
-------
None

Description
-----------
No available documentation.
") Set;
		void Set(const bool b, const int n, void * const a);

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
		/****** TopOpeBRepDS_Point::TopOpeBRepDS_Point ******/
		/****** md5 signature: 83a29b568430e739ad8fe8ae52fcb158 ******/
		%feature("compactdefaultargs") TopOpeBRepDS_Point;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepDS_Point;
		 TopOpeBRepDS_Point();

		/****** TopOpeBRepDS_Point::TopOpeBRepDS_Point ******/
		/****** md5 signature: 5a4d74fcc32ac9de551d03c36d3a9d51 ******/
		%feature("compactdefaultargs") TopOpeBRepDS_Point;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
T: double

Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepDS_Point;
		 TopOpeBRepDS_Point(const gp_Pnt & P, const double T);

		/****** TopOpeBRepDS_Point::TopOpeBRepDS_Point ******/
		/****** md5 signature: 1e6cf5507d272bf5736e0d7a92f091d3 ******/
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

		/****** TopOpeBRepDS_Point::ChangeKeep ******/
		/****** md5 signature: 20e29780a2e40b1f09b5056bbe67f8ac ******/
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
		void ChangeKeep(const bool B);

		/****** TopOpeBRepDS_Point::ChangePoint ******/
		/****** md5 signature: 33f76a92948a53a65ecd0d3de11b040d ******/
		%feature("compactdefaultargs") ChangePoint;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
No available documentation.
") ChangePoint;
		gp_Pnt ChangePoint();

		/****** TopOpeBRepDS_Point::IsEqual ******/
		/****** md5 signature: c7ce79966e1d6318e075d6a0a60167f8 ******/
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
		bool IsEqual(const TopOpeBRepDS_Point & other);

		/****** TopOpeBRepDS_Point::Keep ******/
		/****** md5 signature: e8f73f4184955de8bddc5b09318bbab8 ******/
		%feature("compactdefaultargs") Keep;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") Keep;
		bool Keep();

		/****** TopOpeBRepDS_Point::Point ******/
		/****** md5 signature: 177e376cc11d1fedb2819bac56591ea8 ******/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
No available documentation.
") Point;
		const gp_Pnt Point();

		/****** TopOpeBRepDS_Point::Tolerance ******/
		/****** md5 signature: a95a606eeb289469358ac00a6b44ad86 ******/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") Tolerance;
		double Tolerance();

		/****** TopOpeBRepDS_Point::Tolerance ******/
		/****** md5 signature: c1c7212071b7d95bf782fac6a420fcbb ******/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "
Parameters
----------
Tol: double

Return
-------
None

Description
-----------
No available documentation.
") Tolerance;
		void Tolerance(const double Tol);

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
		/****** TopOpeBRepDS_PointExplorer::TopOpeBRepDS_PointExplorer ******/
		/****** md5 signature: dc00b242873f7bcf861cfdbca34501e9 ******/
		%feature("compactdefaultargs") TopOpeBRepDS_PointExplorer;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepDS_PointExplorer;
		 TopOpeBRepDS_PointExplorer();

		/****** TopOpeBRepDS_PointExplorer::TopOpeBRepDS_PointExplorer ******/
		/****** md5 signature: 485a23a8e13e960c1e15bc0c25b0e7b3 ******/
		%feature("compactdefaultargs") TopOpeBRepDS_PointExplorer;
		%feature("autodoc", "
Parameters
----------
DS: TopOpeBRepDS_DataStructure
FindOnlyKeep: bool (optional, default to true)

Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepDS_PointExplorer;
		 TopOpeBRepDS_PointExplorer(const TopOpeBRepDS_DataStructure & DS, const bool FindOnlyKeep = true);

		/****** TopOpeBRepDS_PointExplorer::Index ******/
		/****** md5 signature: 5f8486b8f8a28d56e63445ad924b19d8 ******/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Index;
		int Index();

		/****** TopOpeBRepDS_PointExplorer::Init ******/
		/****** md5 signature: 3df60a2c10c57d419d76e9d2d1ed5ff5 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
DS: TopOpeBRepDS_DataStructure
FindOnlyKeep: bool (optional, default to true)

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const TopOpeBRepDS_DataStructure & DS, const bool FindOnlyKeep = true);

		/****** TopOpeBRepDS_PointExplorer::IsPoint ******/
		/****** md5 signature: a8e4298808505ee7e05b733fce965439 ******/
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
		bool IsPoint(const int I);

		/****** TopOpeBRepDS_PointExplorer::IsPointKeep ******/
		/****** md5 signature: 19c1f4b0624c8e8810a7a8a5fd597249 ******/
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
		bool IsPointKeep(const int I);

		/****** TopOpeBRepDS_PointExplorer::More ******/
		/****** md5 signature: 922f3b0d43975d648336ba28bdfd0416 ******/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") More;
		bool More();

		/****** TopOpeBRepDS_PointExplorer::NbPoint ******/
		/****** md5 signature: 08b328faa2bc8d6b924aab91dccb9fae ******/
		%feature("compactdefaultargs") NbPoint;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbPoint;
		int NbPoint();

		/****** TopOpeBRepDS_PointExplorer::Next ******/
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

		/****** TopOpeBRepDS_PointExplorer::Point ******/
		/****** md5 signature: b78584a0e22a5b86a67814fa9f99e5f7 ******/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Return
-------
TopOpeBRepDS_Point

Description
-----------
No available documentation.
") Point;
		const TopOpeBRepDS_Point & Point();

		/****** TopOpeBRepDS_PointExplorer::Point ******/
		/****** md5 signature: 46867378e1165b64904da8b83e56d84c ******/
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
		const TopOpeBRepDS_Point & Point(const int I);

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
		/****** TopOpeBRepDS_Reducer::TopOpeBRepDS_Reducer ******/
		/****** md5 signature: 37b5bdea3959e23940c29f4e29e77235 ******/
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

		/****** TopOpeBRepDS_Reducer::ProcessEdgeInterferences ******/
		/****** md5 signature: fdb0a9346715ac3d5b07add0cbfe07d8 ******/
		%feature("compactdefaultargs") ProcessEdgeInterferences;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") ProcessEdgeInterferences;
		void ProcessEdgeInterferences();

		/****** TopOpeBRepDS_Reducer::ProcessFaceInterferences ******/
		/****** md5 signature: bca602f8ea802578396affd5ec299aa0 ******/
		%feature("compactdefaultargs") ProcessFaceInterferences;
		%feature("autodoc", "
Parameters
----------
M: NCollection_DataMap<TopoDS_Shape, TopOpeBRepDS_ListOfShapeOn1State, TopTools_ShapeMapHasher>

Return
-------
None

Description
-----------
No available documentation.
") ProcessFaceInterferences;
		void ProcessFaceInterferences(const NCollection_DataMap<TopoDS_Shape, TopOpeBRepDS_ListOfShapeOn1State, TopTools_ShapeMapHasher> & M);

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
		/****** TopOpeBRepDS_ShapeData::TopOpeBRepDS_ShapeData ******/
		/****** md5 signature: 57c5d4e33f2655d9681294dfd2eb97b5 ******/
		%feature("compactdefaultargs") TopOpeBRepDS_ShapeData;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepDS_ShapeData;
		 TopOpeBRepDS_ShapeData();

		/****** TopOpeBRepDS_ShapeData::ChangeInterferences ******/
		/****** md5 signature: 49be78cb30ff54b8097d34def094ca37 ******/
		%feature("compactdefaultargs") ChangeInterferences;
		%feature("autodoc", "Return
-------
NCollection_List<opencascade::handle<TopOpeBRepDS_Interference>>

Description
-----------
No available documentation.
") ChangeInterferences;
		NCollection_List<opencascade::handle<TopOpeBRepDS_Interference>> & ChangeInterferences();

		/****** TopOpeBRepDS_ShapeData::ChangeKeep ******/
		/****** md5 signature: 20e29780a2e40b1f09b5056bbe67f8ac ******/
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
		void ChangeKeep(const bool B);

		/****** TopOpeBRepDS_ShapeData::Interferences ******/
		/****** md5 signature: 1ad49ef4c8f0239686b904a9bb96ba95 ******/
		%feature("compactdefaultargs") Interferences;
		%feature("autodoc", "Return
-------
NCollection_List<opencascade::handle<TopOpeBRepDS_Interference>>

Description
-----------
No available documentation.
") Interferences;
		const NCollection_List<opencascade::handle<TopOpeBRepDS_Interference>> & Interferences();

		/****** TopOpeBRepDS_ShapeData::Keep ******/
		/****** md5 signature: e8f73f4184955de8bddc5b09318bbab8 ******/
		%feature("compactdefaultargs") Keep;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") Keep;
		bool Keep();

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
		/****** TopOpeBRepDS_ShapeWithState::TopOpeBRepDS_ShapeWithState ******/
		/****** md5 signature: 4381f6f6290e6f3ef044083d8c51c29a ******/
		%feature("compactdefaultargs") TopOpeBRepDS_ShapeWithState;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepDS_ShapeWithState;
		 TopOpeBRepDS_ShapeWithState();

		/****** TopOpeBRepDS_ShapeWithState::AddPart ******/
		/****** md5 signature: 3f89161790069044c8e7efde38c7a855 ******/
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

		/****** TopOpeBRepDS_ShapeWithState::AddParts ******/
		/****** md5 signature: 305d9574f8b82e88c2ef1e1dfde22efe ******/
		%feature("compactdefaultargs") AddParts;
		%feature("autodoc", "
Parameters
----------
aListOfShape: NCollection_List<TopoDS_Shape>
aState: TopAbs_State

Return
-------
None

Description
-----------
No available documentation.
") AddParts;
		void AddParts(const NCollection_List<TopoDS_Shape> & aListOfShape, const TopAbs_State aState);

		/****** TopOpeBRepDS_ShapeWithState::IsSplitted ******/
		/****** md5 signature: 35e659acda3cacff7c107eb14f898a56 ******/
		%feature("compactdefaultargs") IsSplitted;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsSplitted;
		bool IsSplitted();

		/****** TopOpeBRepDS_ShapeWithState::Part ******/
		/****** md5 signature: 53af8c662bc6c0dc895f85acee5a80e5 ******/
		%feature("compactdefaultargs") Part;
		%feature("autodoc", "
Parameters
----------
aState: TopAbs_State

Return
-------
NCollection_List<TopoDS_Shape>

Description
-----------
No available documentation.
") Part;
		const NCollection_List<TopoDS_Shape> Part(const TopAbs_State aState);

		/****** TopOpeBRepDS_ShapeWithState::SetIsSplitted ******/
		/****** md5 signature: dfce7ce978b094ab1b6343b467528103 ******/
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
		void SetIsSplitted(const bool anIsSplitted);

		/****** TopOpeBRepDS_ShapeWithState::SetState ******/
		/****** md5 signature: 8d4728ca94737d0ac8e24be948ef249b ******/
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

		/****** TopOpeBRepDS_ShapeWithState::State ******/
		/****** md5 signature: 927c83b1efdec797adb47eb058eddaa0 ******/
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
		/****** TopOpeBRepDS_Surface::TopOpeBRepDS_Surface ******/
		/****** md5 signature: 10b8fac68cd2dde99360bef80bdfef9c ******/
		%feature("compactdefaultargs") TopOpeBRepDS_Surface;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepDS_Surface;
		 TopOpeBRepDS_Surface();

		/****** TopOpeBRepDS_Surface::TopOpeBRepDS_Surface ******/
		/****** md5 signature: 56578aec5fbab9660ce9b65f858e598f ******/
		%feature("compactdefaultargs") TopOpeBRepDS_Surface;
		%feature("autodoc", "
Parameters
----------
P: Geom_Surface
T: double

Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepDS_Surface;
		 TopOpeBRepDS_Surface(const opencascade::handle<Geom_Surface> & P, const double T);

		/****** TopOpeBRepDS_Surface::TopOpeBRepDS_Surface ******/
		/****** md5 signature: 752d3f0d36c9488cd962ac08a53cdde3 ******/
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

		/****** TopOpeBRepDS_Surface::Assign ******/
		/****** md5 signature: 887e886360184f6c5ae1ac009665df5c ******/
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

		/****** TopOpeBRepDS_Surface::ChangeKeep ******/
		/****** md5 signature: 8e5d77eba3337af8e4dea57bb8e700b4 ******/
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
		void ChangeKeep(bool theToKeep);

		/****** TopOpeBRepDS_Surface::Keep ******/
		/****** md5 signature: d4d22280ca2cb6a7d996b820dd883dce ******/
		%feature("compactdefaultargs") Keep;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") Keep;
		bool Keep();

		/****** TopOpeBRepDS_Surface::Surface ******/
		/****** md5 signature: 3aa31a6d63da8a25f018cf96599c0928 ******/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom_Surface>

Description
-----------
No available documentation.
") Surface;
		const opencascade::handle<Geom_Surface> & Surface();

		/****** TopOpeBRepDS_Surface::Tolerance ******/
		/****** md5 signature: 0f371f25723fe3719d8c637d644b341d ******/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") Tolerance;
		double Tolerance();

		/****** TopOpeBRepDS_Surface::Tolerance ******/
		/****** md5 signature: a94e5889d3fd10e56c96832f50c5deda ******/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "
Parameters
----------
theTol: double

Return
-------
None

Description
-----------
Update the tolerance.
") Tolerance;
		void Tolerance(double theTol);

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
		/****** TopOpeBRepDS_SurfaceExplorer::TopOpeBRepDS_SurfaceExplorer ******/
		/****** md5 signature: 5e6ccfbf6133bd02c15d1742ebb7e8d8 ******/
		%feature("compactdefaultargs") TopOpeBRepDS_SurfaceExplorer;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepDS_SurfaceExplorer;
		 TopOpeBRepDS_SurfaceExplorer();

		/****** TopOpeBRepDS_SurfaceExplorer::TopOpeBRepDS_SurfaceExplorer ******/
		/****** md5 signature: eeb24ada158597413d0e8bb58bb513fd ******/
		%feature("compactdefaultargs") TopOpeBRepDS_SurfaceExplorer;
		%feature("autodoc", "
Parameters
----------
DS: TopOpeBRepDS_DataStructure
FindOnlyKeep: bool (optional, default to true)

Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepDS_SurfaceExplorer;
		 TopOpeBRepDS_SurfaceExplorer(const TopOpeBRepDS_DataStructure & DS, const bool FindOnlyKeep = true);

		/****** TopOpeBRepDS_SurfaceExplorer::Index ******/
		/****** md5 signature: 5f8486b8f8a28d56e63445ad924b19d8 ******/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Index;
		int Index();

		/****** TopOpeBRepDS_SurfaceExplorer::Init ******/
		/****** md5 signature: 3df60a2c10c57d419d76e9d2d1ed5ff5 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
DS: TopOpeBRepDS_DataStructure
FindOnlyKeep: bool (optional, default to true)

Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init(const TopOpeBRepDS_DataStructure & DS, const bool FindOnlyKeep = true);

		/****** TopOpeBRepDS_SurfaceExplorer::IsSurface ******/
		/****** md5 signature: 248042e714155b1ce4d230a1df777d99 ******/
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
		bool IsSurface(const int I);

		/****** TopOpeBRepDS_SurfaceExplorer::IsSurfaceKeep ******/
		/****** md5 signature: 1f08d4c04fb0ee55b05d8c21ef0b9364 ******/
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
		bool IsSurfaceKeep(const int I);

		/****** TopOpeBRepDS_SurfaceExplorer::More ******/
		/****** md5 signature: 922f3b0d43975d648336ba28bdfd0416 ******/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") More;
		bool More();

		/****** TopOpeBRepDS_SurfaceExplorer::NbSurface ******/
		/****** md5 signature: 4ea1b82a54d1a0900bd657e300ebf16e ******/
		%feature("compactdefaultargs") NbSurface;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbSurface;
		int NbSurface();

		/****** TopOpeBRepDS_SurfaceExplorer::Next ******/
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

		/****** TopOpeBRepDS_SurfaceExplorer::Surface ******/
		/****** md5 signature: f14ed172bc4994a2659e658ac71310ff ******/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "Return
-------
TopOpeBRepDS_Surface

Description
-----------
No available documentation.
") Surface;
		TopOpeBRepDS_Surface Surface();

		/****** TopOpeBRepDS_SurfaceExplorer::Surface ******/
		/****** md5 signature: 5439188fcb1b33bc27f0b1b898e5d6da ******/
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
		TopOpeBRepDS_Surface Surface(const int I);

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
		/****** TopOpeBRepDS_TKI::TopOpeBRepDS_TKI ******/
		/****** md5 signature: db43a70607261f43f669e070754d8a98 ******/
		%feature("compactdefaultargs") TopOpeBRepDS_TKI;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepDS_TKI;
		 TopOpeBRepDS_TKI();

		/****** TopOpeBRepDS_TKI::Add ******/
		/****** md5 signature: 45e34f930a7ead487f7280a8620fa020 ******/
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
		void Add(const TopOpeBRepDS_Kind K, const int G);

		/****** TopOpeBRepDS_TKI::Add ******/
		/****** md5 signature: d626688092d21c8303d1bc5343ef6f74 ******/
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
		void Add(const TopOpeBRepDS_Kind K, const int G, const opencascade::handle<TopOpeBRepDS_Interference> & HI);

		/****** TopOpeBRepDS_TKI::ChangeInterferences ******/
		/****** md5 signature: 0a27ddf8f185c2de76810a6d836e2096 ******/
		%feature("compactdefaultargs") ChangeInterferences;
		%feature("autodoc", "
Parameters
----------
K: TopOpeBRepDS_Kind
G: int

Return
-------
NCollection_List<opencascade::handle<TopOpeBRepDS_Interference>>

Description
-----------
No available documentation.
") ChangeInterferences;
		NCollection_List<opencascade::handle<TopOpeBRepDS_Interference>> & ChangeInterferences(const TopOpeBRepDS_Kind K, const int G);

		/****** TopOpeBRepDS_TKI::ChangeValue ******/
		/****** md5 signature: 5a31b1e81d645df9c0401f4ca30e86b3 ******/
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
		NCollection_List<opencascade::handle<TopOpeBRepDS_Interference>> & ChangeValue(TopOpeBRepDS_Kind &OutValue, Standard_Integer &OutValue);

		/****** TopOpeBRepDS_TKI::Clear ******/
		/****** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Clear;
		void Clear();

		/****** TopOpeBRepDS_TKI::DumpTKIIterator ******/
		/****** md5 signature: f8bb25e34cb8c428f8657fd68e1ef90e ******/
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

		/****** TopOpeBRepDS_TKI::FillOnGeometry ******/
		/****** md5 signature: fc1810d0efef883809870be225f4bc11 ******/
		%feature("compactdefaultargs") FillOnGeometry;
		%feature("autodoc", "
Parameters
----------
L: TopOpeBRepDS_Interference

Return
-------
None

Description
-----------
No available documentation.
") FillOnGeometry;
		void FillOnGeometry(const NCollection_List<opencascade::handle<TopOpeBRepDS_Interference> > & L);

		/****** TopOpeBRepDS_TKI::FillOnSupport ******/
		/****** md5 signature: 17d24901c3ad883688db907a78ff14fa ******/
		%feature("compactdefaultargs") FillOnSupport;
		%feature("autodoc", "
Parameters
----------
L: TopOpeBRepDS_Interference

Return
-------
None

Description
-----------
No available documentation.
") FillOnSupport;
		void FillOnSupport(const NCollection_List<opencascade::handle<TopOpeBRepDS_Interference> > & L);

		/****** TopOpeBRepDS_TKI::HasInterferences ******/
		/****** md5 signature: 0014880d6afe0e5da603c26be7366993 ******/
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
		bool HasInterferences(const TopOpeBRepDS_Kind K, const int G);

		/****** TopOpeBRepDS_TKI::Init ******/
		/****** md5 signature: 0de93ef32c53d091768788dca0e281fd ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Init;
		void Init();

		/****** TopOpeBRepDS_TKI::Interferences ******/
		/****** md5 signature: c66e0f11d47c027ac42447e89847ab7b ******/
		%feature("compactdefaultargs") Interferences;
		%feature("autodoc", "
Parameters
----------
K: TopOpeBRepDS_Kind
G: int

Return
-------
NCollection_List<opencascade::handle<TopOpeBRepDS_Interference>>

Description
-----------
No available documentation.
") Interferences;
		const NCollection_List<opencascade::handle<TopOpeBRepDS_Interference>> & Interferences(const TopOpeBRepDS_Kind K, const int G);

		/****** TopOpeBRepDS_TKI::IsBound ******/
		/****** md5 signature: 37a212e0ef14e354ab6107ae6b5bc64b ******/
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
		bool IsBound(const TopOpeBRepDS_Kind K, const int G);

		/****** TopOpeBRepDS_TKI::More ******/
		/****** md5 signature: 922f3b0d43975d648336ba28bdfd0416 ******/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") More;
		bool More();

		/****** TopOpeBRepDS_TKI::Next ******/
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

		/****** TopOpeBRepDS_TKI::Value ******/
		/****** md5 signature: 8046cf73f8f49114b619eae590dcb947 ******/
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
		const NCollection_List<opencascade::handle<TopOpeBRepDS_Interference>> & Value(TopOpeBRepDS_Kind &OutValue, Standard_Integer &OutValue);

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
		/****** TopOpeBRepDS_TOOL::EShareG ******/
		/****** md5 signature: 0c9ddca2142f441c44b1c01df6ca580d ******/
		%feature("compactdefaultargs") EShareG;
		%feature("autodoc", "
Parameters
----------
HDS: TopOpeBRepDS_HDataStructure
E: TopoDS_Edge
lEsd: NCollection_List<TopoDS_Shape>

Return
-------
int

Description
-----------
No available documentation.
") EShareG;
		static int EShareG(const opencascade::handle<TopOpeBRepDS_HDataStructure> & HDS, const TopoDS_Edge & E, NCollection_List<TopoDS_Shape> & lEsd);

		/****** TopOpeBRepDS_TOOL::GetConfig ******/
		/****** md5 signature: 2256aaa5f1b74494907402ff94eea52a ******/
		%feature("compactdefaultargs") GetConfig;
		%feature("autodoc", "
Parameters
----------
HDS: TopOpeBRepDS_HDataStructure
MEspON: NCollection_DataMap<TopoDS_Shape, TopOpeBRepDS_ListOfShapeOn1State, TopTools_ShapeMapHasher>
ie: int
iesd: int

Return
-------
conf: int

Description
-----------
No available documentation.
") GetConfig;
		static bool GetConfig(const opencascade::handle<TopOpeBRepDS_HDataStructure> & HDS, const NCollection_DataMap<TopoDS_Shape, TopOpeBRepDS_ListOfShapeOn1State, TopTools_ShapeMapHasher> & MEspON, const int ie, const int iesd, Standard_Integer &OutValue);

		/****** TopOpeBRepDS_TOOL::GetEsd ******/
		/****** md5 signature: 31ed97ebf5fa578bbdee871ba891a1d3 ******/
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
		static bool GetEsd(const opencascade::handle<TopOpeBRepDS_HDataStructure> & HDS, const TopoDS_Shape & S, const int ie, Standard_Integer &OutValue);

		/****** TopOpeBRepDS_TOOL::ShareG ******/
		/****** md5 signature: ee8a4acf6af0e2da33fe5c0c2128f0de ******/
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
		static bool ShareG(const opencascade::handle<TopOpeBRepDS_HDataStructure> & HDS, const int is1, const int is2);

		/****** TopOpeBRepDS_TOOL::ShareSplitON ******/
		/****** md5 signature: 5ba962b0373a55ebdfb82c4b464af02e ******/
		%feature("compactdefaultargs") ShareSplitON;
		%feature("autodoc", "
Parameters
----------
HDS: TopOpeBRepDS_HDataStructure
MspON: NCollection_DataMap<TopoDS_Shape, TopOpeBRepDS_ListOfShapeOn1State, TopTools_ShapeMapHasher>
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
		static bool ShareSplitON(const opencascade::handle<TopOpeBRepDS_HDataStructure> & HDS, const NCollection_DataMap<TopoDS_Shape, TopOpeBRepDS_ListOfShapeOn1State, TopTools_ShapeMapHasher> & MspON, const int i1, const int i2, TopoDS_Shape & spON);

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
		/****** TopOpeBRepDS_Transition::TopOpeBRepDS_Transition ******/
		/****** md5 signature: b0f031dc3541ef102b6397d2d7a1a516 ******/
		%feature("compactdefaultargs") TopOpeBRepDS_Transition;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepDS_Transition;
		 TopOpeBRepDS_Transition();

		/****** TopOpeBRepDS_Transition::TopOpeBRepDS_Transition ******/
		/****** md5 signature: f2d39af7aa0cba09bc14429f57dd8c18 ******/
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

		/****** TopOpeBRepDS_Transition::TopOpeBRepDS_Transition ******/
		/****** md5 signature: 249a16cc5bbcf2be99319e0964d91a6b ******/
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

		/****** TopOpeBRepDS_Transition::After ******/
		/****** md5 signature: a2c5df0ddcd2e8c33fa1f44aecdd13ee ******/
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

		/****** TopOpeBRepDS_Transition::After ******/
		/****** md5 signature: 0130d06cb83ecca0888806946b20635a ******/
		%feature("compactdefaultargs") After;
		%feature("autodoc", "Return
-------
TopAbs_State

Description
-----------
No available documentation.
") After;
		TopAbs_State After();

		/****** TopOpeBRepDS_Transition::Before ******/
		/****** md5 signature: bb0ee36e91deb1cb406862c3def1bf56 ******/
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

		/****** TopOpeBRepDS_Transition::Before ******/
		/****** md5 signature: f0e6b6334b2f08c45649ca23a4263f82 ******/
		%feature("compactdefaultargs") Before;
		%feature("autodoc", "Return
-------
TopAbs_State

Description
-----------
No available documentation.
") Before;
		TopAbs_State Before();

		/****** TopOpeBRepDS_Transition::Complement ******/
		/****** md5 signature: 2ad99db6589ec94469edd4ee0dd1a47d ******/
		%feature("compactdefaultargs") Complement;
		%feature("autodoc", "Return
-------
TopOpeBRepDS_Transition

Description
-----------
No available documentation.
") Complement;
		TopOpeBRepDS_Transition Complement();

		/****** TopOpeBRepDS_Transition::Index ******/
		/****** md5 signature: 65d23ba13e6a768a6e46646f77667dce ******/
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
		void Index(const int I);

		/****** TopOpeBRepDS_Transition::Index ******/
		/****** md5 signature: 5f8486b8f8a28d56e63445ad924b19d8 ******/
		%feature("compactdefaultargs") Index;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Index;
		int Index();

		/****** TopOpeBRepDS_Transition::IndexAfter ******/
		/****** md5 signature: 634c957dcc75076492db6fdd4494701b ******/
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
		void IndexAfter(const int I);

		/****** TopOpeBRepDS_Transition::IndexAfter ******/
		/****** md5 signature: c6fc643e31d94ad77bc78f1bd6527672 ******/
		%feature("compactdefaultargs") IndexAfter;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") IndexAfter;
		int IndexAfter();

		/****** TopOpeBRepDS_Transition::IndexBefore ******/
		/****** md5 signature: f09ec4d7461d8fd8b31aa758abe51720 ******/
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
		void IndexBefore(const int I);

		/****** TopOpeBRepDS_Transition::IndexBefore ******/
		/****** md5 signature: cc88c12be6d1e8b3429dc38ca53883e7 ******/
		%feature("compactdefaultargs") IndexBefore;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") IndexBefore;
		int IndexBefore();

		/****** TopOpeBRepDS_Transition::IsUnknown ******/
		/****** md5 signature: 8481ab064ec255119fd91471b1a62117 ******/
		%feature("compactdefaultargs") IsUnknown;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns True if both states are UNKNOWN.
") IsUnknown;
		bool IsUnknown();

		/****** TopOpeBRepDS_Transition::ONAfter ******/
		/****** md5 signature: 008dca4f114debbf73dba6e7dc3497a8 ******/
		%feature("compactdefaultargs") ONAfter;
		%feature("autodoc", "Return
-------
TopAbs_ShapeEnum

Description
-----------
No available documentation.
") ONAfter;
		TopAbs_ShapeEnum ONAfter();

		/****** TopOpeBRepDS_Transition::ONBefore ******/
		/****** md5 signature: 2b95fcd8529b8241abc8ac9e9340521b ******/
		%feature("compactdefaultargs") ONBefore;
		%feature("autodoc", "Return
-------
TopAbs_ShapeEnum

Description
-----------
No available documentation.
") ONBefore;
		TopAbs_ShapeEnum ONBefore();

		/****** TopOpeBRepDS_Transition::Orientation ******/
		/****** md5 signature: fac36aaf9a745b7e79b351c3e940eb85 ******/
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
returns the orientation corresponding to state <S> //! Before and After not equal TopAbs_ON: -------------------------------------- Before After Computed orientation //! S not S REVERSED (we leave state S) not S S FORWARD (we enter state S) S S INTERNAL (we stay in state S) not S not S EXTERNAL (we stay outside state S).
") Orientation;
		TopAbs_Orientation Orientation(const TopAbs_State S, const TopAbs_ShapeEnum T = TopAbs_FACE);

		/****** TopOpeBRepDS_Transition::Set ******/
		/****** md5 signature: 4928947a67feca2ba52483e250914cf5 ******/
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

		/****** TopOpeBRepDS_Transition::Set ******/
		/****** md5 signature: 565e36f717cf668f6a1dba95ac37ca78 ******/
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
set the transition corresponding to orientation <O> //! O Before After //! FORWARD OUT IN REVERSED IN OUT INTERNAL IN IN EXTERNAL OUT OUT.
") Set;
		void Set(const TopAbs_Orientation O);

		/****** TopOpeBRepDS_Transition::ShapeAfter ******/
		/****** md5 signature: 9bac723e506fae84bc6112fa9eb8af3d ******/
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

		/****** TopOpeBRepDS_Transition::ShapeAfter ******/
		/****** md5 signature: bb9fe4018e7529347a72f5cd01863779 ******/
		%feature("compactdefaultargs") ShapeAfter;
		%feature("autodoc", "Return
-------
TopAbs_ShapeEnum

Description
-----------
No available documentation.
") ShapeAfter;
		TopAbs_ShapeEnum ShapeAfter();

		/****** TopOpeBRepDS_Transition::ShapeBefore ******/
		/****** md5 signature: 593103fd0d882efa2c2ba16f9715c496 ******/
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

		/****** TopOpeBRepDS_Transition::ShapeBefore ******/
		/****** md5 signature: 9f9440c9eee019790015c78656c810f1 ******/
		%feature("compactdefaultargs") ShapeBefore;
		%feature("autodoc", "Return
-------
TopAbs_ShapeEnum

Description
-----------
No available documentation.
") ShapeBefore;
		TopAbs_ShapeEnum ShapeBefore();

		/****** TopOpeBRepDS_Transition::StateAfter ******/
		/****** md5 signature: d482f8b89008d7e48bba2a0091db7e0e ******/
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

		/****** TopOpeBRepDS_Transition::StateBefore ******/
		/****** md5 signature: 3604f53f49079234a85dde72a3aad0f9 ******/
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
		/****** TopOpeBRepDS_CurveData::TopOpeBRepDS_CurveData ******/
		/****** md5 signature: ab1de503a7276c3af41cd46b60ec2718 ******/
		%feature("compactdefaultargs") TopOpeBRepDS_CurveData;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepDS_CurveData;
		 TopOpeBRepDS_CurveData();

		/****** TopOpeBRepDS_CurveData::TopOpeBRepDS_CurveData ******/
		/****** md5 signature: cf41ff245973298d204dfbd9436d4f2d ******/
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
		/****** TopOpeBRepDS_CurveIterator::TopOpeBRepDS_CurveIterator ******/
		/****** md5 signature: 7004de98cb07a8b02a61dc81c0854242 ******/
		%feature("compactdefaultargs") TopOpeBRepDS_CurveIterator;
		%feature("autodoc", "
Parameters
----------
L: TopOpeBRepDS_Interference

Return
-------
None

Description
-----------
Creates an iterator on the curves on surface described by the interferences in <L>.
") TopOpeBRepDS_CurveIterator;
		 TopOpeBRepDS_CurveIterator(const NCollection_List<opencascade::handle<TopOpeBRepDS_Interference> > & L);

		/****** TopOpeBRepDS_CurveIterator::Current ******/
		/****** md5 signature: 73ef1fe36b6963fbfe98d7bfba19998d ******/
		%feature("compactdefaultargs") Current;
		%feature("autodoc", "Return
-------
int

Description
-----------
Index of the curve in the data structure.
") Current;
		int Current();

		/****** TopOpeBRepDS_CurveIterator::MatchInterference ******/
		/****** md5 signature: 00ec1fef3d0973d6c01f61b66b25e0e4 ******/
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
Returns True if the Interference <I> has a GeometryType() TopOpeBRepDS_CURVE returns False else.
") MatchInterference;
		bool MatchInterference(const opencascade::handle<TopOpeBRepDS_Interference> & I);

		/****** TopOpeBRepDS_CurveIterator::Orientation ******/
		/****** md5 signature: 2b25381a7db220c2390cfe75dd2cf1f5 ******/
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

		/****** TopOpeBRepDS_CurveIterator::PCurve ******/
		/****** md5 signature: 8293ea8e22edce20d70506232b818ed1 ******/
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
		/****** TopOpeBRepDS_CurvePointInterference::TopOpeBRepDS_CurvePointInterference ******/
		/****** md5 signature: ed0dfec5a04609135591cc09b11e9edc ******/
		%feature("compactdefaultargs") TopOpeBRepDS_CurvePointInterference;
		%feature("autodoc", "
Parameters
----------
T: TopOpeBRepDS_Transition
ST: TopOpeBRepDS_Kind
S: int
GT: TopOpeBRepDS_Kind
G: int
P: double

Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepDS_CurvePointInterference;
		 TopOpeBRepDS_CurvePointInterference(const TopOpeBRepDS_Transition & T, const TopOpeBRepDS_Kind ST, const int S, const TopOpeBRepDS_Kind GT, const int G, const double P);

		/****** TopOpeBRepDS_CurvePointInterference::Parameter ******/
		/****** md5 signature: 28e42519a120bf741c23eca7aaca5525 ******/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") Parameter;
		double Parameter();

		/****** TopOpeBRepDS_CurvePointInterference::Parameter ******/
		/****** md5 signature: bd5fcf434c6f44bcf7a174a8658fcc12 ******/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "
Parameters
----------
P: double

Return
-------
None

Description
-----------
No available documentation.
") Parameter;
		void Parameter(const double P);

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
		/****** TopOpeBRepDS_PointData::TopOpeBRepDS_PointData ******/
		/****** md5 signature: 427116425f2fb5005b5abf389c6f1fb3 ******/
		%feature("compactdefaultargs") TopOpeBRepDS_PointData;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepDS_PointData;
		 TopOpeBRepDS_PointData();

		/****** TopOpeBRepDS_PointData::TopOpeBRepDS_PointData ******/
		/****** md5 signature: 101135fde8c14adfac00bc7a7fbc030f ******/
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

		/****** TopOpeBRepDS_PointData::TopOpeBRepDS_PointData ******/
		/****** md5 signature: bf7c93f115028473a3411a387a956f02 ******/
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
		 TopOpeBRepDS_PointData(const TopOpeBRepDS_Point & P, const int I1, const int I2);

		/****** TopOpeBRepDS_PointData::GetShapes ******/
		/****** md5 signature: 7da85763394079bbe652314257aef4a1 ******/
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

		/****** TopOpeBRepDS_PointData::SetShapes ******/
		/****** md5 signature: 3583cd306df8bdd2a3b14b07580e8f9c ******/
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
		void SetShapes(const int I1, const int I2);

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
		/****** TopOpeBRepDS_PointIterator::TopOpeBRepDS_PointIterator ******/
		/****** md5 signature: 5b7b3ccd36dca9d37dd6e0490da2882d ******/
		%feature("compactdefaultargs") TopOpeBRepDS_PointIterator;
		%feature("autodoc", "
Parameters
----------
L: TopOpeBRepDS_Interference

Return
-------
None

Description
-----------
Creates an iterator on the points on curves described by the interferences in <L>.
") TopOpeBRepDS_PointIterator;
		 TopOpeBRepDS_PointIterator(const NCollection_List<opencascade::handle<TopOpeBRepDS_Interference> > & L);

		/****** TopOpeBRepDS_PointIterator::Current ******/
		/****** md5 signature: 73ef1fe36b6963fbfe98d7bfba19998d ******/
		%feature("compactdefaultargs") Current;
		%feature("autodoc", "Return
-------
int

Description
-----------
Index of the point in the data structure.
") Current;
		int Current();

		/****** TopOpeBRepDS_PointIterator::DiffOriented ******/
		/****** md5 signature: cc757d5e81463a884166ddb251f90feb ******/
		%feature("compactdefaultargs") DiffOriented;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") DiffOriented;
		bool DiffOriented();

		/****** TopOpeBRepDS_PointIterator::IsPoint ******/
		/****** md5 signature: 8f17b3b8ce1adb1310aaa00c620be9cf ******/
		%feature("compactdefaultargs") IsPoint;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsPoint;
		bool IsPoint();

		/****** TopOpeBRepDS_PointIterator::IsVertex ******/
		/****** md5 signature: a2ec0345ec4add7e1d182223d626cf2f ******/
		%feature("compactdefaultargs") IsVertex;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsVertex;
		bool IsVertex();

		/****** TopOpeBRepDS_PointIterator::MatchInterference ******/
		/****** md5 signature: 00ec1fef3d0973d6c01f61b66b25e0e4 ******/
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
Returns True if the Interference <I> has a GeometryType() TopOpeBRepDS_POINT or TopOpeBRepDS_VERTEX returns False else.
") MatchInterference;
		bool MatchInterference(const opencascade::handle<TopOpeBRepDS_Interference> & I);

		/****** TopOpeBRepDS_PointIterator::Orientation ******/
		/****** md5 signature: 2b25381a7db220c2390cfe75dd2cf1f5 ******/
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

		/****** TopOpeBRepDS_PointIterator::Parameter ******/
		/****** md5 signature: 28e42519a120bf741c23eca7aaca5525 ******/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") Parameter;
		double Parameter();

		/****** TopOpeBRepDS_PointIterator::SameOriented ******/
		/****** md5 signature: bfa8f0791537871a8dfc49dce63878cb ******/
		%feature("compactdefaultargs") SameOriented;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") SameOriented;
		bool SameOriented();

		/****** TopOpeBRepDS_PointIterator::Support ******/
		/****** md5 signature: 9090c4e5db2e5c0baea34ea7471993cf ******/
		%feature("compactdefaultargs") Support;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Support;
		int Support();

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
		/****** TopOpeBRepDS_ShapeShapeInterference::TopOpeBRepDS_ShapeShapeInterference ******/
		/****** md5 signature: 029f6293560093be2101850f7c140d7e ******/
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
a shape interferes on shape <G> with shape <S>. examples: create a ShapeShapeInterference describing: vertex V of edge E1 found on edge E2: ST,S,GT,G = TopOpeBRepDS_EDGE,E2,TopOpeBRepDS_VERTEX,V //! create a ShapeShapeInterference describing vertex V of edge E found on face F: ST,S,GT,G = TopOpeBRepDS_FACE,F,TopOpeBRepDS_VERTEX,V //! <GBound> indicates if shape <G> is a bound of shape <S>. //! <SCC>: UNSH_GEOMETRY: <S> and <Ancestor> have any types, <S> and <Ancestor> don't share the same geometry SAME_ORIENTED: <S> and <Ancestor> have identical types, <S> and <Ancestor> orientations are IDENTICAL. DIFF_ORIENTED: <S> and <Ancestor> have identical types, <S> and <Ancestor> orientations are DIFFERENT.
") TopOpeBRepDS_ShapeShapeInterference;
		 TopOpeBRepDS_ShapeShapeInterference(const TopOpeBRepDS_Transition & T, const TopOpeBRepDS_Kind ST, const int S, const TopOpeBRepDS_Kind GT, const int G, const bool GBound, const TopOpeBRepDS_Config C);

		/****** TopOpeBRepDS_ShapeShapeInterference::Config ******/
		/****** md5 signature: a2e2863b46aaef1bb776ec36ce222134 ******/
		%feature("compactdefaultargs") Config;
		%feature("autodoc", "Return
-------
TopOpeBRepDS_Config

Description
-----------
No available documentation.
") Config;
		TopOpeBRepDS_Config Config();

		/****** TopOpeBRepDS_ShapeShapeInterference::GBound ******/
		/****** md5 signature: bed8fc022d0bf5a5bdf3a0980b8b1ecd ******/
		%feature("compactdefaultargs") GBound;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") GBound;
		bool GBound();

		/****** TopOpeBRepDS_ShapeShapeInterference::SetGBound ******/
		/****** md5 signature: 675527e1cb02054d987cd7b59da8442c ******/
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
		void SetGBound(const bool b);

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
		/****** TopOpeBRepDS_SolidSurfaceInterference::TopOpeBRepDS_SolidSurfaceInterference ******/
		/****** md5 signature: 839ab0ae430f7db63f5ccf87279cbcec ******/
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
		 TopOpeBRepDS_SolidSurfaceInterference(const TopOpeBRepDS_Transition & Transition, const TopOpeBRepDS_Kind SupportType, const int Support, const TopOpeBRepDS_Kind GeometryType, const int Geometry);

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
		/****** TopOpeBRepDS_SurfaceCurveInterference::TopOpeBRepDS_SurfaceCurveInterference ******/
		/****** md5 signature: 55e9702d67f9198d4c87db9152ddfb7a ******/
		%feature("compactdefaultargs") TopOpeBRepDS_SurfaceCurveInterference;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepDS_SurfaceCurveInterference;
		 TopOpeBRepDS_SurfaceCurveInterference();

		/****** TopOpeBRepDS_SurfaceCurveInterference::TopOpeBRepDS_SurfaceCurveInterference ******/
		/****** md5 signature: 6035df25b7b766095dc3cd905211f05d ******/
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
		 TopOpeBRepDS_SurfaceCurveInterference(const TopOpeBRepDS_Transition & Transition, const TopOpeBRepDS_Kind SupportType, const int Support, const TopOpeBRepDS_Kind GeometryType, const int Geometry, const opencascade::handle<Geom2d_Curve> & PC);

		/****** TopOpeBRepDS_SurfaceCurveInterference::TopOpeBRepDS_SurfaceCurveInterference ******/
		/****** md5 signature: 527fae42a771e52602c040083be3b2e2 ******/
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

		/****** TopOpeBRepDS_SurfaceCurveInterference::PCurve ******/
		/****** md5 signature: 8293ea8e22edce20d70506232b818ed1 ******/
		%feature("compactdefaultargs") PCurve;
		%feature("autodoc", "Return
-------
opencascade::handle<Geom2d_Curve>

Description
-----------
No available documentation.
") PCurve;
		const opencascade::handle<Geom2d_Curve> & PCurve();

		/****** TopOpeBRepDS_SurfaceCurveInterference::PCurve ******/
		/****** md5 signature: 2a9e7b35cdc30e1b3fe1aa52cdef828a ******/
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
		/****** TopOpeBRepDS_SurfaceData::TopOpeBRepDS_SurfaceData ******/
		/****** md5 signature: a69a6481affab57d7137c19f989d9b4e ******/
		%feature("compactdefaultargs") TopOpeBRepDS_SurfaceData;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") TopOpeBRepDS_SurfaceData;
		 TopOpeBRepDS_SurfaceData();

		/****** TopOpeBRepDS_SurfaceData::TopOpeBRepDS_SurfaceData ******/
		/****** md5 signature: 0f87db337a7f4a4afd8227cbded7271a ******/
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
		/****** TopOpeBRepDS_SurfaceIterator::TopOpeBRepDS_SurfaceIterator ******/
		/****** md5 signature: fb47674dcc0b889c427e74a4d244fa96 ******/
		%feature("compactdefaultargs") TopOpeBRepDS_SurfaceIterator;
		%feature("autodoc", "
Parameters
----------
L: TopOpeBRepDS_Interference

Return
-------
None

Description
-----------
Creates an iterator on the Surfaces on solid described by the interferences in <L>.
") TopOpeBRepDS_SurfaceIterator;
		 TopOpeBRepDS_SurfaceIterator(const NCollection_List<opencascade::handle<TopOpeBRepDS_Interference> > & L);

		/****** TopOpeBRepDS_SurfaceIterator::Current ******/
		/****** md5 signature: 73ef1fe36b6963fbfe98d7bfba19998d ******/
		%feature("compactdefaultargs") Current;
		%feature("autodoc", "Return
-------
int

Description
-----------
Index of the surface in the data structure.
") Current;
		int Current();

		/****** TopOpeBRepDS_SurfaceIterator::Orientation ******/
		/****** md5 signature: 2b25381a7db220c2390cfe75dd2cf1f5 ******/
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
		/****** TopOpeBRepDS_EdgeVertexInterference::TopOpeBRepDS_EdgeVertexInterference ******/
		/****** md5 signature: 44ec77ab2594ecfb06f41ccaf5bcf275 ******/
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
P: double

Return
-------
None

Description
-----------
Create an interference of VERTEX <G> on a crossed EDGE E. //! if support type <ST> == EDGE: <S> is edge E FACE: <S> is the face with bound E. <T> is the transition along the edge, crossing the crossed edge. E is the crossed edge. <GIsBound> indicates if <G> is a bound of the edge. <P> is the parameter of <G> on the edge. //! interference is stored in the list of interfs of the edge.
") TopOpeBRepDS_EdgeVertexInterference;
		 TopOpeBRepDS_EdgeVertexInterference(const TopOpeBRepDS_Transition & T, const TopOpeBRepDS_Kind ST, const int S, const int G, const bool GIsBound, const TopOpeBRepDS_Config C, const double P);

		/****** TopOpeBRepDS_EdgeVertexInterference::TopOpeBRepDS_EdgeVertexInterference ******/
		/****** md5 signature: 1f31b9df83dd0e4c7c8cae8227247eea ******/
		%feature("compactdefaultargs") TopOpeBRepDS_EdgeVertexInterference;
		%feature("autodoc", "
Parameters
----------
T: TopOpeBRepDS_Transition
S: int
G: int
GIsBound: bool
C: TopOpeBRepDS_Config
P: double

Return
-------
None

Description
-----------
Create an interference of VERTEX <G> on crossed EDGE <S>. //! <T> is the transition along the edge, crossing the crossed edge. <S> is the crossed edge. <GIsBound> indicates if <G> is a bound of the edge. <C> indicates the geometric configuration between the edge and the crossed edge. <P> is the parameter of <G> on the edge. //! interference is stored in the list of interfs of the edge.
") TopOpeBRepDS_EdgeVertexInterference;
		 TopOpeBRepDS_EdgeVertexInterference(const TopOpeBRepDS_Transition & T, const int S, const int G, const bool GIsBound, const TopOpeBRepDS_Config C, const double P);

		/****** TopOpeBRepDS_EdgeVertexInterference::Parameter ******/
		/****** md5 signature: 28e42519a120bf741c23eca7aaca5525 ******/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") Parameter;
		double Parameter();

		/****** TopOpeBRepDS_EdgeVertexInterference::Parameter ******/
		/****** md5 signature: bd5fcf434c6f44bcf7a174a8658fcc12 ******/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "
Parameters
----------
P: double

Return
-------
None

Description
-----------
No available documentation.
") Parameter;
		void Parameter(const double P);

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
		/****** TopOpeBRepDS_FaceEdgeInterference::TopOpeBRepDS_FaceEdgeInterference ******/
		/****** md5 signature: 97641e2cc15eb4051ed0901eda0f0dc8 ******/
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
Create an interference of EDGE <G> on FACE <S>.
") TopOpeBRepDS_FaceEdgeInterference;
		 TopOpeBRepDS_FaceEdgeInterference(const TopOpeBRepDS_Transition & T, const int S, const int G, const bool GIsBound, const TopOpeBRepDS_Config C);

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

class TopOpeBRepDS_HArray1OfDataMapOfIntegerListOfInterference : public NCollection_Array1<TopOpeBRepDS_DataMapOfIntegerListOfInterference>, public Standard_Transient {
  public:
    TopOpeBRepDS_HArray1OfDataMapOfIntegerListOfInterference(const Standard_Integer theLower, const Standard_Integer theUpper);
    TopOpeBRepDS_HArray1OfDataMapOfIntegerListOfInterference(const Standard_Integer theLower, const Standard_Integer theUpper, const NCollection_Array1<TopOpeBRepDS_DataMapOfIntegerListOfInterference>::value_type& theValue);
    TopOpeBRepDS_HArray1OfDataMapOfIntegerListOfInterference(const NCollection_Array1<TopOpeBRepDS_DataMapOfIntegerListOfInterference>& theOther);
    const NCollection_Array1<TopOpeBRepDS_DataMapOfIntegerListOfInterference>& Array1();
    NCollection_Array1<TopOpeBRepDS_DataMapOfIntegerListOfInterference>& ChangeArray1();
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
